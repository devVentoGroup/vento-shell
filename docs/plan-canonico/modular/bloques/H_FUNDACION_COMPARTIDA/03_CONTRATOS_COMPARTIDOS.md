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
22. la migración física se realiza gradualmente mediante las tareas `SHELL-MIG-*` propietarias;
23. esta tarea no modifica código, package, consumidores, Supabase, CI, releases ni continuidad;
24. `SHELL-CON-003` permanece como única tarea siguiente reservada.

---

#### 20. Hallazgos y destinos exactos

| Hallazgo                                                                           | Estado                      | Destino exacto / condición de salida                                                                              |
| ---------------------------------------------------------------------------------- | --------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `@vento/contracts` aún no está materializado físicamente                           | esperado por fase           | implementación solo después de la puerta física aplicable                                                         |
| SHELL mantiene una lista local de cinco aplicaciones                               | `LEGACY_ACTIVO`             | `SHELL-MIG-001`, `SHELL-MIG-002`, `SHELL-MIG-003` y lote de migración aplicable                                   |
| consumidores mantienen `AppSwitcherItem.id: string`                                | `LEGACY_ACTIVO`             | `SHELL-MIG-001`, `SHELL-MIG-003`, `SHELL-MIG-005` y pruebas de paridad en `SHELL-MIG-007`                         |
| `hub` aparece como identidad local de presentación                                 | `NO_CANONICO_COMO_APP_CODE` | converger a referencia canónica `shell` durante el lote propietario; retiro legacy en `SHELL-MIG-008`             |
| `default` aparece como sentinel en configuración local                             | `NO_CANONICO_COMO_APP_CODE` | resolverlo antes de una frontera `AppCode` durante `SHELL-MIG-003`; retirar propagación legacy en `SHELL-MIG-008` |
| VISO mantiene una unión local que no representa el universo completo               | `LEGACY_ACTIVO`             | reemplazo por tipo derivado dentro del lote de consumidor definido en `SHELL-MIG-002` y `SHELL-MIG-003`           |
| campos de dispositivo para aplicación permanecen como strings                      | `LEGACY_ACTIVO`             | tipado/validación al adoptar contratos; integración mediante `SHELL-MIG-003` y tareas de dispositivo propietarias |
| repositorio AURA no está confirmado                                                | `PENDIENTE_DE_EVIDENCIA`    | `AURA-AUD-010`; no altera el código canónico `aura`                                                               |
| códigos de permisos completos todavía no se centralizan                            | `RESERVADO_POR_SECUENCIA`   | `SHELL-CON-003`                                                                                                   |
| errores/diagnósticos específicos para código desconocido todavía no se centralizan | `RESERVADO_POR_SECUENCIA`   | `SHELL-CON-008`                                                                                                   |

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
