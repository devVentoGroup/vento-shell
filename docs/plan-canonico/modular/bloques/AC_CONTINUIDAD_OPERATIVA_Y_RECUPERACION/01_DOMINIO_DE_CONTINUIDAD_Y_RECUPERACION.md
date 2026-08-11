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


### ✅ CONT-DOM-003 — Definir mapa de dependencias, recursos críticos, single points of failure y sustitutos

**Estado:** APROBADA
**Tarea anterior:** `CONT-DOM-002 — Definir análisis de impacto empresarial, servicios críticos, procesos, sedes y niveles mínimos` — APROBADA
**Tarea siguiente:** `CONT-DOM-004 — Definir MTPD, RTO, RPO, MBCO, prioridades y criterios de aceptación de riesgo` — RESERVADA
**Tipo de tarea:** documental; materialización del mapa empresarial de dependencias y concentraciones de fallo por servicio BIA, con recursos candidatos, estado de evidencia y puertas de sustitución
**Bloque:** AC - Continuidad operativa y recuperación
**Fase:** exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`
**Implementación técnica u operativa:** no autorizada
**Cambios en código, DDL, DML, migraciones, datos, redes, dispositivos, proveedores, contratos, Supabase o producción:** no autorizados
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Materializar el mapa de dependencias de continuidad para los 69 servicios empresariales definidos en la tarea anterior, de modo que cada resultado protegido pueda responder de forma trazable:

```text
QUE RESULTADO EMPRESARIAL SE PROTEGE
-> QUE PERSONAS Y FUNCIONES NECESITA
-> QUE INFORMACION Y DOCUMENTOS NECESITA
-> QUE APLICACION PROPIETARIA Y CONSUMIDORAS PARTICIPAN
-> QUE CONTEXTO DE SEDE O TERRITORIO LE APLICA
-> QUE DISPOSITIVOS, REDES, INSTALACIONES O SERVICIOS PUBLICOS PUEDEN SER NECESARIOS
-> QUE INVENTARIO, INSUMOS, EQUIPOS O ACTIVOS PUEDEN SER NECESARIOS
-> QUE PROVEEDOR O CANAL EXTERNO PUEDE SER NECESARIO
-> DONDE EXISTE UNA CONCENTRACION QUE DEBE VALIDARSE COMO SPOF
-> SI EXISTE O NO UN SUSTITUTO APROBADO
-> QUIEN ES PROPIETARIO DE CERRAR LA EVIDENCIA O LA ALTERNATIVA
```

La tarea no convierte una dependencia semántica en un SPOF por intuición. Un SPOF exige una instancia real, impacto sobre el resultado mínimo y ausencia demostrada de una vía independiente o sustituto efectivo.

---

#### 2. Resultado material

| Control                                                            |     Resultado |
| ------------------------------------------------------------------ | ------------: |
| Servicios BIA heredados                                            |   **69 / 69** |
| Procesos `VPROC-*` reconciliados                                   |   **69 / 69** |
| Referencias `BIA-VPROC-####-V1` conservadas                        |   **69 / 69** |
| Dimensiones de dependencia evaluadas por servicio                  |         **8** |
| Decisiones de dimensión materializadas                             | **552 / 552** |
| Decisiones de estado SPOF por servicio                             |   **69 / 69** |
| Decisiones de sustitución por servicio                             |   **69 / 69** |
| Servicios con mapa especificado y evidencia de instancia pendiente |        **67** |
| Servicios bloqueados por aplicación diferida AURA                  |         **2** |
| SPOF de instancia confirmados documentalmente por esta tarea       |         **0** |
| Sustitutos operativos aprobados por esta tarea                     |         **0** |
| Ciclos de dependencia dura confirmados con evidencia suficiente    |         **0** |
| Mapeos proveedor-específicos inventados                            |         **0** |
| Cambios físicos                                                    |         **0** |
| Cambios de requisitos de prueba                                    |         **0** |

`0` SPOF confirmados no significa ausencia de SPOF. Significa que la evidencia vigente permite identificar vectores de concentración y dependencias funcionales, pero no demostrar para cada instancia que no exista redundancia, ruta independiente o sustituto efectivo.

---

#### 3. Entradas canónicas preservadas

La tarea consume sin redefinir:

1. `CONT-DOM-001`, que fija gobierno, funciones, límites y propietarios de las decisiones de continuidad;
2. `CONT-DOM-002`, que fija 69 servicios `BCS-VPROC-0001` a `BCS-VPROC-0069`, sus BIA, criticidad, nivel mínimo y alcance territorial;
3. el catálogo `VPROC-0001` a `VPROC-0069`, sus propósitos, propietarias, consumidoras, iniciadores, continuadores, entradas, salidas y evidencia;
4. la estructura organizacional y territorial que reconoce cinco sedes operativas internas: `Oficina 1`, `Vento Café`, `Saudo`, `Molka` y `Centro de Producción y Distribución`;
5. la clasificación de Vaila, Catering y puntos externos sin promoverlos a sedes internas;
6. el contrato tecnológico de siete clases `ASSET`, `ENDPOINT`, `SHARED_DEVICE`, `NETWORK_RESOURCE`, `PRINTER`, `APPLICATION` y `TECH_SERVICE`;
7. las quince relaciones tipadas de configuración, incluidas las dependencias de servicio hacia activo, endpoint, dispositivo compartido, red, impresora y aplicación;
8. los once servicios `TI-SERVICE-*` y las fronteras de propiedad entre SHELL, NEXO, VISO, PRINT-ARC, ORIGO, NUMERA y proveedores;
9. la evidencia canónica de que la materialización técnica transversal sigue incompleta para endpoint, topología de red y varias reconciliaciones físicas;
10. el registro vigente de requisitos de continuidad e integración.

---

#### 4. Fronteras conceptuales obligatorias

```text
DEPENDENCIA EMPRESARIAL != PROPIETARIO LOGICO != COMPONENTE FISICO != SPOF
```

```text
FUENTE DE VERDAD UNICA != INSTANCIA UNICA != FALLO UNICO
```

```text
APLICACION PROPIETARIA != PROVEEDOR DE INFRAESTRUCTURA != RUTA DE RECUPERACION
```

```text
RECURSO NECESARIO != RECURSO CRITICO CONFIRMADO != RECURSO SIN SUSTITUTO
```

```text
SUSTITUTO POSIBLE != SUSTITUTO APROBADO != SUSTITUTO PROBADO
```

```text
DISPONIBILIDAD TECNICA != RESULTADO EMPRESARIAL RECUPERADO
```

La unicidad de una aplicación propietaria o de una fuente de verdad protege integridad y autoridad; no demuestra por si sola una concentración física de fallo.

---

#### 5. Dimensiones obligatorias del mapa

| Dimensión                              | Regla                                                                                                                        |
| -------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| personas y funciones                   | referencia iniciadores, continuadores, responsables y funciones necesarias; nunca inventa nombres de personas                |
| información y documentos               | referencia entradas, salidas, registros y evidencia canonicamente requeridos por el proceso                                  |
| aplicaciones                           | conserva una propietaria y solo las consumidoras declaradas; plataforma de persistencia no adquiere propiedad                |
| sede y territorio                      | reutiliza el alcance de `BIA-VPROC-####-V1`; no crea una sede por conveniencia de continuidad                                |
| dispositivo y periferico               | solo se vuelve dependencia de instancia cuando el proceso realmente necesita el endpoint, dispositivo compartido o impresora |
| instalacion, energía y red             | se relaciona con la sede y topología reales; una clase o capacidad nominal no demuestra una ruta activa                      |
| inventario, insumos, equipos y activos | se vinculan solo cuando su ausencia afecta el resultado mínimo del servicio                                                  |
| proveedor o canal externo              | se registra por contrato/instancia cuando participa realmente; un tercero nunca se convierte en propietario interno          |

Cada una de las ocho dimensiones recibe una decisión por los 69 servicios. Una decisión `CONDICIONAL` es una clasificación explicita: exige la variante o instancia concreta antes de considerarse dependencia vigente.

---

#### 6. Estados usados por este mapa

Estos estados son documentales de esta tarea; no crean enums de base de datos ni estados técnicos de otra fuente.

##### 6.1. Estado de una dimensión

| Estado             | Significado                                                                                                                          |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------ |
| `VINCULO_CANONICO` | La naturaleza del proceso exige esa clase de dependencia; la instancia concreta conserva su fuente propietaria.                      |
| `CONDICIONAL`      | La dependencia existe solo para una sede, variante, canal, recurso o modalidad concreta.                                             |
| `NO_DIRECTA`       | La clase no es requisito directo universal del resultado; puede aparecer aguas arriba o abajo sin convertirse en dependencia propia. |
| `BLOQUEADO`        | La capacidad no puede presentar dependencia operativa como habilitada por existir una aplicación objetivo diferida.                  |

##### 6.2. Estado de SPOF

| Estado                              | Significado                                                                                                                            |
| ----------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| `CANDIDATO_A_VALIDAR`               | Existe al menos un vector de concentración que debe verificarse contra instancias, redundancia y sustitutos; no es un SPOF confirmado. |
| `SPOF_CONFIRMADO`                   | Solo puede usarse con evidencia de dependencia real, impacto sobre el mínimo y ausencia de vía independiente/sustituto.                |
| `SIN_SPOF_DEMOSTRADO`               | Solo puede usarse cuando existen rutas independientes verificadas; no se presume.                                                      |
| `BLOQUEADO_POR_APLICACION_DIFERIDA` | No existe capacidad operativa habilitada suficiente para evaluar el fallo como una instancia productiva normal.                        |

##### 6.3. Estado de sustitución

| Estado                              | Significado                                                                                                                          |
| ----------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| `SIN_SUSTITUTO_APROBADO`            | Esta tarea no dispone de evidencia aprobada de un sustituto que mantenga el resultado mínimo con autoridad y controles equivalentes. |
| `SUSTITUTO_VERIFICADO`              | Exige identidad, alcance, capacidad, disponibilidad, autoridad, seguridad, datos, conciliacion y prueba suficientes.                 |
| `NO_APLICA`                         | La dependencia no necesita sustitución porque no es requerida para el resultado en ese alcance.                                      |
| `BLOQUEADO_POR_APLICACION_DIFERIDA` | La estrategia de sustitución no se evalua como operativa antes de habilitar la capacidad objetivo.                                   |

---

#### 7. Prueba mínima para declarar un SPOF

Un elemento solo se declara `SPOF_CONFIRMADO` cuando se demuestran conjuntamente:

1. identidad concreta del elemento o función;
2. relación vigente con el servicio BIA y su alcance;
3. perdida del resultado mínimo si el elemento falla;
4. ausencia de otra instancia independiente capaz de sostener el mismo resultado;
5. ausencia de un sustituto aprobado y disponible;
6. inexistencia de una ruta alternativa ya autorizada que elimine la concentración;
7. evidencia fechada y propietario de la constatacion;
8. tratamiento de dependencias compartidas que pudieran hacer falsa la aparente redundancia.

La falta de inventario o de evidencia nunca se convierte en `SPOF_CONFIRMADO`; queda como `CANDIDATO_A_VALIDAR`.

---

#### 8. Prueba mínima para declarar un sustituto

Un recurso alternativo no se considera sustituto por ser similar o estar disponible. Debe demostrar:

1. que preserva el mismo resultado mínimo del BIA;
2. que cubre la sede, horario, volumen y variante aplicables;
3. que existe autoridad para activarlo;
4. que las personas requeridas saben utilizarlo;
5. que dispone de datos, documentos, insumos, configuración y credenciales necesarios;
6. que conserva seguridad, privacidad, calidad, inocuidad, trazabilidad y auditoria aplicables;
7. que no crea una segunda fuente de verdad;
8. que los trabajos producidos pueden reincorporarse y conciliarse;
9. que su dependencia de energía, red, proveedor o instalacion no comparte silenciosamente el mismo dominio de fallo;
10. que existe evidencia de prueba cuando la estrategia requiera readiness.

La selección concreta de modalidades de contingencia pertenece a `CONT-DOM-008`; la continuidad de proveedores y recursos alternativos pertenece a `CONT-DOM-013`.

---

#### 9. Reutilización del grafo tecnológico

Para dependencias técnicas, este mapa reutiliza el contrato ya aprobado y no inventa una CMDB paralela:

- `TECH_SERVICE -> ASSET`;
- `TECH_SERVICE -> ENDPOINT`;
- `TECH_SERVICE -> SHARED_DEVICE`;
- `TECH_SERVICE -> NETWORK_RESOURCE`;
- `TECH_SERVICE -> PRINTER`;
- `TECH_SERVICE -> APPLICATION`.

La evidencia canónica disponible documenta diez aplicaciones, dos dispositivos compartidos con cuatro vinculos dispositivo-aplicación y nueve impresoras documentadas, pero no una identidad transversal de endpoints ni una topología de red consolidada suficiente para declarar redundancia completa. Esos datos se usan como limite de evidencia, no como inventario operativo revalidado por esta tarea.

Por tanto:

1. no se deduce una dependencia por nombre, IP, MAC, serial, SSID, URL o ubicación textual;
2. no se deduce redundancia porque existan dos objetos de la misma clase;
3. no se deduce SPOF porque exista una sola propietaria lógica;
4. no se deduce sustituto porque un equipo o proveedor parezca equivalente;
5. la topología real conserva sus propietarios técnicos y requiere evidencia de instancia.

---

#### 10. Perfiles de dependencia materializados

Los perfiles siguientes son agrupaciones de lectura dentro de esta tarea. No son nuevos identificadores empresariales y no modifican las identidades `VPROC-*`, `BCS-*` o `BIA-*`.

| Perfil                                           | Personas / funciones                                                                               | Información / documentos                                                                      | Físico / técnico                                                                                      | Inventario / recursos                                                                 | Externo                                                                                        | Vector de concentración a validar                                                                        | Puerta de sustitución                                                                                                     |
| ------------------------------------------------ | -------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| Gobierno y estructura                            | autoridad empresarial, responsable del proceso y continuadores aprobados                           | decisiones, estructura, políticas, delegaciones, compromisos y evidencia                      | dispositivo, conectividad y contexto administrativo cuando sean necesarios para registrar o consultar | sin dependencia material universal; recursos concretos se vinculan solo con evidencia | asesoria o autoridad externa solo cuando el caso la involucre                                  | concentración de autoridad, conocimiento, expediente o acceso administrativo                             | `CONT-DOM-006` para suplencia humana; `CONT-DOM-008` para alternativa operativa; `CONT-DOM-013` si existe tercero crítico |
| Personas y trabajo                               | trabajador, responsables laborales, aprobadores y continuadores del proceso                        | identidad laboral, vinculo, asignaciones, turnos, asistencia, novedades y documentos          | sede/area del BIA, dispositivo y conectividad cuando el paso sea digital                              | recursos de trabajo y devoluciones cuando el proceso los exija                        | nomina, banco, seguridad social u otro tercero solo en la variante que corresponda             | disponibilidad de persona clave, acceso a expediente, dispositivo/red y tercero laboral cuando aplique   | `CONT-DOM-006`, `CONT-DOM-008` y `CONT-DOM-013` segun la clase de concentración                                           |
| SST, higiene y cumplimiento                      | responsable SST/cumplimiento, trabajadores, responsables de sede y continuadores                   | riesgos, inspecciones, incidente, controles, acciones y evidencia                             | instalacion, zona, dispositivo y conectividad segun el control o incidente                            | EPP, equipos, insumos de control y medios de emergencia cuando apliquen               | autoridades, prestadores o asesores cuando la obligacion los requiera                          | responsable especializado, instalacion, EPP/equipo, evidencia o contraparte externa                      | `CONT-DOM-006`, `CONT-DOM-008` y `CONT-DOM-013`                                                                           |
| Producto, receta, oferta y especificación        | responsables de producto, receta, calidad, oferta y operadores que corresponda                     | maestro de producto, receta, especificación, restricciones, oferta y vigencias                | sede productiva o comercial, dispositivo/red y equipos solo cuando el resultado los necesite          | ingredientes, presentaciones, materiales y equipos cuando la variante sea productiva  | proveedor o canal solo si participa en el resultado concreto                                   | maestro/especificación, persona especializada, material/equipo o canal dependiente                       | `CONT-DOM-008` para estrategia; `CONT-DOM-013` para terceros/recursos externos                                            |
| Compras y proveedores                            | solicitante, evaluador, aprobador, receptor y responsables de compra                               | necesidad, cotizacion, proveedor, orden, recepcion, diferencias y soporte                     | dispositivo/red y punto de recepcion cuando el proceso llegue a hecho físico                          | bien o servicio solicitado y recursos de recepcion cuando apliquen                    | proveedor y sus canales de cotizacion, orden, entrega o soporte                                | proveedor unico, aprobación concentrada, canal de compra o punto de recepcion                            | `CONT-DOM-008` para alternativa transitoria; `CONT-DOM-013` para proveedor y recurso alternativo                          |
| Inventario y almacenamiento                      | custodios, operadores de inventario y responsables de validación                                   | ubicación, existencia, movimiento, conteo, condición, solicitud y recepcion interna           | sede, LOC/zona, condiciones de almacenamiento, dispositivo/red cuando apliquen                        | existencias, contenedores, almacenamiento y equipos requeridos por el objeto          | sin dependencia externa universal; proveedor o transporte solo por variante correlacionada     | ubicación unica, frio/servicio publico, equipo de almacenamiento, inventario o dispositivo de operación  | `CONT-DOM-008` para modalidad/alternativa; `CONT-DOM-013` cuando dependa de servicio o recurso externo                    |
| Activos, vehiculos, reutilizables y contenedores | custodio, operador, conductor, responsable técnico o receptor segun proceso                        | activo, custodia, mantenimiento, condición, uso, kilometraje, retorno y completitud           | activo/vehiculo, sede o punto operativo, dispositivo/red cuando la trazabilidad sea digital           | activo, vehiculo, repuesto, combustible, reutilizable o contenedor correspondiente    | mantenimiento, garantia, combustible o tercero solo cuando la operación lo use                 | activo o vehiculo unico, custodio/conductor, repuesto/combustible o proveedor especializado              | `CONT-DOM-008` para recurso alterno; `CONT-DOM-013` para proveedor/abastecimiento alternativo                             |
| Producción                                       | planificador, productor, responsable de calidad y continuadores autorizados                        | demanda, plan, receta, orden, lote, consumo, calidad, empaque, rendimiento y cierre           | sede productiva, servicios publicos aplicables, equipo, dispositivo/red cuando corresponda            | ingredientes, insumos, empaques, equipos y capacidad productiva                       | proveedores de insumos/servicios solo por dependencia real demostrada                          | equipo especializado, capacidad de sede, servicio publico, material crítico o conocimiento especializado | `CONT-DOM-008` para operación alternativa; `CONT-DOM-013` para energía, insumos o terceros                                |
| Pedidos, ventas, pagos y caja                    | personal de servicio/caja, responsables comerciales y aprobadores cuando apliquen                  | oferta, pedido, preparacion, entrega, pago, soporte fiscal, caja y conciliacion               | sede/canal, terminal o dispositivo, red e impresion cuando la variante lo requiera                    | producto disponible, medios de caja y recursos de servicio                            | canal externo, adquirencia/pagos, facturacion o mensajeria cuando aplique                      | terminal/red, proveedor de pago, canal externo, impresora, caja o sede comercial                         | `CONT-DOM-008` para alternativa operativa; `CONT-DOM-013` para red, pagos, canales y proveedores                          |
| Clientes, fidelización, reclamos y reservas      | cliente, personal de atencion y decisores de caso/compensacion cuando corresponda                  | identidad, consentimiento, ledger de fidelización, caso, compensacion, reserva y comunicación | dispositivo/red, sede o canal solo segun la interaccion                                               | capacidad reservable o recurso comprometido cuando exista                             | mensajeria, canal o proveedor de comunicación cuando la interaccion lo use                     | identidad/ledger, canal de contacto, decisor de compensacion o capacidad reservable                      | `CONT-DOM-008` para alternativa; `CONT-DOM-013` para canal/proveedor externo                                              |
| Transporte y entregas                            | planificador, conductor/custodio, receptor y responsables de seguimiento                           | ruta, carga, custodia, entrega, rechazo, novedad, retorno y evidencia                         | vehiculo, sede/punto, dispositivo movil y conectividad cuando apliquen                                | vehiculo, carga, combustible, contenedores y medios de prueba                         | transportador o canal de entrega externo cuando la variante sea tercerizada                    | vehiculo/conductor, conectividad, combustible, prueba de entrega o transportador tercero                 | `CONT-DOM-008` para recurso/procedimiento alterno; `CONT-DOM-013` para transporte/proveedor alternativo                   |
| Finanzas y obligaciones                          | responsables financieros, aprobadores y conciliadores autorizados                                  | hechos economicos, soportes, obligaciones, cartera, pagos, costos y cierres                   | dispositivo/red y contexto administrativo cuando sea necesario                                        | sin recurso físico universal; soportes y medios de pago se tratan por contrato        | banco, proveedor de pago, sistema contable/fiscal o contraparte cuando aplique                 | autoridad financiera, fuente documental, integración externa o canal bancario/contable                   | `CONT-DOM-006` para suplencia; `CONT-DOM-013` para bancos, pagos y sistemas externos                                      |
| Instalaciones                                    | responsables de sede, mantenimiento, seguridad y proveedores autorizados                           | inspeccion, condición, mantenimiento, servicio, hallazgo, accion y cierre                     | instalacion, energía/servicios publicos, equipos, dispositivos y red cuando apliquen                  | repuestos, suministros, equipos de mantenimiento y recursos de seguridad              | mantenimiento, plagas, servicios publicos u otros prestadores aplicables                       | instalacion, servicio publico, equipo especializado o prestador unico                                    | `CONT-DOM-008` y `CONT-DOM-013`                                                                                           |
| Mercadeo y oportunidades AURA                    | responsables de mercadeo, aprobadores y continuadores declarados                                   | contenido, campaña, audiencia, oportunidad, interaccion y evidencia                           | dispositivo, red y canal digital cuando la capacidad llegue a estar operativa                         | activos de contenido cuando existan y esten gobernados                                | canales y proveedores de comunicación/mercadeo segun contrato futuro                           | aplicación diferida, canal externo, dato de audiencia y capacidad de publicacion                         | primero cierre de la aplicación diferida; luego `CONT-DOM-008` y `CONT-DOM-013` segun estrategia                          |
| Tecnología y acceso                              | responsable tecnológico, propietario del proceso, usuario y especialistas autorizados              | ticket, incidente, diagnostico, cambio, acceso, vigencia, revocacion y evidencia técnica      | endpoint, dispositivo compartido, red, aplicación, impresora o activo segun el caso                   | elemento tecnológico afectado y conocimiento técnico requerido                        | proveedor tecnológico o soporte especializado solo con alcance autorizado                      | conocimiento técnico, cuenta/credencial bajo custodia, red, aplicación o proveedor especializado         | `CONT-DOM-006` para suplencia; `CONT-DOM-008` para alternativa; `CONT-DOM-013` para proveedor/recurso                     |
| Información y evidencia                          | propietario del expediente, custodios y responsables de autorización/evidencia                     | documentos, evidencia, metadatos, retencion, acceso, hold y disposición                       | almacenamiento, dispositivo y conectividad segun soporte; archivo físico cuando aplique               | soporte físico o almacenamiento protegido cuando corresponda                          | repositorio/proveedor o autoridad solo si forma parte del expediente aprobado                  | custodia, repositorio, clave de acceso, almacenamiento o conocimiento de recuperación                    | `CONT-DOM-008`, `CONT-DOM-011`, `CONT-DOM-012` y `CONT-DOM-013` segun soporte                                             |
| Analitica y mejora                               | responsables de métrica, análisis, decisión y verificacion                                         | métricas, lineage, hallazgos, acciones, resultados y evidencia                                | dispositivo/red y plataforma de datos cuando el análisis sea digital                                  | sin recurso físico universal; depende de fuentes y capacidad analítica                | BI, hoja, modelo o proveedor solo bajo contrato aprobado                                       | fuente/lineage, herramienta analítica, conocimiento especializado o integración externa                  | `CONT-DOM-008` para alternativa de trabajo; `CONT-DOM-013` si existe proveedor crítico                                    |
| Continuidad empresarial                          | responsable de continuidad, propietarios de proceso, responsables técnicos y decisores autorizados | BIA, incidente, decisiones, planes, registros de contingencia, reconciliación y evidencia     | todas las dependencias de sede, energía, red, dispositivos e infraestructura que afecten el alcance   | recursos mínimos de cada proceso afectado y medios de recuperación autorizados        | proveedores, canales y autoridades segun incidente                                             | concentraciones heredadas de todos los servicios afectados y de la coordinacion transversal              | `CONT-DOM-004` a `CONT-DOM-015`, `CONT-AUTH-*` y `CONT-INT-*` segun la decisión                                           |
| Riesgo empresarial                               | propietario del riesgo, decisores y responsables de tratamiento                                    | riesgo, evaluación, tratamiento, aceptación, seguimiento y evidencia                          | dispositivo/red y contexto solo como soporte del registro                                             | el recurso bajo riesgo se referencia desde su dominio; no se duplica                  | asesor, aseguradora o autoridad solo cuando participe en el tratamiento                        | propietario del riesgo, evidencia, autoridad de aceptación o contraparte externa                         | `CONT-DOM-006`, `CONT-DOM-008` y `CONT-DOM-013` segun el riesgo                                                           |
| Asesores y autoridades                           | responsable interno, asesor o interlocutor autorizado y aprobador                                  | requerimiento, concepto, entregable, vencimiento, comunicación y evidencia                    | dispositivo/red y canal seguro de intercambio cuando aplique                                          | sin recurso físico universal                                                          | asesor o autoridad es dependencia externa explicita del caso, sin transferir propiedad interna | contraparte externa, plazo, conocimiento especializado o canal de intercambio                            | `CONT-DOM-006` para suplencia interna; `CONT-DOM-013` para dependencia externa                                            |
| Desempeno y desarrollo                           | trabajador, responsable de seguimiento y decisores autorizados                                     | objetivos, observaciones, retroalimentacion y decisiones sensibles                            | dispositivo/red y contexto laboral cuando aplique                                                     | sin recurso físico universal                                                          | no existe dependencia externa universal aprobada                                               | responsable de seguimiento, confidencialidad del expediente o acceso a la información                    | `CONT-DOM-006` y `CONT-DOM-008`                                                                                           |
| Elementos de protección personal                 | responsable SST, trabajador, custodio y responsables de reposicion                                 | requisito, entrega, aceptación, vigencia, cambio, devolucion y evidencia                      | sede/area y dispositivo cuando la evidencia sea digital                                               | EPP requerido, stock, talla/especificación y medio de entrega                         | proveedor de EPP cuando la disponibilidad dependa de abastecimiento                            | EPP sin sustituto, stock insuficiente, proveedor o custodio unico                                        | `CONT-DOM-008` para recurso alterno; `CONT-DOM-013` para proveedor/abastecimiento                                         |
| Kits y conjuntos                                 | custodio, armador, receptor y responsables del kit                                                 | definicion, instancia, componentes, completitud, prestamo, retorno y sustitución              | sede/LOC y dispositivo cuando el control sea digital                                                  | kit, componentes obligatorios/opcionales y contenedores relacionados                  | proveedor solo si un componente depende de abastecimiento externo                              | componente insustituible, kit unico, custodia o disponibilidad de reposicion                             | `CONT-DOM-008` para recurso sustituto; `CONT-DOM-013` para abastecimiento externo                                         |
| Satisfaccion del cliente                         | cliente, responsable de medición y analista autorizado                                             | muestra, canal, consentimiento, respuesta, sesgo y resultado                                  | dispositivo/red o canal de captura cuando aplique                                                     | sin recurso físico universal                                                          | canal o proveedor de encuesta/mensajeria solo si forma parte de la medición                    | canal de captura, consentimiento, integridad de muestra o proveedor externo                              | `CONT-DOM-008` y `CONT-DOM-013` cuando exista dependencia externa                                                         |
| Presupuesto                                      | responsables financieros, preparadores y aprobadores autorizados                                   | versión presupuestal, supuestos, aprobación, vigencia, consumo, proyección y desviacion       | dispositivo/red y plataforma de datos cuando aplique                                                  | sin recurso físico universal                                                          | fuentes externas solo si el presupuesto las consume mediante contrato aprobado                 | aprobador, fuente de supuestos, versión vigente o herramienta de consolidacion                           | `CONT-DOM-006` para suplencia; `CONT-DOM-008` para alternativa de trabajo                                                 |

