### MINI-BLOQUE — AUTORIZACIÓN DE EMERGENCIA Y RECUPERACION

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **autorización de emergencia y recuperacion** dentro de **AC CONTINUIDAD OPERATIVA Y RECUPERACION**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `CONT-AUTH-001` a `CONT-AUTH-004` — 4 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `CONT-AUTH-001`: Proteger declaración, activación, mando, decisiones excepcionales, comunicación y desactivación
- `CONT-AUTH-002`: Proteger acceso de emergencia, credenciales de recuperación, break-glass, failover y revocación
- `CONT-AUTH-003`: Proteger respaldos, runbooks, contactos, evidencia, formularios y datos de contingencia
- `CONT-AUTH-004`: Separar ejecución, validación, reincorporación, conciliación, cierre y revisión posterior
<!-- PLAN-SECTION-META:END -->

### ✅ CONT-AUTH-001 — Proteger declaración, activación, mando, decisiones excepcionales, comunicación y desactivación

**Estado:** APROBADA
**Tarea anterior:** `CONT-DOM-015 — Definir revisión posterior, lecciones, acciones, eficacia y actualización periódica del plan` — APROBADA
**Tarea siguiente:** `CONT-AUTH-002 — Proteger acceso de emergencia, credenciales de recuperación, break-glass, failover y revocación` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de autorización, autoridad efectiva, segregación y trazabilidad para declaración, activación, mando, decisiones excepcionales, comunicaciones y desactivación de continuidad
**Bloque:** AC — Continuidad operativa y recuperación
**Fase:** exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`
**Implementación técnica u operativa:** no autorizada
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma completa quién puede ejercer autoridad durante un incidente de continuidad, sobre qué decisión, bajo qué contexto, con qué aprobación, con qué segregación y con qué evidencia, sin convertir una emergencia en una excepción general a autorización y sin confundir coordinación operativa con aprobación empresarial.

La tarea protege el tramo de `VPROC-0062` comprendido entre evaluación, declaración, activación, mando, decisiones excepcionales, comunicación y desactivación. Debe permitir resolver de forma determinista:

```text
quién puede declarar un incidente de continuidad
quién puede proponer y quién puede aprobar una activación
qué autoridad existe después de activar
qué decisiones permanecen dentro del mandato ordinario
qué decisiones requieren aprobación excepcional
cómo funciona una sustitución temporal de mando
qué comunicaciones pueden prepararse, aprobarse y emitirse
qué ocurre si falta el aprobador aplicable
cómo se evita la autoaprobación crítica
cómo se trata una parada protectora urgente
cómo se limita la autoridad en simulaciones y ejercicios
quién puede desactivar la coordinación extraordinaria
qué evidencia debe conservar cada decisión protegida
```

La aprobación documental de esta tarea no concede privilegios técnicos, no crea acceso de emergencia, no habilita break-glass, no ejecuta failover, no modifica permisos y no activa un incidente real.

---

#### 2. Resultado sustantivo

Queda materializado el contrato de autoridad de continuidad con los siguientes resultados:

1. separación obligatoria entre señal, declaración, activación, mando, decisión excepcional, comunicación, desactivación y cierre;
2. autoridad funcional de declaración para `RESPONSABLE_DE_CONTINUIDAD` o su sustituto efectivo `CONTINUADOR_DE_CONTINUIDAD` cuando la sustitución esté vigente y registrada;
3. aprobación obligatoria de activación y modo operativo degradado por `GERENCIA_GENERAL` o `GOBIERNO_Y_PROPIEDAD` según severidad y delegación vigente;
4. prohibición de inferir autoridad desde cargo informal, acceso a una aplicación, propiedad técnica, dispositivo, presencia física, proveedor o canal de comunicación;
5. una sola dirección efectiva del incidente por alcance y momento;
6. mandato operativo explícito para coordinar dentro de estrategia, objetivos y controles ya aprobados;
7. catálogo materializado de decisiones que permanecen dentro del mandato y decisiones que exigen aprobación excepcional;
8. regla de parada protectora predefinida que puede ejecutarse sin esperar una autorización que aumente el daño, sin conceder capacidad para eliminar controles;
9. segregación entre propuesta, aprobación, ejecución, validación, comunicación y cierre;
10. matriz de autoridad por severidad `SEV-C1_CONTROLADO` a `SEV-C4_CRITICO` sin convertir severidad en permiso;
11. tratamiento explícito de sustitución, ausencia de aprobador y concentración de funciones en organización pequeña;
12. protección de las siete clases de comunicación heredadas de `CONT-DOM-006`;
13. separación entre preparación, aprobación y emisión de un mensaje;
14. regla específica para compromisos externos, mensajes a clientes, proveedores, autoridades y terceros regulados;
15. desactivación como decisión protegida distinta de cierre;
16. contrato mínimo de evidencia y reconstrucción para cada decisión protegida;
17. tratamiento específico de simulación y ejercicio para impedir que autoridad simulada produzca efectos reales;
18. prohibición de que automatizaciones o proveedores externos aprueben decisiones empresariales de continuidad;
19. resolución documental de los hallazgos `H-CAP-SCOPE-018-009`, `H-CAP-SCOPE-018-011`, `H-CAP-SCOPE-018-012` y la dimensión de autorización de `H-CAP-SCOPE-018-031`;
20. handoff explícito de acceso de emergencia a `CONT-AUTH-002`, protección de información a `CONT-AUTH-003` y separación de cierre/revisión a `CONT-AUTH-004`;
21. cero cambios físicos y cero cambios en requisitos de prueba.

---

#### 3. Entradas canónicas consumidas

Esta tarea consume y conserva, sin redefinirlas:

- `VPROC-0062` como proceso canónico de continuidad, propiedad de VISO;
- `CONT-DOM-001` como política y gobierno transversal de continuidad;
- `CONT-DOM-005` para ciclo del incidente, severidad, declaración, modalidades de activación, desactivación y frontera con cierre;
- `CONT-DOM-006` para funciones de mando, sustitución, bitácora, decisiones y clases de comunicación;
- `CONT-DOM-007` a `CONT-DOM-013` para operación mínima, contingencia, reincorporación, respaldo, recuperación y alternativas sin transferir autoridad desde esas capacidades;
- `CONT-DOM-014` para ejercicios y separación entre simulación y operación real;
- `CONT-DOM-015` para revisión posterior y eficacia sin retroceder autoridad hacia el ejecutor del incidente;
- `CAP-SCOPE-018` y sus hallazgos de activación, mando, concentración de decisiones y comunicación;
- `ADR-AUTH-001` como arquitectura canónica de identidad, actor efectivo, contexto, permiso, recurso y decisión efectiva, incluyendo la regla `ROL ≠ AUTORIZACIÓN`;
- la matriz de actores de `VPROC-0062`, que asigna inicio principal a `RESPONSABLE_DE_CONTINUIDAD`, continuidad a las funciones aprobadas y aprobación obligatoria a `GERENCIA_GENERAL` o `GOBIERNO_Y_PROPIEDAD` según severidad;
- los requisitos vigentes `TREQ-CONT-002`, `TREQ-AUTH-001`, `TREQ-AUTH-004`, `TREQ-AUTH-013` y `TREQ-AUTH-015` como cobertura de prueba ya existente.

La tarea no modifica criticidades BIA, perfiles `CONT-OBJ-*`, MTPD, RTO, RPO, MBCO, modalidades de contingencia, prioridades de recuperación, propietarios de proceso ni estados de readiness.

---

#### 4. Decisión principal

Vento OS adopta un modelo de **autoridad explícita y contextual de continuidad**.

```text
DETECCIÓN O SEÑAL
→ puede provenir de persona, sistema, proveedor o alerta
→ no concede autoridad

DECLARACIÓN
→ reconoce formalmente un incidente de continuidad
→ exige director de continuidad efectivo y autoridad vigente
→ no equivale a activación

ACTIVACIÓN
→ habilita coordinación extraordinaria dentro de un alcance
→ requiere aprobación ejecutiva conforme a severidad y delegación vigente

MANDO
→ coordina ejecución dentro del sobre aprobado
→ no puede ampliar por sí solo autorización, riesgo aceptado o controles eliminados

DECISIÓN EXCEPCIONAL
→ sale del sobre previamente aprobado
→ exige propuesta, aprobación independiente cuando corresponda, vigencia y revocación

COMUNICACIÓN
→ informa o coordina
→ no cambia por sí sola el estado ni crea autoridad

