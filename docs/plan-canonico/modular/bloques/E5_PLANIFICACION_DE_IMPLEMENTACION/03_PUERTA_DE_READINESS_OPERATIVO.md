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


### ✅ READY-GATE-002 — Definir criterio y evidencia para confirmar migraciones aplicadas y datos validados

**Estado:** APROBADA
**Tarea anterior:** READY-GATE-001 — Definir criterio y evidencia para confirmar código desplegado en el entorno objetivo
**Tarea siguiente:** READY-GATE-003 — Definir criterio y evidencia para confirmar permisos, matrices y dispositivos configurados
**Tipo de tarea:** Documental — definición normativa del criterio de readiness y del expediente mínimo de evidencia para confirmar que las migraciones requeridas por un paquete fueron aplicadas en el entorno objetivo y que los datos afectados quedaron reconciliados y validados; sin ejecutar migraciones, DDL/DML, backfills ni consultas operativas sobre ambientes remotos

#### 1. Propósito

Definir el criterio verificable y el formato mínimo de evidencia que `SHELL-CI-021::<package_id>` deberá ejecutar para confirmar, después de `SHELL-CI-020::<package_id>` y de las tareas aplicables de BLOQUE R, que:

1. el conjunto exacto de migraciones requerido por el paquete fue aplicado en el entorno objetivo correcto;
2. las migraciones aplicadas corresponden a artefactos versionados, atribuibles e inmutables;
3. no existen omisiones, sustituciones silenciosas ni drift no aprobado respecto de la definición esperada;
4. cualquier backfill, transformación o movimiento de datos incluido en el paquete produjo resultados reconciliables con su baseline y sus invariantes;
5. la evidencia posterior permite distinguir con precisión qué se aplicó, qué datos fueron afectados, qué validaciones pasaron, cuáles fallaron y cuáles no aplican.

Esta tarea diseña el gate. No ejecuta `supabase db push`, DDL, DML, backfills, restauraciones, normalizaciones, consultas productivas ni cambios remotos. Tampoco convierte evidencia planificada en evidencia ejecutada.

#### 2. Alcance y frontera del gate

`READY-GATE-002` responde exclusivamente a esta pregunta:

> ¿Las migraciones y transformaciones de datos que el paquete debía materializar fueron aplicadas exactamente en el entorno objetivo y existe evidencia reproducible de que el estado resultante de esquema y datos satisface las validaciones previstas?

El gate se evalúa por `package_id` y por cada unidad de migración, backfill o transformación materializada dentro del paquete.

No sustituye ni anticipa:

- `READY-GATE-001`: correlación del código realmente desplegado;
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

La existencia de un archivo de migración, una fila en historial, un comando terminado con código cero o una captura del dashboard no demuestra por sí sola que la migración correcta se aplicó en el ambiente correcto ni que los datos resultantes sean válidos.

#### 3. Fuentes vinculantes para determinar aplicabilidad

La ejecución futura del gate deberá derivar el alcance esperado exclusivamente de las decisiones canónicas y del paquete aprobado. Como mínimo deberá reconciliar, cuando apliquen:

- `DELIV-PKG-008` para objetos Supabase afectados;
- `DELIV-PKG-009` para migraciones, DDL/DML, backfills, compatibilidad y retiro legacy previstos;
- `DELIV-PKG-014` y `DELIV-PKG-015` para archivos físicos, dependencias, bloqueos y orden de aplicación;
- `DELIV-PKG-016` para requisitos `TREQ-*`, pruebas, fixtures, comandos y evidencia esperada;
- `DELIV-PKG-019` para ambiente, secuencia de rollout y promoción;
- `DELIV-PKG-020` para rollback técnico, funcional y de datos;
- `DELIV-PKG-023` para criterios de aceptación y manifiesto de evidencia;
- `DELIV-PKG-025` para la decisión final del expediente y la unidad física autorizada;
- `SUPA-TRANS-001..016` y `DATA-NORM-TRANS-001..009` cuando el paquete afecte Supabase o normalización;
- las tareas de BLOQUE R realmente incluidas en el mismo `package_id`.

`READY-GATE-002` no crea una migración nueva ni cambia el alcance de una migración ya definida. Si la ejecución detecta que el conjunto esperado no puede determinarse desde el expediente aprobado, el resultado es `BLOQUEADO` y la discrepancia debe volver a la tarea propietaria exacta del paquete.

#### 4. Clasificación obligatoria de aplicabilidad

Cada paquete deberá caer en una de las siguientes clases, sin usar categorías ambiguas:

