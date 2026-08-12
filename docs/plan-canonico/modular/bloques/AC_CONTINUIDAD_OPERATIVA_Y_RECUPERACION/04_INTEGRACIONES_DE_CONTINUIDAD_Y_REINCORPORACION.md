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


### ✅ CONT-INT-002 — Definir contratos con SHELL, VISO, ANIMA, BLOQUE Z, AA, AB, E4, E5, T, U y X

**Estado:** APROBADA
**Tarea anterior:** `CONT-INT-001 — Definir contratos de criticidad, dependencia, salud, estado degradado e incidente con todas las aplicaciones` — APROBADA
**Tarea siguiente:** `CONT-INT-003 — Definir contratos con Supabase, nube, energía, ISP, pagos, mensajería, transporte y proveedores críticos` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada de contratos de interoperabilidad de continuidad con SHELL, VISO, ANIMA y los bloques transversales Z, AA, AB, E4, E5, T, U y X
**Bloque:** AC — Continuidad operativa y recuperación
**Mini-bloque:** Integraciones de continuidad y reincorporación
**Fase:** exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/AC_CONTINUIDAD_OPERATIVA_Y_RECUPERACION/04_INTEGRACIONES_DE_CONTINUIDAD_Y_REINCORPORACION.md`
**Implementación técnica u operativa:** no autorizada
**Código, DDL, DML, migraciones, RLS, RPC, secretos, despliegues, cambios de datos, bindings físicos o configuración productiva:** no autorizados
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo el dominio de continuidad intercambia contexto, señales, decisiones, instrucciones, evidencia, estado, recuperación y resultados con las superficies y bloques transversales que intervienen en una interrupción, sin transferir autoridad, duplicar expedientes, crear fuentes de verdad competidoras ni convertir una entrega técnica en resultado empresarial.

La tarea materializa exactamente once fronteras:

1. SHELL;
2. VISO;
3. ANIMA;
4. BLOQUE Z;
5. BLOQUE AA;
6. BLOQUE AB;
7. BLOQUE E4;
8. BLOQUE E5;
9. BLOQUE T;
10. BLOQUE U;
11. BLOQUE X.

El contrato debe permitir que una interrupción pueda atravesar de forma trazable:

```text
SEÑAL
→ EVALUACIÓN
→ DECLARACIÓN
→ ACTIVACIÓN
→ OPERACIÓN MÍNIMA / CONTINGENCIA
→ RECUPERACIÓN TÉCNICA Y FUNCIONAL
→ VALIDACIÓN
→ REINCORPORACIÓN / CONCILIACIÓN
→ DESACTIVACIÓN
→ CIERRE
→ REVISIÓN / APRENDIZAJE
```

sin que ninguna superficie transversal absorba la propiedad de los procesos afectados.

---

#### 2. Resultado sustantivo

Quedan materializados los siguientes resultados:

1. once contratos de frontera, uno por cada identidad exigida por el título;
2. matriz consolidada 11/11, sin fronteras faltantes ni duplicadas;
3. separación explícita entre autoridad de continuidad, representación en interfaz, transporte técnico, evidencia, analítica, implementación y certificación;
4. perfil común de intercambio que reutiliza contratos ya aprobados y no crea un protocolo paralelo;
5. regla de correlación entre incidente de continuidad, servicio BIA, proceso, aplicación, capacidad, dependencia, señal, decisión y evidencia;
6. conservación de `VPROC-0062` y del expediente transversal de continuidad en VISO;
7. conservación de SHELL como hub de identidad, contexto, navegación y handoff sin propiedad empresarial;
8. conservación de ANIMA como superficie personal del trabajador para comunicación, reporte, interacción y confirmación contextual, sin autoridad sobre severidad, activación o cierre;
9. conservación de BLOQUE Z como autoridad tecnológica sobre incidentes, diagnóstico, health técnico y recuperación técnica;
10. conservación de BLOQUE AA como autoridad transversal sobre clasificación, finalidad, privacidad, retención, legal hold, custodia y evidencia;
11. conservación de BLOQUE AB como autoridad sobre datos maestros federados, métricas, calidad, snapshots, analítica y mejora, sin autoridad para mutar procesos;
12. conservación de E4 como capacidad técnica compartida sin propiedad del proceso consumidor;
13. conservación de E5 como planificación de paquetes, readiness, cutover, piloto e hypercare antes de implementación;
14. conservación de T como calidad, compatibilidad, release, despliegue, rollback y evidencia de ejecución;
15. conservación de U como certificación transversal y validación final de requisitos, sin sustituir readiness, cutover o hypercare;
16. conservación de X como autoridad sobre emisoras, consumidoras, contratos, idempotencia, retry, compensaciones y handoffs de integración;
17. contrato de propagación de señales que impide activación automática de continuidad;
18. contrato de instrucciones que exige autoridad explícita antes de producir efectos protegidos;
19. contrato de evidencia que preserva procedencia y evita convertir log, ACK, alerta o hash en hecho empresarial;
20. contrato de degradación transversal basado en `CONT-INT-001`;
21. contrato de recuperación que separa health técnico de recuperación empresarial;
22. regla de que la recuperación de una superficie transversal no cierra automáticamente el incidente;
23. regla de que la ausencia de una superficie transversal no transfiere su autoridad a otra;
24. preservación de implementación independiente por repositorio y consumidor;
25. preservación de rollback sin reescritura histórica ni repetición de efectos ya confirmados;
26. preservación de la ruta prioritaria actual sin activar el alcance de implementación;
27. preservación de `QUEUE_CONDITIONAL` como no aplicable en la instancia prioritaria vigente, sin eliminar la capacidad global de E4;
28. handoff explícito a `CONT-INT-003` para dependencias externas;
29. handoff explícito a `CONT-INT-004` para replay, reincorporación y conciliación;
30. cero cambios físicos;
31. cero cambios de requisitos de prueba.

---

#### 3. Entradas canónicas preservadas

Esta tarea consume y conserva, sin redefinir:

- `CONT-DOM-001` a `CONT-DOM-015` para gobierno, BIA, dependencias, objetivos, incidente, mando, operación mínima, contingencia, captura, reincorporación, respaldo, recuperación, proveedores, ejercicios y aprendizaje;
- `CONT-AUTH-001` a `CONT-AUTH-004` para declaración, activación, autoridad, break-glass, protección de información y segregación;
- `CONT-UX-001` a `CONT-UX-007` para superficies ejecutivas, mando, runbooks, contingencia, recuperación, comunicación y ejercicios;
- `CONT-INT-001` para criticidad proyectada, dependencias aplicación-a-aplicación, health, degradación y proyección de incidente;
- `VPROC-0062` como proceso transversal de continuidad, propiedad de VISO;
- los 69 servicios BIA, sus perfiles, MBCO, MTPD, RTO, RPO y prioridades por referencia a sus tareas propietarias;
- el contrato de BLOQUE Z que separa incidente tecnológico e incidente de continuidad;
- el contrato de BLOQUE AA que preserva propiedad funcional, privacidad, ciclo documental y evidencia;
- el contrato de BLOQUE AB que consume eventos y lecturas gobernadas sin crear una fuente editable alternativa;
- el principio de E4 según el cual la aplicación propietaria decide el resultado empresarial y el servicio transversal ejecuta una capacidad técnica compartida;
- el inventario vigente de diez servicios transversales E4;
- los principios E5 de paquete, readiness, cutover, piloto, hypercare, suspensión, rollback y evidencia;
- BLOQUE T para package/release, consumer tests, gates, despliegue, piloto y estabilización;
- BLOQUE U para regresión transversal, E2E, seguridad, funcional, operación, experiencia y certificación final;
- BLOQUE X, especialmente `INT-APP-001` a `INT-APP-010`, para catálogo de eventos, productores, consumidores, idempotencia, retry, compensación, auditoría y prohibición de escritura cruzada;
- `EVENT-ENVELOPE-001` cuando el intercambio sea un evento empresarial;
- los contratos compartidos de SHELL cuando la interacción corresponda a contexto, acción, evento, handoff, trabajo pendiente o propiedad funcional;
- la ruta prioritaria vigente `NEXO-REMISSIONS-001`, cuya fase de diseño condicional está aprobada y cuyo alcance de implementación condicional permanece no iniciado.

La tarea no modifica propiedad de procesos, identidades de aplicación, criticidades BIA, objetivos de continuidad, contratos de autorización, catálogo de eventos, consumidores, servicios transversales ni alcance de la ruta prioritaria.

---

#### 4. Decisión principal

Vento OS adopta un contrato de continuidad **federado y correlacionado**, no un orquestador monolítico.

```text
CONTINUIDAD
→ gobierna el resultado empresarial de continuidad
→ conserva incidente, alcance, decisiones y estado de recuperación empresarial
→ coordina sin absorber los hechos propietarios

SUPERFICIE O BLOQUE TRANSVERSAL
→ conserva su autoridad especializada
→ recibe únicamente el contexto necesario
→ devuelve señales, resultados o evidencia dentro de su contrato
→ no decide fuera de su dominio

