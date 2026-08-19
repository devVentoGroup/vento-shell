# VENTO OS — Guía Operativa de Comandos

> **Propósito:** tener en un solo lugar los comandos que necesitas para trabajar con Vento OS sin depender del chat para recordar el flujo Git, las tareas canónicas, los cambios transversales, las validaciones y los diagnósticos básicos.
>
> **Repositorio principal:** `vento-group-sas/vento-shell`
>
> **Rama estable:** `main`
>
> **Fecha de esta guía:** 2026-08-19

---

## 1. La regla más importante

En Vento OS existen **tres tipos de trabajo** y no deben mezclarse.

| Tipo de trabajo                       | Rama        | Comando principal                      |
| ------------------------------------- | ----------- | -------------------------------------- |
| Tarea canónica del plan               | `task/...`  | `docs:task:start` / `docs:task:finish` |
| Cambio transversal de infraestructura | `infra/...` | `docs:infra:publish`                   |
| Documentación operativa no canónica   | `ops/...`   | `docs:ops:publish`                     |

### Mapa mental

```text
¿Voy a trabajar una tarea del Plan Canónico?
|
+-- SI --> docs:task:start
|          trabajo
|          APROBADO
|          docs:task:finish
|
+-- NO --> ¿Es una corrección transversal de scripts, CI, GitHub o tooling?
           |
           +-- SI --> hago los cambios en main sin commit directo
           |          docs:infra:publish
           |
           +-- NO --> ¿Es documentación operativa Markdown directamente en docs/?
                      |
                      +-- SI --> hago el cambio en main sin commit directo
                                 docs:ops:publish
```

**Nunca uses una rama de tarea para esconder una corrección transversal que no pertenece a esa tarea.**

**Nunca hagas un commit directo a `main` para saltarte el flujo.**

---

# 2. Los cuatro comandos que debes memorizar

Estos son los cuatro comandos realmente importantes.

## 2.1 Empezar una tarea canónica

Ejemplo actual:

```powershell
npm run docs:task:start -- --task-id AUTH-SRV-004
```

Este comando debe encargarse de:

```text
main actualizado
-> preflight
-> crear o recuperar task/auth-srv-004
-> publicar la rama
-> comprobar sincronización
-> dejar READY_TO_WORK: SI
```

Solo empiezas a trabajar cuando el resultado final diga:

```text
ESTADO: PASS
READY_TO_WORK: SI
```

---

## 2.2 Cerrar una tarea canónica

Ejemplo:

```powershell
npm run docs:task:finish -- --task-id AUTH-SRV-004
```

Este comando debe encargarse de:

```text
validar tarea APROBADA
-> validar cambios
-> commit
-> push
-> PR
-> esperar checks
-> merge
-> volver a main
-> sincronizar 0/0
-> comprobar worktree limpio
-> eliminar ramas
-> permitir siguiente tarea
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

## 2.3 Publicar un cambio transversal

Ejemplo:

```powershell
npm run docs:infra:publish -- --change-id task-lifecycle-finish-verification
```

Úsalo cuando hayas terminado una tarea o estés en `main` y necesites corregir cosas como:

- scripts de documentación;
- validadores;
- GitHub Actions;
- configuración de calidad;
- package scripts;
- herramientas del lifecycle;
- plantillas operativas;
- automatización transversal.

El comando crea automáticamente una rama:

```text
infra/task-lifecycle-finish-verification
```

y debe realizar:

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
-> eliminar ramas
```

Solo queda cerrado cuando diga:

```text
ESTADO: PASS
MERGE: PASS
SYNC_MAIN: 0/0
WORKTREE: CLEAN
READY_FOR_NEXT_TASK: SI
```

---

## 2.4 Publicar documentación operativa no canónica

Ejemplo:

```powershell
npm run docs:ops:publish -- --change-id guia-operativa-comandos
```

Úsalo exclusivamente para Markdown operativo ubicado **directamente dentro de `docs/`**, por ejemplo:

```text
docs/VENTO_OS_GUIA_OPERATIVA_DE_COMANDOS.md
```

El comando crea automáticamente:

```text
ops/guia-operativa-comandos
```

y ejecuta:

```text
validación local
-> commit aislado
-> push
-> PR a main
-> espera de checks
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

Así se evita mezclar documentación de operación con tareas canónicas, infraestructura o aplicación.

---

# 3. Flujo normal de una tarea

## Paso A — Estás en `main`

Comprueba dónde estás:

```powershell
git branch --show-current
```

Debe mostrar:

```text
main
```

Comprueba el estado:

```powershell
git status --short
```

Antes de comenzar una nueva tarea debería no mostrar nada.

---

## Paso B — Inicias la tarea

Ejemplo:

```powershell
npm run docs:task:start -- --task-id AUTH-SRV-004
```

Comprueba después:

```powershell
git branch --show-current
```

Resultado esperado:

```text
task/auth-srv-004
```

---

## Paso C — Trabajas y validas

Mientras trabajas puedes mirar qué cambió:

```powershell
git status --short
```

Ver el diff:

```powershell
git diff
```

Ver solamente nombres de archivos:

```powershell
git diff --name-only
```

Comprobar problemas de whitespace o conflictos de patch:

```powershell
git diff --check
```

---

## Paso D — La tarea queda APROBADA

Cuando la tarea ya fue revisada y aprobada:

```powershell
npm run docs:task:finish -- --task-id AUTH-SRV-004
```

No empieces la siguiente tarea hasta recibir:

```text
NEXT_TASK_ALLOWED: SI
```

---

# 4. Flujo de un cambio transversal

Este flujo existe para evitar commits directos a `main`.

## Situación típica

Terminaste una tarea, estás en `main` y modificaste:

```text
scripts/docs/task-branch-lifecycle.mjs
scripts/docs/task-branch-lifecycle.test.mjs
package.json
```

No hagas:

```powershell
git commit
```

directamente en `main`.

Haz:

```powershell
npm run docs:infra:publish -- --change-id task-lifecycle-finish-verification
```

El comando debe mover esos cambios a una rama `infra/...` sin perderlos.

---

## Cómo nombrar `change-id`

Usa nombres cortos, descriptivos y en minúsculas.

Buenos ejemplos:

```text
task-lifecycle-finish-verification
required-gate-timeout
docs-validator-fix
windows-npm-portability
owner-path-resolution
```

Evita nombres vagos:

```text
fix
cambio
prueba
cosas
nuevo
```

---

# 4.1 Cuando tienes cambios de dos tipos al mismo tiempo

Si una rama de tarea contiene además un documento operativo, **no mezcles ambos commits**.

Ejemplo:

```text
AUTH-SRV-004 modificada
+
docs/VENTO_OS_GUIA_OPERATIVA_DE_COMANDOS.md
```

Secuencia:

```text
1. apartar temporalmente solo el documento operativo con git stash
2. cerrar la tarea con docs:task:finish
3. recuperar el stash
4. publicar el documento con docs:ops:publish
5. comprobar READY_FOR_NEXT_TASK: SI
6. iniciar la siguiente tarea
```

Comando de ejemplo para apartar únicamente la guía:

```powershell
git stash push -u -m "ops-doc-pendiente" -- docs/VENTO_OS_GUIA_OPERATIVA_DE_COMANDOS.md
```

Después de cerrar la tarea:

```powershell
git stash list
git stash pop
npm run docs:ops:publish -- --change-id guia-operativa-comandos
```

> Si tienes varios stashes, identifica primero el stash correcto con `git stash list` antes de hacer `pop`.

---

# 5. Validaciones del Plan Canónico

No necesitas ejecutar todas siempre. Úsalas cuando estés diagnosticando o verificando una modificación.

## Reconstruir artefactos derivados

```powershell
npm run docs:plan:build
```

Úsalo cuando una tarea o script modifique contenido del plan que tenga artefactos derivados.

---

## Validación estructural del plan

```powershell
npm run docs:plan:check
```

Comprueba múltiples políticas, formatos, sincronización y artefactos del Plan Canónico.

---

## Tests documentales

```powershell
npm run docs:plan:test
```

Es la batería principal de tests del sistema documental.

---

## Validar registro TREQ

```powershell
npm run docs:treq:check
```

Comprueba integridad estructural del registro de requisitos de prueba.

---

## Tests TREQ

```powershell
npm run docs:treq:test
```

Comprueba comportamiento del sistema TREQ.

---

## Validar alcance del commit

```powershell
npm run docs:commit-scope:check -- --staged
```

Se usa **después de stagear archivos** para comprobar que el commit no se sale del alcance autorizado.

---

## Preflight de una tarea

Ejemplo:

```powershell
npm run docs:task:preflight -- --task-id AUTH-SRV-004 --json
```

Sirve para saber, antes de trabajar:

- estado de la tarea;
- propietario;
- continuidad;
- orden canónico;
- si es la tarea actual;
- bloqueos.

---

# 6. Comandos Git que sí debes conocer

## ¿En qué rama estoy?

```powershell
git branch --show-current
```

---

## ¿Qué archivos tengo modificados?

```powershell
git status --short
```

Para una vista más completa:

```powershell
git status
```

---

## ¿Qué cambió?

```powershell
git diff
```

Solo nombres:

```powershell
git diff --name-only
```

---

## ¿Qué está staged?

```powershell
git diff --cached
```

Solo nombres staged:

```powershell
git diff --cached --name-only
```

---

## Ver últimos commits

```powershell
git log --oneline -10
```

---

## Ver HEAD actual

```powershell
git rev-parse HEAD
```

---

## Actualizar referencias remotas

```powershell
git fetch origin
```

Este comando **no modifica tus archivos**. Solo actualiza lo que Git sabe del remoto.

---

## Saber si `main` está sincronizado

Estando en `main`:

```powershell
git fetch origin main
git rev-list --left-right --count HEAD...origin/main
```

Resultado correcto:

```text
0    0
```

Significa:

```text
0 commits detrás
0 commits delante
```

---

# 7. GitHub CLI — comandos que debes conocer

## Comprobar autenticación

```powershell
gh auth status
```

Si falla, los comandos automáticos que crean PR o consultan checks no podrán funcionar.

---

## Ver PR de la rama actual

```powershell
gh pr view
```

---

## Ver estado resumido de PR

```powershell
gh pr status
```

---

## Ver checks de una PR

Ejemplo:

```powershell
gh pr checks
```

Esperar a que terminen:

```powershell
gh pr checks --watch --fail-fast --interval 5
```

> Si GitHub responde `no checks reported`, puede significar simplemente que los workflows todavía no fueron registrados. El lifecycle automatizado debe esperar ese registro antes de considerar el caso un fallo.

---

## Ver información concreta de una PR

Ejemplo:

```powershell
gh pr view 32 --json number,state,headRefName,headRefOid,baseRefName,mergeable
```

---

# 8. Trabajar desde otro computador

GitHub es la fuente compartida.

## Si una tarea ya existe y quieres continuarla en otro PC

No crees la rama manualmente.

Ejecuta de nuevo:

```powershell
npm run docs:task:start -- --task-id AUTH-SRV-004
```

El comando debe detectar que la rama existe y recuperarla.

El resultado debería indicar algo equivalente a:

```text
BRANCH_MODE: RESUMED
READY_TO_WORK: SI
```

---

## Regla importante

Esto sí viaja entre computadores:

```text
commit + push
```

Esto NO viaja:

```text
cambios sin commit
commit local sin push
```

---

# 9. Si `docs:task:start` dice que hay cambios pendientes

Primero:

```powershell
git status --short
```

Luego clasifica los cambios.

### Si pertenecen a una tarea anterior todavía abierta

No abras la siguiente. Termina la tarea anterior.

### Si son una corrección transversal posterior

Usa:

```powershell
npm run docs:infra:publish -- --change-id task-lifecycle-finish-verification
```

con un `change-id` descriptivo del cambio real.

### Si no sabes de dónde salieron

No hagas `git add -A`.

Inspecciona:

```powershell
git diff
```

y decide qué son antes de continuar.

---

# 10. Si `docs:task:finish` falla

La regla general es:

```text
FAIL
!=
repetir todo desde cero
```

Primero identifica:

```text
COMPROBACION_FALLIDA
DETALLE_FALLO
```

---

## Caso: `no checks reported`

Normalmente significa que GitHub todavía no registró los workflows.

El lifecycle nuevo debe manejar esta espera automáticamente.

Puedes inspeccionar manualmente:

```powershell
gh pr status
```

y luego:

```powershell
gh pr checks
```

usando el número real de la PR que produjo el cierre.

---

## Caso: worktree no limpio

```powershell
git status --short
```

No borres nada automáticamente.

---

## Caso: rama incorrecta

```powershell
git branch --show-current
```

`docs:task:finish` debe ejecutarse desde la rama exacta:

```text
task/auth-srv-004
```

---

## Caso: GitHub CLI no autenticado

```powershell
gh auth status
```

---

# 11. Comandos de sintaxis y tests para scripts `.mjs`

Validar sintaxis:

```powershell
node --check scripts/docs/task-branch-lifecycle.mjs
```

Ejecutar su test:

```powershell
node --test scripts/docs/task-branch-lifecycle.test.mjs
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