---

#### 11. Matriz completa de dependencias por servicio

Reglas de lectura:

- `PERS` = personas/funciones; `INFO` = información/documentos; `APP` = aplicación propietaria + consumidoras declaradas; `SITE` = alcance territorial heredado del BIA;
- `DEV` = dispositivo/periferico; `INFRA` = instalacion/energía/red; `RES` = inventario/insumo/equipo/activo; `EXT` = proveedor/canal externo;
- `APP` no enumera copias: la propietaria se declara por fila y las consumidoras siguen exactamente el registro de consumidores del mismo `VPROC-*`;
- `SITE` conserva por referencia el alcance de `BIA-VPROC-####-V1` y nunca lo amplifica;
- un estado `CANDIDATO_A_VALIDAR` obliga a obtener evidencia, pero no afirma que el SPOF exista.

| Servicio         | BIA                 | Proceso      | Propietaria | Perfil                                           | PERS               | INFO               | APP                | SITE               | DEV                | INFRA              | RES                | EXT                | SPOF                                | Sustitución                         | Estado del mapa                      |
| ---------------- | ------------------- | ------------ | ----------- | ------------------------------------------------ | ------------------ | ------------------ | ------------------ | ------------------ | ------------------ | ------------------ | ------------------ | ------------------ | ----------------------------------- | ----------------------------------- | ------------------------------------ |
| `BCS-VPROC-0001` | `BIA-VPROC-0001-V1` | `VPROC-0001` | `viso`      | Gobierno y estructura                            | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `NO_DIRECTA`       | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0002` | `BIA-VPROC-0002-V1` | `VPROC-0002` | `viso`      | Gobierno y estructura                            | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `NO_DIRECTA`       | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0003` | `BIA-VPROC-0003-V1` | `VPROC-0003` | `viso`      | Gobierno y estructura                            | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `NO_DIRECTA`       | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0004` | `BIA-VPROC-0004-V1` | `VPROC-0004` | `viso`      | Gobierno y estructura                            | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `NO_DIRECTA`       | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0005` | `BIA-VPROC-0005-V1` | `VPROC-0005` | `viso`      | Personas y trabajo                               | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0006` | `BIA-VPROC-0006-V1` | `VPROC-0006` | `viso`      | Personas y trabajo                               | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0007` | `BIA-VPROC-0007-V1` | `VPROC-0007` | `viso`      | Personas y trabajo                               | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0008` | `BIA-VPROC-0008-V1` | `VPROC-0008` | `anima`     | Personas y trabajo                               | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0009` | `BIA-VPROC-0009-V1` | `VPROC-0009` | `viso`      | Personas y trabajo                               | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0010` | `BIA-VPROC-0010-V1` | `VPROC-0010` | `numera`    | Personas y trabajo                               | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0011` | `BIA-VPROC-0011-V1` | `VPROC-0011` | `viso`      | Personas y trabajo                               | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0012` | `BIA-VPROC-0012-V1` | `VPROC-0012` | `viso`      | SST, higiene y cumplimiento                      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0013` | `BIA-VPROC-0013-V1` | `VPROC-0013` | `viso`      | SST, higiene y cumplimiento                      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0014` | `BIA-VPROC-0014-V1` | `VPROC-0014` | `viso`      | SST, higiene y cumplimiento                      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0015` | `BIA-VPROC-0015-V1` | `VPROC-0015` | `nexo`      | Producto, receta, oferta y especificación        | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0016` | `BIA-VPROC-0016-V1` | `VPROC-0016` | `fogo`      | Producto, receta, oferta y especificación        | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0017` | `BIA-VPROC-0017-V1` | `VPROC-0017` | `pulso`     | Producto, receta, oferta y especificación        | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0018` | `BIA-VPROC-0018-V1` | `VPROC-0018` | `nexo`      | Producto, receta, oferta y especificación        | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0019` | `BIA-VPROC-0019-V1` | `VPROC-0019` | `origo`     | Compras y proveedores                            | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0020` | `BIA-VPROC-0020-V1` | `VPROC-0020` | `origo`     | Compras y proveedores                            | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0021` | `BIA-VPROC-0021-V1` | `VPROC-0021` | `origo`     | Compras y proveedores                            | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0022` | `BIA-VPROC-0022-V1` | `VPROC-0022` | `origo`     | Compras y proveedores                            | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0023` | `BIA-VPROC-0023-V1` | `VPROC-0023` | `nexo`      | Inventario y almacenamiento                      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0024` | `BIA-VPROC-0024-V1` | `VPROC-0024` | `nexo`      | Inventario y almacenamiento                      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0025` | `BIA-VPROC-0025-V1` | `VPROC-0025` | `nexo`      | Inventario y almacenamiento                      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0026` | `BIA-VPROC-0026-V1` | `VPROC-0026` | `nexo`      | Inventario y almacenamiento                      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0027` | `BIA-VPROC-0027-V1` | `VPROC-0027` | `nexo`      | Inventario y almacenamiento                      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0028` | `BIA-VPROC-0028-V1` | `VPROC-0028` | `nexo`      | Inventario y almacenamiento                      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0029` | `BIA-VPROC-0029-V1` | `VPROC-0029` | `nexo`      | Activos, vehiculos, reutilizables y contenedores | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0030` | `BIA-VPROC-0030-V1` | `VPROC-0030` | `nexo`      | Activos, vehiculos, reutilizables y contenedores | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0031` | `BIA-VPROC-0031-V1` | `VPROC-0031` | `nexo`      | Activos, vehiculos, reutilizables y contenedores | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0032` | `BIA-VPROC-0032-V1` | `VPROC-0032` | `nexo`      | Activos, vehiculos, reutilizables y contenedores | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0033` | `BIA-VPROC-0033-V1` | `VPROC-0033` | `fogo`      | Producción                                       | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0034` | `BIA-VPROC-0034-V1` | `VPROC-0034` | `fogo`      | Producción                                       | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0035` | `BIA-VPROC-0035-V1` | `VPROC-0035` | `fogo`      | Producción                                       | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0036` | `BIA-VPROC-0036-V1` | `VPROC-0036` | `fogo`      | Producción                                       | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0037` | `BIA-VPROC-0037-V1` | `VPROC-0037` | `fogo`      | Producción                                       | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0038` | `BIA-VPROC-0038-V1` | `VPROC-0038` | `pulso`     | Pedidos, ventas, pagos y caja                    | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0039` | `BIA-VPROC-0039-V1` | `VPROC-0039` | `pulso`     | Pedidos, ventas, pagos y caja                    | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0040` | `BIA-VPROC-0040-V1` | `VPROC-0040` | `pulso`     | Pedidos, ventas, pagos y caja                    | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0041` | `BIA-VPROC-0041-V1` | `VPROC-0041` | `pulso`     | Pedidos, ventas, pagos y caja                    | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0042` | `BIA-VPROC-0042-V1` | `VPROC-0042` | `pulso`     | Pedidos, ventas, pagos y caja                    | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0043` | `BIA-VPROC-0043-V1` | `VPROC-0043` | `pulso`     | Pedidos, ventas, pagos y caja                    | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0044` | `BIA-VPROC-0044-V1` | `VPROC-0044` | `pulso`     | Pedidos, ventas, pagos y caja                    | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0045` | `BIA-VPROC-0045-V1` | `VPROC-0045` | `pass`      | Clientes, fidelización, reclamos y reservas      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0046` | `BIA-VPROC-0046-V1` | `VPROC-0046` | `pulso`     | Clientes, fidelización, reclamos y reservas      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0047` | `BIA-VPROC-0047-V1` | `VPROC-0047` | `pulso`     | Clientes, fidelización, reclamos y reservas      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0048` | `BIA-VPROC-0048-V1` | `VPROC-0048` | `nexo`      | Transporte y entregas                            | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0049` | `BIA-VPROC-0049-V1` | `VPROC-0049` | `nexo`      | Transporte y entregas                            | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0050` | `BIA-VPROC-0050-V1` | `VPROC-0050` | `pulso`     | Transporte y entregas                            | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0051` | `BIA-VPROC-0051-V1` | `VPROC-0051` | `numera`    | Finanzas y obligaciones                          | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `NO_DIRECTA`       | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0052` | `BIA-VPROC-0052-V1` | `VPROC-0052` | `numera`    | Finanzas y obligaciones                          | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `NO_DIRECTA`       | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0053` | `BIA-VPROC-0053-V1` | `VPROC-0053` | `numera`    | Finanzas y obligaciones                          | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `NO_DIRECTA`       | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0054` | `BIA-VPROC-0054-V1` | `VPROC-0054` | `numera`    | Finanzas y obligaciones                          | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `NO_DIRECTA`       | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0055` | `BIA-VPROC-0055-V1` | `VPROC-0055` | `nexo`      | Instalaciones                                    | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0056` | `BIA-VPROC-0056-V1` | `VPROC-0056` | `aura`      | Mercadeo y oportunidades AURA                    | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `BLOQUEADO`        | `BLOQUEADO`        | `BLOQUEADO`        | `BLOQUEADO`        | `BLOQUEADO`        | `BLOQUEADO`        | `BLOQUEADO_POR_APLICACION_DIFERIDA` | `BLOQUEADO_POR_APLICACION_DIFERIDA` | `BLOQUEADO_POR_APLICACION_DIFERIDA`  |
| `BCS-VPROC-0057` | `BIA-VPROC-0057-V1` | `VPROC-0057` | `aura`      | Mercadeo y oportunidades AURA                    | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `BLOQUEADO`        | `BLOQUEADO`        | `BLOQUEADO`        | `BLOQUEADO`        | `BLOQUEADO`        | `BLOQUEADO`        | `BLOQUEADO_POR_APLICACION_DIFERIDA` | `BLOQUEADO_POR_APLICACION_DIFERIDA` | `BLOQUEADO_POR_APLICACION_DIFERIDA`  |
| `BCS-VPROC-0058` | `BIA-VPROC-0058-V1` | `VPROC-0058` | `viso`      | Tecnología y acceso                              | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0059` | `BIA-VPROC-0059-V1` | `VPROC-0059` | `viso`      | Tecnología y acceso                              | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0060` | `BIA-VPROC-0060-V1` | `VPROC-0060` | `viso`      | Información y evidencia                          | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0061` | `BIA-VPROC-0061-V1` | `VPROC-0061` | `numera`    | Analitica y mejora                               | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `NO_DIRECTA`       | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0062` | `BIA-VPROC-0062-V1` | `VPROC-0062` | `viso`      | Continuidad empresarial                          | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0063` | `BIA-VPROC-0063-V1` | `VPROC-0063` | `viso`      | Riesgo empresarial                               | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0064` | `BIA-VPROC-0064-V1` | `VPROC-0064` | `viso`      | Asesores y autoridades                           | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `NO_DIRECTA`       | `VINCULO_CANONICO` | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0065` | `BIA-VPROC-0065-V1` | `VPROC-0065` | `viso`      | Desempeno y desarrollo                           | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `NO_DIRECTA`       | `NO_DIRECTA`       | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0066` | `BIA-VPROC-0066-V1` | `VPROC-0066` | `viso`      | Elementos de protección personal                 | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0067` | `BIA-VPROC-0067-V1` | `VPROC-0067` | `nexo`      | Kits y conjuntos                                 | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0068` | `BIA-VPROC-0068-V1` | `VPROC-0068` | `pulso`     | Satisfaccion del cliente                         | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `NO_DIRECTA`       | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |
| `BCS-VPROC-0069` | `BIA-VPROC-0069-V1` | `VPROC-0069` | `numera`    | Presupuesto                                      | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `VINCULO_CANONICO` | `CONDICIONAL`      | `CONDICIONAL`      | `NO_DIRECTA`       | `CONDICIONAL`      | `CANDIDATO_A_VALIDAR`               | `SIN_SUSTITUTO_APROBADO`            | `ESPECIFICADO_CON_EVIDENCIA_PARCIAL` |

---

#### 12. Reconciliación de la matriz

La matriz conserva:

- **69** servicios `BCS-*` unicos;
- **69** procesos `VPROC-*` unicos;
- **69** BIA `BIA-*` unicos;
- **0** servicios sin perfil;
- **0** servicios con propietaria multiple;
- **0** servicios con sede inventada;
- **67** filas `ESPECIFICADO_CON_EVIDENCIA_PARCIAL`;
- **2** filas `BLOQUEADO_POR_APLICACION_DIFERIDA`, correspondientes exclusivamente a `VPROC-0056` y `VPROC-0057`;
- **69** decisiones de SPOF;
- **69** decisiones de sustitución;
- **552** decisiones de clase de dependencia.

Distribución de aplicaciones propietarias preservada:

| Aplicación | Servicios |
| ---------- | --------: |
| `anima`    |     **1** |
| `viso`     |    **20** |
| `nexo`     |    **16** |
| `fogo`     |     **6** |
| `origo`    |     **4** |
| `pulso`    |    **12** |
| `numera`   |     **7** |
| `aura`     |     **2** |
| `pass`     |     **1** |
| `shell`    |     **0** |
| **Total**  |    **69** |

---

#### 13. Dependencias compartidas y concentraciones transversales

Se consideran vectores compartidos que deben reconciliarse cuando varias filas materialicen la misma instancia:

1. una misma sede o instalacion que soporte varios servicios;
2. un mismo enlace, router, punto de acceso, segmento o recurso de red;
3. un mismo endpoint o dispositivo compartido;
4. una misma impresora o puente de impresion;
5. una misma aplicación o dependencia técnica de aplicación;
6. una misma fuente de datos o documento esencial;
7. una misma persona que concentre conocimiento, custodia o autoridad sin suplencia vigente;
8. un mismo activo, equipo especializado, camara, vehiculo o recurso de almacenamiento;
9. un mismo servicio publico;
10. un mismo proveedor, canal, banco, adquirente, transportador o prestador especializado;
11. una misma credencial o conocimiento de recuperación bajo una sola custodia;
12. una dependencia externa que se presente como dos alternativas pero comparta proveedor, infraestructura o dominio de fallo.

Una instancia compartida se registra una sola vez en su fuente propietaria y se relaciona con todos los servicios afectados. No se duplica para simular independencia.

---

#### 14. Tratamiento de dependencias sin sustituto demostrado

Para las 67 filas no bloqueadas, `SIN_SUSTITUTO_APROBADO` significa exclusivamente que esta tarea no dispone de evidencia suficiente para afirmar un sustituto validado. El cierre se distribuye por clase:

| Clase                                                      | Propietario de la decisión posterior                                             | Condicion de salida                                                           |
| ---------------------------------------------------------- | -------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| suplencia de persona o mando                               | `CONT-DOM-006`                                                                   | función primaria y sustituta con alcance, vigencia y autoridad suficientes    |
| operación manual, offline, reducida o con recurso alterno  | `CONT-DOM-008`                                                                   | modalidad seleccionada por capacidad con límites y controles                  |
| formularios o evidencia durante falla                      | `CONT-DOM-009`                                                                   | captura controlada con folio, custodia y estado                               |
| reincorporación y conflictos                               | `CONT-DOM-010`                                                                   | retorno idempotente y conciliable                                             |
| respaldo de información                                    | `CONT-DOM-011`                                                                   | cobertura, retencion, separacion de fallo y restaurabilidad definidas         |
| recuperación, failover y orden técnico                     | `CONT-DOM-012`                                                                   | runbook, fuente, autoridad, validación y retorno definidos                    |
| proveedor, energía, red, pagos, transporte o canal alterno | `CONT-DOM-013`                                                                   | alternativa real evaluada con contrato, capacidad, acceso y prueba aplicables |
| endpoint, red, impresora o dependencia de aplicación       | fuentes `TI-DOM-003` a `TI-DOM-006`; estrategia en `CONT-DOM-008`, `012` o `013` | instancia reconciliada y alternativa/recuperación aprobada                    |
| contrato de estado/health entre aplicaciones               | `CONT-INT-001`                                                                   | dependencia y estado degradado interoperables                                 |
| dependencia externa                                        | `CONT-INT-003`                                                                   | contrato de continuidad externo correlacionado                                |

---

#### 15. Caso especial AURA

`VPROC-0056` y `VPROC-0057` conservan sus servicios y BIA para trazabilidad, pero no se presentan como capacidades operativas habilitadas.

Por ello:

- sus dependencias conceptuales de personas e información permanecen identificadas;
- la aplicación, sede operativa efectiva, recursos técnicos, proveedores y sustitutos no se declaran productivamente validados;
- no se clasifica la aplicación diferida como SPOF;
- no se declara un sustituto hasta que exista una capacidad operativa y una estrategia de continuidad autorizadas;
- el bloqueo no se elimina mediante una aplicación distinta o un canal externo por conveniencia.

---

#### 16. Personas, conocimiento y concentración de autoridad

Los registros de actores permiten saber que funciones deben intervenir, pero no demuestran cuantos ocupantes reales existen en cada sede, turno o fecha.

Reglas:

1. una función con un unico actor nominal no se inventa si no existe evidencia organizacional vigente;
2. una persona que ejerza varias funciones puede constituir una concentración operativa, pero solo se confirma con asignacion real;
3. suplencia documental sin disponibilidad real no elimina el SPOF;
4. conocimiento no documentado o credencial bajo una sola custodia es vector de concentración, no hecho confirmado sin evidencia;
5. la matriz de mando y sustitución durante incidente pertenece a `CONT-DOM-006`;
6. la autorización de acciones protegidas pertenece a `CONT-AUTH-*`;
7. un proveedor externo no sustituye la autoridad interna del proceso.

---

#### 17. Instalaciones, energía, red y dispositivos

El alcance territorial reutiliza exclusivamente las cinco sedes internas aprobadas y el tratamiento de puntos externos ya existente.

Para declarar independencia física se debe demostrar, segun aplique:

- alimentacion electrica o respaldo independiente;
- enlace o ruta de red independiente;
- equipo, endpoint o dispositivo alternativo realmente disponible;
- ubicación o instalacion distinta cuando la estrategia dependa de separacion física;
- acceso y autorización operables durante la falla;
- configuración compatible;
- datos y evidencia accesibles;
- ausencia de dependencia oculta en el mismo proveedor o componente aguas arriba.

Dos dispositivos, dos enlaces o dos sedes no se consideran redundantes por conteo. La independencia debe demostrarse por dominio de fallo.

---

#### 18. Inventario, insumos, equipos y activos

Un recurso físico adquiere condición de candidato crítico cuando el resultado mínimo del BIA no puede producirse sin ese recurso o una clase equivalente aprobada.

Se conserva la propiedad de dominio:

- NEXO mantiene activos, ubicación, custodia, inventario y movimientos;
- FOGO mantiene ejecución productiva, lotes y calidad;
- ORIGO mantiene compra, proveedor y aceptación comercial;
- PULSO mantiene compromiso comercial, pedido, venta, pago y caja;
- NUMERA mantiene efecto economico y conciliacion;
- VISO mantiene el expediente transversal aplicable;
- continuidad referencia esos hechos; no crea un ledger físico paralelo.

Tiempo de reposicion, stock de seguridad, reserva física y compra de redundancia no se inventan en esta tarea.

---

#### 19. Proveedores y canales externos

La matriz marca dependencia externa como `VINCULO_CANONICO`, `CONDICIONAL`, `NO_DIRECTA` o `BLOQUEADO`, pero no crea un proveedor específico cuando el inventario y contrato no estan evidenciados.

Para una dependencia externa concreta se debera conservar: servicio, proveedor, contrato, alcance, contacto, horario, SLA cuando exista, credencial bajo custodia, datos recuperables, canal de escalamiento, concentración y alternativa. La evaluación y aprobación de esa continuidad pertenece a `CONT-DOM-013` y su contrato técnico a `CONT-INT-003`.

---

#### 20. Ciclos y efectos diferidos

No se declara un ciclo de dependencia dura solo porque dos procesos intercambien eventos o se retroalimenten comercialmente.

Un ciclo se confirma unicamente cuando:

1. el servicio A requiere el resultado mínimo de B para continuar;
2. B requiere simultaneamente el resultado mínimo de A;
3. ambas relaciones estan vigentes en el mismo alcance temporal y territorial;
4. no existe estado intermedio, snapshot, buffer, inventario o mecanismo autorizado que rompa el ciclo;
5. la evidencia de instancia lo demuestra.

Con la evidencia documental vigente esta tarea no confirma un ciclo duro. Los contratos de aplicaciones, colas, health y degradación que puedan revelar ciclos se materializan en `CONT-INT-001` y las estrategias se resuelven en `CONT-DOM-008` y `CONT-DOM-012`.

Los efectos diferidos tambien se conservan: la falla de una dependencia puede no detener el proceso inmediatamente y, aun asi, agotar inventario, capacidad, vigencia, cola, bateria, efectivo, ventana contractual o plazo. La duracion cuantitativa y prioridad pertenecen a `CONT-DOM-004`.

---

#### 21. Autorización, seguridad y privacidad

1. conocer una dependencia no concede acceso al recurso;
2. el mapa no contiene secretos, tokens, claves privadas ni credenciales completas;
3. un contacto externo no se publica fuera del alcance autorizado;
4. la identidad de una persona no se expone si basta la función;
5. la ruta de recuperación no puede usar una cuenta compartida o privilegio no autorizado como sustituto;
6. la existencia de una copia no demuestra que pueda restaurarse ni que el actor pueda accederla;
7. un endpoint alternativo no hereda permisos del endpoint fallido;
8. una sede alternativa no hereda contexto territorial ni autorización;
9. un proveedor alternativo no recibe datos o secretos por la sola declaración de continuidad;
10. toda prueba posterior conserva privacidad, evidencia y segregacion.

---

#### 22. Handoffs obligatorios

| Decision                                                            | Propietario documental                             | Condicion de salida                                                 |
| ------------------------------------------------------------------- | -------------------------------------------------- | ------------------------------------------------------------------- |
| MTPD, RTO, RPO, MBCO y prioridad de recuperación                    | `CONT-DOM-004`                                     | antes de ordenar o dimensionar recuperación                         |
| mando y sustitución durante incidente                               | `CONT-DOM-006`                                     | antes del primer ejercicio de mando                                 |
| detalle de operación mínima                                         | `CONT-DOM-007`                                     | antes de habilitar modo degradado                                   |
| modalidad manual, offline, reducida, física o de proveedor          | `CONT-DOM-008`                                     | antes de usar una alternativa                                       |
| captura durante falla                                               | `CONT-DOM-009`                                     | antes de operar con folios o formularios                            |
| reincorporación                                                     | `CONT-DOM-010`                                     | antes de devolver trabajo contingente a fuentes propietarias        |
| respaldo                                                            | `CONT-DOM-011`                                     | antes de certificar cobertura                                       |
| recuperación, failover, retorno y validación funcional              | `CONT-DOM-012`                                     | antes de ejecutar recuperación                                      |
| proveedor, energía, red, pagos, transporte, canal y recurso alterno | `CONT-DOM-013`                                     | antes de aceptar una dependencia crítica sin alternativa suficiente |
| dependencias y estado degradado entre aplicaciones                  | `CONT-INT-001`                                     | antes de orquestar degradación/recuperación automatizada            |
| contratos externos de continuidad                                   | `CONT-INT-003`                                     | antes de integrar failover o escalamiento externo                   |
| evidencia de endpoint, red, impresora y dependencia de aplicación   | `TI-DOM-003` a `TI-DOM-006` y sus fuentes técnicas | antes de afirmar una topología o redundancia de instancia           |

Ningun pendiente material de esta tarea queda sin propietario documental y condición de salida.

---

#### 23. Cobertura de hallazgos heredados

Esta tarea cierra documentalmente los hallazgos heredados que exigian un mapa extremo a extremo y una consolidacion de SPOF, con la siguiente precision:

- el mapa extremo a extremo queda materializado para los 69 servicios y ocho dimensiones;
- los vectores de concentración quedan explicitados por perfil y por servicio;
- un SPOF concreto solo cambia de candidato a confirmado cuando exista evidencia de instancia suficiente;
- la ausencia de esa evidencia queda con fuentes y puertas de resolucion exactas;
- ninguna alternativa se declara aprobada antes de sus tareas propietarias.

Por tanto, el cierre es documental del mapa y del metodo de decisión por instancia; no es certificacion de redundancia ni readiness físico.

---

#### 24. Cobertura de requisitos de prueba vigente

La conducta de esta tarea ya esta protegida por `TREQ-CONT-001`, que exige análisis de impacto y dependencia versionado con producto/servicio, proceso, sede, propietario, consumidores, personas, datos, aplicaciones, dispositivos, instalaciones, proveedores, recursos y nivel mínimo, y por `TREQ-INTEGRATION-023`, que exige relacionar procesos, aplicaciones, datos, infraestructura, proveedores y canales durante degradación y recuperación.

La tarea especializa esos contratos para los 69 servicios sin crear una conducta ejecutable nueva, una nueva modalidad de contingencia, un nuevo objetivo temporal o una nueva accion protegida.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el mapa, las reglas para confirmar concentraciones y la exigencia de sustitutos trazables quedan dentro de comportamientos de continuidad e integración ya registrados. La tarea no implementa failover, selección de proveedor, recuperación, activación, acceso de emergencia, restauración, reincorporación ni una accion ejecutable adicional.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 25. Criterios de aceptación

1. se preservan exactamente 69 servicios `BCS-VPROC-0001` a `BCS-VPROC-0069`;
2. cada servicio conserva exactamente una referencia `BIA-VPROC-####-V1`;
3. cada servicio conserva su `VPROC-*` sin renumeración;
4. cada servicio conserva la aplicación propietaria aprobada;
5. la distribución de propietarias suma 69 y coincide con el registro de procesos;
6. SHELL conserva cero procesos propietarios sin perder sus responsabilidades transversales;
7. cada fila clasifica personas y funciones;
8. cada fila clasifica información y documentos;
9. cada fila clasifica aplicación propietaria y consumidoras por referencia canónica;
10. cada fila conserva alcance de sede por referencia al BIA;
11. cada fila clasifica dispositivo o periferico;
12. cada fila clasifica instalacion, energía y red;
13. cada fila clasifica inventario, insumo, equipo o activo;
14. cada fila clasifica proveedor o canal externo;
15. las ocho dimensiones producen 552 decisiones explicitas;
16. una dependencia condicional no se presenta como instancia vigente sin su condición;
17. una clase técnica no se convierte automaticamente en recurso crítico;
18. un recurso solo es crítico cuando su perdida afecta el resultado mínimo;
19. la unicidad de la fuente de verdad no se interpreta como SPOF físico;
20. la unicidad de la aplicación propietaria no se interpreta como SPOF físico;
21. una aplicación almacenada en una plataforma compartida no transfiere propiedad a la plataforma;
22. un proveedor externo no se convierte en propietario interno;
23. un nombre, IP, MAC, serial, SSID o URL no crea una relación de dependencia;
24. el mapa reutiliza las relaciones tecnológicas tipadas existentes;
25. no se crea una CMDB paralela;
26. no se crea un inventario paralelo de activos;
27. no se crea un inventario paralelo de aplicaciones;
28. no se crea un inventario paralelo de proveedores;
29. se distinguen dependencia empresarial, recurso, instancia y SPOF;
30. se distinguen sustituto posible, aprobado y probado;
31. todo SPOF confirmado exige evidencia de instancia;
32. todo SPOF confirmado exige impacto sobre el resultado mínimo;
33. todo SPOF confirmado exige ausencia de ruta independiente suficiente;
34. todo SPOF confirmado exige ausencia de sustituto efectivo;
35. la falta de evidencia no se convierte en confirmacion de SPOF;
36. la falta de evidencia no se convierte en confirmacion de redundancia;
37. dos objetos de la misma clase no prueban redundancia;
38. dos sedes no prueban independencia de energía, red, proveedor o datos;
39. un sustituto exige autoridad y capacidad suficientes;
40. un sustituto exige datos y controles equivalentes;
41. un sustituto no crea una segunda fuente de verdad;
42. un sustituto debe poder reincorporar y conciliar el trabajo cuando aplique;
43. la tarea no selecciona modalidades concretas de contingencia;
44. la tarea no fija MTPD;
45. la tarea no fija RTO;
46. la tarea no fija RPO;
47. la tarea no fija MBCO;
48. la tarea no fija prioridad de recuperación;
49. la tarea no fija stock de seguridad;
50. la tarea no fija tiempos de reposicion;
51. la tarea no compra redundancia;
52. la tarea no selecciona un proveedor alternativo;
53. la tarea no crea una sede alternativa;
54. la tarea no activa un incidente;
55. la tarea no ejecuta failover;
56. la tarea no ejecuta restauración;
57. la tarea no ejecuta una prueba destructiva;
58. las cinco sedes internas aprobadas permanecen sin ampliacion;
59. Vaila no se convierte en sede por continuidad;
60. Catering no se convierte en sede por continuidad;
61. los puntos externos no se convierten en sedes ordinarias;
62. `VPROC-0056` permanece bloqueado por aplicación AURA diferida;
63. `VPROC-0057` permanece bloqueado por aplicación AURA diferida;
64. AURA diferida no se clasifica como SPOF productivo;
65. las 67 filas restantes conservan evidencia de instancia pendiente cuando corresponde;
66. se identifican vectores de concentración humana sin inventar personas;
67. se identifican vectores de concentración técnica sin inventar topología;
68. se identifican vectores de concentración física sin inventar activos;
69. se identifican vectores de concentración externa sin inventar proveedores;
70. las dependencias compartidas conservan una unica identidad propietaria;
71. no se confirma un ciclo duro por mera retroalimentacion entre procesos;
72. los efectos diferidos se reconocen sin inventar duraciones;
73. cada clase de pendiente tiene propietario documental y condición de salida;
74. `CONT-DOM-004` conserva los objetivos cuantitativos;
75. `CONT-DOM-006` conserva mando y suplencia durante incidente;
76. `CONT-DOM-008` conserva modalidades y alternativas operativas;
77. `CONT-DOM-011` conserva política de respaldo;
78. `CONT-DOM-012` conserva runbooks, failover y retorno;
79. `CONT-DOM-013` conserva proveedores y recursos alternativos;
80. `CONT-INT-001` conserva contratos de dependencia y health entre aplicaciones;
81. `CONT-INT-003` conserva contratos externos de continuidad;
82. TI conserva sus fuentes técnicas de endpoint, red, impresion y aplicación;
83. el mapa no concede acceso por mostrar una dependencia;
84. el mapa no contiene secretos ni credenciales completas;
85. un recurso alternativo no hereda permisos del recurso fallido;
86. una sede alternativa no heredaria permisos por inferencia;
87. se mantiene segregacion de funciones y fuentes de verdad;
88. la tarea no modifica ningun requisito de prueba;
89. la tarea no genera una copia innecesaria del registro de requisitos;
90. la tarea no modifica código, datos, configuración ni Supabase;
91. `CONT-DOM-004` permanece unicamente reservada.

