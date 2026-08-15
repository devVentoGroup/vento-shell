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


### ✅ CUTOVER-OPS-002 — Definir secuencia de activación por sede, área, rol o proceso

**Estado:** APROBADA  
**Tarea anterior:** `CUTOVER-OPS-001 — Definir criterio para seleccionar fecha, ventana y responsables del cutover`  
**Tarea siguiente:** `CUTOVER-OPS-003 — Definir convivencia temporal con el proceso anterior`  
**Tipo de tarea:** documental — definición normativa y materialización de la secuencia de activación por paquete dentro de la ventana de cutover ya seleccionada, resolviendo unidades y olas por sede, área, rol, proceso o intersección aplicable sin ampliar el alcance autorizado ni ejecutar activaciones, promociones, despliegues, rollback, cambios de configuración, migraciones, DDL/DML, backfills, modificaciones de datos u operaciones sobre Supabase

---

#### 1. Propósito

`CUTOVER-OPS-002` define el orden concreto que deberá seguir una instancia de paquete durante el cutover para exponer únicamente el alcance ya autorizado, dentro de la ventana seleccionada por `CUTOVER-OPS-001` y conforme a los contratos de rollout y piloto ya aprobados.

La tarea responde exclusivamente a esta pregunta:

```text
DADO UN PAQUETE ELEGIBLE,
CON CANDIDATO, AMBIENTE, ALCANCE Y VENTANA YA FIJADOS,
¿QUÉ UNIDADES DEL ALCANCE PUEDEN ACTIVARSE,
EN QUÉ ORDEN,
CUÁLES PUEDEN COMPARTIR UNA MISMA OLA,
Y QUÉ DEPENDENCIAS DEBEN PERMANECER CERRADAS
ANTES DE PASAR A LA SIGUIENTE UNIDAD?
```

La tarea no selecciona nuevamente la fecha, no amplía la cohorte, no redefine porcentajes de rollout y no decide todavía cuándo pausar, revertir o continuar. Su resultado es una secuencia documental consumible que `SHELL-CI-022::<package_id>` podrá ejecutar únicamente después de que todos los contratos de cutover aplicables hayan quedado aprobados.

---

#### 2. Resultado sustantivo

Por cada instancia ejecutable de `package_id`, la tarea materializa cuatro piezas:

1. `activation_dimension_resolution::<package_id>` — decisión de qué dimensión o intersección de dimensiones puede aislar de forma válida la exposición: sede, área, rol, proceso o combinación aplicable;
2. `activation_unit_set::<package_id>` — conjunto exhaustivo de unidades de activación dentro del alcance ya autorizado, sin agregar identidades externas;
3. `activation_sequence_plan::<package_id>` — olas ordenadas, dependencias entre unidades, reglas de serialización o paralelismo y puntos obligatorios de decisión;
4. `activation_sequence_manifest::<package_id>` — expediente reproducible que enlaza paquete, candidato, ambiente, alcance, ventana, modalidad de piloto, perfil de rollout, unidades, olas, responsables y contratos posteriores requeridos antes de la ejecución.

El resultado documental de esta tarea es `ESPECIFICADO`. Ninguna unidad queda `IMPLEMENTADA`, `VALIDADA` ni efectivamente activada por aprobar este documento.

---

#### 3. Entradas obligatorias y frontera de autoridad

`CUTOVER-OPS-002` consume, sin redefinirlos:

- `CUTOVER-OPS-001`: paquete, candidato, ambiente, alcance, fecha, inicio, fin, zona horaria y responsables de la ventana;
- `READY-GATE-015`: elegibilidad final de entrada para la misma instancia;
- `DELIV-PKG-015`: dependencias y orden técnico consolidado del paquete;
- `DELIV-PKG-018`: control de activación, estado seguro y especialización del perfil;
- `DELIV-PKG-019`: etapas de rollout, cohortes, canary, pausas de evidencia y promoción;
- `DELIV-PKG-020`: recuperación y rollback aplicables;
- `DELIV-PKG-022`: modalidad y alcance exacto del piloto;
- `READY-GATE-010..014`: soporte, observabilidad, rollback probado, línea base y riesgo vigentes.

La tarea no sustituye:

- `CUTOVER-OPS-003`, propietaria de la convivencia temporal con el proceso anterior;
- `CUTOVER-OPS-004`, propietaria de los controles contra doble registro y doble efecto;
- `CUTOVER-OPS-005`, propietaria de las conciliaciones durante el piloto;
- `CUTOVER-OPS-006`, propietaria del criterio de pausa, reversión o continuación;
- `CUTOVER-OPS-007`, propietaria del registro de incidentes, decisiones y cambios de alcance;
- `CUTOVER-OPS-008`, propietaria de las métricas de tiempos, errores, adopción y resultado empresarial;
- `CUTOVER-OPS-009`, propietaria de la salida del piloto;
- `CUTOVER-OPS-010`, propietaria del retiro del proceso anterior.

---

#### 4. Precondición para construir una secuencia ejecutable

Una secuencia solo puede quedar marcada como `SECUENCIADA` cuando existe una ventana `SELECCIONADA` y vigente en `CUTOVER-OPS-001` para exactamente:

```text
package_id
+
candidate_ref
+
environment
+
authorized_scope_ref
+
cutover_window_ref
```

La secuencia no puede:

1. reutilizar una ventana perteneciente a otro candidato;
2. incorporar una sede, área, rol, proceso, actor, dispositivo o dato fuera del alcance autorizado;
3. cambiar el ambiente;
4. cambiar la autoridad de decisión;
5. reemplazar una ventana bloqueada por una secuencia teórica;
6. convertir una instancia `NO_APLICA` en una activación directa.

Si cualquiera de esas identidades cambia, la secuencia deja de ser ejecutable y debe recalcularse sobre una ventana válida.

---

#### 5. Universo territorial permitido

Cuando la dimensión territorial aplique, la secuencia solo podrá utilizar sedes ya incluidas en el alcance aprobado.

El universo territorial canónico disponible para `SITE-DIR-001` permanece limitado a:

- `Oficina 1`;
- `Centro de Producción`;
- `Vento Café`;
- `Saudo`;
- `Molka`.

La pertenencia de una sede a este universo no implica que deba participar en un paquete concreto. Cada instancia utilizará exclusivamente la intersección entre este universo y `authorized_scope_ref`.

No se crea una sede nueva para facilitar una ola de activación.

---

#### 6. Dimensiones de secuenciación

Las dimensiones admitidas son:

| Dimensión   | Uso válido                                                                                                                                                 |
| ----------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `SEDE`      | separar exposición entre sedes o puntos ya autorizados cuando cada unidad pueda operar, observarse y recuperarse de forma independiente                    |
| `AREA`      | separar una parte organizativa materializada dentro del alcance cuando su operación y ownership sean distinguibles sin romper el proceso                   |
| `ROL`       | separar actores por rol o función ya autorizados cuando la exposición pueda gobernarse sin alterar permisos ni crear combinaciones inconsistentes          |
| `PROCESO`   | preservar como unidad un flujo operativo cuando su estado, transacción, datos, autorización o integración deban permanecer coherentes de extremo a extremo |
| `COMPUESTA` | usar la intersección de dos o más dimensiones cuando esa intersección sea la verdadera unidad aislable                                                     |
| `UNICA`     | conservar todo el alcance autorizado como una sola unidad cuando dividirlo no sea seguro, material o demostrable                                           |

No existe una jerarquía universal `SEDE → AREA → ROL → PROCESO` ni su inversa.

---

#### 7. Regla determinista para resolver la dimensión

`activation_dimension_resolution::<package_id>` se resuelve en este orden lógico:

1. identificar las dimensiones que realmente existen en `authorized_scope_ref`;
2. descartar cualquier dimensión cuyo valor exacto no esté materializado por una fuente canónica;
3. preservar las dependencias técnicas y funcionales de `DELIV-PKG-015/019`;
4. determinar si el proceso exige atomicidad de extremo a extremo;
5. determinar qué particiones pueden ser observadas y recuperadas de manera independiente con los contratos vigentes;
6. elegir la menor unidad completa que reduzca exposición sin romper atomicidad, autorización, integridad de datos, integración ni ownership;
7. si ninguna dimensión individual satisface la condición, utilizar `COMPUESTA`;
8. si ninguna partición es demostrablemente segura o útil, utilizar `UNICA`.

La atomicidad del proceso prevalece sobre el deseo de obtener una ola más pequeña.

La ausencia de una dimensión no se interpreta como permiso para inventarla.

---

#### 8. Condiciones específicas por dimensión

##### 8.1. Secuenciación por sede

`SEDE` es válida cuando:

- la sede está dentro del alcance aprobado;
- el efecto empresarial puede limitarse territorialmente;
- datos, dispositivos o integraciones no obligan a activar simultáneamente otra sede;
- soporte, observabilidad y recuperación cubren la sede durante su exposición;
- no existe una dependencia que haga inconsistente operar una sede nueva mientras otra autorizada permanece sin activar.

Si dos sedes comparten un estado o efecto que no puede aislarse, no se separan artificialmente.

##### 8.2. Secuenciación por área

`AREA` es válida únicamente si el área:

- posee identidad canónica materializada;
- pertenece al alcance autorizado;
- tiene frontera operativa distinguible;
- puede exponerse sin dejar un proceso parcialmente incoherente;
- conserva ownership, soporte y recuperación trazables.

Un nombre informal de equipo o departamento no crea una unidad de activación.

##### 8.3. Secuenciación por rol

`ROL` es válida cuando:

- el rol o función está materializado y autorizado;
- la exposición no concede autoridad adicional;
- los actores restantes pueden continuar en su estado seguro sin romper el proceso;
- el servidor conserva la autorización autoritativa independientemente del estado de exposición;
- no se crea una combinación de roles que haga imposible completar una operación.

La secuenciación por rol controla exposición; no modifica RBAC, permisos, RLS ni alcance de autorización.

##### 8.4. Secuenciación por proceso

`PROCESO` es obligatoria como frontera atómica cuando dividir el flujo entre unidades produciría cualquiera de estos efectos:

- transición de estado incompleta;
- doble captura potencial del mismo hecho;
- pérdida de identidad transaccional;
- autorización inconsistente entre pasos;
- efectos externos imposibles de atribuir a una sola unidad;
- dependencia de datos que exija una activación coherente;
- consumidor o productor incompatible durante una división.

Esta tarea solo preserva la atomicidad. El tratamiento de convivencia, doble efecto y conciliación permanece reservado a `CUTOVER-OPS-003..005`.

---

#### 9. Unidad de activación

Cada `activation_unit` deberá identificar como mínimo:

| Campo                  | Regla                                                                   |
| ---------------------- | ----------------------------------------------------------------------- |
| `package_id`           | paquete canónico de la instancia                                        |
| `candidate_ref`        | mismo candidato autorizado por la ventana                               |
| `environment`          | mismo ambiente autorizado                                               |
| `authorized_scope_ref` | alcance de origen                                                       |
| `sequence_mode`        | modalidad de secuenciación aplicable                                    |
| `dimension_type`       | `SEDE`, `AREA`, `ROL`, `PROCESO`, `COMPUESTA` o `UNICA`                 |
| `site_ref`             | sede exacta cuando aplique                                              |
| `area_ref`             | área exacta cuando aplique                                              |
| `role_ref`             | rol o función exacta cuando aplique                                     |
| `process_ref`          | proceso exacto cuando aplique                                           |
| `dependency_layer`     | capa de precedencia heredada, cuando exista                             |
| `responsible_ref`      | responsable ya resuelto para la unidad                                  |
| `rollout_state_before` | estado seguro previo heredado de `DELIV-PKG-018/019`                    |
| `target_rollout_state` | estado permitido por `DELIV-PKG-018/019`; no se inventa una etapa nueva |
| `recovery_ref`         | referencia a recuperación aplicable                                     |
| `observability_ref`    | señales aplicables a la unidad                                          |
| `status`               | resultado documental de la unidad                                       |

Una unidad es una partición del alcance autorizado, nunca una ampliación.

---

#### 10. Cobertura exhaustiva del alcance

Para una instancia `DIRECT_ORDERED_ACTIVATION`, el conjunto de unidades debe cumplir simultáneamente:

1. **cobertura completa:** toda identidad del alcance que deba activarse aparece al menos una vez;
2. **sin ampliación:** ninguna identidad externa aparece;
3. **sin duplicación efectiva:** una misma combinación de dimensiones no queda activa en dos unidades incompatibles;
4. **sin huérfanos:** toda unidad tiene responsable, dependencias y referencias de control;
5. **sin solapamiento ambiguo:** cuando dos unidades comparten una dimensión, la intersección está expresamente delimitada;
6. **reconciliación exacta:** la unión de las unidades coincide con el alcance que realmente deberá activarse.

Cuando el alcance autorizado contiene una sola unidad aislable, el resultado correcto es una secuencia de una sola unidad. No se divide artificialmente para aparentar progresividad.

---

#### 11. Modelo de olas

`activation_sequence_plan::<package_id>` organiza las unidades en olas ordinales:

```text
WAVE-001
→ checkpoint de decisión
→ WAVE-002
→ checkpoint de decisión
→ ...
→ última ola autorizada dentro del plan
```

Cada ola contiene una o más unidades.

Dos unidades pueden pertenecer a la misma ola únicamente cuando se demuestra que:

- no existe dependencia de precedencia entre ellas;
- no comparten un estado cuya mutación exija orden;
- su observabilidad puede atribuirse de manera suficiente;
- su recuperación no depende de ejecutar primero la otra;
- no compiten por una responsabilidad cuya cobertura obligue a serializarlas;
- la exposición simultánea no rompe el aislamiento aprobado.

Si la independencia no puede demostrarse, las unidades se serializan.

El ordinal es monotónico y no se reutiliza dentro de la misma revisión del manifiesto.

---

#### 12. Orden entre olas

El orden de las olas se construye aplicando esta precedencia:

1. dependencias obligatorias del paquete;
2. atomicidad de proceso;
3. estado seguro y progresión permitida por `DELIV-PKG-018/019`;
4. aislamiento de la cohorte definida por `DELIV-PKG-022`;
5. capacidad de observación y recuperación de la unidad;
6. menor exposición completa entre las alternativas que siguen siendo válidas;
7. decisión atribuible del responsable vigente cuando persistan alternativas equivalentes.

No se adelanta una unidad dependiente por conveniencia de calendario.

No existe promoción automática por completar una ola.

---

#### 13. Punto de decisión entre olas

Toda transición entre olas queda estructuralmente bloqueada por un `continuation_gate_ref`.

`CUTOVER-OPS-002` define **dónde** existe ese punto de decisión, pero no define **qué umbrales producen continuar, pausar o revertir**.

La semántica de esa decisión pertenece a `CUTOVER-OPS-006`.

Por tanto:

- una ola posterior puede quedar ordenada documentalmente;
- su ejecución no queda autorizada por el mero orden;
- `SHELL-CI-022::<package_id>` deberá consumir la decisión vigente de `CUTOVER-OPS-006` antes de avanzar cuando corresponda;
- no se interpreta silencio, transcurso del tiempo o ausencia de incidente como autorización de continuación.

---

#### 14. Relación con los estados de rollout

La secuencia de cutover conserva las máquinas de estado de `DELIV-PKG-018/019`.

Para perfiles directos, la tarea no crea etapas entre:

- `GATE`;
- `BUILD_VERIFY`;
- `STAGING`;
- `PROD_SHADOW` o especialización equivalente;
- `PILOT`;
- las expansiones posteriores gobernadas por `DELIV-PKG-019`.

`CUTOVER-OPS-002` ordena **las unidades dentro del alcance de activación aplicable**. No redefine `CANARY_5`, `LIMITED_25`, `LIMITED_50`, `FULL_100` ni las especializaciones de cada perfil.

La secuencia por sede, área, rol o proceso tampoco sustituye la cohorte nominable de `DELIV-PKG-022` por un porcentaje.

---

#### 15. Especialización por perfil técnico

| Perfil           | Tratamiento de `CUTOVER-OPS-002`                                                                                                                                 |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `TP-DB-001`      | secuenciar la exposición del comportamiento o camino nuevo; no fragmentar una migración física solo para fabricar olas                                           |
| `TP-DOM-001`     | secuenciar unidades del alcance funcional preservando hechos ya confirmados y atomicidad de dominio                                                              |
| `TP-AUTH-001`    | secuenciar exposición sin alterar autoridad; `SHADOW_COMPARE` no concede permisos y una unidad nunca redefine roles                                              |
| `TP-INT-001`     | secuenciar unidades de integración que puedan aislar efectos; una misma operación y sus reintentos no se dividen entre caminos incompatibles                     |
| `TP-UI-001`      | secuenciar exposición de interfaz por alcance aprobado; distribución del build y visibilidad funcional permanecen conceptos distintos                            |
| `TP-SHARED-001`  | no crear una activación independiente artificial; heredar la secuencia de consumidores directos compatibles                                                      |
| `TP-CONTROL-001` | observar las olas que el control gobierna; solo secuenciar enforcement propio cuando exista una frontera ejecutable y el contrato de rollout permita segmentarla |
| `TP-AURA-001`    | no producir secuencia ejecutable mientras persista el bloqueo AURA                                                                                               |
| `TP-EXT-001`     | no producir secuencia ejecutable mientras el gate externo permanezca abierto                                                                                     |
| `TP-FUTURE-001`  | mantener fuera de la línea funcional vigente                                                                                                                     |

---

#### 16. Reconciliación del universo de modalidades heredado

`DELIV-PKG-022` conserva 207 raíces y `CUTOVER-OPS-002` no cambia esa clasificación.

| Modalidad heredada            | Cantidad | Decisión de secuenciación                                                                                  |
| ----------------------------- | -------: | ---------------------------------------------------------------------------------------------------------- |
| `PILOT-DIRECT-001`            |  **160** | `DIRECT_ORDERED_ACTIVATION` cuando exista ventana seleccionada y vigente                                   |
| `PILOT-SHARED-001`            |    **3** | `CONSUMER_DERIVED_ACTIVATION`; sin secuencia directa independiente                                         |
| `PILOT-CONTROL-001`           |   **26** | `GOVERNED_OBSERVATION`; sin activación artificial, salvo enforcement ejecutable ya permitido por su perfil |
| AURA bloqueada                |   **14** | `BLOCKED_NO_SEQUENCE` mientras persista su gate                                                            |
| dependencia externa bloqueada |    **2** | `BLOCKED_NO_SEQUENCE` mientras persista el gate externo                                                    |
| TALENTO fuera de línea actual |    **2** | `OUT_OF_CURRENT_LINE`                                                                                      |

Reconciliación:

```text
160 + 3 + 26 + 14 + 2 + 2 = 207
```

Esta tabla materializa el tratamiento de las modalidades sin reasignar ninguna raíz ni cambiar su `package_id`.

---

#### 17. Modalidades sin activación directa

##### 17.1. Contratos compartidos

Una raíz `PILOT-SHARED-001`:

- no recibe una ola propia ficticia;
- referencia las secuencias de consumidores directos que realmente ejercen el contrato;
- se considera observada durante esas olas;
- no se promociona porque haya transcurrido una ola de un solo consumidor si su contrato exige cobertura adicional.

##### 17.2. Controles

Una raíz `PILOT-CONTROL-001`:

- observa las olas de las capacidades que gobierna;
- no recibe sede, área, rol o proceso propios por inferencia;
- puede tener una unidad de enforcement solo si existe una frontera ejecutable materializada y el perfil aprobado permite segmentarla sin perder integridad;
- conserva bloqueo físico cuando su fuente propietaria aún lo exija.

##### 17.3. AURA, dependencias externas y línea futura

Las raíces no ejecutables en la línea actual no reciben secuencias vacías presentadas como éxito.

Su resultado permanece bloqueado o fuera de línea según la fuente propietaria. Solo una reapertura canónica que cierre el gate correspondiente y produzca posteriormente una ventana válida permitirá construir una secuencia ejecutable.

---

#### 18. Estados documentales de la secuencia

`activation_sequence_plan::<package_id>` utilizará:

| Estado              | Semántica                                                                                                                    |
| ------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `SECUENCIADA`       | existe ventana válida, dimensión resuelta, cobertura completa y orden reproducible de unidades                               |
| `BLOQUEADA`         | falta una identidad, dependencia, frontera de aislamiento, responsable, evidencia o referencia obligatoria                   |
| `NO_APLICA_DIRECTA` | la modalidad aprobada no posee activación directa independiente                                                              |
| `FUERA_DE_LINEA`    | la raíz pertenece a una línea funcional que no puede ejecutarse en la fase actual                                            |
| `INVALIDADA`        | una secuencia previamente especificada dejó de corresponder al candidato, ambiente, alcance, ventana o dependencias vigentes |

`SECUENCIADA` no significa ejecutada.

---

#### 19. Contratos que deben quedar enlazados antes de ejecución