DESACTIVACIÓN
→ termina coordinación extraordinaria del alcance aprobado
→ no equivale a recuperación total ni cierre
```

Regla cardinal:

```text
URGENCIA
≠ AUTORIDAD
```

La presión temporal puede exigir una ruta de decisión más rápida, pero no transforma silencio, acceso técnico, conocimiento, jerarquía informal ni participación en el incidente en autorización.

---

#### 5. Fronteras obligatorias

Se conservan las siguientes separaciones:

```text
señal ≠ declaración
```

```text
declaración ≠ activación
```

```text
activación ≠ acceso de emergencia
```

```text
dirección del incidente ≠ aprobación ejecutiva
```

```text
propuesta ≠ aprobación
```

```text
aprobación ≠ ejecución
```

```text
ejecución técnica ≠ validación funcional
```

```text
mensaje preparado ≠ mensaje aprobado ≠ mensaje emitido
```

```text
desactivación ≠ recuperación total ≠ cierre
```

```text
participar en un ejercicio ≠ recibir autoridad real
```

```text
proveedor que restaura su servicio ≠ autoridad de continuidad de Vento
```

---

#### 6. Coordenada mínima de autorización

Toda decisión protegida de esta tarea deberá poder evaluarse sobre una coordenada suficiente. Como mínimo debe conocerse:

| Dimensión              | Regla                                                                                                          |
| ---------------------- | -------------------------------------------------------------------------------------------------------------- |
| incidente              | la decisión se vincula con un incidente o evaluación concreta; no existe autoridad flotante                    |
| acción protegida       | declarar, activar, ampliar/reducir alcance, decidir excepción, aprobar comunicación material o desactivar      |
| actor efectivo         | identifica a la persona que actúa y la función que ejerce en ese momento                                       |
| función de continuidad | distingue director, sustituto, operación, técnica, protección, comunicación, bitácora y aprobación excepcional |
| sustitución            | indica si existe suplencia vigente, su origen y su alcance                                                     |
| severidad              | usa `SEV-C1_CONTROLADO` a `SEV-C4_CRITICO`; nunca sustituye autorización                                       |
| alcance                | servicios, procesos, sedes, áreas, canales o dependencias afectados                                            |
| estado actual          | impide decisiones imposibles para el estado vigente del incidente                                              |
| modalidad              | distingue declaración, activación parcial, ampliada o empresarial protectora y desactivación                   |
| versión de autoridad   | identifica la delegación o regla organizacional vigente al momento de decidir                                  |
| controles aplicables   | SST, inocuidad, seguridad, privacidad, autorización, integridad, evidencia u otros límites que no desaparecen  |
| simulación             | distingue ejercicio/simulación de un incidente real                                                            |
| vigencia               | permite limitar decisiones temporales y excepciones                                                            |
| evidencia              | conserva razones, aprobaciones, condiciones y resultado de la decisión                                         |

La ausencia de una dimensión necesaria no se interpreta como autorización implícita.

---

#### 7. Funciones heredadas y autoridad

Las funciones de mando definidas por `CONT-DOM-006` se conservan sin convertirlas en nuevos roles base ni nuevos permisos:

| Función durante el incidente  | Función canónica de referencia                                                                                           | Autoridad dentro de esta tarea                                                                                                | Límite obligatorio                                                                        |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| director del incidente        | `RESPONSABLE_DE_CONTINUIDAD`                                                                                             | declarar, coordinar, proponer activaciones y excepciones, ordenar ejecución dentro del sobre aprobado, proponer desactivación | no se autoaprueba activación crítica, excepción crítica, recuperación total ni cierre     |
| sustituto del director        | `CONTINUADOR_DE_CONTINUIDAD`                                                                                             | ejerce temporalmente la autoridad del director únicamente cuando la sustitución está activa y registrada                      | no existen dos directores efectivos simultáneos para el mismo alcance                     |
| responsable de operación      | `COORDINACION_DE_OPERACIONES` y propietarios aplicables                                                                  | coordina operación mínima y ejecución por proceso dentro del mandato                                                          | no absorbe propiedad del proceso ni autoridad ejecutiva                                   |
| responsable técnico           | `RESPONSABLE_TECNOLOGICO`                                                                                                | coordina diagnóstico y recuperación técnica autorizada                                                                        | no se concede privilegios, secretos, break-glass ni recuperación empresarial por sí mismo |
| responsable de protección     | `RESPONSABLE_SST`, `RESPONSABLE_DE_SEGURIDAD_TECNOLOGICA`, `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD` u otra función aplicable | valida controles de su ámbito y eleva condiciones protectoras                                                                 | no amplía su autoridad a dominios ajenos por participar en el incidente                   |
| responsable de comunicaciones | `RESPONSABLE_DE_CONTINUIDAD` o `COORDINACION_DE_OPERACIONES` delegada                                                    | prepara y coordina comunicaciones dentro del mandato                                                                          | redactar o coordinar no equivale a aprobar un compromiso material                         |
| custodio de bitácora          | función designada de apoyo/continuidad                                                                                   | conserva cronología, decisiones, evidencias y versiones                                                                       | no modifica el significado de una decisión ni aprueba por registrar                       |
| aprobador excepcional         | `GERENCIA_GENERAL` o `GOBIERNO_Y_PROPIEDAD` según severidad y delegación vigente                                         | aprueba activaciones, modos degradados y decisiones excepcionales dentro de su autoridad                                      | no sustituye validación funcional, técnica, de protección o de datos cuando sea requerida |

La asignación nominal de personas se resuelve en la organización vigente; esta tarea no inventa nombres ni transforma una función en permiso técnico.

---

#### 8. Regla de declaración

La declaración formal reconoce que existe un incidente de continuidad y crea la coordenada de gobierno extraordinario sin activar automáticamente una modalidad operativa.

Puede declarar:

- `RESPONSABLE_DE_CONTINUIDAD`; o
- `CONTINUADOR_DE_CONTINUIDAD` cuando exista sustitución efectiva, vigente y registrada.

La declaración deberá conservar como mínimo:

- motivo o disparador;
- incidentes o señales relacionadas;
- fecha y hora;
- alcance inicial;
- severidad inicial evaluada;
- servicios y procesos afectados conocidos;
- actor y función que declara;
- condición de sustitución, cuando aplique;
- versión de reglas y delegación usada;
- estado inicial y evidencia disponible;
- decisión separada sobre activar o no activar.

Una alerta automática, un ticket, una llamada de proveedor, una falla técnica, una publicación externa o un reporte de un trabajador pueden iniciar evaluación, pero no sustituyen la declaración.

---

#### 9. Declaración sin activación

`CONT-DOM-005` permite que un caso controlado se declare o evalúe sin activar coordinación extraordinaria cuando la evidencia lo justifique.

La decisión `SIN_ACTIVACION_CONTINUIDAD`:

- se registra expresamente;
- requiere razón y evidencia;
- no puede utilizarse cuando la severidad y el contrato vigente exigen activación mínima;
- no elimina monitoreo, escalamiento ni reevaluación;
- se invalida si cambia materialmente el impacto, la urgencia, el alcance o el pronóstico de recuperación;
- no se interpreta como inexistencia de incidente.

---

#### 10. Regla de activación

Toda activación es una decisión protegida distinta de la declaración.

El director efectivo propone la modalidad y alcance. La aprobación obligatoria corresponde a `GERENCIA_GENERAL` o `GOBIERNO_Y_PROPIEDAD` conforme a severidad y delegación organizacional vigente.

La tarea no inventa una tabla fija que sustituya la delegación canónica. Para cada incidente debe poder determinarse qué autoridad ejecutiva es efectiva antes de autorizar una activación protegida.

La activación deberá declarar:

- modalidad;
- alcance;
- severidad vigente;
- servicios y procesos cubiertos;
- funciones de mando efectivas;
- propietario de cada resultado empresarial relevante;
- controles que permanecen obligatorios;
- estrategias de contingencia o recuperación permitidas;
- decisiones expresamente fuera del mandato;
- vigencia o condición de reevaluación;
- aprobador efectivo;
- evidencia y versión de autorización.

---

#### 11. Modalidades de activación heredadas

Se conservan exactamente las cuatro modalidades aprobadas en `CONT-DOM-005`:

| Modalidad                           | Uso de autorización                                                                                                           |
| ----------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `SIN_ACTIVACION_CONTINUIDAD`        | decisión explícita de no activar; solo admisible donde el contrato de severidad lo permite                                    |
| `ACTIVACION_PARCIAL`                | habilita coordinación extraordinaria limitada a servicios, procesos o dependencias concretas                                  |
| `ACTIVACION_AMPLIADA`               | amplía coordinación a múltiples dominios o alcances y exige escalamiento ejecutivo correspondiente                            |
| `ACTIVACION_EMPRESARIAL_PROTECTORA` | habilita coordinación empresarial de máximo alcance cuando el riesgo exige protección transversal y posible parada protectora |

Activar una modalidad no concede automáticamente:

- acceso de emergencia;
- privilegio técnico;
- derecho a modificar datos;
- derecho a saltar controles;
- autoridad para cambiar MTPD, RTO, RPO o MBCO;
- autorización para aceptar riesgo material de forma permanente;
- autoridad para declarar recuperado el proceso de otro propietario.

---

#### 12. Autoridad por severidad

La severidad limita la respuesta mínima, pero no crea permisos por sí sola.

| Severidad           | Regla heredada                                                                  | Decisión de autoridad en esta tarea                                                                                                                   |
| ------------------- | ------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| `SEV-C1_CONTROLADO` | puede no requerir activación; parcial solo si necesita coordinación transversal | director efectivo puede registrar `SIN_ACTIVACION_CONTINUIDAD` cuando sea compatible; toda activación protegida sigue la aprobación ejecutiva vigente |
| `SEV-C2_ALTO`       | exige al menos activación parcial                                               | director propone; autoridad ejecutiva efectiva aprueba alcance y modo degradado aplicable                                                             |
| `SEV-C3_MAYOR`      | exige activación ampliada y escalamiento ejecutivo                              | no puede reducirse a coordinación informal; activación y cambios materiales de alcance requieren aprobación ejecutiva vigente                         |
| `SEV-C4_CRITICO`    | exige activación empresarial/protectora y máximo nivel de gobierno aplicable    | se aplica la autoridad ejecutiva de mayor alcance exigida por la delegación vigente; las medidas protectoras no pueden relajarse por presión temporal |

No se preasigna severidad a un servicio antes de un incidente real.

---

#### 13. Mandato operativo después de activar

Una activación aprobada crea un **sobre de autoridad operativo**, no autoridad ilimitada.

El director efectivo puede, dentro de ese sobre:

- coordinar prioridades dentro de la estrategia y objetivos ya aprobados;
- distribuir trabajo entre funciones participantes;
- ordenar comprobaciones y checkpoints;
- escalar cuando cambie la severidad o el alcance;
- solicitar recursos;
- activar pasos preautorizados de una estrategia vigente;
- exigir protección, evidencia y trazabilidad;
- solicitar validación funcional a los propietarios de proceso;
- proponer cambios de modalidad, alcance o decisión excepcional;
- iniciar una parada protectora predefinida cuando la condición aprobada se materialice.

El director no puede, solo por dirigir el incidente:

- crear un permiso;
- ampliar acceso técnico;
- obtener secretos;
- anular segregación;
- modificar objetivos de continuidad aprobados;
- aceptar riesgo permanente;
- aprobar su propia excepción crítica;
- eliminar controles de SST, inocuidad, seguridad, privacidad, autorización, integridad o evidencia;
- prometer externamente causa o tiempo no confirmados;
- declarar recuperado un proceso sin validación de su propietario;
- cerrar el incidente con pendientes materiales ocultos.

---

#### 14. Ampliación y reducción del alcance activo

Cambiar el alcance de una activación es una decisión protegida cuando altera materialmente servicios, procesos, sedes, canales, dependencias, autoridad o modo degradado.

Reglas:

1. el director puede proponer ampliación o reducción;
2. un incremento de severidad o alcance que cambie la modalidad requiere nueva aprobación ejecutiva efectiva;
3. una reducción no puede retirar controles mientras persista la condición que los hace obligatorios;
4. no puede excluirse un proceso únicamente para mejorar artificialmente métricas de recuperación;
5. servicios que salen del mando extraordinario conservan pendientes y acciones asignadas;
6. toda modificación conserva antes, después, razón, actor, aprobador cuando aplique y evidencia;
7. la reducción de alcance no equivale a desactivación total del incidente.

---

#### 15. Decisiones excepcionales

Una decisión es excepcional cuando sale del sobre aprobado, altera un supuesto material, acepta temporalmente una degradación no cubierta o cambia un límite que el director no posee por mandato ordinario.

Se consideran, como mínimo, decisiones excepcionales las ya materializadas por `CONT-DOM-006`:

- activar coordinación ampliada o empresarial cuando el caso exige escalamiento;
- operar con un control materialmente degradado;
- utilizar o desviarse hacia una vía de contingencia no aprobada;
- reordenar materialmente recuperaciones contra prioridades aprobadas;
- aceptar un incumplimiento previsible de MTPD, RTO, RPO o MBCO;
- cambiar proveedor, fallback, ruta o ubicación fuera del sobre aprobado;
- emitir un compromiso externo material no cubierto por una plantilla o mandato vigente;
- diferir una conciliación obligatoria;
- mantener operación con riesgo material conocido fuera de límites aprobados;
- proponer cierre o desactivación que deje condiciones protectoras sin resolver.

Una decisión excepcional nunca puede utilizarse para crear una excepción permanente encubierta.

---

#### 16. Contrato mínimo de decisión excepcional

Cada decisión excepcional deberá conservar:

| Campo              | Regla                                                        |
| ------------------ | ------------------------------------------------------------ |
| incidente          | vínculo inequívoco con el expediente de continuidad          |
| clase de decisión  | identifica qué límite o sobre se pretende alterar            |
| propuesta          | acción concreta solicitada                                   |
| razón              | necesidad y evidencia que motiva la excepción                |
| alcance            | servicios, procesos, sedes, canales o dependencias afectados |
| severidad          | severidad vigente y cambio esperado, si existe               |
| alternativas       | opciones evaluadas y razón de descarte                       |
| control afectado   | control, objetivo o límite que podría degradarse             |
| riesgo introducido | consecuencia nueva o ampliada que se acepta temporalmente    |
| vigencia           | inicio, expiración o condición de cese                       |
| proponente         | actor y función que presenta la decisión                     |
| aprobador          | autoridad efectiva independiente cuando corresponda          |
| condiciones        | compensaciones, límites, monitoreo y abortado                |
| revocación         | condición y autoridad para retirar la excepción              |
| comunicaciones     | mensajes que deben propagarse por la decisión                |
| evidencia          | soporte suficiente para reconstruir la decisión              |

La ausencia de aprobador efectivo impide tratar la excepción como autorizada.

---

#### 17. Segregación y anti-autoaprobación

Se aplican las siguientes incompatibilidades funcionales:

| Propuesta o ejecución                     | Aprobación o validación que debe permanecer separada                     |
| ----------------------------------------- | ------------------------------------------------------------------------ |
| propuesta de activación crítica           | aprobación ejecutiva aplicable                                           |
| propuesta de decisión excepcional crítica | aprobación ejecutiva aplicable                                           |
| recuperación técnica                      | validación funcional del propietario del proceso                         |
| ejecución de una compensación             | verificación del resultado y de la evidencia                             |
| redacción de comunicación material        | aprobación del contenido cuando el tipo de mensaje lo requiera           |
| incorporación de trabajo contingente      | conciliación del dominio propietario                                     |
| propuesta de desactivación                | autorización de desactivación cuando corresponda por alcance y modalidad |
| propuesta de cierre                       | aprobación final gobernada por el contrato posterior                     |

Una misma persona puede ejercer varias funciones en una organización pequeña solo cuando:

- la concentración esté explícitamente registrada;
- la autoridad de cada función pueda distinguirse;
- no produzca autoaprobación crítica;
- la evidencia permita reconstruir qué función ejerció en cada decisión;
- exista escalamiento cuando la segregación mínima no pueda conservarse.

---

#### 18. Sustitución del director

La sustitución solo es válida cuando:

- el director titular no puede ejercer o existe una condición de relevo documentada;
- `CONTINUADOR_DE_CONTINUIDAD` está habilitado por una delegación vigente;
- el inicio de la sustitución queda registrado;
- se define alcance y vigencia;
- la bitácora identifica al actor efectivo;
- se evita coexistencia de dos directores con órdenes contradictorias;
- el relevo de regreso al titular queda registrado.

La sustitución no permite elevar el alcance del permiso ni crear acceso técnico adicional.

Si no existe director ni sustituto efectivo y la ausencia impide una decisión protegida, el sistema deberá escalar a la autoridad organizacional aplicable. No se interpreta la ausencia como consentimiento.

---

#### 19. Ausencia o indisponibilidad del aprobador

Cuando una activación o excepción requiere aprobación y no existe aprobador efectivo disponible:

1. la decisión permanece no autorizada;
2. se escala por la cadena organizacional vigente;
3. se conservan acciones protectoras ya preautorizadas que puedan ejecutarse sin ampliar el riesgo;
4. puede ejecutarse una parada protectora predefinida si esperar incrementa un riesgo de vida, SST, inocuidad, integridad, autorización, privacidad o efecto irreversible;
5. la parada protectora no concede autoridad para ejecutar el cambio o bypass que originó la necesidad de aprobación;
6. se registra indisponibilidad, escalamiento, medidas protectoras y tiempo;
7. la decisión excepcional solo cambia de estado cuando aparece una autoridad efectiva o deja de ser necesaria.

Este tratamiento evita que “nadie respondió” se convierta en aprobación tácita.

---

#### 20. Parada protectora urgente

La parada protectora es una medida de seguridad, no una excepción de autorización.

Puede ejecutarse dentro de una condición predefinida cuando continuar aumentaría un riesgo material de:

- vida o SST;
- inocuidad o calidad protectora;
- seguridad tecnológica;
- privacidad o exposición indebida;
- autorización o segregación;
- integridad de datos o evidencia;
- efecto financiero irreversible;
- otro control protector aprobado.

Reglas:

- el actor que ejecuta debe estar habilitado por el procedimiento protector aplicable;
- la parada se registra y escala de inmediato;
- detener no autoriza reanudar;
- reanudar exige que la autoridad y los controles aplicables vuelvan a estar satisfechos;
- la parada no borra obligaciones de comunicación, evidencia o revisión posterior.

---

#### 21. Clases de comunicación protegidas

Se conservan las siete clases materializadas por `CONT-DOM-006`:

| Clase                        | Propósito                                                                     | Control de autoridad                                                                    |
| ---------------------------- | ----------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| técnica                      | coordinar diagnóstico, health, restauración y dependencias técnicas           | puede prepararla el responsable técnico; no concede autoridad empresarial               |
| operativa interna            | coordinar operación mínima, responsables, turnos, sedes y acciones            | puede emitirse dentro del mandato activo y alcance aprobado                             |
| ejecutiva                    | informar impacto, severidad, decisiones, riesgos y necesidades de gobierno    | no sustituye la aprobación ejecutiva de la decisión reportada                           |
| laboral                      | informar a trabajadores o responsables sobre continuidad y medidas aplicables | debe preservar autoridad laboral, privacidad y seguridad                                |
| cliente                      | informar afectación, alternativa, disponibilidad o compromiso permitido       | requiere validación del propietario comercial/servicio cuando implique promesa material |
| proveedor                    | coordinar soporte, SLA, escalamiento, alternativa o evidencia                 | el proveedor participa; no aprueba el estado de continuidad de Vento                    |
| autoridad / tercero regulado | atender obligación, reporte o coordinación formal aplicable                   | exige participación de la función competente y aprobación que corresponda al contenido  |

Una clase puede usar más de un canal, pero el canal no modifica la autoridad del mensaje.

---

#### 22. Preparación, aprobación y emisión de comunicaciones

Toda comunicación material distingue tres actos:

1. **preparar:** redactar hechos confirmados, alcance, impacto, instrucción y siguiente actualización;
2. **aprobar:** autorizar el contenido cuando la audiencia, sensibilidad, compromiso o regulación lo exige;
3. **emitir:** enviar por un canal autorizado preservando versión, audiencia y evidencia.

Reglas:

- la persona que redacta no adquiere por ello aprobación;
- la persona que aprueba no se convierte en propietaria de la fuente técnica o empresarial;
- el operador del canal no puede alterar contenido material sin nueva revisión;
- un canal alterno conserva la misma identidad lógica del mensaje y su versión;
- una publicación externa no puede afirmar causa, tiempo de recuperación o alcance no confirmados;
- una corrección posterior conserva la versión anterior y explica el cambio;
- ninguna comunicación crea por sí sola una activación, excepción, recuperación o cierre.

---

#### 23. Compromisos externos

Se consideran especialmente protegidos los mensajes que:

- prometen una hora de recuperación;
- atribuyen una causa;
- reconocen una obligación o incumplimiento;
- comprometen compensación, devolución, crédito o gasto;
- instruyen un cambio de proveedor, ruta o canal;
- informan una autoridad o tercero regulado;
- comunican información sensible del incidente;
- declaran retorno total a operación normal.

Estos mensajes requieren hechos confirmados y la aprobación de la autoridad empresarial o funcional aplicable al contenido. El director de continuidad coordina; no adquiere autoridad financiera, legal, comercial, laboral, de privacidad o regulatoria por el incidente.

---

#### 24. Canales de contingencia

La selección de canal preserva la escalera aprobada por `CONT-DOM-006`:

`CHANNEL-01_APP_PRIMARY` → `CHANNEL-02_SHELL_NOTIFICATION` → `CHANNEL-03_EMAIL` → `CHANNEL-04_BUSINESS_MESSAGING` → `CHANNEL-05_VOICE` → `CHANNEL-06_SMS` → `CHANNEL-07_CONTROLLED_PHYSICAL_NOTICE`.

Reglas:

- usar un canal alterno no amplía audiencia;
- fallback de canal no autoriza contenido nuevo;
- mensajes sensibles usan el mínimo de información compatible con la finalidad;
- el canal físico controlado conserva autor, versión, audiencia y retiro cuando deje de ser necesario;
- un proveedor de mensajería no se convierte en aprobador ni propietario del mensaje.

---

#### 25. Autoridad en simulaciones y ejercicios

Un walkthrough, tabletop, simulación, restauración o ejercicio deberá declarar expresamente si opera en contexto simulado.

Durante simulación:

- la autoridad simulada no modifica roles, permisos, sesiones ni delegaciones reales;
- una “activación” de escenario no activa continuidad real;
- un mensaje de ejercicio no se envía a audiencia real salvo que exista autorización separada para esa prueba;
- una decisión excepcional simulada no habilita un bypass real;
- cualquier incidente real surgido durante el ejercicio se separa del escenario y entra por el ciclo real de `VPROC-0062`;
- los registros deberán permitir distinguir de forma inequívoca simulación y operación real.

---

#### 26. Automatización, alertas e inteligencia artificial

Automatizaciones, reglas, agentes o modelos pueden:

- detectar señales;
- correlacionar información;
- calcular o proponer clasificación;
- preparar resúmenes;
- sugerir escalamiento;
- preparar borradores de comunicación;
- recordar vencimientos y checkpoints.

No pueden por sí solos:

- declarar autoridad humana inexistente;
- aprobar activación;
- aprobar una decisión excepcional;
- conceder break-glass;
- relajar controles;
- emitir un compromiso externo material sin la aprobación requerida;
- declarar recuperación total;
- desactivar o cerrar un incidente.

Toda automatización consumirá el contexto de autoridad efectivo y conservará actor, decisión y versión aplicables.

---

#### 27. Proveedores y terceros

Un proveedor, técnico o prestador externo puede:

- detectar y reportar una falla;
- diagnosticar dentro de su contrato;
- ejecutar una restauración técnica autorizada;
- aportar evidencia;
- informar ETA propia cuando esté confirmada por su servicio;
- recibir instrucciones dentro del alcance autorizado.

No puede:

- declarar un incidente de continuidad de Vento;
- activar el mando empresarial;
- aprobar excepciones de Vento;
- decidir el MBCO de un proceso;
- declarar recuperado un proceso empresarial;
- aprobar un mensaje de Vento por el solo hecho de ser proveedor;
- crear acceso o conservar credenciales fuera del contrato aplicable.

---

#### 28. Desactivación

La desactivación termina la coordinación extraordinaria de continuidad para el alcance aprobado. Es una decisión protegida distinta de recuperación total y cierre.

El director efectivo puede proponer la desactivación cuando:

- la condición que exigía coordinación extraordinaria ya no se mantiene;
- los procesos afectados conocen su estado actual;
- no queda una condición protectora que exija mantener el nivel de mando;
- la recuperación o contingencia restante puede continuar bajo autoridad ordinaria o un alcance menor aprobado;
- los pendientes de reincorporación, conciliación, evidencia, comunicación y acción permanecen identificados con propietario;
- la desactivación no oculta un incumplimiento de MTPD, RTO, RPO, MBCO o control material.

El director efectivo puede ejecutar la desactivación dentro de su mandato cuando las condiciones anteriores estén satisfechas. Si la desactivación pretende además declarar recuperación total, cerrar el incidente, retirar un control protector, terminar un modo degradado sujeto a aprobación ejecutiva o revertir una decisión cuyo nivel de autoridad excede su mandato, deberá obtenerse la aprobación separada que corresponda.

La desactivación conserva:

- actor que propone;
- autoridad que aprueba cuando corresponda;
- fecha y hora;
- alcance que sale de coordinación extraordinaria;
- servicios y procesos que continúan en recuperación o seguimiento;
- pendientes y propietarios;
- comunicaciones requeridas;
- evidencia y razón.

---

#### 29. Desactivación no equivale a cierre

Después de `DESACTIVADO` pueden continuar:

- restauraciones de bajo riesgo;
- reincorporación de trabajo contingente;
- conciliaciones;
- validaciones funcionales;
- acciones correctivas;
- investigación causal;
- revisión posterior;
- actualización de plan;
- verificación de eficacia.

La autoridad final sobre separación entre ejecución, validación, reincorporación, conciliación, cierre y revisión posterior se materializa en `CONT-AUTH-004`.

Esta tarea no declara criterios nuevos de cierre ni permite usar desactivación para ocultar pendientes.

---

#### 30. Evidencia mínima de una decisión protegida

Para declaración, activación, cambio material de alcance, decisión excepcional, comunicación material y desactivación deberá conservarse, cuando corresponda:

- identificador del incidente;
- tipo de decisión;
- estado anterior y posterior;
- fecha y hora;
- actor real y función efectiva;
- principal técnico cuando la acción pase por una aplicación;
- sustitución vigente, si existe;
- severidad y alcance;
- versión de política/delegación usada;
- propuesta y razones;
- aprobador y decisión;
- condiciones y expiración;
- controles afectados;
- evidencia utilizada;
- comunicaciones derivadas;
- resultado o rechazo;
- correlación con la bitácora.

Una denegación, expiración, revocación o falta de autoridad también se registra. La auditoría no contiene secretos completos ni información sensible innecesaria.

---

#### 31. Decisiones denegadas

Una decisión deberá denegarse cuando ocurra cualquiera de estas condiciones:

- el actor no ejerce una función autorizada;
- la sustitución no está vigente;
- falta la aprobación obligatoria;
- el alcance excede la delegación efectiva;
- el estado del incidente no permite la transición;
- la decisión intenta remover un control no dispensable;
- se intenta usar simulación para producir efecto real;
- el actor intenta aprobar su propia excepción crítica;
- se intenta inferir permiso desde un rol local, UI, URL, dispositivo, sesión o acceso técnico;
- una versión de autoridad está vencida o fue sustituida;
- la comunicación material no tiene aprobación exigible;
- la desactivación pretende ocultar una condición protectora todavía activa.

El rechazo no debe obligar al operador a improvisar un bypass; deberá ofrecer escalamiento o medida protectora permitida.

---

#### 32. Consistencia entre superficies

La decisión de autoridad no podrá variar porque la acción se origine en:

- interfaz administrativa;
- aplicación operativa;
- acción de servidor;
- API;
- RPC;
- tarea automática;
- dispositivo compartido;
- operación offline reingresada;
- canal de soporte;
- integración externa.

Todas las superficies deberán consumir la misma semántica de actor efectivo, función, alcance, estado, severidad, sustitución, versión de autoridad y simulación.

Una interfaz que oculte un botón no sustituye una denegación del lado autoritativo.

---

#### 33. Relación con acceso de emergencia

Esta tarea decide **quién tiene autoridad empresarial para solicitar o aprobar una decisión de continuidad**. No define cómo se obtiene acceso técnico extraordinario.

Permanecen en `CONT-AUTH-002`:

- credenciales de recuperación;
- break-glass;
- elevación temporal de acceso;
- autorización de failover técnico cuando implique acceso extraordinario;
- expiración;
- revocación;
- rotación y evidencia de credenciales de emergencia.

Una activación aprobada no concede automáticamente break-glass.

---

#### 34. Relación con información sensible

Permanecen en `CONT-AUTH-003` los controles de acceso sobre:

- respaldos;
- runbooks;
- contactos;
- evidencia;
- formularios;
- datos de contingencia;
- información sensible del incidente.

Tener autoridad de mando no concede lectura universal sobre esos objetos.

---

#### 35. Relación con separación de cierre y revisión

Permanecen en `CONT-AUTH-004`:

- separación entre ejecución y validación;
- reincorporación y conciliación;
- autoridad de cierre;
- confirmación de pendientes;
- revisión posterior independiente;
- segregación entre quien ejecutó y quien certifica eficacia cuando corresponda.

`CONT-AUTH-001` termina en la autoridad de desactivación y en la preservación del handoff.

---

#### 36. Handoffs con propietario documental exacto

| Materia fuera del alcance de esta tarea                                                             | Propietario documental         | Condición de salida                                              |
| --------------------------------------------------------------------------------------------------- | ------------------------------ | ---------------------------------------------------------------- |
| acceso de emergencia, credenciales, break-glass, failover privilegiado y revocación                 | `CONT-AUTH-002`                | antes de habilitar acceso técnico extraordinario                 |
| protección de respaldos, runbooks, contactos, formularios, evidencia y datos de contingencia        | `CONT-AUTH-003`                | antes de exponer o modificar información sensible de continuidad |
| segregación entre ejecución, validación, reincorporación, conciliación, cierre y revisión posterior | `CONT-AUTH-004`                | antes de implementar cierre operacional y certificación final    |
| experiencia ejecutiva de activación, estado e impacto                                               | `CONT-UX-001`, `CONT-UX-002`   | antes de implementar superficies de mando y estado               |
| comunicación operativa y plantillas                                                                 | `CONT-UX-006`                  | antes de implementar experiencia de comunicación de crisis       |
| experiencia de ejercicios                                                                           | `CONT-UX-007`                  | antes de implementar operación de ejercicios                     |
| contratos entre incidentes, estados, health y aplicaciones                                          | `CONT-INT-001`, `CONT-INT-002` | antes de automatizar propagación de estado o activación          |
| reincorporación y conciliación entre dominios                                                       | `CONT-INT-004`                 | antes de automatizar retorno de trabajo contingente              |

No queda una decisión material identificada por esta tarea sin propietario documental y condición de salida.

---

#### 37. Tratamiento de hallazgos de `CAP-SCOPE-018`

| Hallazgo                                                                                        | Tratamiento                                                                                                    | Estado documental posterior                                                         |
| ----------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| `H-CAP-SCOPE-018-009` — ausencia de criterios comunes de activación y desactivación             | se materializa autoridad por declaración, activación, severidad, alcance y desactivación                       | `ESPECIFICADO`; implementación y evidencia operativa pendientes                     |
| `H-CAP-SCOPE-018-011` — mando, comunicación y sustitución no formalizados                       | se protege la matriz de funciones y sustitución de `CONT-DOM-006` con autoridad efectiva y anti-autoaprobación | `ESPECIFICADO`; asignación nominal y operación real dependen de instancias vigentes |
| `H-CAP-SCOPE-018-012` — decisiones de crisis concentradas en una persona                        | se materializa segregación entre dirección, aprobación ejecutiva, protección, ejecución y validación           | `ESPECIFICADO`; ninguna autoaprobación crítica queda permitida                      |
| `H-CAP-SCOPE-018-031` — mensajes no coordinados pueden prometer causas o tiempos no confirmados | se separan preparación, aprobación y emisión y se protegen compromisos materiales                              | `ESPECIFICADO`; experiencia y canales físicos quedan en tareas propietarias         |
| `H-CAP-SCOPE-018-032` — información sensible puede divulgarse indebidamente                     | no se absorbe en esta tarea                                                                                    | permanece en `CONT-AUTH-003` e `INFO-AUTH-004`                                      |
| `H-CAP-SCOPE-018-033` — acceso de emergencia puede convertirse en bypass permanente             | no se absorbe en esta tarea                                                                                    | permanece en `CONT-AUTH-002` y autorización transversal aplicable                   |

---

#### 38. Cobertura de requisitos de prueba vigente

La tarea no crea ni modifica requisitos `TREQ-*`.

La cobertura ya existe:

- `TREQ-CONT-002` protege clasificación, declaración, activación, responsables, decisiones, escalamiento, comunicaciones, desactivación, autoridad explícita, sustitutos y cronología;
- `TREQ-AUTH-001` exige permisos, contexto y alcance canónicos para toda capacidad protegida;
- `TREQ-AUTH-004` exige consistencia de la decisión de autorización entre evaluadores;
- `TREQ-AUTH-013` impide bypass por URL, formulario, API o RPC y exige validación autoritativa de la mutación;
- `TREQ-AUTH-015` exige evidencia correlacionable de actor, contexto, permiso, decisión, razones, versión y tiempo.

`CONT-AUTH-001` materializa esas reglas para el dominio de continuidad sin introducir una conducta verificable nueva fuera de su cobertura vigente. Por tanto, se conservan **0 requisitos creados, 0 modificados, 0 diferidos, 0 descartados y 0 obsoletos**.

---

#### 39. Estados documentales de esta tarea

| Materia                                | Estado                                                                   |
| -------------------------------------- | ------------------------------------------------------------------------ |
| contrato de autoridad para declaración | `ESPECIFICADO`                                                           |
| contrato de aprobación para activación | `ESPECIFICADO`                                                           |
| mando y límites del director           | `ESPECIFICADO`                                                           |
| decisiones excepcionales               | `ESPECIFICADO`                                                           |
| sustitución y anti-autoaprobación      | `ESPECIFICADO`                                                           |
| gobierno de comunicaciones             | `ESPECIFICADO`                                                           |
| desactivación                          | `ESPECIFICADO`                                                           |
| acceso break-glass                     | `FUERA_DE_ALCANCE` de esta tarea; propietario `CONT-AUTH-002`            |
| protección de objetos sensibles        | `FUERA_DE_ALCANCE` de esta tarea; propietario `CONT-AUTH-003`            |
| cierre y revisión posterior            | `FUERA_DE_ALCANCE` de esta tarea; propietario `CONT-AUTH-004`            |
| implementación técnica de autorización | `PENDIENTE_DE_EVIDENCIA` de fase posterior; no autorizada aquí           |
| ejercicio real de autoridad            | `PENDIENTE_DE_EVIDENCIA`; requiere incidente o ejercicio autorizado real |

La ausencia de evidencia operativa no reduce el resultado documental: impide declarar implementación o validación real.

---

#### 40. Criterios de aceptación

1. La tarea conserva `CONT-DOM-015` como anterior aprobada.
2. La tarea reserva únicamente `CONT-AUTH-002` como siguiente.
3. La tarea permanece documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`.
4. No crea código, migraciones, DDL, DML, RLS, RPC, datos, secretos ni configuración.
5. No ejecuta un incidente real.
6. No declara una activación real.
7. No ejecuta una desactivación real.
8. No crea acceso de emergencia.
9. No ejecuta break-glass.
10. No ejecuta failover o failback.
11. La señal permanece distinta de la declaración.
12. La declaración permanece distinta de la activación.
13. La activación permanece distinta del acceso de emergencia.
14. El mando permanece distinto de aprobación ejecutiva.
15. La desactivación permanece distinta de recuperación total.
16. La desactivación permanece distinta de cierre.
17. `RESPONSABLE_DE_CONTINUIDAD` queda como función principal de declaración y dirección.
18. `CONTINUADOR_DE_CONTINUIDAD` solo ejerce dirección con sustitución vigente.
19. No existen dos directores efectivos para el mismo alcance y momento.
20. `GERENCIA_GENERAL` o `GOBIERNO_Y_PROPIEDAD` conservan la aprobación obligatoria conforme a severidad y delegación vigente.
21. No se inventa una correspondencia fija de severidad a persona nominal.
22. Ningún rol local concede autorización final por su nombre.
23. El acceso a una aplicación no concede autoridad de continuidad.
24. La propiedad técnica no concede autoridad empresarial.
25. La presencia física no concede autoridad de continuidad.
26. Un dispositivo no concede autoridad por sí mismo.
27. Un proveedor no puede declarar continuidad de Vento.
28. Un proveedor no puede aprobar una decisión excepcional de Vento.
29. Una alerta automática no declara un incidente por sí sola.
30. Una automatización no aprueba activación.
31. Una automatización no aprueba excepción.
32. Una simulación no concede autoridad real.
33. Una activación simulada no produce activación real.
34. Una decisión de no activar queda registrada expresamente.
35. `SEV-C1_CONTROLADO` no obliga a una activación que el contrato no exige.
36. `SEV-C2_ALTO` conserva al menos activación parcial.
37. `SEV-C3_MAYOR` conserva activación ampliada y escalamiento ejecutivo.
38. `SEV-C4_CRITICO` conserva activación empresarial/protectora y gobierno máximo aplicable.
39. Severidad no se interpreta como permiso.
40. Criticidad BIA no se interpreta como permiso.
41. Prioridad de recuperación no se interpreta como permiso.
42. Prioridad de ticket no se interpreta como permiso.
43. La activación declara alcance explícito.
44. La activación declara modalidad explícita.
45. La activación conserva aprobador efectivo.
46. La activación conserva versión de autoridad.
47. La activación no concede break-glass automáticamente.
48. La activación no modifica MTPD, RTO, RPO o MBCO.
49. La activación no elimina controles protectores.
50. El director coordina dentro del sobre aprobado.
51. El director no se concede privilegios técnicos.
52. El director no acepta riesgo permanente por sí solo.
53. El director no autoaprueba una excepción crítica.
54. El director no declara recuperado un proceso ajeno sin validación funcional.
55. Una ampliación material de alcance requiere nueva autorización aplicable.
56. Una reducción no retira controles todavía necesarios.
57. Una reducción no oculta servicios para mejorar métricas.
58. Toda modificación material de alcance conserva antes, después y razón.
59. Las decisiones excepcionales tienen vigencia explícita.
60. Las decisiones excepcionales conservan riesgo introducido.
61. Las decisiones excepcionales conservan alternativas evaluadas.
62. Las decisiones excepcionales conservan proponente y aprobador.
63. La falta de aprobador no equivale a aprobación.
64. La presión temporal no convierte silencio en autorización.
65. Una parada protectora predefinida puede preservar seguridad sin crear bypass.
66. Detener no concede autoridad para reanudar.
67. La reanudación exige controles y autoridad aplicables.
68. La organización pequeña puede concentrar funciones solo de forma explícita.
69. La concentración no permite autoaprobación crítica.
70. La sustitución conserva inicio, alcance, vigencia y relevo.
71. La sustitución no amplía permisos técnicos.
72. Se conservan siete clases de comunicación.
73. Comunicación técnica no concede autoridad empresarial.
74. Comunicación operativa interna se limita al mandato activo.
75. Comunicación ejecutiva no sustituye aprobación.
76. Comunicación laboral preserva privacidad y seguridad.
77. Comunicación a cliente no promete hechos no confirmados.
78. Comunicación a proveedor no transfiere autoridad a proveedor.
79. Comunicación a autoridad o tercero regulado usa función competente.
80. Preparar, aprobar y emitir permanecen actos distintos.
81. Cambiar de canal no cambia la autoridad del mensaje.
82. Un canal alterno no amplía audiencia.
83. Una corrección de mensaje conserva historia.
84. Un mensaje no activa, recupera, desactiva ni cierra por sí solo.
85. Los compromisos externos materiales requieren autoridad aplicable.
86. El director no adquiere autoridad financiera, legal, laboral o regulatoria por el incidente.
87. La desactivación exige razón y evidencia.
88. La desactivación conserva pendientes y propietarios.
89. La desactivación no oculta una condición protectora activa.
90. La desactivación no equivale a cierre.
91. Las denegaciones de autoridad quedan auditables.
92. La misma semántica de autorización aplica a UI, servidor, API, RPC, automatización y operación offline.
93. Una interfaz no sustituye validación autoritativa.
94. `CONT-AUTH-002` conserva acceso de emergencia y break-glass.
95. `CONT-AUTH-003` conserva protección de información sensible de continuidad.
96. `CONT-AUTH-004` conserva separación de ejecución, validación, conciliación, cierre y revisión.
97. `H-CAP-SCOPE-018-009` queda tratado documentalmente.
98. `H-CAP-SCOPE-018-011` queda tratado documentalmente.
99. `H-CAP-SCOPE-018-012` queda tratado documentalmente.
100. La dimensión de autorización de `H-CAP-SCOPE-018-031` queda tratada documentalmente.
101. `H-CAP-SCOPE-018-032` permanece con su propietario documental.
102. `H-CAP-SCOPE-018-033` permanece con su propietario documental.
103. `TREQ-CONT-002` conserva la cobertura de comportamiento de continuidad.
104. Los requisitos transversales de autorización existentes conservan la cobertura de control.
105. La tarea crea cero requisitos de prueba.
106. La tarea modifica cero requisitos de prueba.
107. La tarea difiere cero requisitos de prueba.
108. La tarea descarta cero requisitos de prueba.
109. La tarea vuelve obsoletos cero requisitos de prueba.
110. No se declara implementación de autorización.
111. No se declara evidencia operativa inexistente.
112. No se declara persona nominal inexistente.
113. No se declara un permiso técnico inexistente.
114. No se declara una recuperación real.
115. No se declara readiness.
116. No se declara RTO, RPO, MTPD o MBCO cumplido.
117. No se cambia ningún propietario de proceso.
118. No se cambia ninguna criticidad BIA.
119. No se inicia `CONT-AUTH-002`.
120. La continuidad documental queda reservada exactamente en `CONT-AUTH-002`.

