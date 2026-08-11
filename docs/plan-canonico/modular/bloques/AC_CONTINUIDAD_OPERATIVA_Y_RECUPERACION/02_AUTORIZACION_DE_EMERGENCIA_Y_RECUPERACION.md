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


### ✅ CONT-AUTH-003 — Proteger respaldos, runbooks, contactos, evidencia, formularios y datos de contingencia

**Estado:** APROBADA  
**Tarea anterior:** `CONT-AUTH-002 — Proteger acceso de emergencia, credenciales de recuperación, break-glass, failover y revocación` — APROBADA  
**Tarea siguiente:** `CONT-AUTH-004 — Separar ejecución, validación, reincorporación, conciliación, cierre y revisión posterior` — RESERVADA  
**Tipo de tarea:** documental; definición normativa y materializada del gobierno de autorización, minimización, custodia, exposición, transferencia y protección de la información sensible utilizada por continuidad, incluidos respaldos, runbooks, contactos, evidencia, formularios y datos de contingencia  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/AC_CONTINUIDAD_OPERATIVA_Y_RECUPERACION/02_AUTORIZACION_DE_EMERGENCIA_Y_RECUPERACION.md`  
**Fase:** exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`  
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, tablas, buckets, RLS, RPC, funciones, Edge Functions, migraciones, datos, permisos, grants, secretos, llaves, certificados, respaldos, runbooks productivos, contactos reales, formularios productivos, folios emitidos, almacenamiento local, archivos, sesiones, proveedores, infraestructura ni configuración de Supabase  
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** materializar una única regla de protección para el contenido que continuidad necesita consultar, transportar, custodiar o producir durante interrupciones y recuperación, de modo que la urgencia no amplíe acceso, la custodia no se convierta en permiso, un respaldo o runbook no exponga secretos, un contacto no se publique fuera de finalidad, una evidencia no pierda integridad y un formulario o dato contingente no se transforme en fuente paralela de verdad.

---

#### 1. Resultado sustantivo

`CONT-AUTH-003` queda definida con las siguientes decisiones obligatorias:

1. **La información de continuidad conserva clasificación, finalidad, autorización, minimización, retención, integridad y trazabilidad durante una emergencia.** La interrupción no rebaja esos controles.
2. Se protegen seis familias de objeto: respaldos, runbooks, contactos, evidencia, formularios/folios y datos de contingencia.
3. La existencia, ubicación, custodia, disponibilidad técnica o conocimiento de un objeto no conceden derecho a leerlo, modificarlo, exportarlo, compartirlo, restaurarlo, eliminarlo ni utilizarlo para producir un efecto empresarial.
4. La autoridad de mando de `CONT-AUTH-001` no concede lectura universal sobre información sensible del incidente.
5. El acceso extraordinario de `CONT-AUTH-002` no concede contenido por sí solo; debe seguir existiendo autorización sobre la acción y el objeto concretos.
6. La protección de información reutiliza el modelo canónico de identidad, actor efectivo, finalidad, clasificación, recurso, relación, territorio, estado, permiso, denegaciones y auditoría. No se crea un evaluador paralelo para continuidad.
7. Cada acción se autoriza de forma independiente. Leer no concede exportar; custodiar no concede leer; restaurar no concede consultar todos los datos restaurados; ejecutar un runbook no concede administrar los recursos que describe.
8. El expediente transversal de continuidad conserva referencias y datos mínimos cuando la fuente propietaria puede mantener el contenido sensible. No se crea una biblioteca paralela de documentos, secretos, contactos o evidencia.
9. Los secretos, tokens, contraseñas, códigos de recuperación, claves privadas y llaves completas no se incorporan a respaldos de configuración, runbooks, listas de contacto, formularios, bitácoras ni paquetes de evidencia en texto plano.
10. La recuperación de material sensible permanece gobernada por `CONT-AUTH-002`; esta tarea gobierna quién puede conocer, proyectar, transportar o custodiar el contenido y sus referencias.
11. Un respaldo conserva separadas las capacidades de inventariar, leer, restaurar, validar, promover y eliminar. Ninguna de ellas se infiere de otra.
12. Un restore autorizado no habilita consulta indiscriminada del contenido restaurado y no puede reactivar sesiones, permisos, excepciones o accesos revocados.
13. Un runbook conserva versión, finalidad, audiencia y clasificación; su lectura no equivale a autoridad de ejecución.
14. Un runbook no almacena secretos completos y cualquier referencia a credenciales o llaves apunta al mecanismo protegido correspondiente.
15. Los contactos de continuidad se resuelven desde fuentes protegidas vigentes. Cuando basta una función, no se expone identidad nominal.
16. Nombre, teléfono, correo, canal personal, turno, disponibilidad o dato contractual de un contacto solo se revelan cuando la finalidad y el alcance lo requieren.
17. Una lista de contactos no se convierte en directorio general ni en fuente de autoridad sobre personas o proveedores.
18. La evidencia original se preserva; una copia, captura, miniatura, exportación, transcripción o resumen hereda la protección necesaria y no rebaja silenciosamente la sensibilidad de la fuente.
19. Producir evidencia no concede derecho a aprobarla, alterarla, descartarla o cerrar el expediente relacionado.
20. La evidencia necesaria para auditoría, investigación, conciliación o revisión no puede eliminarse para simplificar el cierre operativo o liberar espacio.
21. Los formularios, folios y medios contingentes conservan versión, identidad, custodia, finalidad y trazabilidad. Poseer un formulario vacío o un rango de folios no concede autoridad para producir un efecto empresarial.
22. Las correcciones de un formulario preservan el original; una anulación queda trazable; un folio no se reutiliza para otra intención.
23. El dato capturado durante contingencia es una representación temporal o pendiente de incorporación; no se convierte en fuente empresarial definitiva por haber sido registrado en papel, dispositivo, archivo local o medio alterno.
24. Los datos contingentes se minimizan al conjunto necesario para mantener el resultado permitido y la posterior reincorporación, sin aprovechar la falla para capturar información adicional.
25. La información local/offline se aísla por actor, dispositivo, contexto, sede, área, operación e incidente cuando esas dimensiones sean aplicables.
26. La reconexión o recuperación del sistema no autoriza automáticamente la transferencia de datos contingentes; la incorporación conserva autorización fresca, idempotencia, conflicto y conciliación bajo sus contratos propietarios.
27. Las obtenciones de copia, impresiones, exportaciones, comparticiones, copias físicas y transferencias de información sensible requieren decisión propia sobre destinatario, finalidad, minimización y destino.
28. Una URL firmada, archivo conocido, índice, enlace interno, bucket, copia, captura, canal alterno o posesión física no sustituyen autorización.
29. Los mensajes de error, búsquedas, listados y metadatos no deben revelar nombres, títulos, contactos, fragmentos, ubicaciones o identificadores sensibles a actores no autorizados.
30. Un proveedor o técnico externo recibe únicamente la información mínima necesaria para su intervención y no adquiere autoridad sobre otros dominios por participar en recuperación.
31. Las comunicaciones de crisis conservan la separación entre contenido autorizado y canal de transporte. Cambiar de canal no amplía audiencia ni detalle permitido.
32. Una simulación o ejercicio utiliza información aislada o controlada conforme a su alcance; no convierte material de prueba en información productiva disponible para uso posterior.
33. La exposición accidental de información sensible durante incidente, ejercicio o recuperación se registra, contiene y deriva al propietario de seguridad, privacidad o información aplicable sin borrar la evidencia del evento.
34. El acceso de emergencia a información sensible es mínimo, temporal, justificable, auditable, revocable y revisable conforme al contrato vigente de gobierno de información.
35. `H-CAP-SCOPE-018-032` queda tratado documentalmente mediante autorización exacta, minimización, protección de destinatario/canal, conservación de integridad y prohibición de exposición por urgencia.
36. La tarea no modifica la clasificación corporativa de información, las 332 identidades documentales, las políticas de retención, los permisos canónicos ni la propiedad funcional de los procesos.
37. La tarea no declara que existan hoy controles físicos completos sobre todos los respaldos, runbooks, contactos, formularios o medios contingentes; las instancias reales conservan sus estados de evidencia.
38. La tarea no crea formularios productivos, no emite rangos de folios, no abre respaldos, no publica contactos, no recupera secretos y no ejecuta restauraciones.
39. La separación entre ejecución, validación, reincorporación, conciliación, cierre y revisión posterior permanece en `CONT-AUTH-004`.
40. Se generan **cero cambios TREQ** porque las conductas protegidas ya están cubiertas por requisitos vigentes de continuidad, autorización e información.

---

#### 2. Entradas canónicas conservadas

La tarea consume sin redefinir:

- `VPROC-0062 — Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje`;
- `CONT-DOM-001`, incluida la regla de que una emergencia no elimina autorización, privacidad, integridad, evidencia ni segregación;
- `CONT-DOM-005` y `CONT-DOM-006`, para incidente, severidad, mando, bitácora, comunicaciones y resolución de contactos desde fuentes protegidas;
- `CONT-DOM-007` y `CONT-DOM-008`, para resultado mínimo y modalidad de contingencia sin ampliar los datos necesarios;
- `CONT-DOM-009`, para registro, folios, evidencia, custodia, `local_operation_id`, `idempotency_key`, referencias de evidencia y trabajo ejecutado durante la falla;
- `CONT-DOM-010`, para reincorporación, conflictos, idempotencia y conciliación posteriores;
- `CONT-DOM-011`, para inventario de objetos recuperables, política de seguridad de copias, acceso mínimo y separación entre configuración y secreto;
- `CONT-DOM-012`, para runbooks, orden de recuperación, restore, failover, retorno y validación funcional;
- `CONT-DOM-013`, para proveedores, canales, energía, red, pagos, transporte y recursos alternativos;
- `CONT-DOM-014` y `CONT-DOM-015`, para ejercicios, evidencia vigente, revisión posterior y actualización de contactos/runbooks;
- `CONT-AUTH-001`, que preserva autoridad de mando sin conceder lectura universal sobre objetos sensibles;
- `CONT-AUTH-002`, que gobierna acceso de emergencia y material de recuperación sin convertir la credencial en permiso sobre el contenido;
- `INFO-AUTH-001` a `INFO-AUTH-004`, para clasificación, finalidad, recurso, relación, territorio, estado, salida, segregación, auditoría, investigación y acceso de emergencia a información;
- `EVID-ARC-001` a `EVID-ARC-010`, como arquitectura propietaria de persistencia y enlace de evidencia cuando sea implementada;
- `NFR-REQ-004`, para operación local, aislamiento, identidad, tiempos, evidencia y sincronización;
- `NFR-REQ-005` y `NFR-REQ-006`, para sensibilidad y retención concretas de los medios cuando sean materializadas;
- el modelo canónico de identidad, actor efectivo, permiso, alcance, recurso, contexto, denegaciones, decisión y auditoría;
- los requisitos vigentes de continuidad, autorización, SHELL, privacidad, evidencia e integración aplicables.

No se crea una segunda clasificación de información, un segundo repositorio de evidencia, un directorio paralelo de contactos, un catálogo paralelo de permisos ni una fuente de verdad de contingencia.

---

#### 3. Familias protegidas y frontera de propiedad

| Familia protegida         | Contenido incluido                                                                                                         | Fuente o dominio propietario preservado                                                 | Decisión de `CONT-AUTH-003`                                                                                                     |
| ------------------------- | -------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| **Respaldos**             | copias de datos, archivos, objetos, configuraciones, metadatos, artefactos, colas y referencias de material recuperable    | inventario y política en `CONT-DOM-011`; fuentes técnicas y de información propietarias | proteger inventario sensible, lectura, restauración, validación, promoción, transferencia y eliminación como acciones separadas |
| **Runbooks**              | pasos de recuperación, dependencias, checkpoints, referencias de acceso, validaciones y retorno                            | `CONT-DOM-012` y propietarios técnicos/funcionales                                      | controlar lectura, versión, distribución, copia y uso sin convertir el documento en autoridad técnica                           |
| **Contactos**             | funciones, referencias nominales cuando sean necesarias, teléfonos, correos, canales, escalamiento y disponibilidad        | fuentes organizacionales, laborales, de proveedor y comunicación propietarias           | revelar únicamente la proyección necesaria para función, incidente, finalidad y audiencia                                       |
| **Evidencia**             | documentos, fotografías, capturas, hashes, receipts, registros, auditoría, mediciones y referencias                        | expediente o arquitectura de evidencia propietaria; `CONT-DOM-009`; INFO                | preservar original, clasificación, integridad, custodia, derivaciones y salidas autorizadas                                     |
| **Formularios y folios**  | formularios físicos/digitales, rangos, folios, páginas asociadas, anulaciones y medios de captura                          | `CONT-DOM-009`, paquete propietario y experiencia de estación aplicable                 | proteger emisión, custodia, uso, corrección, traslado y retiro sin otorgar autoridad empresarial por posesión                   |
| **Datos de contingencia** | borradores, capturas locales, operaciones offline, snapshots autorizados, registros manuales y pendientes de incorporación | dominio funcional propietario + contrato local/offline aplicable                        | minimizar, aislar, cifrar/proteger, limitar acceso y mantener estado pendiente hasta incorporación autorizada                   |

El contrato protege las seis familias sin trasladar su propiedad a continuidad.

---

#### 4. Fronteras conceptuales obligatorias

Se fijan las siguientes separaciones:

```text
CUSTODIAR
≠
LEER
≠
MODIFICAR
≠
EXPORTAR
≠
ELIMINAR
```

```text
CONOCER LA UBICACION DE UN OBJETO
≠
TENER AUTORIZACION SOBRE SU CONTENIDO
```

```text
RESPALDO DISPONIBLE
≠
RESPALDO LEGIBLE POR CUALQUIER ACTOR
≠
RESTAURACION AUTORIZADA
```

```text
RESTAURAR DATOS
≠
OBTENER PERMISO PARA CONSULTARLOS
```

```text
RUNBOOK LEGIBLE
≠
AUTORIDAD PARA EJECUTARLO
```

```text
CONTACTO CONOCIDO
≠
DIRECTORIO PUBLICO
≠
AUTORIDAD DEL CONTACTO
```

```text
EVIDENCIA PRODUCIDA
≠
EVIDENCIA APROBADA
≠
AUTORIDAD PARA ALTERARLA O ELIMINARLA
```

```text
FOLIO ASIGNADO
≠
EFECTO EMPRESARIAL CONFIRMADO
```

```text
DATO CONTINGENTE CAPTURADO
≠
HECHO EMPRESARIAL DEFINITIVO
```

```text
ACCESO DE EMERGENCIA
≠
ACCESO UNIVERSAL A INFORMACION
```

```text
URL FIRMADA O ARCHIVO CONOCIDO
≠
AUTORIZACION
```

---

#### 5. Coordenada mínima para autorizar información de continuidad

Toda acción protegida deberá resolver, cuando sea aplicable:

| Dimensión                           | Regla                                                                                                                                                                              |
| ----------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| incidente, recuperación o ejercicio | la necesidad se correlaciona con un contexto real o controlado; no existe acceso flotante por “continuidad”                                                                        |
| acción exacta                       | consultar metadata, leer contenido, crear/capturar, modificar, custodiar, transferir, imprimir, exportar, compartir, restaurar, validar, anular o eliminar se evalúan por separado |
| principal y actor efectivo          | la sesión, dispositivo, proveedor o credencial técnica no sustituyen identidad humana cuando la acción exige actor humano                                                          |
| función ejercida                    | describe el propósito operacional, pero no concede permiso por el nombre de la función                                                                                             |
| finalidad                           | debe ser necesaria para continuidad, recuperación, protección, conciliación, auditoría, investigación o comunicación aprobada según el objeto                                      |
| clasificación                       | se consume la clasificación efectiva vigente; una copia o medio alterno no rebaja la clase                                                                                         |
| recurso                             | objeto, colección, backup, runbook, contacto, evidencia, folio o conjunto exacto desde fuente autoritativa                                                                         |
| relación                            | participación, propiedad funcional, custodia, sujeto o vínculo exigido por el contrato cuando aplique                                                                              |
| territorio                          | sede/área real del recurso y alcance del actor cuando la información esté territorializada                                                                                         |
| estado y versión                    | vigencia, versión, preservación, estado de incidente y transición deben ser compatibles con la acción                                                                              |
| destinatario o destino              | obligatorio para compartir, transferir, imprimir, exportar, restaurar o publicar                                                                                                   |
| política de campos                  | se entrega únicamente la proyección mínima compatible con la finalidad                                                                                                             |
| permiso y modalidad                 | capacidad exacta y prerrequisitos canónicos; no se infiere de rol, aplicación o canal                                                                                              |
| denegaciones                        | toda denegación prevalente conserva su efecto                                                                                                                                      |
| evidencia                           | la decisión y el efecto quedan correlacionables sin registrar secretos completos                                                                                                   |