APLICACIÓN PROPIETARIA
→ conserva sus hechos y resultado funcional
→ valida su recuperación
→ no transfiere propiedad por participar en el incidente
```

Regla cardinal:

```text
COORDINAR
≠
TRANSFERIR PROPIEDAD O AUTORIDAD
```

---

#### 5. Fronteras obligatorias

Se conservan las siguientes no equivalencias:

```text
IDENTIDAD Y CONTEXTO DE SHELL
≠ AUTORIDAD DE CONTINUIDAD
```

```text
EXPEDIENTE DE VISO
≠ APROBACIÓN HUMANA
```

```text
MENSAJE O ACK EN ANIMA
≠ CAMBIO DEL ESTADO DE CONTINUIDAD
```

```text
INCIDENTE TECNOLÓGICO
≠ INCIDENTE DE CONTINUIDAD
```

```text
EVIDENCIA O LEGAL HOLD
≠ DECISIÓN OPERATIVA
```

```text
MÉTRICA O ALERTA ANALÍTICA
≠ ACTIVACIÓN
```

```text
ENTREGA DE E4
≠ EFECTO EMPRESARIAL
```

```text
PLAN E5
≠ IMPLEMENTACIÓN
```

```text
DEPLOY EXITOSO EN T
≠ RECUPERACIÓN EMPRESARIAL
```

```text
CERTIFICACIÓN EN U
≠ AUTORIDAD PARA MUTAR PRODUCCIÓN
```

```text
EVENTO O TRANSPORTE DE X
≠ PERMISO
```

---

#### 6. Tipos de interacción reutilizados

CONT-INT-002 no crea un nuevo vocabulario de transporte. Reutiliza los tipos ya gobernados cuando correspondan:

- `QUERY`: consulta autorizada sin mutación;
- `COMMAND`: solicitud dirigida al propietario de la acción;
- `EVENT`: hecho durable ya confirmado;
- `STATUS`: progreso o estado técnico/operativo que no sustituye el hecho empresarial;
- `PROJECTION`: vista derivada y reconstruible;
- observación técnica: telemetría o señal bajo el contrato de BLOQUE Z;
- notificación humana: comunicación sin autoridad transaccional;
- auditoría o evidencia: prueba correlacionable distinta del hecho empresarial.

Reglas:

1. un `COMMAND` recibido no equivale a efecto completado;
2. un `EVENT` no es una orden;
3. un `STATUS` no decide cierre;
4. una `PROJECTION` no se convierte en fuente editable;
5. una observación técnica no declara continuidad;
6. una notificación entregada no confirma comprensión, acción ni resultado;
7. la evidencia demuestra un hecho definido por su contrato, no crea un hecho distinto.

---

#### 7. Contexto mínimo de interoperabilidad de continuidad

Toda interacción material deberá conservar únicamente los campos que apliquen, sin inventar valores ausentes:

| Dimensión         | Referencia que debe conservarse cuando aplique                              |
| ----------------- | --------------------------------------------------------------------------- |
| continuidad       | incidente de continuidad, evaluación o ejercicio relacionado                |
| servicio          | `BCS-VPROC-*` afectado o amenazado                                          |
| proceso           | `VPROC-*` propietario                                                       |
| aplicación        | `app_code` canónico                                                         |
| capacidad         | capacidad o resultado específico afectado                                   |
| dependencia       | dependencia material relacionada                                            |
| alcance           | empresa, sede, área, canal, recurso o contexto aplicable                    |
| health            | estado y alcance conforme a `CONT-INT-001`                                  |
| degradación       | capacidad conservada, restringida o no disponible                           |
| BIA               | referencias de criticidad, MBCO, MTPD, RTO, RPO y prioridad aplicables      |
| severidad         | únicamente cuando exista evaluación/declaración conforme al contrato        |
| decisión          | declaración, activación, excepción, desactivación u otra decisión protegida |
| contingencia      | estrategia o runbook aplicable por referencia                               |
| trabajo pendiente | referencia estable cuando exista efecto aún no incorporado                  |
| correlación       | correlación y causalidad cuando el intercambio forme una cadena             |
| idempotencia      | identidad estable cuando exista riesgo de repetición de efecto              |
| tiempo            | ocurrencia, observación, registro o ejecución según el hecho                |
| versión           | contrato, esquema, política o artefacto aplicable                           |
| evidencia         | referencias suficientes sin copiar material sensible innecesario            |

La ausencia de un campo obligatorio para una decisión protegida no se resuelve mediante un valor implícito favorable.

---

#### 8. Propiedad del expediente transversal

VISO conserva `VPROC-0062` y el expediente transversal de continuidad.

El expediente puede relacionar:

- servicios BIA;
- procesos;
- aplicaciones;
- incidentes tecnológicos;
- dependencias;
- decisiones;
- activaciones;
- comunicaciones;
- runbooks;
- recuperación;
- pendientes;
- evidencia;
- ejercicios;
- acciones posteriores.

El expediente no absorbe:

- estado privado de aplicaciones propietarias;
- tickets tecnológicos;
- evidencia original de AA;
- métricas maestras de AB;
- jobs de E4;
- releases de T;
- resultados de certificación U;
- contratos o eventos propietarios de X.

La relación se realiza por referencia y correlación.

---

#### 9. Regla de autoridad antes de un efecto

Toda acción protegida recibida por una frontera deberá ser reevaluada por su propietario.

La presencia de cualquiera de estos elementos no concede autoridad:

- `continuity_incident_ref`;
- severidad;
- prioridad;
- health;
- alerta;
- evento;
- usuario autenticado;
- rol visible;
- dispositivo;
- sede;
- relación de dependencia;
- acceso a una cola;
- service role;
- pertenencia al equipo técnico;
- aprobación de otra frontera.

Cuando la acción pertenezca al dominio de continuidad, se aplican los contratos `CONT-AUTH-*`.

Cuando pertenezca a otro dominio, ese dominio conserva su propia autorización.

---

#### 10. Contrato con SHELL

##### 10.1 Autoridad conservada

SHELL conserva:

- identidad de aplicación;
- autenticación y contexto de sesión dentro de su contrato;
- catálogo y visibilidad de aplicaciones;
- decisión de acceso contextual cuando le corresponda;
- navegación, entrada, retorno y handoff entre aplicaciones;
- contexto compartido y trabajo pendiente conforme a sus contratos.

SHELL conserva cero procesos empresariales propietarios en el catálogo vigente.

##### 10.2 Entradas desde continuidad

SHELL puede consumir una proyección mínima y autorizada para:

- presentar que existe una afectación o modo degradado aplicable;
- dirigir al usuario hacia la superficie propietaria correcta;
- conservar referencia a tarea, incidente o acción pendiente;
- impedir una ruta no disponible o no autorizada;
- mantener contexto de retorno cuando el contrato lo permita.

##### 10.3 Salidas hacia continuidad

SHELL puede aportar:

- actor o principal autenticado;
- aplicación objetivo;
- contexto autorizado;
- sede, área o dispositivo cuando formen parte del contexto válido;
- referencia de handoff;
- resultado de decisión de acceso;
- imposibilidad de navegación o acceso como señal correlacionable.

##### 10.4 Prohibiciones

SHELL no puede:

- declarar incidente de continuidad;
- fijar severidad;
- activar o desactivar continuidad;
- editar el expediente de otro dominio por mostrarlo;
- publicar como propio un evento empresarial de otra propietaria;
- convertir visibilidad en autorización;
- convertir bloqueo de navegación en indisponibilidad empresarial total;
- crear un fallback de escritura cuando la propietaria no esté disponible.

##### 10.5 Degradación de SHELL

La indisponibilidad de SHELL:

- puede afectar navegación, contexto o acceso compartido;
- debe proyectarse mediante las dependencias materiales de `CONT-INT-001`;
- no vuelve automáticamente indisponibles las diez aplicaciones;
- no transfiere autoridad a otra superficie;
- no autoriza un acceso alternativo no definido.

**Estado contractual:** `ESPECIFICADO`.

---

#### 11. Contrato con VISO

##### 11.1 Autoridad conservada

VISO conserva:

- `VPROC-0062` y el expediente transversal de continuidad;
- el expediente tecnológico de `VPROC-0058` bajo su contrato tecnológico;
- las superficies administrativas y ejecutivas que le correspondan;
- estados, referencias y relaciones de los expedientes que son de su propiedad.

La autoridad humana para declarar, activar, aprobar excepciones, desactivar o cerrar permanece separada de la mera capacidad de VISO para registrar o presentar una decisión.

##### 11.2 Entradas hacia VISO

VISO puede recibir:

- señales y health de BLOQUE Z;
- confirmaciones funcionales de aplicaciones propietarias;
- decisiones autorizadas de continuidad;
- comunicaciones y acknowledgements referenciados;
- evidencia de AA;
- métricas y análisis de AB;
- estado de servicios transversales E4;
- evidencia de paquete, release, deploy y rollback de E5/T;
- resultados de certificación U;
- eventos, estados y correlaciones de X.

##### 11.3 Salidas desde VISO

VISO puede exponer, conforme a autorización:

- referencia del incidente;
- alcance y severidad formal vigentes;
- activación y decisiones registradas;
- servicios y procesos afectados;
- acciones requeridas;
- estado de contingencia y recuperación;
- pendientes;
- referencia de comunicaciones;
- necesidad de validación;
- estado de desactivación/cierre;
- referencias a revisión posterior.

##### 11.4 Separación con el expediente tecnológico

```text
INCIDENTE TECNOLÓGICO VISO
≠
INCIDENTE DE CONTINUIDAD VISO
```

Pueden compartir correlación y evidencia, pero conservan:

- identidad;
- autoridad;
- ciclo;
- criterios de cierre;
- clasificación;
- pendientes.

##### 11.5 Prohibiciones

VISO no puede:

- convertir una alerta en declaración;
- cerrar continuidad por un health técnico favorable;
- declarar recuperado un proceso de otra aplicación sin validación propietaria;
- editar una evidencia custodiada por AA para cambiar la historia;
- convertir una métrica de AB en decisión automática;
- tratar éxito de deploy como recuperación empresarial.

**Estado contractual:** `ESPECIFICADO`.

---

#### 12. Contrato con ANIMA

##### 12.1 Autoridad conservada

ANIMA conserva la experiencia personal del trabajador para:

- recibir instrucciones;
- recibir comunicaciones;
- consultar información autorizada;
- reportar un síntoma, observación o necesidad;
- aportar evidencia permitida;
- ejecutar una acción personal autorizada;
- confirmar comprensión o funcionamiento observado cuando el flujo lo solicite;
- recibir runbooks o capacitación contextual cuando corresponda.

##### 12.2 Entradas desde continuidad

ANIMA puede consumir una proyección mínima de:

- incidente o afectación aplicable al trabajador;
- instrucción vigente;
- sede/área/contexto relevante;
- modo operativo aplicable;
- acción requerida;
- restricción;
- prioridad comunicacional;
- fecha/hora y vigencia;
- canal o alternativa aprobada;
- referencia de seguimiento.

##### 12.3 Salidas hacia continuidad

ANIMA puede aportar:

- entrega de comunicación;
- lectura o acknowledgement cuando exista;
- respuesta del trabajador;
- reporte de condición observada;
- evidencia permitida;
- confirmación funcional personal;
- imposibilidad de ejecutar una instrucción.

##### 12.4 No equivalencias

```text
ENTREGADO
≠ LEÍDO
≠ COMPRENDIDO
≠ EJECUTADO
≠ RESULTADO EMPRESARIAL CONFIRMADO
```

Un mensaje o respuesta del trabajador no cambia por sí solo:

- severidad;
- activación;
- prioridad BIA;
- estado del proceso;
- recuperación empresarial;
- cierre.

##### 12.5 Degradación de ANIMA

Si ANIMA no puede entregar una comunicación:

- se conserva el estado de entrega verdadero;
- no se afirma que el trabajador fue informado;
- la necesidad puede activar una alternativa ya aprobada por el contrato de comunicación;
- la alternativa no convierte a ANIMA ni al canal alterno en fuente de verdad del incidente.

**Estado contractual:** `ESPECIFICADO`.

---

#### 13. Contrato con BLOQUE Z

##### 13.1 Autoridad conservada

BLOQUE Z conserva:

- servicios tecnológicos;
- configuración e identidades técnicas;
- endpoints;
- red;
- impresoras;
- aplicaciones y ambientes;
- incidentes, problemas y cambios tecnológicos;
- health técnico, observabilidad y telemetría;
- recuperación técnica;
- conocimiento y soporte;
- licencias y dependencias técnicas dentro de sus fronteras.

##### 13.2 Entradas desde tecnología hacia continuidad

BLOQUE Z puede aportar:

- servicio o componente afectado;
- capacidad técnica afectada;
- health y frescura;
- incidente tecnológico correlacionado;
- alcance técnico;
- dependencia afectada;
- backlog técnico;
- hipótesis identificada como hipótesis;
- restore o recovery ejecutado;
- estado de backup/restauración;
- cambio/release correlacionado;
- evidencia de recuperación técnica.

##### 13.3 Entradas desde continuidad hacia tecnología

Continuidad puede solicitar, con autoridad válida:

- diagnóstico;
- evaluación de alternativa;
- restauración;
- recuperación;
- aislamiento;
- failover autorizado;
- retorno controlado;
- soporte para operación mínima;
- validación técnica;
- información de dependencias y pendientes.

##### 13.4 Separaciones obligatorias

```text
HEALTH TÉCNICO
≠ MBCO
```

```text
INCIDENTE TECNOLÓGICO
≠ INCIDENTE DE CONTINUIDAD
```

```text
RESTORE EXITOSO
≠ RECUPERACIÓN EMPRESARIAL
```

```text
CAUSA TÉCNICA
≠ CAUSA EMPRESARIAL COMPLETA
```

##### 13.5 Contrato con la telemetría

Las observaciones de `TI-INT-001`:

- conservan fuente y frescura;
- se correlacionan con el contrato de health de `CONT-INT-001`;
- no fabrican un estado favorable ante ausencia de telemetría;
- no activan continuidad por sí solas;
- pueden enriquecer un incidente sin convertirse en la decisión.

##### 13.6 Relación con TI-INT-002

CONT-INT-002 adopta el lado de continuidad del contrato ya definido desde BLOQUE Z.

La semántica técnica preservada incluye:

- no escritura cruzada;
- autoridad propietaria;
- idempotencia;
- resultado desconocido;
- compatibilidad;
- rollback;
- separación entre incidentes;
- recuperación técnica distinta de recuperación empresarial.

Las referencias históricas de estado contenidas en una tarea anterior no sustituyen el estado vigente de la secuencia canónica.

**Estado contractual:** `ESPECIFICADO`.

---

#### 14. Contrato con BLOQUE AA

##### 14.1 Autoridad conservada

BLOQUE AA gobierna transversalmente:

- clasificación;
- finalidad;
- versiones documentales;
- privacidad;
- custodia;
- compartición;
- retención;
- archivo;
- disposición;
- legal hold;
- preservación;
- firma y certificación dentro de sus contratos;
- auditoría e investigación;
- evidencia.

Las aplicaciones de dominio conservan sus hechos, registros y expedientes.

##### 14.2 Entradas desde continuidad hacia AA

Continuidad puede aportar referencias a:

- incidente;
- servicio/proceso;
- decisión;
- comunicación;
- evidencia producida;
- archivo o documento;
- actor;
- tiempo;
- fuente;
- clasificación conocida;
- necesidad de preservación;
- investigación o revisión posterior.

##### 14.3 Salidas desde AA hacia continuidad

AA puede aportar:

- referencia de evidencia;
- procedencia;
- integridad;
- versión;
- clasificación;
- restricciones de acceso;
- retención;
- preservación;
- hold;
- estado de custodia;
- resultado de investigación dentro de su competencia;
- obligación pendiente del ciclo de información.

##### 14.4 Reglas

1. un incidente no reduce clasificación;
2. una emergencia no elimina finalidad ni minimización;
3. una copia de contingencia no adquiere propiedad;
4. preservar evidencia no equivale a aprobar una acción;
5. legal hold puede impedir disposición, pero no decide por sí solo continuidad;
6. un hash o receipt no sustituye el hecho empresarial;
7. una evidencia posterior no reescribe el estado histórico que estaba vigente;
8. información sensible se referencia cuando una copia completa no sea necesaria.

##### 14.5 Recuperación

La restauración de un archivo o evidencia:

- debe preservar versión y procedencia;
- no confirma por sí sola el proceso empresarial;
- puede ser precondición de validación si el proceso exige esa evidencia;
- conserva inconsistencias como pendientes reconciliables.

**Estado contractual:** `ESPECIFICADO`.

---

#### 15. Contrato con BLOQUE AB

##### 15.1 Autoridad conservada

BLOQUE AB gobierna:

- datos maestros federados;
- métricas;
- indicadores;
- calidad;
- certificación de datos;
- snapshots;
- reportes;
- análisis;
- diagnóstico;
- mejora continua.

Las aplicaciones de dominio conservan sus hechos y transacciones.

##### 15.2 Entradas desde continuidad hacia AB

AB puede consumir, bajo contrato:

- eventos durables;
- proyecciones autorizadas;
- cortes de incidente;
- servicios/procesos afectados;
- tiempos observados;
- decisiones;
- desvíos;
- recuperación;
- ejercicios;
- acciones posteriores;
- referencias de evidencia;
- métricas de readiness.

##### 15.3 Salidas desde AB hacia continuidad

AB puede aportar:

- métricas versionadas;
- calidad/frescura;
- cobertura;
- comparativos;
- tendencias;
- indicadores;
- anomalías;
- análisis;
- resultados de eficacia;
- snapshots reproducibles;
- deuda de datos o evidencia.

##### 15.4 Prohibiciones

AB no puede:

- declarar un incidente;
- activar continuidad por superar una métrica;
- escribir el estado privado de un proceso;
- convertir una proyección en maestro;
- convertir correlación en causalidad;
- publicar una cifra sin calidad/frescura suficiente como si fuera actual;
- cerrar una acción por observar una mejora sin el método de eficacia aplicable.

##### 15.5 Uso durante incidentes

Las métricas pueden apoyar:

- evaluación de impacto;
- seguimiento de MBCO/RTO/MTPD;
- detección de tendencias;
- priorización informada;
- revisión posterior.

La decisión permanece en el contrato de continuidad correspondiente.

**Estado contractual:** `ESPECIFICADO`.

---

#### 16. Contrato con BLOQUE E4

##### 16.1 Autoridad conservada

E4 contiene capacidades técnicas compartidas y no adquiere propiedad del proceso consumidor.

El inventario vigente conserva diez identidades:

1. orquestación genérica de trabajos asíncronos;
2. entrega transaccional de eventos y outbox;
3. impresión centralizada;
4. notificaciones y alertas;
5. generación de documentos;
6. custodia de archivos y documentos originales;
7. evidencia transaccional;
8. integraciones externas y webhooks;
9. programación y automatizaciones recurrentes;
10. monitoreo y heartbeat de workers.

##### 16.2 Entrada de continuidad hacia E4

Cuando una capacidad E4 sea aplicable, continuidad o una aplicación propietaria puede emitir una solicitud conforme al contrato propietario para:

- entregar una notificación;
- transportar un evento;
- ejecutar un trabajo;
- gestionar una impresión;
- generar o custodiar un documento;
- registrar evidencia;
- programar una ejecución;
- interactuar con una frontera externa;
- observar un worker.

La solicitud no entrega autoridad empresarial al servicio transversal.

##### 16.3 Salida desde E4

E4 devuelve estados técnicos verdaderos, por ejemplo:

- aceptado;
- en proceso;
- entregado técnicamente;
- rechazado;
- fallido;
- pendiente;
- duplicado reconocido;
- resultado desconocido;
- requerido para reconciliación;

según el contrato específico existente.

Esos estados no se convierten en éxito empresarial por traducción genérica.

##### 16.4 Fallo de E4

La degradación de un servicio transversal:

- se correlaciona con los servicios BIA que dependan realmente de él;
- no propaga indisponibilidad por pertenecer a E4;
- conserva trabajo pendiente;
- aísla consumidoras cuando corresponda;
- evita confirmar trabajo que no se completó;
- respeta la estrategia de contingencia del proceso consumidor.

##### 16.5 Ruta prioritaria vigente

La ruta prioritaria vigente conserva `QUEUE_CONDITIONAL` como grupo no aplicable.

CONT-INT-002:

- no cambia esa decisión;
- no activa una cola por el solo hecho de definir la frontera E4;
- conserva el contrato global de E4 para otras capacidades y futuros alcances autorizados;
- no interpreta la no aplicabilidad de la cola en esta instancia como eliminación de la arquitectura E4.

**Estado contractual:** `ESPECIFICADO`.

---

#### 17. Contrato con BLOQUE E5

##### 17.1 Autoridad conservada

E5 planifica, antes de implementación:

- paquete;
- archivos previstos;
- pruebas;
- readiness;
- cutover;
- piloto;
- hypercare;
- suspensión;
- rollback;
- evidencia;
- cierre y handoff.

E5 no produce la evidencia real de una implementación que todavía no ocurrió.

##### 17.2 Entradas de continuidad hacia E5

Todo paquete que afecte continuidad deberá recibir, cuando aplique:

- servicios BIA afectados;
- MBCO/MTPD/RTO/RPO;
- dependencias;
- modos de degradación;
- estrategia de contingencia;
- runbooks;
- autoridad y segregación;
- respaldo/restore;
- criterios de suspensión;
- rollback;
- comunicaciones;
- monitoreo;
- reconciliación;
- escenarios de prueba;
- requisitos de prueba aplicables.

##### 17.3 Salidas E5 hacia continuidad

E5 entrega diseños aprobados de:

- readiness checklist;
- condiciones de entrada;
- riesgo aceptado y condiciones de suspensión;
- cutover;
- convivencia;
- controles contra doble registro/doble efecto;
- conciliación durante piloto;
- métricas;
- hypercare;
- retirada de contingencias temporales;
- transferencia a soporte.

##### 17.4 Frontera de fase

```text
PLAN E5 APROBADO
≠ IMPLEMENTACIÓN FÍSICA
```

La evidencia real pertenece a las tareas ejecutoras posteriores ya asignadas.

##### 17.5 Estado vigente

En la ruta prioritaria actual:

- `CONDITIONAL_DESIGN_ARTIFACTS` está aprobada;
- `CONDITIONAL_IMPLEMENTATION_SCOPE` permanece `NO INICIADA`;
- la ejecución condicional permanece no iniciada.

CONT-INT-002 no cambia esos estados.

**Estado contractual:** `ESPECIFICADO`.

---

#### 18. Contrato con BLOQUE T

##### 18.1 Autoridad conservada

BLOQUE T conserva:

- pruebas de paquetes;
- release y versionado;
- compatibilidad;
- consumer tests;
- rollback;
- automatización;
- evidencia;
- gates;
- despliegue;
- readiness ejecutado;
- piloto;
- hypercare;
- estabilización.

##### 18.2 Entrada de continuidad hacia T

Un cambio o paquete con impacto de continuidad deberá transportar, mediante sus artefactos propietarios:

- alcance;
- consumidores;
- dependencias;
- escenarios de degradación;
- requisitos aplicables;
- criterios de aceptación;
- señales pre/durante/post;
- condición de rollback;
- evidencia esperada;
- restricciones protectoras;
- condición de suspensión.

##### 18.3 Salida de T hacia continuidad

T puede devolver:

- build;
- pruebas;
- compatibilidad;
- release;
- despliegue;
- resultado de rollback;
- estado del piloto;
- incidencias;
- evidencia;
- métricas técnicas;
- estabilización;
- transferencia.

##### 18.4 No equivalencias

```text
BUILD EXITOSO
≠ COMPATIBILIDAD COMPLETA
```

```text
DEPLOY EXITOSO
≠ SERVICIO EMPRESARIAL RECUPERADO
```

```text
ROLLBACK EJECUTADO
≠ INCIDENTE CERRADO
```

```text
PIPELINE VERDE
≠ READINESS DE CONTINUIDAD
```

##### 18.5 Incidente durante implementación

Si una ejecución genera o descubre una afectación material:

- T conserva el expediente de ejecución;
- VISO/BLOQUE Z conservan el expediente tecnológico;
- continuidad evalúa el impacto empresarial;
- cada expediente mantiene su criterio de cierre;
- la corrección no se disfraza de una prueba exitosa posterior.

**Estado contractual:** `ESPECIFICADO`.

---

#### 19. Contrato con BLOQUE U

##### 19.1 Autoridad conservada

U ejecuta certificación transversal después de que existan las pruebas y evidencias de los paquetes.

Puede ejecutar:

- regresión automatizada transversal;
- E2E entre aplicaciones;
- seguridad;
- funcional;
- operación;
- experiencia;
- pilotos con usuarios reales;
- validación final de requisitos de prueba.

##### 19.2 Entradas desde continuidad hacia U

Cuando un alcance incluya continuidad, U debe recibir:

- escenarios;
- servicios/procesos;
- roles;
- sedes/contextos;
- estados degradados;
- contingencias;
- recuperación;
- autorización;
- evidencia esperada;
- criterios de cierre;
- requisitos aplicables;
- resultados previos de paquete.

##### 19.3 Salidas U hacia continuidad

U puede producir:

- resultado de certificación;
- incumplimientos;
- evidencia;
- defectos;
- regresiones;
- incompatibilidades;
- hallazgos de experiencia;
- bloqueo de certificación;
- necesidad de corrección.

##### 19.4 Límites

U:

- puede rechazar una certificación;
- no activa continuidad;
- no modifica el estado empresarial para hacer pasar una prueba;
- no reemplaza readiness, cutover, piloto o hypercare;
- no sustituye al propietario funcional en la validación del resultado recuperado;
- no convierte evidencia simulada en evidencia de incidente real.

**Estado contractual:** `ESPECIFICADO`.

---

#### 20. Contrato con BLOQUE X

##### 20.1 Autoridad conservada

X gobierna documentalmente:

- catálogo de eventos;
- productoras;
- consumidoras;
- contratos;
- integraciones internas/externas;
- identidad técnica;
- idempotencia;
- retry;
- compensación;
- auditoría;
- handoffs;
- prohibición de escritura cruzada.

##### 20.2 Uso por continuidad

Continuidad reutiliza los contratos X cuando:

- un hecho durable necesita propagarse;
- una aplicación debe consumir un estado propietario;
- una acción debe solicitarse al dominio propietario;
- un handoff cruza aplicaciones;
- existe retry o resultado desconocido;
- una compensación debe solicitarse;
- una dependencia necesita aislamiento;
- un evento o proyección debe correlacionarse con un incidente.

##### 20.3 Eventos de continuidad

CONT-INT-002 no crea un catálogo paralelo de eventos.

Un health check, heartbeat, log, alerta o click:

- no se convierte en evento empresarial por pertenecer a un incidente;
- puede permanecer observación técnica;
- solo un hecho durable que cumpla el contrato empresarial puede usar el catálogo de eventos vigente.

##### 20.4 Productor y consumidor

1. la productora empresarial permanece la propietaria del proceso;
2. SHELL no se vuelve productora por transportar;
3. infraestructura no se vuelve productora por publicar físicamente;
4. consumir un evento no concede permiso;
5. una consumidora no escribe el estado privado de la productora;
6. eventos relacionados conservan correlación y causalidad sin reetiquetar productora.

##### 20.5 Idempotencia y retry

Las operaciones reintentables conservan:

- identidad estable;
- contenido lógico;
- versión;
- autorización vigente;
- resultado;
- presupuesto de retry aplicable;
- reconciliación cuando exista incertidumbre.

Un incidente de continuidad no reinicia el presupuesto ni autoriza repetir un efecto confirmado.

##### 20.6 Aislamiento

Circuit breaking, bulkheads u otros mecanismos de aislamiento:

- protegen contra cascadas cuando corresponda;
- no pierden ni confirman trabajo por abrir un circuito;
- conservan consumidoras y criticidades separadas;
- no deciden por sí solos la activación empresarial.

##### 20.7 Replay

El replay y backfill detallados permanecen en `CONT-INT-004` y en los contratos X aplicables.

Esta tarea solo exige conservar:

- identidad;
- procedencia;
- audiencia;
- autorización;
- correlación;
- trabajo pendiente.

**Estado contractual:** `ESPECIFICADO`.

---

#### 21. Matriz consolidada de las once fronteras

| Frontera | Autoridad que conserva                                                     | Continuidad consume                                      | Continuidad entrega/solicita                             | Equivalencia prohibida principal        | Estado         |
| -------- | -------------------------------------------------------------------------- | -------------------------------------------------------- | -------------------------------------------------------- | --------------------------------------- | -------------- |
| SHELL    | identidad, contexto, acceso, navegación y handoff                          | actor, app, contexto, decisión de acceso, handoff        | proyección mínima de incidente/modo y acción pendiente   | visibilidad = autorización              | `ESPECIFICADO` |
| VISO     | expediente `VPROC-0062` y expedientes administrativos/tecnológicos propios | decisiones, estados, referencias, validaciones           | señales, confirmaciones, evidencia, pendientes           | registro = aprobación                   | `ESPECIFICADO` |
| ANIMA    | experiencia personal del trabajador                                        | entrega, respuesta, reporte, confirmación contextual     | instrucción, comunicación, acción personal autorizada    | mensaje = cambio de estado              | `ESPECIFICADO` |
| Z        | servicios, health, incidentes y recuperación técnica                       | health, incidente técnico, dependencia, restore/recovery | diagnóstico, aislamiento, restore/failover autorizados   | recovery técnico = recovery empresarial | `ESPECIFICADO` |
| AA       | información, privacidad, retención, hold, custodia y evidencia             | evidencia, clasificación, restricciones, preservación    | referencias de incidente/hecho y necesidad de custodia   | evidencia = estado empresarial          | `ESPECIFICADO` |
| AB       | maestros, métricas, calidad, snapshots y analítica                         | indicadores, calidad, cobertura, eficacia                | eventos/proyecciones/cortes autorizados                  | métrica = decisión                      | `ESPECIFICADO` |
| E4       | capacidad técnica compartida                                               | estados de job/entrega/cola/evidencia                    | solicitudes técnicas conforme al propietario             | entrega técnica = efecto empresarial    | `ESPECIFICADO` |
| E5       | planificación de implementación                                            | readiness/cutover/hypercare diseñados                    | continuidad, contingencia, rollback y pruebas requeridas | plan = implementación                   | `ESPECIFICADO` |
| T        | pruebas, release, deploy, rollback y evidencia                             | resultados de ejecución                                  | escenarios, gates y criterios                            | deploy = recuperación                   | `ESPECIFICADO` |
| U        | certificación transversal                                                  | certificación, fallos y evidencia                        | escenarios y criterios de continuidad                    | certificación = mutación productiva     | `ESPECIFICADO` |
| X        | contratos, eventos, productores, consumidores, retry y handoff             | eventos/estados/resultados contractuales                 | acciones y hechos por contratos propietarios             | transporte = autoridad                  | `ESPECIFICADO` |

Reconciliación:

- fronteras esperadas: **11**;
- fronteras materializadas: **11**;
- fronteras faltantes: **0**;
- fronteras duplicadas: **0**;
- nuevas fuentes de verdad: **0**;
- nuevos transportes universales: **0**;
- nuevos permisos: **0**;
- nuevos estados de continuidad: **0**.

---

#### 22. Matriz de participación por fase del incidente

| Fase                 | VISO                         | SHELL / ANIMA                    | Z                                             | AA                                     | AB                      | E4                            | E5 / T                                                 | U                                        | X                                 |
| -------------------- | ---------------------------- | -------------------------------- | --------------------------------------------- | -------------------------------------- | ----------------------- | ----------------------------- | ------------------------------------------------------ | ---------------------------------------- | --------------------------------- |
| señal/evaluación     | correlaciona expediente      | presenta/reportan según contexto | aporta observaciones técnicas                 | preserva evidencia cuando aplique      | aporta métricas/calidad | transporta señales aplicables | aporta referencia de cambio/deploy si existe           | no ejecuta por incidente ordinario       | conserva contrato/correlación     |
| declaración          | registra decisión autorizada | presenta estado autorizado       | aporta evidencia técnica                      | preserva decisión/evidencia            | no declara              | no declara                    | no declara                                             | no declara                               | no declara                        |
| activación           | registra alcance y decisión  | presenta instrucciones           | ejecuta solo acciones autorizadas             | protege información                    | mide sin decidir        | entrega capacidades técnicas  | ejecuta únicamente si existe cambio/paquete autorizado | no sustituye activación                  | transporta sin conceder autoridad |
| contingencia         | conserva estado y pendientes | guía/reportan                    | soporta modo técnico mínimo                   | protege copias/evidencia               | vigila calidad/impacto  | ejecuta servicios aplicables  | E5 conserva plan; T ejecuta solo si corresponde        | puede probar en ejercicio autorizado     | conserva idempotencia/handoff     |
| recuperación         | correlaciona estados         | comunica/recoge validación       | restaura/recupera técnicamente                | valida evidencia/documentos aplicables | mide recuperación       | entrega trabajos técnicos     | T aporta deploy/rollback si aplica                     | certifica cuando corresponde             | conserva contratos                |
| validación funcional | registra confirmaciones      | aporta feedback contextual       | aporta health técnico                         | aporta integridad/evidencia            | aporta métricas         | aporta delivery status        | aporta evidencia técnica                               | ejecuta validación transversal posterior | aporta trazabilidad               |
| cierre               | registra decisión autorizada | comunica cierre si aplica        | cierra expediente técnico por criterio propio | conserva expediente/evidencia          | conserva medición       | no cierra por entrega         | T/E5 cierran sus ciclos propios                        | certificación no sustituye cierre        | no cierra por evento              |

Ninguna columna sustituye al propietario funcional de cada proceso afectado.

---

#### 23. Flujo material — falla tecnológica que amenaza continuidad

```text
SEÑAL TÉCNICA
→ BLOQUE Z normaliza evidencia y health
→ VISO conserva el incidente tecnológico cuando corresponda
→ CONT-INT-001 proyecta servicio/proceso/dependencia afectados
→ autoridad de continuidad evalúa declaración y activación
→ VISO registra la decisión autorizada
→ SHELL/ANIMA presentan contexto e instrucciones autorizadas
→ E4 entrega capacidades técnicas compartidas cuando apliquen
→ X preserva contratos, idempotencia y correlación
→ Z ejecuta recuperación técnica autorizada
→ aplicaciones propietarias validan sus resultados
→ AA conserva evidencia y restricciones
→ AB mide impacto, recuperación y eficacia
→ VISO conserva pendientes y estado empresarial
```

Si existe código, configuración o despliegue como parte de la recuperación:

```text
CAMBIO AUTORIZADO
→ E5 aporta plan/readiness/cutover/hypercare aplicables
→ T ejecuta pruebas/deploy/rollback conforme a su ciclo
→ evidencia retorna a los expedientes correlacionados
```

U interviene en certificación transversal, ejercicio o puerta integral cuando corresponda; no reemplaza el ciclo operativo del incidente.

---

#### 24. Flujo material — aplicación saludable con negocio todavía no recuperado

```text
APLICACIÓN → HEALTHY
```

no permite inferir:

```text
SERVICIO BIA → RECUPERADO
INCIDENTE → CERRABLE
PENDIENTES → CERO
DATOS → CONCILIADOS
COMUNICACIONES → COMPLETAS
EVIDENCIA → COMPLETA
```

El cierre exige las validaciones ya definidas por el dominio de continuidad.

SHELL puede navegar.
ANIMA puede comunicar.
Z puede confirmar health técnico.
E4 puede haber drenado su trabajo.
T puede haber desplegado.
AB puede mostrar métricas normales.

Aun así, el proceso propietario puede conservar trabajo pendiente o efectos por reconciliar.

---

#### 25. Flujo material — modo degradado y comunicación

```text
DECISIÓN DE MODO DEGRADADO AUTORIZADA
→ VISO registra alcance y vigencia
→ SHELL presenta estado contextual cuando aplique
→ ANIMA presenta instrucción al trabajador cuando aplique
→ E4 transporta notificación/artefacto cuando el servicio aplicable exista
→ AA aplica clasificación, minimización y retención
→ X conserva correlación y contratos
→ AB observa resultado sin ejecutar cambios
```

Un ACK de canal solo actualiza el contrato de comunicación.

---

#### 26. Flujo material — ejercicio de continuidad

```text
ESCENARIO APROBADO
→ VISO abre el expediente de ejercicio aplicable
→ SHELL/ANIMA presentan superficies de simulación cuando existan
→ Z aporta simulación técnica autorizada
→ E4 usa canales/servicios de prueba cuando corresponda
→ AA preserva evidencia del ejercicio
→ AB captura métricas y tiempos
→ T aporta evidencia de ambientes/paquetes cuando corresponda
→ U ejecuta certificación transversal cuando sea la etapa aplicable
→ acciones posteriores conservan propietario y eficacia
```

Reglas:

- ejercicio no concede autoridad real;
- señal simulada no dispara efecto productivo;
- aprobación simulada no es aprobación real;
- resultado simulado no se registra como recovery real;
- evidencia de ejercicio permanece identificada como tal.

---

#### 27. Estados de entrega y resultado

Cuando una frontera entregue trabajo asíncrono o técnico, debe conservar el estado verdadero permitido por su contrato.

La capa de continuidad no colapsa estos conceptos:

```text
SOLICITADO
ACEPTADO TÉCNICAMENTE
EN PROCESO
ENTREGADO TÉCNICAMENTE
RESULTADO CONFIRMADO
RESULTADO DESCONOCIDO
RECHAZADO
FALLIDO
PENDIENTE DE RECONCILIACIÓN
```

El vocabulario físico exacto pertenece al contrato de cada servicio.

La regla transversal es que ninguna capa traduzca un estado intermedio a éxito empresarial.

---

#### 28. Fallos parciales

Cada frontera debe poder representar, conforme a su contrato propietario:

- indisponibilidad;
- degradación;
- timeout;
- rechazo;
- autorización denegada;
- conflicto;
- duplicado reconocido;
- evidencia contradictoria;
- información obsoleta;
- resultado desconocido;
- trabajo pendiente.

Reglas:

1. un fallo parcial no se presenta como éxito total;
2. una recuperación parcial no cierra el incidente;
3. una frontera no corrige directamente el estado privado de otra;
4. una operación desconocida se reconcilia antes de repetir un efecto inseguro;
5. el error de una consumidora no revierte el hecho durable de la productora;
6. el fallo de transporte no convierte la fuente de verdad en la cola o el canal;
7. la incertidumbre se conserva como incertidumbre.

---

#### 29. Compatibilidad y versionado

Los contratos de continuidad entre bloques deben:

- identificar versión cuando el contrato subyacente lo requiera;
- conservar compatibilidad con consumidores vigentes;
- permitir adopción independiente cuando el contrato lo soporte;
- tratar cambios incompatibles mediante versión mayor o mecanismo propietario equivalente;
- conservar una ventana de transición cuando sea necesaria;
- evitar un despliegue simultáneo forzado de todo Vento OS;
- mantener rollback hacia una combinación soportada;
- no revivir permisos, eventos o efectos ya retirados mediante rollback.

CONT-INT-002 no fija una versión física nueva ni crea un paquete compartido.

---

#### 30. Idempotencia y resultados desconocidos

Cuando una frontera pueda producir un efecto:

1. la identidad lógica se fija antes del primer envío;
2. el mismo identificador y mismo contenido no producen un segundo efecto;
3. contenido incompatible bajo la misma identidad produce conflicto;
4. retry conserva el contexto y la autorización vigente;
5. timeout posterior a posible efecto queda como resultado desconocido;
6. resultado desconocido exige consulta/reconciliación antes de un retry que pueda duplicar;
7. retry no equivale a replay;
8. compensación requiere contrato propietario;
9. agotar retry no ejecuta compensación por inferencia;
10. un incidente de continuidad no amplía el presupuesto ni la autoridad del retry.

La definición física de replay y reincorporación permanece en `CONT-INT-004`.

---

#### 31. Comunicaciones y notificaciones

Las comunicaciones de continuidad conservan:

- contenido aprobado;
- audiencia;
- canal;
- vigencia;
- sensibilidad;
- referencia al incidente;
- emisor efectivo;
- estado de entrega;
- acknowledgement cuando corresponda.

Separaciones:

```text
MENSAJE PREPARADO
≠ MENSAJE APROBADO
≠ MENSAJE EMITIDO
≠ MENSAJE ENTREGADO
≠ MENSAJE LEÍDO
≠ MENSAJE COMPRENDIDO
≠ ACCIÓN EJECUTADA
```

SHELL, ANIMA y E4 pueden participar en presentación o entrega sin recibir autoridad sobre el contenido material.

---

#### 32. Evidencia transversal

La evidencia producida por una frontera debe poder reconstruir:

- incidente o ejercicio relacionado;
- fuente;
- actor o principal;
- objeto/capacidad;
- acción;
- tiempo;
- versión;
- resultado;
- correlación;
- procedencia;
- restricciones de acceso y ciclo de vida aplicables.

Reglas:

1. log técnico no sustituye evidencia empresarial;
2. captura de pantalla no sustituye el hecho propietario;
3. hash no demuestra por sí solo contenido correcto;
4. delivery receipt no demuestra resultado empresarial;
5. evidencia no se edita para corregir la historia;
6. evidencia sensible se minimiza y referencia;
7. AA gobierna el ciclo de información aplicable;
8. la aplicación propietaria conserva el hecho demostrado.

---

#### 33. Métricas, alertas y analítica

AB puede calcular y presentar:

- tiempo de detección;
- tiempo de declaración;
- tiempo de activación;
- duración de degradación;
- tiempos de recuperación;
- cumplimiento observado frente a objetivos;
- backlog;
- incidencias;
- cobertura;
- eficacia de acciones;
- readiness;
- calidad y frescura de evidencia;

cuando existan definiciones y datos válidos.

Las métricas:

- no cambian severidad automáticamente;
- no alteran el BIA por observación aislada;
- no autorizan una acción;
- no sustituyen evidencia fuente;
- no confirman causalidad por correlación;
- conservan versión, corte y calidad.

---

#### 34. Relación con servicios transversales E4

Para cada servicio E4 que participe en una contingencia, el contrato debe preservar:

- servicio transversal;
- productor/solicitante;
- consumidor/destino;
- trabajo u operación;
- idempotencia;
- intento;
- resultado;
- pendiente;
- evidencia;
- estado de degradación;
- relación con el incidente.

La aplicación propietaria mantiene el resultado empresarial.

Una cola, worker, notificación, impresión, documento o webhook no se convierte en propietario del proceso.

---

#### 35. Relación con implementación E5/T

Antes de una implementación que pueda afectar continuidad, E5/T deben poder demostrar que el paquete ha considerado:

- dependencias;
- health y observabilidad;
- degradación;
- contingencia;
- backup/restore;
- rollback;
- compatibilidad;
- datos pendientes;
- doble efecto;
- conciliación;
- soporte;
- comunicación;
- suspensión;
- evidencia.

Esta lista es una entrada de continuidad a sus contratos existentes; no crea una nueva puerta paralela.

---

#### 36. Relación con certificación U

U recibe requisitos y evidencia ya producida.

Para continuidad, una certificación integral debe poder distinguir:

- diseño aprobado;
- implementación;
- prueba ejecutada;
- evidencia;
- resultado;
- excepción;
- deuda;
- bloqueo;
- readiness.

Una prueba fallida impide declarar satisfecho el requisito aplicable, pero U no modifica el hecho de origen para obtener un resultado favorable.

---

#### 37. Relación con X

Toda integración material deberá:

- preservar productora y consumidora;
- mantener autoridad separada del transporte;
- conservar event/request/correlation/idempotency cuando apliquen;
- aplicar minimización;
- evitar escritura cruzada;
- manejar out-of-order;
- preservar eventos tardíos;
- reconciliar resultado desconocido;
- impedir cascadas cuando corresponda;
- conservar auditabilidad.

Continuidad no crea un canal especial que evite estas reglas.

---

#### 38. Seguridad y privacidad durante continuidad

Una interrupción no autoriza:

- compartir credenciales;
- reutilizar tokens fuera de finalidad;
- elevar privilegio por urgencia;
- ampliar audiencia;
- ignorar retención o hold;
- copiar datos completos por conveniencia;
- escribir con una cuenta técnica fuera de alcance;
- deshabilitar controles protectores;
- ocultar actor efectivo.

Break-glass y acceso excepcional permanecen gobernados por `CONT-AUTH-002` y contratos de autorización aplicables.

---

#### 39. Estado de la ruta prioritaria

Esta tarea se ejecuta dentro de la fase documental aprobada de la ruta prioritaria vigente.

Se preserva:

| Control                                | Estado vigente preservado                        |
| -------------------------------------- | ------------------------------------------------ |
| `CONDITIONAL_DESIGN_ARTIFACTS`         | `APROBADA`                                       |
| `CONDITIONAL_IMPLEMENTATION_SCOPE`     | `NO INICIADA`                                    |
| `CONDITIONAL_IMPLEMENTATION_EXECUTION` | `NO INICIADA`                                    |
| `QUEUE_CONDITIONAL`                    | no aplicable en la instancia prioritaria vigente |

La tarea no modifica `active-sequence.json`, la selección de la ruta ni sus grupos de implementación.

---

#### 40. Pendientes físicos y destinos exactos

| Pendiente físico                               | Estado en CONT-INT-002 | Propietario ya asignado                         | Condición de salida                                                       |
| ---------------------------------------------- | ---------------------- | ----------------------------------------------- | ------------------------------------------------------------------------- |
| contratos compartidos físicos de SHELL         | `FUERA_DE_ALCANCE`     | tareas `SHELL-CON-*` aplicables                 | tipos/contratos materializados y probados sin copia divergente            |
| bindings de health/telemetría                  | `FUERA_DE_ALCANCE`     | BLOQUE Z y alcance de implementación autorizado | fuentes, frescura y relaciones implementadas con evidencia                |
| persistencia/servicios del expediente VISO     | `FUERA_DE_ALCANCE`     | VISO + fase de implementación propietaria       | expediente y acciones implementados contra contrato aprobado              |
| experiencia ANIMA de contingencia/comunicación | `FUERA_DE_ALCANCE`     | ANIMA + paquete de implementación aplicable     | experiencia consume contrato sin mutar estado ajeno                       |
| servicios físicos de AA/evidencia              | `FUERA_DE_ALCANCE`     | BLOQUE AA, EVID-ARC y fase propietaria          | custodia/evidencia implementadas y reconciliadas                          |
| pipelines/modelos de AB                        | `FUERA_DE_ALCANCE`     | BLOQUE AB + E3/E4/E5 aplicables                 | ingestión/proyección materializada sin segunda fuente                     |
| servicios transversales E4                     | `FUERA_DE_ALCANCE`     | tareas E4 propietarias                          | servicio aplicable implementado, observado y probado                      |
| paquete/readiness/cutover/hypercare            | `FUERA_DE_ALCANCE`     | E5                                              | paquete concreto aprobado antes de ejecución                              |
| test/release/deploy/rollback                   | `FUERA_DE_ALCANCE`     | `SHELL-CI-001` a `SHELL-CI-024` según etapa     | ejecución reproducible y evidencia por paquete                            |
| certificación transversal                      | `FUERA_DE_ALCANCE`     | BLOQUE U                                        | alcance implementado llega a certificación con evidencia                  |
| transporte/bindings de integración             | `FUERA_DE_ALCANCE`     | BLOQUE X + H/E3/E4/E5 según contrato            | binding físico respeta productor, consumidor, idempotencia y autorización |
| proveedores y dependencias externas            | `FUERA_DE_ALCANCE`     | `CONT-INT-003`                                  | contrato externo materializado sin proveedor inventado                    |
| replay/reincorporación/conciliación            | `FUERA_DE_ALCANCE`     | `CONT-INT-004`                                  | contrato de retorno normal materializado                                  |

No queda una decisión física pendiente sin propietario y condición de salida.

---

#### 41. Prohibiciones transversales

Queda prohibido:

1. crear un segundo incidente de continuidad en otra superficie;
2. convertir el ticket tecnológico en expediente de continuidad;
3. convertir un dashboard en fuente del hecho;
4. convertir una notificación en transición empresarial;
5. convertir una cola en fuente de verdad;
6. convertir un deploy en validación funcional;
7. convertir una certificación en autorización;
8. convertir un evento en comando;
9. convertir health en cierre;
10. convertir una métrica en activación;
11. convertir una evidencia en decisión;
12. convertir el plan E5 en implementación;
13. usar una cuenta técnica como autoridad humana;
14. escribir directamente el estado privado de otra propietaria;
15. reintentar a ciegas un resultado desconocido;
16. hacer replay dentro de esta tarea;
17. inventar proveedor, endpoint, topic, tabla, cola, worker o broker;
18. activar el grupo de colas de la ruta prioritaria por inferencia;
19. crear una ruta de fallback no aprobada;
20. borrar la historia de degradación después de recuperar;
21. ocultar pendientes para declarar recuperación;
22. presentar evidencia de ejercicio como evidencia productiva;
23. presentar una capacidad documentada como implementada;
24. presentar una capacidad implementada como validada sin evidencia;
25. avanzar a `CONT-INT-003` dentro de esta tarea.

---

#### 42. Estados del resultado

| Resultado                       | Estado                     |
| ------------------------------- | -------------------------- |
| contrato con SHELL              | `ESPECIFICADO`             |
| contrato con VISO               | `ESPECIFICADO`             |
| contrato con ANIMA              | `ESPECIFICADO`             |
| contrato con BLOQUE Z           | `ESPECIFICADO`             |
| contrato con BLOQUE AA          | `ESPECIFICADO`             |
| contrato con BLOQUE AB          | `ESPECIFICADO`             |
| contrato con E4                 | `ESPECIFICADO`             |
| contrato con E5                 | `ESPECIFICADO`             |
| contrato con T                  | `ESPECIFICADO`             |
| contrato con U                  | `ESPECIFICADO`             |
| contrato con X                  | `ESPECIFICADO`             |
| implementación física           | `FUERA_DE_ALCANCE`         |
| ejecución operativa             | `FUERA_DE_ALCANCE`         |
| evidencia runtime               | `PENDIENTE_DE_EVIDENCIA`   |
| cambios Supabase                | `NO_APLICA`                |
| cambios de requisitos de prueba | `NO_APLICA` — cero cambios |

---

#### 43. Handoff hacia CONT-INT-003

`CONT-INT-003` permanece responsable de los contratos con:

- Supabase;
- nube;
- energía;
- ISP;
- pagos;
- mensajería;
- transporte;
- proveedores críticos.

CONT-INT-002 no selecciona ni inventa:

- proveedor;
- SLA;
- endpoint;
- credencial;
- región;
- plan;
- contrato;
- alternativa;
- failover externo.

El handoff entrega únicamente:

- contexto de incidente;
- dependencia;
- health/degradación;
- autoridad;
- correlación;
- evidencia;
- necesidades de los bloques internos.

---

#### 44. Handoff hacia CONT-INT-004

`CONT-INT-004` permanece responsable de:

- captura;
- replay;
- idempotencia de reincorporación;
- conflictos;
- deduplicación;
- conciliación;
- retorno al servicio normal.

CONT-INT-002 deja disponibles para ese contrato:

- incident_ref;
- servicio/proceso;
- aplicación;
- dependencia;
- trabajo pendiente;
- correlación;
- operación/idempotencia cuando exista;
- estado de cada frontera;
- evidencia;
- versión;
- actor/contexto;
- resultado conocido/desconocido.

No ejecuta replay ni conciliación.

---

#### 45. Cobertura vigente de prueba

La conducta definida por esta tarea ya está protegida por requisitos vigentes.

En particular:

- `TREQ-CONT-002` asigna responsabilidad expresa a `CONT-INT-002` y protege separación de expedientes, clasificación, autoridad, activación, comunicación, recuperación y cierre;
- `TREQ-INTEGRATION-003` protege idempotencia, retry y resultado recuperable;
- `TREQ-INTEGRATION-004` protege reconstrucción de cadenas, disparadores, intentos, resultados, errores y efectos finales;
- `TREQ-INTEGRATION-005` protege handoff entre aplicaciones;
- `TREQ-INTEGRATION-006` protege captura única y ausencia de fuentes competidoras;
- `TREQ-INTEGRATION-020` protege el contrato tecnológico transversal;
- `TREQ-INTEGRATION-021` protege información, documentos y evidencia;
- `TREQ-INTEGRATION-022` protege analítica, maestros, proyecciones y no escritura desde capas derivadas;
- `TREQ-INTEGRATION-023` asigna expresamente responsabilidad a `CONT-INT-001` a `CONT-INT-004` y cubre E3, E4, E5, T, U, X, Z, AA y AB;
- los requisitos posteriores del mini-bloque de eventos protegen productor/consumidor, autorización independiente, retry, circuit breaking, bulkheads, aislamiento y salidas explícitas de trabajo.

CONT-INT-002 especializa documentalmente esas protecciones para sus once fronteras. No amplía el alcance normativo de los requisitos existentes.

---

#### 46. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación: los comportamientos verificables materializados por esta tarea ya cuentan con cobertura vigente para separación de incidentes, autoridad, handoff, fuente única, idempotencia, resultados desconocidos, interoperabilidad tecnológica, información/evidencia, analítica y continuidad transversal. La tarea define la distribución exacta de esas obligaciones entre once fronteras sin introducir un comportamiento ejecutable nuevo, una nueva identidad, un nuevo estado, un nuevo permiso, un nuevo transporte ni un nuevo efecto.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 47. Criterios de aceptación

1. existen exactamente once fronteras;
2. las once fronteras del título están materializadas;
3. no existe frontera faltante;
4. no existe frontera duplicada;
5. SHELL conserva cero procesos empresariales propietarios;
6. SHELL conserva identidad, contexto, navegación y handoff;
7. SHELL no declara continuidad;
8. VISO conserva `VPROC-0062`;
9. VISO registra decisiones sin convertirse en aprobador por persistirlas;
10. incidente tecnológico e incidente de continuidad permanecen separados;
11. ANIMA conserva experiencia personal y comunicación;
12. entrega/lectura/ack en ANIMA no cambia el estado empresarial;
13. Z conserva health e incidente tecnológico;
14. recuperación técnica de Z no equivale a recuperación empresarial;
15. AA conserva privacidad, retención, hold, custodia y evidencia;
16. evidencia no equivale a estado empresarial;
17. AB conserva métricas, calidad y analítica;
18. métrica no equivale a decisión;
19. E4 conserva capacidad técnica compartida sin propiedad del proceso;
20. entrega E4 no equivale a efecto empresarial;
21. las diez identidades E4 permanecen reconocidas;
22. la no aplicabilidad de `QUEUE_CONDITIONAL` en la ruta prioritaria vigente se conserva;
23. E5 conserva planificación antes de implementación;
24. plan E5 no equivale a implementación;
25. el alcance de implementación condicional permanece no iniciado;
26. T conserva pruebas, release, deploy y rollback;
27. deploy no equivale a recuperación;
28. rollback no equivale a cierre;
29. U conserva certificación transversal;
30. U puede rechazar certificación sin mutar el hecho fuente;
31. U no sustituye readiness/cutover/hypercare;
32. X conserva contratos, eventos, productor, consumidor, retry y handoff;
33. no se crea catálogo de eventos paralelo;
34. health check no se publica como evento empresarial por inferencia;
35. evento no concede permiso;
36. consumidora no escribe directamente a productora;
37. se conserva el contexto mínimo de continuidad;
38. campos faltantes no se completan mediante supuestos favorables;
39. se conserva idempotencia cuando existe riesgo de repetición;
40. resultado desconocido exige reconciliación antes de repetir un efecto inseguro;
41. una activación de continuidad no amplía autoridad de retry;
42. se preserva correlación sin fusionar expedientes;
43. se preserva evidencia sin duplicar fuentes;
44. se preserva minimización durante incidentes;
45. se preservan restricciones de autorización durante incidentes;
46. la recuperación de una frontera no cierra automáticamente continuidad;
47. el cierre exige validación de propietarios y pendientes tratados;
48. no se inventa endpoint;
49. no se inventa topic;
50. no se inventa tabla;
51. no se inventa cola;
52. no se inventa worker;
53. no se inventa proveedor;
54. no se inventa SLA;
55. no se inventa alternativa;
56. no se ejecuta Supabase;
57. no se ejecuta código;
58. no se ejecuta deploy;
59. no se ejecuta replay;
60. no se modifica 04A;
61. se crean cero requisitos de prueba;
62. se modifican cero requisitos de prueba;
63. cada pendiente físico tiene propietario y condición de salida;
64. `CONT-INT-003` permanece reservada.

---

#### 48. Resultado de la tarea

`CONT-INT-002` deja cerrada la semántica de interoperabilidad entre continuidad y las once superficies transversales requeridas.

El resultado permite que una interrupción pueda correlacionar:

```text
IDENTIDAD / CONTEXTO
+
EXPEDIENTE
+
COMUNICACIÓN
+
HEALTH TÉCNICO
+
INFORMACIÓN Y EVIDENCIA
+
MÉTRICAS
+
SERVICIOS TRANSVERSALES
+
READINESS / CUTOVER / HYPERCARE
+
TEST / RELEASE / DEPLOY / ROLLBACK
+
CERTIFICACIÓN
+
CONTRATOS DE INTEGRACIÓN
```

sin convertir esa coordinación en:

```text
AUTORIDAD IMPLÍCITA
FUENTE DE VERDAD PARALELA
ESCRITURA CRUZADA
ACTIVACIÓN AUTOMÁTICA
RECUPERACIÓN EMPRESARIAL AUTOMÁTICA
CIERRE AUTOMÁTICO
IMPLEMENTACIÓN NO AUTORIZADA
```

La implementación física permanece fuera de esta tarea.

---

ÚLTIMA TAREA APROBADA

`CONT-INT-001 — Definir contratos de criticidad, dependencia, salud, estado degradado e incidente con todas las aplicaciones`

TAREA ACTUAL APROBADA

`CONT-INT-002 — Definir contratos con SHELL, VISO, ANIMA, BLOQUE Z, AA, AB, E4, E5, T, U y X`

SIGUIENTE TAREA RESERVADA

`CONT-INT-003 — Definir contratos con Supabase, nube, energía, ISP, pagos, mensajería, transporte y proveedores críticos`


### ✅ CONT-INT-003 — Definir contratos con Supabase, nube, energía, ISP, pagos, mensajería, transporte y proveedores críticos

**Estado:** APROBADA
**Tarea anterior:** `CONT-INT-002 — Definir contratos con SHELL, VISO, ANIMA, BLOQUE Z, AA, AB, E4, E5, T, U y X` — APROBADA
**Tarea siguiente:** `CONT-INT-004 — Definir contratos de captura, replay, idempotencia, reincorporación, conciliación y retorno al servicio normal` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada de contratos de continuidad con Supabase, nube, energía, ISP, pagos, mensajería, transporte y proveedores críticos, sin selección de proveedor, binding físico ni ejecución operativa
**Bloque:** AC — Continuidad operativa y recuperación
**Mini-bloque:** Integraciones de continuidad y reincorporación
**Fase:** exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/AC_CONTINUIDAD_OPERATIVA_Y_RECUPERACION/04_INTEGRACIONES_DE_CONTINUIDAD_Y_REINCORPORACION.md`
**Implementación física autorizada:** ninguna
**Cambios de código, DDL, DML, migraciones, RLS, RPC, secretos, proveedores, contratos comerciales, infraestructura, despliegues, datos o configuración productiva:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el contrato de continuidad entre Vento OS y ocho familias de dependencias externas o de infraestructura cuya indisponibilidad, degradación, recuperación o comportamiento ambiguo puede afectar procesos empresariales: Supabase, nube, energía, ISP, pagos, mensajería, transporte y proveedores críticos.

