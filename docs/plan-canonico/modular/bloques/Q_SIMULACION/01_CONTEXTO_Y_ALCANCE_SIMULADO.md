### MINI-BLOQUE — CONTEXTO Y ALCANCE SIMULADO

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **contexto y alcance simulado** dentro de **Q SIMULACIÓN**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `AUTH-SIM-001` a `AUTH-SIM-006` — 6 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `AUTH-SIM-001`: Definir quién puede simular
- `AUTH-SIM-002`: Definir roles simulables
- `AUTH-SIM-003`: Definir sede simulada
- `AUTH-SIM-004`: Definir área simulada
- `AUTH-SIM-005`: Definir turno simulado
- `AUTH-SIM-006`: No mezclar permisos reales y simulados
<!-- PLAN-SECTION-META:END -->

### ✅ AUTH-SIM-001 — Definir quién puede simular

**Estado:** APROBADA
**Tarea anterior:** `AUTH-DEV-006 — Asignar permisos máximos del dispositivo` — APROBADA
**Tarea siguiente:** `AUTH-SIM-002 — Definir roles simulables` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de elegibilidad del solicitante de simulación y registro materializado de actores, roles y principales que pueden o no iniciar una simulación
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Q_SIMULACION/01_CONTEXTO_Y_ALCANCE_SIMULADO.md`
**Artefactos producidos:** `SIMULATION-REQUESTER-ELIGIBILITY-CONTRACT-001` y `SIMULATION-REQUESTER-ELIGIBILITY-REGISTER-001`
**Decisiones y contratos consumidos:** `AUTH-MOD-012`, `AUTH-MOD-021`, `AUTH-CAT-010`, `AUTH-CAT-014`, `AUTH-RBAC-001`, `AUTH-RBAC-002`, `AUTH-RBAC-003`, `AUTH-RBAC-004`, matrices funcionales vigentes, `AUTH-CTX-003`, `AUTH-UI-037`, `AUTH-DEV-005` y `AUTH-DEV-006`
**Cambios en código, Supabase, migraciones, RLS, RPC, configuración, datos, permisos desplegados, sesiones o usuarios:** no autorizados

---

#### 1. Propósito

Definir de forma exacta quién puede solicitar una simulación de contexto en Vento OS, sin confundir:

- el actor humano que solicita la simulación;
- el rol base real del solicitante;
- el rol o contexto hipotético que se evaluará;
- el sujeto o recurso sobre el que se simula;
- el dispositivo o principal técnico desde el que se accede;
- la aplicación que presenta la superficie;
- el resultado explicativo de la simulación;
- la autoridad empresarial real del solicitante.

```text
SIMULADOR HUMANO AUTORIZADO
≠
ACTOR O ROL SIMULADO
≠
PRINCIPAL TÉCNICO
≠
DISPOSITIVO COMPARTIDO
≠
AUTORIDAD PARA EJECUTAR LA ACCIÓN
```

La simulación constituye una evaluación hipotética y no operativa. La capacidad de solicitarla deberá resolverse desde el contexto real del actor humano y nunca desde el contexto que pretende simular.

---

#### 2. Resultado material

Se aprueban:

1. `SIMULATION-REQUESTER-ELIGIBILITY-CONTRACT-001`, que define identidad del solicitante, permiso exacto, carril, sesión, alcance, denegaciones, reautenticación, anidamiento, auditoría y comportamiento fail closed;
2. `SIMULATION-REQUESTER-ELIGIBILITY-REGISTER-001`, que materializa decisiones para las asignaciones de rol actualmente documentadas y para las clases de principal que podrían intentar iniciar una simulación.

Cobertura materializada:

| Resultado                                                                | Cantidad |
| ------------------------------------------------------------------------ | -------: |
| Roles base con decisión explícita según matrices vigentes                |        8 |
| Roles con asignación base del permiso de simulación                      |        2 |
| Roles sin asignación base del permiso                                    |        6 |
| Clases adicionales de actor o principal evaluadas                        |        7 |
| Decisiones totales del registro de elegibilidad                          |       15 |
| Códigos de permiso exactos obligatorios para entrar a la superficie      |        2 |
| Roles, principales o dispositivos habilitados por jerarquía o inferencia |        0 |
| Contextos simulados que pueden autorizar su propia simulación            |        0 |

Las dos asignaciones base no constituyen autorización automática. Expresan únicamente que la matriz de rol puede aportar el permiso al actor; la solicitud todavía deberá satisfacer el contrato completo.

---

#### 3. Base normativa heredada

La tarea conserva las decisiones aprobadas en `AUTH-MOD-012`:

- una simulación evalúa un contexto hipotético;
- no modifica la sesión real;
- no cambia roles, asignaciones, turnos, check-ins ni permisos;
- no ejecuta acciones empresariales;
- no crea autoridad temporal;
- no puede iniciarse por el solo hecho de tener jerarquía;
- no puede ampliar el alcance real del solicitante;
- deberá distinguir permiso para simular roles base, roles operativos y recursos sensibles;
- los casos de alto impacto podrán exigir reautenticación fuerte;
- toda solicitud y resultado deberán quedar auditados.

Por precedencia documental, `AUTH-MOD-021` actualiza el universo de roles base aplicable a esta tarea: el catálogo canónico vigente contiene ocho roles base e incorpora `trabajador_operativo` como octavo rol. `logistica` y `talento_humano` no forman parte de ese catálogo canónico. `trabajador_operativo` conserva exactamente sus cinco concesiones base aprobadas y no recibe `viso.authorization.context_simulations.view`, por lo que permanece en `DEFAULT_DENY` para iniciar simulaciones.

También conserva:

- el permiso canónico exacto `viso.authorization.context_simulations.view`;
- su modalidad `BASE_ONLY`;
- la separación entre `OWN` y `THIRD_PARTY_EXPLICIT`;
- la exigencia independiente de `viso.access`;
- la precedencia de denegaciones;
- la prohibición de simulación anidada definida por `AUTH-UI-037`;
- la separación entre actor humano y dispositivo compartido de `AUTH-DEV-001` a `AUTH-DEV-006`.

---

#### 4. Identidades separadas

El contrato reconoce:

| Identidad                     | Función                                                 | Puede iniciar una simulación interactiva |
| ----------------------------- | ------------------------------------------------------- | ---------------------------------------: |
| `simulator_actor_id`          | Actor humano real que solicita la evaluación            |  Sí, solo si cumple el contrato completo |
| `simulator_user_id`           | Identidad autenticada vinculada al actor humano         |                           No por sí sola |
| `simulator_employee_id`       | Vínculo laboral real y vigente                          |                           No por sí solo |
| `simulator_base_role`         | Rol base real que puede aportar permisos                |                No por nombre o jerarquía |
| `simulated_subject_reference` | Sujeto hipotético o explícito evaluado                  |                                       No |
| `simulated_role`              | Rol que se evaluará hipotéticamente                     |                                       No |
| `technical_principal_id`      | Principal técnico de dispositivo o servicio             |                                       No |
| `shared_device_id`            | Dispositivo compartido que limita superficie y permisos |                                       No |
| `simulation_request_id`       | Identidad inmutable de la solicitud                     |                                       No |
| `simulation_result_id`        | Identidad del resultado explicativo                     |                                       No |

El actor simulado no podrá autorizar, elevar ni reautenticar al solicitante real.

---

#### 5. Contrato conceptual

```ts
type SimulationRequesterEligibilityInput = {
  simulator_actor_id: string;
  simulator_user_id: string;
  simulator_employee_id: string;
  real_session_id: string;
  real_base_role: string;
  requested_simulation_kind:
    | "OWN_CONTEXT"
    | "THIRD_PARTY_EXPLICIT"
    | "ROLE_SCENARIO"
    | "TERRITORIAL_SCENARIO"
    | "PERMISSION_SCENARIO"
    | "RESOURCE_SCENARIO";
  target_reference: string | null;
  target_permission_key: string | null;
  requested_site_ids: string[];
  requested_area_ids: string[];
  justification: string;
  strong_reauth_evidence_id: string | null;
};
```

```ts
type SimulationRequesterEligibilityResult = {
  eligible: boolean;
  simulator_actor_id: string;
  real_session_id: string;
  effective_permission_source:
    | "ROLE_MATRIX"
    | "INDIVIDUAL_GRANT"
    | "NONE";
  effective_scope_mode:
    | "OWN"
    | "THIRD_PARTY_EXPLICIT"
    | "DENIED";
  strong_reauth_required: boolean;
  reason_codes: string[];
  policy_version: string;
  evaluated_at: string;
};
```

Estas formas son contractuales. La arquitectura física podrá normalizarlas sin perder actor, sesión real, fuente del permiso, alcance, denegaciones, reautenticación, justificación, versión y razones estructuradas.

---

#### 6. Fórmula de elegibilidad

Una solicitud interactiva solo podrá iniciarse cuando se cumpla simultáneamente:

```text
ACTOR HUMANO EFECTIVO
∩
SESIÓN PERSONAL REAL VÁLIDA
∩
viso.access EFECTIVO
∩
viso.authorization.context_simulations.view EFECTIVO
∩
CARRIL BASE REAL VÁLIDO
∩
ALCANCE SOLICITADO ⊆ ALCANCE REAL AUTORIZADO
∩
JUSTIFICACIÓN VÁLIDA
∩
REAUTENTICACIÓN FUERTE CUANDO APLIQUE
∩
AUSENCIA DE DENEGACIONES
∩
CONTEXTO REAL NO SIMULADO
=
SOLICITANTE ELEGIBLE
```

La ausencia de cualquiera de los componentes produce `DENY`.

Reglas:

1. el rol no sustituye el permiso efectivo;
2. la aplicación visible no sustituye `viso.access`;
3. el permiso de consulta no sustituye el alcance sobre el objetivo;
4. una asignación individual no sustituye sesión, contexto, justificación ni reautenticación;
5. la simulación solicitada no puede aportar requisitos que falten en el contexto real;
6. el cliente no declara que el actor es elegible;
7. la evaluación se realiza en servidor;
8. un error, ambigüedad o fuente múltiple incompatible produce denegación.

---

#### 7. Permisos exactos del solicitante

El solicitante deberá conservar como mínimo:

```text
viso.access
viso.authorization.context_simulations.view
```

`viso.authorization.context_simulations.view` habilita la solicitud y consulta de resultados explicativos. No concede:

- administración del catálogo;
- modificación de roles;
- asignación de permisos;
- creación de excepciones;
- acceso irrestricto a sujetos de terceros;
- lectura de datos sensibles del recurso;
- ejecución de la acción simulada;
- acceso a VISO cuando falta `viso.access`.

Una clave más amplia, un alias legacy, una pantalla visible o un rol de navegación no sustituyen el permiso exacto.

---

#### 8. Decisión actual por rol base

Las matrices vigentes materializan:

| Rol base                  | Estado matricial de `viso.authorization.context_simulations.view` | Decisión de elegibilidad base | Regla                                                                                                                   |
| ------------------------- | ----------------------------------------------------------------- | ----------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `propietario`             | `ASSIGN`                                                          | `BASE_CANDIDATE`              | Puede aportar el permiso desde la matriz; todavía exige sesión personal, alcance real, justificación y demás controles. |
| `gerente_general`         | `ASSIGN`                                                          | `BASE_CANDIDATE`              | Puede aportar el permiso desde la matriz; no recibe alcance organizacional ilimitado por nombre de rol.                 |
| `gerente`                 | `NOT_ASSIGN`                                                      | `DEFAULT_DENY`                | La jerarquía gerencial no crea el permiso.                                                                              |
| `supervisor`              | `NOT_ASSIGN`                                                      | `DEFAULT_DENY`                | Supervisar operación no autoriza simulaciones.                                                                          |
| `auxiliar_administrativa` | `NOT_ASSIGN`                                                      | `DEFAULT_DENY`                | Funciones administrativas no implican acceso al simulador.                                                              |
| `contador`                | `NOT_ASSIGN`                                                      | `DEFAULT_DENY`                | Acceso financiero no implica acceso al simulador.                                                                       |
| `marketing`               | `NOT_ASSIGN`                                                      | `DEFAULT_DENY`                | Acceso a contenidos o campañas no implica acceso al simulador.                                                          |
| `trabajador_operativo`    | `NOT_ASSIGN`                                                      | `DEFAULT_DENY`                | Su matriz mínima no contiene el permiso de simulación; no obtiene acceso por ser fuerza laboral operativa.              |

`BASE_CANDIDATE` no significa `ALLOW`. El permiso deberá estar activo en el catálogo y ser efectivo para la persona y la sesión reales.

---

#### 9. Asignaciones individuales y excepciones

Una persona cuyo rol tenga `NOT_ASSIGN` solo podrá convertirse en candidata si existe un `INDIVIDUAL_GRANT` canónico, explícito, vigente y auditable para la clave exacta.

El grant deberá:

- identificar actor y permiso exactos;
- declarar alcance `OWN` o `THIRD_PARTY_EXPLICIT`;
- conservar vigencia, fuente, aprobador y motivo;
- no ampliar el alcance territorial, organizacional o de recurso del actor;
- no contradecir una denegación estructural, transversal, individual o de carril;
- no derivarse de la jerarquía, título, aplicación, pantalla o dispositivo;
- iniciar denegado cuando esté vencido, suspendido, ambiguo o sin evidencia.

```text
INDIVIDUAL_GRANT
+
DENY APLICABLE
=
DENY
```

Esta tarea no crea grants individuales ni identifica personas concretas que deban recibirlos.

---

#### 10. Roles operativos

Un rol operativo efectivo, turno, check-in, puesto o estación no habilita simulación.

```text
ROL OPERATIVO ACTIVO
≠
PERMISO PARA SIMULAR
```

Reglas:

- ningún rol operativo inicia simulación por su función física;
- un actor que además posea un rol base elegible deberá salir del contexto operativo y ser evaluado desde su sesión personal y carril base real;
- el permiso no se hereda del área, dispositivo, turno ni proceso;
- una simulación no podrá iniciarse para compensar ausencia de turno, check-in o cobertura reales;
- el rol operativo que se pretenda evaluar será objeto de `AUTH-SIM-002`, no fuente de autoridad para iniciar la simulación.

---

#### 11. Sesión personal obligatoria

La simulación interactiva deberá iniciarse desde una sesión personal vinculada inequívocamente a un actor humano.

La sesión deberá estar:

- autenticada;
- vigente;
- no revocada;
- no expirada;
- vinculada a un usuario y empleado compatibles;
- libre de conflicto de identidad;
- en carril base real;
- fuera de cualquier contexto simulado previo.

No se aceptarán como solicitante:

- una cuenta compartida;
- una sesión anónima;
- un principal técnico;
- una sesión de servicio;
- una identidad de dispositivo;
- una sesión heredada del trabajador anterior;
- una sesión que no pueda reconstruir su `AccessContext` real.

---

#### 12. Dispositivos compartidos y principales técnicos

Los dispositivos compartidos y sus principales técnicos no pueden ser simuladores.

Aunque un techo documental de `management_terminal` incluya `viso.authorization.context_simulations.view` como clave `STRONG`, esa membresía solo constituye un límite máximo del dispositivo y no crea un actor humano elegible.

Decisión actual:

```text
INICIO INTERACTIVO DESDE DISPOSITIVO COMPARTIDO
=
DENY
```

Para cualquier soporte futuro en un dispositivo administrado se requeriría un contrato explícito posterior que conserve, como mínimo:

- identificación personal inequívoca;
- sesión humana separada del principal técnico;
- reautenticación fuerte personal;
- limpieza entre actores;
- ausencia de autoridad heredada del dispositivo;
- auditoría completa.

Esta tarea no habilita ese soporte futuro.

---

#### 13. Alcance real del solicitante

La simulación no puede ampliar la autoridad real del solicitante para inspeccionar o definir el escenario.

```text
SIMULATION_REQUEST_SCOPE
⊆
SIMULATOR_REAL_AUTHORIZED_SCOPE
```

La comprobación deberá considerar de forma independiente:

- sujeto propio o tercero explícito;
- organización o empresa;
- sede;
- área;
- permiso objetivo;
- acción;
- recurso;
- sensibilidad;
- tiempo simulado;
- aplicación y dispositivo simulados cuando correspondan.

Reglas:

1. `OWN` no se convierte en terceros;
2. `THIRD_PARTY_EXPLICIT` exige cobertura concreta sobre el sujeto u objetivo;
3. multisede no significa organización completa;
4. área desconocida no significa todas las áreas;
5. recurso sin territorio resoluble falla cerrado;
6. un permiso global no convierte todos los datos del recurso en visibles;
7. el resultado podrá ocultar detalles que el solicitante no esté autorizado a conocer.

`AUTH-SIM-002` a `AUTH-SIM-005` definirán los objetivos simulables. Ninguna de esas tareas podrá ampliar el techo real definido aquí.

---

#### 14. Simulación propia y de terceros

##### 14.1 `OWN_CONTEXT`

Permite evaluar escenarios dentro del alcance real del propio actor, siempre que conserve el permiso de simulación.

No permite:

- atribuirse roles no simulables;
- evaluar recursos fuera de su cobertura;
- convertir una carencia real en autoridad;
- ejecutar la acción resultante.

##### 14.2 `THIRD_PARTY_EXPLICIT`

Exige simultáneamente:

- permiso efectivo de simulación;
- cobertura explícita sobre el sujeto o escenario;
- justificación estructurada;
- reautenticación fuerte cuando el objetivo sea sensible o privilegiado;
- minimización del resultado;
- auditoría del tercero consultado.

No existe un modo implícito equivalente a `ALL_EMPLOYEES`, `ALL_ROLES` o `ORGANIZATION_WIDE`.

---

#### 15. Reautenticación fuerte

La elegibilidad deberá exigir reautenticación fuerte personal antes de ejecutar la evaluación cuando, como mínimo:

- el sujeto sea un tercero;
- se simule un rol administrativo o privilegiado;
- el permiso objetivo sea sensible;
- el recurso contenga información financiera, personal, laboral, médica, disciplinaria, de seguridad o autenticación;
- el resultado pueda revelar ampliamente controles internos o denegaciones;
- una política posterior clasifique el escenario como de alto impacto.

La evidencia deberá estar vinculada a:

```text
actor + sesión real + solicitud + objetivo + permiso + recurso + ventana temporal
```

No satisfacen esta exigencia:

- PIN ligero de un dispositivo compartido;
- reautenticación de otro actor;
- evidencia de otra aplicación, acción o recurso;
- token reutilizado fuera de su ventana;
- contexto simulado;
- confirmación visual sin proveedor verificable.

---

#### 16. Prohibición de simulación anidada

Una simulación no podrá iniciar, modificar, inspeccionar privilegiadamente ni cerrar otra simulación utilizando autoridad simulada.

```text
current_context.mode = simulated
→ DENY simulation_request
```

Para realizar una nueva solicitud se deberá:

1. salir completamente del contexto simulado;
2. reconstruir el `AccessContext` real;
3. revalidar identidad, sesión, permisos, alcance y denegaciones;
4. obtener nueva reautenticación cuando corresponda;
5. crear una solicitud independiente.

La referencia a una simulación anterior podrá utilizarse como evidencia o comparación, nunca como fuente de autoridad.

---

#### 17. Justificación obligatoria

Toda solicitud deberá conservar una justificación estructurada y no vacía.

La justificación deberá indicar al menos:

- propósito de la evaluación;
- caso o decisión que se quiere verificar;
- referencia del proceso, incidente, cambio, soporte o auditoría cuando exista;
- razón para evaluar un tercero o recurso sensible cuando aplique.

No son justificaciones suficientes:

- texto vacío;
- “prueba” sin contexto;
- curiosidad;
- nombre de un rol;
- identificador del empleado sin propósito;
- valor generado automáticamente por la interfaz.

La justificación no concede alcance ni sustituye autorización.

---

#### 18. Matriz de clases de actor y principal

| Clase evaluada                                                                   | Decisión                        | Condición o bloqueo                                                                                                                |
| -------------------------------------------------------------------------------- | ------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| Humano con permiso efectivo por matriz o `INDIVIDUAL_GRANT`                      | `CONDITIONAL_ALLOW`             | Requiere contrato completo, grant vigente cuando aplique, alcance real y ausencia de denegaciones.                                 |
| Humano sin permiso efectivo                                                      | `DENY`                          | Rol, jerarquía, pantalla o responsabilidad no sustituyen el permiso.                                                               |
| Actor únicamente operativo                                                       | `DENY_FROM_OPERATIONAL_CONTEXT` | Debe existir sesión base personal independiente y permiso efectivo.                                                                |
| Principal técnico, dispositivo, service role o integración                       | `DENY_INTERACTIVE_SIMULATION`   | No es actor humano empresarial; cualquier harness automatizado deberá usar contratos de QA separados y datos controlados.          |
| Usuario anónimo, cuenta compartida, invitado incompleto o identidad no resuelta  | `DENY`                          | Identidad y contexto insuficientes.                                                                                                |
| Actor con sesión revocada, expirada, conflictiva o no reconstruible              | `DENY`                          | La sesión real no puede producir elegibilidad.                                                                                     |
| Actor o solicitud con simulación activa, denegación aplicable o alcance excedido | `DENY_FAIL_CLOSED`              | Debe regresar al contexto real, resolver el conflicto y satisfacer alcance y controles antes de crear una solicitud independiente. |

Las siete clases complementan las ocho decisiones de rol y cubren intentos que no deben modelarse como roles humanos.

---

#### 19. Precedencia de decisión

La elegibilidad aplicará como mínimo:

```text
IDENTITY_OR_SESSION_INVALID
>
SIMULATION_NESTED_DENY
>
STRUCTURAL_DENY
>
ACTOR_WIDE_DENY
>
SIMULATION_PERMISSION_DENY
>
TARGET_SCOPE_DENY
>
STRONG_REAUTH_MISSING
>
CONDITIONAL_ALLOW COMPLETO
>
DEFAULT_DENY
```

Una asignación de rol o individual no neutraliza una denegación.

---

#### 20. Razones mínimas de denegación

| Razón conceptual                       | Significado                                                                    |
| -------------------------------------- | ------------------------------------------------------------------------------ |
| `simulation_actor_not_human`           | El solicitante resuelto es técnico, de servicio o dispositivo.                 |
| `simulation_personal_session_required` | No existe una sesión personal válida.                                          |
| `simulation_real_context_required`     | La solicitud se originó desde un contexto simulado o no reconstruible.         |
| `simulation_viso_access_missing`       | Falta `viso.access`.                                                           |
| `simulation_permission_missing`        | Falta `viso.authorization.context_simulations.view`.                           |
| `simulation_permission_inactive`       | La clave o asignación no está vigente.                                         |
| `simulation_explicit_deny`             | Existe una denegación aplicable.                                               |
| `simulation_scope_mismatch`            | El objetivo excede el alcance real del solicitante.                            |
| `simulation_third_party_scope_missing` | No existe cobertura explícita sobre el tercero.                                |
| `simulation_strong_reauth_required`    | Falta reautenticación fuerte válida.                                           |
| `simulation_justification_required`    | La justificación está ausente o es insuficiente.                               |
| `simulation_nested_not_allowed`        | Se intentó iniciar una simulación desde otra simulación.                       |
| `simulation_context_ambiguous`         | Identidad, sesión, territorio u objetivo no se resuelven de forma única.       |
| `simulation_target_not_defined`        | La tarea posterior correspondiente todavía no habilita el objetivo solicitado. |

Las razones devueltas al cliente deberán respetar minimización. Un solicitante no autorizado no recibirá detalles que revelen controles o datos sensibles.

---

#### 21. Auditoría mínima

Todo intento, permitido o denegado, deberá conservar:

- `simulation_request_id`;
- actor, usuario, empleado y sesión reales;
- fuente del permiso efectivo;
- rol base real;
- sujeto propio o tercero explícito;
- tipo de simulación solicitado;
- rol, sede, área, permiso, acción y recurso objetivos cuando estén presentes;
- justificación;
- alcance solicitado y alcance resuelto;
- denegaciones evaluadas;
- reautenticación exigida y evidencia utilizada;
- resultado de elegibilidad;
- razones estructuradas;
- versiones de catálogo, matrices, políticas y contexto;
- fecha, duración, origen y correlación.

La auditoría no almacenará:

- secretos;
- tokens;
- códigos de reautenticación;
- documentos médicos completos;
- datos personales no necesarios;
- payloads sensibles sin minimización;
- contenido empresarial completo del recurso cuando baste una referencia.

---

#### 22. Comportamiento fail closed

```text
sin actor humano inequívoco
→ DENY
```

```text
sin sesión personal real válida
→ DENY
```

```text
sin viso.access o permiso exacto de simulación
→ DENY
```

```text
objetivo fuera del alcance real
→ DENY
```

```text
tercero o recurso sensible sin STRONG válido
→ DENY
```

```text
solicitud desde contexto simulado
→ DENY
```

```text
ambigüedad, error o política no resoluble
→ DENY
```

Queda prohibido usar como fallback:

- rango jerárquico;
- nombre del cargo;
- rol operativo;
- propietario de la empresa inferido desde datos;
- primera asignación activa;
- permisos del actor simulado;
- lista enviada por el cliente;
- acceso visual a la pantalla;
- `navigation_role`;
- dispositivo compartido;
- service role;
- permiso del usuario anterior;
- contexto cacheado anterior a una revocación.

---

#### 23. Reconciliación con el estado documental actual

| Elemento actual                               | Decisión contractual                                                                         | Estado                                    |
| --------------------------------------------- | -------------------------------------------------------------------------------------------- | ----------------------------------------- |
| `viso.authorization.context_simulations.view` | Permiso exacto obligatorio para solicitar y consultar simulaciones.                          | `ESPECIFICADO`                            |
| `viso.access`                                 | Prerrequisito independiente de entrada a la aplicación.                                      | `ESPECIFICADO`                            |
| Matriz de `propietario`                       | Aporta asignación base candidata; no produce autorización automática.                        | `ESPECIFICADO`                            |
| Matriz de `gerente_general`                   | Aporta asignación base candidata; no produce alcance global implícito.                       | `ESPECIFICADO`                            |
| Matrices de otros seis roles revisados        | Conservan `NOT_ASSIGN`; no reciben acceso por jerarquía.                                     | `ESPECIFICADO`                            |
| Grants individuales y denegaciones            | Podrán modificar la efectividad para una persona cuando sean canónicos, vigentes y acotados. | `ESPECIFICADO`; materialización posterior |
| Superficie o servicio de simulación           | No fue implementado por esta tarea.                                                          | `PENDIENTE_DE_IMPLEMENTACION`             |
| Inicio desde dispositivo compartido           | Permanece denegado en el contrato actual.                                                    | `BLOQUEADO`                               |
| Pruebas automatizadas de simulación           | Requerirán un harness controlado que no se presente como actor humano.                       | `PENDIENTE_DE_IMPLEMENTACION`             |

Destinos existentes:

- `AUTH-SIM-002` a `AUTH-SIM-005`: objetivos simulables;
- `AUTH-SIM-006`: marca inequívoca del contexto simulado;
- `AUTH-SIM-007` a `AUTH-SIM-014`: ciclo, separación, expiración, aviso, auditoría y controles posteriores;
- `AUTH-DB-013`: persistencia física;
- `AUTH-SRV-015`: servicio autoritativo;
- `AUTH-QA-019`: certificación integral de simulación.

---

#### 24. Límites de esta tarea

AUTH-SIM-001 no define:

- qué roles pueden ser objetivo de simulación;
- qué sedes pueden simularse;
- qué áreas pueden simularse;
- qué permisos o acciones pueden simularse;
- qué recursos concretos pueden inspeccionarse;
- el formato completo del contexto simulado;
- la duración o expiración de la simulación;
- el aviso visual persistente;
- la interfaz final;
- tablas, constraints, RLS, RPC o servicios;
- migraciones o backfills;
- grants individuales reales;
- usuarios concretos;
- proveedor físico de reautenticación;
- ejecución de simulaciones;
- pruebas operativas.

Estas responsabilidades permanecen en sus tareas canónicas. Ninguna podrá contradecir la elegibilidad real del solicitante definida aquí.

---

#### 25. Handoff exacto a AUTH-SIM-002

`AUTH-SIM-002` deberá definir los roles que pueden ser objetivo de simulación, conservando:

1. que el solicitante se evalúa siempre desde su actor y sesión reales;
2. que el rol objetivo nunca concede autoridad al solicitante;
3. que un rol no es simulable por aparecer en el catálogo;
4. que el alcance del rol objetivo no puede exceder el alcance real autorizado para inspección;
5. que roles sensibles o privilegiados podrán exigir cobertura y reautenticación adicionales;
6. que roles operativos deberán conservar prerrequisitos hipotéticos completos;
7. que un rol retirado, ambiguo o legacy falla cerrado;
8. que la simulación no modifica asignaciones ni permisos;
9. que no existe simulación anidada;
10. que el resultado sigue siendo explicativo y no ejecutable.

Esta tarea no anticipa la lista de roles objetivo.

---

#### 26. Invariantes

1. Solo un actor humano real puede solicitar una simulación interactiva.
2. El solicitante se resuelve desde una sesión personal real.
3. El contexto simulado nunca autoriza al simulador.
4. `viso.access` y el permiso exacto de simulación son independientes y obligatorios.
5. El nombre del rol no concede acceso.
6. La jerarquía no concede acceso.
7. `propietario` y `gerente_general` son candidatos por matriz, no autorizaciones automáticas.
8. Los demás roles revisados permanecen sin asignación base.
9. Un grant individual debe ser exacto, vigente, acotado y auditable.
10. Las denegaciones prevalecen sobre matriz y grant.
11. El alcance simulado no excede el alcance real autorizado.
12. `OWN` no se convierte en terceros.
13. `THIRD_PARTY_EXPLICIT` exige cobertura concreta.
14. Un rol operativo no habilita simulación.
15. Un dispositivo compartido no habilita simulación.
16. Un principal técnico no es simulador.
17. Un service role no se presenta como simulador humano.
18. No existe simulación anidada.
19. El PIN ligero no satisface reautenticación fuerte.
20. La justificación es obligatoria y no concede autoridad.
21. La evaluación ocurre en servidor.
22. La lista del cliente no es autoritativa.
23. Todo error o ambigüedad falla cerrado.
24. El resultado no modifica contexto, sesión, permisos ni datos.
25. Todo intento queda auditado con minimización de datos.
26. La tarea siguiente permanece limitada a definir roles objetivo.

---

#### Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se incorporan `TREQ-AUTH-069` a `TREQ-AUTH-078` en el Registro Canónico de Requisitos de Prueba.

| ID              | Regla protegida                                                                                                                                                                                                                                                                                                                                            | Tipo                                                       | Prioridad | Momento de implementación                         | Destino                                                        |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------- | --------- | ------------------------------------------------- | -------------------------------------------------------------- |
| `TREQ-AUTH-069` | Una solicitud de simulación solo podrá iniciarse cuando exista actor humano efectivo, sesión personal real válida, `viso.access`, `viso.authorization.context_simulations.view`, carril base, alcance suficiente, justificación, reautenticación requerida y ausencia de denegaciones; un componente ausente o ambiguo producirá `DENY`.                   | seguridad + autorización + integración + E2E + regresión   | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SRV-015`; `AUTH-QA-019`; paquete E5 de simulación        |
| `TREQ-AUTH-070` | Las matrices vigentes deberán conservar como candidatos base únicamente a `propietario` y `gerente_general`; `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing` y `trabajador_operativo` permanecerán sin asignación base. Ningún rol o rango jerárquico podrá sustituir el permiso efectivo.                                     | contractual + autorización + estática + regresión          | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-001`; `AUTH-DB-013`; `AUTH-QA-019`                   |
| `TREQ-AUTH-071` | Un `INDIVIDUAL_GRANT` para simular deberá usar la clave exacta, ser vigente, acotado, auditable y compatible con el alcance real del actor; no podrá derivarse del cargo ni prevalecer sobre denegaciones estructurales, transversales, individuales o de carril.                                                                                          | seguridad + autorización + base de datos + regresión       | crítica   | Paquete que materialice el contrato de simulación | `AUTH-DB-013`; `AUTH-SRV-015`; `AUTH-QA-019`                   |
| `TREQ-AUTH-072` | Una simulación interactiva no podrá ser solicitada por principal técnico, dispositivo compartido, service role, integración, sesión anónima o cuenta compartida. El techo del dispositivo, una pantalla visible o un permiso técnico nunca crearán un simulador humano.                                                                                    | seguridad + identidad + integración + E2E + regresión      | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SRV-015`; `AUTH-DEV-008` a `AUTH-DEV-010`; `AUTH-QA-019` |
| `TREQ-AUTH-073` | El alcance solicitado deberá ser subconjunto del alcance real autorizado del simulador sobre sujeto, organización, sede, área, permiso, acción y recurso. `OWN` no habilitará terceros, `THIRD_PARTY_EXPLICIT` exigirá cobertura concreta y valores desconocidos o `null` no significarán alcance global.                                                  | seguridad + autorización + integración + E2E + regresión   | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-002` a `AUTH-SIM-005`; `AUTH-SRV-015`; `AUTH-QA-019` |
| `TREQ-AUTH-074` | La simulación de terceros, roles privilegiados, permisos sensibles o recursos financieros, personales, laborales, médicos, disciplinarios, de seguridad o autenticación deberá exigir reautenticación fuerte personal vinculada al actor, sesión, solicitud y objetivo; PIN ligero o evidencia transferida no serán válidos.                               | seguridad + autenticación + autorización + E2E + regresión | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-008`; `AUTH-SRV-015`; `AUTH-QA-019`                  |
| `TREQ-AUTH-075` | Una sesión revocada, expirada, conflictiva, no personal o incapaz de reconstruir el contexto real deberá denegar la solicitud. Una simulación activa no podrá iniciar, modificar, inspeccionar privilegiadamente ni cerrar otra simulación; deberá salirse al contexto real y reautorizarse.                                                               | seguridad + sesión + contexto + E2E + regresión            | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-006` a `AUTH-SIM-010`; `AUTH-SRV-015`; `AUTH-QA-019` |
| `TREQ-AUTH-076` | Autorizar una solicitud de simulación no podrá modificar sesión, actor, rol, asignaciones, turno, check-in, permisos ni contexto real; tampoco podrá crear tokens, ejecutar la acción simulada, producir mutaciones empresariales ni convertir el resultado en autoridad operativa.                                                                        | seguridad + autorización + integración + E2E + regresión   | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-006` a `AUTH-SIM-014`; `AUTH-SRV-015`; `AUTH-QA-019` |
| `TREQ-AUTH-077` | Todo intento de simulación, permitido o denegado, deberá registrar actor y sesión reales, fuente del permiso, objetivo, alcance, justificación, denegaciones, reautenticación, versiones y razones estructuradas, minimizando secretos y datos sensibles.                                                                                                  | seguridad + auditoría + integración + regresión            | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-013`; `AUTH-DB-013`; `AUTH-SRV-015`; `AUTH-QA-019`   |
| `TREQ-AUTH-078` | El registro de elegibilidad deberá cubrir exactamente ocho decisiones de rol y siete clases adicionales de actor o principal, con dos roles `BASE_CANDIDATE`, seis roles `DEFAULT_DENY`, cero habilitaciones por jerarquía, cero principales técnicos elegibles y una decisión fail closed para cada condición incompleta, conflictiva o fuera de alcance. | contractual + estática + regresión                         | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-001`; `AUTH-QA-019`                                  |

