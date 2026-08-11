### MINI-BLOQUE — DOMINIO DE CONTINUIDAD Y RECUPERACION

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **dominio de continuidad y recuperacion** dentro de **AC CONTINUIDAD OPERATIVA Y RECUPERACION**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `CONT-DOM-001` a `CONT-DOM-015` — 15 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Definir política, alcance, gobierno, roles y ciclo de mantenimiento de continuidad” y concluye con “Definir revisión posterior, lecciones, acciones, eficacia y actualización periódica del plan”.
<!-- PLAN-SECTION-META:END -->

### ✅ CONT-DOM-001 — Definir política, alcance, gobierno, roles y ciclo de mantenimiento de continuidad

**Estado:** APROBADA
**Tarea anterior:** `DATA-INT-004 — Definir integración controlada con BI, hojas de cálculo, modelos analíticos e inteligencia artificial` — APROBADA
**Tarea siguiente:** `CONT-DOM-002 — Definir análisis de impacto empresarial, servicios críticos, procesos, sedes y niveles mínimos` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de política, alcance, gobierno, funciones, responsabilidades, segregación y ciclo de mantenimiento de continuidad empresarial
**Bloque:** AC — Continuidad operativa y recuperación
**Fase:** exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`
**Implementación técnica u operativa:** no autorizada
**Activaciones de contingencia, accesos de emergencia, restauraciones, failover, interrupciones, cambios de proveedores, cambios de respaldos, procedimientos manuales en producción, código, DDL, DML, migraciones, RLS, RPC, secretos, backfills o cambios en Supabase:** no autorizados
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el gobierno permanente mediante el cual Vento Group mantendrá vigente, coherente, autorizado y verificable su sistema de continuidad empresarial, sin convertir continuidad en una responsabilidad exclusivamente tecnológica, sin quitar a cada dominio la propiedad de su proceso y sin confundir la aprobación de una política con la capacidad real de continuar o recuperar una operación.

La tarea materializa la política marco que deberá permitir responder de forma determinista:

```text
qué cubre continuidad y qué queda fuera
qué principios no pueden degradarse durante una interrupción
quién gobierna la política
quién mantiene el programa
quién conserva la propiedad de cada proceso
qué funciones pueden preparar, revisar, aprobar, ejecutar y validar
cómo se registra una suplencia
cómo se evitan autoaprobaciones en decisiones críticas
qué artefactos forman el sistema de continuidad
cómo se versionan, publican, revisan y retiran
qué cambios obligan a revisar el plan
cómo se mantiene trazabilidad entre política, proceso, evidencia e incidente
qué decisiones pertenecen a las tareas posteriores del BLOQUE AC
qué evidencia es necesaria antes de afirmar readiness
```

El resultado de esta tarea es un contrato documental de gobierno. No declara que exista todavía un BIA consolidado, una lista de servicios críticos, objetivos MTPD/RTO/RPO/MBCO, procedimientos alternos aprobados, respaldos recuperables, runbooks probados o readiness operacional.

---

#### 2. Resultado sustantivo

Queda definido el contrato `CONT-DOM-001` con los siguientes resultados:

1. política marco de continuidad empresarial aplicable de forma transversal a Vento Group;
2. frontera explícita entre continuidad empresarial, recuperación técnica, incidentes tecnológicos, SST, seguridad de información, gestión de datos, releases y contingencia temporal de implementación;
3. alcance organizacional, empresarial, operativo, tecnológico, informacional, físico, externo y temporal que deberá evaluarse cuando una capacidad resulte crítica;
4. adopción de `VPROC-0062` como proceso canónico de continuidad, con VISO como aplicación propietaria del expediente transversal y las demás aplicaciones como propietarias de sus hechos y recuperaciones de dominio;
5. adopción de `VPROC-0003` como proceso canónico para gobernar versiones, responsabilidades, delegaciones y límites de la política;
6. modelo de gobierno con `GOBIERNO_Y_PROPIEDAD`, `GERENCIA_GENERAL`, `RESPONSABLE_DE_CONTINUIDAD`, `RESPONSABLE_DEL_PROCESO`, `COORDINACION_DE_OPERACIONES`, `RESPONSABLE_TECNOLOGICO`, `GERENCIA_O_SUPERVISION_DE_SEDE` y `EQUIPO_OPERATIVO_DEL_AREA` como funciones directamente relacionadas con `VPROC-0062`;
7. incorporación de `RESPONSABLE_DE_RIESGO_EMPRESARIAL` y `CUSTODIO_DOCUMENTAL` como funciones de apoyo al gobierno de la política conforme a `VPROC-0003`;
8. separación de funciones de gobierno frente a participantes externos como proveedor, técnico o prestador externo y automatización asistiva;
9. regla de que rol, cargo, acceso a aplicación, propiedad técnica, dispositivo o presencia en una contingencia no conceden autoridad de continuidad por sí mismos;
10. reglas de concentración compatibles con una organización pequeña sin perder función ejercida, alcance, segregación ni evidencia;
11. matriz materializada de derechos de decisión para política, alcance, roles, versiones, excepciones y mantenimiento;
12. jerarquía documental del sistema de continuidad sin crear fuentes de verdad paralelas;
13. contrato mínimo de una versión de política y del registro de responsabilidades;
14. ciclo completo de mantenimiento desde detección de cambio hasta publicación, propagación, evidencia y retiro de la versión anterior;
15. catálogo de disparadores de revisión obligatoria;
16. separación entre cambio material, corrección administrativa y actualización derivada de un incidente o ejercicio;
17. principio de revisión periódica basada en riesgo sin inventar una frecuencia universal;
18. reglas para excepciones, aceptación de riesgo, vencimiento y compensaciones sin convertir la excepción en bypass permanente;
19. matriz de responsabilidades entre BLOQUE AC, dominios, BLOQUE Z, AA, AB, E4, E5, T, U, X, VISO, ANIMA y aplicaciones propietarias;
20. handoffs exactos hacia `CONT-DOM-002` a `CONT-DOM-015`, `CONT-AUTH-*`, `CONT-UX-*` y `CONT-INT-*`;
21. resolución documental de `H-CAP-SCOPE-018-001` mediante un gobierno empresarial común de continuidad;
22. resolución de la parte de `CONT-DOM-001` sobre responsables y suplencia mediante reglas de asignación, vigencia y sustitución, dejando el mando específico de incidente a `CONT-DOM-006`;
23. cero cambios físicos y cero cambios de requisitos de prueba.

---

#### 3. Entradas canónicas consumidas

Esta tarea consume sin redefinir:

- `CAP-SCOPE-018` para las doce subcapacidades `CAP-18.01` a `CAP-18.12`, sus 38 hallazgos, fronteras, roles conceptuales y decisiones de continuidad;
- la corrección canónica posterior de coherencia `CAP-SCOPE`, que confirma el título y la aprobación vigente de `CAP-SCOPE-018` frente a textos transitorios históricos;
- `CAP-SCOPE-019` para propiedad funcional y fronteras de los dominios;
- `PROC-CAT-004` a `PROC-CAT-008` para propósito, propiedad, consumidoras e iniciadores de `VPROC-0062`;
- `PROC-ACTOR-001` a `PROC-ACTOR-003` para aplicabilidad de roles, funciones, iniciadores, ejecutores, supervisores, aprobadores y segregación;
- `VPROC-0003` para gobierno de políticas, delegaciones y límites de decisión mediante versiones vigentes;
- `VPROC-0062` para continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje;
- el BLOQUE AC vigente y su secuencia `CONT-DOM-001` a `CONT-INT-004`;
- los requisitos vigentes de continuidad, integración, autorización, información y trazabilidad que ya protegen el comportamiento transversal.

La tarea no modifica decisiones previas sobre propietarios de procesos, roles base, roles operativos, autorizaciones, datos, aplicaciones o integraciones.

---

#### 4. Decisión principal

Vento OS adopta un modelo de **continuidad empresarial federada con gobierno transversal**.

```text
GOBIERNO TRANSVERSAL DE CONTINUIDAD
→ define política, alcance, método, responsabilidades y mantenimiento
→ coordina el expediente empresarial de continuidad
→ no se convierte en dueño de todos los procesos

PROPIETARIO DE CADA PROCESO
→ conserva su resultado empresarial
→ define y valida su continuidad específica
→ conserva la fuente de verdad de sus hechos
→ confirma si el proceso quedó realmente recuperado

RECUPERACIÓN TÉCNICA
→ restablece componentes y servicios técnicos
→ no declara por sí sola recuperación empresarial

CONTINGENCIA
→ mantiene, reduce, prepara o suspende trabajo de forma gobernada
→ nunca crea una segunda fuente de verdad

REINCORPORACIÓN
→ devuelve el trabajo de contingencia a los procesos propietarios
→ exige validación, idempotencia, conflicto, conciliación y evidencia