Para tareas usa:

```text
docs:task:start
docs:task:finish
```

Para infraestructura transversal usa:

```text
docs:infra:publish
```

---

## Evita `git add -A` como hábito

Puede meter archivos que no querías.

Es preferible que los scripts automatizados stageen exactamente el alcance que ya inspeccionaron.

---

## No uses `git push --force` como rutina

Una rama normal de Vento OS no debería requerir force push.

---

## No empieces la siguiente tarea desde la rama anterior

La secuencia correcta siempre es:

```text
task anterior
-> PR
-> merge
-> main
-> main actualizado
-> nueva task
```

Nunca:

```text
task anterior
-> nueva task
```

---

# 13. Cómo pedir ayuda al propio comando

## Lifecycle de tareas

```powershell
npm run docs:task:start -- --help
```

o:

```powershell
npm run docs:task:finish -- --help
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

| Situación                                        | Qué hacer                                                             |
| ------------------------------------------------ | --------------------------------------------------------------------- |
| Voy a comenzar una tarea                         | `docs:task:start`                                                     |
| Terminé y fue aprobada                           | `docs:task:finish`                                                    |
| Cambié tooling/CI/scripts entre tareas           | `docs:infra:publish`                                                  |
| Cambié una guía Markdown directamente en `docs/` | `docs:ops:publish`                                                    |
| Tengo tarea + guía operativa al mismo tiempo     | stash selectivo → `docs:task:finish` → recuperar → `docs:ops:publish` |
| No sé qué archivos están modificados             | `git status --short`                                                  |
| Quiero ver exactamente qué cambié                | `git diff`                                                            |
| Quiero verificar plan                            | `docs:plan:check`                                                     |
| Quiero correr tests documentales                 | `docs:plan:test`                                                      |
| Quiero revisar TREQ                              | `docs:treq:check` + `docs:treq:test`                                  |
| Quiero comprobar PR                              | `gh pr view`                                                          |
| Quiero comprobar checks                          | `gh pr checks`                                                        |
| Quiero saber si main está 0/0                    | `git rev-list --left-right --count HEAD...origin/main`                |
| Trabajo desde otro PC                            | volver a ejecutar `docs:task:start` con el mismo ID                   |

---

# 15. La secuencia que deberías tener en la cabeza

## Tarea normal

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
trabajo + validación
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
validación
   |
   v
PR + checks + merge
   |
   v
main 0/0 + clean
   |
   v
READY_FOR_NEXT_TASK: SI
```