---

#### 27. Criterios de aceptación

- [x] Se distinguió al solicitante real del actor, rol y contexto simulados.
- [x] Se definió la fórmula completa de elegibilidad.
- [x] Se exigieron `viso.access` y el permiso exacto de simulación.
- [x] Se materializaron ocho decisiones actuales de rol.
- [x] Solo `propietario` y `gerente_general` quedaron como candidatos base por matriz.
- [x] Seis roles permanecieron en `DEFAULT_DENY`.
- [x] Se prohibió inferir permiso por jerarquía, cargo, pantalla, rol operativo o navegación.
- [x] Se definieron grants individuales exactos sin crear ninguno.
- [x] Se definió sesión humana personal obligatoria.
- [x] Se prohibió iniciar simulaciones interactivas desde dispositivos compartidos y principales técnicos.
- [x] Se definió alcance solicitado como subconjunto del alcance real.
- [x] Se separaron `OWN` y `THIRD_PARTY_EXPLICIT`.
- [x] Se definió reautenticación fuerte para escenarios sensibles.
- [x] Se prohibió simulación anidada.
- [x] Se exigió justificación estructurada.
- [x] Se materializaron siete clases adicionales de actor o principal.
- [x] Se definieron precedencia y razones mínimas de denegación.
- [x] Se definió auditoría con minimización de datos.
- [x] Se definió comportamiento fail closed.
- [x] Se preservó que la simulación no ejecuta acciones ni modifica autoridad real.
- [x] Se generaron `TREQ-AUTH-069` a `TREQ-AUTH-078`.
- [x] No se modificó código, Supabase, migraciones, configuración, datos, permisos, sesiones ni usuarios.
- [x] `AUTH-SIM-002` permanece únicamente reservada.

---

#### 28. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DEV-006 — Asignar permisos máximos del dispositivo`

**TAREA ACTUAL APROBADA**
`AUTH-SIM-001 — Definir quién puede simular`

**SIGUIENTE TAREA RESERVADA**
`AUTH-SIM-002 — Definir roles simulables`


### ✅ AUTH-SIM-002 — Definir roles simulables

**Estado:** APROBADA
**Tarea anterior:** `AUTH-SIM-001 — Definir quién puede simular` — APROBADA
**Tarea siguiente:** `AUTH-SIM-003 — Definir sede simulada` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de roles objetivo simulables y registro materializado de identidades de rol base, operativo, legacy, deprecado, ausente y ambiguo
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Q_SIMULACION/01_CONTEXTO_Y_ALCANCE_SIMULADO.md`
**Artefactos producidos:** `SIMULATABLE-ROLE-CONTRACT-001`, `SIMULATABLE-ROLE-REGISTER-001` y `SIMULATABLE-ROLE-PHYSICAL-RECONCILIATION-001`
**Decisiones y contratos consumidos:** `AUTH-MOD-002` a `AUTH-MOD-006`, `AUTH-MOD-012`, `AUTH-MOD-021`, matrices canónicas vigentes, `AUTH-SIM-001`, catálogo documental de roles base, catálogo documental de roles operativos y estado físico observado de `public.roles` y `public.operational_roles`
**Cambios en código, Supabase, migraciones, RLS, RPC, configuración, datos, catálogos desplegados, permisos, turnos, sesiones o usuarios:** no autorizados

---

#### 1. Propósito

Definir exactamente qué identidades de rol pueden utilizarse como objetivo de una simulación de contexto de autorización, sin confundir:

- el actor humano real que solicita la simulación;
- el rol base real del solicitante;
- el rol objetivo hipotético;
- un rol base con un rol operativo;
- un código canónico con un código legacy;
- una decisión documental con la disponibilidad física actual del catálogo;
- la selección de un rol con una autorización ejecutable;
- la vista previa de una matriz con el acceso a datos reales.

```text
ROL OBJETIVO SIMULABLE
≠
ROL REAL DEL SOLICITANTE
≠
ACTOR EFECTIVO
≠
PERMISO PARA EJECUTAR
≠
ACCESO A DATOS DEL ROL SIMULADO
```

Una identidad de rol podrá ser simulable para diagnóstico aunque no esté asignada a una persona concreta. Esa condición no crea un empleado, no modifica catálogos y no concede autoridad al solicitante.

---

#### 2. Resultado material

Se aprueban:

1. `SIMULATABLE-ROLE-CONTRACT-001`, que define identidad tipada, elegibilidad canónica, disponibilidad física, sensibilidad, completitud contextual, precedencia, razones estructuradas y comportamiento fail closed;
2. `SIMULATABLE-ROLE-REGISTER-001`, que materializa una decisión para cada rol base y operativo canónico;
3. `SIMULATABLE-ROLE-PHYSICAL-RECONCILIATION-001`, que reconcilia las identidades físicas observadas con el modelo canónico sin convertir automáticamente códigos legacy.

Cobertura materializada:

| Resultado                                                           | Cantidad |
| ------------------------------------------------------------------- | -------: |
| Roles base canónicos con decisión explícita                         |        8 |
| Roles operativos canónicos con decisión explícita                   |       12 |
| Objetivos canónicos simulables                                      |       20 |
| Objetivos canónicos disponibles en el catálogo físico observado     |       18 |
| Objetivos canónicos pendientes de materialización física            |        2 |
| Identidades físicas legacy o deprecadas expresamente bloqueadas     |       10 |
| Identidades tipadas únicas cubiertas por la unión canónica y física |       30 |
| Filas físicas observadas en los dos catálogos                       |       28 |
| Códigos bare distintos en esas filas físicas                        |       27 |
| Colisiones bare entre catálogos                                     |        1 |
| Conversiones automáticas, aliases implícitos o fallbacks aprobados  |        0 |
| Roles capaces de autorizar al solicitante por ser seleccionados     |        0 |

La diferencia entre 28 filas físicas y 27 códigos bare se debe a `bodeguero`, presente como rol base legacy y como rol operativo canónico. La identidad tipada elimina la ambigüedad.

---

#### 3. Base normativa heredada

La tarea conserva íntegramente que:

- la simulación evalúa un contexto hipotético y devuelve `would_allow`, `would_deny` o `indeterminate`;
- el actor real y su sesión permanecen inalterados;
- la simulación no es impersonación;
- el rol objetivo no puede autorizar al solicitante;
- el solicitante se evalúa mediante `AUTH-SIM-001` antes de considerar el objetivo;
- el alcance simulado no puede exceder el alcance real autorizado del solicitante;
- no existe bypass por jerarquía, nombre de rol, pantalla, aplicación o dispositivo;
- un rol base y un rol operativo son catálogos, carriles y fuentes independientes;
- un rol operativo requiere contexto hipotético operativo completo para evaluar una acción concreta;
- un código retirado, deprecado, inactivo, desconocido o ambiguo falla cerrado;
- los datos reales siguen protegidos exclusivamente por los permisos reales del solicitante;
- una simulación activa no puede iniciar otra simulación;
- toda selección y resultado quedan auditados.

Por precedencia documental, `AUTH-MOD-021` actualiza el catálogo base aplicable a esta tarea: existen ocho roles base canónicos y `trabajador_operativo` reemplaza la cobertura documental obsoleta que trataba `logistica` y `talento_humano` como roles base canónicos. La inspección física continúa mostrando seis de esos ocho roles; `supervisor` y `trabajador_operativo` permanecen bloqueados hasta su materialización versionada. Los nueve oficios base legacy observados continúan siendo exclusiones físicas y no cambian de clasificación.

---

#### 4. Identidad tipada obligatoria

Toda referencia de rol objetivo deberá incluir simultáneamente:

```ts
type SimulatedRoleReference = {
  role_kind: "BASE" | "OPERATIONAL";
  role_code: string;
  catalog_version: string;
  matrix_version: string;
};
```

Reglas:

1. `role_kind` es obligatorio;
2. `role_code` es obligatorio y deberá coincidir exactamente con el catálogo correspondiente;
3. `catalog_version` y `matrix_version` deberán ser resolubles y coherentes con la evaluación;
4. una cadena bare como `bodeguero` no es una referencia completa;
5. el cliente no puede declarar que una referencia es canónica, activa o simulable;
6. el servidor resolverá catálogo, estado, versión, matriz y decisión;
7. un alias visual, etiqueta humana o `navigation_role` no sustituye el código tipado;
8. una referencia incompleta o contradictoria produce bloqueo fail closed.

```text
BASE/bodeguero
≠
OPERATIONAL/bodeguero
```

Aunque compartan texto, representan identidades diferentes y reciben decisiones diferentes.

---

#### 5. Contrato conceptual

```ts
type SimulatableRoleInput = {
  simulation_request_id: string;
  simulator_actor_id: string;
  real_session_id: string;
  target_role: SimulatedRoleReference;
  scenario_kind:
    | "ROLE_MATRIX_PREVIEW"
    | "NAVIGATION_PREVIEW"
    | "PERMISSION_DECISION"
    | "EMPLOYEE_CONTEXT_PREVIEW"
    | "CUSTOM_CONTEXT_PREVIEW";
  target_subject_reference: string | null;
  target_permission_key: string | null;
  target_resource_reference: string | null;
  strong_reauth_evidence_id: string | null;
};
```

```ts
type SimulatableRoleResult = {
  accepted: boolean;
  target_role: SimulatedRoleReference;
  canonical_status:
    | "SIMULABLE"
    | "NOT_SIMULABLE";
  runtime_status:
    | "AVAILABLE"
    | "BLOCKED_NOT_MATERIALIZED"
    | "BLOCKED_INACTIVE"
    | "BLOCKED_LEGACY"
    | "BLOCKED_DEPRECATED"
    | "BLOCKED_AMBIGUOUS"
    | "BLOCKED_UNKNOWN"
    | "BLOCKED_VERSION_MISMATCH";
  sensitivity_class:
    | "PRIVILEGED"
    | "ADMINISTRATIVE"
    | "FUNCTIONAL_SENSITIVE"
    | "FUNCTIONAL"
    | "OPERATIONAL_COORDINATION"
    | "OPERATIONAL";
  context_completeness:
    | "ROLE_ONLY"
    | "COMPLETE_FOR_REQUEST"
    | "INCOMPLETE_FOR_REQUEST";
  simulated_decision:
    | "would_allow"
    | "would_deny"
    | "indeterminate"
    | null;
  strong_reauth_required: boolean;
  reason_codes: string[];
  evaluated_catalog_version: string;
  evaluated_matrix_version: string;
  evaluated_at: string;
};
```

Estas formas son contractuales. La implementación física podrá normalizarlas, pero no podrá perder tipo de rol, código, versiones, estado canónico, estado físico, sensibilidad, completitud, razones ni separación respecto del actor real.

---

#### 6. Fórmula de aceptación del rol objetivo

```text
SOLICITANTE ELEGIBLE SEGÚN AUTH-SIM-001
∩
REFERENCIA DE ROL TIPADA Y COMPLETA
∩
IDENTIDAD CANÓNICA SIMULABLE
∩
CATÁLOGO Y MATRIZ VERSIONADOS RESOLUBLES
∩
ROL FÍSICO ACTIVO CUANDO LA EVALUACIÓN SE EJECUTE
∩
ALCANCE REAL SUFICIENTE DEL SOLICITANTE
∩
REAUTENTICACIÓN FUERTE CUANDO APLIQUE
∩
AUSENCIA DE DENEGACIONES
=
ROL OBJETIVO ACEPTADO
```

Aceptar el rol objetivo solo permite construir una evaluación hipotética. No significa que una acción concreta pueda evaluarse todavía ni que su resultado sea positivo.

---

#### 7. Estados diferenciados

| Estado                                 | Significado                                                                                | Resultado operativo de esta tarea                                      |
| -------------------------------------- | ------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------- |
| `SIMULABLE + AVAILABLE`                | Identidad canónica, exacta, activa y materializada.                                        | Puede seleccionarse bajo el contrato completo.                         |
| `SIMULABLE + BLOCKED_NOT_MATERIALIZED` | Identidad canónica aprobada, pero todavía ausente del catálogo físico observado.           | No puede seleccionarse en runtime hasta su materialización versionada. |
| `NOT_SIMULABLE + BLOCKED_LEGACY`       | Código físico heredado que no pertenece al catálogo canónico de su carril.                 | Denegar; no convertir ni sugerir autoridad equivalente.                |
| `NOT_SIMULABLE + BLOCKED_DEPRECATED`   | Identidad retirada o expresamente deprecada.                                               | Denegar.                                                               |
| `NOT_SIMULABLE + BLOCKED_INACTIVE`     | La identidad existe, pero está inactiva.                                                   | Denegar.                                                               |
| `NOT_SIMULABLE + BLOCKED_AMBIGUOUS`    | Falta tipo, existen fuentes incompatibles o la referencia no resuelve una identidad única. | Denegar.                                                               |
| `NOT_SIMULABLE + BLOCKED_UNKNOWN`      | El código no existe en la versión autoritativa.                                            | Denegar.                                                               |
| `BLOCKED_VERSION_MISMATCH`             | Catálogo, matriz o referencia pertenecen a versiones incompatibles.                        | Denegar y exigir reconstrucción.                                       |

`SIMULABLE` expresa una decisión documental de objetivo permitido. `AVAILABLE` expresa que el runtime puede resolver actualmente la identidad exacta. Ninguno de los dos estados concede autoridad real.

---

#### 8. Roles base canónicos simulables

Los ocho roles base actuales reciben decisión explícita:

| Identidad tipada               | Clase                  | Decisión canónica | Estado físico observado    | Reautenticación del objetivo | Regla                                                                                                                          |
| ------------------------------ | ---------------------- | ----------------- | -------------------------- | ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `BASE/propietario`             | `PRIVILEGED`           | `SIMULABLE`       | `AVAILABLE`                | `REQUIRED`                   | Vista de gobierno y capacidades reservadas; nunca produce wildcard ni bypass.                                                  |
| `BASE/gerente_general`         | `PRIVILEGED`           | `SIMULABLE`       | `AVAILABLE`                | `REQUIRED`                   | Vista ejecutiva global según matriz exacta; no hereda capacidades de propietario.                                              |
| `BASE/gerente`                 | `ADMINISTRATIVE`       | `SIMULABLE`       | `AVAILABLE`                | `REQUIRED`                   | Se evalúa con cobertura administrativa explícita; multisede no equivale a global.                                              |
| `BASE/supervisor`              | `ADMINISTRATIVE`       | `SIMULABLE`       | `BLOCKED_NOT_MATERIALIZED` | `REQUIRED`                   | Es objetivo canónico, pero la inspección física no encontró su fila; runtime deniega hasta materialización.                    |
| `BASE/auxiliar_administrativa` | `FUNCTIONAL`           | `SIMULABLE`       | `AVAILABLE`                | `CONDITIONAL`                | Solo matriz funcional exacta; no se convierte en autoridad gerencial ni operativa.                                             |
| `BASE/contador`                | `FUNCTIONAL_SENSITIVE` | `SIMULABLE`       | `AVAILABLE`                | `CONDITIONAL_SENSITIVE`      | La vista podrá enmascarar datos y exigir STRONG según permiso, recurso o tercero.                                              |
| `BASE/marketing`               | `FUNCTIONAL`           | `SIMULABLE`       | `AVAILABLE`                | `CONDITIONAL`                | Se limita a capacidades asignadas; no crea administración global.                                                              |
| `BASE/trabajador_operativo`    | `FUNCTIONAL`           | `SIMULABLE`       | `BLOCKED_NOT_MATERIALIZED` | `CONDITIONAL`                | Rol base mínimo no privilegiado; conserva cinco grants base y cero autoridad operativa; runtime deniega hasta materialización. |

`REQUIRED` significa reautenticación fuerte obligatoria para seleccionar o inspeccionar ese objetivo administrativo o privilegiado. `CONDITIONAL` y `CONDITIONAL_SENSITIVE` se resuelven conforme al permiso, recurso, tercero, sensibilidad y detalle solicitado; ante duda se exige STRONG o se minimiza el resultado.

Los dos roles pendientes de materialización no se sustituyen por otro código ni se crean mediante esta tarea.

---

#### 9. Roles operativos canónicos simulables

Los doce roles operativos canónicos reciben decisión `SIMULABLE + AVAILABLE` en la inspección física actual:

| Identidad tipada                         | Familia                | Decisión    | Contexto hipotético mínimo para acción concreta                                           | Reautenticación del objetivo |
| ---------------------------------------- | ---------------------- | ----------- | ----------------------------------------------------------------------------------------- | ---------------------------- |
| `OPERATIONAL/cajero_satelite`            | Satélite               | `SIMULABLE` | turno, sede, área, permiso, recurso y check-in cuando aplique                             | `CONDITIONAL`                |
| `OPERATIONAL/barista_satelite`           | Satélite               | `SIMULABLE` | turno, sede, área, permiso, recurso y check-in cuando aplique                             | `CONDITIONAL`                |
| `OPERATIONAL/cocinero_satelite`          | Satélite               | `SIMULABLE` | turno, sede, área, permiso, recurso y check-in cuando aplique                             | `CONDITIONAL`                |
| `OPERATIONAL/servicio_salon`             | Satélite               | `SIMULABLE` | turno, sede, área, permiso, recurso y check-in cuando aplique                             | `CONDITIONAL`                |
| `OPERATIONAL/mostrador_satelite`         | Satélite               | `SIMULABLE` | turno, sede, área, permiso, recurso y check-in cuando aplique                             | `CONDITIONAL`                |
| `OPERATIONAL/operador_integral_satelite` | Satélite               | `SIMULABLE` | turno, sede, área compatible, permiso, recurso y check-in cuando aplique                  | `CONDITIONAL`                |
| `OPERATIONAL/produccion_cocina`          | Producción             | `SIMULABLE` | turno, sede, área de producción, permiso, recurso y check-in cuando aplique               | `CONDITIONAL`                |
| `OPERATIONAL/produccion_panaderia`       | Producción             | `SIMULABLE` | turno, sede, área de producción, permiso, recurso y check-in cuando aplique               | `CONDITIONAL`                |
| `OPERATIONAL/produccion_reposteria`      | Producción             | `SIMULABLE` | turno, sede, área de producción, permiso, recurso y check-in cuando aplique               | `CONDITIONAL`                |
| `OPERATIONAL/bodeguero`                  | Logística              | `SIMULABLE` | turno, sede, área logística, permiso, recurso y check-in cuando aplique                   | `CONDITIONAL`                |
| `OPERATIONAL/conductor_logistica`        | Logística              | `SIMULABLE` | turno, sede base, itinerario o custodia, permiso, recurso y check-in exigido por política | `CONDITIONAL`                |
| `OPERATIONAL/gerencia_operativa`         | Coordinación operativa | `SIMULABLE` | turno, sede, área compatible, permiso, recurso y check-in cuando aplique                  | `REQUIRED`                   |

Esta tabla no decide las sedes, áreas ni estados de turno concretos. `AUTH-SIM-003`, `AUTH-SIM-004` y `AUTH-SIM-005` deberán materializar esos parámetros sin alterar la lista de roles.

---

#### 10. Vista de rol frente a evaluación de acción

Se distinguen dos niveles:

##### 10.1 Vista de matriz o navegación

Un rol objetivo aceptado podrá utilizarse para:

- mostrar su clasificación;
- mostrar aplicaciones y permisos asignados según la versión seleccionada;
- mostrar restricciones estructurales;
- explicar prerrequisitos faltantes;
- construir navegación hipotética no ejecutable;
- comparar matrices con datos sintéticos, enmascarados o ya autorizados.

Este nivel puede conservar `context_completeness = ROLE_ONLY`.

##### 10.2 Evaluación de permiso o acción concreta

Para emitir `would_allow` o `would_deny` sobre una acción concreta deberán resolverse todos los componentes exigidos por el permiso y el carril.

Cuando falten sede, área, turno, check-in, aplicación, permiso, recurso, alcance o versión requeridos:

```text
simulated_decision = indeterminate
reason = simulation_role_context_incomplete
```

Queda prohibido completar ausencias con:

- sede global;
- primera sede activa;
- área general inventada;
- turno activo supuesto;
- check-in supuesto;
- todos los permisos del rol;
- permisos del solicitante;
- contexto del último empleado consultado.

---

#### 11. Identidades físicas legacy bloqueadas

La inspección física actual encontró nueve roles base heredados que representan oficios operativos. Ninguno es un objetivo base canónico:

| Identidad tipada | Decisión         | Regla                                                             |
| ---------------- | ---------------- | ----------------------------------------------------------------- |
| `BASE/barista`   | `BLOCKED_LEGACY` | No es alias de `OPERATIONAL/barista_satelite`.                    |
| `BASE/bodeguero` | `BLOCKED_LEGACY` | Colisiona por texto con el rol operativo; el tipo es obligatorio. |
| `BASE/cajero`    | `BLOCKED_LEGACY` | No es alias de `OPERATIONAL/cajero_satelite`.                     |
| `BASE/cocinero`  | `BLOCKED_LEGACY` | No se infiere entre cocina satélite y producción central.         |
| `BASE/conductor` | `BLOCKED_LEGACY` | No es alias de `OPERATIONAL/conductor_logistica`.                 |
| `BASE/mesero`    | `BLOCKED_LEGACY` | No es alias de `OPERATIONAL/servicio_salon`.                      |
| `BASE/panadero`  | `BLOCKED_LEGACY` | No es alias de `OPERATIONAL/produccion_panaderia`.                |
| `BASE/pastelero` | `BLOCKED_LEGACY` | No es alias de `OPERATIONAL/produccion_reposteria`.               |
| `BASE/repostero` | `BLOCKED_LEGACY` | No es alias de `OPERATIONAL/produccion_reposteria`.               |

La interfaz podrá explicar que el código es legacy, pero no seleccionar silenciosamente un reemplazo. La migración de empleados, matrices o datos históricos pertenece a las tareas físicas correspondientes.

---

#### 12. Rol operativo deprecado bloqueado

```text
OPERATIONAL/propietario_admin
=
BLOCKED_DEPRECATED
```

Decisiones:

- no es un rol canónico;
- no puede seleccionarse como objetivo;
- no puede recibir permisos simulados;
- no puede utilizarse como bypass de propietario;
- no se convierte en `BASE/propietario`;
- su presencia física activa no revoca la decisión documental de deprecación;
- cualquier turno, permiso o dato futuro que lo referencie deberá producir diagnóstico y denegación.

Esta tarea no elimina físicamente el registro.

---

#### 13. Roles ausentes, inactivos, desconocidos y futuros

##### 13.1 Canónico pero no materializado

Un rol canónico ausente del catálogo físico recibe:

```text
canonical_status = SIMULABLE
runtime_status = BLOCKED_NOT_MATERIALIZED
```

No podrá evaluarse como disponible hasta que una migración versionada materialice código, estado, matriz y relaciones requeridas.

##### 13.2 Inactivo

```text
is_active = false
→ BLOCKED_INACTIVE
```

El historial podrá consultarse con permiso real suficiente, pero no se construirá una simulación vigente que presente el rol como activo.

##### 13.3 Desconocido o futuro

Un código no incluido en este registro y no aprobado en una versión posterior recibe `BLOCKED_UNKNOWN`. La creación de un rol nuevo no lo hace simulable automáticamente.

##### 13.4 Eliminado o retirado

Un rol retirado conserva trazabilidad histórica, pero una simulación actual falla cerrado. Una simulación histórica futura requerirá contrato explícito de versión temporal; esta tarea no la habilita.

---

#### 14. Prohibición de aliases y conversiones implícitas

No se permiten transformaciones como:

```text
barista → barista_satelite
cajero → cajero_satelite
bodeguero base → bodeguero operativo
propietario_admin → propietario
```

Tampoco se permiten:

- normalización por semejanza textual;
- singularización o pluralización;
- selección del primer resultado;
- preferencia por el catálogo base;
- preferencia por el catálogo operativo;
- derivación desde el área;
- derivación desde la aplicación;
- derivación desde `navigation_role`;
- conversión desde un rol histórico del empleado.

La selección deberá utilizar una identidad canónica exacta y tipada.

---

#### 15. Roles híbridos y combinaciones

No existe un catálogo de roles híbridos simulables.

Un escenario que combine rol base y rol operativo deberá contener dos referencias independientes:

```ts
type SimulatedHybridRoleContext = {
  base_role: SimulatedRoleReference;
  operational_role: SimulatedRoleReference | null;
};
```

Reglas:

1. `base_role.role_kind` deberá ser `BASE`;
2. `operational_role.role_kind` deberá ser `OPERATIONAL`;
3. los permisos de ambos carriles no se unen indiscriminadamente;
4. cada acción declara su modalidad administrativa u operativa;
5. el rol base no satisface prerrequisitos operativos;
6. el rol operativo no concede permisos administrativos;
7. la combinación no crea un tercer código;
8. una combinación inválida devuelve `indeterminate` o `would_deny`, nunca autoridad real.

---

#### 16. Simulación por empleado

Cuando el sujeto sea un empleado existente:

- el actor real seguirá siendo el solicitante;
- se resolverá el rol base actual del empleado;
- se resolverán sus asignaciones y excepciones únicamente para la vista autorizada;
- un rol base legacy no será normalizado automáticamente;
- un empleado inactivo podrá diagnosticarse solo con alcance real suficiente;
- la evaluación deberá mostrar `employee_inactive` cuando corresponda;
- un rol ausente, inactivo, legacy o ambiguo bloqueará la construcción vigente;
- el resultado no permitirá actuar como la persona.

La simulación por empleado no amplía la lista de roles simulables definida aquí.

---

#### 17. Sensibilidad y reautenticación

La selección del objetivo aplicará como mínimo:

| Condición del objetivo                                                                                         | Tratamiento                                                                                 |
| -------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `BASE/propietario` o `BASE/gerente_general`                                                                    | STRONG obligatorio.                                                                         |
| `BASE/gerente` o `BASE/supervisor`                                                                             | STRONG obligatorio por rol administrativo.                                                  |
| `OPERATIONAL/gerencia_operativa`                                                                               | STRONG obligatorio por capacidad de coordinación y corrección operativa.                    |
| Rol funcional con permiso o recurso financiero, personal, laboral, disciplinario, de seguridad o autenticación | STRONG obligatorio para ese escenario.                                                      |
| Cualquier rol sobre sujeto tercero o detalle sensible                                                          | Aplicar `AUTH-SIM-001`; STRONG y cobertura explícita cuando corresponda.                    |
| Vista con datos sintéticos y sin información sensible                                                          | Podrá mantenerse en tratamiento condicional si el solicitante cumple el resto del contrato. |

La reautenticación protege el acceso a la herramienta y al objetivo. No convierte el rol en autoridad real ni habilita datos fuera del alcance del solicitante.

---

#### 18. Alcance real del solicitante

Un rol puede ser canónicamente simulable y, aun así, estar fuera del alcance concreto del solicitante.

```text
ROLE_TARGET_SCOPE
⊆
SIMULATOR_REAL_AUTHORIZED_SCOPE
```

La comprobación deberá considerar:

- clase del rol;
- matriz y permisos que el solicitante puede inspeccionar;
- organización;
- sedes y áreas cuando correspondan;
- sujeto propio o tercero;
- aplicación;
- permiso y recurso;
- sensibilidad;
- versiones del catálogo y de la matriz.

No existe un permiso implícito para consultar todas las matrices, todos los empleados o todos los datos porque el rol objetivo sea simulable.

---

#### 19. Datos y minimización

El rol objetivo solo controla la representación hipotética. Los datos reales continúan controlados por el actor real.

Se permiten:

- datos sintéticos;
- estructuras vacías;
- metadatos no sensibles;
- datos enmascarados;
- datos reales que el solicitante ya pueda consultar.

Se prohíbe revelar por autoridad simulada:

- documentos laborales;
- datos personales;
- información financiera;
- costos o márgenes;
- credenciales;
- secretos;
- inventario restringido;
- información de otras sedes;
- detalles de denegaciones que faciliten evasión de controles.

---

#### 20. Precedencia de resolución

```text
REQUESTER_INELIGIBLE
>
SIMULATION_NESTED_DENY
>
ROLE_REFERENCE_INCOMPLETE
>
ROLE_VERSION_MISMATCH
>
ROLE_UNKNOWN
>
ROLE_DEPRECATED
>
ROLE_LEGACY
>
ROLE_INACTIVE
>
ROLE_NOT_MATERIALIZED
>
ROLE_SCOPE_DENY
>
STRONG_REAUTH_MISSING
>
ROLE_TARGET_ACCEPTED
>
CONTEXT_INCOMPLETE_FOR_ACTION
>
SIMULATED_DECISION
>
DEFAULT_DENY
```

Aceptar el objetivo precede a evaluar su contexto. Un objetivo bloqueado nunca pasa a la evaluación de permisos.

---

#### 21. Razones mínimas

| Razón conceptual                           | Significado                                                           |
| ------------------------------------------ | --------------------------------------------------------------------- |
| `simulation_role_kind_required`            | Falta `BASE` u `OPERATIONAL`.                                         |
| `simulation_role_code_required`            | Falta el código exacto.                                               |
| `simulation_role_catalog_version_required` | No existe versión autoritativa resoluble.                             |
| `simulation_role_matrix_version_required`  | La matriz no está versionada o no coincide.                           |
| `simulation_role_unknown`                  | El código no pertenece al catálogo canónico aprobado.                 |
| `simulation_role_inactive`                 | El rol está inactivo.                                                 |
| `simulation_role_not_materialized`         | Es canónico, pero falta en el catálogo físico.                        |
| `simulation_role_legacy_not_allowed`       | Es un código heredado no canónico para ese carril.                    |
| `simulation_role_deprecated`               | Es un código retirado o deprecado.                                    |
| `simulation_role_ambiguous`                | La referencia admite más de una identidad o fuente incompatible.      |
| `simulation_role_scope_mismatch`           | El objetivo excede el alcance real del solicitante.                   |
| `simulation_role_strong_reauth_required`   | Falta evidencia STRONG válida.                                        |
| `simulation_role_context_incomplete`       | Faltan componentes para evaluar una acción concreta.                  |
| `simulation_role_target_accepted`          | El objetivo puede utilizarse para construir la evaluación hipotética. |
| `simulation_role_target_not_allowed`       | Una regla anterior bloqueó el objetivo.                               |

Las razones dirigidas al cliente deberán aplicar minimización y no revelar catálogos o controles sensibles a un solicitante no autorizado.

---

#### 22. Auditoría mínima

Toda selección, cambio o bloqueo de rol objetivo deberá registrar:

- `simulation_request_id`;
- actor y sesión reales;
- referencia tipada del rol;
- código y clase resueltos;
- versión de catálogo;
- versión de matriz;
- estado canónico;
- estado físico;
- fuente de la decisión;
- escenario solicitado;
- sujeto o tercero cuando exista;
- permiso y recurso cuando existan;
- sensibilidad;
- reautenticación exigida y evidencia utilizada;
- alcance real evaluado;
- completitud contextual;
- resultado y razones estructuradas;
- fecha y correlación.

La auditoría no almacenará secretos, tokens, códigos de reautenticación, payloads sensibles completos ni datos no necesarios del sujeto simulado.

---

#### 23. Reconciliación con el estado físico observado

La inspección de solo lectura del estado desplegado produjo:

| Catálogo físico                   | Filas activas observadas | Decisión de esta tarea                                                             |
| --------------------------------- | -----------------------: | ---------------------------------------------------------------------------------- |
| `public.roles`                    |                       15 | 6 objetivos base canónicos disponibles y 9 identidades base legacy bloqueadas.     |
| `public.operational_roles`        |                       13 | 12 objetivos operativos canónicos disponibles y `propietario_admin` bloqueado.     |
| Unión de filas tipadas            |                       28 | Todas reciben decisión explícita.                                                  |
| Códigos bare distintos            |                       27 | `bodeguero` aparece en ambos catálogos y exige `role_kind`.                        |
| Roles base canónicos no presentes |                        2 | `supervisor` y `trabajador_operativo` permanecen bloqueados hasta materialización. |

Esta evidencia no modifica el estado desplegado ni afirma que el contrato ya esté implementado. Solo evita que la definición documental ignore brechas físicas actuales.

---

#### 24. Registro materializado consolidado

El registro cubre 30 identidades tipadas únicas:

| Grupo                                  | Cantidad | Distribución                                 |
| -------------------------------------- | -------: | -------------------------------------------- |
| Roles base canónicos                   |        8 | 6 `AVAILABLE`; 2 `BLOCKED_NOT_MATERIALIZED`. |
| Roles operativos canónicos             |       12 | 12 `AVAILABLE`.                              |
| Roles base físicos legacy no canónicos |        9 | 9 `BLOCKED_LEGACY`.                          |
| Rol operativo físico deprecado         |        1 | 1 `BLOCKED_DEPRECATED`.                      |
| Total unión canónica y física          |       30 | 20 simulables canónicos; 10 no simulables.   |

Comprobaciones normativas del registro:

- no faltan identidades canónicas;
- no faltan filas físicas observadas;
- no hay identidades tipadas duplicadas;
- la colisión bare queda resuelta por tipo;
- ningún código legacy es simulable;
- ningún rol deprecado es simulable;
- ningún rol pendiente se presenta como disponible;
- ningún rol objetivo autoriza al solicitante.

---

#### 25. Comportamiento fail closed

```text
referencia sin role_kind
→ DENY
```

```text
rol desconocido, legacy, deprecado o inactivo
→ DENY
```

```text
rol canónico ausente del catálogo físico
→ DENY RUNTIME
```

```text
versión de catálogo o matriz incompatible
→ DENY
```

```text
objetivo fuera del alcance real
→ DENY
```

```text
rol sensible sin STRONG exigido
→ DENY
```

```text
rol válido pero contexto insuficiente para una acción
→ indeterminate
```

```text
error, ambigüedad o fuente múltiple incompatible
→ DENY
```

No se utilizará como fallback el rol real del solicitante, el rol del empleado seleccionado, el primer catálogo coincidente, un alias legacy, una etiqueta visual ni un código enviado por el cliente.

---

#### 26. Límites de esta tarea

AUTH-SIM-002 no define:

- la sede concreta simulada;
- el conjunto de sedes elegibles;
- el área concreta simulada;
- la compatibilidad final sede–área;
- el estado completo del turno;
- el estado completo del check-in;
- la duración de la simulación;
- el indicador visual persistente;
- la interfaz final;
- la persistencia física;
- migraciones de catálogos legacy;
- creación de `supervisor` o `trabajador_operativo` en Supabase;
- eliminación física de `propietario_admin`;
- actualización física de matrices;
- ejecución de simulaciones;
- pruebas operativas.

Estas responsabilidades permanecen en sus tareas canónicas. Ninguna podrá cambiar la lista de roles objetivo sin una modificación canónica explícita de este contrato.

---

#### 27. Handoff exacto a AUTH-SIM-003

`AUTH-SIM-003` deberá definir la sede simulada conservando:

1. las 20 identidades de rol objetivo aprobadas aquí;
2. la identidad tipada `role_kind + role_code`;
3. que una sede no convierte un rol bloqueado en simulable;
4. que la sede objetivo no puede exceder el alcance real del solicitante;
5. que un rol operativo deberá estar habilitado en la sede simulada;
6. que un rol base por sede conservará su cobertura administrativa explícita;
7. que un rol global no atraviesa automáticamente sedes aisladas;
8. que `null`, sede desconocida o sede enviada por el cliente no significan todas las sedes;
9. que la falta de sede requerida produce `indeterminate` o `would_deny`, nunca `would_allow`;
10. que ninguna selección modifica sedes, roles, turnos ni datos reales.

Esta tarea no anticipa la matriz de sedes objetivo.

---

#### 28. Invariantes

1. Todo rol objetivo tiene tipo y código exactos.
2. Rol base y rol operativo son identidades diferentes.
3. Un código bare no es autoritativo.
4. `bodeguero` exige desambiguación por catálogo.
5. Existen ocho roles base canónicos objetivo.
6. Existen doce roles operativos canónicos objetivo.
7. Los 20 objetivos canónicos son simulables conceptualmente.
8. Solo 18 están disponibles en el catálogo físico observado.
9. Dos roles base canónicos permanecen bloqueados hasta materialización.
10. Nueve roles base legacy permanecen bloqueados.
11. `propietario_admin` permanece bloqueado y deprecado.
12. Ningún alias legacy se resuelve automáticamente.
13. Un rol nuevo no es simulable hasta aprobación explícita.
14. Un rol inactivo no puede simularse como vigente.
15. Un rol desconocido falla cerrado.
16. Una versión incompatible falla cerrado.
17. El rol objetivo nunca autoriza al solicitante.
18. El rol objetivo nunca reemplaza al actor real.
19. El rol objetivo nunca concede acceso a datos reales.
20. Un rol base no reemplaza contexto operativo.
21. Un rol operativo no concede permisos administrativos.
22. No existen roles híbridos combinados.
23. Una vista de rol no equivale a una decisión de acción.
24. Contexto incompleto produce `indeterminate`, no permiso.
25. Roles administrativos y privilegiados exigen STRONG según el contrato.
26. El alcance simulado permanece subordinado al alcance real.
27. Toda selección y denegación quedan auditadas.
28. La evaluación ocurre en servidor.
29. El cliente no declara canonicidad ni disponibilidad.
30. La tarea siguiente permanece limitada a definir sede simulada.

---

#### Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se incorporan `TREQ-AUTH-079` a `TREQ-AUTH-088` en el Registro Canónico de Requisitos de Prueba.

| ID              | Regla protegida                                                                                                                                                                                                                                           | Tipo                                                           | Prioridad | Momento de implementación                                               | Destino                                                        |
| --------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------- | --------- | ----------------------------------------------------------------------- | -------------------------------------------------------------- |
| `TREQ-AUTH-079` | Toda referencia de rol objetivo deberá declarar `role_kind`, `role_code`, versión de catálogo y versión de matriz; un código bare, etiqueta visual, alias o valor enviado por cliente no podrá resolver una identidad simulable.                          | seguridad + contractual + integración + regresión              | crítica   | Paquete que materialice el contrato de simulación                       | `AUTH-DB-013`; `AUTH-SRV-015`; `AUTH-QA-019`                   |
| `TREQ-AUTH-080` | El registro base deberá cubrir exactamente ocho roles canónicos simulables: seis disponibles físicamente y dos bloqueados hasta materialización, sin sustituir los ausentes por otros códigos.                                                            | contractual + base de datos + estática + regresión             | crítica   | Paquete que materialice el contrato de simulación                       | `AUTH-SIM-002`; `AUTH-DB-013`; `AUTH-QA-019`                   |
| `TREQ-AUTH-081` | El registro operativo deberá cubrir exactamente doce roles canónicos simulables y exigir contexto hipotético completo para evaluar acciones; el rol aislado no podrá producir `would_allow`.                                                              | autorización + contexto + integración + E2E + regresión        | crítica   | Paquete que materialice el contrato de simulación                       | `AUTH-SIM-003` a `AUTH-SIM-006`; `AUTH-SRV-015`; `AUTH-QA-019` |
| `TREQ-AUTH-082` | Los nueve roles base legacy observados deberán permanecer bloqueados y no podrán convertirse automáticamente en roles operativos mediante alias, semejanza textual, área, aplicación, empleado o fallback.                                                | seguridad + migración + contractual + regresión                | crítica   | Paquete que materialice el contrato de simulación y transición de roles | `AUTH-DB-013`; tareas de transición de roles; `AUTH-QA-019`    |
| `TREQ-AUTH-083` | `OPERATIONAL/propietario_admin`, todo rol deprecado, inactivo, retirado, desconocido o futuro no aprobado deberá fallar cerrado y no podrá recibir permisos ni autoridad simulada.                                                                        | seguridad + autorización + base de datos + regresión           | crítica   | Paquete que materialice el contrato de simulación                       | `AUTH-DB-013`; `AUTH-SRV-015`; `AUTH-QA-019`                   |
| `TREQ-AUTH-084` | Las colisiones entre catálogos deberán resolverse por identidad tipada; `BASE/bodeguero` y `OPERATIONAL/bodeguero` producirán decisiones distintas y una referencia ambigua deberá denegarse.                                                             | contractual + seguridad + integración + regresión              | crítica   | Paquete que materialice el contrato de simulación                       | `AUTH-SRV-015`; contratos compartidos; `AUTH-QA-019`           |
| `TREQ-AUTH-085` | Seleccionar un rol simulable no podrá modificar actor, sesión, rol real, permisos, RLS, asignaciones ni datos, ni conceder acceso a información que el solicitante real no pueda consultar.                                                               | seguridad + autorización + RLS + integración + E2E + regresión | crítica   | Paquete que materialice el contrato de simulación                       | `AUTH-SIM-006`; `AUTH-SRV-015`; `AUTH-QA-019`                  |
| `TREQ-AUTH-086` | La vista de matriz o navegación deberá separarse de la evaluación de una acción concreta; cuando falten componentes obligatorios, el resultado será `indeterminate` con razón estructurada y nunca `would_allow`.                                         | contractual + contexto + interfaz + E2E + regresión            | crítica   | Paquete que materialice el contrato de simulación                       | `AUTH-SIM-003` a `AUTH-SIM-006`; `AUTH-SRV-015`; `AUTH-QA-019` |
| `TREQ-AUTH-087` | Los objetivos privilegiados, administrativos, de coordinación o sensibles deberán exigir cobertura real suficiente, minimización y reautenticación fuerte conforme al escenario; STRONG nunca ampliará alcance ni autoridad.                              | seguridad + autenticación + autorización + E2E + regresión     | crítica   | Paquete que materialice el contrato de simulación                       | `AUTH-SIM-008`; `AUTH-SRV-015`; `AUTH-QA-019`                  |
| `TREQ-AUTH-088` | El registro consolidado deberá cubrir exactamente 30 identidades tipadas: 20 objetivos canónicos simulables y 10 exclusiones físicas no canónicas, conciliando 18 disponibles, dos pendientes, nueve legacy y una deprecada, sin faltantes ni duplicados. | contractual + estática + base de datos + regresión             | crítica   | Paquete que materialice el contrato de simulación                       | `AUTH-SIM-002`; `AUTH-DB-013`; `AUTH-QA-019`                   |

---

#### 29. Criterios de aceptación

- [x] Se distinguió al solicitante real del rol objetivo.
- [x] Se definió una identidad tipada obligatoria.
- [x] Se exigieron versiones de catálogo y matriz.
- [x] Se materializaron ocho decisiones de roles base canónicos.
- [x] Se materializaron doce decisiones de roles operativos canónicos.
- [x] Se aprobaron 20 objetivos canónicos simulables.
- [x] Se distinguieron 18 objetivos disponibles y dos pendientes de materialización.
- [x] Se materializaron nueve exclusiones de roles base legacy.
- [x] Se bloqueó `OPERATIONAL/propietario_admin`.
- [x] Se cubrieron 30 identidades tipadas únicas.
- [x] Se prohibieron aliases y conversiones automáticas.
- [x] Se resolvió la colisión `bodeguero` mediante `role_kind`.
- [x] Se separó vista de rol de evaluación de acción.
- [x] Se definió `indeterminate` para contexto insuficiente.
- [x] Se definieron sensibilidad y reautenticación.
- [x] Se preservó el alcance real del solicitante.
- [x] Se preservó la minimización de datos.
- [x] Se definieron precedencia y razones estructuradas.
- [x] Se definió auditoría mínima.
- [x] Se reconcilió el estado físico sin modificarlo.
- [x] Se generaron `TREQ-AUTH-079` a `TREQ-AUTH-088`.
- [x] No se modificó código, Supabase, migraciones, configuración, catálogos, permisos, turnos, sesiones ni usuarios.
- [x] `AUTH-SIM-003` permanece únicamente reservada.

---

#### 30. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-SIM-001 — Definir quién puede simular`