La tarea fija qué autoridad conserva VENTO, qué hechos externos pueden consumirse, cómo se correlacionan con servicios y procesos, qué condiciones permiten declarar degradación, qué acciones requieren autoridad explícita, cómo se manejan resultados parciales o desconocidos y qué evidencia debe conservarse sin convertir al tercero en fuente de verdad empresarial.

El contrato debe impedir que una señal externa produzca por inferencia:

```text
DECLARACIÓN DE CONTINUIDAD
ACTIVACIÓN
FAILOVER
CAMBIO DE PROVEEDOR
RECUPERACIÓN EMPRESARIAL
CIERRE DEL INCIDENTE
```

---

#### 2. Resultado sustantivo

Quedan materializadas exactamente ocho familias contractuales:

1. Supabase;
2. nube;
3. energía;
4. ISP;
5. pagos;
6. mensajería;
7. transporte;
8. proveedores críticos.

Para cada familia se define:

- autoridad interna y externa;
- objeto o dependencia que puede relacionarse;
- contexto mínimo de continuidad;
- fuentes admisibles de estado;
- health y degradación;
- identidad y correlación;
- autorización;
- autenticación técnica cuando exista integración;
- sensibilidad y minimización;
- idempotencia y deduplicación;
- rate limits y reintentos;
- tratamiento de timeout y resultado desconocido;
- circuit breaking o aislamiento cuando corresponda;
- contingencia;
- failover o sustitución solamente cuando exista alternativa aprobada;
- recuperación y retorno;
- evidencia;
- estado AS-IS que puede afirmarse con evidencia actual;
- límites de lo que permanece pendiente de evidencia;
- propietario y condición de salida de toda materialización futura.

