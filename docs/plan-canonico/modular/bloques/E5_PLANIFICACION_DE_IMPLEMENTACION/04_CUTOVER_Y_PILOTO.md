### CUTOVER Y PILOTO

Estas tareas diseñan y aprueban el plan que `SHELL-CI-022` ejecutará después
de superar `SHELL-CI-021`.

### ✅ CUTOVER-OPS-001 — Definir criterio para seleccionar fecha, ventana y responsables del cutover

**Estado:** APROBADA  
**Tarea anterior:** `READY-GATE-015 — Definir autoridad y criterio para aprobar la entrada al piloto operativo`  
**Tarea siguiente:** `CUTOVER-OPS-002 — Definir secuencia de activación por sede, área, rol o proceso`  
**Tipo de tarea:** documental — definición normativa y materialización del criterio para seleccionar, por paquete y candidato autorizado, una fecha y ventana de cutover operativamente viable, resolver los responsables ya existentes que deberán estar disponibles durante esa ventana y dejar un expediente reproducible para la ejecución posterior; sin ejecutar cutover, piloto, despliegues, promociones, rollback, cambios de configuración, migraciones, DDL/DML, backfills, modificaciones de datos ni operaciones sobre Supabase  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/04_CUTOVER_Y_PILOTO.md`  
**Ejecución posterior:** `SHELL-CI-022::<package_id>` después de `SHELL-CI-021::<package_id>`  
**Cambios físicos autorizados:** ninguno  
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`CUTOVER-OPS-001` define cómo seleccionar una fecha y una ventana de cutover para una instancia concreta de paquete que ya haya recibido un handoff elegible desde `READY-GATE-015`, y cómo demostrar que durante esa ventana estarán disponibles las autoridades, responsables técnicos, responsables operativos, soporte y autoridades de recuperación que el expediente del paquete ya exige.

La tarea responde exclusivamente a estas preguntas:

```text
¿QUÉ PAQUETE, CANDIDATO, AMBIENTE Y ALCANCE ESTÁN AUTORIZADOS PARA ENTRAR?
+
¿QUÉ FECHA Y VENTANA SON COMPATIBLES CON ESE MISMO ALCANCE?
+
¿LA VENTANA PERMITE EJECUTAR, VERIFICAR Y, SI SE DISPARA, RECUPERAR SIN IMPROVISAR?
+
¿LAS AUTORIDADES Y RESPONSABLES YA DEFINIDOS ESTÁN IDENTIFICADOS Y DISPONIBLES?
+
¿LAS DEPENDENCIAS, SOPORTE, OBSERVABILIDAD Y CONDICIONES OPERATIVAS SIGUEN VIGENTES?
=
VENTANA DE CUTOVER SELECCIONABLE Y TRAZABLE
```

La selección de una fecha no constituye ejecución. La existencia de una fecha en un calendario no constituye autorización de entrada al piloto. La tarea tampoco crea una autoridad nueva: resuelve y referencia las autoridades y responsables que ya pertenecen al expediente aprobado del paquete y a sus contratos de readiness, rollout, rollback, soporte y operación.

---

#### 2. Resultado sustantivo

La tarea materializa cuatro piezas documentales por `package_id`:

1. `cutover_window_candidates::<package_id>` — conjunto de ventanas candidatas consideradas, con sus restricciones, dependencias y motivos de descarte o bloqueo;
2. `cutover_responsibility_map::<package_id>` — resolución de las autoridades y responsables ya existentes que deben cubrir la ventana, sin crear roles ni propietarios nuevos;
3. `cutover_window_decision::<package_id>` — resultado documental de selección de ventana para el mismo paquete, candidato, ambiente y alcance autorizados;
4. `cutover_window_manifest::<package_id>` — expediente único que conserva fecha, zona horaria, límites de la ventana, identidad del candidato, referencias de readiness, disponibilidad de responsables, condiciones de recuperación y evidencia de la decisión.

Estas piezas son diseño para la ejecución posterior de `SHELL-CI-022::<package_id>`. No afirman que la ventana haya ocurrido ni que sus actividades se hayan ejecutado.

---

#### 3. Alcance y fronteras

`CUTOVER-OPS-001` consume contratos ya aprobados y no los redefine.

En particular:

- consume `READY-GATE-015` como única puerta final de elegibilidad para entrada al piloto;
- consume `DELIV-PKG-019` como propietario de la estrategia de despliegue y rollout;
- consume `DELIV-PKG-020` como propietario del rollback técnico, funcional y de datos;
- consume `DELIV-PKG-022` como propietario del alcance, actores, sedes, datos, dispositivos, entorno, duración, cohortes, exclusiones y salvaguardas del piloto;
- consume `READY-GATE-010` para cobertura de soporte, responsables y escalamiento;
- consume `READY-GATE-011` para monitoreo, métricas y alertas;
- consume `READY-GATE-012` para respaldo y rollback probados;
- consume `READY-GATE-013` para la línea base previa al piloto;
- consume `READY-GATE-014` para riesgos aceptados y condiciones de suspensión;
- no redefine el criterio de autorización de entrada ya cerrado por `READY-GATE-015`;
- no define la secuencia de activación por sede, área, rol o proceso, reservada a `CUTOVER-OPS-002`;
- no define convivencia temporal con el proceso anterior, reservada a `CUTOVER-OPS-003`;
- no diseña controles contra doble registro o doble efecto, reservados a `CUTOVER-OPS-004`;
- no define conciliaciones durante el piloto, reservadas a `CUTOVER-OPS-005`;
- no define el criterio operativo de pausa, reversión o continuación, reservado a `CUTOVER-OPS-006`;
- no diseña el registro de incidentes, decisiones o cambios de alcance, reservado a `CUTOVER-OPS-007`;
- no redefine métricas del piloto, reservadas a `CUTOVER-OPS-008`;
- no decide la salida del piloto, reservada a `CUTOVER-OPS-009`;
- no define el retiro del proceso anterior, reservado a `CUTOVER-OPS-010`.

La tarea selecciona **cuándo** puede ejecutarse el cutover y **qué responsables existentes deben cubrir esa ventana**. Las tareas siguientes conservan la propiedad de cómo se activa, cómo convive, cómo se controla, cómo se concilia y cómo se decide durante y después de la ejecución.

---

#### 4. Precondición obligatoria de elegibilidad

Una ventana solo puede entrar al proceso de selección cuando exista, para la misma instancia:

```text
package_id
+
candidato
+
ambiente
+
alcance autorizado
+
pilot_entry_decision = APROBAR_ENTRADA
```

La referencia a `READY-GATE-015` debe demostrar que la decisión de entrada:

1. corresponde exactamente al mismo `package_id`;
2. corresponde al mismo candidato o revisión que se pretende ejecutar;
3. corresponde al mismo ambiente;
4. corresponde al mismo alcance autorizado de sedes, actores, procesos, datos, dispositivos o superficies aplicables;
5. permanece vigente y no ha sido invalidada por un cambio material posterior.

`DENEGAR_ENTRADA`, `BLOQUEAR_DECISION` o ausencia de decisión válida impiden seleccionar una ventana ejecutable.

Cuando `READY-GATE-015` haya resuelto `NO_APLICA`, `CUTOVER-OPS-001` no fabricará una ventana de cutover para esa instancia. Si el modelo aprobado del paquete depende de la ventana de otra raíz o cohorte y no posee una ventana independiente, esa dependencia deberá quedar referenciada de forma explícita y no podrá convertirse en una ventana autónoma por inferencia.

---

#### 5. Unidad de selección

La unidad mínima de selección de ventana es:

```text
package_id
+
candidate_ref
+
environment
+
authorized_scope_ref
+
cutover_date
+
window_start
+
window_end
+
timezone
```

No se permite una fecha sin zona horaria ni una “ventana abierta” sin inicio y fin identificables.

Una misma fecha puede contener más de una ventana candidata, pero solo podrá quedar seleccionada aquella cuya compatibilidad haya sido evaluada contra el mismo candidato, ambiente, alcance, responsables y dependencias.

La selección no transforma una ventana candidata en una autorización para ampliar cohorte, sede, rol, proceso, dispositivo, dato o ambiente.

---

#### 6. Fuentes obligatorias para construir las ventanas candidatas

Las ventanas candidatas deberán derivarse exclusivamente de información vigente del mismo expediente:

1. decisión de entrada de `READY-GATE-015`;
2. artefacto, ambiente y estrategia de rollout de `DELIV-PKG-019`;
3. objetivos, disparadores, autoridad y procedimiento de recuperación de `DELIV-PKG-020`;
4. alcance y modalidad de piloto de `DELIV-PKG-022`;
5. cobertura de soporte y escalamiento confirmada por `READY-GATE-010`;
6. cobertura de observabilidad confirmada por `READY-GATE-011`;
7. evidencia de respaldo y rollback aplicable confirmada por `READY-GATE-012`;
8. línea base vigente de `READY-GATE-013`;
9. riesgos aceptados y condiciones de suspensión vigentes de `READY-GATE-014`;
10. dependencias, precondiciones, calendarios, restricciones operativas o disponibilidades que ya estén materializadas en las fuentes propietarias del paquete.

Si una restricción necesaria no está materializada en una fuente canónica o en evidencia de readiness, no se inventa. La ausencia que impida determinar la viabilidad de la ventana produce bloqueo de selección y debe conservar propietario y condición de salida.

---

#### 7. Criterios para seleccionar la fecha

Una fecha candidata es elegible únicamente cuando, para el alcance evaluado:

1. la decisión `APROBAR_ENTRADA` sigue vigente;
2. el candidato y ambiente no han cambiado desde la decisión de readiness;
3. no existe una dependencia obligatoria abierta que impida la ejecución;
4. las restricciones operativas materializadas permiten realizar el cutover en esa fecha;
5. los responsables obligatorios pueden cubrir la ventana completa que les corresponda;
6. soporte, monitoreo y escalamiento permanecen disponibles durante la exposición prevista;
7. la capacidad de recuperación requerida puede ejercerse dentro de la ventana o de la reserva explícitamente asociada;
8. las condiciones de suspensión vigentes no están ya materializadas antes de iniciar;
9. cualquier tercero, proveedor o dependencia externa necesaria tiene disponibilidad confirmada cuando el contrato del paquete la exige;
10. la fecha permite conservar evidencia, trazabilidad y handoff sin crear periodos sin propietario.

No se establece un día de la semana, horario nocturno, horario comercial, duración mínima universal ni “mejor momento” global. Esas decisiones dependen de las restricciones y evidencias de cada paquete.

Una fecha con menor actividad operativa no se considera automáticamente mejor. Una fecha más cercana tampoco prevalece sobre otra si reduce cobertura, recuperación, observabilidad o disponibilidad de autoridad.

---

#### 8. Composición obligatoria de la ventana

La ventana seleccionada deberá reservar capacidad temporal suficiente para las actividades aplicables del paquete sin imponer duraciones universales.

Como mínimo deberá distinguir:

1. **checkpoint previo** — confirmación inmediata de que candidato, ambiente, alcance, responsables y condiciones de entrada siguen siendo los autorizados;
2. **intervalo de ejecución** — tiempo previsto para las acciones que `SHELL-CI-022::<package_id>` ejecutará conforme al plan aprobado;
3. **intervalo de verificación inmediata** — tiempo necesario para comprobar señales y resultados que el plan exija antes de dar por terminada la ventana técnica;
4. **reserva de recuperación** — capacidad temporal compatible con el objetivo y procedimiento de rollback, recovery, compensation o reconciliation de `DELIV-PKG-020` cuando aplique;
5. **handoff operativo** — punto en el que la responsabilidad pasa de la ejecución del cutover a la observación o fase posterior definida por las tareas siguientes.

Estas divisiones no presuponen que todas las actividades deban ser secuenciales ni fijan minutos u horas por defecto. La duración deberá derivarse de la estrategia, complejidad, objetivos de recuperación, evidencia y condiciones reales del paquete.

La ventana es inválida si solo alcanza para “hacer el cambio” pero no permite cumplir las verificaciones y la capacidad de recuperación que el expediente exige.

---

#### 9. Resolución de responsables

`cutover_responsibility_map::<package_id>` deberá resolver personas, actores, funciones o autoridades reales a partir de identidades ya aprobadas. No podrá crear un rol universal de “jefe de cutover” ni asignar un `OWN-*` distinto por conveniencia.

La resolución deberá cubrir, cuando aplique:

| Responsabilidad durante la ventana                   | Fuente de autoridad                                                                            |
| ---------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| decisión sobre la ventana seleccionada y su vigencia | `Responsable de decisión` `OWN-*` ya asignado al paquete                                       |
| ejecución técnica del cambio                         | propietario o ejecutor técnico materializado por el expediente de implementación del paquete   |
| disponibilidad y coordinación del alcance operativo  | propietario o responsable operativo ya materializado para el proceso, sede o cohorte aplicable |
| soporte y escalamiento                               | responsables vigentes demostrados por `READY-GATE-010`                                         |
| observación y respuesta ante señales                 | propietarios y receptores vigentes demostrados por `READY-GATE-011`                            |
| decisión o ejecución de recuperación                 | autoridad y ejecutores definidos por `DELIV-PKG-020`, preservando su segregación               |
| decisión frente a riesgo o condición de suspensión   | autoridad definida por `READY-GATE-014` y los contratos que dicha puerta consume               |

Reglas:

1. una misma persona solo podrá cubrir varias responsabilidades cuando la autorización y segregación vigentes lo permitan;
2. la disponibilidad nominal no equivale a autoridad;
3. un proveedor puede ejecutar o asistir dentro de su alcance, pero no hereda autoridad empresarial por estar disponible;
4. un responsable sin suplencia requerida o sin mecanismo de escalamiento aplicable bloquea la ventana;
5. ninguna ausencia se resuelve creando un propietario ad hoc dentro de esta tarea;
6. cualquier identidad pendiente deberá conservar la fuente propietaria que debe resolverla antes de seleccionar la ventana.

---

#### 10. Cobertura temporal de responsables

La disponibilidad se evalúa contra el intervalo en el que cada responsabilidad puede ser requerida, no solo contra el instante de inicio.

La selección deberá demostrar, cuando aplique:

- cobertura desde el checkpoint previo hasta el cierre de la ejecución;
- continuidad de responsable durante cambios de turno;
- cobertura del intervalo de verificación inmediata;
- disponibilidad de la autoridad y ejecutores de recuperación durante toda la reserva aplicable;
- cobertura de soporte y observabilidad durante el periodo exigido por el paquete;
- mecanismo de handoff cuando una persona deje de estar disponible antes de terminar su obligación.

Un contacto “de guardia” sin alcance, aceptación o canal verificables no constituye cobertura. El silencio de un responsable tampoco constituye aceptación de la ventana.

---

#### 11. Compatibilidad con rollout y piloto

La ventana de cutover no reemplaza la estrategia progresiva de `DELIV-PKG-019` ni la duración del piloto de `DELIV-PKG-022`.

Por tanto:

1. `CUTOVER-OPS-001` no fuerza `FULL`, `LIMITED`, `PILOT`, `SHADOW` ni otro estado de activación;
2. cualquier cohorte, canary, pausa o promoción sigue gobernada por los contratos propietarios correspondientes;
3. la duración posterior del piloto no se reduce a la duración de la ventana de cutover;
4. cuando `DELIV-PKG-022` exija una ventana de piloto que continúe durante días o ciclos operativos, la fecha de cutover únicamente establece el inicio autorizado de la exposición correspondiente;
5. una raíz compartida, de control o sin ventana independiente conserva el tratamiento aprobado en `DELIV-PKG-022` y no recibe un cutover artificial;
6. las raíces AURA, TALENTO o dependencias externas conservan sus bloqueos mientras sus condiciones propietarias sigan abiertas.

---

#### 12. Conflictos y concurrencia

Dos o más ventanas de paquetes podrán coexistir únicamente si sus expedientes permiten demostrar que la concurrencia no rompe dependencias, capacidad de recuperación, soporte, observabilidad, segregación ni ownership.

Si existen paquetes con:

- dependencia de implementación entre sí;
- recursos técnicos compartidos;
- misma cohorte o proceso crítico;
- misma autoridad de recuperación;
- cobertura de soporte limitada;
- ventanas de terceros incompatibles;
- efectos cuya separación no puede demostrarse;

la selección deberá conservar la dependencia y bloquear la simultaneidad hasta que una fuente propietaria permita demostrar compatibilidad.

`CUTOVER-OPS-001` no inventa un algoritmo global de prioridad entre paquetes. Cuando varias ventanas sean igualmente elegibles, la decisión deberá quedar atribuida al `Responsable de decisión` vigente y sustentada en restricciones u objetivos ya materializados, no en un orden implícito.

---

#### 13. Resultado documental de cada ventana candidata

Cada ventana candidata tendrá uno de estos resultados documentales:

| Resultado      | Condición                                                                                                                                                        |
| -------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `SELECCIONADA` | satisface todas las precondiciones aplicables, tiene responsables resueltos y constituye la ventana elegida para el mismo paquete, candidato, ambiente y alcance |
| `DESCARTADA`   | es evaluable pero existe otra ventana elegida o una restricción material documentada demuestra que no debe utilizarse                                            |
| `BLOQUEADA`    | falta evidencia, identidad, disponibilidad, autoridad o resolución suficiente para determinar que la ventana puede ejecutarse de forma gobernada                 |
| `NO_APLICA`    | el modelo aprobado demuestra que la instancia no posee una ventana de cutover independiente                                                                      |

Solo puede existir una `SELECCIONADA` vigente por la misma instancia de `package_id + candidate_ref + environment + authorized_scope_ref`.

`DESCARTADA` no equivale a fallo del paquete. `BLOQUEADA` no puede transformarse en `SELECCIONADA` por decisión verbal sin resolver la causa. `NO_APLICA` requiere trazabilidad al modelo aprobado y no se usa para ocultar una ventana pendiente.

---

#### 14. Contenido mínimo de `cutover_window_manifest::<package_id>`

El manifiesto de la ventana seleccionada deberá conservar, como mínimo:

| Campo                         | Regla                                                                           |
| ----------------------------- | ------------------------------------------------------------------------------- |
| `package_id`                  | identidad canónica exacta del paquete                                           |
| `candidate_ref`               | candidato o revisión autorizado                                                 |
| `environment`                 | ambiente exacto autorizado                                                      |
| `authorized_scope_ref`        | referencia al alcance aprobado sin ampliaciones                                 |
| `pilot_entry_decision_ref`    | referencia vigente a `APROBAR_ENTRADA` de `READY-GATE-015`                      |
| `cutover_date`                | fecha civil de la ventana                                                       |
| `window_start`                | inicio exacto                                                                   |
| `window_end`                  | fin exacto                                                                      |
| `timezone`                    | zona horaria explícita aplicable                                                |
| `rollout_plan_ref`            | referencia al contrato aplicable de `DELIV-PKG-019`                             |
| `recovery_plan_ref`           | referencia al contrato aplicable de `DELIV-PKG-020`                             |
| `pilot_scope_ref`             | referencia al alcance aplicable de `DELIV-PKG-022`                              |
| `support_readiness_ref`       | evidencia vigente de cobertura de `READY-GATE-010`                              |
| `observability_readiness_ref` | evidencia vigente de `READY-GATE-011`                                           |
| `rollback_readiness_ref`      | evidencia vigente de `READY-GATE-012`                                           |
| `baseline_ref`                | referencia vigente de `READY-GATE-013`                                          |
| `risk_ref`                    | referencia vigente de `READY-GATE-014`                                          |
| `responsibility_map_ref`      | mapa de responsables resueltos para la ventana                                  |
| `candidate_windows_ref`       | conjunto de ventanas consideradas y su disposición                              |
| `selection_result`            | `SELECCIONADA`, `DESCARTADA`, `BLOQUEADA` o `NO_APLICA` según corresponda       |
| `decision_actor`              | autoridad existente que adopta la selección                                     |
| `decision_at`                 | momento atribuible de la decisión                                               |
| `blocking_reason`             | causa concreta cuando exista bloqueo                                            |
| `blocking_owner`              | propietario canónico de resolver la causa                                       |
| `evidence_refs`               | referencias suficientes para reproducir la selección, sin secretos innecesarios |

La identidad temporal del manifiesto debe ser inequívoca. Cambiar fecha, inicio, fin, zona horaria, candidato, ambiente o alcance produce una nueva decisión de ventana; no se corrige silenciosamente el manifiesto anterior como si nunca hubiera existido.

---

#### 15. Invalidez y revalidación de una ventana seleccionada

Una ventana deja de ser ejecutable cuando, antes de su inicio, ocurre cualquiera de estas condiciones:

1. cambia el candidato o revisión;
2. cambia el ambiente;
3. cambia el alcance autorizado;
4. `READY-GATE-015` deja de respaldar `APROBAR_ENTRADA` para la misma instancia;
5. aparece una condición de suspensión aplicable de `READY-GATE-014`;
6. cambia materialmente la estrategia de rollout o la capacidad de recuperación;
7. desaparece cobertura obligatoria de responsable, soporte, observabilidad o rollback;
8. una dependencia obligatoria pasa a estado abierto o no demostrable;
9. la evidencia necesaria vence, queda obsoleta o deja de corresponder al mismo candidato;
10. la ventana ya transcurrió sin ejecución.

La consecuencia es volver a evaluar la selección con las fuentes propietarias actualizadas. Esta tarea no reabre ni corrige por sí sola una puerta de readiness, un plan de rollout, un rollback o una decisión de riesgo.

Una reprogramación no puede preservar artificialmente una autorización que estaba vinculada a condiciones ya cambiadas.

---

#### 16. Evidencia suficiente e insuficiente

Puede sustentar la selección, según corresponda:

- decisión reproducible de `READY-GATE-015`;
- calendario o disponibilidad operativa atribuible;
- evidencia vigente de cobertura de responsables;
- referencias de rollout y recovery aprobadas;
- disponibilidad confirmada de terceros obligatorios;
- evidencia de soporte, observabilidad, rollback, baseline y riesgo vigente;
- registro de restricciones o dependencias que justifique selección, descarte o bloqueo;
- aceptación trazable de la autoridad que selecciona la ventana.

No es suficiente por sí solo:

- una invitación de calendario;
- un mensaje de chat con una fecha;
- “todos están disponibles” sin identidades y alcance;
- una fecha histórica usada por otro paquete;
- una ventana de mantenimiento genérica sin correlación con el candidato;
- un `APROBAR_ENTRADA` perteneciente a otro candidato, ambiente o alcance;
- disponibilidad del proveedor sin autoridad ni responsables internos;
- un plan de rollback documental sin readiness vigente cuando la puerta aplicable exige evidencia;
- ausencia de incidentes como prueba de que una fecha es segura;
- una estimación de duración sin fuente en el expediente;
- una ventana que no deja capacidad para las verificaciones y recuperación exigibles.

---

#### 17. Tratamiento de bloqueos

Todo `BLOQUEADA` deberá identificar:

1. causa concreta;
2. fuente que impide resolverla;
3. propietario canónico de la resolución;
4. condición objetiva de salida;
5. evidencia que deberá actualizarse;
6. efecto sobre la ventana y sobre cualquier ventana dependiente.

No se permite un pendiente narrativo sin dueño documental.

Si el bloqueo pertenece a readiness, rollout, rollback, piloto, soporte, observabilidad, riesgo o identidad física, la corrección deberá ocurrir en la fuente propietaria correspondiente antes de recalcular la selección.

---

#### 18. Handoff a `CUTOVER-OPS-002`

`CUTOVER-OPS-001` entrega a `CUTOVER-OPS-002` únicamente una frontera temporal y de responsabilidad ya seleccionada:

```text
PAQUETE / CANDIDATO / AMBIENTE / ALCANCE
+
FECHA / INICIO / FIN / ZONA HORARIA
+
RESPONSABLES Y AUTORIDADES RESUELTOS
+
REFERENCIAS VIGENTES DE READINESS / ROLLOUT / RECOVERY
=
VENTANA BASE PARA DISEÑAR LA SECUENCIA DE ACTIVACIÓN
```

`CUTOVER-OPS-002` podrá ordenar la activación dentro de esa frontera, pero no deberá reinterpretar una ventana `BLOQUEADA` como ejecutable ni cambiar silenciosamente fecha, candidato, ambiente, alcance o autoridad.

---

#### 19. Separación entre planificación y ejecución

La secuencia permanece:

```text
SHELL-CI-020::<package_id>
→ implementación aplicable
→ SHELL-CI-021::<package_id>
→ READY-GATE-015 resuelto
→ plan CUTOVER-OPS aplicable
→ SHELL-CI-022::<package_id>
```

`SHELL-CI-022::<package_id>` será quien conserve durante la ejecución real paquete, versión, ambiente, ventana, actor, decisión y evidencia.

Esta tarea:

- no reserva calendarios reales;
- no envía invitaciones;
- no despliega;
- no activa cohortes;
- no ejecuta pruebas productivas;
- no inicia el piloto;
- no ejecuta rollback;
- no cambia datos;
- no modifica configuración;
- no modifica Supabase.

---

#### 20. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** `CUTOVER-OPS-001` materializa un criterio documental de selección temporal y resolución de responsables para ejecutar posteriormente contratos ya aprobados. No crea comportamiento empresarial, transición de estado de negocio, autorización server-side, regla de cálculo, contrato de integración, persistencia, SLA, algoritmo de rollout, mecanismo de rollback ni conducta de runtime nueva. La ejecución y evidencia física permanecen asignadas a `SHELL-CI-022::<package_id>`, mientras rollout, rollback, alcance de piloto y readiness conservan sus autoridades propietarias.

**Requisitos TREQ-* creados:** 0  
**Requisitos TREQ-* modificados:** 0  
**Fragmentos 04A afectados:** 0

---

#### 21. Criterios de aceptación documental

`CUTOVER-OPS-001` queda documentalmente completo cuando:

1. la tarea conserva `READY-GATE-015 → CUTOVER-OPS-001 → CUTOVER-OPS-002`;
2. una ventana solo puede seleccionarse para la misma instancia que conserva `APROBAR_ENTRADA`;
3. paquete, candidato, ambiente, alcance, fecha, inicio, fin y zona horaria quedan identificados;
4. se prohíbe usar una decisión de readiness de otro candidato, ambiente o alcance;
5. se materializa un conjunto de ventanas candidatas y su disposición;
6. la fecha se selecciona por restricciones y evidencia del paquete, sin horario o duración universal inventados;
7. la ventana contempla checkpoint previo, ejecución, verificación, capacidad de recuperación y handoff cuando apliquen;
8. la duración de la ventana no se confunde con la duración del piloto;
9. `DELIV-PKG-019` conserva rollout y promoción;
10. `DELIV-PKG-020` conserva rollback técnico, funcional y de datos;
11. `DELIV-PKG-022` conserva alcance, cohortes y duración de piloto;
12. `READY-GATE-010..014` conservan sus autoridades de soporte, observabilidad, rollback probado, baseline y riesgo;
13. el `Responsable de decisión` `OWN-*` se reutiliza desde el paquete sin crear una autoridad global nueva;
14. responsables técnicos, operativos, de soporte, observabilidad y recuperación se resuelven desde fuentes existentes;
15. disponibilidad nominal no se confunde con autoridad;
16. proveedor externo no sustituye ownership ni autoridad interna;
17. una ventana sin cobertura de responsabilidades obligatorias queda bloqueada;
18. concurrencia entre paquetes exige compatibilidad demostrable y no se presume;
19. se definen `SELECCIONADA`, `DESCARTADA`, `BLOQUEADA` y `NO_APLICA` con semántica inequívoca;
20. existe como máximo una ventana `SELECCIONADA` vigente para la misma instancia;
21. todo bloqueo tiene causa, propietario y condición de salida;
22. cambios materiales invalidan la ejecutabilidad de la ventana y exigen revalidación;
23. `cutover_window_manifest::<package_id>` conserva los campos mínimos para reproducir la decisión;
24. `CUTOVER-OPS-002` recibe la frontera temporal sin que esta tarea adelante la secuencia de activación;
25. la ejecución real permanece en `SHELL-CI-022::<package_id>`;
26. no se ejecutan cambios físicos, código, despliegues, migraciones, DDL/DML, backfills, modificaciones de datos, configuración remota ni operaciones de Supabase;
27. se crean cero requisitos `TREQ-*`, se modifican cero requisitos `TREQ-*` y se afectan cero fragmentos 04A.

---

#### 22. Continuidad

##### ÚLTIMA TAREA APROBADA
READY-GATE-015 — Definir autoridad y criterio para aprobar la entrada al piloto operativo

##### TAREA ACTUAL APROBADA
CUTOVER-OPS-001 — Definir criterio para seleccionar fecha, ventana y responsables del cutover

##### SIGUIENTE TAREA RESERVADA
CUTOVER-OPS-002 — Definir secuencia de activación por sede, área, rol o proceso


### [ ] CUTOVER-OPS-002 — Definir secuencia de activación por sede, área, rol o proceso
### [ ] CUTOVER-OPS-003 — Definir convivencia temporal con el proceso anterior
### [ ] CUTOVER-OPS-004 — Diseñar controles contra doble registro y doble efecto durante la transición
### [ ] CUTOVER-OPS-005 — Definir conciliaciones durante el piloto
### [ ] CUTOVER-OPS-006 — Definir criterio de pausa, reversión o continuación
### [ ] CUTOVER-OPS-007 — Diseñar el registro de incidentes, decisiones y cambios de alcance
### [ ] CUTOVER-OPS-008 — Definir métricas de tiempos, errores, adopción y resultado empresarial
### [ ] CUTOVER-OPS-009 — Definir autoridad y criterio para aprobar salida del piloto o exigir correcciones
### [ ] CUTOVER-OPS-010 — Definir condiciones y evidencia para retirar el proceso anterior

La ejecución real conservará paquete, versión, ambiente, ventana, actor,
decisión y evidencia mediante `SHELL-CI-022`. Los defectos encontrados deberán
generar una tarea de corrección exacta y un requisito de regresión antes de
continuar o cerrar.