---

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
validación
   |
   v
PR + checks + merge
   |
   v
main 0/0 + clean
   |
   v
READY_FOR_NEXT_TASK: SI
```

---

# 16. Ejemplo completo con la siguiente tarea

Cuando `main` esté limpio y sincronizado:

```powershell
npm run docs:task:start -- --task-id AUTH-SRV-004
```

Cuando `AUTH-SRV-004` haya quedado aprobada:

```powershell
npm run docs:task:finish -- --task-id AUTH-SRV-004
```

Si entre ambas tareas aparece una corrección transversal de infraestructura:

```powershell
npm run docs:infra:publish -- --change-id docs-validator-fix
```

Si el cambio entre tareas es una guía operativa Markdown, usa:

```powershell
npm run docs:ops:publish -- --change-id guia-operativa-comandos
```

Después de que cualquiera de los publishers vuelva a:

```text
main
0/0
CLEAN
```

puedes iniciar la siguiente tarea canónica.

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

¿Hay PR?
gh pr status

¿Checks?
gh pr checks

¿Comienzo tarea?
npm run docs:task:start -- --task-id AUTH-SRV-004

¿Cierro tarea aprobada?
npm run docs:task:finish -- --task-id AUTH-SRV-004

¿Publico corrección transversal?
npm run docs:infra:publish -- --change-id docs-validator-fix
```

---

# 18. Principios operativos

1. **`main` es la línea estable.**
2. **Una tarea = una rama `task/...`.**
3. **Un cambio transversal = una rama `infra/...`.**
4. **Un documento operativo = una rama `ops/...`.**
5. **No se trabaja normalmente directo sobre `main`.**
6. **No se avanza de tarea hasta que el cierre Git lo autorice.**
7. **GitHub, no el chat, es la fuente compartida entre computadores.**
8. **Un FAIL se diagnostica; no se reinicia todo automáticamente.**
9. **No se stagean archivos desconocidos.**
10. **Los checks deben corresponder al mismo SHA que se mergea.**
11. **PASS significa cierre comprobado, no simplemente comando ejecutado.**

---

## Comandos esenciales — versión ultra corta

```powershell
# 1. Empezar tarea
npm run docs:task:start -- --task-id AUTH-SRV-004

# 2. Cerrar tarea aprobada
npm run docs:task:finish -- --task-id AUTH-SRV-004

# 3. Publicar cambio transversal
npm run docs:infra:publish -- --change-id docs-validator-fix

# 4. Publicar documentación operativa
npm run docs:ops:publish -- --change-id guia-operativa-comandos

# 5. Ver estado local
git status --short

# 6. Ver rama
git branch --show-current

# 7. Ver cambios
git diff

# 8. Revisar GitHub
gh pr status
```

Si recuerdas esos ocho, puedes resolver la mayoría del trabajo diario sin memorizar el resto.