Balance:

| Control                                    |  Resultado |
| ------------------------------------------ | ---------: |
| Familias esperadas                         |      **8** |
| Familias materializadas                    | **8 de 8** |
| Familias faltantes                         |      **0** |
| Familias duplicadas                        |      **0** |
| Proveedores alternos inventados            |      **0** |
| SLA externos inventados                    |      **0** |
| Regiones o zonas cloud inventadas          |      **0** |
| Endpoints inventados                       |      **0** |
| Credenciales inventadas                    |      **0** |
| Failovers declarados sin evidencia         |      **0** |
| Cambios físicos                            |      **0** |
| Requisitos de prueba creados o modificados |      **0** |

---

#### 3. Entradas canónicas preservadas

CONT-INT-003 consume y conserva, sin redefinir:

- `CONT-DOM-001` a `CONT-DOM-015` para gobierno de continuidad, BIA, dependencias, objetivos, incidente, mando, operación mínima, contingencia, recuperación, proveedores, ejercicios y aprendizaje;
- `CONT-AUTH-001` a `CONT-AUTH-004` para declaración, activación, break-glass, protección y segregación;
- `CONT-UX-001` a `CONT-UX-007` para mando, comunicación, contingencia, recuperación y ejercicios;
- `CONT-INT-001` para criticidad, dependencia, health, degradación e incidente con las aplicaciones;
- `CONT-INT-002` para las fronteras internas con SHELL, VISO, ANIMA, Z, AA, AB, E4, E5, T, U y X;
- la separación entre incidente tecnológico e incidente de continuidad;
- la autoridad de las aplicaciones propietarias sobre sus hechos empresariales;
- el gobierno de información, clasificación, finalidad, custodia y evidencia del BLOQUE AA;
- el gobierno de métricas, calidad, snapshots y analítica del BLOQUE AB;
- los contratos del BLOQUE X para identidad técnica, credenciales, firma/origen, versionado, idempotencia, deduplicación, rate limits, retry, circuit breaker, cuarentena, auditoría, conciliación, contingencia y retiro de integraciones externas;
- los servicios transversales E4, incluidos integraciones externas/webhooks, notificaciones, trabajos asíncronos, outbox, evidencia y monitoreo;
- los contratos tecnológicos de BLOQUE Z para red, proveedores, aplicaciones, telemetría, health, cambios, respaldo y recuperación técnica;
- E5, T y U para readiness, cutover, piloto, hypercare, pruebas, release, despliegue, rollback y certificación;
- el contrato de eventos empresariales, sus productoras y consumidoras, sin transformar webhooks, health checks o estados de proveedor en eventos empresariales por defecto;
- la ruta prioritaria vigente y su frontera documental, sin activar alcance de implementación.