---

#### 41. Balance de cierre

`CONT-AUTH-001` deja especificado un único modelo de autoridad para la fase de declaración, activación, mando, decisiones excepcionales, comunicación y desactivación de continuidad.

El modelo:

- preserva la dirección operativa de `RESPONSABLE_DE_CONTINUIDAD` y su sustituto efectivo;
- conserva aprobación ejecutiva obligatoria donde el proceso canónico la exige;
- impide autoaprobación crítica;
- impide inferir autoridad desde acceso, rol informal, proveedor, dispositivo o urgencia;
- protege mensajes y compromisos externos;
- mantiene separación entre desactivación, recuperación total y cierre;
- mantiene break-glass, protección de información y certificación final en sus tareas propietarias;
- no declara ninguna capacidad implementada o validada.

---

#### 42. Continuidad

ÚLTIMA TAREA APROBADA

`CONT-DOM-015 — Definir revisión posterior, lecciones, acciones, eficacia y actualización periódica del plan`

TAREA ACTUAL APROBADA

`CONT-AUTH-001 — Proteger declaración, activación, mando, decisiones excepcionales, comunicación y desactivación`

SIGUIENTE TAREA RESERVADA

`CONT-AUTH-002 — Proteger acceso de emergencia, credenciales de recuperación, break-glass, failover y revocación`


