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


### ✅ READY-GATE-003 — Definir criterio y evidencia para confirmar permisos, matrices y dispositivos configurados

**Estado:** APROBADA
**Tarea anterior:** READY-GATE-002 — Definir criterio y evidencia para confirmar migraciones aplicadas y datos validados
**Tarea siguiente:** READY-GATE-004 — Definir criterio y evidencia para confirmar usuarios, roles, sedes, áreas y turnos requeridos
**Tipo de tarea:** Documental — definición normativa del criterio de readiness y del expediente mínimo de evidencia para confirmar que permisos, matrices de autorización y configuración de dispositivos aplicables a un paquete quedaron materializados conforme a sus contratos canónicos; sin conceder permisos, asignar actores, configurar equipos, ejecutar migraciones, DDL/DML, RLS, RPC ni cambios remotos

#### 1. Propósito

Definir el criterio verificable y el formato mínimo de evidencia que `SHELL-CI-021::<package_id>` deberá ejecutar para confirmar, después de `SHELL-CI-020::<package_id>` y de las tareas de implementación aplicables, que el entorno objetivo conserva exactamente la configuración de autorización y de dispositivos requerida por el paquete, sin ampliaciones silenciosas, valores implícitos ni fuentes paralelas de autoridad.

`READY-GATE-003` responde a esta pregunta:

> ¿Los permisos, las matrices y los límites configurados de los dispositivos que el paquete necesita pueden reconstruirse desde fuentes canónicas versionadas, compararse con el estado observado del entorno y demostrar que restringen —sin conceder por sí solos— exactamente lo aprobado?

Esta tarea diseña el gate. No crea ni concede permisos, no asigna usuarios o roles, no modifica matrices, no enrola ni configura físicamente dispositivos, no cambia RLS o RPC, no ejecuta migraciones y no produce evidencia operacional posterior al despliegue.

#### 2. Alcance y frontera del gate

La evaluación se realiza por `package_id` y separa tres planos que deben permanecer independientes:

1. **catálogo y configuración de permisos:** identidad exacta, versión, vigencia, modalidad, alcance, contexto y contrato de recurso aplicables;
2. **matrices y datasets de autorización:** carril base, carril operativo, componentes, overrides o denegaciones aplicables y sus invariantes de segregación;
3. **configuración de dispositivo compartido:** identidad registral cuando exista, versión de plantilla, sede y área como límites del dispositivo, aplicaciones efectivas y techo máximo de permisos.

Un `PASS` en un plano nunca compensa un `FAIL` o `BLOQUEADO` en otro.

Este gate no sustituye ni anticipa:

- `READY-GATE-001`: correlación del código realmente desplegado;
- `READY-GATE-002`: migraciones aplicadas, drift y validación de datos;
- `READY-GATE-004`: existencia y preparación de usuarios, roles, sedes, áreas y turnos requeridos;
- `READY-GATE-005`: catálogos y datos maestros mínimos;
- `READY-GATE-006`: integraciones y credenciales del ambiente;
- `READY-GATE-007`: hardware, red, escáneres e impresoras;
- `READY-GATE-008` a `READY-GATE-015`: procedimientos, capacitación, soporte, observabilidad, rollback, baseline, riesgos y autorización final de piloto.

`READY-GATE-003` puede comprobar que una política de dispositivo referencia una sede o un área canónicas y que su configuración es restrictiva; no certifica que el actor, el turno, el check-in o la dotación física requeridos existan. Esa preparación permanece en sus gates propietarios.

#### 3. Fuentes vinculantes para determinar el estado esperado

La ejecución futura deberá derivar el estado esperado exclusivamente de artefactos aprobados y del expediente del paquete. Cuando apliquen, deberá reconciliar:

- el catálogo canónico de permisos y sus decisiones de vigencia;
- las matrices base, operativas, componentes y overrides aprobados;
- los contratos de dispositivo compartido `AUTH-DEV-001` a `AUTH-DEV-006`;
- la identidad, sede, área, aplicaciones y techo de permisos que el paquete haya incluido para cada dispositivo o plantilla afectada;
- `DELIV-PKG-012` para permiso, modalidad, alcance, contexto y recurso;
- `DELIV-PKG-014` y `DELIV-PKG-015` para artefactos físicos, dependencias y orden;
- `DELIV-PKG-016` para requisitos de prueba, fixtures, comandos y resultados esperados;
- `DELIV-PKG-018` cuando la configuración utilice flags o parámetros controlados;
- `DELIV-PKG-023` para criterios de aceptación y evidencia;
- `DELIV-PKG-025` para la decisión final del expediente;
- las tareas de implementación realmente incluidas en el mismo `package_id`.

Una configuración observada no se vuelve canónica por existir en el entorno. Si no puede trazarse hasta un contrato aprobado y una versión identificable, el resultado será `FAIL` o `BLOQUEADO` según exista evidencia suficiente para demostrar la divergencia.

#### 4. Baseline contractual vigente que este gate debe preservar

El baseline vigente al definir `READY-GATE-003` conserva las siguientes invariantes documentales. Una versión posterior solo podrá reemplazarlas cuando exista una decisión canónica aprobada, identificable y trazada por el paquete; el gate no las modifica por inferencia.

##### 4.1. Catálogo y matrices de autorización

| Artefacto        | Versión vigente de referencia                       | Invariantes documentales                                                                    |
| ---------------- | --------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| Catálogo         | `vento.authorization@1.0.0`                         | claves exactas; sin permisos inferidos por rol, prefijo, ruta o dispositivo                 |
| Matriz base      | `vento.authorization.base-role-grants@1.0.0`        | 499 concesiones lógicas; 7 roles base; 463 concesiones directas y 36 componentes            |
| Matriz operativa | `vento.authorization.operational-role-grants@1.0.0` | 240 concesiones lógicas; 12 roles operativos; 218 concesiones directas y 22 componentes     |
| Overrides        | `vento.authorization.individual-overrides@1.0.0`    | seed vigente con 0 registros; una futura excepción no puede aparecer sin decisión explícita |

Digests contractuales vigentes:

- catálogo: `sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe`;
- matriz base: `sha256:bcea5460dfea42ecd2491a550bfe511478faa5403d766166c9e731cb499214e1`;
- matriz operativa: `sha256:3e28cb780c346fbc5cf583fe9cf20d1a88333c4fd459fc233380d9e627c6f94f`;
- overrides: `sha256:ea72b513c482f9a6018ff6e7deb11c20ef986faf15f47cd78f71ddb1230aaf10`.

El baseline contractual ya prohíbe wildcards, `null` con semántica global, dispositivos como sujetos de concesión, claves legacy o retiradas dentro de la matriz operativa y la combinación de componentes de actores distintos.

##### 4.2. Contrato vigente de dispositivos compartidos

El baseline documental de dispositivo conserva:

| Invariante                                              | Valor vigente |
| ------------------------------------------------------- | ------------: |
| Claves del inventario                                   |            19 |
| Instancias configuradas auditadas                       |             2 |
| Observaciones físicas sin vínculo inequívoco            |             2 |
| Plantillas objetivo                                     |            14 |
| Plantillas legacy retiradas                             |             1 |
| Códigos canónicos de aplicación usados por plantillas   |             7 |
| Asociaciones máximas plantilla–aplicación               |            43 |
| Paquetes exactos versionados de permisos de dispositivo |             9 |
| Membresías internas de esos paquetes                    |           177 |
| Claves únicas presentes en al menos un paquete          |            83 |
| Asociaciones máximas plantilla–permiso                  |           266 |
| Asociaciones `STANDARD`                                 |           229 |
| Asociaciones `STRONG`                                   |            37 |
| Claves `NOT_ALLOWED` admitidas por una plantilla        |             0 |
| Permisos concedidos por el dispositivo                  |             0 |
| Wildcards de dispositivo permitidos                     |             0 |

Las dos instancias registrales conocidas —`CAJA_VENTO_CAFE_01` y `KIOSCO_BODEGA_CP`— permanecen como configuración candidata no equivalente por sí sola a verificación física u operacional. Las observaciones físicas sin enrolamiento no pueden tratarse como dispositivos configurados.

#### 5. Clasificación de aplicabilidad por paquete

Cada paquete deberá clasificar cada plano mediante una decisión explícita:

| Plano        | `APLICA`                                                                                                                                      | `NO_APLICA`                                                                                                               |
| ------------ | --------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| Permisos     | El paquete consume, crea, reemplaza, retira o depende de claves de permiso o de su contrato de modalidad, alcance, contexto o recurso.        | El expediente demuestra que el resultado del paquete no depende de autorización empresarial ni modifica su configuración. |
| Matrices     | El paquete depende de decisiones de rol, carril base u operativo, componentes, overrides o denegaciones materializadas.                       | El expediente demuestra que ninguna decisión matricial participa en su comportamiento.                                    |
| Dispositivos | El paquete se ejecuta o puede ejecutarse desde dispositivo compartido, modifica su configuración o depende de límites de plantilla/instancia. | El expediente demuestra que no existe dependencia de dispositivo compartido para el alcance evaluado.                     |

El silencio, un campo ausente o la falta de una instancia física no equivalen a `NO_APLICA`.

Un paquete puede requerir verificar una configuración aunque no la haya modificado. Si una capacidad depende del catálogo, de una matriz o de una política de dispositivo ya existente, el gate deberá comprobar que la versión necesaria continúa vigente en el entorno objetivo.