REVIEW / LEARNING
→ actualiza el sistema de continuidad mediante una nueva decisión versionada
→ no reescribe la historia del incidente o ejercicio
```

Regla cardinal:

```text
SERVICIO TÉCNICAMENTE DISPONIBLE
≠
PROCESO EMPRESARIAL RECUPERADO
```

La recuperación empresarial solo podrá afirmarse cuando el propietario funcional confirme el resultado correspondiente y los pendientes, datos y efectos aplicables hayan sido tratados por sus contratos propietarios.

---

#### 5. Política marco de continuidad

La política de continuidad de Vento Group queda gobernada por los siguientes principios:

1. **primacía del resultado empresarial:** las prioridades se justifican por productos, servicios, procesos y obligaciones, no por la mera existencia de un componente técnico;
2. **propiedad federada:** cada dominio conserva su proceso, datos, decisiones y validación funcional;
3. **coordinación transversal:** BLOQUE AC gobierna el método común y la coordinación de continuidad;
4. **proporcionalidad:** no toda capacidad requiere modo offline, alta disponibilidad o redundancia completa;
5. **decisión explícita:** toda capacidad crítica deberá terminar con una decisión documentada sobre continuidad, degradación segura o detención protectora;
6. **seguridad antes que disponibilidad aparente:** continuidad no autoriza omitir controles de vida, SST, inocuidad, calidad, privacidad, autorización, integridad o segregación;
7. **degradación visible:** una operación reducida o contingente debe identificarse como tal y no presentarse como operación normal;
8. **fuente de verdad única:** papel, hojas, mensajes, borradores locales, snapshots o colas no adquieren propiedad empresarial por utilizarse durante una falla;
9. **reincorporación controlada:** todo trabajo contingente que produzca o prepare un efecto deberá tener ruta de incorporación, conflicto, conciliación y cierre;
10. **no promesas ficticias:** no se declaran tiempos, pérdidas máximas, alternativas o capacidades de recuperación que no estén respaldadas por diseño y evidencia;
11. **autorización persistente:** una emergencia no elimina permisos, finalidad, territorio, RLS, auditoría ni límites permanentes; cualquier mecanismo excepcional tendrá contrato propio;
12. **evidencia y versionado:** una política, plan, runbook o lista crítica deberá poder reconstruirse según la versión aplicable al momento del hecho;
13. **recuperación funcional:** restaurar infraestructura, base, archivo o aplicación es un paso, no el criterio final de cierre empresarial;
14. **prueba antes de confianza:** disponibilidad declarada, backup exitoso, réplica o documentación vigente no equivalen a readiness probado;
15. **aprendizaje trazable:** incidente, ejercicio o hallazgo que exija cambio deberá producir acción con propietario y condición de salida;
16. **no disciplina automática:** la revisión posterior busca hechos, causas y eficacia; no sustituye procesos laborales, SST, seguridad, privacidad o cumplimiento;
17. **separación de contingencia permanente y temporal:** BLOQUE AC gobierna continuidad empresarial permanente; E5 conserva contingencias de cutover, piloto e hypercare;
18. **terceros no transfieren autoridad:** un proveedor puede recuperar su servicio o aportar evidencia, pero no declara recuperado el proceso de Vento;
19. **automatización asistiva sin autoridad implícita:** una alerta, modelo, agente o automatización puede detectar, resumir o proponer; no aprueba por sí sola activación, excepción, recuperación o cierre;
20. **historia preservada:** una nueva versión, corrección o revisión no borra qué política, decisión o evidencia estuvo vigente en un incidente anterior.

---

#### 6. Alcance de la política

La política cubre el universo que `CAP-SCOPE-018` exige evaluar cuando sea material para una capacidad empresarial:

| Dimensión               | Cobertura de gobierno                                                                    | Decisión que no se toma todavía                          |
| ----------------------- | ---------------------------------------------------------------------------------------- | -------------------------------------------------------- |
| organización            | entidades, marcas, establecimientos, sedes, áreas y relaciones aplicables                | qué unidades son críticas en cada escenario              |
| negocio                 | productos, servicios, procesos, subcapacidades y compromisos                             | qué servicios reciben prioridad concreta                 |
| personas                | funciones, disponibilidad, suplencia, conocimiento y capacidad de ejecución              | dotación mínima por proceso                              |
| datos                   | hechos, maestros, documentos, evidencia, colas y pendientes                              | RPO o pérdida tolerable por fuente                       |
| aplicaciones            | VISO, ANIMA, NEXO, FOGO, ORIGO, PULSO, NUMERA, PASS, AURA cuando corresponda y SHELL     | criticidad o modalidad de cada aplicación                |
| tecnología              | Supabase, red, endpoints, dispositivos, impresión, infraestructura y servicios técnicos  | arquitectura de recuperación o failover                  |
| instalaciones           | energía, servicios públicos, espacio físico, zonas y recursos de sede                    | ubicación alternativa concreta                           |
| inventario y producción | insumos, materiales, equipos, capacidad y recursos productivos                           | mínimos o sustitutos específicos                         |
| proveedores             | nube, telecomunicaciones, pagos, transporte, canales y proveedores de bienes o servicios | proveedor alternativo concreto                           |
| comunicaciones          | trabajadores, clientes, proveedores, responsables, asesores o autoridades                | canal, plantilla o frecuencia de un incidente específico |
| tiempo                  | horario, turno, temporada, duración, cierres y ventanas empresariales                    | MTPD, RTO, RPO, MBCO o umbrales concretos                |

Una dimensión incluida en alcance no queda automáticamente clasificada como crítica. La criticidad y los niveles mínimos se materializan en `CONT-DOM-002`.

##### 6.1. Matriz materializada de las 12 subcapacidades CAP-18

| Subcapacidad                                                | Tratamiento heredado | Decisión en CONT-DOM-001                                                                                                                | Estado / handoff                                                                           |
| ----------------------------------------------------------- | -------------------- | --------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| `CAP-18.01` — Identificar dependencias críticas             | `BUILD`              | La política obliga a gobernar criticidad y dependencias desde resultados empresariales, sin convertir existencia técnica en criticidad. | `ESPECIFICADO`; BIA en `CONT-DOM-002` y mapa en `CONT-DOM-003`.                            |
| `CAP-18.02` — Preparar respuestas alternativas              | `CONTROLLED_MANUAL`  | La política exige decisión explícita por capacidad y prohíbe que una alternativa cree una fuente de verdad paralela.                    | `ESPECIFICADO`; estrategias concretas en `CONT-DOM-008`.                                   |
| `CAP-18.03` — Detectar y reportar incidentes                | `REUSE_OR_REFACTOR`  | La política exige correlación sin fusionar incidentes tecnológicos, laborales, de información y continuidad.                            | `ESPECIFICADO`; taxonomía y ciclo en `CONT-DOM-005`.                                       |
| `CAP-18.04` — Evaluar impacto y prioridad                   | `BUILD`              | La política fija que impacto y prioridad son empresariales, trazables y dependientes de alcance y duración.                             | `ESPECIFICADO`; BIA en `CONT-DOM-002` y severidad en `CONT-DOM-005`.                       |
| `CAP-18.05` — Mantener operación mínima                     | `CONTROLLED_MANUAL`  | La política permite continuar, reducir o detener de forma protectora; no obliga a todo proceso a seguir operando.                       | `ESPECIFICADO`; mínimos concretos en `CONT-DOM-007`.                                       |
| `CAP-18.06` — Recuperar equipos, servicios e información    | `REUSE_OR_REFACTOR`  | La política separa recuperación técnica de validación funcional del proceso.                                                            | `ESPECIFICADO`; runbooks y validación en `CONT-DOM-012` con BLOQUE Z.                      |
| `CAP-18.07` — Registrar trabajo realizado durante la falla  | `BUILD`              | La política exige trazabilidad, custodia y posterior incorporación para todo trabajo contingente material.                              | `ESPECIFICADO`; folios y contrato de captura en `CONT-DOM-009`.                            |
| `CAP-18.08` — Incorporar posteriormente lo ocurrido         | `BUILD`              | La política exige reincorporación idempotente, no destructiva y reconciliable hacia la fuente propietaria.                              | `ESPECIFICADO`; materialización en `CONT-DOM-010` y `CONT-INT-004`.                        |
| `CAP-18.09` — Confirmar que no quedaron pendientes          | `BUILD`              | La política prohíbe cierre global que oculte pendientes de dominio y exige validación del resultado empresarial.                        | `ESPECIFICADO`; conciliación y cierre en `CONT-DOM-010`, `CONT-DOM-012` y `CONT-AUTH-004`. |
| `CAP-18.10` — Aprender del incidente y mejorar la respuesta | `REUSE_OR_REFACTOR`  | La política integra aprendizaje al ciclo de mantenimiento sin reescribir la historia del incidente.                                     | `ESPECIFICADO`; revisión y eficacia en `CONT-DOM-015` con BLOQUE AB.                       |
| `CAP-18.11` — Gestionar respaldos y recuperación            | `REUSE_OR_REFACTOR`  | La política establece que respaldo, réplica, restauración y recuperación son estados distintos y requieren evidencia.                   | `ESPECIFICADO`; cobertura en `CONT-DOM-011` y recuperación en `CONT-DOM-012`.              |
| `CAP-18.12` — Coordinar comunicación durante incidentes     | `INTEGRATE_EXTERNAL` | La política separa comunicación técnica, operativa, ejecutiva, laboral, comercial, de proveedor y de autoridad.                         | `ESPECIFICADO`; mando y mensajes en `CONT-DOM-006`, `CONT-UX-006` y contratos posteriores. |

**Reconciliación:** 12 subcapacidades esperadas; 12 materializadas; 0 faltantes; 0 duplicadas. Distribución heredada preservada: 5 `BUILD`, 4 `REUSE_OR_REFACTOR`, 2 `CONTROLLED_MANUAL`, 1 `INTEGRATE_EXTERNAL`.

---

#### 7. Fronteras conceptuales obligatorias

```text
continuidad empresarial ≠ alta disponibilidad ≠ disaster recovery técnico
```

```text
incidente de continuidad ≠ incidente tecnológico ≠ incidente SST ≠ incidente de información
```

```text
política de continuidad ≠ BIA ≠ plan por capacidad ≠ runbook ≠ checklist de incidente
```

```text
propietario del proceso ≠ responsable de continuidad ≠ responsable técnico ≠ proveedor
```

```text
rol base ≠ función de continuidad ≠ permiso ≠ autorización final
```

```text
suplente definido ≠ autoridad permanente ≠ permiso heredado
```

```text
modo degradado ≠ operación normal ≠ recuperación completa
```

```text
backup configurado ≠ backup íntegro ≠ restauración comprobada ≠ proceso recuperado
```

```text
actualización administrativa ≠ cambio material de política
```

```text
plan revisado ≠ plan probado ≠ readiness certificado
```

---

#### 8. Proceso canónico de continuidad

`VPROC-0062` permanece como el proceso transversal de continuidad:

```text
Gestionar continuidad desde detección
hasta operación mínima, recuperación,
reconciliación y aprendizaje
```

Propiedad y frontera heredadas:

- **aplicación propietaria:** VISO;
- VISO conserva criticidad, plan, incidente empresarial, coordinación y cierre transversal;
- SHELL únicamente informa o coordina acceso dentro de su contrato y no se convierte en propietario de continuidad;
- ANIMA, NEXO, FOGO, ORIGO, PULSO, NUMERA, AURA, PASS y los demás dominios conservan sus hechos y recuperan sus procesos;
- cada aplicación valida la reincorporación de los hechos que le pertenecen;
- un incidente local puede correlacionarse con continuidad sin perder su expediente original.

El proceso puede iniciarse desde un umbral o alerta, un trabajador, gerencia o supervisión de sede, `RESPONSABLE_DE_CONTINUIDAD` o un técnico/prestador externo, pero iniciar o reportar no concede autoridad para activar o cerrar.

---

#### 9. Proceso canónico de gobierno de política

Las versiones de la política y sus límites se gobiernan mediante `VPROC-0003`:

```text
Gobernar responsabilidades, políticas,
delegaciones y límites de decisión
mediante versiones vigentes
```

Decisión heredada de segregación:

- iniciador primario: `GOBIERNO_Y_PROPIEDAD`;
- iniciadores alternos: `GERENCIA_GENERAL`, `RESPONSABLE_DE_RIESGO_EMPRESARIAL`;
- ejecutores principales: `GERENCIA_GENERAL`, `RESPONSABLE_DE_RIESGO_EMPRESARIAL`;
- apoyos: `RESPONSABLE_DEL_PROCESO`, `CUSTODIO_DOCUMENTAL`;
- supervisor/control: `GOBIERNO_Y_PROPIEDAD`;
- aprobación obligatoria de versión, delegación, límite, publicación o retiro de política: `GOBIERNO_Y_PROPIEDAD`;
- redactor, evaluador de impacto y aprobador no se colapsan en una misma decisión crítica por conveniencia.

`CONT-DOM-001` especializa ese proceso para continuidad; no crea un circuito alterno de aprobación.

---

#### 10. Modelo de gobierno permanente

El gobierno opera en cuatro planos separados:

| Plano     | Función                                                                | Autoridad principal                                 | Frontera                                                                 |
| --------- | ---------------------------------------------------------------------- | --------------------------------------------------- | ------------------------------------------------------------------------ |
| política  | principios, alcance, responsabilidades y límites permanentes           | `GOBIERNO_Y_PROPIEDAD` mediante `VPROC-0003`        | aprobar política no activa contingencia                                  |
| programa  | mantener cobertura, versiones, responsables, pendientes y coordinación | `RESPONSABLE_DE_CONTINUIDAD` con `GERENCIA_GENERAL` | mantener no equivale a aprobar excepciones sensibles                     |
| proceso   | definir y validar continuidad del resultado empresarial propio         | `RESPONSABLE_DEL_PROCESO`                           | no modifica otras fuentes de verdad ni decide recuperación técnica ajena |
| ejecución | aplicar procedimientos autorizados durante incidente o ejercicio       | funciones operativas y técnicas según el caso       | ejecutar no concede aprobación de recuperación o cierre                  |

La política no designa una aplicación como autoridad universal. VISO soporta el expediente transversal; la autoridad empresarial continúa determinada por función, capacidad, alcance y autorización.

---

#### 11. Funciones de gobierno y responsabilidades

| Función canónica                    | Responsabilidad en CONT-DOM-001                                                                                            | No adquiere por esta tarea                                                 |
| ----------------------------------- | -------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| `GOBIERNO_Y_PROPIEDAD`              | aprobar la política, sus cambios materiales, límites y retiro; controlar segregación                                       | ejecución operativa automática ni bypass                                   |
| `GERENCIA_GENERAL`                  | patrocinar el programa, asegurar decisión ejecutiva y capacidad organizacional, participar en revisión                     | propiedad de todos los procesos ni acceso irrestricto                      |
| `RESPONSABLE_DE_CONTINUIDAD`        | custodiar el programa, coordinar mantenimiento, detectar vencimientos/cambios, articular propietarios y preparar evidencia | autoridad automática para activar, cerrar o aceptar cualquier riesgo       |
| `RESPONSABLE_DEL_PROCESO`           | definir necesidad de continuidad de su resultado, aportar BIA, alternativas y validar recuperación funcional               | autoridad sobre datos o procesos de otros dominios                         |
| `RESPONSABLE_DE_RIESGO_EMPRESARIAL` | aportar evaluación de impacto, riesgo, excepciones y cambios de política                                                   | aprobación final de su propia evaluación                                   |
| `CUSTODIO_DOCUMENTAL`               | conservar versiones, vigencias, evidencias y referencias documentales                                                      | autoridad para decidir criticidad o recuperación                           |
| `COORDINACION_DE_OPERACIONES`       | coordinar dependencias operativas, traspasos y consistencia entre sedes/áreas                                              | propiedad de los procesos que coordina                                     |
| `RESPONSABLE_TECNOLOGICO`           | aportar salud técnica, recuperación técnica, dependencias y evidencia                                                      | facultad para declarar recuperación empresarial por disponibilidad técnica |
| `GERENCIA_O_SUPERVISION_DE_SEDE`    | aportar contexto territorial, ejecutar o supervisar responsabilidades locales autorizadas                                  | alcance global por cargo o visibilidad                                     |
| `EQUIPO_OPERATIVO_DEL_AREA`         | ejecutar el procedimiento aprobado que corresponda a su turno, sede, área y recurso                                        | facultad para activar globalmente o cerrar continuidad                     |
| técnico o prestador externo         | ejecutar o informar su obligación contractual y aportar evidencia                                                          | propiedad del proceso, autoridad interna o aprobación de cierre            |
| proveedor                           | recuperar su servicio, comunicar estado y cumplir escalamiento contractual                                                 | declarar que Vento recuperó el resultado empresarial                       |
| automatización asistiva             | detectar, correlacionar, resumir, alertar o preparar propuestas cuando esté autorizada                                     | autoridad de activación, excepción, recuperación o cierre                  |

No se asignan personas concretas en esta tarea. Toda designación futura debe vincular función, actor, alcance, vigencia, suplencia y autorización sin convertir una etiqueta organizacional en permiso.

---

#### 12. Regla de concentración en una organización pequeña

Vento puede concentrar varias funciones en una misma persona cuando la estructura real lo exija, pero la concentración no elimina las fronteras del modelo.

Obligaciones:

1. registrar qué función ejerce el actor en cada decisión;
2. conservar alcance organizacional y territorial;
3. no utilizar el cargo como wildcard;
4. separar preparación y aprobación final de una decisión crítica cuando la matriz canónica lo exige;
5. exigir revisión posterior para decisiones sensibles en las que no exista separación simultánea materialmente posible;
6. mantener suplente o ruta de escalamiento para funciones cuya ausencia pueda impedir una decisión crítica;
7. no permitir que un proveedor, cuenta técnica, dispositivo o automatización supla una autoridad humana por inferencia;
8. reevaluar autorizaciones cuando cambie la persona, vínculo, función, sede, alcance o vigencia.

---

#### 13. Registro de responsabilidades y suplencia

Cada función materialmente necesaria para continuidad deberá poder conservar:

- función canónica;
- actor o equipo asignado;
- organización, sede o alcance aplicable;
- procesos o capacidades cubiertos;
- vigencia desde/hasta;
- titular y suplente cuando corresponda;
- condiciones que habilitan la sustitución;
- restricciones y segregaciones;
- autoridad que aprobó la asignación;
- referencias de contacto protegidas;
- última revisión;
- estado de la asignación;
- evidencia de aceptación o conocimiento cuando corresponda;
- relación con la versión de política o plan aplicable.

Reglas:

- suplencia no significa transferencia permanente de permisos;
- una sustitución se evalúa dentro del alcance autorizado del actor real;
- una persona retirada, suspendida o sin vínculo vigente no permanece como sustituto operativo;
- contactos y roles se actualizan sin borrar la versión que aplicó históricamente;
- la matriz detallada de mando durante un incidente se materializa en `CONT-DOM-006` y `CONT-AUTH-001`.

---

#### 14. Derechos de decisión

| Decisión                                             | Prepara / mantiene                                           | Revisa                                         | Aprueba o acepta                                               | Frontera                                 |
| ---------------------------------------------------- | ------------------------------------------------------------ | ---------------------------------------------- | -------------------------------------------------------------- | ---------------------------------------- |
| política marco                                       | `RESPONSABLE_DE_CONTINUIDAD` con gerencia y riesgo           | propietarios de procesos y funciones afectadas | `GOBIERNO_Y_PROPIEDAD` mediante `VPROC-0003`                   | no activa contingencia                   |
| alcance del programa                                 | `RESPONSABLE_DE_CONTINUIDAD`                                 | `GERENCIA_GENERAL` + propietarios afectados    | `GOBIERNO_Y_PROPIEDAD` cuando cambia materialmente la política | incluir en alcance no declara criticidad |
| asignación de responsable del programa               | autoridad organizacional competente                          | gerencia y gobierno según alcance              | autoridad prevista por gobierno organizacional                 | nadie se autoasigna autoridad crítica    |
| asignación de propietario de proceso                 | se consume del gobierno de procesos                          | no se redefine localmente                      | proceso canónico propietario                                   | continuidad no cambia ownership          |
| actualización de contacto o referencia no sustantiva | custodio autorizado                                          | responsable correspondiente                    | conforme al gobierno documental aplicable                      | no cambia autoridad ni alcance           |
| cambio material de principio, alcance, rol o límite  | `RESPONSABLE_DE_CONTINUIDAD` / gerencia / riesgo             | propietarios afectados                         | `GOBIERNO_Y_PROPIEDAD`                                         | exige versión nueva                      |
| excepción temporal a la política                     | propietario solicitante + continuidad + riesgo               | funciones afectadas                            | autoridad de riesgo/gobierno aplicable                         | limitada, justificada y con vencimiento  |
| criticidad y nivel mínimo                            | `CONT-DOM-002`                                               | propietarios y continuidad                     | según contrato posterior                                       | no se decide aquí                        |
| MTPD/RTO/RPO/MBCO                                    | `CONT-DOM-004`                                               | propietarios, continuidad y dependencias       | según contrato posterior                                       | no se inventan cifras aquí               |
| activación o desactivación de continuidad            | `CONT-DOM-005` + `CONT-AUTH-001`                             | mando aplicable                                | autoridad por severidad                                        | política no equivale a activación        |
| recuperación técnica                                 | `RESPONSABLE_TECNOLOGICO` y propietario técnico              | propietario funcional afectado                 | según runbook y autorización                                   | técnica ≠ empresarial                    |
| validación de resultado recuperado                   | `RESPONSABLE_DEL_PROCESO`                                    | continuidad y funciones de conciliación        | contrato de cierre posterior                                   | no se sustituye por health check         |
| cierre integral                                      | tareas de incidente, conciliación y autorización posteriores | propietarios afectados                         | autoridad definida por severidad                               | no se ejecuta en esta tarea              |

---

#### 15. Jerarquía documental del sistema de continuidad

El sistema documental se organiza sin crear documentos competidores:

```text
POLÍTICA MARCO
→ principios, alcance, gobierno y límites

REGISTRO DE COBERTURA
→ qué capacidades requieren análisis y qué estado tienen

ANÁLISIS DE IMPACTO Y DEPENDENCIAS
→ criticidad, niveles mínimos, objetivos y supuestos

