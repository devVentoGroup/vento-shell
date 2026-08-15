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
