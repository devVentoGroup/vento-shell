### MINI-BLOQUE — MIGRACIÓN COORDINADA DE CONSUMIDORES WEB

<!-- PLAN-SECTION-META:START -->
Esta sección organiza la adopción progresiva de contratos, componentes y paquetes compartidos por los consumidores web. No autoriza una migración masiva ni simultánea: cada aplicación conserva su lote, evidencia, compatibilidad y rollback.

**Cobertura canónica:** `SHELL-MIG-001` a `SHELL-MIG-008` — 8 tareas.

**Resultado esperado:** los consumidores web abandonan copias legacy mediante lotes reversibles, conservan extensiones locales válidas y demuestran paridad antes de retirar artefactos anteriores.

**Puerta de entrada del mini-bloque:** contratos, paquetes y componentes involucrados aprobados; inventario de consumidores vigente; paquete de cambio identificado.

**Puerta de salida del mini-bloque:** cero consumidores legacy no autorizados, evidencia por repositorio, rollback probado y retiro ejecutado únicamente para identidades aprobadas.
<!-- PLAN-SECTION-META:END -->

### [ ] SHELL-MIG-001 — Consolidar inventario ejecutable de consumidores

**Propósito:** transformar los consumidores y extensiones detectados por `SHELL-AUD-001..011` en una matriz ejecutable por repositorio, identidad, propietario y paquete de cambio.

**Dependencias:** `SHELL-AUD-011`; `SHELL-PKG-001`; familias y contratos propietarios aprobados.

**Puerta de cierre:** cada consumidor directo, dinámico, de framework, CI o script tiene disposición, lote, evidencia esperada y rollback; no quedan destinos genéricos.

### [ ] SHELL-MIG-002 — Definir lotes reversibles por repositorio

**Propósito:** ordenar la adopción por aplicación sin exigir despliegue simultáneo y separar artefactos inertes de legacy consumido.

**Dependencias:** `SHELL-MIG-001`; `SHELL-PKG-004`; `SHELL-PKG-006`; `SHELL-PKG-008`.

**Puerta de cierre:** cada lote declara precondiciones, cambios, consumidores, pruebas, observabilidad, rollback y criterio de suspensión.

### [ ] SHELL-MIG-003 — Preparar compatibilidad y bloqueo de nuevos consumidores legacy

**Propósito:** habilitar adapters o compatibilidad temporal solo donde exista consumo real y evitar nuevas dependencias sobre copias deprecadas.

**Dependencias:** `SHELL-MIG-002`; `SHELL-PKG-003`; `SHELL-PKG-005`; tareas `SHELL-CON-*`, `SHELL-DB-*`, `SHELL-UI-*` o `SHELL-AUTH-*` propietarias.

**Puerta de cierre:** compatibilidad versionada, deprecaciones observables y gate automático contra nuevos consumidores legacy.

### [ ] SHELL-MIG-004 — Sustituir la plantilla histórica por scaffold versionado

**Propósito:** impedir que la plantilla AppShell vuelva a copiar implementaciones desfasadas y hacer que instale o genere dependencias aprobadas.

**Dependencias:** `SHELL-MIG-003`; `SHELL-PKG-001`; `SHELL-PKG-003`; `SHELL-PKG-004`; `SHELL-UI-010`.

**Puerta de cierre:** scaffold reproducible, sin fuente runtime duplicada, con versiones fijadas, configuración explícita y rollback documentado.

### [ ] SHELL-MIG-005 — Migrar componentes, Chrome y estilos por aplicación

**Propósito:** adoptar componentes compartidos preservando navegación, responsividad, tema y extensiones empresariales legítimas de cada consumidor.

**Dependencias:** `SHELL-MIG-003`; `SHELL-UI-001`; `SHELL-UI-010`; `SHELL-UI-011`; contratos requeridos aprobados.

**Puerta de cierre:** cada aplicación usa APIs compartidas aprobadas, mantiene locales únicamente sus extensiones declaradas y conserva rollback por repositorio.

### [ ] SHELL-MIG-006 — Verificar accesibilidad, tema y movimiento reducido

**Propósito:** demostrar que la migración conserva tokens, contraste, foco, teclado, motion-reduction, densidad y comportamiento responsive aplicables.

**Dependencias:** `SHELL-MIG-005`; `SHELL-PKG-006`; `SHELL-PKG-008`.

**Puerta de cierre:** matriz de accesibilidad y paridad visual aprobada por aplicación, sin depender de CSS legacy no declarado.

### [ ] SHELL-MIG-007 — Ejecutar pruebas de paridad de consumidores

**Propósito:** comparar API TypeScript, comportamiento, rutas, clases, estados y fallos antes y después de cada lote.

**Dependencias:** `SHELL-MIG-005`; `SHELL-MIG-006`; `SHELL-CI-001`; `SHELL-CI-007` a `SHELL-CI-013`.

**Puerta de cierre:** pruebas contractuales y operativas aprobadas, evidencia atribuible al commit y paquete de cambio, y rollback ensayado.

### [ ] SHELL-MIG-008 — Retirar copias legacy y certificar adopción

**Propósito:** retirar únicamente artefactos aprobados cuyo consumo sea cero o cuyos consumidores ya hayan migrado con paridad demostrada.

**Dependencias:** `SHELL-MIG-007`; `SHELL-PKG-007`; `SHELL-PKG-008`; decisiones de `SHELL-AUD-011`.

**Puerta de cierre:** cero consumidores legacy no autorizados, artefactos retirados registrados, builds aprobados y rollback reproducible por repositorio.