#### 6. Contrato de evidencia del plano de permisos

Para cada permiso o conjunto contractual requerido por el paquete, la ejecución futura deberá conservar:

| Campo                        | Regla                                                                                        |
| ---------------------------- | -------------------------------------------------------------------------------------------- |
| `package_id`                 | Paquete exacto evaluado.                                                                     |
| `permission_key`             | Clave canónica exacta; no se aceptan prefijos ni patrones.                                   |
| `expected_catalog_id`        | Identidad del catálogo aprobado.                                                             |
| `expected_catalog_version`   | Versión que el paquete declara como compatible.                                              |
| `expected_catalog_digest`    | Digest contractual o del artefacto materializado que corresponde a la versión esperada.      |
| `expected_permission_state`  | Estado esperado de la clave: activa, retirada, reemplazada o condición equivalente aprobada. |
| `expected_modality`          | Modalidad aprobada cuando sea relevante.                                                     |
| `expected_scope_contract`    | Alcance o perfil de alcance exigido por el paquete.                                          |
| `expected_context_contract`  | Dimensiones contextuales obligatorias.                                                       |
| `expected_resource_contract` | Contrato de recurso que delimita la acción.                                                  |
| `observed_configuration_ref` | Fuente autoritativa read-only del estado observado.                                          |
| `observed_catalog_version`   | Versión efectiva observada.                                                                  |
| `observed_catalog_digest`    | Digest reproducible del estado observado cuando aplique.                                     |
| `result`                     | `PASS`, `FAIL`, `BLOQUEADO` o `NO_APLICA`.                                                   |
| `blocking_reason`            | Motivo concreto cuando no exista `PASS`.                                                     |
| `evidence_refs`              | Referencias durables sin secretos.                                                           |

Reglas obligatorias:

1. una clave inexistente o distinta de la esperada produce `FAIL` cuando el estado observado es verificable;
2. una clave retirada no puede reaparecer mediante alias, prefijo o equivalencia amplia;
3. `<app>.access` no implica acceso a capacidades internas;
4. una clave no obtiene alcance global por `null`, omisión o error de resolución;
5. modalidad, alcance, contexto y recurso no pueden sustituirse por nombre de rol;
6. una versión nueva del catálogo no se adopta automáticamente: debe existir compatibilidad y trazabilidad aprobadas para el paquete.

#### 7. Contrato de evidencia del plano de matrices

Para cada dataset o matriz aplicable deberá registrarse como mínimo:

| Campo                       | Regla                                                                                         |
| --------------------------- | --------------------------------------------------------------------------------------------- |
| `matrix_id`                 | Identidad canónica del dataset o matriz.                                                      |
| `matrix_version`            | Versión esperada por el paquete.                                                              |
| `expected_digest`           | Digest contractual o del artefacto materializado.                                             |
| `observed_digest`           | Digest reproducible del estado observado.                                                     |
| `lane`                      | `BASE`, `OPERATIONAL`, `OVERRIDE` o categoría canónica equivalente.                           |
| `expected_rows`             | Cantidad esperada para la versión evaluada.                                                   |
| `observed_rows`             | Cantidad observada.                                                                           |
| `unique_identity_result`    | Resultado de unicidad de la clave lógica de cada fila.                                        |
| `catalog_resolution_result` | Toda clave de permiso resuelve contra el catálogo esperado.                                   |
| `role_resolution_result`    | Todo rol o identidad de matriz resuelve contra su catálogo propietario.                       |
| `scope_result`              | No existen wildcards ni globalidad implícita.                                                 |
| `component_result`          | Los componentes múltiples conservan mismo actor, permiso, recurso y solicitud cuando aplique. |
| `segregation_result`        | No existe ampliación incompatible con las decisiones de segregación vigentes.                 |
| `override_result`           | Toda excepción o denegación observada tiene identidad, vigencia y fundamento aprobado.        |
| `result`                    | `PASS`, `FAIL`, `BLOQUEADO` o `NO_APLICA`.                                                    |
| `evidence_refs`             | Referencias durables a manifiestos, consultas read-only o reportes reproducibles.             |

##### 7.1. Invariantes obligatorias de matriz

El gate deberá fallar cuando el estado observado muestre cualquiera de estas condiciones sin una decisión canónica posterior que la reemplace:

- wildcard de rol, permiso, recurso, sede o área;
- `null` interpretado como acceso global;
- clave de permiso fuera del catálogo activo o versión esperada;
- clave legacy o retirada incorporada como concesión vigente;
- dispositivo o principal técnico usado como beneficiario de una concesión empresarial;
- rol operativo tratado como autoridad global;
- matriz base consumida como matriz operativa por coincidencia nominal;
- `<app>.access` convertido en todas las capacidades de la aplicación;
- componentes `BASE_AND_OPERATIONAL` combinados desde actores o recursos diferentes;
- override activo sin identidad, vigencia, alcance, propietario y fundamento trazables;
- diferencia no explicada de conteo o digest respecto de la versión esperada.

#### 8. Contrato de evidencia del plano de dispositivos

La comprobación de dispositivo se realiza sobre la configuración lógica y registral requerida por el paquete. No convierte por sí misma esa evidencia en certificación de hardware, red, periféricos o presencia física.

Para cada instancia o plantilla aplicable se registrará:

| Campo                              | Regla                                                                                            |
| ---------------------------------- | ------------------------------------------------------------------------------------------------ |
| `inventory_key`                    | Clave canónica del inventario cuando la identidad provenga del baseline de dispositivo.          |
| `device_id`                        | Identidad empresarial de instancia cuando exista; no se inventa para observaciones o plantillas. |
| `device_code`                      | Código estable cuando exista.                                                                    |
| `identity_assurance_state`         | Estado de aseguramiento observado; una fila registral no se promueve por inferencia.             |
| `template_code`                    | Plantilla exacta aplicable.                                                                      |
| `template_version`                 | Versión exacta que fija los límites de configuración.                                            |
| `site_binding_ref`                 | Vínculo de sede del dispositivo cuando la instancia lo requiera.                                 |
| `area_policy_ref`                  | Política de área subordinada a la sede cuando aplique.                                           |
| `effective_app_set_ref`            | Conjunto efectivo de aplicaciones o digest equivalente.                                          |
| `default_app_result`               | Coherencia de la aplicación predeterminada con el conjunto efectivo.                             |
| `permission_package_refs`          | Paquetes de techo máximo fijados a la versión de plantilla.                                      |
| `instance_reduction_ref`           | Reducción explícita de una instancia, si existe.                                                 |
| `effective_permission_ceiling_ref` | Resultado o digest del techo efectivo de claves.                                                 |
| `configuration_version`            | Identidad versionada de la configuración observada.                                              |
| `observed_configuration_ref`       | Fuente autoritativa read-only utilizada para verificarla.                                        |
| `result`                           | `PASS`, `FAIL`, `BLOQUEADO` o `NO_APLICA`.                                                       |
| `blocking_reason`                  | Motivo concreto cuando no exista `PASS`.                                                         |
| `evidence_refs`                    | Referencias durables sin credenciales ni datos sensibles completos.                              |

##### 8.1. Fórmulas restrictivas obligatorias

Aplicaciones efectivas:

```text
APPS EFECTIVAS DEL DISPOSITIVO
=
APPS MÁXIMAS DE LA VERSIÓN DE PLANTILLA
∩
APPS HABILITADAS EXPLÍCITAMENTE EN LA INSTANCIA
∩
APPS CANÓNICAS ACTIVAS
∩
APPS DESPLEGADAS Y COMPATIBLES
```

Techo efectivo del dispositivo:

```text
TECHO EFECTIVO DEL DISPOSITIVO
=
CLAVES EXACTAS DE LOS PAQUETES DE LA VERSIÓN DE PLANTILLA
∩
CLAVES NO RETIRADAS POR LA REDUCCIÓN VIGENTE DE LA INSTANCIA
∩
CLAVES DE APLICACIONES EFECTIVAS
∩
CLAVES CANÓNICAS ACTIVAS Y COMPATIBLES CON DISPOSITIVO COMPARTIDO
```

Una acción empresarial permanece fuera del alcance de esta sola configuración. El dispositivo únicamente restringe; nunca crea un `ALLOW`.

##### 8.2. Condiciones de fallo de dispositivo

Produce `FAIL` cuando la evidencia suficiente demuestra, entre otros casos:

- una instancia amplía su plantilla;
- una aplicación o clave aparece por wildcard, prefijo, ruta, valor `null` o lista del cliente;
- una clave `NOT_ALLOWED` aparece en el techo;
- la sede o área del dispositivo se interpreta como autoridad del actor;
- una aplicación instalada se trata como aplicación permitida sin vínculo canónico;
- una aplicación permitida se trata como permiso interno;
- la app predeterminada está fuera del conjunto efectivo o existen múltiples defaults;
- el dispositivo o principal técnico actúa como trabajador;
- una observación física recibe `device_id`, aplicaciones o paquetes por inferencia;
- una plantilla retirada admite asociaciones nuevas;
- una modificación de plantilla, apps o paquetes carece de versión e historial atribuibles.

#### 9. Reglas de decisión por plano