PLAN / ESTRATEGIA POR CAPACIDAD
→ cómo se mantiene, degrada o protege el resultado

RUNBOOK / CHECKLIST
→ secuencia ejecutable para un escenario autorizado

EXPEDIENTE DE INCIDENTE O EJERCICIO
→ qué ocurrió, qué se decidió, qué se ejecutó y qué quedó pendiente

REINCORPORACIÓN / CONCILIACIÓN
→ cómo regresó el trabajo contingente a la fuente propietaria

REVISIÓN Y MEJORA
→ qué debe cambiar y cómo se comprueba su eficacia
```

`CONT-DOM-001` define la relación entre esos artefactos. Las tareas posteriores materializan su contenido específico.

---

#### 16. Contrato mínimo de una versión de política

Toda versión deberá poder declarar, como mínimo:

- identidad y versión;
- estado y vigencia;
- propósito;
- alcance organizacional y exclusiones justificadas;
- principios obligatorios;
- funciones de gobierno;
- derechos de decisión;
- segregaciones;
- referencias a procesos y dominios cubiertos;
- referencia a la estructura vigente de continuidad;
- dependencias normativas o contractuales cuando apliquen;
- excepciones vigentes relacionadas;
- autor o preparador;
- revisores;
- aprobador;
- fecha de aprobación;
- fecha de entrada en vigor;
- versión sustituida;
- motivo del cambio;
- referencia a evidencia de revisión;
- próximos disparadores o condición de revisión;
- estado de comunicación o publicación interna.

Una versión aprobada no se sobrescribe para cambiar significado. Los cambios materiales producen una versión posterior relacionada.

---

#### 17. Estados documentales del ciclo de política

El ciclo conceptual conserva estas etapas sin convertirlas por esta tarea en enums físicos:

```text
borrador
→ revisión
→ aprobación
→ vigencia
→ revisión por cambio o periodicidad
→ nueva versión o ratificación
→ sustitución o retiro
→ conservación histórica
```

Reglas:

1. un borrador no gobierna operación;
2. revisión no equivale a aprobación;
3. publicación interna no amplía permisos;
4. una versión sustituida no se utiliza para nuevas decisiones, pero conserva historia;
5. una ratificación debe dejar evidencia de que la revisión ocurrió;
6. retirar una política no borra incidentes, ejercicios, decisiones o evidencia producidos bajo su vigencia;
7. un cambio de contacto puede seguir un control documental más ligero, pero nunca alterar silenciosamente autoridad, alcance o límites;
8. toda modificación que cambie quién decide, qué cubre, qué puede omitirse o qué riesgo se acepta es material.

---

#### 18. Ciclo de mantenimiento

El mantenimiento permanente seguirá esta secuencia lógica:

```text
DETECTAR CAMBIO O VENCIMIENTO
→ IDENTIFICAR ARTEFACTOS Y CAPACIDADES AFECTADAS
→ EVALUAR IMPACTO
→ CONSULTAR PROPIETARIOS Y FUNCIONES RESPONSABLES
→ DEFINIR SI EL CAMBIO ES ADMINISTRATIVO O MATERIAL
→ PREPARAR CORRECCIÓN O NUEVA VERSIÓN
→ REVISAR SEGREGACIÓN, AUTORIZACIÓN, DEPENDENCIAS Y EVIDENCIA
→ OBTENER APROBACIÓN CUANDO CORRESPONDA
→ PUBLICAR LA VERSIÓN VIGENTE
→ PROPAGAR EL CAMBIO A PLANES, RUNBOOKS, CONTACTOS Y CONTRATOS AFECTADOS
→ PROGRAMAR O EXIGIR REVALIDACIÓN CUANDO EL CAMBIO PUEDA ALTERAR READINESS
→ CONSERVAR HISTORIA Y CERRAR EL CAMBIO
```

No se fija una periodicidad universal en esta tarea. La cadencia deberá justificarse por riesgo, criticidad, cambio y evidencia; el programa de ejercicios y actualización periódica se materializa en `CONT-DOM-014` y `CONT-DOM-015`.

---

#### 19. Disparadores obligatorios de revisión

Una revisión deberá iniciarse cuando ocurra al menos uno de estos cambios materiales para el alcance afectado:

1. alta, retiro o cambio material de producto, servicio o proceso;
2. cambio de propietario de proceso o función de continuidad;
3. cambio de entidad, marca, sede, área, horario o temporada que altere exposición;
4. cambio en criticidad, nivel mínimo o prioridad de recuperación;
5. cambio en MTPD, RTO, RPO, MBCO, criterio de riesgo o supuesto material;
6. nueva dependencia o cambio material de dependencia técnica, operativa, física o de información;
7. cambio de proveedor, contrato, SLA, canal, infraestructura, servicio cloud, energía, red, pagos o transporte;
8. cambio de aplicación, arquitectura, migración, integración, esquema o fuente de verdad con impacto de recuperación;
9. cambio de estrategia de contingencia, runbook, mecanismo offline/manual, failover o recurso alternativo;
10. cambio de cobertura, ubicación, retención, seguridad o procedimiento de restauración de respaldo;
11. incidente real que revele una brecha de continuidad;
12. ejercicio, restauración o simulación que produzca hallazgo material;
13. falla de conciliación o reincorporación;
14. cambio de autorización, privacidad, retención, evidencia o control que afecte el procedimiento;
15. cambio relevante de dotación, disponibilidad, suplencia, conocimiento o contacto;
16. cambio de obligación legal, contractual, sanitaria, laboral, financiera o de seguridad aplicable;
17. evidencia de que una capacidad no cumple el objetivo o procedimiento aprobado;
18. vencimiento de la revisión periódica definida posteriormente por el programa de continuidad.

Un disparador puede afectar únicamente una capacidad o artefacto; no obliga a reescribir todo el sistema si el impacto está acotado y demostrado.

---

#### 20. Clasificación de cambios

Para mantenimiento documental se distinguen tres clases lógicas:

| Clase                                  | Ejemplos                                                                                                | Tratamiento                                                               |
| -------------------------------------- | ------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| actualización administrativa           | contacto, referencia, corrección tipográfica o metadata que no cambia autoridad, alcance ni significado | registrar cambio y evidencia; conservar trazabilidad                      |
| cambio material                        | principio, alcance, función, segregación, límite, obligación, decisión o condición de continuidad       | nueva versión aprobada por el gobierno aplicable                          |
| cambio derivado de incidente/ejercicio | ajuste exigido por evidencia real, restauración, simulación, conciliación o revisión posterior          | acción propietaria + actualización del artefacto + revalidación aplicable |

Una corrección administrativa no se utilizará para ocultar un cambio material.

---

#### 21. Excepciones y aceptación de riesgo

Una excepción a la política deberá conservar:

- objeto y alcance exactos;
- principio o control afectado;
- motivo;
- riesgo creado o aceptado;
- propietario del riesgo;
- controles compensatorios;
- vigencia y vencimiento;
- condiciones de revocación;
- autoridad que la aprueba;
- evidencia;
- plan de salida o regularización;
- referencia a las capacidades, planes o runbooks afectados.

Reglas:

1. una excepción no se convierte en política por repetición;
2. no se aprueba por el mismo actor únicamente para evitar su propio control crítico;
3. no elimina controles de vida, SST, inocuidad, privacidad, integridad, autorización o auditoría que no puedan ser dispensados por la autoridad aplicable;
4. una excepción vencida no se extiende por silencio;
5. el detalle de aceptación de riesgo, MTPD/RTO/RPO/MBCO y criterios cuantitativos pertenece a `CONT-DOM-004`;
6. un acceso de emergencia pertenece a `CONT-AUTH-002` y no se crea mediante una excepción narrativa.

---

#### 22. Propagación de cambios

Cuando una versión o decisión de continuidad cambie, el `RESPONSABLE_DE_CONTINUIDAD` deberá identificar los consumidores afectados, sin modificar sus fuentes por cuenta propia.

Posibles impactos:

- BIA y niveles mínimos;
- mapa de dependencias;
- objetivos de recuperación;
- taxonomía y activación;
- mando y suplencia;
- operación mínima;
- estrategias de contingencia;
- formularios y registros;
- reincorporación y conciliación;
- respaldos;
- runbooks;
- proveedores y alternativas;
- ejercicios;
- acciones de mejora;
- permisos y acceso de emergencia;
- experiencia y comunicaciones;
- contratos de integración;
- evidencia y auditoría.

Cada cambio se ejecuta en la tarea o proceso propietario del artefacto afectado. `CONT-DOM-001` no otorga al programa de continuidad permiso para editar todos los dominios.

---

#### 23. Relación con la organización y roles base

La política no crea un nuevo rol base global.

Se preserva que `VPROC-0062` admite como roles base aplicables:

- `propietario`;
- `gerente_general`;
- `gerente`;
- `supervisor`;
- `auxiliar_administrativa`;
- `contador`;
- `marketing`;
- `trabajador_operativo`.

Aplicabilidad no equivale a permiso. Un rol base puede participar como reportante, sujeto, coordinador, especialista o decisor únicamente cuando la capacidad exacta, alcance, finalidad y contexto lo autoricen.

Se preserva también que los roles operativos aplicables a `VPROC-0062` pueden ejecutar únicamente el procedimiento de contingencia aprobado para su sede y área. Ningún rol operativo declara por sí solo activación global, recuperación total o cierre.

---

#### 24. Integración con aplicaciones y dominios

`VPROC-0062` conserva una consumición transversal:

- VISO: expediente de continuidad, criticidad, plan, coordinación y cierre;
- SHELL: contexto de acceso y navegación sin propiedad del proceso;
- ANIMA: comunicación e instrucciones al trabajador cuando corresponda;
- NEXO: recuperación y conciliación de inventario, activos, logística y recursos físicos de su dominio;
- FOGO: recuperación y conciliación de producción, recetas, lotes y calidad de su dominio;
- ORIGO: recuperación y conciliación de compras, proveedores y recepciones de su dominio;
- PULSO: recuperación y conciliación de pedidos, ventas, pagos y operación comercial de su dominio;
- NUMERA: recuperación y conciliación de hechos económicos y análisis de su dominio;
- PASS: recuperación y conciliación de identidad/relación de cliente, fidelización y casos que le pertenezcan;
- AURA: participa únicamente dentro de su estado y alcance canónico vigente; esta política no materializa una capacidad operativa que su propia continuidad no haya habilitado.

La pertenencia al proceso transversal no crea permisos, criticidad automática ni obligación de mantener operación mínima.

---

#### 25. Relación con otros bloques

| Bloque / función | Responsabilidad conservada                                                                     | Límite frente a CONT-DOM-001                                 |
| ---------------- | ---------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| BLOQUE AC        | gobierno empresarial permanente de continuidad                                                 | coordina, no absorbe ownership de dominio                    |
| BLOQUE Z         | incidentes tecnológicos, infraestructura, dispositivos, redes, respaldo y recuperación técnica | disponibilidad técnica no certifica recuperación empresarial |
| BLOQUE AA        | documentos, privacidad, evidencia, retención, legal hold y cadena de custodia                  | continuidad no debilita protección de información            |
| BLOQUE AB        | métricas, diagnóstico, acciones y comprobación de resultados                                   | análisis no activa ni cierra continuidad                     |
| E4               | colas, reintentos, idempotencia, notificaciones, archivos y evidencia transversal              | infraestructura de entrega no decide prioridad empresarial   |
| E5               | contingencia temporal de cutover, piloto e hypercare                                           | no sustituye continuidad permanente                          |
| BLOQUE T         | release, compatibilidad y rollback                                                             | rollback de software no equivale a recuperación del proceso  |
| BLOQUE U         | pruebas integrales y certificación                                                             | plan documental no sustituye evidencia de ejercicio          |
| BLOQUE X         | integraciones y proveedores externos                                                           | integración no convierte proveedor en autoridad              |
| VISO             | superficie y expediente administrativo transversal                                             | UI o propiedad de registro no concede autoridad universal    |
| ANIMA            | comunicación/instrucción al trabajador                                                         | no gobierna mando empresarial                                |
| cada dominio     | resultado, datos y recuperación funcional propios                                              | debe respetar política común y conservar fuente de verdad    |

---

#### 26. Decisiones reservadas a tareas posteriores

| Decisión                                                                           | Propietario documental | Condición de salida                                                        |
| ---------------------------------------------------------------------------------- | ---------------------- | -------------------------------------------------------------------------- |
| servicios, procesos, sedes y niveles mínimos críticos                              | `CONT-DOM-002`         | antes de priorizar recuperación                                            |
| dependencias, recursos críticos, single points of failure y sustitutos             | `CONT-DOM-003`         | antes de aprobar estrategias                                               |
| MTPD, RTO, RPO, MBCO, prioridades y aceptación de riesgo                           | `CONT-DOM-004`         | antes de diseñar o contratar recuperación                                  |
| taxonomía, severidad, declaración, activación, escalamiento y cierre               | `CONT-DOM-005`         | antes de activar operación real                                            |
| mando específico, sustitución durante incidente, bitácora y comunicación de crisis | `CONT-DOM-006`         | antes del primer ejercicio de mando                                        |
| operación mínima viable por proceso                                                | `CONT-DOM-007`         | antes de habilitar modo degradado                                          |
| estrategia manual, offline, física o de proveedor por capacidad                    | `CONT-DOM-008`         | antes de usar una alternativa                                              |
| folios, evidencia y trabajo ejecutado durante la falla                             | `CONT-DOM-009`         | antes de capturar contingencia operativa                                   |
| reincorporación, idempotencia, conflicto y conciliación                            | `CONT-DOM-010`         | antes de volver trabajo contingente a fuentes propietarias                 |
| inventario y política de respaldos                                                 | `CONT-DOM-011`         | antes de certificar cobertura de respaldo                                  |
| runbooks, restauración, failover, retorno y validación funcional                   | `CONT-DOM-012`         | antes de ejecutar recuperación                                             |
| continuidad de proveedores y recursos alternativos                                 | `CONT-DOM-013`         | antes de aceptar dependencia crítica                                       |
| programa y alcance de ejercicios                                                   | `CONT-DOM-014`         | antes de declarar readiness probado                                        |
| revisión posterior, eficacia y actualización periódica operada                     | `CONT-DOM-015`         | después de incidentes/ejercicios y durante mantenimiento programado        |
| autoridad de activación, mando y decisiones excepcionales                          | `CONT-AUTH-001`        | antes de habilitar acciones protegidas de continuidad                      |
| break-glass, credenciales de recuperación, failover y revocación                   | `CONT-AUTH-002`        | antes de crear acceso excepcional                                          |
| protección de respaldos, runbooks, contactos y evidencia                           | `CONT-AUTH-003`        | antes de exponer información sensible de continuidad                       |
| separación entre ejecución, validación, conciliación, cierre y revisión            | `CONT-AUTH-004`        | antes de implementar el ciclo operacional                                  |
| inicio ejecutivo de continuidad                                                    | `CONT-UX-001`          | antes de implementar estado ejecutivo, impacto, prioridades y responsables |
| centro de mando del incidente                                                      | `CONT-UX-002`          | antes de implementar línea de tiempo, servicios afectados y recuperación   |
| runbooks y checklists por rol/proceso/sede                                         | `CONT-UX-003`          | antes de implementar experiencia guiada de ejecución                       |
| captura controlada y reincorporación                                               | `CONT-UX-004`          | antes de implementar captura de contingencia y retorno posterior           |
| seguimiento de respaldo, restauración y failover                                   | `CONT-UX-005`          | antes de implementar seguimiento visual de recuperación y pendientes       |
| comunicaciones internas y externas                                                 | `CONT-UX-006`          | antes de implementar plantillas, canales, confirmación y escalamiento      |
| ejercicios, revisión posterior y readiness                                         | `CONT-UX-007`          | antes de implementar experiencia de ejercicios y seguimiento de acciones   |
| criticidad, dependencia, salud, degradación e incidente con aplicaciones           | `CONT-INT-001`         | antes de integrar estados de continuidad entre aplicaciones                |
| contratos con SHELL, VISO, ANIMA, Z, AA, AB, E4, E5, T, U y X                      | `CONT-INT-002`         | antes de orquestar continuidad entre bloques transversales                 |
| contratos con nube, energía, ISP, pagos, mensajería, transporte y proveedores      | `CONT-INT-003`         | antes de integrar dependencias externas de continuidad                     |
| captura, replay, idempotencia, reincorporación, conciliación y retorno normal      | `CONT-INT-004`         | antes de materializar retorno productivo y replay de contingencia          |

No queda una decisión material de `CONT-DOM-001` diferida sin propietario documental y condición de salida.

---

#### 27. Estado del gobierno después de esta tarea

Quedan **ESPECIFICADOS** documentalmente:

- política marco;
- alcance general;
- propiedad federada;
- relación entre `VPROC-0003` y `VPROC-0062`;
- funciones permanentes de gobierno;
- regla de suplencia;
- derechos de decisión de política;
- segregación mínima;
- jerarquía documental;
- contrato de versión;
- ciclo de mantenimiento;
- disparadores de revisión;
- clasificación lógica de cambios;
- gobierno de excepciones;
- propagación de cambios;
- handoffs a todas las tareas propietarias.

Permanecen **PENDIENTE_DE_EVIDENCIA** o reservados a sus tareas propietarias, según corresponda:

- nombres de personas que ejercerán cada función;
- criticidad real por servicio/proceso/sede;
- objetivos cuantitativos de continuidad;
- alternativas reales disponibles;
- capacidad física y técnica de recuperación;
- restauraciones ejecutadas;
- ejercicios reales;
- tiempos medidos;
- readiness operacional.

La ausencia de esas evidencias no invalida el contrato documental de gobierno; impide declarar capacidad operativa o readiness antes de sus tareas y pruebas propietarias.

---

#### 28. Cobertura de los hallazgos heredados

`CONT-DOM-001` cierra documentalmente el hallazgo de ausencia de gobierno empresarial común al establecer política, propiedad, funciones, derechos de decisión y mantenimiento.

Respecto de responsables y suplencia:

- esta tarea establece qué funciones deben existir, cómo se asignan, cómo se versionan y cómo opera la suplencia sin transferir autoridad permanente;
- `CONT-DOM-006` materializará la matriz de mando y sustitución durante cada incidente;
- `CONT-AUTH-001` materializará la autoridad de declaración, activación, decisiones excepcionales y desactivación.

Los demás hallazgos de `CAP-SCOPE-018` conservan los propietarios exactos ya asignados en `CONT-DOM-002` a `CONT-DOM-015`, `CONT-AUTH-*`, `CONT-UX-*` y `CONT-INT-*`.

---

#### 29. Cobertura de requisitos de prueba vigente

La conducta definida por esta tarea ya está protegida por requisitos vigentes:

- `TREQ-CONT-001` asigna responsabilidad a `CONT-DOM-001` a `CONT-DOM-004` y exige que cada capacidad crítica tenga análisis de impacto y dependencias versionados, propietario, consumidores, personas, datos, aplicaciones, infraestructura, proveedores, nivel mínimo, objetivos y prioridad justificables;
- `TREQ-CONT-002` protege la separación y trazabilidad del incidente de continuidad, la autoridad y la bitácora de activación/cierre;
- `TREQ-CONT-006` protege revisión recurrente, ejercicios, acciones, eficacia y actualización de planes;
- `TREQ-INTEGRATION-023` protege la relación transversal entre procesos, aplicaciones, datos, infraestructura, proveedores, canales, estados, health signals, eventos, colas, mecanismos alternos y reconciliación;
- `TREQ-AUTH-015` protege evidencia correlacionable de decisiones y acciones protegidas;
- los requisitos de gobierno de políticas, autorización, información y auditoría ya vigentes continúan aplicando a versiones, responsabilidades, excepciones y evidencia.

La tarea especializa la política y el gobierno de continuidad dentro de esa cobertura. No introduce una nueva conducta ejecutable fuera del registro vigente.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el gobierno, propiedad, versionado, roles, mantenimiento, revisión y fronteras de continuidad se materializan dentro de comportamientos ya protegidos por el registro vigente de continuidad, integración, autorización y auditoría. La tarea no implementa activación, recuperación, contingencia, acceso de emergencia, respaldo, reincorporación ni una nueva acción ejecutable.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 30. Criterios de aceptación

1. la política define continuidad como capacidad empresarial y no como disponibilidad técnica aislada;
2. el gobierno transversal no adquiere propiedad de los procesos de dominio;
3. `VPROC-0062` permanece proceso canónico de continuidad;
4. VISO permanece aplicación propietaria del expediente transversal de `VPROC-0062`;
5. cada dominio conserva su fuente de verdad y valida su recuperación funcional;
6. `VPROC-0003` gobierna versiones, responsabilidades, delegaciones, límites, publicación y retiro de política;
7. la aprobación material de política conserva a `GOBIERNO_Y_PROPIEDAD` conforme a la matriz canónica;
8. la tarea no crea un rol base nuevo;
9. `RESPONSABLE_DE_CONTINUIDAD` queda definido como función de mantenimiento y coordinación, no como permiso universal;
10. `RESPONSABLE_DEL_PROCESO` conserva ownership del resultado empresarial;
11. `RESPONSABLE_TECNOLOGICO` no puede declarar recuperación empresarial por disponibilidad técnica;
12. `COORDINACION_DE_OPERACIONES` coordina sin adquirir ownership de dominio;
13. gerencia o supervisión de sede permanece limitada por alcance;
14. el equipo operativo solo ejecuta procedimientos autorizados para su contexto;
15. proveedor o prestador externo no aprueba recuperación empresarial;
16. automatización asistiva no activa, exceptúa, recupera o cierra por sí sola;
17. se preservan los ocho roles base aplicables a `VPROC-0062` sin convertir aplicabilidad en permiso;
18. los roles operativos de `VPROC-0062` conservan su límite de sede, área, turno, recurso y procedimiento;
19. una organización pequeña puede concentrar funciones sin perder la función ejercida ni la segregación exigible;
20. ninguna persona se autoasigna una autoridad crítica por ocupar temporalmente varias funciones;
21. suplencia se registra con alcance, vigencia, condición y autorización;
22. suplencia no transfiere permisos permanentemente;
23. una persona retirada o sin vínculo vigente no permanece como suplente operativo;
24. la política cubre dimensiones organizacionales, empresariales, personales, de datos, aplicaciones, tecnología, instalaciones, recursos, proveedores, comunicaciones y tiempo;
25. inclusión en alcance no equivale a criticidad;
26. criticidad y niveles mínimos permanecen en `CONT-DOM-002`;
27. dependencias y single points of failure permanecen en `CONT-DOM-003`;
28. MTPD, RTO, RPO y MBCO permanecen en `CONT-DOM-004`;
29. no se inventa RPO cero ni tiempo universal de recuperación;
30. activación y desactivación permanecen en `CONT-DOM-005` y autorización correspondiente;
31. mando específico de incidente permanece en `CONT-DOM-006`;
32. operación mínima permanece en `CONT-DOM-007`;
33. estrategias de contingencia permanecen en `CONT-DOM-008`;
34. folios y captura durante falla permanecen en `CONT-DOM-009`;
35. reincorporación y conciliación permanecen en `CONT-DOM-010`;
36. respaldos permanecen en `CONT-DOM-011`;
37. runbooks y failover permanecen en `CONT-DOM-012`;
38. alternativas de proveedores permanecen en `CONT-DOM-013`;
39. ejercicios permanecen en `CONT-DOM-014`;
40. revisión posterior y operación de actualización periódica permanecen en `CONT-DOM-015`;
41. el ciclo de mantenimiento documental queda definido de extremo a extremo;
42. se distinguen actualización administrativa, cambio material y cambio derivado de evidencia;
43. un cambio material produce una nueva versión aprobada;
44. una corrección administrativa no altera silenciosamente autoridad o alcance;
45. una versión sustituida conserva historia;
46. retirar una política no borra incidentes ni evidencia histórica;
47. existen disparadores explícitos de revisión por proceso, organización, dependencia, proveedor, tecnología, datos, personas, obligación, incidente y ejercicio;
48. no se fija una cadencia universal sin riesgo y evidencia;
49. una excepción conserva alcance, riesgo, compensaciones, vencimiento, autoridad y salida;
50. una excepción repetida no se convierte en política;
51. una excepción no crea break-glass;
52. cambios se propagan mediante sus propietarios y no mediante escritura transversal del programa de continuidad;
53. la jerarquía documental separa política, análisis, plan, runbook, expediente, conciliación y revisión;
54. el contrato mínimo de versión conserva identidad, vigencia, alcance, roles, aprobador, motivo y relación con la versión anterior;
55. plan revisado, plan probado y readiness certificado permanecen conceptos distintos;
56. servicio técnico disponible y proceso empresarial recuperado permanecen conceptos distintos;
57. contingencia permanente de BLOQUE AC y contingencia temporal E5 permanecen separadas;
58. rollback de BLOQUE T no se presenta como recuperación empresarial;
59. BLOQUE AA conserva privacidad, evidencia y retención durante continuidad;
60. BLOQUE AB conserva diagnóstico y mejora sin adquirir autoridad de activación;
61. E4 conserva colas e idempotencia sin decidir prioridad empresarial;
62. BLOQUE U conserva prueba y certificación de readiness;
63. no se materializa una capacidad AURA que su estado canónico no haya habilitado;
64. no se nombra una persona real sin evidencia organizacional;
65. no se modifica ninguna autorización ni permiso;
66. no se modifica ningún requisito de prueba;
67. no se activa contingencia ni acceso de emergencia;
68. no se ejecutan restauraciones, failover ni pruebas destructivas;
69. no se modifica respaldo, proveedor, código, DDL, DML, migración, RLS, RPC, dato ni Supabase;
70. cada decisión reservada tiene propietario documental exacto y condición de salida;
71. `CONT-DOM-002` permanece únicamente reservada.

---

#### 31. Balance de cierre

| Control                                                 |                          Resultado |
| ------------------------------------------------------- | ---------------------------------: |
| Subcapacidades CAP-18 heredadas                         |                        **12 / 12** |
| Tareas del BLOQUE AC reconocidas                        |                        **30 / 30** |
| Procesos canónicos usados para gobierno                 | **2** — `VPROC-0003`, `VPROC-0062` |
| Roles base aplicables preservados para VPROC-0062       |                          **8 / 8** |
| Funciones internas directamente heredadas de VPROC-0062 |                              **8** |
| Funciones de apoyo a gobierno de política               |                              **2** |
| Participantes externos/técnicos sin autoridad implícita |                       **3 clases** |
| Dimensiones de alcance materializadas                   |                             **11** |
| Principios de política                                  |                             **20** |
| Disparadores de revisión                                |                             **18** |
| Clases lógicas de cambio                                |                              **3** |
| Decisiones reservadas con propietario y salida          |                        **29 / 29** |
| Criterios de aceptación                                 |                             **71** |
| Cambios físicos                                         |                              **0** |
| Requisitos de prueba creados/modificados                |                              **0** |

---

#### 32. Límites de la tarea

Esta tarea no:

- selecciona servicios críticos;
- decide niveles mínimos por proceso;
- construye el BIA empresarial;
- fija MTPD, RTO, RPO o MBCO;
- fija severidades o umbrales de activación;
- activa o desactiva un incidente;
- nombra personas concretas como responsables;
- crea permisos o roles base;
- crea accesos de emergencia;
- aprueba una modalidad de contingencia por capacidad;
- crea formularios o folios operativos;
- crea un ledger físico de contingencia;
- define la lógica física de reincorporación;
- cambia respaldos;
- ejecuta restauraciones;
- ejecuta failover;
- selecciona proveedores alternativos;
- compra redundancia;
- agenda ejercicios reales;
- declara readiness;
- modifica datos, código, configuración, integraciones o Supabase.

---

#### 33. Continuidad

ÚLTIMA TAREA APROBADA
`DATA-INT-004 — Definir integración controlada con BI, hojas de cálculo, modelos analíticos e inteligencia artificial`

TAREA ACTUAL APROBADA
`CONT-DOM-001 — Definir política, alcance, gobierno, roles y ciclo de mantenimiento de continuidad`

SIGUIENTE TAREA RESERVADA
`CONT-DOM-002 — Definir análisis de impacto empresarial, servicios críticos, procesos, sedes y niveles mínimos`


### ✅ CONT-DOM-002 — Definir análisis de impacto empresarial, servicios críticos, procesos, sedes y niveles mínimos

**Estado:** APROBADA
**Tarea anterior:** `CONT-DOM-001 — Definir política, alcance, gobierno, roles y ciclo de mantenimiento de continuidad` — APROBADA
**Tarea siguiente:** `CONT-DOM-003 — Definir mapa de dependencias, recursos críticos, single points of failure y sustitutos` — RESERVADA
**Tipo de tarea:** documental; materialización del análisis de impacto empresarial base por resultado de proceso y contexto territorial, con criticidad BIA y nivel mínimo funcional cualitativo
**Bloque:** AC — Continuidad operativa y recuperación
**Fase:** exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`
**Implementación técnica u operativa:** no autorizada
**Código, DDL, DML, migraciones, RLS, RPC, datos, backfills, restauraciones, failover, interrupciones, activaciones de contingencia, compras, cambios de proveedor o cambios en Supabase:** no autorizados
**Procesos canónicos evaluados:** 69 de 69
**Sedes operativas canónicas evaluadas:** 5 de 5
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir y materializar la línea base del análisis de impacto empresarial de Vento Group para que cada resultado protegido por los procesos canónicos tenga una decisión explícita de continuidad antes de diseñar dependencias, objetivos de recuperación, procedimientos de contingencia o runbooks.