---

#### 26. Balance de cierre

| Control                                   |     Resultado |
| ----------------------------------------- | ------------: |
| Servicios materializados                  |   **69 / 69** |
| Procesos materializados                   |   **69 / 69** |
| BIA referenciados                         |   **69 / 69** |
| Dimensiones por servicio                  |         **8** |
| Decisiones de dimensión                   | **552 / 552** |
| Perfiles de dependencia                   |        **25** |
| Filas especificadas con evidencia parcial |        **67** |
| Filas bloqueadas AURA                     |         **2** |
| SPOF confirmados                          |         **0** |
| Candidatos a validar                      |        **67** |
| Sustitutos aprobados                      |         **0** |
| Ciclos duros confirmados                  |         **0** |
| Proveedores inventados                    |         **0** |
| Criterios de aceptación                   |        **91** |
| Cambios físicos                           |         **0** |
| Requisitos de prueba creados/modificados  |         **0** |

---

#### 27. Límites de la tarea

Esta tarea no:

- declara que Vento carezca de redundancia;
- declara que Vento ya tenga redundancia suficiente;
- inventa un SPOF sin evidencia de instancia;
- inventa una persona como responsable o suplente;
- inventa un endpoint, red, impresora, proveedor, contrato o canal;
- aprueba una sede, equipo, proveedor o canal sustituto;
- define una modalidad de contingencia concreta;
- fija MTPD, RTO, RPO, MBCO ni prioridades;
- define capacidad o costo de redundancia;
- modifica permisos o acceso de emergencia;
- cambia inventario, activos, aplicaciones, configuración, topología o relaciones físicas;
- ejecuta respaldo, restauración, failover, migracion, backfill, DDL, DML o prueba operativa;
- modifica código, repositorios consumidores, datos productivos ni Supabase;
- certifica readiness.

---

#### 28. Continuidad

ÚLTIMA TAREA APROBADA
`CONT-DOM-002 — Definir análisis de impacto empresarial, servicios críticos, procesos, sedes y niveles mínimos`

TAREA ACTUAL APROBADA
`CONT-DOM-003 — Definir mapa de dependencias, recursos críticos, single points of failure y sustitutos`

SIGUIENTE TAREA RESERVADA
`CONT-DOM-004 — Definir MTPD, RTO, RPO, MBCO, prioridades y criterios de aceptación de riesgo`


### ✅ CONT-DOM-004 — Definir MTPD, RTO, RPO, MBCO, prioridades y criterios de aceptación de riesgo

**Estado:** APROBADA
**Tarea anterior:** `CONT-DOM-003 — Definir mapa de dependencias, recursos críticos, single points of failure y sustitutos` — APROBADA
**Tarea siguiente:** `CONT-DOM-005 — Definir taxonomía, severidad, declaración, activación, escalamiento, desactivación y cierre de incidentes de continuidad` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materialización de objetivos empresariales de continuidad por servicio BIA, con MTPD, RTO, RPO, MBCO, prioridad de recuperación y criterios de aceptación de riesgo, separando objetivo aprobado de capacidad validada
**Bloque:** AC — Continuidad operativa y recuperación
**Fase:** exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`
**Implementación técnica u operativa:** no autorizada
**Código, DDL, DML, migraciones, RLS, RPC, datos, backfills, respaldos, restauraciones, failover, activaciones de contingencia, compras, cambios de proveedor o cambios en Supabase:** no autorizados
**Servicios BIA evaluados:** 69 de 69
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Fijar para cada uno de los 69 resultados empresariales protegidos un límite temporal y funcional de continuidad que permita decidir, antes de un incidente, cuánto tiempo puede faltar el resultado mínimo, cuándo debe estar restablecido, qué antigüedad máxima de estado recuperable es tolerable, qué nivel mínimo debe preservarse, en qué orden debe recuperarse y bajo qué condiciones un incumplimiento puede o no someterse a aceptación temporal de riesgo.

La tarea convierte el BIA y el mapa de dependencias ya aprobados en objetivos empresariales explícitos. No afirma que la arquitectura, los respaldos, los proveedores, las personas o los procedimientos actuales ya puedan cumplirlos.

Invariante central:

```text
OBJETIVO DE CONTINUIDAD DEFINIDO
!= CAPACIDAD TECNICA DEMOSTRADA
!= TIEMPO OBSERVADO EN EJERCICIO
!= RIESGO ACEPTADO
!= READINESS CERTIFICADO
```

#### 2. Resultado material

| Control                                            |   Resultado |
| -------------------------------------------------- | ----------: |
| Servicios `BCS-*` heredados                        | **69 / 69** |
| BIA `BIA-*` reconciliados                          | **69 / 69** |
| Procesos `VPROC-*` reconciliados                   | **69 / 69** |
| Perfiles de objetivo de continuidad                |       **4** |
| Decisiones MTPD                                    | **69 / 69** |
| Decisiones RTO                                     | **69 / 69** |
| Decisiones RPO                                     | **69 / 69** |
| Decisiones MBCO                                    | **69 / 69** |
| Decisiones de prioridad                            | **69 / 69** |
| Decisiones de estado de aceptación de riesgo       | **69 / 69** |
| Objetivos activos definidos y todavía no validados |      **67** |
| Objetivos bloqueados por aplicación AURA diferida  |       **2** |
| Capacidades declaradas validadas por esta tarea    |       **0** |
| Riesgos aceptados por esta tarea                   |       **0** |
| Cambios físicos                                    |       **0** |
| Cambios de requisitos de prueba                    |       **0** |

#### 3. Entradas canónicas preservadas

Esta tarea consume y conserva, sin redefinir:

1. `CONT-DOM-001`, incluido su gobierno, derechos de decisión, segregación, excepciones, versionado y prohibición de presentar objetivos no demostrados como capacidad real;
2. `CONT-DOM-002`, incluidos los 69 servicios BIA, las cuatro clases de criticidad, los cuatro niveles mínimos cualitativos, cinco sedes internas y la separación entre criticidad BIA, severidad de incidente y prioridad de recuperación;
3. `CONT-DOM-003`, incluidos los 69 mapas de dependencia, 552 decisiones de dimensión, 67 candidatos a validar como concentración, dos bloqueos AURA, cero SPOF confirmados y cero sustitutos aprobados;
4. las aplicaciones propietarias y la distribución de propiedad aprobada para `VPROC-0001` a `VPROC-0069`;
5. los requisitos vigentes de continuidad, autorización e integración que exigen objetivos, evidencia, trazabilidad y recuperación correlacionada;
6. la regla de que la operación mínima exacta por volumen, sede, horario, temporada y duración pertenece a `CONT-DOM-007`;
7. la regla de que modalidades concretas de contingencia pertenecen a `CONT-DOM-008`, respaldos a `CONT-DOM-011`, runbooks y tiempos observados de recuperación a `CONT-DOM-012` y `CONT-DOM-014`, y continuidad externa a `CONT-DOM-013`.

#### 4. Definiciones normativas

| Concepto                  | Definición aprobada en esta tarea                                                                                                                                                                                               |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `MTPD`                    | Duración máxima de interrupción durante la cual el resultado empresarial puede permanecer por debajo de su MBCO antes de que el impacto residual pase a ser inaceptable. Es un límite empresarial, no un tiempo técnico medido. |
| `RTO`                     | Tiempo objetivo máximo desde la interrupción hasta restablecer el MBCO aplicable. No exige normalidad completa; exige capacidad mínima controlada y verificable.                                                                |
| `RPO`                     | Antigüedad máxima tolerable del estado recuperable necesario para reconstruir el resultado y sus efectos sin pérdida silenciosa. No autoriza borrar, omitir ni dar por inexistentes hechos comprometidos.                       |
| `MBCO`                    | Objetivo mínimo de continuidad del resultado empresarial. En esta tarea se fija su clase funcional; el volumen, capacidad, dotación y detalle cuantitativo se materializan en `CONT-DOM-007`.                                   |
| prioridad de recuperación | Orden empresarial de atención para recuperar MBCO. No es severidad de incidente, prioridad de ticket ni prioridad técnica de un componente.                                                                                     |
| aceptación de riesgo      | Decisión explícita, temporal y trazable por la autoridad aplicable para convivir con una brecha concreta. Esta tarea define elegibilidad y límites; no concede aceptaciones reales.                                             |

Reglas:


1. `RTO < MTPD` para todo perfil activo;
2. `RPO <= RTO` en los cuatro perfiles base, sin inferir que la arquitectura actual lo satisfaga;
3. el reloj comienza cuando el resultado empresarial queda por debajo de su MBCO, no cuando un técnico abre un ticket;
4. la recuperación de un componente no detiene el reloj si el resultado empresarial sigue por debajo del MBCO;
5. un objetivo más estricto impuesto por obligación legal, sanitaria, contractual, de seguridad o por evidencia local prevalece sobre el perfil base;
6. relajar un objetivo exige una nueva versión, justificación, revisión de dependencias y decisión de riesgo aplicable;
7. un horario cerrado puede reducir impacto inmediato, pero no altera silenciosamente el objetivo aprobado ni borra pendientes;
8. un MBCO puede ordenar detener de forma segura. Continuidad no significa operar a cualquier costo.

#### 5. Perfiles de objetivo de continuidad

Los cuatro perfiles son límites empresariales máximos de diseño. No son evidencia de capacidad implementada.

| Perfil         | Criticidad BIA base    |       MTPD |        RTO |        RPO | MBCO                           | Prioridad         | Regla de aceptación                                                                                                                                                            |
| -------------- | ---------------------- | ---------: | ---------: | ---------: | ------------------------------ | ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `CONT-OBJ-001` | `CRITICA_PROTECCION`   | **30 min** | **15 min** | **15 min** | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | `NO_ACEPTABLE_SIN_CONTROL_PROTECTOR`: nunca se acepta continuar de forma insegura, no autorizada o sin control obligatorio.                                                    |
| `CONT-OBJ-002` | `CRITICA_OPERACIONAL`  |    **4 h** |    **2 h** |    **1 h** | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | `EXCEPCION_TEMPORAL_SOLO_BAJO_MTPD`: una brecha solo puede evaluarse si el mínimo sigue protegido, existe tratamiento y el escenario permanece claramente por debajo del MTPD. |
| `CONT-OBJ-003` | `ALTA_CONTROL`         |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`: exige expediente, autoridad, compensación, vencimiento y capacidad de reconciliar lo diferido.                                         |
| `CONT-OBJ-004` | `DIFERIBLE_CONTROLADA` |   **72 h** |   **24 h** |   **24 h** | `DIFERIR_CON_TRAZABILIDAD`     | `PR-3_DIFERIBLE`  | `DIFERIMIENTO_CONTROLADO_CON_VENCIMIENTO`: el trabajo puede diferirse, no abandonarse; debe conservar cola, propietario, antigüedad, reanudación y cierre.                     |

Los valores son objetivos de negocio aprobados para diseño. Su factibilidad técnica, operativa y económica queda pendiente de demostración mediante estrategias, respaldos, runbooks y ejercicios. Una evidencia posterior puede exigir un objetivo más estricto; cualquier relajación debe seguir gobierno de cambio y riesgo.

