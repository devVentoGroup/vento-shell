### MINI-BLOQUE — CONTRATOS COMPARTIDOS

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **contratos compartidos** dentro de **H FUNDACION COMPARTIDA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `SHELL-CON-001` a `SHELL-CON-016` — 16 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Crear @vento/contracts” y concluye con “Crear contrato de propiedad funcional”.
<!-- PLAN-SECTION-META:END -->

<!-- EXECUTION-GATE-RECONCILIATION:B001-200:SHELL-CON-001-016 -->
### Reconciliación topológica de SHELL-CON-001 a SHELL-CON-016

Esta regla se incorpora al contrato de cada marcador `SHELL-CON-001..016`.

| Propiedad        | Valor                                                                |
| ---------------- | -------------------------------------------------------------------- |
| modalidad física | `GLOBAL_ENABLE_ONCE`                                                 |
| gate temporal    | `PRE_E5_FOUNDATION`                                                  |
| identidad        | `<task_id>::GLOBAL`                                                  |
| autorización     | explícita por instancia; nunca inferida desde el marcador documental |

Estas tareas pueden materializar los contratos estáticos compartidos una sola vez antes de E5 cuando se satisfagan sus dependencias técnicas y exista autorización física explícita.

Esta reconciliación prevalece exclusivamente sobre cualquier cláusula histórica de `SHELL-CON-001..016` que obligue a esperar `E5-GATE-008::<package_id>` o `SHELL-CI-020::<package_id>` para la **materialización inicial de la fundación estática compartida**.

No adelanta publicación en registry, migración o adopción de consumidores, despliegues verticales, cambios Supabase, red, secretos ni lógica runtime. Esos trabajos conservan sus propietarios y gates específicos.

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

| Hallazgo                                                                                                                 | Estado                            | Destino                                                                                                                                                   |
| ------------------------------------------------------------------------------------------------------------------------ | --------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `@vento/contracts` no existe físicamente                                                                                 | esperado en el estado actual      | materialización únicamente dentro del ciclo físico autorizado por `E5-GATE-008::<package_id>` y `SHELL-CI-020`                                            |
| `@vento/contracts/authorization` ya posee contrato normativo                                                             | aprobado                          | conservar en `AUTH-CAT-017` y `AUTH-CAT-018`; materialización física en `SHELL-CI-020` después de `E5-GATE-008`; publicación versionada en `SHELL-CI-003` |
| códigos de aplicaciones todavía divergen entre consumidores                                                              | pendiente de la secuencia vigente | `SHELL-CON-002`                                                                                                                                           |
| códigos de permisos requieren fuente única y tipos derivados                                                             | pendiente de la secuencia vigente | `SHELL-CON-003`; `AUTH-CAT-018`; `AUTH-CAT-019`                                                                                                           |
| roles y scopes permanecen separados por responsabilidad                                                                  | pendiente de la secuencia vigente | `SHELL-CON-004` a `SHELL-CON-006`                                                                                                                         |
| contexto, errores, procesos, pantallas, acciones, eventos, traspasos, pendientes y ownership requieren contratos propios | pendiente de la secuencia vigente | `SHELL-CON-007` a `SHELL-CON-016`                                                                                                                         |
| `@vento/os-context` existe como implementación parcial transitoria                                                       | conservado, no sustituto          | `SHELL-AUTH-001`; `SHELL-CTX-001`                                                                                                                         |
| outputs derivados de Supabase requieren generación propietaria                                                           | pendiente de implementación       | `SHELL-DB-002`; `SHELL-DB-003`                                                                                                                            |

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

- **ÚLTIMA TAREA APROBADA:** SHELL-PKG-008 — Evitar actualizaciones automáticas sin pruebas
- **TAREA ACTUAL APROBADA:** SHELL-CON-001 — Crear @vento/contracts
- **SIGUIENTE TAREA RESERVADA:** SHELL-CON-002 — Centralizar códigos de aplicaciones

---

#### 20. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-PKG-008 — Evitar actualizaciones automáticas sin pruebas`

**TAREA ACTUAL APROBADA**
`SHELL-CON-001 — Crear @vento/contracts`

**SIGUIENTE TAREA RESERVADA**
`SHELL-CON-002 — Centralizar códigos de aplicaciones`


### ✅ SHELL-CON-002 — Centralizar códigos de aplicaciones

**Estado:** APROBADA
**Tarea anterior:** SHELL-CON-001 — Crear @vento/contracts
**Tarea siguiente:** SHELL-CON-003 — Centralizar códigos de permisos
**Tipo de tarea:** Documental
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Estado físico resultante:** `CONTRATO_DE_APLICACIONES_DEFINIDO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-CON-002` centraliza la identidad técnica de las aplicaciones de Vento OS sobre el catálogo ya aprobado por `AUTH-CAT-001`, sin crear un segundo catálogo ni reinterpretar aplicaciones desde repositorios, rutas, plataformas, dominios, entornos o listas locales.

La decisión vinculante es:

```text
CATÁLOGO CANÓNICO VERSIONADO
→ applications.json
→ AppCode y metadata derivada
→ consumidores

CONSUMIDORES
→ pueden proyectar presentación, navegación y disponibilidad
→ no pueden redefinir app_code
```

La tarea materializa las diez identidades de aplicación, su metadata contractual mínima, sus reglas de estabilidad y las fronteras de compatibilidad necesarias para retirar progresivamente cadenas locales divergentes. No crea todavía archivos físicos dentro de `packages/contracts`, no modifica consumidores y no cambia Supabase.

---

#### 2. Resultado canónico

Queda establecido un único conjunto canónico de códigos de aplicación:

```text
shell
anima
viso
nexo
fogo
origo
pulso
numera
aura
pass
```

**Conciliación:** 10 aplicaciones esperadas, 10 materializadas, 10 códigos únicos, 0 faltantes, 0 duplicados y 0 códigos nuevos.

El conjunto anterior es cerrado para el corte contractual vigente. Una cadena que cumpla la forma sintáctica de un código no adquiere identidad de aplicación por ese hecho: deberá existir en una versión aprobada del catálogo.

---

#### 3. Fuentes y precedencia

La tarea conserva, sin reabrirlas, las siguientes decisiones aprobadas:

| Fuente                                                                | Uso vinculante                                                                                    |
| --------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`                          | continuidad, fase documental, trazabilidad y requisitos de prueba                                 |
| `docs/plan-canonico/modular/delivery-contract.json`                   | estructura del artefacto documental                                                               |
| `docs/plan-canonico/modular/active-sequence.json`                     | continuidad vigente hacia `SHELL-CON-002`                                                         |
| `SHELL-CON-001 — Crear @vento/contracts`                              | raíz contractual única y fronteras de package                                                     |
| `AUTH-CAT-001 — Normalizar el catálogo y los códigos de aplicaciones` | diez identidades, convención, clasificación, dominio, roadmap y ciclo de vida                     |
| `AUTH-CAT-002 — Definir convención app.modulo.recurso.accion`         | uso de `app_code` como prefijo de permisos                                                        |
| `AUTH-CAT-017 — Crear catálogo versionado en vento-shell`             | `applications.json`, campos mínimos y fuente técnica objetivo                                     |
| `AUTH-CAT-018 — Crear tipos TypeScript derivados del catálogo`        | `AppCode` y tipos de aplicación generados, no mantenidos manualmente                              |
| `SHELL-AUD-009` y `SHELL-AUD-010`                                     | divergencia de tipos/listas locales y disposición `GENERAR` para códigos y metadata de aplicación |
| Registro Canónico de Requisitos de Prueba                             | cobertura vigente para catálogo único, navegación, destinos y consumidores                        |
| código actual de SHELL y consumidores inspeccionados                  | evidencia de listas, unions y strings locales todavía presentes                                   |

Precedencia:

```text
AUTH-CAT-001
→ AUTH-CAT-017 / AUTH-CAT-018
→ SHELL-CON-001
→ SHELL-CON-002
→ implementación física autorizada
→ migración de consumidores
```

Una lista local existente no puede prevalecer sobre el catálogo aprobado aunque actualmente sea utilizada por un runtime.

---

#### 4. Línea base verificable

El estado técnico actual confirma que la centralización todavía no está materializada físicamente:

| Evidencia                                                  | Estado observado                                                                      | Consecuencia contractual                                               |
| ---------------------------------------------------------- | ------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| `packages/contracts` en `vento-shell`                      | no materializado                                                                      | no existe todavía package consumible de `@vento/contracts`             |
| `vento-shell/src/app/page.tsx`                             | mantiene `INTERNAL_APPS` local con cinco aplicaciones y `AppLink.id: string`          | lista local transitoria; no es fuente canónica                         |
| `vento-viso/src/components/vento/standard/vento-shell.tsx` | mantiene unión local `APP_ENTITY`, `APP_CODE` y `APP_SWITCHER_ITEMS`                  | identidad local debe converger al catálogo generado                    |
| `vento-viso`                                               | la unión local admite `default` y no representa todo el catálogo de diez aplicaciones | `default` no puede ingresar a `AppCode`                                |
| AppSwitcher inspeccionado                                  | utiliza `id: string` y una identidad visual `hub`                                     | `hub` no puede ingresar a `AppCode`; la aplicación canónica es `shell` |
| tipos de dispositivo inspeccionados                        | `default_app_code` y `allowed_app_codes` permanecen como strings                      | deberán validarse contra el conjunto canónico durante implementación   |
| búsqueda de `@vento/contracts` en consumidores web         | sin consumo runtime confirmado en el corte                                            | adopción física aún pendiente                                          |

Estas diferencias son evidencia del problema que esta tarea resuelve documentalmente. No autorizan editar ahora los consumidores.

---

#### 5. Matriz canónica completa de aplicaciones

Los valores siguientes se materializan a partir del catálogo aprobado. `permission_namespace` coincide exactamente con `app_code`, porque el código de aplicación es el prefijo contractual de los permisos. Todas las diez identidades forman parte del catálogo de autorización y permanecen `active` en este corte.

| Orden | `app_code` | `display_name` | `app_kind`       | `domain`  | `roadmap_scope` | `lifecycle_status` | `permission_namespace` | `is_authorization_catalog_member` | Repositorio confirmado                                    |
| ----: | ---------- | -------------- | ---------------- | --------- | --------------- | ------------------ | ---------------------- | --------------------------------- | --------------------------------------------------------- |
|     1 | `shell`    | Vento OS       | `hub`            | `laboral` | `core`          | `active`           | `shell`                | `true`                            | `devVentoGroup/vento-shell`                               |
|     2 | `anima`    | ANIMA          | `hybrid`         | `laboral` | `core`          | `active`           | `anima`                | `true`                            | `devVentoGroup/vento-anima`                               |
|     3 | `viso`     | VISO           | `administrative` | `laboral` | `core`          | `active`           | `viso`                 | `true`                            | `devVentoGroup/vento-viso`                                |
|     4 | `nexo`     | NEXO           | `hybrid`         | `laboral` | `core`          | `active`           | `nexo`                 | `true`                            | `devVentoGroup/vento-nexo`                                |
|     5 | `fogo`     | FOGO           | `operational`    | `laboral` | `core`          | `active`           | `fogo`                 | `true`                            | `devVentoGroup/vento-fogo`                                |
|     6 | `origo`    | ORIGO          | `hybrid`         | `laboral` | `core`          | `active`           | `origo`                | `true`                            | `devVentoGroup/vento-origo`                               |
|     7 | `pulso`    | PULSO          | `operational`    | `laboral` | `core`          | `active`           | `pulso`                | `true`                            | `devVentoGroup/vento-pulso`                               |
|     8 | `numera`   | NUMERA         | `hybrid`         | `laboral` | `core`          | `active`           | `numera`               | `true`                            | `devVentoGroup/vento-numera`                              |
|     9 | `aura`     | AURA           | `administrative` | `laboral` | `deferred`      | `active`           | `aura`                 | `true`                            | `NO_CONFIRMADO`; resolución propietaria en `AURA-AUD-010` |
|    10 | `pass`     | Vento Pass     | `customer`       | `cliente` | `adjacent`      | `active`           | `pass`                 | `true`                            | `devVentoGroup/vento-pass`                                |

**Conciliación de dominio:** 9 aplicaciones laborales + 1 aplicación cliente = 10.

**Conciliación de roadmap:** 8 `core` + 1 `deferred` + 1 `adjacent` = 10.

**Conciliación de tipo:** 1 `hub` + 2 `administrative` + 2 `operational` + 4 `hybrid` + 1 `customer` = 10.

**Conciliación de ciclo de vida:** 10 `active`, 0 `deprecated`, 0 `retired`, 0 `reserved`.

La ausencia de repositorio confirmado para AURA no altera la identidad `aura`, su estado de catálogo ni su clasificación contractual.

---

#### 6. Fuente técnica única

`SHELL-CON-002` no crea un catálogo paralelo de aplicaciones. La fuente técnica objetivo permanece dentro del catálogo versionado ya definido en `@vento/contracts/authorization`:

```text
@vento/contracts/authorization
→ catalog/versions/<catalog_version>/applications.json
→ schema de aplicación
→ artefactos TypeScript derivados
```

`applications.json` deberá contener exactamente una fila por cada una de las diez identidades canónicas y conservar como mínimo los campos ya definidos por `AUTH-CAT-017`:

- `app_code`;
- `display_name`;
- `domain`;
- `app_kind`;
- `roadmap_scope`;
- `lifecycle_status`;
- `repository_owner` cuando esté confirmado;
- `permission_namespace`;
- `is_authorization_catalog_member`.

Reglas:

1. no se mantiene una segunda lista de `app_code` como fuente independiente;
2. una aplicación se agrega, depreca o retira mediante una nueva versión del catálogo, no editando una unión TypeScript aislada;
3. el repositorio, URL, logo, color, plataforma o ambiente no sustituyen `app_code`;
4. el estado runtime de disponibilidad no modifica identidad, tipo, dominio ni roadmap;
5. `public.apps` puede continuar como proyección/runtime durante la transición, pero no puede redefinir el significado contractual de una identidad aprobada;
6. cualquier proyección posterior hacia Supabase deberá originarse desde una versión publicada y conservar la identidad exacta.

---

#### 7. Contrato derivado de tipos y valores

La centralización TypeScript se realizará como proyección generada del catálogo, de acuerdo con `AUTH-CAT-018`.

La versión contractual inicial deberá producir exactamente:

```text
AppCode
→ "shell"
| "anima"
| "viso"
| "nexo"
| "fogo"
| "origo"
| "pulso"
| "numera"
| "aura"
| "pass"
```

Además, la misma fuente deberá derivar las categorías ya aprobadas:

```text
AppDomain
AppKind
RoadmapScope
ApplicationLifecycleStatus
ApplicationDefinition
ApplicationByCode
```

Reglas vinculantes:

1. `AppCode` no se escribe manualmente como fuente;
2. `AppCode` no se define como `string` abierto;
3. un patrón sintácticamente válido no basta para convertirse en `AppCode`;
4. un valor externo se valida contra la versión concreta del catálogo antes de convertirse en identidad interna;
5. los tipos derivados cambian únicamente como consecuencia de una versión de catálogo válida;
6. cualquier salida generada divergente de `applications.json` queda inválida y debe regenerarse desde la fuente;
7. los consumidores no agregan miembros localmente a la unión.

---

#### 8. Convención e invariantes de `app_code`

Todo código canónico deberá cumplir simultáneamente:

```text
^[a-z][a-z0-9_]*$
```

Y además:

- minúsculas;
- ASCII;
- primer carácter alfabético;
- identidad única;
- estabilidad contractual;
- sin prefijo de marca `vento`;
- sin mayúsculas, espacios, acentos, guiones medios o puntos;
- sin versión, ambiente, sede, dispositivo, plataforma o repositorio embebidos;
- preferencia por una sola palabra;
- `snake_case` únicamente cuando una identidad futura realmente requiera varias palabras.

No son códigos de aplicación válidos por identidad:

```text
vento-nexo
vento_nexo
nexo_prod
nexo_staging
nexo_kiosk
nexo_inventory
pulso_web
anima_mobile
```

Ninguno de esos ejemplos crea una identidad aunque un consumidor pudiera representarlo como string.

---

#### 9. Separación entre aplicación, repositorio, package y superficie

La identidad se conserva así:

```text
shell
→ aplicación Vento OS

vento-shell
→ repositorio técnico

@vento/contracts
→ package compartido

nexo.inventory
→ módulo dentro de una aplicación

nexo.ventogroup.co
→ destino técnico o dominio web
```

Reglas:

1. un repositorio puede implementar una aplicación, pero su nombre no es `app_code`;
2. un package compartido nunca se registra como aplicación por contener código transversal;
3. una ruta, pantalla, módulo o microfrontend no crea otra aplicación;
4. una variante web, móvil, tablet o kiosco no crea otra aplicación;
5. un ambiente no crea otra aplicación;
6. una sede o área pertenece al contexto y no a la identidad de aplicación;
7. un dispositivo compartido habilita o limita aplicaciones existentes y no constituye una aplicación.

---

#### 10. Clasificación de identificadores locales no canónicos

El código actual contiene valores que pueden confundirse con una identidad de aplicación. Se clasifican expresamente:

| Valor actual                      | Clasificación                                                | Decisión                                                                                  |
| --------------------------------- | ------------------------------------------------------------ | ----------------------------------------------------------------------------------------- |
| `hub`                             | identificador de presentación local observado en AppSwitcher | no pertenece a `AppCode`; la aplicación representada es `shell`                           |
| `default`                         | sentinel de configuración observado en `APP_ENTITY`          | no pertenece a `AppCode`; no puede persistirse ni propagarse como identidad de aplicación |
| `vento-shell`, `vento-nexo`, etc. | nombres de repositorio                                       | no pertenecen a `AppCode`                                                                 |
| `nexo_prod`, `nexo_staging`, etc. | identidad mezclada con ambiente                              | inválidos como `AppCode`                                                                  |
| `nexo_kiosk`, `pulso_web`, etc.   | identidad mezclada con plataforma o dispositivo              | inválidos como `AppCode`                                                                  |

`hub` no se registra como alias contractual de aplicación. Es una deuda de presentación que deberá converger a `shell` durante la migración del consumidor correspondiente.

`default` tampoco se registra como alias. Es una condición local de configuración y deberá resolverse a una aplicación canónica antes de cruzar cualquier frontera que exija `AppCode`.

La resolución física de consumidores y eliminación de estos usos se ejecutará mediante `SHELL-MIG-001` a `SHELL-MIG-003` y, cuando afecte componentes compartidos, `SHELL-MIG-005`, conservando inventario, lotes reversibles, compatibilidad y rollback.

---

#### 11. Estabilidad, alta, deprecación y retiro

`app_code` es una identidad contractual estable.

##### 11.1. Alta de una aplicación

Una aplicación futura solo podrá ingresar cuando exista una decisión canónica que materialice su identidad y una nueva versión del catálogo la incluya. La forma válida de la cadena no constituye alta.

##### 11.2. Cambio de código

Cambiar `app_code` es una ruptura contractual porque afecta permisos, navegación, políticas, auditoría, dispositivos, tipos, migraciones y consumidores.

No se renombra una identidad en sitio. Un cambio deberá conservar trazabilidad mediante nueva identidad, compatibilidad temporal, migración y retiro controlado según las tareas propietarias aplicables.

##### 11.3. Deprecación y retiro

Los estados contractuales permitidos permanecen:

```text
active
deprecated
retired
reserved
```

Un código retirado no se reutiliza para otra aplicación. Su identidad histórica permanece reservada para auditoría y compatibilidad.

Esta tarea no cambia el ciclo de vida de ninguna de las diez aplicaciones actuales.

---

#### 12. Dominio de identidad y autorización

La clasificación de aplicación no concede capacidades.

```text
app_code
→ identifica la aplicación

app_kind
→ describe su naturaleza

domain
→ identifica el dominio laboral o cliente

roadmap_scope
→ describe su inclusión en el roadmap

permiso + contexto + recurso + precedencia
→ determinan autorización
```

Consecuencias:

- `nexo` sea `hybrid` no autoriza automáticamente carril base u operativo;
- `fogo` sea `operational` no convierte todos sus permisos en operativos;
- `aura` permanezca `active` no significa que esté lista para implementación o despliegue;
- `pass` conserva dominio `cliente` y no convierte la identidad del cliente en identidad laboral;
- una aplicación `active` puede no estar desplegada, navegable o disponible para un actor concreto.

---

#### 13. Frontera con presentación, navegación y disponibilidad

La identidad canónica centralizada no convierte todos los atributos visuales u operativos en `AppCode`.

| Aspecto                        | Relación con `app_code`                                                      |
| ------------------------------ | ---------------------------------------------------------------------------- |
| nombre visible                 | metadata contractual asociada; no sustituye el código                        |
| logo, color y marca visual     | proyección de presentación referenciada por código; no crea identidad        |
| URL o destino                  | configuración/navegación asociada a una aplicación válida; no crea identidad |
| disponibilidad de despliegue   | estado operativo separado del código                                         |
| visibilidad para un actor      | decisión derivada de autorización/contexto, no del código                    |
| estado `soon` de un componente | estado de presentación local; no es `lifecycle_status` canónico              |
| `active` del catálogo          | ciclo de vida contractual; no equivale a acceso ni despliegue                |

Todo catálogo de presentación, navegación, dispositivo o runtime deberá usar una identidad `AppCode` válida como clave de referencia y no mantener un universo paralelo de aplicaciones.

Esta tarea no fija nuevos destinos, colores, logos ni reglas de acceso; conserva sus propietarios funcionales y de interfaz existentes y únicamente impide que dichos atributos redefinan la identidad de aplicación.

---

#### 14. Consumo y validación de fronteras

Cuando la implementación física sea autorizada, toda frontera que reciba un código de aplicación desde configuración, base de datos, URL, dispositivo, evento o payload deberá distinguir:

```text
STRING EXTERNO
→ validar contra catálogo publicado
→ AppCode válido

STRING DESCONOCIDO
→ no convertir a AppCode
→ no inventar aplicación
→ no ampliar permisos ni navegación
```

La identidad válida deberá conservar la versión contractual que permitió resolverla cuando la operación requiera trazabilidad reproducible.

Esta tarea no crea códigos de error específicos; la taxonomía de errores y diagnósticos compartidos permanece reservada a `SHELL-CON-008`.

---

#### 15. Relación con permisos

El `permission_namespace` de cada aplicación es exactamente su `app_code`.

La relación canónica es:

```text
<app_code>.access
```

o:

```text
<app_code>.<module>.<resource>.<action>
```

Por tanto:

- un permiso no puede usar un prefijo de aplicación inexistente;
- el namespace de permisos no crea aplicaciones nuevas;
- `SHELL-CON-002` fija la identidad de la primera parte del permiso;
- `SHELL-CON-003` conserva la responsabilidad de centralizar los códigos de permisos completos y no se desarrolla en esta tarea.

---

#### 16. Relación con `public.apps` y Supabase

Durante la transición, `public.apps` puede continuar siendo el registro efectivo utilizado por runtime, tal como fue documentado por `AUTH-CAT-001`.

La arquitectura objetivo permanece:

```text
catálogo versionado en vento-shell
→ validación y materialización autorizada
→ proyección compatible en Supabase
→ consumidores
```

Reglas:

1. `public.apps` no puede redefinir una identidad aprobada mediante edición ad hoc;
2. una proyección de catálogo deberá conservar `app_code` exacto y versión aplicable;
3. la sincronización futura deberá detectar aplicaciones faltantes, desconocidas o divergentes;
4. esta tarea no crea migraciones, seeds, funciones, triggers, RLS, grants ni cambios de datos;
5. cualquier cambio físico posterior de Supabase perteneciente a Vento deberá originarse y versionarse desde `vento-shell` en su tarea propietaria.

---

#### 17. Cobertura de consumidores y migración posterior

La centralización no exige una migración simultánea de todos los repositorios.

La adopción física deberá respetar:

```text
catálogo y tipos publicados
→ inventario ejecutable de consumidores
→ lotes reversibles por repositorio
→ compatibilidad temporal donde exista consumo real
→ bloqueo de nuevos usos legacy
→ migración gradual
→ pruebas de paridad
→ retiro de copias legacy
```

Los propietarios ya existentes son:

- `SHELL-MIG-001` — consolidar inventario ejecutable de consumidores;
- `SHELL-MIG-002` — definir lotes reversibles por repositorio;
- `SHELL-MIG-003` — preparar compatibilidad y bloquear nuevos consumidores legacy;
- `SHELL-MIG-005` — migrar componentes cuando el cambio alcance AppSwitcher, Chrome o superficies compartidas;
- `SHELL-MIG-007` — ejecutar pruebas de paridad de consumidores;
- `SHELL-MIG-008` — retirar copias legacy y certificar adopción.

No se retira una lista local solamente porque exista una fuente objetivo; primero debe existir una versión consumible y el consumidor debe migrarse con evidencia y rollback.

---

#### 18. Relación con el paquete de implementación y la puerta física

El registro vigente ya vincula la centralización del catálogo de aplicaciones con `GAP-PKG-045` y con su plan de prueba de fundación compartida.

El cierre global de E5 mantiene 0 de 207 expedientes autorizados para implementación física. Por tanto, esta tarea produce únicamente el contrato documental:

```text
SHELL-CON-002
→ contrato de códigos de aplicaciones completo
→ 0 cambios físicos
→ 0 migraciones
→ 0 adopciones de consumidor
```

La materialización del catálogo, los tipos generados y la migración de consumidores solo podrán ejecutarse cuando el paquete aplicable supere su puerta física y las tareas de implementación correspondientes estén habilitadas.

---

#### 19. Decisiones vinculantes

1. el universo vigente contiene exactamente diez `app_code` canónicos;
2. no se crea ningún código nuevo en esta tarea;
3. la fuente técnica objetivo es `applications.json` dentro del catálogo versionado ya definido para `@vento/contracts/authorization`;
4. no se crea un segundo catálogo de aplicaciones ni un subpath competidor;
5. `AppCode` se genera desde el catálogo publicado y no se mantiene manualmente;
6. `AppCode` no acepta `string` abierto como representación interna canónica;
7. `permission_namespace` coincide exactamente con `app_code` para las diez aplicaciones;
8. las diez aplicaciones pertenecen al catálogo de autorización vigente;
9. las diez permanecen `active` en este corte;
10. `shell` identifica la aplicación Vento OS y no el repositorio `vento-shell`;
11. `pass` conserva dominio cliente y no hereda identidad laboral;
12. `aura` conserva identidad activa y roadmap `deferred` aunque su repositorio no esté confirmado;
13. `hub` es un identificador de presentación local, no un `AppCode` ni un alias contractual;
14. `default` es un sentinel local de configuración, no un `AppCode` ni un alias contractual;
15. repositorios, plataformas, ambientes, sedes, dispositivos, módulos, rutas y pantallas no generan códigos adicionales;
16. un código retirado no se reutiliza;
17. cambiar un `app_code` es una ruptura contractual y no se ejecuta como renombre en sitio;
18. una aplicación activa no equivale a aplicación desplegada, navegable o autorizada;
19. presentación, destino y disponibilidad deben referenciar `AppCode` sin redefinirlo;
20. entradas externas desconocidas no se convierten en aplicaciones por inferencia;
21. `public.apps` permanece como runtime transitorio hasta la materialización y migración autorizadas, sin convertirse en fuente semántica competidora;
22. la migración física se realiza gradualmente mediante `SHELL-MIG-001`, `SHELL-MIG-002`, `SHELL-MIG-003`, `SHELL-MIG-004`, `SHELL-MIG-005`, `SHELL-MIG-006`, `SHELL-MIG-007` y `SHELL-MIG-008`;
23. esta tarea no modifica código, package, consumidores, Supabase, CI, releases ni continuidad;
24. `SHELL-CON-003` permanece como única tarea siguiente reservada.

---

#### 20. Hallazgos y destinos exactos

| Hallazgo                                                                           | Estado                      | Destino exacto / condición de salida                                                                                                           |
| ---------------------------------------------------------------------------------- | --------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| `@vento/contracts` aún no está materializado físicamente                           | esperado por fase           | `E5-GATE-008` → `SHELL-CI-020`; build independiente en `SHELL-CI-002`, release versionada en `SHELL-CI-003` y compatibilidad en `SHELL-CI-005` |
| SHELL mantiene una lista local de cinco aplicaciones                               | `LEGACY_ACTIVO`             | `SHELL-MIG-001`, `SHELL-MIG-002`, `SHELL-MIG-003` y lote de migración aplicable                                                                |
| consumidores mantienen `AppSwitcherItem.id: string`                                | `LEGACY_ACTIVO`             | `SHELL-MIG-001`, `SHELL-MIG-003`, `SHELL-MIG-005` y pruebas de paridad en `SHELL-MIG-007`                                                      |
| `hub` aparece como identidad local de presentación                                 | `NO_CANONICO_COMO_APP_CODE` | converger a referencia canónica `shell` durante el lote propietario; retiro legacy en `SHELL-MIG-008`                                          |
| `default` aparece como sentinel en configuración local                             | `NO_CANONICO_COMO_APP_CODE` | resolverlo antes de una frontera `AppCode` durante `SHELL-MIG-003`; retirar propagación legacy en `SHELL-MIG-008`                              |
| VISO mantiene una unión local que no representa el universo completo               | `LEGACY_ACTIVO`             | reemplazo por tipo derivado dentro del lote de consumidor definido en `SHELL-MIG-002` y `SHELL-MIG-003`                                        |
| campos de dispositivo para aplicación permanecen como strings                      | `LEGACY_ACTIVO`             | tipado/validación al adoptar contratos; integración mediante `SHELL-MIG-003` y tareas de dispositivo propietarias                              |
| repositorio AURA no está confirmado                                                | `PENDIENTE_DE_EVIDENCIA`    | `AURA-AUD-010`; no altera el código canónico `aura`                                                                                            |
| códigos de permisos completos todavía no se centralizan                            | `RESERVADO_POR_SECUENCIA`   | `SHELL-CON-003`                                                                                                                                |
| errores/diagnósticos específicos para código desconocido todavía no se centralizan | `RESERVADO_POR_SECUENCIA`   | `SHELL-CON-008`                                                                                                                                |

No se crea ninguna tarea nueva: todos los hallazgos poseen propietario existente y condición de salida.

---

#### 21. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa documentalmente la misma centralización del catálogo de aplicaciones que ya cuenta con cobertura canónica vigente para identidad única, metadata coherente, navegación y destinos válidos, consumidores de listas versionadas, compatibilidad de packages y migración controlada. No introduce una regla ejecutable independiente ni modifica comportamiento físico; por ello no corresponde crear ni modificar requisitos del registro en este corte.

| Operación sobre requisitos de prueba | Cantidad |
| ------------------------------------ | -------: |
| creados                              |    **0** |
| modificados                          |    **0** |
| diferidos                            |    **0** |
| descartados                          |    **0** |
| obsoletos                            |    **0** |

---

#### 22. Criterios de aceptación

`SHELL-CON-002` queda materialmente completa porque:

- conserva exactamente las diez aplicaciones aprobadas y ninguna adicional;
- materializa una fila contractual por cada identidad;
- concilia 10 de 10 códigos, sin faltantes ni duplicados;
- conserva nombre, tipo, dominio, roadmap y ciclo de vida aprobados;
- fija `permission_namespace = app_code` para las diez aplicaciones;
- conserva las diez identidades como miembros del catálogo de autorización;
- utiliza `applications.json` como fuente técnica objetivo existente en vez de crear un catálogo paralelo;
- conserva `@vento/contracts/authorization` como superficie contractual ya aprobada;
- deriva `AppCode` y tipos asociados desde el catálogo en vez de mantener uniones manuales;
- clasifica `hub` y `default` como valores locales no canónicos para `AppCode`;
- separa identidad de aplicación de repositorio, package, plataforma, ambiente, sede, dispositivo, módulo y ruta;
- impide crear identidades por forma sintáctica o inferencia;
- conserva `shell`, `pass` y `aura` con las distinciones aprobadas;
- mantiene `public.apps` como runtime transitorio sin concederle autoridad semántica alternativa;
- asigna la migración física a tareas `SHELL-MIG-*` ya existentes;
- conserva el vínculo de implementación existente sin autorizar físicamente el paquete;
- no crea ni modifica requisitos de prueba;
- no implementa código, package, tipos, migraciones, Supabase, CI, release ni cambios de consumidor;
- deja `SHELL-CON-003` como única continuidad reservada.

---

#### 23. Continuidad

##### ÚLTIMA TAREA APROBADA
SHELL-CON-001 — Crear @vento/contracts

##### TAREA ACTUAL APROBADA
SHELL-CON-002 — Centralizar códigos de aplicaciones

##### SIGUIENTE TAREA RESERVADA
SHELL-CON-003 — Centralizar códigos de permisos


### ✅ SHELL-CON-003 — Centralizar códigos de permisos

**Estado:** APROBADA
**Tarea anterior:** SHELL-CON-002 — Centralizar códigos de aplicaciones
**Tarea siguiente:** SHELL-CON-004 — Centralizar roles base
**Tipo de tarea:** Documental
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Estado físico resultante:** `CONTRATO_DE_PERMISSION_KEY_DEFINIDO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-CON-003` centraliza las identidades de permisos de Vento OS sobre el catálogo canónico ya aprobado y fija la frontera entre una capacidad canónica activa, un alias de compatibilidad, un permiso legacy amplio y una clave técnica retirada.

La tarea materializa el universo completo de claves activas que deberá alimentar `permissions.json` y el tipo derivado `PermissionKey` dentro de `@vento/contracts/authorization`, sin crear una fuente paralela y sin implementar todavía archivos, generadores, consumidores, migraciones o cambios en Supabase.

La regla central es:

```text
CATÁLOGO CANÓNICO VERSIONADO
→ permissions.json
→ PermissionKey y valores derivados
→ consumidores

TEXTO EXTERNO O LEGACY
→ validación / resolución explícita
→ PermissionKey canónica o rechazo
```

---

#### 2. Resultado canónico

Queda centralizado el conjunto contractual vigente de **140 permisos canónicos activos y únicos** de `vento.authorization@1.0.0`.

La conciliación documental es:

| Categoría                                         | Cantidad | Tratamiento contractual                                                           |
| ------------------------------------------------- | -------: | --------------------------------------------------------------------------------- |
| permisos canónicos activos                        |  **140** | miembros de `PermissionKey`                                                       |
| permisos legacy bloqueados o por descomposición   |   **22** | separados en `legacy-permissions.json`; no asignables como capacidades nuevas     |
| permisos técnicos retirados                       |   **14** | separados en `retired-permissions.json`; no autorizan                             |
| familias semánticas de duplicados ya consolidadas |   **20** | una clave canónica por capacidad; referencias anteriores solo como compatibilidad |

Los aliases existentes permanecen en `aliases.json` y no forman parte de los 140 permisos activos.

---

#### 3. Fuentes y precedencia

Esta tarea conserva sin reabrir las decisiones aprobadas que definen:

1. la convención `<app>.access` o `<app>.<module>.<resource>.<action>`;
2. la resolución documental de los 177 permisos legacy;
3. las 20 familias semánticas de duplicados;
4. las 140 claves canónicas activas congeladas en `vento.authorization@1.0.0` con metadata contractual;
5. la estructura versionada de `@vento/contracts/authorization`;
6. la generación de `PermissionKey` desde el catálogo publicado;
7. la prohibición de cadenas manuales como fuente de verdad;
8. la separación entre catálogo contractual, evaluación runtime y persistencia.

Precedencia aplicable:

```text
AUTH-CAT-003..005
→ AUTH-CAT-017..019
→ AUTH-CAT-020..024
→ SHELL-CON-001
→ SHELL-CON-002
→ SHELL-CON-003
→ implementación física autorizada
→ gates contra consumidores legacy
→ migración multi-repositorio
```

`AUTH-CAT-024` constituye la autoridad del snapshot contractual vigente: `vento.authorization@1.0.0`, 140 permisos activos, 10 aplicaciones y `contract_release_hash = sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe`.

Una clave observada en código, SQL, una ruta, una tabla o una configuración no se convierte en permiso canónico por existir físicamente.

---

#### 4. Línea base verificable

La auditoría de componentes compartidos y el código vigente muestran una brecha todavía abierta entre el contrato aprobado y los consumidores actuales:

| Superficie                                | Estado observado                                        | Decisión de esta tarea                                                        |
| ----------------------------------------- | ------------------------------------------------------- | ----------------------------------------------------------------------------- |
| entrada de permiso en helpers compartidos | `string` abierto                                        | deberá converger a `PermissionKey` validada                                   |
| normalización local de permiso            | concatenación `appId + code`                            | queda como patrón legacy; no define identidad canónica                        |
| aliases                                   | no modelados de forma uniforme en helpers               | se resuelven solo en frontera de compatibilidad                               |
| permisos legacy amplios                   | pueden circular como texto                              | no pertenecen a `PermissionKey` y no admiten nuevas asignaciones              |
| permisos retirados                        | pueden circular como texto histórico                    | no pertenecen a `PermissionKey` y deben rechazarse como autoridad actual      |
| `@vento/contracts/authorization`          | definido documentalmente, no materializado en esta fase | será la superficie propietaria cuando la implementación física sea autorizada |

La tarea no modifica estas superficies ahora. Cierra el contrato que deberán adoptar.

---

#### 5. Identidad canónica de permiso

`PermissionKey` representa una capacidad empresarial activa publicada en una versión concreta del catálogo.

Invariantes:

1. una capacidad empresarial activa tiene una única clave canónica;
2. una clave canónica pertenece a una aplicación canónica existente;
3. una clave válida por patrón no es suficiente: debe existir en `permissions.json` publicado;
4. `PermissionKey` contiene exclusivamente claves activas;
5. aliases, legacy amplios y retirados son categorías incompatibles con `PermissionKey`;
6. una ruta, pantalla, archivo, dispositivo, sede, área, rol, estado de interfaz o framework no crea una capacidad;
7. la clave no incorpora alcance territorial, propiedad del recurso ni filtros de estado como sustitutos del contrato;
8. la definición de una clave no concede autoridad a ningún actor.

---

#### 6. Convención estructural

Solo se admiten estas dos formas canónicas:

```text
<app>.access
```

```text
<app>.<module>.<resource>.<action>
```

La forma especial `<app>.access` identifica únicamente entrada a la superficie general de una aplicación y no concede sus demás capacidades.

Para las demás claves:

- `app` usa un `AppCode` aprobado;
- `module` agrupa una capacidad empresarial dentro de la aplicación;
- `resource` identifica el recurso o familia empresarial;
- `action` expresa una acción concreta;
- alcance, sede, área, ownership, turno, check-in, dispositivo, simulación y estado del recurso permanecen fuera de la identidad textual del permiso.

Una clave desconocida no se corrige, completa ni aproxima por heurística.

---

#### 7. Matriz completa de permisos canónicos activos

La siguiente matriz materializa las **140 de 140** identidades activas que componen `vento.authorization@1.0.0`.

|    # | Aplicación | `permission_key`                                | Forma                        | Estado             |
| ---: | ---------- | ----------------------------------------------- | ---------------------------- | ------------------ |
|    1 | `shell`    | `shell.access`                                  | `APP_ACCESS`                 | `ACTIVE_CANONICAL` |
|    2 | `anima`    | `anima.access`                                  | `APP_ACCESS`                 | `ACTIVE_CANONICAL` |
|    3 | `anima`    | `anima.workforce.employee_documents.view`       | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|    4 | `anima`    | `anima.workforce.employee_documents.upload`     | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|    5 | `anima`    | `anima.workforce.employee_documents.delete`     | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|    6 | `anima`    | `anima.workforce.employee_photos.upload`        | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|    7 | `anima`    | `anima.workforce.team_members.view`             | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|    8 | `anima`    | `anima.workforce.staff_invitations.create`      | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|    9 | `anima`    | `anima.attendance.shifts.create`                | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   10 | `anima`    | `anima.attendance.shifts.update`                | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   11 | `anima`    | `anima.attendance.shifts.cancel`                | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   12 | `aura`     | `aura.access`                                   | `APP_ACCESS`                 | `ACTIVE_CANONICAL` |
|   13 | `fogo`     | `fogo.access`                                   | `APP_ACCESS`                 | `ACTIVE_CANONICAL` |
|   14 | `fogo`     | `fogo.production.batches.view`                  | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   15 | `fogo`     | `fogo.production.batches.create`                | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   16 | `fogo`     | `fogo.production.orders.view`                   | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   17 | `fogo`     | `fogo.production.recipe_book.view`              | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   18 | `fogo`     | `fogo.production.recipes.view`                  | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   19 | `nexo`     | `nexo.access`                                   | `APP_ACCESS`                 | `ACTIVE_CANONICAL` |
|   20 | `nexo`     | `nexo.catalog.products.view`                    | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   21 | `nexo`     | `nexo.catalog.products.create`                  | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   22 | `nexo`     | `nexo.catalog.presentations.view`               | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   23 | `nexo`     | `nexo.catalog.request_policies.view`            | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   24 | `nexo`     | `nexo.catalog.categories.view`                  | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   25 | `nexo`     | `nexo.catalog.units.view`                       | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   26 | `nexo`     | `nexo.assets.items.view`                        | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   27 | `nexo`     | `nexo.assets.items.create`                      | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   28 | `nexo`     | `nexo.assets.groups.view`                       | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   29 | `nexo`     | `nexo.assets.counts.view`                       | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   30 | `nexo`     | `nexo.inventory.adjustments.view`               | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   31 | `nexo`     | `nexo.inventory.adjustments.register`           | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   32 | `nexo`     | `nexo.inventory.entries.view`                   | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   33 | `nexo`     | `nexo.inventory.entries.register`               | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   34 | `nexo`     | `nexo.inventory.entries.override`               | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   35 | `nexo`     | `nexo.inventory.locations.view`                 | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   36 | `nexo`     | `nexo.inventory.location_assignments.assign`    | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   37 | `nexo`     | `nexo.inventory.location_catalog.update`        | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   38 | `nexo`     | `nexo.inventory.lpns.view`                      | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   39 | `nexo`     | `nexo.inventory.movements.view`                 | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   40 | `nexo`     | `nexo.inventory.stock.view`                     | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   41 | `nexo`     | `nexo.inventory.production_batches.view`        | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   42 | `nexo`     | `nexo.inventory.transfers.view`                 | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   43 | `nexo`     | `nexo.inventory.transfers.create`               | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   44 | `nexo`     | `nexo.inventory.withdrawals.view`               | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   45 | `nexo`     | `nexo.inventory.withdrawals.register`           | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   46 | `nexo`     | `nexo.inventory.zones.view`                     | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   47 | `nexo`     | `nexo.inventory.storage_positions.view`         | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   48 | `nexo`     | `nexo.inventory.warehouse_operations.view`      | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   49 | `nexo`     | `nexo.inventory.stock_validations.perform`      | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   50 | `nexo`     | `nexo.inventory.stock_counts.view`              | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   51 | `nexo`     | `nexo.inventory.stock_counts.perform`           | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   52 | `nexo`     | `nexo.inventory.stock_count_variances.approve`  | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   53 | `nexo`     | `nexo.inventory.stock_count_variances.resolve`  | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   54 | `nexo`     | `nexo.inventory.initial_counts.view`            | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   55 | `nexo`     | `nexo.inventory.remissions.view`                | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   56 | `nexo`     | `nexo.inventory.remissions.update`              | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   57 | `nexo`     | `nexo.inventory.remissions.request`             | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   58 | `nexo`     | `nexo.inventory.remissions.prepare`             | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   59 | `nexo`     | `nexo.inventory.remissions.accept_custody`      | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   60 | `nexo`     | `nexo.inventory.remissions.start_transit`       | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   61 | `nexo`     | `nexo.inventory.remissions.deliver`             | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   62 | `nexo`     | `nexo.inventory.remissions.receive`             | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   63 | `nexo`     | `nexo.inventory.remissions.cancel`              | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   64 | `nexo`     | `nexo.logistics.operations_board.view`          | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   65 | `nexo`     | `nexo.logistics.operations.view`                | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   66 | `nexo`     | `nexo.logistics.driver_operations.view`         | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   67 | `nexo`     | `nexo.logistics.fulfillment.view`               | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   68 | `nexo`     | `nexo.logistics.fulfillment_routes.view`        | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   69 | `nexo`     | `nexo.logistics.supply_routes.view`             | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   70 | `nexo`     | `nexo.finance.internal_invoices.view`           | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   71 | `nexo`     | `nexo.finance.internal_invoices.generate`       | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   72 | `nexo`     | `nexo.finance.internal_invoices.issue`          | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   73 | `nexo`     | `nexo.finance.internal_invoices.cancel`         | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   74 | `nexo`     | `nexo.finance.internal_invoice_amounts.view`    | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   75 | `nexo`     | `nexo.finance.internal_prices.view`             | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   76 | `nexo`     | `nexo.finance.internal_variances.view`          | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   77 | `nexo`     | `nexo.finance.internal_variances.approve`       | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   78 | `nexo`     | `nexo.finance.internal_variances.resolve`       | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   79 | `nexo`     | `nexo.finance.cost_centers.view`                | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   80 | `nexo`     | `nexo.analytics.internal_reports.view`          | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   81 | `nexo`     | `nexo.analytics.margin_reports.view`            | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   82 | `nexo`     | `nexo.printing.templates.update`                | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   83 | `nexo`     | `nexo.printing.jobs.view`                       | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   84 | `nexo`     | `nexo.settings.sites.view`                      | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   85 | `nexo`     | `nexo.settings.remission_policies.view`         | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   86 | `numera`   | `numera.access`                                 | `APP_ACCESS`                 | `ACTIVE_CANONICAL` |
|   87 | `numera`   | `numera.finance.cost_centers.view`              | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   88 | `numera`   | `numera.finance.expenses.view`                  | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   89 | `numera`   | `numera.analytics.break_even.view`              | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   90 | `numera`   | `numera.analytics.profitability.view`           | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   91 | `numera`   | `numera.analytics.financial_reports.view`       | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   92 | `origo`    | `origo.access`                                  | `APP_ACCESS`                 | `ACTIVE_CANONICAL` |
|   93 | `origo`    | `origo.procurement.purchase_orders.view`        | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   94 | `origo`    | `origo.procurement.receipts.view`               | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   95 | `origo`    | `origo.procurement.receipts.register`           | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   96 | `origo`    | `origo.procurement.suppliers.view`              | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   97 | `origo`    | `origo.catalog.product_reviews.view`            | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|   98 | `pass`     | `pass.access`                                   | `APP_ACCESS`                 | `ACTIVE_CANONICAL` |
|   99 | `pulso`    | `pulso.access`                                  | `APP_ACCESS`                 | `ACTIVE_CANONICAL` |
|  100 | `pulso`    | `pulso.delivery.deliveries.override`            | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  101 | `pulso`    | `pulso.sales.orders.create`                     | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  102 | `pulso`    | `pulso.payments.transactions.collect`           | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  103 | `pulso`    | `pulso.payments.transactions.reverse`           | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  104 | `pulso`    | `pulso.cash.sessions.start`                     | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  105 | `pulso`    | `pulso.cash.sessions.close`                     | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  106 | `pulso`    | `pulso.sales.orders.cancel`                     | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  107 | `pulso`    | `pulso.sales.returns.create`                    | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  108 | `pulso`    | `pulso.payments.transactions.refund`            | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  109 | `pulso`    | `pulso.sales.discounts.apply`                   | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  110 | `viso`     | `viso.access`                                   | `APP_ACCESS`                 | `ACTIVE_CANONICAL` |
|  111 | `viso`     | `viso.platform.app_updates.view`                | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  112 | `viso`     | `viso.organization.businesses.view`             | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  113 | `viso`     | `viso.workforce.employees.view`                 | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  114 | `viso`     | `viso.workforce.staff_calendar.view`            | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  115 | `viso`     | `viso.workforce.schedules.view`                 | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  116 | `viso`     | `viso.workforce.vacancies.view`                 | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  117 | `viso`     | `viso.authorization.context_simulations.view`   | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  118 | `viso`     | `viso.authorization.audit_logs.view`            | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  119 | `viso`     | `viso.authorization.base_grants.view`           | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  120 | `viso`     | `viso.authorization.base_grants.create`         | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  121 | `viso`     | `viso.authorization.base_grants.approve`        | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  122 | `viso`     | `viso.authorization.base_grants.suspend`        | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  123 | `viso`     | `viso.authorization.base_grants.revoke`         | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  124 | `viso`     | `viso.authorization.operational_grants.view`    | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  125 | `viso`     | `viso.authorization.operational_grants.create`  | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  126 | `viso`     | `viso.authorization.operational_grants.approve` | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  127 | `viso`     | `viso.authorization.operational_grants.suspend` | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  128 | `viso`     | `viso.authorization.operational_grants.revoke`  | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  129 | `viso`     | `viso.authorization.denials.view`               | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  130 | `viso`     | `viso.authorization.denials.create`             | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  131 | `viso`     | `viso.authorization.denials.approve`            | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  132 | `viso`     | `viso.authorization.denials.revoke`             | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  133 | `viso`     | `viso.catalog.commercial_categories.view`       | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  134 | `viso`     | `viso.content.content_blocks.view`              | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  135 | `viso`     | `viso.content.menu.view`                        | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  136 | `viso`     | `viso.content.website_content.view`             | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  137 | `viso`     | `viso.finance.accounting.view`                  | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  138 | `viso`     | `viso.delivery.rates.view`                      | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  139 | `viso`     | `viso.loyalty.products.view`                    | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |
|  140 | `viso`     | `viso.loyalty.customers.view`                   | `APP_MODULE_RESOURCE_ACTION` | `ACTIVE_CANONICAL` |

---

#### 8. Reconciliación por aplicación

| Aplicación | Esperados | Materializados | Resultado      |
| ---------- | --------: | -------------: | -------------- |
| `shell`    |         1 |              1 | **CONCILIADO** |
| `anima`    |        10 |             10 | **CONCILIADO** |
| `aura`     |         1 |              1 | **CONCILIADO** |
| `fogo`     |         6 |              6 | **CONCILIADO** |
| `nexo`     |        67 |             67 | **CONCILIADO** |
| `numera`   |         6 |              6 | **CONCILIADO** |
| `origo`    |         6 |              6 | **CONCILIADO** |
| `pass`     |         1 |              1 | **CONCILIADO** |
| `pulso`    |        11 |             11 | **CONCILIADO** |
| `viso`     |        31 |             31 | **CONCILIADO** |
| **Total**  |   **140** |        **140** | **CONCILIADO** |

Resultado adicional:

- claves activas únicas: **140 de 140**;
- faltantes: **0**;
- duplicados activos: **0**;
- aplicaciones representadas: **10 de 10**.

---

#### 9. Permisos legacy bloqueados separados del contrato activo

Los siguientes **22** códigos permanecen explícitamente fuera de `PermissionKey`. Incluyen permisos amplios previamente clasificados como `DECOMPOSE_REQUIRED` y la clave sustituida `nexo.inventory.remissions.dispatch`; no deberán transformarse automáticamente en varias concesiones atómicas ni utilizarse para nuevas asignaciones.

|    # | Aplicación | Código legacy                               | Estado                               | Decisión                                                                                                                                                      |
| ---: | ---------- | ------------------------------------------- | ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | `fogo`     | `fogo.production.recipes.manage`            | `LEGACY_DECOMPOSE_REQUIRED`          | no pertenece a `PermissionKey`; nuevas asignaciones bloqueadas                                                                                                |
|    2 | `nexo`     | `nexo.settings.categories.manage`           | `LEGACY_DECOMPOSE_REQUIRED`          | no pertenece a `PermissionKey`; nuevas asignaciones bloqueadas                                                                                                |
|    3 | `nexo`     | `nexo.settings.units.manage`                | `LEGACY_DECOMPOSE_REQUIRED`          | no pertenece a `PermissionKey`; nuevas asignaciones bloqueadas                                                                                                |
|    4 | `nexo`     | `nexo.settings.supply_routes.manage`        | `LEGACY_DECOMPOSE_REQUIRED`          | no pertenece a `PermissionKey`; nuevas asignaciones bloqueadas                                                                                                |
|    5 | `nexo`     | `nexo.internal_prices.manage`               | `LEGACY_DECOMPOSE_REQUIRED`          | no pertenece a `PermissionKey`; nuevas asignaciones bloqueadas                                                                                                |
|    6 | `nexo`     | `nexo.cost_centers.manage`                  | `LEGACY_DECOMPOSE_REQUIRED`          | no pertenece a `PermissionKey`; nuevas asignaciones bloqueadas                                                                                                |
|    7 | `nexo`     | `nexo.settings.sites.manage`                | `LEGACY_DECOMPOSE_REQUIRED`          | no pertenece a `PermissionKey`; nuevas asignaciones bloqueadas                                                                                                |
|    8 | `nexo`     | `nexo.settings.remissions.manage`           | `LEGACY_DECOMPOSE_REQUIRED`          | no pertenece a `PermissionKey`; nuevas asignaciones bloqueadas                                                                                                |
|    9 | `nexo`     | `nexo.inventory.remissions.dispatch`        | `deprecated_split_pending_migration` | no pertenece a `PermissionKey`; nuevas asignaciones bloqueadas; sustituido por `accept_custody` + `start_transit`, con `deliver` como capacidad independiente |
|   10 | `numera`   | `numera.cost_centers.manage`                | `LEGACY_DECOMPOSE_REQUIRED`          | no pertenece a `PermissionKey`; nuevas asignaciones bloqueadas                                                                                                |
|   11 | `numera`   | `numera.expenses.manage`                    | `LEGACY_DECOMPOSE_REQUIRED`          | no pertenece a `PermissionKey`; nuevas asignaciones bloqueadas                                                                                                |
|   12 | `origo`    | `origo.suppliers.manage`                    | `LEGACY_DECOMPOSE_REQUIRED`          | no pertenece a `PermissionKey`; nuevas asignaciones bloqueadas                                                                                                |
|   13 | `pulso`    | `pulso.pos.main`                            | `LEGACY_DECOMPOSE_REQUIRED`          | no pertenece a `PermissionKey`; nuevas asignaciones bloqueadas                                                                                                |
|   14 | `viso`     | `viso.app_navigation.manage`                | `LEGACY_DECOMPOSE_REQUIRED`          | no pertenece a `PermissionKey`; nuevas asignaciones bloqueadas                                                                                                |
|   15 | `viso`     | `viso.employee_operational_profiles.manage` | `LEGACY_DECOMPOSE_REQUIRED`          | no pertenece a `PermissionKey`; nuevas asignaciones bloqueadas                                                                                                |
|   16 | `viso`     | `viso.menu.images.manage`                   | `LEGACY_DECOMPOSE_REQUIRED`          | no pertenece a `PermissionKey`; nuevas asignaciones bloqueadas                                                                                                |
|   17 | `viso`     | `viso.operational_points.manage`            | `LEGACY_DECOMPOSE_REQUIRED`          | no pertenece a `PermissionKey`; nuevas asignaciones bloqueadas                                                                                                |
|   18 | `viso`     | `viso.site_operational_roles.manage`        | `LEGACY_DECOMPOSE_REQUIRED`          | no pertenece a `PermissionKey`; nuevas asignaciones bloqueadas                                                                                                |
|   19 | `viso`     | `viso.staff.documents.manage`               | `LEGACY_DECOMPOSE_REQUIRED`          | no pertenece a `PermissionKey`; nuevas asignaciones bloqueadas                                                                                                |
|   20 | `viso`     | `viso.staff.employee_photos.manage`         | `LEGACY_DECOMPOSE_REQUIRED`          | no pertenece a `PermissionKey`; nuevas asignaciones bloqueadas                                                                                                |
|   21 | `viso`     | `viso.staff.manage`                         | `LEGACY_DECOMPOSE_REQUIRED`          | no pertenece a `PermissionKey`; nuevas asignaciones bloqueadas                                                                                                |
|   22 | `viso`     | `viso.staff.permissions.manage`             | `LEGACY_DECOMPOSE_REQUIRED`          | no pertenece a `PermissionKey`; nuevas asignaciones bloqueadas                                                                                                |

Su presencia histórica no cambia el universo activo de 140 claves.

---

#### 10. Permisos técnicos retirados

Los siguientes **14** códigos representan rutas, pantallas, archivos o detalles de implementación y permanecen retirados como conceptos de autorización:

|    # | Aplicación | Código retirado        | Estado              | Decisión                                      |
| ---: | ---------- | ---------------------- | ------------------- | --------------------------------------------- |
|    1 | `nexo`     | `nexo.code.view`       | `RETIRED_TECHNICAL` | no constituye capacidad empresarial asignable |
|    2 | `nexo`     | `nexo.edit.view`       | `RETIRED_TECHNICAL` | no constituye capacidad empresarial asignable |
|    3 | `nexo`     | `nexo.login.view`      | `RETIRED_TECHNICAL` | no constituye capacidad empresarial asignable |
|    4 | `nexo`     | `nexo.new.view`        | `RETIRED_TECHNICAL` | no constituye capacidad empresarial asignable |
|    5 | `nexo`     | `nexo.no_access.view`  | `RETIRED_TECHNICAL` | no constituye capacidad empresarial asignable |
|    6 | `nexo`     | `nexo.open.view`       | `RETIRED_TECHNICAL` | no constituye capacidad empresarial asignable |
|    7 | `nexo`     | `nexo.page_tsx.view`   | `RETIRED_TECHNICAL` | no constituye capacidad empresarial asignable |
|    8 | `nexo`     | `nexo.quick.view`      | `RETIRED_TECHNICAL` | no constituye capacidad empresarial asignable |
|    9 | `nexo`     | `nexo.scanner.view`    | `RETIRED_TECHNICAL` | no constituye capacidad empresarial asignable |
|   10 | `nexo`     | `nexo.settings.view`   | `RETIRED_TECHNICAL` | no constituye capacidad empresarial asignable |
|   11 | `nexo`     | `nexo.setup.view`      | `RETIRED_TECHNICAL` | no constituye capacidad empresarial asignable |
|   12 | `nexo`     | `nexo.slug.view`       | `RETIRED_TECHNICAL` | no constituye capacidad empresarial asignable |
|   13 | `origo`    | `origo.login.view`     | `RETIRED_TECHNICAL` | no constituye capacidad empresarial asignable |
|   14 | `origo`    | `origo.no_access.view` | `RETIRED_TECHNICAL` | no constituye capacidad empresarial asignable |

Una superficie que continúe existiendo deberá consumir permisos funcionales canónicos; la existencia de la superficie no reactiva su permiso técnico anterior.

---

#### 11. Aliases y compatibilidad legacy

Los aliases se mantienen como referencias de compatibilidad separadas de los permisos activos.

Reglas vinculantes:

1. un alias apunta directamente a una única clave canónica activa;
2. un alias no es asignable como capacidad nueva;
3. un alias no recibe modalidad, alcance, recurso o contrato propios;
4. un alias no amplía ni reduce autoridad;
5. no existen cadenas `alias → alias`;
6. no existen ciclos;
7. la resolución de alias ocurre antes de evaluar autorización;
8. la clave canónica se evalúa una sola vez;
9. el uso de alias debe ser observable para migración;
10. `DECOMPOSE_REQUIRED` no admite alias automático uno a uno;
11. `RETIRED_TECHNICAL` no se resuelve hacia una capacidad por fallback.

No se fija en esta tarea un conteo nuevo de aliases ni fechas de retiro; se preserva el registro de compatibilidad ya aprobado y su gobierno versionado.

---

#### 12. Fuente técnica única

La fuente técnica objetivo permanece dentro del catálogo versionado ya definido:

```text
@vento/contracts/authorization
→ catalog/versions/<catalog_version>/permissions.json
→ aliases.json
→ legacy-permissions.json
→ retired-permissions.json
→ schemas y manifest
→ artefactos TypeScript derivados
```

`permissions.json` contendrá exactamente un objeto por permiso canónico activo y no mezclará aliases, legacy amplios ni retirados.

La primera versión física, cuando sea autorizada y publicada, deberá implementar exactamente el snapshot contractual `vento.authorization@1.0.0`: **140 permisos activos**, **10 aplicaciones**, `schema_version = 1.0.0` y `contract_release_hash = sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe`, junto con su schema, manifest, checksums y metadata de compatibilidad. El conjunto intermedio de 112 permisos se conserva únicamente como antecedente histórico y no constituye una primera publicación física previa.

---

#### 13. Contrato de `PermissionKey`

`PermissionKey` deberá ser una unión literal generada determinísticamente desde las claves activas de la versión publicada.

Por tanto, quedan excluidas como representación canónica interna las formas equivalentes a:

```text
string
`${string}.${string}`
`${AppCode}.${string}`
```

cuando permitan introducir claves no publicadas mediante asignación ordinaria.

Deberán permanecer categorías distintas:

```text
PermissionKey
PermissionAliasKey
LegacyPermissionKey
RetiredPermissionKey
```

Un `PermissionReferenceInput` podrá existir únicamente como frontera controlada para importación, migración, telemetría o compatibilidad; nunca como sustituto permisivo de `PermissionKey` dentro del evaluador.

---

#### 14. Valores externos y validación runtime

TypeScript no convierte un string externo en permiso válido.

Toda entrada proveniente de Supabase, RPC, configuración, variables de entorno, formularios, eventos, almacenamiento, JSON, datos históricos o integraciones deberá seguir conceptualmente:

```text
unknown / string externo
→ validar o resolver referencia
→ PermissionKey canónica
```

Consecuencias:

- un cast no valida;
- una cadena desconocida falla cerrada;
- un alias se resuelve explícitamente;
- una clave legacy amplia no se convierte automáticamente en activa;
- una clave retirada se rechaza;
- una versión incompatible bloquea el consumo;
- el evaluador interno recibe una identidad canónica ya validada.

Los códigos de diagnóstico específicos permanecen bajo la tarea propietaria de códigos de error y no se amplían aquí.

---

#### 15. Prohibición de construcción dinámica como identidad

No se considera fuente canónica una clave construida mediante:

- interpolación;
- concatenación;
- `join`;
- nombres de ruta;
- nombres de archivos;
- nombres de componentes;
- combinación libre de aplicación, módulo, recurso y acción;
- labels o textos humanos.

La relación es:

```text
SEGMENTOS CON FORMA VÁLIDA
≠
PERMISO PUBLICADO
```

La construcción dinámica observada en helpers actuales queda clasificada como compatibilidad legacy que deberá retirarse durante la implementación y migración correspondientes.

---

#### 16. Superficie pública y constantes derivadas

La API pública futura utilizará el subpath ya aprobado `@vento/contracts/authorization`.

La API ergonómica de constantes se deriva del mismo catálogo y no crea otra identidad. Conceptualmente:

```text
PERMISSIONS.NEXO.INVENTORY.REMISSIONS.PREPARE
→ nexo.inventory.remissions.prepare
```

Reglas:

1. las hojas terminales resuelven exactamente a una `PermissionKey` publicada;
2. no se exportan legacy amplios ni retirados dentro de `PERMISSIONS`;
3. aliases permanecen en una API de compatibilidad separada;
4. consumidores internos reciben `PermissionKey`, no `string`;
5. formatos no TypeScript deberán validar su representación textual contra el mismo catálogo;
6. ningún consumidor mantiene un enum, array o catálogo paralelo como autoridad.

---

#### 17. Relación con aplicaciones y autorización

`SHELL-CON-002` ya fija los diez `AppCode`. `SHELL-CON-003` utiliza esos códigos como primer segmento de la clave y no puede crear otra aplicación por medio de un namespace de permisos.

Además:

- `PermissionKey` identifica una capacidad, no un actor autorizado;
- una clave activa no concede el permiso a propietarios, gerentes ni roles operativos por defecto;
- las matrices determinan asignaciones compatibles;
- contexto, scope, recurso, precedencia y denegaciones determinan la decisión efectiva;
- frontend y servidor deberán referenciar la misma capacidad, pero la interfaz no sustituye autorización de servidor.

---

#### 18. Adopción física y consumidores

La implementación física posterior deberá conservar este orden de responsabilidades:

```text
catálogo y tipos publicados
→ bloqueo de nueva deuda legacy
→ inventario y migración de consumidores
→ parsers y compatibilidad en fronteras
→ validación de paridad
→ retiro controlado
```

Destinos ya existentes:

- `AUTH-CAT-019` define la API de constantes y la eliminación de cadenas manuales;
- `SHELL-AUTH-004` implementa lint, métricas y gates contra consumidores legacy;
- `SHELL-AUTH-005` migra consumidores de autorización en todos los repositorios;
- `SHELL-MIG-001` consolida el inventario ejecutable de consumidores;
- `SHELL-MIG-002` define lotes reversibles por repositorio;
- `SHELL-MIG-003` prepara compatibilidad y bloquea nuevos consumidores legacy;
- `SHELL-MIG-007` ejecuta pruebas de paridad;
- `SHELL-MIG-008` retira copias legacy y certifica adopción.

Esta tarea no ejecuta ninguna de esas responsabilidades.

---

#### 19. Estado de materialización física

El estado canónico vigente mantiene esta fase como exclusivamente documental. En consecuencia:

```text
SHELL-CON-003
→ contrato completo de identidades de permiso
→ 140 claves activas materializadas documentalmente
→ 0 cambios físicos
→ 0 migraciones
→ 0 publicaciones
→ 0 adopciones de consumidor
```

No se crean `permissions.json`, tipos, constantes, parsers, lint, CI, migraciones, RLS, RPC ni cambios de aplicación durante esta tarea.

---

#### 20. Decisiones vinculantes

1. el corte vigente contiene exactamente **140** permisos canónicos activos en `vento.authorization@1.0.0`;
2. las 140 claves activas son únicas y pertenecen a las diez aplicaciones aprobadas;
3. `PermissionKey` contiene solo claves activas publicadas;
4. los 22 permisos legacy bloqueados quedan fuera de `PermissionKey`;
5. los 14 permisos técnicos retirados quedan fuera de `PermissionKey`;
6. aliases quedan separados y nunca crean otra capacidad;
7. la fuente técnica objetivo es `permissions.json` dentro de `@vento/contracts/authorization`;
8. no se crea un catálogo paralelo de permisos;
9. la forma textual válida no basta para adquirir identidad canónica;
10. las claves canónicas no codifican sede, área, ownership, alcance ni estado de recurso;
11. una ruta o pantalla consume capacidades; no las crea;
12. `PermissionKey` no se representa internamente como `string` abierto;
13. texto externo debe validarse antes de convertirse en identidad canónica;
14. un cast no sustituye validación runtime;
15. una clave desconocida no se aproxima por heurística;
16. legacy amplio no se expande automáticamente en varias concesiones;
17. una clave retirada no se reactiva por fallback;
18. una resolución de alias produce una única clave canónica y una única evaluación;
19. las constantes y tipos son proyecciones derivadas, no fuentes alternativas;
20. consumidores nuevos no pueden inventar ni construir claves;
21. la adopción física será gradual y reversible;
22. esta tarea no modifica código, Supabase, package, CI, release ni consumidores;
23. esta tarea no crea ni modifica requisitos de prueba;
24. `SHELL-CON-004` permanece como única tarea siguiente reservada.

---

#### 21. Hallazgos y destinos exactos

| Hallazgo                                                                        | Estado                               | Destino exacto                                                                                                                                               |
| ------------------------------------------------------------------------------- | ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| helpers actuales aceptan `string` y concatenan `appId.code`                     | `LEGACY_ACTIVO`                      | `SHELL-AUTH-004`; `SHELL-AUTH-005`                                                                                                                           |
| `PermissionKey` no existe todavía como tipo runtime canónico materializado      | `DEFINIDO_NO_MATERIALIZADO`          | generación conforme a `AUTH-CAT-018`; materialización física en `SHELL-CI-020` después de `E5-GATE-008`; publicación en `SHELL-CI-003`                       |
| cadenas manuales y construcción dinámica permanecen en consumidores             | `LEGACY_ACTIVO`                      | `AUTH-CAT-019`; `SHELL-AUTH-004`; `SHELL-AUTH-005`                                                                                                           |
| aliases requieren frontera explícita y telemetría                               | `CONTRATO_DEFINIDO`                  | `AUTH-CAT-019`; `SHELL-MIG-003`                                                                                                                              |
| 21 permisos amplios no pueden incorporarse a `PermissionKey`                    | `LEGACY_DECOMPOSE_REQUIRED`          | conservar en `legacy-permissions.json`; resolución y bloqueo en `AUTH-CAT-019`, `SHELL-AUTH-004`, `SHELL-AUTH-005`, `SHELL-MIG-003` y `SHELL-MIG-008`        |
| `nexo.inventory.remissions.dispatch` sale del conjunto activo y queda bloqueado | `deprecated_split_pending_migration` | conservar en `legacy-permissions.json`; sustitución gobernada por `AUTH-CAT-019`, migración en `SHELL-AUTH-005` y `SHELL-MIG-003`, retiro en `SHELL-MIG-008` |
| 14 claves técnicas no pueden reactivarse como capacidades                       | `RETIRED_TECHNICAL`                  | conservar en `retired-permissions.json`; migración de superficies mediante permisos funcionales y retiro en `SHELL-MIG-008`                                  |
| códigos de error para referencias inválidas pertenecen a otra responsabilidad   | `RESERVADO_POR_SECUENCIA`            | `SHELL-CON-008`                                                                                                                                              |

No se crea ninguna tarea nueva: los hallazgos tienen destinos canónicos existentes.

---

#### 22. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea materializa documentalmente el mismo contrato de identidad de permisos que ya cuenta con cobertura canónica para exigir que toda referencia consumida por código exista en la versión vigente del catálogo, respete la convención y no sea una cadena huérfana, duplicada o mal escrita. La compatibilidad, publicación y migración de packages también poseen cobertura previa. No se introduce comportamiento ejecutable nuevo ni se modifica una regla de runtime en este corte.

| Operación sobre requisitos de prueba | Cantidad |
| ------------------------------------ | -------: |
| creados                              |    **0** |
| modificados                          |    **0** |
| diferidos                            |    **0** |
| descartados                          |    **0** |
| obsoletos                            |    **0** |

---

#### 23. Criterios de aceptación

`SHELL-CON-003` queda materialmente completa porque:

- enumera las **140 de 140** claves canónicas activas;
- verifica 140 claves únicas, 0 faltantes y 0 duplicados activos;
- concilia la distribución exacta por las diez aplicaciones;
- conserva la convención aprobada de identidad;
- separa 22 permisos legacy bloqueados de las capacidades activas;
- separa 14 permisos técnicos retirados de las capacidades activas;
- mantiene aliases como compatibilidad y no como capacidades independientes;
- fija `permissions.json` como fuente técnica objetivo dentro del catálogo existente;
- fija `PermissionKey` como unión literal derivada y no como fuente manual;
- impide que forma sintáctica, ruta, pantalla o construcción dinámica creen permisos;
- define validación obligatoria en fronteras externas antes de producir `PermissionKey`;
- conserva la separación entre identidad de permiso, asignación, contexto, alcance y autorización efectiva;
- asigna implementación, gates y migración a tareas canónicas ya existentes;
- no crea ni modifica requisitos de prueba;
- no implementa código, package, Supabase, CI, release ni migración;
- deja `SHELL-CON-004` como única continuidad reservada.

---

#### 24. Continuidad

##### ÚLTIMA TAREA APROBADA
SHELL-CON-002 — Centralizar códigos de aplicaciones

##### TAREA ACTUAL APROBADA
SHELL-CON-003 — Centralizar códigos de permisos

##### SIGUIENTE TAREA RESERVADA
SHELL-CON-004 — Centralizar roles base


### ✅ SHELL-CON-004 — Centralizar roles base

**Estado:** APROBADA
**Tarea anterior:** SHELL-CON-003 — Centralizar códigos de permisos
**Tarea siguiente:** SHELL-CON-005 — Centralizar roles operativos
**Tipo de tarea:** Documental
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 1

---

#### 1. Propósito

`SHELL-CON-004` centraliza la identidad contractual de los roles base de Vento OS y materializa documentalmente el sucesor lógico `vento.authorization.base-role-grants@1.1.0`, incorporando `trabajador_operativo` sin reabrir ni mutar el snapshot aprobado `1.0.0`.

La tarea fija simultáneamente:

1. el conjunto exacto de roles base canónicos;
2. la unión derivada `BaseRoleCode`;
3. la separación entre rol base, rol operativo, rol de navegación y rol simulado;
4. la exclusión de oficios base legacy y códigos documentales ya desplazados;
5. la matriz mínima exacta de `trabajador_operativo`;
6. el manifiesto lógico del dataset sucesor `1.1.0`;
7. las cinco filas nuevas y su serialización determinista;
8. el hash contractual del dataset sucesor;
9. las reglas de validación, compatibilidad, adopción y rollback;
10. los destinos exactos de materialización física y migración.

La regla central es:

```text
CATÁLOGO LÓGICO DE ROLES BASE 1.1.0
→ BaseRoleCode derivado
→ dataset versionado de concesiones base
→ AccessContext / evaluadores / consumidores

NOMBRE DE ROL
≠ permiso
≠ autoridad final
≠ rol operativo
≠ fallback
```

---

#### 2. Resultado canónico

El catálogo lógico objetivo de roles base pasa de siete a ocho identidades canónicas:

```text
propietario
gerente_general
gerente
supervisor
auxiliar_administrativa
contador
marketing
trabajador_operativo
```

Conciliación:

| Dimensión                                | Resultado |
| ---------------------------------------- | --------: |
| Roles base canónicos objetivo            |     **8** |
| Roles existentes cuyo significado cambia |     **0** |
| Roles nuevos                             |     **1** |
| Roles retirados por esta tarea           |     **0** |
| Oficios base legacy incorporados         |     **0** |
| Permisos nuevos                          |     **0** |
| Permisos retirados                       |     **0** |
| Concesiones nuevas en matriz base        |     **5** |
| Componentes base nuevos                  |     **0** |

`trabajador_operativo` es una adición. No redefine el significado de `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador` ni `marketing`.

---

#### 3. Fuentes y precedencia

Esta tarea conserva sin reinterpretar las siguientes fuentes aprobadas:

| Fuente                                              | Uso vinculante                                                                                        |
| --------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`        | continuidad, granularidad, trazabilidad y requisitos de prueba                                        |
| `docs/plan-canonico/modular/delivery-contract.json` | estructura del artefacto y del registro 04A                                                           |
| `docs/plan-canonico/modular/active-sequence.json`   | continuidad vigente desde `SHELL-CON-003` hacia `SHELL-CON-004`                                       |
| `SHELL-CON-001`                                     | identidad y frontera de `@vento/contracts`                                                            |
| `SHELL-CON-002`                                     | aplicaciones canónicas y generación desde fuente única                                                |
| `SHELL-CON-003`                                     | `PermissionKey`, catálogo `vento.authorization@1.0.0` y prohibición de strings locales como autoridad |
| `AUTH-MOD-001..020` / `ADR-AUTH-001`                | separación entre identidad, rol base, rol operativo, contexto y autorización                          |
| `AUTH-MOD-021`                                      | octavo rol base, cinco concesiones, versionado 1.1.0 y tratamiento del legado                         |
| `AUTH-RBAC-001..007`                                | matrices base de los siete roles existentes                                                           |
| `AUTH-RBAC-024`                                     | snapshot inmutable `base-role-grants@1.0.0`, esquema, serialización y hash                            |
| `AUTH-CAT-024`                                      | catálogo de 140 permisos `vento.authorization@1.0.0` y huella contractual                             |
| `SHELL-AUD-009`                                     | necesidad de `BaseRoleCode` separado de roles operativos, navegación y simulación                     |
| `SHELL-AUD-010`                                     | disposición `GENERAR` para códigos y tipos de rol                                                     |
| Registro Canónico de Requisitos de Prueba           | cobertura vigente de autorización, contratos, compatibilidad y CI                                     |

Precedencia específica:

```text
AUTH-RBAC-024
→ conserva inmutable 1.0.0

AUTH-MOD-021
→ introduce decisión aditiva posterior
→ define 1.1.0 como sucesor lógico

SHELL-CON-004
→ centraliza identidad
→ cierra serialización exacta del delta
→ calcula hash de 1.1.0
→ no muta 1.0.0
```

La existencia de una cadena en código, una fila legacy o una lista de interfaz no convierte un valor en `BaseRoleCode`.

---

#### 4. Línea base verificable

El estado vigente confirma:

| Elemento                                             | Estado                                                   |
| ---------------------------------------------------- | -------------------------------------------------------- |
| `packages/contracts`                                 | no materializado físicamente                             |
| `packages/os-context`                                | único package presente bajo `packages/`                  |
| `@vento/contracts/authorization`                     | definido documentalmente, no publicado físicamente       |
| `BaseRoleCode` compartido y consumido                | no materializado                                         |
| listas de roles locales / `ROLE_OPTIONS`             | legacy activo en consumidores auditados                  |
| roles base y operativos                              | todavía representados como strings en varias superficies |
| snapshot base `1.0.0`                                | aprobado, 499 registros, hash reproducible               |
| `trabajador_operativo` en catálogo lógico            | aprobado por `AUTH-MOD-021`                              |
| `trabajador_operativo` en catálogo físico desplegado | pendiente de materialización                             |
| cambios físicos autorizados por esta tarea           | ninguno                                                  |

La tarea resuelve el contrato. No crea todavía package, archivo de catálogo, tipos generados, migración, fila de Supabase ni adopción por consumidores.

---

#### 5. Identidad contractual de rol base

Un rol base representa una responsabilidad laboral permanente y una plantilla de capacidades base potenciales.

```text
ROL BASE
→ responsabilidad permanente
→ puede aportar concesiones base explícitas
→ no constituye autorización final
```

`BaseRoleCode` no representa:

- identidad laboral;
- cargo contractual completo;
- oficio operativo del turno;
- sede;
- área;
- aplicación;
- permiso;
- navegación;
- simulación;
- nivel jerárquico ejecutable;
- bypass.

Invariantes:

1. un empleado activo tiene exactamente un rol base vigente;
2. un rol base no crea turno ni check-in;
3. un rol base no crea rol operativo;
4. un rol base no amplía sedes o áreas por su nombre;
5. toda capacidad requiere permiso exacto, modalidad, contexto, recurso, alcance y ausencia de denegaciones aplicables;
6. ausencia de concesión continúa produciendo `DEFAULT_DENY`.

---

#### 6. Catálogo exacto de ocho roles

| Orden contractual | `role_code`               | Clasificación permanente           | Concesiones directas en `1.1.0` | Componentes base en `1.1.0` | Total lógico |
| ----------------: | ------------------------- | ---------------------------------- | ------------------------------: | --------------------------: | -----------: |
|                 1 | `propietario`             | Gobierno organizacional            |                             109 |                          12 |          121 |
|                 2 | `gerente_general`         | Gobierno organizacional            |                             107 |                          12 |          119 |
|                 3 | `gerente`                 | Administración territorial         |                              81 |                          12 |           93 |
|                 4 | `supervisor`              | Administración territorial         |                              58 |                           0 |           58 |
|                 5 | `auxiliar_administrativa` | Función permanente especializada   |                              47 |                           0 |           47 |
|                 6 | `contador`                | Función permanente especializada   |                              45 |                           0 |           45 |
|                 7 | `marketing`               | Función permanente especializada   |                              16 |                           0 |           16 |
|                 8 | `trabajador_operativo`    | Fuerza laboral puramente operativa |                               5 |                           0 |            5 |
|         **Total** | —                         | —                                  |                         **468** |                      **36** |      **504** |

No existe herencia entre estos roles.

```text
menos permisos
≠ menor identidad
≠ menor trazabilidad
```

---

#### 7. Contrato derivado `BaseRoleCode`

La proyección TypeScript deberá representar exactamente:

```text
type BaseRoleCode =
  | "propietario"
  | "gerente_general"
  | "gerente"
  | "supervisor"
  | "auxiliar_administrativa"
  | "contador"
  | "marketing"
  | "trabajador_operativo";
```

Reglas:

1. la unión es derivada del catálogo lógico versionado, no una lista mantenida manualmente;
2. un `string` externo solo se convierte en `BaseRoleCode` después de validación exacta contra la versión aplicable;
3. mayúsculas, espacios, traducciones, labels o semejanza textual no crean equivalencia;
4. un valor desconocido falla cerrado;
5. un código legacy no se transforma silenciosamente;
6. los consumidores no agregan miembros localmente;
7. una versión nueva del catálogo deberá producir de forma determinista la unión derivada correspondiente.

---

#### 8. Separación obligatoria de namespaces

Las siguientes identidades permanecen distintas:

```text
BaseRoleCode
≠ OperationalRoleCode
≠ NavigationRoleCode
≠ SimulationRoleCode
```

Un valor textual compartido no permite mezclar catálogos.

Caso normativo ya conocido:

```text
BASE/bodeguero
≠
OPERATIONAL/bodeguero
```

El primero corresponde a una asignación base legacy no canónica; el segundo puede identificar un rol operativo válido cuando el contexto operativo lo permite.

Ningún parser podrá resolver una identidad de rol sin conocer su catálogo o `role_kind` cuando exista posibilidad de colisión.

---

#### 9. Códigos excluidos del catálogo base

Los nueve oficios base legacy permanecen fuera de `BaseRoleCode`:

```text
barista
bodeguero
cajero
cocinero
conductor
mesero
panadero
pastelero
repostero
```

También permanecen fuera del catálogo objetivo de ocho roles los códigos documentales `logistica` y `talento_humano` que no forman parte de la decisión posterior de `AUTH-MOD-021`.

Reglas:

1. no se crea alias automático hacia `trabajador_operativo`;
2. no se infiere rol base desde oficio histórico;
3. no se copia la matriz legacy al nuevo rol;
4. no se deriva rol operativo por semejanza textual;
5. la migración se decide empleado por empleado;
6. un código no canónico no obtiene permisos por aparecer en datos históricos;
7. el valor anterior deberá conservarse como evidencia durante la futura migración.

---

#### 10. Relación con el catálogo de permisos

La introducción del octavo rol no modifica:

```text
catalog_id = vento.authorization
catalog_version = 1.0.0
active_permission_count = 140
```

No se crea ninguna clave de permiso nueva.

La relación es:

```text
BaseRoleCode
+
PermissionKey activa
+
fila exacta en dataset de concesiones
→ candidato de allow base
```

No:

```text
BaseRoleCode
→ todas las PermissionKey de una aplicación
```

Tampoco:

```text
prefijo parecido
→ permiso implícito
```

---

#### 11. Matriz mínima exacta de `trabajador_operativo`

`trabajador_operativo` recibe exactamente cinco concesiones base directas:

| `permission_key`                            | Modalidad   | `grant_type` lógico | Alcance  | Regla                                                                                              |
| ------------------------------------------- | ----------- | ------------------- | -------- | -------------------------------------------------------------------------------------------------- |
| `shell.access`                              | `BASE_ONLY` | `DIRECT_BASE`       | `NT-APP` | entrada al hub laboral; no concede otras aplicaciones ni capacidades internas                      |
| `anima.access`                              | `BASE_ONLY` | `DIRECT_BASE`       | `NT-APP` | entrada a ANIMA antes del turno; no administra trabajadores ni turnos y no crea check-in           |
| `anima.workforce.employee_documents.view`   | `BASE_ONLY` | `DIRECT_BASE`       | `OWN`    | únicamente documentos propios autorizados                                                          |
| `anima.workforce.employee_documents.upload` | `BASE_ONLY` | `DIRECT_BASE`       | `OWN`    | únicamente documentos propios de tipos habilitados para autoservicio y con controles de integridad |
| `anima.workforce.employee_photos.upload`    | `BASE_ONLY` | `DIRECT_BASE`       | `OWN`    | únicamente fotografía propia bajo el flujo aprobado                                                |

Resultado sobre el catálogo de 140 permisos:

```text
5 filas presentes
→ candidatos de allow base

135 filas ausentes
→ DEFAULT_DENY

0 OPERATIONAL_ONLY
0 BASE_COMPONENT
```

El rol no recibe por defecto capacidades de NEXO, FOGO, ORIGO, PULSO, VISO, NUMERA, AURA o PASS ni capacidades administrativas de ANIMA.

---

#### 12. Snapshot `1.0.0` preservado

El dataset anterior permanece inmutable:

```text
vento.authorization.base-role-grants@1.0.0
record_count = 499
role_count = 7
direct_base_count = 463
base_component_count = 36
dataset_hash = sha256:bcea5460dfea42ecd2491a550bfe511478faa5403d766166c9e731cb499214e1
```

La serialización canónica publicada por `AUTH-RBAC-024` reproduce exactamente esa huella.

`SHELL-CON-004` no edita una línea de `1.0.0`.

---

#### 13. Manifiesto exacto del sucesor `1.1.0`

El manifiesto lógico de `vento.authorization.base-role-grants@1.1.0` será:

```json
{"dataset_id":"vento.authorization.base-role-grants","dataset_version":"1.1.0","dataset_schema_version":"1.0.0","catalog_id":"vento.authorization","catalog_version":"1.0.0","catalog_schema_version":"1.0.0","contract_release_hash":"sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe","record_count":504,"role_count":8,"direct_base_count":468,"base_component_count":36,"effect":"ALLOW_ONLY"}
```

El esquema del dataset permanece `1.0.0` porque no cambia la forma de sus registros; cambia el contenido versionado mediante una adición compatible.

---

#### 14. Cinco registros nuevos serializados

Las cinco filas nuevas son exactamente:

```jsonl
{"grant_id":"base-role-grant:trabajador_operativo:anima.access","role_code":"trabajador_operativo","permission_key":"anima.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — entrada a la aplicación. No concede por sí sola acceso a recursos ni amplía las capacidades internas.","condition_expression":"Carril base. No requiere turno ni check-in. Permite abrir ANIMA antes del turno; no administra trabajadores ni turnos y no concede check-in.","source_task":"AUTH-MOD-021"}
{"grant_id":"base-role-grant:trabajador_operativo:anima.workforce.employee_documents.upload","role_code":"trabajador_operativo","permission_key":"anima.workforce.employee_documents.upload","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"OWN — únicamente recursos cuyo target_employee_id coincide con actor_employee_id.","condition_expression":"Carril base. Solo tipos documentales de autoservicio para el propio actor, con validación de formato, tamaño, hash y destino y trazabilidad de creación; no aprueba, valida ni elimina documentos.","source_task":"AUTH-MOD-021"}
{"grant_id":"base-role-grant:trabajador_operativo:anima.workforce.employee_documents.view","role_code":"trabajador_operativo","permission_key":"anima.workforce.employee_documents.view","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"OWN — únicamente recursos cuyo target_employee_id coincide con actor_employee_id.","condition_expression":"Carril base. Solo documentos propios cuya retención, sensibilidad y visibilidad permitan mostrarlos al empleado.","source_task":"AUTH-MOD-021"}
{"grant_id":"base-role-grant:trabajador_operativo:anima.workforce.employee_photos.upload","role_code":"trabajador_operativo","permission_key":"anima.workforce.employee_photos.upload","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"OWN — únicamente la fotografía laboral del propio actor.","condition_expression":"Carril base. Solo fotografía propia con formato y tamaño aprobados, flujo de revisión cuando corresponda y trazabilidad del reemplazo; no concede acceso a fotografías de terceros.","source_task":"AUTH-MOD-021"}
{"grant_id":"base-role-grant:trabajador_operativo:shell.access","role_code":"trabajador_operativo","permission_key":"shell.access","authorization_mode":"BASE_ONLY","lane":"BASE","grant_type":"DIRECT_BASE","effect":"ALLOW","scope_expression":"NT-APP — entrada a la aplicación. No concede por sí sola acceso a recursos ni amplía las capacidades internas.","condition_expression":"Carril base. No requiere turno ni check-in. Permite ingresar al hub laboral; no concede acceso a otras aplicaciones ni capacidades internas.","source_task":"AUTH-MOD-021"}
```

El orden anterior corresponde a `permission_key ASC` dentro de `role_code = trabajador_operativo`.

---

#### 15. Derivación determinista de `1.1.0`

El sucesor se deriva exclusivamente así:

```text
payload exacto de 1.0.0
+
validación de hash bcea5460...
+
actualización de los campos del manifiesto definidos en la sección 13
+
cinco registros exactos de la sección 14
+
orden role_code ASC, permission_key ASC
+
serialización de AUTH-RBAC-024
=
payload 1.1.0
```

Se mantienen las reglas de serialización:

- UTF-8 sin BOM;
- LF;
- manifiesto JSON compacto en la primera línea;
- registros JSON compactos;
- campos de registro en el mismo orden del schema `1.0.0`;
- orden `role_code ASC`, `permission_key ASC`;
- sin espacios finales;
- un único LF final;
- SHA-256 sobre todos los bytes;
- estado de aprobación y timestamp fuera del payload.

---

#### 16. Hash contractual de `1.1.0`

El resultado determinista es:

```text
dataset_hash = sha256:5fcde3858d5fc6ba1c210987962e32b3e2d535dc286b225b1ddb6ba4b0bb06d0
```

La huella corresponde a:

```text
504 registros
8 roles
468 DIRECT_BASE
36 BASE_COMPONENT
0 OPERATIONAL_ONLY
0 DENY
```

Cualquier cambio en una de las cinco filas, en el manifiesto, en un registro heredado o en el orden/serialización deberá producir una versión distinta y una huella distinta.

---

#### 17. Conciliación cuantitativa de `1.1.0`

##### Por modalidad

| Modalidad              | Registros |
| ---------------------- | --------: |
| `BASE_ONLY`            |   **256** |
| `BASE_OR_OPERATIONAL`  |   **212** |
| `BASE_AND_OPERATIONAL` |    **36** |
| `OPERATIONAL_ONLY`     |     **0** |
| **Total**              |   **504** |

##### Por aplicación

| Aplicación | Registros base |
| ---------- | -------------: |
| `shell`    |          **8** |
| `anima`    |         **52** |
| `aura`     |          **3** |
| `fogo`     |         **19** |
| `nexo`     |        **251** |
| `numera`   |         **27** |
| `origo`    |         **31** |
| `pass`     |          **2** |
| `pulso`    |         **18** |
| `viso`     |         **93** |
| **Total**  |        **504** |

Conciliación del delta:

```text
1 shell.access
+
4 anima.*
=
5 registros nuevos
```

---

#### 18. Validaciones contractuales obligatorias del dataset

La futura materialización deberá comprobar como mínimo:

1. `record_count = 504`;
2. `role_count = 8`;
3. 504 pares únicos `role_code + permission_key`;
4. 468 `DIRECT_BASE`;
5. 36 `BASE_COMPONENT`;
6. 256 `BASE_ONLY`;
7. 212 `BASE_OR_OPERATIONAL`;
8. 36 `BASE_AND_OPERATIONAL`;
9. 0 `OPERATIONAL_ONLY`;
10. 0 `DENY`;
11. exactamente cinco filas para `trabajador_operativo`;
12. las cinco filas son las cinco claves aprobadas y ninguna otra;
13. las 135 claves restantes están ausentes para ese rol;
14. ninguna fila contiene un oficio base legacy;
15. `logistica` y `talento_humano` no aparecen como `role_code` del catálogo objetivo;
16. todas las `permission_key` existen entre las 140 claves activas;
17. todo `BASE_COMPONENT` sigue correspondiendo a `BASE_AND_OPERATIONAL`;
18. no existen wildcards;
19. no se crea alias hacia `trabajador_operativo`;
20. el hash es `sha256:5fcde3858d5fc6ba1c210987962e32b3e2d535dc286b225b1ddb6ba4b0bb06d0`.

---

#### 19. Integración con `AccessContext`

`AccessContext@1.x` conserva su forma.

Cuando la materialización física y la asignación explícita existan, el nodo base podrá representar:

```text
role_code = trabajador_operativo
role_status = ACTIVE
assignment_source = CANONICAL_EMPLOYEE_BASE_ROLE_ASSIGNMENT
```

Reglas:

1. `employee.base_role_code` y `base_role.role_code` deberán coincidir;
2. el nodo no transporta la matriz completa;
3. el evaluador resuelve el snapshot versionado de concesiones;
4. un código legacy no se proyecta como `trabajador_operativo` por inferencia;
5. la ausencia de una fila produce `base_allow_not_found` o el diagnóstico equivalente aprobado por el evaluador;
6. permisos `OPERATIONAL_ONLY` no obtienen allow desde este rol base;
7. un turno válido puede aportar autoridad operativa únicamente por el carril operativo correspondiente.

---

#### 20. Validación de entradas y consumidores

Toda frontera que reciba un rol base como texto deberá aplicar:

```text
valor externo
→ resolver versión de catálogo
→ validar pertenencia exacta
→ BaseRoleCode o rechazo
```

Queda prohibido:

- aceptar cualquier string no vacío;
- usar labels humanos como código;
- normalizar un oficio legacy hacia otro rol;
- usar `ROLE_OPTIONS` de interfaz como autoridad de servidor;
- derivar rol base desde `navigation_role`;
- derivar rol base desde rol operativo;
- agregar miembros localmente;
- permitir un valor desconocido como fallback.

Los consumidores se migrarán de forma gradual y reversible mediante `SHELL-AUTH-001`, `SHELL-AUTH-002`, `SHELL-AUTH-003`, `SHELL-AUTH-004`, `SHELL-AUTH-005`, `SHELL-CTX-001`, `SHELL-CTX-002`, `SHELL-CTX-003`, `SHELL-CTX-004`, `SHELL-CTX-005`, `SHELL-CTX-006`, `SHELL-MIG-001`, `SHELL-MIG-002`, `SHELL-MIG-003`, `SHELL-MIG-004`, `SHELL-MIG-005`, `SHELL-MIG-006`, `SHELL-MIG-007` y `SHELL-MIG-008`, sin exigir un corte simultáneo de todos los repositorios.

---

#### 21. Versionado y compatibilidad

La evolución aprobada es aditiva:

```text
catálogo lógico de roles base 1.0.0
→ 1.1.0

dataset base-role-grants 1.0.0
→ 1.1.0

catálogo de permisos
→ permanece vento.authorization@1.0.0
```

Reglas:

1. `1.0.0` permanece disponible e inmutable mientras exista un consumidor soportado que lo requiera;
2. ningún consumidor de `1.0.0` recibe `trabajador_operativo` por sorpresa;
3. un consumidor que adopte `1.1.0` deberá aceptar el octavo código y las cinco filas exactas;
4. no se muta una versión publicada;
5. rollback selecciona una combinación soportada y no reescribe bytes históricos;
6. el cambio de catálogo lógico y el cambio de dataset se coordinan sin alterar `PermissionKey`.

---

#### 22. Estado de materialización física

En el corte vigente:

```text
SHELL-CON-004
→ contrato completo
→ identidad de 8 roles cerrada
→ BaseRoleCode cerrado
→ dataset 1.1.0 definido y hasheado
→ sin archivo físico publicado
→ sin package @vento/contracts materializado
→ sin migración
→ sin cambio de Supabase
→ sin cambio de empleados
→ sin adopción de consumidores
```

`trabajador_operativo` no se utilizará como rol base físico válido hasta completar la materialización, migración y validación correspondientes.

---

#### 23. Hallazgos y destinos exactos

| Hallazgo                                                               | Estado                       | Destino exacto / condición de salida                                                         |
| ---------------------------------------------------------------------- | ---------------------------- | -------------------------------------------------------------------------------------------- |
| `@vento/contracts` no existe físicamente                               | esperado por fase            | `E5-GATE-008::<package_id>` y `SHELL-CI-020`                                                 |
| `BaseRoleCode` compartido no está materializado                        | pendiente de implementación  | `SHELL-AUTH-001`; `SHELL-AUTH-004`; `SHELL-AUTH-005`; `SHELL-MIG-001` a `SHELL-MIG-008`      |
| `trabajador_operativo` no está publicado físicamente                   | pendiente de materialización | `AUTH-DB-020`; `AUTH-DB-026`; `AUTH-DB-033`; `AUTH-DB-034`; `SHELL-CTX-001`                  |
| empleados con oficios base legacy requieren reconciliación individual  | pendiente de migración       | `SUPA-TRANS-005`; `AUTH-DB-020`; retiro controlado en `AUTH-DB-030`                          |
| consumers mantienen roles como strings y listas locales                | legacy activo                | `SHELL-AUTH-004`; `SHELL-AUTH-005`; `SHELL-MIG-001` a `SHELL-MIG-008`                        |
| `AccessContext@1.x` debe resolver el nuevo código sin cambiar de forma | pendiente de implementación  | `SHELL-CON-007`; `SHELL-CTX-001`; `AUTH-DB-033`                                              |
| las capacidades personales sin PermissionKey atómica siguen ausentes   | brecha preservada            | `GAP-CTRL-001`; `GAP-CTRL-003`; `GAP-CTRL-004`; `GAP-CTRL-006`; `AUTH-UI-030`; `AUTH-UI-031` |
| dataset `1.1.0` requiere certificación física de hash y contenido      | pendiente de implementación  | `AUTH-DB-027`; `AUTH-QA-030`; `SHELL-CI-017`; `SHELL-CI-018`                                 |
| roles operativos todavía no están centralizados por esta secuencia     | reservado                    | `SHELL-CON-005`                                                                              |

No se crea ningún identificador de tarea nuevo. Todos los pendientes conservan propietario documental existente.

---

#### 24. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se crea `TREQ-SHELL-040` para proteger la centralización exacta de los ocho roles base, la ausencia de aliases/fallbacks legacy y la integridad determinista de `vento.authorization.base-role-grants@1.1.0`.

| ID               | Regla protegida                                                                                                                                                                                                                                                                                                                                                       | Tipo                                                            | Prioridad | Momento de implementación                                                             | Destino                                                                           |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------- | --------- | ------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| `TREQ-SHELL-040` | La fuente compartida deberá exponer exactamente los ocho `BaseRoleCode`; `trabajador_operativo` deberá aportar exclusivamente cinco concesiones `BASE_ONLY`, el dataset `1.1.0` deberá contener 504 registros —468 directos y 36 componentes— y reproducir la huella aprobada, sin oficios base legacy, aliases, fallbacks ni cambios en `vento.authorization@1.0.0`. | contractual + autorización + estática + integración + regresión | crítica   | materialización de `@vento/contracts`, SDK y dataset; certificación antes de adopción | `SHELL-CON-004`; `SHELL-AUTH-001`; `SHELL-AUTH-004`; `AUTH-DB-027`; `AUTH-QA-030` |

---

#### 25. Decisiones vinculantes

1. el catálogo lógico objetivo contiene exactamente ocho roles base;
2. `trabajador_operativo` es el octavo rol base canónico;
3. `BaseRoleCode` contiene exactamente esos ocho códigos;
4. `BaseRoleCode` se genera y no se mantiene mediante listas manuales;
5. rol base y rol operativo permanecen en namespaces distintos;
6. `logistica` y `talento_humano` no pertenecen al catálogo objetivo de ocho roles;
7. los nueve oficios base legacy permanecen fuera de `BaseRoleCode`;
8. no existe conversión automática de oficios legacy;
9. no existe alias automático hacia `trabajador_operativo`;
10. `trabajador_operativo` recibe exactamente cinco concesiones directas;
11. las cinco concesiones son `BASE_ONLY`;
12. el rol recibe cero permisos `OPERATIONAL_ONLY`;
13. el rol recibe cero `BASE_COMPONENT`;
14. las otras 135 claves permanecen ausentes y en `DEFAULT_DENY`;
15. el catálogo `vento.authorization@1.0.0` no cambia;
16. `base-role-grants@1.0.0` permanece inmutable con hash `bcea5460...`;
17. `base-role-grants@1.1.0` contiene 504 registros;
18. `1.1.0` contiene 468 `DIRECT_BASE` y 36 `BASE_COMPONENT`;
19. el schema del dataset permanece `1.0.0`;
20. el hash de `1.1.0` es `sha256:5fcde3858d5fc6ba1c210987962e32b3e2d535dc286b225b1ddb6ba4b0bb06d0`;
21. `AccessContext@1.x` conserva su forma;
22. `trabajador_operativo` solo será físicamente válido después de publicación y asignación explícita;
23. esta tarea no crea package, código, migración, Supabase, asignaciones ni adopción;
24. se crea `TREQ-SHELL-040`;
25. `SHELL-CON-005` permanece como única continuidad reservada.

---

#### 26. Criterios de aceptación

`SHELL-CON-004` queda materialmente completa porque:

- concilia exactamente ocho roles base;
- preserva sin cambio los siete roles existentes;
- incorpora únicamente `trabajador_operativo`;
- materializa la unión derivada exacta `BaseRoleCode`;
- separa roles base, operativos, de navegación y simulación;
- excluye los nueve oficios legacy;
- excluye `logistica` y `talento_humano` del catálogo objetivo vigente;
- prohíbe aliases, fallback y conversión automática;
- conserva las 140 `PermissionKey` activas sin modificación;
- fija las cinco concesiones exactas del nuevo rol;
- concilia 5 grants, 0 componentes y 135 ausencias para `trabajador_operativo`;
- conserva inmutable `base-role-grants@1.0.0`;
- define el manifiesto exacto de `base-role-grants@1.1.0`;
- define las cinco filas nuevas exactas y ordenadas;
- conserva las reglas de serialización de `AUTH-RBAC-024`;
- reproduce 504 registros, 468 directos y 36 componentes;
- concilia 256 `BASE_ONLY`, 212 `BASE_OR_OPERATIONAL` y 36 `BASE_AND_OPERATIONAL`;
- concilia la distribución por aplicaciones a 504 registros;
- calcula la huella determinista `sha256:5fcde3858d5fc6ba1c210987962e32b3e2d535dc286b225b1ddb6ba4b0bb06d0`;
- conserva `AccessContext@1.x` sin cambio de forma;
- asigna todos los pendientes a tareas existentes;
- crea únicamente `TREQ-SHELL-040` como requisito nuevo;
- no implementa código, package, migración, Supabase, datos ni consumidores;
- deja `SHELL-CON-005` como única tarea siguiente reservada.

---

#### 27. Continuidad

##### ÚLTIMA TAREA APROBADA
SHELL-CON-003 — Centralizar códigos de permisos

##### TAREA ACTUAL APROBADA
SHELL-CON-004 — Centralizar roles base

##### SIGUIENTE TAREA RESERVADA
SHELL-CON-005 — Centralizar roles operativos


### ✅ SHELL-CON-005 — Centralizar roles operativos

**Estado:** APROBADA
**Tarea anterior:** SHELL-CON-004 — Centralizar roles base
**Tarea siguiente:** SHELL-CON-006 — Centralizar scopes
**Tipo de tarea:** Documental
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 1

---

#### 1. Propósito

`SHELL-CON-005` centraliza la identidad contractual de los roles operativos de Vento OS sin modificar el catálogo operativo ni mutar el dataset aprobado `vento.authorization.operational-role-grants@1.0.0`.

La tarea fija simultáneamente:

1. el conjunto exacto de doce roles operativos canónicos;
2. la unión derivada `OperationalRoleCode`;
3. la separación entre rol operativo, rol base, aplicación, sede, área, turno, check-in, permiso y autoridad efectiva;
4. la exclusión explícita de `propietario_admin`, roles base, códigos legacy, retirados o desconocidos;
5. la relación exacta con `vento.authorization.operational-role-grants@1.0.0`;
6. la preservación del snapshot de 240 concesiones y su huella contractual;
7. las reglas de validación de entradas y de consumo compartido;
8. las reglas de compatibilidad, adopción gradual y fallo cerrado;
9. el tratamiento de colisiones textuales entre catálogos;
10. los destinos existentes de materialización, adopción y certificación.

La regla central es:

```text
CATÁLOGO CANÓNICO DE ROLES OPERATIVOS
→ OperationalRoleCode derivado
→ dataset versionado de concesiones operativas
→ contexto operativo efectivo
→ evaluadores / consumidores

NOMBRE DE ROL OPERATIVO
≠ permiso
≠ turno
≠ check-in
≠ sede
≠ área
≠ autorización final
```

---

#### 2. Resultado canónico

Se centralizan exactamente doce identidades operativas canónicas:

```text
cajero_satelite
barista_satelite
cocinero_satelite
servicio_salon
mostrador_satelite
operador_integral_satelite
produccion_cocina
produccion_panaderia
produccion_reposteria
bodeguero
conductor_logistica
gerencia_operativa
```

Conciliación:

| Dimensión                                     | Resultado |
| --------------------------------------------- | --------: |
| Roles operativos canónicos                    |    **12** |
| Roles nuevos creados por esta tarea           |     **0** |
| Roles operativos retirados por esta tarea     |     **0** |
| Roles base incorporados al catálogo operativo |     **0** |
| Códigos legacy incorporados                   |     **0** |
| Permisos nuevos                               |     **0** |
| Concesiones nuevas                            |     **0** |
| Concesiones modificadas                       |     **0** |
| Dataset operativo nuevo                       |     **0** |
| Snapshot operativo preservado                 |     **1** |

La centralización cambia la forma de referenciar la identidad compartida. No cambia el significado ni la matriz aprobada de ninguno de los doce roles.

---

#### 3. Fuentes y precedencia

Esta tarea conserva sin reinterpretar las siguientes fuentes aprobadas:

| Fuente                                              | Uso vinculante                                                                                                |
| --------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`        | continuidad, granularidad, trazabilidad y requisitos de prueba                                                |
| `docs/plan-canonico/modular/delivery-contract.json` | estructura del artefacto documental y del registro 04A                                                        |
| `docs/plan-canonico/modular/active-sequence.json`   | secuencia vigente del BLOQUE H                                                                                |
| `SHELL-CON-001`                                     | identidad y frontera de `@vento/contracts`                                                                    |
| `SHELL-CON-002`                                     | catálogo compartido de aplicaciones                                                                           |
| `SHELL-CON-003`                                     | `PermissionKey` y prohibición de claves locales como autoridad                                                |
| `SHELL-CON-004`                                     | `BaseRoleCode`, separación de namespaces y catálogo de ocho roles base                                        |
| `AUTH-MOD-020` / `ADR-AUTH-001`                     | separación canónica entre rol base y rol operativo; doce roles operativos; deprecación de `propietario_admin` |
| `AUTH-RBAC-025`                                     | dataset `operational-role-grants@1.0.0`, esquema, conteos, serialización y hash                               |
| `AUTH-RBAC-027`                                     | validación documental de ausencia de acceso global accidental y reconciliación de los 240 registros           |
| `AUTH-CAT-024`                                      | catálogo activo `vento.authorization@1.0.0` de 140 permisos                                                   |
| `SHELL-AUD-009`                                     | necesidad de tipos contractuales separados para roles base y operativos                                       |
| `SHELL-AUD-010`                                     | disposición de centralización/generación de contratos compartidos                                             |
| Registro Canónico de Requisitos de Prueba           | cobertura vigente de autorización, contratos, compatibilidad y CI                                             |

Precedencia específica:

```text
ADR-AUTH-001
→ define el catálogo operativo canónico

AUTH-RBAC-025
→ congela sus 240 concesiones en operational-role-grants@1.0.0

AUTH-RBAC-027
→ valida ausencia de globalidad accidental y coherencia del snapshot

SHELL-CON-005
→ centraliza la identidad OperationalRoleCode
→ preserva el snapshot sin crear una versión artificial
```

Una lista local, una fila física heredada o un valor textual enviado por un cliente no sustituye estas fuentes.

---

#### 4. Línea base verificable

El estado previo confirma:

| Elemento                                   | Estado                                                     |
| ------------------------------------------ | ---------------------------------------------------------- |
| `packages/contracts`                       | no materializado físicamente                               |
| `packages/os-context`                      | package físico parcial existente                           |
| `@vento/contracts/authorization`           | definido documentalmente, no publicado físicamente         |
| `OperationalRoleCode` compartido           | no materializado                                           |
| `OperationalContext.roleId`                | string técnico parcial, no catálogo contractual compartido |
| roles operativos físicos                   | existen mediante migraciones y tablas operativas           |
| snapshot `operational-role-grants@1.0.0`   | aprobado documentalmente                                   |
| `propietario_admin`                        | no canónico y en deprecación según ADR                     |
| cambios físicos autorizados por esta tarea | ninguno                                                    |

La existencia física de códigos en Supabase no los convierte en API contractual compartida. Esta tarea define la identidad que deberán consumir las implementaciones futuras sin modificar datos ni migraciones.

---

#### 5. Naturaleza de un rol operativo

Un rol operativo representa una función temporal ejecutada dentro de un contexto operacional válido.

```text
EMPLEADO
+
TURNO PUBLICADO Y VIGENTE
+
CHECK-IN ACTIVO CUANDO APLIQUE
+
ROL OPERATIVO EFECTIVO
+
SEDE COMPATIBLE
+
ÁREA COMPATIBLE
+
PERMISO OPERATIVO
+
RECURSO Y ALCANCE VÁLIDOS
+
AUSENCIA DE DENEGACIONES
→ AUTORIZACIÓN OPERATIVA POSIBLE
```

El rol operativo por sí solo no constituye autoridad.

`OperationalRoleCode` no representa:

- identidad laboral;
- rol base;
- sede;
- área;
- turno;
- check-in;
- dispositivo;
- aplicación;
- permiso;
- scope;
- decisión final;
- rol de navegación;
- simulación;
- bypass administrativo.

---

#### 6. Catálogo exacto de doce roles

|     Orden | `operational_role_code`      | Familia funcional      | Concesiones directas | Componentes operativos | Total lógico |
| --------: | ---------------------------- | ---------------------- | -------------------: | ---------------------: | -----------: |
|         1 | `cajero_satelite`            | operación satélite     |                   15 |                      5 |           20 |
|         2 | `barista_satelite`           | operación satélite     |                   11 |                      0 |           11 |
|         3 | `cocinero_satelite`          | operación satélite     |                   11 |                      0 |           11 |
|         4 | `servicio_salon`             | operación satélite     |                   11 |                      0 |           11 |
|         5 | `mostrador_satelite`         | operación satélite     |                   11 |                      0 |           11 |
|         6 | `operador_integral_satelite` | operación satélite     |                   16 |                      5 |           21 |
|         7 | `produccion_cocina`          | producción             |                   16 |                      0 |           16 |
|         8 | `produccion_panaderia`       | producción             |                   16 |                      0 |           16 |
|         9 | `produccion_reposteria`      | producción             |                   16 |                      0 |           16 |
|        10 | `bodeguero`                  | logística              |                   36 |                      0 |           36 |
|        11 | `conductor_logistica`        | logística              |                   16 |                      0 |           16 |
|        12 | `gerencia_operativa`         | coordinación operativa |                   43 |                     12 |           55 |
| **Total** | —                            | —                      |              **218** |                 **22** |      **240** |

Estas familias son clasificación documental. No crean jerarquía, herencia ni permiso implícito entre roles.

---

#### 7. Contrato derivado `OperationalRoleCode`

La proyección TypeScript deberá representar exactamente:

```text
type OperationalRoleCode =
  | "cajero_satelite"
  | "barista_satelite"
  | "cocinero_satelite"
  | "servicio_salon"
  | "mostrador_satelite"
  | "operador_integral_satelite"
  | "produccion_cocina"
  | "produccion_panaderia"
  | "produccion_reposteria"
  | "bodeguero"
  | "conductor_logistica"
  | "gerencia_operativa";
```

Reglas:

1. la unión deriva del catálogo operativo canónico y no de una lista mantenida por cada aplicación;
2. un `string` externo solo podrá convertirse en `OperationalRoleCode` después de validación exacta;
3. mayúsculas, espacios, labels, traducciones o semejanza textual no crean equivalencia;
4. un valor desconocido, inactivo, deprecado o perteneciente a otro catálogo falla cerrado;
5. los consumidores no podrán agregar miembros localmente;
6. una lista visual de roles no constituye la fuente del tipo;
7. el tipo no transporta la matriz de permisos ni el contexto efectivo.

---

#### 8. Separación obligatoria de namespaces

Se conserva:

```text
OperationalRoleCode
≠ BaseRoleCode
≠ NavigationRoleCode
≠ SimulationRoleCode
≠ PermissionKey
≠ AppCode
```

Una colisión textual no fusiona identidades.

Caso vinculante:

```text
BASE/bodeguero
≠
OPERATIONAL/bodeguero
```

El código base histórico `bodeguero` no es `BaseRoleCode` vigente. `OPERATIONAL/bodeguero` sí pertenece al catálogo operativo canónico cuando se resuelve dentro del carril y contexto correctos.

Toda frontera que pueda recibir valores de más de un catálogo deberá conservar el `role_kind` o equivalente contractual suficiente para resolver la identidad sin ambigüedad.

---

#### 9. Exclusiones del catálogo operativo

Quedan fuera de `OperationalRoleCode`:

```text
propietario_admin
propietario
gerente_general
gerente
supervisor
auxiliar_administrativa
contador
marketing
trabajador_operativo
```

También quedan fuera:

- cualquier oficio base legacy tratado como rol base histórico;
- códigos retirados o deprecados;
- aliases visuales;
- nombres humanos de cargo;
- códigos futuros no aprobados;
- valores desconocidos.

Reglas:

1. `propietario_admin` no recibe nuevos turnos ni nuevos permisos;
2. ningún `BaseRoleCode` se convierte automáticamente en `OperationalRoleCode`;
3. un rol base con responsabilidad administrativa puede además tener un rol operativo, pero son dos contextos distintos;
4. no se crean roles híbridos como `gerente_cajero` o `supervisor_bodeguero`;
5. una coincidencia de texto no autoriza migración ni alias.

---

#### 10. Dataset operativo canónico preservado

La identidad de la matriz operativa permanece:

```text
dataset_id = vento.authorization.operational-role-grants
dataset_version = 1.0.0
dataset_schema_version = 1.0.0
catalog_id = vento.authorization
catalog_version = 1.0.0
record_count = 240
operational_role_count = 12
direct_operational_count = 218
operational_component_count = 22
effect = ALLOW_ONLY
dataset_hash = sha256:3e28cb780c346fbc5cf583fe9cf20d1a88333c4fd459fc233380d9e627c6f94f
```

`SHELL-CON-005` no modifica una fila de este dataset.

No se crea `1.1.0` porque:

- no cambia el catálogo operativo;
- no cambia una concesión;
- no cambia el schema;
- no cambia una modalidad;
- no cambia la serialización;
- no cambia el significado de un rol.

Crear una versión nueva sin cambio distribuible produciría versionado artificial y rompería la regla de inmutabilidad y trazabilidad ya aprobada para packages y datasets.

---

#### 11. Esquema lógico de concesiones operativas

El snapshot preserva el esquema aprobado:

```text
grant_id
operational_role_code
permission_key
authorization_mode
lane
grant_type
effect
scope_expression
condition_expression
source_task
```

Invariantes:

1. `lane = OPERATIONAL`;
2. `effect = ALLOW` para las 240 filas;
3. `grant_type` es `DIRECT_OPERATIONAL` u `OPERATIONAL_COMPONENT`;
4. `OperationalRoleCode` identifica la plantilla; no reemplaza `PermissionKey`;
5. `scope_expression` y `condition_expression` permanecen parte de la concesión y no se deducen del nombre del rol;
6. el significado de las filas continúa gobernado por su versión y por el catálogo de permisos vigente.

---

#### 12. Conciliación cuantitativa del snapshot

##### Por tipo de concesión

| Tipo                    | Registros |
| ----------------------- | --------: |
| `DIRECT_OPERATIONAL`    |   **218** |
| `OPERATIONAL_COMPONENT` |    **22** |
| **Total**               |   **240** |

##### Por modalidad

| Modalidad              | Registros |
| ---------------------- | --------: |
| `BASE_OR_OPERATIONAL`  |   **174** |
| `OPERATIONAL_ONLY`     |    **44** |
| `BASE_AND_OPERATIONAL` |    **22** |
| `BASE_ONLY`            |     **0** |
| **Total**              |   **240** |

##### Por aplicación

| Aplicación | Registros operativos |
| ---------- | -------------------: |
| `fogo`     |               **19** |
| `nexo`     |              **181** |
| `origo`    |                **9** |
| `pulso`    |               **31** |
| **Total**  |              **240** |

La suma de cada vista reproduce el mismo snapshot y no crea una fuente paralela.

---

#### 13. Componentes operativos

Los 22 `OPERATIONAL_COMPONENT` permanecen asociados exclusivamente a permisos `BASE_AND_OPERATIONAL`.

Distribución aprobada:

```text
gerencia_operativa heredado
→ 5 componentes

PULSO sensible
→ cajero_satelite
→ operador_integral_satelite
→ gerencia_operativa
→ 15 componentes

NEXO variación de conteo
→ gerencia_operativa
→ 2 componentes

TOTAL
→ 22
```

Un componente operativo no es un segundo permiso ni un alias. Expresa una parte obligatoria de una decisión compuesta cuyo otro componente deberá resolverse en el carril correspondiente.

---

#### 14. Regla de autoridad contextual

Una fila operativa representa una capacidad candidata, no una autorización ejecutable aislada.

```text
OperationalRoleCode válido
+
concesión exacta
+
actor efectivo
+
turno publicado y vigente
+
check-in cuando aplique
+
sede compatible
+
área compatible
+
recurso real
+
scope válido
+
ausencia de denegaciones
→ decisión operativa posible
```

Por tanto:

```text
OperationalRoleCode válido
+
sin turno/contexto exigido
→ DENY
```

```text
OperationalRoleCode válido
+
permiso no concedido al rol
→ DEFAULT_DENY
```

```text
rol operativo expirado o fuera de sede/área
→ DENY
```

La autoridad operativa termina cuando termina el contexto operacional que la soporta.

---

#### 15. Prohibición de globalidad accidental

`AUTH-RBAC-027` se conserva como validación vinculante.

Ningún rol operativo obtiene por su código:

- autoridad organizacional global;
- cobertura de todas las sedes;
- cobertura de todas las áreas;
- todos los recursos;
- todos los permisos de una aplicación;
- bypass de turno;
- bypass de check-in;
- bypass de scope;
- bypass de denegaciones.

Marcadores de globalidad o equivalentes no se interpretan desde el nombre del rol.

`gerencia_operativa` coordina operación; no se convierte en `gerente_general`, `propietario` ni administrador global.

---

#### 16. Legado de remisiones sin alias

El snapshot aprobado retiró del rol `conductor_logistica` la clave legacy:

```text
nexo.inventory.remissions.dispatch
```

Su reemplazo funcional no constituye un alias uno-a-uno. La operación quedó descompuesta en capacidades explícitas de custodia, tránsito y entrega conforme al dataset aprobado.

Reglas:

1. `dispatch` no reaparece como `PermissionKey` de concesión operativa;
2. no se transforma automáticamente en una de las nuevas claves;
3. un consumidor que todavía use el identificador legacy deberá migrarse mediante su tarea propietaria;
4. la ausencia del identificador legacy en el snapshot no autoriza fallback textual ni compatibilidad silenciosa.

---

#### 17. Relación con `PermissionKey`

`OperationalRoleCode` y `PermissionKey` permanecen contratos ortogonales:

```text
OperationalRoleCode
→ identifica plantilla operativa

PermissionKey
→ identifica capacidad empresarial
```

La relación válida procede exclusivamente de `operational-role-grants@1.0.0` o de una versión posterior aprobada.

Queda prohibido:

- inferir permisos por prefijo del rol;
- inferir permisos por aplicación asociada visualmente;
- construir claves desde el nombre del rol;
- asumir que todos los roles de una familia comparten permisos;
- convertir una lista local de navegación en matriz de autorización.

El catálogo `vento.authorization@1.0.0` permanece sin cambio.

---

#### 18. Relación con `BaseRoleCode`

Un mismo empleado puede conservar simultáneamente:

```text
exactamente un BaseRoleCode vigente
+
cero o un OperationalRoleCode efectivo en un contexto dado
```

Esto no crea un rol híbrido.

Ejemplos conceptuales válidos ya establecidos por la ADR:

```text
propietario + gerencia_operativa
gerente_general + gerencia_operativa
gerente + cajero_satelite
supervisor + bodeguero
auxiliar_administrativa + operador_integral_satelite
```

La matriz base y la matriz operativa se evalúan por carriles distintos y se combinan únicamente conforme a la modalidad exacta del permiso.

---

#### 19. Relación con sede, área, turno y check-in

`OperationalRoleCode` no incorpora territorio ni estado temporal.

```text
OperationalRoleCode
≠ site_id
≠ area_id
≠ shift_id
≠ attendance/check-in
```

La elegibilidad y efectividad de un rol operativo deberán reconstruirse desde las fuentes de contexto aprobadas.

Reglas:

1. una sede seleccionada en UI no crea sede operativa;
2. una sede primaria no crea autoridad operativa;
3. un rol no determina por sí solo un área;
4. un check-in aislado no sustituye un turno válido cuando este sea obligatorio;
5. una rotación o cierre de turno obliga a recalcular la autoridad efectiva;
6. el cliente no puede declarar que un rol está operativo mediante un campo local.

`SHELL-CON-006` centralizará los scopes sin alterar la identidad de los doce roles definida aquí.

---

#### 20. Validación de entradas

Toda frontera que reciba un rol operativo como texto deberá aplicar:

```text
valor externo
→ identificar catálogo/carril
→ validar código exacto
→ validar estado y versión aplicables
→ OperationalRoleCode o rechazo
```

Queda prohibido:

- aceptar cualquier string no vacío;
- convertir `propietario_admin` en `gerencia_operativa`;
- convertir un `BaseRoleCode` en rol operativo;
- convertir un oficio base legacy por semejanza;
- usar `navigation_role` como rol efectivo;
- tomar el primer rol coincidente;
- tolerar un valor desconocido como fallback;
- confiar en una lista enviada por el cliente como fuente de identidad.

La validación contractual del código no sustituye la validación del contexto operacional completo.

---

#### 21. Superficie compartida objetivo

`OperationalRoleCode` pertenece a la superficie contractual de autorización ya reservada dentro de `@vento/contracts`.

La futura materialización deberá exponer, como mínimo, proyecciones derivadas equivalentes a:

```text
OperationalRoleCode
OPERATIONAL_ROLE_CODES
isOperationalRoleCode(value)
```

Estas proyecciones deberán generarse o verificarse contra la fuente canónica y no convertirse en una segunda fuente editable.

Esta tarea no crea un subpath público nuevo. La ubicación pública sigue gobernada por la superficie `@vento/contracts/authorization` definida previamente.

---

#### 22. Compatibilidad de consumidores

La adopción será gradual.

Un consumidor antiguo podrá seguir recibiendo strings durante una ventana de migración, pero deberá validarlos en la frontera antes de tratarlos como identidad operativa.

Un consumidor que adopte el contrato compartido deberá:

1. aceptar exactamente los doce códigos;
2. rechazar `propietario_admin` y valores ajenos al catálogo;
3. no mantener una lista divergente;
4. no asociar permisos localmente por nombre;
5. preservar la separación base/operativa;
6. resolver contexto, scope y autorización fuera del tipo de identidad;
7. participar en la matriz de compatibilidad antes de una publicación estable.

La actualización de un consumidor no exige actualización simultánea de todos los repositorios.

---

#### 23. Versionado e inmutabilidad

Esta tarea no crea una nueva versión del dataset operativo.

```text
operational-role-grants@1.0.0
→ permanece 1.0.0
→ permanece inmutable
```

Una versión nueva solo será necesaria cuando cambie materialmente alguno de estos elementos:

- catálogo de roles operativos;
- concesiones;
- modalidad;
- scope o condición contractual;
- schema;
- serialización contractual;
- semántica distribuida.

Cambiar únicamente el lugar desde el cual se importa `OperationalRoleCode` no modifica el dataset.

La huella preservada es:

```text
sha256:3e28cb780c346fbc5cf583fe9cf20d1a88333c4fd459fc233380d9e627c6f94f
```

---

#### 24. Validaciones contractuales obligatorias

La futura materialización deberá comprobar como mínimo:

1. exactamente 12 `OperationalRoleCode`;
2. exactamente 240 concesiones;
3. 240 pares únicos `operational_role_code + permission_key`;
4. 218 `DIRECT_OPERATIONAL`;
5. 22 `OPERATIONAL_COMPONENT`;
6. 174 `BASE_OR_OPERATIONAL`;
7. 44 `OPERATIONAL_ONLY`;
8. 22 `BASE_AND_OPERATIONAL`;
9. 0 `BASE_ONLY`;
10. 0 filas `DENY` dentro del dataset positivo;
11. 0 roles base dentro del dataset operativo;
12. 0 `propietario_admin`;
13. 0 claves legacy bloqueadas;
14. 0 `nexo.inventory.remissions.dispatch`;
15. todas las `permission_key` pertenecen al catálogo activo aplicable;
16. todo `OPERATIONAL_COMPONENT` usa `BASE_AND_OPERATIONAL`;
17. 0 wildcards o scopes globales inferidos;
18. 0 aliases o fallbacks entre catálogos;
19. la distribución por rol suma 240;
20. la distribución por aplicación suma 240;
21. la huella contractual permanece `sha256:3e28cb780c346fbc5cf583fe9cf20d1a88333c4fd459fc233380d9e627c6f94f` mientras el snapshot sea `1.0.0`.

---

#### 25. Estado de materialización física

En el corte vigente:

```text
SHELL-CON-005
→ contrato completo
→ identidad de 12 roles cerrada
→ OperationalRoleCode cerrado
→ snapshot operational-role-grants@1.0.0 preservado
→ sin package @vento/contracts materializado
→ sin tipo compartido publicado
→ sin migración
→ sin cambio de Supabase
→ sin cambio de turnos
→ sin cambio de permisos
→ sin adopción de consumidores
```

La fila o presencia histórica de `propietario_admin` en artefactos físicos no modifica su estado no canónico ni autoriza su exposición en el contrato compartido.

---

#### 26. Hallazgos y destinos exactos

| Hallazgo                                                                            | Estado                            | Destino existente / condición de salida                                     |
| ----------------------------------------------------------------------------------- | --------------------------------- | --------------------------------------------------------------------------- |
| `@vento/contracts` todavía no está materializado                                    | esperado por fase                 | `E5-GATE-008::<package_id>` y `SHELL-CI-020`                                |
| `OperationalRoleCode` compartido no existe físicamente                              | pendiente de implementación       | `SHELL-AUTH-004`; `SHELL-CI-017`; `SHELL-CI-018`                            |
| `packages/os-context` usa identidad operacional parcial basada en string/ID         | legacy técnico controlado         | `SHELL-CON-007`; `SHELL-CTX-001` a `SHELL-CTX-006`                          |
| consumidores pueden conservar listas o strings locales                              | pendiente de adopción             | `SHELL-AUTH-004`; `SHELL-MIG-001` a `SHELL-MIG-008`                         |
| `propietario_admin` permanece como identidad física/deprecada en fuentes históricas | bloqueado como código canónico    | `AUTH-RBAC-027`; su retiro físico permanece fuera del alcance de esta tarea |
| scopes operativos todavía no están centralizados por esta secuencia                 | reservado                         | `SHELL-CON-006`                                                             |
| snapshot de 240 concesiones requiere conservar integridad al materializarse         | pendiente de certificación física | `AUTH-QA-027`; `SHELL-CI-017`; `SHELL-CI-018`                               |

No se crea ningún identificador de tarea adicional para estos pendientes.

---

#### 27. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se crea `TREQ-SHELL-041` para proteger la centralización exacta de los doce roles operativos y la integridad inmutable de `vento.authorization.operational-role-grants@1.0.0`.

| ID               | Regla protegida                                                                                                                                                                                                                                                                                                              | Tipo                                                            | Prioridad | Momento de implementación                                                       | Destino                                                                          |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------- | --------- | ------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| `TREQ-SHELL-041` | La fuente compartida deberá exponer exactamente doce `OperationalRoleCode`; `operational-role-grants@1.0.0` deberá conservar 240 registros —218 directos y 22 componentes— y su huella aprobada, con 0 `BASE_ONLY`, 0 roles base, 0 `propietario_admin`, 0 claves legacy bloqueadas y 0 aliases o fallbacks entre catálogos. | contractual + autorización + estática + integración + regresión | crítica   | materialización de `@vento/contracts`, adopción de consumidores y certificación | `SHELL-CON-005`; `SHELL-AUTH-004`; `AUTH-QA-027`; `SHELL-CI-017`; `SHELL-CI-018` |

---

#### 28. Decisiones vinculantes

1. el catálogo operativo canónico contiene exactamente doce roles;
2. `OperationalRoleCode` contiene exactamente esos doce códigos;
3. el tipo se deriva de la fuente contractual y no de listas locales;
4. rol operativo y rol base permanecen en namespaces distintos;
5. `BASE/bodeguero` y `OPERATIONAL/bodeguero` son identidades distintas;
6. `propietario_admin` queda fuera de `OperationalRoleCode`;
7. ningún `BaseRoleCode` pertenece al catálogo operativo;
8. no se crean roles híbridos;
9. no existe herencia automática entre roles operativos;
10. no existen aliases o fallbacks por semejanza textual;
11. un valor desconocido, inactivo o deprecado falla cerrado;
12. `OperationalRoleCode` no contiene sede, área, turno, check-in, permiso ni scope;
13. un rol operativo válido no autoriza sin contexto suficiente;
14. `gerencia_operativa` no crea autoridad organizacional global;
15. `operational-role-grants@1.0.0` permanece inmutable;
16. el snapshot conserva exactamente 240 registros;
17. conserva 218 `DIRECT_OPERATIONAL` y 22 `OPERATIONAL_COMPONENT`;
18. conserva 174 `BASE_OR_OPERATIONAL`, 44 `OPERATIONAL_ONLY`, 22 `BASE_AND_OPERATIONAL` y 0 `BASE_ONLY`;
19. todo componente operativo permanece ligado a `BASE_AND_OPERATIONAL`;
20. la distribución por aplicaciones permanece 19 FOGO, 181 NEXO, 9 ORIGO y 31 PULSO;
21. `nexo.inventory.remissions.dispatch` permanece excluida sin alias automático;
22. la huella del snapshot permanece `sha256:3e28cb780c346fbc5cf583fe9cf20d1a88333c4fd459fc233380d9e627c6f94f`;
23. no se crea una versión `1.1.0` sin cambio material;
24. esta tarea no crea package, código, migración, Supabase, datos ni adopción física;
25. se crea `TREQ-SHELL-041`;
26. `SHELL-CON-006` permanece como única continuidad reservada.

---

#### 29. Criterios de aceptación

`SHELL-CON-005` queda materialmente completa porque:

- centraliza exactamente doce roles operativos;
- materializa la unión contractual `OperationalRoleCode`;
- conserva la clasificación funcional sin convertirla en jerarquía;
- separa rol operativo de rol base, aplicación, permiso, sede, área, turno y check-in;
- excluye `propietario_admin` y todos los `BaseRoleCode`;
- conserva la colisión `bodeguero` resuelta por namespace/carril;
- prohíbe aliases, fallbacks y conversión automática;
- preserva sin cambios `operational-role-grants@1.0.0`;
- conserva 240 concesiones, 218 directas y 22 componentes;
- concilia 174 `BASE_OR_OPERATIONAL`, 44 `OPERATIONAL_ONLY`, 22 `BASE_AND_OPERATIONAL` y 0 `BASE_ONLY`;
- concilia 19 FOGO, 181 NEXO, 9 ORIGO y 31 PULSO;
- conserva la exclusión de la clave legacy `nexo.inventory.remissions.dispatch`;
- conserva la huella contractual `sha256:3e28cb780c346fbc5cf583fe9cf20d1a88333c4fd459fc233380d9e627c6f94f`;
- evita versionado artificial del dataset;
- define validación fail closed de códigos externos;
- define la superficie compartida objetivo sin inventar un subpath nuevo;
- asigna pendientes a tareas o etapas canónicas existentes;
- crea únicamente `TREQ-SHELL-041` como requisito nuevo;
- no implementa código, package, migración, Supabase, datos ni consumidores;
- deja `SHELL-CON-006` como única tarea siguiente reservada.

---

#### 30. Continuidad

##### ÚLTIMA TAREA APROBADA
SHELL-CON-004 — Centralizar roles base

##### TAREA ACTUAL APROBADA
SHELL-CON-005 — Centralizar roles operativos

##### SIGUIENTE TAREA RESERVADA
SHELL-CON-006 — Centralizar scopes


### ✅ SHELL-CON-006 — Centralizar scopes

**Estado:** APROBADA
**Tarea anterior:** SHELL-CON-005 — Centralizar roles operativos
**Tarea siguiente:** SHELL-CON-007 — Centralizar tipos de contexto
**Tipo de tarea:** Documental
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 1

---

#### 1. Propósito

`SHELL-CON-006` centraliza el vocabulario contractual de alcance que Vento OS utilizará para describir dónde puede ejercerse un permiso exacto, sin modificar los permisos, roles, concesiones, contextos ni contratos de recurso ya aprobados.

La tarea fija simultáneamente:

1. el conjunto exacto de trece `PermissionScopeCode` canónicos;
2. la semántica vinculante de cada código;
3. la separación entre código primitivo, perfil de alcance, carril de autorización, contexto operativo y contrato de recurso;
4. el contrato compartido de `AllowedScopeSet` y `MaximumScope`;
5. las reglas de composición para `BASE_OR_OPERATIONAL` y `BASE_AND_OPERATIONAL`;
6. los límites de `G`, `CTX` y `OWN` para impedir ampliaciones implícitas;
7. las reglas para recursos multilado y resultados agregados;
8. el comportamiento cerrado ante códigos desconocidos, territorio irresoluble o combinaciones no publicadas;
9. la compatibilidad con `vento.authorization@1.0.0`, sus 140 permisos activos y sus diez aplicaciones;
10. los destinos canónicos de materialización, adopción y certificación sin ejecutar cambios físicos en esta fase.

La regla central es:

```text
PERMISO EXACTO
+
CARRIL APLICABLE
+
SCOPE CANÓNICO ADMITIDO
+
RECURSO RESUELTO
+
CONTEXTO Y PRERREQUISITOS VÁLIDOS
+
AUSENCIA DE DENEGACIÓN APLICABLE
→ AUTORIZACIÓN POSIBLE

SCOPE
≠ PERMISO
≠ ROL
≠ CONTEXTO COMPLETO
≠ BYPASS
```

---

#### 2. Resultado canónico

Se centralizan exactamente trece códigos primitivos:

```text
NT
ORG
G
AS
SS
AST
TST
AA
SA
AAT
ATW
CTX
OWN
```

Conciliación:

| Dimensión                                               | Resultado |
| ------------------------------------------------------- | --------: |
| `PermissionScopeCode` canónicos                         |    **13** |
| Códigos territoriales o contextuales nuevos             |     **0** |
| Códigos retirados                                       |     **0** |
| Permisos creados                                        |     **0** |
| Permisos modificados                                    |     **0** |
| Roles modificados                                       |     **0** |
| Concesiones modificadas                                 |     **0** |
| Versiones nuevas de `vento.authorization`               |     **0** |
| Versiones nuevas de schema                              |     **0** |
| Perfiles descriptivos convertidos en códigos primitivos |     **0** |

La centralización fija una API conceptual compartida para un vocabulario ya aprobado. No cambia la autorización efectiva de ningún actor.

---

#### 3. Fuentes y precedencia

Esta tarea conserva sin reinterpretar las siguientes fuentes aprobadas:

| Fuente                                              | Uso vinculante                                                                                        |
| --------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`        | continuidad, granularidad, trazabilidad y requisitos de prueba                                        |
| `docs/plan-canonico/modular/delivery-contract.json` | estructura del artefacto documental y coordinación del registro de requisitos                         |
| `docs/plan-canonico/modular/active-sequence.json`   | secuencia vigente del BLOQUE H                                                                        |
| `AUTH-MOD-013` a `AUTH-MOD-017`                     | significado territorial de globalidad, sedes, áreas y restricciones                                   |
| `AUTH-CAT-011`                                      | taxonomía canónica de alcance, combinaciones admitidas y reglas por permiso                           |
| `AUTH-CAT-017`                                      | `allowed_scopes`, `maximum_scope` y catálogo versionado de autorización                               |
| `AUTH-CAT-018`                                      | tipos derivados `PermissionScopeCode`, `AllowedScopeSet`, `MaximumScope` y especializaciones de scope |
| `AUTH-CAT-024`                                      | `vento.authorization@1.0.0`, 140 permisos activos, diez aplicaciones y huella contractual vigente     |
| `SHELL-CON-001`                                     | frontera de la familia compartida de contratos                                                        |
| `SHELL-CON-003`                                     | `PermissionKey` compartido y prohibición de identidades locales divergentes                           |
| `SHELL-CON-004`                                     | `BaseRoleCode` compartido                                                                             |
| `SHELL-CON-005`                                     | `OperationalRoleCode` compartido y separación entre rol y alcance                                     |
| Registro Canónico de Requisitos de Prueba           | cobertura de contratos, compatibilidad, CI y adopción                                                 |

Precedencia específica:

```text
AUTH-MOD-013..017
→ significado territorial y límites

AUTH-CAT-011
→ trece códigos y reglas de uso

AUTH-CAT-017 / AUTH-CAT-018
→ representación contractual y tipos derivados

AUTH-CAT-024
→ catálogo vigente de 140 permisos

SHELL-CON-006
→ centraliza la superficie compartida
→ no redefine el catálogo
```

Ninguna cadena local, label de interfaz, rol o campo físico de base de datos puede ampliar esta semántica.

---

#### 4. Línea base verificable

El estado de partida queda clasificado así:

| Elemento                                         | Estado documental                                                         |
| ------------------------------------------------ | ------------------------------------------------------------------------- |
| `vento.authorization@1.0.0`                      | publicación contractual vigente                                           |
| Permisos activos del catálogo                    | 140                                                                       |
| Aplicaciones registradas                         | 10                                                                        |
| Huella contractual                               | `sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe` |
| Catálogo físico `@vento/contracts/authorization` | no implementado ni publicado físicamente                                  |
| `packages/contracts`                             | no materializado físicamente                                              |
| `packages/os-context`                            | package físico parcial existente                                          |
| `PermissionScopeCode` compartido                 | no materializado físicamente                                              |
| Cambios físicos autorizados en esta tarea        | ninguno                                                                   |

La ausencia de materialización física no permite crear una taxonomía alternativa. La implementación posterior deberá reproducir exactamente la decisión documental aprobada.

---

#### 5. Naturaleza de un scope

Un scope responde al límite dentro del cual puede evaluarse un **permiso concreto** sobre un **recurso concreto**.

```text
PermissionKey
→ define QUÉ capacidad se evalúa

PermissionScopeCode
→ define DÓNDE o bajo QUÉ delimitador puede aplicarse

ResourceContract
→ define QUÉ recurso real debe resolverse

AuthorizationLane
→ define QUÉ carril aporta la concesión

AccessContext
→ aporta actor y contexto efectivo
```

Un scope no concede capacidad por sí solo.

Queda prohibido interpretar:

```text
G
→ todos los permisos

SS
→ cualquier acción sobre la sede

CTX
→ operación autorizada sin turno/check-in

OWN
→ bypass de territorio o permiso
```

---

#### 6. Catálogo exacto de trece scopes

| Orden | Código | Clase contractual                                    | Semántica vinculante                                                                                                                                  |
| ----- | ------ | ---------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1     | `NT`   | No territorial                                       | El permiso no admite dimensión territorial variable. La ausencia de sede o área no crea territorio implícito.                                         |
| 2     | `ORG`  | Organizacional no territorial                        | El recurso queda limitado a la organización, unidad, catálogo, canal o dominio exacto definido por su contrato, sin fabricar una sede.                |
| 3     | `G`    | Global organizacional ordinario                      | Autoriza el permiso exacto en el ámbito ordinario de la organización. No es universal, no cruza aplicaciones ni incorpora recursos aislados.          |
| 4     | `AS`   | Sedes asignadas                                      | Conjunto de sedes activas asignadas al actor mediante la relación laboral autorizada.                                                                 |
| 5     | `SS`   | Sede específica                                      | Una sede concreta autorizada para el permiso y recurso evaluados.                                                                                     |
| 6     | `AST`  | Sedes asignadas por tipo                             | Subconjunto de sedes asignadas al actor que además coincide con un tipo de sede exacto.                                                               |
| 7     | `TST`  | Todas las sedes de un tipo                           | Conjunto transversal de sedes ordinarias de un tipo exacto, únicamente mediante concesión explícita; nunca se infiere desde AST.                      |
| 8     | `AA`   | Áreas asignadas                                      | Conjunto de áreas activas asignadas al actor dentro de sedes autorizadas.                                                                             |
| 9     | `SA`   | Área específica                                      | Un área concreta dentro de una sede autorizada.                                                                                                       |
| 10    | `AAT`  | Áreas asignadas por tipo                             | Subconjunto de áreas asignadas al actor que coincide con un tipo de área exacto.                                                                      |
| 11    | `ATW`  | Todas las áreas de un tipo dentro de límite superior | Conjunto transversal de áreas de un tipo exacto, siempre acotado por una sede o conjunto superior de sedes autorizado.                                |
| 12    | `CTX`  | Contexto operativo efectivo                          | Territorio efectivo resuelto por el carril operativo. No aporta por sí mismo turno, check-in ni área activa.                                          |
| 13    | `OWN`  | Recurso propio                                       | Restricción o variante sobre recurso propio, creado o atribuido según el contrato del recurso. Puede combinarse con territorio, pero nunca ampliarlo. |

El orden anterior es normativo para serialización y documentación deterministas cuando una salida necesite una colección ordenada. No introduce jerarquía de autoridad entre los códigos.

---

#### 7. Contrato derivado `PermissionScopeCode`

La proyección TypeScript deberá ser equivalente a:

```text
type PermissionScopeCode =
  | "NT"
  | "ORG"
  | "G"
  | "AS"
  | "SS"
  | "AST"
  | "TST"
  | "AA"
  | "SA"
  | "AAT"
  | "ATW"
  | "CTX"
  | "OWN";
```

Reglas:

1. la unión deriva de las fuentes contractuales y no de listas manuales por aplicación;
2. un `string` externo requiere validación exacta antes de considerarse canónico;
3. la coincidencia parcial, prefijos, mayúsculas normalizadas o semejanza semántica no crean equivalencia;
4. un código desconocido o no publicado falla cerrado;
5. los consumidores no agregan miembros locales;
6. el tipo no autoriza recursos, actores ni carriles;
7. una representación serializada más descriptiva solo es admisible cuando existe correspondencia uno a uno, documentada y sin pérdida con estos trece valores.

---

#### 8. Código primitivo, perfil y expresión de alcance

Los trece valores anteriores son el vocabulario primitivo. Nombres utilizados para describir **perfiles de política** no se convierten en `PermissionScopeCode` adicionales.

Ejemplos de perfiles descriptivos existentes:

```text
NT-APP
WF
SITE-READ
SITE-WRITE
ORG-CONFIG-READ
ORG-CONFIG-WRITE
CONFIG-READ
CONFIG-WRITE
FIN-READ
FIN-ACTION
ANALYTICS
MULTI-READ
INTERSECT
```

Estos nombres pueden resumir combinaciones, máximos, recursos o reglas de resolución de un permiso, pero no amplían la unión de trece códigos.

También se mantiene la separación:

```text
G(B)
→ G evaluado en carril BASE

CTX(O)
→ CTX evaluado en carril OPERATIONAL

(B) / (O)
≠ parte del PermissionScopeCode
```

El carril se representa por su contrato propio y nunca mediante una nueva variante textual del scope.

---

#### 9. `NT` — ausencia de territorio variable

`NT` se utiliza cuando el permiso no tiene una dimensión territorial asignable.

Reglas vinculantes:

- no requiere fabricar `site_id` o `area_id`;
- no se convierte en `ORG` o `G` por ausencia de territorio;
- no concede acceso a otros recursos no territoriales;
- la aplicación y el recurso exactos continúan limitando la capacidad;
- una interfaz podrá filtrar por contexto sin transformar ese filtro en autoridad territorial.

Un permiso de entrada a aplicación puede ser `NT` y seguir sin conceder ninguna capacidad interna.

---

#### 10. `ORG` — recurso organizacional no territorial

`ORG` representa un recurso delimitado por organización, unidad de negocio, catálogo, canal, campaña o dominio exacto cuando el contrato de recurso no depende primariamente de sede o área.

Reglas:

1. no se crea una sede ficticia para expresar el límite;
2. no equivale a `G`;
3. el recurso organizacional exacto debe poder identificarse;
4. otras organizaciones, tenants futuros o dominios aislados permanecen fuera;
5. filtros de sede por aplicabilidad no convierten el recurso en territorial por sí mismos.

---

#### 11. `G` — global organizacional ordinario

`G` significa alcance organizacional ordinario para el permiso exacto evaluado.

```text
G
=
SIN RESTRICCIÓN TERRITORIAL ORDINARIA
DENTRO DEL DOMINIO EXACTO DEL PERMISO
```

No significa:

- wildcard de permisos;
- acceso entre aplicaciones;
- acceso universal a la base de datos;
- acceso a otros tenants u organizaciones;
- acceso automático a APP-REVIEW, demos, pruebas o espacios aislados;
- bypass de reautenticación, denegaciones, estado, recurso o dispositivo;
- autoridad operativa sin contexto.

Un permiso nuevo tampoco se concede a un actor por existir otro permiso con `G`.

---

#### 12. Scopes de sede: `AS`, `SS`, `AST`, `TST`

| Código | Regla de resolución                                                                   | Prohibición principal                                                         |
| ------ | ------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| `AS`   | todas las sedes activas asignadas al actor por la relación laboral autorizada         | no derivar desde una sola sede primaria                                       |
| `SS`   | una sede específica y autorizada                                                      | no aceptar una sede enviada por cliente sin validar el recurso y la concesión |
| `AST`  | sedes asignadas al actor que coinciden con un tipo exacto                             | no transformarlo en todas las sedes de ese tipo                               |
| `TST`  | todas las sedes ordinarias de un tipo exacto mediante concesión transversal explícita | nunca inferirlo desde `AST` ni desde el nombre del rol                        |

Una sede inactiva, aislada o fuera del límite empresarial aplicable no se incorpora por pertenecer nominalmente al mismo tipo.

---

#### 13. Scopes de área: `AA`, `SA`, `AAT`, `ATW`

| Código | Regla de resolución                                                                | Prohibición principal                                           |
| ------ | ---------------------------------------------------------------------------------- | --------------------------------------------------------------- |
| `AA`   | áreas activas asignadas al actor dentro de sedes autorizadas                       | no convertir asignación de área en autoridad sobre toda la sede |
| `SA`   | un área específica dentro de una sede autorizada                                   | no aceptar área fuera de la sede superior válida                |
| `AAT`  | áreas asignadas que coinciden con un tipo exacto                                   | no convertirlo en todas las áreas del tipo                      |
| `ATW`  | todas las áreas de un tipo exacto dentro de un límite superior de sedes autorizado | nunca omitir ni ensanchar el límite superior                    |

Los scopes de área no autorizan por implicación recursos cuyo contrato sea únicamente de sede, salvo que el permiso y el contrato de recurso definan expresamente esa relación.

---

#### 14. `CTX` — alcance del contexto operativo efectivo

`CTX` representa el territorio que el carril operativo puede resolver desde el contexto laboral efectivo.

`CTX` no sustituye:

- turno publicado y vigente cuando sea requisito;
- check-in válido cuando sea requisito;
- área activa cuando el permiso la exija;
- rol operativo compatible;
- permiso exacto;
- contrato del recurso;
- estado del recurso;
- controles del dispositivo;
- denegaciones.

Si el contexto operativo necesario no puede resolverse de forma inequívoca, el resultado es denegación segura; no se utiliza la sede seleccionada, primaria o enviada por cliente como fallback permisivo.

---

#### 15. `OWN` — recurso propio

`OWN` es una restricción o variante de propiedad sobre el recurso exacto según su contrato.

Puede representar, según el recurso:

- expediente del propio trabajador;
- documento propio cuando el contrato lo permita;
- operación atribuida al actor;
- simulación perteneciente al actor;
- trabajo o solicitud creada por el actor bajo estados autorizados.

Regla obligatoria:

```text
OWN
+
TERRITORIO AUTORIZADO
→ RECURSO PROPIO DENTRO DEL TERRITORIO

OWN
≠ AMPLIACIÓN DEL TERRITORIO
```

Crear, poseer o haber iniciado un recurso nunca concede automáticamente lectura, modificación, cancelación, eliminación o aprobación si el permiso exacto no las autoriza.

---

#### 16. Contrato `AllowedScopeSet`

Cada `PermissionDefinition` deberá conservar un conjunto explícito de scopes admitidos.

Invariantes:

1. cada miembro pertenece a los trece `PermissionScopeCode`;
2. no existen wildcards;
3. el conjunto no se infiere del nombre de la aplicación, módulo, recurso, acción o rol;
4. un scope ausente del conjunto se considera no permitido para ese permiso;
5. `OWN` puede coexistir con scopes territoriales cuando el contrato lo admita;
6. `CTX` solo puede actuar dentro del carril operativo aplicable;
7. `NT` u `ORG` no obligan a inventar dimensión territorial;
8. la presencia de `G` no transforma las demás capacidades del actor en globales;
9. cambios reales al conjunto de un permiso pertenecen al versionado del catálogo, no a esta tarea de centralización.

---

#### 17. Contrato `MaximumScope`

`MaximumScope` conserva el límite máximo aprobado **por permiso**.

No se define una jerarquía universal simple como:

```text
G > SITE > AREA
```

porque `NT`, `ORG`, `CTX`, `OWN`, los conjuntos asignados, los tipos territoriales y los límites multilado no pertenecen a una sola escala numérica.

El máximo debe interpretarse junto con:

- `PermissionKey`;
- `AllowedScopeSet`;
- carril evaluado;
- contrato de recurso;
- sensibilidad;
- lados requeridos;
- contexto real;
- concesión concreta.

Un consumidor no podrá elevar un scope solicitado hasta el máximo por conveniencia ni utilizar `MaximumScope` como concesión automática.

---

#### 18. Especializaciones tipadas

La superficie compartida deberá poder representar, sin duplicar la fuente:

```text
PermissionScopeCode
AllowedScopeSet
MaximumScope
TerritorialScope
NonTerritorialScope
OwnershipScope
OperationalContextScope
```

Estas categorías son proyecciones del vocabulario canónico. No crean códigos adicionales.

Una implementación podrá utilizar uniones derivadas para evitar combinaciones imposibles, siempre que:

- permanezca reproducible desde la fuente publicada;
- no añada valores;
- no elimine valores válidos;
- no altere su significado;
- valide runtime en fronteras externas.

---

#### 19. Carriles de autorización y composición

##### 19.1 `BASE_ONLY`

El scope efectivo proviene del carril base y de su concesión aplicable.

##### 19.2 `OPERATIONAL_ONLY`

El scope efectivo proviene del carril operativo, su contexto y los prerrequisitos definidos para el permiso.

##### 19.3 `BASE_OR_OPERATIONAL`

Los carriles se evalúan de forma independiente.

```text
BASE válido dentro de su scope
O
OPERATIONAL válido dentro de su scope
→ carril correspondiente puede autorizar
```

El scope de un carril no se copia al otro.

##### 19.4 `BASE_AND_OPERATIONAL`

Ambos carriles deben satisfacerse para el mismo actor y el alcance efectivo se limita a su intersección aplicable.

```text
SCOPE_BASE
∩
SCOPE_OPERATIONAL
∩
RECURSO RESUELTO
→ SCOPE EFECTIVO
```

Un componente amplio en un carril no ensancha el componente más estrecho del otro.

---

#### 20. Recursos multilado, transversales y agregados

Cuando el recurso posee varios lados —por ejemplo origen y destino— la autorización no puede reducirse a un único `site_id` elegido por conveniencia.

Reglas:

1. se resuelven todos los lados obligatorios definidos por el contrato;
2. cada lado conserva su territorio real;
3. autorizar un lado no autoriza automáticamente los demás;
4. una mutación transversal exige el patrón de cobertura aprobado para la acción exacta;
5. una lectura por relación solo expone los lados y campos permitidos por su contrato;
6. operaciones masivas resuelven cada miembro o conjunto según el contrato, no mediante un scope global ficticio;
7. una agregación no puede incluir, revelar ni permitir inferir datos de territorios excluidos.

---

#### 21. Resolución cerrada y entradas no confiables

Toda entrada externa de scope se considera no confiable hasta validarse.

Casos que deben producir fallo cerrado:

```text
scope desconocido
scope no publicado
scope no admitido por PermissionDefinition
scope incompatible con el carril
territorio obligatorio irresoluble
recurso aislado fuera de concesión
límite superior de ATW ausente
TST inferido desde AST
OWN usado como bypass
CTX sin prerrequisitos requeridos
```

No se admiten aliases permisivos, aproximación semántica, wildcard, prefijo o fallback territorial silencioso.

---

#### 22. Relación con `vento.authorization@1.0.0`

La centralización no modifica el catálogo contractual vigente:

| Propiedad          | Valor preservado                                                          |
| ------------------ | ------------------------------------------------------------------------- |
| `catalog_id`       | `vento.authorization`                                                     |
| `catalog_version`  | `1.0.0`                                                                   |
| `schema_version`   | `1.0.0`                                                                   |
| Permisos activos   | **140**                                                                   |
| Aplicaciones       | **10**                                                                    |
| Huella contractual | `sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe` |

`SHELL-CON-006` no reasigna `allowed_scopes`, no cambia `maximum_scope`, no reabre clasificaciones de los 140 permisos y no incorpora perfiles históricos como nuevos códigos.

Cualquier modificación futura del significado o conjunto de scopes de un permiso deberá seguir el diff contractual y SemVer del catálogo.

---

#### 23. Superficie compartida objetivo

La fuente técnica futura deberá pertenecer a la familia contractual compartida de `vento-shell` y ser consumida desde `@vento/contracts/authorization` cuando esa superficie sea materializada.

La superficie deberá ofrecer, como mínimo, capacidad para:

- obtener el conjunto exacto de trece códigos desde una fuente generada o validada;
- derivar `PermissionScopeCode` sin lista manual paralela;
- representar `AllowedScopeSet` y `MaximumScope`;
- distinguir scopes territoriales, no territoriales, de propiedad y de contexto operativo;
- validar entradas runtime antes de producir un valor canónico;
- rechazar códigos desconocidos;
- conservar versión y procedencia contractual.

Esta tarea no fija nombres adicionales de helpers públicos que no hayan sido aprobados por una fuente anterior. La implementación podrá escoger nombres internos compatibles sin crear nuevas identidades contractuales.

---

#### 24. Consumidores y compatibilidad

Los consumidores deberán tratar el contrato centralizado como fuente compartida y no mantener taxonomías divergentes.

Aplican estas reglas:

1. una aplicación puede restringir más su uso, pero no ampliar el conjunto canónico;
2. un contrato local temporal deberá demostrar paridad antes de adopción y no convertirse en fuente normativa;
3. tablas, RPC, eventos o formularios que transporten strings deberán validarlos en la frontera;
4. tipos de Supabase no sustituyen `PermissionScopeCode`;
5. contexto operativo y alcance del permiso se mantienen separados;
6. la adopción por repositorio podrá ocurrir de forma gradual solo si la matriz de compatibilidad demuestra equivalencia;
7. una versión de consumidor incompatible con la versión contractual debe fallar cerrado.

---

#### 25. Versionado e inmutabilidad

La centralización de un vocabulario ya aprobado no genera una nueva `catalog_version` ni una nueva `schema_version` por sí sola.

Se conserva:

```text
vento.authorization@1.0.0
schema 1.0.0
```

Cambios posteriores se clasifican así:

| Cambio                                          | Tratamiento                                                 |
| ----------------------------------------------- | ----------------------------------------------------------- |
| corregir presentación sin cambiar semántica     | seguir reglas de versión publicable aplicables              |
| añadir un código de scope real y compatible     | nueva versión contractual conforme al diff aprobado         |
| retirar o reinterpretar un código               | cambio incompatible; exige tratamiento MAJOR cuando aplique |
| cambiar scopes admitidos o máximo de un permiso | cambio de contenido contractual del permiso                 |
| crear alias de compatibilidad                   | explícito, no ampliatorio y gobernado; no se infiere        |

Una versión publicada nunca se corrige silenciosamente en sitio.

---

#### 26. Estado físico, hallazgos y destinos

| Hallazgo verificable                                                           | Disposición documental                                                                                                                                       |
| ------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `packages/contracts` aún no existe físicamente                                 | `E5-GATE-008` → `SHELL-CI-020`; build en `SHELL-CI-002`, release en `SHELL-CI-003` y compatibilidad en `SHELL-CI-005`; esta tarea no crea archivos de código |
| `@vento/contracts/authorization` no está publicado físicamente                 | materialización en `SHELL-CI-020`; pruebas en `SHELL-CI-001`, build en `SHELL-CI-002`, release en `SHELL-CI-003` y compatibilidad en `SHELL-CI-005`          |
| `packages/os-context` existe y contiene tipos de contexto parciales            | no se convierte en fuente alternativa de scopes; `SHELL-CON-007` centraliza los tipos de contexto                                                            |
| strings externos pueden transportar códigos de scope                           | deberán validarse contra el contrato compartido antes de convertirse en valor canónico                                                                       |
| perfiles como `SITE-READ` o `INTERSECT` aparecen en documentación del catálogo | permanecen perfiles de política y no miembros de `PermissionScopeCode`                                                                                       |
| los 140 permisos ya poseen contrato de catálogo congelado                      | no se reclasifican durante `SHELL-CON-006`                                                                                                                   |

Ninguno de estos hallazgos autoriza código, SQL, migraciones, publicación de packages o cambios remotos durante esta tarea documental.

---

#### 27. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA
**Requisitos creados:** **1**
**Requisitos modificados:** **0**

Se crea `TREQ-SHELL-042` para proteger la centralización de la taxonomía y sus invariantes de seguridad.

| ID               | Regla protegida                                                                                                                               | Riesgo                                                                                                                   | Destino de implementación                                         |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------- |
| `TREQ-SHELL-042` | Exponer exactamente los trece `PermissionScopeCode` y preservar sus restricciones de resolución, carril, propiedad, contexto y fallo cerrado. | Escalación territorial, wildcard implícito, bypass por propiedad, globalidad operativa o divergencia entre consumidores. | `SHELL-CON-006`; `SHELL-AUTH-004`; `SHELL-CI-017`; `SHELL-CI-018` |

El detalle operativo del requisito permanece en el Registro Canónico de Requisitos de Prueba.

---

#### 28. Decisiones vinculantes

1. `PermissionScopeCode` contiene exactamente trece miembros: `NT`, `ORG`, `G`, `AS`, `SS`, `AST`, `TST`, `AA`, `SA`, `AAT`, `ATW`, `CTX`, `OWN`.
2. La unión no se reduce a `global | site | area`.
3. Los perfiles descriptivos no son scopes primitivos.
4. Los calificadores de carril no forman parte del código de scope.
5. `G` es globalidad organizacional ordinaria del permiso exacto y nunca wildcard universal.
6. `TST` requiere concesión explícita y nunca se deriva de `AST`.
7. `ATW` exige conservar un límite superior de sedes autorizado.
8. `CTX` no aporta por sí solo turno, check-in, área ni permiso.
9. `OWN` puede restringir un recurso, pero nunca ampliar territorio o capacidad.
10. `BASE_OR_OPERATIONAL` resuelve cada carril por separado.
11. `BASE_AND_OPERATIONAL` utiliza la intersección de ambos carriles.
12. Los recursos multilado resuelven todos los lados obligatorios.
13. Las agregaciones no revelan territorios excluidos.
14. Un territorio obligatorio irresoluble produce denegación segura.
15. Un código desconocido o no publicado produce denegación segura.
16. No se crean aliases, fallbacks ni wildcards implícitos.
17. `AllowedScopeSet` y `MaximumScope` pertenecen a `PermissionDefinition`, no al nombre del rol.
18. `MaximumScope` no es una jerarquía universal numérica ni una concesión automática.
19. `vento.authorization@1.0.0` conserva 140 permisos, diez aplicaciones y su huella contractual.
20. La tarea no crea una versión nueva del catálogo ni del schema.
21. La tarea no modifica permisos, roles, grants, Supabase, RLS, RPC, migraciones, código o packages físicos.
22. `SHELL-CON-007` permanece reservada y no se desarrolla aquí.

---

#### 29. Criterios de aceptación

`SHELL-CON-006` queda documentalmente cerrada cuando se cumplan simultáneamente:

- existe un único catálogo de trece `PermissionScopeCode`;
- cada código conserva una semántica explícita y no ampliatoria;
- `PermissionScopeCode`, `AllowedScopeSet` y `MaximumScope` quedan definidos como contratos compartidos derivados;
- los perfiles descriptivos y los carriles permanecen separados del vocabulario primitivo;
- quedan protegidas las diferencias entre `G`, `TST`, `ATW`, `CTX` y `OWN`;
- las reglas de composición de las cuatro modalidades de autorización son explícitas;
- la resolución de recursos multilado y agregaciones evita ampliaciones territoriales;
- entradas desconocidas y territorio irresoluble fallan cerrado;
- el catálogo contractual vigente de 140 permisos no cambia;
- la materialización física se mantiene fuera del alcance de esta fase;
- se incorpora exactamente `TREQ-SHELL-042` y ningún otro requisito;
- la continuidad reserva exclusivamente `SHELL-CON-007`.

---

#### 30. Continuidad canónica

##### ÚLTIMA TAREA APROBADA

SHELL-CON-005 — Centralizar roles operativos

##### TAREA ACTUAL APROBADA

SHELL-CON-006 — Centralizar scopes

##### SIGUIENTE TAREA RESERVADA

SHELL-CON-007 — Centralizar tipos de contexto


### ✅ SHELL-CON-007 — Centralizar tipos de contexto

**Estado:** APROBADA
**Tarea anterior:** SHELL-CON-006 — Centralizar scopes
**Tarea siguiente:** SHELL-CON-008 — Centralizar códigos de error
**Tipo de tarea:** Documental
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 1

---

#### 1. Propósito

`SHELL-CON-007` centraliza la superficie contractual de tipos de contexto que Vento OS deberá compartir entre productores, SDK, aplicaciones consumidoras y pruebas, sin modificar la forma publicada de `AccessContext@1.0.0`, `SimulationContext@1.0.0` ni de los contratos de decisión relacionados.

La tarea fija simultáneamente:

1. la familia versionada que gobierna los tipos de contexto;
2. el inventario del contexto real que deberá representarse de forma compartida;
3. la separación obligatoria entre contexto real, simulación y decisión;
4. la reutilización de `AppCode`, `BaseRoleCode` y `OperationalRoleCode` ya centralizados;
5. la incorporación del octavo rol base `trabajador_operativo` a los tipos de contexto sin cambiar la forma serializada de `AccessContext@1.x`;
6. el tratamiento del `EffectiveContext` físico actual como superficie parcial de compatibilidad, no como contrato canónico;
7. la prohibición de representar autorización mediante booleanos, bypasses o strings locales no validados;
8. la frontera exacta entre esta tarea y `SHELL-CON-008`, que centralizará códigos de error y razón sin ser desarrollada aquí;
9. los destinos canónicos de materialización, backend, adopción y certificación sin ejecutar cambios físicos en esta fase.

Regla central:

```text
CONTRATO VERSIONADO DE CONTEXTO
→ FUENTE SEMÁNTICA

TIPOS COMPARTIDOS
→ PROYECCIÓN ESTÁTICA DEL CONTRATO

CONTEXTO
≠ DECISIÓN DE AUTORIZACIÓN
≠ SIMULACIÓN REAL
≠ BOOLEANO can_operate
≠ BYPASS
```

---

#### 2. Resultado canónico

Se centraliza como autoridad contractual la familia:

```text
vento.authorization.response-contracts@1.0.0
```

con perfil de serialización:

```text
vento.canonical-json@1.0.0
```

y huella de release:

```text
sha256:782a216c4bbfdc3b3cec1bbd7239c05d93edd7fa34b4ce62cad48c1e6b9941cd
```

La familia conserva cuatro contratos publicados e independientes:

| Contrato                         | `contract_version` | `schema_version` | Disposición en esta tarea                                  |
| -------------------------------- | ------------------ | ---------------- | ---------------------------------------------------------- |
| `AccessContext`                  | `1.0.0`            | `1.0.0`          | centralizar tipos de contexto real                         |
| `AuthorizationDecision`          | `1.0.0`            | `1.0.0`          | conservar como contrato relacionado; no redefinir decisión |
| `SimulationContext`              | `1.0.0`            | `1.0.0`          | centralizar como contexto hipotético separado              |
| `SimulatedAuthorizationDecision` | `1.0.0`            | `1.0.0`          | conservar como decisión hipotética separada                |

Conciliación:

| Dimensión                                           | Resultado |
| --------------------------------------------------- | --------: |
| Familias contractuales nuevas                       |     **0** |
| Contratos de respuesta nuevos                       |     **0** |
| Cambios de forma en `AccessContext@1.0.0`           |     **0** |
| Cambios de forma en `SimulationContext@1.0.0`       |     **0** |
| Cambios de `contract_version`                       |     **0** |
| Cambios de `schema_version`                         |     **0** |
| Cambios de huella de release                        |     **0** |
| Roles base admitidos por el tipo vigente            |     **8** |
| Roles operativos admitidos por el tipo vigente      |    **12** |
| Aplicaciones canónicas reutilizables como `AppCode` |    **10** |
| Cambios físicos autorizados                         |     **0** |

---

#### 3. Fuentes y precedencia

Esta tarea conserva y reconcilia las siguientes decisiones aprobadas:

| Fuente                                              | Uso vinculante                                                                                                                        |
| --------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`        | continuidad, granularidad, trazabilidad y requisitos de prueba                                                                        |
| `docs/plan-canonico/modular/delivery-contract.json` | forma del artefacto documental y coordinación del registro de requisitos                                                              |
| `docs/plan-canonico/modular/active-sequence.json`   | continuidad vigente del BLOQUE H                                                                                                      |
| `AUTH-MOD-020`                                      | arquitectura de identidad, contexto, autorización y presentación                                                                      |
| `AUTH-MOD-021`                                      | octavo `BaseRoleCode`, `trabajador_operativo`, y obligación explícita de actualizar tipos de contexto sin cambiar `AccessContext@1.x` |
| `AUTH-CTX-001`                                      | forma raíz y principios de `AccessContext`                                                                                            |
| `AUTH-CTX-002`                                      | separación entre contexto y `AuthorizationDecision`                                                                                   |
| `AUTH-CTX-003`                                      | separación de `SimulationContext` y decisiones hipotéticas                                                                            |
| `AUTH-CTX-004`                                      | versionado, metadatos comunes, serialización y huella de la familia de contratos                                                      |
| `AUTH-CTX-005` a `AUTH-CTX-015`                     | formas y semántica de los nodos internos del contexto real                                                                            |
| `SHELL-CON-002`                                     | `AppCode` canónico de diez aplicaciones                                                                                               |
| `SHELL-CON-004`                                     | `BaseRoleCode` canónico de ocho roles                                                                                                 |
| `SHELL-CON-005`                                     | `OperationalRoleCode` canónico de doce roles                                                                                          |
| `SHELL-CON-006`                                     | `PermissionScopeCode` y separación entre alcance y contexto                                                                           |
| `SHELL-AUTH-001` y `SHELL-CTX-001`                  | destino de materialización compartida posterior                                                                                       |

Precedencia específica para rol base:

```text
AUTH-CTX-008
→ definió la forma de BaseRoleContext
→ reflejaba el catálogo base disponible en ese momento

AUTH-MOD-021
→ decisión aditiva posterior
→ agrega trabajador_operativo
→ no cambia la forma de AccessContext@1.x

SHELL-CON-004
→ centraliza BaseRoleCode de ocho miembros

SHELL-CON-007
→ BaseRoleContext reutiliza el BaseRoleCode vigente
```

No se crea una segunda versión de `AccessContext` únicamente para incorporar el nuevo literal de rol.

---

#### 4. Línea base verificable

El estado físico actual queda clasificado así:

| Elemento                                       | Estado actual                                                  | Disposición                                                                                                                                                        |
| ---------------------------------------------- | -------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `vento.authorization.response-contracts@1.0.0` | publicación contractual documental                             | conservar inmutable                                                                                                                                                |
| `@vento/contracts/authorization`               | no publicado físicamente como fuente completa de los contratos | `E5-GATE-008` → `SHELL-CI-020`; release en `SHELL-CI-003` y compatibilidad en `SHELL-CI-005`                                                                       |
| `@vento/os-context@0.1.0`                      | package físico parcial existente                               | conservar como implementación parcial hasta migración controlada                                                                                                   |
| `EffectiveContext`                             | tipo físico plano y parcial                                    | compatibilidad temporal; no fuente semántica canónica                                                                                                              |
| `EffectiveContextSource`                       | clasificación física existente                                 | no promover a discriminante canónico de `AccessContext`                                                                                                            |
| `ContextSimulationInput`                       | entrada física de simulación existente                         | no confundir con `SimulationContext@1.0.0`                                                                                                                         |
| RPC `get_effective_context_v1`                 | consumidor físico actual                                       | adaptación en `SHELL-CTX-001`, `SHELL-CTX-002` y `SHELL-AUTH-002`; migración/certificación en `SHELL-AUTH-005`, `SHELL-MIG-003`, `SHELL-MIG-007` y `SHELL-MIG-008` |
| RPC `has_effective_permission_v1`              | devuelve booleano físico actual                                | no define la forma de `AuthorizationDecision`                                                                                                                      |
| cambios físicos en esta tarea                  | no autorizados                                                 | ninguno                                                                                                                                                            |

La existencia del package parcial no invierte la fuente de verdad:

```text
CONTRATO CANÓNICO
→ TIPOS COMPARTIDOS
→ ADAPTERS
→ CONSUMIDORES
```

Nunca:

```text
EffectiveContext físico actual
→ redefinir AccessContext
```

---

#### 5. Frontera de propiedad de los tipos

La arquitectura compartida queda separada así:

```text
@vento/contracts/authorization
→ identidades y formas contractuales versionadas
→ schemas
→ catálogos
→ códigos compartidos

@vento/os-context
→ consumo de tipos contractuales
→ adapters
→ scopes por solicitud
→ proyecciones seguras
→ compatibilidad temporal
→ utilidades de prueba

Supabase
→ productor autoritativo de contexto
→ evaluación autoritativa
→ persistencia y resolutores privados
```

Queda prohibido:

- crear `@vento/auth` como segunda fuente;
- crear `@vento/operational-context` como segundo núcleo;
- mantener una forma canónica distinta dentro de una aplicación;
- generar el contrato desde `packages/os-context/src/types.ts`;
- tratar tipos generados de Supabase como semántica contractual;
- permitir que frontend o rutas redefinan campos de contexto.

---

#### 6. Metadatos comunes de la familia

Todos los contratos de la familia conservan conceptualmente:

```text
type ContractMetadata = {
  contract_family: "vento.authorization.response-contracts";
  contract_family_version: "1.0.0";
  contract_name:
    | "AccessContext"
    | "AuthorizationDecision"
    | "SimulationContext"
    | "SimulatedAuthorizationDecision";
  contract_version: string;
  schema_version: string;
};
```

Para las versiones congeladas, los discriminantes se restringen a `1.0.0` según el contrato exacto.

Reglas:

1. `contract_family` no se infiere desde el package que transporta el tipo;
2. `contract_name` discrimina contratos incompatibles;
3. `contract_version` y `schema_version` no son intercambiables;
4. una versión desconocida no admite downgrade silencioso;
5. la ausencia de un campo obligatorio invalida el contrato;
6. los tipos compartidos no podrán ocultar estas propiedades mediante una interfaz más permisiva.

---

#### 7. Raíz `AccessContextV1`

La raíz compartida conserva exactamente los nodos aprobados:

```text
type AccessContextV1 = ContractMetadata & {
  contract_name: "AccessContext";
  contract_version: "1.0.0";
  schema_version: "1.0.0";

  context_id: string;
  resolved_at: string;

  principal: PrincipalContext;
  actor_effective: EffectiveActorContext;
  domain_identity: DomainIdentityContext | null;
  employee: EmployeeContext | null;

  base_role: BaseRoleContext | null;
  assigned_sites: AssignedSiteContext[];
  assigned_areas: AssignedAreaContext[];
  administrative_coverage: AdministrativeCoverageContext;

  active_shift: ActiveShiftContext | null;
  active_checkin_session: ActiveCheckinContext | null;
  operational_role: OperationalRoleContext | null;
  operational_site: OperationalSiteContext | null;
  operational_area: OperationalAreaContext | null;

  device_context: DeviceContext | null;

  lane_readiness: {
    base: LaneReadiness;
    operational: LaneReadiness;
  };

  structural_issues: StructuralIssue[];
  resolution_metadata: ResolutionMetadata;
};
```

La centralización no agrega ni elimina propiedades.

---

#### 8. Inventario de nodos de `AccessContextV1`

Cada identidad del contexto real recibe una disposición explícita:

| Identidad contractual           | Disposición       | Regla principal                                                                |
| ------------------------------- | ----------------- | ------------------------------------------------------------------------------ |
| `PrincipalContext`              | CENTRALIZAR       | representa el principal autenticado; no el actor empresarial                   |
| `EffectiveActorContext`         | CENTRALIZAR       | representa el actor atribuible; no hereda identidad del dispositivo            |
| `DomainIdentityContext`         | CENTRALIZAR       | representa identidad laboral, cliente, dispositivo o sistema sin mezclarlas    |
| `EmployeeContext`               | CENTRALIZAR       | representa identidad laboral mínima; no permisos ni territorio operativo       |
| `BaseRoleContext`               | CENTRALIZAR       | usa el `BaseRoleCode` vigente y no concede por nombre de rol                   |
| `AssignedSiteContext`           | CENTRALIZAR       | representa asignación laboral, no sede operativa                               |
| `AssignedAreaContext`           | CENTRALIZAR       | representa asignación laboral, no área operativa                               |
| `AdministrativeCoverageContext` | CENTRALIZAR       | delimita cobertura del carril base; no permiso                                 |
| `ActiveShiftContext`            | CENTRALIZAR       | snapshot de turno publicado y vigente                                          |
| `ActiveCheckinContext`          | CENTRALIZAR       | sesión de asistencia activa y coherente; no turno                              |
| `OperationalRoleContext`        | CENTRALIZAR       | usa `OperationalRoleCode` y deriva del turno vigente                           |
| `OperationalSiteContext`        | CENTRALIZAR       | sede exacta del turno; no selector ni recurso                                  |
| `OperationalAreaContext`        | CENTRALIZAR       | área exacta del turno cuando aplica                                            |
| `DeviceContext`                 | CENTRALIZAR       | restricción de dispositivo; nunca fuente de autoridad adicional                |
| `LaneReadiness`                 | CENTRALIZAR       | preparación estructural del carril; nunca decisión final                       |
| `StructuralIssue`               | CENTRALIZAR FORMA | forma compartida; catálogo exacto de códigos queda reservado a `SHELL-CON-008` |
| `ResolutionMetadata`            | CENTRALIZAR       | procedencia y versiones de resolución; no autorización                         |

El inventario contiene todos los nodos directos de `AccessContextV1` y conserva sus relaciones de nulabilidad y cardinalidad.

---

#### 9. `PrincipalContext`

La forma canónica conserva:

```text
principal_type:
  HUMAN_USER
  SHARED_DEVICE
  SYSTEM_SERVICE
  ANONYMOUS

auth_user_id: string | null
session_id: string | null
authenticated: boolean
authentication_method: string | null
authenticated_at: string | null
session_expires_at: string | null

principal_status:
  VALID
  INVALID
  ANONYMOUS
```

Reglas:

- una credencial técnica no se convierte en trabajador;
- una sesión anónima no recibe identidad laboral por fallback;
- IDs enviados por cliente no sustituyen al principal autenticado;
- la sesión no concede permiso por sí misma.

---

#### 10. `EffectiveActorContext`

La forma canónica conserva:

```text
actor_type:
  EMPLOYEE
  CUSTOMER
  SYSTEM
  UNRESOLVED

actor_id: string | null

attribution_source:
  PERSONAL_SESSION
  DEVICE_ACTOR_SESSION
  SYSTEM_PROCESS
  DOMAIN_IDENTITY
  NONE

delegation_id: string | null
resolved: boolean
```

El principal y el actor permanecen separados.

En dispositivo compartido:

```text
principal = dispositivo
actor = empleado de sesión válida
```

Nunca:

```text
actor = device_id
```

---

#### 11. `DomainIdentityContext` y `EmployeeContext`

`DomainIdentityContext` conserva:

```text
identity_type:
  EMPLOYEE
  CUSTOMER
  DEVICE
  SYSTEM

identity_id: string

status:
  ACTIVE
  INACTIVE
  INVALID

source: string
```

`EmployeeContext` conserva la identidad laboral mínima y su referencia al rol base.

La proyección estática deberá reutilizar el `BaseRoleCode` vigente para `base_role_code` cuando el campo sea tipado dentro de TypeScript.

No se agrega un campo nuevo al JSON y no se altera la serialización.

---

#### 12. `BaseRoleContext` y precedencia del octavo rol

La forma permanece:

```text
type BaseRoleContext = {
  role_code: BaseRoleCode;
  role_status: "ACTIVE" | "INACTIVE" | "INVALID";
  assignment_source: string;
};
```

`BaseRoleCode` contiene exactamente:

```text
propietario
gerente_general
gerente
supervisor
auxiliar_administrativa
contador
marketing
trabajador_operativo
```

`trabajador_operativo`:

- es un rol base canónico válido;
- puede aparecer en `EmployeeContext` y `BaseRoleContext`;
- no crea cobertura administrativa implícita;
- no crea rol operativo;
- no crea turno;
- no crea check-in;
- no se usa como fallback para oficios legacy;
- no altera la forma de `AccessContext@1.x`.

Los oficios base legacy no se agregan a `BaseRoleCode` por compatibilidad.

---

#### 13. Asignaciones y cobertura administrativa

Se conservan:

```text
AssignedSiteContext
AssignedAreaContext
AdministrativeCoverageContext
```

`AdministrativeCoverageContext.mode` conserva:

```text
NONE
ASSIGNED_SITES
SPECIFIC_SITE
ASSIGNED_AREAS
SPECIFIC_AREA
ORGANIZATION
```

Reglas:

1. asignación laboral no equivale a permiso;
2. sede primaria no equivale a cobertura completa;
3. cobertura administrativa no equivale a territorio operativo;
4. `NONE` no significa globalidad;
5. `trabajador_operativo` no recibe una cobertura administrativa implícita por existir como rol base;
6. arrays vacíos no se interpretan como todos los territorios.

---

#### 14. `ActiveShiftContext` y `ActiveCheckinContext`

`ActiveShiftContext` conserva como hechos mínimos:

- `shift_id`;
- `employee_id`;
- `site_id`;
- `area_id` nullable;
- `operational_role_code`;
- `starts_at`;
- `ends_at`;
- `shift_status`;
- `published`;
- `currently_valid`.

La proyección TypeScript deberá utilizar `OperationalRoleCode` para `operational_role_code` cuando el valor ya haya sido validado contra el catálogo operativo.

`ActiveCheckinContext` conserva:

- `checkin_session_id`;
- `employee_id`;
- `shift_id`;
- `site_id`;
- `area_id` nullable;
- `checked_in_at`;
- `expires_at` nullable;
- `checked_out_at` nullable;
- `status` `ACTIVE | EXPIRED | CLOSED | INVALID`.

Reglas:

```text
CHECK-IN
≠ TURNO

CHECK-IN
≠ ROL OPERATIVO

CHECK-IN
≠ PERMISO
```

---

#### 15. `OperationalRoleContext`

La forma canónica conserva:

```text
type OperationalRoleContext = {
  role_code: OperationalRoleCode;
  shift_id: string;
  site_id: string;
  area_id: string | null;
  valid_for_site: boolean;
  valid_for_area: boolean;
};
```

`OperationalRoleCode` contiene exactamente los doce miembros centralizados en `SHELL-CON-005`.

No se admite:

- `propietario_admin`;
- un `BaseRoleCode` como rol operativo;
- un oficio base legacy como sustituto de rol operativo;
- un `string` desconocido convertido mediante cast;
- `navigation_role` como fuente de este nodo.

---

#### 16. `OperationalSiteContext` y `OperationalAreaContext`

Se conservan exactamente:

```text
type OperationalSiteContext = {
  site_id: string;
  source_shift_id: string;
  site_active: boolean;
  assignment_valid: boolean;
};
```

```text
type OperationalAreaContext = {
  area_id: string;
  site_id: string;
  area_kind: string;
  source: "SHIFT" | "CHECKIN_CONFIRMED_SHIFT";
  area_active: boolean;
  compatible_with_role: boolean;
};
```

Reglas:

1. ambos nodos derivan del turno vigente;
2. el check-in solo puede confirmar el área del turno;
3. la sede seleccionada no es fuente;
4. la sede primaria no es fallback;
5. el dispositivo no reemplaza territorio laboral;
6. el recurso no reemplaza territorio laboral;
7. `null` nunca significa wildcard;
8. el territorio del actor y el territorio del recurso permanecen separados.

---

#### 17. `DeviceContext`

La forma canónica conserva:

```text
type DeviceContext = {
  device_id: string;
  device_code: string;
  device_type: string;
  device_status: "ACTIVE" | "INACTIVE" | "INVALID";
  authenticated_as_device: boolean;
  actor_session_id: string | null;
  actor_session_expires_at: string | null;
  allowed_application_codes: AppCode[];
  capability_package_code: string | null;
};
```

La sustitución estática de `string[]` por `AppCode[]` no cambia la serialización; reutiliza el catálogo canónico ya centralizado.

Reglas:

- aplicaciones visibles no son permisos;
- el package del dispositivo es techo restrictivo, no grant;
- lista vacía no significa todas;
- instancia solo puede reducir su plantilla;
- PIN ligero no equivale a reautenticación fuerte;
- dispositivo sin actor humano no ejecuta acciones empresariales;
- identidad técnica del dispositivo no se convierte en actor humano.

---

#### 18. `LaneReadiness`

La forma permanece:

```text
type LaneReadiness = {
  status: "READY" | "UNAVAILABLE" | "INVALID" | "NOT_APPLICABLE";
  reason_codes: string[];
};
```

Semántica obligatoria:

```text
READY
≠ ALLOW

UNAVAILABLE
≠ INVALID

NOT_APPLICABLE
≠ DENY
```

`reason_codes` permanece como referencia textual contractual durante esta tarea.

La unión cerrada de códigos y razones corresponde a `SHELL-CON-008` y no se anticipa aquí.

---

#### 19. `StructuralIssue`

La forma permanece:

```text
type StructuralIssue = {
  issue_code: string;
  severity:
    | "BLOCKING_ALL"
    | "BLOCKING_BASE"
    | "BLOCKING_OPERATIONAL"
    | "WARNING"
    | "INFO";
  subject_type: string;
  subject_id: string | null;
  source: string;
  safe_message: string;
};
```

Esta tarea centraliza la **forma** y la relación del nodo con `AccessContext`.

No centraliza todavía como uniones literales:

- los 100 `issue_code` iniciales;
- los códigos de disponibilidad de `LaneReadiness`;
- códigos de error de consumidores;
- códigos HTTP;
- errores internos de infraestructura.

Ese vocabulario permanece reservado para `SHELL-CON-008`.

---

#### 20. `ResolutionMetadata`

`ResolutionMetadata` se conserva como nodo obligatorio de procedencia del snapshot.

Debe permitir identificar de forma reproducible:

- resolver utilizado;
- versión del resolver;
- versión del contrato de autorización;
- versión del catálogo;
- versiones de las fuentes consumidas;
- metadatos de resolución aprobados por `AUTH-CTX-001`.

Reglas:

1. no concede autorización;
2. no reemplaza `ContractMetadata`;
3. no contiene secretos;
4. no se reconstruye desde el cliente;
5. no admite versiones inventadas por una aplicación;
6. una versión incompatible debe provocar fallo cerrado conforme a la familia contractual.

La forma exacta publicada continúa gobernada por `AUTH-CTX-001`; esta tarea no agrega campos.

---

#### 21. `SimulationContextV1`

La simulación conserva un contrato raíz independiente:

```text
contract_name = SimulationContext
contract_version = 1.0.0
schema_version = 1.0.0
```

Debe mantener separados como mínimo:

- actor real;
- referencia al contexto real;
- autorización para simular;
- sujeto simulado;
- contexto hipotético;
- escenario de recurso cuando aplique;
- evaluaciones hipotéticas;
- resultados `WOULD_ALLOW`, `WOULD_DENY` e `INDETERMINATE`;
- problemas de simulación;
- auditoría de simulación.

Reglas:

```text
SimulationContext
≠ AccessContext real mutado
```

```text
WOULD_ALLOW
≠ ALLOW ejecutable
```

```text
sede/área simuladas
≠ territorio laboral real
```

`ContextSimulationInput` físico actual puede servir únicamente como entrada de compatibilidad mientras exista el adapter correspondiente; no es el contrato canónico de simulación.

---

#### 22. Contratos de decisión relacionados

`AuthorizationDecisionV1` y `SimulatedAuthorizationDecisionV1` pertenecen a la misma familia versionada, pero no se fusionan con los tipos de contexto.

Separación obligatoria:

```text
AccessContextV1
→ hechos resueltos del actor y su contexto

AuthorizationDecisionV1
→ evaluación de permiso y recurso exactos

SimulationContextV1
→ hechos hipotéticos aislados

SimulatedAuthorizationDecisionV1
→ evaluación hipotética no ejecutable
```

Los tipos de contexto pueden ser referenciados por los contratos de decisión, pero no deben adquirir:

- `final_decision`;
- matched grants;
- matched denies;
- autorización de campos;
- autorización del recurso;
- resultado ejecutable;
- decisión simulada.

---

#### 23. Reutilización de contratos ya centralizados

Cuando un campo de contexto ya corresponde inequívocamente con un contrato compartido aprobado, la proyección TypeScript deberá reutilizarlo en lugar de declarar una unión local.

| Campo contextual                            | Tipo compartido reutilizado | Regla                       |
| ------------------------------------------- | --------------------------- | --------------------------- |
| `EmployeeContext.base_role_code`            | `BaseRoleCode`              | ocho miembros vigentes      |
| `BaseRoleContext.role_code`                 | `BaseRoleCode`              | ocho miembros vigentes      |
| `ActiveShiftContext.operational_role_code`  | `OperationalRoleCode`       | doce miembros vigentes      |
| `OperationalRoleContext.role_code`          | `OperationalRoleCode`       | doce miembros vigentes      |
| `DeviceContext.allowed_application_codes[]` | `AppCode`                   | diez aplicaciones canónicas |

`PermissionScopeCode` se reutilizará únicamente en campos o contratos que realmente representen un scope publicado. No se agrega artificialmente a `AccessContextV1` porque la raíz no contiene un campo de scope genérico.

---

#### 24. Cadenas externas y validación runtime

Un tipo compartido no convierte automáticamente datos externos en valores canónicos.

Entradas desde:

- Supabase;
- RPC;
- JSON;
- eventos;
- formularios;
- local storage;
- query strings;
- headers;
- datos legacy;

deben validarse antes de producir un contexto canónico tipado.

Queda prohibido:

```text
externalValue as BaseRoleCode
externalValue as OperationalRoleCode
externalObject as AccessContextV1
```

como sustituto de validación.

Una entrada desconocida, incompleta, incompatible o ambigua falla cerrada.

---

#### 25. Prohibición de catch-all permisivo

La centralización no admite utilizar como escape semántico:

```text
string
Record<string, unknown>
metadata genérica
booleanos agregados
casts dobles
campos opcionales indiscriminados
```

cuando exista un discriminante o nodo contractual publicado.

Un campo puede continuar serializado como `string` cuando el contrato publicado así lo define y no exista todavía un vocabulario compartido aprobado para restringirlo.

Ejemplos que permanecen sin inventar una taxonomía nueva en esta tarea:

- `device_type`;
- `area_kind` cuando corresponda;
- `employment_status`;
- `StructuralIssue.issue_code` hasta `SHELL-CON-008`;
- `LaneReadiness.reason_codes` hasta `SHELL-CON-008`.

---

#### 26. Reconciliación del `EffectiveContext` físico actual

El tipo físico actual no constituye la forma canónica de `AccessContextV1`.

Disposición por campo o concepto:

| Superficie actual                        | Disposición                                                                                         |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `source: EffectiveContextSource`         | COMPATIBILIDAD; no discriminante raíz canónico                                                      |
| `session_mode` abierto con `string`      | COMPATIBILIDAD; no se usa para reemplazar principal, actor o dispositivo                            |
| `app_code`                               | no pertenece al snapshot raíz de `AccessContext`; la aplicación solicitada se evalúa posteriormente |
| `user_id`                                | no reemplaza `principal`, `domain_identity`, `actor_effective` ni `employee`                        |
| `real_administrative_role`               | RETIRAR COMO FUENTE CANÓNICA; sustituido conceptualmente por `BaseRoleContext`                      |
| `effective_administrative_role`          | RETIRAR COMO FUENTE CANÓNICA; no existe rol administrativo efectivo alternativo                     |
| `effective_operational_role`             | COMPATIBILIDAD; debe converger en `OperationalRoleContext`                                          |
| `site_id`, `area_id`, `area_kind` planos | COMPATIBILIDAD; deben converger en nodos administrativos/operativos separados                       |
| `shift_id` plano                         | COMPATIBILIDAD; debe converger en `ActiveShiftContext` y referencias dependientes                   |
| `simulation_id` dentro del contexto real | NO CANÓNICO; la simulación pertenece a `SimulationContext`                                          |
| `shared_device_id` plano                 | COMPATIBILIDAD; debe converger en `DeviceContext`                                                   |
| `is_simulation`                          | NO CANÓNICO en `AccessContextV1`; no se usa para mutar un contexto real                             |
| `is_shared_device`                       | derivable del principal/dispositivo; no sustituye discriminantes publicados                         |
| `bypass_applied`                         | PROHIBIDO COMO AUTORIDAD; ningún bypass forma parte del contexto canónico                           |
| `can_operate`                            | PROHIBIDO COMO DECISIÓN; se reemplaza por `lane_readiness` y evaluación posterior                   |
| `blocked_reasons`                        | COMPATIBILIDAD; no sustituye `structural_issues`, `reason_codes` ni razones de decisión             |
| `metadata: Record<string, unknown>`      | no puede absorber propiedades contractuales omitidas                                                |

La migración física de estas superficies no ocurre en `SHELL-CON-007`.

---

#### 27. Distribución física posterior

Las responsabilidades quedan asignadas sin pendientes narrativos:

| Resultado físico futuro                                        | Tarea propietaria |
| -------------------------------------------------------------- | ----------------- |
| estructura, exports, versionado y compatibilidad del SDK único | `SHELL-AUTH-001`  |
| módulo contextual dentro de `@vento/os-context`                | `SHELL-CTX-001`   |
| consumo canónico de turno y check-in                           | `SHELL-CTX-002`   |
| proyecciones seguras de sede y área                            | `SHELL-CTX-003`   |
| readiness sin booleanos de autorización                        | `SHELL-CTX-004`   |
| razones seguras de bloqueo contextual                          | `SHELL-CTX-005`   |
| caché compartida, single-flight y frescura                     | `SHELL-CTX-006`   |
| adapters de servidor/cliente y proyecciones seguras            | `SHELL-AUTH-002`  |
| lint, métricas y gates contra consumidores legacy              | `SHELL-AUTH-004`  |
| migración final de consumidores                                | `SHELL-AUTH-005`  |
| productor autoritativo de contexto en backend                  | `AUTH-DB-033`     |
| token/frescura e invalidación autoritativa                     | `AUTH-DB-035`     |
| productor de decisión autoritativa                             | `AUTH-DB-034`     |
| persistencia/backend compartido correspondiente                | `AUTH-DB-032`     |

Esta asignación no modifica ni inicia ninguna de esas tareas.

---

#### 28. Versionado e inmutabilidad

Esta centralización es una proyección de contratos ya publicados documentalmente.

Se conserva:

```text
contract_family = vento.authorization.response-contracts
contract_family_version = 1.0.0

AccessContext@1.0.0
SimulationContext@1.0.0
AuthorizationDecision@1.0.0
SimulatedAuthorizationDecision@1.0.0

schema_version = 1.0.0
release_hash = sha256:782a216c4bbfdc3b3cec1bbd7239c05d93edd7fa34b4ce62cad48c1e6b9941cd
```

No generan nueva versión:

- reemplazar un `string` TypeScript por un literal ya canónico cuando la serialización no cambia;
- reutilizar `BaseRoleCode` vigente dentro de `BaseRoleContext`;
- reutilizar `OperationalRoleCode` vigente;
- reutilizar `AppCode` vigente;
- centralizar la misma forma en un package compartido.

Sí exigiría revisión contractual y versionado correspondiente:

- agregar o retirar un campo serializado;
- cambiar nulabilidad o cardinalidad;
- cambiar semántica de un nodo;
- fusionar contexto real y simulación;
- convertir un warning en bloqueo de forma incompatible;
- cambiar el significado de un discriminante publicado;
- reutilizar un contrato con semántica distinta.

---

#### 29. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA
**Requisitos creados:** **1**
**Requisitos modificados:** **0**

Se crea `TREQ-SHELL-043` para proteger la centralización de tipos de contexto y la separación entre contexto real, simulación, decisión y superficies legacy.

| ID               | Regla protegida                                                                                                                                                                                                      | Riesgo                                                                                                                   | Destino de implementación                                                                            |
| ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------- |
| `TREQ-SHELL-043` | Preservar la familia `response-contracts@1.0.0`, `AccessContext@1.0.0`, el uso de catálogos tipados vigentes y la separación estricta frente a `EffectiveContext`, simulación, bypasses y booleanos de autorización. | Deriva de tipos, autorización por booleano, mezcla real/simulado, rol legacy aceptado, bypass o consumidor incompatible. | `SHELL-CON-007`; `SHELL-AUTH-001`; `SHELL-CTX-001`; `SHELL-AUTH-004`; `SHELL-CI-017`; `SHELL-CI-018` |

El detalle operativo del requisito permanece en el Registro Canónico de Requisitos de Prueba.

---

#### 30. Decisiones vinculantes

1. La familia contractual compartida es `vento.authorization.response-contracts@1.0.0`.
2. Su perfil de serialización permanece `vento.canonical-json@1.0.0`.
3. Su huella de release permanece `sha256:782a216c4bbfdc3b3cec1bbd7239c05d93edd7fa34b4ce62cad48c1e6b9941cd`.
4. `AccessContext`, `AuthorizationDecision`, `SimulationContext` y `SimulatedAuthorizationDecision` permanecen contratos independientes.
5. `AccessContextV1` conserva exactamente su forma publicada.
6. `SimulationContextV1` conserva exactamente su forma publicada y nunca muta el contexto real.
7. `BaseRoleContext.role_code` reutiliza el `BaseRoleCode` vigente de ocho miembros.
8. `trabajador_operativo` es válido como rol base del contexto sin crear autoridad administrativa implícita.
9. `OperationalRoleContext.role_code` reutiliza el `OperationalRoleCode` vigente de doce miembros.
10. `DeviceContext.allowed_application_codes` reutiliza `AppCode` de diez aplicaciones después de validación.
11. `PermissionScopeCode` se reutiliza solo donde exista realmente un campo contractual de alcance; no se agrega a la raíz de `AccessContext`.
12. `LaneReadiness.READY` no significa `ALLOW`.
13. `StructuralIssue` centraliza su forma, pero los códigos exactos quedan reservados a `SHELL-CON-008`.
14. `reason_codes` no se convierte todavía en una unión literal durante esta tarea.
15. `EffectiveContext` físico actual no es fuente de verdad canónica.
16. `ContextSimulationInput` físico actual no es `SimulationContextV1`.
17. `administrative_bypass` no forma parte de la autorización canónica.
18. `bypass_applied` no puede convertirse en autoridad.
19. `can_operate` no puede sustituir `AuthorizationDecision`.
20. `is_simulation` no puede transformar un `AccessContext` real en un contexto simulado.
21. `metadata: Record<string, unknown>` no puede almacenar propiedades contractuales omitidas como mecanismo de compatibilidad.
22. strings externos requieren validación runtime antes de convertirse en tipos canónicos.
23. una versión crítica desconocida o incompatible falla cerrada.
24. no se crean packages paralelos de autorización o contexto.
25. no se modifica código, SQL, Supabase, RLS, RPC, migraciones, datos o packages físicos.
26. la materialización queda asignada a tareas canónicas existentes y no se inicia aquí.
27. `SHELL-CON-008` permanece exclusivamente reservada.

---

#### 31. Criterios de aceptación

`SHELL-CON-007` queda documentalmente cerrada cuando se cumplan simultáneamente:

- la familia `vento.authorization.response-contracts@1.0.0` queda identificada como fuente de los contratos contextuales compartidos;
- `AccessContextV1` conserva todos sus nodos directos, nulabilidad y cardinalidad;
- el inventario de nodos del contexto real tiene una disposición explícita para cada identidad;
- `SimulationContextV1` permanece aislado del contexto real;
- los dos contratos de decisión permanecen separados de los tipos de contexto;
- `BaseRoleCode`, `OperationalRoleCode` y `AppCode` se reutilizan sin crear uniones locales;
- el octavo rol base entra en los tipos sin cambiar la forma serializada de `AccessContext@1.x`;
- `EffectiveContext`, `administrative_bypass`, `bypass_applied`, `can_operate`, `simulation_id` real y metadata genérica no se promueven a contrato canónico;
- `LaneReadiness` y `StructuralIssue` conservan sus formas aprobadas;
- la centralización de códigos exactos permanece reservada a `SHELL-CON-008`;
- todos los cambios físicos quedan vinculados a tareas propietarias existentes;
- no se crea una nueva versión contractual ni de schema;
- se incorpora exactamente `TREQ-SHELL-043` y ningún otro requisito;
- la continuidad reserva exclusivamente `SHELL-CON-008`.

---

#### 32. Continuidad canónica

##### ÚLTIMA TAREA APROBADA

SHELL-CON-006 — Centralizar scopes

##### TAREA ACTUAL APROBADA

SHELL-CON-007 — Centralizar tipos de contexto

##### SIGUIENTE TAREA RESERVADA

SHELL-CON-008 — Centralizar códigos de error


### ✅ SHELL-CON-008 — Centralizar códigos de error

**Estado:** APROBADA
**Tarea anterior:** SHELL-CON-007 — Centralizar tipos de contexto
**Tarea siguiente:** SHELL-CON-009 — Centralizar identificadores de procesos
**Tipo de tarea:** Documental
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 1

---

#### 1. Propósito

`SHELL-CON-008` centraliza los vocabularios contractuales cerrados que Vento OS utiliza para representar razones públicas de autorización, inconsistencias estructurales del contexto y razones normales de disponibilidad de carril.

La tarea materializa una frontera compartida que evita mezclar tres conceptos distintos:

```text
AuthorizationReasonCode
→ razón pública de una denegación o fallo técnico ya clasificado

StructuralIssueCode
→ contradicción o invalidez estructural detectada durante la resolución de AccessContext

LaneAvailabilityReasonCode
→ ausencia o estado válido que explica disponibilidad de un carril sin constituir StructuralIssue
```

Regla principal:

```text
CÓDIGO PÚBLICO
≠ CÓDIGO ESTRUCTURAL
≠ RAZÓN DE DISPONIBILIDAD
≠ CÓDIGO HTTP
≠ EXCEPCIÓN
≠ SQLSTATE
≠ ESTADO INTERACTIVO AUXILIAR
```

No se crea un tipo catch-all `ErrorCode`.

---

#### 2. Resultado canónico

Se centralizan exactamente estas superficies:

| Tipo compartido              | Cantidad | Fuente canónica                                         | Uso                              |
| ---------------------------- | -------: | ------------------------------------------------------- | -------------------------------- |
| `AuthorizationReasonCode`    |   **20** | `AUTH-ERR-020` / `vento.authorization.messages@1.0.0`   | respuesta pública y presentación |
| `StructuralIssueCode`        |  **100** | `AUTH-CTX-015` / `AccessContext@1.0.0`                  | `StructuralIssue.issue_code`     |
| `LaneAvailabilityReasonCode` |   **10** | `AUTH-CTX-015` / `AccessContext@1.0.0`                  | ausencia o disponibilidad normal |
| `LaneReasonCode`             |  **110** | composición exacta de los dos vocabularios contextuales | `LaneReadiness.reason_codes`     |
| `StructuralIssueSeverity`    |    **5** | `AUTH-CTX-015`                                          | severidad estructural            |
| `StructuralIssueSubjectType` |   **17** | `AUTH-CTX-015`                                          | sujeto estructural               |
| `StructuralIssueSource`      |   **15** | `AUTH-CTX-015`                                          | resolver propietario             |

Conciliación:

```text
AuthorizationReasonCode      = 20
StructuralIssueCode          = 100
LaneAvailabilityReasonCode   = 10
LaneReasonCode               = 100 + 10 = 110

intersección StructuralIssueCode / LaneAvailabilityReasonCode = 0
intersección AuthorizationReasonCode / LaneReasonCode = 0
aliases nuevos = 0
wildcards = 0
códigos locales admitidos = 0
```

---

#### 3. Fuentes y precedencia

Esta tarea conserva las decisiones aprobadas de:

| Fuente                                              | Uso vinculante                                                                                         |
| --------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`        | continuidad, granularidad y trazabilidad                                                               |
| `docs/plan-canonico/modular/delivery-contract.json` | estructura documental y coordinación TREQ                                                              |
| `docs/plan-canonico/modular/active-sequence.json`   | `SHELL-CON-008` como tarea vigente                                                                     |
| `AUTH-CTX-001`                                      | forma raíz de `AccessContext`                                                                          |
| `AUTH-CTX-004`                                      | versionado de `vento.authorization.response-contracts@1.0.0`                                           |
| `AUTH-CTX-015`                                      | catálogo de 100 problemas estructurales, diez razones de disponibilidad y metadatos asociados          |
| `AUTH-ERR-001` a `AUTH-ERR-019`                     | semántica causal de las razones públicas                                                               |
| `AUTH-ERR-020`                                      | catálogo público de veinte `AuthorizationReasonCode` y distribución desde `vento-shell`                |
| `SHELL-CON-007`                                     | formas `LaneReadiness` y `StructuralIssue` y reserva explícita de sus uniones cerradas para esta tarea |
| `TREQ-AUTH-319` a `TREQ-AUTH-328`                   | protección existente del catálogo público, distribución, consumidores y gates                          |

Precedencia:

```text
AUTH-CTX-015
→ gobierna códigos y metadata estructural

AUTH-ERR-020
→ gobierna códigos públicos y mensajes

SHELL-CON-008
→ centraliza los tipos compartidos
→ no redefine su semántica
```

---

#### 4. Línea base verificable

El estado físico actual no satisface todavía la centralización:

| Elemento                                      | Estado observado                                                    | Disposición                                                                                                           |
| --------------------------------------------- | ------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| `@vento/contracts/authorization`              | no existe físicamente como package publicado en el workspace actual | `E5-GATE-008` → `SHELL-CI-020`; build en `SHELL-CI-002`, release en `SHELL-CI-003` y compatibilidad en `SHELL-CI-005` |
| `@vento/os-context@0.1.0`                     | existe como package parcial                                         | consumidor/adaptador posterior                                                                                        |
| `EffectiveContext.blocked_reasons`            | `string[]`                                                          | compatibilidad temporal; no vocabulario canónico                                                                      |
| `StructuralIssue.issue_code` documental       | `string`                                                            | se restringe conceptualmente a `StructuralIssueCode`                                                                  |
| `LaneReadiness.reason_codes` documental       | `string[]`                                                          | se restringe conceptualmente a `LaneReasonCode[]`                                                                     |
| catálogo `vento.authorization.messages@1.0.0` | definido documentalmente                                            | materialización en `SHELL-CI-020` y publicación versionada en `SHELL-CI-003`                                          |
| reason codes en código compartido             | no observados como export canónico físico                           | exports/materialización en `SHELL-AUTH-001` y `SHELL-CI-020`; compatibilidad en `SHELL-CI-018`                        |
| cambios físicos en `SHELL-CON-008`            | no autorizados                                                      | ninguno                                                                                                               |

La forma física parcial no redefine los contratos.

---

#### 5. Frontera de propiedad

La distribución futura conserva:

```text
@vento/contracts/authorization
→ AuthorizationReasonCode
→ StructuralIssueCode
→ LaneAvailabilityReasonCode
→ LaneReasonCode
→ StructuralIssueSeverity
→ StructuralIssueSubjectType
→ StructuralIssueSource
→ catálogos, schemas y validadores contractuales

@vento/os-context
→ consume los tipos
→ produce contexto y razones seguras
→ adapta superficies legacy
→ no inventa códigos

@vento/ui-web
→ consume AuthorizationReasonCode y perfiles
→ no inventa razones
→ no decide autorización

Supabase / evaluador
→ produce hechos, contexto y decisión autoritativos
→ no usa texto humano como protocolo
```

No se crea un segundo namespace paralelo de códigos.

---

#### 6. `AuthorizationReasonCode`

La unión pública cerrada contiene exactamente veinte miembros:

```text
AUTH_NO_SESSION
AUTH_USER_INACTIVE
AUTH_APP_ACCESS_DENIED
AUTH_ADMIN_PERMISSION_DENIED
AUTH_OPERATIONAL_PERMISSION_DENIED
AUTH_SITE_ASSIGNMENT_REQUIRED
AUTH_ACTIVE_SITE_REQUIRED
AUTH_AREA_ASSIGNMENT_REQUIRED
AUTH_ACTIVE_AREA_REQUIRED
AUTH_PUBLISHED_SHIFT_REQUIRED
AUTH_OUTSIDE_SHIFT_WINDOW
AUTH_CHECKIN_REQUIRED
AUTH_OPERATIONAL_ROLE_REQUIRED
AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE
AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA
AUTH_SHARED_DEVICE_NOT_AUTHORIZED
AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION
AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT
AUTH_PERMISSION_NOT_REGISTERED
AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE
```

Proyección TypeScript conceptual:

```text
type AuthorizationReasonCode =
  | "AUTH_NO_SESSION"
  | "AUTH_USER_INACTIVE"
  | "AUTH_APP_ACCESS_DENIED"
  | "AUTH_ADMIN_PERMISSION_DENIED"
  | "AUTH_OPERATIONAL_PERMISSION_DENIED"
  | "AUTH_SITE_ASSIGNMENT_REQUIRED"
  | "AUTH_ACTIVE_SITE_REQUIRED"
  | "AUTH_AREA_ASSIGNMENT_REQUIRED"
  | "AUTH_ACTIVE_AREA_REQUIRED"
  | "AUTH_PUBLISHED_SHIFT_REQUIRED"
  | "AUTH_OUTSIDE_SHIFT_WINDOW"
  | "AUTH_CHECKIN_REQUIRED"
  | "AUTH_OPERATIONAL_ROLE_REQUIRED"
  | "AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE"
  | "AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA"
  | "AUTH_SHARED_DEVICE_NOT_AUTHORIZED"
  | "AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION"
  | "AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT"
  | "AUTH_PERMISSION_NOT_REGISTERED"
  | "AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE";
```

Identidad del catálogo propietario:

```text
catalog_id = vento.authorization.messages
catalog_version = 1.0.0
schema_version = 1.0.0
source_locale = es-CO
reason_count = 20
```

Reglas:

1. los veinte códigos son estables y únicos;
2. no se traducen;
3. no se normalizan por nombre;
4. no admiten prefijos, patrones ni wildcards;
5. un consumidor no puede agregar códigos locales;
6. un código desconocido no se remapea silenciosamente a una razón conocida;
7. el copy es presentación, no identidad;
8. la razón pública no expone `StructuralIssueCode` automáticamente;
9. un código HTTP no sustituye `AuthorizationReasonCode`;
10. `AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE` conserva la semántica técnica definida por `AUTH-ERR-019` y no se usa como fallback genérico para cualquier valor desconocido.

---

#### 7. Estados interactivos excluidos

Los estados:

```text
ACTOR_IDENTIFICATION_REQUIRED
STRONG_REAUTHENTICATION_REQUIRED
```

permanecen fuera de `AuthorizationReasonCode`.

Son estados interactivos auxiliares con contratos propietarios separados y no se convierten en denegaciones públicas por conveniencia de UI.

Por tanto:

```text
auxiliary_interaction_state_count = 2
AuthorizationReasonCode_count = 20
intersección = 0
```

---

#### 8. `StructuralIssueCode`

`StructuralIssueCode` contiene exactamente cien miembros asociados a `AccessContext@1.0.0`.

##### Autenticación, principal, identidad y actor

```text
AUTH_UNAUTHENTICATED
PRINCIPAL_NOT_LINKED
PRINCIPAL_AMBIGUOUS
PRINCIPAL_INACTIVE
PRINCIPAL_TYPE_INVALID
PRINCIPAL_SUBJECT_MISMATCH
DOMAIN_IDENTITY_AMBIGUOUS
DOMAIN_IDENTITY_INACTIVE
ACTOR_TYPE_INVALID
ACTOR_ATTRIBUTION_INVALID
ACTOR_PRINCIPAL_MISMATCH
DELEGATION_INVALID
```

##### Identidad laboral y rol base

```text
EMPLOYEE_MISSING
EMPLOYEE_AMBIGUOUS
EMPLOYEE_ACTOR_MISMATCH
EMPLOYEE_STATUS_INVALID
BASE_ROLE_MISSING
BASE_ROLE_AMBIGUOUS
BASE_ROLE_UNKNOWN
BASE_ROLE_INACTIVE
BASE_ROLE_ACTOR_MISMATCH
BASE_ROLE_LEGACY_UNMAPPED
```

##### Asignaciones y cobertura administrativa

```text
SITE_ASSIGNMENT_DUPLICATE_CONFLICT
SITE_ASSIGNMENT_MULTIPLE_PRIMARY
SITE_ASSIGNMENT_UNKNOWN_SITE
AREA_ASSIGNMENT_DUPLICATE_CONFLICT
AREA_ASSIGNMENT_MULTIPLE_PRIMARY
AREA_ASSIGNMENT_UNKNOWN_AREA
AREA_ASSIGNMENT_SITE_MISMATCH
ADMIN_COVERAGE_MODE_INVALID
ADMIN_COVERAGE_SOURCE_INVALID
ADMIN_COVERAGE_SHAPE_INVALID
ADMIN_COVERAGE_EXPANDS_ROLE
ADMIN_COVERAGE_NONDETERMINISTIC
```

##### Turno publicado y vigente

```text
SHIFT_REVISION_AMBIGUOUS
SHIFT_UNPUBLISHED_SELECTED
SHIFT_KIND_INVALID
SHIFT_TIME_RANGE_INVALID
SHIFT_TIMEZONE_INVALID
SHIFT_EMPLOYEE_MISMATCH
SHIFT_SITE_INVALID
SHIFT_AREA_SITE_MISMATCH
SHIFT_OPERATIONAL_ROLE_MISSING
SHIFT_STATUS_INVALID
SHIFT_OVERLAP
SHIFT_FIELDS_MIXED_REVISIONS
SHIFT_CLIENT_SELECTED
```

##### Sesión de check-in

```text
CHECKIN_UNCONFIRMED_AS_ACTIVE
CHECKIN_SESSION_ID_MISSING
CHECKIN_ACTOR_MISMATCH
CHECKIN_SHIFT_MISMATCH
CHECKIN_SITE_MISMATCH
CHECKIN_AREA_MISMATCH
CHECKIN_TIME_INVALID
CHECKIN_SESSION_AMBIGUOUS
CHECKIN_EXPIRED_AS_ACTIVE
CHECKIN_CLOSED_AS_ACTIVE
CHECKIN_OUTLIVES_SHIFT
CHECKIN_TERMINAL_LINK_INVALID
CHECKIN_OFFLINE_PENDING_AS_ACTIVE
```

##### Rol y territorio operativos

```text
OPERATIONAL_ROLE_UNKNOWN
OPERATIONAL_ROLE_INACTIVE
OPERATIONAL_ROLE_DEPRECATED
OPERATIONAL_ROLE_SHIFT_MISMATCH
OPERATIONAL_ROLE_SITE_NOT_ENABLED
OPERATIONAL_ROLE_AREA_NOT_ENABLED
OPERATIONAL_ROLE_AREA_REQUIRED
OPERATIONAL_ROLE_CONFIGURATION_CONFLICT
OPERATIONAL_SITE_UNKNOWN
OPERATIONAL_SITE_INACTIVE
OPERATIONAL_SITE_ASSIGNMENT_INVALID
OPERATIONAL_SITE_SOURCE_MISMATCH
OPERATIONAL_AREA_UNKNOWN
OPERATIONAL_AREA_INACTIVE
OPERATIONAL_AREA_SITE_MISMATCH
OPERATIONAL_AREA_ROLE_MISMATCH
OPERATIONAL_AREA_SOURCE_INVALID
```

##### Dispositivo compartido

```text
DEVICE_UNRESOLVED
DEVICE_AUTH_LINK_INVALID
DEVICE_INACTIVE
DEVICE_CONFIGURATION_INVALID
DEVICE_TEMPLATE_INVALID
DEVICE_INSTANCE_EXPANDS_TEMPLATE
DEVICE_ACTOR_SESSION_AMBIGUOUS
DEVICE_ACTOR_SESSION_EXPIRED_AS_ACTIVE
DEVICE_ACTOR_MISMATCH
DEVICE_APPLICATION_CONFIGURATION_INVALID
DEVICE_CAPABILITY_PACKAGE_INVALID
DEVICE_NOT_ALLOWED_PERMISSION_CONFIGURED
DEVICE_TERRITORY_MISMATCH
DEVICE_NAVIGATION_ROLE_USED_AS_AUTHORITY
```

##### Configuración, contrato y frescura

```text
STRUCTURAL_ISSUE_CODE_UNKNOWN
STRUCTURAL_ISSUE_METADATA_INVALID
RESOLVER_CONFIGURATION_MISSING
RESOLVER_CONFIGURATION_AMBIGUOUS
CONTRACT_VERSION_UNSUPPORTED
SCHEMA_VERSION_UNSUPPORTED
RESOLUTION_TIME_INVALID
CONTEXT_SNAPSHOT_MIXED
CONTEXT_STALE
```

Proyección TypeScript conceptual:

```text
type StructuralIssueCode =
  | "AUTH_UNAUTHENTICATED"
  | "PRINCIPAL_NOT_LINKED"
  | "PRINCIPAL_AMBIGUOUS"
  | "PRINCIPAL_INACTIVE"
  | "PRINCIPAL_TYPE_INVALID"
  | "PRINCIPAL_SUBJECT_MISMATCH"
  | "DOMAIN_IDENTITY_AMBIGUOUS"
  | "DOMAIN_IDENTITY_INACTIVE"
  | "ACTOR_TYPE_INVALID"
  | "ACTOR_ATTRIBUTION_INVALID"
  | "ACTOR_PRINCIPAL_MISMATCH"
  | "DELEGATION_INVALID"
  | "EMPLOYEE_MISSING"
  | "EMPLOYEE_AMBIGUOUS"
  | "EMPLOYEE_ACTOR_MISMATCH"
  | "EMPLOYEE_STATUS_INVALID"
  | "BASE_ROLE_MISSING"
  | "BASE_ROLE_AMBIGUOUS"
  | "BASE_ROLE_UNKNOWN"
  | "BASE_ROLE_INACTIVE"
  | "BASE_ROLE_ACTOR_MISMATCH"
  | "BASE_ROLE_LEGACY_UNMAPPED"
  | "SITE_ASSIGNMENT_DUPLICATE_CONFLICT"
  | "SITE_ASSIGNMENT_MULTIPLE_PRIMARY"
  | "SITE_ASSIGNMENT_UNKNOWN_SITE"
  | "AREA_ASSIGNMENT_DUPLICATE_CONFLICT"
  | "AREA_ASSIGNMENT_MULTIPLE_PRIMARY"
  | "AREA_ASSIGNMENT_UNKNOWN_AREA"
  | "AREA_ASSIGNMENT_SITE_MISMATCH"
  | "ADMIN_COVERAGE_MODE_INVALID"
  | "ADMIN_COVERAGE_SOURCE_INVALID"
  | "ADMIN_COVERAGE_SHAPE_INVALID"
  | "ADMIN_COVERAGE_EXPANDS_ROLE"
  | "ADMIN_COVERAGE_NONDETERMINISTIC"
  | "SHIFT_REVISION_AMBIGUOUS"
  | "SHIFT_UNPUBLISHED_SELECTED"
  | "SHIFT_KIND_INVALID"
  | "SHIFT_TIME_RANGE_INVALID"
  | "SHIFT_TIMEZONE_INVALID"
  | "SHIFT_EMPLOYEE_MISMATCH"
  | "SHIFT_SITE_INVALID"
  | "SHIFT_AREA_SITE_MISMATCH"
  | "SHIFT_OPERATIONAL_ROLE_MISSING"
  | "SHIFT_STATUS_INVALID"
  | "SHIFT_OVERLAP"
  | "SHIFT_FIELDS_MIXED_REVISIONS"
  | "SHIFT_CLIENT_SELECTED"
  | "CHECKIN_UNCONFIRMED_AS_ACTIVE"
  | "CHECKIN_SESSION_ID_MISSING"
  | "CHECKIN_ACTOR_MISMATCH"
  | "CHECKIN_SHIFT_MISMATCH"
  | "CHECKIN_SITE_MISMATCH"
  | "CHECKIN_AREA_MISMATCH"
  | "CHECKIN_TIME_INVALID"
  | "CHECKIN_SESSION_AMBIGUOUS"
  | "CHECKIN_EXPIRED_AS_ACTIVE"
  | "CHECKIN_CLOSED_AS_ACTIVE"
  | "CHECKIN_OUTLIVES_SHIFT"
  | "CHECKIN_TERMINAL_LINK_INVALID"
  | "CHECKIN_OFFLINE_PENDING_AS_ACTIVE"
  | "OPERATIONAL_ROLE_UNKNOWN"
  | "OPERATIONAL_ROLE_INACTIVE"
  | "OPERATIONAL_ROLE_DEPRECATED"
  | "OPERATIONAL_ROLE_SHIFT_MISMATCH"
  | "OPERATIONAL_ROLE_SITE_NOT_ENABLED"
  | "OPERATIONAL_ROLE_AREA_NOT_ENABLED"
  | "OPERATIONAL_ROLE_AREA_REQUIRED"
  | "OPERATIONAL_ROLE_CONFIGURATION_CONFLICT"
  | "OPERATIONAL_SITE_UNKNOWN"
  | "OPERATIONAL_SITE_INACTIVE"
  | "OPERATIONAL_SITE_ASSIGNMENT_INVALID"
  | "OPERATIONAL_SITE_SOURCE_MISMATCH"
  | "OPERATIONAL_AREA_UNKNOWN"
  | "OPERATIONAL_AREA_INACTIVE"
  | "OPERATIONAL_AREA_SITE_MISMATCH"
  | "OPERATIONAL_AREA_ROLE_MISMATCH"
  | "OPERATIONAL_AREA_SOURCE_INVALID"
  | "DEVICE_UNRESOLVED"
  | "DEVICE_AUTH_LINK_INVALID"
  | "DEVICE_INACTIVE"
  | "DEVICE_CONFIGURATION_INVALID"
  | "DEVICE_TEMPLATE_INVALID"
  | "DEVICE_INSTANCE_EXPANDS_TEMPLATE"
  | "DEVICE_ACTOR_SESSION_AMBIGUOUS"
  | "DEVICE_ACTOR_SESSION_EXPIRED_AS_ACTIVE"
  | "DEVICE_ACTOR_MISMATCH"
  | "DEVICE_APPLICATION_CONFIGURATION_INVALID"
  | "DEVICE_CAPABILITY_PACKAGE_INVALID"
  | "DEVICE_NOT_ALLOWED_PERMISSION_CONFIGURED"
  | "DEVICE_TERRITORY_MISMATCH"
  | "DEVICE_NAVIGATION_ROLE_USED_AS_AUTHORITY"
  | "STRUCTURAL_ISSUE_CODE_UNKNOWN"
  | "STRUCTURAL_ISSUE_METADATA_INVALID"
  | "RESOLVER_CONFIGURATION_MISSING"
  | "RESOLVER_CONFIGURATION_AMBIGUOUS"
  | "CONTRACT_VERSION_UNSUPPORTED"
  | "SCHEMA_VERSION_UNSUPPORTED"
  | "RESOLUTION_TIME_INVALID"
  | "CONTEXT_SNAPSHOT_MIXED"
  | "CONTEXT_STALE";
```

Reglas:

1. todos los miembros usan `UPPER_SNAKE_CASE`;
2. un código conserva significado, severidad, sujeto, fuente y mensaje seguro;
3. no se construye dinámicamente;
4. no se traduce;
5. no se reutiliza con otra semántica;
6. no se admite un código local dentro de `StructuralIssue`;
7. `STRUCTURAL_ISSUE_CODE_UNKNOWN` representa la detección de un código no reconocido;
8. `STRUCTURAL_ISSUE_METADATA_INVALID` representa metadata incompatible con el catálogo;
9. ambas condiciones fallan cerradas;
10. una ausencia ordinaria no se convierte en `StructuralIssueCode`.

---

#### 9. `StructuralIssueSeverity`

La unión cerrada permanece:

```text
type StructuralIssueSeverity =
  | "BLOCKING_ALL"
  | "BLOCKING_BASE"
  | "BLOCKING_OPERATIONAL"
  | "WARNING"
  | "INFO";
```

Precedencia:

```text
BLOCKING_ALL
>
BLOCKING_BASE / BLOCKING_OPERATIONAL
>
WARNING
>
INFO
```

`WARNING` e `INFO` no conceden autoridad ni pueden ocultar un bloqueo.

---

#### 10. `StructuralIssueSubjectType`

Los tipos de sujeto permitidos son exactamente diecisiete:

```text
PRINCIPAL
DOMAIN_IDENTITY
ACTOR
EMPLOYEE
BASE_ROLE
SITE_ASSIGNMENT
AREA_ASSIGNMENT
ADMINISTRATIVE_COVERAGE
SHIFT
CHECKIN_SESSION
OPERATIONAL_ROLE
OPERATIONAL_SITE
OPERATIONAL_AREA
DEVICE
DEVICE_ACTOR_SESSION
CONFIGURATION
CONTEXT
```

Proyección:

```text
type StructuralIssueSubjectType =
  | "PRINCIPAL"
  | "DOMAIN_IDENTITY"
  | "ACTOR"
  | "EMPLOYEE"
  | "BASE_ROLE"
  | "SITE_ASSIGNMENT"
  | "AREA_ASSIGNMENT"
  | "ADMINISTRATIVE_COVERAGE"
  | "SHIFT"
  | "CHECKIN_SESSION"
  | "OPERATIONAL_ROLE"
  | "OPERATIONAL_SITE"
  | "OPERATIONAL_AREA"
  | "DEVICE"
  | "DEVICE_ACTOR_SESSION"
  | "CONFIGURATION"
  | "CONTEXT";
```

No se sustituyen por nombres de tablas, nombres de aplicación ni tipos locales.

---

#### 11. `StructuralIssueSource`

Las fuentes resolutoras permitidas son exactamente quince:

```text
PRINCIPAL_RESOLVER
DOMAIN_IDENTITY_RESOLVER
ACTOR_RESOLVER
EMPLOYEE_RESOLVER
BASE_ROLE_RESOLVER
ASSIGNMENT_RESOLVER
ADMINISTRATIVE_COVERAGE_RESOLVER
SHIFT_RESOLVER
CHECKIN_RESOLVER
OPERATIONAL_ROLE_RESOLVER
OPERATIONAL_TERRITORY_RESOLVER
DEVICE_RESOLVER
DEVICE_SESSION_RESOLVER
CONTEXT_VALIDATOR
FRESHNESS_RESOLVER
```

Proyección:

```text
type StructuralIssueSource =
  | "PRINCIPAL_RESOLVER"
  | "DOMAIN_IDENTITY_RESOLVER"
  | "ACTOR_RESOLVER"
  | "EMPLOYEE_RESOLVER"
  | "BASE_ROLE_RESOLVER"
  | "ASSIGNMENT_RESOLVER"
  | "ADMINISTRATIVE_COVERAGE_RESOLVER"
  | "SHIFT_RESOLVER"
  | "CHECKIN_RESOLVER"
  | "OPERATIONAL_ROLE_RESOLVER"
  | "OPERATIONAL_TERRITORY_RESOLVER"
  | "DEVICE_RESOLVER"
  | "DEVICE_SESSION_RESOLVER"
  | "CONTEXT_VALIDATOR"
  | "FRESHNESS_RESOLVER";
```

Cada `StructuralIssueCode` conserva su fuente propietaria conforme a `AUTH-CTX-015`. Un resolver dependiente no debe duplicar el mismo problema con otra fuente.

---

#### 12. Forma tipada de `StructuralIssue`

La forma serializada de `AccessContext@1.0.0` no cambia.

La proyección estática pasa conceptualmente de strings genéricos a los tipos ya aprobados:

```text
type StructuralIssue = {
  issue_code: StructuralIssueCode;
  severity: StructuralIssueSeverity;
  subject_type: StructuralIssueSubjectType;
  subject_id: string | null;
  source: StructuralIssueSource;
  safe_message: string;
};
```

`safe_message` continúa procediendo del catálogo canónico. No se construye desde excepciones, SQL, tablas, datos personales ni stack traces.

La restricción de tipos no modifica nombres de campos, cardinalidad, nulabilidad ni serialización.

---

#### 13. `LaneAvailabilityReasonCode`

Las ausencias o estados normales que pueden explicar disponibilidad de carril son exactamente diez:

```text
NON_LABOR_ACTOR
DEVICE_ACTOR_SESSION_NOT_AVAILABLE
EMPLOYEE_INACTIVE
NO_ACTIVE_SHIFT
NO_ACTIVE_CHECKIN
NO_OPERATIONAL_AREA
BASE_ROLE_NOT_AVAILABLE
ADMINISTRATIVE_COVERAGE_NOT_AVAILABLE
OPERATIONAL_ROLE_NOT_AVAILABLE
OPERATIONAL_SITE_NOT_AVAILABLE
```

Proyección:

```text
type LaneAvailabilityReasonCode =
  | "NON_LABOR_ACTOR"
  | "DEVICE_ACTOR_SESSION_NOT_AVAILABLE"
  | "EMPLOYEE_INACTIVE"
  | "NO_ACTIVE_SHIFT"
  | "NO_ACTIVE_CHECKIN"
  | "NO_OPERATIONAL_AREA"
  | "BASE_ROLE_NOT_AVAILABLE"
  | "ADMINISTRATIVE_COVERAGE_NOT_AVAILABLE"
  | "OPERATIONAL_ROLE_NOT_AVAILABLE"
  | "OPERATIONAL_SITE_NOT_AVAILABLE";
```

Reglas:

1. estos códigos no son `StructuralIssue`;
2. no se agregan a `structural_issues`;
3. no sustituyen un bloqueo estructural;
4. no convierten una contradicción en `UNAVAILABLE`;
5. pueden coexistir con `READY` únicamente bajo la semántica aprobada de `AUTH-CTX-015`;
6. una lista vacía no significa `ALLOW`.

---

#### 14. `LaneReasonCode`

`LaneReadiness.reason_codes` puede contener códigos estructurales aplicables al carril y razones normales de disponibilidad.

La unión exacta queda:

```text
type LaneReasonCode =
  | StructuralIssueCode
  | LaneAvailabilityReasonCode;
```

Cardinalidad del vocabulario:

```text
100 + 10 = 110
```

La forma tipada de `LaneReadiness` queda conceptualmente:

```text
type LaneReadiness = {
  status: "READY" | "UNAVAILABLE" | "INVALID" | "NOT_APPLICABLE";
  reason_codes: LaneReasonCode[];
};
```

La forma serializada permanece compatible con `AccessContext@1.0.0`.

---

#### 15. Orden y deduplicación

Se conserva el orden canónico de `AUTH-CTX-015`.

`structural_issues`:

```text
1. rango de severity
2. issue_code
3. subject_type
4. subject_id, usando cadena vacía cuando sea null
5. source
```

Rango:

```text
BLOCKING_ALL         = 1
BLOCKING_BASE        = 2
BLOCKING_OPERATIONAL = 3
WARNING              = 4
INFO                 = 5
```

`LaneReadiness.reason_codes`:

```text
1. StructuralIssueCode aplicables, en orden estructural canónico
2. LaneAvailabilityReasonCode, alfabéticamente
3. sin duplicados
```

No se utiliza el orden de llegada de filas, errores o promesas como criterio contractual.

---

#### 16. Separación frente a razones públicas

No existe una conversión nominal automática:

```text
StructuralIssueCode
-x-> AuthorizationReasonCode
```

Ni:

```text
LaneAvailabilityReasonCode
-x-> AuthorizationReasonCode
```

La selección de una razón pública pertenece al evaluador de autorización y a las reglas de precedencia aprobadas en `AUTH-ERR-*`.

Ejemplos de prohibiciones:

- `NO_ACTIVE_CHECKIN` no se transforma por string matching;
- `BASE_ROLE_UNKNOWN` no se publica automáticamente como texto estructural;
- `CONTEXT_STALE` no se transforma automáticamente en indisponibilidad técnica;
- `AUTH_CHECKIN_REQUIRED` no se inserta dentro de `structural_issues`;
- `AUTH_PERMISSION_NOT_REGISTERED` no se utiliza como razón de readiness.

La misma realidad puede participar en distintos niveles del pipeline, pero cada contrato conserva su propio namespace.

---

#### 17. Códigos expresamente fuera de alcance

No forman parte de los tres vocabularios centralizados:

- códigos HTTP como `401`, `403`, `409`, `500` o `503`;
- SQLSTATE;
- mensajes o códigos nativos de Supabase;
- nombres de excepciones;
- textos de `Error.message`;
- familias privadas de fallo técnico;
- `AuthorizationSourceStatus`;
- códigos funcionales de otros dominios;
- claves de UI;
- rutas;
- query parameters;
- `returnTo`;
- `message_code`;
- `state` de un envelope técnico;
- los dos estados interactivos auxiliares;
- `blocked_reasons` legacy libres.

Esos valores no se convierten en `AuthorizationReasonCode`, `StructuralIssueCode` ni `LaneAvailabilityReasonCode` mediante cast.

---

#### 18. Validación de entradas externas

Datos provenientes de JSON, RPC, Supabase, eventos, APIs, almacenamiento local o consumidores legacy son no confiables hasta validación.

Queda prohibido usar:

```text
value as AuthorizationReasonCode
value as StructuralIssueCode
value as LaneAvailabilityReasonCode
```

como sustituto de validación runtime.

Comportamiento:

```text
código público desconocido
→ incompatibilidad contractual
→ no remap silencioso

issue_code desconocido
→ STRUCTURAL_ISSUE_CODE_UNKNOWN
→ fail closed

metadata estructural incompatible
→ STRUCTURAL_ISSUE_METADATA_INVALID
→ fail closed

availability reason desconocida
→ contexto no conforme
→ fail closed
```

---

#### 19. Relación con el catálogo público de mensajes

`AuthorizationReasonCode` mantiene una relación 1:N con perfiles de presentación cuando el catálogo así lo define.

La identidad de razón permanece separada de:

- `profile_key`;
- título;
- mensaje;
- acciones;
- locale;
- HTTP;
- soporte;
- retry;
- presentación visual.

`SHELL-CON-008` centraliza el tipo de código y su frontera contractual; no vuelve a definir los veinticinco perfiles ni altera el copy aprobado por `AUTH-ERR-020`.

La futura publicación deberá conservar versión, hash del contenido, commit fuente y procedencia verificable conforme a `TREQ-AUTH-319`. Esta tarea no inventa una huella que todavía no haya sido publicada por la fase física correspondiente.

---

#### 20. Versionado

Se mantienen sin cambio:

```text
vento.authorization.response-contracts@1.0.0
AccessContext@1.0.0
schema_version = 1.0.0
release_hash = sha256:782a216c4bbfdc3b3cec1bbd7239c05d93edd7fa34b4ce62cad48c1e6b9941cd
```

Y para el catálogo público:

```text
vento.authorization.messages@1.0.0
schema_version = 1.0.0
source_locale = es-CO
```

La centralización de uniones literales no cambia el JSON publicado.

Un cambio incompatible incluye:

- retirar un código existente;
- reutilizarlo con otro significado;
- cambiar metadata estructural vinculante;
- mover una razón de un namespace a otro;
- convertir un estado auxiliar en razón pública;
- permitir aliases equivalentes;
- cambiar la forma serializada de los contratos.

La adición futura de códigos deberá seguir el versionado y gobierno de su fuente propietaria.

---

#### 21. Reconciliación de `EffectiveContext.blocked_reasons`

La superficie física actual:

```text
blocked_reasons: string[]
```

no constituye `LaneReasonCode[]` ni `AuthorizationReasonCode[]`.

Disposición:

| Estado legacy                             | Tratamiento                                                  |
| ----------------------------------------- | ------------------------------------------------------------ |
| string coincidente sin validación         | no canónico                                                  |
| código local no catalogado                | incompatibilidad                                             |
| razón pública dentro de `blocked_reasons` | no se promueve a readiness                                   |
| código estructural válido                 | solo podrá proyectarse tras validación y adapter propietario |
| availability reason válida                | solo podrá proyectarse tras validación y semántica de carril |
| texto humano                              | nunca es código                                              |
| valor desconocido                         | fail closed                                                  |

La migración física corresponde a las tareas de SDK y contexto, no a esta tarea documental.

---

#### 22. Destinos de materialización

Las responsabilidades posteriores quedan asignadas:

| Resultado físico                                          | Tarea propietaria |
| --------------------------------------------------------- | ----------------- |
| exports, schemas, tipos y versionado en el SDK compartido | `SHELL-AUTH-001`  |
| módulo contextual y consumo de los tipos                  | `SHELL-CTX-001`   |
| readiness tipado                                          | `SHELL-CTX-004`   |
| razones seguras de bloqueo contextual                     | `SHELL-CTX-005`   |
| adapters y proyecciones seguras                           | `SHELL-AUTH-002`  |
| gates contra códigos locales, casts y drift               | `SHELL-AUTH-004`  |
| adopción final de consumidores                            | `SHELL-AUTH-005`  |
| validador del catálogo público y perfiles                 | `SHELL-CI-016`    |
| validaciones TREQ y documentación ejecutable              | `SHELL-CI-017`    |
| compatibilidad e integración transversal                  | `SHELL-CI-018`    |
| productor autoritativo de contexto                        | `AUTH-DB-033`     |
| productor autoritativo de decisión                        | `AUTH-DB-034`     |

No se inicia ninguna de estas tareas.

---

#### 23. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA
**Requisitos creados:** **1**
**Requisitos modificados:** **0**

Se crea `TREQ-SHELL-044`.

| ID               | Regla protegida                                                                                                                                                                                                                                                                                                             | Riesgo                                                                                                                                               | Destino de implementación                                                                                                              |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| `TREQ-SHELL-044` | Exponer y validar como namespaces separados exactamente 20 `AuthorizationReasonCode`, 100 `StructuralIssueCode`, 10 `LaneAvailabilityReasonCode` y `LaneReasonCode = StructuralIssueCode \| LaneAvailabilityReasonCode`, preservando metadata estructural y rechazando aliases, extensiones locales y valores desconocidos. | Mezcla de semánticas, razón pública incorrecta, contradicción degradada a ausencia, código local aceptado, cast inseguro o drift entre consumidores. | `SHELL-CON-008`; `SHELL-AUTH-001`; `SHELL-CTX-001`; `SHELL-CTX-004`; `SHELL-CTX-005`; `SHELL-AUTH-004`; `SHELL-CI-016`; `SHELL-CI-018` |

El detalle operativo del requisito permanece en el Registro Canónico de Requisitos de Prueba.

---

#### 24. Decisiones vinculantes

1. No existe un `ErrorCode` genérico como autoridad contractual.
2. `AuthorizationReasonCode` contiene exactamente veinte códigos públicos.
3. `StructuralIssueCode` contiene exactamente cien códigos estructurales.
4. `LaneAvailabilityReasonCode` contiene exactamente diez razones de disponibilidad.
5. `LaneReasonCode` contiene exactamente 110 valores por composición de los dos vocabularios contextuales.
6. Los tres namespaces primarios tienen intersección vacía.
7. Los dos estados interactivos auxiliares no pertenecen a `AuthorizationReasonCode`.
8. HTTP, SQLSTATE, excepciones, familias privadas y mensajes no pertenecen a estas uniones.
9. `StructuralIssue.issue_code` se tipa conceptualmente con `StructuralIssueCode`.
10. `LaneReadiness.reason_codes` se tipa conceptualmente con `LaneReasonCode[]`.
11. `StructuralIssueSeverity` conserva cinco valores.
12. `StructuralIssueSubjectType` conserva diecisiete valores.
13. `StructuralIssueSource` conserva quince valores.
14. La metadata estructural aprobada no se redefine.
15. `safe_message` no es identidad de código.
16. La selección de razón pública no se deriva por nombre de un código contextual.
17. Códigos públicos desconocidos no reciben un fallback semántico.
18. Códigos estructurales desconocidos producen `STRUCTURAL_ISSUE_CODE_UNKNOWN`.
19. Metadata estructural incompatible produce `STRUCTURAL_ISSUE_METADATA_INVALID`.
20. Razones de disponibilidad desconocidas no se aceptan como strings libres.
21. `blocked_reasons: string[]` permanece legacy y no es fuente canónica.
22. La centralización no cambia `AccessContext@1.0.0`.
23. La centralización no cambia `vento.authorization.messages@1.0.0`.
24. No se inventa hash para una publicación física todavía inexistente.
25. No se modifica código, SQL, Supabase, migraciones, datos o packages físicos.
26. La materialización queda vinculada a tareas propietarias ya existentes.
27. `SHELL-CON-009` permanece exclusivamente reservada.

---

#### 25. Criterios de aceptación

`SHELL-CON-008` queda documentalmente cerrada cuando:

- estén enumerados exactamente los veinte códigos públicos;
- estén enumerados exactamente los cien códigos estructurales;
- estén enumeradas exactamente las diez razones de disponibilidad;
- los tres conjuntos no contengan duplicados ni cruces;
- `LaneReasonCode` sea únicamente la unión de 100 + 10;
- se preserven cinco severidades, diecisiete sujetos y quince fuentes estructurales;
- `StructuralIssue` y `LaneReadiness` conserven su forma serializada;
- los estados interactivos auxiliares permanezcan excluidos;
- no se incorporen HTTP, SQLSTATE, excepciones ni strings legacy;
- no exista mapeo nominal automático hacia la razón pública;
- los comportamientos de código desconocido fallen cerrados conforme a su contrato;
- `@vento/contracts/authorization` permanezca como destino de propiedad contractual;
- `@vento/os-context` permanezca como consumidor/adaptador y no como fuente alternativa;
- no se ejecuten cambios físicos;
- se incorpore exactamente `TREQ-SHELL-044`;
- la continuidad reserve únicamente `SHELL-CON-009`.

---

#### 26. Continuidad canónica

##### ÚLTIMA TAREA APROBADA

SHELL-CON-007 — Centralizar tipos de contexto

##### TAREA ACTUAL APROBADA

SHELL-CON-008 — Centralizar códigos de error

##### SIGUIENTE TAREA RESERVADA

SHELL-CON-009 — Centralizar identificadores de procesos


### ✅ SHELL-CON-009 — Centralizar identificadores de procesos

**Estado:** APROBADA
**Tarea anterior:** SHELL-CON-008 — Centralizar códigos de error
**Tarea siguiente:** SHELL-CON-010 — Centralizar estados de procesos
**Tipo de tarea:** Documental
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Estado físico resultante:** `CONTRATO_DE_IDENTIDAD_DE_PROCESOS_DEFINIDO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-CON-009` centraliza la identidad técnica estable de los procesos de Vento OS a partir del registro canónico ya aprobado `PROC-CANONICAL-ID-REGISTRY-001`, sin crear procesos nuevos, renumerar identidades existentes ni sustituir la semántica definida por las tareas `PROC-CAT-*`.

La frontera contractual queda:

```text
PROC-CANONICAL-ID-REGISTRY-001
→ fuente canónica de identidades de proceso

@vento/contracts
→ proyección compartida, tipada y validable de esas identidades

consumidores
→ referencian ProcessId
→ no inventan, renombran ni reasignan VPROC-####
```

Un `ProcessId` identifica un proceso empresarial canónico. No identifica una instancia, un paso, una pantalla, una acción, un evento, un estado, una aplicación propietaria, un permiso ni una implementación física.

---

#### 2. Resultado canónico

El conjunto vigente queda compuesto por exactamente **69 identidades asignadas**:

```text
VPROC-0001 .. VPROC-0069
```

Conciliación heredada y preservada:

```text
identidades asignadas          = 69
registry_status CANONICAL      = 69
MERGED_ALIAS                   = 0
SPLIT_PARENT                   = 0
RETIRED                        = 0
VOID                           = 0
faltantes dentro de 0001..0069 = 0
duplicados                     = 0
siguiente identificador libre  = VPROC-0070
```

`VPROC-0070` no pertenece todavía al conjunto vigente y no puede consumirse como `ProcessId` hasta que una tarea propietaria de procesos lo asigne formalmente conforme al gobierno del registro.

---

#### 3. Fuentes y precedencia

Esta tarea conserva las decisiones aprobadas de:

| Fuente                                                | Uso vinculante                                                                                                 |
| ----------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`          | continuidad, fase documental, trazabilidad y gobierno de requisitos de prueba                                  |
| `docs/plan-canonico/modular/delivery-contract.json`   | estructura del artefacto documental                                                                            |
| `docs/plan-canonico/modular/active-sequence.json`     | `SHELL-CON-009` como tarea vigente y `SHELL-CON-010` como siguiente tarea                                      |
| `SHELL-CON-001`                                       | raíz única `@vento/contracts`, pureza contractual y materialización posterior                                  |
| `SHELL-CON-008`                                       | continuidad inmediata hacia esta tarea y separación de namespaces contractuales                                |
| `PROC-CAT-001`                                        | frontera conceptual de proceso y gobierno del catálogo                                                         |
| `PROC-CAT-003`                                        | creación de `PROC-CANONICAL-ID-REGISTRY-001`, patrón `VPROC-####`, 69 asignaciones y regla de no reutilización |
| `PROC-CAT-020`                                        | reconciliación final: 69 `CANONICAL`, cero fusiones, divisiones, retiros o `VOID`; `VPROC-0070` disponible     |
| `TREQ-PROC-009` a `TREQ-PROC-013`                     | formato, unicidad, resolución, estabilidad, linaje y uso por consumidores                                      |
| `TREQ-PROC-111` y `TREQ-PROC-118`                     | cierre de 69 procesos canónicos y detección de deriva/duplicidad contractual                                   |
| `TREQ-SHELL-002`, `TREQ-SHELL-006` y `TREQ-SHELL-008` | fuente compartida, compatibilidad y validación documental                                                      |

Precedencia:

```text
PROC-CAT-003 / PROC-CANONICAL-ID-REGISTRY-001
→ gobiernan asignación e identidad

PROC-CAT-020
→ gobierna la reconciliación vigente del conjunto

SHELL-CON-009
→ centraliza la proyección compartida
→ no redefine procesos ni su significado
```

---

#### 4. Conciliación con el mini-bloque de contratos

La continuidad del mini-bloque permanece coherente:

```text
SHELL-CON-001
→ crea la raíz contractual compartida

SHELL-CON-002..008
→ centralizan contratos previos sin modificar la identidad de procesos

SHELL-CON-008
→ reserva SHELL-CON-009

SHELL-CON-009
→ centraliza ProcessId

SHELL-CON-010
→ queda reservada para estados de procesos
```

La secuencia específica de autorización que enlaza `SHELL-CON-001..008` con tareas `SHELL-AUTH-*` expresa dependencias del subdominio de autorización y no sustituye la continuidad global de `continuity-route.json` y `active-sequence.json`.

No se detecta una decisión aprobada en `SHELL-CON-001..008` que requiera corrección para desarrollar esta tarea.

---

#### 5. Línea base verificable

El estado físico actual permanece anterior a la materialización contractual:

| Elemento                                        | Estado observado          | Disposición                                                                                                           |
| ----------------------------------------------- | ------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| workspace `packages/*`                          | existe                    | conserva la fundación compartida                                                                                      |
| `packages/os-context`                           | existe                    | no es propietario del namespace de procesos                                                                           |
| `packages/contracts`                            | no materializado          | `E5-GATE-008` → `SHELL-CI-020`; build en `SHELL-CI-002`, release en `SHELL-CI-003` y compatibilidad en `SHELL-CI-005` |
| `@vento/contracts` publicado                    | no confirmado físicamente | no se presume release                                                                                                 |
| subpath público de procesos                     | no observado físicamente  | se define documentalmente en esta tarea                                                                               |
| `PROC-CANONICAL-ID-REGISTRY-001`                | aprobado documentalmente  | fuente de identidad                                                                                                   |
| referencias `VPROC-*` en documentación canónica | existentes                | consumidores documentales, no package compartido materializado                                                        |
| cambios físicos en `SHELL-CON-009`              | no autorizados            | ninguno                                                                                                               |

La presencia de `VPROC-*` en documentos, matrices, auditoría o integraciones no constituye por sí sola una API compartida implementada.

---

#### 6. Namespace contractual compartido

Esta tarea define el subpath lógico especializado:

```text
@vento/contracts/processes
```

Su responsabilidad pública queda limitada a contratos estáticos de identidad de procesos y a artefactos determinísticamente derivados de la fuente canónica.

Superficie conceptual mínima:

```text
@vento/contracts/processes
→ ProcessId
→ PROCESS_IDS
→ validación de formato y pertenencia
→ metadata de procedencia del registro fuente
```

No se crea físicamente el subpath, no se publica una versión y no se inventa un hash de release en esta fase.

`SHELL-CON-010` podrá ampliar este mismo dominio contractual con los estados que le correspondan, sin modificar la identidad fijada aquí.

---

#### 7. Forma canónica de `ProcessId`

La forma léxica es:

```text
VPROC-####
```

Patrón sintáctico:

```text
^VPROC-[0-9]{4}$
```

Reglas:

1. el prefijo es exactamente `VPROC-`;
2. la parte numérica utiliza exactamente cuatro dígitos;
3. `VPROC-0000` es inválido;
4. una cadena que satisfaga el patrón no se convierte automáticamente en una identidad asignada;
5. la pertenencia debe resolverse contra el conjunto publicado derivado del registro canónico;
6. no se admiten variantes de mayúsculas/minúsculas;
7. no se admiten espacios, prefijos de aplicación, sufijos, slugs ni aliases dentro de `ProcessId`;
8. la serialización pública permanece como string exacto `VPROC-####`.

---

#### 8. Conjunto cerrado vigente

La proyección estática vigente contiene exactamente:

```text
VPROC-0001
VPROC-0002
VPROC-0003
VPROC-0004
VPROC-0005
VPROC-0006
VPROC-0007
VPROC-0008
VPROC-0009
VPROC-0010
VPROC-0011
VPROC-0012
VPROC-0013
VPROC-0014
VPROC-0015
VPROC-0016
VPROC-0017
VPROC-0018
VPROC-0019
VPROC-0020
VPROC-0021
VPROC-0022
VPROC-0023
VPROC-0024
VPROC-0025
VPROC-0026
VPROC-0027
VPROC-0028
VPROC-0029
VPROC-0030
VPROC-0031
VPROC-0032
VPROC-0033
VPROC-0034
VPROC-0035
VPROC-0036
VPROC-0037
VPROC-0038
VPROC-0039
VPROC-0040
VPROC-0041
VPROC-0042
VPROC-0043
VPROC-0044
VPROC-0045
VPROC-0046
VPROC-0047
VPROC-0048
VPROC-0049
VPROC-0050
VPROC-0051
VPROC-0052
VPROC-0053
VPROC-0054
VPROC-0055
VPROC-0056
VPROC-0057
VPROC-0058
VPROC-0059
VPROC-0060
VPROC-0061
VPROC-0062
VPROC-0063
VPROC-0064
VPROC-0065
VPROC-0066
VPROC-0067
VPROC-0068
VPROC-0069
```

Conciliación:

```text
esperados = 69
materializados documentalmente = 69
únicos = 69
faltantes = 0
duplicados = 0
fuera de rango = 0
```

---

#### 9. Proyección TypeScript conceptual

La colección literal publicada será el artefacto derivado de membresía y el tipo se obtendrá de esa misma colección, evitando mantener dos listas manuales independientes:

```text
const PROCESS_IDS = <colección derivada de los 69 valores canónicos> as const;

type ProcessId = (typeof PROCESS_IDS)[number];
```

La colección y el tipo son derivados. Ninguno se convierte en una segunda fuente editable de identidad.

---

#### 10. Regla de validación runtime

Toda entrada procedente de JSON, base de datos, RPC, evento, query parameter, almacenamiento local, API, integración o consumidor legacy se considera no confiable hasta validación.

La aceptación exige dos condiciones:

```text
formato válido
AND
pertenencia al conjunto asignado de ProcessId
```

Por tanto:

```text
VPROC-0001
→ formato válido
→ miembro vigente
→ ProcessId válido

VPROC-0070
→ formato válido
→ no asignado en el corte vigente
→ identidad desconocida

VPROC-9999
→ formato válido
→ no asignado
→ identidad desconocida

vproc-0001
→ formato inválido

VPROC-0000
→ reservado como inválido
```

Queda prohibido utilizar un cast estático como sustituto de la comprobación de pertenencia.

---

#### 11. Estabilidad e inmutabilidad de identidad

Las reglas heredadas del registro permanecen:

1. un `ProcessId` asignado no se renumera;
2. un `ProcessId` asignado no se reutiliza para otro proceso;
3. un cambio de nombre humano no cambia el identificador;
4. un cambio de aplicación propietaria no cambia el identificador;
5. un cambio de canal, sede, área, rol o dispositivo no crea por sí mismo otro identificador;
6. una fusión futura conserva linaje y no recicla los identificadores absorbidos;
7. una división futura conserva el identificador padre y registra los descendientes conforme al gobierno del registro;
8. un retiro futuro conserva la identidad histórica y no habilita su reutilización;
9. `VPROC-0070` es únicamente el siguiente valor disponible en el corte vigente, no una asignación anticipada.

La semántica de los estados de registro y de los estados operativos de proceso no se redefine aquí.

---

#### 12. Separación frente a alias, nombres y slugs

No son `ProcessId`:

- códigos `ASIS-*`;
- aliases históricos o provisionales;
- nombre humano del proceso;
- nombre abreviado;
- slug;
- ruta;
- nombre de pantalla;
- nombre de aplicación;
- nombre de módulo;
- nombre de tabla;
- nombre de evento;
- identificador de paquete.

Regla:

```text
alias / nombre / slug
→ puede resolver hacia un ProcessId mediante un adapter gobernado
→ no sustituye ProcessId como clave primaria contractual
```

Un consumidor nuevo no puede crear una clave paralela porque el texto sea más legible.

---

#### 13. Separación frente a identidades relacionadas

`ProcessId` permanece separado de:

```text
process_instance_id
step_id
screen_id
action_id
event_id
command_id
request_id
correlation_id
audit_entry_id
audit_profile_id
metric_id
permission_key
app_code
```

En particular:

```text
VPROC-0001
→ ProcessId

VPROC-0001.AUDIT
→ perfil de auditoría asociado
→ no es ProcessId
```

La presencia del prefijo `VPROC-####` dentro de otra identidad compuesta no convierte el valor completo en `ProcessId`.

---

#### 14. Separación frente a estado, implementación y autorización

Una identidad canónica no demuestra:

- que el proceso esté implementado;
- que exista una pantalla;
- que exista una API o tabla;
- que una aplicación pueda ejecutarlo;
- que un actor esté autorizado;
- que exista una instancia activa;
- que el proceso esté listo para operación;
- que tenga evidencia de despliegue.

Por tanto:

```text
ProcessId reconocido
≠ proceso implementado
≠ proceso disponible
≠ proceso autorizado
≠ instancia de proceso
```

Los estados de proceso quedan exclusivamente reservados a `SHELL-CON-010` y a sus fuentes propietarias.

---

#### 15. Propiedad y consumidores

La frontera de propiedad queda:

```text
PROC-CANONICAL-ID-REGISTRY-001
→ autoridad semántica de asignación y linaje

@vento/contracts/processes
→ autoridad técnica compartida de la proyección tipada/validable

aplicaciones y packages consumidores
→ referencian ProcessId
→ no administran el namespace

Supabase
→ puede persistir/proyectar ProcessId
→ no asigna significado alternativo por sí mismo
```

La aplicación propietaria de un proceso no adquiere propiedad sobre el namespace global `VPROC-*`.

---

#### 16. Orden y generación determinista

La colección derivada deberá conservar orden numérico ascendente por la parte de cuatro dígitos:

```text
VPROC-0001
VPROC-0002
...
VPROC-0069
```

No se utilizarán como orden contractual:

- nombre humano;
- aplicación propietaria;
- prioridad;
- fecha de implementación;
- orden de llegada de filas;
- orden de una consulta;
- orden de imports.

La salida derivada deberá poder regenerarse desde el registro fuente sin edición manual de miembros.

---

#### 17. Evolución del conjunto

Una nueva identidad solo puede incorporarse cuando exista una asignación formal en el registro propietario de procesos.

Secuencia conceptual:

```text
decisión de crear una nueva identidad de proceso
→ asignación canónica en el registro propietario
→ preservación de linaje y unicidad
→ nueva proyección contractual
→ nueva versión publicable del package cuando corresponda
→ validación de consumidores
```

Una actualización de `ProcessId` no puede originarse únicamente desde una aplicación consumidora, una migración, una tabla, un evento o un tipo TypeScript local.

La incorporación futura de `VPROC-0070` requerirá su asignación canónica previa; esta tarea no la anticipa.

---

#### 18. Versionado y compatibilidad

`SHELL-CON-009` no asigna una versión publicada inexistente al subpath de procesos.

Cuando `@vento/contracts` se materialice y publique:

1. `ProcessId` formará parte de la superficie contractual versionada;
2. la adición de una identidad asignada deberá conservar compatibilidad con el gobierno SemVer del package;
3. retirar una identidad de la proyección histórica o reutilizarla con otra semántica será incompatible con el gobierno aprobado;
4. los consumidores deberán usar una versión explícita compatible;
5. un consumidor con una versión que no reconoce un identificador nuevo deberá tratarlo como incompatibilidad contractual, no inventar un fallback;
6. la procedencia deberá permitir relacionar la salida publicada con el registro fuente que la generó.

No se inventa hash, tag, release ni manifest físico antes de la fase de materialización autorizada.

---

#### 19. Destinos de materialización ya existentes

La tarea no crea nuevas responsabilidades de implementación.

| Resultado pendiente de fase física                                       | Destino existente                                                                                                                    |
| ------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------ |
| materializar la raíz/package compartido y su superficie pública          | ciclo físico de `@vento/contracts` gobernado por `SHELL-CON-001`, `SHELL-PKG-001..008`, `E5-GATE-008::<package_id>` y `SHELL-CI-020` |
| validar contrato, requisitos y documentación ejecutable                  | `SHELL-CI-017`                                                                                                                       |
| validar compatibilidad e integración transversal de consumidores         | `SHELL-CI-018`                                                                                                                       |
| proteger uso de fuente compartida frente a copias divergentes            | `TREQ-SHELL-002` y su tarea responsable ya registrada                                                                                |
| proteger formato, unicidad, resolución y no reutilización de `ProcessId` | `TREQ-PROC-009` a `TREQ-PROC-013`                                                                                                    |
| proteger el cierre de 69 identidades y deriva futura                     | `TREQ-PROC-111` y `TREQ-PROC-118`                                                                                                    |

No se inicia ninguno de esos trabajos físicos durante `SHELL-CON-009`.

---

#### 20. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** **0**
**Requisitos modificados:** **0**

**Justificación:** `SHELL-CON-009` no crea ni modifica identidades de proceso, reglas de asignación, linaje, formato o comportamiento ejecutable. Centraliza una proyección documental de reglas ya protegidas por `TREQ-PROC-009` a `TREQ-PROC-013`, `TREQ-PROC-111`, `TREQ-PROC-118`, `TREQ-SHELL-002`, `TREQ-SHELL-006` y `TREQ-SHELL-008`. Crear otro requisito con la misma regla produciría cobertura duplicada sin comportamiento nuevo.

El Registro Canónico de Requisitos de Prueba permanece sin cambios.

---

#### 21. Decisiones vinculantes

1. `ProcessId` usa exactamente la forma `VPROC-####`.
2. El conjunto vigente contiene exactamente 69 identidades: `VPROC-0001` a `VPROC-0069`.
3. Las 69 identidades vigentes permanecen `CANONICAL` según la reconciliación propietaria.
4. Existen cero `MERGED_ALIAS`, cero `SPLIT_PARENT`, cero `RETIRED` y cero `VOID` en el corte vigente.
5. `VPROC-0070` es el siguiente identificador disponible y no pertenece todavía a `ProcessId`.
6. `VPROC-0000` es inválido.
7. Cumplir el regex no demuestra pertenencia al conjunto asignado.
8. Los identificadores asignados no se renumeran ni reutilizan.
9. Alias, nombres, slugs y referencias `ASIS-*` no sustituyen `ProcessId`.
10. `process_instance_id` y demás identidades de ejecución permanecen separadas.
11. Perfiles derivados como `VPROC-####.AUDIT` no son `ProcessId`.
12. Una identidad reconocida no demuestra implementación, disponibilidad ni autorización.
13. La autoridad semántica de asignación permanece en `PROC-CANONICAL-ID-REGISTRY-001`.
14. La proyección compartida queda bajo `@vento/contracts/processes`.
15. `@vento/contracts/processes` no se materializa ni publica en esta tarea.
16. Un consumidor no puede ampliar localmente el conjunto.
17. Entradas externas requieren validación de formato y pertenencia.
18. La proyección se genera determinísticamente desde la fuente canónica.
19. Los estados de proceso quedan reservados exclusivamente a `SHELL-CON-010`.
20. No se modifica código, Supabase, migraciones, datos, package físico ni consumidor.
21. No se crean ni modifican requisitos `TREQ-*`.
22. `SHELL-CON-010` permanece exclusivamente reservada.

---

#### 22. Criterios de aceptación

`SHELL-CON-009` queda documentalmente completa cuando:

- el conjunto `VPROC-0001..VPROC-0069` esté reconocido como las 69 identidades asignadas vigentes;
- los 69 valores estén enumerados una sola vez en la definición de membresía y sin duplicados;
- `VPROC-0070` permanezca fuera del conjunto vigente;
- `VPROC-0000` permanezca inválido;
- `ProcessId` se separe de instancias, pasos, pantallas, acciones, eventos, auditorías, métricas, permisos y aplicaciones;
- alias, nombres, slugs y referencias `ASIS-*` no sean aceptados como identidad primaria;
- la validación exija sintaxis y pertenencia, no solo regex o cast;
- se preserve la regla de no renumeración ni reutilización;
- `PROC-CANONICAL-ID-REGISTRY-001` permanezca como fuente semántica propietaria;
- `@vento/contracts/processes` quede definido como superficie compartida documental sin materialización física;
- no se definan estados de procesos antes de `SHELL-CON-010`;
- no se ejecuten cambios físicos;
- se reutilice la cobertura `TREQ-*` existente sin generar duplicados;
- la continuidad reserve únicamente `SHELL-CON-010`.

---

#### 23. Continuidad canónica

##### ÚLTIMA TAREA APROBADA

SHELL-CON-008 — Centralizar códigos de error

##### TAREA ACTUAL APROBADA

SHELL-CON-009 — Centralizar identificadores de procesos

##### SIGUIENTE TAREA RESERVADA

SHELL-CON-010 — Centralizar estados de procesos


### ✅ SHELL-CON-010 — Centralizar estados de procesos

**Estado:** APROBADA
**Tarea anterior:** SHELL-CON-009 — Centralizar identificadores de procesos
**Tarea siguiente:** SHELL-CON-011 — Centralizar identificadores de pantallas
**Tipo de tarea:** Documental
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Estado físico resultante:** `CONTRATO_DE_ESTADOS_DE_PROCESO_DEFINIDO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-CON-010` centraliza la identidad contractual de los estados principales normales de los 69 procesos canónicos de Vento OS, preservando exactamente los estados aprobados en `PROC-CAT-009`, `PROC-CAT-010` y `PROC-CAT-011` y la reconciliación de cobertura de `PROC-CAT-012`.

La decisión vinculante es:

```text
REGISTROS CANÓNICOS DE ESTADO DE PROCESO
→ 69 estados iniciales
→ 454 estados intermedios
→ 69 estados finales normales
→ 592 identidades de estado

@vento/contracts/processes
→ proyección compartida, tipada y validable

consumidores
→ referencian ProcessStateId
→ no inventan estados, no mezclan acciones y no redefinen semántica
```

La tarea no crea estados nuevos, no altera grafos de transición, no convierte condiciones transversales en estados principales y no materializa código, package, migraciones ni cambios en Supabase.

---

#### 2. Resultado canónico

El universo compartido vigente queda compuesto por exactamente **592 estados principales normales**:

| Clase          | Cantidad | Fuente semántica propietaria                            |
| -------------- | -------: | ------------------------------------------------------- |
| `INITIAL`      |   **69** | `PROC-PROCESS-INITIAL-STATE-REGISTRY-001`               |
| `INTERMEDIATE` |  **454** | `PROC-PROCESS-INTERMEDIATE-STATE-REGISTRY-001`          |
| `FINAL_NORMAL` |   **69** | `PROC-PROCESS-FINAL-STATE-REGISTRY-001`                 |
| **Total**      |  **592** | reconciliado por `PROC-PROCESS-TRANSITION-REGISTRY-001` |

Conciliación heredada y preservada:

```text
procesos cubiertos             = 69
estados iniciales              = 69
estados intermedios            = 454
estados finales normales       = 69
estados principales normales   = 592
transiciones normales          = 590
faltantes de proceso           = 0
duplicados de identidad plena  = 0
```

Las **590 transiciones normales** no son miembros de `ProcessStateId`; permanecen relaciones gobernadas por `PROC-CAT-012`.

---

#### 3. Fuentes y precedencia

Esta tarea conserva sin reabrir las decisiones aprobadas de:

| Fuente                                               | Uso vinculante                                                                         |
| ---------------------------------------------------- | -------------------------------------------------------------------------------------- |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`         | continuidad, fase documental, trazabilidad y requisitos de prueba                      |
| `docs/plan-canonico/modular/delivery-contract.json`  | estructura del artefacto documental                                                    |
| `docs/plan-canonico/modular/active-sequence.json`    | `SHELL-CON-010` como tarea vigente y `SHELL-CON-011` como siguiente tarea              |
| `SHELL-CON-001`                                      | raíz única `@vento/contracts` y materialización posterior                              |
| `SHELL-CON-009`                                      | `ProcessId`, conjunto `VPROC-0001..0069` y subpath lógico `@vento/contracts/processes` |
| `PROC-CAT-009`                                       | 69 estados iniciales y sus condiciones de nacimiento                                   |
| `PROC-CAT-010`                                       | 454 estados intermedios, fases y verdades mínimas                                      |
| `PROC-CAT-011`                                       | 69 estados finales normales, tipos terminales y criterios de cierre                    |
| `PROC-CAT-012`                                       | reconciliación de 592 estados contractuales y 590 transiciones normales                |
| `PROC-CAT-013`                                       | acciones excepcionales separadas del estado principal normal                           |
| `PROC-CAT-014`                                       | cancelación, anulación, reversión, compensación y corrección como acciones separadas   |
| `TREQ-PROC-038` a `TREQ-PROC-052`                    | identidad, unicidad, estados, terminalidad, transición, migración y cierre             |
| `TREQ-SHELL-002`, `TREQ-SHELL-006`, `TREQ-SHELL-008` | fuente compartida, compatibilidad y validación documental                              |

Precedencia específica:

```text
PROC-CAT-009 / 010 / 011
→ gobiernan identidad y semántica de los estados

PROC-CAT-012
→ reconcilia cobertura y grafo normal

SHELL-CON-009
→ fija ProcessId compartido

SHELL-CON-010
→ centraliza ProcessStateId y metadatos derivados
→ no redefine la semántica funcional
```

---

#### 4. Línea base verificable

El estado previo a la materialización queda:

| Elemento                          | Estado                       | Disposición                                                                                                           |
| --------------------------------- | ---------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| `ProcessId` documental compartido | definido por `SHELL-CON-009` | se reutiliza sin cambios                                                                                              |
| 69 estados iniciales              | aprobados                    | centralizar identidad                                                                                                 |
| 454 estados intermedios           | aprobados                    | centralizar identidad y clasificación                                                                                 |
| 69 estados finales normales       | aprobados                    | centralizar identidad y terminalidad                                                                                  |
| 592 estados contractuales         | reconciliados                | conjunto exacto de esta tarea                                                                                         |
| 590 transiciones normales         | aprobadas                    | permanecen fuera de `ProcessStateId`                                                                                  |
| `packages/contracts`              | no materializado físicamente | `E5-GATE-008` → `SHELL-CI-020`; build en `SHELL-CI-002`, release en `SHELL-CI-003` y compatibilidad en `SHELL-CI-005` |
| `@vento/contracts/processes`      | definido documentalmente     | se amplía documentalmente, sin publicación física                                                                     |
| cambios físicos en esta tarea     | no autorizados               | ninguno                                                                                                               |

---

#### 5. Namespace contractual y propiedad

`SHELL-CON-010` amplía el mismo dominio lógico definido por `SHELL-CON-009`:

```text
@vento/contracts/processes
```

No se crea otro package ni otro subpath competidor para estados.

La frontera de propiedad queda:

```text
PROC-PROCESS-INITIAL-STATE-REGISTRY-001
PROC-PROCESS-INTERMEDIATE-STATE-REGISTRY-001
PROC-PROCESS-FINAL-STATE-REGISTRY-001
→ autoridad semántica

PROC-PROCESS-TRANSITION-REGISTRY-001
→ autoridad del grafo normal y reconciliación

@vento/contracts/processes
→ autoridad técnica compartida de la proyección tipada/validable

consumidores
→ consumen la proyección
→ no crean estados locales equivalentes
```

---

#### 6. Identidad contractual de estado

Cada estado principal normal se identifica mediante la composición exacta:

```text
<ProcessId>.<STATE_CODE>
```

Forma léxica:

```text
VPROC-####.<UPPER_SNAKE_CASE>
```

Patrón sintáctico:

```text
^VPROC-[0-9]{4}\.[A-Z][A-Z0-9_]*$
```

Reglas:

1. el prefijo `VPROC-####` debe ser un `ProcessId` vigente;
2. `STATE_CODE` se conserva exactamente como fue aprobado en su registro propietario;
3. satisfacer el patrón no demuestra pertenencia;
4. la identidad completa debe existir entre las 592 publicadas para el proceso indicado;
5. un código desnudo como `UNDER_REVIEW` no es identidad global de estado;
6. dos procesos pueden reutilizar el mismo `STATE_CODE` sin colisión porque la identidad plena incluye `ProcessId`;
7. un consumidor no puede agregar prefijos, sufijos, aliases, traducciones o normalizaciones locales;
8. la serialización pública de la identidad plena permanece como string exacto.

---

#### 7. Taxonomía cerrada

La clasificación primaria queda:

```text
ProcessStateKind
→ INITIAL
→ INTERMEDIATE
→ FINAL_NORMAL
```

Los estados `INTERMEDIATE` conservan exactamente las diez fases semánticas aprobadas:

```text
VALIDACION
ANALISIS
REVISION
APROBACION
PREPARACION
EJECUCION
HANDOFF
VERIFICACION
RECONCILIACION
ACTIVO
```

Distribución aprobada de los 454 intermedios:

| Fase             | Cantidad |
| ---------------- | -------: |
| `VALIDACION`     |   **29** |
| `ANALISIS`       |   **44** |
| `REVISION`       |   **36** |
| `APROBACION`     |   **44** |
| `PREPARACION`    |   **69** |
| `EJECUCION`      |   **72** |
| `HANDOFF`        |   **65** |
| `VERIFICACION`   |   **35** |
| `RECONCILIACION` |   **34** |
| `ACTIVO`         |   **26** |
| **Total**        |  **454** |

Los 69 estados `FINAL_NORMAL` conservan exactamente ocho tipos terminales:

| Tipo terminal  | Cantidad |
| -------------- | -------: |
| `CERRADO`      |   **28** |
| `RECONCILIADO` |   **21** |
| `LIBERADO`     |    **4** |
| `CUMPLIDO`     |    **4** |
| `VERIFICADO`   |    **6** |
| `LIQUIDADO`    |    **2** |
| `EVALUADO`     |    **3** |
| `FORMALIZADO`  |    **1** |
| **Total**      |   **69** |

Las fases intermedias y los tipos terminales son clasificaciones semánticas; no son estados independientes ni sustituyen `ProcessStateId`.

---

#### 8. Matriz completa de identidades de estado

La siguiente matriz materializa las **592 de 592** identidades principales normales. En cada proceso, la primera identidad es `INITIAL`, la última es `FINAL_NORMAL` y todas las identidades ubicadas entre ambas son `INTERMEDIATE`.

| Proceso      | Estado inicial                                 | Estados intermedios                                                                                                                                                                                                                                                                                            | Estado final normal                          |  Total |
| ------------ | ---------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------- | -----: |
| `VPROC-0001` | `VPROC-0001.DECISION_DRAFT`                    | `VPROC-0001.UNDER_ANALYSIS`<br>`VPROC-0001.PENDING_APPROVAL`<br>`VPROC-0001.APPROVED_FOR_EXECUTION`<br>`VPROC-0001.IN_FOLLOW_UP`                                                                                                                                                                               | `VPROC-0001.DECISION_CLOSED`                 |  **6** |
| `VPROC-0002` | `VPROC-0002.STRUCTURE_CHANGE_REQUESTED`        | `VPROC-0002.UNDER_VALIDATION`<br>`VPROC-0002.CHANGE_DESIGNED`<br>`VPROC-0002.PENDING_APPROVAL`<br>`VPROC-0002.APPROVED_FOR_IMPLEMENTATION`<br>`VPROC-0002.IN_IMPLEMENTATION`<br>`VPROC-0002.PENDING_VERIFICATION`                                                                                              | `VPROC-0002.STRUCTURE_CHANGE_VERIFIED`       |  **8** |
| `VPROC-0003` | `VPROC-0003.POLICY_DRAFT`                      | `VPROC-0003.UNDER_REVIEW`<br>`VPROC-0003.PENDING_APPROVAL`<br>`VPROC-0003.APPROVED`<br>`VPROC-0003.PUBLISHED`<br>`VPROC-0003.IN_FORCE`<br>`VPROC-0003.REVISION_IN_PROGRESS`                                                                                                                                    | `VPROC-0003.POLICY_GOVERNANCE_COMPLETED`     |  **8** |
| `VPROC-0004` | `VPROC-0004.COMMITMENT_REGISTERED`             | `VPROC-0004.PENDING_ACCEPTANCE`<br>`VPROC-0004.ACCEPTED`<br>`VPROC-0004.IN_PROGRESS`<br>`VPROC-0004.PENDING_VERIFICATION`<br>`VPROC-0004.FOLLOW_UP_REQUIRED`                                                                                                                                                   | `VPROC-0004.COMMITMENT_CLOSED`               |  **7** |
| `VPROC-0005` | `VPROC-0005.STAFFING_NEED_REGISTERED`          | `VPROC-0005.NEED_UNDER_REVIEW`<br>`VPROC-0005.VACANCY_APPROVED`<br>`VPROC-0005.RECRUITMENT_OPEN`<br>`VPROC-0005.CANDIDATES_UNDER_EVALUATION`<br>`VPROC-0005.SELECTION_DECISION_PENDING`<br>`VPROC-0005.CANDIDATE_SELECTED`<br>`VPROC-0005.ONBOARDING_HANDOFF_PENDING`                                          | `VPROC-0005.SELECTION_HANDOFF_COMPLETED`     |  **9** |
| `VPROC-0006` | `VPROC-0006.ONBOARDING_CASE_OPENED`            | `VPROC-0006.DOCUMENTS_PENDING`<br>`VPROC-0006.IDENTITY_VALIDATED`<br>`VPROC-0006.LABOR_SETUP_IN_PROGRESS`<br>`VPROC-0006.ACCESS_PROVISIONING_IN_PROGRESS`<br>`VPROC-0006.INDUCTION_IN_PROGRESS`<br>`VPROC-0006.READINESS_REVIEW_PENDING`                                                                       | `VPROC-0006.ONBOARDING_COMPLETED`            |  **8** |
| `VPROC-0007` | `VPROC-0007.SCHEDULE_DRAFT`                    | `VPROC-0007.UNDER_REVIEW`<br>`VPROC-0007.PENDING_PUBLICATION`<br>`VPROC-0007.PUBLISHED`<br>`VPROC-0007.IN_EXECUTION`<br>`VPROC-0007.CHANGE_UNDER_REVIEW`<br>`VPROC-0007.PERIOD_RECONCILIATION_PENDING`                                                                                                         | `VPROC-0007.SCHEDULE_PERIOD_CLOSED`          |  **8** |
| `VPROC-0008` | `VPROC-0008.ATTENDANCE_EVENT_RECEIVED`         | `VPROC-0008.VALIDATION_IN_PROGRESS`<br>`VPROC-0008.MATCHED_TO_CONTEXT`<br>`VPROC-0008.ACCEPTED_FOR_RECONCILIATION`<br>`VPROC-0008.CORRECTION_UNDER_REVIEW`<br>`VPROC-0008.CORRECTION_APPROVED`                                                                                                                 | `VPROC-0008.ATTENDANCE_EVENT_RECONCILED`     |  **7** |
| `VPROC-0009` | `VPROC-0009.LABOR_CASE_SUBMITTED`              | `VPROC-0009.UNDER_REVIEW`<br>`VPROC-0009.INFORMATION_PENDING`<br>`VPROC-0009.PENDING_DECISION`<br>`VPROC-0009.APPROVED_FOR_APPLICATION`<br>`VPROC-0009.IMPLEMENTATION_IN_PROGRESS`<br>`VPROC-0009.PENDING_RECONCILIATION`                                                                                      | `VPROC-0009.LABOR_CASE_RECONCILED`           |  **8** |
| `VPROC-0010` | `VPROC-0010.PAYROLL_CYCLE_OPENED`              | `VPROC-0010.INPUTS_COLLECTING`<br>`VPROC-0010.PRELIMINARY_CALCULATION`<br>`VPROC-0010.UNDER_REVIEW`<br>`VPROC-0010.PENDING_APPROVAL`<br>`VPROC-0010.APPROVED_FOR_PAYMENT`<br>`VPROC-0010.PAYMENT_PROCESSING`<br>`VPROC-0010.RECONCILIATION_IN_PROGRESS`                                                        | `VPROC-0010.PAYROLL_CYCLE_RECONCILED`        |  **9** |
| `VPROC-0011` | `VPROC-0011.OFFBOARDING_CASE_OPENED`           | `VPROC-0011.UNDER_REVIEW`<br>`VPROC-0011.EXIT_PLAN_APPROVED`<br>`VPROC-0011.REVOCATION_IN_PROGRESS`<br>`VPROC-0011.RETURNS_PENDING`<br>`VPROC-0011.LABOR_RECONCILIATION_PENDING`<br>`VPROC-0011.DOCUMENTAL_CLOSE_PENDING`                                                                                      | `VPROC-0011.OFFBOARDING_COMPLETED`           |  **8** |
| `VPROC-0012` | `VPROC-0012.RISK_IDENTIFIED`                   | `VPROC-0012.UNDER_ASSESSMENT`<br>`VPROC-0012.TREATMENT_PLANNED`<br>`VPROC-0012.TREATMENT_PENDING_APPROVAL`<br>`VPROC-0012.CONTROLS_IN_IMPLEMENTATION`<br>`VPROC-0012.MONITORING`<br>`VPROC-0012.REVIEW_PENDING`                                                                                                | `VPROC-0012.SST_RISK_CYCLE_CLOSED`           |  **8** |
| `VPROC-0013` | `VPROC-0013.INCIDENT_REPORTED`                 | `VPROC-0013.RESPONSE_IN_PROGRESS`<br>`VPROC-0013.STABILIZED`<br>`VPROC-0013.UNDER_INVESTIGATION`<br>`VPROC-0013.CORRECTIVE_ACTIONS_PLANNED`<br>`VPROC-0013.ACTIONS_IN_PROGRESS`<br>`VPROC-0013.CLOSURE_REVIEW_PENDING`                                                                                         | `VPROC-0013.INCIDENT_CASE_CLOSED`            |  **8** |
| `VPROC-0014` | `VPROC-0014.CONTROL_EXECUTION_PLANNED`         | `VPROC-0014.READY_FOR_EXECUTION`<br>`VPROC-0014.IN_EXECUTION`<br>`VPROC-0014.RESULTS_UNDER_REVIEW`<br>`VPROC-0014.ACTION_REQUIRED`<br>`VPROC-0014.ACTION_IN_PROGRESS`<br>`VPROC-0014.VERIFICATION_PENDING`                                                                                                     | `VPROC-0014.CONTROL_CYCLE_VERIFIED`          |  **8** |
| `VPROC-0015` | `VPROC-0015.PRODUCT_CHANGE_DRAFT`              | `VPROC-0015.UNDER_VALIDATION`<br>`VPROC-0015.PENDING_APPROVAL`<br>`VPROC-0015.APPROVED`<br>`VPROC-0015.PUBLISHED`<br>`VPROC-0015.CHANGE_IN_PROGRESS`                                                                                                                                                           | `VPROC-0015.PRODUCT_CHANGE_VERIFIED`         |  **7** |
| `VPROC-0016` | `VPROC-0016.RECIPE_DRAFT`                      | `VPROC-0016.IN_DEVELOPMENT`<br>`VPROC-0016.IN_TESTING`<br>`VPROC-0016.UNDER_TECHNICAL_REVIEW`<br>`VPROC-0016.PENDING_APPROVAL`<br>`VPROC-0016.APPROVED`<br>`VPROC-0016.PUBLISHED`                                                                                                                              | `VPROC-0016.RECIPE_VERSION_RELEASED`         |  **8** |
| `VPROC-0017` | `VPROC-0017.OFFER_DRAFT`                       | `VPROC-0017.UNDER_VALIDATION`<br>`VPROC-0017.PENDING_APPROVAL`<br>`VPROC-0017.APPROVED`<br>`VPROC-0017.SCHEDULED`<br>`VPROC-0017.PUBLISHED`<br>`VPROC-0017.ACTIVE`                                                                                                                                             | `VPROC-0017.OFFER_PUBLICATION_VERIFIED`      |  **8** |
| `VPROC-0018` | `VPROC-0018.SPECIFICATION_DRAFT`               | `VPROC-0018.UNDER_DEFINITION`<br>`VPROC-0018.UNDER_TECHNICAL_REVIEW`<br>`VPROC-0018.PENDING_APPROVAL`<br>`VPROC-0018.APPROVED`<br>`VPROC-0018.IN_FORCE`<br>`VPROC-0018.REVISION_IN_PROGRESS`                                                                                                                   | `VPROC-0018.SPECIFICATION_VERSION_RELEASED`  |  **8** |
| `VPROC-0019` | `VPROC-0019.PURCHASE_NEED_SUBMITTED`           | `VPROC-0019.UNDER_VALIDATION`<br>`VPROC-0019.PRIORITIZED`<br>`VPROC-0019.APPROVED_FOR_SOURCING`<br>`VPROC-0019.SOURCING_REQUESTED`<br>`VPROC-0019.CONSOLIDATION_PENDING`                                                                                                                                       | `VPROC-0019.PURCHASE_NEED_HANDOFF_COMPLETED` |  **7** |
| `VPROC-0020` | `VPROC-0020.SOURCING_CASE_OPENED`              | `VPROC-0020.MARKET_REVIEW_IN_PROGRESS`<br>`VPROC-0020.QUOTES_PENDING`<br>`VPROC-0020.COMPARISON_IN_PROGRESS`<br>`VPROC-0020.RECOMMENDATION_PREPARED`<br>`VPROC-0020.DECISION_PENDING`<br>`VPROC-0020.SUPPLIER_SELECTED`                                                                                        | `VPROC-0020.SOURCING_DECISION_COMPLETED`     |  **8** |
| `VPROC-0021` | `VPROC-0021.PURCHASE_REQUEST_PENDING_APPROVAL` | `VPROC-0021.UNDER_REVIEW`<br>`VPROC-0021.PENDING_APPROVAL`<br>`VPROC-0021.APPROVED`<br>`VPROC-0021.ORDER_PREPARING`<br>`VPROC-0021.ORDER_ISSUED`<br>`VPROC-0021.SUPPLIER_ACK_PENDING`                                                                                                                          | `VPROC-0021.PURCHASE_COMMITMENT_FORMALIZED`  |  **8** |
| `VPROC-0022` | `VPROC-0022.RECEIPT_EXPECTED`                  | `VPROC-0022.ARRIVAL_REGISTERED`<br>`VPROC-0022.PHYSICAL_CHECK_IN_PROGRESS`<br>`VPROC-0022.DOCUMENT_CHECK_IN_PROGRESS`<br>`VPROC-0022.DIFFERENCE_UNDER_REVIEW`<br>`VPROC-0022.ACCEPTANCE_PENDING`<br>`VPROC-0022.PUTAWAY_PENDING`<br>`VPROC-0022.ECONOMIC_RECONCILIATION_PENDING`                               | `VPROC-0022.RECEIPT_RECONCILED`              |  **9** |
| `VPROC-0023` | `VPROC-0023.LOCATION_CHANGE_DRAFT`             | `VPROC-0023.UNDER_VALIDATION`<br>`VPROC-0023.DESIGN_APPROVED`<br>`VPROC-0023.IMPLEMENTATION_IN_PROGRESS`<br>`VPROC-0023.READY_FOR_VERIFICATION`<br>`VPROC-0023.ACTIVE`<br>`VPROC-0023.CHANGE_IN_PROGRESS`                                                                                                      | `VPROC-0023.LOCATION_CHANGE_VERIFIED`        |  **8** |
| `VPROC-0024` | `VPROC-0024.INBOUND_MOVEMENT_REQUESTED`        | `VPROC-0024.VALIDATION_IN_PROGRESS`<br>`VPROC-0024.READY_FOR_PHYSICAL_EXECUTION`<br>`VPROC-0024.IN_EXECUTION`<br>`VPROC-0024.PENDING_CONFIRMATION`<br>`VPROC-0024.PUTAWAY_PENDING`<br>`VPROC-0024.POSTING_PENDING`                                                                                             | `VPROC-0024.INBOUND_MOVEMENT_RECONCILED`     |  **8** |
| `VPROC-0025` | `VPROC-0025.STOCK_OPERATION_REQUESTED`         | `VPROC-0025.VALIDATION_IN_PROGRESS`<br>`VPROC-0025.RESERVED`<br>`VPROC-0025.READY_FOR_EXECUTION`<br>`VPROC-0025.IN_EXECUTION`<br>`VPROC-0025.DESTINATION_CONFIRMATION_PENDING`<br>`VPROC-0025.POSTING_PENDING`                                                                                                 | `VPROC-0025.STOCK_OPERATION_RECONCILED`      |  **8** |
| `VPROC-0026` | `VPROC-0026.COUNT_SESSION_OPENED`              | `VPROC-0026.IN_CAPTURE`<br>`VPROC-0026.CAPTURE_COMPLETE`<br>`VPROC-0026.DIFFERENCES_DETECTED`<br>`VPROC-0026.UNDER_INVESTIGATION`<br>`VPROC-0026.ADJUSTMENT_DECISION_PENDING`<br>`VPROC-0026.ADJUSTMENT_APPROVED`<br>`VPROC-0026.RECONCILIATION_PENDING`                                                       | `VPROC-0026.COUNT_RECONCILED`                |  **9** |
| `VPROC-0027` | `VPROC-0027.CONDITION_EVENT_DETECTED`          | `VPROC-0027.UNDER_ASSESSMENT`<br>`VPROC-0027.QUARANTINED`<br>`VPROC-0027.DISPOSITION_DECISION_PENDING`<br>`VPROC-0027.ACTION_IN_PROGRESS`<br>`VPROC-0027.VERIFICATION_PENDING`                                                                                                                                 | `VPROC-0027.CONDITION_CASE_RESOLVED`         |  **7** |
| `VPROC-0028` | `VPROC-0028.REPLENISHMENT_REQUESTED`           | `VPROC-0028.UNDER_VALIDATION`<br>`VPROC-0028.APPROVED`<br>`VPROC-0028.IN_PREPARATION`<br>`VPROC-0028.READY_FOR_DISPATCH`<br>`VPROC-0028.IN_TRANSIT`<br>`VPROC-0028.RECEIPT_PENDING`<br>`VPROC-0028.DIFFERENCE_UNDER_REVIEW`<br>`VPROC-0028.RECONCILIATION_PENDING`                                             | `VPROC-0028.REPLENISHMENT_RECONCILED`        | **10** |
| `VPROC-0029` | `VPROC-0029.ASSET_REGISTRATION_PENDING`        | `VPROC-0029.UNDER_VALIDATION`<br>`VPROC-0029.REGISTERED`<br>`VPROC-0029.LABELING_PENDING`<br>`VPROC-0029.ASSIGNMENT_PENDING`<br>`VPROC-0029.IN_CUSTODY`<br>`VPROC-0029.TRANSFER_PENDING`<br>`VPROC-0029.RETURN_UNDER_VERIFICATION`                                                                             | `VPROC-0029.ASSET_CUSTODY_CYCLE_RECONCILED`  |  **9** |
| `VPROC-0030` | `VPROC-0030.MAINTENANCE_REQUESTED`             | `VPROC-0030.UNDER_TRIAGE`<br>`VPROC-0030.DIAGNOSIS_IN_PROGRESS`<br>`VPROC-0030.WORK_PENDING_APPROVAL`<br>`VPROC-0030.PARTS_OR_SERVICE_PENDING`<br>`VPROC-0030.IN_REPAIR`<br>`VPROC-0030.TESTING`<br>`VPROC-0030.RELEASE_PENDING`                                                                               | `VPROC-0030.MAINTENANCE_CASE_CLOSED`         |  **9** |
| `VPROC-0031` | `VPROC-0031.VEHICLE_REVIEW_OPENED`             | `VPROC-0031.UNDER_INSPECTION`<br>`VPROC-0031.READY_FOR_ASSIGNMENT`<br>`VPROC-0031.ASSIGNMENT_PENDING`<br>`VPROC-0031.ASSIGNED`<br>`VPROC-0031.IN_OPERATION`<br>`VPROC-0031.POST_OPERATION_REVIEW_PENDING`                                                                                                      | `VPROC-0031.VEHICLE_OPERATION_RECONCILED`    |  **8** |
| `VPROC-0032` | `VPROC-0032.REUSABLE_HANDOFF_REQUESTED`        | `VPROC-0032.PREPARING_HANDOFF`<br>`VPROC-0032.HANDOFF_PENDING_ACCEPTANCE`<br>`VPROC-0032.IN_CUSTODY`<br>`VPROC-0032.RETURN_REQUESTED`<br>`VPROC-0032.RETURN_IN_PROGRESS`<br>`VPROC-0032.RETURN_UNDER_VERIFICATION`<br>`VPROC-0032.DIFFERENCE_UNDER_REVIEW`                                                     | `VPROC-0032.REUSABLE_CYCLE_RECONCILED`       |  **9** |
| `VPROC-0033` | `VPROC-0033.PRODUCTION_PLAN_DRAFT`             | `VPROC-0033.DEMAND_CONSOLIDATING`<br>`VPROC-0033.CAPACITY_VALIDATING`<br>`VPROC-0033.PLAN_UNDER_REVIEW`<br>`VPROC-0033.PENDING_APPROVAL`<br>`VPROC-0033.PUBLISHED`<br>`VPROC-0033.REVISION_IN_PROGRESS`                                                                                                        | `VPROC-0033.PRODUCTION_PLAN_RELEASED`        |  **8** |
| `VPROC-0034` | `VPROC-0034.PRODUCTION_ORDER_READY`            | `VPROC-0034.MATERIALS_RESERVING`<br>`VPROC-0034.MATERIALS_READY`<br>`VPROC-0034.IN_PRODUCTION`<br>`VPROC-0034.OUTPUT_REPORTED`<br>`VPROC-0034.CONSUMPTION_RECONCILIATION_PENDING`<br>`VPROC-0034.READY_FOR_QUALITY`                                                                                            | `VPROC-0034.PRODUCTION_EXECUTION_COMPLETED`  |  **8** |
| `VPROC-0035` | `VPROC-0035.QUALITY_INSPECTION_PENDING`        | `VPROC-0035.IN_INSPECTION`<br>`VPROC-0035.RESULTS_RECORDED`<br>`VPROC-0035.UNDER_TECHNICAL_REVIEW`<br>`VPROC-0035.DISPOSITION_PENDING`<br>`VPROC-0035.DISPOSITION_DECIDED`<br>`VPROC-0035.EXECUTION_VERIFICATION_PENDING`                                                                                      | `VPROC-0035.QUALITY_DISPOSITION_VERIFIED`    |  **8** |
| `VPROC-0036` | `VPROC-0036.PACKAGING_WORK_PENDING`            | `VPROC-0036.MATERIALS_PREPARED`<br>`VPROC-0036.IN_PACKAGING`<br>`VPROC-0036.LABEL_VERIFICATION_PENDING`<br>`VPROC-0036.PACKAGED_OUTPUT_RECORDED`<br>`VPROC-0036.STORAGE_TRANSFER_PENDING`<br>`VPROC-0036.RECONCILIATION_PENDING`                                                                               | `VPROC-0036.PACKAGING_CYCLE_RECONCILED`      |  **8** |
| `VPROC-0037` | `VPROC-0037.PRODUCTION_CLOSEOUT_OPENED`        | `VPROC-0037.DATA_COLLECTING`<br>`VPROC-0037.YIELD_RECONCILIATION_IN_PROGRESS`<br>`VPROC-0037.VARIANCE_UNDER_REVIEW`<br>`VPROC-0037.REWORK_PLAN_PENDING`<br>`VPROC-0037.REWORK_IN_PROGRESS`<br>`VPROC-0037.INVENTORY_EFFECTS_PENDING`<br>`VPROC-0037.CLOSURE_REVIEW_PENDING`                                    | `VPROC-0037.PRODUCTION_CLOSEOUT_APPROVED`    |  **9** |
| `VPROC-0038` | `VPROC-0038.TABLE_SERVICE_OPENED`              | `VPROC-0038.ORDERING`<br>`VPROC-0038.PREPARATION_IN_PROGRESS`<br>`VPROC-0038.PARTIALLY_SERVED`<br>`VPROC-0038.SERVED`<br>`VPROC-0038.PAYMENT_PENDING`<br>`VPROC-0038.PAYMENT_CONFIRMED`<br>`VPROC-0038.TABLE_CLOSE_PENDING`                                                                                    | `VPROC-0038.TABLE_SERVICE_CLOSED`            |  **9** |
| `VPROC-0039` | `VPROC-0039.COUNTER_SALE_OPENED`               | `VPROC-0039.ITEMS_SELECTED`<br>`VPROC-0039.PREPARATION_IN_PROGRESS`<br>`VPROC-0039.READY_FOR_HANDOFF`<br>`VPROC-0039.PAYMENT_PENDING`<br>`VPROC-0039.PAYMENT_CONFIRMED`<br>`VPROC-0039.HANDOFF_PENDING`<br>`VPROC-0039.SALE_RECONCILIATION_PENDING`                                                            | `VPROC-0039.COUNTER_SALE_CLOSED`             |  **9** |
| `VPROC-0040` | `VPROC-0040.EXTERNAL_ORDER_RECEIVED`           | `VPROC-0040.VALIDATION_IN_PROGRESS`<br>`VPROC-0040.MAPPED_TO_INTERNAL_ORDER`<br>`VPROC-0040.ACCEPTANCE_PENDING`<br>`VPROC-0040.ACCEPTED`<br>`VPROC-0040.IN_FULFILLMENT`<br>`VPROC-0040.CHANNEL_RECONCILIATION_PENDING`                                                                                         | `VPROC-0040.EXTERNAL_ORDER_RECONCILED`       |  **8** |
| `VPROC-0041` | `VPROC-0041.COMMERCIAL_REQUEST_RECEIVED`       | `VPROC-0041.REQUIREMENTS_UNDER_REVIEW`<br>`VPROC-0041.QUOTATION_PREPARING`<br>`VPROC-0041.QUOTATION_PENDING_APPROVAL`<br>`VPROC-0041.QUOTATION_SENT`<br>`VPROC-0041.CUSTOMER_ACCEPTANCE_PENDING`<br>`VPROC-0041.CAPACITY_RESERVED`<br>`VPROC-0041.IN_FULFILLMENT`<br>`VPROC-0041.DELIVERY_AND_BILLING_PENDING` | `VPROC-0041.COMMERCIAL_COMMITMENT_CLOSED`    | **10** |
| `VPROC-0042` | `VPROC-0042.ORDER_CHANGE_REQUESTED`            | `VPROC-0042.UNDER_VALIDATION`<br>`VPROC-0042.IMPACT_ASSESSMENT`<br>`VPROC-0042.AUTHORIZATION_PENDING`<br>`VPROC-0042.APPROVED_FOR_APPLICATION`<br>`VPROC-0042.APPLYING_CHANGES`<br>`VPROC-0042.RECONCILIATION_PENDING`                                                                                         | `VPROC-0042.COMMERCIAL_CHANGE_RECONCILED`    |  **8** |
| `VPROC-0043` | `VPROC-0043.PAYMENT_PENDING`                   | `VPROC-0043.METHOD_SELECTED`<br>`VPROC-0043.AUTHORIZATION_IN_PROGRESS`<br>`VPROC-0043.AUTHORIZED`<br>`VPROC-0043.CAPTURE_PENDING`<br>`VPROC-0043.CAPTURED`<br>`VPROC-0043.FISCAL_DOCUMENT_PENDING`<br>`VPROC-0043.RECONCILIATION_PENDING`                                                                      | `VPROC-0043.PAYMENT_RECONCILED`              |  **9** |
| `VPROC-0044` | `VPROC-0044.CASH_CLOSE_OPENED`                 | `VPROC-0044.COUNTING`<br>`VPROC-0044.SALES_RECONCILIATION_IN_PROGRESS`<br>`VPROC-0044.DIFFERENCE_UNDER_REVIEW`<br>`VPROC-0044.SUPERVISOR_APPROVAL_PENDING`<br>`VPROC-0044.DEPOSIT_PREPARING`<br>`VPROC-0044.FINANCIAL_RECONCILIATION_PENDING`                                                                  | `VPROC-0044.CASH_SESSION_CLOSED`             |  **8** |
| `VPROC-0045` | `VPROC-0045.LOYALTY_INTERACTION_OPENED`        | `VPROC-0045.IDENTITY_VALIDATING`<br>`VPROC-0045.ELIGIBILITY_CHECKING`<br>`VPROC-0045.ACTION_AUTHORIZATION_PENDING`<br>`VPROC-0045.MOVEMENT_PENDING`<br>`VPROC-0045.MOVEMENT_RECORDED`<br>`VPROC-0045.CONSENT_UPDATE_PENDING`<br>`VPROC-0045.RECONCILIATION_PENDING`                                            | `VPROC-0045.LOYALTY_INTERACTION_RECONCILED`  |  **9** |
| `VPROC-0046` | `VPROC-0046.CLAIM_RECEIVED`                    | `VPROC-0046.TRIAGE_IN_PROGRESS`<br>`VPROC-0046.EVIDENCE_PENDING`<br>`VPROC-0046.UNDER_INVESTIGATION`<br>`VPROC-0046.RESOLUTION_PROPOSED`<br>`VPROC-0046.AUTHORIZATION_PENDING`<br>`VPROC-0046.REMEDY_IN_PROGRESS`<br>`VPROC-0046.CAUSE_ACTION_PENDING`<br>`VPROC-0046.CUSTOMER_VALIDATION_PENDING`             | `VPROC-0046.CLAIM_CASE_CLOSED`               | **10** |
| `VPROC-0047` | `VPROC-0047.RESERVATION_REQUESTED`             | `VPROC-0047.AVAILABILITY_CHECKING`<br>`VPROC-0047.TERMS_PROPOSED`<br>`VPROC-0047.CUSTOMER_CONFIRMATION_PENDING`<br>`VPROC-0047.DEPOSIT_PENDING`<br>`VPROC-0047.CONFIRMED`<br>`VPROC-0047.PREPARATION_IN_PROGRESS`<br>`VPROC-0047.SERVICE_PENDING`                                                              | `VPROC-0047.RESERVATION_SERVICE_COMPLETED`   |  **9** |
| `VPROC-0048` | `VPROC-0048.ROUTE_PLAN_DRAFT`                  | `VPROC-0048.DEMAND_CONSOLIDATING`<br>`VPROC-0048.CAPACITY_VALIDATING`<br>`VPROC-0048.ROUTE_OPTIMIZING`<br>`VPROC-0048.ASSIGNMENT_PENDING`<br>`VPROC-0048.PLAN_UNDER_REVIEW`<br>`VPROC-0048.PUBLISHED`                                                                                                          | `VPROC-0048.ROUTE_PLAN_RELEASED`             |  **8** |
| `VPROC-0049` | `VPROC-0049.TRIP_READY_FOR_DISPATCH`           | `VPROC-0049.LOAD_VALIDATION_IN_PROGRESS`<br>`VPROC-0049.CUSTODY_TRANSFER_PENDING`<br>`VPROC-0049.IN_TRANSIT`<br>`VPROC-0049.AT_STOP`<br>`VPROC-0049.DELIVERY_CONFIRMATION_PENDING`<br>`VPROC-0049.RETURN_IN_PROGRESS`<br>`VPROC-0049.TRIP_RECONCILIATION_PENDING`                                              | `VPROC-0049.TRIP_RECONCILED`                 |  **9** |
| `VPROC-0050` | `VPROC-0050.THIRD_PARTY_DELIVERY_REQUESTED`    | `VPROC-0050.PROVIDER_ACCEPTANCE_PENDING`<br>`VPROC-0050.ACCEPTED_BY_PROVIDER`<br>`VPROC-0050.PICKUP_PENDING`<br>`VPROC-0050.IN_TRANSIT`<br>`VPROC-0050.DELIVERY_PROOF_PENDING`<br>`VPROC-0050.INCIDENT_UNDER_REVIEW`<br>`VPROC-0050.RECONCILIATION_PENDING`                                                    | `VPROC-0050.THIRD_PARTY_DELIVERY_RECONCILED` |  **9** |
| `VPROC-0051` | `VPROC-0051.ECONOMIC_EVENT_RECEIVED`           | `VPROC-0051.VALIDATION_IN_PROGRESS`<br>`VPROC-0051.CLASSIFICATION_PENDING`<br>`VPROC-0051.CLASSIFIED`<br>`VPROC-0051.POSTING_PENDING`<br>`VPROC-0051.POSTED`<br>`VPROC-0051.ALLOCATION_PENDING`<br>`VPROC-0051.RECONCILIATION_PENDING`                                                                         | `VPROC-0051.ECONOMIC_EVENT_RECONCILED`       |  **9** |
| `VPROC-0052` | `VPROC-0052.PAYABLE_REGISTERED`                | `VPROC-0052.DOCUMENT_VALIDATING`<br>`VPROC-0052.UNDER_APPROVAL`<br>`VPROC-0052.APPROVED_FOR_SCHEDULING`<br>`VPROC-0052.SCHEDULED_FOR_PAYMENT`<br>`VPROC-0052.PAYMENT_IN_PROGRESS`<br>`VPROC-0052.PAYMENT_RECORDED`<br>`VPROC-0052.BANK_RECONCILIATION_PENDING`                                                 | `VPROC-0052.PAYABLE_SETTLED`                 |  **9** |
| `VPROC-0053` | `VPROC-0053.RECEIVABLE_REGISTERED`             | `VPROC-0053.VALIDATION_IN_PROGRESS`<br>`VPROC-0053.COLLECTION_SCHEDULED`<br>`VPROC-0053.COLLECTION_IN_PROGRESS`<br>`VPROC-0053.PAYMENT_RECEIVED`<br>`VPROC-0053.APPLICATION_PENDING`<br>`VPROC-0053.DIFFERENCE_UNDER_REVIEW`<br>`VPROC-0053.RECONCILIATION_PENDING`                                            | `VPROC-0053.RECEIVABLE_SETTLED`              |  **9** |
| `VPROC-0054` | `VPROC-0054.COSTING_CYCLE_OPENED`              | `VPROC-0054.INPUTS_COLLECTING`<br>`VPROC-0054.CALCULATION_IN_PROGRESS`<br>`VPROC-0054.VARIANCE_ANALYSIS`<br>`VPROC-0054.UNDER_REVIEW`<br>`VPROC-0054.PENDING_APPROVAL`<br>`VPROC-0054.PUBLISHED`<br>`VPROC-0054.CLOSE_RECONCILIATION_PENDING`                                                                  | `VPROC-0054.COSTING_CYCLE_CLOSED`            |  **9** |
| `VPROC-0055` | `VPROC-0055.FACILITY_CASE_OPENED`              | `VPROC-0055.TRIAGED`<br>`VPROC-0055.WORK_PLANNED`<br>`VPROC-0055.RESOURCES_PENDING`<br>`VPROC-0055.IN_EXECUTION`<br>`VPROC-0055.VERIFICATION_PENDING`<br>`VPROC-0055.RELEASE_PENDING`                                                                                                                          | `VPROC-0055.FACILITY_CASE_CLOSED`            |  **8** |
| `VPROC-0056` | `VPROC-0056.CONTENT_REQUESTED`                 | `VPROC-0056.BRIEF_UNDER_REVIEW`<br>`VPROC-0056.IN_CREATION`<br>`VPROC-0056.UNDER_REVIEW`<br>`VPROC-0056.PENDING_APPROVAL`<br>`VPROC-0056.APPROVED`<br>`VPROC-0056.SCHEDULED`<br>`VPROC-0056.PUBLISHED`<br>`VPROC-0056.PERFORMANCE_REVIEW`                                                                      | `VPROC-0056.CONTENT_CYCLE_REVIEWED`          | **10** |
| `VPROC-0057` | `VPROC-0057.DIGITAL_INQUIRY_RECEIVED`          | `VPROC-0057.TRIAGED`<br>`VPROC-0057.QUALIFICATION_PENDING`<br>`VPROC-0057.QUALIFIED`<br>`VPROC-0057.ASSIGNED`<br>`VPROC-0057.RESPONSE_IN_PROGRESS`<br>`VPROC-0057.COMMERCIAL_HANDOFF_PENDING`<br>`VPROC-0057.FOLLOW_UP_IN_PROGRESS`                                                                            | `VPROC-0057.DIGITAL_INQUIRY_RESOLVED`        |  **9** |
| `VPROC-0058` | `VPROC-0058.TECH_CASE_REPORTED`                | `VPROC-0058.TRIAGE_IN_PROGRESS`<br>`VPROC-0058.PRIORITIZED`<br>`VPROC-0058.DIAGNOSIS_IN_PROGRESS`<br>`VPROC-0058.WORKAROUND_APPLIED`<br>`VPROC-0058.RESOLUTION_IN_PROGRESS`<br>`VPROC-0058.USER_VALIDATION_PENDING`<br>`VPROC-0058.KNOWLEDGE_CAPTURE_PENDING`                                                  | `VPROC-0058.TECH_CASE_CLOSED`                |  **9** |
| `VPROC-0059` | `VPROC-0059.ACCESS_REQUESTED`                  | `VPROC-0059.IDENTITY_VALIDATING`<br>`VPROC-0059.OWNER_APPROVAL_PENDING`<br>`VPROC-0059.SECURITY_REVIEW_PENDING`<br>`VPROC-0059.APPROVED`<br>`VPROC-0059.PROVISIONING_IN_PROGRESS`<br>`VPROC-0059.ACCESS_ACTIVE`<br>`VPROC-0059.PERIODIC_REVIEW_PENDING`<br>`VPROC-0059.DEPROVISIONING_IN_PROGRESS`             | `VPROC-0059.ACCESS_LIFECYCLE_CLOSED`         | **10** |
| `VPROC-0060` | `VPROC-0060.DOCUMENT_ITEM_REGISTERED`          | `VPROC-0060.METADATA_VALIDATING`<br>`VPROC-0060.UNDER_REVIEW`<br>`VPROC-0060.APPROVAL_PENDING`<br>`VPROC-0060.APPROVED`<br>`VPROC-0060.SIGNATURE_PENDING`<br>`VPROC-0060.IN_FORCE`<br>`VPROC-0060.SUPERSESSION_PENDING`<br>`VPROC-0060.DISPOSITION_REVIEW_PENDING`                                             | `VPROC-0060.DOCUMENT_LIFECYCLE_CLOSED`       | **10** |
| `VPROC-0061` | `VPROC-0061.MEASUREMENT_CYCLE_OPENED`          | `VPROC-0061.DATA_COLLECTING`<br>`VPROC-0061.DATA_VALIDATING`<br>`VPROC-0061.ANALYSIS_IN_PROGRESS`<br>`VPROC-0061.FINDINGS_UNDER_REVIEW`<br>`VPROC-0061.IMPROVEMENT_DECISION_PENDING`<br>`VPROC-0061.IMPROVEMENT_IN_PROGRESS`<br>`VPROC-0061.EFFECTIVENESS_CHECK_PENDING`                                       | `VPROC-0061.IMPROVEMENT_CYCLE_EVALUATED`     |  **9** |
| `VPROC-0062` | `VPROC-0062.CONTINUITY_EVENT_DETECTED`         | `VPROC-0062.IMPACT_ASSESSMENT`<br>`VPROC-0062.RESPONSE_ACTIVATION_PENDING`<br>`VPROC-0062.CONTINGENCY_ACTIVE`<br>`VPROC-0062.MINIMUM_OPERATION_ACTIVE`<br>`VPROC-0062.RECOVERY_IN_PROGRESS`<br>`VPROC-0062.SERVICE_RESTORED_PENDING_RECONCILIATION`<br>`VPROC-0062.POST_EVENT_REVIEW`                          | `VPROC-0062.CONTINUITY_EVENT_CLOSED`         |  **9** |
| `VPROC-0063` | `VPROC-0063.ENTERPRISE_RISK_IDENTIFIED`        | `VPROC-0063.UNDER_ASSESSMENT`<br>`VPROC-0063.TREATMENT_PLANNING`<br>`VPROC-0063.TREATMENT_APPROVAL_PENDING`<br>`VPROC-0063.TREATMENT_IN_PROGRESS`<br>`VPROC-0063.MONITORING`<br>`VPROC-0063.REVIEW_PENDING`                                                                                                    | `VPROC-0063.ENTERPRISE_RISK_CYCLE_CLOSED`    |  **8** |
| `VPROC-0064` | `VPROC-0064.EXTERNAL_REQUIREMENT_RECEIVED`     | `VPROC-0064.TRIAGED`<br>`VPROC-0064.RESPONSIBILITY_ASSIGNED`<br>`VPROC-0064.RESPONSE_PREPARING`<br>`VPROC-0064.INTERNAL_REVIEW`<br>`VPROC-0064.AUTHORIZATION_PENDING`<br>`VPROC-0064.SUBMITTED`<br>`VPROC-0064.FOLLOW_UP_PENDING`<br>`VPROC-0064.COMPLIANCE_VERIFICATION_PENDING`                              | `VPROC-0064.EXTERNAL_REQUIREMENT_FULFILLED`  | **10** |
| `VPROC-0065` | `VPROC-0065.DEVELOPMENT_CYCLE_OPENED`          | `VPROC-0065.OBJECTIVES_DRAFT`<br>`VPROC-0065.OBJECTIVES_AGREED`<br>`VPROC-0065.FOLLOW_UP_IN_PROGRESS`<br>`VPROC-0065.FEEDBACK_PENDING`<br>`VPROC-0065.REVIEW_IN_PROGRESS`<br>`VPROC-0065.DEVELOPMENT_ACTIONS_IN_PROGRESS`<br>`VPROC-0065.DECISION_REVIEW_PENDING`                                              | `VPROC-0065.DEVELOPMENT_CYCLE_CLOSED`        |  **9** |
| `VPROC-0066` | `VPROC-0066.PPE_NEED_IDENTIFIED`               | `VPROC-0066.REQUIREMENT_VALIDATING`<br>`VPROC-0066.ITEM_RESERVED`<br>`VPROC-0066.DELIVERY_PENDING`<br>`VPROC-0066.DELIVERED_PENDING_ACCEPTANCE`<br>`VPROC-0066.IN_USE`<br>`VPROC-0066.REPLACEMENT_DUE`<br>`VPROC-0066.RETURN_PENDING`<br>`VPROC-0066.CONDITION_REVIEW`                                         | `VPROC-0066.PPE_CYCLE_RECONCILED`            | **10** |
| `VPROC-0067` | `VPROC-0067.KIT_DEFINITION_DRAFT`              | `VPROC-0067.DEFINITION_UNDER_REVIEW`<br>`VPROC-0067.DEFINITION_APPROVED`<br>`VPROC-0067.INSTANCE_ASSEMBLING`<br>`VPROC-0067.COMPLETENESS_CHECK`<br>`VPROC-0067.AVAILABLE`<br>`VPROC-0067.ASSIGNED`<br>`VPROC-0067.IN_USE`<br>`VPROC-0067.RETURN_UNDER_VERIFICATION`                                            | `VPROC-0067.KIT_CYCLE_RECONCILED`            | **10** |
| `VPROC-0068` | `VPROC-0068.SATISFACTION_MEASUREMENT_DRAFT`    | `VPROC-0068.INSTRUMENT_UNDER_REVIEW`<br>`VPROC-0068.SAMPLE_PREPARING`<br>`VPROC-0068.PENDING_PUBLICATION`<br>`VPROC-0068.COLLECTING_RESPONSES`<br>`VPROC-0068.DATA_VALIDATING`<br>`VPROC-0068.ANALYSIS_IN_PROGRESS`<br>`VPROC-0068.RESULTS_UNDER_REVIEW`<br>`VPROC-0068.IMPROVEMENT_HANDOFF_PENDING`           | `VPROC-0068.SATISFACTION_CYCLE_CLOSED`       | **10** |
| `VPROC-0069` | `VPROC-0069.BUDGET_DRAFT`                      | `VPROC-0069.ASSUMPTIONS_COLLECTING`<br>`VPROC-0069.CONSOLIDATING`<br>`VPROC-0069.UNDER_REVIEW`<br>`VPROC-0069.PENDING_APPROVAL`<br>`VPROC-0069.APPROVED`<br>`VPROC-0069.IN_FORCE`<br>`VPROC-0069.CONSUMPTION_MONITORING`<br>`VPROC-0069.FORECAST_REVISION_IN_PROGRESS`<br>`VPROC-0069.VARIANCE_REVIEW`         | `VPROC-0069.BUDGET_CYCLE_CLOSED`             | **11** |
---

#### 9. Reconciliación cuantitativa

La matriz anterior deberá mantener simultáneamente:

```text
69 procesos
69 filas de proceso
69 estados INITIAL
454 estados INTERMEDIATE
69 estados FINAL_NORMAL
592 ProcessStateId únicos
0 ProcessId faltantes
0 estados sin proceso propietario
0 identidades plenas duplicadas
```

Distribución por cantidad total de estados por proceso:

- mínimo observado: **6** estados principales normales;
- máximo observado: **11** estados principales normales;
- todos los procesos poseen exactamente un inicial y exactamente un final normal;
- cada proceso posee un conjunto no vacío de estados intermedios.

La suma de los estados por fila debe reproducir exactamente **592**.

---

#### 10. Proyección compartida derivada

La futura proyección TypeScript deberá derivarse de los registros canónicos y ser equivalente conceptualmente a:

```text
const PROCESS_STATE_IDS = <colección derivada de 592 identidades> as const;

type ProcessStateId = (typeof PROCESS_STATE_IDS)[number];

type ProcessStateKind =
  | "INITIAL"
  | "INTERMEDIATE"
  | "FINAL_NORMAL";
```

Además, la proyección deberá permitir resolver de forma determinista:

```text
ProcessStateId
→ ProcessId
→ STATE_CODE
→ ProcessStateKind
→ metadatos semánticos aprobados del registro propietario
```

Los metadatos semánticos no se duplican como una segunda fuente. La proyección deberá conservar, según corresponda, la etiqueta humana, condición de nacimiento, fase, verdad mínima, criterio terminal, tipo terminal y demás propiedades ya aprobadas por `PROC-CAT-009..011`.

---

#### 11. Estados iniciales

Cada proceso conserva exactamente un `INITIAL`.

Reglas vinculantes:

1. el inicial representa el nacimiento válido de una instancia;
2. no demuestra aprobación, pago, publicación, entrega, liberación, conciliación ni cierre;
3. no puede utilizarse como sentinel técnico genérico para una instancia inexistente;
4. el nacimiento debe conservar la condición aprobada en `PROC-CAT-009`;
5. una creación automática, externa u offline mantiene los requisitos de idempotencia y trazabilidad ya protegidos por `TREQ-PROC-038..042`;
6. un consumidor no puede sustituir el inicial por un valor local como `NEW`, `DRAFT` o `PENDING` si ese valor no es la identidad aprobada para el proceso.

---

#### 12. Estados intermedios

Los 454 `INTERMEDIATE` representan verdades empresariales persistentes no terminales.

Invariantes:

1. cada instancia mantiene una sola posición principal vigente dentro de su ciclo normal;
2. bloqueo, atraso, riesgo, SLA, trabajo offline o atención requerida permanecen condiciones transversales y no crean estados principales competidores;
3. un estado intermedio no implica efectos que todavía requieran una transición propia;
4. un estado intermedio no se interpreta como final, cancelación, rechazo, reversión o eliminación;
5. cada identidad conserva la fase y verdad mínima aprobadas por `PROC-CAT-010`;
6. el mismo `STATE_CODE` en dos procesos no permite intercambiar semántica entre ellos;
7. una transición hacia o desde un intermedio solo es válida si existe en el grafo normal o en el mecanismo excepcional autorizado correspondiente.

---

#### 13. Estados finales normales

Los 69 `FINAL_NORMAL` representan terminación normal del proceso.

Reglas:

1. existe exactamente uno por cada `ProcessId` vigente;
2. su criterio de cierre y verdad terminal proceden de `PROC-CAT-011`;
3. alcanzar el estado final normal exige que los efectos, obligaciones, conciliaciones y evidencias requeridos estén satisfechos conforme al contrato del proceso;
4. el final normal es terminal dentro del grafo normal;
5. no se sobrescribe para aparentar reapertura;
6. una reapertura autorizada crea una revisión, ciclo o instancia vinculada y conserva el cierre original;
7. cerrar el proceso no implica retirar o eliminar una entidad persistente que sobreviva al proceso.

---

#### 14. Separación de namespaces y conceptos

No pertenecen a `ProcessStateId`:

```text
ProcessId
process_instance_id
transition_id
step_id
screen_id
action_id
event_id
command_id
exception_action_id
cancellation_action_id
reversal_action_id
correction_action_id
condition_code
error_code
```

En particular:

- las **590** transiciones normales de `PROC-CAT-012` son relaciones entre estados, no estados;
- las **276** acciones excepcionales de `PROC-CAT-013` son acciones `VPROC-####.EX-###`, no `ProcessStateId`;
- las **276** acciones de cancelación, anulación, reversión, compensación y corrección de `PROC-CAT-014` son acciones gobernadas, no estados principales;
- resultados como `CONDITION_ONLY`, `LINKED_REVIEW`, `TEMPORARY_CONTROL`, `ROUTE_CHANGE` o `EXCEPTIONAL_TERMINAL` clasifican efectos de acciones excepcionales y no se incorporan al conjunto de 592 identidades normales;
- condiciones transversales no sustituyen la posición principal de la instancia.

No se inventan estados excepcionales nuevos para convertir esas acciones en una lista de estados.

---

#### 15. Coherencia proceso-estado

Una identidad válida debe satisfacer simultáneamente:

```text
ProcessId válido
AND
ProcessStateId publicado
AND
prefijo del estado = ProcessId de la instancia
```

Casos normativos:

```text
VPROC-0001.DECISION_DRAFT
→ miembro válido para VPROC-0001

VPROC-0002.DECISION_DRAFT
→ sintaxis válida
→ no publicado para VPROC-0002
→ inválido

VPROC-0070.CUALQUIER_ESTADO
→ proceso no asignado en el corte vigente
→ inválido

UNDER_REVIEW
→ código desnudo
→ no es ProcessStateId
```

Un estado reconocido para otro proceso no puede reutilizarse mediante cast o comparación textual.

---

#### 16. Validación de entradas externas y legado

Toda entrada proveniente de JSON, Supabase, RPC, eventos, integraciones, URL, almacenamiento local, configuración o datos legacy se considera no confiable hasta validación.

La secuencia conceptual es:

```text
valor externo
→ validar forma
→ validar ProcessId
→ validar identidad plena en el conjunto publicado
→ validar correspondencia con el proceso de la instancia
→ ProcessStateId o rechazo
```

Reglas de legado:

1. una aplicación puede conservar temporalmente un estado legacy únicamente mediante una matriz explícita `legacy → canónico`;
2. el mapeo debe distinguir estado principal, condición transversal, acción, error técnico, final o excepción;
3. un valor ambiguo no se migra automáticamente;
4. no se infiere estado desde rutas, botones, colores, timestamps o presencia aislada de campos;
5. un estado histórico no mapeable conserva su valor original y evidencia hasta la decisión propietaria;
6. toda modificación física posterior de Supabase deberá crearse, versionarse y documentarse en `vento-shell`.

---

#### 17. Inmutabilidad, evolución y versionado

Una identidad de estado aprobada no se cambia silenciosamente en consumidores.

Reglas:

1. renombrar o reinterpretar un `STATE_CODE` publicado es un cambio contractual;
2. agregar un estado requiere primero una decisión aprobada en la fuente semántica propietaria y la reconciliación del grafo aplicable;
3. retirar un estado exige inventario de consumidores, compatibilidad, migración, evidencia y preservación histórica;
4. una versión publicada de `@vento/contracts` permanece inmutable;
5. un consumidor que no reconoce una identidad nueva debe tratarla como incompatibilidad contractual, no como fallback a un estado conocido;
6. la procedencia de la proyección deberá permitir identificar la versión de los registros de proceso que la originaron;
7. esta tarea no asigna un número de versión, tag, release o hash a una publicación física todavía inexistente.

---

#### 18. Compatibilidad de consumidores

La adopción física posterior deberá conservar:

```text
fuente canónica de estados
→ proyección compartida publicada
→ inventario de consumidores
→ adapters legacy explícitos
→ migración por lotes reversibles
→ validación de paridad
→ retiro de copias locales
```

Un consumidor podrá restringir más su comportamiento, pero no:

- ampliar el conjunto de estados;
- aceptar estados de otro proceso;
- inventar aliases silenciosos;
- convertir acciones en estados;
- tratar condiciones transversales como estado principal;
- redefinir terminalidad;
- reabrir un final normal mediante overwrite;
- usar strings libres como autoridad contractual.

La migración no exige actualizar simultáneamente todos los repositorios si la matriz de compatibilidad demuestra interoperabilidad segura.

---

#### 19. Estado de materialización física

En el corte vigente:

```text
SHELL-CON-010
→ 592 identidades de estado centralizadas documentalmente
→ 69 matrices de proceso reconciliadas
→ 0 estados nuevos
→ 0 cambios de transición
→ 0 cambios físicos
→ 0 migraciones
→ 0 cambios en Supabase
→ 0 adopciones de consumidor
```

La futura materialización de `@vento/contracts/processes` queda asignada a `E5-GATE-008`, `SHELL-CI-020`, `SHELL-CI-001`, `SHELL-CI-002`, `SHELL-CI-003` y `SHELL-CI-005`; la adopción y retiro de copias locales corresponde a `SHELL-CI-006`, `SHELL-MIG-001`, `SHELL-MIG-002`, `SHELL-MIG-003`, `SHELL-MIG-007` y `SHELL-MIG-008`.

---

#### 20. Hallazgos y destinos exactos

| Hallazgo                                                                     | Estado                    | Destino existente / condición de salida                                                                                                                                                                                                                                                                                        |
| ---------------------------------------------------------------------------- | ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `packages/contracts` todavía no está materializado                           | esperado por fase         | ciclo físico de `@vento/contracts`, `E5-GATE-008::<package_id>` y `SHELL-CI-020`                                                                                                                                                                                                                                               |
| `ProcessStateId` compartido no existe físicamente                            | definido no materializado | `E5-GATE-008` → `SHELL-CI-020`; pruebas en `SHELL-CI-001`, build en `SHELL-CI-002`, release en `SHELL-CI-003` y compatibilidad en `SHELL-CI-005`                                                                                                                                                                               |
| consumidores pueden conservar estados como strings o enums locales           | legacy potencial          | `SHELL-MIG-001` a `SHELL-MIG-008` y matriz de compatibilidad del consumidor afectado                                                                                                                                                                                                                                           |
| 590 transiciones normales requieren seguir separadas del catálogo de estados | contrato preservado       | `PROC-CAT-012`; validación transversal en `SHELL-CI-018`                                                                                                                                                                                                                                                                       |
| 276 acciones excepcionales no son estados                                    | contrato preservado       | `PROC-CAT-013`; consumidores deberán referenciar el namespace de acciones correspondiente                                                                                                                                                                                                                                      |
| 276 acciones CCR no son estados                                              | contrato preservado       | `PROC-CAT-014`; contrato compartido en `SHELL-CON-012`; materialización física en `SHELL-CI-020` después de `E5-GATE-008`                                                                                                                                                                                                      |
| estados legacy ambiguos no admiten migración automática                      | bloqueo controlado        | consumidores en `SUPA-TRANS-007`; pruebas en `SUPA-TRANS-009`; rollback en `SUPA-TRANS-011`; tipos/contratos en `SUPA-TRANS-014`; gate en `SUPA-TRANS-015`; migración en `SHELL-MIG-001`, `SHELL-MIG-002`, `SHELL-MIG-003`, `SHELL-MIG-007`, `SHELL-MIG-008`; cambio físico solo desde `SHELL-CI-020` después de `E5-GATE-008` |
| identificadores de pantallas permanecen fuera de esta tarea                  | reservado por secuencia   | `SHELL-CON-011`                                                                                                                                                                                                                                                                                                                |

No se crea ningún identificador de tarea nuevo: todos los pendientes conservan destino documental existente.

---

#### 21. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** **0**
**Requisitos modificados:** **0**

**Justificación:** `SHELL-CON-010` centraliza documentalmente las mismas identidades, clasificaciones y restricciones de estado ya protegidas por `TREQ-PROC-038` a `TREQ-PROC-052`, junto con la cobertura transversal de fuente compartida, compatibilidad y validación de `TREQ-SHELL-002`, `TREQ-SHELL-006` y `TREQ-SHELL-008`. No crea estados, transiciones ni comportamiento ejecutable nuevo; generar un requisito adicional duplicaría cobertura existente.

El Registro Canónico de Requisitos de Prueba permanece sin cambios.

---

#### 22. Decisiones vinculantes

1. el universo compartido contiene exactamente **592** estados principales normales;
2. existen exactamente **69 `INITIAL`**, **454 `INTERMEDIATE`** y **69 `FINAL_NORMAL`**;
3. los 592 estados pertenecen exactamente a `VPROC-0001..VPROC-0069`;
4. cada proceso posee un único estado inicial y un único estado final normal;
5. cada proceso posee al menos un estado intermedio;
6. `ProcessStateId` usa la identidad plena `VPROC-####.<STATE_CODE>`;
7. el patrón sintáctico no sustituye comprobación de pertenencia;
8. un `STATE_CODE` desnudo no es identidad global;
9. el mismo código puede existir en procesos distintos sin fusionar semántica;
10. las diez fases intermedias permanecen clasificaciones y no estados adicionales;
11. los ocho tipos terminales permanecen clasificaciones y no estados adicionales;
12. las 590 transiciones normales permanecen fuera de `ProcessStateId`;
13. las 276 acciones excepcionales permanecen fuera de `ProcessStateId`;
14. las 276 acciones de cancelación, anulación, reversión, compensación y corrección permanecen fuera de `ProcessStateId`;
15. condiciones transversales no se convierten en estado principal;
16. una instancia conserva una sola posición principal normal vigente;
17. un final normal es terminal para el grafo normal y no se sobrescribe para reabrir;
18. entradas externas requieren validación de forma, proceso, pertenencia y correspondencia;
19. estados legacy ambiguos no se migran por heurística;
20. los registros `PROC-CAT-009..011` conservan autoridad semántica;
21. `PROC-CAT-012` conserva autoridad del grafo normal y reconciliación;
22. `@vento/contracts/processes` conserva la proyección técnica compartida;
23. no se crea package, código, migración, Supabase, dato, release ni adopción física;
24. no se crean ni modifican requisitos `TREQ-*`;
25. `SHELL-CON-011` permanece exclusivamente reservada.

---

#### 23. Criterios de aceptación

`SHELL-CON-010` queda documentalmente completa cuando:

- estén materializadas las 69 filas de proceso y las 592 identidades principales normales;
- la reconciliación produzca 69 iniciales, 454 intermedios y 69 finales normales;
- existan cero `ProcessId` faltantes y cero identidades plenas duplicadas;
- la identidad de cada estado conserve el prefijo de su proceso propietario;
- `ProcessStateId` se derive de una colección única y no de listas manuales competidoras;
- la proyección preserve los metadatos semánticos aprobados sin convertirse en una segunda fuente;
- se conserven las diez fases intermedias y sus 454 ocurrencias;
- se conserven los ocho tipos terminales y sus 69 ocurrencias;
- transiciones, acciones excepcionales, acciones CCR y condiciones transversales permanezcan fuera del conjunto de estados;
- un código desnudo no se acepte como identidad global;
- las entradas externas fallen cerradas ante proceso desconocido, estado desconocido o incompatibilidad proceso-estado;
- los estados legacy ambiguos no se migren automáticamente;
- `@vento/contracts/processes` permanezca como superficie documental sin materialización física;
- no se creen ni modifiquen requisitos de prueba;
- no se ejecuten cambios físicos;
- la continuidad reserve exclusivamente `SHELL-CON-011`.

---

#### 24. Continuidad canónica

##### ÚLTIMA TAREA APROBADA

SHELL-CON-009 — Centralizar identificadores de procesos

##### TAREA ACTUAL APROBADA

SHELL-CON-010 — Centralizar estados de procesos

##### SIGUIENTE TAREA RESERVADA

SHELL-CON-011 — Centralizar identificadores de pantallas


### ✅ SHELL-CON-011 — Centralizar identificadores de pantallas

**Estado:** APROBADA
**Tarea anterior:** SHELL-CON-010 — Centralizar estados de procesos
**Tarea siguiente:** SHELL-CON-012 — Crear contrato de acciones funcionales
**Tipo de tarea:** Documental
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Estado físico resultante:** `CONTRATO_DE_IDENTIDAD_DE_PANTALLAS_DEFINIDO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-CON-011` centraliza la identidad técnica estable de las pantallas de Vento OS a partir del contrato aprobado por `PROC-SCREEN-001` y del catálogo materializado documentalmente por `PROC-SCREEN-002`, sin crear pantallas nuevas, renumerar identidades existentes, reinterpretar fronteras UX ni sustituir los vínculos aprobados con aplicaciones, procesos y pasos.

La frontera contractual queda:

```text
PROC-SCREEN-001
-> gobierna identidad, asignación, estabilidad y ciclo de vida de ScreenId

SCREEN-CANONICAL-CATALOG-001
-> contiene las identidades canónicas materializadas

@vento/contracts/screens
-> proyección compartida, tipada y validable de esas identidades

consumidores
-> referencian ScreenId
-> no inventan, renombran ni reasignan VSCREEN-*
```

Un `ScreenId` identifica una superficie lógica canónica. No identifica una ruta web, archivo, componente, layout, paso, proceso, aplicación, permiso, estado visual, modal subordinado, dispositivo ni implementación técnica concreta.

---

#### 2. Resultado canónico

El conjunto vigente queda compuesto por exactamente **177 identidades canónicas**:

```text
VSCREEN-0001 .. VSCREEN-0177
```

Conciliación:

| Dimensión                                                      |      Resultado |
| -------------------------------------------------------------- | -------------: |
| pantallas canónicas esperadas                                  |        **177** |
| identidades materializadas en esta tarea                       |        **177** |
| identidades únicas                                             |        **177** |
| faltantes dentro del conjunto vigente                          |          **0** |
| duplicados                                                     |          **0** |
| identidades actuales fuera de `VSCREEN-0001..VSCREEN-0177`     |          **0** |
| registros con estado vigente `CANONICAL`                       |        **177** |
| aplicaciones canónicas del catálogo general                    |         **10** |
| aplicaciones con pantallas asignadas                           |          **9** |
| aplicaciones canónicas con cero pantallas por decisión vigente | **1 (`aura`)** |

`VSCREEN-0178` satisface la forma sintáctica mínima del namespace, pero no pertenece al conjunto canónico vigente y esta tarea no lo asigna.

---

#### 3. Fuentes y precedencia

Esta tarea conserva, sin reabrirlas, las decisiones vigentes de las siguientes fuentes:

| Fuente                                              | Uso vinculante                                                                                           |
| --------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| `docs/plan-canonico/modular/01_PROTOCOLO.md`        | continuidad, alcance documental, trazabilidad y gobierno de requisitos de prueba                         |
| `docs/plan-canonico/modular/delivery-contract.json` | forma del artefacto documental y límites de entrega                                                      |
| `docs/plan-canonico/modular/active-sequence.json`   | `SHELL-CON-011` como tarea actual y `SHELL-CON-012` como siguiente tarea reservada                       |
| `SHELL-CON-001`                                     | raíz contractual única `@vento/contracts` y reserva de subpaths especializados a sus tareas propietarias |
| `SHELL-CON-009`                                     | patrón de centralización de identidades compartidas sin sustituir su registro semántico propietario      |
| `SHELL-CON-010`                                     | continuidad inmediata y separación entre estado de proceso e identidad de pantalla                       |
| `PROC-SCREEN-001`                                   | contrato de `ScreenId`, formato, opacidad, no reutilización, ciclo de vida y admisión futura             |
| `PROC-SCREEN-002`                                   | `SCREEN-CANONICAL-CATALOG-001`, 177 identidades y aplicación primaria de cada pantalla                   |
| `PROC-SCREEN-003`                                   | vínculo de las 177 pantallas con procesos sin alterar `ScreenId`                                         |
| `PROC-SCREEN-004`                                   | vínculo de las 177 pantallas con pasos sin alterar `ScreenId`                                            |
| validadores canónicos de pantallas                  | secuencia, unicidad, cobertura y ausencia de identificadores no registrados                              |
| Registro Canónico de Requisitos de Prueba           | cobertura ya existente de identidad, estabilidad, catálogo y vínculos de pantalla                        |

Precedencia específica:

```text
PROC-SCREEN-001
-> define el contrato de identidad

PROC-SCREEN-002 / SCREEN-CANONICAL-CATALOG-001
-> materializan las 177 identidades vigentes

PROC-SCREEN-003 y PROC-SCREEN-004
-> agregan relaciones sin cambiar identidad

SHELL-CON-011
-> centraliza la proyección técnica compartida
-> no redefine la semántica UX ni el catálogo propietario
```

---

#### 4. Conciliación con el mini-bloque de contratos compartidos

La continuidad del mini-bloque permanece coherente:

```text
SHELL-CON-001
-> define la raíz contractual compartida

SHELL-CON-002..010
-> centralizan contratos anteriores sin redefinir ScreenId

SHELL-CON-010
-> reserva SHELL-CON-011

SHELL-CON-011
-> centraliza identificadores de pantallas

SHELL-CON-012
-> permanece reservada para acciones funcionales
```

No se identifica una decisión aprobada en `SHELL-CON-001..010` que deba corregirse para desarrollar esta tarea.

---

#### 5. Línea base verificable

El estado técnico y documental previo a la materialización física queda:

| Elemento                                               | Estado                   | Disposición                                                    |
| ------------------------------------------------------ | ------------------------ | -------------------------------------------------------------- |
| workspace `packages/*` en `vento-shell`                | existente                | conserva la fundación compartida                               |
| `packages/contracts`                                   | no materializado         | no se crea en esta tarea                                       |
| `@vento/contracts` publicado físicamente               | no confirmado            | no se presume release                                          |
| subpath público de pantallas                           | no observado físicamente | se define documentalmente en esta tarea                        |
| `SCREEN-CANONICAL-CATALOG-001`                         | aprobado documentalmente | fuente materializada de identidades de pantalla                |
| referencias `VSCREEN-*` en documentación y validadores | existentes               | consumidores documentales, no package compartido materializado |
| catálogo canónico de pantallas                         | 177 registros            | se conserva sin alta, baja o renumeración                      |
| cambios físicos autorizados en `SHELL-CON-011`         | ninguno                  | fase exclusivamente documental                                 |

La presencia de un `VSCREEN-*` en documentación, rutas, matrices, métricas o pruebas no constituye por sí sola una API compartida publicada.

---

#### 6. Namespace contractual compartido

Esta tarea define el subpath lógico especializado:

```text
@vento/contracts/screens
```

Su responsabilidad pública queda limitada a contratos estáticos de identidad de pantalla y a artefactos determinísticamente derivados de la fuente canónica.

Superficie conceptual mínima:

```text
@vento/contracts/screens
-> ScreenId
-> SCREEN_IDS
-> validación de sintaxis y pertenencia
-> metadata de procedencia del catálogo fuente
```

No se crea físicamente el subpath, no se publica una versión y no se define una huella de release en esta fase.

El subpath no absorbe contratos de proceso, estados de proceso, acciones funcionales, eventos empresariales, autorización, navegación, UI runtime ni datos operativos.

---

#### 7. Forma canónica de `ScreenId`

La forma contractual es:

```text
prefijo `VSCREEN-` seguido por una secuencia decimal global
```

Patrón sintáctico aprobado:

```text
^VSCREEN-[0-9]{4,}$
```

Reglas:

1. el prefijo es exactamente `VSCREEN-`;
2. la parte numérica contiene como mínimo cuatro dígitos;
3. el allocator es global y monotónico;
4. el identificador es opaco y no codifica aplicación, módulo, dominio, proceso, paso, rol, sede, ruta, dispositivo, versión ni entorno;
5. una cadena que satisfaga el patrón no se convierte automáticamente en una identidad asignada;
6. la pertenencia debe resolverse contra el conjunto publicado derivado del catálogo canónico;
7. `VSCREEN-0000` no pertenece al conjunto asignado;
8. `VSCREEN-0178` no pertenece al conjunto asignado vigente;
9. no se admiten variantes por mayúsculas/minúsculas, espacios, prefijos de aplicación o sufijos semánticos;
10. la serialización pública de la identidad permanece como string exacto `VSCREEN-*`.

---

#### 8. Matriz completa de centralización por identidad

La siguiente matriz materializa una decisión explícita para las **177 de 177** identidades canónicas. La columna de bloqueo se refiere exclusivamente al cierre documental de `SHELL-CON-011`; no implica implementación física.

| `ScreenId`     | Estado vigente | Decisión de centralización            | Bloqueo documental   |
| -------------- | -------------- | ------------------------------------- | -------------------- |
| `VSCREEN-0001` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0002` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0003` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0004` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0005` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0006` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0007` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0008` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0009` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0010` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0011` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0012` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0013` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0014` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0015` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0016` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0017` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0018` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0019` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0020` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0021` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0022` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0023` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0024` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0025` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0026` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0027` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0028` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0029` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0030` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0031` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0032` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0033` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0034` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0035` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0036` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0037` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0038` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0039` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0040` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0041` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0042` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0043` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0044` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0045` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0046` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0047` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0048` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0049` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0050` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0051` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0052` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0053` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0054` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0055` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0056` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0057` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0058` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0059` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0060` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0061` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0062` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0063` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0064` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0065` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0066` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0067` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0068` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0069` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0070` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0071` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0072` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0073` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0074` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0075` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0076` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0077` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0078` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0079` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0080` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0081` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0082` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0083` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0084` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0085` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0086` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0087` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0088` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0089` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0090` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0091` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0092` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0093` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0094` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0095` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0096` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0097` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0098` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0099` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0100` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0101` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0102` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0103` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0104` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0105` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0106` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0107` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0108` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0109` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0110` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0111` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0112` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0113` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0114` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0115` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0116` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0117` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0118` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0119` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0120` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0121` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0122` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0123` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0124` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0125` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0126` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0127` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0128` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0129` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0130` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0131` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0132` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0133` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0134` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0135` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0136` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0137` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0138` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0139` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0140` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0141` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0142` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0143` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0144` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0145` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0146` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0147` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0148` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0149` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0150` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0151` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0152` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0153` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0154` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0155` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0156` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0157` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0158` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0159` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0160` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0161` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0162` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0163` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0164` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0165` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0166` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0167` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0168` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0169` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0170` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0171` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0172` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0173` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0174` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0175` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0176` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |
| `VSCREEN-0177` | `CANONICAL`    | `CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD` | `NINGUNO_DOCUMENTAL` |

Conciliación de la matriz:

```text
filas esperadas = 177
filas materializadas = 177
ScreenId únicos = 177
CANONICAL = 177
CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD = 177
bloqueos documentales = 0
faltantes = 0
duplicados = 0
```

La matriz constituye la membresía vigente de `ScreenId` para esta tarea. No asigna identidades adicionales.

---

#### 9. Distribución heredada por aplicación

`PROC-SCREEN-002` ya asignó una aplicación primaria a cada pantalla. `SHELL-CON-011` conserva esa relación sin utilizarla para derivar la identidad.

| Aplicación | Pantallas canónicas |
| ---------- | ------------------: |
| `shell`    |               **7** |
| `viso`     |              **31** |
| `anima`    |              **14** |
| `nexo`     |              **37** |
| `fogo`     |              **15** |
| `origo`    |              **14** |
| `pulso`    |              **20** |
| `numera`   |              **20** |
| `pass`     |              **19** |
| `aura`     |               **0** |
| **Total**  |             **177** |

Invariantes:

1. cada una de las 177 pantallas conserva exactamente una aplicación primaria vigente;
2. los rangos numéricos de `VSCREEN-*` no reservan bloques por aplicación;
3. mover la aplicación propietaria de una pantalla no exige renumerar su `ScreenId` cuando la identidad funcional permanece;
4. `aura` conserva cero pantallas por la decisión funcional vigente y no recibe identidades ficticias para completar una distribución;
5. una aplicación no administra un namespace local paralelo de pantallas.

---

#### 10. Proyección TypeScript conceptual

La colección literal publicada deberá derivarse del catálogo canónico y el tipo deberá obtenerse de esa misma colección:

```text
SCREEN_IDS
-> colección inmutable derivada de los 177 valores canónicos

ScreenId
-> unión literal derivada de SCREEN_IDS
```

Reglas:

1. la colección y el tipo son artefactos derivados, no una segunda fuente editable;
2. `ScreenId` no se define como `string` abierto dentro de consumidores que ya hayan adoptado el contrato;
3. los consumidores no agregan miembros localmente;
4. una salida generada divergente del catálogo canónico es inválida;
5. la regeneración conserva orden numérico ascendente por la parte secuencial del identificador.

---

#### 11. Validación runtime de fronteras

Toda entrada procedente de JSON, base de datos, RPC, evento, query parameter, almacenamiento local, analítica, API, integración o consumidor legacy se considera no confiable hasta validación.

La aceptación exige simultáneamente:

```text
sintaxis VSCREEN-* válida
AND
pertenencia al conjunto canónico publicado
```

Ejemplos:

```text
VSCREEN-0001
-> sintaxis válida
-> miembro vigente
-> ScreenId válido

VSCREEN-0177
-> sintaxis válida
-> miembro vigente
-> ScreenId válido

VSCREEN-0178
-> sintaxis válida
-> no pertenece al conjunto vigente
-> referencia desconocida

VSCREEN-9999
-> sintaxis válida
-> no pertenece al conjunto vigente
-> referencia desconocida

vscreen-0001
-> sintaxis inválida
```

Un cast estático no sustituye la comprobación de pertenencia.

---

#### 12. Estabilidad, opacidad y no reutilización

Se conservan las reglas de `PROC-SCREEN-001`:

1. un `ScreenId` asignado no se reutiliza para otra pantalla;
2. un cambio de nombre humano conserva el ID cuando la intención principal y el contrato material permanecen;
3. un cambio de ruta o slug conserva el ID bajo la misma identidad funcional;
4. un rediseño visual o refactor de componentes no crea por sí mismo otro ID;
5. una adaptación responsive o de dispositivo puede conservar el ID cuando mantiene intención, objeto y contrato;
6. un cambio de intención principal exige evaluar una identidad nueva conforme al gobierno de pantallas;
7. la división, fusión o sustitución conserva linaje y no reescribe historia;
8. retirar una pantalla no habilita reutilizar su número;
9. el identificador no codifica semántica mutable;
10. conocer un `ScreenId` no concede acceso ni permite inferir autorización.

---

#### 13. Nombres, rutas, slugs y componentes

No son `ScreenId`:

- nombre mostrado;
- nombre interno;
- título de página;
- ruta web;
- deep link;
- slug;
- clave de navegación;
- nombre de archivo;
- nombre de componente;
- layout;
- modal subordinado;
- panel subordinado;
- identificador legacy;
- etiqueta analítica histórica.

Estas referencias pueden resolver hacia una identidad canónica mediante mecanismos gobernados, pero no sustituyen `ScreenId` como clave contractual estable.

La reutilización de un componente en varias pantallas no fusiona sus identidades.

---

#### 14. Separación frente a identidades relacionadas

`ScreenId` permanece separado de:

```text
ProcessId
process_instance_id
step_id
action_id
event_id
permission_key
app_code
route_id
component_id
request_id
correlation_id
audit_entry_id
metric_id
```

En particular:

```text
ScreenId reconocido
!= ProcessId
!= step_id
!= ruta
!= permiso
!= implementación
```

La presencia de una relación con una pantalla no convierte la identidad relacionada en parte del namespace `VSCREEN-*`.

---

#### 15. Reconciliación con procesos y pasos

Las tareas posteriores de E2 añadieron relaciones sin modificar la identidad:

```text
PROC-SCREEN-003
-> 177 pantallas reconciliadas con procesos canónicos
-> cobertura de los 69 procesos canónicos
-> 0 ScreenId nuevos por el vínculo

PROC-SCREEN-004
-> 177 pantallas reconciliadas con pasos compatibles
-> 177 vínculos de paso
-> 0 ScreenId nuevos por el vínculo
```

Reglas:

1. `primary_process_id` no se deriva del número de `ScreenId`;
2. un cambio de proceso relacionado no renumera automáticamente la pantalla;
3. `step_id` no se incorpora al identificador;
4. una pantalla puede conservar identidad aunque cambien relaciones funcionales autorizadas, siempre que la frontera lógica de pantalla permanezca;
5. las relaciones con proceso y paso siguen gobernadas por sus registros propietarios.

---

#### 16. Reconciliación de `VSCREEN-0176` y `VSCREEN-0177`

La corrección integral de `PROC-SCREEN-002` amplió el catálogo hasta 177 para representar dos fronteras funcionales que no debían confundirse con superficies históricas ya existentes.

Se conserva la decisión aprobada:

- `VSCREEN-0176` representa la definición reutilizable de kits/conjuntos y permanece separada de la operación histórica por instancia asociada a `VSCREEN-0135`;
- `VSCREEN-0177` representa la configuración reutilizable de impresoras y permanece separada de la cola/trabajos históricos asociados a `VSCREEN-0144`;
- `VSCREEN-0135` y `VSCREEN-0144` conservan su identidad histórica;
- la ampliación no renumera ni elimina las 175 identidades anteriores.

Estas decisiones son ejemplos del principio: separar fronteras materiales crea identidad nueva; compartir componentes o dominio no fusiona pantallas.

---

#### 17. Ciclo de vida

Los estados de ciclo de vida aprobados para el registro de pantallas permanecen:

```text
PROPOSED
CANONICAL
SUPERSEDED
MERGED
SPLIT
RETIRED
LEGACY_MAPPED
```

Para el conjunto vigente materializado por `PROC-SCREEN-002`:

```text
CANONICAL = 177
```

Reglas:

1. el estado de ciclo de vida no forma parte de `ScreenId`;
2. cambiar el estado no permite reciclar el número;
3. relaciones `supersedes` y `replaced_by` conservan trazabilidad cuando apliquen;
4. referencias históricas continúan resolviendo hacia la identidad registrada;
5. un consumidor no puede convertir una pantalla retirada en vigente por mantener una ruta o componente activo.

---

#### 18. Orden, generación y procedencia

La colección derivada deberá conservar el orden global numérico:

```text
VSCREEN-0001
VSCREEN-0002
...
VSCREEN-0177
```

No se utilizan como orden contractual:

- aplicación primaria;
- módulo;
- nombre;
- ruta;
- proceso;
- paso;
- prioridad;
- fecha de implementación;
- orden de una consulta;
- orden de imports.

La salida derivada deberá permitir relacionar cada miembro con `SCREEN-CANONICAL-CATALOG-001` y regenerarse sin edición manual de identidades.

---

#### 19. Evolución del conjunto

La incorporación futura de una pantalla sigue el gobierno de `PROC-SCREEN-001`:

```text
frontera lógica demostrada
-> identity_statement
-> comprobación de no duplicidad
-> asignación atómica del siguiente número por el allocator propietario
-> registro mínimo y ciclo de vida
-> vínculo con decisiones de división, fusión o sustitución cuando aplique
-> nueva proyección contractual
```

Una aplicación consumidora, una ruta, una migración, una tabla, un componente o un tipo TypeScript local no puede asignar unilateralmente un `ScreenId`.

Esta tarea no admite ninguna identidad adicional al conjunto `VSCREEN-0001..VSCREEN-0177`.

---

#### 20. Versionado y compatibilidad

`SHELL-CON-011` no asigna una versión publicada inexistente al subpath de pantallas.

Cuando la superficie contractual sea materializada y publicada:

1. `ScreenId` formará parte de una superficie versionada;
2. una nueva identidad solo podrá aparecer después de su admisión en el registro propietario;
3. los consumidores deberán usar una versión compatible con el conjunto que reciben;
4. una referencia desconocida no se aproximará por nombre, ruta o semejanza;
5. retirar o fusionar una pantalla conservará historia y compatibilidad conforme al ciclo de vida;
6. una versión publicada no se modifica en sitio;
7. la procedencia deberá relacionar la salida con el catálogo fuente y el commit aplicable.

No se anticipan tag, release, manifiesto físico ni hash de publicación.

---

#### 21. Estado de materialización y destinos existentes

La tarea no crea responsabilidades nuevas de implementación.

| Resultado pendiente de fase física                                 | Destino existente                                                                                                                                |
| ------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| materializar la raíz `@vento/contracts` y sus superficies públicas | `E5-GATE-008` → `SHELL-CI-020`; pruebas en `SHELL-CI-001`, build en `SHELL-CI-002`, release en `SHELL-CI-003` y compatibilidad en `SHELL-CI-005` |
| generar tipos, constantes y validadores técnicos de pantallas      | `PROC-SCREEN-001`; implementación física en `SHELL-CI-020`; pruebas de package en `SHELL-CI-001` y compatibilidad en `SHELL-CI-005`              |
| validar catálogo, secuencia y cobertura de pantallas               | validadores documentales de pantallas existentes y `SHELL-CI-017`                                                                                |
| validar compatibilidad transversal de consumidores                 | `SHELL-CI-018`                                                                                                                                   |
| migrar referencias legacy y consumidores                           | `PROC-SCREEN-026`; `SHELL-MIG-001`, `SHELL-MIG-003`, `SHELL-MIG-007` y `SHELL-MIG-008`                                                           |
| validar pantallas con operación real                               | `UX-QA-020`; readiness/piloto/hypercare/cierre en `SHELL-CI-021`, `SHELL-CI-022`, `SHELL-CI-023` y `SHELL-CI-024`                                |

Ninguno de esos trabajos físicos se inicia en `SHELL-CON-011`.

---

#### 22. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** **0**
**Requisitos modificados:** **0**

**Justificación:** `SHELL-CON-011` no crea identidades de pantalla, reglas de asignación, semántica de ciclo de vida, comportamiento de autorización, vínculos nuevos de aplicación/proceso/paso ni comportamiento físico. Centraliza una proyección documental de un contrato ya protegido por `TREQ-UX-481` a `TREQ-UX-508`, por los requisitos derivados de `PROC-SCREEN-002` para catálogo y aplicación, y por los requisitos posteriores que protegen los vínculos con procesos y pasos. La cobertura compartida de fuente única, compatibilidad y validación documental ya existe en el dominio SHELL. Crear un requisito equivalente duplicaría cobertura sin introducir una regla ejecutable nueva.

El Registro Canónico de Requisitos de Prueba permanece sin cambios.

---

#### 23. Decisiones vinculantes

1. `ScreenId` utiliza el namespace `VSCREEN-*` con patrón contractual `^VSCREEN-[0-9]{4,}$`.
2. El conjunto vigente contiene exactamente 177 identidades: `VSCREEN-0001` a `VSCREEN-0177`.
3. Las 177 identidades de la matriz son únicas y permanecen `CANONICAL`.
4. Existen cero faltantes y cero duplicados en el conjunto vigente.
5. `VSCREEN-0000` no pertenece al conjunto asignado.
6. `VSCREEN-0178` no pertenece al conjunto vigente y no se asigna en esta tarea.
7. Cumplir el patrón sintáctico no demuestra pertenencia al catálogo.
8. Los identificadores asignados no se reutilizan.
9. El número no codifica aplicación, proceso, paso, ruta, módulo, rol, sede, dispositivo, versión ni entorno.
10. Nombres, rutas, slugs, archivos, componentes y aliases no sustituyen `ScreenId`.
11. La distribución vigente por aplicación suma exactamente 177 y `aura` conserva cero pantallas.
12. Los rangos numéricos no pertenecen a una aplicación concreta.
13. El vínculo con proceso no cambia `ScreenId`.
14. El vínculo con paso no cambia `ScreenId`.
15. Las 177 pantallas conservan cobertura de proceso y paso aprobada por sus tareas propietarias.
16. `VSCREEN-0176` y `VSCREEN-0177` conservan las separaciones funcionales aprobadas sin eliminar `VSCREEN-0135` ni `VSCREEN-0144`.
17. La fuente semántica de identidad permanece en el contrato y catálogo de `PROC-SCREEN-*`.
18. La proyección compartida queda bajo `@vento/contracts/screens`.
19. `@vento/contracts/screens` no se materializa ni publica en esta tarea.
20. `SCREEN_IDS` y `ScreenId` son proyecciones derivadas, no fuentes editables.
21. Entradas externas requieren validación de sintaxis y pertenencia.
22. Un `ScreenId` reconocido no demuestra visibilidad, permiso, implementación ni disponibilidad.
23. No se modifica código, Supabase, migraciones, datos, package físico, rutas ni consumidores.
24. No se crean ni modifican requisitos `TREQ-*`.
25. `SHELL-CON-012` permanece exclusivamente reservada.

---

#### 24. Criterios de aceptación

`SHELL-CON-011` queda documentalmente completa porque:

- materializa una decisión explícita para las 177 identidades vigentes;
- concilia 177 esperadas, 177 materializadas, 177 únicas, cero faltantes y cero duplicados;
- conserva `VSCREEN-0001..VSCREEN-0177` sin altas, bajas ni renumeración;
- conserva las 177 identidades en estado `CANONICAL`;
- preserva el patrón de cuatro o más dígitos y la validación adicional de pertenencia;
- mantiene el identificador opaco y global;
- separa `ScreenId` de ruta, componente, aplicación, proceso, paso, permiso e implementación;
- conserva la distribución exacta por aplicación sin convertir rangos numéricos en namespaces locales;
- conserva los vínculos aprobados de las 177 pantallas con procesos y pasos sin modificar identidad;
- conserva las separaciones de `VSCREEN-0176` y `VSCREEN-0177` y las identidades históricas relacionadas;
- define `@vento/contracts/screens` como superficie lógica propietaria de la proyección compartida;
- define `SCREEN_IDS` y `ScreenId` como salidas derivadas de la fuente canónica;
- exige validación runtime de sintaxis y membresía;
- conserva el ciclo de vida, no reutilización y trazabilidad del contrato propietario;
- no crea código, package, release, migración, Supabase, datos ni cambios en consumidores;
- reutiliza requisitos vigentes y genera cero cambios `TREQ-*`;
- deja `SHELL-CON-012` como única continuidad reservada.

---

#### 25. Continuidad canónica

##### ÚLTIMA TAREA APROBADA

SHELL-CON-010 — Centralizar estados de procesos

##### TAREA ACTUAL APROBADA

SHELL-CON-011 — Centralizar identificadores de pantallas

##### SIGUIENTE TAREA RESERVADA

SHELL-CON-012 — Crear contrato de acciones funcionales


### ✅ SHELL-CON-012 — Crear contrato de acciones funcionales

**Estado:** APROBADA

**Tarea anterior:** `SHELL-CON-011 — Centralizar identificadores de pantallas` — APROBADA

**Tarea siguiente:** `SHELL-CON-013 — Crear contrato de eventos empresariales` — NO INICIADA

**Tipo de tarea:** Documental

**Bloque:** H — Fundación compartida

**Repositorio propietario:** `vento-shell`

**Estado fisico:** `CONTRATO_DE_ACCIONES_FUNCIONALES_DEFINIDO_NO_MATERIALIZADO`

**Cambios fisicos autorizados:** ninguno

**Requisitos TREQ creados o modificados:** 0

---

#### 1. Propósito

Definir el contrato compartido y estable de identidad para las acciones funcionales ya aprobadas en la arquitectura de pantallas, de forma que todos los consumidores de Vento OS puedan referirse a una misma accion sin copiar catalogos locales ni convertir permisos, eventos, endpoints o componentes de interfaz en identidades equivalentes.

El contrato centraliza el inventario materializado por `PROC-SCREEN-014` y `PROC-SCREEN-015`; no crea acciones nuevas, no cambia su semantica y no habilita ejecucion.

```text
SCREEN_ID + CLASE_DE_ACCION + ORDINAL_APROBADO
        =
FUNCTIONAL_ACTION_ID ESTABLE
```

---

#### 2. Resultado material

- Se centralizan **885/885 identidades funcionales existentes**.
- Se preservan **177 acciones principales** `VSCREEN-0001::PRIMARY` a `VSCREEN-0177::PRIMARY`.
- Se preservan **708 acciones secundarias**, cuatro por cada pantalla vigente: `::SECONDARY:01` a `::SECONDARY:04`.
- Se cubren **177/177 `ScreenId`** vigentes.
- Hay **0 faltantes**, **0 duplicados** y **885 identificadores unicos**.
- Cada pantalla conserva exactamente **5 identidades de accion** en el corte vigente: 1 principal + 4 secundarias.
- Toda identidad queda con decision `CENTRALIZAR_SIN_RENUMERAR`, estado `ESPECIFICADO` y bloqueo `NO_APLICA`.

---

#### 3. Fuentes canonicamente consumidas

La tarea consume y preserva, sin sustituirlas:

- `SHELL-CON-001`, como autoridad del namespace compartido `@vento/contracts`;
- `SHELL-CON-011`, como autoridad compartida de `ScreenId`;
- `PROC-SCREEN-014`, como registro aprobado de las 177 acciones principales;
- `PROC-SCREEN-015`, como registro aprobado de las 708 acciones secundarias;
- el Registro Canonico de Requisitos de Prueba vigente, incluida la cobertura `TREQ-UX-887` a `TREQ-UX-946`;
- la secuencia activa y el protocolo documental vigentes de `vento-shell`.

La precedencia de esas fuentes permanece intacta. Este contrato es una proyeccion compartida de identidades ya aprobadas, no una nueva fuente semantica para redefinir acciones.

---

#### 4. Linea base reconciliada

| Elemento                     | Esperado | Materializado | Faltantes | Duplicados | Resultado    |
| ---------------------------- | -------: | ------------: | --------: | ---------: | ------------ |
| Pantallas vigentes           |      177 |           177 |         0 |          0 | `CONCILIADO` |
| Acciones principales         |      177 |           177 |         0 |          0 | `CONCILIADO` |
| Acciones secundarias         |      708 |           708 |         0 |          0 | `CONCILIADO` |
| Acciones funcionales totales |      885 |           885 |         0 |          0 | `CONCILIADO` |

El registro secundario vigente materializa cuatro acciones por pantalla. La regla de `PROC-SCREEN-015` que admite entre dos y cinco secundarias sigue siendo una regla de evolucion; no autoriza a fabricar `:05` ni a retirar una identidad del corte actual sin el cambio canonico correspondiente.

---

#### 5. Namespace y propiedad

La superficie logica compartida de esta tarea es:

```text
@vento/contracts/actions
```

Su propiedad documental queda en `vento-shell` bajo la autoridad de `@vento/contracts`. Durante esta fase no se crea directorio, archivo de codigo, paquete compilado ni publicacion fisica.

El namespace contiene exclusivamente contratos estaticos de identidad y pertenencia. No contiene autorizacion, llamadas de red, acceso a datos, logica de negocio, mutaciones, telemetria ni componentes de UI.

---

#### 6. Identidad `FunctionalActionId`

Se adopta el nombre contractual `FunctionalActionId` para evitar colision semantica con permisos, eventos empresariales, operaciones tecnicas o acciones de framework.

La gramatica compartida es:

```text
PRIMARY   := VSCREEN-####::PRIMARY
SECONDARY := VSCREEN-####::SECONDARY:NN
```

Expresion estructural:

```text
^VSCREEN-[0-9]{4,}::(?:PRIMARY|SECONDARY:[0-9]{2})$
```

La coincidencia con la expresion no concede pertenencia. Un valor solo es `FunctionalActionId` vigente si existe en el conjunto canonico materializado. Por ejemplo, `VSCREEN-0001::SECONDARY:05` tiene forma estructural compatible, pero **no pertenece** al inventario vigente.

---

#### 7. Tipos y metadatos contractuales

El contrato conceptual compartido reconoce:

```text
FunctionalActionId
FunctionalActionKind = PRIMARY | SECONDARY
FunctionalActionSource = PROC-SCREEN-014 | PROC-SCREEN-015
```

Cada identidad debe poder resolver de manera determinista, como minimo:

- su `FunctionalActionId`;
- su `ScreenId` propietario;
- su clase `PRIMARY` o `SECONDARY`;
- su fuente documental `PROC-SCREEN-014` o `PROC-SCREEN-015`;
- para una secundaria, su ordinal aprobado.

La familia, efecto, clase secundaria, relacion, disponibilidad, ubicacion y confirmacion continuan gobernados por los registros propietarios de E2. El contrato compartido puede proyectarlos en una implementacion posterior, pero no los redefine en esta tarea.

---

#### 8. Superficie conceptual compartida

Una futura materializacion tecnica del contrato debera poder representar, sin cambiar estas decisiones, las siguientes capacidades estaticas:

- conjunto completo de `FunctionalActionId`;
- subconjunto de acciones principales;
- subconjunto de acciones secundarias;
- prueba de pertenencia;
- asercion de identidad valida;
- resolucion de `ScreenId`;
- resolucion de `FunctionalActionKind`;
- resolucion de fuente documental;
- resolucion del ordinal secundario cuando aplique.

Los nombres concretos de archivos, constantes, funciones, tipos de lenguaje y estrategia de generacion fisica quedan fuera de esta fase documental y no se consideran materializados.

---

#### 9. Reglas de las acciones principales

1. Cada `ScreenId` vigente conserva exactamente una identidad `::PRIMARY`.
2. La accion principal representa la intencion dominante aprobada de la pantalla; no es un boton concreto ni una ruta tecnica.
3. Su identidad no cambia por renombrar etiqueta, componente, endpoint o presentacion visual mientras la semantica canonica permanezca.
4. Cambiar materialmente la intencion principal exige primero la decision canonica propietaria correspondiente; el contrato compartido nunca renumera unilateralmente.
5. Las **22 familias primarias** y las **11 clases de efecto** aprobadas se preservan sin crear vocabulario paralelo.
6. La accion principal no concede permiso, no demuestra autorizacion y no implica que una transicion de proceso sea valida.

---

#### 10. Reglas de las acciones secundarias

1. Cada identidad secundaria pertenece a exactamente un `ScreenId` y a su accion principal aprobada.
2. El corte vigente contiene exactamente cuatro ordinales por pantalla: `01`, `02`, `03` y `04`.
3. Los ordinales son parte de la identidad y no se compactan, reciclan ni renumeran por conveniencia tecnica.
4. Las **11 clases**, **10 relaciones con la principal** y **6 ubicaciones visuales** aprobadas permanecen gobernadas por `PROC-SCREEN-015`.
5. Una secundaria permanece subordinada a la principal y no puede adquirir por este contrato autoridad superior, permiso o efecto adicional.
6. La politica general de dos a cinco secundarias solo opera mediante cambios canonicos futuros; el conjunto compartido actual permanece en 708.

---

#### 11. Matriz completa de identidades

| ScreenId       | Principal               | Secundaria 01                | Secundaria 02                | Secundaria 03                | Secundaria 04                | Total | Decision                    | Estado         | Bloqueo     |
| -------------- | ----------------------- | ---------------------------- | ---------------------------- | ---------------------------- | ---------------------------- | ----: | --------------------------- | -------------- | ----------- |
| `VSCREEN-0001` | `VSCREEN-0001::PRIMARY` | `VSCREEN-0001::SECONDARY:01` | `VSCREEN-0001::SECONDARY:02` | `VSCREEN-0001::SECONDARY:03` | `VSCREEN-0001::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0002` | `VSCREEN-0002::PRIMARY` | `VSCREEN-0002::SECONDARY:01` | `VSCREEN-0002::SECONDARY:02` | `VSCREEN-0002::SECONDARY:03` | `VSCREEN-0002::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0003` | `VSCREEN-0003::PRIMARY` | `VSCREEN-0003::SECONDARY:01` | `VSCREEN-0003::SECONDARY:02` | `VSCREEN-0003::SECONDARY:03` | `VSCREEN-0003::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0004` | `VSCREEN-0004::PRIMARY` | `VSCREEN-0004::SECONDARY:01` | `VSCREEN-0004::SECONDARY:02` | `VSCREEN-0004::SECONDARY:03` | `VSCREEN-0004::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0005` | `VSCREEN-0005::PRIMARY` | `VSCREEN-0005::SECONDARY:01` | `VSCREEN-0005::SECONDARY:02` | `VSCREEN-0005::SECONDARY:03` | `VSCREEN-0005::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0006` | `VSCREEN-0006::PRIMARY` | `VSCREEN-0006::SECONDARY:01` | `VSCREEN-0006::SECONDARY:02` | `VSCREEN-0006::SECONDARY:03` | `VSCREEN-0006::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0007` | `VSCREEN-0007::PRIMARY` | `VSCREEN-0007::SECONDARY:01` | `VSCREEN-0007::SECONDARY:02` | `VSCREEN-0007::SECONDARY:03` | `VSCREEN-0007::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0008` | `VSCREEN-0008::PRIMARY` | `VSCREEN-0008::SECONDARY:01` | `VSCREEN-0008::SECONDARY:02` | `VSCREEN-0008::SECONDARY:03` | `VSCREEN-0008::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0009` | `VSCREEN-0009::PRIMARY` | `VSCREEN-0009::SECONDARY:01` | `VSCREEN-0009::SECONDARY:02` | `VSCREEN-0009::SECONDARY:03` | `VSCREEN-0009::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0010` | `VSCREEN-0010::PRIMARY` | `VSCREEN-0010::SECONDARY:01` | `VSCREEN-0010::SECONDARY:02` | `VSCREEN-0010::SECONDARY:03` | `VSCREEN-0010::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0011` | `VSCREEN-0011::PRIMARY` | `VSCREEN-0011::SECONDARY:01` | `VSCREEN-0011::SECONDARY:02` | `VSCREEN-0011::SECONDARY:03` | `VSCREEN-0011::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0012` | `VSCREEN-0012::PRIMARY` | `VSCREEN-0012::SECONDARY:01` | `VSCREEN-0012::SECONDARY:02` | `VSCREEN-0012::SECONDARY:03` | `VSCREEN-0012::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0013` | `VSCREEN-0013::PRIMARY` | `VSCREEN-0013::SECONDARY:01` | `VSCREEN-0013::SECONDARY:02` | `VSCREEN-0013::SECONDARY:03` | `VSCREEN-0013::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0014` | `VSCREEN-0014::PRIMARY` | `VSCREEN-0014::SECONDARY:01` | `VSCREEN-0014::SECONDARY:02` | `VSCREEN-0014::SECONDARY:03` | `VSCREEN-0014::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0015` | `VSCREEN-0015::PRIMARY` | `VSCREEN-0015::SECONDARY:01` | `VSCREEN-0015::SECONDARY:02` | `VSCREEN-0015::SECONDARY:03` | `VSCREEN-0015::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0016` | `VSCREEN-0016::PRIMARY` | `VSCREEN-0016::SECONDARY:01` | `VSCREEN-0016::SECONDARY:02` | `VSCREEN-0016::SECONDARY:03` | `VSCREEN-0016::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0017` | `VSCREEN-0017::PRIMARY` | `VSCREEN-0017::SECONDARY:01` | `VSCREEN-0017::SECONDARY:02` | `VSCREEN-0017::SECONDARY:03` | `VSCREEN-0017::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0018` | `VSCREEN-0018::PRIMARY` | `VSCREEN-0018::SECONDARY:01` | `VSCREEN-0018::SECONDARY:02` | `VSCREEN-0018::SECONDARY:03` | `VSCREEN-0018::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0019` | `VSCREEN-0019::PRIMARY` | `VSCREEN-0019::SECONDARY:01` | `VSCREEN-0019::SECONDARY:02` | `VSCREEN-0019::SECONDARY:03` | `VSCREEN-0019::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0020` | `VSCREEN-0020::PRIMARY` | `VSCREEN-0020::SECONDARY:01` | `VSCREEN-0020::SECONDARY:02` | `VSCREEN-0020::SECONDARY:03` | `VSCREEN-0020::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0021` | `VSCREEN-0021::PRIMARY` | `VSCREEN-0021::SECONDARY:01` | `VSCREEN-0021::SECONDARY:02` | `VSCREEN-0021::SECONDARY:03` | `VSCREEN-0021::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0022` | `VSCREEN-0022::PRIMARY` | `VSCREEN-0022::SECONDARY:01` | `VSCREEN-0022::SECONDARY:02` | `VSCREEN-0022::SECONDARY:03` | `VSCREEN-0022::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0023` | `VSCREEN-0023::PRIMARY` | `VSCREEN-0023::SECONDARY:01` | `VSCREEN-0023::SECONDARY:02` | `VSCREEN-0023::SECONDARY:03` | `VSCREEN-0023::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0024` | `VSCREEN-0024::PRIMARY` | `VSCREEN-0024::SECONDARY:01` | `VSCREEN-0024::SECONDARY:02` | `VSCREEN-0024::SECONDARY:03` | `VSCREEN-0024::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0025` | `VSCREEN-0025::PRIMARY` | `VSCREEN-0025::SECONDARY:01` | `VSCREEN-0025::SECONDARY:02` | `VSCREEN-0025::SECONDARY:03` | `VSCREEN-0025::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0026` | `VSCREEN-0026::PRIMARY` | `VSCREEN-0026::SECONDARY:01` | `VSCREEN-0026::SECONDARY:02` | `VSCREEN-0026::SECONDARY:03` | `VSCREEN-0026::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0027` | `VSCREEN-0027::PRIMARY` | `VSCREEN-0027::SECONDARY:01` | `VSCREEN-0027::SECONDARY:02` | `VSCREEN-0027::SECONDARY:03` | `VSCREEN-0027::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0028` | `VSCREEN-0028::PRIMARY` | `VSCREEN-0028::SECONDARY:01` | `VSCREEN-0028::SECONDARY:02` | `VSCREEN-0028::SECONDARY:03` | `VSCREEN-0028::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0029` | `VSCREEN-0029::PRIMARY` | `VSCREEN-0029::SECONDARY:01` | `VSCREEN-0029::SECONDARY:02` | `VSCREEN-0029::SECONDARY:03` | `VSCREEN-0029::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0030` | `VSCREEN-0030::PRIMARY` | `VSCREEN-0030::SECONDARY:01` | `VSCREEN-0030::SECONDARY:02` | `VSCREEN-0030::SECONDARY:03` | `VSCREEN-0030::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0031` | `VSCREEN-0031::PRIMARY` | `VSCREEN-0031::SECONDARY:01` | `VSCREEN-0031::SECONDARY:02` | `VSCREEN-0031::SECONDARY:03` | `VSCREEN-0031::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0032` | `VSCREEN-0032::PRIMARY` | `VSCREEN-0032::SECONDARY:01` | `VSCREEN-0032::SECONDARY:02` | `VSCREEN-0032::SECONDARY:03` | `VSCREEN-0032::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0033` | `VSCREEN-0033::PRIMARY` | `VSCREEN-0033::SECONDARY:01` | `VSCREEN-0033::SECONDARY:02` | `VSCREEN-0033::SECONDARY:03` | `VSCREEN-0033::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0034` | `VSCREEN-0034::PRIMARY` | `VSCREEN-0034::SECONDARY:01` | `VSCREEN-0034::SECONDARY:02` | `VSCREEN-0034::SECONDARY:03` | `VSCREEN-0034::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0035` | `VSCREEN-0035::PRIMARY` | `VSCREEN-0035::SECONDARY:01` | `VSCREEN-0035::SECONDARY:02` | `VSCREEN-0035::SECONDARY:03` | `VSCREEN-0035::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0036` | `VSCREEN-0036::PRIMARY` | `VSCREEN-0036::SECONDARY:01` | `VSCREEN-0036::SECONDARY:02` | `VSCREEN-0036::SECONDARY:03` | `VSCREEN-0036::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0037` | `VSCREEN-0037::PRIMARY` | `VSCREEN-0037::SECONDARY:01` | `VSCREEN-0037::SECONDARY:02` | `VSCREEN-0037::SECONDARY:03` | `VSCREEN-0037::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0038` | `VSCREEN-0038::PRIMARY` | `VSCREEN-0038::SECONDARY:01` | `VSCREEN-0038::SECONDARY:02` | `VSCREEN-0038::SECONDARY:03` | `VSCREEN-0038::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0039` | `VSCREEN-0039::PRIMARY` | `VSCREEN-0039::SECONDARY:01` | `VSCREEN-0039::SECONDARY:02` | `VSCREEN-0039::SECONDARY:03` | `VSCREEN-0039::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0040` | `VSCREEN-0040::PRIMARY` | `VSCREEN-0040::SECONDARY:01` | `VSCREEN-0040::SECONDARY:02` | `VSCREEN-0040::SECONDARY:03` | `VSCREEN-0040::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0041` | `VSCREEN-0041::PRIMARY` | `VSCREEN-0041::SECONDARY:01` | `VSCREEN-0041::SECONDARY:02` | `VSCREEN-0041::SECONDARY:03` | `VSCREEN-0041::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0042` | `VSCREEN-0042::PRIMARY` | `VSCREEN-0042::SECONDARY:01` | `VSCREEN-0042::SECONDARY:02` | `VSCREEN-0042::SECONDARY:03` | `VSCREEN-0042::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0043` | `VSCREEN-0043::PRIMARY` | `VSCREEN-0043::SECONDARY:01` | `VSCREEN-0043::SECONDARY:02` | `VSCREEN-0043::SECONDARY:03` | `VSCREEN-0043::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0044` | `VSCREEN-0044::PRIMARY` | `VSCREEN-0044::SECONDARY:01` | `VSCREEN-0044::SECONDARY:02` | `VSCREEN-0044::SECONDARY:03` | `VSCREEN-0044::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0045` | `VSCREEN-0045::PRIMARY` | `VSCREEN-0045::SECONDARY:01` | `VSCREEN-0045::SECONDARY:02` | `VSCREEN-0045::SECONDARY:03` | `VSCREEN-0045::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0046` | `VSCREEN-0046::PRIMARY` | `VSCREEN-0046::SECONDARY:01` | `VSCREEN-0046::SECONDARY:02` | `VSCREEN-0046::SECONDARY:03` | `VSCREEN-0046::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0047` | `VSCREEN-0047::PRIMARY` | `VSCREEN-0047::SECONDARY:01` | `VSCREEN-0047::SECONDARY:02` | `VSCREEN-0047::SECONDARY:03` | `VSCREEN-0047::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0048` | `VSCREEN-0048::PRIMARY` | `VSCREEN-0048::SECONDARY:01` | `VSCREEN-0048::SECONDARY:02` | `VSCREEN-0048::SECONDARY:03` | `VSCREEN-0048::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0049` | `VSCREEN-0049::PRIMARY` | `VSCREEN-0049::SECONDARY:01` | `VSCREEN-0049::SECONDARY:02` | `VSCREEN-0049::SECONDARY:03` | `VSCREEN-0049::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0050` | `VSCREEN-0050::PRIMARY` | `VSCREEN-0050::SECONDARY:01` | `VSCREEN-0050::SECONDARY:02` | `VSCREEN-0050::SECONDARY:03` | `VSCREEN-0050::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0051` | `VSCREEN-0051::PRIMARY` | `VSCREEN-0051::SECONDARY:01` | `VSCREEN-0051::SECONDARY:02` | `VSCREEN-0051::SECONDARY:03` | `VSCREEN-0051::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0052` | `VSCREEN-0052::PRIMARY` | `VSCREEN-0052::SECONDARY:01` | `VSCREEN-0052::SECONDARY:02` | `VSCREEN-0052::SECONDARY:03` | `VSCREEN-0052::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0053` | `VSCREEN-0053::PRIMARY` | `VSCREEN-0053::SECONDARY:01` | `VSCREEN-0053::SECONDARY:02` | `VSCREEN-0053::SECONDARY:03` | `VSCREEN-0053::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0054` | `VSCREEN-0054::PRIMARY` | `VSCREEN-0054::SECONDARY:01` | `VSCREEN-0054::SECONDARY:02` | `VSCREEN-0054::SECONDARY:03` | `VSCREEN-0054::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0055` | `VSCREEN-0055::PRIMARY` | `VSCREEN-0055::SECONDARY:01` | `VSCREEN-0055::SECONDARY:02` | `VSCREEN-0055::SECONDARY:03` | `VSCREEN-0055::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0056` | `VSCREEN-0056::PRIMARY` | `VSCREEN-0056::SECONDARY:01` | `VSCREEN-0056::SECONDARY:02` | `VSCREEN-0056::SECONDARY:03` | `VSCREEN-0056::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0057` | `VSCREEN-0057::PRIMARY` | `VSCREEN-0057::SECONDARY:01` | `VSCREEN-0057::SECONDARY:02` | `VSCREEN-0057::SECONDARY:03` | `VSCREEN-0057::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0058` | `VSCREEN-0058::PRIMARY` | `VSCREEN-0058::SECONDARY:01` | `VSCREEN-0058::SECONDARY:02` | `VSCREEN-0058::SECONDARY:03` | `VSCREEN-0058::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0059` | `VSCREEN-0059::PRIMARY` | `VSCREEN-0059::SECONDARY:01` | `VSCREEN-0059::SECONDARY:02` | `VSCREEN-0059::SECONDARY:03` | `VSCREEN-0059::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0060` | `VSCREEN-0060::PRIMARY` | `VSCREEN-0060::SECONDARY:01` | `VSCREEN-0060::SECONDARY:02` | `VSCREEN-0060::SECONDARY:03` | `VSCREEN-0060::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0061` | `VSCREEN-0061::PRIMARY` | `VSCREEN-0061::SECONDARY:01` | `VSCREEN-0061::SECONDARY:02` | `VSCREEN-0061::SECONDARY:03` | `VSCREEN-0061::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0062` | `VSCREEN-0062::PRIMARY` | `VSCREEN-0062::SECONDARY:01` | `VSCREEN-0062::SECONDARY:02` | `VSCREEN-0062::SECONDARY:03` | `VSCREEN-0062::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0063` | `VSCREEN-0063::PRIMARY` | `VSCREEN-0063::SECONDARY:01` | `VSCREEN-0063::SECONDARY:02` | `VSCREEN-0063::SECONDARY:03` | `VSCREEN-0063::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0064` | `VSCREEN-0064::PRIMARY` | `VSCREEN-0064::SECONDARY:01` | `VSCREEN-0064::SECONDARY:02` | `VSCREEN-0064::SECONDARY:03` | `VSCREEN-0064::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0065` | `VSCREEN-0065::PRIMARY` | `VSCREEN-0065::SECONDARY:01` | `VSCREEN-0065::SECONDARY:02` | `VSCREEN-0065::SECONDARY:03` | `VSCREEN-0065::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0066` | `VSCREEN-0066::PRIMARY` | `VSCREEN-0066::SECONDARY:01` | `VSCREEN-0066::SECONDARY:02` | `VSCREEN-0066::SECONDARY:03` | `VSCREEN-0066::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0067` | `VSCREEN-0067::PRIMARY` | `VSCREEN-0067::SECONDARY:01` | `VSCREEN-0067::SECONDARY:02` | `VSCREEN-0067::SECONDARY:03` | `VSCREEN-0067::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0068` | `VSCREEN-0068::PRIMARY` | `VSCREEN-0068::SECONDARY:01` | `VSCREEN-0068::SECONDARY:02` | `VSCREEN-0068::SECONDARY:03` | `VSCREEN-0068::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0069` | `VSCREEN-0069::PRIMARY` | `VSCREEN-0069::SECONDARY:01` | `VSCREEN-0069::SECONDARY:02` | `VSCREEN-0069::SECONDARY:03` | `VSCREEN-0069::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0070` | `VSCREEN-0070::PRIMARY` | `VSCREEN-0070::SECONDARY:01` | `VSCREEN-0070::SECONDARY:02` | `VSCREEN-0070::SECONDARY:03` | `VSCREEN-0070::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0071` | `VSCREEN-0071::PRIMARY` | `VSCREEN-0071::SECONDARY:01` | `VSCREEN-0071::SECONDARY:02` | `VSCREEN-0071::SECONDARY:03` | `VSCREEN-0071::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0072` | `VSCREEN-0072::PRIMARY` | `VSCREEN-0072::SECONDARY:01` | `VSCREEN-0072::SECONDARY:02` | `VSCREEN-0072::SECONDARY:03` | `VSCREEN-0072::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0073` | `VSCREEN-0073::PRIMARY` | `VSCREEN-0073::SECONDARY:01` | `VSCREEN-0073::SECONDARY:02` | `VSCREEN-0073::SECONDARY:03` | `VSCREEN-0073::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0074` | `VSCREEN-0074::PRIMARY` | `VSCREEN-0074::SECONDARY:01` | `VSCREEN-0074::SECONDARY:02` | `VSCREEN-0074::SECONDARY:03` | `VSCREEN-0074::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0075` | `VSCREEN-0075::PRIMARY` | `VSCREEN-0075::SECONDARY:01` | `VSCREEN-0075::SECONDARY:02` | `VSCREEN-0075::SECONDARY:03` | `VSCREEN-0075::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0076` | `VSCREEN-0076::PRIMARY` | `VSCREEN-0076::SECONDARY:01` | `VSCREEN-0076::SECONDARY:02` | `VSCREEN-0076::SECONDARY:03` | `VSCREEN-0076::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0077` | `VSCREEN-0077::PRIMARY` | `VSCREEN-0077::SECONDARY:01` | `VSCREEN-0077::SECONDARY:02` | `VSCREEN-0077::SECONDARY:03` | `VSCREEN-0077::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0078` | `VSCREEN-0078::PRIMARY` | `VSCREEN-0078::SECONDARY:01` | `VSCREEN-0078::SECONDARY:02` | `VSCREEN-0078::SECONDARY:03` | `VSCREEN-0078::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0079` | `VSCREEN-0079::PRIMARY` | `VSCREEN-0079::SECONDARY:01` | `VSCREEN-0079::SECONDARY:02` | `VSCREEN-0079::SECONDARY:03` | `VSCREEN-0079::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0080` | `VSCREEN-0080::PRIMARY` | `VSCREEN-0080::SECONDARY:01` | `VSCREEN-0080::SECONDARY:02` | `VSCREEN-0080::SECONDARY:03` | `VSCREEN-0080::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0081` | `VSCREEN-0081::PRIMARY` | `VSCREEN-0081::SECONDARY:01` | `VSCREEN-0081::SECONDARY:02` | `VSCREEN-0081::SECONDARY:03` | `VSCREEN-0081::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0082` | `VSCREEN-0082::PRIMARY` | `VSCREEN-0082::SECONDARY:01` | `VSCREEN-0082::SECONDARY:02` | `VSCREEN-0082::SECONDARY:03` | `VSCREEN-0082::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0083` | `VSCREEN-0083::PRIMARY` | `VSCREEN-0083::SECONDARY:01` | `VSCREEN-0083::SECONDARY:02` | `VSCREEN-0083::SECONDARY:03` | `VSCREEN-0083::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0084` | `VSCREEN-0084::PRIMARY` | `VSCREEN-0084::SECONDARY:01` | `VSCREEN-0084::SECONDARY:02` | `VSCREEN-0084::SECONDARY:03` | `VSCREEN-0084::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0085` | `VSCREEN-0085::PRIMARY` | `VSCREEN-0085::SECONDARY:01` | `VSCREEN-0085::SECONDARY:02` | `VSCREEN-0085::SECONDARY:03` | `VSCREEN-0085::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0086` | `VSCREEN-0086::PRIMARY` | `VSCREEN-0086::SECONDARY:01` | `VSCREEN-0086::SECONDARY:02` | `VSCREEN-0086::SECONDARY:03` | `VSCREEN-0086::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0087` | `VSCREEN-0087::PRIMARY` | `VSCREEN-0087::SECONDARY:01` | `VSCREEN-0087::SECONDARY:02` | `VSCREEN-0087::SECONDARY:03` | `VSCREEN-0087::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0088` | `VSCREEN-0088::PRIMARY` | `VSCREEN-0088::SECONDARY:01` | `VSCREEN-0088::SECONDARY:02` | `VSCREEN-0088::SECONDARY:03` | `VSCREEN-0088::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0089` | `VSCREEN-0089::PRIMARY` | `VSCREEN-0089::SECONDARY:01` | `VSCREEN-0089::SECONDARY:02` | `VSCREEN-0089::SECONDARY:03` | `VSCREEN-0089::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0090` | `VSCREEN-0090::PRIMARY` | `VSCREEN-0090::SECONDARY:01` | `VSCREEN-0090::SECONDARY:02` | `VSCREEN-0090::SECONDARY:03` | `VSCREEN-0090::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0091` | `VSCREEN-0091::PRIMARY` | `VSCREEN-0091::SECONDARY:01` | `VSCREEN-0091::SECONDARY:02` | `VSCREEN-0091::SECONDARY:03` | `VSCREEN-0091::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0092` | `VSCREEN-0092::PRIMARY` | `VSCREEN-0092::SECONDARY:01` | `VSCREEN-0092::SECONDARY:02` | `VSCREEN-0092::SECONDARY:03` | `VSCREEN-0092::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0093` | `VSCREEN-0093::PRIMARY` | `VSCREEN-0093::SECONDARY:01` | `VSCREEN-0093::SECONDARY:02` | `VSCREEN-0093::SECONDARY:03` | `VSCREEN-0093::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0094` | `VSCREEN-0094::PRIMARY` | `VSCREEN-0094::SECONDARY:01` | `VSCREEN-0094::SECONDARY:02` | `VSCREEN-0094::SECONDARY:03` | `VSCREEN-0094::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0095` | `VSCREEN-0095::PRIMARY` | `VSCREEN-0095::SECONDARY:01` | `VSCREEN-0095::SECONDARY:02` | `VSCREEN-0095::SECONDARY:03` | `VSCREEN-0095::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0096` | `VSCREEN-0096::PRIMARY` | `VSCREEN-0096::SECONDARY:01` | `VSCREEN-0096::SECONDARY:02` | `VSCREEN-0096::SECONDARY:03` | `VSCREEN-0096::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0097` | `VSCREEN-0097::PRIMARY` | `VSCREEN-0097::SECONDARY:01` | `VSCREEN-0097::SECONDARY:02` | `VSCREEN-0097::SECONDARY:03` | `VSCREEN-0097::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0098` | `VSCREEN-0098::PRIMARY` | `VSCREEN-0098::SECONDARY:01` | `VSCREEN-0098::SECONDARY:02` | `VSCREEN-0098::SECONDARY:03` | `VSCREEN-0098::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0099` | `VSCREEN-0099::PRIMARY` | `VSCREEN-0099::SECONDARY:01` | `VSCREEN-0099::SECONDARY:02` | `VSCREEN-0099::SECONDARY:03` | `VSCREEN-0099::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0100` | `VSCREEN-0100::PRIMARY` | `VSCREEN-0100::SECONDARY:01` | `VSCREEN-0100::SECONDARY:02` | `VSCREEN-0100::SECONDARY:03` | `VSCREEN-0100::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0101` | `VSCREEN-0101::PRIMARY` | `VSCREEN-0101::SECONDARY:01` | `VSCREEN-0101::SECONDARY:02` | `VSCREEN-0101::SECONDARY:03` | `VSCREEN-0101::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0102` | `VSCREEN-0102::PRIMARY` | `VSCREEN-0102::SECONDARY:01` | `VSCREEN-0102::SECONDARY:02` | `VSCREEN-0102::SECONDARY:03` | `VSCREEN-0102::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0103` | `VSCREEN-0103::PRIMARY` | `VSCREEN-0103::SECONDARY:01` | `VSCREEN-0103::SECONDARY:02` | `VSCREEN-0103::SECONDARY:03` | `VSCREEN-0103::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0104` | `VSCREEN-0104::PRIMARY` | `VSCREEN-0104::SECONDARY:01` | `VSCREEN-0104::SECONDARY:02` | `VSCREEN-0104::SECONDARY:03` | `VSCREEN-0104::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0105` | `VSCREEN-0105::PRIMARY` | `VSCREEN-0105::SECONDARY:01` | `VSCREEN-0105::SECONDARY:02` | `VSCREEN-0105::SECONDARY:03` | `VSCREEN-0105::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0106` | `VSCREEN-0106::PRIMARY` | `VSCREEN-0106::SECONDARY:01` | `VSCREEN-0106::SECONDARY:02` | `VSCREEN-0106::SECONDARY:03` | `VSCREEN-0106::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0107` | `VSCREEN-0107::PRIMARY` | `VSCREEN-0107::SECONDARY:01` | `VSCREEN-0107::SECONDARY:02` | `VSCREEN-0107::SECONDARY:03` | `VSCREEN-0107::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0108` | `VSCREEN-0108::PRIMARY` | `VSCREEN-0108::SECONDARY:01` | `VSCREEN-0108::SECONDARY:02` | `VSCREEN-0108::SECONDARY:03` | `VSCREEN-0108::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0109` | `VSCREEN-0109::PRIMARY` | `VSCREEN-0109::SECONDARY:01` | `VSCREEN-0109::SECONDARY:02` | `VSCREEN-0109::SECONDARY:03` | `VSCREEN-0109::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0110` | `VSCREEN-0110::PRIMARY` | `VSCREEN-0110::SECONDARY:01` | `VSCREEN-0110::SECONDARY:02` | `VSCREEN-0110::SECONDARY:03` | `VSCREEN-0110::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0111` | `VSCREEN-0111::PRIMARY` | `VSCREEN-0111::SECONDARY:01` | `VSCREEN-0111::SECONDARY:02` | `VSCREEN-0111::SECONDARY:03` | `VSCREEN-0111::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0112` | `VSCREEN-0112::PRIMARY` | `VSCREEN-0112::SECONDARY:01` | `VSCREEN-0112::SECONDARY:02` | `VSCREEN-0112::SECONDARY:03` | `VSCREEN-0112::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0113` | `VSCREEN-0113::PRIMARY` | `VSCREEN-0113::SECONDARY:01` | `VSCREEN-0113::SECONDARY:02` | `VSCREEN-0113::SECONDARY:03` | `VSCREEN-0113::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0114` | `VSCREEN-0114::PRIMARY` | `VSCREEN-0114::SECONDARY:01` | `VSCREEN-0114::SECONDARY:02` | `VSCREEN-0114::SECONDARY:03` | `VSCREEN-0114::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0115` | `VSCREEN-0115::PRIMARY` | `VSCREEN-0115::SECONDARY:01` | `VSCREEN-0115::SECONDARY:02` | `VSCREEN-0115::SECONDARY:03` | `VSCREEN-0115::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0116` | `VSCREEN-0116::PRIMARY` | `VSCREEN-0116::SECONDARY:01` | `VSCREEN-0116::SECONDARY:02` | `VSCREEN-0116::SECONDARY:03` | `VSCREEN-0116::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0117` | `VSCREEN-0117::PRIMARY` | `VSCREEN-0117::SECONDARY:01` | `VSCREEN-0117::SECONDARY:02` | `VSCREEN-0117::SECONDARY:03` | `VSCREEN-0117::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0118` | `VSCREEN-0118::PRIMARY` | `VSCREEN-0118::SECONDARY:01` | `VSCREEN-0118::SECONDARY:02` | `VSCREEN-0118::SECONDARY:03` | `VSCREEN-0118::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0119` | `VSCREEN-0119::PRIMARY` | `VSCREEN-0119::SECONDARY:01` | `VSCREEN-0119::SECONDARY:02` | `VSCREEN-0119::SECONDARY:03` | `VSCREEN-0119::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0120` | `VSCREEN-0120::PRIMARY` | `VSCREEN-0120::SECONDARY:01` | `VSCREEN-0120::SECONDARY:02` | `VSCREEN-0120::SECONDARY:03` | `VSCREEN-0120::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0121` | `VSCREEN-0121::PRIMARY` | `VSCREEN-0121::SECONDARY:01` | `VSCREEN-0121::SECONDARY:02` | `VSCREEN-0121::SECONDARY:03` | `VSCREEN-0121::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0122` | `VSCREEN-0122::PRIMARY` | `VSCREEN-0122::SECONDARY:01` | `VSCREEN-0122::SECONDARY:02` | `VSCREEN-0122::SECONDARY:03` | `VSCREEN-0122::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0123` | `VSCREEN-0123::PRIMARY` | `VSCREEN-0123::SECONDARY:01` | `VSCREEN-0123::SECONDARY:02` | `VSCREEN-0123::SECONDARY:03` | `VSCREEN-0123::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0124` | `VSCREEN-0124::PRIMARY` | `VSCREEN-0124::SECONDARY:01` | `VSCREEN-0124::SECONDARY:02` | `VSCREEN-0124::SECONDARY:03` | `VSCREEN-0124::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0125` | `VSCREEN-0125::PRIMARY` | `VSCREEN-0125::SECONDARY:01` | `VSCREEN-0125::SECONDARY:02` | `VSCREEN-0125::SECONDARY:03` | `VSCREEN-0125::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0126` | `VSCREEN-0126::PRIMARY` | `VSCREEN-0126::SECONDARY:01` | `VSCREEN-0126::SECONDARY:02` | `VSCREEN-0126::SECONDARY:03` | `VSCREEN-0126::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0127` | `VSCREEN-0127::PRIMARY` | `VSCREEN-0127::SECONDARY:01` | `VSCREEN-0127::SECONDARY:02` | `VSCREEN-0127::SECONDARY:03` | `VSCREEN-0127::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0128` | `VSCREEN-0128::PRIMARY` | `VSCREEN-0128::SECONDARY:01` | `VSCREEN-0128::SECONDARY:02` | `VSCREEN-0128::SECONDARY:03` | `VSCREEN-0128::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0129` | `VSCREEN-0129::PRIMARY` | `VSCREEN-0129::SECONDARY:01` | `VSCREEN-0129::SECONDARY:02` | `VSCREEN-0129::SECONDARY:03` | `VSCREEN-0129::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0130` | `VSCREEN-0130::PRIMARY` | `VSCREEN-0130::SECONDARY:01` | `VSCREEN-0130::SECONDARY:02` | `VSCREEN-0130::SECONDARY:03` | `VSCREEN-0130::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0131` | `VSCREEN-0131::PRIMARY` | `VSCREEN-0131::SECONDARY:01` | `VSCREEN-0131::SECONDARY:02` | `VSCREEN-0131::SECONDARY:03` | `VSCREEN-0131::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0132` | `VSCREEN-0132::PRIMARY` | `VSCREEN-0132::SECONDARY:01` | `VSCREEN-0132::SECONDARY:02` | `VSCREEN-0132::SECONDARY:03` | `VSCREEN-0132::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0133` | `VSCREEN-0133::PRIMARY` | `VSCREEN-0133::SECONDARY:01` | `VSCREEN-0133::SECONDARY:02` | `VSCREEN-0133::SECONDARY:03` | `VSCREEN-0133::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0134` | `VSCREEN-0134::PRIMARY` | `VSCREEN-0134::SECONDARY:01` | `VSCREEN-0134::SECONDARY:02` | `VSCREEN-0134::SECONDARY:03` | `VSCREEN-0134::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0135` | `VSCREEN-0135::PRIMARY` | `VSCREEN-0135::SECONDARY:01` | `VSCREEN-0135::SECONDARY:02` | `VSCREEN-0135::SECONDARY:03` | `VSCREEN-0135::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0136` | `VSCREEN-0136::PRIMARY` | `VSCREEN-0136::SECONDARY:01` | `VSCREEN-0136::SECONDARY:02` | `VSCREEN-0136::SECONDARY:03` | `VSCREEN-0136::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0137` | `VSCREEN-0137::PRIMARY` | `VSCREEN-0137::SECONDARY:01` | `VSCREEN-0137::SECONDARY:02` | `VSCREEN-0137::SECONDARY:03` | `VSCREEN-0137::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0138` | `VSCREEN-0138::PRIMARY` | `VSCREEN-0138::SECONDARY:01` | `VSCREEN-0138::SECONDARY:02` | `VSCREEN-0138::SECONDARY:03` | `VSCREEN-0138::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0139` | `VSCREEN-0139::PRIMARY` | `VSCREEN-0139::SECONDARY:01` | `VSCREEN-0139::SECONDARY:02` | `VSCREEN-0139::SECONDARY:03` | `VSCREEN-0139::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0140` | `VSCREEN-0140::PRIMARY` | `VSCREEN-0140::SECONDARY:01` | `VSCREEN-0140::SECONDARY:02` | `VSCREEN-0140::SECONDARY:03` | `VSCREEN-0140::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0141` | `VSCREEN-0141::PRIMARY` | `VSCREEN-0141::SECONDARY:01` | `VSCREEN-0141::SECONDARY:02` | `VSCREEN-0141::SECONDARY:03` | `VSCREEN-0141::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0142` | `VSCREEN-0142::PRIMARY` | `VSCREEN-0142::SECONDARY:01` | `VSCREEN-0142::SECONDARY:02` | `VSCREEN-0142::SECONDARY:03` | `VSCREEN-0142::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0143` | `VSCREEN-0143::PRIMARY` | `VSCREEN-0143::SECONDARY:01` | `VSCREEN-0143::SECONDARY:02` | `VSCREEN-0143::SECONDARY:03` | `VSCREEN-0143::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0144` | `VSCREEN-0144::PRIMARY` | `VSCREEN-0144::SECONDARY:01` | `VSCREEN-0144::SECONDARY:02` | `VSCREEN-0144::SECONDARY:03` | `VSCREEN-0144::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0145` | `VSCREEN-0145::PRIMARY` | `VSCREEN-0145::SECONDARY:01` | `VSCREEN-0145::SECONDARY:02` | `VSCREEN-0145::SECONDARY:03` | `VSCREEN-0145::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0146` | `VSCREEN-0146::PRIMARY` | `VSCREEN-0146::SECONDARY:01` | `VSCREEN-0146::SECONDARY:02` | `VSCREEN-0146::SECONDARY:03` | `VSCREEN-0146::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0147` | `VSCREEN-0147::PRIMARY` | `VSCREEN-0147::SECONDARY:01` | `VSCREEN-0147::SECONDARY:02` | `VSCREEN-0147::SECONDARY:03` | `VSCREEN-0147::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0148` | `VSCREEN-0148::PRIMARY` | `VSCREEN-0148::SECONDARY:01` | `VSCREEN-0148::SECONDARY:02` | `VSCREEN-0148::SECONDARY:03` | `VSCREEN-0148::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0149` | `VSCREEN-0149::PRIMARY` | `VSCREEN-0149::SECONDARY:01` | `VSCREEN-0149::SECONDARY:02` | `VSCREEN-0149::SECONDARY:03` | `VSCREEN-0149::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0150` | `VSCREEN-0150::PRIMARY` | `VSCREEN-0150::SECONDARY:01` | `VSCREEN-0150::SECONDARY:02` | `VSCREEN-0150::SECONDARY:03` | `VSCREEN-0150::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0151` | `VSCREEN-0151::PRIMARY` | `VSCREEN-0151::SECONDARY:01` | `VSCREEN-0151::SECONDARY:02` | `VSCREEN-0151::SECONDARY:03` | `VSCREEN-0151::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0152` | `VSCREEN-0152::PRIMARY` | `VSCREEN-0152::SECONDARY:01` | `VSCREEN-0152::SECONDARY:02` | `VSCREEN-0152::SECONDARY:03` | `VSCREEN-0152::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0153` | `VSCREEN-0153::PRIMARY` | `VSCREEN-0153::SECONDARY:01` | `VSCREEN-0153::SECONDARY:02` | `VSCREEN-0153::SECONDARY:03` | `VSCREEN-0153::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0154` | `VSCREEN-0154::PRIMARY` | `VSCREEN-0154::SECONDARY:01` | `VSCREEN-0154::SECONDARY:02` | `VSCREEN-0154::SECONDARY:03` | `VSCREEN-0154::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0155` | `VSCREEN-0155::PRIMARY` | `VSCREEN-0155::SECONDARY:01` | `VSCREEN-0155::SECONDARY:02` | `VSCREEN-0155::SECONDARY:03` | `VSCREEN-0155::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0156` | `VSCREEN-0156::PRIMARY` | `VSCREEN-0156::SECONDARY:01` | `VSCREEN-0156::SECONDARY:02` | `VSCREEN-0156::SECONDARY:03` | `VSCREEN-0156::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0157` | `VSCREEN-0157::PRIMARY` | `VSCREEN-0157::SECONDARY:01` | `VSCREEN-0157::SECONDARY:02` | `VSCREEN-0157::SECONDARY:03` | `VSCREEN-0157::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0158` | `VSCREEN-0158::PRIMARY` | `VSCREEN-0158::SECONDARY:01` | `VSCREEN-0158::SECONDARY:02` | `VSCREEN-0158::SECONDARY:03` | `VSCREEN-0158::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0159` | `VSCREEN-0159::PRIMARY` | `VSCREEN-0159::SECONDARY:01` | `VSCREEN-0159::SECONDARY:02` | `VSCREEN-0159::SECONDARY:03` | `VSCREEN-0159::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0160` | `VSCREEN-0160::PRIMARY` | `VSCREEN-0160::SECONDARY:01` | `VSCREEN-0160::SECONDARY:02` | `VSCREEN-0160::SECONDARY:03` | `VSCREEN-0160::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0161` | `VSCREEN-0161::PRIMARY` | `VSCREEN-0161::SECONDARY:01` | `VSCREEN-0161::SECONDARY:02` | `VSCREEN-0161::SECONDARY:03` | `VSCREEN-0161::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0162` | `VSCREEN-0162::PRIMARY` | `VSCREEN-0162::SECONDARY:01` | `VSCREEN-0162::SECONDARY:02` | `VSCREEN-0162::SECONDARY:03` | `VSCREEN-0162::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0163` | `VSCREEN-0163::PRIMARY` | `VSCREEN-0163::SECONDARY:01` | `VSCREEN-0163::SECONDARY:02` | `VSCREEN-0163::SECONDARY:03` | `VSCREEN-0163::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0164` | `VSCREEN-0164::PRIMARY` | `VSCREEN-0164::SECONDARY:01` | `VSCREEN-0164::SECONDARY:02` | `VSCREEN-0164::SECONDARY:03` | `VSCREEN-0164::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0165` | `VSCREEN-0165::PRIMARY` | `VSCREEN-0165::SECONDARY:01` | `VSCREEN-0165::SECONDARY:02` | `VSCREEN-0165::SECONDARY:03` | `VSCREEN-0165::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0166` | `VSCREEN-0166::PRIMARY` | `VSCREEN-0166::SECONDARY:01` | `VSCREEN-0166::SECONDARY:02` | `VSCREEN-0166::SECONDARY:03` | `VSCREEN-0166::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0167` | `VSCREEN-0167::PRIMARY` | `VSCREEN-0167::SECONDARY:01` | `VSCREEN-0167::SECONDARY:02` | `VSCREEN-0167::SECONDARY:03` | `VSCREEN-0167::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0168` | `VSCREEN-0168::PRIMARY` | `VSCREEN-0168::SECONDARY:01` | `VSCREEN-0168::SECONDARY:02` | `VSCREEN-0168::SECONDARY:03` | `VSCREEN-0168::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0169` | `VSCREEN-0169::PRIMARY` | `VSCREEN-0169::SECONDARY:01` | `VSCREEN-0169::SECONDARY:02` | `VSCREEN-0169::SECONDARY:03` | `VSCREEN-0169::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0170` | `VSCREEN-0170::PRIMARY` | `VSCREEN-0170::SECONDARY:01` | `VSCREEN-0170::SECONDARY:02` | `VSCREEN-0170::SECONDARY:03` | `VSCREEN-0170::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0171` | `VSCREEN-0171::PRIMARY` | `VSCREEN-0171::SECONDARY:01` | `VSCREEN-0171::SECONDARY:02` | `VSCREEN-0171::SECONDARY:03` | `VSCREEN-0171::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0172` | `VSCREEN-0172::PRIMARY` | `VSCREEN-0172::SECONDARY:01` | `VSCREEN-0172::SECONDARY:02` | `VSCREEN-0172::SECONDARY:03` | `VSCREEN-0172::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0173` | `VSCREEN-0173::PRIMARY` | `VSCREEN-0173::SECONDARY:01` | `VSCREEN-0173::SECONDARY:02` | `VSCREEN-0173::SECONDARY:03` | `VSCREEN-0173::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0174` | `VSCREEN-0174::PRIMARY` | `VSCREEN-0174::SECONDARY:01` | `VSCREEN-0174::SECONDARY:02` | `VSCREEN-0174::SECONDARY:03` | `VSCREEN-0174::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0175` | `VSCREEN-0175::PRIMARY` | `VSCREEN-0175::SECONDARY:01` | `VSCREEN-0175::SECONDARY:02` | `VSCREEN-0175::SECONDARY:03` | `VSCREEN-0175::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0176` | `VSCREEN-0176::PRIMARY` | `VSCREEN-0176::SECONDARY:01` | `VSCREEN-0176::SECONDARY:02` | `VSCREEN-0176::SECONDARY:03` | `VSCREEN-0176::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |
| `VSCREEN-0177` | `VSCREEN-0177::PRIMARY` | `VSCREEN-0177::SECONDARY:01` | `VSCREEN-0177::SECONDARY:02` | `VSCREEN-0177::SECONDARY:03` | `VSCREEN-0177::SECONDARY:04` |     5 | `CENTRALIZAR_SIN_RENUMERAR` | `ESPECIFICADO` | `NO_APLICA` |

---

#### 12. Reconciliacion de la matriz

- Filas esperadas: **177**.
- Filas materializadas: **177**.
- `FunctionalActionId` esperados: **885**.
- `FunctionalActionId` materializados: **885**.
- Principales: **177**.
- Secundarias: **708**.
- Identidades repetidas: **0**.
- Pantallas sin principal: **0**.
- Pantallas sin las cuatro secundarias vigentes: **0**.
- Pantallas con identidad adicional no aprobada: **0**.

La matriz es exhaustiva para el corte aprobado consumido por esta tarea.

---

#### 13. Distribuciones heredadas preservadas

##### 13.1 Acciones principales por familia

| Familia                     |   Total |
| --------------------------- | ------: |
| `ENTER_WORKSPACE`           |       2 |
| `AUTHENTICATE_OR_RECOVER`   |       2 |
| `RESOLVE_ACCESS_CONTEXT`    |       1 |
| `ACTIVATE_ACTOR_SESSION`    |       1 |
| `OPEN_PRIORITY_ITEM`        |       9 |
| `MONITOR_AND_INTERVENE`     |       8 |
| `MAINTAIN_MASTER_DATA`      |      11 |
| `PUBLISH_POLICY_OR_VERSION` |       9 |
| `CREATE_OR_UPDATE_CASE`     |      33 |
| `REVIEW_OR_RECOMMEND`       |       2 |
| `DECIDE_OR_APPROVE`         |      16 |
| `CAPTURE_FACT`              |       8 |
| `EXECUTE_OPERATION`         |      22 |
| `CONFIRM_HANDOFF`           |      10 |
| `RECONCILE`                 |       6 |
| `INVESTIGATE`               |       2 |
| `GENERATE_OFFICIAL_OUTPUT`  |       1 |
| `SELF_SERVICE`              |      16 |
| `CUSTOMER_BROWSE_OR_SELECT` |       2 |
| `CUSTOMER_TRANSACTION`      |       9 |
| `COMMUNICATE`               |       3 |
| `IDENTIFY_OR_PRESENT`       |       4 |
| **Total**                   | **177** |

##### 13.2 Acciones principales por efecto

| Efecto                   |   Total |
| ------------------------ | ------: |
| `NAVIGATION_ONLY`        |      18 |
| `READ_ONLY`              |      14 |
| `SESSION_MUTATION`       |       4 |
| `DRAFT_MUTATION`         |       5 |
| `DOMAIN_MUTATION`        |      72 |
| `DECISION_MUTATION`      |      22 |
| `CONFIGURATION_MUTATION` |      15 |
| `FINANCIAL_MUTATION`     |      20 |
| `EXTERNAL_SIDE_EFFECT`   |       3 |
| `COMMUNICATION_MUTATION` |       3 |
| `EVIDENCE_OUTPUT`        |       1 |
| **Total**                | **177** |

##### 13.3 Acciones secundarias por aplicacion

| Aplicacion | Pantallas | Secundarias | Promedio por pantalla |
| ---------- | --------: | ----------: | --------------------: |
| `shell`    |         7 |          28 |                  4.00 |
| `viso`     |        31 |         124 |                  4.00 |
| `anima`    |        14 |          56 |                  4.00 |
| `nexo`     |        37 |         148 |                  4.00 |
| `fogo`     |        15 |          60 |                  4.00 |
| `origo`    |        14 |          56 |                  4.00 |
| `pulso`    |        20 |          80 |                  4.00 |
| `numera`   |        20 |          80 |                  4.00 |
| `pass`     |        19 |          76 |                  4.00 |
| **Total**  |   **177** |     **708** |              **4.00** |

---

#### 14. Separaciones obligatorias

```text
FunctionalActionId != ScreenId
FunctionalActionId != ProcessId
FunctionalActionId != ProcessStateId
FunctionalActionId != PermissionId
FunctionalActionId != BusinessEventId
FunctionalActionId != route_or_slug
FunctionalActionId != component_or_button_id
FunctionalActionId != Server_Action_API_or_RPC
```

Consecuencias:

- conocer una identidad funcional no autoriza a ejecutarla;
- una misma accion puede requerir permisos distintos segun actor, contexto, recurso o estado;
- una operacion tecnica puede implementar una accion sin convertirse en su identidad canonica;
- un evento empresarial puede ser consecuencia de una accion, pero no es la accion misma;
- rutas, botones y componentes pueden cambiar sin renumerar la identidad funcional;
- `SHELL-CON-013` conserva de manera exclusiva la definicion compartida de eventos empresariales.

---

#### 15. Pertenencia y validacion contractual

Una implementacion posterior del contrato debera rechazar al menos:

1. cadenas que no cumplan la gramatica;
2. cadenas gramaticalmente validas que no pertenezcan al conjunto aprobado;
3. una accion cuyo `ScreenId` no exista en el contrato compartido de pantallas;
4. mas de una accion principal para la misma pantalla;
5. ausencia de la principal de una pantalla vigente;
6. duplicados de identidad;
7. huecos o duplicados en los ordinales secundarios del corte materializado;
8. reclasificacion silenciosa entre `PRIMARY` y `SECONDARY`;
9. catalogos locales divergentes de identidades funcionales;
10. inferir autorizacion desde el identificador;
11. mezclar identidades de eventos empresariales con acciones funcionales.

---

#### 16. Evolucion, inmutabilidad y compatibilidad

1. Una identidad publicada no se recicla para otra accion.
2. Renombrar una etiqueta humana no cambia por si solo la identidad.
3. Cambiar UI, componente, ruta o mecanismo tecnico no cambia por si solo la identidad.
4. Retirar una accion exige conservar trazabilidad historica y resolver consumidores antes de eliminarla de una proyeccion vigente.
5. Agregar una secundaria futura exige una identidad aprobada por la fuente propietaria antes de entrar al contrato compartido.
6. Promover una secundaria a principal no se resuelve renombrando el sufijo; requiere la decision canonica propietaria y la reconciliacion de identidad correspondiente.
7. Los consumidores no mantienen listas manuales divergentes; consumen la proyeccion compartida cuando exista materializacion fisica.

---

#### 17. Seguridad y autorizacion

`FunctionalActionId` es una referencia estable, no una credencial ni una concesion. Cualquier ejecucion futura continuara requiriendo la autorizacion efectiva definida por los contratos de identidad, rol, permiso, scope, contexto, recurso, estado y segregacion de funciones.

El cliente no puede usar la mera presencia de un ID para asumir disponibilidad. Las comprobaciones de autorizacion y elegibilidad permanecen del lado confiable correspondiente.

---

#### 18. Estado de materializacion fisica

En esta tarea queda **ESPECIFICADO** el contrato documental de `@vento/contracts/actions`, pero permanece **NO MATERIALIZADO** como paquete o codigo ejecutable.

No se crean ni modifican:

- codigo fuente;
- paquetes;
- tipos generados;
- pruebas de runtime;
- rutas o componentes;
- SQL, migraciones o configuracion Supabase;
- datos operativos;
- integraciones o despliegues.

La materializacion fisica queda asignada a `E5-GATE-008` y `SHELL-CI-020`, con pruebas en `SHELL-CI-001`, build en `SHELL-CI-002`, release en `SHELL-CI-003`, compatibilidad en `SHELL-CI-005` y adopcion de consumidores en `SHELL-CI-006`.

---

#### 19. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Requisitos creados:** 0

**Requisitos modificados:** 0

Justificacion: `SHELL-CON-012` centraliza sin alterar las 885 identidades y reglas ya protegidas por `TREQ-UX-887` a `TREQ-UX-946`. No agrega una accion, efecto, permiso, operacion tecnica, transicion, comportamiento de runtime ni condicion nueva. Crear nuevos TREQ para la misma pertenencia y fronteras duplicaria cobertura ya existente.

---

#### 20. Decisiones aprobadas

1. `FunctionalActionId` es el nombre conceptual de la identidad compartida.
2. `@vento/contracts/actions` es el namespace logico reservado.
3. El conjunto vigente contiene exactamente 885 miembros.
4. Cada uno de los 177 `ScreenId` aporta exactamente una principal y cuatro secundarias en el corte vigente.
5. Los identificadores existentes se centralizan sin renumeracion.
6. Sintaxis y pertenencia son comprobaciones distintas.
7. Los vocabularios semanticos de E2 se preservan y no se duplican como nueva autoridad.
8. La identidad funcional no concede autorizacion ni sustituye permisos.
9. Los eventos empresariales quedan fuera de alcance y reservados a `SHELL-CON-013`.
10. La tarea permanece documental y sin materializacion fisica.

---

#### 21. Criterios de aceptacion

- [x] Se preservan los 177 `ScreenId` vigentes.
- [x] Se materializan las 177 acciones principales existentes.
- [x] Se materializan las 708 acciones secundarias existentes.
- [x] Se materializan 885 identidades unicas en total.
- [x] Cada identidad tiene decision, estado y bloqueo explicitos por fila.
- [x] Se comprueban totales, faltantes y duplicados.
- [x] Se conserva la numeracion existente sin reutilizacion ni renumeracion.
- [x] Se diferencia forma estructural de pertenencia canonica.
- [x] Se preservan familias, efectos, clases y relaciones heredadas.
- [x] Se separan acciones, permisos, pantallas, procesos, eventos y operaciones tecnicas.
- [x] Se define el namespace compartido sin implementarlo fisicamente.
- [x] Se declaran cero cambios TREQ con justificacion concreta.
- [x] No se desarrolla `SHELL-CON-013`.

---

#### 22. Continuidad

**ÚLTIMA TAREA APROBADA:** `SHELL-CON-011 — Centralizar identificadores de pantallas`

**TAREA ACTUAL APROBADA:** `SHELL-CON-012 — Crear contrato de acciones funcionales`

**SIGUIENTE TAREA RESERVADA:** `SHELL-CON-013 — Crear contrato de eventos empresariales`


### ✅ SHELL-CON-013 — Crear contrato de eventos empresariales

**Estado:** APROBADA

**Tarea anterior:** SHELL-CON-012 — Crear contrato de acciones funcionales

**Tarea siguiente:** SHELL-CON-014 — Crear contrato de traspasos entre aplicaciones

**Tipo de tarea:** Documental

**Bloque:** H — Fundación compartida

**Repositorio propietario:** `vento-shell`

**Materialización física:** no realizada

**Cambios físicos autorizados:** ninguno

**Requisitos TREQ creados o modificados:** 0

---

#### 1. Propósito

Definir el contrato compartido y estable de identidad para las definiciones de eventos empresariales ya aprobadas en el catálogo de procesos, de forma que los consumidores de Vento OS puedan referirse a un mismo hecho empresarial sin confundir su identidad estable con una ocurrencia runtime, un comando, una acción funcional, una notificación, una integración, una entrada de auditoría o un detalle de transporte.

La frontera contractual queda:

```text
PROC-CAT-017
→ autoridad semántica de definiciones de eventos empresariales

@vento/contracts/events
→ proyección compartida, tipada y validable de sus identidades estables

consumidores
→ referencian BusinessEventId
→ no inventan, renumeran ni reinterpretan VPROC-####.EVT-###
```

Esta tarea centraliza identidades existentes. No crea hechos empresariales nuevos, no modifica la emisión runtime y no materializa infraestructura de eventos.

---

#### 2. Resultado material

- Se centralizan **395/395 definiciones normales de eventos empresariales**.
- Se cubren **69/69 `ProcessId`** vigentes: `VPROC-0001..VPROC-0069`.
- Se preserva la identidad estable `VPROC-####.EVT-###`.
- Se materializan **395 identidades únicas**, con **0 faltantes** y **0 duplicados**.
- La distribución vigente es: **4 procesos con 4 eventos**, **11 procesos con 5 eventos** y **54 procesos con 6 eventos**.
- Se preservan **8 familias condicionales** separadas del inventario normal de 395 definiciones.
- Cada identidad normal queda con decisión **Centralizar sin renumerar**, resultado **Incluido en contrato lógico**, estado **Definición normal vigente** y bloqueo **No aplica**.
- La tarea no cambia clases, sensibilidades, tipos canónicos, condiciones fuente, hechos confirmados ni semántica de las definiciones propietarias.

Conciliación matemática del inventario normal:

```text
4 × 4
+ 11 × 5
+ 54 × 6
= 395
```

---

#### 3. Fuentes canónicas consumidas

La tarea consume y preserva, sin sustituirlas:

- `SHELL-CON-001`, como autoridad de la raíz compartida `@vento/contracts` y de sus fronteras de pureza contractual;
- `SHELL-CON-009`, como autoridad compartida de `ProcessId`;
- `SHELL-CON-012`, como autoridad de `FunctionalActionId` y como antecedente que reserva `BusinessEventId` como identidad distinta;
- `PROC-CAT-017`, como autoridad del catálogo de 395 definiciones normales, las clases, sensibilidades, semántica de emisión y ocho familias condicionales;
- el contrato de integración vigente que consume el catálogo de procesos sin sustituirlo;
- `TREQ-PROC-087..TREQ-PROC-094`, como cobertura vigente del catálogo y la emisión de eventos de proceso;
- `TREQ-INTEGRATION-024..TREQ-INTEGRATION-053`, como cobertura vigente de integración y transporte relacionada;
- el protocolo, la secuencia activa y el contrato de entrega vigentes de `vento-shell`.

Precedencia específica:

```text
PROC-CAT-017
→ gobierna identidad y semántica del evento empresarial

SHELL-CON-013
→ centraliza la identidad compartida
→ no redefine la semántica propietaria

integración y consumidores
→ consumen el contrato
→ no administran el namespace
```

---

#### 4. Línea base reconciliada

| Elemento                                           | Esperado | Materializado | Faltantes | Duplicados | Resultado |
| -------------------------------------------------- | -------: | ------------: | --------: | ---------: | --------- |
| Procesos vigentes                                  |       69 |            69 |         0 |          0 | Coincide  |
| Definiciones normales                              |      395 |           395 |         0 |          0 | Coincide  |
| Procesos con 4 definiciones                        |        4 |             4 |         0 |          0 | Coincide  |
| Procesos con 5 definiciones                        |       11 |            11 |         0 |          0 | Coincide  |
| Procesos con 6 definiciones                        |       54 |            54 |         0 |          0 | Coincide  |
| Familias condicionales fuera del inventario normal |        8 |             8 |         0 |          0 | Coincide  |

Distribución exacta por cardinalidad:

- **4 definiciones:** `VPROC-0003`, `VPROC-0015`, `VPROC-0017`, `VPROC-0033`.
- **5 definiciones:** `VPROC-0001`, `VPROC-0008`, `VPROC-0016`, `VPROC-0018`, `VPROC-0019`, `VPROC-0020`, `VPROC-0038`, `VPROC-0039`, `VPROC-0048`, `VPROC-0056`, `VPROC-0060`.
- **6 definiciones:** los otros 54 `ProcessId` del conjunto `VPROC-0001..VPROC-0069`.

---

#### 5. Namespace y propiedad

La superficie lógica compartida de esta tarea es:

```text
@vento/contracts/events
```

Su propiedad documental queda en `vento-shell` bajo la autoridad de `@vento/contracts`. Durante esta fase no se crea directorio, archivo de código, paquete compilado, publicación física ni consumidor.

El namespace contiene contratos estáticos de identidad y pertenencia de eventos empresariales. No ejecuta emisión, persistencia, entrega, reintentos, deduplicación, autorización, acceso a datos, telemetría ni transporte.

---

#### 6. Identidad `BusinessEventId`

Se adopta `BusinessEventId` como nombre conceptual de la identidad compartida de una **definición estable de evento empresarial**.

Forma contractual:

```text
VPROC-####.EVT-###
```

Patrón estructural:

```text
^VPROC-[0-9]{4}\.EVT-[0-9]{3}$
```

Reglas:

1. el prefijo `VPROC-####` debe corresponder a un `ProcessId` vigente;
2. el ordinal `EVT-###` se conserva exactamente como fue aprobado por `PROC-CAT-017`;
3. cumplir el patrón no demuestra pertenencia al inventario vigente;
4. la pertenencia exige existir en la matriz completa de esta tarea;
5. los ordinales son locales al proceso y no constituyen una secuencia global;
6. una identidad publicada no se renumera ni se recicla para otro significado;
7. nombre humano, `event_type`, aplicación, sede, actor, versión de despliegue o tecnología no forman parte de `BusinessEventId`;
8. una identidad reconocida no demuestra que exista una emisión concreta.

---

#### 7. Definición estable y ocurrencia runtime

El contrato conserva tres conceptos distintos:

| Concepto          | Función                                                   | Regla                                      |
| ----------------- | --------------------------------------------------------- | ------------------------------------------ |
| `BusinessEventId` | identifica la definición empresarial estable              | pertenece al conjunto `VPROC-####.EVT-###` |
| `event_id`        | identifica una emisión u ocurrencia concreta              | es único y no reutilizable por ocurrencia  |
| `event_type`      | identifica el tipo semántico versionado que se transporta | conserva versión y significado publicados  |

También permanecen separados `process_instance_id`, `correlation_id` y `causation_id`, que aportan contexto de ejecución y trazabilidad, pero no sustituyen la identidad estable de la definición.

La relación conceptual es:

```text
BusinessEventId estable
+ instancia de proceso
+ ocurrencia runtime única
+ tipo semántico versionado
+ correlación y causalidad
→ emisión trazable
```

---

#### 8. Vocabularios semánticos preservados

`SHELL-CON-013` no crea una taxonomía paralela. Preserva los valores vigentes utilizados por `PROC-CAT-017`.

##### 8.1. Clases de evento

- `PROCESS_STARTED`
- `ANALYSIS_FACT`
- `DECISION_FACT`
- `VERIFICATION_FACT`
- `PROCESS_COMPLETED`
- `VALIDATION_FACT`
- `EXECUTION_FACT`
- `REVIEW_FACT`
- `READINESS_FACT`
- `HANDOFF_FACT`
- `RECONCILIATION_FACT`
- `ACTIVATION_FACT`

Total: **12 clases**.

##### 8.2. Sensibilidades

- `INTERNAL_OPERATIONAL`
- `RESTRICTED_PERSONAL`
- `RESTRICTED_FINANCIAL`
- `RESTRICTED_TECHNICAL`

Total: **4 sensibilidades**.

Las clases y sensibilidades siguen siendo metadata semántica gobernada por la fuente propietaria. Una futura proyección compartida podrá representarlas sin convertir esta tarea en una segunda fuente editable.

---

#### 9. Familias condicionales

Las ocho familias siguientes se preservan exactamente desde `PROC-CAT-017` y permanecen separadas del inventario normal de 395 definiciones:

| Tipo plantilla                                      | Se emite cuando                                                              | Regla                                                                             |
| --------------------------------------------------- | ---------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| `vento.process.vproc-####.exception-applied.v1`     | Una acción `EX-*` altera tratamiento, control, asignación o ruta.            | Incluye `exception_action_id`, vigencia, autoridad y efecto sin fingir reversión. |
| `vento.process.vproc-####.exception-resolved.v1`    | La condición excepcional queda levantada o con destino controlado.           | No cambia el estado principal si el contrato no lo ordena.                        |
| `vento.process.vproc-####.cancellation-recorded.v1` | Se cancela trabajo futuro válido.                                            | Conserva efectos ya ejecutados y obligaciones residuales.                         |
| `vento.process.vproc-####.void-recorded.v1`         | Se demuestra que el registro nunca produjo un efecto válido o era duplicado. | Requiere evidencia y no se usa como borrado genérico.                             |
| `vento.process.vproc-####.reversal-applied.v1`      | Se crea un efecto inverso legítimo.                                          | Referencia el efecto original y conserva ambos.                                   |
| `vento.process.vproc-####.compensation-posted.v1`   | Un hecho irreversible requiere efecto compensatorio.                         | No declara deshecho el hecho original.                                            |
| `vento.process.vproc-####.correction-applied.v1`    | Se rectifica información conservando antes y después.                        | Incluye motivo, autoridad, versión y campos afectados.                            |
| `vento.process.vproc-####.linked-review-opened.v1`  | Un cierre requiere revisión o instancia posterior.                           | Conserva inmutable la instancia original y su correlación.                        |

Estas familias son parametrizadas por proceso y no se cuentan dentro de las 395 definiciones de hitos normales. Su payload deberá incluir el identificador exacto `EX-*` o `CCR-*` que las originó.

Conservan el `process_id` propietario, el `process_instance_id`, la correlación, la causalidad y la referencia al registro excepcional que las origina. No se les asigna artificialmente una identidad base `VPROC-####.EVT-###` dentro de esta tarea.

---

#### 10. Matriz completa de identidades normales

La matriz siguiente contiene las **395/395** identidades normales vigentes y materializa una decisión explícita por cada una.

| `BusinessEventId`    | `ProcessId`  | Decisión                  | Resultado                   | Estado                    | Bloqueo   |
| -------------------- | ------------ | ------------------------- | --------------------------- | ------------------------- | --------- |
| `VPROC-0001.EVT-001` | `VPROC-0001` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0001.EVT-002` | `VPROC-0001` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0001.EVT-003` | `VPROC-0001` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0001.EVT-004` | `VPROC-0001` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0001.EVT-005` | `VPROC-0001` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0002.EVT-001` | `VPROC-0002` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0002.EVT-002` | `VPROC-0002` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0002.EVT-003` | `VPROC-0002` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0002.EVT-004` | `VPROC-0002` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0002.EVT-005` | `VPROC-0002` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0002.EVT-006` | `VPROC-0002` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0003.EVT-001` | `VPROC-0003` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0003.EVT-002` | `VPROC-0003` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0003.EVT-003` | `VPROC-0003` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0003.EVT-004` | `VPROC-0003` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0004.EVT-001` | `VPROC-0004` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0004.EVT-002` | `VPROC-0004` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0004.EVT-003` | `VPROC-0004` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0004.EVT-004` | `VPROC-0004` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0004.EVT-005` | `VPROC-0004` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0004.EVT-006` | `VPROC-0004` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0005.EVT-001` | `VPROC-0005` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0005.EVT-002` | `VPROC-0005` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0005.EVT-003` | `VPROC-0005` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0005.EVT-004` | `VPROC-0005` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0005.EVT-005` | `VPROC-0005` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0005.EVT-006` | `VPROC-0005` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0006.EVT-001` | `VPROC-0006` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0006.EVT-002` | `VPROC-0006` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0006.EVT-003` | `VPROC-0006` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0006.EVT-004` | `VPROC-0006` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0006.EVT-005` | `VPROC-0006` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0006.EVT-006` | `VPROC-0006` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0007.EVT-001` | `VPROC-0007` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0007.EVT-002` | `VPROC-0007` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0007.EVT-003` | `VPROC-0007` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0007.EVT-004` | `VPROC-0007` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0007.EVT-005` | `VPROC-0007` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0007.EVT-006` | `VPROC-0007` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0008.EVT-001` | `VPROC-0008` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0008.EVT-002` | `VPROC-0008` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0008.EVT-003` | `VPROC-0008` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0008.EVT-004` | `VPROC-0008` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0008.EVT-005` | `VPROC-0008` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0009.EVT-001` | `VPROC-0009` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0009.EVT-002` | `VPROC-0009` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0009.EVT-003` | `VPROC-0009` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0009.EVT-004` | `VPROC-0009` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0009.EVT-005` | `VPROC-0009` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0009.EVT-006` | `VPROC-0009` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0010.EVT-001` | `VPROC-0010` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0010.EVT-002` | `VPROC-0010` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0010.EVT-003` | `VPROC-0010` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0010.EVT-004` | `VPROC-0010` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0010.EVT-005` | `VPROC-0010` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0010.EVT-006` | `VPROC-0010` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0011.EVT-001` | `VPROC-0011` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0011.EVT-002` | `VPROC-0011` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0011.EVT-003` | `VPROC-0011` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0011.EVT-004` | `VPROC-0011` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0011.EVT-005` | `VPROC-0011` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0011.EVT-006` | `VPROC-0011` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0012.EVT-001` | `VPROC-0012` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0012.EVT-002` | `VPROC-0012` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0012.EVT-003` | `VPROC-0012` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0012.EVT-004` | `VPROC-0012` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0012.EVT-005` | `VPROC-0012` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0012.EVT-006` | `VPROC-0012` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0013.EVT-001` | `VPROC-0013` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0013.EVT-002` | `VPROC-0013` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0013.EVT-003` | `VPROC-0013` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0013.EVT-004` | `VPROC-0013` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0013.EVT-005` | `VPROC-0013` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0013.EVT-006` | `VPROC-0013` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0014.EVT-001` | `VPROC-0014` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0014.EVT-002` | `VPROC-0014` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0014.EVT-003` | `VPROC-0014` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0014.EVT-004` | `VPROC-0014` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0014.EVT-005` | `VPROC-0014` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0014.EVT-006` | `VPROC-0014` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0015.EVT-001` | `VPROC-0015` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0015.EVT-002` | `VPROC-0015` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0015.EVT-003` | `VPROC-0015` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0015.EVT-004` | `VPROC-0015` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0016.EVT-001` | `VPROC-0016` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0016.EVT-002` | `VPROC-0016` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0016.EVT-003` | `VPROC-0016` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0016.EVT-004` | `VPROC-0016` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0016.EVT-005` | `VPROC-0016` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0017.EVT-001` | `VPROC-0017` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0017.EVT-002` | `VPROC-0017` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0017.EVT-003` | `VPROC-0017` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0017.EVT-004` | `VPROC-0017` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0018.EVT-001` | `VPROC-0018` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0018.EVT-002` | `VPROC-0018` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0018.EVT-003` | `VPROC-0018` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0018.EVT-004` | `VPROC-0018` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0018.EVT-005` | `VPROC-0018` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0019.EVT-001` | `VPROC-0019` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0019.EVT-002` | `VPROC-0019` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0019.EVT-003` | `VPROC-0019` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0019.EVT-004` | `VPROC-0019` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0019.EVT-005` | `VPROC-0019` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0020.EVT-001` | `VPROC-0020` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0020.EVT-002` | `VPROC-0020` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0020.EVT-003` | `VPROC-0020` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0020.EVT-004` | `VPROC-0020` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0020.EVT-005` | `VPROC-0020` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0021.EVT-001` | `VPROC-0021` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0021.EVT-002` | `VPROC-0021` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0021.EVT-003` | `VPROC-0021` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0021.EVT-004` | `VPROC-0021` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0021.EVT-005` | `VPROC-0021` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0021.EVT-006` | `VPROC-0021` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0022.EVT-001` | `VPROC-0022` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0022.EVT-002` | `VPROC-0022` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0022.EVT-003` | `VPROC-0022` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0022.EVT-004` | `VPROC-0022` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0022.EVT-005` | `VPROC-0022` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0022.EVT-006` | `VPROC-0022` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0023.EVT-001` | `VPROC-0023` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0023.EVT-002` | `VPROC-0023` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0023.EVT-003` | `VPROC-0023` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0023.EVT-004` | `VPROC-0023` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0023.EVT-005` | `VPROC-0023` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0023.EVT-006` | `VPROC-0023` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0024.EVT-001` | `VPROC-0024` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0024.EVT-002` | `VPROC-0024` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0024.EVT-003` | `VPROC-0024` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0024.EVT-004` | `VPROC-0024` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0024.EVT-005` | `VPROC-0024` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0024.EVT-006` | `VPROC-0024` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0025.EVT-001` | `VPROC-0025` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0025.EVT-002` | `VPROC-0025` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0025.EVT-003` | `VPROC-0025` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0025.EVT-004` | `VPROC-0025` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0025.EVT-005` | `VPROC-0025` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0025.EVT-006` | `VPROC-0025` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0026.EVT-001` | `VPROC-0026` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0026.EVT-002` | `VPROC-0026` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0026.EVT-003` | `VPROC-0026` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0026.EVT-004` | `VPROC-0026` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0026.EVT-005` | `VPROC-0026` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0026.EVT-006` | `VPROC-0026` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0027.EVT-001` | `VPROC-0027` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0027.EVT-002` | `VPROC-0027` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0027.EVT-003` | `VPROC-0027` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0027.EVT-004` | `VPROC-0027` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0027.EVT-005` | `VPROC-0027` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0027.EVT-006` | `VPROC-0027` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0028.EVT-001` | `VPROC-0028` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0028.EVT-002` | `VPROC-0028` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0028.EVT-003` | `VPROC-0028` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0028.EVT-004` | `VPROC-0028` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0028.EVT-005` | `VPROC-0028` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0028.EVT-006` | `VPROC-0028` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0029.EVT-001` | `VPROC-0029` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0029.EVT-002` | `VPROC-0029` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0029.EVT-003` | `VPROC-0029` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0029.EVT-004` | `VPROC-0029` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0029.EVT-005` | `VPROC-0029` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0029.EVT-006` | `VPROC-0029` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0030.EVT-001` | `VPROC-0030` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0030.EVT-002` | `VPROC-0030` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0030.EVT-003` | `VPROC-0030` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0030.EVT-004` | `VPROC-0030` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0030.EVT-005` | `VPROC-0030` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0030.EVT-006` | `VPROC-0030` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0031.EVT-001` | `VPROC-0031` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0031.EVT-002` | `VPROC-0031` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0031.EVT-003` | `VPROC-0031` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0031.EVT-004` | `VPROC-0031` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0031.EVT-005` | `VPROC-0031` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0031.EVT-006` | `VPROC-0031` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0032.EVT-001` | `VPROC-0032` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0032.EVT-002` | `VPROC-0032` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0032.EVT-003` | `VPROC-0032` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0032.EVT-004` | `VPROC-0032` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0032.EVT-005` | `VPROC-0032` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0032.EVT-006` | `VPROC-0032` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0033.EVT-001` | `VPROC-0033` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0033.EVT-002` | `VPROC-0033` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0033.EVT-003` | `VPROC-0033` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0033.EVT-004` | `VPROC-0033` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0034.EVT-001` | `VPROC-0034` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0034.EVT-002` | `VPROC-0034` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0034.EVT-003` | `VPROC-0034` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0034.EVT-004` | `VPROC-0034` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0034.EVT-005` | `VPROC-0034` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0034.EVT-006` | `VPROC-0034` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0035.EVT-001` | `VPROC-0035` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0035.EVT-002` | `VPROC-0035` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0035.EVT-003` | `VPROC-0035` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0035.EVT-004` | `VPROC-0035` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0035.EVT-005` | `VPROC-0035` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0035.EVT-006` | `VPROC-0035` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0036.EVT-001` | `VPROC-0036` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0036.EVT-002` | `VPROC-0036` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0036.EVT-003` | `VPROC-0036` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0036.EVT-004` | `VPROC-0036` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0036.EVT-005` | `VPROC-0036` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0036.EVT-006` | `VPROC-0036` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0037.EVT-001` | `VPROC-0037` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0037.EVT-002` | `VPROC-0037` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0037.EVT-003` | `VPROC-0037` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0037.EVT-004` | `VPROC-0037` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0037.EVT-005` | `VPROC-0037` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0037.EVT-006` | `VPROC-0037` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0038.EVT-001` | `VPROC-0038` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0038.EVT-002` | `VPROC-0038` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0038.EVT-003` | `VPROC-0038` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0038.EVT-004` | `VPROC-0038` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0038.EVT-005` | `VPROC-0038` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0039.EVT-001` | `VPROC-0039` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0039.EVT-002` | `VPROC-0039` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0039.EVT-003` | `VPROC-0039` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0039.EVT-004` | `VPROC-0039` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0039.EVT-005` | `VPROC-0039` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0040.EVT-001` | `VPROC-0040` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0040.EVT-002` | `VPROC-0040` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0040.EVT-003` | `VPROC-0040` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0040.EVT-004` | `VPROC-0040` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0040.EVT-005` | `VPROC-0040` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0040.EVT-006` | `VPROC-0040` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0041.EVT-001` | `VPROC-0041` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0041.EVT-002` | `VPROC-0041` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0041.EVT-003` | `VPROC-0041` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0041.EVT-004` | `VPROC-0041` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0041.EVT-005` | `VPROC-0041` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0041.EVT-006` | `VPROC-0041` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0042.EVT-001` | `VPROC-0042` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0042.EVT-002` | `VPROC-0042` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0042.EVT-003` | `VPROC-0042` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0042.EVT-004` | `VPROC-0042` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0042.EVT-005` | `VPROC-0042` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0042.EVT-006` | `VPROC-0042` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0043.EVT-001` | `VPROC-0043` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0043.EVT-002` | `VPROC-0043` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0043.EVT-003` | `VPROC-0043` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0043.EVT-004` | `VPROC-0043` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0043.EVT-005` | `VPROC-0043` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0043.EVT-006` | `VPROC-0043` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0044.EVT-001` | `VPROC-0044` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0044.EVT-002` | `VPROC-0044` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0044.EVT-003` | `VPROC-0044` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0044.EVT-004` | `VPROC-0044` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0044.EVT-005` | `VPROC-0044` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0044.EVT-006` | `VPROC-0044` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0045.EVT-001` | `VPROC-0045` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0045.EVT-002` | `VPROC-0045` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0045.EVT-003` | `VPROC-0045` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0045.EVT-004` | `VPROC-0045` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0045.EVT-005` | `VPROC-0045` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0045.EVT-006` | `VPROC-0045` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0046.EVT-001` | `VPROC-0046` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0046.EVT-002` | `VPROC-0046` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0046.EVT-003` | `VPROC-0046` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0046.EVT-004` | `VPROC-0046` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0046.EVT-005` | `VPROC-0046` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0046.EVT-006` | `VPROC-0046` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0047.EVT-001` | `VPROC-0047` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0047.EVT-002` | `VPROC-0047` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0047.EVT-003` | `VPROC-0047` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0047.EVT-004` | `VPROC-0047` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0047.EVT-005` | `VPROC-0047` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0047.EVT-006` | `VPROC-0047` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0048.EVT-001` | `VPROC-0048` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0048.EVT-002` | `VPROC-0048` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0048.EVT-003` | `VPROC-0048` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0048.EVT-004` | `VPROC-0048` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0048.EVT-005` | `VPROC-0048` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0049.EVT-001` | `VPROC-0049` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0049.EVT-002` | `VPROC-0049` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0049.EVT-003` | `VPROC-0049` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0049.EVT-004` | `VPROC-0049` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0049.EVT-005` | `VPROC-0049` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0049.EVT-006` | `VPROC-0049` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0050.EVT-001` | `VPROC-0050` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0050.EVT-002` | `VPROC-0050` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0050.EVT-003` | `VPROC-0050` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0050.EVT-004` | `VPROC-0050` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0050.EVT-005` | `VPROC-0050` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0050.EVT-006` | `VPROC-0050` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0051.EVT-001` | `VPROC-0051` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0051.EVT-002` | `VPROC-0051` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0051.EVT-003` | `VPROC-0051` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0051.EVT-004` | `VPROC-0051` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0051.EVT-005` | `VPROC-0051` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0051.EVT-006` | `VPROC-0051` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0052.EVT-001` | `VPROC-0052` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0052.EVT-002` | `VPROC-0052` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0052.EVT-003` | `VPROC-0052` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0052.EVT-004` | `VPROC-0052` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0052.EVT-005` | `VPROC-0052` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0052.EVT-006` | `VPROC-0052` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0053.EVT-001` | `VPROC-0053` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0053.EVT-002` | `VPROC-0053` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0053.EVT-003` | `VPROC-0053` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0053.EVT-004` | `VPROC-0053` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0053.EVT-005` | `VPROC-0053` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0053.EVT-006` | `VPROC-0053` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0054.EVT-001` | `VPROC-0054` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0054.EVT-002` | `VPROC-0054` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0054.EVT-003` | `VPROC-0054` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0054.EVT-004` | `VPROC-0054` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0054.EVT-005` | `VPROC-0054` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0054.EVT-006` | `VPROC-0054` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0055.EVT-001` | `VPROC-0055` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0055.EVT-002` | `VPROC-0055` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0055.EVT-003` | `VPROC-0055` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0055.EVT-004` | `VPROC-0055` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0055.EVT-005` | `VPROC-0055` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0055.EVT-006` | `VPROC-0055` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0056.EVT-001` | `VPROC-0056` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0056.EVT-002` | `VPROC-0056` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0056.EVT-003` | `VPROC-0056` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0056.EVT-004` | `VPROC-0056` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0056.EVT-005` | `VPROC-0056` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0057.EVT-001` | `VPROC-0057` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0057.EVT-002` | `VPROC-0057` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0057.EVT-003` | `VPROC-0057` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0057.EVT-004` | `VPROC-0057` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0057.EVT-005` | `VPROC-0057` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0057.EVT-006` | `VPROC-0057` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0058.EVT-001` | `VPROC-0058` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0058.EVT-002` | `VPROC-0058` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0058.EVT-003` | `VPROC-0058` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0058.EVT-004` | `VPROC-0058` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0058.EVT-005` | `VPROC-0058` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0058.EVT-006` | `VPROC-0058` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0059.EVT-001` | `VPROC-0059` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0059.EVT-002` | `VPROC-0059` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0059.EVT-003` | `VPROC-0059` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0059.EVT-004` | `VPROC-0059` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0059.EVT-005` | `VPROC-0059` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0059.EVT-006` | `VPROC-0059` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0060.EVT-001` | `VPROC-0060` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0060.EVT-002` | `VPROC-0060` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0060.EVT-003` | `VPROC-0060` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0060.EVT-004` | `VPROC-0060` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0060.EVT-005` | `VPROC-0060` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0061.EVT-001` | `VPROC-0061` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0061.EVT-002` | `VPROC-0061` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0061.EVT-003` | `VPROC-0061` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0061.EVT-004` | `VPROC-0061` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0061.EVT-005` | `VPROC-0061` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0061.EVT-006` | `VPROC-0061` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0062.EVT-001` | `VPROC-0062` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0062.EVT-002` | `VPROC-0062` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0062.EVT-003` | `VPROC-0062` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0062.EVT-004` | `VPROC-0062` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0062.EVT-005` | `VPROC-0062` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0062.EVT-006` | `VPROC-0062` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0063.EVT-001` | `VPROC-0063` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0063.EVT-002` | `VPROC-0063` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0063.EVT-003` | `VPROC-0063` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0063.EVT-004` | `VPROC-0063` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0063.EVT-005` | `VPROC-0063` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0063.EVT-006` | `VPROC-0063` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0064.EVT-001` | `VPROC-0064` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0064.EVT-002` | `VPROC-0064` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0064.EVT-003` | `VPROC-0064` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0064.EVT-004` | `VPROC-0064` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0064.EVT-005` | `VPROC-0064` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0064.EVT-006` | `VPROC-0064` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0065.EVT-001` | `VPROC-0065` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0065.EVT-002` | `VPROC-0065` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0065.EVT-003` | `VPROC-0065` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0065.EVT-004` | `VPROC-0065` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0065.EVT-005` | `VPROC-0065` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0065.EVT-006` | `VPROC-0065` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0066.EVT-001` | `VPROC-0066` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0066.EVT-002` | `VPROC-0066` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0066.EVT-003` | `VPROC-0066` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0066.EVT-004` | `VPROC-0066` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0066.EVT-005` | `VPROC-0066` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0066.EVT-006` | `VPROC-0066` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0067.EVT-001` | `VPROC-0067` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0067.EVT-002` | `VPROC-0067` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0067.EVT-003` | `VPROC-0067` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0067.EVT-004` | `VPROC-0067` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0067.EVT-005` | `VPROC-0067` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0067.EVT-006` | `VPROC-0067` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0068.EVT-001` | `VPROC-0068` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0068.EVT-002` | `VPROC-0068` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0068.EVT-003` | `VPROC-0068` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0068.EVT-004` | `VPROC-0068` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0068.EVT-005` | `VPROC-0068` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0068.EVT-006` | `VPROC-0068` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0069.EVT-001` | `VPROC-0069` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0069.EVT-002` | `VPROC-0069` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0069.EVT-003` | `VPROC-0069` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0069.EVT-004` | `VPROC-0069` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0069.EVT-005` | `VPROC-0069` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |
| `VPROC-0069.EVT-006` | `VPROC-0069` | Centralizar sin renumerar | Incluido en contrato lógico | Definición normal vigente | No aplica |

---

#### 11. Reconciliación de la matriz

- Filas esperadas: **395**.
- Filas materializadas: **395**.
- `BusinessEventId` únicos: **395**.
- `ProcessId` cubiertos: **69/69**.
- Procesos con 4 miembros: **4**.
- Procesos con 5 miembros: **11**.
- Procesos con 6 miembros: **54**.
- Identidades repetidas: **0**.
- Huecos en las secuencias locales aprobadas: **0**.
- Procesos sin definición normal: **0**.
- Identidades normales adicionales no aprobadas: **0**.

La matriz es exhaustiva para el corte canónico consumido por esta tarea.

---

#### 12. Pertenencia y validación contractual

Una futura materialización del contrato deberá distinguir **sintaxis** de **pertenencia**.

Una entrada solo puede tratarse como `BusinessEventId` vigente cuando:

1. cumple la forma `VPROC-####.EVT-###`;
2. su `ProcessId` propietario pertenece al conjunto vigente;
3. la identidad completa existe entre las 395 definiciones normales publicadas;
4. la referencia conserva el proceso propietario correcto;
5. no corresponde a una familia condicional tratada como si fuera una definición normal.

Ejemplos conceptuales:

```text
VPROC-0003.EVT-004
→ forma válida
→ miembro vigente

VPROC-0003.EVT-005
→ forma válida
→ no pertenece al inventario vigente de VPROC-0003

VPROC-0070.EVT-001
→ forma válida
→ ProcessId no asignado en el corte vigente

vproc-0001.evt-001
→ forma inválida
```

Un cast estático o una coincidencia de expresión regular no sustituyen la comprobación de pertenencia.

---

#### 13. Separaciones obligatorias

```text
BusinessEventId != event_id
BusinessEventId != event_type
BusinessEventId != ProcessId
BusinessEventId != ProcessStateId
BusinessEventId != ScreenId
BusinessEventId != FunctionalActionId
BusinessEventId != PermissionId
BusinessEventId != correlation_id
```

Además:

- un comando expresa una intención anterior a la confirmación del hecho; un evento empresarial expresa un hecho confirmado;
- una acción funcional puede causar uno o varios eventos empresariales, pero no se convierte en su identidad;
- una señal `TRACE_ONLY`, una entrada de auditoría o un log técnico no se promueven a evento empresarial;
- una notificación o un acuse no sustituyen la definición empresarial;
- un tópico, cola, outbox, webhook, API o RPC son mecanismos técnicos y no pertenecen al namespace de `BusinessEventId`.

---

#### 14. Frontera de producción, consumo y seguridad

Se preservan como invariantes heredados del catálogo y de sus requisitos vigentes:

1. la aplicación propietaria del proceso conserva la responsabilidad de producir sus eventos;
2. un consumidor procesa el hecho dentro de su dominio y no adquiere autoridad para sobrescribir estado privado de la propietaria;
3. la producción de un evento empresarial ocurre respecto de un hecho empresarial confirmado, no como sustituto de un comando;
4. la emisión conserva correlación, causalidad e idempotencia conforme a los contratos vigentes;
5. los payloads sensibles se minimizan y protegen según la sensibilidad aprobada;
6. auditoría y observabilidad no convierten el payload sensible completo en material de logging;
7. replay, backfill y compatibilidad legacy conservan significado, versión y trazabilidad y no reasignan una identidad estable a otro hecho.

Estas reglas se preservan como fronteras ya existentes. `SHELL-CON-013` no implementa transporte ni introduce un nuevo comportamiento runtime.

---

#### 15. Evolución, estabilidad y compatibilidad

1. Un `BusinessEventId` aprobado no se renumera ni se reutiliza para otra semántica.
2. Cambiar nombre humano, aplicación técnica, serializador, broker o mecanismo de entrega no cambia por sí solo la identidad estable.
3. Una nueva definición normal solo ingresa al contrato compartido después de existir en la fuente propietaria aprobada.
4. Una definición retirada o reemplazada conserva trazabilidad histórica y no libera su identidad para reutilización.
5. `event_type` conserva versionado semántico; una versión publicada no cambia significado silenciosamente.
6. Un consumidor que no reconoce una identidad o versión no inventa equivalencias por semejanza textual.
7. Las ocho familias condicionales continúan fuera del conteo normal salvo una decisión canónica que modifique explícitamente esa arquitectura.
8. Los consumidores no mantienen un universo local divergente de `BusinessEventId`.

---

#### 16. Estado de materialización física

En esta tarea queda definido documentalmente el contrato de `@vento/contracts/events`, pero no se materializa como paquete o código ejecutable.

No se crean ni modifican:

- código fuente;
- packages o exports físicos;
- tipos generados;
- pruebas runtime;
- productores o consumidores;
- outbox, tópicos, colas, suscripciones o brokers;
- endpoints, APIs, RPC o webhooks;
- SQL, migraciones o configuración Supabase;
- datos operativos;
- despliegues o integraciones físicas.

La materialización física queda asignada a `E5-GATE-008` y `SHELL-CI-020`, con pruebas en `SHELL-CI-001`, build en `SHELL-CI-002`, release en `SHELL-CI-003`, compatibilidad en `SHELL-CI-005` y adopción de consumidores en `SHELL-CI-006`.

---

#### 17. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Justificación:** `SHELL-CON-013` centraliza sin alterar las 395 definiciones normales, las ocho familias condicionales y las reglas de identidad y emisión ya protegidas por `TREQ-PROC-087..TREQ-PROC-094` y `TREQ-INTEGRATION-024..TREQ-INTEGRATION-053`. No agrega un evento empresarial, regla de emisión, transporte, autorización, integración, API, persistencia, comportamiento de runtime ni requisito de seguridad nuevo. Crear otro requisito para la misma pertenencia y las mismas fronteras duplicaría cobertura vigente.

El Registro Canónico de Requisitos de Prueba permanece sin cambios.

---

#### 18. Decisiones aprobadas

1. `BusinessEventId` es el nombre conceptual de la identidad estable compartida de una definición de evento empresarial.
2. `@vento/contracts/events` es el namespace lógico reservado por esta tarea.
3. El conjunto normal vigente contiene exactamente **395** miembros.
4. Los 395 miembros pertenecen a exactamente **69** procesos canónicos.
5. La distribución es exactamente 4 procesos con 4 miembros, 11 con 5 y 54 con 6.
6. Los identificadores existentes se centralizan sin renumeración.
7. Sintaxis y pertenencia son comprobaciones distintas.
8. `BusinessEventId`, runtime `event_id` y `event_type` son conceptos distintos.
9. Las 12 clases vigentes se preservan sin crear una taxonomía paralela.
10. Las 4 sensibilidades vigentes se preservan sin reinterpretación.
11. Las 8 familias condicionales permanecen fuera del inventario normal de 395.
12. Comandos, acciones funcionales, notificaciones, auditoría, logs e integraciones técnicas permanecen separados del evento empresarial.
13. La aplicación propietaria conserva la producción del hecho y los consumidores no adquieren propiedad sobre su estado privado.
14. La identidad compartida no concede autorización ni demuestra que exista una emisión runtime.
15. Los consumidores no amplían localmente el conjunto ni crean aliases implícitos.
16. La tarea permanece documental y sin materialización física.
17. No se crean ni modifican requisitos `TREQ-*`.
18. `SHELL-CON-014` permanece exclusivamente reservada.

---

#### 19. Criterios de aceptación

- [x] Se materializan explícitamente las **395/395** identidades normales.
- [x] Se cubren **69/69** procesos vigentes.
- [x] Se verifican **395 identidades únicas**, **0 faltantes** y **0 duplicados**.
- [x] Cada identidad tiene decisión, resultado, estado y bloqueo explícitos.
- [x] Se conserva la distribución exacta de 4, 5 o 6 definiciones por proceso.
- [x] Se separan las ocho familias condicionales del inventario normal.
- [x] Se preservan las 12 clases y las 4 sensibilidades vigentes.
- [x] Se diferencia definición estable, ocurrencia runtime y tipo semántico versionado.
- [x] Se separan eventos empresariales de comandos, acciones, auditoría, logs e infraestructura de integración.
- [x] Se define el namespace compartido sin implementarlo físicamente.
- [x] Se declaran cero cambios TREQ con justificación concreta y cobertura existente.
- [x] No se desarrolla `SHELL-CON-014`.

---

#### 20. Continuidad

##### ÚLTIMA TAREA APROBADA

SHELL-CON-012 — Crear contrato de acciones funcionales

##### TAREA ACTUAL APROBADA

SHELL-CON-013 — Crear contrato de eventos empresariales

##### SIGUIENTE TAREA RESERVADA

SHELL-CON-014 — Crear contrato de traspasos entre aplicaciones


### ✅ SHELL-CON-014 — Crear contrato de traspasos entre aplicaciones

**Estado:** APROBADA

**Tarea anterior:** SHELL-CON-013 — Crear contrato de eventos empresariales

**Tarea siguiente:** SHELL-CON-015 — Crear contrato de tareas pendientes

**Tipo de tarea:** Documental

**Bloque:** H — Fundación compartida

**Repositorio propietario:** `vento-shell`

**Estado físico resultante:** `CONTRATO_DE_TRASPASOS_ENTRE_APLICACIONES_DEFINIDO_NO_MATERIALIZADO`

**Cambios físicos autorizados:** ninguno

**Requisitos TREQ creados o modificados:** 0

---

#### 1. Propósito

`SHELL-CON-014` centraliza el contrato compartido de traspasos entre aplicaciones de Vento OS sin crear nuevas relaciones funcionales, cambiar la aplicación propietaria de un proceso ni convertir cualquier consumo de eventos en un handoff.

La regla central es:

```text
RELACIÓN INTERAPLICACIÓN APROBADA PARA HANDOFF
+
MISMA INSTANCIA DE PROCESO
+
CONTEXTO Y RECURSO PRESERVADOS
+
REVALIDACIÓN DE AUTORIDAD EN LA RECEPTORA
+
ACEPTACIÓN O RESULTADO CORRELACIONADO
=
CONTINUIDAD ENTRE APLICACIONES SIN DUPLICAR EL PROCESO
```

El contrato cubre tanto la solicitud que cruza una frontera de aplicación como la transferencia controlada de trabajo, responsabilidad o custodia y su resultado correlacionado. No autoriza escritura cruzada directa ni modifica por sí mismo el estado propietario.

---

#### 2. Fuentes canónicas consumidas

La tarea consume y preserva, sin sustituirlas:

- `SHELL-CON-001`, como autoridad de la raíz `@vento/contracts`;
- `SHELL-CON-002`, como autoridad compartida de `AppCode`;
- `SHELL-CON-009`, como autoridad compartida de `ProcessId`;
- `SHELL-CON-010`, como autoridad compartida de `ProcessStateId`;
- `SHELL-CON-012`, como autoridad compartida de `FunctionalActionId` cuando una acción pendiente ya pertenece a ese catálogo;
- `SHELL-CON-013`, como autoridad compartida de eventos empresariales y su separación respecto de una solicitud de handoff;
- `PROC-CAT-005`, como autoridad de la propietaria de cada proceso;
- `PROC-CAT-006`, como autoridad de consumidoras directas, consumidoras condicionales y modalidad de intercambio;
- `PROC-CAT-008`, como autoridad de continuidad, aceptación y preservación de identidad durante un traspaso;
- `PROC-CAT-017`, como autoridad de eventos empresariales y del hecho `HANDOFF_FACT` cuando corresponda;
- `INT-APP-003`, como autoridad del perfil `HANDOFF_PROJECTION`;
- `INT-APP-004`, como autoridad de idempotencia de consumo y efecto para handoffs;
- `INT-APP-010`, como autoridad de la familia `HANDOFF_REQUEST` y de la prohibición de escrituras cruzadas sin contrato;
- el Registro Canónico de Requisitos de Prueba vigente, especialmente `TREQ-PROC-023` a `TREQ-PROC-027`, `TREQ-PROC-033` a `TREQ-PROC-037`, `TREQ-INTEGRATION-003` y `TREQ-INTEGRATION-005`.

Precedencia aplicable:

```text
propiedad del proceso
→ relación de consumo aprobada
→ modalidad SOLICITUD_HANDOFF_Y_EVENTO
→ contrato compartido de handoff
→ perfil HANDOFF_PROJECTION / familia HANDOFF_REQUEST
→ implementación física posterior
```

---

#### 3. Definición contractual de traspaso entre aplicaciones

Un traspaso entre aplicaciones es una continuidad controlada de la misma instancia empresarial a través de una frontera de aplicación. Puede transportar una solicitud, transferir trabajo, responsabilidad o custodia, o devolver un resultado correlacionado, pero siempre conserva la autoridad funcional de la propietaria del proceso.

Un handoff válido debe preservar como mínimo, cuando sean aplicables al proceso y recurso:

- `ProcessId`;
- identidad de la instancia de proceso;
- referencia del recurso;
- aplicación propietaria;
- aplicación participante;
- actor emisor;
- actor receptor o función receptora;
- sede;
- área;
- estado vigente;
- acción o trabajo pendiente;
- destino de retorno;
- correlación y causalidad;
- momento del traspaso;
- pendientes y evidencia;
- aceptación o resultado del receptor;
- idempotencia suficiente para evitar doble efecto.

La ausencia de un valor no aplicable no se interpreta como wildcard, autorización global o permiso para reconstruirlo desde el cliente.

---

#### 4. Universo finito reconciliado

`PROC-CAT-006` contiene múltiples modalidades de consumo interaplicación. `SHELL-CON-014` incluye únicamente las relaciones pertenecientes a procesos cuya modalidad dominante vigente es:

```text
SOLICITUD_HANDOFF_Y_EVENTO
```

Su significado aprobado es iniciar una solicitud o transferencia controlada y recibir su resultado.

La reconciliación vigente es:

| Dimensión                                                        |      Resultado |
| ---------------------------------------------------------------- | -------------: |
| Procesos canónicos totales evaluados                             |         **69** |
| Procesos con modalidad `SOLICITUD_HANDOFF_Y_EVENTO`              |          **8** |
| Procesos sin esa modalidad                                       |         **61** |
| Relaciones interaplicación de handoff                            |         **49** |
| Relaciones directas                                              |         **27** |
| Relaciones condicionales                                         |         **22** |
| Aplicaciones propietarias representadas en este subconjunto      | **1 — `viso`** |
| Aplicaciones participantes distintas de la propietaria           |          **9** |
| Relaciones duplicadas por tupla proceso/propietaria/participante |          **0** |
| Relaciones sin `ProcessId`                                       |          **0** |
| Relaciones cuya propietaria aparece también como participante    |          **0** |

No se convierten en handoff las restantes relaciones de consumo solo porque intercambien eventos, proyecciones, referencias, efectos, señales, conciliaciones o análisis.

---

#### 5. Namespace lógico y propiedad

Se define la superficie lógica:

```text
@vento/contracts/handoffs
```

Su propiedad documental queda en `vento-shell` bajo `@vento/contracts`.

La superficie representa contratos estáticos y validables para:

- relaciones interaplicación admitidas para handoff;
- contexto mínimo que debe preservarse;
- reglas de emisión, recepción, aceptación y retorno;
- referencias a identidades compartidas ya aprobadas;
- validación de pertenencia de una relación;
- separación entre handoff, evento, navegación, autorización y escritura propietaria.

No se crea físicamente un package, subpath, archivo de código, schema ejecutable, endpoint, deep link, cola, topic, tabla, RPC ni integración durante esta tarea.

---

#### 6. Identidad de una relación de handoff

Esta tarea no inventa un identificador serializado paralelo. La identidad estática de una relación se resuelve por la tupla exacta:

```text
(ProcessId, owner_application, participant_application)
```

La tupla solo pertenece al contrato cuando existe en la matriz de esta tarea y su proceso conserva la modalidad `SOLICITUD_HANDOFF_Y_EVENTO` en `PROC-CAT-006`.

Invariantes:

1. `ProcessId` debe pertenecer al catálogo canónico vigente;
2. `owner_application` debe coincidir con la propietaria aprobada en `PROC-CAT-005`;
3. `participant_application` debe pertenecer a las consumidoras directas o condicionales aprobadas en `PROC-CAT-006`;
4. propietaria y participante deben ser distintas;
5. una relación directa y una relación condicional no pueden coexistir para la misma tupla;
6. la sintaxis válida de los componentes no demuestra pertenencia a la matriz;
7. incorporar, retirar o reclasificar una relación exige primero modificar su fuente propietaria y conservar compatibilidad e historial.

---

#### 7. Contrato estático de relación

La proyección compartida deberá poder representar conceptualmente, sin crear una segunda fuente de verdad:

```text
ApplicationHandoffRelation
→ process_id: ProcessId
→ owner_application: AppCode
→ participant_application: AppCode
→ participation_class: DIRECTA | CONDICIONAL
→ consumer_mode: SOLICITUD_HANDOFF_Y_EVENTO
→ integration_profile: HANDOFF_PROJECTION
→ exchange_family: HANDOFF_REQUEST
```

`DIRECTA` y `CONDICIONAL` son proyecciones de las listas aprobadas en `PROC-CAT-006`; no sustituyen sus condiciones funcionales.

Una relación `CONDICIONAL` existe documentalmente, pero no queda habilitada por defecto. Su activación exige que se cumpla la condición propietaria aplicable, además de disponibilidad, autorización, contrato y readiness.

---

#### 8. Contrato dinámico de continuidad

Una materialización posterior deberá transportar únicamente el contexto necesario para que la aplicación participante continúe o acepte el trabajo sin reconstruir la instancia desde información visual o parámetros no confiables.

Campos semánticos obligatorios:

| Campo conceptual  | Regla                                                                                 |
| ----------------- | ------------------------------------------------------------------------------------- |
| proceso           | conserva el mismo `ProcessId`                                                         |
| instancia         | conserva la misma instancia; el handoff no crea otra                                  |
| recurso           | identifica el recurso empresarial exacto sobre el que continúa el trabajo             |
| propietaria       | conserva la aplicación con autoridad sobre el proceso                                 |
| participante      | identifica la aplicación que solicita, recibe, ejecuta su efecto o devuelve resultado |
| actor emisor      | conserva quién origina el traspaso                                                    |
| actor receptor    | identifica actor o función que debe continuar o aceptar                               |
| territorio        | conserva sede y área aplicables sin ampliación implícita                              |
| estado            | conserva la posición vigente aplicable del proceso                                    |
| trabajo pendiente | identifica lo que falta y no lo marca como completado por el envío                    |
| retorno           | conserva el destino contractual para volver sin reiniciar ni desviar el proceso       |
| correlación       | relaciona solicitud, handoff, eventos y resultado                                     |
| idempotencia      | impide doble aceptación o doble efecto                                                |
| evidencia         | preserva referencias necesarias para aceptación, auditoría y conciliación             |
| tiempos           | distingue emisión, recepción, aceptación y resultado cuando apliquen                  |

Cuando un valor corresponda inequívocamente a un contrato compartido ya aprobado, la implementación deberá reutilizar ese contrato en lugar de una unión local equivalente.

---

#### 9. Solicitud, transferencia, aceptación y resultado

La secuencia lógica es:

```text
ACTOR AUTORIZADO
→ SOLICITA O EMITE HANDOFF
→ SE VALIDA RELACIÓN CANÓNICA
→ SE PRESERVA CONTEXTO
→ RECEPTORA REVALIDA CONTRATO Y AUTORIDAD
→ ACEPTA O RECHAZA DE FORMA EXPLÍCITA
→ EJECUTA ÚNICAMENTE SU RESPONSABILIDAD
→ DEVUELVE RESULTADO CORRELACIONADO
→ PROPIETARIA CONSERVA SU VERDAD Y CONTINUIDAD
```

Reglas:

1. enviar un handoff no equivale a aceptación;
2. recibirlo no concede autorización;
3. la receptora vuelve a validar actor, contexto, recurso, estado y permiso aplicables;
4. la etapa siguiente no se marca completada por el solo despacho;
5. cuando exista autoaceptación segura, deberá estar expresamente permitida por el contrato propietario; no se infiere;
6. rechazo, expiración o imposibilidad de aceptar conserva la instancia y responsabilidad trazable;
7. un resultado técnico no se interpreta como resultado empresarial sin la confirmación propietaria correspondiente.

---

#### 10. Frontera entre propietaria y participante

La relación de handoff no transfiere la propiedad canónica del proceso.

```text
owner_application
→ gobierna registro principal, reglas, estado, corrección y cierre

participant_application
→ solicita, recibe, continúa o ejecuta únicamente el efecto que su contrato permite
```

Queda prohibido:

- escribir directamente el estado privado de otra aplicación;
- mantener una copia mutable competidora del resultado propietario;
- corregir o cerrar el proceso desde una consumidora por conveniencia técnica;
- asumir que recibir contexto concede permiso;
- convertir una proyección en fuente de verdad;
- actualizar dos fuentes para simular un handoff;
- usar la navegación entre aplicaciones como mecanismo de autorización.

La familia `HANDOFF_REQUEST` solo permite que cada propietaria modifique su propio estado después de las validaciones correspondientes.

---

#### 11. Relación con eventos empresariales

`SHELL-CON-013` y `SHELL-CON-014` permanecen separados:

```text
BusinessEventId
→ identifica una definición estable de hecho empresarial

HANDOFF_REQUEST
→ solicita transferencia o continuidad

HANDOFF_PROJECTION
→ transporta la proyección mínima del traspaso y su resultado

HANDOFF_FACT
→ puede describir un hecho durable de transferencia ya ocurrido
```

Por tanto:

- una solicitud de handoff no es un evento empresarial confirmado;
- un `HANDOFF_FACT` no crea por sí solo una nueva relación entre aplicaciones;
- una relación admitida no obliga a emitir todos los eventos del proceso a esa aplicación;
- la emisión y el consumo continúan sujetos al catálogo de eventos, audiencia y sensibilidad aprobados;
- la correlación entre solicitud, resultado y evento no fusiona sus identidades.

---

#### 12. Idempotencia, duplicados y reintentos

Para `HANDOFF_PROJECTION`, la política aprobada exige inbox del consumidor y una clave de efecto del consumidor para aceptación o handoff, con un único resultado por alcance de efecto.

La materialización posterior deberá impedir:

- aceptar dos veces el mismo traspaso;
- ejecutar dos veces el mismo efecto por retry;
- crear dos instancias por la misma solicitud;
- sobrescribir un resultado anterior con un replay fuera de orden;
- cambiar el contenido lógico bajo la misma clave de operación;
- considerar timeout como rechazo o éxito sin reconciliación;
- perder el resultado recuperable de una operación ya aplicada.

Los mecanismos físicos de outbox, inbox, colas, locks, retries o persistencia se definen e implementan en sus tareas técnicas propietarias; esta tarea fija únicamente la obligación contractual.

---

#### 13. Navegación, deep links y destino de retorno

Un traspaso puede requerir abrir otra aplicación o superficie, pero la navegación es transporte de continuidad y no autoridad.

El contrato deberá conservar:

- aplicación destino;
- referencia de proceso e instancia;
- recurso exacto;
- contexto territorial aplicable;
- estado y trabajo pendiente;
- destino de retorno;
- correlación suficiente para continuar la misma intención.

Reglas:

1. la receptora no confía en parámetros de URL como prueba de autorización;
2. el contexto recibido se valida de nuevo contra fuentes confiables;
3. una ruta renombrada o reemplazada no puede desviar silenciosamente el proceso;
4. deep links compatibles deberán conservar transición controlada durante su ventana de soporte;
5. regresar a la aplicación anterior no crea una instancia nueva;
6. un retorno inválido, obsoleto o no autorizado falla cerrado y conserva un destino seguro conforme al contrato de navegación aplicable;
7. esta tarea no define rutas concretas, URLs ni dominios que no estén aprobados por sus propietarios.

---

#### 14. Relaciones directas y condicionales

Una relación `DIRECTA` significa que la aplicación está declarada como consumidora directa del proceso. No significa que todo actor pueda activar el handoff ni que toda instancia deba usarlo.

Una relación `CONDICIONAL` significa que la aplicación puede participar únicamente cuando se cumplan las condiciones del proceso y del consumo aprobado. No se promueve a directa por frecuencia de uso, existencia de una ruta o disponibilidad técnica.

En ambos casos siguen siendo obligatorios:

- autorización;
- estado compatible;
- recurso compatible;
- finalidad aprobada;
- minimización;
- idempotencia;
- disponibilidad real;
- compatibilidad de versión;
- aceptación cuando corresponda.

---

#### 15. Matriz completa de relaciones vigentes

|    # | `ProcessId`  | Propietaria | Aplicación participante | Relación      | Modalidad canónica           | Perfil de integración | Familia de intercambio | Decisión                            | Resultado                     | Estado         | Bloqueo     |
| ---: | ------------ | ----------- | ----------------------- | ------------- | ---------------------------- | --------------------- | ---------------------- | ----------------------------------- | ----------------------------- | -------------- | ----------- |
|    1 | `VPROC-0005` | `viso`      | `anima`                 | `CONDICIONAL` | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|    2 | `VPROC-0005` | `viso`      | `numera`                | `CONDICIONAL` | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|    3 | `VPROC-0006` | `viso`      | `anima`                 | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|    4 | `VPROC-0006` | `viso`      | `shell`                 | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|    5 | `VPROC-0006` | `viso`      | `nexo`                  | `CONDICIONAL` | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|    6 | `VPROC-0006` | `viso`      | `fogo`                  | `CONDICIONAL` | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|    7 | `VPROC-0006` | `viso`      | `origo`                 | `CONDICIONAL` | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|    8 | `VPROC-0006` | `viso`      | `pulso`                 | `CONDICIONAL` | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|    9 | `VPROC-0006` | `viso`      | `numera`                | `CONDICIONAL` | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   10 | `VPROC-0006` | `viso`      | `aura`                  | `CONDICIONAL` | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   11 | `VPROC-0007` | `viso`      | `anima`                 | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   12 | `VPROC-0007` | `viso`      | `shell`                 | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   13 | `VPROC-0007` | `viso`      | `nexo`                  | `CONDICIONAL` | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   14 | `VPROC-0007` | `viso`      | `fogo`                  | `CONDICIONAL` | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   15 | `VPROC-0007` | `viso`      | `origo`                 | `CONDICIONAL` | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   16 | `VPROC-0007` | `viso`      | `pulso`                 | `CONDICIONAL` | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   17 | `VPROC-0007` | `viso`      | `numera`                | `CONDICIONAL` | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   18 | `VPROC-0009` | `viso`      | `anima`                 | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   19 | `VPROC-0009` | `viso`      | `shell`                 | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   20 | `VPROC-0009` | `viso`      | `nexo`                  | `CONDICIONAL` | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   21 | `VPROC-0009` | `viso`      | `fogo`                  | `CONDICIONAL` | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   22 | `VPROC-0009` | `viso`      | `origo`                 | `CONDICIONAL` | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   23 | `VPROC-0009` | `viso`      | `pulso`                 | `CONDICIONAL` | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   24 | `VPROC-0009` | `viso`      | `numera`                | `CONDICIONAL` | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   25 | `VPROC-0011` | `viso`      | `shell`                 | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   26 | `VPROC-0011` | `viso`      | `anima`                 | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   27 | `VPROC-0011` | `viso`      | `nexo`                  | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   28 | `VPROC-0011` | `viso`      | `fogo`                  | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   29 | `VPROC-0011` | `viso`      | `origo`                 | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   30 | `VPROC-0011` | `viso`      | `pulso`                 | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   31 | `VPROC-0011` | `viso`      | `numera`                | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   32 | `VPROC-0011` | `viso`      | `aura`                  | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   33 | `VPROC-0059` | `viso`      | `shell`                 | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   34 | `VPROC-0059` | `viso`      | `anima`                 | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   35 | `VPROC-0059` | `viso`      | `nexo`                  | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   36 | `VPROC-0059` | `viso`      | `fogo`                  | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   37 | `VPROC-0059` | `viso`      | `origo`                 | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   38 | `VPROC-0059` | `viso`      | `pulso`                 | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   39 | `VPROC-0059` | `viso`      | `numera`                | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   40 | `VPROC-0059` | `viso`      | `aura`                  | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   41 | `VPROC-0059` | `viso`      | `pass`                  | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   42 | `VPROC-0065` | `viso`      | `anima`                 | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   43 | `VPROC-0065` | `viso`      | `numera`                | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   44 | `VPROC-0066` | `viso`      | `anima`                 | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   45 | `VPROC-0066` | `viso`      | `nexo`                  | `DIRECTA`     | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   46 | `VPROC-0066` | `viso`      | `fogo`                  | `CONDICIONAL` | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   47 | `VPROC-0066` | `viso`      | `origo`                 | `CONDICIONAL` | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   48 | `VPROC-0066` | `viso`      | `pulso`                 | `CONDICIONAL` | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |
|   49 | `VPROC-0066` | `viso`      | `shell`                 | `CONDICIONAL` | `SOLICITUD_HANDOFF_Y_EVENTO` | `HANDOFF_PROJECTION`  | `HANDOFF_REQUEST`      | `CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD` | `INCLUIDA_EN_CONTRATO_LOGICO` | `ESPECIFICADO` | `NO_APLICA` |

---

#### 16. Reconciliación por proceso

| `ProcessId`  | Propietaria | Directas | Condicionales |  Total |
| ------------ | ----------- | -------: | ------------: | -----: |
| `VPROC-0005` | `viso`      |        0 |             2 |      2 |
| `VPROC-0006` | `viso`      |        2 |             6 |      8 |
| `VPROC-0007` | `viso`      |        2 |             5 |      7 |
| `VPROC-0009` | `viso`      |        2 |             5 |      7 |
| `VPROC-0011` | `viso`      |        8 |             0 |      8 |
| `VPROC-0059` | `viso`      |        9 |             0 |      9 |
| `VPROC-0065` | `viso`      |        2 |             0 |      2 |
| `VPROC-0066` | `viso`      |        2 |             4 |      6 |
| **Total**    | —           |   **27** |        **22** | **49** |

Todos los ocho procesos conservan `viso` como propietaria en el corte vigente. Esta concentración es un hecho del catálogo actual y no una regla que reserve los handoffs futuros a VISO.

---

#### 17. Reconciliación por aplicación participante

| Aplicación | Directas | Condicionales |  Total |
| ---------- | -------: | ------------: | -----: |
| `shell`    |        5 |             1 |      6 |
| `anima`    |        7 |             1 |      8 |
| `nexo`     |        3 |             3 |      6 |
| `fogo`     |        2 |             4 |      6 |
| `origo`    |        2 |             4 |      6 |
| `pulso`    |        2 |             4 |      6 |
| `numera`   |        3 |             4 |      7 |
| `aura`     |        2 |             1 |      3 |
| `pass`     |        1 |             0 |      1 |
| **Total**  |   **27** |        **22** | **49** |

Las nueve aplicaciones distintas de `viso` aparecen al menos una vez como participantes del subconjunto vigente.

`aura` conserva relaciones documentales aprobadas, pero su participación física continúa sujeta a readiness, cobertura, despliegue y pruebas; la existencia de la relación no la presenta como operativa.

---

#### 18. Relaciones expresamente excluidas

No pertenecen al universo de 49 por el solo hecho de existir en `PROC-CAT-006`:

- `REFERENCIA_CANONICA` / `REFERENCE_PROJECTION`;
- `REFERENCIA_Y_EVENTO` / `VERSIONED_REFERENCE_PROJECTION`;
- `PROYECCION_Y_EVENTO` / `LIFECYCLE_PROJECTION`;
- `HECHO_Y_PROYECCION` / `IMMUTABLE_FACT_PROJECTION`;
- `SOLICITUD_EFECTO_Y_EVENTO` / `EFFECT_CONFIRMATION_PROJECTION`;
- `SEÑAL_EFECTO_Y_EVENTO` / `EXECUTION_SIGNAL_PROJECTION`;
- `EVENTO_CONCILIACION_Y_PROYECCION` / `RECONCILIATION_PROJECTION`;
- modalidades de análisis y marketing aprobadas por BLOQUE X.

Una señal de ejecución puede contener un handoff operativo dentro de su flujo y un evento puede pertenecer a la clase `HANDOFF_FACT`; ninguno de esos hechos reclasifica automáticamente la relación interaplicación como `SOLICITUD_HANDOFF_Y_EVENTO`.

---

#### 19. Seguridad, privacidad y autoridad

Todo handoff deberá aplicar minimización y finalidad. Solo se transporta el contexto necesario para que la receptora valide y ejecute su responsabilidad.

Queda prohibido incluir por conveniencia:

- credenciales;
- secretos;
- tokens reutilizables como identidad empresarial;
- payloads completos cuando basta una referencia protegida;
- permisos derivados por el cliente;
- datos personales, laborales, médicos o financieros fuera de finalidad;
- información de otras sedes, áreas o recursos que no corresponda al alcance efectivo.

La receptora no hereda autoridad de la emisora. Cada aplicación y backend resuelve nuevamente la decisión aplicable con sus fuentes confiables.

---

#### 20. Evolución y compatibilidad

Una evolución de las relaciones exige preservar identidad y continuidad histórica.

Reglas:

1. cambiar una participante directa a condicional o viceversa es un cambio contractual;
2. agregar o retirar una participante requiere actualizar primero la fuente propietaria;
3. cambiar la propietaria de un proceso no se resuelve editando esta matriz de forma aislada;
4. una relación retirada conserva trazabilidad de handoffs ya emitidos;
5. solicitudes y resultados pendientes deben reconciliarse antes de retirar un consumidor;
6. los consumidores deberán soportar una ventana de compatibilidad cuando exista tráfico pendiente o versiones coexistentes;
7. un contrato desconocido o incompatible falla cerrado;
8. deep links y destinos de retorno se migran sin perder la intención o el proceso en curso;
9. no se recicla una relación histórica para representar otra semántica sin actualización de sus fuentes.

---

#### 21. Estado de materialización física

En el corte vigente:

```text
SHELL-CON-014
→ contrato documental completo
→ 49 relaciones de handoff reconciliadas
→ 27 directas
→ 22 condicionales
→ 8 procesos
→ 9 aplicaciones participantes
→ 0 cambios físicos
→ 0 migraciones
→ 0 cambios Supabase
→ 0 rutas o deep links creados
→ 0 productores o consumidores implementados
```

La tarea no demuestra que las 49 relaciones estén físicamente implementadas ni operativas. Su materialización queda asignada a `E5-GATE-008` y `SHELL-CI-020`; pruebas, build, release, compatibilidad y adopción corresponden respectivamente a `SHELL-CI-001`, `SHELL-CI-002`, `SHELL-CI-003`, `SHELL-CI-005` y `SHELL-CI-006`.

---

#### 22. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Justificación:** `SHELL-CON-014` centraliza relaciones y reglas ya protegidas por requisitos vigentes. `TREQ-INTEGRATION-005` asigna expresamente a esta tarea la preservación de proceso, recurso, actor, sede, área, estado, acción pendiente y destino de retorno, así como la revalidación en la receptora. `TREQ-INTEGRATION-001` protege la compatibilidad de esquemas, dominios y destinos técnicos cuando intervienen enlaces entre aplicaciones; `TREQ-INTEGRATION-003` protege idempotencia y resultado recuperable. `TREQ-PROC-023` a `TREQ-PROC-027` protegen propiedad y consumidoras. `TREQ-PROC-034` protege específicamente que todo traspaso conserve la misma instancia, actores, contexto, territorio, pendientes, evidencia y aceptación; el resto de `TREQ-PROC-033` a `TREQ-PROC-037` cubre continuadores, autoridad, participantes externos y reasignación. No se introduce una relación nueva ni una regla observable distinta que justifique duplicar cobertura.

El Registro Canónico de Requisitos de Prueba permanece sin cambios.

---

#### 23. Decisiones aprobadas

1. `@vento/contracts/handoffs` es el namespace lógico reservado para este contrato.
2. La identidad estática de una relación usa la tupla `ProcessId + propietaria + aplicación participante`; no se inventa un ID serializado paralelo.
3. El corte vigente contiene exactamente 49 relaciones de handoff.
4. Las 49 relaciones pertenecen a exactamente ocho procesos con modalidad `SOLICITUD_HANDOFF_Y_EVENTO`.
5. Existen 27 relaciones directas y 22 condicionales.
6. Las 49 relaciones son únicas por proceso, propietaria y participante.
7. En el corte vigente los ocho procesos de handoff tienen `viso` como propietaria.
8. Las nueve aplicaciones restantes aparecen como participantes al menos una vez.
9. Una relación directa no concede autoridad ni obliga a usar el handoff en toda instancia.
10. Una relación condicional no queda habilitada hasta satisfacer su condición propietaria y readiness.
11. Un handoff conserva el mismo proceso y la misma instancia.
12. Un handoff preserva recurso, actores, contexto, territorio, estado, trabajo pendiente, retorno, evidencia y tiempos aplicables.
13. La receptora vuelve a validar contrato y autoridad.
14. Enviar no equivale a aceptar y recibir no equivale a autorizar.
15. La etapa siguiente no se marca completada por el solo despacho.
16. La aplicación propietaria conserva registro principal, reglas, estado, corrección y cierre.
17. Una participante no escribe directamente el estado privado de la propietaria.
18. `HANDOFF_REQUEST`, `HANDOFF_PROJECTION`, `HANDOFF_FACT` y `BusinessEventId` conservan identidades y responsabilidades separadas.
19. La idempotencia impide doble aceptación, doble efecto y creación paralela de instancia.
20. Deep links y navegación no son autoridad y deben preservar continuidad y retorno.
21. AURA puede aparecer como participante documental sin quedar operativa antes de readiness y pruebas.
22. Las restantes modalidades de consumo no se reclasifican como handoff.
23. Esta tarea no materializa código, package, URL, route, broker, cola, tabla, RPC, Supabase ni consumidor.
24. No se crean ni modifican requisitos `TREQ-*`.
25. `SHELL-CON-015` permanece exclusivamente reservada.

---

#### 24. Criterios de aceptación

- [x] Se identifican exactamente los ocho procesos con modalidad `SOLICITUD_HANDOFF_Y_EVENTO`.
- [x] Se materializan las 49 relaciones interaplicación vigentes.
- [x] Se concilian 27 relaciones directas y 22 condicionales.
- [x] Se comprueban 49 tuplas únicas, cero faltantes y cero duplicados dentro del subconjunto aprobado.
- [x] Cada relación conserva decisión, resultado, estado y bloqueo explícitos.
- [x] La propietaria permanece separada de la aplicación participante.
- [x] Se preserva la diferencia entre relación directa y condicional.
- [x] Se preserva la misma instancia de proceso durante el handoff.
- [x] Se preservan contexto, recurso, territorio, estado, pendiente, retorno, evidencia y aceptación aplicables.
- [x] Se exige revalidación de autoridad en la receptora.
- [x] Se prohíben escrituras cruzadas directas y fuentes competidoras.
- [x] Se separan solicitud, proyección, hecho empresarial y navegación.
- [x] Se conserva idempotencia y resultado recuperable.
- [x] Se preserva la condición diferida de AURA.
- [x] Se reutiliza cobertura `TREQ-*` vigente sin crear ni modificar requisitos.
- [x] No se ejecutan cambios físicos.
- [x] No se desarrolla `SHELL-CON-015`.

---

#### 25. Continuidad

##### ÚLTIMA TAREA APROBADA

SHELL-CON-013 — Crear contrato de eventos empresariales

##### TAREA ACTUAL APROBADA

SHELL-CON-014 — Crear contrato de traspasos entre aplicaciones

##### SIGUIENTE TAREA RESERVADA

SHELL-CON-015 — Crear contrato de tareas pendientes


### ✅ SHELL-CON-015 — Crear contrato de tareas pendientes

**Estado:** APROBADA
**Tarea anterior:** `SHELL-CON-014 — Crear contrato de traspasos entre aplicaciones`
**Tarea siguiente:** `SHELL-CON-016 — Crear contrato de propiedad funcional`
**Tipo de tarea:** Documental
**Bloque:** H — Fundación compartida
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Estado físico:** `DEFINIDO_NO_MATERIALIZADO`
**Cambios físicos:** ninguno
**Resultado TREQ:** `NO GENERA REQUISITOS DE PRUEBA`

#### 1. Propósito

Centralizar el contrato compartido de los ítems de trabajo que representan tareas actuales o pendientes en Vento OS, de forma que SHELL y las aplicaciones consumidoras puedan proyectar foco, cola, estado, prioridad, bloqueo, asignación y continuidad sin crear una fuente de verdad paralela ni transportar autoridad.

El contrato fija la unidad mínima, las separaciones de identidad, los vocabularios conceptuales aprobados y las reglas transversales de elegibilidad, ejecutabilidad, priorización, concurrencia, handoff, sincronización y proyección cross-app.

La tarea no inventa instancias runtime. Un ítem de trabajo existe únicamente cuando una fuente empresarial canónica produce una obligación concreta y trazable.

#### 2. Autoridades consumidas y precedencia

La tarea consume y preserva, sin sustituirlas:

- `SHELL-CON-001`, como autoridad de la raíz compartida `@vento/contracts` y de sus fronteras de pureza contractual;
- `SHELL-CON-002`, como autoridad compartida de `AppCode`;
- `SHELL-CON-009`, como autoridad compartida de `ProcessId`;
- `SHELL-CON-010`, como autoridad compartida de `ProcessStateId`;
- `SHELL-CON-012`, como autoridad compartida de `FunctionalActionId`;
- `SHELL-CON-013`, como autoridad compartida de `BusinessEventId` y de la separación entre definición de evento y ocurrencia runtime;
- `SHELL-CON-014`, como autoridad compartida de handoffs entre aplicaciones y de la preservación de `work_item_id` cuando aplique;
- `UX-BASE-002`, como autoridad de la semántica de tarea actual, ítem de trabajo, clases, estados, readiness, prioridad, colas, claim, interrupción, handoff, offline y recuperación;
- la arquitectura de contexto, autorización y procesos vigente, que decide si una acción puede ejecutarse;
- `SHELL-APP-008`, como tarea posterior propietaria de la proyección de pendientes transversales en SHELL, sin convertir a SHELL en propietario del trabajo empresarial.

Ante una diferencia entre una proyección de SHELL y la fuente propietaria, prevalece la fuente propietaria y la proyección se considera obsoleta hasta su reconciliación.

#### 3. Alcance del contrato

El contrato cubre:

1. identidad de la obligación concreta;
2. vínculo con proceso, instancia, etapa y aplicación propietaria;
3. fuente empresarial y recurso afectado;
4. clase y carril de trabajo;
5. ciclo de vida del ítem;
6. readiness para foco y ejecución;
7. elegibilidad, asignación, oferta, claim y ejecución;
8. contexto, permiso, ubicación y dependencias requeridas;
9. prioridad determinista y explicable;
10. bloqueo, espera, pausa y recuperación;
11. concurrencia, versión, lease e idempotencia;
12. continuidad offline y sincronización pendiente;
13. siguiente acción funcional;
14. handoff y proyección cross-app;
15. eventos correlacionados del ciclo de trabajo;
16. separación entre fuente de verdad, proyección, navegación y autoridad.

Quedan fuera de esta tarea:

- crear tablas, schemas, columnas, API, RPC, colas, workers o migraciones;
- definir una serialización física obligatoria para `work_item_id`;
- crear instancias reales de trabajo;
- decidir permisos, scopes o autorización efectiva;
- decidir rutas, labels, componentes o diseño visual final;
- implementar la bandeja o el foco de SHELL;
- crear eventos empresariales nuevos o renumerar los existentes;
- crear un nuevo modelo de handoff distinto del aprobado en `SHELL-CON-014`.

#### 4. Namespace y propiedad

La superficie lógica compartida de esta tarea es:

```text
@vento/contracts/work-items
```

Su propiedad documental queda en `vento-shell` bajo la autoridad de `@vento/contracts`.

El namespace representa contratos y vocabularios compartidos. No ejecuta mutaciones, no resuelve autorización, no accede directamente a datos, no adjudica tareas y no actúa como scheduler o motor de workflow.

Durante esta fase no se crea paquete, directorio de código, publicación, API ni persistencia física.

#### 5. Unidad contractual e identidad

La unidad contractual es el **ítem de trabajo** identificado por `work_item_id`.

`work_item_id` identifica una obligación runtime concreta. Su valor se trata como referencia opaca: los consumidores no inferirán desde su forma el proceso, aplicación, actor, permiso, prioridad, territorio ni estado.

La identidad del ítem no se sustituye por su estado, asignación, claim, lease, prioridad o proyección de foco. Los cambios de esos atributos se expresan mediante versión y ciclo de vida, no mediante reinterpretación de la identidad.

Separaciones obligatorias:

```text
work_item_id != ProcessId
work_item_id != process_instance_id
work_item_id != ProcessStateId
work_item_id != FunctionalActionId
work_item_id != BusinessEventId
work_item_id != PermissionId
work_item_id != ScreenId
work_item_id != navigation_id
work_item_id != claim_or_lease_ref
work_item_id != handoff_relation
work_item_id != alert_or_notification_id
```

Consecuencias:

- conocer `work_item_id` no autoriza a ver, reclamar, iniciar, completar o cancelar la obligación;
- presentar una tarjeta o abrir un destino no equivale a asignar, reclamar o iniciar;
- una alerta, notificación, mensaje, menú o registro reciente no es un ítem de trabajo si no existe una obligación y una fuente canónicas;
- un handoff puede transportar la referencia del mismo `work_item_id` cuando corresponda, pero no cambia por sí solo su autoridad ni su estado de ejecución.

#### 6. Unidad mínima materializada del contrato

La superficie compartida deberá poder representar los **29 campos contractuales mínimos** aprobados en `UX-BASE-002`:

|    # | Campo                     | Semántica contractual                                                           |
| ---: | ------------------------- | ------------------------------------------------------------------------------- |
|    1 | `work_item_id`            | Identidad opaca de la obligación concreta.                                      |
|    2 | `process_id`              | Referencia al proceso canónico que origina o contiene el trabajo.               |
|    3 | `process_instance_id`     | Referencia a la instancia empresarial concreta.                                 |
|    4 | `process_step`            | Etapa o paso vigente al que pertenece la obligación.                            |
|    5 | `owner_app_code`          | Aplicación propietaria de la fuente y ejecución empresarial.                    |
|    6 | `source_ref`              | Referencia a la fuente canónica de la obligación.                               |
|    7 | `work_item_type`          | Clase contractual del ítem de trabajo.                                          |
|    8 | `work_lane`               | Carril de trabajo aplicable; no concede autoridad por sí mismo.                 |
|    9 | `status`                  | Estado conceptual del ciclo de vida del ítem.                                   |
|   10 | `readiness_status`        | Estado de readiness usado para decidir proyección y ejecutabilidad.             |
|   11 | `assignment_mode`         | Modalidad de asignación vigente sin inferir actor autorizado.                   |
|   12 | `assigned_actor_ref`      | Actor o responsable asignado cuando exista asignación directa.                  |
|   13 | `eligible_actor_set_ref`  | Conjunto resoluble de actores potencialmente elegibles.                         |
|   14 | `queue_ref`               | Cola autorizada que puede contener u ofrecer el trabajo.                        |
|   15 | `required_context_ref`    | Contexto requerido para poder actuar.                                           |
|   16 | `required_permission_ref` | Permiso requerido; la referencia no equivale a concesión.                       |
|   17 | `resource_ref`            | Recurso empresarial al que aplica la obligación.                                |
|   18 | `location_ref`            | Territorio, sede, área, estación o ubicación relevante cuando aplique.          |
|   19 | `available_at`            | Instante desde el que la obligación puede quedar disponible.                    |
|   20 | `due_at`                  | Vencimiento o ventana temporal relevante cuando exista.                         |
|   21 | `priority_class`          | Nivel o clase de prioridad resuelta por política vigente.                       |
|   22 | `priority_policy_version` | Versión de la política con la que se resolvió la prioridad.                     |
|   23 | `blocking_refs`           | Referencias a impedimentos o dependencias que afectan la ejecución.             |
|   24 | `next_action_code`        | Referencia a la siguiente acción funcional aplicable; no autoriza su ejecución. |
|   25 | `work_item_version`       | Versión utilizada para frescura, concurrencia y detección de estado obsoleto.   |
|   26 | `claim_or_lease_ref`      | Reserva o lease vigente cuando la clase de trabajo lo requiera.                 |
|   27 | `idempotency_scope`       | Alcance necesario para evitar toma, inicio o efecto duplicados.                 |
|   28 | `created_at`              | Momento de creación de la obligación.                                           |
|   29 | `updated_at`              | Momento de la última actualización vigente de su proyección contractual.        |

Esta lista define semántica mínima. No fija todavía nombres de tabla, columnas físicas, schema, endpoint, payload de red ni forma de almacenamiento.

#### 7. Clases canónicas de ítems de trabajo

El contrato centraliza exactamente las **8 clases** aprobadas:

| Clase                  | Regla contractual                                                                                           |
| ---------------------- | ----------------------------------------------------------------------------------------------------------- |
| `EXECUTE_STEP`         | Ejecuta un paso operativo y exige el hecho y la evidencia correspondientes.                                 |
| `VERIFY_STEP`          | Verifica una condición o resultado; verificar no equivale a aprobar.                                        |
| `HANDOFF_ACCEPTANCE`   | Acepta custodia o recepción; la responsabilidad cambia únicamente mediante el hecho válido correspondiente. |
| `PERSONAL_OBLIGATION`  | Representa una obligación sobre la propia relación del actor.                                               |
| `SUPERVISORY_RESPONSE` | Resuelve un bloqueo o intervención operativa autorizada sin otorgar administración universal.               |
| `SAFETY_RESPONSE`      | Atiende una condición crítica de seguridad y puede desplazar el foco ordinario conforme a política.         |
| `FOLLOW_UP`            | Reabre atención después de una espera y requiere fecha o condición de reactivación.                         |
| `RECOVERY`             | Reconcilia una operación pendiente o conflicto sin repetir el efecto original.                              |

Ningún consumidor podrá convertir una clase en permiso, rol, prioridad o estado de proceso.

#### 8. Estados canónicos del ciclo de vida

El contrato centraliza exactamente **16 estados conceptuales**:

| Estado                    | Significado contractual                                                      |
| ------------------------- | ---------------------------------------------------------------------------- |
| `NOT_READY`               | Existe obligación futura, pero faltan dependencias.                          |
| `AVAILABLE`               | Puede ser tomada por un actor elegible.                                      |
| `OFFERED`                 | Fue presentada a actor o estación sin asignación definitiva.                 |
| `ASSIGNED`                | Tiene responsable o equipo definido.                                         |
| `CLAIMED`                 | Existe reserva activa para un actor.                                         |
| `IN_PROGRESS`             | La ejecución ya comenzó.                                                     |
| `WAITING`                 | Depende de tiempo, tercero o evento externo esperado.                        |
| `BLOCKED`                 | Existe impedimento que requiere tratamiento.                                 |
| `PAUSED`                  | Existe interrupción controlada con punto de reanudación.                     |
| `COMPLETION_PENDING_SYNC` | El dispositivo conserva evidencia de finalización pendiente de confirmación. |
| `COMPLETED`               | El resultado fue confirmado por la fuente canónica.                          |
| `CANCELLED`               | La obligación fue retirada válidamente.                                      |
| `SUPERSEDED`              | Otra versión u obligación la reemplazó.                                      |
| `EXPIRED`                 | Perdió vigencia sin considerarse completada.                                 |
| `CONFLICT`                | Existe una versión o actor competidor que impide continuar normalmente.      |
| `RECONCILIATION_REQUIRED` | El efecto y la vista no coinciden y requieren reparación.                    |

La implementación podrá especializar estados sin colapsar distinciones empresariales. En particular, `WAITING`, `BLOCKED`, `COMPLETED` y `COMPLETION_PENDING_SYNC` no podrán convertirse en un único estado ambiguo.

#### 9. Estados de readiness para foco y ejecución

La proyección compartida distingue exactamente **7 estados de readiness**:

| Readiness                      | Regla                                                             |
| ------------------------------ | ----------------------------------------------------------------- |
| `EXECUTABLE_NOW`               | El ítem satisface las condiciones vigentes para actuar ahora.     |
| `VISIBLE_NOT_EXECUTABLE`       | Debe ser visible, pero no puede ejecutarse en el contexto actual. |
| `WAITING_EXTERNAL`             | Está a la espera de tiempo, tercero o evento externo.             |
| `BLOCKED_RECOVERABLE`          | Existe bloqueo cuya recuperación corresponde al flujo permitido.  |
| `BLOCKED_REQUIRES_OTHER_ACTOR` | La resolución depende de otro actor o autoridad.                  |
| `STALE_REQUIRES_REFRESH`       | La proyección perdió frescura y debe revalidarse.                 |
| `NOT_ELIGIBLE`                 | El actor o contexto actual no son elegibles para actuar.          |

Una tarea visible pero no ejecutable no ocupa el foco principal salvo cuando resolver, escalar o gestionar esa condición sea la única obligación válida del trabajador.

#### 10. Elegibilidad, asignación, oferta, claim y ejecución

Estas condiciones permanecen separadas:

- **elegibilidad** responde quién podría realizar el trabajo bajo las reglas vigentes;
- **oferta** presenta el trabajo a un actor, equipo o estación sin convertirlo automáticamente en responsable;
- **asignación** define responsable o equipo cuando la política lo exige;
- **claim** reserva temporalmente una obligación para un actor cuando el trabajo es excluyente;
- **ejecución** comienza únicamente cuando existe una acción empresarial válida y autorizada.

Abrir, visualizar, navegar, recibir una notificación o aparecer como candidato no produce claim ni inicio.

La ejecución se atribuye al actor humano efectivo cuando el trabajo sea humano. Una estación o sesión técnica no se convierte en actor por contener una cola.

#### 11. Condiciones acumulativas de ejecutabilidad

Una tarea será ejecutable únicamente cuando satisfaga conjuntamente:

```text
ACTOR EFECTIVO VÁLIDO
+ RELACIÓN LABORAL O PERSONAL VIGENTE
+ ROL Y PERMISO REQUERIDOS
+ TURNO Y CHECK-IN CUANDO APLIQUEN
+ SEDE Y ÁREA COMPATIBLES
+ DISPOSITIVO O ESTACIÓN COMPATIBLE
+ RECURSO Y VERSIÓN VIGENTES
+ DEPENDENCIAS COMPLETAS
+ ESTADO QUE ADMITE LA ACCIÓN
+ NO CONFLICTO EXCLUYENTE
```

El contrato de work items transporta referencias necesarias para resolver estas condiciones, pero no sustituye los motores canónicos de contexto, autorización, estado o concurrencia.

#### 12. Política canónica de foco y prioridad

La selección del foco será determinista, versionada y explicable. No se admite una suma opaca de puntos como fuente autoritativa de prioridad.

Orden conceptual por niveles:

| Nivel | Precedencia                                                     |
| ----: | --------------------------------------------------------------- |
|     0 | Seguridad, emergencia o custodia crítica.                       |
|     1 | Trabajo ya en ejecución que debe continuar.                     |
|     2 | Compromiso inmediato con cliente, producción, entrega o cadena. |
|     3 | Tarea asignada con vencimiento o bloqueo de terceros.           |
|     4 | Tarea disponible priorizada por política.                       |
|     5 | Mantenimiento, seguimiento o trabajo sin urgencia.              |

Dentro de la política podrán intervenir, cuando correspondan:

- fecha requerida y ventana válida;
- SLA;
- secuencia del proceso;
- trabajo ya iniciado;
- asignación directa;
- antigüedad y prevención de starvation;
- proximidad física o compatibilidad de estación;
- agrupación razonable por lote, ruta o ubicación;
- disponibilidad del recurso;
- coste de cambio de contexto;
- carga del actor o equipo;
- prioridad autorizada y su motivo.

No constituyen prioridad autoritativa por sí solos:

- posición manual en una lista sin evento;
- `created_at desc` como regla universal;
- nombre del rol;
- jerarquía de quien envió un mensaje;
- valor económico aislado;
- clasificación de un cliente como importante sin política vigente.

`priority_policy_version` debe permitir explicar con qué política se obtuvo el resultado mostrado.

#### 13. Foco principal y cola secundaria

La experiencia operativa proyecta un **foco principal** y una **cola secundaria** diferenciada conceptualmente en:

- Ahora;
- Después;
- En espera;
- Bloqueadas.

La cola no altera la fuente de verdad ni la autorización. Su orden es una proyección derivada de estado, readiness y política de prioridad.

Las obligaciones restantes pueden permanecer visibles sin competir visual ni semánticamente con la tarea actual y sin ocultar vencimientos, bloqueos o incompatibilidades de contexto.

`SHELL-APP-008` podrá consumir esta proyección para mostrar pendientes transversales. Esa proyección no convierte a SHELL en propietario, ejecutor o autorizador universal.

#### 14. Bloqueo, espera, pausa y recuperación

`WAITING`, `BLOCKED` y `PAUSED` representan situaciones distintas.

Un bloqueo deberá conservar, mediante las referencias empresariales correspondientes:

- causa;
- datos o trabajo preservados;
- responsable de resolver;
- siguiente acción posible;
- escalamiento cuando aplique;
- condición o momento de revisión;
- efecto sobre custodia y continuidad.

Una espera deberá conservar su condición de reactivación. No ocupa el foco principal salvo que el seguimiento de esa espera sea la obligación actual.

Una pausa conserva un punto seguro de reanudación. Una recuperación utiliza `RECOVERY` cuando deba reconciliar o reparar sin repetir el efecto empresarial original.

#### 15. Claim, concurrencia, versión e idempotencia

Para trabajo excluyente:

- el claim será atómico e idempotente;
- cuando aplique, tendrá lease;
- dos actores o dispositivos no podrán iniciar o completar la misma obligación simultáneamente;
- `work_item_version` permitirá detectar proyecciones y comandos obsoletos;
- cancelación, supersesión o cambio de versión invalidarán acciones tardías cuando corresponda;
- `idempotency_scope` impedirá que un reintento replique toma, inicio o efecto empresarial.

Un claim vencido o inválido no concede continuidad por el hecho de que la UI aún muestre el ítem.

#### 16. Offline, frescura y sincronización pendiente

La proyección del ítem deberá declarar suficiente frescura para que el consumidor pueda distinguir una vista vigente de una obsoleta.

Una tarea crítica no podrá reclamarse offline sin la política o lease que lo permita. Una finalización realizada bajo modalidad offline compatible permanecerá en `COMPLETION_PENDING_SYNC` hasta que la fuente canónica confirme el resultado.

Al reconectar o reanudar se revalidarán, según aplique:

- versión del ítem y del recurso;
- actor;
- contexto;
- claim o lease;
- permiso;
- estado y dependencias.

La reconciliación no utilizará last-write-wins destructivo para ocultar un conflicto empresarial.

#### 17. Integración con handoffs

`SHELL-CON-014` conserva autoridad sobre los traspasos entre aplicaciones.

Cuando un handoff corresponda al mismo trabajo:

- puede conservar `work_item_id` como referencia no secreta;
- conserva proceso e instancia;
- conserva recurso, contexto y correlación necesarios;
- enviar u ofrecer no equivale a aceptación;
- el actor saliente conserva la responsabilidad hasta el punto de transferencia aprobado;
- el receptor no queda `IN_PROGRESS` por recibir el handoff;
- la aplicación receptora revalida contexto, autorización, estado y versión antes de actuar.

El handoff no crea una segunda identidad de trabajo salvo que la fuente empresarial produzca realmente una obligación distinta.

#### 18. Integración con acciones y eventos

`next_action_code` identifica la siguiente acción funcional aplicable y, cuando pertenezca al catálogo compartido, se resuelve contra la autoridad de `FunctionalActionId` definida por `SHELL-CON-012`.

La presencia de una acción en el ítem no concede permiso ni garantiza que continúe ejecutable al momento del comando. El propietario revalida estado, versión, actor, contexto y autorización.

`SHELL-CON-013` conserva autoridad sobre `BusinessEventId`. Los eventos de disponibilidad, asignación, claim, inicio, pausa, bloqueo, espera, repriorización, handoff, sincronización pendiente, completion, cancelación y cambios de foco deben permanecer correlacionables con el ítem cuando correspondan, sin convertir el evento en la identidad del ítem.

Presentar o abrir el foco no equivale a iniciar la tarea.

#### 19. Propiedad cross-app y proyección en SHELL

La aplicación indicada por `owner_app_code` conserva la propiedad empresarial de la obligación y de su ejecución.

SHELL y otras consumidoras pueden:

- mostrar una proyección mínima autorizada;
- ordenar una cola derivada;
- explicar por qué una tarea aparece primero;
- abrir un destino o deep link seguro;
- conservar retorno y correlación.

SHELL y otras consumidoras no pueden, por la sola proyección:

- reescribir estado privado de la propietaria;
- adjudicar autoridad;
- fabricar asignación o claim;
- marcar completion;
- imponer prioridad efectiva;
- transportar tokens, permisos, actor autoritativo o estado objetivo mediante navegación.

La aplicación propietaria revalida antes de ejecutar.

#### 20. Seguridad, minimización y estaciones compartidas

Una cola o foco se minimiza según actor, contexto y necesidad. El contrato no exige exponer payloads empresariales completos para poder priorizar o navegar.

En estaciones compartidas permanecen separados:

- cola de estación;
- actor humano;
- foco del actor;
- sesión técnica.

Al cambiar de actor deberán recalcularse elegibilidad y foco. Tareas, datos personales, borradores, claims o autoridad del actor anterior no se heredan por la sesión del dispositivo.

La mera visibilidad de un ítem nunca constituye permiso, elegibilidad, assignment o posibilidad de actuar.

#### 21. Versionado y compatibilidad

Las consumidoras deberán tratar el contrato como una superficie versionable y compatible con despliegues independientes.

Reglas:

1. campos o vocabularios nuevos no podrán reinterpretar silenciosamente valores existentes;
2. un consumidor que no comprenda una versión crítica no inventará estados ni autoridad;
3. las identidades de fuente, proceso, instancia, trabajo, acción y evento permanecen separadas;
4. una proyección obsoleta se refresca o bloquea antes de ejecutar;
5. los cambios físicos futuros deberán conservar compatibilidad con consumidores que permanezcan temporalmente en versiones distintas.

#### 22. Reconciliación de la superficie estática

| Conjunto contractual              | Esperado | Materializado | Faltantes | Duplicados |
| --------------------------------- | -------: | ------------: | --------: | ---------: |
| Campos mínimos                    |       29 |            29 |         0 |          0 |
| Clases de ítem de trabajo         |        8 |             8 |         0 |          0 |
| Estados conceptuales              |       16 |            16 |         0 |          0 |
| Estados de readiness              |        7 |             7 |         0 |          0 |
| Niveles conceptuales de prioridad |        6 |             6 |         0 |          0 |

No se materializa una matriz de instancias runtime porque las tareas pendientes son obligaciones dinámicas producidas por fuentes empresariales. Inventar filas de trabajo actuales sin esas fuentes crearía datos ficticios y una segunda fuente de verdad.

#### 23. Cobertura de prueba vigente no modificada

La semántica centralizada por esta tarea ya está protegida por el bloque vigente `TREQ-UX-024..TREQ-UX-040`, que cubre identidad y fuente del ítem, elegibilidad y claim, prioridad, seguridad, continuidad de trabajo iniciado, foco y colas, acción siguiente, bloqueo y espera, handoff, estaciones compartidas, proyección cross-app, concurrencia, offline, estados sin foco, accesibilidad, métricas y eventos del ciclo de trabajo.

También permanecen aplicables, sin modificación, las coberturas transversales existentes de contratos compartidos, compatibilidad, autorización, integración, procesos y contexto.

La centralización documental de esta tarea no crea comportamiento ejecutable nuevo ni altera una regla protegida existente.

#### 24. Requisitos de prueba derivados

`NO GENERA REQUISITOS DE PRUEBA`

**Requisitos creados:** 0
**Requisitos modificados:** 0

Justificación: el contrato centraliza sin cambiar la semántica ya aprobada para ítems de trabajo y tareas actuales; no añade una obligación verificable nueva, no modifica criterios existentes y no materializa implementación física.

#### 25. Estado de materialización física

Queda **ESPECIFICADO** el contrato documental lógico de `@vento/contracts/work-items` y permanece **NO MATERIALIZADO** como código o paquete ejecutable.

No se crean ni modifican:

- código fuente;
- paquetes físicos;
- tipos TypeScript;
- tablas o migraciones;
- RLS, RPC, funciones o triggers;
- colas o workers;
- endpoints;
- componentes de UI;
- configuración de despliegue.

La materialización física queda asignada a `E5-GATE-008` y `SHELL-CI-020`; `SHELL-CI-001`, `SHELL-CI-002`, `SHELL-CI-003`, `SHELL-CI-005` y `SHELL-CI-006` deberán preservar estas decisiones sin convertir el contrato compartido en motor de negocio o autorización.

#### 26. Criterios de aceptación

La tarea se considera documentalmente completa cuando:

1. existe una unidad inequívoca de trabajo basada en `work_item_id`;
2. las identidades de proceso, instancia, acción, evento, permiso, pantalla, navegación, claim y handoff permanecen separadas;
3. los 29 campos mínimos están representados sin omisiones ni duplicados;
4. las 8 clases de trabajo están representadas sin omisiones ni duplicados;
5. los 16 estados conceptuales están representados sin omisiones ni duplicados;
6. los 7 estados de readiness están representados sin omisiones ni duplicados;
7. los 6 niveles conceptuales de prioridad están representados y su orden es explícito;
8. prioridad, assignment, claim, ejecución y completion no se infieren desde UI o navegación;
9. quedan definidas las condiciones acumulativas de ejecutabilidad;
10. quedan definidos bloqueo, espera, pausa, recuperación, concurrencia y offline;
11. queda preservada la autoridad de la aplicación propietaria en escenarios cross-app;
12. handoffs, acciones y eventos se integran por referencias sin colisionar identidades;
13. no se inventan instancias runtime ni datos empresariales;
14. no se realiza materialización física;
15. se declaran cero cambios a requisitos de prueba porque la cobertura vigente ya protege la semántica centralizada.

#### 27. Decisiones aprobadas

1. El nombre canónico de la unidad compartida es **ítem de trabajo** y su identidad runtime es `work_item_id`.
2. `@vento/contracts/work-items` es el namespace lógico reservado para este contrato.
3. `work_item_id` se trata como referencia opaca y no transporta autoridad semántica por su forma.
4. La superficie mínima contiene exactamente 29 campos contractuales.
5. El vocabulario contiene exactamente 8 clases de trabajo.
6. El ciclo conceptual contiene exactamente 16 estados.
7. La proyección de readiness contiene exactamente 7 estados.
8. La prioridad conserva exactamente 6 niveles conceptuales y debe ser determinista, versionada y explicable.
9. Visibilidad, elegibilidad, oferta, asignación, claim, ejecución y completion son conceptos distintos.
10. SHELL puede proyectar y navegar trabajo, pero la aplicación propietaria conserva ejecución y fuente de verdad.
11. `SHELL-CON-014` conserva autoridad sobre handoffs, `SHELL-CON-012` sobre acciones y `SHELL-CON-013` sobre eventos.
12. Las instancias runtime no forman un catálogo estático y no se inventan en esta tarea documental.
13. No se crea implementación física ni se modifican requisitos `TREQ-*`.

#### 28. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-CON-014 — Crear contrato de traspasos entre aplicaciones`

**TAREA ACTUAL APROBADA**
`SHELL-CON-015 — Crear contrato de tareas pendientes`

**SIGUIENTE TAREA RESERVADA**
`SHELL-CON-016 — Crear contrato de propiedad funcional`


### ✅ SHELL-CON-016 — Crear contrato de propiedad funcional

**Estado:** APROBADA
**Tarea anterior:** `SHELL-CON-015 — Crear contrato de tareas pendientes`
**Tarea siguiente:** `SHELL-CON-017 — Crear contrato de principal técnico de integración`
**Tipo de tarea:** Documental
**Bloque:** H — Fundación compartida
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Estado físico:** `DEFINIDO_NO_MATERIALIZADO`
**Cambios físicos:** ninguno
**Resultado TREQ:** `NO GENERA REQUISITOS DE PRUEBA`

#### 1. Propósito

`SHELL-CON-016` centraliza el contrato compartido que permite identificar qué aplicación gobierna un resultado funcional, un hecho empresarial o una fuente autoritativa sin confundir propiedad con participación, ejecución humana, autorización, persistencia técnica, visualización o consumo.

El contrato hace interoperable una decisión que ya existe en las autoridades funcionales de procesos, capacidades e información:

```text
UN RESULTADO FUNCIONAL ATÓMICO
→ UNA RESPONSABILIDAD EMPRESARIAL IDENTIFICABLE
→ UNA APLICACIÓN PROPIETARIA VIGENTE
→ UNA FUENTE AUTORITATIVA
→ CERO FUENTES MUTABLES COMPETIDORAS
```

La tarea no reasigna procesos ni subcapacidades. Adopta las decisiones propietarias aprobadas y define cómo deben ser referenciadas por contratos compartidos, proyecciones, eventos, handoffs, ítems de trabajo, integraciones y consumidores.

#### 2. Autoridades consumidas y precedencia

Esta tarea consume y preserva, sin sustituirlas:

- `SHELL-CON-001`, como autoridad de la raíz compartida `@vento/contracts` y de su carácter contractual estático;
- `SHELL-CON-002`, como autoridad de `AppCode` y del universo canónico de aplicaciones;
- `SHELL-CON-009`, como autoridad compartida de `ProcessId`;
- `SHELL-CON-012`, como autoridad compartida de `FunctionalActionId`;
- `SHELL-CON-013`, como autoridad compartida de `BusinessEventId`;
- `SHELL-CON-014`, como autoridad del contrato de handoffs entre aplicaciones;
- `SHELL-CON-015`, como autoridad del contrato de ítems de trabajo y de `owner_app_code` en la obligación runtime;
- `CAP-MAP-004`, como autoridad de propiedad candidata, consumidoras y fronteras por capacidad;
- `CAP-MAP-008`, como autoridad de fuente actual, fuente objetivo y estado objetivo para las 217 subcapacidades;
- `CAP-MAP-013`, como autoridad del análisis de duplicación y propiedad competidora;
- `PROC-CAT-005`, mediante `PROC-APPLICATION-OWNERSHIP-REGISTRY-001`, como autoridad de la aplicación propietaria de cada uno de los 69 procesos;
- `UX-BASE-007`, como autoridad de captura única, reutilización trazable y prohibición de recaptura sin razón empresarial;
- `INT-APP-010`, como autoridad de escrituras cross-app, interacción con la propietaria y prohibiciones de mutación ajena;
- los contratos vigentes de contexto y autorización, que deciden quién puede actuar y bajo qué alcance, sin transferir propiedad funcional.

Regla de precedencia:

```text
REGISTRO FUNCIONAL PROPIETARIO
→ decide quién gobierna el resultado

@vento/contracts/ownership
→ proyecta y valida la decisión compartida
→ no crea otra decisión empresarial

CONSUMIDOR
→ usa la proyección
→ no amplía ni sustituye la propiedad
```

Si una proyección compartida difiere de la autoridad funcional vigente, prevalece la autoridad funcional y la proyección queda obsoleta hasta su reconciliación.

#### 3. Resultado canónico

La tarea define la superficie lógica:

```text
@vento/contracts/ownership
```

Su función es exponer una representación compartida, versionable y validable de propiedad funcional sin convertir el package de contratos en motor de negocio, catálogo alternativo de capacidades o base de datos de operación.

El resultado combina tres fuentes de decisión ya aprobadas:

| Capa                    | Autoridad semántica                       | Cobertura adoptada | Uso dentro del contrato                                       |
| ----------------------- | ----------------------------------------- | -----------------: | ------------------------------------------------------------- |
| proceso                 | `PROC-APPLICATION-OWNERSHIP-REGISTRY-001` |        69 procesos | resolver propietaria del resultado principal del proceso      |
| capacidad e información | `CAP-MAP-008`                             | 217 subcapacidades | resolver fuente objetivo, frontera y división de resultados   |
| obligación runtime      | fuente empresarial + `SHELL-CON-015`      |           dinámica | transportar `owner_app_code` de un ítem existente sin crearlo |

No se crea un cuarto registro editable con 69 o 217 filas copiadas. La centralización se materializa mediante referencias normativas y proyecciones deterministas de las autoridades anteriores.

#### 4. Definición de propiedad funcional

La **propiedad funcional** es la responsabilidad empresarial de gobernar el estado autoritativo de un resultado funcional atómico dentro de Vento OS.

Gobernar implica, según aplique:

1. crear o aceptar el registro principal del resultado;
2. aplicar las reglas funcionales que determinan su estado válido;
3. aceptar comandos o acciones autorizadas sobre ese resultado;
4. permitir correcciones controladas;
5. conservar estado y versión vigentes;
6. conservar trazabilidad de cambios relevantes;
7. confirmar los hechos durables que otras aplicaciones pueden consumir;
8. explicar cuál es la referencia autoritativa cuando una proyección difiere;
9. rechazar mutaciones provenientes de una frontera no autorizada;
10. sostener la continuidad del resultado aunque cambie su implementación técnica.

Propiedad funcional no significa que todo trabajo humano ocurra dentro de la aplicación propietaria ni que todos los datos relacionados deban residir físicamente en un mismo esquema.

#### 5. Unidad mínima de propiedad

La unidad mínima es el **resultado funcional atómico gobernable**.

Un resultado es atómico para propiedad cuando puede responder de forma inequívoca:

```text
¿QUÉ HECHO O ESTADO EMPRESARIAL SE GOBIERNA?
¿QUIÉN PUEDE CONFIRMAR SU ESTADO AUTORITATIVO?
¿QUÉ APLICACIÓN CONSERVA SU HISTORIA Y CORRECCIÓN?
¿QUÉ OTRAS APLICACIONES SOLO PARTICIPAN O CONSUMEN?
```

La propiedad no se asigna automáticamente a:

- una aplicación completa por conveniencia;
- una pantalla;
- un módulo;
- un repositorio;
- una tabla;
- una función técnica;
- un dispositivo;
- una sede;
- un actor humano;
- un rol;
- un permiso;
- un evento;
- una cola;
- una integración;
- un documento o archivo.

Cuando una subcapacidad contiene resultados independientes con fuentes distintas, la propiedad se divide por resultado. No se declaran dos propietarias simultáneas del mismo hecho autoritativo.

#### 6. Identidad y ausencia de un identificador paralelo

Esta tarea no crea un identificador serial universal de propiedad funcional.

La identidad de una decisión se resuelve mediante la identidad canónica del sujeto y la autoridad que la define.

Ejemplos:

```text
ProcessId
+ PROC-APPLICATION-OWNERSHIP-REGISTRY-001
→ propietaria del resultado principal del proceso

subcapacidad canónica
+ CAP-MAP-008
→ fuente objetivo del resultado informativo

work_item_id
+ fuente empresarial vigente
→ propietaria de la obligación concreta
```

Por tanto:

```text
ownership_id nuevo = NO REQUERIDO
```

No se concatenarán `app_code`, nombres de módulo, tabla, repositorio o dominio para fabricar una identidad alternativa.

#### 7. Universo de aplicaciones propietarias

Toda referencia interna de aplicación utiliza `AppCode` conforme a `SHELL-CON-002`.

El universo vigente contiene exactamente diez identidades canónicas:

| Orden | `AppCode` |
| ----: | --------- |
|     1 | `shell`   |
|     2 | `anima`   |
|     3 | `viso`    |
|     4 | `nexo`    |
|     5 | `fogo`    |
|     6 | `origo`   |
|     7 | `pulso`   |
|     8 | `numera`  |
|     9 | `aura`    |
|    10 | `pass`    |

Reglas:

1. un repositorio no es un `AppCode`;
2. `hub` no es propietaria canónica: es una identidad local de presentación y no sustituye `shell`;
3. `default` no es propietaria canónica: es un sentinel local y debe resolverse antes de cruzar una frontera contractual;
4. plataforma, ambiente, dispositivo, sede, área, módulo o pantalla no crean aplicaciones propietarias nuevas;
5. una aplicación del catálogo puede existir como identidad sin estar materializada o disponible operativamente;
6. pertenecer al catálogo no concede propiedad sobre ningún resultado concreto.

#### 8. Propiedad de procesos

`PROC-APPLICATION-OWNERSHIP-REGISTRY-001` permanece como única autoridad semántica para la propietaria de proceso.

La proyección compartida adopta exactamente:

```text
69 ProcessId
VPROC-0001..VPROC-0069
69 asignaciones de owner_app_code
10 aplicaciones propietarias utilizadas
1 propietaria por proceso
0 procesos sin propietaria
0 procesos con doble propietaria vigente
```

La adopción no reenumera procesos ni reproduce manualmente su matriz como otra fuente normativa.

Para cada `ProcessId`, la proyección contractual debe poder responder:

- `process_id`;
- `owner_app_code`;
- referencia de autoridad `PROC-CAT-005`;
- versión o procedencia suficiente de la proyección;
- estado de compatibilidad con la autoridad vigente.

La propietaria del proceso gobierna el resultado principal del proceso. Esto no significa que sea propietaria de todos los hechos auxiliares, documentos externos, métricas derivadas o resultados independientes que el proceso consume.

#### 9. Propiedad de capacidades e información

`CAP-MAP-008` permanece como autoridad de fuente objetivo para las 217 subcapacidades.

La proyección compartida adopta exactamente las 217 decisiones sin crear una segunda tabla editable.

El vocabulario de estado objetivo conserva exactamente cinco valores:

| Estado                  | Semántica preservada                                                                          |
| ----------------------- | --------------------------------------------------------------------------------------------- |
| `OBJETIVO_FUERTE`       | una aplicación coincide claramente con el resultado que debe gobernar                         |
| `OBJETIVO_CON_FRONTERA` | una aplicación gobierna un resultado y debe respetar una frontera con otro resultado o fuente |
| `OBJETIVO_DIVIDIDO`     | la subcapacidad contiene resultados independientes con propietarias distintas                 |
| `OBJETIVO_DIFERIDO`     | la dirección propietaria está definida pero no habilita implementación actual                 |
| `SIN_FUENTE_ADECUADA`   | ninguna aplicación actual puede gobernar limpiamente el resultado todavía                     |

Interpretación obligatoria:

```text
OBJETIVO_DIVIDIDO
≠ DOS PROPIETARIAS DEL MISMO HECHO

OBJETIVO_DIVIDIDO
= VARIOS RESULTADOS ATÓMICOS
+ UNA PROPIETARIA POR CADA RESULTADO
```

`SIN_FUENTE_ADECUADA` tampoco autoriza a SHELL, NUMERA, Supabase o un consumidor a apropiarse provisionalmente del dato.

#### 10. Fronteras funcionales heredadas por familia

La centralización preserva las fronteras ya aprobadas:

| Familia  | Propiedad objetivo preservada                                                                                                          |
| -------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| `CAP-01` | VISO gobierna estructura, políticas, riesgos, decisiones y seguimiento administrativo dentro de sus fronteras                          |
| `CAP-02` | VISO gobierna administración laboral; ANIMA gobierna registros personales y asistencia según el resultado                              |
| `CAP-03` | VISO gobierna el resultado interno sin absorber fuentes oficiales externas                                                             |
| `CAP-04` | NEXO gobierna catálogo; FOGO recetas; PULSO oferta vendible                                                                            |
| `CAP-05` | ORIGO gobierna compras y proveedores; NEXO consume el efecto aceptado sobre inventario                                                 |
| `CAP-06` | NEXO gobierna inventario y movimientos; otros dominios originan hechos que producen efectos controlados                                |
| `CAP-07` | NEXO gobierna activos; ejecución técnica externa no sustituye su registro interno                                                      |
| `CAP-08` | FOGO gobierna producción; NEXO gobierna los movimientos de inventario derivados y aceptados                                            |
| `CAP-09` | PULSO gobierna venta y servicio; canales externos permanecen orígenes externos cuando apliquen                                         |
| `CAP-10` | PULSO gobierna relación operativa; PASS identidad y acciones directas del cliente                                                      |
| `CAP-11` | NEXO gobierna traslado interno; PULSO entrega asociada a pedido                                                                        |
| `CAP-12` | PULSO gobierna caja y pago de venta; NUMERA hechos económicos, costos y análisis propios                                               |
| `CAP-13` | NEXO gobierna espacio, activo, novedad y estado internos; proveedor técnico no adquiere esa propiedad                                  |
| `CAP-14` | AURA gobierna comunicación y campaña cuando se materialice; PULSO promociones aplicadas a ventas                                       |
| `CAP-15` | VISO gobierna identidad y acceso; NEXO activos; cada aplicación su configuración; soporte transversal conserva su brecha donde aplique |
| `CAP-16` | documentos y evidencia siguen a la aplicación propietaria del hecho respaldado                                                         |
| `CAP-17` | aplicación de origen gobierna hechos; NUMERA gobierna indicadores, comparaciones y análisis derivados                                  |
| `CAP-18` | aplicación afectada gobierna su incidente local; SHELL coordina sin adquirir propiedad universal                                       |

La tabla conserva fronteras de alto nivel. El detalle por subcapacidad sigue perteneciendo a `CAP-MAP-008`.

#### 11. Separaciones obligatorias

La propiedad funcional es ortogonal a otras responsabilidades.

| Concepto                    | Puede intervenir                                               | No adquiere por ello                              |
| --------------------------- | -------------------------------------------------------------- | ------------------------------------------------- |
| aplicación consumidora      | consulta, proyecta o usa un resultado                          | propiedad del original                            |
| aplicación participante     | ejecuta una etapa propia del proceso                           | propiedad del resultado principal completo        |
| actor humano                | ejecuta, verifica, solicita, aprueba o corrige según autoridad | propiedad de la fuente por su identidad personal  |
| supervisor                  | observa o resuelve bloqueos autorizados                        | administración universal del dominio              |
| aprobador                   | toma una decisión autorizada                                   | ejecución de todos los pasos ni propiedad técnica |
| repositorio                 | contiene código o migraciones                                  | responsabilidad empresarial del hecho             |
| Supabase                    | persiste o ejecuta mecanismos técnicos                         | propiedad funcional universal                     |
| pantalla o navegación       | presenta o conduce hacia una acción                            | autoridad sobre el dato mostrado                  |
| worker o publicador técnico | transporta o procesa efectos                                   | propiedad del proceso atendido                    |
| proveedor externo           | ejecuta o informa una parte externa                            | propiedad automática del estado interno de Vento  |
| documento o archivo         | conserva evidencia                                             | propiedad del hecho respaldado                    |
| analítica                   | deriva indicador o comparación                                 | capacidad para reescribir el hecho fuente         |

#### 12. Captura única y reutilización trazable

Se preserva la regla de `UX-BASE-007`:

```text
UN HECHO EMPRESARIAL
→ UNA FUENTE AUTORITATIVA
→ UNA CAPTURA O PRODUCCIÓN ORIGINAL
→ REUTILIZACIONES TRAZABLES
```

Una aplicación consumidora no solicitará nuevamente un valor únicamente porque no sea la propietaria.

La reutilización podrá consistir, según la semántica ya aprobada, en:

- reutilizar un hecho vigente;
- precargar un valor editable cuando la corrección corresponda al flujo actual;
- mostrar para confirmación;
- mostrar solo como referencia;
- exigir nueva captura cuando existe una nueva observación real;
- exigir observación independiente cuando revelar el valor previo introduciría sesgo;
- impedir reutilización por finalidad, vigencia, sensibilidad o semántica.

Una segunda captura es válida cuando produce evidencia nueva. No es válida cuando solo replica manualmente un valor autoritativo entre aplicaciones.

#### 13. Proyecciones, copias y caché

Una aplicación no propietaria puede mantener una representación local solo si su naturaleza queda explícita.

Clases conceptuales permitidas:

```text
REFERENCE
PROJECTION
CONTROLLED_CACHE
DERIVED_RESULT
EVIDENCE_COPY
```

Reglas:

1. la proyección es reemplazable desde la fuente;
2. la referencia apunta al original y no se convierte en otro maestro;
3. el caché declara frescura suficiente para el uso que soporta;
4. el resultado derivado declara sus fuentes y puede tener propiedad propia únicamente sobre la derivación;
5. una copia de evidencia no adquiere autoridad sobre el hecho;
6. una representación obsoleta no autoriza sobrescribir el original;
7. una pantalla editable sobre una proyección debe enviar una intención o comando al dominio propietario, no convertir la copia en otra fuente mutable.

Una copia que puede cambiar independientemente el mismo estado empresarial deja de ser una proyección controlada y se convierte en propiedad competidora.

#### 14. Escrituras cross-app

`INT-APP-010` conserva autoridad sobre la mutación entre aplicaciones.

Regla principal:

```text
CONSUMIDOR
→ NO ESCRIBE DIRECTAMENTE EL ESTADO PRIVADO DE LA PROPIETARIA

CONSUMIDOR
→ SOLICITA UNA ACCIÓN POR CONTRATO AUTORIZADO

PROPIETARIA
→ REVALIDA AUTORIDAD + ESTADO + VERSIÓN + CONTEXTO
→ APLICA O RECHAZA
→ CONFIRMA EL HECHO RESULTANTE
```

No transfieren propiedad:

- disponibilidad temporal de otra aplicación;
- acceso técnico a la misma base de datos;
- `service_role`;
- una migración;
- retry;
- replay;
- backfill;
- contingencia offline;
- break-glass;
- un evento recibido;
- un handoff;
- un deep link.

La indisponibilidad de la propietaria tampoco crea una propietaria de respaldo por inferencia.

#### 15. Corrección, reversión y conciliación

La corrección de un hecho autoritativo ocurre dentro de la frontera propietaria o mediante un contrato que la propietaria evalúa.

Toda corrección material deberá conservar cuando corresponda:

- referencia al valor o estado anterior;
- motivo;
- actor efectivo;
- autoridad de la acción;
- momento;
- versión;
- evidencia;
- relación con el proceso o recurso;
- efecto sobre consumidoras.

Una consumidora no corrige el original editando su proyección.

Una reversión o compensación crea una operación nueva dentro del dominio que posee el efecto a corregir. No reescribe retrospectivamente un hecho ajeno.

Cuando existan diferencias entre fuente y proyección, la conciliación debe identificar origen, propietaria, versión y resolución; no usar sobrescritura silenciosa como mecanismo de convergencia.

#### 16. Integración con eventos empresariales

`SHELL-CON-013` conserva autoridad sobre `BusinessEventId`.

Un evento empresarial:

- describe un hecho durable ya confirmado;
- transporta la identidad de su productor o propietaria cuando aplique;
- permite que consumidoras reaccionen sin recapturar;
- no representa la totalidad de la fuente de verdad;
- no concede permiso;
- no ordena por sí solo una escritura retrospectiva sobre la emisora;
- no cambia de propietaria porque cambie el broker, worker o publicador técnico.

La aplicación productora de una definición de proceso se mantiene coherente con la propietaria funcional aprobada. Un cambio de propietaria debe resolverse primero en su autoridad funcional y después propagarse al contrato de eventos.

#### 17. Integración con handoffs

`SHELL-CON-014` conserva autoridad sobre los traspasos entre aplicaciones.

Un handoff puede transferir:

- trabajo;
- custodia;
- responsabilidad operativa sobre una etapa;
- contexto necesario;
- correlación;
- referencia al recurso.

No transfiere automáticamente la propiedad funcional del hecho o resultado gobernado.

Cuando la aplicación receptora produce un resultado distinto y autónomo, puede gobernar ese nuevo resultado conforme a la frontera canónica. La recepción de una referencia no la vuelve propietaria del resultado de origen.

#### 18. Integración con ítems de trabajo

`SHELL-CON-015` conserva la semántica de `owner_app_code` dentro de un ítem de trabajo.

La propiedad de una obligación runtime se resuelve desde la fuente empresarial que la creó. Por tanto:

```text
work_item.owner_app_code
→ referencia a AppCode canónico
→ coherente con la fuente que gobierna la obligación
→ no se deriva de la aplicación que la está mostrando
```

SHELL puede proyectar la obligación, priorizar visualmente una cola derivada y abrir el destino autorizado sin convertirse en propietaria del trabajo.

El claim, assignment, permiso, foco o actor efectivo tampoco cambian la aplicación propietaria.

#### 19. SHELL como coordinador, no como propietario universal

`shell` es una identidad canónica de aplicación, pero su papel transversal no le concede propiedad sobre los dominios que coordina.

SHELL puede:

- descubrir aplicaciones disponibles;
- presentar navegación;
- proyectar contexto permitido;
- mostrar pendientes referenciados;
- conservar correlación de navegación;
- indicar cuál aplicación es propietaria;
- dirigir al destino correcto.

SHELL no puede, por esa coordinación:

- convertirse en fuente principal de ventas, compras, inventario, producción, talento o finanzas;
- corregir proyecciones ajenas como si fueran registros propios;
- imponer estado empresarial a otra aplicación;
- fabricar una propietaria para un resultado sin fuente adecuada;
- convertir un dato agregado de varias aplicaciones en reemplazo de sus fuentes.

#### 20. Sistemas externos

Un sistema externo puede conservar propiedad sobre un **hecho externo** que solo ese sistema puede confirmar.

Vento OS conserva, según corresponda:

- referencia externa;
- estado interno de integración;
- decisión propia;
- efecto empresarial interno;
- evidencia necesaria;
- correlación y conciliación.

Ejemplos conceptuales:

```text
BANCO
→ gobierna confirmación externa de su movimiento

VENTO
→ gobierna autorización interna, referencia y conciliación propia

PROVEEDOR DE MENSAJERÍA
→ gobierna sus eventos externos de transporte

VENTO
→ gobierna custodia, compromiso y estado interno de entrega
```

La existencia de un proveedor no elimina la responsabilidad interna de Vento ni lo convierte en propietaria de resultados internos.

#### 21. Documentos, archivos y evidencia

La propiedad documental sigue al hecho respaldado.

```text
ARCHIVO
≠ FUENTE EMPRESARIAL POR SÍ MISMO
```

Un PDF, foto, firma, adjunto o archivo de Storage puede ser evidencia, copia cerrada o soporte. La ubicación física del archivo no redefine la aplicación que gobierna el hecho.

Cuando un documento externo posee validez oficial propia, esa condición se conserva sin convertir la copia interna en la autoridad externa.

#### 22. Datos derivados y analítica

La propiedad de un hecho fuente y la propiedad de un resultado analítico se mantienen separadas.

```text
NEXO / FOGO / ORIGO / PULSO / VISO / OTRA FUENTE
→ gobiernan hechos de origen

NUMERA
→ puede gobernar indicadores, comparaciones, modelos y análisis derivados
→ no reescribe el hecho de origen para hacer coincidir el análisis
```

Un informe no sustituye los hechos con los que fue calculado.

Una corrección de la fuente obliga a recalcular o invalidar la derivación según su contrato, no a conservar dos versiones mutuamente autoritativas del mismo hecho.

#### 23. Cambio de propietaria y versionado

La propiedad funcional no cambia de manera implícita por:

- migrar una tabla;
- mover código entre repositorios;
- cambiar un publicador técnico;
- rediseñar una pantalla;
- desplegar otra aplicación;
- introducir una vista agregada;
- cambiar la aplicación desde la que una persona inicia la acción.

Un cambio de propietaria de proceso requiere primero modificar la autoridad de `PROC-CAT-005` mediante el gobierno canónico correspondiente.

Un cambio de fuente objetivo requiere modificar la autoridad funcional que gobierna esa decisión.

La transición deberá conservar, cuando aplique:

1. propietaria anterior;
2. nueva propietaria;
3. decisión canónica que autoriza el cambio;
4. vigencia efectiva;
5. compatibilidad de contratos;
6. consumidores afectados;
7. estrategia de lectura durante la transición;
8. regla de escritura durante la transición;
9. reconciliación de estados pendientes;
10. evidencia de corte antes de retirar la fuente anterior.

No se admite una ventana indefinida en la que dos aplicaciones puedan mutar el mismo estado como propietarias equivalentes.

#### 24. Propiedad competidora confirmada en el AS-IS

`CAP-MAP-013` conserva un único caso de propiedad funcional competidora confirmado en la línea base revisada:

```text
public.employee_shifts
VISO + ANIMA con capacidad de edición en el AS-IS
```

La frontera objetivo ya aprobada es:

```text
VISO
→ publica o corrige el turno

ANIMA
→ consulta el turno
→ usa el turno dentro de su experiencia y contexto
→ no mantiene una segunda edición independiente del mismo estado
```

Esta tarea clasifica la situación como deuda preexistente de materialización y no ejecuta una migración, cambio de permisos, cambio de RLS, eliminación de endpoint ni modificación de datos.

El estado técnico actual puede conservar mecanismos transitorios hasta ejecutar la transición funcional de `INT-WORK-001` y `INT-WORK-002`, adaptar consumidoras en `SUPA-TRANS-007`, resolver writers y doble escritura en `SUPA-TRANS-008`, probar en `SUPA-TRANS-009`, cerrar seguridad en `SUPA-TRANS-010`, asegurar rollback en `SUPA-TRANS-011`, fijar tipos/contratos en `SUPA-TRANS-014`, materializar el gate en `SUPA-TRANS-015` y abrir cualquier cambio físico únicamente mediante `SHELL-CI-020` después de `E5-GATE-008`. Esa observación no reabre la decisión funcional.

#### 25. Tratamiento de fuente sombra

Una fuente sombra existe cuando un medio secundario termina gobernando en la práctica un estado que debe tener una sola fuente.

Pueden convertirse en fuente sombra si se usan como control paralelo:

- Excel;
- chat;
- papel;
- copia local;
- hoja exportada;
- base secundaria;
- formulario independiente;
- pantalla que escribe otra representación del mismo estado.

Estos medios pueden seguir existiendo como evidencia, contingencia, referencia o herramienta temporal cuando su función esté explícitamente delimitada.

No se promueve una fuente sombra a propietaria por el solo hecho de ser utilizada con frecuencia.

#### 26. Contrato conceptual mínimo

La proyección compartida deberá poder representar, como mínimo, estas dimensiones conceptuales cuando apliquen:

| Dimensión           | Propósito                                                                |
| ------------------- | ------------------------------------------------------------------------ |
| `subject_kind`      | clase de sujeto cuya propiedad se resuelve                               |
| `subject_ref`       | referencia canónica al proceso, subcapacidad, resultado o fuente runtime |
| `owner_app_code`    | `AppCode` de la propietaria vigente                                      |
| `authority_ref`     | autoridad canónica que tomó la decisión                                  |
| `ownership_scope`   | resultado funcional concreto gobernado                                   |
| `source_status`     | estado aplicable de la decisión de fuente cuando corresponda             |
| `boundary_ref`      | referencia a la frontera con otros resultados o consumidoras             |
| `effective_version` | versión o revisión suficiente para detectar proyección obsoleta          |
| `supersedes_ref`    | relación con una decisión anterior cuando exista transición              |

La tabla es una superficie conceptual. No fija schema físico, nombre de tabla, JSON definitivo, API, columna o formato de persistencia.

No todos los sujetos usan todas las dimensiones. El contrato no rellenará valores ficticios para aparentar completitud.

#### 27. Operaciones conceptuales de consulta

La futura superficie compartida deberá permitir expresar semánticamente, sin ejecutar negocio:

```text
resolveProcessOwner(ProcessId)
resolveCapabilitySource(capability_ref)
isCanonicalOwner(AppCode, subject_ref)
assertOwnershipProjectionFresh(subject_ref, effective_version)
```

Estas operaciones representan capacidad contractual de consulta o validación estática. No autorizan mutaciones, no leen directamente la base de datos empresarial y no sustituyen la evaluación runtime de contexto o permisos.

Un consumidor no podrá implementar una tabla local de equivalencias como fuente paralela para resolver estas respuestas.

#### 28. Fallo cerrado y estados no resueltos

Cuando la propiedad no pueda resolverse de manera autoritativa:

- no se infiere desde el nombre de la aplicación;
- no se infiere desde el repositorio;
- no se infiere desde la tabla;
- no se infiere desde el permiso;
- no se infiere desde la pantalla abierta;
- no se infiere desde el último escritor observado;
- no se asigna automáticamente a SHELL;
- no se asigna automáticamente a NUMERA;
- no se asigna automáticamente a Supabase.

El consumidor debe conservar el estado irresuelto y remitirlo a la autoridad propietaria de la decisión.

`SIN_FUENTE_ADECUADA` es un estado funcional explícito, no una invitación a elegir una aplicación por conveniencia.

#### 29. Reconciliación estática

La centralización produce la siguiente reconciliación:

| Conjunto                                                         | Esperado |                 Adoptado o representado | Faltantes | Duplicados o fuente paralela |
| ---------------------------------------------------------------- | -------: | --------------------------------------: | --------: | ---------------------------: |
| asignaciones de propiedad de proceso                             |       69 |              69 por referencia canónica |         0 |                            0 |
| aplicaciones propietarias usadas por el registro de procesos     |       10 |                                      10 |         0 |                            0 |
| decisiones de fuente por subcapacidad                            |      217 |             217 por referencia canónica |         0 |                            0 |
| estados de fuente objetivo                                       |        5 |                                       5 |         0 |                            0 |
| casos confirmados de propiedad funcional competidora en el AS-IS |        1 | 1 preservado como hallazgo preexistente |         0 |                     0 nuevas |

La ausencia de una copia fila por fila dentro de `SHELL-CON-016` es deliberada: las 286 decisiones ya poseen autoridad canónica y copiarlas crearía una segunda superficie susceptible de divergencia.

#### 30. Cobertura de prueba vigente no modificada

La semántica central de esta tarea ya está protegida directamente por:

- `TREQ-INTEGRATION-006`, que exige captura única en la aplicación propietaria, propagación por contratos o eventos y resolución trazable de fuentes competidoras;
- `TREQ-UX-005`, que exige hacer visible la fuente de verdad, el estado confirmado o pendiente y evitar copias mutables competidoras entre superficies.

También permanecen aplicables las coberturas transversales vigentes de contratos compartidos, compatibilidad, procesos, autorización, contexto e integraciones.

La tarea centraliza y hace consumible una semántica ya protegida; no introduce un comportamiento verificable adicional ni modifica criterios existentes.

#### 31. Requisitos de prueba derivados

`NO GENERA REQUISITOS DE PRUEBA`

**Requisitos creados:** 0
**Requisitos modificados:** 0

Justificación: la propiedad por proceso, la fuente objetivo por subcapacidad, la captura única, la prohibición de fuentes competidoras y las fronteras de escritura ya poseen cobertura canónica vigente. Esta tarea no cambia esas obligaciones y no materializa comportamiento ejecutable nuevo.

#### 32. Estado de materialización física

Queda **ESPECIFICADO** el contrato documental lógico de `@vento/contracts/ownership` y permanece **NO MATERIALIZADO** como package, tipo o servicio ejecutable.

No se crean ni modifican:

- código fuente;
- packages físicos;
- tipos TypeScript;
- tablas, vistas o columnas;
- migraciones;
- RLS;
- RPC;
- funciones o triggers;
- datos;
- colas, workers o cron;
- endpoints;
- componentes de interfaz;
- consumidores;
- despliegues.

La materialización queda asignada a `E5-GATE-008` y `SHELL-CI-020`; pruebas, build, release, compatibilidad y actualización de consumidores corresponden a `SHELL-CI-001`, `SHELL-CI-002`, `SHELL-CI-003`, `SHELL-CI-005` y `SHELL-CI-006`, preservando las autoridades aprobadas.

#### 33. Criterios de aceptación

`SHELL-CON-016` queda documentalmente completa cuando:

1. propiedad funcional queda definida sobre un resultado atómico y no sobre una implementación accidental;
2. `@vento/contracts/ownership` queda reservado como superficie lógica sin materialización física;
3. las 69 asignaciones de propiedad de proceso se adoptan desde `PROC-APPLICATION-OWNERSHIP-REGISTRY-001` sin duplicarlas;
4. las 217 decisiones de fuente objetivo se adoptan desde `CAP-MAP-008` sin duplicarlas;
5. se conservan exactamente los diez `AppCode` vigentes como universo de identidad de aplicaciones;
6. se conservan exactamente los cinco estados de fuente objetivo;
7. `OBJETIVO_DIVIDIDO` se interpreta como resultados separados y no como doble propietaria del mismo hecho;
8. propiedad permanece separada de actor, rol, permiso, aprobación, participación, consumo, repositorio, Supabase, almacenamiento, pantalla, navegación y publicador técnico;
9. captura única y reutilización trazable quedan vinculadas a la fuente autoritativa;
10. una proyección o caché no puede convertirse en fuente mutable competidora;
11. corrección, reversión y conciliación preservan la frontera propietaria y la historia;
12. eventos, handoffs e ítems de trabajo conservan sus identidades y responsabilidades separadas;
13. sistemas externos conservan sus hechos externos sin apropiarse del estado interno de Vento;
14. SHELL conserva coordinación y navegación sin propiedad universal;
15. el caso competitivo de `employee_shifts` queda reconocido como deuda AS-IS con frontera objetivo preservada;
16. un cambio de propietaria exige decisión canónica explícita y transición controlada;
17. no se crea un `ownership_id` paralelo ni un registro editable duplicado;
18. no se ejecutan cambios físicos;
19. se declaran cero cambios de requisitos de prueba porque la cobertura vigente ya protege la semántica centralizada.

#### 34. Decisiones aprobadas

1. La unidad mínima de propiedad es el resultado funcional atómico gobernable.
2. Cada resultado autoritativo tiene una sola aplicación propietaria vigente dentro de una versión efectiva.
3. `@vento/contracts/ownership` es el namespace lógico reservado para la proyección compartida de propiedad funcional.
4. La tarea no crea un identificador serial universal de ownership.
5. `PROC-APPLICATION-OWNERSHIP-REGISTRY-001` conserva autoridad sobre las 69 propietarias de proceso.
6. `CAP-MAP-008` conserva autoridad sobre las 217 decisiones de fuente objetivo por subcapacidad.
7. La centralización adopta esas 286 decisiones por referencia y no crea otra matriz editable.
8. El universo de aplicaciones sigue siendo exactamente el conjunto de diez `AppCode` aprobado.
9. Los cinco estados de fuente objetivo se conservan sin reinterpretación.
10. `OBJETIVO_DIVIDIDO` representa varios resultados independientes, no dos propietarias del mismo hecho.
11. Propiedad funcional no equivale a autorización, rol, actor, aprobación, participación, consumo, persistencia, presentación ni ejecución técnica.
12. Una proyección, referencia, caché o evidencia no adquiere propiedad del original.
13. Un hecho empresarial se captura o produce una vez en su fuente autoritativa y se reutiliza de forma trazable.
14. Una escritura cross-app se expresa mediante un contrato autorizado y es evaluada por la propietaria; no mediante mutación libre del estado ajeno.
15. Eventos comunican hechos confirmados y no transfieren propiedad.
16. Handoffs transfieren trabajo o custodia según su contrato y no transfieren propiedad funcional automáticamente.
17. `work_item.owner_app_code` se resuelve desde la fuente empresarial de la obligación, no desde la aplicación que muestra la tarea.
18. SHELL coordina, proyecta y navega sin convertirse en fuente empresarial universal.
19. Sistemas externos pueden gobernar hechos externos; Vento gobierna sus referencias, decisiones y efectos internos.
20. NUMERA puede gobernar resultados analíticos derivados sin reescribir hechos de origen.
21. Documentos y evidencia siguen al hecho que respaldan y no se vuelven fuente autoritativa por ubicación física.
22. El caso VISO/ANIMA sobre `employee_shifts` permanece como conflicto AS-IS preexistente; la frontera objetivo conserva a VISO para publicación/corrección del turno y a ANIMA como consumidora de ese estado.
23. Cambiar repositorio, tabla, publicador, UI o tecnología no cambia propiedad funcional.
24. Un cambio de propietaria exige una decisión canónica explícita, vigencia y transición controlada.
25. No se modifica código, datos, Supabase, packages físicos ni requisitos de prueba.

#### 35. Continuidad

##### ÚLTIMA TAREA APROBADA

SHELL-CON-015 — Crear contrato de tareas pendientes

##### TAREA ACTUAL APROBADA

SHELL-CON-016 — Crear contrato de propiedad funcional

##### SIGUIENTE TAREA RESERVADA

SHELL-CON-017 — Crear contrato de principal técnico de integración