El orden puede aprobarse documentalmente antes de desarrollar tareas posteriores del bloque, pero la ejecución física no podrá iniciar sin que cada referencia aplicable exista y esté vigente.

| Necesidad                                               | Propietario       |
| ------------------------------------------------------- | ----------------- |
| convivencia con el proceso anterior por ola o unidad    | `CUTOVER-OPS-003` |
| control contra doble registro o doble efecto            | `CUTOVER-OPS-004` |
| conciliación exigible durante piloto                    | `CUTOVER-OPS-005` |
| decisión entre continuar, pausar o revertir             | `CUTOVER-OPS-006` |
| registro de incidentes, decisiones y cambios de alcance | `CUTOVER-OPS-007` |
| métricas operativas del piloto                          | `CUTOVER-OPS-008` |
| decisión de salida del piloto                           | `CUTOVER-OPS-009` |
| retiro del proceso anterior                             | `CUTOVER-OPS-010` |

La referencia pendiente a una de estas tareas tiene dueño documental exacto; no constituye autorización para improvisar su contenido durante la ejecución.

---

#### 20. Contenido mínimo de `activation_sequence_manifest::<package_id>`

El manifiesto deberá conservar:

1. `package_id`;
2. `candidate_ref`;
3. `environment`;
4. `authorized_scope_ref`;
5. `cutover_window_ref`;
6. `pilot_entry_decision_ref`;
7. `rollout_profile_ref`;
8. `pilot_scope_ref`;
9. `sequence_mode`;
10. `dimension_resolution_ref`;
11. total de unidades esperadas;
12. total de unidades materializadas;
13. total de olas;
14. lista ordenada de olas;
15. miembros exactos de cada ola;
16. dimensiones y valores exactos de cada unidad;
17. dependencias entre unidades;
18. responsables aplicables;
19. estado seguro previo y estado objetivo permitido;
20. referencias de observabilidad y recuperación;
21. `continuation_gate_ref` entre olas cuando aplique;
22. referencias propietarias de `CUTOVER-OPS-003..010` exigibles antes de ejecución;
23. estado documental global;
24. causa, propietario y condición de salida de cualquier bloqueo;
25. revisión del manifiesto y referencia de evidencia documental.

Los conteos deben reconciliar exactamente el alcance materializado de la instancia.

---

#### 21. Regla de cambio e invalidación

La secuencia se invalida cuando cambia materialmente cualquiera de estos elementos:

- candidato;
- ambiente;
- alcance autorizado;
- ventana;
- modalidad de piloto;
- dependencia obligatoria;
- frontera de proceso;
- autorización o rol aplicable;
- responsable obligatorio;
- estrategia de rollout;
- capacidad de recuperación;
- condición de riesgo que afecte la exposición.

La corrección deberá realizarse en la fuente propietaria del elemento cambiado y luego recalcularse la secuencia.

No se edita silenciosamente una ola histórica para aparentar que siempre correspondió al nuevo alcance.

---

#### 22. Tratamiento de bloqueos

Todo `BLOQUEADA` deberá conservar:

1. unidad o secuencia afectada;
2. causa concreta;
3. insumo faltante;
4. propietario canónico;
5. tarea propietaria cuando exista;
6. condición objetiva de salida;
7. olas dependientes afectadas;
8. evidencia que deberá actualizarse.

No se permite `TBD`, “por definir” ni un pendiente sin propietario.

Una secuencia parcialmente construida no se redondea a `SECUENCIADA`.

---

#### 23. Handoff a `CUTOVER-OPS-003`

`CUTOVER-OPS-002` entrega a `CUTOVER-OPS-003`:

```text
VENTANA VIGENTE
+
ALCANCE AUTORIZADO
+
UNIDADES DE ACTIVACIÓN
+
OLAS ORDENADAS
+
DEPENDENCIAS
+
RESPONSABLES
+
ESTADO SEGURO PREVIO Y ESTADO OBJETIVO PERMITIDO
=
FRONTERA EXACTA PARA DEFINIR LA CONVIVENCIA TEMPORAL
```

`CUTOVER-OPS-003` podrá definir la convivencia del proceso anterior dentro de esta secuencia, pero no podrá ampliar unidades, cambiar su orden por inferencia ni alterar candidato, ambiente o alcance sin invalidar y recalcular la fuente correspondiente.

---

#### 24. Separación entre planificación y ejecución

La secuencia operativa permanece:

```text
SHELL-CI-021::<package_id>
→ entrada aprobada
→ CUTOVER-OPS-001 con ventana seleccionada
→ CUTOVER-OPS-002 con secuencia especificada
→ contratos restantes de CUTOVER aplicables
→ SHELL-CI-022::<package_id>
```

`SHELL-CI-022::<package_id>` será quien materialice la ejecución real y conserve paquete, versión, ambiente, ventana, actor, decisión y evidencia.

Esta tarea no:

- activa sedes;
- activa áreas;
- activa roles;
- activa procesos;
- cambia feature flags;
- despliega artefactos;
- modifica datos;
- ejecuta migraciones;
- ejecuta rollback;
- cambia permisos;
- modifica Supabase.

---

#### 25. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** `CUTOVER-OPS-002` materializa el orden documental de exposición para ejecutar posteriormente contratos de rollout, piloto, autorización, observabilidad y recuperación ya aprobados. No introduce un comportamiento empresarial nuevo, una transición de estado de negocio, una regla de autorización, un contrato de integración, una persistencia, un cálculo, un algoritmo runtime, un umbral de promoción ni un mecanismo nuevo de rollback. Los comportamientos ejecutables y sus pruebas permanecen gobernados por los requisitos y matrices ya vinculados a los paquetes; esta tarea únicamente organiza su ejecución futura dentro de un alcance previamente autorizado.

**Requisitos TREQ-* creados:** 0  
**Requisitos TREQ-* modificados:** 0  
**Fragmentos 04A afectados:** 0

---

#### 26. Criterios de aceptación documental

`CUTOVER-OPS-002` queda documentalmente completo cuando:

1. conserva `CUTOVER-OPS-001 → CUTOVER-OPS-002 → CUTOVER-OPS-003`;
2. solo secuencia instancias con ventana válida de `CUTOVER-OPS-001`;
3. no cambia paquete, candidato, ambiente, alcance, fecha, ventana ni autoridad;
4. define `activation_dimension_resolution`, `activation_unit_set`, `activation_sequence_plan` y `activation_sequence_manifest`;
5. admite `SEDE`, `AREA`, `ROL`, `PROCESO`, `COMPUESTA` y `UNICA` sin imponer una jerarquía universal;
6. preserva atomicidad de proceso antes de minimizar el tamaño de una unidad;
7. toda dimensión usada existe en una fuente canónica y pertenece al alcance autorizado;
8. las sedes se limitan al universo canónico y a la intersección aprobada para la instancia;
9. las unidades reconcilian exactamente el alcance activable, sin faltantes, ampliaciones ni duplicaciones ambiguas;
10. una instancia indivisible conserva una sola unidad y no fabrica progresividad;
11. las olas poseen ordinal reproducible;
12. el paralelismo exige independencia demostrable; en caso contrario se serializa;
13. las dependencias heredadas prevalecen sobre conveniencia de calendario;
14. cada transición entre olas conserva un punto de decisión sin anticipar el criterio de `CUTOVER-OPS-006`;
15. no existe promoción automática por tiempo ni por completar una ola;
16. se preservan los estados y perfiles de `DELIV-PKG-018/019`;
17. la cohorte de piloto no se transforma en porcentaje;
18. las 207 raíces quedan reconciliadas por modalidad como 160 directas, 3 shared, 26 control y 18 no ejecutables en la línea actual;
19. shared no recibe una activación independiente ficticia;
20. control no recibe una activación ficticia y conserva su tratamiento de observación o enforcement aplicable;
21. AURA, dependencia externa y línea futura conservan sus gates;
22. se definen `SECUENCIADA`, `BLOQUEADA`, `NO_APLICA_DIRECTA`, `FUERA_DE_LINEA` e `INVALIDADA`;
23. todo bloqueo tiene causa, propietario y condición de salida;
24. los contratos posteriores `CUTOVER-OPS-003..010` quedan vinculados por propietario sin anticipar sus decisiones;
25. cambios materiales invalidan la secuencia y obligan a recalcularla desde fuentes vigentes;
26. el manifiesto contiene conteos reconciliables de unidades y olas;
27. la ejecución física permanece en `SHELL-CI-022::<package_id>`;
28. no se ejecutan código, despliegues, activaciones, promociones, migraciones, DDL/DML, backfills, modificaciones de datos, configuración remota ni operaciones de Supabase;
29. se crean cero requisitos `TREQ-*`, se modifican cero requisitos `TREQ-*` y se afectan cero fragmentos 04A.

---

#### 27. Continuidad

##### ÚLTIMA TAREA APROBADA
CUTOVER-OPS-001 — Definir criterio para seleccionar fecha, ventana y responsables del cutover

##### TAREA ACTUAL APROBADA
CUTOVER-OPS-002 — Definir secuencia de activación por sede, área, rol o proceso

##### SIGUIENTE TAREA RESERVADA
CUTOVER-OPS-003 — Definir convivencia temporal con el proceso anterior


### ✅ CUTOVER-OPS-003 — Definir convivencia temporal con el proceso anterior

