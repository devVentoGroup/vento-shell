### MINI-BLOQUE — EXPERIENCIA DE CONTINGENCIA Y MANDO

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **experiencia de contingencia y mando** dentro de **AC CONTINUIDAD OPERATIVA Y RECUPERACION**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `CONT-UX-001` a `CONT-UX-007` — 7 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Diseñar inicio ejecutivo de continuidad con estado, impacto, prioridades, responsables y decisiones” y concluye con “Diseñar ejercicios, revisión posterior, acciones y comprobación de readiness”.
<!-- PLAN-SECTION-META:END -->

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


### [ ] CONT-UX-002 — Diseñar centro de mando del incidente con línea de tiempo, servicios afectados y recuperación
### [ ] CONT-UX-003 — Diseñar runbooks y checklists simples por rol, proceso, sede y modalidad
### [ ] CONT-UX-004 — Diseñar captura controlada durante la falla y reincorporación posterior
### [ ] CONT-UX-005 — Diseñar seguimiento de respaldos, restauración, failover, validación y pendientes
### [ ] CONT-UX-006 — Diseñar comunicaciones internas y externas con plantillas, canales, confirmación y escalamiento
### [ ] CONT-UX-007 — Diseñar ejercicios, revisión posterior, acciones y comprobación de readiness
