### PUERTA DE READINESS OPERATIVO

Estas tareas diseñan el checklist que `SHELL-CI-021` ejecutará después de
`SHELL-CI-020` y de las tareas aplicables de BLOQUE R. E5 no exige todavía la
evidencia resultante.

### ✅ READY-GATE-001 — Definir criterio y evidencia para confirmar código desplegado en el entorno objetivo

**Estado:** APROBADA
**Tarea anterior:** DELIV-PKG-025 — Aprobar el paquete antes de iniciar implementación física
**Tarea siguiente:** READY-GATE-002 — Definir criterio y evidencia para confirmar migraciones aplicadas y datos validados
**Tipo de tarea:** Documental — definición normativa del criterio de readiness y del expediente mínimo de evidencia para confirmar que el código de un paquete fue desplegado en el entorno objetivo; sin ejecutar despliegues ni producir evidencia posterior al despliegue

#### 1. Propósito

Definir el criterio verificable y el formato mínimo de evidencia que `SHELL-CI-021::<package_id>` deberá ejecutar para confirmar, después de `SHELL-CI-020::<package_id>` y de las tareas de implementación aplicables, que el código previsto para un paquete se encuentra realmente desplegado en el entorno objetivo aprobado y que la revisión desplegada corresponde de forma inequívoca con la revisión esperada.

Esta tarea diseña el gate. No despliega código, no promueve releases, no modifica ambientes, no consulta ni altera datos productivos, no aplica migraciones y no convierte evidencia planificada en evidencia ejecutada.

#### 2. Alcance y frontera del gate

`READY-GATE-001` responde exclusivamente a esta pregunta:

> ¿La revisión de código que debía desplegarse para este paquete puede correlacionarse de manera reproducible con la revisión que está efectivamente desplegada en el entorno objetivo?

El gate se evalúa por `package_id` y, cuando exista una identidad física materializada, por `implementation_unit_id`. Si un paquete requiere más de un repositorio, artefacto o unidad de despliegue, cada elemento obligatorio deberá quedar correlacionado antes de declarar `PASS` para el paquete.

Este gate no sustituye ni anticipa:

- `READY-GATE-002`: migraciones aplicadas y datos validados;
- `READY-GATE-003`: permisos, matrices y dispositivos configurados;
- `READY-GATE-004`: usuarios, roles, sedes, áreas y turnos requeridos;
- `READY-GATE-005`: catálogos y datos maestros mínimos;
- `READY-GATE-006`: integraciones y credenciales del ambiente;
- `READY-GATE-007`: hardware, red, escáneres e impresoras;
- `READY-GATE-008`: procedimientos operativos y contingencias;
- `READY-GATE-009`: capacitación y material de apoyo;
- `READY-GATE-010`: mesa de soporte, responsables y escalamiento;
- `READY-GATE-011`: monitoreo, métricas y alertas;
- `READY-GATE-012`: respaldo y rollback probados;
- `READY-GATE-013`: línea base previa al piloto;
- `READY-GATE-014`: riesgos aceptados y condiciones de suspensión;
- `READY-GATE-015`: autoridad y criterio final de entrada al piloto.

La existencia de una rama, un commit, un build o una URL por sí solos no demuestra que el código correcto esté desplegado en el entorno objetivo.

#### 3. Contrato de correlación del despliegue

Para cada componente de código que el paquete deba desplegar, la ejecución futura del gate deberá poder demostrar una cadena de correlación completa:

`package_id -> implementation_unit_id cuando exista -> repositorio -> revisión esperada -> artefacto o release -> despliegue -> entorno objetivo -> revisión observada`

La cadena es válida únicamente cuando todos los elementos obligatorios son identificables y la revisión desplegada coincide con la revisión esperada.

##### 3.1. Identidad mínima obligatoria

Cada comprobación deberá registrar, cuando aplique:

