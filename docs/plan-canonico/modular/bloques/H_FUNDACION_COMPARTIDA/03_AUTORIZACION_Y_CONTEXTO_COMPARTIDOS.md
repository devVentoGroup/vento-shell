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
| migración multi-repositorio y certificación de retiro                          | `SHELL-AUTH-005`  |
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


### [ ] SHELL-AUTH-002 — Implementar adapters de servidor, cliente y proyecciones seguras
### [ ] SHELL-AUTH-003 — Implementar scope por solicitud y registro canónico de consumidores
### [ ] SHELL-AUTH-004 — Implementar lint, métricas y gates contra consumidores legacy
### [ ] SHELL-AUTH-005 — Migrar consumidores de autorización en todos los repositorios

### Módulos internos de contexto

### [ ] SHELL-CTX-001 — Consolidar el módulo de contexto dentro de @vento/os-context
### [ ] SHELL-CTX-002 — Implementar consumo canónico de turno y check-in
### [ ] SHELL-CTX-003 — Implementar proyecciones seguras de sede y área efectivas
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