### ✅ CONT-AUTH-002 — Proteger acceso de emergencia, credenciales de recuperación, break-glass, failover y revocación

**Estado:** APROBADA  
**Tarea anterior:** `CONT-AUTH-001 — Proteger declaración, activación, mando, decisiones excepcionales, comunicación y desactivación` — APROBADA  
**Tarea siguiente:** `CONT-AUTH-003 — Proteger respaldos, runbooks, contactos, evidencia, formularios y datos de contingencia` — RESERVADA  
**Tipo de tarea:** documental; definición normativa y materializada del gobierno de acceso técnico extraordinario de continuidad, recuperación de credenciales y llaves, break-glass, autorización de failover, vigencia, expiración, revocación, rotación y evidencia  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/AC_CONTINUIDAD_OPERATIVA_Y_RECUPERACION/02_AUTORIZACION_DE_EMERGENCIA_Y_RECUPERACION.md`  
**Fase:** exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`  
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, tablas, RLS, RPC, funciones, Edge Functions, migraciones, datos, cuentas, permisos, grants, secretos, llaves, certificados, sesiones, dispositivos, proveedores, respaldos, restauraciones, failover, red, infraestructura ni configuración de Supabase  
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** materializar un gobierno único para cualquier acceso técnico extraordinario requerido durante continuidad, separar la decisión empresarial de activar continuidad de la autorización técnica excepcional, impedir que break-glass se convierta en bypass permanente, gobernar credenciales y material de recuperación sin exponer secretos, fijar vigencia y revocación obligatorias, y proteger la decisión de failover sin afirmar que exista actualmente una capacidad alterna acreditada.

