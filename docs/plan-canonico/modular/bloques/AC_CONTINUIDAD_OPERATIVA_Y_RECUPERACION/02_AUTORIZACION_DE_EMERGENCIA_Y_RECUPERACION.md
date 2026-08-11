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


### [ ] CONT-AUTH-002 — Proteger acceso de emergencia, credenciales de recuperación, break-glass, failover y revocación
### [ ] CONT-AUTH-003 — Proteger respaldos, runbooks, contactos, evidencia, formularios y datos de contingencia
### [ ] CONT-AUTH-004 — Separar ejecución, validación, reincorporación, conciliación, cierre y revisión posterior
