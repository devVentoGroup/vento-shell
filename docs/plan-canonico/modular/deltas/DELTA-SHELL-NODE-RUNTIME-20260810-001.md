# DELTA-SHELL-NODE-RUNTIME-20260810-001 — Runtime reproducible de vento-shell

## Estado

| Campo | Valor |
| --- | --- |
| Estado | `APLICADO_Y_VALIDADO_LOCAL_PENDIENTE_DE_CI_REMOTA` |
| Fecha | 2026-08-10 |
| Aplicación | `shell` |
| Repositorio | `devVentoGroup/vento-shell` |
| Runtime Node | `24.19.0` |
| Gestor de paquetes | `npm@11.17.0` |
| Capacidad nueva | No |
| Proceso nuevo | No |
| Requisito `TREQ-*` nuevo | No |
| Secuencia activa modificada | No |

## Propósito

Fijar el runtime local y de CI de `vento-shell`, eliminar la dependencia del watcher documental respecto de una ruta temporal de `fnm` y materializar parcialmente la obligación existente de runtime reproducible.

## Alcance aplicado

- `.node-version` fija Node `24.19.0`;
- `package.json` declara Node `24.19.0`, npm `11.17.0` y `packageManager`;
- `package-lock.json` conserva la declaración de engines del paquete raíz;
- `.vscode/tasks.json` ejecuta el watcher mediante `fnm exec --using .node-version`;
- `.github/workflows/validate-canonical-plan.yml` consume `.node-version`, usa caché npm e instala con `npm ci` antes de validar;
- el workflow observa cambios en runtime, tarea local, manifest y lockfile.

## Reconciliación canónica

Este delta no reescribe el snapshot aprobado de `SHELL-PKG-004`. Las filas `COMP-BASE-001` y `H-SHELL-PKG-004-005` permanecen como evidencia histórica del corte en el que ninguno de los siete repositorios web declaraba `engines.node`.

A partir de este delta:

1. `vento-shell` deja de estar incluido en la ausencia descrita por `H-SHELL-PKG-004-005`.
2. El hallazgo continúa abierto para VISO, NEXO, FOGO, ORIGO, PULSO y NUMERA.
3. No se declara una banda soportada ni se completa `SHELL-CI-005`; la matriz de compatibilidad de los siete consumidores sigue pendiente.
4. No se modifica ningún `TREQ-SHELL-*`: la cobertura existente de `TREQ-SHELL-005`, `TREQ-SHELL-006`, `TREQ-SHELL-008` y `TREQ-SHELL-009` ya gobierna reproducibilidad, compatibilidad y evidencia.
5. Petapetit no se incorpora a la matriz web de `SHELL-PKG-004`.

## Evidencia local

| Comprobación | Resultado |
| --- | --- |
| `fnm exec --using=.node-version node --version` | `v24.19.0` |
| `fnm exec --using=.node-version npm --version` | `11.17.0` |
| `npm install --package-lock-only --ignore-scripts` | lockfile sincronizado, código de salida `0` |
| `npm ci` | 382 paquetes instalados desde lockfile, código de salida `0` |
| `node --check scripts/docs/watch-plan-canonico.mjs` bajo el runtime fijado | código de salida `0` |
| `npm run build` | build de Next `16.1.1` completado, código de salida `0` |
| `npm run docs:plan:build` | 315 fragmentos y 1.594 tareas canónicas, código de salida `0` |
| `npm run docs:plan:test` | 68 de 68 pruebas aprobadas |
| `npm run docs:treq:test` | 22 de 22 pruebas aprobadas |
| `npm run docs:treq:check` | 7.007 requisitos, 0 duplicados y 0 relaciones no resolubles |
| `npm run docs:plan:check` | continuidad, compilado y contexto vigentes, código de salida `0` |

La instalación reportó seis vulnerabilidades de severidad alta ya presentes en el árbol resuelto. También mantuvo bloqueados, por política de npm 11, scripts de instalación de `sharp@0.33.5`, `sharp@0.34.5` y `unrs-resolver@1.11.1`. Este delta no ejecuta `npm audit fix`, no aprueba scripts automáticamente ni altera dependencias para ocultar avisos; su evaluación permanece separada del cambio de runtime.

## Validación pendiente

- ejecución remota del workflow actualizado después de publicar el cambio.

```text
ACTIVE_SEQUENCE_CHANGED = false
CANONICAL_REQUIREMENTS_CHANGED = false
SHELL_NODE_RUNTIME_DECLARED = true
REMOTE_CI_VERIFIED = false
```