**Estado:** APROBADA  
**Tarea anterior:** `CUTOVER-OPS-002 — Definir secuencia de activación por sede, área, rol o proceso`  
**Tarea siguiente:** `CUTOVER-OPS-004 — Diseñar controles contra doble registro y doble efecto durante la transición`  
**Tipo de tarea:** documental — definición normativa y materialización de la convivencia temporal entre el proceso anterior y el proceso objetivo para cada unidad y ola de activación ya secuenciada, preservando una autoridad inequívoca por alcance, la compatibilidad temporal aprobada y las rutas de recuperación existentes; sin ampliar el alcance, alterar la secuencia, ejecutar activaciones, diseñar todavía controles contra doble registro o doble efecto, conciliar resultados, decidir pausa/reversión/continuación, retirar el proceso anterior, desplegar cambios, modificar configuración, ejecutar migraciones, DDL/DML, backfills, modificaciones de datos ni operaciones sobre Supabase  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/04_CUTOVER_Y_PILOTO.md`  
**Ejecución posterior:** `SHELL-CI-022::<package_id>` después de `SHELL-CI-021::<package_id>`  
**Cambios físicos autorizados:** ninguno  
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`CUTOVER-OPS-003` define cómo puede convivir temporalmente el proceso anterior con el proceso objetivo durante una secuencia de activación ya aprobada, sin convertir esa convivencia en doble autoridad, doble escritura, doble efecto ni retiro anticipado de la ruta anterior.

La tarea responde exclusivamente a estas preguntas:

```text
¿QUÉ UNIDAD Y OLA ESTÁN SIENDO ACTIVADAS?
+
¿QUÉ PROCESO O RUTA ANTERIOR SIGUE APLICANDO A ESA UNIDAD O AL RESTO DEL ALCANCE?
+
¿QUÉ RUTA ES AUTORITATIVA ANTES, DURANTE Y DESPUÉS DEL PUNTO DE ACTIVACIÓN?
+
¿QUÉ COMPATIBILIDAD TEMPORAL YA APROBADA DEBE CONSERVARSE?
+
¿QUÉ TRABAJO EN CURSO, COLAS, REINTENTOS O EFECTOS PREEXISTENTES DEBEN MANTENER SU RUTA?
+
¿QUÉ USO DEL PROCESO ANTERIOR SIGUE PERMITIDO Y HASTA QUÉ FRONTERA DOCUMENTAL?
=
CONVIVENCIA TEMPORAL DEFINIDA SIN AMBIGÜEDAD DE AUTORIDAD
```

La tarea no ejecuta el cambio de autoridad ni activa ninguna ola. Tampoco diseña todavía los controles que impedirán físicamente el doble registro o doble efecto: esa responsabilidad pertenece a `CUTOVER-OPS-004`.

---

#### 2. Resultado sustantivo

Para cada instancia aplicable de `package_id`, `CUTOVER-OPS-003` materializa cuatro piezas documentales:

1. `coexistence_scope_resolution::<package_id>` — identifica, sobre las unidades y olas ya definidas por `CUTOVER-OPS-002`, dónde existe realmente un proceso o ruta anterior que deba convivir temporalmente con el proceso objetivo;
2. `coexistence_authority_map::<package_id>` — fija por unidad y estado de activación qué ruta conserva la autoridad operacional, sin crear una segunda fuente de verdad;
3. `coexistence_transition_plan::<package_id>` — documenta el uso permitido del proceso anterior, las referencias de compatibilidad temporal, el tratamiento del trabajo en curso y las dependencias de recuperación;
4. `coexistence_manifest::<package_id>` — consolida alcance, unidades, olas, referencias del proceso anterior y objetivo, fronteras de autoridad, compatibilidad, bloqueos, responsables y handoff a las tareas siguientes.

Estas piezas describen una transición futura dentro de `SHELL-CI-022::<package_id>`. No prueban que la convivencia haya ocurrido ni que una unidad haya sido activada.

---

#### 3. Entradas obligatorias y frontera de autoridad

`CUTOVER-OPS-003` consume, sin redefinirlos:

- `CUTOVER-OPS-001`: paquete, candidato, ambiente, alcance, fecha, ventana, zona horaria y responsables vigentes;
- `CUTOVER-OPS-002`: dimensión de activación, unidades, olas, orden, dependencias, responsables, estado seguro previo, estado objetivo permitido y puntos de decisión entre olas;
- `READY-GATE-015`: elegibilidad final de entrada para la misma instancia;
- `DELIV-PKG-009`: plan de transición, compatibilidad temporal, autoridad única de escritura, backfills y lane de retiro legacy;
- `DELIV-PKG-010`: contratos de eventos, productores, consumidores, idempotencia, retry, compensación y conciliación ya aprobados cuando apliquen;
- `DELIV-PKG-012`: frontera autoritativa de servidor y permisos vigentes cuando apliquen;
- `DELIV-PKG-015`: dependencias, bloqueos y orden técnico consolidado;
- `DELIV-PKG-018`: default seguro, targeting, activación, expiración y kill switch aplicables;
- `DELIV-PKG-019`: estrategia de rollout, shadow, cohortes, pausas de evidencia y promoción;
- `DELIV-PKG-020`: rollback técnico, funcional y de datos, recovery, compensation y tratamiento de efectos irreversibles;
- `DELIV-PKG-021`: runbooks, procedimientos, soporte y audiencia operativa aplicables;
- `DELIV-PKG-022`: alcance, actores, sedes, datos, dispositivos, entorno, duración, cohortes, exclusiones y salvaguardas del piloto;
- `READY-GATE-010`: cobertura de soporte y escalamiento;
- `READY-GATE-011`: monitoreo, métricas y alertas disponibles;
- `READY-GATE-012`: respaldo, restauración y rollback aplicables;
- `READY-GATE-014`: riesgos aceptados y condiciones de suspensión vigentes.

No se permite usar esta tarea para reconstruir o corregir silenciosamente una fuente anterior. Si una entrada material es ambigua, incompatible o inexistente, la convivencia queda bloqueada hasta que la fuente propietaria resuelva la condición.

---

#### 4. Invariante de interpretación

Se adopta la separación obligatoria:

```text
CONVIVENCIA TEMPORAL
≠ DOBLE AUTORIDAD
≠ DOBLE ESCRITURA
≠ DOBLE EFECTO
≠ ROLLBACK
≠ CONCILIACIÓN
≠ RETIRO LEGACY
```

La coexistencia puede significar que componentes, rutas, interfaces, procesos manuales o mecanismos de recuperación permanezcan disponibles al mismo tiempo, pero no autoriza que dos rutas sean simultáneamente autoritativas para el mismo alcance y el mismo hecho empresarial salvo que una fuente canónica previa haya definido expresamente una semántica compatible.

`SHADOW` no crea una segunda autoridad empresarial. `FULL_100` tampoco autoriza por sí solo retirar el proceso anterior ni volver irreversible el cutover.

---

#### 5. Unidad mínima de decisión de convivencia

La convivencia se define sobre la misma unidad ya materializada por `CUTOVER-OPS-002`:

```text
package_id
+
candidate_ref
+
environment
+
authorized_scope_ref
+
activation_unit_ref
+
wave_ref
```

`CUTOVER-OPS-003` no puede:

- crear unidades nuevas;
- fusionar unidades existentes;
- dividir una unidad para simplificar la convivencia;
- cambiar el orden de olas;
- mover una sede, área, rol, proceso o intersección a otra ola;
- ampliar cohorte, actor, dato, dispositivo, superficie o ambiente;
- sustituir la unidad canónica por una agrupación inventada.

Si la convivencia segura exige modificar la secuencia, la tarea queda `BLOQUEADA` y la corrección debe ocurrir en la fuente propietaria antes de recalcular 003.

---

#### 6. Identificación del proceso o ruta anterior

Para cada `activation_unit_ref`, el manifiesto deberá resolver `previous_process_ref` a partir de una fuente canónica vigente.

La referencia puede corresponder al proceso, ruta, mecanismo manual, implementación legacy, consumidor, flujo o superficie anterior que realmente conserva responsabilidad antes de la activación. No se exige convertirla en un `VPROC-*` cuando la fuente no la modela así.

Reglas:

1. no se inventa `previous_process_ref` a partir del título del paquete, aplicación, repositorio, pantalla o capability;
2. si no existe proceso anterior aplicable, la unidad se clasifica `NO_APLICA` para convivencia y no recibe una ruta legacy ficticia;
3. si existe una ruta anterior pero su identidad o frontera no puede determinarse con evidencia suficiente, la unidad queda `BLOQUEADA`;
4. una ruta técnica antigua que permanece únicamente por compatibilidad no se presenta como proceso empresarial autoritativo;
5. una ruta de recuperación de `DELIV-PKG-020` no se presenta como ruta operativa normal salvo que su contrato lo permita expresamente.

---

#### 7. Estados documentales de convivencia

Cada unidad usa exactamente uno de estos estados documentales:

| Estado       | Semántica                                                                                                                                                           |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `DEFINIDA`   | existe proceso o ruta anterior aplicable y la frontera temporal de autoridad y uso está resuelta mediante fuentes vigentes                                          |
| `NO_APLICA`  | no existe convivencia aplicable para esa unidad o la fuente canónica demuestra que no hay proceso anterior que deba mantenerse                                      |
| `BLOQUEADA`  | la convivencia sería necesaria, pero falta o contradice una condición indispensable de autoridad, compatibilidad, secuencia, recuperación, soporte u observabilidad |
| `INVALIDADA` | una decisión previamente definida dejó de ser ejecutable por cambio material de candidato, ambiente, alcance, secuencia o fuente propietaria                        |

No se utiliza `DEFINIDA` para ocultar una identidad anterior desconocida ni `NO_APLICA` por simple ausencia de documentación.

---

#### 8. Regla de autoridad por unidad

Toda unidad con convivencia aplicable deberá materializar, como mínimo:

- `authority_before_activation`;
- `authority_after_activation`;
- `previous_process_allowed_use`;
- `target_process_allowed_use`;
- `recovery_authority_ref` cuando aplique;
- `authority_change_precondition_ref`;
- `authority_reversion_ref` cuando aplique.

La regla normativa es:

1. antes del punto de activación de la unidad, la autoridad permanece donde la fuente vigente la ubique;
2. la nueva ruta no se vuelve autoritativa por estar desplegada, visible, instalada, disponible o incluida en `SHADOW`;
3. la autoridad solo puede cambiar cuando se ejecute el punto de activación previsto y se cumplan los gates aplicables de la secuencia;
4. una unidad ya activada no vuelve a la ruta anterior por conveniencia operativa; una reversión debe seguir `DELIV-PKG-020` y la decisión propietaria de `CUTOVER-OPS-006`;
5. el resto de unidades todavía no activadas conserva la ruta que les corresponda sin recibir exposición anticipada;
6. una misma operación lógica, intento, idempotency key o retry no puede cambiar de ruta por pertenecer a una cohorte diferente a mitad de su ciclo cuando el contrato de integración exige continuidad de ruta.

Esta tarea fija la frontera documental. Los mecanismos físicos que harán cumplir esa frontera se diseñan en `CUTOVER-OPS-004`.

---

#### 9. Convivencia segmentada por olas

Cuando `CUTOVER-OPS-002` haya definido varias olas, puede existir simultáneamente:

- proceso objetivo autoritativo para unidades cuya activación ya haya sido ejecutada y aceptada conforme a los gates aplicables;
- proceso anterior autoritativo para unidades cuya activación todavía no haya ocurrido;
- compatibilidad técnica temporal entre componentes de ambas generaciones cuando `DELIV-PKG-009` o `DELIV-PKG-019` lo requieran;
- una ruta anterior retenida únicamente para recuperación cuando `DELIV-PKG-020` así lo defina.

La coexistencia entre olas nunca autoriza que una unidad se atienda alternativamente por una ruta u otra según disponibilidad momentánea, preferencia del operador o conveniencia técnica.

El alcance no activado no se utiliza como fallback informal para una unidad activada, y el alcance activado no absorbe silenciosamente unidades de olas posteriores.

---

#### 10. Compatibilidad temporal técnica

La compatibilidad temporal se consume de `DELIV-PKG-009` y de los contratos consolidados del paquete.

Por tanto:

1. una migración, esquema, vista, contrato, productor, consumidor o build puede requerir coexistencia técnica backward-compatible sin que exista doble autoridad empresarial;
2. las migraciones y contratos no se fraccionan por porcentaje; el porcentaje de rollout gobierna exposición de comportamiento únicamente cuando sea técnicamente seguro;
3. la autoridad única de escritura definida por la transición debe conservarse mientras existan componentes de generaciones distintas;
4. la presencia simultánea de versiones compatibles no autoriza doble escritura, doble confirmación ni duplicación de estado de negocio;
5. una incompatibilidad crítica bloquea la convivencia y la promoción de la unidad afectada;
6. el retiro físico de compatibilidad, adapters, rutas o superficies legacy permanece reservado a la tarea propietaria de retiro y no se ejecuta en 003.

---

#### 11. Trabajo en curso al cruzar la frontera de activación

Cada unidad con operaciones en curso deberá identificar, por referencia a los contratos existentes, cómo se conserva la autoridad de esas operaciones durante la transición.

El manifiesto deberá distinguir, cuando aplique:

- operaciones iniciadas antes del punto de activación y todavía no finalizadas;
- solicitudes o comandos enviados pero sin resultado definitivo;
- colas, outbox, reintentos, jobs o tareas diferidas pendientes;
- adjuntos, borradores o estados locales todavía no sincronizados;
- efectos externos cuyo resultado sea incierto;
- procesos manuales abiertos que no pueden migrarse de forma atómica.

Reglas:

1. una operación en curso no cambia automáticamente de ruta porque la unidad haya cambiado de interfaz o build;
2. si la fuente ya define una estrategia de finalización, migración, retry, compensación o recuperación, 003 la referencia sin modificarla;
3. si no puede determinarse qué ruta debe completar una operación en curso, la unidad queda `BLOQUEADA` antes de activarse;
4. un resultado externo incierto no se asume fallido para reenviarlo por la ruta nueva;
5. esta tarea no ejecuta conciliaciones ni crea reglas de compensación nuevas.

---

#### 12. Uso permitido del proceso anterior

`previous_process_allowed_use` deberá quedar explícito por unidad y derivado de las fuentes vigentes.

Puede conservarse únicamente para los fines que ya estén autorizados, por ejemplo:

- operación normal de unidades todavía no activadas;
- compatibilidad técnica necesaria mientras conviven generaciones;
- finalización de trabajo en curso bajo la ruta que ya lo posee;
- recuperación o reversión conforme a `DELIV-PKG-020`;
- consulta o soporte cuando una fuente canónica lo permita sin generar un nuevo efecto empresarial.

La lista anterior no concede permisos por sí misma. Cada uso debe estar respaldado por la fuente propietaria del paquete.

Una vez activada una unidad, el proceso anterior no puede seguirse usando como ruta normal para esa misma unidad salvo que la fuente canónica haya definido expresamente una convivencia de autoridad compatible. La falta de comodidad, capacitación, velocidad o familiaridad con la nueva ruta no crea una excepción.

---

#### 13. `SHADOW` y coexistencia sin efecto empresarial

Cuando `DELIV-PKG-019` permita `SHADOW`, la presencia del candidato puede coexistir con la ruta anterior únicamente sin producir un nuevo efecto empresarial.

Por tanto:

- `SHADOW` no transfiere autoridad;
- no crea una segunda confirmación del mismo hecho;
- no habilita una mutación adicional por observar el resultado;
- no sustituye la cohorte o piloto definidos por `DELIV-PKG-022`;
- no autoriza retirar la ruta anterior;
- si la mera presencia del candidato modifica comportamiento, `SHADOW` no aplica y la convivencia debe conservar el estado seguro definido por las fuentes propietarias.

---

#### 14. Recuperación no equivale a operación paralela

La retención del proceso anterior para rollback, recovery, compensation o restore no significa que permanezca habilitado como ruta operativa normal.

`DELIV-PKG-020` conserva la propiedad de:

- disparadores de rollback;
- autoridad para decidirlo y ejecutarlo;
- objetivo técnico y funcional seguro;
- tratamiento de datos y efectos externos;
- restore, recovery, compensation y conciliación aplicables.

`CUTOVER-OPS-003` solo registra qué dependencia de recuperación obliga a mantener temporalmente una ruta, artefacto, compatibilidad o capacidad anterior disponible.

La decisión de continuar, pausar o revertir durante la ejecución pertenece a `CUTOVER-OPS-006`.

---

#### 15. Integraciones, eventos y efectos externos

Cuando la unidad dependa de integraciones o efectos externos:

1. una misma operación lógica debe conservar la ruta compatible que le corresponda durante su ciclo;
2. un idempotency key o retry no puede reencaminarse entre proceso anterior y objetivo de forma que cambie la semántica ya aprobada;
3. `SHADOW` o sandbox no deben producir un efecto productivo nuevo cuando el contrato vigente los define como no efectivos;
4. un efecto externo incierto debe conservar el tratamiento de reconciliación, retry o compensación de `DELIV-PKG-010` y `DELIV-PKG-020`;
5. 003 no crea colas, DLQ, eventos, compensaciones ni políticas nuevas;
6. la conciliación material durante el piloto permanece reservada a `CUTOVER-OPS-005`.

---

#### 16. Datos, migraciones y autoridad de escritura

La convivencia de datos conserva las reglas aprobadas de `DELIV-PKG-009` y `DELIV-PKG-020`.

En particular:

- una migración aplicada no se revierte editando su historia para simular que nunca ocurrió;
- la compatibilidad temporal puede exigir conservar superficies antiguas mientras consumidores y rutas terminan su transición;
- la fuente autoritativa de escritura no se duplica por coexistencia;
- backfills, DDL, DML, cambios de RLS, Storage o Realtime no se ejecutan en esta tarea;
- la recuperación de datos no se confunde con rollback de interfaz o build;
- un hecho empresarial confirmado conserva su historia y, cuando corresponda, se corrige, compensa o reconcilia según contratos existentes.

Toda modificación física de Supabase VENTO permanece fuera de esta tarea y bajo su autoridad propietaria vigente.

---

#### 17. Offline, móvil y trabajo diferido

Cuando existan clientes offline, móviles o trabajo diferido, la convivencia deberá conservar la clasificación y autoridad de los elementos pendientes.

Ocultar una superficie, distribuir otro build, activar una ola o volver a una versión anterior no elimina por sí mismo:

- outbox pendientes;
- intentos locales;
- adjuntos todavía no sincronizados;
- comandos en retry;
- acciones pendientes de reautorización.

Cada elemento deberá seguir el contrato ya aprobado para determinar si se completa, descarta, reautoriza, compensa o reconcilia. 003 no crea una semántica nueva para esos estados y bloquea la unidad cuando la fuente vigente no permite determinar un tratamiento seguro.

---

#### 18. Soporte, observabilidad y operación durante la convivencia

La convivencia solo puede quedar `DEFINIDA` cuando las referencias aplicables permiten observar y soportar ambos estados que existirán temporalmente.

El manifiesto deberá conservar:

- responsables y escalamiento de `READY-GATE-010`;
- señales, métricas, alertas y propietarios de `READY-GATE-011` y `DELIV-PKG-017`;
- riesgos aceptados y condiciones de suspensión de `READY-GATE-014`;
- runbooks y procedimientos de `DELIV-PKG-021`;
- referencias de recuperación de `DELIV-PKG-020`.

Esta tarea no define métricas nuevas ni umbrales nuevos. Si la coexistencia introduce un estado que las fuentes de observabilidad vigentes no permiten distinguir o diagnosticar cuando esa distinción es necesaria para ejecutar con seguridad, la unidad queda `BLOQUEADA` hasta que la fuente propietaria resuelva la brecha.

---

#### 19. Inicio y término documental de la convivencia

La convivencia de una unidad comienza documentalmente cuando existe una frontera aprobada en la que la ruta anterior debe seguir disponible al mismo tiempo que el candidato o la ruta objetivo entra en la secuencia de activación.

La convivencia deja de requerir operación normal del proceso anterior para una unidad cuando:

1. esa unidad ya alcanzó el estado objetivo permitido conforme a la secuencia y gates aplicables;
2. no conserva trabajo en curso cuya autoridad siga en la ruta anterior;
3. ninguna compatibilidad temporal vigente exige mantener la ruta anterior como participante normal;
4. cualquier retención restante corresponde exclusivamente a recuperación, soporte, evidencia o retiro posterior.

Ese resultado no autoriza el retiro físico del proceso anterior. `CUTOVER-OPS-010` conserva la responsabilidad de definir y ejecutar documentalmente el retiro correspondiente.

---

#### 20. Condiciones de bloqueo

Una unidad queda `BLOQUEADA` para convivencia cuando ocurra cualquiera de estas condiciones:

1. no puede identificarse el proceso o ruta anterior que realmente posee la operación previa;
2. existe ambigüedad sobre qué ruta es autoritativa para el mismo alcance;
3. la secuencia exige que una misma operación lógica pueda saltar entre rutas sin contrato aprobado;
4. la compatibilidad técnica requerida no está demostrada o existe incompatibilidad crítica;
5. no puede determinarse el tratamiento del trabajo en curso;
6. la ruta anterior se necesita para recuperación, pero su disponibilidad o autoridad no está cubierta por `DELIV-PKG-020`;
7. la convivencia requeriría ampliar alcance, permisos, cohorte, sede, rol, proceso, dato, dispositivo o ambiente;
8. soporte u observabilidad no permiten operar de forma segura el estado temporal cuando son exigibles;
9. una dependencia de `DELIV-PKG-015` permanece abierta;
10. una condición de suspensión vigente ya está materializada;
11. el candidato, ambiente, alcance, ventana o secuencia dejaron de coincidir con las fuentes de 001 y 002;
12. el tratamiento exigiría inventar una regla de negocio, autorización, dato, evento, retry, compensación, rollback o conciliación no aprobada.

Todo bloqueo deberá conservar causa, propietario documental y condición de salida verificable.

---

#### 21. Invalidation y revalidación

`coexistence_manifest::<package_id>` queda `INVALIDADA` cuando cambie materialmente cualquiera de estas fuentes:

- candidato o revisión;
- ambiente;
- alcance autorizado;
- ventana de `CUTOVER-OPS-001`;
- dimensión, unidades, olas u orden de `CUTOVER-OPS-002`;
- transición o compatibilidad de `DELIV-PKG-009`;
- contratos de integración de `DELIV-PKG-010`;
- autorización de `DELIV-PKG-012`;
- dependencias de `DELIV-PKG-015`;
- activación o default seguro de `DELIV-PKG-018`;
- rollout de `DELIV-PKG-019`;
- recuperación de `DELIV-PKG-020`;
- piloto de `DELIV-PKG-022`;
- soporte, observabilidad, riesgo o elegibilidad de readiness.

La revalidación debe partir de las fuentes vigentes. No se parchea únicamente el campo que cambió cuando ese cambio altera la frontera de autoridad o la secuencia.

---

#### 22. Contenido mínimo del manifiesto

`coexistence_manifest::<package_id>` deberá contener, como mínimo:

1. `package_id`;
2. `candidate_ref`;
3. `environment`;
4. `authorized_scope_ref`;
5. referencia a la ventana vigente de `CUTOVER-OPS-001`;
6. referencia al manifiesto de secuencia de `CUTOVER-OPS-002`;
7. `activation_unit_ref`;
8. `wave_ref` y posición aplicable;
9. `previous_process_ref` o justificación de `NO_APLICA`;
10. referencia de la ruta o proceso objetivo cuando exista en las fuentes;
11. `authority_before_activation`;
12. `authority_after_activation`;
13. `previous_process_allowed_use`;
14. `target_process_allowed_use`;
15. referencia de compatibilidad temporal de `DELIV-PKG-009` cuando aplique;
16. referencia de rollout/shadow de `DELIV-PKG-019`;
17. referencia de recovery/rollback de `DELIV-PKG-020`;
18. tratamiento documentado de trabajo en curso;
19. dependencias de integración o efectos externos aplicables;
20. soporte y escalamiento aplicables;
21. observabilidad aplicable;
22. riesgo o condición de suspensión aplicable;
23. estado `DEFINIDA`, `NO_APLICA`, `BLOQUEADA` o `INVALIDADA`;
24. causa, propietario y condición de salida de cualquier bloqueo;
25. revisión documental y referencias de evidencia.

Los conteos de unidades deberán reconciliar exactamente el universo recibido de `CUTOVER-OPS-002`.

---

#### 23. Frontera con `CUTOVER-OPS-004..010`

`CUTOVER-OPS-003` fija la frontera que las tareas siguientes consumen, sin anticiparlas:

| Tarea             | Responsabilidad reservada                                                                                         |
| ----------------- | ----------------------------------------------------------------------------------------------------------------- |
| `CUTOVER-OPS-004` | diseñar los controles que impiden doble registro y doble efecto usando la autoridad y fronteras definidas por 003 |
| `CUTOVER-OPS-005` | definir las conciliaciones exigibles durante el piloto                                                            |
| `CUTOVER-OPS-006` | definir el criterio operativo de pausa, reversión o continuación entre puntos de decisión                         |
| `CUTOVER-OPS-007` | diseñar el registro de incidentes, decisiones y cambios de alcance                                                |
| `CUTOVER-OPS-008` | definir métricas de tiempos, errores, adopción y resultado empresarial                                            |
| `CUTOVER-OPS-009` | definir criterio y evidencia para declarar salida del piloto                                                      |
| `CUTOVER-OPS-010` | definir el retiro del proceso anterior y el cierre de la transición                                               |

003 puede declarar que una referencia posterior será exigible antes de ejecución, pero no puede completar por anticipado la decisión de su propietario.

---

#### 24. Handoff a `CUTOVER-OPS-004`

`CUTOVER-OPS-003` entrega a `CUTOVER-OPS-004` únicamente la frontera documental necesaria para diseñar controles contra duplicidad:

```text
UNIDADES Y OLAS VIGENTES
+
PROCESO/RUTA ANTERIOR APLICABLE
+
RUTA OBJETIVO APLICABLE
+
AUTORIDAD ANTES Y DESPUÉS DE ACTIVACIÓN
+
USO PERMITIDO DE LA RUTA ANTERIOR
+
TRABAJO EN CURSO Y FRONTERAS DE RUTA
+
COMPATIBILIDAD TEMPORAL
+
REFERENCIAS DE RECUPERACIÓN
=
SUPERFICIE EXACTA DONDE 004 DEBE IMPEDIR DOBLE REGISTRO O DOBLE EFECTO
```

`CUTOVER-OPS-004` no podrá ampliar alcance, modificar la secuencia ni reinterpretar una ambigüedad de autoridad como autorización para operar ambas rutas.

---

#### 25. Separación entre planificación y ejecución

`CUTOVER-OPS-003` es exclusivamente documental.

No ejecuta:

- activaciones;
- promociones;
- cambios de routing;
- feature flags;
- cutover;
- rollback o recovery;
- conciliaciones;
- migraciones;
- DDL/DML;
- backfills;
- compensaciones;
- correcciones de datos;
- retiro legacy;
- cambios de código;
- despliegues;
- cambios remotos;
- operaciones de Supabase.

La ejecución futura corresponde a `SHELL-CI-022::<package_id>` dentro de la ruta autorizada y consumiendo los contratos posteriores que sean aplicables.

---

#### 26. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0.  
**Requisitos modificados:** 0.

**Justificación:** `CUTOVER-OPS-003` materializa, para la secuencia de cutover, la aplicación conjunta de reglas de transición, compatibilidad temporal, autoridad única de escritura, integración, autorización, rollout, shadow, rollback, recovery, soporte y observabilidad que ya están aprobadas y cubiertas por requisitos existentes. `DELIV-PKG-009`, `DELIV-PKG-019`, `DELIV-PKG-020` y `DELIV-PKG-022` ya determinan que sus decisiones documentales reutilizan el registro 04A vigente sin crear semántica ejecutable nueva. Esta tarea no cambia el contenido, identidad, estado, relación o criterio de ningún `TREQ-*` y no corresponde generar fragmentos 04A.

---

#### 27. Criterios de aceptación documental

`CUTOVER-OPS-003` queda documentalmente completo cuando:

1. conserva `CUTOVER-OPS-002 → CUTOVER-OPS-003 → CUTOVER-OPS-004`;
2. usa exactamente las unidades, olas y orden materializados por 002;
3. no cambia paquete, candidato, ambiente, alcance, fecha, ventana ni autoridad de readiness;
4. identifica el proceso o ruta anterior por fuente canónica o demuestra `NO_APLICA`;
5. no inventa `VPROC-*`, rutas legacy, sistemas, owners ni repositorios;
6. define `coexistence_scope_resolution`, `coexistence_authority_map`, `coexistence_transition_plan` y `coexistence_manifest`;
7. cada unidad usa exactamente `DEFINIDA`, `NO_APLICA`, `BLOQUEADA` o `INVALIDADA`;
8. cada unidad `DEFINIDA` posee frontera de autoridad antes y después de activación;
9. `SHADOW` nunca se trata como segunda autoridad empresarial;
10. `FULL_100` no se trata como autorización de retiro legacy;
11. la convivencia técnica backward-compatible no se convierte en doble autoridad de escritura;
12. las migraciones y contratos no se fraccionan por porcentaje;
13. una unidad no alterna de ruta por conveniencia operativa;
14. una misma operación lógica, intento o retry conserva la ruta exigida por sus contratos vigentes;
15. el trabajo en curso recibe tratamiento referenciado o bloquea la unidad;
16. los efectos externos inciertos no se asumen fallidos para reejecutarlos por otra ruta;
17. una ruta retenida para recovery no se presenta como operación paralela normal;
18. soporte, observabilidad, riesgo y recuperación quedan referenciados cuando son aplicables;
19. toda incompatibilidad crítica bloquea la convivencia de la unidad afectada;
20. todo bloqueo conserva causa, propietario y condición de salida;
21. cambios materiales invalidan el manifiesto y obligan a revalidar desde fuentes vigentes;
22. el manifiesto reconcilia exactamente todas las unidades recibidas de 002;
23. 003 no diseña todavía controles de doble registro o doble efecto;
24. 003 no ejecuta conciliaciones;
25. 003 no decide pausa, reversión o continuación;
26. 003 no define métricas, salida del piloto ni retiro del proceso anterior;
27. `CUTOVER-OPS-004` recibe una frontera de autoridad suficiente para diseñar los controles contra duplicidad sin reinterpretar alcance;
28. la ejecución física permanece en `SHELL-CI-022::<package_id>`;
29. no se ejecutan código, despliegues, activaciones, promociones, migraciones, DDL/DML, backfills, modificaciones de datos, configuración remota ni operaciones de Supabase;
30. se crean cero requisitos `TREQ-*`, se modifican cero requisitos `TREQ-*` y se afectan cero fragmentos 04A.

---

#### 28. Continuidad

##### ÚLTIMA TAREA APROBADA
CUTOVER-OPS-002 — Definir secuencia de activación por sede, área, rol o proceso

##### TAREA ACTUAL APROBADA
CUTOVER-OPS-003 — Definir convivencia temporal con el proceso anterior

##### SIGUIENTE TAREA RESERVADA
CUTOVER-OPS-004 — Diseñar controles contra doble registro y doble efecto durante la transición


### ✅ CUTOVER-OPS-004 — Diseñar controles contra doble registro y doble efecto durante la transición

**Estado:** APROBADA  
**Tarea anterior:** `CUTOVER-OPS-003 — Definir convivencia temporal con el proceso anterior`  
**Tarea siguiente:** `CUTOVER-OPS-005 — Definir conciliaciones durante el piloto`  
**Tipo de tarea:** documental — definición normativa y materialización de los controles contra doble registro y doble efecto sobre las unidades, olas y fronteras de autoridad ya definidas para el cutover, vinculando mecanismos canónicos existentes de identidad de operación, idempotencia, atomicidad, deduplicación, fencing, autorización, retry, trabajo diferido y efectos externos; sin implementar controles físicos, ejecutar activaciones, modificar routing, crear colas, cambiar feature flags, conciliar resultados, decidir pausa/reversión/continuación, retirar legacy, desplegar código, ejecutar migraciones, DDL/DML, backfills, modificar datos ni operar Supabase  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/04_CUTOVER_Y_PILOTO.md`  
**Ejecución posterior:** `SHELL-CI-022::<package_id>` después de `SHELL-CI-021::<package_id>` y de completar los contratos CUTOVER aplicables  
**Cambios físicos autorizados:** ninguno  
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`CUTOVER-OPS-004` define dónde y cómo deberán aplicarse durante la transición los controles canónicos ya existentes que impiden que una misma operación lógica sea registrada más de una vez o produzca más de un efecto empresarial por coexistencia entre la ruta anterior y la ruta objetivo.