**TAREA ACTUAL APROBADA**
`AUTH-SIM-002 — Definir roles simulables`

**SIGUIENTE TAREA RESERVADA**
`AUTH-SIM-003 — Definir sede simulada`


### ✅ AUTH-SIM-003 — Definir sede simulada

**Estado:** APROBADA
**Tarea anterior:** `AUTH-SIM-002 — Definir roles simulables` — APROBADA
**Tarea siguiente:** `AUTH-SIM-004 — Definir área simulada` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de elegibilidad territorial de la sede simulada y registro materializado de sedes ordinarias, aisladas, físicas no organizacionales y ausencia territorial legítima
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Q_SIMULACION/01_CONTEXTO_Y_ALCANCE_SIMULADO.md`
**Artefactos producidos:** `SIMULATED-SITE-ELIGIBILITY-CONTRACT-001`, `SIMULATED-SITE-REGISTER-001` y `SIMULATED-SITE-PHYSICAL-RECONCILIATION-001`
**Decisiones y contratos consumidos:** `AUTH-MOD-007`, `AUTH-MOD-012` a `AUTH-MOD-015`, `AUTH-SIM-001`, `AUTH-SIM-002`, catálogo territorial vigente y estado físico observado de `public.sites` y `public.site_operational_roles`
**Cambios en código, Supabase, migraciones, RLS, RPC, configuración, datos, sedes, áreas, asignaciones, turnos, sesiones, dispositivos o permisos:** no autorizados

---

#### 1. Propósito

Definir exactamente qué territorio puede utilizarse como sede objetivo de una simulación de contexto de autorización, sin confundir:

- sede simulada con sede real del solicitante;
- sede asignada con sede primaria;
- sede seleccionada con autorización;
- sede administrativa con sede operativa;
- sede organizacional con punto físico de check-in;
- sede exacta con tipo de sede;
- alcance global ordinario con acceso a una sede aislada;
- ausencia territorial legítima con un wildcard;
- compatibilidad rol–sede con permiso para ejecutar;
- representación hipotética con acceso a datos reales.

```text
SEDE SIMULADA EXACTA
≠
SEDE SELECCIONADA EN INTERFAZ
≠
SEDE PRIMARIA
≠
SEDE REAL DEL SIMULADOR
≠
PUNTO FÍSICO DE CHECK-IN
≠
AUTORIDAD EJECUTABLE
```

La sede simulada es un componente territorial hipotético de una evaluación explicativa. Nunca sustituye el territorio real desde el cual se autoriza al solicitante.

---

#### 2. Resultado material

Se aprueban:

1. `SIMULATED-SITE-ELIGIBILITY-CONTRACT-001`, que define identidad territorial tipada, modos de objetivo, alcance real, aislamiento, compatibilidad rol–sede, ausencia territorial, precedencia, razones y comportamiento fail closed;
2. `SIMULATED-SITE-REGISTER-001`, que materializa una decisión para cada identidad física vigente del catálogo `public.sites`;
3. `SIMULATED-SITE-PHYSICAL-RECONCILIATION-001`, que documenta las habilitaciones operativas observadas sin convertirlas en permisos ni alterar el estado desplegado.

Cobertura materializada:

| Resultado                                                                 | Cantidad |
| ------------------------------------------------------------------------- | -------: |
| Identidades físicas de sede con decisión explícita                        |        7 |
| Sedes ordinarias simulables bajo contrato completo                        |        5 |
| Sedes aisladas simulables solo mediante cobertura explícita independiente |        1 |
| Puntos físicos no admitidos como sede organizacional simulada             |        1 |
| Tipos físicos de sede observados                                          |        5 |
| Clases `site_kind` observadas                                             |        3 |
| Habilitaciones operativas activas rol–sede observadas                     |       16 |
| Roles operativos canónicos cubiertos por esas habilitaciones              |       12 |
| Modos territoriales contractuales                                         |        2 |
| Fallbacks, wildcards o inclusiones implícitas aprobados                   |        0 |
| Sedes capaces de autorizar al solicitante por ser seleccionadas           |        0 |

---

#### 3. Base normativa heredada

La tarea conserva íntegramente que:

- el solicitante debe superar `AUTH-SIM-001` desde su actor y sesión reales;
- el rol objetivo debe superar `AUTH-SIM-002` mediante identidad tipada y versión compatible;
- sede asignada, primaria, seleccionada, administrativa, operativa y del recurso son conceptos distintos;
- `public.sites` es el catálogo físico de referencia, pero cada registro debe clasificarse antes de utilizarse como territorio laboral;
- la sede del recurso y el contrato del permiso gobiernan la evaluación territorial de una acción;
- `null` no significa todas las sedes;
- múltiples sedes autorizadas no equivalen a alcance organizacional irrestricto;
- un tipo de sede no sustituye una sede exacta;
- una sede aislada no se incorpora a alcances ordinarios globales, por tipo o por rol;
- la simulación no es impersonación y no modifica la sesión real;
- el resultado solo puede ser `would_allow`, `would_deny` o `indeterminate`;
- ninguna selección simulada ejecuta acciones ni amplía la lectura de datos reales;
- toda ambigüedad o incompatibilidad falla cerrado.

---

#### 4. Identidades territoriales separadas

| Identidad                    | Función                                                                   | Autoridad                                                |
| ---------------------------- | ------------------------------------------------------------------------- | -------------------------------------------------------- |
| `simulator_real_site_scope`  | Conjunto real de sedes que el simulador puede inspeccionar                | Limita la solicitud; no se modifica                      |
| `simulated_site_id`          | Sede exacta hipotética evaluada                                           | No autoriza acciones reales                              |
| `simulated_site_code`        | Código canónico de la sede exacta                                         | Identificación, no permiso                               |
| `simulated_site_type`        | Clasificación funcional derivada de la sede                               | No es wildcard ni objetivo suficiente                    |
| `simulated_site_kind`        | Clase física derivada del registro                                        | Determina si puede actuar como territorio organizacional |
| `simulated_resource_site_id` | Sede resuelta del recurso hipotético                                      | Debe ser coherente con la sede del escenario             |
| `simulated_geofence_site_id` | Punto físico hipotético de marcación cuando una tarea posterior lo admita | No sustituye `simulated_site_id`                         |
| `real_active_site_id`        | Sede real activa del actor, cuando exista                                 | Permanece inalterada                                     |
| `real_selected_site_id`      | Preferencia real de interfaz                                              | No participa como evidencia de autorización              |

```text
simulated_site_id
≠
real_active_site_id
≠
real_selected_site_id
≠
simulated_geofence_site_id
```

---

#### 5. Modos territoriales contractuales

```ts
type SimulatedSiteTarget =
  | {
      mode: "EXACT_SITE";
      simulated_site_id: string;
      simulated_site_code: string;
      simulated_site_type: string;
      simulated_site_kind: string;
      site_catalog_version: string;
    }
  | {
      mode: "NO_SITE_NON_TERRITORIAL";
      simulated_site_id: null;
      simulated_site_code: null;
      simulated_site_type: null;
      simulated_site_kind: null;
      site_catalog_version: string;
    };
