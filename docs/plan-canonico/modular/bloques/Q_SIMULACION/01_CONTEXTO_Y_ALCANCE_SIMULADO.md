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


### ✅ AUTH-SIM-002 — Definir roles simulables

**Estado:** APROBADA
**Tarea anterior:** `AUTH-SIM-001 — Definir quién puede simular` — APROBADA
**Tarea siguiente:** `AUTH-SIM-003 — Definir sede simulada` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de roles objetivo simulables y registro materializado de identidades de rol base, operativo, legacy, deprecado, ausente y ambiguo
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Q_SIMULACION/01_CONTEXTO_Y_ALCANCE_SIMULADO.md`
**Artefactos producidos:** `SIMULATABLE-ROLE-CONTRACT-001`, `SIMULATABLE-ROLE-REGISTER-001` y `SIMULATABLE-ROLE-PHYSICAL-RECONCILIATION-001`
**Decisiones y contratos consumidos:** `AUTH-MOD-002` a `AUTH-MOD-006`, `AUTH-MOD-012`, matrices canónicas vigentes, `AUTH-SIM-001`, catálogo documental de roles base, catálogo documental de roles operativos y estado físico observado de `public.roles` y `public.operational_roles`
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
| Roles base canónicos con decisión explícita                         |        9 |
| Roles operativos canónicos con decisión explícita                   |       12 |
| Objetivos canónicos simulables                                      |       21 |
| Objetivos canónicos disponibles en el catálogo físico observado     |       18 |
| Objetivos canónicos pendientes de materialización física            |        3 |
| Identidades físicas legacy o deprecadas expresamente bloqueadas     |       10 |
| Identidades tipadas únicas cubiertas por la unión canónica y física |       31 |
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

Los nueve roles base actuales reciben decisión explícita:

| Identidad tipada               | Clase                  | Decisión canónica | Estado físico observado    | Reautenticación del objetivo | Regla                                                                                                       |
| ------------------------------ | ---------------------- | ----------------- | -------------------------- | ---------------------------- | ----------------------------------------------------------------------------------------------------------- |
| `BASE/propietario`             | `PRIVILEGED`           | `SIMULABLE`       | `AVAILABLE`                | `REQUIRED`                   | Vista de gobierno y capacidades reservadas; nunca produce wildcard ni bypass.                               |
| `BASE/gerente_general`         | `PRIVILEGED`           | `SIMULABLE`       | `AVAILABLE`                | `REQUIRED`                   | Vista ejecutiva global según matriz exacta; no hereda capacidades de propietario.                           |
| `BASE/gerente`                 | `ADMINISTRATIVE`       | `SIMULABLE`       | `AVAILABLE`                | `REQUIRED`                   | Se evalúa con cobertura administrativa explícita; multisede no equivale a global.                           |
| `BASE/supervisor`              | `ADMINISTRATIVE`       | `SIMULABLE`       | `BLOCKED_NOT_MATERIALIZED` | `REQUIRED`                   | Es objetivo canónico, pero la inspección física no encontró su fila; runtime deniega hasta materialización. |
| `BASE/auxiliar_administrativa` | `FUNCTIONAL`           | `SIMULABLE`       | `AVAILABLE`                | `CONDITIONAL`                | Solo matriz funcional exacta; no se convierte en autoridad gerencial ni operativa.                          |
| `BASE/contador`                | `FUNCTIONAL_SENSITIVE` | `SIMULABLE`       | `AVAILABLE`                | `CONDITIONAL_SENSITIVE`      | La vista podrá enmascarar datos y exigir STRONG según permiso, recurso o tercero.                           |
| `BASE/marketing`               | `FUNCTIONAL`           | `SIMULABLE`       | `AVAILABLE`                | `CONDITIONAL`                | Se limita a capacidades asignadas; no crea administración global.                                           |
| `BASE/logistica`               | `FUNCTIONAL`           | `SIMULABLE`       | `BLOCKED_NOT_MATERIALIZED` | `CONDITIONAL`                | Es objetivo documental vigente; runtime deniega hasta existir código y matriz físicos exactos.              |
| `BASE/talento_humano`          | `FUNCTIONAL_SENSITIVE` | `SIMULABLE`       | `BLOCKED_NOT_MATERIALIZED` | `CONDITIONAL_SENSITIVE`      | Es objetivo documental vigente; datos laborales sensibles siguen controlados por el solicitante real.       |

`REQUIRED` significa reautenticación fuerte obligatoria para seleccionar o inspeccionar ese objetivo administrativo o privilegiado. `CONDITIONAL` y `CONDITIONAL_SENSITIVE` se resuelven conforme al permiso, recurso, tercero, sensibilidad y detalle solicitado; ante duda se exige STRONG o se minimiza el resultado.

Los tres roles pendientes de materialización no se sustituyen por otro código ni se crean mediante esta tarea.

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

| Catálogo físico                   | Filas activas observadas | Decisión de esta tarea                                                                    |
| --------------------------------- | -----------------------: | ----------------------------------------------------------------------------------------- |
| `public.roles`                    |                       15 | 6 objetivos base canónicos disponibles y 9 identidades base legacy bloqueadas.            |
| `public.operational_roles`        |                       13 | 12 objetivos operativos canónicos disponibles y `propietario_admin` bloqueado.            |
| Unión de filas tipadas            |                       28 | Todas reciben decisión explícita.                                                         |
| Códigos bare distintos            |                       27 | `bodeguero` aparece en ambos catálogos y exige `role_kind`.                               |
| Roles base canónicos no presentes |                        3 | `supervisor`, `logistica` y `talento_humano` permanecen bloqueados hasta materialización. |

Esta evidencia no modifica el estado desplegado ni afirma que el contrato ya esté implementado. Solo evita que la definición documental ignore brechas físicas actuales.

---

#### 24. Registro materializado consolidado

El registro cubre 31 identidades tipadas únicas:

| Grupo                                  | Cantidad | Distribución                                 |
| -------------------------------------- | -------: | -------------------------------------------- |
| Roles base canónicos                   |        9 | 6 `AVAILABLE`; 3 `BLOCKED_NOT_MATERIALIZED`. |
| Roles operativos canónicos             |       12 | 12 `AVAILABLE`.                              |
| Roles base físicos legacy no canónicos |        9 | 9 `BLOCKED_LEGACY`.                          |
| Rol operativo físico deprecado         |        1 | 1 `BLOCKED_DEPRECATED`.                      |
| Total unión canónica y física          |       31 | 21 simulables canónicos; 10 no simulables.   |

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
- creación de `supervisor`, `logistica` o `talento_humano` en Supabase;
- eliminación física de `propietario_admin`;
- actualización física de matrices;
- ejecución de simulaciones;
- pruebas operativas.

Estas responsabilidades permanecen en sus tareas canónicas. Ninguna podrá cambiar la lista de roles objetivo sin una modificación canónica explícita de este contrato.

---

#### 27. Handoff exacto a AUTH-SIM-003

`AUTH-SIM-003` deberá definir la sede simulada conservando:

1. las 21 identidades de rol objetivo aprobadas aquí;
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
5. Existen nueve roles base canónicos objetivo.
6. Existen doce roles operativos canónicos objetivo.
7. Los 21 objetivos canónicos son simulables conceptualmente.
8. Solo 18 están disponibles en el catálogo físico observado.
9. Tres roles base canónicos permanecen bloqueados hasta materialización.
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

| ID              | Regla protegida                                                                                                                                                                                                                                            | Tipo                                                           | Prioridad | Momento de implementación                                               | Destino                                                        |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------- | --------- | ----------------------------------------------------------------------- | -------------------------------------------------------------- |
| `TREQ-AUTH-079` | Toda referencia de rol objetivo deberá declarar `role_kind`, `role_code`, versión de catálogo y versión de matriz; un código bare, etiqueta visual, alias o valor enviado por cliente no podrá resolver una identidad simulable.                           | seguridad + contractual + integración + regresión              | crítica   | Paquete que materialice el contrato de simulación                       | `AUTH-DB-013`; `AUTH-SRV-015`; `AUTH-QA-019`                   |
| `TREQ-AUTH-080` | El registro base deberá cubrir exactamente nueve roles canónicos simulables: seis disponibles físicamente y tres bloqueados hasta materialización, sin sustituir los ausentes por otros códigos.                                                           | contractual + base de datos + estática + regresión             | crítica   | Paquete que materialice el contrato de simulación                       | `AUTH-SIM-002`; `AUTH-DB-013`; `AUTH-QA-019`                   |
| `TREQ-AUTH-081` | El registro operativo deberá cubrir exactamente doce roles canónicos simulables y exigir contexto hipotético completo para evaluar acciones; el rol aislado no podrá producir `would_allow`.                                                               | autorización + contexto + integración + E2E + regresión        | crítica   | Paquete que materialice el contrato de simulación                       | `AUTH-SIM-003` a `AUTH-SIM-006`; `AUTH-SRV-015`; `AUTH-QA-019` |
| `TREQ-AUTH-082` | Los nueve roles base legacy observados deberán permanecer bloqueados y no podrán convertirse automáticamente en roles operativos mediante alias, semejanza textual, área, aplicación, empleado o fallback.                                                 | seguridad + migración + contractual + regresión                | crítica   | Paquete que materialice el contrato de simulación y transición de roles | `AUTH-DB-013`; tareas de transición de roles; `AUTH-QA-019`    |
| `TREQ-AUTH-083` | `OPERATIONAL/propietario_admin`, todo rol deprecado, inactivo, retirado, desconocido o futuro no aprobado deberá fallar cerrado y no podrá recibir permisos ni autoridad simulada.                                                                         | seguridad + autorización + base de datos + regresión           | crítica   | Paquete que materialice el contrato de simulación                       | `AUTH-DB-013`; `AUTH-SRV-015`; `AUTH-QA-019`                   |
| `TREQ-AUTH-084` | Las colisiones entre catálogos deberán resolverse por identidad tipada; `BASE/bodeguero` y `OPERATIONAL/bodeguero` producirán decisiones distintas y una referencia ambigua deberá denegarse.                                                              | contractual + seguridad + integración + regresión              | crítica   | Paquete que materialice el contrato de simulación                       | `AUTH-SRV-015`; contratos compartidos; `AUTH-QA-019`           |
| `TREQ-AUTH-085` | Seleccionar un rol simulable no podrá modificar actor, sesión, rol real, permisos, RLS, asignaciones ni datos, ni conceder acceso a información que el solicitante real no pueda consultar.                                                                | seguridad + autorización + RLS + integración + E2E + regresión | crítica   | Paquete que materialice el contrato de simulación                       | `AUTH-SIM-006`; `AUTH-SRV-015`; `AUTH-QA-019`                  |
| `TREQ-AUTH-086` | La vista de matriz o navegación deberá separarse de la evaluación de una acción concreta; cuando falten componentes obligatorios, el resultado será `indeterminate` con razón estructurada y nunca `would_allow`.                                          | contractual + contexto + interfaz + E2E + regresión            | crítica   | Paquete que materialice el contrato de simulación                       | `AUTH-SIM-003` a `AUTH-SIM-006`; `AUTH-SRV-015`; `AUTH-QA-019` |
| `TREQ-AUTH-087` | Los objetivos privilegiados, administrativos, de coordinación o sensibles deberán exigir cobertura real suficiente, minimización y reautenticación fuerte conforme al escenario; STRONG nunca ampliará alcance ni autoridad.                               | seguridad + autenticación + autorización + E2E + regresión     | crítica   | Paquete que materialice el contrato de simulación                       | `AUTH-SIM-008`; `AUTH-SRV-015`; `AUTH-QA-019`                  |
| `TREQ-AUTH-088` | El registro consolidado deberá cubrir exactamente 31 identidades tipadas: 21 objetivos canónicos simulables y 10 exclusiones físicas no canónicas, conciliando 18 disponibles, tres pendientes, nueve legacy y una deprecada, sin faltantes ni duplicados. | contractual + estática + base de datos + regresión             | crítica   | Paquete que materialice el contrato de simulación                       | `AUTH-SIM-002`; `AUTH-DB-013`; `AUTH-QA-019`                   |

---

#### 29. Criterios de aceptación

- [x] Se distinguió al solicitante real del rol objetivo.
- [x] Se definió una identidad tipada obligatoria.
- [x] Se exigieron versiones de catálogo y matriz.
- [x] Se materializaron nueve decisiones de roles base canónicos.
- [x] Se materializaron doce decisiones de roles operativos canónicos.
- [x] Se aprobaron 21 objetivos canónicos simulables.
- [x] Se distinguieron 18 objetivos disponibles y tres pendientes de materialización.
- [x] Se materializaron nueve exclusiones de roles base legacy.
- [x] Se bloqueó `OPERATIONAL/propietario_admin`.
- [x] Se cubrieron 31 identidades tipadas únicas.
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


### [ ] AUTH-SIM-004 — Definir área simulada
### [ ] AUTH-SIM-005 — Definir turno simulado
### [ ] AUTH-SIM-006 — No mezclar permisos reales y simulados
