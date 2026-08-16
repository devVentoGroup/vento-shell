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

| Hallazgo                                                                        | Estado                               | Destino exacto                                                                                                                                         |
| ------------------------------------------------------------------------------- | ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| helpers actuales aceptan `string` y concatenan `appId.code`                     | `LEGACY_ACTIVO`                      | `SHELL-AUTH-004`; `SHELL-AUTH-005`                                                                                                                     |
| `PermissionKey` no existe todavía como tipo runtime canónico materializado      | `DEFINIDO_NO_MATERIALIZADO`          | generación física conforme a `AUTH-CAT-018` dentro del ciclo de implementación autorizado                                                              |
| cadenas manuales y construcción dinámica permanecen en consumidores             | `LEGACY_ACTIVO`                      | `AUTH-CAT-019`; `SHELL-AUTH-004`; `SHELL-AUTH-005`                                                                                                     |
| aliases requieren frontera explícita y telemetría                               | `CONTRATO_DEFINIDO`                  | `AUTH-CAT-019`; `SHELL-MIG-003`                                                                                                                        |
| 21 permisos amplios no pueden incorporarse a `PermissionKey`                    | `LEGACY_DECOMPOSE_REQUIRED`          | conservar en `legacy-permissions.json`; su resolución funcional permanece gobernada por las decisiones de catálogo y tareas propietarias de aplicación |
| `nexo.inventory.remissions.dispatch` sale del conjunto activo y queda bloqueado | `deprecated_split_pending_migration` | conservar en `legacy-permissions.json`; sustitución contractual por `accept_custody` + `start_transit`, con `deliver` como capacidad independiente     |
| 14 claves técnicas no pueden reactivarse como capacidades                       | `RETIRED_TECHNICAL`                  | conservar en `retired-permissions.json`; migración de superficies mediante permisos funcionales y retiro en `SHELL-MIG-008`                            |
| códigos de error para referencias inválidas pertenecen a otra responsabilidad   | `RESERVADO_POR_SECUENCIA`            | `SHELL-CON-008`                                                                                                                                        |

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

Los consumidores se migrarán de forma gradual y reversible mediante las tareas `SHELL-AUTH-*`, `SHELL-CTX-*` y `SHELL-MIG-*` propietarias, sin exigir un corte simultáneo de todos los repositorios.

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

| Hallazgo verificable                                                           | Disposición documental                                                                                   |
| ------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------- |
| `packages/contracts` aún no existe físicamente                                 | materialización posterior bajo la familia compartida ya reservada; esta tarea no crea archivos de código |
| `@vento/contracts/authorization` no está publicado físicamente                 | su publicación sigue sujeta a implementación, pruebas contractuales y CI                                 |
| `packages/os-context` existe y contiene tipos de contexto parciales            | no se convierte en fuente alternativa de scopes; `SHELL-CON-007` centraliza los tipos de contexto        |
| strings externos pueden transportar códigos de scope                           | deberán validarse contra el contrato compartido antes de convertirse en valor canónico                   |
| perfiles como `SITE-READ` o `INTERSECT` aparecen en documentación del catálogo | permanecen perfiles de política y no miembros de `PermissionScopeCode`                                   |
| los 140 permisos ya poseen contrato de catálogo congelado                      | no se reclasifican durante `SHELL-CON-006`                                                               |

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

| Contrato | `contract_version` | `schema_version` | Disposición en esta tarea |
| --- | --- | --- | --- |
| `AccessContext` | `1.0.0` | `1.0.0` | centralizar tipos de contexto real |
| `AuthorizationDecision` | `1.0.0` | `1.0.0` | conservar como contrato relacionado; no redefinir decisión |
| `SimulationContext` | `1.0.0` | `1.0.0` | centralizar como contexto hipotético separado |
| `SimulatedAuthorizationDecision` | `1.0.0` | `1.0.0` | conservar como decisión hipotética separada |

Conciliación:

| Dimensión | Resultado |
| --- | ---: |
| Familias contractuales nuevas | **0** |
| Contratos de respuesta nuevos | **0** |
| Cambios de forma en `AccessContext@1.0.0` | **0** |
| Cambios de forma en `SimulationContext@1.0.0` | **0** |
| Cambios de `contract_version` | **0** |
| Cambios de `schema_version` | **0** |
| Cambios de huella de release | **0** |
| Roles base admitidos por el tipo vigente | **8** |
| Roles operativos admitidos por el tipo vigente | **12** |
| Aplicaciones canónicas reutilizables como `AppCode` | **10** |
| Cambios físicos autorizados | **0** |

---

#### 3. Fuentes y precedencia

Esta tarea conserva y reconcilia las siguientes decisiones aprobadas:

| Fuente | Uso vinculante |
| --- | --- |
| `docs/plan-canonico/modular/01_PROTOCOLO.md` | continuidad, granularidad, trazabilidad y requisitos de prueba |
| `docs/plan-canonico/modular/delivery-contract.json` | forma del artefacto documental y coordinación del registro de requisitos |
| `docs/plan-canonico/modular/active-sequence.json` | continuidad vigente del BLOQUE H |
| `AUTH-MOD-020` | arquitectura de identidad, contexto, autorización y presentación |
| `AUTH-MOD-021` | octavo `BaseRoleCode`, `trabajador_operativo`, y obligación explícita de actualizar tipos de contexto sin cambiar `AccessContext@1.x` |
| `AUTH-CTX-001` | forma raíz y principios de `AccessContext` |
| `AUTH-CTX-002` | separación entre contexto y `AuthorizationDecision` |
| `AUTH-CTX-003` | separación de `SimulationContext` y decisiones hipotéticas |
| `AUTH-CTX-004` | versionado, metadatos comunes, serialización y huella de la familia de contratos |
| `AUTH-CTX-005` a `AUTH-CTX-015` | formas y semántica de los nodos internos del contexto real |
| `SHELL-CON-002` | `AppCode` canónico de diez aplicaciones |
| `SHELL-CON-004` | `BaseRoleCode` canónico de ocho roles |
| `SHELL-CON-005` | `OperationalRoleCode` canónico de doce roles |
| `SHELL-CON-006` | `PermissionScopeCode` y separación entre alcance y contexto |
| `SHELL-AUTH-001` y `SHELL-CTX-001` | destino de materialización compartida posterior |

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

| Elemento | Estado actual | Disposición |
| --- | --- | --- |
| `vento.authorization.response-contracts@1.0.0` | publicación contractual documental | conservar inmutable |
| `@vento/contracts/authorization` | no publicado físicamente como fuente completa de los contratos | materialización posterior |
| `@vento/os-context@0.1.0` | package físico parcial existente | conservar como implementación parcial hasta migración controlada |
| `EffectiveContext` | tipo físico plano y parcial | compatibilidad temporal; no fuente semántica canónica |
| `EffectiveContextSource` | clasificación física existente | no promover a discriminante canónico de `AccessContext` |
| `ContextSimulationInput` | entrada física de simulación existente | no confundir con `SimulationContext@1.0.0` |
| RPC `get_effective_context_v1` | consumidor físico actual | migración posterior mediante las tareas propietarias |
| RPC `has_effective_permission_v1` | devuelve booleano físico actual | no define la forma de `AuthorizationDecision` |
| cambios físicos en esta tarea | no autorizados | ninguno |

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

| Identidad contractual | Disposición | Regla principal |
| --- | --- | --- |
| `PrincipalContext` | CENTRALIZAR | representa el principal autenticado; no el actor empresarial |
| `EffectiveActorContext` | CENTRALIZAR | representa el actor atribuible; no hereda identidad del dispositivo |
| `DomainIdentityContext` | CENTRALIZAR | representa identidad laboral, cliente, dispositivo o sistema sin mezclarlas |
| `EmployeeContext` | CENTRALIZAR | representa identidad laboral mínima; no permisos ni territorio operativo |
| `BaseRoleContext` | CENTRALIZAR | usa el `BaseRoleCode` vigente y no concede por nombre de rol |
| `AssignedSiteContext` | CENTRALIZAR | representa asignación laboral, no sede operativa |
| `AssignedAreaContext` | CENTRALIZAR | representa asignación laboral, no área operativa |
| `AdministrativeCoverageContext` | CENTRALIZAR | delimita cobertura del carril base; no permiso |
| `ActiveShiftContext` | CENTRALIZAR | snapshot de turno publicado y vigente |
| `ActiveCheckinContext` | CENTRALIZAR | sesión de asistencia activa y coherente; no turno |
| `OperationalRoleContext` | CENTRALIZAR | usa `OperationalRoleCode` y deriva del turno vigente |
| `OperationalSiteContext` | CENTRALIZAR | sede exacta del turno; no selector ni recurso |
| `OperationalAreaContext` | CENTRALIZAR | área exacta del turno cuando aplica |
| `DeviceContext` | CENTRALIZAR | restricción de dispositivo; nunca fuente de autoridad adicional |
| `LaneReadiness` | CENTRALIZAR | preparación estructural del carril; nunca decisión final |
| `StructuralIssue` | CENTRALIZAR FORMA | forma compartida; catálogo exacto de códigos queda reservado a `SHELL-CON-008` |
| `ResolutionMetadata` | CENTRALIZAR | procedencia y versiones de resolución; no autorización |

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

