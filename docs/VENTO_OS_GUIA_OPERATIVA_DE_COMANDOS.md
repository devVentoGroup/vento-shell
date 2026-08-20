# VENTO OS — Guía Operativa de Comandos

> **Propósito:** tener en un solo lugar los comandos que necesitas para trabajar con Vento OS sin depender del chat para recordar el flujo Git, las tareas canónicas, las implementaciones físicas, los cambios transversales, las validaciones y los diagnósticos básicos.
>
> **Repositorio principal:** `vento-group-sas/vento-shell`
>
> **Rama estable:** `main`
>
> **Fecha de esta guía:** 2026-08-20

---

## 1. La regla más importante

En Vento OS existen **cuatro tipos de trabajo** y no deben mezclarse.

| Tipo de trabajo                       | Rama                 | Comando principal                                          |
| ------------------------------------- | -------------------- | ---------------------------------------------------------- |
| Tarea canónica documental             | `task/...`           | `docs:task:start` / `docs:task:finish`                     |
| Implementación física autorizada      | `implementation/...` | `docs:implementation:start` / `docs:implementation:finish` |
| Cambio transversal de infraestructura | `infra/...`          | `docs:infra:publish`                                       |
| Documentación operativa no canónica   | `ops/...`            | `docs:ops:publish`                                         |

### Mapa mental

```text
¿Voy a desarrollar una tarea documental actual del Plan Canónico?
|
+-- SI --> docs:task:start
|          trabajo documental
|          APROBADO
|          docs:task:finish
|
+-- NO --> ¿Voy a ejecutar una instancia física ya AUTHORIZED?
           |
           +-- SI --> docs:implementation:start
           |          materialización
           |          validation_commands
           |          VERIFIED
           |          docs:implementation:finish
           |
           +-- NO --> ¿Es una corrección transversal de scripts, CI, GitHub, tooling o política transversal?
                      |
                      +-- SI --> hago los cambios en main sin commit directo
                      |          docs:infra:publish
                      |
                      +-- NO --> ¿Es Markdown operativo directamente en docs/?
                                 |
                                 +-- SI --> hago el cambio en main sin commit directo
                                            docs:ops:publish
```

**Nunca uses una rama de tarea para esconder una implementación física o una corrección transversal.**

**Nunca uses `docs:task:start` para una instancia física.**

**Nunca hagas un commit directo a `main` para saltarte el lifecycle.**

---

# 2. Los seis comandos que debes memorizar

## 2.1 Empezar una tarea canónica documental

```powershell
npm run docs:task:start -- --task-id AUTH-SRV-004
```

Debe encargarse de:

```text
main actualizado
-> preflight documental
-> crear o recuperar task/auth-srv-004
-> publicar la rama
-> comprobar sincronización
-> READY_TO_WORK: SI
```

Solo empiezas trabajo documental cuando termine con:

```text
ESTADO: PASS
READY_TO_WORK: SI
```

---

## 2.2 Cerrar una tarea canónica documental

```powershell
npm run docs:task:finish -- --task-id AUTH-SRV-004
```

Debe encargarse de:

```text
validar tarea APROBADA
-> validar cambios
-> commit
-> push
-> PR
-> checks
-> merge del SHA validado
-> volver a main
-> sincronizar 0/0
-> worktree limpio
-> eliminar ramas
-> NEXT_TASK_ALLOWED: SI
```

El cierre solo es válido cuando termina con:

```text
ESTADO: PASS
MERGE: PASS
SYNC_MAIN: 0/0
WORKTREE: CLEAN
NEXT_TASK_ALLOWED: SI
```

**`APROBADO` no sustituye este cierre Git.**

---

## 2.3 Empezar una implementación física

Ejemplo real de instancia global:

```powershell
npm run docs:implementation:start -- --instance-id SHELL-CON-001::GLOBAL
```

Este comando se usa **solo después de que el registro de instancia esté `AUTHORIZED`**.

Debe encargarse de:

```text
validar instancia AUTHORIZED
-> comprobar authorization APPROVED
-> comprobar que el único cambio local sea el registro de la instancia
-> crear o recuperar implementation/shell-con-001/global
-> publicar upstream
-> cambiar la instancia a IN_PROGRESS
-> ejecutar una sola vez el preflight físico estricto
-> READY_TO_IMPLEMENT: SI
```

Resultado esperado:

```text
ESTADO: PASS
OPERACION: IMPLEMENTATION_START
INSTANCE_ID: SHELL-CON-001::GLOBAL
INSTANCE_STATUS: IN_PROGRESS
PREFLIGHT: PASS
READY_TO_IMPLEMENT: SI
```

### Regla crítica

No crees manualmente la rama física con `git switch -c` durante el flujo normal.

No cambies manualmente `AUTHORIZED` a `IN_PROGRESS` antes de llamar el comando: `docs:implementation:start` realiza esa transición.

---

## 2.4 Cerrar una implementación física

Cuando la instancia ya esté `VERIFIED` y conserve evidencia consolidada:

```powershell
npm run docs:implementation:finish -- --instance-id SHELL-CON-001::GLOBAL
```

Debe encargarse de:

```text
validar instancia VERIFIED
-> comprobar evidence
-> exigir rama implementation/shell-con-001/global
-> ejecutar docs:plan:build una sola vez
-> validar paths de implementación
-> git diff --check
-> stage explícito del alcance detectado
-> docs:commit-scope:check --staged
-> commit
-> push
-> PR
-> esperar checks
-> merge del SHA validado
-> volver a main
-> main 0/0
-> worktree limpio
-> eliminar rama local y remota
-> READY_TO_RESTART_WATCHER: SI
```

Resultado esperado:

```text
ESTADO: PASS
OPERACION: IMPLEMENTATION_FINISH
REQUIRED_CHECKS: PASS
MERGE: PASS
SYNC_MAIN: 0/0
WORKTREE: CLEAN
READY_TO_RESTART_WATCHER: SI
```

**El watcher solo se vuelve a encender después de `READY_TO_RESTART_WATCHER: SI`.**

---

## 2.5 Publicar un cambio transversal

Ejemplo:

```powershell
npm run docs:infra:publish -- --change-id task-lifecycle-finish-verification
```

Úsalo desde `main` para cambios transversales como:

- scripts de documentación;
- validadores;
- GitHub Actions;
- configuración de calidad;
- package scripts;
- herramientas del lifecycle;
- automatización transversal;
- archivos que el clasificador de infraestructura admita expresamente.

Crea automáticamente una rama:

```text
infra/task-lifecycle-finish-verification
```

Y debe realizar:

```text
validación
-> rama infra
-> commit
-> push
-> PR
-> checks
-> merge
-> main 0/0
-> worktree limpio
-> eliminación de ramas
```

### Importante sobre archivos transversales del Plan

`commit-scope` puede clasificar determinados archivos del Plan como `TRANSVERSAL`, pero `docs:infra:publish` solo puede publicarlos si `classifyInfraPath()` también los admite expresamente.

Si un archivo transversal legítimo es rechazado por `docs:infra:publish`, **no uses `docs:ops:publish`, no lo mezcles con una tarea y no hagas commit directo a `main`**. Primero se corrige el alcance del publisher transversal.

---

## 2.6 Publicar documentación operativa no canónica

```powershell
npm run docs:ops:publish -- --change-id guia-operativa-comandos
```

Úsalo exclusivamente para Markdown operativo ubicado directamente dentro de `docs/`, por ejemplo:

```text
docs/VENTO_OS_GUIA_OPERATIVA_DE_COMANDOS.md
```

Crea automáticamente:

```text
ops/guia-operativa-comandos
```

Y ejecuta:

```text
validación local
-> commit aislado
-> push
-> PR a main
-> checks
-> merge confirmado
-> main 0/0
-> worktree limpio
-> eliminación de ramas
```

No puede publicar:

```text
docs/plan-canonico/...
scripts/...
src/...
packages/...
supabase/...
```

---

# 3. Flujo normal de una tarea documental

## Paso A — Estás en `main`

```powershell
git branch --show-current
git status --short
```

Antes de comenzar una tarea nueva, `main` debe estar limpio.