#### 6. Semántica especial de `CRITICA_PROTECCION`

`CONT-OBJ-001` no ordena mantener la producción o transacción durante una falla. Su MBCO es conservar la capacidad de proteger, bloquear, detener, aislar, advertir, custodiar o registrar la decisión imprescindible.

Por tanto:

- si el control protector puede aplicarse inmediatamente mediante una vía segura ya autorizada, se aplica sin esperar la restauración normal;
- si no puede demostrarse el control protector, la operación afectada permanece detenida;
- `RTO = 15 min` fija el objetivo máximo para recuperar una capacidad mínima controlada de protección, no para reanudar automáticamente la operación ordinaria;
- `MTPD = 30 min` es el límite de exposición sin el MBCO protector disponible; no autoriza quince o treinta minutos de operación insegura;
- una decisión de riesgo no puede dispensar vida, SST, inocuidad, privacidad, integridad, autorización o auditoría no dispensables.

#### 7. Semántica de RPO y pérdida de información

RPO se aplica al estado necesario para reconstruir el resultado y sus efectos. No es permiso para perder definitivamente hechos.


1. un RPO de 1 h significa que la arquitectura de recuperación debe poder devolver un punto de estado con antigüedad no superior a una hora;
2. cualquier hecho posterior al punto restaurado que exista en evidencia, colas, documentos, proveedores o registros debe reincorporarse mediante reconciliación;
3. pagos, inventario, producción, asistencia, accesos, evidencias u otros efectos confirmados no pueden declararse inexistentes solo porque un respaldo sea más antiguo;
4. fuentes con requisitos más estrictos pueden tener RPO propio inferior al del servicio BIA;
5. la política física de respaldo y la demostración de restaurabilidad pertenecen a `CONT-DOM-011` y `CONT-DOM-014`.

#### 8. MBCO y frontera con operación mínima detallada

Esta tarea fija una decisión MBCO para cada servicio, pero no inventa volumen, número de trabajadores, inventario mínimo, transacciones por hora, capacidad de producción, terminales, formularios ni recursos alternos.


| MBCO                           | Resultado funcional protegido                                                                                   | Detalle que queda para `CONT-DOM-007`                                                         |
| ------------------------------ | --------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `PROTEGER_Y_DETENER`           | seguridad, integridad, custodia, control obligatorio y detención segura cuando no pueda sostenerse la operación | volumen cero o mínimo seguro por contexto, puntos de control, responsables, medios y duración |
| `MANTENER_RESULTADO_ESENCIAL`  | continuar el resultado empresarial esencial sin completar funciones accesorias                                  | volumen mínimo, sedes, horarios, dotación, cola aceptable, insumos y pasos mínimos            |
| `MANTENER_CONTROL_Y_EVIDENCIA` | preservar autoridad, expediente, obligaciones, conciliación y capacidad de reanudar                             | capacidad mínima administrativa, backlog, soportes, controles y ventanas                      |
| `DIFERIR_CON_TRAZABILIDAD`     | aceptar pausa controlada sin perder identidad, prioridad, evidencia ni propietario                              | cola máxima, orden de reanudación, antigüedad y capacidad de absorción posterior              |

#### 9. Prioridades de recuperación

| Prioridad         | Propósito                                                                                                       | Regla de entrada base      |
| ----------------- | --------------------------------------------------------------------------------------------------------------- | -------------------------- |
| `PR-0_PROTECCION` | restaurar primero la capacidad de proteger, detener, contener o evitar efectos irreversibles                    | BIA `CRITICA_PROTECCION`   |
| `PR-1_ESENCIAL`   | recuperar resultados operativos cuya ausencia detiene servicio, producción, logística, venta o soporte esencial | BIA `CRITICA_OPERACIONAL`  |
| `PR-2_CONTROL`    | recuperar control, expediente, conciliación, obligaciones y administración de alto impacto                      | BIA `ALTA_CONTROL`         |
| `PR-3_DIFERIBLE`  | recuperar trabajo que puede esperar bajo trazabilidad y backlog controlado                                      | BIA `DIFERIBLE_CONTROLADA` |

La prioridad actual no se obtiene únicamente de la criticidad. La criticidad define la entrada base; luego se evalúan modificadores. En la evidencia vigente no existen SPOF confirmados, sustitutos aprobados ni ciclos duros confirmados que justifiquen elevar o reducir una fila concreta. Por ello la materialización actual conserva la prioridad base y deja explícita la regla de revisión.


Orden de desempate dentro de una misma prioridad:

1. menor tiempo restante hasta MTPD;
2. riesgo inmediato de vida, SST, inocuidad, integridad, autorización, privacidad o efecto financiero irreversible;
3. mayor cantidad de servicios aguas abajo demostrablemente bloqueados por la misma dependencia;
4. compromiso legal, contractual, fiscal o con cliente cuyo vencimiento ocurra primero;
5. mayor antigüedad del backlog o del último estado recuperable;
6. capacidad de una recuperación común para desbloquear varios servicios sin crear un nuevo riesgo.


Un componente técnico no adquiere prioridad propia fuera del resultado empresarial que desbloquea.

#### 10. Criterios de aceptación de riesgo

Se aprueban cinco estados de decisión documental:


| Estado                    | Uso                                                                                                                                                                                             |
| ------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `DENTRO_DE_TOLERANCIA`    | evidencia vigente demuestra MBCO, RTO, RPO y demás controles dentro del objetivo aplicable; no requiere excepción por esa brecha.                                                               |
| `ELEGIBLE_PARA_EXCEPCION` | existe una brecha concreta, pero puede someterse a decisión temporal porque no viola un control no dispensable, permanece por debajo de MTPD y tiene compensación, propietario y salida.        |
| `ACEPTADO_TEMPORALMENTE`  | solo existe después de una decisión explícita de la autoridad aplicable, con vigencia y evidencia. Esta tarea no crea ninguna.                                                                  |
| `NO_ACEPTABLE`            | el escenario incumple una condición no dispensable, alcanza o puede superar MTPD sin tratamiento suficiente, no preserva MBCO, produce pérdida irreconciliable o carece de autoridad/evidencia. |
| `BLOQUEADO`               | no puede evaluarse operativamente porque la capacidad objetivo permanece diferida o falta el prerrequisito canónico que habilita la decisión.                                                   |

Una aceptación futura exige conjuntamente:

1. servicio, BIA, proceso, sede/alcance, horario/ventana y versión exactos;
2. brecha cuantificada contra MTPD, RTO, RPO o MBCO;
3. causa o condición que impide el cumplimiento;
4. propietario del riesgo distinto de la evidencia puramente técnica;
5. análisis de dependencias y concentración aplicable;
6. controles compensatorios verificables;
7. vigencia y vencimiento explícitos;
8. disparadores de revocación;
9. plan de salida con tarea, responsable y condición de cierre;
10. impacto residual sobre clientes, personas, dinero, inventario, producción, privacidad, seguridad, regulación y terceros cuando aplique;
11. tratamiento de datos pendientes, pérdida potencial y reconciliación;
12. revisión por continuidad, proceso, riesgo y funciones afectadas;
13. aprobación por la autoridad de riesgo/gobierno aplicable sin autoaprobación del mismo control crítico;
14. evidencia correlacionable de actor, decisión, razones, versión y timestamp;
15. reevaluación después de incidente, ejercicio, cambio material o nueva evidencia.

#### 11. Condiciones que nunca son elegibles para aceptación ordinaria

No se considera elegible para excepción ordinaria un escenario que:

- requiera operar sin un control de vida, SST, inocuidad o seguridad obligatorio;
- requiera conceder acceso no autorizado, compartir credenciales o eliminar segregación esencial;
- implique pérdida conocida de hechos que no puedan reconstruirse ni conciliarse;
- permita superar MTPD sin una decisión de suspensión/protección y tratamiento ejecutivo explícito;
- presente una copia, proveedor, sede o dispositivo como sustituto sin demostrar independencia y capacidad;
- dependa de una persona, proveedor o recurso no identificado como si estuviera disponible;
- elimine auditoría, evidencia, privacidad, retención o integridad requeridas;
- convierta una excepción vencida en estado permanente por silencio;
- declare readiness usando estimaciones no probadas como si fueran resultados observados.

#### 12. Estado actual de cumplimiento frente a los objetivos

Las tareas anteriores aportan BIA y dependencias, pero la evidencia vigente conserva cero SPOF confirmados, cero sustitutos aprobados y no presenta ejercicios de recuperación que demuestren los tiempos de estas 69 filas. En consecuencia:


- **67** servicios reciben objetivo activo `OBJETIVO_DEFINIDO_NO_VALIDADO`;
- **2** servicios AURA conservan `BLOQUEADO_POR_APLICACION_DIFERIDA`;
- **0** servicios reciben `DENTRO_DE_TOLERANCIA` por inferencia;
- **0** riesgos reciben `ACEPTADO_TEMPORALMENTE`;
- **0** capacidades se declaran listas;
- los objetivos deberán compararse con capacidad real en las tareas de estrategia, respaldo, recuperación y ejercicios.

#### 13. Matriz materializada de objetivos por servicio

La matriz conserva cada identidad heredada y produce una decisión explícita de MTPD, RTO, RPO, MBCO, prioridad y estado de riesgo. Para AURA, el perfil base se conserva como referencia de política, pero el objetivo operativo permanece bloqueado hasta que la capacidad deje de estar diferida.

|    # | Servicio         | BIA                 | Proceso      | Propietaria | Criticidad             | Perfil         |       MTPD |        RTO |        RPO | MBCO                           | Prioridad         | Criterio de riesgo                        | Estado objetivo                     | Estado de riesgo                      |
| ---: | ---------------- | ------------------- | ------------ | ----------- | ---------------------- | -------------- | ---------: | ---------: | ---------: | ------------------------------ | ----------------- | ----------------------------------------- | ----------------------------------- | ------------------------------------- |
|    1 | `BCS-VPROC-0001` | `BIA-VPROC-0001-V1` | `VPROC-0001` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|    2 | `BCS-VPROC-0002` | `BIA-VPROC-0002-V1` | `VPROC-0002` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|    3 | `BCS-VPROC-0003` | `BIA-VPROC-0003-V1` | `VPROC-0003` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|    4 | `BCS-VPROC-0004` | `BIA-VPROC-0004-V1` | `VPROC-0004` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|    5 | `BCS-VPROC-0005` | `BIA-VPROC-0005-V1` | `VPROC-0005` | `viso`      | `DIFERIBLE_CONTROLADA` | `CONT-OBJ-004` |   **72 h** |   **24 h** |   **24 h** | `DIFERIR_CON_TRAZABILIDAD`     | `PR-3_DIFERIBLE`  | `DIFERIMIENTO_CONTROLADO_CON_VENCIMIENTO` | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|    6 | `BCS-VPROC-0006` | `BIA-VPROC-0006-V1` | `VPROC-0006` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|    7 | `BCS-VPROC-0007` | `BIA-VPROC-0007-V1` | `VPROC-0007` | `viso`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    **4 h** |    **2 h** |    **1 h** | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | `EXCEPCION_TEMPORAL_SOLO_BAJO_MTPD`       | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|    8 | `BCS-VPROC-0008` | `BIA-VPROC-0008-V1` | `VPROC-0008` | `anima`     | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|    9 | `BCS-VPROC-0009` | `BIA-VPROC-0009-V1` | `VPROC-0009` | `viso`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    **4 h** |    **2 h** |    **1 h** | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | `EXCEPCION_TEMPORAL_SOLO_BAJO_MTPD`       | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   10 | `BCS-VPROC-0010` | `BIA-VPROC-0010-V1` | `VPROC-0010` | `numera`    | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   11 | `BCS-VPROC-0011` | `BIA-VPROC-0011-V1` | `VPROC-0011` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   12 | `BCS-VPROC-0012` | `BIA-VPROC-0012-V1` | `VPROC-0012` | `viso`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001` | **30 min** | **15 min** | **15 min** | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | `NO_ACEPTABLE_SIN_CONTROL_PROTECTOR`      | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   13 | `BCS-VPROC-0013` | `BIA-VPROC-0013-V1` | `VPROC-0013` | `viso`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001` | **30 min** | **15 min** | **15 min** | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | `NO_ACEPTABLE_SIN_CONTROL_PROTECTOR`      | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   14 | `BCS-VPROC-0014` | `BIA-VPROC-0014-V1` | `VPROC-0014` | `viso`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001` | **30 min** | **15 min** | **15 min** | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | `NO_ACEPTABLE_SIN_CONTROL_PROTECTOR`      | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   15 | `BCS-VPROC-0015` | `BIA-VPROC-0015-V1` | `VPROC-0015` | `nexo`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   16 | `BCS-VPROC-0016` | `BIA-VPROC-0016-V1` | `VPROC-0016` | `fogo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    **4 h** |    **2 h** |    **1 h** | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | `EXCEPCION_TEMPORAL_SOLO_BAJO_MTPD`       | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   17 | `BCS-VPROC-0017` | `BIA-VPROC-0017-V1` | `VPROC-0017` | `pulso`     | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    **4 h** |    **2 h** |    **1 h** | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | `EXCEPCION_TEMPORAL_SOLO_BAJO_MTPD`       | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   18 | `BCS-VPROC-0018` | `BIA-VPROC-0018-V1` | `VPROC-0018` | `nexo`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001` | **30 min** | **15 min** | **15 min** | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | `NO_ACEPTABLE_SIN_CONTROL_PROTECTOR`      | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   19 | `BCS-VPROC-0019` | `BIA-VPROC-0019-V1` | `VPROC-0019` | `origo`     | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   20 | `BCS-VPROC-0020` | `BIA-VPROC-0020-V1` | `VPROC-0020` | `origo`     | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   21 | `BCS-VPROC-0021` | `BIA-VPROC-0021-V1` | `VPROC-0021` | `origo`     | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   22 | `BCS-VPROC-0022` | `BIA-VPROC-0022-V1` | `VPROC-0022` | `origo`     | `CRITICA_PROTECCION`   | `CONT-OBJ-001` | **30 min** | **15 min** | **15 min** | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | `NO_ACEPTABLE_SIN_CONTROL_PROTECTOR`      | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   23 | `BCS-VPROC-0023` | `BIA-VPROC-0023-V1` | `VPROC-0023` | `nexo`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   24 | `BCS-VPROC-0024` | `BIA-VPROC-0024-V1` | `VPROC-0024` | `nexo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    **4 h** |    **2 h** |    **1 h** | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | `EXCEPCION_TEMPORAL_SOLO_BAJO_MTPD`       | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   25 | `BCS-VPROC-0025` | `BIA-VPROC-0025-V1` | `VPROC-0025` | `nexo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    **4 h** |    **2 h** |    **1 h** | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | `EXCEPCION_TEMPORAL_SOLO_BAJO_MTPD`       | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   26 | `BCS-VPROC-0026` | `BIA-VPROC-0026-V1` | `VPROC-0026` | `nexo`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   27 | `BCS-VPROC-0027` | `BIA-VPROC-0027-V1` | `VPROC-0027` | `nexo`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001` | **30 min** | **15 min** | **15 min** | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | `NO_ACEPTABLE_SIN_CONTROL_PROTECTOR`      | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   28 | `BCS-VPROC-0028` | `BIA-VPROC-0028-V1` | `VPROC-0028` | `nexo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    **4 h** |    **2 h** |    **1 h** | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | `EXCEPCION_TEMPORAL_SOLO_BAJO_MTPD`       | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   29 | `BCS-VPROC-0029` | `BIA-VPROC-0029-V1` | `VPROC-0029` | `nexo`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   30 | `BCS-VPROC-0030` | `BIA-VPROC-0030-V1` | `VPROC-0030` | `nexo`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   31 | `BCS-VPROC-0031` | `BIA-VPROC-0031-V1` | `VPROC-0031` | `nexo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    **4 h** |    **2 h** |    **1 h** | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | `EXCEPCION_TEMPORAL_SOLO_BAJO_MTPD`       | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   32 | `BCS-VPROC-0032` | `BIA-VPROC-0032-V1` | `VPROC-0032` | `nexo`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   33 | `BCS-VPROC-0033` | `BIA-VPROC-0033-V1` | `VPROC-0033` | `fogo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    **4 h** |    **2 h** |    **1 h** | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | `EXCEPCION_TEMPORAL_SOLO_BAJO_MTPD`       | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   34 | `BCS-VPROC-0034` | `BIA-VPROC-0034-V1` | `VPROC-0034` | `fogo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    **4 h** |    **2 h** |    **1 h** | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | `EXCEPCION_TEMPORAL_SOLO_BAJO_MTPD`       | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   35 | `BCS-VPROC-0035` | `BIA-VPROC-0035-V1` | `VPROC-0035` | `fogo`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001` | **30 min** | **15 min** | **15 min** | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | `NO_ACEPTABLE_SIN_CONTROL_PROTECTOR`      | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   36 | `BCS-VPROC-0036` | `BIA-VPROC-0036-V1` | `VPROC-0036` | `fogo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    **4 h** |    **2 h** |    **1 h** | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | `EXCEPCION_TEMPORAL_SOLO_BAJO_MTPD`       | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   37 | `BCS-VPROC-0037` | `BIA-VPROC-0037-V1` | `VPROC-0037` | `fogo`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   38 | `BCS-VPROC-0038` | `BIA-VPROC-0038-V1` | `VPROC-0038` | `pulso`     | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    **4 h** |    **2 h** |    **1 h** | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | `EXCEPCION_TEMPORAL_SOLO_BAJO_MTPD`       | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   39 | `BCS-VPROC-0039` | `BIA-VPROC-0039-V1` | `VPROC-0039` | `pulso`     | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    **4 h** |    **2 h** |    **1 h** | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | `EXCEPCION_TEMPORAL_SOLO_BAJO_MTPD`       | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   40 | `BCS-VPROC-0040` | `BIA-VPROC-0040-V1` | `VPROC-0040` | `pulso`     | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    **4 h** |    **2 h** |    **1 h** | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | `EXCEPCION_TEMPORAL_SOLO_BAJO_MTPD`       | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   41 | `BCS-VPROC-0041` | `BIA-VPROC-0041-V1` | `VPROC-0041` | `pulso`     | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    **4 h** |    **2 h** |    **1 h** | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | `EXCEPCION_TEMPORAL_SOLO_BAJO_MTPD`       | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   42 | `BCS-VPROC-0042` | `BIA-VPROC-0042-V1` | `VPROC-0042` | `pulso`     | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    **4 h** |    **2 h** |    **1 h** | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | `EXCEPCION_TEMPORAL_SOLO_BAJO_MTPD`       | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   43 | `BCS-VPROC-0043` | `BIA-VPROC-0043-V1` | `VPROC-0043` | `pulso`     | `CRITICA_PROTECCION`   | `CONT-OBJ-001` | **30 min** | **15 min** | **15 min** | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | `NO_ACEPTABLE_SIN_CONTROL_PROTECTOR`      | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   44 | `BCS-VPROC-0044` | `BIA-VPROC-0044-V1` | `VPROC-0044` | `pulso`     | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   45 | `BCS-VPROC-0045` | `BIA-VPROC-0045-V1` | `VPROC-0045` | `pass`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   46 | `BCS-VPROC-0046` | `BIA-VPROC-0046-V1` | `VPROC-0046` | `pulso`     | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   47 | `BCS-VPROC-0047` | `BIA-VPROC-0047-V1` | `VPROC-0047` | `pulso`     | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   48 | `BCS-VPROC-0048` | `BIA-VPROC-0048-V1` | `VPROC-0048` | `nexo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    **4 h** |    **2 h** |    **1 h** | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | `EXCEPCION_TEMPORAL_SOLO_BAJO_MTPD`       | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   49 | `BCS-VPROC-0049` | `BIA-VPROC-0049-V1` | `VPROC-0049` | `nexo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    **4 h** |    **2 h** |    **1 h** | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | `EXCEPCION_TEMPORAL_SOLO_BAJO_MTPD`       | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   50 | `BCS-VPROC-0050` | `BIA-VPROC-0050-V1` | `VPROC-0050` | `pulso`     | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    **4 h** |    **2 h** |    **1 h** | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | `EXCEPCION_TEMPORAL_SOLO_BAJO_MTPD`       | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   51 | `BCS-VPROC-0051` | `BIA-VPROC-0051-V1` | `VPROC-0051` | `numera`    | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   52 | `BCS-VPROC-0052` | `BIA-VPROC-0052-V1` | `VPROC-0052` | `numera`    | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   53 | `BCS-VPROC-0053` | `BIA-VPROC-0053-V1` | `VPROC-0053` | `numera`    | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   54 | `BCS-VPROC-0054` | `BIA-VPROC-0054-V1` | `VPROC-0054` | `numera`    | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   55 | `BCS-VPROC-0055` | `BIA-VPROC-0055-V1` | `VPROC-0055` | `nexo`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001` | **30 min** | **15 min** | **15 min** | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | `NO_ACEPTABLE_SIN_CONTROL_PROTECTOR`      | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   56 | `BCS-VPROC-0056` | `BIA-VPROC-0056-V1` | `VPROC-0056` | `aura`      | `DIFERIBLE_CONTROLADA` | `CONT-OBJ-004` |   **72 h** |   **24 h** |   **24 h** | `DIFERIR_CON_TRAZABILIDAD`     | `PR-3_DIFERIBLE`  | `DIFERIMIENTO_CONTROLADO_CON_VENCIMIENTO` | `BLOQUEADO_POR_APLICACION_DIFERIDA` | `BLOQUEADO_POR_APLICACION_DIFERIDA`   |
|   57 | `BCS-VPROC-0057` | `BIA-VPROC-0057-V1` | `VPROC-0057` | `aura`      | `DIFERIBLE_CONTROLADA` | `CONT-OBJ-004` |   **72 h** |   **24 h** |   **24 h** | `DIFERIR_CON_TRAZABILIDAD`     | `PR-3_DIFERIBLE`  | `DIFERIMIENTO_CONTROLADO_CON_VENCIMIENTO` | `BLOQUEADO_POR_APLICACION_DIFERIDA` | `BLOQUEADO_POR_APLICACION_DIFERIDA`   |
|   58 | `BCS-VPROC-0058` | `BIA-VPROC-0058-V1` | `VPROC-0058` | `viso`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002` |    **4 h** |    **2 h** |    **1 h** | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`   | `EXCEPCION_TEMPORAL_SOLO_BAJO_MTPD`       | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   59 | `BCS-VPROC-0059` | `BIA-VPROC-0059-V1` | `VPROC-0059` | `viso`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001` | **30 min** | **15 min** | **15 min** | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | `NO_ACEPTABLE_SIN_CONTROL_PROTECTOR`      | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   60 | `BCS-VPROC-0060` | `BIA-VPROC-0060-V1` | `VPROC-0060` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   61 | `BCS-VPROC-0061` | `BIA-VPROC-0061-V1` | `VPROC-0061` | `numera`    | `DIFERIBLE_CONTROLADA` | `CONT-OBJ-004` |   **72 h** |   **24 h** |   **24 h** | `DIFERIR_CON_TRAZABILIDAD`     | `PR-3_DIFERIBLE`  | `DIFERIMIENTO_CONTROLADO_CON_VENCIMIENTO` | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   62 | `BCS-VPROC-0062` | `BIA-VPROC-0062-V1` | `VPROC-0062` | `viso`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001` | **30 min** | **15 min** | **15 min** | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | `NO_ACEPTABLE_SIN_CONTROL_PROTECTOR`      | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   63 | `BCS-VPROC-0063` | `BIA-VPROC-0063-V1` | `VPROC-0063` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   64 | `BCS-VPROC-0064` | `BIA-VPROC-0064-V1` | `VPROC-0064` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   65 | `BCS-VPROC-0065` | `BIA-VPROC-0065-V1` | `VPROC-0065` | `viso`      | `DIFERIBLE_CONTROLADA` | `CONT-OBJ-004` |   **72 h** |   **24 h** |   **24 h** | `DIFERIR_CON_TRAZABILIDAD`     | `PR-3_DIFERIBLE`  | `DIFERIMIENTO_CONTROLADO_CON_VENCIMIENTO` | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   66 | `BCS-VPROC-0066` | `BIA-VPROC-0066-V1` | `VPROC-0066` | `viso`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001` | **30 min** | **15 min** | **15 min** | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION` | `NO_ACEPTABLE_SIN_CONTROL_PROTECTOR`      | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   67 | `BCS-VPROC-0067` | `BIA-VPROC-0067-V1` | `VPROC-0067` | `nexo`      | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   68 | `BCS-VPROC-0068` | `BIA-VPROC-0068-V1` | `VPROC-0068` | `pulso`     | `DIFERIBLE_CONTROLADA` | `CONT-OBJ-004` |   **72 h** |   **24 h** |   **24 h** | `DIFERIR_CON_TRAZABILIDAD`     | `PR-3_DIFERIBLE`  | `DIFERIMIENTO_CONTROLADO_CON_VENCIMIENTO` | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |
|   69 | `BCS-VPROC-0069` | `BIA-VPROC-0069-V1` | `VPROC-0069` | `numera`    | `ALTA_CONTROL`         | `CONT-OBJ-003` |   **24 h** |    **8 h** |    **4 h** | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`    | `EXCEPCION_ACOTADA_CON_RECONCILIACION`    | `OBJETIVO_DEFINIDO_NO_VALIDADO`     | `NO_ACEPTADO_PENDIENTE_DE_VALIDACION` |