| Resultado   | Condición                                                                                                                                                                    |
| ----------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `PASS`      | El estado esperado es inequívoco, la fuente observada es autoritativa y reproducible, la identidad y versión coinciden y todas las invariantes aplicables pasan.             |
| `FAIL`      | Existe evidencia suficiente de configuración distinta, expansión de autoridad, identidad/versionado divergente o invariante incumplida.                                      |
| `BLOQUEADO` | Falta una fuente autoritativa, no puede resolverse la versión esperada u observada, la configuración está incompleta o el acceso autorizado no permite determinar el estado. |
| `NO_APLICA` | El expediente aprobado demuestra explícitamente que el plano no participa en la capacidad evaluada.                                                                          |

`NO_APLICA` nunca corrige un `FAIL` ni reemplaza una configuración requerida pero ausente.

#### 10. Resultado agregado por paquete

El resultado de `READY-GATE-003::<package_id>` se calcula de forma estricta:

1. los tres planos se clasifican explícitamente;
2. cada artefacto obligatorio de permiso, matriz y dispositivo aparece exactamente una vez en su evaluación;
3. si cualquier plano obtiene `FAIL`, el paquete obtiene `FAIL`;
4. si no existe `FAIL` pero algún plano obtiene `BLOQUEADO`, el paquete obtiene `BLOQUEADO`;
5. el paquete obtiene `PASS` únicamente cuando todos los planos aplicables obtienen `PASS` y cada `NO_APLICA` está sustentado por el expediente;
6. el paquete obtiene `NO_APLICA` únicamente cuando los tres planos están justificadamente fuera de alcance;
7. no existe `PASS` parcial por coincidir solo el catálogo, solo la matriz o solo la configuración registral del dispositivo.

#### 11. Evidencia aceptable

La ejecución futura podrá usar, según el plano y sin exponer secretos:

- manifiestos versionados con identidad, versión y digest;
- consultas read-only versionadas que reconstruyan configuración efectiva;
- exportes deterministas del catálogo y matrices con orden estable;
- reportes de unicidad, resolución de claves, conteos, segregación y ausencia de wildcards;
- snapshots de configuración de dispositivo que identifiquen plantilla, sede, área, apps y techo de permisos;
- evidencia emitida por CI o por la plataforma de configuración que vincule `package_id`, candidato y entorno;
- pruebas negativas y contractuales ya vinculadas al paquete;
- referencias a eventos o historial de configuración que demuestren versión, vigencia, actor administrativo y motivo.

Toda evidencia deberá indicar ambiente, candidato, fecha u origen verificable cuando corresponda, método de obtención, resultado y referencias durables.

#### 12. Evidencia insuficiente por sí sola

No constituye prueba suficiente de configuración correcta:

- que el permiso exista en un archivo o en una interfaz;
- que un rol tenga un nombre esperado;
- que una matriz documental haya sido aprobada sin demostrar su estado materializado;
- que una tabla o fila exista sin versión o correlación con el paquete;
- que una aplicación aparezca en el launcher;
- que una aplicación esté instalada;
- que una ruta responda;
- que una fila de dispositivo esté activa;
- que `navigation_role` tenga un valor esperado;
- una captura de pantalla sin fuente reproducible;
- una exportación sin versión, digest o ambiente;
- un `PASS` de migraciones en `READY-GATE-002` sin comprobar la semántica de la configuración resultante;
- que un usuario real pueda ejecutar una acción; la preparación de actores y su contexto pertenece a `READY-GATE-004`.

#### 13. Casos especiales y tratamiento obligatorio

##### 13.1. Baseline contractual sin cambios en el paquete

Si el paquete depende del baseline vigente pero no lo modifica, el gate deberá verificar que el entorno objetivo conserva la versión y digest esperados. La ausencia de cambio no elimina la necesidad de comprobar una dependencia crítica de readiness.

##### 13.2. Versión canónica posterior

Si una tarea aprobada posterior modifica catálogo, matrices o contratos de dispositivo, el paquete deberá identificar la nueva versión, digest y decisión propietaria. `READY-GATE-003` comparará contra esa versión y no contra una copia histórica. Un cambio observado sin esa trazabilidad produce `FAIL` o `BLOQUEADO`.

##### 13.3. Instancias registrales no verificadas

`CAJA_VENTO_CAFE_01` y `KIOSCO_BODEGA_CP` no pueden declararse físicamente u operacionalmente verificadas por la sola existencia de su fila. Este gate puede comprobar que su configuración registral coincide con el contrato del paquete, pero esa comprobación no sustituye la evidencia física, de sesión o de hardware asignada a las tareas y gates propietarios.

##### 13.4. Observaciones físicas sin enrolamiento

Una observación física sin identidad administrada no se promueve a dispositivo configurado. Si el paquete requiere una instancia que aún no existe o no puede correlacionarse, el plano de dispositivo queda `BLOQUEADO` hasta que la tarea propietaria materialice la identidad correspondiente.

##### 13.5. Configuración almacenada en Supabase

Cuando catálogo, matrices o políticas de dispositivo se materialicen en Supabase, toda modificación perteneciente a VENTO deberá provenir de artefactos versionados en `vento-shell`. `READY-GATE-002` confirma que la migración o cambio de datos fue aplicado y reconciliado; `READY-GATE-003` confirma que la semántica final observada coincide con el contrato de autorización y dispositivo.

#### 14. Cobertura de prueba heredada

Este gate consume y operacionaliza requisitos existentes sin crear una conducta empresarial nueva. La cobertura heredada relevante incluye:

- `TREQ-AUTH-001`, `TREQ-AUTH-002`, `TREQ-AUTH-008`, `TREQ-AUTH-010` y `TREQ-AUTH-011` para autorización canónica, matrices, segregación y dispositivo como límite restrictivo;
- `TREQ-AUTH-019` a `TREQ-AUTH-068` para identidad y configuración de dispositivo, sede, área, aplicaciones y techo máximo de permisos;
- los `TREQ-*` adicionales ya vinculados por `DELIV-PKG-016` al `package_id` concreto que se esté evaluando.

La ejecución futura deberá usar el estado vigente del Registro Canónico de Requisitos de Prueba y no inferir que un requisito está `VERIFICADO` por existir este gate documental.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** `READY-GATE-003` define el criterio documental de evidencia para obligaciones de autorización, matrices y dispositivos que ya cuentan con requisitos de prueba identificados y vinculables por paquete. No crea un permiso, regla de negocio, transición de estado, restricción de integridad, contrato de integración ni comportamiento ejecutable nuevo; únicamente establece cómo `SHELL-CI-021::<package_id>` deberá demostrar posteriormente que la configuración materializada satisface los contratos existentes.

**Requisitos creados:** 0
**Requisitos modificados:** 0

#### 15. Criterios de aceptación documental

`READY-GATE-003` queda documentalmente completo cuando:

1. separa permisos, matrices y dispositivos en tres planos independientes;
2. define cómo resolver el estado esperado desde versiones canónicas y el expediente del paquete;
3. conserva el baseline vigente de catálogo, matrices y dispositivos sin reinterpretarlo;
4. exige claves exactas, versiones y digests reproducibles para permisos y matrices;
5. impide wildcards, `null` global, claves legacy o retiradas y dispositivos como fuentes de concesión;
6. conserva la segregación entre carriles base y operativo y entre componentes de autorización;
7. exige que la configuración de dispositivo respete identidad, plantilla, sede, área, apps y techo de permisos sin ampliar autoridad;
8. preserva las 19 claves de inventario, 14 plantillas, 43 asociaciones máximas de aplicaciones, 9 paquetes de permisos y 266 asociaciones plantilla–permiso como baseline vigente mientras no exista una versión canónica posterior;
9. diferencia configuración registral de verificación física u operacional;
10. define `PASS`, `FAIL`, `BLOQUEADO` y `NO_APLICA` sin resultados parciales implícitos;
11. diferencia evidencia reproducible de señales insuficientes como una fila existente, una app visible o un screenshot;
12. separa la migración aplicada de `READY-GATE-002` de la semántica configurada que evalúa este gate;
13. mantiene usuarios, roles asignados, sedes/áreas operativas del actor y turnos en `READY-GATE-004`;
14. mantiene la ejecución y captura de evidencia real en `SHELL-CI-021::<package_id>`;
15. no crea ni modifica requisitos `TREQ-*` ni el Registro Canónico de Requisitos de Prueba;
16. no concede permisos, no configura equipos, no ejecuta migraciones, DDL/DML, RLS, RPC ni modificaciones remotas;
17. `READY-GATE-004` permanece reservada y no se desarrolla ni modifica.

#### 16. Continuidad canónica

##### ÚLTIMA TAREA APROBADA
READY-GATE-002 — Definir criterio y evidencia para confirmar migraciones aplicadas y datos validados

##### TAREA ACTUAL APROBADA
READY-GATE-003 — Definir criterio y evidencia para confirmar permisos, matrices y dispositivos configurados

##### SIGUIENTE TAREA RESERVADA
READY-GATE-004 — Definir criterio y evidencia para confirmar usuarios, roles, sedes, áreas y turnos requeridos


### ✅ READY-GATE-004 — Definir criterio y evidencia para confirmar usuarios, roles, sedes, áreas y turnos requeridos

**Estado:** APROBADA
**Tarea anterior:** READY-GATE-003 — Definir criterio y evidencia para confirmar permisos, matrices y dispositivos configurados
**Tarea siguiente:** READY-GATE-005 — Definir criterio y evidencia para confirmar catálogos y datos maestros mínimos
**Tipo de tarea:** Documental — definición normativa del criterio de readiness y del expediente mínimo de evidencia para confirmar que los usuarios y actores humanos requeridos por un paquete existen, están correctamente vinculados con sus roles, sedes, áreas y turnos aplicables, y pueden entrar al piloto sin ambigüedad de identidad o contexto; sin crear usuarios, modificar asignaciones, publicar turnos, realizar check-in ni ejecutar cambios sobre ambientes remotos