| Campo                    | Regla                                                                                           |
| ------------------------ | ----------------------------------------------------------------------------------------------- |
| `package_id`             | Identidad canónica exacta del expediente que se está verificando.                               |
| `implementation_unit_id` | Identidad física materializada cuando exista; no se inventa para paquetes que aún no la tengan. |
| `repository`             | Repositorio propietario exacto del código desplegado.                                           |
| `expected_commit_sha`    | Commit inmutable esperado para el despliegue. Una rama o tag sin resolución a commit no basta.  |
| `deployed_commit_sha`    | Commit inmutable observado en el entorno o en la metadata autoritativa del despliegue.          |
| `artifact_id`            | Identidad del build, release, paquete o artefacto desplegado cuando la plataforma la exponga.   |
| `artifact_digest`        | Digest o hash inmutable cuando la plataforma de artefactos lo exponga.                          |
| `target_environment`     | Ambiente objetivo exacto definido para la instancia del paquete.                                |
| `deployment_id`          | Identificador del despliegue, release o ejecución de pipeline que materializó el artefacto.     |
| `deployed_at`            | Momento verificable del despliegue observado.                                                   |
| `deployer_or_pipeline`   | Actor técnico o pipeline que efectuó el despliegue.                                             |
| `deployed_surface`       | Servicio, aplicación, función, sitio o superficie alcanzable que quedó desplegada.              |
| `verification_method`    | Mecanismo reproducible utilizado para correlacionar revisión esperada y revisión desplegada.    |
| `evidence_refs`          | Referencias a la evidencia reproducible sin incluir secretos.                                   |
| `result`                 | Resultado del componente: `PASS`, `FAIL`, `BLOQUEADO` o `NO_APLICA`.                            |
| `blocking_reason`        | Motivo concreto cuando el resultado no sea `PASS`.                                              |

No todos los proveedores exponen los mismos campos. La ausencia de un campo opcional es válida únicamente si la identidad de la revisión desplegada sigue siendo demostrable mediante evidencia equivalente y reproducible. `expected_commit_sha`, `target_environment`, la identidad del despliegue o artefacto y la correlación con la revisión observada no podrán sustituirse por una afirmación manual.

##### 3.2. Métodos de verificación permitidos

La correlación podrá demostrarse mediante uno o varios mecanismos autoritativos, por ejemplo:

- metadata del proveedor de despliegue que vincule release o deployment con commit;
- manifiesto del artefacto generado por CI que vincule digest, build y commit;
- metadata de runtime o endpoint de versión que exponga una revisión inmutable sin revelar secretos;
- registro de release o pipeline que identifique commit, artefacto y ambiente de destino;
- evidencia equivalente emitida por la plataforma propietaria del despliegue.

Cuando se usen varias fuentes, deberán ser coherentes entre sí. Una divergencia entre el commit esperado, el artefacto publicado y la revisión observada produce `FAIL` o `BLOQUEADO` según exista o no evidencia suficiente para determinar el estado real.

#### 4. Reglas de decisión

##### 4.1. Resultado por componente desplegable

| Resultado   | Condición                                                                                                                                                                                     |
| ----------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `PASS`      | La identidad del repositorio, revisión esperada, artefacto o release, despliegue, ambiente objetivo y revisión observada son correlacionables y coinciden.                                    |
| `FAIL`      | Existe evidencia suficiente y demuestra una revisión distinta, un ambiente distinto, un artefacto distinto, una superficie incorrecta o un despliegue no autorizado para esa instancia.       |
| `BLOQUEADO` | Falta evidencia autoritativa, no puede resolverse la identidad física, el entorno no es accesible para verificación, o no puede correlacionarse de forma reproducible la revisión desplegada. |
| `NO_APLICA` | La identidad canónica del paquete demuestra que no existe cambio físico de código que deba desplegarse para esa instancia.                                                                    |

`NO_APLICA` no puede utilizarse para eludir una identidad física pendiente ni para convertir en inexistente un despliegue requerido por el paquete.

##### 4.2. Resultado agregado por paquete