Una dimensión obligatoria desconocida, ambigua, conflictiva o no verificable produce bloqueo; no se interpreta como alcance global.

---

#### 6. Matriz de acciones protegidas

| Acción conceptual     | Resultado permitido                                                        | Condición adicional                                                         | Prohibición principal                                         |
| --------------------- | -------------------------------------------------------------------------- | --------------------------------------------------------------------------- | ------------------------------------------------------------- |
| `CONSULTAR_METADATA`  | conocer existencia, estado o metadatos mínimos autorizados                 | la metadata misma debe ser segura para el actor                             | no enumerar objetos sensibles mediante metadata               |
| `LEER_CONTENIDO`      | conocer el contenido mínimo necesario                                      | finalidad, clasificación, recurso, relación y proyección compatibles        | acceso a metadata no concede contenido                        |
| `CAPTURAR_O_CREAR`    | producir registro, evidencia o dato contingente                            | actor, medio, versión, finalidad y estado permitidos                        | crear no confirma el efecto empresarial                       |
| `MODIFICAR`           | corregir o actualizar objeto mutable permitido                             | transición y campos autorizados; historial preservado                       | no alterar original preservado ni evidencia inmutable         |
| `CUSTODIAR`           | asumir responsabilidad de conservación o traslado                          | cadena de custodia y alcance explícitos                                     | custodia no concede lectura ilimitada                         |
| `TRANSFERIR`          | entregar un objeto o medio a otro custodio o sistema                       | destinatario, canal, integridad y aceptación verificables                   | no transferir por conveniencia ni a audiencia amplia          |
| `IMPRIMIR`            | generar copia física necesaria                                             | impresora/destino, audiencia, clasificación y retiro controlados            | una impresora accesible no vuelve imprimible el contenido     |
| `EXPORTAR`            | producir una salida controlada                                             | capacidad de salida, destinatario, minimización, formato y propósito        | lectura no concede exportación                                |
| `COMPARTIR`           | habilitar acceso a tercero o equipo autorizado                             | destinatario exacto, vigencia y alcance                                     | un vínculo conocido no concede acceso                         |
| `RESTAURAR`           | reconstruir una copia o conjunto autorizado                                | autoridad técnica, ambiente aislado/permitido y control de acceso posterior | restore no concede lectura masiva ni recuperación empresarial |
| `VALIDAR`             | comprobar integridad, completitud o resultado autorizado                   | método y evidencia definidos                                                | validar técnicamente no aprueba el proceso empresarial        |
| `ANULAR`              | marcar folio, formulario o registro como no utilizable sin borrar historia | razón, actor y referencia conservados                                       | anular no libera el identificador para reutilización          |
| `ELIMINAR_O_DISPONER` | ejecutar una disposición ya autorizada por el gobierno propietario         | retención/hold, autoridad, evidencia y alcance resueltos                    | continuidad no crea una facultad de borrado por urgencia      |

Estas etiquetas son semántica documental y no crean claves de permiso nuevas.

---

#### 7. Protección de respaldos

`CONT-DOM-011` conserva inventario, cobertura, frecuencia, retención, cifrado, separación de dominio de falla, inmutabilidad, monitoreo y restaurabilidad. Esta tarea protege el acceso y la exposición.

##### 7.1. Capacidades separadas

Para un respaldo o cadena recuperable deberán distinguirse, como mínimo:

- inventariar o consultar estado;
- configurar política;
- ejecutar copia;
- leer contenido;
- seleccionar punto recuperable;
- restaurar;
- validar integridad;
- promover el resultado restaurado;
- transferir o replicar a otro dominio autorizado;
- eliminar o expirar conforme a política.

Ninguna capacidad implica las demás.

##### 7.2. Reglas obligatorias

1. conocer que existe un backup no concede acceso a su contenido;
2. administrar el job no concede leer los datos copiados;
3. restaurar en un ambiente autorizado no concede exportar o navegar datos fuera de finalidad;
4. validar integridad puede utilizar hashes, conteos o metadatos suficientes sin abrir contenido cuando el método lo permita;
5. las copias de configuración conservan referencias de secreto y no valores completos;
6. una copia que contenga material sensible accidental se trata según la clasificación real del contenido, no según el nombre del archivo;
7. el acceso de emergencia a una copia sigue el contrato de `CONT-AUTH-002` y la autorización de información aplicable;
8. un proveedor de backup no recibe por contrato comercial derecho a conocer el contenido;
9. el restore de Auth, configuración o datos no reactiva sesiones, permisos, dispositivos o excepciones revocados;
10. una prueba de restauración conserva ambiente, actor, datos usados, finalidad, evidencia y disposición posterior.

##### 7.3. Línea base heredada sin reinterpretación

Se conserva la evidencia actual ya inventariada por `CONT-DOM-011`:

- Storage observado con **14 buckets**, **1101 objetos** y **750891333 bytes** en la fotografía técnica heredada;
- **24 Edge Functions** activas observadas, con reconstrucción completa pendiente de evidencia;
- **7 jobs pg_cron** activos observados;
- esquema `vault` presente sin reproducir ni inventariar valores secretos;
- managed backup y PITR sin visibilidad suficiente en la lectura autorizada disponible;
- al menos una definición cron con material de autenticación embebido, cuyo valor sensible no se reproduce y cuya copia segura permanece bloqueada hasta separar configuración recuperable y secreto.

Esta tarea no reabre esos objetos ni convierte su existencia en cobertura o acceso demostrado.

---

#### 8. Protección de runbooks

Un runbook es una instrucción versionada de recuperación; no es un paquete de privilegios.

##### 8.1. Contenido permitido

Puede incluir, según necesidad:

- identidad y versión del procedimiento;
- objetivo, alcance y prerequisitos;
- dependencias y checkpoints;
- referencias de servicios, recursos y ambientes;
- pasos técnicos y funcionales autorizados;
- condiciones de abortado;
- referencias a mecanismos protegidos de credenciales o llaves;
- criterios de validación y retorno;
- handoffs y propietarios funcionales;
- referencias de evidencia.

No incorpora contraseñas, tokens, códigos de recuperación, claves privadas ni secretos completos.

##### 8.2. Control de distribución

1. el lector debe requerir el runbook por su función y finalidad concreta;
2. la versión vigente debe ser inequívoca;
3. una copia offline o impresa conserva versión y clasificación;
4. una copia retirada o sustituida no se presenta como vigente;
5. la distribución a proveedor se limita a las secciones necesarias para su alcance;
6. una persona puede conocer el procedimiento sin tener autoridad para ejecutar las acciones descritas;
7. los endpoints administrativos, topología sensible y referencias de seguridad se minimizan cuando no son necesarias para la función receptora;
8. cambios materiales disparan revisión conforme al mantenimiento del plan vigente.

---

#### 9. Protección de contactos

Los contactos de continuidad se gobiernan por **función antes que identidad nominal** cuando la operación lo permita.

##### 9.1. Proyección mínima

| Necesidad                     | Proyección permitida                                                                                 |
| ----------------------------- | ---------------------------------------------------------------------------------------------------- |
| localizar una función interna | función, estado de disponibilidad y canal corporativo autorizado cuando sea suficiente               |
| escalar a responsable nominal | identidad mínima y canal necesario para el incidente                                                 |
| contactar proveedor           | organización/servicio, referencia de soporte, persona o canal solo cuando sea necesario y autorizado |
| informar a cliente o tercero  | canal y destinatario definidos por el proceso propietario; no se expone el directorio interno        |
| coordinar autoridad o asesor  | referencia del expediente y contacto estrictamente necesario conforme al dominio propietario         |

##### 9.2. Reglas obligatorias

1. nombre, teléfono, correo y otros datos personales no se duplican en documentos generales si pueden resolverse desde la fuente protegida vigente;
2. un árbol de comunicación puede conservar funciones y referencias sin publicar datos nominales;
3. el acceso a contactos se limita por audiencia, incidente, finalidad y relación;
4. un proveedor no recibe contactos de otros proveedores o trabajadores por conveniencia;
5. un trabajador no recibe un directorio completo por participar en una contingencia;
6. los datos de contacto no se reutilizan para fines comerciales, laborales o analíticos distintos sin fundamento y autorización propios;
7. una lista exportada o impresa mantiene protección y debe retirarse o disponerse conforme al gobierno aplicable;
8. la falta de respuesta se escala sin ampliar automáticamente la audiencia ni revelar más información;
9. el estado de un contacto no se presenta como autoridad empresarial por el solo hecho de estar disponible.

---

#### 10. Protección de evidencia

La evidencia de continuidad debe preservar integridad, contexto y cadena de custodia sin convertirse en un repositorio de datos excesivos.

##### 10.1. Regla raíz

```text
EVIDENCIA ORIGINAL
+
IDENTIDAD Y ORIGEN
+
CLASIFICACION
+
INTEGRIDAD
+
CONTEXTO Y VERSION
+
CUSTODIA
+
ACCESO MINIMO
+
HISTORIA DE DERIVACIONES
=
EVIDENCIA UTILIZABLE SIN PERDER PROTECCION
```

##### 10.2. Invariantes

1. el original no se sobrescribe para incorporar una interpretación posterior;
2. una corrección, anotación o conclusión referencia el original;
3. una fotografía o captura no elimina la custodia del original físico;
4. un hash demuestra integridad únicamente dentro de su método y no concede autorización sobre el contenido;
5. la miniatura, transcripción o resumen no se clasifica automáticamente como menos sensible;
6. obtener una copia de evidencia no concede derecho a compartirla;
7. exportar evidencia exige destinatario y finalidad propios;
8. el actor que produjo una evidencia no obtiene control exclusivo sobre su validación o preservación;
9. una investigación o legal hold aplicable prevalece sobre una disposición ordinaria;
10. las denegaciones, abortos, resultados inciertos y fallos de recuperación también son evidencia y no se omiten para mejorar el resultado;
11. la evidencia de ejercicio se distingue de la evidencia de operación real;
12. una captura con secreto o dato excesivo se contiene y trata como incidente de exposición, no se normaliza como evidencia aceptable.

---

#### 11. Protección de formularios, folios y medios de captura

`CONT-DOM-009` conserva la identidad y la cadena de custodia del trabajo contingente. Esta tarea añade el control de acceso y exposición.

##### 11.1. Identidades que permanecen separadas

```text
REFERENCIA DE INCIDENTE
≠
FOLIO DE CONTINGENCIA
≠
local_operation_id
≠
idempotency_key
≠
evidence_ref
≠
REFERENCIA EMPRESARIAL DEFINITIVA
```

##### 11.2. Reglas de formulario y folio

1. el medio solo captura los campos mínimos aprobados para la modalidad;
2. la versión del formulario debe ser identificable;
3. el folio es estable y no reutilizable;
4. un folio anulado conserva razón, actor y relación con el inventario;
5. los folios no usados permanecen bajo control y no se consideran trabajo ejecutado;
6. las páginas adicionales permanecen ligadas al folio principal;
7. una corrección conserva el valor anterior según el mecanismo aprobado;
8. la posesión de formularios o rangos no concede autorización para registrar una operación fuera del turno, sede, área, recurso o finalidad aplicables;
9. una firma o fotografía se solicita únicamente cuando el proceso la requiere y conserva su sensibilidad propia;
10. no se utiliza un medio improvisado inseguro porque el medio preferido esté indisponible;
11. un formulario físico no se fotografía y abandona sin conservar la custodia que corresponda;
12. una copia digital de un formulario no confirma que el original haya sido incorporado a la fuente empresarial.

##### 11.3. Estado físico vigente

La línea base se conserva sin inventar materializaciones:

```text
FORMULARIOS PRODUCTIVOS IMPLEMENTADOS = 0
RANGOS FISICOS REALMENTE EMITIDOS = 0
REGISTROS DE CONTINGENCIA EJECUTADOS POR ESTA TAREA = 0
```

La disponibilidad física, stock, cifrado local, emisión de rangos y prueba en estación permanecen pendientes de evidencia en sus propietarios ya asignados.

---

#### 12. Protección de datos de contingencia

Los datos producidos durante una falla son temporales respecto de su incorporación, pero no pierden clasificación ni controles.

##### 12.1. Datos mínimos comunes

Cuando el contrato propietario los requiera, se preservan por referencia o captura mínima dimensiones como:

- servicio y estrategia;
- tipo y referencia del registro fuente;
- folio de contingencia;
- `local_operation_id`;
- `idempotency_key`;
- hash de payload cuando aplique;
- principal y actor;
- contexto original;
- turno y check-in cuando apliquen;
- recursos y versiones observadas;
- referencia del sobre de autorización;
- secuencia;
- fuente y versión;
- hora real observada;
- referencias de evidencia.

La presencia de estos campos en el contrato no autoriza a capturarlos si una modalidad o finalidad concreta no los necesita.

##### 12.2. Aislamiento y minimización

1. el almacenamiento local no mezcla actores o contextos sin un contrato que preserve separación;
2. un dispositivo compartido no expone el trabajo pendiente de un actor al siguiente trabajador;
3. la sede o área del dispositivo no reemplaza el territorio real del recurso;
4. los datos de otras sedes o áreas no se copian “por si acaso” durante una falla;
5. una operación offline conserva actor y hora real diferenciados de la hora de sincronización;
6. un dato sensible no se almacena localmente si el modo autorizado no dispone de protección compatible;
7. secretos y tokens no se incorporan al payload de contingencia como mecanismo de recuperación;
8. una copia local no se conserva indefinidamente después de incorporación únicamente por conveniencia;
9. la disposición posterior respeta retención, evidencia, investigación y confirmación de incorporación;
10. un borrador local no se presenta al usuario como efecto empresarial confirmado.

##### 12.3. Reincorporación

La recuperación de conectividad no transforma el trabajo pendiente en una escritura autorizada automática.

Antes del efecto se reevalúan:

- identidad y actor;
- autorización vigente;
- recurso y estado actual;
- idempotencia;
- duplicados;
- conflictos;
- vigencia de la operación;
- evidencia y secuencia;
- efectos parciales o resultados externos inciertos.

La lógica de reincorporación y conciliación permanece en `CONT-DOM-010` y `CONT-INT-004`.

---

#### 13. Funciones de continuidad y proyección mínima

Las funciones siguientes describen necesidades típicas, **no permisos**. Toda acción continúa sujeta a la decisión canónica exacta.