La tarea parte de la frontera resuelta por `CUTOVER-OPS-003` y responde exclusivamente a estas preguntas:

```text
¿QUÉ UNIDAD Y OLA ESTÁN EXPUESTAS?
+
¿QUÉ RUTA ES AUTORITATIVA PARA ESA UNIDAD Y ESA OPERACIÓN?
+
¿CUÁL ES LA IDENTIDAD ESTABLE DE LA OPERACIÓN O HECHO?
+
¿QUÉ MECANISMO CANÓNICO YA APROBADO IMPIDE REEJECUCIÓN O DOBLE EFECTO?
+
¿QUÉ SUCEDE ANTE RETRY, TIMEOUT, OFFLINE, REENVÍO, COLA O RESULTADO EXTERNO INCIERTO?
+
¿QUÉ SUPERFICIE DEBE QUEDAR BLOQUEADA SI NO PUEDE DEMOSTRARSE EL CONTROL?
=
TRANSICIÓN SIN DOBLE REGISTRO NI DOBLE EFECTO
```

La tarea no crea una nueva semántica de idempotencia. Materializa la aplicación, por frontera de cutover, de contratos ya protegidos por el registro canónico de requisitos y por los expedientes `DELIV-PKG-*`.

---

#### 2. Definiciones operativas

Para esta tarea:

- **doble registro**: materialización repetida del mismo hecho, solicitud, comando, expediente, recepción, movimiento, confirmación o dato empresarial cuando el contrato vigente exige una única captura o identidad autoritativa;
- **doble efecto**: producción más de una vez de una consecuencia empresarial para una misma operación lógica, incluyendo mutaciones internas o efectos externos gobernados por el paquete;
- **operación lógica**: unidad identificable que conserva identidad estable durante su ciclo, incluidos retries, reenvíos, procesamiento asíncrono, offline o recuperación;
- **control anti-duplicidad**: mecanismo aprobado por la fuente propietaria que permite impedir, detectar antes de aplicar o reconocer de manera determinista una repetición sin convertirla en un efecto adicional;
- **fence de autoridad**: restricción que impide que una ruta no autoritativa produzca una mutación o efecto para la unidad gobernada;
- **resultado incierto**: operación para la cual no existe todavía evidencia suficiente de éxito o fallo definitivo y que, por tanto, no puede reenviarse por otra ruta asumiendo fracaso.

Estas definiciones no sustituyen la semántica específica de cada dominio o integración.

---

#### 3. Resultado sustantivo

Por cada instancia aplicable de `package_id`, la tarea materializa cuatro piezas documentales:

1. `duplicate_risk_surface::<package_id>` — inventario de superficies donde la convivencia puede producir registro o efecto duplicado;
2. `duplicate_control_binding::<package_id>` — vínculo de cada superficie con el control, contrato, requisito `TREQ-*`, propietario y mecanismo existente que debe protegerla;
3. `transition_effect_fence_plan::<package_id>` — frontera de autoridad y enforcement que debe permanecer vigente antes, durante y después del punto de activación de cada unidad;
4. `duplicate_control_manifest::<package_id>` — expediente consolidado de unidades, operaciones, identidades, riesgos, controles, estados, bloqueos y referencias que `SHELL-CI-022::<package_id>` deberá consumir durante la ejecución.

Estas piezas son diseño documental. No demuestran que el mecanismo físico exista, esté desplegado o haya sido probado.

---

#### 4. Entradas obligatorias

`CUTOVER-OPS-004` consume, sin redefinirlos:

- `CUTOVER-OPS-001`: ventana y responsables vigentes;
- `CUTOVER-OPS-002`: unidades, olas, orden, dependencias, estados seguros y puntos de decisión;
- `CUTOVER-OPS-003`: proceso o ruta anterior, ruta objetivo, autoridad antes/después, uso permitido de cada ruta, trabajo en curso, compatibilidad temporal y recovery;
- `DELIV-PKG-009`: transición, compatibilidad, coexistencia de escrituras y retiro legacy;
- `DELIV-PKG-010`: eventos, entrega, identidad, idempotencia, retry, colas, DLQ, compensación y conciliación;
- `DELIV-PKG-012`: autorización y frontera autoritativa de servidor;
- `DELIV-PKG-015`: dependencias y orden técnico;
- `DELIV-PKG-016`: requisitos `TREQ-*`, niveles de prueba, fixtures, ambientes, responsables y evidencia esperada;
- `DELIV-PKG-017`: observabilidad, logs, métricas, trazas, alertas y auditoría;
- `DELIV-PKG-018`: estado seguro, targeting, activación y kill switch;
- `DELIV-PKG-019`: rollout, shadow, cohortes, pausas y promoción;
- `DELIV-PKG-020`: rollback, recovery, compensation y tratamiento de efectos inciertos o irreversibles;
- `DELIV-PKG-022`: alcance y cohorte autorizados del piloto;
- `READY-GATE-010..015`: soporte, observabilidad, recuperación, línea base, riesgo y autorización final de entrada.

Cuando una entrada no permita determinar el control aplicable sin inventar comportamiento, la superficie queda `BLOQUEADA`.

---

#### 5. Invariante principal de anti-duplicidad

Para toda superficie mutable o productora de efectos:

```text
UNA OPERACIÓN LÓGICA
→ UNA IDENTIDAD ESTABLE
→ UNA RUTA AUTORITATIVA
→ UN MECANISMO CANÓNICO DE PROTECCIÓN
→ COMO MÁXIMO UN EFECTO EMPRESARIAL EFECTIVO
```

Se preservan además estas reglas:

1. el mismo identificador con el mismo contenido no puede producir un efecto adicional y debe reconocer o recuperar el resultado ya obtenido conforme al contrato aplicable;
2. el mismo identificador con contenido lógico distinto debe producir conflicto o rechazo conforme al contrato existente;
3. un retry no crea una nueva operación por el solo hecho de repetirse;
4. cambiar de interfaz, build, sede activa, ola o ruta técnica no autoriza cambiar la identidad de una operación ya iniciada;
5. una operación no puede saltar de la ruta anterior a la objetivo para eludir un resultado incierto;
6. una ruta `SHADOW` no produce un segundo efecto empresarial;
7. una ruta retenida para recovery no se convierte en segunda ruta operativa normal;
8. la inexistencia o indeterminación del control no se interpreta como permiso para continuar.

---

#### 6. Unidad mínima de control

La unidad mínima de evaluación es:

```text
package_id
+
candidate_ref
+
environment
+
authorized_scope_ref
+
activation_unit_ref
+
wave_ref
+
operation_or_effect_ref
```

`operation_or_effect_ref` debe provenir del contrato funcional, de integración, datos, evento, acción, proceso o superficie ya materializada para el paquete.

No se inventan operaciones genéricas para completar una matriz.

Una misma `activation_unit_ref` puede contener varias superficies con controles distintos. La aprobación de una superficie no cubre automáticamente las demás.

---

#### 7. Inventario de superficies de riesgo

`duplicate_risk_surface::<package_id>` deberá evaluar, cuando existan en las fuentes del paquete:

| Superficie                                | Riesgo de transición que debe resolverse                                                            |
| ----------------------------------------- | --------------------------------------------------------------------------------------------------- |
| mutación síncrona de servidor             | envío repetido, doble submit, uso simultáneo de ruta anterior y objetivo                            |
| RPC o transacción de datos                | repetición de mutación, carrera, estado parcialmente aplicado                                       |
| job, cola, outbox, inbox o tarea diferida | reentrega, lease vencido, doble consumidor, replay                                                  |
| webhook o callback                        | entrega repetida o fuera de orden                                                                   |
| integración externa                       | timeout con resultado incierto, retry o reenvío por canal alterno                                   |
| operación offline o móvil                 | sincronización repetida, reenvío después de reconexión                                              |
| proceso manual/legacy                     | doble digitación o registro paralelo después del cambio de autoridad                                |
| notificación, impresión o evidencia       | repetición de un efecto externo o documento cuando el contrato exige unicidad                       |
| inventario, costo, contabilidad o ledger  | duplicación de movimiento, recepción, costo, obligación o hecho económico                           |
| `SHADOW`                                  | mutación accidental desde una ruta que solo debía observar                                          |
| backfill o transición de datos            | doble aplicación sobre una identidad ya procesada cuando el contrato aprobado contemple reanudación |
| recuperación                              | reejecución del efecto original al intentar restaurar servicio                                      |

Una superficie inexistente o no aplicable se marca `NO_APLICA` con referencia a la fuente que lo demuestra.

---

#### 8. Familias de control permitidas

`CUTOVER-OPS-004` no selecciona tecnología por preferencia. Cada superficie debe enlazarse con uno o más mecanismos ya aprobados por su contrato propietario.

Las familias documentales admitidas son:

| Familia                        | Uso                                                                                                                    |
| ------------------------------ | ---------------------------------------------------------------------------------------------------------------------- |
| `AUTHORITY_FENCE`              | impedir que una ruta no autoritativa produzca mutaciones para la unidad                                                |
| `STABLE_OPERATION_IDENTITY`    | conservar identidad estable entre intentos, retries, offline y rutas compatibles                                       |
| `IDEMPOTENT_RESULT_REUSE`      | reconocer una repetición equivalente y recuperar el resultado original sin producir otro efecto                        |
| `CONTENT_CONFLICT_GUARD`       | rechazar la reutilización de una misma identidad con contenido lógico incompatible                                     |
| `ATOMICITY_OR_VERSION_GUARD`   | impedir efectos parciales o carreras mediante transacción, versión, bloqueo, claim o mecanismo equivalente ya aprobado |
| `OUTBOX_INBOX_OR_CLAIM_GUARD`  | controlar entrega y consumo repetibles en procesamiento asíncrono                                                      |
| `EXTERNAL_EFFECT_GUARD`        | preservar correlación/idempotencia y evitar reenvío ciego ante resultado externo incierto                              |
| `SHADOW_NO_EFFECT_GUARD`       | asegurar que una superficie observacional no produzca mutaciones empresariales                                         |
| `WORK_IN_PROGRESS_ROUTE_FENCE` | mantener una operación ya iniciada bajo la ruta que conserva su autoridad hasta resolución conforme a su contrato      |
| `OBSERVABILITY_AUDIT_GUARD`    | conservar intento, resultado, duplicado reconocido, conflicto y efecto final sin exponer secretos                      |
| `FAIL_CLOSED_GUARD`            | impedir activación o mutación cuando falta un control obligatorio o su estado no es demostrable                        |

Un paquete puede usar mecanismos físicos diferentes para una misma familia. La tarea no obliga a una tabla, índice, lock, cola o librería concreta si la fuente propietaria no la ha definido.

---

#### 9. Selección del control por superficie

Para cada superficie se aplica este algoritmo documental:

1. identificar la operación o efecto exacto;
2. identificar la ruta autoritativa derivada de `CUTOVER-OPS-003`;
3. identificar el requisito `TREQ-*` ya vinculado al paquete o al contrato que protege esa conducta;
4. identificar el mecanismo físico o contractual planificado en `DELIV-PKG-007..016`;
5. comprobar que el mecanismo sigue siendo compatible con candidato, ambiente y secuencia;
6. comprobar que cubre retries, concurrencia o reentrega que realmente apliquen;
7. comprobar que el mecanismo no depende de que ambas rutas sean simultáneamente autoritativas;
8. registrar el control y su propietario;
9. si el mecanismo no existe, no es identificable o resulta insuficiente para el riesgo materializado, marcar `BLOQUEADA`.

No se crea un mecanismo nuevo dentro de 004 para convertir un bloqueo en éxito.

---

#### 10. Control de doble registro entre ruta anterior y ruta objetivo

Cuando ambas superficies estén disponibles temporalmente:

1. solo la ruta autoritativa definida por 003 puede crear o confirmar el hecho para la unidad;
2. la ruta no autoritativa deberá quedar en el uso permitido definido por 003;
3. una interfaz legacy todavía visible no conserva derecho de escritura por visibilidad;
4. una interfaz objetivo desplegada pero todavía no activada no adquiere derecho de escritura por disponibilidad;
5. un operador no puede registrar el mismo hecho en ambas rutas para “asegurar” que quede procesado;
6. un fallback manual no puede crear una copia autoritativa competidora salvo que exista un contrato previo específico que modele ese comportamiento;
7. si no puede hacerse cumplir la autoridad única con los mecanismos existentes, la unidad queda `BLOQUEADA`.

La existencia simultánea de dos superficies técnicas no equivale a dos fuentes de verdad.

---

#### 11. Control de reintentos y reenvíos

Los retries preservan el contrato de `TREQ-INTEGRATION-003`:

- misma identidad estable;
- mismo contenido lógico esperado;
- estado durable;
- resultado recuperable;
- límites y clasificación de retry del contrato propietario;
- tratamiento explícito de timeout o resultado desconocido;
- no creación de un nuevo efecto por repetición equivalente.

Está prohibido:

- cambiar la idempotency key para “forzar” un segundo intento;
- reenviar por la ruta alternativa sin resolver el resultado del intento anterior;
- considerar un timeout como fallo definitivo sin evidencia suficiente;
- reiniciar desde cero una operación cuya identidad durable todavía existe;
- utilizar el cambio de ola como motivo para generar una nueva identidad para la misma operación lógica.

---

#### 12. Operaciones asíncronas, colas y webhooks

Cuando el paquete consuma procesamiento asíncrono, el control deberá enlazar el mecanismo aprobado de:

- outbox;
- inbox;
- claim atómico;
- lock;
- versión;
- clave de operación;
- hash lógico;
- estado durable;
- resultado recuperable;
- DLQ o equivalente;
- observabilidad y recuperación controlada;

según corresponda a las fuentes propietarias.

La tarea no exige que todos esos mecanismos existan simultáneamente. Exige que el mecanismo aplicable satisfaga el contrato ya aprobado.

La reentrega de un mensaje o webhook no debe transformarse en una segunda operación empresarial.

---

#### 13. Concurrencia y mutaciones de datos

Para superficies con mutaciones concurrentes:

1. se conserva la atomicidad o mecanismo idempotente/reconciliable aprobado;
2. una escritura parcial no se acepta como estado final de una operación;
3. dos rutas no pueden mantener contadores, ledgers, stock, costos o estados autoritativos competidores para el mismo hecho;
4. versionado, locking, constraints, transacción, claim u otro mecanismo equivalente solo se exige cuando ya pertenece al contrato físico o de prueba del paquete;
5. si una condición de carrera material no está cubierta por ningún mecanismo aprobado, la unidad queda `BLOQUEADA` y la corrección pertenece a la fuente técnica propietaria.

004 no crea ni modifica tablas, índices, constraints, funciones, políticas RLS ni RPC.

---

#### 14. Efectos externos y resultado incierto

Para pagos, proveedores, impresión, notificaciones, webhooks, dispositivos u otros efectos externos aplicables:

1. la operación conserva una correlación o identidad estable;
2. un timeout no autoriza repetir por otra ruta como una operación nueva;
3. un resultado incierto permanece en el estado previsto por el contrato propietario hasta que pueda determinarse su tratamiento;
4. un retry reutiliza la identidad exigida por el contrato;
5. la ruta objetivo no reemite automáticamente un efecto iniciado por la ruta anterior;
6. la ruta anterior no reemite automáticamente un efecto iniciado por la ruta objetivo;
7. la conciliación que determine el resultado final pertenece a `CUTOVER-OPS-005`;
8. la compensación o recuperación conserva la propiedad de `DELIV-PKG-010` y `DELIV-PKG-020`.

004 define el fence de duplicidad; no ejecuta conciliación ni compensación.

---

#### 15. Offline, móvil y trabajo diferido

Para elementos pendientes originados antes o durante la frontera de activación:

- outbox;
- comandos locales;
- formularios pendientes de sincronización;
- adjuntos;
- retries;
- trabajos diferidos;
- operaciones en curso;

deberán conservar identidad y ownership de ruta conforme a `CUTOVER-OPS-003` y a sus contratos técnicos.

La reconexión no convierte un elemento pendiente en una operación nueva.

Si un cliente antiguo y uno nuevo pueden reenviar el mismo trabajo sin compartir o correlacionar la identidad exigida por el contrato, la unidad se considera `BLOQUEADA` hasta que la fuente propietaria cierre la condición.

---

#### 16. `SHADOW` y superficies no efectivas

Toda superficie `SHADOW` deberá enlazar un control que garantice que su ejecución:

- no confirma el mismo hecho una segunda vez;
- no escribe una segunda fuente autoritativa;
- no genera notificación, impresión, pago, movimiento, costo, inventario, expediente u otro efecto empresarial adicional;
- no consume una operación productiva como si fuera una segunda ejecución;
- conserva observabilidad suficiente para comparar sin convertirse en autoridad.

Cuando el candidato no pueda observar sin mutar, el modo `SHADOW` no es válido para esa superficie y se conserva el estado seguro definido por sus fuentes propietarias.

---

#### 17. Fencing por cambio de autoridad

`transition_effect_fence_plan::<package_id>` deberá reflejar la frontera de 003:

##### Antes de la activación

- la ruta anterior conserva únicamente la autoridad que 003 le atribuya;
- la ruta objetivo permanece en su estado seguro o no efectivo;
- cualquier operación iniciada conserva identidad estable.

##### En el punto de activación

- la transferencia de autoridad ocurre solo si los gates aplicables permiten ejecutar ese punto;
- no se abre una ventana de doble autoridad;
- el control contra duplicidad debe ser aplicable antes de aceptar la primera mutación autoritativa de la nueva ruta.

##### Después de la activación

- la nueva ruta solo asume las unidades realmente activadas;
- la ruta anterior conserva únicamente los usos permitidos por 003;
- trabajo en curso anterior sigue el tratamiento aprobado;
- una reversión utiliza `DELIV-PKG-020` y `CUTOVER-OPS-006`, no un bypass informal del fence.

---

#### 18. Evidencia documental exigida al control

Cada `duplicate_control_binding` deberá conservar, como mínimo:

| Campo                     | Regla                                                          |
| ------------------------- | -------------------------------------------------------------- |
| `package_id`              | identidad canónica                                             |
| `candidate_ref`           | mismo candidato autorizado                                     |
| `environment`             | mismo ambiente                                                 |
| `activation_unit_ref`     | unidad exacta de 002/003                                       |
| `wave_ref`                | ola exacta                                                     |
| `operation_or_effect_ref` | operación o efecto protegido                                   |
| `authoritative_route_ref` | ruta autoritativa derivada de 003                              |
| `risk_type`               | doble registro, doble efecto o ambos                           |
| `control_family`          | familia documental aplicable                                   |
| `control_source_ref`      | fuente propietaria del mecanismo                               |
| `treq_refs`               | requisitos existentes que protegen la conducta                 |
| `implementation_ref`      | referencia física planificada cuando exista                    |
| `retry_identity_ref`      | identidad o contrato aplicable a reintentos cuando corresponda |
| `external_effect_ref`     | contrato de efecto externo cuando aplique                      |
| `observability_ref`       | señal o evidencia esperada                                     |
| `owner_ref`               | propietario vigente                                            |
| `status`                  | estado documental del binding                                  |
| `blocking_reason`         | causa concreta cuando exista                                   |
| `blocking_owner`          | propietario canónico de resolución                             |
| `exit_condition`          | condición verificable para salir del bloqueo                   |

No se almacenan secretos, tokens ni payloads sensibles como evidencia ordinaria.

---

#### 19. Estados documentales

Cada binding usa exactamente uno de estos estados:

| Estado             | Semántica                                                                                                                        |
| ------------------ | -------------------------------------------------------------------------------------------------------------------------------- |
| `CONTROL_DEFINIDO` | existe riesgo aplicable y está vinculado a un mecanismo canónico suficiente ya planificado/aprobado                              |
| `NO_APLICA`        | la superficie no puede producir registro o efecto duplicado bajo el contrato vigente, con fundamento trazable                    |
| `BLOQUEADA`        | existe riesgo material pero no puede identificarse o demostrarse un control suficiente                                           |
| `INVALIDADA`       | un binding previamente definido dejó de corresponder a candidato, ambiente, unidad, autoridad, contrato o implementación vigente |

`CONTROL_DEFINIDO` no significa `IMPLEMENTADO` ni `VALIDADO`.

---

#### 20. Regla de bloqueo obligatorio

La unidad no puede considerarse lista para ejecutar cuando exista al menos una superficie material con estado `BLOQUEADA`.

Causas de bloqueo incluyen:

1. falta identidad estable donde el contrato la exige;
2. dos rutas pueden mutar simultáneamente el mismo alcance;
3. un retry podría cambiar de ruta o crear nueva identidad;
4. timeout externo puede producir reenvío ciego;
5. no existe control suficiente frente a reentrega de cola/webhook;
6. el trabajo offline puede reaparecer como operación nueva;
7. `SHADOW` produce efectos;
8. una mutación crítica carece de atomicidad o mecanismo equivalente exigido por su contrato;
9. observabilidad no permite atribuir intento, resultado y efecto cuando el contrato lo requiere;
10. la implementación física referenciada no corresponde al candidato o ambiente;
11. el control depende de una tarea o paquete cuyo gate permanece abierto;
12. la solución exigiría inventar una regla o mecanismo no aprobado.