## Paso B — Inicias la tarea

```powershell
npm run docs:task:start -- --task-id AUTH-SRV-004
```

La rama esperada es:

```text
task/auth-srv-004
```

## Paso C — Trabajas y validas

```powershell
git status --short
git diff
git diff --name-only
git diff --check
```

## Paso D — La tarea queda APROBADA

```powershell
npm run docs:task:finish -- --task-id AUTH-SRV-004
```

No empieces la siguiente hasta recibir:

```text
NEXT_TASK_ALLOWED: SI
```

---

# 4. Flujo normal de una implementación física

## Paso A — La instancia está lista para autorización

El watcher crea o mantiene el registro de instancia en:

```text
PENDING_AUTHORIZATION
```

La autorización humana debe completar en ese mismo archivo:

- `target_repositories`;
- `authorized_changes`;
- `validation_commands`;
- `authorization.decision = APPROVED`;
- evidencia inicialmente vacía;
- `status = AUTHORIZED`.

## Paso B — Detén el watcher

Si está activo:

```text
Ctrl+C
```

El watcher permanece apagado durante toda la implementación física.

## Paso C — Abre la instancia física

Ejemplo:

```powershell
npm run docs:implementation:start -- --instance-id SHELL-CON-001::GLOBAL
```

Solo continúa cuando diga:

```text
READY_TO_IMPLEMENT: SI
```

El lifecycle deja la instancia en:

```text
IN_PROGRESS
```

## Paso D — Materializas exclusivamente el alcance autorizado

No amplíes el alcance por inferencia.

No uses una tarea posterior para justificar cambios adelantados.

No ejecutes validadores globales por rutina durante esta fase.

## Paso E — Estado `IMPLEMENTED`

Cuando el cambio físico esté materializado, el mismo registro pasa a:

```text
IMPLEMENTED
```

## Paso F — Ejecutas la batería física final

Ejecuta exclusivamente las `validation_commands` registradas en la instancia, en el orden contractual.

No agregues automáticamente:

```text
docs:plan:build
docs:plan:check
docs:plan:test
docs:treq:check
docs:treq:test
```

salvo que una `validation_command` los exija expresamente.

Si falla la batería:

```text
IMPLEMENTED
-> corregir causa dentro del alcance
-> repetir la batería completa
```

No fragmentes el cierre en micro-gates.

## Paso G — Estado `VERIFIED`

Solo después de PASS completo:

```text
VERIFIED
```

Consolida la evidencia en el registro de la instancia.

## Paso H — Cierre físico oficial

```powershell
npm run docs:implementation:finish -- --instance-id SHELL-CON-001::GLOBAL
```

No hagas manualmente commit, push, PR o merge que este comando ya administra.

Solo después de:

```text
READY_TO_RESTART_WATCHER: SI
```

puedes volver a ejecutar:

```powershell
npm run docs:plan:watch
```

---

# 5. Flujo de un cambio transversal

Este flujo existe para evitar commits directos a `main`.

Ejemplo de cambios:

```text
scripts/docs/task-branch-lifecycle.mjs
scripts/docs/task-branch-lifecycle.test.mjs
package.json
```

No hagas un commit manual directo sobre `main`.

Usa:

```powershell
npm run docs:infra:publish -- --change-id task-lifecycle-finish-verification
```

## Cómo nombrar `change-id`

Buenos ejemplos:

```text
task-lifecycle-finish-verification
implementation-branch-lifecycle
docs-validator-fix
windows-npm-portability
owner-path-resolution
```

Evita:

```text
fix
cambio
prueba
cosas
nuevo
```

## 5.1 Cambios de dos tipos al mismo tiempo

No mezcles scopes incompatibles.

Ejemplo:

```text
cambio transversal
+
docs/VENTO_OS_GUIA_OPERATIVA_DE_COMANDOS.md
```

Secuencia recomendada:

```text
1. apartar temporalmente la guía operativa
2. publicar infraestructura con docs:infra:publish
3. volver a main limpio
4. recuperar la guía
5. publicar guía con docs:ops:publish
```

Comando selectivo:

```powershell
git stash push -u -m "ops-doc-pendiente" -- docs/VENTO_OS_GUIA_OPERATIVA_DE_COMANDOS.md
```

Después:

```powershell
git stash list
git stash pop
npm run docs:ops:publish -- --change-id guia-operativa-comandos
```

---

# 6. Validaciones del Plan Canónico

## Reconstruir artefactos derivados

```powershell
npm run docs:plan:build
```

## Validación estructural

```powershell
npm run docs:plan:check
```

## Tests documentales

```powershell
npm run docs:plan:test
```

## Validar registro TREQ

```powershell
npm run docs:treq:check
```

## Tests TREQ

```powershell
npm run docs:treq:test
```

## Validar alcance staged

```powershell
npm run docs:commit-scope:check -- --staged
```

## Preflight documental

```powershell
npm run docs:task:preflight -- --task-id AUTH-SRV-004 --json
```

## Preflight físico

El lifecycle físico lo ejecuta automáticamente durante `docs:implementation:start` con el `instance-id` real y `--strict`.

No lo repitas manualmente por rutina si `IMPLEMENTATION_START` ya terminó con:

```text
PREFLIGHT: PASS
READY_TO_IMPLEMENT: SI
```

---

# 7. Comandos Git que sí debes conocer

## Rama actual

```powershell
git branch --show-current
```

## Archivos modificados

```powershell
git status --short
```

## Diff

```powershell
git diff
```

## Solo nombres

```powershell
git diff --name-only
```

## Staged

```powershell
git diff --cached
git diff --cached --name-only
```

## Últimos commits

```powershell
git log --oneline -10
```

## HEAD

```powershell
git rev-parse HEAD
```

## Fetch

```powershell
git fetch origin
```

## Sincronización de `main`

```powershell
git fetch origin main
git rev-list --left-right --count HEAD...origin/main
```

Resultado correcto:

```text
0    0
```

---

# 8. GitHub CLI — comandos que debes conocer

## Autenticación

```powershell
gh auth status
```

## PR de la rama actual

```powershell
gh pr view
```

## Estado resumido

```powershell
gh pr status
```

## Checks

```powershell
gh pr checks
```

Esperar:

```powershell
gh pr checks --watch --fail-fast --interval 5
```

Si aparece `no checks reported`, puede significar que los workflows todavía no se registraron. Los lifecycle automatizados deben esperar ese registro antes de tratarlo como fallo definitivo.

---

# 9. Trabajar desde otro computador

GitHub es la fuente compartida.

## Continuar una tarea documental

```powershell
npm run docs:task:start -- --task-id AUTH-SRV-004
```

El comando debe recuperar o reutilizar la rama remota existente.

## Continuar una implementación física

Si la instancia sigue en estado compatible con apertura y la rama física existe, el lifecycle puede recuperarla o reutilizarla mediante:

```powershell
npm run docs:implementation:start -- --instance-id SHELL-CON-001::GLOBAL
```

No recrees manualmente `implementation/shell-con-001/global`.

## Regla importante

Esto sí viaja entre computadores:

```text
commit + push
```

Esto no viaja:

```text
cambios sin commit
commit local sin push
```

---

# 10. Si un lifecycle falla

La regla general es:

```text
FAIL
!=
repetir todo desde cero
```

Conserva la rama y el worktree y diagnostica la comprobación concreta.

## `docs:task:start` dice cambios pendientes

```powershell
git status --short
```

No uses `git add -A`.

## `docs:implementation:start` falla

Comprueba especialmente:

- instancia realmente `AUTHORIZED`;
- `authorization.decision = APPROVED`;
- único cambio local = archivo de la instancia;
- `main` 0/0;
- `gh` autenticado.

## `docs:implementation:finish` falla

Comprueba especialmente:

- instancia `VERIFIED`;
- evidencia no vacía;
- rama exacta `implementation/<task>/<instance-key>`;
- paths dentro del alcance automatizable;
- checks del PR;
- mismo SHA validado y mergeado.

## GitHub CLI

```powershell
gh auth status
gh pr status
gh pr checks
```

---

# 11. Comandos de sintaxis y tests para scripts `.mjs`