```

Reglas:

1. `EXACT_SITE` exige una identidad única y activa;
2. `NO_SITE_NON_TERRITORIAL` es una declaración positiva de ausencia territorial, no un valor desconocido;
3. `null`, cadena vacía, primer resultado o única sede visible no podrán transformarse en `EXACT_SITE`;
4. un `site_type` no constituye un tercer modo;
5. una consulta comparativa por tipo deberá expandirse en servidor a una lista finita de sedes exactas autorizadas y evaluarlas por separado;
6. cada modo conserva la versión del catálogo utilizada.

---

#### 6. Contrato conceptual

```ts
type SimulatedSiteEligibilityInput = {
  simulation_request_id: string;
  simulator_actor_id: string;
  real_session_id: string;
  simulated_role_kind: "BASE" | "OPERATIONAL";
  simulated_role_code: string;
  role_catalog_version: string;
  role_matrix_version: string;
  site_target: SimulatedSiteTarget;
  target_permission_key: string | null;
  target_action: string | null;
  target_resource_reference: string | null;
  strong_reauth_evidence_id: string | null;
};
```

```ts
type SimulatedSiteEligibilityResult = {
  accepted: boolean;
  decision:
    | "SIMULABLE_CONDITIONAL"
    | "ISOLATED_EXPLICIT_ONLY"
    | "NOT_SIMULABLE_AS_SITE"
    | "NO_SITE_ACCEPTED"
    | "DENY";
  exact_site_resolved: boolean;
  within_simulator_real_scope: boolean;
  role_site_compatible: boolean | null;
  isolated_scope_required: boolean;
  strong_reauth_required: boolean;
  simulated_decision:
    | "would_allow"
    | "would_deny"
    | "indeterminate"
    | null;
  reason_codes: string[];
  evaluated_site_catalog_version: string;
  evaluated_role_matrix_version: string;
  policy_version: string;
  evaluated_at: string;
};
```

La implementación física podrá normalizar estas formas sin perder identidad exacta, tipo, clase, versión, alcance real, aislamiento, compatibilidad, razones ni separación respecto del contexto real.

---

#### 7. Fórmula de elegibilidad territorial

```text
SOLICITANTE ELEGIBLE SEGÚN AUTH-SIM-001
∩
ROL OBJETIVO VÁLIDO SEGÚN AUTH-SIM-002
∩
MODO TERRITORIAL EXPLÍCITO
∩
SEDE EXACTA ACTIVA O AUSENCIA NO TERRITORIAL VÁLIDA
∩
SEDE SOLICITADA ⊆ ALCANCE REAL DE INSPECCIÓN
∩
COMPATIBILIDAD ROL–SEDE CUANDO EL ROL ES OPERATIVO
∩
AISLAMIENTO Y REAUTENTICACIÓN CUANDO APLIQUEN
∩
AUSENCIA DE DENEGACIONES
=
OBJETIVO TERRITORIAL ACEPTADO
```

Aceptar el objetivo territorial no produce por sí solo `would_allow`. Área, turno, check-in, permiso, acción y recurso deberán satisfacer sus contratos cuando sean obligatorios.

---

#### 8. Registro materializado de sedes físicas vigentes

| `site_code`                  | Nombre observado                             | `site_type`         | `site_kind`    | Visibilidad operativa | Decisión                 | Regla                                                                                                 |
| ---------------------------- | -------------------------------------------- | ------------------- | -------------- | --------------------- | ------------------------ | ----------------------------------------------------------------------------------------------------- |
| `CENTRO_PROD`                | Centro de Producción                         | `centro_produccion` | `operations`   | `visible`             | `SIMULABLE_CONDITIONAL`  | Sede ordinaria exacta. Exige alcance real y compatibilidad del rol objetivo.                          |
| `MOLKA_PRINCIPAL`            | Molka                                        | `satelite`          | `operations`   | `visible`             | `SIMULABLE_CONDITIONAL`  | Sede satélite exacta. No representa todas las sedes del tipo.                                         |
| `SAUDO`                      | Saudo                                        | `satelite`          | `operations`   | `visible`             | `SIMULABLE_CONDITIONAL`  | Sede satélite exacta. Exige alcance real y contexto coherente.                                        |
| `VENTO_CAFE`                 | Vento Café                                   | `satelite`          | `operations`   | `visible`             | `SIMULABLE_CONDITIONAL`  | Sede satélite exacta. No hereda autoridad por ser seleccionada.                                       |
| `VENTO_GROUP`                | Vento Group                                  | `administrativa`    | `operations`   | `visible`             | `SIMULABLE_CONDITIONAL`  | Sede administrativa exacta; una función operativa solo procede si existe habilitación explícita.      |
| `APP-REVIEW`                 | App Review                                   | `revision`          | `review`       | `hidden`              | `ISOLATED_EXPLICIT_ONLY` | Sede aislada. Requiere cobertura independiente y no pertenece al alcance ordinario global o por tipo. |
| `pickup_camioneta_principal` | Pickup Estacionamiento - Camioneta Principal | `punto_checkin`     | `vehicle_yard` | `hidden`              | `NOT_SIMULABLE_AS_SITE`  | Punto físico de check-in o patio vehicular; no es sede organizacional para `simulated_site_id`.       |

Totales del registro:

```text
5 SIMULABLE_CONDITIONAL
1 ISOLATED_EXPLICIT_ONLY
1 NOT_SIMULABLE_AS_SITE
= 7 decisiones exactas
```

La presencia física y el estado activo de un registro no bastan para clasificarlo como sede organizacional simulable.

---

#### 9. Compatibilidad materializada de roles operativos por sede

La evaluación operativa deberá utilizar habilitaciones exactas y activas. El estado observado materializa:

| Rol operativo                | Sedes exactas habilitadas observadas | Asociaciones activas |
| ---------------------------- | ------------------------------------ | -------------------: |
| `cajero_satelite`            | `VENTO_CAFE`, `SAUDO`                |                    2 |
| `barista_satelite`           | `VENTO_CAFE`, `SAUDO`                |                    2 |
| `cocinero_satelite`          | `VENTO_CAFE`, `SAUDO`                |                    2 |
| `servicio_salon`             | `VENTO_CAFE`, `SAUDO`                |                    2 |
| `mostrador_satelite`         | `VENTO_CAFE`                         |                    1 |
| `operador_integral_satelite` | `MOLKA_PRINCIPAL`                    |                    1 |
| `produccion_cocina`          | `CENTRO_PROD`                        |                    1 |
| `produccion_panaderia`       | `CENTRO_PROD`                        |                    1 |
| `produccion_reposteria`      | `CENTRO_PROD`                        |                    1 |
| `bodeguero`                  | `CENTRO_PROD`                        |                    1 |
| `conductor_logistica`        | `CENTRO_PROD`                        |                    1 |
| `gerencia_operativa`         | `VENTO_GROUP`                        |                    1 |

```text
12 roles operativos canónicos
16 asociaciones activas observadas
0 asociaciones inferidas
```

Reglas:

1. una asociación activa permite considerar compatible el par rol–sede;
2. no concede el permiso objetivo;
3. no crea área, turno ni check-in;
4. la ausencia de asociación produce `simulation_role_not_allowed_at_site`;
5. `site_type` o semejanza funcional no sustituyen una asociación exacta;
6. la sede puede reducir la elegibilidad del rol, nunca ampliarla;
7. cambios posteriores deberán evaluarse con una versión nueva del catálogo y matriz.

---

#### 10. Roles base y sede simulada

Los roles base no dependen de `site_operational_roles`, pero la sede sigue siendo relevante cuando el permiso, recurso o alcance sea territorial.

Reglas:

- `propietario` o `gerente_general` no reciben acceso a una sede por su nombre;
- `gerente` y `supervisor` solo pueden evaluarse sobre sedes compatibles con el escenario y el alcance autorizado del simulador;
- roles funcionales pueden tener permisos globales específicos, territoriales o no territoriales según la matriz exacta;
- seleccionar una sede no convierte un permiso local en global ni un permiso global en acceso a datos aislados;
- una vista de matriz sin acción concreta podrá mostrar que el resultado territorial permanece pendiente;
- una acción territorial sin sede exacta no puede producir `would_allow`.

---

#### 11. Alcance real del simulador

La sede objetivo deberá cumplir:

```text
REQUESTED_SIMULATED_SITE
⊆
SIMULATOR_REAL_AUTHORIZED_INSPECTION_SCOPE
```

La comprobación utilizará permisos y asignaciones reales, no valores simulados.

| Alcance real           | Sedes simulables                                                                       |
| ---------------------- | -------------------------------------------------------------------------------------- |
| `OWN`                  | Solo contexto propio y sedes que el contrato propio permita inspeccionar.              |
| Sede exacta            | Únicamente la sede autorizada.                                                         |
| Multisede explícito    | Conjunto finito de sedes exactas autorizadas.                                          |
| Tipo de sede           | Conjunto finito de sedes actuales del tipo, filtrado por exclusiones y cobertura real. |
| Global ordinario       | Sedes organizacionales ordinarias cubiertas por el permiso exacto; excluye aisladas.   |
| Sede aislada explícita | Solo la sede aislada identificada y autorizada.                                        |

No existen los fallbacks:

```text
sin alcance resuelto → todas las sedes
una sede visible → sede autorizada
rol global → APP-REVIEW
site_type = satelite → todo satélite futuro
```

---

#### 12. Contexto administrativo y contexto operativo

##### 12.1 Contexto administrativo simulado

Podrá utilizar una sede exacta para evaluar permisos, navegación o recursos administrativos territoriales. La sede no requiere turno ni check-in cuando la acción sea administrativa, pero sí permiso, alcance y recurso compatibles.

##### 12.2 Contexto operativo simulado

Exige como mínimo:

```text
rol operativo tipado
+
sede exacta habilitada
+
área válida cuando corresponda
+
turno hipotético válido
+
check-in hipotético cuando la política lo exija
+
permiso operativo
+
recurso territorial coherente
```

La sede por sí sola no reconstruye los demás componentes.

##### 12.3 Sede administrativa y operativa simultáneas

Una simulación puede comparar contextos administrativos y operativos, pero deberá mantenerlos separados. La sede de un carril no se transfiere automáticamente al otro.

---

#### 13. Ausencia territorial legítima

`NO_SITE_NON_TERRITORIAL` solo podrá utilizarse cuando el contrato del permiso, acción y recurso no requiera sede.

Casos conceptuales admisibles:

- vista de matriz de un rol sin acción territorial concreta;
- entrada no territorial a una aplicación;
- recurso organizacional exacto cuyo contrato no use sede;
- explicación de una denegación anterior a la resolución territorial.

Casos no admisibles:

- inventario;
- remisiones;
- producción;
- venta o caja;
- turno;
- check-in;
- trabajador administrado por sede;
- recurso con sede resoluble;
- rol operativo al evaluar una acción.

```text
site_target.mode = NO_SITE_NON_TERRITORIAL
+
acción que requiere sede
=
indeterminate o would_deny
```

Nunca `would_allow`.

---

#### 14. Tipos de sede y comparaciones múltiples

Los tipos observados son:

```text
administrativa
centro_produccion
satelite
punto_checkin
revision
```

Reglas:

1. el tipo es una clasificación derivada del registro exacto;
2. no es una identidad de sede;
3. no autoriza una sede futura;
4. una comparación por tipo se expande a sedes exactas actuales y autorizadas;
5. cada sede produce un resultado independiente;
6. las sedes aisladas no se incorporan a un tipo ordinario por semejanza;
7. `punto_checkin` no se convierte en sede organizacional;
8. el resultado no podrá resumirse como positivo si una sede individual permanece indeterminada o denegada sin mostrar su decisión.

---

#### 15. Sede aislada `APP-REVIEW`

`APP-REVIEW` conserva aislamiento absoluto respecto de la organización productiva ordinaria.

Para aceptarla como objetivo deberán coexistir:

- permiso efectivo de simulación;
- cobertura real explícita sobre `APP-REVIEW`;
- justificación específica;
- sesión personal real;
- rol objetivo válido;
- propósito de revisión compatible;
- reautenticación fuerte cuando la política lo exija;
- minimización y enmascaramiento;
- ausencia de denegaciones.

No la incluyen:

- rol `propietario`;
- rol `gerente_general`;
- permiso global ordinario;
- alcance multisede productivo;
- tipo `revision` sin sede exacta;
- acceso a otra sede;
- actor de revisión como sustituto del simulador real.

La simulación no podrá utilizar `APP-REVIEW` para revelar datos productivos ni utilizar datos productivos para poblar el escenario aislado.

---

#### 16. Punto físico `pickup_camioneta_principal`

El registro `pickup_camioneta_principal` representa un punto físico de check-in o patio vehicular, no una sede organizacional simulable.

```text
site_type = punto_checkin
OR
site_kind = vehicle_yard
→ NOT_SIMULABLE_AS_SITE
```

Reglas:

- no puede poblar `simulated_site_id`;
- no puede aportar cobertura administrativa;
- no puede habilitar un rol operativo;
- no puede sustituir la sede del turno;
- no puede convertirse en sede de recurso;
- podrá utilizarse únicamente como punto físico o recurso tipado si una tarea posterior define ese campo;
- su presencia en `public.sites` no cambia esta clasificación.

---

#### 17. Sede ausente, inactiva, ambigua o incompatible

| Condición                                        | Resultado                      |
| ------------------------------------------------ | ------------------------------ |
| ID o código ausente en `EXACT_SITE`              | `DENY`                         |
| ID y código resuelven sedes distintas            | `DENY`                         |
| Sede inexistente                                 | `DENY`                         |
| Sede inactiva o retirada                         | `DENY`                         |
| Versión de catálogo incompatible                 | `DENY`                         |
| `site_type` enviado como si fuera sede exacta    | `DENY`                         |
| Sede fuera del alcance real                      | `DENY`                         |
| Sede aislada sin cobertura específica            | `DENY`                         |
| Rol operativo sin habilitación exacta            | `DENY`                         |
| Acción territorial con `NO_SITE_NON_TERRITORIAL` | `indeterminate` o `would_deny` |
| Área obligatoria todavía no definida             | `indeterminate`                |
| Recurso con sede contradictoria                  | `would_deny`                   |

La interfaz podrá solicitar corrección del escenario, pero no seleccionar un fallback silencioso.

---

#### 18. Datos reales y minimización

La sede simulada no concede acceso a datos de esa sede.

La vista podrá utilizar:

- metadatos territoriales no sensibles ya visibles para el simulador;
- estructuras vacías;
- datos sintéticos;
- datos anonimizados;
- datos reales que el simulador pueda consultar mediante sus permisos reales.

No podrá revelar por la sola selección de la sede:

- inventario;
- costos o márgenes;
- ventas;
- documentos laborales;
- clientes;
- producción;
- auditorías sensibles;
- credenciales;
- información de otra sede;
- datos de `APP-REVIEW` o productivos fuera del aislamiento correspondiente.

Cuando el simulador no pueda conocer un detalle, el resultado deberá minimizarlo sin alterar la decisión hipotética.

---

#### 19. Prohibición de mutaciones

Seleccionar, cambiar o comparar una sede simulada no podrá:

- crear, activar, desactivar o modificar `public.sites`;
- modificar `employee_sites`;
- modificar `employee_settings.selected_site_id`;
- cambiar la sede primaria;
- cambiar la sede administrativa real;
- cambiar la sede operativa real;
- crear o modificar turnos y check-ins;
- modificar `site_operational_roles`;
- asignar áreas;
- cambiar dispositivos;
- alterar RLS, permisos o sesiones;
- crear recursos empresariales;
- ejecutar acciones como el rol o sede simulados.

```text
CAMBIO DE SEDE SIMULADA
=
NUEVA EVALUACIÓN HIPOTÉTICA
≠
MUTACIÓN TERRITORIAL REAL
```

---

#### 20. Precedencia de decisión

```text
SOLICITANTE_REAL_INVÁLIDO
>
SIMULACIÓN_ANIDADA
>
ROL_OBJETIVO_INVÁLIDO
>
VERSIÓN_TERRITORIAL_INCOMPATIBLE
>
SEDE_AUSENTE_O_INACTIVA
>
CLASE_NO_ORGANIZACIONAL
>
AISLAMIENTO_NO_AUTORIZADO
>
ALCANCE_REAL_INSUFICIENTE
>
ROL_NO_HABILITADO_EN_SEDE
>
REAUTENTICACIÓN_FALTANTE
>
OBJETIVO_TERRITORIAL_ACEPTADO
>
CONTEXTO_DE_ACCIÓN_INCOMPLETO
>
DEFAULT_DENY
```

Una sede válida nunca neutraliza una denegación anterior.

---

#### 21. Razones mínimas estructuradas

| Razón                                      | Significado                                                    |
| ------------------------------------------ | -------------------------------------------------------------- |
| `simulation_site_reference_incomplete`     | Falta un componente obligatorio de la referencia exacta.       |
| `simulation_site_not_found`                | La sede no existe en la versión autoritativa.                  |
| `simulation_site_inactive`                 | La sede está inactiva o retirada.                              |
| `simulation_site_ambiguous`                | ID, código o fuentes resuelven resultados incompatibles.       |
| `simulation_site_catalog_version_mismatch` | La versión solicitada no coincide con la evaluada.             |
| `simulation_site_not_in_real_scope`        | El simulador no puede inspeccionar esa sede.                   |
| `simulation_site_isolated_scope_missing`   | Falta cobertura explícita para la sede aislada.                |
| `simulation_site_strong_reauth_required`   | Falta reautenticación fuerte aplicable.                        |
| `simulation_site_kind_not_organizational`  | El registro es un punto físico o clase no admitida como sede.  |
| `simulation_role_not_allowed_at_site`      | El rol operativo no está habilitado en la sede exacta.         |
| `simulation_site_required`                 | La acción o recurso requiere sede y no existe una exacta.      |
| `simulation_nonterritorial_mode_invalid`   | Se utilizó ausencia territorial para un escenario territorial. |
| `simulation_site_type_not_exact_target`    | Se envió un tipo como si fuera una sede exacta.                |
| `simulation_site_resource_mismatch`        | La sede del recurso contradice la sede del escenario.          |
| `simulation_site_context_incomplete`       | Falta área u otro componente posterior obligatorio.            |

Los mensajes visibles respetarán minimización y no revelarán la existencia o configuración de sedes fuera del alcance real del actor.

---

#### 22. Auditoría mínima

Todo intento permitido o denegado deberá conservar:

- `simulation_request_id`;
- actor, usuario, empleado y sesión reales;
- rol real del simulador;
- rol objetivo tipado y sus versiones;
- modo territorial;
- `simulated_site_id` y código exactos cuando existan;
- tipo, clase y visibilidad territorial resueltos;
- versión del catálogo de sedes;
- alcance real utilizado;
- fuente de compatibilidad rol–sede;
- aislamiento evaluado;
- reautenticación exigida y evidencia referenciada;
- permiso, acción y recurso hipotéticos;
- sede del recurso hipotético;
- resultado territorial y resultado de la acción;
- razones estructuradas;
- versiones de políticas;
- fecha, duración y correlación.

No almacenará secretos, tokens, credenciales, códigos de reautenticación ni payloads empresariales completos.

---

#### 23. Reconciliación con el estado físico observado

| Elemento                                                  | Resultado                       | Estado documental                          |
| --------------------------------------------------------- | ------------------------------- | ------------------------------------------ |
| Filas activas en `public.sites`                           | 7                               | `OBSERVADO`                                |
| Sedes ordinarias organizacionales                         | 5                               | `SIMULABLE_CONDITIONAL`                    |
| Sede aislada de revisión                                  | 1                               | `ISOLATED_EXPLICIT_ONLY`                   |
| Punto físico no organizacional                            | 1                               | `NOT_SIMULABLE_AS_SITE`                    |
| Filas activas en `site_operational_roles` observadas      | 16                              | Fuente física de compatibilidad actual     |
| Roles operativos canónicos cubiertos                      | 12 de 12                        | Sin faltantes en la distribución observada |
| Tabla o servicio autoritativo de simulación               | No materializado por esta tarea | `PENDIENTE_DE_IMPLEMENTACION`              |
| Versionado físico específico del catálogo para simulación | No materializado por esta tarea | `PENDIENTE_DE_IMPLEMENTACION`              |

La observación física no modifica el catálogo. Una implementación futura deberá persistir o derivar versiones reproducibles antes de ejecutar evaluaciones.

---

#### 24. Límites de esta tarea

AUTH-SIM-003 no define:

- el área exacta simulada;
- compatibilidad área–rol;
- estado completo del turno;
- estado completo del check-in;
- formato definitivo del recurso hipotético;
- permisos o acciones simulables;
- duración de la sesión;
- interfaz final;
- tablas, constraints, RLS, RPC o servicios;
- migraciones o backfills;
- cambios de catálogo;
- nuevos sitios;
- datos de ejemplo productivos;
- ejecución de simulaciones;
- pruebas operativas.

Estas responsabilidades permanecen en sus tareas canónicas.

---

#### 25. Handoff exacto a AUTH-SIM-004

`AUTH-SIM-004` deberá definir el área simulada conservando:

1. que el área pertenece a una sede exacta aceptada;
2. que una sede no determina automáticamente un área;
3. que `null` no significa todas las áreas;
4. que un rol operativo debe ser compatible con sede y área;
5. que área administrativa y operativa permanecen separadas;
6. que el área del recurso deberá resolverse cuando el contrato lo exija;
7. que una sede sin áreas no permite inventarlas;
8. que un área inactiva, ambigua o de otra sede falla cerrado;
9. que la selección no modifica asignaciones ni contexto real;
10. que el resultado permanece explicativo y no ejecutable.

Esta tarea no anticipa decisiones por área.

---

#### 26. Invariantes

1. Toda sede simulada exacta usa identidad y versión autoritativas.
2. El código visual no sustituye el ID exacto.
3. La sede seleccionada no autoriza.
4. La sede primaria no autoriza.
5. La sede real del simulador permanece inalterada.
6. La sede simulada nunca autoriza al solicitante.
7. El alcance real limita la sede solicitada.
8. Multisede no equivale a global.
9. Global ordinario no incluye sedes aisladas.
10. Un tipo de sede no es una sede exacta.
11. Un tipo no incorpora sedes futuras automáticamente.
12. `null` no significa todas las sedes.
13. `NO_SITE_NON_TERRITORIAL` exige un contrato realmente no territorial.
14. Una acción territorial sin sede no produce `would_allow`.
15. Un rol operativo exige habilitación exacta en la sede.
16. La sede reduce compatibilidad; nunca añade autoridad.
17. `APP-REVIEW` exige cobertura independiente.
18. `pickup_camioneta_principal` no es sede organizacional simulable.
19. Un punto de check-in no sustituye la sede del turno.
20. Una sede válida no crea área.
21. Una sede válida no crea turno ni check-in.
22. La sede del recurso debe ser coherente con el escenario.
23. Datos reales siguen gobernados por permisos reales.
24. La selección no modifica `employee_sites` ni preferencias.
25. La selección no modifica RLS ni permisos.
26. No existe simulación anidada.
27. Toda ambigüedad falla cerrado.
28. Toda evaluación ocurre en servidor.
29. Todo intento queda auditado con minimización.
30. La tarea siguiente permanece limitada a definir área simulada.

---

#### Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se incorporan `TREQ-AUTH-089` a `TREQ-AUTH-098` en el Registro Canónico de Requisitos de Prueba.

| ID              | Regla protegida                                                                                                                                                                                                                                                                                                                                                                                                               | Tipo                                                              | Prioridad | Momento de implementación                         | Destino                                                        |
| --------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------- | --------- | ------------------------------------------------- | -------------------------------------------------------------- |
| `TREQ-AUTH-089` | Toda sede simulada deberá resolverse mediante una referencia exacta y tipada con `simulated_site_id`, `simulated_site_code`, `simulated_site_type`, `simulated_site_kind` y versión de catálogo; una etiqueta, alias, sede seleccionada, sede primaria o valor enviado por cliente no podrá constituir el objetivo autoritativo.                                                                                              | seguridad + contractual + integración + regresión                 | crítica   | Paquete que materialice el contrato de simulación | `AUTH-DB-013`; `AUTH-SRV-015`; `AUTH-QA-019`                   |
| `TREQ-AUTH-090` | El registro territorial deberá cubrir exactamente las siete identidades físicas vigentes: cinco sedes ordinarias `SIMULABLE_CONDITIONAL`, `APP-REVIEW` como `ISOLATED_EXPLICIT_ONLY` y `pickup_camioneta_principal` como `NOT_SIMULABLE_AS_SITE`, sin faltantes, duplicados ni reclasificaciones implícitas.                                                                                                                  | contractual + base de datos + estática + regresión                | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-003`; `AUTH-DB-013`; `AUTH-QA-019`                   |
| `TREQ-AUTH-091` | Una sede exacta solo podrá aceptarse cuando exista en la versión autoritativa, esté activa, sea inequívoca y su clase permita utilizarla como territorio organizacional simulado; una sede ausente, inactiva, retirada, ambigua o con versión incompatible deberá fallar cerrado.                                                                                                                                             | seguridad + base de datos + contractual + regresión               | crítica   | Paquete que materialice el contrato de simulación | `AUTH-DB-013`; `AUTH-SRV-015`; `AUTH-QA-019`                   |
| `TREQ-AUTH-092` | La sede solicitada deberá pertenecer al alcance real autorizado del simulador para inspección. Alcance `OWN`, multisede, global ordinario o por tipo no podrá atravesar sedes aisladas, incorporar sedes futuras ni convertir `null` en todas las sedes.                                                                                                                                                                      | seguridad + autorización + contexto + E2E + regresión             | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SRV-015`; `AUTH-QA-019`                                  |
| `TREQ-AUTH-093` | Para un rol operativo, la sede simulada deberá conservar una habilitación exacta y activa en `site_operational_roles`; la sede podrá reducir la elegibilidad del rol, pero nunca añadir roles, permisos, aplicaciones, áreas, turnos, check-ins ni autoridad ausentes.                                                                                                                                                        | autorización + contexto + base de datos + integración + regresión | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-004` a `AUTH-SIM-006`; `AUTH-SRV-015`; `AUTH-QA-019` |
| `TREQ-AUTH-094` | `APP-REVIEW` solo podrá simularse mediante cobertura real explícita para esa sede aislada, justificación, minimización y reautenticación fuerte cuando corresponda; ningún rol, permiso global ordinario, tipo de sede o acceso a otra sede podrá incluirla por herencia.                                                                                                                                                     | seguridad + autenticación + autorización + E2E + regresión        | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-008`; `AUTH-SRV-015`; `AUTH-QA-019`                  |
| `TREQ-AUTH-095` | `pickup_camioneta_principal` y cualquier registro clasificado como punto de check-in, geocerca, patio vehicular o espacio físico no organizacional no podrán poblar `simulated_site_id`; `AUTH-SIM-005` deberá tratarlos, cuando apliquen, mediante un campo de punto físico expresamente tipado y separado de la sede del turno.                                                                                             | contractual + contexto + integración + regresión                  | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-003`; `AUTH-SIM-005`; `AUTH-SRV-015`; `AUTH-QA-019`  |
| `TREQ-AUTH-096` | El modo `NO_SITE_NON_TERRITORIAL` solo será válido para una evaluación cuyo permiso, acción y recurso sean realmente no territoriales. Si el contrato exige sede, la ausencia territorial producirá `indeterminate` o `would_deny`, nunca `would_allow` ni un fallback a sede primaria, seleccionada o única.                                                                                                                 | contractual + contexto + autorización + E2E + regresión           | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-004` a `AUTH-SIM-006`; `AUTH-SRV-015`; `AUTH-QA-019` |
| `TREQ-AUTH-097` | Seleccionar, cambiar o comparar una sede simulada no podrá modificar `employee_sites`, `employee_settings`, turno, check-in, sede operativa, sede administrativa, dispositivo, recurso, RLS, permisos, datos ni contexto real; tampoco concederá lectura de datos fuera del alcance real del simulador.                                                                                                                       | seguridad + autorización + RLS + integración + E2E + regresión    | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-006`; `AUTH-SRV-015`; `AUTH-QA-019`                  |
| `TREQ-AUTH-098` | Toda evaluación territorial simulada deberá registrar actor y sesión reales, rol tipado, sede exacta o ausencia territorial explícita, tipo y clase de sede, versiones, alcance real, compatibilidad rol–sede, aislamiento, reautenticación, resultado y razones estructuradas; el registro deberá reconciliar siete sedes y dieciséis habilitaciones operativas activas observadas sin convertirlas en autoridad ejecutable. | contractual + auditoría + integración + estática + regresión      | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-003`; `AUTH-DB-013`; `AUTH-SRV-015`; `AUTH-QA-019`   |

---

#### 27. Criterios de aceptación

- [x] Se distinguió la sede simulada de todas las sedes reales del actor.
- [x] Se definieron dos modos territoriales explícitos.
- [x] Se exigió identidad exacta, tipo, clase y versión.
- [x] Se materializaron siete decisiones de sede física.
- [x] Se clasificaron cinco sedes ordinarias simulables.
- [x] Se clasificó `APP-REVIEW` como aislada y explícita.
- [x] Se bloqueó `pickup_camioneta_principal` como sede organizacional.
- [x] Se materializaron doce decisiones de compatibilidad de rol operativo.
- [x] Se reconciliaron dieciséis asociaciones activas rol–sede.
- [x] Se definió el alcance real como límite superior.
- [x] Se prohibieron wildcards, fallbacks e inclusión futura implícita.
- [x] Se definió ausencia territorial legítima.
- [x] Se separaron contexto administrativo y operativo.
- [x] Se preservó el aislamiento de `APP-REVIEW`.
- [x] Se preservó la minimización de datos.
- [x] Se prohibieron todas las mutaciones territoriales reales.
- [x] Se definieron precedencia y razones estructuradas.
- [x] Se definió auditoría mínima.
- [x] Se generaron `TREQ-AUTH-089` a `TREQ-AUTH-098`.
- [x] No se modificó código, Supabase, migraciones, RLS, RPC, configuración, datos, sedes, áreas, asignaciones, turnos, sesiones, dispositivos ni permisos.
- [x] `AUTH-SIM-004` permanece únicamente reservada.

---

#### 28. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-SIM-002 — Definir roles simulables`

**TAREA ACTUAL APROBADA**
`AUTH-SIM-003 — Definir sede simulada`

**SIGUIENTE TAREA RESERVADA**
`AUTH-SIM-004 — Definir área simulada`


### ✅ AUTH-SIM-004 — Definir área simulada

**Estado:** APROBADA
**Tarea anterior:** `AUTH-SIM-003 — Definir sede simulada` — APROBADA
**Tarea siguiente:** `AUTH-SIM-005 — Definir turno simulado` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de elegibilidad del área simulada, registro materializado de áreas exactas, administrativas, operativas, aisladas y agregadas, y reconciliación de compatibilidad rol–sede–área
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Q_SIMULACION/01_CONTEXTO_Y_ALCANCE_SIMULADO.md`
**Artefactos producidos:** `SIMULATED-AREA-ELIGIBILITY-CONTRACT-001`, `SIMULATED-AREA-REGISTER-001`, `SIMULATED-AREA-ROLE-COMPATIBILITY-REGISTER-001` y `SIMULATED-AREA-PHYSICAL-RECONCILIATION-001`
**Decisiones y contratos consumidos:** `AUTH-MOD-008`, `AUTH-MOD-012` a `AUTH-MOD-015`, `AUTH-SIM-001`, `AUTH-SIM-002`, `AUTH-SIM-003`, catálogo vigente de `public.areas` y `public.area_kinds`, habilitaciones de `public.site_operational_roles`, migración histórica de áreas generales satélite y estado físico observado de `public.context_simulation_sessions`
**Cambios en código, Supabase, migraciones, RLS, RPC, configuración, datos, sedes, áreas, asignaciones, turnos, sesiones, dispositivos o permisos:** no autorizados

---

#### 1. Propósito

Definir exactamente qué área puede formar parte de un contexto simulado de autorización, sin confundir:

- área simulada con área real del solicitante;
- área exacta con tipo de área;
- área operativa con área administrativa;
- área seleccionada con área autorizada;
- área primaria con área efectiva;
- área de rol con área de turno;
- área de recurso con área de dispositivo;
- fila agregada `Todos` o `General` con una identidad operativa exacta;
- compatibilidad rol–área con permiso para ejecutar;
- ausencia legítima de área con wildcard territorial.

```text
ÁREA SIMULADA EXACTA
≠
ÁREA SELECCIONADA
≠
ÁREA PRIMARIA
≠
ÁREA REAL DEL SIMULADOR
≠
ÁREA DEL DISPOSITIVO
≠
ÁREA DEL TURNO
≠
ÁREA DEL RECURSO
≠
AUTORIDAD EJECUTABLE
```

El área simulada es un componente hipotético subordinado a una sede simulada previamente aceptada. Nunca modifica ni sustituye el contexto real desde el que se autoriza al solicitante.

---

#### 2. Resultado material

Se aprueban:

1. `SIMULATED-AREA-ELIGIBILITY-CONTRACT-001`, que define identidad exacta, sede padre, modos de objetivo, alcance real, compatibilidad rol–área, agregados, ausencia de área, coherencia con recursos, precedencia, razones y fail closed;
2. `SIMULATED-AREA-REGISTER-001`, que materializa una decisión para las 22 áreas activas observadas;
3. `SIMULATED-AREA-ROLE-COMPATIBILITY-REGISTER-001`, que materializa 13 vínculos exactos y tres vínculos operativos sin área resuelta;
4. `SIMULATED-AREA-PHYSICAL-RECONCILIATION-001`, que conserva brechas físicas sin convertirlas en autorización ni modificar el despliegue.

Cobertura materializada:

| Resultado                                        | Cantidad |
| ------------------------------------------------ | -------: |
| Áreas activas con decisión explícita             |       22 |
| Áreas organizacionales ordinarias exactas        |       18 |
| Áreas operativas ordinarias exactas              |       13 |
| Áreas administrativas ordinarias exactas         |        5 |
| Área aislada exacta                              |        1 |
| Filas agregadas no admitidas como área exacta    |        3 |
| `area_kinds` activos observados                  |       16 |
| Habilitaciones activas rol–sede observadas       |       16 |
| Habilitaciones con `area_id` exacto              |       13 |
| Habilitaciones con área no resuelta              |        3 |
| Sesiones físicas de simulación observadas        |        0 |
| Wildcards, fallbacks o áreas inferidas aprobadas |        0 |
| Áreas capaces de autorizar por ser seleccionadas |        0 |

---

#### 3. Base normativa heredada

La tarea conserva íntegramente que:

- el solicitante real debe superar `AUTH-SIM-001`;
- el rol objetivo debe superar `AUTH-SIM-002`;
- la sede objetivo debe superar `AUTH-SIM-003`;
- el área pertenece a una sede exacta aceptada;
- una sede no determina automáticamente un área;
- `null` no significa todas las áreas;
- un rol operativo debe ser compatible con sede y área;
- área administrativa y área operativa permanecen separadas;
- el área del recurso deberá resolverse cuando el contrato lo exija;
- una sede sin áreas no permite inventarlas;
- un área inactiva, ambigua o de otra sede falla cerrado;
- la selección simulada no modifica asignaciones ni contexto real;
- el resultado solo puede ser explicativo y no ejecutable;
- toda ambigüedad, brecha o incompatibilidad falla cerrado.

---

#### 4. Identidades separadas

| Identidad                    | Función                                                          | Autoridad                              |
| ---------------------------- | ---------------------------------------------------------------- | -------------------------------------- |
| `simulator_real_area_scope`  | Conjunto real de áreas que el simulador puede inspeccionar       | Limita la solicitud; no se modifica    |
| `simulated_site_id`          | Sede exacta hipotética aceptada por `AUTH-SIM-003`               | Padre obligatorio del área exacta      |
| `simulated_area_id`          | Área exacta hipotética evaluada                                  | No autoriza acciones reales            |
| `simulated_area_code`        | Código corroborativo dentro de la sede                           | No sustituye el UUID                   |
| `simulated_area_kind`        | Clasificación funcional de la fila exacta                        | No es wildcard ni identidad suficiente |
| `simulated_area_class`       | Clase contractual: operativa, administrativa, aislada o agregada | Define tratamiento, no concede permiso |
| `simulated_resource_area_id` | Área resuelta del recurso hipotético                             | Debe ser coherente cuando aplique      |
| `simulated_shift_area_id`    | Área hipotética del turno, definida por la tarea siguiente       | No sustituye al área objetivo          |
| `real_active_area_id`        | Área real activa del actor                                       | Permanece inalterada                   |
| `real_selected_area_id`      | Preferencia real de interfaz                                     | No es evidencia de autorización        |
| `shared_device_area_id`      | Límite real del dispositivo compartido                           | Solo restringe; nunca amplía           |

```text
simulated_area_id
≠
real_active_area_id
≠
real_selected_area_id
≠
shared_device_area_id
≠
simulated_shift_area_id
≠
simulated_resource_area_id
```

---

#### 5. Modos contractuales de objetivo

```ts
type SimulatedAreaTarget =
  | {
      mode: "EXACT_AREA";
      simulated_site_id: string;
      simulated_site_code: string;
      simulated_area_id: string;
      simulated_area_code: string;
      simulated_area_kind: string;
      simulated_area_class:
        | "OPERATIONAL"
        | "ADMINISTRATIVE"
        | "ISOLATED";
      site_catalog_version: string;
      area_catalog_version: string;
    }
  | {
      mode: "NO_AREA_NOT_REQUIRED";
      simulated_site_id: string | null;
      simulated_area_id: null;
      simulated_area_code: null;
      simulated_area_kind: null;
      simulated_area_class: null;
      site_catalog_version: string;
      area_catalog_version: string;
    };