| Función                          | Información mínima normalmente necesaria                                                                                       | Información que no obtiene por la función                                                           |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------- |
| `RESPONSABLE_DE_CONTINUIDAD`     | estado, impacto, decisiones, pendientes, referencias de evidencia, contactos funcionales y versiones necesarias para coordinar | secretos, contenido completo de respaldos, expedientes sensibles ajenos o directorios completos     |
| `CONTINUADOR_DE_CONTINUIDAD`     | misma proyección de mando únicamente durante sustitución efectiva y dentro del alcance delegado                                | acceso adicional por ser sustituto o información fuera del alcance del relevo                       |
| `RESPONSABLE_DEL_PROCESO`        | datos y evidencia necesarios para validar su resultado empresarial y pendientes propios                                        | contenido técnico o de otros procesos sin necesidad y autorización                                  |
| `COORDINACION_DE_OPERACIONES`    | estado operativo, recursos, tareas, contactos funcionales y registros del alcance coordinado                                   | datos personales o secretos no necesarios para coordinar                                            |
| `RESPONSABLE_TECNOLOGICO`        | runbooks, health, dependencias, metadata de backup y evidencia técnica necesaria                                               | acceso universal a datos empresariales o información personal por ser técnico                       |
| `CUSTODIO_DOCUMENTAL`            | metadata, clasificación, retención, custodia, integridad y referencias necesarias                                              | lectura sustantiva ilimitada cuando la custodia puede ejercerse sin ella                            |
| función de seguridad/privacidad  | información necesaria para evaluar exposición, control, incidente o excepción de su ámbito                                     | acceso transversal a expedientes no relacionados                                                    |
| `GERENCIA_O_SUPERVISION_DE_SEDE` | impacto, estado, acciones y contactos necesarios del territorio autorizado                                                     | información de otras sedes o detalle técnico no necesario                                           |
| `EQUIPO_OPERATIVO_DEL_AREA`      | instrucciones, formulario o datos mínimos para ejecutar la contingencia aprobada                                               | directorios, backups, secretos, investigación o evidencia fuera de su tarea                         |
| proveedor o tercero              | runbook parcial, referencia de caso, recurso, síntomas y evidencia estrictamente necesarios                                    | directorio interno, secretos de otros dominios, datos completos del proceso o autoridad empresarial |

La función permite justificar necesidad; el permiso, alcance, recurso y contexto determinan la autorización.

---

#### 14. Acceso de emergencia a información sensible

Se consumen conjuntamente `CONT-AUTH-002` e `INFO-AUTH-004`.

Una concesión de acceso de emergencia a información debe conservar, como mínimo:

- referencia única de la concesión;
- actor y autoridad;
- razón y justificación;
- incidente, recuperación, investigación o caso correlacionado;
- acción exacta;
- objeto o colección exactos;
- clasificación y finalidad;
- alcance y campos permitidos;
- inicio y expiración;
- destinatario/destino cuando exista salida;
- decisión y razones;
- evidencia de uso;
- revocación o cierre del acceso;
- revisión posterior aplicable.

Reglas:

1. la concesión no se expresa como rol permanente ni permiso general;
2. la activación de continuidad no crea la concesión;
3. una concesión de break-glass técnico no implica autorización de lectura;
4. extender el acceso exige autoridad y justificación vigentes;
5. no existe renovación silenciosa;
6. revocar conserva auditoría y evidencia del uso;
7. un actor investigado no utiliza la emergencia para alterar evidencia relacionada consigo mismo;
8. la emergencia nunca permite borrar auditoría, investigación o evidencia preservada;
9. los resultados de una consulta de emergencia siguen sujetos a minimización y salida controlada.

---

#### 15. Obtención de copia, exportación, impresión, compartición y canales

Toda salida crea una nueva superficie de exposición y debe conservar protección.

##### 15.1. Controles mínimos

Antes de producir una salida se resuelven:

- actor;
- acción de salida exacta;
- fuente;
- clasificación;
- finalidad;
- destinatario;
- campos y periodo;
- volumen;
- formato;
- destino o canal;
- protección en tránsito y reposo aplicable;
- expiración o retiro cuando corresponda;
- evidencia de emisión/entrega;
- restricciones de reenvío o redistribución cuando procedan.

##### 15.2. Prohibiciones

- exportar el universo completo cuando basta una proyección;
- imprimir información sensible en una impresora o ubicación no gobernada;
- usar mensajería personal para evitar un control del canal aprobado;
- enviar capturas con secretos o datos no necesarios;
- publicar listas nominales de contacto en una superficie amplia;
- compartir un backup o runbook completo con un proveedor cuando basta un fragmento;
- convertir una URL temporal en enlace permanente por reenvío;
- usar un error o resultado de búsqueda para confirmar la existencia de un objeto no autorizado.

La salida queda sujeta al gobierno de información y a la comunicación de crisis aplicable.

---

#### 16. Copias físicas, offline y dispositivos compartidos

1. una copia física conserva clasificación, versión, custodio y condición de retiro;
2. dejar una hoja visible en una estación compartida no constituye custodia aceptable;
3. un dispositivo compartido debe impedir que el siguiente actor herede datos, archivos, previews o formularios del anterior;
4. un archivo local de contingencia no se considera protegido solo por estar dentro de una aplicación;
5. cifrado, bloqueo y almacenamiento técnico deben corresponder a la sensibilidad del contenido y al mecanismo aprobado;
6. una copia offline retirada de uso debe quedar invalidada como versión operativa y disponerse según la política aplicable;
7. una fotografía tomada para evidencia no se mantiene en galerías, chats o servicios personales no autorizados;
8. una impresora o scanner no adquiere autoridad por estar dentro de la sede;
9. el traslado físico entre custodios registra entrega y recepción cuando la sensibilidad o medio lo requieren;
10. la pérdida de un medio físico o dispositivo con datos contingentes se trata como evento de seguridad/privacidad y continuidad, no como simple faltante operativo.

---

#### 17. Frescura, versiones y mantenimiento

Los objetos de continuidad pueden volverse inseguros por obsolescencia aunque no cambie su clasificación.

Disparan revisión, según el objeto:

- cambio de persona, función, vínculo o contacto;
- cambio de proveedor o canal;
- cambio de aplicación, ambiente, recurso o endpoint administrativo;
- cambio de clasificación o finalidad;
- cambio de runbook, estrategia o dependencia;
- cambio de política de backup o mecanismo de recuperación;
- cambio de formulario, campos, folio, impresión o medio local;
- hallazgo de ejercicio o incidente;
- exposición de información;
- cambio de retención, hold o requisito regulatorio;
- sustitución de secreto, certificado o llave referenciada;
- vencimiento de una revisión basada en riesgo.

Una versión nueva no reescribe qué versión fue utilizada durante un incidente o ejercicio anterior.

Los contactos y runbooks no se consideran vigentes por existir; deben conservar evidencia de revisión conforme al mantenimiento definido por `CONT-DOM-015`.

---

#### 18. Estado documental y AS-IS reconciliado

| Materia                                          | Evidencia canónica actual                                                                 | Estado posterior a esta tarea                                     | Condición de salida                                                          |
| ------------------------------------------------ | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| gobierno de acceso a las seis familias           | reglas de continuidad, autorización e información vigentes                                | `ESPECIFICADO`                                                    | implementación posterior bajo paquetes propietarios                          |
| clasificación y finalidad corporativas           | gobierno INFO aprobado                                                                    | `ESPECIFICADO` y reutilizado                                      | no se crea clasificación paralela                                            |
| política de seguridad de respaldos               | `CONT-DOM-011` definida                                                                   | `ESPECIFICADO` documentalmente                                    | controles físicos y pruebas según propietarios técnicos                      |
| acceso real al contenido de backups              | no se acredita inventario completo de actores/capacidades productivas en esta tarea       | `PENDIENTE_DE_EVIDENCIA`                                          | bindings reales, permisos, ambientes y pruebas de acceso mínimo              |
| managed backup / PITR                            | visibilidad insuficiente en la lectura autorizada heredada                                | `PENDIENTE_DE_EVIDENCIA`                                          | configuración, alcance y prueba acreditados por fuente propietaria           |
| material sensible embebido en configuración cron | evidencia heredada de al menos una definición con material sensible, valor no reproducido | `BLOQUEADO` para copia segura mientras no exista separación       | separar secreto de configuración recuperable y probar el mecanismo protegido |
| Vault/secretos                                   | esquema observado sin inventario de valores reproducido                                   | `PENDIENTE_DE_EVIDENCIA`                                          | inventario protegido y mecanismo de recuperación autorizado                  |
| runbooks                                         | contrato de recuperación definido; vigencia física depende de instancias y evidencia      | `ESPECIFICADO`; instancias reales `PENDIENTE_DE_EVIDENCIA`        | versiones publicadas, accesibles a funciones correctas y probadas            |
| contactos de continuidad                         | modelo funcional definido; datos nominales no se duplican en el plan                      | `ESPECIFICADO`; instancias reales dependen de fuentes protegidas  | contactos vigentes, revisados y resolubles en ejercicio/incidente autorizado |
| evidencia de contingencia                        | contrato documental y referencias definidos                                               | `ESPECIFICADO`; persistencia transversal `PENDIENTE_DE_EVIDENCIA` | arquitectura EVID y consumidoras implementadas/probadas                      |
| formularios productivos                          | línea base heredada: cero formatos productivos materializados por continuidad             | `PENDIENTE_DE_EVIDENCIA`                                          | formato consumible, inventario y prueba en estación por paquete propietario  |
| rangos físicos de folios                         | línea base heredada: cero rangos realmente emitidos                                       | `PENDIENTE_DE_EVIDENCIA`                                          | rangos emitidos, inventariados, custodiados y probados                       |
| datos locales/offline                            | contratos de identidad, aislamiento y reincorporación definidos                           | `PENDIENTE_DE_EVIDENCIA` por paquete/dispositivo                  | almacenamiento, cifrado, reautorización y prueba de reinicio/reconexión      |
| acceso de emergencia a información               | contrato INFO y break-glass vigente                                                       | `ESPECIFICADO`; ejecución real no creada aquí                     | implementación y evidencia de concesión/revocación en ambiente autorizado    |
| exposición real causada por esta tarea           | ninguna                                                                                   | `NO_EJECUTADO_POR_ESTA_TAREA`                                     | no aplica a cierre documental                                                |

La ausencia de evidencia de una instancia no se interpreta como inexistencia física; únicamente impide declararla implementada o validada.

---

#### 19. Tratamiento de `H-CAP-SCOPE-018-032`

Hallazgo:

`H-CAP-SCOPE-018-032 — Información sensible del incidente puede divulgarse indebidamente.`

Tratamiento materializado:

- la información del incidente conserva clasificación y finalidad;
- el mando no obtiene lectura universal;
- cada acción y salida exige autorización propia;
- el expediente transversal usa referencias y proyecciones mínimas cuando la fuente propietaria puede conservar el contenido;
- contactos nominales se revelan solo cuando la función y finalidad lo requieren;
- backups, runbooks, evidencia, formularios y datos contingentes conservan control por objeto y acción;
- URLs, archivos conocidos, búsquedas, buckets, dispositivos, copias o posesión física no otorgan acceso;
- canales alternos no amplían audiencia;
- exportaciones, impresiones y comparticiones limitan destinatario, campos, periodo y volumen;
- secretos completos no se incorporan a la documentación operativa;
- el acceso de emergencia es temporal, mínimo, justificado, auditado y revocable;
- una evidencia o copia derivada no pierde protección por cambiar de formato;
- una exposición accidental se contiene, preserva como evidencia y se deriva al propietario correspondiente.

**Estado documental:** `ESPECIFICADO`; implementación física, bindings reales y evidencia operativa permanecen en los propietarios técnicos y paquetes autorizados.

---

#### 20. Fronteras y handoffs obligatorios

| Materia fuera del resultado físico de esta tarea                                         | Propietario                                          | Condición de salida                                                      |
| ---------------------------------------------------------------------------------------- | ---------------------------------------------------- | ------------------------------------------------------------------------ |
| acceso técnico extraordinario, break-glass, credenciales, llaves y revocación            | `CONT-AUTH-002`                                      | antes de liberar privilegio o material de recuperación real              |
| separación entre ejecución, validación, reincorporación, conciliación, cierre y revisión | `CONT-AUTH-004`                                      | antes de certificar cierre operacional                                   |
| inventario, frecuencia, retención, cifrado y cobertura de respaldos                      | `CONT-DOM-011`                                       | antes de afirmar cobertura recuperable                                   |
| restore, runbook técnico, failover, failback y validación funcional                      | `CONT-DOM-012`                                       | antes de ejecutar recuperación real                                      |
| formularios, folios, identidad y custodia de trabajo contingente                         | `CONT-DOM-009` y paquetes propietarios               | antes de operar un medio productivo                                      |
| reincorporación, conflicto e idempotencia                                                | `CONT-DOM-010`, `CONT-INT-004`                       | antes de convertir trabajo contingente en hecho empresarial              |
| clasificación, privacidad, retención, auditoría e investigación                          | BLOQUE AA y gobierno documental vigente              | antes de abrir, exportar, preservar o disponer información según el caso |
| persistencia y enlace de evidencia                                                       | `EVID-ARC-001` a `EVID-ARC-010` y paquete consumidor | antes de declarar evidencia transversal materializada                    |
| experiencia de ejecución de runbooks                                                     | `CONT-UX-003`                                        | antes de implementar guía interactiva por función/proceso/sede           |
| captura y reincorporación                                                                | `CONT-UX-004`                                        | antes de implementar experiencia de medios contingentes                  |
| seguimiento de backup/restore                                                            | `CONT-UX-005`                                        | antes de implementar superficie de estado y pendientes                   |
| comunicaciones y contactos                                                               | `CONT-UX-006`                                        | antes de implementar plantillas y canales de crisis                      |
| ejercicios y readiness                                                                   | `CONT-DOM-014`, `CONT-UX-007`, BLOQUE U              | antes de declarar protección ejecutable y vigente                        |

No queda un pendiente material identificado por esta tarea sin propietario y condición de salida.

---

#### 21. Cobertura vigente de prueba

La conducta protegida ya dispone de cobertura canónica suficiente:

- el requisito de incidentes de continuidad ya protege responsables, decisiones, comunicaciones, autoridad, cronología y exposición sensible;
- el requisito de contingencia ya exige datos mínimos, formularios o identificadores controlados, vigencia, custodia y seguridad sin segunda fuente de verdad;
- el requisito de respaldos ya exige inventario, cifrado, acceso mínimo, separación de falla, integridad, restauración y recuperación segura de secretos;
- el requisito de reincorporación ya exige origen, actor, tiempo real, versión, evidencia, secuencia, conflictos y conciliación;
- el requisito de ejercicios ya exige seguridad, evidencia, pendientes, actualización de contactos/runbooks y readiness vigente;
- la autorización transversal ya impide bypass por interfaz, URL, API o RPC y exige evidencia correlacionable de cada decisión;
- el gobierno SHELL de información ya protege consulta, búsqueda, impresión, exportación, compartición, clasificación, finalidad, recurso, destinatario y acceso extraordinario mínimo;
- el gobierno de información ya protege auditoría, investigaciones, logs, evidencia preservada y acceso de emergencia sin privilegio permanente.

`CONT-AUTH-003` materializa esas reglas para las seis familias de continuidad sin introducir una conducta protegida distinta.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea especializa para continuidad controles ya registrados sobre autorización por acción y recurso, minimización, custodia, seguridad de medios contingentes, acceso a respaldos, protección de evidencia, salidas de información, acceso extraordinario temporal y auditoría. No introduce una conducta verificable nueva fuera de esa cobertura ni cambia el significado de un requisito vigente.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 22. Estados documentales de cierre