Cada bloqueo conserva propietario y condición de salida. No se usa `TBD`.

---

#### 21. Relación con `DELIV-PKG-016` y el registro 04A

004 no crea una matriz de pruebas paralela.

Los controles deberán enlazar los `TREQ-*` ya aplicables al paquete y, en particular cuando corresponda:

- `TREQ-INTEGRATION-003` para identidad estable, idempotencia, retry, estado durable y resultado recuperable;
- `TREQ-INTEGRATION-004` para trazabilidad de cadenas y ausencia de duplicación por retry;
- `TREQ-INTEGRATION-005` para continuidad de proceso y contexto entre aplicaciones;
- `TREQ-INTEGRATION-006` para captura única y resolución de fuentes competidoras;
- requisitos de dominio como `TREQ-INTEGRATION-007..010` cuando el paquete esté dentro de esos contratos;
- `TREQ-SUPABASE-001` para compatibilidad legacy y gate de retiro cuando aplique;
- `TREQ-SUPABASE-002` para atomicidad o mecanismo idempotente/reconciliable en operaciones de inventario y representaciones relacionadas;
- `TREQ-SHELL-006` para compatibilidad entre contratos y consumidores;
- `TREQ-SHELL-007` para recuperación independiente y compatible;
- cualquier otro requisito ya vinculado por `DELIV-PKG-016` a la operación concreta.

La lista es de reutilización, no una reasignación global de requisitos a todos los paquetes.

---

#### 22. Tratamiento por modalidad heredada

La clasificación de `CUTOVER-OPS-002` se conserva sin cambios:

| Modalidad heredada            | Tratamiento en 004                                                                                            |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `PILOT-DIRECT-001`            | materializar bindings para las superficies efectivas de sus unidades secuenciadas                             |
| `PILOT-SHARED-001`            | proteger el contrato compartido en las ejecuciones de consumidores directos; no crear una activación ficticia |
| `PILOT-CONTROL-001`           | observar o aplicar enforcement solo donde exista una superficie ejecutable ya aprobada                        |
| AURA bloqueada                | conservar bloqueo; no diseñar un mecanismo físico ficticio                                                    |
| dependencia externa bloqueada | conservar bloqueo hasta cerrar su gate                                                                        |
| TALENTO fuera de línea actual | mantener fuera de ejecución en esta línea                                                                     |

La cobertura heredada continúa reconciliando:

```text
160 + 3 + 26 + 14 + 2 + 2 = 207
```

004 no cambia modalidad, paquete, perfil técnico ni gate.

---

#### 23. Frontera con `CUTOVER-OPS-005`

`CUTOVER-OPS-004` impide o reconoce duplicidad antes de permitir un segundo efecto. No define las conciliaciones empresariales que deberán comparar resultados durante el piloto.

El handoff a 005 es:

```text
UNIDADES Y OLAS
+
OPERACIONES Y EFECTOS IDENTIFICADOS
+
RUTA AUTORITATIVA
+
IDENTIDAD ESTABLE / CORRELACIÓN
+
CONTROL ANTI-DUPLICIDAD VINCULADO
+
RESULTADOS INCIERTOS O REPETICIONES RECONOCIDAS
+
SEÑALES Y EVIDENCIA ESPERADA
=
SUPERFICIES QUE CUTOVER-OPS-005 DEBERÁ CONCILIAR CUANDO CORRESPONDA
```

`CUTOVER-OPS-005` no deberá reinterpretar una duplicación bloqueada como una diferencia reconciliable aceptable ni modificar la autoridad fijada por 003.

---

#### 24. Frontera con las tareas posteriores

004 no anticipa:

- `CUTOVER-OPS-005`: conciliaciones durante el piloto;
- `CUTOVER-OPS-006`: criterio de pausa, reversión o continuación;
- `CUTOVER-OPS-007`: registro de incidentes, decisiones y cambios de alcance;
- `CUTOVER-OPS-008`: métricas de tiempos, errores, adopción y resultado empresarial;
- `CUTOVER-OPS-009`: autoridad y criterio de salida del piloto;
- `CUTOVER-OPS-010`: retiro del proceso anterior.

Una señal de duplicidad podrá ser consumida posteriormente por esas tareas, pero 004 no define sus umbrales ni sus decisiones.

---

#### 25. Invalidation y revalidación

`duplicate_control_manifest::<package_id>` queda `INVALIDADA` cuando cambia materialmente:

- candidato;
- ambiente;
- alcance;
- ventana;
- unidad u ola;
- autoridad de 003;
- operación o efecto protegido;
- contrato de integración;
- mecanismo físico referenciado;
- estrategia de retry;
- modelo de datos;
- estrategia de rollout;
- recovery/rollback;
- requisito `TREQ-*` aplicable;
- responsable del control.

La revalidación debe partir de las fuentes vigentes. No se conserva un binding antiguo por similitud de nombre o tecnología.

---

#### 26. Contenido mínimo del manifiesto

`duplicate_control_manifest::<package_id>` deberá conservar:

1. `package_id`;
2. `candidate_ref`;
3. `environment`;
4. `authorized_scope_ref`;
5. `cutover_window_ref`;
6. `activation_sequence_ref`;
7. `coexistence_manifest_ref`;
8. total de unidades recibidas;
9. total de unidades evaluadas;
10. total de superficies evaluadas;
11. bindings por `operation_or_effect_ref`;
12. ruta autoritativa por binding;
13. control family;
14. fuentes propietarias;
15. `treq_refs`;
16. referencias físicas planificadas cuando existan;
17. manejo de retry, offline o resultado incierto cuando apliquen;
18. observabilidad y evidencia esperada;
19. propietario;
20. estado;
21. bloqueos, propietario y condición de salida;
22. revisión documental y referencias de evidencia.

Todas las unidades recibidas de 003 deben quedar evaluadas, aunque su resultado sea `NO_APLICA`.

---

#### 27. Separación entre diseño y ejecución

`CUTOVER-OPS-004` es exclusivamente documental.

No ejecuta:

- bloqueos físicos;
- writes fences;
- feature flags;
- constraints;
- locks;
- colas;
- outbox/inbox;
- webhooks;
- retries;
- conciliaciones;
- compensaciones;
- rollback;
- migraciones;
- DDL/DML;
- backfills;
- despliegues;
- mutaciones de datos;
- configuración remota;
- operaciones sobre Supabase.

La implementación física corresponde a las tareas y paquetes propietarios ya definidos. La ejecución de cutover corresponde a `SHELL-CI-022::<package_id>`.

---

#### 28. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos TREQ-* creados:** 0  
**Requisitos TREQ-* modificados:** 0  
**Fragmentos 04A afectados:** 0

**Justificación:** `CUTOVER-OPS-004` no introduce una regla ejecutable nueva. Materializa, en la frontera concreta de cutover definida por `CUTOVER-OPS-002/003`, la ubicación y vinculación de controles ya protegidos por requisitos vigentes: identidad estable, idempotencia, reutilización de resultado, conflicto por contenido, retry controlado, atomicidad o mecanismo equivalente, captura única, prevención de fuentes competidoras, compatibilidad legacy, recuperación y trazabilidad. La implementación y prueba de esos comportamientos permanece vinculada a los paquetes mediante `DELIV-PKG-016` y a sus tareas técnicas propietarias. La tarea no cambia identidad, contenido, estado, relación, prioridad, paquete, repositorio, artefacto ni evidencia de ninguna fila `TREQ-*`.

---

#### 29. Criterios de aceptación documental

`CUTOVER-OPS-004` queda documentalmente completo cuando:

1. conserva `CUTOVER-OPS-003 → CUTOVER-OPS-004 → CUTOVER-OPS-005`;
2. utiliza únicamente unidades, olas, alcance y autoridad definidos por 002/003;
3. define `duplicate_risk_surface`, `duplicate_control_binding`, `transition_effect_fence_plan` y `duplicate_control_manifest`;
4. toda superficie mutable o productora de efectos queda evaluada;
5. cada operación aplicable conserva identidad estable conforme a su contrato;
6. una repetición equivalente no produce un segundo efecto;
7. una reutilización incompatible de identidad queda asociada al conflicto exigido por el contrato vigente;
8. ningún retry cambia de ruta para eludir un resultado incierto;
9. un timeout no se interpreta automáticamente como fallo definitivo;
10. el trabajo offline o diferido no pierde identidad por reconexión o cambio de ola;
11. una ruta no autoritativa no conserva permiso de mutación por seguir visible o disponible;
12. `SHADOW` no produce un segundo efecto empresarial;
13. recovery no se convierte en segunda ruta operativa;
14. procesamiento asíncrono referencia mecanismos existentes de idempotencia, claim, outbox/inbox, lock, versión o equivalente según aplicabilidad;
15. operaciones de datos preservan la atomicidad o mecanismo equivalente ya aprobado;
16. efectos externos inciertos no se reenvían ciegamente por otra ruta;
17. la tarea no define conciliaciones, compensaciones o nuevos contratos de retry;
18. ninguna tecnología concreta se impone por preferencia;
19. todo control tiene fuente propietaria y `treq_refs` aplicables;
20. `CONTROL_DEFINIDO` no se confunde con `IMPLEMENTADO` o `VALIDADO`;
21. toda superficie material sin control suficiente queda `BLOQUEADA`;
22. todo bloqueo tiene causa, propietario y condición de salida;
23. los cambios materiales invalidan el manifiesto y exigen revalidación;
24. las modalidades heredadas reconcilian `160 + 3 + 26 + 14 + 2 + 2 = 207`;
25. shared y control no reciben activaciones ficticias;
26. AURA, EXT y TALENTO conservan sus gates;
27. 005 recibe superficies de conciliación sin que 004 ejecute la conciliación;
28. la ejecución física permanece en `SHELL-CI-022::<package_id>` y en las tareas técnicas propietarias;
29. no se ejecutan código, despliegues, activaciones, promociones, migraciones, DDL/DML, backfills, cambios de datos, configuración remota ni operaciones de Supabase;
30. se crean cero requisitos `TREQ-*`, se modifican cero requisitos `TREQ-*` y se afectan cero fragmentos 04A.

---

#### 30. Continuidad

##### ÚLTIMA TAREA APROBADA
CUTOVER-OPS-003 — Definir convivencia temporal con el proceso anterior

##### TAREA ACTUAL APROBADA
CUTOVER-OPS-004 — Diseñar controles contra doble registro y doble efecto durante la transición

##### SIGUIENTE TAREA RESERVADA
CUTOVER-OPS-005 — Definir conciliaciones durante el piloto


### ✅ CUTOVER-OPS-005 — Definir conciliaciones durante el piloto