```

Reglas:

1. `EXACT_AREA` exige sede y área únicas, activas y coherentes;
2. `NO_AREA_NOT_REQUIRED` declara positivamente que el contrato evaluado no requiere área;
3. una fila `AGGREGATE_NOT_EXACT` no puede poblar `EXACT_AREA`;
4. `area_kind` no constituye un tercer modo;
5. una consulta por tipo se expande en servidor a una lista finita de áreas exactas autorizadas;
6. `null`, cadena vacía, primer resultado, área primaria, área seleccionada o única área visible no se transforman en `EXACT_AREA`;
7. cada evaluación conserva versiones de sede y área.

---

#### 6. Contrato conceptual

```ts
type SimulatedAreaEligibilityInput = {
  simulation_request_id: string;
  simulator_actor_id: string;
  real_session_id: string;
  simulated_role_kind: "BASE" | "OPERATIONAL";
  simulated_role_code: string;
  role_catalog_version: string;
  role_matrix_version: string;
  simulated_site_id: string | null;
  site_catalog_version: string;
  area_target: SimulatedAreaTarget;
  target_permission_key: string | null;
  target_action: string | null;
  target_resource_reference: string | null;
  simulated_resource_area_id: string | null;
  strong_reauth_evidence_id: string | null;
};
```

```ts
type SimulatedAreaEligibilityResult = {
  accepted: boolean;
  decision:
    | "SIMULABLE_CONDITIONAL"
    | "ISOLATED_EXPLICIT_ONLY"
    | "AGGREGATE_NOT_EXACT"
    | "NO_AREA_ACCEPTED"
    | "INDETERMINATE"
    | "DENY";
  exact_area_resolved: boolean;
  belongs_to_simulated_site: boolean | null;
  within_simulator_real_scope: boolean;
  role_area_compatible: boolean | null;
  resource_area_compatible: boolean | null;
  aggregate_reference_rejected: boolean;
  strong_reauth_required: boolean;
  simulated_decision:
    | "would_allow"
    | "would_deny"
    | "indeterminate"
    | null;
  reason_codes: string[];
  evaluated_site_catalog_version: string;
  evaluated_area_catalog_version: string;
  evaluated_role_matrix_version: string;
  policy_version: string;
  evaluated_at: string;
};
```

La implementación física podrá normalizar estas formas sin perder identidad exacta, sede padre, clase, tipo, versiones, alcance real, compatibilidad, razones ni separación respecto del contexto real.

---

#### 7. Fórmula de elegibilidad

```text
SOLICITANTE ELEGIBLE SEGÚN AUTH-SIM-001
∩
ROL OBJETIVO VÁLIDO SEGÚN AUTH-SIM-002
∩
SEDE OBJETIVO ACEPTADA SEGÚN AUTH-SIM-003
∩
MODO DE ÁREA EXPLÍCITO
∩
ÁREA EXACTA ACTIVA O AUSENCIA VÁLIDA
∩
ÁREA PERTENECE A LA SEDE SIMULADA
∩
ÁREA SOLICITADA ⊆ ALCANCE REAL DE INSPECCIÓN
∩
COMPATIBILIDAD ROL–SEDE–ÁREA CUANDO APLIQUE
∩
COHERENCIA CON PERMISO, ACCIÓN Y RECURSO
∩
AISLAMIENTO Y REAUTENTICACIÓN CUANDO APLIQUEN
∩
AUSENCIA DE DENEGACIONES
=
OBJETIVO DE ÁREA ACEPTADO
```

Aceptar el área no produce por sí solo `would_allow`. Turno, check-in, permiso, acción y recurso deberán satisfacer sus contratos cuando sean obligatorios.

---

#### 8. Resolución exacta y pertenencia a sede

Para `EXACT_AREA` deberán coincidir simultáneamente:

```text
area.id = simulated_area_id
area.site_id = simulated_site_id
area.code = simulated_area_code
area.kind = simulated_area_kind
area.is_active = true
site.is_active = true
versiones compatibles
```

Reglas:

- el UUID es la identidad autoritativa;
- el código es corroborativo y único dentro de la sede, no global;
- el nombre visible nunca es identidad;
- una coincidencia de `area_kind` no sustituye una fila exacta;
- un área de otra sede produce `DENY` aunque el nombre o tipo coincida;
- una referencia con ID y código contradictorios produce `DENY`;
- una fila retirada se conserva como evidencia histórica, pero no se simula como activa;
- la sede aceptada puede reducir las áreas candidatas, nunca inventarlas.

---

#### 9. Registro materializado de áreas activas

| Sede              | `area_id`                              | Código             | Nombre observado       | `area_kind`       | Clase            | Decisión                 | Regla                                                                                                      |
| ----------------- | -------------------------------------- | ------------------ | ---------------------- | ----------------- | ---------------- | ------------------------ | ---------------------------------------------------------------------------------------------------------- |
| `APP-REVIEW`      | `01f8e7eb-43dc-4ed3-8709-67fec5f1ffe4` | `OPERACION`        | Operacion              | `general`         | `AISLADA`        | `ISOLATED_EXPLICIT_ONLY` | Área exacta de la sede aislada; exige cobertura independiente y minimización.                              |
| `CENTRO_PROD`     | `1c013f8f-2020-4fa3-b8a9-33e055842209` | `BODEGA`           | Bodega                 | `bodega`          | `OPERATIVA`      | `SIMULABLE_CONDITIONAL`  | Área operativa exacta; vinculada físicamente con `bodeguero`.                                              |
| `CENTRO_PROD`     | `afb228fe-8134-41b7-bc75-f6cb3f43210e` | `COC-CAL`          | Cocina caliente        | `cocina_caliente` | `OPERATIVA`      | `SIMULABLE_CONDITIONAL`  | Área operativa exacta; vinculada con `produccion_cocina`.                                                  |
| `CENTRO_PROD`     | `8bfe8c1d-9dd9-40a5-9c25-3631dd78b619` | `PAN-GALL`         | Galleteria y Panaderia | `panaderia`       | `OPERATIVA`      | `SIMULABLE_CONDITIONAL`  | Área operativa exacta; vinculada con `produccion_panaderia`.                                               |
| `CENTRO_PROD`     | `9e73ffd6-7191-46ee-a644-134ec0bb6015` | `REPOSTERIA`       | Reposteria             | `reposteria`      | `OPERATIVA`      | `SIMULABLE_CONDITIONAL`  | Área operativa exacta; vinculada con `produccion_reposteria`.                                              |
| `MOLKA_PRINCIPAL` | `79fffc7f-1712-47f0-b1a1-a0cbac5b4ed4` | `MOSTRADOR`        | Mostrador              | `mostrador`       | `OPERATIVA`      | `SIMULABLE_CONDITIONAL`  | Área exacta disponible; el rol `operador_integral_satelite` no posee vínculo de área y no puede inferirse. |
| `MOLKA_PRINCIPAL` | `8c9633dc-603d-46df-8873-a58cbd1147de` | `todos`            | Todos                  | `general`         | `AGREGADA`       | `AGGREGATE_NOT_EXACT`    | Área agregada histórica de remisiones; no representa una única área operativa.                             |
| `SAUDO`           | `abc554c3-cb48-4a43-8761-4a9e9e863614` | `CAJA`             | Caja                   | `caja`            | `OPERATIVA`      | `SIMULABLE_CONDITIONAL`  | Área operativa exacta; vinculada con `cajero_satelite`.                                                    |
| `SAUDO`           | `07380165-7819-4d1f-8295-6e9ed9b615a8` | `COCINA_BARRA`     | Cocina / Barra         | `cocina_bar`      | `OPERATIVA`      | `SIMULABLE_CONDITIONAL`  | Área operativa exacta compartida por `barista_satelite` y `cocinero_satelite`.                             |
| `SAUDO`           | `3ecfd3c7-235f-45d7-b607-704ccb862c83` | `SALON`            | Salón                  | `salon`           | `OPERATIVA`      | `SIMULABLE_CONDITIONAL`  | Área operativa exacta; vinculada con `servicio_salon`.                                                     |
| `SAUDO`           | `2fce4815-fc38-41f6-8870-c19d415f61a8` | `todos`            | Todos                  | `general`         | `AGREGADA`       | `AGGREGATE_NOT_EXACT`    | Área agregada histórica de remisiones; no es wildcard de autorización.                                     |
| `VENTO_CAFE`      | `2ac36aff-b87b-4260-a32a-9c710ec4a124` | `BARRA`            | Barra                  | `bar`             | `OPERATIVA`      | `SIMULABLE_CONDITIONAL`  | Área operativa exacta; vinculada con `barista_satelite`.                                                   |
| `VENTO_CAFE`      | `3215396a-dfc5-44b7-924b-b27260cc455d` | `CAJA`             | Caja                   | `caja`            | `OPERATIVA`      | `SIMULABLE_CONDITIONAL`  | Área operativa exacta; vinculada con `cajero_satelite`.                                                    |
| `VENTO_CAFE`      | `31437887-3357-4ccb-aae2-747cc7802453` | `COCINA`           | Cocina                 | `cocina`          | `OPERATIVA`      | `SIMULABLE_CONDITIONAL`  | Área operativa exacta; vinculada con `cocinero_satelite`.                                                  |
| `VENTO_CAFE`      | `891a9d67-dc0e-4943-9eef-558b580efb37` | `GENERAL`          | General                | `general`         | `AGREGADA`       | `AGGREGATE_NOT_EXACT`    | Fila general de sede satélite; su código físico divergente no la convierte en área exacta.                 |
| `VENTO_CAFE`      | `7d1e1556-1f53-48be-bf1b-8e060926eb78` | `MOSTRADOR`        | Mostrador              | `mostrador`       | `OPERATIVA`      | `SIMULABLE_CONDITIONAL`  | Área operativa exacta; vinculada con `mostrador_satelite`.                                                 |
| `VENTO_CAFE`      | `12b3aeac-3b44-4528-a1ce-0a1a3057751a` | `SALON`            | Salón                  | `salon`           | `OPERATIVA`      | `SIMULABLE_CONDITIONAL`  | Área operativa exacta; vinculada con `servicio_salon`.                                                     |
| `VENTO_GROUP`     | `9aa70d16-4bf5-498a-9b26-126eb49c3c12` | `CONDUCTOR`        | Conductor              | `logistica`       | `ADMINISTRATIVA` | `SIMULABLE_CONDITIONAL`  | Área organizacional exacta; no se vincula por inferencia con `conductor_logistica` de otra sede.           |
| `VENTO_GROUP`     | `99f9c151-fcd1-4e97-9c6d-03cd58565823` | `CONTABILIDAD`     | Contabilidad           | `contabilidad`    | `ADMINISTRATIVA` | `SIMULABLE_CONDITIONAL`  | Área administrativa exacta; exige permiso y alcance real compatibles.                                      |
| `VENTO_GROUP`     | `96afcf8a-b638-48f0-96b6-8295ba8419e2` | `DIRECCION`        | Dirección              | `liderazgo`       | `ADMINISTRATIVA` | `SIMULABLE_CONDITIONAL`  | Área administrativa exacta; no crea privilegios de dirección.                                              |
| `VENTO_GROUP`     | `94eb19b4-ef3a-4df2-887c-d9d06b03ca02` | `GERENCIA_GENERAL` | Gerencia General       | `gerencia`        | `ADMINISTRATIVA` | `SIMULABLE_CONDITIONAL`  | Área administrativa exacta; no equivale al rol base `gerente_general`.                                     |
| `VENTO_GROUP`     | `57993559-0f55-4d6a-a1e3-e7c9721d7f40` | `MARKETING`        | Marketing              | `marketing`       | `ADMINISTRATIVA` | `SIMULABLE_CONDITIONAL`  | Área administrativa exacta; no concede permisos de marketing.                                              |

Totales:

```text
18 SIMULABLE_CONDITIONAL
1 ISOLATED_EXPLICIT_ONLY
3 AGGREGATE_NOT_EXACT
= 22 decisiones exactas
```

La existencia física y el estado activo de una fila no bastan para convertirla en área exacta simulable.

---

#### 10. Tipos de área observados

Los dieciséis `area_kinds` activos observados son:

```text
bar
bodega
caja
cocina
cocina_bar
cocina_caliente
contabilidad
general
gerencia
liderazgo
logistica
marketing
mostrador
panaderia
reposteria
salon
```

Reglas:

1. el tipo describe una fila; no es identidad;
2. un tipo puede existir en varias sedes;
3. un tipo no incluye automáticamente áreas futuras;
4. `general` no tiene una semántica única: puede representar agregado satélite o área aislada según la identidad exacta;
5. una comparación por tipo se expande a áreas exactas actuales y autorizadas;
6. las filas agregadas permanecen excluidas de la expansión operativa;
7. el área aislada solo entra mediante cobertura específica;
8. cada área produce una decisión independiente.

---

#### 11. Filas agregadas `Todos` y `General`

La migración histórica de NEXO creó o normalizó un área `kind=general` para remisiones en las sedes satélite Vento Café, Saudo y Molka. El estado físico actual presenta:

| Sede              | Código físico | Clase contractual     |
| ----------------- | ------------- | --------------------- |
| `MOLKA_PRINCIPAL` | `todos`       | `AGGREGATE_NOT_EXACT` |
| `SAUDO`           | `todos`       | `AGGREGATE_NOT_EXACT` |
| `VENTO_CAFE`      | `GENERAL`     | `AGGREGATE_NOT_EXACT` |

Reglas:

- la divergencia de código en Vento Café se registra, no se corrige en esta tarea;
- estas filas pueden servir a procesos agregados heredados, pero no representan una estación laboral exacta;
- no pueden actuar como todas las áreas;
- no pueden resolver el área de un rol, turno, recurso o dispositivo;
- no pueden convertirse en wildcard por su nombre o `kind`;
- no sustituyen el conjunto finito de áreas exactas;
- una implementación futura deberá conservar compatibilidad de NEXO sin reutilizarlas como identidad de autorización.

---

#### 12. Área aislada `APP-REVIEW/OPERACION`

`APP-REVIEW/OPERACION` conserva aislamiento respecto de las áreas productivas y administrativas ordinarias.

Para aceptarla deberán coexistir:

- sede `APP-REVIEW` aceptada por `AUTH-SIM-003`;
- área exacta `OPERACION`;
- cobertura real explícita e independiente;
- propósito de revisión compatible;
- justificación específica;
- sesión personal real;
- minimización y enmascaramiento;
- reautenticación fuerte cuando corresponda;
- ausencia de denegaciones.

`area_kind=general` no la incorpora a los agregados de remisión ni permite mezclar datos productivos con datos de revisión.

---

#### 13. Sede sin área organizacional simulable

`pickup_camioneta_principal` no posee filas en `public.areas` y no es una sede organizacional simulable según `AUTH-SIM-003`.

```text
site = pickup_camioneta_principal
+
area inexistente o inventada
=
DENY
```

No se crearán áreas conceptuales como patio, conductor, vehículo o logística por inferencia. Una tarea posterior podrá tratar el punto físico mediante una identidad distinta para check-in, sin poblar `simulated_area_id`.

---

#### 14. Compatibilidad materializada rol–sede–área

| Sede              | Rol operativo                | Área exacta    | Estado                    | Regla                                                                                   |
| ----------------- | ---------------------------- | -------------- | ------------------------- | --------------------------------------------------------------------------------------- |
| `CENTRO_PROD`     | `bodeguero`                  | `BODEGA`       | `EXACT_BINDING`           | Compatible únicamente con el área exacta vinculada.                                     |
| `CENTRO_PROD`     | `produccion_cocina`          | `COC-CAL`      | `EXACT_BINDING`           | Compatible únicamente con Cocina caliente.                                              |
| `CENTRO_PROD`     | `produccion_panaderia`       | `PAN-GALL`     | `EXACT_BINDING`           | Compatible únicamente con Galleteria y Panaderia.                                       |
| `CENTRO_PROD`     | `produccion_reposteria`      | `REPOSTERIA`   | `EXACT_BINDING`           | Compatible únicamente con Reposteria.                                                   |
| `SAUDO`           | `barista_satelite`           | `COCINA_BARRA` | `EXACT_BINDING`           | Comparte área exacta con `cocinero_satelite`; no comparte autoridad.                    |
| `SAUDO`           | `cajero_satelite`            | `CAJA`         | `EXACT_BINDING`           | Compatible únicamente con Caja.                                                         |
| `SAUDO`           | `cocinero_satelite`          | `COCINA_BARRA` | `EXACT_BINDING`           | Comparte área exacta con `barista_satelite`; conserva permisos propios.                 |
| `SAUDO`           | `servicio_salon`             | `SALON`        | `EXACT_BINDING`           | Compatible únicamente con Salón.                                                        |
| `VENTO_CAFE`      | `barista_satelite`           | `BARRA`        | `EXACT_BINDING`           | Compatible únicamente con Barra.                                                        |
| `VENTO_CAFE`      | `cajero_satelite`            | `CAJA`         | `EXACT_BINDING`           | Compatible únicamente con Caja.                                                         |
| `VENTO_CAFE`      | `cocinero_satelite`          | `COCINA`       | `EXACT_BINDING`           | Compatible únicamente con Cocina.                                                       |
| `VENTO_CAFE`      | `mostrador_satelite`         | `MOSTRADOR`    | `EXACT_BINDING`           | Compatible únicamente con Mostrador.                                                    |
| `VENTO_CAFE`      | `servicio_salon`             | `SALON`        | `EXACT_BINDING`           | Compatible únicamente con Salón.                                                        |
| `CENTRO_PROD`     | `conductor_logistica`        | —              | `AREA_BINDING_UNRESOLVED` | La sede está habilitada, pero no existe `area_id`; no se infiere Bodega ni otra área.   |
| `MOLKA_PRINCIPAL` | `operador_integral_satelite` | —              | `AREA_BINDING_UNRESOLVED` | No se infiere Mostrador ni `todos`; una acción con área queda indeterminada o denegada. |
| `VENTO_GROUP`     | `gerencia_operativa`         | —              | `AREA_BINDING_UNRESOLVED` | No se infiere Dirección, Gerencia General ni otra área administrativa.                  |

Totales:

```text
13 EXACT_BINDING
3 AREA_BINDING_UNRESOLVED
= 16 habilitaciones activas observadas
```

Reglas:

1. un vínculo exacto permite considerar compatible el trío rol–sede–área;
2. no concede el permiso objetivo;
3. no crea turno ni check-in;
4. dos roles pueden compartir un área sin compartir permisos;
5. un rol sin `area_id` no recibe un área por nombre, única candidata, sede o práctica operativa;
6. para una acción que exige área, `AREA_BINDING_UNRESOLVED` produce `indeterminate` o `would_deny`;
7. una tarea de implementación deberá corregir o modelar la brecha antes de producir `would_allow` reproducible.

---

#### 15. Roles base y áreas administrativas

Los roles base no dependen de `site_operational_roles`, pero un permiso, recurso o acción territorial puede exigir un área exacta.

Reglas:

- `DIRECCION` no equivale a `propietario`;
- `GERENCIA_GENERAL` no equivale a `gerente_general`;
- `CONTABILIDAD` no concede permisos financieros;
- `MARKETING` no concede permisos de campañas;
- `CONDUCTOR` no crea el rol `conductor_logistica` ni lo traslada desde Centro de Producción;
- seleccionar un área administrativa no amplía cobertura organizacional;
- un rol base global ordinario no atraviesa `APP-REVIEW`;
- una vista de matriz sin acción concreta puede conservar área pendiente;
- una acción con recurso de área exige coherencia exacta.

---

#### 16. Contexto operativo simulado

Una acción operativa con área deberá satisfacer como mínimo:

```text
rol operativo tipado
+
sede exacta aceptada
+
área exacta compatible
+
turno hipotético válido
+
check-in hipotético cuando corresponda
+
permiso operativo exacto
+
recurso territorial coherente
```

El área no reconstruye los demás componentes. Un rol compatible con la sede pero sin vínculo exacto de área no puede producir `would_allow` para una acción dependiente de área.

---

#### 17. Coherencia con recurso, turno y dispositivo

Cuando existan estas identidades:

```text
simulated_area_id
simulated_resource_area_id
simulated_shift_area_id
shared_device_area_id
```

se aplicará intersección restrictiva, no unión.

| Condición                                       | Resultado                              |
| ----------------------------------------------- | -------------------------------------- |
| Recurso exige la misma área y coincide          | Continúa la evaluación                 |
| Recurso pertenece a otra área                   | `would_deny`                           |
| Turno exige área y coincide                     | Continúa la evaluación                 |
| Turno exige área y falta o contradice           | `indeterminate` o `would_deny`         |
| Dispositivo limita a otra área                  | `DENY`                                 |
| Dispositivo no tiene política de área resoluble | `DENY` para acción dependiente de área |
| Área seleccionada coincide solo por preferencia | No aporta autoridad                    |

La tarea siguiente definirá el turno simulado sin alterar estas reglas.

---

#### 18. Alcance real del simulador

```text
REQUESTED_SIMULATED_AREA
⊆
SIMULATOR_REAL_AUTHORIZED_INSPECTION_SCOPE
```

La comprobación utiliza permisos y asignaciones reales.

| Alcance real           | Áreas simulables                                                                     |
| ---------------------- | ------------------------------------------------------------------------------------ |
| `OWN`                  | Contexto propio y áreas que el contrato propio permita inspeccionar                  |
| Área exacta            | Únicamente esa área                                                                  |
| Conjunto explícito     | Lista finita de áreas exactas autorizadas                                            |
| Tipo de área           | Expansión finita actual, excluyendo agregados e aisladas no autorizadas              |
| Sede exacta            | No implica automáticamente todas sus áreas; exige permiso cuya cobertura las incluya |
| Global ordinario       | Áreas organizacionales ordinarias cubiertas; excluye aislamiento                     |
| Área aislada explícita | Solo `APP-REVIEW/OPERACION` cuando esté autorizada                                   |

No existen fallbacks desde sede visible, rol global, área primaria, `general`, `Todos` o `null`.

---

#### 19. Ausencia legítima de área

`NO_AREA_NOT_REQUIRED` solo procede cuando el contrato del rol, permiso, acción y recurso no utiliza área.

Casos conceptuales admisibles:

- vista general de matriz sin acción territorial;
- permiso administrativo verdaderamente no segmentado por área;
- recurso organizacional cuyo contrato no posee área;
- explicación de una denegación anterior a la resolución de área.

Casos no admisibles:

- producción;
- inventario por ubicación;
- venta o caja;
- servicio de salón;
- turno con área;
- check-in con área efectiva;
- recurso con `area_id` resoluble;
- rol operativo al evaluar una acción dependiente de área.

```text
area_target.mode = NO_AREA_NOT_REQUIRED
+
acción que requiere área
=
indeterminate o would_deny
```

Nunca `would_allow`.

---

#### 20. Área ausente, inactiva, ambigua o incompatible

| Condición                                   | Resultado                      |
| ------------------------------------------- | ------------------------------ |
| ID o código ausente en `EXACT_AREA`         | `DENY`                         |
| ID y código resuelven áreas distintas       | `DENY`                         |
| Área inexistente                            | `DENY`                         |
| Área inactiva o retirada                    | `DENY`                         |
| Versión de catálogo incompatible            | `DENY`                         |
| Área pertenece a otra sede                  | `DENY`                         |
| `area_kind` enviado como objetivo exacto    | `DENY`                         |
| Fila agregada enviada como objetivo exacto  | `DENY`                         |
| Área fuera del alcance real                 | `DENY`                         |
| Área aislada sin cobertura específica       | `DENY`                         |
| Rol operativo incompatible con el área      | `would_deny`                   |
| Vínculo rol–área no resuelto                | `indeterminate` o `would_deny` |
| Acción con área obligatoria y modo sin área | `indeterminate` o `would_deny` |
| Recurso con área contradictoria             | `would_deny`                   |

La interfaz podrá pedir corrección del escenario, pero no seleccionar un fallback silencioso.

---

#### 21. Datos reales y minimización

El área simulada no concede acceso a datos de esa área.

La vista podrá utilizar:

- metadatos de área no sensibles ya visibles para el simulador;
- estructuras vacías;
- datos sintéticos;
- datos anonimizados;
- datos reales consultables mediante permisos reales.

No podrá revelar por la selección del área:

- inventario o ubicaciones;
- costos, márgenes o ventas;
- turnos de terceros;
- trabajadores asignados;
- documentos laborales;
- clientes;
- producción;
- auditorías sensibles;
- información de otra área o sede;
- datos de `APP-REVIEW` fuera del aislamiento.

---

#### 22. Prohibición de mutaciones

Seleccionar, cambiar o comparar un área simulada no podrá:

- crear, activar, desactivar o modificar `public.areas`;
- modificar `public.area_kinds`;
- modificar `employee_areas`;
- modificar `employees.area_id`;
- modificar `employee_settings.selected_area_id`;
- modificar `employee_area_purpose_assignments`;
- modificar `site_operational_roles`;
- cambiar sede, turno o check-in real;
- cambiar dispositivo o estación;
- alterar RLS, permisos o sesiones;
- mover inventario, activos o recursos;
- ejecutar acciones como el rol, sede o área simulados.

```text
CAMBIO DE ÁREA SIMULADA
=
NUEVA EVALUACIÓN HIPOTÉTICA
≠
MUTACIÓN TERRITORIAL REAL
```

---

#### 23. Precedencia de decisión

```text
SOLICITANTE_REAL_INVÁLIDO
>
SIMULACIÓN_ANIDADA
>
ROL_OBJETIVO_INVÁLIDO
>
SEDE_OBJETIVO_INVÁLIDA
>
VERSIÓN_DE_ÁREA_INCOMPATIBLE
>
ÁREA_AUSENTE_O_INACTIVA
>
ÁREA_NO_PERTENECE_A_SEDE
>
FILA_AGREGADA_NO_EXACTA
>
AISLAMIENTO_NO_AUTORIZADO
>
ALCANCE_REAL_INSUFICIENTE
>
ROL_NO_COMPATIBLE_CON_ÁREA
>
VÍNCULO_DE_ÁREA_NO_RESUELTO
>
RECURSO_O_DISPOSITIVO_INCOMPATIBLE
>
REAUTENTICACIÓN_FALTANTE
>
OBJETIVO_DE_ÁREA_ACEPTADO
>
CONTEXTO_DE_ACCIÓN_INCOMPLETO
>
DEFAULT_DENY
```

Un área válida nunca neutraliza una denegación anterior.

---

#### 24. Razones mínimas estructuradas

| Razón                                      | Significado                                                         |
| ------------------------------------------ | ------------------------------------------------------------------- |
| `simulation_area_reference_incomplete`     | Falta un componente de la referencia exacta.                        |
| `simulation_area_not_found`                | El área no existe.                                                  |
| `simulation_area_inactive`                 | El área está inactiva o retirada.                                   |
| `simulation_area_ambiguous`                | ID, código o fuentes resuelven resultados incompatibles.            |
| `simulation_area_catalog_version_mismatch` | La versión solicitada no coincide con la evaluada.                  |
| `simulation_area_site_mismatch`            | El área no pertenece a la sede simulada.                            |
| `simulation_area_not_in_real_scope`        | El simulador no puede inspeccionar esa área.                        |
| `simulation_area_aggregate_not_exact`      | La fila representa un agregado y no una identidad operativa exacta. |
| `simulation_area_isolated_scope_missing`   | Falta cobertura independiente para el área aislada.                 |
| `simulation_area_strong_reauth_required`   | Falta reautenticación fuerte aplicable.                             |
| `simulation_role_not_allowed_at_area`      | El rol operativo no está vinculado al área exacta.                  |
| `simulation_role_area_binding_unresolved`  | Existe habilitación de sede, pero falta un `area_id` autoritativo.  |
| `simulation_area_required`                 | La acción o recurso exige área y no existe una exacta.              |
| `simulation_no_area_mode_invalid`          | Se utilizó ausencia de área para un escenario dependiente de área.  |
| `simulation_area_kind_not_exact_target`    | Se envió un tipo como si fuera área exacta.                         |
| `simulation_area_resource_mismatch`        | El área del recurso contradice el escenario.                        |
| `simulation_area_device_mismatch`          | El límite de área del dispositivo contradice el escenario.          |
| `simulation_area_context_incomplete`       | Falta turno u otro componente posterior obligatorio.                |

Los mensajes visibles aplicarán minimización y no revelarán áreas fuera del alcance real.

---

#### 25. Auditoría mínima

Todo intento permitido o denegado deberá conservar:

- `simulation_request_id`;
- actor, usuario, empleado y sesión reales;
- rol real del simulador;
- rol objetivo tipado y versiones;
- sede simulada exacta y versión;
- modo de área;
- `simulated_area_id`, código, tipo y clase cuando existan;
- versión del catálogo de áreas;
- alcance real utilizado;
- fuente de compatibilidad rol–sede–área;
- estado `EXACT_BINDING` o `AREA_BINDING_UNRESOLVED`;
- área de recurso, turno y dispositivo cuando existan;
- aislamiento evaluado;
- reautenticación exigida y evidencia referenciada;
- permiso, acción y recurso hipotéticos;
- resultado de área y resultado de acción;
- razones estructuradas;
- fecha, duración y correlación.

No almacenará secretos, tokens, credenciales, códigos de reautenticación ni payloads empresariales completos.

---

#### 26. Reconciliación con el estado físico observado

| Elemento                                                          |        Resultado | Estado documental                      |
| ----------------------------------------------------------------- | ---------------: | -------------------------------------- |
| Filas activas en `public.areas`                                   |               22 | `OBSERVADO`                            |
| Filas inactivas observadas                                        |                0 | `OBSERVADO`                            |
| Tipos activos en `public.area_kinds`                              |               16 | `OBSERVADO`                            |
| Áreas ordinarias exactas                                          |               18 | `SIMULABLE_CONDITIONAL`                |
| Área aislada exacta                                               |                1 | `ISOLATED_EXPLICIT_ONLY`               |
| Filas agregadas satélite                                          |                3 | `AGGREGATE_NOT_EXACT`                  |
| Habilitaciones activas en `site_operational_roles`                |               16 | Fuente física de compatibilidad actual |
| Habilitaciones con `area_id` exacto                               |               13 | `EXACT_BINDING`                        |
| Habilitaciones sin `area_id`                                      |                3 | `AREA_BINDING_UNRESOLVED`              |
| Sesiones en `context_simulation_sessions`                         |                0 | Sin evidencia de ejecución física      |
| Constraint compuesto que obligue `area.site_id = session.site_id` |     No observado | `PENDIENTE_DE_IMPLEMENTACION`          |
| Versionado físico específico de catálogo de áreas para simulación | No materializado | `PENDIENTE_DE_IMPLEMENTACION`          |

Brechas físicas conservadas:

1. `conductor_logistica` en `CENTRO_PROD` no tiene `area_id`;
2. `operador_integral_satelite` en `MOLKA_PRINCIPAL` no tiene `area_id`;
3. `gerencia_operativa` en `VENTO_GROUP` no tiene `area_id`;
4. `context_simulation_sessions` posee FKs independientes a sede y área, pero no una restricción compuesta observada que impida cruce de sede;
5. la fila general de Vento Café conserva código físico `GENERAL` en vez de la normalización histórica `todos`;
6. no existe evidencia física de versionado reproducible del catálogo para simulación.

Esta tarea no corrige esas brechas ni afirma que el contrato esté implementado.

---

#### 27. Límites de esta tarea

AUTH-SIM-004 no define:

- el estado completo del turno simulado;
- el estado completo del check-in simulado;
- duración o expiración de la simulación;
- interfaz final;
- persistencia definitiva;
- tablas, constraints, RLS, RPC o servicios nuevos;
- migraciones, backfills o normalización de datos;
- corrección de vínculos con `area_id` nulo;
- cambio del código `GENERAL`;
- creación o retiro de áreas;
- ejecución de simulaciones;
- pruebas operativas.

Estas responsabilidades permanecen en sus tareas canónicas.

---

#### 28. Handoff exacto a AUTH-SIM-005

`AUTH-SIM-005` deberá definir el turno simulado conservando:

1. sede y área exactas previamente aceptadas;
2. separación entre turno hipotético y turno real;
3. que el turno no puede inventar sede, área ni rol;
4. que el área del turno deberá coincidir con el escenario cuando sea obligatoria;
5. que un vínculo rol–área no resuelto impide `would_allow` reproducible;
6. que una fila agregada no puede poblar el área del turno;
7. que el punto físico de check-in permanece separado de sede y área;
8. que horario, vigencia, publicación y estado deben ser explícitos;
9. que el turno simulado no crea check-in ni autoridad real;
10. que toda incompatibilidad o dato faltante falla cerrado.

Esta tarea no anticipa decisiones de horario, publicación, vigencia ni check-in.

---

#### 29. Invariantes

1. Toda área exacta posee UUID, código, sede padre, tipo y versión.
2. El UUID es la identidad autoritativa.
3. El código solo es único dentro de su sede.
4. El nombre visible no autoriza.
5. El tipo de área no es un área exacta.
6. Un tipo no incorpora áreas futuras.
7. El área simulada pertenece a la sede simulada.
8. Un área de otra sede falla cerrado.
9. `null` no significa todas las áreas.
10. `NO_AREA_NOT_REQUIRED` exige un contrato realmente independiente de área.
11. Una acción dependiente de área sin área exacta no produce `would_allow`.
12. Existen 22 áreas activas observadas.
13. Existen 18 áreas ordinarias exactas.
14. Existen 13 áreas operativas ordinarias exactas.
15. Existen cinco áreas administrativas ordinarias exactas.
16. Existe un área aislada exacta.
17. Existen tres filas agregadas no exactas.
18. `general` no tiene una semántica universal.
19. `Todos` y `General` no son wildcards.
20. `APP-REVIEW/OPERACION` exige cobertura independiente.
21. `pickup_camioneta_principal` no permite inventar un área.
22. Existen 16 habilitaciones rol–sede activas observadas.
23. Trece poseen vínculo exacto de área.
24. Tres permanecen sin área resuelta.
25. Un área única visible no se infiere para un rol sin vínculo.
26. Dos roles pueden compartir área sin compartir permisos.
27. Un área administrativa no equivale a un rol base.
28. El área del dispositivo solo restringe.
29. El área del recurso debe ser coherente.
30. El turno no podrá sustituir el área objetivo.
31. Datos reales siguen gobernados por permisos reales.
32. Seleccionar un área no modifica asignaciones ni preferencias.
33. Seleccionar un área no modifica RLS ni permisos.
34. No existe simulación anidada.
35. Toda ambigüedad falla cerrado.
36. Toda evaluación ocurre en servidor.
37. Todo intento queda auditado con minimización.
38. La tarea siguiente permanece limitada a definir turno simulado.

---

#### Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se incorporan `TREQ-AUTH-099` a `TREQ-AUTH-108` en el Registro Canónico de Requisitos de Prueba.

| ID              | Regla protegida                                                                                                                                                                                                                                                                                                                               | Tipo                                                                | Prioridad | Momento de implementación                         | Destino                                                       |
| --------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------- | --------- | ------------------------------------------------- | ------------------------------------------------------------- |
| `TREQ-AUTH-099` | Toda área simulada exacta deberá resolverse mediante `simulated_site_id`, `simulated_area_id`, código, clase, `area_kind` y versiones compatibles; nombre, preferencia, área primaria, fila visible o valor enviado por cliente no podrán constituir identidad autoritativa.                                                                  | seguridad + contractual + integración + regresión                   | crítica   | Paquete que materialice el contrato de simulación | `AUTH-DB-013`; `AUTH-SRV-015`; `AUTH-QA-019`                  |
| `TREQ-AUTH-100` | El registro deberá cubrir exactamente 22 áreas activas: 18 áreas organizacionales ordinarias `SIMULABLE_CONDITIONAL`, un área aislada `ISOLATED_EXPLICIT_ONLY` y tres filas agregadas `AGGREGATE_NOT_EXACT`, sin faltantes, duplicados ni reclasificación por nombre.                                                                         | contractual + base de datos + estática + regresión                  | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-004`; `AUTH-DB-013`; `AUTH-QA-019`                  |
| `TREQ-AUTH-101` | Un área exacta deberá pertenecer a la sede simulada aceptada y estar activa en la versión autoritativa; un área de otra sede, inexistente, retirada, ambigua o con referencia contradictoria deberá fallar cerrado.                                                                                                                           | seguridad + base de datos + autorización + regresión                | crítica   | Paquete que materialice el contrato de simulación | `AUTH-DB-013`; `AUTH-SRV-015`; `AUTH-QA-019`                  |
| `TREQ-AUTH-102` | La compatibilidad operativa deberá usar los 13 vínculos exactos rol–sede–área observados. Los tres vínculos activos sin `area_id` permanecerán `AREA_BINDING_UNRESOLVED` y nunca podrán resolverse por rol, sede, nombre, área única o agregado `general`.                                                                                    | autorización + contexto + base de datos + integración + regresión   | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-004`; `AUTH-SIM-005`; `AUTH-SRV-015`; `AUTH-QA-019` |
| `TREQ-AUTH-103` | Las filas satélite de clase agregada —`MOLKA_PRINCIPAL/todos`, `SAUDO/todos` y `VENTO_CAFE/GENERAL`— no podrán poblar `simulated_area_id`, actuar como wildcard, representar todas las áreas ni producir autorización; una comparación amplia se expandirá a áreas exactas finitas.                                                           | seguridad + contractual + integración + regresión                   | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-004`; `AUTH-SRV-015`; `AUTH-QA-019`                 |
| `TREQ-AUTH-104` | `APP-REVIEW/OPERACION` solo podrá aceptarse junto con la sede aislada exacta, cobertura real independiente, justificación, minimización y reautenticación aplicable; `area_kind=general` no la mezclará con agregados productivos.                                                                                                            | seguridad + autenticación + autorización + E2E + regresión          | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-008`; `AUTH-SRV-015`; `AUTH-QA-019`                 |
| `TREQ-AUTH-105` | El modo `NO_AREA_NOT_REQUIRED` solo será válido cuando rol, permiso, acción y recurso no exijan área. Un escenario operativo o recurso con área obligatoria producirá `indeterminate` o `would_deny`, nunca `would_allow` ni fallback.                                                                                                        | contractual + contexto + autorización + E2E + regresión             | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-005`; `AUTH-SIM-006`; `AUTH-SRV-015`; `AUTH-QA-019` |
| `TREQ-AUTH-106` | Área de rol, área de turno, área de recurso, área de dispositivo y área seleccionada deberán permanecer separadas y ser coherentes cuando el contrato las exija; ninguna podrá sustituir o ampliar a las demás por inferencia.                                                                                                                | seguridad + autorización + contexto + integración + E2E + regresión | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-005`; `AUTH-SIM-006`; `AUTH-SRV-015`; `AUTH-QA-019` |
| `TREQ-AUTH-107` | Seleccionar, cambiar o comparar un área simulada no podrá modificar `employee_areas`, `employees.area_id`, `employee_settings.selected_area_id`, turnos, dispositivos, recursos, RLS, permisos, datos ni contexto real, ni revelar datos fuera del alcance real.                                                                              | seguridad + autorización + RLS + integración + E2E + regresión      | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-006`; `AUTH-SRV-015`; `AUTH-QA-019`                 |
| `TREQ-AUTH-108` | Toda evaluación de área deberá auditar identidad exacta, sede padre, clase, `area_kind`, versiones, alcance real, vínculo rol–área, coherencia con recurso y turno, resultado y razones; la reconciliación deberá conservar 22 áreas, 16 tipos, 16 vínculos rol–sede, 13 vínculos con área, tres sin área y cero sesiones físicas observadas. | contractual + auditoría + integración + estática + regresión        | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-004`; `AUTH-DB-013`; `AUTH-SRV-015`; `AUTH-QA-019`  |

---

#### 30. Criterios de aceptación

- [x] Se distinguió el área simulada de todas las áreas reales y derivadas.
- [x] Se definieron dos modos explícitos de objetivo.
- [x] Se exigieron identidad exacta, sede padre, tipo, clase y versiones.
- [x] Se materializaron 22 decisiones de áreas activas.
- [x] Se clasificaron 18 áreas ordinarias exactas.
- [x] Se clasificó un área aislada exacta.
- [x] Se bloquearon tres filas agregadas como objetivo exacto.
- [x] Se cubrieron 16 `area_kinds` activos.
- [x] Se materializaron 13 vínculos rol–sede–área exactos.
- [x] Se conservaron tres vínculos sin área como `AREA_BINDING_UNRESOLVED`.
- [x] Se prohibieron inferencias desde sede, rol, nombre, área única o agregado.
- [x] Se separaron áreas operativas y administrativas.
- [x] Se preservó el aislamiento de `APP-REVIEW/OPERACION`.
- [x] Se definió ausencia legítima de área.
- [x] Se exigió coherencia con recurso, turno y dispositivo.
- [x] Se preservó el alcance real como límite superior.
- [x] Se preservó la minimización de datos.
- [x] Se prohibieron todas las mutaciones reales.
- [x] Se definieron precedencia y razones estructuradas.
- [x] Se definió auditoría mínima.
- [x] Se reconciliaron las brechas físicas sin modificarlas.
- [x] Se generaron `TREQ-AUTH-099` a `TREQ-AUTH-108`.
- [x] No se modificó código, Supabase, migraciones, RLS, RPC, configuración, datos, sedes, áreas, asignaciones, turnos, sesiones, dispositivos ni permisos.
- [x] `AUTH-SIM-005` permanece únicamente reservada.

---

#### 31. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-SIM-003 — Definir sede simulada`

**TAREA ACTUAL APROBADA**
`AUTH-SIM-004 — Definir área simulada`

**SIGUIENTE TAREA RESERVADA**
`AUTH-SIM-005 — Definir turno simulado`


### ✅ AUTH-SIM-005 — Definir turno simulado