La tarea no modifica la propiedad de procesos, el BIA, los objetivos de continuidad, las identidades de aplicaciones, el catálogo de eventos, las matrices de consumidoras, las reglas de autorización ni la fase vigente.

---

#### 4. Decisión principal

Las dependencias externas se gobiernan mediante un modelo de **autoridad interna preservada y evidencia externa correlacionada**.

```text
TERCERO / INFRAESTRUCTURA
→ observa o ejecuta una capacidad externa
→ entrega estado, respuesta o evidencia técnica

VENTO
→ valida identidad, autenticidad, vigencia y alcance
→ correlaciona con dependencia, servicio y proceso
→ conserva su autoridad empresarial
→ decide degradación, contingencia, recuperación y cierre conforme a sus contratos
```

Regla cardinal:

```text
ESTADO DEL PROVEEDOR
≠
ESTADO EMPRESARIAL DE VENTO
```

Una dependencia externa puede ser necesaria, pero no adquiere autoridad para declarar el resultado del proceso que la consume.

---

#### 5. Fronteras obligatorias

Se preservan las siguientes separaciones:

```text
PROVEEDOR DISPONIBLE
≠ SERVICIO BIA RECUPERADO
```

```text
PROVEEDOR CAÍDO
≠ CONTINUIDAD ACTIVADA
```

```text
SLA DE PROVEEDOR
≠ MTPD
≠ RTO
≠ RPO
≠ MBCO
```

```text
CONECTIVIDAD DE RED
≠ HEALTH DE APLICACIÓN
≠ DISPONIBILIDAD EMPRESARIAL
```

```text
ENERGÍA RESTAURADA
≠ SISTEMAS RECUPERADOS
≠ DATOS CONCILIADOS
```

```text
WEBHOOK RECIBIDO
≠ HECHO EMPRESARIAL CONFIRMADO
```