**Estado:** APROBADA  
**Tarea anterior:** `CUTOVER-OPS-004 — Diseñar controles contra doble registro y doble efecto durante la transición`  
**Tarea siguiente:** `CUTOVER-OPS-006 — Definir criterio de pausa, reversión o continuación`  
**Tipo de tarea:** documental — definición normativa y materialización del plan de conciliación durante el piloto sobre las unidades, olas, operaciones, efectos, identidades, fuentes autoritativas, resultados inciertos y controles anti-duplicidad ya definidos, vinculando reglas canónicas existentes de correlación, comparación, idempotencia, fuentes de verdad, recuperación, compensación, observabilidad y evidencia; sin ejecutar conciliaciones, corregir datos, reintentar operaciones, compensar efectos, modificar autoridad, decidir pausa/reversión/continuación, registrar incidentes, retirar legacy, desplegar código, ejecutar migraciones, DDL/DML, backfills, cambios remotos ni operaciones sobre Supabase  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/04_CUTOVER_Y_PILOTO.md`  
**Ejecución posterior:** `SHELL-CI-022::<package_id>` después de `SHELL-CI-021::<package_id>` y de completar los contratos CUTOVER aplicables  
**Cambios físicos autorizados:** ninguno  
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`CUTOVER-OPS-005` define cómo deberá demostrarse durante el piloto que las representaciones, efectos y resultados que deban converger permanecen coherentes con su fuente autoritativa y con los contratos aprobados del paquete.

La tarea parte de la superficie entregada por `CUTOVER-OPS-004` y responde exclusivamente a estas preguntas:

```text
¿QUÉ UNIDAD, OLA, OPERACIÓN O EFECTO REQUIERE CONCILIACIÓN?
+
¿CUÁL ES LA FUENTE AUTORITATIVA QUE DEFINE EL RESULTADO ESPERADO?
+
¿QUÉ IDENTIDAD O CORRELACIÓN PERMITE COMPARAR EL MISMO HECHO?
+
¿QUÉ CONTRAPARTE OBSERVADA DEBE CONTRASTARSE?
+
¿QUÉ REGLA DE COMPARACIÓN YA APROBADA DETERMINA COINCIDENCIA O DIFERENCIA?
+
¿LA DIFERENCIA ESTÁ EXPLÍCITAMENTE PERMITIDA, SIGUE INCIERTA O CONSTITUYE UNA ANOMALÍA?
+
¿QUÉ EVIDENCIA Y PROPIETARIO CONSERVAN EL RESULTADO?
=
CONCILIACIÓN DEL PILOTO DEFINIDA SIN INVENTAR FUENTES, TOLERANCIAS NI CORRECCIONES
```

Esta tarea no ejecuta la conciliación ni corrige una diferencia. Materializa el contrato que la ejecución posterior deberá consumir.

---

#### 2. Definiciones de trabajo

Para esta tarea:

- **conciliación**: comparación trazable entre una fuente autoritativa y una o más representaciones, entregas, efectos o resultados relacionados, usando identidad y regla de comparación ya aprobadas;
- **fuente autoritativa**: fuente de verdad, productora empresarial, ledger, estado de dominio, sistema externo contractual o referencia explícitamente gobernada por la fuente propietaria;
- **contraparte observada**: proyección, consumidor, integración, efecto externo, registro compatible, resultado técnico o representación derivada que debe concordar con la fuente autoritativa según el contrato aplicable;
- **clave de conciliación**: identidad estable, clave empresarial, `event_id`, `operation_id`, `correlation_id`, clave de efecto, versión o combinación explícitamente aprobada que permite asegurar que se compara el mismo hecho;
- **regla de comparación**: contrato vigente que define qué campos, estados, cantidades, versiones, relaciones o efectos deben coincidir y qué divergencias temporales, si existen, son admisibles;
- **resultado incierto**: caso en el que existe posibilidad de efecto o mutación, pero la evidencia disponible todavía no permite clasificarlo como aplicado o no aplicado;
- **diferencia esperada**: divergencia temporal admitida expresamente por una fuente canónica, con condición de convergencia o cierre identificable;
- **diferencia no resuelta**: divergencia no autorizada o todavía no explicada por el contrato aplicable.

La conciliación no equivale a promedio, mayoría, copia bidireccional, sobrescritura, reparación automática ni elección de la fuente con el dato “más reciente”.

---

#### 3. Resultado sustantivo

Por cada instancia aplicable de `package_id`, la tarea materializa cuatro piezas documentales:

1. `pilot_reconciliation_surface::<package_id>` — conjunto de superficies que requieren o pueden requerir conciliación durante el piloto;
2. `pilot_reconciliation_rule_binding::<package_id>` — vínculo de cada superficie con su fuente autoritativa, contraparte, clave de correlación, regla de comparación, requisitos existentes, propietario y evidencia;
3. `pilot_reconciliation_plan::<package_id>` — orden y momento documental en que deberán evaluarse las conciliaciones aplicables dentro de la secuencia ya aprobada;
4. `pilot_reconciliation_manifest::<package_id>` — expediente consolidado de unidades, olas, superficies, reglas, resultados posibles, bloqueos, responsables y handoff a `CUTOVER-OPS-006`.

Estas piezas no constituyen evidencia de ejecución. Un plan `DEFINIDO` no implica que una conciliación haya sido corrida ni que una diferencia haya sido resuelta.

---

#### 4. Entradas obligatorias

`CUTOVER-OPS-005` consume, sin redefinirlas:

- `CUTOVER-OPS-001`: ventana, candidato, ambiente, alcance y responsables vigentes;
- `CUTOVER-OPS-002`: unidades, olas, orden, dependencias, estado seguro y puntos de decisión;
- `CUTOVER-OPS-003`: ruta anterior, ruta objetivo, autoridad antes/después, trabajo en curso, compatibilidad temporal y recovery;
- `CUTOVER-OPS-004`: operaciones y efectos, identidad estable, control anti-duplicidad, resultados inciertos, repeticiones reconocidas, señales y evidencia esperada;
- `DELIV-PKG-009`: migraciones, backfills, compatibilidad temporal y retiro legacy;
- `DELIV-PKG-010`: eventos, productoras, consumidoras, entrega, idempotencia, retry, colas, aislamiento, compensación y conciliación;
- `DELIV-PKG-012`: autorización y frontera autoritativa de servidor;
- `DELIV-PKG-015`: dependencias, bloqueos y orden técnico;
- `DELIV-PKG-016`: requisitos de prueba, niveles, fixtures, entornos, responsables y evidencia esperada;
- `DELIV-PKG-017`: logs, métricas, trazas, alertas, correlación y auditoría;
- `DELIV-PKG-018`: estado seguro, targeting, activación y kill switch;
- `DELIV-PKG-019`: rollout, shadow, cohortes, pausas y promoción;
- `DELIV-PKG-020`: rollback, recovery, compensation, efectos irreversibles y conciliación;
- `DELIV-PKG-022`: alcance y cohorte de piloto;
- `READY-GATE-010..015`: soporte, observabilidad, recuperación, línea base, riesgos y autorización final de entrada.

Si una entrada necesaria no permite identificar una fuente autoritativa, clave de conciliación o regla de comparación sin inferencia, la superficie queda `BLOQUEADA`.

---

#### 5. Invariante principal

Toda conciliación ejecutable deberá respetar:

```text
MISMO HECHO U OPERACIÓN
+
IDENTIDAD / CORRELACIÓN ESTABLE
+
FUENTE AUTORITATIVA EXPLÍCITA
+
CONTRAPARTE IDENTIFICADA
+
REGLA DE COMPARACIÓN VIGENTE
+
EVIDENCIA REPRODUCIBLE
=
RESULTADO DE CONCILIACIÓN ATRIBUIBLE
```

Se prohíbe:

1. conciliar por semejanza de texto, timestamp aproximado o posición visual cuando la identidad canónica exige otra clave;
2. escoger como fuente de verdad el valor mayor, menor, más reciente o mayoritario sin contrato explícito;
3. considerar que dos valores iguales prueban por sí solos que corresponden al mismo hecho;
4. convertir una diferencia en corrección automática;
5. interpretar ausencia de registro, log, callback o ACK como ausencia de efecto;
6. aceptar una duplicación confirmada como “diferencia tolerable”;
7. reejecutar una operación para intentar hacer coincidir las fuentes;
8. sobrescribir historia para eliminar la evidencia de una diferencia.

---

#### 6. Unidad mínima de conciliación

La unidad mínima documental es:

```text
package_id
+
candidate_ref
+
environment
+
authorized_scope_ref
+
activation_unit_ref
+
wave_ref
+
reconciliation_subject_ref
```

`reconciliation_subject_ref` identifica el hecho, operación, efecto, entidad, proyección, entrega o relación concreta que debe compararse.

Una unidad de activación puede producir cero, una o varias superficies de conciliación. No se crea una conciliación artificial para completar una cantidad predeterminada.

---

#### 7. Superficies que deben evaluarse

`pilot_reconciliation_surface::<package_id>` deberá revisar, cuando apliquen según las fuentes del paquete:

| Superficie                                    | Conciliación exigible                                                                                       |
| --------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| resultado `RESULT_UNKNOWN` o equivalente      | confirmar si el efecto ocurrió antes de permitir cualquier tratamiento posterior                            |
| retry o repetición reconocida                 | comprobar que la operación conserva un único resultado o efecto conforme a su contrato                      |
| productor → consumidor                        | comparar hecho fuente, identidad, versión, audiencia y proyección cuando el contrato exige convergencia     |
| outbox/inbox/cola/job                         | correlacionar operación, intento, entrega, resultado y estado durable                                       |
| webhook/callback externo                      | correlacionar solicitud, respuesta, callback, estado externo y estado interno gobernado                     |
| inventario/ledger/costo                       | comprobar representaciones que el contrato exige mantener atómicas o reconciliables                         |
| migración/backfill                            | comprobar cobertura, identidad, procedencia y resultado cuando el plan de transición exige conciliación     |
| offline/móvil                                 | correlacionar trabajo local pendiente con el resultado autoritativo después de sincronización               |
| ruta anterior/ruta objetivo                   | verificar que la transición no dejó fuentes competidoras cuando la compatibilidad exige una sola autoridad  |
| proyección/Realtime/cache                     | comprobar convergencia solo cuando el contrato la trata como representación derivada                        |
| reporte/analítica                             | comprobar cobertura, duplicados, frescura, linaje y reconciliación cuando el paquete incluye esa superficie |
| efecto irreversible o parcialmente reversible | conservar evidencia y tratamiento de `DELIV-PKG-020` sin simular reversibilidad                             |

Una superficie solo entra al plan cuando una fuente aprobada demuestra que debe existir relación de coherencia o convergencia.

---

#### 8. Determinación de la fuente autoritativa

La fuente autoritativa se resuelve por precedencia contractual:

1. fuente primaria de dominio o sistema propietario ya aprobada;
2. productora empresarial definida por el contrato de eventos;
3. ledger o registro autoritativo expresamente definido;
4. fuente externa cuando el contrato aprobado le atribuye autoridad sobre ese hecho;
5. otra fuente expresamente materializada por la tarea propietaria.

No son fuentes autoritativas por sí mismas:

- una pantalla;
- una copia local;
- una caché;
- una proyección;
- Realtime;
- un log;
- una métrica;
- una tabla por ser técnicamente accesible;
- una Edge Function por ejecutar código;
- un webhook por transportar un mensaje;
- una aplicación consumidora;
- la ruta anterior después de perder autoridad;
- la ruta objetivo antes de recibirla.

Si dos fuentes reclaman autoridad sobre el mismo hecho y ninguna precedencia canónica lo resuelve, la conciliación queda `BLOQUEADA`.

---

#### 9. Identidad y correlación

Toda comparación deberá usar la identidad aprobada para la superficie.

Según aplicabilidad, podrá incluir:

- identificador empresarial estable;
- `event_id`;
- `operation_id`;
- `idempotency_key`;
- `correlation_id`;
- `causation_id`;
- clave de efecto;
- versión de agregado o recurso;
- identificador externo contractual;
- clave compuesta aprobada.

Reglas:

1. un retry conserva la identidad de la operación que el contrato exige;
2. una redelivery conserva la identidad del evento;
3. una operación externa conserva correlación suficiente para consultar su resultado;
4. una clave de conciliación no se reconstruye por coincidencia de nombre o descripción;
5. si la identidad se perdió y no existe contrato seguro para reconstruirla, el caso queda `BLOQUEADA`;
6. la conciliación no crea un identificador retroactivo para aparentar que dos registros siempre fueron el mismo hecho.

---

#### 10. Regla de comparación

Cada `pilot_reconciliation_rule_binding` deberá referenciar una regla ya aprobada que determine qué comparar.

La regla puede exigir, según la superficie:

- existencia;
- identidad;
- versión;
- estado;
- cantidad;
- unidad;
- importe;
- moneda;
- recurso;
- propietario;
- actor o principal;
- alcance;
- orden causal;
- conteo de efectos;
- estado externo;
- timestamp semántico;
- cobertura;
- frescura;
- integridad referencial;
- linaje.

No existe una lista universal de campos obligatorios para todas las conciliaciones.

Si una comparación requiere tolerancia numérica, ventana temporal, rounding, timezone, orden, cardinalidad o equivalencia semántica, ese criterio debe provenir de una fuente canónica. 005 no inventa tolerancias por conveniencia.

---

#### 11. Momento de conciliación

`pilot_reconciliation_plan::<package_id>` deberá ubicar cada conciliación en uno o más momentos ya permitidos por el contrato aplicable:

- después de una operación o efecto cuando el resultado debe verificarse inmediatamente;
- antes de reintentar un `RESULT_UNKNOWN`;
- después de recibir callback o confirmación externa;
- al cerrar un lote o trabajo asíncrono cuando el contrato lo exige;
- antes de un checkpoint entre olas;
- al finalizar una ola cuando la evidencia del paquete lo requiere;
- antes de una decisión de recovery o compensation cuando la reversibilidad depende del estado real;
- al cierre del periodo de piloto cuando una fuente exige convergencia acumulada.

La tarea no fija una frecuencia universal ni un intervalo por defecto.

`CUTOVER-OPS-006` conserva la propiedad de decidir qué resultado de conciliación obliga a continuar, pausar o revertir.

---

#### 12. Clasificación documental de resultados

Cada ejecución futura deberá poder materializar uno de estos resultados documentales:

| Estado                   | Semántica                                                                                                               |
| ------------------------ | ----------------------------------------------------------------------------------------------------------------------- |
| `CONCILIADA`             | la comparación ejecutada coincide con la regla aplicable y existe evidencia reproducible                                |
| `DIFERENCIA_ESPERADA`    | existe divergencia explícitamente permitida por un contrato vigente y su condición de convergencia sigue abierta        |
| `DIFERENCIA_NO_RESUELTA` | existe divergencia no explicada o no permitida por la regla vigente                                                     |
| `RESULTADO_INCIERTO`     | no existe evidencia suficiente para determinar el estado o efecto real                                                  |
| `DUPLICIDAD_CONFIRMADA`  | la evidencia demuestra más de un registro o efecto donde el contrato exige unicidad                                     |
| `NO_APLICA`              | la superficie no requiere conciliación bajo el contrato vigente                                                         |
| `BLOQUEADA`              | no puede construirse o ejecutarse de forma segura por falta de fuente, identidad, regla, acceso o evidencia obligatoria |
| `INVALIDADA`             | el binding dejó de corresponder a candidato, ambiente, unidad, fuente, contrato o implementación vigentes               |

En el artefacto de planificación, estos valores describen el espacio de resultados permitido. No se asigna `CONCILIADA` sin ejecución real.

---

#### 13. Diferencias esperadas

`DIFERENCIA_ESPERADA` solo puede usarse cuando la fuente propietaria define explícitamente:

1. qué representaciones pueden divergir;
2. por qué esa divergencia es válida;
3. desde qué evento o frontera comienza;
4. cuál es su condición objetiva de convergencia o cierre;
5. qué evidencia permite demostrar que sigue dentro del contrato.

No se convierte latencia desconocida, dato faltante, error silencioso o duplicación en diferencia esperada.

Una divergencia cuyo periodo permitido venció pasa al tratamiento que corresponda según la regla propietaria y no conserva automáticamente `DIFERENCIA_ESPERADA`.

---

#### 14. Resultados inciertos

Un `RESULTADO_INCIERTO` se conserva como incertidumbre hasta obtener evidencia suficiente.

Reglas:

- no se presume éxito;
- no se presume fallo;
- no se reejecuta por otra ruta para “comprobar”;
- se consulta o reconcilia conforme al contrato de integración y recovery;
- conserva identidad, intentos, timestamps semánticos y evidencia disponible;
- si la incertidumbre no puede resolverse dentro de la capacidad aprobada del paquete, queda explícitamente entregada a la decisión de `CUTOVER-OPS-006`;
- cualquier incidente o decisión derivada se registrará mediante `CUTOVER-OPS-007`.

005 no define el umbral temporal que transforma la incertidumbre en una decisión de pausa o reversión.

---

#### 15. Duplicidad confirmada

La conciliación puede detectar una duplicidad, pero no la normaliza.

Ante `DUPLICIDAD_CONFIRMADA`:

1. se preservan todas las identidades y efectos observados;
2. no se elimina ni fusiona historia para ocultar la repetición;
3. se referencia el binding de `CUTOVER-OPS-004` que debía impedirla;
4. se conserva la fuente autoritativa;
5. se preserva la evidencia necesaria para diagnóstico y tratamiento;
6. la decisión de continuar, pausar o revertir pertenece a `CUTOVER-OPS-006`;
7. el registro del incidente pertenece a `CUTOVER-OPS-007`;
8. correction, compensation, reverse, refund, adjust, restate u otra acción solo se ejecuta mediante el contrato propietario correspondiente.

Una duplicidad confirmada nunca puede clasificarse como `CONCILIADA`.

---

#### 16. Integraciones, eventos y trabajo asíncrono

Para superficies gobernadas por `DELIV-PKG-010`:

- un evento empresarial y un evento técnico no se comparan como si fueran la misma identidad;
- el `event_id` permanece estable en redelivery;
- un retry crea nuevo intento, no nueva operación empresarial;
- un timeout posterior a una posible frontera de efecto exige consulta o conciliación antes de reejecución;
- `DEAD_LETTER`, `QUARANTINE` y `RECONCILIATION` conservan sus semánticas técnicas y no se convierten en estados empresariales;
- una consumidora puede tener estado técnico diferente sin cambiar el hecho confirmado por la productora;
- una proyección se concilia contra la fuente propietaria cuando el contrato exige convergencia;
- un coordinador de compensación no adquiere autoridad para escribir la fuente privada de otra aplicación.

005 no crea eventos, colas, workers, DLQ, compensaciones ni políticas de retry.

---

#### 17. Datos, ledger e inventario

Cuando una superficie afecte ledger, stock, costos u otras representaciones relacionadas:

1. se identifica la fuente o conjunto autoritativo definido por el contrato;
2. se utiliza la identidad empresarial o transaccional aprobada;
3. se comparan las representaciones que deben permanecer atómicas o reconciliables;
4. un fallo parcial conserva evidencia de cada efecto conocido;
5. una diferencia no se corrige sobrescribiendo historia;
6. una reejecución no sustituye la conciliación;
7. correction, adjust, reverse, compensate u otra operación posterior conserva su propia identidad y autorización.

La tarea no ejecuta DML ni modifica valores.

---

#### 18. Migraciones, backfills y compatibilidad

Cuando `DELIV-PKG-009` materialice una transición que exige conciliación:

- origen y destino se correlacionan por la identidad definida por el plan;
- se conserva procedencia;
- se valida cobertura cuando corresponda;
- se distinguen dato ausente, nulo, no aplicable, desconocido y pendiente cuando el contrato lo exige;
- una diferencia de esquema o representación no se considera diferencia empresarial si la regla de transición define equivalencia explícita;
- un backfill no autoriza efectos empresariales secundarios que el contrato prohíbe;
- la retirada legacy no se acelera por una conciliación parcial.

El retiro físico sigue reservado a su tarea propietaria y a `CUTOVER-OPS-010`.

---

#### 19. Offline, móvil y trabajo diferido

Los elementos pendientes originados antes o durante la activación deberán conciliarse con su identidad original.

Aplican estas reglas:

- reconexión no crea una segunda identidad;
- un outbox pendiente se compara con el resultado autoritativo antes de decidir tratamiento cuando exista incertidumbre;
- una operación local no se declara “perdida” por no aparecer todavía en una proyección;
- una sincronización repetida no convierte una representación derivada en fuente de verdad;
- si el cliente antiguo y el nuevo producen representaciones que no pueden correlacionarse con seguridad, la superficie queda `BLOQUEADA`.

005 no define una nueva estrategia offline.

---

#### 20. Proyecciones, Realtime, cache y reporting

Una representación derivada se concilia de acuerdo con su contrato y nunca adquiere autoridad por coincidencia.

En particular:

- Realtime permanece mecanismo de sincronización cuando así está definido;
- una caché puede quedar temporalmente rezagada únicamente si el contrato lo permite;
- una proyección no corrige el hecho fuente;
- un reporte no se considera certificado si su fuente está vencida, incompleta, degradada o sin reconciliar cuando la regla aplicable lo exige;
- cero, nulo, no aplica, desconocido, no recibido y pendiente no se colapsan en un único valor si el contrato los distingue;
- un dashboard coincidente no prueba integridad del dato fuente por sí solo.

---

#### 21. Conciliación manual controlada

Una intervención manual solo puede formar parte del plan cuando el procedimiento propietario ya la contempla.

Debe conservar, como mínimo:

- identidad del caso;
- fuente autoritativa;
- contraparte;
- regla utilizada;
- actor autorizado;
- antes y después cuando exista una acción posterior;
- motivo;
- evidencia;
- relación con incidente o recovery cuando aplique.

La tarea no crea una excepción de autorización para “arreglar” conciliaciones manualmente.

---

#### 22. Observabilidad y evidencia

`DELIV-PKG-017` sigue siendo propietario de señales, logs, métricas, trazas, alertas y auditoría.

Para 005, la evidencia mínima de una conciliación deberá permitir reconstruir:

1. paquete, candidato y ambiente;
2. unidad y ola;
3. sujeto conciliado;
4. fuente autoritativa;
5. contraparte;
6. identidad o correlación;
7. regla de comparación y versión;
8. instante o periodo evaluado;
9. resultado;
10. diferencia observada cuando exista;
11. responsable;
12. referencias de evidencia;
13. relación con control anti-duplicidad, recovery o incidente cuando aplique.

No se registran secretos completos, credenciales ni payloads sensibles por conveniencia de diagnóstico.

---

#### 23. Aplicabilidad al universo heredado

`CUTOVER-OPS-005` conserva las 207 raíces y las modalidades de piloto de `DELIV-PKG-022`:

| Modalidad heredada            | Cantidad | Tratamiento de conciliación                                                                                      |
| ----------------------------- | -------: | ---------------------------------------------------------------------------------------------------------------- |
| `PILOT-DIRECT-001`            |  **160** | evaluar todas las superficies de sus unidades efectivamente pilotadas que tengan regla de conciliación aplicable |
| `PILOT-SHARED-001`            |    **3** | conciliar mediante consumidores directos y contratos compartidos; no crear un piloto independiente               |
| `PILOT-CONTROL-001`           |   **26** | observar y conciliar únicamente las superficies gobernadas que el control deba verificar; no inventar mutaciones |
| AURA bloqueada                |   **14** | conservar el bloqueo; no ejecutar ni simular conciliaciones productivas                                          |
| dependencia externa bloqueada |    **2** | conservar el gate externo; no inventar contraparte o resultado                                                   |
| TALENTO fuera de línea actual |    **2** | mantener fuera de ejecución en esta línea                                                                        |

Reconciliación del universo:

```text
160 + 3 + 26 + 14 + 2 + 2 = 207
```

Esta tarea no reasigna `package_id`, perfil, modalidad, alcance ni estado heredado.

---

#### 24. Cobertura por unidad

Para toda instancia que llegue desde `CUTOVER-OPS-004`, el manifiesto deberá demostrar:

1. total de unidades recibidas;
2. total de unidades evaluadas;
3. total de superficies identificadas;
4. total con conciliación requerida;
5. total `NO_APLICA` con fundamento;
6. total `BLOQUEADA`;
7. ausencia de unidades huérfanas;
8. ausencia de superficies duplicadas por la misma identidad y regla;
9. trazabilidad de cada superficie a su fuente propietaria;
10. reconciliación exacta entre inventario de entrada y tratamiento de salida.

Una unidad sin superficie conciliable no se convierte artificialmente en una conciliación vacía; queda cubierta mediante `NO_APLICA` documentado.

---

#### 25. Condiciones de bloqueo

Una superficie queda `BLOQUEADA` cuando ocurra al menos una de estas condiciones:

1. no existe fuente autoritativa identificable;
2. dos fuentes reclaman autoridad sin precedencia resuelta;
3. falta identidad o correlación suficiente;
4. no existe contraparte identificable cuando el contrato exige comparación;
5. la regla de comparación no está materializada;
6. se necesitaría inventar tolerancia, rounding, timezone, equivalencia o ventana;
7. un resultado incierto no puede consultarse ni correlacionarse de forma segura;
8. falta evidencia u observabilidad obligatoria;
9. el control anti-duplicidad de 004 está bloqueado para la misma superficie;
10. la implementación física requerida no corresponde al candidato o ambiente;
11. la superficie depende de un gate todavía abierto;
12. conciliar exigiría ampliar alcance, permisos, cohorte, sede, rol, dato, dispositivo o ambiente;
13. la única forma disponible de “conciliar” sería modificar o borrar historia sin contrato aprobado.

Todo bloqueo conserva causa, insumo faltante, propietario canónico, fuente o tarea propietaria y condición verificable de salida.

---

#### 26. Invalidación y revalidación

`pilot_reconciliation_manifest::<package_id>` queda `INVALIDADA` cuando cambia materialmente:

- candidato;
- ambiente;
- alcance;
- ventana;
- unidad u ola;
- autoridad de `CUTOVER-OPS-003`;
- superficie o control de `CUTOVER-OPS-004`;
- fuente autoritativa;
- identidad o correlación;
- regla de comparación;
- contrato de integración;
- modelo de datos;
- estrategia de transición;
- rollout;
- recovery/rollback;
- observabilidad;
- requisito de prueba aplicable.

La revalidación parte de las fuentes vigentes. Una conciliación histórica permanece como evidencia de la revisión que realmente evaluó y no se reescribe para corresponder a una revisión posterior.

---

#### 27. Contenido mínimo del manifiesto

`pilot_reconciliation_manifest::<package_id>` deberá conservar como mínimo:

1. `package_id`;
2. `candidate_ref`;
3. `environment`;
4. `authorized_scope_ref`;
5. `cutover_window_ref`;
6. `activation_sequence_ref`;
7. `coexistence_manifest_ref`;
8. `duplicate_control_manifest_ref`;
9. total de unidades recibidas;
10. total de unidades evaluadas;
11. `activation_unit_ref`;
12. `wave_ref`;
13. `reconciliation_subject_ref`;
14. `authoritative_source_ref`;
15. `observed_counterpart_ref`;
16. `correlation_key_ref`;
17. `comparison_rule_ref`;
18. momento o trigger documental de conciliación;
19. referencias de requisitos y prueba ya vinculadas por el paquete;
20. referencias de observabilidad;
21. responsable;
22. espacio de resultado aplicable;
23. bloqueos, propietario y condición de salida;
24. revisión documental;
25. referencias de evidencia.

El manifiesto de planificación no almacena un resultado ejecutado inexistente.

---

#### 28. Relación con requisitos vigentes

005 reutiliza, según la superficie concreta y la matriz de `DELIV-PKG-016`, requisitos existentes que ya protegen:

- identidad estable, resultado recuperable, idempotencia y conciliación de trabajo reintentable;
- trazabilidad de intentos y efectos;
- captura única y resolución de fuentes competidoras;
- atomicidad o mecanismo idempotente y reconciliable para representaciones relacionadas;
- calidad, duplicados, frescura, backfills, reconciliación y linaje de datos;
- compatibilidad legacy y recuperación;
- contratos específicos de dominio vinculados a cada paquete.

La presencia de una referencia existente no significa que aplique a todas las raíces. Cada binding conserva únicamente los requisitos que `DELIV-PKG-016` y las fuentes propietarias vinculen a la superficie real.

---

#### 29. Handoff a `CUTOVER-OPS-006`

`CUTOVER-OPS-005` entrega a `CUTOVER-OPS-006`:

```text
UNIDADES Y OLAS VIGENTES
+
SUPERFICIES DE CONCILIACIÓN
+
FUENTE AUTORITATIVA Y CONTRAPARTE
+
IDENTIDAD / CORRELACIÓN
+
REGLA DE COMPARACIÓN
+
ESPACIO DE RESULTADOS
+
DIFERENCIAS NO RESUELTAS
+
RESULTADOS INCIERTOS
+
DUPLICIDADES CONFIRMADAS
+
BLOQUEOS Y EVIDENCIA
=
ENTRADAS TRAZABLES PARA DEFINIR CONTINUAR, PAUSAR O REVERTIR
```

005 no decide qué combinación de resultados autoriza continuar, obliga a pausar o exige revertir. Esa semántica pertenece exclusivamente a `CUTOVER-OPS-006`.

---

#### 30. Frontera con las tareas posteriores

Esta tarea no anticipa:

- `CUTOVER-OPS-006`: criterio de pausa, reversión o continuación;
- `CUTOVER-OPS-007`: registro de incidentes, decisiones y cambios de alcance;
- `CUTOVER-OPS-008`: métricas de tiempos, errores, adopción y resultado empresarial;
- `CUTOVER-OPS-009`: autoridad y criterio para aprobar salida del piloto o exigir correcciones;
- `CUTOVER-OPS-010`: condiciones y evidencia para retirar el proceso anterior.

Una diferencia, incertidumbre o duplicidad puede convertirse en entrada de esas tareas, pero 005 no define sus umbrales, decisiones ni acciones.

---

#### 31. Separación entre planificación y ejecución

`CUTOVER-OPS-005` es exclusivamente documental.

No ejecuta:

- queries de conciliación;
- scripts de comparación;
- reintentos;
- correcciones;
- compensaciones;
- refunds;
- reversas;
- ajustes;
- restatements;
- escrituras;
- migraciones;
- DDL/DML;
- backfills;
- cambios de RLS;
- cambios de feature flags;
- despliegues;
- operaciones remotas;
- operaciones sobre Supabase.

La ejecución de cutover y piloto corresponde a `SHELL-CI-022::<package_id>` consumiendo los contratos aplicables. Las acciones correctivas pertenecen a sus fuentes técnicas y funcionales propietarias.

---

#### 32. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0  
**Requisitos modificados:** 0  
**Fragmentos 04A afectados:** 0

**Justificación:** `CUTOVER-OPS-005` no introduce una nueva regla ejecutable, algoritmo de comparación, tolerancia, transición de estado empresarial, fuente de verdad, mecanismo de idempotencia, retry, compensación o recuperación. Materializa dentro de la frontera concreta del piloto cuándo y contra qué fuentes deberán aplicarse obligaciones de conciliación ya existentes y ya vinculadas a los paquetes. Cuando una fuente no define identidad, comparación, tolerancia o tratamiento suficiente, esta tarea bloquea la superficie en lugar de crear una semántica nueva.

---

#### 33. Criterios de aceptación documental

`CUTOVER-OPS-005` queda documentalmente completo cuando:

1. conserva `CUTOVER-OPS-004 → CUTOVER-OPS-005 → CUTOVER-OPS-006`;
2. usa únicamente unidades, olas, operaciones, efectos y controles recibidos de las tareas anteriores;
3. define `pilot_reconciliation_surface`, `pilot_reconciliation_rule_binding`, `pilot_reconciliation_plan` y `pilot_reconciliation_manifest`;
4. toda superficie de conciliación identifica el mismo paquete, candidato, ambiente y alcance;
5. toda conciliación aplicable identifica fuente autoritativa;
6. toda conciliación aplicable identifica contraparte;
7. toda conciliación aplicable usa identidad o correlación estable;
8. toda conciliación aplicable referencia una regla vigente de comparación;
9. no se inventan tolerancias, ventanas, rounding, timezone o equivalencias;
10. no se elige fuente autoritativa por mayoría, recencia o conveniencia;
11. un resultado incierto no se presume exitoso ni fallido;
12. un resultado incierto no se reejecuta para intentar resolverlo;
13. una duplicidad confirmada nunca se clasifica como conciliada;
14. una diferencia esperada requiere contrato explícito y condición de convergencia;
15. una diferencia no resuelta conserva evidencia y propietario;
16. no se sobrescribe historia para ocultar divergencias;
17. eventos empresariales y eventos técnicos conservan identidades y semánticas distintas;
18. un retry conserva la identidad de la operación que su contrato exige;
19. Realtime, cache, UI, logs y métricas no adquieren autoridad por ser observables;
20. inventario, ledger y costos usan las reglas de atomicidad o conciliación ya aprobadas cuando aplican;
21. migraciones y backfills conservan procedencia e identidad cuando requieren conciliación;
22. offline y trabajo diferido preservan identidad a través de la reconexión;
23. conciliación manual no amplía autorización;
24. evidencia permite reconstruir fuente, contraparte, identidad, regla y resultado;
25. las 207 raíces conservan la distribución `160 + 3 + 26 + 14 + 2 + 2`;
26. todas las unidades recibidas quedan cubiertas mediante conciliación aplicable o `NO_APLICA` fundamentado;
27. todo bloqueo conserva causa, insumo, propietario y condición de salida;
28. cambios materiales invalidan el manifiesto y obligan a revalidar;
29. 006 recibe entradas de conciliación sin que 005 decida continuar, pausar o revertir;
30. 005 no registra incidentes, define métricas, aprueba salida ni retira legacy;
31. la ejecución física permanece en `SHELL-CI-022::<package_id>` y en las tareas técnicas propietarias;
32. no se ejecutan código, queries, scripts, despliegues, migraciones, DDL/DML, backfills, cambios de datos, configuración remota ni operaciones de Supabase;
33. se crean cero requisitos de prueba, se modifican cero requisitos de prueba y se afectan cero fragmentos 04A.

---

#### 34. Continuidad

##### ÚLTIMA TAREA APROBADA
CUTOVER-OPS-004 — Diseñar controles contra doble registro y doble efecto durante la transición

##### TAREA ACTUAL APROBADA
CUTOVER-OPS-005 — Definir conciliaciones durante el piloto

##### SIGUIENTE TAREA RESERVADA
CUTOVER-OPS-006 — Definir criterio de pausa, reversión o continuación


### ✅ CUTOVER-OPS-006 — Definir criterio de pausa, reversión o continuación

**Estado:** APROBADA  
**Tarea anterior:** `CUTOVER-OPS-005 — Definir conciliaciones durante el piloto`  
**Tarea siguiente:** `CUTOVER-OPS-007 — Diseñar el registro de incidentes, decisiones y cambios de alcance`  
**Tipo de tarea:** documental — definición normativa y materialización, por paquete y checkpoint de piloto, del criterio determinista para decidir continuidad, pausa o reversión a partir de señales, riesgos, conciliaciones, controles anti-duplicidad, evidencia, rollout y rollback ya aprobados; sin ejecutar piloto, promoción, pausa física, kill switch, rollback, restore, compensación, corrección, cambios de alcance, despliegues, migraciones, DDL/DML, backfills, cambios de configuración, modificaciones de datos ni operaciones sobre Supabase  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/04_CUTOVER_Y_PILOTO.md`  
**Ejecución posterior:** `SHELL-CI-022::<package_id>` después de `SHELL-CI-021::<package_id>` y de completar los contratos CUTOVER aplicables  
**Cambios físicos autorizados:** ninguno  
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`CUTOVER-OPS-006` define cómo una instancia de piloto deberá resolver, en cada checkpoint aplicable, una de tres disposiciones operativas:

```text
CONTINUAR
PAUSAR
REVERTIR
```

La decisión se construye únicamente con evidencia y reglas ya aprobadas para el mismo paquete, candidato, ambiente, alcance, unidad y ola.

La tarea responde exclusivamente a estas preguntas:

```text
¿LA IDENTIDAD Y EL ALCANCE EVALUADOS SIGUEN SIENDO LOS AUTORIZADOS?
+
¿LAS SEÑALES, RIESGOS, CONTROLES, CONCILIACIONES Y EVIDENCIAS OBLIGATORIAS SIGUEN VIGENTES?
+
¿EXISTE UNA CONDICIÓN QUE BLOQUEA EXPANSIÓN PERO PERMITE MANTENER UN ESTADO SEGURO?
+
¿EXISTE UN DISPARADOR DE RECUPERACIÓN O ROLLBACK YA APROBADO QUE EXIGE RETIRAR EL CANDIDATO?
+
¿LA AUTORIDAD CORRECTA PUEDE EMITIR LA DECISIÓN CON EVIDENCIA?
=
CONTINUAR, PAUSAR O REVERTIR SIN INFERENCIAS
```

006 no crea nuevos umbrales, severidades, tolerancias, tiempos, RTO, RPO, SLO, métricas, autoridades ni mecanismos de recuperación.

---

#### 2. Resultado sustantivo

Por cada instancia aplicable de `package_id`, la tarea materializa cuatro piezas documentales:

1. `pilot_decision_input_set::<package_id>` — conjunto de entradas vigentes que deben evaluarse en el checkpoint;
2. `pilot_decision_rule_binding::<package_id>` — vínculo entre cada condición observable y su fuente propietaria, severidad, autoridad, tratamiento y evidencia;
3. `pilot_decision_evaluation::<package_id>` — evaluación reproducible que resuelve `CONTINUAR`, `PAUSAR` o `REVERTIR` cuando la instancia es evaluable;
4. `pilot_decision_manifest::<package_id>` — expediente consolidado de identidad, checkpoint, reglas aplicadas, evidencia, decisión, autoridad, bloqueos y handoff posterior.

Estas piezas diseñan la decisión futura. No afirman que un piloto haya sido ejecutado ni que una disposición haya ocurrido.

---

#### 3. Entradas obligatorias

006 consume, sin redefinirlas:

- `CUTOVER-OPS-001`: candidato, ambiente, alcance, ventana y responsables vigentes;
- `CUTOVER-OPS-002`: unidades, olas, dependencias y `continuation_gate_ref`;
- `CUTOVER-OPS-003`: convivencia, autoridad entre proceso anterior y objetivo, trabajo en curso y recovery;
- `CUTOVER-OPS-004`: operaciones, efectos, identidad estable, controles anti-duplicidad, resultados inciertos y evidencia;
- `CUTOVER-OPS-005`: superficies de conciliación, fuente autoritativa, contraparte, correlación, reglas y resultados;
- `READY-GATE-010`: soporte, responsables y escalamiento;
- `READY-GATE-011`: monitoreo, métricas, alertas y fuentes observables;
- `READY-GATE-012`: respaldo, restore, rollback y recuperación probados;
- `READY-GATE-013`: línea base previa al piloto;
- `READY-GATE-014`: riesgos aceptados y condiciones de suspensión;
- `READY-GATE-015`: decisión vigente de entrada al piloto;
- `DELIV-PKG-013`: umbrales y guardrails NFR aplicables;
- `DELIV-PKG-016`: requisitos y evidencia de prueba aplicables;
- `DELIV-PKG-017`: observabilidad, severidad, alertas, auditoría y propietarios;
- `DELIV-PKG-018`: default seguro, targeting, autoridad de activación/suspensión/desactivación y kill switch;
- `DELIV-PKG-019`: etapas, cohortes, pausas, promoción y gates de expansión;
- `DELIV-PKG-020`: disparadores, autoridad, objetivo seguro, procedimiento y conciliación de rollback/recovery;
- `DELIV-PKG-022`: modalidad, cohorte, alcance, duración y salvaguardas del piloto;
- `DELIV-PKG-023`: criterios de aceptación y evidencia que serán relevantes para el cierre, sin anticipar la salida del piloto.

Una entrada no vigente, contradictoria o correspondiente a otra revisión no se sustituye por una estimación local.

---

#### 4. Unidad mínima de decisión

La unidad mínima de `pilot_decision_evaluation` es:

```text
package_id
+
candidate_ref
+
environment
+
authorized_scope_ref
+
cutover_window_ref
+
activation_unit_ref
+
wave_ref
+
checkpoint_ref
```

Cuando una modalidad no tenga unidad u ola independiente, la decisión conserva la referencia de la raíz o consumidor que gobierna su exposición.

Dos evaluaciones con candidato, ambiente, alcance, unidad, ola o checkpoint distintos son decisiones diferentes y no pueden mezclarse para obtener un resultado agregado.

---

#### 5. Dos capas que no pueden confundirse

006 separa obligatoriamente:

| Capa                        | Valores                                                                       | Semántica                                                                          |
| --------------------------- | ----------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| `decision_evaluation_state` | `EVALUABLE`, `BLOQUEADA`, `INVALIDADA`, `NO_APLICA_DIRECTA`, `FUERA_DE_LINEA` | indica si existe base suficiente y vigente para emitir una disposición             |
| `operational_decision`      | `CONTINUAR`, `PAUSAR`, `REVERTIR`                                             | disposición que puede emitir la autoridad aplicable cuando la evaluación es válida |

Una evaluación `BLOQUEADA` o `INVALIDADA` no se convierte en `CONTINUAR`.

Si ya existe exposición activa y la evaluación queda `BLOQUEADA` o `INVALIDADA`, la disposición fail-closed es detener nueva expansión mediante `PAUSAR`, salvo que una regla propietaria de `DELIV-PKG-020` exija `REVERTIR`.

Para una raíz que nunca entró en exposición por bloqueo AURA, EXT o fuera de línea TALENTO, no se fabrica una pausa operativa inexistente.

---

#### 6. Principio de precedencia

La decisión sigue esta precedencia:

```text
IDENTIDAD Y VIGENCIA
→ DISPARADORES DE ROLLBACK/RECOVERY
→ CONDICIONES DE SUSPENSIÓN Y BLOQUEO
→ GATES DE CONTINUACIÓN/PROMOCIÓN
→ DECISIÓN EXPLÍCITA DE AUTORIDAD
```

Reglas:

1. una identidad inválida impide continuar;
2. un disparador aplicable de `DELIV-PKG-020` no se degrada a advertencia;
3. una condición que exige suspensión impide expansión mientras permanezca activa;
4. solo en ausencia de condiciones de reversión o pausa se evalúa continuidad;
5. la decisión no se obtiene por votación ni por mayoría de señales;
6. una señal de menor severidad no cancela una condición bloqueante;
7. la ausencia de observación no equivale a evidencia positiva.

---

#### 7. Criterio de `CONTINUAR`

`CONTINUAR` solo puede emitirse cuando todas las condiciones obligatorias aplicables al checkpoint sean verdaderas:

1. `package_id`, candidato, ambiente, alcance, ventana, unidad y ola corresponden a la misma instancia autorizada;
2. la autorización de entrada heredada de `READY-GATE-015` permanece vigente;
3. ningún cambio material invalidó los contratos de cutover aplicables;
4. los riesgos aceptados siguen dentro de alcance, vigencia y controles de `READY-GATE-014`;
5. ninguna condición de suspensión vigente está materializada;
6. las fuentes críticas de observabilidad requeridas por `READY-GATE-011` y `DELIV-PKG-017` están disponibles;
7. soporte, escalamiento y responsables requeridos permanecen disponibles cuando el checkpoint los necesita;
8. el control anti-duplicidad aplicable de `CUTOVER-OPS-004` no está bloqueado;
9. toda conciliación exigible para el checkpoint está `CONCILIADA` o, cuando el contrato lo permita expresamente, `DIFERENCIA_ESPERADA` dentro de su condición de convergencia;
10. no existe `DIFERENCIA_NO_RESUELTA`, `RESULTADO_INCIERTO` o `DUPLICIDAD_CONFIRMADA` pendiente que afecte la seguridad de la expansión;
11. no existe violación de seguridad, autorización, privacidad o integridad con tolerancia contractual cero;
12. no existe `OBS-P0`, `OBS-P1`, gap P0/P1, incompatibilidad crítica o bloqueo equivalente aplicable sin resolución;
13. los umbrales y guardrails NFR aplicables permanecen satisfechos;
14. el candidato conserva capacidad de retorno al default seguro y recovery conforme a sus contratos vigentes;
15. si el checkpoint implica ampliar exposición, se cumplen además todos los gates de promoción de `DELIV-PKG-019`;
16. la evidencia requerida es actual, atribuible y suficiente para la misma revisión;
17. la autoridad aplicable emite la decisión de forma explícita.

No existe continuidad automática por tiempo transcurrido, ausencia aparente de incidentes, baja utilización, silencio de alertas, finalización de una ventana o finalización de una ola.

---

#### 8. Degradaciones controladas

Una condición `OBS-P2` o `OBS-P3` no obliga por sí sola a pausar cuando el contrato NFR aplicable permite operación degradada controlada.

`CONTINUAR` en ese caso exige:

- que la degradación esté dentro de la condición permitida por su fuente;
- que no exista una condición de suspensión relacionada;
- que el riesgo y su vigencia permanezcan gobernados;
- que la observabilidad permita detectar empeoramiento;
- que exista responsable y tratamiento;
- que la decisión quede atribuida.

006 no redefine qué degradaciones son tolerables.

---

#### 9. Criterio de `PAUSAR`

`PAUSAR` significa detener toda nueva expansión, promoción, incorporación de unidad, actor, sede, dispositivo, tráfico o alcance mientras se conserva el estado seguro permitido por las fuentes propietarias.

Debe emitirse cuando no exista todavía una obligación confirmada de reversión y ocurra al menos una condición aplicable como:

1. `READY-GATE-014` materializa una condición de suspensión;
2. se pierde una fuente crítica necesaria para evaluar seguridad, integridad o continuidad;
3. una entrada obligatoria queda desactualizada, bloqueada o contradictoria;
4. un checkpoint no dispone de evidencia suficiente;
5. existe `DIFERENCIA_NO_RESUELTA`;
6. existe `RESULTADO_INCIERTO`;
7. existe `DUPLICIDAD_CONFIRMADA` mientras su disposición de recovery no haya sido determinada;
8. una conciliación obligatoria está bloqueada;
9. un control anti-duplicidad requerido está bloqueado o no puede demostrarse efectivo;
10. existe `OBS-P0`, `OBS-P1`, gap P0/P1 o incompatibilidad crítica que bloquea expansión;
11. existe una violación de tolerancia cero cuya disposición de rollback aún debe resolver la autoridad propietaria;
12. se detecta un cambio material de candidato, ambiente, alcance, cohorte, autorización, datos, contrato o configuración;
13. la autoridad requerida no está disponible o su identidad no puede resolverse;
14. el soporte o escalamiento obligatorio para el periodo deja de estar disponible;
15. la capacidad de recovery requerida deja de poder demostrarse vigente;
16. aparece un defecto que impide satisfacer el gate de continuación;
17. una condición de rollback se encuentra bajo evaluación y continuar aumentaría exposición antes de resolverla.

`PAUSAR` es fail-closed frente a evidencia insuficiente. No equivale a rollback ni a aceptación de la situación observada.

---

#### 10. Efectos de `PAUSAR`

Una pausa futura deberá producir documentalmente estos efectos:

1. congelar la cohorte y el alcance;
2. impedir la siguiente ola o promoción;
3. mantener la autoridad y fronteras de escritura vigentes;
4. preservar operaciones y efectos ya confirmados;
5. impedir retries ciegos sobre resultados inciertos;
6. conservar evidencia y correlación;
7. activar únicamente la contención o default seguro que la fuente propietaria autorice;
8. detener el cómputo de días activos del piloto cuando la pausa sea de seguridad bajo `DELIV-PKG-022`;
9. entregar la condición observada al propietario correspondiente;
10. exigir nueva evaluación antes de reanudar.

Una pausa no reinicia por sí sola la duración del piloto. Un cambio material de candidato, contrato, datos, autorización o cohorte sí obliga a una nueva ventana para el alcance cambiado conforme a `DELIV-PKG-022`.

---

#### 11. Reanudación después de una pausa

Eliminar la causa inmediata de una pausa no produce `CONTINUAR` automáticamente.

Para reanudar deberán demostrarse nuevamente:

- identidad y alcance vigentes;
- cierre o disposición válida de la condición que originó la pausa;
- restauración de señales y evidencia obligatorias;
- vigencia de riesgos aceptados y condiciones de suspensión;
- estado de conciliación requerido;
- capacidad de recovery aplicable;
- ausencia de disparador que exija reversión;
- autoridad explícita para continuar.

La reevaluación podrá limitarse a las fuentes afectadas únicamente cuando pueda demostrarse que las demás conservaron vigencia.

---

#### 12. Criterio de `REVERTIR`

`REVERTIR` significa activar el camino de rollback/recovery ya definido por `DELIV-PKG-020` para retirar o neutralizar de forma gobernada la exposición del candidato en el alcance afectado.

Solo puede emitirse cuando:

1. existe un disparador de `DELIV-PKG-020` aplicable y demostrado;
2. el disparador corresponde al mismo paquete, candidato, ambiente y alcance;
3. la fuente propietaria determina que mantener la exposición no es la disposición segura;
4. existe autoridad vigente para decidir el rollback/recovery aplicable;
5. el objetivo seguro o estado de recuperación está identificado;
6. el procedimiento aplicable es el vigente para esa revisión;
7. se conocen las fronteras entre contención, rollback técnico, rollback funcional, restore, compensation, correction y reconciliation;
8. la decisión conserva evidencia suficiente para iniciar la ejecución sin inventar pasos.

006 no ejecuta ninguno de esos mecanismos.

---

#### 13. Disparadores de reversión heredados

La evaluación deberá vincular, según aplicabilidad, los disparadores ya definidos en `DELIV-PKG-020`, entre ellos:

- violación de seguridad, autorización o integridad con tolerancia contractual cero;
- `OBS-P0`, `OBS-P1` o gap P0/P1 cuya contención requiera retirar el candidato;
- incumplimiento de un umbral NFR aprobado;
- incompatibilidad de contrato, runtime, dispositivo, migración, esquema o consumidor;
- drift de release, configuración, migración, RLS/grants, tipos o procedencia que invalide el candidato;
- conciliación fallida, duplicado material, estado empresarial incoherente o efecto externo desconocido que no pueda mantenerse expuesto con seguridad;
- pérdida o corrupción de datos;
- imposibilidad de demostrar un punto consistente recuperable;
- incapacidad de demostrar artefacto, versión o configuración efectiva;
- incumplimiento de objetivos de recuperación aprobados ante una interrupción real.

La presencia de una señal abre la evaluación conforme al contrato propietario; 006 no convierte una señal genérica en rollback automático si `DELIV-PKG-020` exige una clasificación adicional.

---

#### 14. Cuando existe disparador pero la reversión no es ejecutable

Si existe una condición que requiere evaluar reversión pero falta evidencia, autoridad, objetivo seguro o procedimiento ejecutable:

1. `CONTINUAR` queda prohibido;
2. la expansión se mantiene `PAUSAR`;
3. se conserva la condición como bloqueo crítico;
4. no se improvisa un rollback;
5. se activa el escalamiento ya aprobado;
6. la resolución operativa se entrega al propietario de `DELIV-PKG-020`;
7. el hecho y la decisión deberán quedar registrados por `CUTOVER-OPS-007` durante la ejecución real.

La incapacidad de ejecutar una reversión segura no transforma el riesgo en aceptable.

---

#### 15. Kill switch, contención y reversión

