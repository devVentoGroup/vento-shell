### MINI-BLOQUE — INTEGRACIONES DE CONTINUIDAD Y REINCORPORACION

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **integraciones de continuidad y reincorporacion** dentro de **AC CONTINUIDAD OPERATIVA Y RECUPERACION**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `CONT-INT-001` a `CONT-INT-004` — 4 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `CONT-INT-001`: Definir contratos de criticidad, dependencia, salud, estado degradado e incidente con todas las aplicaciones
- `CONT-INT-002`: Definir contratos con SHELL, VISO, ANIMA, BLOQUE Z, AA, AB, E4, E5, T, U y X
- `CONT-INT-003`: Definir contratos con Supabase, nube, energía, ISP, pagos, mensajería, transporte y proveedores críticos
- `CONT-INT-004`: Definir contratos de captura, replay, idempotencia, reincorporación, conciliación y retorno al servicio normal
<!-- PLAN-SECTION-META:END -->

### ✅ CONT-INT-001 — Definir contratos de criticidad, dependencia, salud, estado degradado e incidente con todas las aplicaciones

**Estado:** APROBADA
**Tarea anterior:** `CONT-UX-007 — Diseñar ejercicios, revisión posterior, acciones y comprobación de readiness` — APROBADA
**Tarea siguiente:** `CONT-INT-002 — Definir contratos con SHELL, VISO, ANIMA, BLOQUE Z, AA, AB, E4, E5, T, U y X` — RESERVADA
**Tipo de tarea:** documental; contrato canónico transversal de criticidad proyectada, dependencia entre aplicaciones, salud, degradación e incidencia de continuidad
**Bloque:** AC — Continuidad operativa y recuperación
**Mini-bloque:** Integraciones de continuidad y reincorporación
**Fase:** exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/AC_CONTINUIDAD_OPERATIVA_Y_RECUPERACION/04_INTEGRACIONES_DE_CONTINUIDAD_Y_REINCORPORACION.md`
**Implementación técnica u operativa:** no autorizada
**Código, DDL, DML, migraciones, RLS, RPC, secretos, despliegues, cambios de datos o configuración productiva:** no autorizados
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el contrato común mediante el cual todas las aplicaciones canónicas de Vento OS podrán expresar y consumir, sin ambigüedad ni transferencia de autoridad:

- la criticidad empresarial que les afecta en un contexto concreto;
- las dependencias entre una aplicación consumidora y una aplicación proveedora;
- el estado de salud observado para un alcance definido;
- la degradación parcial o total de capacidades;
- la relación entre señales técnicas y un incidente de continuidad;
- la propagación controlada de efectos entre aplicaciones;
- la evidencia mínima para cambiar o recuperar un estado;
- la separación entre disponibilidad técnica, operación mínima, recuperación funcional y cierre empresarial.

La tarea cubre las diez aplicaciones canónicas:

```text
shell
anima
viso
nexo
fogo
origo
pulso
numera
aura
pass
```

El contrato no declara el estado runtime actual de ninguna aplicación, no prueba disponibilidad, no crea una topología técnica no evidenciada, no activa un incidente y no concede autoridad de continuidad.

---

#### 2. Resultado sustantivo

Queda materializado un contrato transversal con los siguientes resultados:

1. criticidad de aplicación definida como proyección contextual de los servicios BIA afectados, nunca como etiqueta estática del `app_code`;
2. conservación de los 69 servicios BIA y de su distribución canónica por aplicación propietaria;
3. conservación de las cuatro clases BIA y de los cuatro perfiles `CONT-OBJ-*` sin reinterpretarlos;
4. contrato de dependencia aplicación-a-aplicación con identidad, dirección, alcance, condición, capacidad requerida, evidencia, comportamiento ante falla y referencia de contingencia;
5. prohibición de crear dependencias únicamente porque dos aplicaciones intercambien información o aparezcan en el mismo proceso;
6. vocabulario único de salud de aplicación con `HEALTH_UNKNOWN`, `HEALTHY`, `DEGRADED` y `UNAVAILABLE`;
7. obligación de evaluar salud por alcance y capacidad, no como una bandera global sin contexto;
8. contrato explícito de frescura para impedir que una señal antigua mantenga una aplicación falsamente saludable;
9. contrato de degradación que distingue capacidad afectada, capacidad disponible, modo de lectura/escritura, trabajo pendiente, restricciones y fallback autorizado;
10. contrato de proyección de incidente desde señales de aplicación hacia servicios BIA y `VPROC-*` afectados;
11. separación obligatoria entre señal, degradación, incidente de dominio, incidente de continuidad, declaración y activación;
12. prohibición de que una alerta, health check, timeout, caída de aplicación o cambio de estado declare o active por sí solo continuidad;
13. propagación de impacto basada en dependencia material y capacidad requerida, nunca por copia automática del estado de la aplicación proveedora;
14. reglas para señales contradictorias, desconocidas, atrasadas o insuficientes;
15. reglas de recuperación que exigen evidencia nueva y validación de la capacidad propietaria;
16. prohibición de convertir `HEALTHY` en sinónimo de proceso empresarial recuperado;
17. prohibición de cerrar un incidente por recuperación técnica aislada;
18. matriz materializada de aplicación para las diez identidades canónicas;
19. tratamiento especial de SHELL como hub sin propiedad de procesos empresariales;
20. tratamiento especial de VISO como propietaria de `VPROC-0062` y del expediente transversal de continuidad;
21. tratamiento especial de AURA como aplicación activa de catálogo pero diferida en roadmap, sin habilitación operativa implícita;
22. tratamiento especial de PASS bajo dominio de identidad cliente, sin herencia de RBAC laboral;
23. conservación de la propiedad funcional de ANIMA, NEXO, FOGO, ORIGO, PULSO y NUMERA sobre sus hechos y recuperaciones de dominio;
24. contrato mínimo de interoperabilidad para serializar criticidad, salud, dependencia y referencia de incidente sin duplicar la fuente de verdad;
25. fronteras explícitas hacia `CONT-INT-002`, `CONT-INT-003` y `CONT-INT-004`;
26. cero afirmaciones de implementación o validación runtime;
27. cero cambios físicos;
28. cero cambios de requisitos de prueba.

---

#### 3. Entradas canónicas preservadas

Esta tarea consume y conserva, sin redefinir:

- `CONT-DOM-001` para gobierno federado, primacía del resultado empresarial, fuente de verdad única, autorización persistente y separación entre recuperación técnica y empresarial;
- `CONT-DOM-002` para los 69 servicios BIA, las cuatro clases de criticidad y sus niveles mínimos;
- `CONT-DOM-003` para los 69 mapas de dependencia, 552 decisiones de dimensión, 67 candidatos de concentración pendientes de evidencia, dos bloqueos AURA, cero SPOF confirmados, cero sustitutos aprobados y cero ciclos duros confirmados;
- `CONT-DOM-004` para `CONT-OBJ-001` a `CONT-OBJ-004`, MTPD, RTO, RPO, MBCO y prioridad de recuperación por servicio;
- `CONT-DOM-005` para impacto, urgencia, severidad, declaración, activación, escalamiento, desescalamiento, desactivación y cierre;
- `CONT-DOM-006` para mando, sustitución, bitácora, decisiones y comunicación;
- `CONT-DOM-007` y `CONT-DOM-008` para operación mínima y estrategia de contingencia por servicio;
- `CONT-DOM-009` a `CONT-DOM-012` para captura, reincorporación, respaldo, recuperación técnica, failover, validación y retorno;
- `CONT-DOM-013` para dependencias y alternativas externas;
- `CONT-DOM-014` y `CONT-DOM-015` para ejercicios, readiness, revisión posterior, acciones y eficacia;
- `CONT-AUTH-001` a `CONT-AUTH-004` para autoridad explícita, acceso excepcional, protección de información y segregación;
- `CONT-UX-001` a `CONT-UX-007` para representación ejecutiva, mando, runbooks, contingencia, recuperación, comunicación y ejercicios;
- el catálogo canónico de diez aplicaciones y sus identidades estables;
- el registro canónico de procesos y propiedad de `VPROC-0001` a `VPROC-0069`;
- el registro canónico de eventos y relaciones de integración ya aprobadas;
- `TREQ-CONT-001`, `TREQ-CONT-003` y `TREQ-CONT-004` como cobertura vigente de BIA, contingencia y recuperación;
- `TREQ-INTEGRATION-003`, `TREQ-INTEGRATION-004` y `TREQ-INTEGRATION-023` como cobertura vigente de idempotencia, trazabilidad y continuidad transversal;
- `TREQ-INTEGRATION-039`, `TREQ-INTEGRATION-040`, `TREQ-INTEGRATION-057`, `TREQ-INTEGRATION-059` y `TREQ-INTEGRATION-070` para autorización independiente, frontera de escritura, propiedad única, SHELL y AURA.

La tarea no modifica ninguna de esas decisiones.

---

#### 4. Decisión principal

Vento OS adopta una separación obligatoria entre cinco conceptos:

```text
CRITICIDAD EMPRESARIAL
≠
DEPENDENCIA ENTRE APLICACIONES
≠
SALUD DE APLICACIÓN
≠
ESTADO DEGRADADO
≠
INCIDENTE DE CONTINUIDAD
```

Una aplicación puede estar técnicamente degradada y no producir todavía una afectación material al MBCO.

Una aplicación puede estar técnicamente saludable y aun así participar en un proceso empresarial no recuperado por datos pendientes, recursos físicos, personas, autorización, infraestructura, proveedor, conciliación o evidencia.

Una dependencia puede fallar sin volver indisponible a su consumidora cuando exista una ruta de contingencia autorizada que conserve el resultado mínimo.

Una señal puede exigir evaluación inmediata sin constituir por sí sola una declaración de continuidad.

Regla cardinal:

```text
HEALTH TÉCNICO
≠
RECUPERACIÓN EMPRESARIAL
```

---

#### 5. Universo canónico y reconciliación de propiedad

La propiedad empresarial vigente de los 69 procesos se conserva exactamente así:

| Aplicación | Procesos `VPROC-*` propietarios | Regla de esta tarea                                                                            |
| ---------- | ------------------------------: | ---------------------------------------------------------------------------------------------- |
| `shell`    |                               0 | participa como hub, contexto, navegación y consumidor técnico; no adquiere propiedad funcional |
| `anima`    |                               1 | conserva sus hechos de asistencia y su recuperación de dominio                                 |
| `viso`     |                              20 | conserva sus procesos y la propiedad de `VPROC-0062` para el expediente transversal            |
| `nexo`     |                              16 | conserva hechos de inventario, logística, activos e instalaciones que le pertenecen            |
| `fogo`     |                               6 | conserva hechos productivos y de calidad que le pertenecen                                     |
| `origo`    |                               4 | conserva hechos de compras y recepción comercial que le pertenecen                             |
| `pulso`    |                              12 | conserva hechos comerciales, pedido, pago, caja y atención que le pertenecen                   |
| `numera`   |                               7 | conserva hechos financieros, control y analítica que le pertenecen                             |
| `aura`     |                               2 | conserva propiedad documental, pero permanece diferida para operación                          |
| `pass`     |                               1 | conserva hechos de cliente/fidelización bajo dominio cliente                                   |
| **Total**  |                          **69** | **sin faltantes ni duplicados**                                                                |

La distribución BIA preservada es:

| Clase                  | Servicios |
| ---------------------- | --------: |
| `CRITICA_PROTECCION`   |        12 |
| `CRITICA_OPERACIONAL`  |        20 |
| `ALTA_CONTROL`         |        31 |
| `DIFERIBLE_CONTROLADA` |         6 |
| **Total**              |    **69** |

Estas distribuciones son invariantes de entrada. Esta tarea no reasigna procesos ni cambia criticidad BIA.

---

#### 6. Contrato de criticidad proyectada

No existe una `criticidad_de_aplicacion` permanente derivada de:

- ser `Núcleo`;
- ser `Operativa`, `Híbrida`, `Administrativa`, `Hub` o `Cliente`;
- estar activa en el catálogo;
- tener muchos procesos;
- tener muchas dependencias;
- producir muchos eventos;
- estar instalada en una sede;
- estar disponible o indisponible.

La criticidad efectiva para una aplicación se proyecta desde los servicios BIA materialmente afectados en un alcance concreto.

Cada proyección deberá conservar como mínimo:

| Campo conceptual          | Regla                                            |
| ------------------------- | ------------------------------------------------ |
| `application_code`        | uno de los diez códigos canónicos                |
| `scope`                   | contexto empresarial al que aplica la proyección |
| `affected_service_refs`   | servicios `BCS-VPROC-*` realmente afectados      |
| `affected_process_refs`   | procesos `VPROC-*` correspondientes              |
| `bia_version_refs`        | versiones BIA vigentes usadas para decidir       |
| `criticality_classes`     | clases BIA de los servicios afectados            |
| `continuity_profile_refs` | perfiles `CONT-OBJ-*` aplicables                 |
| `mbco_refs`               | mínimos empresariales aplicables                 |
| `rto_refs`                | objetivos RTO aplicables por servicio            |
| `rpo_refs`                | objetivos RPO aplicables por servicio            |
| `mtpd_refs`               | MTPD aplicables por servicio                     |
| `recovery_priority_refs`  | prioridades aprobadas por servicio               |
| `projected_at`            | momento en que se construyó la proyección        |
| `evidence_refs`           | evidencia que demuestra la afectación            |
| `contract_version`        | versión del contrato interoperable               |

Reglas:

1. la proyección conserva cada servicio por separado;
2. una vista agregada nunca elimina la clase más protectora aplicable;
3. criticidad BIA no se convierte en severidad de incidente;
4. criticidad BIA no se convierte automáticamente en prioridad runtime;
5. una aplicación puede tener simultáneamente servicios de distintas clases;
6. una aplicación sin proceso propietario, como SHELL, puede ser dependencia material de otros servicios sin recibir una criticidad propia inventada;
7. la proyección se recalcula cuando cambia el alcance, la evidencia o la versión BIA aplicable;
8. los valores del BIA se referencian de forma versionada para preservar la decisión tomada en el momento del incidente.

---

#### 7. Contrato de dependencia entre aplicaciones

Una dependencia aplicación-a-aplicación existe únicamente cuando una capacidad o resultado de una aplicación consumidora requiere una capacidad, dato, contexto o hecho propiedad de otra aplicación dentro de un proceso o servicio identificable.

Cada dependencia materializada deberá conservar:

| Campo conceptual          | Regla                                                                       |
| ------------------------- | --------------------------------------------------------------------------- |
| `dependency_ref`          | identidad estable de la relación en la implementación futura                |
| `consumer_application`    | aplicación cuyo resultado depende de otra                                   |
| `provider_application`    | aplicación propietaria de la capacidad requerida                            |
| `consumer_service_refs`   | servicios BIA que justifican la dependencia                                 |
| `consumer_process_refs`   | procesos que consumen la dependencia                                        |
| `provider_capability_ref` | capacidad, contrato, evento, proyección o contexto requerido                |
| `relationship_basis`      | fuente canónica que demuestra la relación                                   |
| `scope`                   | sede, área, canal, variante, recurso o contexto donde aplica                |
| `activation_condition`    | condición que vuelve material la dependencia cuando no es universal         |
| `required_for_mbco`       | indica si la dependencia es necesaria para conservar el mínimo del servicio |
| `freshness_requirement`   | antigüedad máxima aceptable cuando se consuma una referencia o snapshot     |
| `failure_effect`          | efecto esperado sobre la capacidad consumidora si la dependencia falla      |
| `contingency_ref`         | estrategia ya aprobada del servicio, cuando exista                          |
| `recovery_order_ref`      | regla de orden aprobada, sin inventar una secuencia técnica nueva           |
| `evidence_refs`           | evidencia que confirma la relación y su estado                              |
| `contract_version`        | versión del contrato                                                        |

No se crea una dependencia por:

- compartir base de datos;
- compartir repositorio;
- compartir proveedor;
- aparecer en la misma navegación;
- intercambiar un mensaje sin necesidad empresarial;
- tener al mismo actor;
- estar en la misma sede;
- usar SHELL;
- estar en el catálogo.

---

#### 8. Estados de una dependencia

La relación BIA mantiene sus estados ya aprobados:

- `VINCULO_CANONICO`;
- `CONDICIONAL`;
- `NO_DIRECTA`;
- `BLOQUEADO`.

Para una instancia de dependencia aplicación-a-aplicación, el estado de salud observado utiliza el mismo vocabulario definido para aplicaciones:

- `HEALTH_UNKNOWN`;
- `HEALTHY`;
- `DEGRADED`;
- `UNAVAILABLE`.

El estado de la arista nunca se obtiene copiando ciegamente el estado global de la proveedora.

Ejemplo normativo:

```text
provider_application = nexo
provider_health = DEGRADED
consumer_application = pulso

