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


### [ ] HYPERCARE-OPS-002 — Definir responsables funcionales y técnicos
### [ ] HYPERCARE-OPS-003 — Definir monitoreo de errores, colas, integraciones y rendimiento
### [ ] HYPERCARE-OPS-004 — Definir monitoreo de adopción, tiempos y desviaciones operativas
### [ ] HYPERCARE-OPS-005 — Definir conciliaciones de datos y efectos entre dominios
### [ ] HYPERCARE-OPS-006 — Definir clasificación, prioridad y procedimiento de corrección de incidentes
### [ ] HYPERCARE-OPS-007 — Definir registro y aprobación de deuda y tareas posteriores
### [ ] HYPERCARE-OPS-008 — Definir criterio de transferencia a soporte ordinario y documentación definitiva
### [ ] HYPERCARE-OPS-009 — Definir criterio y evidencia para retirar contingencias temporales
### [ ] HYPERCARE-OPS-010 — Definir autoridad y evidencia para aprobar cierre funcional, técnico y operativo

`SHELL-CI-023` ejecutará monitoreo, conciliación, respuesta y estabilización.
`SHELL-CI-024` comprobará la salida de hypercare, la transferencia a soporte y
el destino exacto de toda deuda o incidente restante.