| Materia                                              | Estado                                                                      |
| ---------------------------------------------------- | --------------------------------------------------------------------------- |
| protección transversal de las seis familias          | `ESPECIFICADO`                                                              |
| separación custodia / lectura / salida / eliminación | `ESPECIFICADO`                                                              |
| protección de respaldos                              | `ESPECIFICADO`; bindings reales `PENDIENTE_DE_EVIDENCIA`                    |
| protección de runbooks                               | `ESPECIFICADO`; distribución real `PENDIENTE_DE_EVIDENCIA`                  |
| protección de contactos                              | `ESPECIFICADO`; disponibilidad nominal real depende de fuentes propietarias |
| protección de evidencia                              | `ESPECIFICADO`; persistencia transversal `PENDIENTE_DE_EVIDENCIA`           |
| protección de formularios y folios                   | `ESPECIFICADO`; materialización física `PENDIENTE_DE_EVIDENCIA`             |
| protección de datos contingentes                     | `ESPECIFICADO`; almacenamiento por paquete `PENDIENTE_DE_EVIDENCIA`         |
| material sensible embebido en configuración cron     | `BLOQUEADO` para copia segura hasta separación                              |
| acceso de emergencia a información                   | `ESPECIFICADO`; ejecución real no creada por esta tarea                     |
| `H-CAP-SCOPE-018-032`                                | `ESPECIFICADO` documentalmente                                              |
| implementación física                                | `PENDIENTE_DE_EVIDENCIA`; no autorizada en esta fase                        |
| incidentes, restores o ejercicios reales ejecutados  | `NO_EJECUTADO_POR_ESTA_TAREA`                                               |

---

#### 23. Criterios de aceptación

1. La tarea conserva `CONT-AUTH-002` como anterior aprobada.
2. La tarea reserva únicamente `CONT-AUTH-004` como siguiente.
3. La tarea permanece exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`.
4. No crea código, migraciones, DDL, DML, RLS, RPC, datos ni configuración.
5. No abre ni modifica respaldos reales.
6. No ejecuta restore.
7. No ejecuta failover ni failback.
8. No recupera secretos reales.
9. No publica contactos reales.
10. No crea formularios productivos.
11. No emite rangos físicos de folios.
12. No ejecuta captura real de contingencia.
13. No declara readiness operativo.
14. Se protegen exactamente seis familias de objeto.
15. Las seis familias conservan sus propietarios originales.
16. Continuidad no crea una biblioteca paralela de información.
17. Custodia permanece distinta de lectura.
18. Lectura permanece distinta de modificación.
19. Lectura permanece distinta de exportación.
20. Lectura permanece distinta de compartición.
21. Lectura permanece distinta de impresión.
22. Custodia permanece distinta de eliminación.
23. Conocer la ubicación de un objeto no concede su contenido.
24. Conocer un identificador no concede el recurso.
25. Una URL firmada no sustituye autorización.
26. Un archivo conocido no sustituye autorización.
27. Un bucket conocido no sustituye autorización.
28. Una búsqueda no puede enumerar información sensible a actor no autorizado.
29. Un mensaje de error no revela contenido sensible innecesario.
30. La urgencia no rebaja clasificación.
31. La urgencia no elimina finalidad.
32. La urgencia no amplía territorio.
33. La urgencia no crea permiso.
34. El mando no obtiene lectura universal.
35. Break-glass técnico no concede lectura universal.
36. Cada acción protegida se resuelve por separado.
37. La acción exacta conserva recurso exacto.
38. La acción exacta conserva actor efectivo.
39. La acción exacta conserva finalidad.
40. La acción exacta conserva clasificación.
41. La acción exacta conserva estado y versión.
42. La acción exacta conserva destinatario cuando existe salida.
43. La acción exacta conserva política de campos.
44. Las denegaciones aplicables continúan prevaleciendo.
45. Un valor desconocido no significa alcance global.
46. Un valor ambiguo no significa acceso permitido.
47. Un valor conflictivo bloquea el efecto protegido.
48. La metadata sensible recibe protección propia.
49. Consultar metadata no concede contenido.
50. Leer contenido no concede modificarlo.
51. Crear un registro no confirma efecto empresarial.
52. Modificar un objeto no permite alterar un original preservado.
53. Custodiar no concede uso para otra finalidad.
54. Transferir exige destinatario y canal autorizados.
55. Imprimir exige destino físico autorizado.
56. Exportar exige capacidad de salida propia.
57. Compartir exige destinatario y alcance explícitos.
58. Restaurar no concede navegación masiva de datos.
59. Validar técnicamente no declara recuperación empresarial.
60. Anular un folio no libera su identidad para reutilización.
61. Eliminar o disponer exige autoridad del gobierno propietario.
62. Administrar un job de backup no concede leer el backup.
63. Ejecutar una copia no concede restaurarla.
64. Restaurar una copia no concede promoverla.
65. Promover una restauración no declara recuperación empresarial.
66. La validación de integridad minimiza contenido cuando el método lo permite.
67. Configuración recuperable y secreto permanecen separados.
68. Un manifiesto no contiene secretos completos.
69. Un runbook no contiene contraseñas completas.
70. Un runbook no contiene tokens completos.
71. Un runbook no contiene códigos de recuperación completos.
72. Un runbook no contiene claves privadas completas.
73. Un runbook legible no concede autoridad de ejecución.
74. Una copia offline de runbook conserva versión.
75. Una copia offline de runbook conserva clasificación.
76. Una versión sustituida no se presenta como vigente.
77. Un proveedor recibe solo la sección del runbook necesaria.
78. El contacto se representa por función cuando la identidad nominal no es necesaria.
79. Un contacto nominal solo se expone cuando la finalidad lo requiere.
80. Una lista de contactos no se convierte en directorio general.
81. Participar en un incidente no concede directorio completo.
82. Un proveedor no recibe contactos ajenos por conveniencia.
83. Los datos de contacto no se reutilizan para otra finalidad por inferencia.
84. Una lista física de contactos conserva protección.
85. Una lista exportada de contactos conserva protección.
86. Falta de respuesta no amplía automáticamente audiencia.
87. La disponibilidad de un contacto no crea autoridad empresarial.
88. La evidencia original se preserva.
89. Una corrección referencia el original.
90. Una anotación posterior no reescribe el hecho original.
91. Fotografiar un original no elimina su custodia.
92. Un hash no concede acceso al contenido.
93. Una transcripción conserva protección derivada.
94. Un resumen conserva protección suficiente según su contenido.
95. Obtener una copia de evidencia no concede compartirla.
96. Exportar evidencia exige destinatario y finalidad.
97. El productor de evidencia no obtiene control exclusivo sobre su validación.
98. Un hold o investigación aplicable bloquea disposición ordinaria.
99. Una denegación también se conserva como evidencia cuando corresponde.
100. Un ejercicio abortado conserva evidencia del abortado.
101. Evidencia de ejercicio se distingue de evidencia real.
102. Una captura con secreto no se normaliza como evidencia aceptable.
103. El folio permanece distinto de la referencia de incidente.
104. El folio permanece distinto de `local_operation_id`.
105. El folio permanece distinto de `idempotency_key`.
106. `evidence_ref` permanece distinto del identificador de trabajo.
107. La referencia empresarial definitiva aparece solo cuando el dominio propietario confirma el hecho.
108. Un receipt externo no se inventa.
109. El formulario conserva versión identificable.
110. El folio es estable.
111. El folio no se reutiliza.
112. La anulación de folio conserva razón y actor.
113. Los folios no usados permanecen controlados.
114. Las páginas adicionales quedan ligadas al folio principal.
115. Las correcciones conservan el dato anterior según el mecanismo aprobado.
116. Poseer un formulario no concede autoridad para operar.
117. Poseer un rango de folios no concede autoridad para operar.
118. Una firma solo se captura cuando el proceso la requiere.
119. Una fotografía solo se captura cuando el proceso la requiere.
120. La indisponibilidad del medio preferido no autoriza un medio inseguro.
121. Una copia digital no confirma incorporación del original.
122. Los formularios productivos materializados por esta tarea permanecen en cero.
123. Los rangos físicos emitidos por esta tarea permanecen en cero.
124. Los registros de contingencia ejecutados por esta tarea permanecen en cero.
125. Los datos contingentes no se convierten en fuente empresarial definitiva.
126. El almacenamiento local conserva aislamiento del actor cuando aplica.
127. El almacenamiento local conserva aislamiento del dispositivo cuando aplica.
128. El almacenamiento local conserva aislamiento del contexto cuando aplica.
129. El almacenamiento local conserva aislamiento territorial cuando aplica.
130. El siguiente trabajador no hereda datos del actor anterior en dispositivo compartido.
131. La sede del dispositivo no sustituye el territorio del recurso.
132. No se copian datos de otras sedes por conveniencia.
133. `observed_at` no se sustituye por la hora de sincronización.
134. Un dato sensible no se almacena localmente sin protección compatible.
135. Un token no se incorpora al payload contingente como mecanismo de recuperación.
136. Una copia local no se conserva indefinidamente por conveniencia.
137. La disposición local espera confirmación y reglas de retención aplicables.
138. Un borrador local no se muestra como efecto confirmado.
139. La reconexión no ejecuta automáticamente trabajo pendiente.
140. La reincorporación reevalúa autorización antes del efecto.
141. La reincorporación conserva idempotencia.
142. La reincorporación detecta duplicados.
143. La reincorporación detecta conflictos.
144. La reincorporación conserva evidencia y secuencia.
145. Un resultado externo incierto no se repite ciegamente.
146. La función de continuidad no sustituye permiso.
147. `RESPONSABLE_DE_CONTINUIDAD` recibe solo la proyección necesaria para coordinar.
148. `RESPONSABLE_TECNOLOGICO` no obtiene acceso universal por su función.
149. `CUSTODIO_DOCUMENTAL` no obtiene lectura sustantiva ilimitada por custodiar.
150. Un proveedor recibe únicamente información necesaria para su intervención.
151. El acceso de emergencia a información es una concesión concreta y temporal.
152. Activar continuidad no crea acceso de emergencia a información.
153. Extender acceso de emergencia exige nueva autoridad y justificación vigente.
154. Revocar acceso de emergencia conserva evidencia de uso.
155. La emergencia no permite borrar auditoría o evidencia preservada.
156. Un actor investigado no usa la emergencia para alterar evidencia relacionada consigo mismo.
157. Toda salida sensible resuelve fuente y clasificación.
158. Toda salida sensible resuelve finalidad y destinatario.
159. Toda salida sensible limita campos, periodo y volumen.
160. Una impresora accesible no vuelve imprimible cualquier contenido.
161. Un canal personal no sustituye el canal gobernado por conveniencia.
162. Una captura no debe transportar datos innecesarios.
163. Un proveedor no recibe un backup completo cuando basta una proyección.
164. Un vínculo temporal no se convierte en acceso permanente por reenvío.
165. Una copia física conserva custodio y condición de retiro.
166. Una estación compartida no deja información sensible visible al siguiente actor.
167. Una galería o chat personal no se usa como repositorio de evidencia.
168. El traslado físico conserva entrega/recepción cuando corresponde.
169. La pérdida de un medio sensible se trata como evento de seguridad/privacidad y continuidad.
170. Un cambio de contacto dispara revisión aplicable.
171. Un cambio de proveedor o canal dispara revisión aplicable.
172. Un cambio de clasificación o finalidad dispara revisión aplicable.
173. Un cambio material de runbook dispara revisión aplicable.
174. Un cambio de mecanismo de backup o recuperación dispara revisión aplicable.
175. Un cambio de formulario o medio local dispara revisión aplicable.
176. Un hallazgo de ejercicio o incidente puede disparar revisión.
177. Una exposición de información dispara revisión.
178. Una versión nueva no reescribe la versión usada históricamente.
179. Un contacto no se considera vigente solo por existir.
180. Un runbook no se considera vigente solo por existir.
181. La fotografía técnica heredada de Storage no se interpreta como permiso de acceso.
182. Los 14 buckets heredados no se declaran recuperables por su mera existencia.
183. Los 24 Edge Functions heredados no se declaran reconstruibles sin evidencia.
184. Los 7 jobs pg_cron heredados no se declaran seguros por estar definidos.
185. El esquema `vault` no implica inventario completo de secretos.
186. Managed backup no se declara ausente ni habilitado sin evidencia.
187. PITR no se declara ausente ni habilitado sin evidencia.
188. El material sensible embebido en configuración cron permanece bloqueado para copia segura hasta separación.
189. `H-CAP-SCOPE-018-032` queda tratado documentalmente.
190. La implementación física permanece pendiente de la fase autorizada correspondiente.
191. `CONT-AUTH-004` conserva separación de ejecución, validación, conciliación, cierre y revisión.
192. `CONT-DOM-011` conserva inventario y política de respaldos.
193. `CONT-DOM-012` conserva restore, runbooks, failover y retorno.
194. `CONT-DOM-009` conserva identidad, folios y custodia del trabajo contingente.
195. `CONT-DOM-010` y `CONT-INT-004` conservan reincorporación y conciliación.
196. BLOQUE AA conserva clasificación, privacidad, auditoría, retención e investigación.
197. EVID conserva persistencia y enlace técnico de evidencia.
198. La tarea no crea un segundo catálogo de permisos.
199. La tarea no crea una segunda clasificación de información.
200. La tarea no crea un repositorio paralelo de contactos o evidencia.
201. La tarea no crea cuentas, roles o credenciales nuevas.
202. La tarea no inventa identidades nominales de contacto.
203. La tarea no inventa secretos, tokens o llaves.
204. La tarea no inventa resultados de restauración.
205. La tarea no inventa evidencia de ejercicio o incidente real.
206. La tarea crea cero requisitos de prueba.
207. La tarea modifica cero requisitos de prueba.
208. La tarea difiere cero requisitos de prueba.
209. La tarea descarta cero requisitos de prueba.
210. La tarea vuelve obsoletos cero requisitos de prueba.
211. No se genera una copia innecesaria del registro canónico de requisitos.
212. La tarea deja `CONT-AUTH-004` únicamente reservada.

---

#### 24. Balance de cierre

| Control                                    |                         Resultado |
| ------------------------------------------ | --------------------------------: |
| familias protegidas                        |                         **6 / 6** |
| acciones conceptuales diferenciadas        |                            **13** |
| hallazgo propietario tratado               | **1 / 1** (`H-CAP-SCOPE-018-032`) |
| formularios productivos creados            |                             **0** |
| rangos físicos emitidos                    |                             **0** |
| respaldos abiertos o restaurados           |                             **0** |
| contactos nominales incorporados           |                             **0** |
| secretos reproducidos                      |                             **0** |
| incidentes o ejercicios reales ejecutados  |                             **0** |
| cambios físicos                            |                             **0** |
| requisitos de prueba creados o modificados |                             **0** |
| criterios de aceptación                    |                           **212** |

---

#### 25. Continuidad

ÚLTIMA TAREA APROBADA

`CONT-AUTH-002 — Proteger acceso de emergencia, credenciales de recuperación, break-glass, failover y revocación`

TAREA ACTUAL APROBADA

`CONT-AUTH-003 — Proteger respaldos, runbooks, contactos, evidencia, formularios y datos de contingencia`

SIGUIENTE TAREA RESERVADA

`CONT-AUTH-004 — Separar ejecución, validación, reincorporación, conciliación, cierre y revisión posterior`


### ✅ CONT-AUTH-004 — Separar ejecución, validación, reincorporación, conciliación, cierre y revisión posterior

**Estado:** APROBADA
**Tarea anterior:** `CONT-AUTH-003 — Proteger respaldos, runbooks, contactos, evidencia, formularios y datos de contingencia` — APROBADA
**Tarea siguiente:** `CONT-UX-001 — Diseñar inicio ejecutivo de continuidad con estado, impacto, prioridades, responsables y decisiones` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de autorización, segregación, independencia funcional y evidencia para ejecución, validación técnica y funcional, reincorporación, conciliación, recuperación total, cierre de continuidad y revisión posterior
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/AC_CONTINUIDAD_OPERATIVA_Y_RECUPERACION/02_AUTORIZACION_DE_EMERGENCIA_Y_RECUPERACION.md`
**Fase:** exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, tablas, RLS, RPC, funciones, Edge Functions, migraciones, datos, permisos, grants, sesiones, secretos, respaldos, restauraciones, colas, integraciones, formularios, dispositivos, proveedores, infraestructura ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Materializar la separación de autoridad que impide que una persona, equipo, proveedor, servicio técnico, automatización o función que ejecutó una contingencia o recuperación pueda convertir por sí mismo su propia ejecución en validación, conciliación, recuperación total, cierre o eficacia demostrada.