**Estado:** APROBADA
**Tarea anterior:** `AUTH-SIM-004 — Definir área simulada` — APROBADA
**Tarea siguiente:** `AUTH-SIM-006 — No mezclar permisos reales y simulados` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de elegibilidad temporal del turno simulado, registro materializado de estados de turno y reconciliación con la estructura física observada
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Q_SIMULACION/01_CONTEXTO_Y_ALCANCE_SIMULADO.md`
**Artefactos producidos:** `SIMULATED-SHIFT-ELIGIBILITY-CONTRACT-001`, `SIMULATED-SHIFT-STATE-REGISTER-001` y `SIMULATED-SHIFT-PHYSICAL-RECONCILIATION-001`
**Decisiones y contratos consumidos:** `AUTH-MOD-005`, `AUTH-MOD-006`, `AUTH-MOD-009`, `AUTH-MOD-010`, `AUTH-MOD-012`, `AUTH-CAT-012`, `AUTH-CAT-013`, `AUTH-CTX-010`, `AUTH-CTX-011`, `AUTH-SIM-001` a `AUTH-SIM-004`, catálogo operativo vigente y estado físico observado de `public.employee_shifts`, `public.context_simulation_sessions`, `public.operational_roles`, `public.site_operational_roles`, `public.sites`, `public.areas`, `public.attendance_logs`, `public.shift_policy` y `public.attendance_policy`
**Cambios en código, Supabase, migraciones, RLS, RPC, configuración, datos, turnos, horarios, publicaciones, asistencia, sesiones, permisos o aplicaciones:** no autorizados

---

#### 1. Propósito

Definir exactamente qué estado de turno puede incorporarse a una simulación de contexto de autorización, sin confundir:

- turno simulado con turno real del solicitante;
- turno hipotético con fila persistida;
- turno publicado con turno vigente;
- turno vigente con turno activo;
- turno activo con permiso efectivo;
- confirmación del trabajador con publicación;
- horario local con intervalo absoluto;
- sede del turno con punto físico de check-in;
- área del turno con área seleccionada;
- rol asignado al turno con rol base;
- ausencia de turno con un dato desconocido;
- check-in simulado con check-in real;
- evaluación retrospectiva con autoridad retroactiva.

```text
TURNO SIMULADO
≠
TURNO REAL DEL SIMULADOR
≠
FILA REAL MODIFICADA
≠
CHECK-IN REAL
≠
PERMISO EJECUTABLE
```

El turno simulado es un componente temporal hipotético utilizado para explicar cómo se evaluaría un permiso. Nunca crea una jornada, una publicación, una marcación, una sesión operativa ni autoridad empresarial real.

---

#### 2. Resultado material

Se aprueban:

1. `SIMULATED-SHIFT-ELIGIBILITY-CONTRACT-001`, que define modos de objetivo, identidad, publicación, revisión, estado, horario absoluto, zona horaria, vigencia, rol, sede, área, check-in hipotético, prerrequisitos, precedencia, razones, auditoría y comportamiento fail closed;
2. `SIMULATED-SHIFT-STATE-REGISTER-001`, que materializa una decisión para quince escenarios canónicos de turno y evita que los consumidores reconstruyan estados permisivos por inferencia;
3. `SIMULATED-SHIFT-PHYSICAL-RECONCILIATION-001`, que documenta la estructura y distribución física observadas sin convertir datos legacy en contrato implementado ni modificar el estado desplegado.

Cobertura materializada:

| Resultado                                                 | Cantidad |
| --------------------------------------------------------- | -------: |
| Modos de objetivo de turno                                |        3 |
| Escenarios de estado con decisión explícita               |       15 |
| Prerrequisitos operativos reconciliados                   |        3 |
| Estados hipotéticos de check-in asociados                 |        5 |
| Ejes temporales separados                                 |        2 |
| Zona horaria organizacional vigente documentada           |        1 |
| Filas físicas de `employee_shifts` observadas             |     2844 |
| Filas publicadas observadas                               |     2723 |
| Filas no publicadas observadas                            |      121 |
| Turnos laborales observados                               |     2411 |
| Descansos observados                                      |      433 |
| Candidatos vigentes en el snapshot controlado             |        8 |
| Empleados con más de un candidato vigente en ese snapshot |        0 |
| Sesiones físicas de simulación observadas                 |        0 |
| Fallbacks o conversiones implícitas aprobados             |        0 |
| Turnos simulados capaces de autorizar una acción real     |        0 |

---

#### 3. Base normativa heredada

La tarea conserva íntegramente que:

- el solicitante debe superar `AUTH-SIM-001` desde su identidad, sesión, permisos y alcance reales;
- el rol objetivo debe superar `AUTH-SIM-002` mediante identidad tipada y versiones compatibles;
- la sede objetivo debe superar `AUTH-SIM-003` como sede exacta o ausencia territorial legítima;
- el área objetivo debe superar `AUTH-SIM-004` como área exacta, ausencia permitida o bloqueo explícito;
- el rol operativo efectivo real proviene exclusivamente de un turno válido;
- un perfil operativo, rol base, dispositivo, área seleccionada o nombre de oficio no reemplazan al turno;
- publicación, vigencia, check-in, ejecución y resultado son dimensiones distintas;
- la confirmación del trabajador es informativa y no participa en autorización;
- un permiso operativo puede exigir `T` o `T+C`; un permiso base usa `N`;
- una simulación solo produce `would_allow`, `would_deny` o `indeterminate`;
- ninguna simulación modifica la sesión, el turno, la asistencia o el contexto real;
- el acceso a datos reales continúa gobernado por la autoridad real del simulador;
- toda ambigüedad o incompatibilidad falla cerrado.

---

#### 4. Identidades y tiempos separados

| Identidad o tiempo             | Función                                                | Autoridad                         |
| ------------------------------ | ------------------------------------------------------ | --------------------------------- |
| `simulation_request_id`        | Solicitud inmutable que agrupa el escenario            | No concede autoridad              |
| `simulated_shift_reference`    | Identidad sintética del turno hipotético               | No es `shift_id` real             |
| `source_shift_id`              | Fila real consultada cuando el modo es exacto          | Solo referencia; no se modifica   |
| `published_revision_reference` | Revisión o snapshot autoritativo utilizado             | Exige reproducibilidad            |
| `simulated_resolved_at`        | Instante hipotético en el que se evalúa la vigencia    | No cambia el reloj real           |
| `evaluated_at`                 | Instante real en que el servidor ejecuta la evaluación | Auditoría, no contexto hipotético |
| `simulated_starts_at`          | Inicio absoluto del turno hipotético                   | Límite temporal                   |
| `simulated_ends_at`            | Fin absoluto del turno hipotético                      | Límite temporal                   |
| `real_active_shift_id`         | Turno real del actor, cuando exista                    | Permanece separado                |
| `simulated_checkin_state`      | Estado hipotético asociado al mismo turno simulado     | No crea asistencia real           |
| `real_active_checkin_id`       | Sesión real de asistencia, cuando exista               | No se presta al escenario         |

```text
simulated_resolved_at
≠
evaluated_at
```

```text
simulated_shift_reference
≠
real_active_shift_id
```

```text
simulated_checkin_state
≠
real_active_checkin_id
```

---

#### 5. Modos contractuales de objetivo

```ts
type SimulatedShiftTarget =
  | {
      mode: "NO_SHIFT";
      simulated_shift_reference: null;
      source_shift_id: null;
      published_revision_reference: null;
      row_fingerprint: null;
      simulated_resolved_at: string;
      timezone: string;
      shift_contract_version: string;
    }
  | {
      mode: "HYPOTHETICAL_SHIFT";
      simulated_shift_reference: string;
      source_shift_id: null;
      published_revision_reference: string;
      row_fingerprint: string;
      simulated_shift_kind: "LABORAL" | "DESCANSO";
      simulated_publication_state:
        | "DRAFT"
        | "PUBLISHED"
        | "WITHDRAWN";
      simulated_shift_status:
        | "SCHEDULED"
        | "CONFIRMED"
        | "COMPLETED"
        | "CANCELLED"
        | "NO_SHOW";
      simulated_starts_at: string;
      simulated_ends_at: string;
      simulated_resolved_at: string;
      simulated_site_id: string;
      simulated_area_id: string | null;
      simulated_operational_role_code: string;
      timezone: string;
      shift_contract_version: string;
      role_catalog_version: string;
      site_catalog_version: string;
      area_catalog_version: string;
    }
  | {
      mode: "EXACT_PUBLISHED_SHIFT";
      simulated_shift_reference: string;
      source_shift_id: string;
      published_revision_reference: string;
      row_fingerprint: string;
      simulated_shift_kind: "LABORAL" | "DESCANSO";
      simulated_publication_state: "PUBLISHED" | "WITHDRAWN";
      simulated_shift_status:
        | "SCHEDULED"
        | "CONFIRMED"
        | "COMPLETED"
        | "CANCELLED"
        | "NO_SHOW";
      simulated_starts_at: string;
      simulated_ends_at: string;
      simulated_resolved_at: string;
      simulated_site_id: string;
      simulated_area_id: string | null;
      simulated_operational_role_code: string;
      timezone: string;
      shift_contract_version: string;
      role_catalog_version: string;
      site_catalog_version: string;
      area_catalog_version: string;
    };
```

Reglas:

1. `NO_SHIFT` es una declaración positiva de ausencia de turno, no un error ni un valor desconocido;
2. `HYPOTHETICAL_SHIFT` utiliza una identidad sintética y no puede recibir un `shift_id` real como si fuera propio;
3. `EXACT_PUBLISHED_SHIFT` exige una fila real, una revisión o snapshot reproducible y un fingerprint íntegro;
4. ningún modo admite un `shift_id`, horario, sede, área, rol o estado enviado por cliente como fuente autoritativa sin validación de servidor;
5. una referencia exacta sin revisión o fingerprint no puede reproducir una decisión histórica confiable;
6. `null`, una única fila visible, el último turno o el turno real del simulador no se transforman automáticamente en objetivo;
7. el modo y sus versiones quedan fijados en cada evaluación.

---

#### 6. Estado hipotético de check-in asociado

El turno simulado podrá incorporar exclusivamente uno de estos estados explicativos:

```ts
type SimulatedCheckinState =
  | "NOT_APPLICABLE"
  | "ABSENT"
  | "ACTIVE_HYPOTHETICAL"
  | "CLOSED_HYPOTHETICAL"
  | "INVALID_HYPOTHETICAL";
```

Reglas:

1. `NOT_APPLICABLE` solo procede cuando el permiso no usa el carril operativo o su prerrequisito no exige check-in;
2. `ABSENT` representa que el turno no posee check-in hipotético activo;
3. `ACTIVE_HYPOTHETICAL` exige el mismo turno, actor hipotético, sede y ventana compatibles;
4. `CLOSED_HYPOTHETICAL` no satisface `T+C`;
5. `INVALID_HYPOTHETICAL` bloquea el carril operativo, incluso cuando el permiso solo exige `T`, porque existe una contradicción contextual explícita;
6. un check-in real no puede completar un turno simulado;
7. el estado hipotético no crea filas en `attendance_logs`, sesiones de asistencia, geocercas ni eventos;
8. el punto físico hipotético de marcación, cuando exista, permanece separado de la sede organizacional del turno.

---

#### 7. Contrato conceptual

```ts
type SimulatedShiftEligibilityInput = {
  simulation_request_id: string;
  simulator_actor_id: string;
  real_session_id: string;
  simulated_role_kind: "BASE" | "OPERATIONAL";
  simulated_role_code: string;
  simulated_site_id: string | null;
  simulated_area_id: string | null;
  shift_target: SimulatedShiftTarget;
  simulated_checkin_state: SimulatedCheckinState;
  simulated_checkin_point_id: string | null;
  target_permission_key: string | null;
  target_action: string | null;
  target_resource_reference: string | null;
  strong_reauth_evidence_id: string | null;
};
```

```ts
type SimulatedShiftEligibilityResult = {
  accepted: boolean;
  decision:
    | "NO_SHIFT_ACCEPTED"
    | "SIMULABLE_CONDITIONAL"
    | "NOT_PUBLISHED"
    | "PUBLISHED_NOT_CURRENT"
    | "NOT_LABORAL"
    | "TERMINAL_STATE"
    | "WITHDRAWN"
    | "INDETERMINATE_REPLAY"
    | "AMBIGUOUS"
    | "DENY";
  shift_prerequisite_satisfied: boolean;
  checkin_prerequisite_satisfied: boolean | null;
  exact_shift_resolved: boolean;
  publication_resolved: boolean;
  currently_valid: boolean;
  role_site_area_coherent: boolean;
  reproducible_snapshot: boolean;
  simulated_decision:
    | "would_allow"
    | "would_deny"
    | "indeterminate"
    | null;
  reason_codes: string[];
  evaluated_shift_contract_version: string;
  evaluated_at: string;
};
```

La implementación física podrá normalizar estas formas sin perder modo, identidad, revisión, fingerprint, tiempos absolutos, zona horaria, publicación, estado, rol, sede, área, check-in hipotético, versiones, razones ni separación respecto del contexto real.

---

#### 8. Fórmula de elegibilidad temporal

```text
SOLICITANTE ELEGIBLE SEGÚN AUTH-SIM-001
∩
ROL OBJETIVO VÁLIDO SEGÚN AUTH-SIM-002
∩
SEDE OBJETIVO ACEPTADA SEGÚN AUTH-SIM-003
∩
ÁREA OBJETIVO ACEPTADA O AUSENCIA VÁLIDA SEGÚN AUTH-SIM-004
∩
MODO DE TURNO EXPLÍCITO
∩
PUBLICACIÓN Y REVISIÓN REPRODUCIBLES CUANDO APLIQUEN
∩
INTERVALO ABSOLUTO VÁLIDO
∩
ESTADO DE TURNO COMPATIBLE
∩
ROL, SEDE Y ÁREA COHERENTES
∩
CHECK-IN HIPOTÉTICO COMPATIBLE CUANDO APLIQUE
∩
AUSENCIA DE DENEGACIONES
=
OBJETIVO TEMPORAL ACEPTADO
```

Aceptar el objetivo temporal no produce automáticamente `would_allow`. El permiso, la modalidad, el prerrequisito, el recurso, el alcance y las denegaciones continúan gobernando la decisión hipotética.

---

#### 9. Ejes temporales y zona horaria

La evaluación conservará dos tiempos independientes:

```text
simulated_resolved_at
→ instante hipotético del escenario

evaluated_at
→ instante real de ejecución y auditoría
```

Reglas:

1. ambos valores serán timestamps absolutos ISO 8601;
2. `simulated_resolved_at` será validado en servidor y quedará incluido en el fingerprint;
3. el reloj, zona horaria o locale del navegador no son autoritativos;
4. para la operación vigente de Vento Group se utiliza `America/Bogota`;
5. una futura operación multizona exigirá una fuente versionada por sede antes de cambiar esta regla;
6. cambiar el instante simulado crea una evaluación nueva, no extiende un turno real;
7. una evaluación retrospectiva no crea autoridad retroactiva;
8. una evaluación futura no reserva ni publica un turno.

---

#### 10. Intervalo temporal

La vigencia del turno se evalúa mediante intervalo semiabierto:

```text
simulated_starts_at <= simulated_resolved_at < simulated_ends_at
```

Consecuencias:

- el turno comienza exactamente en `simulated_starts_at`;
- deja de ser vigente exactamente en `simulated_ends_at`;
- dos turnos consecutivos pueden tocarse sin solaparse;
- no se aplican minutos de gracia implícitos;
- la ventana de check-in puede ser distinta, pero no cambia la vigencia del turno;
- `show_end_as_close` es presentación y no altera el intervalo;
- `simulated_ends_at` deberá ser posterior a `simulated_starts_at`.

##### 10.1 Cruce de medianoche

Cuando la hora local de fin sea menor o igual que la hora de inicio y el turno permita cruce nocturno, el fin pertenece al día calendario siguiente.

```text
inicio local: 2026-08-03 22:00
fin local:    2026-08-04 06:00
```

La evaluación a las `2026-08-04 02:00 America/Bogota` permanece dentro del turno.

No se filtrará únicamente por la fecha calendario de `simulated_resolved_at`.

---

#### 11. Publicación y revisión

Una fila o escenario no satisface el prerrequisito de turno solo por contener horario, sede, área y rol.

```text
DRAFT
→ no satisface T ni T+C
```

```text
PUBLISHED
+
revisión autoritativa
+
publicación efectiva en o antes de simulated_resolved_at
→ puede continuar la evaluación
```

```text
WITHDRAWN
→ no satisface T ni T+C
```

Reglas:

1. publicación y estado se evalúan por separado;
2. `CONFIRMED` no crea, extiende ni bloquea vigencia;
3. una publicación posterior al inicio no autoriza el periodo anterior a `published_at`;
4. un borrador posterior no modifica la revisión publicada vigente;
5. no se mezclan campos de revisiones distintas;
6. una revisión retirada no se utiliza por fallback;
7. dos revisiones publicadas simultáneas sin precedencia inequívoca producen `AMBIGUOUS`;
8. el modo exacto exige una revisión o snapshot persistible y un fingerprint;
9. el esquema físico legacy que solo ofrece `published_at` no se presenta como versionado completo.

---

#### 12. Estados operables y terminales

##### 12.1 Estados que pueden continuar

```text
SCHEDULED
CONFIRMED
```

Ambos se tratan de forma equivalente respecto de la autorización. `CONFIRMED` solo conserva una señal informativa de reconocimiento.

##### 12.2 Estados que no satisfacen turno vigente

```text
COMPLETED
CANCELLED
NO_SHOW
WITHDRAWN
```

Un estado desconocido, vacío o contradictorio produce `DENY`.

##### 12.3 Tipo de turno

Solo `LABORAL` puede satisfacer `T` o `T+C`.

`DESCANSO` puede formar parte de una vista de calendario explicativa, pero no crea rol operativo, área operativa, check-in activo ni autoridad.

---

#### 13. Registro materializado de estados

`SIMULATED-SHIFT-STATE-REGISTER-001` cubre los siguientes escenarios:

|    # | Escenario                                  | Condiciones principales                                                   | Decisión de turno       | Satisface `T` | Regla                                                                                       |
| ---: | ------------------------------------------ | ------------------------------------------------------------------------- | ----------------------- | ------------: | ------------------------------------------------------------------------------------------- |
|    1 | `NO_SHIFT`                                 | Ausencia declarada explícitamente                                         | `NO_SHIFT_ACCEPTED`     |            No | Permite explicar denegación o evaluar un permiso `N`; no es dato desconocido.               |
|    2 | `HYPOTHETICAL_DRAFT`                       | Horario completo, pero publicación `DRAFT`                                | `NOT_PUBLISHED`         |            No | Un borrador no habilita operación.                                                          |
|    3 | `HYPOTHETICAL_PUBLISHED_FUTURE`            | Publicado; `simulated_resolved_at < starts_at`                            | `PUBLISHED_NOT_CURRENT` |            No | Un turno futuro no autoriza antes de iniciar.                                               |
|    4 | `HYPOTHETICAL_PUBLISHED_CURRENT_SCHEDULED` | Laboral, publicado, `SCHEDULED`, dentro del intervalo, contexto coherente | `SIMULABLE_CONDITIONAL` |            Sí | Puede satisfacer el prerrequisito de turno; aún exige permiso y demás controles.            |
|    5 | `HYPOTHETICAL_PUBLISHED_CURRENT_CONFIRMED` | Igual al anterior con estado `CONFIRMED`                                  | `SIMULABLE_CONDITIONAL` |            Sí | La confirmación no amplía ni reduce la decisión.                                            |
|    6 | `HYPOTHETICAL_PUBLISHED_ENDED`             | `simulated_resolved_at >= ends_at`                                        | `PUBLISHED_NOT_CURRENT` |            No | El fin temporal revoca el prerrequisito aunque el estado físico siga `SCHEDULED`.           |
|    7 | `HYPOTHETICAL_REST_CURRENT`                | Tipo `DESCANSO` dentro del intervalo                                      | `NOT_LABORAL`           |            No | No crea contexto operativo.                                                                 |
|    8 | `HYPOTHETICAL_CANCELLED`                   | Estado `CANCELLED`                                                        | `TERMINAL_STATE`        |            No | El horario no neutraliza la cancelación.                                                    |
|    9 | `HYPOTHETICAL_NO_SHOW`                     | Estado `NO_SHOW`                                                          | `TERMINAL_STATE`        |            No | No se convierte en turno activo.                                                            |
|   10 | `HYPOTHETICAL_COMPLETED`                   | Estado `COMPLETED`                                                        | `TERMINAL_STATE`        |            No | Un turno terminado no es vigente.                                                           |
|   11 | `HYPOTHETICAL_WITHDRAWN`                   | Revisión retirada                                                         | `WITHDRAWN`             |            No | No se reutiliza una revisión retirada.                                                      |
|   12 | `EXACT_VERSIONED_CURRENT`                  | Fila exacta, revisión y fingerprint reproducibles, laboral y vigente      | `SIMULABLE_CONDITIONAL` |            Sí | Puede utilizarse como escenario exacto sin modificar la fila.                               |
|   13 | `EXACT_LEGACY_UNVERSIONED`                 | Fila exacta sin revisión o snapshot reproducible                          | `INDETERMINATE_REPLAY`  |            No | Puede mostrarse como evidencia actual, pero no afirmar una decisión histórica reproducible. |
|   14 | `AMBIGUOUS_MULTIPLE_CANDIDATES`            | Dos o más candidatos vigentes aplicables                                  | `AMBIGUOUS`             |            No | No se elige primero, último, confirmado ni coincidente por UI.                              |
|   15 | `INVALID_CONTEXT_REFERENCE`                | Rol, sede, área, tiempos o versiones ausentes o incompatibles             | `DENY`                  |            No | Toda contradicción falla cerrado.                                                           |

Totales:

```text
15 escenarios materializados
3 escenarios capaces de satisfacer T bajo contrato completo
12 escenarios que no satisfacen T
0 escenarios que autorizan una acción real
```

Los tres escenarios capaces de satisfacer `T` son los números 4, 5 y 12. Su aceptación continúa condicionada al permiso, recurso, alcance, check-in cuando corresponda y ausencia de denegaciones.

---

#### 14. Coherencia con rol, sede y área

Para un turno simulado operativo deberán cumplirse simultáneamente:

```text
shift.simulated_operational_role_code
=
rol operativo objetivo aceptado
```

```text
shift.simulated_site_id
=
sede simulada exacta aceptada
```

```text
shift.simulated_area_id
=
área simulada exacta aceptada
```

cuando el rol o permiso exija área.

Reglas:

1. el turno no puede inventar un rol que `AUTH-SIM-002` bloqueó;
2. el turno no puede cambiar la sede aceptada por `AUTH-SIM-003`;
3. el turno no puede utilizar un área de otra sede;
4. las filas agregadas `Todos` o `General` no pueden poblar el área operativa exacta;
5. un vínculo rol–área `AREA_BINDING_UNRESOLVED` no se completa con un área visible, única o preferida;
6. un rol site-wide solo puede omitir área cuando su contrato exacto lo permita;
7. `null` no significa todas las áreas;
8. el punto físico de check-in no sustituye a la sede ni al área del turno;
9. una incoherencia entre turno y recurso produce `would_deny`;
10. una incoherencia estructural anterior produce `DENY` antes de evaluar el permiso.

---

#### 15. Prerrequisitos `N`, `T` y `T+C`

##### 15.1 `N`

```text
turno no requerido
check-in no requerido
```

El estado del turno simulado no concede ni bloquea por ese prerrequisito. Continúan aplicando permiso, alcance, recurso, sensibilidad y denegaciones.

##### 15.2 `T`

```text
turno simulado laboral, publicado, vigente, único y coherente
+
check-in no requerido
```

Puede satisfacer el prerrequisito de turno.

No obstante, un `INVALID_HYPOTHETICAL` explícito en el check-in bloquea el carril por inconsistencia contextual; no se ignora silenciosamente.

##### 15.3 `T+C`

```text
turno simulado válido
+
ACTIVE_HYPOTHETICAL para el mismo turno
```

Ambos son obligatorios.

```text
turno válido + ABSENT
→ would_deny
```

```text
turno válido + estado de check-in desconocido
→ indeterminate
```

```text
NO_SHIFT + ACTIVE_HYPOTHETICAL
→ DENY
```

Queda prohibida la combinación check-in activo sin turno válido.

---

#### 16. Check-in físico, geocerca y sede operativa

El turno conserva separados:

| Campo                        | Función                                          |
| ---------------------------- | ------------------------------------------------ |
| `simulated_site_id`          | Sede organizacional del turno                    |
| `simulated_area_id`          | Área operativa del turno cuando aplica           |
| `simulated_checkin_point_id` | Punto físico hipotético admitido por la política |
| `simulated_checkin_state`    | Estado explicativo de presencia                  |

`pickup_camioneta_principal` u otro punto físico solo puede aparecer en `simulated_checkin_point_id` cuando una política lo admita. No puede:

- sustituir `simulated_site_id`;
- crear un área;
- cambiar el rol;
- conceder cobertura territorial;
- convertir una sede no laboral en sede de turno;
- activar por sí solo `T+C`.

---

#### 17. Modo exacto y reproducibilidad

`EXACT_PUBLISHED_SHIFT` deberá fijar como mínimo:

- `source_shift_id`;
- revisión publicada o snapshot inmutable;
- fingerprint de todos los campos relevantes;
- actor o sujeto hipotético;
- sede, área y rol exactos;
- tipo y estado;
- publicación efectiva;
- inicio, fin y zona horaria;
- `simulated_resolved_at`;
- versiones de catálogos y políticas.

El fingerprint deberá cambiar cuando cambie cualquiera de esos componentes.

El estado físico observado no posee una entidad explícita de revisión publicada para `employee_shifts`. Por tanto:

```text
shift_id + published_at
≠
versionado completo reproducible
```

Una implementación futura podrá producir un snapshot firmado o persistido sin modificar la fila original. Hasta entonces, una reproducción histórica sin snapshot se clasifica `INDETERMINATE_REPLAY`.

---

#### 18. Selección y ambigüedad

Para un sujeto y un instante simulados deberá existir como máximo un turno exacto aplicable cuando el modo dependa de datos reales.

```text
0 candidatos
→ NO_SHIFT o referencia ausente, según el modo declarado
```

```text
1 candidato válido
→ continuar
```

```text
2 o más candidatos
→ AMBIGUOUS
→ DENY
```

No se resolverá por:

- orden físico de filas;
- fecha de creación;
- turno más reciente;
- turno confirmado;
- sede seleccionada;
- check-in existente;
- rol más específico;
- coincidencia parcial de área;
- valor recordado en cliente.

---

#### 19. Datos reales y minimización

El turno simulado no concede acceso a información laboral, operativa o personal adicional.

La vista podrá utilizar:

- metadatos del turno que el simulador real pueda consultar;
- un snapshot mínimo autorizado;
- datos sintéticos;
- estructuras vacías;
- datos anonimizados;
- razones minimizadas.

No podrá revelar por la sola selección del turno:

- nombres o documentos de trabajadores fuera del alcance real;
- asistencia detallada;
- ubicación o geocercas históricas;
- horarios de terceros no autorizados;
- información de otra sede o área;
- costos, ventas, inventario o producción;
- secretos, tokens o credenciales;
- payloads completos de auditoría.

Cuando la evaluación necesite un dato que el actor real no puede consultar, el servidor podrá utilizarlo internamente para decidir, pero la respuesta visible deberá minimizarlo.

---

#### 20. Prohibición de mutaciones

Crear, cambiar, comparar o cerrar un turno simulado no podrá:

- insertar, actualizar, cancelar, retirar o eliminar `employee_shifts`;
- establecer o cambiar `published_at` o `published_by`;
- crear revisiones reales;
- modificar horario, sede, área o rol de un turno real;
- crear check-in, check-out, descansos o eventos de asistencia;
- modificar `context_simulation_sessions` como sustituto de un contrato aprobado de persistencia;
- iniciar o terminar una sesión operativa real;
- cambiar el turno real del actor;
- modificar permisos, RLS, asignaciones o dispositivos;
- ejecutar acciones empresariales;
- emitir notificaciones como el sujeto simulado;
- producir autoridad retroactiva o futura.

```text
CAMBIO DE TURNO SIMULADO
=
NUEVA EVALUACIÓN HIPOTÉTICA
≠
CAMBIO DE PROGRAMACIÓN REAL
```

---

#### 21. Precedencia de decisión

```text
SOLICITANTE_REAL_INVÁLIDO
>
SIMULACIÓN_ANIDADA
>
ROL_OBJETIVO_INVÁLIDO
>
SEDE_OBJETIVO_INVÁLIDA
>
ÁREA_OBJETIVO_INVÁLIDA
>
VERSIÓN_DE_TURNO_INCOMPATIBLE
>
REFERENCIA_DE_TURNO_INCOMPLETA
>
REVISIÓN_O_FINGERPRINT_NO_REPRODUCIBLE
>
PUBLICACIÓN_INVÁLIDA
>
TIPO_NO_LABORAL
>
ESTADO_TERMINAL_O_RETIRO
>
INTERVALO_INVÁLIDO
>
TURNO_NO_VIGENTE
>
MÚLTIPLES_CANDIDATOS
>
INCOHERENCIA_ROL_SEDE_ÁREA
>
CHECKIN_HIPOTÉTICO_INCOMPATIBLE
>
PRERREQUISITO_ACEPTADO
>
CONTEXTO_DE_ACCIÓN_INCOMPLETO
>
DEFAULT_DENY
```

Un turno temporalmente válido nunca neutraliza una denegación anterior.

---

#### 22. Razones mínimas estructuradas

| Razón                                           | Significado                                                        |
| ----------------------------------------------- | ------------------------------------------------------------------ |
| `simulation_shift_mode_invalid`                 | El modo no es reconocido o contradice los campos presentes.        |
| `simulation_shift_reference_incomplete`         | Falta identidad, revisión, fingerprint o componente obligatorio.   |
| `simulation_shift_not_found`                    | El turno exacto no existe en la fuente autoritativa.               |
| `simulation_shift_revision_unresolved`          | No existe revisión o snapshot reproducible.                        |
| `simulation_shift_fingerprint_mismatch`         | El contenido actual no coincide con el snapshot evaluado.          |
| `simulation_shift_contract_version_mismatch`    | La versión solicitada no coincide con la evaluada.                 |
| `simulation_shift_not_published`                | El escenario permanece en borrador.                                |
| `simulation_shift_published_after_resolved_at`  | La publicación no era efectiva en el instante hipotético.          |
| `simulation_shift_withdrawn`                    | La revisión fue retirada.                                          |
| `simulation_shift_not_laboral`                  | El tipo no crea contexto operativo.                                |
| `simulation_shift_terminal_state`               | El turno está completado, cancelado o marcado no-show.             |
| `simulation_shift_interval_invalid`             | Fin, inicio o zona horaria no producen un intervalo válido.        |
| `simulation_shift_not_current`                  | El instante queda antes del inicio o en/después del fin.           |
| `simulation_shift_ambiguous`                    | Existen múltiples candidatos o revisiones incompatibles.           |
| `simulation_shift_role_mismatch`                | El rol del turno contradice el objetivo aceptado.                  |
| `simulation_shift_site_mismatch`                | La sede del turno contradice la sede simulada.                     |
| `simulation_shift_area_mismatch`                | El área contradice la sede o el área simulada.                     |
| `simulation_shift_area_required`                | Falta área exacta donde el contrato la exige.                      |
| `simulation_shift_aggregate_area_not_allowed`   | Se intentó utilizar una fila agregada como área operativa.         |
| `simulation_shift_role_area_binding_unresolved` | El vínculo rol–área no permite una decisión reproducible.          |
| `simulation_shift_required`                     | El permiso exige `T` o `T+C` y no existe turno válido.             |
| `simulation_checkin_required`                   | El permiso exige `T+C` y falta check-in hipotético activo.         |
| `simulation_checkin_without_shift`              | Existe check-in hipotético activo sin turno válido.                |
| `simulation_checkin_shift_mismatch`             | El check-in hipotético corresponde a otro turno.                   |
| `simulation_checkin_site_mismatch`              | El punto o sede de marcación contradicen la política.              |
| `simulation_shift_target_accepted`              | El turno puede utilizarse para continuar la evaluación hipotética. |

Los mensajes visibles aplicarán minimización y no revelarán turnos, horarios, trabajadores o controles fuera del alcance real del actor.

---

#### 23. Auditoría mínima

Toda selección, cambio, comparación o bloqueo deberá registrar:

- `simulation_request_id`;
- actor, usuario, empleado y sesión reales;
- rol objetivo tipado;
- sede y área simuladas;
- modo de turno;
- referencia sintética y `source_shift_id` cuando exista;
- revisión o snapshot;
- fingerprint;
- tipo, estado y publicación;
- inicio, fin, zona horaria y `simulated_resolved_at`;
- `evaluated_at` real;
- rol, sede y área del turno;
- estado de check-in hipotético y punto físico cuando exista;
- prerrequisito `N`, `T` o `T+C` evaluado;
- permiso, acción y recurso hipotéticos;
- versiones de catálogos, contrato y políticas;
- resultado y razones estructuradas;
- correlación y duración de la evaluación.

No almacenará secretos, tokens, PIN, coordenadas innecesarias, payloads completos de asistencia ni datos personales no requeridos.

---

#### 24. Reconciliación con el estado físico observado

La inspección de solo lectura del estado desplegado produjo:

| Elemento                                                             | Resultado observado | Decisión documental                                                          |
| -------------------------------------------------------------------- | ------------------: | ---------------------------------------------------------------------------- |
| Filas totales en `employee_shifts`                                   |                2844 | Inventario físico; no equivale a escenarios simulables.                      |
| Filas con `published_at`                                             |                2723 | Evidencia legacy de publicación; no constituye revisión versionada completa. |
| Filas sin `published_at`                                             |                 121 | Borradores o filas no publicadas; no satisfacen `T`.                         |
| Filas `shift_kind = laboral`                                         |                2411 | Requieren validar publicación, estado, horario y contexto.                   |
| Filas `shift_kind = descanso`                                        |                 433 | No crean contexto operativo.                                                 |
| Filas publicadas laborales con estado `scheduled` o `confirmed`      |                2318 | Candidatos históricos potenciales antes de validar contexto completo.        |
| De esas filas, sin `operational_role`                                |                1535 | No pueden producir turno operativo reproducible.                             |
| De esas filas, sin `area_id`                                         |                1663 | Solo serían admisibles si el rol y permiso permiten ausencia exacta de área. |
| Incompatibilidades exactas observadas entre vínculo rol–área y turno |                   2 | Deben fallar cerrado si se seleccionan.                                      |
| Áreas de turno pertenecientes a otra sede                            |                   0 | Sin brecha observada en esa comprobación.                                    |
| Pares de turnos publicados operables solapados                       |                   0 | Sin solapamientos observados en el conjunto consultado.                      |
| Turnos publicados operables que cruzan medianoche                    |                   0 | El contrato los admite aunque no existan en el snapshot.                     |
| Filas cuya publicación observada ocurrió después del inicio          |                  77 | No autorizan retroactivamente el periodo anterior a la publicación.          |
| Campos específicos de turno dentro de `context_simulation_sessions`  |                   0 | La tabla física no materializa este contrato.                                |
| Sesiones físicas de simulación observadas                            |                   0 | No existe evidencia de ejecución.                                            |

La alta cantidad de filas legacy sin rol o área no se corrige en esta tarea. Tampoco se asume que cada ausencia sea un error operativo actual; únicamente se bloquea su uso como evidencia suficiente para una simulación reproducible.

---

#### 25. Snapshot controlado de vigencia

Para el instante de servidor:

```text
2026-08-04T00:57:00Z
=
2026-08-03T19:57:00-05:00 America/Bogota
```

la consulta de solo lectura encontró:

| Métrica                                                                            | Resultado |
| ---------------------------------------------------------------------------------- | --------: |
| Candidatos publicados, laborales, `scheduled`/`confirmed` y temporalmente vigentes |         8 |
| Empleados distintos representados                                                  |         8 |
| Empleados con múltiples candidatos vigentes                                        |         0 |
| Candidatos sin rol operativo                                                       |         0 |
| Candidatos sin área                                                                |         0 |
| Candidatos con área de otra sede                                                   |         0 |
| Candidatos con empleado inactivo                                                   |         0 |
| Candidatos con sede inactiva                                                       |         0 |
| Candidatos con rol desconocido o inactivo                                          |         0 |

Distribución contextual observada:

| Sede         | Área           | Rol                  | Candidatos |
| ------------ | -------------- | -------------------- | ---------: |
| `SAUDO`      | `COCINA_BARRA` | `cocinero_satelite`  |          2 |
| `VENTO_CAFE` | `BARRA`        | `barista_satelite`   |          1 |
| `VENTO_CAFE` | `COCINA`       | `cocinero_satelite`  |          2 |
| `VENTO_CAFE` | `MOSTRADOR`    | `mostrador_satelite` |          1 |
| `VENTO_CAFE` | `SALON`        | `servicio_salon`     |          2 |

Estas cifras prueban únicamente que el algoritmo documental puede reconciliar un snapshot físico. No identifican personas, no crean sesiones y no certifican implementación del contrato de simulación.

---

#### 26. Brechas físicas asignadas

| Brecha                                                                                                 | Estado                             | Destino documental                             | Condición de salida                                                      |
| ------------------------------------------------------------------------------------------------------ | ---------------------------------- | ---------------------------------------------- | ------------------------------------------------------------------------ |
| `context_simulation_sessions` no conserva turno, revisión, fingerprint, tiempos ni check-in hipotético | `PENDIENTE_DE_IMPLEMENTACION`      | `AUTH-DB-013`; `AUTH-SRV-015`                  | Contrato físico versionado, migración aprobada y pruebas de aislamiento. |
| `employee_shifts` no posee revisión publicada explícita                                                | `PENDIENTE_DE_IMPLEMENTACION`      | `AUTH-DB-013`; transición de turnos aplicable  | Snapshot o revisión autoritativa reproducible.                           |
| Filas legacy sin rol o área                                                                            | `PENDIENTE_DE_RECONCILIACION`      | transición de contexto y datos; `AUTH-CTX-028` | Clasificación o corrección aprobada sin inferencias.                     |
| Dos incompatibilidades rol–área observadas                                                             | `BLOQUEADO_PARA_SIMULACION_EXACTA` | transición de datos y validación de turnos     | Fuente corregida o excepción canónica explícita.                         |
| Ausencia de versión física del contrato de turno simulado                                              | `PENDIENTE_DE_IMPLEMENTACION`      | `AUTH-DB-013`; `AUTH-SRV-015`                  | Versión persistida y consumida por el evaluador.                         |
| Ausencia de pruebas automatizadas del registro de quince escenarios                                    | `PENDIENTE_DE_EVIDENCIA`           | `AUTH-QA-019`; `AUTH-QA-030`                   | Suite automatizada ejecutada con evidencia reproducible.                 |

Esta tarea no crea nuevas tareas, porque cada brecha queda vinculada a responsables canónicos existentes.

---

#### 27. Comportamiento fail closed

```text
modo desconocido o campos incompatibles
→ DENY
```

```text
turno exacto sin revisión o fingerprint reproducible
→ INDETERMINATE_REPLAY
```

```text
borrador, retiro o estado terminal
→ no satisface T ni T+C
```

```text
instante fuera del intervalo
→ no satisface T ni T+C
```

```text
múltiples candidatos
→ DENY
```

```text
rol, sede o área incompatibles
→ DENY
```

```text
T+C sin ACTIVE_HYPOTHETICAL
→ would_deny o indeterminate según completitud
```

```text
check-in hipotético sin turno válido
→ DENY
```

```text
error, dato desconocido o fuente múltiple incompatible
→ DENY
```

No se utilizarán como fallback el turno real del simulador, último turno, turno confirmado, sede seleccionada, área visible, perfil operativo, check-in real, reloj del cliente ni primera fila coincidente.

---

#### 28. Límites de esta tarea

AUTH-SIM-005 no define:

- mezcla final de permisos reales y simulados;
- interfaz final;
- persistencia física definitiva;
- tabla de revisiones de turno;
- migraciones, constraints, RLS, RPC o servicios;
- corrección o backfill de turnos legacy;
- publicación, cancelación o retiro de turnos reales;
- creación o cierre de asistencia real;
- políticas laborales de duración, descansos o horas máximas;
- gestión administrativa de horarios;
- ejecución de simulaciones;
- pruebas operativas.

Estas responsabilidades permanecen en sus tareas canónicas.

---

#### 29. Handoff exacto a AUTH-SIM-006

`AUTH-SIM-006` deberá impedir mezcla de permisos reales y simulados conservando:

1. actor, sesión, alcance y permisos reales del solicitante como única autoridad para acceder a datos y operar la herramienta;
2. rol, sede, área, turno y check-in simulados como entradas exclusivamente hipotéticas;
3. prohibición de tomar prestado el turno o check-in real para completar el escenario;
4. prohibición de usar un turno simulado para habilitar una acción real;
5. separación de `simulated_resolved_at` y `evaluated_at`;
6. separación de `source_shift_id` y `real_active_shift_id`;
7. resultados exclusivos `would_allow`, `would_deny` o `indeterminate`;
8. mutaciones empresariales bloqueadas aunque la evaluación produzca `would_allow`;
9. datos reales minimizados por el alcance real del simulador;
10. auditoría correlacionada de contexto real e hipotético sin fusionarlos.

Esta tarea no anticipa la fórmula final de separación de autoridades.

---

#### 30. Invariantes

1. El turno simulado nunca es el turno real del simulador.
2. La identidad sintética no sustituye un `shift_id` real.
3. Un `shift_id` real no se modifica durante una simulación.
4. `simulated_resolved_at` y `evaluated_at` son tiempos distintos.
5. La zona organizacional vigente es `America/Bogota`.
6. Todo intervalo usa inicio inclusivo y fin exclusivo.
7. El fin debe ser posterior al inicio.
8. Los turnos nocturnos pueden cruzar medianoche.
9. Un borrador no satisface turno.
10. Una publicación futura no autoriza antes de ser efectiva.
11. Una publicación tardía no crea autoridad retroactiva.
12. `CONFIRMED` no es requisito de autorización.
13. `SCHEDULED` y `CONFIRMED` reciben la misma semántica de vigencia.
14. `COMPLETED`, `CANCELLED`, `NO_SHOW` y `WITHDRAWN` no satisfacen turno.
15. Un descanso no crea contexto operativo.
16. Un turno futuro no satisface `T`.
17. Un turno terminado no satisface `T`.
18. Dos candidatos aplicables producen ambigüedad.
19. No se elige un candidato por orden físico.
20. El turno conserva el rol objetivo aceptado.
21. El turno conserva la sede exacta aceptada.
22. El turno conserva el área exacta cuando sea obligatoria.
23. El turno no puede utilizar un área de otra sede.
24. Una fila agregada no es área operativa exacta.
25. Un vínculo rol–área no resuelto bloquea `would_allow` reproducible.
26. El punto físico de check-in no sustituye sede ni área.
27. `NO_SHIFT` es ausencia explícita, no wildcard.
28. Un permiso `N` no obtiene autoridad del turno.
29. Un permiso `T` exige turno simulado válido.
30. Un permiso `T+C` exige turno y check-in hipotéticos compatibles.
31. No existe check-in activo sin turno válido.
32. Un check-in real no completa un escenario simulado.
33. Un turno simulado no crea asistencia real.
34. Un turno simulado no cambia el contexto real.
35. Un turno exacto exige revisión o snapshot reproducible.
36. Un fingerprint incompatible bloquea la evaluación.
37. Los datos reales continúan gobernados por permisos reales.
38. La selección no modifica programación ni asistencia.
39. Toda ambigüedad falla cerrado.
40. Toda evaluación ocurre en servidor.
41. Todo intento queda auditado con minimización.
42. La tarea siguiente permanece limitada a impedir mezcla de permisos reales y simulados.

---

#### Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se incorporan `TREQ-AUTH-109` a `TREQ-AUTH-118` en el Registro Canónico de Requisitos de Prueba.

| ID              | Regla protegida                                                                                                                                                                                                                                                                                                                                                                                               | Tipo                                                              | Prioridad | Momento de implementación                         | Destino                                                       |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------- | --------- | ------------------------------------------------- | ------------------------------------------------------------- |
| `TREQ-AUTH-109` | Todo objetivo de turno simulado deberá declarar uno de tres modos, identidad, instante hipotético, zona horaria y versión; el modo exacto exigirá `shift_id`, revisión o snapshot y fingerprint, mientras el modo hipotético usará identidad sintética y `NO_SHIFT` expresará ausencia positiva.                                                                                                              | seguridad + contractual + integración + regresión                 | crítica   | Paquete que materialice el contrato de simulación | `AUTH-DB-013`; `AUTH-SRV-015`; `AUTH-QA-019`                  |
| `TREQ-AUTH-110` | El registro de estados deberá cubrir exactamente quince escenarios y conservar sus decisiones, incluidos borrador, futuro, vigente, descanso, estados terminales, retiro, turno exacto versionado, legacy no reproducible, ambigüedad y contexto inválido, sin fallbacks ni reclasificaciones implícitas.                                                                                                     | contractual + estática + integración + regresión                  | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-005`; `AUTH-DB-013`; `AUTH-QA-019`                  |
| `TREQ-AUTH-111` | Un turno solo satisfará el prerrequisito temporal cuando sea laboral, publicado mediante una revisión reproducible, efectivo en `simulated_resolved_at`, único y vigente dentro del intervalo semiabierto en `America/Bogota`; reloj del cliente, fecha aislada o minutos de gracia implícitos no podrán alterar la decisión.                                                                                 | contractual + temporal + integración + E2E + regresión            | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SRV-015`; `AUTH-QA-019`                                 |
| `TREQ-AUTH-112` | Rol, sede y área del turno deberán coincidir con los objetivos aceptados. El turno no podrá inventar contexto, usar un área agregada, cruzar sedes ni completar un vínculo rol–área no resuelto; el punto físico de check-in permanecerá separado.                                                                                                                                                            | seguridad + autorización + contexto + integración + regresión     | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-005`; `AUTH-SIM-006`; `AUTH-SRV-015`; `AUTH-QA-019` |
| `TREQ-AUTH-113` | `SCHEDULED` y `CONFIRMED` deberán conservar la misma semántica de autorización; la confirmación no será requisito. Borradores, turnos futuros o terminados, descansos, `COMPLETED`, `CANCELLED`, `NO_SHOW` y `WITHDRAWN` no podrán satisfacer `T` ni `T+C`.                                                                                                                                                   | contractual + autorización + temporal + regresión                 | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SRV-015`; `AUTH-QA-019`                                 |
| `TREQ-AUTH-114` | La evaluación deberá respetar `N`, `T` y `T+C`: `N` no depende del turno; `T` exige turno simulado válido; `T+C` exige además `ACTIVE_HYPOTHETICAL` para el mismo turno. Un check-in real no podrá completar el escenario y un check-in hipotético sin turno deberá denegarse.                                                                                                                                | autorización + contexto + integración + E2E + regresión           | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-006`; `AUTH-SRV-015`; `AUTH-QA-019`                 |
| `TREQ-AUTH-115` | Turno, check-in, actor, tiempos y contexto reales deberán permanecer separados de sus equivalentes simulados; ninguna ausencia hipotética se completará con el estado real y ningún resultado simulado podrá convertirse en sesión, token o autoridad ejecutable.                                                                                                                                             | seguridad + autorización + sesión + integración + E2E + regresión | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-006`; `AUTH-SRV-015`; `AUTH-QA-019`                 |
| `TREQ-AUTH-116` | Toda simulación de un turno exacto deberá fijar revisión o snapshot, fingerprint, catálogos, políticas y tiempos. Una fila legacy sin versionado reproducible producirá `INDETERMINATE_REPLAY`; cambios posteriores no podrán alterar silenciosamente una decisión histórica.                                                                                                                                 | contractual + auditoría + versionado + integración + regresión    | crítica   | Paquete que materialice el contrato de simulación | `AUTH-DB-013`; `AUTH-SRV-015`; `AUTH-QA-019`; `AUTH-QA-030`   |
| `TREQ-AUTH-117` | Crear, cambiar o cerrar un turno simulado no podrá modificar turnos, publicaciones, asistencia, sesiones operativas, permisos, RLS, dispositivos, recursos ni datos reales, ejecutar mutaciones o ampliar la lectura más allá del alcance real del simulador.                                                                                                                                                 | seguridad + autorización + RLS + integración + E2E + regresión    | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-006`; `AUTH-SRV-015`; `AUTH-QA-019`                 |
| `TREQ-AUTH-118` | La auditoría y reconciliación deberán conservar quince escenarios y el snapshot físico documentado: 2844 turnos, 2723 publicados, 121 no publicados, 2411 laborales, 433 descansos, 2318 candidatos históricos potenciales, 1535 sin rol, 1663 sin área, dos incompatibilidades rol–área, 77 publicaciones posteriores al inicio, ocho candidatos vigentes controlados y cero sesiones físicas de simulación. | contractual + auditoría + base de datos + estática + regresión    | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-005`; `AUTH-DB-013`; `AUTH-SRV-015`; `AUTH-QA-019`  |

---

#### 31. Criterios de aceptación

- [x] Se distinguió el turno simulado del turno real del solicitante.
- [x] Se definieron tres modos explícitos de objetivo.
- [x] Se exigieron identidad, versiones, revisión y fingerprint cuando corresponden.
- [x] Se separaron `simulated_resolved_at` y `evaluated_at`.
- [x] Se fijó `America/Bogota` como zona organizacional vigente.
- [x] Se definió el intervalo semiabierto y el cruce de medianoche.
- [x] Se separaron publicación, vigencia, check-in, ejecución y resultado.
- [x] Se confirmó que `CONFIRMED` no afecta autorización.
- [x] Se materializaron quince escenarios con decisión explícita.
- [x] Se distinguieron estados operables, no vigentes, no laborales y terminales.
- [x] Se prohibió resolver múltiples candidatos por fallback.
- [x] Se exigió coherencia exacta entre rol, sede, área y turno.
- [x] Se bloquearon áreas agregadas y vínculos rol–área no resueltos.
- [x] Se separó el punto físico de check-in del territorio organizacional.
- [x] Se reconciliaron `N`, `T` y `T+C`.
- [x] Se definieron cinco estados hipotéticos de check-in.
- [x] Se prohibió tomar prestado un check-in real.
- [x] Se preservó el alcance real como límite de datos visibles.
- [x] Se prohibieron todas las mutaciones reales.
- [x] Se definieron precedencia y razones estructuradas.
- [x] Se definió auditoría mínima.
- [x] Se reconciliaron 2844 filas físicas y el snapshot de ocho candidatos sin modificarlos.
- [x] Se documentaron brechas físicas con responsables y condiciones de salida.
- [x] Se generaron `TREQ-AUTH-109` a `TREQ-AUTH-118`.
- [x] No se modificó código, Supabase, migraciones, RLS, RPC, configuración, datos, turnos, horarios, asistencia, sesiones, permisos ni aplicaciones.
- [x] `AUTH-SIM-006` permanece únicamente reservada.

---

#### 32. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-SIM-004 — Definir área simulada`