#### 1. Propósito

Definir el criterio verificable y el formato mínimo de evidencia que `SHELL-CI-021::<package_id>` deberá ejecutar para confirmar, después de `SHELL-CI-020::<package_id>` y de las tareas de implementación aplicables, que todas las personas necesarias para operar, administrar o supervisar el alcance del paquete durante el piloto tienen una configuración de identidad y contexto coherente con el modelo canónico.

El gate deberá demostrar, para cada actor requerido por el paquete, que:

1. existe una identidad empresarial inequívoca;
2. cuando el actor requiera autenticación interactiva, existe un principal autenticado válido y vinculado con ese actor sin confundir principal con actor;
3. sus roles requeridos corresponden a códigos canónicos exactos y no a nombres libres, cargos, jerarquías o inferencias locales;
4. sus sedes y áreas requeridas existen, están activas cuando corresponda y conservan una relación territorial coherente;
5. todo rol operativo que deba ejercerse durante el piloto está respaldado por un turno publicado, atribuible y compatible con la ventana, sede y área requeridas;
6. ninguna ausencia, multiplicidad o contradicción se transforma silenciosamente en autoridad más amplia.

Esta tarea diseña el gate. No crea cuentas, invitaciones, trabajadores, roles, asignaciones territoriales, turnos, check-ins ni registros de operación y no afirma que ningún actor haya superado readiness.

#### 2. Alcance y frontera del gate

`READY-GATE-004` responde exclusivamente a esta pregunta:

> ¿El conjunto completo de actores humanos que el paquete necesita para entrar al piloto está materializado con identidad, rol y contexto territorial y laboral suficientes para ejecutar su participación prevista, sin privilegios inferidos ni ambigüedades?

El gate se evalúa por `package_id`, ambiente objetivo y actor requerido. Cuando un mismo actor participe en más de una función, sede, área o franja del piloto, cada combinación materialmente distinta deberá quedar representada en el expediente sin duplicar la identidad humana.

Este gate no sustituye ni anticipa:

- `READY-GATE-001`: correlación del código realmente desplegado;
- `READY-GATE-002`: migraciones aplicadas y datos validados;
- `READY-GATE-003`: permisos, matrices y dispositivos configurados;
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

La existencia de una cuenta, una fila de trabajador, un rol visible en interfaz, una sede seleccionable, un área registrada o un turno en borrador no demuestra readiness por sí sola.

#### 3. Fuentes vinculantes para determinar el roster esperado

La ejecución futura deberá derivar el conjunto esperado de actores y configuraciones exclusivamente del expediente aprobado del paquete y de los contratos canónicos vigentes.

Como mínimo deberá reconciliar, cuando apliquen:

- el alcance y los actores del proceso que el paquete implementa;
- los permisos y matrices ya validados por `READY-GATE-003`;
- la decisión final y las dependencias del expediente `DELIV-PKG-001..025::<package_id>`;
- el catálogo canónico de roles base y operativos;
- el contrato de `AccessContext` y la separación entre principal autenticado y actor efectivo;
- las asignaciones territoriales requeridas por los procesos incluidos;
- los turnos publicados que materialicen los roles operativos requeridos para la ventana del piloto;
- las denegaciones y restricciones vigentes que puedan impedir la participación prevista.

La lista observada de usuarios del ambiente no define por sí sola el roster esperado. Primero deberá existir un conjunto requerido derivado del paquete y después deberá reconciliarse contra el estado observado.

Si el paquete no permite determinar de forma exhaustiva quiénes deben participar o qué rol y territorio necesita cada actor, el gate será `BLOQUEADO`; no se completará el roster mediante inferencia.

#### 4. Contrato del roster de readiness

La ejecución futura deberá materializar exactamente una fila principal por actor requerido y las extensiones necesarias para representar participaciones distintas sin duplicar a la persona.

##### 4.1. Campos mínimos por actor

| Campo                       | Regla                                                                                                           |
| --------------------------- | --------------------------------------------------------------------------------------------------------------- |
| `package_id`                | Identidad canónica exacta del expediente evaluado.                                                              |
| `target_environment`        | Ambiente exacto contra el cual se realiza la comprobación.                                                      |
| `actor_id`                  | Identidad empresarial estable del humano requerido.                                                             |
| `principal_id`              | Principal autenticado vinculado cuando la participación exige autenticación interactiva; no sustituye al actor. |
| `principal_requirement`     | Evidencia de si la participación requiere o no principal interactivo según el proceso y el paquete.             |
| `identity_link_result`      | Resultado de comprobar vínculo inequívoco entre principal y actor cuando aplique.                               |
| `base_role_expected`        | Rol base exacto requerido cuando corresponda.                                                                   |
| `base_role_observed`        | Rol base efectivamente configurado y vigente.                                                                   |
| `operational_role_expected` | Rol operativo exacto requerido cuando corresponda.                                                              |
| `operational_role_observed` | Rol operativo resoluble para la participación prevista.                                                         |
| `required_site_ids`         | Sede o conjunto de sedes que el paquete exige para la participación.                                            |
| `observed_site_scope`       | Alcance territorial efectivamente configurado para el actor.                                                    |
| `required_area_ids`         | Área o conjunto explícito de áreas requeridas cuando la operación depende de área.                              |
| `observed_area_scope`       | Áreas efectivamente configuradas y compatibles con sus sedes.                                                   |
| `shift_required`            | Indica si la participación exige turno operativo para la ventana del piloto.                                    |
| `shift_id`                  | Identidad del turno publicado que sustenta la participación cuando aplique.                                     |
| `shift_window`              | Ventana efectiva del turno comparada con la ventana requerida del piloto.                                       |
| `shift_site_id`             | Sede del turno publicado.                                                                                       |
| `shift_area_id`             | Área del turno cuando el contrato la exige.                                                                     |
| `shift_operational_role`    | Rol operativo publicado para el turno.                                                                          |
| `conflict_result`           | Resultado de detectar duplicidad, superposición o asignaciones incompatibles.                                   |
| `evidence_refs`             | Referencias reproducibles a evidencia autorizada sin almacenar secretos ni datos personales innecesarios.       |
| `result`                    | `PASS`, `FAIL`, `BLOQUEADO` o `NO_APLICA`.                                                                      |
| `blocking_reason`           | Motivo concreto cuando la fila no obtiene `PASS`.                                                               |

Los nombres anteriores definen el contenido mínimo del expediente de evidencia; no obligan a una estructura física de base de datos concreta.

##### 4.2. Exhaustividad del roster

El roster será válido únicamente cuando:

1. todos los actores requeridos por los pasos del paquete estén incluidos;
2. cada actor aparezca una sola vez como identidad humana principal;
3. sus participaciones adicionales estén vinculadas a la misma identidad y no creen personas duplicadas;
4. toda ausencia tenga una causa verificable;
5. ningún actor adicional se incluya para suplir silenciosamente un rol o una cobertura no aprobados;
6. los conteos esperado, observado, conciliado, faltante, conflictivo y no aplicable sean reproducibles.

No se declara una cantidad global de usuarios, sedes, áreas o turnos en esta tarea porque esas cantidades pertenecen a cada paquete y ambiente observado durante la ejecución futura.

#### 5. Identidad humana y principal autenticado

La comprobación deberá conservar la separación canónica:

```text
PRINCIPAL AUTENTICADO
≠
ACTOR HUMANO EFECTIVO
≠
ROL
≠
TURNO
≠
CHECK-IN
≠
DISPOSITIVO
```

Para obtener `PASS` en identidad:

1. el `actor_id` esperado deberá existir y corresponder a la persona prevista por el expediente;
2. si la participación exige autenticación interactiva, el principal deberá existir, ser utilizable en el ambiente objetivo y vincularse de forma inequívoca con ese actor;
3. un principal técnico, cuenta de dispositivo, credencial de integración o identidad compartida no podrá utilizarse como actor humano;
4. una invitación pendiente, expirada, consumida por otra identidad o con rol o sede no reconciliados no constituye por sí sola un usuario listo para el piloto;
5. la metadata editable por el usuario no podrá sustituir la asignación empresarial protegida;
6. una identidad desactivada, suspendida o no utilizable para la participación requerida no podrá recibir `PASS`;
7. el vínculo deberá poder auditarse sin exponer contraseñas, tokens, secretos ni atributos personales innecesarios.

Cuando el proceso aprobado demuestre que una participación no requiere principal interactivo, esa dimensión podrá marcarse `NO_APLICA`; el actor empresarial y las demás dimensiones requeridas siguen siendo obligatorios.

#### 6. Catálogos de rol vinculantes

`READY-GATE-004` no redefine roles. Comprueba que las asignaciones observadas correspondan a los catálogos canónicos ya aprobados.

##### 6.1. Roles base vigentes

Los siete códigos base que el gate reconoce en el snapshot vigente son:

- `propietario`;
- `gerente_general`;
- `gerente`;
- `contador`;
- `marketing`;
- `logistica`;
- `auxiliar_administrativa`.

El rol base representa autoridad administrativa o funcional independiente del turno cuando su modalidad lo permite. No se convertirá en rol operativo por coincidencia nominal, cargo, jerarquía o presencia física.

