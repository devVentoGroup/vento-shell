### MINI-BLOQUE — EXPERIENCIA DE CONTINGENCIA Y MANDO

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **experiencia de contingencia y mando** dentro de **AC CONTINUIDAD OPERATIVA Y RECUPERACION**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `CONT-UX-001` a `CONT-UX-007` — 7 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Diseñar inicio ejecutivo de continuidad con estado, impacto, prioridades, responsables y decisiones” y concluye con “Diseñar ejercicios, revisión posterior, acciones y comprobación de readiness”.
<!-- PLAN-SECTION-META:END -->

<!-- EXECUTION-GATE-RECONCILIATION:B401-600:CONT-UX -->
### Reconciliación topológica de CONT-UX-001 a CONT-UX-007

Estas tareas son contratos y diseños canónicos de experiencia de contingencia, mando, runbooks, reincorporación, comunicaciones y ejercicios. No poseen una instancia física independiente.

| Propiedad | Valor |
| --- | --- |
| modalidad | `DEFINE_ONCE` |
| gate temporal | `NO_PHYSICAL_INSTANCE` |
| identidad | `<task_id>` |

La implementación física posterior pertenece a los `package_id`, repositorios, aplicaciones, servicios, infraestructura y tareas propietarias que materialicen el alcance aprobado. El contrato de esta familia se reutiliza como entrada y criterio de aceptación; no se duplica mediante una instancia `<task_id>::<implementation_unit_id>`.

Esta reconciliación no autoriza cambios físicos ni modifica las decisiones sustantivas ya aprobadas.

### ✅ CONT-UX-001 — Diseñar inicio ejecutivo de continuidad con estado, impacto, prioridades, responsables y decisiones

**Estado:** APROBADA
**Tarea anterior:** `CONT-AUTH-004 — Separar ejecución, validación, reincorporación, conciliación, cierre y revisión posterior` — APROBADA
**Tarea siguiente:** `CONT-UX-002 — Diseñar centro de mando del incidente con línea de tiempo, servicios afectados y recuperación` — RESERVADA
**Tipo de tarea:** documental; diseño canónico de experiencia ejecutiva para observar y gobernar continuidad mediante estado, impacto, urgencia, prioridades de recuperación, responsables efectivos, autoridad, decisiones y bloqueos sin convertir la interfaz en fuente de verdad ni en mecanismo implícito de autorización
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/AC_CONTINUIDAD_OPERATIVA_Y_RECUPERACION/03_EXPERIENCIA_DE_CONTINGENCIA_Y_MANDO.md`
**Fase:** exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`
**Implementación técnica u operativa:** no autorizada
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, pantallas reales, rutas, componentes, tablas, RLS, RPC, funciones, Edge Functions, migraciones, datos, permisos, grants, sesiones, secretos, respaldos, incidentes, notificaciones, proveedores, infraestructura ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Diseñar el inicio ejecutivo de continuidad como una superficie de supervisión y decisión capaz de responder en segundos, sin navegación técnica ni lectura extensiva, a las preguntas empresariales esenciales de un incidente de continuidad:

```text
¿existe un incidente de continuidad activo?
¿en qué estado está?
¿cuál es su impacto, urgencia y severidad vigentes?
¿qué resultados, procesos, servicios o sedes están afectados?
¿qué prioridad de recuperación tiene cada resultado afectado y por qué?
¿qué objetivos MBCO, RTO o MTPD están protegidos, amenazados o incumplidos?
¿quién dirige efectivamente el incidente?
¿quién es responsable de cada resultado afectado?
¿qué autoridad ejecutiva debe decidir?
¿qué decisiones requieren acción ahora?
¿qué bloqueos, incertidumbres o pendientes impiden avanzar?
¿qué cambió desde la última actualización autoritativa?
```

La superficie no sustituye el expediente de `VPROC-0062`, el centro de mando detallado, los runbooks, la captura contingente, el seguimiento de restauraciones, las comunicaciones ni los ejercicios. Su función es concentrar la situación ejecutiva y dirigir a la decisión o detalle propietario correcto sin fabricar estado, prioridad, autoridad o recuperación.

---

#### 2. Resultado sustantivo

`CONT-UX-001` queda definida con las siguientes decisiones obligatorias:

1. el inicio ejecutivo es una superficie de **supervisión administrativa y decisión**, no una estación de ejecución operativa;
2. `VPROC-0062` conserva la propiedad del expediente transversal de continuidad y la interfaz proyecta sus hechos sin crear una fuente paralela;
3. la primera vista debe distinguir inequívocamente entre ausencia de incidente activo, evaluación en curso, incidente declarado, activación, recuperación, estabilización, desactivación y cierre;
4. la ausencia de un incidente activo no se mostrará como prueba de salud, readiness o disponibilidad de todos los servicios;
5. estado, impacto, urgencia, severidad y modalidad de activación se muestran como dimensiones separadas;
6. la interfaz conserva los identificadores canónicos de severidad `SEV-C1_CONTROLADA`, `SEV-C2_DEGRADADA`, `SEV-C3_MAYOR` y `SEV-C4_CRITICA` sin renombrarlos internamente ni mapearlos a otra taxonomía;
7. la severidad nunca se usa como permiso ni sustituye la autoridad efectiva;
8. la prioridad de recuperación permanece separada de severidad, urgencia, prioridad de ticket y orden visual;
9. el inicio ejecutivo muestra el resultado empresarial afectado antes que el componente técnico que falla;
10. un servicio técnico degradado solo aparece como causa, dependencia o evidencia cuando esté vinculado con un resultado empresarial relevante;
11. cada servicio o proceso afectado muestra, cuando aplique, su perfil de continuidad, MBCO, prioridad de recuperación, RTO y MTPD vigentes sin presentar esos objetivos como resultados ya alcanzados;
12. el reloj ejecutivo solo usa tiempos demostrables; ausencia de timestamp o punto de inicio suficiente produce estado no calculable, no un cronómetro inventado;
13. un pronóstico de recuperación se distingue de un objetivo y de un resultado real;
14. la interfaz no calcula ni publica una hora de recuperación como hecho confirmado cuando la fuente propietaria no la haya confirmado;
15. `RESPONSABLE_DE_CONTINUIDAD` o `CONTINUADOR_DE_CONTINUIDAD` con sustitución vigente se muestran como dirección efectiva del incidente;
16. la sustitución se hace visible sin mostrar simultáneamente dos directores efectivos para el mismo alcance y momento;
17. los propietarios de resultados afectados se muestran por función y, solo cuando esté autorizado y sea necesario, por identidad nominal;
18. `GERENCIA_GENERAL` o `GOBIERNO_Y_PROPIEDAD` se muestran como autoridad ejecutiva aplicable conforme a delegación y severidad vigentes, sin inventar una correspondencia nominal fija;
19. la pantalla diferencia responsable, ejecutor, validador, aprobador y custodio; no los fusiona por conveniencia visual;
20. la pantalla no presenta a un proveedor, automatización, dispositivo o principal técnico como autoridad empresarial;
21. la interfaz prioriza las decisiones que requieren acción humana vigente y las separa de información meramente observacional;
22. una propuesta no se muestra como aprobada y una aprobación no se muestra como ejecución completada;
23. activar, ampliar, reducir, exceptuar, desactivar, declarar recuperación total o cerrar permanecen decisiones diferentes;
24. la existencia de un botón o acción visible no constituye autorización; toda acción protegida deberá revalidarse en la capa autoritativa aplicable;
25. una acción no autorizada no se sustituye por ocultamiento silencioso: la experiencia puede ocultar acciones irrelevantes, pero cuando una decisión esperada esté bloqueada debe explicar la causa y el siguiente mecanismo válido;
26. los bloqueos ejecutivos incluyen, cuando apliquen, falta de autoridad, evidencia insuficiente, `RESULT_UNKNOWN`, `CONFLICT`, `QUARANTINED`, `RECONCILIATION_REQUIRED`, validación funcional ausente, control protector incumplido y pendiente material sin propietario;
27. los bloqueos no se transforman en advertencias decorativas; impiden representar la transición incompatible como disponible o completada;
28. `DESACTIVADO` puede mostrarse con pendientes identificados y asignados, pero nunca como equivalente de `CERRADO`;
29. recuperación técnica, validación técnica, validación funcional, recuperación total, desactivación y cierre se representan de forma separada;
30. el inicio ejecutivo muestra el último cambio autoritativo relevante con tiempo, actor o función y referencia suficiente para reconstruirlo;
31. la antigüedad o frescura de la información se hace visible cuando afecta confianza en la decisión;
32. datos faltantes, contradictorios o no verificables se presentan como incertidumbre explícita y nunca como cero, normalidad o éxito;
33. una caída de conectividad de la superficie no debe borrar el último estado conocido ni presentarlo como actual sin indicar su antigüedad;
34. la interfaz distingue hechos confirmados, pronósticos, propuestas y decisiones;
35. los datos sensibles se minimizan por función, finalidad, alcance y autorización conforme a `CONT-AUTH-003`;
36. nombres, contactos, evidencia, detalles técnicos y datos personales no compiten con la lectura ejecutiva cuando no son necesarios para decidir;
37. la experiencia usa divulgación progresiva: resumen ejecutivo primero y detalle propietario bajo expansión o navegación explícita;
38. color, icono o posición visual nunca son el único medio para comunicar severidad, bloqueo o estado;
39. el orden visual prioriza protección, decisión y tiempo empresarial antes que métricas técnicas;
40. la superficie debe funcionar con teclado, tecnologías de asistencia y zoom sin perder la jerarquía de decisión;
41. el diseño preserva una experiencia coherente en escritorio y móvil sin convertir el móvil en un tablero técnico saturado;
42. la vista no permite editar directamente datos maestros, BIA, MTPD, RTO, RPO, MBCO, permisos o delegaciones;
43. si una decisión exige cambiar un dato gobernado, la experiencia dirige al proceso propietario y conserva el incidente como contexto, sin editar la fuente desde el resumen;
44. no se crea una segunda cronología completa en esta tarea; la línea de tiempo operacional detallada pertenece a `CONT-UX-002`;
45. no se crean runbooks interactivos ni checklists de ejecución; pertenecen a `CONT-UX-003`;
46. no se diseña la captura o reincorporación detallada del trabajo contingente; pertenece a `CONT-UX-004`;
47. no se diseña el seguimiento detallado de backup, restore, failover o failback; pertenece a `CONT-UX-005`;
48. no se diseñan plantillas ni flujos detallados de comunicación; pertenecen a `CONT-UX-006`;
49. no se diseña la ejecución de ejercicios ni la revisión posterior detallada; pertenece a `CONT-UX-007`;
50. la tarea materializa un contrato consumible de información, jerarquía, estados, reglas de interacción, accesibilidad, autorización y handoff para una futura implementación sin adelantar esa implementación;
51. se generan cero cambios TREQ porque el comportamiento protegido ya está cubierto por requisitos vigentes de continuidad y experiencia.

---

#### 3. Entradas canónicas conservadas

Esta tarea consume sin redefinir:

- `VPROC-0062 — Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje` como proceso transversal propietario del expediente de continuidad;
- `CONT-DOM-001` para gobierno federado, propiedad de procesos, fuente de verdad única, recuperación funcional y prueba antes de confianza;
- `CONT-DOM-002` para servicios empresariales, criticidad y nivel mínimo aceptable;
- `CONT-DOM-003` para dependencias y prohibición de convertir una dependencia candidata en SPOF o sustituto sin evidencia;
- `CONT-DOM-004` para perfiles `CONT-OBJ-001` a `CONT-OBJ-004`, MTPD, RTO, RPO, MBCO y prioridad de recuperación;
- `CONT-DOM-005` para naturaleza, alcance, impacto, urgencia, severidad, declaración, activación, escalamiento, estados, desactivación y cierre;
- `CONT-DOM-006` para dirección, sustitución, coordinación, bitácora, decisiones y comunicación;
- `CONT-DOM-007` y `CONT-DOM-008` para operación mínima y estrategias de contingencia;
- `CONT-DOM-009` y `CONT-DOM-010` para trabajo contingente, estados inciertos, reincorporación, conciliación y pendientes;
- `CONT-DOM-011` y `CONT-DOM-012` para respaldo, recuperación, restore, failover, retorno y validación sin confundirlos con recuperación empresarial;
- `CONT-DOM-013` para dependencias externas y proveedores;
- `CONT-DOM-014` y `CONT-DOM-015` para ejercicios, readiness, revisión posterior, acciones y eficacia;
- `CONT-AUTH-001` para declaración, activación, mando, decisiones excepcionales, comunicaciones y desactivación;
- `CONT-AUTH-002` para acceso extraordinario, break-glass, failover privilegiado y revocación;
- `CONT-AUTH-003` para minimización y protección de respaldos, runbooks, contactos, evidencia, formularios y datos contingentes;
- `CONT-AUTH-004` para separación entre ejecución, validación, reincorporación, conciliación, recuperación total, cierre y revisión posterior;
- el modelo canónico de identidad, actor efectivo, contexto, permiso, recurso, denegación, decisión y auditoría;
- los principios de experiencia vigentes que separan superficie operativa, supervisión, administración, configuración, auditoría y experiencia personal;
- los requisitos de prueba vigentes de continuidad y experiencia que ya asignan a `CONT-UX-001` la visualización de impacto, prioridades, estado y gobierno del incidente.

La tarea no modifica ninguna identidad, criticidad, perfil objetivo, prioridad, umbral, autoridad, permiso, proceso, estado o propietario heredado.

---

#### 4. Decisión principal de experiencia

El inicio ejecutivo se diseña como una **vista de situación y decisión**, no como un dashboard de métricas técnicas.

Su jerarquía cognitiva obligatoria es:

```text
1. ¿QUÉ ESTÁ PASANDO?
   estado + severidad + alcance + última actualización

2. ¿QUÉ ESTÁ EN RIESGO?
   resultado empresarial + impacto + urgencia + MBCO + ventanas temporales

3. ¿QUÉ VA PRIMERO?
   prioridades de recuperación + dependencias + condición protectora

4. ¿QUIÉN RESPONDE?
   dirección efectiva + propietarios afectados + autoridad ejecutiva

5. ¿QUÉ HAY QUE DECIDIR?
   decisiones pendientes + razón + impacto + límite temporal + autoridad

6. ¿QUÉ IMPIDE AVANZAR?
   bloqueos + incertidumbre + evidencia faltante + pendientes críticos

7. ¿QUÉ CAMBIÓ?
   último cambio autoritativo + actor/función + tiempo + referencia
```

Ninguna métrica de infraestructura, log, endpoint, job, réplica, cola o proveedor puede desplazar estas siete preguntas de la primera jerarquía visual.

---

#### 5. Naturaleza y audiencia de la superficie

La superficie pertenece al carril de **supervisión administrativa/ejecutiva**.

Audiencias funcionales posibles, condicionadas por autorización:

| Función                          | Necesidad principal en el inicio ejecutivo                                      | Límite                                                           |
| -------------------------------- | ------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| `RESPONSABLE_DE_CONTINUIDAD`     | situación integral, prioridades, decisiones, bloqueos y coordinación            | no recibe autoridad ejecutiva adicional por usar la vista        |
| `CONTINUADOR_DE_CONTINUIDAD`     | misma proyección de mando durante sustitución efectiva                          | no recibe alcance fuera de la sustitución vigente                |
| `GERENCIA_GENERAL`               | impacto empresarial, prioridades, decisiones que requieren autoridad y riesgos  | no sustituye validación funcional ni técnica                     |
| `GOBIERNO_Y_PROPIEDAD`           | decisiones de máximo gobierno, riesgo material y alcance empresarial            | no se convierte en fuente técnica del incidente                  |
| `RESPONSABLE_DEL_PROCESO`        | impacto y estado de sus resultados, validaciones y decisiones propias           | no recibe detalle de otros procesos sin necesidad y autorización |
| `COORDINACION_DE_OPERACIONES`    | afectación operativa, responsables, prioridad y bloqueos del alcance coordinado | no adquiere aprobación ejecutiva por coordinar                   |
| funciones de protección          | condición protectora, impacto y decisión de su ámbito                           | no reciben acceso transversal por participar                     |
| `RESPONSABLE_TECNOLOGICO`        | dependencia técnica relevante y decisiones técnicas vinculadas al resultado     | no recibe autoridad empresarial por ser técnico                  |
| `GERENCIA_O_SUPERVISION_DE_SEDE` | situación territorial autorizada y decisiones aplicables a la sede              | no recibe visión global por el solo nombre del cargo             |

La aplicación, el dispositivo o el rol nominal no determinan por sí mismos la proyección. La autorización efectiva gobierna qué datos y acciones aparecen.

---

#### 6. Primera vista obligatoria

Sin abrir paneles secundarios, la persona autorizada deberá poder identificar:

1. identidad o referencia del incidente activo, cuando exista;
2. estado actual del ciclo;
3. severidad actual y severidad máxima alcanzada cuando sea relevante;
4. modalidad de activación vigente o decisión explícita de no activación;
5. alcance empresarial afectado;
6. impacto y urgencia vigentes;
7. resultados o servicios con mayor prioridad de recuperación;
8. estado del MBCO y ventanas temporales aplicables cuando exista evidencia suficiente;
9. dirección efectiva y sustitución vigente;
10. autoridad ejecutiva aplicable a la siguiente decisión protegida;
11. cantidad y naturaleza de decisiones que requieren acción;
12. bloqueos materiales que impiden una transición o recuperación;
13. última actualización autoritativa y su antigüedad;
14. indicador explícito de información parcial, antigua o conflictiva cuando corresponda.

La primera vista no deberá exigir leer una cronología completa, logs técnicos, mensajes de chat, tickets o documentos extensos para comprender la situación empresarial.

---

#### 7. Modelo de estado visible

La experiencia conserva exactamente los estados documentales de `CONT-DOM-005` y les asigna una presentación ejecutiva sin crear estados nuevos de negocio.

| Estado canónico                  | Lectura ejecutiva principal                                              | Acción o foco permitido de la superficie                                                   |
| -------------------------------- | ------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ |
| `DETECTADO`                      | existe una señal correlacionable todavía no clasificada como continuidad | mostrar origen, alcance conocido y acceso a evaluación; no afirmar incidente declarado     |
| `EN_TRIAGE`                      | se evalúan naturaleza, alcance, impacto y urgencia                       | mostrar información faltante, responsable de evaluación y decisión requerida               |
| `NO_DECLARADO_COMO_CONTINUIDAD`  | la evaluación no produjo una declaración de continuidad en este ciclo    | conservar referencia y razón; no mostrarlo como incidente activo                           |
| `DECLARADO`                      | existe incidente empresarial de continuidad con severidad y alcance      | destacar decisión de activación, monitoreo o escalamiento aplicable                        |
| `ACTIVADO_PARCIAL`               | existe coordinación extraordinaria en alcance acotado                    | destacar servicios/procesos cubiertos, prioridades, responsables y decisiones              |
| `ACTIVADO_AMPLIADO`              | existe coordinación multiproceso, multisede o equivalente ampliada       | elevar visibilidad de dependencias, cambios de alcance y autoridad ejecutiva               |
| `ACTIVADO_EMPRESARIAL_PROTECTOR` | existe gobierno protector transversal                                    | priorizar control protector, contención, autoridad y decisiones inmediatas                 |
| `EN_CONTENCION_Y_RECUPERACION`   | se protege MBCO, se contiene expansión y se recuperan resultados         | mostrar prioridades de recuperación, bloqueos y validaciones sin declarar éxito anticipado |
| `ESTABILIZADO`                   | expansión detenida y resultados/pendientes conocidos                     | mostrar condiciones para desactivar o regresar a recuperación si reaparece criterio        |
| `DESACTIVADO`                    | terminó el gobierno extraordinario, pero pueden persistir pendientes     | mostrar claramente pendientes, propietarios y frontera con cierre                          |
| `CERRADO`                        | criterios empresariales de cierre satisfechos y evidencia preservada     | presentar resumen histórico de solo lectura y acceso al expediente correspondiente         |

Un `SEV-C1_CONTROLADA` puede permanecer sin activación formal cuando el contrato lo permite; la experiencia no fabricará una modalidad activa para completar visualmente el ciclo.

---

#### 8. Impacto, urgencia y severidad

La interfaz trata estas dimensiones como información relacionada pero no intercambiable.

##### 8.1. Impacto

Se conservan las categorías:

- `I0_SIN_AFECTACION_DE_CONTINUIDAD`;
- `I1_DEGRADACION_CONTROLADA`;
- `I2_MBCO_COMPROMETIDO`;
- `I3_INACEPTABLE_O_IRREVERSIBLE`.

La vista mostrará el impacto vigente con una explicación breve basada en hechos: resultado afectado, control comprometido, tiempo, alcance o irreversibilidad aplicable.

##### 8.2. Urgencia

Se conservan:

- `U1_CONTROLADA`;
- `U2_PRIORITARIA`;
- `U3_INMEDIATA`.

La urgencia comunica cuánto puede esperar la decisión; no se usará como sinónimo de severidad.

##### 8.3. Severidad

Se conservan:

- `SEV-C1_CONTROLADA`;
- `SEV-C2_DEGRADADA`;
- `SEV-C3_MAYOR`;
- `SEV-C4_CRITICA`.

La severidad comunica el nivel empresarial del incidente conforme a hechos, alcance, reversibilidad, obligaciones y tiempo. No se preasigna a un servicio antes de un incidente real y no crea permisos.

---

#### 9. Modalidad de activación visible

La superficie conserva las modalidades canónicas:

- `SIN_ACTIVACION_CONTINUIDAD`;
- `ACTIVACION_PARCIAL`;
- `ACTIVACION_AMPLIADA`;
- `ACTIVACION_EMPRESARIAL_PROTECTORA`.

Reglas de presentación:

1. la modalidad siempre se muestra separada del estado del incidente;
2. una propuesta de modalidad se diferencia de la modalidad aprobada;
3. la activación nunca se representa como acceso de emergencia concedido;
4. ampliar o reducir alcance muestra el antes y el después relevantes;
5. la modalidad indica el sobre de coordinación, no un permiso técnico;
6. `SIN_ACTIVACION_CONTINUIDAD` se presenta como decisión explícita cuando exista, no como ausencia de datos.

---

#### 10. Prioridades de recuperación

La experiencia conserva las prioridades de recuperación definidas por el dominio:

- `PR-0_PROTECCION`;
- `PR-1_ESENCIAL`;
- `PR-2_CONTROL`;
- `PR-3_DIFERIBLE`.

La lista ejecutiva de prioridades deberá:

1. ordenar primero cualquier control protector cuya condición obligue a detener o contener;
2. conservar la prioridad aprobada del resultado o servicio;
3. mostrar por qué una prioridad es relevante para el incidente actual;
4. mostrar dependencias necesarias cuando sean causa de bloqueo;
5. permitir que una dependencia causalmente necesaria aparezca antes en la ejecución sin cambiar silenciosamente la prioridad BIA del resultado final;
6. no ordenar por ruido técnico, número de alertas, antigüedad del ticket o presión de un proveedor;
7. no usar severidad como sustituto de prioridad;
8. no presentar una prioridad como promesa de tiempo de recuperación;
9. mantener visible el propietario funcional del resultado priorizado;
10. indicar cuando una prioridad no puede ejecutarse por autoridad, dependencia, seguridad, evidencia o capacidad no acreditada.

---

#### 11. MBCO, RTO, MTPD y RPO en la experiencia

La primera vista puede mostrar objetivos temporales únicamente cuando sean aplicables y estén vinculados al resultado afectado.

Reglas:

- `MBCO` se expresa como resultado mínimo empresarial y no como porcentaje técnico genérico;
- `RTO` se muestra como objetivo de recuperación, no como SLA ya cumplido;
- `MTPD` se muestra como frontera de impacto tolerable, no como cronómetro de permiso para esperar;
- `RPO` se muestra cuando la edad del estado recuperable afecta la decisión, integridad o capacidad de conciliación;
- una ventana temporal sin punto de inicio demostrable se marca como no calculable;
- un objetivo vencido conserva el hecho y no reinicia el reloj por una nueva actualización;
- la falta de evidencia no se convierte en tiempo restante infinito;
- una estimación de recuperación del proveedor se etiqueta como estimación de su servicio, no como RTO empresarial ni recuperación confirmada de Vento;
- la interfaz no modifica estos objetivos.

---

#### 12. Arquitectura de información del inicio ejecutivo

La superficie se compone de siete zonas semánticas obligatorias.

##### 12.1. Zona A — Identidad y estado

Contiene:

- referencia del incidente;
- estado canónico;
- severidad vigente;
- modalidad de activación vigente;
- alcance resumido;
- última actualización autoritativa;
- indicador de frescura o incertidumbre cuando aplique.

##### 12.2. Zona B — Impacto empresarial

Contiene:

- resultado o resultados empresariales afectados;
- impacto;
- urgencia;
- sedes/procesos/servicios afectados dentro del alcance autorizado;
- MBCO relevante;
- RTO/MTPD/RPO aplicables cuando sean materialmente útiles y calculables;
- condición protectora relevante.

##### 12.3. Zona C — Prioridades

Contiene las prioridades de recuperación vigentes con:

- resultado o servicio;
- prioridad `PR-*`;
- propietario funcional;
- razón actual;
- dependencia bloqueante, cuando exista;
- estado resumido de recuperación sin sustituir la validación funcional.

##### 12.4. Zona D — Responsables y autoridad

Contiene:

- director efectivo;
- sustitución vigente;
- propietarios de procesos afectados;
- coordinación operativa aplicable;
- responsable técnico cuando sea material;
- función protectora cuando aplique;
- autoridad ejecutiva requerida para la siguiente decisión protegida.

##### 12.5. Zona E — Decisiones

Contiene únicamente decisiones materiales del alcance autorizado, separando:

- decisión solicitada o propuesta;
- razón;
- alcance;
- riesgo o efecto de esperar;
- autoridad requerida;
- vigencia o momento límite cuando exista;
- estado real de la decisión;
- acceso al soporte/evidencia mínima necesaria.

##### 12.6. Zona F — Bloqueos e incertidumbre

Contiene:

- bloqueos materiales;
- evidencia faltante;
- resultados desconocidos;
- conflictos;
- pendientes de conciliación;
- controles protectores incumplidos;
- autoridad no resoluble;
- dependencia externa crítica;
- datos antiguos o contradictorios.

##### 12.7. Zona G — Último cambio

Contiene:

- qué cambió;
- estado anterior y actual cuando aplique;
- actor o función que produjo la decisión o hecho;
- tiempo;
- referencia al expediente.

Esta zona no reemplaza la línea de tiempo detallada de `CONT-UX-002`.

---

#### 13. Composición visual semántica

La composición conceptual mínima es:

```text
[ CONTINUIDAD ]
[ ESTADO | SEVERIDAD | MODALIDAD | ALCANCE | ACTUALIZADO ]

[ IMPACTO EMPRESARIAL ]   [ URGENCIA Y VENTANAS ]

[ PRIORIDADES DE RECUPERACION ]

[ RESPONSABLES Y AUTORIDAD ]

[ DECISIONES QUE REQUIEREN ACCION ]

[ BLOQUEOS E INCERTIDUMBRE ]

[ ULTIMO CAMBIO AUTORITATIVO ]
```

El diseño físico futuro podrá adaptar columnas, tarjetas o regiones según dispositivo, pero no podrá cambiar esta jerarquía semántica ni ocultar una decisión o bloqueo material detrás de métricas secundarias.

---

#### 14. Tarjeta de situación ejecutiva

La tarjeta principal deberá presentar un resumen legible sin depender de códigos aislados.

Ejemplo semántico:

```text
Incidente: <referencia real>
Estado: En contención y recuperación
Severidad: SEV-C3_MAYOR
Activación: ACTIVACION_AMPLIADA
Alcance: <resumen autorizado>
Impacto: <hecho empresarial resumido>
Última actualización: <timestamp real y antigüedad>
```

Los valores del ejemplo representan campos, no datos productivos ni una instancia real.

Reglas:

1. el código canónico puede acompañarse de una etiqueta humana, pero nunca sustituirse internamente;
2. el resumen no afirma recuperación si falta validación funcional;
3. si existe conflicto de fuentes, la tarjeta lo hace visible antes de una conclusión tranquilizadora;
4. si no existe información suficiente, la tarjeta muestra la carencia y la fuente que debe resolverla.

---

#### 15. Resumen de impacto

Cada elemento de impacto deberá responder, cuando aplique:

- qué resultado empresarial está afectado;
- qué proceso o servicio lo soporta;
- qué sede, área, canal o alcance se encuentra afectado;
- qué nivel mínimo se necesita mantener;
- qué control protector está amenazado;
- qué dependencia material explica el bloqueo;
- qué objetivo temporal aplica;
- qué evidencia soporta la evaluación vigente.

No se mostrarán veinte métricas técnicas cuando una frase empresarial y una referencia de detalle sean suficientes.

---

#### 16. Lista ejecutiva de prioridades

Cada fila o tarjeta de prioridad deberá contener como mínimo:

| Campo              | Regla                                                                   |
| ------------------ | ----------------------------------------------------------------------- |
| resultado/servicio | identidad canónica o nombre gobernado del resultado afectado            |
| prioridad          | `PR-0_PROTECCION`, `PR-1_ESENCIAL`, `PR-2_CONTROL` o `PR-3_DIFERIBLE`   |
| MBCO               | resultado mínimo aplicable, no estado técnico                           |
| objetivo temporal  | RTO/MTPD/RPO solo si aplica y puede interpretarse correctamente         |
| propietario        | función propietaria del resultado                                       |
| estado resumido    | estado de recuperación sin convertir health en recuperación empresarial |
| bloqueo principal  | dependencia, autoridad, seguridad, evidencia o conflicto material       |
| siguiente decisión | únicamente cuando exista una decisión real pendiente                    |

La lista no crea una cola técnica universal ni modifica el orden propietario de cada proceso.

---

#### 17. Responsables efectivos

La experiencia distingue cuatro preguntas diferentes:

```text
¿QUIEN DIRIGE?
¿QUIEN ES DUEÑO DEL RESULTADO?
¿QUIEN EJECUTA?
¿QUIEN DEBE APROBAR?
```

##### 17.1. Dirección

Se muestra una sola dirección efectiva por alcance y momento:

- `RESPONSABLE_DE_CONTINUIDAD`; o
- `CONTINUADOR_DE_CONTINUIDAD` durante sustitución válida.

##### 17.2. Propiedad funcional

Cada resultado afectado muestra su `RESPONSABLE_DEL_PROCESO` o función propietaria aplicable.

##### 17.3. Ejecución

La función ejecutora solo se muestra cuando su conocimiento ayuda a la coordinación ejecutiva. Su presencia no implica que pueda validar o aprobar.

##### 17.4. Aprobación

La decisión ejecutiva muestra la autoridad aplicable:

- `GERENCIA_GENERAL`; o
- `GOBIERNO_Y_PROPIEDAD`;

conforme a severidad, decisión y delegación vigente.

Si la autoridad no puede resolverse, la decisión aparece bloqueada por autoridad no resoluble; no se selecciona una persona por jerarquía informal.

---

#### 18. Bandeja de decisiones ejecutivas

El inicio ejecutivo no muestra todas las tareas del incidente como decisiones. Solo incluye actos materiales que requieren decisión o conocimiento ejecutivo.

Clases de decisión que pueden aparecer cuando existan en el expediente:

- declarar o confirmar tratamiento de continuidad;
- activar;
- ampliar o reducir alcance;
- aprobar modo degradado;
- decidir excepción material;
- autorizar una decisión de recuperación que exceda el mandato ordinario;
- aprobar comunicación material cuando corresponda;
- desactivar;
- aprobar recuperación total;
- aprobar cierre.

Cada decisión debe mostrar:

1. qué se propone o decide;
2. por qué;
3. qué alcance cambia;
4. qué riesgo introduce o evita;
5. qué autoridad requiere;
6. qué evidencia mínima soporta la decisión;
7. cuándo expira o debe reevaluarse, cuando aplique;
8. qué ocurrirá si se deniega o no se decide a tiempo;
9. quién propuso;
10. estado real de la decisión.

La vista no convierte una propuesta en “pendiente de clic” si existen prerrequisitos materiales faltantes; primero muestra el bloqueo.

---

#### 19. Acciones protegidas desde la superficie

La futura implementación podrá ofrecer acciones ejecutivas solo cuando el contrato propietario las permita.

Invariantes:

1. la acción visible no concede permiso;
2. cada intento revalida actor, función, contexto, recurso, estado, alcance, versión de autoridad y denegaciones;
3. una confirmación visual no sustituye aprobación autoritativa;
4. una acción crítica muestra consecuencias y alcance antes de confirmar;
5. una decisión denegada conserva la razón y el siguiente mecanismo válido;
6. una acción expirada no puede ejecutarse desde una vista antigua;
7. una actualización de estado recibida después de abrir el diálogo obliga a reevaluar antes del efecto;
8. las acciones de emergencia no se habilitan por severidad por sí sola;
9. una simulación no presenta acciones productivas como reales;
10. la interfaz no implementa bypass por navegación, enlace profundo o parámetro local.

---

#### 20. Bloqueos ejecutivos

Los bloqueos se muestran con lenguaje humano y con la identidad canónica cuando sea necesaria para operación o soporte.

Ejemplos de bloqueo material heredado:

- falta de autoridad efectiva;
- información insuficiente para evaluar impacto o urgencia;
- evidencia incompatible o conflictiva;
- `RESULT_UNKNOWN` material;
- `CONFLICT` abierto;
- `QUARANTINED` sin decisión;
- `RECONCILIATION_REQUIRED` abierto;
- validación funcional obligatoria pendiente;
- control protector incumplido;
- capacidad alterna no acreditada cuando una decisión dependa de ella;
- dependencia externa sin estado suficiente;
- pendiente material sin propietario.

La experiencia deberá indicar:

```text
qué está bloqueado
por qué
qué evidencia o autoridad falta
quién es propietario de resolverlo
qué tarea o proceso es el destino cuando el bloqueo pertenezca a otra materia
```

No se utilizará un estado genérico sin propietario ni condición de salida.

---

#### 21. Información incompleta, antigua o conflictiva

La experiencia debe fallar de forma segura ante información incierta.

##### 21.1. Información incompleta

Si falta una dimensión necesaria:

- se muestra la dimensión faltante;
- se evita calcular indicadores dependientes;
- se identifica la fuente o función responsable cuando sea conocida;
- una transición protegida permanece bloqueada si la ausencia impide decidir.

##### 21.2. Información antigua

Si el estado visible puede haber quedado obsoleto:

- se muestra el timestamp autoritativo;
- se muestra la antigüedad;
- no se etiqueta como “actual” por haber cargado correctamente la interfaz;
- las acciones protegidas revalidan antes del efecto.

##### 21.3. Información conflictiva

Si dos fuentes difieren:

- no se promedian ni fusionan silenciosamente;
- se conserva la fuente propietaria aplicable;
- el conflicto queda visible;
- la decisión dependiente se bloquea cuando el conflicto sea material.

---

#### 22. Estado sin incidente activo

Cuando no exista incidente de continuidad activo, el inicio ejecutivo mostrará una condición neutral como:

```text
No hay un incidente de continuidad activo en el alcance autorizado.
```

Esto no significa:

- todos los servicios están saludables;
- todos los respaldos son recuperables;
- existe failover disponible;
- los RTO/RPO han sido probados;
- el plan está listo;
- no existen incidentes tecnológicos, laborales, de seguridad o de dominio;
- no existen riesgos o hallazgos abiertos.

La superficie podrá ofrecer acceso a evaluaciones recientes, historial o readiness únicamente mediante los contratos y tareas propietarias correspondientes, sin presentar esos datos como estado activo.

---

#### 23. Estado de carga y falla de la propia superficie

La experiencia deberá distinguir:

- cargando datos;
- datos parciales;
- fuente no disponible;
- autorización denegada;
- sesión o contexto inválidos;
- estado antiguo conservado;
- error de lectura;
- conflicto de fuentes.

Reglas:

1. un skeleton o indicador de carga no muestra valores ficticios;
2. un error de red no reemplaza valores con cero;
3. una autorización denegada no revela si existe un objeto sensible fuera del alcance;
4. el último estado conocido puede conservarse solo si se etiqueta con su tiempo y condición de no actualización;
5. la recuperación de conectividad revalida sesión, contexto y autorización;
6. la experiencia no reenvía automáticamente una decisión mutante fallida.

---

#### 24. Densidad y divulgación progresiva

La primera vista debe evitar dos extremos:

- **subinformación:** una tarjeta de color sin razón, autoridad, alcance o decisión;
- **sobrecarga:** una copia completa del expediente, logs y métricas técnicas.

Niveles de densidad:

| Nivel                | Contenido                                                                                                         |
| -------------------- | ----------------------------------------------------------------------------------------------------------------- |
| ejecutivo inmediato  | estado, severidad, impacto, prioridad, responsables, decisiones, bloqueos, última actualización                   |
| detalle de situación | procesos/servicios afectados, objetivos temporales, dependencias y evidencia resumida                             |
| detalle propietario  | expediente, centro de mando, runbook, restore, conciliación, comunicación o revisión en la superficie propietaria |

El cambio de nivel no cambia autoridad ni fuente de verdad.

---

#### 25. Semántica visual y accesibilidad

1. toda severidad se expresa con texto y no solo color;
2. todo bloqueo se expresa con texto, iconografía comprensible y relación con la acción afectada;
3. las decisiones urgentes se ordenan antes de contenido informativo secundario;
4. el contraste deberá ser suficiente para lectura en condiciones normales y de baja luminosidad;
5. el foco de teclado seguirá la jerarquía de situación, decisión y detalle;
6. las acciones críticas tendrán nombre explícito, no iconos ambiguos;
7. estados similares no se diferencian solo por tonalidad;
8. la lectura con zoom no debe ocultar severidad, autoridad o decisión pendiente;
9. tablas densas deberán transformarse en agrupaciones legibles en pantallas estrechas sin perder relaciones;
10. los cambios de estado importantes deberán ser perceptibles sin depender de animación;
11. cualquier actualización automática que pueda cambiar una decisión visible debe anunciar el cambio de forma no disruptiva pero perceptible;
12. la interfaz evitará temporizadores visuales que induzcan a una acción sin autoridad.

---

#### 26. Comportamiento responsive

##### Escritorio

Prioriza lectura simultánea de situación, impacto, prioridades y decisiones. El detalle técnico permanece colapsado o fuera de la primera jerarquía.

##### Móvil

Prioriza, en este orden:

1. estado/severidad;
2. decisión urgente;
3. impacto y prioridad;
4. responsables;
5. bloqueos;
6. última actualización;
7. detalle adicional.

No se oculta una decisión crítica únicamente porque el ancho disponible sea reducido.

##### Pantalla compartida o proyección

Cuando la superficie se use para coordinación en sala:

- se minimizan datos sensibles y personales;
- se evita mostrar secretos, contactos personales o evidencia sensible;
- la vista no adquiere permisos adicionales por presentarse en una pantalla de reunión;
- cualquier modo de visualización compartida debe derivar una proyección autorizada y no eludir `CONT-AUTH-003`.

---

#### 27. Fuente de verdad y sincronización visual

La superficie no almacena una copia empresarial competidora del incidente.

Debe consumir, por referencia o contrato propietario:

- estado del incidente;
- clasificación vigente;
- alcance;
- prioridades y objetivos heredados;
- actores y funciones efectivas;
- decisiones;
- bloqueos;
- evidencia resumida;
- timestamps;
- versiones aplicables.

Reglas:

1. filtros visuales no cambian el alcance real;
2. ordenar una lista no cambia prioridad canónica;
3. agrupar por sede no crea autoridad territorial;
4. un valor en caché no se convierte en fuente de verdad;
5. una proyección derivada conserva referencia al hecho propietario;
6. correcciones se realizan mediante el proceso propietario y luego se reflejan;
7. la interfaz no escribe silenciosamente sobre hechos de otro dominio para resolver una inconsistencia visual.

---

#### 28. Separación entre situación ejecutiva y centro de mando

`CONT-UX-001` responde **qué necesita saber y decidir la dirección**.

`CONT-UX-002` responderá **cómo se opera visualmente el incidente en detalle**, incluyendo línea de tiempo, servicios afectados, eventos de recuperación y coordinación del centro de mando.

Por tanto, esta tarea puede mostrar:

- último cambio;
- síntesis de afectación;
- responsables;
- prioridades;
- decisiones y bloqueos;

pero no materializa:

- cronología completa;
- editor de bitácora;
- secuencia detallada de eventos;
- tablero operacional de cada recuperación;
- coordinación detallada por actividad.

---

#### 29. Separación respecto de runbooks y ejecución

`CONT-UX-003` conserva la experiencia guiada de runbooks y checklists.

El inicio ejecutivo puede indicar que existe una recuperación en curso, quién es responsable y cuál es su resultado esperado, pero no muestra instrucciones técnicas ejecutables ni botones de operación que conviertan el dashboard en consola administrativa.

---

#### 30. Separación respecto de trabajo contingente y conciliación

`CONT-UX-004` conserva captura, revisión e incorporación del trabajo contingente.

El inicio ejecutivo únicamente muestra el balance o bloqueo material necesario para decisión, por ejemplo:

- existe trabajo pendiente de reincorporación;
- existe conflicto material;
- existe conciliación requerida;
- existe pendiente sin propietario.

No permite corregir, fusionar, aplicar o descartar unidades desde el resumen ejecutivo.

---

#### 31. Separación respecto de backup y recuperación técnica

`CONT-UX-005` conserva el seguimiento detallado de backup, restore, failover, failback, validación y pendientes técnicos.

El inicio ejecutivo podrá mostrar una dependencia técnica cuando cambie impacto, prioridad o decisión empresarial, pero no interpreta:

- job exitoso como backup recuperable;
- health como recuperación empresarial;
- réplica como failover acreditado;
- restore ejecutado como restore validado;
- proveedor estable como proceso Vento recuperado.

---

#### 32. Separación respecto de comunicaciones

`CONT-UX-006` conserva plantillas, canales, aprobación, confirmación y escalamiento de comunicaciones.

El inicio ejecutivo puede mostrar que existe una decisión o comunicación material pendiente cuando sea necesario para gobierno, pero no redacta ni distribuye el mensaje en esta tarea.

---

#### 33. Separación respecto de ejercicios y readiness

`CONT-UX-007` conserva ejercicios, revisión posterior, acciones y comprobación de readiness.

El inicio ejecutivo no mostrará “listo” basándose únicamente en documentación existente. Si en el futuro incorpora una señal de readiness, deberá provenir del programa propietario con evidencia vigente y nunca inferirse de la ausencia de incidentes.

---

#### 34. Automatización e inteligencia artificial

Una automatización o modelo puede asistir a la superficie para:

- resumir hechos ya autorizados;
- agrupar impacto;
- detectar cambios;
- proponer prioridad de atención visual;
- señalar información faltante;
- preparar una explicación;
- destacar decisiones próximas a vencimiento.

No puede por sí mismo:

- declarar un incidente;
- asignar severidad como decisión final cuando el contrato exige autoridad humana;
- activar continuidad;
- aprobar una excepción;
- fabricar una hora de recuperación;
- declarar MBCO satisfecho sin evidencia funcional;
- declarar recuperación total;
- desactivar;
- cerrar;
- aceptar riesgo;
- ocultar evidencia contradictoria.

Toda recomendación asistida deberá distinguirse del hecho y de la decisión autoritativa.

---

#### 35. Privacidad, sensibilidad y proyección mínima

El inicio ejecutivo no es un argumento para concentrar toda la información del incidente en una sola pantalla.

Reglas:

1. muestra función antes que identidad nominal cuando sea suficiente;
2. muestra contacto únicamente cuando sea necesario para la acción y el actor esté autorizado;
3. evita contenido completo de evidencia en el resumen;
4. no muestra secretos ni referencias que permitan recuperarlos sin autorización;
5. minimiza datos laborales, médicos, de SST, personales, financieros o regulatorios;
6. las capturas de pantalla o exportaciones futuras deberán tener autorización propia;
7. una vista compartida físicamente exige una proyección compatible con la audiencia;
8. un enlace a detalle no revela por sí mismo la existencia de un objeto no autorizado;
9. búsquedas y contadores respetan la misma autorización del contenido;
10. la interfaz no usa texto de error para filtrar nombres o detalles sensibles.

---

#### 36. Contrato conceptual de datos de la superficie

La implementación futura deberá poder construir la vista a partir de un contrato que resuelva, cuando aplique, estas dimensiones sin crear una nueva fuente de verdad:

| Grupo        | Dimensiones conceptuales                                                                                |
| ------------ | ------------------------------------------------------------------------------------------------------- |
| identidad    | incidente, expediente, versión, contexto real o simulado                                                |
| ciclo        | estado, modalidad, severidad inicial/máxima/actual, impacto, urgencia                                   |
| alcance      | empresa, sede, proceso, servicio, dependencia o canal afectado                                          |
| continuidad  | MBCO, RTO, MTPD, RPO y prioridad de recuperación aplicables                                             |
| dirección    | director efectivo, sustitución, propietarios de proceso, coordinación y funciones protectoras           |
| autoridad    | decisión requerida, autoridad aplicable, vigencia y estado de la decisión                               |
| recuperación | estado resumido, validación técnica/funcional y bloqueos materiales sin absorber el detalle propietario |
| pendientes   | incertidumbres, conflictos, conciliaciones, evidencia y propietarios                                    |
| trazabilidad | último cambio, actor/función, timestamp, fuente y referencia de evidencia                               |
| presentación | frescura, sensibilidad, campos permitidos y nivel de detalle autorizado                                 |

Estas dimensiones son semántica documental; no crean columnas, tablas, tipos, enums ni contratos físicos nuevos.

---

#### 37. Reglas de navegación y handoff

La navegación desde el inicio ejecutivo preservará contexto suficiente para que la siguiente superficie pueda reconstruir el mismo incidente y alcance.

Todo handoff deberá conservar, cuando aplique:

- referencia del incidente;
- alcance seleccionado;
- servicio o proceso relevante;
- decisión o bloqueo que originó la navegación;
- actor efectivo;
- contexto de autorización;
- fuente y versión vigentes.

La superficie destino vuelve a resolver autorización. El hecho de venir desde el inicio ejecutivo no concede acceso adicional.

---

#### 38. Estados de decisión y lenguaje humano

La interfaz no necesita crear un nuevo catálogo de estados de decisión para esta tarea. Presentará el estado real del contrato propietario y lo acompañará con lenguaje humano.

Ejemplos de mensajes compatibles:

```text
Requiere decisión ejecutiva.
La autoridad aplicable no está disponible o no puede resolverse.
Falta validación funcional antes de declarar recuperación total.
Existe un resultado incierto que impide cerrar.
La información visible no ha sido actualizada desde <timestamp real>.
La acción fue denegada; revise la razón y el mecanismo de escalamiento permitido.
```

Los mensajes no prometen resultado, no culpan al operador y no recomiendan un bypass.

---

#### 39. Cambios en vivo y estabilidad cognitiva

Cuando la implementación futura reciba actualizaciones en tiempo cercano a real:

1. un cambio de severidad, estado, alcance o decisión material debe ser visible;
2. la interfaz no reordena agresivamente todos los elementos durante una lectura crítica sin indicar el cambio;
3. una decisión abierta con datos que cambiaron debe forzar reevaluación antes de confirmar;
4. el último cambio autoritativo queda identificable;
5. cambios puramente cosméticos no deben competir con una decisión crítica;
6. una pérdida del canal de actualización cambia la señal de frescura, no el estado empresarial por inferencia.

---

#### 40. Indicadores permitidos y prohibidos

##### Permitidos cuando provienen de fuentes autoritativas

- cantidad de procesos o servicios afectados;
- cantidad de sedes afectadas;
- cantidad de decisiones materiales pendientes;
- cantidad de bloqueos críticos;
- cantidad de pendientes sin propietario;
- tiempos transcurridos desde timestamps reales;
- objetivo RTO/MTPD y tiempo restante o excedido cuando el cálculo sea demostrable;
- distribución por prioridad dentro del alcance afectado.

##### Prohibidos por inferencia

- porcentaje de “recuperación” sin contrato de cálculo aprobado;
- porcentaje de “salud empresarial” derivado de health técnico;
- ETA inventada a partir de velocidad observada;
- semáforo verde global por ausencia de alertas;
- readiness por existencia de documentación;
- riesgo cero por ausencia de incidentes;
- prioridad calculada solo por volumen de alertas;
- severidad deducida únicamente del nombre de la aplicación afectada.

---

#### 41. Evidencia y reconstrucción de la experiencia

La futura implementación deberá permitir reconstruir, sin convertir la interfaz en fuente propietaria:

- qué estado y severidad se mostraban;
- qué versión y timestamp sustentaban la vista;
- qué actor y función estaban efectivos;
- qué decisiones se presentaron;
- qué decisión intentó el actor;
- qué autorización se resolvió;
- qué resultado produjo el intento;
- qué evidencia o referencia sustentó una transición;
- qué dato estaba desactualizado o en conflicto cuando sea material.

No se exige registrar cada scroll o expansión visual. Se registra la interacción material cuando afecte una decisión, evidencia, autorización o transición protegida.

---

#### 42. Estado documental y AS-IS

| Materia                                           | Estado posterior a esta tarea | Condición de salida                                                   |
| ------------------------------------------------- | ----------------------------- | --------------------------------------------------------------------- |
| jerarquía ejecutiva de información                | `ESPECIFICADO`                | implementación de superficie en paquete propietario autorizado        |
| presentación de estado/impacto/urgencia/severidad | `ESPECIFICADO`                | integración con fuentes autoritativas y pruebas                       |
| prioridades de recuperación                       | `ESPECIFICADO`                | consumo del BIA/objetivos vigentes y datos reales de incidente        |
| responsables y autoridad efectiva                 | `ESPECIFICADO`                | resolución de identidad, delegación y autorización en implementación  |
| bandeja ejecutiva de decisiones                   | `ESPECIFICADO`                | contratos de acciones protegidas y backend autoritativo implementados |
| bloqueos e incertidumbre                          | `ESPECIFICADO`                | integración con fuentes de incidente, conciliación y autorización     |
| accesibilidad y responsive                        | `ESPECIFICADO`                | prototipo/implementación y validación con usuarios/dispositivos       |
| pantalla productiva                               | `PENDIENTE_DE_EVIDENCIA`      | implementación posterior expresamente autorizada                      |
| integración en vivo con `VPROC-0062`              | `PENDIENTE_DE_EVIDENCIA`      | contratos e implementación de integración propietarios                |
| validación con actores reales                     | `PENDIENTE_DE_EVIDENCIA`      | piloto o ejercicio autorizado con evidencia vigente                   |
| readiness operacional                             | `PENDIENTE_DE_EVIDENCIA`      | programa de ejercicios/certificación aplicable                        |
| cambios físicos realizados por esta tarea         | `NO_APLICA`                   | tarea exclusivamente documental                                       |

`ESPECIFICADO` no significa `IMPLEMENTADO` ni `VALIDADO`.

---

#### 43. Handoffs obligatorios

| Materia posterior                                                              | Propietario documental                               | Condición de salida                                              |
| ------------------------------------------------------------------------------ | ---------------------------------------------------- | ---------------------------------------------------------------- |
| centro de mando, línea de tiempo, servicios afectados y recuperación detallada | `CONT-UX-002`                                        | antes de implementar la operación visual detallada del incidente |
| runbooks y checklists por rol, proceso, sede y modalidad                       | `CONT-UX-003`                                        | antes de implementar ejecución guiada de recuperación            |
| captura durante falla y reincorporación humana                                 | `CONT-UX-004`                                        | antes de implementar revisión y retorno de trabajo contingente   |
| backup, restore, failover, validación y pendientes técnicos                    | `CONT-UX-005`                                        | antes de implementar seguimiento técnico de recuperación         |
| comunicaciones internas y externas                                             | `CONT-UX-006`                                        | antes de implementar plantillas, canales y confirmaciones        |
| ejercicios, revisión posterior, acciones y readiness                           | `CONT-UX-007`                                        | antes de implementar experiencia de ejercicio y aprendizaje      |
| propagación de health, degradación e incidentes entre aplicaciones             | `CONT-INT-001` y `CONT-INT-002`                      | antes de automatizar el estado interaplicación                   |
| dependencias externas                                                          | `CONT-INT-003`                                       | antes de automatizar estado y participación de proveedores       |
| reincorporación y conciliación entre dominios                                  | `CONT-INT-004`                                       | antes de automatizar retorno de trabajo contingente              |
| implementación de permisos y acciones protegidas                               | tareas AUTH/SHELL y paquetes propietarios aplicables | antes de habilitar acciones reales desde la superficie           |
| certificación operativa                                                        | `CONT-DOM-014`, BLOQUE U y paquetes aplicables       | antes de declarar la experiencia lista para operación real       |

No queda una decisión material de esta tarea sin propietario documental y condición de salida.

---

#### 44. Cobertura vigente de prueba

La conducta diseñada por `CONT-UX-001` ya dispone de cobertura canónica suficiente:

- `TREQ-CONT-001` protege BIA, nivel mínimo, MTPD, RTO, RPO, prioridad y vínculo con resultados empresariales y asigna expresamente responsabilidad a `CONT-UX-001`;
- `TREQ-CONT-002` protege clasificación de incidentes, impacto, urgencia, severidad, responsables, decisiones, escalamiento, estado operativo, autoridad y cronología, y asigna expresamente responsabilidad a `CONT-UX-001`;
- `TREQ-UX-001` protege comprensión inmediata de tarea/estado y jerarquía de acción;
- `TREQ-UX-003` protege densidad, minimización de información y acciones según actor y autorización;
- `TREQ-UX-005` protege fuente de verdad, estado confirmado o pendiente, actor, último cambio y diferencias;
- `TREQ-UX-010` protege las superficies administrativas mediante alcance, versión, estado, actor, permiso, segregación e impacto.

La tarea especializa esos requisitos para el inicio ejecutivo de continuidad y no introduce una obligación verificable distinta de la cobertura vigente.

---

#### 45. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el diseño materializa comportamiento de experiencia, estado, impacto, prioridad, autoridad, fuente de verdad y trazabilidad ya protegido por el registro canónico vigente. No introduce una conducta ejecutable nueva ni modifica una regla protegida existente.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 46. Criterios de aceptación

1. La tarea conserva `CONT-AUTH-004` como anterior aprobada.
2. La tarea reserva únicamente `CONT-UX-002` como siguiente.
3. La tarea permanece exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`.
4. No crea código, migraciones, DDL, DML, RLS, RPC, datos ni configuración.
5. No crea una pantalla productiva real.
6. No crea una navegación productiva real.
7. No activa un incidente real.
8. No modifica un incidente real.
9. No aprueba una decisión real.
10. No ejecuta restore, failover ni failback.
11. No declara readiness.
12. No declara disponibilidad empresarial inexistente.
13. El inicio ejecutivo se clasifica como supervisión administrativa/ejecutiva.
14. La superficie no se convierte en estación de ejecución operativa.
15. `VPROC-0062` conserva el expediente transversal propietario.
16. La interfaz no crea una fuente de verdad paralela.
17. Ausencia de incidente activo no equivale a salud global.
18. Ausencia de incidente activo no equivale a readiness.
19. Estado se presenta separado de severidad.
20. Estado se presenta separado de modalidad de activación.
21. Impacto se presenta separado de urgencia.
22. Urgencia se presenta separada de severidad.
23. Severidad se presenta separada de prioridad de recuperación.
24. Prioridad de recuperación se presenta separada de prioridad de ticket.
25. Se conserva `SEV-C1_CONTROLADA`.
26. Se conserva `SEV-C2_DEGRADADA`.
27. Se conserva `SEV-C3_MAYOR`.
28. Se conserva `SEV-C4_CRITICA`.
29. Severidad no crea permiso.
30. No se preasigna severidad a un servicio sin incidente real.
31. Se conserva `I0_SIN_AFECTACION_DE_CONTINUIDAD`.
32. Se conserva `I1_DEGRADACION_CONTROLADA`.
33. Se conserva `I2_MBCO_COMPROMETIDO`.
34. Se conserva `I3_INACEPTABLE_O_IRREVERSIBLE`.
35. Se conserva `U1_CONTROLADA`.
36. Se conserva `U2_PRIORITARIA`.
37. Se conserva `U3_INMEDIATA`.
38. Se conserva `SIN_ACTIVACION_CONTINUIDAD`.
39. Se conserva `ACTIVACION_PARCIAL`.
40. Se conserva `ACTIVACION_AMPLIADA`.
41. Se conserva `ACTIVACION_EMPRESARIAL_PROTECTORA`.
42. La modalidad no concede acceso de emergencia.
43. La modalidad no concede permiso técnico.
44. La primera vista identifica estado del incidente.
45. La primera vista identifica severidad cuando aplica.
46. La primera vista identifica modalidad vigente cuando aplica.
47. La primera vista identifica alcance resumido.
48. La primera vista identifica impacto empresarial.
49. La primera vista identifica urgencia.
50. La primera vista identifica prioridades de recuperación.
51. La primera vista identifica dirección efectiva.
52. La primera vista identifica autoridad de la siguiente decisión protegida cuando aplica.
53. La primera vista identifica decisiones materiales que requieren acción.
54. La primera vista identifica bloqueos materiales.
55. La primera vista identifica última actualización autoritativa.
56. Un componente técnico no desplaza al resultado empresarial como foco principal.
57. Un health técnico no equivale a recuperación empresarial.
58. Una réplica no equivale a failover acreditado.
59. Un restore ejecutado no equivale a restore validado.
60. Un proveedor estable no equivale a proceso Vento recuperado.
61. MBCO se expresa como resultado mínimo empresarial.
62. RTO se presenta como objetivo, no como resultado cumplido.
63. MTPD se presenta como frontera, no como permiso para esperar.
64. RPO se presenta cuando su efecto sea material para la decisión.
65. Un reloj requiere un punto de inicio demostrable.
66. Un reloj sin datos suficientes no se inventa.
67. Un objetivo vencido no reinicia su reloj por una actualización visual.
68. Una estimación de proveedor no se presenta como RTO empresarial.
69. Una estimación no se presenta como recuperación confirmada.
70. La interfaz no modifica MBCO.
71. La interfaz no modifica RTO.
72. La interfaz no modifica MTPD.
73. La interfaz no modifica RPO.
74. Se conserva `PR-0_PROTECCION`.
75. Se conserva `PR-1_ESENCIAL`.
76. Se conserva `PR-2_CONTROL`.
77. Se conserva `PR-3_DIFERIBLE`.
78. Un control protector aplicable precede la conveniencia operacional.
79. Una dependencia causal puede afectar orden sin renombrar la prioridad BIA.
80. El volumen de alertas no define prioridad de recuperación.
81. La antigüedad del ticket no define prioridad de recuperación.
82. La presión de proveedor no define prioridad de recuperación.
83. Cada prioridad visible conserva propietario funcional.
84. Cada prioridad visible conserva razón actual.
85. Cada prioridad visible identifica un bloqueo material cuando exista.
86. Una prioridad no promete un tiempo de recuperación.
87. `RESPONSABLE_DE_CONTINUIDAD` puede mostrarse como dirección efectiva cuando corresponda.
88. `CONTINUADOR_DE_CONTINUIDAD` se muestra como dirección solo con sustitución vigente.
89. No existen dos directores efectivos simultáneos para el mismo alcance y momento.
90. Cada resultado afectado conserva propietario funcional.
91. El ejecutor no se presenta como aprobador por ejecutar.
92. El técnico no se presenta como autoridad empresarial por ser técnico.
93. El proveedor no se presenta como autoridad empresarial.
94. La automatización no se presenta como autoridad empresarial.
95. El dispositivo no se presenta como actor humano.
96. `GERENCIA_GENERAL` o `GOBIERNO_Y_PROPIEDAD` conservan la autoridad ejecutiva según delegación y severidad aplicables.
97. No se inventa una correspondencia nominal fija de autoridad.
98. Autoridad no resoluble produce bloqueo.
99. Una propuesta no se presenta como aprobada.
100. Una aprobación no se presenta como ejecutada.
101. Una ejecución no se presenta como validación.
102. Una validación técnica no se presenta como validación funcional.
103. Una validación funcional no se presenta como cierre.
104. Recuperación total no se presenta como desactivación.
105. Desactivación no se presenta como cierre.
106. Cierre no se presenta como revisión posterior concluida.
107. La bandeja de decisiones contiene decisiones materiales y no todas las tareas del incidente.
108. Cada decisión visible identifica su objeto.
109. Cada decisión visible identifica su razón.
110. Cada decisión visible identifica alcance.
111. Cada decisión visible identifica autoridad requerida.
112. Cada decisión visible identifica estado real.
113. Cada decisión visible conserva vigencia cuando aplique.
114. Cada decisión visible conserva evidencia mínima suficiente.
115. Una acción visible no concede permiso.
116. Cada acción protegida revalida autoridad antes del efecto.
117. Una vista antigua no autoriza una acción expirada.
118. Un cambio material durante una confirmación obliga a reevaluar.
119. Severidad no habilita break-glass por sí sola.
120. Simulación no presenta autoridad productiva como real.
121. La interfaz no implementa bypass por navegación.
122. La interfaz no implementa bypass por enlace profundo.
123. La interfaz no implementa bypass por parámetro local.
124. `RESULT_UNKNOWN` material se muestra como bloqueo cuando impide transición.
125. `CONFLICT` material se muestra como bloqueo cuando impide transición.
126. `QUARANTINED` sin decisión se muestra como bloqueo cuando impide transición.
127. `RECONCILIATION_REQUIRED` abierto se muestra como bloqueo cuando impide transición.
128. Falta de validación funcional se muestra cuando bloquee recuperación total o cierre.
129. Control protector incumplido no se rebaja a advertencia decorativa.
130. Pendiente material sin propietario se muestra como bloqueo.
131. El bloqueo identifica propietario de resolución cuando sea conocido.
132. El bloqueo identifica condición de salida cuando sea conocida.
133. La falta de una dimensión necesaria no se convierte en cero.
134. La falta de evidencia no se convierte en éxito.
135. La información antigua muestra timestamp.
136. La información antigua muestra antigüedad cuando sea material.
137. La pérdida de actualización no cambia el estado empresarial por inferencia.
138. Un conflicto de fuentes no se promedia silenciosamente.
139. La fuente propietaria prevalece según su contrato.
140. Un conflicto material puede bloquear la decisión dependiente.
141. El estado `DETECTADO` no se presenta como incidente declarado.
142. `EN_TRIAGE` hace visible la evaluación pendiente.
143. `NO_DECLARADO_COMO_CONTINUIDAD` no se presenta como incidente activo.
144. `DECLARADO` no se presenta como activado automáticamente.
145. `ACTIVADO_PARCIAL` conserva alcance acotado.
146. `ACTIVADO_AMPLIADO` conserva coordinación ampliada.
147. `ACTIVADO_EMPRESARIAL_PROTECTOR` prioriza protección y gobierno aplicable.
148. `EN_CONTENCION_Y_RECUPERACION` no declara éxito anticipado.
149. `ESTABILIZADO` conserva condiciones de desactivación o retorno a recuperación.
150. `DESACTIVADO` puede coexistir con pendientes identificados.
151. `DESACTIVADO` no se muestra como `CERRADO`.
152. `CERRADO` se presenta como estado histórico y no como autorización nueva.
153. La interfaz distingue hechos confirmados de pronósticos.
154. La interfaz distingue pronósticos de decisiones.
155. La interfaz distingue recomendaciones asistidas de decisiones autoritativas.
156. La primera jerarquía no contiene secretos.
157. La primera jerarquía minimiza datos personales.
158. La primera jerarquía minimiza evidencia sensible.
159. Función se muestra antes que identidad nominal cuando sea suficiente.
160. Una pantalla compartida no obtiene permisos adicionales.
161. Una búsqueda no enumera información sensible fuera del alcance.
162. Un contador no filtra existencia de objetos no autorizados.
163. Un error de autorización no revela contenido sensible.
164. Color no es el único indicador de severidad.
165. Color no es el único indicador de bloqueo.
166. Las acciones críticas tienen texto explícito.
167. El foco de teclado conserva la jerarquía de decisión.
168. El zoom no oculta severidad, autoridad o decisión material.
169. La versión móvil conserva decisiones críticas visibles.
170. La versión móvil no convierte la vista en un tablero técnico saturado.
171. La carga no utiliza valores ficticios.
172. Un error de red no reemplaza datos con cero.
173. El último estado conocido solo se reutiliza indicando su antigüedad.
174. La reconexión revalida sesión y autorización.
175. Una decisión mutante fallida no se reenvía automáticamente.
176. Filtros visuales no cambian el alcance real.
177. Ordenar visualmente no cambia prioridad canónica.
178. Agrupar por sede no crea autoridad territorial.
179. Caché no se convierte en fuente de verdad.
180. Una proyección conserva referencia al hecho propietario.
181. Las correcciones se realizan en la fuente propietaria.
182. La interfaz no corrige silenciosamente datos de otro dominio.
183. `CONT-UX-002` conserva la línea de tiempo y centro de mando detallados.
184. `CONT-UX-003` conserva runbooks y checklists de ejecución.
185. `CONT-UX-004` conserva captura y reincorporación humana.
186. `CONT-UX-005` conserva seguimiento detallado de backup, restore, failover y pendientes.
187. `CONT-UX-006` conserva plantillas y canales de comunicación.
188. `CONT-UX-007` conserva ejercicios, revisión posterior y readiness.
189. El inicio ejecutivo puede mostrar síntesis de esas materias sin absorber su ejecución.
190. Un handoff conserva referencia del incidente.
191. Un handoff conserva el alcance relevante.
192. Un handoff conserva la decisión o bloqueo que originó la navegación cuando aplique.
193. La superficie destino vuelve a resolver autorización.
194. Venir del inicio ejecutivo no concede acceso adicional.
195. Un cambio de severidad visible debe poder percibirse.
196. Un cambio de estado visible debe poder percibirse.
197. Un cambio de alcance material debe poder percibirse.
198. Una pérdida del canal de actualización modifica frescura, no el estado por inferencia.
199. No se usa porcentaje de recuperación sin contrato aprobado.
200. No se usa porcentaje de salud empresarial derivado de health técnico.
201. No se inventa ETA mediante extrapolación visual.
202. No se muestra semáforo verde global por ausencia de alertas.
203. No se declara readiness por existencia documental.
204. No se declara riesgo cero por ausencia de incidentes.
205. La evidencia material de una interacción protegida conserva actor y decisión.
206. La experiencia no necesita registrar cada scroll o expansión visual.
207. La tarea no crea columnas físicas.
208. La tarea no crea tablas físicas.
209. La tarea no crea enums físicos.
210. La tarea no crea contratos físicos nuevos.
211. La tarea no crea permisos nuevos.
212. La tarea no crea roles nuevos.
213. La tarea no crea estados nuevos de negocio.
214. La tarea no crea severidades nuevas.
215. La tarea no crea prioridades nuevas.
216. La tarea no inventa incidentes.
217. La tarea no inventa identidades nominales.
218. La tarea no inventa timestamps de incidentes.
219. La tarea no inventa objetivos de recuperación.
220. La tarea no inventa evidencia operativa.
221. La tarea distingue `ESPECIFICADO` de `IMPLEMENTADO`.
222. La tarea distingue `ESPECIFICADO` de `VALIDADO`.
223. La implementación real permanece pendiente de su paquete propietario autorizado.
224. La integración en vivo permanece pendiente de sus contratos propietarios.
225. La validación con actores reales permanece pendiente de piloto o ejercicio autorizado.
226. La tarea crea cero requisitos de prueba.
227. La tarea modifica cero requisitos de prueba.
228. La tarea difiere cero requisitos de prueba.
229. La tarea descarta cero requisitos de prueba.
230. La tarea vuelve obsoletos cero requisitos de prueba.
231. No se genera una copia innecesaria del registro canónico de requisitos.
232. La tarea no inicia `CONT-UX-002`.
233. La tarea conserva `CONT-UX-002` únicamente reservada.

---

#### 47. Balance de cierre

| Control                                                    | Resultado |
| ---------------------------------------------------------- | --------: |
| zonas semánticas obligatorias del inicio ejecutivo         |     **7** |
| estados canónicos del ciclo materializados en presentación |    **11** |
| niveles de severidad preservados                           |     **4** |
| niveles de impacto preservados                             |     **4** |
| clases de urgencia preservadas                             |     **3** |
| modalidades de activación preservadas                      |     **4** |
| prioridades de recuperación preservadas                    |     **4** |
| decisiones sustantivas de diseño                           |    **51** |
| criterios de aceptación                                    |   **233** |
| cambios físicos                                            |     **0** |
| requisitos de prueba creados o modificados                 |     **0** |

---

#### 48. Continuidad

ÚLTIMA TAREA APROBADA

`CONT-AUTH-004 — Separar ejecución, validación, reincorporación, conciliación, cierre y revisión posterior`

TAREA ACTUAL APROBADA

`CONT-UX-001 — Diseñar inicio ejecutivo de continuidad con estado, impacto, prioridades, responsables y decisiones`

SIGUIENTE TAREA RESERVADA

`CONT-UX-002 — Diseñar centro de mando del incidente con línea de tiempo, servicios afectados y recuperación`


### ✅ CONT-UX-002 — Diseñar centro de mando del incidente con línea de tiempo, servicios afectados y recuperación

**Estado:** APROBADA
**Tarea anterior:** `CONT-UX-001 — Diseñar inicio ejecutivo de continuidad con estado, impacto, prioridades, responsables y decisiones` — APROBADA
**Tarea siguiente:** `CONT-UX-003 — Diseñar runbooks y checklists simples por rol, proceso, sede y modalidad` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de experiencia para centro de mando de continuidad, línea de tiempo autoritativa, servicios y procesos afectados, coordinación de recuperación, decisiones, bloqueos y handoffs
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/AC_CONTINUIDAD_OPERATIVA_Y_RECUPERACION/03_EXPERIENCIA_DE_CONTINGENCIA_Y_MANDO.md`
**Bloque:** AC — Continuidad operativa y recuperación
**Fase:** exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`
**Implementación técnica u operativa:** no autorizada
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, tablas, columnas, enums, RLS, RPC, funciones, Edge Functions, migraciones, datos, permisos, grants, sesiones, secretos, respaldos, restauraciones, colas, integraciones, rutas de aplicación ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Diseñar la experiencia canónica del centro de mando de un incidente de continuidad para que las funciones autorizadas puedan coordinar, comprender y reconstruir un incidente activo sin depender de conversaciones dispersas, paneles técnicos aislados o interpretaciones informales.

La superficie deberá permitir responder de forma determinista y progresiva:

```text
qué incidente se está coordinando
cuál es su estado empresarial vigente
qué severidad, impacto, urgencia y modalidad aplican
qué servicios, procesos y sedes están afectados
qué resultado mínimo debe preservarse
qué recuperación está en curso por servicio o proceso
qué está técnicamente restablecido y qué aún no está validado funcionalmente
quién dirige efectivamente el incidente
quién ejerce cada función material de mando
qué decisiones se tomaron y cuáles siguen pendientes
qué hechos ocurrieron y en qué secuencia
qué información llegó tarde o fue corregida
qué bloqueos, conflictos o resultados desconocidos permanecen abiertos
qué siguiente coordinación es prioritaria
qué referencias conducen a runbooks, evidencia, comunicaciones o trabajos especializados
qué dato es autoritativo y qué proyección está desactualizada
```

El centro de mando es una **proyección coordinadora de fuentes propietarias**. No se convierte en una segunda fuente de verdad, no fabrica autoridad, no declara recuperación total por estado visual y no sustituye los expedientes propietarios de cada dominio.

---

#### 2. Resultado sustantivo

`CONT-UX-002` queda materializada con las siguientes decisiones:

1. el centro de mando se define como profundidad operativa del inicio ejecutivo de `CONT-UX-001`, no como una portada competidora;
2. la experiencia se organiza en ocho zonas semánticas obligatorias;
3. la cabecera conserva identidad del incidente, estado, severidad, modalidad, alcance y frescura de la información;
4. se presenta una sola dirección efectiva del incidente por alcance y momento;
5. las funciones de mando se muestran separadas de los permisos técnicos y de las identidades nominales cuando la función sea suficiente;
6. servicios, procesos y sedes afectados se materializan como proyecciones vinculadas a sus fuentes propietarias;
7. cada fila afectada separa impacto empresarial, prioridad de recuperación, estado técnico, validación funcional, reincorporación y bloqueos;
8. un estado técnico favorable no produce semáforo empresarial favorable por inferencia;
9. la recuperación se presenta como una secuencia de hitos verificables y no como porcentaje inventado;
10. la línea de tiempo conserva hechos, decisiones, acciones, validaciones, comunicaciones y correcciones sin reescribir historia;
11. hora efectiva y hora de registro pueden mostrarse separadas cuando difieran;
12. la llegada tardía de un evento no cambia retroactivamente el orden factual sin dejar evidencia;
13. una corrección crea una relación visible con el elemento previo y no lo elimina;
14. las decisiones protegidas se muestran con autoridad requerida, actor proponente, estado autoritativo, alcance, vigencia, evidencia y condición siguiente;
15. una acción visual de aprobación solo puede existir si la autorización efectiva la habilita y siempre debe resolverse del lado autoritativo;
16. filtros, búsqueda, orden y agrupación no modifican alcance, prioridad, estado ni autoridad;
17. `RESULT_UNKNOWN`, `CONFLICT`, `QUARANTINED` y `RECONCILIATION_REQUIRED` se presentan como bloqueos explícitos cuando existan;
18. incertidumbre no se representa como estado normal ni como ausencia de impacto;
19. se distingue información actual, última información conocida e información cuya frescura no puede acreditarse;
20. la pérdida de actualización en vivo degrada frescura, no cambia el estado del incidente;
21. la superficie conserva el siguiente punto crítico de coordinación sin convertirlo en permiso;
22. el centro de mando enlaza a runbooks y checklists sin definirlos, responsabilidad de `CONT-UX-003`;
23. el centro de mando resume trabajo contingente y reincorporación sin absorber la experiencia detallada de `CONT-UX-004`;
24. el centro de mando resume restore, failover y validaciones sin absorber el seguimiento detallado de `CONT-UX-005`;
25. el centro de mando muestra estado de comunicaciones y aprobaciones sin absorber plantillas, canales y confirmaciones de `CONT-UX-006`;
26. el centro de mando distingue incidente real de ejercicio, pero la experiencia de ejercicios y revisión permanece en `CONT-UX-007`;
27. la experiencia conserva minimización de información sensible y reautoriza cada handoff protegido;
28. una referencia visible a evidencia no concede lectura de la evidencia;
29. el centro de mando no muestra secretos, tokens, credenciales o datos sensibles completos para acelerar la coordinación;
30. la experiencia define comportamiento responsive para escritorio, tablet y móvil sin cambiar semántica;
31. color, posición o animación nunca son el único portador de severidad, estado o bloqueo;
32. actualizaciones materiales no deben destruir el foco de teclado ni desplazar de forma inesperada la decisión que una persona está revisando;
33. la vista permite distinguir simulación, ejercicio e incidente real antes de cualquier acción protegida;
34. la vista no inventa ETA, porcentaje de recuperación, riesgo cero, readiness ni salud empresarial agregada;
35. una fuente externa o proveedor puede aportar estado y evidencia, pero su estado no sustituye recuperación empresarial de Vento;
36. la recuperación total y el cierre aparecen como decisiones empresariales protegidas, no como conclusión visual automática;
37. `DESACTIVADO` puede mostrarse con pendientes asignados cuando el contrato lo permita;
38. `CERRADO` no puede representarse como válido si existe un bloqueo que el contrato de cierre prohíbe;
39. la experiencia conserva referencias de origen, versión y último cambio para evitar decisiones sobre datos obsoletos;
40. la interfaz distingue hechos observados, interpretaciones, hipótesis y decisiones cuando esa diferencia sea material;
41. la vista de un servicio o proceso nunca modifica el expediente por el solo hecho de filtrarlo o expandirlo;
42. el centro de mando admite profundidad progresiva sin convertir el primer nivel en una tabla técnica saturada;
43. el diseño mantiene compatibilidad semántica con `VPROC-0062`, cuyo expediente transversal pertenece a VISO;
44. las aplicaciones y dominios propietarios conservan sus hechos; el centro de mando únicamente coordina su proyección;
45. toda navegación a una superficie propietaria conserva referencia del incidente y vuelve a resolver autorización;
46. un contador agregado no puede revelar objetos, incidentes, servicios o evidencia fuera del alcance autorizado;
47. la experiencia se diseña para operación normal de mando, degradación de conectividad y actualización diferida sin fabricar datos;
48. toda afirmación de recuperación debe poder rastrearse hasta evidencia técnica, validación funcional y autoridad aplicable cuando correspondan;
49. la tarea no introduce nuevos estados de negocio, severidades, prioridades, permisos o catálogos de eventos;
50. la tarea materializa diseño documental completo y produce cero cambios físicos y cero cambios de requisitos de prueba.

---

#### 3. Entradas canónicas conservadas

Esta tarea consume sin redefinir:

- `VPROC-0062 — Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje` como proceso transversal propietario de VISO;
- `CONT-DOM-002` a `CONT-DOM-004` para impacto empresarial, dependencias, objetivos y prioridad de recuperación;
- `CONT-DOM-005` para taxonomía, severidad, declaración, activación, escalamiento, desactivación y cierre;
- `CONT-DOM-006` para mando, sustitución, bitácora cronológica, decisiones y coordinación de comunicaciones;
- `CONT-DOM-007` y `CONT-DOM-008` para operación mínima y estrategias de contingencia;
- `CONT-DOM-009` y `CONT-DOM-010` para trabajo durante la falla, folios, evidencia, reincorporación, conflicto y conciliación;
- `CONT-DOM-011` y `CONT-DOM-012` para respaldo, recuperación, restore, failover, retorno, validación técnica y validación funcional;
- `CONT-DOM-013` para dependencias externas, proveedores, recursos alternativos y receipts;
- `CONT-DOM-014` y `CONT-DOM-015` para ejercicios, revisión, acciones y readiness;
- `CONT-AUTH-001` para declaración, activación, mando, excepciones, comunicación y desactivación;
- `CONT-AUTH-002` para acceso extraordinario, break-glass, recuperación privilegiada, expiración y revocación;
- `CONT-AUTH-003` para protección de respaldos, runbooks, contactos, evidencia, formularios y datos de contingencia;
- `CONT-AUTH-004` para separar ejecución, validación, reincorporación, conciliación, recuperación total, cierre y revisión posterior;
- `CONT-UX-001` para el inicio ejecutivo, sus jerarquías, taxonomías y regla de drill-down;
- los contratos canónicos de identidad, actor efectivo, autorización, contexto, recurso, información, evidencia, idempotencia, integración y auditoría;
- las taxonomías vigentes de severidad, impacto, urgencia, activación, estado de incidente y prioridad de recuperación.

Esta tarea no modifica los valores propietarios de ninguna de esas entradas.

---

#### 4. Decisión principal de experiencia

Vento OS adopta un centro de mando de continuidad basado en una **proyección operacional autoritativamente enlazada**.

```text
FUENTES PROPIETARIAS
→ producen hechos, estados, decisiones, evidencia y validaciones

EXPEDIENTE TRANSVERSAL VPROC-0062
→ correlaciona incidente, mando, decisiones y continuidad

CENTRO DE MANDO
→ presenta y coordina la situación
→ conserva enlaces, versiones y frescura
→ no se vuelve propietario de los hechos de dominio

HANDOFF
→ abre la superficie especializada aplicable
→ conserva incidente y alcance
→ vuelve a resolver autorización
```

Regla cardinal:

```text
VISIBLE EN EL CENTRO DE MANDO
≠
AUTORIDAD PARA MODIFICAR EL HECHO
```

La experiencia puede facilitar una acción protegida, pero la pantalla no es la fuente de la autoridad.

---

#### 5. Fronteras con el inicio ejecutivo

`CONT-UX-001` y `CONT-UX-002` forman dos niveles de una misma experiencia de continuidad:

| Materia         | Inicio ejecutivo                  | Centro de mando                                      |
| --------------- | --------------------------------- | ---------------------------------------------------- |
| propósito       | orientar decisión ejecutiva       | coordinar evolución operacional del incidente        |
| densidad        | síntesis                          | detalle operativo progresivo                         |
| estado          | resumen transversal               | estado y cambios correlacionados                     |
| impacto         | síntesis priorizada               | desglose por servicio, proceso y sede                |
| mando           | responsable y autoridad principal | composición efectiva, sustitución y handoffs         |
| decisiones      | pendientes y recientes            | historial, contexto, autoridad y condición siguiente |
| línea de tiempo | último cambio relevante           | secuencia cronológica material                       |
| recuperación    | síntesis                          | hitos por servicio/proceso y validaciones            |
| bloqueos        | críticos                          | críticos y operativos con trazabilidad               |
| navegación      | entrada                           | coordinación y salto a superficies especializadas    |

El centro de mando no duplica una portada ejecutiva separada ni exige al usuario reconstruir el contexto desde cero.

---

#### 6. Ocho zonas semánticas obligatorias

El centro de mando se compone de ocho zonas semánticas. Su posición física puede adaptarse al dispositivo, pero su prioridad y significado no se alteran.

| Zona                         | Contenido mínimo                                                                                     | Pregunta que resuelve                                |
| ---------------------------- | ---------------------------------------------------------------------------------------------------- | ---------------------------------------------------- |
| `Z1_IDENTIDAD_Y_ESTADO`      | incidente, naturaleza, estado, severidad, modalidad, alcance, frescura                               | ¿qué caso estoy coordinando y en qué condición está? |
| `Z2_MANDO_EFECTIVO`          | director, sustitución, funciones de mando, autoridad aplicable, último handoff                       | ¿quién dirige y quién debe decidir?                  |
| `Z3_AFECTACION`              | servicios, procesos, sedes, impacto, prioridad, MBCO/objetivos referenciados                         | ¿qué está afectado y qué importa primero?            |
| `Z4_RECUPERACION`            | hitos, estado técnico, validación funcional, reincorporación, conciliación                           | ¿qué se ha recuperado realmente y qué falta?         |
| `Z5_LINEA_DE_TIEMPO`         | hechos, decisiones, acciones, validaciones, comunicaciones, correcciones                             | ¿qué ocurrió, cuándo y en qué secuencia?             |
| `Z6_DECISIONES`              | decisiones abiertas/recientes, autoridad, vigencia, evidencia y condición siguiente                  | ¿qué decisión requiere atención?                     |
| `Z7_BLOQUEOS_Y_DESCONOCIDOS` | conflictos, resultados desconocidos, cuarentena, evidencia faltante, frescura                        | ¿qué impide avanzar o confiar?                       |
| `Z8_COORDINACION_Y_HANDOFFS` | siguiente coordinación, referencias a runbooks, evidencia, comunicaciones y superficies propietarias | ¿qué debe coordinarse ahora y dónde continúa?        |

Ninguna zona constituye un repositorio nuevo. Todas consumen referencias y proyecciones de fuentes vigentes.

---

#### 7. Jerarquía inicial del centro de mando

Al entrar desde `CONT-UX-001` o mediante una referencia válida, la primera jerarquía visible debe priorizar:

1. identidad inequívoca del incidente;
2. indicador de incidente real o contexto de simulación;
3. estado empresarial vigente;
4. severidad y modalidad activada;
5. nivel de frescura y último cambio autoritativo;
6. bloqueos protectores o resultados desconocidos que requieran atención inmediata;
7. dirección efectiva y sustitución activa cuando exista;
8. tres a cinco elementos de mayor prioridad operacional cuando existan y estén autorizados;
9. decisión protegida pendiente de mayor urgencia cuando exista;
10. acceso a la línea de tiempo y al inventario completo de afectación.

La primera jerarquía no se transforma en un dashboard de infraestructura ni desplaza el impacto empresarial por métricas técnicas.

---

#### 8. Cabecera del incidente

La cabecera materializa el contexto de coordinación y deberá poder presentar, cuando la fuente lo suministre y el actor esté autorizado:

| Campo                   | Regla de presentación                                                                         |
| ----------------------- | --------------------------------------------------------------------------------------------- |
| referencia de incidente | estable, visible y copiable sin exponer información sensible adicional                        |
| título humano           | describe el hecho o afectación sin sustituir la clasificación propietaria                     |
| naturaleza              | utiliza clasificación vigente; no se deduce por apariencia                                    |
| estado                  | proyecta el estado canónico vigente                                                           |
| severidad               | usa `SEV-C1_CONTROLADA`, `SEV-C2_DEGRADADA`, `SEV-C3_MAYOR` o `SEV-C4_CRITICA` cuando aplique |
| impacto                 | conserva la dimensión empresarial separada de severidad                                       |
| urgencia                | conserva la dimensión temporal separada de severidad                                          |
| modalidad               | muestra la activación vigente sin inferir permisos                                            |
| alcance                 | resume procesos, sedes, servicios o dependencias incluidas                                    |
| inicio                  | conserva tiempo autoritativo de declaración o referencia correspondiente                      |
| último cambio           | identifica momento y referencia del último cambio material                                    |
| frescura                | muestra cuándo se obtuvo la proyección y si sigue siendo acreditable                          |
| simulación              | identifica de forma inequívoca si no es un incidente productivo real                          |

La cabecera no usa un único color como significado de severidad, impacto o estado.

---

#### 9. Estados y transiciones visibles

El centro de mando consume los estados del ciclo definidos por `CONT-DOM-005`. No crea una taxonomía paralela.

Reglas de presentación:

- una transición material debe quedar perceptible y vinculada a su entrada cronológica;
- un estado previo no se borra de la historia al cambiar el actual;
- el estado visible no se calcula desde una suma de métricas técnicas;
- `DESACTIVADO` no se presenta como sinónimo de `CERRADO`;
- `CERRADO` no se infiere de la ausencia de actividad reciente;
- una transición bloqueada conserva razón y condición de reevaluación;
- una actualización tardía no cambia el estado actual sin pasar por la fuente propietaria y la autoridad aplicable;
- el historial permite reconstruir cuándo cada estado estuvo vigente.

---

#### 10. Mando efectivo y sustitución

`Z2_MANDO_EFECTIVO` presenta funciones, no una jerarquía decorativa de cargos.

Como mínimo, podrá proyectar cuando sean aplicables:

- director efectivo del incidente;
- sustituto efectivo y razón de sustitución;
- coordinación de operaciones;
- responsable técnico;
- responsable protector aplicable;
- responsable de comunicaciones;
- custodio de bitácora;
- autoridad excepcional o ejecutiva requerida para la decisión material vigente;
- propietario funcional de cada proceso afectado;
- enlace con proveedor o tercero cuando exista dependencia material.

Para cada función visible se conserva:

- función ejercida;
- identidad nominal solo cuando sea necesaria y autorizada;
- alcance;
- inicio de vigencia;
- referencia de asignación o sustitución;
- estado de disponibilidad cuando esté documentado;
- último handoff aplicable.

Reglas cardinales:

```text
FUNCIÓN MOSTRADA ≠ PERMISO TÉCNICO
```

```text
PRESENCIA EN EL INCIDENTE ≠ AUTORIDAD PARA APROBAR
```

```text
SUSTITUTO DESIGNADO ≠ SEGUNDO DIRECTOR SIMULTÁNEO
```

---

#### 11. Handoff de mando

Cuando exista transferencia de mando, la experiencia conserva:

- incidente y alcance;
- función transferida;
- actor saliente;
- actor entrante;
- tiempo efectivo;
- motivo;
- autoridad o fuente de la transferencia;
- estado del incidente al momento del handoff;
- decisiones abiertas;
- bloqueos materiales;
- próxima coordinación requerida;
- evidencia o referencia asociada.

El handoff se registra como cambio cronológico. No reescribe quién ejerció el mando antes de la transferencia.

---

#### 12. Tablero de afectación empresarial

`Z3_AFECTACION` materializa una fila o unidad visual por cada servicio, proceso o capacidad afectada que el actor esté autorizado a consultar.

La unidad de afectación conserva, cuando aplique:

| Dimensión           | Contenido                                                                    |
| ------------------- | ---------------------------------------------------------------------------- |
| identidad           | referencia propietaria y nombre humano                                       |
| propietario         | función responsable del resultado empresarial                                |
| alcance territorial | sedes, áreas o población materialmente afectada                              |
| impacto             | síntesis del impacto empresarial vigente                                     |
| prioridad           | prioridad de recuperación vigente                                            |
| objetivo            | referencias a MBCO, RTO, MTPD o RPO solo cuando ya existan y sean aplicables |
| modalidad           | estrategia o modalidad vigente cuando esté decidida                          |
| operación           | condición empresarial actual proyectada desde su dominio                     |
| técnica             | resumen de recuperación técnica sin elevarlo a recuperación empresarial      |
| funcional           | estado de validación funcional cuando exista                                 |
| contingencia        | presencia de trabajo contingente o pendientes relevantes                     |
| conciliación        | situación resumida cuando sea material para recuperación                     |
| bloqueo             | principal bloqueo o incertidumbre aplicable                                  |
| responsable actual  | función que posee el siguiente resultado esperado                            |
| último cambio       | tiempo y referencia del último cambio autoritativo                           |
| siguiente hito      | siguiente resultado verificable, no una promesa inventada                    |
| referencias         | evidencia, decisión, runbook o expediente propietario según autorización     |

No se inventan objetivos numéricos para completar una fila incompleta.

---

#### 13. Agrupación de afectación

La experiencia permite agrupar la afectación por:

- prioridad de recuperación;
- proceso;
- servicio;
- sede o territorio;
- propietario funcional;
- estado empresarial;
- presencia de bloqueo;
- etapa de recuperación.

Estas agrupaciones son únicamente proyecciones visuales. Agrupar por sede no concede autoridad territorial, agrupar por propietario no concede acceso a sus recursos y ordenar por prioridad no modifica la prioridad canónica.

---

#### 14. Estado de recuperación por unidad afectada

La experiencia separa explícitamente cinco dimensiones que suelen confundirse:

```text
EJECUCIÓN TÉCNICA
≠ VALIDACIÓN TÉCNICA
≠ VALIDACIÓN FUNCIONAL
≠ REINCORPORACIÓN / CONCILIACIÓN
≠ RECUPERACIÓN EMPRESARIAL
```

Una unidad afectada puede mostrar simultáneamente:

- recuperación técnica iniciada o completada según su fuente;
- validación técnica pendiente o registrada;
- validación funcional pendiente, condicionada, positiva o negativa según fuente propietaria;
- trabajo contingente pendiente de tratamiento;
- conciliación material pendiente;
- recuperación total aún no aprobada.

La experiencia no colapsa esas dimensiones en un único porcentaje.

---

#### 15. Hitos de recuperación

`Z4_RECUPERACION` presenta hitos verificables en vez de progreso ficticio.

Un hito de recuperación deberá poder conservar:

- referencia del hito o acción propietaria;
- servicio, proceso o recurso afectado;
- objetivo o condición que intenta satisfacer;
- función responsable;
- estado propietario vigente;
- tiempo de inicio o decisión cuando exista;
- tiempo de resultado cuando exista;
- evidencia o receipt referenciado;
- dependencia de otro hito;
- bloqueo actual;
- validación técnica relacionada;
- validación funcional relacionada;
- efecto sobre el siguiente paso de coordinación.

Cuando no exista un hito autoritativo, la interfaz no inventa uno a partir de actividad técnica.

---

#### 16. Sin porcentajes de recuperación inferidos

Queda prohibido presentar como hecho:

- porcentaje de recuperación calculado por número de servicios en verde;
- porcentaje de recuperación basado solo en health checks;
- porcentaje de continuidad derivado de tickets cerrados;
- ETA calculada mediante extrapolación visual sin fuente autoritativa;
- riesgo cero por ausencia de alertas;
- readiness por existencia de un plan o runbook;
- recuperación empresarial por restore exitoso;
- cierre por inactividad reciente.

Si un dominio propietario define una métrica aprobada en el futuro, la experiencia podrá proyectarla con referencia de definición, versión, fuente y alcance, sin convertirla en regla universal.

---

#### 17. Línea de tiempo autoritativa

`Z5_LINEA_DE_TIEMPO` es una proyección cronológica del expediente y de referencias propietarias. No es un segundo ledger.

Debe poder representar, como familias de presentación y sin crear nuevos identificadores de negocio:

- señales y detecciones;
- declaraciones y activaciones;
- cambios de severidad, impacto, alcance o modalidad;
- asignaciones y transferencias de mando;
- decisiones y excepciones;
- acciones de contención o continuidad;
- hitos de recuperación;
- validaciones técnicas;
- validaciones funcionales;
- bloqueos, conflictos y resultados desconocidos;
- comunicaciones materiales;
- reincorporaciones o conciliaciones relevantes;
- desactivación, recuperación total o cierre cuando ocurran;
- correcciones y aclaraciones posteriores.

Las familias de presentación no sustituyen las categorías canónicas de las fuentes propietarias.

---

#### 18. Contrato visual de una entrada cronológica

Cada entrada material de la línea de tiempo deberá poder proyectar, cuando aplique:

| Campo              | Regla                                                                  |
| ------------------ | ---------------------------------------------------------------------- |
| referencia         | identidad correlacionable con la fuente                                |
| tiempo efectivo    | momento en que ocurrió o fue observado el hecho                        |
| tiempo de registro | momento en que el sistema recibió o registró la entrada cuando difiera |
| secuencia          | orden correlacionable dentro del expediente                            |
| familia visual     | ayuda a leer el evento sin crear una taxonomía propietaria nueva       |
| fuente             | dominio, aplicación, proveedor o expediente de origen                  |
| actor              | persona o principal técnico que produjo el hecho cuando corresponda    |
| función            | función ejercida en el incidente cuando sea material                   |
| alcance            | servicio, proceso, sede, recurso o población afectada                  |
| estado previo      | referencia cuando la transición lo requiera                            |
| estado posterior   | referencia cuando la transición lo requiera                            |
| severidad          | contexto vigente en ese momento cuando aplique                         |
| resumen            | lenguaje humano, factual y minimizado                                  |
| decisión           | referencia a decisión protegida cuando exista                          |
| autoridad          | referencia a autoridad o aprobador cuando corresponda                  |
| evidencia          | referencias, nunca secreto completo                                    |
| incertidumbre      | condición explícita si el hecho no está confirmado                     |
| corrección         | referencia a entrada corregida o aclarada                              |
| relación           | causal, dependiente, supersede o respuesta cuando la fuente la conozca |
| frescura           | calidad temporal de la proyección visible                              |

Una entrada puede omitir campos no aplicables, pero no puede fabricar valores para aparentar completitud.

---

#### 19. Orden temporal y llegada tardía

La experiencia distingue:

```text
TIEMPO EFECTIVO DEL HECHO
≠
TIEMPO DE REGISTRO
≠
TIEMPO DE VISUALIZACIÓN
```

Reglas:

1. la línea principal se organiza por tiempo efectivo cuando la fuente lo proporciona;
2. si el hecho llega tarde, se identifica como registro posterior sin ocultar su tiempo efectivo;
3. una entrada tardía puede cambiar la comprensión del incidente, pero no reescribe silenciosamente entradas previas;
4. si el tiempo efectivo no es confiable, la incertidumbre se muestra;
5. la hora de sincronización no sustituye la hora observada;
6. un desfase material debe ser visible en detalle;
7. la UI puede ofrecer orden por registro para diagnóstico, pero no lo presenta como secuencia factual por defecto.

---

#### 20. Correcciones y aclaraciones

Cuando una entrada cronológica deba corregirse:

- se conserva la entrada original;
- se crea o proyecta la corrección como un elemento relacionado;
- se identifica la razón de corrección cuando la fuente la tenga;
- se conserva el actor o fuente que emitió la corrección;
- la vista actual puede destacar la interpretación vigente sin borrar la historia;
- una corrección no modifica evidencia propietaria fuera de su dominio;
- una corrección sensible conserva los mismos controles de acceso que el contenido relacionado.

---

#### 21. Hecho, interpretación, hipótesis y decisión

El centro de mando evita presentar inferencias como hechos.

Cuando sea material, la experiencia distingue:

| Clase semántica        | Significado                                                   |
| ---------------------- | ------------------------------------------------------------- |
| hecho observado        | dato o evento respaldado por fuente identificada              |
| interpretación         | lectura humana o técnica sobre hechos disponibles             |
| hipótesis              | explicación no confirmada que requiere evidencia adicional    |
| decisión               | elección autoritativa con actor, autoridad, alcance y razones |
| recomendación asistida | propuesta de sistema o automatización que no posee autoridad  |

Una recomendación asistida nunca se presenta con la misma semántica visual que una decisión aprobada.

---

#### 22. Panel de decisiones

`Z6_DECISIONES` materializa decisiones abiertas, recientemente tomadas o materialmente relacionadas con la coordinación actual.

Cada unidad de decisión deberá poder proyectar:

- referencia de decisión;
- categoría propietaria cuando exista;
- resumen humano;
- incidente y alcance;
- estado autoritativo de la decisión;
- función que propone;
- actor proponente cuando sea necesario;
- autoridad requerida;
- autoridad efectiva resuelta cuando corresponda;
- aprobador cuando exista decisión tomada;
- razones y evidencia referenciada;
- vigencia o expiración cuando aplique;
- condiciones o límites;
- condición siguiente si fue denegada o permanece bloqueada;
- relación con una acción, comunicación, excepción o recuperación;
- tiempo efectivo y último cambio.

El panel no inventa estados de decisión. Consume los estados propietarios disponibles.

---

#### 23. Acciones protegidas desde el centro de mando

Una acción protegida puede ser iniciada desde esta experiencia únicamente si:

1. existe contrato canónico para la acción;
2. el actor efectivo está autenticado;
3. el contexto aplicable está vigente;
4. el recurso exacto está identificado;
5. la autoridad se evalúa por el mecanismo propietario;
6. el estado del incidente permite la acción;
7. el alcance no excede la decisión vigente;
8. la acción no depende de un filtro visual como fuente de autoridad;
9. la decisión se ejecuta en la superficie o servicio propietario;
10. el resultado vuelve con referencia correlacionable.

Ocultar un botón no sustituye enforcement. Mostrar un botón tampoco constituye allow.

---

#### 24. Decisiones pendientes y bloqueo de autoridad

Cuando una decisión no pueda resolverse porque falta autoridad, delegación vigente, evidencia o condición previa, la experiencia muestra:

- decisión requerida;
- motivo del bloqueo;
- autoridad o función que debe resolverla cuando esté identificada;
- alcance afectado;
- condición verificable de salida;
- tiempo desde el último cambio cuando sea útil;
- efecto sobre recuperación o continuidad;
- enlace autorizado a la evidencia o superficie correspondiente.

La ausencia del aprobador no se traduce en aprobación por silencio.

---

#### 25. Bloqueos y desconocidos

`Z7_BLOQUEOS_Y_DESCONOCIDOS` prioriza condiciones que impiden confiar en la recuperación o avanzar a una transición protegida.

Cuando existan, la vista debe hacer visibles de forma inequívoca:

- `RESULT_UNKNOWN`;
- `CONFLICT`;
- `QUARANTINED`;
- `RECONCILIATION_REQUIRED`;
- validación técnica obligatoria ausente;
- validación funcional obligatoria ausente;
- evidencia obligatoria no enlazada;
- control protector incumplido;
- dependencia externa sin estado suficiente;
- autoridad requerida no resoluble;
- fuente desactualizada o frescura no acreditable;
- efecto downstream material pendiente;
- trabajo contingente sin destino cuando sea relevante para recuperación;
- diferencia material entre fuentes propietarias.

Un bloqueo conserva propietario y condición de salida cuando esa información exista en la fuente.

---

#### 26. Tratamiento de `RESULT_UNKNOWN`

`RESULT_UNKNOWN` nunca se representa como fallo simple ni como éxito implícito.

La experiencia debe:

- identificar la operación o efecto cuya resolución es desconocida;
- impedir que el estado visual sugiera repetición segura sin verificación;
- mostrar la referencia de correlación disponible;
- presentar la acción de recuperación o investigación únicamente cuando el contrato propietario la habilite;
- conservar la relación con decisiones y conciliaciones posteriores;
- mantener el bloqueo material hasta resolución o disposición autoritativa.

---

#### 27. Tratamiento de conflicto y conciliación

Un `CONFLICT` o `RECONCILIATION_REQUIRED` material se presenta con:

- dominios o efectos involucrados;
- referencia de los hechos en disputa;
- propietario de cada extremo cuando esté disponible;
- estado de resolución;
- decisión requerida;
- evidencia relacionada;
- impacto sobre recuperación o cierre;
- siguiente condición verificable.

El centro de mando no resuelve un conflicto mediante preferencia visual entre dos fuentes.

---

#### 28. Frescura de información

Toda proyección material deberá permitir distinguir:

- información obtenida recientemente de su fuente;
- último valor conocido cuya antigüedad es visible;
- fuente temporalmente no accesible;
- información que llegó tarde;
- información cuya versión fue superada;
- dato corregido después de la primera observación.

Reglas:

```text
SIN ACTUALIZACIÓN
≠ SIN CAMBIOS
```

```text
SIN ALERTAS NUEVAS
≠ OPERACIÓN NORMAL
```

```text
ÚLTIMO DATO CONOCIDO
≠ DATO ACTUAL CONFIRMADO
```

La pérdida de conexión o de actualización en vivo genera una señal de frescura degradada, no un cambio de estado empresarial.

---

#### 29. Actualización en vivo

Cuando una implementación futura utilice mecanismos en vivo, la experiencia deberá conservar estas reglas documentales:

1. la actualización recibida se correlaciona por identidad antes de reflejarse;
2. un duplicado no crea otra entrada material;
3. una llegada fuera de orden conserva tiempos efectivos;
4. el foco del usuario no salta de forma destructiva por cada actualización;
5. una decisión en revisión no cambia de posición sin indicar que recibió un cambio material;
6. una reconexión vuelve a validar sesión y autorización;
7. una reconexión no reejecuta automáticamente mutaciones fallidas;
8. la ausencia de canal en vivo se muestra como problema de frescura;
9. una actualización no autoaprueba decisiones;
10. una actualización no reemplaza la fuente propietaria.

Esta tarea no selecciona ni implementa una tecnología de tiempo real.

---

#### 30. Coordinación siguiente

`Z8_COORDINACION_Y_HANDOFFS` destaca el siguiente resultado material que requiere coordinación, no una lista genérica de tareas.

Puede proyectar, según contexto:

- decisión pendiente;
- hito de recuperación;
- validación técnica;
- validación funcional;
- intervención protectora;
- resolución de conflicto;
- conciliación;
- comunicación pendiente de aprobación;
- revisión de runbook;
- entrega de mando;
- verificación de dependencia externa;
- tratamiento de evidencia faltante.

La coordinación siguiente identifica función responsable y fuente propietaria. No crea un permiso nuevo para ejecutar la acción.

---

#### 31. Handoffs especializados

El centro de mando mantiene enlaces semánticos hacia materias que pertenecen a tareas posteriores del mismo mini-bloque.

| Materia                                    | Handoff propietario             | Qué conserva el centro de mando                                              |
| ------------------------------------------ | ------------------------------- | ---------------------------------------------------------------------------- |
| runbooks y checklists                      | `CONT-UX-003`                   | referencia, versión aplicable, rol/proceso/sede/modalidad y estado de uso    |
| captura durante la falla y reincorporación | `CONT-UX-004`                   | conteos, bloqueos, referencias y estado resumido                             |
| backup, restore, failover y validación     | `CONT-UX-005`                   | hitos, estado resumido, validaciones y pendientes                            |
| comunicaciones                             | `CONT-UX-006`                   | audiencia, estado de preparación/aprobación/emisión y referencia             |
| ejercicios, revisión y readiness           | `CONT-UX-007`                   | contexto de simulación y referencia, sin absorber la experiencia propietaria |
| health y degradación entre aplicaciones    | `CONT-INT-001` y `CONT-INT-002` | proyección correlacionada del estado recibido                                |
| dependencias externas                      | `CONT-INT-003`                  | estado, receipt y bloqueo relevante                                          |
| replay, reincorporación y retorno normal   | `CONT-INT-004`                  | resumen de pendientes, conflictos y conciliación                             |

Cada handoff conserva incidente, alcance y referencia que originó la navegación. La superficie destino vuelve a resolver autorización.

---

#### 32. Runbooks dentro del centro de mando

El centro de mando puede mostrar:

- runbook aplicable;
- versión;
- proceso o servicio relacionado;
- rol o función destinataria;
- modalidad o escenario aplicable;
- último estado conocido de ejecución;
- evidencia o referencias de pasos materiales cuando la fuente las suministre.

No define pasos, checklists ni contratos de ejecución de runbooks; esa responsabilidad permanece en `CONT-UX-003`.

---

#### 33. Trabajo contingente y reincorporación

El centro de mando puede sintetizar:

- unidades de trabajo contingente detectadas;
- unidades admitidas;
- unidades pendientes de decisión;
- conflictos;
- resultados desconocidos;
- conciliaciones requeridas;
- bloqueos de retorno normal.

No implementa la captura, corrección, admisión o reincorporación detallada; esa experiencia permanece en `CONT-UX-004` y los contratos propietarios.

---

#### 34. Restore y failover

El centro de mando puede proyectar:

- recurso o servicio en recuperación;
- estrategia autorizada;
- estado técnico informado;
- validación técnica;
- validación funcional;
- fuente activa cuando sea relevante;
- bloqueo o riesgo de retorno;
- evidencia o receipt referenciado;
- impacto sobre el proceso empresarial.

No se convierte en consola de respaldo, restore, failover o failback. El detalle permanece en `CONT-UX-005`.

---

#### 35. Comunicaciones

El centro de mando puede mostrar, de forma minimizada:

- clase o propósito de comunicación;
- audiencia o grupo funcional;
- estado propietario;
- responsable de preparación;
- autoridad de aprobación cuando aplique;
- momento de última emisión;
- confirmación o escalamiento pendiente;
- referencia a la comunicación.

No contiene la experiencia completa de plantillas, edición, canales, confirmación o escalamiento; esa materia pertenece a `CONT-UX-006`.

---

#### 36. Proveedores y dependencias externas

Una dependencia externa se presenta con:

- proveedor o función externa mínima necesaria;
- servicio/dependencia afectada;
- alcance del impacto;
- estado informado por el tercero;
- tiempo y fuente de la última actualización;
- receipt o evidencia referenciada cuando exista;
- responsable interno de aceptación;
- efecto sobre continuidad y recuperación;
- siguiente coordinación requerida.

Regla cardinal:

```text
PROVEEDOR RESTABLECIDO
≠ PROCESO VENTO RECUPERADO
```

El estado de un tercero es un insumo, no una aprobación empresarial.

---

#### 37. Evidencia

Las referencias a evidencia dentro del centro de mando deben:

- usar identificadores o referencias protegidas;
- mostrar metadatos mínimos necesarios;
- conservar clasificación y propósito;
- volver a resolver autorización al abrir el contenido;
- evitar miniaturas o fragmentos sensibles cuando no sean necesarios;
- impedir que un contador revele evidencia fuera de alcance;
- preservar la relación entre decisión, evento, validación y evidencia;
- distinguir evidencia disponible de evidencia validada;
- conservar origen e integridad cuando la fuente lo permita.

El centro de mando no es un repositorio paralelo de evidencia.

---

#### 38. Búsqueda y filtros

La búsqueda y los filtros pueden operar sobre el universo ya autorizado y visible.

Filtros permitidos conceptualmente incluyen:

- servicio o proceso;
- sede o territorio;
- prioridad;
- severidad contextual;
- etapa de recuperación;
- tipo de evento visual;
- función responsable;
- estado de decisión;
- presencia de bloqueo;
- periodo de tiempo.

Reglas:

- un filtro no crea contexto operativo;
- un filtro no aumenta alcance;
- una búsqueda no revela títulos, fragmentos, nombres o contadores de elementos no autorizados;
- seleccionar una sede no concede autoridad sobre esa sede;
- limpiar filtros no amplía automáticamente el universo autorizado;
- las vistas guardadas son preferencias de presentación, no decisiones de continuidad.

---

#### 39. Densidad y divulgación progresiva

La experiencia adopta tres niveles de profundidad:

1. **situación inmediata:** cabecera, mando, bloqueos, prioridades y siguiente coordinación;
2. **coordinación operacional:** afectación, recuperación, decisiones y línea de tiempo resumida;
3. **detalle trazable:** referencias, tiempos, evidencia, autoridad, relaciones y handoffs propietarios.

El nivel inicial evita tablas masivas. El detalle se revela por selección explícita sin ocultar los bloqueos críticos.

---

#### 40. Estado vacío y ausencia de datos

La experiencia diferencia:

- no existen elementos dentro del alcance;
- existen elementos pero el actor no está autorizado a verlos;
- la fuente no responde;
- la fuente responde sin datos actuales;
- la información aún no fue materializada por su dominio;
- un filtro oculta resultados;
- existe un error técnico de proyección.

Nunca se usa `0` como sustituto universal ante una falla de lectura.

---

#### 41. Errores y degradación de la experiencia

Un fallo parcial debe comunicar en lenguaje humano:

- qué parte no pudo actualizarse;
- qué información permanece disponible;
- qué antigüedad tiene el último dato conocido;
- si una acción protegida sigue disponible o debe revalidarse;
- cómo actualizar o continuar por la superficie propietaria cuando exista alternativa autorizada;
- qué no debe asumirse del estado actual.

Un error de red no elimina el incidente ni transforma un bloqueo en normalidad.

---

#### 42. Responsive y dispositivos

La jerarquía semántica se conserva entre tamaños.

**Escritorio:**
- permite coexistencia de afectación, recuperación, decisiones y línea de tiempo;
- puede usar panel de detalle lateral o contextual sin perder cabecera y bloqueos.

**Tablet:**
- prioriza cabecera, mando, bloqueos y afectación;
- permite alternar recuperación, decisiones y cronología con contexto persistente.

**Móvil:**
- apila en orden: identidad/estado, bloqueos, siguiente coordinación, mando, afectación prioritaria, decisiones, recuperación y cronología;
- evita mostrar una tabla técnica completa comprimida;
- preserva texto explícito de severidad y estado.

Ningún dispositivo obtiene más autoridad por su factor de forma.

---

#### 43. Accesibilidad

La experiencia debe diseñarse para:

- navegación completa por teclado;
- foco visible y estable;
- lectura estructurada por tecnologías asistivas;
- encabezados y regiones semánticas;
- severidad y bloqueos expresados con texto además de color;
- estados no dependientes de animación;
- timestamps legibles y con contexto temporal;
- controles críticos con etiquetas inequívocas;
- zoom sin pérdida de acciones o información material;
- anuncios no intrusivos de cambios materiales cuando una implementación en vivo los incorpore;
- tablas o listas con equivalentes legibles en pantallas reducidas.

---

#### 44. Protección de información sensible

El centro de mando aplica minimización por defecto.

No se muestran en la primera jerarquía:

- secretos completos;
- tokens;
- credenciales;
- llaves de recuperación;
- contenido íntegro de evidencia sensible;
- listas nominales completas de contacto cuando basta la función;
- datos personales no necesarios para coordinar;
- detalles de investigación cuya divulgación no sea necesaria;
- mensajes externos completos cuando una referencia y estado sean suficientes.

El acceso a detalle sensible se resuelve en su superficie propietaria con finalidad, actor, recurso y acción exacta.

---

#### 45. Autoridad y acciones visibles

La experiencia separa tres capas:

```text
VISIBILIDAD
→ qué puede conocer el actor

CAPACIDAD DE INICIAR
→ qué acción puede solicitar desde la experiencia

AUTORIDAD EFECTIVA
→ qué decisión puede producir válidamente el sistema propietario
```

No se deriva autoridad desde:

- cargo;
- presencia en el mando;
- rol local;
- acceso a VISO;
- uso de un dispositivo compartido;
- haber creado el incidente;
- haber ejecutado la recuperación;
- ser propietario técnico;
- ser proveedor;
- haber recibido una notificación.

---

#### 46. Recuperación total, desactivación y cierre

La experiencia presenta separadamente:

- estado de recuperación por proceso;
- recuperación total propuesta;
- recuperación total aprobada cuando exista;
- desactivación de coordinación extraordinaria;
- cierre del incidente;
- revisión posterior cuando corresponda.

Reglas:

```text
RECUPERACIÓN TÉCNICA ≠ RECUPERACIÓN TOTAL
```

```text
RECUPERACIÓN TOTAL ≠ DESACTIVACIÓN
```

```text
DESACTIVACIÓN ≠ CIERRE
```

```text
CIERRE ≠ REVISIÓN POSTERIOR CONCLUIDA
```

El centro de mando no habilita una apariencia de cierre si existen bloqueos materiales que el contrato prohíbe.

---

#### 47. Condiciones que deben impedir una apariencia de cierre sano

Si cualquiera de las siguientes condiciones existe y es material para el alcance, debe permanecer visible y no puede ocultarse mediante agrupación, filtro o estado técnico favorable:

- `RESULT_UNKNOWN` abierto;
- `CONFLICT` abierto;
- `QUARANTINED` sin decisión;
- `RECONCILIATION_REQUIRED` abierto;
- efecto empresarial sin representación o disposición;
- evidencia obligatoria faltante;
- efecto downstream material pendiente;
- trabajo contingente sin destino;
- validación funcional obligatoria ausente;
- control protector incumplido;
- recuperación total requerida aún no aprobada;
- autoridad de cierre no vigente o no resoluble.

La experiencia puede mostrar una condición de salida, pero no puede degradar el bloqueo para liberar visualmente el incidente.

---

#### 48. Incidente real y simulación

La superficie debe distinguir inequívocamente:

- incidente real;
- ejercicio;
- simulación técnica;
- demostración o entorno no productivo cuando el contexto lo identifique.

En simulación:

- la autoridad simulada no se interpreta como permiso productivo;
- los estados simulados no se mezclan con incidentes reales;
- una acción real accidental se trata mediante los procesos reales aplicables;
- la experiencia de diseño y revisión del ejercicio permanece en `CONT-UX-007`.

---

#### 49. Métricas permitidas y límites

El centro de mando puede mostrar conteos o medidas solo cuando:

- existe definición propietaria;
- la población está clara;
- el alcance está autorizado;
- la fuente y la frescura están disponibles;
- el valor no implica por sí solo una conclusión empresarial que la fuente no haya declarado.

Ejemplos admisibles son conteos de unidades abiertas, servicios afectados o decisiones pendientes dentro del alcance autorizado. Un conteo no se convierte en porcentaje de recuperación si no existe contrato aprobado para ese indicador.

---

#### 50. Estados documentales de esta tarea

| Elemento                                        | Estado documental  | Alcance                                            |
| ----------------------------------------------- | ------------------ | -------------------------------------------------- |
| arquitectura de información del centro de mando | `ESPECIFICADO`     | definida por esta tarea                            |
| jerarquía y zonas semánticas                    | `ESPECIFICADO`     | 8 zonas obligatorias                               |
| contrato de afectación                          | `ESPECIFICADO`     | proyección por servicio/proceso/sede               |
| contrato de recuperación                        | `ESPECIFICADO`     | separación técnica, funcional y empresarial        |
| contrato de cronología                          | `ESPECIFICADO`     | eventos y decisiones correlacionados               |
| contrato de mando                               | `ESPECIFICADO`     | funciones, sustitución y handoff                   |
| contrato de bloqueos                            | `ESPECIFICADO`     | desconocidos, conflicto, cuarentena y conciliación |
| implementación de interfaz                      | `FUERA_DE_ALCANCE` | no autorizada en esta tarea documental             |
| integración en vivo                             | `FUERA_DE_ALCANCE` | no autorizada en esta tarea documental             |
| ejecución de incidentes reales                  | `FUERA_DE_ALCANCE` | no se realiza en esta tarea                        |
| evidencia operativa nueva                       | `FUERA_DE_ALCANCE` | no se fabrica ni ejecuta                           |

No se declara `IMPLEMENTADO` ni `VALIDADO` ningún comportamiento físico.

---

#### 51. Matriz de información por función

La densidad se adapta a la función ejercida y a la autorización efectiva.

| Función                          | Prioridad de información                                                        | No implica                                 |
| -------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------ |
| `RESPONSABLE_DE_CONTINUIDAD`     | estado, mando, impacto, decisiones, bloqueos, recuperación, cronología          | autoridad universal sobre dominios         |
| `CONTINUADOR_DE_CONTINUIDAD`     | mismo alcance funcional solo durante sustitución vigente                        | coexistencia automática de dos directores  |
| `GERENCIA_GENERAL`               | impacto, prioridades, decisiones protegidas, recuperación total, cierre         | ejecución técnica                          |
| `GOBIERNO_Y_PROPIEDAD`           | impacto material, decisiones de gobierno, riesgo y cierre según autoridad       | validación funcional de todos los procesos |
| `COORDINACION_DE_OPERACIONES`    | operación mínima, afectación por sede/proceso, bloqueos y handoffs              | aprobación ejecutiva por defecto           |
| `RESPONSABLE_TECNOLOGICO`        | dependencias técnicas, recuperación, validación técnica y evidencias aplicables | recuperación empresarial                   |
| `RESPONSABLE_DEL_PROCESO`        | resultado empresarial, MBCO, validación funcional, contingencia y conciliación  | autoridad sobre otros procesos             |
| `GERENCIA_O_SUPERVISION_DE_SEDE` | afectación territorial y coordinación aplicable                                 | alcance global por usar la pantalla        |
| `EQUIPO_OPERATIVO_DEL_AREA`      | tareas y estado mínimo necesario para ejecutar su parte                         | acceso al expediente ejecutivo completo    |
| proveedor o tercero              | dependencia y evidencia de su contrato                                          | autoridad empresarial de Vento             |

La matriz describe prioridad de experiencia, no permisos físicos.

---

#### 52. Casos de lectura determinista

La experiencia debe permitir interpretar correctamente los siguientes escenarios sin mezclar conceptos:

| Escenario                                        | Presentación requerida                                                                    |
| ------------------------------------------------ | ----------------------------------------------------------------------------------------- |
| servicio técnico arriba, proceso no validado     | técnico favorable + validación funcional pendiente; no recuperado empresarialmente        |
| restore completado, conciliación abierta         | hito técnico completado + bloqueo de conciliación                                         |
| proveedor estable, dependencia interna bloqueada | estado externo favorable + proceso Vento aún afectado                                     |
| incidente desactivado con acción de mejora       | `DESACTIVADO` + pendiente posterior identificado; no implica cierre si faltan condiciones |
| `RESULT_UNKNOWN` en operación material           | bloqueo explícito, correlación e investigación/decisión pendiente                         |
| información en vivo interrumpida                 | último dato conocido + frescura degradada; sin cambio de estado inferido                  |
| nuevo director efectivo                          | handoff cronológico + función actual; historia preservada                                 |
| decisión denegada                                | decisión visible con razones y condición de reevaluación                                  |
| dato corregido                                   | entrada original + corrección relacionada                                                 |
| simulación                                       | contexto inequívoco; acciones simuladas no habilitan producción                           |

---

#### 53. Prohibiciones de experiencia

Queda prohibido diseñar el centro de mando de forma que:

- mezcle severidad con prioridad de recuperación;
- mezcle impacto con urgencia;
- use health técnico como estado empresarial;
- calcule recuperación total por mayoría de indicadores;
- oculte desconocidos para simplificar la vista;
- borre eventos corregidos;
- ordene únicamente por llegada técnica y lo presente como historia factual;
- permita que un filtro modifique autoridad;
- muestre evidencia sensible sin nueva autorización;
- convierta el rol mostrado en permiso;
- convierta proveedor en aprobador;
- convierta automatización en autoridad empresarial;
- permita que el ejecutor se autocertifique por la misma acción crítica;
- trate una acción mutante fallida como segura para repetición automática;
- muestre un cero cuando la fuente no respondió;
- muestre verde global por ausencia de alertas;
- invente ETA;
- invente objetivos de recuperación;
- invente nombres de servicios o procesos;
- invente personas responsables;
- invente timestamps;
- invente evidencia;
- cree un segundo registro de incidente desconectado de `VPROC-0062`.

---

#### 54. Handoffs obligatorios de esta tarea

| Materia posterior                                                   | Propietario                     | Condición de salida documental                                           |
| ------------------------------------------------------------------- | ------------------------------- | ------------------------------------------------------------------------ |
| pasos guiados, runbooks y checklists por rol/proceso/sede/modalidad | `CONT-UX-003`                   | antes de diseñar interacción detallada de ejecución guiada               |
| captura controlada y reincorporación humana                         | `CONT-UX-004`                   | antes de diseñar formularios y revisión detallada de trabajo contingente |
| backup, restore, failover, validación y pendientes                  | `CONT-UX-005`                   | antes de diseñar seguimiento especializado de recuperación técnica       |
| comunicación interna/externa, plantillas, canales y confirmación    | `CONT-UX-006`                   | antes de diseñar interacción especializada de comunicaciones             |
| ejercicios, revisión, acciones y readiness                          | `CONT-UX-007`                   | antes de diseñar experiencia de simulación y aprendizaje                 |
| health, degradación y propagación de incidente                      | `CONT-INT-001` y `CONT-INT-002` | antes de automatizar proyecciones entre aplicaciones                     |
| dependencias y proveedores externos                                 | `CONT-INT-003`                  | antes de automatizar estados/receipts externos                           |
| replay, reincorporación, idempotencia, conciliación y retorno       | `CONT-INT-004`                  | antes de automatizar retorno productivo del trabajo contingente          |

No se crea ninguna tarea nueva y no queda un pendiente documental sin propietario entre las materias detectadas.

---

#### 55. Cobertura vigente de prueba

La conducta que esta tarea proyecta ya dispone de cobertura vigente:

- `TREQ-CONT-001` protege análisis de impacto, dependencias, objetivos y prioridad de recuperación y asigna responsabilidad a `CONT-UX-002`;
- `TREQ-CONT-002` protege clasificación del incidente, responsables, decisiones, escalamiento, estado, recuperación, autoridad, sustitución y bitácora y asigna responsabilidad a `CONT-UX-002`;
- `TREQ-UX-001` protege comprensión de estado, tarea y siguiente acción;
- `TREQ-UX-002` protege errores, bloqueos, reintentos y recuperación sin duplicar efectos;
- `TREQ-UX-003` protege minimización, densidad y acciones adecuadas al actor y su autorización;
- `TREQ-UX-005` protege fuente de verdad, estado confirmado o pendiente, actor, último cambio y ausencia de copias competidoras;
- `TREQ-UX-006` protege continuidad de experiencia ante fallos de red, energía, sesión, dispositivo o proveedor;
- `TREQ-UX-010` protege contexto, versión, estado, actor, segregación e impacto en superficies administrativas cuando apliquen.

Esta tarea especializa la presentación y coordinación de esas obligaciones en el centro de mando sin introducir un comportamiento ejecutable nuevo fuera de la cobertura existente.

---

#### 56. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea define una proyección documental de estados, impacto, mando, cronología, recuperación, bloqueos y decisiones que ya están protegidos por requisitos vigentes de continuidad y experiencia. No introduce un nuevo efecto empresarial, transición, permiso, integración, cálculo o regla de integridad que requiera un requisito adicional.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 57. Criterios de aceptación

1. La tarea conserva `CONT-UX-001` como anterior aprobada.
2. La tarea reserva únicamente `CONT-UX-003` como siguiente.
3. La tarea permanece exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`.
4. La tarea no crea código.
5. La tarea no crea migraciones.
6. La tarea no crea DDL.
7. La tarea no crea DML.
8. La tarea no crea RLS.
9. La tarea no crea RPC.
10. La tarea no crea datos productivos.
11. La tarea no crea permisos.
12. La tarea no crea roles.
13. La tarea no crea secretos.
14. La tarea no ejecuta incidentes reales.
15. La tarea no ejecuta restore.
16. La tarea no ejecuta failover.
17. La tarea no ejecuta comunicaciones reales.
18. La tarea no declara readiness.
19. La tarea no declara recuperación real.
20. La tarea no declara validación operativa inexistente.
21. El centro de mando es profundidad operacional del inicio ejecutivo.
22. El centro de mando no crea otra portada ejecutiva competidora.
23. El centro de mando consume `VPROC-0062` como expediente transversal.
24. VISO conserva propiedad del expediente transversal de continuidad.
25. Los dominios conservan propiedad de sus hechos.
26. La vista es una proyección coordinadora y no una fuente de verdad nueva.
27. Se materializan exactamente ocho zonas semánticas obligatorias.
28. La posición física de las zonas puede variar por dispositivo.
29. El significado de las zonas no varía por dispositivo.
30. La identidad del incidente permanece visible en la primera jerarquía.
31. El contexto real o de simulación permanece visible en la primera jerarquía.
32. El estado empresarial vigente permanece visible en la primera jerarquía.
33. La severidad permanece visible en la primera jerarquía.
34. La modalidad de activación permanece distinguible.
35. La frescura permanece visible cuando sea material.
36. Un bloqueo protector crítico no queda oculto por el layout.
37. La dirección efectiva del incidente puede identificarse.
38. La sustitución activa puede identificarse.
39. La función se presenta antes que la identidad nominal cuando sea suficiente.
40. La identidad nominal se minimiza cuando no es necesaria.
41. La función visible no concede permiso técnico.
42. Presencia en el incidente no concede aprobación.
43. Un sustituto no crea dos directores efectivos para el mismo alcance y momento.
44. Un handoff conserva actor saliente.
45. Un handoff conserva actor entrante.
46. Un handoff conserva tiempo efectivo.
47. Un handoff conserva motivo cuando la fuente lo tenga.
48. Un handoff conserva alcance.
49. Un handoff conserva decisiones abiertas relevantes.
50. Un handoff no reescribe la historia del mando previo.
51. Cada unidad afectada conserva una identidad propietaria.
52. Cada unidad afectada conserva propietario funcional cuando aplique.
53. Cada unidad afectada conserva alcance territorial cuando aplique.
54. Cada unidad afectada conserva impacto empresarial cuando aplique.
55. Cada unidad afectada conserva prioridad de recuperación cuando aplique.
56. MBCO se muestra solo si existe en la fuente y aplica.
57. RTO se muestra solo si existe en la fuente y aplica.
58. MTPD se muestra solo si existe en la fuente y aplica.
59. RPO se muestra solo si existe en la fuente y aplica.
60. Ningún objetivo numérico se inventa para completar una fila.
61. Estado técnico y estado empresarial permanecen separados.
62. Validación técnica y validación funcional permanecen separadas.
63. Reincorporación y validación funcional permanecen separadas.
64. Conciliación y recuperación total permanecen separadas.
65. Restore exitoso no equivale a recuperación empresarial.
66. Health favorable no equivale a recuperación empresarial.
67. Receipt externo no equivale a recuperación empresarial.
68. Una validación técnica positiva no sustituye la funcional.
69. Una validación funcional pendiente permanece visible cuando es material.
70. Trabajo contingente pendiente puede permanecer visible cuando afecta recuperación.
71. Conciliación pendiente puede permanecer visible cuando afecta recuperación.
72. Recuperación total no se infiere de componentes individuales.
73. Los hitos de recuperación se basan en resultados verificables.
74. Un hito conserva recurso o proceso relacionado.
75. Un hito conserva función responsable cuando la fuente la define.
76. Un hito conserva evidencia o receipt referenciado cuando existe.
77. Un hito conserva bloqueo cuando existe.
78. Un hito no se inventa desde actividad técnica no contractual.
79. No se calcula porcentaje de recuperación por servicios en verde.
80. No se calcula porcentaje de recuperación por tickets cerrados.
81. No se calcula salud empresarial por health técnico.
82. No se inventa ETA por extrapolación visual.
83. No se declara riesgo cero por ausencia de alertas.
84. No se declara readiness por existencia documental.
85. La línea de tiempo no se convierte en un segundo ledger.
86. Cada entrada cronológica conserva referencia a su fuente.
87. Cada entrada material puede conservar tiempo efectivo.
88. Cada entrada material puede conservar tiempo de registro separado.
89. Tiempo de visualización no sustituye tiempo efectivo.
90. Una llegada tardía conserva su tiempo efectivo.
91. Una llegada tardía se identifica como registrada posteriormente cuando aplique.
92. Una entrada tardía no reescribe silenciosamente el historial.
93. Una corrección conserva la entrada original.
94. Una corrección crea una relación con la entrada previa.
95. Una corrección conserva fuente o actor cuando estén disponibles.
96. La vista puede destacar la interpretación vigente sin borrar historia.
97. Las familias visuales no crean un catálogo de eventos nuevo.
98. La línea de tiempo puede proyectar señales.
99. La línea de tiempo puede proyectar declaraciones y activaciones.
100. La línea de tiempo puede proyectar cambios de severidad.
101. La línea de tiempo puede proyectar cambios de alcance.
102. La línea de tiempo puede proyectar handoffs de mando.
103. La línea de tiempo puede proyectar decisiones y excepciones.
104. La línea de tiempo puede proyectar acciones de continuidad.
105. La línea de tiempo puede proyectar hitos de recuperación.
106. La línea de tiempo puede proyectar validaciones técnicas.
107. La línea de tiempo puede proyectar validaciones funcionales.
108. La línea de tiempo puede proyectar bloqueos y desconocidos.
109. La línea de tiempo puede proyectar comunicaciones materiales.
110. La línea de tiempo puede proyectar conciliaciones relevantes.
111. La línea de tiempo puede proyectar desactivación y cierre cuando ocurran.
112. Hechos observados pueden distinguirse de interpretaciones.
113. Interpretaciones pueden distinguirse de hipótesis.
114. Hipótesis pueden distinguirse de decisiones.
115. Recomendaciones asistidas se distinguen de decisiones autoritativas.
116. Una automatización no se presenta como aprobador empresarial.
117. El panel de decisiones conserva referencia de decisión.
118. El panel de decisiones conserva alcance.
119. El panel de decisiones conserva estado autoritativo cuando exista.
120. El panel de decisiones conserva función proponente cuando corresponda.
121. El panel de decisiones conserva autoridad requerida cuando corresponda.
122. El panel de decisiones conserva aprobador cuando exista.
123. El panel de decisiones conserva vigencia cuando aplique.
124. El panel de decisiones conserva condición siguiente cuando esté bloqueada o denegada.
125. El panel de decisiones no crea estados propietarios nuevos.
126. Mostrar una acción no equivale a autorizarla.
127. Ocultar una acción no sustituye enforcement.
128. Una acción protegida vuelve a resolver autenticación y contexto aplicables.
129. Una acción protegida identifica el recurso exacto.
130. Una acción protegida evalúa autoridad por el mecanismo propietario.
131. Un filtro visual no sirve como fuente de autoridad.
132. Una decisión protegida no se aprueba por silencio.
133. Una decisión bloqueada conserva motivo.
134. Una decisión bloqueada conserva condición verificable de salida cuando existe.
135. `RESULT_UNKNOWN` se presenta explícitamente.
136. `RESULT_UNKNOWN` no se convierte en éxito implícito.
137. `RESULT_UNKNOWN` no se convierte en repetición automática segura.
138. `CONFLICT` se presenta explícitamente cuando es material.
139. `QUARANTINED` se presenta explícitamente cuando es material.
140. `RECONCILIATION_REQUIRED` se presenta explícitamente cuando es material.
141. Validación técnica obligatoria ausente puede bloquear la confianza visual.
142. Validación funcional obligatoria ausente puede bloquear la confianza visual.
143. Evidencia obligatoria faltante puede permanecer visible.
144. Un control protector incumplido no se oculta.
145. Una autoridad no resoluble no se representa como disponible.
146. Una fuente desactualizada no se representa como actual.
147. Un efecto downstream pendiente puede permanecer visible.
148. Un conflicto no se resuelve por preferencia visual entre fuentes.
149. `SIN ACTUALIZACIÓN` no se interpreta como `SIN CAMBIOS`.
150. `SIN ALERTAS NUEVAS` no se interpreta como `OPERACIÓN NORMAL`.
151. El último dato conocido indica su antigüedad cuando sea material.
152. La pérdida de actualización en vivo degrada frescura.
153. La pérdida de actualización en vivo no cambia el estado empresarial por inferencia.
154. Una actualización duplicada no crea otro evento material.
155. Una llegada fuera de orden conserva sus tiempos.
156. Una actualización no autoaprueba decisiones.
157. Una reconexión revalida sesión y autorización.
158. Una reconexión no reejecuta automáticamente mutaciones fallidas.
159. Una actualización material no destruye el foco de teclado.
160. El siguiente punto crítico de coordinación puede identificarse.
161. El siguiente punto crítico conserva función responsable cuando exista.
162. La coordinación siguiente no crea permiso para ejecutarla.
163. El centro de mando enlaza runbooks sin definir sus pasos.
164. `CONT-UX-003` conserva runbooks y checklists detallados.
165. El centro de mando resume trabajo contingente sin absorber captura detallada.
166. `CONT-UX-004` conserva captura y reincorporación detalladas.
167. El centro de mando resume backup y restore sin absorber su seguimiento especializado.
168. `CONT-UX-005` conserva backup, restore, failover, validación y pendientes detallados.
169. El centro de mando resume comunicaciones sin absorber plantillas y canales.
170. `CONT-UX-006` conserva comunicaciones detalladas.
171. El centro de mando distingue ejercicio e incidente real.
172. `CONT-UX-007` conserva ejercicios, revisión y readiness.
173. `CONT-INT-001` y `CONT-INT-002` conservan automatización de health y degradación entre aplicaciones.
174. `CONT-INT-003` conserva dependencias externas.
175. `CONT-INT-004` conserva replay, reincorporación y retorno normal.
176. Todo handoff conserva referencia del incidente.
177. Todo handoff conserva alcance relevante.
178. Todo handoff vuelve a resolver autorización.
179. Una referencia a evidencia no concede lectura de evidencia.
180. El centro de mando no almacena secretos completos.
181. El centro de mando no almacena tokens completos.
182. El centro de mando no almacena credenciales completas.
183. La primera jerarquía minimiza datos personales.
184. La primera jerarquía minimiza evidencia sensible.
185. Un contador no revela objetos no autorizados.
186. Una búsqueda no enumera información sensible fuera de alcance.
187. Un error de autorización no revela fragmentos sensibles.
188. Agrupar por sede no concede autoridad territorial.
189. Agrupar por responsable no concede permisos de su dominio.
190. Ordenar por prioridad no modifica prioridad canónica.
191. Una vista guardada es preferencia, no decisión.
192. La experiencia distingue fuente sin datos de fuente inaccesible.
193. La experiencia distingue filtro vacío de universo vacío.
194. Un error de lectura no se representa como cero.
195. Un fallo parcial indica qué información permanece disponible.
196. Un fallo parcial indica la antigüedad del último dato cuando sea material.
197. Un fallo parcial no borra el incidente.
198. Escritorio conserva coordinación multizona sin saturación técnica.
199. Tablet conserva cabecera, mando, bloqueos y afectación prioritaria.
200. Móvil conserva identidad, bloqueos y siguiente coordinación antes del detalle.
201. Móvil no comprime una tabla técnica ilegible como solución principal.
202. Color no es el único indicador de severidad.
203. Color no es el único indicador de bloqueo.
204. El foco visible se conserva en navegación por teclado.
205. El zoom no oculta información material.
206. La experiencia usa regiones semánticas legibles por tecnologías asistivas.
207. Los controles críticos tienen etiquetas explícitas.
208. La simulación se identifica inequívocamente.
209. Una simulación no concede permisos productivos.
210. Datos simulados no se mezclan silenciosamente con incidentes reales.
211. Un proveedor no valida MBCO de Vento por declarar su servicio estable.
212. Un proveedor no aprueba recuperación total de Vento.
213. Un proveedor no aprueba cierre de Vento.
214. Recuperación técnica permanece separada de recuperación total.
215. Recuperación total permanece separada de desactivación.
216. Desactivación permanece separada de cierre.
217. Cierre permanece separado de revisión posterior.
218. Un bloqueo material de cierre no se oculta por estado técnico favorable.
219. La tarea crea cero requisitos de prueba.
220. La tarea modifica cero requisitos de prueba.
221. La tarea difiere cero requisitos de prueba.
222. La tarea descarta cero requisitos de prueba.
223. La tarea vuelve obsoletos cero requisitos de prueba.
224. No se genera una copia innecesaria del registro canónico de requisitos.
225. La tarea distingue `ESPECIFICADO` de `IMPLEMENTADO`.
226. La tarea distingue `ESPECIFICADO` de `VALIDADO`.
227. Ningún comportamiento físico se declara implementado.
228. Ninguna evidencia operativa se inventa.
229. Ningún servicio afectado se inventa.
230. Ningún responsable nominal se inventa.
231. Ningún timestamp de incidente se inventa.
232. Ninguna prioridad se inventa.
233. Ningún objetivo MBCO/RTO/MTPD/RPO se inventa.
234. Ninguna métrica de recuperación se inventa.
235. La tarea no inicia `CONT-UX-003`.
236. `CONT-UX-003` permanece únicamente reservada.

---

#### 58. Balance de cierre

| Control                                    | Resultado |
| ------------------------------------------ | --------: |
| zonas semánticas obligatorias              |     **8** |
| niveles de profundidad de información      |     **3** |
| dimensiones separadas de recuperación      |     **5** |
| escenarios deterministas materializados    |    **10** |
| decisiones sustantivas de diseño           |    **50** |
| criterios de aceptación                    |   **236** |
| cambios físicos                            |     **0** |
| requisitos de prueba creados o modificados |     **0** |

---

#### 59. Continuidad

ÚLTIMA TAREA APROBADA

`CONT-UX-001 — Diseñar inicio ejecutivo de continuidad con estado, impacto, prioridades, responsables y decisiones`

TAREA ACTUAL APROBADA

`CONT-UX-002 — Diseñar centro de mando del incidente con línea de tiempo, servicios afectados y recuperación`

SIGUIENTE TAREA RESERVADA

`CONT-UX-003 — Diseñar runbooks y checklists simples por rol, proceso, sede y modalidad`


### ✅ CONT-UX-003 — Diseñar runbooks y checklists simples por rol, proceso, sede y modalidad

**Estado:** APROBADA  
**Tarea anterior:** `CONT-UX-002 — Diseñar centro de mando del incidente con línea de tiempo, servicios afectados y recuperación` — APROBADA  
**Tarea siguiente:** `CONT-UX-004 — Diseñar captura controlada durante la falla y reincorporación posterior` — RESERVADA  
**Tipo de tarea:** documental; materialización de la experiencia de runbooks y checklists de contingencia por función efectiva, proceso, sede y estrategia de contingencia  
**Bloque:** AC — Continuidad operativa y recuperación  
**Fase:** exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`  
**Implementación técnica u operativa:** no autorizada  
**Código, DDL, DML, migraciones, RLS, RPC, datos, backfills, despliegues, cambios de Supabase, activaciones de contingencia, restauraciones, failover, failback o comunicaciones reales:** no autorizados  
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito y resultado material

`CONT-UX-003` materializa la experiencia documental mediante la cual una persona que participa en un incidente de continuidad puede resolver **qué runbook vigente le corresponde, qué debe hacer ahora, qué no puede hacer, qué evidencia debe conservar, cuándo debe detenerse o escalar y a quién debe entregar el siguiente control**, sin convertir la interfaz en una fuente paralela de verdad ni en un mecanismo de autorización.

El resultado es un diseño consumible de runbooks y checklists que cruza cuatro dimensiones obligatorias:

1. **función efectiva** ejercida durante el incidente;
2. **proceso/capacidad** representado por el `BCS-VPROC-*` y su `VPROC-*` propietario;
3. **sede o alcance territorial** realmente aplicable;
4. **estrategia de contingencia** heredada del contrato de continuidad.

La experiencia no crea un catálogo alterno de procesos, sedes, actores o estrategias. Resuelve una **proyección operable** sobre las fuentes propietarias vigentes.

Resultado documental de esta tarea:

- arquitectura de información del runbook;
- contrato visual del checklist;
- selección por función, proceso, sede y estrategia;
- matriz materializada de cobertura sobre los 69 servicios heredados;
- reglas específicas para las estrategias de contingencia vigentes;
- reglas de vigencia, obsolescencia, impresión y uso sin conectividad;
- tratamiento de bloqueo, abort, escalamiento, resultado incierto y handoff;
- separación entre lectura del runbook y autoridad para ejecutar;
- handoffs explícitos a las experiencias posteriores sin absorberlas;
- escenarios deterministas y criterios de aceptación.

---

#### 2. Alcance y fronteras

La tarea **sí** define:

- cómo localizar el runbook correcto;
- cómo comprobar que la versión presentada es la vigente conocida;
- cómo mostrar el alcance real por proceso y sede;
- cómo proyectar el contenido por función efectiva;
- cómo presentar prerrequisitos, materiales, dependencias y límites;
- cómo presentar una secuencia simple de pasos;
- cómo distinguir instrucción, comprobación, evidencia y handoff;
- cómo mostrar acciones no autorizadas o bloqueadas;
- cómo mostrar condiciones de detención, abort y escalamiento;
- cómo tratar información sensible sin reproducir secretos;
- cómo operar una copia controlada impresa o sin conectividad;
- cómo conservar referencia al incidente cuando el runbook se usa en un evento real;
- cómo evitar que una marca visual de completitud afirme un efecto empresarial no confirmado.

La tarea **no**:

- implementa pantallas, componentes, rutas, tablas o almacenamiento;
- crea nuevos roles, permisos o capacidades de emergencia;
- ejecuta un runbook real;
- activa una estrategia de contingencia;
- define nuevos BIA, RTO, RPO, MTPD, MBCO o prioridades;
- redefine los 69 servicios ni sus propietarias;
- acredita una ubicación física o proveedor sustituto;
- crea formularios productivos, folios reales o rangos físicos;
- captura trabajo de contingencia real;
- realiza reincorporación, conciliación o cierre;
- ejecuta restore, failover o failback;
- emite comunicaciones reales;
- declara readiness;
- crea evidencia de prueba inexistente.

---

#### 3. Entradas canónicas preservadas

La experiencia consume sin redefinir:

1. los **69 servicios** `BCS-VPROC-0001` a `BCS-VPROC-0069` y sus `VPROC-*` correspondientes;
2. las decisiones de operación mínima, territorio, duración y temporada ya documentadas por continuidad;
3. el catálogo documental `CTG-01` a `CTG-10` y la estrategia primaria ya asignada a cada servicio;
4. el hecho de que **67 servicios** poseen estrategia primaria activa documentada y **2 servicios AURA** permanecen bloqueados por aplicación diferida;
5. las cinco sedes operativas internas reconocidas: **Oficina 1**, **Vento Café**, **Saudo**, **Molka** y **Centro de Producción y Distribución**;
6. la distinción por la cual Vaila, Catering y puntos externos no se promueven a sedes internas por esta tarea;
7. el mando efectivo, la sustitución funcional y la separación entre preparar, aprobar, ejecutar y validar;
8. la política que protege runbooks, contactos, evidencia, formularios y datos de contingencia;
9. la separación entre ejecución, validación técnica, validación funcional, reincorporación, conciliación, cierre y revisión posterior;
10. las secuencias de recuperación documentadas para los 69 servicios, sin convertirlas en ejecución real.

Ninguna proyección de UX modifica la propietaria de una decisión. Una corrección se realiza en la fuente propietaria y luego vuelve a proyectarse.

---

#### 4. Principios inviolables de experiencia

1. **Runbook visible ≠ autoridad para ejecutar.**
2. **Paso marcado ≠ efecto empresarial confirmado.**
3. **Éxito técnico ≠ recuperación empresarial.**
4. **Copia disponible ≠ versión vigente.**
5. **Sede seleccionada ≠ autoridad territorial.**
6. **Rol mostrado ≠ permiso concedido.**
7. **Acceso a un secreto referenciado ≠ permiso sobre su contenido.**
8. **Modo sin conectividad ≠ segunda fuente de verdad.**
9. **Proveedor presente ≠ segundo aprobador humano.**
10. **Abort ≠ cierre silencioso.**
11. **Resultado incierto ≠ éxito ni fallo inventado.**
12. **Checklist completo ≠ incidente cerrado.**
13. **Runbook obsoleto ≠ runbook actual.**
14. **Impresión ≠ excepción a clasificación, custodia o vigencia.**
15. **Filtro visual ≠ cambio de alcance canónico.**

---

#### 5. Resolución del runbook correcto

La selección se resuelve en este orden:

`INCIDENTE/CONTEXTO → PROCESO/CAPACIDAD → SEDE/ALCANCE → ESTRATEGIA VIGENTE → FUNCIÓN EFECTIVA → VERSIÓN VIGENTE DEL RUNBOOK`

La interfaz puede ofrecer filtros, pero el filtro nunca inventa una coincidencia. Si falta una dimensión requerida, se muestra el faltante y no se presenta un runbook genérico como si fuera aplicable.

##### 5.1 Dimensiones mínimas de resolución

| Dimensión          | Fuente de verdad                       | Qué muestra UX                         | Qué no puede inferir                              |
| ------------------ | -------------------------------------- | -------------------------------------- | ------------------------------------------------- |
| incidente/contexto | expediente de continuidad              | referencia, alcance y estado relevante | que existe un incidente si no hay referencia real |
| proceso/capacidad  | `BCS-VPROC-*` + `VPROC-*`              | servicio, proceso y propietaria        | criticidad o prioridad nueva                      |
| sede/territorio    | alcance canónico del proceso/incidente | sede aplicable o alcance empresarial   | que todos los procesos aplican a todas las sedes  |
| estrategia         | decisión vigente de continuidad        | estrategia primaria y límites          | una alternativa no acreditada                     |
| función efectiva   | mando/contexto de identidad            | instrucciones pertinentes a la función | permisos por nombre de rol                        |
| versión            | fuente propietaria del runbook         | versión, vigencia y revisión           | actualidad si el metadato no puede demostrarse    |

##### 5.2 Resultado de una resolución incompleta

Cuando no puede demostrarse proceso, sede aplicable, estrategia, función efectiva o versión vigente:

- no se compone un runbook plausible por inferencia;
- se indica la dimensión faltante;
- se conserva acceso únicamente a información autorizada que sí tenga fuente vigente;
- se ofrece el handoff funcional correspondiente para resolver el faltante;
- no se habilita una acción material por el solo hecho de existir un documento parecido.

---

#### 6. Identidad documental del runbook

Un runbook consumible por esta experiencia debe poder proyectar, cuando existan en la fuente propietaria, como mínimo:

| Grupo               | Información presentada                                                                      |
| ------------------- | ------------------------------------------------------------------------------------------- |
| identidad           | referencia estable, título, versión y propietario documental                                |
| vigencia            | estado de actualidad, fecha/referencia de revisión y condición de obsolescencia             |
| propósito           | objetivo y resultado protegido                                                              |
| alcance             | proceso, servicio, sede/territorio, modalidad y contexto aplicable                          |
| audiencia           | función efectiva y clasificación de la información                                          |
| prerrequisitos      | dependencias, datos mínimos, materiales, dispositivos o condiciones necesarias              |
| autorización        | referencia a la decisión o capacidad que debe resolverse antes de una acción protegida      |
| secuencia           | pasos ordenados, checkpoints y ramas permitidas                                             |
| límites             | acciones prohibidas, cantidades/alcances finitos y trabajo que permanece pendiente          |
| abort               | condición de detención, contención y escalamiento                                           |
| evidencia           | qué debe observarse o referenciarse sin duplicar contenido sensible innecesario             |
| retorno             | criterio para pasar a validación, handoff, reanudación o ruta propietaria                   |
| sensibilidad        | clasificación, audiencia, restricciones de proyección e impresión                           |
| referencias seguras | recursos, ambientes y secretos por referencia recuperable, nunca valores secretos embebidos |

La ausencia de metadatos de vigencia no se corrige mostrando “vigente” por defecto. Se representa como **vigencia no demostrada** y la ejecución que dependa de actualidad queda bloqueada o escalada según la decisión propietaria.

---

#### 7. Arquitectura de información de la vista de runbook

La pantalla principal prioriza acción y seguridad sobre densidad técnica.

##### 7.1 Franja fija de contexto

Debe permanecer visible:

- incidente o contexto de ejercicio, si existe;
- proceso/capacidad;
- sede/alcance;
- estrategia vigente;
- función efectiva;
- versión y actualidad del runbook;
- clasificación de la información;
- estado de conectividad/frescura cuando afecte la validez.

##### 7.2 Zona “Qué hago ahora”

Presenta una sola unidad accionable a la vez:

- instrucción breve;
- razón o resultado esperado cuando sea necesario para evitar error;
- prerrequisito inmediato;
- control de autoridad aplicable;
- evidencia mínima;
- condición de éxito observable;
- condición de bloqueo;
- condición de abort/escalamiento;
- siguiente handoff.

##### 7.3 Zona “Antes de continuar”

Agrupa únicamente los checkpoints que impiden avanzar: seguridad, autorización, versión, recurso, dependencia, cantidad/límite, evidencia o recepción necesaria.

##### 7.4 Zona “No hacer”

Las prohibiciones materiales se muestran antes de que la persona pueda interpretar una ausencia como permiso. Deben ser específicas al proceso y a la estrategia, no advertencias genéricas.

##### 7.5 Zona “Evidencia y handoff”

Muestra qué referencia debe conservarse y quién recibe el control siguiente. No exige duplicar en la interfaz documentos, secretos o datos personales que puedan mantenerse en la fuente protegida.

---

#### 8. Contrato visual del checklist

Cada paso se presenta con un contrato mínimo:

| Campo visual         | Regla                                                             |
| -------------------- | ----------------------------------------------------------------- |
| ordinal/fase         | conserva orden; una rama no renumera el historial                 |
| instrucción          | verbo concreto y resultado observable                             |
| función              | quién puede ejecutar o preparar ese paso según contexto           |
| prerrequisito        | condición que debe existir antes de actuar                        |
| autorización         | referencia a la decisión requerida cuando la acción sea protegida |
| alcance              | objeto, sede, recurso, cantidad o ventana aplicable               |
| evidencia mínima     | observación o referencia exigida, no un volcado indiscriminado    |
| resultado observable | qué puede comprobar el ejecutor sin certificar más de lo debido   |
| bloqueo              | condición que impide continuar                                    |
| abort/escalamiento   | condición que obliga a detener, proteger o transferir             |
| handoff              | función o superficie siguiente                                    |

##### 8.1 Estados visuales de un paso

La interfaz puede representar, únicamente como estado de presentación del checklist:

- **pendiente**;
- **en ejecución**;
- **completado con resultado observable**;
- **bloqueado**;
- **no aplicable con razón**;
- **resultado incierto**;
- **detenido/abortado con handoff**.

Estos rótulos no crean enums de negocio ni cambian el estado del proceso propietario. “Completado” significa que el paso dejó la evidencia/observación exigida; no certifica por sí mismo recuperación, conciliación, pago, inventario, publicación, autorización ni cierre.

---

#### 9. Proyección por función efectiva

La experiencia no mantiene un segundo RBAC. Resuelve la función efectiva del incidente y adapta lenguaje, foco y acciones visibles, mientras la autorización real continúa en su dominio propietario.

| Función/proyección                  | Enfoque del runbook                                                             | No absorbe                                                        |
| ----------------------------------- | ------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| responsable de continuidad          | activación, prioridad, bloqueos, handoffs, decisión y estado transversal        | validación propietaria de cada proceso                            |
| función de mando efectiva/sustituta | decisiones que requieren mando, transferencia y escalamiento                    | permisos técnicos o de contenido por inferencia                   |
| responsable del proceso             | límites del MBCO, resultado funcional, validación y pendientes                  | ejecución técnica privilegiada automática                         |
| supervisión/gerencia de sede        | recursos y operación aplicables a la sede real                                  | autoridad fuera de su alcance territorial                         |
| equipo operativo del área           | pasos concretos, límites, evidencias y puntos de detención                      | aprobación o cierre que no le corresponda                         |
| responsable tecnológico             | restore, conectividad, dependencias y validación técnica cuando aplique         | certificación empresarial por éxito técnico                       |
| custodio documental                 | versión, custodia, copia, evidencia y disposición                               | aprobación del efecto empresarial                                 |
| seguridad/privacidad                | tratamiento de exposición, información sensible y evidencia                     | dirección operativa general por defecto                           |
| proveedor/tercero                   | mínimo segmento necesario del runbook y evidencia contractual/técnica aplicable | acceso al runbook completo o certificación empresarial automática |

Una misma persona puede ejercer más de una función durante una contingencia, pero la interfaz conserva visibles las funciones y no fusiona sus responsabilidades para ocultar concentración de autoridad.

---

#### 10. Proyección por sede

Las cinco sedes internas se presentan como dimensión real, no como etiquetas decorativas:

| Sede                                | Regla de proyección                                                                                                              |
| ----------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| Oficina 1                           | muestra solo procesos, recursos y pasos cuyo alcance canónico incluya esa sede o un alcance empresarial que la afecte            |
| Vento Café                          | aplica variaciones de proceso, dispositivo, recurso y modalidad solo cuando estén respaldadas por fuente propietaria             |
| Saudo                               | no hereda por similitud una instrucción definida para otra sede                                                                  |
| Molka                               | conserva bloqueos, límites y handoffs propios del alcance realmente demostrado                                                   |
| Centro de Producción y Distribución | prioriza dependencias físicas, producción, almacenamiento, despacho y controles cuando los procesos propietarios así lo indiquen |

Reglas:

1. seleccionar una sede no amplía autoridad territorial;
2. un runbook empresarial puede aplicar a varias sedes sin duplicarse como fuente de verdad;
3. una variación por sede debe declarar su origen y versión;
4. si una diferencia de sede no está documentada, la interfaz no la inventa;
5. Vaila, Catering y puntos externos se muestran únicamente con su clasificación canónica vigente y no como una sexta, séptima u octava sede interna;
6. una copia preparada para una sede conserva la versión maestra de la cual deriva.

---

#### 11. Proyección por estrategia de contingencia

El catálogo documental heredado contiene diez estrategias. En el baseline actual, las estrategias primarias de los 67 servicios operables usan `CTG-01` a `CTG-08`; `CTG-09` y `CTG-10` permanecen condicionales y no acreditan por sí solas una alternativa concreta.

| Estrategia                                       | Tratamiento del checklist                                                                              | Señal de seguridad dominante                |
| ------------------------------------------------ | ------------------------------------------------------------------------------------------------------ | ------------------------------------------- |
| `CTG-01_BLOQUEAR_Y_PROTEGER`                     | checklist corto de contención, preservación y escalamiento                                             | no afirmar el efecto que se bloqueó         |
| `CTG-02_REFERENCIA_VERSIONADA`                   | comprobar fuente, versión, frescura y uso solo lectura                                                 | referencia expirada no es vigente           |
| `CTG-03_BORRADOR_LOCAL`                          | preparar sin transición, aprobación, publicación o compromiso                                          | el borrador no es resultado empresarial     |
| `CTG-04_CAPTURA_LOCAL_PENDIENTE`                 | observar/capturar con hora real, actor, contexto y evidencia                                           | captura pendiente no es aceptación          |
| `CTG-05_EJECUCION_OFFLINE_ACOTADA`               | comprobar envelope, recurso, vigencia, cantidad, secuencia e idempotencia antes de cada efecto         | no exceder autorización finita              |
| `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO`         | folio/registro físico gobernado, actor, hora, recurso, acción, evidencia y handoff                     | medio manual no es segunda fuente de verdad |
| `CTG-07_SERVICIO_REDUCIDO_CONTROLADO`            | mostrar explícitamente qué MBCO continúa y qué trabajo queda fuera                                     | servicio reducido no es servicio completo   |
| `CTG-08_DIFERIMIENTO_CONTROLADO`                 | conservar backlog, propietario, antigüedad, vencimiento y condición de reanudación                     | diferido no significa ejecutado             |
| `CTG-09_ALTERNATIVA_FISICA_CONDICIONAL`          | no ofrece ejecución hasta que una fuente propietaria acredite recurso/ubicación alterna                | alternativa documental no es capacidad real |
| `CTG-10_ALTERNATIVA_PROVEEDOR_CANAL_CONDICIONAL` | no ofrece sustitución hasta acreditar contrato, autorización, capacidad, datos, conciliación y retorno | tercero candidato no es sustituto aprobado  |

---

#### 12. Matriz materializada de cobertura por proceso

La matriz siguiente conserva las **69 identidades** y la estrategia heredada. La decisión UX por fila no redefine la estrategia; determina cómo debe proyectarse el runbook/checklist.

- `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA`: la experiencia puede resolver un runbook desde la estrategia heredada, sujeto a sede, función, versión y autorización.
- `VISTA_DE_BLOQUEO_SIN_CHECKLIST_OPERATIVO`: no se presenta un procedimiento operativo que simule una capacidad diferida.

|    # | Servicio         | Proceso      | Propietaria | Estrategia heredada                      | Decisión UX                                        | Estado documental              |
| ---: | ---------------- | ------------ | ----------- | ---------------------------------------- | -------------------------------------------------- | ------------------------------ |
|    1 | `BCS-VPROC-0001` | `VPROC-0001` | `viso`      | `CTG-03_BORRADOR_LOCAL`                  | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|    2 | `BCS-VPROC-0002` | `VPROC-0002` | `viso`      | `CTG-02_REFERENCIA_VERSIONADA`           | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|    3 | `BCS-VPROC-0003` | `VPROC-0003` | `viso`      | `CTG-02_REFERENCIA_VERSIONADA`           | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|    4 | `BCS-VPROC-0004` | `VPROC-0004` | `viso`      | `CTG-03_BORRADOR_LOCAL`                  | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|    5 | `BCS-VPROC-0005` | `VPROC-0005` | `viso`      | `CTG-08_DIFERIMIENTO_CONTROLADO`         | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|    6 | `BCS-VPROC-0006` | `VPROC-0006` | `viso`      | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|    7 | `BCS-VPROC-0007` | `VPROC-0007` | `viso`      | `CTG-07_SERVICIO_REDUCIDO_CONTROLADO`    | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|    8 | `BCS-VPROC-0008` | `VPROC-0008` | `anima`     | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|    9 | `BCS-VPROC-0009` | `VPROC-0009` | `viso`      | `CTG-07_SERVICIO_REDUCIDO_CONTROLADO`    | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   10 | `BCS-VPROC-0010` | `VPROC-0010` | `numera`    | `CTG-03_BORRADOR_LOCAL`                  | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   11 | `BCS-VPROC-0011` | `VPROC-0011` | `viso`      | `CTG-01_BLOQUEAR_Y_PROTEGER`             | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   12 | `BCS-VPROC-0012` | `VPROC-0012` | `viso`      | `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO` | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   13 | `BCS-VPROC-0013` | `VPROC-0013` | `viso`      | `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO` | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   14 | `BCS-VPROC-0014` | `VPROC-0014` | `viso`      | `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO` | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   15 | `BCS-VPROC-0015` | `VPROC-0015` | `nexo`      | `CTG-02_REFERENCIA_VERSIONADA`           | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   16 | `BCS-VPROC-0016` | `VPROC-0016` | `fogo`      | `CTG-07_SERVICIO_REDUCIDO_CONTROLADO`    | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   17 | `BCS-VPROC-0017` | `VPROC-0017` | `pulso`     | `CTG-07_SERVICIO_REDUCIDO_CONTROLADO`    | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   18 | `BCS-VPROC-0018` | `VPROC-0018` | `nexo`      | `CTG-02_REFERENCIA_VERSIONADA`           | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   19 | `BCS-VPROC-0019` | `VPROC-0019` | `origo`     | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   20 | `BCS-VPROC-0020` | `VPROC-0020` | `origo`     | `CTG-03_BORRADOR_LOCAL`                  | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   21 | `BCS-VPROC-0021` | `VPROC-0021` | `origo`     | `CTG-01_BLOQUEAR_Y_PROTEGER`             | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   22 | `BCS-VPROC-0022` | `VPROC-0022` | `origo`     | `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO` | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   23 | `BCS-VPROC-0023` | `VPROC-0023` | `nexo`      | `CTG-02_REFERENCIA_VERSIONADA`           | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   24 | `BCS-VPROC-0024` | `VPROC-0024` | `nexo`      | `CTG-05_EJECUCION_OFFLINE_ACOTADA`       | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   25 | `BCS-VPROC-0025` | `VPROC-0025` | `nexo`      | `CTG-05_EJECUCION_OFFLINE_ACOTADA`       | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   26 | `BCS-VPROC-0026` | `VPROC-0026` | `nexo`      | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   27 | `BCS-VPROC-0027` | `VPROC-0027` | `nexo`      | `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO` | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   28 | `BCS-VPROC-0028` | `VPROC-0028` | `nexo`      | `CTG-05_EJECUCION_OFFLINE_ACOTADA`       | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   29 | `BCS-VPROC-0029` | `VPROC-0029` | `nexo`      | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   30 | `BCS-VPROC-0030` | `VPROC-0030` | `nexo`      | `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO` | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   31 | `BCS-VPROC-0031` | `VPROC-0031` | `nexo`      | `CTG-07_SERVICIO_REDUCIDO_CONTROLADO`    | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   32 | `BCS-VPROC-0032` | `VPROC-0032` | `nexo`      | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   33 | `BCS-VPROC-0033` | `VPROC-0033` | `fogo`      | `CTG-07_SERVICIO_REDUCIDO_CONTROLADO`    | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   34 | `BCS-VPROC-0034` | `VPROC-0034` | `fogo`      | `CTG-05_EJECUCION_OFFLINE_ACOTADA`       | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   35 | `BCS-VPROC-0035` | `VPROC-0035` | `fogo`      | `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO` | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   36 | `BCS-VPROC-0036` | `VPROC-0036` | `fogo`      | `CTG-05_EJECUCION_OFFLINE_ACOTADA`       | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   37 | `BCS-VPROC-0037` | `VPROC-0037` | `fogo`      | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   38 | `BCS-VPROC-0038` | `VPROC-0038` | `pulso`     | `CTG-07_SERVICIO_REDUCIDO_CONTROLADO`    | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   39 | `BCS-VPROC-0039` | `VPROC-0039` | `pulso`     | `CTG-07_SERVICIO_REDUCIDO_CONTROLADO`    | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   40 | `BCS-VPROC-0040` | `VPROC-0040` | `pulso`     | `CTG-02_REFERENCIA_VERSIONADA`           | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   41 | `BCS-VPROC-0041` | `VPROC-0041` | `pulso`     | `CTG-07_SERVICIO_REDUCIDO_CONTROLADO`    | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   42 | `BCS-VPROC-0042` | `VPROC-0042` | `pulso`     | `CTG-01_BLOQUEAR_Y_PROTEGER`             | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   43 | `BCS-VPROC-0043` | `VPROC-0043` | `pulso`     | `CTG-01_BLOQUEAR_Y_PROTEGER`             | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   44 | `BCS-VPROC-0044` | `VPROC-0044` | `pulso`     | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   45 | `BCS-VPROC-0045` | `VPROC-0045` | `pass`      | `CTG-02_REFERENCIA_VERSIONADA`           | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   46 | `BCS-VPROC-0046` | `VPROC-0046` | `pulso`     | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   47 | `BCS-VPROC-0047` | `VPROC-0047` | `pulso`     | `CTG-03_BORRADOR_LOCAL`                  | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   48 | `BCS-VPROC-0048` | `VPROC-0048` | `nexo`      | `CTG-03_BORRADOR_LOCAL`                  | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   49 | `BCS-VPROC-0049` | `VPROC-0049` | `nexo`      | `CTG-05_EJECUCION_OFFLINE_ACOTADA`       | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   50 | `BCS-VPROC-0050` | `VPROC-0050` | `pulso`     | `CTG-02_REFERENCIA_VERSIONADA`           | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   51 | `BCS-VPROC-0051` | `VPROC-0051` | `numera`    | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   52 | `BCS-VPROC-0052` | `VPROC-0052` | `numera`    | `CTG-01_BLOQUEAR_Y_PROTEGER`             | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   53 | `BCS-VPROC-0053` | `VPROC-0053` | `numera`    | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   54 | `BCS-VPROC-0054` | `VPROC-0054` | `numera`    | `CTG-03_BORRADOR_LOCAL`                  | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   55 | `BCS-VPROC-0055` | `VPROC-0055` | `nexo`      | `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO` | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   56 | `BCS-VPROC-0056` | `VPROC-0056` | `aura`      | `BLOQUEADO_POR_APLICACION_DIFERIDA`      | `VISTA_DE_BLOQUEO_SIN_CHECKLIST_OPERATIVO`         | `BLOQUEADO`                    |
|   57 | `BCS-VPROC-0057` | `VPROC-0057` | `aura`      | `BLOQUEADO_POR_APLICACION_DIFERIDA`      | `VISTA_DE_BLOQUEO_SIN_CHECKLIST_OPERATIVO`         | `BLOQUEADO`                    |
|   58 | `BCS-VPROC-0058` | `VPROC-0058` | `viso`      | `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO` | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   59 | `BCS-VPROC-0059` | `VPROC-0059` | `viso`      | `CTG-01_BLOQUEAR_Y_PROTEGER`             | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   60 | `BCS-VPROC-0060` | `VPROC-0060` | `viso`      | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   61 | `BCS-VPROC-0061` | `VPROC-0061` | `numera`    | `CTG-08_DIFERIMIENTO_CONTROLADO`         | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   62 | `BCS-VPROC-0062` | `VPROC-0062` | `viso`      | `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO` | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   63 | `BCS-VPROC-0063` | `VPROC-0063` | `viso`      | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   64 | `BCS-VPROC-0064` | `VPROC-0064` | `viso`      | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   65 | `BCS-VPROC-0065` | `VPROC-0065` | `viso`      | `CTG-08_DIFERIMIENTO_CONTROLADO`         | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   66 | `BCS-VPROC-0066` | `VPROC-0066` | `viso`      | `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO` | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   67 | `BCS-VPROC-0067` | `VPROC-0067` | `nexo`      | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   68 | `BCS-VPROC-0068` | `VPROC-0068` | `pulso`     | `CTG-08_DIFERIMIENTO_CONTROLADO`         | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |
|   69 | `BCS-VPROC-0069` | `VPROC-0069` | `numera`    | `CTG-03_BORRADOR_LOCAL`                  | `RUNBOOK_Y_CHECKLIST_PROYECTADOS_DESDE_ESTRATEGIA` | `ESPECIFICADO_NO_IMPLEMENTADO` |

---

#### 13. Reconciliación de la matriz de cobertura

La materialización anterior cumple:

- total esperado: **69**;
- total materializado: **69**;
- faltantes: **0**;
- duplicados de `BCS-VPROC-*`: **0**;
- duplicados de `VPROC-*`: **0**;
- servicios con estrategia primaria documentada: **67**;
- servicios bloqueados por aplicación diferida: **2** (`BCS-VPROC-0056` y `BCS-VPROC-0057`);
- nuevas estrategias creadas: **0**;
- nuevas propietarias creadas: **0**.

Distribución heredada que la experiencia debe conservar:

| Estrategia/estado                        | Servicios |
| ---------------------------------------- | --------: |
| `CTG-01_BLOQUEAR_Y_PROTEGER`             |     **6** |
| `CTG-02_REFERENCIA_VERSIONADA`           |     **8** |
| `CTG-03_BORRADOR_LOCAL`                  |     **8** |
| `CTG-04_CAPTURA_LOCAL_PENDIENTE`         |    **15** |
| `CTG-05_EJECUCION_OFFLINE_ACOTADA`       |     **6** |
| `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO` |    **11** |
| `CTG-07_SERVICIO_REDUCIDO_CONTROLADO`    |     **9** |
| `CTG-08_DIFERIMIENTO_CONTROLADO`         |     **4** |
| `BLOQUEADO_POR_APLICACION_DIFERIDA`      |     **2** |
| **Total**                                |    **69** |

---

#### 14. Secuencia simple de uso

La experiencia guía al usuario por siete momentos, sin imponer que todos impliquen una escritura:

1. **Confirmar contexto** — proceso, sede, estrategia, función y versión.
2. **Comprobar prerrequisitos** — autoridad, recursos, dependencias, información y seguridad.
3. **Leer el paso actual** — una instrucción accionable y sus límites.
4. **Ejecutar o preparar** — solo dentro del alcance autorizado.
5. **Comprobar resultado observable** — no certificar más de lo que realmente se observó.
6. **Conservar referencia/evidencia mínima** — según la estrategia y el dominio propietario.
7. **Continuar, bloquear, abortar o entregar** — con siguiente función o superficie explícita.

El usuario puede volver a pasos anteriores para consultar historial, pero una corrección no reescribe el hecho original ni convierte una acción posterior en una acción pasada.

---

#### 15. Prerrequisitos y puerta de ejecución

Antes de un paso material, el checklist debe poder mostrar una puerta compacta:

| Verificación                               | Respuesta permitida                                              |
| ------------------------------------------ | ---------------------------------------------------------------- |
| versión vigente demostrada                 | continuar / bloquear por vigencia no demostrada                  |
| proceso y sede aplicables                  | continuar / corregir contexto                                    |
| función efectiva resuelta                  | continuar / resolver mando o función                             |
| autorización aplicable                     | continuar / solicitar o escalar por canal propietario            |
| recurso/dependencia disponible             | continuar / usar rama aprobada / bloquear                        |
| estrategia compatible con el sobre offline | continuar / bloquear                                             |
| límite/cantidad/vigencia finita            | continuar dentro del envelope / detener                          |
| protección de información                  | continuar con proyección mínima / bloquear exposición            |
| evidencia mínima disponible                | continuar / capturar o referenciar / escalar si es indispensable |

No se usa un botón genérico “forzar” para saltarse la puerta. El acceso de emergencia, cuando exista, se resuelve mediante su contrato propietario y sigue siendo temporal, acotado y auditable.

---

#### 16. Bloqueo, abort y escalamiento

Un bloqueo debe explicar **qué impide continuar y cuál es el siguiente control**, sin revelar información no autorizada.

Causales mínimas que la experiencia debe soportar:

- versión no vigente o no demostrable;
- sede o proceso no aplicable;
- función efectiva no resuelta;
- autorización faltante, vencida o revocada;
- dependencia crítica ausente;
- recurso o suministro no disponible;
- envelope offline agotado o incompatible;
- dato mínimo no demostrable;
- riesgo protector no controlado;
- exposición de información sensible;
- resultado externo incierto;
- evidencia indispensable no preservable;
- condición de abort definida por el runbook;
- alternativa física o de proveedor no acreditada.

El flujo de abort:

`DETECTAR CONDICIÓN → DETENER EFECTO NUEVO → PROTEGER ESTADO/RECURSO → CONSERVAR EVIDENCIA → ESCALAR/HANDOFF → NO MARCAR RESULTADO COMO COMPLETO`

Abortar un paso no equivale a cerrar el incidente ni a revertir automáticamente efectos ya producidos.

---

#### 17. Resultado incierto

Cuando una llamada, pago, integración, movimiento o acción externa no devuelve confirmación suficiente:

- el checklist muestra **resultado incierto**;
- prohíbe repetir a ciegas una acción con potencial de duplicidad;
- conserva referencia a intento, actor, hora, recurso, idempotencia/receipt cuando exista y evidencia disponible;
- dirige al flujo propietario de consulta/reconciliación;
- no ofrece “marcar como exitoso” para desbloquear el checklist;
- no ofrece “marcar como fallido” si tampoco existe evidencia de fallo.

---

#### 18. Vigencia, obsolescencia y revisión

El riesgo de runbooks desactualizados se trata como una condición visible de primera clase.

Cada presentación debe distinguir:

- versión actual demostrada;
- versión anterior conocida;
- vigencia no demostrada;
- copia sin conectividad cuya frescura debe reevaluarse;
- versión obsoleta;
- versión sustituida pero conservada como historial.

Reglas:

1. una versión obsoleta nunca recibe apariencia de actual;
2. una copia impresa conserva versión y fecha/referencia de revisión;
3. una copia offline conserva el momento de última verificación de vigencia;
4. reconectar obliga a comparar contra la fuente propietaria antes de seguir usando una copia susceptible de cambio;
5. una actualización no elimina el historial ni altera evidencia de qué versión se utilizó;
6. si una versión antigua sigue siendo necesaria para explicar un incidente, se conserva como evidencia, no como instrucción vigente;
7. la ausencia de actualización reciente no prueba por sí sola obsolescencia; la fuente propietaria decide vigencia.

---

#### 19. Protección de información y secretos

El runbook puede mostrar referencias seguras a recursos, credenciales o claves recuperables, pero no valores secretos en texto, impresión, captura, log o copia general.

La experiencia aplica:

- clasificación y propósito vigentes;
- mínimo contenido por función;
- mínimo contenido para proveedor/tercero;
- ocultamiento de campos no necesarios;
- prohibición de inferir autorización por conocer una URL, bucket, archivo o secreto referenciado;
- no exposición de nombres, teléfonos o correos cuando baste una referencia funcional protegida;
- no filtración de títulos, fragmentos o metadatos sensibles mediante búsqueda o error;
- evidencia por referencia cuando el contenido propietario pueda permanecer en su dominio;
- trazabilidad de impresión o copia controlada cuando la política lo requiera.

---

#### 20. Uso impreso y sin conectividad

Una versión impresa o sin conectividad es un **medio de presentación controlado**, no una réplica autoritativa independiente.

Debe incluir en la primera jerarquía:

- referencia del runbook;
- versión;
- estado de vigencia conocido al momento de preparación;
- fecha/hora o referencia de la última verificación cuando exista;
- clasificación;
- proceso y sede/alcance;
- estrategia;
- función/audiencia;
- condición que obliga a dejar de usar la copia;
- instrucciones de custodia y devolución/disposición según política.

En modo sin conectividad:

- no se finge una autorización nueva;
- no se amplía el sobre offline;
- una copia no “se actualiza” sin evidencia de fuente;
- los pasos que necesitan confirmación autoritativa permanecen pendientes o bloqueados;
- la reconexión revalida sesión, autorización, versión y contexto antes de mutar un hecho.

---

#### 21. Diseño móvil, estación compacta y accesibilidad

La experiencia debe seguir siendo usable bajo presión:

- una acción primaria por bloque;
- texto accionable antes de explicación secundaria;
- severidad, bloqueo y vigencia no dependen solo de color;
- foco de teclado visible;
- orden de tabulación consistente con orden operativo;
- zoom no oculta contexto, bloqueo, abort o handoff;
- responsive no elimina versión, sede, estrategia ni función;
- en móvil, el paso actual y la condición de detención permanecen antes de información secundaria;
- tablas extensas se transforman en fichas sin alterar orden o identidad;
- loading no muestra valores ficticios;
- error de red no convierte desconocido en cero ni vigente en obsoleto;
- caché muestra edad/frescura;
- confirmaciones de acciones críticas describen el efecto concreto, no “¿Seguro?” sin contexto;
- icono siempre tiene texto o etiqueta semántica suficiente cuando comunica una condición material.

---

#### 22. Búsqueda y navegación

La búsqueda permite localizar por:

- proceso/capacidad;
- sede aplicable;
- función efectiva;
- estrategia;
- referencia/título autorizado;
- estado de vigencia permitido.

Reglas de seguridad:

- resultados no autorizados no aparecen por título, contador o snippet;
- cero resultados no confirma existencia de un runbook oculto;
- filtros no cambian alcance real;
- ordenar por nombre no cambia prioridad de recuperación;
- favoritos o recientes no convierten una versión vieja en vigente;
- un enlace profundo vuelve a resolver autorización, función, sede, estrategia y versión.

---

#### 23. Handoffs a experiencias propietarias posteriores

`CONT-UX-003` termina cuando la persona necesita una experiencia cuya responsabilidad pertenece a otra tarea:

| Necesidad                                                       | Handoff reservado                    | Información mínima que se conserva                                                             |
| --------------------------------------------------------------- | ------------------------------------ | ---------------------------------------------------------------------------------------------- |
| capturar trabajo de contingencia y reincorporarlo               | `CONT-UX-004`                        | incidente, proceso, sede, estrategia, paso, evidencia/ref y estado pendiente                   |
| observar backup, restore, failover o pendientes de recuperación | `CONT-UX-005`                        | incidente, servicio, runbook/step, recurso y bloqueo                                           |
| emitir comunicación interna/externa                             | `CONT-UX-006`                        | incidente, audiencia, hecho confirmado, incertidumbre, autoridad y plantilla/canal propietario |
| ejercicio, revisión posterior y readiness                       | `CONT-UX-007`                        | runbook/version, escenario, participantes, desviaciones, evidencia y acciones                  |
| reconciliación técnica/operativa                                | `CONT-INT-004` y dominio propietario | operación/folio/ref, secuencia, estado observado, evidencia y pendiente                        |

El handoff no concede permisos adicionales y la superficie destino vuelve a resolver autorización.

---

#### 24. Escenarios deterministas de experiencia

##### Escenario A — referencia versionada disponible

Una persona abre un proceso con `CTG-02_REFERENCIA_VERSIONADA`. La experiencia muestra fuente, versión y frescura; permite consulta; oculta controles de edición; si la referencia expira, cambia a bloqueo y handoff. Nunca presenta una edición local como nueva referencia vigente.

##### Escenario B — borrador local

El runbook `CTG-03_BORRADOR_LOCAL` permite preparar información. El checklist usa lenguaje “preparar”, no “aprobar” ni “publicar”. La salida queda pendiente de revalidación propietaria.

##### Escenario C — captura local pendiente

El paso registra observación con hora real y referencia de evidencia. La marca visual de completitud del paso significa “captura realizada”, no “hecho aceptado por el sistema propietario”.

##### Escenario D — ejecución offline acotada

Antes de cada efecto se muestra envelope, recurso, vigencia, alcance y secuencia. Si se agota la cantidad o ventana, el siguiente paso queda bloqueado. No se amplía automáticamente el envelope.

##### Escenario E — procedimiento manual

La persona usa un formato/folio gobernado si existe. La interfaz o copia indica custodia y handoff. Digitalizar después no altera hora real ni convierte el papel en un registro autoritativo distinto.

##### Escenario F — servicio reducido

La cabecera muestra qué resultado mínimo continúa y qué trabajo queda excluido. Un usuario no puede marcar “servicio normal” desde el checklist.

##### Escenario G — diferimiento

El checklist no simula pasos operativos. Conserva backlog, propietario, antigüedad, vencimiento y condición de reanudación.

##### Escenario H — AURA diferida

Para `BCS-VPROC-0056` o `BCS-VPROC-0057`, la experiencia muestra bloqueo por aplicación diferida y no construye un procedimiento operativo de contenido/promoción u oportunidades/canales.

##### Escenario I — copia impresa vieja

La persona encuentra una copia de versión anterior. La primera jerarquía muestra versión y condición de obsolescencia; el flujo exige obtener una versión vigente o escalar. No se oculta la copia si forma parte de la evidencia histórica.

##### Escenario J — resultado externo incierto

Un paso no recibe confirmación. Se marca resultado incierto, se bloquea reintento ciego y se realiza handoff a consulta/reconciliación.

##### Escenario K — proveedor

Un tercero recibe únicamente el segmento necesario. No ve contactos, secretos, evidencia o pasos que no necesita. Su confirmación técnica no certifica recuperación empresarial.

##### Escenario L — cambio de sede

La persona cambia de Vento Café a Saudo. La interfaz vuelve a resolver aplicabilidad; no arrastra automáticamente instrucciones específicas de la sede anterior.

##### Escenario M — cambio de función durante el incidente

Una transferencia de mando cambia la función efectiva. La interfaz conserva la historia y vuelve a proyectar el runbook. Los pasos ejecutados bajo la función anterior permanecen atribuidos a quien los realizó.

##### Escenario N — reconexión

Una copia offline vuelve a tener red. Antes de cualquier mutación se revalidan sesión, autorización, contexto y versión del runbook. Un cambio remoto no se pisa con caché local silenciosamente.

---

#### 25. Criterios de aceptación

1. el artefacto contiene exactamente una tarea canónica CONT-UX-003;
2. la tarea se mantiene exclusivamente documental;
3. no se inicia implementación física;
4. no se crea código, migración, dato ni configuración productiva;
5. se preservan exactamente 69 servicios BCS-VPROC;
6. se preservan exactamente 69 procesos VPROC correlativos;
7. no se renumera ningún servicio;
8. no se renumera ningún proceso;
9. la matriz de cobertura contiene 69 filas únicas;
10. no falta ninguna identidad entre 0001 y 0069;
11. no se duplica ninguna identidad BCS-VPROC;
12. no se duplica ninguna identidad VPROC;
13. se preserva la propietaria heredada de cada fila;
14. se preserva la estrategia heredada de cada fila;
15. la distribución de estrategias suma 69 incluyendo los dos bloqueos AURA;
16. 67 servicios conservan una estrategia primaria documentada;
17. 2 servicios AURA conservan bloqueo por aplicación diferida;
18. AURA no recibe un checklist operativo ficticio;
19. CTG-01 conserva 6 servicios;
20. CTG-02 conserva 8 servicios;
21. CTG-03 conserva 8 servicios;
22. CTG-04 conserva 15 servicios;
23. CTG-05 conserva 6 servicios;
24. CTG-06 conserva 11 servicios;
25. CTG-07 conserva 9 servicios;
26. CTG-08 conserva 4 servicios;
27. no se asigna CTG-09 como alternativa real sin acreditación;
28. no se asigna CTG-10 como alternativa real sin acreditación;
29. la experiencia resuelve función efectiva antes de proyectar acciones;
30. la experiencia resuelve proceso/capacidad antes de proyectar acciones;
31. la experiencia resuelve sede/alcance antes de proyectar acciones;
32. la experiencia resuelve estrategia vigente antes de proyectar acciones;
33. la experiencia resuelve versión vigente antes de proyectar acciones materiales;
34. la ausencia de una dimensión requerida no se completa por inferencia;
35. un filtro visual no cambia el alcance canónico;
36. seleccionar una sede no amplía autoridad territorial;
37. mostrar una función no concede un permiso;
38. mostrar un runbook no concede autoridad de ejecución;
39. conocer una referencia de recurso no concede acceso a su contenido;
40. conocer una referencia de secreto no revela el valor del secreto;
41. un paso completado no certifica un efecto empresarial distinto del resultado observable;
42. un checklist completo no cierra el incidente;
43. un éxito técnico no se presenta como recuperación empresarial;
44. una validación técnica no sustituye validación funcional;
45. la persona ejecutora no se vuelve validadora por marcar un paso;
46. una automatización no cuenta como segundo aprobador humano;
47. un proveedor no cuenta como segundo aprobador humano;
48. el runbook conserva referencia estable cuando la fuente la provee;
49. el runbook muestra título y versión;
50. el runbook muestra propietaria documental cuando exista;
51. el runbook muestra propósito;
52. el runbook muestra alcance;
53. el runbook muestra proceso/capacidad;
54. el runbook muestra sede/territorio aplicable;
55. el runbook muestra estrategia de contingencia;
56. el runbook muestra audiencia o función efectiva;
57. el runbook muestra clasificación cuando corresponda;
58. el runbook muestra prerrequisitos;
59. el runbook muestra dependencias relevantes;
60. el runbook muestra materiales o recursos solo cuando sean necesarios;
61. el runbook muestra límites de acción;
62. el runbook muestra condiciones de bloqueo;
63. el runbook muestra condiciones de abort;
64. el runbook muestra ruta de escalamiento;
65. el runbook muestra evidencia mínima;
66. el runbook muestra handoff o retorno;
67. los secretos se representan por referencia segura;
68. no se incrustan secretos en pasos, copias o impresiones;
69. el paso actual tiene una instrucción accionable;
70. el paso actual muestra su prerrequisito inmediato;
71. el paso actual muestra el alcance aplicable;
72. el paso actual muestra la condición observable de avance;
73. el paso actual muestra la condición que impide avanzar;
74. el paso actual muestra abort/escalamiento cuando aplica;
75. el paso actual muestra la evidencia mínima cuando aplica;
76. el paso actual muestra el siguiente handoff cuando aplica;
77. la interfaz no obliga a leer telemetría técnica irrelevante para ejecutar un paso;
78. la zona de contexto conserva incidente cuando existe;
79. la zona de contexto conserva proceso;
80. la zona de contexto conserva sede/alcance;
81. la zona de contexto conserva estrategia;
82. la zona de contexto conserva función;
83. la zona de contexto conserva versión/vigencia;
84. la zona de contexto conserva frescura cuando influye en la validez;
85. la vista de runbook no se convierte en un centro de mando duplicado;
86. la vista de runbook no absorbe captura/reincorporación detallada;
87. la vista de runbook no absorbe tablero de backup/restore/failover;
88. la vista de runbook no absorbe emisión de comunicaciones;
89. la vista de runbook no absorbe revisión posterior/readiness;
90. la vista de runbook no absorbe reconciliación propietaria;
91. CTG-01 prioriza contención y preservación;
92. CTG-01 no afirma que la acción bloqueada fue ejecutada;
93. CTG-02 muestra fuente y versión;
94. CTG-02 muestra frescura o vigencia;
95. CTG-02 no ofrece edición como parte de la referencia;
96. CTG-03 usa lenguaje de preparación o borrador;
97. CTG-03 no presenta aprobación o publicación como realizada;
98. CTG-04 conserva hora real de observación cuando exista captura;
99. CTG-04 diferencia captura de aceptación;
100. CTG-05 exige envelope vigente antes de ejecutar;
101. CTG-05 conserva recurso y alcance finitos;
102. CTG-05 no amplía cantidad o vigencia automáticamente;
103. CTG-05 conserva secuencia e idempotencia cuando sean aplicables;
104. CTG-06 conserva folio o identidad controlada cuando aplique;
105. CTG-06 conserva actor y hora real;
106. CTG-06 conserva sitio/área cuando aplique;
107. CTG-06 conserva custodia y handoff;
108. CTG-06 no transforma el medio manual en fuente paralela de verdad;
109. CTG-07 muestra el resultado mínimo que continúa;
110. CTG-07 muestra el trabajo que queda excluido;
111. CTG-07 no se presenta como servicio completo;
112. CTG-08 conserva backlog;
113. CTG-08 conserva propietario;
114. CTG-08 conserva antigüedad o fecha de origen;
115. CTG-08 conserva vencimiento cuando aplique;
116. CTG-08 conserva condición de reanudación;
117. CTG-08 no se presenta como trabajo ejecutado;
118. CTG-09 solo puede proyectarse después de acreditación propietaria;
119. CTG-10 solo puede proyectarse después de acreditación propietaria;
120. Oficina 1 permanece como sede interna reconocida;
121. Vento Café permanece como sede interna reconocida;
122. Saudo permanece como sede interna reconocida;
123. Molka permanece como sede interna reconocida;
124. Centro de Producción y Distribución permanece como sede interna reconocida;
125. Vaila no se promueve a sede interna por esta tarea;
126. Catering no se promueve a sede interna por esta tarea;
127. los puntos externos no se promueven a sedes internas por esta tarea;
128. una variación de sede exige fuente propietaria;
129. una instrucción de una sede no se hereda por similitud a otra;
130. un runbook empresarial puede proyectarse a varias sedes sin duplicar su fuente;
131. la función de continuidad prioriza mando, bloqueos y handoffs;
132. la función propietaria del proceso conserva validación funcional;
133. la función tecnológica conserva validación técnica sin certificar negocio;
134. la supervisión de sede no recibe autoridad fuera de su territorio por la vista;
135. el equipo operativo recibe pasos concretos y límites;
136. el custodio documental conserva versión y custodia sin absorber aprobación empresarial;
137. seguridad/privacidad conserva tratamiento de exposición sin asumir mando general;
138. el proveedor recibe únicamente el segmento mínimo necesario;
139. una persona con funciones concentradas ve cada función diferenciada;
140. una transferencia de mando no reatribuye pasos históricos;
141. una corrección no reescribe una decisión o evidencia anterior;
142. la versión actual demostrada se distingue visualmente de una versión obsoleta;
143. una versión anterior conocida se distingue de la actual;
144. una vigencia no demostrada se muestra como tal;
145. una copia offline muestra la última vigencia conocida;
146. una copia impresa muestra versión;
147. una copia impresa muestra clasificación;
148. una copia impresa muestra alcance;
149. una copia impresa muestra condición de dejar de usarla;
150. una copia obsoleta no se presenta como vigente;
151. una versión histórica puede conservarse como evidencia;
152. la reconexión revalida versión antes de mutar;
153. la reconexión revalida sesión antes de mutar;
154. la reconexión revalida autorización antes de mutar;
155. la reconexión revalida contexto antes de mutar;
156. el modo offline no amplía el sobre offline;
157. el modo offline no crea una nueva autoridad;
158. el modo offline no inventa confirmaciones remotas;
159. un resultado externo sin confirmación se muestra incierto;
160. un resultado incierto no habilita reintento ciego;
161. un resultado incierto conserva referencia al intento cuando exista;
162. un resultado incierto se entrega a consulta o reconciliación propietaria;
163. abort detiene nuevo efecto dentro del alcance afectado;
164. abort conserva estado y evidencia necesarios;
165. abort genera handoff o escalamiento;
166. abort no se presenta como cierre;
167. un bloqueo muestra la causa material;
168. un bloqueo muestra el siguiente control sin filtrar contenido sensible;
169. una autorización faltante no se sustituye con un botón genérico de forzado;
170. un acceso de emergencia se resuelve en su contrato propietario;
171. la búsqueda no enumera runbooks no autorizados;
172. un contador no filtra existencia de runbooks ocultos;
173. un error no revela títulos o fragmentos sensibles;
174. un enlace profundo vuelve a resolver autorización;
175. un enlace profundo vuelve a resolver sede;
176. un enlace profundo vuelve a resolver estrategia;
177. un enlace profundo vuelve a resolver versión;
178. favoritos o recientes no convierten una versión vieja en vigente;
179. ordenar alfabéticamente no cambia prioridad canónica;
180. la experiencia puede navegarse por teclado;
181. el foco de teclado es visible;
182. el zoom conserva contexto y condiciones materiales;
183. responsive conserva proceso, sede, estrategia, función y versión;
184. móvil prioriza paso actual y condición de detención;
185. color no es el único indicador de bloqueo;
186. color no es el único indicador de vigencia;
187. iconografía material tiene etiqueta o texto semántico;
188. loading no inventa valores;
189. un error de red no convierte desconocido en cero;
190. la caché muestra antigüedad/frescura cuando aplica;
191. una confirmación crítica describe el efecto concreto;
192. la proyección minimiza datos personales;
193. la proyección minimiza evidencia sensible;
194. la proyección minimiza contactos nominales cuando basta una función;
195. la proyección no reproduce secretos;
196. la evidencia puede conservarse por referencia;
197. un proveedor no recibe el runbook completo si basta un segmento;
198. una captura de pantalla no se usa para ampliar audiencia de datos sensibles;
199. el handoff a CONT-UX-004 conserva contexto mínimo sin iniciar esa tarea;
200. el handoff a CONT-UX-005 conserva contexto mínimo sin iniciar esa tarea;
201. el handoff a CONT-UX-006 conserva contexto mínimo sin emitir comunicación;
202. el handoff a CONT-UX-007 conserva contexto mínimo sin declarar readiness;
203. el handoff a CONT-INT-004 conserva referencias sin ejecutar conciliación;
204. la superficie destino vuelve a resolver autorización;
205. la superficie destino no hereda permisos por origen de navegación;
206. la tarea no crea nuevos roles;
207. la tarea no crea nuevos permisos;
208. la tarea no crea nuevos estados de negocio;
209. la tarea no crea nuevas sedes;
210. la tarea no crea nuevas estrategias de contingencia;
211. la tarea no crea nuevos servicios;
212. la tarea no crea nuevas identidades de proceso;
213. la tarea no crea nuevas prioridades de recuperación;
214. la tarea no crea nuevos objetivos RTO/RPO/MTPD/MBCO;
215. la tarea no acredita proveedores sustitutos;
216. la tarea no acredita ubicaciones alternativas;
217. la tarea no ejecuta restore;
218. la tarea no ejecuta failover;
219. la tarea no ejecuta failback;
220. la tarea no captura formularios productivos;
221. la tarea no emite folios reales;
222. la tarea no ejecuta reconciliación;
223. la tarea no cierra incidentes;
224. la tarea no declara readiness;
225. la tarea distingue ESPECIFICADO de IMPLEMENTADO;
226. la tarea distingue ESPECIFICADO de VALIDADO;
227. la tarea conserva pendientes de evidencia como pendientes;
228. la tarea crea cero requisitos de prueba;
229. la tarea modifica cero requisitos de prueba;
230. la tarea difiere cero requisitos de prueba;
231. la tarea descarta cero requisitos de prueba;
232. la tarea vuelve obsoletos cero requisitos de prueba;
233. no se genera una copia innecesaria del registro canónico de requisitos;
234. la tarea no inicia CONT-UX-004;
235. CONT-UX-004 permanece únicamente reservada.

---

#### 26. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

La tarea especializa una experiencia ya exigida por requisitos vigentes: selección y uso controlado de modalidades de contingencia, vigencia de runbooks, accesibilidad, operación responsive y validación de usabilidad. No introduce un efecto empresarial nuevo, un permiso, una transición de dominio, una modalidad nueva, una integración nueva ni una obligación de prueba distinta.

Balance de cambios de requisitos:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 27. Cobertura vigente de prueba

La conducta central de esta tarea ya está cubierta por `TREQ-CONT-003`, que asigna expresamente responsabilidad a `CONT-UX-003` y exige modalidad de contingencia, datos mínimos, identificadores/formularios controlados, responsables, límites, vigencia, custodia, seguridad, suministros y criterio de abandono, sin crear una segunda fuente de verdad ni afirmar un efecto empresarial no confirmado.

`TREQ-CONT-006` protege la revisión periódica de runbooks y el principio de que un plan sin prueba vigente no puede declararse listo. `TREQ-UX-006`, `TREQ-UX-007` y `TREQ-UX-021` cubren comportamiento responsive, validación con roles/sedes/dispositivos representativos y accesibilidad/estados de interfaz sin depender exclusivamente de color o iconografía.

La presente tarea materializa esas obligaciones en el diseño del runbook y checklist; no altera su alcance normativo.

---

#### 28. Estado AS-IS y evidencia

| Elemento                                                 | Estado tras esta tarea   | Evidencia/limitación                                 |
| -------------------------------------------------------- | ------------------------ | ---------------------------------------------------- |
| diseño de resolución por función/proceso/sede/estrategia | `ESPECIFICADO`           | contrato documental de esta tarea                    |
| cobertura de 69 servicios                                | `ESPECIFICADO`           | matriz 69/69 sin identidades nuevas                  |
| estrategias primarias de 67 servicios                    | `ESPECIFICADO`           | heredadas de continuidad; no redecididas aquí        |
| dos servicios AURA diferidos                             | `BLOQUEADO`              | se conserva el bloqueo heredado                      |
| tratamiento UX de `CTG-01` a `CTG-08`                    | `ESPECIFICADO`           | diseño documental                                    |
| alternativas `CTG-09`/`CTG-10` concretas                 | `PENDIENTE_DE_EVIDENCIA` | esta tarea no acredita recurso o tercero sustituto   |
| diseño de versión/vigencia/obsolescencia                 | `ESPECIFICADO`           | control documental materializado                     |
| metadatos reales de versión para cada runbook productivo | `PENDIENTE_DE_EVIDENCIA` | deben provenir de la fuente propietaria implementada |
| pantallas y componentes                                  | `NO_APLICA` en esta fase | implementación física no autorizada                  |
| checklist productivo ejecutable                          | `NO_APLICA` en esta fase | no se ejecutan incidentes por esta tarea             |
| copias impresas productivas                              | `NO_APLICA` en esta fase | no se emiten rangos ni copias reales                 |
| validación con usuarios/sedes/dispositivos reales        | `PENDIENTE_DE_EVIDENCIA` | requiere ejercicio o implementación autorizada       |
| ejecución de runbooks reales                             | **0**                    | tarea exclusivamente documental                      |
| cambios de permisos                                      | **0**                    | se reutiliza autorización canónica                   |
| cambios físicos                                          | **0**                    | sin código, datos ni infraestructura                 |

El hallazgo `H-CAP-SCOPE-018-037`, relativo a contactos, dependencias o runbooks desactualizados que pueden inutilizar el plan, queda **ESPECIFICADO en la capa UX de runbooks** mediante versión visible, actualidad demostrable, señalización de obsolescencia, control de copia y revalidación tras reconexión. Su eficacia real permanece pendiente de validación en una fase autorizada.

---

#### 29. Decisiones sustantivas

1. el runbook se resuelve, no se duplica como nueva fuente de verdad;
2. función, proceso, sede, estrategia y versión son dimensiones obligatorias de resolución;
3. se materializan 69 decisiones UX, una por servicio heredado;
4. 67 servicios proyectan runbook/checklist desde su estrategia vigente;
5. 2 servicios AURA mantienen vista de bloqueo sin checklist operativo ficticio;
6. `CTG-01` a `CTG-08` conservan su distribución heredada;
7. `CTG-09` y `CTG-10` no se presentan como alternativas reales sin acreditación propietaria;
8. lectura de runbook y autoridad de ejecución permanecen separadas;
9. completitud visual de paso y efecto empresarial permanecen separados;
10. ejecución y validación permanecen separadas;
11. éxito técnico y recuperación empresarial permanecen separados;
12. resultado incierto bloquea reintento ciego;
13. abort es una ruta explícita con evidencia y handoff;
14. versión y vigencia ocupan la primera jerarquía;
15. una copia impresa/offline nunca se presume vigente indefinidamente;
16. la reconexión revalida contexto, autorización y versión;
17. la sede seleccionada no amplía autoridad;
18. la función mostrada no crea permisos;
19. proveedor recibe solo el segmento mínimo necesario;
20. secretos permanecen como referencias seguras, nunca como contenido del runbook;
21. evidencia se mantiene por referencia cuando sea suficiente;
22. búsqueda, contador y error no filtran existencia de contenido no autorizado;
23. el paso actual domina la jerarquía visual bajo presión;
24. bloqueo, vigencia y severidad no dependen solo de color;
25. los handoffs posteriores conservan contexto sin absorber la tarea destino;
26. no se crean estados de negocio, roles, permisos, procesos, sedes o modalidades nuevas;
27. no se ejecuta ningún cambio físico;
28. no se crean ni modifican requisitos de prueba.

---

#### 30. Balance de cierre

| Control                                                   | Resultado |
| --------------------------------------------------------- | --------: |
| servicios heredados esperados                             |    **69** |
| servicios materializados en matriz UX                     |    **69** |
| servicios con estrategia primaria activa                  |    **67** |
| servicios bloqueados por aplicación diferida              |     **2** |
| estrategias documentales del catálogo preservadas         |    **10** |
| estrategias presentes como primarias en servicios activos |     **8** |
| sedes internas preservadas                                |     **5** |
| escenarios deterministas                                  |    **14** |
| decisiones sustantivas                                    |    **28** |
| criterios de aceptación                                   |   **235** |
| cambios físicos                                           |     **0** |
| requisitos de prueba creados o modificados                |     **0** |

---

#### 31. Continuidad

ÚLTIMA TAREA APROBADA

`CONT-UX-002 — Diseñar centro de mando del incidente con línea de tiempo, servicios afectados y recuperación`

TAREA ACTUAL APROBADA

`CONT-UX-003 — Diseñar runbooks y checklists simples por rol, proceso, sede y modalidad`

SIGUIENTE TAREA RESERVADA

`CONT-UX-004 — Diseñar captura controlada durante la falla y reincorporación posterior`


### ✅ CONT-UX-004 — Diseñar captura controlada durante la falla y reincorporación posterior

**Estado:** APROBADA
**Tarea anterior:** `CONT-UX-003 — Diseñar runbooks y checklists simples por rol, proceso, sede y modalidad` — APROBADA
**Tarea siguiente:** `CONT-UX-005 — Diseñar seguimiento de respaldos, restauración, failover, validación y pendientes` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de experiencia para captura contingente, custodia, transición de reconexión, revisión humana, reincorporación, conflicto y conciliación posterior sin crear una segunda fuente de verdad
**Bloque:** AC — Continuidad operativa y recuperación
**Fase:** exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`
**Implementación técnica u operativa:** no autorizada
**Servicios evaluados:** 69 / 69
**Servicios activos con experiencia de captura/reincorporación especificada:** 67 / 67
**Servicios AURA bloqueados:** 2 / 2
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Diseñar la experiencia completa mediante la cual Vento OS permite capturar trabajo de forma controlada durante una falla y, posteriormente, revisar, admitir, reincorporar y conciliar ese trabajo sin duplicar efectos, perder atribución, fabricar autoridad, sobrescribir historia ni convertir un medio temporal en una segunda fuente de verdad empresarial.

La tarea cubre la experiencia humana desde el momento en que una capacidad entra en modo contingente hasta que cada unidad queda con un resultado autoritativo o una disposición explícita del dominio propietario.

```text
CAPTURA DURANTE FALLA
!= RESULTADO EMPRESARIAL CONFIRMADO

CONECTIVIDAD RECUPERADA
!= REPLAY AUTOMATICO

DIGITALIZACION
!= REINCORPORACION ACEPTADA

UPLOAD
!= EVIDENCIA VINCULADA

SYNC
!= CONCILIACION

REINCORPORACION
!= CIERRE DEL INCIDENTE
```

La experiencia debe hacer visible la diferencia entre lo observado, lo guardado localmente, lo enviado, lo aceptado, el efecto empresarial, la confirmación propietaria y la conciliación posterior.

---

#### 2. Resultado sustantivo

Quedan materializados los siguientes resultados documentales:

1. una arquitectura UX de tres momentos: captura durante falla, transición de reconexión y reincorporación posterior;
2. un encabezado persistente de modo contingente que muestra incidente, proceso, sede/área, estrategia, conectividad, frescura y función efectiva sin fabricar autoridad;
3. una superficie de captura que conserva identidad, actor, contexto, hora observada, recurso, versión, evidencia, folio u operación local cuando apliquen;
4. una gramática de estado que reutiliza los estados canónicos de operación local y evidencia, sin taxonomías paralelas;
5. una experiencia específica para las ocho estrategias activas `CTG-01` a `CTG-08`;
6. tratamiento condicional y no instanciado de `CTG-09` y `CTG-10`;
7. bloqueo explícito de los dos servicios AURA diferidos;
8. una experiencia de folio manual que preserva rango, original, condición, anulación, pérdida, deterioro, duplicado, excepción y cadena de custodia;
9. una experiencia de evidencia que separa pieza local, upload, vínculo y confirmación;
10. una transición de reconexión que primero verifica condiciones y clasifica pendientes antes de cualquier sincronización elegible;
11. una bandeja de reincorporación que distingue causalidad, prioridad, propietario, estado, antigüedad, evidencia y siguiente acción;
12. una ficha de unidad que separa actor/contexto históricos de autoridad/contexto actuales;
13. una puerta visual de admisión que materializa los doce controles definidos por el dominio de reincorporación;
14. una experiencia de idempotencia y deduplicación que no ofrece un segundo intento independiente cuando el resultado previo puede existir;
15. una experiencia específica de `RESULT_UNKNOWN` centrada en verificar receipt, recurso y resultado antes de actuar;
16. una experiencia de conflicto que reutiliza las clases y resoluciones canónicas y prohíbe `last write wins`;
17. una experiencia de expiración que distingue efecto ocurrido de trabajo todavía no ejecutado;
18. una experiencia de efecto parcial que preserva las partes confirmadas y pendientes por separado;
19. una experiencia de cuarentena que conserva datos, razón y propietario sin ejecutar contenido incompatible;
20. una vista de dependencias que separa prioridad `SYNC-*` de elegibilidad causal;
21. representación de los tres corredores empresariales de precedencia ya aprobados sin trasladar propiedad entre dominios;
22. una secuencia visible de confirmación por capas: registro, decisión propietaria, hecho autoritativo, efectos derivados y conciliación;
23. una vista de conciliación por frente empresarial sin obligar a duplicar el dato en todas las aplicaciones;
24. un balance de pendientes por incidente que impide ocultar unidades, conflictos, resultados desconocidos, evidencia o efectos downstream;
25. una regla UX que impide presentar `DESACTIVADO` como `CERRADO`;
26. una frontera expresa que permite mostrar bloqueos de cierre sin conceder autoridad de cierre a esta superficie;
27. separación entre quien capturó, quien digitalizó, quien revisó, quien decidió y quien ejecutó una acción posterior;
28. minimización de datos sensibles en la ruta ordinaria y divulgación progresiva del detalle de evidencia, custodia y auditoría;
29. mensajes deterministas que explican qué ocurrió, qué se conservó, qué está pendiente y qué acción es segura;
30. tratamiento de dispositivos compartidos y cambio de actor/área sin transferencia implícita de borradores, cola o custodia;
31. tratamiento de capacidad local y backpressure sin descarte silencioso de trabajo ni evidencia obligatoria;
32. una matriz 69 / 69 que conserva identidad, propietaria, BIA, estrategia y prioridad heredadas y materializa la decisión UX por servicio;
33. reconciliación cuantitativa de las 67 capacidades activas y los dos bloqueos AURA;
34. dieciocho escenarios deterministas de fallo, reconexión, resultado desconocido, folio, autoridad, conflicto y conciliación;
35. handoffs explícitos hacia las tareas propietarias de autorización, integración, recuperación, evidencia y certificación sin ejecutarlas;
36. cero cambios físicos, cero cambios productivos y cero cambios en requisitos de prueba.

---

#### 3. Entradas canónicas consumidas

Esta tarea consume y conserva, sin redefinirlas:

- `CONT-DOM-009`, para registro, folios, evidencia, custodia, tiempos y trabajo ejecutado durante la falla;
- `CONT-DOM-010`, para admisión, idempotencia, duplicados, conflictos, orden causal, reincorporación, conciliación y balance de pendientes;
- `CONT-AUTH-004`, para segregación entre ejecución, validación, reincorporación, conciliación, recuperación total y cierre;
- `CONT-UX-001`, para estado ejecutivo, impacto, prioridades, responsables, decisiones y bloqueos;
- `CONT-UX-002`, para centro de mando, línea de tiempo, servicios afectados y dimensiones de recuperación;
- `CONT-UX-003`, para runbooks/checklists por función, proceso, sede y modalidad;
- `NFR-REQ-004`, para perfiles offline, estados de operación local, estados de evidencia, prioridades `SYNC-*`, reconexión, idempotencia, conflictos, causalidad y aislamiento por actor/dispositivo/contexto;
- el registro canónico vigente de requisitos de continuidad, UX e integración, como cobertura de prueba ya existente;
- la secuencia prioritaria vigente, que mantiene esta tarea en `CONDITIONAL_DESIGN_ARTIFACTS` y prohíbe implementación física en este momento.

La tarea no altera los 69 servicios BIA, las 67 estrategias activas, los dos bloqueos AURA, las prioridades `SYNC-*`, la propiedad de los hechos ni las reglas de autoridad ya aprobadas.

---

#### 4. Arquitectura de experiencia

La experiencia se organiza en tres momentos que pueden coexistir por unidad, pero no se confunden:

| Momento                        | Objetivo                                                    | Acción principal                                                         | Resultado que puede afirmar                               | Resultado que no puede afirmar                                |
| ------------------------------ | ----------------------------------------------------------- | ------------------------------------------------------------------------ | --------------------------------------------------------- | ------------------------------------------------------------- |
| `M1_CAPTURA_DURANTE_FALLA`     | preservar trabajo y evidencia bajo la estrategia autorizada | registrar, proteger, diferir o ejecutar solo lo permitido                | que existe un registro contingente con estado verdadero   | que el dominio propietario ya confirmó el efecto              |
| `M2_TRANSICION_DE_RECONEXION`  | comprobar si es seguro procesar cada unidad                 | verificar contexto, receipts, recurso, esquema, evidencia y dependencias | que la unidad es elegible, bloqueada o requiere decisión  | que toda la cola puede reproducirse automáticamente           |
| `M3_REINCORPORACION_POSTERIOR` | obtener decisión propietaria y conciliar efectos            | aceptar, rechazar, corregir, escalar o conciliar según autoridad         | resultado autoritativo o disposición explícita por unidad | cierre del incidente por el solo hecho de terminar una unidad |

La unidad visual primaria es una intención, observación, hecho físico, registro manual, borrador o elemento diferido identificable de forma estable. Un archivo, lote de papeles o cola completa no adquiere por sí mismo una identidad empresarial única.

---

#### 5. Encabezado persistente de modo contingente

Toda superficie de esta tarea deberá mantener visible, en densidad adecuada al actor:

```text
incidente o referencia temporal disponible
proceso / capacidad
sede y área cuando apliquen
estrategia de contingencia vigente
estado de conectividad relevante para esa operación
frescura de la referencia usada
función efectiva del actor
estado de la unidad
último cambio relevante
```

Reglas:

- un selector visual no concede permiso;
- una etiqueta de función no reemplaza la decisión de autorización;
- Wi-Fi visible no equivale a `ONLINE_STABLE`;
- la superficie no oculta que trabaja sobre una referencia cacheada o una versión observada;
- la ruta ordinaria muestra el mínimo necesario y el detalle técnico queda en divulgación progresiva;
- un incidente sin identificador canónico todavía disponible puede conservar una referencia temporal sin reenumerar después el trabajo.

---

#### 6. Estados de conectividad y disponibilidad para la experiencia

Se reutilizan exactamente:

```text
ONLINE_STABLE
ONLINE_DEGRADED
PARTIAL_SERVICE
OFFLINE_CONFIRMED
CONNECTIVITY_UNKNOWN
RECOVERING_SYNC
SYNC_BLOCKED
```

La interfaz no reduce estos estados a un icono de red. El estado se determina con las dependencias necesarias para la operación: transporte, identidad/sesión, `AccessContext`, servicio propietario, sincronización, reloj confiable, almacenamiento local seguro, dependencia externa y periférico cuando apliquen.

Mensajes mínimos:

| Estado                 | Mensaje operativo                                              | Acción segura                                            |
| ---------------------- | -------------------------------------------------------------- | -------------------------------------------------------- |
| `ONLINE_STABLE`        | servicios requeridos disponibles para esta operación           | continuar según el contrato ordinario                    |
| `ONLINE_DEGRADED`      | la operación dispone de conectividad con degradación relevante | continuar solo con las capacidades habilitadas           |
| `PARTIAL_SERVICE`      | falta una dependencia concreta                                 | mostrar qué parte puede continuar y cuál queda bloqueada |
| `OFFLINE_CONFIRMED`    | no existe ruta autoritativa disponible                         | usar solo la estrategia contingente aprobada             |
| `CONNECTIVITY_UNKNOWN` | no puede demostrarse la disponibilidad requerida               | evitar nuevas mutaciones sensibles y diagnosticar        |
| `RECOVERING_SYNC`      | se recuperan servicios y se clasifican pendientes              | no presentar la cola como conciliada                     |
| `SYNC_BLOCKED`         | existe una condición que impide procesar una o más unidades    | mostrar causa, propietario y siguiente acción            |

---

#### 7. Estados canónicos de una operación local

La superficie reutiliza exactamente los estados aprobados y los presenta con lenguaje humano sin cambiar su identidad:

| Estado                    | Significado visible                                                         | CTA ordinario permitido                                            |
| ------------------------- | --------------------------------------------------------------------------- | ------------------------------------------------------------------ |
| `DRAFT_LOCAL`             | borrador guardado localmente; todavía no es una intención confirmada        | continuar edición o descartar si es permitido                      |
| `CAPTURED_LOCAL`          | observación o captura conservada en el dispositivo                          | revisar evidencia y esperar reincorporación                        |
| `QUEUED`                  | unidad preparada para procesamiento posterior                               | ver posición, dependencias y prioridad; no duplicar                |
| `WAITING_DEPENDENCY`      | falta un prerrequisito                                                      | abrir dependencia o esperar su resolución                          |
| `VALIDATING`              | se verifican condiciones de admisión                                        | ver controles; no crear una intención paralela                     |
| `SYNCING`                 | la misma intención está siendo procesada                                    | consultar estado; no reenviar manualmente                          |
| `ACCEPTED_PENDING_EFFECT` | el dominio aceptó la operación, pero el efecto final aún no está confirmado | consultar progreso o receipt                                       |
| `CONFIRMED`               | existe resultado autoritativo verificable                                   | abrir resultado y efectos derivados                                |
| `REJECTED`                | la propietaria rechazó la unidad                                            | ver motivo y opciones autorizadas                                  |
| `CONFLICT`                | existen estados incompatibles que requieren resolución                      | revisar diferencia y resolver con opción permitida                 |
| `RESULT_UNKNOWN`          | no puede afirmarse si el efecto ocurrió                                     | verificar receipt y recurso                                        |
| `EXPIRED`                 | la intención original ya no puede ejecutarse bajo sus condiciones previas   | disponer o crear intención actual enlazada si procede              |
| `SUPERSEDED`              | otra intención vigente la sustituyó                                         | abrir sucesora; no ejecutar la anterior                            |
| `QUARANTINED`             | la unidad se conserva pero no es ejecutable bajo el contrato actual         | revisar causa y escalar/transformar solo si existe ruta autorizada |
| `RECONCILIATION_REQUIRED` | el efecto o representación todavía no converge con los dominios aplicables  | abrir conciliación                                                 |
| `DISCARDED_WITH_REASON`   | el borrador o unidad descartable fue cerrado con motivo explícito           | consultar historia                                                 |

No se introduce un estado nuevo para simplificar la interfaz.

---

#### 8. Captura mínima común durante la falla

La experiencia solicita o conserva únicamente los campos aplicables del contrato de registro. En la ruta ordinaria se agrupan así:

| Grupo UX               | Datos canónicos que puede contener                                            | Regla                                                      |
| ---------------------- | ----------------------------------------------------------------------------- | ---------------------------------------------------------- |
| identidad del trabajo  | incidente observado, folio, proceso, servicio, estrategia, tipo de registro   | ninguna referencia sustituye otra identidad                |
| atribución             | principal, actor, función, dispositivo, contexto, sede, área, turno, check-in | el operador posterior no reemplaza al actor original       |
| recurso                | referencias y versiones observadas                                            | la versión observada no se presenta como versión actual    |
| autorización observada | referencia del envelope cuando exista                                         | describe autoridad histórica; no concede autoridad actual  |
| identidad local        | `local_operation_id`, `idempotency_key`, `sequence_ref`, `payload_hash`       | permanece estable durante retries y reincorporación        |
| tiempo                 | `observed_at`, `created_local_at`, `recorded_at`, `handoff_at`                | cada tiempo conserva su significado                        |
| evidencia              | `evidence_refs[]`, receipts externos, sensibilidad                            | upload no equivale a vínculo ni confirmación               |
| efecto                 | estado observado, efecto reclamado, motivo de pendiente                       | un efecto no confirmado permanece explícitamente pendiente |
| custodia               | custodio, estado y excepción                                                  | transferencia requiere handoff trazable                    |
| conciliación           | indicador de conciliación requerida                                           | marca necesidad; no ejecuta conciliación                   |

Los valores desconocidos no se rellenan para poder avanzar. La interfaz marca ausencia, incertidumbre o incompatibilidad de forma explícita.

---

#### 9. Experiencia por estrategia durante la falla

| Estrategia                                       | Acción primaria de UX             | Información obligatoria visible                                                                     | Afirmación prohibida                                |
| ------------------------------------------------ | --------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------- |
| `CTG-01_BLOQUEAR_Y_PROTEGER`                     | registrar protección/bloqueo      | actor/función, hora, alcance, motivo, acción protectora y estado observado                          | que el efecto bloqueado se ejecutó                  |
| `CTG-02_REFERENCIA_VERSIONADA`                   | consultar referencia controlada   | fuente, versión, fetched_at, valid_until, frescura, actor y hora                                    | que una referencia vencida sigue vigente            |
| `CTG-03_BORRADOR_LOCAL`                          | guardar preparación               | actor, contexto, recurso, versiones observadas, hora local y sensibilidad                           | aprobación, publicación, reserva o compromiso       |
| `CTG-04_CAPTURA_LOCAL_PENDIENTE`                 | registrar observación             | hora observada, actor, contexto, recurso, evidencia y estado pendiente                              | aceptación, corrección, cierre o impacto confirmado |
| `CTG-05_EJECUCION_OFFLINE_ACOTADA`               | ejecutar solo dentro del envelope | operación, actor, recurso/versión, envelope, idempotencia, secuencia, evidencia y receipts          | efecto fuera del envelope o éxito sin confirmación  |
| `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO`         | registrar medio manual            | folio, actor, hora real, sede/área, recurso, acción, cantidad/unidad si aplica, evidencia y handoff | incorporación digital o cierre autoritativo         |
| `CTG-07_SERVICIO_REDUCIDO_CONTROLADO`            | operar alcance reducido           | MBCO preservado, límites, trabajo aceptado/rechazado y subregistro de cada acción                   | servicio completo o capacidad fuera del MBCO        |
| `CTG-08_DIFERIMIENTO_CONTROLADO`                 | registrar backlog                 | item estable, propietario, origen, fecha, deadline, motivo y condición de reanudación               | trabajo ejecutado                                   |
| `CTG-09_ALTERNATIVA_FISICA_CONDICIONAL`          | no instanciada                    | solo podrá existir cuando la alternativa esté acreditada                                            | que existe hoy una alternativa física               |
| `CTG-10_ALTERNATIVA_PROVEEDOR_CANAL_CONDICIONAL` | no instanciada                    | solo podrá existir cuando el tercero/canal esté acreditado                                          | que existe hoy un proveedor o canal alterno         |

---

#### 10. Folios y medios manuales

Cuando el perfil use un medio físico, la pantalla o formulario de apoyo debe preservar el folio como referencia estable, inmutable, no reutilizable y trazable al emisor. La experiencia no promete que exista hoy un talonario, impresora, papel, sello o almacenamiento seguro; esa disponibilidad debe demostrarse en la fase propietaria.

Tratamiento visible de excepciones:

| Evento               | Estado UX                        | Acción segura                                                         |
| -------------------- | -------------------------------- | --------------------------------------------------------------------- |
| folio anulado        | consumido y no reutilizable      | conservar motivo, actor, hora y soporte disponible                    |
| folio perdido        | faltante de custodia             | registrar rango, último custodio e impacto posible; no recrear número |
| folio deteriorado    | legibilidad/integridad degradada | enlazar digitalización o transcripción declarando deterioro           |
| folio ilegible       | dato no demostrable              | mandar a revisión; no completar por intuición                         |
| folio duplicado      | conflicto de identidad           | bloquear confirmación automática y escalar                            |
| folio fuera de rango | excepción no confiable           | demostrar origen antes de aceptar                                     |
| salto de secuencia   | brecha de inventario             | explicar uso, anulación, pérdida o no emisión                         |
| página adicional     | parte del registro principal     | vincular y preservar integridad                                       |

Una corrección conserva el dato original y registra antes/después, actor, hora y motivo.

---

#### 11. Cadena de custodia y handoff

La experiencia debe permitir reconstruir:

```text
quien creo u observo la pieza
quien la tuvo bajo control
cuando cambio de custodia
que medio o contenedor se transfirio
que folio o rango la identifica
que condicion tenia al entregar y recibir
que excepcion ocurrio
quien asumio la responsabilidad siguiente
```

Cada handoff muestra, cuando aplique:

```text
from_custodian_ref
to_custodian_ref
handoff_at
medium_ref
folio_or_range
condition_at_handoff
exception_reason
acknowledgement_ref
```

La custodia física, la representación digital y el vínculo autoritativo son estados separados. Fotografiar, escanear o subir un original no autoriza su destrucción.

---

#### 12. Evidencia y adjuntos

Se reutilizan exactamente los estados:

```text
LOCAL_ONLY
QUEUED
UPLOADING
UPLOADED_UNLINKED
LINKED_AND_CONFIRMED
FAILED_RETRYABLE
FAILED_TERMINAL
QUARANTINED
```

La experiencia debe mostrar por pieza:

- origen y relación con la unidad;
- estado real de transferencia;
- si el dominio propietario ya la enlazó;
- sensibilidad y visibilidad permitida;
- fallo o cuarentena;
- relación con un original físico cuando exista;
- siguiente acción segura.

`UPLOADED_UNLINKED` se presenta como “subido, todavía no vinculado”, nunca como evidencia completa. Una fotografía, firma, medición, impresión, receipt o testigo solo se solicita cuando el contrato del proceso lo requiera; no se convierte en requisito universal por comodidad de interfaz.

---

#### 13. Tiempos y secuencia visibles

La superficie separa, cuando sean relevantes:

```text
observed_at
created_local_at
recorded_at
first_send_at
accepted_at
business_effect_at
confirmed_at
reconciled_at
handoff_at
```

La vista resumida prioriza “ocurrió”, “se registró” y “se confirmó”; el detalle de auditoría conserva todos los tiempos aplicables.

Reglas:

- la hora de sincronización no reemplaza la hora de observación;
- la hora de registro no se presenta como hora del efecto empresarial;
- `confirmed_at` representa confirmación propietaria;
- `reconciled_at` aparece únicamente después de conciliación aplicable;
- un reloj dudoso conserva la incertidumbre;
- el orden causal puede prevalecer sobre el orden de timestamps si existe evidencia que lo justifique.

---

#### 14. Dispositivos compartidos, actor y contexto

Toda partición local mantiene la combinación aplicable de dispositivo, actor, contexto, sede y área. Al cambiar de actor o área:

1. se detienen nuevas mutaciones de la partición anterior;
2. no se transfieren borradores, cola, claims ni custodia;
3. los pendientes anteriores conservan atribución original;
4. la visibilidad se minimiza para el nuevo actor;
5. se resuelven sesión y contexto actuales;
6. sin mecanismo de identidad offline aprobado, la estación pasa a consulta o a la contingencia permitida.

La vista de reincorporación muestra por separado:

```text
ACTOR Y CONTEXTO OBSERVADOS DURANTE LA FALLA
AUTORIDAD Y CONTEXTO ACTUALES PARA LA ACCION PENDIENTE
```

Esta separación impide que una sesión nueva reescriba quién produjo el registro original.

---

#### 15. Capacidad local y backpressure

Cuando un paquete físico implemente almacenamiento local, la UX deberá exponer antes de alcanzar límites críticos:

- cantidad de operaciones pendientes;
- antigüedad máxima;
- evidencia pendiente de transferencia;
- riesgo de capacidad;
- trabajo bloqueado por dependencia;
- condición de pausa segura o contingencia.

La experiencia nunca resuelve capacidad eliminando silenciosamente la unidad más antigua o evidencia obligatoria. Al alcanzar un límite duro aplicará el comportamiento protector definido por el paquete: backpressure, solo lectura, pausa segura o contingencia aprobada.

---

#### 16. Transición de reconexión

La reconexión se representa como una transición controlada, no como una animación de “sincronizando todo”. La secuencia visible respeta:

```text
1. estabilizar conectividad
2. verificar hora, DNS y servicios requeridos
3. revalidar sesion y dispositivo
4. resolver AccessContext actual
5. obtener revocaciones, versiones y politicas vigentes
6. validar esquema de unidades locales
7. consultar receipts e idempotency keys
8. clasificar pendientes, expirados, desconocidos y conflictos
9. ordenar por dependencias y prioridad
10. procesar unidades elegibles sin bloquear trabajo foreground
11. detener solo la rama afectada ante conflicto
12. actualizar proyecciones
13. mostrar balance humano y pendientes restantes
```

La interfaz puede automatizar pasos técnicos cuando el contrato físico lo permita, pero no oculta su resultado ni transforma un paso técnico en decisión propietaria.

---

#### 17. Bandeja de reincorporación

La bandeja se diseña para trabajo operativo y de supervisión, con densidad progresiva.

Resumen por unidad:

```text
servicio / proceso
origen y tipo de registro
folio u operacion local
actor original
sede / area
hora observada
estrategia
estado
prioridad sync
bloqueo o dependencia
propietario de la siguiente decision
evidencia necesaria
siguiente accion segura
```

Filtros permitidos: proceso, servicio, sede, área, estrategia, propietaria, estado, prioridad, antigüedad, tipo de bloqueo y responsable. Los filtros ordenan la vista; no fabrican contexto, autorización ni elegibilidad causal.

Vistas recomendadas por intención:

| Vista            | Contenido                                                                | Uso                 |
| ---------------- | ------------------------------------------------------------------------ | ------------------- |
| `MIS_PENDIENTES` | unidades cuya siguiente acción corresponde a la función efectiva         | trabajo inmediato   |
| `BLOQUEADAS`     | conflicto, cuarentena, resultado desconocido, evidencia o dependencia    | resolución dirigida |
| `EN_PROCESO`     | validando, sincronizando o aceptada pendiente de efecto                  | seguimiento         |
| `CONCILIACION`   | unidades con resultado propietario pero efectos aplicables pendientes    | convergencia        |
| `RESUELTAS`      | confirmadas, rechazadas, superseded o descartadas con disposición válida | consulta histórica  |

Estas etiquetas son categorías de vista, no estados canónicos persistentes.

---

#### 18. Ficha de una unidad

La ficha completa separa cinco zonas:

1. **Origen histórico:** incidente, estrategia, actor, contexto, sede/área, tiempos, folio u operación local.
2. **Contenido y evidencia:** recurso, versiones observadas, payload/hash, evidencia, receipts y custodia.
3. **Estado actual:** recurso y versión actuales, dependencias, conectividad, estado local y resultado conocido.
4. **Autoridad y propiedad:** dominio propietario, función que puede decidir y autoridad actual aplicable.
5. **Acción y trazabilidad:** puerta de admisión, decisión, resultado, efectos derivados y conciliación.

El diseño no coloca un botón de acción al inicio de la ficha antes de mostrar el estado y los bloqueos que determinan si esa acción es segura.

---

#### 19. Puerta UX de admisión

Antes de habilitar una acción que produzca o confirme un efecto, la interfaz presenta los controles aplicables:

|    # | Control        | Pregunta que debe resolver la UX                                             | Resultado de bloqueo                              |
| ---: | -------------- | ---------------------------------------------------------------------------- | ------------------------------------------------- |
|    1 | origen         | ¿existe registro, folio, operación local, backlog o evidencia identificable? | unidad no procesable hasta identificar origen     |
|    2 | integridad     | ¿hash, rango, secuencia y custodia disponibles son coherentes?               | revisión de integridad/custodia                   |
|    3 | incidente      | ¿la unidad está vinculada o puede relacionarse sin reenumerarla?             | enlace temporal pendiente                         |
|    4 | atribución     | ¿se conserva quién, dónde y bajo qué contexto produjo el registro?           | no reasignar al operador actual                   |
|    5 | esquema        | ¿la versión se interpreta mediante un contrato vigente?                      | `QUARANTINED` si es incompatible                  |
|    6 | receipts       | ¿ya existe un resultado externo o propietario para esta intención?           | consultar/vincular antes de reenviar              |
|    7 | recurso actual | ¿el recurso existe y qué versión/estado tiene ahora?                         | conflicto o revalidación                          |
|    8 | autorización   | ¿el efecto pendiente está permitido bajo autoridad actual?                   | bloquear nueva ejecución si no                    |
|    9 | evidencia      | ¿las piezas requeridas existen, son legibles y están vinculables?            | evidencia pendiente o excepción admisible         |
|   10 | dependencias   | ¿los prerrequisitos están confirmados o dispuestos?                          | `WAITING_DEPENDENCY`                              |
|   11 | propiedad      | ¿qué dominio decide aceptar, rechazar, corregir o escalar?                   | no habilitar decisión transversal sin propietario |
|   12 | resultado      | ¿qué efecto o disposición quedará registrado?                                | no terminar en un estado ambiguo                  |

No todos los controles exigen intervención humana. La experiencia muestra intervención solo cuando el contrato no puede resolver el control automáticamente o cuando la decisión pertenece a una función humana autorizada.

---

#### 20. Autoridad histórica y autoridad actual

La experiencia distingue dos preguntas:

```text
¿QUIEN HIZO U OBSERVO EL HECHO DURANTE LA FALLA Y BAJO QUE CONTEXTO?

¿QUIEN PUEDE EJECUTAR O DECIDIR AHORA EL EFECTO QUE TODAVIA NO HA OCURRIDO?
```

Reglas:

- una observación física real se conserva aunque la persona ya no tenga hoy el mismo permiso;
- una mutación pendiente que nunca ocurrió exige autorización y estado vigentes antes de ejecutarse;
- el operador de digitalización no hereda la autoridad del actor original;
- el ejecutor de sincronización no obtiene capacidad para aprobar el resultado;
- la función de continuidad coordina, pero la decisión propietaria permanece en el dominio correspondiente;
- ninguna acción crítica se habilita solo porque el usuario pueda abrir la pantalla.

---

#### 21. Idempotencia y detección de duplicados

La UX presenta la identidad estable de la intención y las señales de posible duplicado sin pedir al operador que invente una clave.

Tratamiento:

```text
MISMA IDEMPOTENCY KEY + MISMO CONTENIDO
→ consultar y enlazar resultado existente
→ no mostrar una segunda ejecución como acción ordinaria

MISMA IDEMPOTENCY KEY + CONTENIDO DIFERENTE
→ CONFLICT
→ preservar ambos datos
→ resolver mediante opción permitida
```

Las señales de duplicado se muestran por capas: identidad técnica, contenido, folio/medio manual, receipt, recurso/versión/secuencia y semántica empresarial. Una coincidencia débil no permite descartar automáticamente una unidad.

---

#### 22. Experiencia de `RESULT_UNKNOWN`

`RESULT_UNKNOWN` recibe tratamiento propio porque el riesgo principal es duplicar un efecto que quizá ya ocurrió.

La pantalla muestra:

```text
resultado no comprobado
ultima solicitud o accion conocida
idempotency key / operacion estable
receipts disponibles o ausentes
recurso y version actuales
hora del intento
siguiente verificacion segura
```

Orden de acción:

```text
CONSULTAR RECEIPT
→ CONSULTAR RECURSO Y VERSION
→ COMPARAR IDENTIDAD Y CONTENIDO
→ VINCULAR RESULTADO EXISTENTE
  O REINTENTAR LA MISMA INTENCION SI EL CONTRATO LO PERMITE
→ SI SIGUE INCIERTO: RECONCILIATION_REQUIRED
```

El CTA ordinario es “Verificar resultado”, no “Intentar de nuevo”.

---

#### 23. Conflictos y opciones de resolución

Clases reutilizadas:

```text
RESOURCE_VERSION_CONFLICT
CONTEXT_CHANGED
AUTHORIZATION_CHANGED
DUPLICATE_OPERATION
DEPENDENCY_REJECTED
SCHEMA_INCOMPATIBLE
BUSINESS_STATE_CHANGED
QUANTITY_CONFLICT
CUSTODY_CONFLICT
TIME_WINDOW_EXPIRED
CLOCK_INVALID
LOCAL_STORAGE_CORRUPTED
```

Opciones canónicas que la UI puede exponer únicamente cuando sean aplicables y autorizadas:

```text
ACCEPT_SERVER_STATE
REAPPLY_ALLOWED_FIELDS
CREATE_CORRECTION
SPLIT_OPERATION
ESCALATE
DISCARD_LOCAL_DRAFT
MANUAL_RECONCILIATION
```

Cada opción debe explicar antes de confirmar:

- qué valor o hecho se conserva;
- qué no se ejecutará;
- si existe un hecho físico ya ocurrido;
- qué actor y autoridad resuelven;
- qué evidencia quedará;
- qué efectos derivados permanecen pendientes.

No existe una opción genérica “usar el último valor” para efectos empresariales.

---

#### 24. Expiración, borradores y efecto parcial

**Expiración**

- si la operación nunca produjo efecto, no se ejecuta por haber recuperado conectividad;
- si todavía es necesaria, la UX permite originar una intención actual revalidada y enlazada con la expirada;
- si el efecto ocurrió mientras era válido, se preserva el hecho y se concilia su representación;
- una unidad expirada sin disposición permanece en el balance.

**Borrador**

- puede continuar como trabajo actual solo después de revalidar actor, contexto, recurso y versión;
- puede descartarse únicamente cuando es un borrador descartable y queda motivo;
- nunca se backdatea como efecto ocurrido durante la falla.

**Efecto parcial**

- se visualiza cada parte confirmada y pendiente;
- la parte confirmada no se vuelve a emitir;
- la parte pendiente conserva identidad y estado propios;
- cualquier compensación, reversión o corrección aparece como intención nueva y solo si el dominio la autoriza.

---

#### 25. Orden causal, dependencias y prioridad `SYNC-*`

La bandeja no usa FIFO global como semántica de ejecución. Cada unidad muestra por separado:

```text
DEPENDENCIAS
ELEGIBILIDAD CAUSAL
PRIORIDAD SYNC
ESTADO
PROPIETARIO
```

Reglas visuales:

- una operación dependiente se muestra “esperando” aunque tenga prioridad superior;
- una rama independiente puede continuar aunque otra esté en conflicto;
- una operación `SUPERSEDED` se muestra fuera de la ruta de ejecución;
- la prioridad ayuda a ordenar trabajo causalmente elegible, no a saltar prerequisitos;
- una dependencia rechazada explica qué unidades quedan bloqueadas o deben reclasificarse.

---

#### 26. Corredores empresariales de precedencia

Los tres corredores aprobados se muestran como relaciones de propietario y efectos derivados, no como un workflow universal rígido:

```text
PULSO confirma venta
→ NEXO aplica salida
→ PASS aplica puntos cuando corresponda
→ NUMERA registra efecto economico
```

```text
ORIGO confirma compra o recepcion empresarial
→ NEXO aplica entrada fisica
→ NUMERA registra obligacion
```

```text
FOGO confirma lote y resultado productivo
→ NEXO aplica consumos y salida de producto
→ NUMERA calcula costo
```

La interfaz marca cada nodo con su estado propio. El fallo de un consumidor no convierte en no ocurrido el hecho ya confirmado por la propietaria.

---

#### 27. Confirmación por capas

La ficha de unidad representa el progreso así:

```text
REGISTRO CONTINGENTE
→ DECISION DEL DOMINIO PROPIETARIO
→ HECHO AUTORITATIVO CONFIRMADO O RECHAZADO
→ EFECTOS DERIVADOS APLICABLES
→ CONCILIACION POR CADA DOMINIO CONSUMIDOR
→ UNIDAD RESUELTA
```

Una unidad “resuelta” dentro de esta superficie significa que el tratamiento de esa unidad terminó conforme a sus efectos aplicables. No implica por sí sola recuperación total, desactivación o cierre del incidente.

---

#### 28. Frentes de conciliación

La vista de conciliación activa solo los frentes aplicables al incidente y muestra propietario, estado, diferencias, evidencia y siguiente acción:

| Frente                         | Comprobación UX mínima                                                                                    |
| ------------------------------ | --------------------------------------------------------------------------------------------------------- |
| personas y asistencia          | marcaciones, novedades, correcciones y jornadas sin duplicado por replay                                  |
| compras y recepciones          | orden, recepción, diferencias y obligaciones relacionadas sin entradas dobles                             |
| inventario, custodia y activos | movimientos, cantidades, lotes, ubicaciones, tenencias y handoffs convergentes                            |
| producción y calidad           | lotes, consumos, resultados, retenciones y reprocesos con receta/versión y secuencia correctas            |
| pedidos, ventas y servicio     | pedido, entrega, venta, devolución, reserva y estado de canal sin recreaciones                            |
| dinero, pagos y caja           | cobros, pagos, efectivo, obligaciones y cartera con receipt y una sola aplicación del efecto              |
| documentos y evidencia         | original, archivo, metadatos, versión, firma aplicable, hash y vínculo autoritativo                       |
| comunicaciones                 | destinatario, canal, intento, resultado y excepción cuando la entrega sea material                        |
| colas, accesos e integraciones | operaciones, jobs, eventos, permisos, revocaciones y proveedores sin resultado silenciosamente abandonado |

La vista compara; no convierte una proyección o reporte en fuente propietaria.

---

#### 29. Balance de pendientes del incidente

La experiencia deberá poder mostrar y reconciliar conteos y referencias para:

```text
unidades identificadas
unidades sin replay requerido
borradores o backlog convertidos en trabajo actual
unidades en validacion o sincronizacion
hechos confirmados por propietaria
unidades rechazadas con motivo
unidades superseded con sucesora
borradores descartados con motivo
operaciones expiradas con disposicion
conflictos abiertos
resultados desconocidos abiertos
unidades quarantined
unidades en reconciliation_required
evidencia obligatoria no enlazada
efectos downstream pendientes
pendientes sin propietario
```

Toda reducción del total abierto debe corresponder a una causa demostrable. Un agregado nunca puede ocultar una unidad material sin destino.

---

#### 30. Frontera con desactivación y cierre

Esta tarea muestra la información necesaria para saber si existen bloqueos de reincorporación, pero no aprueba recuperación total ni cierre.

Puede existir `DESACTIVADO` con pendientes cuando todos los restantes están identificados, referenciados, tienen propietario y no requieren mantener activa la respuesta extraordinaria.

La superficie marca como **bloqueo de cierre** cualquier condición aplicable de esta lista:

- `RESULT_UNKNOWN` sin resolución;
- `CONFLICT` abierto;
- `QUARANTINED` sin decisión;
- `RECONCILIATION_REQUIRED` abierto;
- efecto ocurrido sin representación propietaria o disposición explícita;
- evidencia obligatoria sin vínculo o excepción admisible;
- efecto downstream obligatorio pendiente;
- operación expirada sin disposición;
- folio, registro o unidad contabilizada sin destino;
- pendiente de reincorporación sin propietario;
- diferencia material aplicable todavía no resuelta.

La autoridad de recuperación total y cierre permanece en el contrato de autorización; esta superficie solo muestra el estado verdadero y las decisiones pendientes.

---

#### 31. Tratamiento de acciones masivas

La bandeja puede permitir selección múltiple únicamente cuando el paquete de implementación demuestre que las unidades comparten tratamiento autorizado y son causalmente elegibles.

Antes de confirmar una acción masiva deberá mostrar:

```text
cantidad seleccionada
tratamiento propuesto
unidades excluidas y motivo
propietario de la decision
impacto esperado
resultado por elemento
```

Una operación masiva no puede convertir 50 decisiones individuales inciertas en un solo “éxito”. Cada elemento conserva identidad, resultado, error, evidencia y trazabilidad.

---

#### 32. Lenguaje, densidad y accesibilidad

La ruta ordinaria usa lenguaje humano y mantiene los códigos canónicos en el detalle cuando sean necesarios para soporte, auditoría o investigación.

Reglas:

- estado, bloqueo y siguiente acción no dependen solo del color;
- la vista táctil prioriza una acción principal y evita tablas densas cuando el actor está ejecutando;
- la vista de supervisión puede aumentar densidad sin mezclar configuración administrativa con operación;
- los detalles de hash, payload, versiones, receipts y custodia se muestran mediante divulgación progresiva;
- el foco permanece en la unidad al volver de un detalle o conflicto;
- los mensajes de error indican qué se conservó y qué no se ejecutó;
- una acción no disponible explica la condición que falta cuando revelar esa información sea seguro;
- la sensibilidad gobierna máscara, visibilidad y acceso al detalle, no solo el diseño visual.

---

#### 33. Experiencia materializada por los 69 servicios

La matriz conserva las identidades, propietarias, clases BIA, estrategias y prioridades heredadas. `Experiencia durante falla` y `Experiencia de reincorporación` son decisiones documentales de esta tarea; no son enums persistentes.

|    # | Servicio         | Proceso      | Propietaria | BIA                    | Estrategia heredada                      | Sync heredada        | Experiencia durante falla                  | Experiencia de reincorporación                         | Estado documental                   |
| ---: | ---------------- | ------------ | ----------- | ---------------------- | ---------------------------------------- | -------------------- | ------------------------------------------ | ------------------------------------------------------ | ----------------------------------- |
|    1 | `BCS-VPROC-0001` | `VPROC-0001` | `viso`      | `ALTA_CONTROL`         | `CTG-03_BORRADOR_LOCAL`                  | `SYNC-3_CYCLE`       | Borrador local sin efecto empresarial      | Revalidar como intención actual o descartar con motivo | `ESPECIFICADO`                      |
|    2 | `BCS-VPROC-0002` | `VPROC-0002` | `viso`      | `ALTA_CONTROL`         | `CTG-02_REFERENCIA_VERSIONADA`           | `SYNC-4_DEFERRED`    | Referencia versionada con frescura visible | Sin replay; validar vigencia y estado actual           | `ESPECIFICADO`                      |
|    3 | `BCS-VPROC-0003` | `VPROC-0003` | `viso`      | `ALTA_CONTROL`         | `CTG-02_REFERENCIA_VERSIONADA`           | `SYNC-1_URGENT`      | Referencia versionada con frescura visible | Sin replay; validar vigencia y estado actual           | `ESPECIFICADO`                      |
|    4 | `BCS-VPROC-0004` | `VPROC-0004` | `viso`      | `ALTA_CONTROL`         | `CTG-03_BORRADOR_LOCAL`                  | `SYNC-2_OPERATIONAL` | Borrador local sin efecto empresarial      | Revalidar como intención actual o descartar con motivo | `ESPECIFICADO`                      |
|    5 | `BCS-VPROC-0005` | `VPROC-0005` | `viso`      | `DIFERIBLE_CONTROLADA` | `CTG-08_DIFERIMIENTO_CONTROLADO`         | `SYNC-4_DEFERRED`    | Backlog diferido con propietario           | Reanudar backlog como trabajo actual revalidado        | `ESPECIFICADO`                      |
|    6 | `BCS-VPROC-0006` | `VPROC-0006` | `viso`      | `ALTA_CONTROL`         | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `SYNC-3_CYCLE`       | Captura local pendiente de decisión        | Incorporar una vez; decisión del dominio propietario   | `ESPECIFICADO`                      |
|    7 | `BCS-VPROC-0007` | `VPROC-0007` | `viso`      | `CRITICA_OPERACIONAL`  | `CTG-07_SERVICIO_REDUCIDO_CONTROLADO`    | `SYNC-3_CYCLE`       | Servicio reducido con subregistros         | Conciliar alcance y subregistros por perfil            | `ESPECIFICADO`                      |
|    8 | `BCS-VPROC-0008` | `VPROC-0008` | `anima`     | `ALTA_CONTROL`         | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `SYNC-2_OPERATIONAL` | Captura local pendiente de decisión        | Incorporar una vez; decisión del dominio propietario   | `ESPECIFICADO`                      |
|    9 | `BCS-VPROC-0009` | `VPROC-0009` | `viso`      | `CRITICA_OPERACIONAL`  | `CTG-07_SERVICIO_REDUCIDO_CONTROLADO`    | `SYNC-2_OPERATIONAL` | Servicio reducido con subregistros         | Conciliar alcance y subregistros por perfil            | `ESPECIFICADO`                      |
|   10 | `BCS-VPROC-0010` | `VPROC-0010` | `numera`    | `ALTA_CONTROL`         | `CTG-03_BORRADOR_LOCAL`                  | `SYNC-3_CYCLE`       | Borrador local sin efecto empresarial      | Revalidar como intención actual o descartar con motivo | `ESPECIFICADO`                      |
|   11 | `BCS-VPROC-0011` | `VPROC-0011` | `viso`      | `ALTA_CONTROL`         | `CTG-01_BLOQUEAR_Y_PROTEGER`             | `SYNC-1_URGENT`      | Bloqueo/protección con estado observado    | Enlazar protección; no reproducir efecto bloqueado     | `ESPECIFICADO`                      |
|   12 | `BCS-VPROC-0012` | `VPROC-0012` | `viso`      | `CRITICA_PROTECCION`   | `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO` | `SYNC-2_OPERATIONAL` | Registro manual foliable y custodiado      | Incorporar por folio; preservar original y custodia    | `ESPECIFICADO`                      |
|   13 | `BCS-VPROC-0013` | `VPROC-0013` | `viso`      | `CRITICA_PROTECCION`   | `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO` | `SYNC-1_URGENT`      | Registro manual foliable y custodiado      | Incorporar por folio; preservar original y custodia    | `ESPECIFICADO`                      |
|   14 | `BCS-VPROC-0014` | `VPROC-0014` | `viso`      | `CRITICA_PROTECCION`   | `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO` | `SYNC-1_URGENT`      | Registro manual foliable y custodiado      | Incorporar por folio; preservar original y custodia    | `ESPECIFICADO`                      |
|   15 | `BCS-VPROC-0015` | `VPROC-0015` | `nexo`      | `ALTA_CONTROL`         | `CTG-02_REFERENCIA_VERSIONADA`           | `SYNC-3_CYCLE`       | Referencia versionada con frescura visible | Sin replay; validar vigencia y estado actual           | `ESPECIFICADO`                      |
|   16 | `BCS-VPROC-0016` | `VPROC-0016` | `fogo`      | `CRITICA_OPERACIONAL`  | `CTG-07_SERVICIO_REDUCIDO_CONTROLADO`    | `SYNC-1_URGENT`      | Servicio reducido con subregistros         | Conciliar alcance y subregistros por perfil            | `ESPECIFICADO`                      |
|   17 | `BCS-VPROC-0017` | `VPROC-0017` | `pulso`     | `CRITICA_OPERACIONAL`  | `CTG-07_SERVICIO_REDUCIDO_CONTROLADO`    | `SYNC-1_URGENT`      | Servicio reducido con subregistros         | Conciliar alcance y subregistros por perfil            | `ESPECIFICADO`                      |
|   18 | `BCS-VPROC-0018` | `VPROC-0018` | `nexo`      | `CRITICA_PROTECCION`   | `CTG-02_REFERENCIA_VERSIONADA`           | `SYNC-1_URGENT`      | Referencia versionada con frescura visible | Sin replay; validar vigencia y estado actual           | `ESPECIFICADO`                      |
|   19 | `BCS-VPROC-0019` | `VPROC-0019` | `origo`     | `ALTA_CONTROL`         | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `SYNC-3_CYCLE`       | Captura local pendiente de decisión        | Incorporar una vez; decisión del dominio propietario   | `ESPECIFICADO`                      |
|   20 | `BCS-VPROC-0020` | `VPROC-0020` | `origo`     | `ALTA_CONTROL`         | `CTG-03_BORRADOR_LOCAL`                  | `SYNC-4_DEFERRED`    | Borrador local sin efecto empresarial      | Revalidar como intención actual o descartar con motivo | `ESPECIFICADO`                      |
|   21 | `BCS-VPROC-0021` | `VPROC-0021` | `origo`     | `ALTA_CONTROL`         | `CTG-01_BLOQUEAR_Y_PROTEGER`             | `SYNC-0_BLOCKING`    | Bloqueo/protección con estado observado    | Enlazar protección; no reproducir efecto bloqueado     | `ESPECIFICADO`                      |
|   22 | `BCS-VPROC-0022` | `VPROC-0022` | `origo`     | `CRITICA_PROTECCION`   | `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO` | `SYNC-1_URGENT`      | Registro manual foliable y custodiado      | Incorporar por folio; preservar original y custodia    | `ESPECIFICADO`                      |
|   23 | `BCS-VPROC-0023` | `VPROC-0023` | `nexo`      | `ALTA_CONTROL`         | `CTG-02_REFERENCIA_VERSIONADA`           | `SYNC-1_URGENT`      | Referencia versionada con frescura visible | Sin replay; validar vigencia y estado actual           | `ESPECIFICADO`                      |
|   24 | `BCS-VPROC-0024` | `VPROC-0024` | `nexo`      | `CRITICA_OPERACIONAL`  | `CTG-05_EJECUCION_OFFLINE_ACOTADA`       | `SYNC-0_BLOCKING`    | Ejecución offline dentro del envelope      | Consultar receipt; conservar misma intención           | `ESPECIFICADO`                      |
|   25 | `BCS-VPROC-0025` | `VPROC-0025` | `nexo`      | `CRITICA_OPERACIONAL`  | `CTG-05_EJECUCION_OFFLINE_ACOTADA`       | `SYNC-0_BLOCKING`    | Ejecución offline dentro del envelope      | Consultar receipt; conservar misma intención           | `ESPECIFICADO`                      |
|   26 | `BCS-VPROC-0026` | `VPROC-0026` | `nexo`      | `ALTA_CONTROL`         | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `SYNC-2_OPERATIONAL` | Captura local pendiente de decisión        | Incorporar una vez; decisión del dominio propietario   | `ESPECIFICADO`                      |
|   27 | `BCS-VPROC-0027` | `VPROC-0027` | `nexo`      | `CRITICA_PROTECCION`   | `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO` | `SYNC-1_URGENT`      | Registro manual foliable y custodiado      | Incorporar por folio; preservar original y custodia    | `ESPECIFICADO`                      |
|   28 | `BCS-VPROC-0028` | `VPROC-0028` | `nexo`      | `CRITICA_OPERACIONAL`  | `CTG-05_EJECUCION_OFFLINE_ACOTADA`       | `SYNC-1_URGENT`      | Ejecución offline dentro del envelope      | Consultar receipt; conservar misma intención           | `ESPECIFICADO`                      |
|   29 | `BCS-VPROC-0029` | `VPROC-0029` | `nexo`      | `ALTA_CONTROL`         | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `SYNC-1_URGENT`      | Captura local pendiente de decisión        | Incorporar una vez; decisión del dominio propietario   | `ESPECIFICADO`                      |
|   30 | `BCS-VPROC-0030` | `VPROC-0030` | `nexo`      | `ALTA_CONTROL`         | `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO` | `SYNC-1_URGENT`      | Registro manual foliable y custodiado      | Incorporar por folio; preservar original y custodia    | `ESPECIFICADO`                      |
|   31 | `BCS-VPROC-0031` | `VPROC-0031` | `nexo`      | `CRITICA_OPERACIONAL`  | `CTG-07_SERVICIO_REDUCIDO_CONTROLADO`    | `SYNC-2_OPERATIONAL` | Servicio reducido con subregistros         | Conciliar alcance y subregistros por perfil            | `ESPECIFICADO`                      |
|   32 | `BCS-VPROC-0032` | `VPROC-0032` | `nexo`      | `ALTA_CONTROL`         | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `SYNC-2_OPERATIONAL` | Captura local pendiente de decisión        | Incorporar una vez; decisión del dominio propietario   | `ESPECIFICADO`                      |
|   33 | `BCS-VPROC-0033` | `VPROC-0033` | `fogo`      | `CRITICA_OPERACIONAL`  | `CTG-07_SERVICIO_REDUCIDO_CONTROLADO`    | `SYNC-3_CYCLE`       | Servicio reducido con subregistros         | Conciliar alcance y subregistros por perfil            | `ESPECIFICADO`                      |
|   34 | `BCS-VPROC-0034` | `VPROC-0034` | `fogo`      | `CRITICA_OPERACIONAL`  | `CTG-05_EJECUCION_OFFLINE_ACOTADA`       | `SYNC-1_URGENT`      | Ejecución offline dentro del envelope      | Consultar receipt; conservar misma intención           | `ESPECIFICADO`                      |
|   35 | `BCS-VPROC-0035` | `VPROC-0035` | `fogo`      | `CRITICA_PROTECCION`   | `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO` | `SYNC-0_BLOCKING`    | Registro manual foliable y custodiado      | Incorporar por folio; preservar original y custodia    | `ESPECIFICADO`                      |
|   36 | `BCS-VPROC-0036` | `VPROC-0036` | `fogo`      | `CRITICA_OPERACIONAL`  | `CTG-05_EJECUCION_OFFLINE_ACOTADA`       | `SYNC-1_URGENT`      | Ejecución offline dentro del envelope      | Consultar receipt; conservar misma intención           | `ESPECIFICADO`                      |
|   37 | `BCS-VPROC-0037` | `VPROC-0037` | `fogo`      | `ALTA_CONTROL`         | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `SYNC-2_OPERATIONAL` | Captura local pendiente de decisión        | Incorporar una vez; decisión del dominio propietario   | `ESPECIFICADO`                      |
|   38 | `BCS-VPROC-0038` | `VPROC-0038` | `pulso`     | `CRITICA_OPERACIONAL`  | `CTG-07_SERVICIO_REDUCIDO_CONTROLADO`    | `SYNC-0_BLOCKING`    | Servicio reducido con subregistros         | Conciliar alcance y subregistros por perfil            | `ESPECIFICADO`                      |
|   39 | `BCS-VPROC-0039` | `VPROC-0039` | `pulso`     | `CRITICA_OPERACIONAL`  | `CTG-07_SERVICIO_REDUCIDO_CONTROLADO`    | `SYNC-0_BLOCKING`    | Servicio reducido con subregistros         | Conciliar alcance y subregistros por perfil            | `ESPECIFICADO`                      |
|   40 | `BCS-VPROC-0040` | `VPROC-0040` | `pulso`     | `CRITICA_OPERACIONAL`  | `CTG-02_REFERENCIA_VERSIONADA`           | `SYNC-1_URGENT`      | Referencia versionada con frescura visible | Sin replay; validar vigencia y estado actual           | `ESPECIFICADO`                      |
|   41 | `BCS-VPROC-0041` | `VPROC-0041` | `pulso`     | `CRITICA_OPERACIONAL`  | `CTG-07_SERVICIO_REDUCIDO_CONTROLADO`    | `SYNC-3_CYCLE`       | Servicio reducido con subregistros         | Conciliar alcance y subregistros por perfil            | `ESPECIFICADO`                      |
|   42 | `BCS-VPROC-0042` | `VPROC-0042` | `pulso`     | `CRITICA_OPERACIONAL`  | `CTG-01_BLOQUEAR_Y_PROTEGER`             | `SYNC-0_BLOCKING`    | Bloqueo/protección con estado observado    | Enlazar protección; no reproducir efecto bloqueado     | `ESPECIFICADO`                      |
|   43 | `BCS-VPROC-0043` | `VPROC-0043` | `pulso`     | `CRITICA_PROTECCION`   | `CTG-01_BLOQUEAR_Y_PROTEGER`             | `SYNC-0_BLOCKING`    | Bloqueo/protección con estado observado    | Enlazar protección; no reproducir efecto bloqueado     | `ESPECIFICADO`                      |
|   44 | `BCS-VPROC-0044` | `VPROC-0044` | `pulso`     | `ALTA_CONTROL`         | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `SYNC-0_BLOCKING`    | Captura local pendiente de decisión        | Incorporar una vez; decisión del dominio propietario   | `ESPECIFICADO`                      |
|   45 | `BCS-VPROC-0045` | `VPROC-0045` | `pass`      | `ALTA_CONTROL`         | `CTG-02_REFERENCIA_VERSIONADA`           | `SYNC-0_BLOCKING`    | Referencia versionada con frescura visible | Sin replay; validar vigencia y estado actual           | `ESPECIFICADO`                      |
|   46 | `BCS-VPROC-0046` | `VPROC-0046` | `pulso`     | `ALTA_CONTROL`         | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `SYNC-3_CYCLE`       | Captura local pendiente de decisión        | Incorporar una vez; decisión del dominio propietario   | `ESPECIFICADO`                      |
|   47 | `BCS-VPROC-0047` | `VPROC-0047` | `pulso`     | `ALTA_CONTROL`         | `CTG-03_BORRADOR_LOCAL`                  | `SYNC-3_CYCLE`       | Borrador local sin efecto empresarial      | Revalidar como intención actual o descartar con motivo | `ESPECIFICADO`                      |
|   48 | `BCS-VPROC-0048` | `VPROC-0048` | `nexo`      | `CRITICA_OPERACIONAL`  | `CTG-03_BORRADOR_LOCAL`                  | `SYNC-3_CYCLE`       | Borrador local sin efecto empresarial      | Revalidar como intención actual o descartar con motivo | `ESPECIFICADO`                      |
|   49 | `BCS-VPROC-0049` | `VPROC-0049` | `nexo`      | `CRITICA_OPERACIONAL`  | `CTG-05_EJECUCION_OFFLINE_ACOTADA`       | `SYNC-1_URGENT`      | Ejecución offline dentro del envelope      | Consultar receipt; conservar misma intención           | `ESPECIFICADO`                      |
|   50 | `BCS-VPROC-0050` | `VPROC-0050` | `pulso`     | `CRITICA_OPERACIONAL`  | `CTG-02_REFERENCIA_VERSIONADA`           | `SYNC-2_OPERATIONAL` | Referencia versionada con frescura visible | Sin replay; validar vigencia y estado actual           | `ESPECIFICADO`                      |
|   51 | `BCS-VPROC-0051` | `VPROC-0051` | `numera`    | `ALTA_CONTROL`         | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `SYNC-1_URGENT`      | Captura local pendiente de decisión        | Incorporar una vez; decisión del dominio propietario   | `ESPECIFICADO`                      |
|   52 | `BCS-VPROC-0052` | `VPROC-0052` | `numera`    | `ALTA_CONTROL`         | `CTG-01_BLOQUEAR_Y_PROTEGER`             | `SYNC-0_BLOCKING`    | Bloqueo/protección con estado observado    | Enlazar protección; no reproducir efecto bloqueado     | `ESPECIFICADO`                      |
|   53 | `BCS-VPROC-0053` | `VPROC-0053` | `numera`    | `ALTA_CONTROL`         | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `SYNC-1_URGENT`      | Captura local pendiente de decisión        | Incorporar una vez; decisión del dominio propietario   | `ESPECIFICADO`                      |
|   54 | `BCS-VPROC-0054` | `VPROC-0054` | `numera`    | `ALTA_CONTROL`         | `CTG-03_BORRADOR_LOCAL`                  | `SYNC-3_CYCLE`       | Borrador local sin efecto empresarial      | Revalidar como intención actual o descartar con motivo | `ESPECIFICADO`                      |
|   55 | `BCS-VPROC-0055` | `VPROC-0055` | `nexo`      | `CRITICA_PROTECCION`   | `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO` | `SYNC-1_URGENT`      | Registro manual foliable y custodiado      | Incorporar por folio; preservar original y custodia    | `ESPECIFICADO`                      |
|   56 | `BCS-VPROC-0056` | `VPROC-0056` | `aura`      | `DIFERIBLE_CONTROLADA` | `BLOQUEADO_POR_APLICACION_DIFERIDA`      | `SYNC-4_DEFERRED`    | Sin captura operativa autorizada           | Sin reincorporación operativa autorizada               | `BLOQUEADO_POR_APLICACION_DIFERIDA` |
|   57 | `BCS-VPROC-0057` | `VPROC-0057` | `aura`      | `DIFERIBLE_CONTROLADA` | `BLOQUEADO_POR_APLICACION_DIFERIDA`      | `SYNC-3_CYCLE`       | Sin captura operativa autorizada           | Sin reincorporación operativa autorizada               | `BLOQUEADO_POR_APLICACION_DIFERIDA` |
|   58 | `BCS-VPROC-0058` | `VPROC-0058` | `viso`      | `CRITICA_OPERACIONAL`  | `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO` | `SYNC-1_URGENT`      | Registro manual foliable y custodiado      | Incorporar por folio; preservar original y custodia    | `ESPECIFICADO`                      |
|   59 | `BCS-VPROC-0059` | `VPROC-0059` | `viso`      | `CRITICA_PROTECCION`   | `CTG-01_BLOQUEAR_Y_PROTEGER`             | `SYNC-0_BLOCKING`    | Bloqueo/protección con estado observado    | Enlazar protección; no reproducir efecto bloqueado     | `ESPECIFICADO`                      |
|   60 | `BCS-VPROC-0060` | `VPROC-0060` | `viso`      | `ALTA_CONTROL`         | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `SYNC-2_OPERATIONAL` | Captura local pendiente de decisión        | Incorporar una vez; decisión del dominio propietario   | `ESPECIFICADO`                      |
|   61 | `BCS-VPROC-0061` | `VPROC-0061` | `numera`    | `DIFERIBLE_CONTROLADA` | `CTG-08_DIFERIMIENTO_CONTROLADO`         | `SYNC-4_DEFERRED`    | Backlog diferido con propietario           | Reanudar backlog como trabajo actual revalidado        | `ESPECIFICADO`                      |
|   62 | `BCS-VPROC-0062` | `VPROC-0062` | `viso`      | `CRITICA_PROTECCION`   | `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO` | `SYNC-1_URGENT`      | Registro manual foliable y custodiado      | Incorporar por folio; preservar original y custodia    | `ESPECIFICADO`                      |
|   63 | `BCS-VPROC-0063` | `VPROC-0063` | `viso`      | `ALTA_CONTROL`         | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `SYNC-3_CYCLE`       | Captura local pendiente de decisión        | Incorporar una vez; decisión del dominio propietario   | `ESPECIFICADO`                      |
|   64 | `BCS-VPROC-0064` | `VPROC-0064` | `viso`      | `ALTA_CONTROL`         | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `SYNC-3_CYCLE`       | Captura local pendiente de decisión        | Incorporar una vez; decisión del dominio propietario   | `ESPECIFICADO`                      |
|   65 | `BCS-VPROC-0065` | `VPROC-0065` | `viso`      | `DIFERIBLE_CONTROLADA` | `CTG-08_DIFERIMIENTO_CONTROLADO`         | `SYNC-4_DEFERRED`    | Backlog diferido con propietario           | Reanudar backlog como trabajo actual revalidado        | `ESPECIFICADO`                      |
|   66 | `BCS-VPROC-0066` | `VPROC-0066` | `viso`      | `CRITICA_PROTECCION`   | `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO` | `SYNC-1_URGENT`      | Registro manual foliable y custodiado      | Incorporar por folio; preservar original y custodia    | `ESPECIFICADO`                      |
|   67 | `BCS-VPROC-0067` | `VPROC-0067` | `nexo`      | `ALTA_CONTROL`         | `CTG-04_CAPTURA_LOCAL_PENDIENTE`         | `SYNC-2_OPERATIONAL` | Captura local pendiente de decisión        | Incorporar una vez; decisión del dominio propietario   | `ESPECIFICADO`                      |
|   68 | `BCS-VPROC-0068` | `VPROC-0068` | `pulso`     | `DIFERIBLE_CONTROLADA` | `CTG-08_DIFERIMIENTO_CONTROLADO`         | `SYNC-4_DEFERRED`    | Backlog diferido con propietario           | Reanudar backlog como trabajo actual revalidado        | `ESPECIFICADO`                      |
|   69 | `BCS-VPROC-0069` | `VPROC-0069` | `numera`    | `ALTA_CONTROL`         | `CTG-03_BORRADOR_LOCAL`                  | `SYNC-3_CYCLE`       | Borrador local sin efecto empresarial      | Revalidar como intención actual o descartar con motivo | `ESPECIFICADO`                      |

---

#### 34. Reconciliación cuantitativa

| Control                                    |   Resultado |
| ------------------------------------------ | ----------: |
| servicios evaluados                        | **69 / 69** |
| decisiones UX materializadas               | **69 / 69** |
| servicios activos especificados            | **67 / 67** |
| AURA bloqueados                            |   **2 / 2** |
| perfiles activos de estrategia cubiertos   |   **8 / 8** |
| `CTG-01_BLOQUEAR_Y_PROTEGER`               |       **6** |
| `CTG-02_REFERENCIA_VERSIONADA`             |       **8** |
| `CTG-03_BORRADOR_LOCAL`                    |       **8** |
| `CTG-04_CAPTURA_LOCAL_PENDIENTE`           |      **15** |
| `CTG-05_EJECUCION_OFFLINE_ACOTADA`         |       **6** |
| `CTG-06_PROCEDIMIENTO_MANUAL_CONTROLADO`   |      **11** |
| `CTG-07_SERVICIO_REDUCIDO_CONTROLADO`      |       **9** |
| `CTG-08_DIFERIMIENTO_CONTROLADO`           |       **4** |
| operaciones productivas ejecutadas         |       **0** |
| requisitos de prueba creados o modificados |       **0** |

Distribución de prioridad de los 67 servicios activos:

| Prioridad            | Servicios |
| -------------------- | --------: |
| `SYNC-0_BLOCKING`    |    **12** |
| `SYNC-1_URGENT`      |    **23** |
| `SYNC-2_OPERATIONAL` |    **11** |
| `SYNC-3_CYCLE`       |    **15** |
| `SYNC-4_DEFERRED`    |     **6** |
| **Total**            |    **67** |

Los dos servicios AURA conservan sus prioridades documentales heredadas, pero no adquieren por ello una ruta operativa de captura o reincorporación.

---

#### 35. Escenarios deterministas de experiencia

|    # | Escenario                                                     | Comportamiento exigido                                                             |
| ---: | ------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
|    1 | cae la red después de una captura permitida                   | conservar la unidad local, atribución y evidencia; mostrar que no está confirmada  |
|    2 | vuelve la conectividad con una unidad en cola                 | ejecutar secuencia de reconexión y mantener la misma identidad                     |
|    3 | una mutación termina en `RESULT_UNKNOWN`                      | verificar receipt/recurso antes de habilitar cualquier retry de la misma intención |
|    4 | misma clave y mismo contenido ya confirmado                   | vincular resultado existente; no crear segundo efecto                              |
|    5 | misma clave y contenido diferente                             | mostrar `CONFLICT` y preservar la intención original                               |
|    6 | folio manual válido                                           | digitalizar una sola vez, conservar original, actor, hora y custodia               |
|    7 | folio duplicado                                               | bloquear confirmación automática y escalar                                         |
|    8 | folio fuera de rango o ilegible                               | conservar excepción y evidencia; no completar por inferencia                       |
|    9 | cambia el actor del dispositivo                               | no transferir borradores, cola, claims ni custodia                                 |
|   10 | el permiso actual ya no existe pero el hecho físico ocurrió   | conservar hecho histórico y enviarlo a decisión/conciliación; no borrarlo          |
|   11 | el permiso actual ya no existe y la mutación nunca ocurrió    | bloquear ejecución y exigir revalidación actual                                    |
|   12 | una rama está en conflicto y otra es independiente            | detener la rama afectada y permitir avance de la independiente                     |
|   13 | evidencia queda `UPLOADED_UNLINKED`                           | mostrar pendiente y mantener abierto el requisito de vínculo                       |
|   14 | servicio operó en modo reducido                               | conciliar alcance y subregistros antes de presentarlo como completo                |
|   15 | una operación expiró pero el trabajo sigue siendo necesario   | crear intención actual enlazada después de revalidación; no replay de la vencida   |
|   16 | existe efecto parcial                                         | preservar parte confirmada y procesar solo la parte pendiente permitida            |
|   17 | servicio AURA diferido                                        | no mostrar captura, sincronización o reincorporación inexistente                   |
|   18 | hecho propietario confirmado pero efecto downstream pendiente | conservar hecho fuente y mostrar conciliación transversal incompleta               |

---

#### 36. Cobertura vigente de prueba

La tarea queda cubierta por requisitos ya vigentes que protegen:

- modalidad de contingencia, datos mínimos, identificadores controlados, custodia, seguridad y estado pendiente;
- reincorporación controlada, idempotencia, duplicados, conflictos, vencimientos, efectos parciales y conciliación antes del cierre;
- mensajes de error y recuperación que no duplican efectos;
- visibilidad de fuente de verdad, estado pendiente/confirmado, actor y diferencias;
- comportamiento ante pérdida de red, sesión, dispositivo o proveedor y reautorización al reanudar;
- identidad estable, resultado recuperable, retry idempotente y `RESULT_UNKNOWN`;
- continuidad transversal con replay controlado y trazabilidad entre incidente, pendiente y hecho recuperado.

No se identifica una regla verificable nueva fuera de esa cobertura. Esta tarea especializa la experiencia humana y materializa decisiones por los 69 servicios sin alterar el comportamiento protegido.

---

#### 37. Brechas de implementación y condiciones de salida

| Brecha                                                                      | Estado                   | Propietario documental                                            | Condición de salida                                                                           |
| --------------------------------------------------------------------------- | ------------------------ | ----------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| persistencia local, aislamiento, capacidad y recuperación física            | `PENDIENTE_DE_EVIDENCIA` | `CONT-INT-004`, consumiendo el contrato aprobado de `NFR-REQ-004` | implementación versionada que preserve identidad, contexto y reinicio sin pérdida             |
| transporte físico de outbox/inbox, claims, retry, replay y dead-letter      | `PENDIENTE_DE_EVIDENCIA` | `CONT-INT-004`                                                    | contratos implementados con idempotencia, resultado recuperable y pruebas de orden/conflicto  |
| enforcement de permisos para captura, admisión, resolución y conciliación   | `PENDIENTE_DE_EVIDENCIA` | `CONT-AUTH-004` y contratos de autorización aplicables            | autorización de servidor implementada y probada sin autoaprobación crítica                    |
| formularios, folios, medios físicos y capacidad por sede                    | `PENDIENTE_DE_EVIDENCIA` | `CONT-DOM-014`                                                    | medio real disponible, inventariado y probado en ejercicio aplicable                          |
| almacenamiento, vínculo, acceso, sensibilidad y retención de evidencia      | `PENDIENTE_DE_EVIDENCIA` | `CONT-AUTH-003` y `CONT-INT-004`                                  | evidencia enlazada con acceso y retención materializados                                      |
| contratos ejecutables de aceptación/corrección por dominio                  | `PENDIENTE_DE_EVIDENCIA` | `CONT-INT-004`                                                    | operación idempotente con receipt recuperable y pruebas de duplicado/conflicto                |
| validación de la experiencia con fallos, reconexión y conciliación realista | `PENDIENTE_DE_EVIDENCIA` | `CONT-DOM-014`                                                    | ejercicio reproducible con unidades offline/manuales, unknown, conflicto y conciliación final |
| seguimiento transversal de restauración, failover y recuperación            | `PENDIENTE_DE_EVIDENCIA` | `CONT-UX-005`                                                     | experiencia específica de respaldo/restauración/failover y pendientes materializada           |

No queda una brecha material sin propietario documental y condición de salida.

---

#### 38. Handoffs obligatorios

| Resultado posterior                                                                | Tarea propietaria | Frontera conservada                                                                                |
| ---------------------------------------------------------------------------------- | ----------------- | -------------------------------------------------------------------------------------------------- |
| separación y enforcement entre ejecutar, validar, reincorporar, conciliar y cerrar | `CONT-AUTH-004`   | esta tarea muestra autoridad y bloqueos; no concede permisos                                       |
| seguimiento de backup, restore, failover y validación de recuperación              | `CONT-UX-005`     | esta tarea se limita a trabajo contingente y su reincorporación                                    |
| transporte, replay y conciliación física entre sistemas                            | `CONT-INT-004`    | esta tarea define experiencia y semántica; no implementa workers ni endpoints                      |
| restauración y punto seguro para habilitar reincorporación                         | `CONT-DOM-012`    | reconexión no sustituye restauración ni validación funcional                                       |
| readiness de medios, folios y procedimiento                                        | `CONT-DOM-014`    | la especificación UX no demuestra disponibilidad física                                            |
| revisión posterior y aprendizaje                                                   | `CONT-DOM-015`    | una acción de mejora no sustituye un pendiente operativo de reincorporación                        |
| persistencia e interfaces reales por dominio                                       | `CONT-INT-004`    | la implementación posterior conserva propiedad del hecho y del comando en cada dominio propietario |
| pruebas integrales y ejercicio de reincorporación                                  | `CONT-DOM-014`    | la tarea documental no certifica uso real, dispositivo ni ejercicio                                |

---

#### 39. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa la experiencia humana de captura contingente y reincorporación sobre reglas ya protegidas por requisitos vigentes de continuidad, experiencia, autorización e integración. No introduce un nuevo efecto empresarial, transición, cálculo, permiso, contrato de integración o comportamiento ejecutable que requiera un identificador adicional.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 40. Criterios de aceptación

1. La tarea conserva exactamente 69 servicios BIA y 69 procesos VPROC.
2. Cada identidad conserva su `business_service_id` y `process_id` heredados sin renombrarlos.
3. No existen identidades faltantes ni duplicadas en la matriz de cobertura UX.
4. La distribución de propietarias permanece 1/20/16/6/4/12/7/2/1 para ANIMA/VISO/NEXO/FOGO/ORIGO/PULSO/NUMERA/AURA/PASS.
5. La distribución BIA permanece 12 `CRITICA_PROTECCION`, 20 `CRITICA_OPERACIONAL`, 31 `ALTA_CONTROL` y 6 `DIFERIBLE_CONTROLADA`.
6. La distribución de estrategias permanece 6/8/8/15/6/11/9/4 más 2 AURA bloqueados.
7. Las prioridades de los 67 servicios activos permanecen 12 `SYNC-0_BLOCKING`, 23 `SYNC-1_URGENT`, 11 `SYNC-2_OPERATIONAL`, 15 `SYNC-3_CYCLE` y 6 `SYNC-4_DEFERRED`.
8. Los dos servicios AURA no reciben por esta tarea una ruta operativa de captura o reincorporación.
9. La superficie distingue de forma visible captura durante falla, transición de reconexión y reincorporación posterior.
10. Recuperar conectividad no activa por sí solo un replay ciego de todas las operaciones.
11. Una captura local no se presenta como resultado empresarial confirmado.
12. Un registro contingente no se presenta como fuente de verdad empresarial paralela.
13. Una referencia de incidente no sustituye el folio, la operación local ni la referencia empresarial definitiva.
14. El folio no sustituye `local_operation_id` ni `idempotency_key`.
15. Una referencia de evidencia no se presenta como identidad del hecho empresarial.
16. La interfaz distingue actor original de operador de digitalización o revisión.
17. La interfaz distingue contexto observado durante la falla de contexto actual de reincorporación.
18. La interfaz distingue autoridad histórica registrada de autoridad actual necesaria para ejecutar un efecto todavía no ocurrido.
19. Un hecho físico ya ocurrido no se elimina ni oculta porque la autoridad actual del actor haya cambiado.
20. Una mutación todavía no ejecutada se bloquea hasta resolver autoridad y estado actuales cuando el contrato lo exige.
21. Los datos desconocidos permanecen explícitamente desconocidos y no se completan por inferencia.
22. `business_effect_claimed` no se convierte visualmente en efecto confirmado sin resultado autoritativo.
23. `reconciliation_required` se muestra como necesidad de conciliación y no como conciliación realizada.
24. El modo de conectividad se deriva del vector de dependencias aplicables y no solo de Wi-Fi o `navigator.onLine`.
25. `ONLINE_STABLE`, `ONLINE_DEGRADED`, `PARTIAL_SERVICE`, `OFFLINE_CONFIRMED`, `CONNECTIVITY_UNKNOWN`, `RECOVERING_SYNC` y `SYNC_BLOCKED` conservan su semántica.
26. La interfaz no convierte `RECOVERING_SYNC` en disponibilidad empresarial plena.
27. La interfaz no convierte `SYNC_BLOCKED` en fallo definitivo sin la causa correspondiente.
28. `DRAFT_LOCAL` se presenta como borrador sin efecto.
29. `CAPTURED_LOCAL` se presenta como captura local, no como guardado en servidor.
30. `QUEUED` se presenta como pendiente de procesamiento, no como aceptado.
31. `WAITING_DEPENDENCY` identifica la dependencia que impide avanzar.
32. `VALIDATING` distingue validación de ejecución o confirmación.
33. `SYNCING` no se presenta como efecto confirmado.
34. `ACCEPTED_PENDING_EFFECT` no se presenta como terminado.
35. `CONFIRMED` exige receipt o estado autoritativo verificable.
36. `REJECTED` conserva motivo, propietario de la decisión y referencia de origen.
37. `CONFLICT` conserva ambos lados relevantes sin sobrescritura silenciosa.
38. `RESULT_UNKNOWN` bloquea un nuevo intento independiente de la misma intención.
39. `EXPIRED` conserva la intención y exige disposición antes de desaparecer del balance.
40. `SUPERSEDED` conserva referencia de la intención sucesora.
41. `QUARANTINED` conserva los datos y la razón de incompatibilidad o bloqueo.
42. `RECONCILIATION_REQUIRED` conserva propietario, siguiente acción y evidencia necesaria.
43. `DISCARDED_WITH_REASON` solo se usa cuando el descarte es permitido y deja motivo trazable.
44. La interfaz de evidencia distingue `LOCAL_ONLY` de evidencia recibida por el dominio propietario.
45. `UPLOADED_UNLINKED` no se presenta como evidencia enlazada.
46. `LINKED_AND_CONFIRMED` exige relación verificable con el hecho o expediente correspondiente.
47. Una carga fallida conserva el estado y no se elimina para aparentar éxito.
48. La eliminación local de evidencia exige confirmación y política aplicable.
49. Toda operación durable conserva una identidad local estable desde su creación.
50. Una mutación repetible conserva una `idempotency_key` estable desde antes de su primer envío.
51. Un reintento de la misma intención no genera un identificador nuevo para probar el resultado.
52. La misma clave con el mismo contenido recupera o vincula el resultado existente sin segundo efecto.
53. La misma clave con contenido diferente produce conflicto visible.
54. La UI no ofrece un CTA de reintento limpio cuando el resultado previo puede haber ocurrido.
55. Ante `RESULT_UNKNOWN`, la primera acción segura es verificar receipt, recurso y versión según el contrato.
56. Una respuesta tardía se incorpora a la historia y se confronta con el estado actual.
57. Una operación expirada que no ocurrió no se ejecuta automáticamente al reconectar.
58. Si el trabajo expirado sigue siendo necesario, la interfaz lo convierte en candidato a nueva intención actual revalidada y enlazada al origen.
59. Un efecto ocurrido mientras era válido no se borra por expiración posterior.
60. Un efecto parcial muestra por separado las partes confirmadas y pendientes.
61. La parte ya confirmada no se vuelve a ejecutar para completar una operación parcial.
62. La interfaz no dispara compensación, reversión o corrección automática por detectar parcialidad.
63. La puerta de admisión verifica origen antes de permitir una acción de reincorporación.
64. La puerta de admisión verifica integridad disponible y expone cualquier anomalía.
65. La puerta de admisión conserva o resuelve la relación con el incidente sin reenumerar el trabajo.
66. La puerta de admisión conserva atribución original de principal, actor, dispositivo y contexto cuando aplique.
67. Un esquema incompatible lleva a cuarentena y no a transformación implícita.
68. La puerta de admisión consulta receipts y referencias empresariales existentes antes de repetir una mutación.
69. La puerta de admisión verifica recurso y versión actuales antes de una escritura sensible.
70. La puerta de admisión revalida autorización actual cuando el efecto aún no ocurrió.
71. La puerta de admisión verifica evidencia obligatoria o una excepción admisible.
72. La puerta de admisión verifica dependencias antes de habilitar una operación dependiente.
73. La puerta de admisión identifica el dominio propietario que debe aceptar, rechazar, corregir o escalar.
74. La UI no presenta la unidad como reincorporada antes de la decisión y resultado aplicables.
75. Los conflictos reutilizan las clases canónicas y no crean una taxonomía paralela.
76. `RESOURCE_VERSION_CONFLICT` bloquea sobrescritura silenciosa de una versión posterior.
77. `CONTEXT_CHANGED` exige nueva resolución de contexto antes de una acción actual.
78. `AUTHORIZATION_CHANGED` no amplía autoridad histórica ni actual.
79. `DUPLICATE_OPERATION` no produce un segundo efecto.
80. `DEPENDENCY_REJECTED` bloquea o reclasifica las operaciones dependientes.
81. `SCHEMA_INCOMPATIBLE` puede llevar a `QUARANTINED` conservando evidencia.
82. `BUSINESS_STATE_CHANGED` exige decisión propietaria.
83. `QUANTITY_CONFLICT` no se resuelve mediante suma o reemplazo intuitivo.
84. `CUSTODY_CONFLICT` conserva soporte, handoffs y excepción.
85. `TIME_WINDOW_EXPIRED` no autoriza backdating de una nueva ejecución.
86. `CLOCK_INVALID` conserva incertidumbre temporal.
87. `LOCAL_STORAGE_CORRUPTED` no inventa contenido perdido.
88. Las resoluciones visibles se limitan a las opciones canónicas aplicables y autorizadas.
89. `ACCEPT_SERVER_STATE` no elimina evidencia de un efecto físico ocurrido.
90. `REAPPLY_ALLOWED_FIELDS` solo habilita campos revalidados por el dominio propietario.
91. `CREATE_CORRECTION` preserva original, antes/después, actor y motivo.
92. `SPLIT_OPERATION` no duplica una parte ya confirmada.
93. `ESCALATE` identifica la función o autoridad requerida.
94. `DISCARD_LOCAL_DRAFT` no se ofrece para hechos físicos o empresariales ya ocurridos.
95. `MANUAL_RECONCILIATION` conserva decisión, evidencia y referencias resultantes.
96. La interfaz no ofrece `last write wins` para un efecto empresarial.
97. La lista visible de pendientes no se interpreta como FIFO de ejecución.
98. Las dependencias causales prevalecen sobre la prioridad `SYNC-*`.
99. Una operación `SYNC-0_BLOCKING` bloquea sus dependientes, no todas las ramas independientes por definición.
100. Una rama en conflicto puede detenerse sin ocultar el avance de ramas independientes.
101. Una operación `SUPERSEDED` no se ejecuta después de su sucesora.
102. La UI diferencia prioridad de sincronización, elegibilidad causal y estado actual.
103. El corredor PULSO→NEXO→PASS→NUMERA se representa sin transferir propiedad de la venta a una consumidora.
104. El corredor ORIGO→NEXO→NUMERA se representa sin crear una segunda compra o recepción.
105. El corredor FOGO→NEXO→NUMERA se representa sin crear un segundo lote o resultado productivo.
106. Cada efecto derivado conserva estado, resultado e idempotencia independientes.
107. El fallo de una consumidora no revierte visualmente el hecho confirmado por la propietaria.
108. El procesamiento de una consumidora no se presenta como conciliación de todas las demás.
109. CTG-01 presenta la acción protectora y el estado observado sin afirmar el efecto bloqueado como ejecutado.
110. CTG-02 muestra fuente, versión y frescura sin convertir una referencia vencida en vigente.
111. CTG-03 muestra el borrador como preparación sin reserva, publicación, aprobación o compromiso.
112. CTG-04 muestra observación y evidencia como pendientes de decisión propietaria.
113. CTG-05 muestra envelope, intención, secuencia, receipts y resultado sin permitir efecto fuera del alcance autorizado.
114. CTG-06 muestra folio, actor, hora, sitio/área, custodia y handoff sin presentar digitalización como cierre.
115. CTG-07 muestra el alcance reducido, límites, trabajo aceptado/rechazado y cada subregistro aplicable.
116. CTG-08 muestra backlog, propietario, edad/deadline, motivo y condición de reanudación sin presentarlo como ejecutado.
117. CTG-09 no se instancia sin una alternativa física acreditada por su tarea propietaria.
118. CTG-10 no se instancia sin un proveedor o canal alterno acreditado por su tarea propietaria.
119. Un folio manual se muestra como referencia estable e inmutable del origen.
120. Un folio anulado permanece consumido y visible en la trazabilidad.
121. Un folio perdido no se recrea con el mismo número.
122. Un folio deteriorado conserva esa condición y su representación enlazada.
123. Un folio ilegible no se completa por inferencia.
124. Un folio duplicado no habilita confirmación automática.
125. Un folio fuera de rango permanece como excepción no confiable hasta decisión.
126. Un salto de secuencia exige explicación trazable.
127. Una página adicional conserva vínculo con el folio principal.
128. La captura de un medio manual registra la condición de custodia relevante antes de la transferencia.
129. Cada handoff visible conserva custodio de origen, custodio de destino, hora, medio, folio/rango y condición cuando aplican.
130. Digitalizar o fotografiar un original no autoriza destruirlo.
131. La interfaz distingue custodia física, representación digital y vínculo empresarial.
132. La transcripción del mismo soporte no crea múltiples fuentes competidoras.
133. La interfaz muestra `observed_at` separado de `created_local_at` y `recorded_at` cuando la diferencia sea material.
134. La interfaz no presenta `recorded_at` como hora del efecto empresarial.
135. `business_effect_at`, `confirmed_at` y `reconciled_at` conservan significados diferentes.
136. Un reloj local dudoso se marca sin corregirlo por intuición.
137. La secuencia causal puede mostrarse aunque el tiempo exacto permanezca incierto.
138. Al cambiar de actor en un dispositivo compartido no se transfieren borradores, cola, claims ni custodia.
139. Los pendientes de un actor anterior conservan atribución y privacidad.
140. Cambiar de área no convierte dos colas en una ni amplía permiso.
141. La interfaz muestra capacidad, antigüedad y riesgo antes de alcanzar un umbral local crítico cuando el paquete físico lo implemente.
142. La saturación local no permite descartar silenciosamente la operación más antigua.
143. La evidencia obligatoria no se elimina para liberar espacio.
144. La pérdida de almacenamiento local se muestra como incidente o conflicto de integridad y no como cola vacía exitosa.
145. La bandeja de reincorporación permite filtrar por proceso, servicio, sede, estrategia, propietario, estado y prioridad sin convertir un filtro en autoridad.
146. La selección masiva no cambia el significado individual ni salta las puertas de admisión.
147. Una acción masiva solo puede incluir unidades causalmente elegibles y con el mismo tratamiento autorizado.
148. El resultado de una acción masiva se devuelve por elemento y no como éxito global opaco.
149. La vista operativa minimiza datos sensibles y reserva el detalle ampliado para funciones autorizadas.
150. Los mensajes explican qué ocurrió, qué se conservó, qué está pendiente y la siguiente acción segura.
151. Los estados críticos no dependen únicamente de color.
152. El foco y la navegación permiten revisar pendientes sin perder la unidad seleccionada.
153. La experiencia táctil evita controles densos en la ruta ordinaria y usa divulgación progresiva para evidencia y metadatos.
154. La interfaz conserva suficiente información para reconstruir quién capturó, quién revisó, quién decidió y quién ejecutó una acción posterior.
155. El usuario que ejecutó la captura no obtiene por ello autoridad para aprobar el resultado.
156. El operador técnico que sincroniza no obtiene autoridad para decidir el hecho empresarial.
157. El dominio propietario conserva la decisión de aceptación, rechazo, corrección o escalamiento.
158. Una conciliación entre dominios exige reconocimiento de cada extremo aplicable.
159. La pantalla puede mostrar bloqueos de cierre, pero no concede autoridad de cierre por mostrarlos.
160. `RESULT_UNKNOWN`, `CONFLICT`, `QUARANTINED` y `RECONCILIATION_REQUIRED` permanecen visibles en el balance hasta resolución o disposición válida.
161. Un pendiente de reincorporación sin propietario se trata como bloqueo y no se oculta en un total agregado.
162. Una evidencia obligatoria no enlazada permanece visible como pendiente.
163. Un efecto downstream obligatorio pendiente permanece visible aunque la unidad fuente esté confirmada.
164. Un folio o registro contabilizado sin destino permanece visible como pendiente.
165. Una operación expirada sin disposición permanece visible como pendiente.
166. La bandeja distingue unidades que no requieren replay de unidades realmente pendientes de incorporación.
167. La bandeja distingue borradores o backlog convertidos en trabajo actual.
168. La bandeja distingue hechos confirmados por la propietaria de efectos downstream todavía pendientes.
169. La bandeja distingue unidades rechazadas, superseded y descartadas con sus motivos.
170. La bandeja permite reconstruir la reducción del total abierto mediante causas demostrables.
171. La superficie no declara `CERRADO` mientras existan bloqueos de reincorporación que el contrato prohíbe ocultar.
172. La superficie no convierte `DESACTIVADO` en `CERRADO`.
173. Un pendiente transferido a trabajo ordinario conserva identidad, propietario y vínculo histórico antes de dejar el balance de continuidad.
174. La interfaz de CONT-UX-004 no implementa la aprobación final de recuperación total o cierre.
175. El seguimiento de respaldos, restauración, failover y validación de recuperación permanece fuera de esta tarea.
176. La ejecución física de replay, outbox, inbox, workers, claims y dead-letter permanece fuera de esta tarea.
177. La resolución de permisos, RLS y controles de servidor permanece fuera de esta tarea.
178. La tarea no selecciona IndexedDB, SQLite, Service Worker, tabla, bucket o almacén físico.
179. La tarea no crea formularios productivos ni emite rangos reales de folios.
180. La tarea no captura datos reales durante una falla.
181. La tarea no ejecuta replay, importaciones, compensaciones, reversos ni conciliaciones sobre datos reales.
182. La tarea no modifica código, DDL, DML, migraciones, RLS, RPC, Edge Functions, datos o Supabase.
183. La tarea no crea ni modifica requisitos de prueba.
184. La ausencia de cambios de requisitos evita generar una copia innecesaria del registro de requisitos.
185. Toda brecha de implementación queda vinculada con una tarea propietaria y una condición de salida.
186. La siguiente tarea permanece exclusivamente reservada.
187. El escenario de caída de red durante una captura permitida conserva la captura local y muestra que todavía no está confirmada.
188. El escenario de reconexión con la misma operación conserva identidad, payload e idempotencia sin duplicar el efecto.
189. El escenario de timeout con `RESULT_UNKNOWN` ofrece verificación del resultado antes de permitir cualquier nueva intención equivalente.
190. El escenario de misma idempotency key y contenido diferente termina en conflicto visible.
191. El escenario de folio manual válido conserva original, representación digital, actor, hora y custodia.
192. El escenario de folio duplicado bloquea confirmación automática y escala la decisión correspondiente.
193. El escenario de folio fuera de rango o ilegible conserva la excepción sin completar datos por inferencia.
194. El escenario de cambio de actor en estación compartida no transfiere pendientes ni custodia.
195. El escenario de autoridad revocada después de un hecho físico conserva el hecho histórico y lo envía a conciliación.
196. El escenario de borrador no ejecutado con autoridad ya inválida impide convertirlo en efecto sin revalidación actual.
197. El escenario de una rama en conflicto permite continuar ramas independientes causalmente elegibles.
198. El escenario de `UPLOADED_UNLINKED` mantiene el recurso abierto cuando la evidencia sea obligatoria.
199. El escenario de servicio reducido conserva límites y reconcilia cada subregistro antes de declarar operación completa.
200. El escenario de operación expirada aún necesaria crea una nueva intención actual enlazada, no un replay de la intención vencida.
201. El escenario de efecto parcial evita repetir la parte confirmada y deja la parte pendiente con estado independiente.
202. El escenario AURA bloqueado no muestra acciones de captura o reincorporación inexistentes.
203. El escenario de dependencia downstream pendiente impide presentar conciliación transversal completa.
204. El escenario de resultado confirmado en la propietaria y fallo de una consumidora mantiene verdadero el hecho fuente y muestra la divergencia downstream.


---

#### 41. Balance de cierre

| Control                                 |   Resultado |
| --------------------------------------- | ----------: |
| servicios evaluados                     | **69 / 69** |
| decisiones UX por servicio              | **69 / 69** |
| servicios activos especificados         | **67 / 67** |
| servicios AURA bloqueados               |   **2 / 2** |
| perfiles activos de estrategia          |   **8 / 8** |
| estados locales reutilizados            | **16 / 16** |
| estados de evidencia reutilizados       |   **8 / 8** |
| controles de admisión UX                | **12 / 12** |
| clases de conflicto reutilizadas        | **12 / 12** |
| resoluciones canónicas reutilizadas     |   **7 / 7** |
| corredores de precedencia representados |   **3 / 3** |
| escenarios deterministas                | **18 / 18** |
| criterios de aceptación                 |     **204** |
| cambios físicos                         |       **0** |
| cambios TREQ                            |       **0** |

---

#### 42. Límites de la tarea

Esta tarea no:

- implementa almacenamiento offline;
- crea una tabla, bucket, outbox, inbox, worker, job o dead-letter;
- crea Service Workers, IndexedDB, SQLite u otra persistencia;
- emite folios o imprime formularios reales;
- captura información productiva durante una falla;
- ejecuta replay o importaciones;
- resuelve conflictos sobre datos productivos;
- ejecuta compensaciones, reversos o correcciones productivas;
- modifica autorización, permisos, RLS o roles;
- restaura infraestructura ni ejecuta failover;
- declara recuperación total, desactivación o cierre;
- modifica código, DDL, DML, migraciones, RPC, Edge Functions, datos o Supabase;
- modifica el registro canónico de requisitos;
- inicia `CONT-UX-005`.

---

#### 43. Continuidad

ÚLTIMA TAREA APROBADA
`CONT-UX-003 — Diseñar runbooks y checklists simples por rol, proceso, sede y modalidad`

TAREA ACTUAL APROBADA
`CONT-UX-004 — Diseñar captura controlada durante la falla y reincorporación posterior`

SIGUIENTE TAREA RESERVADA
`CONT-UX-005 — Diseñar seguimiento de respaldos, restauración, failover, validación y pendientes`


### ✅ CONT-UX-005 — Diseñar seguimiento de respaldos, restauración, failover, validación y pendientes

**Estado:** APROBADA
**Tarea anterior:** `CONT-UX-004 — Diseñar captura controlada durante la falla y reincorporación posterior` — APROBADA
**Tarea siguiente:** `CONT-UX-006 — Diseñar comunicaciones internas y externas con plantillas, canales, confirmación y escalamiento` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de experiencia para seguimiento de cobertura de respaldo, puntos recuperables, restauración, recuperación por dependencias, failover/failback, validación técnica y funcional y pendientes sin ejecutar acciones físicas ni fabricar estados de recuperación
**Bloque:** AC — Continuidad operativa y recuperación
**Fase:** exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`
**Implementación técnica u operativa:** no autorizada
**Servicios evaluados:** 69 / 69
**Servicios activos con experiencia de seguimiento especificada:** 67 / 67
**Servicios AURA bloqueados:** 2 / 2
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Diseñar la experiencia completa mediante la cual Vento OS permite observar, coordinar y demostrar el estado real de respaldos y recuperación sin convertir una señal técnica, una copia, un job, un restore, un health check o una conmutación en una afirmación empresarial que todavía no esté validada.

La superficie debe responder, con trazabilidad y sin ambigüedad:

```text
¿QUE DEBE PODER RECUPERARSE?
¿EXISTE UN PUNTO REALMENTE RECUPERABLE?
¿QUE EDAD TIENE FRENTE AL RPO?
¿QUE PUNTO SE ELIGIO Y POR QUE?
¿QUE SE RESTAURO Y EN QUE AMBIENTE?
¿QUE DEPENDENCIAS SIGUEN BLOQUEADAS?
¿QUE FUENTE ESTA ACTIVA?
¿EXISTE UNA ALTERNATIVA REALMENTE ACREDITADA?
¿QUE VALIDACION TECNICA FALTA?
¿QUE PROPIETARIO DEBE VALIDAR EL MBCO?
¿QUE PENDIENTES IMPIDEN PROMOVER, NORMALIZAR O CERRAR?
```

La tarea adopta como frontera principal:

```text
COPIA EXISTENTE
!= PUNTO RECUPERABLE VERIFICADO
!= RESTORE TECNICO VALIDADO
!= PROCESO EMPRESARIAL RECUPERADO
!= REINCORPORACION Y CONCILIACION COMPLETAS
!= RECUPERACION TOTAL
!= CIERRE
```

---

#### 2. Resultado sustantivo

Quedan materializados los siguientes resultados documentales:

1. una arquitectura UX con dos contextos: preparación/readiness y recuperación activa;
2. un inicio de recuperación que integra incidente, severidad, alcance, MBCO, RTO, RPO, fuente activa, fase del runbook, validaciones y pendientes;
3. una vista de cobertura de respaldos que separa política, mecanismo, último job, último punto realmente recuperable, edad frente a RPO, integridad, restore demostrado y brecha;
4. una ficha de objeto o grupo recuperable que conserva fuente, propietario, sensibilidad, objetivo, manifiesto, cadena, dominio de falla, cifrado, retención, hold, evidencia y condición de salida;
5. una experiencia de selección de punto que expone integridad, contaminación, compatibilidad, consistencia, llaves, hechos posteriores, pérdida potencial y razón de selección;
6. una experiencia de restore que diferencia preparación, aislamiento, restauración, comprobación técnica, validación funcional, promoción y normalización;
7. la representación completa del grafo común de trece etapas de recuperación sin convertirlo en FIFO universal;
8. una vista de dependencias y checkpoints que muestra qué bloquea a qué y permite avanzar ramas independientes;
9. una experiencia específica para ambiente aislado y supresión de efectos externos antes de cualquier promoción;
10. una separación visual estricta entre validación técnica y validación funcional;
11. una puerta de validación empresarial por proceso y propietaria antes de afirmar MBCO;
12. relojes y presupuestos que distinguen RPO, RTO, MTPD y WRT sin inventar un WRT numérico;
13. una experiencia de failover que permanece inhabilitada como acción operativa mientras no exista capacidad alterna acreditada;
14. una representación inequívoca de fuente activa, autoridad de conmutación, prevención de split-brain, delta, validación y rollback;
15. una experiencia de failback/retorno que nunca se activa solo porque el primario vuelva a responder;
16. una bandeja de pendientes que integra restore, validación, reincorporación, conflictos, resultados desconocidos, evidencia y efectos downstream;
17. integración explícita con `CONT-UX-004` para el trabajo contingente que debe compararse contra el punto restaurado;
18. reglas de semántica visual que prohíben un “verde” global por job exitoso, servicio arriba o health check aislado;
19. alertas accionables para edad del punto, cadena rota, integridad, capacidad, llave, restore fallido, ejercicio vencido, dependencia y propietario faltante;
20. una cronología de recuperación que separa observación, decisión, ejecución, validación, promoción, reincorporación, conciliación y retorno;
21. una experiencia de evidencia que muestra quién aportó, quién ejecutó, quién validó, qué artefacto soporta la afirmación y qué falta;
22. una matriz de autoridad que mantiene separados ejecutor técnico, validador técnico, propietario funcional, coordinador de continuidad y aprobador ejecutivo;
23. tratamiento de concentración de funciones sin ocultar autoaprobación crítica;
24. seguimiento explícito de las quince clases recuperables heredadas;
25. seguimiento explícito de los catorce buckets Storage heredados;
26. seguimiento explícito de las veinticuatro Edge Functions heredadas y observables;
27. seguimiento explícito de los siete jobs `pg_cron` heredados sin reproducir material sensible;
28. seguimiento explícito de los doce repositorios VENTO heredados;
29. una matriz 69 / 69 que conserva identidades, propietarias, BIA, objetivos, RTO, RPO, MBCO y prioridades de recuperación;
30. tratamiento explícito de los dos servicios AURA bloqueados sin crearles una ruta operativa inexistente;
31. escenarios deterministas de respaldo, restore, fallo de validación, failover, retorno, degradación, datos posteriores, offline y pendientes;
32. handoffs explícitos a implementación, ejercicios, comunicaciones, evidencia, seguridad y certificación sin ejecutar esas tareas;
33. cero restores reales, cero failovers, cero failbacks, cero cambios físicos y cero cambios de requisitos de prueba.

---

#### 3. Entradas canónicas consumidas

Esta tarea consume y conserva, sin redefinirlas:

- `CONT-DOM-011`, para inventario recuperable, política de cobertura, RPO, retención, seguridad, manifiesto, integridad, separación de dominio de falla y evidencia de restore;
- `CONT-DOM-012`, para selección de punto, ambiente aislado, grafo de trece etapas, restore, validación técnica/funcional, failover, failback, retorno y matrices de recuperación;
- `CONT-DOM-010`, para pendientes, reincorporación, idempotencia, conflictos, resultado desconocido y conciliación;
- `CONT-DOM-013`, para alternativas físicas, de proveedor o canal y la regla de que ninguna alternativa se presume acreditada;
- `CONT-DOM-014`, como propietaria de walkthroughs, restores de prueba, simulaciones y evidencia de readiness;
- `CONT-AUTH-002`, para acceso extraordinario, credenciales de recuperación, break-glass, autoridad de failover, expiración y revocación;
- `CONT-AUTH-003`, para protección de respaldos, runbooks, contactos, evidencia, formularios y datos de contingencia;
- `CONT-AUTH-004`, para separar ejecución, validación técnica, validación funcional, reincorporación, conciliación, recuperación total y cierre;
- `CONT-UX-001`, para estado ejecutivo, impacto, prioridades, responsables, decisiones y bloqueos;
- `CONT-UX-002`, para centro de mando, línea de tiempo, servicios afectados y dimensiones de recuperación;
- `CONT-UX-003`, para runbooks y checklists por función, proceso, sede y modalidad;
- `CONT-UX-004`, para captura durante falla, transición de reconexión, reincorporación, conflictos y balance de unidades;
- `NFR-REQ-009`, para observabilidad, soporte y alertas;
- `NFR-REQ-010`, para respaldo, objetos recuperables, RPO/RTO, restore, failover y certificación;
- el inventario técnico y empresarial aprobado de continuidad;
- la cobertura de prueba ya vigente para backup, restore, failover, validación, conciliación y ejercicios.

La tarea no cambia BIA, `CONT-OBJ-*`, MTPD, RTO, RPO, MBCO, propietarias, prioridades, estrategias de contingencia, autoridad ni estados de readiness.

---

#### 4. Fronteras obligatorias de experiencia

La interfaz conserva como invariantes:

```text
JOB COMPLETADO != PUNTO RECUPERABLE
REPLICA != BACKUP AISLADO
SNAPSHOT != RESTORE DEMOSTRADO
RESPALDO VERIFICADO != RESTORE EJECUTADO
RESTORE EJECUTADO != RESTORE VALIDADO
RESTORE VALIDADO TECNICAMENTE != MBCO VALIDADO
MBCO VALIDADO != CONCILIACION COMPLETA
FAILOVER != RESTORE
FAILOVER != FAILBACK
PRIMARIO SALUDABLE != RETORNO AUTORIZADO
SERVICIO ARRIBA != PROCESO RECUPERADO
SIN ERRORES VISIBLES != PENDIENTES EN CERO
DESACTIVADO != CERRADO
```

Ningún componente visual, color, porcentaje o mensaje puede eliminar estas diferencias.

---

#### 5. Arquitectura de experiencia

La experiencia se divide en dos contextos complementarios:

| Contexto                | Objetivo                                                                   | Puede afirmar                                                                          | No puede afirmar                                                            |
| ----------------------- | -------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| preparación y readiness | saber qué está protegido, qué falta demostrar y qué evidencia está vigente | política, inventario, punto conocido, evidencia existente, brechas y propietarios      | que un restore funcionará bajo presión si no existe prueba vigente          |
| recuperación activa     | coordinar un caso concreto desde selección de punto hasta retorno          | decisiones, checkpoints, ejecución observada, validaciones, fuente activa y pendientes | recuperación empresarial o cierre antes de completar las puertas aplicables |

Las mismas identidades se reutilizan en ambos contextos; no se crean catálogos paralelos de objetos o servicios.

---

#### 6. Mapa de navegación

La superficie se organiza así:

```text
CONTINUIDAD
├─ Estado de recuperación
├─ Respaldos y puntos
│  ├─ Cobertura por objeto/grupo
│  ├─ Salud frente a RPO
│  └─ Evidencia de restore
├─ Recuperación activa
│  ├─ Punto seleccionado
│  ├─ Grafo / checkpoints
│  ├─ Restore y aislamiento
│  ├─ Validación técnica
│  ├─ Validación funcional
│  └─ Fuente activa / failover / retorno
├─ Pendientes y conciliación
│  ├─ Bloqueos
│  ├─ Trabajo contingente
│  ├─ Efectos downstream
│  └─ Propietarios
└─ Evidencia e historial
```

Los elementos de navegación muestran disponibilidad y autoridad reales; poder abrir una vista no concede capacidad para ejecutar una acción protegida.

---

#### 7. Encabezado persistente de recuperación

Cuando exista una recuperación activa, todas las vistas conservan un encabezado compacto con:

```text
incidente / referencia de recuperación
severidad y alcance
servicios y procesos afectados
modalidad vigente
fuente activa conocida
CONT-OBJ / MBCO aplicable
RTO y MTPD aplicables
punto recuperado o candidato
fase/checkpoint actual
estado de validación técnica
estado de validación funcional
pendientes materiales
función efectiva del actor
último cambio relevante
```

Si un dato no puede demostrarse, se muestra como desconocido o pendiente de evidencia; no se completa con inferencias.

---

#### 8. Semántica visual de estado

La interfaz reutiliza los estados documentales heredados cuando corresponda:

- `ESPECIFICADO`;
- `PENDIENTE_DE_EVIDENCIA`;
- `BLOQUEADO`;
- `NO_APLICA`;
- `BLOQUEADO_POR_APLICACION_DIFERIDA`.

Para un checkpoint de ejecución real, la interfaz puede mostrar lenguaje humano como “no iniciado”, “en curso”, “bloqueado” o “verificado por la función aplicable”, pero estas etiquetas son presentación de la evidencia del caso y no nuevos estados persistentes de dominio.

Reglas:

1. un color nunca es la única señal;
2. un porcentaje nunca oculta una dependencia bloqueada;
3. un total agregado permite abrir los elementos que lo componen;
4. un estado “saludable” técnico no se propaga a un proceso sin validación funcional;
5. una copia sin restore demostrado permanece `PENDIENTE_DE_EVIDENCIA` para recuperabilidad;
6. un servicio AURA conserva el bloqueo heredado aunque su infraestructura técnica responda.

---

#### 9. Inicio de recuperación

La vista principal materializa una lectura ejecutiva y operativa simultánea:

```text
RECUPERACION — INCIDENTE / RECOVERY REF

Impacto            [ severidad ]  [ servicios afectados ]
Objetivo            [ MBCO ]       [ RTO ] [ MTPD ]
Punto de datos      [ punto elegido ] [ edad frente a RPO ]
Fuente activa       [ primaria / alternativa acreditada / no demostrada ]
Grafo               [ etapa actual ] [ ramas bloqueadas ]
Val. técnica        [ resultado + evidencia ]
Val. funcional      [ procesos confirmados / pendientes ]
Reincorporación     [ unidades abiertas ]
Pendientes críticos [ conflictos / unknown / evidencia / downstream ]

Siguiente decisión protegida:
[ acción ] — propietario [ función ] — condición [ evidencia/prerrequisito ]
```

La vista no contiene un botón global “recuperar todo”, “sincronizar todo” o “cerrar todo”.

---

#### 10. Vista de cobertura de respaldos

Cada fila de cobertura muestra, cuando el dato exista:

| Campo                               | Significado UX                                                     |
| ----------------------------------- | ------------------------------------------------------------------ |
| objeto o grupo                      | identidad recuperable, no nombre ambiguo de job                    |
| fuente autoritativa                 | dónde reside el hecho o configuración que debe recuperarse         |
| servicios dependientes              | impacto empresarial del objeto                                     |
| RPO aplicable                       | objetivo heredado más exigente del grupo                           |
| último job observado                | señal operacional, no prueba de recuperabilidad                    |
| último punto recuperable verificado | referencia del punto que sí dispone de evidencia suficiente        |
| edad frente a RPO                   | antigüedad del punto verificable, no hora del último inicio de job |
| integridad / manifiesto             | evidencia de contenido, alcance, cadena y versión                  |
| restore demostrado                  | última evidencia válida de restauración aplicable                  |
| dominio de falla                    | evidencia de independencia respecto del primario                   |
| retención / hold                    | política y bloqueo de disposición aplicable                        |
| acceso / llave                      | disponibilidad autorizada sin revelar el secreto                   |
| estado                              | estado documental verdadero                                        |
| brecha                              | condición que impide afirmar cobertura                             |
| propietario                         | función responsable de resolver la brecha                          |

---

#### 11. Regla de salud de respaldo

La superficie nunca calcula “backup OK” con una sola señal. La lectura compuesta debe poder distinguir:

```text
JOB EJECUTADO
PUNTO PRODUCIDO
PUNTO VERIFICADO
EDAD DEL PUNTO
CADENA INTEGRA
MANIFIESTO DISPONIBLE
LLAVE RECUPERABLE
DOMINIO DE FALLA SUFICIENTE
RETENCION VIGENTE
RESTORE DEMOSTRADO
EJERCICIO VIGENTE
```

Una alerta se activa por la condición concreta y no por un mensaje genérico. Una cadena puede estar recibiendo nuevos puntos y aun así permanecer no demostrada para restore.

---

#### 12. Ficha de objeto o grupo recuperable

La ficha separa seis zonas:

1. **Identidad y propiedad:** objeto/grupo, fuente, propietario funcional, custodio técnico, dependencias.
2. **Objetivo:** BIA, `CONT-OBJ`, RPO y condición de consistencia.
3. **Protección:** mecanismo, ubicación, dominio de falla, cifrado, llave por referencia, inmutabilidad cuando aplique.
4. **Puntos:** historial de puntos, manifiestos, integridad, edad, expiración y hold.
5. **Restores:** ejercicios/restores relacionados, ambiente, versión, resultado técnico, resultado funcional y evidencia.
6. **Brechas:** bloqueo, propietario, condición de salida y tarea responsable.

La ficha no revela secretos, tokens, valores de vault ni credenciales completas.

---

#### 13. Selección de punto de recuperación

La experiencia de selección no presenta simplemente una lista de fechas. Para cada candidato muestra:

```text
punto / referencia
fuente y alcance
integridad conocida
contaminación conocida o sospechada
compatibilidad de esquema y aplicación
consistencia del grupo
llaves/material requerido disponible
edad frente a RPO
hechos posteriores que podrían perderse
trabajo offline o manual posterior
riesgo de duplicación/replay
razón para aceptar o descartar el candidato
```

La decisión final conserva quién la preparó, quién la autorizó cuando corresponda y la evidencia utilizada. Un punto más reciente puede ser peor que uno anterior si está contaminado o es incompatible.

---

#### 14. RPO, RTO, MTPD y WRT en pantalla

| Métrica | Qué mide la experiencia                                                                                      | Qué no representa                                        |
| ------- | ------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------- |
| RPO     | pérdida temporal máxima objetivo del estado recuperable; se compara con la edad del último punto verificable | frecuencia nominal de un job                             |
| RTO     | tiempo objetivo hasta obtener el MBCO verificado                                                             | tiempo hasta que un contenedor, base o servicio responda |
| MTPD    | límite máximo tolerable de disrupción empresarial                                                            | permiso para operar inseguro hasta ese límite            |
| WRT     | tiempo posterior necesario para validar, conciliar y normalizar                                              | valor numérico inventado por esta tarea                  |

La superficie puede mostrar elapsed y restante solo cuando existe un inicio temporal confiable y la métrica aplicable. Si el reloj o el inicio son inciertos, la incertidumbre se conserva.

---

#### 15. Seguimiento del restore

La vista de un restore separa etapas y evidencia:

```text
PREPARACION
→ punto y alcance resueltos
→ ambiente y acceso preparados
→ efectos externos bloqueados

RESTAURACION
→ ejecución técnica identificada
→ logs/receipts de la herramienta
→ errores y reintentos conservados

VALIDACION TECNICA
→ integridad + compatibilidad + seguridad + capacidad

VALIDACION FUNCIONAL
→ propietario del proceso confirma MBCO

REINCORPORACION / CONCILIACION
→ trabajo posterior y downstream tratados

PROMOCION / RETORNO
→ solo bajo autoridad y puertas aplicables
```

Un restore fallido conserva el intento y su evidencia; no desaparece al lanzar otro.

---

#### 16. Grafo común de recuperación — 13 etapas

La UX representa las trece etapas heredadas y sus dependencias:

| Orden base | Grupo                                | Resultado visible antes de habilitar consumidores                  |
| ---------: | ------------------------------------ | ------------------------------------------------------------------ |
|          1 | mando y autorización                 | incidente/alcance/funciones/autoridad resolubles                   |
|          2 | identidad técnica, llaves y acceso   | identidad y material utilizables sin revivir privilegios revocados |
|          3 | infraestructura, red, DNS y reloj    | baseline y dependencias técnicas mínimas verificadas               |
|          4 | base de datos y esquema              | fuente autoritativa, compatibilidad e invariantes verificables     |
|          5 | Storage y evidencia                  | contenido, metadatos, permisos y vínculos coherentes               |
|          6 | colas, eventos, jobs y deduplicación | checkpoints y estado de consumo conocidos; sin replay ciego        |
|          7 | aplicaciones propietarias            | propietaria puede operar/validar MBCO sin efectos accidentales     |
|          8 | aplicaciones consumidoras            | fuente propietaria confirmada y contratos compatibles              |
|          9 | integraciones y proveedores          | configuración, receipts, autoridad y deduplicación resueltas       |
|         10 | dispositivos y periféricos           | baseline y efecto físico controlables                              |
|         11 | validación empresarial               | MBCO y obligaciones verificadas por propietaria                    |
|         12 | reincorporación y conciliación       | pendientes y efectos derivados con resultado o disposición         |
|         13 | retorno y normalización              | fuente activa, backlog, accesos temporales y riesgos resueltos     |

El número de etapa es orden base. La UX muestra el grafo real y permite que ramas independientes progresen cuando sus prerequisitos estén satisfechos.

---

#### 17. Checkpoints y dependencias

Cada checkpoint muestra:

```text
identidad
grupo del runbook
prerrequisitos
servicios/procesos afectados
acción observada o esperada
ejecutor
validador
criterio de avance
evidencia
rollback/abortado cuando aplique
estado real
bloqueo
siguiente decisión
```

Una dependencia de menor prioridad puede aparecer primero cuando sea prerrequisito de un servicio más crítico. La prioridad ordena trabajo elegible; no salta dependencias.

---

#### 18. Ambiente aislado y supresión de efectos

Mientras el restore no haya sido promovido, la interfaz mantiene una banda persistente:

```text
AMBIENTE DE RECUPERACION AISLADO
EFECTOS EXTERNOS: BLOQUEADOS POR DEFECTO
```

Debe mostrar por clase de efecto si existe bloqueo demostrado para:

- pagos;
- webhooks;
- mensajes;
- impresiones;
- movimientos físicos o inventario;
- jobs automáticos;
- sincronización/replay;
- integraciones con proveedores;
- cualquier efecto real equivalente.

La ausencia de evidencia de aislamiento es un bloqueo; no se interpreta como aislamiento por defecto.

---

#### 19. Validación técnica

La vista de validación técnica separa resultado y evidencia por control aplicable:

- manifiesto e integridad;
- lectura y consistencia;
- constraints;
- secuencias;
- índices;
- referencias;
- esquema y migraciones;
- RLS, grants y RPC;
- funciones y triggers;
- Storage y vínculos;
- colas/checkpoints/deduplicación;
- observabilidad;
- capacidad mínima;
- identidad, llaves y acceso;
- ausencia de rutas productivas no autorizadas;
- fuente activa inequívoca cuando exista conmutación.

El ejecutor puede aportar evidencia, pero la interfaz no convierte esa evidencia en autoaprobación cuando el riesgo exige validador independiente.

---

#### 20. Validación funcional y MBCO

La validación funcional pertenece a la propietaria del proceso. Por cada servicio debe poder responder:

```text
¿EL PROCESO PRODUCE SU RESULTADO MINIMO MBCO?
¿LAS ENTRADAS Y SALIDAS REQUERIDAS SON CORRECTAS?
¿SALDOS, CANTIDADES, OBLIGACIONES O DOCUMENTOS APLICABLES SON COHERENTES?
¿HECHOS MANUALES/OFFLINE POSTERIORES AL PUNTO FUERON CONSIDERADOS?
¿EXISTEN DUPLICADOS, FALTANTES, CONFLICTOS O RESULT_UNKNOWN?
¿LOS CONSUMIDORES O EFECTOS DERIVADOS REQUERIDOS ESTAN IDENTIFICADOS?
¿QUEDA BACKLOG Y QUIEN LO POSEE?
```

La interfaz muestra por separado “técnicamente disponible” y “funcionalmente validado”. Ninguno sustituye al otro.

---

#### 21. Failover, fuente activa y failback

La línea base heredada conserva **cero sustitutos concretos acreditados**. Por ello, esta tarea diseña la experiencia pero no muestra failover como capacidad disponible por defecto.

La ficha de failover debe mostrar:

```text
recurso primario
candidata alternativa
estado de acreditación
dominio de falla comparado
RPO y limitaciones
fuente activa actual
autoridad de conmutación
ejecutor técnico
protección anti split-brain
checkpoint previo
trabajo/delta durante la conmutación
validación técnica
validación funcional
rollback
condiciones de failback
```

Si no existe alternativa acreditada, la interfaz muestra “sin capacidad alterna acreditada” y la condición de salida; no ofrece una acción operativa fingida.

---

#### 22. Regla de una sola fuente activa

Cuando una futura capacidad de failover exista, la experiencia debe poder demostrar:

1. qué fuente era activa antes de la decisión;
2. qué autoridad aprobó la conmutación;
3. qué mecanismo impide dos escritoras activas incompatibles;
4. qué fuente es activa después;
5. qué escrituras ocurrieron durante la ventana;
6. qué delta debe reintegrarse;
7. qué consumidores fueron pausados o reorientados;
8. qué validaciones se completaron;
9. qué condición permitiría retorno;
10. qué rollback permanece disponible.

Que el primario vuelva a responder no cambia automáticamente la fuente activa.

---

#### 23. Pendientes de recuperación

La bandeja de pendientes integra, sin fusionar semánticas:

- punto recuperable no demostrado;
- restore pendiente o fallido;
- control técnico sin evidencia;
- validación funcional faltante;
- dependencia bloqueada;
- acceso/llave no disponible;
- alternativa no acreditada;
- `RESULT_UNKNOWN`;
- `CONFLICT`;
- `QUARANTINED`;
- `RECONCILIATION_REQUIRED`;
- evidencia obligatoria no enlazada;
- efecto downstream pendiente;
- operación expirada sin disposición;
- trabajo contingente sin destino;
- pendiente sin propietario;
- retorno/failback no autorizado;
- revocación de acceso temporal pendiente.

Cada pendiente muestra origen, impacto, propietario, condición de salida, evidencia necesaria y siguiente acción segura.

---

#### 24. Integración con `CONT-UX-004`

Después de restaurar un punto, la experiencia no procesa automáticamente la cola contingente. Debe abrir la relación con `CONT-UX-004` para comparar:

```text
PUNTO RESTAURADO
+ HECHOS POSTERIORES CONOCIDOS
+ TRABAJO OFFLINE/MANUAL
+ RECEIPTS EXTERNOS
+ ESTADO ACTUAL DEL RECURSO
→ ADMISSION / IDEMPOTENCIA / CONFLICTO
→ REINCORPORACION
→ CONCILIACION
```

La restauración no convierte el dispositivo, papel, outbox o backlog en fuente de verdad. La unidad conserva identidad, actor, tiempos, evidencia y autoridad actuales para el efecto pendiente.

---

#### 25. Cronología y evidencia

La línea de tiempo distingue al menos:

```text
punto creado
punto verificado
incidente declarado
recuperación iniciada
punto seleccionado
restore iniciado
restore terminado técnicamente
validación técnica
validación funcional por proceso
failover/failback si aplica
reincorporación
conciliación
promoción/retorno
revocación de accesos temporales
recuperación total aprobada
cierre, si posteriormente corresponde
```

Cada evento conserva actor o servicio, función, hora, recurso, versión, razón, evidencia y resultado aplicables. Una marca de tiempo faltante no se inventa.

---

#### 26. Autoridad y segregación en la interfaz

| Acto                        | Quién puede prepararlo/ejecutarlo          | Quién valida o aprueba           | Frontera UX                                             |
| --------------------------- | ------------------------------------------ | -------------------------------- | ------------------------------------------------------- |
| ejecutar restore técnico    | ejecutor técnico autorizado                | validador técnico aplicable      | ejecutar no certifica éxito                             |
| validar restore técnico     | función técnica competente                 | evidencia técnica                | no declara MBCO                                         |
| validar MBCO                | propietaria del proceso                    | función empresarial autorizada   | no se delega al proveedor o al técnico por conveniencia |
| autorizar failover          | autoridad aplicable                        | decisión protegida               | distinta de ejecutar la conmutación                     |
| ejecutar failover           | ejecutor técnico autorizado                | validadores técnicos/funcionales | conmutar no certifica recuperación                      |
| autorizar failback          | autoridad aplicable                        | decisión protegida               | no se deriva de health del primario                     |
| reincorporar                | dominio propietario / ejecutor idempotente | regla de admisión y resultado    | no equivale a conciliación total                        |
| proponer recuperación total | responsable de continuidad o sustituto     | autoridad ejecutiva aplicable    | propuesta no equivale a aprobación                      |
| aprobar cierre              | fuera del resultado de esta tarea          | autoridad ejecutiva aplicable    | esta superficie solo muestra bloqueos y evidencia       |

Un botón deshabilitado explica la condición faltante cuando revelar esa información sea seguro.

---

#### 27. Alertas accionables

La experiencia debe poder representar alertas específicas por:

| Señal                         | Qué debe explicar                                                  |
| ----------------------------- | ------------------------------------------------------------------ |
| job omitido                   | qué cadena/objeto dejó de producir puntos y quién responde         |
| edad frente a RPO             | último punto verificable, objetivo y exceso                        |
| cadena incompleta             | tramo faltante o manifiesto inconsistente                          |
| integridad fallida            | punto afectado y bloqueo de promoción                              |
| capacidad insuficiente        | recurso/espacio/tiempo que amenaza backup o restore                |
| llave inaccesible             | material requerido y autoridad/propietario; sin exponer el secreto |
| restore fallido               | etapa, evidencia, rollback y siguiente decisión                    |
| ejercicio vencido             | evidencia vigente ausente; handoff a la tarea de ejercicios        |
| split-brain potencial         | fuentes implicadas y bloqueo de escritura                          |
| validación funcional faltante | proceso y propietaria que debe confirmar MBCO                      |
| pendiente sin propietario     | unidad y bloqueo de cierre/normalización                           |
| efecto downstream pendiente   | hecho fuente confirmado y consumidor aún divergente                |

No existe una alerta genérica que autorice una acción destructiva por sí sola.

---

#### 28. Vistas por función

| Función                    | Vista prioritaria                                                                      | Información secundaria                                        |
| -------------------------- | -------------------------------------------------------------------------------------- | ------------------------------------------------------------- |
| continuidad                | impacto, grafo, tiempos, decisiones, pendientes y propietarios                         | detalle técnico bajo demanda                                  |
| responsable técnico        | restore, dependencias, aislamiento, logs y controles técnicos                          | contexto empresarial necesario para priorizar                 |
| validador técnico          | checklist técnico, evidencia, diferencias y rollback                                   | ejecución histórica sin permiso implícito para modificar      |
| propietaria del proceso    | MBCO, datos/obligaciones, hechos posteriores, backlog y evidencia                      | detalle técnico suficiente para entender la fuente recuperada |
| autoridad ejecutiva        | estado verdadero, riesgos, validaciones, alternativas, pendientes y decisión requerida | metadatos técnicos progresivos                                |
| auditor/revisor autorizado | cronología, evidencia, autoridades, versiones y decisiones                             | datos sensibles solo según finalidad y acceso                 |

La misma persona puede ejercer más de una función, pero la interfaz conserva cada acto y autoridad por separado.

---

#### 29. Inventario UX de las quince clases recuperables

|    # | Clase heredada                          | Alcance                                                                   | Seguimiento UX obligatorio                                                                                                             |
| ---: | --------------------------------------- | ------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | fuente canónica empresarial             | hechos autoritativos de los dominios                                      | Mostrar cobertura, último punto realmente recuperable, integridad, restore y brecha; nunca inferir recuperabilidad desde una copia.    |
|    2 | proyección regenerable                  | vistas, agregados, índices y derivados                                    | Mostrar fuente de reconstrucción, tiempo esperado y prueba de regeneración antes de permitir tratarla como excluible.                  |
|    3 | caché                                   | referencias temporales y cachés                                           | Mostrar que no es fuente autoritativa y la condición de reconstrucción o invalidación.                                                 |
|    4 | estado transaccional                    | pedidos, ventas, movimientos, pagos, producción y demás hechos            | Mostrar grupo de consistencia, RPO, punto elegido, delta posterior y conciliación.                                                     |
|    5 | ledger                                  | saldos, puntos, dinero, inventario o movimientos acumulativos             | Mostrar cadena, idempotencia, consistencia y balance antes/después.                                                                    |
|    6 | documentos y evidencia                  | Storage, documentos y soportes vinculados                                 | Mostrar contenido, hash, metadatos, permisos, retención, vínculo y evidencia de restore.                                               |
|    7 | configuración                           | reglas, cron, routing, parámetros y configuración no secreta              | Mostrar versión, release compatible, dependencia de secretos y capacidad de reconstrucción.                                            |
|    8 | secreto o llave                         | credenciales, certificados, claves y material de autenticación            | Mostrar solo referencia, disponibilidad/autoridad y prueba controlada; nunca revelar valor secreto.                                    |
|    9 | artefacto de software                   | código, dependencias, build, release, migraciones, contratos y plantillas | Mostrar revisión identificable, reproducibilidad, compatibilidad y evidencia de rebuild.                                               |
|   10 | estado de integración                   | receipts, correlaciones, cursor, webhook y proveedor                      | Mostrar receipts, cursor, resultado conocido/desconocido y condición de reanudación idempotente.                                       |
|   11 | cola y trabajo pendiente                | outbox, inbox, jobs, checkpoints y dead-letter                            | Mostrar identidad, orden, consumo, deduplicación, backlog y condición de replay.                                                       |
|   12 | estado local/offline                    | operaciones locales aún no incorporadas                                   | Enlazar con CONT-UX-004; mostrar fuente restaurada, unidad local, conflicto y necesidad de reincorporación.                            |
|   13 | telemetría y auditoría                  | logs, auditoría y señales requeridas                                      | Mostrar disponibilidad suficiente para investigación y validación sin asumir retención infinita.                                       |
|   14 | configuración de dispositivo/periférico | endpoint, red, impresora y estación                                       | Mostrar baseline, versión, conectividad, drivers/periféricos y prueba representativa.                                                  |
|   15 | registro de proveedor externo           | datos, receipts, configuración y evidencia bajo tercero                   | Mostrar contrato, recibos, capacidad de recuperación/salida y evidencia; no confundir proveedor disponible con alternativa acreditada. |


Todas las clases conservan identidad y propietario; ninguna se elimina del seguimiento porque hoy falte evidencia física de recuperación.

---

#### 30. Seguimiento de Storage — 14 / 14

|    # | Bucket                   | Bandera técnica heredada | Seguimiento UX                                                                                                                            |
| ---: | ------------------------ | ------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | `commercial-menu-images` | público                  | contenido, metadatos, vínculo, permisos, retención, punto, restore y evidencia; la bandera técnica no sustituye clasificación empresarial |
|    2 | `documents`              | público                  | contenido, metadatos, vínculo, permisos, retención, punto, restore y evidencia; la bandera técnica no sustituye clasificación empresarial |
|    3 | `employee-photos`        | público                  | contenido, metadatos, vínculo, permisos, retención, punto, restore y evidencia; la bandera técnica no sustituye clasificación empresarial |
|    4 | `nexo-ai-documents`      | privado                  | contenido, metadatos, vínculo, permisos, retención, punto, restore y evidencia; la bandera técnica no sustituye clasificación empresarial |
|    5 | `nexo-catalog-images`    | público                  | contenido, metadatos, vínculo, permisos, retención, punto, restore y evidencia; la bandera técnica no sustituye clasificación empresarial |
|    6 | `pass-satellite-logos`   | público                  | contenido, metadatos, vínculo, permisos, retención, punto, restore y evidencia; la bandera técnica no sustituye clasificación empresarial |
|    7 | `product-images`         | público                  | contenido, metadatos, vínculo, permisos, retención, punto, restore y evidencia; la bandera técnica no sustituye clasificación empresarial |
|    8 | `public-documents`       | público                  | contenido, metadatos, vínculo, permisos, retención, punto, restore y evidencia; la bandera técnica no sustituye clasificación empresarial |
|    9 | `recipe-media`           | privado                  | contenido, metadatos, vínculo, permisos, retención, punto, restore y evidencia; la bandera técnica no sustituye clasificación empresarial |
|   10 | `recipe-step-photos`     | público                  | contenido, metadatos, vínculo, permisos, retención, punto, restore y evidencia; la bandera técnica no sustituye clasificación empresarial |
|   11 | `talento-cv`             | privado                  | contenido, metadatos, vínculo, permisos, retención, punto, restore y evidencia; la bandera técnica no sustituye clasificación empresarial |
|   12 | `talento-documents`      | privado                  | contenido, metadatos, vínculo, permisos, retención, punto, restore y evidencia; la bandera técnica no sustituye clasificación empresarial |
|   13 | `talento-medical`        | privado                  | contenido, metadatos, vínculo, permisos, retención, punto, restore y evidencia; la bandera técnica no sustituye clasificación empresarial |
|   14 | `website-media`          | privado                  | contenido, metadatos, vínculo, permisos, retención, punto, restore y evidencia; la bandera técnica no sustituye clasificación empresarial |


Un bucket vacío sigue requiriendo reconstrucción de configuración y permisos aplicables; cero objetos no equivale a cero obligación de recuperación.

---

#### 31. Seguimiento de Edge Functions — 24 / 24

|    # | Función                     | Seguimiento UX                                                                                                                                                                   |
| ---: | --------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | `wallet-pass`               | revisión/release compatible, configuración no secreta, referencias de secreto separadas, build/rebuild, efectos externos suprimidos hasta autorización y evidencia de validación |
|    2 | `attendance-report`         | revisión/release compatible, configuración no secreta, referencias de secreto separadas, build/rebuild, efectos externos suprimidos hasta autorización y evidencia de validación |
|    3 | `staff-invitations-create`  | revisión/release compatible, configuración no secreta, referencias de secreto separadas, build/rebuild, efectos externos suprimidos hasta autorización y evidencia de validación |
|    4 | `staff-invitations-accept`  | revisión/release compatible, configuración no secreta, referencias de secreto separadas, build/rebuild, efectos externos suprimidos hasta autorización y evidencia de validación |
|    5 | `staff-invitations-resend`  | revisión/release compatible, configuración no secreta, referencias de secreto separadas, build/rebuild, efectos externos suprimidos hasta autorización y evidencia de validación |
|    6 | `staff-invitations-cancel`  | revisión/release compatible, configuración no secreta, referencias de secreto separadas, build/rebuild, efectos externos suprimidos hasta autorización y evidencia de validación |
|    7 | `document-alerts`           | revisión/release compatible, configuración no secreta, referencias de secreto separadas, build/rebuild, efectos externos suprimidos hasta autorización y evidencia de validación |
|    8 | `request-account-deletion`  | revisión/release compatible, configuración no secreta, referencias de secreto separadas, build/rebuild, efectos externos suprimidos hasta autorización y evidencia de validación |
|    9 | `account-deletion`          | revisión/release compatible, configuración no secreta, referencias de secreto separadas, build/rebuild, efectos externos suprimidos hasta autorización y evidencia de validación |
|   10 | `process-account-deletions` | revisión/release compatible, configuración no secreta, referencias de secreto separadas, build/rebuild, efectos externos suprimidos hasta autorización y evidencia de validación |
|   11 | `register-push-token`       | revisión/release compatible, configuración no secreta, referencias de secreto separadas, build/rebuild, efectos externos suprimidos hasta autorización y evidencia de validación |
|   12 | `announcement-notify`       | revisión/release compatible, configuración no secreta, referencias de secreto separadas, build/rebuild, efectos externos suprimidos hasta autorización y evidencia de validación |
|   13 | `employee-delete`           | revisión/release compatible, configuración no secreta, referencias de secreto separadas, build/rebuild, efectos externos suprimidos hasta autorización y evidencia de validación |
|   14 | `payments-create-intent`    | revisión/release compatible, configuración no secreta, referencias de secreto separadas, build/rebuild, efectos externos suprimidos hasta autorización y evidencia de validación |
|   15 | `payments-webhook`          | revisión/release compatible, configuración no secreta, referencias de secreto separadas, build/rebuild, efectos externos suprimidos hasta autorización y evidencia de validación |
|   16 | `payments-return`           | revisión/release compatible, configuración no secreta, referencias de secreto separadas, build/rebuild, efectos externos suprimidos hasta autorización y evidencia de validación |
|   17 | `shift-publish-notify`      | revisión/release compatible, configuración no secreta, referencias de secreto separadas, build/rebuild, efectos externos suprimidos hasta autorización y evidencia de validación |
|   18 | `shift-runtime-processor`   | revisión/release compatible, configuración no secreta, referencias de secreto separadas, build/rebuild, efectos externos suprimidos hasta autorización y evidencia de validación |
|   19 | `pass-delivery-quote`       | revisión/release compatible, configuración no secreta, referencias de secreto separadas, build/rebuild, efectos externos suprimidos hasta autorización y evidencia de validación |
|   20 | `pass-address-search`       | revisión/release compatible, configuración no secreta, referencias de secreto separadas, build/rebuild, efectos externos suprimidos hasta autorización y evidencia de validación |
|   21 | `pass-register-push-token`  | revisión/release compatible, configuración no secreta, referencias de secreto separadas, build/rebuild, efectos externos suprimidos hasta autorización y evidencia de validación |
|   22 | `support-message-notify`    | revisión/release compatible, configuración no secreta, referencias de secreto separadas, build/rebuild, efectos externos suprimidos hasta autorización y evidencia de validación |
|   23 | `order-message-notify`      | revisión/release compatible, configuración no secreta, referencias de secreto separadas, build/rebuild, efectos externos suprimidos hasta autorización y evidencia de validación |
|   24 | `delivery-portal`           | revisión/release compatible, configuración no secreta, referencias de secreto separadas, build/rebuild, efectos externos suprimidos hasta autorización y evidencia de validación |


La existencia de una función activa no se presenta como evidencia de que pueda reconstruirse después de una pérdida del dominio primario.

---

#### 32. Seguimiento de jobs `pg_cron` — 7 / 7

|    # | Job                                                  | Programación heredada | Seguimiento UX                                                                                                                        |
| ---: | ---------------------------------------------------- | --------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | `document-alerts-daily`                              | `0 14 * * *`          | definición versionada, dependencia/función destino, estado de reconstrucción, activación controlada y separación de material sensible |
|    2 | `auto-close-attendance`                              | `59 4 * * *`          | definición versionada, dependencia/función destino, estado de reconstrucción, activación controlada y separación de material sensible |
|    3 | `anima_shift_runtime_processor_every_5m`             | `*/5 * * * *`         | definición versionada, dependencia/función destino, estado de reconstrucción, activación controlada y separación de material sensible |
|    4 | `pass_delivery_quotes_cleanup_hourly`                | `17 * * * *`          | definición versionada, dependencia/función destino, estado de reconstrucción, activación controlada y separación de material sensible |
|    5 | `anima_attendance_day_end_close_0005`                | `5 0 * * *`           | definición versionada, dependencia/función destino, estado de reconstrucción, activación controlada y separación de material sensible |
|    6 | `attendance_stale_open_shift_autoclose_daily_bogota` | `10 5 * * *`          | definición versionada, dependencia/función destino, estado de reconstrucción, activación controlada y separación de material sensible |
|    7 | `pass_payment_checkout_expiry_reconciliation`        | `*/5 * * * *`         | definición versionada, dependencia/función destino, estado de reconstrucción, activación controlada y separación de material sensible |


La superficie nunca reproduce material sensible embebido. La configuración que no pueda separarse de un secreto permanece bloqueada para copia segura hasta resolver la condición propietaria.

---

#### 33. Seguimiento de repositorios VENTO — 12 / 12

|    # | Repositorio     | Seguimiento UX                                                                                                                                                                              |
| ---: | --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | `vento-anima`   | historia, revisión identificable, dependencias, build/rebuild y evidencia de copia o reconstrucción independiente; el remoto versionado no se presenta como copia independiente por sí solo |
|    2 | `vento-fogo`    | historia, revisión identificable, dependencias, build/rebuild y evidencia de copia o reconstrucción independiente; el remoto versionado no se presenta como copia independiente por sí solo |
|    3 | `Vento-Group`   | historia, revisión identificable, dependencias, build/rebuild y evidencia de copia o reconstrucción independiente; el remoto versionado no se presenta como copia independiente por sí solo |
|    4 | `vento-nexo`    | historia, revisión identificable, dependencias, build/rebuild y evidencia de copia o reconstrucción independiente; el remoto versionado no se presenta como copia independiente por sí solo |
|    5 | `vento-numera`  | historia, revisión identificable, dependencias, build/rebuild y evidencia de copia o reconstrucción independiente; el remoto versionado no se presenta como copia independiente por sí solo |
|    6 | `vento-origo`   | historia, revisión identificable, dependencias, build/rebuild y evidencia de copia o reconstrucción independiente; el remoto versionado no se presenta como copia independiente por sí solo |
|    7 | `vento-pass`    | historia, revisión identificable, dependencias, build/rebuild y evidencia de copia o reconstrucción independiente; el remoto versionado no se presenta como copia independiente por sí solo |
|    8 | `vento-pulso`   | historia, revisión identificable, dependencias, build/rebuild y evidencia de copia o reconstrucción independiente; el remoto versionado no se presenta como copia independiente por sí solo |
|    9 | `vento-shell`   | fuente obligatoria de cambios Supabase, además de código y contratos; el remoto versionado no se presenta como copia independiente por sí solo                                              |
|   10 | `vento-talento` | historia, revisión identificable, dependencias, build/rebuild y evidencia de copia o reconstrucción independiente; el remoto versionado no se presenta como copia independiente por sí solo |
|   11 | `vento-viso`    | historia, revisión identificable, dependencias, build/rebuild y evidencia de copia o reconstrucción independiente; el remoto versionado no se presenta como copia independiente por sí solo |
|   12 | `vento-vital`   | historia, revisión identificable, dependencias, build/rebuild y evidencia de copia o reconstrucción independiente; el remoto versionado no se presenta como copia independiente por sí solo |


---

#### 34. Experiencia materializada por los 69 servicios

La matriz conserva las identidades y objetivos heredados. La columna “Seguimiento de recuperación” materializa la decisión UX de esta tarea; no crea un estado de dominio nuevo.

|    # | Servicio         | Proceso      | Propietaria | BIA                    | Objetivo       |     MTPD |      RTO |      RPO | MBCO                           | Prioridad         | Seguimiento de recuperación                                                                                                  | Validación funcional                                                                                                            | Estado documental                                       |
| ---: | ---------------- | ------------ | ----------- | ---------------------- | -------------- | -------: | -------: | -------: | ------------------------------ | ----------------- | ---------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------- |
|    1 | `BCS-VPROC-0001` | `VPROC-0001` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | VISO confirma el resultado del proceso y el expediente aplicable; después se verifican dependencias y pendientes transversales. | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|    2 | `BCS-VPROC-0002` | `VPROC-0002` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | VISO confirma el resultado del proceso y el expediente aplicable; después se verifican dependencias y pendientes transversales. | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|    3 | `BCS-VPROC-0003` | `VPROC-0003` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | VISO confirma el resultado del proceso y el expediente aplicable; después se verifican dependencias y pendientes transversales. | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|    4 | `BCS-VPROC-0004` | `VPROC-0004` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | VISO confirma el resultado del proceso y el expediente aplicable; después se verifican dependencias y pendientes transversales. | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|    5 | `BCS-VPROC-0005` | `VPROC-0005` | `viso`      | `DIFERIBLE_CONTROLADA` | `CONT-OBJ-004` |   `72 h` |   `24 h` |   `24 h` | `DIFERIR_CON_TRAZABILIDAD`     | `PR-3_DIFERIBLE`  | Diferir con trazabilidad: conservar punto recuperable, propietario, backlog y condición de reanudación.                      | VISO confirma el resultado del proceso y el expediente aplicable; después se verifican dependencias y pendientes transversales. | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|    6 | `BCS-VPROC-0006` | `VPROC-0006` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | VISO confirma el resultado del proceso y el expediente aplicable; después se verifican dependencias y pendientes transversales. | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|    7 | `BCS-VPROC-0007` | `VPROC-0007` | `viso`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    `4 h` |    `2 h` |    `1 h` | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | Recuperar resultado esencial: priorizar el grafo causal, el MBCO y la validación funcional del propietario.                  | VISO confirma el resultado del proceso y el expediente aplicable; después se verifican dependencias y pendientes transversales. | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|    8 | `BCS-VPROC-0008` | `VPROC-0008` | `anima`     | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | ANIMA confirma los hechos de personas aplicables y sus dependencias antes de declarar el proceso funcional.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|    9 | `BCS-VPROC-0009` | `VPROC-0009` | `viso`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    `4 h` |    `2 h` |    `1 h` | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | Recuperar resultado esencial: priorizar el grafo causal, el MBCO y la validación funcional del propietario.                  | VISO confirma el resultado del proceso y el expediente aplicable; después se verifican dependencias y pendientes transversales. | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   10 | `BCS-VPROC-0010` | `VPROC-0010` | `numera`    | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | NUMERA confirma efecto económico, saldo, obligación o control financiero aplicable; después se concilian fuentes.               | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   11 | `BCS-VPROC-0011` | `VPROC-0011` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | VISO confirma el resultado del proceso y el expediente aplicable; después se verifican dependencias y pendientes transversales. | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   12 | `BCS-VPROC-0012` | `VPROC-0012` | `viso`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001` | `30 min` | `15 min` | `15 min` | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | Protección primero: mostrar control protector, dependencias críticas y bloqueo hasta evidencia suficiente.                   | VISO confirma el resultado del proceso y el expediente aplicable; después se verifican dependencias y pendientes transversales. | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   13 | `BCS-VPROC-0013` | `VPROC-0013` | `viso`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001` | `30 min` | `15 min` | `15 min` | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | Protección primero: mostrar control protector, dependencias críticas y bloqueo hasta evidencia suficiente.                   | VISO confirma el resultado del proceso y el expediente aplicable; después se verifican dependencias y pendientes transversales. | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   14 | `BCS-VPROC-0014` | `VPROC-0014` | `viso`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001` | `30 min` | `15 min` | `15 min` | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | Protección primero: mostrar control protector, dependencias críticas y bloqueo hasta evidencia suficiente.                   | VISO confirma el resultado del proceso y el expediente aplicable; después se verifican dependencias y pendientes transversales. | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   15 | `BCS-VPROC-0015` | `VPROC-0015` | `nexo`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | NEXO confirma cantidades, ubicación, custodia o estado físico aplicable; después se concilian consumidores.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   16 | `BCS-VPROC-0016` | `VPROC-0016` | `fogo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    `4 h` |    `2 h` |    `1 h` | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | Recuperar resultado esencial: priorizar el grafo causal, el MBCO y la validación funcional del propietario.                  | FOGO confirma lote, producción, calidad o resultado productivo aplicable; después se concilian efectos derivados.               | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   17 | `BCS-VPROC-0017` | `VPROC-0017` | `pulso`     | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    `4 h` |    `2 h` |    `1 h` | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | Recuperar resultado esencial: priorizar el grafo causal, el MBCO y la validación funcional del propietario.                  | PULSO confirma pedido, venta, servicio o hecho comercial aplicable; después se concilian efectos derivados.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   18 | `BCS-VPROC-0018` | `VPROC-0018` | `nexo`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001` | `30 min` | `15 min` | `15 min` | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | Protección primero: mostrar control protector, dependencias críticas y bloqueo hasta evidencia suficiente.                   | NEXO confirma cantidades, ubicación, custodia o estado físico aplicable; después se concilian consumidores.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   19 | `BCS-VPROC-0019` | `VPROC-0019` | `origo`     | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | ORIGO confirma compra, recepción u obligación de abastecimiento aplicable; después se concilian efectos derivados.              | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   20 | `BCS-VPROC-0020` | `VPROC-0020` | `origo`     | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | ORIGO confirma compra, recepción u obligación de abastecimiento aplicable; después se concilian efectos derivados.              | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   21 | `BCS-VPROC-0021` | `VPROC-0021` | `origo`     | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | ORIGO confirma compra, recepción u obligación de abastecimiento aplicable; después se concilian efectos derivados.              | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   22 | `BCS-VPROC-0022` | `VPROC-0022` | `origo`     | `CRITICA_PROTECCION`   | `CONT-OBJ-001` | `30 min` | `15 min` | `15 min` | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | Protección primero: mostrar control protector, dependencias críticas y bloqueo hasta evidencia suficiente.                   | ORIGO confirma compra, recepción u obligación de abastecimiento aplicable; después se concilian efectos derivados.              | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   23 | `BCS-VPROC-0023` | `VPROC-0023` | `nexo`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | NEXO confirma cantidades, ubicación, custodia o estado físico aplicable; después se concilian consumidores.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   24 | `BCS-VPROC-0024` | `VPROC-0024` | `nexo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    `4 h` |    `2 h` |    `1 h` | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | Recuperar resultado esencial: priorizar el grafo causal, el MBCO y la validación funcional del propietario.                  | NEXO confirma cantidades, ubicación, custodia o estado físico aplicable; después se concilian consumidores.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   25 | `BCS-VPROC-0025` | `VPROC-0025` | `nexo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    `4 h` |    `2 h` |    `1 h` | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | Recuperar resultado esencial: priorizar el grafo causal, el MBCO y la validación funcional del propietario.                  | NEXO confirma cantidades, ubicación, custodia o estado físico aplicable; después se concilian consumidores.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   26 | `BCS-VPROC-0026` | `VPROC-0026` | `nexo`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | NEXO confirma cantidades, ubicación, custodia o estado físico aplicable; después se concilian consumidores.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   27 | `BCS-VPROC-0027` | `VPROC-0027` | `nexo`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001` | `30 min` | `15 min` | `15 min` | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | Protección primero: mostrar control protector, dependencias críticas y bloqueo hasta evidencia suficiente.                   | NEXO confirma cantidades, ubicación, custodia o estado físico aplicable; después se concilian consumidores.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   28 | `BCS-VPROC-0028` | `VPROC-0028` | `nexo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    `4 h` |    `2 h` |    `1 h` | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | Recuperar resultado esencial: priorizar el grafo causal, el MBCO y la validación funcional del propietario.                  | NEXO confirma cantidades, ubicación, custodia o estado físico aplicable; después se concilian consumidores.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   29 | `BCS-VPROC-0029` | `VPROC-0029` | `nexo`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | NEXO confirma cantidades, ubicación, custodia o estado físico aplicable; después se concilian consumidores.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   30 | `BCS-VPROC-0030` | `VPROC-0030` | `nexo`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | NEXO confirma cantidades, ubicación, custodia o estado físico aplicable; después se concilian consumidores.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   31 | `BCS-VPROC-0031` | `VPROC-0031` | `nexo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    `4 h` |    `2 h` |    `1 h` | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | Recuperar resultado esencial: priorizar el grafo causal, el MBCO y la validación funcional del propietario.                  | NEXO confirma cantidades, ubicación, custodia o estado físico aplicable; después se concilian consumidores.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   32 | `BCS-VPROC-0032` | `VPROC-0032` | `nexo`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | NEXO confirma cantidades, ubicación, custodia o estado físico aplicable; después se concilian consumidores.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   33 | `BCS-VPROC-0033` | `VPROC-0033` | `fogo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    `4 h` |    `2 h` |    `1 h` | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | Recuperar resultado esencial: priorizar el grafo causal, el MBCO y la validación funcional del propietario.                  | FOGO confirma lote, producción, calidad o resultado productivo aplicable; después se concilian efectos derivados.               | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   34 | `BCS-VPROC-0034` | `VPROC-0034` | `fogo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    `4 h` |    `2 h` |    `1 h` | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | Recuperar resultado esencial: priorizar el grafo causal, el MBCO y la validación funcional del propietario.                  | FOGO confirma lote, producción, calidad o resultado productivo aplicable; después se concilian efectos derivados.               | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   35 | `BCS-VPROC-0035` | `VPROC-0035` | `fogo`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001` | `30 min` | `15 min` | `15 min` | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | Protección primero: mostrar control protector, dependencias críticas y bloqueo hasta evidencia suficiente.                   | FOGO confirma lote, producción, calidad o resultado productivo aplicable; después se concilian efectos derivados.               | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   36 | `BCS-VPROC-0036` | `VPROC-0036` | `fogo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    `4 h` |    `2 h` |    `1 h` | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | Recuperar resultado esencial: priorizar el grafo causal, el MBCO y la validación funcional del propietario.                  | FOGO confirma lote, producción, calidad o resultado productivo aplicable; después se concilian efectos derivados.               | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   37 | `BCS-VPROC-0037` | `VPROC-0037` | `fogo`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | FOGO confirma lote, producción, calidad o resultado productivo aplicable; después se concilian efectos derivados.               | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   38 | `BCS-VPROC-0038` | `VPROC-0038` | `pulso`     | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    `4 h` |    `2 h` |    `1 h` | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | Recuperar resultado esencial: priorizar el grafo causal, el MBCO y la validación funcional del propietario.                  | PULSO confirma pedido, venta, servicio o hecho comercial aplicable; después se concilian efectos derivados.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   39 | `BCS-VPROC-0039` | `VPROC-0039` | `pulso`     | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    `4 h` |    `2 h` |    `1 h` | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | Recuperar resultado esencial: priorizar el grafo causal, el MBCO y la validación funcional del propietario.                  | PULSO confirma pedido, venta, servicio o hecho comercial aplicable; después se concilian efectos derivados.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   40 | `BCS-VPROC-0040` | `VPROC-0040` | `pulso`     | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    `4 h` |    `2 h` |    `1 h` | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | Recuperar resultado esencial: priorizar el grafo causal, el MBCO y la validación funcional del propietario.                  | PULSO confirma pedido, venta, servicio o hecho comercial aplicable; después se concilian efectos derivados.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   41 | `BCS-VPROC-0041` | `VPROC-0041` | `pulso`     | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    `4 h` |    `2 h` |    `1 h` | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | Recuperar resultado esencial: priorizar el grafo causal, el MBCO y la validación funcional del propietario.                  | PULSO confirma pedido, venta, servicio o hecho comercial aplicable; después se concilian efectos derivados.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   42 | `BCS-VPROC-0042` | `VPROC-0042` | `pulso`     | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    `4 h` |    `2 h` |    `1 h` | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | Recuperar resultado esencial: priorizar el grafo causal, el MBCO y la validación funcional del propietario.                  | PULSO confirma pedido, venta, servicio o hecho comercial aplicable; después se concilian efectos derivados.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   43 | `BCS-VPROC-0043` | `VPROC-0043` | `pulso`     | `CRITICA_PROTECCION`   | `CONT-OBJ-001` | `30 min` | `15 min` | `15 min` | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | Protección primero: mostrar control protector, dependencias críticas y bloqueo hasta evidencia suficiente.                   | PULSO confirma pedido, venta, servicio o hecho comercial aplicable; después se concilian efectos derivados.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   44 | `BCS-VPROC-0044` | `VPROC-0044` | `pulso`     | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | PULSO confirma pedido, venta, servicio o hecho comercial aplicable; después se concilian efectos derivados.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   45 | `BCS-VPROC-0045` | `VPROC-0045` | `pass`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | PASS confirma el hecho aplicable y su vínculo con la fuente empresarial; después se concilian efectos derivados.                | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   46 | `BCS-VPROC-0046` | `VPROC-0046` | `pulso`     | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | PULSO confirma pedido, venta, servicio o hecho comercial aplicable; después se concilian efectos derivados.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   47 | `BCS-VPROC-0047` | `VPROC-0047` | `pulso`     | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | PULSO confirma pedido, venta, servicio o hecho comercial aplicable; después se concilian efectos derivados.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   48 | `BCS-VPROC-0048` | `VPROC-0048` | `nexo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    `4 h` |    `2 h` |    `1 h` | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | Recuperar resultado esencial: priorizar el grafo causal, el MBCO y la validación funcional del propietario.                  | NEXO confirma cantidades, ubicación, custodia o estado físico aplicable; después se concilian consumidores.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   49 | `BCS-VPROC-0049` | `VPROC-0049` | `nexo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    `4 h` |    `2 h` |    `1 h` | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | Recuperar resultado esencial: priorizar el grafo causal, el MBCO y la validación funcional del propietario.                  | NEXO confirma cantidades, ubicación, custodia o estado físico aplicable; después se concilian consumidores.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   50 | `BCS-VPROC-0050` | `VPROC-0050` | `pulso`     | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    `4 h` |    `2 h` |    `1 h` | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | Recuperar resultado esencial: priorizar el grafo causal, el MBCO y la validación funcional del propietario.                  | PULSO confirma pedido, venta, servicio o hecho comercial aplicable; después se concilian efectos derivados.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   51 | `BCS-VPROC-0051` | `VPROC-0051` | `numera`    | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | NUMERA confirma efecto económico, saldo, obligación o control financiero aplicable; después se concilian fuentes.               | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   52 | `BCS-VPROC-0052` | `VPROC-0052` | `numera`    | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | NUMERA confirma efecto económico, saldo, obligación o control financiero aplicable; después se concilian fuentes.               | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   53 | `BCS-VPROC-0053` | `VPROC-0053` | `numera`    | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | NUMERA confirma efecto económico, saldo, obligación o control financiero aplicable; después se concilian fuentes.               | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   54 | `BCS-VPROC-0054` | `VPROC-0054` | `numera`    | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | NUMERA confirma efecto económico, saldo, obligación o control financiero aplicable; después se concilian fuentes.               | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   55 | `BCS-VPROC-0055` | `VPROC-0055` | `nexo`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001` | `30 min` | `15 min` | `15 min` | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | Protección primero: mostrar control protector, dependencias críticas y bloqueo hasta evidencia suficiente.                   | NEXO confirma cantidades, ubicación, custodia o estado físico aplicable; después se concilian consumidores.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   56 | `BCS-VPROC-0056` | `VPROC-0056` | `aura`      | `DIFERIBLE_CONTROLADA` | `CONT-OBJ-004` |   `72 h` |   `24 h` |   `24 h` | `DIFERIR_CON_TRAZABILIDAD`     | `PR-3_DIFERIBLE`  | Conservar cobertura y brechas heredadas; no mostrar restore, failover o validación operativa AURA como capacidad disponible. | Sin validación operativa AURA mientras la aplicación permanezca diferida; solo se muestra la cobertura documental heredada.     | `BLOQUEADO_POR_APLICACION_DIFERIDA`                     |
|   57 | `BCS-VPROC-0057` | `VPROC-0057` | `aura`      | `DIFERIBLE_CONTROLADA` | `CONT-OBJ-004` |   `72 h` |   `24 h` |   `24 h` | `DIFERIR_CON_TRAZABILIDAD`     | `PR-3_DIFERIBLE`  | Conservar cobertura y brechas heredadas; no mostrar restore, failover o validación operativa AURA como capacidad disponible. | Sin validación operativa AURA mientras la aplicación permanezca diferida; solo se muestra la cobertura documental heredada.     | `BLOQUEADO_POR_APLICACION_DIFERIDA`                     |
|   58 | `BCS-VPROC-0058` | `VPROC-0058` | `viso`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    `4 h` |    `2 h` |    `1 h` | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | Recuperar resultado esencial: priorizar el grafo causal, el MBCO y la validación funcional del propietario.                  | VISO confirma el resultado del proceso y el expediente aplicable; después se verifican dependencias y pendientes transversales. | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   59 | `BCS-VPROC-0059` | `VPROC-0059` | `viso`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001` | `30 min` | `15 min` | `15 min` | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | Protección primero: mostrar control protector, dependencias críticas y bloqueo hasta evidencia suficiente.                   | VISO confirma el resultado del proceso y el expediente aplicable; después se verifican dependencias y pendientes transversales. | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   60 | `BCS-VPROC-0060` | `VPROC-0060` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | VISO confirma el resultado del proceso y el expediente aplicable; después se verifican dependencias y pendientes transversales. | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   61 | `BCS-VPROC-0061` | `VPROC-0061` | `numera`    | `DIFERIBLE_CONTROLADA` | `CONT-OBJ-004` |   `72 h` |   `24 h` |   `24 h` | `DIFERIR_CON_TRAZABILIDAD`     | `PR-3_DIFERIBLE`  | Diferir con trazabilidad: conservar punto recuperable, propietario, backlog y condición de reanudación.                      | NUMERA confirma efecto económico, saldo, obligación o control financiero aplicable; después se concilian fuentes.               | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   62 | `BCS-VPROC-0062` | `VPROC-0062` | `viso`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001` | `30 min` | `15 min` | `15 min` | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | Protección primero: mostrar control protector, dependencias críticas y bloqueo hasta evidencia suficiente.                   | VISO confirma el resultado del proceso y el expediente aplicable; después se verifican dependencias y pendientes transversales. | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   63 | `BCS-VPROC-0063` | `VPROC-0063` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | VISO confirma el resultado del proceso y el expediente aplicable; después se verifican dependencias y pendientes transversales. | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   64 | `BCS-VPROC-0064` | `VPROC-0064` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | VISO confirma el resultado del proceso y el expediente aplicable; después se verifican dependencias y pendientes transversales. | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   65 | `BCS-VPROC-0065` | `VPROC-0065` | `viso`      | `DIFERIBLE_CONTROLADA` | `CONT-OBJ-004` |   `72 h` |   `24 h` |   `24 h` | `DIFERIR_CON_TRAZABILIDAD`     | `PR-3_DIFERIBLE`  | Diferir con trazabilidad: conservar punto recuperable, propietario, backlog y condición de reanudación.                      | VISO confirma el resultado del proceso y el expediente aplicable; después se verifican dependencias y pendientes transversales. | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   66 | `BCS-VPROC-0066` | `VPROC-0066` | `viso`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001` | `30 min` | `15 min` | `15 min` | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | Protección primero: mostrar control protector, dependencias críticas y bloqueo hasta evidencia suficiente.                   | VISO confirma el resultado del proceso y el expediente aplicable; después se verifican dependencias y pendientes transversales. | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   67 | `BCS-VPROC-0067` | `VPROC-0067` | `nexo`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | NEXO confirma cantidades, ubicación, custodia o estado físico aplicable; después se concilian consumidores.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   68 | `BCS-VPROC-0068` | `VPROC-0068` | `pulso`     | `DIFERIBLE_CONTROLADA` | `CONT-OBJ-004` |   `72 h` |   `24 h` |   `24 h` | `DIFERIR_CON_TRAZABILIDAD`     | `PR-3_DIFERIBLE`  | Diferir con trazabilidad: conservar punto recuperable, propietario, backlog y condición de reanudación.                      | PULSO confirma pedido, venta, servicio o hecho comercial aplicable; después se concilian efectos derivados.                     | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |
|   69 | `BCS-VPROC-0069` | `VPROC-0069` | `numera`    | `ALTA_CONTROL`         | `CONT-OBJ-003` |   `24 h` |    `8 h` |    `4 h` | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | Recuperar control y evidencia: seguimiento por checkpoints, sin convertir salud técnica en resultado empresarial.            | NUMERA confirma efecto económico, saldo, obligación o control financiero aplicable; después se concilian fuentes.               | `ESPECIFICADO`; ejecución real `PENDIENTE_DE_EVIDENCIA` |


---

#### 35. Reconciliación cuantitativa

| Control                                    |   Resultado |
| ------------------------------------------ | ----------: |
| servicios evaluados                        | **69 / 69** |
| decisiones UX por servicio                 | **69 / 69** |
| servicios activos                          | **67 / 67** |
| AURA bloqueados                            |   **2 / 2** |
| `CRITICA_PROTECCION` / `CONT-OBJ-001`      |      **12** |
| `CRITICA_OPERACIONAL` / `CONT-OBJ-002`     |      **20** |
| `ALTA_CONTROL` / `CONT-OBJ-003`            |      **31** |
| `DIFERIBLE_CONTROLADA` / `CONT-OBJ-004`    |       **6** |
| clases recuperables representadas          | **15 / 15** |
| etapas del grafo común                     | **13 / 13** |
| buckets Storage representados              | **14 / 14** |
| Edge Functions representadas               | **24 / 24** |
| jobs `pg_cron` representados               |   **7 / 7** |
| repositorios VENTO representados           | **12 / 12** |
| sustitutos concretos acreditados heredados |       **0** |
| restores ejecutados por esta tarea         |       **0** |
| failovers ejecutados por esta tarea        |       **0** |
| failbacks ejecutados por esta tarea        |       **0** |
| cambios físicos                            |       **0** |
| cambios TREQ                               |       **0** |

---

#### 36. Escenarios deterministas de experiencia

|    # | Escenario                                                                   | Comportamiento exigido                                                                                    |
| ---: | --------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
|    1 | último job terminó pero no existe restore demostrado                        | mostrar job como señal y cobertura como pendiente de evidencia; no mostrar “backup recuperable”           |
|    2 | el último punto verificable supera RPO                                      | mostrar edad, exceso, servicios afectados, propietario y siguiente acción; no ocultar con un job reciente |
|    3 | existe punto reciente pero sospecha de corrupción                           | degradar su elegibilidad y mostrar candidatos/razón; no elegirlo solo por fecha                           |
|    4 | punto anterior íntegro implica pérdida potencial                            | mostrar ventana de pérdida y hechos posteriores que deberán conciliarse                                   |
|    5 | restore comienza en ambiente aislado                                        | mantener banda de aislamiento y efectos externos bloqueados por defecto                                   |
|    6 | restore termina sin errores técnicos                                        | pasar a validación técnica; no marcar MBCO ni recuperación empresarial                                    |
|    7 | validación técnica falla en RLS/RPC o integridad                            | mantener bloqueo de promoción y conservar evidencia del intento                                           |
|    8 | validación técnica aprueba pero proceso falla                               | mostrar “técnicamente disponible / funcionalmente no validado” y propietario del proceso                  |
|    9 | varios procesos comparten dependencia                                       | recuperar la dependencia según grafo antes de consumidores aunque su prioridad nominal sea menor          |
|   10 | una rama está bloqueada y otra es independiente                             | permitir progreso de la rama elegible sin declarar el caso completo                                       |
|   11 | se propone failover sin alternativa acreditada                              | mostrar capacidad no disponible y condición de acreditación; no ofrecer conmutación operativa             |
|   12 | futura alternativa acreditada se activa                                     | mostrar fuente activa única, autoridad, checkpoint, split-brain guard y validaciones                      |
|   13 | primario vuelve a responder después de failover                             | mantener la fuente activa vigente; exigir decisión de failback/retorno                                    |
|   14 | aparece delta entre primaria y alternativa                                  | bloquear retorno automático y mostrar conciliación/reintegración requerida                                |
|   15 | restore recupera un punto anterior a trabajo offline                        | enlazar `CONT-UX-004`; comparar unidades locales antes de cualquier replay                                |
|   16 | una operación contingente tiene `RESULT_UNKNOWN`                            | conservar verificación de receipt/recurso antes de repetir la intención                                   |
|   17 | efecto fuente confirmado y consumidor pendiente                             | mantener verdadero el hecho fuente y mostrar divergencia downstream                                       |
|   18 | falta llave o credencial de recuperación                                    | mostrar bloqueo, autoridad y propietario sin revelar el valor sensible                                    |
|   19 | un bucket tiene cero objetos                                                | seguir mostrando configuración/permisos como parte del restore requerido                                  |
|   20 | código existe en remoto pero no hay reconstrucción independiente demostrada | mostrar historial disponible y evidencia de rebuild pendiente                                             |
|   21 | restore técnico alcanza MBCO de algunos procesos                            | marcar validaciones por proceso; no convertir el porcentaje en recuperación total                         |
|   22 | quedan conflictos o resultados desconocidos                                 | mantenerlos visibles como bloqueos de normalización/cierre aplicable                                      |
|   23 | se revoca un acceso temporal después del trabajo                            | reflejar revocación sin confundirla con cierre del incidente                                              |
|   24 | servicio AURA diferido aparece en el alcance                                | mostrar identidad, objetivo y bloqueo; no mostrar operación de recuperación inexistente                   |

---

#### 37. Cobertura vigente de prueba

La conducta materializada por esta tarea ya está protegida por cobertura canónica existente que exige, entre otros resultados verificables:

- observar salud de respaldo con último punto real, edad frente a RPO, cadena, integridad, capacidad, inmutabilidad, expiración, llaves, restore fallido y evidencia de ejercicio;
- seleccionar un punto por integridad, compatibilidad, consistencia, llaves y hechos posteriores;
- usar ambiente aislado y bloquear efectos productivos antes de promoción;
- validar esquema, migraciones, contratos, RLS, RPC, Storage, colas, capacidad y aislamiento;
- declarar grafo, checkpoints, dependencias, responsables y criterio de avance;
- validar MBCO por propietaria y conciliar backlog, duplicados y faltantes;
- gobernar failover, fuente activa, prevención de split-brain, reintegración, failback y retorno;
- preservar consistencia en restore granular;
- ejecutar posteriormente ejercicios de restore, fallos, proveedor, ransomware, offline, conciliación y retorno según riesgo.

La tarea especializa la experiencia humana y materializa decisiones de visualización/seguimiento; no introduce un comportamiento ejecutable distinto de esas reglas ya protegidas.

---

#### 38. Brechas de implementación y condiciones de salida

| Brecha                                                          | Estado                   | Propietario documental                                        | Condición de salida                                                                        |
| --------------------------------------------------------------- | ------------------------ | ------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| telemetría real de jobs, puntos, manifiestos, edad e integridad | `PENDIENTE_DE_EVIDENCIA` | `CONT-INT-001`, observabilidad y paquetes propietarios        | fuente implementada que distinga job de punto recuperable y produzca evidencia trazable    |
| configuración real de managed backup/PITR                       | `PENDIENTE_DE_EVIDENCIA` | arquitectura Supabase aplicable y `CONT-DOM-011`              | configuración y alcance verificables con punto y restore demostrado                        |
| restore aislado de PostgreSQL                                   | `PENDIENTE_DE_EVIDENCIA` | `CONT-DOM-012`, `CONT-DOM-014` y paquete técnico              | restore controlado con integridad, compatibilidad, tiempo y evidencia                      |
| restore de los 14 buckets                                       | `PENDIENTE_DE_EVIDENCIA` | `CONT-DOM-012`, arquitectura Storage y `CONT-DOM-014`         | contenido, metadatos, permisos y vínculos restaurados y comprobados                        |
| rebuild de las 24 Edge Functions                                | `PENDIENTE_DE_EVIDENCIA` | paquetes técnicos propietarios y `CONT-DOM-014`               | build/despliegue aislado compatible con efectos externos controlados                       |
| reconstrucción segura de siete jobs cron                        | `PENDIENTE_DE_EVIDENCIA` | bloque tecnológico, `CONT-AUTH-003` y `CONT-DOM-014`          | definición reconstruida, secretos separados y activación controlada probada                |
| recuperación de secretos/llaves                                 | `PENDIENTE_DE_EVIDENCIA` | `CONT-AUTH-002`, `CONT-AUTH-003`                              | mecanismo autorizado y prueba controlada de disponibilidad/uso                             |
| copia o rebuild independiente de doce repositorios              | `PENDIENTE_DE_EVIDENCIA` | paquetes de build/release y `TI-DOM-011`                      | reconstrucción limpia o copia separada demostrada frente a pérdida del remoto primario     |
| alternativa real de failover                                    | `PENDIENTE_DE_EVIDENCIA` | `CONT-DOM-013`, `CONT-INT-003`                                | recurso/proveedor/capacidad alterna acreditada con límites, autoridad, prueba y retorno    |
| separación real de dominio de falla                             | `PENDIENTE_DE_EVIDENCIA` | `CONT-DOM-011`, `CONT-INT-003`                                | independencia suficiente demostrada por escenario                                          |
| enforcement de permisos de restore/failover/validación          | `PENDIENTE_DE_EVIDENCIA` | `CONT-AUTH-002` a `CONT-AUTH-004`                             | autorización de servidor y segregación implementadas y probadas                            |
| persistencia física de seguimiento y evidencia                  | `PENDIENTE_DE_EVIDENCIA` | `CONT-INT-004`, evidencia transversal y paquetes propietarios | contratos implementados para correlacionar caso, punto, restore, validaciones y pendientes |
| tiempos reales frente a RTO/RPO/MTPD                            | `PENDIENTE_DE_EVIDENCIA` | `CONT-DOM-004`, `CONT-DOM-014`                                | ejercicio reproducible con hitos y duraciones medidos                                      |
| vigencia de restores y failover ejercitados                     | `PENDIENTE_DE_EVIDENCIA` | `CONT-DOM-014`, `CONT-UX-007`                                 | programa de ejercicios con evidencia, cadencia y acciones resultantes                      |
| comunicaciones de recovery y escalamiento                       | `PENDIENTE_DE_EVIDENCIA` | `CONT-UX-006`                                                 | plantillas/canales/confirmación/escalamiento materializados sin duplicar esta superficie   |

No queda una brecha identificada por esta tarea sin propietario y condición de salida.

---

#### 39. Handoffs obligatorios

| Resultado posterior                                   | Tarea propietaria                                 | Frontera conservada                                                             |
| ----------------------------------------------------- | ------------------------------------------------- | ------------------------------------------------------------------------------- |
| comunicaciones internas/externas durante recuperación | `CONT-UX-006`                                     | esta tarea muestra estado y decisión; no define plantillas ni canales de crisis |
| ejercicios, revisión y readiness                      | `CONT-DOM-014`, `CONT-UX-007`                     | esta tarea muestra evidencia y vigencia; no certifica un ejercicio no ejecutado |
| restore/failover/failback físico                      | `CONT-DOM-012` y paquetes técnicos                | esta tarea representa progreso y evidencia; no ejecuta la acción                |
| alternativas reales                                   | `CONT-DOM-013`, `CONT-INT-003`                    | la interfaz no acredita una alternativa por existir una candidata               |
| autoridad y break-glass                               | `CONT-AUTH-002` a `CONT-AUTH-004`                 | mostrar una acción no concede permiso ni sustituye segregación                  |
| captura/reincorporación posterior al punto            | `CONT-UX-004`, `CONT-INT-004`                     | restore no hace replay ciego ni concilia por sí solo                            |
| persistencia de evidencia                             | arquitectura de evidencia y paquetes consumidores | la vista referencia evidencia; no inventa almacenamiento transversal            |
| certificación integral                                | `CONT-DOM-014`, BLOQUE U y readiness aplicable    | un estado documental no demuestra operación real                                |

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa la experiencia de seguimiento sobre conductas ya protegidas para salud de respaldos, puntos recuperables, restore aislado, compatibilidad, dependencias, validación técnica, validación empresarial, failover/failback, conciliación y ejercicios. No crea un nuevo efecto empresarial, cálculo, permiso, transición ejecutable o contrato de integración que requiera un identificador adicional.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 40. Criterios de aceptación

1. La tarea conserva `CONT-UX-004` como anterior aprobada y reserva únicamente `CONT-UX-006` como siguiente.
2. La tarea permanece exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`.
3. No se ejecuta restore real, PITR, failover, failback, promoción ni retorno productivo.
4. No se modifica código, DDL, DML, migraciones, RLS, RPC, Storage, Edge Functions, jobs, datos, secretos o configuración desplegada.
5. La superficie distingue preparación/readiness de recuperación activa.
6. La superficie no transforma una copia existente en respaldo recuperable sin evidencia.
7. Un job completado no se presenta como punto recuperable verificado.
8. Una réplica no se presenta como backup aislado.
9. Un snapshot no se presenta como restore demostrado.
10. Una versión de código no se presenta como copia independiente por sí sola.
11. Un restore ejecutado no se presenta como restore validado.
12. Una validación técnica no se presenta como MBCO validado.
13. Un MBCO validado no se presenta como conciliación completa.
14. Una conciliación completa no se presenta automáticamente como recuperación total o cierre.
15. Failover y restore permanecen decisiones distintas.
16. Failover y failback permanecen decisiones distintas.
17. El primario no vuelve a ser fuente activa solo porque responda.
18. La interfaz conserva una sola fuente activa cuando exista conmutación.
19. La interfaz muestra prevención de split-brain como condición explícita.
20. La línea base conserva cero sustitutos concretos acreditados.
21. La ausencia de alternativa acreditada impide mostrar failover como capacidad operativa disponible.
22. Una candidata de failover muestra condición de acreditación antes de cualquier acción.
23. El encabezado persistente muestra incidente, alcance, objetivo, punto, fuente activa, fase, validaciones y pendientes.
24. Un dato desconocido permanece desconocido; no se completa por inferencia.
25. La vista de cobertura identifica el objeto o grupo recuperable y su fuente autoritativa.
26. La vista de cobertura muestra servicios y procesos dependientes.
27. La vista de cobertura muestra el RPO aplicable.
28. La vista distingue último job de último punto recuperable verificado.
29. La edad frente a RPO se calcula conceptualmente sobre el último punto verificable y no sobre el inicio de un job.
30. La interfaz muestra integridad/manifiesto por punto cuando exista evidencia.
31. La interfaz muestra evidencia de restore por objeto o grupo.
32. La interfaz muestra dominio de falla y su evidencia sin asumir independencia.
33. La interfaz muestra retención y hold sin inventar plazos no aprobados.
34. La interfaz muestra disponibilidad autorizada de llave/material sin revelar secretos.
35. Una copia sospechosa no aparece como elegible por ser la más reciente.
36. La selección de punto considera integridad, contaminación, compatibilidad, consistencia, llaves y hechos posteriores.
37. La selección de punto muestra la ventana potencial de pérdida.
38. La selección de punto muestra trabajo manual/offline posterior relevante.
39. La selección de punto conserva razón de aceptación o descarte.
40. RPO no se presenta como frecuencia nominal de un job.
41. RTO se mide hasta MBCO verificado y no hasta disponibilidad técnica simple.
42. MTPD no se presenta como permiso para operar inseguro.
43. WRT permanece sin valor numérico inventado.
44. Cuando exista medición confiable, elapsed y restante distinguen la métrica exacta.
45. La incertidumbre del reloj o del inicio se conserva explícitamente.
46. El restore mantiene separadas preparación, restauración, validación técnica, validación funcional, reincorporación y retorno.
47. El ambiente de recuperación aislado se identifica de forma persistente.
48. La supresión de pagos, webhooks, mensajes, impresión, movimientos, jobs y sincronización se verifica por efecto aplicable.
49. La ausencia de evidencia de aislamiento bloquea la promoción.
50. Un intento de restore fallido permanece en la cronología.
51. Las trece etapas del grafo común están representadas exactamente una vez.
52. El orden base del grafo no se interpreta como FIFO universal.
53. Una rama independiente puede avanzar si sus prerrequisitos están satisfechos.
54. Una dependencia de menor prioridad puede recuperarse antes si habilita un servicio más crítico.
55. Cada checkpoint identifica prerrequisitos, ejecutor, validador, criterio de avance, evidencia y bloqueo.
56. La prioridad no permite saltar una dependencia.
57. La validación técnica cubre integridad, lectura, constraints, secuencias, índices y referencias aplicables.
58. La validación técnica cubre esquema, migraciones, RLS, grants, RPC, funciones y triggers aplicables.
59. La validación técnica cubre Storage, colas, observabilidad, capacidad, identidad y aislamiento aplicables.
60. Una validación técnica verde no se propaga automáticamente a todos los procesos.
61. La validación funcional pertenece a la propietaria del proceso.
62. La validación funcional comprueba el MBCO aplicable.
63. La validación funcional considera obligaciones, estados, saldos, cantidades, documentos y evidencia según el proceso.
64. La validación funcional considera hechos manuales/offline posteriores al punto.
65. La validación funcional conserva duplicados, faltantes, conflictos y resultados desconocidos como condiciones separadas.
66. La validación funcional identifica backlog y propietario.
67. El ejecutor técnico no se convierte en validador empresarial por ejecutar el restore.
68. El proveedor no se convierte en validador empresarial por restaurar su servicio.
69. La interfaz distingue autorización de failover de ejecución técnica del failover.
70. La interfaz distingue autorización de failback de ejecución técnica del retorno.
71. La fuente activa después de una conmutación queda visible.
72. La interfaz muestra delta y trabajo posterior antes de un retorno.
73. El retorno exige validación relevante después de la reintegración.
74. La bandeja de pendientes conserva punto no demostrado, restore pendiente/fallido y controles técnicos abiertos.
75. La bandeja conserva validación funcional faltante y dependencias bloqueadas.
76. La bandeja conserva acceso/llave no disponible y alternativa no acreditada.
77. `RESULT_UNKNOWN` permanece visible hasta resolución o disposición válida.
78. `CONFLICT` permanece visible hasta resolución o disposición válida.
79. `QUARANTINED` permanece visible hasta resolución o disposición válida.
80. `RECONCILIATION_REQUIRED` permanece visible hasta resolución o disposición válida.
81. La evidencia obligatoria no enlazada permanece visible.
82. Un efecto downstream pendiente permanece visible aunque el hecho fuente esté confirmado.
83. Una operación expirada sin disposición permanece visible.
84. El trabajo contingente sin destino permanece visible.
85. Un pendiente sin propietario se trata como bloqueo y no se oculta en un agregado.
86. La revocación de acceso temporal pendiente permanece visible antes de normalización cuando aplique.
87. Cada pendiente tiene origen, impacto, propietario, condición de salida, evidencia necesaria y siguiente acción segura.
88. La integración con `CONT-UX-004` compara trabajo contingente contra el punto restaurado antes de replay.
89. El trabajo local no se convierte en fuente autoritativa por haberse perdido estado del backend.
90. Una intención con resultado desconocido verifica receipts y recurso antes de repetirse.
91. Una misma intención no obtiene una nueva identidad para eludir idempotencia.
92. Los hechos posteriores al punto no se sobrescriben silenciosamente.
93. La cronología distingue punto creado y punto verificado.
94. La cronología distingue restore iniciado y restore terminado técnicamente.
95. La cronología distingue validación técnica de validación funcional.
96. La cronología distingue failover/failback de reincorporación y conciliación.
97. La cronología conserva revocación de accesos temporales cuando aplique.
98. Cada evento conserva actor/servicio, función, hora, recurso, versión, razón y evidencia aplicables.
99. La interfaz conserva la segregación entre ejecutar, validar técnicamente, validar funcionalmente, reincorporar, conciliar y aprobar.
100. Una persona que ejerce varias funciones no hace que esas funciones se fusionen.
101. La concentración de funciones críticas no produce autoaprobación.
102. La superficie puede bloquear una acción por falta de autoridad sin fabricar el allow empresarial.
103. Los estados críticos no dependen únicamente de color.
104. Un porcentaje de progreso no oculta una rama bloqueada.
105. Los agregados permiten abrir las identidades que los componen.
106. La pantalla táctil conserva la acción principal y usa detalle progresivo.
107. La vista ejecutiva no expone secretos, payloads o material sensible innecesario.
108. La vista técnica no revela valores de vault, tokens o credenciales completas.
109. La interfaz representa exactamente las quince clases recuperables heredadas.
110. Ninguna clase recuperable se elimina por falta de evidencia física actual.
111. La interfaz representa exactamente los catorce buckets Storage heredados.
112. Un bucket vacío conserva seguimiento de configuración y permisos.
113. La bandera pública/privada de Storage no se presenta como clasificación empresarial.
114. La interfaz representa exactamente las veinticuatro Edge Functions heredadas.
115. Una Edge Function activa no se presenta como reconstruible sin evidencia de rebuild.
116. La interfaz representa exactamente los siete jobs `pg_cron` heredados.
117. La interfaz no reproduce material sensible de configuración cron.
118. La interfaz representa exactamente los doce repositorios VENTO heredados.
119. `vento-shell` se conserva como fuente versionada obligatoria de cambios Supabase pertenecientes a VENTO.
120. Un remoto Git no se presenta como copia independiente por sí solo.
121. La matriz conserva exactamente 69 `BCS-VPROC-*` y 69 `VPROC-*`.
122. No existen identificadores de servicio o proceso duplicados en la matriz.
123. La distribución BIA permanece 12/20/31/6.
124. La distribución de propietarias permanece 1/20/16/6/4/12/7/2/1 para ANIMA/VISO/NEXO/FOGO/ORIGO/PULSO/NUMERA/AURA/PASS.
125. Cada servicio conserva su `CONT-OBJ`, MTPD, RTO, RPO, MBCO y prioridad heredados.
126. Los 67 servicios activos reciben una decisión UX de seguimiento.
127. Los dos servicios AURA conservan `BLOQUEADO_POR_APLICACION_DIFERIDA`.
128. AURA no adquiere restore, failover o validación operativa por aparecer en la matriz.
129. Cada servicio identifica a su propietaria como validadora funcional del hecho de su proceso.
130. PULSO confirma el hecho comercial antes de presentar como conciliados efectos NEXO, PASS o NUMERA aplicables.
131. ORIGO confirma compra/recepción antes de presentar como conciliados efectos NEXO y NUMERA aplicables.
132. FOGO confirma lote/resultado productivo antes de presentar como conciliados efectos NEXO y NUMERA aplicables.
133. El fallo de una consumidora no convierte en no ocurrido un hecho propietario ya confirmado.
134. Una alerta por job omitido identifica objeto/cadena y propietario.
135. Una alerta por RPO excedido muestra último punto verificable y exceso.
136. Una alerta por integridad fallida bloquea la promoción del punto afectado.
137. Una alerta por llave inaccesible no revela el secreto.
138. Una alerta por restore fallido muestra etapa, evidencia y siguiente decisión.
139. Una alerta por ejercicio vencido remite al propietario de ejercicios/readiness.
140. Una alerta de split-brain bloquea escrituras incompatibles según el contrato futuro.
141. Una alerta por validación funcional faltante identifica el proceso y su propietaria.
142. Una alerta por pendiente sin propietario no se agrupa como ruido informativo.
143. La tarea no declara que managed backup o PITR estén habilitados o deshabilitados sin evidencia propietaria.
144. La tarea no declara un punto recuperable actual sin evidencia de restore suficiente.
145. La tarea no declara RTO, RPO, WRT o MTPD cumplidos por diseño documental.
146. La tarea no declara un runbook probado por existir especificado.
147. La tarea no declara una alternativa acreditada por existir un segundo proveedor/recurso nominal.
148. La tarea no declara readiness operativo.
149. La tarea no crea una segunda fuente de verdad de continuidad.
150. La tarea no crea un catálogo paralelo de permisos, roles o estados persistentes.
151. La tarea no crea datos reales de prueba ni ejecuta operaciones productivas.
152. Toda brecha de implementación queda asociada con propietario y condición de salida.
153. La cobertura de prueba existente se reutiliza sin duplicar requisitos.
154. La ausencia de cambios de requisitos evita generar una copia innecesaria del registro canónico.
155. La siguiente tarea permanece exclusivamente reservada.


---

#### 41. Balance de cierre

| Control                           |   Resultado |
| --------------------------------- | ----------: |
| contextos de experiencia          |   **2 / 2** |
| vistas principales materializadas |   **5 / 5** |
| etapas de recuperación            | **13 / 13** |
| clases recuperables               | **15 / 15** |
| buckets Storage                   | **14 / 14** |
| Edge Functions                    | **24 / 24** |
| jobs `pg_cron`                    |   **7 / 7** |
| repositorios VENTO                | **12 / 12** |
| servicios BIA                     | **69 / 69** |
| servicios activos especificados   | **67 / 67** |
| AURA bloqueados                   |   **2 / 2** |
| escenarios deterministas          | **24 / 24** |
| sustitutos concretos acreditados  |       **0** |
| acciones físicas ejecutadas       |       **0** |
| cambios Supabase                  |       **0** |
| cambios TREQ                      |       **0** |

---

#### 42. Límites de la tarea

Esta tarea no:

- configura, activa ni modifica backups;
- activa o configura PITR;
- crea snapshots, copias o exportaciones;
- ejecuta restore de PostgreSQL, Storage, Auth, repositorios, Edge Functions, jobs o dispositivos;
- crea un ambiente de recuperación;
- ejecuta failover o failback;
- crea una réplica, segunda región, segundo proveedor, enlace o sitio alterno;
- rota, revela o recupera secretos reales;
- promueve datos restaurados;
- reanuda pagos, webhooks, mensajes, impresiones, jobs o movimientos reales;
- ejecuta replay, sincronización, compensación o conciliación productiva;
- declara un punto actual como recuperable sin evidencia;
- declara RPO, RTO, MTPD, WRT o MBCO cumplidos;
- declara un runbook probado;
- declara readiness operativo;
- modifica autorización, roles, RLS o permisos;
- modifica código, DDL, DML, migraciones, RPC, Edge Functions, Storage, datos o configuración Supabase;
- modifica el registro canónico de requisitos;
- inicia `CONT-UX-006`;
- inicia `CONT-UX-007`.

---

#### 43. Continuidad

ÚLTIMA TAREA APROBADA
`CONT-UX-004 — Diseñar captura controlada durante la falla y reincorporación posterior`

TAREA ACTUAL APROBADA
`CONT-UX-005 — Diseñar seguimiento de respaldos, restauración, failover, validación y pendientes`

SIGUIENTE TAREA RESERVADA
`CONT-UX-006 — Diseñar comunicaciones internas y externas con plantillas, canales, confirmación y escalamiento`


### ✅ CONT-UX-006 — Diseñar comunicaciones internas y externas con plantillas, canales, confirmación y escalamiento

**Estado:** APROBADA
**Tarea anterior:** `CONT-UX-005 — Diseñar seguimiento de respaldos, restauración, failover, validación y pendientes` — APROBADA
**Tarea siguiente:** `CONT-UX-007 — Diseñar ejercicios, revisión posterior, acciones y comprobación de readiness` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de experiencia para preparar, revisar, aprobar, emitir, seguir, corregir y escalar comunicaciones internas y externas de continuidad mediante plantillas, canales, confirmación y trazabilidad, sin ejecutar comunicaciones reales ni crear una segunda fuente de verdad
**Bloque:** AC — Continuidad operativa y recuperación
**Repositorio propietario:** `vento-shell`
**Fase:** exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`
**Implementación técnica u operativa:** no autorizada
**Clases de comunicación materializadas:** 7 / 7
**Plantillas base materializadas:** 7 / 7
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Diseñar la experiencia completa mediante la cual Vento OS permite coordinar comunicaciones de continuidad sin convertir velocidad, canal disponible, receipt técnico, apertura de mensaje o presión del incidente en autorización, lectura, compromiso empresarial o recuperación confirmada.

La experiencia deberá responder de forma determinista:

```text
¿QUE CLASE DE COMUNICACION SE NECESITA?
¿QUE AUDIENCIA DEBE RECIBIRLA?
¿QUE HECHOS ESTAN CONFIRMADOS?
¿QUE SIGUE SIENDO INCIERTO?
¿QUE NO DEBE DIVULGARSE A ESA AUDIENCIA?
¿QUIEN PUEDE PREPARAR EL MENSAJE?
¿QUIEN DEBE VALIDAR O APROBAR SU CONTENIDO?
¿QUE CANAL ES ELEGIBLE Y ESTA AUTORIZADO?
¿EXISTE UN CANAL ALTERNO REALMENTE ACREDITADO?
¿EL TRANSPORTE ACEPTO EL ENVIO?
¿EL DESTINATARIO LO LEYO?
¿SE REQUIERE ACUSE EXPLICITO?
¿SE REQUIERE UNA ACCION EMPRESARIAL POSTERIOR?
¿CUANDO DEBE ACTUALIZARSE EL MENSAJE?
¿QUE CONDICION ACTIVA ESCALAMIENTO?
¿COMO SE CORRIGE UN MENSAJE SIN BORRAR HISTORIA?
```

La frontera principal es obligatoria:

```text
MENSAJE PREPARADO
!= MENSAJE APROBADO
!= MENSAJE EMITIDO
!= ENTREGA TECNICA
!= LECTURA
!= ACUSE
!= EFECTO EMPRESARIAL
!= RECUPERACION
!= CIERRE
```

---

#### 2. Resultado sustantivo

Quedan materializados los siguientes resultados documentales:

1. una arquitectura UX común para preparación/readiness, incidente activo e historial de comunicaciones;
2. una experiencia de composición que parte del incidente, clase, audiencia, hechos y autoridad antes de elegir canal;
3. reutilización exacta de las siete clases canónicas de comunicación: técnica, operativa interna, ejecutiva, laboral, cliente, proveedor y autoridad / tercero regulado;
4. siete plantillas base materializadas, una por clase, con lenguaje y campos adecuados a su audiencia;
5. un contrato común de quince campos mínimos para toda comunicación material;
6. una separación explícita entre hechos confirmados, incertidumbres, hipótesis, estimaciones y compromisos;
7. una regla por la cual una ETA técnica no se convierte automáticamente en compromiso empresarial;
8. una experiencia de revisión que muestra qué contenido está confirmado, qué requiere aprobación y qué no puede divulgarse;
9. una experiencia de previsualización por audiencia y por canal antes de emitir;
10. una decisión de canales por clase que consume los contratos transversales vigentes y no inventa endpoints, teléfonos, correos, proveedores o cuentas;
11. una regla que impide tratar un canal observado en AS-IS como canal oficial de continuidad sin acreditación y autoridad;
12. una regla que impide usar AURA como canal operativo oficial mientras su capacidad permanezca diferida;
13. una experiencia de emisión que conserva versión, emisor funcional, audiencia, canal, timestamp y evidencia disponible;
14. reutilización de los estados canónicos de entrega `DELIVERY_*` sin crear un estado paralelo de mensajería;
15. separación visual de `TRANSPORT_ACCEPTED`, `PRESENTED`, `READ`, `ACKNOWLEDGED`, `PROCESS_EFFECT` y `ESCALATED`;
16. una experiencia de confirmación por destinatario que nunca propaga la lectura o acuse de una persona a otra;
17. una regla por la cual un `2xx`, receipt de proveedor, push aceptado, correo aceptado o socket activo no demuestra lectura humana;
18. una regla por la cual `READ` no equivale a aceptación contractual, ejecución de una orden ni cierre de un proceso;
19. una regla por la cual `ACKNOWLEDGED` confirma conocimiento, pero no concede autoridad ni sustituye el efecto empresarial requerido;
20. una experiencia de escalamiento que distingue falla de canal, falta de lectura, falta de acuse y falta de acción empresarial;
21. una regla que evita broadcast como respuesta a un destinatario no resoluble o un canal bloqueado;
22. una regla que exige reconciliar `DELIVERY_UNKNOWN` antes de duplicar un envío cuando el canal pudo haber aceptado la operación;
23. una experiencia de canal alterno únicamente cuando exista referencia autorizada y capacidad acreditada;
24. una ruta de escalamiento por responsabilidad y no por expansión indiscriminada de audiencia;
25. una experiencia específica para proveedor que conserva propietario interno y no permite al tercero aprobar el estado de continuidad de Vento;
26. una experiencia específica para autoridad o tercero regulado que exige función competente, obligación aplicable y canal formal resoluble;
27. una experiencia específica para cliente que impide promesas de disponibilidad, causa o tiempo no confirmadas;
28. una experiencia específica laboral que minimiza información y conserva autoridad laboral, privacidad y seguridad;
29. una experiencia ejecutiva que separa información, decisión solicitada y aprobación efectiva;
30. una experiencia técnica que permite detalle suficiente para coordinación sin exponer secretos ni convertir diagnóstico en decisión empresarial;
31. una experiencia operativa interna que muestra qué cambia, qué continúa, qué se detiene y qué acción concreta corresponde;
32. un modelo de actualización que no inventa frecuencia universal y obliga a cada mensaje de seguimiento a declarar próximo momento o condición de actualización;
33. un modelo de corrección que crea una nueva versión relacionada con la anterior sin borrar el mensaje emitido;
34. un modelo de consistencia multiaudiencia que parte de un conjunto común de hechos confirmados y genera proyecciones adecuadas sin contradicciones materiales;
35. un centro de seguimiento que separa mensajes por emitir, enviados, entrega incierta, confirmación pendiente, escalados, corregidos y cerrados sin convertir esas vistas en nuevos estados de dominio;
36. tratamiento explícito de privacidad, contenido sensible, contactos y previsualizaciones conforme a autorización y finalidad;
37. tratamiento explícito de degradación de canales, fallos, reintentos y resultados inciertos reutilizando el contrato transversal de notificaciones;
38. escenarios deterministas de comunicación inicial, actualización, acción requerida, corrección, canal bloqueado, falta de confirmación y coordinación externa;
39. handoffs explícitos hacia implementación de notificaciones, autorización, evidencia, gobierno de información, integración externa y ejercicios;
40. cero comunicaciones reales, cero cambios de configuración, cero cambios Supabase y cero cambios de requisitos de prueba.

---

#### 3. Entradas canónicas consumidas

Esta tarea consume y conserva, sin redefinirlas:

- `VPROC-0062`, como proceso transversal propietario del expediente de continuidad;
- `CONT-DOM-005`, para estados del incidente, severidad, alcance, activación, escalamiento, desactivación y cierre;
- `CONT-DOM-006`, para mando, sustitución, bitácora, siete clases de comunicación, quince campos mínimos, comunicación de crisis y coordinación externa;
- `CONT-DOM-007` a `CONT-DOM-010`, para operación mínima, contingencia, captura, pendientes, reincorporación y conciliación que pueden requerir comunicación;
- `CONT-DOM-011` a `CONT-DOM-013`, para respaldo, recuperación y proveedores sin convertir estado técnico o externo en estado empresarial;
- `CONT-DOM-014` y `CONT-DOM-015`, para ejercicios, revisión posterior y mantenimiento de contactos/runbooks sin adelantar su experiencia;
- `CONT-AUTH-001`, para separar preparación, aprobación, emisión y autoridad de comunicación;
- `CONT-AUTH-003`, para minimización, contactos protegidos, evidencia y datos sensibles de contingencia;
- `CONT-AUTH-004`, para separar ejecución, validación, recuperación total, cierre y revisión posterior;
- `CONT-UX-001`, para estado ejecutivo, impacto, prioridades, responsables y decisiones;
- `CONT-UX-002`, para centro de mando, línea de tiempo y referencia de comunicaciones;
- `CONT-UX-003`, para runbooks y handoffs operativos;
- `CONT-UX-004`, para trabajo contingente, resultados inciertos y reincorporación;
- `CONT-UX-005`, para recuperación, validación y pendientes que pueden originar mensajes técnicos, operativos o ejecutivos;
- `NOTIFY-ARC-001` a `NOTIFY-ARC-010`, para inventario de canales, evento originador, destinatarios, prioridad, vigencia, deduplicación, canales, preferencias, lectura, confirmación, escalamiento, fallos, contingencia, privacidad, métricas y auditoría de entrega;
- los requisitos vigentes de continuidad y experiencia que ya protegen comunicación, autorización, estados, errores, privacidad, contingencia y escalamiento.

La tarea no modifica identidades, severidades, BIA, MTPD, RTO, RPO, MBCO, prioridades, responsabilidades, autorizaciones, políticas de notificación, canales físicos, proveedores, contactos ni estados de readiness.

---

#### 4. Fronteras obligatorias

La experiencia conserva como invariantes:

```text
CLASE DE COMUNICACION != CANAL
CANAL != AUDIENCIA
AUDIENCIA != AUTORIDAD
PREPARAR != APROBAR
APROBAR != EMITIR
EMITIR != ENTREGA TECNICA
ENTREGA TECNICA != LECTURA
LECTURA != ACUSE
ACUSE != EFECTO EMPRESARIAL
ESCALAMIENTO != BROADCAST
CORRECCION != BORRADO
ETA TECNICA != COMPROMISO EMPRESARIAL
ESTADO DE PROVEEDOR != ESTADO DEL PROCESO VENTO
MENSAJE DE CIERRE != CIERRE DEL INCIDENTE
```

Ningún color, badge, receipt o canal alterno puede eliminar estas diferencias.

---

#### 5. Arquitectura de experiencia

La experiencia se divide en tres contextos complementarios:

| Contexto                | Objetivo                                                                                      | Puede mostrar                                                                            | No puede afirmar                                                 |
| ----------------------- | --------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| preparación y readiness | comprobar que clases, plantillas, canales, contactos y aprobaciones son resolubles            | vigencia documental, referencias de canal, reglas de aprobación y brechas                | que un canal funcionará durante una crisis sin evidencia vigente |
| incidente activo        | preparar, aprobar, emitir, seguir, corregir y escalar mensajes de un caso real                | hechos del incidente, audiencia, versión, entrega, lectura, acuse, acción y escalamiento | recuperación, cierre o atención empresarial por el solo envío    |
| historial               | reconstruir qué se comunicó, a quién, cuándo, por qué, mediante qué canal y con qué resultado | versiones, correcciones, evidencia y relaciones                                          | que una versión antigua continúa vigente                         |

Las tres vistas consumen las mismas fuentes propietarias; no crean una biblioteca paralela de incidentes, contactos o mensajes empresariales.

---

#### 6. Mapa de navegación

```text
CONTINUIDAD
└─ Comunicaciones
   ├─ Necesidades de comunicación
   ├─ Preparar mensaje
   │  ├─ Clase y audiencia
   │  ├─ Hechos e incertidumbres
   │  ├─ Plantilla
   │  ├─ Canal
   │  ├─ Aprobación
   │  └─ Previsualización
   ├─ Seguimiento
   │  ├─ Entrega
   │  ├─ Lectura / acuse
   │  ├─ Acción empresarial
   │  └─ Escalamiento
   ├─ Correcciones y actualizaciones
   └─ Historial y evidencia
```

Poder abrir una comunicación no concede lectura sobre su contenido sensible ni capacidad para emitirla.

---

#### 7. Encabezado persistente de comunicación

Durante un incidente activo, la superficie conserva un encabezado mínimo con:

```text
incidente
estado y severidad vigentes
alcance
clase de comunicacion
audiencia
version del mensaje
estado de aprobacion aplicable
canal seleccionado
estado de entrega
confirmacion requerida
proxima actualizacion o condicion
funcion efectiva del actor
ultima modificacion
```

Si uno de estos valores es desconocido cuando resulta necesario para emitir, la experiencia muestra el bloqueo; no completa el dato por inferencia.

---

#### 8. Contrato común de quince campos

Toda comunicación material debe poder presentar y conservar los quince campos heredados:

|    # | Campo                                               | Tratamiento UX                                                |
| ---: | --------------------------------------------------- | ------------------------------------------------------------- |
|    1 | referencia al incidente                             | vínculo visible con el expediente correcto                    |
|    2 | clase de comunicación                               | una de las siete clases canónicas                             |
|    3 | severidad y alcance vigentes                        | se muestran como contexto, no como permiso                    |
|    4 | audiencia exacta                                    | población o destinatarios resolubles sin expansión automática |
|    5 | emisor funcional autorizado                         | función que emite, separada de la identidad técnica del canal |
|    6 | aprobador o verificador requerido                   | visible solo cuando la regla aplicable lo exige               |
|    7 | hechos confirmados                                  | hechos con fuente y frescura suficientes                      |
|    8 | incertidumbres, supuestos o causa no confirmada     | se presentan como inciertos y no se mezclan con hechos        |
|    9 | acción requerida o información necesaria            | instrucción o propósito concreto de la audiencia              |
|   10 | datos que no deben divulgarse                       | restricción visible en revisión y previsualización            |
|   11 | canal principal y alterno por referencia autorizada | no se inventan direcciones ni proveedores                     |
|   12 | confirmación o acuse requerido                      | tipo de evidencia necesaria por destinatario o proceso        |
|   13 | próximo momento o condición de actualización        | obligatorio cuando el mensaje requiere seguimiento            |
|   14 | mensaje anterior que corrige, sustituye o cierra    | mantiene historia y relación de versiones                     |
|   15 | versión, timestamp y evidencia de emisión/entrega   | permite reconstrucción sin convertir receipt en lectura       |

La ausencia de un campo no aplicable debe estar justificada por el contrato propietario; un campo necesario ausente bloquea la emisión.

---

#### 9. Las siete clases canónicas de comunicación

| Clase                        | Propósito UX                                                            | Preparación principal                                               | Regla de autoridad                                      | Riesgo que la interfaz debe impedir                                      |
| ---------------------------- | ----------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------- | ------------------------------------------------------------------------ |
| técnica                      | coordinar diagnóstico, health, restore y dependencias                   | `RESPONSABLE_TECNOLOGICO` o función técnica autorizada              | detalle técnico no concede autoridad empresarial        | publicar diagnóstico como causa final o recuperación                     |
| operativa interna            | coordinar operación mínima, sedes, turnos, responsables y acciones      | `COORDINACION_DE_OPERACIONES`, continuidad o propietaria aplicable  | debe permanecer dentro del mandato y alcance vigentes   | instruir operación fuera de estrategia o autoridad                       |
| ejecutiva                    | informar impacto, riesgo, decisiones y necesidades de gobierno          | continuidad con insumos propietarios                                | una actualización no sustituye aprobación ejecutiva     | presentar propuesta como decisión aprobada                               |
| laboral                      | informar medidas que afectan a trabajadores o responsables              | continuidad/operación con función laboral competente cuando aplique | conserva privacidad, seguridad y autoridad laboral      | exponer detalle personal o convertir aviso en acto laboral no autorizado |
| cliente                      | informar afectación, disponibilidad, alternativa o compromiso permitido | propietaria comercial/servicio con coordinación de continuidad      | promesa material exige validación propietaria aplicable | prometer causa, disponibilidad o ETA no confirmadas                      |
| proveedor                    | coordinar soporte, SLA, evidencia, alternativa o escalamiento externo   | propietario interno de la dependencia o servicio                    | el proveedor no dirige ni valida continuidad de Vento   | tratar respuesta del tercero como recuperación empresarial               |
| autoridad / tercero regulado | atender obligación, reporte o coordinación formal                       | función interna competente                                          | exige obligación, autoridad y canal formal aplicables   | enviar por canal informal o revelar más información de la necesaria      |

Una clase puede proyectarse por varios canales. Cambiar canal no cambia clase, autoridad, audiencia ni contenido autorizado.

---

#### 10. Ciclo UX de una comunicación

La experiencia presenta el ciclo como una secuencia verificable:

```text
NECESIDAD IDENTIFICADA
→ CLASE Y AUDIENCIA RESUELTAS
→ HECHOS E INCERTIDUMBRES COMPUESTOS
→ PLANTILLA APLICADA
→ CONTENIDO REVISADO
→ AUTORIDAD / APROBACION RESUELTA
→ CANAL ELEGIBLE RESUELTO
→ PREVISUALIZACION FINAL
→ EMISION
→ SEGUIMIENTO DE ENTREGA
→ LECTURA / ACUSE CUANDO APLIQUE
→ EFECTO EMPRESARIAL CUANDO APLIQUE
→ ACTUALIZACION / CORRECCION / ESCALAMIENTO
→ CIERRE DE LA NECESIDAD COMUNICACIONAL
```

El cierre de la necesidad comunicacional no equivale a cierre del incidente.

---

#### 11. Compositor de comunicación

La pantalla de composición se organiza en siete zonas:

1. **Contexto:** incidente, severidad, alcance, servicio/proceso y última actualización.
2. **Clase y audiencia:** qué comunicación es y quién realmente debe recibirla.
3. **Hechos confirmados:** seleccionados desde fuentes propietarias o registrados con referencia suficiente.
4. **Incertidumbres:** causa, alcance, ETA, dependencia o resultado que todavía no está confirmado.
5. **Acción e instrucciones:** qué necesita hacer o saber la audiencia, con límites explícitos.
6. **Canal y confirmación:** canal elegible, alterno acreditado cuando exista, evidencia esperada y regla de escalamiento.
7. **Autoridad y previsualización:** quién prepara, quién valida/aprueba, cómo se verá por canal y qué datos quedan excluidos.

El botón de emisión no aparece como acción ordinaria si falta una aprobación material, la audiencia no es resoluble o el contenido contiene una restricción no resuelta.

---

#### 12. Hechos, incertidumbre, causa y estimaciones

La composición presenta cuatro bloques semánticos separados:

| Bloque                       | Contenido admisible                                      | Regla                                                                 |
| ---------------------------- | -------------------------------------------------------- | --------------------------------------------------------------------- |
| hechos confirmados           | estados y resultados con fuente suficiente               | puede comunicarse como hecho dentro de la audiencia autorizada        |
| incertidumbres               | elementos aún no demostrados                             | deben conservar lenguaje de incertidumbre                             |
| hipótesis / causa preliminar | explicación de trabajo o investigación                   | nunca se presenta como causa confirmada                               |
| estimaciones                 | ETA, capacidad o ventana estimada con fuente y supuestos | no se transforma en compromiso empresarial sin validación propietaria |

Si una estimación cambia, la nueva versión conserva la estimación anterior y la razón de actualización.

---

#### 13. Gramática común de las plantillas

Las siete plantillas usan una misma gramática de bloques, activando solo los necesarios:

```text
IDENTIDAD
- incidente
- clase
- audiencia
- version

SITUACION
- hechos confirmados
- impacto aplicable
- incertidumbre explicita

ACCION
- que debe hacer o saber la audiencia
- que no debe hacer
- limite o condicion

SEGUIMIENTO
- confirmacion requerida
- proxima actualizacion o condicion
- contacto o superficie propietaria por referencia

TRAZABILIDAD
- emisor funcional
- aprobacion aplicable
- mensaje anterior relacionado
- evidencia de emision/entrega
```

La plantilla organiza el mensaje; no crea hechos, destinatarios, autoridad ni canales.

---

#### 14. Plantilla técnica

**Objetivo:** coordinar diagnóstico, contención, restauración o dependencia técnica sin elevar detalle innecesario al resto de audiencias.

```text
ACTUALIZACION TECNICA DE CONTINUIDAD

Incidente:
Componente o dependencia afectada:
Hechos tecnicos confirmados:
Impacto empresarial conocido:
Hipotesis o incertidumbres:
Accion tecnica requerida:
Bloqueo o control de seguridad:
Resultado observable esperado:
Evidencia o receipt requerido:
Responsable del siguiente handoff:
Proxima actualizacion o condicion:
```

Reglas:

- no incluye secretos, tokens, credenciales o payloads sensibles;
- un health check favorable no se redacta como recuperación empresarial;
- una causa preliminar permanece identificada como tal;
- cuando requiera acción privilegiada, la comunicación referencia la autorización; no la sustituye.

---

#### 15. Plantilla operativa interna

**Objetivo:** indicar a operación qué cambia y qué acción segura corresponde durante el incidente.

```text
INSTRUCCION OPERATIVA DE CONTINUIDAD

Incidente y alcance:
Que esta afectado:
Que continua disponible:
Que queda detenido, limitado o pendiente:
Accion requerida ahora:
Quien debe ejecutarla por funcion:
Limites y prohibiciones:
Donde conservar evidencia o referencia:
Confirmacion requerida:
Condicion para escalar o detener:
Proxima actualizacion o condicion:
```

Reglas:

- operación reducida se identifica como reducida;
- un mensaje no modifica por sí mismo el MBCO, estrategia o autoridad;
- si una acción no está autorizada, la plantilla no la presenta como workaround;
- sede, turno o área se muestran solo cuando son necesarios y autorizados.

---

#### 16. Plantilla ejecutiva

**Objetivo:** permitir a la autoridad empresarial comprender impacto, riesgo y decisión pendiente sin obligarla a leer detalle técnico.

```text
PARTE EJECUTIVO DE CONTINUIDAD

Incidente, estado y severidad:
Alcance empresarial:
Resultados o procesos afectados:
Impacto confirmado:
MBCO / RTO / MTPD aplicables y estado observado:
Hechos confirmados:
Incertidumbres materiales:
Decisiones requeridas:
Riesgo de no decidir:
Recomendacion o alternativas ya autorizadas para considerar:
Proxima actualizacion o condicion:
```

Reglas:

- una recomendación no aparece como aprobación;
- una aprobación no aparece como ejecución;
- RTO, MTPD o severidad no se convierten en autorización;
- una ETA técnica solo aparece como estimación si conserva fuente y supuestos.

---

#### 17. Plantilla laboral

**Objetivo:** informar a trabajadores o responsables sobre continuidad y medidas aplicables con mínimo dato necesario.

```text
AVISO DE CONTINUIDAD PARA PERSONAL

Que esta ocurriendo en terminos necesarios:
A quien aplica:
Desde cuando aplica:
Que debe hacer la persona:
Que no debe hacer:
Medida de seguridad o proteccion relevante:
Que servicio o proceso permanece disponible:
Canal o superficie para soporte por referencia autorizada:
Lectura o acuse requerido cuando aplique:
Proxima actualizacion o condicion:
```

Reglas:

- no incluye diagnóstico disciplinario, detalle médico, geolocalización u otros datos no necesarios;
- el aviso no crea una sanción, aceptación laboral o cambio de condiciones por sí solo;
- un acuse confirma conocimiento únicamente cuando esa sea la regla aplicable;
- la audiencia se resuelve desde contexto laboral vigente y no desde listas duplicadas.

---

#### 18. Plantilla cliente

**Objetivo:** informar al cliente con precisión sobre afectación, disponibilidad y acción permitida sin promesas no demostradas.

```text
ACTUALIZACION DE SERVICIO

Servicio o experiencia afectada:
Que sabemos con certeza:
Que sigue disponible:
Que esta temporalmente limitado o no disponible:
Alternativa autorizada, si existe:
Que debe hacer el cliente, si aplica:
Que todavia no podemos confirmar:
Compromiso o plazo validado por el propietario, si existe:
Proxima actualizacion o condicion:
```

Reglas:

- no comunica causa como definitiva sin confirmación;
- no comunica una alternativa no acreditada;
- no publica una ETA técnica como promesa al cliente;
- no expone detalles internos, vulnerabilidades, proveedores, datos de otros clientes ni estados técnicos innecesarios;
- la ausencia de plazo validado se comunica como incertidumbre, no con una fecha inventada.

---

#### 19. Plantilla proveedor

**Objetivo:** coordinar con un tercero sin transferirle autoridad empresarial.

```text
COORDINACION DE CONTINUIDAD CON PROVEEDOR

Incidente o referencia interna:
Servicio o dependencia contratada:
Sintoma o hecho confirmado:
Impacto empresarial relevante:
Alcance tecnico necesario para el tercero:
Accion o evidencia solicitada:
Receipt, ticket o referencia externa:
Condicion de escalamiento contractual aplicable:
Responsable interno de aceptar el resultado:
Proxima coordinacion o condicion:
```

Reglas:

- el proveedor recibe solo el contexto necesario;
- no recibe secretos o evidencia interna no necesaria;
- un ticket cerrado o servicio restaurado por el tercero no declara proceso Vento recuperado;
- no se inventan SLA, contactos, alternativas o niveles de soporte;
- la función interna propietaria conserva la aceptación del resultado.

---

#### 20. Plantilla autoridad / tercero regulado

**Objetivo:** atender una obligación, notificación o coordinación formal con trazabilidad y minimización.

```text
COMUNICACION FORMAL DE CONTINUIDAD

Expediente o incidente de referencia:
Obligacion o fundamento aplicable:
Hechos confirmados que deben reportarse:
Alcance temporal y organizacional:
Medidas de contencion o proteccion confirmadas:
Impacto conocido y limitaciones de conocimiento:
Informacion requerida por la contraparte:
Informacion excluida por no ser necesaria o autorizada:
Funcion competente que prepara:
Aprobacion o firma aplicable:
Canal formal por referencia autorizada:
Evidencia de presentacion o recepcion:
Siguiente hito u obligacion:
```

Reglas:

- no se utiliza una plantilla informal como sustituto de una obligación formal;
- no se inventa obligación, término, autoridad o destinatario;
- la evidencia de recepción se conserva separada de cualquier aceptación del contenido;
- el expediente de continuidad no sustituye el expediente regulatorio propietario cuando exista.

---

#### 21. Resolución de canales

La interfaz resuelve el canal después de determinar clase, audiencia, finalidad, sensibilidad y autoridad.

Orden obligatorio:

```text
CLASE
→ AUDIENCIA
→ FINALIDAD
→ SENSIBILIDAD
→ CANALES ELEGIBLES DEL CONTRATO PROPIETARIO
→ CAPACIDAD ACTUAL
→ PREFERENCIA CUANDO SEA APLICABLE
→ CANAL PRINCIPAL AUTORIZADO
→ CANAL ALTERNO ACREDITADO, SI EXISTE
```

Reglas:

1. la existencia de correo, push, navegador, mensajería o teléfono no los convierte en canal oficial para toda crisis;
2. un canal manual observado en AS-IS no se promueve automáticamente a política objetivo;
3. un canal externo debe estar vinculado con la contraparte y finalidad correctas;
4. el canal alterno se usa únicamente cuando está acreditado y autorizado;
5. si no existe canal alterno demostrado, la experiencia registra el bloqueo y escala; no inventa uno;
6. el fallo de un canal no amplía audiencia;
7. cambiar de canal no modifica el contenido autorizado;
8. un canal con vista previa insegura recibe contenido minimizado o se considera no elegible;
9. AURA permanece fuera del rol de canal oficial mientras su capacidad esté diferida;
10. el endpoint real se resuelve desde la fuente protegida vigente y no se duplica en plantillas generales.

---

#### 22. Matriz de decisión de canal por clase

| Clase                        | Superficie principal de experiencia                     | Familias de canal elegibles                                                       | Alterno                                             | Confirmación                                                        | Límite                                                                 |
| ---------------------------- | ------------------------------------------------------- | --------------------------------------------------------------------------------- | --------------------------------------------------- | ------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| técnica                      | coordinación técnica autenticada                        | canal interno, push/alerta o canal contractual del proveedor cuando corresponda   | solo referencia acreditada                          | depende de si informa, solicita acción o requiere efecto técnico    | no exponer secretos ni usar detalle técnico como broadcast             |
| operativa interna            | superficie interna de continuidad/operación             | bandeja interna, aviso en aplicación, push o mecanismo corporativo autorizado     | solo si está acreditado para la audiencia           | lectura, acuse o efecto según la acción real                        | no convertir canal en orden fuera del mandato                          |
| ejecutiva                    | vista ejecutiva de continuidad                          | superficie autenticada y canal corporativo directo autorizado                     | solo cuando la regla de escalamiento lo permita     | decisión o acuse explícito cuando sea requerido; lectura no aprueba | no sustituir la decisión protegida con un botón cosmético              |
| laboral                      | superficie laboral autorizada                           | aplicación/bandeja laboral, push minimizado o canal corporativo permitido         | según cobertura real del trabajador                 | lectura, acuse o efecto laboral según contrato propietario          | no usar contacto personal fuera de la finalidad autorizada             |
| cliente                      | superficie propietaria de cliente                       | canal de aplicación, correo o mensajería externa aprobada por el proceso          | únicamente canal alterno aprobado para esa relación | lectura externa no se presume autoritativa                          | no escalar al cliente por no leer salvo obligación propietaria expresa |
| proveedor                    | superficie interna de coordinación + referencia externa | portal, ticket, correo, mensajería o llamada contractual cuando estén acreditados | según contrato vigente                              | receipt/respuesta externa y aceptación interna separadas            | proveedor no valida recuperación empresarial                           |
| autoridad / tercero regulado | expediente formal propietario                           | canal formal exigido por obligación o autoridad competente                        | solo mecanismo formal alterno válido                | evidencia de presentación/recepción según el mecanismo              | no sustituir formalidad con un canal informal                          |

La tabla define tratamiento UX, no habilita físicamente ningún canal.

---

#### 23. Estados de entrega reutilizados

La experiencia reutiliza los estados de entrega del servicio transversal de notificaciones:

| Estado                | Lectura UX                                                                           |
| --------------------- | ------------------------------------------------------------------------------------ |
| `DELIVERY_PENDING`    | la proyección es elegible y aún no inició envío                                      |
| `DELIVERY_ATTEMPTING` | existe un intento técnico en curso                                                   |
| `DELIVERY_ACCEPTED`   | el transportista aceptó el intento; no demuestra lectura                             |
| `DELIVERY_CONFIRMED`  | existe confirmación técnica posterior del transportista; no demuestra lectura        |
| `DELIVERY_UNKNOWN`    | pudo existir aceptación, pero la evidencia es insuficiente                           |
| `DELIVERY_RETRY_WAIT` | existe un fallo reintentable y se espera el siguiente intento permitido              |
| `DELIVERY_BLOCKED`    | falta destinatario, endpoint, permiso, configuración, contrato o adaptador necesario |
| `DELIVERY_EXHAUSTED`  | se agotó la recuperación técnica automática permitida                                |
| `DELIVERY_CANCELLED`  | la necesidad dejó de estar vigente o elegible                                        |
| `DELIVERY_SUPERSEDED` | una revisión posterior sustituyó la proyección anterior                              |

La UX no crea “enviado correctamente” como estado agregado cuando la evidencia real es más débil.

---

#### 24. Fallos y resultado incierto

La experiencia distingue la clase de fallo sin obligar al usuario a interpretar códigos técnicos:

- transporte transitorio;
- limitación de cuota o frecuencia;
- resultado de envío incierto;
- endpoint inválido o revocado;
- configuración o contrato inválido;
- canal no disponible;
- destinatario no resoluble;
- necesidad expirada o sustituida.

Reglas:

1. un fallo desconocido no se convierte en éxito;
2. `DELIVERY_UNKNOWN` exige conciliación o mecanismo idempotente antes de repetir cuando el primer intento pudo producir efecto;
3. un endpoint inválido no se reintenta indefinidamente;
4. un destinatario no resoluble no se reemplaza por “todos”;
5. la falta de canal no se resuelve con un proveedor personal o cuenta no autorizada;
6. los reintentos técnicos no reinician la vigencia empresarial del mensaje;
7. agotamiento de entrega no equivale a fracaso del proceso empresarial;
8. la pantalla muestra siguiente acción segura y propietario del bloqueo.

---

#### 25. Entrega, lectura, acuse y efecto empresarial

La experiencia muestra seis conceptos separados:

| Evidencia            | Significado visible                                                          | Puede afirmar lectura             | Puede cerrar la atención                         |
| -------------------- | ---------------------------------------------------------------------------- | --------------------------------- | ------------------------------------------------ |
| `TRANSPORT_ACCEPTED` | el mecanismo aceptó el intento                                               | no                                | no                                               |
| `PRESENTED`          | una superficie pudo mostrar el aviso                                         | no por sí sola                    | no                                               |
| `READ`               | el destinatario autenticado cargó la ocurrencia o contexto                   | sí                                | solo cuando la regla aplicable exige lectura     |
| `ACKNOWLEDGED`       | el destinatario confirmó explícitamente conocimiento de la versión correcta  | implica lectura                   | solo cuando el contrato exige acuse explícito    |
| `PROCESS_EFFECT`     | el proceso propietario registró el hecho que satisface la acción pendiente   | es evidencia superior de atención | sí cuando esa acción es la condición propietaria |
| `ESCALATED`          | la falta de atención proyectó la necesidad a otra responsabilidad autorizada | no                                | no por sí sola                                   |

Una comunicación puede estar leída y continuar pendiente. Un efecto empresarial puede resolver la necesidad sin existir una transición de lectura separada.

---

#### 26. Selección de confirmación

La clase del mensaje no determina por sí sola la confirmación. La experiencia resuelve la exigencia según la intención:

| Intención                    | Confirmación UX esperada                                                      | Regla                                                          |
| ---------------------------- | ----------------------------------------------------------------------------- | -------------------------------------------------------------- |
| informar                     | ninguna, lectura cuando la política la rastree, o evidencia de disponibilidad | no forzar acuse si no existe obligación                        |
| asegurar conocimiento        | lectura autenticada o acuse explícito según contrato                          | leer no equivale a aceptar                                     |
| solicitar acción             | `PROCESS_EFFECT` del proceso propietario                                      | un botón “entendido” no sustituye la acción                    |
| solicitar decisión protegida | decisión autoritativa + evidencia; acuse solo como conocimiento               | la comunicación no produce la aprobación por sí misma          |
| coordinar proveedor          | receipt/respuesta externa + aceptación interna cuando corresponda             | respuesta del tercero no valida Vento                          |
| cumplir obligación formal    | evidencia de presentación/recepción y efecto formal aplicable                 | receipt técnico no sustituye aceptación jurídica o regulatoria |

La pantalla explica qué evidencia falta y quién puede producirla.

---

#### 27. Seguimiento por destinatario

Cuando una comunicación tenga múltiples destinatarios, la experiencia conserva por identidad o responsabilidad resoluble:

```text
destinatario o responsabilidad
version recibida
canal o proyeccion
estado de entrega
lectura, si aplica
acuse, si aplica
efecto de proceso, si aplica
escalamiento relacionado
ultimo cambio
```

Reglas:

- la lectura de una persona no se propaga a otra;
- un grupo no aparece “confirmado” porque una sola persona lo confirmó;
- un cambio de responsable no transfiere el estado humano del responsable anterior;
- la nueva identidad recibe la proyección vigente si la necesidad continúa y la política lo exige;
- la versión sustituida permanece en historia sin seguir exigiendo acuse cuando ya no está vigente.

---

#### 28. Escalamiento

La experiencia separa cuatro motivos de escalamiento:

```text
FALLA DE ENTREGA
→ problema de canal, endpoint, configuración o destinatario

FALTA DE LECTURA / ACUSE
→ la regla exige conocimiento y no existe evidencia suficiente

FALTA DE ACCION EMPRESARIAL
→ el proceso propietario conserva una obligación abierta

RIESGO DE OBJETIVO DE CONTINUIDAD
→ la ausencia de respuesta o decisión amenaza el resultado empresarial
```

Tratamiento:

1. se intenta un canal alterno solo cuando ya está acreditado y autorizado;
2. un canal alterno no sustituye escalamiento de responsabilidad cuando el problema es falta de acción;
3. escalamiento conserva el destinatario o responsabilidad original y agrega la nueva responsabilidad; no reescribe historia;
4. el siguiente nivel se resuelve desde la cadena propietaria, no desde una lista genérica de gerentes;
5. proveedor externo no se convierte en director del incidente por escalar un ticket;
6. una comunicación a cliente no escala a “más clientes” por falta de lectura;
7. una falta de respuesta externa se escala cuando amenaza el objetivo empresarial, sin inventar SLA;
8. una decisión protegida pendiente escala hacia la autoridad aplicable, no hacia quien tenga disponible el canal;
9. un escalamiento no concede acceso adicional a información sensible;
10. la interfaz muestra motivo, condición, función destino, tiempo y evidencia que justificaron el escalamiento.

---

#### 29. Vista de seguimiento

```text
COMUNICACIONES — INCIDENTE

Necesidades activas             [ cantidad ]
Pendientes de autoridad         [ cantidad ]
Entrega incierta                [ cantidad ]
Lectura / acuse pendiente       [ cantidad ]
Accion empresarial pendiente    [ cantidad ]
Escaladas                       [ cantidad ]
Correcciones vigentes           [ cantidad ]

[Clase] [Audiencia] [Version] [Canal] [Entrega]
[Confirmacion requerida] [Siguiente hito]
[Propietario] [Bloqueo] [Ultima actualizacion]
```

Los conteos solo agregan elementos visibles y autorizados. Un total no permite inferir la existencia de comunicaciones fuera del alcance del actor.

---

#### 30. Consistencia multiaudiencia

Una misma situación puede producir mensajes distintos para técnico, operación, dirección, trabajadores, clientes o terceros, pero todos parten de un núcleo común de hechos confirmados.

La experiencia conserva:

```text
NUCLEO DE HECHOS CONFIRMADOS
→ proyeccion tecnica
→ proyeccion operativa
→ proyeccion ejecutiva
→ proyeccion laboral
→ proyeccion cliente
→ proyeccion proveedor
→ proyeccion autoridad / tercero regulado
```

Reglas:

1. minimizar contenido no permite cambiar el hecho;
2. una audiencia puede recibir menos detalle, nunca un estado contradictorio;
3. una causa puede omitirse por seguridad, pero no sustituirse por otra causa;
4. una ETA no aprobada puede omitirse, pero no convertirse en plazo diferente;
5. cuando cambia un hecho común, la experiencia identifica las proyecciones vigentes que pueden requerir actualización;
6. no se edita silenciosamente el mensaje histórico ya emitido.

---

#### 31. Corrección y sustitución de mensajes

Una corrección se representa como una nueva versión relacionada:

```text
MENSAJE VIGENTE
→ se detecta hecho incorrecto, incompleto o desactualizado
→ se prepara correccion
→ se valida autoridad y audiencia
→ se emite nueva version
→ la anterior queda SUPERSEDED para nuevas proyecciones
→ se conserva evidencia de ambas versiones
```

La corrección muestra:

- qué afirmación cambió;
- por qué cambió;
- qué versión reemplaza;
- quién preparó y aprobó cuando aplicó;
- a qué audiencia debe llegar la corrección;
- qué confirmación previa ya no es suficiente cuando el cambio es material;
- próxima actualización o condición.

Corregir un mensaje no borra receipts, lecturas o acuses históricos de la versión anterior.

---

#### 32. Actualizaciones y cadencia

No existe una frecuencia universal de partes de continuidad.

Cada mensaje de seguimiento debe declarar uno de estos dos resultados:

```text
PROXIMA ACTUALIZACION EN UN MOMENTO DETERMINADO POR LA FUENTE PROPIETARIA
```

o

```text
PROXIMA ACTUALIZACION CUANDO OCURRA UNA CONDICION EXPLICITA
```

La interfaz no inventa un reloj cuando el dato no existe. Una actualización vencida se muestra como pendiente o incumplida según el contrato propietario y puede escalar cuando la ausencia de información amenaza una decisión o una obligación.

---

#### 33. Privacidad y contenido sensible

La experiencia aplica minimización antes de elegir canal.

Por defecto, canales que muestran contenido fuera de una sesión autenticada no deben incluir, salvo necesidad y autorización explícitas:

- secretos, tokens, códigos de acceso o llaves;
- cuerpos o vistas previas de mensajes sensibles;
- vulnerabilidades o diagnósticos internos detallados;
- datos laborales o personales innecesarios;
- geolocalización, horarios o contexto individual no necesario;
- datos de pago, fidelización o compra no necesarios;
- contactos internos completos;
- evidencia completa cuando basta una referencia protegida.

La previsualización diferencia claramente “contenido dentro de la aplicación” y “contenido visible en la notificación o canal externo”.

---

#### 34. Contactos y directorios

La experiencia no mantiene un directorio paralelo de crisis.

Puede proyectar, según necesidad y autorización:

- función interna y estado de disponibilidad;
- identidad mínima cuando sea necesario escalar nominalmente;
- organización o servicio de proveedor y referencia de soporte;
- destinatario cliente o externo definido por el proceso propietario;
- contacto de autoridad o asesor estrictamente necesario.

Nombre, teléfono, correo y otros datos personales se resuelven desde la fuente protegida vigente. La experiencia no los copia a una plantilla general para facilitar uso posterior.

---

#### 35. Comunicación externa y coordinación

Para cualquier tercero externo se conserva un propietario interno.

La ficha externa muestra:

```text
contraparte
relacion o servicio
propietario interno
finalidad
hechos compartibles
restricciones
canal autorizado
referencia externa
respuesta / receipt
impacto sobre continuidad
siguiente coordinacion
```

Reglas:

- proveedor no dirige el incidente;
- proveedor no valida recuperación empresarial;
- proveedor no acepta riesgo en nombre de Vento;
- estado de proveedor no equivale a estado del proceso;
- falta de respuesta externa puede escalar cuando amenaza objetivos, sin inventar SLA;
- coordinación externa no amplía acceso a secretos ni evidencia.

---

#### 36. Incidente real, ejercicio y simulación

La experiencia distingue de forma inequívoca:

- incidente real;
- ejercicio;
- simulación técnica;
- demostración o entorno no productivo cuando aplique.

En ejercicio, toda plantilla y pantalla presenta marca de contexto no productivo. La emisión externa real permanece bloqueada salvo que el ejercicio tenga una comunicación real expresamente autorizada por su propietario y alcance; esta tarea no concede esa autorización.

---

#### 37. Responsive y accesibilidad

**Escritorio:** composición y previsualización pueden mostrarse lado a lado; seguimiento por audiencia y canal usa detalle progresivo.

**Tablet:** mantiene contexto, audiencia, acción y aprobación visibles; los metadatos secundarios pasan a panel de detalle.

**Móvil:** prioriza incidente, clase, audiencia, hechos, acción requerida, bloqueo, confirmación y siguiente hito; evita tablas comprimidas.

Obligaciones comunes:

- navegación completa por teclado;
- foco visible;
- etiquetas semánticas;
- estado comunicado con texto además de color;
- versión y fecha legibles;
- no depender de animación para indicar entrega o escalamiento;
- formularios con errores asociados al campo y acción segura;
- previsualización accesible del contenido por canal;
- zoom sin pérdida de la acción principal ni de advertencias de divulgación.

---

#### 38. Casos deterministas

| Escenario                                                       | Presentación y acción segura                                                               |
| --------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| mensaje técnico preparado sin aprobación requerida              | puede avanzar a emisión si actor, audiencia, canal y contenido están autorizados           |
| mensaje externo con compromiso material pendiente de validación | emisión bloqueada; muestra función que debe validar el compromiso                          |
| proveedor acepta un ticket                                      | `DELIVERY_ACCEPTED` o receipt externo; no proceso recuperado                               |
| push aceptado por transportista                                 | entrega técnica aceptada; lectura pendiente/no demostrada                                  |
| correo con señal de apertura externa                            | no se eleva a lectura empresarial autoritativa                                             |
| usuario autenticado abre la ocurrencia                          | `READ` para esa identidad y versión cuando el contrato lo permita                          |
| usuario pulsa acuse explícito                                   | `ACKNOWLEDGED`; no ejecuta la acción empresarial pendiente                                 |
| proceso registra la acción requerida                            | `PROCESS_EFFECT`; la atención puede quedar satisfecha según contrato                       |
| timeout después de iniciar envío                                | `DELIVERY_UNKNOWN`; reconciliar antes de reintento ciego                                   |
| canal primario bloqueado, alterno acreditado                    | permite usar alterno con misma audiencia/autoridad y conserva intento previo               |
| canal primario bloqueado, alterno no demostrado                 | bloquea envío alternativo inventado y escala la brecha                                     |
| destinatario no resoluble                                       | no envía ni amplía audiencia; muestra propietario de resolución                            |
| trabajador cambia de responsabilidad                            | no transfiere lectura/acuses del responsable anterior                                      |
| una proyección tiene información sensible incompatible con push | push se minimiza o queda no elegible; contenido completo permanece en superficie protegida |
| ETA técnica cambia                                              | nueva versión conserva fuente y supuestos; no reescribe el mensaje anterior                |
| causa preliminar cambia                                         | corrección explícita; nunca se presenta la hipótesis anterior como confirmada              |
| mensaje cliente sin plazo confirmado                            | comunica incertidumbre y condición de siguiente actualización; no inventa fecha            |
| proveedor informa servicio restablecido                         | actualización externa favorable; Vento mantiene validación propia pendiente                |
| mensaje de cierre comunicacional enviado                        | finaliza la necesidad de ese mensaje; no cierra incidente                                  |
| dos audiencias requieren distinto detalle                       | proyecciones distintas sobre el mismo núcleo factual sin contradicción material            |
| confirmación pendiente alcanza condición de escalamiento        | crea seguimiento hacia responsabilidad autorizada; no hace broadcast                       |
| `DELIVERY_EXHAUSTED`                                            | muestra agotamiento técnico y siguiente coordinación; no afirma fracaso empresarial        |
| versión corregida sustituye a la anterior                       | anterior permanece histórica; nueva versión se vuelve la vigente para futuras proyecciones |
| simulación                                                      | marca no productiva persistente y prohibición de inferir autoridad real                    |

---

#### 39. Handoffs y brechas de implementación

| Materia                                          | Estado documental                      | Propietario / tarea                                            | Condición de salida                                               |
| ------------------------------------------------ | -------------------------------------- | -------------------------------------------------------------- | ----------------------------------------------------------------- |
| implementación real de canales                   | `PENDIENTE_DE_EVIDENCIA`               | servicio transversal de notificaciones y paquetes propietarios | canal materializado, probado y autorizado por audiencia/finalidad |
| directorio y contactos vigentes                  | `PENDIENTE_DE_EVIDENCIA` por instancia | `CONT-AUTH-003` y fuentes organizacionales propietarias        | contacto resoluble, vigente y protegido en ejercicio autorizado   |
| persistencia de comunicaciones de continuidad    | `PENDIENTE_DE_EVIDENCIA`               | paquete de implementación propietario de `VPROC-0062`          | mensaje, versión, audiencia, autoridad y evidencia persistidos    |
| receipts y métricas de entrega                   | `PENDIENTE_DE_EVIDENCIA`               | `NOTIFY-ARC-010` y paquete técnico                             | telemetría de entrega correlacionable sin confundir lectura       |
| lectura y acuse por destinatario                 | `PENDIENTE_DE_EVIDENCIA`               | `NOTIFY-ARC-007` y consumidores                                | estado por identidad/versión implementado y probado donde aplique |
| reintentos y reconciliación de entrega           | `PENDIENTE_DE_EVIDENCIA`               | `NOTIFY-ARC-008` y adaptadores                                 | resultado incierto tratado sin duplicación y con evidencia        |
| contenido sensible y previsualizaciones          | `PENDIENTE_DE_EVIDENCIA`               | `NOTIFY-ARC-009`, gobierno de información y consumidores       | minimización aplicada y validada por canal                        |
| autoridad real de preparación/aprobación/emisión | `PENDIENTE_DE_EVIDENCIA`               | `CONT-AUTH-001` y paquete de autorización                      | decisiones efectivas verificadas en contexto y auditables         |
| comunicación externa formal                      | `PENDIENTE_DE_EVIDENCIA`               | dominio propietario de la relación externa                     | obligación, destinatario, canal y evidencia formal demostrados    |
| pruebas de crisis y canales degradados           | `PENDIENTE_DE_EVIDENCIA`               | `CONT-UX-007`, `CONT-DOM-014` y BLOQUE U                       | ejercicio ejecutado con resultados, fallos y acciones registradas |

No queda una brecha identificada por esta tarea sin propietario y condición de salida.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea materializa en experiencia de usuario reglas ya protegidas sobre comunicación de incidentes, autoridad de preparación/aprobación/emisión, clasificación de audiencia, canales, entrega, lectura, acuse, escalamiento, privacidad, errores, contingencia y trazabilidad. Las siete clases y los quince campos ya existen en el contrato de continuidad; los estados de entrega, lectura, confirmación, reintento y privacidad ya existen en el servicio transversal de notificaciones. No se introduce una conducta ejecutable nueva ni se modifica el significado, estado o cobertura de un requisito vigente.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 40. Criterios de aceptación

1. `CONT-UX-005` permanece como tarea anterior aprobada.
2. `CONT-UX-007` permanece como siguiente tarea reservada.
3. La tarea permanece exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`.
4. No se ejecutan comunicaciones reales.
5. No se crea ni modifica código, DDL, DML, migraciones, RLS, RPC, Edge Functions, datos o configuración Supabase.
6. No se crean contactos nominales, teléfonos, correos, tokens, cuentas o proveedores.
7. No se modifica ninguna política de notificación existente.
8. Se materializan exactamente siete clases de comunicación.
9. Las siete clases conservan los nombres y propósitos canónicos heredados.
10. Se materializan exactamente siete plantillas base, una por clase.
11. Cada plantilla conserva contexto del incidente.
12. Cada plantilla distingue hechos confirmados de incertidumbre.
13. Cada plantilla permite expresar acción requerida o información necesaria.
14. Cada plantilla permite declarar próxima actualización o condición.
15. Cada plantilla conserva autoridad de preparación/emisión aplicable.
16. La plantilla técnica no presenta health técnico como recuperación empresarial.
17. La plantilla técnica no expone secretos ni credenciales.
18. La plantilla operativa muestra qué continúa, qué se detiene y qué acción corresponde.
19. La plantilla operativa no crea un workaround no autorizado.
20. La plantilla ejecutiva separa información de decisión requerida.
21. La plantilla ejecutiva no presenta recomendación como aprobación.
22. La plantilla ejecutiva no presenta aprobación como ejecución.
23. La plantilla laboral minimiza datos personales y laborales.
24. La plantilla laboral no convierte acuse en aceptación laboral.
25. La plantilla cliente no promete causa no confirmada.
26. La plantilla cliente no promete alternativa no acreditada.
27. La plantilla cliente no convierte ETA técnica en compromiso empresarial.
28. La plantilla proveedor conserva propietario interno.
29. La plantilla proveedor no permite que el tercero valide continuidad de Vento.
30. La plantilla de autoridad/tercero regulado exige obligación y función competente resolubles.
31. La plantilla formal no usa un canal informal como sustituto sin autoridad.
32. Toda comunicación material puede resolver los quince campos mínimos heredados.
33. La referencia al incidente se conserva en cada comunicación material.
34. La clase de comunicación se conserva explícitamente.
35. Severidad y alcance se muestran como contexto y no como permiso.
36. La audiencia exacta debe ser resoluble antes de emitir cuando sea necesaria.
37. El emisor funcional se distingue de la identidad técnica del canal.
38. El aprobador/verificador se muestra cuando la regla lo exige.
39. Los hechos confirmados conservan fuente suficiente.
40. Las incertidumbres no se presentan como hechos.
41. La acción requerida permanece separada del contenido informativo.
42. Las restricciones de divulgación se muestran antes de emitir.
43. Canal principal y alterno se resuelven por referencia autorizada.
44. La confirmación requerida se define por intención y contrato propietario.
45. Cada seguimiento declara próxima actualización o condición.
46. Toda corrección conserva referencia a la versión anterior.
47. Versión, timestamp y evidencia de emisión/entrega permanecen trazables.
48. Clase de comunicación y canal permanecen conceptos distintos.
49. Canal y audiencia permanecen conceptos distintos.
50. Audiencia y autoridad permanecen conceptos distintos.
51. Preparar y aprobar permanecen actos distintos.
52. Aprobar y emitir permanecen actos distintos.
53. Emitir y entregar técnicamente permanecen actos distintos.
54. Entrega técnica y lectura permanecen actos distintos.
55. Lectura y acuse permanecen actos distintos.
56. Acuse y efecto empresarial permanecen actos distintos.
57. Escalamiento no se presenta como broadcast.
58. Corrección no borra historia.
59. ETA técnica no se presenta automáticamente como compromiso empresarial.
60. Estado de proveedor no se presenta como estado del proceso Vento.
61. Mensaje de cierre no se presenta como cierre del incidente.
62. La necesidad de comunicación se resuelve antes de seleccionar plantilla.
63. La clase se resuelve antes del canal.
64. La audiencia se resuelve antes del endpoint.
65. La sensibilidad se evalúa antes de previsualizar canales externos.
66. Un canal observado en AS-IS no se promueve automáticamente a canal oficial de continuidad.
67. La existencia de correo no autoriza correo para toda comunicación.
68. La existencia de push no autoriza push para todo contenido.
69. La existencia de mensajería externa no autoriza compartir datos sensibles.
70. La existencia de teléfono o llamada no crea un contacto oficial.
71. Un canal alterno solo se ofrece cuando está acreditado y autorizado.
72. Si no existe canal alterno, la interfaz registra el bloqueo y escala sin inventarlo.
73. El fallo de un canal no amplía audiencia.
74. Cambiar de canal no modifica el contenido autorizado.
75. AURA no se presenta como canal operativo oficial mientras esté diferida.
76. Los endpoints reales se resuelven desde fuentes protegidas.
77. `DELIVERY_PENDING` no se presenta como envío iniciado.
78. `DELIVERY_ATTEMPTING` no se presenta como entrega aceptada.
79. `DELIVERY_ACCEPTED` no se presenta como lectura.
80. `DELIVERY_CONFIRMED` no se presenta como lectura.
81. `DELIVERY_UNKNOWN` no se convierte en éxito por ausencia de error.
82. `DELIVERY_RETRY_WAIT` muestra la recuperación técnica sin reiniciar vigencia empresarial.
83. `DELIVERY_BLOCKED` no habilita broadcast.
84. `DELIVERY_EXHAUSTED` no se presenta como fracaso del proceso empresarial.
85. `DELIVERY_CANCELLED` detiene nuevos intentos de la proyección afectada.
86. `DELIVERY_SUPERSEDED` conserva la versión sustituida en historia.
87. Un timeout posterior al inicio del envío puede conservar resultado incierto.
88. Un resultado incierto se reconcilia antes de duplicar un envío cuando sea necesario.
89. Un endpoint permanentemente inválido no se reintenta de forma indefinida.
90. Un destinatario no resoluble no se reemplaza por una audiencia más amplia.
91. Un error de configuración no se atribuye al destinatario.
92. Un canal no disponible conserva la necesidad mientras siga vigente.
93. Una necesidad expirada no sigue reintentándose.
94. `TRANSPORT_ACCEPTED` no afirma lectura.
95. `PRESENTED` no afirma lectura por sí solo.
96. `READ` se registra únicamente para la identidad y versión aplicables.
97. `ACKNOWLEDGED` implica conocimiento, no permiso ni efecto empresarial.
98. `PROCESS_EFFECT` proviene del proceso propietario.
99. `ESCALATED` no cierra por sí solo la obligación.
100. Un `2xx` no demuestra lectura humana.
101. Un receipt de push no demuestra lectura humana.
102. Una respuesta de correo aceptado no demuestra lectura humana.
103. Un badge visible no demuestra lectura humana.
104. Un permiso de notificaciones concedido no demuestra lectura humana.
105. Un tap solo puede producir lectura después de autenticar y cargar el contexto autorizado cuando aplique.
106. Una señal de apertura externa no se usa como lectura empresarial autoritativa.
107. Una comunicación leída puede permanecer pendiente.
108. Una acción empresarial válida puede cerrar la necesidad sin lectura separada cuando el contrato así lo define.
109. La lectura de una identidad no se propaga a otra.
110. El acuse de una identidad no se propaga a otra.
111. Cambiar de responsable no transfiere estados humanos previos.
112. Una versión sustituida deja de exigir nuevas confirmaciones salvo regla propietaria expresa.
113. La intención informativa no exige acuse artificial.
114. El conocimiento obligatorio puede usar lectura o acuse según contrato.
115. Una acción requerida exige el efecto propietario y no un botón cosmético.
116. Una decisión protegida exige autoridad efectiva y no la comunicación misma.
117. Un receipt de proveedor se mantiene separado de la aceptación interna.
118. Una comunicación formal conserva evidencia de presentación/recepción sin inventar aceptación.
119. El escalamiento por falla de entrega se distingue del escalamiento por falta de atención.
120. La falta de lectura se escala solo cuando la regla exige conocimiento y se cumple la condición de escalamiento.
121. La falta de acuse se escala solo cuando el acuse era obligatorio.
122. La falta de acción empresarial se escala por la cadena propietaria del proceso.
123. Un riesgo a objetivos de continuidad escala hacia la autoridad aplicable sin ampliar datos innecesarios.
124. El canal alterno no sustituye una escalada de responsabilidad.
125. El escalamiento conserva al destinatario/responsabilidad original en historia.
126. El proveedor externo no se convierte en director del incidente.
127. Una falta de respuesta del proveedor puede escalar sin inventar un SLA.
128. Una decisión protegida pendiente no se redirige a quien tenga un canal disponible.
129. El escalamiento no amplía permisos de información.
130. Cada escalamiento conserva motivo, condición, función destino, tiempo y evidencia.
131. Las proyecciones para audiencias diferentes parten de un núcleo común de hechos.
132. Minimizar detalle no permite modificar el hecho confirmado.
133. Una causa omitida por seguridad no se reemplaza por una causa inventada.
134. Una ETA omitida por falta de aprobación no se reemplaza por un plazo diferente.
135. Un cambio de hecho común identifica proyecciones que pueden requerir actualización.
136. Un mensaje emitido no se edita silenciosamente.
137. Una corrección crea nueva versión relacionada.
138. La versión anterior conserva receipts, lecturas y acuses históricos.
139. La corrección explica qué cambió y por qué.
140. Una corrección material puede exigir nueva confirmación según la regla propietaria.
141. No existe una frecuencia universal de actualización de crisis.
142. Cada seguimiento declara próximo momento o condición.
143. Un próximo momento no se inventa cuando la fuente propietaria no lo define.
144. Una actualización vencida permanece visible y puede escalar cuando afecta decisión u obligación.
145. Las previsualizaciones externas minimizan contenido sensible.
146. Los secretos nunca se incluyen en plantillas o vistas previas ordinarias.
147. Los contactos completos no se duplican en plantillas generales.
148. Las listas de destinatarios se resuelven desde fuentes propietarias vigentes.
149. Los conteos de comunicaciones respetan el alcance autorizado.
150. Un contador no revela comunicaciones fuera del alcance.
151. La vista móvil conserva contexto, clase, audiencia, bloqueo, confirmación y siguiente hito.
152. Los estados no dependen únicamente de color.
153. La composición es navegable por teclado.
154. La previsualización por canal es accesible.
155. El foco permanece visible durante composición, revisión y escalamiento.
156. La pantalla distingue incidente real, ejercicio y simulación.
157. Una simulación no concede autoridad productiva.
158. Una simulación no envía comunicaciones externas reales por defecto.
159. Toda brecha identificada conserva propietario y condición de salida.
160. La tarea no genera ni modifica requisitos de prueba.
161. La ausencia de cambios de requisitos evita generar una copia innecesaria del registro canónico.
162. La tarea no declara canales actuales como probados para crisis por existir implementados en otro contexto.
163. La tarea no declara contactos actuales como vigentes sin fuente protegida.
164. La tarea no declara lectura, acuse o efecto empresarial sin evidencia suficiente.
165. La tarea no declara coordinación externa implementada por definir su experiencia.
166. La tarea no declara readiness operativo.
167. La tarea no inicia `CONT-UX-007`.

---

#### 41. Balance de cierre

| Control                              |   Resultado |
| ------------------------------------ | ----------: |
| clases de comunicación               |   **7 / 7** |
| plantillas base                      |   **7 / 7** |
| campos comunes                       | **15 / 15** |
| estados `DELIVERY_*` reutilizados    | **10 / 10** |
| evidencias de atención diferenciadas |   **6 / 6** |
| contextos UX                         |   **3 / 3** |
| escenarios deterministas             | **24 / 24** |
| criterios de aceptación              |     **167** |
| comunicaciones reales emitidas       |       **0** |
| contactos inventados                 |       **0** |
| canales físicos creados              |       **0** |
| cambios Supabase                     |       **0** |
| cambios TREQ                         |       **0** |

---

#### 42. Límites de la tarea

Esta tarea no:

- envía mensajes, push, correos, llamadas o comunicaciones externas;
- crea un proveedor de mensajería;
- crea cuentas, tokens, API keys, números telefónicos, dominios o buzones;
- crea o modifica canales físicos;
- configura Expo, correo, navegador, WhatsApp, ManyChat u otro tercero;
- crea un directorio de contactos;
- publica datos de clientes, trabajadores, proveedores o autoridades;
- crea una tabla, bucket, cola, job, trigger o Edge Function;
- modifica RLS, grants, RPC o permisos;
- modifica código, DDL, DML, migraciones, datos o Supabase;
- aprueba una decisión ejecutiva por emitir una comunicación;
- declara leído un mensaje por receipt técnico;
- declara atendida una obligación por un acuse cuando el proceso exige un efecto;
- declara recuperado un proceso porque un proveedor confirme su servicio;
- declara canal alterno si no existe evidencia de acreditación;
- convierte AURA en canal de continuidad;
- cambia severidad, BIA, MBCO, RTO, RPO, MTPD o prioridad;
- crea o modifica requisitos de prueba;
- inicia `CONT-UX-007`.

---

#### 43. Continuidad

ÚLTIMA TAREA APROBADA
`CONT-UX-005 — Diseñar seguimiento de respaldos, restauración, failover, validación y pendientes`

TAREA ACTUAL APROBADA
`CONT-UX-006 — Diseñar comunicaciones internas y externas con plantillas, canales, confirmación y escalamiento`

SIGUIENTE TAREA RESERVADA
`CONT-UX-007 — Diseñar ejercicios, revisión posterior, acciones y comprobación de readiness`


### ✅ CONT-UX-007 — Diseñar ejercicios, revisión posterior, acciones y comprobación de readiness

**Estado:** APROBADA
**Tarea anterior:** `CONT-UX-006 — Diseñar comunicaciones internas y externas con plantillas, canales, confirmación y escalamiento` — APROBADA
**Tarea siguiente:** `CONT-INT-001 — Definir contratos de criticidad, dependencia, salud, estado degradado e incidente con todas las aplicaciones` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de experiencia para planificar, conducir y observar ejercicios controlados de continuidad, ejecutar su revisión posterior, convertir hallazgos en acciones con propietario, comprobar eficacia y representar readiness por alcance, versión y evidencia sin ejecutar pruebas físicas ni fabricar capacidad demostrada
**Bloque:** AC — Continuidad operativa y recuperación
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/AC_CONTINUIDAD_OPERATIVA_Y_RECUPERACION/03_EXPERIENCIA_DE_CONTINGENCIA_Y_MANDO.md`
**Fase:** exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`
**Implementación técnica u operativa:** no autorizada
**Servicios BIA cubiertos por la experiencia:** 69 / 69
**Servicios activos sin readiness operativo acreditado en la línea base:** 67 / 67
**Servicios AURA bloqueados por aplicación diferida:** 2 / 2
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Diseñar la experiencia completa mediante la cual Vento OS permitirá preparar y seguir el programa de ejercicios de continuidad, conducir un ejercicio controlado sin confundirlo con producción, registrar resultados y desviaciones, efectuar revisión posterior, convertir hallazgos en acciones, comprobar su eficacia y determinar qué afirmación de readiness puede sostenerse con evidencia vigente.

La superficie deberá responder de forma determinista:

```text
¿QUE SERVICIO, PROCESO, SEDE O DEPENDENCIA DEBE EJERCITARSE?
¿QUE MODALIDAD CORRESPONDE Y POR QUE?
¿CUANDO VENCE LA EVIDENCIA VIGENTE?
¿QUE CAMBIO MATERIAL INVALIDO UNA PRUEBA ANTERIOR?
¿QUE VERSION DEL PLAN, RUNBOOK, OBJETIVO Y DEPENDENCIAS SE ESTA PROBANDO?
¿QUE PARTICIPANTES Y FUNCIONES SON NECESARIOS?
¿QUE AUTORIDAD ES REAL Y CUAL ES SOLO SIMULADA?
¿QUE NO DEBE TOCARSE EN PRODUCCION?
¿QUE ESCENARIO E INYECTORES SE UTILIZAN?
¿QUE RESULTADO SE ESPERABA Y QUE OCURRIO REALMENTE?
¿QUE TIEMPOS Y PERDIDAS SE OBSERVARON?
¿QUE DESVIACIONES, PENDIENTES Y BLOQUEOS APARECIERON?
¿QUE HALLAZGO ESTA RESPALDADO POR EVIDENCIA?
¿QUE SIGUE SIENDO HIPOTESIS O DESCONOCIDO?
¿QUE ACCION RESULTA, QUIEN ES SU PROPIETARIO Y CUAL ES SU CONDICION DE SALIDA?
¿LA ACCION FUE IMPLEMENTADA?
¿SU EFICACIA FUE DEMOSTRADA?
¿QUE VERSIONES DEL PLAN O RUNBOOK DEBEN ACTUALIZARSE?
¿QUE READINESS PUEDE AFIRMARSE HOY Y PARA QUE ALCANCE EXACTO?
```

La frontera principal es obligatoria:

```text
PLAN ESPECIFICADO
!= EJERCICIO PROGRAMADO
!= EJERCICIO EJECUTADO
!= EVIDENCIA COMPLETA
!= RESULTADO ACEPTABLE
!= ACCION IMPLEMENTADA
!= ACCION EFICAZ
!= EVIDENCIA VIGENTE
!= READINESS DEMOSTRADO
!= CERTIFICACION INTEGRAL
```

---

#### 2. Resultado sustantivo

Quedan materializados los siguientes resultados documentales:

1. una arquitectura UX con cinco contextos coordinados: preparación/readiness, planificación, ejercicio controlado, revisión/acciones y evidencia histórica;
2. una vista ejecutiva de readiness que separa cobertura documental, evidencia vigente, vencimientos, invalidaciones, acciones abiertas y bloqueos;
3. un calendario rodante que consume las ventanas aprobadas por criticidad sin inventar fechas de ejecuciones inexistentes;
4. una ficha de cobertura por servicio que conserva la obligación de ejercicio de `CONT-DOM-014`, la versión de alcance, la última evidencia aplicable y el próximo vencimiento cuando pueda calcularse;
5. una experiencia de planificación que resuelve modalidad, escenario, alcance, objetivos, participantes funcionales, precondiciones, seguridad, evidencias y criterios de abortado antes de iniciar;
6. reutilización exacta de las seis modalidades documentales: walkthrough documental, tabletop de decisión, simulación técnica controlada, restauración aislada, ejercicio operativo y ejercicio integrado;
7. una experiencia de conducción con contexto no productivo persistente, cronología, inyectores, decisiones, observaciones, bloqueos, tiempos y evidencia;
8. una separación estricta entre autoridad simulada y autoridad productiva;
9. una regla que impide transformar la participación en un ejercicio en permiso, break-glass, acceso o aprobación real;
10. una experiencia de seguridad y abortado que prioriza SST, inocuidad, seguridad, privacidad, integridad, autorización y protección de producción;
11. una ficha de resultado por servicio/proceso que compara resultado esperado y observado sin convertir objetivo en resultado;
12. una vista de tiempos que permite comparar mediciones reales, cuando existan, con RTO, RPO y MTPD aplicables sin fabricar timestamps;
13. una vista específica de restore aislado que separa integridad técnica, compatibilidad, tiempo observado, validación funcional y pendientes;
14. una vista específica de operación manual/offline que exige evidencia, custodia, idempotencia, reincorporación y conciliación aplicables;
15. una vista específica de failover/retorno que permanece bloqueada para ejecución mientras no exista capacidad habilitada y acreditada;
16. una vista específica de alternativas físicas o de proveedor que distingue tabletop de una capacidad operativa realmente acreditada;
17. un catálogo UX de las catorce familias de escenario aprobadas;
18. una experiencia de revisión posterior basada en hechos y evidencia, no en memoria retrospectiva ni atribución automática de culpa;
19. proyección completa del contrato de revisión posterior de `CONT-DOM-015`;
20. separación entre observación, desviación, hipótesis de causa, causa confirmada, desconocido, hallazgo y lección;
21. una bandeja de hallazgos que preserva riesgo, evidencia, alcance y destino documental;
22. una bandeja de acciones con propietario funcional, ejecutor cuando sea distinto, dominio, prioridad, alcance, vencimiento o condición, dependencias, condición de salida y evidencia;
23. una regla visible `ACCION_IMPLEMENTADA != ACCION_EFICAZ`;
24. una experiencia de comprobación de eficacia mediante los nueve métodos aprobados, según riesgo y acción;
25. tratamiento explícito de acciones ineficaces, parciales, vencidas, bloqueadas o canceladas sin borrarlas del historial;
26. una vista de cambios derivados hacia BIA, dependencias, objetivos, contingencia, respaldos, runbooks, proveedores, autorización, experiencia e integraciones;
27. un modelo append-only de revisión y actualización que preserva la versión vigente al momento del ejercicio o incidente;
28. una experiencia de invalidación de evidencia ante cambios materiales;
29. una decisión de readiness por servicio, alcance y versión, nunca un booleano global sin evidencia;
30. una regla por la cual un plan sin prueba vigente no se presenta como listo;
31. una regla por la cual una acción cerrada administrativamente no restablece readiness si su eficacia no está demostrada;
32. una regla por la cual una prueba vencida o invalidada degrada la afirmación de readiness sin borrar la evidencia histórica;
33. una regla que mantiene AURA restringida a walkthrough documental de vigencia mientras su aplicación permanezca diferida;
34. una matriz explícita 69 / 69 que conserva todas las identidades del programa y proyecta su situación UX inicial sin reescribir BIA ni objetivos;
35. reconciliación explícita de 67 servicios activos, 2 AURA bloqueados y distribución BIA 12 / 20 / 31 / 6;
36. integración con `CONT-UX-006` para ejercitar comunicaciones sin emitir mensajes externos reales por defecto;
37. integración con `CONT-UX-005` para ejercicios de restore/recuperación sin confundir la superficie de ejercicios con la consola de recuperación;
38. integración con `CONT-UX-004` para ejercicios de captura/reincorporación sin ejecutar replay ciego;
39. handoffs explícitos a `CONT-INT-*`, BLOQUE U, TI, datos, información y paquetes de implementación;
40. cero ejercicios reales, cero interrupciones, cero restauraciones productivas, cero cambios Supabase y cero cambios de requisitos de prueba.

---

#### 3. Entradas canónicas consumidas

Esta tarea consume y conserva, sin redefinirlas:

- `VPROC-0062`, como proceso transversal propietario del expediente de continuidad;
- `CONT-DOM-001`, para gobierno federado, prueba antes de confianza, evidencia y mantenimiento;
- `CONT-DOM-002` a `CONT-DOM-004`, para servicios BIA, dependencias, perfiles `CONT-OBJ-*`, MTPD, RTO, RPO, MBCO y prioridad;
- `CONT-DOM-005` y `CONT-DOM-006`, para incidentes, mando, decisiones, bitácora y comunicación;
- `CONT-DOM-007` a `CONT-DOM-010`, para operación mínima, contingencia, captura, reincorporación y conciliación;
- `CONT-DOM-011` a `CONT-DOM-013`, para respaldo, recuperación, failover, proveedores, energía, red, pagos, transporte, canales y alternativas;
- `CONT-DOM-014`, como fuente propietaria del programa recurrente de ejercicios, sus seis modalidades, ventanas, disparadores, catorce familias de escenario y cobertura 69 / 69;
- `CONT-DOM-015`, como fuente propietaria del ciclo de revisión, hallazgos, lecciones, acciones, eficacia, invalidación y mantenimiento versionado;
- `CONT-AUTH-001`, para autoridad real frente a simulada;
- `CONT-AUTH-002`, para impedir que un ejercicio cree acceso extraordinario o break-glass productivo;
- `CONT-AUTH-003`, para protección de runbooks, contactos, evidencia, formularios y datos sensibles;
- `CONT-AUTH-004`, para separación entre ejecución, validación, reincorporación, conciliación, cierre, revisión posterior y certificación de eficacia;
- `CONT-UX-001` y `CONT-UX-002`, para situación, impacto, mando, decisiones, cronología y bloqueos;
- `CONT-UX-003`, para experiencia de runbooks y checklists;
- `CONT-UX-004`, para captura controlada, estados inciertos, reincorporación y conciliación;
- `CONT-UX-005`, para respaldo, restore, failover, validación y pendientes;
- `CONT-UX-006`, para plantillas, canales, confirmación y escalamiento de comunicaciones;
- los contratos no funcionales vigentes de recuperación, observabilidad, hardware y certificación;
- la cobertura de requisitos vigente que ya exige ejercicios, evidencia, revisión, acciones, eficacia y readiness antes de confianza.

La tarea no modifica identidades, propietarias, BIA, `CONT-OBJ-*`, MTPD, RTO, RPO, MBCO, prioridades, estrategias, autorizaciones, ventanas del programa ni estados de aplicación.

---

#### 4. Fronteras obligatorias de experiencia

La interfaz conserva como invariantes:

```text
DOCUMENTO VIGENTE != EJERCICIO VIGENTE
EJERCICIO EJECUTADO != EJERCICIO ACEPTABLE
RESULTADO TECNICO != RESULTADO EMPRESARIAL
RESULTADO ESPERADO != RESULTADO OBSERVADO
OBSERVACION != HALLAZGO
HIPOTESIS != CAUSA CONFIRMADA
HALLAZGO != LECCION
LECCION != ACCION
ACCION ASIGNADA != ACCION IMPLEMENTADA
ACCION IMPLEMENTADA != ACCION EFICAZ
DOCUMENTO ACTUALIZADO != READINESS
READINESS DE UN SERVICIO != READINESS GLOBAL
READINESS DE UN ALCANCE != CERTIFICACION INTEGRAL
AUTORIDAD SIMULADA != AUTORIDAD PRODUCTIVA
PARTICIPANTE DEL EJERCICIO != ACTOR AUTORIZADO EN PRODUCCION
FIN DEL EJERCICIO != CIERRE DEL INCIDENTE
```

Un color, porcentaje, score o mensaje de éxito nunca puede eliminar estas diferencias.

---

#### 5. Arquitectura de experiencia

La experiencia se divide en cinco contextos complementarios:

| Contexto                | Objetivo                                                    | Puede mostrar                                                                                       | No puede afirmar                                        |
| ----------------------- | ----------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | ------------------------------------------------------- |
| preparación y readiness | conocer cobertura, vencimientos, evidencia e invalidaciones | obligación, última evidencia, brecha, siguiente modalidad y propietario                             | capacidad real si la evidencia no existe o venció       |
| planificación           | preparar un ejercicio concreto                              | modalidad, escenario, alcance, versiones, objetivos, participantes, seguridad y evidencia requerida | que el ejercicio ocurrió                                |
| ejercicio controlado    | conducir y observar una ejecución autorizada                | inyectores, decisiones, tiempos, desviaciones, evidencia, bloqueos y abortado                       | resultado no observado o autoridad productiva implícita |
| revisión y acciones     | convertir evidencia en aprendizaje y tratamiento            | observaciones, hallazgos, lecciones, acciones, eficacia y cambios derivados                         | causa o eficacia sin evidencia                          |
| historial               | reconstruir versiones, ejercicios, revisiones y acciones    | evidencia, relaciones, invalidaciones y decisiones previas                                          | que una evidencia histórica siga vigente                |

Las cinco vistas consumen las mismas identidades y fuentes propietarias; no crean un segundo programa de continuidad.

---

#### 6. Mapa de navegación

```text
CONTINUIDAD
└─ Ejercicios y readiness
   ├─ Readiness
   │  ├─ Cobertura por servicio
   │  ├─ Vencimientos e invalidaciones
   │  ├─ Bloqueos y acciones
   │  └─ Evidencia vigente
   ├─ Programa de ejercicios
   │  ├─ Calendario rodante
   │  ├─ Escenarios
   │  └─ Cobertura 69 / 69
   ├─ Planificar ejercicio
   │  ├─ Modalidad
   │  ├─ Alcance y versiones
   │  ├─ Objetivos y criterios
   │  ├─ Participantes y autoridad
   │  ├─ Seguridad y abortado
   │  └─ Evidencia requerida
   ├─ Conducir ejercicio
   │  ├─ Cronología
   │  ├─ Inyectores
   │  ├─ Decisiones
   │  ├─ Observaciones
   │  ├─ Tiempos
   │  └─ Evidencia
   ├─ Revisión posterior
   │  ├─ Esperado vs observado
   │  ├─ Desviaciones
   │  ├─ Hallazgos y lecciones
   │  └─ Riesgo residual
   ├─ Acciones y eficacia
   └─ Historial
```

Poder abrir una vista no concede autoridad para iniciar una interrupción, restauración, conmutación, comunicación externa o modificación productiva.

---

#### 7. Encabezado persistente de un ejercicio

Durante planificación o conducción se conserva un encabezado compacto con:

```text
exercise_ref
contexto: EJERCICIO / SIMULACION / NO PRODUCTIVO
modalidad
escenario
alcance
servicios y procesos
sedes o dependencias cuando apliquen
versiones del plan y runbook
objetivos empresariales aplicables
responsable de continuidad
director/conductor del ejercicio
funcion efectiva del actor
autoridad simulada / autoridad real
estado de seguridad
hora de inicio observada cuando exista
proximo hito
bloqueos
```

Si no existe una ejecución real, los tiempos de ejecución permanecen vacíos o no aplicables; la interfaz no fabrica una cronología.

---

#### 8. Modalidades de ejercicio reutilizadas

Las modalidades se presentan exactamente como categorías documentales y no como nuevos enums persistentes:

| Modalidad                     | Enfoque UX                                                                            | Evidencia que puede producir                                                  | Límite                                            |
| ----------------------------- | ------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | ------------------------------------------------- |
| walkthrough documental        | recorrer plan, roles, dependencias, contactos, runbooks y handoffs                    | comprensión, contradicciones, faltantes, vigencia documental                  | no demuestra capacidad bajo presión               |
| tabletop de decisión          | resolver inyectores y decisiones sin intervenir producción                            | mando, priorización, escalamiento, comunicación y límites                     | no demuestra infraestructura                      |
| simulación técnica controlada | reproducir estados técnicos controlados/no destructivos                               | detección, aislamiento, observabilidad, degradación, compatibilidad, abortado | no demuestra recuperación empresarial por sí sola |
| restauración aislada          | recuperar fuente/configuración en ambiente separado                                   | integridad, versión, punto, tiempo observado y pasos técnicos                 | no demuestra MBCO ni pendientes en cero           |
| ejercicio operativo           | ejecutar personas, procedimiento, medios y handoffs controlados                       | capacidad humana/operativa, MBCO, tiempos, custodia, pendientes               | no acredita recursos fuera del alcance            |
| ejercicio integrado           | combinar mando, comunicación, degradación, restore, operación, retorno y conciliación | comportamiento extremo a extremo del alcance declarado                        | no cubre automáticamente otros servicios o sedes  |

---

#### 9. Semántica de readiness

`readiness` se presenta como una conclusión sustentada por alcance y versión, no como un interruptor global.

Para la línea base actual:

- los 67 servicios activos conservan **programa especificado sin ejecución acreditada** y, por tanto, la UX no muestra readiness operativo demostrado;
- los 2 servicios AURA permanecen `BLOQUEADO_POR_APLICACION_DIFERIDA`;
- el sistema conserva **0 servicios con readiness validado** hasta que exista evidencia real posterior.

La interfaz puede usar rótulos humanos como “evidencia faltante”, “evidencia vigente”, “vencida”, “invalidada” o “bloqueada” únicamente como presentación de hechos propietarios. No crea un catálogo persistente paralelo.

Una afirmación positiva de readiness requiere, para el alcance exacto:

1. modalidades exigibles ejecutadas dentro de sus ventanas aplicables;
2. evidencia vinculada con versión y alcance;
3. ausencia de invalidación posterior por cambio material;
4. resultado funcional suficiente para el MBCO o condición protectora aplicable;
5. mediciones requeridas disponibles cuando el criterio dependa de tiempo o pérdida;
6. validación funcional propietaria;
7. pendientes materiales representados y sin bloqueo incompatible con la afirmación;
8. hallazgos críticos tratados o con decisión de riesgo permitida por su propietario;
9. acciones cuya eficacia sea necesaria para restaurar confianza efectivamente verificadas;
10. seguridad, autorización, privacidad, custodia y segregación satisfechas;
11. evidencia disponible y trazable;
12. revisión por continuidad y propietario del proceso sobre la misma versión.

---

#### 10. Calendario rodante y vencimientos

La UX consume, sin redefinir, estas dimensiones del programa:

```text
last_walkthrough_at
last_tabletop_at
last_operational_exercise_at
last_restore_exercise_at cuando aplique
last_integrated_exercise_at cuando aplique
last_material_change_at
next_due_at por modalidad aplicable
exercise_scope_version
current_evidence_state
invalidation_reason cuando aplique
```

Reglas:

1. ausencia de fecha real no se sustituye por la fecha de aprobación documental;
2. `next_due_at` se muestra solo cuando pueda derivarse de una evidencia real y una ventana aprobada;
3. un cambio material posterior puede invalidar una evidencia antes de su vencimiento temporal;
4. el calendario diferencia “debe realizarse” de “está programado”;
5. una programación sin participantes, ambiente o precondiciones no se presenta como ejecución garantizada;
6. los vencimientos se agrupan por servicio, modalidad y riesgo sin perder identidad.

---

#### 11. Ventanas heredadas por criticidad

La interfaz conserva las ventanas aprobadas de `CONT-DOM-014`:

| BIA / perfil                            | Cobertura mínima                                                                                     | Ventana de experiencia                                                                                                           |
| --------------------------------------- | ---------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `CRITICA_PROTECCION` / `CONT-OBJ-001`   | walkthrough + tabletop + ejercicio operativo; simulación/restauración cuando la dependencia lo exija | decisión ≤ 6 meses; ejercicio operativo ≤ 12 meses; restauración ≤ 6 meses cuando exista afirmación de recuperabilidad crítica   |
| `CRITICA_OPERACIONAL` / `CONT-OBJ-002`  | walkthrough + tabletop + ejercicio operativo; simulación/restauración cuando la dependencia lo exija | decisión y ejercicio ≤ 12 meses; restauración ≤ 12 meses cuando aplique                                                          |
| `ALTA_CONTROL` / `CONT-OBJ-003`         | walkthrough + tabletop; ejercicio operativo o restauración dirigido por dependencia y riesgo         | revisión/decisión ≤ 12 meses; ejercicio integral ≤ 24 meses; restauración ≤ 12 meses cuando exista afirmación de recuperabilidad |
| `DIFERIBLE_CONTROLADA` / `CONT-OBJ-004` | walkthrough; tabletop o ejercicio operativo dirigido por escenario y riesgo                          | revisión ≤ 12 meses; ejercicio ≤ 24 meses; restauración ≤ 24 meses cuando aplique                                                |
| AURA diferida                           | walkthrough documental de vigencia                                                                   | revisar ante cambio de estado; no inicia ventana de readiness operativo                                                          |

Estas ventanas gobiernan antigüedad máxima de evidencia aplicable; no generan automáticamente fechas históricas.

---

#### 12. Invalidación por cambio material

La experiencia presenta una evidencia como potencialmente invalidada cuando exista un cambio material posterior que afecte su alcance, incluyendo, cuando corresponda:

- BIA, MTPD, RTO, RPO o MBCO;
- propietario, mando, suplencia o función crítica;
- sede o capacidad física;
- aplicación, arquitectura, base, Storage, integración o fuente de verdad;
- runbook, procedimiento, formulario o mecanismo de contingencia;
- proveedor, contrato, canal o recurso alternativo;
- autorización, segregación, privacidad o controles protectores;
- configuración técnica que cambie el comportamiento probado;
- incidente o ejercicio posterior que contradiga el resultado previo;
- hallazgo de integridad, seguridad o reconciliación material.

La invalidación conserva la evidencia histórica y añade razón, alcance afectado, propietario de reevaluación y siguiente modalidad necesaria.

---

#### 13. Planificador de ejercicio

Antes de marcar un ejercicio como preparado, la superficie debe resolver:

| Grupo          | Información mínima                                                                       |
| -------------- | ---------------------------------------------------------------------------------------- |
| identidad      | referencia, título y modalidad                                                           |
| origen         | programa, vencimiento, cambio material, hallazgo o necesidad                             |
| alcance        | servicios, procesos, sedes, dependencias, aplicaciones y terceros                        |
| baseline       | versiones de plan, runbook, BIA, objetivos, contratos y configuraciones que se evaluarán |
| escenario      | familia, narrativa, supuestos e inyectores                                               |
| objetivos      | resultados observables que se pretende evaluar                                           |
| participantes  | funciones requeridas y observadores                                                      |
| autoridad      | qué es simulado y qué acción real requeriría autorización independiente                  |
| ambiente       | documental, sandbox, staging, aislado u otro ambiente autorizado                         |
| datos          | tipo y sensibilidad de los datos permitidos                                              |
| seguridad      | controles, prohibiciones y criterios de abortado                                         |
| comunicaciones | si se simulan, plantillas/audiencias/canales y bloqueo de emisión real                   |
| evidencia      | qué debe conservarse y por quién                                                         |
| tiempos        | relojes que realmente pueden medirse                                                     |
| cierre         | criterios para terminar el ejercicio y transferir a revisión posterior                   |

Un campo obligatorio no resoluble produce bloqueo visible; no se completa con supuestos implícitos.

---

#### 14. Participantes, funciones y segregación

La UX distingue:

- conductor/director del ejercicio;
- responsable de continuidad;
- propietario de proceso;
- ejecutor operativo;
- ejecutor técnico;
- validador técnico;
- validador funcional;
- responsable de protección aplicable;
- responsable de comunicaciones;
- custodio de evidencia;
- observador;
- autoridad ejecutiva cuando una decisión real la requiera;
- proveedor o tercero participante.

La misma persona puede ejercer varias funciones en una organización pequeña, pero la interfaz conserva cada función y muestra cualquier concentración que afecte independencia. Participar, observar, ejecutar un paso o preparar una decisión no concede autoridad para certificar su propia eficacia cuando el contrato exige segregación.

---

#### 15. Autoridad simulada y autoridad real

La pantalla mantiene una banda persistente:

```text
CONTEXTO DE EJERCICIO
AUTORIDAD SIMULADA NO PRODUCE EFECTOS PRODUCTIVOS
```

Reglas:

1. una aprobación simulada no produce una aprobación real;
2. una identidad de ejercicio no concede permisos productivos;
3. break-glass productivo no se ensaya reutilizando una credencial real salvo autorización específica futura;
4. una decisión que requiera efecto real debe salir de la superficie de simulación y resolver autoridad productiva de nuevo;
5. un proveedor participante no obtiene autoridad empresarial;
6. un ejercicio no crea una excepción permanente de seguridad;
7. las acciones observadas se etiquetan por contexto para evitar contaminación de auditoría productiva.

---

#### 16. Seguridad, protección y abortado

La experiencia debe hacer visibles antes y durante el ejercicio:

- entorno autorizado;
- recursos reales o simulados;
- efectos externos bloqueados;
- datos permitidos;
- controles SST, inocuidad, seguridad, privacidad y autorización;
- límites de impacto;
- condición de parada;
- responsable que puede detener por protección;
- canal de escalamiento;
- estado de aislamiento;
- rollback o restauración del ambiente de ejercicio cuando aplique.

Una parada protectora puede ser el resultado correcto. La interfaz no penaliza un ejercicio por detenerse cuando continuar violaría un control no dispensable.

---

#### 17. Catálogo de catorce familias de escenario

|    # | Familia                                             | Modalidad mínima / tratamiento UX                                                 |
| ---: | --------------------------------------------------- | --------------------------------------------------------------------------------- |
|    1 | pérdida de mando o persona clave                    | walkthrough + tabletop                                                            |
|    2 | indisponibilidad de sede o energía                  | tabletop + ejercicio operativo; simulación física solo con autorización posterior |
|    3 | pérdida de red o conectividad                       | tabletop + simulación técnica + ejercicio operativo según alcance                 |
|    4 | indisponibilidad de aplicación o backend            | simulación técnica + ejercicio operativo                                          |
|    5 | restauración de datos o configuración               | restauración aislada + validación funcional                                       |
|    6 | dispositivo, impresora o periférico indisponible    | walkthrough + simulación/ejercicio operativo cuando exista recurso real           |
|    7 | proveedor de pago indisponible o resultado incierto | tabletop + simulación contractual/controlada                                      |
|    8 | proveedor o canal de mensajería indisponible        | tabletop + simulación controlada                                                  |
|    9 | transporte o recurso logístico indisponible         | tabletop + ejercicio operativo                                                    |
|   10 | proveedor crítico de insumo o servicio indisponible | tabletop; ejercicio operativo solo con recurso acreditado                         |
|   11 | operación manual u offline y reincorporación        | walkthrough + ejercicio operativo                                                 |
|   12 | failover y retorno                                  | simulación técnica + ejercicio operativo solo cuando exista capacidad habilitada  |
|   13 | alternativa física o proveedor sustituto            | tabletop; ejercicio operativo únicamente con alternativa acreditada               |
|   14 | escenario integrado multidominio                    | tabletop + simulación/restauración/operativo según alcance                        |

La experiencia conserva los bloqueos actuales: failover/retorno no se presenta como ejecutable sin capacidad habilitada y la alternativa física/proveedor no se presenta como ejercitable operacionalmente sin acreditación.

---

#### 18. Cronología e inyectores

La vista de conducción separa:

```text
scheduled_at
started_at real
inject_released_at
decision_recorded_at
action_observed_at
evidence_captured_at
checkpoint_reached_at
abort_at cuando aplique
ended_at real
review_opened_at
```

Cada inyector conserva:

- identidad;
- objetivo de aprendizaje;
- momento o condición de liberación;
- información entregada;
- audiencia funcional;
- respuesta esperada únicamente como criterio, no como guion obligatorio;
- respuesta observada;
- desviación;
- evidencia;
- impacto sobre siguientes inyectores;
- condición de abortado si aplica.

La interfaz no altera un timestamp para hacer coincidir el ejercicio con el objetivo.

---

#### 19. Walkthrough documental

La vista de walkthrough recorre, como mínimo:

- versión del plan y runbook;
- propietario y suplencia;
- servicios/procesos y alcance;
- objetivos BIA aplicables;
- dependencias y terceros;
- contactos por referencia protegida;
- precondiciones;
- pasos;
- formularios/medios;
- controles de autorización y seguridad;
- comunicación;
- validación funcional y conciliación;
- evidencia;
- abortado;
- handoffs;
- cambios materiales desde la última revisión.

Resultado UX posible: contradicción, faltante, versión dudosa, dependencia sin propietario, referencia no resoluble o recorrido documental satisfactorio. Ninguno de estos resultados acredita ejecución física.

---

#### 20. Tabletop de decisión

La experiencia de tabletop prioriza decisiones sobre pasos mecánicos:

```text
inyector
→ interpretación del impacto
→ severidad/alcance según escenario
→ prioridad y dependencia
→ decisión propuesta
→ autoridad simulada
→ comunicación simulada
→ siguiente inyector
→ evidencia de razonamiento
```

La pantalla registra qué información estaba disponible al decidir. No evalúa a posteriori una decisión usando datos que los participantes todavía no conocían en ese punto del escenario.

---

#### 21. Simulación técnica controlada

La vista técnica conserva:

- ambiente y aislamiento;
- fallo o degradación simulada;
- señales esperadas;
- señales observadas;
- detección;
- aislamiento;
- observabilidad;
- reintentos;
- compatibilidad;
- degradación segura;
- decisión de abortado;
- evidencia;
- validación técnica;
- handoff funcional.

Un resultado técnico favorable no eleva automáticamente el resultado empresarial del servicio.

---

#### 22. Restauración aislada

La experiencia consume `CONT-UX-005` y presenta:

- objeto/grupo recuperable;
- punto seleccionado;
- integridad;
- compatibilidad;
- ambiente aislado;
- efectos externos bloqueados;
- hora real de inicio y fin cuando existan;
- tiempo observado;
- validación técnica;
- validación funcional;
- hechos posteriores al punto;
- pendientes;
- conciliación requerida;
- evidencia.

La restauración aislada no se presenta como prueba de recuperación total si no cubre proceso, MBCO y pendientes aplicables.

---

#### 23. Ejercicio operativo

La vista operativa se centra en:

- resultado mínimo a mantener o proteger;
- personas y funciones;
- sede/área real del ejercicio;
- medio normal y contingente;
- pasos y límites;
- folios, registros o evidencia;
- capacidad observada;
- cola/backlog;
- tiempos;
- handoffs;
- decisiones;
- seguridad;
- trabajo pendiente;
- reincorporación;
- conciliación;
- validación propietaria.

La UX diferencia ejercicio controlado de operación productiva y evita que un registro de prueba se mezcle con hechos reales.

---

#### 24. Ejercicio integrado

El ejercicio integrado presenta un grafo de dominios y checkpoints, no una lista plana.

Debe permitir observar:

- mando y autoridad;
- comunicaciones;
- dependencias;
- operación mínima;
- degradación;
- recuperación técnica;
- validación funcional;
- trabajo contingente;
- reincorporación;
- conciliación;
- proveedores;
- dispositivos;
- retorno;
- pendientes;
- cierre del ejercicio;
- transferencia a revisión.

Una rama independiente puede avanzar sin ocultar el bloqueo de otra.

---

#### 25. Comparación de objetivos y resultados

La superficie separa:

| Dimensión | Objetivo                         | Resultado observado                                       | Regla                                                       |
| --------- | -------------------------------- | --------------------------------------------------------- | ----------------------------------------------------------- |
| MTPD      | límite máximo tolerable          | duración real cuando exista                               | no se presume cumplimiento por terminar antes si faltó MBCO |
| RTO       | objetivo hasta MBCO verificado   | tiempo real hasta validación funcional aplicable          | no se mide hasta un simple health técnico                   |
| RPO       | pérdida temporal objetivo        | edad/pérdida del punto realmente utilizado cuando aplique | no se infiere desde frecuencia nominal                      |
| MBCO      | resultado mínimo                 | resultado funcional validado                              | requiere propietaria                                        |
| WRT       | trabajo posterior a recuperación | tiempo observado cuando exista contrato y evidencia       | no se inventa valor objetivo                                |

Cuando un reloj es incierto, la incertidumbre permanece en el resultado.

---

#### 26. Resultado por servicio y proceso

Cada servicio incluido en un ejercicio conserva:

```text
service_id
process_id
exercise_ref
scope_version
expected_business_result
observed_business_result
protection_result
technical_result
functional_validation
observed_times
pending_items
reconciliation_state
evidence_refs
owner_function
deviations
readiness_effect
```

`readiness_effect` es una conclusión derivada de la evidencia propietaria de revisión, no un estado que el ejecutor técnico pueda autoasignar.

---

#### 27. Evidencia del ejercicio

La experiencia debe poder referenciar:

- escenario y versión;
- participantes y funciones;
- baseline documental;
- inyectores;
- decisiones;
- timestamps reales;
- capturas o logs autorizados;
- receipts;
- formularios;
- resultados técnicos;
- validaciones funcionales;
- pendientes;
- incidentes de seguridad ocurridos durante el ejercicio;
- abortado;
- cierre del ejercicio;
- evidencia de revisión posterior.

El contenido sensible permanece en su repositorio o superficie propietaria; el tablero usa referencias protegidas.

---

#### 28. Revisión posterior

La revisión se abre desde un incidente, ejercicio, restauración, cambio, auditoría, vencimiento o nueva evidencia, preservando el hecho original.

Cada revisión material debe proyectar los veinte campos heredados:

| Campo                      | Tratamiento UX                       |
| -------------------------- | ------------------------------------ |
| `review_id`                | identidad estable                    |
| `trigger_type`             | origen de la revisión                |
| `source_ref`               | referencia al hecho original         |
| `scope`                    | alcance afectado                     |
| `baseline_version_refs[]`  | versiones usadas para comparar       |
| `observed_evidence_refs[]` | evidencia preservada                 |
| `expected_result`          | expectativa vigente al momento       |
| `observed_result`          | hecho observado sin reescritura      |
| `deviations[]`             | diferencias                          |
| `cause_hypotheses[]`       | hipótesis explícitas                 |
| `confirmed_causes[]`       | causas confirmadas con evidencia     |
| `unknowns[]`               | incertidumbres abiertas              |
| `findings[]`               | hallazgos y riesgo                   |
| `lessons[]`                | lecciones confirmadas o descartadas  |
| `action_refs[]`            | acciones resultantes                 |
| `residual_risk`            | riesgo remanente                     |
| `plan_change_refs[]`       | cambios/versiones derivados          |
| `review_state`             | estado propietario de la revisión    |
| `review_authority`         | función que puede concluirla         |
| `closed_at`                | fecha real solo cuando exista cierre |

---

#### 29. Regla de revisión basada en hechos

La experiencia obliga a separar:

```text
HECHO
→ lo que la evidencia demuestra

OBSERVACION
→ dato observado durante el evento

DESVIACION
→ diferencia contra expectativa vigente

HIPOTESIS
→ explicación todavía no demostrada

CAUSA CONFIRMADA
→ explicación respaldada por evidencia suficiente

HALLAZGO
→ condición relevante derivada del análisis

LECCION
→ aprendizaje aceptado o descartado con razón

ACCION
→ tratamiento asignado a propietario

EFICACIA
→ evidencia posterior de que el tratamiento produjo el control esperado
```

La pantalla no ofrece un campo “causa raíz” obligatorio que fuerce una conclusión ficticia.

---

#### 30. Revisión sin culpa automática

La revisión se diseña para reconstruir sistema, contexto y decisiones.

Debe permitir analizar:

- información disponible al momento;
- versión del procedimiento;
- carga y capacidad;
- dependencias;
- herramientas;
- autoridad;
- comunicación;
- entrenamiento;
- controles;
- fallos técnicos;
- factores humanos y ambientales;
- terceros;
- evidencia faltante;
- decisiones adecuadas que no produjeron el resultado esperado.

La revisión de continuidad no sustituye procesos laborales, disciplinarios, SST, seguridad, privacidad o cumplimiento cuando estos sean aplicables.

---

#### 31. Hallazgos y lecciones

Cada hallazgo visible conserva:

- referencia estable;
- revisión origen;
- evidencia;
- riesgo;
- alcance;
- condición observada;
- propietario de tratamiento;
- relación con requisitos/contratos cuando aplique;
- estado;
- acción o disposición resultante.

Una lección no se trata como mejora hasta existir acción o decisión de no actuar con justificación y autoridad aplicable.

---

#### 32. Contrato UX de acciones

Toda acción material proyecta los dieciséis campos heredados:

| Campo                     | Tratamiento UX                                       |
| ------------------------- | ---------------------------------------------------- |
| `action_id`               | identidad estable                                    |
| `finding_refs[]`          | hallazgos tratados                                   |
| `lesson_refs[]`           | lecciones materializadas                             |
| `owner_function`          | responsable interno del resultado                    |
| `execution_owner`         | ejecutor cuando sea distinto                         |
| `domain_owner`            | contrato/proceso/dominio de implementación           |
| `priority`                | derivada de riesgo y criticidad                      |
| `scope`                   | servicios/procesos/sedes/aplicaciones/terceros       |
| `target_at_or_condition`  | fecha objetivo real o condición verificable          |
| `dependencies[]`          | prerrequisitos/bloqueos                              |
| `expected_control_result` | resultado de control esperado                        |
| `exit_condition`          | condición verificable de implementación              |
| `efficacy_method`         | método de comprobación                               |
| `evidence_refs[]`         | evidencia de implementación y eficacia diferenciadas |
| `residual_risk`           | riesgo restante                                      |
| `state`                   | estado propietario actual                            |

Una acción sin propietario o sin condición de salida no aparece como cerrable.

---

#### 33. Bandeja de acciones

La bandeja permite vistas por intención:

| Vista                                  | Contenido                                                          | Límite                                      |
| -------------------------------------- | ------------------------------------------------------------------ | ------------------------------------------- |
| `POR_ASIGNAR`                          | hallazgos que requieren acción y carecen de propietario resoluble  | no se ocultan en el total general           |
| `ABIERTAS`                             | acciones vigentes no implementadas                                 | no equivalen a control existente            |
| `BLOQUEADAS`                           | dependencia/insumo impide avanzar                                  | muestra propietario del bloqueo             |
| `VENCIDAS`                             | superaron fecha/condición objetivo                                 | permanecen visibles y escalan según impacto |
| `IMPLEMENTADAS_PENDIENTES_DE_EFICACIA` | condición de implementación satisfecha, eficacia aún no demostrada | no restaura readiness por sí sola           |
| `EFICACIA_NO_DEMOSTRADA`               | método ejecutado sin evidencia suficiente o resultado inconcluso   | exige siguiente decisión                    |
| `INEFICACES_O_PARCIALES`               | tratamiento no produjo el control esperado completo                | conserva riesgo residual                    |
| `EFICACES`                             | eficacia demostrada para alcance y riesgo definidos                | no implica readiness de otros alcances      |

Estas etiquetas son categorías de vista y no nuevos estados persistentes.

---

#### 34. Comprobación de eficacia

La UX soporta los nueve métodos heredados:

1. `REEJERCICIO_CONTROLADO`;
2. `RESTAURACION_AISLADA`;
3. `PRUEBA_TECNICA`;
4. `PRUEBA_FUNCIONAL`;
5. `PRUEBA_DE_RECONCILIACION`;
6. `INSPECCION_DOCUMENTADA`;
7. `EVIDENCIA_OPERATIVA`;
8. `REVISION_DE_CONFIGURACION`;
9. `VALIDACION_DE_TERCERO_CORRELACIONADA`.

Cada comprobación muestra:

```text
accion
riesgo que pretende reducir
resultado de control esperado
metodo
alcance
version
evidencia previa
evidencia posterior
resultado observado
desviacion
riesgo residual
validador
segregacion aplicable
decision sobre eficacia
siguiente accion
```

Cuando el método exige un nuevo ejercicio, la experiencia vuelve al planificador de ejercicios sin cerrar la acción antes de obtener evidencia.

---

#### 35. Acciones ineficaces, parciales o bloqueadas

Tratamiento obligatorio:

- **ineficaz:** conserva implementación realizada, evidencia y riesgo; crea nueva decisión de tratamiento;
- **parcial:** distingue parte efectiva de parte pendiente;
- **vencida:** conserva propietario, motivo y escalamiento;
- **bloqueada:** identifica dependencia, propietario del bloqueo y condición de salida;
- **cancelada:** exige razón y autoridad; no borra el hallazgo;
- **superseded:** conserva relación con la acción sucesora;
- **eficacia inconclusa:** no se eleva a eficaz por ausencia de fallo.

---

#### 36. Cambios derivados y mantenimiento

La revisión puede generar impactos hacia:

- política de continuidad;
- BIA y criticidad;
- MTPD, RTO, RPO, MBCO;
- dependencias;
- estrategias de contingencia;
- formularios y medios manuales;
- respaldo y recuperación;
- runbooks;
- proveedores y alternativas;
- mando y autorizaciones;
- comunicaciones;
- experiencia;
- integraciones;
- observabilidad;
- capacitación;
- calendario de ejercicios.

La experiencia crea referencias de cambio, no edita silenciosamente otras fuentes desde la revisión. El propietario correspondiente debe materializar el cambio en su contrato.

---

#### 37. Readiness por alcance

La vista de readiness se calcula conceptualmente como una conclusión de evidencia, nunca como un porcentaje de checklist.

Cada ficha muestra:

```text
servicio / proceso
alcance / sede / dependencia
BIA / CONT-OBJ
version de alcance
modalidades exigibles
ultima evidencia por modalidad
vencimientos
cambios materiales posteriores
objetivos observados
validacion funcional
hallazgos materiales
acciones requeridas
eficacia requerida
riesgo residual
bloqueos
conclusion soportable
evidencia
propietario
```

La conclusión positiva se limita estrictamente al alcance probado. Un ejercicio integrado exitoso no certifica servicios o sedes fuera de su alcance.

---

#### 38. Condiciones que impiden afirmar readiness

La superficie impide una apariencia de readiness sano cuando exista cualquiera de estas condiciones materiales:

- modalidad obligatoria sin ejecución vigente;
- evidencia vencida;
- evidencia invalidada por cambio material;
- versión probada diferente de la versión actual sin análisis de vigencia;
- resultado funcional no validado;
- restore técnico sin validación empresarial cuando aplique;
- RTO/RPO/MTPD requerido sin evidencia suficiente;
- MBCO no demostrado;
- control protector fallido;
- hallazgo crítico abierto;
- acción crítica sin propietario;
- acción crítica implementada pero con eficacia pendiente;
- acción crítica ineficaz;
- dependencia material no probada;
- alternativa necesaria no acreditada;
- failover no habilitado cuando el escenario depende de él;
- pendiente de reincorporación/conciliación material;
- evidencia de comunicación requerida ausente;
- autoridad/segregación no demostrada;
- evidencia sensible no accesible al validador autorizado;
- AURA diferida para los servicios que dependan de su operación;
- contradicción entre fuentes propietarias.

---

#### 39. Vista ejecutiva de readiness

```text
READINESS DE CONTINUIDAD

Servicios BIA                   69
Activos                         67
AURA bloqueados                  2
Readiness validado acreditado    0  ← línea base documental actual

Cobertura documental      [ por modalidad ]
Evidencia vigente         [ sin inferir ]
Vencimientos próximos     [ solo fechas demostrables ]
Evidencia invalidada      [ cambios materiales ]
Hallazgos materiales      [ abiertos ]
Acciones pendientes       [ por criticidad ]
Eficacia pendiente        [ separada de implementación ]
Bloqueos                  [ por propietario ]

[Servicio] [BIA] [Modalidad exigible] [Última evidencia]
[Vence] [Cambio posterior] [Acción crítica] [Eficacia]
[Conclusión soportable] [Propietario]
```

Un porcentaje agregado puede usarse como navegación si existe denominador claro, pero nunca oculta un servicio crítico bloqueado ni se denomina “readiness” por sí solo.

---

#### 40. Integración con comunicaciones

Cuando el escenario incluya comunicaciones:

- se consume `CONT-UX-006`;
- las siete clases de comunicación pueden ejercitarse dentro del alcance;
- el mensaje se marca inequívocamente como ejercicio;
- los destinatarios de prueba se resuelven desde el plan autorizado;
- un canal externo real queda bloqueado por defecto;
- una emisión externa real exige autorización específica independiente;
- receipt, lectura, acuse y efecto empresarial se mantienen separados;
- una falla de canal puede convertirse en inyector;
- la revisión conserva resultados sin transformar el ejercicio en una comunicación real.

---

#### 41. Integración con recuperación y reincorporación

Cuando el escenario incluya restore, failover u operación offline:

- `CONT-UX-005` conserva la experiencia de recuperación;
- `CONT-UX-004` conserva la experiencia de reincorporación;
- `CONT-UX-007` añade el contexto de ejercicio, objetivos, observación, evidencia y revisión;
- un resultado de prueba no se mezcla con datos productivos;
- no se ejecuta replay ciego;
- `RESULT_UNKNOWN`, `CONFLICT`, `QUARANTINED` y `RECONCILIATION_REQUIRED` se conservan cuando aparezcan en un ejercicio que use estados representativos;
- failover y alternativas permanecen bloqueados para ejecución cuando no exista capacidad acreditada.

---

#### 42. AURA diferida

Para `BCS-VPROC-0056` y `BCS-VPROC-0057`:

- se conserva identidad, proceso, BIA y perfil propietario;
- se permite walkthrough documental de vigencia y dependencias;
- no se presenta ejercicio operativo de AURA como disponible;
- no se inicia reloj de readiness operativo;
- no se inventan usuarios, datos, canales, proveedores o entornos;
- un cambio de estado de AURA invalida el supuesto anterior y obliga a revisar/programar cobertura antes de cualquier afirmación positiva.

---

#### 43. Vistas por función

| Función                                     | Prioridad UX                                                                          | No implica                              |
| ------------------------------------------- | ------------------------------------------------------------------------------------- | --------------------------------------- |
| `RESPONSABLE_DE_CONTINUIDAD`                | cobertura, vencimientos, escenarios, coordinación, hallazgos, acciones y readiness    | propiedad de todos los procesos         |
| `RESPONSABLE_DEL_PROCESO`                   | MBCO, validación funcional, hallazgos de su proceso, acciones y readiness del alcance | ejecución técnica privilegiada          |
| `RESPONSABLE_TECNOLOGICO`                   | simulación técnica, restore, observabilidad, evidencia y acciones técnicas            | validación empresarial                  |
| `COORDINACION_DE_OPERACIONES`               | operación mínima, participantes, sedes, handoffs y acciones operativas                | aprobación ejecutiva automática         |
| `GERENCIA_GENERAL` / `GOBIERNO_Y_PROPIEDAD` | riesgo, excepciones, decisiones y readiness de gobierno cuando corresponda            | sustitución de validadores propietarios |
| `GERENCIA_O_SUPERVISION_DE_SEDE`            | capacidad territorial, ejercicio local, bloqueos y acciones de sede                   | alcance empresarial global              |
| `CUSTODIO_DOCUMENTAL`                       | versiones, evidencia y mantenimiento                                                  | certificación de eficacia por custodiar |
| observador/auditor                          | hechos, evidencia y desviaciones según alcance autorizado                             | permiso para ejecutar o aprobar         |
| proveedor/tercero                           | segmento contractual y evidencia mínima                                               | autoridad de Vento o acceso total       |

---

#### 44. Responsive y accesibilidad

**Escritorio:** permite calendario, matriz de cobertura, panel de ejercicio y evidencia en paralelo mediante detalle progresivo.

**Tablet:** prioriza contexto, siguiente inyector, decisiones, observaciones y controles de seguridad.

**Móvil:** prioriza identidad del ejercicio, contexto no productivo, seguridad, siguiente hito, bloqueo, observación y captura mínima de evidencia; no comprime matrices masivas.

Obligaciones comunes:

- navegación completa por teclado;
- foco visible;
- estructura semántica;
- estados expresados con texto además de color;
- tiempos con zona/contexto suficiente;
- advertencia no productiva persistente;
- controles de abortado inequívocos;
- evidencia accesible según autorización;
- zoom sin pérdida de contexto;
- tablas con representación alternativa legible.

---

#### 45. Matriz de proyección 69 / 69

La matriz conserva todas las identidades de `CONT-DOM-014`. No reescribe su propietaria, BIA, perfil, prioridad ni ventana. Para los servicios activos, la experiencia proyecta la fila propietaria del programa, su evidencia y su vencimiento; la línea base no acredita readiness operativo. Para AURA, mantiene el bloqueo por aplicación diferida.

|    # | Servicio         | Proceso      | Decisión UX de readiness                                                                                                                                       | Línea base documental                             |
| ---: | ---------------- | ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------- |
|    1 | `BCS-VPROC-0001` | `VPROC-0001` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|    2 | `BCS-VPROC-0002` | `VPROC-0002` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|    3 | `BCS-VPROC-0003` | `VPROC-0003` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|    4 | `BCS-VPROC-0004` | `VPROC-0004` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|    5 | `BCS-VPROC-0005` | `VPROC-0005` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|    6 | `BCS-VPROC-0006` | `VPROC-0006` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|    7 | `BCS-VPROC-0007` | `VPROC-0007` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|    8 | `BCS-VPROC-0008` | `VPROC-0008` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|    9 | `BCS-VPROC-0009` | `VPROC-0009` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   10 | `BCS-VPROC-0010` | `VPROC-0010` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   11 | `BCS-VPROC-0011` | `VPROC-0011` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   12 | `BCS-VPROC-0012` | `VPROC-0012` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   13 | `BCS-VPROC-0013` | `VPROC-0013` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   14 | `BCS-VPROC-0014` | `VPROC-0014` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   15 | `BCS-VPROC-0015` | `VPROC-0015` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   16 | `BCS-VPROC-0016` | `VPROC-0016` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   17 | `BCS-VPROC-0017` | `VPROC-0017` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   18 | `BCS-VPROC-0018` | `VPROC-0018` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   19 | `BCS-VPROC-0019` | `VPROC-0019` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   20 | `BCS-VPROC-0020` | `VPROC-0020` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   21 | `BCS-VPROC-0021` | `VPROC-0021` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   22 | `BCS-VPROC-0022` | `VPROC-0022` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   23 | `BCS-VPROC-0023` | `VPROC-0023` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   24 | `BCS-VPROC-0024` | `VPROC-0024` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   25 | `BCS-VPROC-0025` | `VPROC-0025` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   26 | `BCS-VPROC-0026` | `VPROC-0026` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   27 | `BCS-VPROC-0027` | `VPROC-0027` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   28 | `BCS-VPROC-0028` | `VPROC-0028` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   29 | `BCS-VPROC-0029` | `VPROC-0029` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   30 | `BCS-VPROC-0030` | `VPROC-0030` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   31 | `BCS-VPROC-0031` | `VPROC-0031` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   32 | `BCS-VPROC-0032` | `VPROC-0032` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   33 | `BCS-VPROC-0033` | `VPROC-0033` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   34 | `BCS-VPROC-0034` | `VPROC-0034` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   35 | `BCS-VPROC-0035` | `VPROC-0035` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   36 | `BCS-VPROC-0036` | `VPROC-0036` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   37 | `BCS-VPROC-0037` | `VPROC-0037` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   38 | `BCS-VPROC-0038` | `VPROC-0038` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   39 | `BCS-VPROC-0039` | `VPROC-0039` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   40 | `BCS-VPROC-0040` | `VPROC-0040` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   41 | `BCS-VPROC-0041` | `VPROC-0041` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   42 | `BCS-VPROC-0042` | `VPROC-0042` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   43 | `BCS-VPROC-0043` | `VPROC-0043` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   44 | `BCS-VPROC-0044` | `VPROC-0044` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   45 | `BCS-VPROC-0045` | `VPROC-0045` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   46 | `BCS-VPROC-0046` | `VPROC-0046` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   47 | `BCS-VPROC-0047` | `VPROC-0047` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   48 | `BCS-VPROC-0048` | `VPROC-0048` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   49 | `BCS-VPROC-0049` | `VPROC-0049` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   50 | `BCS-VPROC-0050` | `VPROC-0050` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   51 | `BCS-VPROC-0051` | `VPROC-0051` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   52 | `BCS-VPROC-0052` | `VPROC-0052` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   53 | `BCS-VPROC-0053` | `VPROC-0053` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   54 | `BCS-VPROC-0054` | `VPROC-0054` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   55 | `BCS-VPROC-0055` | `VPROC-0055` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   56 | `BCS-VPROC-0056` | `VPROC-0056` | Walkthrough documental de vigencia únicamente; no habilitar ejercicio operativo ni reloj de readiness mientras AURA permanezca diferida.                       | `BLOQUEADO_POR_APLICACION_DIFERIDA`               |
|   57 | `BCS-VPROC-0057` | `VPROC-0057` | Walkthrough documental de vigencia únicamente; no habilitar ejercicio operativo ni reloj de readiness mientras AURA permanezca diferida.                       | `BLOQUEADO_POR_APLICACION_DIFERIDA`               |
|   58 | `BCS-VPROC-0058` | `VPROC-0058` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   59 | `BCS-VPROC-0059` | `VPROC-0059` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   60 | `BCS-VPROC-0060` | `VPROC-0060` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   61 | `BCS-VPROC-0061` | `VPROC-0061` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   62 | `BCS-VPROC-0062` | `VPROC-0062` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   63 | `BCS-VPROC-0063` | `VPROC-0063` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   64 | `BCS-VPROC-0064` | `VPROC-0064` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   65 | `BCS-VPROC-0065` | `VPROC-0065` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   66 | `BCS-VPROC-0066` | `VPROC-0066` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   67 | `BCS-VPROC-0067` | `VPROC-0067` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   68 | `BCS-VPROC-0068` | `VPROC-0068` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |
|   69 | `BCS-VPROC-0069` | `VPROC-0069` | Proyectar cobertura, ventana, última evidencia, invalidaciones, acciones y eficacia desde el programa propietario; no afirmar readiness sin evidencia vigente. | `PENDIENTE_DE_EVIDENCIA` para readiness operativo |

**Reconciliación de la matriz:**

| Control                                        |   Resultado |
| ---------------------------------------------- | ----------: |
| servicios BIA                                  | **69 / 69** |
| procesos VPROC                                 | **69 / 69** |
| servicios activos                              | **67 / 67** |
| AURA bloqueados                                |   **2 / 2** |
| `CRITICA_PROTECCION` / `CONT-OBJ-001`          |      **12** |
| `CRITICA_OPERACIONAL` / `CONT-OBJ-002`         |      **20** |
| `ALTA_CONTROL` / `CONT-OBJ-003`                |      **31** |
| `DIFERIBLE_CONTROLADA` / `CONT-OBJ-004`        |       **6** |
| readiness validado acreditado en la línea base |       **0** |
| identidades faltantes                          |       **0** |
| identidades duplicadas                         |       **0** |

---

#### 46. Casos deterministas

| Escenario                                         | Presentación requerida                                                                   |
| ------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| plan vigente sin ejercicio                        | cobertura documental favorable + evidencia operativa faltante; no readiness              |
| ejercicio programado aún no ejecutado             | fecha/planificación visible; no evidencia de ejecución                                   |
| walkthrough satisfactorio                         | vigencia documental favorable; no capacidad física demostrada                            |
| tabletop exitoso                                  | mando/decisión ejercitados; infraestructura no demostrada                                |
| simulación técnica verde                          | resultado técnico favorable; validación funcional separada                               |
| restore aislado completo                          | integridad/tiempo técnico visibles; MBCO y pendientes todavía independientes             |
| ejercicio operativo alcanza MBCO                  | resultado funcional observado + tiempos + evidencia; revisión posterior aún pendiente    |
| ejercicio abortado por control protector          | abortado trazable; puede ser comportamiento correcto, no fallo automático                |
| ejercicio con timestamp incompleto                | tiempo no calculable; no se inventa cumplimiento                                         |
| evidencia vence por ventana                       | historia preservada + readiness afectado                                                 |
| cambio material posterior                         | evidencia invalidada o bajo revisión de vigencia                                         |
| hallazgo crítico sin propietario                  | bloqueo explícito de readiness                                                           |
| acción asignada                                   | mejora pendiente; no implementada                                                        |
| acción implementada                               | eficacia pendiente; no readiness restaurado por sí solo                                  |
| reejercicio demuestra eficacia                    | acción puede pasar a eficacia demostrada para su alcance, sujeto a autoridad y evidencia |
| acción resulta ineficaz                           | riesgo residual + nuevo tratamiento; no se borra implementación                          |
| alternativa física no acreditada                  | tabletop permitido; ejercicio operativo bloqueado                                        |
| failover no habilitado                            | simulación/operación bloqueada según precondición                                        |
| proveedor participa                               | evidencia contractual/técnica; no autoridad empresarial                                  |
| comunicación simulada                             | contexto de ejercicio persistente; envío real bloqueado por defecto                      |
| AURA                                              | walkthrough de vigencia; readiness operativo bloqueado                                   |
| evidencia histórica de versión anterior           | consultable, no presentada como vigente                                                  |
| un servicio crítico bloqueado con resto favorable | agregado no puede mostrar estado global sano                                             |
| revisión con causa aún incierta                   | hipótesis/desconocido visibles; no se fuerza causa                                       |
| acción de proveedor completada                    | aceptación interna y eficacia siguen separadas                                           |
| ejercicio integrado parcial                       | ramas completadas y bloqueadas visibles por separado                                     |
| cierre del ejercicio                              | transfiere a revisión; no cierra incidente real ni acciones                              |
| certificación BLOQUE U pendiente                  | readiness de continuidad no se presenta como certificación integral                      |

---

#### 47. Handoffs y brechas de implementación

| Materia                                     | Estado documental                           | Propietario / tarea                                              | Condición de salida                                                   |
| ------------------------------------------- | ------------------------------------------- | ---------------------------------------------------------------- | --------------------------------------------------------------------- |
| persistencia real del programa y calendario | `PENDIENTE_DE_EVIDENCIA`                    | paquete propietario de `VPROC-0062`                              | modelo implementado, versionado y probado                             |
| ejecución real de walkthroughs/tabletops    | `PENDIENTE_DE_EVIDENCIA`                    | `CONT-DOM-014` + operación autorizada                            | ejercicio real registrado con evidencia                               |
| simulaciones técnicas                       | `PENDIENTE_DE_EVIDENCIA`                    | TI/paquetes técnicos propietarios                                | entorno controlado y procedimiento ejecutable aprobados               |
| restauraciones aisladas                     | `PENDIENTE_DE_EVIDENCIA`                    | `CONT-DOM-011`, `CONT-DOM-012`, TI y paquetes                    | punto recuperable y ambiente aislado disponibles, con validación      |
| ejercicios operativos                       | `PENDIENTE_DE_EVIDENCIA`                    | propietarios de proceso + continuidad                            | personas, medios, ambiente y alcance autorizados                      |
| failover/retorno ejercitable                | `BLOQUEADO`                                 | `CONT-DOM-012`, `CONT-DOM-013`, `CONT-INT-003` y paquete técnico | capacidad real habilitada y acreditada                                |
| alternativas físicas/proveedor              | `BLOQUEADO` mientras no exista acreditación | `CONT-DOM-013` y propietario funcional                           | alternativa concreta acreditada                                       |
| revisión y acciones persistidas             | `PENDIENTE_DE_EVIDENCIA`                    | paquete propietario de continuidad                               | contratos de revisión/acción implementados                            |
| eficacia verificada                         | `PENDIENTE_DE_EVIDENCIA`                    | propietario de acción + validador aplicable                      | método ejecutado y evidencia suficiente                               |
| invalidación automática por cambios         | `PENDIENTE_DE_EVIDENCIA`                    | `CONT-INT-*`, gobierno documental y paquetes                     | versiones/eventos correlacionados                                     |
| métricas analíticas                         | `PENDIENTE_DE_EVIDENCIA`                    | `DATA-DOM-016` y tareas analíticas                               | definición y cálculo implementados con población/denominador          |
| evidencia y retención                       | `PENDIENTE_DE_EVIDENCIA`                    | `INFO-DOM-012`, `INFO-DOM-013`                                   | almacenamiento, clasificación, retención e integridad implementados   |
| autorización de ejercicio                   | `PENDIENTE_DE_EVIDENCIA`                    | `CONT-AUTH-004` y autorización física                            | evaluación de servidor/segregación implementada                       |
| contratos entre aplicaciones                | `PENDIENTE_DE_EVIDENCIA`                    | `CONT-INT-001` a `CONT-INT-004`                                  | health, incidente, degradación, replay y reconciliación implementados |
| certificación integral                      | `PENDIENTE_DE_EVIDENCIA`                    | BLOQUE U                                                         | certificación transversal ejecutada con su propio alcance             |

No queda una brecha identificada por esta tarea sin propietario y condición de salida.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa en experiencia de usuario el programa de ejercicios, la revisión posterior, las acciones, la eficacia y la comprobación de readiness que ya están protegidos por los contratos canónicos vigentes. No introduce una nueva conducta ejecutable, permiso, transición física, integración ni criterio empresarial independiente; tampoco modifica el significado o estado de la cobertura de prueba existente.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 48. Criterios de aceptación
1. CONT-UX-006 permanece como tarea anterior aprobada.
2. CONT-INT-001 permanece exclusivamente reservada.
3. La tarea permanece documental dentro de CONDITIONAL_DESIGN_ARTIFACTS.
4. No se ejecuta walkthrough, tabletop, simulación, restauración ni ejercicio operativo real.
5. No se interrumpe producción, sede, red, energía, aplicación, proveedor o dispositivo.
6. No se modifica código, DDL, DML, migraciones, RLS, RPC, datos, secretos, configuración o Supabase.
7. La experiencia representa exactamente seis modalidades documentales de ejercicio.
8. Walkthrough documental no se presenta como prueba de capacidad bajo presión.
9. Tabletop no se presenta como prueba de funcionamiento real de infraestructura.
10. Simulación técnica no se presenta como recuperación empresarial.
11. Restauración aislada no se presenta como MBCO validado.
12. Ejercicio operativo no acredita recursos fuera del alcance declarado.
13. Ejercicio integrado no cubre automáticamente servicios o sedes no incluidos.
14. La interfaz distingue plan especificado de ejercicio programado.
15. La interfaz distingue ejercicio programado de ejercicio ejecutado.
16. La interfaz distingue ejercicio ejecutado de evidencia completa.
17. La interfaz distingue evidencia completa de resultado aceptable.
18. La interfaz distingue acción implementada de acción eficaz.
19. La interfaz distingue evidencia vigente de evidencia histórica.
20. Readiness se limita a alcance y versión.
21. Readiness de continuidad no se presenta como certificación integral del BLOQUE U.
22. La línea base conserva cero servicios con readiness validado.
23. Los 67 servicios activos no reciben un estado positivo de readiness sin evidencia posterior.
24. Los dos servicios AURA permanecen bloqueados para readiness operativo.
25. AURA puede participar únicamente en walkthrough documental de vigencia mientras permanezca diferida.
26. La matriz contiene exactamente 69 BCS-VPROC.
27. La matriz contiene exactamente 69 VPROC.
28. No existen identidades duplicadas.
29. La distribución BIA heredada se conserva como 12/20/31/6.
30. El calendario conserva las ventanas aprobadas por criticidad.
31. No se inventa last_walkthrough_at.
32. No se inventa last_tabletop_at.
33. No se inventa last_operational_exercise_at.
34. No se inventa last_restore_exercise_at.
35. No se inventa last_integrated_exercise_at.
36. No se inventa last_material_change_at.
37. next_due_at solo se muestra cuando existe una base temporal real.
38. exercise_scope_version permanece visible.
39. current_evidence_state no se deriva de una mera fecha programada.
40. invalidation_reason se muestra cuando una evidencia deja de ser confiable.
41. Un cambio de BIA puede invalidar evidencia anterior.
42. Un cambio de RTO/RPO/MTPD/MBCO puede invalidar evidencia anterior.
43. Un cambio de propietario o función crítica puede exigir nueva prueba.
44. Un cambio de sede/capacidad física puede exigir nueva prueba.
45. Un cambio de arquitectura, base, Storage o integración puede exigir nueva prueba.
46. Un cambio de runbook o contingencia puede exigir nueva prueba.
47. Un cambio de proveedor o canal puede exigir nueva prueba.
48. Un cambio de autorización o control protector puede exigir nueva prueba.
49. La evidencia invalidada permanece en historia.
50. La planificación resuelve modalidad antes de iniciar.
51. La planificación resuelve alcance exacto.
52. La planificación resuelve versiones baseline.
53. La planificación define objetivos observables.
54. La planificación define participantes por función.
55. La planificación distingue autoridad simulada de real.
56. La planificación identifica ambiente autorizado.
57. La planificación identifica sensibilidad de datos.
58. La planificación identifica controles de seguridad.
59. La planificación identifica evidencia requerida.
60. La planificación identifica criterios de abortado.
61. Un precondición no resoluble bloquea el inicio en vez de inferirse.
62. Participar en el ejercicio no concede autoridad productiva.
63. Una aprobación simulada no produce una aprobación real.
64. Una identidad de prueba no concede privilegios productivos.
65. Un proveedor participante no obtiene autoridad de Vento.
66. Una decisión que requiera efecto real revalida autorización fuera del contexto simulado.
67. La superficie muestra de forma persistente que el contexto es no productivo.
68. Los efectos externos permanecen bloqueados por defecto cuando el escenario lo exige.
69. El ejercicio no usa datos productivos sin autorización específica futura.
70. Una parada protectora se conserva como resultado legítimo cuando evita daño.
71. Abortar no borra evidencia ya obtenida.
72. La cronología distingue scheduled_at de started_at.
73. El ejercicio no usa scheduled_at como hora real de inicio.
74. Los inyectores conservan identidad y objetivo.
75. Los inyectores conservan la información disponible en ese momento.
76. La evaluación no usa retrospectivamente información futura para juzgar una decisión pasada.
77. Los tiempos observados conservan incertidumbre cuando el reloj no es confiable.
78. MTPD se presenta como límite, no como permiso para operar inseguro.
79. RTO se compara contra MBCO validado y no solo health técnico.
80. RPO se compara contra pérdida/punto real cuando aplique.
81. MBCO exige validación propietaria.
82. WRT no recibe un valor inventado.
83. Un resultado técnico favorable permanece separado del resultado funcional.
84. Un restore aislado conserva punto, integridad, compatibilidad y ambiente.
85. Un restore aislado conserva hechos posteriores al punto.
86. Un restore aislado conserva pendientes y conciliación.
87. Una operación manual/offline conserva folios/evidencia aplicables.
88. Un ejercicio offline no ejecuta replay ciego.
89. RESULT_UNKNOWN permanece visible cuando sea parte del escenario representativo.
90. CONFLICT permanece visible cuando sea parte del escenario representativo.
91. QUARANTINED permanece visible cuando sea parte del escenario representativo.
92. RECONCILIATION_REQUIRED permanece visible cuando sea parte del escenario representativo.
93. Failover permanece bloqueado sin capacidad habilitada.
94. Una alternativa física permanece no ejercitable operacionalmente sin acreditación.
95. Una alternativa de proveedor permanece no ejercitable operacionalmente sin acreditación.
96. El catálogo presenta exactamente catorce familias de escenario.
97. Pérdida de mando se prueba al menos mediante walkthrough/tabletop según el programa.
98. Indisponibilidad de sede/energía no fuerza una interrupción física real desde esta tarea.
99. Pérdida de red distingue simulación controlada de corte productivo.
100. Indisponibilidad de backend conserva validación funcional.
101. Restauración de datos exige validación funcional.
102. Periférico indisponible conserva bloqueo seguro o fallback permitido.
103. Proveedor de pago incierto conserva riesgo de duplicación y conciliación.
104. Canal de mensajería indisponible conserva destinatarios y evidencia.
105. Transporte indisponible conserva custodia y retorno.
106. Proveedor crítico no se sustituye por uno inventado.
107. Operación manual/offline conserva incorporación posterior.
108. Escenario integrado conserva ramas y dependencias.
109. La evidencia del ejercicio usa referencias protegidas.
110. La interfaz no revela secretos por comodidad de observación.
111. La interfaz diferencia captura de evidencia de validación de evidencia.
112. La revisión preserva source_ref al hecho original.
113. La revisión conserva baseline_version_refs.
114. La revisión conserva observed_evidence_refs.
115. expected_result y observed_result permanecen separados.
116. deviations no se convierten automáticamente en causas.
117. cause_hypotheses se identifican como hipótesis.
118. confirmed_causes requieren evidencia suficiente.
119. unknowns no se cierran por inferencia.
120. findings conservan riesgo y alcance.
121. lessons pueden confirmarse o descartarse con razón.
122. action_refs enlazan el tratamiento sin borrar el hallazgo.
123. residual_risk permanece visible.
124. plan_change_refs enlazan versiones derivadas.
125. review_authority se conserva como función separada de ejecutores.
126. closed_at solo existe cuando el cierre es real.
127. La revisión no fuerza una causa raíz ficticia.
128. La revisión de continuidad no sustituye investigación laboral/SST/seguridad cuando corresponda.
129. Una observación no equivale a hallazgo.
130. Un hallazgo no equivale a lección.
131. Una lección no equivale a acción implementada.
132. Una acción abierta no equivale a control implementado.
133. action_id es estable.
134. finding_refs y lesson_refs permanecen trazables.
135. owner_function identifica responsable interno del resultado.
136. execution_owner puede ser distinto del propietario.
137. domain_owner identifica dónde se implementa el tratamiento.
138. priority deriva del riesgo/criticidad y no de conveniencia visual.
139. scope limita la acción a identidades concretas.
140. target_at_or_condition es real o verificable.
141. dependencies identifica prerequisitos y bloqueos.
142. expected_control_result es observable.
143. exit_condition es verificable.
144. efficacy_method se define antes de declarar eficacia.
145. evidence_refs distingue implementación de eficacia.
146. residual_risk se conserva después del tratamiento.
147. Una acción sin propietario no puede aparecer como cerrada.
148. Una acción sin condición de salida no puede aparecer como cerrada.
149. Una acción vencida permanece visible.
150. Una acción bloqueada muestra insumo faltante y propietario del bloqueo.
151. Una acción cancelada conserva razón y autoridad.
152. Una acción parcial conserva la parte todavía abierta.
153. Una acción ineficaz genera nueva decisión de tratamiento.
154. Una eficacia inconclusa no se presenta como eficaz.
155. La UX soporta REEJERCICIO_CONTROLADO.
156. La UX soporta RESTAURACION_AISLADA como método de eficacia.
157. La UX soporta PRUEBA_TECNICA.
158. La UX soporta PRUEBA_FUNCIONAL.
159. La UX soporta PRUEBA_DE_RECONCILIACION.
160. La UX soporta INSPECCION_DOCUMENTADA.
161. La UX soporta EVIDENCIA_OPERATIVA.
162. La UX soporta REVISION_DE_CONFIGURACION.
163. La UX soporta VALIDACION_DE_TERCERO_CORRELACIONADA.
164. El método de eficacia se evalúa contra el resultado de control esperado.
165. Un reejercicio exigido vuelve al planificador en vez de cerrar la acción por anticipado.
166. Una acción eficaz se limita al alcance probado.
167. Una acción eficaz no certifica otros servicios.
168. Un documento actualizado no restablece readiness automáticamente.
169. Una nueva versión conserva el historial anterior.
170. La vista de readiness muestra modalidades exigibles.
171. La vista de readiness muestra última evidencia por modalidad.
172. La vista de readiness muestra vencimientos.
173. La vista de readiness muestra cambios materiales posteriores.
174. La vista de readiness muestra validación funcional.
175. La vista de readiness muestra hallazgos materiales.
176. La vista de readiness muestra acciones requeridas.
177. La vista de readiness muestra eficacia pendiente.
178. La vista de readiness muestra riesgo residual.
179. La vista de readiness muestra bloqueos y propietario.
180. Una modalidad obligatoria sin ejecución vigente bloquea afirmación positiva.
181. Evidencia vencida bloquea afirmación positiva.
182. Evidencia invalidada bloquea afirmación positiva hasta reevaluación.
183. Versión probada distinta de la actual exige análisis de vigencia.
184. Resultado funcional no validado bloquea readiness.
185. Restore técnico sin validación empresarial no prueba readiness.
186. Objetivos temporales sin evidencia suficiente no se declaran cumplidos.
187. Hallazgo crítico abierto permanece visible.
188. Acción crítica implementada con eficacia pendiente permanece visible.
189. Acción crítica ineficaz bloquea una apariencia sana.
190. Dependencia material no probada permanece visible.
191. Alternativa necesaria no acreditada permanece visible.
192. Pendiente material de conciliación permanece visible.
193. Autoridad o segregación no demostrada permanece visible.
194. Un porcentaje agregado no oculta un servicio crítico bloqueado.
195. Los agregados permiten abrir sus identidades.
196. Las comunicaciones de ejercicio usan CONT-UX-006.
197. Una comunicación de ejercicio no se emite externamente por defecto.
198. Un receipt simulado no se mezcla con delivery real.
199. CONT-UX-005 conserva propiedad de la experiencia de recuperación.
200. CONT-UX-004 conserva propiedad de la experiencia de reincorporación.
201. CONT-UX-007 añade contexto, observación, revisión y readiness sin duplicar superficies propietarias.
202. Las vistas respetan minimización por función.
203. Los estados críticos no dependen únicamente de color.
204. La navegación por teclado cubre planificación, conducción, revisión y acciones.
205. El foco visible se conserva en controles de seguridad.
206. La advertencia no productiva no desaparece al cambiar de panel.
207. Los tiempos se presentan con contexto suficiente.
208. El móvil no comprime la matriz completa hasta volverla ilegible.
209. La evidencia sensible exige autorización al abrir detalle.
210. Toda brecha de implementación tiene propietario y condición de salida.
211. La tarea no crea un estado persistente paralelo de readiness.
212. La tarea no crea métricas analíticas sin definición propietaria.
213. La tarea no genera ni modifica requisitos de prueba.
214. La ausencia de cambios TREQ evita generar un registro 04A innecesario.
215. La tarea no inicia CONT-INT-001.

---

#### 49. Balance de cierre

| Control                                        |   Resultado |
| ---------------------------------------------- | ----------: |
| contextos UX                                   |   **5 / 5** |
| modalidades de ejercicio                       |   **6 / 6** |
| familias de escenario                          | **14 / 14** |
| campos del calendario heredado                 | **10 / 10** |
| campos de revisión proyectados                 | **20 / 20** |
| campos de acción proyectados                   | **16 / 16** |
| métodos de eficacia                            |   **9 / 9** |
| servicios BIA                                  | **69 / 69** |
| servicios activos                              | **67 / 67** |
| AURA bloqueados                                |   **2 / 2** |
| readiness validado acreditado en la línea base |       **0** |
| criterios de aceptación                        |     **215** |
| ejercicios reales ejecutados                   |       **0** |
| cambios físicos                                |       **0** |
| cambios Supabase                               |       **0** |
| cambios TREQ                                   |       **0** |

---

#### 50. Límites de la tarea

Esta tarea no:

- ejecuta walkthroughs, tabletops, simulaciones, restauraciones, pruebas operativas ni ejercicios integrados reales;
- agenda personas nominales ni inventa disponibilidad;
- interrumpe producción, energía, red, aplicaciones, sedes, dispositivos o proveedores;
- provoca fallos reales;
- ejecuta cobros, devoluciones, movimientos, impresiones, webhooks, mensajes o notificaciones reales para probar escenarios;
- restaura datos productivos;
- crea ambientes de recuperación;
- ejecuta failover o failback;
- acredita alternativas físicas o de proveedor;
- crea usuarios, contactos, credenciales, secrets, tokens o accesos de ejercicio;
- habilita break-glass;
- modifica BIA, MTPD, RTO, RPO, MBCO o prioridades;
- declara objetivos cumplidos sin medición;
- declara un servicio listo sin evidencia vigente;
- declara un plan listo por estar documentado;
- declara una acción eficaz por estar implementada;
- declara una causa confirmada por existir una hipótesis;
- reemplaza la revisión propietaria de incidentes, seguridad, SST, privacidad o cumplimiento;
- crea una métrica global de readiness sin contrato;
- modifica código, DDL, DML, migraciones, RLS, RPC, Edge Functions, Storage, datos, secretos, configuración o Supabase;
- modifica el registro canónico de requisitos;
- inicia `CONT-INT-001`.

---

#### 51. Continuidad

ÚLTIMA TAREA APROBADA
`CONT-UX-006 — Diseñar comunicaciones internas y externas con plantillas, canales, confirmación y escalamiento`

TAREA ACTUAL APROBADA
`CONT-UX-007 — Diseñar ejercicios, revisión posterior, acciones y comprobación de readiness`

SIGUIENTE TAREA RESERVADA
`CONT-INT-001 — Definir contratos de criticidad, dependencia, salud, estado degradado e incidente con todas las aplicaciones`