**TAREA ACTUAL APROBADA**
`AUTH-SIM-005 — Definir turno simulado`

**SIGUIENTE TAREA RESERVADA**
`AUTH-SIM-006 — No mezclar permisos reales y simulados`


### ✅ AUTH-SIM-006 — No mezclar permisos reales y simulados

**Estado:** APROBADA
**Tarea anterior:** `AUTH-SIM-005 — Definir turno simulado` — APROBADA
**Tarea siguiente:** `AUTH-ERR-001 — Sin sesión` — RESERVADA
**Tipo de tarea:** documental; cierre contractual del mini-bloque de simulación mediante separación estricta entre autoridad real, evaluación hipotética, presentación y auditoría
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Q_SIMULACION/01_CONTEXTO_Y_ALCANCE_SIMULADO.md`
**Artefactos producidos:** `REAL-SIMULATED-AUTHORITY-SEPARATION-CONTRACT-001`, `SIMULATION-AUTHORITY-SURFACE-REGISTER-001` y `SIMULATION-MIXING-PHYSICAL-GAP-REGISTER-001`
**Decisiones y contratos consumidos:** `AUTH-MOD-006`, `AUTH-MOD-012`, `AUTH-CAT-012`, `AUTH-CTX-019`, `AUTH-SIM-001` a `AUTH-SIM-005`, `AUTH-UI-037`, contratos de decisión y contexto vigentes, catálogo de permisos vigente, migraciones físicas de simulación y paquete compartido `packages/os-context`
**Cambios en código, Supabase, migraciones, RLS, RPC, configuración, datos, permisos, sesiones, tokens, turnos, asistencia, recursos, aplicaciones o despliegues:** no autorizados

---

#### 1. Propósito

Cerrar el mini-bloque de contexto y alcance simulado mediante una regla inequívoca:

```text
AUTORIDAD REAL
≠
RESULTADO SIMULADO
```

La simulación debe permitir explicar cómo se evaluaría una combinación hipotética de rol, sede, área, turno, check-in, permiso, acción y recurso sin convertir esa combinación en autoridad ejecutable.

La tarea elimina cualquier interpretación según la cual:

- un permiso simulado pueda abrir datos reales;
- un rol simulado pueda convertirse en rol efectivo;
- una sede o área simulada pueda convertirse en territorio autorizado;
- un turno o check-in simulado pueda satisfacer prerrequisitos reales;
- `would_allow` pueda tratarse como `ALLOW`;
- un booleano de permiso pueda ocultar si la respuesta provino del contexto real o del simulado;
- una sesión de simulación pueda reemplazar la sesión real;
- una pantalla de vista previa pueda ejecutar la acción que representa;
- un contexto hipotético pueda alimentar RLS, RPC, server actions, Edge Functions, jobs, webhooks o integraciones;
- el estado real pueda completar silenciosamente un escenario simulado incompleto.

```text
SIMULACIÓN
→ explica
→ compara
→ previsualiza

AUTORIZACIÓN REAL
→ permite o deniega una acción real
```

---

#### 2. Resultado material

Se aprueban:

1. `REAL-SIMULATED-AUTHORITY-SEPARATION-CONTRACT-001`, que define los cuatro planos, los contratos tipados, las fuentes de autoridad, el doble resultado, la separación de datos, ejecución, sesiones, tokens, caché, RLS y auditoría;
2. `SIMULATION-AUTHORITY-SURFACE-REGISTER-001`, que materializa una decisión para dieciséis superficies donde podría producirse mezcla de permisos;
3. `SIMULATION-MIXING-PHYSICAL-GAP-REGISTER-001`, que registra las brechas observadas en funciones SQL y en `packages/os-context` sin presentar el estado físico como implementación aprobada.

Cobertura materializada:

| Resultado                                                       | Cantidad |
| --------------------------------------------------------------- | -------: |
| Planos separados                                                |        4 |
| Superficies con decisión explícita                              |       16 |
| Resultados hipotéticos permitidos                               |        3 |
| Decisiones reales ejecutables permitidas                        |        2 |
| Canales compartidos entre permiso real y simulado               |        0 |
| Permisos simulados capaces de producir efectos reales           |        0 |
| Funciones SQL del conjunto físico inspeccionadas                |        6 |
| Funciones inspeccionadas con `SECURITY DEFINER`                 |        6 |
| Funciones inspeccionadas ejecutables por `authenticated`        |        6 |
| Funciones con mezcla directa de contexto o permiso              |        2 |
| Contratos cliente compartidos con riesgo de mezcla              |        2 |
| Sesiones físicas de simulación observadas                       |        0 |
| Funciones PostgreSQL dependientes observadas fuera del conjunto |        0 |
| Brechas físicas materializadas en el registro                   |        6 |

La existencia de cero sesiones físicas no corrige el contrato desplegado. Solo demuestra que no había filas persistidas en el instante de la inspección.

---

#### 3. Base normativa heredada

Esta tarea conserva íntegramente que:

- `AUTH-SIM-001` determina quién puede solicitar una simulación usando exclusivamente identidad, sesión, permisos, alcance y denegaciones reales;
- `AUTH-SIM-002` define identidades de rol tipadas y no ejecutables;
- `AUTH-SIM-003` define sede simulada exacta o ausencia territorial legítima;
- `AUTH-SIM-004` define área simulada exacta, ausencia permitida o bloqueo explícito;
- `AUTH-SIM-005` define turno y check-in hipotéticos separados del contexto real;
- una simulación solo puede producir `would_allow`, `would_deny` o `indeterminate`;
- una simulación no modifica actor, sesión, rol, permisos, asignaciones, turno, check-in, dispositivo, recurso ni datos reales;
- el acceso a datos reales continúa limitado por la autoridad real del simulador;
- una acción pertenece a un único modo de autorización;
- un contexto administrativo y un contexto operativo pueden coexistir, pero no se fusionan;
- una ambigüedad, ausencia crítica, versión incompatible o contaminación entre planos falla cerrado;
- una simulación no puede iniciar otra simulación ni utilizar su propio resultado como autorización.

---

#### 4. Decisión raíz

Toda evaluación de simulación deberá producir dos resultados independientes:

```text
DECISIÓN REAL
+
RESULTADO HIPOTÉTICO
```

Nunca:

```text
DECISIÓN EFECTIVA MEZCLADA
```

La decisión real responde:

```text
¿Puede el actor real usar esta superficie, consultar estos datos o ejecutar esta operación real?
```

El resultado hipotético responde:

```text
¿Qué ocurriría si el contexto simulado solicitara esta capacidad contra este recurso hipotético?
```

Regla central:

```text
REAL_DENY
+
WOULD_ALLOW
=
SIN ACCESO REAL
```

```text
REAL_ALLOW
+
WOULD_DENY
=
EL ACTOR PUEDE VER LA EXPLICACIÓN,
PERO EL ESCENARIO HIPOTÉTICO RESULTA DENEGADO
```

```text
REAL_ALLOW
+
WOULD_ALLOW
=
VISTA PREVIA EXPLICATIVA,
NO ACCIÓN EJECUTABLE
```

---

#### 5. Cuatro planos obligatorios

| Plano                           | Fuente                                                            | Función                                                | Puede autorizar una acción real |
| ------------------------------- | ----------------------------------------------------------------- | ------------------------------------------------------ | ------------------------------: |
| `REAL_AUTHORITY_PLANE`          | actor, sesión, permisos, alcances, denegaciones y contexto reales | controlar entrada, datos y ejecución                   |                              Sí |
| `SIMULATED_EVALUATION_PLANE`    | escenario hipotético validado y versionado                        | calcular `would_allow`, `would_deny` o `indeterminate` |                              No |
| `SIMULATION_PRESENTATION_PLANE` | resultado hipotético ya calculado                                 | representar navegación, controles y razones            |                              No |
| `SIMULATION_AUDIT_PLANE`        | actor real + solicitud + escenario + doble resultado              | trazabilidad y reproducción                            |                              No |

Ningún campo, función, helper, cache, token o tipo podrá pertenecer simultáneamente al plano real y al plano simulado.

---

#### 6. Identidades y fuentes separadas

| Elemento real            | Equivalente simulado           | Regla                                                     |
| ------------------------ | ------------------------------ | --------------------------------------------------------- |
| `real_actor_id`          | `simulated_subject_reference`  | El sujeto simulado no reemplaza al actor real.            |
| `real_session_id`        | `simulation_session_id`        | La sesión de simulación no autentica.                     |
| `real_base_role`         | `simulated_base_role`          | El rol simulado no se vuelve rol efectivo.                |
| `real_operational_role`  | `simulated_operational_role`   | El rol simulado no autoriza operación.                    |
| `real_site_ids`          | `simulated_site_id`            | La sede simulada no amplía cobertura real.                |
| `real_area_ids`          | `simulated_area_id`            | El área simulada no amplía cobertura real.                |
| `real_active_shift_id`   | `simulated_shift_reference`    | El turno simulado no satisface un prerrequisito real.     |
| `real_active_checkin_id` | `simulated_checkin_state`      | El check-in simulado no crea presencia real.              |
| `real_permission_key`    | `target_permission_key`        | La clave evaluada no queda concedida al simulador.        |
| `real_resource_scope`    | `simulated_resource_reference` | Un recurso hipotético no concede lectura de datos reales. |
| `real_decision`          | `simulation_result`            | `ALLOW` y `WOULD_ALLOW` son dominios distintos.           |
| `evaluated_at`           | `simulated_resolved_at`        | El reloj real no se reemplaza por el hipotético.          |

Queda prohibido utilizar nombres genéricos como `effective_role`, `effective_permission`, `effective_context` o `can_operate` para representar indistintamente valores reales y simulados.

---

#### 7. Contrato de autoridad real

```ts
type RealAuthorityContext = {
  real_actor_id: string;
  real_user_id: string;
  real_employee_id: string;
  real_session_id: string;
  real_session_status: "ACTIVE" | "EXPIRED" | "REVOKED" | "INVALID";
  real_base_role_code: string | null;
  real_operational_role_code: string | null;
  real_site_ids: string[];
  real_area_ids: string[];
  real_active_shift_id: string | null;
  real_active_checkin_id: string | null;
  real_permission_key: string;
  real_permission_source: string | null;
  real_scope_mode: string | null;
  real_denial_codes: string[];
  real_policy_version: string;
  real_context_fingerprint: string;
};
```

```ts
type RealAuthorityDecision = {
  decision: "ALLOW" | "DENY";
  authority_source: "REAL_ONLY";
  actor_id: string;
  session_id: string;
  permission_key: string;
  resource_reference: string | null;
  scope_reference: string | null;
  reason_codes: string[];
  evaluated_at: string;
  policy_version: string;
  context_fingerprint: string;
};
```

Reglas:

1. solo este plano puede producir `ALLOW` ejecutable;
2. la simulación no puede agregar, sustituir ni eliminar datos de este plano;
3. una sesión real expirada, revocada o inválida produce `DENY` aunque el escenario sea `WOULD_ALLOW`;
4. la decisión real se recalcula en servidor para cada operación real;
5. una decisión real no se reutiliza indefinidamente por existir una simulación activa.

---

#### 8. Contrato de evaluación simulada

```ts
type SimulatedAuthorizationScenario = {
  simulation_request_id: string;
  simulation_session_id: string;
  simulated_subject_reference: string | null;
  simulated_base_role_code: string | null;
  simulated_operational_role_code: string | null;
  simulated_site_id: string | null;
  simulated_area_id: string | null;
  simulated_shift_reference: string | null;
  simulated_checkin_state: string;
  target_permission_key: string;
  simulated_action_reference: string;
  simulated_resource_reference: string | null;
  simulated_resolved_at: string;
  scenario_version: string;
  catalog_versions: Record<string, string>;
  scenario_fingerprint: string;
};
```

```ts
type SimulatedAuthorizationResult = {
  result: "WOULD_ALLOW" | "WOULD_DENY" | "INDETERMINATE";
  executable: false;
  authority_source: "SIMULATED_ONLY";
  simulation_request_id: string;
  simulation_session_id: string;
  target_permission_key: string;
  reason_codes: string[];
  evaluated_at: string;
  simulated_resolved_at: string;
  policy_version: string;
  scenario_fingerprint: string;
};
```

Invariantes de forma:

```text
executable = false
```

```text
authority_source = SIMULATED_ONLY
```

No se admite:

- `ALLOW`;
- `DENY` sin prefijo hipotético dentro del resultado simulado;
- `true` o `false` sin procedencia;
- `can_operate = true`;
- un token de autorización;
- un conjunto de permisos efectivos reutilizable;
- una sesión o claim que RLS pueda interpretar como autoridad.

---

#### 9. Contrato compuesto sin fusión

```ts
type SimulationAuthorizationEnvelope = {
  real_authority: RealAuthorityDecision;
  simulated_evaluation: SimulatedAuthorizationResult | null;
  enforcement: {
    simulator_surface_access: "REAL_ONLY";
    real_data_access: "REAL_ONLY";
    real_route_access: "REAL_ONLY";
    real_mutation_access: "REAL_ONLY";
    rls_authority: "REAL_ONLY";
    hypothetical_rendering: "SIMULATED_RESULT_ONLY";
    simulated_execution: "NEVER";
  };
  correlation: {
    simulation_request_id: string | null;
    audit_event_id: string;
  };
};
```

La presencia de ambos resultados dentro del mismo envelope sirve para correlación y presentación. No permite aplicar `OR`, precedencia permisiva ni fallback entre ellos.

---

#### 10. Fórmula de entrada a la simulación

```text
ACTOR REAL VÁLIDO
∩
SESIÓN REAL PERSONAL VÁLIDA
∩
viso.access REAL
∩
viso.authorization.context_simulations.view REAL
∩
ALCANCE REAL SUFICIENTE
∩
AUSENCIA DE DENEGACIONES REALES
=
PUEDE USAR LA HERRAMIENTA DE SIMULACIÓN
```

No participan en esta fórmula:

- el rol que se pretende simular;
- el permiso que se pretende simular;
- la sede o área simuladas;
- el turno o check-in simulados;
- un resultado hipotético anterior;
- la visibilidad de una pantalla;
- un rol de navegación;
- una sesión de dispositivo;
- un booleano producido por el evaluador simulado.

---

#### 11. Fórmula de evaluación hipotética

```text
HERRAMIENTA REALMENTE AUTORIZADA
∩
ESCENARIO SIMULADO VÁLIDO
∩
PERMISO OBJETIVO VERSIONADO
∩
ACCIÓN Y RECURSO HIPOTÉTICOS
∩
REGLAS CANÓNICAS
=
WOULD_ALLOW | WOULD_DENY | INDETERMINATE
```

La evaluación puede explicar un resultado que el actor real no tendría derecho a ejecutar. El acceso a la explicación no concede el derecho de ejecución.

---

#### 12. Prohibición del contexto efectivo único

Queda prohibido resolver una sola estructura mutable donde:

```text
si existe simulación
→ reemplazar rol, sede y área reales
→ declarar el contexto como efectivo
→ continuar con la autorización normal
```

Modelo rechazado:

```text
get_effective_context()
├── shared_device
├── simulation
└── real

has_effective_permission()
→ boolean
```

Motivo:

- convierte un escenario de vista previa en fuente de autorización;
- oculta qué plano produjo el resultado;
- facilita que un guard, RPC o consumidor trate `true` como autoridad real;
- mezcla la decisión de datos, presentación y ejecución;
- impide demostrar que `would_allow` nunca llegó a una mutación.

Modelo obligatorio:

```text
resolve_real_authority()
+
evaluate_simulated_authorization()
+
compose_non_executable_preview()
```

Las tres operaciones deberán mantener tipos, nombres, caches y consumidores separados.

---

#### 13. Prohibición de booleanos ambiguos

Una función de simulación no podrá devolver únicamente:

```ts
true
```

o:

```ts
false
```

Porque el consumidor no puede distinguir:

- permiso real;
- permiso simulado;
- resultado incompleto;
- error de resolución;
- denegación estructural;
- dato no visible;
- ausencia de contexto.

Toda API de simulación deberá devolver el objeto `SimulatedAuthorizationResult` con `executable: false`.

Los helpers denominados `hasPermission`, `hasEffectivePermission`, `canOperate`, `canExecute` o equivalentes quedan reservados para decisiones reales o deberán incorporar una separación tipada imposible de omitir.

---

#### 14. Lectura de datos reales

Durante una simulación, toda lectura de datos empresariales reales continuará gobernada por:

```text
PERMISO REAL DEL SIMULADOR
∩
ALCANCE REAL DEL SIMULADOR
∩
RLS REAL
∩
REGLAS DE MINIMIZACIÓN
```

El permiso simulado podrá determinar cómo se representa un escenario, pero no qué filas se consultan.

Ejemplos:

```text
Simular bodeguero de Centro de Producción
+
actor real sin permiso de inventario
=
se usan datos sintéticos, estructura vacía o metadatos permitidos
```

```text
Simular contador
+
actor real sin permiso financiero
=
no se revelan saldos, costos, márgenes ni documentos reales
```

```text
Simular gerente de otra sede
+
actor real sin cobertura sobre esa sede
=
no se cargan datos reales de la sede
```

Una simulación puede mostrar que el sujeto hipotético tendría acceso, sin mostrar el contenido real al simulador.

---

#### 15. RLS

RLS no podrá consumir:

- `simulation_id`;
- rol simulado;
- sede simulada;
- área simulada;
- turno simulado;
- check-in simulado;
- permiso simulado;
- resultado `WOULD_ALLOW`;
- metadata de la sesión de simulación;
- cookies o headers de vista previa;
- claims generados por la simulación.

Regla:

```text
RLS
→ actor y sesión reales
→ permisos y alcance reales
→ recurso real
```

Cuando el evaluador necesite inspeccionar metadatos protegidos mediante un proceso interno, deberá minimizar la salida y nunca devolver filas que el actor real no pueda consultar. El uso técnico de privilegios elevados no transforma el escenario en autoridad del usuario.

---

#### 16. Mutaciones y efectos externos

Mientras una solicitud incluya o derive de un contexto simulado, quedan bloqueados:

- `INSERT`, `UPDATE`, `DELETE`, `UPSERT` y `TRUNCATE` empresariales;
- creación, modificación o cancelación de recursos;
- movimientos de inventario;
- ventas, pagos, cierres y reembolsos;
- producción, remisiones, compras y recepciones;
- publicación o modificación de turnos;
- check-in y check-out;
- asignación de roles o permisos;
- envío de notificaciones reales;
- exportaciones con datos reales fuera del alcance;
- impresión de documentos operativos;
- webhooks, integraciones y eventos empresariales;
- jobs y colas con efecto de dominio;
- aprobación, reversión o corrección de operaciones.

Resultado obligatorio:

```text
SIMULATION_EXECUTION_FORBIDDEN
```

La acción no se convierte en válida porque el escenario resulte `WOULD_ALLOW`.

---

#### 17. Server actions, RPC y Edge Functions

Toda entrada ejecutable deberá:

1. ignorar el contexto simulado como fuente de autoridad;
2. resolver el actor y la sesión reales;
3. rechazar un intento de ejecutar como el sujeto simulado;
4. rechazar un `simulation_id` presentado como credencial;
5. recalcular permiso, alcance, recurso y denegaciones reales;
6. impedir que un helper booleano de simulación habilite la operación;
7. registrar el intento cuando exista mezcla o contaminación;
8. devolver una razón estructurada y no ejecutar efectos parciales.

Una RPC de evaluación hipotética deberá estar separada de una RPC de mutación real por nombre, tipo de retorno, permisos, auditoría y consumidores.

---

#### 18. Rutas, navegación y componentes

La simulación puede representar:

- aplicaciones visibles;
- rutas visibles;
- módulos;
- botones;
- acciones;
- mensajes de bloqueo;
- razones de autorización.

Pero la representación deberá ejecutarse dentro de una superficie de vista previa.

Reglas:

1. una ruta simulada no equivale a una ruta real abierta;
2. un botón que aparezca habilitado hipotéticamente no tendrá handler de mutación real;
3. un enlace hipotético no transportará al actor a una superficie protegida usando autoridad simulada;
4. los controles de vista previa deberán ser inertes, interceptados o sustituidos por componentes explicativos;
5. un guard real seguirá evaluando el contexto real;
6. la UI mostrará permanentemente que el resultado es hipotético;
7. la ausencia de un indicador visible no transforma el contexto en real: produce invalidación y cierre de la vista previa.

---

#### 19. Prohibición de préstamo entre contextos

Queda prohibido completar el escenario simulado usando:

- el rol real del actor;
- su sede primaria o seleccionada;
- su área real;
- su turno vigente;
- su check-in activo;
- su dispositivo;
- su último recurso;
- su permiso real más amplio.

También queda prohibido completar el contexto real usando:

- rol simulado;
- sede o área simuladas;
- turno o check-in hipotéticos;
- permiso objetivo;
- resultado `WOULD_ALLOW`;
- recurso hipotético;
- alcance del sujeto simulado.

Cuando falte un dato obligatorio:

```text
SIMULACIÓN
→ INDETERMINATE o WOULD_DENY