si la capacidad requerida por PULSO continúa disponible y dentro del contrato:
dependency_health = HEALTHY

si la capacidad requerida opera parcialmente:
dependency_health = DEGRADED

si la capacidad requerida no puede suministrarse:
dependency_health = UNAVAILABLE

si no existe evidencia suficientemente fresca:
dependency_health = HEALTH_UNKNOWN
```

La aplicación consumidora evalúa su propio resultado; no puede declarar recuperada a la proveedora.

---

#### 9. Vocabulario canónico de salud

Toda aplicación y toda dependencia materializada utilizarán exactamente uno de estos estados para un alcance observado:

| Estado           | Semántica                                                                                                                                                              |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `HEALTH_UNKNOWN` | no existe evidencia suficientemente reciente, consistente o completa para afirmar otro estado                                                                          |
| `HEALTHY`        | la capacidad declarada para el alcance está disponible dentro del contrato observado y no existe deterioro material conocido                                           |
| `DEGRADED`       | existe deterioro parcial, reducción de capacidad, restricción, latencia, pérdida de función o dependencia afectada, pero alguna capacidad contractual sigue disponible |
| `UNAVAILABLE`    | la capacidad declarada para el alcance no puede ser suministrada o no puede utilizarse de forma válida                                                                 |

Reglas:

1. `HEALTH_UNKNOWN` es un estado de primera clase; nunca se transforma en `HEALTHY` por ausencia de alerta.
2. `HEALTHY` exige evidencia positiva y vigente para el alcance declarado.
3. `DEGRADED` exige identificar qué capacidad se conserva y cuál está afectada.
4. `UNAVAILABLE` no significa automáticamente que exista incidente de continuidad.
5. ningún estado de salud concede permisos o autoridad.
6. ningún estado de salud modifica la propiedad de datos o procesos.
7. el estado debe ser scoped; una aplicación puede estar saludable para una capacidad y degradada para otra.
8. una aplicación no puede anunciar salud de otra salvo como observación referenciada.
9. un estado técnico no sustituye validación funcional.

---

#### 10. Alcance obligatorio del health

Toda observación de salud debe responder:

```text
qué aplicación
qué capacidad
qué servicio/proceso puede verse afectado
en qué sede/área/canal/contexto
desde cuándo
con qué evidencia
qué tan fresca es la evidencia
qué parte sigue operativa
qué parte no está disponible
qué dependencia contribuye
qué estrategia de contingencia es aplicable por referencia
si existe incidente relacionado
```

Queda prohibido modelar como suficiente:

```text
app = "up"
```

sin alcance, evidencia, capacidad y tiempo.

---

#### 11. Contrato mínimo de observación de salud

Toda observación interoperable deberá poder expresar:

| Campo conceptual                          | Obligación                                                      |
| ----------------------------------------- | --------------------------------------------------------------- |
| `application_code`                        | obligatoria                                                     |
| `health_state`                            | obligatoria                                                     |
| `capability_scope`                        | obligatoria                                                     |
| `business_scope`                          | obligatoria cuando pueda afectar un servicio BIA                |
| `observed_at`                             | obligatoria                                                     |
| `effective_from`                          | obligatoria cuando el inicio conocido difiera de la observación |
| `source_kind`                             | obligatoria                                                     |
| `source_ref`                              | obligatoria                                                     |
| `freshness_until` o regla equivalente     | obligatoria                                                     |
| `reason_code` o clasificación equivalente | obligatoria                                                     |
| `affected_dependency_refs`                | cuando aplique                                                  |
| `affected_service_refs`                   | cuando exista proyección BIA                                    |
| `affected_process_refs`                   | cuando exista proyección BIA                                    |
| `incident_ref`                            | solo cuando exista relación formal                              |
| `evidence_refs`                           | obligatoria para cambios materiales                             |
| `contract_version`                        | obligatoria                                                     |

`source_kind` puede representar una fuente técnica, funcional o de observación autorizada, pero la tarea no fija todavía sensores, endpoints, herramientas, proveedores o infraestructura concretos.

---

#### 12. Frescura, incertidumbre y conflicto

La salud interoperable queda gobernada por estas reglas:

1. toda señal tiene una vigencia;
2. una señal vencida deja de sostener el estado previo;
3. una señal vencida produce `HEALTH_UNKNOWN` hasta obtener evidencia nueva, salvo que exista evidencia posterior más restrictiva;
4. dos señales contradictorias no se resuelven escogiendo la más favorable;
5. cuando la contradicción impida determinar el estado real, se usa `HEALTH_UNKNOWN` y se conserva el conflicto;
6. una señal de recuperación no borra la ventana de degradación anterior;
7. cambios de reloj o timestamp inválido deben quedar evidenciados y no pueden fabricar continuidad temporal;
8. caché, snapshot o lectura diferida deben identificar su antigüedad;
9. `HEALTH_UNKNOWN` puede producir escalamiento de evaluación cuando la incertidumbre impida asegurar un control protector;
10. el contrato físico de observabilidad pertenece a las tareas técnicas posteriores, no a esta definición documental.

---

#### 13. Contrato de estado degradado

`DEGRADED` no es una etiqueta decorativa. Debe materializar una diferencia operativa concreta.

Cada degradación deberá conservar:

| Campo conceptual           | Regla                                                        |
| -------------------------- | ------------------------------------------------------------ |
| `application_code`         | aplicación afectada                                          |
| `capability_scope`         | capacidad degradada                                          |
| `available_capabilities`   | capacidades que siguen utilizables                           |
| `unavailable_capabilities` | capacidades no disponibles                                   |
| `restricted_capabilities`  | capacidades disponibles con restricción                      |
| `read_behavior`            | qué lectura sigue autorizada                                 |
| `write_behavior`           | qué escritura sigue autorizada, queda pendiente o se bloquea |
| `data_freshness`           | antigüedad y versión de datos utilizados                     |
| `pending_work_ref`         | referencia al trabajo no confirmado, cuando exista           |
| `dependency_effects`       | dependencias afectadas aguas arriba o abajo                  |
| `contingency_ref`          | estrategia por servicio ya aprobada                          |
| `business_effect`          | resultado empresarial afectado o en riesgo                   |
| `protective_constraints`   | controles que no pueden relajarse                            |
| `incident_ref`             | si existe incidente correlacionado                           |
| `started_at`               | inicio conocido                                              |
| `last_observed_at`         | última evidencia                                             |
| `evidence_refs`            | soporte                                                      |
| `contract_version`         | versión                                                      |

---

#### 14. Comportamiento de lectura y escritura durante degradación

El contrato no autoriza una misma política universal para todas las aplicaciones.

La capacidad afectada deberá terminar en una decisión explícita compatible con su servicio BIA y estrategia aprobada, por ejemplo:

- operación normal en una capacidad no afectada;
- lectura de referencia vigente y controlada;
- preparación de borrador sin efecto empresarial;
- captura pendiente trazable;
- procedimiento manual controlado;
- reducción de capacidad;
- diferimiento con propietario y vencimiento;
- bloqueo protector.

Reglas:

1. una UI disponible no habilita escritura si el efecto propietario no puede confirmarse;
2. una API disponible no significa que el dato sea suficientemente fresco;
3. una cola aceptando mensajes no significa que el efecto empresarial esté confirmado;
4. un snapshot legible no se convierte en nueva fuente de verdad;
5. una operación pendiente se presenta como pendiente;
6. un rechazo o estado desconocido no se presenta como éxito;
7. una degradación no habilita bypass de autorización, privacidad, SST, inocuidad, custodia o integridad.

---

#### 15. Transiciones de salud

Las transiciones documentales permitidas son:

```text
HEALTH_UNKNOWN -> HEALTHY
HEALTH_UNKNOWN -> DEGRADED
HEALTH_UNKNOWN -> UNAVAILABLE