La tarea completa el gobierno de autorización de `VPROC-0062` desde la ejecución de la respuesta hasta el aprendizaje posterior y debe permitir resolver de forma determinista:

```text
quién puede ejecutar una acción de continuidad
quién puede validar el resultado técnico
quién puede validar el resultado empresarial
quién puede admitir trabajo contingente para reincorporación
quién puede resolver conflictos de reincorporación
quién puede conciliar efectos por dominio
qué evidencia permite declarar recuperación total
quién puede proponer el cierre
quién puede aprobar el cierre
qué pendientes bloquean el cierre
qué pendientes pueden continuar después del cierre
cómo se evita que la misma persona se autocertifique
cómo se gobierna una organización pequeña cuando varias funciones recaen en la misma persona
cómo se mantiene separada la revisión posterior del cierre operativo
quién puede verificar la eficacia de una acción posterior
cómo se preservan historia, denegaciones y decisiones
```

Esta tarea no ejecuta una recuperación real, no reincorpora trabajo real, no concilia transacciones reales, no cierra un incidente real y no produce evidencia operativa nueva.

---

#### 2. Resultado sustantivo

`CONT-AUTH-004` queda definida con las siguientes decisiones obligatorias:

1. ejecución, validación técnica, validación funcional, reincorporación, conciliación, recuperación total, cierre y revisión posterior son actos distintos;
2. quien ejecuta una acción no obtiene por ejecución autoridad para aprobar su resultado;
3. la restauración o disponibilidad técnica no constituye recuperación empresarial;
4. la validación técnica confirma el componente dentro de su alcance, pero no valida el MBCO ni el resultado del proceso;
5. la validación funcional corresponde al propietario del resultado empresarial o a una función autorizada por ese propietario;
6. la reincorporación de trabajo contingente exige una decisión actual de admisión antes de producir o confirmar un efecto propietario;
7. la digitalización, sincronización o replay técnico no constituye por sí solo reincorporación aceptada;
8. un conflicto, resultado desconocido, unidad en cuarentena o conciliación requerida no puede ser convertido en éxito por el ejecutor;
9. la conciliación pertenece a los dominios propietarios de los efectos y no a una autoridad técnica transversal;
10. una conciliación entre dominios exige que cada extremo reconozca su propio hecho o disposición; un único sistema no certifica al otro;
11. la recuperación total es una decisión empresarial protegida distinta de restauración, retorno técnico, desactivación y cierre;
12. `RESPONSABLE_DE_CONTINUIDAD` coordina y puede proponer recuperación total o cierre, pero no sustituye validaciones funcionales de los propietarios;
13. la aprobación final de recuperación total y cierre de `VPROC-0062` corresponde a `GERENCIA_GENERAL` o `GOBIERNO_Y_PROPIEDAD` según severidad y delegación vigente;
14. no se crea una tabla fija de severidad a persona nominal; la autoridad efectiva se resuelve desde la delegación organizacional vigente;
15. el iniciador, preparador o ejecutor principal de la misma decisión crítica no puede emitir por sí solo la aprobación final;
16. `DESACTIVADO` puede coexistir con pendientes identificados y asignados cuando estos ya no requieren gobierno extraordinario;
17. `CERRADO` no puede coexistir con efectos operativos o de conciliación abiertos que el contrato de dominio exige resolver;
18. un incidente puede cerrarse antes de terminar todas las acciones de mejora únicamente cuando esas acciones ya no representan recuperación, reincorporación, conciliación, seguridad o evidencia pendiente del incidente;
19. la revisión posterior es un expediente correlacionado pero distinto del incidente y no altera su historia;
20. abrir una revisión posterior no cierra el incidente y cerrar el incidente no concluye la revisión posterior;
21. las acciones correctivas y de mejora posteriores poseen propietario, condición de salida y verificación de eficacia independientes del cierre del incidente;
22. una acción implementada no puede ser marcada eficaz por la sola persona que la ejecutó cuando la criticidad o el riesgo exigen independencia;
23. la concentración de funciones en una organización pequeña solo es admisible si cada función ejercida queda identificada y no produce autoaprobación crítica;
24. cuando no sea materialmente posible separar dos funciones de ejecución no críticas, se exige control compensatorio posterior y nunca se elimina la aprobación final independiente;
25. un proveedor puede ejecutar o aportar evidencia técnica, pero no valida recuperación empresarial ni aprueba el cierre de Vento;
26. una automatización puede calcular, comparar, bloquear, correlacionar o preparar una decisión, pero no se convierte en aprobador empresarial;
27. una interfaz, un rol local, un estado técnico, un receipt, un health check o una métrica no sustituyen la autoridad requerida;
28. las mismas reglas aplican a operación real, restauraciones controladas y ejercicios, distinguiendo siempre contexto real de simulación;
29. denegaciones, intentos fallidos, excepciones y decisiones de no cierre permanecen auditables;
30. toda transición protegida conserva actor, función, alcance, evidencia, versión, razones y autoridad aplicable;
31. la tarea materializa el enforcement documental pendiente de `CONT-DOM-010` sobre separación entre ejecutar, validar, reincorporar, conciliar y cerrar;
32. la tarea materializa la separación de ejercicio y revisión reservada por `CONT-DOM-014` y `CONT-DOM-015`;
33. la tarea no cambia criticidades BIA, perfiles `CONT-OBJ-*`, MTPD, RTO, RPO, MBCO, estrategias `CTG-*`, propietarios de proceso ni estados de readiness;
34. la tarea no declara implementación física ni validación operativa;
35. se generan cero cambios de requisitos de prueba porque el comportamiento protegido ya está cubierto por requisitos vigentes de continuidad, autorización e integración.

---

#### 3. Entradas canónicas conservadas

Esta tarea consume sin redefinir:

- `VPROC-0062 — Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje`;
- la matriz `PROC-ACTOR-003`, que establece aprobación obligatoria por `GERENCIA_GENERAL` o `GOBIERNO_Y_PROPIEDAD` según severidad para activación, modo degradado, recuperación total y cierre de continuidad;
- `CONT-DOM-001` para propiedad federada, autorización persistente, fuente de verdad única, recuperación funcional, prueba antes de confianza e historia preservada;
- `CONT-DOM-005` para estados del incidente, distinción entre `DESACTIVADO` y `CERRADO` y condiciones empresariales de cierre;
- `CONT-DOM-006` para mando, sustitución, bitácora y segregación de decisiones;
- `CONT-DOM-007` y `CONT-DOM-008` para MBCO y estrategias de contingencia sin transferir autoridad;
- `CONT-DOM-009` para folios, registros, evidencia, custodia y trabajo realizado durante la falla;
- `CONT-DOM-010` para reincorporación, idempotencia, `RESULT_UNKNOWN`, `CONFLICT`, `QUARANTINED`, `RECONCILIATION_REQUIRED`, orden causal, conciliación y balance de pendientes;
- `CONT-DOM-011` y `CONT-DOM-012` para respaldos, runbooks, restore, failover condicional, retorno, validación técnica y validación funcional;
- `CONT-DOM-013` para resultados y receipts de proveedores y recursos alternativos;
- `CONT-DOM-014` para ejercicios, restauración aislada, validación funcional, conciliación, evidencia y readiness;
- `CONT-DOM-015` para revisión posterior, cadena de aprendizaje, acciones y verificación de eficacia;
- `CONT-AUTH-001` para autoridad de declaración, activación, mando, decisiones excepcionales, comunicación y desactivación;
- `CONT-AUTH-002` para acceso extraordinario, break-glass, failover privilegiado, expiración y revocación;
- `CONT-AUTH-003` para protección de respaldos, runbooks, contactos, evidencia, formularios y datos de contingencia;
- el modelo canónico de identidad, actor efectivo, permiso, alcance, contexto, recurso, denegación, decisión y auditoría;
- los contratos vigentes de idempotencia, información, evidencia e integración que preservan un único efecto y una única fuente propietaria.

No se crean roles base, roles operativos, permisos, cuentas, identidades, severidades, estados de servicio, objetivos de continuidad ni propietarios nuevos.

---

#### 4. Decisión principal

Vento OS adopta un modelo de **segregación por resultado y por decisión**, no una separación artificial basada únicamente en personas distintas.

```text
EJECUTAR
→ produce una acción o intento
→ conserva actor, autorización y evidencia
→ no certifica éxito

VALIDAR TÉCNICAMENTE
→ confirma componente, versión, integridad o comportamiento técnico
→ no declara recuperación empresarial

VALIDAR FUNCIONALMENTE
→ confirma que el proceso logra el resultado empresarial requerido
→ pertenece al propietario funcional

REINCORPORAR
→ admite y aplica trabajo contingente bajo estado actual
→ no equivale a conciliar todos los efectos

CONCILIAR
→ compara hechos y efectos entre fuentes propietarias
→ resuelve o conserva diferencias explícitas

DECLARAR RECUPERACIÓN TOTAL
→ afirma que el resultado empresarial y sus dependencias aplicables están recuperados
→ exige evidencia y autoridad

CERRAR
→ termina el expediente operacional del incidente como caso abierto
→ exige balance sin bloqueos operativos ocultos y aprobación final

REVISAR POSTERIORMENTE
→ analiza hechos, causas, lecciones, acciones y eficacia
→ no reescribe ni sustituye el cierre histórico
```

Regla cardinal:

```text
EJECUCION
≠ VALIDACION
≠ RECUPERACION TOTAL
≠ CIERRE
≠ EFICACIA
```

---

#### 5. Fronteras obligatorias

Se conservan las siguientes separaciones:

```text
restore ejecutado ≠ restore validado
```

```text
validación técnica ≠ validación funcional
```

```text
servicio técnicamente disponible ≠ proceso empresarial recuperado
```

```text
sincronización ≠ reincorporación aceptada
```

```text
reincorporación ≠ conciliación integral
```

```text
receipt técnico ≠ aceptación funcional
```

```text
conciliación de un dominio ≠ conciliación transversal completa
```

```text
recuperación total ≠ desactivación ≠ cierre
```

```text
cierre ≠ revisión posterior
```

```text
acción implementada ≠ acción eficaz
```

```text
participación en ejercicio ≠ autoridad real
```

```text
proveedor técnicamente conforme ≠ proceso Vento recuperado
```

---

#### 6. Unidad mínima de segregación

La segregación se evalúa sobre una decisión concreta, no sobre etiquetas generales de cargo.

Cada decisión protegida deberá resolver como mínimo:

| Dimensión            | Regla                                                                                                                   |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| expediente           | incidente, recuperación, conciliación, ejercicio o revisión correlacionable                                             |
| decisión             | acción exacta que se ejecuta, valida, admite, concilia, aprueba o cierra                                                |
| recurso              | proceso, servicio, registro, fuente, dependencia o alcance afectado                                                     |
| actor efectivo       | persona o servicio que realiza el acto material                                                                         |
| función ejercida     | ejecución, validación técnica, validación funcional, reincorporación, conciliación, coordinación, aprobación o revisión |
| autoridad            | permiso, delegación y prerrequisitos aplicables a esa función                                                           |
| severidad y alcance  | contexto empresarial que determina escalamiento y aprobación                                                            |
| estado anterior      | estado autoritativo previo a la decisión                                                                                |
| evidencia            | hechos, receipts, validaciones y referencias utilizados                                                                 |
| conflicto de función | concentración o incompatibilidad detectada                                                                              |
| decisión final       | allow, deny, bloqueo, aprobación o rechazo aplicable                                                                    |
| versión              | política, delegación, runbook y contratos vigentes utilizados                                                           |
| tiempo               | inicio, decisión y resultado suficientes para reconstrucción                                                            |

Una misma persona puede aparecer en varios actos, pero cada acto conserva su función y no hereda autoridad del acto anterior.

---

#### 7. Matriz materializada de autoridad y segregación

| Decisión o acción               | Prepara o propone                                  | Ejecuta                                    | Valida o concilia                                  | Aprobación protegida                                                     | Regla de separación                                                                |
| ------------------------------- | -------------------------------------------------- | ------------------------------------------ | -------------------------------------------------- | ------------------------------------------------------------------------ | ---------------------------------------------------------------------------------- |
| ejecutar contingencia aprobada  | director, operación o propietario aplicable        | actor operativo autorizado                 | propietario funcional según resultado              | solo si el contrato de la acción la exige                                | ejecutar el procedimiento no concede recuperación total                            |
| ejecutar recuperación técnica   | `RESPONSABLE_TECNOLOGICO` o coordinador autorizado | técnico, servicio o proveedor autorizado   | validador técnico aplicable                        | autoridad de cambio/acceso cuando corresponda                            | ejecutor no declara resultado empresarial                                          |
| validar recuperación técnica    | función técnica competente                         | validador técnico                          | evidencia técnica                                  | no sustituye aprobación empresarial                                      | cuando el riesgo exija independencia, no se autocertifica el mismo cambio sensible |
| validar resultado empresarial   | `RESPONSABLE_DEL_PROCESO` o función autorizada     | validador funcional                        | propietario funcional y evidencia de MBCO          | no sustituye cierre                                                      | proveedor y técnico no asumen esta función por conveniencia                        |
| admitir trabajo contingente     | propietario del proceso o coordinador autorizado   | operador o servicio autorizado             | regla de admisión de `CONT-DOM-010`                | autoridad de dominio cuando corresponda                                  | la existencia del registro no concede aplicación                                   |
| reincorporar una intención      | propietario o función de dominio                   | contrato o ejecutor idempotente autorizado | receipt, recurso, versión y evidencia              | decisión vigente de la acción                                            | replay no aprueba su propio resultado                                              |
| resolver duplicado o conflicto  | dominio propietario                                | actor autorizado para la resolución        | revisor de conflicto o propietario                 | autoridad de corrección aplicable                                        | el productor del registro no descarta por sí solo evidencia contradictoria         |
| conciliar efecto de un dominio  | responsable del dominio                            | conciliador autorizado                     | fuente propietaria y evidencia                     | propietario funcional                                                    | conciliar no autoriza modificar otro dominio                                       |
| conciliar efecto entre dominios | propietarios involucrados                          | funciones autorizadas en cada extremo      | confirmación bilateral o multilateral aplicable    | autoridad de excepción si queda diferencia material                      | un extremo no certifica al otro                                                    |
| proponer recuperación total     | `RESPONSABLE_DE_CONTINUIDAD` o sustituto efectivo  | no aplica como efecto técnico              | propietarios de procesos y validaciones aplicables | `GERENCIA_GENERAL` o `GOBIERNO_Y_PROPIEDAD` según severidad y delegación | propuesta no equivale a aprobación                                                 |
| aprobar recuperación total      | autoridad ejecutiva efectiva                       | no aplica                                  | consume validaciones sin sustituirlas              | `GERENCIA_GENERAL` o `GOBIERNO_Y_PROPIEDAD`                              | quien ejecutó la recuperación no se autoaprueba esta decisión crítica              |
| proponer cierre                 | `RESPONSABLE_DE_CONTINUIDAD` o sustituto efectivo  | no aplica                                  | balance de pendientes y validaciones               | aprobación final obligatoria                                             | cierre no se deriva automáticamente de `DESACTIVADO`                               |
| aprobar cierre                  | autoridad ejecutiva efectiva                       | no aplica                                  | evidencia de cierre y bloqueos                     | `GERENCIA_GENERAL` o `GOBIERNO_Y_PROPIEDAD` según severidad y delegación | iniciador/preparador y ejecutor no emiten solos la aprobación final crítica        |
| iniciar revisión posterior      | continuidad, riesgo, proceso o disparador vigente  | equipo revisor autorizado                  | evidencia histórica preservada                     | según gobierno de revisión                                               | abrir revisión no altera el cierre                                                 |
| verificar eficacia de acción    | propietario o revisor designado                    | verificador competente                     | método de eficacia aprobado                        | autoridad de aceptación cuando corresponda                               | la sola persona que implementó no convierte la acción en eficaz por declaración    |