#### 14. Reconciliación de identidades y distribuciones

La matriz conserva:


- **69** servicios `BCS-*` únicos;
- **69** BIA `BIA-*` únicos;
- **69** procesos `VPROC-*` únicos;
- **0** faltantes;
- **0** duplicados;
- **0** propietarias múltiples;
- **2** filas AURA bloqueadas y ninguna fila adicional bloqueada.


Distribución de propietarias:


| Aplicación | Servicios |
| ---------- | --------: |
| `anima`    |     **1** |
| `viso`     |    **20** |
| `nexo`     |    **16** |
| `fogo`     |     **6** |
| `origo`    |     **4** |
| `pulso`    |    **12** |
| `numera`   |     **7** |
| `aura`     |     **2** |
| `pass`     |     **1** |
| `shell`    |     **0** |
| **Total**  |    **69** |

Distribución de criticidad y perfil:


| Criticidad             | Servicios | Perfil         |
| ---------------------- | --------: | -------------- |
| `CRITICA_PROTECCION`   |    **12** | `CONT-OBJ-001` |
| `CRITICA_OPERACIONAL`  |    **20** | `CONT-OBJ-002` |
| `ALTA_CONTROL`         |    **31** | `CONT-OBJ-003` |
| `DIFERIBLE_CONTROLADA` |     **6** | `CONT-OBJ-004` |
| **Total**              |    **69** | —              |

Distribución de prioridad operativamente activable en la fase objetivo:


| Prioridad                           | Servicios no bloqueados |
| ----------------------------------- | ----------------------: |
| `PR-0_PROTECCION`                   |                  **12** |
| `PR-1_ESENCIAL`                     |                  **20** |
| `PR-2_CONTROL`                      |                  **31** |
| `PR-3_DIFERIBLE`                    |                   **4** |
| `BLOQUEADO_POR_APLICACION_DIFERIDA` |                   **2** |
| **Total**                           |                  **69** |

#### 15. Caso AURA

`VPROC-0056` y `VPROC-0057` conservan BIA, identidad y perfil de política `CONT-OBJ-004`, pero sus campos de capacidad operativa permanecen bloqueados por aplicación diferida.


Reglas:

1. el perfil de política no autoriza activar AURA ni contratar un proveedor;
2. los valores de `CONT-OBJ-004` no se presentan como compromiso operativo de una aplicación no habilitada;
3. no se crea una aceptación de riesgo para sortear el bloqueo;
4. cuando AURA tenga decisión canónica de continuidad y capacidad operativa habilitada, deberá revalidar dependencias, MBCO y factibilidad antes de declarar cumplimiento del perfil.

#### 16. Modificadores de objetivo y prioridad

Una versión posterior puede endurecer un objetivo o elevar prioridad cuando exista evidencia de:

- obligación legal, contractual, sanitaria, laboral, fiscal o de privacidad más estricta;
- ventana de negocio o temporada que reduzca el tiempo disponible;
- dependencia compartida con fan-out demostrado;
- SPOF confirmado;
- ausencia demostrada de sustituto para un resultado esencial;
- volumen o backlog que no pueda recuperarse dentro de la ventana;
- incidente o ejercicio que demuestre degradación más rápida que la asumida;
- pérdida de datos o reconciliación que exija RPO menor;
- dependencia de seguridad o integridad que exija control inmediato.


Reducir prioridad, ampliar MTPD/RTO/RPO o bajar MBCO exige evidencia equivalente, nueva versión y decisión de riesgo/gobierno; nunca ocurre por silencio, costo estimado, dificultad técnica o preferencia del proveedor.

#### 17. Evidencia mínima para declarar capacidad dentro de objetivo

Un servicio solo podrá pasar de `OBJETIVO_DEFINIDO_NO_VALIDADO` a una afirmación de cumplimiento cuando exista evidencia suficiente de:

1. escenario y alcance de prueba;
2. instante verificable de caída por debajo de MBCO;
3. instante verificable de recuperación de MBCO;
4. RTO observado;
5. punto de recuperación y RPO observado;
6. volumen/capacidad mínima realmente sostenida;
7. personas y autoridades que participaron;
8. dependencias, proveedores y recursos usados;
9. datos, pendientes y reconciliación posteriores;
10. seguridad, privacidad, calidad e integridad preservadas;
11. desviaciones y acciones abiertas;
12. comparación directa con el perfil aplicable;
13. evidencia de que una ruta aparentemente redundante no comparte silenciosamente el mismo dominio de fallo;
14. versión del BIA, objetivos, estrategia y runbook usados.

#### 18. Handoffs obligatorios

| Decisión posterior                                        | Propietario documental            | Condición de salida                                                                               |
| --------------------------------------------------------- | --------------------------------- | ------------------------------------------------------------------------------------------------- |
| taxonomía, severidad, activación y cierre de incidentes   | `CONT-DOM-005`                    | la severidad usa impacto real y tiempo restante, sin sustituir prioridad de recuperación          |
| mando, suplencia y autoridad de crisis                    | `CONT-DOM-006` y `CONT-AUTH-*`    | actores, suplentes, segregación y autoridad aplicables antes de decisiones reales                 |
| MBCO cuantificado por sede, horario, temporada y duración | `CONT-DOM-007`                    | volumen, dotación, backlog, insumos y capacidad mínima compatibles con el perfil de esta tarea    |
| modalidad de contingencia                                 | `CONT-DOM-008`                    | estrategia capaz de sostener MBCO dentro de RTO sin violar controles                              |
| captura durante falla                                     | `CONT-DOM-009`                    | registros controlados que permitan cumplir RPO y reconciliación                                   |
| reincorporación y conflictos                              | `CONT-DOM-010`                    | hechos posteriores al punto restaurado reincorporables sin duplicidad ni sobrescritura silenciosa |
| respaldo y cobertura                                      | `CONT-DOM-011`                    | fuentes y retención capaces de soportar el RPO objetivo, pendientes de prueba                     |
| runbooks, recuperación y retorno                          | `CONT-DOM-012`                    | secuencia capaz de alcanzar MBCO dentro de RTO y validar resultado empresarial                    |
| proveedores, energía, red, pagos, transporte y canales    | `CONT-DOM-013`                    | continuidad externa y alternativas compatibles con los objetivos                                  |
| ejercicios y tiempos observados                           | `CONT-DOM-014`                    | RTO/RPO/MBCO observados y comparados con esta matriz                                              |
| actualización por evidencia                               | `CONT-DOM-015`                    | objetivos, dependencias y estrategias revisados cuando la evidencia contradiga supuestos          |
| autoridad detallada para aceptar riesgo                   | `CONT-AUTH-001` a `CONT-AUTH-004` | capacidad, segregación y evidencia de la decisión antes de aceptar una brecha real                |

#### 19. Versionado y disparadores de revisión

Una versión de objetivo deberá conservar servicio, BIA, proceso, perfil, MTPD, RTO, RPO, MBCO, prioridad, supuestos, estado de evidencia, preparadores/revisores/aprobador aplicables, vigencia, motivo y versión sustituida.


Revisión obligatoria cuando cambie: criticidad BIA, MBCO, sede/horario/temporada material, obligación externa, dependencia, SPOF, sustituto, proveedor, arquitectura, respaldo, runbook, resultado de ejercicio, tiempo observado, volumen mínimo o aceptación de riesgo. No se reescribe la versión histórica usada en un incidente o ejercicio.

#### 20. Cobertura de requisitos vigente

El requisito canónico de continuidad vigente ya exige por capacidad crítica análisis de impacto y dependencias, nivel mínimo, impacto por duración, pérdida máxima tolerable, MTPD, RTO, RPO, prioridad y supuestos. La auditoría transversal vigente exige preservar actor, decisión, razones, versión y timestamp, y el contrato de integración de continuidad exige correlación durante degradación, recuperación y retorno.


Esta tarea materializa esas obligaciones para los 69 servicios y no introduce una nueva acción ejecutable, un mecanismo de failover, una excepción efectiva ni un nuevo efecto empresarial.


#### 21. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** los objetivos de continuidad, su prioridad, la evidencia requerida y los criterios de aceptación de riesgo materializados aquí especializan obligaciones ya registradas para el bloque. La tarea no agrega una conducta ejecutable, no cambia el estado de un requisito vigente y no implementa recuperación, respaldo, contingencia, acceso de emergencia ni aceptación real de riesgo.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 22. Criterios de aceptación

1. se preservan exactamente 69 servicios `BCS-VPROC-0001` a `BCS-VPROC-0069`;
2. cada servicio conserva exactamente una referencia `BIA-VPROC-####-V1`;
3. cada servicio conserva su `VPROC-*` sin renumeración;
4. cada servicio conserva una sola aplicación propietaria;
5. la distribución de propietarias suma exactamente 69;
6. SHELL conserva cero procesos propietarios;
7. AURA conserva exactamente dos procesos;
8. las dos filas AURA permanecen bloqueadas por aplicación diferida;
9. las otras 67 filas reciben objetivo activo definido pero no validado;
10. existen exactamente cuatro perfiles de objetivo;
11. cada perfil define MTPD;
12. cada perfil define RTO;
13. cada perfil define RPO;
14. cada perfil define MBCO;
15. cada perfil define prioridad de recuperación;
16. cada perfil define regla de aceptación de riesgo;
17. todo RTO activo es menor que su MTPD;
18. todo RPO base es menor o igual que su RTO;
19. MTPD se mide contra ausencia de MBCO y no contra apertura de ticket;
20. RTO restaura MBCO y no se confunde con normalidad completa;
21. RPO no autoriza pérdida definitiva de hechos confirmados;
22. MBCO se separa de volumen mínimo cuantitativo;
23. la cuantificación detallada de MBCO permanece en `CONT-DOM-007`;
24. `CRITICA_PROTECCION` conserva `PROTEGER_Y_DETENER`;
25. `CRITICA_OPERACIONAL` conserva `MANTENER_RESULTADO_ESENCIAL`;
26. `ALTA_CONTROL` conserva `MANTENER_CONTROL_Y_EVIDENCIA`;
27. `DIFERIBLE_CONTROLADA` conserva `DIFERIR_CON_TRAZABILIDAD`;
28. la distribución de criticidad permanece 12/20/31/6;
29. la prioridad no se declara severidad de incidente;
30. la prioridad no se declara prioridad de ticket;
31. la prioridad no se declara prioridad intrínseca de componente técnico;
32. las 12 filas de protección reciben `PR-0_PROTECCION`;
33. las 20 filas operacionales reciben `PR-1_ESENCIAL`;
34. las 31 filas de alto control reciben `PR-2_CONTROL`;
35. las cuatro filas diferibles no bloqueadas reciben `PR-3_DIFERIBLE`;
36. las dos filas diferibles AURA permanecen bloqueadas operativamente;
37. no se inventa un modificador por SPOF porque existen cero SPOF confirmados;
38. no se inventa un modificador por sustituto porque existen cero sustitutos aprobados;
39. no se inventa un modificador por ciclo duro porque existen cero ciclos duros confirmados;
40. el desempate prioriza tiempo restante hasta MTPD;
41. el desempate considera controles no reversibles y obligaciones reales;
42. un fan-out solo modifica prioridad cuando está demostrado;
43. un objetivo más estricto puede prevalecer con evidencia aplicable;
44. relajar un objetivo exige versión y gobierno;
45. horario cerrado no relaja silenciosamente el objetivo;
46. temporada o volumen no cambian objetivo por inferencia;
47. se distinguen objetivo definido y capacidad validada;
48. se distinguen tiempo objetivo y tiempo observado;
49. se distinguen riesgo elegible y riesgo aceptado;
50. se distinguen aceptación temporal y política permanente;
51. esta tarea acepta exactamente cero riesgos;
52. esta tarea declara exactamente cero capacidades validadas;
53. ningún servicio recibe `DENTRO_DE_TOLERANCIA` sin evidencia;
54. un riesgo que alcance o pueda superar MTPD sin tratamiento suficiente es `NO_ACEPTABLE`;
55. un escenario sin MBCO protector no es elegible cuando compromete controles no dispensables;
56. una excepción no puede conceder acceso no autorizado;
57. una excepción no puede eliminar auditoría requerida;
58. una excepción no puede normalizar pérdida irreconciliable;
59. una excepción requiere objeto y alcance exactos;
60. una excepción requiere brecha cuantificada contra objetivo;
61. una excepción requiere propietario del riesgo;
62. una excepción requiere controles compensatorios;
63. una excepción requiere vigencia y vencimiento;
64. una excepción requiere condiciones de revocación;
65. una excepción requiere plan de salida;
66. una excepción requiere autoridad aplicable;
67. una excepción conserva actor, razones, versión y timestamp;
68. una excepción vencida no se extiende por silencio;
69. un proveedor no puede aceptar riesgo en nombre de Vento;
70. una automatización no puede aceptar riesgo;
71. la recuperación técnica no certifica recuperación empresarial;
72. la evidencia de cumplimiento exige instante de interrupción y de recuperación de MBCO;
73. la evidencia de cumplimiento exige RTO observado;
74. la evidencia de cumplimiento exige RPO observado;
75. la evidencia de cumplimiento exige capacidad mínima sostenida;
76. la evidencia de cumplimiento exige reconciliación de pendientes;
77. la evidencia de cumplimiento exige seguridad, privacidad e integridad preservadas;
78. la evidencia de cumplimiento exige versión de BIA, objetivo, estrategia y runbook;
79. `CONT-DOM-005` permanece propietario de severidad y activación;
80. `CONT-DOM-006` permanece propietario de mando y suplencia;
81. `CONT-DOM-007` permanece propietario del MBCO cuantificado;
82. `CONT-DOM-008` permanece propietario de modalidades de contingencia;
83. `CONT-DOM-009` permanece propietario de captura durante falla;
84. `CONT-DOM-010` permanece propietario de reincorporación;
85. `CONT-DOM-011` permanece propietario de respaldo;
86. `CONT-DOM-012` permanece propietario de runbooks y recuperación;
87. `CONT-DOM-013` permanece propietario de continuidad externa;
88. `CONT-DOM-014` permanece propietario de ejercicios y tiempos observados;
89. `CONT-DOM-015` permanece propietario de actualización por evidencia;
90. `CONT-AUTH-*` permanece propietario de autoridad detallada para decisiones reales;
91. no se crea una sede alternativa;
92. Vaila no se convierte en sede;
93. Catering no se convierte en sede;
94. no se inventa proveedor, red, endpoint, respaldo ni sustituto;
95. no se modifica ningún requisito de prueba;
96. no se modifica código, DDL, DML, datos, configuración ni Supabase;
97. no se ejecuta respaldo, restauración, failover, interrupción ni ejercicio productivo;
98. `CONT-DOM-005` permanece únicamente reservada;

#### 23. Balance de cierre

| Control                                  |   Resultado |
| ---------------------------------------- | ----------: |
| Servicios con decisión completa          | **69 / 69** |
| MTPD materializados                      |      **69** |
| RTO materializados                       |      **69** |
| RPO materializados                       |      **69** |
| MBCO materializados                      |      **69** |
| Prioridades materializadas               |      **69** |
| Estados de riesgo materializados         |      **69** |
| Objetivos activos no validados           |      **67** |
| Bloqueos AURA                            |       **2** |
| Riesgos aceptados                        |       **0** |
| Capacidades validadas                    |       **0** |
| Criterios de aceptación                  |      **98** |
| Requisitos de prueba creados/modificados |       **0** |
| Cambios físicos                          |       **0** |

---

#### 24. Límites de la tarea

Esta tarea no:

- certifica que los objetivos sean alcanzables con la arquitectura actual;
- afirma que un respaldo existente cumpla RPO;
- afirma que un runbook existente cumpla RTO;
- declara un SPOF, sustituto o proveedor alternativo nuevo;
- define severidad, activación o cierre de incidentes;
- cuantifica volumen, dotación o capacidad física del MBCO;
- selecciona operación manual, offline, snapshot, sede alternativa o failover;
- acepta un riesgo real;
- concede una excepción;
- modifica autorizaciones;
- cambia datos, código, configuración, infraestructura, proveedores o Supabase;
- ejecuta pruebas operativas o recuperación;
- declara readiness.

#### 25. Continuidad

ÚLTIMA TAREA APROBADA
`CONT-DOM-003 — Definir mapa de dependencias, recursos críticos, single points of failure y sustitutos`

TAREA ACTUAL APROBADA
`CONT-DOM-004 — Definir MTPD, RTO, RPO, MBCO, prioridades y criterios de aceptación de riesgo`

SIGUIENTE TAREA RESERVADA
`CONT-DOM-005 — Definir taxonomía, severidad, declaración, activación, escalamiento, desactivación y cierre de incidentes de continuidad`


### ✅ CONT-DOM-005 — Definir taxonomía, severidad, declaración, activación, escalamiento, desactivación y cierre de incidentes de continuidad