Lifecycle documental:

```powershell
node --check scripts/docs/task-branch-lifecycle.mjs
node --test scripts/docs/task-branch-lifecycle.test.mjs
```

Lifecycle físico:

```powershell
node --check scripts/docs/implementation-branch-lifecycle.mjs
node --test scripts/docs/implementation-branch-lifecycle.test.mjs
```

---

# 12. Comandos que NO debes usar como rutina

## No hagas commits directos a `main`

Evita:

```powershell
git add .
git commit -m 'cambio'
git push origin main
```

## No abras implementación física con Git manual

Evita como flujo normal:

```powershell
git switch -c implementation/shell-con-001/global
```

Usa:

```powershell
npm run docs:implementation:start -- --instance-id SHELL-CON-001::GLOBAL
```

## Evita `git add -A`

Puede incluir archivos ajenos al alcance.

## No uses `git push --force` como rutina

No forma parte del lifecycle normal.

## No empieces la siguiente tarea desde una rama anterior

Secuencia correcta:

```text
rama actual
-> PR
-> merge
-> main
-> main 0/0
-> siguiente carril
```

---

# 13. Cómo pedir ayuda al propio comando

## Lifecycle documental

```powershell
npm run docs:task:start -- --help
npm run docs:task:finish -- --help
```

## Lifecycle físico

```powershell
npm run docs:implementation:start -- --help
npm run docs:implementation:finish -- --help
```

## Cambios transversales

```powershell
npm run docs:infra:publish -- --help
```

## Documentación operativa

```powershell
npm run docs:ops:publish -- --help
```

---

# 14. Tabla de decisión rápida

| Situación                                        | Qué hacer                                                          |
| ------------------------------------------------ | ------------------------------------------------------------------ |
| Voy a comenzar una tarea documental actual       | `docs:task:start`                                                  |
| La tarea documental quedó APROBADA               | `docs:task:finish`                                                 |
| Una instancia física ya quedó AUTHORIZED         | `docs:implementation:start`                                        |
| La instancia física ya quedó VERIFIED            | `docs:implementation:finish`                                       |
| Cambié tooling/CI/scripts entre tareas           | `docs:infra:publish`                                               |
| Cambié una guía Markdown directamente en `docs/` | `docs:ops:publish`                                                 |
| Tengo scopes incompatibles al mismo tiempo       | separar con stash selectivo y publicar cada scope con su lifecycle |
| No sé qué archivos están modificados             | `git status --short`                                               |
| Quiero ver exactamente qué cambié                | `git diff`                                                         |
| Quiero verificar plan                            | `docs:plan:check`                                                  |
| Quiero correr tests documentales                 | `docs:plan:test`                                                   |
| Quiero revisar TREQ                              | `docs:treq:check` + `docs:treq:test`                               |
| Quiero comprobar PR                              | `gh pr view`                                                       |
| Quiero comprobar checks                          | `gh pr checks`                                                     |
| Quiero saber si main está 0/0                    | `git rev-list --left-right --count HEAD...origin/main`             |

---

# 15. Las secuencias que debes tener en la cabeza

## Tarea documental

```text
main limpio
   |
   v
docs:task:start
   |
   v
task/<id>
   |
   v
trabajo documental + validación
   |
   v
APROBADO
   |
   v
docs:task:finish
   |
   v
PR + checks + merge
   |
   v
main 0/0 + clean
   |
   v
NEXT_TASK_ALLOWED: SI
```

## Implementación física

```text
PENDING_AUTHORIZATION
   |
   v
AUTHORIZED
   |
   v
docs:implementation:start
   |
   v
implementation/<task>/<instance>
   |
   v
IN_PROGRESS
   |
   v
materialización
   |
   v
IMPLEMENTED
   |
   v
validation_commands
   |
   v
VERIFIED
   |
   v
docs:implementation:finish
   |
   v
PR + checks + merge
   |
   v
main 0/0 + clean
   |
   v
READY_TO_RESTART_WATCHER: SI
```

## Cambio transversal