| Campo contextual | Tipo compartido reutilizado | Regla |
| --- | --- | --- |
| `EmployeeContext.base_role_code` | `BaseRoleCode` | ocho miembros vigentes |
| `BaseRoleContext.role_code` | `BaseRoleCode` | ocho miembros vigentes |
| `ActiveShiftContext.operational_role_code` | `OperationalRoleCode` | doce miembros vigentes |
| `OperationalRoleContext.role_code` | `OperationalRoleCode` | doce miembros vigentes |
| `DeviceContext.allowed_application_codes[]` | `AppCode` | diez aplicaciones canónicas |

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

| Superficie actual | Disposición |
| --- | --- |
| `source: EffectiveContextSource` | COMPATIBILIDAD; no discriminante raíz canónico |
| `session_mode` abierto con `string` | COMPATIBILIDAD; no se usa para reemplazar principal, actor o dispositivo |
| `app_code` | no pertenece al snapshot raíz de `AccessContext`; la aplicación solicitada se evalúa posteriormente |
| `user_id` | no reemplaza `principal`, `domain_identity`, `actor_effective` ni `employee` |
| `real_administrative_role` | RETIRAR COMO FUENTE CANÓNICA; sustituido conceptualmente por `BaseRoleContext` |
| `effective_administrative_role` | RETIRAR COMO FUENTE CANÓNICA; no existe rol administrativo efectivo alternativo |
| `effective_operational_role` | COMPATIBILIDAD; debe converger en `OperationalRoleContext` |
| `site_id`, `area_id`, `area_kind` planos | COMPATIBILIDAD; deben converger en nodos administrativos/operativos separados |
| `shift_id` plano | COMPATIBILIDAD; debe converger en `ActiveShiftContext` y referencias dependientes |
| `simulation_id` dentro del contexto real | NO CANÓNICO; la simulación pertenece a `SimulationContext` |
| `shared_device_id` plano | COMPATIBILIDAD; debe converger en `DeviceContext` |
| `is_simulation` | NO CANÓNICO en `AccessContextV1`; no se usa para mutar un contexto real |
| `is_shared_device` | derivable del principal/dispositivo; no sustituye discriminantes publicados |
| `bypass_applied` | PROHIBIDO COMO AUTORIDAD; ningún bypass forma parte del contexto canónico |
| `can_operate` | PROHIBIDO COMO DECISIÓN; se reemplaza por `lane_readiness` y evaluación posterior |
| `blocked_reasons` | COMPATIBILIDAD; no sustituye `structural_issues`, `reason_codes` ni razones de decisión |
| `metadata: Record<string, unknown>` | no puede absorber propiedades contractuales omitidas |

La migración física de estas superficies no ocurre en `SHELL-CON-007`.

---

#### 27. Distribución física posterior

Las responsabilidades quedan asignadas sin pendientes narrativos:

| Resultado físico futuro | Tarea propietaria |
| --- | --- |
| estructura, exports, versionado y compatibilidad del SDK único | `SHELL-AUTH-001` |
| módulo contextual dentro de `@vento/os-context` | `SHELL-CTX-001` |
| consumo canónico de turno y check-in | `SHELL-CTX-002` |
| proyecciones seguras de sede y área | `SHELL-CTX-003` |
| readiness sin booleanos de autorización | `SHELL-CTX-004` |
| razones seguras de bloqueo contextual | `SHELL-CTX-005` |
| caché compartida, single-flight y frescura | `SHELL-CTX-006` |
| adapters de servidor/cliente y proyecciones seguras | `SHELL-AUTH-002` |
| lint, métricas y gates contra consumidores legacy | `SHELL-AUTH-004` |
| migración final de consumidores | `SHELL-AUTH-005` |
| productor autoritativo de contexto en backend | `AUTH-DB-033` |
| token/frescura e invalidación autoritativa | `AUTH-DB-035` |
| productor de decisión autoritativa | `AUTH-DB-034` |
| persistencia/backend compartido correspondiente | `AUTH-DB-032` |

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

| ID | Regla protegida | Riesgo | Destino de implementación |
| --- | --- | --- | --- |
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


### [ ] SHELL-CON-008 — Centralizar códigos de error

### [ ] SHELL-CON-009 — Centralizar identificadores de procesos
### [ ] SHELL-CON-010 — Centralizar estados de procesos
### [ ] SHELL-CON-011 — Centralizar identificadores de pantallas
### [ ] SHELL-CON-012 — Crear contrato de acciones funcionales
### [ ] SHELL-CON-013 — Crear contrato de eventos empresariales
### [ ] SHELL-CON-014 — Crear contrato de traspasos entre aplicaciones
### [ ] SHELL-CON-015 — Crear contrato de tareas pendientes
### [ ] SHELL-CON-016 — Crear contrato de propiedad funcional