La matriz no crea permisos físicos. Cualquier implementación futura deberá mapear estas funciones al catálogo y a los evaluadores canónicos vigentes.

---

#### 8. Ejecución de continuidad

La ejecución solo puede ocurrir dentro de una decisión previamente autorizada o de una medida protectora ya prevista por contrato.

El ejecutor debe conocer:

- incidente o ejercicio;
- acción exacta;
- recurso y ambiente;
- estrategia o runbook aplicable;
- alcance;
- actor y principal;
- autorización vigente;
- controles protectores;
- condición de abortado;
- evidencia esperada;
- handoff de validación.

El ejecutor no adquiere por la acción:

- derecho a aprobar el resultado;
- autoridad para ampliar el alcance;
- autoridad para cambiar MTPD, RTO, RPO o MBCO;
- autoridad para descartar evidencia adversa;
- autoridad para omitir conciliación;
- autoridad para declarar recuperación total;
- autoridad para cerrar el incidente;
- autoridad para declarar eficaz una acción posterior.

---

#### 9. Validación técnica

La validación técnica determina si el componente o capacidad técnica cumple el resultado técnico definido por su contrato.

Puede incluir, según aplique:

- integridad de restore;
- versión compatible;
- health y estabilidad;
- fuente activa inequívoca;
- ausencia de split-brain;
- conectividad;
- colas y eventos;
- capacidad técnica mínima;
- seguridad y configuración;
- acceso y revocación;
- evidencia de tiempo y punto recuperado;
- condición de retorno o rollback.

La validación técnica no puede declarar:

- MBCO cumplido sin validación funcional;
- reconciliación completa;
- recuperación total;
- cierre;
- readiness vigente por sí sola.

Cuando una acción técnica sensible sea ejecutada y validada por la misma persona por limitación real de dotación, la concentración debe quedar registrada y no sustituye la validación funcional independiente ni la aprobación ejecutiva final.

---

#### 10. Validación funcional

La validación funcional confirma que el proceso puede producir su resultado empresarial dentro del modo aprobado.

Corresponde a `RESPONSABLE_DEL_PROCESO` o a la función expresamente autorizada por el proceso y deberá considerar, según aplique:

- resultado mínimo `MBCO`;
- entradas y salidas requeridas;
- datos y versión correctos;
- acciones pendientes;
- restricciones de sede, horario o duración;
- continuidad de controles de SST, inocuidad, calidad, privacidad, autorización e integridad;
- dependencias necesarias;
- efectos ya producidos durante la falla;
- trabajo diferido o contingente;
- conciliaciones requeridas;
- limitaciones conocidas del modo recuperado.

La validación funcional puede ser positiva, negativa o condicionada. Una condición material abierta impide convertirla silenciosamente en recuperación total.

---

#### 11. Puerta de recuperación total

La decisión de recuperación total solo puede proponerse cuando el alcance evaluado demuestra, según aplique:

1. estado técnico estable suficiente;
2. fuente activa y versión identificadas;
3. validación funcional de cada proceso afectado que deba declararse recuperado;
4. MBCO observado o condición de servicio objetivo satisfecha;
5. dependencias críticas requeridas disponibles o con limitación explícita compatible;
6. trabajo contingente identificado;
7. `RESULT_UNKNOWN` sin resolver igual a cero dentro del alcance que se pretende declarar recuperado;
8. `CONFLICT` abierto igual a cero dentro de ese alcance;
9. `QUARANTINED` sin decisión igual a cero dentro de ese alcance;
10. `RECONCILIATION_REQUIRED` abierto igual a cero dentro de ese alcance;
11. efectos empresariales ocurridos con representación propietaria o disposición explícita;
12. evidencia obligatoria vinculada o excepción autorizada y admisible;
13. efectos downstream materiales reconciliados;
14. pendientes restantes identificados, asignados y compatibles con operación ordinaria;
15. controles protectores satisfechos;
16. autoridad extraordinaria ya no necesaria para afirmar el resultado;
17. evidencia suficiente para reconstruir la decisión.

Una limitación material que no permita cumplir la puerta conserva el estado real; no se reduce el alcance de forma artificial para declarar éxito.

---

#### 12. Reincorporación: autoridad de admisión

La reincorporación de trabajo contingente aplica la semántica de `CONT-DOM-010` y añade una puerta de autorización.

Antes de admitir una unidad deberá evaluarse:

- identidad original y folio cuando aplique;
- `local_operation_id` e `idempotency_key` cuando apliquen;
- actor y contexto originales;
- estado actual del actor y su autoridad;
- recurso actual y versión;
- integridad del contenido;
- receipts existentes;
- estado de dependencias;
- conflicto o duplicado potencial;
- autorización actual para producir el efecto;
- propietario funcional;
- evidencia y custodia;
- secuencia causal.

La autoridad observada durante la falla no se transporta como allow reutilizable. Toda mutación actual se reevalúa con el contexto vigente inmediatamente antes del efecto.

---

#### 13. Reincorporación: ejecución y verificación

La reincorporación distingue:

```text
ADMITIR
→ decidir si la unidad puede entrar al proceso de retorno

APLICAR
→ producir o vincular el efecto autorizado una sola vez

VERIFICAR
→ comprobar receipt, recurso, versión y resultado

CONCILIAR
→ confirmar consecuencias propietarias y downstream
```

Reglas:

1. el ejecutor de replay no convierte ausencia de error en éxito empresarial;
2. un mismo identificador y mismo contenido debe recuperar el resultado existente cuando el contrato lo define;
3. un mismo identificador con contenido diferente se conserva como conflicto;
4. una respuesta tardía se correlaciona antes de cualquier nuevo efecto;
5. un timeout no autoriza una segunda intención destructiva;
6. una unidad expirada no se ejecuta automáticamente;
7. un efecto ocurrido durante la vigencia no se borra por expiración posterior;
8. una corrección crea una decisión trazable; no altera silenciosamente el registro original;
9. la automatización puede ejecutar la regla autorizada, pero no autoaprobar un conflicto material;
10. la evidencia adversa no se descarta para liberar la cola.

---

#### 14. Resolución de conflictos

Un conflicto de reincorporación exige una decisión del dominio propietario cuando no exista una regla determinista ya aprobada.

La decisión deberá conservar:

| Campo           | Regla                                                              |
| --------------- | ------------------------------------------------------------------ |
| conflicto       | identidad y clase del conflicto                                    |
| registros       | referencias de todas las versiones o intenciones implicadas        |
| recurso         | estado y versión actuales                                          |
| evidencia       | receipts, folios, auditoría, documentos o fuentes observadas       |
| efecto posible  | consecuencias de aceptar, rechazar, compensar o mantener pendiente |
| actor           | función que prepara o analiza                                      |
| autoridad       | función que puede decidir la resolución                            |
| resolución      | decisión explícita y motivo                                        |
| efecto derivado | nueva acción autorizada cuando corresponda                         |
| conciliación    | dominios que deben confirmar el resultado                          |

El actor que produjo el registro original puede aportar hechos, pero no posee por esa razón autoridad exclusiva para resolver una contradicción material.

---

#### 15. Conciliación por dominio

Cada dominio conserva la propiedad de sus hechos y verifica su convergencia.

La conciliación debe responder, según aplique:

- qué hecho propietario existe;
- qué intención u observación de contingencia lo originó;
- qué receipt o referencia lo confirma;
- qué efecto fue rechazado o compensado;
- qué diferencia permanece;
- qué actor o función resolvió la diferencia;
- qué evidencia soporta la resolución;
- qué efectos downstream se propagaron;
- qué pendientes quedan;
- quién es propietario de cada pendiente.

Una herramienta transversal puede presentar el balance, pero no se convierte en propietaria de ventas, inventario, producción, pagos, asistencia, documentos, comunicaciones ni otros hechos de dominio.

---

#### 16. Conciliación transversal

Cuando una misma intención produce efectos en más de un dominio, el cierre exige correlación suficiente entre los extremos aplicables.

Ejemplos de clases ya cubiertas por el contrato de dominio incluyen:

- venta, pedido, pago y caja;
- inventario, abastecimiento y recepción;
- producción, consumo, merma e inventario;
- logística, custodia, entrega y recepción;
- asistencia, turno y efectos laborales;
- documentos, evidencia y referencias;
- comunicaciones y entrega;
- colas, integraciones y proveedores.

Reglas:

1. un dominio no escribe autoridad sobre el otro para forzar convergencia;
2. una diferencia puede terminar en corrección, compensación, rechazo documentado o riesgo residual autorizado cuando el contrato lo permita;
3. una discrepancia material sin tratamiento mantiene el bloqueo;
4. un efecto externo sin receipt o evidencia autoritativa permanece desconocido cuando corresponda;
5. una conciliación parcial no se etiqueta como integral;
6. los conteos abiertos solo disminuyen por una causa demostrable y correlacionada.

---

#### 17. Balance obligatorio antes del cierre

Antes de proponer `CERRADO`, el expediente deberá disponer de un balance reconstruible que distinga como mínimo:

- registros contingentes identificados;
- unidades admitidas;
- unidades aplicadas;
- unidades rechazadas con motivo;
- duplicados confirmados;
- operaciones expiradas con disposición;
- conflictos abiertos;
- resultados desconocidos abiertos;
- unidades `QUARANTINED`;
- unidades `RECONCILIATION_REQUIRED`;
- evidencia obligatoria no enlazada;
- efectos downstream pendientes;
- pendientes sin propietario;
- pendientes transferidos a operación ordinaria;
- acciones de mejora posteriores separadas del incidente.

El balance debe preservar referencias y razones. No se exige un esquema físico nuevo en esta fase.

---

#### 18. Condiciones que bloquean el cierre

`CERRADO` queda denegado mientras exista, dentro del alcance que debe resolver el incidente:

- `RESULT_UNKNOWN` sin resolución;
- `CONFLICT` abierto;
- `QUARANTINED` sin decisión;
- `RECONCILIATION_REQUIRED` abierto;
- efecto físico o empresarial ocurrido sin representación propietaria o disposición explícita;
- evidencia obligatoria sin vínculo ni excepción admisible;
- efecto downstream material pendiente;
- operación expirada sin disposición;
- trabajo de contingencia sin destino;
- pendiente material sin propietario;
- validación funcional obligatoria ausente;
- control protector todavía incumplido;
- recuperación total no aprobada cuando el alcance la exige;
- excepción temporal vencida o sin autoridad;
- diferencia material ocultada mediante reducción artificial del alcance;
- autoridad de cierre no resoluble o no vigente.

Un bloqueo no desaparece por desactivar el mando, restaurar la aplicación, terminar un turno o cambiar de canal.

---

#### 19. Pendientes admisibles después del cierre

Pueden permanecer después del cierre únicamente elementos que hayan dejado de ser parte de la recuperación operacional del incidente y cumplan simultáneamente:

1. identidad propia;
2. relación histórica con el incidente;
3. propietario explícito;
4. prioridad y condición de salida;
5. tratamiento autorizado en su dominio;
6. ausencia de `RESULT_UNKNOWN`, conflicto, conciliación o efecto empresarial pendiente encubierto;
7. ausencia de control protector incumplido;
8. ausencia de riesgo que obligue a mantener el incidente abierto;
9. evidencia suficiente del traspaso;
10. seguimiento en el proceso propietario correspondiente.

Ejemplos admisibles son una acción de mejora, una actualización de plan o una investigación causal posterior cuando el resultado operacional ya está reconciliado. No es admisible renombrar un pendiente operacional como acción de mejora para permitir el cierre.

---

#### 20. Propuesta de cierre

`RESPONSABLE_DE_CONTINUIDAD` o `CONTINUADOR_DE_CONTINUIDAD` con sustitución vigente puede preparar la propuesta de cierre.

La propuesta deberá contener como mínimo:

- incidente y alcance;
- severidad inicial, máxima y final;
- modalidad de activación utilizada;
- estado de desactivación cuando aplicó;
- servicios y procesos afectados;
- validaciones técnicas relevantes;
- validaciones funcionales por proceso;
- resultado de recuperación total;
- balance de reincorporación y conciliación;
- excepciones y riesgos residuales;
- pendientes admitidos después del cierre;
- revisión posterior requerida;
- evidencia de autoridad y versiones aplicables;
- razón explícita para cerrar.

Preparar la propuesta no cambia el estado a `CERRADO`.

---

#### 21. Autoridad de cierre

El cierre de continuidad es una decisión protegida obligatoria de `VPROC-0062`.

La aprobación final corresponde a:

- `GERENCIA_GENERAL`; o
- `GOBIERNO_Y_PROPIEDAD`;

según severidad y delegación organizacional vigente.

Reglas:

1. no se inventa una correspondencia fija entre severidad y persona nominal;
2. debe poder reconstruirse qué autoridad era efectiva al momento del cierre;
3. `RESPONSABLE_DE_CONTINUIDAD` no se convierte en aprobador final por dirigir el incidente;
4. el ejecutor técnico no se convierte en aprobador final por restaurar el servicio;
5. el propietario funcional no se convierte en aprobador ejecutivo por validar su proceso;
6. un proveedor no puede aprobar el cierre de Vento;
7. una automatización no puede aprobar el cierre;
8. una regla automática puede bloquear el cierre cuando falte un prerrequisito, pero no fabricar el allow empresarial;
9. la aprobación final consume la evidencia de los dominios sin reemplazar sus validaciones;
10. una denegación de cierre conserva razones y siguiente condición verificable.

---

#### 22. Recuperación total y cierre

La recuperación total y el cierre se relacionan pero no son el mismo acto.

Puede existir:

- proceso funcionalmente recuperado mientras el incidente sigue abierto por otro proceso;
- todos los procesos recuperados mientras continúa conciliación;
- `DESACTIVADO` mientras persisten pendientes identificados compatibles con autoridad ordinaria;
- recuperación total aprobada antes del cierre documental final;
- incidente cerrado con revisión posterior todavía abierta.

No puede existir cierre cuando la recuperación total necesaria para el alcance sigue sin autoridad o evidencia suficiente.

---

#### 23. Concentración de funciones en organización pequeña

La organización puede concentrar funciones sin ocultar la segregación lógica.

Cuando una persona ejerza más de una función deberá conservarse:

- identidad de cada función ejercida;
- orden temporal de los actos;
- alcance de cada acto;
- autoridad utilizada;
- conflicto potencial;
- razón por la que la concentración fue necesaria;
- control compensatorio aplicado;
- revisor o aprobador independiente cuando la decisión sea crítica.

Reglas mínimas:

1. una persona puede ejecutar y realizar una comprobación técnica inicial de bajo riesgo si el contrato lo permite;
2. esa concentración no sustituye validación funcional de un proceso ajeno;
3. la persona que opera la contingencia no aprueba por sí sola recuperación total o cierre;
4. el beneficiario de una excepción no aprueba la misma excepción crítica;
5. el responsable de una acción de mejora no declara unilateralmente su eficacia cuando el método exige independencia;
6. cuando no exista separación suficiente para una decisión crítica, la decisión permanece bloqueada y escala a la autoridad aplicable;
7. no se crean aprobadores ficticios para simular separación.

---

#### 24. Revisión posterior como expediente separado

La revisión posterior consume la historia del incidente o ejercicio, pero no la reescribe.

Fronteras obligatorias:

```text
INCIDENTE CERRADO
≠
REVISION POSTERIOR CONCLUIDA
```

```text
CAUSA PROPUESTA
≠
CAUSA CONFIRMADA
```

```text
LECCION IDENTIFICADA
≠
ACCION IMPLEMENTADA
```

```text
ACCION IMPLEMENTADA
≠
ACCION EFICAZ
```

La revisión utiliza los estados ya definidos por `CONT-DOM-015`:

- `PENDIENTE_DE_REVISION`;
- `EN_REVISION`;
- `BLOQUEADA_POR_EVIDENCIA`;
- `REVISION_CONCLUIDA_SIN_ACCIONES`;
- `REVISION_CONCLUIDA_CON_ACCIONES`;
- `CERRADA_CON_RIESGO_RESIDUAL`.