##### 6.2. Roles operativos vigentes

Los doce códigos operativos que el gate reconoce en el snapshot vigente son:

- `cajero_satelite`;
- `barista_satelite`;
- `cocinero_satelite`;
- `servicio_salon`;
- `mostrador_satelite`;
- `operador_integral_satelite`;
- `produccion_cocina`;
- `produccion_panaderia`;
- `produccion_reposteria`;
- `bodeguero`;
- `conductor_logistica`;
- `gerencia_operativa`.

El rol operativo deberá provenir del contexto laboral vigente que corresponda al actor y al momento evaluado. No podrá derivarse de un `BaseRole`, de un nombre de cargo, de una ruta, de una pantalla, del dispositivo o de una asignación histórica.

##### 6.3. Regla de correspondencia

Para cada participación del roster:

- el rol esperado deberá ser exacto y existir en el catálogo aplicable;
- el rol observado deberá coincidir con la participación autorizada por el expediente;
- una asignación adicional que amplíe materialmente la autoridad del actor fuera de lo aprobado deberá producir `FAIL` cuando la evidencia permita demostrarla;
- si no puede determinarse cuál rol es autoritativo, el resultado será `BLOQUEADO`;
- la ausencia de rol no se sustituye por un rol “parecido” ni por el más cercano jerárquicamente.

La matriz de concesiones no se vuelve a diseñar aquí. `READY-GATE-003` ya gobierna su integridad; este gate verifica que los actores del paquete estén vinculados a los roles que esas matrices esperan.

#### 7. Sedes y áreas requeridas

Toda participación territorial deberá reconciliar identificadores canónicos, no etiquetas libres.

##### 7.1. Sede

Para `PASS`:

1. cada `site_id` requerido deberá existir y ser el mismo que utiliza el expediente del paquete;
2. cuando la participación dependa de una sede activa, esa sede deberá estar habilitada para el periodo evaluado;
3. el alcance observado del actor deberá contener exactamente la cobertura necesaria para su participación, sin interpretar `null` como todas las sedes;
4. un nombre, código visible, sede seleccionada en cliente, última sede usada o sede del dispositivo no podrá crear asignación del actor;
5. una asignación conflictiva o no resoluble bloqueará la participación afectada.

##### 7.2. Área

Para `PASS`:

1. cada `area_id` requerido deberá existir y pertenecer a una sede compatible con la participación;
2. el conjunto observado deberá reconciliarse contra el conjunto requerido por el paquete;
3. un área de otra sede produce `FAIL` cuando la relación es verificable;
4. un área ausente o indeterminada no significa toda la sede;
5. una etiqueta, tipo de área, orden visual o selección del cliente no crea membresía territorial.

##### 7.3. Participaciones administrativas

Una participación exclusivamente administrativa no deberá recibir artificialmente turno, check-in o área operativa para obtener readiness. El gate deberá comprobar el alcance administrativo que realmente exija el contrato y mantenerlo separado del contexto operacional.

#### 8. Turnos requeridos para el piloto

El turno es una condición operativa temporal y no una fuente de identidad o permisos.

Para cada participación que requiera carril operativo durante el piloto, el gate deberá demostrar:

1. existencia de un turno atribuible al mismo `actor_id`;
2. estado publicado o equivalente canónico que lo haga laboralmente efectivo;
3. ventana temporal que cubra la participación requerida del piloto;
4. `site_id` compatible con la sede requerida;
5. `area_id` compatible cuando el contrato del turno y de la operación lo exijan;
6. `operational_role` exacto y compatible con la función requerida;
7. ausencia de superposición que produzca dos roles operativos efectivos incompatibles para el mismo actor e instante;
8. ausencia de selección por aproximación, “turno más cercano” o fallback histórico.

Un turno en borrador, cancelado, fuera de ventana, de otra persona, sede, área o rol no satisface el gate.

##### 8.1. Frontera con check-in

`READY-GATE-004` confirma que los turnos necesarios están configurados y publicados para la ventana del piloto. No exige fabricar un check-in previo ni considerar que un actor ya está operando antes de iniciar su jornada.

El check-in activo se evaluará cuando el flujo operativo realmente requiera resolver contexto durante la ejecución. Su ausencia antes del inicio de la jornada no convierte en inválido un turno futuro correctamente publicado ni afecta capacidades base que por contrato no dependan de check-in.

#### 9. Reconciliación con matrices y permisos

El gate deberá demostrar coherencia entre el roster y la configuración ya evaluada en `READY-GATE-003` sin repetir la auditoría completa de matrices.

Controles mínimos:

1. todo rol base observado deberá resolver contra el carril base correspondiente;
2. todo rol operativo observado deberá resolver contra el carril operativo correspondiente;
3. las participaciones operativas deberán usar contexto territorial y temporal compatible con sus filas `CTX-*`;
4. un rol base no podrá heredar automáticamente las 240 concesiones operativas;
5. un rol operativo no podrá heredar automáticamente las 499 concesiones base;
6. una cuenta de dispositivo no podrá aparecer como beneficiario humano de una concesión;
7. `null`, wildcard, nombre de rol o nombre de cargo no podrán ampliar alcance;
8. una denegación vigente deberá seguir prevaleciendo sobre la mera existencia del usuario, rol o turno.

La prueba de una acción concreta continúa perteneciendo a la autorización efectiva y a los requisitos `TREQ-*` aplicables. Este gate solo confirma que la configuración humana necesaria para llegar a esa evaluación existe y es coherente.

#### 10. Reglas de decisión por dimensión

Cada actor deberá obtener un resultado por dimensión antes del resultado agregado.

| Dimensión     | `PASS`                                                                                                     | `FAIL`                                                                                               | `BLOQUEADO`                                                                | `NO_APLICA`                                                                                 |
| ------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| Identidad     | Actor y vínculo de principal requerido son inequívocos, vigentes y utilizables.                            | La evidencia demuestra identidad incorrecta, inactiva, duplicada o vínculo con otro actor.           | No puede resolverse de forma autoritativa el actor o su principal.         | La participación no requiere principal interactivo; el actor empresarial sigue validándose. |
| Rol base      | Código esperado y asignación observada son coherentes.                                                     | Existe rol distinto o asignación adicional incompatible que cambia autoridad.                        | La fuente autoritativa o el rol esperado no pueden determinarse.           | La participación no requiere carril base.                                                   |
| Rol operativo | Código esperado y rol operativo resoluble son coherentes.                                                  | El rol observado es distinto o incompatible.                                                         | No puede resolverse un rol operativo autoritativo.                         | La participación no requiere carril operativo.                                              |
| Sede          | Cobertura requerida y observada son compatibles mediante IDs canónicos.                                    | Existe sede incorrecta, inactiva o expansión demostrada.                                             | La asignación o el catálogo territorial no pueden reconciliarse.           | El contrato demuestra que la dimensión territorial no aplica.                               |
| Área          | Las áreas requeridas existen, pertenecen a la sede correcta y están cubiertas.                             | Existe área cross-site, no autorizada o incompatible.                                                | La pertenencia o asignación de área no puede resolverse.                   | El contrato demuestra que el área no aplica a esa participación.                            |
| Turno         | Existe turno publicado, atribuible, temporal y territorialmente compatible con el rol operativo requerido. | El turno está ausente cuando es requerido, no publicado, fuera de ventana, duplicado o incompatible. | No puede determinarse de forma autoritativa el calendario o la asignación. | La participación no exige turno operativo.                                                  |

`NO_APLICA` deberá estar sustentado por el proceso y el expediente del paquete. No puede utilizarse para ocultar un dato faltante.

#### 11. Resultado agregado por actor y por paquete

##### 11.1. Resultado por actor

1. Si alguna dimensión obligatoria obtiene `FAIL`, el actor obtiene `FAIL`.
2. Si no existe `FAIL` pero alguna dimensión obligatoria obtiene `BLOQUEADO`, el actor obtiene `BLOQUEADO`.
3. El actor obtiene `PASS` únicamente cuando todas sus dimensiones requeridas obtienen `PASS` y todo `NO_APLICA` está sustentado.
4. La existencia de una cuenta válida no compensa un rol, territorio o turno incorrecto.
5. Un turno correcto no compensa una identidad o asignación inválida.
6. Un actor administrativo puede obtener `PASS` sin turno operativo cuando el contrato demuestra que su participación es exclusivamente base.

##### 11.2. Resultado por paquete

1. Todo actor requerido deberá aparecer exactamente una vez como identidad principal del roster.
2. Si falta un actor cuyo requerimiento está demostrado, el paquete obtiene `FAIL`.
3. Si no puede determinarse el universo esperado de actores, el paquete obtiene `BLOQUEADO`.
4. Si algún actor obtiene `FAIL`, el paquete obtiene `FAIL`.
5. Si no existe `FAIL` pero algún actor obtiene `BLOQUEADO`, el paquete obtiene `BLOQUEADO`.
6. El paquete obtiene `PASS` únicamente cuando todos los actores requeridos obtienen `PASS`.
7. Un paquete que demuestre documentalmente que no requiere participación humana para la capacidad evaluada podrá obtener `NO_APLICA` en este gate; esa decisión no puede inferirse únicamente porque no existan usuarios observados.
8. Un subconjunto de usuarios o una muestra representativa nunca se redondean a `PASS`.

#### 12. Evidencia aceptable

