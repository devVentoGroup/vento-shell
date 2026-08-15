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