Estos estados no sustituyen `DECLARADO`, `ESTABILIZADO`, `DESACTIVADO` o `CERRADO` del incidente.

---

#### 25. Autoridad y segregación de la revisión posterior

La revisión debe incorporar las funciones que aporten hechos o validen materias de su dominio, sin transferirles autoridad universal.

Pueden participar, según el caso:

- `RESPONSABLE_DE_CONTINUIDAD`;
- `RESPONSABLE_DEL_PROCESO`;
- `COORDINACION_DE_OPERACIONES`;
- `RESPONSABLE_TECNOLOGICO`;
- `RESPONSABLE_DE_RIESGO_EMPRESARIAL`;
- funciones de SST, seguridad, calidad, inocuidad, información, datos o finanzas aplicables;
- custodios de evidencia;
- proveedores como aportantes de hechos dentro de su alcance.

Reglas:

1. quien ejecutó una acción puede explicar hechos y decisiones;
2. aportar hechos no concede autoridad para fijar unilateralmente causa;
3. la persona investigada o responsable de una decisión no controla por sí sola la evidencia;
4. una causa material debe distinguir hechos, hipótesis, contribuyentes y desconocidos;
5. el cierre de la revisión requiere que hallazgos y acciones tengan estado y propietario coherentes;
6. una revisión puede concluir con riesgo residual solo cuando ese riesgo tiene autoridad y tratamiento explícitos;
7. la revisión no se usa como proceso disciplinario implícito;
8. la revisión no reabre el incidente salvo que se descubra un efecto operacional todavía no resuelto que realmente invalide el cierre.

---

#### 26. Reapertura y descubrimiento posterior

Si después de `CERRADO` aparece evidencia de que existía un efecto operacional material no resuelto al momento del cierre:

1. se conserva el cierre histórico original y su evidencia;
2. se registra el nuevo hecho y el momento en que fue conocido;
3. se evalúa si corresponde reabrir el expediente, crear un incidente relacionado o activar otro proceso según la naturaleza real del hecho;
4. no se reescribe retrospectivamente el balance para aparentar que el efecto siempre estuvo resuelto;
5. la autoridad aplicable decide la transición conforme al estado y severidad actuales;
6. la revisión posterior conserva la relación con el hallazgo;
7. una corrección de datos posterior preserva el antes, después, actor, razón y evidencia.

La tarea no inventa una transición física de base de datos; fija la semántica que deberá materializarse en la fase propietaria.

---

#### 27. Acciones posteriores y verificación de eficacia

Las acciones posteriores conservan la cadena de `CONT-DOM-015`:

```text
HECHO
→ OBSERVACION
→ HALLAZGO
→ LECCION
→ ACCION
→ IMPLEMENTACION
→ EFICACIA
→ ACTUALIZACION
```

La segregación mínima es:

| Etapa                     | Función principal                               | Regla                                               |
| ------------------------- | ----------------------------------------------- | --------------------------------------------------- |
| identificar hallazgo      | revisor o dominio competente                    | no se convierte automáticamente en causa confirmada |
| definir acción            | propietario de la brecha con gobierno aplicable | debe tener condición de salida y método de eficacia |
| implementar acción        | ejecutor asignado                               | implementar no certifica eficacia                   |
| verificar eficacia        | verificador competente o propietario autorizado | usa evidencia posterior y método aprobado           |
| aceptar riesgo residual   | autoridad de riesgo aplicable                   | no puede ser autoaceptado por el ejecutor           |
| actualizar plan o runbook | propietario documental/técnico                  | conserva versión anterior y trazabilidad            |

Cuando el mismo propietario implemente y mida una acción de bajo riesgo, la concentración queda registrada. Para una acción material que afecte seguridad, autorización, integridad, disponibilidad crítica o control financiero, la verificación no puede descansar únicamente en la declaración del ejecutor.

---

#### 28. Ejercicios y simulaciones

En ejercicios se conserva la misma separación lógica, pero sin convertir autoridad simulada en autoridad real.

Reglas:

- un actor puede representar una función dentro del escenario sin recibir permisos productivos;
- el ejecutor de una restauración de prueba no aprueba su propio resultado empresarial;
- la validación funcional de ejercicio debe provenir del propietario del proceso o función autorizada para la prueba;
- la conciliación del escenario debe cubrir los pendientes declarados;
- quien diseña el escenario puede observar, pero no altera los resultados para obtener un aprobado;
- una prueba abortada conserva el estado real y no puede cerrarse como exitosa;
- el cierre del ejercicio y la revisión posterior son distintos;
- una simulación satisfactoria no crea readiness si falta evidencia vigente exigida por el programa;
- un incidente real surgido durante el ejercicio se separa del escenario y entra por `VPROC-0062` real.

---

#### 29. Proveedores y terceros

Un proveedor puede:

- ejecutar una acción técnica autorizada;
- informar health o ETA de su propio servicio;
- aportar receipt o evidencia;
- confirmar cumplimiento de su contrato;
- participar en una revisión como fuente de hechos.

No puede:

- validar MBCO de Vento;
- declarar recuperado un proceso empresarial;
- resolver por sí solo una conciliación de Vento;
- aprobar riesgo residual interno;
- aprobar recuperación total;
- aprobar cierre;
- declarar eficaz una acción interna únicamente porque su servicio quedó estable.

La aceptación de resultados externos permanece con el propietario interno aplicable.

---

#### 30. Automatización y agentes

Automatizaciones, reglas, jobs, servicios o agentes pueden:

- correlacionar registros;
- recuperar receipts;
- comparar versiones;
- detectar duplicados;
- aplicar una regla determinista previamente autorizada;
- calcular balances;
- bloquear una transición inválida;
- preparar evidencia;
- recordar pendientes;
- proponer una conclusión.

No pueden por sí solos:

- eliminar un conflicto material no determinista;
- aceptar una excepción empresarial;
- validar MBCO sin evidencia funcional;
- declarar recuperación total;
- aprobar cierre;
- aceptar riesgo residual;
- declarar eficacia de una acción cuya evaluación requiere juicio o autoridad humana.

Toda automatización conserva principal técnico, versión, reglas, entradas, decisión y resultado suficientes para auditoría.

---

#### 31. Consistencia entre superficies

La misma semántica de segregación deberá aplicarse cuando una decisión se origine mediante:

- interfaz;
- Server Action;
- Route Handler;
- API;
- RPC;
- RLS o Data API;
- Edge Function;
- job;
- webhook;
- Realtime;
- dispositivo compartido;
- operación offline reincorporada;
- herramienta administrativa;
- integración externa.

Ninguna superficie puede omitir la autoridad de cierre o convertir un estado visible en un permiso.

---

#### 32. Evidencia mínima de una transición protegida

Para ejecución, validación, reincorporación, conciliación, recuperación total, cierre y revisión deberá conservarse, cuando corresponda:

- expediente y correlación;
- acción o transición;
- estado anterior y posterior;
- actor humano efectivo;
- principal técnico;
- función ejercida;
- sustitución vigente;
- permiso o autoridad relevante;
- alcance;
- recurso o proceso;
- severidad;
- versiones contractuales;
- evidencia utilizada;
- receipts o referencias;
- conflictos y excepciones;
- decisión;
- razones;
- aprobador cuando aplique;
- concentración de funciones detectada;
- control compensatorio;
- timestamp;
- pendientes y propietarios resultantes.

La evidencia no contiene secretos completos ni se usa para otorgar autoridad retroactiva.

---

#### 33. Denegaciones obligatorias

Una transición deberá quedar denegada o bloqueada cuando:

- falta autoridad efectiva;
- el estado vigente no permite la transición;
- el actor intenta ampliar el alcance por su función anterior;
- el ejecutor intenta aprobar su propia decisión crítica;
- falta validación funcional obligatoria;
- se intenta tratar un health técnico como recuperación empresarial;
- existe `RESULT_UNKNOWN` material abierto;
- existe `CONFLICT` material abierto;
- existe `QUARANTINED` sin decisión;
- existe `RECONCILIATION_REQUIRED` abierto;
- existe evidencia obligatoria faltante;
- queda un efecto downstream material sin tratamiento;
- queda un pendiente material sin propietario;
- se intenta convertir `DESACTIVADO` en `CERRADO` automáticamente;
- una simulación intenta producir autoridad real;
- un proveedor intenta aprobar un resultado empresarial;
- una automatización intenta autoaprobar una excepción;
- la delegación aplicable está vencida o no puede resolverse;
- una revisión posterior intenta reescribir historia para satisfacer el cierre.

La denegación conserva razones y siguiente condición verificable; no obliga a improvisar un bypass.

---

#### 34. Estados documentales y de evidencia

| Materia                                | Estado después de esta tarea  | Condición de salida física                                          |
| -------------------------------------- | ----------------------------- | ------------------------------------------------------------------- |
| contrato de segregación del ciclo      | `ESPECIFICADO`                | implementación posterior en evaluadores y superficies propietarias  |
| separación ejecución / validación      | `ESPECIFICADO`                | enforcement y pruebas en paquetes autorizados                       |
| validación técnica                     | `ESPECIFICADO`                | runbooks y pruebas reales según `CONT-DOM-012` y paquetes técnicos  |
| validación funcional                   | `ESPECIFICADO`                | superficies y permisos de propietarios materializados y ejercitados |
| autoridad de reincorporación           | `ESPECIFICADO`                | contratos idempotentes de dominio y `CONT-INT-004` implementados    |
| resolución de conflictos               | `ESPECIFICADO`                | comandos y experiencia de revisión materializados                   |
| conciliación por dominio               | `ESPECIFICADO`                | evidencia real de convergencia en paquetes propietarios             |
| conciliación transversal               | `ESPECIFICADO`                | `CONT-INT-004` y contratos consumidores implementados               |
| recuperación total                     | `ESPECIFICADO`                | validaciones reales y aprobación autoritativa demostrable           |
| autoridad de cierre                    | `ESPECIFICADO`                | decisión implementada y auditada en `VPROC-0062`                    |
| cierre real por esta tarea             | `NO_EJECUTADO_POR_ESTA_TAREA` | incidente real autorizado y condiciones satisfechas                 |
| revisión posterior real por esta tarea | `NO_EJECUTADA_POR_ESTA_TAREA` | incidente o ejercicio real con expediente de revisión               |
| verificación real de eficacia          | `PENDIENTE_DE_EVIDENCIA`      | acción implementada y método de eficacia ejecutado                  |
| readiness                              | `PENDIENTE_DE_EVIDENCIA`      | programa de ejercicios y evidencia vigente aplicable                |
| implementación física                  | `PENDIENTE_DE_EVIDENCIA`      | fase y paquete autorizados                                          |

No se interpreta `ESPECIFICADO` como `IMPLEMENTADO` ni `PENDIENTE_DE_EVIDENCIA` como fallo de diseño.

---

#### 35. Tratamiento de brechas y decisiones heredadas

| Materia heredada                                                        | Tratamiento de esta tarea                                                                                                       | Estado documental                                                                      |
| ----------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| `H-CAP-SCOPE-018-020` — cierre con trabajos o conciliaciones pendientes | se materializa autoridad de cierre, balance obligatorio, bloqueos, aprobación final y prohibición de ocultar pendientes         | `ESPECIFICADO`; enforcement físico pendiente                                           |
| `H-CAP-SCOPE-018-035` — restauración técnica sin conciliación operativa | se exige validación funcional y conciliación antes de recuperación total o cierre cuando el escenario afecta estado empresarial | `ESPECIFICADO`; prueba integrada permanece con propietarios de ejercicio e integración |
| separación reservada por `CONT-DOM-010`                                 | se define quién ejecuta, valida, reincorpora, concilia, propone y aprueba                                                       | `ESPECIFICADO`                                                                         |
| separación reservada por `CONT-DOM-014`                                 | se aplica el mismo modelo a ejercicios sin autoridad productiva implícita                                                       | `ESPECIFICADO`                                                                         |
| separación reservada por `CONT-DOM-015`                                 | cierre, revisión, implementación de acciones y eficacia permanecen actos distintos                                              | `ESPECIFICADO`                                                                         |

`H-CAP-SCOPE-018-036` y `H-CAP-SCOPE-018-037` conservan sus propietarios de aprendizaje y mantenimiento. Esta tarea no reasigna esas brechas.

---

#### 36. Handoffs obligatorios

| Materia posterior                                                         | Propietario                                    | Condición de salida                                              |
| ------------------------------------------------------------------------- | ---------------------------------------------- | ---------------------------------------------------------------- |
| inicio ejecutivo, estado, impacto, prioridades, responsables y decisiones | `CONT-UX-001`                                  | antes de implementar la superficie ejecutiva de continuidad      |
| centro de mando y línea de tiempo                                         | `CONT-UX-002`                                  | antes de implementar operación visual del incidente              |
| runbooks y checklists de ejecución                                        | `CONT-UX-003`                                  | antes de implementar experiencia guiada de recuperación          |
| captura y reincorporación humana                                          | `CONT-UX-004`                                  | antes de implementar revisión de trabajo contingente             |
| respaldo, restore, failover y pendientes                                  | `CONT-UX-005`                                  | antes de implementar seguimiento visual de recuperación          |
| comunicación de crisis                                                    | `CONT-UX-006`                                  | antes de implementar plantillas y canales                        |
| ejercicios, revisión posterior y readiness                                | `CONT-UX-007`                                  | antes de implementar experiencia de ejercicios y acciones        |
| health, degradación e incidente entre aplicaciones                        | `CONT-INT-001` y `CONT-INT-002`                | antes de automatizar propagación de estado                       |
| dependencias externas                                                     | `CONT-INT-003`                                 | antes de automatizar participación de proveedores                |
| replay, reincorporación, idempotencia, conciliación y retorno normal      | `CONT-INT-004`                                 | antes de materializar retorno productivo de trabajo contingente  |
| permisos, evaluadores, contratos y superficies físicas                    | tareas AUTH/SHELL y paquetes E5 propietarios   | antes de implementar enforcement de las decisiones de esta tarea |
| certificación y evidencia operacional                                     | `CONT-DOM-014`, BLOQUE U y paquetes aplicables | antes de declarar readiness o eficacia operacional               |

Ninguna materia sustantiva identificada queda sin propietario y condición de salida.

---

#### 37. Cobertura vigente de prueba

La conducta protegida por esta tarea ya dispone de requisitos vigentes:

- `TREQ-CONT-002` exige autoridad explícita y bitácora para activación y cierre del incidente;
- `TREQ-CONT-004` exige restauración demostrable, integridad, compatibilidad y comparación con objetivos;
- `TREQ-CONT-005` exige reincorporación idempotente, detección de duplicados y conflictos, conciliación de efectos y cierre sin pendientes sin propietario;
- `TREQ-CONT-006` exige ejercicios, revisión posterior, acciones con propietario, eficacia y actualización del plan;
- `TREQ-AUTH-001` exige permiso, contexto y alcance canónicos para capacidades protegidas;
- `TREQ-AUTH-004` exige la misma decisión y razones entre evaluadores;
- `TREQ-AUTH-013` impide bypass de interfaz, API o RPC y exige validación autoritativa de mutaciones;
- `TREQ-AUTH-015` exige evidencia correlacionable de actor, contexto, recurso, decisión, razones, versión y tiempo;
- `TREQ-INTEGRATION-003` protege idempotencia, resultado recuperable, conflicto y recuperación manual controlada;
- `TREQ-INTEGRATION-023` protege degradación, replay controlado, failover autorizado, retorno normal y trazabilidad entre incidente, pendientes y hechos recuperados.

La tarea especializa esa cobertura en la segregación de autoridad del ciclo final de continuidad y no introduce una conducta verificable nueva fuera de esos requisitos.

---