AUTORIZACIÓN REAL
→ DENY
```

Nunca se utilizará el otro plano como fallback.

---

#### 20. Permisos `N`, `T` y `T+C`

La clasificación se aplica exclusivamente dentro del plano evaluado.

| Prerrequisito | Plano real                                | Plano simulado                                       |
| ------------- | ----------------------------------------- | ---------------------------------------------------- |
| `N`           | no exige turno real para la decisión real | no exige turno simulado para el resultado hipotético |
| `T`           | exige turno real válido                   | exige turno simulado válido                          |
| `T+C`         | exige turno y check-in reales válidos     | exige turno y check-in hipotéticos compatibles       |

Prohibiciones:

```text
T simulado
+
turno real
≠
prerrequisito satisfecho
```

```text
T+C simulado
+
check-in real
≠
prerrequisito satisfecho
```

```text
T real
+
turno simulado
≠
prerrequisito satisfecho
```

---

#### 21. Recursos sensibles y minimización

La simulación de permisos sobre recursos:

- financieros;
- personales;
- laborales;
- médicos;
- disciplinarios;
- de autenticación;
- de seguridad;
- de secretos;
- de costos o márgenes;
- de documentos reservados;

no concede lectura del recurso real.

El evaluador podrá usar:

- identidad sintética;
- esquema del recurso;
- valores enmascarados;
- metadatos no sensibles;
- un identificador opaco;
- un dato real que el actor ya pueda consultar.

El resultado explicará la regla sin exponer contenido adicional.

---

#### 22. Sesiones, tokens, cookies y claims

Una simulación no podrá:

- emitir un access token con permisos simulados;
- modificar `auth.users`, `app_metadata`, `user_metadata` o JWT;
- persistir rol, sede, área o permiso simulados en cookies de autenticación;
- crear una sesión Auth para el sujeto simulado;
- reutilizar el PIN de un dispositivo como autenticación fuerte;
- almacenar un `would_allow` como claim;
- convertir `simulation_id` en credencial;
- sobrevivir como autoridad después de expirar o cerrarse.

Cuando exista un token técnico de vista previa, deberá declarar:

```text
purpose = SIMULATION_PREVIEW
executable = false
```

Además deberá:

- estar vinculado al actor real y a la solicitud;
- tener audiencia restringida al evaluador o UI de simulación;
- usar vigencia corta;
- no ser aceptado por RLS ni endpoints de negocio;
- invalidarse por cierre, expiración, revocación o cambio de versión.

---

#### 23. Caché y almacenamiento cliente

Se prohíbe compartir una misma clave de caché para contexto real y simulado.

Requisitos:

- namespaces separados;
- fingerprints separados;
- claves que incluyan `simulation_request_id` y versiones;
- invalidación al cambiar cualquier componente del escenario;
- eliminación al salir, expirar o revocar;
- prohibición de usar local storage como autoridad;
- prohibición de restaurar automáticamente una simulación como contexto efectivo;
- prohibición de mezclar una respuesta real cacheada dentro del escenario;
- prohibición de reutilizar un resultado simulado en una mutación posterior.

Un cache miss produce nueva evaluación. No produce fallback al contexto del otro plano.

---

#### 24. Procesos de sistema, jobs e integraciones

Un proceso técnico podrá ejecutar el evaluador de simulación únicamente como operación explicativa y auditada.

No podrá:

- ejecutar la acción hipotética;
- usar service role para actuar como el sujeto simulado;
- publicar eventos empresariales como consecuencia de `WOULD_ALLOW`;
- enviar webhooks o notificaciones reales;
- programar jobs de dominio;
- insertar el resultado en una cola de ejecución;
- convertir una comparación masiva en acciones masivas;
- omitir el actor real que solicitó la evaluación.

Las pruebas automatizadas usarán un harness identificado como tal y no se presentarán como actor humano ni como permiso empresarial.

---

#### 25. Salida de simulación y regreso al contexto real

Para ejecutar una acción real después de una simulación deberá ocurrir:

```text
1. cerrar o abandonar la vista previa
2. descartar contexto, cache y resultado simulados
3. restaurar la representación real
4. emitir una nueva solicitud sin simulation_id
5. resolver nuevamente actor, sesión, permiso, alcance y recurso reales
6. ejecutar solo si la nueva decisión real es ALLOW
```

Queda prohibido el botón conceptual:

```text
Ejecutar este WOULD_ALLOW
```

Una interfaz podrá ofrecer:

```text
Salir de simulación y abrir la pantalla real
```

pero la pantalla real deberá reautorizarse desde cero.

---

#### 26. Auditoría separada

Cada evaluación deberá registrar:

```ts
type SimulationAuditEnvelope = {
  audit_event_id: string;
  real_actor_id: string;
  real_session_id: string;
  real_authority_decision: "ALLOW" | "DENY";
  real_permission_key: string;
  real_scope_reference: string | null;
  simulation_request_id: string;
  simulation_session_id: string;
  simulated_subject_reference: string | null;
  target_permission_key: string;
  simulated_action_reference: string;
  simulated_resource_reference: string | null;
  simulation_result: "WOULD_ALLOW" | "WOULD_DENY" | "INDETERMINATE";
  executable: false;
  real_reason_codes: string[];
  simulated_reason_codes: string[];
  real_context_fingerprint: string;
  scenario_fingerprint: string;
  policy_version: string;
  evaluated_at: string;
  simulated_resolved_at: string;
};
```

No se almacenará un único campo `allowed = true` para representar ambos resultados.

La evidencia de una simulación nunca constituye evidencia de que una acción real fue autorizada o ejecutada.

---

#### 27. Razones estructuradas iniciales

| Código                               | Plano        | Significado                                                         |
| ------------------------------------ | ------------ | ------------------------------------------------------------------- |
| `REAL_SIMULATION_PERMISSION_MISSING` | real         | El actor no puede usar la herramienta.                              |
| `REAL_DATA_SCOPE_MISSING`            | real         | El actor no puede consultar los datos solicitados.                  |
| `REAL_SESSION_INVALID`               | real         | La sesión real está expirada, revocada o es ambigua.                |
| `REAL_ACTION_PERMISSION_MISSING`     | real         | La acción real no está autorizada.                                  |
| `SIMULATED_CONTEXT_INCOMPLETE`       | simulado     | Falta un componente obligatorio del escenario.                      |
| `SIMULATED_CONTEXT_INVALID`          | simulado     | El escenario es incompatible o no versionable.                      |
| `SIMULATED_RESULT_NON_EXECUTABLE`    | simulado     | El resultado es explicativo y no puede ejecutarse.                  |
| `SIMULATION_EXECUTION_FORBIDDEN`     | enforcement  | Se intentó producir un efecto real desde simulación.                |
| `SIMULATION_CONTEXT_IN_REAL_REQUEST` | enforcement  | Una solicitud real transportó contexto simulado.                    |
| `REAL_CONTEXT_CONTAMINATED`          | enforcement  | El contexto real recibió datos simulados.                           |
| `SIMULATED_CONTEXT_CONTAMINATED`     | enforcement  | El escenario tomó datos reales como fallback.                       |
| `SIMULATION_RLS_AUTHORITY_FORBIDDEN` | enforcement  | Se intentó usar simulación como fuente de RLS.                      |
| `SIMULATION_RESULT_EXPIRED`          | simulado     | La sesión o resultado ya no es vigente.                             |
| `SIMULATION_VERSION_MISMATCH`        | simulado     | Las versiones no permiten una evaluación reproducible.              |
| `SIMULATION_NESTED_FORBIDDEN`        | enforcement  | Una simulación intentó iniciar o controlar otra.                    |
| `SIMULATION_DATA_MINIMIZED`          | presentación | La explicación usa datos sintéticos o enmascarados por límite real. |

Los códigos transversales se distribuirán en las tareas `AUTH-ERR-*` aplicables sin alterar su significado. `AUTH-ERR-001` consumirá exclusivamente la separación entre sesión real y sesión simulada para el caso “Sin sesión”; `AUTH-ERR-016` materializará posteriormente “Acción no permitida en simulación”.

---

#### 28. Registro materializado de superficies

`SIMULATION-AUTHORITY-SURFACE-REGISTER-001`:

|    # | Superficie                                             | Autoridad para entrar o consultar                     | Insumo simulado permitido         | Resultado simulado permitido     | Efecto real durante simulación     | Decisión                    |
| ---: | ------------------------------------------------------ | ----------------------------------------------------- | --------------------------------- | -------------------------------- | ---------------------------------- | --------------------------- |
|    1 | Abrir la herramienta                                   | permisos y alcance reales                             | ninguno                           | ninguno                          | abrir solo si `REAL_ALLOW`         | `REAL_ONLY`                 |
|    2 | Cargar catálogos de roles, sedes y áreas               | lectura real o metadatos públicos internos permitidos | filtros hipotéticos               | candidatos o bloqueos            | sin ampliar filas reales           | `REAL_DATA_CEILING`         |
|    3 | Seleccionar rol simulado                               | acceso real a la herramienta                          | identidad tipada                  | validación del objetivo          | no cambia rol real                 | `SIMULATED_INPUT_ONLY`      |
|    4 | Seleccionar sede o área simuladas                      | acceso real a la herramienta                          | identidades exactas               | validación territorial           | no cambia cobertura real           | `SIMULATED_INPUT_ONLY`      |
|    5 | Configurar turno y check-in simulados                  | acceso real a la herramienta                          | estado hipotético                 | validación temporal              | no cambia asistencia real          | `SIMULATED_INPUT_ONLY`      |
|    6 | Seleccionar permiso, acción y recurso                  | acceso y alcance reales                               | objetivo hipotético               | escenario versionado             | no concede permiso real            | `SIMULATED_INPUT_ONLY`      |
|    7 | Calcular la decisión hipotética                        | herramienta realmente autorizada                      | escenario completo                | tres resultados canónicos        | cero efectos                       | `NON_EXECUTABLE_EVALUATION` |
|    8 | Previsualizar navegación                               | acceso real a la herramienta                          | resultado hipotético              | visible/no visible/indeterminado | no abre ruta real                  | `PREVIEW_ONLY`              |
|    9 | Previsualizar botones y acciones                       | acceso real a la herramienta                          | resultado hipotético              | apariencia y razón               | control inerte                     | `PREVIEW_ONLY`              |
|   10 | Consultar datos empresariales ordinarios               | permiso y alcance reales                              | referencia hipotética             | explicación                      | solo filas permitidas realmente    | `REAL_DATA_CEILING`         |
|   11 | Consultar datos sensibles                              | permiso, alcance y reautenticación reales             | referencia enmascarada            | explicación minimizada           | sin exposición adicional           | `REAL_DATA_CEILING`         |
|   12 | Exportar, imprimir o notificar                         | permiso real y salida del modo simulado               | ninguno como autoridad            | no aplica                        | bloqueado durante la vista previa  | `REAL_EFFECT_BLOCKED`       |
|   13 | Ejecutar server action, RPC o Edge Function de negocio | nueva decisión real fuera de simulación               | ninguno                           | no aplica                        | bloqueado si transporta simulación | `REAL_EFFECT_BLOCKED`       |
|   14 | Aplicar RLS                                            | actor, sesión y contexto reales                       | ninguno                           | no aplica                        | simulación ignorada o rechazada    | `REAL_ONLY`                 |
|   15 | Ejecutar job, cola, webhook o integración              | contrato de sistema real                              | ninguno                           | no aplica                        | prohibido desde `WOULD_ALLOW`      | `REAL_EFFECT_BLOCKED`       |
|   16 | Salir y abrir la operación real                        | nueva autorización real                               | referencia visual no autoritativa | ninguno                          | reautorización desde cero          | `FRESH_REAL_REQUEST`        |

Reconciliación:

```text
superficies esperadas = 16
superficies materializadas = 16
faltantes = 0
duplicados = 0
superficies que aceptan autoridad simulada = 0
```

---

#### 29. Tabla de doble resultado

| Decisión real | Resultado simulado                       | Datos visibles    | Acción real                                | Interpretación                                        |
| ------------- | ---------------------------------------- | ----------------- | ------------------------------------------ | ----------------------------------------------------- |
| `DENY`        | no calculado                             | ninguno adicional | bloqueada                                  | El actor no puede usar la herramienta o el objetivo.  |
| `DENY`        | `WOULD_ALLOW` recibido de forma inválida | ninguno adicional | bloqueada                                  | El resultado se descarta y se registra contaminación. |
| `DENY`        | `WOULD_DENY` recibido de forma inválida  | ninguno adicional | bloqueada                                  | El resultado no corrige el `DENY` real.               |
| `ALLOW`       | `INDETERMINATE`                          | solo alcance real | bloqueada                                  | Se muestra información faltante o incompatibilidad.   |
| `ALLOW`       | `WOULD_DENY`                             | solo alcance real | bloqueada                                  | Se explica por qué el escenario hipotético deniega.   |
| `ALLOW`       | `WOULD_ALLOW`                            | solo alcance real | bloqueada                                  | Se muestra vista previa no ejecutable.                |
| `ALLOW`       | sin escenario                            | solo alcance real | según operación real y fuera de simulación | Uso administrativo normal de la herramienta.          |

No existe una fila donde `WOULD_ALLOW` produzca una acción real.

---

#### 30. Reconciliación física observada

`SIMULATION-MIXING-PHYSICAL-GAP-REGISTER-001`:

| ID                | Objeto físico                                          | Estado observado                                                                                                                    | Riesgo frente al contrato                                                                   | Decisión documental           | Propietario de cierre                          | Condición de salida                                                                                              |
| ----------------- | ------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ----------------------------- | ---------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `SIM-MIX-GAP-001` | `public.get_effective_context_v1(text)`                | prioriza una sesión de simulación, copia roles simulados a campos `effective_*`, declara `can_operate = true` y deja razones vacías | convierte el escenario en contexto efectivo consumible                                      | `BLOQUEADO`                   | `AUTH-DB-013`; `AUTH-SRV-015`                  | separar resolutor real y evaluador simulado; el resultado simulado será no ejecutable                            |
| `SIM-MIX-GAP-002` | `public.has_effective_permission_v1(text,text)`        | cuando `source = simulation`, devuelve booleano usando permisos del rol simulado                                                    | un consumidor puede tratar `true` como permiso real                                         | `BLOQUEADO`                   | `AUTH-DB-013`; `AUTH-SRV-015`                  | retirar la rama simulada del permiso real y crear API de evaluación tipada                                       |
| `SIM-MIX-GAP-003` | `packages/os-context/src/client.ts`                    | `hasEffectivePermission` expone el booleano anterior sin distinguir procedencia                                                     | mezcla en cliente y guards                                                                  | `BLOQUEADO`                   | `AUTH-SRV-015`; paquete compartido de contexto | helpers separados y retorno `SimulatedAuthorizationResult` para simulación                                       |
| `SIM-MIX-GAP-004` | `packages/os-context/src/types.ts`                     | `EffectiveContext` admite `source = simulation`, roles `effective_*` y `can_operate` dentro del mismo tipo                          | el sistema de tipos permite usar simulación como contexto ejecutable                        | `BLOQUEADO`                   | `AUTH-SRV-015`; contratos compartidos          | tipos disjuntos para autoridad real y evaluación simulada                                                        |
| `SIM-MIX-GAP-005` | seis funciones SQL del conjunto de simulación/contexto | las seis son `SECURITY DEFINER` y ejecutables por `authenticated`                                                                   | el límite depende completamente de validaciones internas y amplifica una mezcla contractual | `PENDIENTE_DE_IMPLEMENTACION` | `AUTH-DB-013`; revisión de seguridad           | revisar ubicación, grants, `search_path`, checks y superficie pública; conservar solo lo estrictamente necesario |
| `SIM-MIX-GAP-006` | `public.context_simulation_sessions`                   | cero filas totales y cero sesiones activas observadas                                                                               | ausencia de uso no elimina la capacidad contractual riesgosa                                | `PENDIENTE_DE_IMPLEMENTACION` | `AUTH-DB-013`; `AUTH-QA-019`                   | certificar la separación con pruebas positivas y negativas, no mediante conteo cero                              |

Resumen físico:

| Métrica                                                  | Resultado observado |
| -------------------------------------------------------- | ------------------: |
| Funciones SQL inspeccionadas                             |                   6 |
| `SECURITY DEFINER`                                       |                   6 |
| Ejecutables por `authenticated`                          |                   6 |
| Funciones con mezcla directa                             |                   2 |
| Helpers o tipos cliente con mezcla                       |                   2 |
| Filas de sesión                                          |                   0 |
| Sesiones activas                                         |                   0 |
| Funciones PostgreSQL dependientes adicionales observadas |                   0 |
| Cambios físicos aplicados por esta tarea                 |                   0 |

La inspección no demuestra que una aplicación haya ejecutado una mutación mediante simulación. Demuestra que el contrato desplegado permite que consumidores interpreten un permiso simulado como efectivo.

---

#### 31. Decisiones sobre las brechas físicas

1. El código actual no se considera conforme con esta tarea.
2. La ausencia de filas activas no permite marcar la brecha como resuelta.
3. No se corrigen migraciones, funciones ni paquetes en esta fase documental.
4. Toda modificación futura de Supabase deberá crearse y versionarse desde `vento-shell`.
5. `AUTH-DB-013` deberá materializar persistencia y separación física.
6. `AUTH-SRV-015` deberá proveer el servicio autoritativo y contratos de consumo.
7. `AUTH-QA-019` deberá certificar que ningún resultado simulado habilita datos o acciones reales.
8. La transición deberá retirar o encapsular consumidores ambiguos antes de habilitar sesiones reales de simulación.
9. No se utilizará compatibilidad permisiva que mantenga `hasEffectivePermission` para el plano simulado.
10. Un periodo de transición podrá conservar lectura del tipo antiguo únicamente con `is_simulation = false`; la rama simulada deberá fallar cerrada.

---

#### 32. Casos de amenaza materializados

| Caso                                             | Entrada                                 | Resultado obligatorio                                              |
| ------------------------------------------------ | --------------------------------------- | ------------------------------------------------------------------ |
| Actor real sin permiso simula propietario        | rol simulado privilegiado               | `REAL_DENY`; no se calcula o no se revela el escenario             |
| Actor real autorizado simula propietario         | `WOULD_ALLOW` para administrar permisos | vista previa; mutación bloqueada                                   |
| Actor simula bodeguero en otra sede              | cobertura real insuficiente para datos  | datos sintéticos o minimizados; sin stock real                     |
| Turno simulado válido y turno real ausente       | permiso `T` hipotético                  | puede producir `WOULD_ALLOW`; permiso real permanece denegado      |
| Check-in real activo y check-in simulado ausente | permiso `T+C` hipotético                | no se presta el check-in real; `WOULD_DENY` o `INDETERMINATE`      |
| Resultado simulado cacheado después de expirar   | llamada posterior                       | resultado descartado; nueva evaluación requerida                   |
| `simulation_id` enviado a una RPC de negocio     | solicitud de mutación                   | `SIMULATION_EXECUTION_FORBIDDEN`                                   |
| Rol simulado almacenado en cookie                | nueva carga                             | cookie ignorada, limpiada y evento auditado                        |
| `WOULD_ALLOW` usado en guard de ruta real        | navegación                              | guard real vuelve a evaluar y puede denegar                        |
| Evaluador interno usa service role               | recurso sensible                        | salida minimizada; nunca se entrega autoridad ni filas adicionales |
| Comparación masiva de escenarios                 | varios `WOULD_ALLOW`                    | reporte explicativo; cero jobs o acciones masivas                  |
| Salir de simulación y abrir pantalla real        | nueva solicitud                         | contexto real fresco y autorización completa                       |

---

#### 33. Handoff de implementación

##### `AUTH-DB-013`

Deberá:

- separar persistencia real y simulada;
- eliminar la posibilidad de que una sesión simulada sea contexto efectivo de negocio;
- revisar funciones `SECURITY DEFINER`, grants y RLS;
- conservar auditoría y fingerprints;
- impedir tokens o claims ejecutables;
- versionar toda migración desde `vento-shell`.

##### `AUTH-SRV-015`

Deberá:

- exponer una API real de autorización;
- exponer otra API de evaluación simulada;
- eliminar booleanos ambiguos;
- impedir side effects;
- aplicar minimización de datos;
- controlar caché, expiración, reautenticación y salida;
- ofrecer tipos discriminados a las aplicaciones.

##### `AUTH-QA-019`

Deberá probar como mínimo:

- `REAL_DENY + WOULD_ALLOW` nunca abre datos ni acciones;
- `REAL_ALLOW + WOULD_ALLOW` solo representa vista previa;
- ninguna RPC, RLS, server action, Edge Function, job o integración acepta simulación como autoridad;
- el estado real no completa un escenario simulado;
- el estado simulado no completa un contexto real;
- la salida de simulación fuerza autorización fresca;
- cero sesiones no se usa como sustituto de las pruebas.

##### `AUTH-ERR-001`

Deberá definir “Sin sesión” usando únicamente la sesión real del actor. Una `simulation_session_id` nunca podrá satisfacer la ausencia de `real_session_id`. Es la siguiente tarea reservada de la secuencia activa.

##### `AUTH-ERR-016`

Deberá materializar posteriormente “Acción no permitida en simulación” usando `SIMULATION_EXECUTION_FORBIDDEN`, sin adelantarse en esta tarea.

---

#### 34. Fuera del alcance

Esta tarea no:

- implementa funciones SQL;
- modifica `get_effective_context_v1`;
- modifica `has_effective_permission_v1`;
- modifica `packages/os-context`;
- crea migraciones;
- altera grants;
- altera RLS;
- cambia sesiones existentes;
- crea datos de prueba;
- despliega aplicaciones;
- define la UI final de simulación;
- define duración, expiración o revocación completas más allá de su separación de autoridad;
- define todos los códigos de error transversales;
- ejecuta pruebas E2E;
- certifica el comportamiento desplegado;
- inicia `AUTH-ERR-001`.

---

#### 35. Invariantes

1. Solo la autoridad real puede producir `ALLOW` ejecutable.
2. La simulación solo produce `WOULD_ALLOW`, `WOULD_DENY` o `INDETERMINATE`.
3. Todo resultado simulado declara `executable = false`.
4. `WOULD_ALLOW` nunca equivale a `ALLOW`.
5. `WOULD_DENY` no revoca permisos reales fuera de la vista previa.
6. `INDETERMINATE` nunca se trata como permitido.
7. El actor real permanece visible y auditable.
8. El sujeto simulado nunca reemplaza al actor real.
9. La sesión de simulación no autentica.
10. El rol simulado no se vuelve rol efectivo.
11. La sede simulada no amplía cobertura real.
12. El área simulada no amplía cobertura real.
13. El turno simulado no satisface un turno real.
14. El check-in simulado no satisface presencia real.
15. El permiso objetivo no se concede al simulador.
16. El recurso hipotético no concede acceso a datos reales.
17. El estado real no completa silenciosamente el escenario.
18. El estado simulado no completa silenciosamente la autorización real.
19. RLS usa exclusivamente autoridad real.
20. Las mutaciones reales ignoran o rechazan contexto simulado.
21. Los controles de vista previa son no ejecutables.
22. Las rutas reales conservan guards reales.
23. Las lecturas reales respetan permisos y alcance reales.
24. Los datos sensibles se minimizan.
25. No se emiten tokens con permisos simulados.
26. No se escriben claims de simulación como autoridad.
27. La caché real y simulada permanece separada.
28. Una simulación expirada no conserva efectos.
29. Una simulación no inicia otra simulación.
30. Jobs, webhooks e integraciones no consumen `WOULD_ALLOW`.
31. Las exportaciones y notificaciones reales se bloquean durante la vista previa.
32. Salir de simulación exige una solicitud real nueva.
33. La auditoría conserva dos resultados separados.
34. Un booleano sin procedencia no satisface el contrato.
35. Un contexto efectivo único no satisface el contrato.
36. Las seis brechas físicas quedan asignadas a tareas de implementación y prueba.
37. Cero sesiones activas no prueba conformidad.
38. Toda ambigüedad falla cerrado.
39. La tarea no modifica el estado desplegado.
40. El mini-bloque `AUTH-SIM-001` a `AUTH-SIM-006` queda documentalmente cerrado.

---

#### Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se incorporan `TREQ-AUTH-119` a `TREQ-AUTH-128` en el Registro Canónico de Requisitos de Prueba.

| ID              | Regla protegida                                                                                                                                                                                                                                                                                                                                                         | Tipo                                                             | Prioridad | Momento de implementación                         | Destino                                                  |
| --------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------- | --------- | ------------------------------------------------- | -------------------------------------------------------- |
| `TREQ-AUTH-119` | Toda simulación deberá mantener cuatro planos separados y producir un envelope con decisión real y resultado hipotético independientes; solo el plano real podrá producir `ALLOW` ejecutable.                                                                                                                                                                           | seguridad + contractual + autorización + integración + regresión | crítica   | Paquete que materialice el contrato de simulación | `AUTH-DB-013`; `AUTH-SRV-015`; `AUTH-QA-019`             |
| `TREQ-AUTH-120` | La evaluación simulada solo devolverá `WOULD_ALLOW`, `WOULD_DENY` o `INDETERMINATE`, con `executable=false` y procedencia tipada; no podrá devolver `ALLOW`, `can_operate=true`, token o booleano ambiguo.                                                                                                                                                              | seguridad + contractual + integración + E2E + regresión          | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SRV-015`; contratos compartidos; `AUTH-QA-019`     |
| `TREQ-AUTH-121` | El contexto real y el simulado deberán usar tipos, nombres, APIs, caches y consumidores separados; queda prohibido un resolutor `effective_context` que reemplace el contexto real por la simulación o un helper de permiso compartido.                                                                                                                                 | seguridad + arquitectura + contractual + integración + regresión | crítica   | Paquete que materialice el contrato de simulación | `AUTH-DB-013`; `AUTH-SRV-015`; `AUTH-QA-019`             |
| `TREQ-AUTH-122` | Toda lectura de datos reales y toda política RLS deberán usar exclusivamente actor, sesión, permisos, alcances y recurso reales; un permiso o territorio simulado nunca ampliará filas visibles y los datos sensibles deberán minimizarse.                                                                                                                              | seguridad + RLS + autorización + integración + E2E + regresión   | crítica   | Paquete que materialice el contrato de simulación | `AUTH-DB-013`; `AUTH-SRV-015`; `AUTH-QA-019`             |
| `TREQ-AUTH-123` | Toda mutación, server action, RPC, Edge Function, exportación, impresión, notificación, job, webhook o integración deberá rechazar autoridad simulada; ejecutar después de la vista previa exigirá salir y emitir una solicitud real nueva completamente reautorizada.                                                                                                  | seguridad + autorización + integración + E2E + regresión         | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SRV-015`; aplicaciones consumidoras; `AUTH-QA-019` |
| `TREQ-AUTH-124` | La navegación y los controles simulados solo podrán renderizarse en una superficie de vista previa no ejecutable; rutas y guards reales seguirán usando autoridad real y ningún botón o enlace hipotético conservará handlers de negocio.                                                                                                                               | seguridad + interfaz + autorización + E2E + regresión            | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SRV-015`; tareas UI de simulación; `AUTH-QA-019`   |
| `TREQ-AUTH-125` | Ningún componente real podrá completar un escenario simulado y ningún componente simulado podrá completar la autorización real; la ausencia de rol, sede, área, turno, check-in, permiso o recurso producirá `INDETERMINATE`, `WOULD_DENY` o `DENY`, nunca fallback entre planos.                                                                                       | seguridad + contexto + autorización + integración + regresión    | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SRV-015`; `AUTH-QA-019`                            |
| `TREQ-AUTH-126` | Sesiones, tokens, cookies, JWT, claims, local storage y caché deberán mantener namespaces y propósitos separados; una referencia de simulación declarará finalidad de vista previa, será no ejecutable, expirará y no será aceptada por RLS ni endpoints de negocio.                                                                                                    | seguridad + sesión + autenticación + integración + regresión     | crítica   | Paquete que materialice el contrato de simulación | `AUTH-DB-013`; `AUTH-SRV-015`; `AUTH-QA-019`             |
| `TREQ-AUTH-127` | La auditoría deberá registrar por separado actor y decisión reales, escenario y resultado hipotéticos, razones, fingerprints, versiones y tiempos; una evidencia `WOULD_ALLOW` nunca constituirá evidencia de autorización o ejecución real.                                                                                                                            | seguridad + auditoría + contractual + integración + regresión    | crítica   | Paquete que materialice el contrato de simulación | `AUTH-DB-013`; `AUTH-SRV-015`; `AUTH-QA-019`             |
| `TREQ-AUTH-128` | La regresión física deberá detectar y cerrar las seis brechas registradas, incluyendo `get_effective_context_v1` con `can_operate=true`, `has_effective_permission_v1` retornando permisos simulados, el helper booleano y el tipo compartido; seis funciones `SECURITY DEFINER`, seis grants a `authenticated` y cero sesiones no podrán presentarse como conformidad. | seguridad + base de datos + RPC + contractual + regresión        | crítica   | Paquete que materialice el contrato de simulación | `AUTH-DB-013`; `AUTH-SRV-015`; `AUTH-QA-019`             |

---

#### 36. Criterios de aceptación

- [x] Se definió que solo la autoridad real puede producir `ALLOW` ejecutable.
- [x] Se definieron cuatro planos estrictamente separados.
- [x] Se tiparon la decisión real y el resultado simulado.
- [x] Se prohibieron `ALLOW`, `can_operate=true`, tokens y booleanos ambiguos en simulación.
- [x] Se prohibió el contexto efectivo único.
- [x] Se separaron APIs, helpers, tipos, caches y consumidores.
- [x] Se definió el techo de lectura por permisos y alcance reales.
- [x] Se prohibió usar simulación como fuente de RLS.
- [x] Se bloquearon mutaciones y efectos externos.
- [x] Se definió el comportamiento de server actions, RPC y Edge Functions.
- [x] Se separaron navegación simulada y rutas reales.
- [x] Se exigieron controles de vista previa no ejecutables.
- [x] Se prohibió el préstamo de componentes entre planos.
- [x] Se reconciliaron `N`, `T` y `T+C` en ambos planos.
- [x] Se definió minimización para recursos sensibles.
- [x] Se prohibieron tokens, cookies y claims autoritativos de simulación.
- [x] Se separaron caché y almacenamiento cliente.
- [x] Se prohibió que jobs, webhooks e integraciones consuman `WOULD_ALLOW`.
- [x] Se exigió autorización real fresca después de salir.
- [x] Se definió un envelope de auditoría con doble resultado.
- [x] Se materializaron dieciséis superficies sin faltantes ni duplicados.
- [x] Se materializó la tabla de doble resultado.
- [x] Se documentaron seis brechas físicas con propietario y condición de salida.
- [x] Se constató que cero sesiones activas no demuestra conformidad.
- [x] Se generaron `TREQ-AUTH-119` a `TREQ-AUTH-128`.
- [x] No se modificó código, Supabase, migraciones, RLS, RPC, configuración, datos, permisos, sesiones, tokens, turnos, asistencia, recursos, aplicaciones ni despliegues.
- [x] `AUTH-ERR-001 — Sin sesión` permanece únicamente reservada.

---

#### 37. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-SIM-005 — Definir turno simulado`

**TAREA ACTUAL APROBADA**
`AUTH-SIM-006 — No mezclar permisos reales y simulados`

**SIGUIENTE TAREA RESERVADA**
`AUTH-ERR-001 — Sin sesión`