1. Todo componente de código obligatorio del paquete debe estar representado exactamente una vez en la evaluación del gate.
2. Si al menos un componente obtiene `FAIL`, el paquete obtiene `FAIL` en `READY-GATE-001`.
3. Si no existe `FAIL` pero al menos un componente obtiene `BLOQUEADO`, el paquete obtiene `BLOQUEADO`.
4. El paquete obtiene `PASS` únicamente cuando todos los componentes que requieren despliegue obtienen `PASS` y cualquier `NO_APLICA` está respaldado por la identidad canónica del paquete.
5. Un paquete compuesto exclusivamente por controles sin cambio físico directo podrá obtener `NO_APLICA` cuando esa condición esté demostrada por el expediente aprobado y no exista una operación de despliegue propia.
6. Un resultado parcial nunca se redondea a `PASS`.

#### 5. Evidencia aceptable y evidencia insuficiente

##### 5.1. Evidencia mínima aceptable

La ejecución futura de `SHELL-CI-021::<package_id>` deberá conservar evidencia suficiente para que otra persona pueda repetir la correlación y llegar al mismo resultado. Como mínimo deberá existir:

- identificación del paquete y del ambiente objetivo;
- revisión esperada inmutable;
- identidad del despliegue o del artefacto que llegó al ambiente;
- revisión observada o metadata autoritativa que la vincule con el despliegue;
- fecha y origen de la observación;
- método utilizado;
- resultado por componente y resultado agregado;
- referencia a la evidencia sin exponer credenciales, tokens, secretos ni valores sensibles.

##### 5.2. Evidencia insuficiente por sí sola

No constituye prueba suficiente de despliegue correcto:

- que el código exista en el repositorio;
- que un PR haya sido fusionado;
- que una rama apunte al commit esperado;
- que el build o typecheck local haya pasado;
- que CI haya terminado en verde antes del despliegue;
- que exista un artefacto sin demostrar que fue el desplegado;
- que exista una URL o servicio alcanzable sin identidad de revisión;
- una captura de pantalla sin metadata reproducible;
- una afirmación manual de “deploy exitoso”;
- evidencia de `dev`, local, preview o staging cuando el entorno objetivo sea otro;
- el plan de rollout de `DELIV-PKG-019`;
- la decisión estructural de `DELIV-PKG-025`.

#### 6. Manejo de casos bloqueados y especiales

- Los paquetes que conservan identidad física no confirmada no podrán obtener `PASS` hasta que la reapertura trazable correspondiente materialice la identidad necesaria para correlacionar el despliegue.
- Los paquetes AURA que dependan de repositorio, runtime o frontera física aún no confirmados permanecerán `BLOQUEADO` mientras esa identidad no esté resuelta.
- Las dependencias externas gobernadas no podrán presentarse como desplegadas por inferencia; la condición externa y la identidad física deberán estar materializadas antes de evaluar `PASS`.
- Los paquetes TALENTO fuera de la línea actual no podrán obtener `PASS` mientras la línea funcional no esté formalmente activada y exista una identidad de despliegue evaluable.
- Los expedientes `SIN_CAMBIO_FISICO_DIRECTO_CONFIRMADO` no deberán fabricar un `implementation_unit_id`, un commit desplegado ni una operación de release inexistente; su tratamiento será `NO_APLICA` únicamente cuando el expediente lo sustente.

Todo bloqueo deberá conservar el propietario y la condición de salida ya definidos por el expediente del paquete; `READY-GATE-001` no reasigna propietarios ni reabre decisiones de `DELIV-PKG-001..025`.

#### 7. Separación entre planificación y ejecución

`READY-GATE-001` deja aprobado el contrato que deberá ejecutar posteriormente `SHELL-CI-021::<package_id>`.

La secuencia permanece:

`E5-GATE-008::<package_id> -> SHELL-CI-020::<package_id> -> implementación aplicable -> SHELL-CI-021::<package_id> -> SHELL-CI-022::<package_id>`

Durante `SHELL-CI-021::<package_id>` se capturará la evidencia real, se resolverán discrepancias y se emitirá el resultado operativo del gate. Esta tarea no afirma que ningún paquete haya sido desplegado ni que alguno haya superado readiness.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** `READY-GATE-001` define un criterio documental de evidencia que operacionaliza obligaciones ya registradas sobre disponibilidad verificable, comandos reproducibles, compatibilidad de artefactos y trazabilidad del ambiente desplegado. No introduce ni modifica comportamiento empresarial, autorización, datos, runtime, contrato de integración, regla de cálculo o transición de estado ejecutable.