#### 38. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la autoridad de cierre, la reincorporación controlada, la conciliación, la restauración demostrable, la revisión posterior, la evidencia correlacionable, la consistencia entre evaluadores y la protección contra bypass ya poseen cobertura vigente. Esta tarea materializa la separación funcional y la autoridad aplicables al tramo final de continuidad sin crear una obligación de prueba distinta.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 39. Criterios de aceptación

1. La tarea conserva `CONT-AUTH-003` como anterior aprobada.
2. La tarea reserva únicamente `CONT-UX-001` como siguiente.
3. La tarea permanece exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`.
4. No crea código, migraciones, DDL, DML, RLS, RPC, datos ni configuración.
5. No ejecuta contingencia real.
6. No ejecuta restore real.
7. No ejecuta failover ni failback real.
8. No reincorpora trabajo real.
9. No concilia efectos productivos.
10. No cierra un incidente real.
11. No ejecuta una revisión posterior real.
12. No declara readiness.
13. No declara eficacia operativa inexistente.
14. Ejecución y validación permanecen separadas.
15. Validación técnica y validación funcional permanecen separadas.
16. Restauración técnica no equivale a recuperación empresarial.
17. Health técnico no equivale a recuperación empresarial.
18. Receipt técnico no equivale a validación funcional.
19. Sincronización no equivale a reincorporación aceptada.
20. Replay no equivale a conciliación completa.
21. Reincorporación no equivale a conciliación transversal.
22. Recuperación total no equivale a cierre.
23. Desactivación no equivale a cierre.
24. Cierre no equivale a revisión posterior concluida.
25. Acción implementada no equivale a acción eficaz.
26. El ejecutor conserva actor y autoridad propios.
27. El ejecutor no amplía alcance por haber participado en el incidente.
28. El ejecutor no cambia MTPD por decisión propia.
29. El ejecutor no cambia RTO por decisión propia.
30. El ejecutor no cambia RPO por decisión propia.
31. El ejecutor no cambia MBCO por decisión propia.
32. El ejecutor no descarta evidencia adversa por conveniencia.
33. El ejecutor no declara recuperación total por sí solo.
34. El ejecutor no aprueba cierre por sí solo.
35. El ejecutor no declara eficacia por sí solo cuando se exige independencia.
36. La validación técnica confirma únicamente el alcance técnico definido.
37. La validación técnica conserva versión e integridad cuando aplican.
38. La validación técnica conserva fuente activa cuando aplica.
39. La validación técnica evalúa split-brain cuando aplica.
40. La validación técnica no sustituye MBCO.
41. La validación técnica no sustituye conciliación.
42. La validación técnica no declara readiness por sí sola.
43. La validación funcional pertenece al propietario del resultado empresarial o función autorizada.
44. La validación funcional consume datos y versión actuales.
45. La validación funcional considera dependencias requeridas.
46. La validación funcional considera trabajo contingente.
47. La validación funcional considera restricciones del modo recuperado.
48. La validación funcional puede ser negativa.
49. La validación funcional puede ser condicionada.
50. Una condición material abierta no se convierte silenciosamente en validación positiva.
51. La recuperación total exige estado técnico suficiente.
52. La recuperación total exige validaciones funcionales aplicables.
53. La recuperación total exige fuente activa identificada cuando corresponda.
54. La recuperación total exige dependencias compatibles con el alcance declarado.
55. La recuperación total exige trabajo contingente identificado.
56. La recuperación total no tolera `RESULT_UNKNOWN` material sin resolver.
57. La recuperación total no tolera `CONFLICT` material abierto.
58. La recuperación total no tolera `QUARANTINED` sin decisión.
59. La recuperación total no tolera `RECONCILIATION_REQUIRED` material abierto.
60. La recuperación total exige representación o disposición de efectos ocurridos.
61. La recuperación total exige evidencia obligatoria suficiente.
62. La recuperación total exige tratamiento de efectos downstream materiales.
63. La recuperación total no se obtiene reduciendo artificialmente el alcance.
64. `RESPONSABLE_DE_CONTINUIDAD` puede proponer recuperación total.
65. Proponer recuperación total no equivale a aprobarla.
66. `GERENCIA_GENERAL` o `GOBIERNO_Y_PROPIEDAD` conservan la aprobación conforme a severidad y delegación vigente.
67. No se inventa una correspondencia nominal fija de severidad.
68. La autoridad de recuperación total debe ser resoluble y vigente.
69. La reincorporación revalida autoridad actual.
70. La autoridad observada durante la falla no se reutiliza automáticamente.
71. Una unidad contingente conserva identidad original.
72. Una unidad contingente conserva folio cuando aplica.
73. `local_operation_id` no se sustituye por el folio.
74. `idempotency_key` se conserva cuando aplica.
75. Una respuesta tardía se correlaciona antes de un nuevo efecto.
76. `RESULT_UNKNOWN` no crea una segunda intención destructiva.
77. Una operación expirada no se ejecuta automáticamente.
78. Un efecto ocurrido durante vigencia no se borra por expiración posterior.
79. Un conflicto material exige decisión propietaria cuando no existe regla determinista.
80. El productor del registro puede aportar evidencia sin apropiarse de la resolución.
81. Una corrección conserva el registro original.
82. La automatización no autoaprueba un conflicto no determinista.
83. La evidencia adversa no se elimina para liberar una cola.
84. Cada dominio conserva propiedad de sus hechos.
85. La conciliación transversal no crea una fuente de verdad nueva.
86. Un dominio no certifica unilateralmente hechos de otro dominio.
87. Un efecto externo sin receipt suficiente permanece desconocido cuando corresponda.
88. Una conciliación parcial no se presenta como integral.
89. Un conteo abierto solo disminuye con causa demostrable.
90. El balance de cierre distingue registros contingentes.
91. El balance distingue unidades admitidas.
92. El balance distingue unidades aplicadas.
93. El balance distingue unidades rechazadas.
94. El balance distingue duplicados confirmados.
95. El balance distingue operaciones expiradas con disposición.
96. El balance distingue conflictos abiertos.
97. El balance distingue resultados desconocidos abiertos.
98. El balance distingue unidades en cuarentena.
99. El balance distingue conciliaciones requeridas.
100. El balance distingue evidencia obligatoria no enlazada.
101. El balance distingue efectos downstream pendientes.
102. El balance distingue pendientes sin propietario.
103. El balance distingue pendientes transferidos a operación ordinaria.
104. El balance distingue acciones de mejora posteriores.
105. `CERRADO` se deniega con `RESULT_UNKNOWN` material abierto.
106. `CERRADO` se deniega con `CONFLICT` material abierto.
107. `CERRADO` se deniega con `QUARANTINED` sin decisión.
108. `CERRADO` se deniega con `RECONCILIATION_REQUIRED` abierto.
109. `CERRADO` se deniega con efecto ocurrido sin representación o disposición.
110. `CERRADO` se deniega con evidencia obligatoria faltante sin excepción admisible.
111. `CERRADO` se deniega con efecto downstream material pendiente.
112. `CERRADO` se deniega con operación expirada sin disposición.
113. `CERRADO` se deniega con trabajo contingente sin destino.
114. `CERRADO` se deniega con pendiente material sin propietario.
115. `CERRADO` se deniega sin validación funcional obligatoria.
116. `CERRADO` se deniega con control protector incumplido.
117. `CERRADO` se deniega cuando falta recuperación total requerida.
118. `CERRADO` se deniega con autoridad final no resoluble.
119. Un bloqueo no desaparece por desactivación.
120. Un bloqueo no desaparece por restauración técnica.
121. Un bloqueo no desaparece por terminar un turno.
122. Un bloqueo no desaparece por cambiar de canal.
123. Un pendiente posterior al cierre posee identidad propia.
124. Un pendiente posterior al cierre conserva vínculo histórico.
125. Un pendiente posterior al cierre posee propietario.
126. Un pendiente posterior al cierre posee condición de salida.
127. Un pendiente posterior al cierre no encubre conciliación operativa.
128. Un pendiente posterior al cierre no encubre un control protector incumplido.
129. Una acción de mejora no se usa para renombrar un pendiente operacional.
130. La propuesta de cierre identifica incidente y alcance.
131. La propuesta de cierre conserva severidad inicial, máxima y final.
132. La propuesta de cierre conserva procesos y servicios afectados.
133. La propuesta de cierre conserva validaciones relevantes.
134. La propuesta de cierre conserva balance de reincorporación y conciliación.
135. La propuesta de cierre conserva riesgos y excepciones.
136. La propuesta de cierre conserva pendientes posteriores admisibles.
137. La propuesta de cierre conserva requisito de revisión posterior.
138. Preparar la propuesta no cambia el estado a `CERRADO`.
139. El cierre exige aprobación obligatoria.
140. La aprobación corresponde a autoridad ejecutiva efectiva según severidad y delegación.
141. `RESPONSABLE_DE_CONTINUIDAD` no es aprobador final por dirigir el incidente.
142. El técnico no es aprobador final por restaurar el servicio.
143. El propietario funcional no es aprobador ejecutivo por validar su proceso.
144. El proveedor no aprueba el cierre de Vento.
145. La automatización no aprueba el cierre de Vento.
146. Una regla automática puede bloquear, pero no fabricar el allow final.
147. Una denegación de cierre conserva razones.
148. Una denegación de cierre conserva condición verificable para reevaluación.
149. Puede existir `DESACTIVADO` con pendientes identificados y asignados.
150. Puede existir recuperación total antes del cierre documental.
151. Puede existir cierre con revisión posterior abierta.
152. No puede existir cierre con recuperación total requerida sin resolver.
153. La concentración de funciones se registra explícitamente.
154. La concentración conserva función ejercida por acto.
155. La concentración conserva orden temporal.
156. La concentración conserva conflicto potencial.
157. La concentración conserva control compensatorio.
158. La concentración no crea autoaprobación crítica.
159. Una comprobación técnica inicial de bajo riesgo puede concentrarse cuando el contrato lo permite.
160. Esa concentración no sustituye validación funcional independiente cuando corresponda.
161. La persona que opera contingencia no aprueba por sí sola recuperación total.
162. La persona que opera contingencia no aprueba por sí sola cierre.
163. El beneficiario de una excepción no se autoaprueba la misma excepción crítica.
164. Si no existe segregación mínima para una decisión crítica, la decisión queda bloqueada.
165. No se crean aprobadores ficticios.
166. La revisión posterior no reescribe la historia del incidente.
167. Abrir revisión no cierra el incidente.
168. Cerrar el incidente no concluye la revisión.
169. Los estados de revisión no sustituyen estados del incidente.
170. Quien ejecutó puede aportar hechos a la revisión.
171. Aportar hechos no concede autoridad para fijar causa unilateralmente.
172. El actor investigado no controla por sí solo la evidencia.
173. Causa propuesta y causa confirmada permanecen separadas.
174. Una revisión puede concluir con riesgo residual solo con autoridad y tratamiento explícitos.
175. La revisión no funciona como proceso disciplinario implícito.
176. Un hallazgo operacional posterior no reescribe el cierre histórico.
177. Un hallazgo material posterior conserva momento de descubrimiento.
178. Un efecto no resuelto descubierto después del cierre exige nueva decisión de gobierno.
179. Una corrección posterior conserva antes, después, actor, razón y evidencia.
180. Hallazgo, lección, acción, implementación, eficacia y actualización permanecen etapas distintas.
181. Implementar una acción no prueba eficacia.
182. La eficacia usa método y evidencia posteriores.
183. El ejecutor no acepta su propio riesgo residual por conveniencia.
184. Una acción material no depende únicamente de la declaración de su ejecutor para considerarse eficaz.
185. Un ejercicio mantiene autoridad simulada separada de autoridad real.
186. Ejecutar restauración de prueba no aprueba recuperación empresarial del ejercicio.
187. Una prueba abortada conserva su resultado real.
188. Cerrar ejercicio no concluye automáticamente la revisión posterior.
189. Un incidente real surgido durante un ejercicio entra al ciclo real.
190. Un proveedor puede aportar evidencia técnica sin validar MBCO.
191. Un proveedor no declara proceso empresarial recuperado.
192. Un proveedor no aprueba recuperación total.
193. Un proveedor no aprueba cierre.
194. Una automatización puede calcular balance sin aprobar cierre.
195. Una automatización puede bloquear transición inválida.
196. Una automatización no acepta riesgo residual empresarial.
197. La misma semántica aplica a UI, servidor, API, RPC, RLS, Edge Functions, jobs, webhooks, Realtime y offline.
198. Una superficie visible no sustituye evaluación autoritativa.
199. Cada transición protegida conserva expediente y correlación.
200. Cada transición protegida conserva actor y función.
201. Cada transición protegida conserva alcance y recurso.
202. Cada transición protegida conserva evidencia y razones.
203. Cada transición protegida conserva versión contractual.
204. Cada transición protegida conserva aprobador cuando aplique.
205. Cada transición protegida conserva concentración y control compensatorio cuando existan.
206. Cada transición protegida conserva pendientes resultantes.
207. Una denegación queda auditable.
208. La tarea trata documentalmente el cierre prematuro heredado de `H-CAP-SCOPE-018-020`.
209. La tarea trata documentalmente la separación restauración/conciliación de `H-CAP-SCOPE-018-035`.
210. `CONT-UX-001` permanece únicamente reservada.
211. `CONT-UX-002` a `CONT-UX-007` permanecen posteriores.
212. `CONT-INT-001` a `CONT-INT-004` permanecen posteriores.
213. La implementación de enforcement permanece en tareas AUTH/SHELL y paquetes propietarios.
214. La prueba de recuperación y cierre permanece en ejercicios y paquetes autorizados.
215. La tarea no modifica criticidades BIA.
216. La tarea no modifica perfiles `CONT-OBJ-*`.
217. La tarea no modifica MTPD.
218. La tarea no modifica RTO.
219. La tarea no modifica RPO.
220. La tarea no modifica MBCO.
221. La tarea no modifica estrategias `CTG-*`.
222. La tarea no cambia propietarios de proceso.
223. La tarea no cambia estados de readiness.
224. La tarea no crea roles base.
225. La tarea no crea roles operativos.
226. La tarea no crea permisos físicos.
227. La tarea no crea cuentas o credenciales.
228. La tarea no crea un segundo evaluador de autorización.
229. La tarea crea cero requisitos de prueba.
230. La tarea modifica cero requisitos de prueba.
231. La tarea difiere cero requisitos de prueba.
232. La tarea descarta cero requisitos de prueba.
233. La tarea vuelve obsoletos cero requisitos de prueba.
234. La ausencia de cambios de requisitos no genera un registro adicional.
235. La tarea conserva exactamente una siguiente tarea reservada.

---

#### 40. Balance de cierre documental

| Control                                      |                 Resultado |
| -------------------------------------------- | ------------------------: |
| etapa atendida                               |           `CONT-AUTH-004` |
| naturaleza                                   |                documental |
| acciones físicas ejecutadas                  |                     **0** |
| incidentes reales cerrados                   |                     **0** |
| recuperaciones totales declaradas            |                     **0** |
| reincorporaciones productivas ejecutadas     |                     **0** |
| conciliaciones productivas ejecutadas        |                     **0** |
| revisiones posteriores reales creadas        |                     **0** |
| verificaciones de eficacia reales ejecutadas |                     **0** |
| cambios TREQ                                 |                     **0** |
| siguiente tarea                              | `CONT-UX-001` — RESERVADA |

---

#### 41. Continuidad

ÚLTIMA TAREA APROBADA

`CONT-AUTH-003 — Proteger respaldos, runbooks, contactos, evidencia, formularios y datos de contingencia`

TAREA ACTUAL APROBADA

`CONT-AUTH-004 — Separar ejecución, validación, reincorporación, conciliación, cierre y revisión posterior`

SIGUIENTE TAREA RESERVADA

`CONT-UX-001 — Diseñar inicio ejecutivo de continuidad con estado, impacto, prioridades, responsables y decisiones`