HEALTHY -> DEGRADED
HEALTHY -> UNAVAILABLE
HEALTHY -> HEALTH_UNKNOWN

DEGRADED -> HEALTHY
DEGRADED -> UNAVAILABLE
DEGRADED -> HEALTH_UNKNOWN

UNAVAILABLE -> DEGRADED
UNAVAILABLE -> HEALTHY
UNAVAILABLE -> HEALTH_UNKNOWN
```

Toda transición exige:

- evidencia nueva;
- tiempo de observación;
- alcance;
- fuente;
- razón;
- preservación del estado anterior;
- correlación con dependencias e incidente cuando aplique.

La transición `UNAVAILABLE -> HEALTHY` puede existir técnicamente, pero no afirma recuperación empresarial ni autoriza cierre.

---

#### 16. Regla de propagación entre aplicaciones

Una falla no se propaga por nombre de aplicación. Se propaga mediante una arista de dependencia material.

Modelo:

```text
SEÑAL DE PROVEEDORA
→ evaluar capacidad requerida
→ evaluar dependencia material
→ evaluar capacidad de la consumidora
→ aplicar contingencia autorizada si existe
→ proyectar efecto BIA
→ evaluar impacto empresarial
→ relacionar o escalar incidente cuando corresponda
```

Queda prohibido:

```text
provider = UNAVAILABLE
=> consumer = UNAVAILABLE
```

como regla general.

La consumidora puede permanecer `HEALTHY`, pasar a `DEGRADED`, quedar `UNAVAILABLE` o entrar en `HEALTH_UNKNOWN` según la capacidad que realmente dependa de la proveedora, el alcance y la alternativa autorizada.

---

#### 17. Prevención de cascadas y ciclos aparentes

La tarea conserva la decisión previa de que existen cero ciclos duros confirmados con la evidencia documental vigente.

Por tanto:

1. no se declara ciclo duro por observar dos relaciones en sentidos opuestos;
2. debe demostrarse simultaneidad, necesidad del resultado mínimo, mismo alcance y ausencia de buffer/snapshot/alternativa que rompa el ciclo;
3. una degradación aguas abajo no retroconvierte automáticamente a la consumidora en dependencia de su propia consumidora;
4. una proyección, caché, réplica o reporte no se convierte en fuente propietaria para romper un ciclo;
5. un circuito de eventos no equivale a un ciclo empresarial;
6. cualquier ciclo real descubierto deberá conservar evidencia y actualizar la fuente canónica propietaria correspondiente antes de declararse como hecho.

---

#### 18. Contrato de proyección de incidente

Una señal de aplicación puede originar una evaluación, no una declaración automática.

La proyección deberá poder expresar:

| Campo conceptual          | Regla                                                                                                                                        |
| ------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| `signal_ref`              | señal u observación origen                                                                                                                   |
| `application_code`        | aplicación observada                                                                                                                         |
| `health_state`            | estado observado                                                                                                                             |
| `affected_service_refs`   | servicios BIA materialmente afectados o amenazados                                                                                           |
| `affected_process_refs`   | procesos correspondientes                                                                                                                    |
| `business_impact`         | `I0_SIN_AFECTACION_DE_CONTINUIDAD`, `I1_DEGRADACION_CONTROLADA`, `I2_MBCO_COMPROMETIDO` o `I3_INACEPTABLE_O_IRREVERSIBLE`                    |
| `urgency`                 | `U1_CONTROLADA`, `U2_PRIORITARIA` o `U3_INMEDIATA`, según corresponda                                                                        |
| `severity`                | `SEV-C1_CONTROLADA`, `SEV-C2_DEGRADADA`, `SEV-C3_MAYOR` o `SEV-C4_CRITICA`, solo si el incidente fue evaluado/declarado conforme al contrato |
| `continuity_incident_ref` | referencia al expediente transversal cuando exista                                                                                           |
| `domain_incident_refs`    | tickets o expedientes de dominio relacionados sin fusionarlos                                                                                |
| `activation_ref`          | únicamente si existe activación autorizada                                                                                                   |
| `scope`                   | servicio, proceso, sede, área, canal o dependencia afectada                                                                                  |
| `observed_at`             | tiempo de observación                                                                                                                        |
| `evidence_refs`           | evidencia                                                                                                                                    |
| `contract_version`        | versión                                                                                                                                      |

---

#### 19. Separación de señal, incidente y activación

Se conserva:

```text
health signal
≠
incidente técnico
≠
incidente de continuidad
≠
declaración
≠
activación
```

Una señal puede provenir de:

- aplicación;
- observabilidad;
- infraestructura;
- dependencia;
- persona;
- proveedor;
- reconciliación;
- validación funcional.

Pero ninguna señal concede autoridad.

La declaración y la activación continúan gobernadas por los contratos de dominio y autorización ya aprobados.

---

#### 20. Relación entre health e impacto empresarial

La interpretación se realiza por el servicio afectado:

| Situación                                                                       | Resultado mínimo                                                      |
| ------------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| señal sin amenaza material al MBCO                                              | conservar señal y referencia; no declarar continuidad por automatismo |
| degradación material con MBCO conservado y recuperación razonable dentro de RTO | evaluar `I1_DEGRADACION_CONTROLADA`; seguimiento proporcional         |
| MBCO amenazado/incumplido o recuperación prevista posterior a RTO               | evaluar `I2_MBCO_COMPROMETIDO` y la activación correspondiente        |
| dependencia compartida/cascada material o pronóstico posterior a MTPD           | escalar conforme al contrato de severidad                             |
| MTPD superado o control protector no asegurable                                 | `I3_INACEPTABLE_O_IRREVERSIBLE` y gobierno protector aplicable        |

El estado de aplicación nunca sustituye esta evaluación.

---

#### 21. Recuperación de salud

Para recuperar una capacidad desde `DEGRADED` o `UNAVAILABLE` se requiere como mínimo:

1. nueva evidencia de la fuente aplicable;
2. verificación de que la capacidad declarada vuelve a cumplir su contrato;
3. validación de datos o estado cuando la falla pudo producir divergencia;
4. verificación de dependencias necesarias;
5. preservación de trabajo pendiente;
6. referencia a conflictos, duplicados o estado desconocido cuando existan;
7. validación funcional del propietario del proceso cuando la afirmación pretenda trascender lo técnico;
8. conservación de la línea de tiempo;
9. no cerrar incidentes ni pendientes por inferencia.

La aplicación puede volver a `HEALTHY` mientras el servicio empresarial permanece en recuperación.

---

#### 22. Cierre empresarial

Se conserva la regla:

```text
HEALTHY
≠
INCIDENTE CERRADO
```

El cierre empresarial exige la combinación de:

- estado final conocido de los servicios afectados;
- validación funcional por propietarios;
- recuperación o protección del MBCO;
- tratamiento de trabajos pendientes;
- conciliaciones aplicables;
- resolución o propiedad explícita de conflictos;
- accesos excepcionales tratados;
- estado de dependencias relevantes conocido;
- desactivación controlada cuando corresponda;
- evidencia suficiente.

Esta tarea solo define cómo health e incidente se correlacionan; no ejecuta el cierre.

---

#### 23. Contrato mínimo interoperable

Cualquier representación técnica futura deberá poder transportar, como mínimo, sin mezclar fuentes de verdad:

```text
contract_version
application_code
capability_scope
business_scope
health_state
observed_at
effective_from
source_kind
source_ref
freshness_rule
reason_code
dependency_refs
affected_service_refs
affected_process_refs
continuity_profile_refs
incident_ref
correlation_ref
evidence_refs
```

Reglas de diseño:

1. `application_code` usa el código canónico estable;
2. los IDs empresariales se referencian, no se reemplazan por nombres visibles;
3. un payload de health no duplica el agregado empresarial;
4. evidencia sensible se referencia y protege; no se copia por comodidad;
5. productor técnico y propietario empresarial pueden ser identidades distintas y deben permanecer separadas;
6. la representación debe ser versionable;
7. campos desconocidos o faltantes no se interpretan como éxito;
8. la implementación física del esquema queda fuera de esta tarea.

---

#### 24. Correlación y causalidad

Toda señal o cambio material deberá permitir reconstruir:

```text
qué se observó
quién o qué lo observó
qué aplicación/capacidad afectó
qué dependencia estuvo involucrada
qué servicio BIA recibió impacto
qué proceso fue afectado
qué incidente se relacionó
qué decisión ocurrió después
qué evidencia sostuvo cada transición
```

La correlación no cambia propiedad:

- una señal producida por infraestructura no vuelve a infraestructura propietaria del proceso;
- una señal recibida por SHELL no vuelve a SHELL propietaria del hecho;
- un expediente de VISO no vuelve a VISO propietaria de los hechos de NEXO, FOGO, ORIGO, PULSO, NUMERA, ANIMA o PASS;
- una aplicación consumidora no puede reemitir como propio el hecho de la proveedora.

---

#### 25. Matriz canónica de las diez aplicaciones

| Orden | `app_code` | Tipo             | Dominio de identidad | Roadmap     | Procesos propietarios | Contrato de criticidad                                                                | Contrato de dependencia/health                                                    | Estado documental                   |
| ----: | ---------- | ---------------- | -------------------- | ----------- | --------------------: | ------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | ----------------------------------- |
|     1 | `shell`    | `Hub`            | `Laboral`            | `Núcleo`    |                     0 | proyección desde servicios dependientes; nunca criticidad estática                    | obligatorio para capacidades de hub/contexto/navegación que sean dependencia real | `ESPECIFICADO`                      |
|     2 | `anima`    | `Híbrida`        | `Laboral`            | `Núcleo`    |                     1 | proyección desde su servicio BIA y servicios que dependan materialmente de sus hechos | obligatorio; hechos laborales conservan propiedad ANIMA                           | `ESPECIFICADO`                      |
|     3 | `viso`     | `Administrativa` | `Laboral`            | `Núcleo`    |                    20 | proyección desde sus servicios BIA; incluye `VPROC-0062`                              | obligatorio; además conserva expediente transversal de continuidad                | `ESPECIFICADO`                      |
|     4 | `nexo`     | `Híbrida`        | `Laboral`            | `Núcleo`    |                    16 | proyección desde inventario, logística, activos e instalaciones afectados             | obligatorio; hechos físicos y logísticos permanecen propietarios                  | `ESPECIFICADO`                      |
|     5 | `fogo`     | `Operativa`      | `Laboral`            | `Núcleo`    |                     6 | proyección desde producción/calidad afectados                                         | obligatorio; degradación no puede relajar calidad o inocuidad                     | `ESPECIFICADO`                      |
|     6 | `origo`    | `Híbrida`        | `Laboral`            | `Núcleo`    |                     4 | proyección desde compras/recepción afectados                                          | obligatorio; no confunde recepción comercial con hecho físico de inventario       | `ESPECIFICADO`                      |
|     7 | `pulso`    | `Operativa`      | `Laboral`            | `Núcleo`    |                    12 | proyección desde ventas, pedidos, pagos, caja y cliente afectados                     | obligatorio; estado de pago desconocido nunca se presenta como éxito              | `ESPECIFICADO`                      |
|     8 | `numera`   | `Híbrida`        | `Laboral`            | `Núcleo`    |                     7 | proyección desde finanzas/control/analítica afectados                                 | obligatorio; hechos financieros requieren autoridad y conciliación                | `ESPECIFICADO`                      |
|     9 | `aura`     | `Administrativa` | `Laboral`            | `Diferido`  |                     2 | conserva BIA documental `DIFERIBLE_CONTROLADA`; sin habilitación operativa            | contrato documental aplicable; operación y publicación continúan bloqueadas       | `BLOQUEADO_POR_APLICACION_DIFERIDA` |
|    10 | `pass`     | `Cliente`        | `Cliente`            | `Adyacente` |                     1 | proyección desde cliente/fidelización y servicios consumidores                        | obligatorio; no hereda RBAC laboral                                               | `ESPECIFICADO`                      |
|       | **Total**  |                  |                      |             |                **69** | **10 identidades cubiertas**                                                          | **10 identidades cubiertas**                                                      | **sin identidad omitida**           |

---

#### 26. Regla específica de SHELL

SHELL:

- es aplicación `Hub`;
- tiene cero procesos empresariales propietarios en el catálogo de 69 procesos;
- puede ser dependencia de identidad, contexto, acceso, navegación o coordinación cuando una fuente canónica lo demuestre;
- no adquiere propiedad de los procesos por presentar o enrutar una experiencia;
- no puede emitir como propio un hecho empresarial de otro dominio;
- su indisponibilidad puede degradar superficies dependientes sin demostrar por sí sola que todos los procesos empresariales estén indisponibles;
- una ruta alternativa autorizada puede permitir que un proceso continúe sin SHELL si el contrato del proceso lo soporta;
- salud de SHELL no equivale a salud de Vento OS completo.

Estado documental: `ESPECIFICADO`.

---

#### 27. Regla específica de VISO

VISO conserva:

- 20 procesos propietarios;
- `VPROC-0062` como proceso canónico de continuidad;
- expediente transversal de incidente, mando, línea de tiempo, decisiones, comunicaciones referenciadas y pendientes de continuidad;
- separación entre expediente transversal y hechos propietarios de cada dominio.

Por tanto:

1. una caída de VISO puede afectar la coordinación de continuidad y deberá evaluarse como dependencia material cuando corresponda;
2. la indisponibilidad de VISO no transfiere propiedad de `VPROC-0062` a SHELL u otra aplicación;
3. una contingencia del expediente deberá preservar fuente, evidencia y posterior reincorporación;
4. restaurar VISO no significa que los demás procesos estén recuperados;
5. VISO no puede declarar recuperados hechos físicos, productivos, comerciales o financieros de otras aplicaciones sin validación propietaria.

Estado documental: `ESPECIFICADO`.

---

#### 28. Regla específica de ANIMA

ANIMA conserva:

- un proceso propietario: `VPROC-0008`;
- hechos de asistencia y correcciones auditables de su dominio;
- integración con contexto laboral sin convertirse en propietaria de programación o decisiones laborales ajenas.

Durante degradación:

1. una captura offline o pendiente no equivale a asistencia incorporada;
2. un evento repetido no debe crear un segundo hecho;
3. la recuperación de conectividad no confirma por sí sola la reincorporación;
4. la salud de ANIMA se proyecta por la capacidad real afectada y su servicio BIA.

Estado documental: `ESPECIFICADO`.

---

#### 29. Regla específica de NEXO

NEXO conserva 16 procesos propietarios asociados a producto, inventario, activos, logística e instalaciones.

Durante degradación:

1. snapshots o referencias no sustituyen el ledger o hecho autoritativo;
2. movimientos preparados no se presentan como movimientos confirmados;
3. recepción física, custodia, cantidad, ubicación y condición requieren confirmación propietaria;
4. una degradación que afecte un proceso `CRITICA_PROTECCION` puede exigir bloqueo o protección en lugar de continuidad aparente;
5. la salud se calcula por capacidad y no por una bandera global.

Estado documental: `ESPECIFICADO`.

---

#### 30. Regla específica de FOGO

FOGO conserva seis procesos propietarios de producción y calidad.

Durante degradación:

1. receta o instrucción cacheada debe conservar versión y vigencia;
2. la continuidad productiva no puede omitir calidad, inocuidad, lote o trazabilidad;
3. un proceso protector puede exigir detener;
4. una captura local o manual no se convierte en liberación autoritativa de producto;
5. salud de interfaz no equivale a capacidad productiva segura.

Estado documental: `ESPECIFICADO`.

---

#### 31. Regla específica de ORIGO

ORIGO conserva cuatro procesos propietarios de compras y recepción comercial.

Durante degradación:

1. borrador de compra no equivale a orden emitida;
2. recepción comercial no equivale automáticamente a ingreso físico de inventario;
3. dependencia de NEXO, NUMERA o proveedor se materializa solo por contrato real;
4. un reintento no duplica compromiso comercial;
5. salud se proyecta sobre la capacidad contractual afectada.

Estado documental: `ESPECIFICADO`.

---

#### 32. Regla específica de PULSO

PULSO conserva 12 procesos propietarios de oferta comercial, venta, pedido, pago, caja, atención y entrega al cliente.

Durante degradación:

1. un pago con resultado desconocido permanece desconocido hasta conciliación;
2. una venta no se confirma por aceptación técnica aislada;
3. operación offline o contingente conserva identificación e idempotencia;
4. un canal externo no se convierte en fuente propietaria;
5. degradación de pago puede coexistir con otras capacidades comerciales disponibles;
6. un proceso de protección puede exigir detener el efecto financiero.

Estado documental: `ESPECIFICADO`.

---

#### 33. Regla específica de NUMERA

NUMERA conserva siete procesos propietarios financieros, de control y analítica.

Durante degradación:

1. captura de un hecho pendiente no equivale a efecto financiero autoritativo;
2. un cálculo local no sustituye la versión propietaria;
3. aprobación o pago no se simulan cuando el estado externo o bancario es desconocido;
4. conciliación y periodo aplicable permanecen obligatorios;
5. analítica diferible no debe impedir priorizar controles financieros materiales.

Estado documental: `ESPECIFICADO`.

---

#### 34. Regla específica de AURA

AURA:

- permanece activa en catálogo;
- permanece `Diferido` en roadmap;
- conserva documentalmente `VPROC-0056` y `VPROC-0057`;
- conserva `BCS-VPROC-0056` y `BCS-VPROC-0057`;
- mantiene criticidad `DIFERIBLE_CONTROLADA`;
- mantiene perfil `CONT-OBJ-004`;
- conserva MBCO `DIFERIR_CON_TRAZABILIDAD`;
- permanece `BLOQUEADO_POR_APLICACION_DIFERIDA` para operación, alternativa, readiness y recuperación operativa.

Esta tarea:

1. define cómo AURA deberá expresar health cuando exista una implementación autorizada;
2. no crea un publicador activo;
3. no habilita publicación, promoción, canal digital ni oportunidad operativa;
4. no convierte el catálogo activo en readiness;
5. no elimina los dos bloqueos;
6. no declara salud runtime de una aplicación diferida.

Estado documental: `BLOQUEADO_POR_APLICACION_DIFERIDA`.

---

#### 35. Regla específica de PASS

PASS:

- usa dominio de identidad cliente;
- no hereda roles laborales;
- conserva un proceso propietario relacionado con cliente/fidelización;
- puede depender o ser consumido por procesos comerciales sin transferir identidad ni autoridad.

Durante degradación:

1. health no concede acceso a datos de cliente;
2. una relación de integración no habilita RBAC laboral;
3. consentimiento, identidad, puntos o evidencia no se duplican por contingencia;
4. un dato cacheado debe conservar frescura y finalidad;
5. salud de PASS se proyecta sobre el servicio BIA y capacidades consumidoras materialmente afectadas.

Estado documental: `ESPECIFICADO`.

---

#### 36. Evidencia y estado de implementación

La aprobación documental de esta tarea fija el contrato, no su ejecución.

Estado del resultado:

| Elemento                                    | Estado                              |
| ------------------------------------------- | ----------------------------------- |
| vocabulario de salud                        | `ESPECIFICADO`                      |
| contrato de criticidad proyectada           | `ESPECIFICADO`                      |
| contrato de dependencia                     | `ESPECIFICADO`                      |
| contrato de degradación                     | `ESPECIFICADO`                      |
| contrato de proyección de incidente         | `ESPECIFICADO`                      |
| cobertura de 10 aplicaciones                | `ESPECIFICADO`                      |
| implementación física del contrato          | `PENDIENTE_DE_EVIDENCIA`            |
| health runtime de aplicaciones              | `PENDIENTE_DE_EVIDENCIA`            |
| sensores/endpoints de salud                 | `PENDIENTE_DE_EVIDENCIA`            |
| topología aplicación-a-aplicación ejecutada | `PENDIENTE_DE_EVIDENCIA`            |
| pruebas runtime de propagación              | `PENDIENTE_DE_EVIDENCIA`            |
| readiness de AURA                           | `BLOQUEADO`                         |
| dos servicios AURA                          | `BLOQUEADO_POR_APLICACION_DIFERIDA` |

No se presenta ningún `PENDIENTE_DE_EVIDENCIA` como implementación existente.

---

#### 37. Prohibiciones explícitas

Queda prohibido:

1. asignar criticidad a una aplicación por su tipo o roadmap;
2. inferir dependencia por coexistencia técnica;
3. usar un ping único como evidencia de recuperación empresarial;
4. tratar ausencia de alerta como `HEALTHY`;
5. mantener `HEALTHY` con evidencia vencida;
6. ocultar degradación detrás de un estado global;
7. copiar automáticamente `UNAVAILABLE` entre aplicaciones;
8. declarar incidente de continuidad por health check sin evaluación empresarial;
9. activar continuidad por automatismo técnico;
10. convertir severidad en permiso;
11. convertir una aplicación consumidora en propietaria del hecho;
12. permitir que SHELL absorba propiedad funcional;
13. habilitar AURA por estar activa en catálogo;
14. aplicar RBAC laboral a PASS por conveniencia;
15. declarar recuperación por una respuesta HTTP o disponibilidad de pantalla;
16. cerrar por restauración técnica aislada;
17. borrar señales contradictorias para obtener un estado favorable;
18. reconstruir historia cambiando timestamps o versión de contrato;
19. inventar SPOF, sustitutos, proveedores, endpoints, canales o alternativas;
20. usar estados de salud para relajar autorización, seguridad, privacidad, SST, inocuidad, calidad, custodia o evidencia.

---

#### 38. Handoff hacia CONT-INT-002

`CONT-INT-002` podrá consumir este contrato para definir la interacción concreta con:

- SHELL;
- VISO;
- ANIMA;
- BLOQUE Z;
- BLOQUE AA;
- BLOQUE AB;
- E4;
- E5;
- T;
- U;
- X.

Esta tarea no materializa esos contratos transversales ni sus transportes físicos.

Condición de salida del handoff:

- vocabulario de salud definido;
- separación de autoridad definida;
- campos de criticidad/dependencia/incidente definidos;
- cobertura de diez aplicaciones reconciliada.

---

#### 39. Handoff hacia CONT-INT-003

`CONT-INT-003` conserva la definición de contratos con:

- Supabase;
- nube;
- energía;
- ISP;
- pagos;
- mensajería;
- transporte;
- proveedores críticos.

Esta tarea solo define cómo una dependencia externa podrá afectar el health y la proyección empresarial de una aplicación.

No inventa proveedor, SLA, endpoint, contacto, alternativa o failover.

---

#### 40. Handoff hacia CONT-INT-004

`CONT-INT-004` conserva:

- captura;
- replay;
- idempotencia de reincorporación;
- conciliación;
- retorno al servicio normal.

Esta tarea únicamente exige que el estado degradado identifique trabajo pendiente, correlación y evidencia suficientes para que ese contrato posterior pueda operar sin perder historia.

No ejecuta replay ni reconciliación.

---

#### 41. Cobertura vigente de prueba

La conducta de esta tarea ya se encuentra protegida por requisitos vigentes que cubren:

- BIA y dependencias versionadas;
- modalidades de contingencia;
- recuperación y restauración;
- idempotencia y reintentos;
- trazabilidad de cadenas técnicas y empresariales;
- autorización separada del consumo de eventos;
- prohibición de escritura cruzada;
- propiedad única de productores;
- SHELL sin propiedad de eventos empresariales;
- AURA diferida sin publicador activo;
- continuidad transversal con `health signals`, degradación, aislamiento, eventos, colas, failover autorizado y trazabilidad.

La tarea especializa documentalmente esos comportamientos para el contrato aplicación-a-aplicación. No amplía su alcance normativo.

---

#### 42. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación: la tarea no introduce una conducta ejecutable nueva fuera de la cobertura de prueba vigente. Materializa el contrato documental que las protecciones existentes ya exigen para criticidad, dependencia, señales de salud, degradación, correlación de incidentes, autorización y continuidad transversal. La futura implementación deberá satisfacer esos requisitos existentes y aportar evidencia real; esta aprobación documental no los declara satisfechos.

---

#### 43. Criterios de aceptación

1. existe exactamente una definición común de health para las aplicaciones;
2. el vocabulario contiene `HEALTH_UNKNOWN`, `HEALTHY`, `DEGRADED` y `UNAVAILABLE`;
3. `HEALTH_UNKNOWN` no se interpreta como saludable;
4. toda salud está acotada por capacidad y contexto;
5. toda salud material conserva fuente, tiempo y frescura;
6. criticidad de aplicación no se modela como etiqueta fija;
7. criticidad se proyecta desde servicios BIA;
8. los 69 servicios BIA permanecen preservados;
9. la distribución de propiedad permanece 0/1/20/16/6/4/12/7/2/1 en orden canónico de aplicación;
10. la distribución de criticidad permanece 12/20/31/6;
11. los cuatro perfiles `CONT-OBJ-*` permanecen intactos;
12. una aplicación puede tener varios servicios con diferentes clases;
13. una dependencia exige fuente canónica o evidencia;
14. una relación de navegación no crea dependencia por sí sola;
15. una relación de datos no transfiere propiedad;
16. el estado de la proveedora no se copia automáticamente a la consumidora;
17. una consumidora evalúa su propia capacidad;
18. degradación identifica capacidad disponible y no disponible;
19. degradación identifica restricciones de lectura/escritura;
20. degradación referencia la estrategia de contingencia del servicio;
21. una señal vencida no mantiene salud favorable;
22. señales contradictorias conservan incertidumbre;
23. salud técnica no declara continuidad;
24. señal no equivale a declaración;
25. declaración no equivale a activación;
26. severidad no concede permisos;
27. `HEALTHY` no equivale a proceso recuperado;
28. recuperación técnica no equivale a cierre;
29. VISO conserva `VPROC-0062`;
30. SHELL conserva cero procesos propietarios;
31. SHELL no se convierte en fuente empresarial por coordinar;
32. ANIMA conserva sus hechos de asistencia;
33. NEXO conserva sus hechos físicos/logísticos;
34. FOGO conserva producción y calidad;
35. ORIGO conserva compras y recepción comercial;
36. PULSO conserva venta/pedido/pago/caja;
37. NUMERA conserva hechos financieros;
38. AURA conserva dos procesos y permanece diferida;
39. los dos servicios AURA permanecen bloqueados operacionalmente;
40. PASS conserva dominio cliente y no hereda RBAC laboral;
41. las diez aplicaciones tienen decisión explícita;
42. no se crea ninguna aplicación adicional;
43. no se renombra ningún `app_code`;
44. no se inventa ningún proveedor, endpoint o SPOF;
45. no se afirma ningún estado runtime;
46. no se afirma implementación;
47. no se afirma validación operativa;
48. el contrato es versionable y correlacionable;
49. el estado anterior se conserva en cada transición;
50. la próxima tarea permanece reservada.

---

#### 44. Resultado de la tarea

`CONT-INT-001` deja especificado el contrato común que permite que cualquier aplicación de Vento OS exprese y consuma:

```text
criticidad proyectada
+
dependencia material
+
salud scoped y fresca
+
degradación explícita
+
correlación con servicio/proceso
+
referencia de incidente
+
evidencia
```

sin convertir esos datos en:

```text
autoridad
fuente de verdad paralela
recuperación empresarial automática
cierre automático
topología inventada
```

El resultado es documental y queda preparado para que los contratos transversales, externos y de reincorporación posteriores lo consuman sin modificar las decisiones ya aprobadas.

---

ÚLTIMA TAREA APROBADA

`CONT-UX-007 — Diseñar ejercicios, revisión posterior, acciones y comprobación de readiness`

TAREA ACTUAL APROBADA

`CONT-INT-001 — Definir contratos de criticidad, dependencia, salud, estado degradado e incidente con todas las aplicaciones`

SIGUIENTE TAREA RESERVADA

`CONT-INT-002 — Definir contratos con SHELL, VISO, ANIMA, BLOQUE Z, AA, AB, E4, E5, T, U y X`


### [ ] CONT-INT-002 — Definir contratos con SHELL, VISO, ANIMA, BLOQUE Z, AA, AB, E4, E5, T, U y X
### [ ] CONT-INT-003 — Definir contratos con Supabase, nube, energía, ISP, pagos, mensajería, transporte y proveedores críticos
### [ ] CONT-INT-004 — Definir contratos de captura, replay, idempotencia, reincorporación, conciliación y retorno al servicio normal