La tarea responde de forma determinista:

- qué unidad empresarial se somete al BIA;
- qué resultado o servicio protege cada proceso;
- qué aplicación conserva la propiedad funcional;
- qué contexto territorial debe evaluarse;
- qué clase de impacto hace que el resultado sea crítico, de control alto o diferible;
- cuál es el resultado mínimo funcional que debe preservarse durante una interrupción;
- qué sedes existen realmente y cuáles no pueden inventarse para completar el BIA;
- qué decisiones pertenecen expresamente a las tareas posteriores del bloque.

Esta tarea no asigna minutos, horas, porcentajes, volúmenes mínimos definitivos ni prioridades de recuperación. Tampoco aprueba una modalidad concreta de contingencia. Materializa la base empresarial necesaria para que esas decisiones posteriores se hagan sobre resultados reales y no sobre componentes técnicos aislados.

---

#### 2. Resultado sustantivo

Quedan materializados cuatro componentes coordinados:

1. un contrato BIA transversal aplicable a los 69 procesos canónicos;
2. una matriz de decisión BIA con una fila por `VPROC-0001` a `VPROC-0069`;
3. una matriz territorial con las cinco sedes operativas canónicas vigentes y sus fronteras;
4. reglas de enlace hacia dependencias, objetivos, operación mínima, contingencia, recuperación y ejercicios sin transferirles el resultado principal de esta tarea.