---

#### 1. Resultado sustantivo

`CONT-AUTH-002` queda definida con las siguientes decisiones obligatorias:

1. **Una emergencia no suspende el modelo canónico de identidad, autorización, segregación, auditoría, privacidad ni seguridad.** La urgencia modifica el tiempo de respuesta, no crea autoridad.
2. `ACTIVACION_DE_CONTINUIDAD` y `ACCESO_DE_EMERGENCIA` son decisiones distintas. Una activación aprobada no concede break-glass ni privilegios técnicos por sí sola.
3. **Break-glass es una autorización excepcional, acotada y temporal para una necesidad técnica concreta; no es un rol, un permiso wildcard, una cuenta genérica, una credencial compartida ni una excepción permanente.**
4. Toda persona que utilice acceso extraordinario debe conservar identidad humana atribuible y actor efectivo resoluble. La credencial de recuperación utilizada para obtener o restablecer acceso no se convierte en la identidad del actor.
5. Las cuentas humanas genéricas o compartidas permanecen bloqueadas para operación privilegiada. La continuidad no crea una excepción a esa regla.
6. Una credencial, llave, certificado, código de recuperación, token técnico o secreto permite autenticar o descifrar dentro de su propósito técnico; por sí solo concede **cero autorización empresarial**.
7. El acceso extraordinario reutiliza el modelo canónico de autorización y el gobierno de acceso tecnológico ya aprobados. No se crea un carril paralelo de permisos para continuidad.
8. Toda autorización de emergencia debe declarar necesidad, actor, recurso, ambiente, capacidad exacta, alcance, finalidad, correlación con incidente o recuperación, inicio, expiración, aprobador y condición de revocación.
9. No existe renovación silenciosa. Extender una ventana, ampliar un recurso, cambiar el alcance o reactivar un acceso expirado exige una nueva decisión auditada.
10. Las denegaciones aplicables continúan prevaleciendo. Break-glass no neutraliza un deny estructural, transversal, territorial, de seguridad o de segregación.
11. La aprobación de un cambio, una restauración o una activación de continuidad no inserta automáticamente un grant técnico. Cada control conserva su propia decisión y evidencia.
12. La ausencia de un aprobador requerido no equivale a aprobación. El silencio, la presión temporal, la indisponibilidad de una interfaz o la gravedad del incidente no crean un allow.
13. Una acción protectora previamente autorizada que solo detenga, aísle o preserve seguridad puede ejecutarse conforme a su contrato sin convertir esa acción en privilegio de emergencia ni en autoridad para reanudar.
14. La recuperación de secretos, certificados y llaves se mantiene separada de la recuperación de datos y configuración. Las referencias pueden documentarse; el material sensible no se incorpora en texto plano al expediente transversal.
15. Toda liberación o uso de material de recuperación debe quedar correlacionado con una persona o servicio identificable, finalidad, recurso, ambiente, ventana y evidencia de devolución, cierre, rotación o invalidación cuando corresponda.
16. Un servicio del sistema puede usar material técnico recuperado únicamente para operaciones permitidas de su identidad de servicio. `service_role`, una cuenta técnica o una automatización no sustituyen autorización empresarial humana.
17. Un proveedor o técnico externo no se autoautoriza, no se convierte en aprobador interno y no recibe acceso por la sola existencia de contrato, soporte o relación técnica.
18. El failover permanece separado de restore. Autorizar acceso de emergencia no autoriza conmutación; autorizar failover no declara recuperado el proceso empresarial.
19. Una rama de failover solo puede habilitarse cuando exista capacidad alterna acreditada, autoridad aplicable, fuente activa inequívoca, control de split-brain, punto de datos compatible, validación y retorno definidos.
20. La línea base vigente conserva **cero sustitutos concretos aprobados**. En consecuencia, la ejecución real de failover permanece `BLOQUEADO_HASTA_EXISTIR_CAPACIDAD_HABILITADA`.
21. El retorno al primario no es automático. Failback exige decisión, comparación de delta e integridad, compatibilidad, tratamiento del trabajo posterior y nueva validación técnica y funcional.
22. La expiración o revocación invalida la autoridad derivada. Sesiones, cachés, tokens, decisiones, suscripciones, reconexiones, reintentos y colas no pueden continuar usando una autorización vencida.
23. Una revocación de emergencia no borra la evidencia histórica ni elimina la necesidad de reconciliar efectos producidos durante la ventana.
24. Un ejercicio, simulación o tabletop no concede acceso productivo. El material de ejercicio debe permanecer aislado de autoridad real y no puede reutilizarse como credencial operativa.
25. `H-CAP-SCOPE-018-033` queda tratado documentalmente: el acceso excepcional dispone de vigencia, límites, segregación, invalidación, revocación, rotación y evidencia que impiden normalizarlo como bypass permanente.
26. La tarea no declara que exista hoy un inventario completo de credenciales de recuperación, un mecanismo físico de break-glass, un escrow operativo, una sesión de emergencia activa o un failover ejecutable. Esas instancias permanecen sujetas a evidencia y materialización posterior.
27. La protección del contenido de respaldos, runbooks, contactos, formularios, evidencia y datos sensibles de contingencia permanece en `CONT-AUTH-003`.
28. La separación entre ejecución, validación, reincorporación, conciliación, cierre y revisión posterior permanece en `CONT-AUTH-004`.
29. La implementación física de identidad, evaluación, invalidación, auditoría, sesiones, secretos o integraciones permanece en los paquetes y tareas de implementación ya propietarios; esta tarea no adelanta esa fase.
30. Se generan **cero cambios TREQ** porque el comportamiento protegido ya está cubierto por los requisitos vigentes de continuidad, autorización y administración tecnológica.

---

#### 2. Entradas canónicas conservadas

La tarea consume sin redefinir:

- `VPROC-0062 — Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje`;
- `PROC-ACTOR-001`, que permite a los ocho roles base aplicables participar como sujetos o reportantes sin conceder administración transversal, acceso sensible ni ejecución por el nombre del rol;
- `PROC-ACTOR-002`, que permite a los doce roles operativos ejecutar únicamente procedimientos de contingencia aprobados dentro de sede, área, turno, recurso y autoridad válidos;
- `PROC-ACTOR-003`, que conserva `RESPONSABLE_DE_CONTINUIDAD` y `RESPONSABLE_DEL_PROCESO` como funciones ejecutoras principales, `GERENCIA_GENERAL` y `GOBIERNO_Y_PROPIEDAD` como autoridades obligatorias de continuidad según severidad y `GERENCIA_GENERAL` o autoridad de seguridad competente como autoridad del ciclo sensible de acceso tecnológico;
- `CONT-DOM-001`, incluida la regla de que una emergencia no elimina autorización, finalidad, territorio, RLS, auditoría ni límites permanentes;
- `CONT-DOM-005` y `CONT-DOM-006`, para declaración, activación, severidad, mando, sustitución, decisiones y comunicación;
- `CONT-DOM-007` a `CONT-DOM-010`, para operación mínima, contingencia, captura durante falla, reincorporación e idempotencia;
- `CONT-DOM-011`, para inventario de objetos recuperables, separación de secretos respecto de configuración, acceso mínimo y recuperación separada de llaves, certificados y credenciales;
- `CONT-DOM-012`, para runbooks, orden de recuperación, restore, failover condicional, fuente activa, prevención de split-brain, retorno y validación funcional;
- `CONT-DOM-013`, para dependencias, proveedores y alternativas sin transferencia de autoridad;
- `CONT-DOM-014` y `CONT-DOM-015`, para ejercicios, evidencia vigente, revisión y mantenimiento posterior;
- `CONT-AUTH-001`, que separa activación de acceso de emergencia y reserva expresamente break-glass, elevación temporal, failover privilegiado, expiración, revocación, rotación y evidencia a esta tarea;
- `TI-AUTH-002`, que define acceso privilegiado, elevación temporal, cuentas técnicas, soporte remoto y proveedor, y reserva expresamente break-glass, credenciales de recuperación y failover de continuidad a `CONT-AUTH-002`;
- el modelo canónico de identidad, actor efectivo, permiso, modalidad, alcance, recurso, contexto, denegación, decisión y auditoría;
- `TREQ-CONT-002`, `TREQ-CONT-003` y `TREQ-CONT-004`;
- `TREQ-AUTH-013`, `TREQ-AUTH-014`, `TREQ-AUTH-015`, `TREQ-AUTH-016` y `TREQ-AUTH-165`;
- `TREQ-SHELL-010`.

No se crea un segundo catálogo de permisos, una segunda fuente de identidad, una política paralela de secretos, un rol nuevo denominado break-glass ni una cuenta compartida autorizada por continuidad.

---

#### 3. Fronteras conceptuales obligatorias

Se fijan las siguientes separaciones:

```text
ACTIVACION DE CONTINUIDAD
≠
ACCESO DE EMERGENCIA

ACCESO DE EMERGENCIA
≠
BREAK-GLASS PERMANENTE

BREAK-GLASS
≠
ROL
≠
PERMISO WILDCARD
≠
CUENTA COMPARTIDA

CREDENCIAL DE RECUPERACION
≠
IDENTIDAD HUMANA
≠
AUTORIZACION EMPRESARIAL

POSEER UN SECRETO
≠
ESTAR AUTORIZADO A USAR EL RECURSO

APROBACION DE CAMBIO
≠
APROBACION DE ACCESO

RESTORE
≠
FAILOVER

AUTORIZACION DE FAILOVER
≠
EJECUCION TECNICA DEL FAILOVER

SERVICIO TECNICAMENTE RESTAURADO
≠
PROCESO EMPRESARIAL RECUPERADO

FAILOVER
≠
FAILBACK

EXPIRACION
≠
BORRADO DE HISTORIA

REVOCACION DE ACCESO
≠
CIERRE DEL INCIDENTE
```

Estas fronteras son obligatorias en cualquier futura interfaz, API, RPC, función, servicio, runbook, integración, vault, proveedor o herramienta que materialice el resultado.

---

#### 4. Definición de acceso de emergencia

Se considera **acceso de emergencia de continuidad** una autorización técnica extraordinaria requerida para proteger, aislar, recuperar, restaurar, verificar o conmutar un recurso durante una interrupción o recuperación controlada cuando la autoridad ordinaria del actor sea insuficiente para la acción exacta.

La definición no concede acceso. Para que una solicitud sea autorizable deben resolverse como mínimo:

1. incidente, recuperación o ejercicio controlado correlacionable;
2. necesidad concreta que no pueda satisfacerse con autoridad ordinaria suficiente;
3. actor humano efectivo o servicio técnico identificado;
4. recurso y ambiente exactos;
5. capacidad o permiso exactos;
6. alcance mínimo suficiente;
7. finalidad y efecto esperado;
8. riesgo y blast radius conocidos hasta el nivel disponible;
9. inicio y expiración;
10. autoridad de aprobación aplicable;
11. segregación aplicable;
12. mecanismo de autenticación y reautenticación requerido;
13. condición explícita de revocación;
14. evidencia que deberá conservarse;
15. mecanismo de retorno a autoridad ordinaria.

Un valor ausente, desconocido o ambiguo no significa alcance global.

---

#### 5. Condiciones de elegibilidad de break-glass

Break-glass solo es elegible cuando se cumplen simultáneamente estas condiciones:

- existe una necesidad de continuidad o recuperación real y correlacionable, o un ejercicio expresamente autorizado y aislado;
- el actor no dispone de autoridad ordinaria suficiente para la acción exacta;
- la acción es necesaria para preservar seguridad, restablecer una capacidad, recuperar acceso técnico o ejecutar una transición autorizada;
- el recurso y ambiente pueden identificarse sin ambigüedad;
- existe una autoridad competente que aprueba la excepción conforme al objeto y severidad;
- el acceso puede limitarse temporalmente y revocarse;
- la acción conserva trazabilidad suficiente;
- no exige neutralizar una denegación que el modelo canónico considera prevalente;
- no convierte una identidad técnica, dispositivo, proveedor o secreto en actor humano;
- no depende de una cuenta humana compartida como única forma de atribución;
- no elimina validación, reconciliación o revisión posterior aplicables.