La ejecución futura deberá conservar evidencia suficiente para que otra persona autorizada pueda repetir la reconciliación y obtener el mismo resultado.

Podrán utilizarse, cuando correspondan:

- inventario del roster esperado derivado del paquete;
- identificadores y estado del principal autenticado obtenidos de la fuente de identidad autorizada;
- vínculo protegido entre principal y actor empresarial;
- asignaciones canónicas de rol base;
- asignaciones y elegibilidad de rol operativo;
- catálogos y vínculos de sede y área;
- calendario o fuente autoritativa de turnos publicados;
- consultas read-only versionadas que comprueben unicidad, pertenencia territorial, vigencia y conflictos;
- reportes reproducibles de faltantes, duplicados, superposiciones y asignaciones incompatibles;
- resultados de pruebas vinculadas a los `TREQ-*` existentes;
- referencias de evidencia emitidas por los sistemas propietarios.

Toda evidencia deberá registrar como mínimo paquete, ambiente, fecha de observación, fuente, método, actor o conjunto evaluado, resultado y referencia durable.

La evidencia no deberá conservar contraseñas, tokens, secretos, códigos de recuperación, datos biométricos ni atributos personales completos cuando un identificador o una referencia protegida sean suficientes.

#### 13. Evidencia insuficiente por sí sola

No constituye prueba suficiente de readiness:

- una captura de una pantalla de usuarios;
- que el correo de una persona exista en un proveedor de identidad;
- que una invitación haya sido enviada;
- que una fila de trabajador exista sin vínculo de identidad verificable;
- que el nombre visible de un rol coincida con la función esperada;
- que una persona pueda abrir una aplicación;
- que un selector muestre una sede o un área;
- que una sede o área exista sin demostrar la asignación del actor;
- que un turno esté creado pero permanezca en borrador o fuera de la ventana del piloto;
- un check-in histórico;
- la presencia física del trabajador sin turno y contexto requeridos;
- una asignación local, cacheada o enviada por el cliente;
- una muestra parcial del roster;
- la aprobación documental de un paquete sin evidencia del estado observado en el ambiente objetivo.

#### 14. Casos especiales y manejo de discrepancias

##### 14.1. Actor con múltiples funciones

Una persona puede tener más de una participación aprobada sin duplicar su identidad. El expediente deberá separar cada participación por rol, territorio y ventana y comprobar que la combinación no crea simultaneidad incompatible ni expansión accidental de autoridad.

##### 14.2. Actor multisede

Una cobertura administrativa multisede deberá provenir de la asignación canónica correspondiente. Para operación, cada participación deberá resolver la sede y área efectivas exigidas por el turno y el recurso. La mera pertenencia administrativa a varias sedes no produce un contexto operativo global.

##### 14.3. Actor exclusivamente administrativo

Cuando la participación requiera solamente capacidades base, la ausencia de turno o check-in no será un defecto. Sí deberán verificarse identidad, rol base, cobertura administrativa y demás condiciones que el paquete exija.

##### 14.4. Actor operativo sin turno válido

Cuando el paquete requiera operación y no exista un turno publicado compatible con actor, rol, sede, área y ventana, el resultado será `FAIL` si la ausencia es verificable y `BLOQUEADO` si la fuente autoritativa no puede determinarse. No se utilizará un turno histórico o aproximado.

##### 14.5. Dispositivo compartido

El dispositivo no reemplaza al actor. Si la participación se realiza desde una estación compartida, este gate exigirá igualmente actor humano identificable y las dimensiones laborales que correspondan. La configuración del dispositivo permanece gobernada por `READY-GATE-003` y no concede roles, sedes, áreas ni turnos.

##### 14.6. Identidad técnica o de integración

Un principal de servicio, integración, automatización o dispositivo no se incorporará al roster como usuario humano. Si el paquete depende de una integración técnica, su readiness pertenece al gate correspondiente de integraciones y credenciales, no a una simulación de trabajador.

#### 15. Separación entre planificación y ejecución

`READY-GATE-004` deja definido el contrato que `SHELL-CI-021::<package_id>` deberá ejecutar después de que el paquete haya materializado las identidades, asignaciones y planificación laboral aplicables.

La secuencia permanece:

`E5-GATE-008::<package_id> -> SHELL-CI-020::<package_id> -> implementación aplicable -> SHELL-CI-021::<package_id> -> SHELL-CI-022::<package_id>`

Durante `SHELL-CI-021::<package_id>` se capturará el roster real del ambiente objetivo, se reconciliarán sus dimensiones y se emitirá el resultado operativo de readiness. Esta tarea no crea ni modifica usuarios, roles, sedes, áreas, turnos o check-ins y no presenta evidencia planificada como evidencia ejecutada.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** `READY-GATE-004` define el criterio documental de evidencia para comprobar reglas de identidad, rol, territorio, jornada y separación entre carriles que ya están protegidas por requisitos canónicos existentes. No introduce una nueva regla empresarial, modalidad de autorización, asignación, transición de estado o comportamiento ejecutable; operacionaliza esas obligaciones para la comprobación futura por paquete.

**Requisitos existentes consumidos:** `TREQ-AUTH-001`, `TREQ-AUTH-005`, `TREQ-AUTH-007`, `TREQ-AUTH-008`, `TREQ-AUTH-009` y `TREQ-AUTH-010`.

**Requisitos TREQ-* creados:** 0
**Requisitos TREQ-* modificados:** 0
**Fragmentos 04A afectados:** 0

#### 16. Criterios de aceptación documental

`READY-GATE-004` queda documentalmente completo cuando:

1. define cómo derivar un roster exhaustivo de actores requeridos desde el expediente del paquete antes de observar usuarios del ambiente;
2. separa de forma explícita principal autenticado, actor humano, rol, turno, check-in y dispositivo;
3. exige vínculo inequívoco entre principal y actor cuando la participación requiere autenticación interactiva;
4. conserva exactamente los siete roles base y doce roles operativos del snapshot canónico vigente sin inferencias por cargo o jerarquía;
5. exige reconciliación de sede y área mediante identificadores canónicos y prohíbe interpretar `null` como cobertura global;
6. exige turno publicado, atribuible, temporal y territorialmente compatible para toda participación operativa requerida durante el piloto;
7. mantiene las capacidades administrativas independientes de turno y check-in cuando el contrato las define por carril base;
8. no exige un check-in artificial antes del inicio real de la jornada y conserva su evaluación para el contexto operativo correspondiente;
9. define `PASS`, `FAIL`, `BLOQUEADO` y `NO_APLICA` por dimensión, por actor y por paquete;
10. impide aprobar una muestra parcial, un roster incompleto o una identidad técnica presentada como trabajador;
11. diferencia evidencia reproducible de señales insuficientes como capturas, invitaciones enviadas, nombres visibles o turnos en borrador;
12. conserva la separación con `READY-GATE-003` y no vuelve a diseñar permisos, matrices o dispositivos;
13. no crea usuarios, invitaciones, trabajadores, roles, asignaciones, sedes, áreas, turnos, check-ins, DDL, DML, migraciones ni cambios remotos;
14. no crea ni modifica requisitos `TREQ-*` ni fragmentos del registro 04A;
15. `READY-GATE-005` permanece reservada y no se anticipa su criterio sobre catálogos y datos maestros.

#### 17. Continuidad canónica

##### ÚLTIMA TAREA APROBADA
READY-GATE-003 — Definir criterio y evidencia para confirmar permisos, matrices y dispositivos configurados

##### TAREA ACTUAL APROBADA
READY-GATE-004 — Definir criterio y evidencia para confirmar usuarios, roles, sedes, áreas y turnos requeridos

##### SIGUIENTE TAREA RESERVADA
READY-GATE-005 — Definir criterio y evidencia para confirmar catálogos y datos maestros mínimos


### ✅ READY-GATE-005 — Definir criterio y evidencia para confirmar catálogos y datos maestros mínimos

**Estado:** APROBADA  
**Tarea anterior:** READY-GATE-004 — Definir criterio y evidencia para confirmar usuarios, roles, sedes, áreas y turnos requeridos  
**Tarea siguiente:** READY-GATE-006 — Definir criterio y evidencia para confirmar integraciones y credenciales del ambiente  
**Tipo de tarea:** Documental — definición del gate de readiness que permitirá confirmar, por paquete y ambiente objetivo, que los catálogos, maestros, referencias y homologaciones mínimas requeridas para la operación autorizada existen, son identificables, están gobernadas por una fuente de verdad y cumplen integridad suficiente antes del piloto; sin crear datos, ejecutar seeds, migraciones, backfills, cambios Supabase, configuración, despliegues ni validación operativa real.

#### 1. Propósito y resultado canónico

`READY-GATE-005::<package_id>` define el criterio documental que deberá ejecutar posteriormente `SHELL-CI-021::<package_id>` para determinar si el paquete dispone de la línea base mínima de catálogos y datos maestros que necesita en el ambiente objetivo.

El gate responde una pregunta concreta:

> ¿Todas las identidades maestras, catálogos, referencias y homologaciones que el paquete necesita para operar dentro de su alcance aprobado existen en la fuente de verdad correcta, con claves canónicas, cobertura mínima, vigencia e integridad verificables?

La tarea no afirma que esa condición ya se cumpla para ningún paquete. Define qué deberá comprobarse, qué evidencia será suficiente y cómo se resolverá el resultado.

#### 2. Alcance y frontera del gate