El kill switch de `DELIV-PKG-018` no equivale a rollback completo.

006 conserva estas fronteras:

| Mecanismo                  | Decisión relacionada                                                       | Límite                                                                                              |
| -------------------------- | -------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| congelar cohorte           | `PAUSAR`                                                                   | impide expansión; no altera efectos ya confirmados                                                  |
| kill switch/default seguro | `PAUSAR` o parte de una disposición de recovery cuando la fuente lo ordene | detiene exposición nueva; no deshace datos ni efectos externos                                      |
| rollback técnico           | `REVERTIR`                                                                 | vuelve código, release, configuración, routing o contrato compatible; no restaura datos por sí solo |
| rollback funcional         | `REVERTIR`                                                                 | retira comportamiento nuevo; conserva historia de hechos confirmados                                |
| restore                    | `REVERTIR` cuando `DELIV-PKG-020` lo determine                             | exige aislamiento, compatibilidad, validación y reconciliación                                      |
| compensation/correction    | tratamiento posterior gobernado                                            | no borra el hecho original y exige resultado conocido y autoridad                                   |
| reconciliation             | soporte de decisión y cierre                                               | no es por sí sola una reversión                                                                     |

006 no transforma una pausa en borrado, compensación o restore.

---

#### 16. Tratamiento de resultados de conciliación

Los resultados de `CUTOVER-OPS-005` se consumen así:

| Resultado 005            | Tratamiento mínimo en 006                                                                          |
| ------------------------ | -------------------------------------------------------------------------------------------------- |
| `CONCILIADA`             | puede satisfacer la condición de conciliación aplicable                                            |
| `DIFERENCIA_ESPERADA`    | puede permitir continuidad únicamente dentro del contrato explícito y su condición de convergencia |
| `DIFERENCIA_NO_RESUELTA` | `PAUSAR`; `REVERTIR` si además satisface un disparador de 020                                      |
| `RESULTADO_INCIERTO`     | `PAUSAR`; no retry ciego; `REVERTIR` solo si 020 resuelve esa disposición                          |
| `DUPLICIDAD_CONFIRMADA`  | `PAUSAR`; nunca se normaliza; `REVERTIR` si la condición de 020 lo exige                           |
| `BLOQUEADA`              | `PAUSAR` durante exposición activa; sin continuidad                                                |
| `INVALIDADA`             | evaluación de 006 `INVALIDADA`; durante exposición activa se detiene expansión hasta revalidar     |
| `NO_APLICA`              | no crea un gate artificial de conciliación                                                         |

Una conciliación positiva no cancela una alerta, un riesgo, un defecto o un disparador de recovery independiente.

---

#### 17. Defectos detectados durante la ejecución

Cuando la ejecución real detecte un defecto:

1. se clasifica contra el gate y severidad propietarios;
2. la decisión de 006 no puede ignorarlo por falta de volumen;
3. si bloquea el checkpoint, se emite `PAUSAR` o `REVERTIR` conforme al contrato aplicable;
4. `CUTOVER-OPS-007` conservará el incidente y la decisión;
5. deberá materializarse una tarea de corrección exacta y un requisito de regresión antes de continuar o cerrar cuando el defecto lo exija;
6. 006 no inventa anticipadamente el identificador de esa tarea ni del requisito porque todavía no existe un defecto real observado.

La corrección no se considera cerrada hasta que su fuente propietaria produzca la evidencia exigida.

---

#### 18. Checkpoints obligatorios

`pilot_decision_evaluation` se ejecutará documentalmente en los puntos aplicables ya definidos por la secuencia:

1. antes de iniciar la primera unidad u ola;
2. antes de cada ola posterior;
3. después de la verificación inmediata que la ola exija;
4. cuando una señal materialice una condición de suspensión;
5. cuando aparezca un resultado incierto, diferencia no resuelta o duplicidad;
6. cuando se active una evaluación de rollback/recovery;
7. después de resolver una pausa y antes de reanudar;
8. antes de cualquier expansión o promoción gobernada por `DELIV-PKG-019`;
9. cuando un cambio material invalide las entradas anteriores.

No se define una frecuencia universal por minutos u horas.

---

#### 19. Matriz determinista de decisión

La evaluación sigue esta matriz:

| Condición agregada                                                                                           | Decisión                                                                                |
| ------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------- |
| trigger de 020 demostrado + disposición propietaria exige retiro + autoridad/objetivo/procedimiento vigentes | `REVERTIR`                                                                              |
| condición de suspensión o bloqueo activa, sin obligación confirmada de reversión                             | `PAUSAR`                                                                                |
| evaluación bloqueada o invalidada durante exposición activa                                                  | `PAUSAR`                                                                                |
| evidencia crítica ausente o fuente crítica no disponible                                                     | `PAUSAR`                                                                                |
| resultado incierto, diferencia no resuelta o duplicidad confirmada sin disposición de reversión cerrada      | `PAUSAR`                                                                                |
| todos los gates aplicables satisfechos + sin condición de pausa/reversión + autoridad explícita              | `CONTINUAR`                                                                             |
| raíz sin exposición directa por modalidad compartida/control                                                 | decisión derivada o de observación según la raíz gobernada; no se crea decisión directa |
| raíz bloqueada antes de exposición o fuera de línea                                                          | no se fabrica `CONTINUAR`, `PAUSAR` o `REVERTIR` ejecutados                             |

Cuando dos condiciones producen disposiciones distintas, `REVERTIR` prevalece sobre `PAUSAR` únicamente si la obligación de reversión ya está demostrada bajo `DELIV-PKG-020`. En cualquier otro conflicto no resuelto se conserva `PAUSAR` fail-closed.

---

#### 20. Autoridad de decisión

006 no crea un “comité de cutover” universal ni una autoridad nueva.

La autoridad se resuelve por operación:

- promoción o expansión: propietario `OWN-*` y responsable técnico exigidos por `DELIV-PKG-019`;
- activación, suspensión, desactivación o default seguro: autoridad definida por `DELIV-PKG-018` para el control aplicable;
- riesgo residual y condición de suspensión: autoridad ya vinculada por `READY-GATE-014`;
- rollback/recovery: autoridad funcional y técnica definida por `DELIV-PKG-020`;
- soporte y escalamiento: responsables confirmados por `READY-GATE-010`;
- decisión frente a señal operativa: propietario/routing definido por `DELIV-PKG-017`.

Si la segregación exige más de una autoridad, ninguna aprobación parcial se convierte en decisión válida.

Disponibilidad nominal no equivale a autoridad.

---

#### 21. Evidencia mínima de una decisión

Toda decisión futura deberá permitir reconstruir:

1. `package_id`;
2. candidato y revisión;
3. ambiente;
4. alcance autorizado;
5. ventana;
6. unidad y ola;
7. checkpoint;
8. estado de evaluación;
9. conjunto de entradas evaluadas;
10. reglas y versiones aplicadas;
11. señales relevantes;
12. riesgos y condiciones de suspensión aplicables;
13. resultados de conciliación aplicables;
14. controles anti-duplicidad aplicables;
15. disparadores de rollback evaluados;
16. gates de promoción evaluados cuando corresponda;
17. decisión emitida;
18. autoridad o autoridades;
19. momento efectivo;
20. justificación basada en evidencia;
21. referencias de evidencia;
22. bloqueos y condición de salida cuando existan.

Una captura aislada, una afirmación manual o el simple estado “verde” de un componente no sustituye el expediente.

---

#### 22. Duración del piloto y pausas

006 conserva `DUR-DIR-001` de `DELIV-PKG-022`:

- piloto directo: 14 días calendario activos y al menos un ciclo operativo completo;
- un día pausado por seguridad no cuenta como día activo;
- si el ciclo aplicable supera 14 días, se completa el primer ciclo íntegro iniciado bajo piloto;
- reinicios técnicos sin cambio de cohorte ni candidato no reinician el reloj;
- cambios materiales de candidato, contrato, datos, autorización o cohorte obligan a una nueva ventana para el alcance cambiado;
- completar la duración no equivale a aceptación ni promoción.

006 no usa la duración como autorización automática para `CONTINUAR`.

---

#### 23. Cohorte durante pausa o reversión

Cuando se active `PAUSAR` o `REVERTIR`:

- la cohorte queda congelada;
- no se agregan actores;
- no se agregan sedes;
- no se agregan dispositivos;
- no se agrega tráfico para compensar tiempo perdido;
- no se amplían datos ni permisos;
- los efectos reales ya confirmados se preservan;
- cualquier recuperación o conciliación se rige por `DELIV-PKG-020`.

La decisión no puede ampliar el alcance autorizado de `DELIV-PKG-022`.

---

#### 24. Aplicabilidad al universo heredado

006 conserva las 207 raíces y su modalidad de `DELIV-PKG-022`:

| Modalidad                     | Cantidad | Tratamiento 006                                                                                |
| ----------------------------- | -------: | ---------------------------------------------------------------------------------------------- |
| `PILOT-DIRECT-001`            |  **160** | evaluación directa por unidad/ola/checkpoint cuando la raíz haya entrado válidamente en piloto |
| `PILOT-SHARED-001`            |    **3** | decisión derivada de consumidores directos; no se crea exposición o checkpoint independiente   |
| `PILOT-CONTROL-001`           |   **26** | observa los pilotos gobernados y aporta señales/gates; no se fabrica una mutación propia       |
| AURA bloqueada                |   **14** | `BLOQUEADA`; sin decisión operativa ejecutada mientras persista el gate                        |
| dependencia externa bloqueada |    **2** | `BLOQUEADA`; sin decisión operativa ejecutada mientras persista `EXT-GOV-001`                  |
| TALENTO fuera de línea actual |    **2** | `FUERA_DE_LINEA`; sin decisión operativa en esta línea                                         |

Reconciliación:

```text
160 + 3 + 26 + 14 + 2 + 2 = 207
```

Las tres raíces compartidas siguen siendo `GAP-PKG-033`, `GAP-PKG-034` y `GAP-PKG-045`, conforme a `DELIV-PKG-022`.

La clasificación exacta de cada raíz se hereda de la matriz homónima de `DELIV-PKG-022`; 006 no crea una segunda clasificación ni reasigna identidades.

---

#### 25. Reglas para modalidades compartidas y de control

##### 25.1. `PILOT-SHARED-001`

- no posee reloj de piloto independiente;
- no recibe una ola artificial;
- se observa a través de consumidores directos compatibles;
- una condición propia del contrato compartido puede bloquear los consumidores afectados cuando su fuente así lo determine;
- la reanudación exige verificar nuevamente el contrato compartido y las raíces consumidoras afectadas.

##### 25.2. `PILOT-CONTROL-001`

- no posee exposición empresarial independiente por el solo hecho de observar;
- sus señales y gates pueden alimentar la decisión de las raíces gobernadas;
- no recibe rollback de deploy ficticio cuando no existe cambio físico propio;
- una condición bloqueante del control se aplica únicamente al alcance que su contrato gobierna;
- no adquiere autoridad sobre las raíces observadas por ser un control.

---

#### 26. AURA, EXT y TALENTO

##### 26.1. AURA

Las 14 raíces AURA permanecen bloqueadas. 006 no emite una decisión de continuación, pausa o reversión de una exposición que no está autorizada.

##### 26.2. EXT

Las 2 raíces condicionadas por `EXT-GOV-001` permanecen bloqueadas hasta cumplir su gate. No se inventan proveedor, credencial, callback, señal, rollback ni decisión operativa.

##### 26.3. TALENTO

Las 2 raíces TALENTO permanecen fuera de la línea actual. 006 conserva el contrato futuro sin simular piloto o recovery productivo.

---

#### 27. Cambios materiales e invalidación

`pilot_decision_manifest::<package_id>` queda `INVALIDADA` cuando cambia materialmente:

- candidato;
- commit, artefacto o release que define la revisión;
- ambiente;
- alcance;
- ventana;
- unidad u ola;
- cohorte;
- autoridad;
- contrato de convivencia;
- control anti-duplicidad;
- fuente o regla de conciliación;
- feature flag/configuración gobernada;
- señal o contrato de observabilidad;
- umbral/guardrail NFR;
- estrategia de rollout;
- disparador, objetivo o procedimiento de rollback/recovery;
- requisito de prueba aplicable.

La invalidación obliga a reevaluar con fuentes vigentes. No se reescribe una decisión histórica para aparentar que correspondía a otra revisión.

---

#### 28. Condiciones de bloqueo documental

La evaluación queda `BLOQUEADA` cuando:

1. falta una entrada obligatoria;
2. dos fuentes vigentes se contradicen sobre autoridad, alcance o tratamiento;
3. no puede demostrarse identidad del candidato;
4. no puede demostrarse el ambiente;
5. no puede demostrarse el alcance;
6. falta una señal crítica requerida;
7. falta una regla necesaria para clasificar una condición;
8. existe un disparador potencial de rollback sin evidencia suficiente para resolver su disposición;
9. la autoridad requerida no está identificada o disponible;
10. el objetivo seguro o procedimiento de recovery requerido no está materializado;
11. la conciliación necesaria está bloqueada;
12. continuar exigiría inventar un umbral, tolerancia, permiso, alcance o excepción.

Todo bloqueo conserva causa, insumo faltante, propietario canónico, fuente o tarea responsable y condición verificable de salida.

---

#### 29. Relación con `CUTOVER-OPS-007`

006 define qué información debe producir una evaluación, pero no diseña el registro operativo de incidentes y decisiones.

Durante la ejecución real, 007 será propietario del registro de:

- incidentes;
- decisiones de continuar, pausar o revertir;
- cambios de alcance;
- actores y timestamps;
- razones;
- evidencia;
- relación con acciones de corrección, recovery o regresión.

006 entrega a 007 la semántica de la decisión; 007 define su registro trazable.

---

#### 30. Frontera con `CUTOVER-OPS-008..010`

006 no anticipa:

- `CUTOVER-OPS-008`: definición de métricas de tiempos, errores, adopción y resultado empresarial;
- `CUTOVER-OPS-009`: autoridad y criterio para aprobar salida del piloto o exigir correcciones;
- `CUTOVER-OPS-010`: condiciones y evidencia para retirar el proceso anterior.

En particular:

- `CONTINUAR` dentro del piloto no equivale a aprobar salida;
- completar 14 días activos no equivale a aprobar salida;
- una decisión de `REVERTIR` no define por sí sola el retiro futuro del proceso objetivo o del anterior;
- las métricas que 008 formalice no pueden aplicarse retroactivamente como umbrales inventados por 006.

---

#### 31. Handoff operativo

006 entrega a la ejecución futura y a 007:

```text
IDENTIDAD VIGENTE
+
CHECKPOINT
+
ENTRADAS Y REGLAS APLICABLES
+
SEÑALES Y RIESGOS
+
CONCILIACIONES Y CONTROLES
+
DISPARADORES DE ROLLBACK
+
GATES DE PROMOCIÓN
+
AUTORIDAD
+
DECISIÓN CONTINUAR / PAUSAR / REVERTIR
+
EVIDENCIA Y BLOQUEOS
=
DECISIÓN OPERATIVA TRAZABLE
```

`SHELL-CI-022::<package_id>` ejecutará el checklist y las acciones que correspondan. 006 no produce evidencia operativa anticipada.

---

#### 32. Separación entre planificación y ejecución

006 es exclusivamente documental.

No ejecuta:

- activación o desactivación real;
- promoción de cohortes;
- expansión de tráfico;
- pausa física;
- kill switch;
- rollback técnico o funcional;
- restore;
- recovery;
- compensación;
- corrección de datos;
- retry;
- conciliación;
- despliegues;
- migraciones;
- DDL/DML;
- backfills;
- cambios de RLS/grants;
- cambios de configuración remota;
- operaciones sobre Supabase.

Toda modificación futura de Supabase VENTO continúa perteneciendo a `vento-shell`.

---

#### 33. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0  
**Requisitos modificados:** 0  
**Fragmentos 04A afectados:** 0

**Justificación:** 006 no introduce un nuevo comportamiento empresarial, umbral, severidad, métrica, algoritmo de recovery, mecanismo de rollback, estado de dominio, autorización ni tolerancia. Materializa la precedencia y el binding operativo entre condiciones ya definidas por readiness, NFR, observabilidad, rollout, rollback, controles anti-duplicidad y conciliación. Las obligaciones de rollback independiente, evidencia reproducible, idempotencia, resultado recuperable, conciliación y control de fuentes competidoras ya están protegidas por requisitos vigentes y vinculadas por `DELIV-PKG-016`. Si una decisión necesitara un criterio no existente en esas fuentes, la evaluación queda bloqueada en vez de crear una regla por inferencia.

---

#### 34. Criterios de aceptación documental

`CUTOVER-OPS-006` queda documentalmente completo cuando:

1. conserva `CUTOVER-OPS-005 → CUTOVER-OPS-006 → CUTOVER-OPS-007`;
2. materializa `pilot_decision_input_set`, `pilot_decision_rule_binding`, `pilot_decision_evaluation` y `pilot_decision_manifest`;
3. separa estado de evaluación de disposición operativa;
4. limita las disposiciones operativas a `CONTINUAR`, `PAUSAR` y `REVERTIR`;
5. define precedencia determinista entre reversión, pausa y continuidad;
6. `CONTINUAR` exige evidencia positiva y decisión explícita;
7. no existe continuidad automática por tiempo, silencio o ausencia aparente de incidentes;
8. `PAUSAR` congela expansión sin fingir rollback;
9. la pausa de seguridad no cuenta como día activo del piloto;
10. la reanudación después de pausa exige nueva evaluación;
11. `REVERTIR` consume únicamente disparadores y procedimientos vigentes de `DELIV-PKG-020`;
12. un disparador potencial sin recovery ejecutable prohíbe continuar y mantiene pausa/escalamiento;
13. kill switch, rollback técnico, rollback funcional, restore, compensation y reconciliation permanecen separados;
14. `DIFERENCIA_NO_RESUELTA`, `RESULTADO_INCIERTO` y `DUPLICIDAD_CONFIRMADA` no autorizan continuidad;
15. `DIFERENCIA_ESPERADA` solo puede permitir continuidad dentro de su contrato explícito;
16. `OBS-P0/P1`, gaps P0/P1 y tolerancias cero bloquean expansión conforme a sus fuentes;
17. `OBS-P2/P3` solo permiten continuidad si el contrato vigente permite degradación controlada;
18. riesgos aceptados no justifican continuidad después de materializarse una condición de suspensión;
19. pérdida de una fuente crítica no se interpreta como normalidad;
20. la autoridad se hereda de 018, 019, 020, readiness y 017 sin crear roles nuevos;
21. no se mezclan decisiones de paquetes, candidatos, ambientes, alcances, unidades, olas o checkpoints distintos;
22. la cohorte queda congelada durante pausa o reversión;
23. las 207 raíces conservan exactamente `160 + 3 + 26 + 14 + 2 + 2`;
24. las 3 raíces shared conservan `GAP-PKG-033`, `GAP-PKG-034` y `GAP-PKG-045`;
25. AURA, EXT y TALENTO conservan sus gates;
26. un cambio material invalida la evaluación anterior;
27. todo bloqueo conserva causa, propietario y condición de salida;
28. los defectos reales futuros se entregan a 007 y a una corrección/regresión exacta antes de continuar o cerrar cuando corresponda;
29. 007 recibe la semántica de decisión sin que 006 diseñe su registro;
30. 008 conserva propiedad de las métricas;
31. 009 conserva propiedad de la salida del piloto;
32. 010 conserva propiedad del retiro del proceso anterior;
33. la ejecución real permanece en `SHELL-CI-022::<package_id>`;
34. no se ejecutan código, despliegues, configuración remota, rollback, restore, conciliación, migraciones, DDL/DML, backfills, cambios de datos ni operaciones de Supabase;
35. se crean cero requisitos de prueba, se modifican cero requisitos de prueba y se afectan cero fragmentos 04A.

---

#### 35. Continuidad

##### ÚLTIMA TAREA APROBADA
CUTOVER-OPS-005 — Definir conciliaciones durante el piloto

##### TAREA ACTUAL APROBADA
CUTOVER-OPS-006 — Definir criterio de pausa, reversión o continuación

##### SIGUIENTE TAREA RESERVADA
CUTOVER-OPS-007 — Diseñar el registro de incidentes, decisiones y cambios de alcance


### [ ] CUTOVER-OPS-007 — Diseñar el registro de incidentes, decisiones y cambios de alcance
### [ ] CUTOVER-OPS-008 — Definir métricas de tiempos, errores, adopción y resultado empresarial
### [ ] CUTOVER-OPS-009 — Definir autoridad y criterio para aprobar salida del piloto o exigir correcciones
### [ ] CUTOVER-OPS-010 — Definir condiciones y evidencia para retirar el proceso anterior

La ejecución real conservará paquete, versión, ambiente, ventana, actor,
decisión y evidencia mediante `SHELL-CI-022`. Los defectos encontrados deberán
generar una tarea de corrección exacta y un requisito de regresión antes de
continuar o cerrar.