Si una de estas condiciones no puede demostrarse, el acceso excepcional queda `BLOQUEADO` o `PENDIENTE_DE_EVIDENCIA` según la causa; no se presume autorizado.

---

#### 6. Matriz materializada de autoridad y segregación

| Decisión o acción                       | Función que puede originar o preparar                                                                                                                                                                | Autoridad requerida                                                                | Ejecuta                                                 | Regla de segregación                                                                            |
| --------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- | ------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| solicitar acceso de emergencia          | `RESPONSABLE_DE_CONTINUIDAD`, `RESPONSABLE_TECNOLOGICO`, `RESPONSABLE_DEL_PROCESO` o actor habilitado por el incidente según necesidad                                                               | no constituye aprobación                                                           | actor solicitante o preparador                          | solicitar no concede ni activa el acceso                                                        |
| aprobar acceso técnico extraordinario   | autoridad del ciclo de acceso sensible: `GERENCIA_GENERAL` o autoridad de seguridad competente; cuando la decisión además cambia el modo de continuidad, se conserva la autoridad de `CONT-AUTH-001` | obligatoria                                                                        | no debe ser el beneficiario único de la misma excepción | el beneficiario o administrador técnico no emite por sí solo la aprobación final sensible       |
| liberar material de recuperación        | custodio o mecanismo autorizado de la fuente propietaria                                                                                                                                             | decisión de acceso vigente y reglas de custodia aplicables                         | custodio o mecanismo técnico                            | custodiar no equivale a poder usar el material para cualquier finalidad                         |
| usar credencial o llave de recuperación | actor humano o servicio técnico identificado y autorizado para el recurso                                                                                                                            | acceso extraordinario vigente o capacidad ordinaria suficiente                     | actor o servicio identificado                           | el material técnico no sustituye identidad, permiso ni alcance                                  |
| ejecutar restauración técnica           | `RESPONSABLE_TECNOLOGICO` o ejecutor técnico autorizado                                                                                                                                              | runbook, acceso y decisión técnica aplicables                                      | ejecutor técnico                                        | restaurar no permite declarar recuperación empresarial                                          |
| autorizar failover                      | autoridad aplicable a la recuperación y al cambio de modo, manteniendo las decisiones separadas de acceso y continuidad                                                                              | obligatoria cuando exista capacidad alterna acreditada                             | no necesariamente ejecuta la conmutación                | quien ejecuta técnicamente no declara por sí solo la decisión empresarial ni su éxito funcional |
| ejecutar failover                       | ejecutor técnico explícitamente autorizado                                                                                                                                                           | autorización de failover + acceso técnico vigente                                  | ejecutor técnico                                        | conmutar no equivale a validar resultado empresarial                                            |
| validar recuperación técnica            | función técnica distinta de la mera ejecución cuando el riesgo exige independencia                                                                                                                   | evidencia técnica                                                                  | validador técnico                                       | no sustituye validación funcional                                                               |
| validar resultado empresarial           | `RESPONSABLE_DEL_PROCESO` y funciones empresariales aplicables                                                                                                                                       | evidencia de MBCO y pendientes                                                     | propietario funcional o validador autorizado            | no se delega al proveedor ni al ejecutor técnico por conveniencia                               |
| revocar acceso de emergencia            | autoridad o mecanismo autorizado de revocación; la expiración automática ejecuta una condición previamente aprobada                                                                                  | no requiere una nueva aprobación para dejar de autorizar al cumplirse la condición | administrador técnico o mecanismo de identidad          | revocar no borra evidencia ni cierra el incidente                                               |
| rotar material expuesto o de emergencia | propietario técnico/seguridad conforme al sistema afectado                                                                                                                                           | decisión de rotación aplicable                                                     | ejecutor autorizado                                     | la persona que usó el material no puede omitir la rotación requerida                            |
| autorizar failback                      | autoridad aplicable a retorno controlado                                                                                                                                                             | obligatoria según riesgo y runbook                                                 | no necesariamente ejecuta                               | el retorno no ocurre por simple recuperación de salud del primario                              |
| cerrar el incidente                     | fuera de esta tarea; conserva `CONT-AUTH-004` y el proceso de continuidad                                                                                                                            | autoridad de cierre aplicable                                                      | función de cierre                                       | revocación y failback no equivalen por sí solos a cierre                                        |

La organización puede concentrar funciones únicamente cuando la concentración esté permitida y registrada. La concentración nunca transforma una decisión sensible en autoaprobación del beneficiario.

---

#### 7. Ciclo obligatorio del acceso extraordinario

Todo acceso de emergencia deberá poder reconstruirse mediante este ciclo:

```text
NECESIDAD DETECTADA
→ SOLICITUD CORRELACIONADA
→ EVALUACION DE AUTORIDAD ORDINARIA
→ JUSTIFICACION DE EXCEPCION
→ APROBACION APLICABLE
→ ACTIVACION TEMPORAL
→ USO ATRIBUIBLE
→ VERIFICACION DEL EFECTO
→ EXPIRACION O REVOCACION
→ INVALIDACION DE AUTORIDAD DERIVADA
→ ROTACION O CIERRE DEL MATERIAL CUANDO APLIQUE
→ EVIDENCIA Y HANDOFF A RECONCILIACION / REVISION
```

Reglas del ciclo:

1. si la autoridad ordinaria es suficiente, no se crea break-glass artificial;
2. una solicitud denegada permanece como evidencia y no se reintenta cambiando de canal para evitar la decisión;
3. la aprobación se aplica a la necesidad evaluada, no a cualquier operación posterior del actor;
4. el acceso no se activa antes de su inicio autorizado;
5. el acceso deja de autorizar al alcanzar su expiración o condición de revocación;
6. una sesión abierta no extiende la vigencia;
7. una operación posterior exige contexto y autorización frescos;
8. cualquier efecto incierto se conserva como pendiente de verificación y conciliación;
9. la finalización técnica del trabajo no elimina la obligación de revocar;
10. el incidente puede continuar después de revocar el privilegio.

---

#### 8. Vigencia, expiración y no renovación silenciosa

Toda autorización extraordinaria debe declarar al menos:

- inicio efectivo;
- expiración efectiva o condición de término equivalente definida por contrato;
- recurso y ambiente;
- capacidad exacta;
- actor o servicio beneficiario;
- aprobador;
- causa de activación;
- referencia de incidente, recuperación o ejercicio;
- condición de revocación anticipada.

Aplican las siguientes invariantes:

1. una autorización futura no autoriza antes de su inicio;
2. una autorización expirada permanece en historia pero no participa como allow;
3. una ampliación de tiempo genera una nueva decisión auditada;
4. una ampliación de recurso o alcance genera una nueva decisión;
5. el cambio de actor, principal, recurso, ambiente, riesgo, permiso, sede, área o situación de seguridad obliga a reevaluar;
6. el acceso no permanece activo “hasta resolver” sin una frontera verificable;
7. la expiración automática no necesita una segunda aprobación para dejar de autorizar;
8. reactivar una autorización vencida exige una decisión nueva;
9. una emergencia prolongada no convierte el acceso temporal en permanente.

---

#### 9. Credenciales de recuperación y material sensible

Para esta tarea, **material de recuperación** comprende de forma conceptual credenciales, certificados, claves, códigos de recuperación, llaves criptográficas y otros mecanismos técnicos que permiten restablecer autenticación, descifrado o control de un recurso.

La tarea no inventaría instancias ni valores. El gobierno obligatorio es:

| Clase conceptual                             | Qué permite técnicamente                                                 | Qué no concede                                                   | Control mínimo                                                            |
| -------------------------------------------- | ------------------------------------------------------------------------ | ---------------------------------------------------------------- | ------------------------------------------------------------------------- |
| código o mecanismo de recuperación de cuenta | recuperar o restablecer autenticación de una cuenta o principal          | permiso empresarial, alcance global o identidad del operador     | actor atribuible, finalidad, vigencia, custodia y rotación cuando aplique |
| credencial administrativa de recuperación    | recuperar capacidad técnica sobre un recurso concreto                    | rol permanente ni autoridad sobre otros recursos                 | recurso y ambiente exactos, aprobación, uso acotado y revocación          |
| secreto de servicio                          | autenticar un proceso técnico identificado                               | capacidad humana interactiva ni bypass empresarial               | identidad de servicio, allowlist, propietario humano y revocación         |
| llave o certificado                          | descifrar, firmar o autenticar dentro de su función técnica              | derecho a conocer los datos ni permiso para modificar el proceso | finalidad, custodio, sistema, acceso mínimo y evidencia de uso            |
| material de proveedor                        | recuperar o administrar una cuenta/plataforma externa según su mecanismo | autoridad interna de Vento                                       | patrocinador interno, actor trazable, recurso, ventana y cierre           |

Reglas obligatorias:

- el expediente transversal conserva referencias, no valores secretos completos;
- configuración recuperable y secreto se mantienen separados;
- una copia de base o configuración no debe reactivar sesiones, permisos o excepciones revocados;
- un backup que contiene material de autenticación no se considera seguro por el solo hecho de estar cifrado;
- la recuperación de un secreto debe demostrar que el actor está autorizado a utilizarlo para el recurso exacto;
- un secreto recuperado no se reutiliza indefinidamente si el procedimiento exige rotación tras exposición o uso de emergencia;
- una llave recuperada que permite descifrar no elimina la autorización sobre los datos descifrados;
- los runbooks solo deben referenciar el mecanismo o custodio aprobado, no incorporar el secreto.

---

#### 10. Custodia y liberación de material de recuperación

Toda futura instancia de material de recuperación deberá poder declarar, desde su fuente propietaria y sin exponer el secreto:

- identidad o referencia estable del material;
- clase;
- sistema, servicio, recurso y ambiente protegidos;
- propietario responsable;
- custodio o mecanismo de custodia;
- finalidad;
- estado;
- versión o generación vigente cuando corresponda;
- mecanismo de acceso;
- requisito de aprobación;
- requisito de autenticación reforzada cuando corresponda;
- requisito de doble control cuando el riesgo o plataforma lo exijan;
- condición de expiración, rotación o revocación;
- última revisión demostrable;
- evidencia de prueba de recuperación cuando exista;
- estado de readiness.

La ausencia de evidencia de estos campos no se corrige inventando valores. La instancia permanece `PENDIENTE_DE_EVIDENCIA` o `BLOQUEADO` hasta que la fuente propietaria pueda demostrarla.

---

#### 11. Prohibición de cuenta humana compartida como break-glass

La continuidad no crea una excepción a la prohibición vigente de cuenta humana genérica o compartida para operación privilegiada.

Si una plataforma externa solo ofrece un mecanismo de recuperación no nominativo, ese mecanismo puede ser tratado como **material técnico de recuperación**, pero no satisface por sí mismo la identidad humana del operador. Antes de cualquier acción empresarial protegida deberá existir un actor humano atribuible, una decisión de acceso, una sesión correlacionable y evidencia suficiente para reconstruir quién utilizó el mecanismo y para qué.

Si esa atribución no puede preservarse, el uso interactivo queda `BLOQUEADO` hasta que exista un control equivalente aprobado y demostrable.

---

#### 12. Acceso de proveedor o tercero durante continuidad

Un proveedor, fabricante, operador de nube, soporte remoto, ISP o prestador externo puede participar en la recuperación únicamente bajo estas reglas:

1. la relación técnica o comercial no concede acceso;
2. el tercero debe ser identificable cuando realice una acción humana;
3. debe existir patrocinador o propietario interno del recurso/dependencia;
4. el recurso y ambiente se delimitan;
5. la finalidad se correlaciona con el incidente o recuperación;
6. la ventana y expiración son explícitas;
7. el tercero no aprueba su propio acceso;
8. la plataforma del proveedor no sustituye la autorización Vento;
9. una sesión de soporte no puede continuar después de expiración por permanecer conectada;
10. el tercero no recibe secretos de otros dominios por conveniencia;
11. la terminación de la necesidad provoca revocación o revisión inmediata;
12. el tercero no valida recuperación empresarial en nombre de Vento.

El acceso persistente no atendido de un tercero no se habilita por esta tarea.

---

#### 13. Service role, servicios del sistema, automatización y dispositivos

Aplican las siguientes reglas:

```text
SERVICE_ROLE
=
CAPACIDAD TECNICA PRIVILEGIADA
≠
AUTORIZACION EMPRESARIAL
```

1. una operación iniciada por una persona se autoriza primero sobre el actor humano;
2. un proceso autónomo utiliza una identidad de servicio y operaciones permitidas por su contrato;
3. un servicio no puede activar break-glass para sí mismo por detectar un error;
4. una automatización puede solicitar, alertar, preparar o ejecutar una acción previamente autorizada, pero no aprobar su propia ampliación;
5. el principal técnico de un dispositivo compartido no recibe privilegio humano por la emergencia;
6. el techo de un dispositivo no se amplía porque el sistema esté degradado;
7. un dispositivo alternativo no hereda permisos del dispositivo fallido;
8. una sesión de actor humano debe reconstruirse con la semántica canónica correspondiente antes de una mutación protegida;
9. una simulación, role override, `navigation_role` o bypass técnico no satisfacen un permiso real.

---

#### 14. Failover: decisión de autoridad separada