```text
MENSAJE ENVIADO
≠ MENSAJE ENTREGADO
≠ MENSAJE LEÍDO
≠ ACCIÓN EJECUTADA
```

```text
ESTADO EXTERNO DE TRANSPORTE
≠ ESTADO CANÓNICO DEL PROCESO VENTO
```

```text
FAILOVER TÉCNICAMENTE POSIBLE
≠ FAILOVER AUTORIZADO
```

---

#### 6. Contrato transversal de dependencia externa

Toda integración de continuidad con una dependencia externa debe poder identificar, cuando aplique:

| Dimensión                 | Regla                                                                                                   |
| ------------------------- | ------------------------------------------------------------------------------------------------------- |
| `dependency_ref`          | referencia estable a la dependencia material, sin usar el nombre del proveedor como identidad universal |
| `provider_ref`            | referencia al tercero o prestador cuando esté gobernada por su dominio propietario                      |
| `contract_ref`            | referencia contractual cuando exista y esté autorizada                                                  |
| `service_ref`             | servicio tecnológico o empresarial relacionado                                                          |
| `process_ref`             | proceso `VPROC-*` que depende de la capacidad                                                           |
| `bcs_ref`                 | servicio BIA `BCS-VPROC-*` aplicable                                                                    |
| `application_ref`         | aplicación VENTO afectada cuando corresponda                                                            |
| `site_scope`              | sede, región operacional o alcance físico cuando sea material y conocido                                |
| `capability_ref`          | capacidad exacta consumida del tercero                                                                  |
| `external_object_ref`     | identidad externa del objeto, transacción, mensaje, envío o recurso cuando exista                       |
| `external_status`         | estado recibido sin reinterpretarlo como estado VENTO                                                   |
| `observed_at`             | instante de observación                                                                                 |
| `received_at`             | instante de recepción por VENTO                                                                         |
| `freshness`               | vigencia utilizable de la observación                                                                   |
| `correlation_ref`         | vínculo entre incidente, operación, callback, intento y evidencia                                       |
| `idempotency_ref`         | identidad estable para efectos reintentables cuando aplique                                             |
| `contract_version`        | versión del contrato de integración cuando exista                                                       |
| `evidence_ref`            | referencia a evidencia suficiente y minimizada                                                          |
| `continuity_incident_ref` | incidente de continuidad relacionado cuando realmente exista                                            |

Los campos no conocidos no se completan mediante inferencia favorable.

---

#### 7. Identidad de proveedor, dependencia y capacidad

Se preserva:

```text
PROVEEDOR
≠ CONTRATO
≠ SERVICIO
≠ CAPACIDAD
≠ DEPENDENCIA
≠ ENDPOINT
≠ CREDENCIAL
```

Reglas:

1. una empresa proveedora puede prestar varias capacidades;
2. una capacidad puede depender de varios componentes;
3. un contrato comercial no demuestra que la capacidad esté operativa;
4. un endpoint no demuestra por sí solo la identidad empresarial del proveedor;
5. una credencial no determina la autoridad empresarial;
6. una dependencia crítica requiere relación material con un resultado empresarial;
7. la mera existencia de un SDK, URL, webhook, token, cuenta o integración no convierte al tercero en proveedor crítico;
8. los aliases externos se mapean a identidades canónicas sin fusionarlas por texto libre.

---

#### 8. Autoridad y autenticación

Toda integración externa debe preservar dos decisiones separadas:

```text
AUTENTICAR AL TERCERO O A LA INTEGRACIÓN
≠
AUTORIZAR EL EFECTO EMPRESARIAL
```

La integración podrá usar el mecanismo técnico aprobado por su tarea propietaria, pero CONT-INT-003 no selecciona API key, OAuth, HMAC, certificado, secreto compartido u otro mecanismo para una familia que no tenga esa decisión materializada.

Reglas mínimas:

- cada integración conserva identidad técnica independiente;
- credenciales de desarrollo, staging y producción permanecen separadas;
- secretos no se transportan como datos ordinarios del incidente;
- logs y evidencia referencian credenciales sin exponer su valor;
- una credencial de lectura no se reutiliza como escritura por conveniencia;
- una credencial revocada no se reactiva por contingencia;
- la urgencia no autoriza `service_role` como bypass de fronteras empresariales;
- el receptor interno vuelve a validar la acción sobre su recurso.

---

#### 9. Modelo de estado externo

La observación externa debe conservar el estado original y, cuando exista mapping aprobado, una interpretación interna separada.

Estados externos pueden expresar, según el proveedor concreto:

- disponibilidad;
- indisponibilidad;
- degradación;
- mantenimiento;
- rechazo;
- aceptación técnica;
- procesamiento;
- entrega;
- resultado final;
- desconocido.

CONT-INT-003 no impone esos nombres al tercero.

La normalización interna de continuidad utiliza únicamente hechos suficientemente autenticados, frescos y correlacionados. Si no existe mapping validado:

```text
EXTERNAL_STATUS
→ EVIDENCIA EXTERNA
→ NO SE FABRICA HEALTH VENTO
```

---

#### 10. Health y degradación externa

Una dependencia externa puede aportar señales para el contrato de health, pero el health de VENTO sigue dependiendo de la capacidad empresarial y del alcance.

Reglas:

1. el estado del proveedor no se copia como health VENTO;
2. se conserva frescura y fuente;
3. la ausencia de respuesta no equivale automáticamente a `UNAVAILABLE` del proceso;
4. un status page favorable no prueba el resultado real desde las sedes o aplicaciones VENTO;
5. una falla local no se atribuye al proveedor sin evidencia;
6. una falla del proveedor no se propaga a todas las capacidades que no dependan materialmente de él;
7. la degradación conserva la capacidad mínima todavía disponible;
8. el alcance se calcula por consumidores y dependencias reales, no por nombre del proveedor.

---

#### 11. Contrato con Supabase

##### 11.1 Frontera

Supabase actúa como sustrato técnico compartido para capacidades que pueden incluir base de datos, autenticación, Storage, funciones, Realtime u otros componentes efectivamente consumidos por VENTO.

El hecho de persistir información no convierte a Supabase en propietaria funcional del proceso.

##### 11.2 Autoridad conservada por VENTO

Las aplicaciones propietarias conservan:

- semántica y estados empresariales;
- reglas de transición;
- propiedad de expedientes;
- autorización empresarial;
- datos y documentos conforme a AA;
- criterios de recuperación funcional.

SHELL conserva sus decisiones de identidad, acceso y contexto conforme a su contrato.

##### 11.3 Señales admisibles

Una integración futura o existente puede aportar señales de:

- disponibilidad del sustrato;
- error de acceso;
- error de persistencia;
- error de autenticación;
- error de Storage;
- error de función;
- latencia;
- degradación de una dependencia;
- fallo de una operación concreta.

La tarea no declara que todos esos componentes estén habilitados para todas las aplicaciones.

##### 11.4 Reglas de continuidad

1. una base accesible no prueba que el proceso esté recuperado;
2. autenticación disponible no prueba que la aplicación pueda completar su función;
3. Storage disponible no prueba integridad del documento requerido;
4. una réplica o sincronización no equivale a backup recuperable;
5. backup exitoso no equivale a restauración probada;
6. restore técnico no equivale a recuperación empresarial;
7. una operación ambigua se reconcilia antes de repetirse si puede duplicar efecto;
8. el retorno del sustrato no autoriza vaciar trabajo pendiente sin control;
9. el acceso técnico compartido no autoriza escritura cruzada;
10. cualquier modificación Supabase de VENTO permanece gobernada y versionada desde `vento-shell` en su fase propietaria.

##### 11.5 Failover

CONT-INT-003 no declara una región secundaria, proyecto alterno, réplica promocionable ni proveedor sustituto.

Un failover de Supabase solo puede considerarse materializado cuando una tarea propietaria demuestre:

- destino alterno exacto;
- versión y compatibilidad;
- datos y RPO alcanzables;
- credenciales y autorización;
- redireccionamiento;
- consistencia de Storage y funciones aplicables;
- estrategia de retorno;
- prueba de restauración o conmutación;
- evidencia.

**Contrato semántico:** `ESPECIFICADO`.
**Binding de failover concreto:** `PENDIENTE_DE_EVIDENCIA`.

---

#### 12. Contrato con nube

##### 12.1 Definición

La familia nube agrupa infraestructura o servicios administrados externos que soporten una capacidad VENTO y cuya identidad concreta deba provenir del inventario o contrato propietario.

No se presume un único proveedor cloud universal.

##### 12.2 Relación con continuidad

Una dependencia cloud debe poder vincular:

- proveedor o plataforma cuando esté identificado;
- servicio concreto;
- cuenta/proyecto/tenant gobernado cuando corresponda;
- ambiente;
- aplicación o servicio consumidor;
- sede o población afectada cuando sea material;
- dependencia superior e inferior;
- health y evidencia;
- plan de contingencia;
- propietario interno.

##### 12.3 Reglas

- status regional no equivale a estado empresarial;
- una región no se declara alternativa sin arquitectura aprobada;
- una zona no se declara redundante por la sola capacidad comercial del proveedor;
- escalar recursos no es failover por definición;
- recrear infraestructura no prueba recuperación de datos;
- migrar a otro prestador no se improvisa durante el incidente;
- cambios de infraestructura protegida siguen autorización, change y BLOQUE T cuando corresponda.

##### 12.4 Resultado

El contrato neutral queda `ESPECIFICADO`.

Proveedor, región, zona, cuenta, arquitectura de redundancia y mecanismo de failover permanecen `PENDIENTE_DE_EVIDENCIA` cuando no exista una decisión canónica concreta en la fuente propietaria.

---

#### 13. Contrato con energía

##### 13.1 Frontera

La energía se trata como dependencia física de sede, equipo, red, punto de atención, dispositivo o infraestructura cuando el BIA y el mapa de dependencias demuestren esa relación.

##### 13.2 Estado y alcance

El contrato debe distinguir:

- energía normal disponible;
- pérdida de energía;
- energía parcial;
- suministro inestable;
- capacidad respaldada cuando exista evidencia;
- autonomía restante cuando exista un mecanismo que la mida;
- restablecimiento de suministro.

Esos estados no se presumen si no existe fuente verificable.

##### 13.3 Contingencia

La estrategia aplicable puede ser, solo si fue aprobada para el proceso:

- operación bloqueada;
- procedimiento manual;
- ubicación alternativa;
- dispositivo alterno;
- energía de respaldo;
- reducción de capacidad;
- suspensión controlada.

CONT-INT-003 no declara la existencia de UPS, planta, batería, generador, circuito alterno ni sede sustituta sin evidencia propietaria.

##### 13.4 Recuperación

```text
ENERGÍA RESTAURADA
→ validar infraestructura
→ validar red
→ validar dispositivos
→ validar aplicaciones
→ validar datos y pendientes
→ validar capacidad empresarial
```

El primer paso no confirma los siguientes.

**Contrato semántico:** `ESPECIFICADO`.
**Inventario físico de respaldo y autonomía:** `PENDIENTE_DE_EVIDENCIA` por sede/capacidad cuando no esté materializado en su fuente propietaria.

---

#### 14. Contrato con ISP

##### 14.1 Frontera

El ISP provee conectividad externa; BLOQUE Z conserva el modelo técnico de red y continuidad conserva la evaluación empresarial de la capacidad afectada.

##### 14.2 Señales

Pueden correlacionarse, cuando exista fuente válida:

- reachability;
- pérdida de conectividad;
- latencia;
- pérdida de paquetes;
- degradación;
- incidencia del proveedor;
- mantenimiento;
- restablecimiento.

##### 14.3 No equivalencias

```text
ISP UP
≠ APLICACIÓN HEALTHY
```

```text
ISP DOWN
≠ PROCESO TOTALMENTE INDISPONIBLE
```

```text
SEGUNDO ENLACE COMERCIALMENTE DISPONIBLE
≠ FAILOVER IMPLEMENTADO
```

##### 14.4 Failover

Una alternativa ISP solo se considera utilizable si existen, como mínimo:

- proveedor/enlace concreto;
- sede y alcance;
- capacidad suficiente;
- direccionamiento/routing requerido;
- configuración y seguridad;
- mecanismo de detección y conmutación;
- autorización;
- prueba;
- retorno al enlace normal.

CONT-INT-003 no presume redundancia de ISP ni balanceo.

**Contrato semántico:** `ESPECIFICADO`.
**Redundancia ISP concreta por sede:** `PENDIENTE_DE_EVIDENCIA` salvo evidencia propietaria posterior.

---

#### 15. Contrato con pagos

##### 15.1 Autoridad

El dominio propietario del pago conserva el hecho empresarial y su estado canónico. El proveedor externo conserva su transacción y respuesta externa. La integración correlaciona ambas identidades.

##### 15.2 Evidencia AS-IS verificable

Existe en `vento-shell` un adaptador `payments-webhook` que actualmente:

- recibe eventos del proveedor identificado como Wompi;
- valida checksum del webhook;
- correlaciona evento y transacción;
- consulta eventos ya procesados;
- reconoce duplicados procesados;
- registra el evento recibido;
- aplica el resultado mediante RPC propietaria;
- conserva payload técnico como parte del tratamiento actual.

Esta evidencia acredita código existente del adaptador. No acredita por sí sola disponibilidad productiva, SLA, RTO, proveedor alterno, failover, cobertura de todos los pagos ni operación remota validada.

##### 15.3 Regla de estado

```text
PROVIDER_STATUS
→ VALIDACIÓN DEL CONTRATO
→ CORRELACIÓN CON TRANSACCIÓN
→ APLICACIÓN POR PROPIETARIA
→ HECHO INTERNO
```

El webhook por sí solo no adquiere autoridad para inventar la transacción interna.

##### 15.4 Resultado ambiguo

Ante timeout, pérdida de callback o resultado desconocido:

- no se repite ciegamente el cobro;
- se conserva la identidad de la intención;
- se consulta o reconcilia el estado cuando el contrato lo permita;
- se impide doble efecto;
- se conserva evidencia externa e interna;
- cualquier compensación o reversión sigue contrato propietario.

##### 15.5 Contingencia

La indisponibilidad del proveedor de pagos puede llevar a:

- degradación del canal;
- suspensión de la operación afectada;
- método alterno únicamente si ya está aprobado por el proceso;
- comunicación verdadera de pendiente o indisponibilidad.

No se promete confirmación de pago sin evidencia autoritativa.

**Contrato semántico:** `ESPECIFICADO`.
**Adaptador Wompi observado en código:** `IMPLEMENTADO` como activo técnico; validación operativa/remota `PENDIENTE_DE_EVIDENCIA`.
**Proveedor alterno de pagos:** no se declara sin evidencia canónica.

---

#### 16. Contrato con mensajería

##### 16.1 Frontera

Mensajería abarca canales externos o capacidades de entrega utilizados para notificaciones, alertas, comunicaciones o interacciones, sin convertir la entrega técnica en resultado empresarial.

##### 16.2 Evidencia AS-IS verificable

Existe en `vento-shell` una función `register-push-token` que:

- exige usuario autenticado;
- registra token de dispositivo;
- conserva plataforma;
- conserva estado de permiso;
- conserva habilitación de notificaciones;
- conserva nombre de dispositivo cuando se proporciona;
- actualiza `last_seen`;
- marca actividad conforme al permiso informado.

Este activo demuestra registro de direccionamiento push. No demuestra una cadena transversal completa de renderizado, cola, envío, entrega, retry, historial y reconciliación multicanal.

##### 16.3 Estados separados

```text
PREPARADO
≠ ENCOLADO
≠ ENVIADO
≠ ACEPTADO POR CANAL
≠ ENTREGADO
≠ LEÍDO
≠ COMPRENDIDO
≠ ACCIÓN EJECUTADA
```

##### 16.4 Multicanal

Una estrategia multicanal solo puede usar canales realmente autorizados y configurados.

El fallo de un canal:

- no autoriza copiar el mensaje a cualquier canal disponible;
- conserva clasificación y audiencia;
- aplica fallback únicamente si fue aprobado;
- evita duplicación de efectos asociados a una respuesta del usuario;
- conserva estado individual por canal.

##### 16.5 Continuidad

Una comunicación crítica debe poder conservar:

- incidente;
- mensaje/version;
- audiencia;
- canal;
- intento;
- resultado de entrega;
- vigencia;
- clasificación;
- acknowledgement cuando aplique;
- fallback aplicado cuando exista.

**Contrato semántico:** `ESPECIFICADO`.
**Registro de tokens push observado:** `IMPLEMENTADO` como activo parcial.
**Servicio multicanal completo:** `PENDIENTE_DE_EVIDENCIA`.

---

#### 17. Contrato con transporte

##### 17.1 Frontera

Transporte representa una dependencia externa de movilidad, entrega, traslado o ejecución física cuando un proceso VENTO dependa materialmente de un tercero o servicio de transporte.

CONT-INT-003 no presupone proveedor, flota, API, tracking, GPS, webhook ni agregador.

##### 17.2 Estado externo

Cuando exista integración, pueden consumirse referencias como:

- solicitud externa;
- asignación;
- aceptación;
- retiro/recogida;
- tránsito;
- entrega;
- cancelación;
- rechazo;
- incidencia;
- ubicación o ETA cuando estén autorizadas y sean suficientemente frescas.

Esos conceptos deben mapearse al proceso propietario, no copiarse automáticamente como estado canónico VENTO.

##### 17.3 Resultado empresarial

```text
PROVEEDOR DICE ENTREGADO
≠ ENTREGA EMPRESARIAL VENTO CONFIRMADA
```

La propietaria define qué evidencia, aceptación o reconciliación convierte un resultado externo en hecho interno.

##### 17.4 Contingencia

Ante indisponibilidad:

- el proceso evalúa si puede esperar, reprogramar, operar manualmente o usar alternativa aprobada;
- la alternativa conserva identidad separada;
- no se reasigna a un tercero no aprobado por urgencia;
- trabajos ya aceptados conservan su estado y no se duplican al cambiar de prestador;
- el retorno del proveedor original no anula operaciones ya reasignadas.

**Contrato semántico:** `ESPECIFICADO`.
**Binding concreto de proveedor/transporte:** `PENDIENTE_DE_EVIDENCIA` cuando no esté materializado por la tarea propietaria.

---

#### 18. Contrato con proveedores críticos

##### 18.1 Criterio de criticidad

Un proveedor se clasifica como dependencia crítica únicamente cuando la relación con un resultado empresarial esté materializada en BIA/dependencias y el impacto de su pérdida supere los umbrales aplicables.

No basta con:

- tener contrato;
- tener gasto alto;
- aparecer en una integración;
- disponer de credenciales;
- suministrar tecnología;
- ser conocido por el equipo;
- tener una alerta crítica propia.

##### 18.2 Registro mínimo

Para cada proveedor crítico materializado por sus tareas propietarias deben poder resolverse, cuando apliquen:

- proveedor canónico;
- capacidad suministrada;
- contrato;
- servicio/proceso consumidor;
- propietario interno;
- dependencia BIA;
- ventana de impacto;
- contacto/escalamiento autorizado;
- evidencia de health;
- método de soporte;
- contingencia;
- alternativa aprobada si existe;
- condición de sustitución;
- condición de retorno;
- salida/portabilidad cuando corresponda.

##### 18.3 Proveedor sustituto

```text
PROVEEDOR SUSTITUTO
≠ PROVEEDOR POTENCIAL
```

La condición de sustituto exige evidencia suficiente de:

- aprobación;
- alcance;
- capacidad;
- seguridad;
- contrato o mecanismo permitido;
- datos/configuración necesarios;
- compatibilidad;
- prueba o readiness aplicable.

##### 18.4 Concentración y dependencia común

Debe identificarse cuando varias capacidades dependan del mismo:

- proveedor;
- tenant;
- cuenta;
- circuito;
- región;
- credencial;
- canal;
- integrador;
- infraestructura compartida.

La coincidencia solo se declara cuando exista evidencia. La tarea no inventa concentraciones no demostradas.

**Contrato semántico:** `ESPECIFICADO`.
**Inventario completo de proveedores críticos y sustitutos:** se conserva en las tareas propietarias de BIA/proveedores y permanece sujeto a evidencia vigente; CONT-INT-003 no crea un maestro paralelo.

---

#### 19. Matriz consolidada de las ocho familias

| Familia           | Autoridad externa/técnica                | Autoridad VENTO conservada                           | Señal utilizable                                                     | Efecto que no puede inferirse                       | Estado contractual |
| ----------------- | ---------------------------------------- | ---------------------------------------------------- | -------------------------------------------------------------------- | --------------------------------------------------- | ------------------ |
| Supabase          | estado técnico del sustrato              | semántica, autorización y hechos de las propietarias | disponibilidad/error/latencia por componente cuando exista evidencia | proceso recuperado, autorización cruzada o failover | `ESPECIFICADO`     |
| nube              | estado del servicio cloud concreto       | evaluación de dependencia y resultado empresarial    | status técnico autenticado y fresco                                  | redundancia, región alterna o recovery empresarial  | `ESPECIFICADO`     |
| energía           | suministro físico observado              | decisión de contingencia por capacidad               | pérdida, parcialidad o restablecimiento cuando exista fuente         | sistemas/datos/proceso recuperados                  | `ESPECIFICADO`     |
| ISP               | conectividad del enlace/proveedor        | health de red y resultado empresarial                | reachability/degradación/incidencia                                  | app saludable o continuidad activada                | `ESPECIFICADO`     |
| pagos             | transacción/estado externo del proveedor | hecho de pago en dominio propietario                 | callback/consulta validada y correlacionada                          | cobro interno confirmado sin aceptación propietaria | `ESPECIFICADO`     |
| mensajería        | entrega técnica del canal                | contenido, audiencia, acción y resultado empresarial | estados de entrega por canal                                         | lectura, comprensión o acción                       | `ESPECIFICADO`     |
| transporte        | ejecución externa del servicio           | hecho logístico del proceso propietario              | status/evidencia externa correlacionada                              | entrega VENTO confirmada por status aislado         | `ESPECIFICADO`     |
| proveedor crítico | capacidad externa contratada/prestada    | criticidad BIA, activación, contingencia y cierre    | health/soporte/evidencia contractual o técnica                       | criticidad o sustitución por mera existencia        | `ESPECIFICADO`     |

Reconciliación:

- esperadas: **8**;
- materializadas: **8**;
- faltantes: **0**;
- duplicadas: **0**.

---

#### 20. Relación con BIA y objetivos de recuperación

Toda dependencia externa debe conservar relación con el BIA aplicable.

Reglas:

1. MTPD pertenece al resultado empresarial, no al proveedor;
2. RTO del proceso no se reemplaza por tiempo estimado de reparación del proveedor;
3. RPO no se deriva de una política comercial de backup;
4. MBCO no se satisface porque el proveedor declare servicio disponible;
5. el SLA puede ser una restricción o insumo contractual, pero no redefine el objetivo de continuidad;
6. si un objetivo empresarial es más estricto que la capacidad externa demostrada, la brecha debe quedar explícita;
7. si una alternativa no puede satisfacer el mínimo empresarial, no se presenta como estrategia suficiente.

---

#### 21. Declaración y activación

Una señal externa puede disparar evaluación, no activación automática.

```text
SEÑAL DE PROVEEDOR
→ VALIDAR FUENTE Y FRESCURA
→ RESOLVER DEPENDENCIA AFECTADA
→ CALCULAR ALCANCE EN SERVICIOS/PROCESOS
→ EVALUAR IMPACTO Y UMBRALES
→ DECISIÓN AUTORIZADA
→ DECLARACIÓN / ACTIVACIÓN CUANDO CORRESPONDA
```

Se prohíbe activar continuidad por:

- status page aislado;
- error HTTP aislado;
- caída de un webhook;
- alerta de ISP sin alcance resuelto;
- pérdida de un token;
- un dispositivo sin energía;
- timeout de pago aislado;
- mensaje no entregado aislado;
- atraso de un transporte aislado;
- severidad asignada unilateralmente por un proveedor.

---

#### 22. Rate limits, retries y resultado desconocido

Las integraciones externas reintentables deben heredar los contratos X aplicables.

Reglas:

- identidad lógica estable antes del primer efecto;
- deduplicación por proveedor/operación/alcance según contrato;
- backoff y jitter;
- respeto de `Retry-After` cuando sea válido;
- presupuesto por destino y credencial;
- separación de cuotas entre integraciones;
- revalidación de autorización antes de un nuevo efecto sensible;
- edad máxima del trabajo;
- salida explícita al agotar presupuesto;
- no reinicio del presupuesto por reiniciar proceso o cliente;
- resultado posiblemente confirmado se consulta o reconcilia antes de repetir.

```text
TIMEOUT
≠ FALLO CONFIRMADO
≠ ÉXITO CONFIRMADO
```

---

#### 23. Circuit breaker, bulkheads y aislamiento

Cuando una implementación futura aplique circuit breaking o aislamiento:

1. el circuito protege al sistema de una dependencia degradada;
2. abrirlo no elimina trabajo;
3. abrirlo no confirma trabajo;
4. las pruebas half-open permanecen limitadas;
5. proveedores y capacidades se aíslan cuando sea posible;
6. una dependencia crítica no puede consumir toda la concurrencia y dejar starvation permanente al resto;
7. el restablecimiento no libera simultáneamente todo el backlog;
8. la prioridad no autoriza bypass de idempotencia ni autorización;
9. el estado del circuito es técnico y no equivale a activación de continuidad.

---

#### 24. Failover y proveedor alterno

CONT-INT-003 define el gate, no la alternativa concreta.

Un failover solo puede ejecutarse cuando exista:

1. alternativa identificada;
2. autoridad para usarla;
3. compatibilidad comprobada;
4. datos/configuración necesarios;
5. credenciales vigentes y separadas;
6. capacidad suficiente;
7. criterio de activación;
8. secuencia de cutover;
9. mecanismo contra doble efecto;
10. observabilidad;
11. rollback o retorno;
12. prueba/readiness aplicable.

Sin esos elementos:

```text
ALTERNATIVA = NO DEMOSTRADA
```

No se improvisa un proveedor sustituto durante el incidente.

---

#### 25. Contingencia sin proveedor alterno

La ausencia de alternativa no permite fabricar una.

El proceso debe usar únicamente estrategias ya aprobadas, por ejemplo:

- operación bloqueada;
- lectura de snapshot;
- borrador controlado;
- cola offline cuando aplique;
- procedimiento manual;
- ubicación alternativa;
- reducción de capacidad;
- comunicación de pendiente.

La selección concreta pertenece al servicio/proceso y debe respetar `CONT-DOM-*`, autorización y UX de contingencia.

---

#### 26. Evidencia y auditoría

Toda interacción material con un tercero debe permitir reconstruir, cuando aplique:

- dependencia;
- proveedor;
- operación externa;
- objeto externo;
- incidente;
- servicio/proceso;
- actor o principal técnico;
- credencial referenciada, nunca el secreto;
- contrato/version;
- request/callback;
- firma o validación de origen;
- tiempo del tercero y de VENTO;
- intento;
- respuesta;
- resultado;
- error;
- decisión posterior;
- evidencia original permitida;
- reconciliación pendiente.

La evidencia externa no se edita para hacerla concordar con el estado interno.

---

#### 27. Información, privacidad y secretos

Durante una interrupción se preservan:

- clasificación;
- finalidad;
- minimización;
- retención;
- legal hold;
- territorialidad cuando aplique;
- acceso por necesidad;
- custodia de evidencia.

No se colocan en tickets, eventos ordinarios, mensajes o bitácoras:

- API keys;
- service role keys;
- tokens reutilizables;
- secretos de webhook;
- claves privadas;
- OTP;
- credenciales de proveedor;
- cookies de sesión;
- payload completo sensible cuando una referencia es suficiente.

---

#### 28. AS-IS verificable y límite de evidencia

La tarea distingue código observado de operación validada.

| Activo observado          | Evidencia actual                | Qué sí demuestra                                                                                                  | Qué no demuestra                                                                 |
| ------------------------- | ------------------------------- | ----------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| `payments-webhook`        | código vigente en `vento-shell` | adaptador de webhook Wompi, validación de checksum, correlación, deduplicación/registro y aplicación de estado    | operación productiva, SLA, failover, proveedor alterno o cobertura total         |
| `club-revenuecat-webhook` | código vigente en `vento-shell` | adaptador externo autenticado por secreto que procesa eventos RevenueCat y actualiza superficies del dominio Club | idempotencia transversal completa, continuidad productiva, SLA o alternativa     |
| `register-push-token`     | código vigente en `vento-shell` | registro autenticado de tokens y metadatos de notificación del trabajador                                         | servicio completo de entrega, retry, historial, multicanal o confirmación humana |

La existencia de estos activos no permite generalizar su diseño a energía, ISP, nube, transporte u otros proveedores.

Las familias cuyo binding concreto no está demostrado permanecen bajo contrato neutral y `PENDIENTE_DE_EVIDENCIA` para su materialización propietaria.

---

#### 29. Relación con Supabase y cambios físicos

Toda futura modificación de Supabase perteneciente a VENTO:

- se crea y versiona desde `vento-shell`;
- revisa migraciones y esquema;
- revisa consumidores;
- revisa grants y RLS;
- revisa funciones, triggers, Realtime y Storage cuando apliquen;
- actualiza tipos y contratos;
- define rollback;
- se valida en la fase autorizada.

CONT-INT-003 no ejecuta ninguna de esas acciones físicas.

---

#### 30. Relación con BLOQUE Z

BLOQUE Z conserva:

- red;
- conectividad;
- endpoints;
- aplicaciones;
- telemetría;
- health técnico;
- incidentes tecnológicos;
- cambios;
- soporte a proveedores tecnológicos;
- recuperación técnica.

Continuidad consume esa evidencia sin asumir que:

- ISP = red;
- cloud = aplicación;
- provider status = health VENTO;
- recuperación técnica = recuperación empresarial.

La tarea no duplica los contratos tecnológicos externos definidos por Z; los especializa para la decisión empresarial de continuidad.

---

#### 31. Relación con ORIGO, NUMERA y autoridad contractual

