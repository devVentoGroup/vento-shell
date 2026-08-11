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

`TREQ-CONT-006` protege la revisión periódica de runbooks y el principio de que un plan sin prueba vigente no puede declararse listo. `TREQ-UX-006`, `TREQ-UX-007` y `TREQ-UX-008` cubren comportamiento responsive, validación con roles/sedes/dispositivos representativos y accesibilidad/estados de interfaz sin depender exclusivamente de color o iconografía.

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


### [ ] CONT-UX-004 — Diseñar captura controlada durante la falla y reincorporación posterior
### [ ] CONT-UX-005 — Diseñar seguimiento de respaldos, restauración, failover, validación y pendientes
### [ ] CONT-UX-006 — Diseñar comunicaciones internas y externas con plantillas, canales, confirmación y escalamiento
### [ ] CONT-UX-007 — Diseñar ejercicios, revisión posterior, acciones y comprobación de readiness