| Clase                               | Condición                                                                                                                                 | Evaluación requerida                                                                     |
| ----------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| `NO_DATABASE_CHANGE`                | El expediente aprobado demuestra que no existe cambio físico de esquema, objeto Supabase, migración, backfill ni transformación de datos. | El gate puede cerrar `NO_APLICA` con evidencia documental del expediente.                |
| `MIGRATION_ONLY`                    | Existe cambio físico versionado sin transformación material de datos existentes.                                                          | Debe validarse identidad, orden, aplicación, drift e integridad estructural.             |
| `MIGRATION_AND_DATA_CHANGE`         | Existen migraciones y además backfill, normalización, recálculo, traslado o transformación de datos existentes.                           | Deben validarse migraciones y reconciliación completa de datos.                          |
| `DATA_CHANGE_WITHOUT_SCHEMA_CHANGE` | Existe backfill o transformación versionada sin cambio de esquema.                                                                        | Debe validarse identidad de la operación, baseline, lotes, reconciliación e invariantes. |

`NO_DATABASE_CHANGE` no puede utilizarse para ocultar una migración pendiente, una modificación manual del remoto, un backfill necesario ni una identidad física sin resolver.

#### 5. Contrato de identidad de migraciones

Para cada migración requerida, la ejecución futura deberá demostrar una cadena de identidad completa:

`package_id -> unidad de migración -> archivo versionado -> checksum o digest -> orden esperado -> ejecución -> entorno objetivo -> registro observado -> estado posterior`

##### 5.1. Campos mínimos por migración

| Campo                       | Regla                                                                                                           |
| --------------------------- | --------------------------------------------------------------------------------------------------------------- |
| `package_id`                | Identidad canónica exacta del expediente evaluado.                                                              |
| `implementation_unit_id`    | Unidad física cuando exista y sea aplicable.                                                                    |
| `migration_id`              | Identidad estable de la migración o unidad de cambio.                                                           |
| `migration_path`            | Ubicación versionada en el repositorio propietario. Toda migración Supabase de VENTO pertenece a `vento-shell`. |
| `migration_digest`          | Hash o digest inmutable del contenido efectivamente evaluado.                                                   |
| `expected_order`            | Posición o dependencia esperada dentro del conjunto del paquete.                                                |
| `target_environment`        | Ambiente exacto contra el cual se evalúa el gate.                                                               |
| `target_project_ref`        | Identidad técnica del proyecto Supabase cuando aplique, sin exponer secretos.                                   |
| `expected_candidate_commit` | Commit que contiene el conjunto autorizado de migraciones.                                                      |
| `observed_migration_record` | Registro autoritativo observado en el historial del entorno.                                                    |
| `observed_applied_at`       | Momento verificable de aplicación cuando la plataforma lo exponga.                                              |
| `execution_id`              | Ejecución de CI, pipeline o procedimiento controlado que aplicó el cambio.                                      |
| `drift_result`              | Resultado de comparar estado esperado y estado observado.                                                       |
| `evidence_refs`             | Referencias reproducibles a logs, reportes, manifiestos o consultas read-only.                                  |
| `result`                    | `PASS`, `FAIL`, `BLOQUEADO` o `NO_APLICA`.                                                                      |
| `blocking_reason`           | Motivo concreto cuando el resultado no sea `PASS`.                                                              |

##### 5.2. Regla especial Supabase

Toda modificación de Supabase perteneciente a VENTO deberá ser reproducible desde `vento-shell`.

Para obtener `PASS`:

1. la migración deberá existir versionada en `vento-shell`;
2. su digest deberá corresponder al candidato autorizado;
3. el historial observado del entorno deberá demostrar que fue aplicada;
4. la secuencia observada deberá ser compatible con el orden aprobado;
5. el estado resultante no podrá contener drift no aprobado respecto del repositorio;
6. cualquier cambio manual detectado en Dashboard, Table Editor, SQL Editor u otra herramienta deberá estar convertido en una migración versionada antes de cerrar el gate.

Un cambio remoto correcto pero no reproducible desde `vento-shell` no puede recibir `PASS`.

#### 6. Reglas de decisión para migraciones

##### 6.1. Resultado por unidad de migración

| Resultado   | Condición                                                                                                                                                                                                                    |
| ----------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `PASS`      | La migración esperada es identificable, está versionada en el repositorio correcto, su digest coincide, fue aplicada en el entorno objetivo, respeta el orden requerido y el estado posterior no presenta drift no aprobado. |
| `FAIL`      | Existe evidencia suficiente de omisión, migración distinta, digest distinto, orden inválido, entorno incorrecto, aplicación fallida, cambio remoto no versionado o drift contrario al estado esperado.                       |
| `BLOQUEADO` | No puede determinarse de forma reproducible el conjunto esperado, la identidad del entorno, el historial aplicado, el digest, el orden o el estado de drift.                                                                 |
| `NO_APLICA` | El expediente aprobado demuestra que la unidad no requiere migración física en esa instancia.                                                                                                                                |