```text
main
   |
   v
modifico tooling
   |
   v
docs:infra:publish
   |
   v
infra/<change-id>
   |
   v
PR + checks + merge
   |
   v
main 0/0 + clean
```

## Documentación operativa

```text
main
   |
   v
modifico docs/*.md operativo
   |
   v
docs:ops:publish
   |
   v
ops/<change-id>
   |
   v
PR + checks + merge
   |
   v
main 0/0 + clean
```

---

# 16. Ejemplo completo de implementación física

Supón que `SHELL-CON-001::GLOBAL` ya está `AUTHORIZED`.

Abres el lifecycle:

```powershell
npm run docs:implementation:start -- --instance-id SHELL-CON-001::GLOBAL
```

Después del PASS:

```text
READY_TO_IMPLEMENT: SI
```

materializas únicamente los cambios autorizados.

Cuando los cambios estén listos:

```text
IMPLEMENTED
-> ejecutar validation_commands
-> PASS
-> VERIFIED
```

Cierras:

```powershell
npm run docs:implementation:finish -- --instance-id SHELL-CON-001::GLOBAL
```

Solo cuando aparezca:

```text
READY_TO_RESTART_WATCHER: SI
```

reactivas:

```powershell
npm run docs:plan:watch
```

---

# 17. Chuleta de emergencia

```text
¿Dónde estoy?
git branch --show-current

¿Qué está cambiado?
git status --short

¿Qué cambió?
git diff

¿Main está sincronizado?
git fetch origin main
git rev-list --left-right --count HEAD...origin/main

¿GitHub funciona?
gh auth status

¿Comienzo tarea documental?
npm run docs:task:start -- --task-id AUTH-SRV-004

¿Cierro tarea documental aprobada?
npm run docs:task:finish -- --task-id AUTH-SRV-004

¿Abro implementación física autorizada?
npm run docs:implementation:start -- --instance-id SHELL-CON-001::GLOBAL

¿Cierro implementación física verificada?
npm run docs:implementation:finish -- --instance-id SHELL-CON-001::GLOBAL

¿Publico corrección transversal?
npm run docs:infra:publish -- --change-id docs-validator-fix

¿Publico guía operativa?
npm run docs:ops:publish -- --change-id guia-operativa-comandos
```

---

# 18. Principios operativos

1. **`main` es la línea estable.**
2. **Una tarea documental = una rama `task/...`.**
3. **Una instancia física = una rama `implementation/...`.**
4. **Un cambio transversal = una rama `infra/...`.**
5. **Un documento operativo = una rama `ops/...`.**
6. **No se trabaja normalmente directo sobre `main`.**
7. **No se usa el lifecycle documental para ejecutar una instancia física.**
8. **Una instancia física requiere autorización explícita antes de abrirse.**
9. **No se avanza de tarea hasta que el cierre correspondiente lo autorice.**
10. **GitHub, no el chat, es la fuente compartida entre computadores.**
11. **Un FAIL se diagnostica; no se reinicia todo automáticamente.**
12. **No se stagean archivos desconocidos.**
13. **Los checks deben corresponder al mismo SHA que se mergea.**
14. **PASS significa cierre comprobado, no simplemente comando ejecutado.**

---

## Comandos esenciales — versión ultra corta

```powershell
# 1. Empezar tarea documental
npm run docs:task:start -- --task-id AUTH-SRV-004

# 2. Cerrar tarea documental
npm run docs:task:finish -- --task-id AUTH-SRV-004

# 3. Empezar implementación física
npm run docs:implementation:start -- --instance-id SHELL-CON-001::GLOBAL

# 4. Cerrar implementación física
npm run docs:implementation:finish -- --instance-id SHELL-CON-001::GLOBAL

# 5. Publicar cambio transversal
npm run docs:infra:publish -- --change-id docs-validator-fix

# 6. Publicar documentación operativa
npm run docs:ops:publish -- --change-id guia-operativa-comandos

# 7. Ver estado local
git status --short

# 8. Ver rama
git branch --show-current

# 9. Ver cambios
git diff

# 10. Revisar GitHub
gh pr status
```

Si recuerdas estos diez comandos, puedes resolver la mayoría del trabajo diario sin memorizar el resto.
