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