##### 6.2. Reglas adicionales

1. Una migración presente en el repositorio pero ausente del entorno produce `FAIL` cuando el entorno es verificable.
2. Una migración observada en el entorno pero ausente del conjunto autorizado produce `FAIL` hasta que su procedencia y gobierno sean reconciliados.
3. Un mismo identificador con digest diferente entre repositorio y entorno produce `FAIL`.
4. Una secuencia aplicada fuera del orden aprobado produce `FAIL` cuando cambia precondiciones, dependencias o resultado material.
5. Si el historial remoto no es accesible o no permite correlación suficiente, el resultado es `BLOQUEADO`, nunca `PASS` por inferencia.
6. Un comando `db push`, `migrate`, `psql` o equivalente terminado con éxito no sustituye la comprobación del historial y del estado posterior.

#### 7. Contrato de validación de datos

Cuando el paquete incluya backfill, normalización, recálculo, movimiento, deduplicación, corrección, cambio de claves, transformación de relaciones o cualquier otra modificación de datos existentes, la ejecución futura deberá conservar un expediente que permita reconciliar el antes y el después.

##### 7.1. Identidad mínima de una operación de datos

| Campo                     | Regla                                                                  |
| ------------------------- | ---------------------------------------------------------------------- |
| `data_change_id`          | Identidad estable de la operación o lote.                              |
| `package_id`              | Paquete responsable de la transformación.                              |
| `target_environment`      | Ambiente exacto donde se ejecutó.                                      |
| `candidate_commit`        | Commit o versión del algoritmo, SQL o procedimiento aplicado.          |
| `rule_version`            | Versión de la regla de transformación cuando aplique.                  |
| `baseline_ref`            | Referencia al baseline previo utilizado para comparar.                 |
| `source_scope`            | Entidades, tablas, filtros y población elegible.                       |
| `attempted_rows`          | Filas o unidades intentadas.                                           |
| `affected_rows`           | Filas o unidades efectivamente modificadas.                            |
| `skipped_rows`            | Filas excluidas de forma prevista, con causa clasificable.             |
| `failed_rows`             | Filas que no pudieron procesarse correctamente.                        |
| `before_digest_or_counts` | Conteos, checksums o métricas previas suficientes para reconciliación. |
| `after_digest_or_counts`  | Conteos, checksums o métricas posteriores equivalentes.                |
| `reconciliation_result`   | Resultado de la conciliación de la operación.                          |
| `validation_bundle_ref`   | Evidencia reproducible de las validaciones posteriores.                |
| `result`                  | `PASS`, `FAIL`, `BLOQUEADO` o `NO_APLICA`.                             |

##### 7.2. Carriles mínimos de validación post-cambio

La evidencia deberá cubrir los carriles aplicables al cambio, sin reemplazar uno por otro:

1. **Integridad estructural:** constraints, PK, FK, UNIQUE, CHECK, nullability y tipos relevantes permanecen satisfechos.
2. **Reconciliación cuantitativa:** conteos y balances explican de forma determinista entradas, salidas, omitidos y fallidos.
3. **Huérfanos y duplicados:** no aparecen relaciones huérfanas ni duplicados prohibidos como consecuencia del cambio.
4. **Invariantes de negocio:** cantidades, costos, estados, relaciones, identidades y demás reglas protegidas por los `TREQ-*` del paquete conservan el resultado esperado.
5. **Transformación semántica:** normalizaciones o backfills producen exactamente las reglas versionadas y preservan excepciones aprobadas.
6. **Consumidores afectados:** las estructuras o datos producidos siguen siendo compatibles con consumidores incluidos en el paquete.
7. **Idempotencia y reejecución cuando aplique:** una operación diseñada para ser reintentable no duplica efectos ni altera resultados ya correctos.
8. **Drift posterior:** el estado de esquema, objetos y datos de control relevante coincide con el candidato aprobado o con una excepción explícita ya autorizada.

Las pruebas conductuales completas de permisos y RLS permanecen gobernadas por sus tareas y gates propietarios. `READY-GATE-002` solo exige aquí que las migraciones no dejen constraints, políticas, funciones o contratos estructurales en un estado materialmente incompleto cuando dichos objetos formen parte del cambio evaluado.