**Estado:** APROBADA
**Tarea anterior:** `CONT-DOM-004 — Definir MTPD, RTO, RPO, MBCO, prioridades y criterios de aceptación de riesgo` — APROBADA
**Tarea siguiente:** `CONT-DOM-006 — Definir mando, sustitución, bitácora de decisiones, comunicación de crisis y coordinación externa` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materialización del ciclo empresarial de incidentes de continuidad, su taxonomía, clasificación por alcance/impacto/urgencia/severidad, declaración, activación, escalamiento, desactivación y cierre
**Bloque:** AC — Continuidad operativa y recuperación
**Fase:** exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`
**Implementación técnica u operativa:** no autorizada
**Activación real de continuidad, cambios de permisos, acceso de emergencia, interrupciones, failover, restauraciones, cambios de proveedores, código, DDL, DML, migraciones, RLS, RPC, datos, backfills o cambios en Supabase:** no autorizados
**Servicios BIA con perfil de incidente reconciliado:** 69 de 69
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir un contrato empresarial único para reconocer, clasificar y gobernar un incidente de continuidad sin mezclarlo con el expediente que originó la afectación y sin permitir que la prioridad de un ticket, la criticidad BIA o el tamaño técnico de una falla decidan por sí solos la severidad empresarial.

La tarea materializa las decisiones necesarias para responder de forma determinista:

- cuándo una señal o un incidente de dominio debe relacionarse con continuidad;
- qué naturaleza y alcance empresarial tiene la afectación;
- cómo se evalúan impacto y urgencia contra MBCO, RTO y MTPD;
- qué severidad corresponde al incidente real;
- cuándo se declara formalmente un incidente de continuidad;
- cuándo la declaración requiere activación parcial, ampliada o empresarial;
- qué hechos obligan a escalar y qué evidencia permite desescalar;
- cuándo puede desactivarse el gobierno extraordinario de continuidad;
- qué condiciones deben cumplirse antes del cierre empresarial;
- cómo se conservan separados, pero correlacionados, los incidentes tecnológicos, laborales, SST, de información, de proveedor y de continuidad;
- qué decisiones se transfieren a mando, autorización, operación mínima, contingencia, recuperación, conciliación y revisión posterior.

El resultado es un contrato documental. No declara ni activa un incidente real, no asigna personas concretas, no concede permisos y no sustituye las tareas de mando o autorización.

---

#### 2. Resultado material

| Control                                           |                           Resultado |
| ------------------------------------------------- | ----------------------------------: |
| Servicios BIA heredados                           |                         **69 / 69** |
| Perfiles de disparo por servicio                  |                         **69 / 69** |
| Categorías de naturaleza                          |                              **10** |
| Niveles de alcance                                |                               **6** |
| Niveles de impacto                                |                               **4** |
| Clases de urgencia                                |                               **3** |
| Niveles de severidad de continuidad               |                               **4** |
| Modalidades de activación                         |                               **3** |
| Estados principales del ciclo                     | **10 + 1 salida de no continuidad** |
| Servicios con baseline operativo especificado     |                              **67** |
| Servicios AURA bloqueados por aplicación diferida |                               **2** |
| Severidades preasignadas por criticidad BIA       |                               **0** |
| Incidentes reales declarados por esta tarea       |                               **0** |
| Activaciones reales ejecutadas                    |                               **0** |
| Desactivaciones o cierres reales ejecutados       |                               **0** |
| Cambios físicos                                   |                               **0** |
| Cambios de requisitos de prueba                   |                               **0** |

---

#### 3. Entradas canónicas preservadas

Esta tarea consume sin redefinir:

1. `CONT-DOM-001`, que fija gobierno, propiedad federada, separación entre continuidad empresarial y recuperación técnica, y reserva autoridad detallada a las tareas de autorización;
2. `CONT-DOM-002`, que fija los 69 servicios BIA, cuatro clases de criticidad y cuatro niveles mínimos funcionales, y prohíbe confundir criticidad BIA con severidad de incidente;
3. `CONT-DOM-003`, que fija 69 mapas de dependencia, 67 candidatos de concentración pendientes de evidencia, dos bloqueos AURA, cero SPOF confirmados, cero sustitutos aprobados y cero ciclos duros confirmados;
4. `CONT-DOM-004`, que fija cuatro perfiles de MTPD/RTO/RPO/MBCO y prioridad de recuperación, 67 objetivos activos aún no validados, dos bloqueos AURA, cero riesgos aceptados y cero capacidades certificadas;
5. `CAP-SCOPE-018`, que exige separar incidentes laborales, tecnológicos, de seguridad de información y de continuidad, clasificar por impacto y prioridad empresarial, y gobernar activación parcial o total;
6. `VPROC-0062`, proceso empresarial de continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje;
7. el registro vigente de requisitos de continuidad, integración y autorización que ya protege clasificación, trazabilidad, autoridad, escalamiento y cierre;
8. las fuentes propietarias de incidentes de cada dominio, que conservan su identidad, evidencia, causa y estados aunque exista un expediente de continuidad relacionado.

Ninguna clasificación de esta tarea convierte una dependencia candidata en SPOF confirmado, un recurso en sustituto aprobado o un objetivo temporal en capacidad demostrada.

---

#### 4. Fronteras conceptuales obligatorias

```text
SEÑAL O ALERTA
!= INCIDENTE DE DOMINIO
!= INCIDENTE DE CONTINUIDAD
!= CRISIS EMPRESARIAL
```

```text
INCIDENTE LABORAL
!= INCIDENTE SST
!= INCIDENTE TECNOLOGICO
!= INCIDENTE DE INFORMACION O SEGURIDAD
!= INCIDENTE DE CONTINUIDAD
```

```text
CRITICIDAD BIA
!= SEVERIDAD DEL INCIDENTE
!= PRIORIDAD DE RECUPERACION
!= PRIORIDAD DE TICKET
```

```text
DECLARAR
!= ACTIVAR
!= ESCALAR
!= DESACTIVAR
!= CERRAR
```

```text
SERVICIO TECNICAMENTE RESTAURADO
!= MBCO RECUPERADO
!= PROCESO EMPRESARIAL VALIDADO
!= INCIDENTE CERRADO
```

```text
DESACTIVACION
!= CIERRE
```

```text
CAUSA TECNICA RESUELTA
!= EFECTOS RECONCILIADOS
!= APRENDIZAJE CERRADO
```

Un mismo hecho puede originar varios expedientes relacionados. La correlación conserva identidades y responsabilidades; no fusiona expedientes ni transfiere propiedad.

---

#### 5. Unidad canónica de evaluación del incidente

La unidad documental mínima de un incidente de continuidad es:

```text
hecho o señal origen
+ referencias a incidentes de dominio relacionados
+ servicios BCS afectados o amenazados
+ BIA y procesos VPROC relacionados
+ sede, área, canal o alcance empresarial aplicable
+ naturaleza
+ impacto
+ urgencia
+ severidad
+ MBCO actual
+ RTO y MTPD aplicables
+ decisiones de declaración y activación
+ cambios de alcance o severidad
+ contención y recuperación
+ pendientes y conciliación
+ desactivación
+ cierre
+ evidencia y versión
```

La identidad física del expediente, su esquema de datos y contratos entre aplicaciones se materializan en las tareas de integración e implementación correspondientes. Esta tarea define la semántica y las decisiones que esa identidad deberá preservar.

---

#### 6. Taxonomía de naturaleza

Las diez categorías mínimas de `CAP-SCOPE-018` se adoptan como clasificación documental de naturaleza. Un incidente puede tener una naturaleza primaria y varias relacionadas; la primaria describe el mecanismo dominante que amenaza el resultado empresarial, no el equipo que primero reportó el problema.

| Naturaleza                                 | Cobertura                                                                                      | Frontera                                                                       |
| ------------------------------------------ | ---------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| `PERSONAS_Y_DISPONIBILIDAD_LABORAL`        | ausencia, incapacidad de cobertura, indisponibilidad de función o conocimiento material        | no sustituye expediente laboral ni SST                                         |
| `SALUD_SEGURIDAD_O_EMERGENCIA_FISICA`      | vida, SST, inocuidad, emergencia o condición física protectora                                 | prioridad protectora prevalece sobre continuidad aparente                      |
| `INSTALACION_ENERGIA_O_SERVICIOS_PUBLICOS` | sede, espacio, energía, agua u otro servicio físico esencial                                   | instalación afectada no demuestra por sí sola alcance empresarial              |
| `RED_DISPOSITIVO_IMPRESORA_O_APLICACION`   | conectividad, endpoint, dispositivo compartido, impresión, aplicación o servicio técnico       | conserva incidente tecnológico relacionado                                     |
| `DATOS_PRIVACIDAD_O_CIBERSEGURIDAD`        | disponibilidad, integridad, confidencialidad, evidencia, privacidad o seguridad de información | conserva expediente de información/seguridad y mínimo necesario en continuidad |
| `INVENTARIO_PRODUCCION_O_CALIDAD`          | existencia, custodia, frío, insumo, equipo, lote, producción, calidad o trazabilidad física    | conserva hechos en NEXO/FOGO y dominios propietarios                           |
| `VENTA_PAGO_O_CANAL_COMERCIAL`             | pedido, venta, caja, pago, fiscalidad o canal de atención/venta                                | conserva efectos comerciales y financieros en sus propietarios                 |
| `PROVEEDOR_TRANSPORTE_O_ABASTECIMIENTO`    | tercero, suministro, transporte, mensajería, soporte o canal externo                           | proveedor no adquiere autoridad interna                                        |
| `REPUTACION_Y_COMUNICACION`                | comunicación material, desinformación, promesa pública, reputación o incapacidad de informar   | no habilita AURA ni publica mensajes automáticamente                           |
| `EVENTO_MULTIPLE_O_REGIONAL`               | combinación de varias naturalezas, varias sedes o una causa externa compartida                 | no elimina las naturalezas y expedientes componentes                           |

Reglas:

1. la categoría no asigna severidad automáticamente;
2. la naturaleza puede cambiar o ampliarse con nueva evidencia sin reescribir la clasificación histórica anterior;
3. un incidente técnico puede producir un incidente de continuidad de naturaleza `RED_DISPOSITIVO_IMPRESORA_O_APLICACION`, pero ambos expedientes permanecen separados;
4. una emergencia física puede requerir detener operación; la continuidad no se utiliza para mantener actividad insegura;
5. un evento múltiple conserva todas las referencias fuente para evitar una causa narrativa única no demostrada.

---

#### 7. Clasificación de alcance

| Alcance                   | Definición                                                                                                     | Escalamiento mínimo esperado                                                       |
| ------------------------- | -------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| `RESULTADO_UNICO`         | un servicio BCS y un contexto operativo acotado                                                                | permanece en coordinación acotada mientras no cumpla criterios superiores          |
| `SEDE_O_PUNTO_CONTROLADO` | uno o más resultados dentro de una sola sede o punto externo controlado                                        | involucra al gobierno territorial aplicable sin ampliar otras sedes por inferencia |
| `MULTIPROCESO_MISMA_SEDE` | varios procesos o servicios de una sede comparten la afectación                                                | exige coordinación entre propietarios afectados                                    |
| `MULTISEDE`               | la misma causa o dependencia afecta dos o más sedes internas                                                   | exige coordinación transversal y evaluación de dependencia compartida              |
| `EMPRESARIAL`             | el impacto compromete resultados de empresa, gobierno, múltiples dominios o capacidad transversal              | exige escalamiento ejecutivo conforme al contrato de autoridad                     |
| `EXTERNO_O_REGIONAL`      | proveedor, autoridad, evento físico o cadena externa afecta varios puntos, canales o partes de la organización | exige correlación externa sin convertir terceros en sedes ni autoridades internas  |

El alcance describe la extensión del incidente. No reemplaza la severidad: una afectación de un único resultado protector puede ser más severa que una afectación multisitio diferible.

---

#### 8. Clasificación de impacto

| Impacto                            | Criterio empresarial                                                                                                       | Consecuencia de clasificación                                                                        |
| ---------------------------------- | -------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| `I0_SIN_AFECTACION_DE_CONTINUIDAD` | no existe afectación material ni amenaza creíble al MBCO, RTO, MTPD, integridad u obligación del resultado                 | permanece en el expediente de dominio; continuidad puede conservar referencia sin declarar incidente |
| `I1_DEGRADACION_CONTROLADA`        | existe afectación material o riesgo creíble, pero MBCO se mantiene y la recuperación continúa razonablemente dentro de RTO | puede declararse `SEV-C1_CONTROLADA` para seguimiento empresarial                                    |
| `I2_MBCO_COMPROMETIDO`             | MBCO está amenazado o incumplido, o la recuperación prevista excede RTO sin haber alcanzado todavía impacto inaceptable    | exige al menos evaluación `SEV-C2_DEGRADADA`; puede ser superior por alcance o reversibilidad        |
| `I3_INACEPTABLE_O_IRREVERSIBLE`    | MTPD fue alcanzado/superado, el MBCO protector no puede asegurarse o existe efecto no dispensable/irreversible material    | exige `SEV-C4_CRITICA` y actuación protectora autorizada                                             |

El impacto se determina por hechos y pronóstico razonado. La ausencia de información suficiente no reduce el impacto; obliga a conservar incertidumbre y elevar la urgencia cuando esa incertidumbre impida asegurar un control protector.

---

#### 9. Clasificación de urgencia

| Urgencia         | Criterio                                                                                                                                      | Regla                                                                                |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| `U1_CONTROLADA`  | MBCO permanece protegido, no existe efecto irreversible y la recuperación prevista es igual o anterior al RTO                                 | monitoreo activo y decisión documentada; no obliga por sí sola a activar continuidad |
| `U2_PRIORITARIA` | MBCO está amenazado o degradado, o el pronóstico supera RTO pero aún existe una vía razonable de recuperación antes de MTPD                   | decisión de continuidad prioritaria y preparación/activación del alcance aplicable   |
| `U3_INMEDIATA`   | no puede asegurarse el MBCO protector, el pronóstico no llega antes de MTPD, MTPD ya fue superado o existe efecto irreversible/no dispensable | decisión inmediata; no se espera a agotar RTO para escalar                           |

Urgencia no es severidad. Urgencia expresa cuánto puede esperar la decisión; severidad expresa el nivel empresarial del incidente una vez combinados impacto, alcance, reversibilidad, obligaciones y tiempo.

##### 9.1. Relojes empresariales heredados

Los valores siguientes se consumen de `CONT-DOM-004` y no se modifican en esta tarea:

| Perfil         | Criticidad BIA         |   MTPD |    RTO |    RPO | MBCO                           | Prioridad de recuperación |
| -------------- | ---------------------- | -----: | -----: | -----: | ------------------------------ | ------------------------- |
| `CONT-OBJ-001` | `CRITICA_PROTECCION`   | 30 min | 15 min | 15 min | `PROTEGER_Y_DETENER`           | `PR-0_PROTECCION`         |
| `CONT-OBJ-002` | `CRITICA_OPERACIONAL`  |    4 h |    2 h |    1 h | `MANTENER_RESULTADO_ESENCIAL`  | `PR-1_ESENCIAL`           |
| `CONT-OBJ-003` | `ALTA_CONTROL`         |   24 h |    8 h |    4 h | `MANTENER_CONTROL_Y_EVIDENCIA` | `PR-2_CONTROL`            |
| `CONT-OBJ-004` | `DIFERIBLE_CONTROLADA` |   72 h |   24 h |   24 h | `DIFERIR_CON_TRAZABILIDAD`     | `PR-3_DIFERIBLE`          |

RPO no se convierte en severidad por sí solo. Influye en impacto cuando la edad del estado recuperable puede impedir integridad, conciliación, trazabilidad, autorización u obligación del resultado empresarial.

---

#### 10. Niveles de severidad de continuidad

La severidad no se suma mediante una fórmula aritmética. Se asigna el **nivel más alto cuyo criterio material esté demostrado**. Puede saltarse niveles si la evidencia lo exige.

| Severidad           | Condiciones mínimas                                                                                                                                                                                          | Activación mínima                                                                  | Frontera                                                                              |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| `SEV-C1_CONTROLADA` | incidente de continuidad declarado, alcance acotado, MBCO conservado, recuperación prevista dentro de RTO y sin control no dispensable comprometido                                                          | seguimiento de continuidad; activación parcial solo si la coordinación lo requiere | no equivale a incidente técnico menor ni a criticidad baja                            |
| `SEV-C2_DEGRADADA`  | MBCO amenazado o incumplido, o recuperación prevista posterior a RTO pero todavía recuperable antes de MTPD, sin criterio de nivel superior                                                                  | `ACTIVACION_PARCIAL` para servicios/sede afectados                                 | no espera a que MTPD se acerque para comenzar recuperación                            |
| `SEV-C3_MAYOR`      | afectación multiproceso/multisede/empresarial, dependencia compartida o cascada material, alternativa relevante fallida/no disponible, o pronóstico que no permite recuperar antes de MTPD                   | `ACTIVACION_AMPLIADA` y escalamiento ejecutivo                                     | un pronóstico de incumplimiento de MTPD basta para escalar antes del daño inaceptable |
| `SEV-C4_CRITICA`    | MTPD alcanzado/superado, MBCO `PROTEGER_Y_DETENER` no asegurado, o riesgo inmediato/irreversible de vida, SST, inocuidad, integridad, autorización, privacidad, custodia o efecto empresarial no dispensable | `ACTIVACION_EMPRESARIAL_PROTECTORA` y máximo nivel de gobierno aplicable           | puede exigir detener operación; continuidad nunca justifica operar de forma insegura  |

Reglas cardinales:

1. `CRITICA_PROTECCION` no preasigna `SEV-C4`; solo llega a ese nivel si el control protector resulta amenazado o indisponible según los criterios anteriores;
2. un proceso `DIFERIBLE_CONTROLADA` puede alcanzar severidad alta si el backlog, vencimiento, privacidad, cumplimiento o alcance se vuelve materialmente inaceptable;
3. un ticket tecnológico de alta prioridad no crea severidad de continuidad sin impacto empresarial;
4. una falla técnica aparentemente pequeña puede producir `SEV-C3` o `SEV-C4` si bloquea un resultado empresarial protector o un conjunto de resultados esenciales;
5. la prioridad `PR-0` a `PR-3` de recuperación organiza el orden de recuperación; no sustituye esta severidad.

---

#### 11. Matriz de decisión impacto + urgencia + alcance + severidad

| Situación demostrada                                                                 | Impacto                            | Urgencia mínima  | Severidad mínima    | Decisión                                                                    |
| ------------------------------------------------------------------------------------ | ---------------------------------- | ---------------- | ------------------- | --------------------------------------------------------------------------- |
| señal sin amenaza material a continuidad                                             | `I0_SIN_AFECTACION_DE_CONTINUIDAD` | `U1_CONTROLADA`  | no aplica           | conservar vínculo al expediente fuente; no declarar continuidad             |
| degradación material con MBCO conservado y recuperación dentro de RTO                | `I1_DEGRADACION_CONTROLADA`        | `U1_CONTROLADA`  | `SEV-C1_CONTROLADA` | declarar si se requiere seguimiento empresarial; no activar por automatismo |
| MBCO amenazado/incumplido o pronóstico posterior a RTO                               | `I2_MBCO_COMPROMETIDO`             | `U2_PRIORITARIA` | `SEV-C2_DEGRADADA`  | declarar y activar parcialmente                                             |
| varios procesos/sedes, dependencia compartida, cascada o pronóstico posterior a MTPD | `I2_MBCO_COMPROMETIDO`             | `U3_INMEDIATA`   | `SEV-C3_MAYOR`      | ampliar activación y escalar gobierno                                       |
| MTPD superado o control protector no asegurado                                       | `I3_INACEPTABLE_O_IRREVERSIBLE`    | `U3_INMEDIATA`   | `SEV-C4_CRITICA`    | activar gobierno protector y detener/contener cuando corresponda            |

Cuando varias filas sean aplicables prevalece la de mayor severidad. La incertidumbre sobre tiempo, integridad o control protector se registra; no se transforma en una clasificación tranquilizadora por ausencia de evidencia.

---

#### 12. Detección y triage

Toda señal que pueda afectar continuidad seguirá, documentalmente, esta secuencia:

```text
SEÑAL, ALERTA O REPORTE
→ CORRELACIONAR EXPEDIENTE FUENTE
→ IDENTIFICAR SERVICIOS BCS Y CONTEXTO
→ CLASIFICAR NATURALEZA Y ALCANCE
→ EVALUAR MBCO, RTO, MTPD E IMPACTO
→ DETERMINAR URGENCIA
→ DECIDIR SI EXISTE INCIDENTE DE CONTINUIDAD
```

Durante triage:

- reportar no concede autoridad para declarar;
- una alerta automática puede iniciar evaluación, pero no aprobar declaración ni activación;
- la falta de telemetría se distingue de salud confirmada;
- si el hecho es únicamente de dominio, se conserva como tal y continuidad solo mantiene la referencia necesaria;
- si todavía no se conoce causa, se registra `CAUSA_NO_CONFIRMADA`; no se inventa una explicación;
- la clasificación puede revisarse cuando aparezca evidencia nueva, conservando la historia de cambios.

---

#### 13. Criterios de declaración

Se declara un incidente de continuidad cuando al menos una de estas condiciones esté demostrada o sea razonablemente previsible con evidencia suficiente:

1. un servicio activo queda por debajo de su MBCO;
2. el MBCO está materialmente amenazado y el dominio no puede garantizar su preservación con controles ordinarios;
3. la recuperación prevista excede RTO y el impacto empresarial requiere coordinación de continuidad;
4. un control de `PROTEGER_Y_DETENER` no puede asegurarse;
5. una dependencia compartida amenaza varios servicios, procesos o sedes;
6. una dependencia externa sin sustituto demostrado amenaza el MBCO;
7. existe riesgo de pérdida, duplicidad, corrupción, falta de autorización o imposibilidad de reconciliar efectos empresariales;
8. la afectación requiere coordinar varios dominios, una sede completa o más de una sede;
9. una obligación legal, laboral, sanitaria, contractual, fiscal, de privacidad o de seguridad puede incumplirse por la duración o forma de recuperación;
10. una estrategia de contingencia necesita ser activada y gobernada fuera del manejo ordinario del dominio.

La declaración deberá registrar servicio(s), alcance, naturaleza, impacto, urgencia, severidad inicial, MBCO, objetivos temporales aplicables, evidencia y razón. No concede por sí sola permiso para ejecutar acciones protegidas.

---

#### 14. Modalidades de activación

| Modalidad                           | Alcance                                                           | Regla de uso                                                                                                       |
| ----------------------------------- | ----------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| `ACTIVACION_PARCIAL`                | servicio(s), proceso(s), sede/área o dependencia concretos        | nivel mínimo para `SEV-C2`; puede usarse en `SEV-C1` si la coordinación empresarial lo exige                       |
| `ACTIVACION_AMPLIADA`               | varios procesos, dominios, sedes o dependencia compartida         | nivel mínimo para `SEV-C3`; incorpora coordinación ejecutiva sin declarar afectación empresarial total por defecto |
| `ACTIVACION_EMPRESARIAL_PROTECTORA` | alcance empresarial, crisis o necesidad de protección transversal | nivel mínimo para `SEV-C4`; prioriza protección, contención y decisiones de gobierno aplicables                    |

Reglas:

1. declaración y activación son decisiones diferentes y tienen timestamps diferentes cuando ocurren en momentos distintos;
2. una activación puede ampliarse o reducirse sin crear otro incidente si conserva identidad y evidencia de la decisión;
3. la activación no autoriza por sí sola accesos de emergencia, failover, cambios de proveedor, restauraciones, pagos, movimientos, producción o escrituras fuera de permisos ordinarios;
4. el actor y permiso exactos para cada decisión se materializan en `CONT-AUTH-001` y tareas relacionadas;
5. `GERENCIA_GENERAL` y `GOBIERNO_Y_PROPIEDAD` conservan la aprobación/aceptación ejecutiva que el proceso de continuidad ya exige según severidad; esta tarea no asigna personas ni credenciales;
6. un proveedor, técnico, dispositivo o automatización puede reportar estado, pero no activar continuidad empresarial en nombre de Vento.

---

#### 15. Escalamiento

Un incidente se escala sin esperar el siguiente hito temporal cuando se demuestre cualquiera de estos disparadores:

1. cambio a un impacto o urgencia de nivel superior;
2. ampliación de un resultado a múltiples procesos, sedes o dominios;
3. MBCO pasa de amenazado a incumplido;
4. el pronóstico deja de cumplir RTO;
5. el pronóstico indica que no podrá recuperarse antes de MTPD;
6. MTPD es alcanzado o superado;
7. se pierde un control protector o aparece riesgo irreversible/no dispensable;
8. falla una alternativa que formaba parte del plan o se descubre que comparte el mismo dominio de fallo;
9. aparece una dependencia compartida o cascada material;
10. existe incertidumbre de integridad, autorización, privacidad, custodia o reconciliación que impide afirmar un estado seguro;
11. un proveedor, canal o recurso externo no responde dentro de la ventana necesaria para el resultado empresarial;
12. la comunicación, obligación o contraparte externa requiere una autoridad superior a la disponible en el alcance actual;
13. aparecen órdenes contradictorias, falta de responsable o imposibilidad de sostener mando autorizado.

Se conserva siempre severidad anterior, severidad nueva, motivo, evidencia, actor/función que propuso, autoridad que decidió y timestamp. Un incidente puede pasar directamente de `SEV-C1` a `SEV-C4` cuando la evidencia lo justifique.

---

#### 16. Desescalamiento

El desescalamiento solo procede con evidencia de que los criterios del nivel superior dejaron de ser ciertos. Requiere:

- MBCO conocido y controlado;
- pronóstico actualizado compatible con RTO/MTPD o una decisión protectora válida;
- alcance estabilizado;
- ausencia de un nuevo efecto irreversible;
- dependencias críticas del alcance conocidas;
- decisión autorizada y registrada;
- comunicación de cambio de estado a los consumidores que corresponda.

No se desescala para reducir presión operativa, ocultar un vencimiento, evitar escalamiento ejecutivo o presentar recuperación técnica como recuperación empresarial. El desescalamiento conserva la severidad máxima alcanzada para auditoría y revisión posterior.

---

#### 17. Estados del ciclo documental

Los siguientes estados son semántica documental de esta tarea; no crean por sí solos enums, tablas o workflows físicos:

| Estado                           | Significado                                                                                                    | Transiciones permitidas principales                                                 |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| `DETECTADO`                      | existe señal/reporte correlacionable                                                                           | `EN_TRIAGE`                                                                         |
| `EN_TRIAGE`                      | se evalúan naturaleza, alcance, servicios, impacto y urgencia                                                  | `NO_DECLARADO_COMO_CONTINUIDAD` o `DECLARADO`                                       |
| `NO_DECLARADO_COMO_CONTINUIDAD`  | el hecho permanece en su expediente fuente sin criterios materiales de continuidad                             | terminal para este ciclo; puede originar una nueva evaluación si cambian los hechos |
| `DECLARADO`                      | existe incidente empresarial de continuidad con severidad y alcance                                            | monitoreo, activación o escalamiento                                                |
| `ACTIVADO_PARCIAL`               | plan/gobierno de continuidad activo en alcance acotado                                                         | ampliar, contener/recuperar o estabilizar                                           |
| `ACTIVADO_AMPLIADO`              | coordinación activa multiproceso/multisede                                                                     | ampliar a empresarial, contener/recuperar o desescalar                              |
| `ACTIVADO_EMPRESARIAL_PROTECTOR` | gobierno protector transversal activo                                                                          | contener/recuperar o desescalar con evidencia                                       |
| `EN_CONTENCION_Y_RECUPERACION`   | se preserva MBCO, se contiene expansión y se recuperan resultados                                              | `ESTABILIZADO` o nueva escalada                                                     |
| `ESTABILIZADO`                   | expansión detenida y resultados/pendientes conocidos                                                           | `DESACTIVADO` o retorno a recuperación si reaparece criterio activo                 |
| `DESACTIVADO`                    | ya no se requiere gobierno extraordinario de activación, pero puede continuar conciliación o cierre documental | `CERRADO`                                                                           |
| `CERRADO`                        | criterios empresariales de cierre satisfechos y evidencia preservada                                           | cierre histórico; nueva afectación requiere nueva decisión correlacionada           |

Un `SEV-C1` declarado puede pasar de `DECLARADO` a `ESTABILIZADO` y `CERRADO` sin una activación formal si nunca fue necesaria una modalidad activa. En ese caso se registra explícitamente que no hubo activación.

---

#### 18. Contención y recuperación

Durante un incidente declarado:

- contención evita expansión, pérdida de integridad o nuevos efectos;
- operación mínima pertenece a `CONT-DOM-007`;
- estrategia concreta de contingencia pertenece a `CONT-DOM-008`;
- captura de trabajo durante falla pertenece a `CONT-DOM-009`;
- reincorporación y conflictos pertenecen a `CONT-DOM-010`;
- respaldo pertenece a `CONT-DOM-011`;
- runbooks, restauración y failover pertenecen a `CONT-DOM-012`;
- continuidad externa pertenece a `CONT-DOM-013`.

Esta tarea solo gobierna cómo esos resultados afectan severidad, activación, escalamiento, desactivación y cierre. No selecciona ni ejecuta una modalidad de recuperación.

---

#### 19. Criterios de desactivación

Una activación puede desactivarse únicamente cuando, para el alcance afectado:

1. no existe un criterio vigente que exija mantener la modalidad de activación actual;
2. todos los servicios afectados tienen MBCO conocido y se encuentran por encima de él o en un estado protector aprobado que impide nuevos efectos inseguros;
3. la expansión o cascada está contenida;
4. responsables de proceso y funciones técnicas han reportado el estado de recuperación que les corresponde;
5. las acciones extraordinarias que deban cesar tienen transición controlada;
6. los pendientes de recuperación, reincorporación o conciliación están identificados, referenciados y tienen propietario;
7. la desactivación no elimina accesos, colas, datos, evidencia o trabajos mediante una inferencia; cada recurso sigue su contrato propietario;
8. existe decisión autorizada con alcance, razón, timestamp y comunicación aplicable.

Desactivar no declara causa eliminada ni efectos conciliados. Un incidente puede permanecer abierto en estado desactivado mientras termina conciliación y cierre documental.

---

#### 20. Criterios de cierre

El cierre empresarial exige conjuntamente:

1. identidad, naturaleza, alcance, severidad máxima y línea de tiempo consolidados;
2. toda activación aplicable desactivada de forma controlada;
3. estado final conocido para cada servicio BCS afectado;
4. validación funcional del resultado por el propietario de cada proceso afectado; un health check técnico no basta;
5. MBCO recuperado o resultado formalmente protegido/detenido conforme al contrato aplicable;
6. transacciones, inventario, producción, ventas, pagos, asistencia, documentos, colas y comunicaciones aplicables conciliados según sus dominios;
7. ningún trabajo o pendiente de continuidad sin propietario;
8. conflictos, operaciones vencidas, duplicados, pérdidas o efectos parciales identificados y tratados por su contrato propietario;
9. accesos excepcionales, si existieron por otras tareas autorizadas, revocados o transferidos al estado que corresponda;
10. proveedores y dependencias externas con estado final registrado cuando hayan participado;
11. comunicaciones de cierre o corrección emitidas por el responsable autorizado cuando apliquen;
12. evidencia, decisiones y timestamps preservados sin sobrescritura silenciosa;
13. causa confirmada o, si sigue abierta en otro proceso, referencia explícita al expediente que la investiga;
14. acciones residuales de mejora transferidas a `CONT-DOM-015` o tarea propietaria con responsable y condición de salida;
15. aceptación del cierre por la autoridad correspondiente a la máxima severidad/activación alcanzada, conforme a `CONT-AUTH-004`.

No se exige que toda acción de mejora a largo plazo esté ejecutada antes del cierre operativo, pero ninguna acción residual puede quedar huérfana y ninguna conciliación necesaria para afirmar el resultado empresarial puede omitirse.

---

#### 21. Relaciones con incidentes de dominio

1. un incidente tecnológico conserva su expediente en BLOQUE Z aunque origine continuidad;
2. un incidente laboral o SST conserva su expediente y sensibilidad propias;
3. un incidente de información, privacidad o seguridad conserva evidencia y acceso en su dominio;
4. una afectación de proveedor conserva contrato, escalamiento y hechos externos en su fuente propietaria;
5. un incidente de continuidad puede correlacionar múltiples incidentes fuente;
6. un incidente fuente puede afectar múltiples servicios BCS;
7. cerrar un ticket o incidente técnico no cierra automáticamente continuidad;
8. cerrar continuidad no cierra automáticamente un problema técnico, investigación SST, privacidad, seguridad, causa raíz o acción de mejora;
9. continuidad conserva referencias y la información mínima necesaria; no copia diagnósticos sensibles por conveniencia;
10. ninguna causa se presenta como confirmada porque un proveedor o una alerta la sugiera.

---

#### 22. Contrato mínimo del expediente de continuidad

Cada expediente deberá poder conservar, cuando aplique:

- identificador estable único de incidente de continuidad;
- referencias a señales, eventos e incidentes fuente;
- fecha/hora de detección;
- fecha/hora de declaración;
- fecha/hora de cada activación o cambio de alcance;
- fecha/hora de cada cambio de severidad;
- fecha/hora de estabilización, desactivación y cierre;
- naturaleza primaria y relacionadas;
- alcance vigente y máximo alcanzado;
- servicios `BCS-*`, BIA, procesos y sedes afectados;
- MBCO, RTO, MTPD y prioridad de recuperación aplicables por referencia;
- impacto, urgencia, severidad actual y severidad máxima;
- estado operativo por servicio;
- incertidumbres y supuestos explícitos;
- funciones responsables y referencias a autoridad sin exponer secretos;
- decisiones, razones, actor/función, versión y timestamp;
- referencias a contención, operación mínima y contingencia;
- dependencias, proveedores y recursos afectados por referencia propietaria;
- comunicaciones y audiencias por referencia;
- trabajos generados durante la falla;
- reconciliaciones, conflictos y pendientes;
- evidencia de recuperación funcional;
- decisión y evidencia de desactivación;
- checklist y decisión de cierre;
- referencia a revisión posterior y acciones.

Los contactos sensibles, secretos, credenciales y datos de salud no se copian al expediente transversal salvo que su exposición esté expresamente autorizada y sea estrictamente necesaria.

---

#### 23. Baseline materializado para los 69 servicios

Cada servicio conserva su criticidad y objetivo aprobados, pero recibe un perfil de disparo de incidente. **Ninguna fila recibe severidad preasignada**: la severidad se calcula con los hechos del incidente.

|    # | Servicio         | BIA                 | Proceso      | Propietaria | Criticidad BIA         | Perfil objetivo | MBCO                           | Perfil de disparo         | Severidad previa | Regla de declaración/escalamiento                                                                                                                                         | Estado                              |
| ---: | ---------------- | ------------------- | ------------ | ----------- | ---------------------- | --------------- | ------------------------------ | ------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------- |
|    1 | `BCS-VPROC-0001` | `BIA-VPROC-0001-V1` | `VPROC-0001` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|    2 | `BCS-VPROC-0002` | `BIA-VPROC-0002-V1` | `VPROC-0002` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|    3 | `BCS-VPROC-0003` | `BIA-VPROC-0003-V1` | `VPROC-0003` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|    4 | `BCS-VPROC-0004` | `BIA-VPROC-0004-V1` | `VPROC-0004` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|    5 | `BCS-VPROC-0005` | `BIA-VPROC-0005-V1` | `VPROC-0005` | `viso`      | `DIFERIBLE_CONTROLADA` | `CONT-OBJ-004`  | `DIFERIR_CON_TRAZABILIDAD`     | `DIFERIMIENTO_CONTROLADO` | `NO_PREASIGNADA` | Backlog, vencimiento, trazabilidad o capacidad de reanudación amenazan RTO/MTPD o dejan de ser controlables: declarar y evaluar activación.                               | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|    6 | `BCS-VPROC-0006` | `BIA-VPROC-0006-V1` | `VPROC-0006` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|    7 | `BCS-VPROC-0007` | `BIA-VPROC-0007-V1` | `VPROC-0007` | `viso`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002`  | `MANTENER_RESULTADO_ESENCIAL`  | `RESULTADO_ESENCIAL`      | `NO_PREASIGNADA` | Resultado esencial afectado o recuperación prevista posterior al RTO: declarar y evaluar activación; si no se prevé recuperar antes de MTPD, escalar a SEV-C3 o superior. | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|    8 | `BCS-VPROC-0008` | `BIA-VPROC-0008-V1` | `VPROC-0008` | `anima`     | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|    9 | `BCS-VPROC-0009` | `BIA-VPROC-0009-V1` | `VPROC-0009` | `viso`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002`  | `MANTENER_RESULTADO_ESENCIAL`  | `RESULTADO_ESENCIAL`      | `NO_PREASIGNADA` | Resultado esencial afectado o recuperación prevista posterior al RTO: declarar y evaluar activación; si no se prevé recuperar antes de MTPD, escalar a SEV-C3 o superior. | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   10 | `BCS-VPROC-0010` | `BIA-VPROC-0010-V1` | `VPROC-0010` | `numera`    | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   11 | `BCS-VPROC-0011` | `BIA-VPROC-0011-V1` | `VPROC-0011` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   12 | `BCS-VPROC-0012` | `BIA-VPROC-0012-V1` | `VPROC-0012` | `viso`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001`  | `PROTEGER_Y_DETENER`           | `PROTECCION_INMEDIATA`    | `NO_PREASIGNADA` | MBCO protector amenazado o indisponible: declarar; si el control protector no puede asegurarse, escalar inmediatamente a SEV-C4.                                          | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   13 | `BCS-VPROC-0013` | `BIA-VPROC-0013-V1` | `VPROC-0013` | `viso`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001`  | `PROTEGER_Y_DETENER`           | `PROTECCION_INMEDIATA`    | `NO_PREASIGNADA` | MBCO protector amenazado o indisponible: declarar; si el control protector no puede asegurarse, escalar inmediatamente a SEV-C4.                                          | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   14 | `BCS-VPROC-0014` | `BIA-VPROC-0014-V1` | `VPROC-0014` | `viso`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001`  | `PROTEGER_Y_DETENER`           | `PROTECCION_INMEDIATA`    | `NO_PREASIGNADA` | MBCO protector amenazado o indisponible: declarar; si el control protector no puede asegurarse, escalar inmediatamente a SEV-C4.                                          | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   15 | `BCS-VPROC-0015` | `BIA-VPROC-0015-V1` | `VPROC-0015` | `nexo`      | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   16 | `BCS-VPROC-0016` | `BIA-VPROC-0016-V1` | `VPROC-0016` | `fogo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002`  | `MANTENER_RESULTADO_ESENCIAL`  | `RESULTADO_ESENCIAL`      | `NO_PREASIGNADA` | Resultado esencial afectado o recuperación prevista posterior al RTO: declarar y evaluar activación; si no se prevé recuperar antes de MTPD, escalar a SEV-C3 o superior. | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   17 | `BCS-VPROC-0017` | `BIA-VPROC-0017-V1` | `VPROC-0017` | `pulso`     | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002`  | `MANTENER_RESULTADO_ESENCIAL`  | `RESULTADO_ESENCIAL`      | `NO_PREASIGNADA` | Resultado esencial afectado o recuperación prevista posterior al RTO: declarar y evaluar activación; si no se prevé recuperar antes de MTPD, escalar a SEV-C3 o superior. | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   18 | `BCS-VPROC-0018` | `BIA-VPROC-0018-V1` | `VPROC-0018` | `nexo`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001`  | `PROTEGER_Y_DETENER`           | `PROTECCION_INMEDIATA`    | `NO_PREASIGNADA` | MBCO protector amenazado o indisponible: declarar; si el control protector no puede asegurarse, escalar inmediatamente a SEV-C4.                                          | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   19 | `BCS-VPROC-0019` | `BIA-VPROC-0019-V1` | `VPROC-0019` | `origo`     | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   20 | `BCS-VPROC-0020` | `BIA-VPROC-0020-V1` | `VPROC-0020` | `origo`     | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   21 | `BCS-VPROC-0021` | `BIA-VPROC-0021-V1` | `VPROC-0021` | `origo`     | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   22 | `BCS-VPROC-0022` | `BIA-VPROC-0022-V1` | `VPROC-0022` | `origo`     | `CRITICA_PROTECCION`   | `CONT-OBJ-001`  | `PROTEGER_Y_DETENER`           | `PROTECCION_INMEDIATA`    | `NO_PREASIGNADA` | MBCO protector amenazado o indisponible: declarar; si el control protector no puede asegurarse, escalar inmediatamente a SEV-C4.                                          | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   23 | `BCS-VPROC-0023` | `BIA-VPROC-0023-V1` | `VPROC-0023` | `nexo`      | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   24 | `BCS-VPROC-0024` | `BIA-VPROC-0024-V1` | `VPROC-0024` | `nexo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002`  | `MANTENER_RESULTADO_ESENCIAL`  | `RESULTADO_ESENCIAL`      | `NO_PREASIGNADA` | Resultado esencial afectado o recuperación prevista posterior al RTO: declarar y evaluar activación; si no se prevé recuperar antes de MTPD, escalar a SEV-C3 o superior. | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   25 | `BCS-VPROC-0025` | `BIA-VPROC-0025-V1` | `VPROC-0025` | `nexo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002`  | `MANTENER_RESULTADO_ESENCIAL`  | `RESULTADO_ESENCIAL`      | `NO_PREASIGNADA` | Resultado esencial afectado o recuperación prevista posterior al RTO: declarar y evaluar activación; si no se prevé recuperar antes de MTPD, escalar a SEV-C3 o superior. | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   26 | `BCS-VPROC-0026` | `BIA-VPROC-0026-V1` | `VPROC-0026` | `nexo`      | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   27 | `BCS-VPROC-0027` | `BIA-VPROC-0027-V1` | `VPROC-0027` | `nexo`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001`  | `PROTEGER_Y_DETENER`           | `PROTECCION_INMEDIATA`    | `NO_PREASIGNADA` | MBCO protector amenazado o indisponible: declarar; si el control protector no puede asegurarse, escalar inmediatamente a SEV-C4.                                          | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   28 | `BCS-VPROC-0028` | `BIA-VPROC-0028-V1` | `VPROC-0028` | `nexo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002`  | `MANTENER_RESULTADO_ESENCIAL`  | `RESULTADO_ESENCIAL`      | `NO_PREASIGNADA` | Resultado esencial afectado o recuperación prevista posterior al RTO: declarar y evaluar activación; si no se prevé recuperar antes de MTPD, escalar a SEV-C3 o superior. | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   29 | `BCS-VPROC-0029` | `BIA-VPROC-0029-V1` | `VPROC-0029` | `nexo`      | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   30 | `BCS-VPROC-0030` | `BIA-VPROC-0030-V1` | `VPROC-0030` | `nexo`      | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   31 | `BCS-VPROC-0031` | `BIA-VPROC-0031-V1` | `VPROC-0031` | `nexo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002`  | `MANTENER_RESULTADO_ESENCIAL`  | `RESULTADO_ESENCIAL`      | `NO_PREASIGNADA` | Resultado esencial afectado o recuperación prevista posterior al RTO: declarar y evaluar activación; si no se prevé recuperar antes de MTPD, escalar a SEV-C3 o superior. | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   32 | `BCS-VPROC-0032` | `BIA-VPROC-0032-V1` | `VPROC-0032` | `nexo`      | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   33 | `BCS-VPROC-0033` | `BIA-VPROC-0033-V1` | `VPROC-0033` | `fogo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002`  | `MANTENER_RESULTADO_ESENCIAL`  | `RESULTADO_ESENCIAL`      | `NO_PREASIGNADA` | Resultado esencial afectado o recuperación prevista posterior al RTO: declarar y evaluar activación; si no se prevé recuperar antes de MTPD, escalar a SEV-C3 o superior. | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   34 | `BCS-VPROC-0034` | `BIA-VPROC-0034-V1` | `VPROC-0034` | `fogo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002`  | `MANTENER_RESULTADO_ESENCIAL`  | `RESULTADO_ESENCIAL`      | `NO_PREASIGNADA` | Resultado esencial afectado o recuperación prevista posterior al RTO: declarar y evaluar activación; si no se prevé recuperar antes de MTPD, escalar a SEV-C3 o superior. | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   35 | `BCS-VPROC-0035` | `BIA-VPROC-0035-V1` | `VPROC-0035` | `fogo`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001`  | `PROTEGER_Y_DETENER`           | `PROTECCION_INMEDIATA`    | `NO_PREASIGNADA` | MBCO protector amenazado o indisponible: declarar; si el control protector no puede asegurarse, escalar inmediatamente a SEV-C4.                                          | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   36 | `BCS-VPROC-0036` | `BIA-VPROC-0036-V1` | `VPROC-0036` | `fogo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002`  | `MANTENER_RESULTADO_ESENCIAL`  | `RESULTADO_ESENCIAL`      | `NO_PREASIGNADA` | Resultado esencial afectado o recuperación prevista posterior al RTO: declarar y evaluar activación; si no se prevé recuperar antes de MTPD, escalar a SEV-C3 o superior. | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   37 | `BCS-VPROC-0037` | `BIA-VPROC-0037-V1` | `VPROC-0037` | `fogo`      | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   38 | `BCS-VPROC-0038` | `BIA-VPROC-0038-V1` | `VPROC-0038` | `pulso`     | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002`  | `MANTENER_RESULTADO_ESENCIAL`  | `RESULTADO_ESENCIAL`      | `NO_PREASIGNADA` | Resultado esencial afectado o recuperación prevista posterior al RTO: declarar y evaluar activación; si no se prevé recuperar antes de MTPD, escalar a SEV-C3 o superior. | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   39 | `BCS-VPROC-0039` | `BIA-VPROC-0039-V1` | `VPROC-0039` | `pulso`     | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002`  | `MANTENER_RESULTADO_ESENCIAL`  | `RESULTADO_ESENCIAL`      | `NO_PREASIGNADA` | Resultado esencial afectado o recuperación prevista posterior al RTO: declarar y evaluar activación; si no se prevé recuperar antes de MTPD, escalar a SEV-C3 o superior. | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   40 | `BCS-VPROC-0040` | `BIA-VPROC-0040-V1` | `VPROC-0040` | `pulso`     | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002`  | `MANTENER_RESULTADO_ESENCIAL`  | `RESULTADO_ESENCIAL`      | `NO_PREASIGNADA` | Resultado esencial afectado o recuperación prevista posterior al RTO: declarar y evaluar activación; si no se prevé recuperar antes de MTPD, escalar a SEV-C3 o superior. | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   41 | `BCS-VPROC-0041` | `BIA-VPROC-0041-V1` | `VPROC-0041` | `pulso`     | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002`  | `MANTENER_RESULTADO_ESENCIAL`  | `RESULTADO_ESENCIAL`      | `NO_PREASIGNADA` | Resultado esencial afectado o recuperación prevista posterior al RTO: declarar y evaluar activación; si no se prevé recuperar antes de MTPD, escalar a SEV-C3 o superior. | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   42 | `BCS-VPROC-0042` | `BIA-VPROC-0042-V1` | `VPROC-0042` | `pulso`     | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002`  | `MANTENER_RESULTADO_ESENCIAL`  | `RESULTADO_ESENCIAL`      | `NO_PREASIGNADA` | Resultado esencial afectado o recuperación prevista posterior al RTO: declarar y evaluar activación; si no se prevé recuperar antes de MTPD, escalar a SEV-C3 o superior. | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   43 | `BCS-VPROC-0043` | `BIA-VPROC-0043-V1` | `VPROC-0043` | `pulso`     | `CRITICA_PROTECCION`   | `CONT-OBJ-001`  | `PROTEGER_Y_DETENER`           | `PROTECCION_INMEDIATA`    | `NO_PREASIGNADA` | MBCO protector amenazado o indisponible: declarar; si el control protector no puede asegurarse, escalar inmediatamente a SEV-C4.                                          | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   44 | `BCS-VPROC-0044` | `BIA-VPROC-0044-V1` | `VPROC-0044` | `pulso`     | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   45 | `BCS-VPROC-0045` | `BIA-VPROC-0045-V1` | `VPROC-0045` | `pass`      | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   46 | `BCS-VPROC-0046` | `BIA-VPROC-0046-V1` | `VPROC-0046` | `pulso`     | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   47 | `BCS-VPROC-0047` | `BIA-VPROC-0047-V1` | `VPROC-0047` | `pulso`     | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   48 | `BCS-VPROC-0048` | `BIA-VPROC-0048-V1` | `VPROC-0048` | `nexo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002`  | `MANTENER_RESULTADO_ESENCIAL`  | `RESULTADO_ESENCIAL`      | `NO_PREASIGNADA` | Resultado esencial afectado o recuperación prevista posterior al RTO: declarar y evaluar activación; si no se prevé recuperar antes de MTPD, escalar a SEV-C3 o superior. | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   49 | `BCS-VPROC-0049` | `BIA-VPROC-0049-V1` | `VPROC-0049` | `nexo`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002`  | `MANTENER_RESULTADO_ESENCIAL`  | `RESULTADO_ESENCIAL`      | `NO_PREASIGNADA` | Resultado esencial afectado o recuperación prevista posterior al RTO: declarar y evaluar activación; si no se prevé recuperar antes de MTPD, escalar a SEV-C3 o superior. | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   50 | `BCS-VPROC-0050` | `BIA-VPROC-0050-V1` | `VPROC-0050` | `pulso`     | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002`  | `MANTENER_RESULTADO_ESENCIAL`  | `RESULTADO_ESENCIAL`      | `NO_PREASIGNADA` | Resultado esencial afectado o recuperación prevista posterior al RTO: declarar y evaluar activación; si no se prevé recuperar antes de MTPD, escalar a SEV-C3 o superior. | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   51 | `BCS-VPROC-0051` | `BIA-VPROC-0051-V1` | `VPROC-0051` | `numera`    | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   52 | `BCS-VPROC-0052` | `BIA-VPROC-0052-V1` | `VPROC-0052` | `numera`    | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   53 | `BCS-VPROC-0053` | `BIA-VPROC-0053-V1` | `VPROC-0053` | `numera`    | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   54 | `BCS-VPROC-0054` | `BIA-VPROC-0054-V1` | `VPROC-0054` | `numera`    | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   55 | `BCS-VPROC-0055` | `BIA-VPROC-0055-V1` | `VPROC-0055` | `nexo`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001`  | `PROTEGER_Y_DETENER`           | `PROTECCION_INMEDIATA`    | `NO_PREASIGNADA` | MBCO protector amenazado o indisponible: declarar; si el control protector no puede asegurarse, escalar inmediatamente a SEV-C4.                                          | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   56 | `BCS-VPROC-0056` | `BIA-VPROC-0056-V1` | `VPROC-0056` | `aura`      | `DIFERIBLE_CONTROLADA` | `CONT-OBJ-004`  | `DIFERIR_CON_TRAZABILIDAD`     | `DIFERIMIENTO_CONTROLADO` | `NO_PREASIGNADA` | Perfil de política conservado; no se habilita activación operativa de AURA mientras la aplicación permanezca diferida.                                                    | `BLOQUEADO_POR_APLICACION_DIFERIDA` |
|   57 | `BCS-VPROC-0057` | `BIA-VPROC-0057-V1` | `VPROC-0057` | `aura`      | `DIFERIBLE_CONTROLADA` | `CONT-OBJ-004`  | `DIFERIR_CON_TRAZABILIDAD`     | `DIFERIMIENTO_CONTROLADO` | `NO_PREASIGNADA` | Perfil de política conservado; no se habilita activación operativa de AURA mientras la aplicación permanezca diferida.                                                    | `BLOQUEADO_POR_APLICACION_DIFERIDA` |
|   58 | `BCS-VPROC-0058` | `BIA-VPROC-0058-V1` | `VPROC-0058` | `viso`      | `CRITICA_OPERACIONAL`  | `CONT-OBJ-002`  | `MANTENER_RESULTADO_ESENCIAL`  | `RESULTADO_ESENCIAL`      | `NO_PREASIGNADA` | Resultado esencial afectado o recuperación prevista posterior al RTO: declarar y evaluar activación; si no se prevé recuperar antes de MTPD, escalar a SEV-C3 o superior. | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   59 | `BCS-VPROC-0059` | `BIA-VPROC-0059-V1` | `VPROC-0059` | `viso`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001`  | `PROTEGER_Y_DETENER`           | `PROTECCION_INMEDIATA`    | `NO_PREASIGNADA` | MBCO protector amenazado o indisponible: declarar; si el control protector no puede asegurarse, escalar inmediatamente a SEV-C4.                                          | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   60 | `BCS-VPROC-0060` | `BIA-VPROC-0060-V1` | `VPROC-0060` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   61 | `BCS-VPROC-0061` | `BIA-VPROC-0061-V1` | `VPROC-0061` | `numera`    | `DIFERIBLE_CONTROLADA` | `CONT-OBJ-004`  | `DIFERIR_CON_TRAZABILIDAD`     | `DIFERIMIENTO_CONTROLADO` | `NO_PREASIGNADA` | Backlog, vencimiento, trazabilidad o capacidad de reanudación amenazan RTO/MTPD o dejan de ser controlables: declarar y evaluar activación.                               | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   62 | `BCS-VPROC-0062` | `BIA-VPROC-0062-V1` | `VPROC-0062` | `viso`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001`  | `PROTEGER_Y_DETENER`           | `PROTECCION_INMEDIATA`    | `NO_PREASIGNADA` | MBCO protector amenazado o indisponible: declarar; si el control protector no puede asegurarse, escalar inmediatamente a SEV-C4.                                          | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   63 | `BCS-VPROC-0063` | `BIA-VPROC-0063-V1` | `VPROC-0063` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   64 | `BCS-VPROC-0064` | `BIA-VPROC-0064-V1` | `VPROC-0064` | `viso`      | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   65 | `BCS-VPROC-0065` | `BIA-VPROC-0065-V1` | `VPROC-0065` | `viso`      | `DIFERIBLE_CONTROLADA` | `CONT-OBJ-004`  | `DIFERIR_CON_TRAZABILIDAD`     | `DIFERIMIENTO_CONTROLADO` | `NO_PREASIGNADA` | Backlog, vencimiento, trazabilidad o capacidad de reanudación amenazan RTO/MTPD o dejan de ser controlables: declarar y evaluar activación.                               | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   66 | `BCS-VPROC-0066` | `BIA-VPROC-0066-V1` | `VPROC-0066` | `viso`      | `CRITICA_PROTECCION`   | `CONT-OBJ-001`  | `PROTEGER_Y_DETENER`           | `PROTECCION_INMEDIATA`    | `NO_PREASIGNADA` | MBCO protector amenazado o indisponible: declarar; si el control protector no puede asegurarse, escalar inmediatamente a SEV-C4.                                          | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   67 | `BCS-VPROC-0067` | `BIA-VPROC-0067-V1` | `VPROC-0067` | `nexo`      | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   68 | `BCS-VPROC-0068` | `BIA-VPROC-0068-V1` | `VPROC-0068` | `pulso`     | `DIFERIBLE_CONTROLADA` | `CONT-OBJ-004`  | `DIFERIR_CON_TRAZABILIDAD`     | `DIFERIMIENTO_CONTROLADO` | `NO_PREASIGNADA` | Backlog, vencimiento, trazabilidad o capacidad de reanudación amenazan RTO/MTPD o dejan de ser controlables: declarar y evaluar activación.                               | `BASELINE_INCIDENTE_ESPECIFICADO`   |
|   69 | `BCS-VPROC-0069` | `BIA-VPROC-0069-V1` | `VPROC-0069` | `numera`    | `ALTA_CONTROL`         | `CONT-OBJ-003`  | `MANTENER_CONTROL_Y_EVIDENCIA` | `CONTROL_Y_EVIDENCIA`     | `NO_PREASIGNADA` | Autoridad, evidencia, conciliación, vencimiento o control material comprometidos, o recuperación prevista posterior al RTO: declarar y evaluar activación.                | `BASELINE_INCIDENTE_ESPECIFICADO`   |

