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
**Decisiones y contratos consumidos:** `AUTH-MOD-012`, `AUTH-CAT-010`, `AUTH-CAT-014`, `AUTH-RBAC-001`, `AUTH-RBAC-002`, `AUTH-RBAC-003`, `AUTH-RBAC-004`, matrices funcionales vigentes, `AUTH-CTX-003`, `AUTH-UI-037`, `AUTH-DEV-005` y `AUTH-DEV-006`
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
| Roles base con decisión explícita según matrices vigentes                |        9 |
| Roles con asignación base del permiso de simulación                      |        2 |
| Roles sin asignación base del permiso                                    |        7 |
| Clases adicionales de actor o principal evaluadas                        |        7 |
| Decisiones totales del registro de elegibilidad                          |       16 |
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
| `contador`                | `NOT_ASSIGN`                                                      | `DEFAULT_DENY`                | Acceso financiero no implica acceso al simulador.                                                                       |
| `marketing`               | `NOT_ASSIGN`                                                      | `DEFAULT_DENY`                | Acceso a contenidos o campañas no implica acceso al simulador.                                                          |
| `logistica`               | `NOT_ASSIGN`                                                      | `DEFAULT_DENY`                | Coordinación logística no implica acceso al simulador.                                                                  |
| `auxiliar_administrativa` | `NOT_ASSIGN`                                                      | `DEFAULT_DENY`                | Funciones administrativas no implican acceso al simulador.                                                              |
| `talento_humano`          | `NOT_ASSIGN`                                                      | `DEFAULT_DENY`                | Acceso laboral o de personal no implica acceso al simulador.                                                            |

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

Las siete clases complementan las nueve decisiones de rol y cubren intentos que no deben modelarse como roles humanos.

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
| Matrices de otros siete roles revisados       | Conservan `NOT_ASSIGN`; no reciben acceso por jerarquía.                                     | `ESPECIFICADO`                            |
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

