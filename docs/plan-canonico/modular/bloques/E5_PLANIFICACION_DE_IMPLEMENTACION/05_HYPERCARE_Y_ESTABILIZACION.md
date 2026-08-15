### HYPERCARE Y ESTABILIZACIÓN

Estas tareas diseñan y aprueban el plan que `SHELL-CI-023` ejecutará después
del cutover o piloto de `SHELL-CI-022`.

### ✅ HYPERCARE-OPS-001 — Definir inicio, duración y salida del acompañamiento intensivo

**Estado:** APROBADA
**Tarea anterior:** `CUTOVER-OPS-010 — Definir condiciones y evidencia para retirar el proceso anterior`
**Tarea siguiente:** `HYPERCARE-OPS-002 — Definir responsables funcionales y técnicos`
**Tipo de tarea:** documental — definición normativa y materialización del contrato temporal de hypercare por paquete, incluyendo precondiciones de entrada, instante de inicio, base de duración, pausas y extensiones, estados temporales, criterios para convertirse en candidato de salida y handoff hacia cierre posterior; sin ejecutar monitoreo, conciliaciones, correcciones, transferencia a soporte, retiro de contingencias, cierre operativo, despliegues, migraciones, DDL/DML, backfills, modificaciones de datos, cambios remotos ni operaciones sobre Supabase
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/05_HYPERCARE_Y_ESTABILIZACION.md`
**Ejecución posterior:** `SHELL-CI-023::<package_id>` después de `SHELL-CI-022::<package_id>` y antes de `SHELL-CI-024::<package_id>`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`HYPERCARE-OPS-001` define la frontera temporal del acompañamiento intensivo que una instancia de paquete deberá utilizar después del cutover o piloto ejecutado por `SHELL-CI-022::<package_id>` y antes de la certificación de cierre de `SHELL-CI-024::<package_id>`.

La tarea responde exclusivamente a estas preguntas:

```text
¿QUÉ INSTANCIA TERMINÓ CUTOVER/PILOTO Y PUEDE ENTREGARSE A HYPERCARE?
+
¿EN QUÉ MOMENTO EXACTO COMIENZA EL ACOMPAÑAMIENTO INTENSIVO?
+
¿QUÉ REGLAS DETERMINAN SU DURACIÓN SIN INVENTAR UN NÚMERO UNIVERSAL DE DÍAS?
+
¿QUÉ EVENTOS PAUSAN, EXTIENDEN O INVALIDAN LA VENTANA?
+
¿CUÁNDO LA INSTANCIA PUEDE CONVERTIRSE EN CANDIDATA DE SALIDA?
+
¿QUÉ DECISIONES SIGUEN RESERVADAS A HYPERCARE-OPS-002..010 Y SHELL-CI-024?
=
VENTANA DE HYPERCARE TRAZABLE, ACOTADA POR EVIDENCIA Y SIN CIERRE AUTOMÁTICO POR TIEMPO
```

El propósito no es repetir el piloto ni prolongarlo por defecto. Hypercare es una fase posterior de estabilización sobre la instancia realmente ejecutada, con responsabilidad temporal continua hasta que pueda demostrarse que el acompañamiento intensivo ya no es necesario y las tareas propietarias de cierre permitan avanzar.

---

#### 2. Resultado sustantivo

Por cada instancia aplicable de `package_id`, la tarea materializa cinco piezas documentales:

1. `hypercare_entry_contract::<package_id>` — precondiciones exactas que permiten transferir la instancia desde `SHELL-CI-022` a `SHELL-CI-023`;
2. `hypercare_duration_profile::<package_id>` — fuentes y condiciones que determinan la duración de hypercare sin imponer un número universal de días;
3. `hypercare_temporal_state::<package_id>` — estado temporal de la instancia, incluyendo actividad, suspensión, extensión, candidatura de salida o invalidación;
4. `hypercare_exit_candidate_gate::<package_id>` — conjunto de condiciones que deben quedar satisfechas antes de presentar la instancia a la autoridad de cierre de `HYPERCARE-OPS-010`;
5. `hypercare_temporal_manifest::<package_id>` — expediente reproducible que enlaza identidad, handoff de CUTOVER, inicio, intervalos activos, suspensiones, extensiones, fuentes de duración, obligaciones abiertas y condición de salida.

Estas piezas son diseño para `SHELL-CI-023::<package_id>`. No demuestran que hypercare haya comenzado, transcurrido o terminado.

---

#### 3. Entradas canónicas obligatorias

`HYPERCARE-OPS-001` consume, sin redefinirlas:

- `CUTOVER-OPS-009`: decisión y evidencia de salida del piloto para la misma instancia;
- `CUTOVER-OPS-010`: handoff con superficies legacy elegibles o bloqueadas, dependencias retenidas, obligaciones de observación, soporte, conciliación o recovery e historial de decisiones;
- `DELIV-PKG-013`: requisitos no funcionales y umbrales aplicables por paquete;
- `DELIV-PKG-016`: requisitos `TREQ-*`, niveles de prueba, responsables y evidencia esperada del paquete;
- `DELIV-PKG-017`: contrato de observabilidad, señales, métricas, alertas, propietarios y conservación;
- `DELIV-PKG-018`: estados seguros, activación, suspensión, desactivación y kill switch aplicables;
- `DELIV-PKG-019`: rollout, cohortes, pausas, promoción y evidencia;
- `DELIV-PKG-020`: rollback, recovery, compensation, conciliación y tratamiento de efectos irreversibles;
- `DELIV-PKG-021`: documentación, runbooks, procedimientos y capacitación requeridos;
- `DELIV-PKG-022`: modalidad, alcance y duración del piloto ya ejecutado;
- `DELIV-PKG-023`: criterios medibles de aceptación y tratamiento de defectos utilizados para la salida del piloto;
- `READY-GATE-010..015`: soporte, observabilidad, recovery, línea base, riesgos y autorización vigentes que sigan siendo aplicables;
- `TREQ-CONT-002`: trazabilidad y autoridad de incidentes de continuidad cuando corresponda;
- `TREQ-CONT-003`: prohibición de convertir contingencia en segunda fuente de verdad;
- `TREQ-CONT-005`: obligación de reincorporación idempotente, conciliación y ausencia de pendientes sin propietario cuando corresponda;
- `SHELL-CI-023::<package_id>` como ejecutor futuro de hypercare, conciliación y estabilización;
- `SHELL-CI-024::<package_id>` como certificador futuro de salida, transferencia a soporte y destino de deuda o incidentes restantes.

Una entrada ausente, contradictoria, invalidada o perteneciente a otro candidato, ambiente o alcance no se sustituye por una estimación local.

---

#### 4. Fronteras obligatorias

`HYPERCARE-OPS-001` no define:

- personas o equipos responsables, reservado a `HYPERCARE-OPS-002`;
- monitoreo técnico de errores, colas, integraciones o rendimiento, reservado a `HYPERCARE-OPS-003`;
- monitoreo de adopción, tiempos o desviaciones operativas, reservado a `HYPERCARE-OPS-004`;
- conciliaciones de datos y efectos entre dominios, reservado a `HYPERCARE-OPS-005`;
- clasificación, prioridad o procedimiento de corrección de incidentes, reservado a `HYPERCARE-OPS-006`;
- aceptación de deuda o tareas posteriores, reservado a `HYPERCARE-OPS-007`;
- transferencia a soporte ordinario ni documentación definitiva, reservado a `HYPERCARE-OPS-008`;
- retiro de contingencias temporales, reservado a `HYPERCARE-OPS-009`;
- autoridad y evidencia de cierre funcional, técnico y operativo, reservado a `HYPERCARE-OPS-010`;
- certificación material del cierre del paquete, reservada a `SHELL-CI-024::<package_id>`.

001 define únicamente **cuándo entra una instancia en hypercare, cómo se mide documentalmente su permanencia y qué condiciones temporales permiten presentarla como candidata de salida**.

---

#### 5. Unidad temporal de hypercare

La unidad mínima es la misma instancia que llegó a ejecución:

```text
package_id
+
candidate_ref
+
environment
+
authorized_scope_ref
+
shell_ci_022_execution_ref
```

La ventana de hypercare no puede mezclar:

- dos candidatos;
- dos ambientes;
- dos alcances autorizados incompatibles;
- evidencia de ejecuciones diferentes;
- una revisión reemplazada con la revisión vigente;
- una raíz directa con otra raíz independiente solo porque compartan repositorio o aplicación.

Cuando una modalidad no posea ejecución directa independiente, la cobertura temporal se deriva de la instancia consumidora o gobernada que realmente fue ejecutada, conforme al tratamiento definido en esta tarea.

---

#### 6. Precondición obligatoria de entrada

Una instancia directa solo puede entrar a hypercare cuando exista un handoff ejecutado y reproducible desde `SHELL-CI-022::<package_id>` que demuestre, para exactamente la misma identidad:

1. `package_id` vigente;
2. candidato o revisión realmente pilotados;
3. ambiente efectivo;
4. alcance realmente ejecutado;
5. decisión vigente `APROBAR_SALIDA` de `CUTOVER-OPS-009` cuando el piloto directo sea aplicable;
6. handoff completo de `CUTOVER-OPS-010`, incluyendo la disposición documental de las superficies legacy aplicables;
7. ausencia de una reversión o recovery todavía en ejecución que impida determinar el estado estable entregado;
8. evidencia suficiente para identificar las obligaciones que continúan abiertas en hypercare;
9. continuidad de ownership entre el cierre de `SHELL-CI-022` y el inicio de `SHELL-CI-023`.

`EXIGIR_CORRECCIONES`, `BLOQUEAR_DECISION` o ausencia de una decisión válida de salida impiden iniciar hypercare directo sobre esa instancia.

La existencia de superficies `RETIRO_BLOQUEADO` o equivalentes en el handoff de 010 no bloquea por sí sola el inicio de hypercare. Esas superficies entran como obligaciones abiertas con causa y propietario, siempre que la salida del piloto sea válida y la permanencia de dichas superficies sea compatible con el estado seguro aprobado.

---

#### 7. Instante de inicio

El inicio documental se define como:

```text
hypercare_start_at
=
primer instante atribuible en que SHELL-CI-023::<package_id>
asume formalmente la estabilización de la misma instancia
tras un handoff válido de SHELL-CI-022::<package_id>
```

Reglas:

1. `hypercare_start_at` debe ser posterior o igual al cierre efectivo del handoff de `SHELL-CI-022`;
2. no puede anticiparse al resultado de salida del piloto;
3. no se infiere a partir de la fecha planificada, fin de la ventana de cutover, deploy, `FULL_100`, ausencia de incidentes o paso del tiempo;
4. debe quedar ligado a candidato, ambiente y alcance exactos;
5. si existe un lapso entre 022 y 023, ese lapso debe conservar propietario operativo y explicación; no puede existir una franja sin ownership;
6. el inicio no implica que todas las superficies legacy sean retirables ni que soporte ordinario ya pueda asumir la operación.

---

#### 8. Regla canónica de duración — `DUR-HC-001`

La duración de hypercare se define por **evidencia y obligaciones aplicables**, no por un número universal de días.

Se adopta:

```text
DUR-HC-001
=
intervalo desde hypercare_start_at
hasta la aprobación de salida que posteriormente corresponda,
con todos los requisitos mínimos de observación y estabilización aplicables satisfechos
```

Por tanto:

- no se fijan 7, 14, 30 ni otro número global de días;
- los **14 días calendario activos** de `DUR-DIR-001` pertenecen exclusivamente al piloto de `DELIV-PKG-022` y no se reinician ni se duplican automáticamente como hypercare;
- el tiempo transcurrido nunca constituye por sí solo evidencia de estabilidad;
- una instancia permanece en hypercare mientras exista una obligación aplicable que impida declararla candidata de salida;
- una fuente propietaria puede exigir una observación temporal, ciclo operativo, ventana de negocio, periodo de medición, retención o verificación específico; cuando exista, esa exigencia forma parte de `hypercare_duration_profile::<package_id>` exactamente como fue aprobada;
- cuando ninguna fuente propietaria establezca un mínimo temporal adicional, 001 no inventa uno: la duración queda determinada por el cierre verificable de las condiciones de salida de hypercare.

Esta regla evita convertir una cifra genérica en sustituto de evidencia operacional real.

---

#### 9. `hypercare_duration_profile::<package_id>`

Cada instancia ejecutable deberá resolver antes de `E5-GATE-008::<package_id>` la estructura que `SHELL-CI-023` utilizará para medir su permanencia.

El perfil deberá contener, como mínimo:

| Campo                              | Regla                                                                                     |
| ---------------------------------- | ----------------------------------------------------------------------------------------- |
| `package_id`                       | identidad exacta del expediente                                                           |
| `candidate_ref`                    | misma revisión que terminó 022                                                            |
| `environment`                      | ambiente exacto                                                                           |
| `authorized_scope_ref`             | alcance entregado a hypercare                                                             |
| `hypercare_start_preconditions`    | referencias exigidas por la sección 6                                                     |
| `duration_basis_refs`              | fuentes canónicas que imponen observación, ciclos, ventanas o condiciones temporales      |
| `minimum_observation_requirements` | requisitos temporales existentes; vacío solo cuando ninguna fuente propietaria impone uno |
| `active_time_rule`                 | regla para distinguir observación válida de periodos suspendidos                          |
| `extension_conditions`             | eventos que impiden mantener la fecha candidata de salida                                 |
| `invalidation_conditions`          | cambios que obligan a invalidar la ventana                                                |
| `exit_candidate_requirements`      | conjunto de obligaciones que deben quedar cerradas antes de presentar la salida           |
| `shell_ci_024_handoff_requirement` | referencia a la certificación posterior, sin anticiparla                                  |

No se permite dejar `duration_basis_refs` sin resolución. Si ninguna fuente impone duración adicional, deberá declararse expresamente `SIN_MINIMO_TEMPORAL_ADICIONAL` y conservarse la salida por evidencia.

---

#### 10. Tiempo activo, suspensión y extensión

El tiempo calendario y el tiempo útil de estabilización no se confunden.

Una instancia puede permanecer cronológicamente dentro de hypercare sin acumular evidencia útil de estabilidad cuando exista una condición que impida observarla de forma representativa o segura.

Se distinguen:

- **intervalo activo:** el paquete opera dentro del alcance autorizado y las fuentes necesarias para producir la evidencia exigible están disponibles;
- **intervalo suspendido:** existe una condición que impide considerar ese periodo como evidencia válida de estabilidad o impide ampliar exposición;
- **extensión:** la ventana continúa más allá de una expectativa previa porque todavía existen obligaciones abiertas o porque una condición material exige nueva observación;
- **invalidación:** la identidad o el contrato cambió de forma que la evidencia anterior ya no puede sustentar la misma ventana.

La duración real de hypercare incluye cronológicamente sus suspensiones, pero una suspensión no se presenta como evidencia positiva de operación estable.

---

#### 11. Causas que impiden una salida temporal

La instancia no puede convertirse en candidata de salida mientras exista al menos una de estas condiciones aplicables:

1. monitoreo técnico obligatorio pendiente o bloqueado, según `HYPERCARE-OPS-003`;
2. monitoreo de adopción, tiempos o desviaciones operativas pendiente o bloqueado, según `HYPERCARE-OPS-004`;
3. conciliación requerida pendiente, incierta o no resuelta, según `HYPERCARE-OPS-005`;
4. incidente cuya clasificación o tratamiento impida cierre, según `HYPERCARE-OPS-006`;
5. deuda o tarea posterior sin decisión, propietario o destino, según `HYPERCARE-OPS-007`;
6. transferencia a soporte ordinario no elegible según `HYPERCARE-OPS-008`;
7. contingencia temporal sin disposición válida según `HYPERCARE-OPS-009`;
8. condición de cierre funcional, técnico u operativo no satisfecha para `HYPERCARE-OPS-010`;
9. obligación de recovery, rollback, compensación o conciliación de `DELIV-PKG-020` todavía abierta;
10. superficie legacy retenida cuyo bloqueo produzca una obligación de observación, soporte o recovery todavía vigente;
11. evidencia temporal mínima exigida por una fuente propietaria todavía incompleta;
12. cambio material que invalide candidato, ambiente, alcance o contrato.

La lista no define los criterios internos de 002..010; únicamente fija su efecto sobre el reloj y la salida de 001.

---

#### 12. Estados temporales

`hypercare_temporal_state::<package_id>` utiliza exactamente uno de estos estados documentales:

| Estado               | Semántica                                                                                                                                       |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `NO_INICIADA`        | la instancia todavía no posee handoff válido hacia 023                                                                                          |
| `ACTIVA`             | hypercare comenzó y se encuentra reuniendo evidencia de estabilización                                                                          |
| `SUSPENDIDA`         | la instancia sigue bajo ownership de hypercare, pero existe una condición que impide considerar el periodo como evidencia normal de estabilidad |
| `EXTENDIDA`          | la ventana continúa porque una obligación aplicable sigue abierta o exige observación adicional                                                 |
| `CANDIDATA_A_SALIDA` | se cumplieron las condiciones de 001 para presentar la instancia a la autoridad de cierre de 010                                                |
| `INVALIDADA`         | un cambio material impide reutilizar la ventana y su evidencia como base de salida de la misma instancia                                        |
| `NO_APLICA_DIRECTA`  | la modalidad no posee reloj independiente y su cobertura se deriva de consumidores o raíces gobernadas                                          |
| `FUERA_DE_LINEA`     | la raíz no participa en la ejecución actual conforme a su gate canónico                                                                         |

`CANDIDATA_A_SALIDA` no equivale a cierre aprobado ni a paquete certificado.

---

#### 13. Suspensión y reanudación

Una suspensión conserva el ownership del paquete y no borra el historial.

Durante `SUSPENDIDA`:

- no se declara estabilidad por ausencia de observaciones;
- no se acorta la duración pendiente;
- no se transforma evidencia previa en inválida automáticamente;
- se conserva el último estado estable conocido y la causa de suspensión;
- la condición debe quedar vinculada a la tarea propietaria exacta de `HYPERCARE-OPS-003..009`, `DELIV-PKG-020` u otra fuente canónica aplicable;
- la reanudación requiere demostrar que la causa que impedía observar o estabilizar fue resuelta o quedó bajo una disposición expresamente permitida.

La reanudación no produce `CANDIDATA_A_SALIDA` automáticamente. La instancia vuelve a `ACTIVA` o `EXTENDIDA` y debe completar las obligaciones que sigan siendo aplicables.

---

#### 14. Extensión de hypercare

Hypercare se extiende sin necesidad de inventar una nueva fecha objetivo cuando:

1. una fuente propietaria exige observación adicional después de una corrección;
2. un incidente real obliga a demostrar recuperación estable;
3. una conciliación necesita completar su condición de convergencia;
4. una contingencia temporal sigue siendo necesaria;
5. soporte ordinario todavía no cumple su criterio de transferencia;
6. existe deuda aceptable únicamente si su tratamiento posterior todavía requiere cobertura intensiva;
7. una superficie legacy retenida exige observación o recovery intensivos;
8. una señal o desviación permanece dentro de una condición permitida pero exige seguimiento antes del cierre;
9. una corrección compatible con el mismo candidato requiere evidencia de regresión antes de presentar salida.

La extensión no autoriza ampliar el alcance, cohorte, permisos, sedes, dispositivos, datos o ambiente.

---

#### 15. Cambio material e invalidación

La ventana queda `INVALIDADA` cuando cambia materialmente cualquiera de estos elementos de forma que la evidencia anterior deje de representar la misma instancia:

- candidato, release, artefacto o revisión;
- ambiente;
- alcance autorizado;
- cohorte cuyo cambio obligaría a nueva ventana bajo `DELIV-PKG-022`;
- autorización o contrato de servidor material;
- modelo o contrato de datos relevante;
- integración o contrato externo relevante;
- estrategia de rollout o recovery que cambie la exposición evaluada;
- fuente de verdad o frontera de autoridad;
- condición cuya fuente propietaria exija repetir piloto antes de volver a hypercare.

La invalidación no reinicia silenciosamente un reloj. El alcance afectado vuelve a la tarea o ciclo propietario que deba revalidarlo y solo podrá crear una nueva instancia de hypercare después de un nuevo handoff válido de `SHELL-CI-022`.

Las evidencias históricas permanecen vinculadas a la revisión que realmente observaron.

---

#### 16. Criterio de candidatura de salida

Una instancia solo puede recibir `CANDIDATA_A_SALIDA` cuando, para la misma identidad:

1. existe `hypercare_start_at` válido;
2. se cumplieron todos los requisitos temporales explícitos de `hypercare_duration_profile`;
3. no existe suspensión activa;
4. no existe invalidación;
5. las obligaciones de monitoreo técnico que `HYPERCARE-OPS-003` determine aplicables están satisfechas;
6. las obligaciones de monitoreo operativo de `HYPERCARE-OPS-004` están satisfechas;
7. las conciliaciones de `HYPERCARE-OPS-005` que sean requisito de salida están cerradas conforme a su contrato;
8. los incidentes de `HYPERCARE-OPS-006` tienen la disposición exigida para permitir cierre;
9. toda deuda o tarea posterior está gobernada conforme a `HYPERCARE-OPS-007`;
10. el criterio de transferencia a soporte de `HYPERCARE-OPS-008` está satisfecho;
11. las contingencias temporales de `HYPERCARE-OPS-009` poseen la disposición exigida;
12. no existe obligación abierta de rollback, recovery, compensación o conciliación que requiera mantener acompañamiento intensivo;
13. toda superficie legacy retenida tiene un tratamiento compatible con la salida de hypercare;
14. la evidencia es actual, atribuible, reproducible y corresponde al mismo candidato, ambiente y alcance.

Cumplir estas condiciones **solo habilita la candidatura**. La autoridad y evidencia para aprobar el cierre funcional, técnico y operativo pertenecen a `HYPERCARE-OPS-010`.

---

#### 17. Salida real y certificación posterior

001 preserva tres conceptos distintos:

```text
CANDIDATA_A_SALIDA
→ condiciones temporales y de dependencia de 001 satisfechas

APROBACIÓN DE CIERRE HYPERCARE
→ decisión propietaria de HYPERCARE-OPS-010

CERTIFICACIÓN DEL PAQUETE
→ SHELL-CI-024::<package_id>
```

No se permite:

- convertir el fin de un periodo calendario en cierre;
- considerar `CANDIDATA_A_SALIDA` como transferencia ya ejecutada a soporte;
- cerrar deuda o incidentes por terminar hypercare;
- retirar contingencias por inferencia;
- considerar una superficie legacy físicamente retirada por haber quedado elegible;
- presentar la aprobación documental de 010 como evidencia de certificación ejecutada por 024.

---

#### 18. Relación con `CUTOVER-OPS-010`

El handoff de CUTOVER se conserva sin reinterpretación.

Hypercare puede recibir:

- superficies `RETIRO_ELEGIBLE` todavía no retiradas;
- superficies cuyo retiro está bloqueado;
- dependencias legacy retenidas;
- obligaciones de observación, soporte, conciliación o recovery;
- evidencia de uso, autoridad y consumidores que debe permanecer vigente;
- historial de invalidaciones.

Reglas:

1. `RETIRO_ELEGIBLE` no es precondición universal para iniciar hypercare;
2. una superficie bloqueada puede permanecer durante hypercare si el bloqueo y su uso retenido son compatibles con el estado seguro aprobado;
3. una dependencia legacy que siga siendo necesaria para recovery o soporte impide tratarla como retirada;
4. el retiro lógico o físico posterior permanece fuera de 001;
5. cualquier cambio material que invalide la decisión de 010 debe conservarse como obligación abierta y reevaluarse en su fuente propietaria.

---

#### 19. Relación con rollout y piloto

Hypercare es posterior al piloto de `DELIV-PKG-022` y no altera su historia.

Por tanto:

- no reinicia `DUR-DIR-001`;
- no completa días de piloto faltantes;
- no convierte una pausa de piloto en tiempo válido de hypercare;
- no corrige una salida de piloto inválida;
- no amplía la cohorte por entrar en estabilización;
- no sustituye los gates de promoción de `DELIV-PKG-019`;
- no transforma automáticamente una promoción en evidencia de estabilidad;
- no autoriza que una raíz bloqueada entre en hypercare sin haber pasado por su ejecución aplicable.

Cuando una expansión posterior forme parte del rollout ya aprobado, su efecto sobre hypercare deberá conservar la misma identidad y no podrá ampliar silenciosamente el alcance que 022 entregó.

---

#### 20. Defectos y regresión durante hypercare

Si `SHELL-CI-023::<package_id>` detecta un defecto real:

1. la observación se conserva con la identidad y evidencia reales;
2. `HYPERCARE-OPS-006` define su clasificación, prioridad y procedimiento de corrección;
3. `HYPERCARE-OPS-007` gobierna únicamente deuda o trabajo posterior que pueda aceptarse conforme a sus reglas;
4. cuando el defecto requiera protección contra regresión, deberá materializarse el requisito `TREQ-*` correspondiente antes o conjuntamente con su corrección, conforme al protocolo canónico;
5. la ventana de hypercare se suspende o extiende cuando la fuente propietaria así lo exija;
6. no se inventa en 001 un identificador de defecto, tarea correctiva o requisito de regresión para un hecho que todavía no existe.

La ausencia actual de un defecto real es la razón por la que 001 no crea requisitos de regresión anticipados.

---

#### 21. Tratamiento por modalidad heredada

`HYPERCARE-OPS-001` conserva las **207 raíces** y la modalidad heredada de `DELIV-PKG-022` y CUTOVER:

| Modalidad heredada            | Cantidad | Tratamiento temporal de hypercare                                                                                                        |
| ----------------------------- | -------: | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `PILOT-DIRECT-001`            |  **160** | ventana directa de `SHELL-CI-023::<package_id>` después de un handoff válido de 022                                                      |
| `PILOT-SHARED-001`            |    **3** | `NO_APLICA_DIRECTA`; cobertura derivada de los consumidores directos que ejercen el contrato compartido                                  |
| `PILOT-CONTROL-001`           |   **26** | `NO_APLICA_DIRECTA`; cobertura observacional durante las ventanas de las raíces gobernadas, salvo frontera ejecutable propia ya aprobada |
| AURA bloqueada                |   **14** | no inicia hypercare mientras persista su gate                                                                                            |
| dependencia externa bloqueada |    **2** | no inicia hypercare mientras persista el gate externo                                                                                    |
| TALENTO fuera de línea actual |    **2** | `FUERA_DE_LINEA` en la línea vigente                                                                                                     |

Reconciliación:

```text
160 + 3 + 26 + 14 + 2 + 2 = 207
```

001 no reasigna `package_id`, perfil técnico, modalidad, gate, repositorio ni propietario.

---

#### 22. Cobertura shared y control

##### 22.1. `PILOT-SHARED-001`

Una raíz compartida:

- no recibe un reloj independiente ficticio;
- se considera bajo cobertura intensiva mientras las instancias directas consumidoras relevantes se encuentren en hypercare;
- no puede considerarse candidata de salida si una obligación propia del contrato compartido sigue bloqueando un consumidor aplicable;
- conserva evidencia por cada consumidor real sin fusionarla en una ejecución inexistente.

##### 22.2. `PILOT-CONTROL-001`

Una raíz de control:

- observa las ventanas que gobierna;
- no adquiere una duración independiente por inferencia;
- una condición propia del control puede extender o bloquear la salida de las raíces que realmente gobierna cuando su contrato así lo determine;
- no se transforma en implementación física si no existe una frontera ejecutable propia aprobada.

---

#### 23. Evidencia temporal mínima

`hypercare_temporal_manifest::<package_id>` deberá permitir reconstruir, como mínimo:

1. `package_id`;
2. candidato o revisión;
3. ambiente;
4. alcance autorizado;
5. referencia de ejecución de `SHELL-CI-022`;
6. decisión de salida aplicable de `CUTOVER-OPS-009`;
7. handoff de `CUTOVER-OPS-010`;
8. `hypercare_start_at` real cuando exista ejecución;
9. fuentes de `duration_basis_refs`;
10. requisitos temporales adicionales aplicables o declaración `SIN_MINIMO_TEMPORAL_ADICIONAL`;
11. intervalos activos;
12. intervalos suspendidos;
13. motivo y propietario de cada suspensión;
14. extensiones y su fundamento;
15. cambios materiales e invalidaciones;
16. obligaciones abiertas por `HYPERCARE-OPS-003..009`;
17. evidencia de candidatura de salida cuando corresponda;
18. referencia posterior a la decisión de `HYPERCARE-OPS-010` cuando exista;
19. referencia posterior a `SHELL-CI-024::<package_id>` cuando exista;
20. historial de estados sin reescritura destructiva.

En E5 estos campos describen el formato esperado. No se rellenan con timestamps, resultados o evidencia operativa inventados.

---

#### 24. Condiciones de bloqueo documental

El contrato temporal queda `BLOQUEADO` para futura ejecución cuando:

1. no puede identificarse la misma instancia que terminó 022;
2. falta la decisión de salida exigible de 009;
3. el handoff de 010 es incompleto para una superficie legacy aplicable;
4. candidato, ambiente o alcance se contradicen entre fuentes;
5. no puede resolverse qué obligaciones continúan abiertas;
6. una fuente exige un periodo o ciclo específico y no existe forma de materializarlo sin inventar el valor;
7. existe un lapso previsto sin ownership entre 022 y 023;
8. una modalidad derivada pretende recibir un reloj directo sin fuente;
9. una raíz bloqueada o fuera de línea se intenta presentar como ejecutada;
10. la única forma de declarar salida sería usar tiempo transcurrido sin evidencia;
11. una obligación se deja sin tarea propietaria exacta;
12. la salida exigiría anticipar decisiones reservadas a 002..010.

Todo bloqueo conserva causa, fuente propietaria, tarea responsable y condición objetiva de salida.

---

#### 25. Invalidación del manifiesto

`hypercare_temporal_manifest::<package_id>` queda invalidado para futuras decisiones cuando deja de representar la instancia vigente.

La invalidación:

- no elimina evidencia histórica;
- no reescribe el periodo anterior;
- no convierte una revisión antigua en la nueva;
- no autoriza reiniciar directamente en `ACTIVA`;
- exige volver al punto de ejecución propietario que corresponda y producir un nuevo handoff válido antes de iniciar otra ventana.

Una corrección que no cambie materialmente la identidad podrá extender la misma ventana únicamente cuando la fuente propietaria permita demostrar continuidad de candidato, ambiente, alcance y contrato.

---

#### 26. Handoff a `HYPERCARE-OPS-002`

001 entrega a 002 únicamente la frontera temporal y las responsabilidades que deben quedar resueltas:

```text
INSTANCIA EXACTA
+
HANDOFF VÁLIDO DE 022 / CUTOVER
+
REGLA DE INICIO
+
DUR-HC-001 Y FUENTES DE DURACIÓN
+
ESTADOS DE ACTIVIDAD / SUSPENSIÓN / EXTENSIÓN
+
CONDICIONES QUE IMPIDEN SALIDA
+
OBLIGACIONES ABIERTAS
=
FRONTERA PARA RESOLVER RESPONSABLES FUNCIONALES Y TÉCNICOS
```

`HYPERCARE-OPS-002` deberá resolver quién cubre esas obligaciones, pero no podrá cambiar por inferencia el inicio, la identidad, la modalidad, la duración contractual o el criterio de candidatura de salida definido por 001.

---

#### 27. Separación entre planificación y ejecución

`HYPERCARE-OPS-001` es exclusivamente documental.

No ejecuta:

- hypercare real;
- monitoreo;
- alertas;
- consultas operativas;
- conciliaciones;
- correcciones;
- retries;
- compensaciones;
- rollback o recovery;
- capacitación;
- transferencia a soporte;
- retiro de contingencias;
- retiro lógico o físico de legacy;
- cierre funcional, técnico u operativo;
- despliegues;
- cambios de feature flags;
- migraciones;
- DDL/DML;
- backfills;
- cambios de datos;
- cambios de RLS o grants;
- operaciones remotas sobre Supabase.

La ejecución de hypercare, conciliación, respuesta y estabilización corresponde a `SHELL-CI-023::<package_id>`. La certificación de salida y transferencia corresponde a `SHELL-CI-024::<package_id>`.

---

#### 28. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0
**Fragmentos 04A afectados:** 0

**Justificación:** `HYPERCARE-OPS-001` define exclusivamente la orquestación documental y temporal de una fase de ejecución futura a partir de contratos ya aprobados de piloto, aceptación, observabilidad, rollback, continuidad y cierre. No introduce comportamiento empresarial de runtime, autorización, cálculo, persistencia, transición de estado de dominio, integración, algoritmo técnico, umbral NFR, mecanismo de recuperación ni regla de datos nueva. Los defectos reales que `SHELL-CI-023` detecte deberán producir su requisito de regresión cuando corresponda, pero 001 no inventa requisitos para defectos todavía inexistentes.

---

#### 29. Criterios de aceptación documental

`HYPERCARE-OPS-001` queda documentalmente completo cuando:

1. conserva `CUTOVER-OPS-010 → HYPERCARE-OPS-001 → HYPERCARE-OPS-002`;
2. mantiene `SHELL-CI-022 → SHELL-CI-023 → SHELL-CI-024` como secuencia de ejecución;
3. define `hypercare_entry_contract`, `hypercare_duration_profile`, `hypercare_temporal_state`, `hypercare_exit_candidate_gate` y `hypercare_temporal_manifest`;
4. una instancia directa solo entra con handoff válido de 022 para el mismo paquete, candidato, ambiente y alcance;
5. exige la decisión de salida de 009 cuando el piloto directo sea aplicable;
6. exige el handoff de 010 sin convertir `RETIRO_ELEGIBLE` en requisito universal de entrada;
7. permite conservar superficies legacy bloqueadas únicamente como obligaciones explícitas y compatibles con el estado seguro;
8. define `hypercare_start_at` de forma atribuible y posterior al handoff de 022;
9. prohíbe inferir inicio por deploy, fin de cutover, `FULL_100`, calendario o ausencia de incidentes;
10. define `DUR-HC-001` por evidencia y obligaciones aplicables;
11. no reutiliza los 14 días de `DUR-DIR-001` como duración automática de hypercare;
12. no inventa un número universal de días;
13. obliga a materializar toda fuente temporal específica cuando una fuente propietaria sí la exija;
14. distingue tiempo calendario, intervalo activo, suspensión, extensión e invalidación;
15. una suspensión no se cuenta como evidencia positiva de estabilidad;
16. una extensión no amplía alcance, cohorte, permisos, datos, sedes, dispositivos o ambiente;
17. un cambio material invalida la ventana y obliga a volver al ciclo propietario correspondiente;
18. conserva evidencia histórica de la revisión realmente observada;
19. limita los estados a `NO_INICIADA`, `ACTIVA`, `SUSPENDIDA`, `EXTENDIDA`, `CANDIDATA_A_SALIDA`, `INVALIDADA`, `NO_APLICA_DIRECTA` y `FUERA_DE_LINEA`;
20. `CANDIDATA_A_SALIDA` no equivale a cierre aprobado;
21. 002 conserva propiedad de responsables;
22. 003 conserva propiedad de monitoreo técnico;
23. 004 conserva propiedad de monitoreo operativo y adopción;
24. 005 conserva propiedad de conciliaciones;
25. 006 conserva propiedad de incidentes y procedimiento de corrección;
26. 007 conserva propiedad de deuda y tareas posteriores;
27. 008 conserva propiedad de transferencia a soporte ordinario y documentación definitiva;
28. 009 conserva propiedad del retiro de contingencias temporales;
29. 010 conserva autoridad y evidencia de cierre funcional, técnico y operativo;
30. 024 conserva certificación material de salida y transferencia;
31. todo bloqueo tiene causa, tarea propietaria y condición objetiva de salida;
32. ningún pendiente narrativo queda sin dueño documental exacto;
33. los defectos futuros que requieran regresión quedan sujetos al protocolo de creación de `TREQ-*` sin inventar IDs en 001;
34. conserva las 207 raíces con distribución `160 + 3 + 26 + 14 + 2 + 2`;
35. shared y control no reciben un reloj independiente ficticio;
36. AURA, EXT y TALENTO conservan sus gates;
37. no se ejecutan código, despliegues, monitoreo, conciliación, correcciones, migraciones, DDL/DML, backfills, cambios de datos, configuración remota ni operaciones de Supabase;
38. se crean cero requisitos `TREQ-*`, se modifican cero requisitos `TREQ-*` y se afectan cero fragmentos 04A.

---

#### 30. Continuidad

##### ÚLTIMA TAREA APROBADA
CUTOVER-OPS-010 — Definir condiciones y evidencia para retirar el proceso anterior

##### TAREA ACTUAL APROBADA
HYPERCARE-OPS-001 — Definir inicio, duración y salida del acompañamiento intensivo

##### SIGUIENTE TAREA RESERVADA
HYPERCARE-OPS-002 — Definir responsables funcionales y técnicos


### ✅ HYPERCARE-OPS-002 — Definir responsables funcionales y técnicos

**Estado:** APROBADA
**Tarea anterior:** `HYPERCARE-OPS-001 — Definir inicio, duración y salida del acompañamiento intensivo`
**Tarea siguiente:** `HYPERCARE-OPS-003 — Definir monitoreo de errores, colas, integraciones y rendimiento`
**Tipo de tarea:** documental — definición normativa y materialización por `package_id` de la responsabilidad funcional y técnica que gobernará el acompañamiento intensivo, incluyendo autoridad, cobertura, suplencia, escalamiento y segregación, consumiendo propietarios y responsables ya aprobados sin crear cargos, personas, permisos ni autoridades nuevas; sin ejecutar hypercare, monitoreo, diagnóstico, correcciones, conciliaciones, rollback, transferencias a soporte, cambios de configuración, despliegues, migraciones, DDL/DML, backfills, modificaciones de datos ni operaciones sobre Supabase
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`HYPERCARE-OPS-002` define quién conserva la responsabilidad funcional y quién conserva la responsabilidad técnica durante la fase de acompañamiento intensivo diseñada por `HYPERCARE-OPS-001`, para cada uno de los 207 `package_id` canónicos.

La tarea resuelve exclusivamente:

```text
PAQUETE / CANDIDATO / AMBIENTE / ALCANCE
+
RESPONSABLE FUNCIONAL CANÓNICO
+
RESPONSABLE TÉCNICO CANÓNICO
+
COBERTURA, SUPLENCIA Y ESCALAMIENTO VIGENTES
+
FRONTERAS DE AUTORIDAD SIN SOLAPAMIENTO AMBIGUO
=
RESPONSABILIDAD DE HYPERCARE TRAZABLE Y EJECUTABLE
```

La tarea no crea una organización paralela de hypercare. Reutiliza las autoridades y responsables ya materializados en el expediente del paquete y define cómo deben quedar vinculados a `SHELL-CI-023::<package_id>`.

---

#### 2. Resultado sustantivo

Por cada `package_id`, la tarea materializa cuatro piezas documentales:

1. `hypercare_responsibility_resolution::<package_id>` — resolución de las fuentes canónicas que determinan responsabilidad funcional, responsabilidad técnica, cobertura y escalamiento;
2. `hypercare_functional_technical_map::<package_id>` — mapa de separación y cooperación entre autoridad funcional y técnica para la misma instancia de hypercare;
3. `hypercare_coverage_manifest::<package_id>` — contrato de disponibilidad, suplencia, handoff y escalamiento que deberá poder demostrarse antes y durante la ejecución;
4. `hypercare_responsibility_handoff::<package_id>` — conjunto de referencias que las tareas `HYPERCARE-OPS-003..010` y `SHELL-CI-023::<package_id>` consumirán sin reinterpretar ownership.

Estas piezas quedan `ESPECIFICADAS`. No prueban disponibilidad real de una persona, ejecución de turnos, respuesta a incidentes ni cierre de hypercare.

---

#### 3. Entradas obligatorias y precedencia

`HYPERCARE-OPS-002` consume sin redefinir:

- `HYPERCARE-OPS-001`: identidad de instancia, inicio, ciclo de vida, suspensión, extensión y elegibilidad temporal de salida;
- `DELIV-PKG-014`: repositorios, archivos, símbolos y ownership materializados por paquete;
- `DELIV-PKG-015`: topología, dependencias y unidades de implementación;
- `DELIV-PKG-017`: contrato de observabilidad y `Responsable de decisión` `OWN-*` por cada una de las 207 raíces;
- `DELIV-PKG-019`: rollout y participación del responsable técnico del repositorio en decisiones de promoción;
- `DELIV-PKG-020`: `functional_authority_ref`, `technical_authority_ref`, autoridad de recovery/rollback y segregación aplicables;
- `DELIV-PKG-021`: runbooks, procedimientos, audiencia y soporte requeridos;
- `DELIV-PKG-022`: modalidad y alcance de piloto de cada raíz;
- `READY-GATE-010`: cobertura efectiva de soporte, responsables, suplencia y escalamiento;
- `READY-GATE-011`: propietarios de señales y rutas de respuesta de observabilidad;
- `READY-GATE-014`: autoridades de riesgo y condiciones de suspensión;
- `CUTOVER-OPS-006`: semántica de continuar, pausar y revertir durante el piloto, como antecedente de decisiones transferidas a hypercare;
- `CUTOVER-OPS-007`: historial de incidentes y decisiones entregado a hypercare;
- `CUTOVER-OPS-010`: superficies elegibles, bloqueadas, dependencias legacy y obligaciones abiertas entregadas a hypercare;
- `TREQ-CONT-002`: obligación vigente de autoridad explícita, responsables, sustitutos, escalamiento y bitácora para incidentes de continuidad.

Precedencia obligatoria:

```text
OWNERSHIP DEL PAQUETE
→ AUTORIDAD FUNCIONAL / TÉCNICA YA APROBADA
→ COBERTURA Y SUPLENCIA DE READINESS
→ RESPONSABILIDAD DE HYPERCARE
```

Una fuente de hypercare nunca puede sobrescribir una autoridad propietaria anterior por conveniencia operativa.

---

#### 4. Invariante de responsabilidad

Para una misma instancia:

```text
RESPONSABILIDAD FUNCIONAL
≠ RESPONSABILIDAD TÉCNICA
≠ EJECUTOR DE UNA ACCIÓN
≠ SOPORTE ORDINARIO
≠ AUTORIDAD FINAL DE CIERRE
```

Las responsabilidades pueden recaer materialmente en la misma persona únicamente cuando las fuentes propietarias lo permiten y no se rompe segregación. Que una persona cubra dos funciones no fusiona sus autoridades ni elimina la evidencia exigida para cada decisión.

`HYPERCARE-OPS-002` no crea un rol universal denominado “líder de hypercare”, “war room owner”, “incident commander” o equivalente.

---

#### 5. Unidad mínima de resolución

La responsabilidad se resuelve para:

```text
package_id
+
candidate_ref
+
environment
+
authorized_scope_ref
+
hypercare_lifecycle_manifest_ref
```

Cuando el paquete tenga unidades físicas o repositorios múltiples, la resolución técnica conserva las unidades exactas y sus responsables; no colapsa varios repositorios bajo una persona o autoridad inferida.

Una resolución perteneciente a otro candidato, ambiente, alcance o revisión no es reutilizable como cobertura de la instancia actual.

---

#### 6. Responsable funcional

El `functional_owner_ref` de hypercare se toma exclusivamente del `Responsable de decisión` `OWN-*` de la fila homónima de `DELIV-PKG-017`, preservando cualquier especialización de autoridad ya establecida por `DELIV-PKG-018..020` y readiness.

El responsable funcional:

1. conserva la interpretación autoritativa del impacto sobre el proceso, capacidad, usuarios y resultado empresarial dentro de su alcance aprobado;
2. confirma qué efecto funcional observado pertenece realmente al paquete y qué efecto debe escalarse a otra fuente propietaria;
3. participa en decisiones que las fuentes vigentes exijan como funcionales, incluida la valoración de exposición empresarial y la aceptación o rechazo de continuidad cuando corresponda;
4. mantiene propietario para toda obligación funcional abierta durante hypercare;
5. no modifica por sí solo severidades, umbrales, permisos, alcance, rollout, rollback, datos ni contratos;
6. no puede declarar cierre final de hypercare por sí solo; esa autoridad permanece en `HYPERCARE-OPS-010` y la certificación material en `SHELL-CI-024::<package_id>`.

Un `OWN-*` es una referencia canónica de responsabilidad. Esta tarea no lo transforma en nombre de persona ni inventa una identidad nominal.

---

#### 7. Responsable técnico

El `technical_owner_ref` se resuelve desde `technical_authority_ref` de `DELIV-PKG-020` para la fila homónima y conserva la identidad técnica de repositorio o unidad materializada por `DELIV-PKG-014`, `DELIV-PKG-015` y `DELIV-PKG-019`.

El responsable técnico:

1. conserva ownership técnico del candidato, runtime, repositorio, unidad de implementación y dependencias que le correspondan;
2. recibe y dirige técnicamente el diagnóstico cuando una señal de `HYPERCARE-OPS-003` o una desviación de `HYPERCARE-OPS-004` requiera actuación;
3. conserva la trazabilidad entre síntoma, versión, configuración, evidencia, cambio y resultado técnico;
4. ejecuta o coordina las acciones técnicas únicamente mediante los procedimientos y autoridades que `HYPERCARE-OPS-006`, `DELIV-PKG-020` y las tareas de implementación propietarias permitan;
5. no acepta por sí solo riesgo empresarial, no amplía alcance y no cambia ownership funcional;
6. no convierte una corrección técnica exitosa en cierre funcional u operativo.

Si una unidad física involucra más de un repositorio, cada responsabilidad técnica aplicable permanece identificable. No se inventa un único propietario técnico para ocultar dependencias múltiples.

---

#### 8. Campos obligatorios del mapa funcional/técnico

`hypercare_functional_technical_map::<package_id>` deberá conservar como mínimo:

| Campo                             | Regla                                                            |
| --------------------------------- | ---------------------------------------------------------------- |
| `package_id`                      | identidad canónica exacta                                        |
| `candidate_ref`                   | mismo candidato entregado por 001                                |
| `environment`                     | mismo ambiente entregado por 001                                 |
| `authorized_scope_ref`            | mismo alcance de la instancia                                    |
| `functional_owner_ref`            | `OWN-*` de la fila homónima de `DELIV-PKG-017`                   |
| `functional_authority_source_ref` | fuente exacta que gobierna la decisión funcional aplicable       |
| `technical_owner_ref`             | `technical_authority_ref` de la fila homónima de `DELIV-PKG-020` |
| `technical_repository_refs`       | repositorios/unidades vigentes de `DELIV-PKG-014/015/019`        |
| `support_coverage_ref`            | cobertura vigente de `READY-GATE-010`                            |
| `observability_routing_ref`       | ownership/routing vigente de `DELIV-PKG-017` y `READY-GATE-011`  |
| `recovery_authority_ref`          | autoridad vigente de `DELIV-PKG-020` cuando aplique              |
| `substitute_ref`                  | suplente autorizado cuando la fuente lo exija                    |
| `escalation_ref`                  | ruta de escalamiento vigente                                     |
| `coverage_state`                  | estado documental de cobertura de la instancia                   |
| `resolution_state`                | `ESPECIFICADO`, `BLOQUEADO`, `INVALIDADO` o `NO_APLICA_DIRECTA`  |

No se almacenan credenciales ni datos personales innecesarios como parte del contrato documental.

---

#### 9. Responsabilidades funcionales durante el ciclo de hypercare

La responsabilidad funcional cubre, según aplicabilidad:

- entrada: confirmar que el alcance empresarial entregado por `HYPERCARE-OPS-001` es el que se acompañará;
- estabilización: responder por la interpretación de impacto funcional y por el destino de toda obligación empresarial abierta;
- incidentes: aportar autoridad funcional conforme a `HYPERCARE-OPS-006`, sin redefinir su clasificación o procedimiento;
- conciliación: conservar la fuente funcional que `HYPERCARE-OPS-005` deba usar, sin ejecutar la conciliación desde 002;
- deuda: participar en la disposición que `HYPERCARE-OPS-007` defina cuando exista impacto funcional;
- transferencia: entregar a `HYPERCARE-OPS-008` ownership y pendientes funcionales trazables;
- contingencias: participar conforme a la autoridad propietaria en la decisión documentada por `HYPERCARE-OPS-009`;
- cierre: aportar la evidencia funcional requerida por `HYPERCARE-OPS-010`, sin anticipar su decisión.

---

#### 10. Responsabilidades técnicas durante el ciclo de hypercare

La responsabilidad técnica cubre, según aplicabilidad:

- entrada: confirmar correlación entre candidato, artefacto, repositorio, runtime, configuración y ambiente que recibe `SHELL-CI-023`;
- estabilización: conservar ownership técnico de diagnóstico, contención y tratamiento conforme a los contratos vigentes;
- monitoreo: recibir las señales que `HYPERCARE-OPS-003` formalice y mantener su ruta técnica de respuesta;
- operación: aportar evidencia para desviaciones de rendimiento o comportamiento técnico que `HYPERCARE-OPS-004` relacione con la operación;
- conciliación: ejecutar o coordinar únicamente las acciones técnicas que `HYPERCARE-OPS-005/006` y sus fuentes permitan;
- corrección: conservar la referencia exacta de implementación y prueba para toda corrección real que `HYPERCARE-OPS-006` gobierne;
- deuda: entregar deuda técnica a `HYPERCARE-OPS-007` con propietario y destino;
- transferencia: entregar runbooks, conocimiento y pendientes técnicos según `HYPERCARE-OPS-008`;
- contingencias: demostrar el estado técnico requerido por `HYPERCARE-OPS-009`;
- cierre: aportar evidencia técnica a `HYPERCARE-OPS-010`, sin certificar unilateralmente el cierre.

---

#### 11. Decisiones conjuntas y segregación

Cuando una fuente vigente exija participación funcional y técnica, una decisión solo es válida cuando ambas autoridades aplicables hayan cumplido su parte.

Reglas:

1. una aprobación funcional no demuestra seguridad técnica;
2. una aprobación técnica no acepta impacto empresarial;
3. un ejecutor no adquiere autoridad de decisión por ejecutar una acción;
4. un proveedor o tercero no hereda autoridad empresarial por prestar soporte técnico;
5. una persona que ocupe materialmente dos funciones deberá dejar evidencia separada de cada autoridad cuando la segregación lo permita;
6. si la fuente exige segregación entre decisión y ejecución, 002 la conserva sin excepciones locales;
7. un conflicto entre autoridades bloquea la decisión afectada y usa la ruta de escalamiento vigente; no se resuelve por mayoría ni por jerarquía inferida.

---

#### 12. Cobertura temporal obligatoria

`hypercare_coverage_manifest::<package_id>` debe permitir demostrar cobertura suficiente para el periodo `ACTIVA`, `SUSPENDIDA` o `EXTENDIDA` de `HYPERCARE-OPS-001`.

La cobertura deberá distinguir:

- responsable funcional primario;
- responsable técnico primario por repositorio/unidad aplicable;
- suplente autorizado cuando sea obligatorio;
- ventanas o condiciones de disponibilidad;
- mecanismo de handoff entre responsables;
- ruta de escalamiento;
- autoridad de recovery/rollback cuando aplique;
- cobertura de soporte y observabilidad exigida por las fuentes propietarias.

La cobertura nominal de un contacto no equivale a cobertura ejecutable. Antes de que una instancia pueda operar bajo `SHELL-CI-023::<package_id>`, `READY-GATE-010` y el handoff de `HYPERCARE-OPS-001` deberán permitir demostrar quién cubre realmente las responsabilidades exigibles.

---

#### 13. Suplencia

Una suplencia solo es válida cuando:

1. el suplente está autorizado para la responsabilidad concreta;
2. la fuente propietaria permite la sustitución;
3. el alcance temporal y material de la suplencia es trazable;
4. el handoff conserva paquete, candidato, ambiente, alcance, incidentes, decisiones, conciliaciones, recovery y pendientes aplicables;
5. la suplencia no rompe segregación ni amplía permisos;
6. existe mecanismo de escalamiento si el suplente tampoco está disponible.

No se considera suplencia válida “cualquier persona del equipo”, “alguien de guardia” o una identidad sin autoridad verificable.

---

#### 14. Escalamiento

El escalamiento reutiliza exclusivamente rutas vigentes de `READY-GATE-010`, `DELIV-PKG-017`, `DELIV-PKG-020`, continuidad y fuentes funcionales propietarias.

002 define que todo bloqueo de responsabilidad deberá identificar:

- responsabilidad ausente o en conflicto;
- paquete y alcance afectados;
- fuente propietaria;
- autoridad que debe resolverlo;
- ruta de escalamiento aplicable;
- condición objetiva de salida;
- efecto sobre la capacidad de continuar hypercare.

002 no define tiempos de respuesta, severidades ni niveles nuevos; esas materias permanecen en sus fuentes vigentes y en `HYPERCARE-OPS-003/006` según corresponda.

---

#### 15. Relación con `SHELL-CI-023::<package_id>`

Durante ejecución, `SHELL-CI-023::<package_id>` deberá poder registrar para cada acción o decisión relevante:

```text
QUIÉN OBSERVÓ
+
QUIÉN TENÍA RESPONSABILIDAD FUNCIONAL
+
QUIÉN TENÍA RESPONSABILIDAD TÉCNICA
+
QUIÉN EJECUTÓ
+
QUIÉN DECIDIÓ
+
QUÉ AUTORIDAD Y FUENTE RESPALDABAN CADA PAPEL
```

Las identidades reales y su disponibilidad son evidencia de ejecución de `SHELL-CI-023`, no evidencia inventada por E5.

---

#### 16. Tratamiento por modalidad heredada

002 no cambia la distribución heredada de `DELIV-PKG-022` y `HYPERCARE-OPS-001`:

| Modalidad heredada            | Cantidad | Tratamiento de responsabilidad                                                                                                                                               |
| ----------------------------- | -------: | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `PILOT-DIRECT-001`            |  **160** | conserva `OWN-*` funcional y responsable técnico del repositorio/unidad de la instancia directa                                                                              |
| `PILOT-SHARED-001`            |    **3** | responsabilidad funcional/técnica se ejerce mediante el contrato compartido y los consumidores directos aplicables; no se crea un equipo de hypercare ficticio independiente |
| `PILOT-CONTROL-001`           |   **26** | conserva ownership del control y, cuando exista superficie técnica ejecutable, su responsable técnico; la observación de raíces gobernadas no transfiere su ownership        |
| AURA bloqueada                |   **14** | conserva fuentes de responsabilidad, pero no fabrica cobertura de hypercare activo mientras persista el gate                                                                 |
| dependencia externa bloqueada |    **2** | conserva ownership interno y contraparte contractual existente sin otorgar autoridad empresarial al proveedor                                                                |
| TALENTO fuera de línea actual |    **2** | conserva referencias de ownership sin simular una ejecución de hypercare en la línea actual                                                                                  |

Reconciliación:

```text
160 + 3 + 26 + 14 + 2 + 2 = 207
```

---

#### 17. Matriz materializada de responsabilidad para las 207 raíces

Cada `package_id` aparece exactamente una vez. La matriz fija la fuente determinista de responsabilidad y prohíbe crear una autoridad paralela. El valor `ESPECIFICADO` significa que el binding documental queda definido; no significa que una persona esté actualmente de turno ni que el paquete haya entrado a hypercare.

| `package_id`  | `functional_owner_ref`                                               | `technical_owner_ref`                                                                                | cobertura/suplencia | decisión 002                  | estado documental |
| ------------- | -------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- | ------------------- | ----------------------------- | ----------------- |
| `GAP-PKG-001` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-002` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-003` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-004` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-005` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-006` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-007` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-008` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-009` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-010` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-011` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-012` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-013` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-014` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-015` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-016` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-017` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-018` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-019` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-020` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-021` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-022` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-023` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-024` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-025` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-026` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-027` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-028` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-029` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-030` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-031` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-032` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-033` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-034` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-035` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-036` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-037` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-038` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-039` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-040` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-041` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-042` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-043` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-044` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-045` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-046` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-047` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-048` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-049` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-050` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-051` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-052` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-053` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-054` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-055` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-056` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-057` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-058` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-059` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-060` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-061` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-062` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-063` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-064` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-065` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-066` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-067` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-068` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-069` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-070` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-071` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-072` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-073` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-074` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-075` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-076` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-077` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-078` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-079` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-080` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-081` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-082` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-083` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-084` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-085` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-086` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-087` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-088` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-089` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-090` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-091` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-092` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-093` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-094` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-095` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-096` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-097` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-098` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-099` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-100` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-101` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-102` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-103` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-104` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-105` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-106` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-107` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-108` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-109` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-110` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-111` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-112` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-113` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-114` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-115` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-116` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-117` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-118` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-119` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-120` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-121` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-122` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-123` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-124` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-125` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-126` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-127` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-128` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-129` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-130` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-131` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-132` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-133` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-134` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-135` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-136` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-137` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-138` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-139` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-140` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-141` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-142` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-143` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-144` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-145` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-146` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-147` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-148` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-149` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-150` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-151` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-152` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-153` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-154` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-155` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-156` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-157` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-158` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-159` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-160` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-161` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-162` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-163` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-164` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-165` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-166` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-167` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-168` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-169` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-170` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-171` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-172` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-173` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-174` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-175` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-176` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-177` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-178` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-179` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-180` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-181` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-182` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-183` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-184` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-185` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-186` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-187` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-188` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-189` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-190` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-191` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-192` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-193` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-194` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-195` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-196` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-197` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-198` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-199` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-200` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-201` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-202` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-203` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-204` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-205` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-206` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    |
| `GAP-PKG-207` | fila homónima de `DELIV-PKG-017` → `Responsable de decisión` `OWN-*` | fila homónima de `DELIV-PKG-020` → `technical_authority_ref`, resuelta desde `DELIV-PKG-014/015/019` | `READY-GATE-010`    | `HEREDAR_SIN_CREAR_AUTORIDAD` | `ESPECIFICADO`    | La matriz conserva **207/207** identidades, sin omisiones ni duplicaciones. La modalidad, gate y ejecutabilidad de cada fila continúan siendo los de su fila homónima en `DELIV-PKG-022` y `HYPERCARE-OPS-001`; 002 no los reclasifica. |

---

#### 18. Estados documentales de resolución

| Estado              | Semántica                                                                                                                                                    |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `ESPECIFICADO`      | las fuentes de responsabilidad funcional, técnica, cobertura y escalamiento están determinadas documentalmente                                               |
| `BLOQUEADO`         | una instancia que pretende ejecutar hypercare no puede demostrar identidad, autoridad, cobertura, suplencia o escalamiento obligatorio                       |
| `INVALIDADO`        | una resolución anterior dejó de corresponder al candidato, ambiente, alcance, repositorio, unidad o authority source vigentes                                |
| `NO_APLICA_DIRECTA` | la modalidad no posee una ejecución de hypercare independiente y la responsabilidad se ejerce mediante las raíces consumidoras o gobernadas que correspondan |

`ESPECIFICADO` no equivale a `VALIDADO` ni a disponibilidad real.

---

#### 19. Bloqueos obligatorios

Una instancia queda `BLOQUEADO` respecto de responsabilidad cuando:

1. no puede resolverse el `functional_owner_ref` vigente;
2. no puede resolverse el `technical_owner_ref` de una unidad técnica aplicable;
3. existen dos fuentes vigentes que atribuyen autoridad incompatible y la precedencia no está resuelta;
4. falta cobertura obligatoria de responsable funcional o técnico;
5. falta suplencia cuando la fuente la exige;
6. la ruta de escalamiento obligatoria no puede demostrarse;
7. un proveedor o tercero es la única identidad disponible para una decisión empresarial que exige autoridad interna;
8. la misma persona solo podría cubrir funciones rompiendo segregación;
9. el candidato, ambiente, alcance, repositorio o unidad ya no coinciden con la resolución;
10. continuar exigiría inventar persona, cargo, autoridad, permiso o excepción.

Todo bloqueo conserva fuente propietaria y condición objetiva de salida. La falta de responsable no se transforma en permiso para operar sin ownership.

---

#### 20. Invalidación y revalidación

La resolución queda `INVALIDADO` cuando cambia materialmente:

- candidato o revisión;
- ambiente;
- alcance autorizado;
- `OWN-*` funcional;
- repositorio o unidad de implementación;
- responsable técnico propietario;
- estrategia de rollout o recovery que cambie autoridad;
- cobertura, suplencia o escalamiento exigidos;
- modalidad de ejecución;
- contrato compartido o dependencia que determine ownership.

La revalidación parte de las fuentes vigentes. No se reescribe una asignación histórica para aparentar que siempre correspondió a la nueva revisión.

---

#### 21. Frontera con `HYPERCARE-OPS-003..010`

| Tarea               | Responsabilidad reservada                                                     |
| ------------------- | ----------------------------------------------------------------------------- |
| `HYPERCARE-OPS-003` | señales, errores, colas, integraciones y rendimiento que deberán monitorearse |
| `HYPERCARE-OPS-004` | adopción, tiempos y desviaciones operativas                                   |
| `HYPERCARE-OPS-005` | conciliaciones de datos y efectos entre dominios                              |
| `HYPERCARE-OPS-006` | clasificación, prioridad y procedimiento de corrección de incidentes          |
| `HYPERCARE-OPS-007` | registro, ownership y aprobación de deuda y tareas posteriores                |
| `HYPERCARE-OPS-008` | criterio de transferencia a soporte ordinario y documentación definitiva      |
| `HYPERCARE-OPS-009` | criterio y evidencia para retirar contingencias temporales                    |
| `HYPERCARE-OPS-010` | autoridad y evidencia para aprobar cierre funcional, técnico y operativo      |

002 entrega responsables a esas tareas, pero no define por anticipado sus señales, umbrales, incidentes, conciliaciones, deuda, transferencia, retiro de contingencias ni cierre.

---

#### 22. Handoff a `HYPERCARE-OPS-003`

002 entrega a 003:

```text
PAQUETE / CANDIDATO / AMBIENTE / ALCANCE
+
RESPONSABLE FUNCIONAL CANÓNICO
+
RESPONSABLE TÉCNICO CANÓNICO
+
REPOSITORIOS / UNIDADES TÉCNICAS
+
COBERTURA, SUPLENCIA Y ESCALAMIENTO
+
OWNERSHIP DE OBSERVABILIDAD YA EXISTENTE
=
DESTINATARIOS Y AUTORIDADES PARA EL MONITOREO DE HYPERCARE
```

003 podrá definir qué señales deben vigilarse y cómo se enrutan conforme a los contratos existentes, pero no podrá reasignar ownership por inferencia.

---

#### 23. Separación entre planificación y ejecución

`HYPERCARE-OPS-002` es exclusivamente documental.

No ejecuta:

- turnos o guardias reales;
- monitoreo;
- diagnóstico;
- alertas;
- correcciones;
- cambios de código;
- despliegues;
- rollback o recovery;
- conciliaciones;
- cambios de feature flags;
- migraciones;
- DDL/DML;
- backfills;
- modificaciones de datos;
- cambios de permisos;
- operaciones sobre Supabase.

La ejecución real de hypercare pertenece a `SHELL-CI-023::<package_id>`.

---

#### 24. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** `HYPERCARE-OPS-002` no crea autoridad, rol, permiso, workflow, severidad, transición empresarial, umbral, algoritmo de asignación ni comportamiento runtime nuevo. Materializa por `package_id` el binding de autoridades y responsables ya aprobados en `DELIV-PKG-014/015/017/019/020`, readiness y continuidad. La obligación de contar con responsables, autoridad explícita, sustitutos, escalamiento y bitácora ya está protegida por `TREQ-CONT-002`. Si una ejecución no puede demostrar esas identidades o cobertura, queda bloqueada en vez de introducir una regla nueva.

**Requisitos creados:** 0
**Requisitos modificados:** 0
**Fragmentos 04A afectados:** 0

---

#### 25. Criterios de aceptación documental

`HYPERCARE-OPS-002` queda documentalmente completo cuando:

1. conserva `HYPERCARE-OPS-001 → HYPERCARE-OPS-002 → HYPERCARE-OPS-003`;
2. define `hypercare_responsibility_resolution`, `hypercare_functional_technical_map`, `hypercare_coverage_manifest` y `hypercare_responsibility_handoff`;
3. la unidad de resolución conserva paquete, candidato, ambiente, alcance y manifiesto de lifecycle;
4. el responsable funcional se deriva del `OWN-*` exacto de la fila homónima de `DELIV-PKG-017`;
5. el responsable técnico se deriva de `technical_authority_ref` y de los repositorios/unidades vigentes de `DELIV-PKG-014/015/019/020`;
6. no se inventan nombres de personas, cargos, comités, repositorios ni autoridades;
7. responsabilidad funcional y técnica permanecen conceptualmente separadas;
8. ejecutar una acción no concede autoridad de decisión;
9. un proveedor no hereda autoridad empresarial;
10. una misma persona solo cubre varias funciones cuando las fuentes y segregación lo permiten;
11. la cobertura conserva responsable primario, suplencia exigible, handoff y escalamiento;
12. una identidad nominal sin autoridad no satisface cobertura;
13. una instancia que no puede demostrar cobertura obligatoria queda bloqueada para operar bajo hypercare;
14. cambios materiales invalidan la resolución y exigen revalidación;
15. 003 recibe destinatarios y ownership suficientes sin que 002 defina señales o umbrales;
16. 004 conserva propiedad de adopción, tiempos y desviaciones operativas;
17. 005 conserva propiedad de conciliaciones;
18. 006 conserva clasificación, prioridad y procedimiento de incidentes;
19. 007 conserva deuda y tareas posteriores;
20. 008 conserva transferencia a soporte ordinario;
21. 009 conserva retiro de contingencias temporales;
22. 010 conserva autoridad y evidencia de cierre;
23. las 207 raíces aparecen exactamente una vez en la matriz de 002;
24. la matriz no cambia la distribución heredada `160 + 3 + 26 + 14 + 2 + 2 = 207`;
25. todas las filas fijan fuente funcional, fuente técnica, cobertura y una decisión explícita sin crear autoridad paralela;
26. `ESPECIFICADO` no se presenta como evidencia de disponibilidad real ni ejecución;
27. la ejecución física permanece en `SHELL-CI-023::<package_id>`;
28. no se ejecutan código, despliegues, configuración remota, migraciones, DDL/DML, backfills, modificaciones de datos ni operaciones de Supabase;
29. se crean cero requisitos `TREQ-*`, se modifican cero requisitos `TREQ-*` y se afectan cero fragmentos 04A.

---

#### 26. Continuidad

##### ÚLTIMA TAREA APROBADA
HYPERCARE-OPS-001 — Definir inicio, duración y salida del acompañamiento intensivo

##### TAREA ACTUAL APROBADA
HYPERCARE-OPS-002 — Definir responsables funcionales y técnicos

##### SIGUIENTE TAREA RESERVADA
HYPERCARE-OPS-003 — Definir monitoreo de errores, colas, integraciones y rendimiento


### ✅ HYPERCARE-OPS-003 — Definir monitoreo de errores, colas, integraciones y rendimiento

Estado: APROBADA
Tarea anterior: `HYPERCARE-OPS-002 — Definir responsables funcionales y técnicos`
Tarea siguiente: `HYPERCARE-OPS-004 — Definir monitoreo de adopción, tiempos y desviaciones operativas`
Tipo de tarea: documental — definición normativa y materialización por `package_id` del contrato técnico de monitoreo durante hypercare para errores, colas, integraciones y rendimiento, consumiendo la topología, observabilidad, requisitos no funcionales, ownership y evidencia ya aprobados; sin ejecutar monitoreo, instrumentación, consultas operativas, clasificación o corrección de incidentes, conciliaciones, despliegues, cambios de configuración, migraciones, DDL/DML, backfills, modificaciones de datos ni operaciones sobre Supabase
Repositorio propietario: `vento-shell`
Archivo propietario: `docs/plan-canonico/modular/bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/05_HYPERCARE_Y_ESTABILIZACION.md`
Ejecución posterior: `SHELL-CI-023::<package_id>`
Cambios físicos autorizados: ninguno
Requisitos de prueba creados o modificados: 0

---

#### 1. Propósito

`HYPERCARE-OPS-003` define cómo deberá observarse técnicamente una instancia durante `SHELL-CI-023::<package_id>` para detectar degradaciones, fallos y pérdida de estabilidad sin confundir ausencia de señales con salud ni crear métricas, umbrales o fuentes de verdad paralelas.

La tarea cubre exclusivamente cuatro familias técnicas:

1. errores y resultados técnicos fallidos o desconocidos;
2. colas, outbox, inbox y jobs cuando sean aplicables;
3. integraciones internas, externas y dependencias técnicas cuando sean aplicables;
4. rendimiento técnico, capacidad y comportamiento temporal medible del sistema.

El monitoreo aquí definido es un contrato para la ejecución futura. Esta tarea no afirma que una señal exista físicamente, que un dashboard esté activo, que una alerta haya disparado ni que una instancia esté sana.

---

#### 2. Resultado sustantivo

Para cada una de las **207 raíces `GAP-PKG-001..207`**, 003 materializa una decisión documental individual que fija:

- la identidad temporal exacta proveniente de `HYPERCARE-OPS-001`;
- la responsabilidad funcional y técnica proveniente de `HYPERCARE-OPS-002`;
- la topología y las dependencias que determinan aplicabilidad desde `DELIV-PKG-015`;
- el perfil de observabilidad y responsable de decisión desde `DELIV-PKG-017`;
- los requisitos no funcionales, SLI, presupuestos y referencias aplicables desde `DELIV-PKG-013` y `NFR-REQ-009`;
- las obligaciones de prueba y evidencia desde `DELIV-PKG-016` y el registro `04A`;
- qué debe observarse en errores, colas, integraciones y rendimiento;
- qué ausencia de señal bloquea interpretar la instancia como estable;
- qué hallazgos se transfieren a las tareas propietarias posteriores sin clasificarlos o resolverlos en 003.

El resultado documental de cada fila es `ESPECIFICADO`. Ese estado significa únicamente que el contrato de monitoreo está resuelto por referencia canónica; no equivale a `IMPLEMENTADO`, `VALIDADO` ni a evidencia de una ejecución real de hypercare.

---

#### 3. Entradas canónicas obligatorias

003 consume sin redefinir:

- `HYPERCARE-OPS-001`: identidad de la instancia, entrada a hypercare, permanencia, suspensión, extensión e invalidación;
- `HYPERCARE-OPS-002`: responsable funcional, responsable técnico, cobertura, suplencia, escalamiento y segregación;
- `DELIV-PKG-013`: requisitos no funcionales, objetivos, presupuestos y referencias aplicables por paquete;
- `DELIV-PKG-015`: topología real planificada, dependencias, fronteras técnicas y superficies que determinan si existen colas o integraciones aplicables;
- `DELIV-PKG-016`: requisitos `TREQ-*`, nivel de prueba, ambiente, evidencia esperada y gate por paquete;
- `DELIV-PKG-017`: señales, métricas, alertas, runtime, repositorio, propietario de decisión y contrato de conservación por paquete;
- `DELIV-PKG-018`: estados seguros, suspensión, desactivación y kill switch aplicables;
- `DELIV-PKG-019`: release, rollout, cohortes, pausas y promoción que deben poder correlacionarse con una degradación;
- `DELIV-PKG-020`: rollback, recovery, compensación y tratamiento de resultados desconocidos o efectos irreversibles;
- `READY-GATE-011`: observabilidad y enrutamiento vigentes exigibles antes de ejecución;
- `NFR-REQ-009`: contrato transversal de observabilidad, soporte y alertas;
- `TREQ-PROC-461..500`: requisitos ya existentes derivados de `NFR-REQ-009`;
- `TREQ-INTEGRATION-003` y `TREQ-INTEGRATION-004`: idempotencia, reintentos, observabilidad y reconstrucción de cadenas asíncronas;
- `TREQ-CONT-002`: trazabilidad y autoridad de incidentes cuando una observación llegue a esa categoría;
- `SHELL-CI-023::<package_id>`: ejecutor futuro del monitoreo y estabilización;
- `SHELL-CI-024::<package_id>`: certificador futuro de salida y evidencia final.

Si una fuente aplicable falta, pertenece a otra revisión, contradice otra fuente vigente o no resuelve un dato obligatorio, 003 no la sustituye mediante estimación.

---

#### 4. Fronteras de responsabilidad

003 no define ni ejecuta:

- adopción, tiempos de operación humana o desviaciones del proceso, reservados a `HYPERCARE-OPS-004`;
- conciliación de datos, documentos, saldos o efectos entre dominios, reservada a `HYPERCARE-OPS-005`;
- severidad del incidente, prioridad, procedimiento de corrección, mitigación o cierre, reservados a `HYPERCARE-OPS-006`;
- aceptación de deuda o creación de trabajo posterior, reservados a `HYPERCARE-OPS-007`;
- transferencia a soporte ordinario, reservada a `HYPERCARE-OPS-008`;
- retiro de contingencias temporales, reservado a `HYPERCARE-OPS-009`;
- autoridad de cierre funcional, técnico u operativo, reservada a `HYPERCARE-OPS-010`;
- certificación material de salida, reservada a `SHELL-CI-024::<package_id>`.

Un hallazgo técnico puede alimentar esas tareas, pero 003 no altera su propiedad.

---

#### 5. Unidad de observación

Toda evidencia futura deberá pertenecer a la misma instancia definida por 001:

```text
package_id
+
candidate_ref
+
environment
+
authorized_scope_ref
+
shell_ci_023_execution_ref
```

No se pueden mezclar señales de:

- candidatos distintos;
- ambientes distintos;
- alcances incompatibles;
- releases no pertenecientes a la instancia;
- ejecuciones separadas de hypercare;
- raíces independientes solo porque compartan repositorio o aplicación.

La correlación con un cambio reciente no demuestra causalidad por sí sola.

---

#### 6. Regla de precedencia del monitoreo

Para cada `package_id`, la resolución se realiza en este orden:

1. `DELIV-PKG-015` determina qué componentes, dependencias, colas, integraciones y superficies existen en el alcance;
2. `DELIV-PKG-017` determina qué señales, métricas, alertas, runtime y ownership corresponden a esa topología;
3. `DELIV-PKG-013` y `NFR-REQ-009` aportan SLI, presupuestos y reglas no funcionales ya aprobadas;
4. `DELIV-PKG-016` determina cómo se prueba y qué evidencia se exige;
5. `HYPERCARE-OPS-002` determina quién interpreta, recibe y escala la observación;
6. `HYPERCARE-OPS-001` determina qué instancia y qué intervalo de hypercare pueden consumir la evidencia.

003 **no crea porcentajes, ventanas, tiempos máximos, tasas tolerables ni umbrales numéricos nuevos**. Cuando exista una referencia aprobada se hereda exactamente. Cuando un objetivo obligatorio todavía no esté resuelto, se puede observar la señal, pero no declarar cumplimiento contra un objetivo inexistente.

---

#### 7. Monitoreo de errores

Toda superficie aplicable deberá conservar observación suficiente para distinguir como mínimo:

- demanda o cantidad de operaciones observadas;
- operaciones exitosas y fallidas;
- error rápido y operación lenta que termina en error;
- clase y código estable del error;
- error controlado, no controlado y resultado técnico desconocido;
- reintento, fallback o recuperación automática cuando exista;
- componente, dependencia, runtime, release y ambiente;
- proporción o tasa solo cuando la fuente aprobada defina población y unidad;
- correlación con comando, solicitud, job, cola o integración cuando aplique;
- afectación a una ruta crítica sin convertirla todavía en severidad de incidente.

Los logs relevantes deberán ser estructurados y no depender exclusivamente de texto libre o stack trace. El nivel `ERROR` o `FATAL` de un log no determina por sí mismo la prioridad de un incidente.

La ausencia de errores observados solo puede interpretarse cuando el canal de monitoreo que debía producir esa evidencia está comprobablemente disponible. Un pipeline sin señales no equivale a una instancia saludable.

---

#### 8. Monitoreo de colas, outbox, inbox y jobs

Esta familia aplica únicamente cuando `DELIV-PKG-015` y `DELIV-PKG-017` declaren una cola, outbox, inbox, trabajo diferido, sincronización o job dentro de la topología aplicable.

Cuando aplique, la observación deberá permitir determinar:

- trabajo recibido;
- pendiente;
- activo o en procesamiento;
- completado;
- fallido;
- reintentado y próximo intento cuando exista;
- deduplicado;
- descartado;
- enviado a dead-letter, cuarentena o tratamiento equivalente cuando exista;
- edad del elemento más antiguo;
- tiempo de procesamiento;
- capacidad y backpressure;
- partición o dependencia relevante;
- última ejecución exitosa y ausencia de ejecución esperada para jobs programados;
- resultado empresarial todavía pendiente o desconocido, sin resolver su conciliación en 003.

Una cola vacía no se declara saludable si la fuente productora dejó de generar trabajo que debía existir. Un backlog pequeño tampoco se declara saludable si su elemento más antiguo incumple un presupuesto aprobado.

`NO_APLICA` solo puede utilizarse cuando la topología aprobada demuestre que la familia no existe para esa instancia; no se infiere por falta de telemetría.

---

#### 9. Monitoreo de integraciones y dependencias

Para toda integración interna o externa aplicable deberá poder observarse:

- solicitudes, comandos o mensajes emitidos y recibidos;
- éxito, rechazo, timeout y resultado desconocido;
- duración medida en el punto definido por el contrato;
- reintentos, deduplicación e idempotencia;
- backlog y dead-letter cuando exista asincronía;
- versión contractual y compatibilidad relevante;
- autenticación o autorización técnica fallida sin exponer secretos;
- estado de red y dependencia;
- disponibilidad del proveedor cuando corresponda;
- error de configuración, contrato o dato diferenciable del error del proveedor;
- acuse técnico separado del efecto empresarial;
- correlación con la instancia, release y cambio reciente aplicables.

Un HTTP exitoso, acuse de proveedor, mensaje aceptado o adaptador disponible no prueba por sí mismo el efecto empresarial final. La conciliación de ese efecto pertenece a 005.

---

#### 10. Monitoreo de rendimiento técnico

El rendimiento técnico deberá observarse conforme a los presupuestos y SLI ya aprobados. Cuando aplique, cubrirá:

- demanda, concurrencia y throughput en la unidad definida por la fuente;
- latencia de éxito y de error por separado;
- percentiles o agregaciones únicamente cuando estén definidos por el perfil aplicable;
- saturación de recursos y proximidad a límites;
- capacidad disponible y backpressure;
- tiempos de procesamiento de colas y jobs;
- latencia de dependencias e integraciones;
- rendimiento de base de datos, RPC, funciones o servicios utilizados;
- crecimiento de backlog y tiempo de drenaje;
- frescura y atraso de trabajos programados cuando formen parte de la topología;
- degradación correlacionada con release, configuración, migración, feature flag o cambio de infraestructura aplicable.

003 no convierte estas mediciones técnicas en tiempos de adopción, tiempos de ejecución humana o desviaciones operativas; esos indicadores pertenecen a 004.

La ausencia de un SLO final no impide medir una señal, pero sí impide declarar que el objetivo se cumple. Ninguna banda cualitativa o estimación documental se presenta como medición real.

---

#### 11. Correlación y contexto mínimo

La evidencia futura deberá conservar, cuando sea aplicable y permitido por privacidad:

- `package_id`;
- candidato, ambiente, alcance y release;
- repositorio, componente o unidad técnica;
- timestamp de ocurrencia y observación;
- código de error o resultado estable;
- identificadores técnicos de correlación aprobados;
- referencia a cola, job, integración o dependencia;
- punto de medición y unidad;
- referencia al SLI, presupuesto o umbral heredado cuando exista;
- referencia de ownership y enrutamiento de 002/017;
- cambio reciente aplicable sin afirmar causalidad automática.

No se usarán secretos, tokens, documentos, payloads completos ni identificadores personales de alta cardinalidad como dimensión ordinaria de monitoreo.

---

#### 12. Salud del propio monitoreo

Antes de interpretar una ausencia de síntomas como estabilidad, `SHELL-CI-023` deberá poder demostrar que las fuentes aplicables de observación están funcionando.

La comprobación deberá distinguir:

- productor de señal activo;
- recepción de señal;
- atraso o pérdida;
- capacidad de consulta;
- evaluación de reglas aplicables;
- entrega al responsable cuando exista alerta;
- sincronización temporal suficiente para correlacionar evidencia.

Una falla del pipeline de observabilidad se registra como pérdida de capacidad de observación; no como cero errores, cero backlog o cero degradación.

---

#### 13. Estados documentales y tratamiento de evidencia

Para 003 se conservan los estados ya admitidos por el protocolo:

| Estado                   | Uso en este contrato                                                                                                      |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------- |
| `ESPECIFICADO`           | la fila resuelve fuentes, aplicabilidad y ownership documental; no existe afirmación de ejecución                         |
| `PENDIENTE_DE_EVIDENCIA` | durante ejecución futura, la señal exigible todavía no tiene evidencia suficiente para sostener una conclusión            |
| `BLOQUEADO`              | falta una fuente, señal, ownership, aplicabilidad o referencia obligatoria y no existe control compensatorio aprobado     |
| `NO_APLICA`              | la topología y el perfil aprobados demuestran que una familia concreta no corresponde a la instancia                      |
| `VALIDADO`               | solo puede provenir de evidencia real producida y aceptada por la ejecución o certificación propietaria; 003 no lo asigna |

`NO_APLICA` no se usa como equivalente a “no instrumentado”. `PENDIENTE_DE_EVIDENCIA` no se interpreta como PASS.

---

#### 14. Condiciones que bloquean interpretar estabilidad técnica

La instancia no podrá presentar evidencia técnica suficiente de estabilidad cuando ocurra cualquiera de estas condiciones aplicables:

1. no se resuelve la fila homónima de `DELIV-PKG-017`;
2. la topología 015 exige una cola o integración y no existe señal o control compensatorio aprobado para observarla;
3. falta el responsable o enrutamiento exigible por 002/017;
4. una señal obligatoria pertenece a candidato, ambiente o alcance distinto;
5. una referencia de SLI o presupuesto exigible está ausente o contradictoria y se pretende declarar cumplimiento;
6. el pipeline de monitoreo está caído o su pérdida de señales no puede cuantificarse;
7. existe backlog, resultado desconocido, error o degradación que requiere evaluación y no tiene propietario;
8. una señal crítica se basa en texto libre o evidencia no reproducible cuando el contrato exige código o estructura estable;
9. la privacidad o autorización impiden obtener la evidencia de forma aprobada y no existe control compensatorio;
10. dos fuentes canónicas vigentes atribuyen semántica incompatible a la misma señal o criterio.

Estas condiciones no asignan severidad de incidente; determinan únicamente que 003 no permite inferir estabilidad técnica con evidencia insuficiente.

---

#### 15. Handoffs obligatorios

Los hallazgos de 003 se transfieren sin cambiar de propiedad:

| Hallazgo                                                                                           | Destino propietario                                               |
| -------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| error, degradación, timeout, backlog o integración anómala que requiere clasificación o corrección | `HYPERCARE-OPS-006`                                               |
| divergencia de datos, efecto empresarial pendiente o resultado que requiere conciliación           | `HYPERCARE-OPS-005`                                               |
| adopción, tiempo humano, abandono o desviación del proceso                                         | `HYPERCARE-OPS-004`                                               |
| trabajo aceptado como deuda posterior                                                              | `HYPERCARE-OPS-007`                                               |
| evidencia necesaria para transferencia a soporte ordinario                                         | `HYPERCARE-OPS-008`                                               |
| condición asociada a una contingencia temporal                                                     | `HYPERCARE-OPS-009`                                               |
| evidencia agregada para decidir cierre                                                             | `HYPERCARE-OPS-010` y posteriormente `SHELL-CI-024::<package_id>` |

003 puede detectar y describir el síntoma técnico. No clasifica prioridad, no aprueba mitigación y no cierra el expediente propietario.

---

#### 16. Tratamiento por modalidad heredada

003 conserva sin reasignar la distribución aprobada por 001 y 002:

| Modalidad heredada            | Cantidad | Tratamiento de monitoreo                                                                                                             |
| ----------------------------- | -------: | ------------------------------------------------------------------------------------------------------------------------------------ |
| `PILOT-DIRECT-001`            |  **160** | el contrato se ejecutará directamente durante la instancia de `SHELL-CI-023::<package_id>` cuando esta entre válidamente a hypercare |
| `PILOT-SHARED-001`            |    **3** | no crea monitoreo independiente ficticio; se observa mediante las instancias consumidoras que ejercen el contrato compartido         |
| `PILOT-CONTROL-001`           |   **26** | conserva observación del control y de las raíces gobernadas según su frontera real; no transfiere ownership                          |
| AURA bloqueada                |   **14** | el contrato queda especificado, pero no simula monitoreo de hypercare activo mientras persista el gate                               |
| dependencia externa bloqueada |    **2** | conserva observabilidad y ownership internos aplicables, sin atribuir al proveedor autoridad empresarial                             |
| TALENTO fuera de línea actual |    **2** | conserva el contrato documental sin simular ejecución en la línea vigente                                                            |

Reconciliación:

```text
160 + 3 + 26 + 14 + 2 + 2 = 207
```

---

#### 17. Matriz materializada de monitoreo para las 207 raíces

Cada `package_id` aparece exactamente una vez. Las referencias `::<package_id>` identifican la fila homónima de la fuente indicada y no crean un identificador canónico nuevo.

| `package_id`  | identidad temporal               | responsabilidad                  | topología                    | observabilidad               | errores                                            | colas/jobs                                                            | integraciones                                                         | rendimiento                                                         | estado documental |
| ------------- | -------------------------------- | -------------------------------- | ---------------------------- | ---------------------------- | -------------------------------------------------- | --------------------------------------------------------------------- | --------------------------------------------------------------------- | ------------------------------------------------------------------- | ----------------- |
| `GAP-PKG-001` | `HYPERCARE-OPS-001::GAP-PKG-001` | `HYPERCARE-OPS-002::GAP-PKG-001` | `DELIV-PKG-015::GAP-PKG-001` | `DELIV-PKG-017::GAP-PKG-001` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-002` | `HYPERCARE-OPS-001::GAP-PKG-002` | `HYPERCARE-OPS-002::GAP-PKG-002` | `DELIV-PKG-015::GAP-PKG-002` | `DELIV-PKG-017::GAP-PKG-002` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-003` | `HYPERCARE-OPS-001::GAP-PKG-003` | `HYPERCARE-OPS-002::GAP-PKG-003` | `DELIV-PKG-015::GAP-PKG-003` | `DELIV-PKG-017::GAP-PKG-003` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-004` | `HYPERCARE-OPS-001::GAP-PKG-004` | `HYPERCARE-OPS-002::GAP-PKG-004` | `DELIV-PKG-015::GAP-PKG-004` | `DELIV-PKG-017::GAP-PKG-004` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-005` | `HYPERCARE-OPS-001::GAP-PKG-005` | `HYPERCARE-OPS-002::GAP-PKG-005` | `DELIV-PKG-015::GAP-PKG-005` | `DELIV-PKG-017::GAP-PKG-005` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-006` | `HYPERCARE-OPS-001::GAP-PKG-006` | `HYPERCARE-OPS-002::GAP-PKG-006` | `DELIV-PKG-015::GAP-PKG-006` | `DELIV-PKG-017::GAP-PKG-006` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-007` | `HYPERCARE-OPS-001::GAP-PKG-007` | `HYPERCARE-OPS-002::GAP-PKG-007` | `DELIV-PKG-015::GAP-PKG-007` | `DELIV-PKG-017::GAP-PKG-007` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-008` | `HYPERCARE-OPS-001::GAP-PKG-008` | `HYPERCARE-OPS-002::GAP-PKG-008` | `DELIV-PKG-015::GAP-PKG-008` | `DELIV-PKG-017::GAP-PKG-008` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-009` | `HYPERCARE-OPS-001::GAP-PKG-009` | `HYPERCARE-OPS-002::GAP-PKG-009` | `DELIV-PKG-015::GAP-PKG-009` | `DELIV-PKG-017::GAP-PKG-009` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-010` | `HYPERCARE-OPS-001::GAP-PKG-010` | `HYPERCARE-OPS-002::GAP-PKG-010` | `DELIV-PKG-015::GAP-PKG-010` | `DELIV-PKG-017::GAP-PKG-010` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-011` | `HYPERCARE-OPS-001::GAP-PKG-011` | `HYPERCARE-OPS-002::GAP-PKG-011` | `DELIV-PKG-015::GAP-PKG-011` | `DELIV-PKG-017::GAP-PKG-011` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-012` | `HYPERCARE-OPS-001::GAP-PKG-012` | `HYPERCARE-OPS-002::GAP-PKG-012` | `DELIV-PKG-015::GAP-PKG-012` | `DELIV-PKG-017::GAP-PKG-012` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-013` | `HYPERCARE-OPS-001::GAP-PKG-013` | `HYPERCARE-OPS-002::GAP-PKG-013` | `DELIV-PKG-015::GAP-PKG-013` | `DELIV-PKG-017::GAP-PKG-013` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-014` | `HYPERCARE-OPS-001::GAP-PKG-014` | `HYPERCARE-OPS-002::GAP-PKG-014` | `DELIV-PKG-015::GAP-PKG-014` | `DELIV-PKG-017::GAP-PKG-014` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-015` | `HYPERCARE-OPS-001::GAP-PKG-015` | `HYPERCARE-OPS-002::GAP-PKG-015` | `DELIV-PKG-015::GAP-PKG-015` | `DELIV-PKG-017::GAP-PKG-015` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-016` | `HYPERCARE-OPS-001::GAP-PKG-016` | `HYPERCARE-OPS-002::GAP-PKG-016` | `DELIV-PKG-015::GAP-PKG-016` | `DELIV-PKG-017::GAP-PKG-016` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-017` | `HYPERCARE-OPS-001::GAP-PKG-017` | `HYPERCARE-OPS-002::GAP-PKG-017` | `DELIV-PKG-015::GAP-PKG-017` | `DELIV-PKG-017::GAP-PKG-017` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-018` | `HYPERCARE-OPS-001::GAP-PKG-018` | `HYPERCARE-OPS-002::GAP-PKG-018` | `DELIV-PKG-015::GAP-PKG-018` | `DELIV-PKG-017::GAP-PKG-018` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-019` | `HYPERCARE-OPS-001::GAP-PKG-019` | `HYPERCARE-OPS-002::GAP-PKG-019` | `DELIV-PKG-015::GAP-PKG-019` | `DELIV-PKG-017::GAP-PKG-019` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-020` | `HYPERCARE-OPS-001::GAP-PKG-020` | `HYPERCARE-OPS-002::GAP-PKG-020` | `DELIV-PKG-015::GAP-PKG-020` | `DELIV-PKG-017::GAP-PKG-020` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-021` | `HYPERCARE-OPS-001::GAP-PKG-021` | `HYPERCARE-OPS-002::GAP-PKG-021` | `DELIV-PKG-015::GAP-PKG-021` | `DELIV-PKG-017::GAP-PKG-021` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-022` | `HYPERCARE-OPS-001::GAP-PKG-022` | `HYPERCARE-OPS-002::GAP-PKG-022` | `DELIV-PKG-015::GAP-PKG-022` | `DELIV-PKG-017::GAP-PKG-022` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-023` | `HYPERCARE-OPS-001::GAP-PKG-023` | `HYPERCARE-OPS-002::GAP-PKG-023` | `DELIV-PKG-015::GAP-PKG-023` | `DELIV-PKG-017::GAP-PKG-023` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-024` | `HYPERCARE-OPS-001::GAP-PKG-024` | `HYPERCARE-OPS-002::GAP-PKG-024` | `DELIV-PKG-015::GAP-PKG-024` | `DELIV-PKG-017::GAP-PKG-024` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-025` | `HYPERCARE-OPS-001::GAP-PKG-025` | `HYPERCARE-OPS-002::GAP-PKG-025` | `DELIV-PKG-015::GAP-PKG-025` | `DELIV-PKG-017::GAP-PKG-025` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-026` | `HYPERCARE-OPS-001::GAP-PKG-026` | `HYPERCARE-OPS-002::GAP-PKG-026` | `DELIV-PKG-015::GAP-PKG-026` | `DELIV-PKG-017::GAP-PKG-026` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-027` | `HYPERCARE-OPS-001::GAP-PKG-027` | `HYPERCARE-OPS-002::GAP-PKG-027` | `DELIV-PKG-015::GAP-PKG-027` | `DELIV-PKG-017::GAP-PKG-027` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-028` | `HYPERCARE-OPS-001::GAP-PKG-028` | `HYPERCARE-OPS-002::GAP-PKG-028` | `DELIV-PKG-015::GAP-PKG-028` | `DELIV-PKG-017::GAP-PKG-028` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-029` | `HYPERCARE-OPS-001::GAP-PKG-029` | `HYPERCARE-OPS-002::GAP-PKG-029` | `DELIV-PKG-015::GAP-PKG-029` | `DELIV-PKG-017::GAP-PKG-029` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-030` | `HYPERCARE-OPS-001::GAP-PKG-030` | `HYPERCARE-OPS-002::GAP-PKG-030` | `DELIV-PKG-015::GAP-PKG-030` | `DELIV-PKG-017::GAP-PKG-030` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-031` | `HYPERCARE-OPS-001::GAP-PKG-031` | `HYPERCARE-OPS-002::GAP-PKG-031` | `DELIV-PKG-015::GAP-PKG-031` | `DELIV-PKG-017::GAP-PKG-031` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-032` | `HYPERCARE-OPS-001::GAP-PKG-032` | `HYPERCARE-OPS-002::GAP-PKG-032` | `DELIV-PKG-015::GAP-PKG-032` | `DELIV-PKG-017::GAP-PKG-032` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-033` | `HYPERCARE-OPS-001::GAP-PKG-033` | `HYPERCARE-OPS-002::GAP-PKG-033` | `DELIV-PKG-015::GAP-PKG-033` | `DELIV-PKG-017::GAP-PKG-033` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-034` | `HYPERCARE-OPS-001::GAP-PKG-034` | `HYPERCARE-OPS-002::GAP-PKG-034` | `DELIV-PKG-015::GAP-PKG-034` | `DELIV-PKG-017::GAP-PKG-034` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-035` | `HYPERCARE-OPS-001::GAP-PKG-035` | `HYPERCARE-OPS-002::GAP-PKG-035` | `DELIV-PKG-015::GAP-PKG-035` | `DELIV-PKG-017::GAP-PKG-035` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-036` | `HYPERCARE-OPS-001::GAP-PKG-036` | `HYPERCARE-OPS-002::GAP-PKG-036` | `DELIV-PKG-015::GAP-PKG-036` | `DELIV-PKG-017::GAP-PKG-036` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-037` | `HYPERCARE-OPS-001::GAP-PKG-037` | `HYPERCARE-OPS-002::GAP-PKG-037` | `DELIV-PKG-015::GAP-PKG-037` | `DELIV-PKG-017::GAP-PKG-037` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-038` | `HYPERCARE-OPS-001::GAP-PKG-038` | `HYPERCARE-OPS-002::GAP-PKG-038` | `DELIV-PKG-015::GAP-PKG-038` | `DELIV-PKG-017::GAP-PKG-038` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-039` | `HYPERCARE-OPS-001::GAP-PKG-039` | `HYPERCARE-OPS-002::GAP-PKG-039` | `DELIV-PKG-015::GAP-PKG-039` | `DELIV-PKG-017::GAP-PKG-039` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-040` | `HYPERCARE-OPS-001::GAP-PKG-040` | `HYPERCARE-OPS-002::GAP-PKG-040` | `DELIV-PKG-015::GAP-PKG-040` | `DELIV-PKG-017::GAP-PKG-040` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-041` | `HYPERCARE-OPS-001::GAP-PKG-041` | `HYPERCARE-OPS-002::GAP-PKG-041` | `DELIV-PKG-015::GAP-PKG-041` | `DELIV-PKG-017::GAP-PKG-041` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-042` | `HYPERCARE-OPS-001::GAP-PKG-042` | `HYPERCARE-OPS-002::GAP-PKG-042` | `DELIV-PKG-015::GAP-PKG-042` | `DELIV-PKG-017::GAP-PKG-042` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-043` | `HYPERCARE-OPS-001::GAP-PKG-043` | `HYPERCARE-OPS-002::GAP-PKG-043` | `DELIV-PKG-015::GAP-PKG-043` | `DELIV-PKG-017::GAP-PKG-043` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-044` | `HYPERCARE-OPS-001::GAP-PKG-044` | `HYPERCARE-OPS-002::GAP-PKG-044` | `DELIV-PKG-015::GAP-PKG-044` | `DELIV-PKG-017::GAP-PKG-044` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-045` | `HYPERCARE-OPS-001::GAP-PKG-045` | `HYPERCARE-OPS-002::GAP-PKG-045` | `DELIV-PKG-015::GAP-PKG-045` | `DELIV-PKG-017::GAP-PKG-045` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-046` | `HYPERCARE-OPS-001::GAP-PKG-046` | `HYPERCARE-OPS-002::GAP-PKG-046` | `DELIV-PKG-015::GAP-PKG-046` | `DELIV-PKG-017::GAP-PKG-046` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-047` | `HYPERCARE-OPS-001::GAP-PKG-047` | `HYPERCARE-OPS-002::GAP-PKG-047` | `DELIV-PKG-015::GAP-PKG-047` | `DELIV-PKG-017::GAP-PKG-047` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-048` | `HYPERCARE-OPS-001::GAP-PKG-048` | `HYPERCARE-OPS-002::GAP-PKG-048` | `DELIV-PKG-015::GAP-PKG-048` | `DELIV-PKG-017::GAP-PKG-048` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-049` | `HYPERCARE-OPS-001::GAP-PKG-049` | `HYPERCARE-OPS-002::GAP-PKG-049` | `DELIV-PKG-015::GAP-PKG-049` | `DELIV-PKG-017::GAP-PKG-049` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-050` | `HYPERCARE-OPS-001::GAP-PKG-050` | `HYPERCARE-OPS-002::GAP-PKG-050` | `DELIV-PKG-015::GAP-PKG-050` | `DELIV-PKG-017::GAP-PKG-050` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-051` | `HYPERCARE-OPS-001::GAP-PKG-051` | `HYPERCARE-OPS-002::GAP-PKG-051` | `DELIV-PKG-015::GAP-PKG-051` | `DELIV-PKG-017::GAP-PKG-051` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-052` | `HYPERCARE-OPS-001::GAP-PKG-052` | `HYPERCARE-OPS-002::GAP-PKG-052` | `DELIV-PKG-015::GAP-PKG-052` | `DELIV-PKG-017::GAP-PKG-052` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-053` | `HYPERCARE-OPS-001::GAP-PKG-053` | `HYPERCARE-OPS-002::GAP-PKG-053` | `DELIV-PKG-015::GAP-PKG-053` | `DELIV-PKG-017::GAP-PKG-053` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-054` | `HYPERCARE-OPS-001::GAP-PKG-054` | `HYPERCARE-OPS-002::GAP-PKG-054` | `DELIV-PKG-015::GAP-PKG-054` | `DELIV-PKG-017::GAP-PKG-054` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-055` | `HYPERCARE-OPS-001::GAP-PKG-055` | `HYPERCARE-OPS-002::GAP-PKG-055` | `DELIV-PKG-015::GAP-PKG-055` | `DELIV-PKG-017::GAP-PKG-055` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-056` | `HYPERCARE-OPS-001::GAP-PKG-056` | `HYPERCARE-OPS-002::GAP-PKG-056` | `DELIV-PKG-015::GAP-PKG-056` | `DELIV-PKG-017::GAP-PKG-056` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-057` | `HYPERCARE-OPS-001::GAP-PKG-057` | `HYPERCARE-OPS-002::GAP-PKG-057` | `DELIV-PKG-015::GAP-PKG-057` | `DELIV-PKG-017::GAP-PKG-057` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-058` | `HYPERCARE-OPS-001::GAP-PKG-058` | `HYPERCARE-OPS-002::GAP-PKG-058` | `DELIV-PKG-015::GAP-PKG-058` | `DELIV-PKG-017::GAP-PKG-058` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-059` | `HYPERCARE-OPS-001::GAP-PKG-059` | `HYPERCARE-OPS-002::GAP-PKG-059` | `DELIV-PKG-015::GAP-PKG-059` | `DELIV-PKG-017::GAP-PKG-059` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-060` | `HYPERCARE-OPS-001::GAP-PKG-060` | `HYPERCARE-OPS-002::GAP-PKG-060` | `DELIV-PKG-015::GAP-PKG-060` | `DELIV-PKG-017::GAP-PKG-060` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-061` | `HYPERCARE-OPS-001::GAP-PKG-061` | `HYPERCARE-OPS-002::GAP-PKG-061` | `DELIV-PKG-015::GAP-PKG-061` | `DELIV-PKG-017::GAP-PKG-061` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-062` | `HYPERCARE-OPS-001::GAP-PKG-062` | `HYPERCARE-OPS-002::GAP-PKG-062` | `DELIV-PKG-015::GAP-PKG-062` | `DELIV-PKG-017::GAP-PKG-062` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-063` | `HYPERCARE-OPS-001::GAP-PKG-063` | `HYPERCARE-OPS-002::GAP-PKG-063` | `DELIV-PKG-015::GAP-PKG-063` | `DELIV-PKG-017::GAP-PKG-063` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-064` | `HYPERCARE-OPS-001::GAP-PKG-064` | `HYPERCARE-OPS-002::GAP-PKG-064` | `DELIV-PKG-015::GAP-PKG-064` | `DELIV-PKG-017::GAP-PKG-064` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-065` | `HYPERCARE-OPS-001::GAP-PKG-065` | `HYPERCARE-OPS-002::GAP-PKG-065` | `DELIV-PKG-015::GAP-PKG-065` | `DELIV-PKG-017::GAP-PKG-065` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-066` | `HYPERCARE-OPS-001::GAP-PKG-066` | `HYPERCARE-OPS-002::GAP-PKG-066` | `DELIV-PKG-015::GAP-PKG-066` | `DELIV-PKG-017::GAP-PKG-066` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-067` | `HYPERCARE-OPS-001::GAP-PKG-067` | `HYPERCARE-OPS-002::GAP-PKG-067` | `DELIV-PKG-015::GAP-PKG-067` | `DELIV-PKG-017::GAP-PKG-067` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-068` | `HYPERCARE-OPS-001::GAP-PKG-068` | `HYPERCARE-OPS-002::GAP-PKG-068` | `DELIV-PKG-015::GAP-PKG-068` | `DELIV-PKG-017::GAP-PKG-068` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-069` | `HYPERCARE-OPS-001::GAP-PKG-069` | `HYPERCARE-OPS-002::GAP-PKG-069` | `DELIV-PKG-015::GAP-PKG-069` | `DELIV-PKG-017::GAP-PKG-069` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-070` | `HYPERCARE-OPS-001::GAP-PKG-070` | `HYPERCARE-OPS-002::GAP-PKG-070` | `DELIV-PKG-015::GAP-PKG-070` | `DELIV-PKG-017::GAP-PKG-070` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-071` | `HYPERCARE-OPS-001::GAP-PKG-071` | `HYPERCARE-OPS-002::GAP-PKG-071` | `DELIV-PKG-015::GAP-PKG-071` | `DELIV-PKG-017::GAP-PKG-071` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-072` | `HYPERCARE-OPS-001::GAP-PKG-072` | `HYPERCARE-OPS-002::GAP-PKG-072` | `DELIV-PKG-015::GAP-PKG-072` | `DELIV-PKG-017::GAP-PKG-072` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-073` | `HYPERCARE-OPS-001::GAP-PKG-073` | `HYPERCARE-OPS-002::GAP-PKG-073` | `DELIV-PKG-015::GAP-PKG-073` | `DELIV-PKG-017::GAP-PKG-073` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-074` | `HYPERCARE-OPS-001::GAP-PKG-074` | `HYPERCARE-OPS-002::GAP-PKG-074` | `DELIV-PKG-015::GAP-PKG-074` | `DELIV-PKG-017::GAP-PKG-074` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-075` | `HYPERCARE-OPS-001::GAP-PKG-075` | `HYPERCARE-OPS-002::GAP-PKG-075` | `DELIV-PKG-015::GAP-PKG-075` | `DELIV-PKG-017::GAP-PKG-075` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-076` | `HYPERCARE-OPS-001::GAP-PKG-076` | `HYPERCARE-OPS-002::GAP-PKG-076` | `DELIV-PKG-015::GAP-PKG-076` | `DELIV-PKG-017::GAP-PKG-076` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-077` | `HYPERCARE-OPS-001::GAP-PKG-077` | `HYPERCARE-OPS-002::GAP-PKG-077` | `DELIV-PKG-015::GAP-PKG-077` | `DELIV-PKG-017::GAP-PKG-077` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-078` | `HYPERCARE-OPS-001::GAP-PKG-078` | `HYPERCARE-OPS-002::GAP-PKG-078` | `DELIV-PKG-015::GAP-PKG-078` | `DELIV-PKG-017::GAP-PKG-078` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-079` | `HYPERCARE-OPS-001::GAP-PKG-079` | `HYPERCARE-OPS-002::GAP-PKG-079` | `DELIV-PKG-015::GAP-PKG-079` | `DELIV-PKG-017::GAP-PKG-079` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-080` | `HYPERCARE-OPS-001::GAP-PKG-080` | `HYPERCARE-OPS-002::GAP-PKG-080` | `DELIV-PKG-015::GAP-PKG-080` | `DELIV-PKG-017::GAP-PKG-080` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-081` | `HYPERCARE-OPS-001::GAP-PKG-081` | `HYPERCARE-OPS-002::GAP-PKG-081` | `DELIV-PKG-015::GAP-PKG-081` | `DELIV-PKG-017::GAP-PKG-081` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-082` | `HYPERCARE-OPS-001::GAP-PKG-082` | `HYPERCARE-OPS-002::GAP-PKG-082` | `DELIV-PKG-015::GAP-PKG-082` | `DELIV-PKG-017::GAP-PKG-082` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-083` | `HYPERCARE-OPS-001::GAP-PKG-083` | `HYPERCARE-OPS-002::GAP-PKG-083` | `DELIV-PKG-015::GAP-PKG-083` | `DELIV-PKG-017::GAP-PKG-083` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-084` | `HYPERCARE-OPS-001::GAP-PKG-084` | `HYPERCARE-OPS-002::GAP-PKG-084` | `DELIV-PKG-015::GAP-PKG-084` | `DELIV-PKG-017::GAP-PKG-084` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-085` | `HYPERCARE-OPS-001::GAP-PKG-085` | `HYPERCARE-OPS-002::GAP-PKG-085` | `DELIV-PKG-015::GAP-PKG-085` | `DELIV-PKG-017::GAP-PKG-085` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-086` | `HYPERCARE-OPS-001::GAP-PKG-086` | `HYPERCARE-OPS-002::GAP-PKG-086` | `DELIV-PKG-015::GAP-PKG-086` | `DELIV-PKG-017::GAP-PKG-086` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-087` | `HYPERCARE-OPS-001::GAP-PKG-087` | `HYPERCARE-OPS-002::GAP-PKG-087` | `DELIV-PKG-015::GAP-PKG-087` | `DELIV-PKG-017::GAP-PKG-087` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-088` | `HYPERCARE-OPS-001::GAP-PKG-088` | `HYPERCARE-OPS-002::GAP-PKG-088` | `DELIV-PKG-015::GAP-PKG-088` | `DELIV-PKG-017::GAP-PKG-088` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-089` | `HYPERCARE-OPS-001::GAP-PKG-089` | `HYPERCARE-OPS-002::GAP-PKG-089` | `DELIV-PKG-015::GAP-PKG-089` | `DELIV-PKG-017::GAP-PKG-089` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-090` | `HYPERCARE-OPS-001::GAP-PKG-090` | `HYPERCARE-OPS-002::GAP-PKG-090` | `DELIV-PKG-015::GAP-PKG-090` | `DELIV-PKG-017::GAP-PKG-090` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-091` | `HYPERCARE-OPS-001::GAP-PKG-091` | `HYPERCARE-OPS-002::GAP-PKG-091` | `DELIV-PKG-015::GAP-PKG-091` | `DELIV-PKG-017::GAP-PKG-091` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-092` | `HYPERCARE-OPS-001::GAP-PKG-092` | `HYPERCARE-OPS-002::GAP-PKG-092` | `DELIV-PKG-015::GAP-PKG-092` | `DELIV-PKG-017::GAP-PKG-092` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-093` | `HYPERCARE-OPS-001::GAP-PKG-093` | `HYPERCARE-OPS-002::GAP-PKG-093` | `DELIV-PKG-015::GAP-PKG-093` | `DELIV-PKG-017::GAP-PKG-093` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-094` | `HYPERCARE-OPS-001::GAP-PKG-094` | `HYPERCARE-OPS-002::GAP-PKG-094` | `DELIV-PKG-015::GAP-PKG-094` | `DELIV-PKG-017::GAP-PKG-094` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-095` | `HYPERCARE-OPS-001::GAP-PKG-095` | `HYPERCARE-OPS-002::GAP-PKG-095` | `DELIV-PKG-015::GAP-PKG-095` | `DELIV-PKG-017::GAP-PKG-095` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-096` | `HYPERCARE-OPS-001::GAP-PKG-096` | `HYPERCARE-OPS-002::GAP-PKG-096` | `DELIV-PKG-015::GAP-PKG-096` | `DELIV-PKG-017::GAP-PKG-096` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-097` | `HYPERCARE-OPS-001::GAP-PKG-097` | `HYPERCARE-OPS-002::GAP-PKG-097` | `DELIV-PKG-015::GAP-PKG-097` | `DELIV-PKG-017::GAP-PKG-097` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-098` | `HYPERCARE-OPS-001::GAP-PKG-098` | `HYPERCARE-OPS-002::GAP-PKG-098` | `DELIV-PKG-015::GAP-PKG-098` | `DELIV-PKG-017::GAP-PKG-098` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-099` | `HYPERCARE-OPS-001::GAP-PKG-099` | `HYPERCARE-OPS-002::GAP-PKG-099` | `DELIV-PKG-015::GAP-PKG-099` | `DELIV-PKG-017::GAP-PKG-099` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-100` | `HYPERCARE-OPS-001::GAP-PKG-100` | `HYPERCARE-OPS-002::GAP-PKG-100` | `DELIV-PKG-015::GAP-PKG-100` | `DELIV-PKG-017::GAP-PKG-100` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-101` | `HYPERCARE-OPS-001::GAP-PKG-101` | `HYPERCARE-OPS-002::GAP-PKG-101` | `DELIV-PKG-015::GAP-PKG-101` | `DELIV-PKG-017::GAP-PKG-101` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-102` | `HYPERCARE-OPS-001::GAP-PKG-102` | `HYPERCARE-OPS-002::GAP-PKG-102` | `DELIV-PKG-015::GAP-PKG-102` | `DELIV-PKG-017::GAP-PKG-102` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-103` | `HYPERCARE-OPS-001::GAP-PKG-103` | `HYPERCARE-OPS-002::GAP-PKG-103` | `DELIV-PKG-015::GAP-PKG-103` | `DELIV-PKG-017::GAP-PKG-103` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-104` | `HYPERCARE-OPS-001::GAP-PKG-104` | `HYPERCARE-OPS-002::GAP-PKG-104` | `DELIV-PKG-015::GAP-PKG-104` | `DELIV-PKG-017::GAP-PKG-104` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-105` | `HYPERCARE-OPS-001::GAP-PKG-105` | `HYPERCARE-OPS-002::GAP-PKG-105` | `DELIV-PKG-015::GAP-PKG-105` | `DELIV-PKG-017::GAP-PKG-105` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-106` | `HYPERCARE-OPS-001::GAP-PKG-106` | `HYPERCARE-OPS-002::GAP-PKG-106` | `DELIV-PKG-015::GAP-PKG-106` | `DELIV-PKG-017::GAP-PKG-106` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-107` | `HYPERCARE-OPS-001::GAP-PKG-107` | `HYPERCARE-OPS-002::GAP-PKG-107` | `DELIV-PKG-015::GAP-PKG-107` | `DELIV-PKG-017::GAP-PKG-107` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-108` | `HYPERCARE-OPS-001::GAP-PKG-108` | `HYPERCARE-OPS-002::GAP-PKG-108` | `DELIV-PKG-015::GAP-PKG-108` | `DELIV-PKG-017::GAP-PKG-108` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-109` | `HYPERCARE-OPS-001::GAP-PKG-109` | `HYPERCARE-OPS-002::GAP-PKG-109` | `DELIV-PKG-015::GAP-PKG-109` | `DELIV-PKG-017::GAP-PKG-109` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-110` | `HYPERCARE-OPS-001::GAP-PKG-110` | `HYPERCARE-OPS-002::GAP-PKG-110` | `DELIV-PKG-015::GAP-PKG-110` | `DELIV-PKG-017::GAP-PKG-110` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-111` | `HYPERCARE-OPS-001::GAP-PKG-111` | `HYPERCARE-OPS-002::GAP-PKG-111` | `DELIV-PKG-015::GAP-PKG-111` | `DELIV-PKG-017::GAP-PKG-111` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-112` | `HYPERCARE-OPS-001::GAP-PKG-112` | `HYPERCARE-OPS-002::GAP-PKG-112` | `DELIV-PKG-015::GAP-PKG-112` | `DELIV-PKG-017::GAP-PKG-112` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-113` | `HYPERCARE-OPS-001::GAP-PKG-113` | `HYPERCARE-OPS-002::GAP-PKG-113` | `DELIV-PKG-015::GAP-PKG-113` | `DELIV-PKG-017::GAP-PKG-113` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-114` | `HYPERCARE-OPS-001::GAP-PKG-114` | `HYPERCARE-OPS-002::GAP-PKG-114` | `DELIV-PKG-015::GAP-PKG-114` | `DELIV-PKG-017::GAP-PKG-114` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-115` | `HYPERCARE-OPS-001::GAP-PKG-115` | `HYPERCARE-OPS-002::GAP-PKG-115` | `DELIV-PKG-015::GAP-PKG-115` | `DELIV-PKG-017::GAP-PKG-115` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-116` | `HYPERCARE-OPS-001::GAP-PKG-116` | `HYPERCARE-OPS-002::GAP-PKG-116` | `DELIV-PKG-015::GAP-PKG-116` | `DELIV-PKG-017::GAP-PKG-116` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-117` | `HYPERCARE-OPS-001::GAP-PKG-117` | `HYPERCARE-OPS-002::GAP-PKG-117` | `DELIV-PKG-015::GAP-PKG-117` | `DELIV-PKG-017::GAP-PKG-117` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-118` | `HYPERCARE-OPS-001::GAP-PKG-118` | `HYPERCARE-OPS-002::GAP-PKG-118` | `DELIV-PKG-015::GAP-PKG-118` | `DELIV-PKG-017::GAP-PKG-118` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-119` | `HYPERCARE-OPS-001::GAP-PKG-119` | `HYPERCARE-OPS-002::GAP-PKG-119` | `DELIV-PKG-015::GAP-PKG-119` | `DELIV-PKG-017::GAP-PKG-119` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-120` | `HYPERCARE-OPS-001::GAP-PKG-120` | `HYPERCARE-OPS-002::GAP-PKG-120` | `DELIV-PKG-015::GAP-PKG-120` | `DELIV-PKG-017::GAP-PKG-120` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-121` | `HYPERCARE-OPS-001::GAP-PKG-121` | `HYPERCARE-OPS-002::GAP-PKG-121` | `DELIV-PKG-015::GAP-PKG-121` | `DELIV-PKG-017::GAP-PKG-121` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-122` | `HYPERCARE-OPS-001::GAP-PKG-122` | `HYPERCARE-OPS-002::GAP-PKG-122` | `DELIV-PKG-015::GAP-PKG-122` | `DELIV-PKG-017::GAP-PKG-122` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-123` | `HYPERCARE-OPS-001::GAP-PKG-123` | `HYPERCARE-OPS-002::GAP-PKG-123` | `DELIV-PKG-015::GAP-PKG-123` | `DELIV-PKG-017::GAP-PKG-123` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-124` | `HYPERCARE-OPS-001::GAP-PKG-124` | `HYPERCARE-OPS-002::GAP-PKG-124` | `DELIV-PKG-015::GAP-PKG-124` | `DELIV-PKG-017::GAP-PKG-124` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-125` | `HYPERCARE-OPS-001::GAP-PKG-125` | `HYPERCARE-OPS-002::GAP-PKG-125` | `DELIV-PKG-015::GAP-PKG-125` | `DELIV-PKG-017::GAP-PKG-125` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-126` | `HYPERCARE-OPS-001::GAP-PKG-126` | `HYPERCARE-OPS-002::GAP-PKG-126` | `DELIV-PKG-015::GAP-PKG-126` | `DELIV-PKG-017::GAP-PKG-126` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-127` | `HYPERCARE-OPS-001::GAP-PKG-127` | `HYPERCARE-OPS-002::GAP-PKG-127` | `DELIV-PKG-015::GAP-PKG-127` | `DELIV-PKG-017::GAP-PKG-127` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-128` | `HYPERCARE-OPS-001::GAP-PKG-128` | `HYPERCARE-OPS-002::GAP-PKG-128` | `DELIV-PKG-015::GAP-PKG-128` | `DELIV-PKG-017::GAP-PKG-128` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-129` | `HYPERCARE-OPS-001::GAP-PKG-129` | `HYPERCARE-OPS-002::GAP-PKG-129` | `DELIV-PKG-015::GAP-PKG-129` | `DELIV-PKG-017::GAP-PKG-129` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-130` | `HYPERCARE-OPS-001::GAP-PKG-130` | `HYPERCARE-OPS-002::GAP-PKG-130` | `DELIV-PKG-015::GAP-PKG-130` | `DELIV-PKG-017::GAP-PKG-130` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-131` | `HYPERCARE-OPS-001::GAP-PKG-131` | `HYPERCARE-OPS-002::GAP-PKG-131` | `DELIV-PKG-015::GAP-PKG-131` | `DELIV-PKG-017::GAP-PKG-131` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-132` | `HYPERCARE-OPS-001::GAP-PKG-132` | `HYPERCARE-OPS-002::GAP-PKG-132` | `DELIV-PKG-015::GAP-PKG-132` | `DELIV-PKG-017::GAP-PKG-132` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-133` | `HYPERCARE-OPS-001::GAP-PKG-133` | `HYPERCARE-OPS-002::GAP-PKG-133` | `DELIV-PKG-015::GAP-PKG-133` | `DELIV-PKG-017::GAP-PKG-133` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-134` | `HYPERCARE-OPS-001::GAP-PKG-134` | `HYPERCARE-OPS-002::GAP-PKG-134` | `DELIV-PKG-015::GAP-PKG-134` | `DELIV-PKG-017::GAP-PKG-134` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-135` | `HYPERCARE-OPS-001::GAP-PKG-135` | `HYPERCARE-OPS-002::GAP-PKG-135` | `DELIV-PKG-015::GAP-PKG-135` | `DELIV-PKG-017::GAP-PKG-135` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-136` | `HYPERCARE-OPS-001::GAP-PKG-136` | `HYPERCARE-OPS-002::GAP-PKG-136` | `DELIV-PKG-015::GAP-PKG-136` | `DELIV-PKG-017::GAP-PKG-136` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-137` | `HYPERCARE-OPS-001::GAP-PKG-137` | `HYPERCARE-OPS-002::GAP-PKG-137` | `DELIV-PKG-015::GAP-PKG-137` | `DELIV-PKG-017::GAP-PKG-137` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-138` | `HYPERCARE-OPS-001::GAP-PKG-138` | `HYPERCARE-OPS-002::GAP-PKG-138` | `DELIV-PKG-015::GAP-PKG-138` | `DELIV-PKG-017::GAP-PKG-138` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-139` | `HYPERCARE-OPS-001::GAP-PKG-139` | `HYPERCARE-OPS-002::GAP-PKG-139` | `DELIV-PKG-015::GAP-PKG-139` | `DELIV-PKG-017::GAP-PKG-139` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-140` | `HYPERCARE-OPS-001::GAP-PKG-140` | `HYPERCARE-OPS-002::GAP-PKG-140` | `DELIV-PKG-015::GAP-PKG-140` | `DELIV-PKG-017::GAP-PKG-140` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-141` | `HYPERCARE-OPS-001::GAP-PKG-141` | `HYPERCARE-OPS-002::GAP-PKG-141` | `DELIV-PKG-015::GAP-PKG-141` | `DELIV-PKG-017::GAP-PKG-141` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-142` | `HYPERCARE-OPS-001::GAP-PKG-142` | `HYPERCARE-OPS-002::GAP-PKG-142` | `DELIV-PKG-015::GAP-PKG-142` | `DELIV-PKG-017::GAP-PKG-142` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-143` | `HYPERCARE-OPS-001::GAP-PKG-143` | `HYPERCARE-OPS-002::GAP-PKG-143` | `DELIV-PKG-015::GAP-PKG-143` | `DELIV-PKG-017::GAP-PKG-143` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-144` | `HYPERCARE-OPS-001::GAP-PKG-144` | `HYPERCARE-OPS-002::GAP-PKG-144` | `DELIV-PKG-015::GAP-PKG-144` | `DELIV-PKG-017::GAP-PKG-144` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-145` | `HYPERCARE-OPS-001::GAP-PKG-145` | `HYPERCARE-OPS-002::GAP-PKG-145` | `DELIV-PKG-015::GAP-PKG-145` | `DELIV-PKG-017::GAP-PKG-145` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-146` | `HYPERCARE-OPS-001::GAP-PKG-146` | `HYPERCARE-OPS-002::GAP-PKG-146` | `DELIV-PKG-015::GAP-PKG-146` | `DELIV-PKG-017::GAP-PKG-146` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-147` | `HYPERCARE-OPS-001::GAP-PKG-147` | `HYPERCARE-OPS-002::GAP-PKG-147` | `DELIV-PKG-015::GAP-PKG-147` | `DELIV-PKG-017::GAP-PKG-147` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-148` | `HYPERCARE-OPS-001::GAP-PKG-148` | `HYPERCARE-OPS-002::GAP-PKG-148` | `DELIV-PKG-015::GAP-PKG-148` | `DELIV-PKG-017::GAP-PKG-148` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-149` | `HYPERCARE-OPS-001::GAP-PKG-149` | `HYPERCARE-OPS-002::GAP-PKG-149` | `DELIV-PKG-015::GAP-PKG-149` | `DELIV-PKG-017::GAP-PKG-149` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-150` | `HYPERCARE-OPS-001::GAP-PKG-150` | `HYPERCARE-OPS-002::GAP-PKG-150` | `DELIV-PKG-015::GAP-PKG-150` | `DELIV-PKG-017::GAP-PKG-150` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-151` | `HYPERCARE-OPS-001::GAP-PKG-151` | `HYPERCARE-OPS-002::GAP-PKG-151` | `DELIV-PKG-015::GAP-PKG-151` | `DELIV-PKG-017::GAP-PKG-151` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-152` | `HYPERCARE-OPS-001::GAP-PKG-152` | `HYPERCARE-OPS-002::GAP-PKG-152` | `DELIV-PKG-015::GAP-PKG-152` | `DELIV-PKG-017::GAP-PKG-152` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-153` | `HYPERCARE-OPS-001::GAP-PKG-153` | `HYPERCARE-OPS-002::GAP-PKG-153` | `DELIV-PKG-015::GAP-PKG-153` | `DELIV-PKG-017::GAP-PKG-153` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-154` | `HYPERCARE-OPS-001::GAP-PKG-154` | `HYPERCARE-OPS-002::GAP-PKG-154` | `DELIV-PKG-015::GAP-PKG-154` | `DELIV-PKG-017::GAP-PKG-154` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-155` | `HYPERCARE-OPS-001::GAP-PKG-155` | `HYPERCARE-OPS-002::GAP-PKG-155` | `DELIV-PKG-015::GAP-PKG-155` | `DELIV-PKG-017::GAP-PKG-155` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-156` | `HYPERCARE-OPS-001::GAP-PKG-156` | `HYPERCARE-OPS-002::GAP-PKG-156` | `DELIV-PKG-015::GAP-PKG-156` | `DELIV-PKG-017::GAP-PKG-156` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-157` | `HYPERCARE-OPS-001::GAP-PKG-157` | `HYPERCARE-OPS-002::GAP-PKG-157` | `DELIV-PKG-015::GAP-PKG-157` | `DELIV-PKG-017::GAP-PKG-157` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-158` | `HYPERCARE-OPS-001::GAP-PKG-158` | `HYPERCARE-OPS-002::GAP-PKG-158` | `DELIV-PKG-015::GAP-PKG-158` | `DELIV-PKG-017::GAP-PKG-158` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-159` | `HYPERCARE-OPS-001::GAP-PKG-159` | `HYPERCARE-OPS-002::GAP-PKG-159` | `DELIV-PKG-015::GAP-PKG-159` | `DELIV-PKG-017::GAP-PKG-159` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-160` | `HYPERCARE-OPS-001::GAP-PKG-160` | `HYPERCARE-OPS-002::GAP-PKG-160` | `DELIV-PKG-015::GAP-PKG-160` | `DELIV-PKG-017::GAP-PKG-160` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-161` | `HYPERCARE-OPS-001::GAP-PKG-161` | `HYPERCARE-OPS-002::GAP-PKG-161` | `DELIV-PKG-015::GAP-PKG-161` | `DELIV-PKG-017::GAP-PKG-161` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-162` | `HYPERCARE-OPS-001::GAP-PKG-162` | `HYPERCARE-OPS-002::GAP-PKG-162` | `DELIV-PKG-015::GAP-PKG-162` | `DELIV-PKG-017::GAP-PKG-162` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-163` | `HYPERCARE-OPS-001::GAP-PKG-163` | `HYPERCARE-OPS-002::GAP-PKG-163` | `DELIV-PKG-015::GAP-PKG-163` | `DELIV-PKG-017::GAP-PKG-163` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-164` | `HYPERCARE-OPS-001::GAP-PKG-164` | `HYPERCARE-OPS-002::GAP-PKG-164` | `DELIV-PKG-015::GAP-PKG-164` | `DELIV-PKG-017::GAP-PKG-164` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-165` | `HYPERCARE-OPS-001::GAP-PKG-165` | `HYPERCARE-OPS-002::GAP-PKG-165` | `DELIV-PKG-015::GAP-PKG-165` | `DELIV-PKG-017::GAP-PKG-165` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-166` | `HYPERCARE-OPS-001::GAP-PKG-166` | `HYPERCARE-OPS-002::GAP-PKG-166` | `DELIV-PKG-015::GAP-PKG-166` | `DELIV-PKG-017::GAP-PKG-166` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-167` | `HYPERCARE-OPS-001::GAP-PKG-167` | `HYPERCARE-OPS-002::GAP-PKG-167` | `DELIV-PKG-015::GAP-PKG-167` | `DELIV-PKG-017::GAP-PKG-167` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-168` | `HYPERCARE-OPS-001::GAP-PKG-168` | `HYPERCARE-OPS-002::GAP-PKG-168` | `DELIV-PKG-015::GAP-PKG-168` | `DELIV-PKG-017::GAP-PKG-168` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-169` | `HYPERCARE-OPS-001::GAP-PKG-169` | `HYPERCARE-OPS-002::GAP-PKG-169` | `DELIV-PKG-015::GAP-PKG-169` | `DELIV-PKG-017::GAP-PKG-169` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-170` | `HYPERCARE-OPS-001::GAP-PKG-170` | `HYPERCARE-OPS-002::GAP-PKG-170` | `DELIV-PKG-015::GAP-PKG-170` | `DELIV-PKG-017::GAP-PKG-170` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-171` | `HYPERCARE-OPS-001::GAP-PKG-171` | `HYPERCARE-OPS-002::GAP-PKG-171` | `DELIV-PKG-015::GAP-PKG-171` | `DELIV-PKG-017::GAP-PKG-171` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-172` | `HYPERCARE-OPS-001::GAP-PKG-172` | `HYPERCARE-OPS-002::GAP-PKG-172` | `DELIV-PKG-015::GAP-PKG-172` | `DELIV-PKG-017::GAP-PKG-172` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-173` | `HYPERCARE-OPS-001::GAP-PKG-173` | `HYPERCARE-OPS-002::GAP-PKG-173` | `DELIV-PKG-015::GAP-PKG-173` | `DELIV-PKG-017::GAP-PKG-173` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-174` | `HYPERCARE-OPS-001::GAP-PKG-174` | `HYPERCARE-OPS-002::GAP-PKG-174` | `DELIV-PKG-015::GAP-PKG-174` | `DELIV-PKG-017::GAP-PKG-174` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-175` | `HYPERCARE-OPS-001::GAP-PKG-175` | `HYPERCARE-OPS-002::GAP-PKG-175` | `DELIV-PKG-015::GAP-PKG-175` | `DELIV-PKG-017::GAP-PKG-175` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-176` | `HYPERCARE-OPS-001::GAP-PKG-176` | `HYPERCARE-OPS-002::GAP-PKG-176` | `DELIV-PKG-015::GAP-PKG-176` | `DELIV-PKG-017::GAP-PKG-176` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-177` | `HYPERCARE-OPS-001::GAP-PKG-177` | `HYPERCARE-OPS-002::GAP-PKG-177` | `DELIV-PKG-015::GAP-PKG-177` | `DELIV-PKG-017::GAP-PKG-177` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-178` | `HYPERCARE-OPS-001::GAP-PKG-178` | `HYPERCARE-OPS-002::GAP-PKG-178` | `DELIV-PKG-015::GAP-PKG-178` | `DELIV-PKG-017::GAP-PKG-178` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-179` | `HYPERCARE-OPS-001::GAP-PKG-179` | `HYPERCARE-OPS-002::GAP-PKG-179` | `DELIV-PKG-015::GAP-PKG-179` | `DELIV-PKG-017::GAP-PKG-179` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-180` | `HYPERCARE-OPS-001::GAP-PKG-180` | `HYPERCARE-OPS-002::GAP-PKG-180` | `DELIV-PKG-015::GAP-PKG-180` | `DELIV-PKG-017::GAP-PKG-180` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-181` | `HYPERCARE-OPS-001::GAP-PKG-181` | `HYPERCARE-OPS-002::GAP-PKG-181` | `DELIV-PKG-015::GAP-PKG-181` | `DELIV-PKG-017::GAP-PKG-181` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-182` | `HYPERCARE-OPS-001::GAP-PKG-182` | `HYPERCARE-OPS-002::GAP-PKG-182` | `DELIV-PKG-015::GAP-PKG-182` | `DELIV-PKG-017::GAP-PKG-182` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-183` | `HYPERCARE-OPS-001::GAP-PKG-183` | `HYPERCARE-OPS-002::GAP-PKG-183` | `DELIV-PKG-015::GAP-PKG-183` | `DELIV-PKG-017::GAP-PKG-183` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-184` | `HYPERCARE-OPS-001::GAP-PKG-184` | `HYPERCARE-OPS-002::GAP-PKG-184` | `DELIV-PKG-015::GAP-PKG-184` | `DELIV-PKG-017::GAP-PKG-184` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-185` | `HYPERCARE-OPS-001::GAP-PKG-185` | `HYPERCARE-OPS-002::GAP-PKG-185` | `DELIV-PKG-015::GAP-PKG-185` | `DELIV-PKG-017::GAP-PKG-185` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-186` | `HYPERCARE-OPS-001::GAP-PKG-186` | `HYPERCARE-OPS-002::GAP-PKG-186` | `DELIV-PKG-015::GAP-PKG-186` | `DELIV-PKG-017::GAP-PKG-186` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-187` | `HYPERCARE-OPS-001::GAP-PKG-187` | `HYPERCARE-OPS-002::GAP-PKG-187` | `DELIV-PKG-015::GAP-PKG-187` | `DELIV-PKG-017::GAP-PKG-187` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-188` | `HYPERCARE-OPS-001::GAP-PKG-188` | `HYPERCARE-OPS-002::GAP-PKG-188` | `DELIV-PKG-015::GAP-PKG-188` | `DELIV-PKG-017::GAP-PKG-188` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-189` | `HYPERCARE-OPS-001::GAP-PKG-189` | `HYPERCARE-OPS-002::GAP-PKG-189` | `DELIV-PKG-015::GAP-PKG-189` | `DELIV-PKG-017::GAP-PKG-189` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-190` | `HYPERCARE-OPS-001::GAP-PKG-190` | `HYPERCARE-OPS-002::GAP-PKG-190` | `DELIV-PKG-015::GAP-PKG-190` | `DELIV-PKG-017::GAP-PKG-190` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-191` | `HYPERCARE-OPS-001::GAP-PKG-191` | `HYPERCARE-OPS-002::GAP-PKG-191` | `DELIV-PKG-015::GAP-PKG-191` | `DELIV-PKG-017::GAP-PKG-191` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-192` | `HYPERCARE-OPS-001::GAP-PKG-192` | `HYPERCARE-OPS-002::GAP-PKG-192` | `DELIV-PKG-015::GAP-PKG-192` | `DELIV-PKG-017::GAP-PKG-192` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-193` | `HYPERCARE-OPS-001::GAP-PKG-193` | `HYPERCARE-OPS-002::GAP-PKG-193` | `DELIV-PKG-015::GAP-PKG-193` | `DELIV-PKG-017::GAP-PKG-193` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-194` | `HYPERCARE-OPS-001::GAP-PKG-194` | `HYPERCARE-OPS-002::GAP-PKG-194` | `DELIV-PKG-015::GAP-PKG-194` | `DELIV-PKG-017::GAP-PKG-194` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-195` | `HYPERCARE-OPS-001::GAP-PKG-195` | `HYPERCARE-OPS-002::GAP-PKG-195` | `DELIV-PKG-015::GAP-PKG-195` | `DELIV-PKG-017::GAP-PKG-195` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-196` | `HYPERCARE-OPS-001::GAP-PKG-196` | `HYPERCARE-OPS-002::GAP-PKG-196` | `DELIV-PKG-015::GAP-PKG-196` | `DELIV-PKG-017::GAP-PKG-196` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-197` | `HYPERCARE-OPS-001::GAP-PKG-197` | `HYPERCARE-OPS-002::GAP-PKG-197` | `DELIV-PKG-015::GAP-PKG-197` | `DELIV-PKG-017::GAP-PKG-197` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-198` | `HYPERCARE-OPS-001::GAP-PKG-198` | `HYPERCARE-OPS-002::GAP-PKG-198` | `DELIV-PKG-015::GAP-PKG-198` | `DELIV-PKG-017::GAP-PKG-198` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-199` | `HYPERCARE-OPS-001::GAP-PKG-199` | `HYPERCARE-OPS-002::GAP-PKG-199` | `DELIV-PKG-015::GAP-PKG-199` | `DELIV-PKG-017::GAP-PKG-199` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-200` | `HYPERCARE-OPS-001::GAP-PKG-200` | `HYPERCARE-OPS-002::GAP-PKG-200` | `DELIV-PKG-015::GAP-PKG-200` | `DELIV-PKG-017::GAP-PKG-200` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-201` | `HYPERCARE-OPS-001::GAP-PKG-201` | `HYPERCARE-OPS-002::GAP-PKG-201` | `DELIV-PKG-015::GAP-PKG-201` | `DELIV-PKG-017::GAP-PKG-201` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-202` | `HYPERCARE-OPS-001::GAP-PKG-202` | `HYPERCARE-OPS-002::GAP-PKG-202` | `DELIV-PKG-015::GAP-PKG-202` | `DELIV-PKG-017::GAP-PKG-202` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-203` | `HYPERCARE-OPS-001::GAP-PKG-203` | `HYPERCARE-OPS-002::GAP-PKG-203` | `DELIV-PKG-015::GAP-PKG-203` | `DELIV-PKG-017::GAP-PKG-203` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-204` | `HYPERCARE-OPS-001::GAP-PKG-204` | `HYPERCARE-OPS-002::GAP-PKG-204` | `DELIV-PKG-015::GAP-PKG-204` | `DELIV-PKG-017::GAP-PKG-204` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-205` | `HYPERCARE-OPS-001::GAP-PKG-205` | `HYPERCARE-OPS-002::GAP-PKG-205` | `DELIV-PKG-015::GAP-PKG-205` | `DELIV-PKG-017::GAP-PKG-205` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-206` | `HYPERCARE-OPS-001::GAP-PKG-206` | `HYPERCARE-OPS-002::GAP-PKG-206` | `DELIV-PKG-015::GAP-PKG-206` | `DELIV-PKG-017::GAP-PKG-206` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |
| `GAP-PKG-207` | `HYPERCARE-OPS-001::GAP-PKG-207` | `HYPERCARE-OPS-002::GAP-PKG-207` | `DELIV-PKG-015::GAP-PKG-207` | `DELIV-PKG-017::GAP-PKG-207` | hereda señales, códigos y criterios del perfil 017 | aplica solo si la topología 015/017 declara cola, outbox, inbox o job | aplica solo si la topología 015/017 declara integración o dependencia | hereda SLI, presupuesto y referencias de 013/017 sin crear umbrales | `ESPECIFICADO`    |

---

#### 18. Reconciliación de cobertura

La matriz cumple simultáneamente:

- universo esperado: **207** raíces;
- universo materializado: **207** filas;
- rango: `GAP-PKG-001..207`;
- faltantes permitidos: **0**;
- duplicados permitidos: **0**;
- reasignaciones de `package_id`: **0**;
- cambios de modalidad heredada: **0**;
- cambios de ownership heredado: **0**;
- umbrales numéricos nuevos: **0**;
- ejecuciones de monitoreo afirmadas: **0**.

La aplicabilidad concreta de colas e integraciones se resuelve por la topología y el perfil observacional de la fila homónima; no por ausencia aparente de datos.

---

#### 19. Dependencias y entradas de ejecución

Antes de que `SHELL-CI-023::<package_id>` use este contrato, la instancia deberá conservar:

1. handoff válido y misma identidad de 001;
2. responsabilidad y cobertura resueltas por 002;
3. topología aplicable de 015;
4. perfil de observabilidad aplicable de 017;
5. referencias no funcionales y SLI aplicables de 013/NFR-REQ-009;
6. requisitos y evidencia esperada de 016;
7. release, rollout y cambios correlacionables de 019;
8. rollback/recovery aplicable de 020;
9. observabilidad/routing de readiness aplicable;
10. mecanismos autorizados para obtener evidencia sin vulnerar privacidad o segregación.

Una dependencia bloqueada conserva su bloqueo. Esta tarea no lo convierte en una ejecución exitosa.

---

#### 20. Entregables canónicos de la tarea

003 deja definidos y materializados:

- contrato común de monitoreo técnico para hypercare;
- reglas específicas para errores;
- reglas específicas para colas, outbox, inbox y jobs;
- reglas específicas para integraciones y dependencias;
- reglas específicas para rendimiento técnico;
- regla de salud del propio monitoreo;
- estados documentales y bloqueos de evidencia;
- handoffs hacia 004, 005, 006, 007, 008, 009 y 010;
- matriz completa de **207** raíces;
- reconciliación de cobertura y modalidades heredadas;
- decisión explícita de **cero cambios TREQ**.

---

#### 21. Responsable

La interpretación y reacción futura se rigen por `HYPERCARE-OPS-002`:

- responsable funcional: `functional_owner_ref` heredado de la fila homónima de `DELIV-PKG-017`;
- responsable técnico: `technical_owner_ref` heredado de la fila homónima de `DELIV-PKG-020` y sus fuentes `DELIV-PKG-014/015/019`;
- cobertura y suplencia: `READY-GATE-010`;
- ownership y enrutamiento de observabilidad: `DELIV-PKG-017` y `READY-GATE-011`.

003 no crea personas, cargos, guardias, canales ni autoridades nuevas.

---

#### 22. Requisitos de prueba derivados

**Nuevos requisitos `TREQ-*`: 0.**

**Requisitos `TREQ-*` modificados: 0.**

**Fragmentos 04A afectados: 0.**

Justificación: las reglas verificables de esta tarea ya están protegidas por requisitos vigentes, particularmente:

- `TREQ-PROC-461`: perfil de observabilidad por servicio, proceso, integración o dependencia;
- `TREQ-PROC-463..465`: correlación, semántica de señales, errores, latencia, saturación y resultado;
- `TREQ-PROC-467..472`: logs estructurados, privacidad, trazas, salud y black-box;
- `TREQ-PROC-473..480`: cliente, dispositivo, offline, integraciones, Supabase, colas, periféricos y jobs;
- `TREQ-PROC-481..484`: correlación con releases, SLI/SLO, dashboards y alertas;
- `TREQ-PROC-1532`, `TREQ-PROC-1533` y `TREQ-PROC-1539`: carga/backlog, tiempos/resultados diferenciados y correlación extremo a extremo;
- `TREQ-INTEGRATION-003` y `TREQ-INTEGRATION-004`: idempotencia, reintentos, observabilidad y trazabilidad de cadenas asíncronas;
- `TREQ-CONT-002`: autoridad y trazabilidad de incidentes cuando un hallazgo sea posteriormente clasificado como tal.

003 especializa el momento y la identidad de consumo de esas reglas durante hypercare; no introduce una regla empresarial o técnica nueva que justifique duplicar el registro.

---

#### 23. Evidencia y trazabilidad

La ejecución futura deberá poder vincular cada conclusión técnica con:

- fila exacta del `package_id`;
- identidad temporal de 001;
- responsabilidad de 002;
- topología 015;
- perfil 017;
- candidato, release, ambiente y alcance;
- señal observada y su semántica versionada;
- periodo y punto de medición;
- referencia de SLI, presupuesto o condición cuando exista;
- estado del pipeline de monitoreo;
- hallazgo y tarea propietaria de seguimiento cuando exista.

Una captura aislada, un mensaje de texto libre o una ausencia de alertas no constituyen por sí solos evidencia suficiente de estabilidad.

---

#### 24. Criterios de aceptación

003 queda documentalmente cerrada únicamente cuando se cumplen simultáneamente:

- [x] se separan errores, colas/jobs, integraciones y rendimiento técnico;
- [x] el contrato conserva la misma identidad `package_id + candidate_ref + environment + authorized_scope_ref` de 001;
- [x] ownership y escalamiento se heredan de 002 sin autoridad paralela;
- [x] topología y aplicabilidad se heredan de 015;
- [x] señales, métricas y alertas se heredan de 017;
- [x] SLI, presupuestos y objetivos se heredan de fuentes aprobadas sin inventar umbrales;
- [x] errores exigen códigos o semántica estable y no se clasifican por texto libre;
- [x] ausencia de errores solo se interpreta con pipeline de observación disponible;
- [x] colas observan estado, edad, procesamiento, reintento, dead-letter, capacidad y backpressure cuando aplican;
- [x] una cola vacía no se considera saludable si dejó de recibir trabajo esperado;
- [x] integraciones separan acuse técnico, timeout, resultado desconocido y efecto empresarial;
- [x] rendimiento separa demanda, latencia, saturación, capacidad y backlog conforme al perfil aplicable;
- [x] no se confunde rendimiento técnico con tiempos o adopción operativa de 004;
- [x] una ausencia de SLO final no se presenta como cumplimiento;
- [x] se preserva privacidad y minimización de telemetría;
- [x] se define la salud del propio monitoreo antes de interpretar ausencia de síntomas;
- [x] los hallazgos tienen handoff exacto hacia 004..010 sin invadir esas tareas;
- [x] las **207** raíces aparecen exactamente una vez;
- [x] se preserva la distribución `160 + 3 + 26 + 14 + 2 + 2 = 207`;
- [x] AURA, dependencias externas bloqueadas y TALENTO no se presentan como hypercare ejecutado;
- [x] se crean cero `TREQ-*`, se modifican cero `TREQ-*` y se afectan cero fragmentos 04A;
- [x] no se ejecutan monitoreo, consultas, instrumentación, código, despliegues, migraciones, DDL/DML, backfills, cambios de datos, configuración remota ni operaciones sobre Supabase.

---

#### 25. Conflictos y brechas

No se introduce una contradicción ni una brecha documental nueva dentro del alcance de 003. La aplicabilidad concreta de cada señal, cola, integración, dependencia o presupuesto permanece gobernada por la fila homónima vigente de sus fuentes propietarias y no puede resolverse por inferencia.

No queda pendiente narrativo sin propietario: cualquier ausencia de señal o referencia obligatoria queda bloqueada por la fuente propietaria correspondiente; cualquier hallazgo observado se entrega a 004, 005, 006, 007, 008, 009 o 010 según la sección 15.

---

#### 26. Continuidad

##### ÚLTIMA TAREA APROBADA
HYPERCARE-OPS-002 — Definir responsables funcionales y técnicos

##### TAREA ACTUAL APROBADA
HYPERCARE-OPS-003 — Definir monitoreo de errores, colas, integraciones y rendimiento

##### SIGUIENTE TAREA RESERVADA
HYPERCARE-OPS-004 — Definir monitoreo de adopción, tiempos y desviaciones operativas


### ✅ HYPERCARE-OPS-004 — Definir monitoreo de adopción, tiempos y desviaciones operativas

**Estado:** APROBADA
**Tarea anterior:** `HYPERCARE-OPS-003 — Definir monitoreo de errores, colas, integraciones y rendimiento`
**Tarea siguiente:** `HYPERCARE-OPS-005 — Definir conciliaciones de datos y efectos entre dominios`
**Tipo de tarea:** documental — definición normativa y materialización completa del monitoreo de adopción, tiempos humanos y desviaciones operativas durante hypercare para las 207 raíces `GAP-PKG-*`; sin ejecutar monitoreo, clasificar incidentes, conciliar datos, modificar procesos, desplegar cambios, alterar configuración ni operar sobre Supabase
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/05_HYPERCARE_Y_ESTABILIZACION.md`
**Ejecución posterior:** `SHELL-CI-023::<package_id>` dentro de la instancia temporal autorizada por `HYPERCARE-OPS-001::<package_id>` y después de la salida aplicable de `SHELL-CI-022::<package_id>`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Resultado canónico

`HYPERCARE-OPS-004` define el contrato operativo que deberá ejecutar posteriormente `SHELL-CI-023::<package_id>` para observar, durante hypercare y dentro del alcance exacto del candidato autorizado, tres dimensiones independientes:

1. **adopción real** del proceso o capacidad TO-BE por la población habilitada;
2. **tiempos humanos y de ciclo operativo** necesarios para completar, continuar, esperar, recuperar o abandonar el trabajo;
3. **desviaciones operativas** entre el recorrido aprobado y el recorrido realmente observado.

La tarea materializa el perfil para las **207/207** raíces `GAP-PKG-001..207`. La existencia del perfil documental no afirma que exista tráfico real, que una raíz esté activa, que se haya medido una persona, que se haya cumplido un umbral ni que hypercare pueda cerrarse.

La interpretación canónica es obligatoria:

- **adopción no equivale a despliegue, login, visita, render de una pantalla, request técnico ni existencia de una ruta**; exige evidencia de uso dentro del alcance autorizado y un resultado empresarial o progreso gobernado atribuible al proceso aplicable;
- **tiempo operativo no equivale a latencia técnica**; `HYPERCARE-OPS-003` conserva errores, colas, integraciones y rendimiento técnico, mientras 004 observa el tiempo experimentado por el trabajo humano y el ciclo empresarial;
- **desviación no equivale automáticamente a defecto o incidente**; 004 detecta y conserva la diferencia observada, mientras `HYPERCARE-OPS-006` conserva clasificación, prioridad y procedimiento de corrección;
- **una variante, contingencia o modo degradado expresamente aprobados no son desviación por su sola utilización**;
- **la telemetría de adopción no se utilizará como medición individual de productividad ni como mecanismo disciplinario**.

---

#### 2. Propósito sustantivo

El resultado de esta tarea debe permitir responder de forma reproducible, por cada instancia de hypercare ejecutable:

1. ¿La población y el alcance autorizados están usando realmente el recorrido TO-BE que fue pilotado y aceptado?
2. ¿El trabajo se completa dentro de los tiempos o referencias ya aprobados para ese proceso, cohorte y contexto, sin fabricar objetivos nuevos?
3. ¿Dónde se concentra tiempo activo, espera, bloqueo, ayuda, reintento, recuperación o abandono?
4. ¿Qué recorridos alternos, omisiones, handoffs rotos, retornos, workarounds o dependencias de asistencia se apartan del proceso aprobado?
5. ¿La evidencia es suficiente para distinguir falta de adopción, falta de observabilidad, bajo volumen, bloqueo, uso legítimo de contingencia y una desviación material?
6. ¿Cada hallazgo conserva propietario y destino documental sin invadir conciliación, incidentes, deuda, soporte, contingencias o cierre final?

004 no define cómo se corregirá un hallazgo y no autoriza cambios de proceso, permisos, configuración, código, datos, capacitación o soporte.

---

#### 3. Entradas canónicas vinculantes

La ejecución futura del contrato definido aquí deberá resolver cada identidad desde las fuentes vigentes y homónimas, sin crear una segunda fuente de verdad:

- `HYPERCARE-OPS-001::<package_id>` — identidad temporal, candidato, ambiente, alcance autorizado, duración por evidencia y elegibilidad temporal de salida;
- `HYPERCARE-OPS-002::<package_id>` — propietario funcional, autoridad técnica y cobertura de responsabilidades;
- `HYPERCARE-OPS-003::<package_id>` — contexto técnico correlacionable de errores, colas, integraciones y rendimiento, sin convertirlo en medición humana;
- `DELIV-PKG-013::<package_id>` — requisitos no funcionales y umbrales aprobados aplicables;
- `DELIV-PKG-016::<package_id>` — pruebas, oráculos, ambientes, responsables y evidencia esperada;
- `DELIV-PKG-017::<package_id>` — señales, métricas, alertas, auditoría, conservación y datos prohibidos;
- `DELIV-PKG-021::<package_id>` — documentación, procedimiento, runbooks y capacitación requeridos;
- `DELIV-PKG-022::<package_id>` — población, cohorte, sede, datos, dispositivo, ambiente, modalidad y exposición aprobadas para el piloto;
- `DELIV-PKG-023::<package_id>` — criterios medibles de aceptación, evidencia y tratamiento de hallazgos del piloto;
- `READY-GATE-008::<package_id>` — procedimientos normales y de contingencia cuya ejecución debe poder compararse con lo observado;
- `READY-GATE-009::<package_id>` — preparación de personas, competencia, vigencia y material de apoyo;
- `READY-GATE-010::<package_id>` — capacidad de soporte, responsables y escalamiento;
- `READY-GATE-011::<package_id>` — monitoreo, métricas y alertas previamente habilitados para el paquete;
- `READY-GATE-013::<package_id>` — `required_baseline_set`, línea base congelada, comparabilidad, calidad y limitaciones antes del piloto;
- `READY-GATE-014::<package_id>` — riesgos aceptados y desviaciones temporales expresamente autorizadas;
- `SHELL-CI-023::<package_id>` — ejecución posterior de hypercare y captura real de evidencia;
- `SHELL-CI-024::<package_id>` — consumidor posterior del expediente de estabilización para cierre y transferencia.

Cuando una entrada no aplique a la modalidad heredada, esa condición se conserva; 004 no crea evidencia ficticia ni convierte ausencia de ejecución en cero adopción.

---

#### 4. Frontera con las demás tareas HYPERCARE

| Tarea               | Propiedad exclusiva que 004 no absorbe                                        |
| ------------------- | ----------------------------------------------------------------------------- |
| `HYPERCARE-OPS-001` | inicio, duración, suspensión, extensión y candidatura temporal de salida      |
| `HYPERCARE-OPS-002` | responsables funcionales, autoridades técnicas y cobertura de responsabilidad |
| `HYPERCARE-OPS-003` | errores, colas, integraciones, dependencias y rendimiento técnico             |
| `HYPERCARE-OPS-005` | conciliación de datos, documentos, saldos y efectos entre dominios            |
| `HYPERCARE-OPS-006` | clasificación, prioridad y procedimiento de corrección de incidentes          |
| `HYPERCARE-OPS-007` | registro, aprobación y destino de deuda o trabajo posterior                   |
| `HYPERCARE-OPS-008` | criterio de transferencia a soporte ordinario y documentación definitiva      |
| `HYPERCARE-OPS-009` | criterio y evidencia para retirar contingencias temporales                    |
| `HYPERCARE-OPS-010` | autoridad y evidencia del cierre funcional, técnico y operativo               |

Un hallazgo de 004 puede alimentar una tarea propietaria posterior, pero no cambia por sí solo la clasificación, el estado o la autoridad de esa tarea.

---

#### 5. Unidad de monitoreo y correlación

El perfil se resuelve por la misma instancia de hypercare definida en 001:

`package_id + candidate_ref + environment + authorized_scope_ref + shell_ci_023_execution_ref`

Cuando resulten aplicables, la observación conserva además las referencias heredadas a:

- cohorte exacta heredada de `DELIV-PKG-022`;
- sede, área, turno o ámbito autorizado;
- `process_id`, flujo, etapa o tarea operacional observada;
- actor o categoría de actor autorizada, sin convertir identidad personal en métrica de productividad;
- dispositivo o modalidad de interacción cuando altere comparabilidad;
- `baseline_set_version` y `baseline_element_id` de `READY-GATE-013`;
- ventana temporal exacta de observación;
- candidato, versión, configuración y feature flags relevantes.

Una observación solo puede compararse con otra cuando el contrato de baseline permite esa comparabilidad. No se mezclan candidatos, sedes, cohortes, canales, dispositivos o ventanas incompatibles para fabricar una conclusión agregada.

---

#### 6. Resultados documentales materializados

Para cada `package_id` quedan materializados cinco resultados consumibles sin crear un espacio nuevo de identificadores:

1. perfil de adopción — señales y reglas para demostrar uso efectivo del TO-BE;
2. perfil de tiempos operativos — descomposición y comparación de tiempos humanos y de ciclo;
3. perfil de desviaciones operativas — contraste entre recorrido esperado y recorrido observado;
4. manifiesto de evidencia operativa — campos mínimos, calidad, comparabilidad y referencias de evidencia;
5. handoff operativo — destino obligatorio de cada hallazgo fuera de la propiedad de 004.

Ninguno de estos resultados instala telemetría, ejecuta consultas productivas, captura actividad real ni certifica cumplimiento.

---

#### 7. Contrato de adopción

##### 7.1. Qué constituye evidencia de adopción

La adopción se demostrará con **uso efectivo y resultado**, no con presencia técnica. Según el proceso y la evidencia ya aprobados, podrán formar parte del perfil:

- oportunidades operativas elegibles dentro del alcance autorizado;
- inicio o toma de trabajo TO-BE cuando el inicio tenga identidad empresarial;
- finalización confirmada o avance gobernado de la etapa aplicable;
- resultado empresarial observado y correlacionado;
- utilización de la superficie, estación, canal o modalidad aprobados cuando esa dimensión sea material;
- abandono, cancelación o reinicio;
- reintentos humanos;
- ayuda o asistencia requerida;
- retorno a un método anterior o a un workaround;
- utilización de contingencia o modo degradado aprobado;
- bloqueos que impiden continuar el recorrido TO-BE;
- uso repetido de ayudas, retrocesos, acciones equivocadas o términos reportados cuando las señales aplicables existan.

Una razón de adopción solo podrá calcularse cuando el **universo elegible y su unidad natural** estén definidos por el proceso y la línea base. El numerador y el denominador deberán compartir alcance, cohorte, ventana y regla de deduplicación. Usuarios registrados, sesiones, pageviews, requests HTTP o filas de base de datos no sustituyen automáticamente oportunidades empresariales.

##### 7.2. Estados interpretativos de la evidencia de adopción

004 no crea un nuevo estado global de negocio. Para interpretar evidencia durante `SHELL-CI-023` se utilizarán las siguientes condiciones documentales:

| Condición                                 | Interpretación                                                             |
| ----------------------------------------- | -------------------------------------------------------------------------- |
| uso TO-BE con resultado correlacionado    | evidencia positiva de adopción para el alcance observado                   |
| inicio sin resultado confirmado           | evidencia incompleta; no cuenta como finalización                          |
| abandono o reinicio                       | señal de fricción que debe conservarse y contextualizarse                  |
| ayuda o asistencia                        | señal de dependencia humana; no es falla automática                        |
| método legacy o workaround no autorizado  | desviación candidata de 004                                                |
| contingencia aprobada                     | uso gobernado; no se clasifica como desviación por sí solo                 |
| sin oportunidad operacional en la ventana | volumen insuficiente o no aplicabilidad temporal; no se reemplaza por cero |
| sin señal o telemetría suficiente         | `PENDIENTE_DE_EVIDENCIA` o `BLOQUEADO` según el contrato aplicable         |

##### 7.3. Protección contra vigilancia individual

Las señales se agregan al nivel mínimo necesario para operar y estabilizar el proceso: paquete, proceso, cohorte, sede, área, turno, categoría funcional, dispositivo o ventana cuando corresponda. 004 no autoriza rankings personales, tiempos individuales de productividad, inferencias disciplinarias ni captura de contenido sensible. La identificación de un actor solo se conserva cuando sea necesaria para trazabilidad, autorización, auditoría o investigación de un caso concreto ya gobernado.

---

#### 8. Contrato de tiempos operativos

##### 8.1. Separación obligatoria

El tiempo operacional deberá distinguir, cuando el proceso lo permita:

| Componente                         | Semántica                                                                                                                                      |
| ---------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| tiempo activo de trabajo           | intervalo en el que la persona ejecuta acciones necesarias del proceso                                                                         |
| espera de dependencia              | tiempo esperando insumo, aprobación, cliente, producción, transporte, integración, periférico, sincronización u otra dependencia identificable |
| tiempo bloqueado                   | intervalo durante el cual el siguiente paso no puede ejecutarse por un bloqueo material                                                        |
| tiempo de ayuda                    | tiempo adicional asociado a orientación o asistencia para continuar                                                                            |
| tiempo de reintento o recuperación | tiempo utilizado para repetir de forma gobernada, recuperar contexto o reanudar trabajo                                                        |
| tiempo total de etapa o ciclo      | intervalo empresarial completo entre los hitos aprobados del proceso                                                                           |

No todos los procesos requieren todos los componentes. El perfil homónimo determina aplicabilidad sin fabricar hitos.

##### 8.2. Precedencia de baseline y umbral

La comparación de tiempos usa, en este orden:

1. baseline congelado y comparable de `READY-GATE-013`;
2. umbral o presupuesto aplicable de `DELIV-PKG-013`;
3. criterio de aceptación de `DELIV-PKG-023`;
4. señal y definición de `DELIV-PKG-017`;
5. evidencia de piloto comparable de `DELIV-PKG-022/023` cuando el contrato permita reutilizarla.

Si una medición exige un umbral que ninguna fuente autorizada define, 004 no inventa minutos, percentiles, porcentajes, tolerancias ni tamaños de muestra. El elemento queda `PENDIENTE_DE_EVIDENCIA` o `BLOQUEADO` según corresponda y conserva la fuente responsable.

##### 8.3. Frontera con rendimiento técnico

Latencia de API, tiempo de query, job, retry técnico, cola, red, integración, render o dependencia pertenecen a 003. 004 puede correlacionar una demora humana con esas señales para explicar contexto, pero no redefine su SLI ni su umbral.

Una mejora de tiempo tampoco constituye éxito automático: reducir duración saltando controles, omitiendo datos, cerrando antes del resultado o trasladando trabajo a un canal no gobernado es una desviación, no una mejora.

##### 8.4. Duración de piloto e hypercare

`DUR-DIR-001` de `DELIV-PKG-022` —14 días calendario activos y al menos un ciclo operativo completo aplicable— define exposición mínima del **piloto directo** y no es un objetivo de tiempo de tarea ni una duración universal de hypercare. La duración de hypercare continúa gobernada por `HYPERCARE-OPS-001` mediante evidencia y obligaciones pendientes.

---

#### 9. Contrato de desviaciones operativas

##### 9.1. Definición

Existe una desviación operativa candidata cuando la evidencia muestra que el trabajo observado se aparta materialmente del proceso, secuencia, actor, contexto, canal, handoff, control, modalidad o condición de salida aprobados para la misma instancia.

004 registra la diferencia; no decide todavía si la causa es defecto, incidente, capacitación, diseño, dato, integración, deuda o riesgo aceptable.

##### 9.2. Familias de observación

Las siguientes familias sirven para clasificar la **forma de la desviación observada** dentro de 004; no son severidades de incidente ni estados globales:

- uso de método legacy después de que el alcance exige TO-BE y sin contingencia autorizada;
- workaround manual no aprobado;
- omisión de etapa, dato, control, aprobación o evidencia obligatoria;
- ejecución fuera de la secuencia o condición permitida;
- handoff omitido, repetido, tardío o enviado al destino incorrecto;
- uso de canal, superficie, sede, área, dispositivo o modalidad no autorizados para ese paso;
- retroceso o repetición sistemática no prevista por el recorrido;
- abandono y reinicio que ocultan trabajo no completado;
- dependencia recurrente de ayuda técnica o coordinación para una acción que debía ser ordinaria;
- espera o bloqueo persistentes fuera de la referencia aplicable;
- trabajo paralelo en hojas, chats, documentos o copias no gobernadas que compita con la fuente autorizada;
- diferencia entre la variante configurada y la variante realmente ejecutada;
- retorno no gobernado al método anterior;
- cualquier otro recorrido demostrablemente incompatible con el contrato aprobado del proceso.

No se considera desviación por sí sola:

- una variante explícitamente aprobada para la sede, canal, dispositivo o contexto;
- un modo degradado o contingencia activado conforme a su contrato;
- una pausa o suspensión autorizada;
- una asistencia prevista por el plan de capacitación o soporte;
- una excepción documentada y aprobada por su autoridad;
- bajo volumen sin oportunidad suficiente para observar el proceso.

##### 9.3. Evidencia mínima de una desviación

Cada desviación candidata deberá conservar, cuando aplique:

- `package_id` e instancia de hypercare;
- candidato, ambiente y alcance autorizado;
- proceso, etapa, tarea o handoff afectado;
- cohorte, sede, área, turno o modalidad necesarios para interpretar el caso;
- recorrido esperado y referencia contractual;
- recorrido observado;
- ventana y momento de observación;
- frecuencia, conteo o recurrencia solo cuando la fuente permita medirla;
- baseline o criterio de comparación aplicable;
- evidencia reproducible o referencia segura;
- limitaciones de calidad o comparabilidad;
- propietario funcional y autoridad técnica heredados de 002;
- destino documental del hallazgo.

---

#### 10. Calidad, comparabilidad y evidencia insuficiente

La ausencia de una señal no puede interpretarse como buen comportamiento. Durante la ejecución futura:

1. **cero eventos con fuente saludable y universo esperado conocido** puede constituir un valor observado;
2. **cero eventos con instrumentación no demostrada** constituye evidencia insuficiente;
3. una muestra pequeña no se extrapola a toda la cohorte sin regla aprobada;
4. una ventana sin oportunidades operativas no demuestra adopción ni falta de adopción;
5. un agregado que oculta una sede, turno, canal o cohorte materialmente distinta no es comparable;
6. cambios de candidato, contrato, autorización, datos o cohorte se tratan conforme a 001/022/023 y no se mezclan con la ventana anterior;
7. duplicados, reintentos, anulaciones, compensaciones, periodos incompletos y cambios de zona horaria se tratan conforme al contrato de medición aplicable;
8. entrevistas u opiniones pueden explicar contexto, pero no sustituyen un hecho medido cuando el criterio exige evidencia operacional;
9. soporte o capacitación reportados sin vínculo a la instancia observada no demuestran causa;
10. el expediente conserva siempre fecha de corte, ambiente, versión, población, limitación y fuente.

La captura real de estos datos pertenece a `SHELL-CI-023`; esta tarea solo deja definido el contrato.

---

#### 11. Estados documentales del monitoreo

La materialización de 004 utiliza únicamente estos estados de evidencia:

| Estado                   | Uso dentro de 004                                                                                 |
| ------------------------ | ------------------------------------------------------------------------------------------------- |
| `ESPECIFICADO`           | el perfil documental existe para la identidad, pero no afirma ejecución                           |
| `PENDIENTE_DE_EVIDENCIA` | existe oportunidad de evaluación, pero aún no hay evidencia suficiente                            |
| `BLOQUEADO`              | una condición concreta impide observar o decidir y existe propietario/condición de salida         |
| `NO_APLICA`              | la dimensión no aplica a la instancia y la fuente canónica lo demuestra                           |
| `VALIDADO`               | solo la ejecución futura produjo evidencia suficiente y reproducible para la conclusión aplicable |

La aprobación documental de 004 deja las 207 filas en `ESPECIFICADO`. No convierte AURA, dependencias externas o TALENTO en ejecutables ni cambia sus bloqueos heredados.

---

#### 12. Handoff obligatorio de hallazgos

Todo hallazgo debe conservar destino explícito:

| Hallazgo observado por 004                                                       | Destino propietario                                |
| -------------------------------------------------------------------------------- | -------------------------------------------------- |
| divergencia de datos, documento, saldo o efecto entre dominios                   | `HYPERCARE-OPS-005`                                |
| falla, defecto o comportamiento que requiere clasificación/prioridad/corrección  | `HYPERCARE-OPS-006`                                |
| trabajo posterior aceptable que no impide el alcance actual                      | `HYPERCARE-OPS-007`                                |
| dependencia recurrente de soporte, guía o documentación para operación ordinaria | `HYPERCARE-OPS-008`                                |
| uso recurrente de contingencia temporal o imposibilidad de retirarla             | `HYPERCARE-OPS-009`                                |
| evidencia consolidada para cierre funcional, técnico y operativo                 | `HYPERCARE-OPS-010` y `SHELL-CI-024::<package_id>` |

Si el hallazgo demuestra un defecto o regresión real que deba quedar protegido por una prueba, la creación del requisito correspondiente se realiza conforme al protocolo a partir de la evidencia real y la tarea propietaria que clasifique/corrija el defecto. 004 no inventa hoy requisitos para fallos futuros no observados.

---

#### 13. Matriz materializada por las 207 raíces

Cada fila conserva la identidad, la responsabilidad y la aplicabilidad de sus fuentes homónimas. La columna `Estado 004` certifica únicamente que el contrato documental de monitoreo quedó definido para esa identidad.

| `package_id`  | Identidad temporal               | Responsabilidad                  | Contexto técnico                 | Baseline y aceptación                                        | Adopción                                                                                 | Tiempo operativo                                                                                     | Desviación                                                                                           | Estado 004     |
| ------------- | -------------------------------- | -------------------------------- | -------------------------------- | ------------------------------------------------------------ | ---------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- | -------------- |
| `GAP-PKG-001` | `HYPERCARE-OPS-001::GAP-PKG-001` | `HYPERCARE-OPS-002::GAP-PKG-001` | `HYPERCARE-OPS-003::GAP-PKG-001` | `READY-GATE-013::GAP-PKG-001` + `DELIV-PKG-023::GAP-PKG-001` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-002` | `HYPERCARE-OPS-001::GAP-PKG-002` | `HYPERCARE-OPS-002::GAP-PKG-002` | `HYPERCARE-OPS-003::GAP-PKG-002` | `READY-GATE-013::GAP-PKG-002` + `DELIV-PKG-023::GAP-PKG-002` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-003` | `HYPERCARE-OPS-001::GAP-PKG-003` | `HYPERCARE-OPS-002::GAP-PKG-003` | `HYPERCARE-OPS-003::GAP-PKG-003` | `READY-GATE-013::GAP-PKG-003` + `DELIV-PKG-023::GAP-PKG-003` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-004` | `HYPERCARE-OPS-001::GAP-PKG-004` | `HYPERCARE-OPS-002::GAP-PKG-004` | `HYPERCARE-OPS-003::GAP-PKG-004` | `READY-GATE-013::GAP-PKG-004` + `DELIV-PKG-023::GAP-PKG-004` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-005` | `HYPERCARE-OPS-001::GAP-PKG-005` | `HYPERCARE-OPS-002::GAP-PKG-005` | `HYPERCARE-OPS-003::GAP-PKG-005` | `READY-GATE-013::GAP-PKG-005` + `DELIV-PKG-023::GAP-PKG-005` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-006` | `HYPERCARE-OPS-001::GAP-PKG-006` | `HYPERCARE-OPS-002::GAP-PKG-006` | `HYPERCARE-OPS-003::GAP-PKG-006` | `READY-GATE-013::GAP-PKG-006` + `DELIV-PKG-023::GAP-PKG-006` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-007` | `HYPERCARE-OPS-001::GAP-PKG-007` | `HYPERCARE-OPS-002::GAP-PKG-007` | `HYPERCARE-OPS-003::GAP-PKG-007` | `READY-GATE-013::GAP-PKG-007` + `DELIV-PKG-023::GAP-PKG-007` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-008` | `HYPERCARE-OPS-001::GAP-PKG-008` | `HYPERCARE-OPS-002::GAP-PKG-008` | `HYPERCARE-OPS-003::GAP-PKG-008` | `READY-GATE-013::GAP-PKG-008` + `DELIV-PKG-023::GAP-PKG-008` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-009` | `HYPERCARE-OPS-001::GAP-PKG-009` | `HYPERCARE-OPS-002::GAP-PKG-009` | `HYPERCARE-OPS-003::GAP-PKG-009` | `READY-GATE-013::GAP-PKG-009` + `DELIV-PKG-023::GAP-PKG-009` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-010` | `HYPERCARE-OPS-001::GAP-PKG-010` | `HYPERCARE-OPS-002::GAP-PKG-010` | `HYPERCARE-OPS-003::GAP-PKG-010` | `READY-GATE-013::GAP-PKG-010` + `DELIV-PKG-023::GAP-PKG-010` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-011` | `HYPERCARE-OPS-001::GAP-PKG-011` | `HYPERCARE-OPS-002::GAP-PKG-011` | `HYPERCARE-OPS-003::GAP-PKG-011` | `READY-GATE-013::GAP-PKG-011` + `DELIV-PKG-023::GAP-PKG-011` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-012` | `HYPERCARE-OPS-001::GAP-PKG-012` | `HYPERCARE-OPS-002::GAP-PKG-012` | `HYPERCARE-OPS-003::GAP-PKG-012` | `READY-GATE-013::GAP-PKG-012` + `DELIV-PKG-023::GAP-PKG-012` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-013` | `HYPERCARE-OPS-001::GAP-PKG-013` | `HYPERCARE-OPS-002::GAP-PKG-013` | `HYPERCARE-OPS-003::GAP-PKG-013` | `READY-GATE-013::GAP-PKG-013` + `DELIV-PKG-023::GAP-PKG-013` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-014` | `HYPERCARE-OPS-001::GAP-PKG-014` | `HYPERCARE-OPS-002::GAP-PKG-014` | `HYPERCARE-OPS-003::GAP-PKG-014` | `READY-GATE-013::GAP-PKG-014` + `DELIV-PKG-023::GAP-PKG-014` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-015` | `HYPERCARE-OPS-001::GAP-PKG-015` | `HYPERCARE-OPS-002::GAP-PKG-015` | `HYPERCARE-OPS-003::GAP-PKG-015` | `READY-GATE-013::GAP-PKG-015` + `DELIV-PKG-023::GAP-PKG-015` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-016` | `HYPERCARE-OPS-001::GAP-PKG-016` | `HYPERCARE-OPS-002::GAP-PKG-016` | `HYPERCARE-OPS-003::GAP-PKG-016` | `READY-GATE-013::GAP-PKG-016` + `DELIV-PKG-023::GAP-PKG-016` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-017` | `HYPERCARE-OPS-001::GAP-PKG-017` | `HYPERCARE-OPS-002::GAP-PKG-017` | `HYPERCARE-OPS-003::GAP-PKG-017` | `READY-GATE-013::GAP-PKG-017` + `DELIV-PKG-023::GAP-PKG-017` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-018` | `HYPERCARE-OPS-001::GAP-PKG-018` | `HYPERCARE-OPS-002::GAP-PKG-018` | `HYPERCARE-OPS-003::GAP-PKG-018` | `READY-GATE-013::GAP-PKG-018` + `DELIV-PKG-023::GAP-PKG-018` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-019` | `HYPERCARE-OPS-001::GAP-PKG-019` | `HYPERCARE-OPS-002::GAP-PKG-019` | `HYPERCARE-OPS-003::GAP-PKG-019` | `READY-GATE-013::GAP-PKG-019` + `DELIV-PKG-023::GAP-PKG-019` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-020` | `HYPERCARE-OPS-001::GAP-PKG-020` | `HYPERCARE-OPS-002::GAP-PKG-020` | `HYPERCARE-OPS-003::GAP-PKG-020` | `READY-GATE-013::GAP-PKG-020` + `DELIV-PKG-023::GAP-PKG-020` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-021` | `HYPERCARE-OPS-001::GAP-PKG-021` | `HYPERCARE-OPS-002::GAP-PKG-021` | `HYPERCARE-OPS-003::GAP-PKG-021` | `READY-GATE-013::GAP-PKG-021` + `DELIV-PKG-023::GAP-PKG-021` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-022` | `HYPERCARE-OPS-001::GAP-PKG-022` | `HYPERCARE-OPS-002::GAP-PKG-022` | `HYPERCARE-OPS-003::GAP-PKG-022` | `READY-GATE-013::GAP-PKG-022` + `DELIV-PKG-023::GAP-PKG-022` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-023` | `HYPERCARE-OPS-001::GAP-PKG-023` | `HYPERCARE-OPS-002::GAP-PKG-023` | `HYPERCARE-OPS-003::GAP-PKG-023` | `READY-GATE-013::GAP-PKG-023` + `DELIV-PKG-023::GAP-PKG-023` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-024` | `HYPERCARE-OPS-001::GAP-PKG-024` | `HYPERCARE-OPS-002::GAP-PKG-024` | `HYPERCARE-OPS-003::GAP-PKG-024` | `READY-GATE-013::GAP-PKG-024` + `DELIV-PKG-023::GAP-PKG-024` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-025` | `HYPERCARE-OPS-001::GAP-PKG-025` | `HYPERCARE-OPS-002::GAP-PKG-025` | `HYPERCARE-OPS-003::GAP-PKG-025` | `READY-GATE-013::GAP-PKG-025` + `DELIV-PKG-023::GAP-PKG-025` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-026` | `HYPERCARE-OPS-001::GAP-PKG-026` | `HYPERCARE-OPS-002::GAP-PKG-026` | `HYPERCARE-OPS-003::GAP-PKG-026` | `READY-GATE-013::GAP-PKG-026` + `DELIV-PKG-023::GAP-PKG-026` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-027` | `HYPERCARE-OPS-001::GAP-PKG-027` | `HYPERCARE-OPS-002::GAP-PKG-027` | `HYPERCARE-OPS-003::GAP-PKG-027` | `READY-GATE-013::GAP-PKG-027` + `DELIV-PKG-023::GAP-PKG-027` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-028` | `HYPERCARE-OPS-001::GAP-PKG-028` | `HYPERCARE-OPS-002::GAP-PKG-028` | `HYPERCARE-OPS-003::GAP-PKG-028` | `READY-GATE-013::GAP-PKG-028` + `DELIV-PKG-023::GAP-PKG-028` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-029` | `HYPERCARE-OPS-001::GAP-PKG-029` | `HYPERCARE-OPS-002::GAP-PKG-029` | `HYPERCARE-OPS-003::GAP-PKG-029` | `READY-GATE-013::GAP-PKG-029` + `DELIV-PKG-023::GAP-PKG-029` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-030` | `HYPERCARE-OPS-001::GAP-PKG-030` | `HYPERCARE-OPS-002::GAP-PKG-030` | `HYPERCARE-OPS-003::GAP-PKG-030` | `READY-GATE-013::GAP-PKG-030` + `DELIV-PKG-023::GAP-PKG-030` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-031` | `HYPERCARE-OPS-001::GAP-PKG-031` | `HYPERCARE-OPS-002::GAP-PKG-031` | `HYPERCARE-OPS-003::GAP-PKG-031` | `READY-GATE-013::GAP-PKG-031` + `DELIV-PKG-023::GAP-PKG-031` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-032` | `HYPERCARE-OPS-001::GAP-PKG-032` | `HYPERCARE-OPS-002::GAP-PKG-032` | `HYPERCARE-OPS-003::GAP-PKG-032` | `READY-GATE-013::GAP-PKG-032` + `DELIV-PKG-023::GAP-PKG-032` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-033` | `HYPERCARE-OPS-001::GAP-PKG-033` | `HYPERCARE-OPS-002::GAP-PKG-033` | `HYPERCARE-OPS-003::GAP-PKG-033` | `READY-GATE-013::GAP-PKG-033` + `DELIV-PKG-023::GAP-PKG-033` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-034` | `HYPERCARE-OPS-001::GAP-PKG-034` | `HYPERCARE-OPS-002::GAP-PKG-034` | `HYPERCARE-OPS-003::GAP-PKG-034` | `READY-GATE-013::GAP-PKG-034` + `DELIV-PKG-023::GAP-PKG-034` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-035` | `HYPERCARE-OPS-001::GAP-PKG-035` | `HYPERCARE-OPS-002::GAP-PKG-035` | `HYPERCARE-OPS-003::GAP-PKG-035` | `READY-GATE-013::GAP-PKG-035` + `DELIV-PKG-023::GAP-PKG-035` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-036` | `HYPERCARE-OPS-001::GAP-PKG-036` | `HYPERCARE-OPS-002::GAP-PKG-036` | `HYPERCARE-OPS-003::GAP-PKG-036` | `READY-GATE-013::GAP-PKG-036` + `DELIV-PKG-023::GAP-PKG-036` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-037` | `HYPERCARE-OPS-001::GAP-PKG-037` | `HYPERCARE-OPS-002::GAP-PKG-037` | `HYPERCARE-OPS-003::GAP-PKG-037` | `READY-GATE-013::GAP-PKG-037` + `DELIV-PKG-023::GAP-PKG-037` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-038` | `HYPERCARE-OPS-001::GAP-PKG-038` | `HYPERCARE-OPS-002::GAP-PKG-038` | `HYPERCARE-OPS-003::GAP-PKG-038` | `READY-GATE-013::GAP-PKG-038` + `DELIV-PKG-023::GAP-PKG-038` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-039` | `HYPERCARE-OPS-001::GAP-PKG-039` | `HYPERCARE-OPS-002::GAP-PKG-039` | `HYPERCARE-OPS-003::GAP-PKG-039` | `READY-GATE-013::GAP-PKG-039` + `DELIV-PKG-023::GAP-PKG-039` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-040` | `HYPERCARE-OPS-001::GAP-PKG-040` | `HYPERCARE-OPS-002::GAP-PKG-040` | `HYPERCARE-OPS-003::GAP-PKG-040` | `READY-GATE-013::GAP-PKG-040` + `DELIV-PKG-023::GAP-PKG-040` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-041` | `HYPERCARE-OPS-001::GAP-PKG-041` | `HYPERCARE-OPS-002::GAP-PKG-041` | `HYPERCARE-OPS-003::GAP-PKG-041` | `READY-GATE-013::GAP-PKG-041` + `DELIV-PKG-023::GAP-PKG-041` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-042` | `HYPERCARE-OPS-001::GAP-PKG-042` | `HYPERCARE-OPS-002::GAP-PKG-042` | `HYPERCARE-OPS-003::GAP-PKG-042` | `READY-GATE-013::GAP-PKG-042` + `DELIV-PKG-023::GAP-PKG-042` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-043` | `HYPERCARE-OPS-001::GAP-PKG-043` | `HYPERCARE-OPS-002::GAP-PKG-043` | `HYPERCARE-OPS-003::GAP-PKG-043` | `READY-GATE-013::GAP-PKG-043` + `DELIV-PKG-023::GAP-PKG-043` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-044` | `HYPERCARE-OPS-001::GAP-PKG-044` | `HYPERCARE-OPS-002::GAP-PKG-044` | `HYPERCARE-OPS-003::GAP-PKG-044` | `READY-GATE-013::GAP-PKG-044` + `DELIV-PKG-023::GAP-PKG-044` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-045` | `HYPERCARE-OPS-001::GAP-PKG-045` | `HYPERCARE-OPS-002::GAP-PKG-045` | `HYPERCARE-OPS-003::GAP-PKG-045` | `READY-GATE-013::GAP-PKG-045` + `DELIV-PKG-023::GAP-PKG-045` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-046` | `HYPERCARE-OPS-001::GAP-PKG-046` | `HYPERCARE-OPS-002::GAP-PKG-046` | `HYPERCARE-OPS-003::GAP-PKG-046` | `READY-GATE-013::GAP-PKG-046` + `DELIV-PKG-023::GAP-PKG-046` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-047` | `HYPERCARE-OPS-001::GAP-PKG-047` | `HYPERCARE-OPS-002::GAP-PKG-047` | `HYPERCARE-OPS-003::GAP-PKG-047` | `READY-GATE-013::GAP-PKG-047` + `DELIV-PKG-023::GAP-PKG-047` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-048` | `HYPERCARE-OPS-001::GAP-PKG-048` | `HYPERCARE-OPS-002::GAP-PKG-048` | `HYPERCARE-OPS-003::GAP-PKG-048` | `READY-GATE-013::GAP-PKG-048` + `DELIV-PKG-023::GAP-PKG-048` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-049` | `HYPERCARE-OPS-001::GAP-PKG-049` | `HYPERCARE-OPS-002::GAP-PKG-049` | `HYPERCARE-OPS-003::GAP-PKG-049` | `READY-GATE-013::GAP-PKG-049` + `DELIV-PKG-023::GAP-PKG-049` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-050` | `HYPERCARE-OPS-001::GAP-PKG-050` | `HYPERCARE-OPS-002::GAP-PKG-050` | `HYPERCARE-OPS-003::GAP-PKG-050` | `READY-GATE-013::GAP-PKG-050` + `DELIV-PKG-023::GAP-PKG-050` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-051` | `HYPERCARE-OPS-001::GAP-PKG-051` | `HYPERCARE-OPS-002::GAP-PKG-051` | `HYPERCARE-OPS-003::GAP-PKG-051` | `READY-GATE-013::GAP-PKG-051` + `DELIV-PKG-023::GAP-PKG-051` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-052` | `HYPERCARE-OPS-001::GAP-PKG-052` | `HYPERCARE-OPS-002::GAP-PKG-052` | `HYPERCARE-OPS-003::GAP-PKG-052` | `READY-GATE-013::GAP-PKG-052` + `DELIV-PKG-023::GAP-PKG-052` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-053` | `HYPERCARE-OPS-001::GAP-PKG-053` | `HYPERCARE-OPS-002::GAP-PKG-053` | `HYPERCARE-OPS-003::GAP-PKG-053` | `READY-GATE-013::GAP-PKG-053` + `DELIV-PKG-023::GAP-PKG-053` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-054` | `HYPERCARE-OPS-001::GAP-PKG-054` | `HYPERCARE-OPS-002::GAP-PKG-054` | `HYPERCARE-OPS-003::GAP-PKG-054` | `READY-GATE-013::GAP-PKG-054` + `DELIV-PKG-023::GAP-PKG-054` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-055` | `HYPERCARE-OPS-001::GAP-PKG-055` | `HYPERCARE-OPS-002::GAP-PKG-055` | `HYPERCARE-OPS-003::GAP-PKG-055` | `READY-GATE-013::GAP-PKG-055` + `DELIV-PKG-023::GAP-PKG-055` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-056` | `HYPERCARE-OPS-001::GAP-PKG-056` | `HYPERCARE-OPS-002::GAP-PKG-056` | `HYPERCARE-OPS-003::GAP-PKG-056` | `READY-GATE-013::GAP-PKG-056` + `DELIV-PKG-023::GAP-PKG-056` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-057` | `HYPERCARE-OPS-001::GAP-PKG-057` | `HYPERCARE-OPS-002::GAP-PKG-057` | `HYPERCARE-OPS-003::GAP-PKG-057` | `READY-GATE-013::GAP-PKG-057` + `DELIV-PKG-023::GAP-PKG-057` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-058` | `HYPERCARE-OPS-001::GAP-PKG-058` | `HYPERCARE-OPS-002::GAP-PKG-058` | `HYPERCARE-OPS-003::GAP-PKG-058` | `READY-GATE-013::GAP-PKG-058` + `DELIV-PKG-023::GAP-PKG-058` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-059` | `HYPERCARE-OPS-001::GAP-PKG-059` | `HYPERCARE-OPS-002::GAP-PKG-059` | `HYPERCARE-OPS-003::GAP-PKG-059` | `READY-GATE-013::GAP-PKG-059` + `DELIV-PKG-023::GAP-PKG-059` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-060` | `HYPERCARE-OPS-001::GAP-PKG-060` | `HYPERCARE-OPS-002::GAP-PKG-060` | `HYPERCARE-OPS-003::GAP-PKG-060` | `READY-GATE-013::GAP-PKG-060` + `DELIV-PKG-023::GAP-PKG-060` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-061` | `HYPERCARE-OPS-001::GAP-PKG-061` | `HYPERCARE-OPS-002::GAP-PKG-061` | `HYPERCARE-OPS-003::GAP-PKG-061` | `READY-GATE-013::GAP-PKG-061` + `DELIV-PKG-023::GAP-PKG-061` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-062` | `HYPERCARE-OPS-001::GAP-PKG-062` | `HYPERCARE-OPS-002::GAP-PKG-062` | `HYPERCARE-OPS-003::GAP-PKG-062` | `READY-GATE-013::GAP-PKG-062` + `DELIV-PKG-023::GAP-PKG-062` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-063` | `HYPERCARE-OPS-001::GAP-PKG-063` | `HYPERCARE-OPS-002::GAP-PKG-063` | `HYPERCARE-OPS-003::GAP-PKG-063` | `READY-GATE-013::GAP-PKG-063` + `DELIV-PKG-023::GAP-PKG-063` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-064` | `HYPERCARE-OPS-001::GAP-PKG-064` | `HYPERCARE-OPS-002::GAP-PKG-064` | `HYPERCARE-OPS-003::GAP-PKG-064` | `READY-GATE-013::GAP-PKG-064` + `DELIV-PKG-023::GAP-PKG-064` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-065` | `HYPERCARE-OPS-001::GAP-PKG-065` | `HYPERCARE-OPS-002::GAP-PKG-065` | `HYPERCARE-OPS-003::GAP-PKG-065` | `READY-GATE-013::GAP-PKG-065` + `DELIV-PKG-023::GAP-PKG-065` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-066` | `HYPERCARE-OPS-001::GAP-PKG-066` | `HYPERCARE-OPS-002::GAP-PKG-066` | `HYPERCARE-OPS-003::GAP-PKG-066` | `READY-GATE-013::GAP-PKG-066` + `DELIV-PKG-023::GAP-PKG-066` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-067` | `HYPERCARE-OPS-001::GAP-PKG-067` | `HYPERCARE-OPS-002::GAP-PKG-067` | `HYPERCARE-OPS-003::GAP-PKG-067` | `READY-GATE-013::GAP-PKG-067` + `DELIV-PKG-023::GAP-PKG-067` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-068` | `HYPERCARE-OPS-001::GAP-PKG-068` | `HYPERCARE-OPS-002::GAP-PKG-068` | `HYPERCARE-OPS-003::GAP-PKG-068` | `READY-GATE-013::GAP-PKG-068` + `DELIV-PKG-023::GAP-PKG-068` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-069` | `HYPERCARE-OPS-001::GAP-PKG-069` | `HYPERCARE-OPS-002::GAP-PKG-069` | `HYPERCARE-OPS-003::GAP-PKG-069` | `READY-GATE-013::GAP-PKG-069` + `DELIV-PKG-023::GAP-PKG-069` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-070` | `HYPERCARE-OPS-001::GAP-PKG-070` | `HYPERCARE-OPS-002::GAP-PKG-070` | `HYPERCARE-OPS-003::GAP-PKG-070` | `READY-GATE-013::GAP-PKG-070` + `DELIV-PKG-023::GAP-PKG-070` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-071` | `HYPERCARE-OPS-001::GAP-PKG-071` | `HYPERCARE-OPS-002::GAP-PKG-071` | `HYPERCARE-OPS-003::GAP-PKG-071` | `READY-GATE-013::GAP-PKG-071` + `DELIV-PKG-023::GAP-PKG-071` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-072` | `HYPERCARE-OPS-001::GAP-PKG-072` | `HYPERCARE-OPS-002::GAP-PKG-072` | `HYPERCARE-OPS-003::GAP-PKG-072` | `READY-GATE-013::GAP-PKG-072` + `DELIV-PKG-023::GAP-PKG-072` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-073` | `HYPERCARE-OPS-001::GAP-PKG-073` | `HYPERCARE-OPS-002::GAP-PKG-073` | `HYPERCARE-OPS-003::GAP-PKG-073` | `READY-GATE-013::GAP-PKG-073` + `DELIV-PKG-023::GAP-PKG-073` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-074` | `HYPERCARE-OPS-001::GAP-PKG-074` | `HYPERCARE-OPS-002::GAP-PKG-074` | `HYPERCARE-OPS-003::GAP-PKG-074` | `READY-GATE-013::GAP-PKG-074` + `DELIV-PKG-023::GAP-PKG-074` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-075` | `HYPERCARE-OPS-001::GAP-PKG-075` | `HYPERCARE-OPS-002::GAP-PKG-075` | `HYPERCARE-OPS-003::GAP-PKG-075` | `READY-GATE-013::GAP-PKG-075` + `DELIV-PKG-023::GAP-PKG-075` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-076` | `HYPERCARE-OPS-001::GAP-PKG-076` | `HYPERCARE-OPS-002::GAP-PKG-076` | `HYPERCARE-OPS-003::GAP-PKG-076` | `READY-GATE-013::GAP-PKG-076` + `DELIV-PKG-023::GAP-PKG-076` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-077` | `HYPERCARE-OPS-001::GAP-PKG-077` | `HYPERCARE-OPS-002::GAP-PKG-077` | `HYPERCARE-OPS-003::GAP-PKG-077` | `READY-GATE-013::GAP-PKG-077` + `DELIV-PKG-023::GAP-PKG-077` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-078` | `HYPERCARE-OPS-001::GAP-PKG-078` | `HYPERCARE-OPS-002::GAP-PKG-078` | `HYPERCARE-OPS-003::GAP-PKG-078` | `READY-GATE-013::GAP-PKG-078` + `DELIV-PKG-023::GAP-PKG-078` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-079` | `HYPERCARE-OPS-001::GAP-PKG-079` | `HYPERCARE-OPS-002::GAP-PKG-079` | `HYPERCARE-OPS-003::GAP-PKG-079` | `READY-GATE-013::GAP-PKG-079` + `DELIV-PKG-023::GAP-PKG-079` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-080` | `HYPERCARE-OPS-001::GAP-PKG-080` | `HYPERCARE-OPS-002::GAP-PKG-080` | `HYPERCARE-OPS-003::GAP-PKG-080` | `READY-GATE-013::GAP-PKG-080` + `DELIV-PKG-023::GAP-PKG-080` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-081` | `HYPERCARE-OPS-001::GAP-PKG-081` | `HYPERCARE-OPS-002::GAP-PKG-081` | `HYPERCARE-OPS-003::GAP-PKG-081` | `READY-GATE-013::GAP-PKG-081` + `DELIV-PKG-023::GAP-PKG-081` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-082` | `HYPERCARE-OPS-001::GAP-PKG-082` | `HYPERCARE-OPS-002::GAP-PKG-082` | `HYPERCARE-OPS-003::GAP-PKG-082` | `READY-GATE-013::GAP-PKG-082` + `DELIV-PKG-023::GAP-PKG-082` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-083` | `HYPERCARE-OPS-001::GAP-PKG-083` | `HYPERCARE-OPS-002::GAP-PKG-083` | `HYPERCARE-OPS-003::GAP-PKG-083` | `READY-GATE-013::GAP-PKG-083` + `DELIV-PKG-023::GAP-PKG-083` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-084` | `HYPERCARE-OPS-001::GAP-PKG-084` | `HYPERCARE-OPS-002::GAP-PKG-084` | `HYPERCARE-OPS-003::GAP-PKG-084` | `READY-GATE-013::GAP-PKG-084` + `DELIV-PKG-023::GAP-PKG-084` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-085` | `HYPERCARE-OPS-001::GAP-PKG-085` | `HYPERCARE-OPS-002::GAP-PKG-085` | `HYPERCARE-OPS-003::GAP-PKG-085` | `READY-GATE-013::GAP-PKG-085` + `DELIV-PKG-023::GAP-PKG-085` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-086` | `HYPERCARE-OPS-001::GAP-PKG-086` | `HYPERCARE-OPS-002::GAP-PKG-086` | `HYPERCARE-OPS-003::GAP-PKG-086` | `READY-GATE-013::GAP-PKG-086` + `DELIV-PKG-023::GAP-PKG-086` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-087` | `HYPERCARE-OPS-001::GAP-PKG-087` | `HYPERCARE-OPS-002::GAP-PKG-087` | `HYPERCARE-OPS-003::GAP-PKG-087` | `READY-GATE-013::GAP-PKG-087` + `DELIV-PKG-023::GAP-PKG-087` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-088` | `HYPERCARE-OPS-001::GAP-PKG-088` | `HYPERCARE-OPS-002::GAP-PKG-088` | `HYPERCARE-OPS-003::GAP-PKG-088` | `READY-GATE-013::GAP-PKG-088` + `DELIV-PKG-023::GAP-PKG-088` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-089` | `HYPERCARE-OPS-001::GAP-PKG-089` | `HYPERCARE-OPS-002::GAP-PKG-089` | `HYPERCARE-OPS-003::GAP-PKG-089` | `READY-GATE-013::GAP-PKG-089` + `DELIV-PKG-023::GAP-PKG-089` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-090` | `HYPERCARE-OPS-001::GAP-PKG-090` | `HYPERCARE-OPS-002::GAP-PKG-090` | `HYPERCARE-OPS-003::GAP-PKG-090` | `READY-GATE-013::GAP-PKG-090` + `DELIV-PKG-023::GAP-PKG-090` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-091` | `HYPERCARE-OPS-001::GAP-PKG-091` | `HYPERCARE-OPS-002::GAP-PKG-091` | `HYPERCARE-OPS-003::GAP-PKG-091` | `READY-GATE-013::GAP-PKG-091` + `DELIV-PKG-023::GAP-PKG-091` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-092` | `HYPERCARE-OPS-001::GAP-PKG-092` | `HYPERCARE-OPS-002::GAP-PKG-092` | `HYPERCARE-OPS-003::GAP-PKG-092` | `READY-GATE-013::GAP-PKG-092` + `DELIV-PKG-023::GAP-PKG-092` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-093` | `HYPERCARE-OPS-001::GAP-PKG-093` | `HYPERCARE-OPS-002::GAP-PKG-093` | `HYPERCARE-OPS-003::GAP-PKG-093` | `READY-GATE-013::GAP-PKG-093` + `DELIV-PKG-023::GAP-PKG-093` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-094` | `HYPERCARE-OPS-001::GAP-PKG-094` | `HYPERCARE-OPS-002::GAP-PKG-094` | `HYPERCARE-OPS-003::GAP-PKG-094` | `READY-GATE-013::GAP-PKG-094` + `DELIV-PKG-023::GAP-PKG-094` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-095` | `HYPERCARE-OPS-001::GAP-PKG-095` | `HYPERCARE-OPS-002::GAP-PKG-095` | `HYPERCARE-OPS-003::GAP-PKG-095` | `READY-GATE-013::GAP-PKG-095` + `DELIV-PKG-023::GAP-PKG-095` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-096` | `HYPERCARE-OPS-001::GAP-PKG-096` | `HYPERCARE-OPS-002::GAP-PKG-096` | `HYPERCARE-OPS-003::GAP-PKG-096` | `READY-GATE-013::GAP-PKG-096` + `DELIV-PKG-023::GAP-PKG-096` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-097` | `HYPERCARE-OPS-001::GAP-PKG-097` | `HYPERCARE-OPS-002::GAP-PKG-097` | `HYPERCARE-OPS-003::GAP-PKG-097` | `READY-GATE-013::GAP-PKG-097` + `DELIV-PKG-023::GAP-PKG-097` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-098` | `HYPERCARE-OPS-001::GAP-PKG-098` | `HYPERCARE-OPS-002::GAP-PKG-098` | `HYPERCARE-OPS-003::GAP-PKG-098` | `READY-GATE-013::GAP-PKG-098` + `DELIV-PKG-023::GAP-PKG-098` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-099` | `HYPERCARE-OPS-001::GAP-PKG-099` | `HYPERCARE-OPS-002::GAP-PKG-099` | `HYPERCARE-OPS-003::GAP-PKG-099` | `READY-GATE-013::GAP-PKG-099` + `DELIV-PKG-023::GAP-PKG-099` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-100` | `HYPERCARE-OPS-001::GAP-PKG-100` | `HYPERCARE-OPS-002::GAP-PKG-100` | `HYPERCARE-OPS-003::GAP-PKG-100` | `READY-GATE-013::GAP-PKG-100` + `DELIV-PKG-023::GAP-PKG-100` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-101` | `HYPERCARE-OPS-001::GAP-PKG-101` | `HYPERCARE-OPS-002::GAP-PKG-101` | `HYPERCARE-OPS-003::GAP-PKG-101` | `READY-GATE-013::GAP-PKG-101` + `DELIV-PKG-023::GAP-PKG-101` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-102` | `HYPERCARE-OPS-001::GAP-PKG-102` | `HYPERCARE-OPS-002::GAP-PKG-102` | `HYPERCARE-OPS-003::GAP-PKG-102` | `READY-GATE-013::GAP-PKG-102` + `DELIV-PKG-023::GAP-PKG-102` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-103` | `HYPERCARE-OPS-001::GAP-PKG-103` | `HYPERCARE-OPS-002::GAP-PKG-103` | `HYPERCARE-OPS-003::GAP-PKG-103` | `READY-GATE-013::GAP-PKG-103` + `DELIV-PKG-023::GAP-PKG-103` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-104` | `HYPERCARE-OPS-001::GAP-PKG-104` | `HYPERCARE-OPS-002::GAP-PKG-104` | `HYPERCARE-OPS-003::GAP-PKG-104` | `READY-GATE-013::GAP-PKG-104` + `DELIV-PKG-023::GAP-PKG-104` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-105` | `HYPERCARE-OPS-001::GAP-PKG-105` | `HYPERCARE-OPS-002::GAP-PKG-105` | `HYPERCARE-OPS-003::GAP-PKG-105` | `READY-GATE-013::GAP-PKG-105` + `DELIV-PKG-023::GAP-PKG-105` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-106` | `HYPERCARE-OPS-001::GAP-PKG-106` | `HYPERCARE-OPS-002::GAP-PKG-106` | `HYPERCARE-OPS-003::GAP-PKG-106` | `READY-GATE-013::GAP-PKG-106` + `DELIV-PKG-023::GAP-PKG-106` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-107` | `HYPERCARE-OPS-001::GAP-PKG-107` | `HYPERCARE-OPS-002::GAP-PKG-107` | `HYPERCARE-OPS-003::GAP-PKG-107` | `READY-GATE-013::GAP-PKG-107` + `DELIV-PKG-023::GAP-PKG-107` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-108` | `HYPERCARE-OPS-001::GAP-PKG-108` | `HYPERCARE-OPS-002::GAP-PKG-108` | `HYPERCARE-OPS-003::GAP-PKG-108` | `READY-GATE-013::GAP-PKG-108` + `DELIV-PKG-023::GAP-PKG-108` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-109` | `HYPERCARE-OPS-001::GAP-PKG-109` | `HYPERCARE-OPS-002::GAP-PKG-109` | `HYPERCARE-OPS-003::GAP-PKG-109` | `READY-GATE-013::GAP-PKG-109` + `DELIV-PKG-023::GAP-PKG-109` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-110` | `HYPERCARE-OPS-001::GAP-PKG-110` | `HYPERCARE-OPS-002::GAP-PKG-110` | `HYPERCARE-OPS-003::GAP-PKG-110` | `READY-GATE-013::GAP-PKG-110` + `DELIV-PKG-023::GAP-PKG-110` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-111` | `HYPERCARE-OPS-001::GAP-PKG-111` | `HYPERCARE-OPS-002::GAP-PKG-111` | `HYPERCARE-OPS-003::GAP-PKG-111` | `READY-GATE-013::GAP-PKG-111` + `DELIV-PKG-023::GAP-PKG-111` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-112` | `HYPERCARE-OPS-001::GAP-PKG-112` | `HYPERCARE-OPS-002::GAP-PKG-112` | `HYPERCARE-OPS-003::GAP-PKG-112` | `READY-GATE-013::GAP-PKG-112` + `DELIV-PKG-023::GAP-PKG-112` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-113` | `HYPERCARE-OPS-001::GAP-PKG-113` | `HYPERCARE-OPS-002::GAP-PKG-113` | `HYPERCARE-OPS-003::GAP-PKG-113` | `READY-GATE-013::GAP-PKG-113` + `DELIV-PKG-023::GAP-PKG-113` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-114` | `HYPERCARE-OPS-001::GAP-PKG-114` | `HYPERCARE-OPS-002::GAP-PKG-114` | `HYPERCARE-OPS-003::GAP-PKG-114` | `READY-GATE-013::GAP-PKG-114` + `DELIV-PKG-023::GAP-PKG-114` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-115` | `HYPERCARE-OPS-001::GAP-PKG-115` | `HYPERCARE-OPS-002::GAP-PKG-115` | `HYPERCARE-OPS-003::GAP-PKG-115` | `READY-GATE-013::GAP-PKG-115` + `DELIV-PKG-023::GAP-PKG-115` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-116` | `HYPERCARE-OPS-001::GAP-PKG-116` | `HYPERCARE-OPS-002::GAP-PKG-116` | `HYPERCARE-OPS-003::GAP-PKG-116` | `READY-GATE-013::GAP-PKG-116` + `DELIV-PKG-023::GAP-PKG-116` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-117` | `HYPERCARE-OPS-001::GAP-PKG-117` | `HYPERCARE-OPS-002::GAP-PKG-117` | `HYPERCARE-OPS-003::GAP-PKG-117` | `READY-GATE-013::GAP-PKG-117` + `DELIV-PKG-023::GAP-PKG-117` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-118` | `HYPERCARE-OPS-001::GAP-PKG-118` | `HYPERCARE-OPS-002::GAP-PKG-118` | `HYPERCARE-OPS-003::GAP-PKG-118` | `READY-GATE-013::GAP-PKG-118` + `DELIV-PKG-023::GAP-PKG-118` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-119` | `HYPERCARE-OPS-001::GAP-PKG-119` | `HYPERCARE-OPS-002::GAP-PKG-119` | `HYPERCARE-OPS-003::GAP-PKG-119` | `READY-GATE-013::GAP-PKG-119` + `DELIV-PKG-023::GAP-PKG-119` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-120` | `HYPERCARE-OPS-001::GAP-PKG-120` | `HYPERCARE-OPS-002::GAP-PKG-120` | `HYPERCARE-OPS-003::GAP-PKG-120` | `READY-GATE-013::GAP-PKG-120` + `DELIV-PKG-023::GAP-PKG-120` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-121` | `HYPERCARE-OPS-001::GAP-PKG-121` | `HYPERCARE-OPS-002::GAP-PKG-121` | `HYPERCARE-OPS-003::GAP-PKG-121` | `READY-GATE-013::GAP-PKG-121` + `DELIV-PKG-023::GAP-PKG-121` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-122` | `HYPERCARE-OPS-001::GAP-PKG-122` | `HYPERCARE-OPS-002::GAP-PKG-122` | `HYPERCARE-OPS-003::GAP-PKG-122` | `READY-GATE-013::GAP-PKG-122` + `DELIV-PKG-023::GAP-PKG-122` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-123` | `HYPERCARE-OPS-001::GAP-PKG-123` | `HYPERCARE-OPS-002::GAP-PKG-123` | `HYPERCARE-OPS-003::GAP-PKG-123` | `READY-GATE-013::GAP-PKG-123` + `DELIV-PKG-023::GAP-PKG-123` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-124` | `HYPERCARE-OPS-001::GAP-PKG-124` | `HYPERCARE-OPS-002::GAP-PKG-124` | `HYPERCARE-OPS-003::GAP-PKG-124` | `READY-GATE-013::GAP-PKG-124` + `DELIV-PKG-023::GAP-PKG-124` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-125` | `HYPERCARE-OPS-001::GAP-PKG-125` | `HYPERCARE-OPS-002::GAP-PKG-125` | `HYPERCARE-OPS-003::GAP-PKG-125` | `READY-GATE-013::GAP-PKG-125` + `DELIV-PKG-023::GAP-PKG-125` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-126` | `HYPERCARE-OPS-001::GAP-PKG-126` | `HYPERCARE-OPS-002::GAP-PKG-126` | `HYPERCARE-OPS-003::GAP-PKG-126` | `READY-GATE-013::GAP-PKG-126` + `DELIV-PKG-023::GAP-PKG-126` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-127` | `HYPERCARE-OPS-001::GAP-PKG-127` | `HYPERCARE-OPS-002::GAP-PKG-127` | `HYPERCARE-OPS-003::GAP-PKG-127` | `READY-GATE-013::GAP-PKG-127` + `DELIV-PKG-023::GAP-PKG-127` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-128` | `HYPERCARE-OPS-001::GAP-PKG-128` | `HYPERCARE-OPS-002::GAP-PKG-128` | `HYPERCARE-OPS-003::GAP-PKG-128` | `READY-GATE-013::GAP-PKG-128` + `DELIV-PKG-023::GAP-PKG-128` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-129` | `HYPERCARE-OPS-001::GAP-PKG-129` | `HYPERCARE-OPS-002::GAP-PKG-129` | `HYPERCARE-OPS-003::GAP-PKG-129` | `READY-GATE-013::GAP-PKG-129` + `DELIV-PKG-023::GAP-PKG-129` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-130` | `HYPERCARE-OPS-001::GAP-PKG-130` | `HYPERCARE-OPS-002::GAP-PKG-130` | `HYPERCARE-OPS-003::GAP-PKG-130` | `READY-GATE-013::GAP-PKG-130` + `DELIV-PKG-023::GAP-PKG-130` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-131` | `HYPERCARE-OPS-001::GAP-PKG-131` | `HYPERCARE-OPS-002::GAP-PKG-131` | `HYPERCARE-OPS-003::GAP-PKG-131` | `READY-GATE-013::GAP-PKG-131` + `DELIV-PKG-023::GAP-PKG-131` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-132` | `HYPERCARE-OPS-001::GAP-PKG-132` | `HYPERCARE-OPS-002::GAP-PKG-132` | `HYPERCARE-OPS-003::GAP-PKG-132` | `READY-GATE-013::GAP-PKG-132` + `DELIV-PKG-023::GAP-PKG-132` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-133` | `HYPERCARE-OPS-001::GAP-PKG-133` | `HYPERCARE-OPS-002::GAP-PKG-133` | `HYPERCARE-OPS-003::GAP-PKG-133` | `READY-GATE-013::GAP-PKG-133` + `DELIV-PKG-023::GAP-PKG-133` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-134` | `HYPERCARE-OPS-001::GAP-PKG-134` | `HYPERCARE-OPS-002::GAP-PKG-134` | `HYPERCARE-OPS-003::GAP-PKG-134` | `READY-GATE-013::GAP-PKG-134` + `DELIV-PKG-023::GAP-PKG-134` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-135` | `HYPERCARE-OPS-001::GAP-PKG-135` | `HYPERCARE-OPS-002::GAP-PKG-135` | `HYPERCARE-OPS-003::GAP-PKG-135` | `READY-GATE-013::GAP-PKG-135` + `DELIV-PKG-023::GAP-PKG-135` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-136` | `HYPERCARE-OPS-001::GAP-PKG-136` | `HYPERCARE-OPS-002::GAP-PKG-136` | `HYPERCARE-OPS-003::GAP-PKG-136` | `READY-GATE-013::GAP-PKG-136` + `DELIV-PKG-023::GAP-PKG-136` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-137` | `HYPERCARE-OPS-001::GAP-PKG-137` | `HYPERCARE-OPS-002::GAP-PKG-137` | `HYPERCARE-OPS-003::GAP-PKG-137` | `READY-GATE-013::GAP-PKG-137` + `DELIV-PKG-023::GAP-PKG-137` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-138` | `HYPERCARE-OPS-001::GAP-PKG-138` | `HYPERCARE-OPS-002::GAP-PKG-138` | `HYPERCARE-OPS-003::GAP-PKG-138` | `READY-GATE-013::GAP-PKG-138` + `DELIV-PKG-023::GAP-PKG-138` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-139` | `HYPERCARE-OPS-001::GAP-PKG-139` | `HYPERCARE-OPS-002::GAP-PKG-139` | `HYPERCARE-OPS-003::GAP-PKG-139` | `READY-GATE-013::GAP-PKG-139` + `DELIV-PKG-023::GAP-PKG-139` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-140` | `HYPERCARE-OPS-001::GAP-PKG-140` | `HYPERCARE-OPS-002::GAP-PKG-140` | `HYPERCARE-OPS-003::GAP-PKG-140` | `READY-GATE-013::GAP-PKG-140` + `DELIV-PKG-023::GAP-PKG-140` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-141` | `HYPERCARE-OPS-001::GAP-PKG-141` | `HYPERCARE-OPS-002::GAP-PKG-141` | `HYPERCARE-OPS-003::GAP-PKG-141` | `READY-GATE-013::GAP-PKG-141` + `DELIV-PKG-023::GAP-PKG-141` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-142` | `HYPERCARE-OPS-001::GAP-PKG-142` | `HYPERCARE-OPS-002::GAP-PKG-142` | `HYPERCARE-OPS-003::GAP-PKG-142` | `READY-GATE-013::GAP-PKG-142` + `DELIV-PKG-023::GAP-PKG-142` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-143` | `HYPERCARE-OPS-001::GAP-PKG-143` | `HYPERCARE-OPS-002::GAP-PKG-143` | `HYPERCARE-OPS-003::GAP-PKG-143` | `READY-GATE-013::GAP-PKG-143` + `DELIV-PKG-023::GAP-PKG-143` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-144` | `HYPERCARE-OPS-001::GAP-PKG-144` | `HYPERCARE-OPS-002::GAP-PKG-144` | `HYPERCARE-OPS-003::GAP-PKG-144` | `READY-GATE-013::GAP-PKG-144` + `DELIV-PKG-023::GAP-PKG-144` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-145` | `HYPERCARE-OPS-001::GAP-PKG-145` | `HYPERCARE-OPS-002::GAP-PKG-145` | `HYPERCARE-OPS-003::GAP-PKG-145` | `READY-GATE-013::GAP-PKG-145` + `DELIV-PKG-023::GAP-PKG-145` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-146` | `HYPERCARE-OPS-001::GAP-PKG-146` | `HYPERCARE-OPS-002::GAP-PKG-146` | `HYPERCARE-OPS-003::GAP-PKG-146` | `READY-GATE-013::GAP-PKG-146` + `DELIV-PKG-023::GAP-PKG-146` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-147` | `HYPERCARE-OPS-001::GAP-PKG-147` | `HYPERCARE-OPS-002::GAP-PKG-147` | `HYPERCARE-OPS-003::GAP-PKG-147` | `READY-GATE-013::GAP-PKG-147` + `DELIV-PKG-023::GAP-PKG-147` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-148` | `HYPERCARE-OPS-001::GAP-PKG-148` | `HYPERCARE-OPS-002::GAP-PKG-148` | `HYPERCARE-OPS-003::GAP-PKG-148` | `READY-GATE-013::GAP-PKG-148` + `DELIV-PKG-023::GAP-PKG-148` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-149` | `HYPERCARE-OPS-001::GAP-PKG-149` | `HYPERCARE-OPS-002::GAP-PKG-149` | `HYPERCARE-OPS-003::GAP-PKG-149` | `READY-GATE-013::GAP-PKG-149` + `DELIV-PKG-023::GAP-PKG-149` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-150` | `HYPERCARE-OPS-001::GAP-PKG-150` | `HYPERCARE-OPS-002::GAP-PKG-150` | `HYPERCARE-OPS-003::GAP-PKG-150` | `READY-GATE-013::GAP-PKG-150` + `DELIV-PKG-023::GAP-PKG-150` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-151` | `HYPERCARE-OPS-001::GAP-PKG-151` | `HYPERCARE-OPS-002::GAP-PKG-151` | `HYPERCARE-OPS-003::GAP-PKG-151` | `READY-GATE-013::GAP-PKG-151` + `DELIV-PKG-023::GAP-PKG-151` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-152` | `HYPERCARE-OPS-001::GAP-PKG-152` | `HYPERCARE-OPS-002::GAP-PKG-152` | `HYPERCARE-OPS-003::GAP-PKG-152` | `READY-GATE-013::GAP-PKG-152` + `DELIV-PKG-023::GAP-PKG-152` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-153` | `HYPERCARE-OPS-001::GAP-PKG-153` | `HYPERCARE-OPS-002::GAP-PKG-153` | `HYPERCARE-OPS-003::GAP-PKG-153` | `READY-GATE-013::GAP-PKG-153` + `DELIV-PKG-023::GAP-PKG-153` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-154` | `HYPERCARE-OPS-001::GAP-PKG-154` | `HYPERCARE-OPS-002::GAP-PKG-154` | `HYPERCARE-OPS-003::GAP-PKG-154` | `READY-GATE-013::GAP-PKG-154` + `DELIV-PKG-023::GAP-PKG-154` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-155` | `HYPERCARE-OPS-001::GAP-PKG-155` | `HYPERCARE-OPS-002::GAP-PKG-155` | `HYPERCARE-OPS-003::GAP-PKG-155` | `READY-GATE-013::GAP-PKG-155` + `DELIV-PKG-023::GAP-PKG-155` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-156` | `HYPERCARE-OPS-001::GAP-PKG-156` | `HYPERCARE-OPS-002::GAP-PKG-156` | `HYPERCARE-OPS-003::GAP-PKG-156` | `READY-GATE-013::GAP-PKG-156` + `DELIV-PKG-023::GAP-PKG-156` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-157` | `HYPERCARE-OPS-001::GAP-PKG-157` | `HYPERCARE-OPS-002::GAP-PKG-157` | `HYPERCARE-OPS-003::GAP-PKG-157` | `READY-GATE-013::GAP-PKG-157` + `DELIV-PKG-023::GAP-PKG-157` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-158` | `HYPERCARE-OPS-001::GAP-PKG-158` | `HYPERCARE-OPS-002::GAP-PKG-158` | `HYPERCARE-OPS-003::GAP-PKG-158` | `READY-GATE-013::GAP-PKG-158` + `DELIV-PKG-023::GAP-PKG-158` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-159` | `HYPERCARE-OPS-001::GAP-PKG-159` | `HYPERCARE-OPS-002::GAP-PKG-159` | `HYPERCARE-OPS-003::GAP-PKG-159` | `READY-GATE-013::GAP-PKG-159` + `DELIV-PKG-023::GAP-PKG-159` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-160` | `HYPERCARE-OPS-001::GAP-PKG-160` | `HYPERCARE-OPS-002::GAP-PKG-160` | `HYPERCARE-OPS-003::GAP-PKG-160` | `READY-GATE-013::GAP-PKG-160` + `DELIV-PKG-023::GAP-PKG-160` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-161` | `HYPERCARE-OPS-001::GAP-PKG-161` | `HYPERCARE-OPS-002::GAP-PKG-161` | `HYPERCARE-OPS-003::GAP-PKG-161` | `READY-GATE-013::GAP-PKG-161` + `DELIV-PKG-023::GAP-PKG-161` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-162` | `HYPERCARE-OPS-001::GAP-PKG-162` | `HYPERCARE-OPS-002::GAP-PKG-162` | `HYPERCARE-OPS-003::GAP-PKG-162` | `READY-GATE-013::GAP-PKG-162` + `DELIV-PKG-023::GAP-PKG-162` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-163` | `HYPERCARE-OPS-001::GAP-PKG-163` | `HYPERCARE-OPS-002::GAP-PKG-163` | `HYPERCARE-OPS-003::GAP-PKG-163` | `READY-GATE-013::GAP-PKG-163` + `DELIV-PKG-023::GAP-PKG-163` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-164` | `HYPERCARE-OPS-001::GAP-PKG-164` | `HYPERCARE-OPS-002::GAP-PKG-164` | `HYPERCARE-OPS-003::GAP-PKG-164` | `READY-GATE-013::GAP-PKG-164` + `DELIV-PKG-023::GAP-PKG-164` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-165` | `HYPERCARE-OPS-001::GAP-PKG-165` | `HYPERCARE-OPS-002::GAP-PKG-165` | `HYPERCARE-OPS-003::GAP-PKG-165` | `READY-GATE-013::GAP-PKG-165` + `DELIV-PKG-023::GAP-PKG-165` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-166` | `HYPERCARE-OPS-001::GAP-PKG-166` | `HYPERCARE-OPS-002::GAP-PKG-166` | `HYPERCARE-OPS-003::GAP-PKG-166` | `READY-GATE-013::GAP-PKG-166` + `DELIV-PKG-023::GAP-PKG-166` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-167` | `HYPERCARE-OPS-001::GAP-PKG-167` | `HYPERCARE-OPS-002::GAP-PKG-167` | `HYPERCARE-OPS-003::GAP-PKG-167` | `READY-GATE-013::GAP-PKG-167` + `DELIV-PKG-023::GAP-PKG-167` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-168` | `HYPERCARE-OPS-001::GAP-PKG-168` | `HYPERCARE-OPS-002::GAP-PKG-168` | `HYPERCARE-OPS-003::GAP-PKG-168` | `READY-GATE-013::GAP-PKG-168` + `DELIV-PKG-023::GAP-PKG-168` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-169` | `HYPERCARE-OPS-001::GAP-PKG-169` | `HYPERCARE-OPS-002::GAP-PKG-169` | `HYPERCARE-OPS-003::GAP-PKG-169` | `READY-GATE-013::GAP-PKG-169` + `DELIV-PKG-023::GAP-PKG-169` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-170` | `HYPERCARE-OPS-001::GAP-PKG-170` | `HYPERCARE-OPS-002::GAP-PKG-170` | `HYPERCARE-OPS-003::GAP-PKG-170` | `READY-GATE-013::GAP-PKG-170` + `DELIV-PKG-023::GAP-PKG-170` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-171` | `HYPERCARE-OPS-001::GAP-PKG-171` | `HYPERCARE-OPS-002::GAP-PKG-171` | `HYPERCARE-OPS-003::GAP-PKG-171` | `READY-GATE-013::GAP-PKG-171` + `DELIV-PKG-023::GAP-PKG-171` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-172` | `HYPERCARE-OPS-001::GAP-PKG-172` | `HYPERCARE-OPS-002::GAP-PKG-172` | `HYPERCARE-OPS-003::GAP-PKG-172` | `READY-GATE-013::GAP-PKG-172` + `DELIV-PKG-023::GAP-PKG-172` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-173` | `HYPERCARE-OPS-001::GAP-PKG-173` | `HYPERCARE-OPS-002::GAP-PKG-173` | `HYPERCARE-OPS-003::GAP-PKG-173` | `READY-GATE-013::GAP-PKG-173` + `DELIV-PKG-023::GAP-PKG-173` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-174` | `HYPERCARE-OPS-001::GAP-PKG-174` | `HYPERCARE-OPS-002::GAP-PKG-174` | `HYPERCARE-OPS-003::GAP-PKG-174` | `READY-GATE-013::GAP-PKG-174` + `DELIV-PKG-023::GAP-PKG-174` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-175` | `HYPERCARE-OPS-001::GAP-PKG-175` | `HYPERCARE-OPS-002::GAP-PKG-175` | `HYPERCARE-OPS-003::GAP-PKG-175` | `READY-GATE-013::GAP-PKG-175` + `DELIV-PKG-023::GAP-PKG-175` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-176` | `HYPERCARE-OPS-001::GAP-PKG-176` | `HYPERCARE-OPS-002::GAP-PKG-176` | `HYPERCARE-OPS-003::GAP-PKG-176` | `READY-GATE-013::GAP-PKG-176` + `DELIV-PKG-023::GAP-PKG-176` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-177` | `HYPERCARE-OPS-001::GAP-PKG-177` | `HYPERCARE-OPS-002::GAP-PKG-177` | `HYPERCARE-OPS-003::GAP-PKG-177` | `READY-GATE-013::GAP-PKG-177` + `DELIV-PKG-023::GAP-PKG-177` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-178` | `HYPERCARE-OPS-001::GAP-PKG-178` | `HYPERCARE-OPS-002::GAP-PKG-178` | `HYPERCARE-OPS-003::GAP-PKG-178` | `READY-GATE-013::GAP-PKG-178` + `DELIV-PKG-023::GAP-PKG-178` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-179` | `HYPERCARE-OPS-001::GAP-PKG-179` | `HYPERCARE-OPS-002::GAP-PKG-179` | `HYPERCARE-OPS-003::GAP-PKG-179` | `READY-GATE-013::GAP-PKG-179` + `DELIV-PKG-023::GAP-PKG-179` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-180` | `HYPERCARE-OPS-001::GAP-PKG-180` | `HYPERCARE-OPS-002::GAP-PKG-180` | `HYPERCARE-OPS-003::GAP-PKG-180` | `READY-GATE-013::GAP-PKG-180` + `DELIV-PKG-023::GAP-PKG-180` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-181` | `HYPERCARE-OPS-001::GAP-PKG-181` | `HYPERCARE-OPS-002::GAP-PKG-181` | `HYPERCARE-OPS-003::GAP-PKG-181` | `READY-GATE-013::GAP-PKG-181` + `DELIV-PKG-023::GAP-PKG-181` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-182` | `HYPERCARE-OPS-001::GAP-PKG-182` | `HYPERCARE-OPS-002::GAP-PKG-182` | `HYPERCARE-OPS-003::GAP-PKG-182` | `READY-GATE-013::GAP-PKG-182` + `DELIV-PKG-023::GAP-PKG-182` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-183` | `HYPERCARE-OPS-001::GAP-PKG-183` | `HYPERCARE-OPS-002::GAP-PKG-183` | `HYPERCARE-OPS-003::GAP-PKG-183` | `READY-GATE-013::GAP-PKG-183` + `DELIV-PKG-023::GAP-PKG-183` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-184` | `HYPERCARE-OPS-001::GAP-PKG-184` | `HYPERCARE-OPS-002::GAP-PKG-184` | `HYPERCARE-OPS-003::GAP-PKG-184` | `READY-GATE-013::GAP-PKG-184` + `DELIV-PKG-023::GAP-PKG-184` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-185` | `HYPERCARE-OPS-001::GAP-PKG-185` | `HYPERCARE-OPS-002::GAP-PKG-185` | `HYPERCARE-OPS-003::GAP-PKG-185` | `READY-GATE-013::GAP-PKG-185` + `DELIV-PKG-023::GAP-PKG-185` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-186` | `HYPERCARE-OPS-001::GAP-PKG-186` | `HYPERCARE-OPS-002::GAP-PKG-186` | `HYPERCARE-OPS-003::GAP-PKG-186` | `READY-GATE-013::GAP-PKG-186` + `DELIV-PKG-023::GAP-PKG-186` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-187` | `HYPERCARE-OPS-001::GAP-PKG-187` | `HYPERCARE-OPS-002::GAP-PKG-187` | `HYPERCARE-OPS-003::GAP-PKG-187` | `READY-GATE-013::GAP-PKG-187` + `DELIV-PKG-023::GAP-PKG-187` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-188` | `HYPERCARE-OPS-001::GAP-PKG-188` | `HYPERCARE-OPS-002::GAP-PKG-188` | `HYPERCARE-OPS-003::GAP-PKG-188` | `READY-GATE-013::GAP-PKG-188` + `DELIV-PKG-023::GAP-PKG-188` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-189` | `HYPERCARE-OPS-001::GAP-PKG-189` | `HYPERCARE-OPS-002::GAP-PKG-189` | `HYPERCARE-OPS-003::GAP-PKG-189` | `READY-GATE-013::GAP-PKG-189` + `DELIV-PKG-023::GAP-PKG-189` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-190` | `HYPERCARE-OPS-001::GAP-PKG-190` | `HYPERCARE-OPS-002::GAP-PKG-190` | `HYPERCARE-OPS-003::GAP-PKG-190` | `READY-GATE-013::GAP-PKG-190` + `DELIV-PKG-023::GAP-PKG-190` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-191` | `HYPERCARE-OPS-001::GAP-PKG-191` | `HYPERCARE-OPS-002::GAP-PKG-191` | `HYPERCARE-OPS-003::GAP-PKG-191` | `READY-GATE-013::GAP-PKG-191` + `DELIV-PKG-023::GAP-PKG-191` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-192` | `HYPERCARE-OPS-001::GAP-PKG-192` | `HYPERCARE-OPS-002::GAP-PKG-192` | `HYPERCARE-OPS-003::GAP-PKG-192` | `READY-GATE-013::GAP-PKG-192` + `DELIV-PKG-023::GAP-PKG-192` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-193` | `HYPERCARE-OPS-001::GAP-PKG-193` | `HYPERCARE-OPS-002::GAP-PKG-193` | `HYPERCARE-OPS-003::GAP-PKG-193` | `READY-GATE-013::GAP-PKG-193` + `DELIV-PKG-023::GAP-PKG-193` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-194` | `HYPERCARE-OPS-001::GAP-PKG-194` | `HYPERCARE-OPS-002::GAP-PKG-194` | `HYPERCARE-OPS-003::GAP-PKG-194` | `READY-GATE-013::GAP-PKG-194` + `DELIV-PKG-023::GAP-PKG-194` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-195` | `HYPERCARE-OPS-001::GAP-PKG-195` | `HYPERCARE-OPS-002::GAP-PKG-195` | `HYPERCARE-OPS-003::GAP-PKG-195` | `READY-GATE-013::GAP-PKG-195` + `DELIV-PKG-023::GAP-PKG-195` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-196` | `HYPERCARE-OPS-001::GAP-PKG-196` | `HYPERCARE-OPS-002::GAP-PKG-196` | `HYPERCARE-OPS-003::GAP-PKG-196` | `READY-GATE-013::GAP-PKG-196` + `DELIV-PKG-023::GAP-PKG-196` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-197` | `HYPERCARE-OPS-001::GAP-PKG-197` | `HYPERCARE-OPS-002::GAP-PKG-197` | `HYPERCARE-OPS-003::GAP-PKG-197` | `READY-GATE-013::GAP-PKG-197` + `DELIV-PKG-023::GAP-PKG-197` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-198` | `HYPERCARE-OPS-001::GAP-PKG-198` | `HYPERCARE-OPS-002::GAP-PKG-198` | `HYPERCARE-OPS-003::GAP-PKG-198` | `READY-GATE-013::GAP-PKG-198` + `DELIV-PKG-023::GAP-PKG-198` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-199` | `HYPERCARE-OPS-001::GAP-PKG-199` | `HYPERCARE-OPS-002::GAP-PKG-199` | `HYPERCARE-OPS-003::GAP-PKG-199` | `READY-GATE-013::GAP-PKG-199` + `DELIV-PKG-023::GAP-PKG-199` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-200` | `HYPERCARE-OPS-001::GAP-PKG-200` | `HYPERCARE-OPS-002::GAP-PKG-200` | `HYPERCARE-OPS-003::GAP-PKG-200` | `READY-GATE-013::GAP-PKG-200` + `DELIV-PKG-023::GAP-PKG-200` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-201` | `HYPERCARE-OPS-001::GAP-PKG-201` | `HYPERCARE-OPS-002::GAP-PKG-201` | `HYPERCARE-OPS-003::GAP-PKG-201` | `READY-GATE-013::GAP-PKG-201` + `DELIV-PKG-023::GAP-PKG-201` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-202` | `HYPERCARE-OPS-001::GAP-PKG-202` | `HYPERCARE-OPS-002::GAP-PKG-202` | `HYPERCARE-OPS-003::GAP-PKG-202` | `READY-GATE-013::GAP-PKG-202` + `DELIV-PKG-023::GAP-PKG-202` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-203` | `HYPERCARE-OPS-001::GAP-PKG-203` | `HYPERCARE-OPS-002::GAP-PKG-203` | `HYPERCARE-OPS-003::GAP-PKG-203` | `READY-GATE-013::GAP-PKG-203` + `DELIV-PKG-023::GAP-PKG-203` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-204` | `HYPERCARE-OPS-001::GAP-PKG-204` | `HYPERCARE-OPS-002::GAP-PKG-204` | `HYPERCARE-OPS-003::GAP-PKG-204` | `READY-GATE-013::GAP-PKG-204` + `DELIV-PKG-023::GAP-PKG-204` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-205` | `HYPERCARE-OPS-001::GAP-PKG-205` | `HYPERCARE-OPS-002::GAP-PKG-205` | `HYPERCARE-OPS-003::GAP-PKG-205` | `READY-GATE-013::GAP-PKG-205` + `DELIV-PKG-023::GAP-PKG-205` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-206` | `HYPERCARE-OPS-001::GAP-PKG-206` | `HYPERCARE-OPS-002::GAP-PKG-206` | `HYPERCARE-OPS-003::GAP-PKG-206` | `READY-GATE-013::GAP-PKG-206` + `DELIV-PKG-023::GAP-PKG-206` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |
| `GAP-PKG-207` | `HYPERCARE-OPS-001::GAP-PKG-207` | `HYPERCARE-OPS-002::GAP-PKG-207` | `HYPERCARE-OPS-003::GAP-PKG-207` | `READY-GATE-013::GAP-PKG-207` + `DELIV-PKG-023::GAP-PKG-207` | uso + resultado; finalización, abandono, ayuda, reintento y fallback según aplicabilidad | tiempo humano/ciclo contra baseline o umbral heredado; separar espera, bloqueo, ayuda y recuperación | recorrido observado contra proceso y modalidad autorizados; excluir variante o contingencia aprobada | `ESPECIFICADO` |

La matriz contiene **207 filas, 207 identidades únicas, 0 faltantes y 0 duplicados**.

---

#### 14. Reconciliación de modalidades heredadas

004 no reclasifica el universo. Conserva exactamente la distribución aprobada por `DELIV-PKG-022` y `HYPERCARE-OPS-001`:

| Modalidad heredada            |  Raíces | Tratamiento en 004                                                                                                   |
| ----------------------------- | ------: | -------------------------------------------------------------------------------------------------------------------- |
| piloto directo                |     160 | perfil definido; observación real únicamente si `SHELL-CI-023` activa la instancia autorizada                        |
| contrato compartido           |       3 | se observa a través de consumidoras y recorridos gobernados; no crea un denominador operativo independiente ficticio |
| control                       |      26 | observa las ejecuciones que gobierna; no crea un reloj ni una cohorte propia cuando la fuente no los define          |
| AURA bloqueada                |      14 | perfil documental presente, sin adopción real ni métricas inventadas hasta habilitación canónica                     |
| dependencia externa bloqueada |       2 | perfil documental presente; la observación espera activación y contrato externo exactos                              |
| TALENTO fuera de línea actual |       2 | perfil documental presente; no se presenta como operación adoptada ni activa                                         |
| **Total**                     | **207** | **reconciliado**                                                                                                     |

Las modalidades compartidas y de control nunca se cuentan dos veces por observar el mismo hecho a través de varias consumidoras. La aplicación futura deberá preservar la identidad empresarial y la fuente autoritativa del hecho medido.

---

#### 15. Reglas contra falsos positivos

No podrá concluirse adopción, mejora o estabilidad por ninguna de estas señales aisladas:

- código desplegado, build verde o servicio alcanzable;
- usuario autenticado o sesión iniciada;
- apertura de ruta, pantalla o modal;
- request exitoso sin resultado empresarial;
- cola vacía sin demostrar que el productor debía producir trabajo;
- reducción de tiempo obtenida al omitir controles, evidencia o pasos;
- alta finalización calculada excluyendo abandonos, reintentos o población elegible;
- ausencia de tickets de soporte cuando el canal o la cobertura no están demostrados;
- ausencia de desviaciones cuando no existe observabilidad suficiente;
- una encuesta favorable sin evidencia de ejecución;
- una demostración, walkthrough o muestra no comparable presentada como operación ordinaria;
- una media agregada que oculta una cohorte, sede, turno, canal o dispositivo materialmente degradados.

Tampoco podrá declararse una falla únicamente porque el tiempo o la adopción difieran de una expectativa no autorizada. Toda conclusión debe resolver la baseline, umbral o criterio canónico aplicable.

---

#### 16. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** 004 no introduce comportamiento ejecutable nuevo, estados empresariales nuevos, autorización, cálculo, integración, transición de datos ni umbrales numéricos propios. Especializa para hypercare obligaciones de adopción, evidencia operativa, medición humana, comparabilidad, ayuda, abandono y desviación que ya están protegidas por requisitos vigentes. Los defectos o regresiones que aparezcan durante la ejecución real deberán generar o modificar requisitos únicamente cuando exista evidencia concreta y la tarea propietaria determine el comportamiento a proteger.

**Requisitos existentes consumidos:** `TREQ-PROC-241`, `TREQ-PROC-244`, `TREQ-PROC-247`, `TREQ-PROC-257`, `TREQ-PROC-784`, `TREQ-PROC-817`, `TREQ-PROC-818`, `TREQ-PROC-819`, `TREQ-PROC-882`, `TREQ-PROC-883`, `TREQ-PROC-884`, `TREQ-PROC-887`, `TREQ-PROC-1118`, `TREQ-PROC-1162`, `TREQ-PROC-1166`, `TREQ-PROC-1169`, `TREQ-UX-001`, `TREQ-UX-007`, `TREQ-UX-317`, `TREQ-UX-318`, `TREQ-UX-413`, `TREQ-UX-473`, `TREQ-UX-474`, `TREQ-UX-477` y `TREQ-UX-478`.

**Requisitos TREQ-* creados:** 0
**Requisitos TREQ-* modificados:** 0
**Fragmentos 04A afectados:** 0

---

#### 17. Criterios de aceptación documental

`HYPERCARE-OPS-004` queda documentalmente completa cuando:

1. define adopción como uso efectivo más resultado o progreso gobernado y excluye despliegue, login y presencia de interfaz como pruebas suficientes;
2. separa tiempos humanos y de ciclo de las señales técnicas propietarias de 003;
3. usa baseline y umbrales heredados sin crear porcentajes, minutos, percentiles o tamaños de muestra universales;
4. distingue tiempo activo, espera, bloqueo, ayuda, reintento/recuperación y ciclo total cuando sean aplicables;
5. define desviación como diferencia demostrable contra el proceso o modalidad aprobados y excluye variantes, contingencias y excepciones autorizadas;
6. impide interpretar ausencia de señal como cero adopción o ausencia de desviaciones;
7. limita la telemetría a estabilización del proceso y prohíbe usarla como productividad individual o mecanismo disciplinario;
8. conserva comparabilidad por candidato, ambiente, alcance, cohorte y versión de baseline;
9. materializa exactamente `GAP-PKG-001..207`, con 207 identidades únicas, sin faltantes ni duplicados;
10. reconcilia la distribución `160 + 3 + 26 + 14 + 2 + 2 = 207` sin reclasificar modalidades heredadas;
11. conserva destino explícito de hallazgos hacia 005, 006, 007, 008, 009 o 010 según propiedad;
12. deja la captura real y cualquier estado `VALIDADO` exclusivamente para `SHELL-CI-023::<package_id>`;
13. crea 0 y modifica 0 requisitos `TREQ-*`, por lo que no modifica fragmentos 04A;
14. no ejecuta código, despliegues, configuración, DDL, DML, backfills, migraciones, consultas productivas ni modificaciones de Supabase;
15. `HYPERCARE-OPS-005` permanece reservada y no se anticipa su conciliación de datos y efectos entre dominios.

---

#### 18. Continuidad canónica

#### ÚLTIMA TAREA APROBADA
HYPERCARE-OPS-003 — Definir monitoreo de errores, colas, integraciones y rendimiento

#### TAREA ACTUAL APROBADA
HYPERCARE-OPS-004 — Definir monitoreo de adopción, tiempos y desviaciones operativas

#### SIGUIENTE TAREA RESERVADA
HYPERCARE-OPS-005 — Definir conciliaciones de datos y efectos entre dominios


### ✅ HYPERCARE-OPS-005 — Definir conciliaciones de datos y efectos entre dominios

**Estado:** APROBADA
**Tarea anterior:** `HYPERCARE-OPS-004 — Definir monitoreo de adopción, tiempos y desviaciones operativas`
**Tarea siguiente:** `HYPERCARE-OPS-006 — Definir clasificación, prioridad y procedimiento de corrección de incidentes`
**Tipo de tarea:** documental — definición normativa y materialización completa de la conciliación de datos, hechos y efectos entre dominios durante hypercare para las 207 raíces `GAP-PKG-*`; sin ejecutar conciliaciones, corregir datos, clasificar incidentes, aplicar compensaciones, modificar procesos, desplegar cambios, alterar configuración ni operar sobre Supabase
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/05_HYPERCARE_Y_ESTABILIZACION.md`
**Ejecución posterior:** `SHELL-CI-023::<package_id>` dentro de la instancia temporal autorizada por `HYPERCARE-OPS-001::<package_id>` y después de la salida aplicable de `SHELL-CI-022::<package_id>`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Resultado canónico

`HYPERCARE-OPS-005` define el contrato que deberá ejecutar posteriormente `SHELL-CI-023::<package_id>` para demostrar, durante hypercare, que los datos y efectos que cruzan fronteras de dominio permanecen trazables, completos, no duplicados y coherentes con el hecho empresarial autoritativo.

La tarea materializa el perfil para las **207/207** raíces `GAP-PKG-001..207`. La existencia del perfil documental no afirma que exista tráfico real, que un efecto haya ocurrido, que una conciliación haya pasado, que un dato haya sido corregido ni que una instancia pueda salir de hypercare.

La interpretación canónica es obligatoria:

- **conciliar no significa igualar tablas ni copiar valores entre sistemas**; significa reconstruir el hecho empresarial, sus efectos esperados y sus resultados observados usando las fuentes y contratos propietarios;
- **un ACK, HTTP `2xx`, mensaje publicado, fila de outbox, job completado o notificación enviada no demuestra por sí solo un efecto empresarial confirmado**;
- **correlación e idempotencia permiten reconstruir y deduplicar, pero no conceden autoridad ni sustituyen la fuente de verdad**;
- **una proyección, caché, dashboard, exportación o sistema externo no se convierte en fuente de verdad porque coincida con otra copia**;
- **un efecto confirmado no se borra, repite ni oculta porque otro efecto de la misma cadena haya fallado**;
- **una contingencia, captura manual u operación offline no crea una segunda fuente de verdad** y debe reincorporarse por el proceso canónico;
- **005 detecta, compara, documenta y entrega diferencias**; `HYPERCARE-OPS-006` conserva la clasificación, prioridad y procedimiento de corrección de incidentes.

---

#### 2. Propósito sustantivo

El resultado de esta tarea debe permitir responder de forma reproducible, por cada instancia de hypercare ejecutable:

1. ¿Cuál es el hecho empresarial autoritativo que origina o gobierna la cadena observada?
2. ¿Qué dominios, consumidoras, proyecciones, colas, proveedores, documentos, dispositivos o procedimientos manuales debían producir un efecto según la topología aprobada?
3. ¿Qué efectos fueron confirmados, rechazados, reproducidos desde un resultado previo, quedaron parciales, en conflicto, con resultado desconocido o requieren conciliación?
4. ¿Existe exactamente una correspondencia justificable entre el hecho de origen y cada efecto esperado, sin duplicados, huérfanos ni cierres falsos?
5. ¿Los datos comparados pertenecen al mismo candidato, ambiente, alcance, versión, periodo, corte y entidad empresarial aplicables?
6. ¿Las diferencias proceden de un defecto material, retraso permitido, dato no comparable, contingencia, rollback, compensación, reintento, corrección o evidencia insuficiente?
7. ¿Queda algún `RESULT_UNKNOWN`, `PARTIALLY_APPLIED`, `RECONCILIATION_REQUIRED`, conflicto, efecto residual o pendiente sin propietario antes de presentar la instancia a salida?

005 no corrige la diferencia, no cambia la fuente propietaria, no inventa tolerancias y no autoriza una operación compensatoria.

---

#### 3. Entradas canónicas vinculantes

La ejecución futura del contrato definido aquí deberá resolver cada identidad desde las fuentes vigentes y homónimas, sin crear una segunda fuente de verdad:

- `HYPERCARE-OPS-001::<package_id>` — instancia, candidato, ambiente, alcance, estado temporal y condición de salida;
- `HYPERCARE-OPS-002::<package_id>` — propietario funcional, autoridad técnica, suplencias y escalamiento;
- `HYPERCARE-OPS-003::<package_id>` — errores, colas, integraciones, rendimiento y contexto técnico correlacionable;
- `HYPERCARE-OPS-004::<package_id>` — adopción, tiempos humanos, recorrido observado y desviaciones operativas;
- `DELIV-PKG-010::<package_id>` — emisoras, consumidoras, entrega, idempotencia, retry, colas, dead-letter, compensación y conciliación previstas;
- `DELIV-PKG-015::<package_id>` — topología consolidada, repositorios, módulos, dependencias, contratos y consumidores;
- `DELIV-PKG-016::<package_id>` — pruebas, oráculos, ambientes, responsables y evidencia esperada;
- `DELIV-PKG-017::<package_id>` — señales, métricas, trazas, alertas, auditoría, conservación y datos prohibidos;
- `DELIV-PKG-020::<package_id>` — rollback técnico, funcional y de datos, efectos residuales y conciliación posterior;
- `DELIV-PKG-022::<package_id>` — cohorte, datos, dispositivos, ambiente y modalidad realmente expuestos;
- `DELIV-PKG-023::<package_id>` — criterios de aceptación, estados de resultado y manifiesto de evidencia;
- `READY-GATE-008::<package_id>` — procedimientos normales y de contingencia;
- `READY-GATE-011::<package_id>` — monitoreo, métricas y alertas disponibles;
- `READY-GATE-012::<package_id>` — respaldo y rollback probados antes del piloto;
- `READY-GATE-013::<package_id>` — línea base, cortes, comparabilidad, calidad y limitaciones previas;
- `READY-GATE-014::<package_id>` — riesgos aceptados y desviaciones temporales expresamente autorizadas;
- `INT-APP-003` a `INT-APP-010` — consumidoras, idempotencia, retry, compensaciones, auditoría, sincronización, errores parciales y prohibición de escrituras cruzadas sin contrato;
- `SHELL-CI-023::<package_id>` — ejecución posterior de hypercare y captura real de evidencia;
- `SHELL-CI-024::<package_id>` — consumidor posterior del expediente de estabilización para cierre y transferencia.

Si una fuente no aplica a la modalidad exacta de la raíz, esa no aplicabilidad debe quedar demostrada por el expediente. La ausencia de tráfico o de una alerta no permite inferir `NO_APLICA`.

---

#### 4. Frontera con las demás tareas HYPERCARE

| Tarea               | Propiedad exclusiva que 005 no absorbe                                 |
| ------------------- | ---------------------------------------------------------------------- |
| `HYPERCARE-OPS-001` | inicio, duración, suspensión, extensión e invalidación de la ventana   |
| `HYPERCARE-OPS-002` | responsables funcionales, técnicos, sustitutos y escalamiento          |
| `HYPERCARE-OPS-003` | monitoreo de errores, colas, integraciones y rendimiento técnico       |
| `HYPERCARE-OPS-004` | monitoreo de adopción, tiempos humanos y desviaciones operativas       |
| `HYPERCARE-OPS-005` | reconstrucción y comparación de datos, hechos y efectos entre dominios |
| `HYPERCARE-OPS-006` | clasificación, prioridad y procedimiento de corrección de incidentes   |
| `HYPERCARE-OPS-007` | registro, aprobación y gobierno de deuda o tareas posteriores          |
| `HYPERCARE-OPS-008` | transferencia a soporte ordinario y documentación definitiva           |
| `HYPERCARE-OPS-009` | retiro de contingencias temporales                                     |
| `HYPERCARE-OPS-010` | autoridad y evidencia de cierre funcional, técnico y operativo         |

Una diferencia de conciliación puede alimentar 006, 007, 009 o 010, pero 005 no toma sus decisiones.

---

#### 5. Unidad de conciliación y correlación

La unidad mínima de conciliación se construye con identidades ya existentes. No se crea una identidad empresarial nueva por esta tarea.

Cada comparación conservará, cuando aplique:

| Elemento                             | Regla                                                                                                   |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------- |
| `package_id`                         | raíz exacta `GAP-PKG-*` bajo hypercare                                                                  |
| candidato y ambiente                 | mismos candidato, revisión, configuración y ambiente entregados por 001                                 |
| alcance                              | misma cohorte, sede, área, canal, dispositivo o población autorizados                                   |
| `process_id` y `process_instance_id` | identidad del proceso y de la instancia empresarial cuando existan                                      |
| objeto empresarial                   | identidad propietaria del pedido, movimiento, lote, pago, documento, caso, turno u otro hecho aplicable |
| fuente autoritativa                  | dominio y registro que pueden afirmar el hecho empresarial                                              |
| productora y consumidora             | fronteras declaradas por el contrato de integración aplicable                                           |
| `event_id` u operación               | identidad durable del evento, comando, job o entrega cuando exista                                      |
| `correlation_id`                     | cadena que permite agrupar una misma operación distribuida                                              |
| `causation_id`                       | relación causal cuando el contrato la materialice                                                       |
| `idempotency_key`                    | identidad de repetición segura cuando aplique                                                           |
| versión y corte                      | versión contractual, de esquema, dato, snapshot o periodo que vuelve comparables las fuentes            |
| evidencia                            | referencias reproducibles de origen, efecto, receipt, auditoría y resultado                             |

La falta de uno de estos campos no se completa por invención. Si el contrato propietario no lo exige, queda fuera de esa unidad; si lo exige y no puede resolverse, la evaluación no puede declararse `PASS`.

---

#### 6. Construcción del universo de efectos esperados

Antes de comparar valores, la ejecución futura deberá derivar el universo de efectos esperados desde la topología aprobada del mismo `package_id`.

El universo incluirá solamente cuando el contrato aplicable los declare:

1. el hecho empresarial persistido por la fuente autoritativa;
2. proyecciones o vistas materializadas que deban reflejarlo;
3. eventos empresariales emitidos y cada consumidora obligatoria;
4. outbox, inbox, cola, job, retry, dead-letter o trabajo asíncrono necesario para transportar o materializar el efecto;
5. handoffs de estado, custodia, responsabilidad o aceptación entre dominios;
6. efectos en inventario, producción, ventas, pagos, documentos, evidencia u otros dominios cuando el expediente los declare;
7. adaptadores, webhooks, proveedores o sistemas externos y sus receipts o resultados;
8. registros manuales, offline o de contingencia que deban reincorporarse;
9. correcciones, anulaciones, reversos, compensaciones, rollback o recuperación que alteren la cadena de efectos;
10. datasets, reportes o métricas derivados cuando su uso exija comparabilidad y linaje contra el hecho fuente.

No se crea una expectativa por similitud de nombres, columnas o importes. Un dominio solo entra en la conciliación cuando existe una relación aprobada de productor, consumidor, efecto, handoff, dependencia o derivación.

---

#### 7. Precedencia de fuentes y verdad empresarial

La conciliación respeta las fronteras de propiedad:

1. la fuente propietaria afirma el hecho empresarial que le corresponde;
2. una consumidora conserva su efecto propio y no reescribe el hecho de la productora;
3. una proyección puede atrasarse, reconstruirse o invalidarse, pero no adquiere autoridad para corregir su fuente;
4. un evento empresarial describe un hecho durable; no es por sí mismo la fuente de verdad completa;
5. una notificación, alerta, dashboard o receipt técnico es evidencia de transporte o presentación, no prueba suficiente del efecto empresarial;
6. un proveedor externo conserva su identidad y receipt, pero el estado empresarial interno solo cambia mediante el contrato propietario aprobado;
7. la captura manual u offline conserva origen y evidencia hasta reincorporarse al proceso canónico;
8. un rollback restaura una frontera técnica o funcional permitida, pero no borra hechos válidos ya ocurridos;
9. una compensación o corrección crea el hecho sucesor o inverso aprobado y no falsifica el historial original;
10. un agregado o reporte solo es comparable cuando corte, periodo, zona horaria, versión, filtros y granularidad son compatibles.

---

#### 8. Familias de conciliación

##### 8.1. Fuente autoritativa frente a proyecciones

Se comprueba que cada proyección aplicable represente el hecho correcto para la versión y corte exigidos. Una demora dentro de una ventana ya aprobada puede permanecer pendiente; una diferencia material fuera del contrato se conserva como hallazgo. No se exige igualdad byte a byte entre estructuras con semántica distinta.

##### 8.2. Productora, evento y consumidoras

Se reconstruye la cadena `hecho durable -> evento -> entrega -> consumidora -> efecto`, preservando `event_id`, correlación, causalidad e idempotencia. Cada consumidora obligatoria debe quedar explicada individualmente; un resumen global no oculta una consumidora fallida.

##### 8.3. Colas, jobs y reintentos

Se separan recepción, pendiente, activo, completado, fallido, reintentado, deduplicado, dead-letter y resultado empresarial. Una cola vacía no prueba conciliación si el productor no generó el trabajo esperado o si el efecto terminó fuera de la fuente propietaria.

##### 8.4. Handoffs y efectos entre dominios

Un handoff solo queda conciliado cuando origen, destino, objeto, estado, versión, actor, evidencia y aceptación aplicables pueden reconstruirse. La existencia de datos equivalentes en dos dominios no autoriza una escritura cruzada directa ni una propiedad compartida implícita.

##### 8.5. Integraciones y proveedores externos

Se comparan identidad interna, identidad externa, request, receipt, resultado conocido, reintentos y efecto empresarial interno. Timeout o error de transporte no demuestran ausencia del efecto. `RESULT_UNKNOWN` exige consulta autoritativa antes de repetir, rechazar o conciliar.

##### 8.6. Offline, manual y contingencia

Cada hecho reincorporado conserva origen, actor, hora real, hora de registro, versión, folio o identidad controlada, evidencia y referencia de contingencia. La reincorporación detecta duplicados, conflictos, operaciones vencidas, recursos modificados y efectos parciales antes de mutar la fuente propietaria.

##### 8.7. Rollback, compensación y recuperación

La conciliación posterior distingue estado técnico restaurado de resultado empresarial reconciliado. Se preservan hechos válidos producidos durante la ventana y se explican efectos faltantes, duplicados, parciales, inversos o residuales. El rollback no puede cerrar hypercare dejando un `RESULT_UNKNOWN` sin tratamiento.

##### 8.8. Documentos, evidencia y derivados

Cuando el proceso dependa de documentos, Storage, firmas, archivos o datasets derivados, la conciliación verifica referencia, versión, hash o integridad cuando el contrato lo exija, clasificación, relación con el hecho y disponibilidad autorizada. Archivo sin registro o registro sin archivo aplicable no se considera conciliado.

---

#### 9. Estados y resultados permitidos durante la ejecución futura

005 no crea una nueva máquina de estados. Consume estados ya aprobados por los contratos de integración y aceptación.

Los estados operativos relevantes incluyen, cuando apliquen, `EFFECT_CONFIRMED`, `PRIOR_RESULT_REPLAYED`, `CONFLICT`, `RESULT_UNKNOWN`, `PARTIALLY_APPLIED`, `RECONCILIATION_REQUIRED`, `ACKNOWLEDGED`, `REJECTED_TERMINAL` y `SUPERSEDED`.

El resultado de cada unidad conciliable utilizará los estados de evaluación heredados:

| Resultado                | Condición documental para la ejecución futura                                                                                                                                                  |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `PASS`                   | fuente y todos los efectos aplicables están reconstruidos con evidencia suficiente; no quedan duplicados, huérfanos, parciales, conflictos, resultados desconocidos ni residuales sin resolver |
| `FAIL`                   | existe evidencia suficiente de una divergencia material: efecto faltante, duplicado, huérfano, incorrecto, parcial, aplicado a otra versión o fuente, o cierre incompatible con el contrato    |
| `BLOQUEADO`              | falta una fuente, identidad, autoridad, contrato o evidencia imprescindible para decidir sin inventar el resultado                                                                             |
| `PENDIENTE_DE_EVIDENCIA` | la unidad es aplicable y existe camino autorizado para obtener evidencia, pero todavía no puede emitirse una conclusión terminal dentro de la ventana activa                                   |
| `NO_APLICA`              | la topología y el expediente demuestran que esa familia de efecto no existe para la instancia evaluada                                                                                         |

`PASS` no se obtiene por ausencia de alertas. `NO_APLICA` no se obtiene por ausencia de tráfico. Un `RESULT_UNKNOWN`, `PARTIALLY_APPLIED` o `RECONCILIATION_REQUIRED` abierto impide declarar `PASS` para la unidad afectada.

---

#### 10. Patrones de divergencia que deben quedar visibles

La ejecución posterior debe poder distinguir, sin clasificarlos todavía como prioridad de incidente:

- hecho fuente sin efecto obligatorio;
- efecto sin hecho fuente autorizador;
- mismo efecto materializado más de una vez;
- replay correcto del resultado previo confundido con duplicado nuevo;
- efecto parcial entre unidades o pasos;
- orden o causalidad incompatibles con el contrato;
- versión, candidato, esquema, configuración, sede, área, actor, periodo o corte no comparables;
- proyección obsoleta presentada como actual;
- conflicto por una modificación concurrente o recurso ya cambiado;
- resultado externo desconocido o receipt insuficiente;
- reintento que utiliza una identidad distinta cuando debía preservar idempotencia;
- dead-letter o cuarentena presentada como resolución empresarial;
- corrección manual que sobrescribe el hecho original;
- contingencia reincorporada dos veces o nunca reincorporada;
- rollback que restaura software pero deja efectos empresariales pendientes;
- compensación aplicada sin preservar el hecho original y su causa;
- documento, archivo, evidencia o derivado sin contraparte referenciable;
- agregado aparentemente consistente construido con periodos, filtros o versiones incompatibles.

La severidad, prioridad, workaround y procedimiento de corrección pertenecen a `HYPERCARE-OPS-006`.

---

#### 11. Disparadores de conciliación

005 no crea una frecuencia numérica, cron ni umbral temporal nuevo. La ejecución se activa según los contratos existentes y, como mínimo, cuando ocurra una de estas condiciones aplicables:

1. un hecho empresarial produce uno o más efectos en otro dominio;
2. existe un handoff que requiere aceptación o cambio de custodia;
3. una operación entra en `CONFLICT`, `RESULT_UNKNOWN`, `PARTIALLY_APPLIED` o `RECONCILIATION_REQUIRED`;
4. retry, dead-letter, cuarentena o recuperación alteran la cadena de entrega;
5. se reincorpora trabajo offline, manual o de contingencia;
6. se ejecuta rollback, compensación, reverso, corrección o recuperación que pueda dejar efectos residuales;
7. una integración externa devuelve un resultado tardío, contradictorio o desconocido;
8. 003 o 004 detectan una señal que pueda implicar divergencia entre hecho y efecto;
9. antes de presentar la instancia como candidata de salida de hypercare.

Cuando el expediente ya posea una cadencia, SLI, ventana o sweep de conciliación, esa definición se hereda sin redefinirla.

---

#### 12. Evidencia mínima de conciliación

Cada unidad evaluada conservará evidencia suficiente para que otra persona autorizada reconstruya la misma conclusión. Cuando aplique, deberá incluir:

- `package_id`, candidato, ambiente y alcance;
- proceso, instancia y objeto empresarial;
- fuente propietaria y versión observada;
- productora, consumidora y efecto esperado;
- identificadores de evento, operación, correlación, causalidad e idempotencia disponibles;
- estado esperado y estado observado en cada frontera material;
- timestamps y corte usados para comparar;
- intentos, receipts, outbox, inbox, cola, job o dead-letter cuando sean relevantes;
- referencia externa y resultado del proveedor cuando aplique;
- referencia manual, offline o de contingencia cuando aplique;
- referencia de rollback, compensación, corrección o reverso cuando exista;
- diferencia encontrada y razón de comparabilidad o no comparabilidad;
- resultado `PASS`, `FAIL`, `BLOQUEADO`, `PENDIENTE_DE_EVIDENCIA` o `NO_APLICA`;
- propietario funcional y autoridad técnica heredados de 002;
- evidencia reproducible y sanitizada, sin secretos ni payloads sensibles innecesarios.

Una captura aislada, total agregado sin granularidad, query manual no conservada o afirmación de que los sistemas "se ven iguales" no basta.

---

#### 13. Handoff de diferencias y residuales

Toda diferencia abierta debe conservar, sin modificar silenciosamente la fuente:

1. `package_id` e instancia de hypercare;
2. unidad empresarial y fronteras afectadas;
3. fuente autoritativa;
4. efecto esperado y efecto observado;
5. estado operativo existente, cuando aplique;
6. evidencia y grado de certeza;
7. propietario funcional y autoridad técnica de 002;
8. siguiente tarea propietaria según la naturaleza del hallazgo;
9. condición objetiva que permitiría considerar la unidad reconciliada.

El handoff obligatorio es:

- a `HYPERCARE-OPS-006` cuando la diferencia deba clasificarse y entrar al procedimiento de corrección de incidentes;
- a `HYPERCARE-OPS-007` cuando exista deuda o trabajo posterior que deba aprobarse expresamente;
- a `HYPERCARE-OPS-009` cuando el residual dependa de una contingencia temporal cuya retirada deba demostrarse;
- a `HYPERCARE-OPS-010` como evidencia de cierre, sin transferirle la responsabilidad de resolver una diferencia abierta.

005 no permite que un pendiente narrativo quede sin propietario, tarea y condición de salida.

---

#### 14. Tratamiento por modalidad heredada

005 no reclasifica el universo. Conserva exactamente la distribución aprobada por `DELIV-PKG-022` y `HYPERCARE-OPS-001`:

| Modalidad heredada            |  Raíces | Tratamiento en 005                                                                                                                                                     |
| ----------------------------- | ------: | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| piloto directo                |     160 | se concilian todos los efectos interdominio declarados por la topología de la instancia; `NO_APLICA` exige demostrar que no existe una frontera interdominio aplicable |
| contrato compartido           |       3 | se reconcilia por cada consumidora real y contrato compartido ejercido, sin crear un hecho empresarial ficticio propio ni contar dos veces el mismo efecto             |
| control                       |      26 | observa y reconcilia la cobertura de las raíces que gobierna; no fabrica un efecto empresarial propio cuando su expediente no lo declara                               |
| AURA bloqueada                |      14 | perfil documental presente; no se inventan datos, consumidores ni efectos mientras persista el gate de activación                                                      |
| dependencia externa bloqueada |       2 | perfil documental presente; al activarse deberá preservar identidad externa, receipt, resultado interno y reconciliación; antes de ello no se simula ejecución         |
| TALENTO fuera de línea actual |       2 | perfil documental presente; no se presenta como cadena activa ni conciliada en la línea vigente                                                                        |
| **Total**                     | **207** | **reconciliado documentalmente**                                                                                                                                       |

Las modalidades shared y control no duplican hechos por observar la misma cadena desde varias consumidoras. La raíz homónima conserva siempre su propia identidad y gate.

---

#### 15. Matriz materializada por las 207 raíces

Cada `package_id` aparece exactamente una vez. Las referencias `::<package_id>` resuelven la fila homónima de la fuente indicada y no crean una identidad canónica nueva. El resultado operativo no se predeclara porque 005 no ejecuta hypercare; la columna `Estado 005` certifica exclusivamente que el contrato documental de conciliación quedó definido para la identidad.

| `package_id`  | Instancia y responsabilidad                                         | Topología y efectos                                                                        | Evidencia correlacionada                                                                           | Decisión de conciliación                                                                                                                                                               | Bloqueo / condición de salida                                                                                                                                                      | Estado 005     |
| ------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| `GAP-PKG-001` | `HYPERCARE-OPS-001::GAP-PKG-001` + `HYPERCARE-OPS-002::GAP-PKG-001` | `DELIV-PKG-010::GAP-PKG-001` + `DELIV-PKG-015::GAP-PKG-001` + `DELIV-PKG-020::GAP-PKG-001` | `HYPERCARE-OPS-003::GAP-PKG-001` + `HYPERCARE-OPS-004::GAP-PKG-001` + `DELIV-PKG-017::GAP-PKG-001` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-002` | `HYPERCARE-OPS-001::GAP-PKG-002` + `HYPERCARE-OPS-002::GAP-PKG-002` | `DELIV-PKG-010::GAP-PKG-002` + `DELIV-PKG-015::GAP-PKG-002` + `DELIV-PKG-020::GAP-PKG-002` | `HYPERCARE-OPS-003::GAP-PKG-002` + `HYPERCARE-OPS-004::GAP-PKG-002` + `DELIV-PKG-017::GAP-PKG-002` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-003` | `HYPERCARE-OPS-001::GAP-PKG-003` + `HYPERCARE-OPS-002::GAP-PKG-003` | `DELIV-PKG-010::GAP-PKG-003` + `DELIV-PKG-015::GAP-PKG-003` + `DELIV-PKG-020::GAP-PKG-003` | `HYPERCARE-OPS-003::GAP-PKG-003` + `HYPERCARE-OPS-004::GAP-PKG-003` + `DELIV-PKG-017::GAP-PKG-003` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-004` | `HYPERCARE-OPS-001::GAP-PKG-004` + `HYPERCARE-OPS-002::GAP-PKG-004` | `DELIV-PKG-010::GAP-PKG-004` + `DELIV-PKG-015::GAP-PKG-004` + `DELIV-PKG-020::GAP-PKG-004` | `HYPERCARE-OPS-003::GAP-PKG-004` + `HYPERCARE-OPS-004::GAP-PKG-004` + `DELIV-PKG-017::GAP-PKG-004` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-005` | `HYPERCARE-OPS-001::GAP-PKG-005` + `HYPERCARE-OPS-002::GAP-PKG-005` | `DELIV-PKG-010::GAP-PKG-005` + `DELIV-PKG-015::GAP-PKG-005` + `DELIV-PKG-020::GAP-PKG-005` | `HYPERCARE-OPS-003::GAP-PKG-005` + `HYPERCARE-OPS-004::GAP-PKG-005` + `DELIV-PKG-017::GAP-PKG-005` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-006` | `HYPERCARE-OPS-001::GAP-PKG-006` + `HYPERCARE-OPS-002::GAP-PKG-006` | `DELIV-PKG-010::GAP-PKG-006` + `DELIV-PKG-015::GAP-PKG-006` + `DELIV-PKG-020::GAP-PKG-006` | `HYPERCARE-OPS-003::GAP-PKG-006` + `HYPERCARE-OPS-004::GAP-PKG-006` + `DELIV-PKG-017::GAP-PKG-006` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-007` | `HYPERCARE-OPS-001::GAP-PKG-007` + `HYPERCARE-OPS-002::GAP-PKG-007` | `DELIV-PKG-010::GAP-PKG-007` + `DELIV-PKG-015::GAP-PKG-007` + `DELIV-PKG-020::GAP-PKG-007` | `HYPERCARE-OPS-003::GAP-PKG-007` + `HYPERCARE-OPS-004::GAP-PKG-007` + `DELIV-PKG-017::GAP-PKG-007` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-008` | `HYPERCARE-OPS-001::GAP-PKG-008` + `HYPERCARE-OPS-002::GAP-PKG-008` | `DELIV-PKG-010::GAP-PKG-008` + `DELIV-PKG-015::GAP-PKG-008` + `DELIV-PKG-020::GAP-PKG-008` | `HYPERCARE-OPS-003::GAP-PKG-008` + `HYPERCARE-OPS-004::GAP-PKG-008` + `DELIV-PKG-017::GAP-PKG-008` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-009` | `HYPERCARE-OPS-001::GAP-PKG-009` + `HYPERCARE-OPS-002::GAP-PKG-009` | `DELIV-PKG-010::GAP-PKG-009` + `DELIV-PKG-015::GAP-PKG-009` + `DELIV-PKG-020::GAP-PKG-009` | `HYPERCARE-OPS-003::GAP-PKG-009` + `HYPERCARE-OPS-004::GAP-PKG-009` + `DELIV-PKG-017::GAP-PKG-009` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-010` | `HYPERCARE-OPS-001::GAP-PKG-010` + `HYPERCARE-OPS-002::GAP-PKG-010` | `DELIV-PKG-010::GAP-PKG-010` + `DELIV-PKG-015::GAP-PKG-010` + `DELIV-PKG-020::GAP-PKG-010` | `HYPERCARE-OPS-003::GAP-PKG-010` + `HYPERCARE-OPS-004::GAP-PKG-010` + `DELIV-PKG-017::GAP-PKG-010` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-011` | `HYPERCARE-OPS-001::GAP-PKG-011` + `HYPERCARE-OPS-002::GAP-PKG-011` | `DELIV-PKG-010::GAP-PKG-011` + `DELIV-PKG-015::GAP-PKG-011` + `DELIV-PKG-020::GAP-PKG-011` | `HYPERCARE-OPS-003::GAP-PKG-011` + `HYPERCARE-OPS-004::GAP-PKG-011` + `DELIV-PKG-017::GAP-PKG-011` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-012` | `HYPERCARE-OPS-001::GAP-PKG-012` + `HYPERCARE-OPS-002::GAP-PKG-012` | `DELIV-PKG-010::GAP-PKG-012` + `DELIV-PKG-015::GAP-PKG-012` + `DELIV-PKG-020::GAP-PKG-012` | `HYPERCARE-OPS-003::GAP-PKG-012` + `HYPERCARE-OPS-004::GAP-PKG-012` + `DELIV-PKG-017::GAP-PKG-012` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-013` | `HYPERCARE-OPS-001::GAP-PKG-013` + `HYPERCARE-OPS-002::GAP-PKG-013` | `DELIV-PKG-010::GAP-PKG-013` + `DELIV-PKG-015::GAP-PKG-013` + `DELIV-PKG-020::GAP-PKG-013` | `HYPERCARE-OPS-003::GAP-PKG-013` + `HYPERCARE-OPS-004::GAP-PKG-013` + `DELIV-PKG-017::GAP-PKG-013` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-014` | `HYPERCARE-OPS-001::GAP-PKG-014` + `HYPERCARE-OPS-002::GAP-PKG-014` | `DELIV-PKG-010::GAP-PKG-014` + `DELIV-PKG-015::GAP-PKG-014` + `DELIV-PKG-020::GAP-PKG-014` | `HYPERCARE-OPS-003::GAP-PKG-014` + `HYPERCARE-OPS-004::GAP-PKG-014` + `DELIV-PKG-017::GAP-PKG-014` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-015` | `HYPERCARE-OPS-001::GAP-PKG-015` + `HYPERCARE-OPS-002::GAP-PKG-015` | `DELIV-PKG-010::GAP-PKG-015` + `DELIV-PKG-015::GAP-PKG-015` + `DELIV-PKG-020::GAP-PKG-015` | `HYPERCARE-OPS-003::GAP-PKG-015` + `HYPERCARE-OPS-004::GAP-PKG-015` + `DELIV-PKG-017::GAP-PKG-015` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-016` | `HYPERCARE-OPS-001::GAP-PKG-016` + `HYPERCARE-OPS-002::GAP-PKG-016` | `DELIV-PKG-010::GAP-PKG-016` + `DELIV-PKG-015::GAP-PKG-016` + `DELIV-PKG-020::GAP-PKG-016` | `HYPERCARE-OPS-003::GAP-PKG-016` + `HYPERCARE-OPS-004::GAP-PKG-016` + `DELIV-PKG-017::GAP-PKG-016` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-017` | `HYPERCARE-OPS-001::GAP-PKG-017` + `HYPERCARE-OPS-002::GAP-PKG-017` | `DELIV-PKG-010::GAP-PKG-017` + `DELIV-PKG-015::GAP-PKG-017` + `DELIV-PKG-020::GAP-PKG-017` | `HYPERCARE-OPS-003::GAP-PKG-017` + `HYPERCARE-OPS-004::GAP-PKG-017` + `DELIV-PKG-017::GAP-PKG-017` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-018` | `HYPERCARE-OPS-001::GAP-PKG-018` + `HYPERCARE-OPS-002::GAP-PKG-018` | `DELIV-PKG-010::GAP-PKG-018` + `DELIV-PKG-015::GAP-PKG-018` + `DELIV-PKG-020::GAP-PKG-018` | `HYPERCARE-OPS-003::GAP-PKG-018` + `HYPERCARE-OPS-004::GAP-PKG-018` + `DELIV-PKG-017::GAP-PKG-018` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-019` | `HYPERCARE-OPS-001::GAP-PKG-019` + `HYPERCARE-OPS-002::GAP-PKG-019` | `DELIV-PKG-010::GAP-PKG-019` + `DELIV-PKG-015::GAP-PKG-019` + `DELIV-PKG-020::GAP-PKG-019` | `HYPERCARE-OPS-003::GAP-PKG-019` + `HYPERCARE-OPS-004::GAP-PKG-019` + `DELIV-PKG-017::GAP-PKG-019` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-020` | `HYPERCARE-OPS-001::GAP-PKG-020` + `HYPERCARE-OPS-002::GAP-PKG-020` | `DELIV-PKG-010::GAP-PKG-020` + `DELIV-PKG-015::GAP-PKG-020` + `DELIV-PKG-020::GAP-PKG-020` | `HYPERCARE-OPS-003::GAP-PKG-020` + `HYPERCARE-OPS-004::GAP-PKG-020` + `DELIV-PKG-017::GAP-PKG-020` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-021` | `HYPERCARE-OPS-001::GAP-PKG-021` + `HYPERCARE-OPS-002::GAP-PKG-021` | `DELIV-PKG-010::GAP-PKG-021` + `DELIV-PKG-015::GAP-PKG-021` + `DELIV-PKG-020::GAP-PKG-021` | `HYPERCARE-OPS-003::GAP-PKG-021` + `HYPERCARE-OPS-004::GAP-PKG-021` + `DELIV-PKG-017::GAP-PKG-021` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-022` | `HYPERCARE-OPS-001::GAP-PKG-022` + `HYPERCARE-OPS-002::GAP-PKG-022` | `DELIV-PKG-010::GAP-PKG-022` + `DELIV-PKG-015::GAP-PKG-022` + `DELIV-PKG-020::GAP-PKG-022` | `HYPERCARE-OPS-003::GAP-PKG-022` + `HYPERCARE-OPS-004::GAP-PKG-022` + `DELIV-PKG-017::GAP-PKG-022` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-023` | `HYPERCARE-OPS-001::GAP-PKG-023` + `HYPERCARE-OPS-002::GAP-PKG-023` | `DELIV-PKG-010::GAP-PKG-023` + `DELIV-PKG-015::GAP-PKG-023` + `DELIV-PKG-020::GAP-PKG-023` | `HYPERCARE-OPS-003::GAP-PKG-023` + `HYPERCARE-OPS-004::GAP-PKG-023` + `DELIV-PKG-017::GAP-PKG-023` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-024` | `HYPERCARE-OPS-001::GAP-PKG-024` + `HYPERCARE-OPS-002::GAP-PKG-024` | `DELIV-PKG-010::GAP-PKG-024` + `DELIV-PKG-015::GAP-PKG-024` + `DELIV-PKG-020::GAP-PKG-024` | `HYPERCARE-OPS-003::GAP-PKG-024` + `HYPERCARE-OPS-004::GAP-PKG-024` + `DELIV-PKG-017::GAP-PKG-024` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-025` | `HYPERCARE-OPS-001::GAP-PKG-025` + `HYPERCARE-OPS-002::GAP-PKG-025` | `DELIV-PKG-010::GAP-PKG-025` + `DELIV-PKG-015::GAP-PKG-025` + `DELIV-PKG-020::GAP-PKG-025` | `HYPERCARE-OPS-003::GAP-PKG-025` + `HYPERCARE-OPS-004::GAP-PKG-025` + `DELIV-PKG-017::GAP-PKG-025` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-026` | `HYPERCARE-OPS-001::GAP-PKG-026` + `HYPERCARE-OPS-002::GAP-PKG-026` | `DELIV-PKG-010::GAP-PKG-026` + `DELIV-PKG-015::GAP-PKG-026` + `DELIV-PKG-020::GAP-PKG-026` | `HYPERCARE-OPS-003::GAP-PKG-026` + `HYPERCARE-OPS-004::GAP-PKG-026` + `DELIV-PKG-017::GAP-PKG-026` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-027` | `HYPERCARE-OPS-001::GAP-PKG-027` + `HYPERCARE-OPS-002::GAP-PKG-027` | `DELIV-PKG-010::GAP-PKG-027` + `DELIV-PKG-015::GAP-PKG-027` + `DELIV-PKG-020::GAP-PKG-027` | `HYPERCARE-OPS-003::GAP-PKG-027` + `HYPERCARE-OPS-004::GAP-PKG-027` + `DELIV-PKG-017::GAP-PKG-027` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-028` | `HYPERCARE-OPS-001::GAP-PKG-028` + `HYPERCARE-OPS-002::GAP-PKG-028` | `DELIV-PKG-010::GAP-PKG-028` + `DELIV-PKG-015::GAP-PKG-028` + `DELIV-PKG-020::GAP-PKG-028` | `HYPERCARE-OPS-003::GAP-PKG-028` + `HYPERCARE-OPS-004::GAP-PKG-028` + `DELIV-PKG-017::GAP-PKG-028` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-029` | `HYPERCARE-OPS-001::GAP-PKG-029` + `HYPERCARE-OPS-002::GAP-PKG-029` | `DELIV-PKG-010::GAP-PKG-029` + `DELIV-PKG-015::GAP-PKG-029` + `DELIV-PKG-020::GAP-PKG-029` | `HYPERCARE-OPS-003::GAP-PKG-029` + `HYPERCARE-OPS-004::GAP-PKG-029` + `DELIV-PKG-017::GAP-PKG-029` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-030` | `HYPERCARE-OPS-001::GAP-PKG-030` + `HYPERCARE-OPS-002::GAP-PKG-030` | `DELIV-PKG-010::GAP-PKG-030` + `DELIV-PKG-015::GAP-PKG-030` + `DELIV-PKG-020::GAP-PKG-030` | `HYPERCARE-OPS-003::GAP-PKG-030` + `HYPERCARE-OPS-004::GAP-PKG-030` + `DELIV-PKG-017::GAP-PKG-030` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-031` | `HYPERCARE-OPS-001::GAP-PKG-031` + `HYPERCARE-OPS-002::GAP-PKG-031` | `DELIV-PKG-010::GAP-PKG-031` + `DELIV-PKG-015::GAP-PKG-031` + `DELIV-PKG-020::GAP-PKG-031` | `HYPERCARE-OPS-003::GAP-PKG-031` + `HYPERCARE-OPS-004::GAP-PKG-031` + `DELIV-PKG-017::GAP-PKG-031` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-032` | `HYPERCARE-OPS-001::GAP-PKG-032` + `HYPERCARE-OPS-002::GAP-PKG-032` | `DELIV-PKG-010::GAP-PKG-032` + `DELIV-PKG-015::GAP-PKG-032` + `DELIV-PKG-020::GAP-PKG-032` | `HYPERCARE-OPS-003::GAP-PKG-032` + `HYPERCARE-OPS-004::GAP-PKG-032` + `DELIV-PKG-017::GAP-PKG-032` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-033` | `HYPERCARE-OPS-001::GAP-PKG-033` + `HYPERCARE-OPS-002::GAP-PKG-033` | `DELIV-PKG-010::GAP-PKG-033` + `DELIV-PKG-015::GAP-PKG-033` + `DELIV-PKG-020::GAP-PKG-033` | `HYPERCARE-OPS-003::GAP-PKG-033` + `HYPERCARE-OPS-004::GAP-PKG-033` + `DELIV-PKG-017::GAP-PKG-033` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-034` | `HYPERCARE-OPS-001::GAP-PKG-034` + `HYPERCARE-OPS-002::GAP-PKG-034` | `DELIV-PKG-010::GAP-PKG-034` + `DELIV-PKG-015::GAP-PKG-034` + `DELIV-PKG-020::GAP-PKG-034` | `HYPERCARE-OPS-003::GAP-PKG-034` + `HYPERCARE-OPS-004::GAP-PKG-034` + `DELIV-PKG-017::GAP-PKG-034` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-035` | `HYPERCARE-OPS-001::GAP-PKG-035` + `HYPERCARE-OPS-002::GAP-PKG-035` | `DELIV-PKG-010::GAP-PKG-035` + `DELIV-PKG-015::GAP-PKG-035` + `DELIV-PKG-020::GAP-PKG-035` | `HYPERCARE-OPS-003::GAP-PKG-035` + `HYPERCARE-OPS-004::GAP-PKG-035` + `DELIV-PKG-017::GAP-PKG-035` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-036` | `HYPERCARE-OPS-001::GAP-PKG-036` + `HYPERCARE-OPS-002::GAP-PKG-036` | `DELIV-PKG-010::GAP-PKG-036` + `DELIV-PKG-015::GAP-PKG-036` + `DELIV-PKG-020::GAP-PKG-036` | `HYPERCARE-OPS-003::GAP-PKG-036` + `HYPERCARE-OPS-004::GAP-PKG-036` + `DELIV-PKG-017::GAP-PKG-036` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-037` | `HYPERCARE-OPS-001::GAP-PKG-037` + `HYPERCARE-OPS-002::GAP-PKG-037` | `DELIV-PKG-010::GAP-PKG-037` + `DELIV-PKG-015::GAP-PKG-037` + `DELIV-PKG-020::GAP-PKG-037` | `HYPERCARE-OPS-003::GAP-PKG-037` + `HYPERCARE-OPS-004::GAP-PKG-037` + `DELIV-PKG-017::GAP-PKG-037` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-038` | `HYPERCARE-OPS-001::GAP-PKG-038` + `HYPERCARE-OPS-002::GAP-PKG-038` | `DELIV-PKG-010::GAP-PKG-038` + `DELIV-PKG-015::GAP-PKG-038` + `DELIV-PKG-020::GAP-PKG-038` | `HYPERCARE-OPS-003::GAP-PKG-038` + `HYPERCARE-OPS-004::GAP-PKG-038` + `DELIV-PKG-017::GAP-PKG-038` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-039` | `HYPERCARE-OPS-001::GAP-PKG-039` + `HYPERCARE-OPS-002::GAP-PKG-039` | `DELIV-PKG-010::GAP-PKG-039` + `DELIV-PKG-015::GAP-PKG-039` + `DELIV-PKG-020::GAP-PKG-039` | `HYPERCARE-OPS-003::GAP-PKG-039` + `HYPERCARE-OPS-004::GAP-PKG-039` + `DELIV-PKG-017::GAP-PKG-039` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-040` | `HYPERCARE-OPS-001::GAP-PKG-040` + `HYPERCARE-OPS-002::GAP-PKG-040` | `DELIV-PKG-010::GAP-PKG-040` + `DELIV-PKG-015::GAP-PKG-040` + `DELIV-PKG-020::GAP-PKG-040` | `HYPERCARE-OPS-003::GAP-PKG-040` + `HYPERCARE-OPS-004::GAP-PKG-040` + `DELIV-PKG-017::GAP-PKG-040` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-041` | `HYPERCARE-OPS-001::GAP-PKG-041` + `HYPERCARE-OPS-002::GAP-PKG-041` | `DELIV-PKG-010::GAP-PKG-041` + `DELIV-PKG-015::GAP-PKG-041` + `DELIV-PKG-020::GAP-PKG-041` | `HYPERCARE-OPS-003::GAP-PKG-041` + `HYPERCARE-OPS-004::GAP-PKG-041` + `DELIV-PKG-017::GAP-PKG-041` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-042` | `HYPERCARE-OPS-001::GAP-PKG-042` + `HYPERCARE-OPS-002::GAP-PKG-042` | `DELIV-PKG-010::GAP-PKG-042` + `DELIV-PKG-015::GAP-PKG-042` + `DELIV-PKG-020::GAP-PKG-042` | `HYPERCARE-OPS-003::GAP-PKG-042` + `HYPERCARE-OPS-004::GAP-PKG-042` + `DELIV-PKG-017::GAP-PKG-042` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-043` | `HYPERCARE-OPS-001::GAP-PKG-043` + `HYPERCARE-OPS-002::GAP-PKG-043` | `DELIV-PKG-010::GAP-PKG-043` + `DELIV-PKG-015::GAP-PKG-043` + `DELIV-PKG-020::GAP-PKG-043` | `HYPERCARE-OPS-003::GAP-PKG-043` + `HYPERCARE-OPS-004::GAP-PKG-043` + `DELIV-PKG-017::GAP-PKG-043` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-044` | `HYPERCARE-OPS-001::GAP-PKG-044` + `HYPERCARE-OPS-002::GAP-PKG-044` | `DELIV-PKG-010::GAP-PKG-044` + `DELIV-PKG-015::GAP-PKG-044` + `DELIV-PKG-020::GAP-PKG-044` | `HYPERCARE-OPS-003::GAP-PKG-044` + `HYPERCARE-OPS-004::GAP-PKG-044` + `DELIV-PKG-017::GAP-PKG-044` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-045` | `HYPERCARE-OPS-001::GAP-PKG-045` + `HYPERCARE-OPS-002::GAP-PKG-045` | `DELIV-PKG-010::GAP-PKG-045` + `DELIV-PKG-015::GAP-PKG-045` + `DELIV-PKG-020::GAP-PKG-045` | `HYPERCARE-OPS-003::GAP-PKG-045` + `HYPERCARE-OPS-004::GAP-PKG-045` + `DELIV-PKG-017::GAP-PKG-045` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-046` | `HYPERCARE-OPS-001::GAP-PKG-046` + `HYPERCARE-OPS-002::GAP-PKG-046` | `DELIV-PKG-010::GAP-PKG-046` + `DELIV-PKG-015::GAP-PKG-046` + `DELIV-PKG-020::GAP-PKG-046` | `HYPERCARE-OPS-003::GAP-PKG-046` + `HYPERCARE-OPS-004::GAP-PKG-046` + `DELIV-PKG-017::GAP-PKG-046` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-047` | `HYPERCARE-OPS-001::GAP-PKG-047` + `HYPERCARE-OPS-002::GAP-PKG-047` | `DELIV-PKG-010::GAP-PKG-047` + `DELIV-PKG-015::GAP-PKG-047` + `DELIV-PKG-020::GAP-PKG-047` | `HYPERCARE-OPS-003::GAP-PKG-047` + `HYPERCARE-OPS-004::GAP-PKG-047` + `DELIV-PKG-017::GAP-PKG-047` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-048` | `HYPERCARE-OPS-001::GAP-PKG-048` + `HYPERCARE-OPS-002::GAP-PKG-048` | `DELIV-PKG-010::GAP-PKG-048` + `DELIV-PKG-015::GAP-PKG-048` + `DELIV-PKG-020::GAP-PKG-048` | `HYPERCARE-OPS-003::GAP-PKG-048` + `HYPERCARE-OPS-004::GAP-PKG-048` + `DELIV-PKG-017::GAP-PKG-048` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-049` | `HYPERCARE-OPS-001::GAP-PKG-049` + `HYPERCARE-OPS-002::GAP-PKG-049` | `DELIV-PKG-010::GAP-PKG-049` + `DELIV-PKG-015::GAP-PKG-049` + `DELIV-PKG-020::GAP-PKG-049` | `HYPERCARE-OPS-003::GAP-PKG-049` + `HYPERCARE-OPS-004::GAP-PKG-049` + `DELIV-PKG-017::GAP-PKG-049` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-050` | `HYPERCARE-OPS-001::GAP-PKG-050` + `HYPERCARE-OPS-002::GAP-PKG-050` | `DELIV-PKG-010::GAP-PKG-050` + `DELIV-PKG-015::GAP-PKG-050` + `DELIV-PKG-020::GAP-PKG-050` | `HYPERCARE-OPS-003::GAP-PKG-050` + `HYPERCARE-OPS-004::GAP-PKG-050` + `DELIV-PKG-017::GAP-PKG-050` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-051` | `HYPERCARE-OPS-001::GAP-PKG-051` + `HYPERCARE-OPS-002::GAP-PKG-051` | `DELIV-PKG-010::GAP-PKG-051` + `DELIV-PKG-015::GAP-PKG-051` + `DELIV-PKG-020::GAP-PKG-051` | `HYPERCARE-OPS-003::GAP-PKG-051` + `HYPERCARE-OPS-004::GAP-PKG-051` + `DELIV-PKG-017::GAP-PKG-051` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-052` | `HYPERCARE-OPS-001::GAP-PKG-052` + `HYPERCARE-OPS-002::GAP-PKG-052` | `DELIV-PKG-010::GAP-PKG-052` + `DELIV-PKG-015::GAP-PKG-052` + `DELIV-PKG-020::GAP-PKG-052` | `HYPERCARE-OPS-003::GAP-PKG-052` + `HYPERCARE-OPS-004::GAP-PKG-052` + `DELIV-PKG-017::GAP-PKG-052` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-053` | `HYPERCARE-OPS-001::GAP-PKG-053` + `HYPERCARE-OPS-002::GAP-PKG-053` | `DELIV-PKG-010::GAP-PKG-053` + `DELIV-PKG-015::GAP-PKG-053` + `DELIV-PKG-020::GAP-PKG-053` | `HYPERCARE-OPS-003::GAP-PKG-053` + `HYPERCARE-OPS-004::GAP-PKG-053` + `DELIV-PKG-017::GAP-PKG-053` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-054` | `HYPERCARE-OPS-001::GAP-PKG-054` + `HYPERCARE-OPS-002::GAP-PKG-054` | `DELIV-PKG-010::GAP-PKG-054` + `DELIV-PKG-015::GAP-PKG-054` + `DELIV-PKG-020::GAP-PKG-054` | `HYPERCARE-OPS-003::GAP-PKG-054` + `HYPERCARE-OPS-004::GAP-PKG-054` + `DELIV-PKG-017::GAP-PKG-054` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-055` | `HYPERCARE-OPS-001::GAP-PKG-055` + `HYPERCARE-OPS-002::GAP-PKG-055` | `DELIV-PKG-010::GAP-PKG-055` + `DELIV-PKG-015::GAP-PKG-055` + `DELIV-PKG-020::GAP-PKG-055` | `HYPERCARE-OPS-003::GAP-PKG-055` + `HYPERCARE-OPS-004::GAP-PKG-055` + `DELIV-PKG-017::GAP-PKG-055` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-056` | `HYPERCARE-OPS-001::GAP-PKG-056` + `HYPERCARE-OPS-002::GAP-PKG-056` | `DELIV-PKG-010::GAP-PKG-056` + `DELIV-PKG-015::GAP-PKG-056` + `DELIV-PKG-020::GAP-PKG-056` | `HYPERCARE-OPS-003::GAP-PKG-056` + `HYPERCARE-OPS-004::GAP-PKG-056` + `DELIV-PKG-017::GAP-PKG-056` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-057` | `HYPERCARE-OPS-001::GAP-PKG-057` + `HYPERCARE-OPS-002::GAP-PKG-057` | `DELIV-PKG-010::GAP-PKG-057` + `DELIV-PKG-015::GAP-PKG-057` + `DELIV-PKG-020::GAP-PKG-057` | `HYPERCARE-OPS-003::GAP-PKG-057` + `HYPERCARE-OPS-004::GAP-PKG-057` + `DELIV-PKG-017::GAP-PKG-057` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-058` | `HYPERCARE-OPS-001::GAP-PKG-058` + `HYPERCARE-OPS-002::GAP-PKG-058` | `DELIV-PKG-010::GAP-PKG-058` + `DELIV-PKG-015::GAP-PKG-058` + `DELIV-PKG-020::GAP-PKG-058` | `HYPERCARE-OPS-003::GAP-PKG-058` + `HYPERCARE-OPS-004::GAP-PKG-058` + `DELIV-PKG-017::GAP-PKG-058` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-059` | `HYPERCARE-OPS-001::GAP-PKG-059` + `HYPERCARE-OPS-002::GAP-PKG-059` | `DELIV-PKG-010::GAP-PKG-059` + `DELIV-PKG-015::GAP-PKG-059` + `DELIV-PKG-020::GAP-PKG-059` | `HYPERCARE-OPS-003::GAP-PKG-059` + `HYPERCARE-OPS-004::GAP-PKG-059` + `DELIV-PKG-017::GAP-PKG-059` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-060` | `HYPERCARE-OPS-001::GAP-PKG-060` + `HYPERCARE-OPS-002::GAP-PKG-060` | `DELIV-PKG-010::GAP-PKG-060` + `DELIV-PKG-015::GAP-PKG-060` + `DELIV-PKG-020::GAP-PKG-060` | `HYPERCARE-OPS-003::GAP-PKG-060` + `HYPERCARE-OPS-004::GAP-PKG-060` + `DELIV-PKG-017::GAP-PKG-060` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-061` | `HYPERCARE-OPS-001::GAP-PKG-061` + `HYPERCARE-OPS-002::GAP-PKG-061` | `DELIV-PKG-010::GAP-PKG-061` + `DELIV-PKG-015::GAP-PKG-061` + `DELIV-PKG-020::GAP-PKG-061` | `HYPERCARE-OPS-003::GAP-PKG-061` + `HYPERCARE-OPS-004::GAP-PKG-061` + `DELIV-PKG-017::GAP-PKG-061` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-062` | `HYPERCARE-OPS-001::GAP-PKG-062` + `HYPERCARE-OPS-002::GAP-PKG-062` | `DELIV-PKG-010::GAP-PKG-062` + `DELIV-PKG-015::GAP-PKG-062` + `DELIV-PKG-020::GAP-PKG-062` | `HYPERCARE-OPS-003::GAP-PKG-062` + `HYPERCARE-OPS-004::GAP-PKG-062` + `DELIV-PKG-017::GAP-PKG-062` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-063` | `HYPERCARE-OPS-001::GAP-PKG-063` + `HYPERCARE-OPS-002::GAP-PKG-063` | `DELIV-PKG-010::GAP-PKG-063` + `DELIV-PKG-015::GAP-PKG-063` + `DELIV-PKG-020::GAP-PKG-063` | `HYPERCARE-OPS-003::GAP-PKG-063` + `HYPERCARE-OPS-004::GAP-PKG-063` + `DELIV-PKG-017::GAP-PKG-063` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-064` | `HYPERCARE-OPS-001::GAP-PKG-064` + `HYPERCARE-OPS-002::GAP-PKG-064` | `DELIV-PKG-010::GAP-PKG-064` + `DELIV-PKG-015::GAP-PKG-064` + `DELIV-PKG-020::GAP-PKG-064` | `HYPERCARE-OPS-003::GAP-PKG-064` + `HYPERCARE-OPS-004::GAP-PKG-064` + `DELIV-PKG-017::GAP-PKG-064` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-065` | `HYPERCARE-OPS-001::GAP-PKG-065` + `HYPERCARE-OPS-002::GAP-PKG-065` | `DELIV-PKG-010::GAP-PKG-065` + `DELIV-PKG-015::GAP-PKG-065` + `DELIV-PKG-020::GAP-PKG-065` | `HYPERCARE-OPS-003::GAP-PKG-065` + `HYPERCARE-OPS-004::GAP-PKG-065` + `DELIV-PKG-017::GAP-PKG-065` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-066` | `HYPERCARE-OPS-001::GAP-PKG-066` + `HYPERCARE-OPS-002::GAP-PKG-066` | `DELIV-PKG-010::GAP-PKG-066` + `DELIV-PKG-015::GAP-PKG-066` + `DELIV-PKG-020::GAP-PKG-066` | `HYPERCARE-OPS-003::GAP-PKG-066` + `HYPERCARE-OPS-004::GAP-PKG-066` + `DELIV-PKG-017::GAP-PKG-066` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-067` | `HYPERCARE-OPS-001::GAP-PKG-067` + `HYPERCARE-OPS-002::GAP-PKG-067` | `DELIV-PKG-010::GAP-PKG-067` + `DELIV-PKG-015::GAP-PKG-067` + `DELIV-PKG-020::GAP-PKG-067` | `HYPERCARE-OPS-003::GAP-PKG-067` + `HYPERCARE-OPS-004::GAP-PKG-067` + `DELIV-PKG-017::GAP-PKG-067` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-068` | `HYPERCARE-OPS-001::GAP-PKG-068` + `HYPERCARE-OPS-002::GAP-PKG-068` | `DELIV-PKG-010::GAP-PKG-068` + `DELIV-PKG-015::GAP-PKG-068` + `DELIV-PKG-020::GAP-PKG-068` | `HYPERCARE-OPS-003::GAP-PKG-068` + `HYPERCARE-OPS-004::GAP-PKG-068` + `DELIV-PKG-017::GAP-PKG-068` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-069` | `HYPERCARE-OPS-001::GAP-PKG-069` + `HYPERCARE-OPS-002::GAP-PKG-069` | `DELIV-PKG-010::GAP-PKG-069` + `DELIV-PKG-015::GAP-PKG-069` + `DELIV-PKG-020::GAP-PKG-069` | `HYPERCARE-OPS-003::GAP-PKG-069` + `HYPERCARE-OPS-004::GAP-PKG-069` + `DELIV-PKG-017::GAP-PKG-069` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-070` | `HYPERCARE-OPS-001::GAP-PKG-070` + `HYPERCARE-OPS-002::GAP-PKG-070` | `DELIV-PKG-010::GAP-PKG-070` + `DELIV-PKG-015::GAP-PKG-070` + `DELIV-PKG-020::GAP-PKG-070` | `HYPERCARE-OPS-003::GAP-PKG-070` + `HYPERCARE-OPS-004::GAP-PKG-070` + `DELIV-PKG-017::GAP-PKG-070` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-071` | `HYPERCARE-OPS-001::GAP-PKG-071` + `HYPERCARE-OPS-002::GAP-PKG-071` | `DELIV-PKG-010::GAP-PKG-071` + `DELIV-PKG-015::GAP-PKG-071` + `DELIV-PKG-020::GAP-PKG-071` | `HYPERCARE-OPS-003::GAP-PKG-071` + `HYPERCARE-OPS-004::GAP-PKG-071` + `DELIV-PKG-017::GAP-PKG-071` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-072` | `HYPERCARE-OPS-001::GAP-PKG-072` + `HYPERCARE-OPS-002::GAP-PKG-072` | `DELIV-PKG-010::GAP-PKG-072` + `DELIV-PKG-015::GAP-PKG-072` + `DELIV-PKG-020::GAP-PKG-072` | `HYPERCARE-OPS-003::GAP-PKG-072` + `HYPERCARE-OPS-004::GAP-PKG-072` + `DELIV-PKG-017::GAP-PKG-072` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-073` | `HYPERCARE-OPS-001::GAP-PKG-073` + `HYPERCARE-OPS-002::GAP-PKG-073` | `DELIV-PKG-010::GAP-PKG-073` + `DELIV-PKG-015::GAP-PKG-073` + `DELIV-PKG-020::GAP-PKG-073` | `HYPERCARE-OPS-003::GAP-PKG-073` + `HYPERCARE-OPS-004::GAP-PKG-073` + `DELIV-PKG-017::GAP-PKG-073` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-074` | `HYPERCARE-OPS-001::GAP-PKG-074` + `HYPERCARE-OPS-002::GAP-PKG-074` | `DELIV-PKG-010::GAP-PKG-074` + `DELIV-PKG-015::GAP-PKG-074` + `DELIV-PKG-020::GAP-PKG-074` | `HYPERCARE-OPS-003::GAP-PKG-074` + `HYPERCARE-OPS-004::GAP-PKG-074` + `DELIV-PKG-017::GAP-PKG-074` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-075` | `HYPERCARE-OPS-001::GAP-PKG-075` + `HYPERCARE-OPS-002::GAP-PKG-075` | `DELIV-PKG-010::GAP-PKG-075` + `DELIV-PKG-015::GAP-PKG-075` + `DELIV-PKG-020::GAP-PKG-075` | `HYPERCARE-OPS-003::GAP-PKG-075` + `HYPERCARE-OPS-004::GAP-PKG-075` + `DELIV-PKG-017::GAP-PKG-075` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-076` | `HYPERCARE-OPS-001::GAP-PKG-076` + `HYPERCARE-OPS-002::GAP-PKG-076` | `DELIV-PKG-010::GAP-PKG-076` + `DELIV-PKG-015::GAP-PKG-076` + `DELIV-PKG-020::GAP-PKG-076` | `HYPERCARE-OPS-003::GAP-PKG-076` + `HYPERCARE-OPS-004::GAP-PKG-076` + `DELIV-PKG-017::GAP-PKG-076` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-077` | `HYPERCARE-OPS-001::GAP-PKG-077` + `HYPERCARE-OPS-002::GAP-PKG-077` | `DELIV-PKG-010::GAP-PKG-077` + `DELIV-PKG-015::GAP-PKG-077` + `DELIV-PKG-020::GAP-PKG-077` | `HYPERCARE-OPS-003::GAP-PKG-077` + `HYPERCARE-OPS-004::GAP-PKG-077` + `DELIV-PKG-017::GAP-PKG-077` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-078` | `HYPERCARE-OPS-001::GAP-PKG-078` + `HYPERCARE-OPS-002::GAP-PKG-078` | `DELIV-PKG-010::GAP-PKG-078` + `DELIV-PKG-015::GAP-PKG-078` + `DELIV-PKG-020::GAP-PKG-078` | `HYPERCARE-OPS-003::GAP-PKG-078` + `HYPERCARE-OPS-004::GAP-PKG-078` + `DELIV-PKG-017::GAP-PKG-078` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-079` | `HYPERCARE-OPS-001::GAP-PKG-079` + `HYPERCARE-OPS-002::GAP-PKG-079` | `DELIV-PKG-010::GAP-PKG-079` + `DELIV-PKG-015::GAP-PKG-079` + `DELIV-PKG-020::GAP-PKG-079` | `HYPERCARE-OPS-003::GAP-PKG-079` + `HYPERCARE-OPS-004::GAP-PKG-079` + `DELIV-PKG-017::GAP-PKG-079` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-080` | `HYPERCARE-OPS-001::GAP-PKG-080` + `HYPERCARE-OPS-002::GAP-PKG-080` | `DELIV-PKG-010::GAP-PKG-080` + `DELIV-PKG-015::GAP-PKG-080` + `DELIV-PKG-020::GAP-PKG-080` | `HYPERCARE-OPS-003::GAP-PKG-080` + `HYPERCARE-OPS-004::GAP-PKG-080` + `DELIV-PKG-017::GAP-PKG-080` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-081` | `HYPERCARE-OPS-001::GAP-PKG-081` + `HYPERCARE-OPS-002::GAP-PKG-081` | `DELIV-PKG-010::GAP-PKG-081` + `DELIV-PKG-015::GAP-PKG-081` + `DELIV-PKG-020::GAP-PKG-081` | `HYPERCARE-OPS-003::GAP-PKG-081` + `HYPERCARE-OPS-004::GAP-PKG-081` + `DELIV-PKG-017::GAP-PKG-081` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-082` | `HYPERCARE-OPS-001::GAP-PKG-082` + `HYPERCARE-OPS-002::GAP-PKG-082` | `DELIV-PKG-010::GAP-PKG-082` + `DELIV-PKG-015::GAP-PKG-082` + `DELIV-PKG-020::GAP-PKG-082` | `HYPERCARE-OPS-003::GAP-PKG-082` + `HYPERCARE-OPS-004::GAP-PKG-082` + `DELIV-PKG-017::GAP-PKG-082` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-083` | `HYPERCARE-OPS-001::GAP-PKG-083` + `HYPERCARE-OPS-002::GAP-PKG-083` | `DELIV-PKG-010::GAP-PKG-083` + `DELIV-PKG-015::GAP-PKG-083` + `DELIV-PKG-020::GAP-PKG-083` | `HYPERCARE-OPS-003::GAP-PKG-083` + `HYPERCARE-OPS-004::GAP-PKG-083` + `DELIV-PKG-017::GAP-PKG-083` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-084` | `HYPERCARE-OPS-001::GAP-PKG-084` + `HYPERCARE-OPS-002::GAP-PKG-084` | `DELIV-PKG-010::GAP-PKG-084` + `DELIV-PKG-015::GAP-PKG-084` + `DELIV-PKG-020::GAP-PKG-084` | `HYPERCARE-OPS-003::GAP-PKG-084` + `HYPERCARE-OPS-004::GAP-PKG-084` + `DELIV-PKG-017::GAP-PKG-084` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-085` | `HYPERCARE-OPS-001::GAP-PKG-085` + `HYPERCARE-OPS-002::GAP-PKG-085` | `DELIV-PKG-010::GAP-PKG-085` + `DELIV-PKG-015::GAP-PKG-085` + `DELIV-PKG-020::GAP-PKG-085` | `HYPERCARE-OPS-003::GAP-PKG-085` + `HYPERCARE-OPS-004::GAP-PKG-085` + `DELIV-PKG-017::GAP-PKG-085` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-086` | `HYPERCARE-OPS-001::GAP-PKG-086` + `HYPERCARE-OPS-002::GAP-PKG-086` | `DELIV-PKG-010::GAP-PKG-086` + `DELIV-PKG-015::GAP-PKG-086` + `DELIV-PKG-020::GAP-PKG-086` | `HYPERCARE-OPS-003::GAP-PKG-086` + `HYPERCARE-OPS-004::GAP-PKG-086` + `DELIV-PKG-017::GAP-PKG-086` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-087` | `HYPERCARE-OPS-001::GAP-PKG-087` + `HYPERCARE-OPS-002::GAP-PKG-087` | `DELIV-PKG-010::GAP-PKG-087` + `DELIV-PKG-015::GAP-PKG-087` + `DELIV-PKG-020::GAP-PKG-087` | `HYPERCARE-OPS-003::GAP-PKG-087` + `HYPERCARE-OPS-004::GAP-PKG-087` + `DELIV-PKG-017::GAP-PKG-087` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-088` | `HYPERCARE-OPS-001::GAP-PKG-088` + `HYPERCARE-OPS-002::GAP-PKG-088` | `DELIV-PKG-010::GAP-PKG-088` + `DELIV-PKG-015::GAP-PKG-088` + `DELIV-PKG-020::GAP-PKG-088` | `HYPERCARE-OPS-003::GAP-PKG-088` + `HYPERCARE-OPS-004::GAP-PKG-088` + `DELIV-PKG-017::GAP-PKG-088` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-089` | `HYPERCARE-OPS-001::GAP-PKG-089` + `HYPERCARE-OPS-002::GAP-PKG-089` | `DELIV-PKG-010::GAP-PKG-089` + `DELIV-PKG-015::GAP-PKG-089` + `DELIV-PKG-020::GAP-PKG-089` | `HYPERCARE-OPS-003::GAP-PKG-089` + `HYPERCARE-OPS-004::GAP-PKG-089` + `DELIV-PKG-017::GAP-PKG-089` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-090` | `HYPERCARE-OPS-001::GAP-PKG-090` + `HYPERCARE-OPS-002::GAP-PKG-090` | `DELIV-PKG-010::GAP-PKG-090` + `DELIV-PKG-015::GAP-PKG-090` + `DELIV-PKG-020::GAP-PKG-090` | `HYPERCARE-OPS-003::GAP-PKG-090` + `HYPERCARE-OPS-004::GAP-PKG-090` + `DELIV-PKG-017::GAP-PKG-090` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-091` | `HYPERCARE-OPS-001::GAP-PKG-091` + `HYPERCARE-OPS-002::GAP-PKG-091` | `DELIV-PKG-010::GAP-PKG-091` + `DELIV-PKG-015::GAP-PKG-091` + `DELIV-PKG-020::GAP-PKG-091` | `HYPERCARE-OPS-003::GAP-PKG-091` + `HYPERCARE-OPS-004::GAP-PKG-091` + `DELIV-PKG-017::GAP-PKG-091` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-092` | `HYPERCARE-OPS-001::GAP-PKG-092` + `HYPERCARE-OPS-002::GAP-PKG-092` | `DELIV-PKG-010::GAP-PKG-092` + `DELIV-PKG-015::GAP-PKG-092` + `DELIV-PKG-020::GAP-PKG-092` | `HYPERCARE-OPS-003::GAP-PKG-092` + `HYPERCARE-OPS-004::GAP-PKG-092` + `DELIV-PKG-017::GAP-PKG-092` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-093` | `HYPERCARE-OPS-001::GAP-PKG-093` + `HYPERCARE-OPS-002::GAP-PKG-093` | `DELIV-PKG-010::GAP-PKG-093` + `DELIV-PKG-015::GAP-PKG-093` + `DELIV-PKG-020::GAP-PKG-093` | `HYPERCARE-OPS-003::GAP-PKG-093` + `HYPERCARE-OPS-004::GAP-PKG-093` + `DELIV-PKG-017::GAP-PKG-093` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-094` | `HYPERCARE-OPS-001::GAP-PKG-094` + `HYPERCARE-OPS-002::GAP-PKG-094` | `DELIV-PKG-010::GAP-PKG-094` + `DELIV-PKG-015::GAP-PKG-094` + `DELIV-PKG-020::GAP-PKG-094` | `HYPERCARE-OPS-003::GAP-PKG-094` + `HYPERCARE-OPS-004::GAP-PKG-094` + `DELIV-PKG-017::GAP-PKG-094` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-095` | `HYPERCARE-OPS-001::GAP-PKG-095` + `HYPERCARE-OPS-002::GAP-PKG-095` | `DELIV-PKG-010::GAP-PKG-095` + `DELIV-PKG-015::GAP-PKG-095` + `DELIV-PKG-020::GAP-PKG-095` | `HYPERCARE-OPS-003::GAP-PKG-095` + `HYPERCARE-OPS-004::GAP-PKG-095` + `DELIV-PKG-017::GAP-PKG-095` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-096` | `HYPERCARE-OPS-001::GAP-PKG-096` + `HYPERCARE-OPS-002::GAP-PKG-096` | `DELIV-PKG-010::GAP-PKG-096` + `DELIV-PKG-015::GAP-PKG-096` + `DELIV-PKG-020::GAP-PKG-096` | `HYPERCARE-OPS-003::GAP-PKG-096` + `HYPERCARE-OPS-004::GAP-PKG-096` + `DELIV-PKG-017::GAP-PKG-096` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-097` | `HYPERCARE-OPS-001::GAP-PKG-097` + `HYPERCARE-OPS-002::GAP-PKG-097` | `DELIV-PKG-010::GAP-PKG-097` + `DELIV-PKG-015::GAP-PKG-097` + `DELIV-PKG-020::GAP-PKG-097` | `HYPERCARE-OPS-003::GAP-PKG-097` + `HYPERCARE-OPS-004::GAP-PKG-097` + `DELIV-PKG-017::GAP-PKG-097` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-098` | `HYPERCARE-OPS-001::GAP-PKG-098` + `HYPERCARE-OPS-002::GAP-PKG-098` | `DELIV-PKG-010::GAP-PKG-098` + `DELIV-PKG-015::GAP-PKG-098` + `DELIV-PKG-020::GAP-PKG-098` | `HYPERCARE-OPS-003::GAP-PKG-098` + `HYPERCARE-OPS-004::GAP-PKG-098` + `DELIV-PKG-017::GAP-PKG-098` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-099` | `HYPERCARE-OPS-001::GAP-PKG-099` + `HYPERCARE-OPS-002::GAP-PKG-099` | `DELIV-PKG-010::GAP-PKG-099` + `DELIV-PKG-015::GAP-PKG-099` + `DELIV-PKG-020::GAP-PKG-099` | `HYPERCARE-OPS-003::GAP-PKG-099` + `HYPERCARE-OPS-004::GAP-PKG-099` + `DELIV-PKG-017::GAP-PKG-099` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-100` | `HYPERCARE-OPS-001::GAP-PKG-100` + `HYPERCARE-OPS-002::GAP-PKG-100` | `DELIV-PKG-010::GAP-PKG-100` + `DELIV-PKG-015::GAP-PKG-100` + `DELIV-PKG-020::GAP-PKG-100` | `HYPERCARE-OPS-003::GAP-PKG-100` + `HYPERCARE-OPS-004::GAP-PKG-100` + `DELIV-PKG-017::GAP-PKG-100` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-101` | `HYPERCARE-OPS-001::GAP-PKG-101` + `HYPERCARE-OPS-002::GAP-PKG-101` | `DELIV-PKG-010::GAP-PKG-101` + `DELIV-PKG-015::GAP-PKG-101` + `DELIV-PKG-020::GAP-PKG-101` | `HYPERCARE-OPS-003::GAP-PKG-101` + `HYPERCARE-OPS-004::GAP-PKG-101` + `DELIV-PKG-017::GAP-PKG-101` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-102` | `HYPERCARE-OPS-001::GAP-PKG-102` + `HYPERCARE-OPS-002::GAP-PKG-102` | `DELIV-PKG-010::GAP-PKG-102` + `DELIV-PKG-015::GAP-PKG-102` + `DELIV-PKG-020::GAP-PKG-102` | `HYPERCARE-OPS-003::GAP-PKG-102` + `HYPERCARE-OPS-004::GAP-PKG-102` + `DELIV-PKG-017::GAP-PKG-102` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-103` | `HYPERCARE-OPS-001::GAP-PKG-103` + `HYPERCARE-OPS-002::GAP-PKG-103` | `DELIV-PKG-010::GAP-PKG-103` + `DELIV-PKG-015::GAP-PKG-103` + `DELIV-PKG-020::GAP-PKG-103` | `HYPERCARE-OPS-003::GAP-PKG-103` + `HYPERCARE-OPS-004::GAP-PKG-103` + `DELIV-PKG-017::GAP-PKG-103` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-104` | `HYPERCARE-OPS-001::GAP-PKG-104` + `HYPERCARE-OPS-002::GAP-PKG-104` | `DELIV-PKG-010::GAP-PKG-104` + `DELIV-PKG-015::GAP-PKG-104` + `DELIV-PKG-020::GAP-PKG-104` | `HYPERCARE-OPS-003::GAP-PKG-104` + `HYPERCARE-OPS-004::GAP-PKG-104` + `DELIV-PKG-017::GAP-PKG-104` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-105` | `HYPERCARE-OPS-001::GAP-PKG-105` + `HYPERCARE-OPS-002::GAP-PKG-105` | `DELIV-PKG-010::GAP-PKG-105` + `DELIV-PKG-015::GAP-PKG-105` + `DELIV-PKG-020::GAP-PKG-105` | `HYPERCARE-OPS-003::GAP-PKG-105` + `HYPERCARE-OPS-004::GAP-PKG-105` + `DELIV-PKG-017::GAP-PKG-105` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-106` | `HYPERCARE-OPS-001::GAP-PKG-106` + `HYPERCARE-OPS-002::GAP-PKG-106` | `DELIV-PKG-010::GAP-PKG-106` + `DELIV-PKG-015::GAP-PKG-106` + `DELIV-PKG-020::GAP-PKG-106` | `HYPERCARE-OPS-003::GAP-PKG-106` + `HYPERCARE-OPS-004::GAP-PKG-106` + `DELIV-PKG-017::GAP-PKG-106` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-107` | `HYPERCARE-OPS-001::GAP-PKG-107` + `HYPERCARE-OPS-002::GAP-PKG-107` | `DELIV-PKG-010::GAP-PKG-107` + `DELIV-PKG-015::GAP-PKG-107` + `DELIV-PKG-020::GAP-PKG-107` | `HYPERCARE-OPS-003::GAP-PKG-107` + `HYPERCARE-OPS-004::GAP-PKG-107` + `DELIV-PKG-017::GAP-PKG-107` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-108` | `HYPERCARE-OPS-001::GAP-PKG-108` + `HYPERCARE-OPS-002::GAP-PKG-108` | `DELIV-PKG-010::GAP-PKG-108` + `DELIV-PKG-015::GAP-PKG-108` + `DELIV-PKG-020::GAP-PKG-108` | `HYPERCARE-OPS-003::GAP-PKG-108` + `HYPERCARE-OPS-004::GAP-PKG-108` + `DELIV-PKG-017::GAP-PKG-108` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-109` | `HYPERCARE-OPS-001::GAP-PKG-109` + `HYPERCARE-OPS-002::GAP-PKG-109` | `DELIV-PKG-010::GAP-PKG-109` + `DELIV-PKG-015::GAP-PKG-109` + `DELIV-PKG-020::GAP-PKG-109` | `HYPERCARE-OPS-003::GAP-PKG-109` + `HYPERCARE-OPS-004::GAP-PKG-109` + `DELIV-PKG-017::GAP-PKG-109` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-110` | `HYPERCARE-OPS-001::GAP-PKG-110` + `HYPERCARE-OPS-002::GAP-PKG-110` | `DELIV-PKG-010::GAP-PKG-110` + `DELIV-PKG-015::GAP-PKG-110` + `DELIV-PKG-020::GAP-PKG-110` | `HYPERCARE-OPS-003::GAP-PKG-110` + `HYPERCARE-OPS-004::GAP-PKG-110` + `DELIV-PKG-017::GAP-PKG-110` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-111` | `HYPERCARE-OPS-001::GAP-PKG-111` + `HYPERCARE-OPS-002::GAP-PKG-111` | `DELIV-PKG-010::GAP-PKG-111` + `DELIV-PKG-015::GAP-PKG-111` + `DELIV-PKG-020::GAP-PKG-111` | `HYPERCARE-OPS-003::GAP-PKG-111` + `HYPERCARE-OPS-004::GAP-PKG-111` + `DELIV-PKG-017::GAP-PKG-111` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-112` | `HYPERCARE-OPS-001::GAP-PKG-112` + `HYPERCARE-OPS-002::GAP-PKG-112` | `DELIV-PKG-010::GAP-PKG-112` + `DELIV-PKG-015::GAP-PKG-112` + `DELIV-PKG-020::GAP-PKG-112` | `HYPERCARE-OPS-003::GAP-PKG-112` + `HYPERCARE-OPS-004::GAP-PKG-112` + `DELIV-PKG-017::GAP-PKG-112` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-113` | `HYPERCARE-OPS-001::GAP-PKG-113` + `HYPERCARE-OPS-002::GAP-PKG-113` | `DELIV-PKG-010::GAP-PKG-113` + `DELIV-PKG-015::GAP-PKG-113` + `DELIV-PKG-020::GAP-PKG-113` | `HYPERCARE-OPS-003::GAP-PKG-113` + `HYPERCARE-OPS-004::GAP-PKG-113` + `DELIV-PKG-017::GAP-PKG-113` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-114` | `HYPERCARE-OPS-001::GAP-PKG-114` + `HYPERCARE-OPS-002::GAP-PKG-114` | `DELIV-PKG-010::GAP-PKG-114` + `DELIV-PKG-015::GAP-PKG-114` + `DELIV-PKG-020::GAP-PKG-114` | `HYPERCARE-OPS-003::GAP-PKG-114` + `HYPERCARE-OPS-004::GAP-PKG-114` + `DELIV-PKG-017::GAP-PKG-114` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-115` | `HYPERCARE-OPS-001::GAP-PKG-115` + `HYPERCARE-OPS-002::GAP-PKG-115` | `DELIV-PKG-010::GAP-PKG-115` + `DELIV-PKG-015::GAP-PKG-115` + `DELIV-PKG-020::GAP-PKG-115` | `HYPERCARE-OPS-003::GAP-PKG-115` + `HYPERCARE-OPS-004::GAP-PKG-115` + `DELIV-PKG-017::GAP-PKG-115` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-116` | `HYPERCARE-OPS-001::GAP-PKG-116` + `HYPERCARE-OPS-002::GAP-PKG-116` | `DELIV-PKG-010::GAP-PKG-116` + `DELIV-PKG-015::GAP-PKG-116` + `DELIV-PKG-020::GAP-PKG-116` | `HYPERCARE-OPS-003::GAP-PKG-116` + `HYPERCARE-OPS-004::GAP-PKG-116` + `DELIV-PKG-017::GAP-PKG-116` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-117` | `HYPERCARE-OPS-001::GAP-PKG-117` + `HYPERCARE-OPS-002::GAP-PKG-117` | `DELIV-PKG-010::GAP-PKG-117` + `DELIV-PKG-015::GAP-PKG-117` + `DELIV-PKG-020::GAP-PKG-117` | `HYPERCARE-OPS-003::GAP-PKG-117` + `HYPERCARE-OPS-004::GAP-PKG-117` + `DELIV-PKG-017::GAP-PKG-117` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-118` | `HYPERCARE-OPS-001::GAP-PKG-118` + `HYPERCARE-OPS-002::GAP-PKG-118` | `DELIV-PKG-010::GAP-PKG-118` + `DELIV-PKG-015::GAP-PKG-118` + `DELIV-PKG-020::GAP-PKG-118` | `HYPERCARE-OPS-003::GAP-PKG-118` + `HYPERCARE-OPS-004::GAP-PKG-118` + `DELIV-PKG-017::GAP-PKG-118` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-119` | `HYPERCARE-OPS-001::GAP-PKG-119` + `HYPERCARE-OPS-002::GAP-PKG-119` | `DELIV-PKG-010::GAP-PKG-119` + `DELIV-PKG-015::GAP-PKG-119` + `DELIV-PKG-020::GAP-PKG-119` | `HYPERCARE-OPS-003::GAP-PKG-119` + `HYPERCARE-OPS-004::GAP-PKG-119` + `DELIV-PKG-017::GAP-PKG-119` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-120` | `HYPERCARE-OPS-001::GAP-PKG-120` + `HYPERCARE-OPS-002::GAP-PKG-120` | `DELIV-PKG-010::GAP-PKG-120` + `DELIV-PKG-015::GAP-PKG-120` + `DELIV-PKG-020::GAP-PKG-120` | `HYPERCARE-OPS-003::GAP-PKG-120` + `HYPERCARE-OPS-004::GAP-PKG-120` + `DELIV-PKG-017::GAP-PKG-120` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-121` | `HYPERCARE-OPS-001::GAP-PKG-121` + `HYPERCARE-OPS-002::GAP-PKG-121` | `DELIV-PKG-010::GAP-PKG-121` + `DELIV-PKG-015::GAP-PKG-121` + `DELIV-PKG-020::GAP-PKG-121` | `HYPERCARE-OPS-003::GAP-PKG-121` + `HYPERCARE-OPS-004::GAP-PKG-121` + `DELIV-PKG-017::GAP-PKG-121` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-122` | `HYPERCARE-OPS-001::GAP-PKG-122` + `HYPERCARE-OPS-002::GAP-PKG-122` | `DELIV-PKG-010::GAP-PKG-122` + `DELIV-PKG-015::GAP-PKG-122` + `DELIV-PKG-020::GAP-PKG-122` | `HYPERCARE-OPS-003::GAP-PKG-122` + `HYPERCARE-OPS-004::GAP-PKG-122` + `DELIV-PKG-017::GAP-PKG-122` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-123` | `HYPERCARE-OPS-001::GAP-PKG-123` + `HYPERCARE-OPS-002::GAP-PKG-123` | `DELIV-PKG-010::GAP-PKG-123` + `DELIV-PKG-015::GAP-PKG-123` + `DELIV-PKG-020::GAP-PKG-123` | `HYPERCARE-OPS-003::GAP-PKG-123` + `HYPERCARE-OPS-004::GAP-PKG-123` + `DELIV-PKG-017::GAP-PKG-123` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-124` | `HYPERCARE-OPS-001::GAP-PKG-124` + `HYPERCARE-OPS-002::GAP-PKG-124` | `DELIV-PKG-010::GAP-PKG-124` + `DELIV-PKG-015::GAP-PKG-124` + `DELIV-PKG-020::GAP-PKG-124` | `HYPERCARE-OPS-003::GAP-PKG-124` + `HYPERCARE-OPS-004::GAP-PKG-124` + `DELIV-PKG-017::GAP-PKG-124` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-125` | `HYPERCARE-OPS-001::GAP-PKG-125` + `HYPERCARE-OPS-002::GAP-PKG-125` | `DELIV-PKG-010::GAP-PKG-125` + `DELIV-PKG-015::GAP-PKG-125` + `DELIV-PKG-020::GAP-PKG-125` | `HYPERCARE-OPS-003::GAP-PKG-125` + `HYPERCARE-OPS-004::GAP-PKG-125` + `DELIV-PKG-017::GAP-PKG-125` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-126` | `HYPERCARE-OPS-001::GAP-PKG-126` + `HYPERCARE-OPS-002::GAP-PKG-126` | `DELIV-PKG-010::GAP-PKG-126` + `DELIV-PKG-015::GAP-PKG-126` + `DELIV-PKG-020::GAP-PKG-126` | `HYPERCARE-OPS-003::GAP-PKG-126` + `HYPERCARE-OPS-004::GAP-PKG-126` + `DELIV-PKG-017::GAP-PKG-126` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-127` | `HYPERCARE-OPS-001::GAP-PKG-127` + `HYPERCARE-OPS-002::GAP-PKG-127` | `DELIV-PKG-010::GAP-PKG-127` + `DELIV-PKG-015::GAP-PKG-127` + `DELIV-PKG-020::GAP-PKG-127` | `HYPERCARE-OPS-003::GAP-PKG-127` + `HYPERCARE-OPS-004::GAP-PKG-127` + `DELIV-PKG-017::GAP-PKG-127` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-128` | `HYPERCARE-OPS-001::GAP-PKG-128` + `HYPERCARE-OPS-002::GAP-PKG-128` | `DELIV-PKG-010::GAP-PKG-128` + `DELIV-PKG-015::GAP-PKG-128` + `DELIV-PKG-020::GAP-PKG-128` | `HYPERCARE-OPS-003::GAP-PKG-128` + `HYPERCARE-OPS-004::GAP-PKG-128` + `DELIV-PKG-017::GAP-PKG-128` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-129` | `HYPERCARE-OPS-001::GAP-PKG-129` + `HYPERCARE-OPS-002::GAP-PKG-129` | `DELIV-PKG-010::GAP-PKG-129` + `DELIV-PKG-015::GAP-PKG-129` + `DELIV-PKG-020::GAP-PKG-129` | `HYPERCARE-OPS-003::GAP-PKG-129` + `HYPERCARE-OPS-004::GAP-PKG-129` + `DELIV-PKG-017::GAP-PKG-129` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-130` | `HYPERCARE-OPS-001::GAP-PKG-130` + `HYPERCARE-OPS-002::GAP-PKG-130` | `DELIV-PKG-010::GAP-PKG-130` + `DELIV-PKG-015::GAP-PKG-130` + `DELIV-PKG-020::GAP-PKG-130` | `HYPERCARE-OPS-003::GAP-PKG-130` + `HYPERCARE-OPS-004::GAP-PKG-130` + `DELIV-PKG-017::GAP-PKG-130` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-131` | `HYPERCARE-OPS-001::GAP-PKG-131` + `HYPERCARE-OPS-002::GAP-PKG-131` | `DELIV-PKG-010::GAP-PKG-131` + `DELIV-PKG-015::GAP-PKG-131` + `DELIV-PKG-020::GAP-PKG-131` | `HYPERCARE-OPS-003::GAP-PKG-131` + `HYPERCARE-OPS-004::GAP-PKG-131` + `DELIV-PKG-017::GAP-PKG-131` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-132` | `HYPERCARE-OPS-001::GAP-PKG-132` + `HYPERCARE-OPS-002::GAP-PKG-132` | `DELIV-PKG-010::GAP-PKG-132` + `DELIV-PKG-015::GAP-PKG-132` + `DELIV-PKG-020::GAP-PKG-132` | `HYPERCARE-OPS-003::GAP-PKG-132` + `HYPERCARE-OPS-004::GAP-PKG-132` + `DELIV-PKG-017::GAP-PKG-132` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-133` | `HYPERCARE-OPS-001::GAP-PKG-133` + `HYPERCARE-OPS-002::GAP-PKG-133` | `DELIV-PKG-010::GAP-PKG-133` + `DELIV-PKG-015::GAP-PKG-133` + `DELIV-PKG-020::GAP-PKG-133` | `HYPERCARE-OPS-003::GAP-PKG-133` + `HYPERCARE-OPS-004::GAP-PKG-133` + `DELIV-PKG-017::GAP-PKG-133` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-134` | `HYPERCARE-OPS-001::GAP-PKG-134` + `HYPERCARE-OPS-002::GAP-PKG-134` | `DELIV-PKG-010::GAP-PKG-134` + `DELIV-PKG-015::GAP-PKG-134` + `DELIV-PKG-020::GAP-PKG-134` | `HYPERCARE-OPS-003::GAP-PKG-134` + `HYPERCARE-OPS-004::GAP-PKG-134` + `DELIV-PKG-017::GAP-PKG-134` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-135` | `HYPERCARE-OPS-001::GAP-PKG-135` + `HYPERCARE-OPS-002::GAP-PKG-135` | `DELIV-PKG-010::GAP-PKG-135` + `DELIV-PKG-015::GAP-PKG-135` + `DELIV-PKG-020::GAP-PKG-135` | `HYPERCARE-OPS-003::GAP-PKG-135` + `HYPERCARE-OPS-004::GAP-PKG-135` + `DELIV-PKG-017::GAP-PKG-135` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-136` | `HYPERCARE-OPS-001::GAP-PKG-136` + `HYPERCARE-OPS-002::GAP-PKG-136` | `DELIV-PKG-010::GAP-PKG-136` + `DELIV-PKG-015::GAP-PKG-136` + `DELIV-PKG-020::GAP-PKG-136` | `HYPERCARE-OPS-003::GAP-PKG-136` + `HYPERCARE-OPS-004::GAP-PKG-136` + `DELIV-PKG-017::GAP-PKG-136` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-137` | `HYPERCARE-OPS-001::GAP-PKG-137` + `HYPERCARE-OPS-002::GAP-PKG-137` | `DELIV-PKG-010::GAP-PKG-137` + `DELIV-PKG-015::GAP-PKG-137` + `DELIV-PKG-020::GAP-PKG-137` | `HYPERCARE-OPS-003::GAP-PKG-137` + `HYPERCARE-OPS-004::GAP-PKG-137` + `DELIV-PKG-017::GAP-PKG-137` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-138` | `HYPERCARE-OPS-001::GAP-PKG-138` + `HYPERCARE-OPS-002::GAP-PKG-138` | `DELIV-PKG-010::GAP-PKG-138` + `DELIV-PKG-015::GAP-PKG-138` + `DELIV-PKG-020::GAP-PKG-138` | `HYPERCARE-OPS-003::GAP-PKG-138` + `HYPERCARE-OPS-004::GAP-PKG-138` + `DELIV-PKG-017::GAP-PKG-138` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-139` | `HYPERCARE-OPS-001::GAP-PKG-139` + `HYPERCARE-OPS-002::GAP-PKG-139` | `DELIV-PKG-010::GAP-PKG-139` + `DELIV-PKG-015::GAP-PKG-139` + `DELIV-PKG-020::GAP-PKG-139` | `HYPERCARE-OPS-003::GAP-PKG-139` + `HYPERCARE-OPS-004::GAP-PKG-139` + `DELIV-PKG-017::GAP-PKG-139` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-140` | `HYPERCARE-OPS-001::GAP-PKG-140` + `HYPERCARE-OPS-002::GAP-PKG-140` | `DELIV-PKG-010::GAP-PKG-140` + `DELIV-PKG-015::GAP-PKG-140` + `DELIV-PKG-020::GAP-PKG-140` | `HYPERCARE-OPS-003::GAP-PKG-140` + `HYPERCARE-OPS-004::GAP-PKG-140` + `DELIV-PKG-017::GAP-PKG-140` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-141` | `HYPERCARE-OPS-001::GAP-PKG-141` + `HYPERCARE-OPS-002::GAP-PKG-141` | `DELIV-PKG-010::GAP-PKG-141` + `DELIV-PKG-015::GAP-PKG-141` + `DELIV-PKG-020::GAP-PKG-141` | `HYPERCARE-OPS-003::GAP-PKG-141` + `HYPERCARE-OPS-004::GAP-PKG-141` + `DELIV-PKG-017::GAP-PKG-141` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-142` | `HYPERCARE-OPS-001::GAP-PKG-142` + `HYPERCARE-OPS-002::GAP-PKG-142` | `DELIV-PKG-010::GAP-PKG-142` + `DELIV-PKG-015::GAP-PKG-142` + `DELIV-PKG-020::GAP-PKG-142` | `HYPERCARE-OPS-003::GAP-PKG-142` + `HYPERCARE-OPS-004::GAP-PKG-142` + `DELIV-PKG-017::GAP-PKG-142` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-143` | `HYPERCARE-OPS-001::GAP-PKG-143` + `HYPERCARE-OPS-002::GAP-PKG-143` | `DELIV-PKG-010::GAP-PKG-143` + `DELIV-PKG-015::GAP-PKG-143` + `DELIV-PKG-020::GAP-PKG-143` | `HYPERCARE-OPS-003::GAP-PKG-143` + `HYPERCARE-OPS-004::GAP-PKG-143` + `DELIV-PKG-017::GAP-PKG-143` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-144` | `HYPERCARE-OPS-001::GAP-PKG-144` + `HYPERCARE-OPS-002::GAP-PKG-144` | `DELIV-PKG-010::GAP-PKG-144` + `DELIV-PKG-015::GAP-PKG-144` + `DELIV-PKG-020::GAP-PKG-144` | `HYPERCARE-OPS-003::GAP-PKG-144` + `HYPERCARE-OPS-004::GAP-PKG-144` + `DELIV-PKG-017::GAP-PKG-144` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-145` | `HYPERCARE-OPS-001::GAP-PKG-145` + `HYPERCARE-OPS-002::GAP-PKG-145` | `DELIV-PKG-010::GAP-PKG-145` + `DELIV-PKG-015::GAP-PKG-145` + `DELIV-PKG-020::GAP-PKG-145` | `HYPERCARE-OPS-003::GAP-PKG-145` + `HYPERCARE-OPS-004::GAP-PKG-145` + `DELIV-PKG-017::GAP-PKG-145` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-146` | `HYPERCARE-OPS-001::GAP-PKG-146` + `HYPERCARE-OPS-002::GAP-PKG-146` | `DELIV-PKG-010::GAP-PKG-146` + `DELIV-PKG-015::GAP-PKG-146` + `DELIV-PKG-020::GAP-PKG-146` | `HYPERCARE-OPS-003::GAP-PKG-146` + `HYPERCARE-OPS-004::GAP-PKG-146` + `DELIV-PKG-017::GAP-PKG-146` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-147` | `HYPERCARE-OPS-001::GAP-PKG-147` + `HYPERCARE-OPS-002::GAP-PKG-147` | `DELIV-PKG-010::GAP-PKG-147` + `DELIV-PKG-015::GAP-PKG-147` + `DELIV-PKG-020::GAP-PKG-147` | `HYPERCARE-OPS-003::GAP-PKG-147` + `HYPERCARE-OPS-004::GAP-PKG-147` + `DELIV-PKG-017::GAP-PKG-147` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-148` | `HYPERCARE-OPS-001::GAP-PKG-148` + `HYPERCARE-OPS-002::GAP-PKG-148` | `DELIV-PKG-010::GAP-PKG-148` + `DELIV-PKG-015::GAP-PKG-148` + `DELIV-PKG-020::GAP-PKG-148` | `HYPERCARE-OPS-003::GAP-PKG-148` + `HYPERCARE-OPS-004::GAP-PKG-148` + `DELIV-PKG-017::GAP-PKG-148` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-149` | `HYPERCARE-OPS-001::GAP-PKG-149` + `HYPERCARE-OPS-002::GAP-PKG-149` | `DELIV-PKG-010::GAP-PKG-149` + `DELIV-PKG-015::GAP-PKG-149` + `DELIV-PKG-020::GAP-PKG-149` | `HYPERCARE-OPS-003::GAP-PKG-149` + `HYPERCARE-OPS-004::GAP-PKG-149` + `DELIV-PKG-017::GAP-PKG-149` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-150` | `HYPERCARE-OPS-001::GAP-PKG-150` + `HYPERCARE-OPS-002::GAP-PKG-150` | `DELIV-PKG-010::GAP-PKG-150` + `DELIV-PKG-015::GAP-PKG-150` + `DELIV-PKG-020::GAP-PKG-150` | `HYPERCARE-OPS-003::GAP-PKG-150` + `HYPERCARE-OPS-004::GAP-PKG-150` + `DELIV-PKG-017::GAP-PKG-150` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-151` | `HYPERCARE-OPS-001::GAP-PKG-151` + `HYPERCARE-OPS-002::GAP-PKG-151` | `DELIV-PKG-010::GAP-PKG-151` + `DELIV-PKG-015::GAP-PKG-151` + `DELIV-PKG-020::GAP-PKG-151` | `HYPERCARE-OPS-003::GAP-PKG-151` + `HYPERCARE-OPS-004::GAP-PKG-151` + `DELIV-PKG-017::GAP-PKG-151` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-152` | `HYPERCARE-OPS-001::GAP-PKG-152` + `HYPERCARE-OPS-002::GAP-PKG-152` | `DELIV-PKG-010::GAP-PKG-152` + `DELIV-PKG-015::GAP-PKG-152` + `DELIV-PKG-020::GAP-PKG-152` | `HYPERCARE-OPS-003::GAP-PKG-152` + `HYPERCARE-OPS-004::GAP-PKG-152` + `DELIV-PKG-017::GAP-PKG-152` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-153` | `HYPERCARE-OPS-001::GAP-PKG-153` + `HYPERCARE-OPS-002::GAP-PKG-153` | `DELIV-PKG-010::GAP-PKG-153` + `DELIV-PKG-015::GAP-PKG-153` + `DELIV-PKG-020::GAP-PKG-153` | `HYPERCARE-OPS-003::GAP-PKG-153` + `HYPERCARE-OPS-004::GAP-PKG-153` + `DELIV-PKG-017::GAP-PKG-153` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-154` | `HYPERCARE-OPS-001::GAP-PKG-154` + `HYPERCARE-OPS-002::GAP-PKG-154` | `DELIV-PKG-010::GAP-PKG-154` + `DELIV-PKG-015::GAP-PKG-154` + `DELIV-PKG-020::GAP-PKG-154` | `HYPERCARE-OPS-003::GAP-PKG-154` + `HYPERCARE-OPS-004::GAP-PKG-154` + `DELIV-PKG-017::GAP-PKG-154` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-155` | `HYPERCARE-OPS-001::GAP-PKG-155` + `HYPERCARE-OPS-002::GAP-PKG-155` | `DELIV-PKG-010::GAP-PKG-155` + `DELIV-PKG-015::GAP-PKG-155` + `DELIV-PKG-020::GAP-PKG-155` | `HYPERCARE-OPS-003::GAP-PKG-155` + `HYPERCARE-OPS-004::GAP-PKG-155` + `DELIV-PKG-017::GAP-PKG-155` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-156` | `HYPERCARE-OPS-001::GAP-PKG-156` + `HYPERCARE-OPS-002::GAP-PKG-156` | `DELIV-PKG-010::GAP-PKG-156` + `DELIV-PKG-015::GAP-PKG-156` + `DELIV-PKG-020::GAP-PKG-156` | `HYPERCARE-OPS-003::GAP-PKG-156` + `HYPERCARE-OPS-004::GAP-PKG-156` + `DELIV-PKG-017::GAP-PKG-156` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-157` | `HYPERCARE-OPS-001::GAP-PKG-157` + `HYPERCARE-OPS-002::GAP-PKG-157` | `DELIV-PKG-010::GAP-PKG-157` + `DELIV-PKG-015::GAP-PKG-157` + `DELIV-PKG-020::GAP-PKG-157` | `HYPERCARE-OPS-003::GAP-PKG-157` + `HYPERCARE-OPS-004::GAP-PKG-157` + `DELIV-PKG-017::GAP-PKG-157` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-158` | `HYPERCARE-OPS-001::GAP-PKG-158` + `HYPERCARE-OPS-002::GAP-PKG-158` | `DELIV-PKG-010::GAP-PKG-158` + `DELIV-PKG-015::GAP-PKG-158` + `DELIV-PKG-020::GAP-PKG-158` | `HYPERCARE-OPS-003::GAP-PKG-158` + `HYPERCARE-OPS-004::GAP-PKG-158` + `DELIV-PKG-017::GAP-PKG-158` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-159` | `HYPERCARE-OPS-001::GAP-PKG-159` + `HYPERCARE-OPS-002::GAP-PKG-159` | `DELIV-PKG-010::GAP-PKG-159` + `DELIV-PKG-015::GAP-PKG-159` + `DELIV-PKG-020::GAP-PKG-159` | `HYPERCARE-OPS-003::GAP-PKG-159` + `HYPERCARE-OPS-004::GAP-PKG-159` + `DELIV-PKG-017::GAP-PKG-159` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-160` | `HYPERCARE-OPS-001::GAP-PKG-160` + `HYPERCARE-OPS-002::GAP-PKG-160` | `DELIV-PKG-010::GAP-PKG-160` + `DELIV-PKG-015::GAP-PKG-160` + `DELIV-PKG-020::GAP-PKG-160` | `HYPERCARE-OPS-003::GAP-PKG-160` + `HYPERCARE-OPS-004::GAP-PKG-160` + `DELIV-PKG-017::GAP-PKG-160` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-161` | `HYPERCARE-OPS-001::GAP-PKG-161` + `HYPERCARE-OPS-002::GAP-PKG-161` | `DELIV-PKG-010::GAP-PKG-161` + `DELIV-PKG-015::GAP-PKG-161` + `DELIV-PKG-020::GAP-PKG-161` | `HYPERCARE-OPS-003::GAP-PKG-161` + `HYPERCARE-OPS-004::GAP-PKG-161` + `DELIV-PKG-017::GAP-PKG-161` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-162` | `HYPERCARE-OPS-001::GAP-PKG-162` + `HYPERCARE-OPS-002::GAP-PKG-162` | `DELIV-PKG-010::GAP-PKG-162` + `DELIV-PKG-015::GAP-PKG-162` + `DELIV-PKG-020::GAP-PKG-162` | `HYPERCARE-OPS-003::GAP-PKG-162` + `HYPERCARE-OPS-004::GAP-PKG-162` + `DELIV-PKG-017::GAP-PKG-162` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-163` | `HYPERCARE-OPS-001::GAP-PKG-163` + `HYPERCARE-OPS-002::GAP-PKG-163` | `DELIV-PKG-010::GAP-PKG-163` + `DELIV-PKG-015::GAP-PKG-163` + `DELIV-PKG-020::GAP-PKG-163` | `HYPERCARE-OPS-003::GAP-PKG-163` + `HYPERCARE-OPS-004::GAP-PKG-163` + `DELIV-PKG-017::GAP-PKG-163` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-164` | `HYPERCARE-OPS-001::GAP-PKG-164` + `HYPERCARE-OPS-002::GAP-PKG-164` | `DELIV-PKG-010::GAP-PKG-164` + `DELIV-PKG-015::GAP-PKG-164` + `DELIV-PKG-020::GAP-PKG-164` | `HYPERCARE-OPS-003::GAP-PKG-164` + `HYPERCARE-OPS-004::GAP-PKG-164` + `DELIV-PKG-017::GAP-PKG-164` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-165` | `HYPERCARE-OPS-001::GAP-PKG-165` + `HYPERCARE-OPS-002::GAP-PKG-165` | `DELIV-PKG-010::GAP-PKG-165` + `DELIV-PKG-015::GAP-PKG-165` + `DELIV-PKG-020::GAP-PKG-165` | `HYPERCARE-OPS-003::GAP-PKG-165` + `HYPERCARE-OPS-004::GAP-PKG-165` + `DELIV-PKG-017::GAP-PKG-165` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-166` | `HYPERCARE-OPS-001::GAP-PKG-166` + `HYPERCARE-OPS-002::GAP-PKG-166` | `DELIV-PKG-010::GAP-PKG-166` + `DELIV-PKG-015::GAP-PKG-166` + `DELIV-PKG-020::GAP-PKG-166` | `HYPERCARE-OPS-003::GAP-PKG-166` + `HYPERCARE-OPS-004::GAP-PKG-166` + `DELIV-PKG-017::GAP-PKG-166` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-167` | `HYPERCARE-OPS-001::GAP-PKG-167` + `HYPERCARE-OPS-002::GAP-PKG-167` | `DELIV-PKG-010::GAP-PKG-167` + `DELIV-PKG-015::GAP-PKG-167` + `DELIV-PKG-020::GAP-PKG-167` | `HYPERCARE-OPS-003::GAP-PKG-167` + `HYPERCARE-OPS-004::GAP-PKG-167` + `DELIV-PKG-017::GAP-PKG-167` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-168` | `HYPERCARE-OPS-001::GAP-PKG-168` + `HYPERCARE-OPS-002::GAP-PKG-168` | `DELIV-PKG-010::GAP-PKG-168` + `DELIV-PKG-015::GAP-PKG-168` + `DELIV-PKG-020::GAP-PKG-168` | `HYPERCARE-OPS-003::GAP-PKG-168` + `HYPERCARE-OPS-004::GAP-PKG-168` + `DELIV-PKG-017::GAP-PKG-168` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-169` | `HYPERCARE-OPS-001::GAP-PKG-169` + `HYPERCARE-OPS-002::GAP-PKG-169` | `DELIV-PKG-010::GAP-PKG-169` + `DELIV-PKG-015::GAP-PKG-169` + `DELIV-PKG-020::GAP-PKG-169` | `HYPERCARE-OPS-003::GAP-PKG-169` + `HYPERCARE-OPS-004::GAP-PKG-169` + `DELIV-PKG-017::GAP-PKG-169` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-170` | `HYPERCARE-OPS-001::GAP-PKG-170` + `HYPERCARE-OPS-002::GAP-PKG-170` | `DELIV-PKG-010::GAP-PKG-170` + `DELIV-PKG-015::GAP-PKG-170` + `DELIV-PKG-020::GAP-PKG-170` | `HYPERCARE-OPS-003::GAP-PKG-170` + `HYPERCARE-OPS-004::GAP-PKG-170` + `DELIV-PKG-017::GAP-PKG-170` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-171` | `HYPERCARE-OPS-001::GAP-PKG-171` + `HYPERCARE-OPS-002::GAP-PKG-171` | `DELIV-PKG-010::GAP-PKG-171` + `DELIV-PKG-015::GAP-PKG-171` + `DELIV-PKG-020::GAP-PKG-171` | `HYPERCARE-OPS-003::GAP-PKG-171` + `HYPERCARE-OPS-004::GAP-PKG-171` + `DELIV-PKG-017::GAP-PKG-171` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-172` | `HYPERCARE-OPS-001::GAP-PKG-172` + `HYPERCARE-OPS-002::GAP-PKG-172` | `DELIV-PKG-010::GAP-PKG-172` + `DELIV-PKG-015::GAP-PKG-172` + `DELIV-PKG-020::GAP-PKG-172` | `HYPERCARE-OPS-003::GAP-PKG-172` + `HYPERCARE-OPS-004::GAP-PKG-172` + `DELIV-PKG-017::GAP-PKG-172` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-173` | `HYPERCARE-OPS-001::GAP-PKG-173` + `HYPERCARE-OPS-002::GAP-PKG-173` | `DELIV-PKG-010::GAP-PKG-173` + `DELIV-PKG-015::GAP-PKG-173` + `DELIV-PKG-020::GAP-PKG-173` | `HYPERCARE-OPS-003::GAP-PKG-173` + `HYPERCARE-OPS-004::GAP-PKG-173` + `DELIV-PKG-017::GAP-PKG-173` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-174` | `HYPERCARE-OPS-001::GAP-PKG-174` + `HYPERCARE-OPS-002::GAP-PKG-174` | `DELIV-PKG-010::GAP-PKG-174` + `DELIV-PKG-015::GAP-PKG-174` + `DELIV-PKG-020::GAP-PKG-174` | `HYPERCARE-OPS-003::GAP-PKG-174` + `HYPERCARE-OPS-004::GAP-PKG-174` + `DELIV-PKG-017::GAP-PKG-174` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-175` | `HYPERCARE-OPS-001::GAP-PKG-175` + `HYPERCARE-OPS-002::GAP-PKG-175` | `DELIV-PKG-010::GAP-PKG-175` + `DELIV-PKG-015::GAP-PKG-175` + `DELIV-PKG-020::GAP-PKG-175` | `HYPERCARE-OPS-003::GAP-PKG-175` + `HYPERCARE-OPS-004::GAP-PKG-175` + `DELIV-PKG-017::GAP-PKG-175` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-176` | `HYPERCARE-OPS-001::GAP-PKG-176` + `HYPERCARE-OPS-002::GAP-PKG-176` | `DELIV-PKG-010::GAP-PKG-176` + `DELIV-PKG-015::GAP-PKG-176` + `DELIV-PKG-020::GAP-PKG-176` | `HYPERCARE-OPS-003::GAP-PKG-176` + `HYPERCARE-OPS-004::GAP-PKG-176` + `DELIV-PKG-017::GAP-PKG-176` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-177` | `HYPERCARE-OPS-001::GAP-PKG-177` + `HYPERCARE-OPS-002::GAP-PKG-177` | `DELIV-PKG-010::GAP-PKG-177` + `DELIV-PKG-015::GAP-PKG-177` + `DELIV-PKG-020::GAP-PKG-177` | `HYPERCARE-OPS-003::GAP-PKG-177` + `HYPERCARE-OPS-004::GAP-PKG-177` + `DELIV-PKG-017::GAP-PKG-177` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-178` | `HYPERCARE-OPS-001::GAP-PKG-178` + `HYPERCARE-OPS-002::GAP-PKG-178` | `DELIV-PKG-010::GAP-PKG-178` + `DELIV-PKG-015::GAP-PKG-178` + `DELIV-PKG-020::GAP-PKG-178` | `HYPERCARE-OPS-003::GAP-PKG-178` + `HYPERCARE-OPS-004::GAP-PKG-178` + `DELIV-PKG-017::GAP-PKG-178` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-179` | `HYPERCARE-OPS-001::GAP-PKG-179` + `HYPERCARE-OPS-002::GAP-PKG-179` | `DELIV-PKG-010::GAP-PKG-179` + `DELIV-PKG-015::GAP-PKG-179` + `DELIV-PKG-020::GAP-PKG-179` | `HYPERCARE-OPS-003::GAP-PKG-179` + `HYPERCARE-OPS-004::GAP-PKG-179` + `DELIV-PKG-017::GAP-PKG-179` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-180` | `HYPERCARE-OPS-001::GAP-PKG-180` + `HYPERCARE-OPS-002::GAP-PKG-180` | `DELIV-PKG-010::GAP-PKG-180` + `DELIV-PKG-015::GAP-PKG-180` + `DELIV-PKG-020::GAP-PKG-180` | `HYPERCARE-OPS-003::GAP-PKG-180` + `HYPERCARE-OPS-004::GAP-PKG-180` + `DELIV-PKG-017::GAP-PKG-180` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-181` | `HYPERCARE-OPS-001::GAP-PKG-181` + `HYPERCARE-OPS-002::GAP-PKG-181` | `DELIV-PKG-010::GAP-PKG-181` + `DELIV-PKG-015::GAP-PKG-181` + `DELIV-PKG-020::GAP-PKG-181` | `HYPERCARE-OPS-003::GAP-PKG-181` + `HYPERCARE-OPS-004::GAP-PKG-181` + `DELIV-PKG-017::GAP-PKG-181` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-182` | `HYPERCARE-OPS-001::GAP-PKG-182` + `HYPERCARE-OPS-002::GAP-PKG-182` | `DELIV-PKG-010::GAP-PKG-182` + `DELIV-PKG-015::GAP-PKG-182` + `DELIV-PKG-020::GAP-PKG-182` | `HYPERCARE-OPS-003::GAP-PKG-182` + `HYPERCARE-OPS-004::GAP-PKG-182` + `DELIV-PKG-017::GAP-PKG-182` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-183` | `HYPERCARE-OPS-001::GAP-PKG-183` + `HYPERCARE-OPS-002::GAP-PKG-183` | `DELIV-PKG-010::GAP-PKG-183` + `DELIV-PKG-015::GAP-PKG-183` + `DELIV-PKG-020::GAP-PKG-183` | `HYPERCARE-OPS-003::GAP-PKG-183` + `HYPERCARE-OPS-004::GAP-PKG-183` + `DELIV-PKG-017::GAP-PKG-183` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-184` | `HYPERCARE-OPS-001::GAP-PKG-184` + `HYPERCARE-OPS-002::GAP-PKG-184` | `DELIV-PKG-010::GAP-PKG-184` + `DELIV-PKG-015::GAP-PKG-184` + `DELIV-PKG-020::GAP-PKG-184` | `HYPERCARE-OPS-003::GAP-PKG-184` + `HYPERCARE-OPS-004::GAP-PKG-184` + `DELIV-PKG-017::GAP-PKG-184` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-185` | `HYPERCARE-OPS-001::GAP-PKG-185` + `HYPERCARE-OPS-002::GAP-PKG-185` | `DELIV-PKG-010::GAP-PKG-185` + `DELIV-PKG-015::GAP-PKG-185` + `DELIV-PKG-020::GAP-PKG-185` | `HYPERCARE-OPS-003::GAP-PKG-185` + `HYPERCARE-OPS-004::GAP-PKG-185` + `DELIV-PKG-017::GAP-PKG-185` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-186` | `HYPERCARE-OPS-001::GAP-PKG-186` + `HYPERCARE-OPS-002::GAP-PKG-186` | `DELIV-PKG-010::GAP-PKG-186` + `DELIV-PKG-015::GAP-PKG-186` + `DELIV-PKG-020::GAP-PKG-186` | `HYPERCARE-OPS-003::GAP-PKG-186` + `HYPERCARE-OPS-004::GAP-PKG-186` + `DELIV-PKG-017::GAP-PKG-186` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-187` | `HYPERCARE-OPS-001::GAP-PKG-187` + `HYPERCARE-OPS-002::GAP-PKG-187` | `DELIV-PKG-010::GAP-PKG-187` + `DELIV-PKG-015::GAP-PKG-187` + `DELIV-PKG-020::GAP-PKG-187` | `HYPERCARE-OPS-003::GAP-PKG-187` + `HYPERCARE-OPS-004::GAP-PKG-187` + `DELIV-PKG-017::GAP-PKG-187` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-188` | `HYPERCARE-OPS-001::GAP-PKG-188` + `HYPERCARE-OPS-002::GAP-PKG-188` | `DELIV-PKG-010::GAP-PKG-188` + `DELIV-PKG-015::GAP-PKG-188` + `DELIV-PKG-020::GAP-PKG-188` | `HYPERCARE-OPS-003::GAP-PKG-188` + `HYPERCARE-OPS-004::GAP-PKG-188` + `DELIV-PKG-017::GAP-PKG-188` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-189` | `HYPERCARE-OPS-001::GAP-PKG-189` + `HYPERCARE-OPS-002::GAP-PKG-189` | `DELIV-PKG-010::GAP-PKG-189` + `DELIV-PKG-015::GAP-PKG-189` + `DELIV-PKG-020::GAP-PKG-189` | `HYPERCARE-OPS-003::GAP-PKG-189` + `HYPERCARE-OPS-004::GAP-PKG-189` + `DELIV-PKG-017::GAP-PKG-189` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-190` | `HYPERCARE-OPS-001::GAP-PKG-190` + `HYPERCARE-OPS-002::GAP-PKG-190` | `DELIV-PKG-010::GAP-PKG-190` + `DELIV-PKG-015::GAP-PKG-190` + `DELIV-PKG-020::GAP-PKG-190` | `HYPERCARE-OPS-003::GAP-PKG-190` + `HYPERCARE-OPS-004::GAP-PKG-190` + `DELIV-PKG-017::GAP-PKG-190` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-191` | `HYPERCARE-OPS-001::GAP-PKG-191` + `HYPERCARE-OPS-002::GAP-PKG-191` | `DELIV-PKG-010::GAP-PKG-191` + `DELIV-PKG-015::GAP-PKG-191` + `DELIV-PKG-020::GAP-PKG-191` | `HYPERCARE-OPS-003::GAP-PKG-191` + `HYPERCARE-OPS-004::GAP-PKG-191` + `DELIV-PKG-017::GAP-PKG-191` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-192` | `HYPERCARE-OPS-001::GAP-PKG-192` + `HYPERCARE-OPS-002::GAP-PKG-192` | `DELIV-PKG-010::GAP-PKG-192` + `DELIV-PKG-015::GAP-PKG-192` + `DELIV-PKG-020::GAP-PKG-192` | `HYPERCARE-OPS-003::GAP-PKG-192` + `HYPERCARE-OPS-004::GAP-PKG-192` + `DELIV-PKG-017::GAP-PKG-192` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-193` | `HYPERCARE-OPS-001::GAP-PKG-193` + `HYPERCARE-OPS-002::GAP-PKG-193` | `DELIV-PKG-010::GAP-PKG-193` + `DELIV-PKG-015::GAP-PKG-193` + `DELIV-PKG-020::GAP-PKG-193` | `HYPERCARE-OPS-003::GAP-PKG-193` + `HYPERCARE-OPS-004::GAP-PKG-193` + `DELIV-PKG-017::GAP-PKG-193` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-194` | `HYPERCARE-OPS-001::GAP-PKG-194` + `HYPERCARE-OPS-002::GAP-PKG-194` | `DELIV-PKG-010::GAP-PKG-194` + `DELIV-PKG-015::GAP-PKG-194` + `DELIV-PKG-020::GAP-PKG-194` | `HYPERCARE-OPS-003::GAP-PKG-194` + `HYPERCARE-OPS-004::GAP-PKG-194` + `DELIV-PKG-017::GAP-PKG-194` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-195` | `HYPERCARE-OPS-001::GAP-PKG-195` + `HYPERCARE-OPS-002::GAP-PKG-195` | `DELIV-PKG-010::GAP-PKG-195` + `DELIV-PKG-015::GAP-PKG-195` + `DELIV-PKG-020::GAP-PKG-195` | `HYPERCARE-OPS-003::GAP-PKG-195` + `HYPERCARE-OPS-004::GAP-PKG-195` + `DELIV-PKG-017::GAP-PKG-195` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-196` | `HYPERCARE-OPS-001::GAP-PKG-196` + `HYPERCARE-OPS-002::GAP-PKG-196` | `DELIV-PKG-010::GAP-PKG-196` + `DELIV-PKG-015::GAP-PKG-196` + `DELIV-PKG-020::GAP-PKG-196` | `HYPERCARE-OPS-003::GAP-PKG-196` + `HYPERCARE-OPS-004::GAP-PKG-196` + `DELIV-PKG-017::GAP-PKG-196` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-197` | `HYPERCARE-OPS-001::GAP-PKG-197` + `HYPERCARE-OPS-002::GAP-PKG-197` | `DELIV-PKG-010::GAP-PKG-197` + `DELIV-PKG-015::GAP-PKG-197` + `DELIV-PKG-020::GAP-PKG-197` | `HYPERCARE-OPS-003::GAP-PKG-197` + `HYPERCARE-OPS-004::GAP-PKG-197` + `DELIV-PKG-017::GAP-PKG-197` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-198` | `HYPERCARE-OPS-001::GAP-PKG-198` + `HYPERCARE-OPS-002::GAP-PKG-198` | `DELIV-PKG-010::GAP-PKG-198` + `DELIV-PKG-015::GAP-PKG-198` + `DELIV-PKG-020::GAP-PKG-198` | `HYPERCARE-OPS-003::GAP-PKG-198` + `HYPERCARE-OPS-004::GAP-PKG-198` + `DELIV-PKG-017::GAP-PKG-198` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-199` | `HYPERCARE-OPS-001::GAP-PKG-199` + `HYPERCARE-OPS-002::GAP-PKG-199` | `DELIV-PKG-010::GAP-PKG-199` + `DELIV-PKG-015::GAP-PKG-199` + `DELIV-PKG-020::GAP-PKG-199` | `HYPERCARE-OPS-003::GAP-PKG-199` + `HYPERCARE-OPS-004::GAP-PKG-199` + `DELIV-PKG-017::GAP-PKG-199` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-200` | `HYPERCARE-OPS-001::GAP-PKG-200` + `HYPERCARE-OPS-002::GAP-PKG-200` | `DELIV-PKG-010::GAP-PKG-200` + `DELIV-PKG-015::GAP-PKG-200` + `DELIV-PKG-020::GAP-PKG-200` | `HYPERCARE-OPS-003::GAP-PKG-200` + `HYPERCARE-OPS-004::GAP-PKG-200` + `DELIV-PKG-017::GAP-PKG-200` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-201` | `HYPERCARE-OPS-001::GAP-PKG-201` + `HYPERCARE-OPS-002::GAP-PKG-201` | `DELIV-PKG-010::GAP-PKG-201` + `DELIV-PKG-015::GAP-PKG-201` + `DELIV-PKG-020::GAP-PKG-201` | `HYPERCARE-OPS-003::GAP-PKG-201` + `HYPERCARE-OPS-004::GAP-PKG-201` + `DELIV-PKG-017::GAP-PKG-201` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-202` | `HYPERCARE-OPS-001::GAP-PKG-202` + `HYPERCARE-OPS-002::GAP-PKG-202` | `DELIV-PKG-010::GAP-PKG-202` + `DELIV-PKG-015::GAP-PKG-202` + `DELIV-PKG-020::GAP-PKG-202` | `HYPERCARE-OPS-003::GAP-PKG-202` + `HYPERCARE-OPS-004::GAP-PKG-202` + `DELIV-PKG-017::GAP-PKG-202` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-203` | `HYPERCARE-OPS-001::GAP-PKG-203` + `HYPERCARE-OPS-002::GAP-PKG-203` | `DELIV-PKG-010::GAP-PKG-203` + `DELIV-PKG-015::GAP-PKG-203` + `DELIV-PKG-020::GAP-PKG-203` | `HYPERCARE-OPS-003::GAP-PKG-203` + `HYPERCARE-OPS-004::GAP-PKG-203` + `DELIV-PKG-017::GAP-PKG-203` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-204` | `HYPERCARE-OPS-001::GAP-PKG-204` + `HYPERCARE-OPS-002::GAP-PKG-204` | `DELIV-PKG-010::GAP-PKG-204` + `DELIV-PKG-015::GAP-PKG-204` + `DELIV-PKG-020::GAP-PKG-204` | `HYPERCARE-OPS-003::GAP-PKG-204` + `HYPERCARE-OPS-004::GAP-PKG-204` + `DELIV-PKG-017::GAP-PKG-204` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-205` | `HYPERCARE-OPS-001::GAP-PKG-205` + `HYPERCARE-OPS-002::GAP-PKG-205` | `DELIV-PKG-010::GAP-PKG-205` + `DELIV-PKG-015::GAP-PKG-205` + `DELIV-PKG-020::GAP-PKG-205` | `HYPERCARE-OPS-003::GAP-PKG-205` + `HYPERCARE-OPS-004::GAP-PKG-205` + `DELIV-PKG-017::GAP-PKG-205` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-206` | `HYPERCARE-OPS-001::GAP-PKG-206` + `HYPERCARE-OPS-002::GAP-PKG-206` | `DELIV-PKG-010::GAP-PKG-206` + `DELIV-PKG-015::GAP-PKG-206` + `DELIV-PKG-020::GAP-PKG-206` | `HYPERCARE-OPS-003::GAP-PKG-206` + `HYPERCARE-OPS-004::GAP-PKG-206` + `DELIV-PKG-017::GAP-PKG-206` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |
| `GAP-PKG-207` | `HYPERCARE-OPS-001::GAP-PKG-207` + `HYPERCARE-OPS-002::GAP-PKG-207` | `DELIV-PKG-010::GAP-PKG-207` + `DELIV-PKG-015::GAP-PKG-207` + `DELIV-PKG-020::GAP-PKG-207` | `HYPERCARE-OPS-003::GAP-PKG-207` + `HYPERCARE-OPS-004::GAP-PKG-207` + `DELIV-PKG-017::GAP-PKG-207` | reconstruir fuente, hechos y cada efecto interdominio aplicable; preservar correlación, causalidad, idempotencia, versión y evidencia; `NO_APLICA` solo con topología que lo demuestre | hereda gate y estado temporal de 001; toda diferencia, parcialidad, conflicto o resultado desconocido aplicable permanece abierto hasta evidencia suficiente y handoff propietario | `ESPECIFICADO` |

---

#### 16. Reconciliación de cobertura

La materialización anterior debe conservar estas invariantes:

```text
package_id esperados = 207
package_id materializados = 207
faltantes = 0
duplicados = 0
rango = GAP-PKG-001..GAP-PKG-207
modalidades = 160 + 3 + 26 + 14 + 2 + 2 = 207
```

Ninguna fila cambia modalidad, repositorio, propietario, gate, perfil de rollout, alcance de piloto, rollback o fuente de verdad. 005 agrega exclusivamente el contrato de conciliación que debe aplicarse cuando la topología de esa fila produzca o consuma efectos entre dominios.

---

#### 17. Reglas contra falsos positivos de conciliación

No podrá declararse una cadena conciliada por ninguna de estas señales aisladas:

- dos conteos agregados iguales;
- dos pantallas que muestran el mismo valor;
- una cola vacía;
- un HTTP `2xx`, ACK, receipt o webhook aceptado;
- una fila presente en outbox o inbox;
- un job marcado como completado sin resultado empresarial;
- ausencia de tickets o alertas;
- repetición manual del comando hasta que "funcione";
- compensación sin evidencia del efecto original;
- rollback técnico sin revisar efectos producidos durante la ventana;
- exportaciones o snapshots con cortes diferentes presentados como comparables;
- un dashboard que coincide con otra proyección pero no con la fuente propietaria;
- ausencia de registros cuando no se demostró que debía existir actividad;
- una corrección destructiva que elimina la diferencia en vez de preservar el historial;
- redondeos, tolerancias o ventanas inventadas para forzar coincidencia.

Tampoco podrá declararse `FAIL` por una diferencia cuya semántica, corte, versión o tolerancia no sean comparables según el contrato vigente. En ese caso debe conservarse la limitación o bloqueo correspondiente.

---

#### 18. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** 005 no introduce un comportamiento ejecutable nuevo, una nueva fuente de verdad, una nueva transición empresarial, un algoritmo de corrección, una tolerancia numérica ni una política de compensación. Especializa para hypercare obligaciones ya protegidas sobre idempotencia, efectos parciales, correlación, conciliación, reincorporación de contingencia, calidad de datos, trazabilidad, rollback y cierre sin pendientes. Un defecto o regresión descubierto durante `SHELL-CI-023` deberá generar o modificar el requisito aplicable solamente cuando exista evidencia concreta y la tarea propietaria determine qué comportamiento debe protegerse.

**Requisitos existentes consumidos:** `TREQ-CONT-003`, `TREQ-CONT-005`, `TREQ-INTEGRATION-003`, `TREQ-INTEGRATION-004`, `TREQ-INTEGRATION-005`, `TREQ-INTEGRATION-006`, `TREQ-INTEGRATION-010`, `TREQ-INTEGRATION-011`, `TREQ-INTEGRATION-013`, `TREQ-INTEGRATION-014`, `TREQ-INTEGRATION-015`, `TREQ-INTEGRATION-016`, `TREQ-INTEGRATION-017`, `TREQ-INTEGRATION-018`, `TREQ-INTEGRATION-020`, `TREQ-INTEGRATION-021`, `TREQ-INTEGRATION-022`, `TREQ-INTEGRATION-023`, `TREQ-INTEGRATION-109`, `TREQ-INTEGRATION-112`, `TREQ-INTEGRATION-118`, `TREQ-INTEGRATION-119`, `TREQ-INTEGRATION-121`, `TREQ-INTEGRATION-124`, `TREQ-INTEGRATION-142`, `TREQ-INTEGRATION-159`, `TREQ-INTEGRATION-160`, `TREQ-INTEGRATION-161`, `TREQ-DATA-003`, `TREQ-DATA-004`, `TREQ-DATA-013`, `TREQ-DATA-014`, `TREQ-DATA-017`, `TREQ-DATA-050`, `TREQ-PROC-003`, `TREQ-PROC-004`, `TREQ-PROC-006`, `TREQ-PROC-008`, `TREQ-PROC-233`, `TREQ-PROC-237`, `TREQ-PROC-238`, `TREQ-PROC-240`, `TREQ-PROC-241`, `TREQ-PROC-246`, `TREQ-PROC-257` y `TREQ-PROC-259`.

**Requisitos TREQ-* creados:** 0
**Requisitos TREQ-* modificados:** 0
**Fragmentos 04A afectados:** 0

---

#### 19. Criterios de aceptación documental

`HYPERCARE-OPS-005` queda documentalmente completa cuando:

1. define conciliación como reconstrucción de hechos y efectos, no como copia o igualación de tablas;
2. preserva fuente de verdad, propiedad por dominio y prohibición de escrituras cruzadas sin contrato;
3. consume identidad, candidato, ambiente y alcance de 001 sin modificarlos;
4. consume responsables de 002 sin crear autoridades nuevas;
5. utiliza 003 y 004 como evidencia correlacionable sin absorber sus monitoreos;
6. deriva el universo de efectos desde `DELIV-PKG-010`, `015` y `020` por `package_id`;
7. exige correlación, causalidad e idempotencia cuando los contratos las materialicen;
8. diferencia hecho fuente, evento, transporte, receipt, proyección y efecto empresarial;
9. cubre proyecciones, consumidoras, colas/jobs, handoffs, integraciones externas, contingencia, rollback, compensación y evidencia según aplicabilidad;
10. reutiliza estados operativos aprobados y no crea una máquina de estados paralela;
11. define `PASS`, `FAIL`, `BLOQUEADO`, `PENDIENTE_DE_EVIDENCIA` y `NO_APLICA` sin convertir ausencia de tráfico en no aplicabilidad;
12. impide `PASS` mientras exista un `RESULT_UNKNOWN`, `PARTIALLY_APPLIED`, `RECONCILIATION_REQUIRED`, conflicto o residual aplicable sin resolver;
13. no inventa frecuencia, ventana, tolerancia, umbral o SLA;
14. obliga a conservar comparabilidad de candidato, ambiente, versión, corte, periodo y granularidad;
15. preserva el hecho original y prohíbe correcciones destructivas;
16. entrega diferencias a 006, deuda a 007, contingencias temporales a 009 y evidencia de cierre a 010 sin resolver sus decisiones;
17. materializa exactamente 207 identidades `GAP-PKG-001..207`;
18. conserva la distribución `160 + 3 + 26 + 14 + 2 + 2 = 207`;
19. registra cero faltantes y cero duplicados en la matriz;
20. conserva AURA, dependencias externas y TALENTO en sus gates heredados sin simular ejecución;
21. crea 0 y modifica 0 requisitos `TREQ-*`;
22. no exige cambios al registro 04A;
23. no ejecuta código, SQL, migraciones, DDL, DML, backfills, cambios remotos, correcciones de datos ni operaciones sobre Supabase;
24. deja `HYPERCARE-OPS-006` exclusivamente reservada.

---

#### 20. Continuidad canónica

#### ÚLTIMA TAREA APROBADA
HYPERCARE-OPS-004 — Definir monitoreo de adopción, tiempos y desviaciones operativas

#### TAREA ACTUAL APROBADA
HYPERCARE-OPS-005 — Definir conciliaciones de datos y efectos entre dominios

#### SIGUIENTE TAREA RESERVADA
HYPERCARE-OPS-006 — Definir clasificación, prioridad y procedimiento de corrección de incidentes


### ✅ HYPERCARE-OPS-006 — Definir clasificación, prioridad y procedimiento de corrección de incidentes

**Estado:** APROBADA
**Tarea anterior:** `HYPERCARE-OPS-005 — Definir conciliaciones de datos y efectos entre dominios`
**Tarea siguiente:** `HYPERCARE-OPS-007 — Definir registro y aprobación de deuda y tareas posteriores`
**Tipo de tarea:** documental — definición normativa y materialización del binding de clasificación, prioridad y corrección de incidentes durante hypercare para las 207 identidades `GAP-PKG-*`, reutilizando el modelo canónico de soporte de `TI-DOM-007 / VPROC-0058`, las responsabilidades de `HYPERCARE-OPS-002` y la evidencia de `HYPERCARE-OPS-003` a `HYPERCARE-OPS-005`; sin ejecutar correcciones, cambios de código, DDL/DML, backfills, migraciones, despliegues, modificaciones de datos, operaciones sobre Supabase ni cierre de hypercare
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/05_HYPERCARE_Y_ESTABILIZACION.md`
**Ejecución posterior:** `SHELL-CI-023` por instancia de paquete, antes de la certificación de `SHELL-CI-024`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`HYPERCARE-OPS-006` define cómo una señal observada durante hypercare pasa, cuando corresponda, de hallazgo o desviación a caso formal, cómo obtiene clasificación y prioridad deterministas y cómo se gobierna su corrección hasta una resolución verificable.

La tarea no crea una taxonomía paralela de incidentes. Adopta como autoridad transversal el modelo ya aprobado de `TI-DOM-007 / VPROC-0058` y lo vincula a cada una de las 207 identidades de paquete de hypercare.

```text
HALLAZGO TECNICO HYPERCARE-OPS-003
+ DESVIACION OPERATIVA HYPERCARE-OPS-004
+ DIFERENCIA / EFECTO NO CONCILIADO HYPERCARE-OPS-005
        |
        v
TRIAGE SOBRE EL MISMO CASO CANONICO TI-DOM-007 / VPROC-0058
        |
        +--> INCIDENT
        +--> SERVICE_REQUEST
        `--> UNCLASSIFIED_TRIAGE hasta disponer de evidencia suficiente
        |
        v
IMPACTO I1..I4 + URGENCIA U1..U4
        |
        v
PRIORIDAD DETERMINISTA P1..P4
        |
        v
CONTENCION / RESTAURACION / DIAGNOSTICO / CORRECCION / VALIDACION
        |
        v
RESOLUCION Y CIERRE DEL CASO TECNICO
        |
        v
HYPERCARE CONTINUA HASTA SUS PROPIAS CONDICIONES DE SALIDA Y CIERRE
```

#### 2. Fuentes y contratos consumidos

| Fuente                    | Decisión consumida por `HYPERCARE-OPS-006`                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| `HYPERCARE-OPS-002`       | autoridad funcional, autoridad técnica, cobertura y continuidad de responsables por paquete                                           |
| `HYPERCARE-OPS-003`       | hallazgos técnicos de errores, colas, integraciones, rendimiento y observabilidad; un hallazgo no es por sí mismo incidente           |
| `HYPERCARE-OPS-004`       | desviaciones de adopción, tiempos y operación; una desviación no es por sí misma incidente                                            |
| `HYPERCARE-OPS-005`       | diferencias de datos y efectos, estados desconocidos, parcialidad y conciliación; una diferencia no autoriza corrección destructiva   |
| `TI-DOM-007 / VPROC-0058` | clasificación del caso, impacto, urgencia, prioridad, SLA de referencia, ciclo de resolución, cierre y reapertura                     |
| `DELIV-PKG-020`           | rollback, recuperación y conciliación aprobados para el paquete                                                                       |
| `TREQ-VISO-046`           | prioridad determinista por matriz impacto × urgencia y trazabilidad de cambios de prioridad                                           |
| `TREQ-CONT-002`           | clasificación y expediente cronológico del incidente de continuidad, con autoridad explícita                                          |
| `TREQ-CONT-005`           | reincorporación y conciliación idempotentes; no cerrar con pendientes aplicables sin propietario                                      |
| `TREQ-CONT-006`           | revisión posterior, acciones, responsables, eficacia y actualización de conocimiento cuando aplique                                   |
| `TREQ-PROC-004`           | corrección sin sobrescritura destructiva; preservación del hecho original y del antes/después                                         |
| `TREQ-PROC-237`           | parcialidad, resultado desconocido, backlog o conciliación pendiente no equivalen a disponibilidad plena                              |
| `TREQ-PROC-241`           | observabilidad orientada al resultado empresarial y a su contexto de proceso                                                          |
| `TREQ-PROC-245`           | prioridad derivada de impacto, alcance, urgencia, propagación, ventana y workaround; criticidad como entrada, no como resultado único |
| `TREQ-INTEGRATION-003`    | identidad estable, idempotencia, resultado recuperable, conflicto y recuperación controlada                                           |
| `TREQ-INTEGRATION-004`    | reconstrucción de causa, actor, recurso, intento, resultado, error y efecto final                                                     |
| `TREQ-INTEGRATION-142`    | un resultado desconocido debe consultarse antes de reejecutar y, si no puede resolverse, queda en conciliación                        |
| `TREQ-INTEGRATION-160`    | agotamiento de retry termina en estado explícito de intervención o terminal, nunca en pendiente silencioso                            |
| `TREQ-INTEGRATION-161`    | agotar retries no autoriza compensar, revertir, cancelar, corregir ni escribir cruzado automáticamente                                |

Ninguna de estas decisiones se redefine. `HYPERCARE-OPS-006` las combina exclusivamente para el periodo de estabilización.

#### 3. Resultado documental materializado

Para cada `GAP-PKG-*` se establece un binding documental compuesto por:

```text
hypercare_incident_intake::<GAP-PKG-*>
hypercare_incident_classification::<GAP-PKG-*>
hypercare_incident_priority_binding::<GAP-PKG-*>
hypercare_correction_plan::<GAP-PKG-*>
hypercare_incident_handoff::<GAP-PKG-*>
```

Cada binding resuelve, por referencia canónica y no por duplicación:

1. evidencia de entrada desde `HYPERCARE-OPS-003`, `004` y `005`;
2. identidad y ciclo del caso de `TI-DOM-007 / VPROC-0058`;
3. impacto y urgencia vigentes;
4. prioridad calculada;
5. perfil SLA de referencia ya aprobado;
6. autoridad funcional y técnica de `HYPERCARE-OPS-002`;
7. plan de contención, restauración, corrección y validación aplicable;
8. evidencias de resultado y conciliación;
9. estado de resolución y cierre del caso técnico;
10. handoff hacia deuda, soporte o cierre de hypercare cuando corresponda, sin sustituir a sus tareas propietarias.

#### 4. Regla de entrada: señal no equivale a incidente

La existencia de una señal no permite asignar automáticamente la clase `INCIDENT`.

| Entrada                                     | Tratamiento obligatorio                                                                                   |
| ------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| hallazgo técnico de `HYPERCARE-OPS-003`     | triage con evidencia técnica y efecto empresarial observado o potencial                                   |
| desviación operativa de `HYPERCARE-OPS-004` | triage funcional; puede ser adopción, procedimiento, capacidad, configuración, solicitud o incidente      |
| diferencia de `HYPERCARE-OPS-005`           | triage manteniendo fuente de verdad, estado de conciliación y efecto observado; no corregir por intuición |
| alerta o métrica aislada                    | conservar como evidencia; no demuestra por sí sola falla empresarial                                      |
| reporte de usuario                          | conservar relato, contexto y momento; validar contra servicio esperado y evidencia disponible             |

Si la evidencia aún no permite decidir entre incidente y solicitud, el caso conserva `UNCLASSIFIED_TRIAGE`. Esa incertidumbre no autoriza prioridad manual, cierre ni mutación correctiva.

#### 5. Clasificación canónica del caso

La clasificación usa exactamente el contrato vigente de `TI-DOM-007`:

| `opened_mode`         | Aplicación durante hypercare                                                                                         |
| --------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `INCIDENT`            | el servicio esperado está detenido, degradado, incorrecto, con resultado desconocido o requiere restauración urgente |
| `SERVICE_REQUEST`     | existe una necesidad o solicitud, pero no una falla activa del servicio esperado                                     |
| `UNCLASSIFIED_TRIAGE` | la evidencia aún no permite una clasificación final segura                                                           |

Reglas:

- existe una sola clasificación vigente por caso;
- reclasificar conserva la misma identidad del caso, historial y evidencia;
- incidentes laborales, SST, seguridad de información, continuidad y tecnología pueden relacionarse, pero sus expedientes no se fusionan ni sustituyen;
- no se crea una escala paralela de severidad en hypercare;
- un problema, known error, cambio, deuda o tarea posterior no sustituye la identidad del incidente que los originó.

#### 6. Impacto vigente

Se reutilizan sin cambios los cuatro niveles aprobados:

| Código | Nombre canónico                     |
| ------ | ----------------------------------- |
| `I1`   | `ENTERPRISE_OR_MULTI_SITE_CRITICAL` |
| `I2`   | `SITE_OR_CRITICAL_PROCESS`          |
| `I3`   | `AREA_OR_MULTI_USER`                |
| `I4`   | `SINGLE_USER_OR_LIMITED`            |

El impacto se determina con evidencia actual de alcance y resultado empresarial. Una criticidad teórica no reemplaza el impacto realmente observado.

#### 7. Urgencia vigente

Se reutilizan sin cambios los cuatro niveles aprobados:

| Código | Nombre canónico |
| ------ | --------------- |
| `U1`   | `IMMEDIATE`     |
| `U2`   | `CURRENT_CYCLE` |
| `U3`   | `NEXT_WINDOW`   |
| `U4`   | `PLANNED`       |

Un workaround seguro y demostrado puede modificar la urgencia conforme al contrato vigente; no reduce por sí solo el impacto ni borra la afectación ocurrida.

#### 8. Prioridad determinista

La prioridad se calcula exclusivamente mediante:

```text
priority_code = impact_urgency_matrix[impact_code][urgency_code]
```

| Impacto \ Urgencia | `U1` | `U2` | `U3` | `U4` |
| ------------------ | ---- | ---- | ---- | ---- |
| `I1`               | `P1` | `P1` | `P2` | `P3` |
| `I2`               | `P1` | `P2` | `P2` | `P3` |
| `I3`               | `P2` | `P2` | `P3` | `P4` |
| `I4`               | `P2` | `P3` | `P4` | `P4` |

Nombres vigentes:

| Prioridad | Nombre           | Perfil SLA de referencia |
| --------- | ---------------- | ------------------------ |
| `P1`      | `CRITICAL_MAJOR` | `SLA-INC-P1-V1`          |
| `P2`      | `HIGH`           | `SLA-INC-P2-V1`          |
| `P3`      | `MEDIUM`         | `SLA-INC-P3-V1`          |
| `P4`      | `LOW`            | `SLA-INC-P4-V1`          |

`HYPERCARE-OPS-006` no inventa tiempos SLA. Utiliza la referencia versionada aplicable.

Todo cambio posterior de impacto, urgencia o prioridad debe conservar al menos estado anterior y nuevo, motivo, evidencia, actor, versión contractual y fechas objetivo recalculadas cuando correspondan. El riesgo aceptado no reescribe la historia.

#### 9. Autoridad y responsabilidad

La asignación de responsables se resuelve por la instancia correspondiente de `HYPERCARE-OPS-002`.

| Responsabilidad                  | Regla                                                                                                                    |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| autoridad funcional              | valida afectación empresarial, resultado esperado, restauración funcional y evidencia de uso                             |
| autoridad técnica                | dirige diagnóstico técnico, selección de tratamiento y evidencia técnica dentro de contratos aprobados                   |
| ejecutor                         | aplica en fase posterior la acción autorizada en el repositorio o dominio propietario; no obtiene autoridad por ejecutar |
| conciliador                      | confirma diferencias y efectos conforme a `HYPERCARE-OPS-005`; no reemplaza a la fuente de verdad                        |
| soporte ordinario                | recibe handoff cuando corresponda; no cierra hypercare por recibir el caso                                               |
| autoridad de cierre de hypercare | permanece fuera de 006 y se resuelve en `HYPERCARE-OPS-010`                                                              |

La ausencia de una autoridad requerida bloquea la acción que depende de ella; no se sustituye por consentimiento implícito ni por quien tenga acceso técnico.

#### 10. Procedimiento canónico de corrección

##### 10.1. Capturar la entrada

Vincular el caso con:

- `GAP-PKG-*` exacto;
- candidato, ambiente y alcance autorizados del paquete;
- evidencia originada en `HYPERCARE-OPS-003`, `004` y/o `005`;
- proceso, servicio, sede, área, canal o dependencia afectados cuando aplique;
- momento de detección y estado observado;
- referencias de correlación, operación, evento, intento, dato o efecto cuando existan.

##### 10.2. Clasificar el caso

Aplicar `INCIDENT`, `SERVICE_REQUEST` o `UNCLASSIFIED_TRIAGE` según `TI-DOM-007`. Si un expediente de continuidad, seguridad, SST u otro dominio también aplica, relacionarlo sin reemplazar identidades.

##### 10.3. Determinar impacto y urgencia

Determinar `I1..I4` y `U1..U4` usando evidencia vigente. No copiar la prioridad de otro caso ni elevarla o reducirla por conveniencia operativa.

##### 10.4. Calcular prioridad y perfil SLA

Aplicar la matriz 4 × 4 aprobada y resolver `SLA-INC-P1-V1` a `SLA-INC-P4-V1` según la prioridad calculada. Los tiempos concretos pertenecen al contrato SLA vigente y no se redefinen aquí.

##### 10.5. Asignar autoridades

Resolver autoridad funcional, técnica, ejecutor y sustitutos aplicables mediante `HYPERCARE-OPS-002`. Toda escalación mantiene el mismo caso y su cronología.

##### 10.6. Contener sin falsificar resolución

Cuando sea necesario proteger la operación, pueden utilizarse exclusivamente mecanismos ya aprobados para el paquete, por ejemplo fallback, feature flag, rollback, aislamiento, recuperación o contingencia aplicables.

La contención o restauración del servicio no demuestra por sí sola que la causa fue corregida.

##### 10.7. Diagnosticar

Reconstruir de forma trazable:

```text
SINTOMA OBSERVADO
+ RESULTADO EMPRESARIAL AFECTADO
+ ALCANCE REAL
+ SECUENCIA TEMPORAL
+ CAMBIOS / DEPENDENCIAS / INTENTOS
+ ESTADO DE COLAS E INTEGRACIONES
+ ESTADO DE DATOS Y EFECTOS
+ HIPOTESIS O CAUSA CONFIRMADA
```

Una hipótesis permanece diferenciada de una causa demostrada.

##### 10.8. Diseñar la corrección

La corrección debe pertenecer al dominio y repositorio propietarios, conservar compatibilidad y utilizar mecanismos ya aprobados. No se permiten como atajo:

- sobrescritura destructiva del hecho original;
- borrado silencioso para ocultar la inconsistencia;
- escritura cruzada fuera de contrato;
- repetición de una operación cuyo resultado siga desconocido;
- compensación, reversión o replay automáticos por el solo agotamiento de retries;
- parche manual de datos sin identidad, autoridad, antes/después y evidencia;
- cambio de fuente de verdad para hacer coincidir dos resultados.

Cuando la corrección cambie un hecho empresarial, deberá preservar el hecho original y materializar la acción sucesora, inversa, compensatoria o correctiva que el contrato propietario permita.

##### 10.9. Resolver resultados desconocidos antes de repetir

`RESULT_UNKNOWN` obliga a consultar resultado autoritativo mediante las identidades disponibles. Si no puede demostrarse que el efecto no ocurrió y que repetir es seguro, la operación permanece en `RECONCILIATION_REQUIRED` o intervención equivalente del contrato propietario.

##### 10.10. Ejecutar en la fase propietaria

Esta tarea no ejecuta la corrección. La ejecución material ocurre posteriormente bajo `SHELL-CI-023` y los repositorios propietarios, con los controles de autorización, rollback, pruebas y evidencia aplicables.

##### 10.11. Validar la corrección

La validación debe demostrar, según aplique:

- restauración del resultado empresarial esperado;
- ausencia de duplicación o pérdida de efectos;
- colas, reintentos, integraciones y dependencias en estado compatible;
- datos y efectos conciliados;
- comportamiento correcto en la ruta que originó el incidente;
- controles de regresión aplicables;
- evidencia funcional y técnica suficiente para la fase de resolución.

Un defecto o regresión real descubierto durante la futura ejecución de `SHELL-CI-023` que necesite protección recurrente deberá generar su requisito de regresión en ese momento, con evidencia real.

##### 10.12. Resolver el caso

El ciclo de `TI-DOM-007 / VPROC-0058` conserva la diferencia entre:

```text
SERVICE_RESTORED
!= INCIDENT_RESOLVED
!= PROBLEM_RESOLVED
```

`PROBLEM_KNOWN_ERROR` puede coexistir con un incidente resuelto. Fallback, workaround o rollback pueden restaurar el servicio sin demostrar resolución causal.

##### 10.13. Solicitar cierre

`CLOSE-REQUESTED` solo es admisible cuando el estado final es coherente, la evidencia aplicable está enlazada, la validación funcional o su excepción está documentada y no quedan efectos o conciliaciones aplicables sin tratamiento y propietario.

##### 10.14. Cerrar o reabrir

`CLOSED` exige las reglas vigentes de `TI-DOM-007`. `REOPENED` crea un nuevo ciclo de resolución conservando el ciclo anterior, motivo y evidencia.

Cerrar el caso técnico no cierra el paquete de hypercare.

#### 11. Registro mínimo de resolución consumido

El procedimiento reutiliza, sin renombrar ni reducir, los campos de resolución vigentes cuando apliquen:

```text
resolution_cycle
restoration_status
corrective_action_status
validation_status
user_validation_status
fallback_or_workaround_active
problem_ref
known_error_ref
change_ref
kb_ref
resolved_by
resolved_reason
resolved_at
reopened_from_cycle
reopen_reason
closure_exception_reason
```

Las referencias a problema, known error, cambio o conocimiento no permiten eliminar el incidente ni su evidencia histórica.

#### 12. Evidencia mínima de la corrección

Toda instancia que llegue a corrección deberá permitir reconstruir:

1. caso y paquete afectados;
2. clasificación vigente y sus reclasificaciones;
3. impacto, urgencia, prioridad y cambios posteriores;
4. responsable funcional y técnico;
5. señal original y evidencias correlacionadas;
6. diagnóstico y causa o hipótesis vigente;
7. contención o restauración aplicada;
8. corrección autorizada y ejecutor;
9. referencias a cambio, rollback, compensación, replay o conciliación cuando correspondan;
10. resultado de validación;
11. estado final de datos, efectos, colas e integraciones aplicables;
12. residuales, problema, known error, deuda candidata o tarea posterior, con propietario explícito;
13. decisión de resolución, cierre o reapertura y su autoridad.

#### 13. Frontera con deuda y tareas posteriores

`HYPERCARE-OPS-006` puede identificar un residual que, después de restaurar y validar el servicio, sea candidato a deuda o tarea posterior. No puede:

- declarar aprobada esa deuda;
- convertir un incidente no resuelto en deuda para permitir cierre;
- omitir una conciliación pendiente;
- transferir un riesgo sin propietario;
- cerrar un caso porque exista un futuro ticket.

La decisión documental de registro y aprobación de deuda pertenece exclusivamente a `HYPERCARE-OPS-007`.

#### 14. Frontera con cierre de hypercare

La cadena de autoridad permanece:

```text
HYPERCARE-OPS-006
clasifica / prioriza / define procedimiento de correccion de incidentes
        |
        v
HYPERCARE-OPS-007
registra y aprueba deuda y tareas posteriores cuando aplique
        |
        v
HYPERCARE-OPS-008 / 009
transferencia y retiro de contingencias segun sus contratos
        |
        v
HYPERCARE-OPS-010
autoridad y evidencia de cierre de hypercare
        |
        v
SHELL-CI-024
certificacion material posterior del cierre del paquete
```

Ningún `CLOSED` de incidente equivale por sí solo a salida, cierre o certificación del paquete.

#### 15. Matriz materializada por identidad de paquete

La siguiente matriz vincula el procedimiento a las 207 identidades canónicas. No afirma que exista un incidente activo en cada paquete; define de forma explícita qué contrato se aplicará si una señal de esa identidad requiere tratamiento de incidente durante `SHELL-CI-023`.

| Paquete       | Entradas de hypercare                                                                                  | Modelo de caso y prioridad                                                                                                    | Responsabilidad                  | Ejecución de corrección                                                                                    | Modalidad                                    | Estado documental |
| ------------- | ------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------- | -------------------------------- | ---------------------------------------------------------------------------------------------------------- | -------------------------------------------- | ----------------- |
| `GAP-PKG-001` | `HYPERCARE-OPS-003::GAP-PKG-001` + `HYPERCARE-OPS-004::GAP-PKG-001` + `HYPERCARE-OPS-005::GAP-PKG-001` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-001` | `SHELL-CI-023::GAP-PKG-001` + `DELIV-PKG-020::GAP-PKG-001` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-001` | heredada de `HYPERCARE-OPS-005::GAP-PKG-001` | `ESPECIFICADO`    |
| `GAP-PKG-002` | `HYPERCARE-OPS-003::GAP-PKG-002` + `HYPERCARE-OPS-004::GAP-PKG-002` + `HYPERCARE-OPS-005::GAP-PKG-002` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-002` | `SHELL-CI-023::GAP-PKG-002` + `DELIV-PKG-020::GAP-PKG-002` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-002` | heredada de `HYPERCARE-OPS-005::GAP-PKG-002` | `ESPECIFICADO`    |
| `GAP-PKG-003` | `HYPERCARE-OPS-003::GAP-PKG-003` + `HYPERCARE-OPS-004::GAP-PKG-003` + `HYPERCARE-OPS-005::GAP-PKG-003` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-003` | `SHELL-CI-023::GAP-PKG-003` + `DELIV-PKG-020::GAP-PKG-003` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-003` | heredada de `HYPERCARE-OPS-005::GAP-PKG-003` | `ESPECIFICADO`    |
| `GAP-PKG-004` | `HYPERCARE-OPS-003::GAP-PKG-004` + `HYPERCARE-OPS-004::GAP-PKG-004` + `HYPERCARE-OPS-005::GAP-PKG-004` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-004` | `SHELL-CI-023::GAP-PKG-004` + `DELIV-PKG-020::GAP-PKG-004` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-004` | heredada de `HYPERCARE-OPS-005::GAP-PKG-004` | `ESPECIFICADO`    |
| `GAP-PKG-005` | `HYPERCARE-OPS-003::GAP-PKG-005` + `HYPERCARE-OPS-004::GAP-PKG-005` + `HYPERCARE-OPS-005::GAP-PKG-005` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-005` | `SHELL-CI-023::GAP-PKG-005` + `DELIV-PKG-020::GAP-PKG-005` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-005` | heredada de `HYPERCARE-OPS-005::GAP-PKG-005` | `ESPECIFICADO`    |
| `GAP-PKG-006` | `HYPERCARE-OPS-003::GAP-PKG-006` + `HYPERCARE-OPS-004::GAP-PKG-006` + `HYPERCARE-OPS-005::GAP-PKG-006` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-006` | `SHELL-CI-023::GAP-PKG-006` + `DELIV-PKG-020::GAP-PKG-006` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-006` | heredada de `HYPERCARE-OPS-005::GAP-PKG-006` | `ESPECIFICADO`    |
| `GAP-PKG-007` | `HYPERCARE-OPS-003::GAP-PKG-007` + `HYPERCARE-OPS-004::GAP-PKG-007` + `HYPERCARE-OPS-005::GAP-PKG-007` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-007` | `SHELL-CI-023::GAP-PKG-007` + `DELIV-PKG-020::GAP-PKG-007` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-007` | heredada de `HYPERCARE-OPS-005::GAP-PKG-007` | `ESPECIFICADO`    |
| `GAP-PKG-008` | `HYPERCARE-OPS-003::GAP-PKG-008` + `HYPERCARE-OPS-004::GAP-PKG-008` + `HYPERCARE-OPS-005::GAP-PKG-008` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-008` | `SHELL-CI-023::GAP-PKG-008` + `DELIV-PKG-020::GAP-PKG-008` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-008` | heredada de `HYPERCARE-OPS-005::GAP-PKG-008` | `ESPECIFICADO`    |
| `GAP-PKG-009` | `HYPERCARE-OPS-003::GAP-PKG-009` + `HYPERCARE-OPS-004::GAP-PKG-009` + `HYPERCARE-OPS-005::GAP-PKG-009` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-009` | `SHELL-CI-023::GAP-PKG-009` + `DELIV-PKG-020::GAP-PKG-009` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-009` | heredada de `HYPERCARE-OPS-005::GAP-PKG-009` | `ESPECIFICADO`    |
| `GAP-PKG-010` | `HYPERCARE-OPS-003::GAP-PKG-010` + `HYPERCARE-OPS-004::GAP-PKG-010` + `HYPERCARE-OPS-005::GAP-PKG-010` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-010` | `SHELL-CI-023::GAP-PKG-010` + `DELIV-PKG-020::GAP-PKG-010` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-010` | heredada de `HYPERCARE-OPS-005::GAP-PKG-010` | `ESPECIFICADO`    |
| `GAP-PKG-011` | `HYPERCARE-OPS-003::GAP-PKG-011` + `HYPERCARE-OPS-004::GAP-PKG-011` + `HYPERCARE-OPS-005::GAP-PKG-011` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-011` | `SHELL-CI-023::GAP-PKG-011` + `DELIV-PKG-020::GAP-PKG-011` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-011` | heredada de `HYPERCARE-OPS-005::GAP-PKG-011` | `ESPECIFICADO`    |
| `GAP-PKG-012` | `HYPERCARE-OPS-003::GAP-PKG-012` + `HYPERCARE-OPS-004::GAP-PKG-012` + `HYPERCARE-OPS-005::GAP-PKG-012` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-012` | `SHELL-CI-023::GAP-PKG-012` + `DELIV-PKG-020::GAP-PKG-012` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-012` | heredada de `HYPERCARE-OPS-005::GAP-PKG-012` | `ESPECIFICADO`    |
| `GAP-PKG-013` | `HYPERCARE-OPS-003::GAP-PKG-013` + `HYPERCARE-OPS-004::GAP-PKG-013` + `HYPERCARE-OPS-005::GAP-PKG-013` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-013` | `SHELL-CI-023::GAP-PKG-013` + `DELIV-PKG-020::GAP-PKG-013` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-013` | heredada de `HYPERCARE-OPS-005::GAP-PKG-013` | `ESPECIFICADO`    |
| `GAP-PKG-014` | `HYPERCARE-OPS-003::GAP-PKG-014` + `HYPERCARE-OPS-004::GAP-PKG-014` + `HYPERCARE-OPS-005::GAP-PKG-014` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-014` | `SHELL-CI-023::GAP-PKG-014` + `DELIV-PKG-020::GAP-PKG-014` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-014` | heredada de `HYPERCARE-OPS-005::GAP-PKG-014` | `ESPECIFICADO`    |
| `GAP-PKG-015` | `HYPERCARE-OPS-003::GAP-PKG-015` + `HYPERCARE-OPS-004::GAP-PKG-015` + `HYPERCARE-OPS-005::GAP-PKG-015` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-015` | `SHELL-CI-023::GAP-PKG-015` + `DELIV-PKG-020::GAP-PKG-015` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-015` | heredada de `HYPERCARE-OPS-005::GAP-PKG-015` | `ESPECIFICADO`    |
| `GAP-PKG-016` | `HYPERCARE-OPS-003::GAP-PKG-016` + `HYPERCARE-OPS-004::GAP-PKG-016` + `HYPERCARE-OPS-005::GAP-PKG-016` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-016` | `SHELL-CI-023::GAP-PKG-016` + `DELIV-PKG-020::GAP-PKG-016` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-016` | heredada de `HYPERCARE-OPS-005::GAP-PKG-016` | `ESPECIFICADO`    |
| `GAP-PKG-017` | `HYPERCARE-OPS-003::GAP-PKG-017` + `HYPERCARE-OPS-004::GAP-PKG-017` + `HYPERCARE-OPS-005::GAP-PKG-017` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-017` | `SHELL-CI-023::GAP-PKG-017` + `DELIV-PKG-020::GAP-PKG-017` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-017` | heredada de `HYPERCARE-OPS-005::GAP-PKG-017` | `ESPECIFICADO`    |
| `GAP-PKG-018` | `HYPERCARE-OPS-003::GAP-PKG-018` + `HYPERCARE-OPS-004::GAP-PKG-018` + `HYPERCARE-OPS-005::GAP-PKG-018` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-018` | `SHELL-CI-023::GAP-PKG-018` + `DELIV-PKG-020::GAP-PKG-018` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-018` | heredada de `HYPERCARE-OPS-005::GAP-PKG-018` | `ESPECIFICADO`    |
| `GAP-PKG-019` | `HYPERCARE-OPS-003::GAP-PKG-019` + `HYPERCARE-OPS-004::GAP-PKG-019` + `HYPERCARE-OPS-005::GAP-PKG-019` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-019` | `SHELL-CI-023::GAP-PKG-019` + `DELIV-PKG-020::GAP-PKG-019` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-019` | heredada de `HYPERCARE-OPS-005::GAP-PKG-019` | `ESPECIFICADO`    |
| `GAP-PKG-020` | `HYPERCARE-OPS-003::GAP-PKG-020` + `HYPERCARE-OPS-004::GAP-PKG-020` + `HYPERCARE-OPS-005::GAP-PKG-020` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-020` | `SHELL-CI-023::GAP-PKG-020` + `DELIV-PKG-020::GAP-PKG-020` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-020` | heredada de `HYPERCARE-OPS-005::GAP-PKG-020` | `ESPECIFICADO`    |
| `GAP-PKG-021` | `HYPERCARE-OPS-003::GAP-PKG-021` + `HYPERCARE-OPS-004::GAP-PKG-021` + `HYPERCARE-OPS-005::GAP-PKG-021` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-021` | `SHELL-CI-023::GAP-PKG-021` + `DELIV-PKG-020::GAP-PKG-021` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-021` | heredada de `HYPERCARE-OPS-005::GAP-PKG-021` | `ESPECIFICADO`    |
| `GAP-PKG-022` | `HYPERCARE-OPS-003::GAP-PKG-022` + `HYPERCARE-OPS-004::GAP-PKG-022` + `HYPERCARE-OPS-005::GAP-PKG-022` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-022` | `SHELL-CI-023::GAP-PKG-022` + `DELIV-PKG-020::GAP-PKG-022` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-022` | heredada de `HYPERCARE-OPS-005::GAP-PKG-022` | `ESPECIFICADO`    |
| `GAP-PKG-023` | `HYPERCARE-OPS-003::GAP-PKG-023` + `HYPERCARE-OPS-004::GAP-PKG-023` + `HYPERCARE-OPS-005::GAP-PKG-023` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-023` | `SHELL-CI-023::GAP-PKG-023` + `DELIV-PKG-020::GAP-PKG-023` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-023` | heredada de `HYPERCARE-OPS-005::GAP-PKG-023` | `ESPECIFICADO`    |
| `GAP-PKG-024` | `HYPERCARE-OPS-003::GAP-PKG-024` + `HYPERCARE-OPS-004::GAP-PKG-024` + `HYPERCARE-OPS-005::GAP-PKG-024` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-024` | `SHELL-CI-023::GAP-PKG-024` + `DELIV-PKG-020::GAP-PKG-024` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-024` | heredada de `HYPERCARE-OPS-005::GAP-PKG-024` | `ESPECIFICADO`    |
| `GAP-PKG-025` | `HYPERCARE-OPS-003::GAP-PKG-025` + `HYPERCARE-OPS-004::GAP-PKG-025` + `HYPERCARE-OPS-005::GAP-PKG-025` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-025` | `SHELL-CI-023::GAP-PKG-025` + `DELIV-PKG-020::GAP-PKG-025` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-025` | heredada de `HYPERCARE-OPS-005::GAP-PKG-025` | `ESPECIFICADO`    |
| `GAP-PKG-026` | `HYPERCARE-OPS-003::GAP-PKG-026` + `HYPERCARE-OPS-004::GAP-PKG-026` + `HYPERCARE-OPS-005::GAP-PKG-026` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-026` | `SHELL-CI-023::GAP-PKG-026` + `DELIV-PKG-020::GAP-PKG-026` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-026` | heredada de `HYPERCARE-OPS-005::GAP-PKG-026` | `ESPECIFICADO`    |
| `GAP-PKG-027` | `HYPERCARE-OPS-003::GAP-PKG-027` + `HYPERCARE-OPS-004::GAP-PKG-027` + `HYPERCARE-OPS-005::GAP-PKG-027` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-027` | `SHELL-CI-023::GAP-PKG-027` + `DELIV-PKG-020::GAP-PKG-027` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-027` | heredada de `HYPERCARE-OPS-005::GAP-PKG-027` | `ESPECIFICADO`    |
| `GAP-PKG-028` | `HYPERCARE-OPS-003::GAP-PKG-028` + `HYPERCARE-OPS-004::GAP-PKG-028` + `HYPERCARE-OPS-005::GAP-PKG-028` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-028` | `SHELL-CI-023::GAP-PKG-028` + `DELIV-PKG-020::GAP-PKG-028` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-028` | heredada de `HYPERCARE-OPS-005::GAP-PKG-028` | `ESPECIFICADO`    |
| `GAP-PKG-029` | `HYPERCARE-OPS-003::GAP-PKG-029` + `HYPERCARE-OPS-004::GAP-PKG-029` + `HYPERCARE-OPS-005::GAP-PKG-029` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-029` | `SHELL-CI-023::GAP-PKG-029` + `DELIV-PKG-020::GAP-PKG-029` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-029` | heredada de `HYPERCARE-OPS-005::GAP-PKG-029` | `ESPECIFICADO`    |
| `GAP-PKG-030` | `HYPERCARE-OPS-003::GAP-PKG-030` + `HYPERCARE-OPS-004::GAP-PKG-030` + `HYPERCARE-OPS-005::GAP-PKG-030` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-030` | `SHELL-CI-023::GAP-PKG-030` + `DELIV-PKG-020::GAP-PKG-030` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-030` | heredada de `HYPERCARE-OPS-005::GAP-PKG-030` | `ESPECIFICADO`    |
| `GAP-PKG-031` | `HYPERCARE-OPS-003::GAP-PKG-031` + `HYPERCARE-OPS-004::GAP-PKG-031` + `HYPERCARE-OPS-005::GAP-PKG-031` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-031` | `SHELL-CI-023::GAP-PKG-031` + `DELIV-PKG-020::GAP-PKG-031` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-031` | heredada de `HYPERCARE-OPS-005::GAP-PKG-031` | `ESPECIFICADO`    |
| `GAP-PKG-032` | `HYPERCARE-OPS-003::GAP-PKG-032` + `HYPERCARE-OPS-004::GAP-PKG-032` + `HYPERCARE-OPS-005::GAP-PKG-032` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-032` | `SHELL-CI-023::GAP-PKG-032` + `DELIV-PKG-020::GAP-PKG-032` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-032` | heredada de `HYPERCARE-OPS-005::GAP-PKG-032` | `ESPECIFICADO`    |
| `GAP-PKG-033` | `HYPERCARE-OPS-003::GAP-PKG-033` + `HYPERCARE-OPS-004::GAP-PKG-033` + `HYPERCARE-OPS-005::GAP-PKG-033` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-033` | `SHELL-CI-023::GAP-PKG-033` + `DELIV-PKG-020::GAP-PKG-033` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-033` | heredada de `HYPERCARE-OPS-005::GAP-PKG-033` | `ESPECIFICADO`    |
| `GAP-PKG-034` | `HYPERCARE-OPS-003::GAP-PKG-034` + `HYPERCARE-OPS-004::GAP-PKG-034` + `HYPERCARE-OPS-005::GAP-PKG-034` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-034` | `SHELL-CI-023::GAP-PKG-034` + `DELIV-PKG-020::GAP-PKG-034` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-034` | heredada de `HYPERCARE-OPS-005::GAP-PKG-034` | `ESPECIFICADO`    |
| `GAP-PKG-035` | `HYPERCARE-OPS-003::GAP-PKG-035` + `HYPERCARE-OPS-004::GAP-PKG-035` + `HYPERCARE-OPS-005::GAP-PKG-035` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-035` | `SHELL-CI-023::GAP-PKG-035` + `DELIV-PKG-020::GAP-PKG-035` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-035` | heredada de `HYPERCARE-OPS-005::GAP-PKG-035` | `ESPECIFICADO`    |
| `GAP-PKG-036` | `HYPERCARE-OPS-003::GAP-PKG-036` + `HYPERCARE-OPS-004::GAP-PKG-036` + `HYPERCARE-OPS-005::GAP-PKG-036` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-036` | `SHELL-CI-023::GAP-PKG-036` + `DELIV-PKG-020::GAP-PKG-036` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-036` | heredada de `HYPERCARE-OPS-005::GAP-PKG-036` | `ESPECIFICADO`    |
| `GAP-PKG-037` | `HYPERCARE-OPS-003::GAP-PKG-037` + `HYPERCARE-OPS-004::GAP-PKG-037` + `HYPERCARE-OPS-005::GAP-PKG-037` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-037` | `SHELL-CI-023::GAP-PKG-037` + `DELIV-PKG-020::GAP-PKG-037` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-037` | heredada de `HYPERCARE-OPS-005::GAP-PKG-037` | `ESPECIFICADO`    |
| `GAP-PKG-038` | `HYPERCARE-OPS-003::GAP-PKG-038` + `HYPERCARE-OPS-004::GAP-PKG-038` + `HYPERCARE-OPS-005::GAP-PKG-038` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-038` | `SHELL-CI-023::GAP-PKG-038` + `DELIV-PKG-020::GAP-PKG-038` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-038` | heredada de `HYPERCARE-OPS-005::GAP-PKG-038` | `ESPECIFICADO`    |
| `GAP-PKG-039` | `HYPERCARE-OPS-003::GAP-PKG-039` + `HYPERCARE-OPS-004::GAP-PKG-039` + `HYPERCARE-OPS-005::GAP-PKG-039` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-039` | `SHELL-CI-023::GAP-PKG-039` + `DELIV-PKG-020::GAP-PKG-039` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-039` | heredada de `HYPERCARE-OPS-005::GAP-PKG-039` | `ESPECIFICADO`    |
| `GAP-PKG-040` | `HYPERCARE-OPS-003::GAP-PKG-040` + `HYPERCARE-OPS-004::GAP-PKG-040` + `HYPERCARE-OPS-005::GAP-PKG-040` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-040` | `SHELL-CI-023::GAP-PKG-040` + `DELIV-PKG-020::GAP-PKG-040` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-040` | heredada de `HYPERCARE-OPS-005::GAP-PKG-040` | `ESPECIFICADO`    |
| `GAP-PKG-041` | `HYPERCARE-OPS-003::GAP-PKG-041` + `HYPERCARE-OPS-004::GAP-PKG-041` + `HYPERCARE-OPS-005::GAP-PKG-041` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-041` | `SHELL-CI-023::GAP-PKG-041` + `DELIV-PKG-020::GAP-PKG-041` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-041` | heredada de `HYPERCARE-OPS-005::GAP-PKG-041` | `ESPECIFICADO`    |
| `GAP-PKG-042` | `HYPERCARE-OPS-003::GAP-PKG-042` + `HYPERCARE-OPS-004::GAP-PKG-042` + `HYPERCARE-OPS-005::GAP-PKG-042` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-042` | `SHELL-CI-023::GAP-PKG-042` + `DELIV-PKG-020::GAP-PKG-042` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-042` | heredada de `HYPERCARE-OPS-005::GAP-PKG-042` | `ESPECIFICADO`    |
| `GAP-PKG-043` | `HYPERCARE-OPS-003::GAP-PKG-043` + `HYPERCARE-OPS-004::GAP-PKG-043` + `HYPERCARE-OPS-005::GAP-PKG-043` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-043` | `SHELL-CI-023::GAP-PKG-043` + `DELIV-PKG-020::GAP-PKG-043` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-043` | heredada de `HYPERCARE-OPS-005::GAP-PKG-043` | `ESPECIFICADO`    |
| `GAP-PKG-044` | `HYPERCARE-OPS-003::GAP-PKG-044` + `HYPERCARE-OPS-004::GAP-PKG-044` + `HYPERCARE-OPS-005::GAP-PKG-044` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-044` | `SHELL-CI-023::GAP-PKG-044` + `DELIV-PKG-020::GAP-PKG-044` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-044` | heredada de `HYPERCARE-OPS-005::GAP-PKG-044` | `ESPECIFICADO`    |
| `GAP-PKG-045` | `HYPERCARE-OPS-003::GAP-PKG-045` + `HYPERCARE-OPS-004::GAP-PKG-045` + `HYPERCARE-OPS-005::GAP-PKG-045` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-045` | `SHELL-CI-023::GAP-PKG-045` + `DELIV-PKG-020::GAP-PKG-045` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-045` | heredada de `HYPERCARE-OPS-005::GAP-PKG-045` | `ESPECIFICADO`    |
| `GAP-PKG-046` | `HYPERCARE-OPS-003::GAP-PKG-046` + `HYPERCARE-OPS-004::GAP-PKG-046` + `HYPERCARE-OPS-005::GAP-PKG-046` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-046` | `SHELL-CI-023::GAP-PKG-046` + `DELIV-PKG-020::GAP-PKG-046` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-046` | heredada de `HYPERCARE-OPS-005::GAP-PKG-046` | `ESPECIFICADO`    |
| `GAP-PKG-047` | `HYPERCARE-OPS-003::GAP-PKG-047` + `HYPERCARE-OPS-004::GAP-PKG-047` + `HYPERCARE-OPS-005::GAP-PKG-047` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-047` | `SHELL-CI-023::GAP-PKG-047` + `DELIV-PKG-020::GAP-PKG-047` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-047` | heredada de `HYPERCARE-OPS-005::GAP-PKG-047` | `ESPECIFICADO`    |
| `GAP-PKG-048` | `HYPERCARE-OPS-003::GAP-PKG-048` + `HYPERCARE-OPS-004::GAP-PKG-048` + `HYPERCARE-OPS-005::GAP-PKG-048` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-048` | `SHELL-CI-023::GAP-PKG-048` + `DELIV-PKG-020::GAP-PKG-048` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-048` | heredada de `HYPERCARE-OPS-005::GAP-PKG-048` | `ESPECIFICADO`    |
| `GAP-PKG-049` | `HYPERCARE-OPS-003::GAP-PKG-049` + `HYPERCARE-OPS-004::GAP-PKG-049` + `HYPERCARE-OPS-005::GAP-PKG-049` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-049` | `SHELL-CI-023::GAP-PKG-049` + `DELIV-PKG-020::GAP-PKG-049` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-049` | heredada de `HYPERCARE-OPS-005::GAP-PKG-049` | `ESPECIFICADO`    |
| `GAP-PKG-050` | `HYPERCARE-OPS-003::GAP-PKG-050` + `HYPERCARE-OPS-004::GAP-PKG-050` + `HYPERCARE-OPS-005::GAP-PKG-050` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-050` | `SHELL-CI-023::GAP-PKG-050` + `DELIV-PKG-020::GAP-PKG-050` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-050` | heredada de `HYPERCARE-OPS-005::GAP-PKG-050` | `ESPECIFICADO`    |
| `GAP-PKG-051` | `HYPERCARE-OPS-003::GAP-PKG-051` + `HYPERCARE-OPS-004::GAP-PKG-051` + `HYPERCARE-OPS-005::GAP-PKG-051` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-051` | `SHELL-CI-023::GAP-PKG-051` + `DELIV-PKG-020::GAP-PKG-051` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-051` | heredada de `HYPERCARE-OPS-005::GAP-PKG-051` | `ESPECIFICADO`    |
| `GAP-PKG-052` | `HYPERCARE-OPS-003::GAP-PKG-052` + `HYPERCARE-OPS-004::GAP-PKG-052` + `HYPERCARE-OPS-005::GAP-PKG-052` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-052` | `SHELL-CI-023::GAP-PKG-052` + `DELIV-PKG-020::GAP-PKG-052` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-052` | heredada de `HYPERCARE-OPS-005::GAP-PKG-052` | `ESPECIFICADO`    |
| `GAP-PKG-053` | `HYPERCARE-OPS-003::GAP-PKG-053` + `HYPERCARE-OPS-004::GAP-PKG-053` + `HYPERCARE-OPS-005::GAP-PKG-053` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-053` | `SHELL-CI-023::GAP-PKG-053` + `DELIV-PKG-020::GAP-PKG-053` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-053` | heredada de `HYPERCARE-OPS-005::GAP-PKG-053` | `ESPECIFICADO`    |
| `GAP-PKG-054` | `HYPERCARE-OPS-003::GAP-PKG-054` + `HYPERCARE-OPS-004::GAP-PKG-054` + `HYPERCARE-OPS-005::GAP-PKG-054` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-054` | `SHELL-CI-023::GAP-PKG-054` + `DELIV-PKG-020::GAP-PKG-054` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-054` | heredada de `HYPERCARE-OPS-005::GAP-PKG-054` | `ESPECIFICADO`    |
| `GAP-PKG-055` | `HYPERCARE-OPS-003::GAP-PKG-055` + `HYPERCARE-OPS-004::GAP-PKG-055` + `HYPERCARE-OPS-005::GAP-PKG-055` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-055` | `SHELL-CI-023::GAP-PKG-055` + `DELIV-PKG-020::GAP-PKG-055` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-055` | heredada de `HYPERCARE-OPS-005::GAP-PKG-055` | `ESPECIFICADO`    |
| `GAP-PKG-056` | `HYPERCARE-OPS-003::GAP-PKG-056` + `HYPERCARE-OPS-004::GAP-PKG-056` + `HYPERCARE-OPS-005::GAP-PKG-056` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-056` | `SHELL-CI-023::GAP-PKG-056` + `DELIV-PKG-020::GAP-PKG-056` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-056` | heredada de `HYPERCARE-OPS-005::GAP-PKG-056` | `ESPECIFICADO`    |
| `GAP-PKG-057` | `HYPERCARE-OPS-003::GAP-PKG-057` + `HYPERCARE-OPS-004::GAP-PKG-057` + `HYPERCARE-OPS-005::GAP-PKG-057` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-057` | `SHELL-CI-023::GAP-PKG-057` + `DELIV-PKG-020::GAP-PKG-057` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-057` | heredada de `HYPERCARE-OPS-005::GAP-PKG-057` | `ESPECIFICADO`    |
| `GAP-PKG-058` | `HYPERCARE-OPS-003::GAP-PKG-058` + `HYPERCARE-OPS-004::GAP-PKG-058` + `HYPERCARE-OPS-005::GAP-PKG-058` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-058` | `SHELL-CI-023::GAP-PKG-058` + `DELIV-PKG-020::GAP-PKG-058` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-058` | heredada de `HYPERCARE-OPS-005::GAP-PKG-058` | `ESPECIFICADO`    |
| `GAP-PKG-059` | `HYPERCARE-OPS-003::GAP-PKG-059` + `HYPERCARE-OPS-004::GAP-PKG-059` + `HYPERCARE-OPS-005::GAP-PKG-059` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-059` | `SHELL-CI-023::GAP-PKG-059` + `DELIV-PKG-020::GAP-PKG-059` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-059` | heredada de `HYPERCARE-OPS-005::GAP-PKG-059` | `ESPECIFICADO`    |
| `GAP-PKG-060` | `HYPERCARE-OPS-003::GAP-PKG-060` + `HYPERCARE-OPS-004::GAP-PKG-060` + `HYPERCARE-OPS-005::GAP-PKG-060` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-060` | `SHELL-CI-023::GAP-PKG-060` + `DELIV-PKG-020::GAP-PKG-060` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-060` | heredada de `HYPERCARE-OPS-005::GAP-PKG-060` | `ESPECIFICADO`    |
| `GAP-PKG-061` | `HYPERCARE-OPS-003::GAP-PKG-061` + `HYPERCARE-OPS-004::GAP-PKG-061` + `HYPERCARE-OPS-005::GAP-PKG-061` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-061` | `SHELL-CI-023::GAP-PKG-061` + `DELIV-PKG-020::GAP-PKG-061` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-061` | heredada de `HYPERCARE-OPS-005::GAP-PKG-061` | `ESPECIFICADO`    |
| `GAP-PKG-062` | `HYPERCARE-OPS-003::GAP-PKG-062` + `HYPERCARE-OPS-004::GAP-PKG-062` + `HYPERCARE-OPS-005::GAP-PKG-062` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-062` | `SHELL-CI-023::GAP-PKG-062` + `DELIV-PKG-020::GAP-PKG-062` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-062` | heredada de `HYPERCARE-OPS-005::GAP-PKG-062` | `ESPECIFICADO`    |
| `GAP-PKG-063` | `HYPERCARE-OPS-003::GAP-PKG-063` + `HYPERCARE-OPS-004::GAP-PKG-063` + `HYPERCARE-OPS-005::GAP-PKG-063` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-063` | `SHELL-CI-023::GAP-PKG-063` + `DELIV-PKG-020::GAP-PKG-063` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-063` | heredada de `HYPERCARE-OPS-005::GAP-PKG-063` | `ESPECIFICADO`    |
| `GAP-PKG-064` | `HYPERCARE-OPS-003::GAP-PKG-064` + `HYPERCARE-OPS-004::GAP-PKG-064` + `HYPERCARE-OPS-005::GAP-PKG-064` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-064` | `SHELL-CI-023::GAP-PKG-064` + `DELIV-PKG-020::GAP-PKG-064` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-064` | heredada de `HYPERCARE-OPS-005::GAP-PKG-064` | `ESPECIFICADO`    |
| `GAP-PKG-065` | `HYPERCARE-OPS-003::GAP-PKG-065` + `HYPERCARE-OPS-004::GAP-PKG-065` + `HYPERCARE-OPS-005::GAP-PKG-065` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-065` | `SHELL-CI-023::GAP-PKG-065` + `DELIV-PKG-020::GAP-PKG-065` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-065` | heredada de `HYPERCARE-OPS-005::GAP-PKG-065` | `ESPECIFICADO`    |
| `GAP-PKG-066` | `HYPERCARE-OPS-003::GAP-PKG-066` + `HYPERCARE-OPS-004::GAP-PKG-066` + `HYPERCARE-OPS-005::GAP-PKG-066` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-066` | `SHELL-CI-023::GAP-PKG-066` + `DELIV-PKG-020::GAP-PKG-066` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-066` | heredada de `HYPERCARE-OPS-005::GAP-PKG-066` | `ESPECIFICADO`    |
| `GAP-PKG-067` | `HYPERCARE-OPS-003::GAP-PKG-067` + `HYPERCARE-OPS-004::GAP-PKG-067` + `HYPERCARE-OPS-005::GAP-PKG-067` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-067` | `SHELL-CI-023::GAP-PKG-067` + `DELIV-PKG-020::GAP-PKG-067` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-067` | heredada de `HYPERCARE-OPS-005::GAP-PKG-067` | `ESPECIFICADO`    |
| `GAP-PKG-068` | `HYPERCARE-OPS-003::GAP-PKG-068` + `HYPERCARE-OPS-004::GAP-PKG-068` + `HYPERCARE-OPS-005::GAP-PKG-068` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-068` | `SHELL-CI-023::GAP-PKG-068` + `DELIV-PKG-020::GAP-PKG-068` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-068` | heredada de `HYPERCARE-OPS-005::GAP-PKG-068` | `ESPECIFICADO`    |
| `GAP-PKG-069` | `HYPERCARE-OPS-003::GAP-PKG-069` + `HYPERCARE-OPS-004::GAP-PKG-069` + `HYPERCARE-OPS-005::GAP-PKG-069` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-069` | `SHELL-CI-023::GAP-PKG-069` + `DELIV-PKG-020::GAP-PKG-069` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-069` | heredada de `HYPERCARE-OPS-005::GAP-PKG-069` | `ESPECIFICADO`    |
| `GAP-PKG-070` | `HYPERCARE-OPS-003::GAP-PKG-070` + `HYPERCARE-OPS-004::GAP-PKG-070` + `HYPERCARE-OPS-005::GAP-PKG-070` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-070` | `SHELL-CI-023::GAP-PKG-070` + `DELIV-PKG-020::GAP-PKG-070` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-070` | heredada de `HYPERCARE-OPS-005::GAP-PKG-070` | `ESPECIFICADO`    |
| `GAP-PKG-071` | `HYPERCARE-OPS-003::GAP-PKG-071` + `HYPERCARE-OPS-004::GAP-PKG-071` + `HYPERCARE-OPS-005::GAP-PKG-071` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-071` | `SHELL-CI-023::GAP-PKG-071` + `DELIV-PKG-020::GAP-PKG-071` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-071` | heredada de `HYPERCARE-OPS-005::GAP-PKG-071` | `ESPECIFICADO`    |
| `GAP-PKG-072` | `HYPERCARE-OPS-003::GAP-PKG-072` + `HYPERCARE-OPS-004::GAP-PKG-072` + `HYPERCARE-OPS-005::GAP-PKG-072` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-072` | `SHELL-CI-023::GAP-PKG-072` + `DELIV-PKG-020::GAP-PKG-072` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-072` | heredada de `HYPERCARE-OPS-005::GAP-PKG-072` | `ESPECIFICADO`    |
| `GAP-PKG-073` | `HYPERCARE-OPS-003::GAP-PKG-073` + `HYPERCARE-OPS-004::GAP-PKG-073` + `HYPERCARE-OPS-005::GAP-PKG-073` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-073` | `SHELL-CI-023::GAP-PKG-073` + `DELIV-PKG-020::GAP-PKG-073` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-073` | heredada de `HYPERCARE-OPS-005::GAP-PKG-073` | `ESPECIFICADO`    |
| `GAP-PKG-074` | `HYPERCARE-OPS-003::GAP-PKG-074` + `HYPERCARE-OPS-004::GAP-PKG-074` + `HYPERCARE-OPS-005::GAP-PKG-074` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-074` | `SHELL-CI-023::GAP-PKG-074` + `DELIV-PKG-020::GAP-PKG-074` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-074` | heredada de `HYPERCARE-OPS-005::GAP-PKG-074` | `ESPECIFICADO`    |
| `GAP-PKG-075` | `HYPERCARE-OPS-003::GAP-PKG-075` + `HYPERCARE-OPS-004::GAP-PKG-075` + `HYPERCARE-OPS-005::GAP-PKG-075` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-075` | `SHELL-CI-023::GAP-PKG-075` + `DELIV-PKG-020::GAP-PKG-075` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-075` | heredada de `HYPERCARE-OPS-005::GAP-PKG-075` | `ESPECIFICADO`    |
| `GAP-PKG-076` | `HYPERCARE-OPS-003::GAP-PKG-076` + `HYPERCARE-OPS-004::GAP-PKG-076` + `HYPERCARE-OPS-005::GAP-PKG-076` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-076` | `SHELL-CI-023::GAP-PKG-076` + `DELIV-PKG-020::GAP-PKG-076` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-076` | heredada de `HYPERCARE-OPS-005::GAP-PKG-076` | `ESPECIFICADO`    |
| `GAP-PKG-077` | `HYPERCARE-OPS-003::GAP-PKG-077` + `HYPERCARE-OPS-004::GAP-PKG-077` + `HYPERCARE-OPS-005::GAP-PKG-077` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-077` | `SHELL-CI-023::GAP-PKG-077` + `DELIV-PKG-020::GAP-PKG-077` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-077` | heredada de `HYPERCARE-OPS-005::GAP-PKG-077` | `ESPECIFICADO`    |
| `GAP-PKG-078` | `HYPERCARE-OPS-003::GAP-PKG-078` + `HYPERCARE-OPS-004::GAP-PKG-078` + `HYPERCARE-OPS-005::GAP-PKG-078` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-078` | `SHELL-CI-023::GAP-PKG-078` + `DELIV-PKG-020::GAP-PKG-078` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-078` | heredada de `HYPERCARE-OPS-005::GAP-PKG-078` | `ESPECIFICADO`    |
| `GAP-PKG-079` | `HYPERCARE-OPS-003::GAP-PKG-079` + `HYPERCARE-OPS-004::GAP-PKG-079` + `HYPERCARE-OPS-005::GAP-PKG-079` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-079` | `SHELL-CI-023::GAP-PKG-079` + `DELIV-PKG-020::GAP-PKG-079` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-079` | heredada de `HYPERCARE-OPS-005::GAP-PKG-079` | `ESPECIFICADO`    |
| `GAP-PKG-080` | `HYPERCARE-OPS-003::GAP-PKG-080` + `HYPERCARE-OPS-004::GAP-PKG-080` + `HYPERCARE-OPS-005::GAP-PKG-080` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-080` | `SHELL-CI-023::GAP-PKG-080` + `DELIV-PKG-020::GAP-PKG-080` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-080` | heredada de `HYPERCARE-OPS-005::GAP-PKG-080` | `ESPECIFICADO`    |
| `GAP-PKG-081` | `HYPERCARE-OPS-003::GAP-PKG-081` + `HYPERCARE-OPS-004::GAP-PKG-081` + `HYPERCARE-OPS-005::GAP-PKG-081` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-081` | `SHELL-CI-023::GAP-PKG-081` + `DELIV-PKG-020::GAP-PKG-081` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-081` | heredada de `HYPERCARE-OPS-005::GAP-PKG-081` | `ESPECIFICADO`    |
| `GAP-PKG-082` | `HYPERCARE-OPS-003::GAP-PKG-082` + `HYPERCARE-OPS-004::GAP-PKG-082` + `HYPERCARE-OPS-005::GAP-PKG-082` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-082` | `SHELL-CI-023::GAP-PKG-082` + `DELIV-PKG-020::GAP-PKG-082` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-082` | heredada de `HYPERCARE-OPS-005::GAP-PKG-082` | `ESPECIFICADO`    |
| `GAP-PKG-083` | `HYPERCARE-OPS-003::GAP-PKG-083` + `HYPERCARE-OPS-004::GAP-PKG-083` + `HYPERCARE-OPS-005::GAP-PKG-083` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-083` | `SHELL-CI-023::GAP-PKG-083` + `DELIV-PKG-020::GAP-PKG-083` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-083` | heredada de `HYPERCARE-OPS-005::GAP-PKG-083` | `ESPECIFICADO`    |
| `GAP-PKG-084` | `HYPERCARE-OPS-003::GAP-PKG-084` + `HYPERCARE-OPS-004::GAP-PKG-084` + `HYPERCARE-OPS-005::GAP-PKG-084` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-084` | `SHELL-CI-023::GAP-PKG-084` + `DELIV-PKG-020::GAP-PKG-084` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-084` | heredada de `HYPERCARE-OPS-005::GAP-PKG-084` | `ESPECIFICADO`    |
| `GAP-PKG-085` | `HYPERCARE-OPS-003::GAP-PKG-085` + `HYPERCARE-OPS-004::GAP-PKG-085` + `HYPERCARE-OPS-005::GAP-PKG-085` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-085` | `SHELL-CI-023::GAP-PKG-085` + `DELIV-PKG-020::GAP-PKG-085` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-085` | heredada de `HYPERCARE-OPS-005::GAP-PKG-085` | `ESPECIFICADO`    |
| `GAP-PKG-086` | `HYPERCARE-OPS-003::GAP-PKG-086` + `HYPERCARE-OPS-004::GAP-PKG-086` + `HYPERCARE-OPS-005::GAP-PKG-086` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-086` | `SHELL-CI-023::GAP-PKG-086` + `DELIV-PKG-020::GAP-PKG-086` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-086` | heredada de `HYPERCARE-OPS-005::GAP-PKG-086` | `ESPECIFICADO`    |
| `GAP-PKG-087` | `HYPERCARE-OPS-003::GAP-PKG-087` + `HYPERCARE-OPS-004::GAP-PKG-087` + `HYPERCARE-OPS-005::GAP-PKG-087` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-087` | `SHELL-CI-023::GAP-PKG-087` + `DELIV-PKG-020::GAP-PKG-087` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-087` | heredada de `HYPERCARE-OPS-005::GAP-PKG-087` | `ESPECIFICADO`    |
| `GAP-PKG-088` | `HYPERCARE-OPS-003::GAP-PKG-088` + `HYPERCARE-OPS-004::GAP-PKG-088` + `HYPERCARE-OPS-005::GAP-PKG-088` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-088` | `SHELL-CI-023::GAP-PKG-088` + `DELIV-PKG-020::GAP-PKG-088` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-088` | heredada de `HYPERCARE-OPS-005::GAP-PKG-088` | `ESPECIFICADO`    |
| `GAP-PKG-089` | `HYPERCARE-OPS-003::GAP-PKG-089` + `HYPERCARE-OPS-004::GAP-PKG-089` + `HYPERCARE-OPS-005::GAP-PKG-089` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-089` | `SHELL-CI-023::GAP-PKG-089` + `DELIV-PKG-020::GAP-PKG-089` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-089` | heredada de `HYPERCARE-OPS-005::GAP-PKG-089` | `ESPECIFICADO`    |
| `GAP-PKG-090` | `HYPERCARE-OPS-003::GAP-PKG-090` + `HYPERCARE-OPS-004::GAP-PKG-090` + `HYPERCARE-OPS-005::GAP-PKG-090` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-090` | `SHELL-CI-023::GAP-PKG-090` + `DELIV-PKG-020::GAP-PKG-090` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-090` | heredada de `HYPERCARE-OPS-005::GAP-PKG-090` | `ESPECIFICADO`    |
| `GAP-PKG-091` | `HYPERCARE-OPS-003::GAP-PKG-091` + `HYPERCARE-OPS-004::GAP-PKG-091` + `HYPERCARE-OPS-005::GAP-PKG-091` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-091` | `SHELL-CI-023::GAP-PKG-091` + `DELIV-PKG-020::GAP-PKG-091` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-091` | heredada de `HYPERCARE-OPS-005::GAP-PKG-091` | `ESPECIFICADO`    |
| `GAP-PKG-092` | `HYPERCARE-OPS-003::GAP-PKG-092` + `HYPERCARE-OPS-004::GAP-PKG-092` + `HYPERCARE-OPS-005::GAP-PKG-092` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-092` | `SHELL-CI-023::GAP-PKG-092` + `DELIV-PKG-020::GAP-PKG-092` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-092` | heredada de `HYPERCARE-OPS-005::GAP-PKG-092` | `ESPECIFICADO`    |
| `GAP-PKG-093` | `HYPERCARE-OPS-003::GAP-PKG-093` + `HYPERCARE-OPS-004::GAP-PKG-093` + `HYPERCARE-OPS-005::GAP-PKG-093` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-093` | `SHELL-CI-023::GAP-PKG-093` + `DELIV-PKG-020::GAP-PKG-093` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-093` | heredada de `HYPERCARE-OPS-005::GAP-PKG-093` | `ESPECIFICADO`    |
| `GAP-PKG-094` | `HYPERCARE-OPS-003::GAP-PKG-094` + `HYPERCARE-OPS-004::GAP-PKG-094` + `HYPERCARE-OPS-005::GAP-PKG-094` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-094` | `SHELL-CI-023::GAP-PKG-094` + `DELIV-PKG-020::GAP-PKG-094` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-094` | heredada de `HYPERCARE-OPS-005::GAP-PKG-094` | `ESPECIFICADO`    |
| `GAP-PKG-095` | `HYPERCARE-OPS-003::GAP-PKG-095` + `HYPERCARE-OPS-004::GAP-PKG-095` + `HYPERCARE-OPS-005::GAP-PKG-095` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-095` | `SHELL-CI-023::GAP-PKG-095` + `DELIV-PKG-020::GAP-PKG-095` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-095` | heredada de `HYPERCARE-OPS-005::GAP-PKG-095` | `ESPECIFICADO`    |
| `GAP-PKG-096` | `HYPERCARE-OPS-003::GAP-PKG-096` + `HYPERCARE-OPS-004::GAP-PKG-096` + `HYPERCARE-OPS-005::GAP-PKG-096` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-096` | `SHELL-CI-023::GAP-PKG-096` + `DELIV-PKG-020::GAP-PKG-096` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-096` | heredada de `HYPERCARE-OPS-005::GAP-PKG-096` | `ESPECIFICADO`    |
| `GAP-PKG-097` | `HYPERCARE-OPS-003::GAP-PKG-097` + `HYPERCARE-OPS-004::GAP-PKG-097` + `HYPERCARE-OPS-005::GAP-PKG-097` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-097` | `SHELL-CI-023::GAP-PKG-097` + `DELIV-PKG-020::GAP-PKG-097` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-097` | heredada de `HYPERCARE-OPS-005::GAP-PKG-097` | `ESPECIFICADO`    |
| `GAP-PKG-098` | `HYPERCARE-OPS-003::GAP-PKG-098` + `HYPERCARE-OPS-004::GAP-PKG-098` + `HYPERCARE-OPS-005::GAP-PKG-098` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-098` | `SHELL-CI-023::GAP-PKG-098` + `DELIV-PKG-020::GAP-PKG-098` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-098` | heredada de `HYPERCARE-OPS-005::GAP-PKG-098` | `ESPECIFICADO`    |
| `GAP-PKG-099` | `HYPERCARE-OPS-003::GAP-PKG-099` + `HYPERCARE-OPS-004::GAP-PKG-099` + `HYPERCARE-OPS-005::GAP-PKG-099` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-099` | `SHELL-CI-023::GAP-PKG-099` + `DELIV-PKG-020::GAP-PKG-099` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-099` | heredada de `HYPERCARE-OPS-005::GAP-PKG-099` | `ESPECIFICADO`    |
| `GAP-PKG-100` | `HYPERCARE-OPS-003::GAP-PKG-100` + `HYPERCARE-OPS-004::GAP-PKG-100` + `HYPERCARE-OPS-005::GAP-PKG-100` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-100` | `SHELL-CI-023::GAP-PKG-100` + `DELIV-PKG-020::GAP-PKG-100` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-100` | heredada de `HYPERCARE-OPS-005::GAP-PKG-100` | `ESPECIFICADO`    |
| `GAP-PKG-101` | `HYPERCARE-OPS-003::GAP-PKG-101` + `HYPERCARE-OPS-004::GAP-PKG-101` + `HYPERCARE-OPS-005::GAP-PKG-101` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-101` | `SHELL-CI-023::GAP-PKG-101` + `DELIV-PKG-020::GAP-PKG-101` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-101` | heredada de `HYPERCARE-OPS-005::GAP-PKG-101` | `ESPECIFICADO`    |
| `GAP-PKG-102` | `HYPERCARE-OPS-003::GAP-PKG-102` + `HYPERCARE-OPS-004::GAP-PKG-102` + `HYPERCARE-OPS-005::GAP-PKG-102` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-102` | `SHELL-CI-023::GAP-PKG-102` + `DELIV-PKG-020::GAP-PKG-102` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-102` | heredada de `HYPERCARE-OPS-005::GAP-PKG-102` | `ESPECIFICADO`    |
| `GAP-PKG-103` | `HYPERCARE-OPS-003::GAP-PKG-103` + `HYPERCARE-OPS-004::GAP-PKG-103` + `HYPERCARE-OPS-005::GAP-PKG-103` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-103` | `SHELL-CI-023::GAP-PKG-103` + `DELIV-PKG-020::GAP-PKG-103` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-103` | heredada de `HYPERCARE-OPS-005::GAP-PKG-103` | `ESPECIFICADO`    |
| `GAP-PKG-104` | `HYPERCARE-OPS-003::GAP-PKG-104` + `HYPERCARE-OPS-004::GAP-PKG-104` + `HYPERCARE-OPS-005::GAP-PKG-104` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-104` | `SHELL-CI-023::GAP-PKG-104` + `DELIV-PKG-020::GAP-PKG-104` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-104` | heredada de `HYPERCARE-OPS-005::GAP-PKG-104` | `ESPECIFICADO`    |
| `GAP-PKG-105` | `HYPERCARE-OPS-003::GAP-PKG-105` + `HYPERCARE-OPS-004::GAP-PKG-105` + `HYPERCARE-OPS-005::GAP-PKG-105` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-105` | `SHELL-CI-023::GAP-PKG-105` + `DELIV-PKG-020::GAP-PKG-105` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-105` | heredada de `HYPERCARE-OPS-005::GAP-PKG-105` | `ESPECIFICADO`    |
| `GAP-PKG-106` | `HYPERCARE-OPS-003::GAP-PKG-106` + `HYPERCARE-OPS-004::GAP-PKG-106` + `HYPERCARE-OPS-005::GAP-PKG-106` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-106` | `SHELL-CI-023::GAP-PKG-106` + `DELIV-PKG-020::GAP-PKG-106` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-106` | heredada de `HYPERCARE-OPS-005::GAP-PKG-106` | `ESPECIFICADO`    |
| `GAP-PKG-107` | `HYPERCARE-OPS-003::GAP-PKG-107` + `HYPERCARE-OPS-004::GAP-PKG-107` + `HYPERCARE-OPS-005::GAP-PKG-107` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-107` | `SHELL-CI-023::GAP-PKG-107` + `DELIV-PKG-020::GAP-PKG-107` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-107` | heredada de `HYPERCARE-OPS-005::GAP-PKG-107` | `ESPECIFICADO`    |
| `GAP-PKG-108` | `HYPERCARE-OPS-003::GAP-PKG-108` + `HYPERCARE-OPS-004::GAP-PKG-108` + `HYPERCARE-OPS-005::GAP-PKG-108` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-108` | `SHELL-CI-023::GAP-PKG-108` + `DELIV-PKG-020::GAP-PKG-108` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-108` | heredada de `HYPERCARE-OPS-005::GAP-PKG-108` | `ESPECIFICADO`    |
| `GAP-PKG-109` | `HYPERCARE-OPS-003::GAP-PKG-109` + `HYPERCARE-OPS-004::GAP-PKG-109` + `HYPERCARE-OPS-005::GAP-PKG-109` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-109` | `SHELL-CI-023::GAP-PKG-109` + `DELIV-PKG-020::GAP-PKG-109` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-109` | heredada de `HYPERCARE-OPS-005::GAP-PKG-109` | `ESPECIFICADO`    |
| `GAP-PKG-110` | `HYPERCARE-OPS-003::GAP-PKG-110` + `HYPERCARE-OPS-004::GAP-PKG-110` + `HYPERCARE-OPS-005::GAP-PKG-110` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-110` | `SHELL-CI-023::GAP-PKG-110` + `DELIV-PKG-020::GAP-PKG-110` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-110` | heredada de `HYPERCARE-OPS-005::GAP-PKG-110` | `ESPECIFICADO`    |
| `GAP-PKG-111` | `HYPERCARE-OPS-003::GAP-PKG-111` + `HYPERCARE-OPS-004::GAP-PKG-111` + `HYPERCARE-OPS-005::GAP-PKG-111` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-111` | `SHELL-CI-023::GAP-PKG-111` + `DELIV-PKG-020::GAP-PKG-111` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-111` | heredada de `HYPERCARE-OPS-005::GAP-PKG-111` | `ESPECIFICADO`    |
| `GAP-PKG-112` | `HYPERCARE-OPS-003::GAP-PKG-112` + `HYPERCARE-OPS-004::GAP-PKG-112` + `HYPERCARE-OPS-005::GAP-PKG-112` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-112` | `SHELL-CI-023::GAP-PKG-112` + `DELIV-PKG-020::GAP-PKG-112` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-112` | heredada de `HYPERCARE-OPS-005::GAP-PKG-112` | `ESPECIFICADO`    |
| `GAP-PKG-113` | `HYPERCARE-OPS-003::GAP-PKG-113` + `HYPERCARE-OPS-004::GAP-PKG-113` + `HYPERCARE-OPS-005::GAP-PKG-113` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-113` | `SHELL-CI-023::GAP-PKG-113` + `DELIV-PKG-020::GAP-PKG-113` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-113` | heredada de `HYPERCARE-OPS-005::GAP-PKG-113` | `ESPECIFICADO`    |
| `GAP-PKG-114` | `HYPERCARE-OPS-003::GAP-PKG-114` + `HYPERCARE-OPS-004::GAP-PKG-114` + `HYPERCARE-OPS-005::GAP-PKG-114` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-114` | `SHELL-CI-023::GAP-PKG-114` + `DELIV-PKG-020::GAP-PKG-114` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-114` | heredada de `HYPERCARE-OPS-005::GAP-PKG-114` | `ESPECIFICADO`    |
| `GAP-PKG-115` | `HYPERCARE-OPS-003::GAP-PKG-115` + `HYPERCARE-OPS-004::GAP-PKG-115` + `HYPERCARE-OPS-005::GAP-PKG-115` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-115` | `SHELL-CI-023::GAP-PKG-115` + `DELIV-PKG-020::GAP-PKG-115` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-115` | heredada de `HYPERCARE-OPS-005::GAP-PKG-115` | `ESPECIFICADO`    |
| `GAP-PKG-116` | `HYPERCARE-OPS-003::GAP-PKG-116` + `HYPERCARE-OPS-004::GAP-PKG-116` + `HYPERCARE-OPS-005::GAP-PKG-116` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-116` | `SHELL-CI-023::GAP-PKG-116` + `DELIV-PKG-020::GAP-PKG-116` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-116` | heredada de `HYPERCARE-OPS-005::GAP-PKG-116` | `ESPECIFICADO`    |
| `GAP-PKG-117` | `HYPERCARE-OPS-003::GAP-PKG-117` + `HYPERCARE-OPS-004::GAP-PKG-117` + `HYPERCARE-OPS-005::GAP-PKG-117` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-117` | `SHELL-CI-023::GAP-PKG-117` + `DELIV-PKG-020::GAP-PKG-117` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-117` | heredada de `HYPERCARE-OPS-005::GAP-PKG-117` | `ESPECIFICADO`    |
| `GAP-PKG-118` | `HYPERCARE-OPS-003::GAP-PKG-118` + `HYPERCARE-OPS-004::GAP-PKG-118` + `HYPERCARE-OPS-005::GAP-PKG-118` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-118` | `SHELL-CI-023::GAP-PKG-118` + `DELIV-PKG-020::GAP-PKG-118` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-118` | heredada de `HYPERCARE-OPS-005::GAP-PKG-118` | `ESPECIFICADO`    |
| `GAP-PKG-119` | `HYPERCARE-OPS-003::GAP-PKG-119` + `HYPERCARE-OPS-004::GAP-PKG-119` + `HYPERCARE-OPS-005::GAP-PKG-119` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-119` | `SHELL-CI-023::GAP-PKG-119` + `DELIV-PKG-020::GAP-PKG-119` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-119` | heredada de `HYPERCARE-OPS-005::GAP-PKG-119` | `ESPECIFICADO`    |
| `GAP-PKG-120` | `HYPERCARE-OPS-003::GAP-PKG-120` + `HYPERCARE-OPS-004::GAP-PKG-120` + `HYPERCARE-OPS-005::GAP-PKG-120` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-120` | `SHELL-CI-023::GAP-PKG-120` + `DELIV-PKG-020::GAP-PKG-120` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-120` | heredada de `HYPERCARE-OPS-005::GAP-PKG-120` | `ESPECIFICADO`    |
| `GAP-PKG-121` | `HYPERCARE-OPS-003::GAP-PKG-121` + `HYPERCARE-OPS-004::GAP-PKG-121` + `HYPERCARE-OPS-005::GAP-PKG-121` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-121` | `SHELL-CI-023::GAP-PKG-121` + `DELIV-PKG-020::GAP-PKG-121` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-121` | heredada de `HYPERCARE-OPS-005::GAP-PKG-121` | `ESPECIFICADO`    |
| `GAP-PKG-122` | `HYPERCARE-OPS-003::GAP-PKG-122` + `HYPERCARE-OPS-004::GAP-PKG-122` + `HYPERCARE-OPS-005::GAP-PKG-122` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-122` | `SHELL-CI-023::GAP-PKG-122` + `DELIV-PKG-020::GAP-PKG-122` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-122` | heredada de `HYPERCARE-OPS-005::GAP-PKG-122` | `ESPECIFICADO`    |
| `GAP-PKG-123` | `HYPERCARE-OPS-003::GAP-PKG-123` + `HYPERCARE-OPS-004::GAP-PKG-123` + `HYPERCARE-OPS-005::GAP-PKG-123` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-123` | `SHELL-CI-023::GAP-PKG-123` + `DELIV-PKG-020::GAP-PKG-123` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-123` | heredada de `HYPERCARE-OPS-005::GAP-PKG-123` | `ESPECIFICADO`    |
| `GAP-PKG-124` | `HYPERCARE-OPS-003::GAP-PKG-124` + `HYPERCARE-OPS-004::GAP-PKG-124` + `HYPERCARE-OPS-005::GAP-PKG-124` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-124` | `SHELL-CI-023::GAP-PKG-124` + `DELIV-PKG-020::GAP-PKG-124` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-124` | heredada de `HYPERCARE-OPS-005::GAP-PKG-124` | `ESPECIFICADO`    |
| `GAP-PKG-125` | `HYPERCARE-OPS-003::GAP-PKG-125` + `HYPERCARE-OPS-004::GAP-PKG-125` + `HYPERCARE-OPS-005::GAP-PKG-125` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-125` | `SHELL-CI-023::GAP-PKG-125` + `DELIV-PKG-020::GAP-PKG-125` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-125` | heredada de `HYPERCARE-OPS-005::GAP-PKG-125` | `ESPECIFICADO`    |
| `GAP-PKG-126` | `HYPERCARE-OPS-003::GAP-PKG-126` + `HYPERCARE-OPS-004::GAP-PKG-126` + `HYPERCARE-OPS-005::GAP-PKG-126` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-126` | `SHELL-CI-023::GAP-PKG-126` + `DELIV-PKG-020::GAP-PKG-126` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-126` | heredada de `HYPERCARE-OPS-005::GAP-PKG-126` | `ESPECIFICADO`    |
| `GAP-PKG-127` | `HYPERCARE-OPS-003::GAP-PKG-127` + `HYPERCARE-OPS-004::GAP-PKG-127` + `HYPERCARE-OPS-005::GAP-PKG-127` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-127` | `SHELL-CI-023::GAP-PKG-127` + `DELIV-PKG-020::GAP-PKG-127` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-127` | heredada de `HYPERCARE-OPS-005::GAP-PKG-127` | `ESPECIFICADO`    |
| `GAP-PKG-128` | `HYPERCARE-OPS-003::GAP-PKG-128` + `HYPERCARE-OPS-004::GAP-PKG-128` + `HYPERCARE-OPS-005::GAP-PKG-128` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-128` | `SHELL-CI-023::GAP-PKG-128` + `DELIV-PKG-020::GAP-PKG-128` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-128` | heredada de `HYPERCARE-OPS-005::GAP-PKG-128` | `ESPECIFICADO`    |
| `GAP-PKG-129` | `HYPERCARE-OPS-003::GAP-PKG-129` + `HYPERCARE-OPS-004::GAP-PKG-129` + `HYPERCARE-OPS-005::GAP-PKG-129` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-129` | `SHELL-CI-023::GAP-PKG-129` + `DELIV-PKG-020::GAP-PKG-129` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-129` | heredada de `HYPERCARE-OPS-005::GAP-PKG-129` | `ESPECIFICADO`    |
| `GAP-PKG-130` | `HYPERCARE-OPS-003::GAP-PKG-130` + `HYPERCARE-OPS-004::GAP-PKG-130` + `HYPERCARE-OPS-005::GAP-PKG-130` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-130` | `SHELL-CI-023::GAP-PKG-130` + `DELIV-PKG-020::GAP-PKG-130` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-130` | heredada de `HYPERCARE-OPS-005::GAP-PKG-130` | `ESPECIFICADO`    |
| `GAP-PKG-131` | `HYPERCARE-OPS-003::GAP-PKG-131` + `HYPERCARE-OPS-004::GAP-PKG-131` + `HYPERCARE-OPS-005::GAP-PKG-131` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-131` | `SHELL-CI-023::GAP-PKG-131` + `DELIV-PKG-020::GAP-PKG-131` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-131` | heredada de `HYPERCARE-OPS-005::GAP-PKG-131` | `ESPECIFICADO`    |
| `GAP-PKG-132` | `HYPERCARE-OPS-003::GAP-PKG-132` + `HYPERCARE-OPS-004::GAP-PKG-132` + `HYPERCARE-OPS-005::GAP-PKG-132` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-132` | `SHELL-CI-023::GAP-PKG-132` + `DELIV-PKG-020::GAP-PKG-132` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-132` | heredada de `HYPERCARE-OPS-005::GAP-PKG-132` | `ESPECIFICADO`    |
| `GAP-PKG-133` | `HYPERCARE-OPS-003::GAP-PKG-133` + `HYPERCARE-OPS-004::GAP-PKG-133` + `HYPERCARE-OPS-005::GAP-PKG-133` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-133` | `SHELL-CI-023::GAP-PKG-133` + `DELIV-PKG-020::GAP-PKG-133` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-133` | heredada de `HYPERCARE-OPS-005::GAP-PKG-133` | `ESPECIFICADO`    |
| `GAP-PKG-134` | `HYPERCARE-OPS-003::GAP-PKG-134` + `HYPERCARE-OPS-004::GAP-PKG-134` + `HYPERCARE-OPS-005::GAP-PKG-134` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-134` | `SHELL-CI-023::GAP-PKG-134` + `DELIV-PKG-020::GAP-PKG-134` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-134` | heredada de `HYPERCARE-OPS-005::GAP-PKG-134` | `ESPECIFICADO`    |
| `GAP-PKG-135` | `HYPERCARE-OPS-003::GAP-PKG-135` + `HYPERCARE-OPS-004::GAP-PKG-135` + `HYPERCARE-OPS-005::GAP-PKG-135` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-135` | `SHELL-CI-023::GAP-PKG-135` + `DELIV-PKG-020::GAP-PKG-135` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-135` | heredada de `HYPERCARE-OPS-005::GAP-PKG-135` | `ESPECIFICADO`    |
| `GAP-PKG-136` | `HYPERCARE-OPS-003::GAP-PKG-136` + `HYPERCARE-OPS-004::GAP-PKG-136` + `HYPERCARE-OPS-005::GAP-PKG-136` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-136` | `SHELL-CI-023::GAP-PKG-136` + `DELIV-PKG-020::GAP-PKG-136` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-136` | heredada de `HYPERCARE-OPS-005::GAP-PKG-136` | `ESPECIFICADO`    |
| `GAP-PKG-137` | `HYPERCARE-OPS-003::GAP-PKG-137` + `HYPERCARE-OPS-004::GAP-PKG-137` + `HYPERCARE-OPS-005::GAP-PKG-137` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-137` | `SHELL-CI-023::GAP-PKG-137` + `DELIV-PKG-020::GAP-PKG-137` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-137` | heredada de `HYPERCARE-OPS-005::GAP-PKG-137` | `ESPECIFICADO`    |
| `GAP-PKG-138` | `HYPERCARE-OPS-003::GAP-PKG-138` + `HYPERCARE-OPS-004::GAP-PKG-138` + `HYPERCARE-OPS-005::GAP-PKG-138` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-138` | `SHELL-CI-023::GAP-PKG-138` + `DELIV-PKG-020::GAP-PKG-138` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-138` | heredada de `HYPERCARE-OPS-005::GAP-PKG-138` | `ESPECIFICADO`    |
| `GAP-PKG-139` | `HYPERCARE-OPS-003::GAP-PKG-139` + `HYPERCARE-OPS-004::GAP-PKG-139` + `HYPERCARE-OPS-005::GAP-PKG-139` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-139` | `SHELL-CI-023::GAP-PKG-139` + `DELIV-PKG-020::GAP-PKG-139` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-139` | heredada de `HYPERCARE-OPS-005::GAP-PKG-139` | `ESPECIFICADO`    |
| `GAP-PKG-140` | `HYPERCARE-OPS-003::GAP-PKG-140` + `HYPERCARE-OPS-004::GAP-PKG-140` + `HYPERCARE-OPS-005::GAP-PKG-140` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-140` | `SHELL-CI-023::GAP-PKG-140` + `DELIV-PKG-020::GAP-PKG-140` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-140` | heredada de `HYPERCARE-OPS-005::GAP-PKG-140` | `ESPECIFICADO`    |
| `GAP-PKG-141` | `HYPERCARE-OPS-003::GAP-PKG-141` + `HYPERCARE-OPS-004::GAP-PKG-141` + `HYPERCARE-OPS-005::GAP-PKG-141` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-141` | `SHELL-CI-023::GAP-PKG-141` + `DELIV-PKG-020::GAP-PKG-141` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-141` | heredada de `HYPERCARE-OPS-005::GAP-PKG-141` | `ESPECIFICADO`    |
| `GAP-PKG-142` | `HYPERCARE-OPS-003::GAP-PKG-142` + `HYPERCARE-OPS-004::GAP-PKG-142` + `HYPERCARE-OPS-005::GAP-PKG-142` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-142` | `SHELL-CI-023::GAP-PKG-142` + `DELIV-PKG-020::GAP-PKG-142` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-142` | heredada de `HYPERCARE-OPS-005::GAP-PKG-142` | `ESPECIFICADO`    |
| `GAP-PKG-143` | `HYPERCARE-OPS-003::GAP-PKG-143` + `HYPERCARE-OPS-004::GAP-PKG-143` + `HYPERCARE-OPS-005::GAP-PKG-143` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-143` | `SHELL-CI-023::GAP-PKG-143` + `DELIV-PKG-020::GAP-PKG-143` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-143` | heredada de `HYPERCARE-OPS-005::GAP-PKG-143` | `ESPECIFICADO`    |
| `GAP-PKG-144` | `HYPERCARE-OPS-003::GAP-PKG-144` + `HYPERCARE-OPS-004::GAP-PKG-144` + `HYPERCARE-OPS-005::GAP-PKG-144` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-144` | `SHELL-CI-023::GAP-PKG-144` + `DELIV-PKG-020::GAP-PKG-144` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-144` | heredada de `HYPERCARE-OPS-005::GAP-PKG-144` | `ESPECIFICADO`    |
| `GAP-PKG-145` | `HYPERCARE-OPS-003::GAP-PKG-145` + `HYPERCARE-OPS-004::GAP-PKG-145` + `HYPERCARE-OPS-005::GAP-PKG-145` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-145` | `SHELL-CI-023::GAP-PKG-145` + `DELIV-PKG-020::GAP-PKG-145` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-145` | heredada de `HYPERCARE-OPS-005::GAP-PKG-145` | `ESPECIFICADO`    |
| `GAP-PKG-146` | `HYPERCARE-OPS-003::GAP-PKG-146` + `HYPERCARE-OPS-004::GAP-PKG-146` + `HYPERCARE-OPS-005::GAP-PKG-146` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-146` | `SHELL-CI-023::GAP-PKG-146` + `DELIV-PKG-020::GAP-PKG-146` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-146` | heredada de `HYPERCARE-OPS-005::GAP-PKG-146` | `ESPECIFICADO`    |
| `GAP-PKG-147` | `HYPERCARE-OPS-003::GAP-PKG-147` + `HYPERCARE-OPS-004::GAP-PKG-147` + `HYPERCARE-OPS-005::GAP-PKG-147` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-147` | `SHELL-CI-023::GAP-PKG-147` + `DELIV-PKG-020::GAP-PKG-147` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-147` | heredada de `HYPERCARE-OPS-005::GAP-PKG-147` | `ESPECIFICADO`    |
| `GAP-PKG-148` | `HYPERCARE-OPS-003::GAP-PKG-148` + `HYPERCARE-OPS-004::GAP-PKG-148` + `HYPERCARE-OPS-005::GAP-PKG-148` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-148` | `SHELL-CI-023::GAP-PKG-148` + `DELIV-PKG-020::GAP-PKG-148` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-148` | heredada de `HYPERCARE-OPS-005::GAP-PKG-148` | `ESPECIFICADO`    |
| `GAP-PKG-149` | `HYPERCARE-OPS-003::GAP-PKG-149` + `HYPERCARE-OPS-004::GAP-PKG-149` + `HYPERCARE-OPS-005::GAP-PKG-149` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-149` | `SHELL-CI-023::GAP-PKG-149` + `DELIV-PKG-020::GAP-PKG-149` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-149` | heredada de `HYPERCARE-OPS-005::GAP-PKG-149` | `ESPECIFICADO`    |
| `GAP-PKG-150` | `HYPERCARE-OPS-003::GAP-PKG-150` + `HYPERCARE-OPS-004::GAP-PKG-150` + `HYPERCARE-OPS-005::GAP-PKG-150` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-150` | `SHELL-CI-023::GAP-PKG-150` + `DELIV-PKG-020::GAP-PKG-150` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-150` | heredada de `HYPERCARE-OPS-005::GAP-PKG-150` | `ESPECIFICADO`    |
| `GAP-PKG-151` | `HYPERCARE-OPS-003::GAP-PKG-151` + `HYPERCARE-OPS-004::GAP-PKG-151` + `HYPERCARE-OPS-005::GAP-PKG-151` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-151` | `SHELL-CI-023::GAP-PKG-151` + `DELIV-PKG-020::GAP-PKG-151` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-151` | heredada de `HYPERCARE-OPS-005::GAP-PKG-151` | `ESPECIFICADO`    |
| `GAP-PKG-152` | `HYPERCARE-OPS-003::GAP-PKG-152` + `HYPERCARE-OPS-004::GAP-PKG-152` + `HYPERCARE-OPS-005::GAP-PKG-152` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-152` | `SHELL-CI-023::GAP-PKG-152` + `DELIV-PKG-020::GAP-PKG-152` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-152` | heredada de `HYPERCARE-OPS-005::GAP-PKG-152` | `ESPECIFICADO`    |
| `GAP-PKG-153` | `HYPERCARE-OPS-003::GAP-PKG-153` + `HYPERCARE-OPS-004::GAP-PKG-153` + `HYPERCARE-OPS-005::GAP-PKG-153` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-153` | `SHELL-CI-023::GAP-PKG-153` + `DELIV-PKG-020::GAP-PKG-153` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-153` | heredada de `HYPERCARE-OPS-005::GAP-PKG-153` | `ESPECIFICADO`    |
| `GAP-PKG-154` | `HYPERCARE-OPS-003::GAP-PKG-154` + `HYPERCARE-OPS-004::GAP-PKG-154` + `HYPERCARE-OPS-005::GAP-PKG-154` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-154` | `SHELL-CI-023::GAP-PKG-154` + `DELIV-PKG-020::GAP-PKG-154` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-154` | heredada de `HYPERCARE-OPS-005::GAP-PKG-154` | `ESPECIFICADO`    |
| `GAP-PKG-155` | `HYPERCARE-OPS-003::GAP-PKG-155` + `HYPERCARE-OPS-004::GAP-PKG-155` + `HYPERCARE-OPS-005::GAP-PKG-155` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-155` | `SHELL-CI-023::GAP-PKG-155` + `DELIV-PKG-020::GAP-PKG-155` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-155` | heredada de `HYPERCARE-OPS-005::GAP-PKG-155` | `ESPECIFICADO`    |
| `GAP-PKG-156` | `HYPERCARE-OPS-003::GAP-PKG-156` + `HYPERCARE-OPS-004::GAP-PKG-156` + `HYPERCARE-OPS-005::GAP-PKG-156` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-156` | `SHELL-CI-023::GAP-PKG-156` + `DELIV-PKG-020::GAP-PKG-156` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-156` | heredada de `HYPERCARE-OPS-005::GAP-PKG-156` | `ESPECIFICADO`    |
| `GAP-PKG-157` | `HYPERCARE-OPS-003::GAP-PKG-157` + `HYPERCARE-OPS-004::GAP-PKG-157` + `HYPERCARE-OPS-005::GAP-PKG-157` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-157` | `SHELL-CI-023::GAP-PKG-157` + `DELIV-PKG-020::GAP-PKG-157` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-157` | heredada de `HYPERCARE-OPS-005::GAP-PKG-157` | `ESPECIFICADO`    |
| `GAP-PKG-158` | `HYPERCARE-OPS-003::GAP-PKG-158` + `HYPERCARE-OPS-004::GAP-PKG-158` + `HYPERCARE-OPS-005::GAP-PKG-158` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-158` | `SHELL-CI-023::GAP-PKG-158` + `DELIV-PKG-020::GAP-PKG-158` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-158` | heredada de `HYPERCARE-OPS-005::GAP-PKG-158` | `ESPECIFICADO`    |
| `GAP-PKG-159` | `HYPERCARE-OPS-003::GAP-PKG-159` + `HYPERCARE-OPS-004::GAP-PKG-159` + `HYPERCARE-OPS-005::GAP-PKG-159` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-159` | `SHELL-CI-023::GAP-PKG-159` + `DELIV-PKG-020::GAP-PKG-159` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-159` | heredada de `HYPERCARE-OPS-005::GAP-PKG-159` | `ESPECIFICADO`    |
| `GAP-PKG-160` | `HYPERCARE-OPS-003::GAP-PKG-160` + `HYPERCARE-OPS-004::GAP-PKG-160` + `HYPERCARE-OPS-005::GAP-PKG-160` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-160` | `SHELL-CI-023::GAP-PKG-160` + `DELIV-PKG-020::GAP-PKG-160` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-160` | heredada de `HYPERCARE-OPS-005::GAP-PKG-160` | `ESPECIFICADO`    |
| `GAP-PKG-161` | `HYPERCARE-OPS-003::GAP-PKG-161` + `HYPERCARE-OPS-004::GAP-PKG-161` + `HYPERCARE-OPS-005::GAP-PKG-161` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-161` | `SHELL-CI-023::GAP-PKG-161` + `DELIV-PKG-020::GAP-PKG-161` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-161` | heredada de `HYPERCARE-OPS-005::GAP-PKG-161` | `ESPECIFICADO`    |
| `GAP-PKG-162` | `HYPERCARE-OPS-003::GAP-PKG-162` + `HYPERCARE-OPS-004::GAP-PKG-162` + `HYPERCARE-OPS-005::GAP-PKG-162` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-162` | `SHELL-CI-023::GAP-PKG-162` + `DELIV-PKG-020::GAP-PKG-162` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-162` | heredada de `HYPERCARE-OPS-005::GAP-PKG-162` | `ESPECIFICADO`    |
| `GAP-PKG-163` | `HYPERCARE-OPS-003::GAP-PKG-163` + `HYPERCARE-OPS-004::GAP-PKG-163` + `HYPERCARE-OPS-005::GAP-PKG-163` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-163` | `SHELL-CI-023::GAP-PKG-163` + `DELIV-PKG-020::GAP-PKG-163` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-163` | heredada de `HYPERCARE-OPS-005::GAP-PKG-163` | `ESPECIFICADO`    |
| `GAP-PKG-164` | `HYPERCARE-OPS-003::GAP-PKG-164` + `HYPERCARE-OPS-004::GAP-PKG-164` + `HYPERCARE-OPS-005::GAP-PKG-164` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-164` | `SHELL-CI-023::GAP-PKG-164` + `DELIV-PKG-020::GAP-PKG-164` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-164` | heredada de `HYPERCARE-OPS-005::GAP-PKG-164` | `ESPECIFICADO`    |
| `GAP-PKG-165` | `HYPERCARE-OPS-003::GAP-PKG-165` + `HYPERCARE-OPS-004::GAP-PKG-165` + `HYPERCARE-OPS-005::GAP-PKG-165` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-165` | `SHELL-CI-023::GAP-PKG-165` + `DELIV-PKG-020::GAP-PKG-165` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-165` | heredada de `HYPERCARE-OPS-005::GAP-PKG-165` | `ESPECIFICADO`    |
| `GAP-PKG-166` | `HYPERCARE-OPS-003::GAP-PKG-166` + `HYPERCARE-OPS-004::GAP-PKG-166` + `HYPERCARE-OPS-005::GAP-PKG-166` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-166` | `SHELL-CI-023::GAP-PKG-166` + `DELIV-PKG-020::GAP-PKG-166` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-166` | heredada de `HYPERCARE-OPS-005::GAP-PKG-166` | `ESPECIFICADO`    |
| `GAP-PKG-167` | `HYPERCARE-OPS-003::GAP-PKG-167` + `HYPERCARE-OPS-004::GAP-PKG-167` + `HYPERCARE-OPS-005::GAP-PKG-167` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-167` | `SHELL-CI-023::GAP-PKG-167` + `DELIV-PKG-020::GAP-PKG-167` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-167` | heredada de `HYPERCARE-OPS-005::GAP-PKG-167` | `ESPECIFICADO`    |
| `GAP-PKG-168` | `HYPERCARE-OPS-003::GAP-PKG-168` + `HYPERCARE-OPS-004::GAP-PKG-168` + `HYPERCARE-OPS-005::GAP-PKG-168` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-168` | `SHELL-CI-023::GAP-PKG-168` + `DELIV-PKG-020::GAP-PKG-168` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-168` | heredada de `HYPERCARE-OPS-005::GAP-PKG-168` | `ESPECIFICADO`    |
| `GAP-PKG-169` | `HYPERCARE-OPS-003::GAP-PKG-169` + `HYPERCARE-OPS-004::GAP-PKG-169` + `HYPERCARE-OPS-005::GAP-PKG-169` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-169` | `SHELL-CI-023::GAP-PKG-169` + `DELIV-PKG-020::GAP-PKG-169` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-169` | heredada de `HYPERCARE-OPS-005::GAP-PKG-169` | `ESPECIFICADO`    |
| `GAP-PKG-170` | `HYPERCARE-OPS-003::GAP-PKG-170` + `HYPERCARE-OPS-004::GAP-PKG-170` + `HYPERCARE-OPS-005::GAP-PKG-170` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-170` | `SHELL-CI-023::GAP-PKG-170` + `DELIV-PKG-020::GAP-PKG-170` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-170` | heredada de `HYPERCARE-OPS-005::GAP-PKG-170` | `ESPECIFICADO`    |
| `GAP-PKG-171` | `HYPERCARE-OPS-003::GAP-PKG-171` + `HYPERCARE-OPS-004::GAP-PKG-171` + `HYPERCARE-OPS-005::GAP-PKG-171` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-171` | `SHELL-CI-023::GAP-PKG-171` + `DELIV-PKG-020::GAP-PKG-171` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-171` | heredada de `HYPERCARE-OPS-005::GAP-PKG-171` | `ESPECIFICADO`    |
| `GAP-PKG-172` | `HYPERCARE-OPS-003::GAP-PKG-172` + `HYPERCARE-OPS-004::GAP-PKG-172` + `HYPERCARE-OPS-005::GAP-PKG-172` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-172` | `SHELL-CI-023::GAP-PKG-172` + `DELIV-PKG-020::GAP-PKG-172` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-172` | heredada de `HYPERCARE-OPS-005::GAP-PKG-172` | `ESPECIFICADO`    |
| `GAP-PKG-173` | `HYPERCARE-OPS-003::GAP-PKG-173` + `HYPERCARE-OPS-004::GAP-PKG-173` + `HYPERCARE-OPS-005::GAP-PKG-173` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-173` | `SHELL-CI-023::GAP-PKG-173` + `DELIV-PKG-020::GAP-PKG-173` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-173` | heredada de `HYPERCARE-OPS-005::GAP-PKG-173` | `ESPECIFICADO`    |
| `GAP-PKG-174` | `HYPERCARE-OPS-003::GAP-PKG-174` + `HYPERCARE-OPS-004::GAP-PKG-174` + `HYPERCARE-OPS-005::GAP-PKG-174` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-174` | `SHELL-CI-023::GAP-PKG-174` + `DELIV-PKG-020::GAP-PKG-174` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-174` | heredada de `HYPERCARE-OPS-005::GAP-PKG-174` | `ESPECIFICADO`    |
| `GAP-PKG-175` | `HYPERCARE-OPS-003::GAP-PKG-175` + `HYPERCARE-OPS-004::GAP-PKG-175` + `HYPERCARE-OPS-005::GAP-PKG-175` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-175` | `SHELL-CI-023::GAP-PKG-175` + `DELIV-PKG-020::GAP-PKG-175` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-175` | heredada de `HYPERCARE-OPS-005::GAP-PKG-175` | `ESPECIFICADO`    |
| `GAP-PKG-176` | `HYPERCARE-OPS-003::GAP-PKG-176` + `HYPERCARE-OPS-004::GAP-PKG-176` + `HYPERCARE-OPS-005::GAP-PKG-176` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-176` | `SHELL-CI-023::GAP-PKG-176` + `DELIV-PKG-020::GAP-PKG-176` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-176` | heredada de `HYPERCARE-OPS-005::GAP-PKG-176` | `ESPECIFICADO`    |
| `GAP-PKG-177` | `HYPERCARE-OPS-003::GAP-PKG-177` + `HYPERCARE-OPS-004::GAP-PKG-177` + `HYPERCARE-OPS-005::GAP-PKG-177` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-177` | `SHELL-CI-023::GAP-PKG-177` + `DELIV-PKG-020::GAP-PKG-177` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-177` | heredada de `HYPERCARE-OPS-005::GAP-PKG-177` | `ESPECIFICADO`    |
| `GAP-PKG-178` | `HYPERCARE-OPS-003::GAP-PKG-178` + `HYPERCARE-OPS-004::GAP-PKG-178` + `HYPERCARE-OPS-005::GAP-PKG-178` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-178` | `SHELL-CI-023::GAP-PKG-178` + `DELIV-PKG-020::GAP-PKG-178` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-178` | heredada de `HYPERCARE-OPS-005::GAP-PKG-178` | `ESPECIFICADO`    |
| `GAP-PKG-179` | `HYPERCARE-OPS-003::GAP-PKG-179` + `HYPERCARE-OPS-004::GAP-PKG-179` + `HYPERCARE-OPS-005::GAP-PKG-179` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-179` | `SHELL-CI-023::GAP-PKG-179` + `DELIV-PKG-020::GAP-PKG-179` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-179` | heredada de `HYPERCARE-OPS-005::GAP-PKG-179` | `ESPECIFICADO`    |
| `GAP-PKG-180` | `HYPERCARE-OPS-003::GAP-PKG-180` + `HYPERCARE-OPS-004::GAP-PKG-180` + `HYPERCARE-OPS-005::GAP-PKG-180` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-180` | `SHELL-CI-023::GAP-PKG-180` + `DELIV-PKG-020::GAP-PKG-180` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-180` | heredada de `HYPERCARE-OPS-005::GAP-PKG-180` | `ESPECIFICADO`    |
| `GAP-PKG-181` | `HYPERCARE-OPS-003::GAP-PKG-181` + `HYPERCARE-OPS-004::GAP-PKG-181` + `HYPERCARE-OPS-005::GAP-PKG-181` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-181` | `SHELL-CI-023::GAP-PKG-181` + `DELIV-PKG-020::GAP-PKG-181` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-181` | heredada de `HYPERCARE-OPS-005::GAP-PKG-181` | `ESPECIFICADO`    |
| `GAP-PKG-182` | `HYPERCARE-OPS-003::GAP-PKG-182` + `HYPERCARE-OPS-004::GAP-PKG-182` + `HYPERCARE-OPS-005::GAP-PKG-182` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-182` | `SHELL-CI-023::GAP-PKG-182` + `DELIV-PKG-020::GAP-PKG-182` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-182` | heredada de `HYPERCARE-OPS-005::GAP-PKG-182` | `ESPECIFICADO`    |
| `GAP-PKG-183` | `HYPERCARE-OPS-003::GAP-PKG-183` + `HYPERCARE-OPS-004::GAP-PKG-183` + `HYPERCARE-OPS-005::GAP-PKG-183` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-183` | `SHELL-CI-023::GAP-PKG-183` + `DELIV-PKG-020::GAP-PKG-183` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-183` | heredada de `HYPERCARE-OPS-005::GAP-PKG-183` | `ESPECIFICADO`    |
| `GAP-PKG-184` | `HYPERCARE-OPS-003::GAP-PKG-184` + `HYPERCARE-OPS-004::GAP-PKG-184` + `HYPERCARE-OPS-005::GAP-PKG-184` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-184` | `SHELL-CI-023::GAP-PKG-184` + `DELIV-PKG-020::GAP-PKG-184` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-184` | heredada de `HYPERCARE-OPS-005::GAP-PKG-184` | `ESPECIFICADO`    |
| `GAP-PKG-185` | `HYPERCARE-OPS-003::GAP-PKG-185` + `HYPERCARE-OPS-004::GAP-PKG-185` + `HYPERCARE-OPS-005::GAP-PKG-185` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-185` | `SHELL-CI-023::GAP-PKG-185` + `DELIV-PKG-020::GAP-PKG-185` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-185` | heredada de `HYPERCARE-OPS-005::GAP-PKG-185` | `ESPECIFICADO`    |
| `GAP-PKG-186` | `HYPERCARE-OPS-003::GAP-PKG-186` + `HYPERCARE-OPS-004::GAP-PKG-186` + `HYPERCARE-OPS-005::GAP-PKG-186` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-186` | `SHELL-CI-023::GAP-PKG-186` + `DELIV-PKG-020::GAP-PKG-186` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-186` | heredada de `HYPERCARE-OPS-005::GAP-PKG-186` | `ESPECIFICADO`    |
| `GAP-PKG-187` | `HYPERCARE-OPS-003::GAP-PKG-187` + `HYPERCARE-OPS-004::GAP-PKG-187` + `HYPERCARE-OPS-005::GAP-PKG-187` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-187` | `SHELL-CI-023::GAP-PKG-187` + `DELIV-PKG-020::GAP-PKG-187` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-187` | heredada de `HYPERCARE-OPS-005::GAP-PKG-187` | `ESPECIFICADO`    |
| `GAP-PKG-188` | `HYPERCARE-OPS-003::GAP-PKG-188` + `HYPERCARE-OPS-004::GAP-PKG-188` + `HYPERCARE-OPS-005::GAP-PKG-188` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-188` | `SHELL-CI-023::GAP-PKG-188` + `DELIV-PKG-020::GAP-PKG-188` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-188` | heredada de `HYPERCARE-OPS-005::GAP-PKG-188` | `ESPECIFICADO`    |
| `GAP-PKG-189` | `HYPERCARE-OPS-003::GAP-PKG-189` + `HYPERCARE-OPS-004::GAP-PKG-189` + `HYPERCARE-OPS-005::GAP-PKG-189` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-189` | `SHELL-CI-023::GAP-PKG-189` + `DELIV-PKG-020::GAP-PKG-189` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-189` | heredada de `HYPERCARE-OPS-005::GAP-PKG-189` | `ESPECIFICADO`    |
| `GAP-PKG-190` | `HYPERCARE-OPS-003::GAP-PKG-190` + `HYPERCARE-OPS-004::GAP-PKG-190` + `HYPERCARE-OPS-005::GAP-PKG-190` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-190` | `SHELL-CI-023::GAP-PKG-190` + `DELIV-PKG-020::GAP-PKG-190` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-190` | heredada de `HYPERCARE-OPS-005::GAP-PKG-190` | `ESPECIFICADO`    |
| `GAP-PKG-191` | `HYPERCARE-OPS-003::GAP-PKG-191` + `HYPERCARE-OPS-004::GAP-PKG-191` + `HYPERCARE-OPS-005::GAP-PKG-191` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-191` | `SHELL-CI-023::GAP-PKG-191` + `DELIV-PKG-020::GAP-PKG-191` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-191` | heredada de `HYPERCARE-OPS-005::GAP-PKG-191` | `ESPECIFICADO`    |
| `GAP-PKG-192` | `HYPERCARE-OPS-003::GAP-PKG-192` + `HYPERCARE-OPS-004::GAP-PKG-192` + `HYPERCARE-OPS-005::GAP-PKG-192` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-192` | `SHELL-CI-023::GAP-PKG-192` + `DELIV-PKG-020::GAP-PKG-192` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-192` | heredada de `HYPERCARE-OPS-005::GAP-PKG-192` | `ESPECIFICADO`    |
| `GAP-PKG-193` | `HYPERCARE-OPS-003::GAP-PKG-193` + `HYPERCARE-OPS-004::GAP-PKG-193` + `HYPERCARE-OPS-005::GAP-PKG-193` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-193` | `SHELL-CI-023::GAP-PKG-193` + `DELIV-PKG-020::GAP-PKG-193` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-193` | heredada de `HYPERCARE-OPS-005::GAP-PKG-193` | `ESPECIFICADO`    |
| `GAP-PKG-194` | `HYPERCARE-OPS-003::GAP-PKG-194` + `HYPERCARE-OPS-004::GAP-PKG-194` + `HYPERCARE-OPS-005::GAP-PKG-194` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-194` | `SHELL-CI-023::GAP-PKG-194` + `DELIV-PKG-020::GAP-PKG-194` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-194` | heredada de `HYPERCARE-OPS-005::GAP-PKG-194` | `ESPECIFICADO`    |
| `GAP-PKG-195` | `HYPERCARE-OPS-003::GAP-PKG-195` + `HYPERCARE-OPS-004::GAP-PKG-195` + `HYPERCARE-OPS-005::GAP-PKG-195` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-195` | `SHELL-CI-023::GAP-PKG-195` + `DELIV-PKG-020::GAP-PKG-195` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-195` | heredada de `HYPERCARE-OPS-005::GAP-PKG-195` | `ESPECIFICADO`    |
| `GAP-PKG-196` | `HYPERCARE-OPS-003::GAP-PKG-196` + `HYPERCARE-OPS-004::GAP-PKG-196` + `HYPERCARE-OPS-005::GAP-PKG-196` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-196` | `SHELL-CI-023::GAP-PKG-196` + `DELIV-PKG-020::GAP-PKG-196` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-196` | heredada de `HYPERCARE-OPS-005::GAP-PKG-196` | `ESPECIFICADO`    |
| `GAP-PKG-197` | `HYPERCARE-OPS-003::GAP-PKG-197` + `HYPERCARE-OPS-004::GAP-PKG-197` + `HYPERCARE-OPS-005::GAP-PKG-197` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-197` | `SHELL-CI-023::GAP-PKG-197` + `DELIV-PKG-020::GAP-PKG-197` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-197` | heredada de `HYPERCARE-OPS-005::GAP-PKG-197` | `ESPECIFICADO`    |
| `GAP-PKG-198` | `HYPERCARE-OPS-003::GAP-PKG-198` + `HYPERCARE-OPS-004::GAP-PKG-198` + `HYPERCARE-OPS-005::GAP-PKG-198` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-198` | `SHELL-CI-023::GAP-PKG-198` + `DELIV-PKG-020::GAP-PKG-198` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-198` | heredada de `HYPERCARE-OPS-005::GAP-PKG-198` | `ESPECIFICADO`    |
| `GAP-PKG-199` | `HYPERCARE-OPS-003::GAP-PKG-199` + `HYPERCARE-OPS-004::GAP-PKG-199` + `HYPERCARE-OPS-005::GAP-PKG-199` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-199` | `SHELL-CI-023::GAP-PKG-199` + `DELIV-PKG-020::GAP-PKG-199` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-199` | heredada de `HYPERCARE-OPS-005::GAP-PKG-199` | `ESPECIFICADO`    |
| `GAP-PKG-200` | `HYPERCARE-OPS-003::GAP-PKG-200` + `HYPERCARE-OPS-004::GAP-PKG-200` + `HYPERCARE-OPS-005::GAP-PKG-200` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-200` | `SHELL-CI-023::GAP-PKG-200` + `DELIV-PKG-020::GAP-PKG-200` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-200` | heredada de `HYPERCARE-OPS-005::GAP-PKG-200` | `ESPECIFICADO`    |
| `GAP-PKG-201` | `HYPERCARE-OPS-003::GAP-PKG-201` + `HYPERCARE-OPS-004::GAP-PKG-201` + `HYPERCARE-OPS-005::GAP-PKG-201` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-201` | `SHELL-CI-023::GAP-PKG-201` + `DELIV-PKG-020::GAP-PKG-201` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-201` | heredada de `HYPERCARE-OPS-005::GAP-PKG-201` | `ESPECIFICADO`    |
| `GAP-PKG-202` | `HYPERCARE-OPS-003::GAP-PKG-202` + `HYPERCARE-OPS-004::GAP-PKG-202` + `HYPERCARE-OPS-005::GAP-PKG-202` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-202` | `SHELL-CI-023::GAP-PKG-202` + `DELIV-PKG-020::GAP-PKG-202` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-202` | heredada de `HYPERCARE-OPS-005::GAP-PKG-202` | `ESPECIFICADO`    |
| `GAP-PKG-203` | `HYPERCARE-OPS-003::GAP-PKG-203` + `HYPERCARE-OPS-004::GAP-PKG-203` + `HYPERCARE-OPS-005::GAP-PKG-203` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-203` | `SHELL-CI-023::GAP-PKG-203` + `DELIV-PKG-020::GAP-PKG-203` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-203` | heredada de `HYPERCARE-OPS-005::GAP-PKG-203` | `ESPECIFICADO`    |
| `GAP-PKG-204` | `HYPERCARE-OPS-003::GAP-PKG-204` + `HYPERCARE-OPS-004::GAP-PKG-204` + `HYPERCARE-OPS-005::GAP-PKG-204` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-204` | `SHELL-CI-023::GAP-PKG-204` + `DELIV-PKG-020::GAP-PKG-204` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-204` | heredada de `HYPERCARE-OPS-005::GAP-PKG-204` | `ESPECIFICADO`    |
| `GAP-PKG-205` | `HYPERCARE-OPS-003::GAP-PKG-205` + `HYPERCARE-OPS-004::GAP-PKG-205` + `HYPERCARE-OPS-005::GAP-PKG-205` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-205` | `SHELL-CI-023::GAP-PKG-205` + `DELIV-PKG-020::GAP-PKG-205` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-205` | heredada de `HYPERCARE-OPS-005::GAP-PKG-205` | `ESPECIFICADO`    |
| `GAP-PKG-206` | `HYPERCARE-OPS-003::GAP-PKG-206` + `HYPERCARE-OPS-004::GAP-PKG-206` + `HYPERCARE-OPS-005::GAP-PKG-206` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-206` | `SHELL-CI-023::GAP-PKG-206` + `DELIV-PKG-020::GAP-PKG-206` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-206` | heredada de `HYPERCARE-OPS-005::GAP-PKG-206` | `ESPECIFICADO`    |
| `GAP-PKG-207` | `HYPERCARE-OPS-003::GAP-PKG-207` + `HYPERCARE-OPS-004::GAP-PKG-207` + `HYPERCARE-OPS-005::GAP-PKG-207` | `TI-DOM-007 / VPROC-0058`; `I1..I4 x U1..U4 -> P1..P4`; `SLA-INC-P1-V1` / `SLA-INC-P2-V1` / `SLA-INC-P3-V1` / `SLA-INC-P4-V1` | `HYPERCARE-OPS-002::GAP-PKG-207` | `SHELL-CI-023::GAP-PKG-207` + `DELIV-PKG-020::GAP-PKG-207` + autoridad de `HYPERCARE-OPS-002::GAP-PKG-207` | heredada de `HYPERCARE-OPS-005::GAP-PKG-207` | `ESPECIFICADO`    |

#### 16. Reconciliación de cobertura

| Control                          | Resultado |
| -------------------------------- | --------: |
| identidades esperadas            |       207 |
| identidades materializadas       |       207 |
| identificadores únicos           |       207 |
| faltantes                        |         0 |
| duplicados                       |         0 |
| cobertura directa heredada       |       160 |
| cobertura compartida heredada    |         3 |
| controles heredados              |        26 |
| AURA bloqueadas heredadas        |        14 |
| externas bloqueadas heredadas    |         2 |
| TALENTO fuera de línea heredadas |         2 |
| suma de distribución heredada    |       207 |

La modalidad se conserva por referencia a `HYPERCARE-OPS-005` para no inventar ni redistribuir identidades en esta tarea.

#### 17. Estados documentales y de ejecución

- la matriz anterior está `ESPECIFICADO` como plan de hypercare;
- no se declara ningún incidente real `IMPLEMENTADO`, `VALIDADO` o `CLOSED` por esta tarea;
- los incidentes reales, si aparecen, existirán durante la ejecución posterior de `SHELL-CI-023`;
- un paquete bloqueado, diferido o fuera de línea conserva su condición heredada y no obtiene un incidente ficticio;
- un cambio material de alcance, candidato, ambiente o autorización se trata mediante sus tareas propietarias y no mediante reclasificación artificial del incidente.

#### 18. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Fragmentos 04A afectados:** 0

Justificación: `HYPERCARE-OPS-006` no crea una regla empresarial, de prioridad, continuidad, integración, corrección o cierre nueva. Materializa para las 207 identidades de hypercare el consumo coordinado de protecciones ya vigentes, entre ellas `TREQ-VISO-046`, `TREQ-CONT-002`, `TREQ-CONT-005`, `TREQ-CONT-006`, `TREQ-PROC-004`, `TREQ-PROC-237`, `TREQ-PROC-241`, `TREQ-PROC-245`, `TREQ-INTEGRATION-003`, `TREQ-INTEGRATION-004`, `TREQ-INTEGRATION-142`, `TREQ-INTEGRATION-160` y `TREQ-INTEGRATION-161`.

Si durante la ejecución real de `SHELL-CI-023` aparece un defecto o regresión que requiera protección recurrente, el requisito de regresión se creará entonces con evidencia real y trazabilidad hacia el incidente correspondiente; no se inventa preventivamente en esta tarea documental.

#### 19. Criterios de aceptación

`HYPERCARE-OPS-006` queda documentalmente completa cuando se cumplen simultáneamente estas condiciones:

1. se usa `TI-DOM-007 / VPROC-0058` como único modelo transversal de caso técnico aplicable, sin state machine paralelo de hypercare;
2. `INCIDENT`, `SERVICE_REQUEST` y `UNCLASSIFIED_TRIAGE` conservan su significado vigente;
3. se materializan exactamente los niveles `I1..I4` y `U1..U4` vigentes;
4. la prioridad resulta exclusivamente de la matriz aprobada y no de selección manual;
5. `P1..P4` mantienen sus nombres y referencias SLA vigentes, sin inventar tiempos;
6. una señal de `HYPERCARE-OPS-003`, `004` o `005` no se convierte automáticamente en incidente;
7. la corrección preserva fuente de verdad, historia, identidad, idempotencia, antes/después y conciliación;
8. `RESULT_UNKNOWN` no permite repetición hasta demostrar que es segura;
9. agotamiento de retry no dispara corrección, compensación o reversión automática;
10. restauración del servicio, resolución del incidente y resolución del problema permanecen conceptos distintos;
11. `CLOSED` del caso no equivale a cierre de hypercare;
12. `HYPERCARE-OPS-007` conserva propiedad exclusiva sobre aprobación de deuda y tareas posteriores;
13. `HYPERCARE-OPS-010` conserva propiedad exclusiva sobre autoridad y evidencia de cierre de hypercare;
14. se materializan 207/207 identidades `GAP-PKG-*`, sin faltantes ni duplicados;
15. no se modifica la distribución heredada 160 + 3 + 26 + 14 + 2 + 2 = 207;
16. la tarea no ejecuta cambios físicos ni declara evidencia operativa inexistente;
17. los defectos o regresiones reales que exijan protección recurrente quedan vinculados a requisitos de regresión creados con evidencia durante la ejecución posterior, no por anticipación documental.

#### 20. Cambios físicos

Ninguno.

Esta tarea no autoriza ni ejecuta:

- código;
- migraciones;
- DDL o DML;
- backfills;
- modificaciones de datos;
- cambios de configuración;
- despliegues;
- ejecución de rollback o replay;
- cambios sobre Supabase;
- creación ficticia de incidentes;
- cierre operativo de paquetes.

#### 21. Continuidad

##### ÚLTIMA TAREA APROBADA

HYPERCARE-OPS-005 — Definir conciliaciones de datos y efectos entre dominios

##### TAREA ACTUAL APROBADA

HYPERCARE-OPS-006 — Definir clasificación, prioridad y procedimiento de corrección de incidentes

##### SIGUIENTE TAREA RESERVADA

HYPERCARE-OPS-007 — Definir registro y aprobación de deuda y tareas posteriores


### [ ] HYPERCARE-OPS-007 — Definir registro y aprobación de deuda y tareas posteriores
### [ ] HYPERCARE-OPS-008 — Definir criterio de transferencia a soporte ordinario y documentación definitiva
### [ ] HYPERCARE-OPS-009 — Definir criterio y evidencia para retirar contingencias temporales
### [ ] HYPERCARE-OPS-010 — Definir autoridad y evidencia para aprobar cierre funcional, técnico y operativo

`SHELL-CI-023` ejecutará monitoreo, conciliación, respuesta y estabilización.
`SHELL-CI-024` comprobará la salida de hypercare, la transferencia a soporte y
el destino exacto de toda deuda o incidente restante.