Balance:

| Control                                    |                                                                                                                      Resultado |
| ------------------------------------------ | -----------------------------------------------------------------------------------------------------------------------------: |
| Procesos esperados                         |                                                                                                                         **69** |
| Procesos materializados                    |                                                                                                                         **69** |
| Procesos faltantes                         |                                                                                                                          **0** |
| Procesos duplicados                        |                                                                                                                          **0** |
| Sedes operativas esperadas                 |                                                                                                                          **5** |
| Sedes operativas materializadas            |                                                                                                                          **5** |
| Sedes ficticias creadas                    |                                                                                                                          **0** |
| Propiedad por aplicación reconciliada      |                **`shell` 0; `anima` 1; `viso` 20; `nexo` 16; `fogo` 6; `origo` 4; `pulso` 12; `numera` 7; `aura` 2; `pass` 1** |
| Distribución de criticidad BIA             |                             **`CRITICA_PROTECCION` 12; `CRITICA_OPERACIONAL` 20; `ALTA_CONTROL` 31; `DIFERIBLE_CONTROLADA` 6** |
| Distribución de nivel mínimo               | **`PROTEGER_Y_DETENER` 12; `MANTENER_RESULTADO_ESENCIAL` 20; `MANTENER_CONTROL_Y_EVIDENCIA` 31; `DIFERIR_CON_TRAZABILIDAD` 6** |
| Objetivos MTPD/RTO/RPO/MBCO fijados        |                                                                                                                          **0** |
| Prioridades de recuperación fijadas        |                                                                                                                          **0** |
| Cambios físicos                            |                                                                                                                          **0** |
| Requisitos de prueba creados o modificados |                                                                                                                          **0** |

---

#### 3. Entradas canónicas consumidas

La tarea consume sin redefinir:

- `CONT-DOM-001` para política, gobierno, funciones, suplencia, ciclo de mantenimiento y fronteras de autoridad;
- `CAP-SCOPE-018` para el alcance de continuidad, campos mínimos del BIA, las doce subcapacidades `CAP-18` y los hallazgos asignados;
- `CAP-SCOPE-001` para la taxonomía organizacional, las cinco sedes operativas vigentes y la prohibición de convertir líneas de negocio, canales o puntos externos en sedes;
- `PROC-CAT-004` para los 69 propósitos empresariales canónicos;
- `PROC-CAT-005` para la aplicación propietaria única de cada proceso;
- `PROC-CAT-006` para consumidoras directas y condicionales mediante `PROC-APPLICATION-CONSUMER-REGISTRY-001`;
- las tareas posteriores `CONT-DOM-003`, `CONT-DOM-004`, `CONT-DOM-007`, `CONT-DOM-008`, `CONT-DOM-012`, `CONT-DOM-013`, `CONT-DOM-014` y `CONT-DOM-015` únicamente como propietarios de decisiones fuera del alcance actual;
- el registro canónico de requisitos vigente para comprobar cobertura de comportamiento y evitar duplicación de requisitos.

La aplicación propietaria no equivale al servicio empresarial, y el servicio empresarial no se redefine como una aplicación. Para este BIA la identidad estable del resultado es el `VPROC-*` y su propósito aprobado.

---

#### 4. Fronteras conceptuales obligatorias

```text
SERVICIO EMPRESARIAL BIA
=
RESULTADO EMPRESARIAL PROTEGIDO POR VPROC-*
```

No se crea un segundo catálogo de servicios con identidades competidoras.

```text
CRITICIDAD BIA ≠ SEVERIDAD DE INCIDENTE ≠ PRIORIDAD DE RECUPERACIÓN
```

```text
NIVEL MÍNIMO FUNCIONAL CUALITATIVO ≠ MBCO APROBADO ≠ VOLUMEN MÍNIMO NUMÉRICO
```

```text
SEDE OPERATIVA ≠ MARCA ≠ CANAL ≠ LÍNEA DE NEGOCIO ≠ PUNTO EXTERNO
```

```text
APLICACIÓN PROPIETARIA ≠ DEPENDENCIA TÉCNICA ≠ FUENTE DE RESPALDO
```

```text
SERVICIO TÉCNICAMENTE DISPONIBLE ≠ RESULTADO EMPRESARIAL RECUPERADO
```

```text
BIA ESPECIFICADO ≠ CONTINUIDAD VALIDADA ≠ READINESS
```

---

#### 5. Unidad canónica del BIA

La unidad mínima de análisis es:

```text
VPROC-*
+ resultado empresarial aprobado
+ aplicación propietaria
+ consumidoras por referencia canónica
+ contexto organizacional y territorial aplicable
+ criticidad BIA
+ nivel mínimo funcional cualitativo
+ clases de impacto
+ obligaciones y restricciones aplicables
+ estado de evidencia
+ versión y vigencia
```

Cuando un mismo proceso tenga comportamientos materialmente distintos por sede, horario, temporada, canal o población, la decisión se instancia por contexto sin crear un nuevo `VPROC-*`.

La matriz de esta tarea define la regla de alcance territorial por proceso. La instancia física posterior solo podrá usar una sede canónica vigente y deberá demostrar que la capacidad realmente existe en esa sede; compartir nombre, marca, dirección o aplicación no basta.

---

#### 6. Contrato mínimo del registro BIA

Cada registro BIA deberá conservar, cuando aplique:

| Campo                                       | Decisión                                                                                                                      |
| ------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| identidad                                   | `process_id` canónico `VPROC-*`; no se inventa un identificador paralelo de servicio                                          |
| resultado protegido                         | propósito empresarial vigente del proceso                                                                                     |
| propietario                                 | aplicación propietaria de `PROC-CAT-005` y propietario funcional del proceso cuando se materialice el registro operativo      |
| consumidores                                | referencia al conjunto vigente de `PROC-CAT-006`; no se copian listas locales divergentes                                     |
| organización                                | `ORGANIZATION_SCOPE` y sujeto/estructura aplicables sin fusionar conceptos                                                    |
| sede                                        | una de las cinco `OPERATIONAL_SITE` vigentes o ausencia territorial explícita                                                 |
| área / zona / estación                      | solo cuando el proceso dependa materialmente de esa subdivisión y exista identidad canónica                                   |
| horario / temporada                         | condición explícita cuando cambie el impacto; no se inventan ventanas universales                                             |
| criticidad BIA                              | una de las cuatro clases de esta tarea                                                                                        |
| nivel mínimo funcional                      | una de las cuatro decisiones cualitativas de esta tarea                                                                       |
| impacto                                     | clases materiales sobre personas, cliente, dinero, datos, custodia, cumplimiento, reputación u operación                      |
| obligaciones                                | obligación laboral, sanitaria, contractual, fiscal, legal o de privacidad cuando corresponda                                  |
| volumen normal y mínimo                     | se conserva como dimensión obligatoria, pero el valor cuantitativo se materializa en la tarea propietaria de operación mínima |
| dependencias                                | referencia a la materialización de `CONT-DOM-003`; esta tarea no inventa SPOF                                                 |
| pérdida tolerable / MTPD / RTO / RPO / MBCO | referencia a `CONT-DOM-004`; sin cifras en esta tarea                                                                         |
| estrategia alternativa                      | referencia a `CONT-DOM-008` y tareas de dominio; no se presume modo offline                                                   |
| ejercicio / readiness                       | referencia a `CONT-DOM-014`; ausencia de ejercicio no equivale a conformidad                                                  |
| vigencia                                    | versión, fecha efectiva, motivo y evidencia del cambio                                                                        |

---

#### 7. Clases de criticidad BIA

Las clases siguientes expresan **impacto empresarial potencial**, no orden de recuperación:

| Clase                  | Significado                                                                                                                                                                                                     |
| ---------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `CRITICA_PROTECCION`   | La interrupción o una continuación no controlada puede comprometer personas, inocuidad, seguridad, acceso, dinero, custodia o integridad de forma material; el mínimo seguro puede ser detener.                 |
| `CRITICA_OPERACIONAL`  | La interrupción corta directamente un resultado operativo esencial de venta, producción, abastecimiento, logística, dotación o soporte; se requiere conservar un resultado esencial limitado cuando sea seguro. |
| `ALTA_CONTROL`         | El proceso puede degradarse o pausarse temporalmente, pero deben mantenerse autoridad, evidencia, conciliación, vencimientos y estado pendiente para evitar pérdida material o incumplimiento.                  |
| `DIFERIBLE_CONTROLADA` | El resultado puede aplazarse durante una interrupción sin bloquear la operación esencial, siempre que queden propietario, contexto, vencimiento, evidencia y reanudación controlada.                            |

Reglas:

1. `CRITICA_PROTECCION` no significa que el proceso deba continuar; puede exigir `STOP_AND_PROTECT` en tareas posteriores.
2. `CRITICA_OPERACIONAL` no autoriza bypass de seguridad, calidad, autorización, conciliación o privacidad.
3. `ALTA_CONTROL` no equivale a baja importancia; impide que una pausa se convierta en pérdida de expediente o efecto huérfano.
4. `DIFERIBLE_CONTROLADA` no autoriza descartar trabajo, obligaciones o evidencia.
5. La prioridad de recuperación se decide posteriormente considerando dependencias, MTPD, RTO, RPO, capacidad, costo y aceptación de riesgo.

---

#### 8. Niveles mínimos funcionales cualitativos

| Nivel                          | Resultado que debe conservarse                                                                                                                         |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `PROTEGER_Y_DETENER`           | Poder impedir un efecto inseguro o no verificable, conservar el estado conocido, proteger personas/datos/dinero/custodia y registrar el pendiente.     |
| `MANTENER_RESULTADO_ESENCIAL`  | Poder completar solo el resultado empresarial indispensable y seguro, con alcance reducido, trazabilidad y pendientes explícitos.                      |
| `MANTENER_CONTROL_Y_EVIDENCIA` | Poder conservar autoridad, expediente, identificadores, estado, evidencia, vencimientos y conciliación aunque la ejecución principal se difiera.       |
| `DIFERIR_CON_TRAZABILIDAD`     | Poder suspender temporalmente el trabajo sin perder contexto, propietario, prioridad relativa, fecha relevante, evidencia ni condición de reanudación. |

Estos niveles no fijan volumen, duración o capacidad. La cantidad mínima por proceso, sede, horario, temporada y duración pertenece a `CONT-DOM-007`; el objetivo MBCO y su relación con MTPD/RTO/RPO pertenece a `CONT-DOM-004`.

---

#### 9. Perfil cualitativo de impacto por prolongación

Toda instancia BIA deberá poder evolucionar sin usar umbrales universales:

```text
INTERRUPCIÓN CONTROLADA
→ DEGRADACIÓN DEL RESULTADO
→ IMPACTO MATERIAL
→ IMPACTO INACEPTABLE
```

La duración que separa esos estados se decide por proceso y contexto en `CONT-DOM-004`. Esta tarea solo fija qué clases de daño deben observarse:

- personas, SST, inocuidad o seguridad;
- cliente, promesa de servicio, ingreso o reputación;
- inventario, activo, custodia, calidad o trazabilidad física;
- dinero, caja, obligación, fiscalidad o conciliación;
- datos, documentos, privacidad, retención o evidencia;
- capacidad laboral, turnos, acceso o continuidad de funciones;
- cumplimiento legal, contractual, sanitario o regulatorio;
- dependencia de proveedor o canal;
- decisión, gobierno, aprendizaje o riesgo residual.

Ausencia de evidencia suficiente obliga a conservar el estado como no demostrado; nunca autoriza reducir la criticidad por defecto.

---

#### 10. Inventario territorial canónico del BIA

|    # | Sede operativa canónica               | Clasificación y estructura relevante                                                                                | Decisión BIA territorial                                                                                                                            | Estado         |
| ---: | ------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
|    1 | `Oficina 1`                           | sede administrativa interna; relación física exacta y estado registral externo siguen bajo las puertas ya definidas | Se incluye como sede real para impacto administrativo y continuidad. Su dirección pública o condición registral no se usa como hecho verificado.    | `ESPECIFICADO` |
|    2 | `Vento Café`                          | sede comercial; Servicio / Salón, Cocina y Barra                                                                    | Se evalúan servicios comerciales, personas, SST, producto, inventario/activos, instalaciones y tecnología según capacidad real.                     | `ESPECIFICADO` |
|    3 | `Saudo`                               | sede comercial; Área Operativa Integral con estaciones de servicio, caja/mostrador, barra y cocina                  | Se evalúan servicios comerciales y operativos por capacidades reales sin fragmentar artificialmente la sede.                                        | `ESPECIFICADO` |
|    4 | `Molka`                               | sede comercial; Área Operativa Integral con servicio, caja/mostrador y barra; sin cocina productiva propia          | Se evalúan servicios comerciales y de barra; no se crea capacidad productiva de cocina por inferencia.                                              | `ESPECIFICADO` |
|    5 | `Centro de Producción y Distribución` | una sede productiva y logística; áreas productivas, Bodega y Abastecimiento y Servicios Generales                   | Se evalúan producción, calidad, inventario, abastecimiento, logística, instalaciones, personas y tecnología. Distribución no crea una segunda sede. | `ESPECIFICADO` |

**Reconciliación territorial:** 5 esperadas; 5 materializadas; 0 faltantes; 0 duplicadas.

No son sedes del BIA:

- `Vaila Vainilla`: marca / frente de negocio con canales y puntos externos pendientes de reconciliación;
- `Catering`: línea de negocio o servicio sin sede propia;
- apartamento asociado a Vaila, apartamento de resguardo vehicular y punto externo de decoraciones: `EXTERNAL_OPERATIONAL_POINT`, no `OPERATIONAL_SITE`;
- `Todos`, `General`, una zona, una estación, un canal o una aplicación.

Un proceso puede afectar Vaila, Catering, un canal o un punto externo sin convertirlos en sede. Esos contextos se conservan en el BIA como dimensión no territorial o punto externo controlado.

---

#### 11. Reglas de alcance territorial por proceso

1. **Empresa y todas las sedes:** procesos de gobierno, personas, información, tecnología, continuidad, riesgo y finanzas pueden tener impacto transversal aunque su ejecución administrativa sea centralizada.
2. **Sedes comerciales y canales:** ventas, servicio, cliente, pagos y oferta se instancian solo donde exista la modalidad comercial o canal aplicable.
3. **Sedes con capacidad productiva:** recetas y producción se instancian donde la capacidad productiva esté aprobada; la existencia de cocina, barra o un nombre de área no autoriza inferir por sí sola toda capacidad FOGO.
4. **Sedes con inventario o custodia:** movimientos, conteos, condición y abastecimiento interno requieren evidencia de existencia/custodia real.
5. **Sedes origen/destino logístico:** transporte se instancia por origen, destino, ruta y recurso; un proveedor o destino externo no se convierte en sede Vento.
6. **Sedes con activos:** el BIA de activos se instancia donde exista un activo o recurso que soporte un resultado empresarial.
7. **No territorial primario:** procesos de asesoría, autoridad, analítica o canales pueden no tener una sede primaria, pero deben relacionar cualquier sede afectada.
8. Una combinación proceso-sede sin evidencia de aplicabilidad queda `PENDIENTE_DE_EVIDENCIA` para esa instancia concreta; no se marca `NO_APLICA` por silencio y no altera la decisión BIA base del proceso.

---

#### 12. Familias de servicio empresarial para lectura BIA

Las familias siguientes son agrupaciones de lectura; **no crean nuevas identidades de servicio** y no sustituyen los `VPROC-*`:

