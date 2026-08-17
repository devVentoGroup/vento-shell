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