**Requisitos existentes consumidos:** `TREQ-SHELL-001`, `TREQ-SHELL-005`, `TREQ-SHELL-006` y `TREQ-SHELL-009`.

**Requisitos TREQ-* creados:** 0
**Requisitos TREQ-* modificados:** 0
**Fragmentos 04A afectados:** 0

#### 8. Criterios de aceptación documental

`READY-GATE-001` queda documentalmente completo cuando:

1. existe una regla explícita para correlacionar paquete, repositorio, revisión esperada, artefacto o release, despliegue, ambiente objetivo y revisión observada;
2. el expediente mínimo de evidencia identifica los campos y referencias necesarios sin exigir secretos;
3. `PASS`, `FAIL`, `BLOQUEADO` y `NO_APLICA` tienen condiciones inequívocas;
4. el resultado agregado impide `PASS` parcial cuando falta un componente obligatorio;
5. la evidencia insuficiente está expresamente diferenciada de la evidencia reproducible;
6. los paquetes con identidad física pendiente, AURA, dependencias externas, TALENTO y controles sin cambio físico conservan sus bloqueos o tratamiento heredado sin inventar despliegues;
7. la ejecución y captura de evidencia real permanecen asignadas a `SHELL-CI-021::<package_id>` después de la implementación correspondiente;
8. no se ejecuta código, despliegue, migración, DDL, DML, backfill, cambio de configuración remota ni modificación de Supabase;
9. no se crean ni modifican requisitos `TREQ-*` ni fragmentos del registro 04A;
10. `READY-GATE-002` permanece reservada y no se anticipa su criterio de migraciones o validación de datos.

#### 9. Continuidad canónica

##### ÚLTIMA TAREA APROBADA
DELIV-PKG-025 — Aprobar el paquete antes de iniciar implementación física

##### TAREA ACTUAL APROBADA
READY-GATE-001 — Definir criterio y evidencia para confirmar código desplegado en el entorno objetivo

##### SIGUIENTE TAREA RESERVADA
READY-GATE-002 — Definir criterio y evidencia para confirmar migraciones aplicadas y datos validados


### [ ] READY-GATE-002 — Definir criterio y evidencia para confirmar migraciones aplicadas y datos validados
### [ ] READY-GATE-003 — Definir criterio y evidencia para confirmar permisos, matrices y dispositivos configurados
### [ ] READY-GATE-004 — Definir criterio y evidencia para confirmar usuarios, roles, sedes, áreas y turnos requeridos
### [ ] READY-GATE-005 — Definir criterio y evidencia para confirmar catálogos y datos maestros mínimos
### [ ] READY-GATE-006 — Definir criterio y evidencia para confirmar integraciones y credenciales del ambiente
### [ ] READY-GATE-007 — Definir criterio y evidencia para confirmar hardware, red, escáneres e impresoras
### [ ] READY-GATE-008 — Definir criterio y evidencia para confirmar procedimientos operativos y contingencias
### [ ] READY-GATE-009 — Definir criterio y evidencia para confirmar capacitación y material de apoyo
### [ ] READY-GATE-010 — Definir criterio y evidencia para confirmar mesa de soporte, responsables y escalamiento
### [ ] READY-GATE-011 — Definir criterio y evidencia para confirmar monitoreo, métricas y alertas
### [ ] READY-GATE-012 — Definir criterio y evidencia para confirmar respaldo y rollback probados
### [ ] READY-GATE-013 — Definir método y evidencia para capturar la línea base previa al piloto
### [ ] READY-GATE-014 — Definir registro de riesgos aceptados y condiciones de suspensión
### [ ] READY-GATE-015 — Definir autoridad y criterio para aprobar la entrada al piloto operativo

Salida obligatoria:

```text
READY-CHECKLIST APROBADO EN E5
        ↓
IMPLEMENTACIÓN DEL PAQUETE — SHELL-CI-020 + BLOQUE R APLICABLE
        ↓
EJECUCIÓN DEL CHECKLIST — SHELL-CI-021
        ↓
ENTRADA O SUSPENSIÓN DEL PILOTO
```