- gobierno y estructura;
- personas y trabajo;
- SST, higiene y cumplimiento;
- producto, receta y oferta;
- compras y proveedores;
- inventario y abastecimiento interno;
- activos y movilidad;
- producción;
- ventas y caja;
- cliente y fidelización;
- logística y entregas;
- finanzas y obligaciones;
- instalaciones y tecnología;
- mercadeo y canales;
- información y evidencia;
- analítica y mejora;
- continuidad transversal;
- riesgo, cumplimiento y mejora.

Cada familia puede contener procesos con criticidad distinta; la agrupación no hereda una criticidad única.

---

#### 13. Matriz BIA materializada de los 69 procesos

La columna **alcance territorial BIA** define dónde debe instanciarse el análisis cuando exista evidencia de aplicabilidad. No concede capacidad, permiso, propiedad ni disponibilidad.

|    # | Proceso      | Resultado / proceso TO-BE                                                                                                                                                                                | Propietaria | Familia de servicio BIA             | Alcance territorial BIA                                                                                                 | Criticidad BIA         | Nivel mínimo funcional         | Impacto primario                                             | Estado BIA     |
| ---: | ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- | ----------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ---------------------- | ------------------------------ | ------------------------------------------------------------ | -------------- |
|    1 | `VPROC-0001` | Gobernar decisiónes empresariales con registro, alcance, responsable, compromisos y seguimiento                                                                                                          | `viso`      | Gobierno y estructura               | Empresa y las cinco sedes como alcance de impacto; no depende de una sede para existir                                  | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | gobierno, autoridad y compromisos                            | `ESPECIFICADO` |
|    2 | `VPROC-0002` | Mantener una estructura organizativa y jurídica coherente entre empresas, marcas, establecimientos, sedes y áreas                                                                                        | `viso`      | Gobierno y estructura               | Empresa y cinco sedes; estructura territorial canónica                                                                  | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | contexto territorial, autorización y trazabilidad            | `ESPECIFICADO` |
|    3 | `VPROC-0003` | Gobernar responsabilidades, políticas, delegaciones y límites de decisión mediante versiones vigentes                                                                                                    | `viso`      | Gobierno y estructura               | Empresa y cinco sedes como consumidoras de política vigente                                                             | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | gobierno, cumplimiento y autoridad                           | `ESPECIFICADO` |
|    4 | `VPROC-0004` | Coordinar compromisos y transferencias de trabajo entre negocios, sedes y áreas                                                                                                                          | `viso`      | Gobierno y estructura               | Empresa y cinco sedes según compromiso o transferencia                                                                  | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | continuidad de trabajo y coordinación                        | `ESPECIFICADO` |
|    5 | `VPROC-0005` | Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo                                                                                                       | `viso`      | Personas y trabajo                  | Empresa; demanda de personal puede originarse en cualquiera de las cinco sedes                                          | `DIFERIBLE_CONTROLADA` | `DIFERIR_CON_TRAZABILIDAD`     | capacidad laboral futura y cumplimiento                      | `ESPECIFICADO` |
|    6 | `VPROC-0006` | Orquestar vinculación, expediente, incorporación, preparación y habilitación inicial de la persona                                                                                                       | `viso`      | Personas y trabajo                  | Cinco sedes según asignación laboral; gobierno empresarial                                                              | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | habilitación laboral, seguridad y acceso                     | `ESPECIFICADO` |
|    7 | `VPROC-0007` | Administrar asignaciónes laborales y programación publicada con historial y revisión controlada                                                                                                          | `viso`      | Personas y trabajo                  | Cinco sedes según asignación y programación                                                                             | `CRITICA_OPERACIONAL`  | `MANTENER_RESULTADO_ESENCIAL`  | dotación, turnos y capacidad operativa                       | `ESPECIFICADO` |
|    8 | `VPROC-0008` | Capturar asistencia como hechos inmutables y corregirla mediante decisiónes auditables                                                                                                                   | `anima`     | Personas y trabajo                  | Cinco sedes con personal; contexto laboral vigente                                                                      | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | laboral, pagos y evidencia de tiempo                         | `ESPECIFICADO` |
|    9 | `VPROC-0009` | Gestionar novedades, ausencias, permisos y reemplazos como casos laborales completos                                                                                                                     | `viso`      | Personas y trabajo                  | Cinco sedes con personal y programación                                                                                 | `CRITICA_OPERACIONAL`  | `MANTENER_RESULTADO_ESENCIAL`  | cobertura laboral y continuidad de turno                     | `ESPECIFICADO` |
|   10 | `VPROC-0010` | Preparar y reconciliar el paquete autorizado para pagos y beneficios laborales                                                                                                                           | `numera`    | Finanzas y obligaciones             | Empresa; cinco sedes como origen de hechos laborales                                                                    | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | financiero, laboral y conciliación                           | `ESPECIFICADO` |
|   11 | `VPROC-0011` | Orquestar retiro laboral, devolución, revocación de accesos y cierre documental                                                                                                                          | `viso`      | Personas y trabajo                  | Cinco sedes según vínculo y recursos asignados                                                                          | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | seguridad, laboral, activos y evidencia                      | `ESPECIFICADO` |
|   12 | `VPROC-0012` | Gestionar riesgos, inspecciones, controles preventivos y acciones correctivas                                                                                                                            | `viso`      | SST, higiene y cumplimiento         | Cinco sedes y puntos controlados donde exista riesgo aplicable                                                          | `CRITICA_PROTECCION`   | `PROTEGER_Y_DETENER`           | vida, SST, inocuidad y cumplimiento                          | `ESPECIFICADO` |
|   13 | `VPROC-0013` | Gestionar incidentes, accidentes y emergencias con respuesta inmediata y expediente posterior                                                                                                            | `viso`      | SST, higiene y cumplimiento         | Cinco sedes y cualquier punto operativo afectado                                                                        | `CRITICA_PROTECCION`   | `PROTEGER_Y_DETENER`           | vida, seguridad y respuesta de emergencia                    | `ESPECIFICADO` |
|   14 | `VPROC-0014` | Ejecutar controles de higiene, inocuidad y cumplimiento mediante procedimientos versionados                                                                                                              | `viso`      | SST, higiene y cumplimiento         | Sedes y áreas donde el control sea aplicable; las cinco sedes permanecen evaluables                                     | `CRITICA_PROTECCION`   | `PROTEGER_Y_DETENER`           | inocuidad, salud y cumplimiento                              | `ESPECIFICADO` |
|   15 | `VPROC-0015` | Gobernar el ciclo de vida de productos, presentaciones, unidades y equivalencias                                                                                                                         | `nexo`      | Producto, receta y oferta           | Empresa; sedes consumidoras según catálogo y operación                                                                  | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | identidad de producto, unidades e integridad operativa       | `ESPECIFICADO` |
|   16 | `VPROC-0016` | Gestionar desarrollo, prueba, aprobación, publicación y versión de recetas                                                                                                                               | `fogo`      | Producto, receta y oferta           | Sedes con capacidad productiva aprobada; Centro de Producción y Distribución confirmado como productivo                 | `CRITICA_OPERACIONAL`  | `MANTENER_RESULTADO_ESENCIAL`  | producción reproducible, calidad y seguridad de producto     | `ESPECIFICADO` |
|   17 | `VPROC-0017` | Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales                                                                                                                  | `pulso`     | Producto, receta y oferta           | Vento Café, Saudo y Molka como sedes comerciales; canales y Catering como contexto no territorial cuando aplique        | `CRITICA_OPERACIONAL`  | `MANTENER_RESULTADO_ESENCIAL`  | venta, promesa al cliente y disponibilidad                   | `ESPECIFICADO` |
|   18 | `VPROC-0018` | Mantener especificaciones, alérgenos, restricciones y criterios de calidad del producto                                                                                                                  | `nexo`      | Producto, receta y oferta           | Sedes donde se almacene, produzca, prepare o venda producto; no se infiere por nombre de sede                           | `CRITICA_PROTECCION`   | `PROTEGER_Y_DETENER`           | inocuidad, alérgenos, calidad y cumplimiento                 | `ESPECIFICADO` |
|   19 | `VPROC-0019` | Capturar y priorizar necesidades de compra mediante una entrada única y trazable                                                                                                                         | `origo`     | Compras y proveedores               | Empresa y sedes solicitantes; aplicabilidad por necesidad real                                                          | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | abastecimiento futuro y control de demanda                   | `ESPECIFICADO` |
|   20 | `VPROC-0020` | Comparar proveedores y condiciónes con evidencia suficiente para decidir                                                                                                                                 | `origo`     | Compras y proveedores               | Empresa; sedes consumidoras según necesidad de abastecimiento                                                           | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | abastecimiento, costo y riesgo de proveedor                  | `ESPECIFICADO` |
|   21 | `VPROC-0021` | Aprobar y emitir compras separando flujo ordinario, urgencia y excepción                                                                                                                                 | `origo`     | Compras y proveedores               | Empresa y sedes solicitantes; no concede recepción física                                                               | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | compromiso comercial, abastecimiento y autorización          | `ESPECIFICADO` |
|   22 | `VPROC-0022` | Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica                                                                                       | `origo`     | Compras y proveedores               | Sedes receptoras de compras; aplicabilidad por recepción real                                                           | `CRITICA_PROTECCION`   | `PROTEGER_Y_DETENER`           | calidad de recepción, obligación financiera e inventario     | `ESPECIFICADO` |
|   23 | `VPROC-0023` | Gobernar sedes, LOC, zonas, posiciones y condiciónes de almacenamiento                                                                                                                                   | `nexo`      | Inventario y abastecimiento interno | Sedes con inventario o custodia; no se infiere existencia por sede                                                      | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | ubicación, custodia e integridad referencial                 | `ESPECIFICADO` |
|   24 | `VPROC-0024` | Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados                                                                                                                          | `nexo`      | Inventario y abastecimiento interno | Sedes con inventario o custodia y sus origenes/destinos autorizados                                                     | `CRITICA_OPERACIONAL`  | `MANTENER_RESULTADO_ESENCIAL`  | existencia, custodia y disponibilidad                        | `ESPECIFICADO` |
|   25 | `VPROC-0025` | Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino                                                                                                               | `nexo`      | Inventario y abastecimiento interno | Sedes con inventario o custodia y procesos consumidores                                                                 | `CRITICA_OPERACIONAL`  | `MANTENER_RESULTADO_ESENCIAL`  | inventario, consumo, traslado y trazabilidad                 | `ESPECIFICADO` |
|   26 | `VPROC-0026` | Contar como observación, investigar diferencias y ajustar mediante decisión separada                                                                                                                     | `nexo`      | Inventario y abastecimiento interno | Sedes con inventario sujeto a conteo                                                                                    | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | exactitud de inventario y conciliación                       | `ESPECIFICADO` |
|   27 | `VPROC-0027` | Gestionar condición, vencimiento, cuarentena, merma, pérdida, frío y disposición                                                                                                                         | `nexo`      | Inventario y abastecimiento interno | Sedes con existencias sujetas a condición, frío, vencimiento o disposición                                              | `CRITICA_PROTECCION`   | `PROTEGER_Y_DETENER`           | inocuidad, pérdida, custodia y calidad                       | `ESPECIFICADO` |
|   28 | `VPROC-0028` | Ejecutar abastecimiento interno de solicitud a recepción con cantidades conciliables por etapa                                                                                                           | `nexo`      | Inventario y abastecimiento interno | Sedes origen/destino de abastecimiento interno                                                                          | `CRITICA_OPERACIONAL`  | `MANTENER_RESULTADO_ESENCIAL`  | continuidad de inventario, producción y venta                | `ESPECIFICADO` |
|   29 | `VPROC-0029` | Gestionar identidad, ubicación, custodia, préstamo y transferencia de activos                                                                                                                            | `nexo`      | Activos y movilidad                 | Cinco sedes según activos y custodias existentes; puntos externos bajo contrato separado                                | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | custodia, disponibilidad y responsabilidad                   | `ESPECIFICADO` |
|   30 | `VPROC-0030` | Gestionar mantenimiento, reparación, garantía, repuesto y disposición de activos                                                                                                                         | `nexo`      | Activos y movilidad                 | Cinco sedes según activos que soporten procesos                                                                         | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | disponibilidad de activos y continuidad tecnica              | `ESPECIFICADO` |
|   31 | `VPROC-0031` | Gestionar disponibilidad de vehículos, combustible, kilometraje e incidencias                                                                                                                            | `nexo`      | Activos y movilidad                 | Sedes y puntos que requieran vehículo; origen/destino logístico según operación                                         | `CRITICA_OPERACIONAL`  | `MANTENER_RESULTADO_ESENCIAL`  | movilidad, entrega y seguridad operacional                   | `ESPECIFICADO` |
|   32 | `VPROC-0032` | Controlar entrega, tenencia, retorno, pérdida y completitud de reutilizables y contenedores                                                                                                              | `nexo`      | Activos y movilidad                 | Sedes y procesos que usen reutilizables o contenedores                                                                  | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | custodia, faltantes y capacidad operativa                    | `ESPECIFICADO` |
|   33 | `VPROC-0033` | Planear producción desde demanda, inventario, capacidad, prioridad y fecha requerida                                                                                                                     | `fogo`      | Producción                          | Sedes con capacidad productiva aprobada; Centro de Producción y Distribución confirmado                                 | `CRITICA_OPERACIONAL`  | `MANTENER_RESULTADO_ESENCIAL`  | abastecimiento, capacidad y cumplimiento productivo          | `ESPECIFICADO` |
|   34 | `VPROC-0034` | Preparar materiales y ejecutar producción contra una versión aprobada                                                                                                                                    | `fogo`      | Producción                          | Sedes con capacidad productiva aprobada                                                                                 | `CRITICA_OPERACIONAL`  | `MANTENER_RESULTADO_ESENCIAL`  | producción, consumo, lote y trazabilidad                     | `ESPECIFICADO` |
|   35 | `VPROC-0035` | Inspeccionar y decidir liberación, retención, rechazo o corrección de producto                                                                                                                           | `fogo`      | Producción                          | Sedes donde exista producción o liberación de producto                                                                  | `CRITICA_PROTECCION`   | `PROTEGER_Y_DETENER`           | calidad, inocuidad y liberación segura                       | `ESPECIFICADO` |
|   36 | `VPROC-0036` | Empacar, etiquetar y almacenar producto terminado con trazabilidad preservada                                                                                                                            | `fogo`      | Producción                          | Sedes con empaque o terminación productiva aprobada                                                                     | `CRITICA_OPERACIONAL`  | `MANTENER_RESULTADO_ESENCIAL`  | identidad de lote, empaque y disponibilidad                  | `ESPECIFICADO` |
|   37 | `VPROC-0037` | Gestionar reproceso, aprovechamiento, rendimiento, merma y cierre productivo                                                                                                                             | `fogo`      | Producción                          | Sedes con producción ejecutada                                                                                          | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | rendimiento, merma, costo e historia productiva              | `ESPECIFICADO` |
|   38 | `VPROC-0038` | Gestionar servicio en mesa de apertura a cierre con pedido, preparación, entrega, pago y conciliación                                                                                                    | `pulso`     | Ventas y caja                       | Sedes comerciales donde exista servicio en mesa; Vento Café y las capacidades reales de Saudo/Molka según configuracion | `CRITICA_OPERACIONAL`  | `MANTENER_RESULTADO_ESENCIAL`  | servicio al cliente, ingreso y pedido                        | `ESPECIFICADO` |
|   39 | `VPROC-0039` | Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados                                                                                                                           | `pulso`     | Ventas y caja                       | Vento Café, Saudo y Molka cuando la modalidad comercial aplique                                                         | `CRITICA_OPERACIONAL`  | `MANTENER_RESULTADO_ESENCIAL`  | venta, ingreso, entrega y cliente                            | `ESPECIFICADO` |
|   40 | `VPROC-0040` | Normalizar pedidos de canales externos y transferirlos al proceso interno con reconciliación                                                                                                             | `pulso`     | Ventas y caja                       | Canales externos y sedes comerciales receptoras; no crea una sede externa                                               | `CRITICA_OPERACIONAL`  | `MANTENER_RESULTADO_ESENCIAL`  | pedido, ingreso, canal y duplicidad                          | `ESPECIFICADO` |
|   41 | `VPROC-0041` | Gestionar cotización, aprobación, capacidad, producción, facturación y entrega de catering o venta B2B                                                                                                   | `pulso`     | Ventas y caja                       | Catering como linea de negocio sin sede propia; sedes de producción/entrega solo según capacidad real                   | `CRITICA_OPERACIONAL`  | `MANTENER_RESULTADO_ESENCIAL`  | compromiso comercial, capacidad, entrega y facturacion       | `ESPECIFICADO` |
|   42 | `VPROC-0042` | Gestionar modificación, sustitución, cancelación, anulación y devolución sin confundir sus efectos                                                                                                       | `pulso`     | Ventas y caja                       | Sedes y canales donde exista el compromiso comercial afectado                                                           | `CRITICA_OPERACIONAL`  | `MANTENER_RESULTADO_ESENCIAL`  | cliente, dinero, inventario y reversibilidad                 | `ESPECIFICADO` |
|   43 | `VPROC-0043` | Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable                                                                                                                             | `pulso`     | Ventas y caja                       | Sedes y canales con cobro autorizado                                                                                    | `CRITICA_PROTECCION`   | `PROTEGER_Y_DETENER`           | dinero, fiscal, duplicidad y cliente                         | `ESPECIFICADO` |
|   44 | `VPROC-0044` | Cerrar caja y conciliar ventas, pagos, efectivo, diferencias y responsables                                                                                                                              | `pulso`     | Ventas y caja                       | Sedes y cajas donde exista operación comercial                                                                          | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | financiero, efectivo, conciliación y responsabilidad         | `ESPECIFICADO` |
|   45 | `VPROC-0045` | Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados                                                                                                              | `pass`      | Cliente y fidelización              | Sedes y canales donde fidelización sea aplicable; identidad no pertenece a la sede                                      | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | cliente, saldo, consentimiento y privacidad                  | `ESPECIFICADO` |
|   46 | `VPROC-0046` | Gestionar reclamo, devolución, compensación y aprendizaje de causa                                                                                                                                       | `pulso`     | Cliente y fidelización              | Sedes y canales comerciales relacionados con el caso                                                                    | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | cliente, compensación, reputación y evidencia                | `ESPECIFICADO` |
|   47 | `VPROC-0047` | Gestionar reservas, eventos y comunicaciónes al cliente con capacidad y consentimiento                                                                                                                   | `pulso`     | Cliente y fidelización              | Sedes y canales con reservas/eventos; no se presume en todas                                                            | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | promesa, capacidad, cliente y consentimiento                 | `ESPECIFICADO` |
|   48 | `VPROC-0048` | Planear ruta, vehículo, carga, secuencia y restricciones antes del despacho                                                                                                                              | `nexo`      | Logística y entregas                | Sedes origen/destino logístico, especialmente Centro de Producción y Distribución cuando corresponda                    | `CRITICA_OPERACIONAL`  | `MANTENER_RESULTADO_ESENCIAL`  | despacho, custodia, capacidad y tiempo                       | `ESPECIFICADO` |
|   49 | `VPROC-0049` | Ejecutar ruta y confirmar entrega, rechazo, novedad o retorno con prueba suficiente                                                                                                                      | `nexo`      | Logística y entregas                | Sedes origen/destino y puntos autorizados de entrega                                                                    | `CRITICA_OPERACIONAL`  | `MANTENER_RESULTADO_ESENCIAL`  | custodia, entrega, rechazo y evidencia                       | `ESPECIFICADO` |
|   50 | `VPROC-0050` | Integrar entrega de tercero con seguimiento, prueba y conciliación interna                                                                                                                               | `pulso`     | Logística y entregas                | Canales/terceros y sedes comerciales vinculadas al pedido; tercero no es sede                                           | `CRITICA_OPERACIONAL`  | `MANTENER_RESULTADO_ESENCIAL`  | promesa al cliente, entrega, conciliación y tercero          | `ESPECIFICADO` |
|   51 | `VPROC-0051` | Registrar hechos económicos desde eventos operativos y soportes correlacionados                                                                                                                          | `numera`    | Finanzas y obligaciones             | Empresa; las cinco sedes pueden originar hechos económicos                                                              | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | financiero, trazabilidad y conciliación                      | `ESPECIFICADO` |
|   52 | `VPROC-0052` | Gestionar obligación, aprobación y pago a proveedor con conciliación bancaria                                                                                                                            | `numera`    | Finanzas y obligaciones             | Empresa; obligaciones originadas por sedes/procesos                                                                     | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | financiero, proveedor, vencimiento y conciliación            | `ESPECIFICADO` |
|   53 | `VPROC-0053` | Gestionar cartera, cobro, recaudo, aplicación y diferencia                                                                                                                                               | `numera`    | Finanzas y obligaciones             | Empresa; cartera vinculada a ventas, clientes o sedes de origen                                                         | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | caja, cartera, saldo y conciliación                          | `ESPECIFICADO` |
|   54 | `VPROC-0054` | Gestionar costos, distribución, presupuesto, cierre y rentabilidad con reglas versionadas                                                                                                                | `numera`    | Finanzas y obligaciones             | Empresa y cinco sedes como dimensiones económicas cuando aplique                                                        | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | costo, cierre, rentabilidad y decisión                       | `ESPECIFICADO` |
|   55 | `VPROC-0055` | Gestionar limpieza, inspección, mantenimiento, plagas, servicios y cierre de novedades de instalaciones                                                                                                  | `nexo`      | Instalaciones y tecnología          | Las cinco sedes operativas y sus instalaciones; puntos externos solo con contrato aplicable                             | `CRITICA_PROTECCION`   | `PROTEGER_Y_DETENER`           | seguridad física, inocuidad, habitabilidad y operación       | `ESPECIFICADO` |
|   56 | `VPROC-0056` | Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro                                                                                                                | `aura`      | Mercadeo y canales                  | No territorial primario; afecta marcas, canales y sedes publicadas; AURA permanece diferida                             | `DIFERIBLE_CONTROLADA` | `DIFERIR_CON_TRAZABILIDAD`     | reputación, vigencia comercial y comunicación                | `ESPECIFICADO` |
|   57 | `VPROC-0057` | Convertir consultas y oportunidades de canales digitales en casos comerciales trazables                                                                                                                  | `aura`      | Mercadeo y canales                  | No territorial primario; canales digitales y frentes comerciales; AURA permanece diferida                               | `DIFERIBLE_CONTROLADA` | `DIFERIR_CON_TRAZABILIDAD`     | oportunidad comercial, atención y trazabilidad               | `ESPECIFICADO` |
|   58 | `VPROC-0058` | Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento                                                                                                    | `viso`      | Instalaciones y tecnología          | Las cinco sedes, aplicaciónes y servicios tecnologicos afectados                                                        | `CRITICA_OPERACIONAL`  | `MANTENER_RESULTADO_ESENCIAL`  | tecnología, disponibilidad y soporte de procesos             | `ESPECIFICADO` |
|   59 | `VPROC-0059` | Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación                                                                                                                 | `viso`      | Instalaciones y tecnología          | Empresa y cinco sedes según identidad, dispositivo, aplicación y contexto                                               | `CRITICA_PROTECCION`   | `PROTEGER_Y_DETENER`           | seguridad, acceso, privacidad y continuidad                  | `ESPECIFICADO` |
|   60 | `VPROC-0060` | Gestionar documentos y evidencia desde creación hasta disposición con metadatos y custodia                                                                                                               | `viso`      | Informacion y evidencia             | Empresa y cinco sedes como productoras/consumidoras de evidencia                                                        | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | evidencia, privacidad, retención y cumplimiento              | `ESPECIFICADO` |
|   61 | `VPROC-0061` | Gestionar medición, análisis, decisión de mejora y verificación de resultado                                                                                                                             | `numera`    | Analítica y mejora                  | Empresa y cinco sedes como fuentes o dimensiones de análisis                                                            | `DIFERIBLE_CONTROLADA` | `DIFERIR_CON_TRAZABILIDAD`     | decisión, aprendizaje y calidad analitica                    | `ESPECIFICADO` |
|   62 | `VPROC-0062` | Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje                                                                                                 | `viso`      | Continuidad transversal             | Empresa, las cinco sedes y procesos/servicios afectados                                                                 | `CRITICA_PROTECCION`   | `PROTEGER_Y_DETENER`           | continuidad integral, seguridad, coordinación y recuperación | `ESPECIFICADO` |
|   63 | `VPROC-0063` | `CAP-01.07` — Gestionar riesgos empresariales: Gestionar riesgos estratégicos, financieros, operativos, legales y tecnológicos como registro versionado de riesgo, tratamiento y seguimiento.            | `viso`      | Riesgo, cumplimiento y mejora       | Empresa y cinco sedes según exposición                                                                                  | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | riesgo, decisión, cumplimiento y exposición residual         | `ESPECIFICADO` |
|   64 | `VPROC-0064` | `CAP-01.09` — Gestionar relaciónes con asesores y autoridades: Gobernar requerimientos, conceptos, entregables, vencimientos, comunicaciónes y evidencia sin delegar la propiedad interna del resultado. | `viso`      | Riesgo, cumplimiento y mejora       | No territorial primario; obligaciones pueden afectar empresa o sedes concretas                                          | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | legal, regulatorio, contractual y vencimientos               | `ESPECIFICADO` |
|   65 | `VPROC-0065` | `CAP-02.10` — Acompañar desempeño y desarrollo: Mantener un proceso diferido y sensible de objetivos, retroalimentación y decisiónes, con uso explícito y privacidad aprobada.                           | `viso`      | Personas y trabajo                  | Cinco sedes con personal; identidad y finalidad laboral gobiernan                                                       | `DIFERIBLE_CONTROLADA` | `DIFERIR_CON_TRAZABILIDAD`     | personas, privacidad y desarrollo                            | `ESPECIFICADO` |
|   66 | `VPROC-0066` | `CAP-03.03` — Entregar y controlar elementos de protección: Gestionar requisito, entrega, aceptación, vigencia, cambio, devolución y evidencia de elementos de protección.                               | `viso`      | SST, higiene y cumplimiento         | Sedes con personal y riesgo que exija EPP; no se presume la misma necesidad en todas                                    | `CRITICA_PROTECCION`   | `PROTEGER_Y_DETENER`           | vida, SST, cumplimiento y custodia de EPP                    | `ESPECIFICADO` |
|   67 | `VPROC-0067` | `CAP-07.11` — Gestionar kits y conjuntos: Definir kit, instancia, componentes obligatorios y opcionales, completitud, préstamo, devolución y sustitución sin confundir kit, activo, LPN o contenedor.    | `nexo`      | Activos y movilidad                 | Sedes y procesos donde existan kits o conjuntos; aplicabilidad por recurso real                                         | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | custodia, completitud y capacidad operativa                  | `ESPECIFICADO` |
|   68 | `VPROC-0068` | `CAP-10.06` — Medir satisfacción: Separar medición, incentivo, reclamo y compensación; conservar muestra, canal, consentimiento, respuesta y sesgo conocido.                                             | `pulso`     | Cliente y fidelización              | Sedes y canales comerciales donde se mida experiencia                                                                   | `DIFERIBLE_CONTROLADA` | `DIFERIR_CON_TRAZABILIDAD`     | cliente, privacidad, reputación y decisión                   | `ESPECIFICADO` |
|   69 | `VPROC-0069` | `CAP-12.11` — Gestionar presupuestos: Gestionar versión presupuestal, supuestos, aprobación, vigencia, consumo, proyección y desviación sin convertir el presupuesto en hecho contable.                  | `numera`    | Finanzas y obligaciones             | Empresa y cinco sedes como dimensiones presupuestales cuando aplique                                                    | `ALTA_CONTROL`         | `MANTENER_CONTROL_Y_EVIDENCIA` | financiero, planeación, control y desviacion                 | `ESPECIFICADO` |

