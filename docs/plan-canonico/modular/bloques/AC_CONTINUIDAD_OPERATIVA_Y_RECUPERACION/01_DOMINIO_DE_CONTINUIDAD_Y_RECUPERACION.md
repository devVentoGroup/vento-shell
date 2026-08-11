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


### [ ] CONT-DOM-002 — Definir análisis de impacto empresarial, servicios críticos, procesos, sedes y niveles mínimos
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