Cuando proveedor, compra, contrato o costo formen parte de una dependencia:

- ORIGO conserva proveedor, compra y contrato dentro de su autoridad;
- NUMERA conserva compromiso, gasto, costo y hecho económico;
- continuidad conserva criticidad, dependencia, alternativa y decisión operativa;
- BLOQUE Z conserva necesidad y contexto técnico cuando aplique.

La continuidad no edita contrato o costo para resolver un incidente.

Un contrato vigente no demuestra capacidad disponible.

---

#### 32. Relación con E4 y X

E4 aporta capacidades técnicas compartidas cuando estén materializadas.

X gobierna contratos externos y credenciales.

CONT-INT-003 consume esas capacidades sin crear:

- un bus de continuidad;
- un endpoint universal;
- un topic universal;
- una tabla universal;
- una credencial compartida;
- un proveedor universal;
- un webhook genérico que adquiera autoridad empresarial.

---

#### 33. Relación con E5, T y U

Cuando una contingencia o alternativa requiera implementación física:

- E5 debe planificar paquete, pruebas, readiness, cutover, piloto, hypercare, suspensión y rollback;
- T debe ejecutar las pruebas, compatibilidad, release, deploy y rollback que correspondan;
- U certifica transversalmente cuando el alcance llegue a esa etapa.

CONT-INT-003 no convierte el contrato documental en readiness ni en autorización de implementación.

---

#### 34. Retorno del proveedor y recuperación

Cuando una dependencia externa vuelva a estar disponible:

```text
PROVEEDOR DISPONIBLE
→ validar estabilidad
→ validar integración
→ validar datos/operaciones pendientes
→ validar capacidad técnica
→ validar capacidad empresarial
→ decidir retorno
→ reconciliar pendientes conforme a CONT-INT-004
```

No se permite:

- reactivar todo el backlog de forma ciega;
- duplicar operaciones ejecutadas por contingencia;
- sobrescribir hechos manuales;
- cerrar el incidente antes de tratar pendientes;
- volver al proveedor primario si el retorno no está autorizado o es inseguro.

El contrato detallado de reincorporación y conciliación pertenece a `CONT-INT-004`.

---

#### 35. Pendientes y condiciones de salida

| Pendiente                                 | Estado                                                   | Propietario                                                       | Condición de salida                                                        |
| ----------------------------------------- | -------------------------------------------------------- | ----------------------------------------------------------------- | -------------------------------------------------------------------------- |
| failover concreto de Supabase             | `PENDIENTE_DE_EVIDENCIA`                                 | arquitectura/implementación propietaria de Supabase y continuidad | alternativa implementada, probada y reconciliable                          |
| redundancia cloud concreta                | `PENDIENTE_DE_EVIDENCIA`                                 | arquitectura propietaria + E5/T                                   | región/zona/servicio alterno aprobado y probado                            |
| energía de respaldo por sede/capacidad    | `PENDIENTE_DE_EVIDENCIA`                                 | instalaciones/continuidad + propietarios de sede                  | inventario, autonomía, mantenimiento y prueba materializados               |
| ISP alterno por sede                      | `PENDIENTE_DE_EVIDENCIA`                                 | BLOQUE Z + continuidad + propietario contractual                  | enlace alterno identificado, configurado, autorizado y probado             |
| alternativa de pagos                      | `PENDIENTE_DE_EVIDENCIA`                                 | dominio propietario de pagos + ORIGO/X + continuidad              | proveedor/método alterno aprobado con idempotencia y conciliación          |
| servicio multicanal completo              | `PENDIENTE_DE_EVIDENCIA`                                 | E4 + ANIMA/SHELL + X                                              | entrega, retry, evidencia y fallback implementados y probados              |
| binding de transporte                     | `PENDIENTE_DE_EVIDENCIA`                                 | proceso propietario + X + ORIGO cuando aplique                    | proveedor/contrato/mapping/evidencia materializados                        |
| inventario vigente de sustitutos críticos | `PENDIENTE_DE_EVIDENCIA` por cada relación no demostrada | propietarios BIA/proveedor                                        | alternativa aprobada, capaz y probada por dependencia                      |
| replay y reincorporación                  | `FUERA_DE_ALCANCE`                                       | `CONT-INT-004`                                                    | contrato completo de captura, replay, idempotencia, conciliación y retorno |

No queda un pendiente sin propietario y condición de salida.

---

#### 36. Estado de la ruta prioritaria

Se preserva el estado vigente:

| Elemento                               | Estado          |
| -------------------------------------- | --------------- |
| `CONDITIONAL_DESIGN_ARTIFACTS`         | `APROBADA`      |
| `CONDITIONAL_IMPLEMENTATION_SCOPE`     | `NO INICIADA`   |
| `CONDITIONAL_IMPLEMENTATION_EXECUTION` | `NO INICIADA`   |
| implementación física desde esta tarea | `NO AUTORIZADA` |

La definición de contratos externos no modifica el carril prioritario ni activa implementación.

---

#### 37. Prohibiciones transversales

Queda prohibido:

1. convertir status externo en estado canónico sin mapping y aceptación propietaria;
2. activar continuidad automáticamente desde una alerta de proveedor;
3. cerrar continuidad porque el tercero vuelva a estar disponible;
4. igualar SLA con RTO/RPO/MTPD/MBCO;
5. declarar proveedor alterno sin evidencia;
6. declarar redundancia cloud sin evidencia;
7. declarar ISP redundante sin evidencia;
8. declarar UPS, generador o autonomía sin evidencia;
9. repetir un pago ambiguo a ciegas;
10. convertir un webhook en fuente de verdad universal;
11. convertir un token push en prueba de entrega;
12. convertir `sent` en `delivered` o `read`;
13. convertir tracking externo en hecho logístico interno sin aceptación propietaria;
14. compartir secretos en tickets o mensajes;
15. reutilizar credenciales entre ambientes o integraciones;
16. usar `service_role` como autoridad empresarial;
17. ampliar audiencia por contingencia;
18. crear escritura cruzada para evitar una dependencia caída;
19. inventar endpoint, región, SLA, credencial, plan, contrato o proveedor;
20. ejecutar failover desde esta tarea;
21. ejecutar cambios Supabase desde esta tarea;
22. ejecutar replay desde esta tarea;
23. desarrollar `CONT-INT-004` dentro de esta tarea.

---

#### 38. Estados de materialización

| Resultado                              | Estado                                                                                    |
| -------------------------------------- | ----------------------------------------------------------------------------------------- |
| contrato Supabase                      | `ESPECIFICADO`                                                                            |
| contrato nube                          | `ESPECIFICADO`                                                                            |
| contrato energía                       | `ESPECIFICADO`                                                                            |
| contrato ISP                           | `ESPECIFICADO`                                                                            |
| contrato pagos                         | `ESPECIFICADO`                                                                            |
| contrato mensajería                    | `ESPECIFICADO`                                                                            |
| contrato transporte                    | `ESPECIFICADO`                                                                            |
| contrato proveedores críticos          | `ESPECIFICADO`                                                                            |
| webhook Wompi observado en código      | `IMPLEMENTADO` como activo técnico; operación remota `PENDIENTE_DE_EVIDENCIA`             |
| webhook RevenueCat observado en código | `IMPLEMENTADO` como activo técnico; operación remota `PENDIENTE_DE_EVIDENCIA`             |
| registro push observado en código      | `IMPLEMENTADO` como activo parcial; servicio de entrega completo `PENDIENTE_DE_EVIDENCIA` |
| failovers concretos                    | `PENDIENTE_DE_EVIDENCIA` salvo decisión propietaria demostrada                            |
| proveedores sustitutos concretos       | `PENDIENTE_DE_EVIDENCIA` salvo decisión propietaria demostrada                            |
| implementación física                  | `FUERA_DE_ALCANCE`                                                                        |
| replay/reincorporación                 | `FUERA_DE_ALCANCE` — `CONT-INT-004`                                                       |
| cambios Supabase                       | `NO_APLICA` en esta tarea                                                                 |
| cambios de requisitos de prueba        | `NO_APLICA` — cero cambios                                                                |

---

#### 39. Cobertura vigente de prueba

La conducta materializada por CONT-INT-003 ya está protegida por el registro vigente.

La cobertura existente incluye:

- BIA, dependencia y objetivos empresariales de continuidad;
- incidente, autoridad, declaración, activación, comunicación, recuperación y cierre;
- contingencia y operación mínima;
- respaldo, restauración y recuperación;
- idempotencia, retry, resultado desconocido, deduplicación y reconciliación;
- trazabilidad de triggers, webhooks, jobs y notificaciones;
- contrato tecnológico transversal con ISP, proveedores, licenciamiento y telemetría;
- ciclo de información y evidencia con terceros;
- analítica y fuentes externas sin autoridad de escritura;
- continuidad transversal con proveedores, red, energía, dispositivos, aplicaciones y bases;
- perfiles de retry para eventos críticos y proveedores limitados por cuota;
- circuit breaker y bulkheads;
- control de concurrencia y prevención de retry storms;
- revalidación de identidad, permiso, finalidad, contexto y versión antes de efectos sensibles.

CONT-INT-003 distribuye y especializa esas reglas entre las ocho familias sin crear una conducta verificable nueva que requiera otra identidad de prueba.

---

#### 40. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación: la tarea materializa el contrato documental de ocho familias que ya están cubiertas por requisitos vigentes de continuidad, integraciones externas, tecnología, información, analítica, idempotencia, resiliencia y reconciliación. No introduce un nuevo estado empresarial, permiso, transporte, proveedor, efecto, algoritmo de failover ni comportamiento ejecutable adicional.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 41. Criterios de aceptación

- [x] se materializan exactamente ocho familias de ocho esperadas;
- [x] Supabase conserva condición de sustrato técnico y no adquiere propiedad empresarial;
- [x] compartir infraestructura no autoriza escritura cruzada;
- [x] backup, réplica, sincronización y restore permanecen separados de recuperación empresarial;
- [x] no se inventa failover de Supabase;
- [x] nube queda definida sin inventar proveedor, región o zona;
- [x] status cloud no equivale a recovery empresarial;
- [x] energía se correlaciona por capacidad/sede y no por inferencia global;
- [x] no se inventan UPS, generador, autonomía ni sede alterna;
- [x] restablecimiento eléctrico exige revalidación técnica y empresarial;
- [x] ISP conserva reachability separada de health y resultado empresarial;
- [x] no se inventa segundo ISP ni balanceo;
- [x] failover ISP exige alternativa identificada, configurada, autorizada y probada;
- [x] pagos separa estado externo de hecho interno;
- [x] el adaptador Wompi actual se registra como evidencia de código, no como validación operativa;
- [x] resultado de pago desconocido no autoriza doble cobro;
- [x] mensajería separa preparado, enviado, entregado, leído, comprendido y ejecutado;
- [x] registro push actual se trata como activo parcial y no como servicio completo;
- [x] fallback multicanal requiere canales aprobados;
- [x] transporte conserva status externo separado de hecho canónico;
- [x] no se inventa proveedor de transporte ni API;
- [x] proveedor crítico exige relación material BIA;
- [x] contrato, gasto o integración no bastan para declarar criticidad;
- [x] proveedor sustituto exige capacidad, aprobación y evidencia;
- [x] SLA externo no reemplaza objetivos BIA;
- [x] señal externa puede iniciar evaluación pero no activar continuidad automáticamente;
- [x] proveedor disponible no cierra continuidad;
- [x] se conserva autenticación separada de autorización empresarial;
- [x] secretos permanecen fuera de tickets, eventos y mensajes ordinarios;
- [x] se hereda idempotencia y deduplicación por integración;
- [x] se heredan rate limits, backoff, jitter y `Retry-After` cuando aplique;
- [x] timeout se distingue de éxito y fallo confirmados;
- [x] circuit breaker no pierde ni confirma trabajo;
- [x] restablecimiento evita drenaje ciego del backlog;
- [x] failover solo puede ejecutarse con alternativa materializada;
- [x] contingencia sin alternativa usa únicamente estrategias aprobadas;
- [x] evidencia conserva fuente, tiempo, resultado y correlación;
- [x] evidencia externa no se reescribe para concordar con VENTO;
- [x] se conserva clasificación, finalidad, minimización y retención;
- [x] las ocho familias tienen estado contractual `ESPECIFICADO`;
- [x] los bindings no demostrados quedan `PENDIENTE_DE_EVIDENCIA` con propietario y salida;
- [x] la tarea crea cero cambios físicos;
- [x] la tarea crea cero requisitos de prueba;
- [x] la tarea modifica cero requisitos de prueba;
- [x] no se actualiza 04A;
- [x] no se modifica la ruta prioritaria;
- [x] el alcance de implementación continúa `NO INICIADA`;
- [x] replay y reincorporación permanecen fuera del alcance actual;
- [x] `CONT-INT-004` permanece únicamente reservada.

---

#### 42. Handoff hacia CONT-INT-004

CONT-INT-003 entrega al contrato posterior, por referencia y sin ejecutarlo:

- dependencia;
- proveedor;
- servicio/proceso;
- operación externa;
- identidad externa e interna;
- estado observado;
- intentos;
- idempotencia cuando aplique;
- resultado conocido o desconocido;
- evidencia;
- trabajo pendiente;
- contingencia aplicada;
- proveedor/canal utilizado;
- cambios de ruta o alternativa autorizada;
- necesidad de reconciliación;
- estado del incidente.

`CONT-INT-004` conserva la responsabilidad de definir de forma completa captura, replay, idempotencia de reincorporación, deduplicación, conflictos, conciliación y retorno al servicio normal.

---

#### 43. Resultado de la tarea

CONT-INT-003 deja cerrado el contrato documental de continuidad con las ocho familias externas e infraestructurales requeridas.

El resultado permite que VENTO relacione una afectación externa con la operación empresarial sin convertir al tercero en dueño de la decisión:

```text
DEPENDENCIA EXTERNA
→ SEÑAL / RESULTADO EXTERNO
→ VALIDACIÓN DE FUENTE
→ CORRELACIÓN
→ HEALTH / DEGRADACIÓN VENTO
→ EVALUACIÓN EMPRESARIAL
→ DECISIÓN AUTORIZADA
→ CONTINGENCIA / RECUPERACIÓN
→ VALIDACIÓN
→ PENDIENTES PARA REINCORPORACIÓN
```

La tarea no selecciona nueva infraestructura ni ejecuta integración, failover, cambio, replay o recuperación productiva.

---

ÚLTIMA TAREA APROBADA

`CONT-INT-002 — Definir contratos con SHELL, VISO, ANIMA, BLOQUE Z, AA, AB, E4, E5, T, U y X`

TAREA ACTUAL APROBADA

`CONT-INT-003 — Definir contratos con Supabase, nube, energía, ISP, pagos, mensajería, transporte y proveedores críticos`

SIGUIENTE TAREA RESERVADA

`CONT-INT-004 — Definir contratos de captura, replay, idempotencia, reincorporación, conciliación y retorno al servicio normal`


### [ ] CONT-INT-004 — Definir contratos de captura, replay, idempotencia, reincorporación, conciliación y retorno al servicio normal