---

#### 14. Reconciliación de propiedad y cobertura

La matriz conserva sin cambios la propiedad funcional aprobada en `PROC-CAT-005`:

```text
{{OWNER_COUNTS}}
TOTAL 69
```

Reconciliación:

- 69 procesos esperados;
- 69 procesos materializados;
- 69 identificadores únicos;
- 0 faltantes;
- 0 duplicados;
- 0 procesos con propietaria múltiple;
- 0 procesos asignados a `shell`;
- 2 procesos con propietaria `aura` mantienen la condición de aplicación diferida;
- ninguna propietaria externa;
- consumidoras no se redefinen: se resuelven por `PROC-APPLICATION-CONSUMER-REGISTRY-001`.

La criticidad resultante es:

```text
{{CRIT_COUNTS}}
```

El nivel mínimo funcional resultante es:

```text
{{MIN_COUNTS}}
```

Estas distribuciones son una decisión de esta tarea y no constituyen una prioridad de recuperación.

---

#### 15. Portafolio BIA por sede

| Sede                                  | Servicios que deben evaluarse directamente                                                                                                                                              | Resultado mínimo transversal                                                                                                       | Frontera                                                                                                                                    |
| ------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `Oficina 1`                           | gobierno, administración de personas, obligaciones/finanzas, documentos/evidencia, tecnología, continuidad y riesgos; además cualquier proceso cuya ejecución real dependa de esta sede | conservar mando, identidad, evidencia, vencimientos, acceso seguro y capacidad de coordinar pendientes                             | su relación física/registral pendiente no impide tratarla como sede interna activa, pero impide inventar dirección pública o estado externo |
| `Vento Café`                          | servicio/venta, oferta, personas, SST/higiene, producto, inventario/activos, instalaciones, tecnología y cualquier producción realmente habilitada                                      | mantener solo servicio esencial seguro o proteger/detener; conservar pedido, dinero, inventario y pendientes trazables             | Cocina y Barra no prueban por sí solas que toda capacidad productiva FOGO esté activa                                                       |
| `Saudo`                               | servicio/venta, personas, SST/higiene, producto, inventario/activos, instalaciones, tecnología y capacidades productivas realmente habilitadas                                          | mantener servicio esencial seguro con trazabilidad o proteger/detener                                                              | el Área Operativa Integral no se divide en sedes o áreas ficticias para el BIA                                                              |
| `Molka`                               | servicio/venta, personas, SST/higiene, producto, inventario/activos, instalaciones y tecnología                                                                                         | mantener servicio esencial seguro con trazabilidad o proteger/detener                                                              | no se crea una cocina productiva propia; cualquier producción distinta de barra exige evidencia/capacidad aprobada                          |
| `Centro de Producción y Distribución` | producción, calidad, inventario, abastecimiento interno, activos, logística, personas, SST/higiene, instalaciones y tecnología                                                          | preservar seguridad/inocuidad/custodia y mantener solo producción o logística esencial que pueda ejecutarse con controles vigentes | es una sola sede; distribución es capacidad/proceso y no una segunda sede                                                                   |