---

#### 24. Reconciliación de la matriz

La materialización conserva:

- **69** servicios `BCS-*` únicos;
- **69** BIA únicos;
- **69** procesos `VPROC-*` únicos;
- **0** faltantes;
- **0** duplicados;
- **0** severidades preasignadas;
- **67** servicios con baseline de incidente operativo especificado;
- **2** servicios bloqueados por aplicación AURA diferida;
- distribución de propietarias: `anima` 1, `viso` 20, `nexo` 16, `fogo` 6, `origo` 4, `pulso` 12, `numera` 7, `aura` 2, `pass` 1, `shell` 0;
- distribución BIA: `CRITICA_PROTECCION` 12, `CRITICA_OPERACIONAL` 20, `ALTA_CONTROL` 31, `DIFERIBLE_CONTROLADA` 6;
- perfiles objetivo heredados: 12 `CONT-OBJ-001`, 20 `CONT-OBJ-002`, 31 `CONT-OBJ-003`, 6 `CONT-OBJ-004`;
- ninguna dependencia candidata se promovió a SPOF;
- ningún sustituto fue aprobado;
- ningún incidente real fue inventado.

---

#### 25. Caso AURA

`VPROC-0056` y `VPROC-0057` conservan BIA, objetivo y perfil documental de incidente para trazabilidad, pero su estado operativo permanece `BLOQUEADO_POR_APLICACION_DIFERIDA`.