El gate cubre exclusivamente datos de referencia o persistencia relativamente estable que condicionan la operación del paquete, por ejemplo cuando apliquen:

- catálogos funcionales;
- entidades maestras;
- valores de referencia;
- diccionarios o taxonomías controladas;
- relaciones de homologación entre identificadores canónicos y fuentes legacy o externas;
- parámetros de negocio persistentes que sean datos gobernados y no secretos ni variables de despliegue;
- registros maestros mínimos exigidos por contratos, procesos, integraciones o `TREQ-*` del paquete.

La aplicabilidad se determina desde el expediente aprobado del paquete. Ninguna categoría se considera obligatoria para todos los paquetes por el solo hecho de existir en Vento OS.

Este gate no sustituye ni reabre:

1. `READY-GATE-002`, que confirma migraciones aplicadas, transformaciones de datos y reconciliación de cambios existentes;
2. `READY-GATE-004`, que confirma usuarios, roles, sedes, áreas y turnos requeridos;
3. `READY-GATE-006`, que confirmará integraciones y credenciales del ambiente;
4. los gates posteriores de dispositivos, conectividad, observabilidad, backup, soporte o aceptación;
5. las pruebas funcionales o de autorización completas del paquete.

Los registros transaccionales que deben nacer durante la operación ordinaria del piloto —por ejemplo ventas, órdenes, check-ins, movimientos, eventos o evidencias generadas por el flujo— no se convierten en maestros solo para satisfacer este gate.

#### 3. Determinación del universo mínimo requerido

Para cada `package_id`, `SHELL-CI-021` deberá construir un conjunto exhaustivo denominado `required_master_set` a partir únicamente de fuentes ya aprobadas y aplicables al paquete.

La derivación seguirá esta precedencia:

1. `TREQ-*` vinculados al paquete y sus precondiciones de datos;
2. contratos canónicos de dominio, datos, integración, autorización y proceso consumidos por el paquete;
3. decisiones aprobadas del expediente `DELIV-PKG` que identifiquen datos, fixtures, entornos, dependencias, cohortes o precondiciones;
4. alcance de datos del piloto aprobado para el paquete;
5. fuente de verdad y reglas de identidad ya materializadas durante implementación, cuando la ejecución futura del gate disponga de ellas.

No se permite derivar el universo desde "lo que ya existe" en una base de datos y tratar esa observación como definición del mínimo esperado. El estado observado se compara contra el conjunto esperado; no lo define.

Cada identidad requerida aparecerá exactamente una vez en el dossier del paquete. Si dos fuentes describen la misma identidad con nombres distintos, deberán reconciliarse mediante su clave canónica o mediante una homologación explícita antes de emitir `PASS`.

#### 4. Clasificación mínima de cada identidad

Cada elemento de `required_master_set` se clasificará en una sola de estas clases semánticas:

| Clase          | Uso                                                                                                                               |
| -------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `CATALOGO`     | Lista controlada de valores permitidos o categorías consumidas por el paquete.                                                    |
| `MAESTRO`      | Entidad estable o relativamente estable que actúa como referencia operativa de otros datos o procesos.                            |
| `REFERENCIA`   | Valor o conjunto auxiliar que condiciona reglas, relaciones o interpretación sin constituir por sí mismo un maestro principal.    |
| `HOMOLOGACION` | Mapeo explícito entre identificadores canónicos VENTO y claves legacy, externas o de otro sistema cuando el contrato lo requiera. |

La clasificación no modifica el modelo de datos ni crea nuevas entidades. Sirve únicamente para impedir que una evidencia ambigua mezcle maestros, transacciones, configuración o fixtures.

#### 5. Dossier mínimo por identidad

Cada identidad requerida deberá conservar como mínimo:

| Campo                   | Regla                                                                                                            |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `package_id`            | Paquete al que pertenece la comprobación.                                                                        |
| `master_requirement_id` | Identificador estable del requerimiento de readiness dentro del dossier del paquete.                             |
| `logical_identity`      | Nombre canónico o referencia inequívoca del catálogo, maestro, referencia u homologación.                        |
| `data_class`            | `CATALOGO`, `MAESTRO`, `REFERENCIA` o `HOMOLOGACION`.                                                            |
| `required_by`           | Referencias canónicas que hacen obligatoria la identidad: `TREQ-*`, contrato, proceso o decisión aprobada.       |
| `source_of_truth`       | Sistema, repositorio lógico o servicio autoritativo que gobierna la identidad.                                   |
| `canonical_key_rule`    | Clave interna, clave canónica o regla de identidad que permite distinguir registros sin depender de texto libre. |
| `owner`                 | Propietario funcional o técnico definido por las fuentes aplicables.                                             |
| `target_environment`    | Ambiente exacto al que corresponde la evidencia.                                                                 |
| `required_scope`        | Cobertura mínima esperada: claves, registros, categorías, relaciones o subconjunto exigido por el paquete.       |
| `observed_scope`        | Cobertura observada durante la ejecución futura del gate.                                                        |
| `vigency_rule`          | Regla aplicable de activo, vigencia, estado o versión cuando exista.                                             |
| `integrity_checks`      | Controles de unicidad, completitud, consistencia, referencia u homologación que apliquen.                        |
| `evidence_refs`         | Referencias reproducibles a consultas, reportes, endpoints, manifiestos o salidas autoritativas.                 |
| `result`                | `PASS`, `FAIL`, `BLOQUEADO` o `NO_APLICA`.                                                                       |
| `blocking_reason`       | Causa concreta cuando el resultado no sea `PASS`.                                                                |

El dossier no debe almacenar secretos, credenciales, tokens, datos personales completos ni volcados productivos innecesarios. La evidencia deberá minimizar valores sensibles y conservar únicamente lo necesario para probar identidad, cobertura e integridad.

#### 6. Criterio de `PASS` por identidad

Una identidad puede recibir `PASS` únicamente cuando existe evidencia reproducible de que:

1. pertenece efectivamente al `required_master_set` del paquete;
2. existe en la fuente de verdad aprobada para el ambiente objetivo;
3. puede identificarse mediante su clave o regla canónica;
4. la cobertura observada satisface completamente el `required_scope`;
5. los registros o valores requeridos están activos, vigentes o en el estado esperado cuando exista esa dimensión;
6. no existen duplicados incompatibles con la regla de identidad;
7. las referencias obligatorias resuelven sin huérfanos dentro del alcance evaluado;
8. la completitud y consistencia exigidas por el paquete se satisfacen;
9. toda homologación requerida entre claves canónicas y legacy/externas está completa para el alcance del paquete;
10. la evidencia identifica de forma inequívoca el ambiente, la fuente autoritativa, el momento de observación y el método utilizado.

La existencia física de una tabla, colección, archivo o endpoint no demuestra por sí sola que el maestro requerido esté listo.

#### 7. Criterio de `FAIL`

Una identidad recibe `FAIL` cuando existe evidencia suficiente de cualquiera de estas condiciones:

- falta un catálogo, maestro, referencia u homologación requerido;
- falta uno o más registros o valores que forman parte del mínimo obligatorio;
- la información está en una fuente distinta de la fuente de verdad aprobada sin contrato de sincronización u homologación que lo justifique;
- existe una colisión, duplicidad o clave ambigua contraria a la identidad canónica;
- hay referencias huérfanas dentro del alcance requerido;
- la cobertura es menor que la exigida por el paquete;
- valores críticos están inactivos, vencidos o en un estado incompatible con la ventana de operación;
- una homologación requerida es parcial, contradictoria o no permite resolver una clave de forma determinista;
- el paquete depende de texto libre o de una clave legacy no homologada cuando la fuente canónica exige identificadores VENTO;
- datos creados únicamente para prueba se presentan como si fueran la línea base maestra productiva de un piloto real;
- la evidencia corresponde a otro ambiente, otra fuente de verdad o un alcance distinto del aprobado.

#### 8. Criterio de `BLOQUEADO`

Una identidad recibe `BLOQUEADO` cuando no existe evidencia suficiente para concluir `PASS` o `FAIL`, incluyendo:

- no está resuelta la fuente de verdad;
- no puede determinarse el conjunto mínimo esperado desde fuentes aprobadas;
- la identidad física, repositorio, runtime o frontera de datos del paquete continúa sin confirmar;
- el ambiente objetivo no es accesible mediante un mecanismo autorizado de comprobación;
- la evidencia disponible no permite diferenciar producción, staging, sandbox u otro ambiente;
- existe dependencia de una fuente externa todavía no activada o no demostrada;
- faltan claves canónicas o reglas de homologación necesarias para comparar esperado contra observado;
- el owner requerido no está definido en las fuentes que gobiernan esa identidad;
- la cobertura observada es parcial y no permite determinar el estado del universo requerido.

Un bloqueo no puede convertirse en `PASS` por ausencia de incidentes, por una muestra favorable ni por inferencia desde otro ambiente.

#### 9. Criterio de `NO_APLICA`

`NO_APLICA` solo es válido cuando el expediente aprobado demuestra expresamente que el paquete no requiere catálogos, maestros, referencias ni homologaciones dentro del alcance evaluado, o que una identidad inicialmente considerada queda fuera de alcance por una decisión canónica ya aprobada.

No son suficientes para declarar `NO_APLICA`:

- que no se hayan encontrado registros;
- que el paquete sea documental o de control sin revisar sus dependencias;
- que un `TREQ-*` no nombre explícitamente una tabla;
- que el ambiente todavía no esté disponible;
- que la implementación aún no haya materializado la fuente de verdad.

