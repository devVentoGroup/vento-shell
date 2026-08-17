## AUTORIZACIÓN Y CONTEXTO COMPARTIDOS

Este archivo materializa la frontera compartida aprobada por
`AUTH-CTX-027` y consolida las tareas que anteriormente estaban mezcladas
con normalización de datos.

Arquitectura obligatoria:

```text
@vento/contracts/authorization
→ contratos, catálogos, schemas y códigos

@vento/os-context
→ adapters, scopes por solicitud, proyecciones seguras,
  compatibilidad temporal y utilidades de prueba

Supabase
→ get_access_context, evaluate_authorization,
  resolvers privados, datasets y persistencia
```

No se crearán paquetes paralelos `@vento/auth` ni
`@vento/operational-context`.

### Fundación del SDK de autorización

### ✅ SHELL-AUTH-001 — Consolidar @vento/os-context como SDK canónico de contexto y autorización

**Estado:** APROBADA
**Tarea anterior:** SHELL-NATIVE-003 — Mantener UI React Native separada
**Tarea siguiente:** SHELL-AUTH-002 — Implementar adapters de servidor, cliente y proyecciones seguras
**Tipo de tarea:** documental — definición global única del SDK canónico `@vento/os-context`, con futura materialización física `SHELL-AUTH-001::<implementation_unit_id>` una sola vez por unidad de implementación
**Bloque:** BLOQUE H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md`
**Estado físico resultante:** `CONTRATO_GLOBAL_DEL_SDK_OS_CONTEXT_ESPECIFICADO`; 1 identidad de SDK; 4 subpaths públicos; 6 operaciones server reservadas; 5 familias legacy aisladas; 0 unidades materializadas; 0 releases publicadas por esta tarea
**Cambios físicos autorizados:** ninguno durante el marcador global
**Requisitos de prueba creados o modificados:** 6 creados (`TREQ-SHELL-061` a `TREQ-SHELL-066`)
**Modalidad:** `PER_IMPLEMENTATION_UNIT`

---

#### 1. Propósito

`SHELL-AUTH-001` consolida `@vento/os-context` como el único SDK compartido de Vento OS para consumo runtime de contexto y autorización, sin convertir el package en fuente paralela de contratos, en evaluador empresarial alternativo ni en capa de interfaz.

La tarea resuelve contractualmente el estado transitorio del package físico actual y fija una sola arquitectura de consumo:

```text
@vento/contracts/authorization
→ contratos, catálogos, schemas, códigos y validadores puros

@vento/os-context
→ SDK runtime único
→ server / client / testing / legacy
→ adapta, valida, proyecta y coordina consumo

Supabase / backend canónico
→ produce contexto y decisión autoritativos
→ resolutores, evaluador, persistencia y políticas

APLICACIONES
→ consumen versiones publicadas
→ no reconstruyen contratos ni autorización
```

El marcador global define identidad, superficie pública, dependencias, versionado, compatibilidad, deprecación, gates, pruebas y lineage. No modifica todavía `packages/os-context`, aplicaciones consumidoras, SQL, RPC, RLS ni Supabase.

---

#### 2. Modalidad canónica y ciclo

La topología aplicable es `PER_IMPLEMENTATION_UNIT`.

```text
MARCADOR GLOBAL SHELL-AUTH-001
→ define una sola vez el contrato del SDK
→ se cierra documentalmente
→ no publica ni modifica código

DELIV-PKG-025::<package_id>
→ asigna implementation_unit_id y package_id propietario

E5-GATE-008::<package_id> = PASS
→ habilita materialización física

SHELL-AUTH-001::<implementation_unit_id>
→ materializa una sola estructura física del SDK para la unidad
→ N package_id pueden consumirla mediante lineage
→ no duplica SDK, exports, fixtures ni compatibilidad por paquete
```

**Dependencia para desarrollar:** `SHELL-NATIVE-003`.

**Dependencias para ejecutar una instancia:**

- `DELIV-PKG-025::<package_id>` con `implementation_unit_id` asignado;
- `E5-GATE-008::<package_id> = PASS` para el paquete propietario;
- baseline y commit exactos de `devVentoGroup/vento-shell`;
- versión contractual de `@vento/contracts/authorization` identificada;
- matriz de compatibilidad aplicable;
- consumidores declarados para la unidad.

---

#### 3. Fuentes contractuales preservadas

Esta tarea consume y preserva, sin reabrir su significado:

| Fuente               | Regla preservada                                                                                         |
| -------------------- | -------------------------------------------------------------------------------------------------------- |
| `AUTH-CTX-027`       | un solo SDK `@vento/os-context`; fronteras `server`, `client`, `testing`, `legacy`; consumo centralizado |
| `SHELL-PKG-001`      | distribución mediante packages npm privados e inmutables desde `vento-shell`                             |
| `SHELL-PKG-002`      | SemVer independiente; `0.1.0` transitorio; primera estable `1.0.0`; dependencias VENTO exactas           |
| `SHELL-PKG-004`      | TypeScript `>=5 <6`; Supabase JS `>=2.90.0 <3`; sin React/UI/Tailwind; matriz por consumidor             |
| `SHELL-PKG-005`      | deprecación explícita, inventario, reemplazo, ventana y puerta de retiro                                 |
| `SHELL-CON-001`      | `@vento/contracts` como autoridad estática; `@vento/os-context` como runtime SDK; no packages paralelos  |
| `SHELL-CON-002..006` | `AppCode`, `PermissionKey`, `BaseRoleCode`, `OperationalRoleCode` y `PermissionScopeCode` compartidos    |
| `SHELL-CON-007`      | `AccessContextV1`, `SimulationContextV1` y decisiones separados; `EffectiveContext` actual no canónico   |
| `SHELL-CON-008`      | razones y problemas estructurales cerrados; el SDK consume códigos y no los inventa                      |
| `SHELL-NATIVE-002`   | validación fail-closed y autoridad técnica de contratos/validadores en `@vento/contracts`                |
| `SHELL-NATIVE-003`   | ninguna API neutral o runtime compartida adquiere dependencia de renderer por conveniencia               |

La precedencia de autoridad queda:

```text
CONTRATO CANÓNICO
→ @vento/contracts/authorization
→ backend autoritativo
→ @vento/os-context
→ proyección segura / consumidor
```

Nunca:

```text
shape legacy de una aplicación
→ redefinir contrato
```

---

#### 4. Línea base física verificable

El estado previo al marcador global es:

| Elemento                         | Estado observado                                                                                        | Disposición                                                           |
| -------------------------------- | ------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| `packages/os-context`            | existe en `vento-shell`                                                                                 | conservar identidad; redefinir contractualmente antes de materializar |
| package                          | `@vento/os-context@0.1.0`, `private: true`, ESM                                                         | `WORKSPACE_TRANSITORIO`; no release estable                           |
| export raíz                      | `.` apunta directamente a `./src/index.ts`                                                              | `NO_PUBLICABLE_COMO_ESTABLE`                                          |
| subpaths públicos                | ninguno declarado                                                                                       | sustituir por cuatro fronteras explícitas                             |
| peer Supabase                    | `@supabase/supabase-js >=2.90.0`                                                                        | falta límite superior; estable bloqueada hasta `<3`                   |
| `src/index.ts`                   | reexporta `types` y `client`                                                                            | superficie transitoria, no API estable                                |
| `EffectiveContext`               | shape plano con strings abiertos, `bypass_applied`, `can_operate`, `blocked_reasons`, metadata genérica | compatibilidad temporal; no contrato canónico                         |
| `client.ts`                      | RPC directas y casts hacia el shape local                                                               | legado; no fuente de semántica ni de autorización                     |
| README actual                    | describe precedencia `shared_device`, simulación, ANIMA y bypass                                        | documentación transitoria; no autoridad final                         |
| `@vento/contracts` físico        | no materializado como release estable                                                                   | dependencia canónica futura, no se crea aquí                          |
| cambios físicos de este marcador | 0                                                                                                       | fase documental                                                       |

Las RPC actualmente envueltas por el package físico son:

```text
get_effective_context_v1
has_effective_permission_v1
start_context_simulation_v1
stop_context_simulation_v1
```

Su existencia no convierte sus retornos ni sus nombres en contrato estable del SDK.

---

#### 5. Estado actual de adopción de los siete repositorios web

Los manifests actuales de la matriz web gobernada por `SHELL-PKG-004` mantienen esta situación:

| Repositorio    | Dependencia publicada `@vento/*` en manifest | `engines.node` declarado |
| -------------- | -------------------------------------------: | -----------------------: |
| `vento-shell`  |                                            0 |           sí — `24.19.0` |
| `vento-viso`   |                                            0 |                       no |
| `vento-nexo`   |                                            0 |                       no |
| `vento-fogo`   |                                            0 |                       no |
| `vento-origo`  |                                            0 |                       no |
| `vento-pulso`  |                                            0 |                       no |
| `vento-numera` |                                            0 |                       no |

**Conciliación:** 7 repositorios evaluados, 7 sin dependencia publicada `@vento/*`, 1 con runtime Node declarado en manifest y 6 sin `engines.node` declarado.

Esta evidencia no autoriza inferir compatibilidad. La certificación ejecutable pertenece a `SHELL-CI-005`; el registro canónico de consumidores runtime y sus superficies pertenece a `SHELL-AUTH-003`.

---

#### 6. Identidad y propiedad del SDK

La identidad queda fijada así:

| Propiedad               | Decisión                                                           |
| ----------------------- | ------------------------------------------------------------------ |
| nombre lógico           | `@vento/os-context`                                                |
| repositorio propietario | `devVentoGroup/vento-shell`                                        |
| workspace propietario   | `packages/*`                                                       |
| raíz física existente   | `packages/os-context`                                              |
| naturaleza              | SDK runtime compartido de contexto y autorización                  |
| canal de distribución   | registry privado compatible con npm                                |
| versionado              | SemVer independiente                                               |
| versión física actual   | `0.1.0` transitoria                                                |
| primera versión estable | `1.0.0`, únicamente después de gates de implementación/publicación |
| dependencia contractual | `@vento/contracts` en versión exacta cuando se materialice/publica |
| peer externo candidato  | `@supabase/supabase-js >=2.90.0 <3`                                |
| TypeScript candidato    | `>=5 <6`                                                           |
| React / React DOM       | no forman parte de dependencias ni peers del SDK                   |
| UI / Tailwind           | prohibidos dentro del SDK                                          |
| aplicaciones            | consumidoras; nunca propietarias de forks del SDK                  |

No se crea `@vento/auth`, `@vento/operational-context` ni otro núcleo competidor.

---

#### 7. Contrato de superficie pública

La primera línea estable deberá exponer exactamente cuatro fronteras públicas de runtime/desarrollo:

```text
@vento/os-context/server
@vento/os-context/client
@vento/os-context/testing
@vento/os-context/legacy
```

La raíz `@vento/os-context` no será un agregador runtime de la línea estable. Ninguna función de contexto o autorización se importará desde `.` y ningún subpath reexportará automáticamente los demás.

Esta decisión evita:

- arrastrar Supabase hacia bundles cliente por un barrel común;
- importar compatibilidad legacy accidentalmente;
- convertir testing en dependencia productiva;
- hacer públicas rutas internas por conveniencia;
- confundir una única identidad de package con una única frontera de ejecución.

Las rutas internas que no figuren en el manifest `exports` permanecen privadas aunque existan físicamente.

---

#### 8. Frontera `@vento/os-context/server`

`/server` es la única frontera pública destinada a resolución y evaluación autoritativa desde código de servidor consumidor.

Quedan reservadas como operaciones públicas canónicas:

```text
resolveAccessContext
evaluateAuthorization
requireAuthorization
getSafeContextProjection
getSafeDecisionProjection
createAuthorizationScope
```

Distribución de responsabilidad:

| Operación                   | Tarea de materialización funcional |
| --------------------------- | ---------------------------------- |
| `resolveAccessContext`      | `SHELL-AUTH-002`                   |
| `evaluateAuthorization`     | `SHELL-AUTH-002`                   |
| `requireAuthorization`      | `SHELL-AUTH-002`                   |
| `getSafeContextProjection`  | `SHELL-AUTH-002`                   |
| `getSafeDecisionProjection` | `SHELL-AUTH-002`                   |
| `createAuthorizationScope`  | `SHELL-AUTH-003`                   |

El marcador `SHELL-AUTH-001` fija los nombres y la frontera; no implementa todavía sus cuerpos.

Reglas obligatorias:

1. `app_code` procede de un adapter de aplicación y no de query, body, cookie editable, local storage ni clave de permiso;
2. toda entrada externa se valida antes de convertirse en contrato canónico;
3. el SDK no reimplementa precedencia de roles, grants, denies, territorio, turno o dispositivo;
4. el backend canónico produce contexto y decisión; el SDK adapta y valida;
5. una decisión se evalúa para permiso y recurso exactos;
6. un contexto puede reutilizarse dentro de la solicitud, pero una decisión no se reutiliza para otro recurso;
7. error de resolución, validación o evaluación falla cerrado;
8. `requireAuthorization` no convierte roles o booleanos legacy en autoridad;
9. la correlación se propaga como trazabilidad y nunca concede acceso;
10. ninguna API server devuelve evidencia sensible interna por defecto.

---

#### 9. Frontera `@vento/os-context/client`

`/client` consume únicamente proyecciones seguras ya producidas por servidor o transportadas mediante una frontera aprobada.

Su contrato mínimo reconoce dos superficies conceptuales:

```text
SafeContextProjection
SafeDecisionProjection
```

Reglas:

- no importa React, React DOM, Next, React Native ni Expo;
- no ejecuta RPC internas de autorización;
- no instancia `SupabaseClient` para evaluar permisos;
- no recibe grants, denies, hashes, versiones internas, SQLSTATE, stack traces ni evidencia sensible;
- no convierte visibilidad de UI en autorización ejecutable;
- no autoriza mutaciones a partir de una proyección anterior;
- no expone un helper `hasPermission` que consulte red por permiso o render;
- puede ser consumido desde adapters de renderer sin adquirir tipos de renderer en su API pública.

Los providers, hooks o componentes React no forman parte de la API estable de `@vento/os-context`. Si una aplicación necesita un adapter React, este deberá consumir `/client` desde la capa propietaria de presentación sin convertir React en dependencia del SDK.

---

#### 10. Frontera `@vento/os-context/testing`

`/testing` contiene únicamente utilidades deterministas para probar consumidores del SDK.

Podrá materializar:

- fixtures versionados de contratos aprobados;
- factories de contexto, decisión y proyecciones seguras;
- matchers de allow/deny/fallo técnico;
- escenarios de actor, recurso, sede, área y dispositivo;
- utilidades de paridad y compatibilidad.

Reglas:

1. producción no depende de `/testing`;
2. fixtures no inventan códigos fuera de `@vento/contracts`;
3. factories no conceden autoridad por defecto;
4. valores sensibles se sustituyen por datos sintéticos controlados;
5. una fixture conserva versión contractual y procedencia;
6. las utilidades no llaman servicios remotos para decidir el oracle;
7. evidencia de otra versión o commit no se reutiliza como vigente.

La materialización concreta de fixtures y metadata de consumidor corresponde a `SHELL-AUTH-003` y a la infraestructura de pruebas aplicable.

---

#### 11. Frontera `@vento/os-context/legacy`

`/legacy` es una frontera temporal y explícitamente deprecable. Su única función es facilitar migración controlada desde superficies ya existentes.

Las cinco familias legacy reconocidas son:

```text
get_effective_context_v1
has_effective_permission_v1
get_operational_context
has_operational_permission
has_permission
```

Reglas vinculantes:

1. ningún uso nuevo se autoriza después de materializar el gate de `SHELL-AUTH-004`;
2. cada wrapper declara que es legacy/deprecado;
3. un wrapper no transforma un shape legacy en `AccessContextV1` completo si no puede demostrarlo;
4. no añade bypass, role override ni fallback permisivo;
5. no normaliza claves de permiso localmente;
6. no presenta un booleano legacy como `AuthorizationDecisionV1`;
7. cada consumidor queda vinculado a propietario, reemplazo, tarea de migración y puerta de retiro;
8. la telemetría de uso no expone secretos ni evidencia sensible;
9. `/legacy` no es reexportado por `/server`, `/client` ni la raíz;
10. el retiro sigue `SHELL-PKG-005`, `SHELL-AUTH-005` y `AUTH-DB-030` cuando corresponda.

Si `/legacy` forma parte de una release estable, su reloj de deprecación solo comienza cuando exista expediente completo conforme a `SHELL-PKG-005`; el mero estado transitorio `0.1.0` no inicia una ventana estable de retiro.

---

#### 12. Autoridad contractual y prohibición de duplicación

`@vento/os-context` consume, no redefine, los contratos estáticos.

Por tanto, quedan prohibidos dentro del SDK como fuente paralela:

- uniones locales de `AppCode`;
- listas locales de `PermissionKey`;
- uniones locales de `BaseRoleCode` u `OperationalRoleCode`;
- taxonomías locales de scopes;
- copias de `AuthorizationReasonCode`, `StructuralIssueCode` o `LaneReasonCode`;
- shapes alternativos llamados `AccessContext` o `AuthorizationDecision`;
- casts desde `unknown` usados como sustituto de validación;
- enums o arrays editados manualmente cuando exista fuente contractual publicada.

La dependencia lógica es:

```text
@vento/contracts/authorization
→ tipos + códigos + schemas + validadores

@vento/os-context
→ importa versión exacta
→ valida entradas
→ adapta runtime
→ proyecta salida segura
```

Cambiar el contrato no se realiza editando el SDK. Requiere primero una revisión del propietario contractual y una nueva versión compatible o incompatible según corresponda.

---

#### 13. Reconciliación del package físico actual

Cada superficie observable actual recibe disposición explícita:

| Superficie actual                   | Disposición estable                                                                                                  |
| ----------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| export raíz `.`                     | `RETIRAR_COMO_AGREGADOR_RUNTIME` antes de primera estable                                                            |
| `EffectiveContextSource`            | `LEGACY_COMPATIBILITY`; no discriminante canónico                                                                    |
| `EffectiveContext`                  | `LEGACY_COMPATIBILITY`; no sustituye `AccessContextV1`                                                               |
| `ContextSimulationInput`            | `LEGACY_COMPATIBILITY`; no sustituye `SimulationContextV1`                                                           |
| `getEffectiveContext`               | trasladar conceptualmente a `/legacy`; reemplazo funcional en `/server` mediante `resolveAccessContext`              |
| `hasEffectivePermission`            | trasladar conceptualmente a `/legacy`; reemplazo funcional mediante `evaluateAuthorization` / `requireAuthorization` |
| `startContextSimulation`            | compatibilidad temporal; simulación real permanece contrato separado y tareas propietarias posteriores               |
| `stopContextSimulation`             | compatibilidad temporal; no autoridad de contexto real                                                               |
| `bypass_applied`                    | `PROHIBIDO_COMO_AUTORIDAD`                                                                                           |
| `can_operate`                       | `PROHIBIDO_COMO_DECISION`                                                                                            |
| `blocked_reasons: string[]`         | compatibilidad; no sustituye códigos canónicos                                                                       |
| `metadata: Record<string, unknown>` | no absorbe campos contractuales faltantes                                                                            |

**Conciliación:** 12 superficies/conceptos actuales, 12 decisiones, 0 sin disposición.

---

#### 14. Dependencias y dirección permitida

Grafo permitido:

```text
@vento/os-context/server
→ @vento/contracts/authorization
→ peer/runtime server autorizado para transporte Supabase cuando corresponda

@vento/os-context/client
→ contratos y proyecciones seguras
-x-> Supabase de autorización
-x-> React/UI

@vento/os-context/testing
→ contratos + SDK público
-x-> secretos / producción

@vento/os-context/legacy
→ compatibilidad explícita
-x-> fuente canónica
```

Reglas:

- ninguna aplicación se convierte en dependencia de `@vento/os-context`;
- ninguna UI se importa desde el SDK;
- `@vento/contracts` no depende de `@vento/os-context`;
- el SDK no depende de `@vento/ui-web` ni de renderers nativos;
- los packages `@vento/*` se fijan mediante versiones exactas;
- el peer Supabase de la primera estable deberá tener límite superior `<3`;
- una dependencia específica de framework solo podrá entrar mediante contrato y subpath explícitos; este corte no aprueba ninguna.

---

#### 15. Versionado de la transición `0.1.0 → 1.0.0`

`0.1.0` se clasifica como metadata de workspace transitorio, no como contrato estable distribuido.

Antes de `1.0.0` deberán cumplirse simultáneamente:

1. existir output construido y declarations, sin exportar `src/*.ts` directamente;
2. manifest `exports` limitado a `/server`, `/client`, `/testing` y `/legacy`;
3. no existir agregador runtime raíz;
4. dependencia `@vento/contracts` fijada a una versión exacta publicada y compatible;
5. peer `@supabase/supabase-js` cerrado a `>=2.90.0 <3` o revisión posterior aprobada;
6. TypeScript soportado dentro de `>=5 <6` o revisión aprobada;
7. runtime Node de package y consumidores obligatorios estar declarado y probado;
8. API pública y comportamiento superar pruebas propias;
9. combinaciones obligatorias de consumidores superar `SHELL-CI-005`;
10. tarball, checksum, commit y manifest coincidir;
11. rollback a una combinación soportada ser reproducible;
12. publicación estar autorizada por el ciclo E5 y CI aplicable.

Una banda candidata no equivale a compatibilidad certificada.

---

#### 16. Contrato de snapshot de superficie

Se define el snapshot documental:

```text
snapshot_id = SHELL-AUTH-OS-CONTEXT-SURFACE-001
schema = vento.os-context-sdk-surface@1
package_name = @vento/os-context
current_transitional_version = 0.1.0
first_stable_version = 1.0.0
public_subpath_count = 4
server_export_count = 6
legacy_rpc_family_count = 5
root_runtime_export = false
contracts_source = @vento/contracts/authorization
supabase_peer_range = >=2.90.0 <3
typescript_range = >=5 <6
react_dependency = false
```

Huella documental:

`sha256:2e704d792c01a8bbfeb0d3fd2c8a06e3c1a7df67d780f701dd9e57c138af439d`

La serialización normativa usa JSON UTF-8 en una sola línea, claves de objeto ordenadas lexicográficamente y arrays en el orden contractual fijado por esta tarea.

Una futura instancia deberá reproducir este snapshot o declarar una revisión aprobada con diff, versión y lineage. No podrá reutilizar la misma identidad con otra superficie silenciosamente.

---

#### 17. Compatibilidad y consumidores

La compatibilidad se certifica por combinación exacta:

```text
package + versión + consumidor + commit + lockfile + runtime + subpath
```

Estados aplicables permanecen los de `SHELL-PKG-004`:

```text
NO_APLICA
PENDIENTE_DE_EVIDENCIA
COMPATIBLE
COMPATIBLE_CON_RESTRICCIONES
INCOMPATIBLE
BLOQUEADA
```

Reglas específicas del SDK:

1. `/server` exige validación de contexto/autorización y entorno server;
2. `/client` exige ausencia de RPC internas y serialización segura;
3. `/testing` se prueba como dev-only y nunca como dependencia productiva;
4. `/legacy` exige inventario, deprecación y gate de retiro;
5. una build exitosa no demuestra paridad de autorización;
6. una aplicación no hereda compatibilidad de otra;
7. una actualización de contract version, lockfile, runtime o subpath invalida evidencia anterior;
8. no se certifica ANIMA, PASS ni otro runtime móvil por inferencia en este marcador; su adopción requiere matriz propietaria cuando corresponda.

---

#### 18. Fronteras con tareas posteriores

La distribución de trabajo queda cerrada así:

| Responsabilidad                                                                | Tarea propietaria |
| ------------------------------------------------------------------------------ | ----------------- |
| estructura, exports, versionado y compatibilidad del SDK                       | `SHELL-AUTH-001`  |
| adapters server/client y proyecciones seguras                                  | `SHELL-AUTH-002`  |
| request scope, deduplicación, correlación, registro de consumidores y fixtures | `SHELL-AUTH-003`  |
| lint, métricas, allowlist temporal y gates contra legado                       | `SHELL-AUTH-004`  |
| migración multi-repositorio y handoff verificable para retiro legacy           | `SHELL-AUTH-005`  |
| retiro físico de objetos/RPC legacy aplicables                                 | `AUTH-DB-030`     |
| certificación final del cierre de la transición legacy                         | `AUTH-DB-031`     |
| módulo contextual interno del mismo package                                    | `SHELL-CTX-001`   |
| turno y check-in canónicos                                                     | `SHELL-CTX-002`   |
| sede y área efectivas seguras                                                  | `SHELL-CTX-003`   |
| readiness sin booleanos de autorización                                        | `SHELL-CTX-004`   |
| razones seguras de bloqueo                                                     | `SHELL-CTX-005`   |
| caché, single-flight y frescura                                                | `SHELL-CTX-006`   |
| productor autoritativo de contexto                                             | `AUTH-DB-033`     |
| frescura e invalidación autoritativas                                          | `AUTH-DB-035`     |
| evaluador autoritativo                                                         | `AUTH-DB-034`     |
| persistencia de decisión                                                       | `AUTH-DB-032`     |

No se crea ninguna tarea nueva ni queda una brecha sin propietario documental.

---

#### 19. Contrato de entrada de cada futura instancia

Toda `SHELL-AUTH-001::<implementation_unit_id>` deberá registrar como mínimo:

| Campo                    | Obligación                                                  |
| ------------------------ | ----------------------------------------------------------- |
| `implementation_unit_id` | unidad exacta asignada por `DELIV-PKG-025`                  |
| `owner_package_id`       | paquete propietario con `E5-GATE-008::<package_id> = PASS`  |
| `consumer_package_ids`   | lista cerrada de consumidores de la unidad                  |
| baseline                 | commit previo a materialización                             |
| result commit            | commit exacto de resultado                                  |
| package version          | versión física exacta                                       |
| contracts version        | versión exacta de `@vento/contracts`                        |
| export manifest          | cuatro subpaths y exports públicos efectivos                |
| dependency graph         | dependencias runtime/dev/peer y dirección                   |
| compatibility matrix     | combinaciones package–consumidor aplicables                 |
| legacy inventory         | consumidores y reemplazo de cada uso temporal               |
| API snapshot             | `SHELL-AUTH-OS-CONTEXT-SURFACE-001` o revisión aprobada     |
| digest                   | checksum del artefacto construido                           |
| tests                    | resultados atribuibles al mismo commit/versión              |
| rollback                 | combinación anterior soportada y procedimiento reproducible |
| blockers                 | lista cerrada con propietario y condición de salida         |

Un campo obligatorio ausente deja la instancia `BLOCKED`.

---

#### 20. Unicidad por `implementation_unit_id`

```text
1 implementation_unit_id
→ máximo 1 SHELL-AUTH-001::<implementation_unit_id>
→ máximo 1 package físico propietario @vento/os-context
→ máximo 1 manifest de exports por versión
→ máximo 1 suite propietaria del core por unidad
→ N package_id consumidores mediante lineage
```

Dos paquetes con la misma unidad no producen dos SDK. El segundo consumidor referencia la misma versión, commit y digest y agrega únicamente su evidencia de compatibilidad.

Evidencia de otra unidad, versión o commit se considera `STALE`.

---

#### 21. Doce gates de futura materialización

| Gate               | PASS                                                                 | Bloqueo                              |
| ------------------ | -------------------------------------------------------------------- | ------------------------------------ |
| 1. identidad       | unidad, package, versión y commits inequívocos                       | identidad ambigua                    |
| 2. exports         | cuatro subpaths exactos; sin raíz runtime ni rutas internas públicas | drift de superficie                  |
| 3. contratos       | tipos/códigos provienen de `@vento/contracts`                        | catálogo o shape paralelo            |
| 4. server          | app code fijo, fail-closed y autoridad backend preservada            | reconstrucción local o bypass        |
| 5. client          | solo proyecciones seguras; sin RPC de autorización ni React          | autoridad o dependencia indebida     |
| 6. testing         | fixtures deterministas y dev-only                                    | fixture no versionada o productiva   |
| 7. legacy          | aislamiento, inventario, deprecación y reemplazo                     | uso nuevo o autoridad legacy         |
| 8. dependencias    | VENTO exactas; Supabase con límite; grafo permitido                  | peer abierto o acoplamiento UI       |
| 9. versionado      | build publicable, declarations, tarball/commit/checksum              | export de source o artefacto mutable |
| 10. compatibilidad | matriz obligatoria sin relaciones sin evidencia                      | consumidor obligatorio pendiente     |
| 11. unicidad       | una materialización por unidad y lineage completo                    | SDK duplicado                        |
| 12. rollback       | restauración reproducible a combinación soportada                    | rollback no probado                  |

La instancia queda `PASS` únicamente con todos los gates aplicables en `PASS`.

---

#### 22. Perfil de pruebas aplicable

La futura materialización deberá cubrir como mínimo:

| Perfil         | Cobertura mínima                                                                               |
| -------------- | ---------------------------------------------------------------------------------------------- |
| contractual    | exports, tipos, códigos, schemas consumidos, versiones y fail-closed                           |
| unitaria       | app code fijo, errores, proyecciones, legacy isolation y fixtures                              |
| integración    | resolución/evaluación server, proyección client y contratos exactos                            |
| denegaciones   | permiso, recurso, sede, área, actor, dispositivo y contexto inválidos                          |
| seguridad      | app code manipulado, replay, rol como bypass, cliente invocando RPC interna, fuga de evidencia |
| RLS/RPC        | equivalencia con backend autoritativo cuando la instancia alcance esas superficies             |
| compatibilidad | typecheck, build y comportamiento por consumidor/subpath                                       |
| regresión      | ausencia de nuevos usos legacy, booleanos autoritativos o contratos locales                    |
| lineage        | unidad–package–versión–commit–contracts–digest                                                 |
| rollback       | retorno a combinación soportada y repetición de pruebas esenciales                             |

Las pruebas RLS/RPC solo podrán declararse `PASS` cuando existan objetos físicos y ambiente autorizado en sus tareas propietarias. No se sustituyen por una validación documental.

---

#### 23. Evidencia requerida por instancia

| Clase                | Contenido mínimo                                                        |
| -------------------- | ----------------------------------------------------------------------- |
| `LINEAGE`            | unidad, owner package, consumidores, baseline, result commit y versión  |
| `EXPORT_MANIFEST`    | subpaths, symbols públicos, declarations y ausencia de imports internos |
| `CONTRACT_AUTHORITY` | versión exacta de contratos y validadores consumidos                    |
| `DEPENDENCY_GRAPH`   | dependencies, peers, devDependencies e imports efectivos                |
| `SERVER_BOUNDARY`    | fixtures y resultados de resolución/evaluación fail-closed              |
| `CLIENT_BOUNDARY`    | payloads seguros y prueba de ausencia de RPC/UI en SDK client           |
| `LEGACY`             | inventario, deprecación, telemetría segura y replacement por consumidor |
| `COMPATIBILITY`      | matriz package–consumidor–commit–lockfile–runtime–subpath               |
| `SECURITY`           | pruebas negativas y ausencia de bypass/replay/fuga                      |
| `ARTIFACT_INTEGRITY` | tarball, checksum, versión y commit                                     |
| `ROLLBACK`           | combinación previa, procedimiento y ensayo                              |
| `CERTIFICATION`      | doce gates y estado agregado                                            |

---

#### 24. Rollback

El rollback de una instancia deberá restaurar coordinadamente:

1. versión anterior soportada de `@vento/os-context`;
2. versión exacta compatible de `@vento/contracts`;
3. manifest y lockfile del consumidor afectado;
4. adapter/proyección compatibles;
5. configuración de transición legacy cuando exista;
6. fixtures y evidencia asociadas a la combinación restaurada.

El rollback no podrá:

- mutar una versión publicada;
- editar `node_modules`;
- reintroducir forks de contrato;
- reactivar bypasses;
- convertir `/legacy` en arquitectura final;
- reutilizar evidencia de otra combinación.

---

#### 25. Hallazgos y destino exacto

| Hallazgo                                                                                                              | Estado                               | Destino                                                                 |
| --------------------------------------------------------------------------------------------------------------------- | ------------------------------------ | ----------------------------------------------------------------------- |
| package `0.1.0` exporta source TypeScript por raíz                                                                    | `TRANSITORIO_NO_ESTABLE`             | `SHELL-AUTH-001::<implementation_unit_id>` + `SHELL-CI-002`             |
| peer Supabase carece de límite superior                                                                               | `BLOQUEO_DE_ESTABLE`                 | instancia de `SHELL-AUTH-001` + `SHELL-CI-005`                          |
| `EffectiveContext` contiene strings abiertos y booleanos de autoridad                                                 | `LEGACY_NO_CANÓNICO`                 | `SHELL-CTX-001`; adapters en `SHELL-AUTH-002`                           |
| RPC legacy están envueltas directamente                                                                               | `LEGACY_ACTIVO`                      | `/legacy`; gate `SHELL-AUTH-004`; migración `SHELL-AUTH-005`            |
| no existe `@vento/contracts` físico estable                                                                           | `DEFINIDO_NO_MATERIALIZADO`          | instancia contractual autorizada por E5 y CI propietaria                |
| 7 manifests web no declaran packages `@vento/*` publicados                                                            | `SIN_ADOPCIÓN_PUBLICADA_EN_MANIFEST` | `SHELL-AUTH-003`; `SHELL-AUTH-005`; `SHELL-CI-005`                      |
| 6 de 7 manifests web no declaran `engines.node`                                                                       | `PENDIENTE_DE_EVIDENCIA_RUNTIME`     | `SHELL-CI-005` antes de certificar estable                              |
| React hooks conceptuales de la propuesta histórica entrarían en conflicto con la política posterior sin-React del SDK | `RECONCILIADO`                       | hooks quedan fuera del SDK; adapters de presentación consumen `/client` |

No se crea ninguna tarea nueva: todos los hallazgos poseen destino canónico existente.

---

#### 26. Requisitos de prueba derivados

**Resultado:** GENERA 6 REQUISITOS DE PRUEBA.

**Requisitos creados:** **6**
**Requisitos modificados:** **0**

- `TREQ-SHELL-061` — identidad única del SDK, cuatro subpaths exactos, ausencia de agregador runtime raíz y prohibición de núcleos paralelos;
- `TREQ-SHELL-062` — autoridad contractual exclusiva de `@vento/contracts/authorization` y prohibición de shapes, catálogos, casts o booleanos legacy como contrato canónico;
- `TREQ-SHELL-063` — separación server/client, app code fijado por adapter, fail-closed, proyecciones seguras y prohibición de RPC de autorización desde cliente;
- `TREQ-SHELL-064` — transición publicable `0.1.0 → 1.0.0`, dependencias VENTO exactas, peer Supabase acotado, integridad de artefacto y matriz de compatibilidad;
- `TREQ-SHELL-065` — aislamiento de `/legacy`, prohibición de nuevos usos, deprecación trazable, reemplazo y gate de retiro;
- `TREQ-SHELL-066` — unicidad física por `implementation_unit_id`, lineage, evidencia vigente, pruebas de seguridad/denegaciones y rollback reproducible.

No se modifica, difiere, descarta ni obsoleta ningún requisito histórico.

---

#### 27. Puerta de cierre del marcador global

El marcador global queda documentalmente cerrado cuando:

1. `@vento/os-context` queda fijado como único SDK runtime compartido;
2. se conserva `@vento/contracts/authorization` como autoridad contractual;
3. se conserva Supabase/backend como autoridad de contexto y decisión;
4. se reconcilia el estado físico `0.1.0` sin presentarlo como estable;
5. se fijan exactamente cuatro subpaths públicos;
6. se elimina el agregador runtime raíz del contrato de primera estable;
7. se fijan seis operaciones server y su tarea de materialización;
8. `/client` queda libre de React, UI y RPC internas de autorización;
9. `/testing` queda dev-only y determinista;
10. `/legacy` queda aislado, deprecable y sin autoridad nueva;
11. se fija la dependencia exacta futura sobre contratos y el peer Supabase `<3`;
12. se fija el snapshot de superficie y su huella;
13. se define la matriz de compatibilidad y los gates de estable;
14. se define contrato de entrada, unicidad, evidencia y rollback por unidad;
15. se crean `TREQ-SHELL-061` a `TREQ-SHELL-066`;
16. se mantienen 0 unidades físicas materializadas y 0 cambios Supabase durante el marcador global.

---

#### 28. Puerta de cierre de cada futura instancia

`SHELL-AUTH-001::<implementation_unit_id>` solo podrá quedar `PASS` cuando:

- exista owner package habilitado por E5;
- el package construido exponga únicamente la superficie aprobada;
- no exporte source interno como API estable;
- contratos/códigos provengan de versión exacta de `@vento/contracts`;
- `/server`, `/client`, `/testing` y `/legacy` respeten su frontera;
- no existan imports React/UI dentro del SDK;
- el peer Supabase esté acotado y probado;
- la matriz obligatoria de consumidores tenga evidencia vigente;
- legacy tenga inventario, replacement y gate;
- no exista segunda materialización para la misma unidad;
- snapshot, versión, commit y digest coincidan;
- pruebas contractuales, integración, denegaciones, seguridad y regresión aplicables estén en `PASS`;
- RLS/RPC estén en `PASS` únicamente cuando sus objetos propietarios ya existan y sean aplicables;
- rollback haya sido ensayado;
- `TREQ-SHELL-061` a `TREQ-SHELL-066` tengan evidencia atribuible a la misma instancia.

---

#### 29. Criterios de aceptación

- [x] se conserva `SHELL-NATIVE-003` como precedencia inmediata;
- [x] se conserva `SHELL-AUTH-002` únicamente como siguiente tarea reservada;
- [x] se define un único SDK `@vento/os-context`;
- [x] se prohíben `@vento/auth` y `@vento/operational-context` paralelos;
- [x] se reconcilia completamente el package físico actual `0.1.0`;
- [x] se separa contrato estático, SDK runtime y backend autoritativo;
- [x] se fijan exactamente cuatro subpaths públicos;
- [x] se fija ausencia de agregador runtime raíz en la primera estable;
- [x] se fijan seis operaciones server previamente previstas por `AUTH-CTX-027`;
- [x] se preserva `createAuthorizationScope` para `SHELL-AUTH-003`;
- [x] se excluyen React, UI y Tailwind del SDK;
- [x] se mantiene `/client` sin RPC internas de autorización;
- [x] se mantiene `/testing` dev-only;
- [x] se aíslan cinco familias legacy;
- [x] se prohíben nuevos usos legacy y autoridad por booleanos/bypass;
- [x] se exige dependencia VENTO exacta y Supabase `>=2.90.0 <3` antes de estable;
- [x] se fija `1.0.0` como primera estable condicionada a evidencia;
- [x] se define snapshot reproducible y huella documental;
- [x] se define compatibilidad por consumidor, commit, lockfile, runtime y subpath;
- [x] se define materialización única por `implementation_unit_id`;
- [x] se definen doce gates, pruebas, evidencia y rollback;
- [x] se crean exactamente seis requisitos de prueba;
- [x] se declaran 0 cambios físicos, 0 releases y 0 cambios Supabase en el marcador global;
- [x] no se desarrolla `SHELL-AUTH-002`.

---

#### 30. Límites

Esta tarea no:

- modifica `packages/os-context`;
- crea archivos `server`, `client`, `testing` o `legacy` físicamente;
- publica `@vento/os-context@1.0.0`;
- materializa `@vento/contracts`;
- implementa adapters, scopes, hooks, lint, métricas o migraciones;
- modifica aplicaciones consumidoras;
- cambia SQL, RPC, RLS, Realtime, Storage, Edge Functions, datos o secretos;
- ejecuta Supabase;
- certifica compatibilidad de un consumidor por inferencia;
- declara RLS/RPC probados sin objetos físicos y ambiente autorizado;
- retira código legacy;
- inicia una ventana de deprecación estable solo por existir `0.1.0`;
- ejecuta `SHELL-AUTH-001::<implementation_unit_id>`;
- avanza ni desarrolla la tarea siguiente.

---

#### 31. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-NATIVE-003 — Mantener UI React Native separada`

**TAREA ACTUAL APROBADA**
`SHELL-AUTH-001 — Consolidar @vento/os-context como SDK canónico de contexto y autorización`

**SIGUIENTE TAREA RESERVADA**
`SHELL-AUTH-002 — Implementar adapters de servidor, cliente y proyecciones seguras`


### ✅ SHELL-AUTH-002 — Implementar adapters de servidor, cliente y proyecciones seguras

**Estado:** APROBADA
**Tarea anterior:** SHELL-AUTH-001 — Consolidar @vento/os-context como SDK canónico de contexto y autorización
**Tarea siguiente:** SHELL-AUTH-003 — Implementar scope por solicitud y registro canónico de consumidores
**Tipo de tarea:** documental — definición global única del contrato de adapters server/client y proyecciones seguras, con futura materialización física `SHELL-AUTH-002::<implementation_unit_id>` una sola vez por unidad de implementación
**Bloque:** BLOQUE H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md`
**Estado físico resultante:** `CONTRATO_GLOBAL_DE_ADAPTERS_Y_PROYECCIONES_SEGURAS_ESPECIFICADO`; 5 operaciones server; 2 operaciones client puras; 2 DTO de proyección segura; 4 categorías internas de fallo; 0 unidades materializadas; 0 cambios Supabase
**Cambios físicos autorizados:** ninguno durante el marcador global
**Requisitos de prueba creados o modificados:** 8 creados (`TREQ-SHELL-067` a `TREQ-SHELL-074`)
**Modalidad:** `PER_IMPLEMENTATION_UNIT`

---

#### 1. Propósito

`SHELL-AUTH-002` define de forma cerrada cómo `@vento/os-context` adaptará el productor canónico de contexto, el evaluador canónico de autorización y sus salidas hacia consumidores server y client sin reconstruir autoridad, sin exponer evidencia interna y sin convertir estado de presentación en autorización ejecutable.

La frontera queda:

```text
@vento/contracts/authorization
→ valida requests, AccessContext, AuthorizationDecision, códigos y versiones

BACKEND AUTORITATIVO
→ get_access_context
→ evaluate_authorization

@vento/os-context/server
→ adapta transporte
→ valida resultados
→ falla cerrado
→ produce proyecciones seguras

@vento/os-context/client
→ valida DTO seguros ya emitidos
→ no consulta autorización
→ no depende de React ni de Supabase

CAPA DE PRESENTACIÓN DE CADA APLICACIÓN
→ puede construir provider/hook/component propios sobre /client
→ nunca convierte UI en frontera de seguridad
```

El marcador global no modifica `packages/os-context`, no crea RPC y no ejecuta una instancia física.

---

#### 2. Modalidad canónica y separación entre definición y ejecución

La tarea usa `PER_IMPLEMENTATION_UNIT`.

```text
MARCADOR GLOBAL SHELL-AUTH-002
→ define adapters, DTO, errores, gates, pruebas y evidencia
→ se aprueba una sola vez
→ no materializa código

DELIV-PKG-025::<package_id>
→ asigna implementation_unit_id

E5-GATE-008::<package_id> = PASS
→ habilita la unidad propietaria

DEPENDENCIAS FÍSICAS DE CONTEXTO Y BACKEND
→ deben existir según el orden contractual interno aplicable

SHELL-AUTH-002::<implementation_unit_id>
→ materializa una sola vez adapters y proyecciones de la unidad
→ N package_id pueden consumir la misma implementación mediante lineage
```

**Dependencia para desarrollar:** `SHELL-AUTH-001`.

**Dependencias para ejecutar una instancia:** además de la habilitación E5, deberán estar materializadas las superficies de contexto/backend que la unidad declare consumir, incluidas las tareas propietarias del resolver, evaluador y proyecciones contextuales cuando sean aplicables.

La continuidad documental y el orden físico no se confunden: este marcador puede definirse ahora aunque su código se materialice después de las dependencias físicas previstas.

---

#### 3. Fuentes vinculantes y precedencia

La tarea conserva sin reabrir:

| Fuente                                 | Uso vinculante                                                                                                        |
| -------------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| `AUTH-CTX-025`                         | contrato lógico `get_access_context(text) → jsonb`; un único `p_app_code`; `AccessContext@1.0.0`; fail-closed         |
| `AUTH-CTX-026`                         | `evaluate_authorization(jsonb) → jsonb`; request versionado; `AuthorizationDecision@1.0.0`; permiso y recurso exactos |
| `AUTH-CTX-027`                         | consumo centralizado, adapters, proyecciones seguras, separación server/client y prohibición de autoridad desde UI    |
| `SHELL-CON-002..008`                   | `AppCode`, `PermissionKey`, roles, scopes, contexto y códigos compartidos                                             |
| `SHELL-NATIVE-002`                     | validadores puros, parse/is fail-closed y diagnósticos contractuales separados                                        |
| `SHELL-NATIVE-003`                     | ninguna API compartida adquiere tipos de renderer                                                                     |
| `SHELL-AUTH-001`                       | identidad del SDK, cuatro subpaths y cinco operaciones server propietarias de esta tarea                              |
| estado físico de `packages/os-context` | baseline legacy que debe ser reemplazado, no fuente normativa                                                         |

Precedencia:

```text
CONTRATO VERSIONADO
→ VALIDACIÓN
→ BACKEND AUTORITATIVO
→ ADAPTER SERVER
→ PROYECCIÓN SEGURA
→ ADAPTER CLIENT PURO
→ PRESENTACIÓN
```

Una aplicación no podrá invertir esa dirección mediante un helper local.

---

#### 4. Línea base verificable

El package físico actual permanece en estado transitorio:

| Superficie                | Estado observado                                               | Disposición                          |
| ------------------------- | -------------------------------------------------------------- | ------------------------------------ |
| `@vento/os-context@0.1.0` | package privado, export raíz de source TypeScript              | baseline legacy                      |
| `src/client.ts`           | llama `get_effective_context_v1`                               | mover a compatibilidad, no promover  |
| `src/client.ts`           | llama `has_effective_permission_v1` y retorna booleano         | mover a compatibilidad, no promover  |
| `src/client.ts`           | inicia/detiene simulación legacy                               | fuera del adapter real de esta tarea |
| `EffectiveContext`        | shape plano, strings abiertos, `bypass_applied`, `can_operate` | no canónico                          |
| `ContextSimulationInput`  | input legacy                                                   | no es `SimulationContextV1`          |
| `/server` estable         | no materializado                                               | futuro resultado de instancia        |
| `/client` estable         | no materializado                                               | futuro resultado de instancia        |

**Conciliación:** 8 superficies observadas, 8 decisiones explícitas, 0 sin disposición.

---

#### 5. Identidades contractuales

| Identidad                                          | Función                                             |
| -------------------------------------------------- | --------------------------------------------------- |
| `VENTO-OS-CONTEXT-ADAPTER-PROJECTION-CONTRACT-001` | contrato global de adapters y proyecciones          |
| `SHELL-AUTH-ADAPTER-PROJECTION-001`                | snapshot documental de superficie y allowlists      |
| `SafeContextProjectionV1`                          | DTO seguro de contexto para transporte/presentación |
| `SafeDecisionProjectionV1`                         | DTO seguro de decisión para transporte/presentación |
| `SHELL-AUTH-002::<implementation_unit_id>`         | futura materialización física única por unidad      |

Los DTO seguros son proyecciones derivadas. No reemplazan `AccessContextV1` ni `AuthorizationDecisionV1` y no crean otra fuente de autorización.

---

#### 6. Superficie server exacta de esta tarea

`@vento/os-context/server` materializará exactamente estas cinco operaciones públicas pertenecientes a `SHELL-AUTH-002`:

```text
resolveAccessContext
evaluateAuthorization
requireAuthorization
getSafeContextProjection
getSafeDecisionProjection
```

`createAuthorizationScope` permanece reservado íntegramente a `SHELL-AUTH-003`.

No se agregan aliases como `hasPermission`, `can`, `authorizeByRole`, `getCurrentPermissions` o equivalentes que reduzcan el contrato canónico a un booleano o lista general.

---

#### 7. `resolveAccessContext`

Contrato conceptual:

```ts
resolveAccessContext({ appCode: AppCode })
  → Promise<AccessContextV1>
```

Reglas:

1. `appCode` debe ser un `AppCode` validado y fijado por el adapter propietario de la aplicación;
2. no se deriva desde `permission_key`;
3. no se acepta desde query, body, cookie editable, local storage ni ruta dinámica como autoridad;
4. el adapter invoca únicamente la frontera física autorizada que materialice `get_access_context`;
5. no acepta actor, empleado, rol, sede, área, turno, check-in, dispositivo, simulación ni bypass como hechos autoritativos suministrados por consumidor;
6. el resultado externo se valida como `AccessContextV1` antes de retornarlo tipado;
7. `null`, shape parcial, versión incompatible o respuesta inválida fallan cerrados;
8. esta operación no evalúa permisos;
9. la deduplicación por solicitud pertenece a `SHELL-AUTH-003` y no se implementa como singleton o caché global aquí.

---

#### 8. `evaluateAuthorization`

Contrato conceptual:

```ts
evaluateAuthorization({ request: AuthorizationEvaluationRequestV1 })
  → Promise<AuthorizationDecisionV1>
```

Reglas:

1. el request completo se valida antes de invocar backend;
2. `app_code` y `permission_key` son identidades exactas publicadas;
3. el adapter no recibe un `AccessContext` fabricado por consumidor para sustituir al resolver autoritativo;
4. actor, rol, territorio efectivo, turno, check-in, dispositivo y outcome no se aceptan como autoridad desde el caller;
5. el evaluador físico resuelve permiso, recurso, contexto y datasets conforme a su contrato propietario;
6. el resultado se valida como `AuthorizationDecisionV1` antes de consumo;
7. `DENY` es un resultado canónico válido y no se transforma en error técnico;
8. fallo de transporte, versión, contrato o respuesta inválida no produce `ALLOW` ni `false` silencioso;
9. una decisión no se reutiliza para otro permiso, recurso, actor o versión.

---

#### 9. `requireAuthorization`

Contrato conceptual:

```ts
requireAuthorization({ request: AuthorizationEvaluationRequestV1 })
  → Promise<AuthorizationDecisionV1>
```

Semántica:

```text
final_decision.outcome = ALLOW
→ retorna la decisión canónica validada

final_decision.outcome = DENY
→ interrumpe la operación mediante fallo tipado DENIED

contrato/transporte/backend inválido
→ interrumpe mediante fallo técnico tipado
```

Reglas:

- no acepta booleanos legacy;
- no concede acceso por nombre de rol;
- no convierte fallo técnico en `DENY` silencioso cuando el caller necesita distinguir disponibilidad de autorización;
- cualquier caller que ejecute una mutación deberá hacerlo solo después de esta frontera o de una evaluación equivalente autorizada;
- `decision_id` nunca se usa como token de capacidad;
- una mutación posterior revalida cuando contexto, recurso o versión puedan haber cambiado.

---

#### 10. `SafeContextProjectionV1`

La proyección segura de contexto usa una allowlist cerrada:

```ts
type SafeContextProjectionV1 = {
  projection_version: "1.0.0";
  app_code: AppCode;
  context_id: string;
  resolved_at: string;
  principal_type: "HUMAN_USER" | "SHARED_DEVICE" | "SYSTEM_SERVICE" | "ANONYMOUS";
  actor_type: "EMPLOYEE" | "CUSTOMER" | "SYSTEM" | "UNRESOLVED";
  base_role_code: BaseRoleCode | null;
  operational_role_code: OperationalRoleCode | null;
  operational_site_id: string | null;
  operational_area_id: string | null;
  base_readiness: "READY" | "UNAVAILABLE" | "INVALID" | "NOT_APPLICABLE";
  operational_readiness: "READY" | "UNAVAILABLE" | "INVALID" | "NOT_APPLICABLE";
};
```

`app_code` procede del adapter que solicitó el contexto; no se agrega ni retroescribe en `AccessContextV1`.

La proyección no contiene permiso, allow/deny ni autoridad ejecutable.

---

#### 11. Datos prohibidos en `SafeContextProjectionV1`

No se serializan por defecto:

- `auth_user_id` ni `session_id`;
- `actor_id`, `delegation_id`, `employee_id` o identidad de dominio completa;
- asignaciones completas de sedes o áreas;
- `device_id`, `device_code`, actor session ni metadata privada del dispositivo;
- `structural_issues` completos;
- `resolution_metadata`;
- versiones o fingerprints de fuentes;
- grants, denies, permission datasets;
- secretos, JWT, cookies, tokens o credenciales;
- `bypass_applied`, `can_operate`, `is_simulation` o metadata legacy.

Una ampliación futura de la allowlist exige revisión explícita del contrato y pruebas de minimización.

---

#### 12. `getSafeContextProjection`

Contrato conceptual:

```ts
getSafeContextProjection({
  appCode: AppCode,
  context: AccessContextV1
}) → SafeContextProjectionV1
```

Reglas:

1. valida `context` antes de proyectar;
2. deriva campos únicamente de identidades contractuales aprobadas;
3. no consulta red;
4. no altera ni completa un contexto incompleto;
5. no convierte `lane_readiness.READY` en `ALLOW`;
6. no incluye campos fuera de la allowlist;
7. produce salida determinista para el mismo input lógico;
8. `context_id` es referencia opaca y nunca credencial.

---

#### 13. `SafeDecisionProjectionV1`

La proyección segura de decisión usa una allowlist cerrada:

```ts
type SafeDecisionProjectionV1 = {
  projection_version: "1.0.0";
  correlation_id: string | null;
  app_code: AppCode;
  permission_key: PermissionKey;
  outcome: "ALLOW" | "DENY";
  safe_message_code: AuthorizationReasonCode | null;
  reason_codes: AuthorizationReasonCode[];
  visible_fields: string[];
  mutable_fields: string[];
};
```

`safe_message_code` y `reason_codes` solo pueden utilizar códigos públicos aprobados. Un `DecisionReason.reason_code` interno no se expone por coincidencia textual.

Para `ALLOW`, `safe_message_code = null` y `reason_codes = []`; la ausencia de una razón de denegación no crea un código de éxito nuevo. Para `DENY`, `safe_message_code` deberá ser un `AuthorizationReasonCode` público y `reason_codes` solo podrá contener miembros de ese mismo catálogo.

---

#### 14. Datos prohibidos en `SafeDecisionProjectionV1`

No se serializan:

- `decision_id` como mecanismo de autoridad o replay;
- `access_context_ref.context_fingerprint`;
- `permission_contract.catalog_hash`;
- `matched_allows` o `matched_denies`;
- datasets, source IDs, versiones internas o hashes;
- `structural_denies`, `actor_wide_denies`, `lane_denies` o `blocked_reasons` completos;
- recurso completo, `state_snapshot`, ownership o concurrencia internos;
- audit interno;
- SQLSTATE, stack trace, query, nombres de tablas o errores crudos;
- datos de otros actores o territorios no visibles.

`visible_fields` y `mutable_fields` provienen exclusivamente de la política de campos ya evaluada y no autorizan una operación posterior por sí mismos.

---

#### 15. `getSafeDecisionProjection`

Contrato conceptual:

```ts
getSafeDecisionProjection({ decision: AuthorizationDecisionV1 })
  → SafeDecisionProjectionV1
```

Reglas:

1. valida la decisión canónica completa;
2. toma `app_code` y `permission_key` desde `decision.request`;
3. toma el outcome desde `final_decision.outcome`;
4. mapea únicamente razones marcadas y catalogadas para exposición pública;
5. conserva correlación cuando exista;
6. deriva `visible_fields` y `mutable_fields` desde `field_policy_decision`;
7. no incluye evidencia interna;
8. no convierte la proyección en token de autorización;
9. salida idéntica para una misma decisión canónica y misma versión de proyección.

---

#### 16. Frontera client pura

`@vento/os-context/client` materializará únicamente operaciones puras sobre DTO seguros:

```text
parseSafeContextProjection
parseSafeDecisionProjection
```

Contrato conceptual:

```ts
parseSafeContextProjection(input: unknown)
  → SafeContextProjectionV1

parseSafeDecisionProjection(input: unknown)
  → SafeDecisionProjectionV1
```

Ambas operaciones:

- validan forma, discriminantes, versiones y catálogos aplicables;
- fallan cerradas ante payload inválido o versión no soportada;
- no ejecutan red;
- no importan `@supabase/supabase-js`;
- no importan React, React DOM, Next.js, React Native, Expo ni UI;
- no consultan permisos;
- no mutan DTO;
- no guardan autoridad en storage.

---

#### 17. Reconciliación de provider y hooks de presentación

`AUTH-CTX-027` describió provider y hooks conceptuales como mecanismos de consumo cliente. La política posterior de `SHELL-AUTH-001` fijó que React no forma parte del SDK estable.

La conciliación vinculante es:

```text
@vento/os-context/client
→ DTO + parsers puros

ADAPTER DE PRESENTACIÓN EN LA APLICACIÓN/RENDERER
→ puede crear provider/hook/component
→ consume DTO validados
→ no llama RPC de autorización
→ no se convierte en frontera de seguridad
```

Por tanto, `useAccessContext`, `useAuthorization`, `useCan` o nombres equivalentes no son exports de `@vento/os-context` bajo este contrato.

---

#### 18. Autoridad de `@vento/contracts/authorization`

Los adapters deberán importar y reutilizar, cuando estén materializados, los tipos y validadores aprobados para:

- `AppCode`;
- `PermissionKey`;
- `BaseRoleCode`;
- `OperationalRoleCode`;
- `AccessContextV1`;
- `AuthorizationEvaluationRequestV1`;
- `AuthorizationDecisionV1`;
- `AuthorizationReasonCode`;
- contratos de validación y diagnósticos aplicables.

Queda prohibido mantener dentro del SDK un catálogo paralelo o convertir `as Type` en sustituto de validación runtime.

---

#### 19. Traducción de fallos y separación semántica

El adapter server distingue internamente cuatro categorías cerradas:

```text
DENIED
CONTRACT_INVALID
BACKEND_UNAVAILABLE
BACKEND_RESPONSE_INVALID
```

Reglas:

1. `DENIED` procede únicamente de una `AuthorizationDecisionV1` válida con outcome `DENY`;
2. `CONTRACT_INVALID` conserva el diagnóstico contractual aplicable sin exponer input sensible;
3. `BACKEND_UNAVAILABLE` representa fallo de transporte o indisponibilidad de la frontera autoritativa;
4. `BACKEND_RESPONSE_INVALID` representa payload backend incompatible con el contrato/versiones esperados;
5. ninguna categoría equivale a `ALLOW`;
6. los fallos técnicos expuestos a UI se reducen a la razón pública aprobada de evaluación no disponible, sin stack, SQLSTATE ni detalle interno;
7. `requireAuthorization` diferencia DENY de fallo técnico para observabilidad y recuperación, pero ambos impiden ejecutar la acción.

No se crea un catálogo público alternativo de razones.

---

#### 20. Fallo cerrado y ausencia de coerciones

Quedan prohibidos:

```text
Boolean(data)
return error ? false : true
value as AccessContextV1
value as AuthorizationDecisionV1
permission.split(".")[0] como fuente de app_code
trim/lowercase/alias para corregir códigos contractuales
role === "propietario" como bypass
selected_site_id como territorio efectivo
```

Un payload externo inválido se rechaza; no se normaliza hasta aparentar validez.

---

#### 21. Recurso y autoridad de la UI

Una proyección client puede controlar presentación, por ejemplo:

- mostrar u ocultar acciones;
- mostrar estados seguros de disponibilidad;
- construir contexto visible;
- limitar campos presentados.

Nunca autoriza por sí sola:

- Server Action;
- Route Handler;
- RPC sensible;
- mutación;
- exportación;
- transición de estado;
- lectura de recurso que requiera evaluación nueva.

La frontera de ejecución reevalúa permiso y recurso exactos en servidor.

---

#### 22. Obsolescencia y replay

`SafeContextProjectionV1` y `SafeDecisionProjectionV1` son snapshots de presentación.

Reglas:

1. no existe TTL que convierta una proyección en token de capacidad;
2. replay de una proyección nunca autoriza una mutación;
3. cambio de actor, contexto, recurso o versión obliga a obtener/evaluar estado nuevo para ejecutar;
4. una versión de proyección desconocida se rechaza;
5. almacenamiento local de una proyección no aumenta su autoridad;
6. `decision_id` no se serializa como mecanismo de ejecución;
7. la política de caché cross-request pertenece a `SHELL-CTX-006`/tareas propietarias de frescura, no a esta frontera client.

---

#### 23. Supabase, RPC y RLS

La tarea no crea ni cambia Supabase.

La futura instancia deberá demostrar, cuando las superficies físicas existan:

```text
adapter server
→ consume la frontera backend autorizada

RPC de dominio
→ utiliza evaluación canónica o equivalente aprobada

RLS
→ utiliza predicados SQL semánticamente equivalentes

client
-x-> RPC interna de autorización
```

RLS no consume el SDK TypeScript. Una prueba TypeScript no sustituye evidencia RLS/RPC, y una prueba RLS/RPC no sustituye la validación contractual del SDK.

---

#### 24. Snapshot normativo

La representación normativa de `SHELL-AUTH-ADAPTER-PROJECTION-001` usa JSON UTF-8, claves ordenadas lexicográficamente para la entrada de huella y arrays en el orden contractual fijado.

Huella documental:

`sha256:011ba969ca10cf68d4fd31a9041c3a37011f4c5c0953452d112806b9a123660d`

Payload normativo:

```json
{
  "client_network_authorization": false,
  "client_operations": [
    "parseSafeContextProjection",
    "parseSafeDecisionProjection"
  ],
  "contract_id": "VENTO-OS-CONTEXT-ADAPTER-PROJECTION-CONTRACT-001",
  "future_instance_pattern": "SHELL-AUTH-002::<implementation_unit_id>",
  "projection_versions": {
    "safe_context": "1.0.0",
    "safe_decision": "1.0.0"
  },
  "react_dependency": false,
  "safe_context_fields": [
    "projection_version",
    "app_code",
    "context_id",
    "resolved_at",
    "principal_type",
    "actor_type",
    "base_role_code",
    "operational_role_code",
    "operational_site_id",
    "operational_area_id",
    "base_readiness",
    "operational_readiness"
  ],
  "safe_decision_fields": [
    "projection_version",
    "correlation_id",
    "app_code",
    "permission_key",
    "outcome",
    "safe_message_code",
    "reason_codes",
    "visible_fields",
    "mutable_fields"
  ],
  "schema": "vento.os-context-adapter-projection@1",
  "server_operations": [
    "resolveAccessContext",
    "evaluateAuthorization",
    "requireAuthorization",
    "getSafeContextProjection",
    "getSafeDecisionProjection"
  ],
  "snapshot_id": "SHELL-AUTH-ADAPTER-PROJECTION-001"
}
```

La misma identidad no puede reutilizarse con otra allowlist, versión o superficie pública sin revisión aprobada.

---

#### 25. Contrato de entrada de cada futura instancia

Toda `SHELL-AUTH-002::<implementation_unit_id>` deberá registrar:

| Campo                     | Obligación                                              |
| ------------------------- | ------------------------------------------------------- |
| `implementation_unit_id`  | unidad asignada por `DELIV-PKG-025`                     |
| `owner_package_id`        | package propietario con gate E5 aprobado                |
| `consumer_package_ids`    | consumidores exactos                                    |
| baseline                  | commit anterior                                         |
| result commit             | commit exacto de resultado                              |
| SDK version               | versión exacta de `@vento/os-context`                   |
| contracts version         | versión exacta de `@vento/contracts`                    |
| context backend identity  | función/resolver físico autorizado y versión            |
| decision backend identity | evaluador físico autorizado y versión                   |
| adapter snapshot          | `SHELL-AUTH-ADAPTER-PROJECTION-001` o revisión aprobada |
| projection schemas        | versiones y allowlists de ambos DTO                     |
| dependency graph          | imports runtime y dev efectivos                         |
| consumer matrix           | consumidor, runtime, subpath, lockfile y resultado      |
| negative tests            | manipulación, replay, leakage y fail-closed             |
| backend parity            | evidencia RPC/RLS cuando aplique                        |
| artifact digest           | huella del artefacto implementado                       |
| rollback                  | combinación anterior soportada y ensayo                 |
| blockers                  | lista cerrada, owner y condición de salida              |

Un campo obligatorio ausente deja la instancia `BLOCKED`.

---

#### 26. Unicidad por unidad

```text
1 implementation_unit_id
→ máximo 1 SHELL-AUTH-002::<implementation_unit_id>
→ máximo 1 implementación propietaria de los adapters de la unidad
→ máximo 1 snapshot de proyección activo por versión
→ N package_id consumidores mediante lineage
```

Los consumidores no copian adapters para evitar depender del package publicado.

---

#### 27. Doce gates de futura materialización

| Gate                     | PASS                                                                | Bloqueo                         |
| ------------------------ | ------------------------------------------------------------------- | ------------------------------- |
| 1. identidad             | unidad, owner, versiones y commits inequívocos                      | identidad ambigua               |
| 2. contratos             | todos los inputs/outputs validados con autoridad contractual        | casts o shapes paralelos        |
| 3. contexto              | `resolveAccessContext` conserva app fijo y backend autoritativo     | hechos del caller o fallback    |
| 4. decisión              | `evaluateAuthorization` conserva request exacto y decisión completa | booleano o reconstrucción local |
| 5. require               | solo ALLOW continúa; DENY/técnico bloquean                          | fail-open                       |
| 6. safe-context          | allowlist exacta, minimización y determinismo                       | fuga contextual                 |
| 7. safe-decision         | allowlist exacta y razones públicas                                 | evidencia interna expuesta      |
| 8. client                | parsers puros, sin red/Supabase/React                               | autorización desde navegador    |
| 9. errores               | deny, contrato y backend diferenciados sin fuga                     | error ambiguo o sensible        |
| 10. seguridad/paridad    | replay, manipulación y backend/RLS-RPC aplicable superados          | bypass o paridad sin evidencia  |
| 11. consumidores/lineage | matriz cerrada y una implementación por unidad                      | copia o evidencia stale         |
| 12. rollback             | regreso reproducible a combinación soportada                        | recuperación no ensayable       |

La instancia queda `PASS` solo con todos los gates aplicables en `PASS`.

---

#### 28. Perfil de pruebas

| Perfil         | Cobertura mínima                                                            |
| -------------- | --------------------------------------------------------------------------- |
| contractual    | request/context/decision/projections y versiones                            |
| unitaria       | app fijo, proyecciones, parsers client y traducción de fallos               |
| integración    | adapter ↔ resolver/evaluador cuando existan físicamente                     |
| denegaciones   | permiso/recurso/actor/sede/área/dispositivo/contexto inválidos              |
| seguridad      | app manipulado, replay, decisión como token, fuga, role bypass y client RPC |
| RLS/RPC        | paridad semántica cuando las superficies propietarias estén materializadas  |
| compatibilidad | package, consumidor, runtime, lockfile y subpath                            |
| regresión      | ausencia de booleanos autoritativos, casts y RPC legacy nuevas              |
| lineage        | unidad, versiones, commits, snapshot y digest                               |
| rollback       | restauración y repetición de pruebas esenciales                             |

Las pruebas RLS/RPC permanecen `NOT_EXECUTED` hasta existir los objetos físicos y ambiente autorizado; no pueden declararse `PASS` por documentación.

---

#### 29. Matriz mínima de escenarios

La futura instancia deberá cubrir como mínimo:

| Escenario                               | Resultado esperado                                      |
| --------------------------------------- | ------------------------------------------------------- |
| `app_code` manipulado o no publicado    | rechazo/fallo cerrado                                   |
| respuesta de contexto válida            | `AccessContextV1` validado                              |
| respuesta de contexto inválida          | `BACKEND_RESPONSE_INVALID`                              |
| request de decisión válido con allow    | decisión `ALLOW` validada                               |
| request válido con deny                 | decisión `DENY` preservada                              |
| backend de autorización no disponible   | `BACKEND_UNAVAILABLE`; nunca allow                      |
| permiso o recurso manipulados           | deny/rechazo según contrato; nunca corrección permisiva |
| actor/sede/área enviados como autoridad | input no admitido                                       |
| safe context                            | solo 12 campos aprobados                                |
| safe decision                           | solo 9 campos aprobados                                 |
| payload client con versión desconocida  | parser rechaza                                          |
| client intenta consultar autorización   | no existe API de red en `/client`                       |
| replay de proyección                    | no autoriza mutación                                    |
| role bypass                             | no existe bypass                                        |
| RLS/RPC aplicables                      | paridad con el mismo contrato/versiones                 |
| rollback                                | combinación anterior vuelve a pasar gates esenciales    |

---

#### 30. Evidencia requerida

| Clase                | Contenido mínimo                                    |
| -------------------- | --------------------------------------------------- |
| `LINEAGE`            | unidad, owner, consumidores, baseline/result commit |
| `CONTRACTS`          | versiones y validadores exactos                     |
| `SERVER_CONTEXT`     | fixtures válidos/inválidos y resultado del adapter  |
| `SERVER_DECISION`    | allow/deny/errores con request exacto               |
| `SAFE_CONTEXT`       | allowlist, payload y prueba de no filtración        |
| `SAFE_DECISION`      | allowlist, razones públicas y no evidencia interna  |
| `CLIENT_PURITY`      | grafo sin red, Supabase, React o renderer           |
| `SECURITY`           | manipulación, replay, bypass y leakage              |
| `BACKEND_PARITY`     | RPC/RLS cuando aplique, con ambiente y versión      |
| `COMPATIBILITY`      | consumidores, runtime, lockfile, subpath, resultado |
| `ARTIFACT_INTEGRITY` | package, versión, commit, digest                    |
| `ROLLBACK`           | combinación anterior, procedimiento y ensayo        |
| `CERTIFICATION`      | doce gates y estado agregado                        |

---

#### 31. Rollback

El rollback de una instancia deberá restaurar coordinadamente:

1. versión anterior soportada de `@vento/os-context`;
2. versión exacta compatible de `@vento/contracts`;
3. adapters server/client anteriores;
4. schemas de proyección compatibles;
5. manifest y lockfile de cada consumidor afectado;
6. configuración de transporte autorizada;
7. fixtures y evidencia de la combinación restaurada.

No se permite rollback mediante:

- reactivar `has_effective_permission_v1` como arquitectura final;
- restaurar `can_operate` o bypass como autoridad;
- editar `node_modules`;
- mutar una release publicada;
- reutilizar evidencia de otro commit o unidad.

---

#### 32. Hallazgos y destinos exactos

| Hallazgo                                                                 | Estado                     | Destino                                                         |
| ------------------------------------------------------------------------ | -------------------------- | --------------------------------------------------------------- |
| package actual consulta RPC legacy desde `client.ts`                     | `LEGACY_ACTIVO`            | `SHELL-AUTH-004`; migración en `SHELL-AUTH-005`                 |
| `EffectiveContext` no representa `AccessContextV1`                       | `LEGACY_NO_CANÓNICO`       | `SHELL-CTX-001` y futura instancia de esta tarea                |
| provider/hooks históricos entrarían React al SDK                         | `RECONCILIADO`             | permanecen en capa de presentación consumiendo `/client`        |
| backend canónico debe existir antes de integración física                | `DEPENDENCIA_DE_EJECUCIÓN` | `AUTH-DB-033`, `AUTH-DB-034` y tareas contextuales propietarias |
| scope, memoización y registro de consumidores no pertenecen a esta tarea | `RESERVADO`                | `SHELL-AUTH-003`                                                |
| lint/gate contra usos legacy no pertenece a esta tarea                   | `RESERVADO`                | `SHELL-AUTH-004`                                                |
| migración multi-repositorio no pertenece a esta tarea                    | `RESERVADO`                | `SHELL-AUTH-005`                                                |
| caché/frescura cross-request no pertenece a esta tarea                   | `RESERVADO`                | `SHELL-CTX-006`                                                 |

No se crea una tarea nueva ni queda pendiente sin propietario.

---

#### 33. Requisitos de prueba derivados

**Resultado:** GENERA 8 REQUISITOS DE PRUEBA.

**Requisitos creados:** **8**
**Requisitos modificados:** **0**

- `TREQ-SHELL-067` — `resolveAccessContext`: app canónico fijado, input mínimo, validación de `AccessContextV1` y fail-closed;
- `TREQ-SHELL-068` — `evaluateAuthorization`: request canónico exacto, decisión completa validada, sin contexto o autoridad fabricados por caller;
- `TREQ-SHELL-069` — `requireAuthorization`: solo `ALLOW` continúa; `DENY` y fallos técnicos permanecen diferenciados y bloquean ejecución;
- `TREQ-SHELL-070` — `SafeContextProjectionV1`: allowlist cerrada, minimización, determinismo y ausencia de evidencia sensible;
- `TREQ-SHELL-071` — `SafeDecisionProjectionV1`: razones públicas, field projection segura y prohibición de usarla como token o autorización de mutación;
- `TREQ-SHELL-072` — `/client`: parsers puros, sin red, Supabase o React, con rechazo de payload/versiones inválidos;
- `TREQ-SHELL-073` — traducción segura y fail-closed de denegación, contrato inválido e indisponibilidad/respuesta inválida de backend;
- `TREQ-SHELL-074` — una materialización por `implementation_unit_id`, pruebas de integración/seguridad/paridad aplicable, compatibilidad, lineage y rollback atribuibles a la misma combinación.

No se modifica, difiere, descarta ni obsoleta ningún requisito histórico.

---

#### 34. Puerta de cierre del marcador global

El marcador global queda documentalmente cerrado cuando:

1. conserva `SHELL-AUTH-001` como precedencia;
2. fija exactamente cinco operaciones server de esta tarea;
3. mantiene `createAuthorizationScope` reservado a `SHELL-AUTH-003`;
4. define inputs/outputs de contexto, decisión y require;
5. prohíbe autoridad del caller sobre actor, rol y territorio efectivo;
6. define `SafeContextProjectionV1` con 12 campos;
7. define `SafeDecisionProjectionV1` con 9 campos;
8. define allowlists y datos prohibidos;
9. fija dos parsers client puros;
10. reconcilia provider/hooks fuera del SDK;
11. conserva `@vento/contracts/authorization` como autoridad de tipos y validación;
12. distingue cuatro categorías internas de fallo;
13. prohíbe coerciones, booleanos y fail-open;
14. define replay/staleness sin convertir proyección en autoridad;
15. define gates, escenarios, evidencia y rollback;
16. crea `TREQ-SHELL-067` a `TREQ-SHELL-074`;
17. mantiene 0 código materializado, 0 RPC nuevas y 0 cambios Supabase en este marcador.

---

#### 35. Puerta de cierre de futura instancia

`SHELL-AUTH-002::<implementation_unit_id>` podrá quedar `PASS` únicamente cuando:

- la unidad y owner package estén habilitados por E5;
- las dependencias físicas declaradas del resolver/evaluador/contexto estén disponibles;
- los cinco server operations respeten el contrato;
- los dos DTO reproduzcan sus allowlists y versiones;
- `/client` permanezca puro y sin red/UI;
- las respuestas backend se validen antes de tiparse;
- no exista fail-open, role bypass, autoridad desde UI ni decisión reusable como token;
- integración y denegaciones tengan evidencia real;
- pruebas de seguridad estén en `PASS`;
- RLS/RPC aplicables tengan evidencia propia y no inferida;
- consumidores declarados tengan compatibilidad vigente;
- no exista otra materialización para la misma unidad;
- snapshot, versiones, commits y digest coincidan;
- rollback haya sido ensayado;
- `TREQ-SHELL-067` a `TREQ-SHELL-074` tengan evidencia atribuible a la misma instancia.

---

#### 36. Criterios de aceptación

- [x] `SHELL-AUTH-001` permanece como tarea anterior aprobada;
- [x] `SHELL-AUTH-003` permanece únicamente reservada;
- [x] el marcador se clasifica `PER_IMPLEMENTATION_UNIT`;
- [x] se separa desarrollo documental de materialización física;
- [x] se definen las cinco operaciones server propietarias de esta tarea;
- [x] no se anticipa `createAuthorizationScope`;
- [x] `resolveAccessContext` consume backend canónico y valida `AccessContextV1`;
- [x] `evaluateAuthorization` valida request y `AuthorizationDecisionV1` completos;
- [x] `requireAuthorization` solo continúa con `ALLOW`;
- [x] se definen dos DTO de proyección segura con allowlists exactas;
- [x] se excluyen evidencia, hashes, sesiones, IDs sensibles y metadata interna;
- [x] se definen dos parsers client sin red ni Supabase;
- [x] React/providers/hooks permanecen fuera del SDK;
- [x] se reutilizan tipos/códigos de `@vento/contracts/authorization`;
- [x] se distinguen DENY, contrato inválido e indisponibilidad/respuesta inválida de backend;
- [x] todo error falla cerrado;
- [x] UI y proyecciones no autorizan mutaciones;
- [x] replay no convierte `decision_id` ni DTO en token;
- [x] RLS/RPC exigen evidencia propia cuando apliquen;
- [x] se define snapshot determinista y huella;
- [x] se definen doce gates, pruebas, evidencia y rollback;
- [x] se crean exactamente ocho TREQ nuevos;
- [x] se declaran 0 cambios físicos, 0 migraciones y 0 cambios Supabase;
- [x] no se desarrolla `SHELL-AUTH-003`.

---

#### 37. Límites

Esta tarea no:

- modifica `packages/os-context`;
- crea archivos server/client físicos;
- publica `@vento/os-context`;
- crea `createAuthorizationScope`;
- implementa memoización request-scoped;
- crea registro de consumidores;
- crea providers o hooks React dentro del SDK;
- modifica aplicaciones consumidoras;
- crea lint, codemods o gates legacy;
- migra consumidores;
- implementa `get_access_context` o `evaluate_authorization`;
- crea SQL, RPC, RLS, migraciones, triggers, Storage, Realtime o Edge Functions;
- ejecuta Supabase;
- certifica RLS/RPC por inferencia;
- implementa caché cross-request;
- retira código legacy;
- ejecuta `SHELL-AUTH-002::<implementation_unit_id>`;
- avanza ni desarrolla la tarea siguiente.

---

#### 38. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-AUTH-001 — Consolidar @vento/os-context como SDK canónico de contexto y autorización`

**TAREA ACTUAL APROBADA**
`SHELL-AUTH-002 — Implementar adapters de servidor, cliente y proyecciones seguras`

**SIGUIENTE TAREA RESERVADA**
`SHELL-AUTH-003 — Implementar scope por solicitud y registro canónico de consumidores`


### ✅ SHELL-AUTH-003 — Implementar scope por solicitud y registro canónico de consumidores

**Estado:** APROBADA
**Tarea anterior:** SHELL-AUTH-002 — Implementar adapters de servidor, cliente y proyecciones seguras
**Tarea siguiente:** SHELL-AUTH-004 — Implementar lint, métricas y gates contra consumidores legacy
**Tipo de tarea:** documental — definición global única del scope por solicitud, deduplicación L0, correlación, write barrier y registro canónico materializado de consumidores, con futura materialización física `SHELL-AUTH-003::<implementation_unit_id>` una sola vez por unidad de implementación
**Bloque:** BLOQUE H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md`
**Estado físico resultante:** `CONTRATO_GLOBAL_DE_REQUEST_SCOPE_Y_REGISTRO_DE_CONSUMIDORES_ESPECIFICADO`; 1 factory pública reservada; 10 dimensiones de clave L0 de contexto; 11 dimensiones de clave L0 de decisión; 32 filas iniciales de consumidores; 15 campos por fila; 15 tipos de superficie; 0 unidades materializadas; 0 cambios Supabase
**Cambios físicos autorizados:** ninguno durante el marcador global
**Requisitos de prueba creados o modificados:** 8 creados (`TREQ-SHELL-075` a `TREQ-SHELL-082`)
**Modalidad:** `PER_IMPLEMENTATION_UNIT`

---

#### 1. Propósito

`SHELL-AUTH-003` cierra el contrato del scope request-scoped de autorización y materializa el primer registro canónico de consumidores que deberán migrar hacia `@vento/os-context`.

La tarea resuelve dos responsabilidades inseparables:

```text
UNA SOLICITUD DE SERVIDOR
→ un app_code fijo
→ una identidad de principal/sesión confiable
→ una correlación
→ una resolución de contexto deduplicada L0
→ decisiones exactas deduplicables solo cuando son idénticas
→ write barrier después de mutaciones relevantes
```

```text
CADA FRONTERA QUE CONSUME AUTORIZACIÓN O CONTEXTO
→ una fila identificable
→ API actual
→ API objetivo
→ propietario
→ estado
→ evidencia
→ gate de retiro
```

El marcador global no crea todavía código de scope, caché, registry físico ejecutable, migraciones ni cambios en aplicaciones. Sí define completamente su forma y materializa las **32 filas iniciales** respaldadas por la auditoría canónica y el estado remoto verificado.

---

#### 2. Modalidad canónica y ciclo

La topología aplicable es `PER_IMPLEMENTATION_UNIT`.

```text
MARCADOR GLOBAL SHELL-AUTH-003
→ define una vez scope, L0, registro, fixtures, gates y evidencia
→ conserva un snapshot documental reproducible
→ no modifica runtime

DELIV-PKG-025::<package_id>
→ asigna implementation_unit_id y owner package

E5-GATE-008::<package_id> = PASS
→ habilita la futura materialización

SHELL-AUTH-003::<implementation_unit_id>
→ materializa una sola implementación del scope y registro para la unidad
→ N package_id consumen la misma implementación mediante lineage
```

**Dependencia para desarrollar:** `SHELL-AUTH-002`.

**Dependencias para ejecutar una instancia:** `DELIV-PKG-025::<package_id>`, `E5-GATE-008::<package_id> = PASS`, materialización compatible de `SHELL-AUTH-001` y `SHELL-AUTH-002` para la unidad, contratos exactos publicados y, cuando apliquen, `AUTH-DB-033`, `AUTH-DB-034`, `AUTH-DB-035` y `SHELL-CTX-001` a `SHELL-CTX-006` materializados conforme al paquete propietario.

---

#### 3. Fuentes vinculantes preservadas

| Fuente                    | Regla preservada                                                                                          |
| ------------------------- | --------------------------------------------------------------------------------------------------------- |
| `SHELL-AUTH-001`          | `createAuthorizationScope` pertenece a esta tarea; SDK único y cuatro subpaths públicos                   |
| `SHELL-AUTH-002`          | cinco operaciones server y dos proyecciones seguras ya definidas; esta tarea las compone, no las redefine |
| `AUTH-CTX-027`            | scope por request, resolución única, correlación y registro de consumidores con 15 campos mínimos         |
| `AUTH-CTX-029`            | L0 request-scoped; promise dedup; clave de contexto y decisión; write barrier; L1 separado                |
| `SHELL-AUD-003`           | helpers y consumidores de permisos distribuidos, llamadas directas y fallbacks locales                    |
| `SHELL-AUD-004`           | seis `operational-session.ts`, NEXO `operational-context.ts` y falta de adopción del SDK                  |
| `SHELL-CON-002..008`      | identidades y contratos compartidos, validación fail-closed y códigos canónicos                           |
| `SHELL-PKG-004`           | compatibilidad por consumidor, commit, lockfile, runtime y subpath                                        |
| `SHELL-PKG-005`           | deprecación y retiro requieren consumidor, reemplazo, evidencia y gate                                    |
| `task-work-topology.json` | una materialización máxima por `implementation_unit_id`                                                   |

No se reabre el significado de contexto, autorización, frescura, caché compartida ni de las proyecciones seguras.

---

#### 4. Línea base física verificable

El estado actual conserva simultáneamente:

- `@vento/os-context@0.1.0` privado, con export raíz a source y sin `createAuthorizationScope` físico;
- seis repositorios web con `src/lib/auth/permissions.ts`, `guard.ts` y `operational-session.ts`;
- NEXO con `src/lib/auth/operational-context.ts` adicional;
- SHELL con evaluador local en `src/app/page.tsx`;
- ANIMA con `src/hooks/use-app-permissions.ts` que llama `has_permission` desde cliente;
- superficies funcionales VISO, ORIGO y PULSO que alcanzan autorización mediante RPC o helpers locales;
- ninguna adopción runtime confirmada de la superficie estable futura de `@vento/os-context`.

Esta coexistencia es baseline de migración, no arquitectura final.

---

#### 5. Factory pública `createAuthorizationScope`

`@vento/os-context/server` reservará exactamente la factory:

```ts
createAuthorizationScope({ appCode, requestIdentity, correlationId })
  → AuthorizationScope
```

`appCode` es `AppCode` canónico fijado por el adapter propietario. `requestIdentity` representa únicamente identidad técnica confiable de la frontera server; no es un objeto libre suministrado por UI.

El scope:

- vive como máximo durante una solicitud lógica;
- no concede autoridad por existir;
- no es serializable al cliente;
- no se almacena en variable global, singleton, módulo mutable o caché cross-request;
- compone las operaciones ya definidas por `SHELL-AUTH-002`;
- propaga correlación y metadata de versión;
- mantiene L0 únicamente para deduplicación dentro de la misma solicitud.

No se crean aliases públicos `getScope`, `currentScope`, `globalAuthorizationScope` ni equivalentes.

---

#### 6. Entradas confiables y frontera de autoridad

El scope solo puede construirse desde una frontera server capaz de demostrar:

1. ambiente;
2. organización cuando aplique;
3. aplicación fija;
4. principal técnico autenticado o principal de sistema registrado;
5. identidad de sesión autenticada;
6. sesión de actor cuando exista dispositivo compartido;
7. proceso de sistema cuando aplique;
8. versiones contractuales/resolver aplicables;
9. correlación opcional.

No podrá aceptar como hechos autoritativos desde query, body, cookie editable, local storage, estado UI o parámetros libres:

- actor efectivo;
- employee_id;
- rol base u operativo;
- sede o área efectivas;
- turno o check-in;
- dispositivo efectivo;
- permiso concedido;
- `can_operate`;
- bypass;
- `AuthorizationDecision` fabricada.

---

#### 7. Clave L0 de contexto

La identidad de memoización request-scoped queda cerrada en **10 dimensiones**:

```text
environment
organization_id
app_code
principal_type
principal_id
auth_session_id
actor_session_id
system_process_id
context_contract_version
resolver_version
```

Reglas:

- todas las dimensiones aplicables forman la clave; no se omiten para mejorar hit-rate;
- `actor_session_id` es obligatorio cuando un dispositivo compartido opera con actor humano;
- un cambio de actor produce otra clave;
- permiso, recurso, ruta, botón, sede seleccionada, área seleccionada y role override no pertenecen a esta clave;
- una aplicación distinta produce otra clave aunque comparta principal;
- la representación física de la clave deberá ser determinista y no incluir secretos completos.

---

#### 8. Memoización L0 de contexto y single-flight

La estructura conceptual es:

```ts
Map<ContextRequestKey, Promise<AccessContextV1>>
```

Invariantes:

1. la primera resolución almacena la `Promise` en curso;
2. llamadas concurrentes con la misma clave esperan esa misma promesa;
3. una resolución correcta puede reutilizarse únicamente dentro del mismo scope y mientras no exista write barrier aplicable;
4. una promesa rechazada se elimina para permitir reintento explícito;
5. el mapa muere con la solicitud;
6. no existe TTL en L0;
7. no comparte datos entre usuarios, solicitudes, procesos o workers;
8. no sustituye la caché L1 gobernada por `SHELL-CTX-006`;
9. un hit L0 no evita validar vigencia cuando una operación posterior exija revalidación.

---

#### 9. Deduplicación L0 de decisiones

Solo una evaluación **exactamente idéntica** puede compartir promesa dentro de la misma solicitud.

La clave queda cerrada en **11 dimensiones**:

```text
context_fingerprint
app_code
permission_key
authorization_requirement
operation_kind
resource_type
resource_ids
resource_version
resource_fingerprint
requested_fields
request_source
```

Reglas:

- `resource_ids` y `requested_fields` se canonicalizan según su contrato antes de formar la clave;
- un recurso, versión, fingerprint, campo solicitado u operation_kind distinto produce otra evaluación;
- una decisión nunca se comparte entre requests;
- una decisión nunca es token de capacidad;
- una proyección `ALLOW` previa no autoriza una mutación posterior;
- el scope puede deduplicar evaluación concurrente, pero `requireAuthorization` conserva la obligación de revalidar cuando el recurso o contexto puedan haber cambiado.

---

#### 10. Write barrier request-scoped

Después de una mutación que pueda alterar hechos de contexto, autorización, recurso o vigencia dentro de la misma solicitud lógica, el scope deberá aplicar una barrera:

```text
MUTACIÓN RELEVANTE
→ marcar sujeto/app como dirty
→ invalidar L0 de contexto aplicable
→ invalidar L0 de decisiones aplicable
→ obtener estado/frescura nuevamente cuando la infraestructura física lo permita
→ resolver contexto nuevo
→ emitir decisión nueva
```

Está prohibido seguir usando un contexto o decisión anterior a la barrera para una operación posterior afectada.

`SHELL-AUTH-003` define y materializará la barrera L0. El token transaccional de frescura, eventos de invalidación y caché compartida L1 permanecen en `AUTH-DB-035` y `SHELL-CTX-006`.

---

#### 11. Correlación y observabilidad

`correlation_id` es metadata de trazabilidad, nunca evidencia positiva de autorización.

El scope deberá propagarla, cuando exista, hacia:

- resolución;
- evaluación;
- require;
- ejecución enlazada;
- auditoría;
- error seguro;
- métricas técnicas.

La observabilidad podrá registrar:

- versión del SDK;
- consumidor registrado;
- latencia;
- L0 hit/miss/single-flight;
- cantidad de evaluaciones;
- outcome agregado;
- categoría de fallo técnico;
- uso de superficie legacy.

No podrá registrar secretos, payloads completos, grants/denies sensibles, JWT, service role, stack traces o datos personales innecesarios.

---

#### 12. Frontera con caché compartida

```text
L0 REQUEST-SCOPED
→ SHELL-AUTH-003

L1 SHARED VALIDATED CACHE
→ SHELL-CTX-006
+
AUTH-DB-035

L2 SAFE CLIENT PROJECTION
→ SHELL-AUTH-002 / client consumer
```

Por tanto esta tarea no define TTL global, Redis, memoria de proceso compartida, Realtime de invalidación ni estrategia cross-request.

---

#### 13. Contrato del registro canónico de consumidores

Cada fila conserva exactamente estos **15 campos mínimos**:

```text
repository
path
surface_type
consumer_name
app_code
current_api
target_api
permission_source
resource_source
legacy_behavior
migration_task
owner
status
test_evidence
removal_gate
```

La identidad estable de fila es la tupla:

```text
(repository, path, surface_type, consumer_name)
```

No se asignan números arbitrarios que puedan cambiar al reordenar el inventario.

Una ruta no puede aparecer dos veces con la misma identidad de fila. Dos consumidores distintos en un mismo archivo solo se separan cuando tienen superficie o contrato de migración materialmente distinto.

---

#### 14. Taxonomía de `surface_type`

Se preservan los trece valores iniciales de `AUTH-CTX-027` y se añaden dos tipos necesarios para representar fronteras técnicas directas ya observadas:

```text
SERVER_COMPONENT
LAYOUT
SERVER_ACTION
ROUTE_HANDLER
CLIENT_HOOK
CLIENT_COMPONENT
NAVIGATION
MIDDLEWARE
RPC
RLS
JOB
EDGE_FUNCTION
REALTIME
SERVER_HELPER
SDK_ADAPTER
```

`SERVER_HELPER` identifica helpers/guards server que consumen o reconstruyen contexto/autorización. `SDK_ADAPTER` identifica una frontera compartida de SDK que envuelve una API backend. Estos dos valores no convierten helpers locales en arquitectura final; permiten registrarlos sin falsear su naturaleza como `RPC`, `MIDDLEWARE` o componente UI.

---

#### 15. Estados del registro

Se reutiliza la taxonomía de compatibilidad de `SHELL-PKG-004`:

```text
NO_APLICA
PENDIENTE_DE_EVIDENCIA
COMPATIBLE
COMPATIBLE_CON_RESTRICCIONES
INCOMPATIBLE
BLOQUEADA
```

El marcador global no declara ningún consumidor `COMPATIBLE` con una superficie que todavía no está materializada. Las **32 filas** iniciales quedan `PENDIENTE_DE_EVIDENCIA` hasta que la futura instancia y `SHELL-AUTH-005` produzcan evidencia de migración.

---

#### 16. Registro inicial materializado

El siguiente inventario contiene una fila por frontera directa o adapter técnico actualmente identificado. Los callers transitivos deberán vincularse a una de estas fronteras o crear una fila nueva antes de introducir otro consumo directo.

| repository                 | path                                                   | surface_type     | consumer_name                                | app_code  | current_api                                                                        | target_api                                                                                                    | permission_source                                         | resource_source                                                | legacy_behavior                                                                                    | migration_task | owner                      | status                 | test_evidence                                                 | removal_gate                                                          |
| -------------------------- | ------------------------------------------------------ | ---------------- | -------------------------------------------- | --------- | ---------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------- | -------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- | -------------- | -------------------------- | ---------------------- | ------------------------------------------------------------- | --------------------------------------------------------------------- |
| devVentoGroup/vento-viso   | src/lib/auth/permissions.ts                            | SERVER_HELPER    | VISO permission helper                       | viso      | normalizePermissionCode + has_permission → boolean                                 | createAuthorizationScope + evaluateAuthorization/requireAuthorization                                         | string local; prefijo de aplicación construido localmente | siteId/areaId opcionales suministrados por caller              | clave no validada contra catálogo; error técnico colapsado a false                                 | SHELL-AUTH-005 | devVentoGroup/vento-viso   | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-viso   | src/lib/auth/guard.ts                                  | SERVER_HELPER    | VISO application guard                       | viso      | requireAppAccess + has_permission + operational-session + role override            | createAuthorizationScope + requireAuthorization                                                               | claves locales/normalizadas; ramas de role override       | siteId/areaId preferidos y sesión operativa local              | múltiples rutas de decisión; booleanos; override local; protección no centralizada                 | SHELL-AUTH-005 | devVentoGroup/vento-viso   | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-viso   | src/lib/auth/operational-session.ts                    | SERVER_HELPER    | VISO operational-session                     | viso      | resolver local de sesión/dispositivo y helpers de permiso operativo                | createAuthorizationScope + resolveAccessContext                                                               | rol/permisos locales según rama                           | preferredSiteId/preferredAreaId y estado de dispositivo/sesión | proyección local; caller puede influir sede/área; no es AccessContextV1                            | SHELL-AUTH-005 | devVentoGroup/vento-viso   | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-nexo   | src/lib/auth/permissions.ts                            | SERVER_HELPER    | NEXO permission helper                       | nexo      | normalizePermissionCode + has_permission → boolean                                 | createAuthorizationScope + evaluateAuthorization/requireAuthorization                                         | string local; prefijo de aplicación construido localmente | siteId/areaId opcionales suministrados por caller              | clave no validada contra catálogo; error técnico colapsado a false                                 | SHELL-AUTH-005 | devVentoGroup/vento-nexo   | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-nexo   | src/lib/auth/guard.ts                                  | SERVER_HELPER    | NEXO application guard                       | nexo      | requireAppAccess + has_permission + operational-session + role override            | createAuthorizationScope + requireAuthorization                                                               | claves locales/normalizadas; ramas de role override       | siteId/areaId preferidos y sesión operativa local              | múltiples rutas de decisión; booleanos; override local; protección no centralizada                 | SHELL-AUTH-005 | devVentoGroup/vento-nexo   | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-nexo   | src/lib/auth/operational-session.ts                    | SERVER_HELPER    | NEXO operational-session                     | nexo      | resolver local de sesión/dispositivo y helpers de permiso operativo                | createAuthorizationScope + resolveAccessContext                                                               | rol/permisos locales según rama                           | preferredSiteId/preferredAreaId y estado de dispositivo/sesión | proyección local; caller puede influir sede/área; no es AccessContextV1                            | SHELL-AUTH-005 | devVentoGroup/vento-nexo   | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-fogo   | src/lib/auth/permissions.ts                            | SERVER_HELPER    | FOGO permission helper                       | fogo      | normalizePermissionCode + has_permission → boolean                                 | createAuthorizationScope + evaluateAuthorization/requireAuthorization                                         | string local; prefijo de aplicación construido localmente | siteId/areaId opcionales suministrados por caller              | clave no validada contra catálogo; error técnico colapsado a false                                 | SHELL-AUTH-005 | devVentoGroup/vento-fogo   | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-fogo   | src/lib/auth/guard.ts                                  | SERVER_HELPER    | FOGO application guard                       | fogo      | requireAppAccess + has_permission + operational-session + role override            | createAuthorizationScope + requireAuthorization                                                               | claves locales/normalizadas; ramas de role override       | siteId/areaId preferidos y sesión operativa local              | múltiples rutas de decisión; booleanos; override local; protección no centralizada                 | SHELL-AUTH-005 | devVentoGroup/vento-fogo   | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-fogo   | src/lib/auth/operational-session.ts                    | SERVER_HELPER    | FOGO operational-session                     | fogo      | resolver local de sesión/dispositivo y helpers de permiso operativo                | createAuthorizationScope + resolveAccessContext                                                               | rol/permisos locales según rama                           | preferredSiteId/preferredAreaId y estado de dispositivo/sesión | proyección local; caller puede influir sede/área; no es AccessContextV1                            | SHELL-AUTH-005 | devVentoGroup/vento-fogo   | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-origo  | src/lib/auth/permissions.ts                            | SERVER_HELPER    | ORIGO permission helper                      | origo     | normalizePermissionCode + has_permission → boolean                                 | createAuthorizationScope + evaluateAuthorization/requireAuthorization                                         | string local; prefijo de aplicación construido localmente | siteId/areaId opcionales suministrados por caller              | clave no validada contra catálogo; error técnico colapsado a false                                 | SHELL-AUTH-005 | devVentoGroup/vento-origo  | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-origo  | src/lib/auth/guard.ts                                  | SERVER_HELPER    | ORIGO application guard                      | origo     | requireAppAccess + has_permission + operational-session + role override            | createAuthorizationScope + requireAuthorization                                                               | claves locales/normalizadas; ramas de role override       | siteId/areaId preferidos y sesión operativa local              | múltiples rutas de decisión; booleanos; override local; protección no centralizada                 | SHELL-AUTH-005 | devVentoGroup/vento-origo  | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-origo  | src/lib/auth/operational-session.ts                    | SERVER_HELPER    | ORIGO operational-session                    | origo     | resolver local de sesión/dispositivo y helpers de permiso operativo                | createAuthorizationScope + resolveAccessContext                                                               | rol/permisos locales según rama                           | preferredSiteId/preferredAreaId y estado de dispositivo/sesión | proyección local; caller puede influir sede/área; no es AccessContextV1                            | SHELL-AUTH-005 | devVentoGroup/vento-origo  | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-pulso  | src/lib/auth/permissions.ts                            | SERVER_HELPER    | PULSO permission helper                      | pulso     | normalizePermissionCode + has_permission → boolean                                 | createAuthorizationScope + evaluateAuthorization/requireAuthorization                                         | string local; prefijo de aplicación construido localmente | siteId/areaId opcionales suministrados por caller              | clave no validada contra catálogo; error técnico colapsado a false                                 | SHELL-AUTH-005 | devVentoGroup/vento-pulso  | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-pulso  | src/lib/auth/guard.ts                                  | SERVER_HELPER    | PULSO application guard                      | pulso     | requireAppAccess + has_permission + operational-session + role override            | createAuthorizationScope + requireAuthorization                                                               | claves locales/normalizadas; ramas de role override       | siteId/areaId preferidos y sesión operativa local              | múltiples rutas de decisión; booleanos; override local; protección no centralizada                 | SHELL-AUTH-005 | devVentoGroup/vento-pulso  | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-pulso  | src/lib/auth/operational-session.ts                    | SERVER_HELPER    | PULSO operational-session                    | pulso     | resolver local de sesión/dispositivo y helpers de permiso operativo                | createAuthorizationScope + resolveAccessContext                                                               | rol/permisos locales según rama                           | preferredSiteId/preferredAreaId y estado de dispositivo/sesión | proyección local; caller puede influir sede/área; no es AccessContextV1                            | SHELL-AUTH-005 | devVentoGroup/vento-pulso  | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-numera | src/lib/auth/permissions.ts                            | SERVER_HELPER    | NUMERA permission helper                     | numera    | normalizePermissionCode + has_permission → boolean                                 | createAuthorizationScope + evaluateAuthorization/requireAuthorization                                         | string local; prefijo de aplicación construido localmente | siteId/areaId opcionales suministrados por caller              | clave no validada contra catálogo; error técnico colapsado a false                                 | SHELL-AUTH-005 | devVentoGroup/vento-numera | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-numera | src/lib/auth/guard.ts                                  | SERVER_HELPER    | NUMERA application guard                     | numera    | requireAppAccess + has_permission + operational-session + role override            | createAuthorizationScope + requireAuthorization                                                               | claves locales/normalizadas; ramas de role override       | siteId/areaId preferidos y sesión operativa local              | múltiples rutas de decisión; booleanos; override local; protección no centralizada                 | SHELL-AUTH-005 | devVentoGroup/vento-numera | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-numera | src/lib/auth/operational-session.ts                    | SERVER_HELPER    | NUMERA operational-session                   | numera    | resolver local de sesión/dispositivo y helpers de permiso operativo                | createAuthorizationScope + resolveAccessContext                                                               | rol/permisos locales según rama                           | preferredSiteId/preferredAreaId y estado de dispositivo/sesión | proyección local; caller puede influir sede/área; no es AccessContextV1                            | SHELL-AUTH-005 | devVentoGroup/vento-numera | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-nexo   | src/lib/auth/operational-context.ts                    | SERVER_HELPER    | NEXO operational context                     | nexo      | get_operational_context + has_operational_permission + can_operate + role override | createAuthorizationScope + resolveAccessContext + evaluateAuthorization/requireAuthorization                  | permissionCode string; appCode opcional/derivable         | employeeId/siteId/areaId del caller + contexto legacy          | contexto plano; can_operate; bypass/override; área y rol modificables localmente                   | SHELL-AUTH-005 | devVentoGroup/vento-nexo   | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-shell  | src/app/page.tsx                                       | SERVER_COMPONENT | SHELL application launcher                   | shell     | has_permission con firma completa y fallback a p_app_id/p_code                     | createAuthorizationScope + evaluateAuthorization + SafeDecisionProjectionV1                                   | cinco claves literales de acceso a aplicaciones           | NON_RESOURCE / acceso a aplicación                             | evaluador local; fallback entre firmas RPC; resultado booleano                                     | SHELL-AUTH-005 | devVentoGroup/vento-shell  | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-viso   | src/app/api/viso/upload-product-image/route.ts         | ROUTE_HANDLER    | VISO product-image upload                    | viso      | has_permission / guard local según superficie                                      | createAuthorizationScope + evaluateAuthorization/requireAuthorization                                         | viso.menu.images.manage                                   | recurso de Storage y payload de imagen                         | autorización distribuida en superficie; error/deny no conserva decisión canónica                   | SHELL-AUTH-005 | devVentoGroup/vento-viso   | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-viso   | src/app/api/viso/upload-commercial-menu-image/route.ts | ROUTE_HANDLER    | VISO commercial-menu image upload            | viso      | has_permission / guard local según superficie                                      | createAuthorizationScope + evaluateAuthorization/requireAuthorization                                         | viso.menu.images.manage                                   | recurso de Storage y owner/kind del request                    | autorización distribuida en superficie; error/deny no conserva decisión canónica                   | SHELL-AUTH-005 | devVentoGroup/vento-viso   | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-viso   | src/app/api/viso/attendance-report/route.ts            | ROUTE_HANDLER    | VISO attendance report                       | viso      | has_permission / guard local según superficie                                      | createAuthorizationScope + evaluateAuthorization/requireAuthorization                                         | permisos VISO de reporte                                  | reporte y relaciones laborales resueltas en servidor           | autorización distribuida en superficie; error/deny no conserva decisión canónica                   | SHELL-AUTH-005 | devVentoGroup/vento-viso   | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-viso   | src/app/staff/[id]/page.tsx                            | SERVER_COMPONENT | VISO staff detail                            | viso      | has_permission / guard local según superficie                                      | createAuthorizationScope + evaluateAuthorization/requireAuthorization                                         | permisos VISO de staff                                    | trabajador identificado por ruta y datos server                | autorización distribuida en superficie; error/deny no conserva decisión canónica                   | SHELL-AUTH-005 | devVentoGroup/vento-viso   | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-origo  | src/lib/suppliers.ts                                   | SERVER_HELPER    | ORIGO supplier management                    | origo     | has_permission + fallback local por rol                                            | createAuthorizationScope + evaluateAuthorization/requireAuthorization                                         | origo.suppliers.manage                                    | supplier/user server context                                   | control local; no conserva AuthorizationDecisionV1; en suppliers existe fallback permisivo por rol | SHELL-AUTH-005 | devVentoGroup/vento-origo  | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-origo  | src/app/receipts/new/page.tsx                          | SERVER_COMPONENT | ORIGO receipt creation                       | origo     | requireAppAccess + operational-session                                             | createAuthorizationScope + evaluateAuthorization/requireAuthorization                                         | procurement.receipts                                      | recepción, sede y actor resueltos por helpers locales          | control local; no conserva AuthorizationDecisionV1; en suppliers existe fallback permisivo por rol | SHELL-AUTH-005 | devVentoGroup/vento-origo  | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-origo  | src/app/product-master-review/page.tsx                 | SERVER_COMPONENT | ORIGO product master review                  | origo     | requireAppAccess                                                                   | createAuthorizationScope + evaluateAuthorization/requireAuthorization                                         | procurement.receipts                                      | review request/product/entry en servidor                       | control local; no conserva AuthorizationDecisionV1; en suppliers existe fallback permisivo por rol | SHELL-AUTH-005 | devVentoGroup/vento-origo  | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-origo  | src/app/purchase-orders/[id]/pdf/route.ts              | ROUTE_HANDLER    | ORIGO purchase-order PDF                     | origo     | control local de ruta/permiso según rama                                           | createAuthorizationScope + evaluateAuthorization/requireAuthorization                                         | origo.access / control de ruta según rama                 | purchase order + token/identidad de solicitud                  | control local; no conserva AuthorizationDecisionV1; en suppliers existe fallback permisivo por rol | SHELL-AUTH-005 | devVentoGroup/vento-origo  | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-pulso  | src/modules/pos/actions/identify-client.action.ts      | SERVER_ACTION    | PULSO identify client                        | pulso     | has_permission(pulso.pos.main, siteId) → boolean                                   | createAuthorizationScope + requireAuthorization sobre recurso exacto                                          | literal pulso.pos.main                                    | siteId del argumento + cliente resuelto en servidor            | siteId del caller participa en la RPC; error/deny se reduce a mensaje local                        | SHELL-AUTH-005 | devVentoGroup/vento-pulso  | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-pulso  | src/app/orders/delivery-override-bridge.tsx            | CLIENT_COMPONENT | PULSO delivery override visibility           | pulso     | browser has_permission(pulso.delivery.override, siteId) + RPC de override          | SafeDecisionProjectionV1 emitida en servidor + parseSafeDecisionProjection; mutación reautorizada en servidor | literal pulso.delivery.override                           | orderId/siteId obtenidos del DOM/formulario                    | cliente consulta autorización directamente; visibilidad depende de booleano y no conserva error    | SHELL-AUTH-005 | devVentoGroup/vento-pulso  | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-anima  | src/hooks/use-app-permissions.ts                       | CLIENT_HOOK      | ANIMA app permissions hook                   | anima     | browser has_permission por cada permissionCode → Record<string, boolean>           | SafeDecisionProjectionV1 emitida en servidor + parseSafeDecisionProjection                                    | permissionCodes recibidos por el hook                     | sin recurso exacto en el hook                                  | N RPC cliente por lista; múltiples snapshots; error se reduce a ausencia/false                     | SHELL-AUTH-005 | devVentoGroup/vento-anima  | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |
| devVentoGroup/vento-shell  | packages/os-context/src/client.ts                      | SDK_ADAPTER      | @vento/os-context transitional legacy client | NO_APLICA | get_effective_context_v1 + has_effective_permission_v1 + simulación v1             | @vento/os-context/legacy durante transición; /server y /client como fronteras canónicas                       | permissionCode/appCode string legacy                      | contexto efectivo legacy sin recurso exacto                    | package 0.1.0 transitorio; casts/booleanos; mezcla compatibilidad y simulación                     | SHELL-AUTH-005 | devVentoGroup/vento-shell  | PENDIENTE_DE_EVIDENCIA | Ruta vigente o inventariada; pruebas de migración pendientes. | SHELL-AUTH-004 → SHELL-AUTH-005; AUTH-DB-030 cuando retire RPC legacy |


**Conciliación:** 32 filas esperadas, 32 materializadas, 32 identidades compuestas únicas y 0 duplicadas.

---

#### 17. Cobertura obligatoria reconciliada

| Ámbito                | Filas | Estado                   | Conciliación                                                                        |
| --------------------- | ----: | ------------------------ | ----------------------------------------------------------------------------------- |
| SHELL                 |     1 | `MATERIALIZADO`          | launcher directo; shared SDK se cuenta en servicios compartidos                     |
| VISO                  |     7 | `MATERIALIZADO`          | 3 fronteras auth comunes + 4 superficies funcionales auditadas                      |
| NEXO                  |     4 | `MATERIALIZADO`          | 3 fronteras auth comunes + operational-context                                      |
| FOGO                  |     3 | `MATERIALIZADO`          | 3 fronteras auth comunes                                                            |
| ORIGO                 |     7 | `MATERIALIZADO`          | 3 fronteras auth comunes + 4 superficies funcionales auditadas                      |
| PULSO                 |     5 | `MATERIALIZADO`          | 3 fronteras auth comunes + Server Action + client component                         |
| NUMERA                |     3 | `MATERIALIZADO`          | 3 fronteras auth comunes                                                            |
| ANIMA                 |     1 | `MATERIALIZADO`          | client hook directo confirmado                                                      |
| PASS                  |     0 | `NO_APLICA`              | AUTH-CTX-027 excluye contexto laboral interno por defecto; no se inventa consumidor |
| AURA                  |     0 | `PENDIENTE_DE_EVIDENCIA` | repositorio runtime no confirmado; adopción futura exige registro antes de operar   |
| SERVICIOS_COMPARTIDOS |     1 | `MATERIALIZADO`          | packages/os-context/src/client.ts como adapter legacy transitorio                   |


La suma materializada es **32**. `PASS` no recibe por defecto contexto laboral interno según `AUTH-CTX-027`; por eso no se fabrica una fila. `AURA` permanece sin repositorio runtime confirmado en este corte, de modo que tampoco se inventa una ruta: su primera superficie real deberá registrarse al materializar `AURA-AUTH-001` y antes de adoptar contexto o autorización interna.

---

#### 18. Reglas de evolución del registro

1. toda nueva llamada directa a una API de contexto/autorización exige fila antes de merge;
2. una fila no se elimina por migrarse: cambia estado, API objetivo/evidencia y conserva trazabilidad hasta superar el gate de retiro;
3. un cambio de ruta actualiza la identidad mediante una transición explícita, no mediante pérdida silenciosa;
4. una copia nueva de helper se registra como consumidor nuevo y `SHELL-AUTH-004` deberá bloquearla cuando el gate físico exista;
5. el registro no declara compatibilidad por similitud de código;
6. cada consumidor conserva commit/lockfile/runtime en la evidencia física de la futura instancia aunque esos campos no se dupliquen como columnas base;
7. consumidores SQL/RLS/RPC se incorporan cuando `AUTH-DB-006` a `AUTH-DB-010` y `AUTH-DB-021` materialicen las superficies aplicables; no se inventan desde nombres documentales;
8. cada paquete consumidor queda ligado a `implementation_unit_id`, versión, snapshot y digest en la materialización.

---

#### 19. Disposición de las familias actuales

| Familia                             | Estado actual                          | API objetivo                                              |
| ----------------------------------- | -------------------------------------- | --------------------------------------------------------- |
| `permissions.ts` x6                 | helper booleano y clave string         | scope + evaluate/require                                  |
| `guard.ts` x6                       | guard distribuido, role override y RPC | scope + require                                           |
| `operational-session.ts` x6         | sesión/contexto local                  | scope + canonical AccessContext                           |
| NEXO `operational-context.ts`       | contexto/RPC operativa legacy          | scope + resolve/evaluate/require                          |
| direct server surfaces              | RPC/helper local                       | scope + exact resource decision                           |
| PULSO client component              | `has_permission` desde browser         | safe decision emitida en server                           |
| ANIMA client hook                   | N RPC browser por permission           | safe decisions emitidas en server                         |
| `packages/os-context/src/client.ts` | wrapper legacy 0.1.0                   | `/legacy` durante transición; `/server`/`/client` finales |

No se migra ninguna fila durante este marcador.

---

#### 20. Fixtures y utilidades de prueba

`@vento/os-context/testing` podrá materializar fixtures sintéticos y deterministas para esta tarea. Como mínimo deberá cubrir:

1. dos llamadas concurrentes con misma clave de contexto → una resolución;
2. cambio de `actor_session_id` → dos resoluciones;
3. primera resolución fallida → entrada eliminada → reintento permitido;
4. dos decisiones con clave exacta → una evaluación concurrente;
5. mismo permiso sobre recurso distinto → dos evaluaciones;
6. write barrier → contexto/decisión anterior no reutilizables;
7. correlación propagada sin conceder autoridad;
8. fila de registro válida de 15 campos;
9. identidad compuesta duplicada → rechazo;
10. superficie client directa a RPC legacy → estado no compatible;
11. PASS laboral sin consumidor → `NO_APLICA`, sin fila sintética;
12. AURA sin repo confirmado → cobertura pendiente, sin path inventado.

Fixtures y factories usan únicamente contratos/códigos publicados; no llaman servicios remotos para decidir el oracle.

---

#### 21. Snapshot contractual

Se define:

```text
snapshot_id = SHELL-AUTH-REQUEST-SCOPE-CONSUMERS-001
schema = vento.os-context-request-scope-consumers@1
public_factory = createAuthorizationScope
context_l0_key_dimension_count = 10
decision_l0_key_dimension_count = 11
context_l0_storage = Map<ContextRequestKey, Promise<AccessContextV1>>
registry_field_count = 15
registry_surface_type_count = 15
current_consumer_row_count = 32
pass_labor_context_consumer_rows = 0
aura_repository_confirmed = false
l1_shared_cache_owned_here = false
write_barrier = true
correlation_grants_authority = false
```

Huella documental:

`sha256:8facc1cf1938f9221e5991cc854e0891ecc9cf338a14ddf7342fdc2f878e2f56`

La serialización normativa del snapshot usa JSON UTF-8 en una línea, claves de objeto ordenadas lexicográficamente y arrays en el orden contractual declarado.

---

#### 22. Contrato de entrada de futura instancia

Toda `SHELL-AUTH-003::<implementation_unit_id>` registrará como mínimo:

| Campo                         | Obligación                                                   |
| ----------------------------- | ------------------------------------------------------------ |
| `implementation_unit_id`      | unidad exacta asignada por E5                                |
| `owner_package_id`            | paquete propietario habilitado                               |
| `consumer_package_ids`        | consumidores exactos de la unidad                            |
| baseline / result commit      | commits atribuibles                                          |
| SDK/contracts versions        | versiones exactas                                            |
| resolver/evaluator identities | backend físico consumido                                     |
| scope snapshot                | `SHELL-AUTH-REQUEST-SCOPE-CONSUMERS-001` o revisión aprobada |
| registry snapshot             | 15 campos, filas actuales y diff desde baseline              |
| L0 implementation evidence    | claves, promise maps, eviction y write barrier               |
| consumer matrix               | repo, commit, lockfile, runtime, subpath y estado            |
| fixtures/tests                | resultados del mismo commit/versiones                        |
| artifact digest               | huella del artefacto materializado                           |
| rollback                      | combinación anterior y ensayo                                |
| blockers                      | lista cerrada con owner y salida                             |

Campo obligatorio ausente deja la instancia `BLOCKED`.

---

#### 23. Unicidad y lineage

```text
1 implementation_unit_id
→ máximo 1 SHELL-AUTH-003::<implementation_unit_id>
→ máximo 1 implementación propietaria del scope L0
→ máximo 1 snapshot activo del registro para la versión
→ N package_id consumidores mediante lineage
```

Los repositorios consumidores no copian la implementación del scope para evitar una dependencia publicada. Cualquier evidencia de otra unidad, snapshot, versión o commit es `STALE`.

---

#### 24. Doce gates de futura materialización

| Gate                       | PASS                                                                    | Bloqueo                                 |
| -------------------------- | ----------------------------------------------------------------------- | --------------------------------------- |
| 1. identidad               | unidad, owner, versiones y commits inequívocos                          | identidad ambigua                       |
| 2. scope                   | lifetime request-scoped, app/identity confiables, sin autoridad cliente | singleton o input fabricado             |
| 3. contexto L0             | 10 dimensiones exactas y promise single-flight                          | clave incompleta o duplicación          |
| 4. aislamiento/retry       | fallo elimina entrada; actor/request distintos no comparten             | contaminación o promesa tóxica          |
| 5. decisión L0             | 11 dimensiones; solo duplicado exacto comparte                          | decisión reutilizada fuera de identidad |
| 6. write barrier           | invalida contexto/decisión afectados dentro del request                 | uso de snapshot previo                  |
| 7. correlación             | propagada sin autoridad ni fuga sensible                                | correlación usada como grant            |
| 8. registry schema         | 15 campos, identidad compuesta y surface_type válido                    | fila incompleta/duplicada               |
| 9. registry coverage       | baseline + drift reconciliados; PASS/AURA sin invención                 | consumidor directo sin fila             |
| 10. testing                | fixtures deterministas y dev-only                                       | oracle remoto o fixture no versionada   |
| 11. compatibilidad/lineage | todos los consumidores de la unidad con evidencia vigente               | consumidor obligatorio pendiente/stale  |
| 12. rollback               | restauración reproducible sin reactivar bypass como final               | recuperación no ensayable               |

---

#### 25. Perfil de pruebas

| Perfil         | Cobertura mínima                                                     |
| -------------- | -------------------------------------------------------------------- |
| contractual    | factory, scope, 10+11 dimensiones, 15 campos y taxonomías            |
| unitaria       | promise dedup, eviction, aislamiento, write barrier, correlación     |
| integración    | scope ↔ adapters AUTH002 ↔ backend cuando exista físicamente         |
| denegaciones   | actor/app/recurso/contexto inválidos y contaminación cross-request   |
| seguridad      | app spoofing, actor-session replay, client RPC, role bypass, leakage |
| RLS/RPC        | paridad únicamente cuando las superficies propietarias existan       |
| concurrencia   | single-flight de contexto y decisión exacta                          |
| compatibilidad | repo, commit, lockfile, runtime, subpath y registry row              |
| regresión      | ausencia de nuevos directos legacy y filas huérfanas                 |
| rollback       | combinación anterior + repetición de gates esenciales                |

RLS/RPC permanece `NOT_EXECUTED` hasta existir objetos físicos y ambiente autorizado.

---

#### 26. Evidencia requerida

| Clase                | Contenido mínimo                                           |
| -------------------- | ---------------------------------------------------------- |
| `SCOPE_IDENTITY`     | request, app, principal/session y correlation sin secretos |
| `L0_CONTEXT`         | key, hit/miss, single-flight y eviction                    |
| `L0_DECISION`        | identidad exacta de evaluación y no reutilización          |
| `WRITE_BARRIER`      | dirty set, invalidación y resolución posterior             |
| `REGISTRY`           | 15 campos, identidad compuesta, conteos y diff             |
| `CONSUMER_MATRIX`    | repo/path/commit/lockfile/runtime/target API               |
| `TESTING`            | fixtures versionadas y resultados                          |
| `SECURITY`           | replay, spoofing, isolation y leakage negatives            |
| `COMPATIBILITY`      | build/typecheck/tests por consumidor aplicable             |
| `ARTIFACT_INTEGRITY` | snapshot, versión, commit y digest                         |
| `ROLLBACK`           | combinación previa y ensayo                                |
| `CERTIFICATION`      | doce gates y estado agregado                               |

---

#### 27. Rollback

El rollback de una futura instancia restaurará coordinadamente:

1. versión anterior soportada de `@vento/os-context`;
2. contracts exactos compatibles;
3. scope factory/implementación anterior;
4. registry snapshot anterior sin perder historial de consumidores;
5. manifests/lockfiles de consumidores afectados;
6. adapters/proyecciones compatibles;
7. configuración legacy temporal autorizada;
8. fixtures y evidencia de la combinación restaurada.

No podrá eliminar filas para ocultar consumidores, mutar una versión publicada, reactivar role bypass como arquitectura final ni reutilizar evidencia de otra combinación.

---

#### 28. Hallazgos y destino exacto

| Hallazgo                                             | Estado                   | Destino                                                                                          |
| ---------------------------------------------------- | ------------------------ | ------------------------------------------------------------------------------------------------ |
| seis helpers de permiso siguen distribuidos          | `LEGACY_ACTIVO`          | `SHELL-AUTH-004`; `SHELL-AUTH-005`                                                               |
| seis guards/session helpers siguen distribuidos      | `LEGACY_ACTIVO`          | `SHELL-AUTH-005`; módulo contextual propietario `SHELL-CTX-001`                                  |
| NEXO mantiene contexto operativo paralelo            | `LEGACY_ACTIVO`          | `SHELL-AUTH-005`; `AUTH-DB-030`                                                                  |
| SHELL mantiene evaluador local/fallback RPC          | `LEGACY_ACTIVO`          | `SHELL-AUTH-005`; `AUTH-DB-034`                                                                  |
| ANIMA consulta `has_permission` desde cliente        | `BLOQUEO_DE_MIGRACION`   | `SHELL-AUTH-005`; protección server transversal `AUTH-UI-043`                                    |
| PULSO conserva una consulta client de visibilidad    | `BLOQUEO_DE_MIGRACION`   | `SHELL-AUTH-005`; protección server transversal `AUTH-UI-043`                                    |
| L1/freshness cross-request no pertenece a AUTH003    | `RESERVADO`              | `SHELL-CTX-006`; `AUTH-DB-035`                                                                   |
| PASS no consume contexto laboral interno por defecto | `NO_APLICA`              | conservar regla de `AUTH-CTX-027`                                                                |
| AURA no tiene repo runtime confirmado en este corte  | `PENDIENTE_DE_EVIDENCIA` | `AURA-AUTH-001` antes de primera adopción; `SHELL-AUTH-005` cuando exista consumidor transversal |

No se crea tarea nueva: todos los hallazgos poseen destino existente.

---

#### 29. Requisitos de prueba derivados

**Resultado:** GENERA 8 REQUISITOS DE PRUEBA.

**Requisitos creados:** **8**
**Requisitos modificados:** **0**

- `TREQ-SHELL-075` — factory y lifetime request-scoped, app/identidad confiables y correlación sin autoridad;
- `TREQ-SHELL-076` — clave L0 de contexto de diez dimensiones, promise single-flight, eviction de fallo y aislamiento sin TTL/global;
- `TREQ-SHELL-077` — clave L0 de decisión de once dimensiones y deduplicación exclusiva de evaluación exacta sin replay entre recursos/requests;
- `TREQ-SHELL-078` — write barrier que invalida L0 afectado y prohíbe reutilizar contexto/decisión anteriores a una mutación relevante;
- `TREQ-SHELL-079` — propagación/observabilidad de correlación y métricas sin autoridad ni filtración sensible;
- `TREQ-SHELL-080` — registro de consumidores con 15 campos, identidad compuesta, taxonomía válida, 32 filas baseline y cobertura explícita PASS/AURA;
- `TREQ-SHELL-081` — evolución del registro, migración current→target, client RPC→safe projection, fixtures deterministas y prohibición de nuevos directos sin fila;
- `TREQ-SHELL-082` — una materialización por unidad, snapshot/registry/compatibilidad/seguridad/RLS-RPC aplicable/lineage y rollback atribuibles a la misma combinación.

No se modifica, difiere, descarta ni obsoleta ningún requisito histórico.

---

#### 30. Puerta de cierre del marcador global

El marcador queda documentalmente cerrado cuando:

1. `createAuthorizationScope` queda definido como factory pública server de esta tarea;
2. el scope queda limitado a una solicitud lógica;
3. se fijan las diez dimensiones de contexto L0;
4. se fija promise single-flight y eviction de errores;
5. se fijan las once dimensiones de decisión L0;
6. se prohíbe reuse cross-resource/cross-request;
7. se fija write barrier y frontera con L1;
8. se fija propagación de correlación sin autoridad;
9. el registro conserva 15 campos y una identidad compuesta estable;
10. la taxonomía incluye 15 tipos de superficie;
11. se materializan exactamente 32 filas iniciales y se reconcilian 32/32;
12. PASS y AURA quedan tratados sin inventar consumidores;
13. se definen fixtures, gates, evidencia, compatibilidad y rollback;
14. se crea snapshot y huella reproducibles;
15. se crean `TREQ-SHELL-075` a `TREQ-SHELL-082`;
16. se mantienen 0 cambios físicos, 0 migraciones y 0 cambios Supabase.

---

#### 31. Puerta de cierre de futura instancia

`SHELL-AUTH-003::<implementation_unit_id>` podrá quedar `PASS` únicamente cuando:

- owner y unidad estén habilitados por E5;
- scope y L0 sean físicos y request-scoped;
- las 10/11 dimensiones se reproduzcan sin drift;
- concurrencia, eviction, aislamiento y write barrier tengan evidencia;
- adapters de AUTH002 integren el mismo scope;
- el registro se regenere contra el código vigente y reconcilie su diff desde las 32 filas baseline;
- todo consumidor directo tenga fila, owner, target, estado y evidencia;
- client surfaces no invoquen autorización interna para la arquitectura objetivo;
- fixtures y pruebas contractuales/integración/denegación/seguridad estén en PASS;
- RLS/RPC se marquen PASS solo con objetos y ambiente reales;
- compatibilidad esté demostrada por consumidor de la unidad;
- snapshot, versiones, commits y digest coincidan;
- no exista segunda materialización para la unidad;
- rollback haya sido ensayado;
- `TREQ-SHELL-075` a `TREQ-SHELL-082` tengan evidencia atribuible a la instancia.

---

#### 32. Criterios de aceptación

- [x] `SHELL-AUTH-002` es la precedencia inmediata aprobada;
- [x] `SHELL-AUTH-004` permanece únicamente reservada;
- [x] la tarea usa `PER_IMPLEMENTATION_UNIT`;
- [x] se define `createAuthorizationScope` sin crear aliases paralelos;
- [x] se limita el scope a una solicitud lógica;
- [x] se prohíben singleton y cache cross-request en AUTH003;
- [x] se fijan diez dimensiones de ContextRequestKey;
- [x] se usa promise single-flight y eviction de fallo;
- [x] se fijan once dimensiones de decisión exacta;
- [x] se prohíbe reuse entre recurso/request;
- [x] se define write barrier L0;
- [x] L1 permanece en `SHELL-CTX-006`/`AUTH-DB-035`;
- [x] correlación no concede autoridad;
- [x] se conservan 15 campos mínimos del registro;
- [x] se define identidad compuesta estable sin IDs arbitrarios;
- [x] se añaden solo `SERVER_HELPER` y `SDK_ADAPTER` a los trece tipos iniciales;
- [x] se materializan 32 filas iniciales;
- [x] se reconcilian 32/32 sin duplicados;
- [x] PASS queda `NO_APLICA` para contexto laboral interno por defecto;
- [x] AURA queda pendiente sin ruta inventada;
- [x] se definen fixtures deterministas dev-only;
- [x] se define snapshot reproducible y huella;
- [x] se definen doce gates, pruebas, evidencia y rollback;
- [x] se crean exactamente ocho TREQ nuevos;
- [x] se declaran 0 cambios físicos, 0 migraciones y 0 cambios Supabase;
- [x] no se desarrolla `SHELL-AUTH-004`.

---

#### 33. Límites

Esta tarea no:

- modifica `packages/os-context`;
- crea físicamente `createAuthorizationScope`;
- implementa L0 ni L1;
- crea cache compartida, TTL o eventos de invalidación;
- modifica aplicaciones consumidoras;
- elimina helpers, guards, hooks o RPC;
- crea lint, codemods, allowlists o gates CI de legacy;
- ejecuta `SHELL-AUTH-004`;
- ejecuta `SHELL-AUTH-005`;
- implementa resolver/evaluador SQL;
- crea SQL, RPC, RLS, migraciones, triggers, Storage, Realtime o Edge Functions;
- ejecuta Supabase;
- declara compatibilidad de consumidor sin evidencia física;
- declara RLS/RPC en PASS por inferencia;
- inventa un consumidor de PASS o AURA;
- ejecuta `SHELL-AUTH-003::<implementation_unit_id>`;
- avanza ni desarrolla la tarea siguiente.

---

#### 34. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-AUTH-002 — Implementar adapters de servidor, cliente y proyecciones seguras`

**TAREA ACTUAL APROBADA**
`SHELL-AUTH-003 — Implementar scope por solicitud y registro canónico de consumidores`

**SIGUIENTE TAREA RESERVADA**
`SHELL-AUTH-004 — Implementar lint, métricas y gates contra consumidores legacy`


### ✅ SHELL-AUTH-004 — Implementar lint, métricas y gates contra consumidores legacy

**Estado:** APROBADA
**Tarea anterior:** SHELL-AUTH-003 — Implementar scope por solicitud y registro canónico de consumidores
**Tarea siguiente:** SHELL-AUTH-005 — Migrar consumidores de autorización en todos los repositorios
**Tipo de tarea:** documental — definición global única del freeze de nuevos consumos legacy, análisis estático, métricas, allowlist temporal y gates de CI, con futura materialización física `SHELL-AUTH-004::<implementation_unit_id>` una sola vez por unidad de implementación
**Bloque:** BLOQUE H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md`
**Estado físico resultante:** freeze legacy, scanner, allowlist temporal, métricas y gates contractualmente especificados; 32/32 identidades baseline reconciliadas; 9 reglas; 14 métricas; 12 gates; 0 linters AUTH004 materializados; 0 allowlists ejecutables; 0 gates CI AUTH004; 0 cambios Supabase
**Cambios físicos autorizados:** ninguno durante el marcador global
**Requisitos de prueba creados o modificados:** 8 creados (`TREQ-SHELL-083` a `TREQ-SHELL-090`)
**Modalidad:** `PER_IMPLEMENTATION_UNIT`
**Trabajo canónico actual:** definir el contrato global una sola vez
**Instancia física futura:** `SHELL-AUTH-004::<implementation_unit_id>`
**Condición de materialización:** `DELIV-PKG-025::<package_id>` asigna `implementation_unit_id` y el package propietario obtiene `E5-GATE-008::<package_id> = PASS`
**Registro de consumidores de entrada:** `SHELL-AUTH-REQUEST-SCOPE-CONSUMERS-001` — 32 filas, 15 campos, 32 identidades compuestas únicas
**Snapshot producido:** `SHELL-AUTH-LEGACY-GATES-001`

---

#### 1. Resultado material

Se define el contrato canónico que **congela la deuda legacy de autorización y contexto antes de la migración masiva**, sin confundir congelación con aceptación arquitectónica.

La regla resultante es:

```text
BASELINE LEGACY CONOCIDA
+ IDENTIDAD EXACTA REGISTRADA
+ ALLOWLIST TEMPORAL SIN COMODINES
+ MÉTRICAS RECONCILIADAS
= PUEDE PERMANECER SOLO DURANTE LA MIGRACIÓN
```

```text
CONSUMO LEGACY NUEVO
O HALLAZGO NO REGISTRADO
O INCREMENTO DE DEUDA
O EXCEPCIÓN HUÉRFANA/STALE
= FAIL
```

```text
ALLOWLIST TEMPORAL
≠ COMPATIBILIDAD
≠ APROBACIÓN DE SEGURIDAD
≠ ARQUITECTURA FINAL
```

El marcador materializa:

| Dimensión                                                 | Resultado |
| --------------------------------------------------------- | --------: |
| consumidores baseline heredados                           |    **32** |
| identidades reconciliadas                                 | **32/32** |
| duplicados de identidad                                   |     **0** |
| perfiles de deuda                                         |     **8** |
| APIs legacy explícitamente congeladas                     |     **5** |
| reglas de detección                                       |     **9** |
| métricas contractuales                                    |    **14** |
| gates de futura materialización                           |    **12** |
| entradas de allowlist documental                          |    **32** |
| consumidores cliente con autorización directa en baseline |     **2** |
| consumidores laborales PASS inventados                    |     **0** |
| rutas AURA inventadas                                     |     **0** |
| código o CI físico creado en este marcador                |     **0** |
| cambios Supabase                                          |     **0** |
| requisitos de prueba nuevos                               |     **8** |

---

#### 2. Fuentes y estado verificable

Se consumen como entradas vinculantes:

1. protocolo canónico vigente;
2. contrato modular de entrega vigente;
3. secuencia activa con `SHELL-AUTH-003` como precedencia y `SHELL-AUTH-004` como primera tarea pendiente;
4. topología `PER_IMPLEMENTATION_UNIT`;
5. `SHELL-AUTH-001`, `SHELL-AUTH-002` y `SHELL-AUTH-003` aprobadas;
6. `AUTH-CTX-027` sobre consumo centralizado, freeze, lint, observabilidad y migración;
7. `SHELL-PKG-005` sobre deprecación, consumidores, retiro y preservación histórica;
8. `SHELL-PKG-008` sobre fail-closed, evidencia por commit y gates obligatorios;
9. registro canónico de consumidores de `SHELL-AUTH-003`;
10. registro `04A` vigente con 7050 requisitos y `TREQ-SHELL-001..082`;
11. infraestructura de lint actual de `vento-shell`;
12. superficies físicas actuales necesarias para confirmar los patrones legacy relevantes.

Cortes técnicos inspeccionados:

| Artefacto                            | Identidad verificada                            | Resultado relevante                                                                      |
| ------------------------------------ | ----------------------------------------------- | ---------------------------------------------------------------------------------------- |
| `packages/os-context/package.json`   | blob `604c6412f5220e4694d4c31f8422544c2690d5a3` | `@vento/os-context@0.1.0`, privado, export raíz a source                                 |
| `packages/os-context/src/client.ts`  | blob `43fab8004617175ae22e378032a69e92e4a922d1` | llama `get_effective_context_v1` y `has_effective_permission_v1`; conserva simulación v1 |
| `scripts/quality/lint-ratchet.mjs`   | blob `c5cba15b4accd98c809b270d3b573f62c9b92bcb` | ratchet genérico `NO_NEW_DEBT_AND_TOUCHED_FILES_CLEAN`, sin semántica AUTH legacy        |
| `quality/lint-debt-baseline.json`    | blob `82e6348294c700cd15aa485f38e1346665931804` | baseline genérica de ESLint; no es allowlist de autorización                             |
| `eslint.config.mjs`                  | blob `05e726d1b4201bc8c7716d2b058279676582e8c0` | no materializa reglas AUTH004 específicas                                                |
| `src/app/page.tsx` de SHELL          | blob `7aae59568bc5eac5dae4b792ddc945f03793a80f` | `has_permission` directo y fallback de firma                                             |
| FOGO `src/lib/auth/permissions.ts`   | blob `a5a2b7e6f914075d78cc72a9b016994f5a102dde` | prefijo local + `has_permission` + booleano                                              |
| ORIGO `src/lib/suppliers.ts`         | blob `830fa1e5f0598ff747f7d9102c532393ac87bf81` | `has_permission` + fallback local por rol                                                |
| PULSO `delivery-override-bridge.tsx` | blob `a3419fb82b6fe2a1b149960d377726ac94a03617` | cliente invoca `has_permission` directamente                                             |
| ANIMA `use-app-permissions.ts`       | blob `bda072e4b4d9664ece585c2f21123d1e5cd5434a` | cliente ejecuta una RPC por permission code y reduce a booleano                          |

El ratchet genérico existente **se conserva**. AUTH004 no lo redefine ni usa su baseline de warnings como sustituto del inventario de autorización.

---

#### 3. Alcance exacto

AUTH004 define:

1. el universo de APIs y patrones legacy congelados;
2. el modelo de análisis estático;
3. la relación entre findings y las 32 identidades del registro;
4. la allowlist temporal exacta;
5. las reglas de incremento, sustitución, traslado y eliminación de deuda;
6. las métricas obligatorias y sus labels permitidos;
7. las métricas expresamente prohibidas por sensibilidad o cardinalidad;
8. el fail-closed de los gates;
9. la integración conceptual con el ratchet genérico sin mezclar baselines;
10. la matriz de decisión 32/32;
11. la política para PASS y AURA sin inventar consumidores;
12. la evidencia que deberá producir la futura instancia;
13. las pruebas contractuales, integración, denegaciones, seguridad, compatibilidad y regresión;
14. la aplicabilidad real de RLS/RPC;
15. la unicidad por `implementation_unit_id`, lineage y rollback.

AUTH004 no migra ni elimina los 32 consumidores. Esa acción pertenece a `SHELL-AUTH-005` y el retiro físico de RPC legacy aplicables permanece en `AUTH-DB-030`.

---

#### 4. Principio de freeze

El freeze comienza cuando la futura instancia AUTH004 esté materializada y sea un check obligatorio del flujo aplicable.

A partir de ese punto:

- una identidad baseline puede conservar **solo** sus hallazgos legacy conocidos y temporalmente autorizados;
- agregar un hallazgo nuevo a una identidad existente falla;
- mover el mismo patrón a otra ruta falla;
- copiar un helper a otro repositorio falla;
- cambiar `surface_type` o `consumer_name` para eludir la identidad falla;
- crear un consumidor nuevo de `/legacy` falla;
- una fila nueva en el registro no concede automáticamente excepción;
- una excepción no sustituye pruebas, owner, migración ni removal gate;
- eliminar deuda reduce el baseline; nunca habilita reutilizar la cuota eliminada.

La política es **monótonamente decreciente**: la deuda permitida puede bajar, pero no volver a crecer bajo el mismo snapshot.

---

#### 5. APIs legacy explícitamente congeladas

La lista canónica inicial contiene exactamente cinco familias:

```text
has_permission
has_operational_permission
has_effective_permission_v1
get_operational_context
get_effective_context_v1
```

Reglas:

1. una llamada directa nueva a cualquiera de ellas es bloqueo;
2. alias sintáctico, destructuring, wrapper local o reexport no evitan la detección;
3. construir dinámicamente el nombre para evadir el scanner es bloqueo;
4. la lista se compara por identidad semántica, no solo por una búsqueda textual;
5. los usos SQL/RLS se inventariarán y certificarán en sus tareas propietarias; no se declaran ausentes por no estar en el scanner TypeScript;
6. simulación v1 permanece representada en la fila `SDK_ADAPTER` existente, pero esta tarea no amplía arbitrariamente las cinco familias legacy reconocidas por AUTH001/AUTH-CTX-027.

---

#### 6. Catálogo de reglas de detección

| Regla          | Nombre                                | Detecta                                                                                                          | Política para baseline                                       | Política para delta nuevo |
| -------------- | ------------------------------------- | ---------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ | ------------------------- |
| `AUTH004-L001` | `LEGACY_RPC_DIRECT`                   | invocación, wrapper, alias o reexport directo de una de las cinco APIs legacy                                    | solo finding exacto inventariado                             | `FAIL`                    |
| `AUTH004-L002` | `LEGACY_CLIENT_AUTHORIZATION`         | autorización interna invocada desde `CLIENT_HOOK`, `CLIENT_COMPONENT` o browser                                  | solo las identidades baseline de ANIMA/PULSO mientras migran | `FAIL`                    |
| `AUTH004-L003` | `LOCAL_PERMISSION_KEY_CONSTRUCTION`   | prefijos, concatenación, split o normalización local que fabrica `PermissionKey`                                 | baseline exacta registrada                                   | `FAIL`                    |
| `AUTH004-L004` | `LOCAL_ROLE_OR_BYPASS_AUTHORITY`      | rol, override o lista local usados para conceder/ampliar capacidad                                               | baseline exacta registrada; nunca se declara canónica        | `FAIL`                    |
| `AUTH004-L005` | `CALLER_CONTEXT_AS_AUTHORITY`         | sede, área, actor, turno, check-in o contexto efectivo aportado por caller para decidir autoridad                | baseline exacta registrada                                   | `FAIL`                    |
| `AUTH004-L006` | `BOOLEAN_OR_LEGACY_CONTEXT_AUTHORITY` | booleanos, `can_operate`, `EffectiveContext` o shape legacy usados como sustituto de decisión/contexto canónicos | baseline exacta registrada                                   | `FAIL`                    |
| `AUTH004-L007` | `DUPLICATED_AUTHORIZATION_HELPER`     | copia o variante local de helper/guard/contexto con responsabilidad ya compartida                                | solo identidades baseline actuales                           | `FAIL`                    |
| `AUTH004-L008` | `UNREGISTERED_AUTH_CONSUMER`          | finding de contexto/autorización sin fila resoluble en el registro de 15 campos                                  | ninguno                                                      | `FAIL` incondicional      |
| `AUTH004-L009` | `NEW_LEGACY_SUBPATH_CONSUMER`         | import o dependencia nueva hacia `@vento/os-context/legacy` una vez exista físicamente                           | solo consumidores expresamente heredados y registrados       | `FAIL`                    |

Las reglas `L004` y `L005` pueden requerir análisis semántico. Un resultado ambiguo no se convierte en `PASS`: queda `BLOCKED` hasta clasificación atribuible.

---

#### 7. Modelo de finding

Cada finding físico deberá materializar como mínimo:

```text
repository
path
surface_type
consumer_name
rule_id
legacy_family_or_pattern
normalized_signature
count
source_commit
scanner_version
registry_snapshot
```

La identidad del consumidor continúa siendo la tupla de AUTH003:

```text
(repository, path, surface_type, consumer_name)
```

La identidad de finding agrega `rule_id` y `normalized_signature`. No se usa número de línea como identidad porque un refactor inocuo puede desplazar líneas sin crear deuda nueva.

La firma normalizada deberá cambiar cuando cambie la operación legacy material, aunque el conteo total permanezca igual.

---

#### 8. Allowlist temporal

Se define el catálogo documental:

```text
SHELL-AUTH-LEGACY-BASELINE-001
```

Cada entrada deberá contener:

```text
consumer_identity
allowed_rule_ids
allowed_finding_signatures
max_count_by_signature
owner
migration_task
removal_gate
reason
baseline_source_commit
registry_snapshot
status
```

Reglas obligatorias:

- **0 comodines** en repository, path, surface, consumer, rule o signature;
- **0 cuotas transferibles** entre consumidores;
- reducir un conteo reduce inmediatamente el máximo permitido;
- un finding eliminado no puede reaparecer usando su cupo histórico;
- path renombrado exige reconciliación de registro y nueva evidencia, no copia automática de excepción;
- entrada sin owner, `SHELL-AUTH-005` o removal gate queda `STALE`;
- entrada cuyo consumer ya no existe queda histórica y no vuelve a habilitar código;
- una extensión por calendario no se infiere; cualquier excepción sigue `SHELL-PKG-005`;
- un expediente de deprecación no transforma el finding en compatible;
- la allowlist solo evita romper el baseline el día de activación del freeze.

---

#### 9. Perfiles de deuda

| Perfil                      | Alcance                                                             | Reglas evaluadas prioritariamente  |
| --------------------------- | ------------------------------------------------------------------- | ---------------------------------- |
| `PERMISSION_HELPER`         | helpers `permissions.ts` distribuidos                               | L001, L003, L005, L006, L007, L008 |
| `DISTRIBUTED_GUARD`         | guards server con múltiples carriles                                | L001, L004, L005, L006, L007, L008 |
| `OPERATIONAL_SESSION_LOCAL` | sesión/contexto local por app                                       | L004, L005, L006, L007, L008       |
| `OPERATIONAL_CONTEXT_LOCAL` | NEXO `operational-context`                                          | L001, L004, L005, L006, L007, L008 |
| `DIRECT_SERVER_AUTH`        | páginas, acciones y handlers con autorización local/directa         | L001, L003, L005, L006, L008       |
| `CLIENT_DIRECT_AUTH`        | hook/componente cliente que decide visibilidad mediante RPC interna | L001, L002, L003, L005, L006, L008 |
| `ROLE_FALLBACK`             | helper con concesión local por lista/rol                            | L001, L004, L006, L008             |
| `LEGACY_SDK_ADAPTER`        | wrapper transitorio del SDK                                         | L001, L006, L008, L009             |

Un perfil define qué reglas deben inspeccionarse; no afirma que cada regla produzca un finding en toda fila.

---

#### 10. Matriz de decisión 32/32

La allowlist documental conserva todas las identidades de `SHELL-AUTH-003` sin agregar ni quitar consumidores:

|    # | repository                   | path                                                     | surface_type       | consumer_name                                | perfil                      | decisión AUTH004                                                           | migración        | retiro                                              |
| ---: | ---------------------------- | -------------------------------------------------------- | ------------------ | -------------------------------------------- | --------------------------- | -------------------------------------------------------------------------- | ---------------- | --------------------------------------------------- |
|    1 | `devVentoGroup/vento-viso`   | `src/lib/auth/permissions.ts`                            | `SERVER_HELPER`    | VISO permission helper                       | `PERMISSION_HELPER`         | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|    2 | `devVentoGroup/vento-viso`   | `src/lib/auth/guard.ts`                                  | `SERVER_HELPER`    | VISO application guard                       | `DISTRIBUTED_GUARD`         | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|    3 | `devVentoGroup/vento-viso`   | `src/lib/auth/operational-session.ts`                    | `SERVER_HELPER`    | VISO operational-session                     | `OPERATIONAL_SESSION_LOCAL` | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|    4 | `devVentoGroup/vento-nexo`   | `src/lib/auth/permissions.ts`                            | `SERVER_HELPER`    | NEXO permission helper                       | `PERMISSION_HELPER`         | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|    5 | `devVentoGroup/vento-nexo`   | `src/lib/auth/guard.ts`                                  | `SERVER_HELPER`    | NEXO application guard                       | `DISTRIBUTED_GUARD`         | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|    6 | `devVentoGroup/vento-nexo`   | `src/lib/auth/operational-session.ts`                    | `SERVER_HELPER`    | NEXO operational-session                     | `OPERATIONAL_SESSION_LOCAL` | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|    7 | `devVentoGroup/vento-fogo`   | `src/lib/auth/permissions.ts`                            | `SERVER_HELPER`    | FOGO permission helper                       | `PERMISSION_HELPER`         | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|    8 | `devVentoGroup/vento-fogo`   | `src/lib/auth/guard.ts`                                  | `SERVER_HELPER`    | FOGO application guard                       | `DISTRIBUTED_GUARD`         | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|    9 | `devVentoGroup/vento-fogo`   | `src/lib/auth/operational-session.ts`                    | `SERVER_HELPER`    | FOGO operational-session                     | `OPERATIONAL_SESSION_LOCAL` | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|   10 | `devVentoGroup/vento-origo`  | `src/lib/auth/permissions.ts`                            | `SERVER_HELPER`    | ORIGO permission helper                      | `PERMISSION_HELPER`         | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|   11 | `devVentoGroup/vento-origo`  | `src/lib/auth/guard.ts`                                  | `SERVER_HELPER`    | ORIGO application guard                      | `DISTRIBUTED_GUARD`         | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|   12 | `devVentoGroup/vento-origo`  | `src/lib/auth/operational-session.ts`                    | `SERVER_HELPER`    | ORIGO operational-session                    | `OPERATIONAL_SESSION_LOCAL` | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|   13 | `devVentoGroup/vento-pulso`  | `src/lib/auth/permissions.ts`                            | `SERVER_HELPER`    | PULSO permission helper                      | `PERMISSION_HELPER`         | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|   14 | `devVentoGroup/vento-pulso`  | `src/lib/auth/guard.ts`                                  | `SERVER_HELPER`    | PULSO application guard                      | `DISTRIBUTED_GUARD`         | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|   15 | `devVentoGroup/vento-pulso`  | `src/lib/auth/operational-session.ts`                    | `SERVER_HELPER`    | PULSO operational-session                    | `OPERATIONAL_SESSION_LOCAL` | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|   16 | `devVentoGroup/vento-numera` | `src/lib/auth/permissions.ts`                            | `SERVER_HELPER`    | NUMERA permission helper                     | `PERMISSION_HELPER`         | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|   17 | `devVentoGroup/vento-numera` | `src/lib/auth/guard.ts`                                  | `SERVER_HELPER`    | NUMERA application guard                     | `DISTRIBUTED_GUARD`         | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|   18 | `devVentoGroup/vento-numera` | `src/lib/auth/operational-session.ts`                    | `SERVER_HELPER`    | NUMERA operational-session                   | `OPERATIONAL_SESSION_LOCAL` | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|   19 | `devVentoGroup/vento-nexo`   | `src/lib/auth/operational-context.ts`                    | `SERVER_HELPER`    | NEXO operational context                     | `OPERATIONAL_CONTEXT_LOCAL` | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|   20 | `devVentoGroup/vento-shell`  | `src/app/page.tsx`                                       | `SERVER_COMPONENT` | SHELL application launcher                   | `DIRECT_SERVER_AUTH`        | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|   21 | `devVentoGroup/vento-viso`   | `src/app/api/viso/upload-product-image/route.ts`         | `ROUTE_HANDLER`    | VISO product-image upload                    | `DIRECT_SERVER_AUTH`        | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|   22 | `devVentoGroup/vento-viso`   | `src/app/api/viso/upload-commercial-menu-image/route.ts` | `ROUTE_HANDLER`    | VISO commercial-menu image upload            | `DIRECT_SERVER_AUTH`        | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|   23 | `devVentoGroup/vento-viso`   | `src/app/api/viso/attendance-report/route.ts`            | `ROUTE_HANDLER`    | VISO attendance report                       | `DIRECT_SERVER_AUTH`        | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|   24 | `devVentoGroup/vento-viso`   | `src/app/staff/[id]/page.tsx`                            | `SERVER_COMPONENT` | VISO staff detail                            | `DIRECT_SERVER_AUTH`        | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|   25 | `devVentoGroup/vento-origo`  | `src/lib/suppliers.ts`                                   | `SERVER_HELPER`    | ORIGO supplier management                    | `ROLE_FALLBACK`             | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|   26 | `devVentoGroup/vento-origo`  | `src/app/receipts/new/page.tsx`                          | `SERVER_COMPONENT` | ORIGO receipt creation                       | `DIRECT_SERVER_AUTH`        | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|   27 | `devVentoGroup/vento-origo`  | `src/app/product-master-review/page.tsx`                 | `SERVER_COMPONENT` | ORIGO product master review                  | `DIRECT_SERVER_AUTH`        | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|   28 | `devVentoGroup/vento-origo`  | `src/app/purchase-orders/[id]/pdf/route.ts`              | `ROUTE_HANDLER`    | ORIGO purchase-order PDF                     | `DIRECT_SERVER_AUTH`        | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|   29 | `devVentoGroup/vento-pulso`  | `src/modules/pos/actions/identify-client.action.ts`      | `SERVER_ACTION`    | PULSO identify client                        | `DIRECT_SERVER_AUTH`        | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|   30 | `devVentoGroup/vento-pulso`  | `src/app/orders/delivery-override-bridge.tsx`            | `CLIENT_COMPONENT` | PULSO delivery override visibility           | `CLIENT_DIRECT_AUTH`        | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|   31 | `devVentoGroup/vento-anima`  | `src/hooks/use-app-permissions.ts`                       | `CLIENT_HOOK`      | ANIMA app permissions hook                   | `CLIENT_DIRECT_AUTH`        | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |
|   32 | `devVentoGroup/vento-shell`  | `packages/os-context/src/client.ts`                      | `SDK_ADAPTER`      | @vento/os-context transitional legacy client | `LEGACY_SDK_ADAPTER`        | `BASELINE_TEMPORAL_ONLY`; cualquier hallazgo nuevo o no registrado bloquea | `SHELL-AUTH-005` | `AUTH-DB-030` cuando retire la RPC legacy aplicable |

**Conciliación:** 32 esperadas, 32 materializadas, 32 identidades únicas, 0 faltantes y 0 duplicadas.

Todas quedan `BASELINE_TEMPORAL_ONLY`. Ese estado es propio del contrato AUTH004 y **no sustituye** `status = PENDIENTE_DE_EVIDENCIA` del registro AUTH003.

---

#### 11. Reconciliación por perfil

| Perfil                      |  Filas |
| --------------------------- | -----: |
| `PERMISSION_HELPER`         |  **6** |
| `DISTRIBUTED_GUARD`         |  **6** |
| `OPERATIONAL_SESSION_LOCAL` |  **6** |
| `OPERATIONAL_CONTEXT_LOCAL` |  **1** |
| `DIRECT_SERVER_AUTH`        |  **9** |
| `CLIENT_DIRECT_AUTH`        |  **2** |
| `ROLE_FALLBACK`             |  **1** |
| `LEGACY_SDK_ADAPTER`        |  **1** |
| **Total**                   | **32** |

Cobertura adicional sin fila sintética:

- PASS: **0** consumidores laborales baseline; el gate deberá demostrar 0 consumo legacy nuevo cuando el repositorio esté dentro del scope de scan;
- AURA: **0** filas porque no existe repo runtime confirmado en el corte; la primera adopción real deberá registrarse antes de operar conforme a `AURA-AUTH-001`;
- SQL/RLS/RPC: se incorporan cuando existan las superficies físicas canónicas y sus tareas propietarias; no se inventan findings por nombres documentales.

---

#### 12. Contrato de métricas

Se definen 14 métricas lógicas:

| ID             | Métrica                                | Fuente                                                | Cardinalidad/seguridad                                                      |
| -------------- | -------------------------------------- | ----------------------------------------------------- | --------------------------------------------------------------------------- |
| `AUTH004-M001` | `legacy_registry_consumers_total`      | registro AUTH003                                      | agregada                                                                    |
| `AUTH004-M002` | `legacy_registry_consumers_by_profile` | matriz AUTH004                                        | perfil cerrado                                                              |
| `AUTH004-M003` | `legacy_allowlist_entries_total`       | allowlist exacta                                      | agregada                                                                    |
| `AUTH004-M004` | `legacy_static_findings_total`         | scanner                                               | rule/profile; sin usuario/recurso                                           |
| `AUTH004-M005` | `legacy_static_findings_by_rule`       | scanner                                               | `rule_id` cerrado                                                           |
| `AUTH004-M006` | `legacy_new_findings_total`            | diff baseline→actual                                  | agregada/regla                                                              |
| `AUTH004-M007` | `legacy_removed_findings_total`        | diff baseline→actual                                  | agregada/regla                                                              |
| `AUTH004-M008` | `legacy_unregistered_findings_total`   | scanner ↔ registry                                    | debe converger a 0                                                          |
| `AUTH004-M009` | `legacy_client_direct_consumers_total` | registry + scanner                                    | baseline documental = 2                                                     |
| `AUTH004-M010` | `legacy_allowlist_stale_total`         | validador allowlist                                   | debe ser 0 para PASS                                                        |
| `AUTH004-M011` | `legacy_allowlist_orphan_total`        | allowlist ↔ registry                                  | debe ser 0 para PASS                                                        |
| `AUTH004-M012` | `legacy_migrated_consumers_total`      | registry/diff                                         | monotónica creciente                                                        |
| `AUTH004-M013` | `legacy_runtime_invocations_total`     | adapter `/legacy`, solo cuando exista instrumentación | labels estáticos: consumer identity/family; nunca actor, recurso ni secreto |
| `AUTH004-M014` | `legacy_gate_failures_total`           | agregador CI                                          | gate/rule cerrados                                                          |

Reglas:

1. M001 en el baseline AUTH003 vale 32;
2. M009 en el baseline vale 2 — PULSO client component y ANIMA client hook;
3. M013 **no es requisito para activar el primer freeze estático**, porque la instrumentación física no existe todavía para todos los directos;
4. M013 sí participa en la certificación de retiro cuando el carril legacy esté instrumentado;
5. ningún label contiene `user_id`, actor, email, documento, JWT, service role, `resource_ids`, payload, grants, denies o stack;
6. `correlation_id` puede enlazar evidencia controlada, pero no se usa como label de métrica de alta cardinalidad ni como autoridad;
7. métricas faltantes o no reconciliables no se convierten en cero.

---

#### 13. Integración con el ratchet genérico

El mecanismo existente `quality:lint:ratchet` y AUTH004 son controles distintos:

```text
RATCHET GENÉRICO
→ deuda ESLint del repositorio

AUTH004
→ deuda semántica de autorización/contexto legacy
```

Reglas:

- no se agregan findings AUTH004 a `quality/lint-debt-baseline.json`;
- no se usa un warning ESLint genérico como excepción a AUTH004;
- una ejecución futura puede orquestar ambos checks, pero conserva resultados separados;
- desactivar una regla de ESLint no desactiva AUTH004;
- un comentario de supresión local no concede una excepción AUTH004;
- cualquier excepción AUTH004 existe solo en la allowlist canónica y exacta.

---

#### 14. Contrato del scanner

La futura implementación deberá analizar como mínimo:

- TypeScript/TSX/JavaScript/JSX runtime del repositorio;
- imports y reexports;
- llamadas `.rpc(...)` con literales, aliases o wrappers resolubles;
- archivos declarados `use client` y superficies client del registro;
- construcción de PermissionKey local;
- comparaciones/allowlists de roles usadas en ramas de autorización;
- `can_operate`, EffectiveContext y booleanos legacy usados como autoridad;
- duplicación de familias de helper inventariadas;
- imports futuros hacia `@vento/os-context/legacy`;
- correspondencia exacta contra la identidad del registro.

No contará:

- comentarios o documentación como ejecución;
- fixtures de `/testing` como consumidores productivos;
- archivos generados o artefactos de build como fuentes runtime salvo que una tarea propietaria los declare;
- strings coincidentes sin contexto ejecutable como finding automático de seguridad.

Una coincidencia semántica ambigua queda `REVIEW_REQUIRED` y bloquea hasta resolverla. El scanner no puede elegir silenciosamente el resultado permisivo.

---

#### 15. Scope de repositorios

La primera materialización deberá cubrir al menos los repositorios realmente presentes en el baseline:

```text
devVentoGroup/vento-shell
devVentoGroup/vento-viso
devVentoGroup/vento-nexo
devVentoGroup/vento-fogo
devVentoGroup/vento-origo
devVentoGroup/vento-pulso
devVentoGroup/vento-numera
devVentoGroup/vento-anima
```

PASS se verifica como cobertura de cero consumo laboral legacy sin crear fila sintética. AURA se incorpora cuando exista repo runtime confirmado y antes de su primera adopción conforme a `AURA-AUTH-001`.

El conjunto físico se deriva del registro y de las fuentes canónicas vigentes en la ejecución. No se mantiene una lista paralela editable que pueda omitir un consumidor registrado.

---

#### 16. Modelo de estados de finding

Estados de un finding AUTH004:

```text
BASELINE_TEMPORAL
NEW_BLOCKED
MIGRATED
STALE
HISTORICAL
```

Transiciones permitidas:

```text
BASELINE_TEMPORAL → MIGRATED
BASELINE_TEMPORAL → STALE
STALE → BASELINE_TEMPORAL   solo después de reconciliación aprobada de la misma deuda
MIGRATED → HISTORICAL
```

Queda prohibido:

```text
MIGRATED → BASELINE_TEMPORAL
HISTORICAL → BASELINE_TEMPORAL
NEW_BLOCKED → BASELINE_TEMPORAL por simple edición de allowlist
```

Un nuevo finding solo puede dejar de bloquear cuando se elimina o cuando una decisión canónica distinta y explícita demuestre que no es legacy. AUTH004 no crea un flujo ordinario para ampliar la allowlist.

---

#### 17. Fail-closed y resultado de gate

Estados de cada gate físico:

```text
PASS
FAIL
BLOCKED
NOT_APPLICABLE
NOT_EXECUTED
STALE
```

Reglas:

- `PASS` requiere evidencia del mismo commit/snapshot;
- `NOT_APPLICABLE` requiere justificación contractual explícita;
- `NOT_EXECUTED`, `STALE`, timeout, error del scanner o ausencia de repositorio obligatorio bloquean;
- `FAIL` no se reduce a warning;
- la imposibilidad de parsear una allowlist o registry bloquea;
- una discrepancia entre métricas y findings bloquea;
- un resultado de otro repositorio no certifica el actual.

---

#### 18. Doce gates de futura materialización

| Gate                           | PASS                                                                                      | Bloqueo                                        |
| ------------------------------ | ----------------------------------------------------------------------------------------- | ---------------------------------------------- |
| 1. `IDENTITY`                  | unidad, owner, versiones, commits y snapshot inequívocos                                  | identidad incompleta                           |
| 2. `SCANNER_CONTRACT`          | 9 reglas, 5 APIs y perfiles reproducidos sin drift                                        | scanner parcial o versión no declarada         |
| 3. `REGISTRY_RECONCILIATION`   | 32 baseline + drift vigente reconciliados; 15 campos e identidad exacta                   | consumer sin fila, duplicado o fila incompleta |
| 4. `ALLOWLIST_INTEGRITY`       | entradas exactas, 0 wildcard, owner/migración/removal, 0 stale/orphan                     | excepción genérica o huérfana                  |
| 5. `NO_NEW_LEGACY`             | 0 findings nuevos y ningún aumento/sustitución no aprobada                                | nueva deuda o cuota reutilizada                |
| 6. `CLIENT_BOUNDARY`           | 0 nuevos directos cliente; baseline client no aumenta                                     | RPC interna nueva desde browser                |
| 7. `LOCAL_AUTHORITY`           | 0 nuevo prefijo/rol/bypass/caller-context/boolean/helper duplicado                        | autoridad local nueva o ambigua no resuelta    |
| 8. `METRICS_EVIDENCE`          | 14 métricas aplicables reconciliadas; labels seguros                                      | métrica contradictoria, faltante o sensible    |
| 9. `CONSUMER_INTEGRATION`      | todos los repositorios/consumidores de la unidad ejecutan gate y pruebas aplicables       | consumidor omitido o resultado ajeno           |
| 10. `SECURITY_DENIALS_RLS_RPC` | negativos de evasión superados; RLS/RPC solo PASS con objeto/ambiente real cuando aplique | bypass, falsa paridad o evidencia inferida     |
| 11. `COMPATIBILITY_LINEAGE`    | package/consumer/runtime/lockfile/commit/snapshot alineados                               | combinación incompatible o evidencia stale     |
| 12. `ROLLBACK`                 | rollback del gate/allowlist/registry a combinación soportada, sin reabrir deuda eliminada | rollback restaura bypass o expande allowlist   |

Todos los gates aplicables deben estar `PASS` para certificar la instancia.

---

#### 19. Pruebas contractuales del scanner

Como mínimo:

1. `has_permission` directo nuevo → `AUTH004-L001`, `FAIL`;
2. alias que termina en `has_permission` → mismo resultado;
3. `has_effective_permission_v1` nuevo → `FAIL`;
4. `get_operational_context` nuevo → `FAIL`;
5. string en comentario/documentación → no finding ejecutable;
6. baseline exacta sin cambio → no nuevo finding;
7. segunda llamada en la misma identidad → incremento, `FAIL`;
8. eliminar una llamada → deuda reducida; la cuota no se conserva;
9. mover la llamada a otro archivo → nuevo consumer/finding, `FAIL`;
10. path registrado con `consumer_name` distinto → identidad no resoluble, `FAIL`;
11. wildcard en allowlist → `FAIL`;
12. entry sin owner/migration/removal → `STALE`, bloqueo.

---

#### 20. Pruebas de frontera cliente

Escenarios mínimos:

| Escenario                                                     | Resultado                                              |
| ------------------------------------------------------------- | ------------------------------------------------------ |
| nueva `.rpc("has_permission")` en `use client`                | FAIL L001 + L002                                       |
| nuevo hook que envuelve una RPC legacy                        | FAIL aunque el wrapper oculte el literal al caller     |
| consumo de `SafeDecisionProjectionV1` ya emitida por servidor | no es legacy por sí mismo                              |
| parser `/client` puro                                         | permitido si cumple AUTH002                            |
| proyección ALLOW reutilizada para autorizar mutación          | FAIL por contrato AUTH002, no se legitima en AUTH004   |
| baseline PULSO/ANIMA sin incremento                           | temporalmente inventariada; sigue pendiente de AUTH005 |

La migración de las dos filas cliente exige llegar a cero directos internos; trasladar la RPC a otro componente cliente no cuenta como progreso.

---

#### 21. Pruebas de autoridad local

El perfil de seguridad deberá cubrir:

- rol listado localmente que concede después de un deny;
- role override que amplía capacidad;
- `can_operate = true` usado como permiso de acción;
- booleano legacy tratado como `AuthorizationDecision`;
- sede o área suministrada por UI usada como territorio efectivo;
- permiso construido por prefijo local;
- helper copiado a un nuevo repositorio;
- error técnico reducido a permiso concedido;
- supresión de scanner usada para ocultar un hallazgo.

Resultado requerido para toda deuda nueva: bloqueo.

---

#### 22. Métricas runtime y privacidad

Cuando `/legacy` pueda emitir telemetría real:

- etiqueta únicamente familia legacy, consumer identity estática, versión SDK y ambiente controlado;
- no etiqueta permiso concreto si genera cardinalidad o exposición innecesaria;
- no etiqueta actor, principal, sesión, site, area, resource ni correlation id como dimensión de métrica;
- correlation puede permanecer en logs de evidencia controlada conforme a AUTH003;
- una caída de métrica no se interpreta como cero uso si la instrumentación está incompleta;
- ausencia de tráfico puntual no demuestra retiro;
- OLA 8 exige inventario = 0, búsqueda estática = 0 y telemetría legacy = 0 con cobertura demostrada.

---

#### 23. Compatibilidad y adopción

AUTH004 no certifica un consumidor por compilar únicamente.

La futura instancia conserva por consumidor:

```text
repository
commit
branch/base cuando aplique
runtime
lockfile/package versions
registry row identity
scanner version
allowlist snapshot
gate results
TREQ results
```

La matriz de compatibilidad sigue siendo propiedad de `SHELL-PKG-004`/`SHELL-CI-005`. AUTH004 consume su resultado y bloquea evidencia de otra combinación.

---

#### 24. RLS y RPC

AUTH004 no inventa paridad SQL.

Reglas:

1. análisis TypeScript no certifica RLS;
2. detectar ausencia de `.rpc(...)` no demuestra que una policy sea correcta;
3. si la futura instancia afecta una superficie RPC/RLS materializada, las pruebas propietarias deben ejecutarse contra el objeto y ambiente autorizados;
4. si todavía no existe la superficie física, el gate aplicable queda `NOT_APPLICABLE` o `NOT_EXECUTED` según contrato, nunca `PASS` por inferencia;
5. `AUTH-DB-006..010`, `AUTH-DB-021`, `AUTH-DB-027`, `AUTH-DB-030` y `AUTH-DB-031` conservan sus responsabilidades.

---

#### 25. Seguridad contra evasión

La suite adversarial deberá intentar:

- alias de la función RPC;
- wrapper nuevo con nombre inocuo;
- string concatenada para resolver API legacy;
- import dinámico;
- copia de helper con cambios de formato;
- comentario de supresión;
- cambio de path sin actualizar registro;
- duplicación de `consumer_name` para ocultar una fila;
- wildcard de allowlist;
- reducción manual de métricas sin eliminar source;
- uso de baseline de otro repositorio;
- resultado `PASS` de otro commit.

Toda evasión reproducible bloquea la certificación.

---

#### 26. Rollback

El rollback de `SHELL-AUTH-004::<implementation_unit_id>` restaura coordinadamente:

1. versión anterior soportada del scanner;
2. configuración anterior del gate;
3. snapshot anterior de allowlist;
4. snapshot anterior del registro sin eliminar historial;
5. integración CI anterior compatible;
6. métricas y esquema de evidencia de la combinación restaurada;
7. package/lockfile anteriores cuando la implementación del gate los haya modificado.

Prohibiciones:

- restaurar un finding que ya fue migrado solo para hacer coincidir un baseline antiguo;
- incrementar máximos de allowlist durante rollback;
- desactivar el freeze para resolver un incidente ordinario;
- reactivar role bypass o RPC legacy como arquitectura final;
- borrar evidencia de ejecuciones fallidas;
- declarar rollback válido sin repetir gates esenciales.

Si la versión anterior del gate ya no es compatible con el registry actual, el rollback queda bloqueado y requiere una combinación soportada explícita.

---

#### 27. Snapshot contractual

```json
{"allowlist_entry_count":32,"allowlist_mode":"EXACT_BASELINE_ONLY","baseline_consumer_row_count":32,"baseline_registry_status":"PENDIENTE_DE_EVIDENCIA","client_direct_legacy_row_count":2,"forbidden_legacy_api_count":5,"gate_count":12,"legacy_profile_count":8,"lint_rule_count":9,"metric_count":14,"new_legacy_allowed":false,"physical_state":"NOT_IMPLEMENTED","registry_field_count":15,"rls_rpc_pass_requires_real_evidence":true,"runtime_telemetry_required_for_initial_freeze":false,"schema":"vento.authorization-legacy-gates@1","snapshot_id":"SHELL-AUTH-LEGACY-GATES-001","wildcards_allowed":false}
```

Huella normativa:

`sha256:5a0ef377e16cd4020680cdc7bfb54a844a4731aba6dde81d500b63aa57fb76cb`

La serialización normativa es JSON UTF-8 en una línea, claves de objeto ordenadas lexicográficamente y arrays en orden contractual.

---

#### 28. Entrada obligatoria de futura instancia

Toda `SHELL-AUTH-004::<implementation_unit_id>` deberá registrar:

| Campo                     | Obligación                                                     |
| ------------------------- | -------------------------------------------------------------- |
| `implementation_unit_id`  | unidad exacta asignada por E5                                  |
| `owner_package_id`        | package propietario habilitado                                 |
| `consumer_package_ids`    | packages consumidores vinculados por lineage                   |
| baseline/result commit    | commits atribuibles                                            |
| SDK/contracts versions    | versiones exactas                                              |
| registry snapshot         | registro AUTH003 vigente y diff desde baseline 32              |
| gate snapshot             | `SHELL-AUTH-LEGACY-GATES-001` o revisión aprobada              |
| scanner version/digest    | artefacto exacto del scanner                                   |
| allowlist snapshot/digest | 32 baseline o su reducción vigente, nunca expansión silenciosa |
| finding manifest          | findings normalizados por consumidor/regla                     |
| metrics manifest          | 14 métricas aplicables y reconciliación                        |
| consumer matrix           | repositorio, commit, runtime, lockfile, resultados             |
| security results          | evasión, client, roles, caller context y fail-closed           |
| RLS/RPC applicability     | evidencia real o justificación de no aplicabilidad             |
| compatibility evidence    | combinación exacta                                             |
| artifact digest           | huella materializada                                           |
| rollback                  | combinación anterior y ensayo                                  |
| blockers                  | lista cerrada con owner y condición de salida                  |

Campo obligatorio ausente deja la instancia `BLOCKED`.

---

#### 29. Unicidad y lineage

```text
1 implementation_unit_id
→ máximo 1 SHELL-AUTH-004::<implementation_unit_id>
→ máximo 1 scanner/gate propietario para la unidad
→ máximo 1 snapshot AUTH004 activo por versión
→ N package_id consumidores mediante lineage
```

Los repositorios consumidores integran el check, pero no copian ni bifurcan el motor canónico del scanner. Configuración local mínima podrá declarar el adapter de ejecución y el commit actual; no podrá redefinir las reglas para permitir deuda adicional.

---

#### 30. Hallazgos y destinos

| Hallazgo                                                     | Estado                        | Destino exacto                                                      |
| ------------------------------------------------------------ | ----------------------------- | ------------------------------------------------------------------- |
| 32 consumidores legacy permanecen inventariados              | `LEGACY_BASELINE`             | `SHELL-AUTH-005`; retiro de RPC aplicable en `AUTH-DB-030`          |
| 6 permission helpers distribuidos                            | `LEGACY_BASELINE`             | `SHELL-AUTH-005`                                                    |
| 6 guards distribuidos                                        | `LEGACY_BASELINE`             | `SHELL-AUTH-005`                                                    |
| 6 operational-session locales                                | `LEGACY_BASELINE`             | `SHELL-AUTH-005`; consolidación contextual en `SHELL-CTX-001`       |
| NEXO mantiene operational-context paralelo                   | `LEGACY_BASELINE`             | `SHELL-AUTH-005`; `AUTH-DB-030`                                     |
| SHELL mantiene evaluador/fallback local                      | `LEGACY_BASELINE`             | `SHELL-AUTH-005`; backend canónico `AUTH-DB-034`                    |
| PULSO y ANIMA contienen los 2 directos cliente del baseline  | `BLOQUEO_DE_MIGRACION`        | `SHELL-AUTH-005`; frontera server `AUTH-UI-043`                     |
| ORIGO mantiene fallback de suppliers por rol                 | `BLOQUEO_DE_MIGRACION`        | `SHELL-AUTH-005`                                                    |
| ratchet ESLint existente no modela deuda AUTH legacy         | `SEPARACION_REQUERIDA`        | futura instancia `SHELL-AUTH-004::<implementation_unit_id>`         |
| runtime telemetry completa no existe para todos los directos | `PENDIENTE_DE_IMPLEMENTACION` | AUTH004 físico + migración AUTH005; condición: cobertura demostrada |
| PASS no requiere fila laboral sintética                      | `NO_APLICA`                   | conservar contrato AUTH003/AUTH-CTX-027                             |
| AURA no tiene repo runtime confirmado en el corte            | `PENDIENTE_DE_EVIDENCIA`      | `AURA-AUTH-001` antes de primera adopción                           |

No se crea una tarea nueva.

---

#### 31. Requisitos de prueba derivados

**Resultado:** GENERA 8 REQUISITOS DE PRUEBA.

**Requisitos creados:** **8**
**Requisitos modificados:** **0**

- `TREQ-SHELL-083` — registry + allowlist exacta + identidad estable + prohibición de wildcard y consumidor no registrado;
- `TREQ-SHELL-084` — freeze de las cinco APIs legacy, construcción local de permission key y deuda monótonamente decreciente;
- `TREQ-SHELL-085` — bloqueo de autorización directa desde cliente y migración hacia proyecciones seguras server-issued;
- `TREQ-SHELL-086` — bloqueo de nueva autoridad local por rol/bypass/caller-context/boolean/can_operate/helper duplicado;
- `TREQ-SHELL-087` — métricas reconciliadas, labels seguros, correlación sin autoridad y ausencia no inferida como cero;
- `TREQ-SHELL-088` — ciclo de vida de allowlist temporal, stale/orphan, deprecación y conservación histórica sin reactivar cuota;
- `TREQ-SHELL-089` — integración multi-repositorio del gate, fail-closed, compatibilidad, commit/lockfile/snapshot y evidencia vigente;
- `TREQ-SHELL-090` — unicidad por unidad, seguridad/denegaciones, RLS/RPC solo con evidencia real, lineage y rollback.

No se difiere, descarta ni vuelve obsoleto ningún requisito histórico.

---

#### 32. Puerta de cierre del marcador global

El marcador global queda documentalmente cerrado porque:

1. fija exactamente cinco APIs legacy congeladas;
2. define nueve reglas de detección;
3. define finding e identidad normalizados;
4. crea allowlist temporal sin wildcards;
5. materializa decisión para 32/32 identidades baseline;
6. reconcilia ocho perfiles y 32 filas;
7. conserva PASS con cero filas sintéticas;
8. conserva AURA sin path inventado;
9. define catorce métricas;
10. separa ratchet genérico y deuda AUTH;
11. define scanner, privacidad y anti-evasión;
12. define doce gates fail-closed;
13. define integración, compatibilidad y RLS/RPC aplicable;
14. define rollback y preservación histórica;
15. fija snapshot reproducible;
16. crea `TREQ-SHELL-083` a `TREQ-SHELL-090`;
17. mantiene 0 cambios físicos y 0 cambios Supabase en este marcador.

---

#### 33. Puerta de cierre de futura instancia

`SHELL-AUTH-004::<implementation_unit_id>` podrá quedar `PASS` solo cuando:

- E5 habilite unidad y owner;
- scanner y gate físicos reproduzcan las nueve reglas;
- el registro vigente esté reconciliado desde las 32 filas baseline;
- la allowlist activa sea exacta, sin wildcard, stale ni orphan;
- no exista deuda nueva ni aumento de firmas baseline;
- los dos directos cliente baseline no hayan aumentado;
- toda nueva autoridad local esté en cero;
- métricas y findings reconcilien;
- todos los consumidores aplicables ejecuten checks sobre el mismo commit;
- pruebas de evasión y fail-closed estén correctas;
- compatibilidad y lineage sean vigentes;
- RLS/RPC solo aparezcan `PASS` con evidencia física propia cuando apliquen;
- snapshot, versiones, commits y digest coincidan;
- rollback haya sido ensayado;
- `TREQ-SHELL-083` a `TREQ-SHELL-090` tengan evidencia atribuible a esa misma instancia.

---

#### 34. Criterios de aceptación

- [x] `SHELL-AUTH-003` es la precedencia inmediata aprobada;
- [x] `SHELL-AUTH-005` permanece reservada;
- [x] la tarea usa `PER_IMPLEMENTATION_UNIT`;
- [x] se separa definición global de materialización física;
- [x] se preservan 32/32 identidades del registro;
- [x] no se agregan consumidores PASS o AURA inventados;
- [x] se congelan cinco familias legacy reconocidas;
- [x] se definen nueve reglas con fail-closed;
- [x] se prohíben comodines y cuotas transferibles;
- [x] deuda eliminada no puede reaparecer usando baseline histórica;
- [x] se materializa una decisión por cada una de las 32 identidades;
- [x] se distinguen ocho perfiles de deuda;
- [x] se definen catorce métricas con minimización de datos;
- [x] runtime telemetry no se finge donde no existe cobertura;
- [x] se separa AUTH004 del ratchet ESLint genérico;
- [x] se define análisis de client, roles, caller context, booleanos y helpers duplicados;
- [x] se define anti-evasión;
- [x] se definen doce gates;
- [x] se exige evidencia por repositorio/commit/lockfile/snapshot;
- [x] se exige compatibilidad y lineage;
- [x] RLS/RPC no se certifican por inferencia;
- [x] se define rollback sin reexpandir deuda;
- [x] se fija snapshot y huella;
- [x] se crean exactamente ocho TREQ nuevos;
- [x] se declaran 0 cambios físicos y 0 cambios Supabase;
- [x] no se desarrolla `SHELL-AUTH-005`.

---

#### 35. Límites

Esta tarea no:

- crea el scanner físico;
- modifica `eslint.config.mjs`;
- modifica `scripts/quality/lint-ratchet.mjs`;
- modifica la baseline genérica de ESLint;
- crea workflows o branch protection;
- modifica `packages/os-context`;
- crea el subpath `/legacy` físicamente;
- migra una sola de las 32 filas;
- elimina helpers, guards, hooks o llamadas RPC;
- corrige el fallback por rol de ORIGO;
- corrige los directos cliente de PULSO o ANIMA;
- implementa `get_access_context` o `evaluate_authorization`;
- crea SQL, RLS, RPC, migraciones, triggers, Storage, Realtime o Edge Functions;
- ejecuta Supabase;
- declara telemetría runtime existente donde no está instrumentada;
- declara compatibilidad o paridad por documentación;
- ejecuta `SHELL-AUTH-004::<implementation_unit_id>`;
- inicia o desarrolla la tarea siguiente.

---

#### 36. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-AUTH-003 — Implementar scope por solicitud y registro canónico de consumidores`

**TAREA ACTUAL APROBADA**
`SHELL-AUTH-004 — Implementar lint, métricas y gates contra consumidores legacy`

**SIGUIENTE TAREA RESERVADA**
`SHELL-AUTH-005 — Migrar consumidores de autorización en todos los repositorios`


### ✅ SHELL-AUTH-005 — Migrar consumidores de autorización en todos los repositorios

**Estado:** APROBADA
**Tarea anterior:** SHELL-AUTH-004 — Implementar lint, métricas y gates contra consumidores legacy
**Tarea siguiente:** SHELL-CTX-001 — Consolidar el módulo de contexto dentro de @vento/os-context
**Tipo de tarea:** documental — definición global única del contrato de migración multi-repositorio de consumidores de autorización/contexto, paridad, cutover, evidencia, rollback y handoff de retiro legacy, con futura materialización física `SHELL-AUTH-005::<implementation_unit_id>` una sola vez por unidad de implementación
**Bloque:** BLOQUE H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md`
**Estado físico resultante:** contrato global de migración multi-repositorio especificado; 32/32 consumidores con decisión explícita; 4 grupos de migración; 6 clasificaciones de paridad; 12 gates; 0/32 consumidores físicamente migrados; 0 cambios de código; 0 cambios de manifests/lockfiles; 0 cambios Supabase; 0 retiros físicos
**Cambios físicos autorizados:** ninguno durante el marcador global
**Requisitos de prueba creados o modificados:** 8 creados (`TREQ-SHELL-091` a `TREQ-SHELL-098`)
**Modalidad:** `PER_IMPLEMENTATION_UNIT`
**Trabajo canónico actual:** definir el contrato global una sola vez y asignar la futura materialización sin ejecutar consumidores
**Instancia física futura:** `SHELL-AUTH-005::<implementation_unit_id>`
**Condición topológica de materialización:** `DELIV-PKG-025::<package_id>` asigna `implementation_unit_id` y el package propietario obtiene `E5-GATE-008::<package_id> = PASS`
**Precedencia documental para desarrollar:** `SHELL-AUTH-004`
**Registro de entrada:** `SHELL-AUTH-REQUEST-SCOPE-CONSUMERS-001` — 32 filas baseline, 15 campos, 32 identidades únicas
**Freeze de entrada:** `SHELL-AUTH-LEGACY-GATES-001` — 9 reglas, 14 métricas, 12 gates y allowlist exacta de 32 identidades
**Snapshot producido:** `SHELL-AUTH-CONSUMER-MIGRATION-001`

---

#### 1. Resultado material

Se define el contrato canónico que convierte el inventario y freeze de `SHELL-AUTH-003..004` en una migración verificable por consumidor, sin confundir una definición documental con un cutover ya ejecutado.

La regla de salida es:

```text
CONSUMIDOR REGISTRADO
+ DESTINO CANÓNICO EXACTO
+ PARIDAD CLASIFICADA
+ VALIDACIÓN DEL MISMO COMMIT
+ CUTOVER FAIL-CLOSED
+ ROLLBACK CERTIFICADO DURANTE LA VENTANA PERMITIDA
= CONSUMIDOR MIGRABLE
```

```text
MIGRACIÓN CONFIRMADA
→ llamada directa legacy = 0
→ autoridad local legacy = 0
→ registry row con evidencia física = COMPATIBLE
→ finding AUTH004 = MIGRATED
→ cuota temporal AUTH004 deja de ser reutilizable
```

```text
AUTH005
→ migra consumidores y deja retiro legacy en condición verificable

AUTH-DB-030
→ retira objetos/RPC legacy aplicables

AUTH-DB-031
→ certifica cierre final de la transición
```

El marcador materializa:

| Dimensión                                                        | Resultado |
| ---------------------------------------------------------------- | --------: |
| filas baseline con decisión explícita                            | **32/32** |
| identidades duplicadas                                           |     **0** |
| repositorios físicos actuales con filas                          |     **8** |
| ámbitos conceptuales cubiertos, incluido PASS/AURA/shared        |    **11** |
| perfiles de deuda heredados                                      |     **8** |
| grupos de migración materializados                               |     **4** |
| filas `PRECONDICIÓN COMPARTIDA`                                  |     **1** |
| filas `OLA 3`                                                    |     **1** |
| filas `OLA 4`                                                    |    **25** |
| filas `OLA 5`                                                    |     **5** |
| directos cliente baseline                                        |     **2** |
| resultados/clasificaciones de paridad                            |     **6** |
| gates de futura materialización                                  |    **12** |
| objetivo de consumidores directos legacy después de la instancia |     **0** |
| objetivo de findings estáticos legacy después de la instancia    |     **0** |
| objetivo de consumidores no registrados                          |     **0** |
| código, Supabase o despliegues ejecutados ahora                  |     **0** |
| requisitos de prueba nuevos                                      |     **8** |

---

#### 2. Fuentes vinculantes y estado verificable

La tarea consume como fuentes normativas:

1. protocolo canónico vigente;
2. contrato modular de entrega vigente;
3. secuencia activa con `SHELL-AUTH-004` como precedencia y `SHELL-AUTH-005` como primera tarea pendiente;
4. topología `PER_IMPLEMENTATION_UNIT`;
5. `SHELL-AUTH-001..004` aprobadas;
6. `AUTH-CTX-027` sobre consumo centralizado, olas, paridad, pruebas y retiro;
7. `SHELL-PKG-004` sobre compatibilidad por consumidor;
8. `SHELL-PKG-005` sobre deprecación y retiro;
9. `SHELL-PKG-006` sobre rollback independiente por aplicación;
10. `SHELL-PKG-008` sobre fail-closed y evidencia por combinación;
11. `AUTH-DB-020`, `AUTH-DB-006..010` y `AUTH-DB-021` como adopción física de objetos/RPC/RLS cuando aplique;
12. `AUTH-DB-030` y `AUTH-DB-031` como retiro y certificación posteriores;
13. el registro canónico de 32 consumidores y el freeze AUTH004;
14. el registro 04A vigente con 7058 requisitos y `TREQ-SHELL-001..090`.

El corte de manifests actual es:

| Repositorio                  | blob `package.json`                        | runtime declarado                                                        | cobertura AUTH003                 |
| ---------------------------- | ------------------------------------------ | ------------------------------------------------------------------------ | --------------------------------- |
| `devVentoGroup/vento-shell`  | `151b6072f7ed7b88b83dce67f61d54e3b622f238` | Next 16.1.1 / React 19.2.3 / Supabase JS ^2.90.1                         | 1 consumer + 1 shared-service row |
| `devVentoGroup/vento-viso`   | `91920190b8f24da8f593e76d08b238fd4d294392` | Next ^16.1.6 / React 19.2.3 / Supabase JS ^2.90.1                        | 7 rows                            |
| `devVentoGroup/vento-nexo`   | `fe5f3231070a77bd62bd084f980a370c2152c643` | Next ^16.2.3 / React 19.2.3 / Supabase JS ^2.90.1                        | 4 rows                            |
| `devVentoGroup/vento-fogo`   | `043c3cda9f3f71957a762ccf53f3de97ef2685fc` | Next ^16.2.4 / React 19.2.3 / Supabase JS ^2.90.1                        | 3 rows                            |
| `devVentoGroup/vento-origo`  | `953df5749068ef56209bf8d5a4b46319fe1a7318` | Next ^16.2.1 / React 19.2.3 / Supabase JS ^2.90.1                        | 7 rows                            |
| `devVentoGroup/vento-pulso`  | `83d1340544f209df7f53b37551b6f71dd2c668a6` | Next 16.1.1 / React 19.2.3 / Supabase JS ^2.90.1                         | 5 rows                            |
| `devVentoGroup/vento-numera` | `82eb8a39c5c3225f5e59cf8997f01772d07b2e33` | Next ^16.2.1 / React 19.2.3 / Supabase JS ^2.90.1                        | 3 rows                            |
| `devVentoGroup/vento-anima`  | `27112bdfa34c7612b387dce71efae5cf946b6497` | Expo ~54.0.35 / React Native 0.81.5 / React 19.1.0 / Supabase JS ^2.91.0 | 1 row; perfil nativo              |

Ninguno de esos ocho manifests declara todavía una dependencia publicada `@vento/*` como adopción runtime certificada. La coexistencia de helpers, guards, contexto local, RPC directas y adapter transitorio sigue siendo baseline de migración, no estado final.

---

#### 3. Modalidad, unidad y separación documental/física

La tarea se rige por `PER_IMPLEMENTATION_UNIT`.

```text
MARCADOR GLOBAL SHELL-AUTH-005
→ define una vez matriz, orden, paridad, cutover, evidencia, gates y rollback
→ asigna cada identidad a una futura unidad mediante lineage
→ no inventa implementation_unit_id
→ no modifica repositorios consumidores

DELIV-PKG-025::<package_id>
→ asigna implementation_unit_id y owner package

E5-GATE-008::<package_id> = PASS
→ habilita materialización

SHELL-AUTH-005::<implementation_unit_id>
→ migra exactamente las filas asignadas a esa unidad
→ una misma identidad no puede migrarse dos veces
→ N package_id pueden consumir la misma unidad por lineage
```

El scope global conserva las 32 identidades actuales. La distribución física de esas identidades entre unidades se toma exclusivamente de `DELIV-PKG-025`; no se presupone aquí que todos los consumidores pertenecerán a una única unidad.

---

#### 4. Dependencias de ejecución de una futura instancia

Además del gate topológico E5, cada instancia exige que estén físicamente disponibles y compatibles, cuando correspondan a sus filas:

- `SHELL-AUTH-001::<implementation_unit_id>` — paquete/exports canónicos;
- `SHELL-AUTH-002::<implementation_unit_id>` — adapters y proyecciones;
- `SHELL-AUTH-003::<implementation_unit_id>` — request scope y registro;
- `SHELL-AUTH-004::<implementation_unit_id>` — freeze/gates;
- contratos `@vento/contracts` y `@vento/os-context` exactos;
- `AUTH-DB-033`, `AUTH-DB-035`, `AUTH-DB-034` y `AUTH-DB-032` materializados según la unidad;
- `AUTH-DB-020`, `AUTH-DB-006..010` y `AUTH-DB-021` cuando el consumidor dependa de RPC/RLS/objetos ya migrados;
- módulos `SHELL-CTX-*` requeridos por el comportamiento que la fila consuma;
- matriz de compatibilidad vigente y snapshot de rollback certificado.

Una dependencia física ausente deja la fila `BLOCKED`; no se sustituye por mocks que pretendan demostrar integración real.

---

#### 5. Estado objetivo de arquitectura

Al cerrar una instancia física para sus filas, el consumidor deberá cumplir simultáneamente:

1. `app_code` fijado por adapter propietario;
2. contexto resuelto desde frontera canónica;
3. permiso exacto desde catálogo canónico;
4. recurso resuelto en servidor para toda operación sensible;
5. `AuthorizationDecisionV1` o proyección segura correspondiente como contrato;
6. ninguna decisión empresarial derivada de nombre de rol, role override, `can_operate` o booleano legacy;
7. ninguna sede/área/actor/turno/check-in del caller usado como hecho efectivo;
8. ninguna RPC interna de autorización desde navegador/renderer;
9. ningún fallback que convierta DENY o fallo técnico canónico en ALLOW legacy;
10. ninguna doble ejecución de side effects para obtener paridad;
11. evidencia del mismo commit, versiones, lockfile/runtime y snapshots;
12. rollback controlado únicamente mientras la deuda siga legalmente en baseline temporal.

---

#### 6. Reconciliación del universo de consumidores

| Ámbito                | Filas | Cobertura documental     | Regla de migración                                                        |
| --------------------- | ----: | ------------------------ | ------------------------------------------------------------------------- |
| SHELL                 | **1** | `MATERIALIZADO`          | launcher directo; shared service se cuenta aparte                         |
| VISO                  | **7** | `MATERIALIZADO`          | 3 auth helpers + 4 superficies funcionales                                |
| NEXO                  | **4** | `MATERIALIZADO`          | 3 auth helpers + operational-context                                      |
| FOGO                  | **3** | `MATERIALIZADO`          | 3 auth helpers                                                            |
| ORIGO                 | **7** | `MATERIALIZADO`          | 3 auth helpers + 4 superficies funcionales                                |
| PULSO                 | **5** | `MATERIALIZADO`          | 3 auth helpers + Server Action + client component                         |
| NUMERA                | **3** | `MATERIALIZADO`          | 3 auth helpers                                                            |
| ANIMA                 | **1** | `MATERIALIZADO`          | client hook directo                                                       |
| PASS                  | **0** | `NO_APLICA`              | contexto laboral interno excluido por defecto; no se inventa fila         |
| AURA                  | **0** | `PENDIENTE_DE_EVIDENCIA` | sin repo runtime confirmado; primera adopción gobernada por AURA-AUTH-001 |
| SERVICIOS_COMPARTIDOS | **1** | `MATERIALIZADO`          | adapter transitorio de @vento/os-context                                  |

Las 32 filas permanecen en estado documental `PENDIENTE_DE_EVIDENCIA` hasta que una futura instancia produzca resultados físicos. PASS no recibe una fila laboral artificial. AURA permanece sin ruta runtime inventada; su primera adopción real deberá registrarse antes de operar conforme a `AURA-AUTH-001`.

---

#### 7. Grupos de migración derivados de AUTH-CTX-027

La secuencia de AUTH-CTX-027 se conserva. AUTH005 no reordena olas para acelerar el cutover.

| Grupo                     |                  Filas baseline | Regla                                                                                                                                                                                 |
| ------------------------- | ------------------------------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `PRECONDICIÓN COMPARTIDA` |                           **1** | el adapter transitorio de `@vento/os-context` debe estar reconciliado con las superficies canónicas antes del cutover de consumidores; AUTH005 verifica, no reimplementa AUTH001..004 |
| `OLA 3`                   |                           **1** | SHELL se migra primero como consumidor transversal de acceso/navegación                                                                                                               |
| `OLA 4`                   |                          **25** | helpers, guards, sesiones/contextos locales, páginas/lecturas y proyecciones cliente migran sin heredar autoridad local                                                               |
| `OLA 5`                   |                           **5** | Server Actions y Route Handlers migran con permiso/recurso exactos, denegaciones, concurrencia y rollback                                                                             |
| `OLA 6`                   | **0 filas baseline inventadas** | RPC/RLS se incorporan solo si existen filas físicas registradas y tareas propietarias materializadas                                                                                  |
| `OLA 7`                   | **0 filas baseline inventadas** | jobs, Edge, Realtime e integraciones se incorporan solo cuando existan consumidores reales registrados                                                                                |
| `OLA 8`                   |           **handoff posterior** | requiere convergencia a cero y habilita retiro/certificación en `AUTH-DB-030/031`; no se adelanta en este marcador                                                                    |

**Conciliación de las 32 filas actuales:** 1 + 1 + 25 + 5 = **32**; cero filas omitidas y cero duplicadas.

---

#### 8. Matriz materializada 32/32

Cada fila hereda la identidad estable `(repository, path, surface_type, consumer_name)` de AUTH003. La siguiente matriz fija un resultado de migración explícito por identidad:

|    # | repository                   | path                                                     | surface_type       | consumer_name                                | perfil AUTH004              | grupo                     | destino canónico                                                                                       | paridad física requerida                                                                 |
| ---: | ---------------------------- | -------------------------------------------------------- | ------------------ | -------------------------------------------- | --------------------------- | ------------------------- | ------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------- |
|    1 | `devVentoGroup/vento-viso`   | `src/lib/auth/permissions.ts`                            | `SERVER_HELPER`    | VISO permission helper                       | `PERMISSION_HELPER`         | `OLA 4`                   | scope server + evaluateAuthorization/requireAuthorization; PermissionKey canónica                      | decisión ALLOW/DENY y error técnico sobre escenarios equivalentes                        |
|    2 | `devVentoGroup/vento-viso`   | `src/lib/auth/guard.ts`                                  | `SERVER_HELPER`    | VISO application guard                       | `DISTRIBUTED_GUARD`         | `OLA 4`                   | scope server + requireAuthorization; navegación mediante proyección segura                             | acceso de aplicación/ruta, denegaciones y recuperación segura                            |
|    3 | `devVentoGroup/vento-viso`   | `src/lib/auth/operational-session.ts`                    | `SERVER_HELPER`    | VISO operational-session                     | `OPERATIONAL_SESSION_LOCAL` | `OLA 4`                   | scope server + resolveAccessContext; sin territorio efectivo del caller                                | hechos empresariales equivalentes y readiness; no shape legacy                           |
|    4 | `devVentoGroup/vento-nexo`   | `src/lib/auth/permissions.ts`                            | `SERVER_HELPER`    | NEXO permission helper                       | `PERMISSION_HELPER`         | `OLA 4`                   | scope server + evaluateAuthorization/requireAuthorization; PermissionKey canónica                      | decisión ALLOW/DENY y error técnico sobre escenarios equivalentes                        |
|    5 | `devVentoGroup/vento-nexo`   | `src/lib/auth/guard.ts`                                  | `SERVER_HELPER`    | NEXO application guard                       | `DISTRIBUTED_GUARD`         | `OLA 4`                   | scope server + requireAuthorization; navegación mediante proyección segura                             | acceso de aplicación/ruta, denegaciones y recuperación segura                            |
|    6 | `devVentoGroup/vento-nexo`   | `src/lib/auth/operational-session.ts`                    | `SERVER_HELPER`    | NEXO operational-session                     | `OPERATIONAL_SESSION_LOCAL` | `OLA 4`                   | scope server + resolveAccessContext; sin territorio efectivo del caller                                | hechos empresariales equivalentes y readiness; no shape legacy                           |
|    7 | `devVentoGroup/vento-fogo`   | `src/lib/auth/permissions.ts`                            | `SERVER_HELPER`    | FOGO permission helper                       | `PERMISSION_HELPER`         | `OLA 4`                   | scope server + evaluateAuthorization/requireAuthorization; PermissionKey canónica                      | decisión ALLOW/DENY y error técnico sobre escenarios equivalentes                        |
|    8 | `devVentoGroup/vento-fogo`   | `src/lib/auth/guard.ts`                                  | `SERVER_HELPER`    | FOGO application guard                       | `DISTRIBUTED_GUARD`         | `OLA 4`                   | scope server + requireAuthorization; navegación mediante proyección segura                             | acceso de aplicación/ruta, denegaciones y recuperación segura                            |
|    9 | `devVentoGroup/vento-fogo`   | `src/lib/auth/operational-session.ts`                    | `SERVER_HELPER`    | FOGO operational-session                     | `OPERATIONAL_SESSION_LOCAL` | `OLA 4`                   | scope server + resolveAccessContext; sin territorio efectivo del caller                                | hechos empresariales equivalentes y readiness; no shape legacy                           |
|   10 | `devVentoGroup/vento-origo`  | `src/lib/auth/permissions.ts`                            | `SERVER_HELPER`    | ORIGO permission helper                      | `PERMISSION_HELPER`         | `OLA 4`                   | scope server + evaluateAuthorization/requireAuthorization; PermissionKey canónica                      | decisión ALLOW/DENY y error técnico sobre escenarios equivalentes                        |
|   11 | `devVentoGroup/vento-origo`  | `src/lib/auth/guard.ts`                                  | `SERVER_HELPER`    | ORIGO application guard                      | `DISTRIBUTED_GUARD`         | `OLA 4`                   | scope server + requireAuthorization; navegación mediante proyección segura                             | acceso de aplicación/ruta, denegaciones y recuperación segura                            |
|   12 | `devVentoGroup/vento-origo`  | `src/lib/auth/operational-session.ts`                    | `SERVER_HELPER`    | ORIGO operational-session                    | `OPERATIONAL_SESSION_LOCAL` | `OLA 4`                   | scope server + resolveAccessContext; sin territorio efectivo del caller                                | hechos empresariales equivalentes y readiness; no shape legacy                           |
|   13 | `devVentoGroup/vento-pulso`  | `src/lib/auth/permissions.ts`                            | `SERVER_HELPER`    | PULSO permission helper                      | `PERMISSION_HELPER`         | `OLA 4`                   | scope server + evaluateAuthorization/requireAuthorization; PermissionKey canónica                      | decisión ALLOW/DENY y error técnico sobre escenarios equivalentes                        |
|   14 | `devVentoGroup/vento-pulso`  | `src/lib/auth/guard.ts`                                  | `SERVER_HELPER`    | PULSO application guard                      | `DISTRIBUTED_GUARD`         | `OLA 4`                   | scope server + requireAuthorization; navegación mediante proyección segura                             | acceso de aplicación/ruta, denegaciones y recuperación segura                            |
|   15 | `devVentoGroup/vento-pulso`  | `src/lib/auth/operational-session.ts`                    | `SERVER_HELPER`    | PULSO operational-session                    | `OPERATIONAL_SESSION_LOCAL` | `OLA 4`                   | scope server + resolveAccessContext; sin territorio efectivo del caller                                | hechos empresariales equivalentes y readiness; no shape legacy                           |
|   16 | `devVentoGroup/vento-numera` | `src/lib/auth/permissions.ts`                            | `SERVER_HELPER`    | NUMERA permission helper                     | `PERMISSION_HELPER`         | `OLA 4`                   | scope server + evaluateAuthorization/requireAuthorization; PermissionKey canónica                      | decisión ALLOW/DENY y error técnico sobre escenarios equivalentes                        |
|   17 | `devVentoGroup/vento-numera` | `src/lib/auth/guard.ts`                                  | `SERVER_HELPER`    | NUMERA application guard                     | `DISTRIBUTED_GUARD`         | `OLA 4`                   | scope server + requireAuthorization; navegación mediante proyección segura                             | acceso de aplicación/ruta, denegaciones y recuperación segura                            |
|   18 | `devVentoGroup/vento-numera` | `src/lib/auth/operational-session.ts`                    | `SERVER_HELPER`    | NUMERA operational-session                   | `OPERATIONAL_SESSION_LOCAL` | `OLA 4`                   | scope server + resolveAccessContext; sin territorio efectivo del caller                                | hechos empresariales equivalentes y readiness; no shape legacy                           |
|   19 | `devVentoGroup/vento-nexo`   | `src/lib/auth/operational-context.ts`                    | `SERVER_HELPER`    | NEXO operational context                     | `OPERATIONAL_CONTEXT_LOCAL` | `OLA 4`                   | scope + resolveAccessContext + evaluateAuthorization/requireAuthorization; sin can_operate/override    | hechos de contexto y decisión por recurso; no paridad de shape plana                     |
|   20 | `devVentoGroup/vento-shell`  | `src/app/page.tsx`                                       | `SERVER_COMPONENT` | SHELL application launcher                   | `DIRECT_SERVER_AUTH`        | `OLA 3`                   | scope + evaluateAuthorization + SafeDecisionProjectionV1                                               | acceso a cada aplicación y denegación segura sin fallback de firma                       |
|   21 | `devVentoGroup/vento-viso`   | `src/app/api/viso/upload-product-image/route.ts`         | `ROUTE_HANDLER`    | VISO product-image upload                    | `DIRECT_SERVER_AUTH`        | `OLA 5`                   | scope + requireAuthorization sobre recurso exacto antes del upload                                     | decisión canónica; side effect Storage se ejecuta una sola vez                           |
|   22 | `devVentoGroup/vento-viso`   | `src/app/api/viso/upload-commercial-menu-image/route.ts` | `ROUTE_HANDLER`    | VISO commercial-menu image upload            | `DIRECT_SERVER_AUTH`        | `OLA 5`                   | scope + requireAuthorization sobre recurso exacto antes del upload                                     | decisión canónica; procesamiento/upload se ejecutan una sola vez                         |
|   23 | `devVentoGroup/vento-viso`   | `src/app/api/viso/attendance-report/route.ts`            | `ROUTE_HANDLER`    | VISO attendance report                       | `DIRECT_SERVER_AUTH`        | `OLA 5`                   | scope + requireAuthorization sobre reporte/recurso exactos                                             | decisión y alcance de lectura/exportación; generación una sola vez                       |
|   24 | `devVentoGroup/vento-viso`   | `src/app/staff/[id]/page.tsx`                            | `SERVER_COMPONENT` | VISO staff detail                            | `DIRECT_SERVER_AUTH`        | `OLA 4`                   | scope + evaluateAuthorization/requireAuthorization; proyección segura para presentación                | acceso directo por URL, recurso staff y acciones sensibles separadas                     |
|   25 | `devVentoGroup/vento-origo`  | `src/lib/suppliers.ts`                                   | `SERVER_HELPER`    | ORIGO supplier management                    | `ROLE_FALLBACK`             | `OLA 4`                   | scope + requireAuthorization; sin fallback permisivo por rol                                           | mismos casos de negocio contra contrato; deny canónico no se amplía por rol              |
|   26 | `devVentoGroup/vento-origo`  | `src/app/receipts/new/page.tsx`                          | `SERVER_COMPONENT` | ORIGO receipt creation                       | `DIRECT_SERVER_AUTH`        | `OLA 4`                   | scope + evaluateAuthorization/requireAuthorization; contexto canónico                                  | acceso de vista/contexto; mutaciones se autorizan en su frontera server exacta           |
|   27 | `devVentoGroup/vento-origo`  | `src/app/product-master-review/page.tsx`                 | `SERVER_COMPONENT` | ORIGO product master review                  | `DIRECT_SERVER_AUTH`        | `OLA 4`                   | scope + evaluateAuthorization/requireAuthorization; contexto canónico                                  | acceso por recurso y denegaciones; mutaciones no heredan autorización de página          |
|   28 | `devVentoGroup/vento-origo`  | `src/app/purchase-orders/[id]/pdf/route.ts`              | `ROUTE_HANDLER`    | ORIGO purchase-order PDF                     | `DIRECT_SERVER_AUTH`        | `OLA 5`                   | scope + requireAuthorization sobre purchase order exacta en la rama autenticada                        | decisión/rama autenticada; otras credenciales conservan contrato propietario separado    |
|   29 | `devVentoGroup/vento-pulso`  | `src/modules/pos/actions/identify-client.action.ts`      | `SERVER_ACTION`    | PULSO identify client                        | `DIRECT_SERVER_AUTH`        | `OLA 5`                   | scope + requireAuthorization sobre recurso exacto; siteId no es territorio efectivo                    | decisión antes de consulta sensible; consulta/efecto se ejecuta una sola vez             |
|   30 | `devVentoGroup/vento-pulso`  | `src/app/orders/delivery-override-bridge.tsx`            | `CLIENT_COMPONENT` | PULSO delivery override visibility           | `CLIENT_DIRECT_AUTH`        | `OLA 4`                   | SafeDecisionProjectionV1 emitida por servidor + parser /client; mutación reautorizada en servidor      | visibilidad segura y reautorización server; navegador sin RPC interna de autorización    |
|   31 | `devVentoGroup/vento-anima`  | `src/hooks/use-app-permissions.ts`                       | `CLIENT_HOOK`      | ANIMA app permissions hook                   | `CLIENT_DIRECT_AUTH`        | `OLA 4`                   | SafeDecisionProjectionV1/SafeContextProjectionV1 emitida por servidor + parser /client puro            | presentación móvil equivalente; cero RPC interna de autorización desde Expo/cliente      |
|   32 | `devVentoGroup/vento-shell`  | `packages/os-context/src/client.ts`                      | `SDK_ADAPTER`      | @vento/os-context transitional legacy client | `LEGACY_SDK_ADAPTER`        | `PRECONDICIÓN COMPARTIDA` | adapters /server y parsers /client canónicos; /legacy solo durante transición y luego sin consumidores | contratos, exports y compatibilidad; no se preservan booleanos/shapes legacy como oracle |

La matriz no afirma que el código ya esté migrado. Fija el destino, la ola y el oracle que deberá demostrar la futura instancia.

---

#### 9. Estados de migración AUTH005

AUTH005 mantiene un estado de migración separado del campo `status` del registro de consumidores:

```text
BASELINE_FROZEN
CANONICAL_READY
SHADOW_PARITY
PARITY_RESOLVED
CANONICAL_ENFORCING
OBSERVATION
MIGRATION_COMMITTED
RETIREMENT_HANDOFF_READY
BLOCKED
ROLLED_BACK
```

Flujo ordinario:

```text
BASELINE_FROZEN
→ CANONICAL_READY
→ SHADOW_PARITY
→ PARITY_RESOLVED
→ CANONICAL_ENFORCING
→ OBSERVATION
→ MIGRATION_COMMITTED
→ RETIREMENT_HANDOFF_READY
```

`ROLLED_BACK` solo es admisible desde una etapa donde la cuota legacy exacta todavía no haya sido eliminada del baseline AUTH004. `BLOCKED` puede ocurrir en cualquier gate y conserva owner, causa, evidencia y condición de salida.

---

#### 10. Relación con el estado del registro y findings AUTH004

El estado de migración no reemplaza las taxonomías previas.

```text
ANTES DEL CUTOVER
registry.status = PENDIENTE_DE_EVIDENCIA
AUTH004 finding = BASELINE_TEMPORAL
```

```text
MIGRATION_COMMITTED
registry.status = COMPATIBLE
AUTH004 finding = MIGRATED
```

La transición a `COMPATIBLE` exige evidencia física. Un cambio documental no la produce.

`MIGRATED` reduce de forma irreversible la cuota AUTH004. `HISTORICAL` solo se alcanza cuando el finding ya no forma parte del código ejecutable y su removal gate aplicable está satisfecho. Ningún rollback ordinario puede ejecutar `MIGRATED → BASELINE_TEMPORAL` ni `HISTORICAL → BASELINE_TEMPORAL`.

---

#### 11. Precondición compartida del SDK

La fila `packages/os-context/src/client.ts` representa el adapter transitorio, no un consumidor de dominio ordinario.

AUTH005 deberá comprobar antes de las olas de consumidor que:

- las superficies server/client/testing aprobadas estén disponibles en la combinación exacta;
- `/client` permanezca puro y renderer-neutral;
- `/legacy`, si todavía existe durante transición, esté registrado, instrumentado y sin nuevas adopciones;
- las aplicaciones no copien adapters para evitar depender del package;
- el root export no reintroduzca booleanos o shapes legacy como autoridad final;
- la eliminación final del adapter legacy ocurra solo después de cero consumidores directos y con handoff hacia retiro de backend.

AUTH005 no vuelve a diseñar ni implementar las APIs de AUTH001..004.

---

#### 12. OLA 3 — SHELL como primer consumidor transversal

La fila `devVentoGroup/vento-shell / src/app/page.tsx` se migra antes de los demás consumidores de aplicación.

Resultado requerido:

```text
cinco accesos de aplicación
→ PermissionKey canónica
→ AuthorizationScope de SHELL
→ evaluateAuthorization por aplicación
→ SafeDecisionProjectionV1 para presentación
```

Quedan eliminados del camino final:

- `has_permission` directo;
- fallback entre firma completa y firma `p_app_id/p_code`;
- split local de permission code como mecanismo de compatibilidad;
- booleano RPC como contrato de decisión.

La paridad se mide por acceso de cada aplicación y denegaciones esperadas, no por reproducir el fallback de firma.

---

#### 13. OLA 4 — helpers, guards, contexto y superficies de lectura/presentación

OLA 4 concentra 25 filas.

Reglas:

1. `permissions.ts` deja de construir prefijos y de devolver booleano legacy;
2. `guard.ts` deja de combinar autorización con role override o territorio del caller;
3. `operational-session.ts` deja de ser fuente autoritativa paralela de contexto;
4. NEXO `operational-context.ts` deja de usar `can_operate`, permiso operativo directo o modificación local del rol/área como autoridad;
5. Server Components validan acceso/recurso en servidor y solo serializan proyecciones seguras;
6. PULSO/ANIMA cliente reciben DTO ya evaluados por servidor, sin invocar RPC internas de autorización;
7. una página autorizada no transfiere su decisión a una mutación posterior;
8. un role fallback legacy que anteriormente ampliaba acceso se clasifica como divergencia, no como requisito de paridad.

---

#### 14. OLA 5 — Server Actions y Route Handlers

Las cinco filas de OLA 5 deberán construir o consumir una evaluación exacta de recurso antes de ejecutar la operación sensible.

Regla de side effect:

```text
PARIDAD
→ puede ejecutar legacy y canónico como EVALUACIONES comparables
→ NO ejecuta dos veces upload, export, consulta sensible con side effect, mutación o transición de estado
```

Durante shadow se comparan decisiones/contexto. La operación empresarial se ejecuta una sola vez por la frontera que sea autoritativa en esa etapa.

Después del cutover:

```text
CANONICAL DENY
→ operación no ejecutada

CANONICAL TECHNICAL FAILURE
→ operación no ejecutada

LEGACY ALLOW
→ nunca funciona como fallback de un DENY/fallo canónico
```

Volver temporalmente al comportamiento anterior exige rollback de la combinación, no un fallback por llamada.

---

#### 15. OLA 6 y OLA 7 — consumidores futuros físicamente confirmados

El baseline actual no contiene filas RPC, RLS, JOB, EDGE_FUNCTION o REALTIME que AUTH005 pueda inventar.

Si una futura instancia encuentra superficies reales:

- primero se registran con los 15 campos de AUTH003;
- se asignan a la unidad por lineage;
- RPC/RLS esperan sus tareas propietarias y evidencia real;
- jobs/Edge/Realtime usan principal técnico registrado y app fijo;
- el scanner AUTH004 debe cubrirlas según aplicabilidad;
- no se usa ausencia de fila histórica como permiso para omitirlas.

PASS y AURA siguen las reglas de cobertura de la sección 6.

---

#### 16. Frontera cliente y perfil ANIMA

PULSO y ANIMA son las dos filas cliente baseline.

Destino común:

```text
SERVIDOR
→ resuelve contexto/decisión
→ emite SafeContextProjectionV1 / SafeDecisionProjectionV1

CLIENTE
→ parsea DTO con @vento/os-context/client
→ usa resultado para presentación
→ no obtiene autoridad ejecutable
```

Para ANIMA se aplica además:

- su runtime actual es Expo/React Native, no Next.js;
- no se exige un script web inexistente como prueba de compatibilidad;
- `/client` deberá permanecer sin React, Next.js, React Native, Expo, red o Supabase;
- el adapter de presentación móvil puede usar hooks propios consumiendo DTO seguros;
- ninguna mutación nativa reutiliza una proyección como autorización;
- la validación física usa el perfil móvil/TypeScript/Expo que corresponda al commit real.

---

#### 17. Contrato de paridad

Cada fila migra contra un conjunto cerrado de escenarios reproducibles. Una comparación válida conserva:

```text
consumer_identity
source_commit
canonical_commit
app_code
principal/actor lógico equivalente
resource identity/version cuando aplique
context source versions/fingerprint aplicable
legacy result
canonical result
classification
expected canonical oracle
contracts/sdk/backend versions
environment
evidence digest
```

No se exige igualdad byte a byte entre un shape legacy y `AccessContextV1`, ni entre un booleano y `AuthorizationDecisionV1`. La paridad protege el comportamiento empresarial correcto y la denegación cerrada según el contrato nuevo.

---

#### 18. Clasificación cerrada de paridad

Se preserva la taxonomía de AUTH-CTX-027 y se añade el caso sin divergencia:

```text
IGUAL
CORRECCION_INTENCIONAL
BRECHA_DE_DATOS
BUG_LEGACY
BUG_CANONICO
CONTRATO_PENDIENTE
```

Reglas:

- `IGUAL`: el comportamiento contractual esperado coincide;
- `CORRECCION_INTENCIONAL`: la diferencia está respaldada por contrato/decisión aprobada y prueba negativa/positiva correspondiente;
- `BRECHA_DE_DATOS`: bloquea cutover hasta corregir datos/fuentes y reejecutar;
- `BUG_LEGACY`: no obliga a copiar el bug; exige demostrar que el resultado canónico coincide con el contrato aprobado antes de resolver la divergencia;
- `BUG_CANONICO`: bloquea cutover;
- `CONTRATO_PENDIENTE`: bloquea cutover y conserva el owner contractual aplicable.

Un resultado legacy incorrecto no se preserva para obtener una métrica de igualdad artificial.

---

#### 19. Oracle por perfil de deuda

| Perfil AUTH004              | Oracle de paridad                                                                                      |
| --------------------------- | ------------------------------------------------------------------------------------------------------ |
| `PERMISSION_HELPER`         | outcome, recurso/territorio resueltos en servidor, error técnico separado y PermissionKey canónica     |
| `DISTRIBUTED_GUARD`         | acceso directo por URL, redirección/mensaje seguro y prohibición de ampliar autoridad por rol/override |
| `OPERATIONAL_SESSION_LOCAL` | hechos empresariales canónicos y readiness; no igualdad de shape, selected site o navigation role      |
| `OPERATIONAL_CONTEXT_LOCAL` | contexto + decisión exacta; `can_operate` no forma parte del oracle final                              |
| `DIRECT_SERVER_AUTH`        | decisión exacta antes de la operación y side effect único                                              |
| `CLIENT_DIRECT_AUTH`        | proyección segura de presentación + reautorización server de la operación                              |
| `ROLE_FALLBACK`             | contrato canónico; un deny no puede transformarse en allow por lista local de roles                    |
| `LEGACY_SDK_ADAPTER`        | contratos/exports/compatibilidad; shapes/booleanos legacy no son oracle final                          |

---

#### 20. Shadow, cutover y fail-closed

`SHADOW_PARITY` solo compara resultados; no duplica efectos empresariales y no crea una tercera fuente de autoridad.

Para entrar en `CANONICAL_ENFORCING` se requiere:

1. paridad resuelta para escenarios obligatorios;
2. AUTH004 sin deuda nueva;
3. contratos/backend exactos disponibles;
4. compatibilidad del consumidor demostrada;
5. rollback snapshot válido y ensayable;
6. pruebas de seguridad y denegación correctas;
7. observabilidad suficiente para atribuir el cutover.

Una vez canónico:

- `DENY` canónico bloquea;
- fallo contractual/técnico bloquea;
- el cliente no puede elegir el carril legacy;
- el caller no puede solicitar fallback;
- el rollback se ejecuta como cambio de combinación controlado, no como rama permisiva por request.

---

#### 21. Ventana de observación y commit de migración

Durante `OBSERVATION` puede conservarse el artefacto legacy necesario para rollback, siempre dentro de la cuota exacta AUTH004 y sin nuevas invocaciones no justificadas.

Solo se entra en `MIGRATION_COMMITTED` cuando:

- el consumidor canónico opera sobre la combinación exacta;
- paridad/seguridad/regresión son correctas;
- el rollback window propietario se completó o cerró conforme al paquete E5;
- ya no se necesita reactivar el direct legacy como rollback ordinario;
- el scanner confirma eliminación de la firma/direct call aplicable;
- registry/test evidence se actualizan con el mismo commit.

En ese punto el finding pasa a `MIGRATED` y la cuota AUTH004 desaparece. Un incidente posterior usa forward-fix o mecanismo extraordinario aprobado; no resucita silenciosamente el legacy histórico.

---

#### 22. Contrato de evidencia por consumidor

Cada fila física deberá conservar:

```text
consumer_identity
implementation_unit_id
owner_package_id
consumer_package_ids
baseline_commit
result_commit
branch/base cuando aplique
manifest digest
lockfile digest
runtime/framework versions
@vento/contracts version
@vento/os-context version
backend identities/versions
registry snapshot
AUTH004 gate/allowlist snapshot
migration group
parity scenario set + results
security/denial results
consumer validation results
runtime telemetry coverage cuando aplique
rollback snapshot + rehearsal
artifact digest
blockers
```

Evidencia de otro commit, repo, runtime, versión o unidad es `STALE`.

---

#### 23. Perfil de validación de los siete consumidores web

Para SHELL, VISO, NEXO, FOGO, ORIGO, PULSO y NUMERA la futura instancia deberá ejecutar, según el repositorio real:

- instalación reproducible desde manifest/lockfile exactos;
- lint/análisis estático disponible y AUTH004;
- comprobación TypeScript reproducible;
- build/export aplicable;
- pruebas contractuales de adapters/proyecciones;
- pruebas de integración de autorización de las filas migradas;
- denegaciones y seguridad;
- regresión funcional focal;
- paridad legacy/canónica durante la etapa correspondiente;
- rollback rehearsal o evidencia del snapshot exacto.

La ausencia de un check obligatorio no se interpreta como PASS; se asigna a la automatización/prueba propietaria aplicable antes de certificar la fila.

---

#### 24. Perfil de validación de ANIMA

ANIMA usa un perfil nativo diferenciado:

- instalación reproducible desde su lockfile;
- validación TypeScript del proyecto móvil;
- resolución de package/subpath compatible con Metro/Expo y el runtime declarado;
- prueba de que `/client` no incorpora dependencias server/web/native de renderer;
- prueba de que el hook/adaptador de presentación no invoca RPC interna de autorización;
- escenarios allow/deny y cambio de actor/contexto mediante DTO seguros;
- replay de proyección incapaz de autorizar mutación;
- prueba de bundle/build/smoke nativo autorizada cuando la infraestructura correspondiente exista;
- rollback de versión/package y adapter móvil sin reactivar RPC cliente como estado final.

Un build Next.js de otro repositorio no certifica ANIMA.

---

#### 25. Compatibilidad, package y lineage

Cada consumidor debe demostrar la combinación exacta de:

```text
consumer commit
+ manifest/lockfile
+ runtime/framework
+ @vento/contracts
+ @vento/os-context
+ backend contract/version
+ registry snapshot
+ AUTH004 snapshot
= combinación certificable
```

La matriz de compatibilidad sigue en `SHELL-PKG-004`/`SHELL-CI-005`. AUTH005 consume esa evidencia y no crea compatibilidad por inferencia.

Una sola implementación física por `implementation_unit_id` puede servir a varios `package_id`; no se copia código del SDK por consumidor para evitar la distribución canónica.

---

#### 26. RLS, RPC y backend

AUTH005 migra consumidores; no sustituye la migración propietaria del backend.

Reglas:

1. una llamada TypeScript canónica no demuestra que RLS sea equivalente;
2. una policy correcta no demuestra que el consumidor use el adapter correcto;
3. una fila que dependa de RPC/RLS solo puede certificar esa parte con objeto y ambiente reales;
4. `AUTH-DB-006..010`, `AUTH-DB-021` y `AUTH-DB-027` conservan pruebas físicas de RPC/RLS;
5. `AUTH-DB-020` conserva la migración de objetos;
6. `AUTH-DB-030` conserva el retiro de objetos/RPC legacy;
7. `AUTH-DB-031` conserva la certificación final;
8. Supabase nunca se modifica desde repositorios consumidores.

---

#### 27. Handoff de retiro legacy

El resultado físico de AUTH005 es **elegibilidad verificable para el retiro**, no la eliminación anticipada de objetos backend.

Para `RETIREMENT_HANDOFF_READY` de la unidad se exige:

```text
consumidores directos legacy asignados = 0
findings estáticos legacy asignados = 0
consumidores no registrados = 0
client direct authorization asignada = 0
allowlist activa de filas migradas = 0
telemetría legacy = 0 cuando existe cobertura obligatoria demostrada
paridad = resuelta
rollback window = cerrada o transferida conforme al contrato
```

El handoff registra exactamente qué objetos legacy siguen existiendo solo para `AUTH-DB-030`. La existencia residual del backend no autoriza nuevas adopciones ni restaura cuotas AUTH004.

---

#### 28. Rollback por aplicación y consumidor

Antes de `MIGRATION_COMMITTED`, un rollback controlado puede restaurar el snapshot anterior únicamente si:

- commit/manifest/lockfile previos son exactos y disponibles;
- package artifacts e integridad coinciden;
- backend vigente acepta esa combinación;
- datos/schema son compatibles;
- la versión previa no restaura una vulnerabilidad o bypass conocido;
- la cuota AUTH004 exacta todavía está en `BASELINE_TEMPORAL`;
- el rollback fue ensayado o existe evidencia reproducible aplicable;
- el rollback no mezcla commits de distintos consumidores.

Si el snapshot previo dejó de ser seguro/compatible, el resultado es `FORWARD_FIX_REQUIRED`.

Después de `MIGRATION_COMMITTED`, un rollback ordinario no puede revivir una firma ya `MIGRATED`/`HISTORICAL`; se conserva la regla monotónica de AUTH004.

---

#### 29. Casos mínimos de paridad y seguridad

Cada futura instancia deberá cubrir, según aplicabilidad:

1. acceso permitido esperado;
2. acceso denegado esperado;
3. acceso directo por URL;
4. acción directa sin pasar por UI;
5. recurso ajeno;
6. sede ajena;
7. área ajena;
8. actor cambiado;
9. dispositivo incompatible;
10. contexto obsoleto;
11. mensaje seguro;
12. app code manipulado;
13. permission key manipulado;
14. recurso/version manipulados;
15. proyección client replayed;
16. decision_id usado como token;
17. sede/área del caller inyectadas como autoridad;
18. role fallback/bypass;
19. fallo técnico del backend;
20. rollback y repetición de los escenarios esenciales.

Las mutaciones nunca se duplican para comparar outputs.

---

#### 30. Snapshot contractual

Se define:

```text
snapshot_id = SHELL-AUTH-CONSUMER-MIGRATION-001
schema = vento.authorization-consumer-migration@1
baseline_consumer_row_count = 32
current_repository_count = 8
registry_field_count = 15
client_direct_baseline_count = 2
migration_groups = PRECONDICIÓN_COMPARTIDA:1, OLA_3:1, OLA_4:25, OLA_5:5
parity_outcomes = 6
gate_count = 12
target_direct_legacy_consumers = 0
target_static_legacy_findings = 0
target_unregistered_consumers = 0
target_client_direct_legacy = 0
pass_labor_consumer_rows = 0
aura_repository_confirmed = false
rollback_can_resurrect_historical_legacy = false
physical_state = NOT_IMPLEMENTED
```

Huella documental:

`sha256:7c54e585ce02a4a23ec38fd01435cac72740f4c0161070ed290f958976e52d83`

Payload normativo:

```json
{"aura_repository_confirmed":false,"baseline_consumer_row_count":32,"client_direct_baseline_count":2,"current_repository_count":8,"gate_count":12,"migration_group_counts":{"OLA_3":1,"OLA_4":25,"OLA_5":5,"SHARED_PREREQUISITE":1},"parity_outcome_count":6,"pass_labor_consumer_rows":0,"physical_state":"NOT_IMPLEMENTED","registry_field_count":15,"rollback_can_resurrect_historical_legacy":false,"schema":"vento.authorization-consumer-migration@1","snapshot_id":"SHELL-AUTH-CONSUMER-MIGRATION-001","target_client_direct_legacy":0,"target_direct_legacy_consumers":0,"target_static_legacy_findings":0,"target_unregistered_consumers":0,"wave_model":"AUTH-CTX-027_OLA_0_8"}
```

La serialización normativa usa JSON UTF-8 en una línea, claves ordenadas lexicográficamente y arrays/objetos internos en el orden estable indicado por el payload.

---

#### 31. Contrato de entrada de futura instancia

Toda `SHELL-AUTH-005::<implementation_unit_id>` registrará como mínimo:

| Campo                          | Obligación                                                  |
| ------------------------------ | ----------------------------------------------------------- |
| `implementation_unit_id`       | unidad exacta asignada por `DELIV-PKG-025`                  |
| `owner_package_id`             | package propietario con E5 PASS                             |
| `consumer_package_ids`         | paquetes que consumen la unidad                             |
| `assigned_consumer_identities` | filas exactas del registro asignadas a la unidad            |
| baseline/result commits        | commits por repositorio                                     |
| manifest/lockfile digests      | identidad de dependencias por consumidor                    |
| runtime matrix                 | framework/runtime exactos, incluido perfil ANIMA            |
| SDK/contracts/backend versions | versiones exactas de todas las fronteras                    |
| registry snapshot              | filas, estados, diff y 15 campos                            |
| AUTH004 snapshot               | scanner, allowlist, metrics y gates exactos                 |
| migration matrix               | grupo y target de cada fila asignada                        |
| parity evidence                | escenarios, clasificación y oracle canónico                 |
| security evidence              | denegaciones, manipulación, replay y bypass                 |
| consumer validation            | lint/type/build/tests o perfil equivalente aplicable        |
| RLS/RPC evidence               | solo cuando exista superficie física aplicable              |
| telemetry evidence             | cobertura y cero uso legacy cuando sea requisito de handoff |
| retirement handoff             | objetos legacy restantes y owner `AUTH-DB-030`              |
| rollback                       | snapshot previo, compatibilidad y ensayo                    |
| artifact digest                | huella del resultado materializado                          |
| blockers                       | lista cerrada con owner y condición de salida               |

Campo obligatorio ausente deja la instancia `BLOCKED`.

---

#### 32. Doce gates de futura materialización

| Gate                        | PASS                                                                                                   | Bloqueo                                                                               |
| --------------------------- | ------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------- |
| 1. `IDENTITY_LINEAGE`       | unidad, owner, filas, packages, commits y snapshots inequívocos                                        | identidad/lineage incompletos o fila duplicada entre unidades                         |
| 2. `PREREQUISITES`          | AUTH001..004 y backend/contratos aplicables disponibles en versiones compatibles                       | dependencia física ausente o combinación no certificada                               |
| 3. `REGISTRY_SCOPE`         | todas las filas asignadas reconciliadas, 15 campos, 0 unregistered/duplicates; PASS/AURA sin invención | consumidor omitido, fila huérfana o path inventado                                    |
| 4. `WAVE_ORDER`             | precondición shared y olas respetan AUTH-CTX-027; no se adelanta superficie sensible                   | cutover fuera de orden o backend aún no preparado                                     |
| 5. `CANONICAL_TARGET`       | cada fila usa su destino exacto y elimina autoridad local/direct legacy                                | wrapper nuevo, role fallback, caller context o booleano persistente                   |
| 6. `PARITY`                 | escenarios completos y divergencias resueltas contra oracle canónico                                   | bug canónico, brecha de datos, contrato pendiente o diferencia sin clasificación      |
| 7. `CLIENT_NATIVE_BOUNDARY` | PULSO/ANIMA sin RPC interna de autorización; DTO seguros y reauth server                               | autorización desde browser/native o replay como autoridad                             |
| 8. `CUTOVER_FAIL_CLOSED`    | canónico gobierna; DENY/técnico bloquean; side effect único                                            | fallback legacy, doble mutación o fail-open                                           |
| 9. `CONSUMER_VALIDATION`    | cada repo ejecuta perfil propio sobre el mismo commit/versiones                                        | lint/type/build/test faltante, ajeno, stale o no aplicable sin justificar             |
| 10. `BACKEND_RLS_RPC`       | objetos aplicables tienen evidencia física propia y paridad real                                       | inferencia TypeScript, objeto inexistente o ambiente no atribuible                    |
| 11. `RETIREMENT_HANDOFF`    | direct/static/client/unregistered en 0; telemetry 0 con cobertura; allowlist migrada sin reuso         | deuda residual, métrica falsa de cero o backend legacy sin owner de retiro            |
| 12. `ROLLBACK_EVIDENCE`     | rollback ensayable antes del commit de migración y no revive legacy histórico                          | snapshot inseguro/incompatible, evidencia de otra combinación o resurrección de deuda |

Todos los gates aplicables deben estar `PASS` para cerrar la instancia AUTH005. `AUTH-DB-030/031` siguen siendo necesarios para el retiro/certificación de backend posterior.

---

#### 33. Hallazgos y destinos exactos

| Hallazgo                                                                           | Estado documental             | Destino/condición de salida                                                                             |
| ---------------------------------------------------------------------------------- | ----------------------------- | ------------------------------------------------------------------------------------------------------- |
| los ocho manifests actuales no demuestran adopción runtime publicada de `@vento/*` | `PENDIENTE_DE_IMPLEMENTACION` | publicación/adopción física de packages y combinación certificada antes de `CANONICAL_READY`            |
| los helpers/guards/sesiones legacy siguen físicamente presentes                    | `LEGACY_ACTIVO`               | filas AUTH005 de OLA 4 + gates AUTH004; retiro de directos durante la instancia                         |
| NEXO conserva `operational-context.ts`                                             | `LEGACY_ACTIVO`               | fila NEXO de OLA 4; backend/contexto canónicos aplicables                                               |
| SHELL conserva `has_permission` y fallback de firma                                | `LEGACY_ACTIVO`               | OLA 3 de AUTH005; backend canónico disponible                                                           |
| ORIGO conserva fallback local por rol en suppliers                                 | `LEGACY_ACTIVO`               | fila ORIGO supplier management; no se conserva como paridad correcta                                    |
| PULSO conserva autorización cliente en delivery override                           | `LEGACY_ACTIVO`               | fila client PULSO → safe projection + reauth server                                                     |
| ANIMA conserva hook con RPC cliente y no tiene perfil web de build/lint            | `LEGACY_ACTIVO`               | fila ANIMA + perfil nativo AUTH005; `/client` puro                                                      |
| shared SDK conserva adapter legacy actual                                          | `LEGACY_ACTIVO`               | precondición shared; cero consumidores antes de eliminar adapter; backend legacy luego en `AUTH-DB-030` |
| PASS no tiene consumidor laboral baseline                                          | `NO_APLICA`                   | conservar regla; registrar solo si aparece superficie real autorizada                                   |
| AURA no tiene repo runtime confirmado en el corte                                  | `PENDIENTE_DE_EVIDENCIA`      | `AURA-AUTH-001` antes de primera adopción; no inventar path                                             |
| retiro de RPC/RLS legacy no pertenece a AUTH005                                    | `RESERVADO`                   | `AUTH-DB-030`; certificación posterior `AUTH-DB-031`                                                    |
| cualquier divergencia `BRECHA_DE_DATOS`, `BUG_CANONICO` o `CONTRATO_PENDIENTE`     | `BLOCKED`                     | owner de datos/código/contrato aplicable; reejecución de paridad antes de cutover                       |

No queda pendiente narrativo sin propietario o condición de salida.

---

#### 34. Requisitos de prueba derivados

**Resultado:** GENERA 8 REQUISITOS DE PRUEBA.

**Requisitos creados:** **8**
**Requisitos modificados:** **0**

- `TREQ-SHELL-091` — matriz de migración 32/32, identidad estable, asignación única por unidad y reconciliación de registry/finding sin faltantes ni duplicados;
- `TREQ-SHELL-092` — destino canónico por consumidor con cero direct legacy, role/bypass/caller-context/boolean authority y fail-closed después del cutover;
- `TREQ-SHELL-093` — orden de precondición/olas conforme a AUTH-CTX-027, dependencias físicas, cutover por grupo y prohibición de adelantar superficies sensibles;
- `TREQ-SHELL-094` — paridad legacy↔canónica reproducible, seis clasificaciones, oracle contractual y bloqueo/resolución de divergencias sin preservar bugs legacy;
- `TREQ-SHELL-095` — PULSO/ANIMA sin autorización cliente directa, proyecciones server-issued, `/client` puro y perfil nativo Expo/React Native para ANIMA;
- `TREQ-SHELL-096` — evidencia por repositorio/commit/manifest/lockfile/runtime/versiones, perfil de validación propio, compatibilidad, seguridad y lineage;
- `TREQ-SHELL-097` — convergencia de retiro de consumidores a cero direct/static/client/unregistered, telemetría cero con cobertura y handoff exacto a `AUTH-DB-030/031`;
- `TREQ-SHELL-098` — unicidad por implementation unit, rollback seguro antes del commit de migración, no resurrección de deuda histórica y RLS/RPC solo con evidencia física real.

No se modifica, difiere, descarta ni vuelve obsoleto ningún requisito histórico.

---

#### 35. Puerta de cierre del marcador global

El marcador global queda documentalmente cerrado cuando:

1. conserva AUTH004 como precedencia;
2. mantiene modalidad `PER_IMPLEMENTATION_UNIT`;
3. materializa decisiones para 32/32 identidades;
4. reconcilia 8 perfiles, 8 repositorios actuales y cobertura PASS/AURA/shared sin invención;
5. conserva la secuencia de olas de AUTH-CTX-027;
6. fija 1 precondición shared, 1 fila OLA3, 25 OLA4 y 5 OLA5;
7. define destino canónico por cada fila;
8. define estados de migración separados de registry/AUTH004;
9. define paridad y seis clasificaciones;
10. prohíbe doble side effect y fallback legacy después del cutover;
11. define perfil web y perfil ANIMA nativo;
12. define evidencia por consumidor y combinación;
13. define handoff de retiro sin usurpar AUTH-DB-030/031;
14. define rollback y punto de no retorno de la cuota AUTH004;
15. define snapshot reproducible;
16. define doce gates;
17. crea `TREQ-SHELL-091` a `TREQ-SHELL-098`;
18. mantiene 0 cambios físicos, 0 migraciones y 0 cambios Supabase en este marcador.

---

#### 36. Puerta de cierre de futura instancia

`SHELL-AUTH-005::<implementation_unit_id>` podrá quedar `PASS` únicamente cuando:

- la unidad y packages estén asignados por E5;
- toda fila asignada exista exactamente una vez y tenga owner/target/evidencia;
- las dependencias físicas aplicables estén disponibles;
- el orden de migración sea válido;
- cada fila use su frontera canónica;
- paridad y divergencias estén resueltas;
- PULSO/ANIMA aplicables no llamen autorización interna desde cliente;
- no exista role/bypass/caller context/booleano legacy como autoridad;
- side effects no se hayan duplicado;
- lint/análisis, typecheck equivalente, build/bundle y pruebas aplicables correspondan al mismo commit;
- AUTH004 esté en PASS y no exista nueva deuda;
- compatibilidad/lineage correspondan a la misma combinación;
- RLS/RPC aplicables tengan evidencia física propia;
- direct/static/client/unregistered legacy asignados sean 0;
- runtime telemetry sea 0 cuando la cobertura requerida esté demostrada;
- registry rows migradas puedan marcarse `COMPATIBLE` con evidencia;
- findings migrados hayan perdido cuota reutilizable;
- objetos legacy restantes estén entregados explícitamente a `AUTH-DB-030`;
- rollback haya sido ensayado antes del punto de no retorno;
- `TREQ-SHELL-091` a `TREQ-SHELL-098` tengan evidencia atribuible a la misma instancia.

---

#### 37. Criterios de aceptación

- [x] `SHELL-AUTH-004` es la precedencia inmediata aprobada;
- [x] `SHELL-CTX-001` permanece únicamente reservada;
- [x] se usa `PER_IMPLEMENTATION_UNIT`;
- [x] no se inventa `implementation_unit_id`;
- [x] se separa contrato global de ejecución física;
- [x] se conservan 32/32 identidades y 0 duplicados;
- [x] se materializa una decisión de migración por cada identidad;
- [x] se reconcilian las distribuciones heredadas;
- [x] PASS conserva 0 filas laborales por defecto;
- [x] AURA conserva 0 paths inventados;
- [x] se preserva AURA-AUTH-001 como puerta de primera adopción;
- [x] se preservan las olas AUTH-CTX-027;
- [x] SHELL queda primero entre consumidores transversales;
- [x] helpers/guards/contexto/presentación quedan en OLA 4;
- [x] Server Actions/Route Handlers quedan en OLA 5;
- [x] no se inventan RPC/RLS/jobs/Edge/Realtime baseline;
- [x] se definen estados de migración y punto de commit;
- [x] se distingue registry status de finding AUTH004;
- [x] se definen seis resultados de paridad;
- [x] no se exige conservar un bug legacy;
- [x] se prohíbe doble ejecución de side effects;
- [x] DENY/fallo canónico no hace fallback a ALLOW legacy;
- [x] PULSO y ANIMA migran a proyecciones seguras server-issued;
- [x] ANIMA recibe perfil nativo, no perfil Next inventado;
- [x] se exige evidencia por repo/commit/lockfile/runtime/versiones;
- [x] se define convergencia a cero y handoff a AUTH-DB-030/031;
- [x] se define rollback sin resurrección de deuda histórica;
- [x] se definen doce gates;
- [x] se crean exactamente ocho TREQ nuevos;
- [x] se declaran 0 cambios físicos y 0 cambios Supabase;
- [x] no se inicia ni desarrolla `SHELL-CTX-001`.

---

#### 38. Límites

Esta tarea no:

- modifica `packages/os-context`;
- instala packages en consumidores;
- cambia `package.json` o lockfiles;
- edita helpers, guards, páginas, Route Handlers, Server Actions o hooks;
- elimina el fallback por rol de ORIGO físicamente;
- elimina las RPC cliente de PULSO o ANIMA físicamente;
- crea o modifica pipelines CI;
- ejecuta el scanner AUTH004;
- declara paridad física por documentación;
- declara un consumer `COMPATIBLE` sin evidencia;
- crea filas sintéticas de PASS o AURA;
- implementa `get_access_context` o `evaluate_authorization`;
- migra RPC/RLS/objetos de Supabase;
- crea SQL, migraciones, RLS, triggers, Storage, Realtime o Edge Functions;
- ejecuta Supabase;
- retira funciones/RPC legacy del backend;
- ejecuta `AUTH-DB-030` ni `AUTH-DB-031`;
- ejecuta `SHELL-AUTH-005::<implementation_unit_id>`;
- avanza ni desarrolla la tarea siguiente.

### Módulos internos de contexto

---

#### 39. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-AUTH-004 — Implementar lint, métricas y gates contra consumidores legacy`

**TAREA ACTUAL APROBADA**
`SHELL-AUTH-005 — Migrar consumidores de autorización en todos los repositorios`

**SIGUIENTE TAREA RESERVADA**
`SHELL-CTX-001 — Consolidar el módulo de contexto dentro de @vento/os-context`

### ✅ SHELL-CTX-001 — Consolidar el módulo de contexto dentro de @vento/os-context

**Estado:** APROBADA
**Tarea anterior:** SHELL-AUTH-005 — Migrar consumidores de autorización en todos los repositorios
**Tarea siguiente:** SHELL-CTX-002 — Implementar consumo canónico de turno y check-in
**Tipo de tarea:** documental — definición global única del módulo contextual interno de `@vento/os-context`, su autoridad, composición, fronteras y eliminación contractual de responsabilidades contextuales competidoras, con futura materialización física `SHELL-CTX-001::<implementation_unit_id>` una sola vez por unidad de implementación
**Bloque:** BLOQUE H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md`
**Estado físico resultante:** `CONTRATO_GLOBAL_DEL_MODULO_CONTEXTUAL_OS_CONTEXT_ESPECIFICADO`; 1 módulo contextual canónico dentro del SDK existente; 0 packages nuevos; 0 subpaths públicos nuevos; 7 módulos contextuales locales competidores clasificados; 1 superficie compartida transitoria reconciliada; 0 unidades materializadas; 0 cambios Supabase
**Cambios físicos autorizados:** ninguno durante el marcador global
**Requisitos de prueba creados o modificados:** 0
**Modalidad:** `PER_IMPLEMENTATION_UNIT`
**Snapshot producido:** `SHELL-CTX-CONTEXT-MODULE-001`

---

#### 1. Propósito

`SHELL-CTX-001` consolida dentro de `@vento/os-context` una única responsabilidad runtime para consumir, validar, mantener inmutable y componer el contexto canónico de Vento OS, sin crear un segundo paquete, un segundo contrato `AccessContext`, un resolver empresarial alternativo ni una fuente local de autoridad por aplicación.

La arquitectura queda cerrada así:

```text
@vento/contracts/authorization
→ autoridad de tipos, códigos, schemas y validadores

BACKEND CANÓNICO / AUTH-DB-033
→ autoridad de hechos contextuales
→ produce AccessContext@1.0.0

@vento/os-context
→ único SDK runtime compartido
→ contiene un único módulo contextual interno
→ valida, conserva y compone el AccessContext recibido
→ no reconstruye hechos empresariales

APLICACIONES
→ consumen el SDK
→ no mantienen un contexto efectivo competidor
```

La consolidación de propiedad ocurre ahora como contrato. No elimina todavía archivos locales, no modifica `packages/os-context`, no implementa `get_access_context`, no migra consumidores y no ejecuta cambios en Supabase.

---

#### 2. Modalidad canónica y ciclo de materialización

La tarea usa `PER_IMPLEMENTATION_UNIT`.

```text
MARCADOR GLOBAL SHELL-CTX-001
→ define una sola vez identidad, autoridad, fronteras, invariantes, gates y evidencia
→ no materializa código

DELIV-PKG-025::<package_id>
→ asigna implementation_unit_id y package propietario

E5-GATE-008::<package_id> = PASS
→ habilita la unidad

SHELL-CTX-001::<implementation_unit_id>
→ materializa una sola vez el módulo contextual interno de la unidad
→ N package_id pueden consumirlo mediante lineage
→ no duplica el módulo por aplicación ni por package consumidor
```

**Dependencia para desarrollar:** `SHELL-AUTH-005`.

La futura instancia no inventará su `implementation_unit_id`: lo recibirá exclusivamente del ciclo `DELIV-PKG-025`/E5.

La posición física aprobada permite materializar el módulo interno antes del resolver autoritativo. Por tanto, la instancia `SHELL-CTX-001::<implementation_unit_id>` deberá poder cerrar su estructura, validación contractual, invariantes y pruebas con fixtures contractuales sin fingir integración live con `AUTH-DB-033`. La integración real con el productor backend se certificará en las tareas físicas propietarias posteriores.

---

#### 3. Fuentes vinculantes preservadas

| Fuente                    | Regla preservada                                                                                                                                         |
| ------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `AUTH-CTX-001`            | `AccessContext@1.0.0` es el contrato real de contexto y no se sustituye por un shape local.                                                              |
| `AUTH-CTX-003`            | `SimulationContext` permanece separado del contexto real.                                                                                                |
| `AUTH-CTX-015`            | readiness, problemas estructurales, fuentes y razones contextuales conservan sus catálogos y semántica.                                                  |
| `AUTH-CTX-025`            | `get_access_context(text) → jsonb` resuelve hechos; el caller no aporta actor, rol, territorio, turno, check-in o dispositivo efectivos.                 |
| `AUTH-CTX-027`            | existe un solo SDK `@vento/os-context`; aplicaciones no reconstruyen contexto; cliente recibe solo proyecciones seguras.                                 |
| `AUTH-CTX-028`            | la compatibilidad legacy proyecta desde canónico hacia legacy y nunca reconstruye `AccessContext` desde una fila legacy.                                 |
| `AUTH-CTX-029`            | L0 request-scoped pertenece a `SHELL-AUTH-003`; L1/frescura pertenece a `SHELL-CTX-006`; caché no es fuente de verdad.                                   |
| `SHELL-CON-007`           | tipos contextuales se centralizan en `@vento/contracts/authorization`; `EffectiveContext` no es canónico.                                                |
| `SHELL-CON-008`           | `StructuralIssueCode`, `LaneAvailabilityReasonCode` y `LaneReasonCode` son vocabularios cerrados; `blocked_reasons: string[]` es legacy.                 |
| `SHELL-AUTH-001`          | `@vento/os-context` es el único SDK runtime; conserva exactamente `/server`, `/client`, `/testing`, `/legacy`; no existe agregador runtime raíz estable. |
| `SHELL-AUTH-002`          | transporte server y proyecciones seguras son adapters; el módulo contextual no absorbe esa responsabilidad.                                              |
| `SHELL-AUTH-003`          | scope, correlación, L0 y write barrier request-scoped son propietarios de AUTH003.                                                                       |
| `SHELL-AUTH-004`          | nuevos consumos legacy y autoridad local quedan congelados.                                                                                              |
| `SHELL-AUTH-005`          | la eliminación física de consumidores locales y la migración multi-repositorio se ejecutan después, con paridad y rollback.                              |
| `task-work-topology.json` | una materialización máxima por `implementation_unit_id`.                                                                                                 |

No se reabre ninguna de estas decisiones.

---

#### 4. Modelo de autoridad en tres capas

La frase “fuente canónica de contexto” se separa en tres responsabilidades para evitar una nueva ambigüedad:

| Capa                | Autoridad                                        | Puede hacer                                                                                                | No puede hacer                                                                               |
| ------------------- | ------------------------------------------------ | ---------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| contrato            | `@vento/contracts/authorization`                 | definir shapes, versiones, códigos, schemas y validadores                                                  | consultar datos, decidir hechos o permisos                                                   |
| hechos contextuales | backend canónico / `AUTH-DB-033`                 | resolver principal, actor, identidad, empleo, rol, asignaciones, turno, check-in, territorio y dispositivo | delegar autoridad al caller o decidir permiso/recurso                                        |
| consumo runtime     | módulo contextual interno de `@vento/os-context` | validar, preservar, componer y entregar contexto a componentes internos del SDK                            | reconstruir hechos, crear fallbacks empresariales o convertirse en evaluador de autorización |

Por tanto:

```text
ÚNICO MÓDULO RUNTIME
≠ ÚNICO PRODUCTOR DE DATOS
```

```text
SDK CANÓNICO
≠ FUENTE EMPRESARIAL
```

```text
CONTRATO TIPADO
≠ RESOLVER
```

---

#### 5. Línea base física verificable

El estado físico actual de `@vento/os-context` es transitorio:

| Superficie                         | Estado observado                                                                        | Disposición contractual                                       |
| ---------------------------------- | --------------------------------------------------------------------------------------- | ------------------------------------------------------------- |
| `@vento/os-context@0.1.0`          | package privado, ESM, export raíz directo a source                                      | conservar identidad; no considerar estable                    |
| export `.`                         | reexporta `types` y `client`                                                            | no forma parte de la superficie runtime estable               |
| `EffectiveContext`                 | shape plano con strings abiertos, simulación, bypass, `can_operate` y `blocked_reasons` | `LEGACY_COMPATIBILITY`; no canónico                           |
| `ContextSimulationInput`           | input local mezclado con el package de contexto real                                    | compatibilidad; simulación permanece contrato separado        |
| `getEffectiveContext`              | llama `get_effective_context_v1` y hace cast                                            | legacy; no entrada del módulo canónico                        |
| `hasEffectivePermission`           | llama `has_effective_permission_v1` y retorna booleano                                  | legacy; autorización pertenece al evaluador/adapters          |
| README actual                      | prioriza dispositivo, simulación, ANIMA y bypass                                        | documentación transitoria; no autoridad normativa             |
| módulo contextual canónico interno | no materializado                                                                        | futuro resultado de `SHELL-CTX-001::<implementation_unit_id>` |

La presencia del package actual no demuestra que el módulo contextual canónico ya exista.

---

#### 6. Inventario de responsabilidades contextuales locales competidoras

La auditoría y el estado remoto verificable identifican exactamente siete módulos de aplicación que hoy contienen resolución o autoridad contextual local directa:

|    # | Repositorio                  | Superficie                            | Estado objetivo                                                                            |
| ---: | ---------------------------- | ------------------------------------- | ------------------------------------------------------------------------------------------ |
|    1 | `devVentoGroup/vento-viso`   | `src/lib/auth/operational-session.ts` | deja de resolver contexto efectivo localmente; consumidor del SDK                          |
|    2 | `devVentoGroup/vento-nexo`   | `src/lib/auth/operational-session.ts` | deja de resolver contexto efectivo localmente; consumidor del SDK                          |
|    3 | `devVentoGroup/vento-fogo`   | `src/lib/auth/operational-session.ts` | deja de resolver contexto efectivo localmente; consumidor del SDK                          |
|    4 | `devVentoGroup/vento-origo`  | `src/lib/auth/operational-session.ts` | deja de resolver contexto efectivo localmente; consumidor del SDK                          |
|    5 | `devVentoGroup/vento-pulso`  | `src/lib/auth/operational-session.ts` | deja de resolver contexto efectivo localmente; consumidor del SDK                          |
|    6 | `devVentoGroup/vento-numera` | `src/lib/auth/operational-session.ts` | deja de resolver contexto efectivo localmente; consumidor del SDK                          |
|    7 | `devVentoGroup/vento-nexo`   | `src/lib/auth/operational-context.ts` | deja de ser contexto operativo alternativo; consumidor/adaptación legacy durante migración |

Las seis copias de `operational-session.ts` observadas comparten el mismo contenido físico y actualmente pueden aceptar `preferredSiteId`, `preferredAreaId`, usar `navigationRole`, resolver dispositivo/empleado por consultas locales y ejecutar checks de permiso. NEXO agrega además un `operational-context.ts` que consume `get_operational_context`, aplica role override local, modifica área/rol y utiliza `can_operate`.

**Conciliación:** 7 módulos locales esperados, 7 clasificados, 0 sin disposición.

Esta tarea no los elimina físicamente. Su migración y retiro como consumidores pertenece a `SHELL-AUTH-005`; `SHELL-CTX-001` elimina su condición de autoridad válida en la arquitectura objetivo.

---

#### 7. Decisión principal de consolidación

Se define exactamente un módulo contextual interno dentro de la identidad existente:

```text
@vento/os-context
└─ MÓDULO CONTEXTUAL INTERNO CANÓNICO
```

No se crea:

```text
@vento/operational-context
@vento/context-core
@vento/access-context
@vento/runtime-context
```

ni otro package paralelo equivalente.

La tarea tampoco añade un quinto subpath público. La superficie pública estable sigue siendo exactamente:

```text
@vento/os-context/server
@vento/os-context/client
@vento/os-context/testing
@vento/os-context/legacy
```

El módulo contextual es una responsabilidad interna reutilizada por esas fronteras según su función, no un nuevo namespace público.

---

#### 8. Contrato de entrada del módulo

La entrada canónica runtime se compone conceptualmente de:

```text
app_code validado y fijado por la frontera propietaria
+
AccessContextV1 validado
```

No se crea un nuevo contrato serializado raíz para envolver ambos valores.

Reglas:

1. `app_code` permanece fuera de la raíz `AccessContext@1.0.0`;
2. `app_code` debe ser un `AppCode` canónico;
3. `AccessContextV1` debe superar el validador de `@vento/contracts/authorization`;
4. contract family, contract version y schema version deben ser compatibles;
5. el módulo no acepta un `EffectiveContext` como sustituto;
6. el módulo no acepta una fila `OperationalContextRow` como sustituto;
7. no acepta un objeto parcial completado con fallbacks locales;
8. no acepta un cast TypeScript como prueba de validez;
9. la asociación app/context no se reutiliza para otra aplicación;
10. una entrada inválida falla cerrada y no produce contexto parcial.

---

#### 9. Inmutabilidad del snapshot contextual

Una vez validado, el `AccessContextV1` se trata como snapshot inmutable.

El módulo no podrá:

- sustituir actor;
- sustituir empleado;
- cambiar rol base;
- cambiar rol operativo;
- completar sede o área;
- insertar un turno;
- insertar un check-in;
- cambiar dispositivo;
- eliminar un `StructuralIssue` para mejorar readiness;
- convertir una ausencia en fallback;
- mutar metadata de resolución para aparentar frescura.

Toda nueva realidad empresarial exige una nueva resolución o una operación propietaria de caché/frescura, nunca mutar el snapshot recibido.

---

#### 10. Separación entre contexto, decisión y simulación

El módulo contextual real no contiene ni produce autoridad de permiso.

Queda prohibido exponer desde su núcleo:

```text
hasPermission
canOperate
isAllowed
allow
bypassApplied
roleOverrideAsAuthority
```

como decisión empresarial.

La separación queda:

```text
AccessContextV1
→ hechos reales

AuthorizationDecisionV1
→ permiso + recurso + outcome

SimulationContextV1
→ hipótesis explícita separada
```

El módulo contextual real no mezcla un `SimulationContextV1` con `AccessContextV1` ni interpreta un role override como contexto real.

---

#### 11. Prohibición de reconstrucción local de hechos

El módulo no consulta ni combina por sí mismo tablas empresariales para reconstruir:

- principal;
- actor;
- identidad de dominio;
- empleado;
- rol base;
- asignaciones;
- cobertura;
- turno;
- check-in;
- rol operativo;
- sede operativa;
- área operativa;
- dispositivo.

Esos hechos proceden del productor autoritativo cuando exista físicamente.

También queda prohibido recuperar autoridad mediante:

```text
selected site
preferred site
primary site
employee default site
last used site
preferred area
navigation role
cookie role override
last actor
```

La presentación podrá conservar preferencias no autoritativas fuera del contexto canónico, pero nunca usarlas para completar `AccessContextV1`.

---

#### 12. Frontera con `SHELL-AUTH-001`

`SHELL-AUTH-001` continúa siendo propietario de:

- identidad del package;
- subpaths públicos;
- exports estables;
- versionado;
- dependencias;
- compatibilidad;
- transición `0.1.0 → 1.0.0`.

`SHELL-CTX-001` no modifica ese contrato. Define únicamente qué responsabilidad contextual vive dentro de la identidad ya aprobada.

Por tanto, una futura instancia CTX001 no podrá crear un package o subpath adicional para evitar las restricciones de AUTH001.

---

#### 13. Frontera con `SHELL-AUTH-002`

`SHELL-AUTH-002` mantiene la propiedad del transporte y las fronteras públicas:

```text
resolveAccessContext
evaluateAuthorization
requireAuthorization
getSafeContextProjection
getSafeDecisionProjection
parseSafeContextProjection
parseSafeDecisionProjection
```

El módulo CTX001:

- no invoca Supabase como adapter público;
- no define RPC transport;
- no traduce errores de red como contrato empresarial;
- no duplica `SafeContextProjectionV1`;
- recibe o entrega contexto a las capas internas autorizadas.

La separación permite materializar CTX001 antes que AUTH002 sin crear una dependencia circular.

---

#### 14. Frontera con `SHELL-AUTH-003`

`SHELL-AUTH-003` mantiene:

- `createAuthorizationScope`;
- lifetime request-scoped;
- L0 de contexto;
- L0 de decisiones;
- promise dedup;
- correlación;
- write barrier;
- registro de consumidores.

CTX001 no crea un singleton, `AsyncLocalStorage` global de autoridad, Map cross-request ni otro scope paralelo.

El módulo debe ser utilizable desde el scope sin poseer el lifetime del scope.

---

#### 15. Frontera con `SHELL-CTX-002`

`SHELL-CTX-002` queda exclusivamente reservada para el consumo canónico de:

- turno activo;
- check-in activo;
- relación entre ambos;
- disponibilidad asociada a esos nodos conforme al contrato.

CTX001 preserva los nodos de `AccessContextV1`, pero no implementa sus selectores especializados ni redefine sus reglas temporales.

---

#### 16. Frontera con `SHELL-CTX-003`

`SHELL-CTX-003` queda reservada para proyecciones seguras de:

- sede operativa efectiva;
- área operativa efectiva;
- relaciones seguras necesarias para presentación/consumo.

CTX001 prohíbe completar territorio desde el caller, pero no materializa todavía esas proyecciones.

---

#### 17. Frontera con `SHELL-CTX-004`

`SHELL-CTX-004` queda reservada para readiness contextual sin booleanos de autorización.

CTX001 conserva `lane_readiness` como parte del contrato recibido y prohíbe traducirlo a `ALLOW`, pero no implementa todavía reglas de lectura o proyección especializada de readiness.

En particular:

```text
READY
≠ ALLOW
```

permanece invariante obligatorio.

---

#### 18. Frontera con `SHELL-CTX-005`

`SHELL-CTX-005` queda reservada para razones seguras de bloqueo contextual.

CTX001 conserva los namespaces contractuales y rechaza strings libres como autoridad, pero no implementa todavía el mapping seguro hacia presentación.

`blocked_reasons: string[]` legacy no se promueve a `LaneReasonCode[]` por coincidencia textual.

---

#### 19. Frontera con `SHELL-CTX-006`

`SHELL-CTX-006` queda reservada para:

- L1 compartida;
- `ContextFreshnessToken@1.0.0`;
- TTL y límites temporales;
- single-flight cross-request;
- invalidación por eventos;
- modos `OFF`, `REQUEST_ONLY`, `SHADOW_SHARED`, `VALIDATED_SHARED`;
- rollback de caché.

CTX001 no conserva contexto entre solicitudes y no interpreta TTL como frescura.

La ausencia de CTX006 no autoriza una caché ad hoc dentro del módulo base.

---

#### 20. Frontera con `AUTH-DB-033`

`AUTH-DB-033` es el productor autoritativo físico de `AccessContext@1.0.0`.

La relación futura es:

```text
AUTH-DB-033
→ produce contexto autoritativo

SHELL-AUTH-002
→ transporta y valida la respuesta externa

MÓDULO CTX001
→ recibe el contexto ya sujeto al contrato
→ conserva semántica e invariantes
→ lo pone a disposición de las capacidades contextuales internas
```

CTX001 no adelanta SQL, schema, `SECURITY DEFINER`, grants, resolvers privados, fingerprints de fuentes ni proyección backend.

---

#### 21. Tratamiento de la superficie `EffectiveContext`

`EffectiveContext` queda clasificado exclusivamente como:

```text
LEGACY_COMPATIBILITY
```

No puede:

- ser alias de `AccessContextV1`;
- ser tipo base del módulo contextual;
- ser input de CTX002..006;
- conservar `bypass_applied` como autoridad;
- conservar `can_operate` como decisión;
- mezclar simulación y contexto real;
- convertir `metadata` genérica en sustituto de campos contractuales.

La futura compatibilidad, cuando exista, sigue la dirección:

```text
AccessContextV1 válido
→ proyección legacy controlada
```

Nunca:

```text
EffectiveContext
→ reconstruir AccessContextV1
```

---

#### 22. Tratamiento de los seis `operational-session.ts`

Los seis módulos locales observados quedan clasificados como:

```text
LEGACY_CONTEXT_AUTHORITY
```

Responsabilidades que deberán abandonar como autoridad durante la migración:

- resolver dispositivo compartido mediante consultas locales;
- resolver empleado mediante consultas locales;
- escoger sede por `preferredSiteId` o asignación primaria;
- aceptar `preferredAreaId` como área efectiva;
- usar `navigationRole` como rol operativo;
- decidir app access por código local;
- consultar permisos desde el mismo helper contextual;
- reducir errores a booleanos.

Después del cutover, podrán subsistir funciones de presentación no autoritativas solo si no reconstruyen contexto, rol, territorio o permisos y están separadas de la frontera de seguridad.

La migración física corresponde a `SHELL-AUTH-005`, no a este marcador.

---

#### 23. Tratamiento de NEXO `operational-context.ts`

La superficie NEXO queda clasificada como:

```text
LEGACY_PARALLEL_OPERATIONAL_CONTEXT
```

Quedan expresamente no canónicos:

- `OperationalContextRow` como contexto alternativo;
- `get_operational_context` como fuente final;
- `has_operational_permission` como evaluador final;
- `can_operate` como guard de acción;
- role override por cookie;
- reemplazo local de rol/área;
- `permissionCode.split(".")[0]` como fuente de aplicación;
- mensajes derivados de `blocked_reasons` libres como contrato.

La compatibilidad temporal seguirá `AUTH-CTX-028` y `/legacy`; la migración del consumidor sigue `SHELL-AUTH-005`.

---

#### 24. Tratamiento de datos de presentación

La consolidación no convierte todo dato actualmente presente en helpers locales en contexto canónico.

Pueden permanecer fuera del módulo, bajo propiedad de presentación o dominio, datos como:

- `displayName`;
- labels visuales de dispositivo;
- preferencias de filtro;
- selección de vista;
- texto de ayuda no contractual.

Regla:

```text
DATO DE PRESENTACIÓN
PUEDE SER LOCAL

HECHO QUE AFECTA AUTORIZACIÓN O READINESS
DEBE PROCEDER DEL CONTEXTO CANÓNICO
```

Esto evita trasladar innecesariamente estado de UI al SDK y, al mismo tiempo, impide que una preferencia local se convierta en autoridad.

---

#### 25. Manejo fail-closed

Una entrada externa o interna incompatible no se corrige silenciosamente.

| Condición                              | Resultado del módulo                                              |
| -------------------------------------- | ----------------------------------------------------------------- |
| contrato o schema no soportado         | rechazo contractual                                               |
| `AccessContextV1` inválido             | rechazo; no objeto parcial                                        |
| `app_code` inválido                    | rechazo                                                           |
| app/context incompatibles              | rechazo                                                           |
| `StructuralIssueCode` desconocido      | aplicar contrato de incompatibilidad estructural; no string libre |
| metadata estructural incompatible      | fail closed según contrato                                        |
| `LaneReasonCode` desconocido           | contexto no conforme                                              |
| `EffectiveContext` usado como canónico | rechazo de arquitectura                                           |
| fila legacy usada para reconstrucción  | rechazo de arquitectura                                           |
| error inesperado                       | fallo técnico seguro; nunca contexto permisivo                    |

No se define aquí el copy de UI ni la traducción de transporte; pertenecen a las tareas propietarias correspondientes.

---

#### 26. Ausencia de estado global mutable

El módulo contextual base será conceptualmente puro respecto del lifetime de la solicitud.

Quedan prohibidos:

- último contexto global;
- último actor global;
- última sede o área;
- último rol;
- singleton mutable compartido entre requests;
- cache keyed solo por `user_id`;
- fallback a una entrada anterior ante error;
- estado persistido en navegador como autoridad.

El lifetime y las capas de cache conservan sus propietarios explícitos AUTH003/CTX006.

---

#### 27. Snapshot contractual

Se define el snapshot documental:

```json
{"authorization_decision_owned_here":false,"canonical_context_contract":"AccessContext@1.0.0","canonical_contract_source":"@vento/contracts/authorization","competing_application_context_modules":7,"context_authority_model":"CONTRACTS_BACKEND_SDK","cross_request_cache_owned_here":false,"legacy_effective_context_is_canonical":false,"module_location":"@vento/os-context","new_package_count":0,"new_public_subpath_count":0,"physical_state":"NOT_IMPLEMENTED","request_scope_cache_owned_here":false,"schema":"vento.os-context-context-module@1","simulation_owned_here":false,"snapshot_id":"SHELL-CTX-CONTEXT-MODULE-001","transitional_shared_context_surface_count":1}
```

Huella normativa:

`sha256:cc1fb34b7b526847648e61d64b06a25d26f9fbf0c7406b236035ea3e299469ab`

La serialización normativa usa JSON UTF-8 en una sola línea, claves ordenadas lexicográficamente y booleanos/números JSON canónicos.

La misma identidad de snapshot no puede reutilizarse para otro package, otro `AccessContext`, un subpath público adicional o una autoridad distinta.

---

#### 28. Contrato de entrada de cada futura instancia

Toda `SHELL-CTX-001::<implementation_unit_id>` deberá registrar como mínimo:

| Campo                            | Obligación                                                                         |
| -------------------------------- | ---------------------------------------------------------------------------------- |
| `implementation_unit_id`         | unidad exacta asignada por `DELIV-PKG-025`                                         |
| `owner_package_id`               | package propietario con gate E5 aprobado                                           |
| `consumer_package_ids`           | consumidores vinculados mediante lineage                                           |
| baseline                         | commit anterior a la materialización                                               |
| result commit                    | commit exacto de resultado                                                         |
| SDK version                      | versión exacta de `@vento/os-context`                                              |
| contracts version                | versión exacta de `@vento/contracts`                                               |
| context contract                 | `AccessContext@1.0.0` y schema esperados                                           |
| module snapshot                  | `SHELL-CTX-CONTEXT-MODULE-001` o revisión aprobada                                 |
| public surface check             | evidencia de cero package/subpath público adicional                                |
| authority map                    | contratos → backend → módulo → consumidores                                        |
| competing surface reconciliation | estado de las siete autoridades locales y de la superficie transitoria del package |
| dependency graph                 | imports/runtime/dev efectivos del módulo                                           |
| tests                            | resultados atribuibles al mismo commit y versiones                                 |
| artifact digest                  | huella del artefacto materializado                                                 |
| rollback                         | combinación anterior soportada y ensayo                                            |
| blockers                         | lista cerrada con owner y condición de salida                                      |

Un campo obligatorio ausente deja la instancia `BLOCKED`.

---

#### 29. Unicidad y lineage

```text
1 implementation_unit_id
→ máximo 1 SHELL-CTX-001::<implementation_unit_id>
→ máximo 1 módulo contextual interno propietario
→ 0 packages contextuales paralelos
→ 0 subpaths públicos nuevos por esta tarea
→ N package_id consumidores mediante lineage
```

Los repositorios consumidores no copian el módulo para evitar una dependencia publicada.

Evidencia de otra unidad, versión, snapshot o commit se considera no atribuible y no certifica la instancia.

---

#### 30. Doce gates de futura materialización

| Gate                        | PASS                                                                                                | Bloqueo                                                           |
| --------------------------- | --------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| 1. `IDENTITY`               | unidad, owner package, versiones y commits inequívocos                                              | identidad incompleta o duplicada                                  |
| 2. `PACKAGE_BOUNDARY`       | módulo dentro de `@vento/os-context`; 0 package y 0 subpath público nuevo                           | núcleo paralelo o drift de exports                                |
| 3. `CONTRACT_AUTHORITY`     | tipos/códigos/schemas solo desde `@vento/contracts/authorization`                                   | shape, enum, catálogo o cast como autoridad local                 |
| 4. `CONTEXT_AUTHORITY`      | hechos externos al módulo y productor backend preservado                                            | resolver empresarial duplicado dentro del SDK                     |
| 5. `CANONICAL_INPUT`        | app fijada + `AccessContextV1` validado e inmutable                                                 | `EffectiveContext`, fila legacy, objeto parcial o fallback        |
| 6. `SEPARATION`             | contexto real separado de decisión y simulación                                                     | `can_operate`, bypass, role override o decisión dentro del núcleo |
| 7. `LOCAL_COMPETITORS`      | las siete superficies tienen disposición explícita y ninguna se presenta como autoridad objetivo    | helper local sin clasificación o nueva autoridad competidora      |
| 8. `RESPONSIBILITY_HANDOFF` | CTX002..006, AUTH002/003 y DB033 conservan fronteras exactas                                        | absorción silenciosa de otra tarea                                |
| 9. `FAIL_CLOSED`            | contrato/versiones/códigos inválidos se rechazan sin reconstrucción permisiva                       | coerción, fallback o contexto parcial                             |
| 10. `TEST_INTEGRATION`      | fixtures contractuales y composición interna demuestran invariantes sin fingir backend live         | test basado en legacy o evidencia de otra versión                 |
| 11. `LINEAGE_COMPATIBILITY` | consumidores de la unidad, snapshot, digest y compatibilidad atribuibles                            | evidencia stale/ajena o módulo duplicado                          |
| 12. `ROLLBACK`              | regreso reproducible a combinación soportada sin reinstalar autoridad local como arquitectura final | rollback reintroduce núcleo competidor o bypass                   |

Todos los gates aplicables deberán estar `PASS` para certificar una futura instancia.

---

#### 31. Perfil de pruebas concretado

El perfil previsto por la tarea queda materializado así:

| Perfil                | Cobertura mínima                                                                                                                                    |
| --------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| contrato contextual   | validación de `AccessContextV1`, versión/schema, catálogos, app binding, inmutabilidad y rechazo de `EffectiveContext`/fila legacy                  |
| unitaria              | ausencia de fallbacks, separación contexto-decisión-simulación, no mutación y fail-closed                                                           |
| integración           | composición interna con contratos y fixtures de `/testing`, sin dependencia de renderer y sin fingir `AUTH-DB-033` live antes de su materialización |
| frescura/invalidación | demostrar que CTX001 no mantiene L0/L1 propios, no conserva estado cross-request y respeta los handoffs a AUTH003/CTX006                            |
| seguridad             | caller no puede aportar actor/rol/sede/área/turno/check-in efectivos ni usar role override/bypass para modificar contexto                           |
| regresión             | impedir nuevos tipos/contextos paralelos, reintroducción de `can_operate`, strings libres o autoridad local dentro del núcleo                       |
| compatibilidad        | package, contracts version, snapshot, imports y consumidores de la unidad                                                                           |
| lineage               | unidad, package, commit, versiones, snapshot y digest                                                                                               |
| rollback              | restauración de combinación soportada sin convertir legacy en arquitectura final                                                                    |

La prueba de integración live con el resolver SQL no se declara `PASS` aquí antes de `AUTH-DB-033`; se ejecutará en las tareas físicas que posean esa frontera.

---

#### 32. Escenarios mínimos de futura instancia

Como mínimo se verificarán:

1. `AccessContextV1` válido + app compatible → aceptación sin mutación;
2. versión contractual desconocida → rechazo;
3. schema desconocido → rechazo;
4. objeto parcial → rechazo;
5. `EffectiveContext` legacy → no aceptado como contexto canónico;
6. `OperationalContextRow` → no aceptada como contexto canónico;
7. `blocked_reasons` libre → no promovido a `LaneReasonCode`;
8. `can_operate = true` legacy → no produce decisión;
9. role override → no modifica contexto real;
10. `preferredSiteId` → no completa sede efectiva;
11. `preferredAreaId` → no completa área efectiva;
12. `navigationRole` → no se transforma en rol operativo;
13. simulación → no se mezcla con contexto real;
14. mismo snapshot de entrada → salida/lecturas deterministas;
15. módulo no persiste último actor/contexto entre solicitudes;
16. fallo de validación → error seguro y cero contexto parcial;
17. imports del módulo → sin React/UI/renderer y sin catálogo contextual local;
18. exports públicos del package → sin quinto subpath introducido por CTX001;
19. dos packages consumidores de una misma unidad → un solo módulo materializado mediante lineage;
20. rollback → vuelve a combinación soportada sin activar autoridad legacy nueva.

---

#### 33. Evidencia requerida por futura instancia

| Clase                | Contenido mínimo                                                                          |
| -------------------- | ----------------------------------------------------------------------------------------- |
| `IDENTITY`           | implementation unit, owner package, consumers, baseline/result commit                     |
| `CONTRACTS`          | versiones exactas, schemas y validators consumidos                                        |
| `PACKAGE_BOUNDARY`   | package, exports y ausencia de nuevo núcleo/subpath                                       |
| `AUTHORITY_MAP`      | prueba de que contratos, productor y módulo conservan responsabilidades separadas         |
| `CANONICAL_INPUT`    | fixtures válidos/inválidos y rechazo de legacy                                            |
| `COMPETING_SURFACES` | reconciliación de las siete superficies locales y de la superficie transitoria compartida |
| `SEPARATION`         | ausencia de decisión, simulación, bypass y fallbacks dentro del módulo real               |
| `FAIL_CLOSED`        | pruebas negativas y errores seguros                                                       |
| `COMPATIBILITY`      | combinación package/contracts/consumer/runtime aplicable                                  |
| `ARTIFACT_INTEGRITY` | snapshot, versión, commit y digest                                                        |
| `ROLLBACK`           | combinación previa, procedimiento y ensayo                                                |
| `CERTIFICATION`      | doce gates y estado agregado                                                              |

No se utilizará una captura, build ajeno o evidencia de otro commit como sustituto.

---

#### 34. Reconciliación de responsabilidades y destinos

| Responsabilidad                                 | Propietario exacto                                      |
| ----------------------------------------------- | ------------------------------------------------------- |
| tipos, códigos, schemas y validación estática   | `@vento/contracts/authorization` / `SHELL-CON-007..008` |
| identidad/package/exports/versionado            | `SHELL-AUTH-001`                                        |
| módulo contextual interno único                 | `SHELL-CTX-001`                                         |
| transporte server/client y proyecciones seguras | `SHELL-AUTH-002`                                        |
| request scope, L0, correlación y write barrier  | `SHELL-AUTH-003`                                        |
| turno y check-in consumidos canónicamente       | `SHELL-CTX-002`                                         |
| sede/área seguras                               | `SHELL-CTX-003`                                         |
| readiness contextual                            | `SHELL-CTX-004`                                         |
| razones seguras contextuales                    | `SHELL-CTX-005`                                         |
| L1, single-flight cross-request y frescura      | `SHELL-CTX-006`                                         |
| resolver físico de contexto                     | `AUTH-DB-033`                                           |
| token transaccional de frescura                 | `AUTH-DB-035`                                           |
| evaluador de autorización                       | `AUTH-DB-034`                                           |
| freeze de autoridad/legacy nuevo                | `SHELL-AUTH-004`                                        |
| migración de consumidores locales               | `SHELL-AUTH-005`                                        |
| retiro de objetos/RPC legacy                    | `AUTH-DB-030`                                           |
| certificación final                             | `AUTH-DB-031`                                           |

No queda una responsabilidad detectada sin propietario documental.

---

#### 35. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Requisitos creados:** **0**
**Requisitos modificados:** **0**

**Justificación:** `SHELL-CTX-001` consolida como módulo runtime decisiones ya protegidas por requisitos vigentes y no introduce un nuevo shape serializado, código de razón, API pública, regla de autorización, caché o productor de hechos. Crear requisitos adicionales duplicaría coberturas ya existentes.

La futura materialización deberá aportar evidencia, según aplique, contra los requisitos vigentes siguientes sin modificarlos:

- `TREQ-SHELL-002` — responsabilidades compartidas y prohibición de copias divergentes;
- `TREQ-SHELL-043` — tipos contextuales canónicos y separación frente a shapes legacy;
- `TREQ-SHELL-044` — códigos contextuales cerrados y validación;
- `TREQ-SHELL-061` — SDK único, fronteras públicas y prohibición de núcleos paralelos;
- `TREQ-SHELL-062` — autoridad contractual y prohibición de shapes/casts paralelos;
- `TREQ-SHELL-063` — separación de fronteras, app fijada y fail-closed;
- `TREQ-SHELL-066` — unicidad por `implementation_unit_id`, lineage, evidencia y rollback;
- `TREQ-SHELL-076` y `TREQ-SHELL-078` — L0 request-scoped, aislamiento y write barrier sin apropiación por CTX001;
- `TREQ-SHELL-084` y `TREQ-SHELL-086` — freeze de APIs/contexto legacy y autoridad local;
- `TREQ-SHELL-092` — eliminación de autoridad local/legacy en consumidores después del cutover.

El Registro Canónico de Requisitos de Prueba permanece sin cambios.

---

#### 36. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                      |
| --------- | -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | El marcador es documental y no existe checkout completo actualizado en esta ejecución para correr el build global del plan.                                                                                    |
| LOCAL     | PASS           | Artefacto aislado verificado contra título, cabecera, una sola tarea, secciones obligatorias, continuidad, ausencia de instrucciones de entrega internas, snapshot determinista y referencias TREQ existentes. |
| REMOTA    | NOT_APPLICABLE | La tarea no autoriza escritura, despliegue ni modificación remota durante el marcador global.                                                                                                                  |
| OPERATIVA | NOT_APPLICABLE | No existe ejecución runtime, tráfico, consumidor migrado ni backend materializado por esta tarea documental.                                                                                                   |
| FÍSICA    | NOT_APPLICABLE | Se autorizan cero cambios de código, package, SQL, migraciones o Supabase en el marcador global.                                                                                                               |

---

#### 37. Puerta de cierre del marcador global

El marcador global queda documentalmente cerrado cuando:

1. `@vento/os-context` queda confirmado como única identidad runtime para el módulo contextual;
2. no se crea package ni subpath público adicional;
3. `@vento/contracts/authorization` conserva la autoridad contractual;
4. `AUTH-DB-033` conserva la autoridad sobre los hechos contextuales;
5. CTX001 se limita a validar, preservar y componer contexto;
6. `AccessContext@1.0.0` permanece sin cambios;
7. `EffectiveContext` y `OperationalContextRow` quedan fuera de la entrada canónica;
8. se clasifican 7/7 módulos contextuales locales competidores;
9. las seis copias de `operational-session.ts` pierden autoridad en el diseño objetivo;
10. NEXO `operational-context.ts` queda como legacy paralelo no canónico;
11. no se aceptan selected/preferred site/area, navigation role o role override como hechos efectivos;
12. contexto, autorización y simulación permanecen separados;
13. AUTH002, AUTH003 y CTX002..006 conservan sus fronteras;
14. no se crea L0 o L1 propio;
15. se define snapshot reproducible;
16. se definen contrato de futura instancia, unicidad, gates, pruebas, evidencia y rollback;
17. se justifican cero nuevos TREQ por cobertura existente;
18. se mantienen 0 cambios físicos y 0 cambios Supabase.

---

#### 38. Puerta de cierre de cada futura instancia

`SHELL-CTX-001::<implementation_unit_id>` podrá quedar `PASS` únicamente cuando:

- unidad y owner package estén habilitados por E5;
- el módulo exista una sola vez dentro de `@vento/os-context`;
- no exista package contextual paralelo;
- no se añada un subpath público no aprobado;
- contracts version/schema sean exactos y validados;
- no exista tipo `AccessContext` alternativo;
- no exista cast de legacy como contexto canónico;
- no exista resolución empresarial duplicada dentro del módulo;
- no existan fallbacks de actor/rol/site/area/turno/check-in;
- contexto real, simulación y decisión permanezcan separados;
- el módulo no mantenga estado autoritativo cross-request;
- las siete superficies locales estén reconciliadas con destino explícito sin presentarlas como objetivo;
- fixtures y pruebas contractuales/unitarias/integración/seguridad/regresión aplicables estén en PASS;
- integración live con backend no se declare ejecutada antes de su tarea física propietaria;
- snapshot, versiones, commits y digest coincidan;
- lineage sea único;
- rollback haya sido ensayado;
- la evidencia sea atribuible a la misma combinación.

---

#### 39. Criterios de aceptación

- [x] `SHELL-AUTH-005` se conserva como precedencia inmediata aprobada;
- [x] `SHELL-CTX-002` permanece únicamente reservada;
- [x] la tarea usa `PER_IMPLEMENTATION_UNIT`;
- [x] se separa contrato global de materialización física;
- [x] se conserva un único package `@vento/os-context`;
- [x] se crean cero packages contextuales paralelos;
- [x] se crean cero subpaths públicos adicionales;
- [x] se define un único módulo contextual interno;
- [x] se conserva `@vento/contracts/authorization` como autoridad de contrato;
- [x] se conserva `AUTH-DB-033` como productor autoritativo de hechos;
- [x] se conserva `AccessContext@1.0.0` sin cambios;
- [x] se prohíbe `EffectiveContext` como entrada canónica;
- [x] se prohíbe `OperationalContextRow` como entrada canónica;
- [x] se prohíben objetos parciales y casts como validación;
- [x] se preserva inmutabilidad del snapshot;
- [x] se separan contexto, decisión y simulación;
- [x] se prohíben `can_operate`, bypass y role override como autoridad del núcleo;
- [x] se prohíbe reconstruir hechos empresariales localmente;
- [x] se clasifican 7/7 módulos locales competidores;
- [x] las seis copias de `operational-session.ts` tienen disposición explícita;
- [x] NEXO `operational-context.ts` tiene disposición explícita;
- [x] se separan datos de presentación de hechos autoritativos;
- [x] AUTH002 conserva transporte/proyecciones;
- [x] AUTH003 conserva L0/scope/write barrier;
- [x] CTX002 conserva turno/check-in;
- [x] CTX003 conserva sede/área seguras;
- [x] CTX004 conserva readiness;
- [x] CTX005 conserva razones seguras;
- [x] CTX006 conserva L1/frescura;
- [x] se define fail-closed;
- [x] se define snapshot y huella determinista;
- [x] se definen doce gates;
- [x] se concreta el perfil de pruebas indicado por el iniciador;
- [x] se reutilizan requisitos TREQ vigentes y se crean cero duplicados;
- [x] se declaran 0 cambios físicos y 0 cambios Supabase;
- [x] no se desarrolla `SHELL-CTX-002`.

---

#### 40. Límites

Esta tarea no:

- modifica `packages/os-context`;
- crea archivos TypeScript;
- crea un package nuevo;
- crea un nuevo subpath público;
- publica `@vento/os-context`;
- modifica manifests o lockfiles;
- modifica los seis `operational-session.ts`;
- modifica NEXO `operational-context.ts`;
- migra consumidores;
- implementa `resolveAccessContext`;
- implementa `get_access_context`;
- implementa `evaluate_authorization`;
- implementa turno o check-in;
- implementa proyecciones de sede o área;
- implementa readiness;
- implementa razones seguras;
- implementa L0 o L1;
- implementa `ContextFreshnessToken`;
- mezcla simulación con contexto real;
- crea SQL, RPC, RLS, migraciones, triggers, Storage, Realtime o Edge Functions;
- ejecuta Supabase;
- declara integración live con backend;
- ejecuta `SHELL-CTX-001::<implementation_unit_id>`;
- avanza ni desarrolla la tarea siguiente.

---

#### 41. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-AUTH-005 — Migrar consumidores de autorización en todos los repositorios`

**TAREA ACTUAL APROBADA**
`SHELL-CTX-001 — Consolidar el módulo de contexto dentro de @vento/os-context`

**SIGUIENTE TAREA RESERVADA**
`SHELL-CTX-002 — Implementar consumo canónico de turno y check-in`


### ✅ SHELL-CTX-002 — Implementar consumo canónico de turno y check-in

**Estado:** APROBADA
**Tarea anterior:** SHELL-CTX-001 — Consolidar el módulo de contexto dentro de @vento/os-context
**Tarea siguiente:** SHELL-CTX-003 — Implementar proyecciones seguras de sede y área efectivas
**Tipo de tarea:** Documental — definición global única del consumo canónico de turno y check-in con materialización futura por unidad
**Bloque:** BLOQUE H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md`
**Estado físico resultante:** `DEFINIDO_NO_MATERIALIZADO`; 2 nodos canónicos consumidos; 0 contratos serializados nuevos; 0 packages nuevos; 0 subpaths públicos nuevos; 0 unidades materializadas; 0 cambios Supabase
**Cambios físicos autorizados:** ninguno durante el marcador global
**Requisitos de prueba creados o modificados:** 0
**Modalidad:** `PER_IMPLEMENTATION_UNIT`
**Trabajo canónico actual:** definir una sola vez el contrato de consumo de turno y check-in y asignar su futura materialización
**Instancia física futura:** `SHELL-CTX-002::<implementation_unit_id>`
**Condición de materialización:** después de que `DELIV-PKG-025` asigne `implementation_unit_id` y el `package_id` propietario supere `E5-GATE-008`

---

#### 1. Propósito

`SHELL-CTX-002` define el contrato único mediante el cual el módulo contextual interno de `@vento/os-context` deberá consumir los nodos canónicos `active_shift` y `active_checkin_session` de `AccessContext@1.0.0`, preservando su relación temporal, laboral y territorial sin volver a resolver hechos empresariales y sin convertir turno o check-in en permiso.

La tarea concreta el resultado que `SHELL-CTX-001` dejó reservado exclusivamente para esta responsabilidad:

```text
AccessContextV1 validado
→ active_shift
→ active_checkin_session
→ consumo contextual coherente
```

Nunca:

```text
turno o check-in local
→ reconstruir AccessContextV1
```

Ni:

```text
turno/check-in válidos
→ ALLOW
```

El marcador global es documental. La implementación física se realizará únicamente en la futura instancia `SHELL-CTX-002::<implementation_unit_id>` cuando exista unidad autorizada por E5.

---

#### 2. Resultado canónico

Se fija una única semántica compartida para consumir turno y check-in dentro de `@vento/os-context`:

1. el SDK recibe un `AccessContextV1` ya validado;
2. el turno consumido es exclusivamente `active_shift`;
3. el check-in consumido es exclusivamente `active_checkin_session`;
4. el check-in se interpreta únicamente después del turno;
5. ambos nodos se preservan sin mutación;
6. ausencia normal y contradicción estructural permanecen diferenciadas;
7. `structural_issues` y `lane_readiness` se respetan como parte del snapshot recibido, sin reemitir causas equivalentes;
8. no se consulta una fuente local para completar campos ausentes;
9. no se crea un contrato serializado alternativo para turno/check-in;
10. no se crea package, subpath público ni autoridad paralela;
11. no se decide permiso, recurso ni resultado de autorización;
12. la futura materialización se ejecutará como máximo una vez por `implementation_unit_id`.

---

#### 3. Fuentes y precedencia

La semántica de esta tarea conserva, sin reinterpretar, las decisiones aprobadas en:

| Fuente                    | Responsabilidad vinculante                                                              |
| ------------------------- | --------------------------------------------------------------------------------------- |
| `SHELL-CTX-001`           | un único módulo contextual interno; `AccessContextV1` como entrada validada e inmutable |
| `SHELL-CON-007`           | forma canónica de `AccessContext@1.0.0`, `ActiveShiftContext` y `ActiveCheckinContext`  |
| `SHELL-CON-008`           | namespaces cerrados de problemas estructurales y razones de disponibilidad              |
| `AUTH-CTX-010`            | turno publicado, vigente, determinista y fail-closed                                    |
| `AUTH-CTX-011`            | sesión de check-in confirmada, activa y vinculada al turno exacto                       |
| `AUTH-CTX-015`            | `lane_readiness`, causas estructurales y separación entre ausencia e invalidez          |
| `AUTH-CTX-025`            | productor backend futuro de `AccessContext@1.0.0`                                       |
| `AUTH-CTX-027`            | consumo centralizado por aplicaciones y eliminación de reconstrucción local             |
| `AUTH-CTX-028`            | compatibilidad temporal canónico → legacy                                               |
| `AUTH-CTX-029`            | frescura, write barrier, límites temporales e invalidación                              |
| `AUTH-CTX-030`            | plan contractual de pruebas, paridad, seguridad y rollback                              |
| `task-work-topology.json` | `PER_IMPLEMENTATION_UNIT`, unicidad y condición E5 de materialización                   |

Precedencia obligatoria:

```text
contratos compartidos
→ productor autoritativo de AccessContext
→ AccessContextV1 validado
→ consumo contextual de turno/check-in
→ proyecciones/readiness/razones posteriores
→ adapters y consumidores
```

---

#### 4. Línea base técnica verificable

El estado actual todavía no representa el resultado objetivo:

| Superficie                            | Estado actual                         | Disposición                                                                         |
| ------------------------------------- | ------------------------------------- | ----------------------------------------------------------------------------------- |
| `@vento/os-context@0.1.0`             | package parcial y transitorio         | conservar como baseline legacy hasta materialización autorizada                     |
| `EffectiveContext.shift_id`           | campo plano legacy                    | no es `ActiveShiftContext`                                                          |
| `EffectiveContext.can_operate`        | booleano legacy                       | no es autorización ni readiness canónico                                            |
| `get_effective_context_v1`            | RPC legacy consumida directamente     | aislar en compatibilidad; no usar como fuente final                                 |
| `get_operational_context`             | fachada legacy plana                  | únicamente proyección temporal en dirección canónico → legacy                       |
| ANIMA `useAttendance`                 | lógica operativa propia de asistencia | continúa como productor/UX de dominio; no se convierte en resolver del SDK          |
| consulta ANIMA por `shift_date = hoy` | implementación actual localizada      | no define la semántica canónica de turno vigente, especialmente en turnos nocturnos |
| cola offline de ANIMA                 | estado cliente pendiente              | nunca satisface check-in activo antes de confirmación de servidor                   |

La tarea no corrige físicamente estas superficies; define el contrato que deberá reemplazar su autoridad contextual en la instancia futura y en las migraciones propietarias ya existentes.

---

#### 5. Frontera de propiedad

La propiedad queda separada así:

```text
@vento/contracts/authorization
→ forma, códigos, schemas y validadores contractuales

AUTH-DB-033
→ resolución autoritativa de turno, check-in y demás hechos de AccessContext

@vento/os-context
→ valida el contrato recibido
→ consume sus nodos
→ preserva invariantes
→ no vuelve a resolver hechos

SHELL-CTX-002
→ contrato especializado de consumo de active_shift + active_checkin_session
```

Queda fuera de `SHELL-CTX-002`:

- persistir turnos;
- publicar turnos;
- registrar check-in o check-out;
- emparejar eventos físicos de asistencia;
- consultar tablas para fabricar contexto;
- seleccionar turno por heurística;
- resolver sede o área seguras para cliente;
- calcular el `AuthorizationDecision`;
- implementar caché L1.

---

#### 6. Entrada única del consumo

La entrada conceptual es exclusivamente un `AccessContextV1` válido y completo conforme a la familia:

```text
vento.authorization.response-contracts@1.0.0
AccessContext@1.0.0
schema_version = 1.0.0
```

Antes de utilizar turno o check-in deberán cumplirse simultáneamente:

1. contrato reconocido;
2. versión reconocida;
3. schema reconocido;
4. `AccessContextV1` validado;
5. catálogos y códigos tipados compatibles;
6. snapshot completo, no objeto parcial;
7. ausencia de coerción desde `EffectiveContext`, `OperationalContextRow` u otra forma legacy.

Una entrada inválida se rechaza en la frontera contractual. No se intenta reparar dentro del módulo contextual.

---

#### 7. Nodo de turno consumido

La forma consumida permanece exactamente:

```text
ActiveShiftContext
- shift_id
- employee_id
- site_id
- area_id nullable
- operational_role_code
- starts_at
- ends_at
- shift_status
- published
- currently_valid
```

`SHELL-CTX-002` no agrega campos, no elimina campos y no crea una variante local.

Para un nodo no nulo se conserva el invariante:

```text
active_shift != null
→ published = true
→ currently_valid = true
```

---

#### 8. Nodo de check-in consumido

La forma consumida permanece exactamente:

```text
ActiveCheckinContext
- checkin_session_id
- employee_id
- shift_id
- site_id
- area_id nullable
- checked_in_at
- expires_at nullable
- checked_out_at nullable
- status = ACTIVE | EXPIRED | CLOSED | INVALID
```

En el `AccessContextV1` real utilizado para autorización:

```text
active_checkin_session != null
→ status = ACTIVE
→ checked_out_at = null
→ active_shift != null
```

Una sesión `CLOSED`, `EXPIRED` o `INVALID` no se expone como sesión activa.

---

#### 9. Orden obligatorio de consumo

La secuencia queda cerrada así:

```text
1. validar AccessContextV1
2. leer active_shift
3. conservar su nulabilidad e invariantes
4. leer active_checkin_session
5. verificar que su existencia sea compatible con active_shift
6. preservar structural_issues y lane_readiness del snapshot
7. entregar los hechos a las responsabilidades posteriores
```

Queda prohibido invertir la dependencia:

```text
check-in
→ elegir turno
```

El check-in solo puede confirmar coherencia con un turno ya resuelto por la fuente autoritativa.

---

#### 10. Semántica temporal del turno

`SHELL-CTX-002` conserva la ventana canónica:

```text
starts_at <= resolved_at < ends_at
```

Consecuencias:

- el turno empieza exactamente en `starts_at`;
- deja de ser vigente exactamente en `ends_at`;
- no existen minutos de gracia implícitos;
- dos turnos consecutivos pueden tocarse en el límite sin solaparse;
- el estado físico `scheduled` no prolonga un turno terminado;
- la vigencia no depende de un job, check-out o estado UI.

El SDK no recalcula esta ventana desde horas locales ni usa el reloj del cliente para redefinir el resultado recibido.

---

#### 11. Turnos nocturnos

La semántica canónica admite turnos que cruzan medianoche mediante timestamps absolutos.

Por tanto queda prohibido tratar como regla contractual:

```text
shift_date = fecha local actual
```

Un turno iniciado el día anterior puede continuar vigente después de medianoche.

El consumo de `active_shift` utiliza el resultado autoritativo ya resuelto; no reconsulta `employee_shifts` para reconstruir el candidato por fecha.

---

#### 12. Publicación y revisión del turno

El turno consumido debe representar una única revisión publicada autoritativa.

El módulo no podrá:

- mezclar campos de revisiones distintas;
- preferir un borrador más reciente;
- seleccionar por `published_at` aislado cuando exista ambigüedad;
- escoger la primera o última fila;
- usar confirmación del trabajador como desempate;
- completar campos desde otra revisión.

Si el productor reporta una contradicción estructural de turno, el SDK preserva la invalidez y no crea un turno alternativo.

---

#### 13. Cardinalidad del turno

La semántica heredada es:

```text
0 candidatos autoritativos vigentes
→ active_shift = null

1 candidato autoritativo vigente
→ active_shift = nodo válido

2 o más candidatos vigentes
→ active_shift = null
→ SHIFT_OVERLAP
```

`SHELL-CTX-002` no implementa desempates locales.

---

#### 14. Ausencia normal de turno

La ausencia de turno puede ser un estado válido y esperado.

Ejemplos:

- actor laboral fuera de jornada;
- turno futuro;
- jornada ya terminada;
- actor no laboral;
- dispositivo sin actor humano.

En ausencia normal:

```text
active_shift = null
```

sin inventar `StructuralIssue` por la sola ausencia.

La clasificación exacta de readiness permanece en `SHELL-CTX-004` y en el contrato de `LaneReadiness`; `SHELL-CTX-002` únicamente preserva el hecho.

---

#### 15. Invalidez estructural del turno

Los códigos de turno ya congelados por `AUTH-CTX-015` permanecen como única taxonomía estructural aplicable:

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

`SHELL-CTX-002` no inventa códigos nuevos ni reemite el mismo problema con otra fuente. Consume el resultado estructural producido por el backend canónico.

---

#### 16. Semántica de sesión activa

Un `active_checkin_session` no nulo exige simultáneamente:

- evento confirmado por servidor;
- actor laboral correcto;
- empleado activo;
- `active_shift` existente;
- mismo `employee_id`;
- mismo `shift_id`;
- misma sede operativa;
- área compatible cuando esté presente;
- sesión abierta;
- no expirada;
- no reemplazada;
- sin evento terminal aplicable;
- candidato único;
- `status = ACTIVE`;
- `checked_out_at = null`.

Ninguna solicitud o estado cliente satisface estas condiciones por sí sola.

---

#### 17. Coincidencia obligatoria turno ↔ check-in

La relación mínima queda:

```text
active_checkin_session.employee_id
=
active_shift.employee_id
=
employee.employee_id
=
actor_effective.actor_id
```

Y:

```text
active_checkin_session.shift_id
=
active_shift.shift_id
```

Y:

```text
active_checkin_session.site_id
=
active_shift.site_id
```

Cuando ambos nodos contienen `area_id`, la sesión no puede introducir un área distinta de la declarada por el turno.

Un mismatch no se corrige localmente.

---

#### 18. Check-in no crea turno ni territorio

Queda prohibido utilizar un check-in para:

- crear `active_shift`;
- elegir entre turnos solapados;
- prolongar un turno terminado;
- recuperar un turno cancelado;
- completar un rol operativo faltante;
- crear sede operativa;
- crear área operativa;
- convertir el punto físico de marcación en sede laboral;
- fabricar cobertura administrativa.

El punto físico de marcación y la geocerca son evidencia del dominio de asistencia; no sustituyen `site_id` del turno.

---

#### 19. Check-in temprano

Una marcación confirmada antes del inicio del turno puede existir en el dominio de asistencia.

Sin embargo:

```text
resolved_at < active_shift.starts_at
→ active_shift = null
→ active_checkin_session = null
```

Al comenzar el turno, una sesión todavía válida podrá aparecer en una nueva resolución autoritativa.

El SDK no anticipa esa transición ni habilita permisos antes del nuevo snapshot.

---

#### 20. Expiración y fin efectivo del check-in

La sesión activa nunca puede sobrevivir al turno.

Su límite efectivo es el primero aplicable entre:

- `expires_at`, cuando exista;
- `active_shift.ends_at`;
- check-out confirmado;
- cierre administrativo autoritativo;
- cancelación o retiro del turno;
- reemplazo o invalidación de la sesión.

Por tanto:

```text
fin del turno sin check-out
→ active_shift = null
→ active_checkin_session = null
```

La ausencia de check-out no genera vigencia indefinida.

---

#### 21. Sesiones cerradas, expiradas e inválidas

Una sesión correctamente cerrada o expirada produce ausencia normal de sesión activa.

Solo existe contradicción estructural cuando una sesión no activa se presenta como activa.

`SHELL-CTX-002` conserva esta diferencia y no transforma:

```text
CLOSED / EXPIRED
```

en un `ACTIVE` de conveniencia.

---

#### 22. Cardinalidad del check-in

La semántica heredada es:

```text
0 sesiones activas candidatas
→ active_checkin_session = null

1 sesión activa válida
→ active_checkin_session = nodo válido

2 o más sesiones activas candidatas
→ active_checkin_session = null
→ CHECKIN_SESSION_AMBIGUOUS
```

Queda prohibido seleccionar por recencia, orden de fila, dispositivo, GPS o completitud aparente.

---

#### 23. Invalidez estructural del check-in

Los códigos de check-in ya congelados por `AUTH-CTX-015` permanecen como única taxonomía estructural aplicable:

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

El SDK no agrega códigos locales ni traduce estas causas a booleanos de autorización.

---

#### 24. Ausencia de check-in y prerrequisitos

La ausencia de check-in no es una denegación universal.

Semántica contractual preservada:

```text
N
→ no exige turno ni check-in

T
→ exige active_shift
→ no exige active_checkin_session

T+C
→ exige active_shift
→ exige active_checkin_session
```

`SHELL-CTX-002` expone hechos contextuales suficientes para que el evaluador aplique el requisito correcto, pero no conoce ni decide por sí solo el permiso solicitado.

---

#### 25. Separación frente a `lane_readiness`

`SHELL-CTX-002` no implementa la política final de readiness reservada a `SHELL-CTX-004`.

Conserva únicamente estas distinciones contractuales:

- falta normal de turno puede producir disponibilidad negativa sin invalidez;
- falta normal de check-in puede coexistir con núcleo operativo válido;
- una contradicción `SHIFT_*` o `CHECKIN_*` bloqueante no se degrada a ausencia normal;
- `READY + NO_ACTIVE_CHECKIN` puede permitir evaluar permisos `T`, pero nunca satisface `T+C`.

No se crea un nuevo `can_operate`.

---

#### 26. Independencia del carril base

Turno y check-in pertenecen al carril operativo.

Por tanto:

- ausencia de turno no invalida automáticamente el carril base;
- check-out no revoca automáticamente permisos base;
- cierre del check-in no cambia `administrative_coverage`;
- turno no agrega sedes administrativas;
- turno no cambia `base_role`;
- una inconsistencia `BLOCKING_OPERATIONAL` no se promueve a `BLOCKING_ALL` localmente.

La precedencia final pertenece al evaluador canónico.

---

#### 27. Dispositivo compartido

En un dispositivo compartido:

```text
principal = SHARED_DEVICE
actor efectivo = empleado de actor_session válida
```

Turno y check-in pertenecen al empleado actor.

El dispositivo:

- no posee turno propio;
- no posee check-in laboral propio;
- no presta el turno del último actor;
- no utiliza `navigation_role` para completar el turno;
- no utiliza su sede para corregir la sede laboral;
- no convierte la sesión de actor en check-in.

Un cambio de actor exige un nuevo snapshot.

---

#### 28. Simulación

`SimulationContext` permanece separado del contexto real.

Queda prohibido:

- sustituir `active_shift` real con un turno hipotético;
- sustituir `active_checkin_session` real con un check-in simulado;
- usar role override como turno;
- transformar un `WOULD_ALLOW` en autoridad;
- persistir una selección simulada dentro del `AccessContextV1` real.

La simulación utiliza su propia frontera contractual y no entra al consumo real de CTX002.

---

#### 29. Cola offline y estados pendientes

Una marcación offline pendiente:

```text
no confirmada
→ no active_checkin_session
```

Aunque la UI de ANIMA pueda conservarla para reconciliación, no puede convertirse en autoridad del SDK.

Después de sincronizar, el backend deberá validar actor, turno, sede, política, temporalidad e idempotencia antes de que una nueva resolución pueda contener la sesión.

Una corrección posterior no crea autorización retroactiva para acciones ya ejecutadas.

---

#### 30. Prohibición de reconstrucción local

La futura implementación de `SHELL-CTX-002` no podrá consultar por su cuenta:

- `employee_shifts`;
- `attendance_logs`;
- sesiones abiertas;
- sedes seleccionadas;
- áreas seleccionadas;
- perfiles operativos predeterminados;
- cookies de role override;
- GPS o geocercas;
- últimos eventos de asistencia;
- `get_operational_context`;
- `get_effective_context_v1`;

para completar un `AccessContextV1` ya recibido.

Las consultas del dominio ANIMA continúan siendo responsabilidad de la operación de asistencia hasta su convergencia física; no se copian dentro del SDK.

---

#### 31. Compatibilidad legacy

La única dirección permitida de compatibilidad es:

```text
AccessContextV1 canónico
→ proyección legacy controlada
```

Nunca:

```text
OperationalContextRow / EffectiveContext / attendance state
→ reconstruir AccessContextV1
```

Durante transición, la proyección legacy podrá conservar campos como:

- `active_shift_id`;
- `active_checkin_id`;
- `on_shift_now`;
- `checked_in_now`;

únicamente como derivados del contexto canónico cuando `AUTH-DB-033` exista y la compatibilidad correspondiente esté habilitada.

Estos campos no se convierten en autoridad nueva.

---

#### 32. Frescura e invalidación

Turno y check-in son hechos temporales y mutables; un snapshot previamente válido puede quedar obsoleto.

Cambios relevantes incluyen:

- publicación, revisión, cancelación o retiro de turno;
- inicio o fin del turno;
- cambio de empleado, sede, área o rol del turno;
- confirmación de check-in;
- confirmación de check-out;
- expiración o auto-checkout;
- reemplazo o corrección de sesión;
- cambio de actor de dispositivo;
- corrección de duplicados.

`SHELL-CTX-002` no implementa una caché propia.

La coordinación futura será:

```text
SHELL-AUTH-003
→ L0 + write barrier

AUTH-DB-035
→ generaciones + token transaccional de frescura

SHELL-CTX-006
→ L1 validada + límites temporales + single-flight cross-request
```

Un contexto anterior a una barrera o límite temporal no puede reutilizarse para autoridad posterior.

---

#### 33. Integración futura con el backend canónico

La instancia física de CTX002 solo podrá declarar integración live cuando exista el productor autorizado de `AccessContext@1.0.0`.

La frontera es:

```text
AUTH-DB-033
→ resuelve active_shift
→ resuelve active_checkin_session
→ produce structural_issues y lane_readiness
→ serializa AccessContextV1

@vento/os-context
→ valida
→ consume
→ no re-resuelve
```

Antes de `AUTH-DB-033`, la materialización del módulo podrá probarse con fixtures contractuales versionados sin declarar integración real inexistente.

---

#### 34. Perfil de pruebas de la futura instancia

La futura instancia deberá cubrir como mínimo:

##### Turno

1. turno publicado y vigente;
2. turno futuro;
3. turno terminado;
4. borrador no publicado;
5. turno nocturno que cruza medianoche;
6. turno cancelado;
7. turno de otro empleado;
8. área de otra sede;
9. turno sin rol operativo;
10. dos turnos solapados;
11. turnos consecutivos en el mismo límite temporal;
12. revisión publicada frente a borrador posterior.

##### Check-in

13. sesión confirmada y activa;
14. ausencia normal de check-in;
15. check-in temprano antes del turno;
16. sesión de otro actor;
17. sesión de otro turno;
18. mismatch de sede;
19. mismatch de área;
20. sesión cerrada;
21. sesión expirada;
22. fin de turno sin check-out;
23. dos sesiones abiertas;
24. reintento idempotente;
25. evento offline pendiente;
26. evento terminal vinculado a otra sesión.

##### Integración y seguridad

27. `N`, `T` y `T+C` preservan sus prerrequisitos sin producir decisión local;
28. el carril base no cambia por ausencia/cierre de turno o check-in;
29. dispositivo compartido utiliza turno/check-in del actor humano exacto;
30. cambio de actor invalida el snapshot anterior;
31. simulación no contamina contexto real;
32. legacy no se usa para reconstruir contexto;
33. `SHIFT_*` y `CHECKIN_*` desconocidos o incompatibles fallan por validación contractual;
34. write barrier obliga nueva resolución después de mutación relevante;
35. límites temporales impiden reutilizar contexto después de turno/check-in;
36. paridad legacy clasifica diferencias sin conservar un bug por igualdad artificial;
37. rollback restaura una combinación soportada sin reactivar bypasses ni autoridad local.

Cada resultado físico deberá ser atribuible a la misma unidad, commit, versiones de contratos, versión del SDK y backend aplicable.

---

#### 35. Gates de materialización por unidad

`SHELL-CTX-002::<implementation_unit_id>` deberá superar doce gates:

| Gate                      | Condición                                                                                                    |
| ------------------------- | ------------------------------------------------------------------------------------------------------------ |
| 1. `IDENTITY`             | `implementation_unit_id` asignado y owner `package_id` con `E5-GATE-008 = PASS`                              |
| 2. `LINEAGE`              | lineage único; ninguna segunda implementación física para la misma unidad                                    |
| 3. `CONTRACT_INPUT`       | `AccessContext@1.0.0` y schema exactos, validados antes del consumo                                          |
| 4. `SHIFT_CONSUMPTION`    | `active_shift` consume exclusivamente el nodo canónico, sin consulta/fallback local                          |
| 5. `CHECKIN_CONSUMPTION`  | `active_checkin_session` consume exclusivamente la sesión canónica activa                                    |
| 6. `RELATIONAL_INTEGRITY` | relación actor/empleado/shift/site/area preservada y fail-closed ante mismatch                               |
| 7. `TEMPORAL_BOUNDARIES`  | fronteras de tiempo, turno nocturno, finalización y expiración cubiertas                                     |
| 8. `STRUCTURAL_CODES`     | códigos `SHIFT_*` y `CHECKIN_*` preservados sin códigos locales ni cascadas duplicadas                       |
| 9. `SEPARATION`           | ausencia normal separada de invalidez; sin `can_operate` ni decisión local                                   |
| 10. `FRESHNESS_HANDOFF`   | write barrier, frescura y límites temporales integrados con sus tareas propietarias cuando estén disponibles |
| 11. `COMPATIBILITY`       | compatibilidad, consumidores y paridad aplicables probados sobre la misma combinación                        |
| 12. `ROLLBACK`            | rollback reproducible y evidencia atribuible a la misma unidad/versiones/commits                             |

Un gate faltante, no ejecutado cuando sea aplicable, con evidencia stale o perteneciente a otra unidad bloquea la certificación física.

---

#### 36. Rollback

El rollback de una futura instancia podrá volver a una combinación anterior de `@vento/os-context` únicamente cuando esa combinación:

- continúe soportada;
- sea compatible con los contratos vigentes;
- tenga evidencia reproducible;
- no reactive bypass por rol;
- no reactive `can_operate` como autoridad;
- no transforme check-in o turno local en fuente canónica;
- no mezcle contexto real con simulación;
- no rompa la trazabilidad de la unidad.

Cuando exista L1, el rollback normal de caché es hacia `REQUEST_ONLY`; no se sirve un snapshot stale para preservar disponibilidad.

Rollback no equivale a restaurar deuda ya retirada como arquitectura final.

---

#### 37. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** **0**
**Requisitos modificados:** **0**

Justificación:

- `TREQ-AUTH-008` ya asigna explícitamente a `SHELL-CTX-002..004` la protección de turno vigente, check-in activo, rol operativo, territorio compatible y paridad transversal;
- `TREQ-SHELL-043` protege la forma de `AccessContext@1.0.0` y la separación frente a `EffectiveContext`, simulación y decisión;
- `TREQ-SHELL-044` protege los códigos estructurales y razones de disponibilidad cerrados;
- `TREQ-SHELL-062` prohíbe promover legacy, strings abiertos, casts, `bypass_applied` o `can_operate` a autoridad contractual;
- `TREQ-SHELL-078` protege la write barrier después de cambios relevantes;
- `TREQ-SHELL-092` exige que los consumidores migrados terminen sin turno/check-in del caller ni fallback legacy como hechos efectivos.

El comportamiento introducido por CTX002 queda completamente cubierto por estos requisitos vigentes. Crear `TREQ-SHELL-099` repetiría reglas ya identificadas y no añadiría un comportamiento verificable distinto.

El Registro Canónico de Requisitos de Prueba permanece sin cambios.

---

#### 38. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                      |
| --------- | -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | El marcador global no modifica código ni packages; build corresponde a la futura instancia física.                                                             |
| LOCAL     | PASS           | La definición reconcilia `SHELL-CTX-001`, `AUTH-CTX-010`, `AUTH-CTX-011`, `AUTH-CTX-015`, frescura, compatibilidad y topología sin alterar tareas posteriores. |
| REMOTA    | NOT_APPLICABLE | No existe escritura, despliegue ni cambio remoto en este marcador documental.                                                                                  |
| OPERATIVA | NOT_APPLICABLE | No se modifica la operación real de turnos, asistencia o consumidores.                                                                                         |
| FÍSICA    | NOT_APPLICABLE | No existe `implementation_unit_id` materializada para CTX002 y E5 no autoriza ejecución física desde este marcador global.                                     |

---

#### 39. Decisiones vinculantes

1. `AccessContextV1` validado es la única entrada de CTX002.
2. `active_shift` es el único turno canónico consumido.
3. `active_checkin_session` es la única sesión de check-in canónica consumida.
4. el check-in siempre depende del turno ya resuelto.
5. el check-in nunca selecciona turno.
6. turno y check-in permanecen inmutables dentro del snapshot.
7. CTX002 no consulta tablas ni RPC legacy para completar contexto.
8. `shift_date = hoy` no es una regla canónica de vigencia.
9. la ventana de turno conserva `starts_at <= resolved_at < ends_at`.
10. un turno nocturno puede permanecer vigente después de medianoche.
11. un turno no nulo siempre conserva `published = true` y `currently_valid = true`.
12. dos turnos vigentes producen ambigüedad, no desempate.
13. una sesión activa exige `status = ACTIVE` y `checked_out_at = null`.
14. una sesión activa coincide con actor, empleado, turno y sede.
15. un check-in no inventa área, rol, sede ni turno.
16. una sesión nunca sobrevive al fin/cancelación del turno.
17. un check-out confirmado elimina la sesión activa sin afectar automáticamente el carril base.
18. una cola offline pendiente no satisface check-in.
19. `N`, `T` y `T+C` permanecen distintos.
20. CTX002 no decide permisos ni recursos.
21. CTX002 no implementa `lane_readiness`; preserva su contrato para CTX004.
22. CTX002 no implementa razones seguras de presentación; permanecen en CTX005.
23. CTX002 no implementa sede/área seguras; permanecen en CTX003.
24. CTX002 no implementa L1; permanece en CTX006.
25. `SHIFT_*` y `CHECKIN_*` permanecen en el catálogo canónico, sin extensiones locales.
26. ausencia normal no se convierte en contradicción.
27. contradicción no se degrada a ausencia para permitir operación.
28. dispositivos compartidos usan el contexto del actor humano exacto.
29. simulación permanece fuera del contexto real.
30. compatibilidad solo fluye de canónico a legacy.
31. ANIMA conserva su operación de asistencia, pero no define el `AccessContext` del SDK.
32. la futura instancia se materializa como máximo una vez por `implementation_unit_id`.
33. varios packages podrán consumir la misma unidad mediante lineage.
34. integración live requiere backend propietario realmente disponible.
35. rollback no puede reactivar autoridad legacy como estado final.
36. se crean cero TREQ y cero cambios 04A.
37. no se modifica código, Supabase ni consumidores durante este marcador global.
38. `SHELL-CTX-003` permanece exclusivamente reservada.

---

#### 40. Criterios de aceptación

- [x] `SHELL-CTX-001` es la precedencia inmediata aprobada;
- [x] `SHELL-CTX-003` permanece únicamente reservada;
- [x] se usa `PER_IMPLEMENTATION_UNIT`;
- [x] se separa contrato global de implementación física;
- [x] se conserva `AccessContext@1.0.0` sin cambio de forma;
- [x] se conserva un único módulo contextual dentro de `@vento/os-context`;
- [x] `active_shift` y `active_checkin_session` son las únicas fuentes canónicas de esta responsabilidad;
- [x] se define el orden turno → check-in;
- [x] el check-in no selecciona turno;
- [x] se conserva la ventana temporal semiabierta del turno;
- [x] se preservan turnos nocturnos;
- [x] se preserva revisión publicada autoritativa;
- [x] se prohíben desempates por orden, UI, check-in o sede seleccionada;
- [x] se preserva cardinalidad 0/1/>1 para turno;
- [x] se preserva cardinalidad 0/1/>1 para check-in;
- [x] se exige relación exacta actor/employee/shift/site;
- [x] se conserva área nullable sin permitir que check-in la invente;
- [x] se prohíbe una sesión activa después del fin del turno;
- [x] se distingue check-in cerrado/expirado de check-in inválidamente presentado como activo;
- [x] cola offline no concede autoridad;
- [x] `N`, `T` y `T+C` permanecen diferenciados;
- [x] el carril base permanece independiente;
- [x] no se crea `can_operate`;
- [x] no se crea decisión local;
- [x] no se crean códigos `SHIFT_*` o `CHECKIN_*` nuevos;
- [x] se preserva el catálogo estructural vigente;
- [x] se prohíbe reconstruir contexto desde ANIMA, RPC legacy o tablas locales;
- [x] se define frontera de frescura y write barrier sin absorber CTX006/AUTH003/DB035;
- [x] se definen 37 casos mínimos de prueba futura;
- [x] se definen doce gates de materialización;
- [x] se define compatibilidad y rollback;
- [x] se justifica 0 TREQ nuevos y 0 modificados;
- [x] se declaran 0 cambios físicos y 0 cambios Supabase;
- [x] no se desarrolla `SHELL-CTX-003`.

---

#### 41. Límites

Esta tarea no:

- modifica `packages/os-context`;
- crea TypeScript;
- crea package o subpath público;
- publica una release;
- crea o modifica turnos;
- registra check-in o check-out;
- modifica ANIMA;
- modifica `employee_shifts`;
- modifica `attendance_logs`;
- crea sesiones físicas de check-in;
- implementa `get_access_context`;
- implementa `evaluate_authorization`;
- implementa `resolveAccessContext`;
- implementa `operational_site` u `operational_area`;
- implementa `lane_readiness`;
- implementa razones seguras de bloqueo;
- implementa L0 o L1;
- implementa `ContextFreshnessToken`;
- migra consumidores;
- retira RPC legacy;
- crea SQL, migraciones, RLS, triggers, Storage, Realtime o Edge Functions;
- ejecuta cambios en Supabase;
- declara integración remota u operativa inexistente;
- ejecuta `SHELL-CTX-002::<implementation_unit_id>`;
- avanza ni desarrolla la tarea siguiente.

---

#### 42. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-CTX-001 — Consolidar el módulo de contexto dentro de @vento/os-context`

**TAREA ACTUAL APROBADA**
`SHELL-CTX-002 — Implementar consumo canónico de turno y check-in`

**SIGUIENTE TAREA RESERVADA**
`SHELL-CTX-003 — Implementar proyecciones seguras de sede y área efectivas`


### ✅ SHELL-CTX-003 — Implementar proyecciones seguras de sede y área efectivas

**Estado:** APROBADA
**Tarea anterior:** SHELL-CTX-002 — Implementar consumo canónico de turno y check-in
**Tarea siguiente:** SHELL-CTX-004 — Implementar readiness operativo sin booleanos de autorización
**Tipo de tarea:** Documental — definición global única de las proyecciones contextuales seguras de sede y área operativas, con futura materialización física una sola vez por unidad de implementación
**Bloque:** BLOQUE H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md`
**Estado físico resultante:** `DEFINIDO_NO_MATERIALIZADO`; 2 nodos territoriales canónicos proyectados; 0 contratos públicos nuevos; 0 packages nuevos; 0 subpaths públicos nuevos; 0 unidades materializadas; 0 cambios Supabase
**Cambios físicos autorizados:** ninguno durante el marcador global
**Requisitos de prueba creados o modificados:** 0
**Modalidad:** `PER_IMPLEMENTATION_UNIT`
**Trabajo canónico actual:** definir una sola vez el contrato de proyección territorial segura y asignar su futura materialización
**Instancia física futura:** `SHELL-CTX-003::<implementation_unit_id>`
**Condición de materialización:** después de que `DELIV-PKG-025` asigne `implementation_unit_id` y el `package_id` propietario supere `E5-GATE-008`
**Snapshot producido:** `SHELL-CTX-TERRITORY-PROJECTION-001`

---

#### 1. Propósito

`SHELL-CTX-003` define el contrato único mediante el cual el módulo contextual interno de `@vento/os-context` deberá consumir y proyectar de forma segura los nodos canónicos `operational_site` y `operational_area` de `AccessContext@1.0.0`.

La responsabilidad queda cerrada así:

```text
AccessContextV1 validado
→ operational_site
→ operational_area
→ proyección contextual territorial segura
→ responsabilidades posteriores
```

La tarea no resuelve nuevamente la sede o el área desde tablas, selectores, dispositivo, geocerca, recurso o estado local. Tampoco convierte territorio operativo en permiso, readiness o decisión.

El marcador global es documental. La implementación física se realizará únicamente en `SHELL-CTX-003::<implementation_unit_id>` cuando exista una unidad autorizada por E5.

---

#### 2. Resultado canónico

Se fija una sola semántica compartida para territorio operativo dentro de `@vento/os-context`:

1. `operational_site` y `operational_area` se consumen exclusivamente desde un `AccessContextV1` validado;
2. la sede efectiva de esta tarea significa **sede operativa del turno vigente**, no sede administrativa, primaria, seleccionada ni del recurso;
3. el área efectiva de esta tarea significa **área operativa del turno vigente**, cuando exista, no área administrativa, seleccionada ni inferida;
4. los dos nodos permanecen inmutables;
5. sus flags negativos se preservan y nunca se mejoran localmente;
6. `null` conserva su semántica contractual y nunca se transforma en wildcard;
7. el check-in solo puede confirmar territorio ya derivado del turno;
8. la proyección no crea otro contrato público ni otro namespace runtime;
9. `SafeContextProjectionV1` continúa siendo propiedad de `SHELL-AUTH-002`;
10. CTX003 únicamente aporta la semántica territorial interna que esa proyección pública podrá consumir;
11. no se decide permiso, alcance del recurso, readiness ni autorización;
12. la materialización se ejecutará como máximo una vez por `implementation_unit_id`.

---

#### 3. Fuentes y precedencia

La tarea conserva sin reinterpretar las decisiones aprobadas en:

| Fuente                    | Responsabilidad vinculante                                                      |
| ------------------------- | ------------------------------------------------------------------------------- |
| `SHELL-CTX-001`           | único módulo contextual interno, `AccessContextV1` validado e inmutable         |
| `SHELL-CTX-002`           | consumo canónico de turno y check-in; el check-in no crea territorio            |
| `AUTH-CTX-009`            | separación entre asignaciones/cobertura administrativa y territorio operativo   |
| `AUTH-CTX-010`            | `active_shift` como turno publicado y vigente                                   |
| `AUTH-CTX-011`            | check-in activo como evidencia confirmatoria, nunca fuente alternativa de turno |
| `AUTH-CTX-012`            | rol operativo derivado exclusivamente del turno y validado territorialmente     |
| `AUTH-CTX-013`            | formas y semántica de `operational_site` y `operational_area`                   |
| `AUTH-CTX-015`            | problemas estructurales y `lane_readiness` canónicos                            |
| `AUTH-CTX-018`            | territorio del recurso separado del territorio operativo                        |
| `AUTH-CTX-025`            | productor backend de `AccessContext@1.0.0`                                      |
| `AUTH-CTX-027`            | consumo centralizado y eliminación de lógica territorial local                  |
| `AUTH-CTX-028`            | compatibilidad legacy únicamente desde canónico hacia legacy                    |
| `AUTH-CTX-029`            | frescura e invalidación por cambios territoriales                               |
| `SHELL-AUTH-002`          | `SafeContextProjectionV1` y frontera pública server/client                      |
| `task-work-topology.json` | una materialización máxima por `implementation_unit_id`                         |

Precedencia funcional:

```text
turno/check-in canónicos
→ territorio operativo canónico
→ proyección territorial interna segura
→ readiness y razones contextuales
→ adapter de proyección pública
→ presentación
```

---

#### 4. Modalidad y ciclo de materialización

La tarea usa `PER_IMPLEMENTATION_UNIT`.

```text
MARCADOR GLOBAL SHELL-CTX-003
→ define una sola vez semántica, invariantes, minimización, pruebas, gates y rollback
→ no materializa código

DELIV-PKG-025::<package_id>
→ asigna implementation_unit_id y owner package

E5-GATE-008::<package_id> = PASS
→ habilita la unidad

SHELL-CTX-003::<implementation_unit_id>
→ materializa una sola implementación territorial de la unidad
→ N package_id pueden consumirla mediante lineage
→ no se duplica por aplicación ni por package consumidor
```

La futura instancia no inventará `implementation_unit_id` ni package propietario.

---

#### 5. Línea base física verificable

El estado físico actual de `@vento/os-context` todavía es transitorio:

| Superficie                              | Estado actual                                     | Disposición                                    |
| --------------------------------------- | ------------------------------------------------- | ---------------------------------------------- |
| `@vento/os-context@0.1.0`               | package privado con export raíz directo a source  | baseline transitorio                           |
| `EffectiveContext.site_id`              | string nullable plano                             | legacy; no equivale a `OperationalSiteContext` |
| `EffectiveContext.area_id`              | string nullable plano                             | legacy; no equivale a `OperationalAreaContext` |
| `EffectiveContext.area_kind`            | string nullable abierto                           | legacy; no es catálogo territorial canónico    |
| `EffectiveContext.can_operate`          | booleano plano                                    | no es readiness ni autorización canónica       |
| `getEffectiveContext`                   | consume `get_effective_context_v1` y realiza cast | compatibilidad legacy; no fuente objetivo      |
| proyección territorial interna canónica | no materializada                                  | futura instancia de CTX003                     |
| `SafeContextProjectionV1` físico        | no materializado                                  | futura responsabilidad de `SHELL-AUTH-002`     |

La presencia de `site_id` y `area_id` en `EffectiveContext` no demuestra que CTX003 ya esté implementada.

---

#### 6. Frontera de autoridad

La propiedad queda separada así:

```text
@vento/contracts/authorization
→ tipos, schemas, códigos y validadores

AUTH-DB-033
→ resuelve hechos empresariales y produce AccessContextV1

SHELL-CTX-002
→ consume active_shift + active_checkin_session

SHELL-CTX-003
→ consume operational_site + operational_area
→ verifica coherencia contractual
→ proyecta territorio de forma segura
→ no re-resuelve datos empresariales

SHELL-AUTH-002
→ transforma contexto validado en SafeContextProjectionV1 para transporte/presentación
```

CTX003 no se convierte en resolver de sedes, áreas, asignaciones, recursos ni permisos.

---

#### 7. Entrada única

La única entrada autorizada es un `AccessContextV1` válido y completo conforme a:

```text
vento.authorization.response-contracts@1.0.0
AccessContext@1.0.0
schema_version = 1.0.0
```

Antes de proyectar territorio deben existir:

- contrato reconocido;
- versión reconocida;
- schema reconocido;
- `AccessContextV1` validado;
- nodos y códigos compatibles con `@vento/contracts/authorization`;
- snapshot completo, no objeto parcial.

Quedan prohibidos como entrada canónica:

- `EffectiveContext`;
- `OperationalContextRow`;
- `{ site_id, area_id }` fabricado por caller;
- estado de UI;
- selección visual;
- fila de turno aislada;
- fila de check-in aislada;
- resultado de geocerca;
- dispositivo local;
- recurso solicitado usado para fabricar territorio laboral.

---

#### 8. Forma de `operational_site`

CTX003 conserva exactamente:

```ts
type OperationalSiteContext = {
  site_id: string;
  source_shift_id: string;
  site_active: boolean;
  assignment_valid: boolean;
};
```

No agrega campos, aliases, nombres humanos, coordenadas, permisos, reasons ni metadata local.

---

#### 9. Forma de `operational_area`

CTX003 conserva exactamente:

```ts
type OperationalAreaContext = {
  area_id: string;
  site_id: string;
  area_kind: string;
  source: "SHIFT" | "CHECKIN_CONFIRMED_SHIFT";
  area_active: boolean;
  compatible_with_role: boolean;
};
```

No agrega campos ni crea una variante local del nodo.

---

#### 10. Significado de “sede efectiva”

Para esta tarea:

```text
sede efectiva
=
operational_site del AccessContext real
```

No significa:

- sede primaria;
- sede seleccionada;
- sede por defecto del empleado;
- primera sede asignada;
- última sede usada;
- sede del dispositivo;
- punto físico de marcación;
- geocerca;
- sede del recurso;
- cobertura administrativa;
- organización completa.

La UI puede seleccionar filtros; esa selección no muta el territorio operativo.

---

#### 11. Significado de “área efectiva”

Para esta tarea:

```text
área efectiva
=
operational_area del AccessContext real, cuando exista
```

No significa:

- área primaria;
- área seleccionada;
- primera área asignada;
- área del dispositivo;
- área del recurso;
- área inferida por rol;
- área inferida por `area_kind`;
- área obtenida del check-in cuando el turno no la declara.

---

#### 12. Dependencia obligatoria del turno

La proyección conserva:

```text
active_shift = null
→ operational_site = null
→ operational_area = null
```

Si `active_shift` no existe, CTX003 no reconstruye territorio desde asignaciones, último turno, check-in residual, dispositivo, recurso o selector.

---

#### 13. Coherencia de sede con turno

Para un nodo no nulo deben preservarse exactamente:

```text
operational_site.site_id
=
active_shift.site_id
```

```text
operational_site.source_shift_id
=
active_shift.shift_id
```

Un mismatch no se corrige ni se oculta.

CTX003 no puede cambiar `site_id` para hacerlo coincidir con:

- asignación primaria;
- check-in;
- dispositivo;
- recurso;
- selección visual;
- perfil laboral.

---

#### 14. Estado de sede

`site_active` se proyecta como hecho canónico, no como decisión.

```text
site_active = true
→ sede observada activa

site_active = false
→ sede observada inactiva
```

Una sede resoluble e inactiva puede permanecer representada con `site_active = false` para conservar el diagnóstico exacto. CTX003 nunca cambia ese valor a `true` para mejorar disponibilidad.

---

#### 15. Validez de asignación laboral

`assignment_valid` se preserva exactamente desde el contexto autoritativo.

Semántica:

```text
assignment_valid = true
→ existe asignación laboral utilizable para la sede exacta del turno

assignment_valid = false
→ el turno observa una sede que no cuenta con asignación laboral utilizable
```

Un turno válido no crea una asignación permanente. CTX003 no modifica `assigned_sites`, no crea filas y no utiliza una sede primaria como compensación.

---

#### 16. Coherencia de área con turno

Cuando el turno declara área:

```text
operational_area.area_id
=
active_shift.area_id
```

Y:

```text
operational_area.site_id
=
operational_site.site_id
```

El área debe pertenecer realmente a esa sede. Un área de otra sede no se reescribe para que coincida.

---

#### 17. Área ausente legítimamente

Se conserva:

```text
active_shift.area_id = null
→ operational_area = null
```

La ausencia puede ser válida para roles o permisos que operen a nivel de sede.

CTX003 no crea un área sintética como:

- `GENERAL`;
- “toda la sede”;
- primera área disponible;
- área administrativa;
- área principal;
- wildcard.

---

#### 18. `null` nunca es wildcard

Las siguientes equivalencias quedan prohibidas:

```text
operational_area = null
→ todas las áreas
```

```text
operational_site = null
→ cualquier sede
```

```text
resource_area = null
→ cualquier área operativa
```

La semántica concreta de la ausencia se interpreta en el contrato del permiso y del recurso; CTX003 solo preserva el hecho territorial.

---

#### 19. `area_kind`

`area_kind` se conserva exclusivamente como clasificación canónica del `area_id` observado.

No podrá derivarse desde:

- nombre humano;
- rol operativo;
- pantalla;
- permiso;
- dispositivo;
- ruta;
- string aproximado;
- selector.

`area_kind` no sustituye `area_id` ni amplía alcance.

---

#### 20. Fuente del área

El campo `source` conserva exactamente dos valores:

```text
SHIFT
CHECKIN_CONFIRMED_SHIFT
```

`SHIFT` significa que el área procede del turno.

`CHECKIN_CONFIRMED_SHIFT` significa que el área procede del turno y una sesión de check-in activa confirma exactamente la misma área.

No significa que el check-in haya creado o reemplazado el área.

---

#### 21. Check-in confirmatorio

`CHECKIN_CONFIRMED_SHIFT` solo puede conservarse cuando:

1. existe `active_checkin_session`;
2. pertenece al mismo actor y empleado;
3. coincide con el mismo turno;
4. coincide con la misma sede;
5. declara exactamente el mismo `area_id` del turno;
6. no existe contradicción estructural aplicable.

Si falta cualquiera de estas condiciones, CTX003 no inventa confirmación.

---

#### 22. Check-in sin área

Cuando:

```text
active_shift.area_id != null
active_checkin_session.area_id = null
```

la proyección territorial conserva el área del turno y su fuente permanece:

```text
SHIFT
```

La ausencia de área en check-in no borra ni reemplaza el área del turno.

---

#### 23. Check-in con área incompatible

Cuando la sesión declara un área distinta de la del turno:

- el check-in no cambia `operational_area`;
- no se usa `CHECKIN_CONFIRMED_SHIFT`;
- la incompatibilidad estructural canónica se preserva;
- la sesión incompatible no se convierte en evidencia positiva;
- CTX003 no degrada la contradicción a ausencia normal.

---

#### 24. Estado y compatibilidad del área

`area_active` y `compatible_with_role` son hechos contractuales conservados.

```text
area_active = false
→ área observada inactiva
```

```text
compatible_with_role = false
→ el área observada no satisface la compatibilidad territorial del rol operativo
```

CTX003 no convierte ninguno de estos flags en `true` mediante fallback, ni los transforma en `can_operate`.

---

#### 25. Asignaciones de área

`assigned_areas` permanece separado de `operational_area`.

La ausencia de una asignación permanente de área no impide por sí sola representar un área válida del turno cuando el contrato canónico la resolvió.

CTX003 no exige artificialmente:

```text
operational_area.area_id ∈ assigned_areas
```

como condición universal.

---

#### 26. Separación frente a cobertura administrativa

CTX003 no modifica:

- `assigned_sites`;
- `assigned_areas`;
- `administrative_coverage`;
- `base_role`;
- grants base;
- denegaciones base.

Puede existir simultáneamente:

```text
administrative_coverage = ORGANIZATION
operational_site = sede única del turno
operational_area = área única o null
```

La cobertura administrativa amplia no amplía el territorio operativo.

---

#### 27. Separación frente al territorio del recurso

`operational_site` y `operational_area` describen el territorio laboral del actor, no el territorio real del recurso solicitado.

CTX003 no resuelve:

- `resource_site_id`;
- `resource_area_id`;
- origen y destino;
- múltiples sedes;
- múltiples áreas;
- recurso organizacional;
- recurso no territorial.

Esa responsabilidad permanece en `AUTH-CTX-018` y en el evaluador canónico.

---

#### 28. Operaciones multiterritoriales

Una acción entre dos sedes o áreas no produce dos territorios operativos dentro del contexto laboral.

Ejemplo conceptual:

```text
actor trabaja en CENTRO_PRODUCCION
recurso implica origen CENTRO_PRODUCCION + destino VENTO_CAFE
```

CTX003 continúa proyectando únicamente el territorio operativo del actor. La autorización transversal se decide contra el territorio del recurso y el alcance exacto del permiso.

---

#### 29. Permiso global no es cross-site

CTX003 no interpreta un permiso operativo global como capacidad para utilizar cualquier sede desde un turno actual.

```text
global operativo
≠
cross-site operativo
```

La proyección territorial nunca se expande por modalidad o scope del permiso.

---

#### 30. Dispositivo compartido

El dispositivo puede imponer restricciones adicionales, pero no fabrica territorio laboral.

```text
territorio del actor
∩
límite territorial del dispositivo
→ conjunto evaluable
```

Nunca:

```text
territorio del actor
∪
territorio del dispositivo
```

Un dispositivo incompatible no cambia la sede o el área del turno para obtener coincidencia.

---

#### 31. Simulación

Una sede o área hipotética pertenece a `SimulationContext`, no al `AccessContextV1` real.

CTX003 no permite:

- role override territorial;
- sede simulada dentro del contexto real;
- área simulada dentro del contexto real;
- `WOULD_ALLOW` como autoridad;
- persistir selecciones hipotéticas como territorio efectivo.

---

#### 32. Proyección interna y `SafeContextProjectionV1`

CTX003 no crea un DTO público nuevo.

La proyección interna conserva los nodos territoriales canónicos para uso del SDK. Cuando `SHELL-AUTH-002` produzca `SafeContextProjectionV1`, la exposición territorial pública continuará limitada a:

```text
operational_site_id
operational_area_id
```

Reglas:

1. `operational_site_id` se deriva únicamente de `operational_site.site_id`;
2. `operational_area_id` se deriva únicamente de `operational_area.area_id`;
3. si el nodo canónico es `null`, el ID proyectado es `null`;
4. no se incorporan nombres, direcciones, coordenadas, geocercas, asignaciones completas ni flags internos a la proyección pública por CTX003;
5. CTX003 no modifica la allowlist de `SafeContextProjectionV1`.

---

#### 33. Minimización territorial

La responsabilidad de CTX003 no crea ni expone adicionalmente:

- nombre humano de sede;
- nombre humano de área;
- dirección;
- coordenadas;
- precisión GPS;
- geocercas;
- punto físico de marcación;
- fotografías;
- notas;
- lista completa de sedes asignadas;
- lista completa de áreas asignadas;
- datos del dispositivo;
- grants;
- denegaciones;
- permiso solicitado;
- recurso completo;
- `structural_issues` completos hacia cliente;
- fingerprints internos;
- `can_operate`;
- bypasses.

---

#### 34. Separación frente a readiness

CTX003 no decide si el carril operativo está `READY`, `UNAVAILABLE`, `INVALID` o `NOT_APPLICABLE`.

Preserva hechos como:

- sede ausente;
- sede inactiva;
- asignación inválida;
- área ausente;
- área inactiva;
- rol incompatible con área.

La composición final de `lane_readiness.operational` pertenece a `SHELL-CTX-004` y conserva el catálogo de `AUTH-CTX-015`.

No se crea `can_operate` ni equivalente.

---

#### 35. Separación frente a razones seguras

CTX003 no inventa textos ni códigos de bloqueo para UI.

Los `StructuralIssueCode` y `LaneAvailabilityReasonCode` permanecen en sus namespaces cerrados. La traducción o proyección segura de razones contextuales pertenece a `SHELL-CTX-005` y las razones públicas de autorización pertenecen a sus contratos propios.

---

#### 36. Fail closed

Ante contrato inválido, incompatibilidad o contradicción, CTX003 no corrige el contexto para obtener una proyección más permisiva.

Queda prohibido:

- usar sede primaria como fallback;
- usar sede seleccionada como fallback;
- usar `employees.site_id` como fallback;
- usar área primaria como fallback;
- escoger primera área compatible;
- inferir área desde rol;
- usar check-in para crear territorio;
- usar dispositivo para crear territorio;
- usar recurso para fabricar territorio laboral;
- tratar `null` como wildcard;
- ocultar flags negativos;
- reconstruir `OperationalSiteContext` o `OperationalAreaContext` desde `EffectiveContext`.

---

#### 37. Frescura e invalidación

Los hechos territoriales pueden quedar obsoletos cuando cambian, entre otros:

- turno o revisión publicada;
- sede del turno;
- área del turno;
- estado activo de sede;
- estado activo de área;
- asignación laboral de sede;
- `assignable`;
- rol operativo o habilitación territorial;
- check-in o check-out;
- sesión de dispositivo;
- actor efectivo.

CTX003 no implementa caché propia.

La coordinación permanece:

```text
SHELL-AUTH-003
→ L0 + write barrier

AUTH-DB-035
→ token transaccional de frescura

SHELL-CTX-006
→ L1 validada + single-flight cross-request
```

Un snapshot anterior a un cambio territorial no se reutiliza como autoridad posterior.

---

#### 38. Compatibilidad legacy

La única dirección compatible es:

```text
AccessContextV1 canónico
→ territorio canónico validado
→ proyección legacy temporal, cuando aplique
```

Nunca:

```text
selectedSite / selectedArea / employees.site_id / EffectiveContext
→ reconstruir operational_site u operational_area canónicos
```

Una proyección legacy puede conservar temporalmente IDs derivados del contexto canónico, pero no recupera autoridad para decidir territorio.

---

#### 39. Snapshot contractual

Se define el snapshot documental:

```json
{"access_context_contract":"AccessContext@1.0.0","area_projection_source":"operational_area","client_projection_owner":"SHELL-AUTH-002","context_task":"SHELL-CTX-003","new_public_contracts":0,"new_public_subpaths":0,"operational_area_null_is_wildcard":false,"operational_site_projection_source":"operational_site","physical_state":"NOT_IMPLEMENTED","projection_mode":"READ_ONLY_CANONICAL_TERRITORY","snapshot_id":"SHELL-CTX-TERRITORY-PROJECTION-001"}
```

Huella normativa:

`sha256:c135c974a4e388a285c355cd7f81cfcc7737493c0fc1f4c37f0d81d46f3c1db2`

La serialización normativa usa JSON UTF-8 en una línea, claves ordenadas lexicográficamente y valores JSON canónicos.

---

#### 40. Contrato de futura instancia

Cada `SHELL-CTX-003::<implementation_unit_id>` deberá registrar como mínimo:

| Campo                    | Obligación                                                                  |
| ------------------------ | --------------------------------------------------------------------------- |
| `implementation_unit_id` | unidad exacta asignada por `DELIV-PKG-025`                                  |
| `owner_package_id`       | package propietario con `E5-GATE-008 = PASS`                                |
| `consumer_package_ids`   | consumidores vinculados por lineage                                         |
| baseline                 | commit anterior a materialización                                           |
| result commit            | commit exacto del resultado                                                 |
| SDK version              | versión exacta de `@vento/os-context`                                       |
| contracts version        | versión exacta de `@vento/contracts`                                        |
| context contract         | `AccessContext@1.0.0` y schema esperados                                    |
| territory snapshot       | `SHELL-CTX-TERRITORY-PROJECTION-001` o revisión aprobada                    |
| source integrity         | evidencia de `operational_site`/`operational_area` sin reconstrucción local |
| projection check         | IDs y nulabilidad derivados únicamente de nodos canónicos                   |
| minimization check       | ausencia de datos territoriales no autorizados en superficie pública        |
| freshness evidence       | integración con write barrier/frescura cuando esté disponible               |
| consumer matrix          | consumidores y targets aplicables                                           |
| tests                    | resultados atribuibles al mismo commit/versiones                            |
| artifact digest          | huella del artefacto materializado                                          |
| rollback                 | combinación anterior soportada y ensayo                                     |
| blockers                 | lista cerrada con owner y condición de salida                               |

Un campo obligatorio ausente deja la instancia `BLOCKED`.

---

#### 41. Unicidad y lineage

```text
1 implementation_unit_id
→ máximo 1 SHELL-CTX-003::<implementation_unit_id>
→ máximo 1 implementación propietaria de la proyección territorial
→ N package_id consumidores mediante lineage
```

No se copiará la misma lógica territorial en cada aplicación o package para evitar una dependencia compartida.

Evidencia de otra unidad, versión, snapshot o commit no certifica la instancia actual.

---

#### 42. Perfil de pruebas de futura instancia

La futura instancia deberá cubrir como mínimo:

##### Contrato territorial

1. `operational_site` válido con todos sus campos exactos;
2. `operational_area` válida con todos sus campos exactos;
3. versión de `AccessContext` incompatible;
4. shape parcial o cast legacy rechazado;
5. `active_shift = null` produce territorio nulo;
6. `source_shift_id` distinto del turno falla cerrado;
7. `site_id` distinto del turno falla cerrado.

##### Sede

8. sede válida y asignación válida;
9. sede válida con `assignment_valid = false`;
10. sede inactiva conserva `site_active = false`;
11. sede desconocida no se completa;
12. sede primaria diferente no altera proyección;
13. sede seleccionada diferente no altera proyección;
14. punto físico de marcación diferente no altera proyección;
15. sede del dispositivo diferente no reemplaza territorio.

##### Área

16. área válida y compatible con rol;
17. área válida pero inactiva;
18. área válida pero incompatible con rol;
19. turno sin área conserva `operational_area = null`;
20. área obligatoria ausente no recibe fallback;
21. área perteneciente a otra sede no se corrige;
22. `area_kind` procede del nodo/catálogo canónico, no del rol;
23. `assigned_areas = []` no elimina automáticamente un área válida del turno;
24. `null` no se interpreta como wildcard.

##### Check-in y separación

25. check-in con misma área conserva `CHECKIN_CONFIRMED_SHIFT`;
26. check-in sin área conserva fuente `SHIFT`;
27. check-in con área distinta no reemplaza el área;
28. check-in en punto externo no cambia `operational_site`;
29. cobertura administrativa amplia no amplía territorio operativo;
30. territorio del recurso distinto no reescribe territorio laboral;
31. operación multiterritorial conserva un solo territorio operativo del actor;
32. simulación no modifica la proyección real.

##### Integración, frescura y regresión

33. `SafeContextProjectionV1` recibe únicamente IDs derivados de los nodos canónicos;
34. no se filtran nombres, direcciones, GPS, geocercas, asignaciones completas ni evidencia interna;
35. `site_active = false`, `assignment_valid = false`, `area_active = false` o `compatible_with_role = false` no se convierten en `can_operate` ni se ocultan;
36. cambio territorial seguido de write barrier obliga nueva resolución;
37. evidencia stale de otra unidad/commit/version no certifica;
38. legacy no reconstruye contexto canónico;
39. rollback no reactiva selected/default site/area como autoridad;
40. dos packages consumidores de una unidad usan una sola implementación mediante lineage.

---

#### 43. Doce gates de materialización

`SHELL-CTX-003::<implementation_unit_id>` deberá superar:

| Gate                      | Condición de PASS                                                                    |
| ------------------------- | ------------------------------------------------------------------------------------ |
| 1. `IDENTITY`             | unidad, owner package, versiones y commits inequívocos                               |
| 2. `LINEAGE`              | una sola implementación física para la unidad                                        |
| 3. `CONTRACT_INPUT`       | `AccessContext@1.0.0` y schema exactos validados antes de proyectar                  |
| 4. `SITE_PROJECTION`      | sede derivada exclusivamente de `operational_site`, sin fallback local               |
| 5. `AREA_PROJECTION`      | área derivada exclusivamente de `operational_area`, preservando nulabilidad y source |
| 6. `RELATIONAL_INTEGRITY` | turno, sede, área, rol y check-in conservan relaciones exactas                       |
| 7. `NULL_AND_FLAGS`       | `null` no es wildcard y flags negativos no se elevan                                 |
| 8. `MINIMIZATION`         | superficie pública no recibe datos territoriales fuera de la allowlist existente     |
| 9. `SEPARATION`           | sin readiness local, autorización, recurso, simulación o `can_operate`               |
| 10. `FRESHNESS_HANDOFF`   | write barrier/frescura aplicables integradas con sus propietarios                    |
| 11. `COMPATIBILITY`       | consumidores, contratos y targets aplicables corresponden a la misma combinación     |
| 12. `ROLLBACK`            | retorno reproducible sin reactivar autoridad legacy territorial                      |

Un gate faltante, no ejecutado cuando sea aplicable, con evidencia stale o de otra unidad bloquea la certificación física.

---

#### 44. Evidencia requerida por futura instancia

| Clase                | Contenido mínimo                                                                         |
| -------------------- | ---------------------------------------------------------------------------------------- |
| `IDENTITY`           | implementation unit, owner package, consumers, baseline/result commit                    |
| `CONTRACTS`          | versiones y schemas exactos                                                              |
| `TERRITORY_SOURCE`   | prueba de que sede/área proceden de nodos canónicos                                      |
| `INVARIANTS`         | coherencia shift/site/area/check-in/role                                                 |
| `MINIMIZATION`       | comparación de entrada frente a proyección pública                                       |
| `NEGATIVE_FLAGS`     | preservación de `site_active`, `assignment_valid`, `area_active`, `compatible_with_role` |
| `NULL_SEMANTICS`     | ausencia legítima frente a invalidez, sin wildcard                                       |
| `FRESHNESS`          | barreras e invalidación aplicables                                                       |
| `COMPATIBILITY`      | matriz de consumidores y targets                                                         |
| `ARTIFACT_INTEGRITY` | snapshot, versión, commit y digest                                                       |
| `ROLLBACK`           | combinación anterior y ensayo                                                            |
| `CERTIFICATION`      | doce gates y estado agregado                                                             |

---

#### 45. Rollback

El rollback de una futura instancia podrá volver a una combinación anterior únicamente cuando:

- continúe soportada;
- sea compatible con contratos vigentes;
- tenga evidencia reproducible;
- no reactive `selectedSite`, `selectedArea`, `employees.site_id` o valores equivalentes como autoridad;
- no reactive `EffectiveContext` como contexto canónico;
- no convierta `null` en wildcard;
- no restablezca `can_operate` como autoridad;
- no rompa lineage ni trazabilidad de la unidad.

Cuando exista caché compartida, el rollback seguro de caché permanece definido por CTX006 y no permite servir territorio stale para conservar disponibilidad.

---

#### 46. Reconciliación de responsabilidades

| Responsabilidad                                                 | Propietario exacto                                      |
| --------------------------------------------------------------- | ------------------------------------------------------- |
| contratos de contexto y tipos territoriales                     | `@vento/contracts/authorization` / `SHELL-CON-007..008` |
| productor autoritativo de `operational_site`/`operational_area` | `AUTH-DB-033`                                           |
| turno y check-in consumidos                                     | `SHELL-CTX-002`                                         |
| proyección territorial interna segura                           | `SHELL-CTX-003`                                         |
| readiness operativo                                             | `SHELL-CTX-004`                                         |
| razones seguras contextuales                                    | `SHELL-CTX-005`                                         |
| caché compartida/frescura                                       | `SHELL-CTX-006` + `AUTH-DB-035`                         |
| DTO público `SafeContextProjectionV1`                           | `SHELL-AUTH-002`                                        |
| territorio del recurso                                          | `AUTH-CTX-018`                                          |
| decisión de autorización                                        | `AUTH-DB-034` / evaluador canónico                      |
| migración de consumidores legacy                                | `SHELL-AUTH-005`                                        |
| retiro físico legacy                                            | `AUTH-DB-030`                                           |
| certificación final                                             | `AUTH-DB-031`                                           |

No queda una responsabilidad detectada sin propietario documental exacto.

---

#### 47. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** **0**
**Requisitos modificados:** **0**

**Justificación:** la semántica territorial de CTX003 ya está protegida por requisitos canónicos vigentes que asignan expresamente esta responsabilidad y cubren la coherencia transversal de turno, check-in, rol, sede, área, autoridad contractual, minimización de la proyección pública, write barrier y eliminación de fallbacks territoriales legacy. CTX003 no introduce un contrato serializado nuevo, un código nuevo, una modalidad nueva de autorización ni una regla territorial distinta que requiera otra fila.

Crear un requisito adicional duplicaría comportamiento ya registrado. El Registro Canónico de Requisitos de Prueba permanece sin cambios.

---

#### 48. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                          |
| --------- | -------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | El marcador global es documental; no se ejecuta build de runtime ni materialización física en esta fase.                                                                           |
| LOCAL     | PASS           | El artefacto aislado conserva identidad, cabecera, una sola tarea, formas territoriales vigentes, límites de responsabilidad, sección TREQ, continuidad y ausencia de cambios 04A. |
| REMOTA    | NOT_APPLICABLE | El marcador global no autoriza escritura, despliegue ni modificación remota.                                                                                                       |
| OPERATIVA | NOT_APPLICABLE | No se modifica operación real, consumidores ni tráfico.                                                                                                                            |
| FÍSICA    | NOT_APPLICABLE | No existe `implementation_unit_id` materializada para CTX003 y se autorizan cero cambios de código o Supabase en este marcador.                                                    |

---

#### 49. Decisiones vinculantes

1. la proyección territorial consume un `AccessContextV1` validado;
2. `operational_site` es la única sede operativa canónica de esta responsabilidad;
3. `operational_area` es la única área operativa canónica de esta responsabilidad;
4. CTX003 no vuelve a resolver sede o área;
5. la sede operativa procede del turno vigente;
6. el área operativa procede del turno vigente;
7. el check-in solo puede confirmar la misma área;
8. sede primaria y sede seleccionada no son autoridad;
9. área primaria y área seleccionada no son autoridad;
10. `employees.site_id` y `employees.area_id` no son autoridad canónica final;
11. el punto de marcación no es sede operativa;
12. el dispositivo solo restringe, nunca amplía territorio;
13. el territorio del recurso permanece separado;
14. cobertura administrativa permanece separada;
15. `site_active` se conserva sin reinterpretación;
16. `assignment_valid` se conserva sin fallback;
17. `area_active` se conserva sin reinterpretación;
18. `compatible_with_role` se conserva sin fallback;
19. `source` solo puede ser `SHIFT` o `CHECKIN_CONFIRMED_SHIFT`;
20. `CHECKIN_CONFIRMED_SHIFT` exige coincidencia exacta;
21. un check-in sin área no elimina el área del turno;
22. un check-in incompatible no reemplaza área;
23. `null` nunca es wildcard;
24. un rol site-wide puede conservar `operational_area = null` cuando el contrato lo permite;
25. CTX003 no evalúa el requisito de área del permiso;
26. CTX003 no resuelve recursos multiterritoriales;
27. CTX003 no crea `can_operate`;
28. CTX003 no implementa readiness;
29. CTX003 no implementa razones seguras de bloqueo;
30. CTX003 no implementa caché L1;
31. CTX003 no modifica `SafeContextProjectionV1`;
32. la proyección pública territorial permanece limitada a `operational_site_id` y `operational_area_id` dentro de AUTH002;
33. no se exponen datos territoriales adicionales por esta tarea;
34. simulación no modifica contexto real;
35. compatibilidad fluye de canónico hacia legacy;
36. cambios territoriales invalidan snapshots conforme a sus tareas propietarias;
37. la instancia física se materializa una sola vez por `implementation_unit_id`;
38. varios packages consumen la misma unidad mediante lineage;
39. rollback no restaura autoridad territorial legacy;
40. se crean cero TREQ y cero cambios 04A;
41. se mantienen cero cambios físicos y cero cambios Supabase;
42. `SHELL-CTX-004` permanece exclusivamente reservada.

---

#### 50. Criterios de aceptación

- [x] `SHELL-CTX-002` es la precedencia inmediata aprobada;
- [x] `SHELL-CTX-004` permanece únicamente reservada;
- [x] la tarea usa `PER_IMPLEMENTATION_UNIT`;
- [x] se separa contrato global de materialización física;
- [x] se conserva `AccessContext@1.0.0` sin cambio de forma;
- [x] se conservan exactamente `OperationalSiteContext` y `OperationalAreaContext`;
- [x] se define “sede efectiva” como `operational_site`;
- [x] se define “área efectiva” como `operational_area`;
- [x] se prohíben sedes/áreas selected, primary, default o legacy como autoridad;
- [x] `active_shift = null` implica territorio operativo nulo;
- [x] `site_id` y `source_shift_id` deben coincidir con el turno;
- [x] `site_active` se conserva sin elevarlo;
- [x] `assignment_valid` se conserva sin fallback;
- [x] un turno no crea asignación laboral;
- [x] `area_id` coincide exactamente con el turno;
- [x] el área pertenece a la sede operativa;
- [x] `area_kind` procede del catálogo canónico;
- [x] `source` conserva únicamente dos valores;
- [x] `CHECKIN_CONFIRMED_SHIFT` exige coincidencia exacta;
- [x] el check-in no crea ni reemplaza área;
- [x] un check-in sin área conserva fuente `SHIFT`;
- [x] un check-in incompatible no modifica territorio;
- [x] `area_active` y `compatible_with_role` se preservan;
- [x] la ausencia legítima de área se conserva como `null`;
- [x] `null` nunca significa wildcard;
- [x] `assigned_areas` no es requisito operativo universal;
- [x] cobertura administrativa y territorio operativo permanecen separados;
- [x] territorio operativo y territorio del recurso permanecen separados;
- [x] operación multiterritorial no crea territorios operativos adicionales;
- [x] permiso global operativo no se interpreta como cross-site;
- [x] dispositivo solo restringe por intersección;
- [x] simulación permanece separada;
- [x] CTX003 no crea DTO público nuevo;
- [x] `SafeContextProjectionV1` conserva owner `SHELL-AUTH-002`;
- [x] la exposición pública territorial se limita a IDs ya aprobados;
- [x] se define minimización de datos;
- [x] CTX004 conserva readiness;
- [x] CTX005 conserva razones seguras;
- [x] CTX006 conserva L1/frescura;
- [x] se define fail-closed;
- [x] se define snapshot reproducible;
- [x] se definen cuarenta escenarios mínimos de futura prueba;
- [x] se definen doce gates de materialización;
- [x] se define evidencia por instancia;
- [x] se define rollback sin autoridad legacy;
- [x] se reutilizan requisitos TREQ existentes;
- [x] se crean cero TREQ nuevos y cero modificaciones 04A;
- [x] se declaran cero cambios físicos y cero cambios Supabase;
- [x] no se desarrolla `SHELL-CTX-004`.

---

#### 51. Límites

Esta tarea no:

- modifica `packages/os-context`;
- crea archivos TypeScript;
- crea package nuevo;
- crea subpath público nuevo;
- publica `@vento/os-context`;
- modifica manifests o lockfiles;
- implementa `OperationalSiteContext` o `OperationalAreaContext` físicos;
- modifica `SafeContextProjectionV1`;
- crea un segundo DTO territorial público;
- consulta tablas de sedes, áreas, asignaciones, turnos o check-ins;
- modifica `employees.site_id` o `employees.area_id`;
- cambia asignaciones laborales;
- corrige turnos;
- modifica geocercas;
- modifica dispositivos;
- resuelve territorio del recurso;
- implementa readiness;
- implementa razones seguras;
- implementa caché L1;
- migra consumidores;
- retira RPC legacy;
- crea SQL, migraciones, RLS, triggers, Storage, Realtime o Edge Functions;
- ejecuta cambios en Supabase;
- declara integración remota u operativa inexistente;
- ejecuta `SHELL-CTX-003::<implementation_unit_id>`;
- avanza ni desarrolla la tarea siguiente.

---

#### 52. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-CTX-002 — Implementar consumo canónico de turno y check-in`

**TAREA ACTUAL APROBADA**
`SHELL-CTX-003 — Implementar proyecciones seguras de sede y área efectivas`

**SIGUIENTE TAREA RESERVADA**
`SHELL-CTX-004 — Implementar readiness operativo sin booleanos de autorización`


### [ ] SHELL-CTX-004 — Implementar readiness operativo sin booleanos de autorización
### [ ] SHELL-CTX-005 — Implementar razones seguras de bloqueo contextual
### [ ] SHELL-CTX-006 — Implementar caché compartida, single-flight y validación de frescura

### Orden contractual interno

```text
SHELL-AUD-002 a SHELL-AUD-005
        ↓
SHELL-PKG-001 a SHELL-PKG-008
        ↓
SHELL-CON-001 a SHELL-CON-008
        ↓
SHELL-AUTH-001
+
SHELL-CTX-001
        ↓
AUTH-DB-033
        ↓
AUTH-DB-035
        ↓
AUTH-DB-034
        ↓
AUTH-DB-032
        ↓
SHELL-CTX-002 a SHELL-CTX-006
        ↓
SHELL-AUTH-002
        ↓
SHELL-AUTH-003
        ↓
SHELL-AUTH-004
        ↓
AUTH-DB-020
        ↓
AUTH-DB-006 a AUTH-DB-010
+
AUTH-DB-021
        ↓
SHELL-AUTH-005
        ↓
AUTH-DB-030
        ↓
AUTH-DB-031
```

Reglas:

- `SHELL-AUTH-001` define estructura, exports, versionado y compatibilidad del único SDK compartido;
- `SHELL-CTX-001` consolida el módulo contextual dentro del mismo paquete sin crear otro núcleo;
- `AUTH-DB-033`, `AUTH-DB-035`, `AUTH-DB-034` y `AUTH-DB-032` implementan contexto, frescura, decisión y persistencia autoritativos;
- `SHELL-CTX-002..006` consumen el contexto canónico ya disponible y producen proyecciones contextuales seguras;
- `AUTH-DB-035` implementa el token transaccional de frescura y los eventos de invalidación;
- `SHELL-CTX-006` implementa la caché compartida validada y el single-flight sin decidir permisos;
- `SHELL-AUTH-002` implementa adapters y proyecciones sobre las fronteras canónicas;
- `SHELL-AUTH-003` implementa scope por solicitud, deduplicación y registro de consumidores;
- `SHELL-AUTH-004` bloquea nuevos consumos legacy antes de la migración masiva;
- `AUTH-DB-020`, `AUTH-DB-006..010` y `AUTH-DB-021` migran objetos, RPC y RLS por dominio;
- `SHELL-AUTH-005` coordina y certifica la migración multi-repositorio después de disponer de backend, adapters, gates y rollback;
- `AUTH-DB-030` y `AUTH-DB-031` retiran legacy y certifican paridad únicamente al final.