#### 8. Reglas de decisión para datos

| Resultado   | Condición                                                                                                                                                                                                                  |
| ----------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `PASS`      | Existe baseline suficiente, el alcance de datos está identificado, todos los lotes están contabilizados, las validaciones aplicables pasan y la reconciliación explica el resultado sin pérdidas ni efectos no atribuidos. |
| `FAIL`      | La evidencia demuestra pérdida, corrupción, huérfanos, duplicados prohibidos, filas fallidas no aceptadas, transformación distinta de la regla aprobada, conteos irreconciliables o una invariante crítica incumplida.     |
| `BLOQUEADO` | Falta baseline, no puede determinarse el universo afectado, no existe trazabilidad por lote, la evidencia es incompleta o el acceso autorizado no permite comprobar el resultado.                                          |
| `NO_APLICA` | El expediente demuestra que la instancia no modifica datos existentes.                                                                                                                                                     |

No se permite convertir filas no contabilizadas en `skipped_rows` sin una causa definida y verificable.

#### 9. Resultado agregado por paquete

El resultado de `READY-GATE-002::<package_id>` se calcula de forma estricta:

1. cada migración obligatoria aparece exactamente una vez en la evaluación;
2. cada backfill o transformación obligatoria aparece exactamente una vez;
3. si alguna unidad obtiene `FAIL`, el paquete obtiene `FAIL`;
4. si no existe `FAIL` pero alguna unidad obtiene `BLOQUEADO`, el paquete obtiene `BLOQUEADO`;
5. el paquete obtiene `PASS` únicamente cuando todas las unidades aplicables obtienen `PASS` y cualquier `NO_APLICA` está sustentado por el expediente aprobado;
6. un paquete sin ninguna operación de migración ni cambio de datos puede obtener `NO_APLICA` solo cuando `DELIV-PKG` lo demuestre explícitamente;
7. un resultado parcial, un subconjunto de tablas o una muestra no representativa no se redondean a `PASS`.

#### 10. Evidencia aceptable

La ejecución futura podrá usar evidencia emitida por mecanismos autoritativos y reproducibles, entre ellos:

- historial de migraciones del entorno correlacionado con los archivos versionados;
- digests del conjunto de migraciones y del candidato de código;
- ejecución de CI o pipeline que identifique paquete, commit y ambiente;
- reconstrucción limpia o upgrade controlado cuando forme parte de la prueba del paquete;
- reportes de drift entre el estado esperado y el observado;
- consultas read-only versionadas para constraints, conteos, huérfanos, duplicados e invariantes;
- manifiestos de backfill con lotes, filas intentadas, afectadas, omitidas y fallidas;
- reportes de reconciliación antes/después;
- resultados de pruebas de migración y de base de datos vinculadas a `TREQ-*`;
- referencias a evidencia ambiental aprobada por las autoridades aplicables.

La evidencia deberá registrar fecha, ambiente, origen, método, candidato, resultado y referencias durables. No deberá almacenar credenciales, connection strings, service role, JWT, secretos ni datos sensibles completos.

#### 11. Evidencia insuficiente por sí sola

No constituye prueba suficiente:

- que el archivo SQL exista;
- que el nombre de la migración aparezca en una lista sin correlación de digest;
- que una migración haya pasado en local cuando el gate evalúa staging o producción;
- que `db push` o una pipeline terminen en verde sin postvalidación;
- una captura del dashboard sin identidad reproducible del ambiente y del candidato;
- un conteo posterior sin baseline comparable;
- una muestra manual sin población, regla ni criterio definidos;
- una consulta que solo demuestre que la tabla existe;
- asumir que cero errores de ejecución equivale a datos correctos;
- un cambio manual remoto no materializado en `vento-shell`;
- el plan documental de `DELIV-PKG-009`, `DELIV-PKG-016`, `SUPA-TRANS` o `DATA-NORM-TRANS` sin evidencia de ejecución física.

#### 12. Manejo de casos especiales

##### 12.1. Migraciones destructivas o irreversibles

Una migración destructiva no obtiene `PASS` únicamente porque haya sido aplicada. Debe conservar evidencia de las precondiciones de seguridad y de las validaciones posteriores definidas por el paquete. La demostración completa de backup, restore y rollback pertenece a `READY-GATE-012`; cualquier requisito pendiente de ese gate debe permanecer visible y no puede ocultarse dentro de `READY-GATE-002`.

##### 12.2. Backfills por lotes