La ausencia de evidencia cuando la aplicabilidad es incierta produce `BLOQUEADO`, no `NO_APLICA`.

#### 10. Regla agregada por paquete

El resultado de `READY-GATE-005::<package_id>` se calcula de forma estricta:

1. cada identidad del `required_master_set` aparece exactamente una vez;
2. cualquier `FAIL` produce `FAIL` del paquete;
3. si no existe `FAIL` pero al menos una identidad está `BLOQUEADO`, el paquete queda `BLOQUEADO`;
4. el paquete obtiene `PASS` únicamente cuando todas las identidades aplicables están `PASS` y cualquier `NO_APLICA` está justificado;
5. un paquete sin identidades aplicables obtiene `NO_APLICA` solo con evidencia de alcance suficiente;
6. una muestra parcial, un subconjunto de categorías o un muestreo manual no representativo nunca se redondean a `PASS`;
7. el conteo de identidades evaluadas deberá reconciliarse con el conteo de identidades esperadas del `required_master_set`.

#### 11. Evidencia aceptable

La ejecución futura podrá utilizar evidencia autoritativa y reproducible, entre otros mecanismos:

- consultas read-only versionadas sobre la fuente de verdad;
- reportes de catálogo o maestro emitidos por el sistema autoritativo;
- respuestas de API o servicios internos que expongan identidad canónica y alcance sin revelar secretos;
- manifiestos de seed o carga inicial solo cuando correspondan al ambiente evaluado y exista trazabilidad hasta el estado observado;
- conteos y listados de claves canónicas esperadas frente a observadas;
- comprobaciones de unicidad, completitud, consistencia e integridad referencial;
- comprobaciones de vigencia o estado activo cuando sean parte del contrato;
- reportes de homologación entre claves canónicas y legacy/externas;
- evidencia de pipeline o procedimiento controlado que identifique paquete, ambiente, fuente, candidato y resultado;
- referencias durables a la salida de validadores o pruebas vinculadas a `TREQ-*`.

La evidencia deberá registrar como mínimo ambiente, fuente de verdad, momento de observación, método, universo esperado, universo observado, resultado y referencias durables.

#### 12. Evidencia insuficiente por sí sola

No constituye prueba suficiente:

- una captura de pantalla sin identidad reproducible de ambiente y fuente;
- que una tabla o colección exista;
- que un seed o fixture exista en el repositorio;
- que una migración haya terminado correctamente;
- que un pipeline esté verde sin demostrar contenido y cobertura del maestro;
- una fila de ejemplo;
- un conteo sin definición del universo esperado;
- una exportación sin fecha, fuente o ambiente;
- una consulta manual no conservada ni reproducible;
- una lista de nombres sin claves canónicas cuando estas sean obligatorias;
- asumir que un valor legacy equivale al canónico sin homologación demostrada;
- datos sintéticos, sanitizados o de prueba usados como sustituto de la línea base productiva requerida para el piloto;
- la planificación documental de `DELIV-PKG-016` o `DELIV-PKG-022` sin evidencia del estado materializado.

#### 13. Política por ambiente y datos de prueba

En CI, local, staging o sandbox pueden utilizarse fixtures deterministas, sintéticos o sanitizados cuando el contrato de pruebas del paquete lo autorice. Esos datos pueden demostrar que el software soporta un catálogo o maestro, pero no prueban por sí solos que la línea base del ambiente productivo o del piloto esté preparada.

Para un piloto productivo:

1. los maestros o referencias exigidos deberán corresponder a datos legítimos y aprobados para la operación ordinaria;
2. no se sembrarán datos productivos únicamente para obtener un `PASS` de readiness;
3. los datos transaccionales que el flujo empresarial deba crear durante el piloto nacerán mediante dicho flujo y no se precrearán como evidencia artificial;
4. un backfill, seed productivo o corrección necesaria para disponer de un maestro deberá tener su propia autorización, trazabilidad y gate aplicable; `READY-GATE-005` no autoriza esa ejecución;
5. el gate puede consumir el estado resultante de una operación ya autorizada y ejecutada, pero no sustituye la evidencia de `READY-GATE-002` cuando esa operación haya modificado datos existentes.

#### 14. Casos especiales

##### 14.1. Paquetes AURA con identidad física no resuelta

Si repositorio, runtime, fuente de datos o identidad física continúan `NO_CONFIRMADO`, el gate permanece `BLOQUEADO`. No se inventan catálogos, tablas, seeds, owners ni fuentes de verdad para cerrar el expediente.

##### 14.2. Paquetes TALENTO fuera de la línea actual

Un paquete TALENTO que continúe formalmente fuera de la línea de ejecución actual no obtiene `PASS` por anticipación. Puede recibir `NO_APLICA` para la línea actual únicamente cuando el expediente demuestre que no participa en el piloto vigente; su readiness material se evaluará en la activación autorizada correspondiente.

##### 14.3. Dependencias externas condicionadas

Cuando el maestro dependa de una fuente externa gobernada por una condición de activación, el gate queda `BLOQUEADO` hasta demostrar la activación y la identidad de la fuente. No se sustituye con una copia manual o un dataset local no autorizado.

##### 14.4. Paquetes sin cambio físico directo

Un paquete identificado canónicamente como sin cambio físico directo puede recibir `NO_APLICA` solo si su expediente demuestra además que no introduce ni consume un mínimo maestro adicional para la operación evaluada. Esa condición no se presume por el tipo de paquete.

##### 14.5. Homologaciones legacy o externas

Cuando la operación autorizada dependa de claves legacy o de terceros, el gate no exige reemplazarlas físicamente si el contrato aprobado conserva esa fuente, pero sí exige una relación inequívoca con la identidad canónica cuando `TREQ-DATA-001` lo requiera. Una homologación parcial para el universo del piloto bloquea o falla según la evidencia disponible.

#### 15. Separación entre planificación y ejecución

`READY-GATE-005` deja definido el contrato que `SHELL-CI-021::<package_id>` deberá ejecutar después de que `SHELL-CI-020::<package_id>` y las tareas de implementación aplicables hayan materializado las fuentes, datos y contratos requeridos.

La secuencia permanece:

`E5-GATE-008::<package_id> -> SHELL-CI-020::<package_id> -> BLOQUE R aplicable -> SHELL-CI-021::<package_id> -> SHELL-CI-022::<package_id>`

Durante `SHELL-CI-021::<package_id>` se construirá el `required_master_set`, se recopilará la evidencia real del ambiente objetivo y se emitirá el resultado. Esta tarea no crea, carga, corrige ni valida físicamente ningún catálogo o maestro.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** `READY-GATE-005` operacionaliza para readiness obligaciones ya registradas sobre catálogo único de datos maestros, claves canónicas, fuente de verdad, vigencia, integridad, completitud, consistencia y homologación. No introduce una nueva regla empresarial, una entidad adicional ni un comportamiento ejecutable distinto; define qué evidencia deberá demostrar posteriormente el cumplimiento de requisitos existentes por paquete.

**Requisitos existentes consumidos:** `TREQ-DATA-001` y `TREQ-DATA-003`.

**Requisitos TREQ-* creados:** 0  
**Requisitos TREQ-* modificados:** 0  
**Fragmentos 04A afectados:** 0

#### 16. Criterios de aceptación documental

`READY-GATE-005` queda documentalmente completo cuando:

1. define cómo derivar el universo exhaustivo de catálogos y datos maestros mínimos por paquete desde fuentes aprobadas;
2. impide usar el estado observado del ambiente como sustituto de la definición del universo esperado;
3. clasifica de forma inequívoca catálogos, maestros, referencias y homologaciones sin mezclar transacciones, secretos o fixtures;
4. establece un dossier mínimo trazable por identidad con fuente de verdad, clave canónica, owner, ambiente, cobertura, vigencia, integridad, evidencia y resultado;
5. define `PASS`, `FAIL`, `BLOQUEADO` y `NO_APLICA` sin permitir cierre por muestra parcial o inferencia;
6. exige reconciliar el número de identidades esperadas contra las evaluadas;
7. cubre unicidad, completitud, consistencia, referencias, vigencia y homologación cuando apliquen;
8. diferencia evidencia reproducible de señales insuficientes como tabla existente, seed presente, screenshot o pipeline verde;
9. separa expresamente fixtures de prueba de la línea base maestra requerida para un piloto productivo;
10. conserva `READY-GATE-002`, `READY-GATE-004` y `READY-GATE-006` como fronteras independientes;
11. mantiene AURA y dependencias externas bloqueadas cuando su identidad o fuente de verdad no estén confirmadas;
12. genera cero cambios `TREQ-*` y no requiere actualización del registro 04A;
13. no ejecuta cambios de datos, Supabase, configuración, despliegue ni validación operativa;
14. reserva exclusivamente `READY-GATE-006` como siguiente tarea.

#### 17. Continuidad canónica

##### ÚLTIMA TAREA APROBADA

`READY-GATE-004 — Definir criterio y evidencia para confirmar usuarios, roles, sedes, áreas y turnos requeridos`

##### TAREA ACTUAL APROBADA

`READY-GATE-005 — Definir criterio y evidencia para confirmar catálogos y datos maestros mínimos`

##### SIGUIENTE TAREA RESERVADA

`READY-GATE-006 — Definir criterio y evidencia para confirmar integraciones y credenciales del ambiente`


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