El portafolio no afirma que todos los procesos listados estén activos permanentemente en cada sede. Determina qué familias deben comprobar aplicabilidad y criticidad cuando el BIA operativo se instancie.

---

#### 16. Tratamiento de marcas, líneas, canales y puntos externos

##### 16.1. Vaila Vainilla

Vaila se conserva como marca / frente de negocio con canales y puntos externos pendientes de reconciliación. El BIA puede registrar impacto sobre Vaila, pero:

- no la cuenta como sexta sede;
- no asigna un RTO/RPO propio en esta tarea;
- no convierte apartamentos o puntos de custodia en sedes;
- no resuelve aquí emisores de factura, inventario o recaudo pendientes de sus tareas propietarias.

##### 16.2. Catering

Catering es línea de negocio o servicio sin sede propia. El BIA de `VPROC-0041` relacionará las sedes que realmente produzcan, preparen, despachen o administren el compromiso, sin crear una sede denominada Catering.

##### 16.3. Canales y proveedores

Rappi, ManyChat, web, WhatsApp, POS externo, bancos, transportistas y otros terceros pueden ser dependencias o canales. No son sedes ni propietarios internos. Su criticidad y sustitutos se detallarán en las tareas de dependencias y continuidad de proveedores.

---

#### 17. Reglas de impacto por sede, horario y temporada

1. La criticidad base de la matriz no sustituye la instancia por sede.
2. Si un proceso solo existe en una sede o capacidad concreta, una interrupción de esa sede puede elevar el impacto local sin cambiar la identidad del proceso.
3. Un horario cerrado no convierte el proceso en `NO_APLICA`; puede reducir temporalmente el impacto inmediato, pero conserva obligaciones, pendientes y preparación para la siguiente apertura.
4. Temporadas, eventos, campañas o picos pueden modificar el impacto y volumen; esos cambios requieren evidencia y vigencia.
5. El mismo proceso puede tener niveles de volumen diferentes por sede sin recibir otro `VPROC-*`.
6. Una sede que no ejecuta un proceso puede seguir siendo consumidora o afectada por su resultado.
7. El BIA no usa número de trabajadores, ventas, pedidos o inventario supuesto; esos valores deberán provenir de evidencia vigente.
8. La ausencia de datos cuantitativos no autoriza declarar una capacidad no crítica; se conserva la clase base hasta completar evidencia.

---

#### 18. Handoffs obligatorios y condiciones de salida

| Decisión fuera del alcance actual                                                                                                | Propietario documental            | Condición de salida                                                                                    |
| -------------------------------------------------------------------------------------------------------------------------------- | --------------------------------- | ------------------------------------------------------------------------------------------------------ |
| mapa de personas, datos, aplicaciones, dispositivos, instalaciones, proveedores, energía, red y demás dependencias por resultado | `CONT-DOM-003`                    | cada resultado BIA enlazado a dependencias y SPOF reales sin inferir criticidad técnica por existencia |
| MTPD, RTO, RPO, MBCO, prioridad de recuperación y aceptación de riesgo                                                           | `CONT-DOM-004`                    | objetivos empresariales aprobados por contexto, compatibles con capacidad, costo y evidencia           |
| taxonomía/severidad y criterios de activación/desactivación de incidentes                                                        | `CONT-DOM-005`                    | incidente de continuidad separado de la criticidad BIA del proceso                                     |
| mando, sustitución y comunicación de crisis                                                                                      | `CONT-DOM-006`                    | roles de incidente y suplencia materializados sin alterar propietarios de proceso                      |
| volumen y operación mínima exactos por proceso, sede, horario, temporada y duración                                              | `CONT-DOM-007`                    | procedimiento mínimo cuantificado y ejecutable sin perder controles obligatorios                       |
| modalidad concreta de contingencia y recursos alternativos                                                                       | `CONT-DOM-008`                    | alternativa aprobada por capacidad y contexto, con límites y abandono definidos                        |
| captura/folios/evidencia durante falla                                                                                           | `CONT-DOM-009`                    | medio controlado con identidad, custodia y estado pendiente                                            |
| reincorporación, conflictos y conciliación                                                                                       | `CONT-DOM-010`                    | retorno idempotente y pendientes conciliables por dominio                                              |
| respaldo y cobertura de recuperación                                                                                             | `CONT-DOM-011`                    | inventario de fuentes respaldadas y política verificable                                               |
| runbooks, orden técnico/funcional, restauración y retorno                                                                        | `CONT-DOM-012`                    | recuperación de componentes vinculada a validación del resultado empresarial                           |
| proveedores, energía, ISP, pagos, transporte y canales alternativos                                                              | `CONT-DOM-013`                    | dependencia externa con alternativa, contacto, compromiso y evidencia                                  |
| ejercicios y tiempos observados                                                                                                  | `CONT-DOM-014`                    | BIA y objetivos probados en escenarios controlados con evidencia                                       |
| actualización posterior por incidentes, ejercicios o cambios                                                                     | `CONT-DOM-015`                    | versión BIA revisada y acciones con eficacia comprobada                                                |
| autoridad sobre activación, emergencia y recuperación                                                                            | `CONT-AUTH-001` a `CONT-AUTH-004` | autorización y segregación materializadas antes de operación real                                      |
| contratos de criticidad/estado entre aplicaciones                                                                                | `CONT-INT-001` a `CONT-INT-004`   | integración versionada sin duplicar fuentes de verdad ni efectos                                       |

No queda una decisión material identificada por esta tarea sin propietario documental y condición de salida.

---

#### 19. Reglas de versionado y mantenimiento del BIA

Una revisión BIA será obligatoria cuando ocurra alguno de estos cambios materiales:

1. propósito o frontera de un `VPROC-*`;
2. aplicación propietaria o consumidoras materiales;
3. alta, cierre, reemplazo o cambio material de una sede;
4. nueva capacidad operativa por sede o retiro de una existente;
5. cambio de área, zona o estación que altere una dependencia crítica;
6. cambio material de horario, temporada o volumen;
7. cambio de obligación legal, sanitaria, laboral, contractual, fiscal o de privacidad;
8. incorporación o retiro de un proveedor/canal cuya falla afecte el resultado;
9. cambio de arquitectura, plataforma, dispositivo o dato que modifique la dependencia empresarial;
10. incidente real que demuestre un impacto distinto del supuesto;
11. ejercicio que invalide una hipótesis del BIA;
12. cambio de nivel mínimo, MTPD, RTO, RPO, MBCO o aceptación de riesgo aprobado por su tarea propietaria.

La nueva versión conserva la anterior, fecha efectiva, razón, actor, aprobador y evidencia. Una corrección no reescribe silenciosamente el análisis usado para una decisión o ejercicio previo.

---

#### 20. Cobertura de requisitos de prueba vigente

El comportamiento definido aquí ya está protegido por el requisito vigente que exige un BIA y mapa de dependencia versionados por capacidad crítica, con producto/servicio, proceso, sede, horario, propietario, consumidores, personas, datos, aplicaciones, dispositivos, instalaciones, proveedores, recursos, nivel mínimo, impacto y objetivos de continuidad cuando apliquen. Ese requisito asigna expresamente responsabilidad a `CONT-DOM-001` a `CONT-DOM-004`.

La integración transversal vigente también protege que procesos, aplicaciones, datos, infraestructura, proveedores y canales permanezcan relacionados mediante estados versionados, señales, mecanismos alternos y reconciliación, sin activaciones contradictorias ni efectos duplicados.

La presente tarea materializa la parte empresarial y territorial de esas reglas; no introduce un comportamiento ejecutable adicional ni cambia su estado, prioridad, destino de implementación o relación.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el análisis de impacto, la criticidad por resultado/proceso/sede y el nivel mínimo funcional cualitativo materializados en esta tarea son especializaciones documentales de obligaciones ya existentes en el registro canónico. No se incorpora una regla ejecutable nueva, no se altera un requisito vigente y no se realiza implementación.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 21. Criterios de aceptación documental

1. existe una única unidad BIA basada en `VPROC-*` y no un catálogo paralelo de servicios;
2. los 69 procesos canónicos aparecen exactamente una vez;
3. no existen identificadores `VPROC-*` faltantes;
4. no existen identificadores `VPROC-*` duplicados;
5. cada proceso conserva su aplicación propietaria aprobada;
6. la distribución de propiedad suma exactamente 69;
7. `shell` conserva cero procesos propietarios;
8. `aura` conserva dos procesos y su condición de aplicación diferida;
9. cada proceso tiene una familia de lectura BIA;
10. cada proceso tiene una regla explícita de alcance territorial;
11. cada proceso tiene una clase de criticidad BIA;
12. cada proceso tiene un nivel mínimo funcional cualitativo;
13. cada proceso tiene una clase principal de impacto;
14. las cuatro clases de criticidad están definidas sin usarlas como severidad de incidente;
15. los cuatro niveles mínimos están definidos sin convertirlos en MBCO cuantitativo;
16. ningún proceso recibe MTPD numérico;
17. ningún proceso recibe RTO numérico;
18. ningún proceso recibe RPO numérico;
19. ningún proceso recibe MBCO cuantitativo;
20. no se fija una prioridad de recuperación;
21. las cinco sedes operativas canónicas aparecen exactamente una vez en el inventario territorial;
22. `Oficina 1` se conserva como sede administrativa interna activa;
23. el estado registral/dirección pública pendiente de `Oficina 1` no se presenta como verificado;
24. Vento Café conserva Servicio/Salón, Cocina y Barra;
25. Saudo conserva una única Área Operativa Integral;
26. Molka conserva una única Área Operativa Integral;
27. no se crea cocina productiva propia para Molka;
28. Centro de Producción y Distribución se mantiene como una sola sede;
29. distribución no se convierte en una segunda sede;
30. Vaila Vainilla no se cuenta como sede;
31. Catering no se cuenta como sede;
32. los tres puntos externos citados no se convierten en sedes;
33. `Todos` o `General` no se usa como unidad territorial BIA;
34. una marca no se usa como sede;
35. un canal no se usa como sede;
36. una aplicación no se usa como sede;
37. las capacidades productivas no se infieren únicamente por nombre de cocina/barra;
38. el inventario no se presume existente en una sede por ser operativa;
39. cada combinación proceso-sede requiere evidencia de aplicabilidad cuando no sea transversal;
40. una combinación sin evidencia queda pendiente de evidencia y no `NO_APLICA` por silencio;
41. las consumidoras se referencian desde el registro canónico vigente y no se duplican localmente;
42. aplicación propietaria no se confunde con dependencia técnica;
43. criticidad BIA no se confunde con prioridad de recuperación;
44. criticidad BIA no se confunde con severidad de incidente;
45. nivel mínimo funcional no se confunde con volumen mínimo cuantitativo;
46. nivel mínimo funcional no autoriza bypass de seguridad o autorización;
47. `CRITICA_PROTECCION` permite detener para proteger integridad;
48. `CRITICA_OPERACIONAL` exige resultado esencial solo cuando sea seguro;
49. `ALTA_CONTROL` exige preservar expediente, autoridad y conciliación;
50. `DIFERIBLE_CONTROLADA` exige trazabilidad de reanudación;
51. el impacto por prolongación se modela sin ventanas universales;
52. horarios y temporadas pueden cambiar la instancia BIA sin cambiar el `VPROC-*`;
53. cambios de volumen no crean un proceso nuevo;
54. cada decisión diferida tiene tarea propietaria y condición de salida;
55. dependencias y SPOF quedan exclusivamente en `CONT-DOM-003`;
56. MTPD/RTO/RPO/MBCO y prioridad quedan exclusivamente en `CONT-DOM-004`;
57. la operación mínima cuantificada queda en `CONT-DOM-007`;
58. estrategias concretas de contingencia quedan en `CONT-DOM-008`;
59. captura durante falla queda en `CONT-DOM-009`;
60. reincorporación y conciliación quedan en `CONT-DOM-010`;
61. respaldos quedan en `CONT-DOM-011`;
62. runbooks y restauración quedan en `CONT-DOM-012`;
63. continuidad de proveedores queda en `CONT-DOM-013`;
64. ejercicios y evidencia temporal quedan en `CONT-DOM-014`;
65. mantenimiento posterior queda en `CONT-DOM-015`;
66. autoridad de emergencia queda en `CONT-AUTH-*`;
67. contratos físicos de integración quedan en `CONT-INT-*`;
68. no se crea ni modifica ningún requisito de prueba;
69. no se modifica código, DDL, DML, RLS, RPC, datos, migraciones, respaldos, proveedores o Supabase;
70. no se ejecuta interrupción, failover, restauración ni ejercicio productivo;
71. la siguiente tarea permanece únicamente reservada.

---

#### 22. Límites de la tarea

Esta tarea no:

- mide tiempos reales de interrupción o recuperación;
- fija RTO, RPO, MTPD o MBCO;
- acepta riesgos;
- ordena la recuperación entre procesos;
- inventa volúmenes, ventas, inventario, trabajadores o capacidad;
- declara una combinación proceso-sede aplicable sin evidencia cuando la regla no sea transversal;
- inventa dependencias o single points of failure;
- selecciona modos offline, manuales, snapshots, proveedores o recursos alternativos;
- escribe formularios de contingencia;
- diseña runbooks;
- define respaldos;
- ejecuta pruebas destructivas o simulaciones;
- activa acceso de emergencia;
- cambia permisos;
- cambia proveedores o contratos;
- crea tablas, vistas, funciones, jobs, colas o integraciones;
- modifica Supabase;
- declara continuidad validada o readiness.

---

#### 23. Continuidad

ÚLTIMA TAREA APROBADA
`CONT-DOM-001 — Definir política, alcance, gobierno, roles y ciclo de mantenimiento de continuidad`

TAREA ACTUAL APROBADA
`CONT-DOM-002 — Definir análisis de impacto empresarial, servicios críticos, procesos, sedes y niveles mínimos`

SIGUIENTE TAREA RESERVADA
`CONT-DOM-003 — Definir mapa de dependencias, recursos críticos, single points of failure y sustitutos`


### [ ] CONT-DOM-003 — Definir mapa de dependencias, recursos críticos, single points of failure y sustitutos
### [ ] CONT-DOM-004 — Definir MTPD, RTO, RPO, MBCO, prioridades y criterios de aceptación de riesgo
### [ ] CONT-DOM-005 — Definir taxonomía, severidad, declaración, activación, escalamiento, desactivación y cierre de incidentes de continuidad
### [ ] CONT-DOM-006 — Definir mando, sustitución, bitácora de decisiones, comunicación de crisis y coordinación externa
### [ ] CONT-DOM-007 — Definir operación mínima viable por proceso, sede, horario, temporada y duración
### [ ] CONT-DOM-008 — Definir estrategias de contingencia, alternativas manuales, offline, físicas y de proveedor
### [ ] CONT-DOM-009 — Definir registro, folios, evidencia, custodia y trabajo ejecutado durante la falla
### [ ] CONT-DOM-010 — Definir reincorporación, idempotencia, conflictos, conciliación y confirmación de pendientes
### [ ] CONT-DOM-011 — Definir inventario, política, frecuencia, retención, seguridad y cobertura de respaldos
### [ ] CONT-DOM-012 — Definir runbooks, orden de recuperación, restauración, failover, retorno y validación funcional
### [ ] CONT-DOM-013 — Definir continuidad de proveedores, energía, red, pagos, transporte, canales y recursos alternativos
### [ ] CONT-DOM-014 — Definir programa de walkthroughs, tabletops, simulaciones, restauraciones y ejercicios operativos
### [ ] CONT-DOM-015 — Definir revisión posterior, lecciones, acciones, eficacia y actualización periódica del plan