| ID              | Regla protegida                                                                                                                                                                                                                                                                                                                                              | Tipo                                                       | Prioridad | Momento de implementación                         | Destino                                                        |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------- | --------- | ------------------------------------------------- | -------------------------------------------------------------- |
| `TREQ-AUTH-069` | Una solicitud de simulación solo podrá iniciarse cuando exista actor humano efectivo, sesión personal real válida, `viso.access`, `viso.authorization.context_simulations.view`, carril base, alcance suficiente, justificación, reautenticación requerida y ausencia de denegaciones; un componente ausente o ambiguo producirá `DENY`.                     | seguridad + autorización + integración + E2E + regresión   | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SRV-015`; `AUTH-QA-019`; paquete E5 de simulación        |
| `TREQ-AUTH-070` | Las matrices vigentes deberán conservar como candidatos base únicamente a `propietario` y `gerente_general`; `gerente`, `supervisor`, `contador`, `marketing`, `logistica`, `auxiliar_administrativa` y `talento_humano` permanecerán sin asignación base. Ningún rol o rango jerárquico podrá sustituir el permiso efectivo.                                | contractual + autorización + estática + regresión          | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-001`; `AUTH-DB-013`; `AUTH-QA-019`                   |
| `TREQ-AUTH-071` | Un `INDIVIDUAL_GRANT` para simular deberá usar la clave exacta, ser vigente, acotado, auditable y compatible con el alcance real del actor; no podrá derivarse del cargo ni prevalecer sobre denegaciones estructurales, transversales, individuales o de carril.                                                                                            | seguridad + autorización + base de datos + regresión       | crítica   | Paquete que materialice el contrato de simulación | `AUTH-DB-013`; `AUTH-SRV-015`; `AUTH-QA-019`                   |
| `TREQ-AUTH-072` | Una simulación interactiva no podrá ser solicitada por principal técnico, dispositivo compartido, service role, integración, sesión anónima o cuenta compartida. El techo del dispositivo, una pantalla visible o un permiso técnico nunca crearán un simulador humano.                                                                                      | seguridad + identidad + integración + E2E + regresión      | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SRV-015`; `AUTH-DEV-008` a `AUTH-DEV-010`; `AUTH-QA-019` |
| `TREQ-AUTH-073` | El alcance solicitado deberá ser subconjunto del alcance real autorizado del simulador sobre sujeto, organización, sede, área, permiso, acción y recurso. `OWN` no habilitará terceros, `THIRD_PARTY_EXPLICIT` exigirá cobertura concreta y valores desconocidos o `null` no significarán alcance global.                                                    | seguridad + autorización + integración + E2E + regresión   | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-002` a `AUTH-SIM-005`; `AUTH-SRV-015`; `AUTH-QA-019` |
| `TREQ-AUTH-074` | La simulación de terceros, roles privilegiados, permisos sensibles o recursos financieros, personales, laborales, médicos, disciplinarios, de seguridad o autenticación deberá exigir reautenticación fuerte personal vinculada al actor, sesión, solicitud y objetivo; PIN ligero o evidencia transferida no serán válidos.                                 | seguridad + autenticación + autorización + E2E + regresión | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-008`; `AUTH-SRV-015`; `AUTH-QA-019`                  |
| `TREQ-AUTH-075` | Una sesión revocada, expirada, conflictiva, no personal o incapaz de reconstruir el contexto real deberá denegar la solicitud. Una simulación activa no podrá iniciar, modificar, inspeccionar privilegiadamente ni cerrar otra simulación; deberá salirse al contexto real y reautorizarse.                                                                 | seguridad + sesión + contexto + E2E + regresión            | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-006` a `AUTH-SIM-010`; `AUTH-SRV-015`; `AUTH-QA-019` |
| `TREQ-AUTH-076` | Autorizar una solicitud de simulación no podrá modificar sesión, actor, rol, asignaciones, turno, check-in, permisos ni contexto real; tampoco podrá crear tokens, ejecutar la acción simulada, producir mutaciones empresariales ni convertir el resultado en autoridad operativa.                                                                          | seguridad + autorización + integración + E2E + regresión   | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-006` a `AUTH-SIM-014`; `AUTH-SRV-015`; `AUTH-QA-019` |
| `TREQ-AUTH-077` | Todo intento de simulación, permitido o denegado, deberá registrar actor y sesión reales, fuente del permiso, objetivo, alcance, justificación, denegaciones, reautenticación, versiones y razones estructuradas, minimizando secretos y datos sensibles.                                                                                                    | seguridad + auditoría + integración + regresión            | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-013`; `AUTH-DB-013`; `AUTH-SRV-015`; `AUTH-QA-019`   |
| `TREQ-AUTH-078` | El registro de elegibilidad deberá cubrir exactamente nueve decisiones de rol y siete clases adicionales de actor o principal, con dos roles `BASE_CANDIDATE`, siete roles `DEFAULT_DENY`, cero habilitaciones por jerarquía, cero principales técnicos elegibles y una decisión fail closed para cada condición incompleta, conflictiva o fuera de alcance. | contractual + estática + regresión                         | crítica   | Paquete que materialice el contrato de simulación | `AUTH-SIM-001`; `AUTH-QA-019`                                  |

---

#### 27. Criterios de aceptación

- [x] Se distinguió al solicitante real del actor, rol y contexto simulados.
- [x] Se definió la fórmula completa de elegibilidad.
- [x] Se exigieron `viso.access` y el permiso exacto de simulación.
- [x] Se materializaron nueve decisiones actuales de rol.
- [x] Solo `propietario` y `gerente_general` quedaron como candidatos base por matriz.
- [x] Siete roles permanecieron en `DEFAULT_DENY`.
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


### [ ] AUTH-SIM-002 — Definir roles simulables
### [ ] AUTH-SIM-003 — Definir sede simulada
### [ ] AUTH-SIM-004 — Definir área simulada
### [ ] AUTH-SIM-005 — Definir turno simulado
### [ ] AUTH-SIM-006 — No mezclar permisos reales y simulados