Los backfills por lotes deben permitir reconciliar la suma de resultados por lote contra el universo objetivo. Un lote perdido, repetido sin idempotencia o sin estado final atribuible produce `FAIL` o `BLOQUEADO` según la evidencia disponible.

##### 12.3. Escrituras concurrentes

Cuando existan writers activos durante la transición, la evidencia deberá demostrar la estrategia aprobada de compatibilidad, dual-write, congelación, reintento o conciliación. No se presume que una migración consistente en reposo sea válida bajo concurrencia.

##### 12.4. Normalización de datos

Cuando aplique `DATA-NORM-DB`, el gate deberá conservar la trazabilidad definida por `DATA-NORM-TRANS-001..009`: baseline, dry-run, colisiones, lotes reversibles, activación, validación post-backfill, recuperación y expediente por dominio. Una aprobación documental previa no equivale a evidencia operacional.

##### 12.5. Cambios sin migración Supabase

Si un paquete modifica datos de un sistema externo o de una plataforma no propietaria de VENTO, el gate solo evaluará la operación cuando el paquete la incluya expresamente como cambio controlado y exista evidencia autorizada. No se inventarán historiales ni controles equivalentes que el sistema externo no exponga.

#### 13. Separación entre planificación y ejecución

`READY-GATE-002` deja definido el contrato que `SHELL-CI-021::<package_id>` deberá ejecutar después de que `SHELL-CI-020::<package_id>` y las tareas aplicables de BLOQUE R hayan materializado las migraciones y cambios de datos del paquete.

La secuencia permanece:

`E5-GATE-008::<package_id> -> SHELL-CI-020::<package_id> -> BLOQUE R aplicable -> SHELL-CI-021::<package_id> -> SHELL-CI-022::<package_id>`

Durante `SHELL-CI-021::<package_id>` se capturará la evidencia real, se resolverán discrepancias y se emitirá el resultado operativo. Esta tarea no afirma que ninguna migración haya sido aplicada ni que ningún conjunto de datos haya sido validado.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** `READY-GATE-002` define el criterio documental de evidencia para obligaciones de migración, reproducibilidad ambiental, validación de datos, drift y rollback que ya están registradas. No introduce una nueva regla empresarial ni un comportamiento ejecutable adicional; operacionaliza requisitos existentes para su ejecución posterior por paquete.

**Requisitos existentes consumidos:** `TREQ-SUPABASE-008`, `TREQ-SHELL-007` y `TREQ-SHELL-009`.

**Requisitos TREQ-* creados:** 0
**Requisitos TREQ-* modificados:** 0
**Fragmentos 04A afectados:** 0

#### 14. Criterios de aceptación documental

`READY-GATE-002` queda documentalmente completo cuando:

1. define cómo determinar el conjunto exacto de migraciones y operaciones de datos esperadas por paquete;
2. exige identidad de archivo versionado, digest, orden, ambiente, ejecución e historial observado para cada migración;
3. establece que toda migración Supabase de VENTO debe ser reproducible desde `vento-shell`;
4. define `PASS`, `FAIL`, `BLOQUEADO` y `NO_APLICA` para migraciones y datos sin ambigüedad;
5. impide `PASS` cuando existe drift no aprobado, cambio remoto no versionado, migración faltante o digest divergente;
6. exige baseline, contabilización por lote y reconciliación antes/después para cambios de datos;
7. cubre integridad estructural, huérfanos, duplicados, invariantes, transformación semántica, consumidores, idempotencia y drift posterior cuando apliquen;
8. diferencia evidencia reproducible de señales insuficientes como archivo existente, pipeline verde o screenshot;
9. mantiene el backup/restore/rollback probado en `READY-GATE-012` y no invade `READY-GATE-003` ni gates posteriores;
10. mantiene ejecución y captura de evidencia real en `SHELL-CI-021::<package_id>` después de `SHELL-CI-020` y BLOQUE R;
11. no ejecuta DDL, DML, backfills, migraciones, consultas productivas ni modificaciones de Supabase;
12. no crea ni modifica requisitos `TREQ-*` ni fragmentos del registro 04A;
13. `READY-GATE-003` permanece reservada y no se anticipa su criterio.

#### 15. Continuidad canónica

##### ÚLTIMA TAREA APROBADA
READY-GATE-001 — Definir criterio y evidencia para confirmar código desplegado en el entorno objetivo

##### TAREA ACTUAL APROBADA
READY-GATE-002 — Definir criterio y evidencia para confirmar migraciones aplicadas y datos validados

##### SIGUIENTE TAREA RESERVADA
READY-GATE-003 — Definir criterio y evidencia para confirmar permisos, matrices y dispositivos configurados


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