Por tanto:

1. una falla de una futura superficie AURA no se modela como incidente operativo habilitado mientras la aplicación siga diferida;
2. una afectación real de canal, proveedor, comunicación o proceso comercial se registra en el dominio activo que posea el hecho y puede originar continuidad por ese dominio;
3. no se utiliza otra aplicación para simular que AURA ya tiene capacidad productiva;
4. la habilitación futura de AURA obliga a revalidar dependencias, objetivos, estrategias y autoridad antes de usar este ciclo en producción.

---

#### 26. Gobierno de autoridad y segregación

Esta tarea define **qué decisiones requieren autoridad**, no implementa permisos ni asigna personas:

| Decisión                                         | Requisito de gobierno                                                                          | Propietario posterior del detalle        |
| ------------------------------------------------ | ---------------------------------------------------------------------------------------------- | ---------------------------------------- |
| declarar incidente                               | actor autorizado para el alcance, con evidencia de servicio/impacto/severidad                  | `CONT-AUTH-001`                          |
| activar parcialmente                             | autoridad de continuidad válida para el alcance y funciones afectadas                          | `CONT-AUTH-001`; mando en `CONT-DOM-006` |
| ampliar activación                               | autoridad correspondiente al nuevo alcance/severidad                                           | `CONT-AUTH-001`; mando en `CONT-DOM-006` |
| activar empresarial/protectora                   | escalamiento ejecutivo conforme a severidad y gobierno vigente                                 | `CONT-AUTH-001` y gobierno aplicable     |
| ejecutar acceso excepcional                      | nunca se deduce de la activación                                                               | `CONT-AUTH-002`                          |
| acceder a runbooks/contactos/evidencia sensibles | mínimo privilegio y finalidad                                                                  | `CONT-AUTH-003`                          |
| desactivar                                       | autoridad coherente con el máximo alcance activo                                               | `CONT-AUTH-001` / `CONT-AUTH-004`        |
| cerrar                                           | autoridad coherente con la máxima severidad y segregada de ejecución/validación cuando aplique | `CONT-AUTH-004`                          |

Una organización pequeña puede concentrar funciones, pero siempre registra la función ejercida, el alcance y la decisión; una cuenta técnica o proveedor no sustituye una autoridad humana.

---

#### 27. Handoffs obligatorios

| Decisión posterior                                                                                | Propietario documental            | Condición de salida                                                    |
| ------------------------------------------------------------------------------------------------- | --------------------------------- | ---------------------------------------------------------------------- |
| director del incidente, funciones de mando, sustitutos, bitácora detallada y coordinación externa | `CONT-DOM-006`                    | antes del primer ejercicio de mando o uso operacional                  |
| operación mínima cuantificada por proceso/sede/horario/temporada/duración                         | `CONT-DOM-007`                    | antes de sostener MBCO en modo degradado                               |
| modalidad manual, offline, reducida, física o de proveedor                                        | `CONT-DOM-008`                    | antes de activar una alternativa operativa                             |
| folios, captura y custodia del trabajo durante falla                                              | `CONT-DOM-009`                    | antes de producir registros contingentes                               |
| reincorporación, conflictos y conciliación                                                        | `CONT-DOM-010`                    | antes de afirmar cierre de efectos empresariales                       |
| cobertura de respaldo                                                                             | `CONT-DOM-011`                    | antes de afirmar capacidad de recuperación de información              |
| runbooks, restauración, failover, retorno y validación funcional                                  | `CONT-DOM-012`                    | antes de ejecutar recuperación técnica/funcional                       |
| continuidad de proveedores, energía, red, pagos, transporte y canales                             | `CONT-DOM-013`                    | antes de depender de alternativas externas en un plan                  |
| ejercicios, tiempos observados y evidencia de readiness                                           | `CONT-DOM-014`                    | antes de afirmar que el ciclo funciona bajo escenarios controlados     |
| revisión posterior, acciones, eficacia y actualización                                            | `CONT-DOM-015`                    | después de incidentes/ejercicios y ante cambios materiales             |
| permiso de declarar, activar, escalar, desactivar o aceptar decisiones excepcionales              | `CONT-AUTH-001` a `CONT-AUTH-004` | antes de cualquier ejecución real                                      |
| superficies ejecutivas y centro de mando                                                          | `CONT-UX-001` y `CONT-UX-002`     | antes de implementar operación visual del ciclo                        |
| comunicaciones internas/externas                                                                  | `CONT-UX-006` y `CONT-DOM-006`    | antes de emitir mensajes de crisis gobernados                          |
| contratos entre aplicaciones, estado de salud, degradación e incidente                            | `CONT-INT-001` y `CONT-INT-002`   | antes de automatizar correlación o cambio de estado entre aplicaciones |
| continuidad externa                                                                               | `CONT-INT-003`                    | antes de automatizar escalamiento/failover con terceros                |
| replay, retorno y conciliación                                                                    | `CONT-INT-004`                    | antes de automatizar reincorporación productiva                        |

No queda una decisión material identificada en esta tarea sin propietario documental y condición de salida.

---

#### 28. Cobertura de hallazgos heredados

Esta tarea cierra documentalmente, dentro de su alcance:

- `H-CAP-SCOPE-018-008`: se establece una taxonomía que relaciona, pero no fusiona, incidentes laborales, SST, tecnológicos, de información y de continuidad;
- `H-CAP-SCOPE-018-009`: se establecen criterios comunes y separados de declaración, activación, escalamiento, desactivación y cierre;
- `H-CAP-SCOPE-018-010`: se materializa una matriz común de naturaleza, alcance, impacto, urgencia y severidad empresarial.

No se apropia de `H-CAP-SCOPE-018-011` ni `H-CAP-SCOPE-018-012`, que permanecen en `CONT-DOM-006` y autorización; tampoco de comunicación de crisis, folios, respaldos, runbooks, proveedores o ejercicios, que conservan sus tareas propietarias.

---

#### 29. Cobertura de requisitos vigente

La conducta definida aquí ya está protegida por `TREQ-CONT-002`, que exige clasificación por naturaleza, alcance, impacto, urgencia y severidad y conserva detección, declaración, activación, responsables, decisiones, escalamiento, comunicaciones, contención, recuperación y desactivación con autoridad explícita y bitácora.

El cierre se encuentra además protegido por `TREQ-CONT-005`, que exige conciliación de los efectos aplicables y ausencia de pendientes sin propietario. `TREQ-INTEGRATION-023` protege la correlación entre incidente, procesos, aplicaciones, datos, infraestructura, proveedores, estados, mecanismos alternos y retorno sin activaciones contradictorias. `TREQ-AUTH-015` protege la evidencia correlacionable de actor, decisión, razones, versión y timestamp.

Esta tarea especializa esos comportamientos documentales sin introducir una nueva acción ejecutable, permiso, integración física, modalidad de contingencia o efecto empresarial.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la taxonomía, severidad, ciclo de declaración/activación, escalamiento, desactivación y cierre desarrollados aquí materializan obligaciones ya registradas para continuidad, conciliación, integración y auditoría. No se crea una conducta ejecutable nueva ni se modifica el estado, prioridad, implementación o evidencia de un requisito vigente.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 30. Criterios de aceptación

1. existe una única semántica empresarial para incidentes de continuidad;
2. señal, alerta, incidente de dominio e incidente de continuidad permanecen conceptos distintos;
3. un incidente de continuidad puede relacionar varios expedientes sin fusionarlos;
4. incidente laboral e incidente de continuidad permanecen separados;
5. incidente SST e incidente de continuidad permanecen separados;
6. incidente tecnológico e incidente de continuidad permanecen separados;
7. incidente de información/seguridad e incidente de continuidad permanecen separados;
8. cerrar un ticket técnico no cierra continuidad;
9. cerrar continuidad no cierra automáticamente problema, SST, privacidad, seguridad o causa raíz;
10. se adoptan exactamente diez categorías de naturaleza mínimas heredadas;
11. una naturaleza no preasigna severidad;
12. un evento múltiple conserva sus expedientes componentes;
13. existen seis niveles documentales de alcance;
14. alcance y severidad permanecen distintos;
15. existen cuatro niveles de impacto;
16. impacto `I0` no obliga a declarar continuidad;
17. impacto `I1` conserva MBCO;
18. impacto `I2` reconoce MBCO amenazado/incumplido o RTO comprometido;
19. impacto `I3` representa daño inaceptable/irreversible, MTPD superado o control protector indisponible;
20. existen tres clases de urgencia;
21. urgencia se deriva de capacidad de esperar la decisión y no de prioridad de ticket;
22. existen cuatro niveles de severidad de continuidad;
23. severidad se decide por el criterio material más alto demostrado;
24. no existe fórmula aritmética que esconda un criterio protector;
25. criticidad BIA no equivale a severidad;
26. prioridad de recuperación no equivale a severidad;
27. prioridad de ticket no equivale a severidad;
28. ningún servicio recibe severidad antes de un incidente real;
29. las 69 filas declaran `NO_PREASIGNADA` como severidad previa;
30. `SEV-C1` exige MBCO conservado y recuperación prevista dentro de RTO;
31. `SEV-C2` cubre MBCO amenazado/incumplido o RTO previsto excedido sin criterio superior;
32. `SEV-C3` cubre cascada, multialcance o pronóstico que no recupera antes de MTPD;
33. `SEV-C4` cubre MTPD superado, control protector indisponible o efecto irreversible/no dispensable;
34. `CRITICA_PROTECCION` no preasigna automáticamente `SEV-C4`;
35. `DIFERIBLE_CONTROLADA` puede escalar si deja de ser diferible de forma controlada;
36. un incidente puede saltar directamente a una severidad superior;
37. la incertidumbre no se interpreta como salud confirmada;
38. el reloj empresarial se basa en MBCO/RTO/MTPD y no en apertura de ticket;
39. un incidente puede declararse antes de incumplir MBCO si existe amenaza material demostrada;
40. declarar y activar permanecen decisiones distintas;
41. declaración conserva razón, alcance, severidad y evidencia;
42. declaración no concede permisos de ejecución;
43. existen tres modalidades de activación;
44. `ACTIVACION_PARCIAL` mantiene alcance acotado;
45. `ACTIVACION_AMPLIADA` cubre varios procesos/sedes o dependencia compartida;
46. `ACTIVACION_EMPRESARIAL_PROTECTORA` cubre crisis/alcance empresarial;
47. una activación puede ampliarse con decisión auditada;
48. una activación puede reducirse solo con evidencia;
49. un proveedor no activa continuidad empresarial;
50. una automatización no activa continuidad empresarial;
51. acceso de emergencia no se deduce de la activación;
52. failover no se deduce de la activación;
53. restauración no se deduce de la activación;
54. cambio de proveedor no se deduce de la activación;
55. existen disparadores explícitos de escalamiento;
56. pérdida de MBCO obliga a reevaluar severidad;
57. pronóstico posterior a RTO obliga a reevaluar urgencia/activación;
58. pronóstico posterior a MTPD obliga a escalar antes del daño inaceptable;
59. MTPD superado impide mantener una severidad inferior por conveniencia;
60. pérdida de control protector fuerza criterio crítico;
61. expansión multisede/multiproceso obliga a reevaluar alcance y severidad;
62. dependencia compartida se usa solo cuando está demostrada;
63. alternativa fallida se registra sin inventar otra;
64. conflicto de integridad/autorización/privacidad puede escalar el incidente;
65. toda escalada conserva estado anterior y motivo;
66. desescalamiento requiere evidencia;
67. desescalamiento conserva severidad máxima histórica;
68. no se desescala para ocultar vencimientos o presión operativa;
69. se materializa un ciclo documental desde detección hasta cierre;
70. existe salida explícita `NO_DECLARADO_COMO_CONTINUIDAD`;
71. un hecho no declarado conserva su expediente fuente;
72. un `SEV-C1` puede cerrarse sin activación si nunca requirió plan activo;
73. contención y recuperación permanecen distinguibles;
74. operación mínima permanece en `CONT-DOM-007`;
75. modalidad de contingencia permanece en `CONT-DOM-008`;
76. captura durante falla permanece en `CONT-DOM-009`;
77. reincorporación permanece en `CONT-DOM-010`;
78. respaldos permanecen en `CONT-DOM-011`;
79. runbooks/failover permanecen en `CONT-DOM-012`;
80. continuidad externa permanece en `CONT-DOM-013`;
81. ejercicios permanecen en `CONT-DOM-014`;
82. revisión posterior permanece en `CONT-DOM-015`;
83. desactivación y cierre permanecen decisiones distintas;
84. desactivación exige MBCO conocido o estado protector aprobado;
85. desactivación exige expansión/cascada contenida;
86. desactivación no elimina pendientes por inferencia;
87. desactivación deja pendientes con propietario explícito;
88. cierre conserva severidad máxima y línea de tiempo;
89. cierre exige estado final por servicio BCS afectado;
90. cierre exige validación funcional del propietario de proceso;
91. health check técnico no basta para cierre empresarial;
92. cierre exige tratamiento de conciliaciones aplicables;
93. cierre prohíbe pendientes de continuidad sin propietario;
94. cierre trata duplicados, conflictos, vencimientos y efectos parciales;
95. cierre registra estado de proveedores relevantes;
96. cierre conserva comunicaciones finales cuando apliquen;
97. cierre conserva actor, decisión, razones, versión y timestamp;
98. causa no confirmada no se inventa para cerrar;
99. acciones de mejora residuales tienen tarea/propietario y salida;
100. cierre requiere autoridad acorde con la máxima severidad alcanzada;
101. se preservan exactamente 69 servicios `BCS-*`;
102. se preservan exactamente 69 BIA;
103. se preservan exactamente 69 procesos `VPROC-*`;
104. no existen servicios faltantes ni duplicados;
105. la distribución de propietarias suma 69;
106. la distribución de criticidad permanece 12/20/31/6;
107. las dos filas AURA permanecen bloqueadas;
108. las otras 67 filas conservan baseline de incidente especificado;
109. AURA diferida no recibe activación operativa por esta tarea;
110. Vaila, Catering y puntos externos no se convierten en sedes por un incidente;
111. no se confirma ningún SPOF nuevo;
112. no se aprueba ningún sustituto nuevo;
113. no se acepta ningún riesgo nuevo;
114. no se declara ninguna capacidad validada;
115. no se declara ningún incidente real;
116. no se ejecuta ninguna activación, desactivación o cierre real;
117. la autoridad física/digital permanece en `CONT-AUTH-*`;
118. el mando, sustitución y bitácora detallada permanecen en `CONT-DOM-006`;
119. no se modifica ningún requisito de prueba;
120. no se modifica código, DDL, DML, datos, configuración, infraestructura, proveedor ni Supabase;
121. no se ejecuta respaldo, restauración, failover, interrupción ni prueba destructiva;
122. `CONT-DOM-006` permanece únicamente reservada.

---

#### 31. Balance de cierre

| Control                                         |                                   Resultado |
| ----------------------------------------------- | ------------------------------------------: |
| Servicios con baseline de incidente             |                                 **69 / 69** |
| Naturalezas                                     |                                      **10** |
| Alcances                                        |                                       **6** |
| Impactos                                        |                                       **4** |
| Urgencias                                       |                                       **3** |
| Severidades                                     |                                       **4** |
| Modalidades de activación                       |                                       **3** |
| Criterios de declaración                        |                                      **10** |
| Disparadores de escalamiento                    |                                      **13** |
| Criterios de desactivación                      |                                       **8** |
| Criterios de cierre                             |                                      **15** |
| Criterios de aceptación documental              |                                     **122** |
| Hallazgos propietarios cerrados documentalmente | **3** — `H-CAP-SCOPE-018-008`, `009`, `010` |
| Incidentes reales creados                       |                                       **0** |
| Riesgos aceptados                               |                                       **0** |
| Cambios físicos                                 |                                       **0** |
| Requisitos de prueba creados/modificados        |                                       **0** |

---

#### 32. Límites de la tarea

Esta tarea no:

- asigna personas como director, sustituto o responsable nominal;
- implementa permisos para declarar, activar, desactivar o cerrar;
- crea acceso de emergencia;
- envía comunicaciones reales;
- define plantillas o árbol de comunicaciones de crisis;
- activa operación mínima;
- elige modalidad manual, offline, snapshot, sede o proveedor alternativo;
- crea folios o formularios operativos;
- reincorpora trabajo contingente;
- modifica respaldos;
- ejecuta restauraciones;
- ejecuta failover;
- cambia proveedores, contratos, energía, red o transporte;
- ejecuta ejercicios;
- declara readiness;
- cambia la criticidad BIA o los objetivos MTPD/RTO/RPO/MBCO aprobados;
- cambia datos, código, configuración, migraciones, RLS, RPC o Supabase.

---

#### 33. Continuidad

ÚLTIMA TAREA APROBADA
`CONT-DOM-004 — Definir MTPD, RTO, RPO, MBCO, prioridades y criterios de aceptación de riesgo`

TAREA ACTUAL APROBADA
`CONT-DOM-005 — Definir taxonomía, severidad, declaración, activación, escalamiento, desactivación y cierre de incidentes de continuidad`

SIGUIENTE TAREA RESERVADA
`CONT-DOM-006 — Definir mando, sustitución, bitácora de decisiones, comunicación de crisis y coordinación externa`


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