`CONT-DOM-012` conserva el contrato técnico y funcional de failover. Esta tarea protege la **autoridad y el acceso extraordinario** necesarios para invocarlo.

Antes de una conmutación real deberán resolverse, como mínimo:

1. condición de activación del failover;
2. capacidad alterna realmente acreditada;
3. autoridad de continuidad aplicable;
4. autorización técnica extraordinaria cuando la conmutación requiera privilegio;
5. actor o servicio ejecutor identificable;
6. punto de datos y RPO alcanzable;
7. limitaciones del entorno alterno;
8. fuente activa inequívoca;
9. aislamiento, bloqueo o modo seguro de la fuente que deja de ser activa;
10. prevención de split-brain;
11. estado de integraciones, colas y dispositivos;
12. validación técnica;
13. validación empresarial del MBCO;
14. mecanismo de reintegración;
15. condición de retorno y rollback del failback.

No se permite inferir capacidad de failover por la sola existencia de:

- un servicio administrado;
- una réplica;
- una segunda región visible;
- un backup;
- un proveedor alternativo no acreditado;
- una cuenta administrativa;
- una URL secundaria;
- un endpoint saludable;
- documentación del fabricante.

---

#### 15. Estado canónico actual del failover

La línea base heredada de `CONT-DOM-012` y del programa de ejercicios conserva:

```text
SUSTITUTOS CONCRETOS APROBADOS = 0
CAPACIDAD DE FAILOVER ACREDITADA = NO DEMOSTRADA
EJECUCION REAL DE FAILOVER POR ESTA TAREA = 0
ESTADO DE EJECUCION = BLOQUEADO_HASTA_EXISTIR_CAPACIDAD_HABILITADA
```

Por tanto:

- esta tarea define quién y bajo qué controles podría autorizarse un failover privilegiado;
- no habilita una rama física de failover;
- no selecciona proveedor, región, base, red, dispositivo o sede alterna;
- no declara RTO/RPO alcanzados;
- no declara readiness;
- no produce una prueba operativa.

---

#### 16. Fuente activa, split-brain y autoridad residual

Una conmutación autorizada debe conservar una única fuente activa para cada efecto material. Si el primario y el alterno pueden producir simultáneamente el mismo efecto empresarial, la operación queda bloqueada o se lleva al modo seguro definido hasta resolver la ambigüedad.

La autorización de failover no permite:

- doble cobro;
- doble movimiento;
- doble despacho;
- doble mensaje;
- doble impresión;
- dos fuentes autoritativas compitiendo;
- confirmar un resultado incierto mediante una segunda ejecución destructiva.

Si no puede determinarse si el primario produjo el efecto, el resultado se conserva como incierto y pasa a verificación y reconciliación conforme a los contratos propietarios.

---

#### 17. Failback y retorno a autoridad ordinaria

El retorno al primario exige una decisión separada de la conmutación inicial.

Antes de failback deberán evaluarse:

- salud y estabilidad del primario;
- delta producido durante la operación alterna;
- integridad;
- compatibilidad de versión y configuración;
- trabajo pendiente;
- colas y eventos en tránsito;
- autorizaciones vigentes;
- riesgo de duplicación;
- condición de checkpoint;
- rollback propio del retorno cuando aplique;
- validación técnica;
- validación funcional posterior.

El simple hecho de que el primario vuelva a responder no autoriza retorno automático.

Al terminar la necesidad extraordinaria, el acceso de emergencia utilizado para failover o failback se revoca o expira independientemente de que el incidente global permanezca abierto.

---

#### 18. Revocación e invalidación

La revocación debe producir el efecto conceptual:

```text
AUTORIZACION EXTRAORDINARIA INACTIVA
+
SESION EXTRAORDINARIA TERMINADA O REVALIDADA
+
CONTEXTO Y DECISIONES DERIVADAS INVALIDADAS
+
TOKENS Y CACHE DERIVADOS NO REUTILIZABLES
+
SUSCRIPCIONES REVALIDADAS
+
REINTENTOS Y COLAS REAUTORIZADOS DESDE CERO
+
MATERIAL ROTADO O INVALIDADO CUANDO APLIQUE
+
EVIDENCIA CONSERVADA
=
CERO AUTORIDAD RESIDUAL ACEPTABLE
```

Eventos mínimos que obligan a expirar, revocar o reevaluar:

- llegada de la expiración;
- fin de la necesidad;
- cambio de actor o principal;
- cambio de recurso o ambiente;
- cambio material de severidad o riesgo;
- cambio de permiso, rol, vínculo, sede, área o responsabilidad relevante;
- cierre o reducción de la ventana de recuperación;
- failover, failback o retorno a modo ordinario que cambie la fuente activa;
- compromiso o exposición del material de recuperación;
- cambio de proveedor o sesión externa;
- pérdida de autenticación requerida;
- decisión explícita de revocación;
- evidencia de uso fuera de alcance.

Una revocación no elimina el registro del acceso ni las acciones ejecutadas durante su vigencia.

---

#### 19. Reconexión, offline, colas y reintentos

1. una reconexión revalida identidad, sesión, contexto y vigencia antes de continuar;
2. una conexión que sobreviva a la expiración no conserva autoridad;
3. una operación privilegiada pendiente no se ejecuta automáticamente al recuperar conectividad;
4. una cola offline no transporta el allow histórico como permiso reutilizable;
5. todo reintento mutante reevalúa autorización inmediatamente antes del efecto;
6. un resultado incierto se reconcilia, no se repite ciegamente;
7. la revocación debe propagarse a consumidores, cachés y suscripciones conforme a los contratos de invalidación;
8. un dispositivo que estuvo desconectado no puede revivir una sesión de emergencia al volver en línea.

---

#### 20. Ejercicios y simulaciones

Un ejercicio de continuidad puede verificar el diseño de break-glass sin convertir la prueba en acceso productivo.

Reglas:

- una simulación no concede autoridad real;
- las credenciales de ejercicio deben estar aisladas de material productivo o controladas por la autoridad de prueba aplicable;
- una prueba que requiera material real solo puede ejecutarse en la fase y ambiente autorizados con controles equivalentes y condición de abortado;
- el ejercicio conserva actor, escenario, objetivo, alcance, inicio, fin, evidencia y resultado;
- el uso de material de recuperación durante una prueba no permite conservarlo como acceso posterior;
- después de la prueba se confirma revocación, cierre o rotación aplicable;
- una prueba fallida o abortada no autoriza a ampliar el acceso para “terminar” el ejercicio;
- el programa de ejercicios permanece gobernado por `CONT-DOM-014`.

---

#### 21. Evidencia mínima del acceso de emergencia

Sin reproducir secretos, la evidencia deberá poder reconstruir:

- identificador del incidente, recuperación o ejercicio;
- actor humano y principal efectivo, o servicio técnico identificado;
- función ejercida;
- solicitante;
- aprobador;
- motivo;
- recurso y ambiente;
- capacidad o permiso requerido;
- alcance;
- decisión y razones;
- inicio y expiración;
- mecanismo de autenticación utilizado por referencia;
- material de recuperación utilizado por referencia, cuando aplique;
- sesión o canal técnico por referencia;
- acciones administrativas relevantes;
- resultado técnico observado;
- efectos inciertos o parciales;
- revocación, expiración o terminación;
- rotación o invalidación posterior cuando aplique;
- versión contractual aplicable;
- timestamps necesarios para reconstruir la secuencia.

La evidencia no debe contener contraseñas, tokens, códigos de recuperación, claves privadas, llaves completas ni material sensible equivalente.

---

#### 22. Estado documental y AS-IS reconciliado

| Materia                                         | Evidencia canónica disponible                                                                          | Estado posterior a esta tarea                  | Condición de salida                                                                            |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------------------ | ---------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| gobierno documental de acceso de emergencia     | autoridad, segregación, límites, vigencia y revocación quedan definidos                                | `ESPECIFICADO`                                 | implementación posterior conforme a paquetes autorizados                                       |
| mecanismo físico de break-glass                 | las fuentes consumidas no demuestran una implementación canónica completa y transversal                | `PENDIENTE_DE_EVIDENCIA`                       | mecanismo real con actor, aprobación, alcance, expiración, revocación y auditoría demostrables |
| inventario real de credenciales de recuperación | `CONT-DOM-011` exige recuperación separada, pero no reproduce valores ni acredita todas las instancias | `PENDIENTE_DE_EVIDENCIA`                       | inventario protegido y reconciliado desde fuentes propietarias                                 |
| recuperación de secretos, certificados y llaves | `CONT-DOM-011` la mantiene separada y pendiente de mecanismo autorizado                                | `PENDIENTE_DE_EVIDENCIA`                       | recuperación y prueba de uso/descifrado controladas sin texto plano                            |
| cuenta humana compartida privilegiada           | el gobierno tecnológico vigente la prohíbe                                                             | `BLOQUEADO`                                    | no se habilita como mecanismo ordinario ni de continuidad                                      |
| acceso persistente no atendido de tercero       | no está aprobado ni demostrado                                                                         | `BLOQUEADO`                                    | mecanismo trazable, limitado, revocable y auditado aprobado en fase propietaria                |
| capacidad alterna concreta para failover        | línea base: cero sustitutos concretos aprobados                                                        | `BLOQUEADO_HASTA_EXISTIR_CAPACIDAD_HABILITADA` | alternativa acreditada con fuente activa, seguridad, acceso, prueba y retorno                  |
| failover real ejecutado por esta tarea          | ninguno                                                                                                | `NO_EJECUTADO_POR_ESTA_TAREA`                  | ejecución posterior expresamente autorizada y evidenciada                                      |
| readiness de acceso de emergencia               | no demostrado por fuentes actuales                                                                     | `PENDIENTE_DE_EVIDENCIA`                       | ejercicio válido, revocación comprobada y evidencia vigente                                    |

Esta reconciliación no afirma que un objeto físico inexistente esté ausente; afirma únicamente qué capacidad está o no acreditada por las fuentes canónicas consumidas.

---

#### 23. Tratamiento de `H-CAP-SCOPE-018-033`

Hallazgo:

`H-CAP-SCOPE-018-033 — Acceso de emergencia puede convertirse en bypass permanente.`

Tratamiento materializado:

- break-glass queda definido como excepción temporal y no como rol o cuenta;
- la activación de continuidad no concede acceso;
- la elevación exige identidad, permiso/capacidad, recurso, alcance, motivo, aprobador e inicio/fin;
- las denegaciones aplicables continúan prevaleciendo;
- no existe renovación silenciosa;
- expiración y revocación invalidan autoridad derivada;
- reconexiones, cachés, tokens, colas y reintentos no reviven el allow vencido;
- material de recuperación no se convierte en identidad ni permiso;
- cuentas humanas compartidas permanecen bloqueadas;
- failover y restore permanecen decisiones separadas;
- el retorno a autoridad ordinaria es obligatorio;
- evidencia y rotación posterior quedan exigidas cuando aplique.

**Estado documental:** `ESPECIFICADO`; implementación y evidencia operativa permanecen pendientes de sus propietarios técnicos y paquetes autorizados.

---

#### 24. Fronteras con tareas posteriores y otros dominios

| Materia                                                                                             | Propietario documental o técnico                                | Frontera conservada                                                                                |
| --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| contenido y acceso a respaldos, runbooks, contactos, formularios, evidencia y datos de contingencia | `CONT-AUTH-003`                                                 | esta tarea protege el acceso extraordinario; no redefine clasificación ni exposición del contenido |
| ejecución, validación, reincorporación, conciliación, cierre y revisión posterior                   | `CONT-AUTH-004`                                                 | esta tarea termina en autoridad, revocación y handoff; no certifica el cierre                      |
| lógica de restore, orden de recuperación, fuente activa, failover y failback                        | `CONT-DOM-012`                                                  | esta tarea añade autoridad y acceso, no rediseña el runbook                                        |
| recuperación de secretos y configuración recuperable                                                | `CONT-DOM-011`, `CONT-AUTH-003` y fuentes técnicas propietarias | separa autoridad de custodia y contenido sensible                                                  |
| acceso tecnológico ordinario/privilegiado, cuentas técnicas, proveedor y soporte remoto             | `TI-AUTH-002` y `VPROC-0059`                                    | continuidad solo añade la condición excepcional; no crea un modelo paralelo                        |
| invalidación, evaluación y auditoría físicas                                                        | tareas AUTH/SHELL ya propietarias y paquetes autorizados        | no se implementan en esta fase                                                                     |
| contratos externos de continuidad                                                                   | `CONT-INT-003`                                                  | proveedor externo no recibe autoridad interna por integración                                      |
| reincorporación y conciliación entre dominios                                                       | `CONT-INT-004`                                                  | revocar acceso no resuelve efectos pendientes                                                      |
| ejercicios y readiness                                                                              | `CONT-DOM-014`, BLOQUE U y paquetes aplicables                  | una definición documental no constituye prueba operativa                                           |

No queda un pendiente material de esta tarea sin propietario documental o técnico y condición de salida.

---

#### 25. Cobertura vigente de prueba

El comportamiento protegido por `CONT-AUTH-002` ya está registrado de forma suficiente en requisitos vigentes:

- `TREQ-CONT-002` protege autoridad explícita, decisiones, responsables, escalamiento, desactivación, sustitutos y cronología del incidente;
- `TREQ-CONT-003` exige límites, vigencia, custodia, seguridad y criterio de abandono para modalidades de contingencia;
- `TREQ-CONT-004` exige inventario y recuperación segura de secretos recuperables, acceso mínimo, separación del dominio de falla y restauración demostrable;
- `TREQ-AUTH-013` impide bypass por interfaz, URL, API o RPC y exige validación autoritativa de cada mutación;
- `TREQ-AUTH-014` exige invalidar contexto, caché y tokens derivados ante cambios de sesión, turno, área, trabajador, dispositivo, rol o asignación y reautorizar trabajo offline;
- `TREQ-AUTH-015` exige evidencia correlacionable de actor, contexto, permiso, recurso, decisión, razones, versión y tiempo;
- `TREQ-AUTH-016` exige revocación coordinada sin autoridad residual;
- `TREQ-AUTH-165` impide que simulación, role override, dispositivo, nombre privilegiado de cargo o `service_role` sustituyan un permiso empresarial real;
- `TREQ-SHELL-010` ya protege recuperación, acceso privilegiado, soporte remoto, proveedor, autoridad, alcance, vigencia, autenticación aplicable, actor, evidencia y cierre.

La tarea materializa esas obligaciones para continuidad, break-glass, recuperación de credenciales y failover sin introducir una conducta protegida distinta.

---

#### 26. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** las reglas de acceso extraordinario, vigencia, invalidación, revocación, evidencia, separación entre capacidad técnica y autorización empresarial, recuperación segura de material sensible y gobierno de continuidad ya disponen de cobertura canónica vigente. Esta tarea las materializa para el contexto de continuidad sin crear una conducta protegida nueva.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 27. Estados documentales de cierre de la tarea

| Materia                                           | Estado                                                                     |
| ------------------------------------------------- | -------------------------------------------------------------------------- |
| definición de acceso de emergencia                | `ESPECIFICADO`                                                             |
| separación activación / acceso extraordinario     | `ESPECIFICADO`                                                             |
| elegibilidad de break-glass                       | `ESPECIFICADO`                                                             |
| autoridad y segregación                           | `ESPECIFICADO`                                                             |
| vigencia y expiración                             | `ESPECIFICADO`                                                             |
| revocación e invalidación conceptual              | `ESPECIFICADO`                                                             |
| gobierno de credenciales y llaves de recuperación | `ESPECIFICADO` documentalmente; instancias reales `PENDIENTE_DE_EVIDENCIA` |
| protección contra cuenta humana compartida        | `BLOQUEADO` para uso privilegiado                                          |
| acceso persistente no atendido de tercero         | `BLOQUEADO`                                                                |
| autorización conceptual de failover               | `ESPECIFICADO`                                                             |
| capacidad física de failover                      | `BLOQUEADO_HASTA_EXISTIR_CAPACIDAD_HABILITADA`                             |
| failover o failback ejecutado por esta tarea      | `NO_EJECUTADO_POR_ESTA_TAREA`                                              |
| readiness operativo de break-glass                | `PENDIENTE_DE_EVIDENCIA`                                                   |
| implementación física                             | `PENDIENTE_DE_EVIDENCIA`; no autorizada en esta fase                       |

---

#### 28. Criterios de aceptación

1. La tarea conserva `CONT-AUTH-001` como anterior aprobada.
2. La tarea reserva únicamente `CONT-AUTH-003` como siguiente.
3. La tarea permanece documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`.
4. No crea código, migraciones, DDL, DML, RLS, RPC, datos, cuentas, secretos ni configuración.
5. No ejecuta acceso de emergencia real.
6. No ejecuta break-glass real.
7. No recupera ni revela una credencial real.
8. No rota una credencial real.
9. No ejecuta restore.
10. No ejecuta failover.
11. No ejecuta failback.
12. No declara readiness operativo.
13. La emergencia no elimina autorización.
14. La urgencia no crea autoridad.
15. Activación y acceso de emergencia permanecen separados.
16. Activación aprobada no concede break-glass automáticamente.
17. Break-glass se define como excepción temporal y acotada.
18. Break-glass no se define como rol.
19. Break-glass no se define como permiso wildcard.
20. Break-glass no se define como cuenta humana compartida.
21. Una credencial de recuperación no se convierte en identidad humana.
22. Poseer un secreto no equivale a estar autorizado.
23. Un secreto de servicio no se convierte en permiso empresarial.
24. `service_role` no se convierte en autorización empresarial.
25. Una automatización no se autoaprueba privilegio.
26. Un dispositivo compartido no obtiene privilegio humano por la emergencia.
27. Un proveedor no se autoautoriza.
28. Un proveedor no valida recuperación empresarial de Vento.
29. Una relación comercial no concede acceso técnico.
30. Una relación técnica no demuestra privilegio vigente.
31. Cada solicitud de emergencia conserva una necesidad correlacionable.
32. Cada solicitud identifica actor o servicio.
33. Cada solicitud identifica recurso y ambiente.
34. Cada solicitud identifica capacidad o permiso exacto.
35. Cada solicitud limita el alcance.
36. Cada solicitud conserva finalidad.
37. Cada autorización conserva inicio.
38. Cada autorización conserva expiración o condición de término equivalente.
39. Cada autorización conserva aprobador.
40. Cada autorización conserva condición de revocación.
41. Un valor ambiguo no significa alcance global.
42. La autoridad ordinaria suficiente evita crear break-glass artificial.
43. La ausencia de aprobador no equivale a aprobación.
44. El silencio no equivale a aprobación.
45. La presión temporal no equivale a aprobación.
46. El beneficiario no emite por sí solo la aprobación final sensible.
47. El administrador técnico no obtiene por ejecución la autoridad de aprobación final.
48. Solicitar no concede acceso.
49. Aprobar cambio no concede acceso.
50. Aprobar restore no concede acceso automáticamente.
51. Aprobar activación no concede acceso automáticamente.
52. Las denegaciones aplicables continúan prevaleciendo.
53. Una elevación no elimina prerrequisitos del permiso.
54. Una elevación no amplía silenciosamente territorio.
55. Una elevación no amplía silenciosamente recurso.
56. Una elevación no amplía silenciosamente ambiente.
57. Una autorización futura no autoriza antes de su inicio.
58. Una autorización vencida permanece en historia pero deja de autorizar.
59. Una ampliación de tiempo exige una nueva decisión.
60. Una ampliación de alcance exige una nueva decisión.
61. Una ampliación de recurso exige una nueva decisión.
62. Cambiar de actor obliga a reevaluar.
63. Cambiar de principal obliga a reevaluar.
64. Cambiar materialmente el riesgo obliga a reevaluar.
65. Una sesión abierta no prolonga la vigencia.
66. Una emergencia prolongada no convierte el acceso en permanente.
67. El expediente no contiene contraseñas completas.
68. El expediente no contiene tokens completos.
69. El expediente no contiene códigos de recuperación completos.
70. El expediente no contiene claves privadas completas.
71. El expediente no contiene llaves completas.
72. Configuración recuperable y secreto permanecen separados.
73. La llave recuperada no concede derecho a conocer los datos.
74. El secreto recuperado no concede permiso sobre el proceso.
75. Una copia no reactiva sesiones revocadas.
76. Una copia no reactiva permisos revocados.
77. Una copia no reactiva excepciones revocadas.
78. Los runbooks referencian mecanismos sin incorporar secretos.
79. La custodia no se convierte en autorización de uso irrestricto.
80. Una cuenta humana genérica permanece bloqueada para privilegio.
81. Un mecanismo técnico no nominativo no sustituye atribución humana.
82. Un tercero requiere identidad trazable cuando actúa como persona.
83. Un tercero requiere patrocinador o propietario interno.
84. Un tercero recibe recurso y ambiente delimitados.
85. Un tercero recibe ventana delimitada.
86. Una sesión de tercero no continúa por estar conectada después de expirar.
87. El acceso persistente no atendido de tercero no se habilita por esta tarea.
88. Restore y failover permanecen decisiones separadas.
89. Failover exige capacidad alterna acreditada.
90. La existencia de un servicio administrado no acredita failover.
91. La existencia de una réplica no acredita failover.
92. La existencia de un backup no acredita failover.
93. La existencia de una URL secundaria no acredita failover.
94. La línea base conserva cero sustitutos concretos aprobados.
95. El failover real permanece bloqueado hasta existir capacidad habilitada.
96. Failover conserva fuente activa inequívoca.
97. Failover exige prevención de split-brain.
98. Failover conserva estado de integraciones, colas y dispositivos.
99. Failover exige validación técnica.
100. Failover exige validación empresarial del MBCO.
101. Autorizar failover no declara recuperación empresarial.
102. Ejecutar failover no declara recuperación empresarial.
103. La fuente secundaria no se vuelve primaria solo por estar saludable.
104. Failback no es automático.
105. Failback evalúa delta e integridad.
106. Failback evalúa compatibilidad y trabajo posterior.
107. Failback conserva checkpoint y rollback cuando aplique.
108. Después de failback se repite validación técnica relevante.
109. Después de failback se repite validación funcional relevante.
110. La revocación puede ocurrir aunque el incidente continúe abierto.
111. Revocar acceso no equivale a cerrar el incidente.
112. La expiración invalida autoridad derivada.
113. La revocación invalida autoridad derivada.
114. Caché no conserva un allow vencido.
115. Tokens derivados no conservan un allow vencido.
116. Suscripciones deben revalidarse después de invalidación.
117. Reintentos mutantes reautorizan antes del efecto.
118. Colas offline reautorizan antes del efecto.
119. Una reconexión no revive una sesión vencida.
120. Un resultado incierto se reconcilia y no se repite ciegamente.
121. La revocación conserva evidencia histórica.
122. La revocación no borra acciones ejecutadas durante vigencia.
123. La exposición del material puede exigir rotación posterior.
124. Una simulación no concede autoridad real.
125. Una credencial de ejercicio no se reutiliza como acceso productivo.
126. Un ejercicio no declara readiness por existir documentación.
127. `H-CAP-SCOPE-018-033` queda tratado documentalmente.
128. `CONT-AUTH-003` conserva protección del contenido sensible de continuidad.
129. `CONT-AUTH-004` conserva ejecución, validación, conciliación, cierre y revisión.
130. `CONT-DOM-012` conserva lógica de restore, failover y retorno.
131. `CONT-DOM-011` conserva inventario y política de objetos recuperables.
132. `TI-AUTH-002` conserva el gobierno transversal de privilegio tecnológico ordinario y temporal.
133. La tarea no crea un segundo catálogo de permisos.
134. La tarea no crea un segundo catálogo de identidad.
135. La tarea no crea un segundo modelo de secretos.
136. La tarea no crea un rol base nuevo.
137. La tarea no inventa cuentas, usuarios ni credenciales reales.
138. La tarea no inventa proveedores alternativos.
139. La tarea no inventa una capacidad de failover inexistente.
140. La tarea distingue `ESPECIFICADO` de `IMPLEMENTADO`.
141. La tarea distingue `PENDIENTE_DE_EVIDENCIA` de `BLOQUEADO`.
142. La tarea conserva cero accesos de emergencia ejecutados por ella.
143. La tarea conserva cero failovers ejecutados por ella.
144. La tarea conserva cero cambios físicos.
145. `TREQ-CONT-002` conserva cobertura de autoridad y cronología.
146. `TREQ-CONT-003` conserva cobertura de vigencia, custodia y seguridad de contingencia.
147. `TREQ-CONT-004` conserva cobertura de secretos recuperables y restauración segura.
148. `TREQ-AUTH-013` conserva protección anti-bypass autoritativa.
149. `TREQ-AUTH-014` conserva invalidación de contexto, caché y tokens derivados.
150. `TREQ-AUTH-015` conserva evidencia correlacionable.
151. `TREQ-AUTH-016` conserva revocación coordinada sin autoridad residual.
152. `TREQ-AUTH-165` conserva prohibición de convertir bypass técnico en permiso empresarial.
153. `TREQ-SHELL-010` conserva ciclo tecnológico de recuperación y acceso privilegiado.
154. La tarea crea cero requisitos de prueba.
155. La tarea modifica cero requisitos de prueba.
156. La tarea difiere cero requisitos de prueba.
157. La tarea descarta cero requisitos de prueba.
158. La tarea vuelve obsoletos cero requisitos de prueba.
159. No se genera una copia innecesaria del registro 04A.
160. La tarea deja `CONT-AUTH-003` únicamente reservada.

---

#### 29. Continuidad

```text
ÚLTIMA TAREA APROBADA
CONT-AUTH-001 — Proteger declaración, activación, mando, decisiones excepcionales, comunicación y desactivación
        ↓
TAREA ACTUAL APROBADA
CONT-AUTH-002 — Proteger acceso de emergencia, credenciales de recuperación, break-glass, failover y revocación
        ↓
SIGUIENTE TAREA RESERVADA
CONT-AUTH-003 — Proteger respaldos, runbooks, contactos, evidencia, formularios y datos de contingencia
```


### [ ] CONT-AUTH-003 — Proteger respaldos, runbooks, contactos, evidencia, formularios y datos de contingencia
### [ ] CONT-AUTH-004 — Separar ejecución, validación, reincorporación, conciliación, cierre y revisión posterior
