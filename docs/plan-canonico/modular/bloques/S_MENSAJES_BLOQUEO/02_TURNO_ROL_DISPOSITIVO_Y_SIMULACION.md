### MINI-BLOQUE — TURNO ROL DISPOSITIVO Y SIMULACIÓN

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **turno rol dispositivo y simulación** dentro de **S MENSAJES BLOQUEO**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `AUTH-ERR-009` a `AUTH-ERR-016` — 8 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Sin turno publicado” y concluye con “Acción no permitida en simulación”.
<!-- PLAN-SECTION-META:END -->

### ✅ AUTH-ERR-009 — Sin turno publicado

**Estado:** APROBADA
**Tarea anterior:** `AUTH-ERR-008 — Sin área activa` — APROBADA
**Tarea siguiente:** `AUTH-ERR-010 — Fuera de turno` — RESERVADA
**Tipo de tarea:** documental; definición contractual, funcional, temporal, de seguridad y experiencia del bloqueo por ausencia de un turno laboral publicado cuando el carril operativo lo exige
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/S_MENSAJES_BLOQUEO/02_TURNO_ROL_DISPOSITIVO_Y_SIMULACION.md`
**Artefactos producidos:** `PUBLISHED-SHIFT-BLOCKING-CONTRACT-001`, `PUBLISHED-SHIFT-DEPENDENCY-MATRIX-001`, `PUBLISHED-SHIFT-CHANNEL-RESPONSE-MATRIX-001`, `PUBLISHED-SHIFT-APPLICATION-COVERAGE-REGISTER-001` y `PUBLISHED-SHIFT-PHYSICAL-RECONCILIATION-001`
**Decisiones consumidas:** `ADR-AUTH-001`; `AUTH-MOD-001` a `AUTH-MOD-004`; `AUTH-MOD-006` a `AUTH-MOD-011`; `AUTH-MOD-018`; `AUTH-MOD-019`; `AUTH-CAT-006`; `AUTH-CAT-012` a `AUTH-CAT-015`; `AUTH-CTX-001`; `AUTH-CTX-002`; `AUTH-CTX-009` a `AUTH-CTX-017`; `AUTH-CTX-020`; `AUTH-CTX-024` a `AUTH-CTX-030`; `AUTH-ERR-001` a `AUTH-ERR-008`; contratos vigentes de identidad, aplicación, territorio, turno, check-in, rol, permiso, recurso, disponibilidad y precedencia; estado remoto y desplegado inspeccionado; contrato documental vigente
**Cambios físicos autorizados:** ninguno; no modifica código, Supabase, Auth, RLS, RPC, Edge Functions, datos, migraciones, constraints, triggers, turnos, revisiones, publicaciones, empleados, sedes, áreas, roles, permisos, aplicaciones ni despliegues

---

#### 1. Propósito

Definir de forma única, segura y verificable qué debe ocurrir cuando una
solicitud ya superó autenticación, actividad de identidad, acceso a la
aplicación y los prerrequisitos anteriores aplicables, el carril operativo de
la capacidad exige un turno laboral publicado, y la resolución autoritativa no
encuentra una publicación vigente como asignación oficial aplicable al actor y
al intento operativo.

La regla raíz queda:

```text
SESIÓN AUTENTICADA VÁLIDA
+
IDENTIDAD LABORAL ACTIVA
+
ACCESO A LA APLICACIÓN PERMITIDO
+
CAPACIDAD QUE EXIGE CARRIL OPERATIVO CON TURNO
+
RESOLUCIÓN AUTORITATIVA CONCLUYENTE
+
NINGÚN TURNO LABORAL PUBLICADO Y UTILIZABLE
→
DENY
+
AUTH_PUBLISHED_SHIFT_REQUIRED
+
403
+
CERO EFECTOS
```

La tarea responde exclusivamente:

```text
¿ESTA EVALUACIÓN NECESITA UN TURNO PUBLICADO
Y EXISTE UNA ASIGNACIÓN LABORAL PUBLICADA,
AUTORITATIVA Y UTILIZABLE PARA CONTINUAR
CON LA EVALUACIÓN TEMPORAL?
```

No responde:

```text
¿EXISTE SESIÓN?
¿EL USUARIO O EMPLEADO ESTÁ ACTIVO?
¿PUEDE ENTRAR A LA APLICACIÓN?
¿TIENE SEDE O ÁREA ASIGNADA?
¿LA SEDE O EL ÁREA ESTÁN ACTIVAS?
¿EL TURNO PUBLICADO YA COMENZÓ O TERMINÓ?
¿EXISTE CHECK-IN ACTIVO?
¿EL ROL OPERATIVO EXISTE?
¿EL ROL ES VÁLIDO PARA LA SEDE O EL ÁREA?
¿TIENE EL PERMISO EXACTO?
¿EL RECURSO ESTÁ DENTRO DEL SCOPE?
¿EL DISPOSITIVO ESTÁ AUTORIZADO?
¿LA FUENTE TÉCNICA ESTÁ DISPONIBLE?
```

La ausencia de publicación pertenece a `AUTH-ERR-009`. La existencia de una
publicación aplicable fuera de su ventana temporal pertenece a
`AUTH-ERR-010`. Esta frontera es obligatoria y no podrá reducirse de nuevo a
una razón genérica como `out_of_shift`.

---

#### 2. Resultado material

Se aprueban cinco artefactos documentales completos:

1. `PUBLISHED-SHIFT-BLOCKING-CONTRACT-001`, que congela identidad pública,
   aplicabilidad, causas internas, respuesta, recuperación, seguridad,
   frescura y auditoría;
2. `PUBLISHED-SHIFT-DEPENDENCY-MATRIX-001`, que decide veinte escenarios y
   separa ausencia de publicación, temporalidad, check-in, rol, territorio,
   ambigüedad, dispositivo, simulación y fallo técnico;
3. `PUBLISHED-SHIFT-CHANNEL-RESPONSE-MATRIX-001`, que materializa diez canales
   con respuesta equivalente y cero efectos;
4. `PUBLISHED-SHIFT-APPLICATION-COVERAGE-REGISTER-001`, que decide el alcance
   para las diez aplicaciones canónicas sin imponer turno a capacidades base,
   administrativas, de cliente o de sistema;
5. `PUBLISHED-SHIFT-PHYSICAL-RECONCILIATION-001`, que registra catorce brechas
   físicas, el snapshot desplegado y el destino exacto de cada cierre.

Cobertura materializada:

| Elemento                                       |             Cantidad |
| ---------------------------------------------- | -------------------: |
| Código público canónico                        |                    1 |
| Estado HTTP no navegacional                    |             1, `403` |
| Causas internas admitidas                      |                    4 |
| Perfiles derivados de dependencia de turno     |                    5 |
| Escenarios con decisión explícita              |                   20 |
| Canales con respuesta explícita                |                   10 |
| Aplicaciones canónicas reconciliadas           |                   10 |
| Permisos canónicos evaluados por prerrequisito |                  112 |
| Permisos sin carril operativo                  |                   54 |
| Permisos con carril operativo que exige turno  |                   58 |
| Carriles operativos `T`                        |                   19 |
| Carriles operativos `T+C`                      |                   39 |
| Turnos físicos observados                      |                 2844 |
| Turnos publicados observados                   |                 2723 |
| Turnos no publicados observados                |                  121 |
| Turnos laborales observados                    |                 2411 |
| Turnos de descanso observados                  |                  433 |
| Turnos laborales publicados no cancelados      |                 2318 |
| Funciones que referencian `employee_shifts`    |                   10 |
| Funciones que referencian `published_at`       |                    5 |
| Funciones que emiten `out_of_shift`            |                    1 |
| Políticas RLS sobre `employee_shifts`          |                    5 |
| Políticas físicas de aplicación con turno      | 1, únicamente `nexo` |
| Brechas físicas registradas                    |                   14 |
| Requisitos de prueba derivados                 |                   10 |

Las cifras físicas son un snapshot de solo lectura. No certifican que el
contrato esté implementado ni que cada turno histórico satisfaga las reglas
canónicas de revisión, vigencia, rol, territorio o autorización.

---

#### 3. Identidad canónica del bloqueo

La identidad pública única es:

```text
reason_code = AUTH_PUBLISHED_SHIFT_REQUIRED
```

| Propiedad                   | Valor                                                                                       |
| --------------------------- | ------------------------------------------------------------------------------------------- |
| Dominio                     | `AUTHORIZATION_CONTEXT`                                                                     |
| Decisión                    | `DENY`                                                                                      |
| Principal                   | autenticado y conservado                                                                    |
| Identidad requerida         | laboral, existente y activa                                                                 |
| Aplicación                  | acceso general ya permitido                                                                 |
| Estado público              | `MISSING_REQUIRED_PUBLISHED_SHIFT`                                                          |
| Estado HTTP no navegacional | `403 Forbidden`                                                                             |
| Ejecutable                  | `false`                                                                                     |
| Recuperación                | publicar o corregir el turno mediante autoridad administrativa y emitir una solicitud nueva |
| Cierre de sesión            | no automático                                                                               |
| Reintento automático        | prohibido                                                                                   |
| Efectos parciales           | prohibidos                                                                                  |

Quedan prohibidos como identidad pública alternativa:

- `NO_SHIFT`;
- `SHIFT_MISSING`;
- `NO_SCHEDULE`;
- `OUT_OF_SHIFT`;
- `OUT_OF_SCHEDULE`;
- `NOT_CLOCKED_IN`;
- `SHIFT_REQUIRED` sin namespace;
- `NO_PERMISSION`;
- `UNAUTHORIZED` sin tipificación;
- mensajes libres de una aplicación, RPC o política RLS.

El código es estable y no se traduce. El texto humano podrá localizarse.

---

#### 4. Definición exacta de turno publicado utilizable

Un turno publicado es una asignación laboral oficial relativa a un actor, una
ocurrencia de calendario y una revisión autoritativa. Debe conservar identidad,
publicación, clasificación laboral, territorio, rol asignado y procedencia.

```text
ACTOR EFECTIVO EMPLEADO
+
OCURRENCIA DE TURNO RESUELTA
+
REVISIÓN PUBLICADA AUTORITATIVA
+
TURNO LABORAL
+
PUBLICACIÓN NO RETIRADA NI CANCELADA
+
DATOS MÍNIMOS RESOLUBLES
=
PUBLISHED_SHIFT_FACT
```

No significa:

- turno temporalmente vigente;
- check-in activo;
- turno confirmado por el trabajador;
- turno activo;
- permiso concedido;
- autorización final;
- fila de calendario en borrador;
- plantilla de horario;
- descanso;
- última fila consultada;
- turno elegido por el cliente;
- turno inferido desde el rol, la sede, el área o el dispositivo.

La publicación oficializa una revisión concreta. Un cambio posterior en
borrador no modifica la asignación publicada hasta una nueva publicación. La
confirmación del trabajador no participa en la validez operativa.

En la estructura física actual, `employee_shifts.published_at` constituye una
señal legacy de publicación. El modelo canónico futuro deberá conservar una
revisión publicada reproducible y no depender únicamente de la presencia de
ese timestamp.

---

#### 5. Condición exacta de aplicación

`AUTH_PUBLISHED_SHIFT_REQUIRED` se produce únicamente cuando:

1. el permiso, la modalidad o el carril seleccionado exige turno;
2. los prerrequisitos anteriores aplicables fueron resueltos;
3. el actor efectivo es un empleado que puede poseer contexto laboral;
4. las fuentes necesarias fueron consultadas sin error ni ambigüedad;
5. no existe una asignación laboral publicada utilizable para la ocurrencia
   aplicable al intento;
6. no existe una razón anterior más específica que deba prevalecer.

```text
REQUIRES_PUBLISHED_SHIFT = TRUE
AND
PUBLISHED_SHIFT_RESOLUTION = CONCLUSIVE
AND
USABLE_PUBLISHED_LABOR_SHIFT_COUNT = 0
→
AUTH_PUBLISHED_SHIFT_REQUIRED
```

El valor `active_shift = null` no produce automáticamente esta razón. Primero
se debe distinguir entre:

- capacidad sin dependencia de turno;
- ausencia de publicación;
- turno publicado fuera de ventana;
- turno publicado ambiguo o estructuralmente inválido;
- fallo de fuente;
- actor no laboral;
- carril base todavía autorizable.

---

#### 6. Perfiles derivados de dependencia de turno

Esta tarea no crea una clasificación paralela. Los perfiles se derivan de la
modalidad y del prerrequisito `N`, `T` o `T+C` aprobado para cada permiso.

| Perfil                                      | Entrada canónica                                                      | Regla                                                                                             |
| ------------------------------------------- | --------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| `NO_PUBLISHED_SHIFT_DEPENDENCY`             | permiso base `N`, actor cliente, proceso autónomo o acción no laboral | la ausencia de turno no bloquea por esta tarea                                                    |
| `OPERATIONAL_T_SHIFT_REQUIRED`              | carril operativo `T`                                                  | exige turno publicado y luego vigencia; no exige check-in para satisfacer el prerrequisito propio |
| `OPERATIONAL_T_PLUS_CHECKIN_SHIFT_REQUIRED` | carril operativo `T+C`                                                | exige turno publicado, vigencia y posteriormente check-in activo                                  |
| `BASE_OR_OPERATIONAL_CONDITIONAL_SHIFT`     | `BASE_OR_OPERATIONAL`                                                 | el carril base puede autorizar sin turno; el carril operativo sí lo exige                         |
| `BASE_AND_OPERATIONAL_REQUIRED_SHIFT`       | `BASE_AND_OPERATIONAL`                                                | la decisión final exige el carril base y también un carril operativo con turno                    |

Distribución canónica:

| Clasificación                 | Cantidad | Efecto ante ausencia de publicación                                               |
| ----------------------------- | -------: | --------------------------------------------------------------------------------- |
| permisos sin carril operativo |       54 | no aplica este bloqueo por el prerrequisito de turno                              |
| permisos con carril operativo |       58 | el carril operativo no puede continuar                                            |
| carriles `T`                  |       19 | esta razón si falta publicación; `AUTH-ERR-010` si existe y está fuera de ventana |
| carriles `T+C`                |       39 | esta razón si falta publicación; después se evalúan temporalidad y check-in       |

Un dispositivo, una simulación, el nombre del rol o una aplicación visible no
pueden degradar `T+C` a `T` ni `T` a `N`.

---

#### 7. Publicación, revisión y borrador

La resolución deberá separar:

```text
OCURRENCIA LÓGICA DE TURNO
├── BORRADOR ACTUAL
├── REVISIÓN PUBLICADA AUTORITATIVA
├── REVISIONES HISTÓRICAS
└── RETIRO O CANCELACIÓN
```

Reglas:

1. una fila no publicada es planificación interna y no crea contexto
   operativo;
2. una publicación debe identificar una revisión completa y coherente;
3. una edición posterior no publicada no altera la revisión vigente;
4. una republicación crea una nueva versión autoritativa;
5. una revisión retirada o cancelada deja de ser utilizable;
6. dos revisiones simultáneamente autoritativas son configuración inválida;
7. no se mezclan horario, sede, área o rol de revisiones distintas;
8. `confirmed` no determina publicación;
9. `status = scheduled` no demuestra por sí solo publicación;
10. `published_at` aislado será adaptado con reglas fail closed hasta la
    materialización del modelo versionado.

Solo borradores aplicables:

```text
PUBLISHED_SHIFT_FACT = none
→ AUTH_PUBLISHED_SHIFT_REQUIRED
```

Publicación ambigua o contradictoria:

```text
PUBLISHED_SHIFT_RESOLUTION = invalid
→ AUTH-ERR-017
```

---

#### 8. Diferencia obligatoria con `AUTH-ERR-010`

La frontera entre ausencia de publicación y fuera de turno queda congelada:

| Situación                                               | Resultado público               | Propietario                         |
| ------------------------------------------------------- | ------------------------------- | ----------------------------------- |
| no existe turno laboral publicado aplicable             | `AUTH_PUBLISHED_SHIFT_REQUIRED` | `AUTH-ERR-009`                      |
| solo existe borrador laboral aplicable                  | `AUTH_PUBLISHED_SHIFT_REQUIRED` | `AUTH-ERR-009`                      |
| la única publicación aplicable fue retirada o cancelada | `AUTH_PUBLISHED_SHIFT_REQUIRED` | `AUTH-ERR-009`                      |
| solo existe descanso u otra ocurrencia no laboral       | `AUTH_PUBLISHED_SHIFT_REQUIRED` | `AUTH-ERR-009`                      |
| existe turno laboral publicado, pero aún no inicia      | razón temporal                  | `AUTH-ERR-010`                      |
| existe turno laboral publicado, pero ya terminó         | razón temporal                  | `AUTH-ERR-010`                      |
| existe exactamente un turno publicado dentro de ventana | continuar                       | rol, territorio, check-in y permiso |
| existen varios candidatos simultáneamente vigentes      | configuración inválida          | `AUTH-ERR-017`                      |
| no se pudo consultar la fuente                          | error técnico                   | `AUTH-ERR-019`                      |

La búsqueda de la ocurrencia aplicable deberá considerar el calendario local y
los turnos que puedan cruzar medianoche. Queda prohibido decidir
`AUTH-ERR-009` o `AUTH-ERR-010` únicamente a partir de `shift_date = hoy`.

---

#### 9. Relación con `N`, `T` y `T+C`

##### 9.1 `N`

```text
SIN TURNO PUBLICADO
→ NO AFECTA EL PRERREQUISITO
```

El permiso todavía requiere concesión, scope, recurso y ausencia de
denegaciones.

##### 9.2 `T`

```text
TURNO PUBLICADO REQUERIDO
+
SIN PUBLICACIÓN
→ AUTH_PUBLISHED_SHIFT_REQUIRED
```

Con publicación presente se evalúa `AUTH-ERR-010`. Si el turno está vigente,
puede continuar sin check-in únicamente para las capacidades clasificadas
`T`.

##### 9.3 `T+C`

```text
TURNO PUBLICADO REQUERIDO
+
SIN PUBLICACIÓN
→ AUTH_PUBLISHED_SHIFT_REQUIRED
```

Con publicación y vigencia satisfechas, la ausencia de check-in corresponde a
`AUTH-ERR-011`.

##### 9.4 Combinación prohibida

No existe:

```text
CHECK-IN REQUERIDO
+
TURNO NO REQUERIDO
```

Un check-in residual no crea una publicación y no satisface esta tarea.

---

#### 10. Carril base y carril operativo

La ausencia de turno afecta exclusivamente el carril operativo que lo exige.

| Modalidad              | Regla                                                                                 |
| ---------------------- | ------------------------------------------------------------------------------------- |
| `BASE_ONLY`            | no evalúa esta razón                                                                  |
| `OPERATIONAL_ONLY`     | sin publicación produce esta razón                                                    |
| `BASE_OR_OPERATIONAL`  | el carril base se evalúa independientemente; solo el carril operativo queda bloqueado |
| `BASE_AND_OPERATIONAL` | sin publicación impide la decisión final porque el carril operativo es obligatorio    |

Queda prohibido:

- bloquear un permiso `BASE_ONLY` por ausencia de turno;
- revocar cobertura administrativa por no existir turno;
- autorizar un permiso `OPERATIONAL_ONLY` desde el rol base;
- convertir una concesión base en turno;
- usar un turno para ampliar scope base;
- omitir el requisito operativo de `BASE_AND_OPERATIONAL`;
- mostrar un bloqueo de turno cuando el carril base ya autoriza por sí solo.

---

#### 11. Dispositivo compartido, delegación y procesos de sistema

##### 11.1 Dispositivo compartido

El dispositivo no posee turno laboral. La resolución se realiza sobre el
empleado efectivo identificado en la sesión del dispositivo.

```text
DISPOSITIVO AUTORIZADO
+
ACTOR HUMANO RESUELTO
+
SIN TURNO PUBLICADO DEL ACTOR
→ AUTH_PUBLISHED_SHIFT_REQUIRED
```

El turno del último actor, la sede fija, el área permitida, la plantilla o el
techo de permisos del dispositivo no satisfacen la publicación.

##### 11.2 Delegación

Una automatización delegada conserva el actor efectivo. Cuando ejecuta una
capacidad laboral atribuida a un empleado, debe resolver el mismo turno
publicado y no puede inyectar un `shift_id` técnico.

##### 11.3 Proceso autónomo

Un proceso `SYSTEM` autónomo no recibe turno laboral. Debe utilizar un contrato
de sistema explícito; no se bloquea por esta tarea ni se le fabrica un empleado.

---

#### 12. Check-in residual y evidencia de asistencia

Un evento de check-in no crea turno publicado.

| Condición                                             | Resultado                                                                                   |
| ----------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| check-in inexistente y sin turno                      | esta tarea decide primero si el permiso exige turno                                         |
| check-in residual sin publicación                     | `AUTH_PUBLISHED_SHIFT_REQUIRED`; la sesión residual se audita y se invalida por su contrato |
| check-in asociado a borrador                          | no crea publicación; esta razón                                                             |
| check-in asociado a turno retirado                    | no reactiva la publicación; esta razón                                                      |
| check-in asociado a otra revisión                     | configuración o incompatibilidad                                                            |
| turno publicado vigente y check-in ausente para `T`   | continuar                                                                                   |
| turno publicado vigente y check-in ausente para `T+C` | `AUTH-ERR-011`                                                                              |

El check-in se valida contra el turno ya resuelto. Queda prohibido utilizar un
check-in para escoger entre turnos ambiguos o completar una publicación ausente.

---

#### 13. Territorio y rol

La ausencia de publicación se decide antes de exigir que el turno aporte sede,
área y rol operativo efectivos. Sin embargo, una fila presentada como
publicada debe poseer datos mínimos resolubles para considerarse un hecho de
publicación utilizable.

Reglas:

1. la sede o el área seleccionadas no crean turno;
2. una asignación laboral permanente no crea turno;
3. un perfil operativo predeterminado puede ayudar a planificar, pero no
   completa una publicación;
4. una publicación sin rol operativo resoluble conserva la razón específica
   de rol o configuración según precedencia;
5. una publicación con sede inactiva conserva la razón territorial aplicable;
6. una publicación con área requerida inactiva conserva `AUTH-ERR-008`;
7. el recurso no presta turno al actor;
8. el rol base no sustituye el rol operativo publicado.

La implementación unificada deberá resolver la frontera sin filtrar datos de
una causa posterior a través del mensaje de ausencia de turno.

---

#### 14. Fuentes autoritativas y prohibidas

| Hecho                       | Fuente autoritativa                                             |
| --------------------------- | --------------------------------------------------------------- |
| actor efectivo              | sesión y resolución canónica del actor                          |
| identidad laboral           | empleado canónico activo                                        |
| ocurrencia de turno         | agregado canónico de programación laboral                       |
| revisión publicada          | registro versionado de publicación o adaptación legacy validada |
| instante de resolución      | reloj de servidor                                               |
| clasificación laboral       | catálogo o campo canónico de tipo de turno                      |
| cancelación o retiro        | evento o estado autoritativo de publicación                     |
| sede, área y rol publicados | misma revisión autoritativa del turno                           |
| requisito de turno          | catálogo canónico por permiso y carril                          |

Queda prohibido producir publicación o autoridad desde:

- `shift_id` enviado por el cliente;
- query string, ruta o body;
- estado React o almacenamiento local;
- cookie no firmada;
- turno recordado por el navegador;
- último turno consultado;
- último check-in;
- turno de otro empleado;
- turno del dispositivo;
- sede o área seleccionada;
- perfil operativo predeterminado;
- nombre del rol;
- `navigation_role`;
- confirmación del trabajador;
- `status = scheduled` aislado;
- simulación realimentada como contexto real.

---

#### 15. Entradas mínimas del contrato

```ts
type PublishedShiftEvaluationInput = {
  actor: {
    actor_type: "EMPLOYEE" | "CUSTOMER" | "DEVICE" | "SYSTEM" | "UNRESOLVED";
    actor_id: string | null;
    active: boolean | null;
  };
  app_code: string;
  channel: PublishedShiftChannel;
  lane: "BASE" | "OPERATIONAL" | "SYSTEM";
  permission_code: string | null;
  operational_prerequisite: "N" | "T" | "T+C" | null;
  permission_modality:
    | "BASE_ONLY"
    | "OPERATIONAL_ONLY"
    | "BASE_OR_OPERATIONAL"
    | "BASE_AND_OPERATIONAL"
    | null;
  publication_candidates: Array<{
    shift_id: string;
    employee_id: string;
    publication_state: "DRAFT" | "PUBLISHED" | "WITHDRAWN" | "CANCELLED";
    shift_kind: string;
    starts_at: string | null;
    ends_at: string | null;
    site_id: string | null;
    area_id: string | null;
    operational_role_code: string | null;
    revision_ref: string | null;
  }>;
  resolved_at: string;
  correlation_id: string;
};
```

Los identificadores suministrados por el cliente son solicitudes no confiables.
El servidor resuelve nuevamente actor, publicación, revisión, clasificación,
territorio, rol, vigencia y compatibilidad.

---

#### 16. Resultado canónico

```ts
type PublishedShiftBlockingReason = {
  contract: "PUBLISHED-SHIFT-BLOCKING-CONTRACT-001";
  contract_version: "1.0.0";
  reason_code: "AUTH_PUBLISHED_SHIFT_REQUIRED";
  domain: "AUTHORIZATION_CONTEXT";
  decision: "DENY";
  state: "MISSING_REQUIRED_PUBLISHED_SHIFT";
  executable: false;
  http_status: 403;
  app_code: string;
  channel: PublishedShiftChannel;
  lane: "OPERATIONAL";
  correlation_id: string;
  occurred_at: string;
  recovery_action: "RETURN_TO_SHELL" | "RETURN_TO_APP_HOME" | "CONTACT_ADMIN";
};
```

La respuesta pública no incluye identificadores de empleado, turno, revisión,
sede, área, rol, permiso, recurso, dispositivo, publicador ni causa interna.
La evidencia ampliada permanece en auditoría protegida.

---

#### 17. Causas internas admitidas

| Causa interna                            | Condición concluyente                                                                   | Resultado público               |
| ---------------------------------------- | --------------------------------------------------------------------------------------- | ------------------------------- |
| `NO_PUBLISHED_LABOR_SHIFT`               | no existe una ocurrencia laboral publicada aplicable al actor                           | `AUTH_PUBLISHED_SHIFT_REQUIRED` |
| `DRAFT_ONLY_LABOR_SHIFT`                 | existe planificación laboral aplicable, pero ninguna revisión fue publicada             | `AUTH_PUBLISHED_SHIFT_REQUIRED` |
| `PUBLISHED_SHIFT_WITHDRAWN_OR_CANCELLED` | la única publicación aplicable fue retirada o cancelada y no existe reemplazo publicado | `AUTH_PUBLISHED_SHIFT_REQUIRED` |
| `ONLY_NON_LABOR_SCHEDULE_EXISTS`         | únicamente existe descanso u otra ocurrencia que no crea carril operativo               | `AUTH_PUBLISHED_SHIFT_REQUIRED` |

No son causas internas de esta razón:

- `PUBLISHED_SHIFT_NOT_STARTED`;
- `PUBLISHED_SHIFT_ENDED`;
- `MULTIPLE_CURRENT_SHIFTS`;
- `SHIFT_REVISION_AMBIGUOUS`;
- `SHIFT_SITE_INACTIVE`;
- `SHIFT_AREA_INACTIVE`;
- `SHIFT_ROLE_MISSING`;
- `SHIFT_ROLE_NOT_ALLOWED`;
- `CHECKIN_REQUIRED`;
- `CHECKIN_SHIFT_MISMATCH`;
- `DEVICE_NOT_AUTHORIZED`;
- `DATA_SOURCE_TIMEOUT`;
- `CONTEXT_UNAVAILABLE`.

---

#### 18. Precedencia

Orden público obligatorio para una acción que puede exigir turno:

```text
1. SUPERFICIE PÚBLICA O PROTEGIDA
2. DISPONIBILIDAD TÉCNICA DE IDENTIDAD Y CONTEXTO
3. SESIÓN AUTENTICADA
4. IDENTIDAD REQUERIDA ACTIVA
5. ACCESO A LA APLICACIÓN
6. CARRIL BASE Y PERMISO ADMINISTRATIVO, CUANDO APLIQUE
7. ASIGNACIÓN Y ACTIVIDAD TERRITORIAL PREVIA, CUANDO APLIQUE
8. DEPENDENCIA DE TURNO DEL CARRIL OPERATIVO
9. PUBLICACIÓN LABORAL AUTORITATIVA
10. VIGENCIA TEMPORAL DEL TURNO
11. SEDE Y ÁREA OPERATIVAS
12. CHECK-IN, CUANDO APLIQUE
13. ROL OPERATIVO Y COMPATIBILIDAD
14. PERMISO EFECTIVO, SCOPE Y RECURSO
15. DECISIÓN FINAL
```

Reglas:

- sin publicación requerida conserva `AUTH-ERR-009`;
- con publicación fuera de ventana conserva `AUTH-ERR-010`;
- con publicación vigente y sin check-in requerido conserva `AUTH-ERR-011`;
- rol faltante o incompatible conserva `AUTH-ERR-012` a `AUTH-ERR-014`;
- dispositivo no autorizado conserva `AUTH-ERR-015`;
- acción real intentada desde simulación conserva `AUTH-ERR-016`;
- publicación ambigua o estructura contradictoria conserva `AUTH-ERR-017`;
- fallo de fuente conserva `AUTH-ERR-019`;
- la primera razón concluyente prevalece;
- una razón posterior no se filtra a través de un bloqueo anterior.

---

#### 19. `PUBLISHED-SHIFT-DEPENDENCY-MATRIX-001`

|    # | Escenario                                                                    | Perfil                                      | Resultado público                       | Continúa en                |
| ---: | ---------------------------------------------------------------------------- | ------------------------------------------- | --------------------------------------- | -------------------------- |
|    1 | permiso `BASE_ONLY` o prerrequisito `N`                                      | `NO_PUBLISHED_SHIFT_DEPENDENCY`             | no aplica bloqueo                       | permiso, scope y recurso   |
|    2 | `BASE_OR_OPERATIONAL` con carril base autorizado y sin turno                 | `BASE_OR_OPERATIONAL_CONDITIONAL_SHIFT`     | continuar por carril base               | decisión final             |
|    3 | `BASE_OR_OPERATIONAL` con carril base denegado y operativo sin publicación   | `BASE_OR_OPERATIONAL_CONDITIONAL_SHIFT`     | `AUTH_PUBLISHED_SHIFT_REQUIRED`         | recuperación               |
|    4 | `OPERATIONAL_ONLY` sin publicación                                           | `OPERATIONAL_T_SHIFT_REQUIRED` o `T+C`      | `AUTH_PUBLISHED_SHIFT_REQUIRED`         | recuperación               |
|    5 | `BASE_AND_OPERATIONAL` sin publicación                                       | `BASE_AND_OPERATIONAL_REQUIRED_SHIFT`       | `AUTH_PUBLISHED_SHIFT_REQUIRED`         | recuperación               |
|    6 | actor cliente de PASS                                                        | `NO_PUBLISHED_SHIFT_DEPENDENCY`             | no evaluar turno laboral                | contrato de cliente        |
|    7 | proceso `SYSTEM` autónomo                                                    | `NO_PUBLISHED_SHIFT_DEPENDENCY`             | no fabricar turno                       | contrato del proceso       |
|    8 | dispositivo compartido sin actor humano resuelto                             | perfil previo de actor                      | razón de actor o dispositivo            | `AUTH-ERR-015` o contexto  |
|    9 | dispositivo autorizado, actor resuelto y sin publicación                     | perfil operativo aplicable                  | `AUTH_PUBLISHED_SHIFT_REQUIRED`         | recuperación               |
|   10 | solo existe borrador laboral aplicable                                       | perfil operativo aplicable                  | `AUTH_PUBLISHED_SHIFT_REQUIRED`         | recuperación               |
|   11 | solo existe descanso publicado                                               | perfil operativo aplicable                  | `AUTH_PUBLISHED_SHIFT_REQUIRED`         | recuperación               |
|   12 | la publicación aplicable fue cancelada o retirada                            | perfil operativo aplicable                  | `AUTH_PUBLISHED_SHIFT_REQUIRED`         | recuperación               |
|   13 | existe turno laboral publicado para más tarde                                | perfil operativo aplicable                  | razón temporal                          | `AUTH-ERR-010`             |
|   14 | existe turno laboral publicado que ya terminó                                | perfil operativo aplicable                  | razón temporal                          | `AUTH-ERR-010`             |
|   15 | existe exactamente un turno laboral publicado y vigente                      | perfil operativo aplicable                  | continuar                               | territorio, check-in y rol |
|   16 | turno vigente, `T`, sin check-in                                             | `OPERATIONAL_T_SHIFT_REQUIRED`              | continuar                               | rol, permiso y recurso     |
|   17 | turno vigente, `T+C`, sin check-in                                           | `OPERATIONAL_T_PLUS_CHECKIN_SHIFT_REQUIRED` | razón de check-in                       | `AUTH-ERR-011`             |
|   18 | dos o más publicaciones simultáneamente vigentes                             | cualquier perfil dependiente                | configuración inválida                  | `AUTH-ERR-017`             |
|   19 | fuente de turnos falla, expira o no es concluyente                           | cualquier perfil dependiente                | error técnico                           | `AUTH-ERR-019`             |
|   20 | cliente envía `shift_id`, pero el servidor no resuelve publicación aplicable | perfil operativo aplicable                  | ignorar referencia y aplicar esta razón | recuperación               |

La matriz es exhaustiva para la frontera pública de esta tarea. No convierte
temporalidad, ambigüedad, rol, territorio, check-in o fallo técnico en una falsa
ausencia de publicación.

---

#### 20. Regla de cero efectos

La decisión se toma antes del primer efecto observable.

Quedan prohibidos:

- insertar o actualizar parcialmente;
- reservar inventario;
- preparar, despachar o recibir parcialmente;
- producir o consumir parcialmente;
- abrir o cerrar caja por inferencia;
- emitir impresiones o comandas;
- registrar movimientos;
- publicar eventos empresariales;
- abrir suscripciones incompatibles;
- cambiar estado de recursos;
- enviar notificaciones de éxito;
- crear compensaciones por una acción que nunca debió iniciar;
- reanudar automáticamente después de publicar un turno.

La publicación posterior de un turno no autoriza ni reanuda la solicitud
original. Se requiere una nueva resolución y una nueva solicitud.

---

#### 21. Envelope público

```json
{
  "ok": false,
  "decision": "DENY",
  "executable": false,
  "reason_code": "AUTH_PUBLISHED_SHIFT_REQUIRED",
  "state": "MISSING_REQUIRED_PUBLISHED_SHIFT",
  "recovery_action": "CONTACT_ADMIN",
  "correlation_id": "opaque"
}
```

El estado HTTP es `403` fuera de navegación. RLS puede producir cero filas o
rechazar una mutación según el contrato de la operación, pero la capa de
servicio debe conservar diagnóstico tipado sin inferir la causa desde el
número de filas.

---

#### 22. Copy canónico

| Elemento          | Texto exacto                                                                                                                                         |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| Título            | `Necesitas un turno publicado`                                                                                                                       |
| Mensaje           | `No tienes un turno laboral publicado disponible para continuar con esta acción. Solicita a un administrador autorizado que revise tu programación.` |
| Acción principal  | `Volver a Vento OS`                                                                                                                                  |
| Acción secundaria | `Ir al inicio de la aplicación`                                                                                                                      |
| Ayuda             | `Si consideras que es un error, solicita una revisión a un administrador autorizado.`                                                                |
| Código de soporte | `AUTH_PUBLISHED_SHIFT_REQUIRED`                                                                                                                      |

La interfaz no mostrará como causa pública si existe borrador, descanso,
cancelación, retiro o ausencia total. Tampoco revelará horarios, publicador,
rol, sede, área ni detalles de la programación.

---

#### 23. Recuperación

La recuperación depende de autoridad administrativa sobre programación:

| Caso                             | Corrección permitida                                               |
| -------------------------------- | ------------------------------------------------------------------ |
| no existe turno                  | crear y publicar una asignación laboral válida                     |
| existe borrador                  | revisar y publicar una revisión completa                           |
| publicación cancelada o retirada | publicar una nueva revisión cuando corresponda                     |
| solo existe descanso             | crear y publicar el turno laboral correcto si la operación procede |
| error de actor o asignación      | corregir la fuente propietaria antes de una solicitud nueva        |

La UI consumidora no:

- publica turnos;
- convierte borradores en turnos;
- reactiva cancelaciones;
- cambia horarios;
- asigna roles;
- escoge un turno alternativo;
- reutiliza el body de la operación bloqueada.

Toda corrección exige nueva resolución y nueva solicitud.

---

#### 24. `PUBLISHED-SHIFT-CHANNEL-RESPONSE-MATRIX-001`

| Canal                  | Comportamiento obligatorio                                            | Prohibiciones                                      |
| ---------------------- | --------------------------------------------------------------------- | -------------------------------------------------- |
| navegación web         | renderizar estado seguro, conservar sesión y permitir salida          | login loop, calendario sensible o acceso parcial   |
| Server Action          | devolver unión discriminada y no ejecutar mutación                    | throw libre, retry o efecto parcial                |
| Route Handler/API      | `403` con envelope estable                                            | `401`, HTML inesperado o mensaje SQL               |
| fetch/RSC              | propagar razón tipada sin hidratar datos protegidos                   | fallback a último turno o respuesta vacía engañosa |
| RPC/PostgREST          | resolver publicación antes del efecto y conservar correlación         | booleano o `out_of_shift` como contrato público    |
| RLS/Data API           | negar mutación o filtrar según contrato, con diagnóstico fuera de RLS | inferir ausencia de turno desde cero filas         |
| Edge Function          | revalidar actor y publicación en servidor                             | confiar en `shift_id` del cliente                  |
| Realtime               | no suscribir o retirar entrega al perderse la publicación aplicable   | eventos posteriores a cancelación o retiro         |
| cliente nativo         | mostrar copy canónico, conservar sesión y exigir solicitud nueva      | cachear `ALLOW` o reintentar automáticamente       |
| dispositivo compartido | validar dispositivo, actor y turno por separado                       | prestar turno, sede o rol de otro actor            |

Equivalencia mínima:

```text
reason_code = AUTH_PUBLISHED_SHIFT_REQUIRED
http_status = 403, cuando aplique
executable = false
partial_effects = 0
session_preserved = true
```

---

#### 25. Navegación, accesibilidad y privacidad

La experiencia deberá:

- conservar foco visible;
- anunciar título y mensaje mediante región accesible;
- permitir regresar mediante teclado, táctil o control físico;
- evitar depender únicamente de color;
- soportar zoom y texto ampliado;
- conservar una salida segura aun si la aplicación consumidora falla;
- no exponer horarios, turnos futuros, borradores ni cancelaciones;
- no exponer empleado, sede, área, rol, permiso, scope, recurso o dispositivo;
- no revelar quién publica o administra la programación;
- no ofrecer acciones administrativas a un actor no autorizado.

No se cerrará la sesión. No se redirigirá a login. No se mostrará un stack
trace, mensaje bruto de Supabase ni identificador interno.

---

#### 26. Actores no laborales y procesos de sistema

Un cliente de PASS no utiliza turno laboral. Un dispositivo sin actor humano no
recibe turno. Un proceso `SYSTEM` autónomo usa su contrato de ejecución y
territorio del recurso.

Una automatización delegada debe conservar el actor efectivo. Service role no
sustituye publicación, rol, permiso, territorio ni evidencia empresarial.

ANIMA debe seguir disponible para que el trabajador consulte programación y
registre asistencia conforme a sus permisos base. La ausencia de turno no puede
bloquear el acceso general a la herramienta que permite entender o recuperar el
estado laboral.

---

#### 27. Operación offline, reintentos e idempotencia

Una pantalla habilitada o un turno cacheado no constituyen publicación vigente.
Al sincronizar se reconstruyen actor, publicación, revisión, temporalidad,
check-in, rol, permiso y recurso con datos actuales.

Reglas:

1. una acción creada offline sin publicación comprobable no se ejecuta;
2. no existe reintento automático de una mutación bloqueada;
3. la publicación posterior no reanuda el cuerpo original;
4. la solicitud nueva conserva idempotencia cuando el proceso la exige;
5. un snapshot antiguo no prueba que la revisión continúe publicada;
6. el cliente no puede declarar la hora ni la revisión de evaluación;
7. un evento de check-in offline pendiente no crea turno ni autorización.

---

#### 28. Frescura e invalidación

El contexto queda obsoleto ante:

- creación o eliminación de una ocurrencia;
- publicación o republicación;
- retiro o cancelación;
- cambio de horario;
- cambio de fecha;
- cambio de sede, área o rol;
- cambio de empleado;
- cambio de clasificación laboral;
- activación o desactivación del empleado, sede, área o rol;
- inicio o fin de la ventana temporal;
- cambio de prerrequisito del permiso;
- cambio de actor o sesión de dispositivo;
- detección o corrección de solapamiento;
- cambio de versión del contrato.

Toda mutación revalida inmediatamente antes del efecto. Un `ALLOW` cacheado no
sobrevive a cancelación, retiro, edición, fin de ventana o cambio de actor.
Realtime retira la entrega incompatible. Una nueva publicación no reanuda la
operación original.

---

#### 29. Auditoría

```ts
type PublishedShiftBlockedAudit = {
  event: "authorization.published_shift_blocked";
  reason_code: "AUTH_PUBLISHED_SHIFT_REQUIRED";
  internal_cause:
    | "NO_PUBLISHED_LABOR_SHIFT"
    | "DRAFT_ONLY_LABOR_SHIFT"
    | "PUBLISHED_SHIFT_WITHDRAWN_OR_CANCELLED"
    | "ONLY_NON_LABOR_SCHEDULE_EXISTS";
  app_code: string;
  actor_ref: string;
  permission_ref: string | null;
  lane: "OPERATIONAL";
  candidate_count: number;
  correlation_id: string;
  occurred_at: string;
  executable: false;
};
```

La auditoría ampliada podrá conservar referencias protegidas a la ocurrencia y
a la revisión. La respuesta pública no las expone.

No se registran tokens, cookies, PIN, secretos, notas de programación, cuerpos
sensibles, stack traces ni datos personales innecesarios.

---

#### 30. `PUBLISHED-SHIFT-APPLICATION-COVERAGE-REGISTER-001`

| Aplicación | Regla de `AUTH-ERR-009`                                                                                                                  | Estado documental |
| ---------- | ---------------------------------------------------------------------------------------------------------------------------------------- | ----------------- |
| `shell`    | el hub no exige turno; solo una acción cuyo carril operativo lo declare aplica esta razón                                                | ESPECIFICADO      |
| `anima`    | acceso, consulta laboral y administración de turnos permanecen base; una operación laboral que exija turno aplica el contrato específico | ESPECIFICADO      |
| `aura`     | no se presupone turno; cada capacidad futura deberá declarar su prerrequisito                                                            | ESPECIFICADO      |
| `viso`     | planificación, publicación y gobierno son capacidades base; una capacidad híbrida conserva su carril operativo independiente             | ESPECIFICADO      |
| `nexo`     | sus carriles operativos `T` y `T+C` exigen publicación; una concesión base válida de `BASE_OR_OPERATIONAL` puede continuar sin turno     | ESPECIFICADO      |
| `fogo`     | ejecución productiva operativa exige publicación; recetas o administración base no por inferencia                                        | ESPECIFICADO      |
| `origo`    | compras y administración base no exigen turno; operaciones clasificadas `T` o `T+C` sí                                                   | ESPECIFICADO      |
| `pulso`    | acceso o administración base se evalúan por su carril; operación POS laboral exige publicación cuando el catálogo lo declare             | ESPECIFICADO      |
| `numera`   | capacidades financieras y analíticas base no exigen turno; una futura capacidad operativa deberá declararlo                              | ESPECIFICADO      |
| `pass`     | el cliente final no usa turno laboral; superficies internas aplican el contrato del actor correspondiente                                | ESPECIFICADO      |

La tabla no concede permisos, no cambia la matriz de 112 permisos y no crea
excepciones por nombre de aplicación.

---

#### 31. Snapshot físico desplegado

Inspección de solo lectura en `vento-os-dev`:

| Métrica física                                                        |  Resultado observado |
| --------------------------------------------------------------------- | -------------------: |
| empleados activos                                                     |                   42 |
| turnos totales                                                        |                 2844 |
| turnos publicados                                                     |                 2723 |
| turnos no publicados                                                  |                  121 |
| turnos laborales                                                      |                 2411 |
| turnos de descanso                                                    |                  433 |
| turnos laborales publicados no cancelados                             |                 2318 |
| turnos publicados no cancelados de cualquier tipo                     |                 2721 |
| turnos laborales no publicados                                        |                   91 |
| descansos no publicados                                               |                   30 |
| turnos laborales publicados futuros al snapshot                       |                  141 |
| turnos laborales publicados terminados al snapshot                    |                 2177 |
| candidatos laborales publicados vigentes al instante del snapshot     |                    0 |
| turnos que cruzan medianoche observados                               |                    0 |
| empleados activos con turno laboral publicado el día local            |                   21 |
| empleados activos sin turno laboral publicado el día local            |                   21 |
| filas del día local                                                   | 28, todas publicadas |
| turnos laborales publicados para el día local y siete días siguientes |                  163 |
| turnos laborales no publicados para ese periodo                       |                    0 |
| publicaciones sin `published_by`                                      |                    0 |
| `published_by` sin `published_at`                                     |                    0 |
| publicaciones con `published_at < created_at`                         |                    4 |
| turnos laborales publicados sin rol operativo                         |                 1537 |
| turnos publicados sin área                                            |                 2068 |
| funciones que referencian `employee_shifts`                           |                   10 |
| funciones que referencian `published_at`                              |                    5 |
| funciones que emiten `out_of_shift`                                   |                    1 |
| políticas RLS sobre `employee_shifts`                                 |                    5 |
| políticas físicas en `app_operation_policies`                         |            1, `nexo` |

El snapshot se obtuvo a las `2026-08-03 23:49:18` en
`America/Bogota`. El instante nocturno explica que no existieran candidatos
vigentes en ese momento; no certifica ausencia de turnos durante el día.

Conclusiones permitidas:

1. existen filas no publicadas y el caso de borrador no es hipotético;
2. el día local inspeccionado no contenía borradores, pero 121 existen en el
   histórico total;
3. 21 empleados activos no tenían turno laboral publicado para ese día, sin
   que ello implique defecto porque pueden no estar programados;
4. los 1537 turnos laborales publicados sin rol no son automáticamente una
   causa de esta razón; corresponden a la frontera de rol y compatibilidad;
5. los 2068 turnos sin área no son automáticamente inválidos porque existen
   roles y permisos de nivel sede;
6. las cuatro publicaciones anteriores a `created_at` requieren reconciliación
   de importación o backfill, no una conclusión automática de corrupción;
7. no se autoriza modificar datos productivos para obtener evidencia.

---

#### 32. Comportamiento físico observado

##### 32.1 Estructura de `employee_shifts`

La tabla física conserva `published_at` y `published_by`, pero no posee un
modelo explícito de ocurrencia, revisión publicada inmutable, supersesión o
retiro versionado. `status` mezcla `scheduled`, `confirmed`, `completed`,
`cancelled` y `no_show`.

##### 32.2 `get_operational_context`

La función desplegada:

- exige `published_at is not null`;
- excluye `status = cancelled`;
- filtra `shift_date` por el día local actual;
- compara horas locales sin construir un intervalo absoluto versionado;
- intenta cubrir medianoche, pero el filtro por fecha pierde un turno iniciado
  el día anterior;
- ordena por `start_time` y toma `limit 1`;
- no detecta candidatos simultáneos;
- emite `out_of_shift` tanto cuando no existe publicación aplicable como cuando
  el turno existe fuera de su ventana;
- contiene bypasses por rol y por permiso físico de aplicación.

Por tanto, no preserva la frontera pública entre `AUTH-ERR-009` y
`AUTH-ERR-010`.

##### 32.3 `resolve_attendance_shift_id`

La función exige publicación, descarta cancelados y descansos, y usa ventanas
de check-in o checkout. Sin embargo, ordena por cercanía y toma un único
resultado sin publicar una causa tipada ni demostrar que no exista ambigüedad.

##### 32.4 Catálogo físico de prerrequisitos

`app_operation_policies` contiene una sola fila activa para `nexo`, con
`requires_shift=true`, `requires_checkin=true` y un bypass. No materializa la
clasificación canónica por permiso de 54 sin carril operativo, 19 `T` y 39
`T+C`.

##### 32.5 Consumidor NEXO

El helper inspeccionado consume `get_operational_context`, interpreta
`out_of_shift` y muestra `No puedes operar porque estás fuera de turno.`. No
distingue ausencia de publicación, turno futuro, turno terminado, borrador o
cancelación. También reduce la verificación final de permiso a booleano.

##### 32.6 RLS y publicación

`employee_shifts` posee cinco políticas basadas en identidad propia o roles
legacy de gerente, propietario y gerente global. RLS gobierna acceso a filas,
pero no emite la razón contractual pública ni sustituye el evaluador de
contexto.

##### 32.7 Triggers y metadatos

La tabla tiene automatización de `updated_at` y límite de publicación mensual,
pero no una frontera física que haga inmutable una revisión publicada o que
materialice una cadena de republicaciones y retiros.

---

#### 33. `PUBLISHED-SHIFT-PHYSICAL-RECONCILIATION-001`

| ID                        | Brecha física                                                                     | Estado                 | Tarea responsable                                  | Condición de salida                                                             |
| ------------------------- | --------------------------------------------------------------------------------- | ---------------------- | -------------------------------------------------- | ------------------------------------------------------------------------------- |
| `PUBLISHED-SHIFT-GAP-001` | 121 filas carecen de publicación; 91 son laborales y 30 descansos                 | IDENTIFICADO           | `AUTH-DB-033`; `SHELL-CI-016`                      | resolver distingue borrador, descanso y ausencia total con fixtures controlados |
| `PUBLISHED-SHIFT-GAP-002` | no existe un modelo físico explícito de ocurrencia y revisión publicada inmutable | IDENTIFICADO           | `AUTH-DB-033`; `AUTH-DB-034`                       | publicación, supersesión, retiro y procedencia quedan versionados y resolubles  |
| `PUBLISHED-SHIFT-GAP-003` | `get_operational_context` emite `out_of_shift` para ausencia y temporalidad       | IDENTIFICADO           | `AUTH-DB-033`; `AUTH-DB-034`; `AUTH-ERR-020`       | razones `AUTH-ERR-009` y `AUTH-ERR-010` quedan discriminadas                    |
| `PUBLISHED-SHIFT-GAP-004` | el resolver filtra `shift_date = día actual`                                      | IDENTIFICADO           | `AUTH-DB-033`; `AUTH-DB-034`                       | intervalos absolutos preservan turnos nocturnos iniciados el día anterior       |
| `PUBLISHED-SHIFT-GAP-005` | el resolver toma `limit 1` y no detecta solapamiento                              | IDENTIFICADO           | `AUTH-DB-033`; `AUTH-DB-034`; `AUTH-ERR-017`       | cero, uno y varios candidatos tienen decisiones tipadas y fail closed           |
| `PUBLISHED-SHIFT-GAP-006` | existen bypasses por nombre de rol y permiso físico                               | IDENTIFICADO           | `AUTH-DB-034`; `SHELL-AUTH-001`                    | carriles y prerrequisitos se evalúan sin bypass implícito                       |
| `PUBLISHED-SHIFT-GAP-007` | `resolve_attendance_shift_id` elige el candidato más cercano                      | IDENTIFICADO           | `AUTH-DB-033`; `AUTH-DB-034`                       | resolución de asistencia rechaza ambigüedad y conserva revisión publicada       |
| `PUBLISHED-SHIFT-GAP-008` | `app_operation_policies` solo materializa `nexo`                                  | IDENTIFICADO           | `AUTH-DB-020`; `AUTH-DB-031`; `AUTH-DB-034`        | catálogo físico reproduce los 112 permisos y sus prerrequisitos sin deriva      |
| `PUBLISHED-SHIFT-GAP-009` | la clasificación 54/19/39 permanece documental                                    | IDENTIFICADO           | `AUTH-CAT-012`; `AUTH-DB-020`; `AUTH-DB-031`       | snapshot versionado y gates reproducen conteos y claves exactas                 |
| `PUBLISHED-SHIFT-GAP-010` | el consumidor NEXO usa copy libre de fuera de turno                               | IDENTIFICADO           | `SHELL-AUTH-002`; `SHELL-AUTH-005`; `AUTH-ERR-020` | consume razón pública, copy y recuperación compartidos                          |
| `PUBLISHED-SHIFT-GAP-011` | no existe envelope compartido para ausencia de publicación                        | IDENTIFICADO           | `SHELL-AUTH-001`; `SHELL-AUTH-002`; `AUTH-ERR-020` | SDK y adapters publican el contrato en todos los canales                        |
| `PUBLISHED-SHIFT-GAP-012` | RLS sobre turnos no aporta diagnóstico contractual                                | IDENTIFICADO           | `AUTH-DB-034`; `SHELL-CI-018`                      | servicio correlaciona decisión con RLS sin inferir causa desde cero filas       |
| `PUBLISHED-SHIFT-GAP-013` | cuatro filas tienen publicación anterior a creación física                        | PENDIENTE_DE_EVIDENCIA | `AUTH-DB-031`; `SHELL-CI-019`                      | conciliación demuestra importación válida o corrige mediante proceso autorizado |
| `PUBLISHED-SHIFT-GAP-014` | no existe evidencia reproducible de equivalencia en diez canales                  | PENDIENTE_DE_EVIDENCIA | `SHELL-CI-016`; `SHELL-CI-018`; `SHELL-CI-019`     | fixtures prueban las cuatro causas, temporalidad separada y cero efectos        |

No se crean tareas nuevas. Cada brecha queda vinculada a una tarea existente y
no se declara implementada.

---

#### 34. Handoff de implementación

La implementación futura deberá producir:

```text
AccessContext versionado
+
resolver de ocurrencia y revisión publicada
+
intervalos absolutos en America/Bogota
+
detección de borrador, retiro, cancelación y descanso
+
detección de cero, uno o varios candidatos
+
prerrequisitos N, T y T+C materializados por permiso
+
AuthorizationDecision discriminada
+
precedencia de publicación, temporalidad, territorio, check-in y rol
+
invalidación por republicación o retiro
+
SDK y adapters compartidos
+
pruebas contractuales, RPC, RLS, integración y E2E
```

Tareas propietarias:

- `AUTH-DB-020` y `AUTH-DB-031`: transición y paridad del catálogo físico;
- `AUTH-DB-033`: resolver actor, ocurrencia, revisión, publicación y contexto;
- `AUTH-DB-034`: evaluar dependencia, precedencia, permiso, scope y recurso;
- `AUTH-DB-035`: invalidar decisiones, cachés y suscripciones;
- `SHELL-AUTH-001`: publicar contrato y SDK;
- `SHELL-AUTH-002`: adaptar navegación, acciones, API, RPC y clientes;
- `SHELL-AUTH-004`: lint, métricas y gates de dependencia;
- `SHELL-AUTH-005`: migrar consumidoras;
- `AUTH-ERR-010` a `AUTH-ERR-020`: completar temporalidad y razones posteriores;
- `SHELL-CI-016`, `SHELL-CI-018` y `SHELL-CI-019`: pruebas y evidencia.

Toda migración futura de Supabase deberá crearse, versionarse, documentarse y
ejecutarse desde `vento-shell`.

---

#### 35. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

| ID              | Regla protegida                                                                                                                                           | Tipo                                  | Prioridad | Momento de implementación       | Destino                                                                                       |
| --------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------- | --------- | ------------------------------- | --------------------------------------------------------------------------------------------- |
| `TREQ-AUTH-209` | Una capacidad cuyo carril operativo exige turno y no encuentra publicación laboral utilizable produce código, `403`, deny y cero efectos.                 | contractual + seguridad               | crítica   | resolver y evaluador de turno   | `AUTH-DB-033`; `AUTH-DB-034`; `SHELL-CI-016`                                                  |
| `TREQ-AUTH-210` | La dependencia se deriva por permiso y carril: 54 permisos no operativos no se bloquean, mientras 19 `T` y 39 `T+C` exigen publicación.                   | contractual + catálogo + contexto     | crítica   | catálogo físico y evaluador     | `AUTH-CAT-012`; `AUTH-DB-020`; `AUTH-DB-031`; `SHELL-CI-016`                                  |
| `TREQ-AUTH-211` | Borrador, ausencia total, publicación cancelada o retirada y programación no laboral conservan las cuatro causas internas sin fabricar turno.             | publicación + contexto + regresión    | crítica   | resolver de revisión publicada  | `AUTH-DB-033`; `AUTH-DB-034`; `SHELL-CI-016`                                                  |
| `TREQ-AUTH-212` | Ausencia de publicación, turno fuera de ventana, check-in faltante, rol, configuración y fallo técnico conservan razones distintas y precedencia estable. | integración + razones + seguridad     | crítica   | evaluador y catálogo de razones | `AUTH-ERR-010`; `AUTH-ERR-011`; `AUTH-ERR-012`; `AUTH-ERR-017`; `AUTH-ERR-019`; `AUTH-DB-034` |
| `TREQ-AUTH-213` | El servidor resuelve actor, ocurrencia y revisión; cliente, check-in, dispositivo, confirmación, perfil, selección o rol base no crean publicación.       | seguridad + contexto + dispositivo    | crítica   | resolver y adapters             | `AUTH-DB-033`; `SHELL-AUTH-002`; `SHELL-CI-016`                                               |
| `TREQ-AUTH-214` | Diez canales producen respuesta equivalente, conservan sesión y no generan datos ni efectos parciales.                                                    | integración + E2E                     | crítica   | SDK y adapters                  | `SHELL-AUTH-002`; `SHELL-AUTH-005`; `SHELL-CI-016`; `SHELL-CI-018`                            |
| `TREQ-AUTH-215` | Las diez aplicaciones aplican dependencia por permiso y carril, no por nombre; PASS cliente y capacidades base no reciben turno laboral sintético.        | contractual + aplicación              | alta      | migración de consumidoras       | `SHELL-AUTH-001`; `SHELL-AUTH-005`; `SHELL-CI-016`                                            |
| `TREQ-AUTH-216` | Copy, privacidad y accesibilidad no filtran horario, borrador, cancelación, sede, área, rol, publicador ni causa interna.                                 | interfaz + privacidad + accesibilidad | alta      | catálogo de mensajes            | `AUTH-ERR-020`; `SHELL-AUTH-005`; `SHELL-CI-016`                                              |
| `TREQ-AUTH-217` | Publicación, republicación, retiro, cancelación, cambio de actor o frontera temporal invalidan decisiones; offline y caché fuerzan nueva resolución.      | concurrencia + caché + auditoría      | crítica   | invalidación y observabilidad   | `AUTH-DB-035`; `SHELL-CI-018`; `SHELL-CI-019`                                                 |
| `TREQ-AUTH-218` | Regresión reconcilia snapshot, 121 filas no publicadas, 10 funciones, 5 políticas, consumidor NEXO y catorce brechas sin alterar datos productivos.       | regresión + RPC + RLS + seguridad     | crítica   | gates y evidencia E5            | `AUTH-DB-031`; `SHELL-AUTH-004`; `SHELL-CI-016`; `SHELL-CI-018`; `SHELL-CI-019`               |

---

#### 36. Validaciones documentales definidas

La implementación deberá probar, como mínimo:

1. permiso `BASE_ONLY` sin turno;
2. `OPERATIONAL_ONLY` sin publicación;
3. `BASE_OR_OPERATIONAL` con carril base permitido y sin turno;
4. `BASE_OR_OPERATIONAL` con base denegado y operativo sin turno;
5. `BASE_AND_OPERATIONAL` sin turno;
6. los 19 carriles `T`;
7. los 39 carriles `T+C`;
8. ausencia total de programación;
9. borrador laboral dentro de horario;
10. descanso publicado;
11. publicación cancelada o retirada;
12. turno publicado futuro;
13. turno publicado terminado;
14. turno publicado vigente;
15. turno nocturno iniciado el día anterior;
16. dos publicaciones simultáneamente vigentes;
17. revisión publicada A con borrador B posterior;
18. referencia `shift_id` manipulada por cliente;
19. check-in residual sin publicación;
20. dispositivo compartido con y sin actor;
21. proceso `SYSTEM` autónomo;
22. simulación sin efecto real;
23. fuente indisponible sin conversión a esta razón;
24. equivalencia de los diez canales;
25. cero efectos y ausencia de reintento;
26. copy, teclado, lector de pantalla, zoom y contraste;
27. auditoría minimizada;
28. invalidación por publicación, retiro y cambio temporal;
29. reconciliación de las 10 funciones y 5 políticas;
30. cobertura de las catorce brechas físicas.

---

#### 37. Evidencia y estados

| Elemento                                        | Estado                                                                  |
| ----------------------------------------------- | ----------------------------------------------------------------------- |
| contrato documental                             | ESPECIFICADO                                                            |
| matrices de dependencia, canales y aplicaciones | ESPECIFICADO                                                            |
| snapshot de solo lectura                        | VALIDADO contra estado desplegado observado                             |
| código público compartido                       | PENDIENTE_DE_IMPLEMENTACIÓN — `SHELL-AUTH-001`; `AUTH-ERR-020`          |
| resolver de publicación y revisión              | PENDIENTE_DE_IMPLEMENTACIÓN — `AUTH-DB-033`                             |
| evaluador unificado                             | PENDIENTE_DE_IMPLEMENTACIÓN — `AUTH-DB-034`                             |
| catálogo físico `N/T/T+C`                       | PENDIENTE_DE_IMPLEMENTACIÓN — `AUTH-DB-020`; `AUTH-DB-031`              |
| invalidación y Realtime                         | PENDIENTE_DE_IMPLEMENTACIÓN — `AUTH-DB-035`                             |
| adapters de aplicaciones                        | PENDIENTE_DE_IMPLEMENTACIÓN — `SHELL-AUTH-002`; `SHELL-AUTH-005`        |
| evidencia de diez canales                       | PENDIENTE_DE_EVIDENCIA — `SHELL-CI-016`; `SHELL-CI-018`; `SHELL-CI-019` |
| certificación RLS                               | PENDIENTE_DE_EVIDENCIA — `SHELL-CI-018`                                 |

El snapshot no demuestra que el contrato esté implementado. No se declara una
prueba satisfecha sin evidencia reproducible.

---

#### 38. Fuera del alcance

AUTH-ERR-009 no:

- crea, edita, publica, republica, cancela o retira turnos;
- corrige las 121 filas no publicadas;
- cambia horarios ni tipos de turno;
- crea revisiones físicas;
- asigna empleados, sedes, áreas o roles;
- cambia los conteos 54/19/39;
- reclasifica permisos;
- registra check-in o check-out;
- corrige solapamientos;
- implementa `AccessContext` o `AuthorizationDecision`;
- crea tablas, columnas, constraints, funciones, RPC, RLS o triggers;
- ejecuta migraciones, DDL, DML o backfills;
- crea datos de prueba productivos;
- modifica aplicaciones;
- despliega código;
- escribe en GitHub;
- inicia `AUTH-ERR-010`;
- ejecuta pruebas operativas.

---

#### 39. Criterios de aceptación

1. `AUTH_PUBLISHED_SHIFT_REQUIRED` es el único código público de la tarea.
2. La razón pertenece a autorización contextual, no autenticación.
3. La sesión permanece válida.
4. La respuesta no navegacional usa `403`.
5. La decisión es `DENY`, `executable=false` y cero efectos.
6. La dependencia debe estar declarada por permiso y carril.
7. Se definen exactamente cinco perfiles.
8. Los 54 permisos sin carril operativo no se bloquean por turno.
9. Los 58 permisos con carril operativo exigen turno.
10. Los 19 carriles `T` exigen publicación y vigencia, no check-in propio.
11. Los 39 carriles `T+C` exigen publicación, vigencia y check-in.
12. `BASE_ONLY` no evalúa esta razón.
13. `OPERATIONAL_ONLY` no puede usar rol base como sustituto.
14. `BASE_OR_OPERATIONAL` conserva carriles independientes.
15. `BASE_AND_OPERATIONAL` no elimina el requisito operativo.
16. Una fila de turno no implica publicación.
17. Un borrador no crea contexto operativo.
18. Una publicación identifica una revisión autoritativa.
19. Un borrador posterior no cambia la revisión publicada.
20. Una cancelación o retiro elimina la publicación utilizable.
21. Un descanso no crea turno laboral operativo.
22. La confirmación del trabajador no participa.
23. `status = scheduled` no demuestra publicación.
24. `published_at` aislado es una señal legacy, no el contrato final.
25. El cliente no elige el turno.
26. El check-in no crea publicación.
27. El dispositivo no presta turno.
28. La sede o área seleccionada no crean turno.
29. El perfil predeterminado no completa el turno.
30. El rol base no completa el turno.
31. Un proceso autónomo no recibe turno laboral.
32. Un actor delegado conserva las mismas reglas.
33. Ausencia total produce esta razón.
34. Solo borrador produce esta razón.
35. Solo descanso produce esta razón.
36. Publicación cancelada o retirada produce esta razón.
37. Turno publicado futuro conserva `AUTH-ERR-010`.
38. Turno publicado terminado conserva `AUTH-ERR-010`.
39. Check-in faltante conserva `AUTH-ERR-011`.
40. Rol faltante o incompatible conserva `AUTH-ERR-012` a `AUTH-ERR-014`.
41. Dispositivo no autorizado conserva `AUTH-ERR-015`.
42. Simulación ejecutando acción real conserva `AUTH-ERR-016`.
43. Publicación ambigua conserva `AUTH-ERR-017`.
44. Fallo técnico conserva `AUTH-ERR-019`.
45. Se definen exactamente cuatro causas internas.
46. Las cuatro causas internas no se exponen.
47. Los veinte escenarios poseen decisión explícita.
48. Los diez canales poseen respuesta explícita.
49. Las diez aplicaciones poseen decisión explícita.
50. La UI usa el copy exacto y es accesible.
51. La UI no revela programación ni causa interna.
52. La UI no publica ni corrige turnos.
53. No existe reintento automático.
54. Una corrección exige solicitud nueva.
55. Cambios de publicación invalidan contexto y caché.
56. Toda mutación revalida antes del efecto.
57. Realtime retira entrega incompatible.
58. La auditoría distingue las cuatro causas.
59. El snapshot registra 2844 turnos.
60. El snapshot registra 2723 publicados y 121 no publicados.
61. El snapshot registra 2411 laborales y 433 descansos.
62. El snapshot registra 2318 turnos laborales publicados no cancelados.
63. El snapshot registra 91 turnos laborales no publicados.
64. El snapshot registra 10 funciones que referencian `employee_shifts`.
65. El snapshot registra 5 funciones que referencian `published_at`.
66. El snapshot registra una función que emite `out_of_shift`.
67. El snapshot registra 5 políticas RLS sobre `employee_shifts`.
68. El snapshot registra una política física de aplicación, únicamente `nexo`.
69. Las catorce brechas tienen propietario y condición de salida.
70. Se generan `TREQ-AUTH-209` a `TREQ-AUTH-218`.
71. Las 6606 filas históricas del registro se conservan sin modificación.
72. No se modifica código, Supabase, datos ni repositorios remotos.
73. `AUTH-ERR-010` permanece reservada.

---

#### 40. Cierre de tarea y continuidad

| Continuidad               | Tarea          | Estado      |
| ------------------------- | -------------- | ----------- |
| ÚLTIMA TAREA APROBADA     | `AUTH-ERR-008` | APROBADA    |
| TAREA ACTUAL APROBADA     | `AUTH-ERR-009` | APROBADA    |
| SIGUIENTE TAREA RESERVADA | `AUTH-ERR-010` | NO INICIADA |

```text
ÚLTIMA TAREA APROBADA
AUTH-ERR-008 — APROBADA
        ↓
TAREA ACTUAL APROBADA
AUTH-ERR-009 — APROBADA
        ↓
SIGUIENTE TAREA RESERVADA
AUTH-ERR-010 — RESERVADA
```

No se inicia ni modifica `AUTH-ERR-010` en esta tarea.


### ✅ AUTH-ERR-010 — Fuera de turno

**Estado:** APROBADA
**Tarea anterior:** `AUTH-ERR-009 — Sin turno publicado` — APROBADA
**Tarea siguiente:** `AUTH-ERR-011 — Check-in requerido` — RESERVADA
**Tipo de tarea:** documental; definición contractual, funcional, temporal, de seguridad y experiencia del bloqueo producido cuando existe un turno laboral publicado aplicable, pero el instante autoritativo se encuentra fuera de su ventana vigente
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/S_MENSAJES_BLOQUEO/02_TURNO_ROL_DISPOSITIVO_Y_SIMULACION.md`
**Artefactos producidos:** `SHIFT-WINDOW-BLOCKING-CONTRACT-001`, `SHIFT-WINDOW-TEMPORAL-DECISION-MATRIX-001`, `SHIFT-WINDOW-CHANNEL-RESPONSE-MATRIX-001`, `SHIFT-WINDOW-APPLICATION-COVERAGE-REGISTER-001` y `SHIFT-WINDOW-PHYSICAL-RECONCILIATION-001`
**Decisiones consumidas:** `ADR-AUTH-001`; `AUTH-MOD-001` a `AUTH-MOD-004`; `AUTH-MOD-006` a `AUTH-MOD-011`; `AUTH-MOD-018`; `AUTH-MOD-019`; `AUTH-CAT-006`; `AUTH-CAT-012` a `AUTH-CAT-015`; `AUTH-CTX-001`; `AUTH-CTX-002`; `AUTH-CTX-009` a `AUTH-CTX-017`; `AUTH-CTX-020`; `AUTH-CTX-024` a `AUTH-CTX-030`; `AUTH-ERR-001` a `AUTH-ERR-009`; contratos vigentes de identidad, aplicación, territorio, publicación, temporalidad, turno, check-in, rol, permiso, recurso, disponibilidad y precedencia; estado remoto y desplegado inspeccionado; contrato documental vigente
**Cambios físicos autorizados:** ninguno; no modifica código, Supabase, Auth, RLS, RPC, Edge Functions, datos, migraciones, constraints, triggers, turnos, revisiones, publicaciones, horarios, empleados, sedes, áreas, roles, permisos, aplicaciones ni despliegues

---

#### 1. Propósito

Definir de forma única, segura y verificable qué debe ocurrir cuando una
solicitud ya superó autenticación, actividad de identidad, acceso a la
aplicación y los prerrequisitos anteriores aplicables; el carril operativo de
la capacidad exige un turno vigente; existe exactamente un turno laboral
publicado y autoritativo aplicable al actor; y el instante de resolución se
encuentra antes de su inicio o en su fin o después de él.

La regla raíz queda:

```text
SESIÓN AUTENTICADA VÁLIDA
+
IDENTIDAD LABORAL ACTIVA
+
ACCESO A LA APLICACIÓN PERMITIDO
+
CAPACIDAD QUE EXIGE TURNO VIGENTE
+
UN TURNO LABORAL PUBLICADO AUTORITATIVO
+
RESOLUCIÓN TEMPORAL CONCLUYENTE
+
RESOLVED_AT FUERA DE [STARTS_AT, ENDS_AT)
→
DENY
+
AUTH_OUTSIDE_SHIFT_WINDOW
+
403
+
CERO EFECTOS
```

La tarea responde exclusivamente:

```text
¿EXISTE UNA PUBLICACIÓN LABORAL APLICABLE,
PERO EL INSTANTE AUTORITATIVO ESTÁ FUERA
DE SU VENTANA TEMPORAL VIGENTE?
```

No responde:

```text
¿EXISTE SESIÓN?
¿EL USUARIO O EMPLEADO ESTÁ ACTIVO?
¿PUEDE ENTRAR A LA APLICACIÓN?
¿EXISTE UN TURNO PUBLICADO?
¿EXISTE CHECK-IN ACTIVO?
¿EL ROL OPERATIVO EXISTE?
¿EL ROL ES VÁLIDO PARA LA SEDE O EL ÁREA?
¿TIENE EL PERMISO EXACTO?
¿EL RECURSO ESTÁ DENTRO DEL SCOPE?
¿EL DISPOSITIVO ESTÁ AUTORIZADO?
¿LA FUENTE TÉCNICA ESTÁ DISPONIBLE?
```

La ausencia de publicación pertenece a `AUTH-ERR-009`. La existencia de una
publicación aplicable fuera de la ventana pertenece a `AUTH-ERR-010`. La falta
de check-in después de confirmar una ventana vigente pertenece a
`AUTH-ERR-011`.

---

#### 2. Resultado material

Se aprueban cinco artefactos documentales completos:

1. `SHIFT-WINDOW-BLOCKING-CONTRACT-001`, que congela identidad pública,
   semántica temporal, causas internas, respuesta, recuperación, seguridad,
   frescura y auditoría;
2. `SHIFT-WINDOW-TEMPORAL-DECISION-MATRIX-001`, que decide veinticuatro
   escenarios y separa publicación, inicio, fin, check-in, rol, ambigüedad,
   dispositivo, simulación y fallo técnico;
3. `SHIFT-WINDOW-CHANNEL-RESPONSE-MATRIX-001`, que materializa diez canales con
   respuesta equivalente y cero efectos;
4. `SHIFT-WINDOW-APPLICATION-COVERAGE-REGISTER-001`, que decide el alcance para
   las diez aplicaciones canónicas sin imponer temporalidad laboral a
   capacidades base, administrativas, de cliente o de sistema;
5. `SHIFT-WINDOW-PHYSICAL-RECONCILIATION-001`, que registra catorce brechas
   físicas, el snapshot desplegado y el destino exacto de cada cierre.

Cobertura materializada:

| Elemento                                            |             Cantidad |
| --------------------------------------------------- | -------------------: |
| Código público canónico                             |                    1 |
| Estado HTTP no navegacional                         |             1, `403` |
| Causas internas temporales admitidas                |                    2 |
| Intervalo temporal canónico                         |       1, semiabierto |
| Escenarios con decisión explícita                   |                   24 |
| Canales con respuesta explícita                     |                   10 |
| Aplicaciones canónicas reconciliadas                |                   10 |
| Permisos canónicos evaluados por prerrequisito      |                  112 |
| Permisos sin carril operativo                       |                   54 |
| Permisos con carril operativo que exige turno       |                   58 |
| Carriles operativos `T`                             |                   19 |
| Carriles operativos `T+C`                           |                   39 |
| Turnos físicos observados                           |                 2844 |
| Turnos publicados observados                        |                 2723 |
| Turnos no publicados observados                     |                  121 |
| Turnos laborales observados                         |                 2411 |
| Turnos de descanso observados                       |                  433 |
| Turnos laborales publicados futuros observados      |                  141 |
| Turnos laborales publicados finalizados observados  |                 2177 |
| Turnos laborales publicados vigentes en el snapshot |                    0 |
| Turnos físicos que cruzan medianoche observados     |                    0 |
| Funciones que referencian `employee_shifts`         |                   10 |
| Funciones que referencian `published_at`            |                    5 |
| Funciones que emiten `out_of_shift`                 |                    1 |
| Políticas físicas activas de aplicación             | 1, únicamente `nexo` |
| Brechas físicas registradas                         |                   14 |
| Requisitos de prueba derivados                      |                   10 |

Las cifras físicas son un snapshot de solo lectura. No certifican que el
contrato esté implementado ni que cada turno histórico satisfaga las reglas
canónicas de revisión, temporalidad, territorio, rol o autorización.

---

#### 3. Identidad canónica del bloqueo

La identidad pública única es:

```text
reason_code = AUTH_OUTSIDE_SHIFT_WINDOW
```

| Propiedad                   | Valor                                                                           |
| --------------------------- | ------------------------------------------------------------------------------- |
| Dominio                     | `AUTHORIZATION_CONTEXT`                                                         |
| Decisión                    | `DENY`                                                                          |
| Principal                   | autenticado y conservado                                                        |
| Identidad requerida         | laboral, existente y activa                                                     |
| Aplicación                  | acceso general ya permitido                                                     |
| Publicación                 | presente, laboral y autoritativa                                                |
| Estado público              | `OUTSIDE_PUBLISHED_SHIFT_WINDOW`                                                |
| Estado HTTP no navegacional | `403 Forbidden`                                                                 |
| Ejecutable                  | `false`                                                                         |
| Recuperación                | revisar horario o esperar una nueva ventana válida y emitir una solicitud nueva |
| Cierre de sesión            | no automático                                                                   |
| Reintento automático        | prohibido                                                                       |
| Efectos parciales           | prohibidos                                                                      |

Quedan prohibidos como identidad pública alternativa:

- `OUT_OF_SHIFT`;
- `OUT_OF_SCHEDULE`;
- `NOT_IN_SHIFT`;
- `SHIFT_INACTIVE`;
- `NO_ACTIVE_SHIFT`;
- `NO_SHIFT`;
- `SHIFT_REQUIRED`;
- `TIME_RESTRICTED`;
- `NO_PERMISSION`;
- `UNAUTHORIZED` sin tipificación;
- mensajes libres de una aplicación, RPC o política RLS.

`AUTH_ACTIVE_SHIFT_REQUIRED` no se adopta porque la expresión “turno activo”
también se utiliza para el conjunto turno vigente más check-in activo. Esta
tarea protege únicamente la ventana temporal y no debe absorber
`AUTH-ERR-011`.

El código público es estable y no se traduce. El texto humano podrá
localizarse.

---

#### 4. Definición exacta de “fuera de turno”

Existe `AUTH_OUTSIDE_SHIFT_WINDOW` cuando:

1. la capacidad exige un carril operativo con turno vigente;
2. existe exactamente una publicación laboral autoritativa aplicable al actor
   y a la ocurrencia pertinente;
3. su intervalo absoluto puede construirse de forma determinista;
4. la resolución temporal se ejecuta con tiempo de servidor;
5. `resolved_at` no pertenece al intervalo semiabierto aprobado;
6. ninguna razón anterior o estructural más específica debe prevalecer.

La forma lógica es:

```text
PUBLISHED_SHIFT_FACT = PRESENT
AND
TEMPORAL_RESOLUTION = CONCLUSIVE
AND
NOT (STARTS_AT <= RESOLVED_AT < ENDS_AT)
→
AUTH_OUTSIDE_SHIFT_WINDOW
```

La condición admite dos causas internas:

```text
RESOLVED_AT < STARTS_AT
→ PUBLISHED_SHIFT_NOT_STARTED

RESOLVED_AT >= ENDS_AT
→ PUBLISHED_SHIFT_ENDED
```

Ambas causas producen la misma respuesta pública. La causa interna solo se
conserva para auditoría, diagnóstico protegido, métricas y pruebas.

---

#### 5. Condiciones que no pertenecen a esta razón

| Condición observada                                           | Clasificación correcta              | Tarea propietaria     |
| ------------------------------------------------------------- | ----------------------------------- | --------------------- |
| no existe publicación laboral aplicable                       | ausencia de turno publicado         | `AUTH-ERR-009`        |
| solo existe borrador                                          | ausencia de turno publicado         | `AUTH-ERR-009`        |
| publicación cancelada o retirada                              | ausencia de publicación utilizable  | `AUTH-ERR-009`        |
| solo existe descanso o programación no laboral                | ausencia de turno laboral publicado | `AUTH-ERR-009`        |
| existe turno publicado y `starts_at <= resolved_at < ends_at` | continuar evaluación                | autorización canónica |
| ventana vigente y falta check-in requerido                    | check-in requerido                  | `AUTH-ERR-011`        |
| ventana vigente y falta rol operativo                         | rol faltante                        | `AUTH-ERR-012`        |
| rol incompatible con sede                                     | rol inválido para sede              | `AUTH-ERR-013`        |
| rol incompatible con área                                     | rol inválido para área              | `AUTH-ERR-014`        |
| dispositivo incompatible                                      | dispositivo no autorizado           | `AUTH-ERR-015`        |
| simulación intenta efecto real                                | acción no permitida en simulación   | `AUTH-ERR-016`        |
| dos o más turnos vigentes candidatos                          | configuración ambigua               | `AUTH-ERR-017`        |
| intervalo, zona o revisión no resoluble                       | configuración inválida              | `AUTH-ERR-017`        |
| permiso no registrado                                         | permiso no registrado               | `AUTH-ERR-018`        |
| consulta falla, expira o no es concluyente                    | error técnico                       | `AUTH-ERR-019`        |
| permiso base autoriza sin carril operativo                    | continuar carril base               | autorización canónica |
| actor cliente o sistema autónomo                              | contrato no laboral                 | contrato propietario  |

Regla obligatoria:

```text
NO SE ENCONTRÓ UN TURNO VIGENTE
≠
SE DEMOSTRÓ QUE UN TURNO PUBLICADO ESTÁ FUERA DE VENTANA
```

Un `active_shift = null` no basta para producir esta razón.

---

#### 6. Modelo temporal canónico

Toda resolución utilizará tres valores absolutos:

```text
STARTS_AT
ENDS_AT
RESOLVED_AT
```

| Valor         | Fuente autoritativa                                                  |
| ------------- | -------------------------------------------------------------------- |
| `starts_at`   | revisión publicada, fecha laboral, hora local y zona autoritativa    |
| `ends_at`     | revisión publicada, regla de cruce de medianoche y zona autoritativa |
| `resolved_at` | reloj del servidor dentro del snapshot de autorización               |

No se utilizarán como autoridad:

- hora del navegador;
- reloj del dispositivo;
- hora enviada en body, query o header;
- timestamp local de una cola offline;
- hora almacenada en local storage;
- último valor mostrado en UI;
- tiempo de una decisión anterior;
- hora del check-in para extender el turno;
- `status = scheduled` para mantenerlo vigente;
- ejecución de un job como requisito para que termine.

Para la operación actual de Vento Group la zona organizacional es:

```text
America/Bogota
```

Una operación multizona futura deberá incorporar una fuente canónica por sede
antes de modificar esta regla.

---

#### 7. Intervalo semiabierto obligatorio

La ventana vigente es:

```text
[STARTS_AT, ENDS_AT)
```

Equivale a:

```text
STARTS_AT <= RESOLVED_AT
AND
RESOLVED_AT < ENDS_AT
```

Decisiones exactas:

| Instante                | Resultado                   |
| ----------------------- | --------------------------- |
| antes de `starts_at`    | `AUTH_OUTSIDE_SHIFT_WINDOW` |
| exactamente `starts_at` | turno vigente; continuar    |
| entre inicio y fin      | turno vigente; continuar    |
| exactamente `ends_at`   | `AUTH_OUTSIDE_SHIFT_WINDOW` |
| después de `ends_at`    | `AUTH_OUTSIDE_SHIFT_WINDOW` |

No existen segundos, minutos o tolerancias implícitas. Una ventana de gracia
para check-in o asistencia no amplía automáticamente la ventana de
autorización. Toda tolerancia distinta deberá ser explícita, versionada y
consumida por el contrato propietario.

---

#### 8. Turnos que cruzan medianoche

Cuando una revisión laboral válida declara una hora de fin menor o igual que
la hora de inicio y la clasificación permite un turno nocturno:

```text
ENDS_AT = DÍA SIGUIENTE + HORA DE FIN
```

Ejemplo:

```text
shift_date = 2026-08-03
start_time = 22:00
end_time   = 06:00
```

produce:

```text
starts_at = 2026-08-03T22:00:00-05:00
ends_at   = 2026-08-04T06:00:00-05:00
```

A las 02:00 del 4 de agosto el turno está vigente. Queda prohibido filtrar
exclusivamente:

```text
shift_date = fecha local de resolved_at
```

porque descartaría el turno iniciado el día anterior.

Un cruce de medianoche no resoluble, una duración inválida o una zona
desconocida no producen `AUTH_OUTSIDE_SHIFT_WINDOW`; producen configuración
inválida mediante `AUTH-ERR-017`.

---

#### 9. Causas internas admitidas

| Causa interna                 | Condición                                                | Respuesta pública           |
| ----------------------------- | -------------------------------------------------------- | --------------------------- |
| `PUBLISHED_SHIFT_NOT_STARTED` | existe publicación aplicable y `resolved_at < starts_at` | `AUTH_OUTSIDE_SHIFT_WINDOW` |
| `PUBLISHED_SHIFT_ENDED`       | existe publicación aplicable y `resolved_at >= ends_at`  | `AUTH_OUTSIDE_SHIFT_WINDOW` |

No se admiten como causas internas de esta tarea:

- `SHIFT_NOT_FOUND`;
- `UNPUBLISHED_SHIFT`;
- `DRAFT_SHIFT`;
- `CANCELLED_SHIFT`;
- `CHECKIN_MISSING`;
- `ROLE_MISSING`;
- `ROLE_INVALID`;
- `SITE_MISMATCH`;
- `AREA_MISMATCH`;
- `DEVICE_DENIED`;
- `MULTIPLE_SHIFTS`;
- `SOURCE_UNAVAILABLE`.

Estas condiciones conservan sus tareas propietarias y no se reetiquetan para
simplificar una implementación.

---

#### 10. `SHIFT-WINDOW-BLOCKING-CONTRACT-001`

La forma pública mínima será:

```ts
type ShiftWindowBlockingReason = {
  contract: "SHIFT-WINDOW-BLOCKING-CONTRACT-001";
  contract_version: "1.0.0";
  reason_code: "AUTH_OUTSIDE_SHIFT_WINDOW";
  state: "OUTSIDE_PUBLISHED_SHIFT_WINDOW";
  domain: "AUTHORIZATION_CONTEXT";
  decision: "DENY";
  executable: false;
  retryable: false;
  recovery_action: "REVIEW_SCHEDULE";
  http_status: 403;
  app_code: string;
  channel: ShiftWindowChannel;
  correlation_id: string;
  resolved_at: string;
};
```

La forma pública no incluirá:

- `shift_id`;
- `employee_id`;
- `starts_at`;
- `ends_at`;
- fecha del turno;
- sede;
- área;
- rol;
- publicador;
- revisión;
- causa interna;
- minuto restante;
- turno siguiente;
- permiso;
- recurso;
- contenido de check-in;
- identificadores de dispositivo;
- SQL, RPC o política que produjo la decisión.

La causa interna y los hashes mínimos se registrarán en un envelope de
auditoría protegido.

---

#### 11. Dependencia por permiso y carril

Esta tarea no crea una clasificación paralela. Consume los prerrequisitos
`N`, `T` y `T+C`.

| Prerrequisito | Dependencia temporal                    | Resultado fuera de ventana        |
| ------------- | --------------------------------------- | --------------------------------- |
| `N`           | no exige turno                          | esta razón no aplica              |
| `T`           | exige turno vigente, no check-in propio | deniega el carril operativo       |
| `T+C`         | exige turno vigente y después check-in  | deniega antes de evaluar check-in |

Distribución canónica:

| Clasificación                 | Cantidad | Efecto                                             |
| ----------------------------- | -------: | -------------------------------------------------- |
| permisos sin carril operativo |       54 | no se bloquean por temporalidad laboral            |
| permisos con carril operativo |       58 | su carril operativo exige ventana vigente          |
| carriles `T`                  |       19 | esta razón si la publicación está fuera de ventana |
| carriles `T+C`                |       39 | esta razón precede al requisito de check-in        |

Una aplicación visible, dispositivo, simulación, rol o bypass local no puede
degradar `T+C` a `T` ni `T` a `N`.

---

#### 12. Modalidades de autorización

##### 12.1 `BASE_ONLY`

No evalúa temporalidad laboral por esta tarea.

```text
CARRIL BASE VÁLIDO
+
SIN TURNO VIGENTE
→
CONTINUAR EVALUACIÓN BASE
```

##### 12.2 `OPERATIONAL_ONLY`

Exige ventana vigente.

```text
PUBLICACIÓN APLICABLE
+
FUERA DE VENTANA
→
AUTH_OUTSIDE_SHIFT_WINDOW
```

##### 12.3 `BASE_OR_OPERATIONAL`

Los carriles permanecen independientes.

```text
BASE ALLOW
+
OPERATIVO FUERA DE VENTANA
→
LA DECISIÓN PUEDE SER ALLOW POR EL CARRIL BASE
```

```text
BASE DENY
+
OPERATIVO FUERA DE VENTANA
→
AUTH_OUTSIDE_SHIFT_WINDOW
```

No se mostrará esta razón cuando el carril base concluyente ya autorice la
capacidad.

##### 12.4 `BASE_AND_OPERATIONAL`

Ambos carriles son obligatorios. Aunque el carril base sea válido, una ventana
operativa inválida produce esta razón.

---

#### 13. Publicación, revisión y temporalidad

La evaluación temporal solo ocurre después de resolver una publicación
utilizable.

```text
OCURRENCIA LÓGICA
→ REVISIÓN PUBLICADA AUTORITATIVA
→ CONSTRUIR INTERVALO ABSOLUTO
→ EVALUAR RESOLVED_AT
```

Reglas:

1. un borrador no entra a la evaluación temporal;
2. una edición posterior no publicada no cambia `starts_at` ni `ends_at`;
3. una republicación efectiva reemplaza la revisión anterior para solicitudes
   nuevas;
4. una revisión retirada o cancelada vuelve a la razón de `AUTH-ERR-009`;
5. la confirmación del trabajador no modifica la ventana;
6. `status = scheduled` no prolonga el turno;
7. el check-in no extiende `ends_at`;
8. una sesión abierta residual no convierte un turno terminado en vigente;
9. una publicación tardía no autoriza retroactivamente una acción antigua;
10. una corrección de horario exige resolver un snapshot nuevo.

---

#### 14. Estados terminales y resultado histórico

Una fila físicamente marcada como:

- `cancelled`;
- `completed`;
- `no_show`;
- `withdrawn`;
- `deleted`;
- equivalente terminal futuro;

no se tratará como una publicación temporal ordinaria.

| Situación                                                     | Razón                                  |
| ------------------------------------------------------------- | -------------------------------------- |
| cancelación o retiro elimina la publicación utilizable        | `AUTH-ERR-009`                         |
| estado terminal contradice una revisión supuestamente vigente | `AUTH-ERR-017`                         |
| el intervalo terminó aunque `status` siga `scheduled`         | `AUTH-ERR-010`                         |
| resultado histórico se actualiza después                      | no altera retroactivamente la decisión |

El fin temporal no depende de que un proceso actualice el estado físico.

---

#### 15. Relación con check-in

La temporalidad precede al check-in.

```text
VENTANA NO VIGENTE
→ AUTH-ERR-010
→ NO EVALUAR CHECK-IN COMO CAUSA PÚBLICA PRINCIPAL
```

```text
VENTANA VIGENTE
+
PERMISO T+C
+
SIN CHECK-IN ACTIVO
→ AUTH-ERR-011
```

Un check-in residual después de `ends_at`:

- no extiende el turno;
- no satisface `T` ni `T+C`;
- no cambia la razón pública de esta tarea;
- debe invalidarse o cerrarse según los contratos de asistencia;
- conserva evidencia auditada;
- no permite una mutación tardía.

Un permiso `T` puede continuar dentro de la ventana sin check-in. Un permiso
`T+C` debe evaluar check-in únicamente después de confirmar la ventana.

---

#### 16. Actor efectivo, dispositivo y sistema

| Actor                     | Regla                                                                    |
| ------------------------- | ------------------------------------------------------------------------ |
| `EMPLOYEE`                | puede producir esta razón cuando el carril operativo exige turno vigente |
| `CUSTOMER`                | PASS cliente no recibe temporalidad laboral ficticia                     |
| `SYSTEM` autónomo         | usa identidad y contrato técnico; no recibe turno laboral sintético      |
| `DEVICE` sin actor humano | conserva razón de actor o dispositivo, no esta razón                     |
| `DEVICE` con actor válido | evalúa el turno del empleado efectivo                                    |
| `UNRESOLVED`              | conserva razón anterior de identidad o disponibilidad                    |

Un dispositivo compartido no:

- presta un turno;
- presta una hora;
- presta la sede del último actor;
- conserva el turno al cerrar la sesión de actor;
- extiende la ventana mientras permanece encendido;
- convierte su zona local en autoridad;
- elimina el requisito temporal.

La fórmula es restrictiva:

```text
AUTORIDAD DEL ACTOR
∩
VENTANA DEL TURNO DEL ACTOR
∩
RESTRICCIONES DEL DISPOSITIVO
```

---

#### 17. Fuentes autoritativas y datos no confiables

La resolución deberá consumir:

- actor efectivo;
- publicación autoritativa;
- revisión vigente de la ocurrencia;
- fecha y horas de la revisión;
- clasificación laboral;
- zona horaria autoritativa;
- `resolved_at` de servidor;
- estado terminal o retiro aplicable;
- modalidad y prerrequisito del permiso.

No aceptará como autoridad:

- `shift_id` cliente sin validación;
- `starts_at` o `ends_at` enviados por cliente;
- fecha u hora de dispositivo;
- turno seleccionado visualmente;
- último turno trabajado;
- turno más cercano;
- check-in para escoger turno;
- rol base o perfil predeterminado;
- sede seleccionada;
- caché sin fingerprint vigente;
- fila ordenada primero por SQL;
- simulación como hecho real.

---

#### 18. Entradas mínimas y resultado determinista

El evaluador temporal mínimo recibe:

```ts
type ShiftWindowEvaluationInput = {
  actor_id: string;
  permission_code: string;
  authorization_lane: "BASE" | "OPERATIONAL";
  prerequisite: "N" | "T" | "T+C";
  published_shift_revision_id: string | null;
  starts_at: string | null;
  ends_at: string | null;
  resolved_at: string;
  timezone: string;
  terminal_state: string | null;
  context_version: string;
  context_fingerprint: string;
};
```

Para los mismos hechos y `resolved_at`, la decisión debe ser idéntica en todos
los canales. El resultado no depende del orden físico de filas ni de la hora
del cliente.

---

#### 19. Precedencia dentro del árbol de bloqueo

Orden obligatorio para una capacidad laboral protegida:

```text
1. superficie pública o protegida
2. disponibilidad técnica de autenticación y autorización
3. sesión válida
4. identidad y estado del usuario o empleado
5. acceso a la aplicación
6. modalidad y carril potencialmente autorizable
7. territorio estructural anterior aplicable
8. dependencia de turno del permiso
9. existencia de publicación laboral utilizable
10. integridad de revisión e intervalo
11. vigencia temporal
12. sede y área operativas
13. check-in cuando corresponda
14. rol operativo
15. dispositivo
16. permiso, scope, recurso y estado
17. ejecución atómica
```

Reglas:

1. `AUTH-ERR-009` precede a esta razón cuando falta publicación;
2. esta razón precede a `AUTH-ERR-011` porque sin ventana vigente no se evalúa
   la presencia como causa principal;
3. una ambigüedad o intervalo inválido conserva `AUTH-ERR-017`;
4. un fallo de fuente conserva `AUTH-ERR-019`;
5. el carril base puede concluir antes cuando la modalidad lo permite;
6. una causa posterior no oculta una causa anterior concluyente;
7. solo se expone una razón pública principal por intento.

---

#### 20. `SHIFT-WINDOW-TEMPORAL-DECISION-MATRIX-001`

|    # | Escenario                                                              | Decisión                                            | Razón pública               |
| ---: | ---------------------------------------------------------------------- | --------------------------------------------------- | --------------------------- |
|    1 | permiso `N`, sin turno vigente                                         | continuar carril base                               | ninguna                     |
|    2 | `BASE_OR_OPERATIONAL`, carril base permite, operativo fuera de ventana | `ALLOW` por base si las demás condiciones coinciden | ninguna                     |
|    3 | `OPERATIONAL_ONLY`, publicación futura                                 | denegar                                             | `AUTH_OUTSIDE_SHIFT_WINDOW` |
|    4 | `OPERATIONAL_ONLY`, publicación finalizada                             | denegar                                             | `AUTH_OUTSIDE_SHIFT_WINDOW` |
|    5 | `BASE_AND_OPERATIONAL`, publicación futura                             | denegar                                             | `AUTH_OUTSIDE_SHIFT_WINDOW` |
|    6 | `BASE_AND_OPERATIONAL`, publicación finalizada                         | denegar                                             | `AUTH_OUTSIDE_SHIFT_WINDOW` |
|    7 | no existe publicación laboral                                          | denegar antes                                       | `AUTH-ERR-009`              |
|    8 | solo existe borrador                                                   | denegar antes                                       | `AUTH-ERR-009`              |
|    9 | publicación aplicable y `resolved_at < starts_at`                      | denegar                                             | `AUTH_OUTSIDE_SHIFT_WINDOW` |
|   10 | `resolved_at = starts_at`                                              | continuar                                           | ninguna                     |
|   11 | `starts_at < resolved_at < ends_at`                                    | continuar                                           | ninguna                     |
|   12 | `resolved_at = ends_at`                                                | denegar                                             | `AUTH_OUTSIDE_SHIFT_WINDOW` |
|   13 | `resolved_at > ends_at`                                                | denegar                                             | `AUTH_OUTSIDE_SHIFT_WINDOW` |
|   14 | turno nocturno antes de medianoche dentro del intervalo                | continuar                                           | ninguna                     |
|   15 | turno nocturno después de medianoche dentro del intervalo              | continuar                                           | ninguna                     |
|   16 | turno inició el día anterior y sigue vigente                           | continuar; no filtrar por fecha actual              | ninguna                     |
|   17 | dos turnos publicados vigentes candidatos                              | denegar por ambigüedad                              | `AUTH-ERR-017`              |
|   18 | intervalo, zona o revisión no resoluble                                | denegar por configuración                           | `AUTH-ERR-017`              |
|   19 | check-in residual después del fin                                      | denegar por temporalidad                            | `AUTH_OUTSIDE_SHIFT_WINDOW` |
|   20 | permiso `T`, ventana vigente y sin check-in                            | continuar evaluación                                | ninguna                     |
|   21 | permiso `T+C`, ventana vigente y sin check-in                          | denegar después                                     | `AUTH-ERR-011`              |
|   22 | dispositivo autorizado, actor identificado y turno fuera de ventana    | denegar                                             | `AUTH_OUTSIDE_SHIFT_WINDOW` |
|   23 | proceso `SYSTEM` autónomo sin turno laboral                            | aplicar contrato técnico                            | ninguna                     |
|   24 | timeout, excepción o respuesta no concluyente                          | denegar por disponibilidad                          | `AUTH-ERR-019`              |

La matriz es exhaustiva para esta tarea. No se elige arbitrariamente el turno
más cercano, el último, el confirmado, el que tiene check-in ni el de la sede
seleccionada.

---

#### 21. Regla de cero efectos

Cuando se produce `AUTH_OUTSIDE_SHIFT_WINDOW`:

- no se ejecuta la acción solicitada;
- no se abre una transacción de negocio;
- no se crean filas parciales;
- no se reserva ni descuenta inventario;
- no se cambia estado de remisión;
- no se registra recepción, retiro, conteo, despacho o entrega;
- no se publica evento empresarial;
- no se crea impresión;
- no se confirma una cola offline;
- no se prolonga el turno;
- no se crea check-in;
- no se modifica el horario;
- no se ajusta `status`;
- no se reutiliza un `ALLOW` anterior;
- no se mantiene una suscripción incompatible;
- no se registra la denegación como éxito funcional.

Si una capa descubre la causa después de un efecto, existe un defecto de
atomicidad y la prueba debe fallar.

---

#### 22. Envelope público

Respuesta JSON mínima:

```json
{
  "ok": false,
  "decision": "DENY",
  "reason_code": "AUTH_OUTSIDE_SHIFT_WINDOW",
  "state": "OUTSIDE_PUBLISHED_SHIFT_WINDOW",
  "executable": false,
  "retryable": false,
  "correlation_id": "opaque"
}
```

Reglas:

- `correlation_id` es opaco;
- no contiene identificadores laborales;
- no devuelve horario ni intervalo;
- no distingue públicamente antes de inicio o después de fin;
- no devuelve el turno siguiente;
- no devuelve sede, área o rol;
- no devuelve causa interna;
- el estado HTTP es `403` fuera de navegación;
- una navegación podrá renderizar la superficie segura equivalente sin perder
  el código semántico en servidor.

---

#### 23. Copy canónico

| Elemento          | Texto exacto                                                                                             |
| ----------------- | -------------------------------------------------------------------------------------------------------- |
| Título            | `No estás dentro de tu turno`                                                                            |
| Mensaje           | `Tienes un turno publicado, pero no está vigente en este momento. Revisa tu horario antes de continuar.` |
| Acción principal  | `Ver mi horario`                                                                                         |
| Acción secundaria | `Volver a Vento OS`                                                                                      |
| Código de soporte | `AUTH_OUTSIDE_SHIFT_WINDOW`                                                                              |

Reglas de experiencia:

1. no culpa al trabajador;
2. no afirma que falte turno publicado;
3. no afirma que falte check-in;
4. no revela si el turno todavía no empezó o ya terminó;
5. no muestra horas, sede, área o rol;
6. no muestra un contador;
7. no promete activación automática;
8. no induce cierre de sesión;
9. no permite modificar el horario desde el bloqueo;
10. no reintenta automáticamente.

`Ver mi horario` solo se ofrece cuando existe una ruta autorizada a la
programación propia, como la superficie correspondiente de ANIMA. En clientes
no visuales se omite sin alterar el código tipado.

---

#### 24. Recuperación

##### 24.1 Publicación todavía no iniciada

La recuperación válida es:

```text
CONSULTAR PROGRAMACIÓN PROPIA AUTORIZADA
→
ESPERAR STARTS_AT O UNA CORRECCIÓN PUBLICADA
→
INVALIDAR SNAPSHOT ANTERIOR
→
EMITIR SOLICITUD NUEVA
```

##### 24.2 Publicación ya finalizada

La recuperación válida es:

```text
CONSULTAR PROGRAMACIÓN PROPIA AUTORIZADA
→
RESOLVER UNA NUEVA PUBLICACIÓN VIGENTE O CORRECCIÓN ADMINISTRATIVA
→
INVALIDAR SNAPSHOT ANTERIOR
→
EMITIR SOLICITUD NUEVA
```

La superficie de bloqueo no deberá:

- cambiar el turno;
- ampliar la ventana;
- crear una publicación;
- registrar check-in retroactivo;
- usar el siguiente turno antes de su inicio;
- repetir una mutación;
- preservar un formulario ejecutable;
- aceptar una hora enviada por cliente;
- conceder un bypass temporal.

---

#### 25. `SHIFT-WINDOW-CHANNEL-RESPONSE-MATRIX-001`

| Canal                    | Detección                                      | Respuesta                                 | Efecto obligatorio                            |
| ------------------------ | ---------------------------------------------- | ----------------------------------------- | --------------------------------------------- |
| navegación web / RSC     | guard o loader central con snapshot fresco     | superficie segura con copy canónico       | sin datos protegidos ni redirect a login      |
| Server Action            | evaluador inmediatamente antes de mutación     | error tipado y `403` semántico            | cero escritura y cero revalidación de éxito   |
| Route Handler            | middleware o servicio compartido               | envelope canónico, `403`                  | sin body parcial                              |
| fetch desde cliente      | SDK compartido                                 | error tipado                              | UI conserva sesión y limpia estado sensible   |
| RPC / PostgREST          | función de decisión                            | deny tipado o error contractual mapeado   | sin DML                                       |
| RLS / Data API           | política y adapter                             | cero filas o denegación mapeada           | no convertir vacío en éxito silencioso        |
| Edge Function            | verificación central                           | envelope canónico, `403`                  | no usar service role para saltar temporalidad |
| Realtime                 | reevaluación al suscribir y al cruzar frontera | no suscribir o retirar entrega            | sin eventos posteriores al fin                |
| cliente nativo / offline | revalidación al sincronizar                    | conflicto de autorización no reintentable | no confirmar cola con hora cliente            |
| dispositivo compartido   | intersección actor–turno–dispositivo           | bloqueo seguro                            | el reloj o sesión técnica no extiende turno   |

Todos los canales conservan el mismo `reason_code`, la misma semántica temporal
y el mismo resultado de cero efectos.

---

#### 26. Navegación, accesibilidad y privacidad

Al producirse el bloqueo:

- se conserva la sesión;
- se conserva el acceso general a la aplicación si sigue permitido;
- se descartan datos sensibles cargados para la acción;
- no se conserva un formulario ejecutable;
- no se muestra un CTA de guardar o reintentar;
- no se identifica públicamente la causa interna;
- el foco se mueve al título;
- el código de soporte queda como texto seleccionable;
- título, mensaje y acciones poseen orden accesible;
- la acción principal funciona con teclado;
- zoom y contraste mantienen legibilidad;
- una ruta de horario no expone turnos de terceros.

La respuesta no revelará:

- hora de inicio o fin;
- duración;
- turno siguiente;
- sede o área;
- rol operativo;
- permiso evaluado;
- recurso solicitado;
- datos de check-in;
- publicador o revisión;
- configuración del dispositivo;
- causa interna temporal.

---

#### 27. Operación offline, reintentos e idempotencia

Una acción capturada offline deberá reconstruir la autorización en el
servidor al sincronizar.

```text
CONTEXTO LOCAL PARECÍA VÁLIDO
+
SERVIDOR RESUELVE FUERA DE VENTANA
→
DENY
+
AUTH_OUTSIDE_SHIFT_WINDOW
+
CERO EFECTOS
```

Reglas:

- la hora del cliente no prueba autorización;
- una captura antes del fin no garantiza ejecución posterior;
- una captura futura no se difiere automáticamente hasta el inicio;
- una corrección posterior no autoriza retroactivamente la mutación antigua;
- la clave idempotente no transforma el deny en éxito;
- no se reintenta automáticamente al comenzar otro turno;
- el usuario debe emitir una solicitud nueva;
- una operación parcial no queda pendiente silenciosamente.

---

#### 28. Frescura e invalidación

Invalidan el snapshot y cualquier decisión asociada:

- llegada exacta a `starts_at`;
- llegada exacta a `ends_at`;
- publicación o republicación;
- retiro o cancelación;
- cambio de fecha u horario;
- cambio de zona horaria;
- cambio de clasificación laboral;
- cambio de actor;
- cambio de sede, área o rol;
- desactivación de empleado, sede, área o rol;
- cambio de modalidad o prerrequisito;
- cambio de permiso, scope o recurso;
- cierre o revocación de sesión;
- cambio de actor en dispositivo compartido;
- inicio o finalización de simulación;
- actualización contractual incompatible.

Toda mutación deberá revalidar inmediatamente antes del primer efecto.

Una decisión de navegación no se reutiliza para una mutación posterior. Un
cache debe expirar o invalidarse en las fronteras temporales aunque no exista
un evento de base de datos. Realtime debe retirar entregas al llegar a
`ends_at`.

---

#### 29. Auditoría

La auditoría mínima protegida incluirá:

```text
event_type = AUTHORIZATION_DENIED
reason_code = AUTH_OUTSIDE_SHIFT_WINDOW
internal_cause
actor_id_hash
permission_code
authorization_lane
prerequisite
published_shift_revision_id_hash
starts_at_bucket
ends_at_bucket
resolved_at
context_version
context_fingerprint
app_code
channel
correlation_id
```

Reglas:

- `internal_cause` distingue inicio pendiente de turno finalizado;
- los timestamps exactos se restringen según necesidad diagnóstica;
- el log público no contiene horario;
- no se registran nombres de empleado, sede, área o rol;
- no se registran tokens, cookies ni secretos;
- la denegación no se contabiliza como error técnico;
- una excepción de fuente se registra como `AUTH-ERR-019`, no como esta razón.

---

#### 30. `SHIFT-WINDOW-APPLICATION-COVERAGE-REGISTER-001`

| Aplicación | Dependencia temporal válida                          | No debe producir esta razón por                              | Decisión documental                                |
| ---------- | ---------------------------------------------------- | ------------------------------------------------------------ | -------------------------------------------------- |
| SHELL      | una capacidad futura con carril operativo explícito  | acceso al hub o navegación base                              | no imponer horario laboral al hub                  |
| ANIMA      | acciones operativas futuras clasificadas `T` o `T+C` | consulta de horario propio, asistencia o documentación base  | conservar acceso al horario para recuperación      |
| AURA       | una capacidad laboral operativa futura explícita     | acceso editorial diferido o capacidades sin carril operativo | no inventar turno                                  |
| FOGO       | 5 carriles operativos `T` o `T+C`                    | recetario maestro base                                       | exigir ventana por permiso                         |
| NEXO       | 47 carriles operativos `T` o `T+C`                   | 16 capacidades base exclusivas                               | aplicar temporalidad por carril, no por aplicación |
| NUMERA     | ninguna capacidad operativa actual                   | acceso y analítica administrativa                            | no imponer turno                                   |
| ORIGO      | 4 carriles operativos                                | revisión base del catálogo                                   | exigir ventana solo al carril operativo            |
| PASS       | ninguna capacidad laboral del cliente                | sesión, puntos y beneficios del cliente                      | no mezclar cliente con empleado                    |
| PULSO      | 2 carriles operativos                                | procesos técnicos o de sistema con contrato propio           | exigir ventana al actor laboral efectivo           |
| VISO       | ninguna capacidad operativa actual                   | administración, horarios, auditoría y simulación             | no bloquear gestión administrativa por horario     |

Cobertura cuantitativa total:

| Aplicación | Permisos totales | Carriles operativos |
| ---------- | ---------------: | ------------------: |
| SHELL      |                1 |                   0 |
| ANIMA      |               10 |                   0 |
| AURA       |                1 |                   0 |
| FOGO       |                6 |                   5 |
| NEXO       |               63 |                  47 |
| NUMERA     |                6 |                   0 |
| ORIGO      |                5 |                   4 |
| PASS       |                1 |                   0 |
| PULSO      |                2 |                   2 |
| VISO       |               17 |                   0 |
| **Total**  |          **112** |              **58** |

La dependencia se determina por permiso, modalidad y carril. El nombre de la
aplicación nunca basta.

---

#### 31. Snapshot físico desplegado

La inspección de solo lectura del proyecto VENTO observó, en el snapshot
`2026-08-04T00:01:27-05:00`:

| Métrica                                          |  Valor observado |
| ------------------------------------------------ | ---------------: |
| filas de `employee_shifts`                       |             2844 |
| filas con `published_at`                         |             2723 |
| filas sin `published_at`                         |              121 |
| turnos laborales                                 |             2411 |
| descansos                                        |              433 |
| publicaciones laborales futuras                  |              141 |
| publicaciones laborales finalizadas              |             2177 |
| publicaciones laborales vigentes en el instante  |                0 |
| filas con cruce de medianoche                    |                0 |
| empleados con publicación vigente en el instante |                0 |
| funciones que referencian `employee_shifts`      |               10 |
| funciones que referencian `published_at`         |                5 |
| funciones que emiten `out_of_shift`              |                1 |
| políticas activas en `app_operation_policies`    |                1 |
| política activa observada                        | `nexo:true:true` |

La ausencia de turnos vigentes en un snapshot de medianoche no prueba que el
contrato funcione. La ausencia de filas nocturnas tampoco sustituye pruebas de
cruce de día. La evidencia operativa debe producirse en ambientes controlados
sin crear datos productivos no autorizados.

---

#### 32. Comportamiento físico observado

La función desplegada `get_operational_context`:

1. calcula fecha y hora local con `America/Bogota`;
2. filtra `employee_shifts.shift_date = fecha local actual`;
3. exige `published_at is not null`;
4. excluye únicamente `status = cancelled`;
5. compara horas locales y no timestamps absolutos;
6. usa una condición inclusiva equivalente a `between` para turnos del mismo
   día;
7. intenta reconocer turnos nocturnos por comparación de horas, pero mantiene
   el filtro de fecha actual;
8. ordena por hora de inicio y toma una sola fila;
9. emite `out_of_shift` cuando no encuentra candidato;
10. no distingue ausencia de publicación, publicación futura o publicación
    finalizada;
11. puede añadir `checkin_required` en el mismo resultado;
12. conserva bypass físicos por rol o permiso.

El consumidor NEXO convierte `out_of_shift` en el texto libre:

```text
No puedes operar porque estás fuera de turno.
```

No existe todavía un envelope compartido con
`AUTH_OUTSIDE_SHIFT_WINDOW`, ni evidencia transversal para los diez canales.

---

#### 33. `SHIFT-WINDOW-PHYSICAL-RECONCILIATION-001`

| ID       | Brecha física                                                                    | Estado                 | Propietario                                          | Condición de salida                             |
| -------- | -------------------------------------------------------------------------------- | ---------------------- | ---------------------------------------------------- | ----------------------------------------------- |
| `SWG-01` | `out_of_shift` mezcla ausencia de publicación y temporalidad                     | BLOQUEADO              | `AUTH-DB-033`; `AUTH-DB-034`                         | razones separadas y contrato probado            |
| `SWG-02` | filtro `shift_date = hoy` pierde turnos nocturnos iniciados el día anterior      | BLOQUEADO              | `AUTH-DB-033`                                        | resolver por intervalos absolutos               |
| `SWG-03` | comparación inclusiva en el fin contradice `[starts_at, ends_at)`                | BLOQUEADO              | `AUTH-DB-033`; `AUTH-DB-034`                         | frontera exacta validada                        |
| `SWG-04` | comparación por hora local aislada no produce timestamps autoritativos           | BLOQUEADO              | `AUTH-DB-033`                                        | `starts_at`, `ends_at` y zona materializados    |
| `SWG-05` | no existen causas internas antes de inicio y después de fin                      | BLOQUEADO              | `AUTH-DB-034`; `AUTH-ERR-020`                        | causas y auditoría implementadas                |
| `SWG-06` | `order by ... limit 1` oculta candidatos solapados                               | BLOQUEADO              | `AUTH-DB-033`; `AUTH-DB-034`                         | ambigüedad fail closed                          |
| `SWG-07` | estados terminales distintos de cancelación no están excluidos de forma uniforme | BLOQUEADO              | `AUTH-DB-033`                                        | catálogo de estados normalizado                 |
| `SWG-08` | una política de aplicación NEXO sustituye la matriz por permiso                  | BLOQUEADO              | `AUTH-DB-020`; `AUTH-DB-031`; `AUTH-DB-034`          | 112 permisos y 54/19/39 materializados          |
| `SWG-09` | bypass por nombre de rol o permiso puede omitir temporalidad                     | BLOQUEADO              | `AUTH-DB-034`                                        | modalidad y grants evaluados sin bypass nominal |
| `SWG-10` | NEXO usa texto libre y razón legacy                                              | BLOQUEADO              | `SHELL-AUTH-001`; `SHELL-AUTH-002`; `SHELL-AUTH-005` | SDK y mensaje compartido adoptados              |
| `SWG-11` | no existe envelope público tipado con estado temporal                            | BLOQUEADO              | `SHELL-AUTH-001`; `AUTH-ERR-020`                     | contrato publicado y consumido                  |
| `SWG-12` | cachés y Realtime no demuestran invalidación en `starts_at` y `ends_at`          | PENDIENTE_DE_EVIDENCIA | `AUTH-DB-035`; `SHELL-CI-018`; `SHELL-CI-019`        | pruebas de fronteras y retirada de entrega      |
| `SWG-13` | no hay evidencia desplegada de turnos nocturnos                                  | PENDIENTE_DE_EVIDENCIA | `SHELL-CI-016`; `SHELL-CI-018`                       | fixture controlado cruza medianoche             |
| `SWG-14` | no existe evidencia E2E equivalente para diez canales                            | PENDIENTE_DE_EVIDENCIA | `SHELL-CI-016`; `SHELL-CI-018`; `SHELL-CI-019`       | matriz completa ejecutada y archivada           |

Las catorce brechas poseen propietario, destino y condición de salida. Ninguna
se considera implementada por existir este documento.

---

#### 34. Handoff de implementación

La implementación futura deberá distribuirse así:

- `AUTH-DB-020` y `AUTH-DB-031`: materializar catálogo y paridad de
  prerrequisitos;
- `AUTH-DB-033`: resolver publicación, revisión, timestamps absolutos,
  nocturnidad y candidatos;
- `AUTH-DB-034`: evaluar modalidad, temporalidad, precedencia, permiso, scope y
  recurso;
- `AUTH-DB-035`: invalidar contexto, decisiones, cachés y suscripciones en
  fronteras y cambios;
- `SHELL-AUTH-001`: publicar código, tipos, envelope y SDK;
- `SHELL-AUTH-002`: adaptar navegación, acciones, API, RPC y clientes;
- `SHELL-AUTH-004`: lint, métricas y gates de dependencia;
- `SHELL-AUTH-005`: migrar consumidoras;
- `AUTH-ERR-011` a `AUTH-ERR-020`: completar check-in, rol, dispositivo,
  configuración, técnica y distribución;
- `SHELL-CI-016`, `SHELL-CI-018` y `SHELL-CI-019`: ejecutar pruebas y conservar
  evidencia.

Toda migración futura de Supabase deberá crearse, versionarse, documentarse y
ejecutarse desde `vento-shell`.

---

#### 35. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

| ID              | Regla protegida                                                                                                                                                                                                      | Tipo                                   | Prioridad | Momento de implementación            | Destino                                                                                                       |
| --------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------- | --------- | ------------------------------------ | ------------------------------------------------------------------------------------------------------------- |
| `TREQ-AUTH-219` | Una capacidad cuyo carril operativo exige turno vigente y resuelve una publicación fuera de `[starts_at, ends_at)` produce `AUTH_OUTSIDE_SHIFT_WINDOW`, `403`, deny y cero efectos.                                  | contractual + seguridad + temporalidad | crítica   | resolver y evaluador de turno        | `AUTH-DB-033`; `AUTH-DB-034`; `SHELL-CI-016`                                                                  |
| `TREQ-AUTH-220` | La vigencia usa `resolved_at` de servidor, timestamps absolutos, `America/Bogota` y el intervalo semiabierto; inicio exacto permite y fin exacto deniega.                                                            | temporal + fronteras + regresión       | crítica   | resolver temporal                    | `AUTH-DB-033`; `AUTH-DB-034`; `SHELL-CI-016`                                                                  |
| `TREQ-AUTH-221` | `PUBLISHED_SHIFT_NOT_STARTED` y `PUBLISHED_SHIFT_ENDED` conservan diagnóstico interno, pero comparten una respuesta pública que no revela horario ni dirección temporal.                                             | privacidad + auditoría + contrato      | alta      | catálogo de razones y observabilidad | `AUTH-ERR-020`; `AUTH-DB-034`; `SHELL-CI-016`                                                                 |
| `TREQ-AUTH-222` | Ausencia de publicación, temporalidad, check-in, rol, configuración, permiso y fallo técnico conservan códigos y precedencia distintos sin convertir `active_shift = null` en una razón genérica.                    | integración + razones + seguridad      | crítica   | evaluador y catálogo de razones      | `AUTH-ERR-009`; `AUTH-ERR-011`; `AUTH-ERR-012`; `AUTH-ERR-017`; `AUTH-ERR-019`; `AUTH-DB-034`                 |
| `TREQ-AUTH-223` | La temporalidad se aplica por permiso y carril: 54 permisos no operativos no se bloquean, mientras 19 `T` y 39 `T+C` exigen ventana vigente.                                                                         | contractual + catálogo + contexto      | crítica   | catálogo físico y evaluador          | `AUTH-CAT-012`; `AUTH-DB-020`; `AUTH-DB-031`; `SHELL-CI-016`                                                  |
| `TREQ-AUTH-224` | Turnos nocturnos, filas iniciadas el día anterior, candidatos simultáneos, zonas y duraciones se resuelven con intervalos absolutos; la ambigüedad falla cerrado.                                                    | temporal + contexto + regresión        | crítica   | resolver de turno                    | `AUTH-DB-033`; `AUTH-DB-034`; `SHELL-CI-016`; `SHELL-CI-018`                                                  |
| `TREQ-AUTH-225` | Diez canales producen respuesta equivalente, conservan sesión, revalidan en fronteras y no generan datos, suscripciones ni efectos parciales.                                                                        | integración + E2E + concurrencia       | crítica   | SDK, adapters e invalidación         | `SHELL-AUTH-002`; `SHELL-AUTH-005`; `AUTH-DB-035`; `SHELL-CI-016`; `SHELL-CI-018`                             |
| `TREQ-AUTH-226` | Las diez aplicaciones aplican temporalidad por permiso, modalidad y actor; PASS cliente, procesos autónomos y capacidades base no reciben turno laboral sintético.                                                   | contractual + aplicación + identidad   | alta      | migración de consumidoras            | `SHELL-AUTH-001`; `SHELL-AUTH-005`; `SHELL-CI-016`                                                            |
| `TREQ-AUTH-227` | Copy, recuperación, privacidad y accesibilidad conservan sesión, permiten revisar horario propio y no revelan inicio, fin, sede, área, rol, revisión, causa interna ni recurso.                                      | interfaz + privacidad + accesibilidad  | alta      | catálogo compartido de mensajes      | `AUTH-ERR-020`; `SHELL-AUTH-005`; `SHELL-CI-016`                                                              |
| `TREQ-AUTH-228` | La regresión reconcilia 2844 turnos, distribución futura/finalizada, ausencia de nocturnos, 10 funciones, 5 referencias de publicación, razón legacy, política NEXO y catorce brechas sin alterar datos productivos. | regresión + RPC + RLS + seguridad      | crítica   | gates y evidencia E5                 | `AUTH-DB-031`; `AUTH-DB-033`; `AUTH-DB-034`; `SHELL-AUTH-004`; `SHELL-CI-016`; `SHELL-CI-018`; `SHELL-CI-019` |

---

#### 36. Validaciones documentales definidas

La implementación deberá probar, como mínimo:

1. permiso `N` fuera de cualquier turno;
2. `OPERATIONAL_ONLY` antes del inicio;
3. `OPERATIONAL_ONLY` después del fin;
4. `BASE_OR_OPERATIONAL` con base permitido y operativo fuera de ventana;
5. `BASE_OR_OPERATIONAL` con base denegado y operativo fuera de ventana;
6. `BASE_AND_OPERATIONAL` antes del inicio y después del fin;
7. ausencia de publicación conserva `AUTH-ERR-009`;
8. borrador conserva `AUTH-ERR-009`;
9. inicio exacto permite continuar;
10. instante interior permite continuar;
11. fin exacto produce esta razón;
12. instante posterior produce esta razón;
13. turno nocturno antes y después de medianoche;
14. turno del día anterior todavía vigente;
15. dos candidatos simultáneos conservan `AUTH-ERR-017`;
16. intervalo o zona inválida conserva `AUTH-ERR-017`;
17. fallo de fuente conserva `AUTH-ERR-019`;
18. check-in residual no extiende el turno;
19. permiso `T` vigente sin check-in continúa;
20. permiso `T+C` vigente sin check-in conserva `AUTH-ERR-011`;
21. dispositivo compartido con actor fuera de ventana;
22. actor `CUSTOMER` y proceso `SYSTEM` sin turno sintético;
23. simulación sin efecto real;
24. equivalencia de diez canales;
25. cero efectos y ausencia de reintento;
26. invalidación automática en `starts_at` y `ends_at`;
27. copy, teclado, lector de pantalla, zoom y contraste;
28. auditoría minimizada con dos causas internas;
29. reconciliación de las 10 funciones y política NEXO;
30. cobertura de las catorce brechas físicas.

---

#### 37. Evidencia y estados

| Elemento                                | Estado                                                                  |
| --------------------------------------- | ----------------------------------------------------------------------- |
| contrato documental                     | ESPECIFICADO                                                            |
| matriz temporal, canales y aplicaciones | ESPECIFICADO                                                            |
| snapshot de solo lectura                | VALIDADO contra estado desplegado observado                             |
| código público compartido               | PENDIENTE_DE_IMPLEMENTACIÓN — `SHELL-AUTH-001`; `AUTH-ERR-020`          |
| resolver de timestamps y nocturnidad    | PENDIENTE_DE_IMPLEMENTACIÓN — `AUTH-DB-033`                             |
| evaluador unificado                     | PENDIENTE_DE_IMPLEMENTACIÓN — `AUTH-DB-034`                             |
| catálogo físico `N/T/T+C`               | PENDIENTE_DE_IMPLEMENTACIÓN — `AUTH-DB-020`; `AUTH-DB-031`              |
| invalidación temporal y Realtime        | PENDIENTE_DE_IMPLEMENTACIÓN — `AUTH-DB-035`                             |
| adapters de aplicaciones                | PENDIENTE_DE_IMPLEMENTACIÓN — `SHELL-AUTH-002`; `SHELL-AUTH-005`        |
| evidencia de diez canales               | PENDIENTE_DE_EVIDENCIA — `SHELL-CI-016`; `SHELL-CI-018`; `SHELL-CI-019` |
| evidencia de fronteras y nocturnidad    | PENDIENTE_DE_EVIDENCIA — `SHELL-CI-016`; `SHELL-CI-018`                 |

El snapshot no demuestra que el contrato esté implementado. No se declara una
prueba satisfecha sin evidencia reproducible.

---

#### 38. Fuera del alcance

AUTH-ERR-010 no:

- crea, edita, publica, republica, cancela o retira turnos;
- corrige turnos históricos, futuros o finalizados;
- cambia horarios, tipos o zonas horarias;
- crea revisiones físicas;
- asigna empleados, sedes, áreas o roles;
- cambia los conteos 54/19/39;
- reclasifica permisos;
- registra check-in o check-out;
- cierra sesiones residuales;
- corrige solapamientos;
- implementa `AccessContext` o `AuthorizationDecision`;
- crea tablas, columnas, constraints, funciones, RPC, RLS o triggers;
- ejecuta migraciones, DDL, DML o backfills;
- crea datos de prueba productivos;
- modifica aplicaciones;
- despliega código;
- escribe en GitHub;
- inicia `AUTH-ERR-011`;
- ejecuta pruebas operativas.

---

#### 39. Criterios de aceptación

1. `AUTH_OUTSIDE_SHIFT_WINDOW` es el único código público de la tarea.
2. `OUTSIDE_PUBLISHED_SHIFT_WINDOW` es el estado público.
3. La razón pertenece a autorización contextual, no autenticación.
4. La sesión permanece válida.
5. La respuesta no navegacional usa `403`.
6. La decisión es `DENY`, `executable=false` y cero efectos.
7. Existe exactamente una publicación laboral autoritativa antes de evaluar
   esta razón.
8. La ausencia de publicación conserva `AUTH-ERR-009`.
9. Un borrador conserva `AUTH-ERR-009`.
10. Una cancelación o retiro conserva `AUTH-ERR-009`.
11. La temporalidad usa `resolved_at` de servidor.
12. `starts_at` y `ends_at` son timestamps absolutos.
13. La zona actual es `America/Bogota`.
14. La ventana es `[starts_at, ends_at)`.
15. Exactamente en `starts_at` el turno está vigente.
16. Exactamente en `ends_at` el turno no está vigente.
17. No existen tolerancias implícitas.
18. La causa antes del inicio es `PUBLISHED_SHIFT_NOT_STARTED`.
19. La causa desde el fin es `PUBLISHED_SHIFT_ENDED`.
20. Las causas internas no se muestran públicamente.
21. El copy no revela horario.
22. Los turnos nocturnos terminan al día siguiente.
23. No se filtra exclusivamente `shift_date = hoy`.
24. Una duración o zona inválida conserva `AUTH-ERR-017`.
25. Dos candidatos vigentes conservan `AUTH-ERR-017`.
26. Un fallo de fuente conserva `AUTH-ERR-019`.
27. `status = scheduled` no extiende la ventana.
28. El check-in no extiende `ends_at`.
29. Un check-in residual no permite operar.
30. Una ventana vigente precede a la evaluación de check-in.
31. Una ventana no vigente precede a `AUTH-ERR-011`.
32. Los 54 permisos sin carril operativo no se bloquean por temporalidad.
33. Los 58 permisos con carril operativo exigen ventana vigente.
34. Los 19 carriles `T` no exigen check-in propio.
35. Los 39 carriles `T+C` evalúan check-in después de la ventana.
36. `BASE_ONLY` no usa esta razón.
37. `BASE_OR_OPERATIONAL` conserva independencia entre carriles.
38. `BASE_AND_OPERATIONAL` conserva el requisito operativo.
39. El actor cliente no recibe turno laboral.
40. El proceso autónomo no recibe turno laboral.
41. El dispositivo no presta turno ni tiempo.
42. La simulación no modifica la ventana real.
43. El cliente no elige el turno ni los timestamps.
44. No existe reintento automático.
45. Una corrección exige solicitud nueva.
46. Toda mutación revalida inmediatamente antes del efecto.
47. Cachés expiran o se invalidan en fronteras temporales.
48. Realtime retira entrega después del fin.
49. Los diez canales poseen respuesta explícita.
50. Las diez aplicaciones poseen decisión explícita.
51. La UI usa el copy exacto y es accesible.
52. La UI permite revisar únicamente la programación propia autorizada.
53. El snapshot registra 2844 turnos.
54. El snapshot registra 141 publicaciones laborales futuras.
55. El snapshot registra 2177 publicaciones laborales finalizadas.
56. El snapshot registra cero publicaciones vigentes en el instante observado.
57. El snapshot registra cero turnos nocturnos físicos.
58. El snapshot registra 10 funciones que referencian `employee_shifts`.
59. El snapshot registra 5 funciones que referencian `published_at`.
60. El snapshot registra una función que emite `out_of_shift`.
61. El snapshot registra una política activa, únicamente `nexo:true:true`.
62. Las catorce brechas tienen propietario y condición de salida.
63. Se generan `TREQ-AUTH-219` a `TREQ-AUTH-228`.
64. Las 6616 filas históricas del registro se conservan sin modificación.
65. No se modifica código, Supabase, datos ni repositorios remotos.
66. `AUTH-ERR-011` permanece reservada.

---

#### 40. Cierre de tarea y continuidad

| Continuidad               | Tarea          | Estado      |
| ------------------------- | -------------- | ----------- |
| ÚLTIMA TAREA APROBADA     | `AUTH-ERR-009` | APROBADA    |
| TAREA ACTUAL APROBADA     | `AUTH-ERR-010` | APROBADA    |
| SIGUIENTE TAREA RESERVADA | `AUTH-ERR-011` | NO INICIADA |

```text
ÚLTIMA TAREA APROBADA
AUTH-ERR-009 — APROBADA
        ↓
TAREA ACTUAL APROBADA
AUTH-ERR-010 — APROBADA
        ↓
SIGUIENTE TAREA RESERVADA
AUTH-ERR-011 — RESERVADA
```

No se inicia ni modifica `AUTH-ERR-011` en esta tarea.


### ✅ AUTH-ERR-011 — Check-in requerido

**Estado:** APROBADA
**Tarea anterior:** `AUTH-ERR-010 — Fuera de turno` — APROBADA
**Tarea siguiente:** `AUTH-ERR-012 — Rol operativo faltante` — RESERVADA
**Tipo de tarea:** documental; definición contractual, funcional, causal, de seguridad y experiencia del bloqueo producido cuando una capacidad operativa exige check-in activo, existe un turno laboral publicado y vigente inequívoco, pero no existe una sesión de check-in autoritativa, abierta y compatible
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/S_MENSAJES_BLOQUEO/02_TURNO_ROL_DISPOSITIVO_Y_SIMULACION.md`
**Artefactos producidos:** `CHECKIN-REQUIRED-BLOCKING-CONTRACT-001`, `CHECKIN-STATE-DECISION-MATRIX-001`, `CHECKIN-CHANNEL-RESPONSE-MATRIX-001`, `CHECKIN-APPLICATION-COVERAGE-REGISTER-001` y `CHECKIN-PHYSICAL-RECONCILIATION-001`
**Decisiones consumidas:** `ADR-AUTH-001`; `AUTH-MOD-001` a `AUTH-MOD-004`; `AUTH-MOD-007` a `AUTH-MOD-011`; `AUTH-MOD-018`; `AUTH-MOD-019`; `AUTH-CAT-006`; `AUTH-CAT-012` a `AUTH-CAT-015`; `AUTH-CTX-001`; `AUTH-CTX-002`; `AUTH-CTX-009` a `AUTH-CTX-017`; `AUTH-CTX-020`; `AUTH-CTX-024` a `AUTH-CTX-030`; `AUTH-ERR-001` a `AUTH-ERR-010`; contratos vigentes de identidad, aplicación, territorio, publicación, temporalidad, turno, check-in, rol, permiso, recurso, disponibilidad y precedencia; estado remoto y desplegado inspeccionado; contrato documental vigente
**Cambios físicos autorizados:** ninguno; no modifica código, Supabase, Auth, RLS, RPC, Edge Functions, datos, migraciones, constraints, índices, triggers, eventos de asistencia, turnos, empleados, sedes, áreas, roles, permisos, aplicaciones ni despliegues

---

#### 1. Propósito

Definir de forma única, segura y verificable qué debe ocurrir cuando una
solicitud ya superó autenticación, actividad de identidad, acceso a la
aplicación, publicación y vigencia temporal del turno; el carril operativo de
la capacidad exige expresamente `T+C`; y el servidor no puede resolver una
sesión de check-in abierta, confirmada y exactamente compatible con el actor,
la sede y el turno vigentes.

La regla raíz queda:

```text
SESIÓN AUTENTICADA VÁLIDA
+
IDENTIDAD LABORAL ACTIVA
+
ACCESO A LA APLICACIÓN PERMITIDO
+
CAPACIDAD CUYO CARRIL OPERATIVO EXIGE T+C
+
UN TURNO LABORAL PUBLICADO Y VIGENTE INEQUÍVOCO
+
CHECKIN_RESOLUTION = CONCLUSIVE_ABSENT
→
DENY
+
AUTH_CHECKIN_REQUIRED
+
403
+
CERO EFECTOS
```

La tarea responde exclusivamente:

```text
¿LA OPERACIÓN EXIGE CHECK-IN ACTIVO Y,
DESPUÉS DE RESOLVER UN TURNO VIGENTE,
NO EXISTE UNA SESIÓN ABIERTA Y COMPATIBLE
CONFIRMADA POR LA FUENTE AUTORITATIVA?
```

No responde:

```text
¿EXISTE SESIÓN DE AUTENTICACIÓN?
¿EL USUARIO O EMPLEADO ESTÁ ACTIVO?
¿PUEDE ENTRAR A LA APLICACIÓN?
¿EXISTE UN TURNO PUBLICADO?
¿EL TURNO ESTÁ DENTRO DE SU VENTANA?
¿EXISTE UN CHECK-OUT PENDIENTE O CONTRADICTORIO?
¿EL ROL OPERATIVO ES SUFICIENTE?
¿EL DISPOSITIVO ES CONFIABLE?
¿EL PERMISO EXACTO ESTÁ CONCEDIDO?
¿EL RECURSO ESTÁ DENTRO DEL SCOPE?
¿LA FUENTE TÉCNICA ESTÁ DISPONIBLE?
```

La ausencia de publicación pertenece a `AUTH-ERR-009`. La publicación fuera de
ventana pertenece a `AUTH-ERR-010`. La ausencia limpia y concluyente de
check-in para un carril `T+C` pertenece a `AUTH-ERR-011`. Un historial abierto,
duplicado, cruzado o contradictorio que evidencie cierre incompleto pertenece a
`AUTH-ERR-012` o a la razón técnica o de configuración que corresponda.

---

#### 2. Resultado material

Se aprueban cinco artefactos documentales completos:

1. `CHECKIN-REQUIRED-BLOCKING-CONTRACT-001`, que congela identidad pública,
   precondiciones, causas internas, respuesta, recuperación, privacidad y
   auditoría;
2. `CHECKIN-STATE-DECISION-MATRIX-001`, que decide veinticuatro escenarios y
   separa ausencia, no obligatoriedad, cierre normal, conflicto, duplicidad,
   check-out incompleto, turno, rol, dispositivo y fallo técnico;
3. `CHECKIN-CHANNEL-RESPONSE-MATRIX-001`, que define el mismo resultado para
   diez canales de consumo;
4. `CHECKIN-APPLICATION-COVERAGE-REGISTER-001`, que fija una decisión explícita
   para las diez aplicaciones canónicas sin convertir la aplicación en unidad
   de autorización;
5. `CHECKIN-PHYSICAL-RECONCILIATION-001`, que contrasta el contrato objetivo con
   el esquema, RPC, políticas, índices, funciones y consumidor NEXO observados.

El resultado es especificación documental. No equivale a implementación ni a
evidencia de ejecución operativa.

---

#### 3. Identidad canónica del bloqueo

La identidad pública única es:

```text
reason_code = AUTH_CHECKIN_REQUIRED
```

| Propiedad                   | Valor                                                                     |
| --------------------------- | ------------------------------------------------------------------------- |
| Dominio                     | `AUTHORIZATION_CONTEXT`                                                   |
| Estado público              | `MISSING_REQUIRED_ACTIVE_CHECKIN`                                         |
| Decisión                    | `DENY`                                                                    |
| Estado HTTP no navegacional | `403`                                                                     |
| `executable`                | `false`                                                                   |
| Sesión de autenticación     | se conserva                                                               |
| Efectos empresariales       | cero                                                                      |
| Reintento automático        | prohibido                                                                 |
| Recuperación principal      | completar check-in por un flujo autorizado y solicitar una decisión nueva |
| Copy principal              | `Registra tu entrada para continuar con esta operación.`                  |
| Causas internas públicas    | ninguna                                                                   |

Quedan prohibidos como códigos públicos alternativos:

- `active_checkin_required`;
- `checkin_required`;
- `checked_in_now_false`;
- `missing_attendance`;
- `not_clocked_in`;
- mensajes libres usados como identidad contractual.

Las formas legacy podrán existir durante transición exclusivamente como aliases
internos observables. No podrán competir con `AUTH_CHECKIN_REQUIRED` en SDK,
clientes, eventos, métricas ni pruebas contractuales.

---

#### 4. Definición exacta de “check-in requerido”

La razón se produce únicamente cuando todas las condiciones siguientes son
verdaderas:

1. existe un actor efectivo de tipo empleado;
2. la sesión de autenticación y la identidad laboral son válidas;
3. la aplicación solicitada es accesible;
4. la capacidad posee un carril operativo aplicable;
5. ese carril está clasificado `T+C`;
6. existe exactamente un turno laboral publicado aplicable;
7. ese turno está vigente en `resolved_at`;
8. la resolución del check-in terminó sin error ni ambigüedad;
9. no existe una sesión abierta que coincida exactamente con empleado, sede y
   turno;
10. ninguna razón de precedencia anterior ya deniega la solicitud.

Formalmente:

```text
REQUIRES_CHECKIN = true
AND ACTIVE_SHIFT = exactly_one
AND ACTIVE_CHECKIN_SESSION = null
AND CHECKIN_STATE = absent
AND CHECKIN_RESOLUTION = conclusive
→ AUTH_CHECKIN_REQUIRED
```

`active_checkin_session = null` por sí solo no basta. Antes se debe demostrar
que la operación exige check-in, que el turno vigente existe y que no hay
conflicto estructural ni indisponibilidad técnica.

---

#### 5. Condiciones que no pertenecen a esta razón

| Condición                                              | Resultado propietario                                    |
| ------------------------------------------------------ | -------------------------------------------------------- |
| la capacidad no tiene carril operativo                 | continuar por su carril aplicable; no usar esta razón    |
| carril operativo `T`                                   | continuar sin check-in si los demás controles se cumplen |
| `BASE_ONLY`                                            | no evaluar check-in                                      |
| `BASE_OR_OPERATIONAL` con carril base válido           | el carril base puede autorizar sin check-in              |
| no existe turno publicado                              | `AUTH-ERR-009`                                           |
| el turno publicado aún no inicia o ya terminó          | `AUTH-ERR-010`                                           |
| dos turnos vigentes o turno inválido                   | `AUTH-ERR-017`                                           |
| check-in de otro actor, sede o turno                   | conflicto estructural; no convertir en ausencia limpia   |
| dos o más sesiones abiertas                            | conflicto o check-out incompleto; no escoger una         |
| sesión residual de jornada anterior                    | `AUTH-ERR-012` o razón técnica según el hecho            |
| no se puede consultar la fuente                        | `AUTH-ERR-019`                                           |
| check-out normal ya registrado y nueva operación `T+C` | esta razón; la sesión anterior está cerrada              |
| falta rol operativo                                    | `AUTH-ERR-013`                                           |
| dispositivo no confiable                               | `AUTH-ERR-014`                                           |
| dispositivo compartido obligatorio                     | `AUTH-ERR-015`                                           |
| simulación no permitida                                | `AUTH-ERR-016`                                           |
| permiso denegado                                       | razón de permiso correspondiente                         |

Una causa posterior no deberá ocultar una causa estructural anterior ya
concluyente.

---

#### 6. Contrato de sesión activa consumido

La sesión de check-in autoritativa se define como:

```text
active_checkin_session =
  resolved_open_attendance_session(
    actor_effective.employee_id,
    current_site_id,
    active_shift.shift_id,
    resolved_at
  )
```

Para ser válida deberá probar simultáneamente:

```text
employee_id = actor_effective.employee_id
AND site_id = current_site_id
AND shift_id = active_shift.shift_id
AND check_in_confirmed_by_server = true
AND session_is_open = true
AND session_is_unique = true
AND references_are_consistent = true
```

La sesión activa no es:

- cualquier evento reciente de entrada;
- el último evento del empleado sin contexto;
- una solicitud offline pendiente;
- un estado visual del cliente;
- un booleano persistido sin identidad de sesión;
- la existencia de turno;
- la actividad general del empleado;
- un evento de dispositivo;
- una inferencia desde sede seleccionada;
- una sesión cerrada.

---

#### 7. Fuente autoritativa y fuentes derivadas

La fuente canónica aprobada para asistencia es `attendance_logs`. Su forma
física actual es un ledger de eventos `check_in` y `check_out`; por tanto, la
implementación objetivo deberá producir una resolución determinista de sesión
abierta sin elevar vistas o agregados a fuente de autorización.

| Fuente                           | Uso permitido                            | Uso prohibido                                    |
| -------------------------------- | ---------------------------------------- | ------------------------------------------------ |
| `attendance_logs`                | hechos autoritativos de entrada y salida | escoger una sesión incompatible por conveniencia |
| `employee_attendance_status`     | proyección de estado                     | autorizar sin reconciliar ledger                 |
| `attendance_shift_events`        | evidencia y auditoría                    | reemplazar la sesión abierta                     |
| `attendance_employee_stats_view` | analítica                                | autorización transaccional                       |
| `attendance_today_dashboard`     | visualización                            | decisión de permiso                              |
| `employee_shift_attendance`      | conciliación                             | fuente única de sesión activa                    |
| `shift_runtime_events`           | eventos operativos                       | probar presencia laboral                         |
| cliente, cookie o estado local   | UX transitoria                           | autoridad                                        |

Una proyección puede acelerar lectura, pero deberá ser verificable contra la
fuente autoritativa y conservar versión, frescura e identidad de contexto.

---

#### 8. Estados canónicos de check-in

| Estado                 | Significado                                                | Consecuencia para `T+C`                                |
| ---------------------- | ---------------------------------------------------------- | ------------------------------------------------------ |
| `NOT_REQUIRED`         | el carril elegido no exige check-in                        | no evaluar esta razón                                  |
| `ACTIVE`               | existe exactamente una sesión compatible y abierta         | continuar                                              |
| `ABSENT`               | resolución concluyente sin sesión compatible abierta       | `AUTH_CHECKIN_REQUIRED`                                |
| `CLOSED`               | hubo sesión, pero está cerrada de forma consistente        | `AUTH_CHECKIN_REQUIRED` para una nueva operación `T+C` |
| `PENDING_CONFIRMATION` | el cliente todavía no posee confirmación autoritativa      | tratar como ausencia; no ejecutar                      |
| `INCONSISTENT`         | referencias cruzadas, duplicidad o historia contradictoria | no usar esta razón; fallar cerrado                     |
| `UNAVAILABLE`          | la fuente no pudo resolverse                               | `AUTH-ERR-019`                                         |

`CLOSED` no significa check-out incompleto. Un cierre correcto termina la
sesión. `AUTH-ERR-012` se reserva para ausencia de cierre esperado,
solapamiento, sesión residual o contradicción material.

---

#### 9. Causas internas admitidas

Esta tarea admite tres causas internas para una ausencia concluyente:

| Causa interna                           | Condición                                                                               |
| --------------------------------------- | --------------------------------------------------------------------------------------- |
| `REQUIRED_CHECKIN_NOT_FOUND`            | no existe evento o sesión abierta compatible                                            |
| `REQUIRED_CHECKIN_CLOSED`               | la sesión compatible anterior fue cerrada correctamente                                 |
| `REQUIRED_CHECKIN_NOT_SERVER_CONFIRMED` | existe intención local, importación o solicitud pendiente sin confirmación autoritativa |

Las tres producen públicamente:

```text
AUTH_CHECKIN_REQUIRED
```

No son causas internas de esta tarea:

- `CHECKIN_ACTOR_MISMATCH`;
- `CHECKIN_SITE_MISMATCH`;
- `CHECKIN_SHIFT_MISMATCH`;
- `MULTIPLE_ACTIVE_CHECKINS`;
- `RESIDUAL_OPEN_CHECKIN`;
- `CHECKOUT_INCOMPLETE`;
- `CHECKIN_SOURCE_UNAVAILABLE`.

Estas condiciones exigen otro propietario y nunca deberán degradarse a
`REQUIRED_CHECKIN_NOT_FOUND`.

---

#### 10. `CHECKIN-REQUIRED-BLOCKING-CONTRACT-001`

```json
{
  "reason_code": "AUTH_CHECKIN_REQUIRED",
  "domain": "AUTHORIZATION_CONTEXT",
  "public_state": "MISSING_REQUIRED_ACTIVE_CHECKIN",
  "decision": "DENY",
  "http_status": 403,
  "executable": false,
  "session_action": "PRESERVE",
  "retry": "USER_ACTION_THEN_NEW_REQUEST",
  "recovery_action": "START_AUTHORIZED_CHECKIN",
  "public_message": "Registra tu entrada para continuar con esta operación.",
  "required_facts": {
    "requires_checkin": true,
    "active_shift": "EXACTLY_ONE",
    "checkin_state": "ABSENT_OR_CLOSED",
    "resolution": "CONCLUSIVE"
  },
  "effects": {
    "business_write": false,
    "event_emit": false,
    "job_enqueue": false,
    "realtime_delivery": false,
    "offline_commit": false
  }
}
```

El envelope público podrá añadir `request_id`, `correlation_id`,
`context_version` y una acción de recuperación estable. No deberá exponer
identificadores laborales, horario, sede, área, turno, sesión de asistencia,
método de marcación ni causas internas.

---

#### 11. Dependencia por permiso y carril

La unidad de decisión es la capacidad y el carril, no la aplicación completa.
La distribución canónica se conserva:

| Grupo                         | Cantidad | Check-in                       |
| ----------------------------- | -------: | ------------------------------ |
| permisos sin carril operativo |       54 | no aplica                      |
| carriles operativos `T`       |       19 | no requerido                   |
| carriles operativos `T+C`     |       39 | requerido                      |
| total de permisos canónicos   |      112 | decisión explícita por permiso |

La ausencia de check-in solo puede bloquear los 39 carriles `T+C` cuando sean
el carril necesario para autorizar la solicitud.

Una política por aplicación no sustituye esta matriz. `requires_checkin=true`
a nivel de aplicación puede ser un límite transitorio más restrictivo, pero no
puede convertirse en la clasificación canónica de cada permiso.

---

#### 12. Modalidades de autorización

| Modalidad                    | Regla ante ausencia de check-in                               |
| ---------------------------- | ------------------------------------------------------------- |
| `BASE_ONLY`                  | no evalúa esta razón                                          |
| `OPERATIONAL_ONLY` con `T`   | continúa sin check-in                                         |
| `OPERATIONAL_ONLY` con `T+C` | deniega con esta razón                                        |
| `BASE_OR_OPERATIONAL`        | evalúa carriles por separado; una base válida puede autorizar |
| `BASE_AND_OPERATIONAL`       | el carril operativo `T+C` es obligatorio; deniega             |

Queda prohibido:

- bloquear indiscriminadamente una aplicación por no existir check-in;
- convertir `T` en `T+C` desde un adapter local;
- permitir `T+C` porque el actor posee una concesión base no suficiente;
- usar el nombre del rol como bypass;
- usar propietario o gerente general como bypass implícito;
- usar dispositivo, sede seleccionada o simulación para fabricar presencia.

---

#### 13. Precedencia dentro del árbol de bloqueo

La precedencia aplicable queda:

```text
AUTENTICACIÓN
→ IDENTIDAD ACTIVA
→ ACCESO A APLICACIÓN
→ PUBLICACIÓN DE TURNO
→ VIGENCIA TEMPORAL
→ NECESIDAD DE CHECK-IN POR PERMISO Y CARRIL
→ RESOLUCIÓN DE SESIÓN ABIERTA
→ ROL OPERATIVO
→ TERRITORIO Y ÁREA
→ DISPOSITIVO
→ PERMISO, SCOPE Y RECURSO
→ DECISIÓN
```

| Hecho                                             | Primera razón concluyente      |
| ------------------------------------------------- | ------------------------------ |
| no hay publicación aplicable                      | `AUTH-ERR-009`                 |
| publicación antes del inicio o desde el fin       | `AUTH-ERR-010`                 |
| turno vigente, carril `T`, sin check-in           | ninguna; continuar             |
| turno vigente, carril `T+C`, ausencia concluyente | `AUTH_CHECKIN_REQUIRED`        |
| turno vigente, check-in residual o contradictorio | `AUTH-ERR-012` o razón técnica |
| turno y check-in válidos, rol insuficiente        | `AUTH-ERR-013`                 |
| contexto válido, fuente indisponible              | `AUTH-ERR-019`                 |

La evaluación de check-in nunca selecciona el turno. Consume el turno ya
resuelto por la etapa anterior.

---

#### 14. Check-in pendiente, offline e importado

Una intención de check-in no es una sesión activa.

```text
SOLICITUD LOCAL
≠ ACEPTACIÓN DEL SERVIDOR
≠ SESIÓN ACTIVA
```

Reglas:

1. una solicitud offline pendiente no permite ejecutar `T+C`;
2. la cola puede conservar el intento de asistencia, pero no la mutación
   empresarial dependiente;
3. al recibir confirmación se deberá resolver nuevamente turno, sede, sesión,
   rol y permiso;
4. una importación deberá alcanzar estado autoritativo y referencias válidas;
5. un replay no podrá crear sesiones abiertas duplicadas;
6. `client_event_id` podrá proteger idempotencia del evento, pero no demuestra
   por sí solo una sesión activa compatible;
7. una respuesta tardía no revive una decisión empresarial anterior.

---

#### 15. Relación con check-out

| Situación                                       | Resultado                                                    |
| ----------------------------------------------- | ------------------------------------------------------------ |
| check-in abierto compatible                     | continuar                                                    |
| check-out normal posterior                      | sesión cerrada; una nueva operación `T+C` produce esta razón |
| check-out pendiente pero sesión todavía abierta | analizar contrato de cierre y `AUTH-ERR-012`                 |
| sesión abierta de jornada anterior              | `AUTH-ERR-012` o configuración inválida                      |
| varios check-in sin cierre                      | `AUTH-ERR-012` o inconsistencia técnica                      |
| check-out sin entrada relacionada               | inconsistencia; no esta razón                                |
| turno ya finalizado con sesión abierta          | `AUTH-ERR-010` precede; además se audita cierre incompleto   |

`AUTH-ERR-011` no corrige, cierra ni reconstruye asistencia. Solo deniega una
operación que requiere presencia confirmada y no la posee de forma limpia.

---

#### 16. Actor efectivo, dispositivo y simulación

La sesión debe pertenecer al actor efectivo real evaluado.

- un dispositivo compartido no presta el check-in del actor anterior;
- la sede fija del dispositivo no crea presencia;
- el área permitida del dispositivo no sustituye el turno;
- una sesión del actor real no se reasigna automáticamente al actor simulado;
- la simulación no crea check-in real;
- una cuenta de servicio o proceso autónomo no recibe asistencia humana
  sintética;
- PASS cliente permanece separado del contexto laboral;
- `checked_in_now=true` enviado por cliente es dato no confiable.

Cuando cambia actor, sede, turno, dispositivo vinculante o versión de contexto,
la sesión deberá resolverse nuevamente.

---

#### 17. Entradas mínimas y resultado determinista

Entradas mínimas:

| Entrada                          | Requisito                              |
| -------------------------------- | -------------------------------------- |
| `actor_effective.employee_id`    | no nulo y activo                       |
| `permission_code`                | canónico                               |
| `authorization_lane`             | resuelto por modalidad                 |
| `requires_checkin`               | derivado del catálogo del permiso      |
| `active_shift.shift_id`          | exactamente uno y vigente              |
| `current_site_id`                | derivado del turno y territorio válido |
| `resolved_at`                    | servidor                               |
| `context_version`                | presente                               |
| ledger o proyección autoritativa | disponible y fresca                    |

Resultado determinista:

```text
same canonical inputs
+
same authoritative attendance state
+
same context_version
→ same decision
```

El orden físico de filas, el último registro encontrado o el caché del cliente
no podrán alterar la decisión.

---

#### 18. `CHECKIN-STATE-DECISION-MATRIX-001`

|    # | Escenario                                                          | Resultado                                       |
| ---: | ------------------------------------------------------------------ | ----------------------------------------------- |
|    1 | `BASE_ONLY`, sin check-in                                          | continuar                                       |
|    2 | `OPERATIONAL_ONLY/T`, turno vigente, sin check-in                  | continuar                                       |
|    3 | `OPERATIONAL_ONLY/T+C`, turno vigente, sin eventos                 | esta razón                                      |
|    4 | `T+C`, sesión compatible cerrada normalmente                       | esta razón                                      |
|    5 | `T+C`, solicitud local pendiente                                   | esta razón; cero efectos                        |
|    6 | `T+C`, importación no confirmada                                   | esta razón                                      |
|    7 | `T+C`, exactamente una sesión compatible abierta                   | continuar                                       |
|    8 | `BASE_OR_OPERATIONAL`, base válida, operativo sin check-in         | autorizar solo por base                         |
|    9 | `BASE_OR_OPERATIONAL`, base inválida, operativo `T+C` sin check-in | esta razón                                      |
|   10 | `BASE_AND_OPERATIONAL`, base válida, sin check-in                  | esta razón                                      |
|   11 | sin publicación                                                    | `AUTH-ERR-009`                                  |
|   12 | publicación fuera de ventana                                       | `AUTH-ERR-010`                                  |
|   13 | dos turnos vigentes                                                | `AUTH-ERR-017`                                  |
|   14 | sesión abierta de otro actor                                       | conflicto; no esta razón                        |
|   15 | sesión abierta de otra sede                                        | conflicto; no esta razón                        |
|   16 | sesión abierta de otro turno                                       | conflicto; no esta razón                        |
|   17 | dos sesiones abiertas compatibles                                  | `AUTH-ERR-012` o inconsistencia                 |
|   18 | sesión residual de jornada anterior                                | `AUTH-ERR-012`                                  |
|   19 | check-out sin entrada correlacionable                              | inconsistencia                                  |
|   20 | fuente de asistencia indisponible                                  | `AUTH-ERR-019`                                  |
|   21 | turno finaliza después del check-in                                | `AUTH-ERR-010`; el check-in no extiende ventana |
|   22 | cambio de sede o turno                                             | invalidar y resolver de nuevo                   |
|   23 | dispositivo compartido conserva sesión del actor anterior          | denegar por conflicto; nunca reutilizar         |
|   24 | operación repetida después de check-in confirmado                  | nueva decisión; no replay de la anterior        |

La matriz contiene exactamente veinticuatro decisiones y no deja escenarios
sin propietario.

---

#### 19. Regla de cero efectos

Cuando se produce esta razón, quedan prohibidos antes de una autorización
nueva:

- inserts, updates o deletes empresariales;
- transiciones de estado;
- reservas o descuentos de inventario;
- impresión, despacho, recepción o preparación;
- emisión de eventos empresariales;
- jobs y colas;
- notificaciones derivadas de la operación;
- publicación Realtime de datos protegidos;
- confirmación de comandos offline;
- creación automática del check-in;
- selección automática de turno;
- corrección automática de asistencia.

La propia operación autorizada de registrar entrada pertenece al dominio de
asistencia y deberá poder ejecutarse sin exigir el check-in que intenta crear.

---

#### 20. Envelope público

Respuesta JSON mínima:

```json
{
  "ok": false,
  "decision": "DENY",
  "reason_code": "AUTH_CHECKIN_REQUIRED",
  "state": "MISSING_REQUIRED_ACTIVE_CHECKIN",
  "message": "Registra tu entrada para continuar con esta operación.",
  "executable": false,
  "recovery": {
    "action": "START_AUTHORIZED_CHECKIN"
  }
}
```

Una navegación protegida podrá adaptar la presentación, pero deberá conservar
el mismo código, estado, decisión y ausencia de efectos. No se devolverá un
redirect opaco como sustituto del contrato.

---

#### 21. Copy canónico

**Título:** `Check-in requerido`

**Mensaje principal:**

```text
Registra tu entrada para continuar con esta operación.
```

**Acción primaria:**

```text
Registrar entrada
```

**Acción secundaria cuando exista una superficie autorizada:**

```text
Volver a una vista disponible
```

Quedan prohibidos:

- `No tienes asistencia`;
- `No estás trabajando`;
- `Tu jefe no te programó`;
- `No encontramos tu turno`;
- mostrar IDs, hora exacta, sede, área, rol o método de marcación;
- afirmar que el check-in falló cuando no existe evidencia de intento;
- cerrar sesión de autenticación;
- permitir continuar de todos modos.

---

#### 22. Recuperación

La recuperación segura es:

```text
DENY
→ MOSTRAR ACCIÓN DE CHECK-IN AUTORIZADA
→ REGISTRAR Y CONFIRMAR EN SERVIDOR
→ INVALIDAR CONTEXTO ANTERIOR
→ RESOLVER NUEVO CONTEXTO
→ EVALUAR NUEVA SOLICITUD
```

No existe recuperación mediante:

- cambiar un booleano en cliente;
- reintentar la mutación automáticamente;
- seleccionar otro turno;
- usar la sede seleccionada;
- usar el check-in de otro dispositivo o actor;
- elevar rol;
- aplicar bypass por nombre;
- reusar una decisión anterior.

Si el actor no puede registrar entrada, el flujo podrá mostrar ayuda o ruta de
soporte autorizada sin revelar información laboral adicional ni alterar la
decisión.

---

#### 23. `CHECKIN-CHANNEL-RESPONSE-MATRIX-001`

| Canal                    | Respuesta exigida                               | Cero efectos | Recuperación                     |
| ------------------------ | ----------------------------------------------- | ------------ | -------------------------------- |
| navegación y páginas     | vista accesible con código estable              | sí           | abrir flujo autorizado           |
| Server Actions           | resultado tipado; no lanzar HTML genérico       | sí           | acción del cliente               |
| Route Handlers           | JSON `403`                                      | sí           | nueva solicitud                  |
| RSC y fetch              | estado serializable y no cacheado indebidamente | sí           | revalidar contexto               |
| RPC y PostgREST          | denegación estructurada                         | sí           | no reintento automático          |
| RLS y Data API           | fail closed y correlación observable            | sí           | resolver por servicio autorizado |
| Edge Functions           | envelope equivalente                            | sí           | nueva evaluación                 |
| Realtime                 | no entregar payload protegido                   | sí           | resuscribir tras nuevo contexto  |
| clientes nativos         | código estable, no solo copy                    | sí           | check-in y refresh               |
| dispositivos compartidos | limpiar contexto del actor anterior             | sí           | identificar actor y marcar       |

Los diez canales deberán mapear aliases legacy únicamente en una capa de
compatibilidad temporal y emitir telemetría de deprecación.

---

#### 24. Navegación, accesibilidad y privacidad

La experiencia deberá:

- conservar foco y ruta cuando sea seguro;
- anunciar título, motivo y acción con lector de pantalla;
- permitir teclado completo;
- conservar contraste y zoom;
- no depender solo de color;
- impedir doble envío de la operación bloqueada;
- no revelar presencia, ausencia o horario de otros empleados;
- no mostrar identificadores de asistencia;
- no exponer el método de check-in;
- no listar turnos candidatos;
- no ofrecer acciones que el actor no puede ejecutar.

La acción `Registrar entrada` deberá aparecer solo cuando el actor y la
superficie puedan iniciar el flujo autorizado. De lo contrario, se mostrará
una ruta de ayuda o retorno segura.

---

#### 25. Reintentos, idempotencia y concurrencia

1. la mutación bloqueada no se reintenta automáticamente;
2. el evento de check-in puede usar una clave idempotente independiente;
3. dos intentos concurrentes de check-in no podrán producir dos sesiones
   abiertas;
4. la confirmación del check-in no autoriza una mutación ya rechazada;
5. una nueva operación deberá usar un `context_version` posterior;
6. cada efecto revalida inmediatamente antes del commit;
7. una salida concurrente invalida la sesión antes de operaciones posteriores;
8. una llegada tardía offline no desplaza una sesión vigente sin reconciliación;
9. Realtime no sustituye una lectura autoritativa;
10. una sesión cerrada entre evaluación y efecto deberá causar fail closed.

---

#### 26. Frescura e invalidación

La sesión deberá invalidarse o re-resolverse ante:

- check-out confirmado;
- cambio de turno;
- fin de turno;
- cambio de sede o área operativa;
- desactivación del empleado;
- cancelación o retiro de publicación;
- cambio de política del permiso;
- cambio de actor efectivo;
- cambio de dispositivo vinculante;
- cambio de versión de contexto;
- detección de duplicidad o contradicción;
- revocación de sesión de asistencia.

Un TTL por sí solo no es suficiente para mutaciones. La validación final deberá
leer una versión autoritativa compatible.

---

#### 27. Auditoría

La auditoría interna podrá registrar:

- `request_id` y `correlation_id`;
- actor real y actor efectivo;
- aplicación, permiso y carril;
- `requires_checkin`;
- identidad de turno y sesión únicamente en almacenamiento protegido;
- estado de resolución;
- causa interna;
- `context_version`;
- fuente y latencia;
- decisión y cero efectos;
- alias legacy observado;
- acción de recuperación ofrecida.

La telemetría pública no deberá contener IDs laborales ni datos de asistencia.
Los logs internos deberán respetar retención, acceso mínimo y trazabilidad.

---

#### 28. `CHECKIN-APPLICATION-COVERAGE-REGISTER-001`

| Aplicación | Decisión de cobertura                                                                                                                   |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| SHELL      | sus capacidades base no exigen check-in; distribuye contrato y contexto                                                                 |
| ANIMA      | asistencia y programación deben seguir disponibles para crear o cerrar la propia sesión; otras capacidades se evalúan por permiso       |
| AURA       | no se bloquea por nombre de aplicación; aplica únicamente si una capacidad futura posee carril `T+C`                                    |
| VISO       | capacidades administrativas base no exigen check-in; cualquier carril operativo se rige por catálogo                                    |
| NEXO       | posee política física activa que exige turno y check-in a nivel de aplicación; deberá migrar a decisión por permiso sin debilitar `T+C` |
| FOGO       | operaciones presenciales `T+C` deberán consumir el contrato compartido; entrada y referencias `T` no se bloquearán                      |
| ORIGO      | operaciones presenciales `T+C` deberán consumir el contrato compartido; administración base permanece independiente                     |
| PULSO      | mutaciones operativas `T+C` deberán consumir el contrato; sesión POS o dispositivo no crea check-in                                     |
| NUMERA     | sus carriles base y operativos se separan; no se impone check-in a capacidades base                                                     |
| PASS       | la sesión cliente no es check-in laboral y nunca satisface este contrato                                                                |

La tabla decide las diez aplicaciones sin inventar cobertura implementada. El
catálogo de 112 permisos sigue siendo la fuente de granularidad.

---

#### 29. Snapshot físico desplegado

Inspección de solo lectura en `vento-os-dev`:

| Métrica                                                    |          Resultado observado |
| ---------------------------------------------------------- | ---------------------------: |
| instante `America/Bogota`                                  | `2026-08-04 00:23:08.722637` |
| versión PostgreSQL                                         |                 `17.6.1.054` |
| eventos en `attendance_logs`                               |                         5132 |
| check-in abiertos inferidos por la lógica física observada |                            0 |
| contextos abiertos duplicados observados                   |                            0 |
| abiertos sin turno                                         |                            0 |
| abiertos sin sede                                          |                            0 |
| abiertos sin empleado resoluble                            |                            0 |
| abiertos con turno inexistente                             |                            0 |
| políticas de aplicación activas                            |                            1 |
| políticas activas que exigen check-in                      |                            1 |
| política activa                                            |        `nexo:true:true:true` |
| funciones que referencian `attendance_logs`                |                           13 |
| funciones que emiten `checkin_required`                    |                            1 |
| funciones que referencian `requires_checkin`               |                            1 |
| índices físicos sobre `attendance_logs`                    |                            8 |

El valor cero de sesiones abiertas describe únicamente el instante observado.
No prueba cobertura, corrección del modelo ni ausencia histórica de conflictos.

---

#### 30. Esquema físico observado

`attendance_logs` utiliza eventos independientes con:

- `action` limitado a `check_in` o `check_out`;
- FK de empleado con `ON DELETE CASCADE`;
- FK de turno con `ON DELETE SET NULL`;
- FK de sede con `ON DELETE RESTRICT`;
- `source` limitado a `mobile`, `web`, `kiosk` o `system`;
- índice idempotente único por `employee_id, client_event_id` cuando existe;
- índices temporales por empleado, sede y ocurrencia;
- ninguna restricción observada que garantice por sí sola exactamente una
  sesión abierta por empleado, sede y turno.

Las políticas RLS observadas permiten inserción propia desde fuentes
controladas y lectura propia o gerencial acotada. RLS protege acceso a filas,
pero no sustituye la resolución semántica de una sesión activa.

---

#### 31. Comportamiento físico observado

El RPC físico `get_operational_context`:

1. carga una política por `app_code` con `limit 1`;
2. resuelve un turno del día actual con `limit 1`;
3. infiere check-in abierto buscando el último `check_in` del empleado sin
   cualquier `check_out` posterior del mismo empleado;
4. no exige en esa selección la coincidencia simultánea con el turno y la sede
   ya resueltos;
5. no detecta multiplicidad antes de escoger una fila;
6. incluye la sede del check-in dentro de la cadena de `coalesce` territorial;
7. emite `checkin_required` cuando la política de aplicación lo exige y no
   encuentra el evento inferido;
8. contiene bypass explícito para `propietario` y `gerente_general`;
9. devuelve booleans y un arreglo de razones legacy, no el envelope público
   aprobado.

El consumidor NEXO:

- tipa los campos del RPC;
- transforma `checkin_required` en el mensaje `No puedes operar porque no tienes check-in activo.`;
- retorna un booleano para la comprobación del permiso;
- no conserva un contrato tipado compartido con el código público aprobado;
- aplica además una modificación de área y rol desde simulación local.

Estas observaciones son diagnóstico del estado actual, no aprobación de su
semántica.

---

#### 32. `CHECKIN-PHYSICAL-RECONCILIATION-001`

|    # | Brecha física                                                                 | Riesgo                                   | Propietario de cierre                              |
| ---: | ----------------------------------------------------------------------------- | ---------------------------------------- | -------------------------------------------------- |
|    1 | política activa solo para NEXO                                                | cobertura parcial                        | `AUTH-DB-031`; `SHELL-AUTH-005`                    |
|    2 | política a nivel de aplicación, no de permiso y carril                        | bloqueo excesivo o bypass                | `AUTH-DB-020`; `AUTH-DB-034`                       |
|    3 | búsqueda de check-in no exige `shift_id` coincidente                          | sesión prestada entre turnos             | `AUTH-DB-033`; `AUTH-DB-034`                       |
|    4 | búsqueda no exige `site_id` coincidente                                       | presencia prestada entre sedes           | `AUTH-DB-033`; `AUTH-DB-034`                       |
|    5 | `limit 1` oculta multiplicidad                                                | autorización arbitraria                  | `AUTH-DB-033`; `AUTH-ERR-012`                      |
|    6 | cualquier salida posterior del empleado cierra por inferencia eventos previos | correlación imprecisa                    | `AUTH-DB-033`; `AUTH-ERR-012`                      |
|    7 | ledger no materializa identidad explícita de sesión                           | ambigüedad de correlación                | `AUTH-DB-033`                                      |
|    8 | no existe unicidad física de sesión abierta                                   | duplicidad concurrente                   | `AUTH-DB-033`; `SHELL-CI-018`                      |
|    9 | FK de turno permite `SET NULL`                                                | historia no utilizable para autorización | `AUTH-DB-033`; tarea de integridad correspondiente |
|   10 | check-in participa en fallback de sede activa                                 | inversión de precedencia territorial     | `AUTH-DB-034`                                      |
|   11 | bypass físico por nombres de rol                                              | omisión de `T+C`                         | `AUTH-DB-034`; `SHELL-AUTH-004`                    |
|   12 | razones legacy no poseen envelope público                                     | divergencia contractual                  | `SHELL-AUTH-001`; `AUTH-ERR-020`                   |
|   13 | consumidor NEXO reduce permiso a booleano y copy local                        | pérdida de causa y trazabilidad          | `SHELL-AUTH-002`; `SHELL-AUTH-005`                 |
|   14 | no existe evidencia observada para las otras nueve aplicaciones               | cobertura no demostrada                  | `SHELL-AUTH-005`; `SHELL-CI-016`                   |

Cada brecha permanece pendiente de implementación o evidencia; ninguna se
corrige en esta tarea documental.

---

#### 33. Handoff de implementación

La implementación futura deberá distribuirse así:

- `AUTH-DB-020` y `AUTH-DB-031`: materializar la clasificación `N/T/T+C` y su
  paridad física;
- `AUTH-DB-033`: resolver turno y sesión de asistencia exactos, únicos y
  correlacionados;
- `AUTH-DB-034`: aplicar precedencia, modalidad, carril, check-in, rol, scope y
  recurso;
- `AUTH-DB-035`: invalidar contexto y cachés ante entrada, salida y cambios;
- `SHELL-AUTH-001`: publicar código, tipos, estado y envelope;
- `SHELL-AUTH-002`: adaptar navegación, acciones, API, RPC y clientes;
- `SHELL-AUTH-004`: prohibir aliases, bypass y decisiones locales divergentes;
- `SHELL-AUTH-005`: migrar las aplicaciones consumidoras;
- `AUTH-ERR-012`: definir cierre incompleto y conflictos residuales;
- `AUTH-ERR-017`, `AUTH-ERR-019` y `AUTH-ERR-020`: completar configuración,
  fallos técnicos, copy y distribución;
- `SHELL-CI-016`, `SHELL-CI-018` y `SHELL-CI-019`: ejecutar pruebas y conservar
  evidencia.

Toda migración futura de Supabase deberá crearse, versionarse, documentarse y
ejecutarse desde `vento-shell`.

---

#### 34. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

| ID              | Regla protegida                                                                                                                                                                       | Tipo                                   | Prioridad | Momento de implementación       | Destino                                                                                       |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------- | --------- | ------------------------------- | --------------------------------------------------------------------------------------------- |
| `TREQ-AUTH-229` | Un carril `T+C` con turno publicado y vigente, resolución concluyente y ausencia de sesión abierta compatible produce `AUTH_CHECKIN_REQUIRED`, `403`, deny y cero efectos.            | contractual + seguridad + contexto     | crítica   | evaluador unificado             | `AUTH-DB-034`; `SHELL-CI-016`                                                                 |
| `TREQ-AUTH-230` | La ausencia de check-in se aplica solo a 39 carriles `T+C`; 19 carriles `T` y 54 permisos sin carril operativo no se bloquean por esta razón.                                         | catálogo + contractual + regresión     | crítica   | catálogo físico y paridad       | `AUTH-DB-020`; `AUTH-DB-031`; `SHELL-CI-016`                                                  |
| `TREQ-AUTH-231` | Una sesión activa debe coincidir exactamente con actor, sede y turno, estar abierta, confirmada y ser única; cliente, evento reciente o `limit 1` no bastan.                          | base de datos + contexto + seguridad   | crítica   | resolver de asistencia          | `AUTH-DB-033`; `AUTH-DB-034`; `SHELL-CI-018`                                                  |
| `TREQ-AUTH-232` | Ausencia, cierre normal, intención pendiente, mismatch, multiplicidad, check-out incompleto e indisponibilidad conservan causas y propietarios distintos.                             | razones + integración + regresión      | crítica   | catálogo de razones y evaluador | `AUTH-ERR-012`; `AUTH-ERR-017`; `AUTH-ERR-019`; `AUTH-DB-034`                                 |
| `TREQ-AUTH-233` | Publicación y temporalidad preceden al check-in; rol, dispositivo y permiso se evalúan después de resolver una sesión requerida.                                                      | precedencia + autorización + seguridad | crítica   | evaluador unificado             | `AUTH-DB-034`; `SHELL-AUTH-004`; `SHELL-CI-016`                                               |
| `TREQ-AUTH-234` | Diez canales producen la misma razón, preservan sesión, mantienen cero efectos y exigen una solicitud nueva después del check-in.                                                     | integración + E2E + concurrencia       | crítica   | SDK, adapters e invalidación    | `SHELL-AUTH-002`; `SHELL-AUTH-005`; `AUTH-DB-035`; `SHELL-CI-018`                             |
| `TREQ-AUTH-235` | Las diez aplicaciones deciden por permiso y carril; ANIMA puede crear asistencia, PASS no presta sesión laboral y NEXO migra su política global sin debilitar `T+C`.                  | aplicación + identidad + contrato      | alta      | migración de consumidoras       | `SHELL-AUTH-005`; `SHELL-CI-016`                                                              |
| `TREQ-AUTH-236` | Copy, recuperación, privacidad y accesibilidad ofrecen check-in autorizado sin revelar horario, sede, turno, sesión, método ni causas internas.                                       | interfaz + privacidad + accesibilidad  | alta      | catálogo compartido de mensajes | `AUTH-ERR-020`; `SHELL-AUTH-005`; `SHELL-CI-016`                                              |
| `TREQ-AUTH-237` | Solicitudes offline, concurrencia y replay no crean autoridad ni sesiones duplicadas; la confirmación invalida contexto y obliga a una decisión nueva.                                | idempotencia + concurrencia + offline  | crítica   | ledger, invalidación y adapters | `AUTH-DB-033`; `AUTH-DB-035`; `SHELL-CI-018`; `SHELL-CI-019`                                  |
| `TREQ-AUTH-238` | La regresión reconcilia 5132 eventos, cero sesiones abiertas en el snapshot, una política NEXO, 13 funciones consumidoras, 8 índices y catorce brechas sin alterar datos productivos. | regresión + RPC + RLS + seguridad      | crítica   | gates y evidencia E5            | `AUTH-DB-031`; `AUTH-DB-033`; `AUTH-DB-034`; `SHELL-AUTH-004`; `SHELL-CI-016`; `SHELL-CI-018` |

---

#### 35. Validaciones documentales definidas

La implementación deberá probar, como mínimo:

1. `BASE_ONLY` sin check-in;
2. `OPERATIONAL_ONLY/T` sin check-in;
3. `OPERATIONAL_ONLY/T+C` sin eventos;
4. sesión compatible cerrada normalmente;
5. solicitud local pendiente;
6. evento importado no confirmado;
7. sesión compatible abierta;
8. `BASE_OR_OPERATIONAL` autorizado por base;
9. `BASE_OR_OPERATIONAL` dependiente de `T+C`;
10. `BASE_AND_OPERATIONAL` sin check-in;
11. ausencia de publicación conserva `AUTH-ERR-009`;
12. fuera de ventana conserva `AUTH-ERR-010`;
13. dos turnos conservan configuración inválida;
14. mismatch de actor;
15. mismatch de sede;
16. mismatch de turno;
17. dos sesiones abiertas;
18. sesión residual;
19. check-out huérfano;
20. fuente indisponible;
21. fin de turno con sesión abierta;
22. cambio de sede y turno;
23. dispositivo compartido con actor nuevo;
24. simulación sin check-in real;
25. actor cliente y proceso autónomo;
26. equivalencia de diez canales;
27. cero efectos y ausencia de replay;
28. invalidación al check-in y check-out;
29. copy, teclado, lector de pantalla, zoom y contraste;
30. reconciliación de las catorce brechas físicas.

---

#### 36. Evidencia y estados

| Elemento                                  | Estado                                                                  |
| ----------------------------------------- | ----------------------------------------------------------------------- |
| contrato documental                       | ESPECIFICADO                                                            |
| matriz de estados, canales y aplicaciones | ESPECIFICADO                                                            |
| snapshot de solo lectura                  | VALIDADO contra estado desplegado observado                             |
| código público compartido                 | PENDIENTE_DE_IMPLEMENTACIÓN — `SHELL-AUTH-001`; `AUTH-ERR-020`          |
| resolver único de sesión                  | PENDIENTE_DE_IMPLEMENTACIÓN — `AUTH-DB-033`                             |
| evaluador por permiso y carril            | PENDIENTE_DE_IMPLEMENTACIÓN — `AUTH-DB-034`                             |
| catálogo físico `N/T/T+C`                 | PENDIENTE_DE_IMPLEMENTACIÓN — `AUTH-DB-020`; `AUTH-DB-031`              |
| invalidación por entrada y salida         | PENDIENTE_DE_IMPLEMENTACIÓN — `AUTH-DB-035`                             |
| adapters de aplicaciones                  | PENDIENTE_DE_IMPLEMENTACIÓN — `SHELL-AUTH-002`; `SHELL-AUTH-005`        |
| evidencia de diez canales                 | PENDIENTE_DE_EVIDENCIA — `SHELL-CI-016`; `SHELL-CI-018`; `SHELL-CI-019` |
| evidencia de concurrencia y offline       | PENDIENTE_DE_EVIDENCIA — `SHELL-CI-018`; `SHELL-CI-019`                 |

El snapshot no demuestra que el contrato esté implementado. No se declara una
prueba satisfecha sin evidencia reproducible.

---

#### 37. Fuera del alcance

AUTH-ERR-011 no:

- registra check-in o check-out;
- crea, cierra o repara sesiones de asistencia;
- reconstruye correlaciones históricas;
- corrige eventos duplicados o huérfanos;
- modifica turnos, publicaciones, sedes, áreas o roles;
- cambia los conteos 54/19/39;
- reclasifica permisos;
- implementa `AccessContext` o `AuthorizationDecision`;
- crea tablas, columnas, constraints, índices, funciones, RPC, RLS o triggers;
- ejecuta migraciones, DDL, DML o backfills;
- crea datos de prueba productivos;
- modifica aplicaciones;
- despliega código;
- escribe en GitHub;
- inicia `AUTH-ERR-012`;
- ejecuta pruebas operativas.

---

#### 38. Criterios de aceptación

1. `AUTH_CHECKIN_REQUIRED` es el único código público de la tarea.
2. `MISSING_REQUIRED_ACTIVE_CHECKIN` es el estado público.
3. La razón pertenece a autorización contextual, no autenticación.
4. La sesión de autenticación permanece válida.
5. La respuesta no navegacional usa `403`.
6. La decisión es `DENY`, `executable=false` y cero efectos.
7. La capacidad y el carril se resuelven antes de evaluar check-in.
8. Solo los 39 carriles `T+C` pueden producir esta razón.
9. Los 19 carriles `T` no exigen check-in.
10. Los 54 permisos sin carril operativo no se bloquean.
11. Existe exactamente un turno publicado y vigente antes de esta razón.
12. Sin publicación permanece `AUTH-ERR-009`.
13. Fuera de ventana permanece `AUTH-ERR-010`.
14. La sesión activa coincide con actor, sede y turno.
15. La sesión está abierta y confirmada por servidor.
16. La sesión es única.
17. Una intención local no autoriza.
18. Un evento reciente no autoriza por sí solo.
19. Una sesión cerrada produce esta razón para una nueva operación `T+C`.
20. Un cierre normal no es check-out incompleto.
21. Un mismatch no se presenta como ausencia limpia.
22. La multiplicidad no se resuelve con `limit 1`.
23. Una sesión residual pertenece a `AUTH-ERR-012` o inconsistencia.
24. Una fuente indisponible conserva `AUTH-ERR-019`.
25. El check-in no selecciona turno.
26. El check-in no crea sede, área, rol, permiso ni scope.
27. Un dispositivo no presta check-in.
28. La simulación no crea asistencia real.
29. PASS cliente no satisface presencia laboral.
30. ANIMA puede ofrecer el flujo de asistencia sin exigir check-in previo.
31. `BASE_OR_OPERATIONAL` conserva independencia de carriles.
32. `BASE_AND_OPERATIONAL` conserva `T+C` obligatorio.
33. No existe bypass por nombre de rol.
34. El copy exacto es `Registra tu entrada para continuar con esta operación.`
35. El copy no revela horario ni identificadores.
36. La recuperación usa un flujo autorizado.
37. La operación bloqueada no se reintenta automáticamente.
38. La confirmación del check-in exige una decisión nueva.
39. Toda mutación revalida antes del efecto.
40. El check-out invalida la sesión.
41. Cambio de actor, sede o turno invalida contexto.
42. Los diez canales poseen respuesta explícita.
43. Las diez aplicaciones poseen decisión explícita.
44. La UI es accesible.
45. La auditoría interna minimiza datos.
46. El snapshot registra 5132 eventos.
47. El snapshot registra cero sesiones abiertas inferidas.
48. El snapshot registra una política activa NEXO.
49. El snapshot registra 13 funciones que referencian asistencia.
50. El snapshot registra una función que emite `checkin_required`.
51. El snapshot registra ocho índices sobre `attendance_logs`.
52. Las catorce brechas tienen propietario y condición de salida.
53. Se generan `TREQ-AUTH-229` a `TREQ-AUTH-238`.
54. Las 6626 filas históricas del registro se conservan sin modificación.
55. No se modifica código, Supabase, datos ni repositorios remotos.
56. `AUTH-ERR-012` permanece reservada.

---

#### 39. Riesgos controlados

| Riesgo                        | Control aprobado                            |
| ----------------------------- | ------------------------------------------- |
| bloqueo global por aplicación | decisión por permiso y carril               |
| check-in de otro turno        | coincidencia exacta de `shift_id`           |
| check-in de otra sede         | coincidencia exacta de `site_id`            |
| sesión del actor anterior     | coincidencia exacta de actor e invalidación |
| duplicidad                    | fail closed y propietario de conflicto      |
| replay offline                | idempotencia y decisión nueva               |
| bypass gerencial              | prohibición por nombre de rol               |
| filtración laboral            | envelope minimizado                         |
| efecto parcial                | gate antes del commit                       |
| razón genérica                | código público y causas internas separadas  |
| cobertura no demostrada       | estado pendiente y evidencia E5             |
| deriva entre aplicaciones     | SDK y gates compartidos                     |

---

#### 40. Cierre de tarea y continuidad

| Continuidad               | Tarea          | Estado      |
| ------------------------- | -------------- | ----------- |
| ÚLTIMA TAREA APROBADA     | `AUTH-ERR-010` | APROBADA    |
| TAREA ACTUAL APROBADA     | `AUTH-ERR-011` | APROBADA    |
| SIGUIENTE TAREA RESERVADA | `AUTH-ERR-012` | NO INICIADA |

```text
ÚLTIMA TAREA APROBADA
AUTH-ERR-010 — APROBADA
        ↓
TAREA ACTUAL APROBADA
AUTH-ERR-011 — APROBADA
        ↓
SIGUIENTE TAREA RESERVADA
AUTH-ERR-012 — RESERVADA
```

No se inicia ni modifica `AUTH-ERR-012` en esta tarea.


### ✅ AUTH-ERR-012 — Rol operativo faltante

**Estado:** APROBADA
**Tarea anterior:** `AUTH-ERR-011 — Check-in requerido` — APROBADA
**Tarea siguiente:** `AUTH-ERR-013 — Rol operativo inválido para la sede` — RESERVADA
**Tipo de tarea:** documental; definición contractual, funcional, causal, de seguridad y experiencia del bloqueo producido cuando una capacidad necesita carril operativo, existe un turno laboral publicado y vigente, los prerrequisitos anteriores aplicables fueron satisfechos y la revisión autoritativa del turno no contiene un rol operativo asignado
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/S_MENSAJES_BLOQUEO/02_TURNO_ROL_DISPOSITIVO_Y_SIMULACION.md`
**Artefactos producidos:** `OPERATIONAL-ROLE-REQUIRED-BLOCKING-CONTRACT-001`, `OPERATIONAL-ROLE-STATE-DECISION-MATRIX-001`, `OPERATIONAL-ROLE-CHANNEL-RESPONSE-MATRIX-001`, `OPERATIONAL-ROLE-APPLICATION-COVERAGE-REGISTER-001` y `OPERATIONAL-ROLE-PHYSICAL-RECONCILIATION-001`
**Decisiones consumidas:** `ADR-AUTH-001`; `AUTH-MOD-001` a `AUTH-MOD-006`; `AUTH-MOD-009`; `AUTH-MOD-010`; `AUTH-MOD-018`; `AUTH-MOD-019`; `AUTH-CAT-006`; `AUTH-CAT-007`; `AUTH-CAT-012` a `AUTH-CAT-015`; `AUTH-CTX-001`; `AUTH-CTX-002`; `AUTH-CTX-008` a `AUTH-CTX-017`; `AUTH-CTX-020`; `AUTH-CTX-024` a `AUTH-CTX-030`; `AUTH-ERR-001` a `AUTH-ERR-011`; contratos vigentes de identidad, aplicación, turno, check-in, rol base, rol operativo, territorio, permiso, recurso, disponibilidad, simulación y precedencia; estado remoto y desplegado inspeccionado; contrato documental vigente
**Cambios físicos autorizados:** ninguno; no modifica código, Supabase, Auth, RLS, RPC, Edge Functions, datos, migraciones, constraints, índices, triggers, turnos, catálogos, perfiles, matrices, sedes, áreas, roles, permisos, aplicaciones ni despliegues

---

#### 1. Propósito

Definir de forma única, segura y verificable qué debe ocurrir cuando una
solicitud necesita participar en el carril operativo, ya superó los controles
anteriores que le correspondan, consume exactamente un turno laboral publicado
y vigente, pero la revisión autoritativa de ese turno no contiene un código de
rol operativo asignado.

La regla raíz queda:

```text
SESIÓN AUTENTICADA VÁLIDA
+
IDENTIDAD LABORAL ACTIVA
+
ACCESO A LA APLICACIÓN PERMITIDO
+
CAPACIDAD CON CARRIL OPERATIVO APLICABLE
+
TURNO LABORAL PUBLICADO Y VIGENTE INEQUÍVOCO
+
CHECK-IN VÁLIDO CUANDO EL CARRIL EXIGE T+C
+
OPERATIONAL_ROLE_SOURCE = CONCLUSIVE_ABSENT
→
DENY DEL CARRIL OPERATIVO
+
AUTH_OPERATIONAL_ROLE_REQUIRED
+
403 CUANDO LA DECISIÓN FINAL QUEDA DENEGADA
+
CERO EFECTOS
```

La tarea responde exclusivamente:

```text
¿EL CARRIL OPERATIVO NECESITA UN ROL EFECTIVO Y
EL TURNO AUTORITATIVO VIGENTE CARECE DE UN CÓDIGO
DE ROL OPERATIVO ASIGNADO?
```

No responde:

```text
¿EXISTE SESIÓN DE AUTENTICACIÓN?
¿EL EMPLEADO ESTÁ ACTIVO?
¿PUEDE ACCEDER A LA APLICACIÓN?
¿EXISTE TURNO PUBLICADO?
¿EL TURNO ESTÁ VIGENTE?
¿EXISTE CHECK-IN CUANDO ES REQUERIDO?
¿EL CÓDIGO OBSERVADO EXISTE Y ESTÁ ACTIVO?
¿EL ROL ESTÁ HABILITADO EN LA SEDE?
¿EL ROL ES COMPATIBLE CON EL ÁREA?
¿EL ROL TIENE EL PERMISO EXACTO?
¿EL RECURSO ESTÁ DENTRO DEL SCOPE?
¿EL DISPOSITIVO ES CONFIABLE?
¿LA FUENTE TÉCNICA ESTÁ DISPONIBLE?
```

La ausencia limpia del código pertenece a `AUTH-ERR-012`. Un código presente
pero desconocido, inactivo, deprecado, contradictorio o no resoluble constituye
configuración inválida. Un rol canónico que no está habilitado en la sede
pertenece a `AUTH-ERR-013`. Un rol canónico que no es compatible con el área
pertenece a `AUTH-ERR-014`.

---

#### 2. Resultado material

Se aprueban cinco artefactos documentales completos:

1. `OPERATIONAL-ROLE-REQUIRED-BLOCKING-CONTRACT-001`, que congela la identidad
   pública, aplicabilidad, fuente autoritativa, respuesta, recuperación,
   privacidad, auditoría y cero efectos;
2. `OPERATIONAL-ROLE-STATE-DECISION-MATRIX-001`, que decide veinticuatro
   escenarios y separa ausencia limpia, código inválido, incompatibilidad
   territorial, falta de permiso, simulación e indisponibilidad;
3. `OPERATIONAL-ROLE-CHANNEL-RESPONSE-MATRIX-001`, que materializa diez canales
   con semántica equivalente;
4. `OPERATIONAL-ROLE-APPLICATION-COVERAGE-REGISTER-001`, que decide el alcance
   para las diez aplicaciones canónicas sin autorizar por nombre de
   aplicación;
5. `OPERATIONAL-ROLE-PHYSICAL-RECONCILIATION-001`, que registra el snapshot
   físico, las incompatibilidades observadas y catorce brechas con destino de
   implementación explícito.

Cobertura materializada:

| Elemento                                                     | Cantidad |
| ------------------------------------------------------------ | -------: |
| Código público canónico                                      |        1 |
| Estado HTTP no navegacional                                  | 1, `403` |
| Causas internas admitidas                                    |        3 |
| Escenarios con decisión explícita                            |       24 |
| Canales con respuesta explícita                              |       10 |
| Aplicaciones canónicas reconciliadas                         |       10 |
| Permisos canónicos evaluados por carril                      |      112 |
| Permisos sin carril operativo                                |       54 |
| Permisos con carril operativo                                |       58 |
| Carriles operativos `T`                                      |       19 |
| Carriles operativos `T+C`                                    |       39 |
| Roles operativos físicos observados                          |       13 |
| Roles físicos activos observados                             |       13 |
| Turnos físicos observados                                    |     2844 |
| Turnos laborales observados                                  |     2411 |
| Turnos de descanso observados                                |      433 |
| Turnos laborales publicados no cancelados                    |     2318 |
| Turnos laborales publicados no cancelados sin rol            |     1535 |
| Turnos laborales publicados no cancelados con rol            |      783 |
| Códigos de rol usados por esos turnos                        |       12 |
| Habilitaciones físicas sede/área activas                     |       16 |
| Perfiles operativos físicos activos                          |        1 |
| Grants operativos físicos permitidos                         |       32 |
| Funciones físicas que referencian rol operativo              |       13 |
| Políticas RLS inspeccionadas sobre cinco tablas relacionadas |       12 |
| Brechas físicas registradas                                  |       14 |
| Requisitos de prueba derivados                               |       10 |

Las cifras físicas son un snapshot de solo lectura. No certifican que los
turnos históricos deban corregirse indiscriminadamente ni que el contrato esté
implementado.

---

#### 3. Identidad canónica del bloqueo

La identidad pública única es:

```text
reason_code = AUTH_OPERATIONAL_ROLE_REQUIRED
```

| Propiedad                                    | Valor                                                                                            |
| -------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| Dominio                                      | `AUTHORIZATION_CONTEXT`                                                                          |
| Estado público                               | `MISSING_REQUIRED_OPERATIONAL_ROLE`                                                              |
| Decisión de carril                           | `DENY` para el carril operativo                                                                  |
| Decisión final                               | depende de la modalidad; nunca autoriza un carril incompleto                                     |
| Estado HTTP cuando la decisión final deniega | `403 Forbidden`                                                                                  |
| `executable`                                 | `false` cuando no existe otro carril completo que autorice                                       |
| Sesión de autenticación                      | se conserva                                                                                      |
| Efectos empresariales                        | cero                                                                                             |
| Reintento automático                         | prohibido                                                                                        |
| Recuperación principal                       | corregir y publicar el turno mediante autoridad administrativa, luego obtener una decisión nueva |
| Copy principal                               | `Tu turno no tiene un rol operativo asignado. Solicita que lo corrijan para continuar.`          |
| Causas internas públicas                     | ninguna                                                                                          |

Quedan prohibidos como códigos públicos alternativos:

- `invalid_operational_role`;
- `missing_role`;
- `role_required` sin namespace;
- `no_role`;
- `no_permission`;
- el código de un rol esperado;
- mensajes libres usados como identidad contractual.

Las razones legacy podrán mapearse temporalmente como aliases internos, pero no
podrán competir con la identidad pública canónica.

---

#### 4. Definición exacta de ausencia limpia

Existe ausencia limpia únicamente cuando:

```text
active_shift = exactly_one
AND
active_shift.operational_role_code IS NULL OR BLANK
AND
SHIFT_RESOLUTION = CONCLUSIVE
AND
ROLE_SOURCE_READ = SUCCESS
```

El valor vacío deberá normalizarse antes de decidir:

```text
null
""
"   "
→ CONCLUSIVE_ABSENT
```

La ausencia no se infiere cuando existe un valor observado que no puede ser
validado. Estos estados son diferentes:

| Estado de la fuente              | Significado                                         | Resultado propietario  |
| -------------------------------- | --------------------------------------------------- | ---------------------- |
| `CONCLUSIVE_ABSENT`              | la revisión publicada no contiene código            | `AUTH-ERR-012`         |
| `PRESENT_CANONICAL`              | existe código canónico activo                       | continuar              |
| `PRESENT_UNKNOWN`                | existe código no reconocido                         | configuración inválida |
| `PRESENT_INACTIVE_OR_DEPRECATED` | existe código no utilizable                         | configuración inválida |
| `CONTRADICTORY`                  | revisiones o fuentes producen valores incompatibles | `AUTH-ERR-017`         |
| `UNAVAILABLE`                    | la fuente no pudo consultarse                       | `AUTH-ERR-019`         |

Un código inválido no se convertirá en ausencia para mostrar un mensaje más
simple.

---

#### 5. Fuente autoritativa del rol

La fuente exclusiva para una operación real es:

```text
active_shift.operational_role_code
```

La cadena debe proceder de la misma revisión publicada que aportó:

- `shift_id`;
- `employee_id`;
- `site_id`;
- `area_id`;
- ventana temporal;
- estado de publicación.

No podrán crear ni completar el rol efectivo:

- `employees.role`;
- `base_role`;
- un perfil operativo predeterminado;
- el último turno;
- el último rol utilizado;
- una cookie;
- un parámetro del cliente;
- un selector visual;
- `navigation_role` del dispositivo;
- el nombre del área;
- la sede seleccionada;
- el check-in;
- un permiso solicitado;
- la aplicación abierta;
- una heurística por oficio;
- una simulación presentada como contexto real.

---

#### 6. Separación entre rol base y rol operativo

El rol base conserva identidad y responsabilidades permanentes. El rol
operativo representa la función temporal de un turno concreto.

```text
ROL BASE VÁLIDO
≠
ROL OPERATIVO EFECTIVO
```

Por tanto:

```text
base_role = supervisor
active_shift.operational_role_code = null
→ operational_role = null
```

También:

```text
base_role = propietario
active_shift.operational_role_code = null
→ el carril operativo no obtiene rol por jerarquía
```

Un carril base completo podrá autorizar únicamente cuando la modalidad del
permiso lo admita. No podrá prestarle el rol al carril operativo.

---

#### 7. Catálogo operativo consumido

Cuando exista un código, el resolver deberá consultarlo exclusivamente en el
catálogo operativo canónico.

```text
operational_role_code
→ operational_roles
```

No deberá consultarlo indistintamente en catálogos base y operativos.

La presencia del código no basta. El rol deberá ser:

- canónico;
- activo;
- no deprecado;
- único;
- resoluble en el namespace operativo;
- coherente con la revisión del turno.

Un valor como `propietario_admin`, declarado deprecado por el contrato de
contexto, no constituye ausencia limpia aunque la tabla física lo mantenga
activo durante transición.

---

#### 8. Aplicabilidad por permiso y carril

La razón se evalúa únicamente si el permiso admite o exige carril operativo.

Distribución canónica:

| Clasificación                 | Cantidad | Efecto ante rol faltante                           |
| ----------------------------- | -------: | -------------------------------------------------- |
| permisos sin carril operativo |       54 | no evalúan esta razón                              |
| carriles operativos `T`       |       19 | requieren rol después de resolver turno vigente    |
| carriles operativos `T+C`     |       39 | requieren rol después de resolver turno y check-in |
| total con carril operativo    |       58 | el carril operativo queda denegado si falta rol    |

Ninguna aplicación podrá convertir todos sus permisos en una única política de
rol. La unidad de decisión continúa siendo el permiso, su modalidad y el
carril evaluado.

---

#### 9. Modalidades de autorización

##### `BASE_ONLY`

No consume rol operativo. Su ausencia no produce esta razón.

##### `OPERATIONAL_ONLY`

La ausencia del rol deniega la decisión final porque el único carril admitido
está incompleto.

##### `BASE_OR_OPERATIONAL`

Los carriles se evalúan de forma independiente:

```text
BASE_ALLOW completo
+
ROL OPERATIVO FALTANTE
→ ALLOW por carril base
```

```text
BASE_DENY
+
ROL OPERATIVO FALTANTE
→ DENY final
→ AUTH_OPERATIONAL_ROLE_REQUIRED si es la primera causa concluyente aplicable
```

##### `BASE_AND_OPERATIONAL`

La ausencia del rol deniega la decisión final aunque el carril base sea válido.
No se combinan fragmentos incompletos.

---

#### 10. Precondiciones exactas

Antes de producir esta razón deberán haberse resuelto:

1. sesión y actor efectivo;
2. actividad laboral;
3. aplicación solicitada;
4. permiso y modalidad;
5. selección del carril operativo;
6. turno publicado;
7. vigencia temporal del turno;
8. check-in cuando el carril es `T+C`;
9. lectura concluyente del campo de rol del turno.

Para un carril `T`, la evaluación de rol ocurre después de la vigencia del
turno y no requiere check-in.

Para un carril `T+C`, la evaluación ocurre después de confirmar el check-in
activo compatible. El check-in no completa el rol.

---

#### 11. Causas internas admitidas

Se admiten exactamente tres causas internas para esta identidad pública:

| Causa interna                     | Condición                                                  |
| --------------------------------- | ---------------------------------------------------------- |
| `SHIFT_OPERATIONAL_ROLE_NULL`     | el campo autoritativo es `null`                            |
| `SHIFT_OPERATIONAL_ROLE_EMPTY`    | el campo existe pero queda vacío al normalizar             |
| `PUBLISHED_REVISION_ROLE_OMITTED` | la revisión publicada reproducible omitió el rol requerido |

Estas causas podrán registrarse en auditoría restringida. No se expondrán al
usuario ni cambiarán el código público.

No pertenecen a esta identidad:

- código desconocido;
- rol inactivo o deprecado;
- rol no habilitado en sede;
- rol incompatible con área;
- múltiples roles candidatos;
- fallo de catálogo;
- fallo de base de datos.

---

#### 12. `OPERATIONAL-ROLE-REQUIRED-BLOCKING-CONTRACT-001`

El contrato queda:

```text
INPUT
  actor_effective
  requested_permission
  authorization_requirement
  selected_lane
  active_shift
  active_checkin_session
  operational_role_source_state
  resolved_at
  context_fingerprint

PRECONDITION
  selected_lane = OPERATIONAL
  active_shift = valid_published_current_shift
  checkin_requirement_satisfied = true
  operational_role_source_state = CONCLUSIVE_ABSENT

OUTPUT
  lane_decision = DENY
  reason_code = AUTH_OPERATIONAL_ROLE_REQUIRED
  public_state = MISSING_REQUIRED_OPERATIONAL_ROLE
  executable = false for the operational lane
  side_effects = 0
  session_preserved = true
  automatic_retry = false
```

Si otro carril independiente produce `ALLOW`, la decisión final respetará la
modalidad sin presentar el bloqueo como denegación global.

---

#### 13. Frontera con rol inválido

Los siguientes casos contienen un valor observado y no son ausencia limpia:

| Caso                                   | Resultado                                      |
| -------------------------------------- | ---------------------------------------------- |
| código inexistente                     | configuración inválida; no usar `AUTH-ERR-012` |
| código inactivo                        | configuración inválida                         |
| código deprecado                       | configuración inválida                         |
| código base escrito en campo operativo | configuración inválida                         |
| código ambiguo entre revisiones        | `AUTH-ERR-017`                                 |
| catálogo no disponible                 | `AUTH-ERR-019`                                 |

No se elegirá el rol “más parecido”, un alias no aprobado ni el primer registro
encontrado.

---

#### 14. Frontera con sede y área

Cuando el código existe, es canónico y está activo, el resolver continuará con
las tareas territoriales:

```text
ROL PRESENTE
+
NO HABILITADO EN SEDE
→ AUTH-ERR-013
```

```text
ROL PRESENTE
+
SEDE VÁLIDA
+
ÁREA FALTANTE O INCOMPATIBLE CUANDO ES OBLIGATORIA
→ AUTH-ERR-014
```

La falta de habilitación no podrá reescribirse como falta de rol. El nodo
observado podrá conservar el código para diagnóstico restringido, con
`valid_for_site=false` o `valid_for_area=false`.

---

#### 15. Frontera con permisos

Un rol presente, activo y territorialmente válido puede no tener el permiso
solicitado.

```text
ROL OPERATIVO VÁLIDO
+
0 GRANTS COINCIDENTES
→ DENEGACIÓN DE PERMISO
```

Ese caso no pertenece a `AUTH-ERR-012`.

La presencia de una fila en `operational_role_permissions` tampoco crea un rol
cuando el turno carece de él.

---

#### 16. Perfil operativo predeterminado

El perfil predeterminado puede ayudar a planificar o completar un turno antes
de publicarlo, pero no es autoridad en tiempo de ejecución.

```text
default_operational_role = bodeguero
active_shift.operational_role_code = null
→ AUTH_OPERATIONAL_ROLE_REQUIRED
```

El correctivo deberá modificar la fuente administrativa del turno, publicar la
revisión correspondiente y producir un nuevo snapshot. No se aplicará fallback
en el evaluador.

---

#### 17. Dispositivos compartidos y navegación

Un dispositivo puede declarar una plantilla o expectativa de navegación. Eso
no asigna función laboral al actor.

```text
device.navigation_role = cajero_satelite
active_shift.operational_role_code = null
→ AUTH_OPERATIONAL_ROLE_REQUIRED
```

Quedan prohibidos:

- heredar el rol del actor anterior;
- convertir la plantilla del dispositivo en rol efectivo;
- persistir una selección local como asignación;
- completar el turno desde una cookie;
- autorizar por la pantalla visible.

---

#### 18. Simulación

Una simulación podrá evaluar hipotéticamente otro rol dentro de un contrato
separado y no ejecutable.

No podrá:

- rellenar el rol real del turno;
- cambiar el contexto efectivo real;
- convertir `WOULD_ALLOW` en `ALLOW`;
- persistir una asignación;
- habilitar mutaciones empresariales.

Si se intenta ejecutar una acción real desde simulación, la razón propietaria
permanece en `AUTH-ERR-016`.

---

#### 19. Actor `SYSTEM`

Un proceso autónomo de sistema no recibe un rol laboral sintético.

Si el permiso es de sistema y no posee carril operativo laboral, esta razón no
aplica.

Si un proceso actúa delegadamente en nombre de un empleado para ejecutar una
capacidad operativa, deberá resolver el mismo turno y rol del actor efectivo.
No podrá usar una cuenta técnica para completar la ausencia.

---

#### 20. Entradas mínimas y determinismo

Las entradas mínimas son:

- identidad del actor efectivo;
- código del permiso;
- modalidad y prerrequisitos del permiso;
- carril evaluado;
- turno publicado vigente resuelto;
- estado del check-in cuando aplique;
- valor bruto del rol dentro de la revisión publicada;
- estado de lectura de la fuente;
- `resolved_at` de servidor;
- versión del catálogo y fingerprint del contexto.

Para las mismas entradas autoritativas deberá producirse exactamente el mismo
resultado. No participarán el orden físico de filas, la aplicación abierta, el
último rol usado ni el estado local del cliente.

---

#### 21. `OPERATIONAL-ROLE-STATE-DECISION-MATRIX-001`

|    # | Escenario                                                  | Decisión                                            |
| ---: | ---------------------------------------------------------- | --------------------------------------------------- |
|    1 | `BASE_ONLY`, sin turno ni rol                              | no aplica; evaluar carril base                      |
|    2 | `BASE_OR_OPERATIONAL`, carril base completo y rol faltante | `ALLOW` por base; carril operativo `DENY`           |
|    3 | `OPERATIONAL_ONLY`, sin turno publicado                    | `AUTH-ERR-009`                                      |
|    4 | turno publicado fuera de ventana                           | `AUTH-ERR-010`                                      |
|    5 | carril `T+C`, check-in ausente                             | `AUTH-ERR-011`                                      |
|    6 | carril `T`, turno vigente y rol `null`                     | `AUTH_OPERATIONAL_ROLE_REQUIRED`                    |
|    7 | carril `T+C`, check-in válido y rol `null`                 | `AUTH_OPERATIONAL_ROLE_REQUIRED`                    |
|    8 | campo de rol vacío o whitespace                            | `AUTH_OPERATIONAL_ROLE_REQUIRED`                    |
|    9 | revisión publicada omitió el rol                           | `AUTH_OPERATIONAL_ROLE_REQUIRED`                    |
|   10 | perfil predeterminado tiene rol, turno no                  | `AUTH_OPERATIONAL_ROLE_REQUIRED`                    |
|   11 | rol base coincide semánticamente, turno no tiene rol       | `AUTH_OPERATIONAL_ROLE_REQUIRED`                    |
|   12 | dispositivo declara `navigation_role`, turno no            | `AUTH_OPERATIONAL_ROLE_REQUIRED`                    |
|   13 | cliente propone rol, turno no                              | ignorar propuesta; `AUTH_OPERATIONAL_ROLE_REQUIRED` |
|   14 | historial contiene último rol, turno actual no             | ignorar historial; `AUTH_OPERATIONAL_ROLE_REQUIRED` |
|   15 | código presente pero desconocido                           | configuración inválida; no esta razón               |
|   16 | código presente pero inactivo o deprecado                  | configuración inválida; no esta razón               |
|   17 | rol canónico no habilitado en sede                         | `AUTH-ERR-013`                                      |
|   18 | rol canónico incompatible con área                         | `AUTH-ERR-014`                                      |
|   19 | revisiones producen roles contradictorios                  | `AUTH-ERR-017`                                      |
|   20 | catálogo o fuente no disponible                            | `AUTH-ERR-019`                                      |
|   21 | rol válido sin grant del permiso                           | denegación de permiso posterior                     |
|   22 | rol válido, carril `T`, sin check-in                       | continuar evaluación                                |
|   23 | rol válido, carril `T+C`, check-in compatible              | continuar evaluación                                |
|   24 | actor `SYSTEM` con permiso técnico explícito               | no crear rol sintético; usar contrato de sistema    |

La matriz conserva una decisión explícita para cada escenario y prohíbe
fallback permisivo.

---

#### 22. Precedencia

El orden mínimo relevante queda:

```text
AUTENTICACIÓN
→ IDENTIDAD LABORAL
→ ACCESO A APLICACIÓN
→ TERRITORIO LABORAL PREVIO APLICABLE
→ TURNO PUBLICADO
→ VIGENCIA TEMPORAL
→ CHECK-IN CUANDO T+C
→ PRESENCIA DEL ROL OPERATIVO
→ VALIDEZ DEL CÓDIGO
→ HABILITACIÓN EN SEDE
→ COMPATIBILIDAD DE ÁREA
→ DISPOSITIVO Y SIMULACIÓN
→ GRANT DEL PERMISO
→ SCOPE Y RECURSO
```

La primera causa concluyente aplicable prevalece. Una causa posterior no
ocultará una anterior, y una anterior ya satisfecha no seguirá apareciendo.

---

#### 23. Regla de cero efectos

Antes de cualquier efecto empresarial, el servidor deberá confirmar que el
carril necesario posee rol operativo efectivo.

Mientras la razón esté vigente quedan prohibidos:

- inserciones o actualizaciones empresariales;
- cambios de estado;
- movimientos de inventario;
- preparación, despacho o recepción;
- impresión o emisión de documentos operativos;
- eventos empresariales;
- jobs o colas derivados;
- notificaciones que presupongan éxito;
- suscripciones protegidas;
- reserva de recursos;
- auditoría de éxito.

Solo se permite registrar el intento denegado con minimización de datos.

---

#### 24. Envelope público

Cuando la decisión final sea denegada por esta causa, la respuesta compartida
representará como mínimo:

```json
{
  "decision": "DENY",
  "reason_code": "AUTH_OPERATIONAL_ROLE_REQUIRED",
  "public_state": "MISSING_REQUIRED_OPERATIONAL_ROLE",
  "http_status": 403,
  "executable": false,
  "retryable": false,
  "session_preserved": true
}
```

No incluirá:

- rol esperado;
- código de rol anterior;
- nombre del empleado;
- sede o área;
- turno o revisión;
- nombres de tablas;
- existencia de grants;
- SQL, policy o RPC involucrada;
- causas internas.

---

#### 25. Copy, accesibilidad y recuperación

Copy principal exacto:

```text
Tu turno no tiene un rol operativo asignado. Solicita que lo corrijan para continuar.
```

La experiencia deberá:

- conservar la sesión;
- explicar que la operación está bloqueada, no que la cuenta está desactivada;
- ofrecer un canal accesible para solicitar corrección cuando exista;
- no sugerir cambiar de rol desde el cliente;
- no permitir elegir un rol como mecanismo de recuperación;
- no presentar un reintento automático;
- anunciar el bloqueo mediante texto y semántica accesible;
- conservar navegación segura hacia ANIMA, soporte o vistas base permitidas.

La recuperación autoritativa es administrativa:

```text
corregir turno
→ publicar revisión
→ invalidar snapshot anterior
→ resolver contexto nuevo
→ emitir solicitud nueva
```

---

#### 26. `OPERATIONAL-ROLE-CHANNEL-RESPONSE-MATRIX-001`

| Canal                           | Resultado obligatorio                                                                         |
| ------------------------------- | --------------------------------------------------------------------------------------------- |
| navegación web y guard          | bloquear la superficie operativa; conservar sesión y accesos base independientes              |
| Server Action                   | no ejecutar cuerpo ni efectos; devolver razón tipada                                          |
| Route Handler o API             | `403` con envelope canónico                                                                   |
| RSC o fetch de servidor         | no serializar datos protegidos; representar el estado tipado                                  |
| RPC o PostgREST                 | fail closed; no reducirse a `false` sin diagnóstico contractual                               |
| RLS o Data API                  | impedir lectura o mutación protegida y conservar correlación diagnóstica fuera de la política |
| Edge Function                   | revalidar contexto y responder razón equivalente                                              |
| Realtime                        | no crear ni conservar suscripción protegida con snapshot inválido                             |
| cliente nativo u offline        | no considerar una selección local como rol; exigir resolución nueva en línea                  |
| dispositivo compartido o kiosco | no heredar plantilla, cookie ni rol del actor anterior                                        |

Los diez canales deberán producir la misma decisión semántica y cero efectos.

---

#### 27. Reintentos, concurrencia y frescura

El usuario no podrá resolver esta causa repitiendo la misma solicitud sobre el
mismo snapshot.

Invalidan la decisión anterior:

- publicación de una revisión corregida;
- cambio del código de rol en el turno;
- cancelación o retiro del turno;
- cambio del actor;
- cambio de sede o área del turno;
- desactivación o deprecación del rol;
- cambio de habilitación territorial;
- inicio o cierre de check-in cuando corresponda;
- entrada o salida de simulación;
- cambio de dispositivo compartido;
- vencimiento temporal del turno.

Una operación iniciada con rol válido deberá revalidar antes del commit cuando
exista riesgo de cambio concurrente.

---

#### 28. Auditoría

El evento de denegación deberá registrar de forma restringida:

- identificador de correlación;
- actor efectivo;
- permiso solicitado;
- modalidad y carril;
- `shift_id` y revisión resuelta;
- estado normalizado de la fuente de rol;
- causa interna;
- versión del catálogo;
- `resolved_at`;
- fingerprint del contexto;
- aplicación y canal;
- decisión final;
- confirmación de cero efectos.

No registrará el copy localizado como identidad técnica ni el contenido de
cookies o tokens.

---

#### 29. `OPERATIONAL-ROLE-APPLICATION-COVERAGE-REGISTER-001`

| Aplicación | Decisión                                                                                                            |
| ---------- | ------------------------------------------------------------------------------------------------------------------- |
| SHELL      | sus capacidades base no exigen rol; las superficies operativas futuras deberán decidir por permiso                  |
| ANIMA      | el acceso y la corrección de asistencia continúan por capacidades base; no puede completar el rol al marcar entrada |
| AURA       | no recibe rol laboral sintético para capacidades de cliente o sistema                                               |
| VISO       | planificación puede corregir el turno mediante permisos base; operaciones reales usan el rol del turno              |
| NEXO       | sus  carriles operativos `T` y `T+C` exigen rol; se elimina autoridad de cookies y overrides locales                |
| FOGO       | producción operativa exige rol del turno y no oficio inferido                                                       |
| ORIGO      | recepción y compras separan capacidades base de acciones operativas por permiso                                     |
| PULSO      | caja y operación presencial exigen rol del turno sin inferirlo desde dispositivo o terminal                         |
| NUMERA     | administración base permanece independiente; operaciones contextualizadas usan el mismo contrato                    |
| PASS       | la identidad cliente no recibe ni presta rol operativo laboral                                                      |

La aplicación no es la unidad de autorización. Cada fila obliga a consumir el
contrato por permiso, modalidad, actor y carril.

---

#### 30. Snapshot físico observado

El snapshot de solo lectura observó:

| Elemento físico                                         |                            Resultado |
| ------------------------------------------------------- | -----------------------------------: |
| `operational_roles`                                     |                 13 filas, 13 activas |
| roles que exigen check-in externo                       |                                    1 |
| roles que exigen check-out externo                      |                                    1 |
| `employee_shifts`                                       |                           2844 filas |
| turnos laborales                                        |                                 2411 |
| turnos de descanso                                      |                                  433 |
| turnos laborales publicados y no cancelados             |                                 2318 |
| publicados laborales sin `operational_role`             |                                 1535 |
| publicados laborales con código no vacío                |                                  783 |
| códigos distintos usados en turnos publicados laborales |                                   12 |
| códigos usados sin correspondencia en catálogo          |                                    0 |
| `site_operational_roles`                                |                     16 filas activas |
| habilitaciones site-wide activas                        |                                    3 |
| habilitaciones con área activa                          |                                   13 |
| `employee_site_operational_profiles`                    | 1 fila activa con rol predeterminado |
| `operational_role_permissions`                          |                  32 filas permitidas |
| funciones que referencian `operational_role`            |                                   13 |
| políticas RLS inspeccionadas                            |                                   12 |

La ausencia histórica no se declara automáticamente defecto individual. La
migración futura deberá distinguir periodos, revisiones, turnos consumibles y
estrategia aprobada de compatibilidad.

---

#### 31. Esquema físico observado

El estado físico relevante presenta:

- `employee_shifts.operational_role` como `text` nullable;
- ausencia de foreign key entre ese campo y `operational_roles(code)`;
- catálogo `operational_roles` con trece códigos físicamente activos;
- `site_operational_roles` con rol, sede y área opcional;
- foreign key de `site_operational_roles.role_code` marcada `NOT VALID`;
- `employee_site_operational_profiles.default_operational_role` con foreign key
  al catálogo, pero con semántica de default no autoritativa;
- `operational_role_permissions` separada de la asignación del turno;
- RLS de lectura y administración sobre catálogos y matrices;
- cinco políticas RLS sobre `employee_shifts` basadas en identidad y rol base;
- funciones `SECURITY DEFINER` que resuelven contexto y permisos.

La presencia de tablas y policies no demuestra equivalencia con el contrato.

---

#### 32. Comportamiento físico observado

`get_operational_context` actualmente:

- toma `employee_shifts.operational_role` como texto;
- selecciona un turno mediante orden y `limit 1`;
- emite `invalid_operational_role` tanto por ausencia como por incompatibilidad;
- valida habilitación mediante `site_operational_roles`;
- no separa códigos públicos para ausencia, sede y área;
- aplica bypass por nombres de roles administrativos;
- aplica política global por aplicación en vez de prerrequisito por permiso;
- expone `active_operational_role` aunque el contrato público no esté
  versionado.

`get_effective_context_v1` puede construir `effective_operational_role` desde
`navigation_role` de un dispositivo compartido o desde una simulación. Esa
forma no podrá actuar como autoridad para una operación real.

El consumidor NEXO observado:

- permite un override de rol derivado de cookies para determinados roles;
- reemplaza `active_operational_role` en memoria;
- busca un área activa por tipo mediante `limit 1`;
- consume una RPC booleana de permiso;
- no mapea `invalid_operational_role` a código y copy canónicos;
- utiliza un fallback de permiso o un mensaje genérico.

---

#### 33. `OPERATIONAL-ROLE-PHYSICAL-RECONCILIATION-001`

|    # | Brecha física                                                                  | Estado                   | Destino de cierre                                                    |
| ---: | ------------------------------------------------------------------------------ | ------------------------ | -------------------------------------------------------------------- |
|    1 | campo de rol del turno nullable                                                | `BLOQUEADO`              | `AUTH-DB-033`; estrategia compatible para publicación y backfill     |
|    2 | campo del turno sin FK al catálogo                                             | `BLOQUEADO`              | `AUTH-DB-020`; `AUTH-DB-030`                                         |
|    3 | 1535 turnos laborales publicados no cancelados sin rol                         | `PENDIENTE_DE_EVIDENCIA` | inventario y backfill determinista en paquete E5 autorizado          |
|    4 | `propietario_admin` físicamente activo aunque el contrato lo declara deprecado | `BLOQUEADO`              | reconciliación de catálogo y consumidores en `AUTH-DB-020`           |
|    5 | FK de `site_operational_roles.role_code` permanece `NOT VALID`                 | `BLOQUEADO`              | validación de integridad y migración desde `vento-shell`             |
|    6 | perfil predeterminado puede alimentar planificación y funciones auxiliares     | `ESPECIFICADO`           | impedir uso autoritativo en `AUTH-DB-033`; adaptar en `AUTH-CTX-028` |
|    7 | razón legacy agrupa ausencia e incompatibilidad                                | `BLOQUEADO`              | catálogo de razones y evaluador en `AUTH-DB-034`                     |
|    8 | selección de turno por `limit 1` no prueba unicidad                            | `BLOQUEADO`              | resolver determinista y ambigüedad en `AUTH-DB-033`                  |
|    9 | política física opera por aplicación, no por permiso y carril                  | `BLOQUEADO`              | catálogo físico `AUTH-DB-031`; evaluador `AUTH-DB-034`               |
|   10 | bypass por nombre de rol administrativo                                        | `BLOQUEADO`              | retirar en `AUTH-DB-034`; usar permisos explícitos                   |
|   11 | contexto efectivo de dispositivo usa `navigation_role`                         | `BLOQUEADO`              | contrato de dispositivo y adapters `SHELL-AUTH-004`                  |
|   12 | simulación comparte campo de rol efectivo con contexto real                    | `BLOQUEADO`              | separar `WOULD_ALLOW` en `SHELL-AUTH-004`                            |
|   13 | NEXO muta rol y área desde cookie y primera coincidencia                       | `BLOQUEADO`              | migración de consumidora `SHELL-AUTH-005`                            |
|   14 | NEXO carece de código, envelope y copy canónicos                               | `BLOQUEADO`              | SDK y catálogo de mensajes `SHELL-AUTH-002`; `AUTH-ERR-020`          |

Ninguna brecha autoriza cambios físicos durante esta tarea documental.

---

#### 34. Handoff de implementación

La materialización futura deberá incluir, como mínimo:

1. contrato versionado de razón y envelope;
2. resolver único de turno y rol sin fallback;
3. distinción entre ausencia, código inválido, sede, área e indisponibilidad;
4. catálogo físico alineado con códigos y estado canónicos;
5. estrategia determinista e idempotente para turnos históricos;
6. validación de constraints y compatibilidad antes de endurecer nulabilidad;
7. evaluación por permiso, modalidad y carril;
8. retiro de bypasses por nombre y overrides de cliente;
9. adapters equivalentes para diez canales y diez aplicaciones;
10. pruebas contractuales, base de datos, RPC, RLS, integración, E2E y
    regresión;
11. observabilidad, invalidación y cero efectos;
12. rollback compatible cuando una migración afecte turnos existentes.

Toda modificación de Supabase deberá crearse, versionarse, documentarse y
ejecutarse desde `vento-shell`.

---

#### 35. Requisitos de prueba derivados

Esta tarea crea diez requisitos:

- `TREQ-AUTH-239`;
- `TREQ-AUTH-240`;
- `TREQ-AUTH-241`;
- `TREQ-AUTH-242`;
- `TREQ-AUTH-243`;
- `TREQ-AUTH-244`;
- `TREQ-AUTH-245`;
- `TREQ-AUTH-246`;
- `TREQ-AUTH-247`;
- `TREQ-AUTH-248`.

Los diez quedan en estado `IDENTIFICADO`. La definición documental no equivale
a implementación ni a evidencia de ejecución.

---

#### 36. Validaciones documentales definidas

La implementación deberá probar al menos:

1. código, estado, `403`, decisión de carril y cero efectos;
2. aplicación exclusiva a los 58 carriles operativos;
3. no afectación de 54 permisos sin carril operativo;
4. independencia de `BASE_OR_OPERATIONAL`;
5. ausencia `null`, vacía y omitida;
6. prohibición de fallback desde rol base, perfil, historial, dispositivo,
   cookie, cliente o aplicación;
7. separación de código desconocido, inactivo y deprecado;
8. separación de sede y área;
9. separación de grant faltante;
10. precedencia con turno y check-in;
11. equivalencia de diez canales;
12. decisión explícita para diez aplicaciones;
13. invalidación por cambio de revisión o catálogo;
14. auditoría minimizada y cero efectos;
15. reconciliación de las catorce brechas físicas;
16. preservación de sesión y accesibilidad;
17. no creación de rol para actores `SYSTEM`;
18. simulación no ejecutable;
19. compatibilidad y rollback de datos históricos;
20. ausencia de bypass por nombre de rol.

---

#### 37. Evidencia y estados

| Resultado                         | Estado al cerrar esta tarea                                   |
| --------------------------------- | ------------------------------------------------------------- |
| contrato documental               | `ESPECIFICADO`                                                |
| matriz de veinticuatro escenarios | `ESPECIFICADO`                                                |
| matriz de diez canales            | `ESPECIFICADO`                                                |
| cobertura de diez aplicaciones    | `ESPECIFICADO`                                                |
| snapshot físico                   | `PENDIENTE_DE_EVIDENCIA` para certificación de implementación |
| migraciones y backfill            | `NO_APLICA` en esta fase documental                           |
| código compartido y adapters      | `NO_APLICA` en esta fase documental                           |
| pruebas automatizadas             | `PENDIENTE_DE_EVIDENCIA`                                      |
| validación operativa              | `PENDIENTE_DE_EVIDENCIA`                                      |

No se presenta ninguna brecha física como implementada o validada.

---

#### 38. Fuera del alcance

Esta tarea no:

- corrige turnos;
- completa roles históricos;
- crea migraciones;
- endurece nulabilidad;
- valida constraints físicas;
- cambia catálogos;
- modifica matrices de sede o área;
- cambia grants;
- elimina perfiles;
- edita NEXO u otra aplicación;
- implementa SDK;
- despliega funciones;
- ejecuta DDL, DML o backfills;
- crea datos de prueba productivos;
- inicia `AUTH-ERR-013`.

---

#### 39. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. existe una sola identidad pública;
2. la ausencia limpia está definida sin confundirla con invalidez;
3. la fuente exclusiva es el rol de la revisión publicada del turno;
4. se prohíben todos los fallbacks no autoritativos;
5. se preserva la separación entre rol base y operativo;
6. los 112 permisos se reconcilian en distribución 54/19/39;
7. los 58 carriles operativos requieren rol;
8. las cuatro modalidades tienen decisión explícita;
9. la precedencia con turno y check-in es inequívoca;
10. sede y área permanecen en `AUTH-ERR-013` y `AUTH-ERR-014`;
11. código inválido y fuente indisponible conservan razones distintas;
12. veinticuatro escenarios tienen resultado;
13. diez canales tienen respuesta equivalente;
14. diez aplicaciones tienen decisión explícita;
15. copy, privacidad, accesibilidad y recuperación están definidos;
16. se exige cero efectos y nueva decisión;
17. el snapshot físico declara cifras y límites;
18. catorce brechas poseen estado y destino;
19. diez requisitos `TREQ-*` están derivados;
20. la siguiente tarea permanece únicamente reservada.

---

#### 40. Riesgos controlados

La tarea controla:

- autorización por rol base en ausencia de rol operativo;
- fallback desde perfiles o historial;
- préstamo de rol desde dispositivo compartido;
- override por cookie o frontend;
- selección arbitraria mediante `limit 1`;
- mezcla de ausencia con incompatibilidad territorial;
- bloqueo indiscriminado de capacidades base;
- bypass por nombre de administrador;
- simulación tratada como autoridad real;
- respuesta genérica sin recuperación;
- datos protegidos serializados antes del deny;
- efectos parciales;
- drift entre canales y aplicaciones;
- backfill no determinista de turnos históricos;
- exposición de datos laborales internos.

---

#### 41. Cierre de tarea y continuidad

```text
ÚLTIMA TAREA APROBADA
AUTH-ERR-011 — Check-in requerido

TAREA ACTUAL APROBADA
AUTH-ERR-012 — Rol operativo faltante

SIGUIENTE TAREA RESERVADA
AUTH-ERR-013 — Rol operativo inválido para la sede
```

No se inicia ni modifica `AUTH-ERR-013` en esta tarea.


### ✅ AUTH-ERR-013 — Rol operativo inválido para la sede

**Estado:** APROBADA
**Tarea anterior:** `AUTH-ERR-012 — Rol operativo faltante` — APROBADA
**Tarea siguiente:** `AUTH-ERR-014 — Rol operativo inválido para el área` — RESERVADA
**Tipo de tarea:** documental; definición contractual, causal, funcional, territorial, de seguridad y experiencia del bloqueo producido cuando una capacidad necesita carril operativo, el turno vigente contiene un rol operativo canónico y activo, pero dicho rol no posee una habilitación activa y concluyente para la sede exacta del turno

---

#### 1. Propósito

Definir de forma única, segura y verificable qué debe ocurrir cuando una
solicitud necesita participar en el carril operativo, ya superó los controles
anteriores aplicables, consume exactamente un turno laboral publicado y
vigente, contiene un rol operativo canónico y activo, resuelve una sede
operativa válida desde ese mismo turno, pero no existe una habilitación activa
y concluyente de dicho rol para esa sede.

La regla raíz queda:

```text
SESIÓN AUTENTICADA VÁLIDA
+
IDENTIDAD LABORAL ACTIVA
+
ACCESO A LA APLICACIÓN PERMITIDO
+
CAPACIDAD CON CARRIL OPERATIVO APLICABLE
+
TURNO LABORAL PUBLICADO Y VIGENTE INEQUÍVOCO
+
CHECK-IN VÁLIDO CUANDO EL CARRIL EXIGE T+C
+
ROL OPERATIVO PRESENTE, CANÓNICO Y ACTIVO
+
SEDE EXACTA DEL TURNO VÁLIDA Y OPERATIVA
+
SITE_ROLE_ENABLEMENT = CONCLUSIVE_ABSENT
→
DENY DEL CARRIL OPERATIVO
+
AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE
+
403 CUANDO LA DECISIÓN FINAL QUEDA DENEGADA
+
CERO EFECTOS
```

La tarea responde exclusivamente:

```text
¿EL ROL OPERATIVO CANÓNICO DEL TURNO NO ESTÁ HABILITADO
PARA LA SEDE EXACTA DE ESE MISMO TURNO?
```

No responde:

```text
¿EXISTE SESIÓN DE AUTENTICACIÓN?
¿EL EMPLEADO ESTÁ ACTIVO?
¿EXISTE UN TURNO PUBLICADO Y VIGENTE?
¿EXISTE CHECK-IN CUANDO ES REQUERIDO?
¿EL TURNO CONTIENE ROL OPERATIVO?
¿EL CÓDIGO DE ROL ES CANÓNICO Y ACTIVO?
¿LA SEDE DEL TURNO EXISTE Y ESTÁ ACTIVA?
¿EL ROL ES COMPATIBLE CON EL ÁREA DEL TURNO?
¿EL ROL TIENE EL GRANT DEL PERMISO?
¿EL RECURSO PERTENECE AL TERRITORIO?
¿LA FUENTE TÉCNICA ESTÁ DISPONIBLE?
```

La ausencia limpia del código pertenece a `AUTH-ERR-012`. Un rol canónico con
habilitación activa en la sede, pero sin coincidencia territorial de área,
pertenece a `AUTH-ERR-014`. Una fuente contradictoria o incompleta no se
degradará a esta razón.

---

#### 2. Resultado material

Se aprueban cinco artefactos documentales completos:

1. `OPERATIONAL-ROLE-SITE-BLOCKING-CONTRACT-001`, que congela identidad
   pública, aplicabilidad, fuente autoritativa, decisión, recuperación,
   privacidad, auditoría y cero efectos;
2. `OPERATIONAL-ROLE-SITE-STATE-DECISION-MATRIX-001`, que decide veinticuatro
   escenarios y separa sede no habilitada, área incompatible, rol faltante,
   rol inválido, grant faltante, simulación e indisponibilidad;
3. `OPERATIONAL-ROLE-SITE-CHANNEL-RESPONSE-MATRIX-001`, que materializa diez
   canales con semántica equivalente;
4. `OPERATIONAL-ROLE-SITE-APPLICATION-COVERAGE-REGISTER-001`, que decide el
   alcance para las diez aplicaciones canónicas sin autorizar por nombre de
   aplicación;
5. `OPERATIONAL-ROLE-SITE-PHYSICAL-RECONCILIATION-001`, que registra el
   snapshot físico, la clasificación de los turnos observados y catorce
   brechas con propietario documental explícito.

Cobertura materializada:

| Elemento                                                 | Cantidad |
| -------------------------------------------------------- | -------: |
| Código público canónico                                  |        1 |
| Estado HTTP no navegacional                              | 1, `403` |
| Causas internas admitidas                                |        3 |
| Escenarios con decisión explícita                        |       24 |
| Canales con respuesta explícita                          |       10 |
| Aplicaciones canónicas reconciliadas                     |       10 |
| Permisos canónicos evaluados por carril                  |      112 |
| Permisos sin carril operativo                            |       54 |
| Permisos con carril operativo                            |       58 |
| Carriles operativos `T`                                  |       19 |
| Carriles operativos `T+C`                                |       39 |
| Roles operativos canónicos consumibles                   |       12 |
| Roles operativos físicos activos observados              |       13 |
| Sedes con habilitaciones activas observadas              |        5 |
| Habilitaciones físicas activas sede/área                 |       16 |
| Pares distintos sede–rol activos                         |       16 |
| Habilitaciones site-wide activas                         |        3 |
| Habilitaciones con área activa                           |       13 |
| Turnos laborales publicados no cancelados                |     2318 |
| Turnos clasificados como rol faltante                    |     1535 |
| Turnos con mapeo sede–área válido                        |      781 |
| Turnos con rol inválido para sede                        |        0 |
| Turnos con incompatibilidad de área                      |        2 |
| Pares con habilitación site-wide y específica simultánea |        0 |
| Brechas físicas registradas                              |       14 |
| Requisitos de prueba derivados                           |       10 |

Las cifras físicas son un snapshot de solo lectura. La ausencia de casos
positivos para esta razón no demuestra que el contrato esté implementado ni
permite crear datos productivos para fabricarlos.

---

#### 3. Identidad canónica del bloqueo

La identidad pública única es:

```text
reason_code = AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE
```

| Propiedad                                    | Valor                                                                                                       |
| -------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| Dominio                                      | `AUTHORIZATION_CONTEXT`                                                                                     |
| Estado público                               | `OPERATIONAL_ROLE_NOT_ENABLED_FOR_ACTIVE_SITE`                                                              |
| Decisión de carril                           | `DENY` para el carril operativo                                                                             |
| Decisión final                               | depende de la modalidad; nunca autoriza un carril operativo incompleto                                      |
| Estado HTTP cuando la decisión final deniega | `403 Forbidden`                                                                                             |
| `executable`                                 | `false` cuando no existe otro carril completo que autorice                                                  |
| Sesión de autenticación                      | se conserva                                                                                                 |
| Efectos empresariales                        | cero                                                                                                        |
| Reintento automático                         | prohibido                                                                                                   |
| Recuperación principal                       | corrección administrativa del turno o de la habilitación canónica; después, resolución de un contexto nuevo |
| Copy principal                               | `Tu rol operativo no está habilitado para esta sede. Solicita que revisen tu turno para continuar.`         |
| Causas internas públicas                     | ninguna                                                                                                     |

Quedan prohibidos como códigos públicos alternativos:

- `invalid_operational_role`;
- `role_not_allowed`;
- `site_role_invalid` sin namespace;
- `wrong_site`;
- `no_permission`;
- el código del rol;
- el código o nombre de la sede;
- mensajes libres usados como identidad contractual.

Una razón legacy podrá mapearse temporalmente como alias interno, pero no podrá
competir con la identidad pública canónica.

---

#### 4. Definición exacta de sede no habilitada

Existe sede no habilitada únicamente cuando:

```text
active_shift = exactly_one
AND
operational_role = PRESENT_CANONICAL_ACTIVE
AND
active_shift.site = PRESENT_ACTIVE_OPERATIONAL
AND
SITE_ROLE_ENABLEMENT_READ = SUCCESS
AND
active_enablement(role_code, active_shift.site_id) = NONE
```

La búsqueda de habilitación se realiza primero por el par exacto:

```text
role_code
+
active_shift.site_id
```

La ausencia de coincidencia de área no participa todavía. Si existe al menos
una habilitación activa para el rol en la sede, la evaluación de sede queda
satisfecha y la compatibilidad de área continúa en `AUTH-ERR-014`.

Estados diferenciados:

| Estado de la fuente   | Significado                                                        | Resultado propietario             |
| --------------------- | ------------------------------------------------------------------ | --------------------------------- |
| `CONCLUSIVE_ABSENT`   | no existe habilitación activa del rol para la sede                 | `AUTH-ERR-013`                    |
| `PRESENT_SITE_WIDE`   | existe habilitación activa para toda la sede                       | continuar a área, grant y recurso |
| `PRESENT_AREA_SCOPED` | existe una o más habilitaciones activas por área dentro de la sede | continuar a `AUTH-ERR-014`        |
| `INACTIVE_ONLY`       | solo existen relaciones retiradas o inactivas                      | `AUTH-ERR-013`                    |
| `CONTRADICTORY`       | la configuración no permite una resolución única                   | `AUTH-ERR-017`                    |
| `UNAVAILABLE`         | la fuente no pudo consultarse                                      | `AUTH-ERR-019`                    |

Una relación inactiva no concede autoridad y no podrá revivirse por caché,
historial o coincidencia textual.

---

#### 5. Fuentes autoritativas

El rol y la sede evaluados procederán de la misma revisión publicada:

```text
active_shift.operational_role_code
active_shift.site_id
```

La habilitación procederá del contrato canónico equivalente a:

```text
site_operational_roles
role_code = active_shift.operational_role_code
site_id   = active_shift.site_id
is_active = true
```

La implementación futura deberá además confirmar:

- existencia y actividad de la sede;
- carácter operativo de la sede;
- existencia y actividad del rol;
- vigencia de la habilitación en `resolved_at`;
- ausencia de contradicción estructural;
- pertenencia de cualquier área configurada a la misma sede.

No podrán sustituir estas fuentes:

- sede seleccionada en interfaz;
- sede primaria del empleado;
- sede del dispositivo;
- sede del check-in;
- última sede utilizada;
- sede recibida en query, body, cookie o header;
- nombre del rol;
- nombre del área;
- perfil operativo predeterminado;
- una coincidencia en otra sede;
- una coincidencia con el mismo `area_kind`;
- un grant de permiso;
- una heurística por aplicación.

---

#### 6. Separación entre asignación laboral y habilitación del rol

Estas condiciones son independientes:

```text
EMPLEADO ASIGNADO A SEDE
≠
ROL HABILITADO EN SEDE
```

```text
ROL HABILITADO EN SEDE
≠
PERMISO CONCEDIDO
```

```text
ROL HABILITADO EN SEDE
≠
ÁREA COMPATIBLE
```

Una asignación laboral válida no crea una habilitación de rol. Una
habilitación de rol no crea una asignación laboral. Un grant de permiso no
corrige ninguna de las dos.

La validación territorial completa conserva, como mínimo:

1. empleado habilitado para trabajar en el territorio;
2. turno vigente en la sede exacta;
3. rol canónico del turno;
4. rol habilitado en esa sede;
5. área compatible cuando aplique;
6. grant exacto del permiso;
7. recurso dentro del alcance.

---

#### 7. Catálogo operativo consumido

La tarea consume doce roles operativos canónicos:

- `cajero_satelite`;
- `barista_satelite`;
- `cocinero_satelite`;
- `servicio_salon`;
- `mostrador_satelite`;
- `operador_integral_satelite`;
- `produccion_cocina`;
- `produccion_panaderia`;
- `produccion_reposteria`;
- `bodeguero`;
- `conductor_logistica`;
- `gerencia_operativa`.

`propietario_admin` existe físicamente en el snapshot, pero no es un rol
operativo consumible por este contrato. Su presencia en un turno se tratará
como configuración inválida antes de evaluar sede.

El namespace operativo será explícito. Un código homónimo en el catálogo base
no habilita el rol para ninguna sede.

---

#### 8. Aplicabilidad por permiso y carril

La razón se evalúa únicamente cuando el permiso admite o exige carril
operativo.

| Distribución           | Cantidad | Evaluación de esta razón                                    |
| ---------------------- | -------: | ----------------------------------------------------------- |
| sin carril operativo   |       54 | no aplica                                                   |
| carril operativo `T`   |       19 | aplica después de turno, vigencia, rol y validez del código |
| carril operativo `T+C` |       39 | aplica además después del check-in requerido                |
| total de permisos      |      112 | reconciliado                                                |

No existe bloqueo global por aplicación. Una aplicación puede contener
capacidades base y operativas con decisiones distintas.

---

#### 9. Modalidades de autorización

| Modalidad              | Tratamiento de rol inválido para sede                                                     |
| ---------------------- | ----------------------------------------------------------------------------------------- |
| `BASE_ONLY`            | no se evalúa; el carril base conserva sus controles                                       |
| `OPERATIONAL_ONLY`     | el carril operativo queda `DENY`; la decisión final queda denegada                        |
| `BASE_OR_OPERATIONAL`  | el carril operativo queda `DENY`; un carril base completo e independiente puede autorizar |
| `BASE_AND_OPERATIONAL` | el carril operativo incompleto obliga a denegar la decisión final                         |

No se combinarán fragmentos:

```text
GRANT BASE
+
SEDE DEL TURNO
+
ROL NO HABILITADO
≠
ALLOW
```

Cada carril deberá producir una decisión completa por sí mismo.

---

#### 10. Precondiciones exactas

Antes de emitir esta razón deberán haberse resuelto concluyentemente:

1. autenticación;
2. actor efectivo;
3. empleado existente y activo;
4. aplicación y permiso activos;
5. modalidad y carril aplicables;
6. territorio laboral previo cuando corresponda;
7. turno laboral publicado, vigente, único y perteneciente al actor;
8. check-in válido cuando el carril sea `T+C`;
9. presencia del rol en el turno;
10. código canónico, activo y no deprecado;
11. sede exacta del turno existente, activa y operativa;
12. lectura exitosa de la habilitación sede–rol.

Si alguna precondición anterior falla, su razón propietaria prevalece.

---

#### 11. Causas internas admitidas

La identidad pública permanece única, pero la auditoría restringida podrá
clasificar:

| Causa interna                           | Condición                                                                           |
| --------------------------------------- | ----------------------------------------------------------------------------------- |
| `NO_ACTIVE_ENABLEMENT_FOR_SITE`         | nunca existió una relación activa para el par exacto en la revisión evaluada        |
| `ENABLEMENT_INACTIVE_OR_RETIRED`        | existen relaciones históricas, pero ninguna está activa en `resolved_at`            |
| `ENABLEMENT_NOT_EFFECTIVE_FOR_REVISION` | la relación existe, pero no pertenece a la versión o vigencia autoritativa evaluada |

Las causas internas no se serializan al cliente. Una contradicción entre
relaciones activas no pertenece a estas tres causas y deberá producir
configuración inválida.

---

#### 12. `OPERATIONAL-ROLE-SITE-BLOCKING-CONTRACT-001`

El contrato congelado exige:

1. identidad pública única;
2. evaluación por permiso, modalidad y carril;
3. rol y sede obtenidos del mismo turno;
4. habilitación exacta por código y sede;
5. separación de área, grant y recurso;
6. decisión fail closed;
7. sesión preservada;
8. cero efectos;
9. nueva decisión después de cualquier corrección;
10. copy accesible y no revelador;
11. auditoría restringida;
12. equivalencia entre canales y aplicaciones.

Un `ALLOW` previo, una sesión persistente o una pantalla ya abierta no
conservan autoridad después de retirar la habilitación.

---

#### 13. Frontera con rol faltante o inválido

| Estado del rol del turno                    | Propietario                            |
| ------------------------------------------- | -------------------------------------- |
| `null`, vacío u omitido                     | `AUTH-ERR-012`                         |
| presente, desconocido                       | configuración inválida; `AUTH-ERR-017` |
| presente, inactivo o deprecado              | configuración inválida; `AUTH-ERR-017` |
| canónico y activo, sin habilitación en sede | `AUTH-ERR-013`                         |
| canónico y activo, habilitado en sede       | continuar                              |

No se buscará un rol alternativo habilitado en la sede. La función del turno
no puede cambiarse durante autorización.

---

#### 14. Frontera con área

La evaluación de sede responde si el rol puede existir en esa sede. La
evaluación de área responde si puede operar en el área exacta del turno.

```text
EXISTE HABILITACIÓN ACTIVA DEL ROL EN LA SEDE
+
NO EXISTE COINCIDENCIA DE ÁREA
→
AUTH-ERR-014
```

```text
NO EXISTE NINGUNA HABILITACIÓN ACTIVA DEL ROL EN LA SEDE
→
AUTH-ERR-013
```

Una habilitación por otra área demuestra que el rol está admitido en la sede,
pero no autoriza el área actual. Por tanto, no se utilizará
`AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE` para ese caso.

---

#### 15. Frontera con sede inválida o no resoluble

Si `active_shift.site_id` es nulo, inexistente, inactivo, no operativo o
contradictorio, no existe una sede válida contra la cual evaluar la matriz.

Resultado:

```text
INVALID_OR_UNRESOLVED_ACTIVE_SITE
→
CONFIGURACIÓN O CONTEXTO INVÁLIDO
→
NO AUTH-ERR-013
```

El evaluador no podrá elegir la sede del check-in, del perfil o del cliente
para producir un diagnóstico aparentemente recuperable.

---

#### 16. Frontera con permisos

Un rol habilitado en sede no implica que posea el permiso solicitado.

```text
SITE_ROLE_ENABLEMENT = PRESENT
+
OPERATIONAL_GRANT = ABSENT
→
DENEGACIÓN DE PERMISO POSTERIOR
```

Un grant operativo existente para un rol no habilitado en la sede tampoco
corrige la relación territorial:

```text
OPERATIONAL_GRANT = PRESENT
+
SITE_ROLE_ENABLEMENT = ABSENT
→
AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE
```

La matriz territorial se evalúa antes del grant.

---

#### 17. Perfil operativo predeterminado

El perfil predeterminado puede sugerir un rol durante planificación, pero no
puede:

- reemplazar el rol del turno;
- añadir una habilitación a una sede;
- cambiar la sede del turno;
- seleccionar otra área;
- convertir una relación inactiva en activa;
- corregir el bloqueo durante la solicitud.

La corrección deberá persistirse por autoridad administrativa y producir una
nueva revisión consumible.

---

#### 18. Dispositivos compartidos y navegación

Un dispositivo puede declarar una plantilla o expectativa de navegación, pero
no presta autoridad territorial.

Queda prohibido:

- usar `navigation_role` como rol efectivo;
- usar la sede del dispositivo como sede del turno;
- conservar el rol del actor anterior;
- sustituir una habilitación faltante con una cookie;
- elegir un rol que sí esté habilitado en la sede;
- continuar una suscripción protegida iniciada por otro actor.

El actor real debe resolver su propio turno, rol, sede y habilitación.

---

#### 19. Simulación

Una simulación podrá evaluar hipotéticamente:

```text
role_code hipotético
+
site_id hipotético
+
matriz hipotética aprobada
→
WOULD_ALLOW o WOULD_DENY
```

No podrá:

- modificar el contexto real;
- convertir `WOULD_ALLOW` en autoridad;
- habilitar una mutación;
- persistir el rol en el turno;
- modificar la matriz;
- omitir el rol o la sede reales en auditoría de una operación real.

Cuando la simulación reproduzca este caso, el estado será informativo y
`executable = false`.

---

#### 20. Actor `SYSTEM`

Un actor `SYSTEM` autónomo no recibe rol laboral ni habilitación sede–rol.

Las automatizaciones deberán utilizar permisos técnicos explícitos y un
contrato de territorio propio. No se les asignará un rol operativo sintético
para superar esta razón.

Una operación delegada en nombre de un empleado conserva el empleado como
actor efectivo y evalúa el mismo turno, rol y sede.

---

#### 21. Entradas mínimas y determinismo

Las entradas mínimas son:

- actor efectivo;
- permiso, modalidad y prerrequisito;
- carril evaluado;
- turno publicado vigente y revisión;
- estado del check-in cuando aplique;
- rol operativo canónico del turno;
- sede exacta del turno;
- catálogo de roles;
- estado de la sede;
- conjunto de habilitaciones activas sede–rol;
- `resolved_at` de servidor;
- versiones contractuales y fingerprint.

Para las mismas entradas autoritativas deberá producirse exactamente el mismo
resultado. No participan el orden físico de filas, el primer registro devuelto,
la aplicación abierta, la sede seleccionada ni el estado local del cliente.

---

#### 22. `OPERATIONAL-ROLE-SITE-STATE-DECISION-MATRIX-001`

|    # | Escenario                                                               | Decisión                                                |
| ---: | ----------------------------------------------------------------------- | ------------------------------------------------------- |
|    1 | `BASE_ONLY`, sin turno, rol o sede                                      | no aplica; evaluar carril base                          |
|    2 | `BASE_OR_OPERATIONAL`, carril base completo y rol no habilitado en sede | `ALLOW` por base; carril operativo `DENY`               |
|    3 | sin turno publicado                                                     | `AUTH-ERR-009`                                          |
|    4 | turno publicado fuera de ventana                                        | `AUTH-ERR-010`                                          |
|    5 | carril `T+C`, check-in ausente                                          | `AUTH-ERR-011`                                          |
|    6 | turno vigente con rol ausente                                           | `AUTH-ERR-012`                                          |
|    7 | rol presente pero desconocido                                           | configuración inválida; no esta razón                   |
|    8 | rol presente pero inactivo o deprecado                                  | configuración inválida; no esta razón                   |
|    9 | sede del turno nula, inexistente o inactiva                             | configuración o contexto inválido; no esta razón        |
|   10 | rol canónico sin relación activa en la sede                             | `AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE`                |
|   11 | rol habilitado únicamente en otra sede                                  | `AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE`                |
|   12 | solo existe relación inactiva o retirada para la sede                   | `AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE`                |
|   13 | existe habilitación site-wide activa en la sede                         | continuar a área, grant y recurso                       |
|   14 | existe habilitación activa por el área exacta                           | continuar a grant y recurso                             |
|   15 | existe habilitación en la sede, pero solo para otra área                | `AUTH-ERR-014`                                          |
|   16 | el cliente propone una sede donde el rol sí está habilitado             | ignorar propuesta; evaluar sede del turno               |
|   17 | la sede seleccionada difiere de la sede del turno                       | no cambiar sede; aplicar razón propietaria del mismatch |
|   18 | check-in de otra sede                                                   | razón previa de check-in o contexto; no esta razón      |
|   19 | dispositivo posee rol o sede compatibles                                | ignorar plantilla; mantener decisión real               |
|   20 | perfil predeterminado tiene rol habilitado en otra sede                 | ignorar perfil; mantener decisión real                  |
|   21 | simulación hipotética sin habilitación de sede                          | `WOULD_DENY`; cero efectos                              |
|   22 | rol y sede válidos, pero grant ausente                                  | denegación de permiso posterior                         |
|   23 | habilitaciones contradictorias o revisión ambigua                       | `AUTH-ERR-017`                                          |
|   24 | fuente de matriz o catálogo no disponible                               | `AUTH-ERR-019`                                          |

La matriz conserva una decisión explícita para cada escenario y prohíbe
fallback territorial.

---

#### 23. Precedencia

El orden mínimo relevante permanece:

```text
AUTENTICACIÓN
→ IDENTIDAD LABORAL
→ ACCESO A APLICACIÓN
→ TERRITORIO LABORAL PREVIO APLICABLE
→ TURNO PUBLICADO
→ VIGENCIA TEMPORAL
→ CHECK-IN CUANDO T+C
→ PRESENCIA DEL ROL OPERATIVO
→ VALIDEZ DEL CÓDIGO
→ VALIDEZ DE LA SEDE DEL TURNO
→ HABILITACIÓN DEL ROL EN LA SEDE
→ COMPATIBILIDAD DE ÁREA
→ DISPOSITIVO Y SIMULACIÓN
→ GRANT DEL PERMISO
→ SCOPE Y RECURSO
```

La primera causa concluyente aplicable prevalece. `AUTH-ERR-013` no ocultará
un check-in faltante en `T+C`, un rol faltante ni una sede no resoluble. La
incompatibilidad de área no ocultará la ausencia total de habilitación en sede.

---

#### 24. Regla de cero efectos

Antes de cualquier efecto empresarial, el servidor deberá confirmar que el
rol operativo está habilitado para la sede exacta del turno.

Mientras la razón esté vigente quedan prohibidos:

- inserciones o actualizaciones empresariales;
- cambios de estado;
- movimientos de inventario;
- preparación, despacho o recepción;
- producción, caja o cierre operativo;
- impresión o emisión de documentos;
- eventos empresariales;
- jobs, colas o notificaciones derivados;
- suscripciones protegidas;
- reserva de recursos;
- auditoría de éxito.

Solo se permite registrar el intento denegado con minimización de datos.

---

#### 25. Envelope público

Cuando la decisión final sea denegada por esta causa, la respuesta compartida
representará como mínimo:

```json
{
  "decision": "DENY",
  "reason_code": "AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE",
  "public_state": "OPERATIONAL_ROLE_NOT_ENABLED_FOR_ACTIVE_SITE",
  "http_status": 403,
  "executable": false,
  "retryable": false,
  "session_preserved": true
}
```

No incluirá:

- código o nombre del rol;
- código o nombre de la sede;
- áreas donde sí estaría habilitado;
- rol esperado;
- turno o revisión;
- nombre del empleado;
- grants existentes;
- nombres físicos de tablas, funciones o políticas;
- causas internas.

---

#### 26. Copy, accesibilidad y recuperación

Copy principal exacto:

```text
Tu rol operativo no está habilitado para esta sede. Solicita que revisen tu turno para continuar.
```

La experiencia deberá:

- conservar la sesión;
- explicar que la operación está bloqueada por contexto, no por cuenta inactiva;
- no permitir cambiar sede o rol desde el cliente como recuperación;
- no revelar otras sedes donde el rol esté permitido;
- ofrecer un canal accesible de soporte cuando exista;
- anunciar el bloqueo mediante texto y semántica accesible;
- mantener vistas base independientes que sí estén autorizadas;
- no reintentar automáticamente sobre el mismo snapshot.

La recuperación autoritativa es:

```text
revisar turno y matriz
→ corregir la fuente propietaria
→ publicar o activar la revisión autorizada
→ invalidar snapshot anterior
→ resolver contexto nuevo
→ emitir solicitud nueva
```

---

#### 27. `OPERATIONAL-ROLE-SITE-CHANNEL-RESPONSE-MATRIX-001`

| Canal                           | Resultado obligatorio                                                                         |
| ------------------------------- | --------------------------------------------------------------------------------------------- |
| navegación web y guard          | bloquear la superficie operativa; conservar sesión y accesos base independientes              |
| Server Action                   | no ejecutar cuerpo ni efectos; devolver razón tipada                                          |
| Route Handler o API             | `403` con envelope canónico                                                                   |
| RSC o fetch de servidor         | no serializar datos protegidos; representar el estado tipado                                  |
| RPC o PostgREST                 | fail closed; distinguir sede de área y no reducirse a `false` sin diagnóstico contractual     |
| RLS o Data API                  | impedir lectura o mutación protegida y conservar correlación diagnóstica fuera de la política |
| Edge Function                   | revalidar rol, sede y habilitación; responder razón equivalente                               |
| Realtime                        | cancelar o negar suscripción protegida cuando la habilitación no existe o fue retirada        |
| cliente nativo u offline        | no usar matriz cacheada como autoridad; reautorizar en línea antes de ejecutar                |
| dispositivo compartido o kiosco | no sustituir rol o sede mediante plantilla, cookie ni actor anterior                          |

Los diez canales deberán producir la misma decisión semántica y cero efectos.

---

#### 28. Reintentos, concurrencia y frescura

Repetir la solicitud sobre el mismo snapshot no resuelve esta causa.

Invalidan la decisión anterior:

- publicación de un turno corregido;
- cambio del rol o de la sede del turno;
- activación, retiro o modificación de una habilitación sede–rol;
- activación o desactivación del rol;
- activación o desactivación de la sede;
- cambio de área;
- cambio de actor;
- entrada o salida de simulación;
- cambio de dispositivo compartido;
- fin del turno;
- nueva versión de catálogo o matriz.

Una operación iniciada con habilitación válida deberá revalidar antes del
commit cuando exista riesgo de retiro concurrente.

---

#### 29. Auditoría

El evento de denegación deberá registrar de forma restringida:

- identificador de correlación;
- actor efectivo;
- permiso, modalidad y carril;
- `shift_id` y revisión;
- identificadores internos del rol y sede;
- estado normalizado de la habilitación;
- causa interna;
- versiones del catálogo y matriz;
- `resolved_at`;
- fingerprint del contexto;
- aplicación y canal;
- decisión final;
- confirmación de cero efectos.

La telemetría pública no expondrá rol, sede, área, matriz ni causa interna. El
copy localizado no será identidad técnica.

---

#### 30. `OPERATIONAL-ROLE-SITE-APPLICATION-COVERAGE-REGISTER-001`

| Aplicación | Decisión                                                                                                              |
| ---------- | --------------------------------------------------------------------------------------------------------------------- |
| SHELL      | sus capacidades base no exigen matriz operativa; toda superficie operativa decide por permiso y turno                 |
| ANIMA      | acceso y asistencia base permanecen disponibles; marcar entrada no habilita el rol en una sede                        |
| AURA       | no recibe rol laboral ni sede operativa sintéticos para identidades de cliente o sistema                              |
| VISO       | planificación puede corregir turno o matriz mediante permisos base; una acción operativa consume la habilitación real |
| NEXO       | inventario y logística deben validar el par exacto del turno; cookies y overrides locales carecen de autoridad        |
| FOGO       | producción exige habilitación del rol en la sede del turno antes de evaluar área y orden                              |
| ORIGO      | compras administrativas permanecen separadas de recepción o ejecución operativa contextualizada                       |
| PULSO      | caja y operación presencial no pueden usar la terminal o sede seleccionada para sustituir la matriz                   |
| NUMERA     | administración base permanece independiente; cualquier operación contextualizada consume el mismo contrato            |
| PASS       | la identidad cliente no recibe ni presta rol operativo o sede laboral                                                 |

La aplicación no es la unidad de autorización. Cada fila obliga a consumir el
contrato por permiso, modalidad, actor y carril.

---

#### 31. Snapshot físico observado

El snapshot de solo lectura observó:

| Elemento físico                                          |        Resultado |
| -------------------------------------------------------- | ---------------: |
| `operational_roles`                                      | 13 filas activas |
| roles canónicos consumibles por este contrato            |               12 |
| sedes con habilitaciones activas                         |                5 |
| `site_operational_roles` activas                         |               16 |
| pares distintos sede–rol activos                         |               14 |
| habilitaciones site-wide activas                         |                3 |
| habilitaciones con área activa                           |               13 |
| pares con habilitación site-wide y específica simultánea |                0 |
| turnos laborales publicados no cancelados                |             2318 |
| turnos con rol faltante                                  |             1535 |
| turnos con rol presente                                  |              783 |
| turnos con mapeo sede–área válido                        |              781 |
| turnos con rol inválido para sede                        |                0 |
| turnos con incompatibilidad de área                      |                2 |
| códigos usados sin correspondencia de catálogo           |                0 |
| perfiles operativos activos con rol predeterminado       |                1 |
| grants operativos permitidos                             |               32 |

Los dos casos incompatibles pertenecen a `AUTH-ERR-014`: corresponden a
`operador_integral_satelite` en una sede donde el rol está habilitado, pero con
un área del turno sin coincidencia en la matriz observada.

---

#### 32. Matriz física observada

Las habilitaciones activas cubren, de forma resumida:

- `CENTRO_PROD`: `bodeguero`, `conductor_logistica`,
  `produccion_cocina`, `produccion_panaderia`, `produccion_reposteria`;
- `MOLKA_PRINCIPAL`: `operador_integral_satelite`;
- `SAUDO`: `barista_satelite`, `cajero_satelite`, `cocinero_satelite`,
  `servicio_salon`;
- `VENTO_CAFE`: `barista_satelite`, `cajero_satelite`,
  `cocinero_satelite`, `mostrador_satelite`, `servicio_salon`;
- `VENTO_GROUP`: `gerencia_operativa`.

Cada una de las dieciséis filas activas representa un par sede–rol distinto.
No se observaron pares con habilitación site-wide y específica simultáneas.
El índice único físico por `site_id` y `role_code` impide que un mismo rol se
configure en varias áreas de una sede, por lo que la cardinalidad territorial
futura deberá reconciliarse con el contrato de área antes de cualquier cambio.

---

#### 33. Comportamiento físico observado

El resolver físico actual:

- toma el rol desde el turno;
- busca una fila que coincida simultáneamente con rol, sede y área;
- emite `invalid_operational_role` tanto por rol faltante como por sede o área;
- utiliza `limit 1` sin demostrar unicidad del turno;
- puede calcular la sede activa mediante valores seleccionados, check-in o
  defaults antes de la decisión;
- permite bypass por nombres de roles administrativos;
- aplica políticas por aplicación en vez de prerrequisitos por permiso;
- no expone un estado público específico para esta tarea.

Los evaluadores físicos de permiso repiten validaciones con condiciones que
pueden considerar compatible un área nula. Un evaluador auxiliar acepta un rol
suministrado por el llamador. El contexto efectivo de dispositivo puede usar
`navigation_role`, y el consumidor NEXO observado puede modificar rol y área
mediante cookie antes de construir el mensaje de bloqueo.

---

#### 34. `OPERATIONAL-ROLE-SITE-PHYSICAL-RECONCILIATION-001`

|    # | Brecha física                                                                            | Estado                   | Destino de cierre                                                           |
| ---: | ---------------------------------------------------------------------------------------- | ------------------------ | --------------------------------------------------------------------------- |
|    1 | razón legacy agrupa rol faltante, sede y área                                            | `BLOQUEADO`              | `AUTH-DB-034`; catálogo y evaluador tipado                                  |
|    2 | la consulta física combina sede y área en un mismo `exists`                              | `BLOQUEADO`              | `AUTH-DB-033`; resolver por etapas                                          |
|    3 | la matriz física no contiene versión o vigencia contractual explícita                    | `BLOQUEADO`              | `AUTH-DB-020`; `AUTH-DB-030`                                                |
|    4 | la foreign key de rol en la matriz permanece `NOT VALID`                                 | `BLOQUEADO`              | `AUTH-DB-020`; validación compatible                                        |
|    5 | el índice único por sede y rol impide habilitar el mismo rol en varias áreas de una sede | `BLOQUEADO`              | reconciliar cardinalidad y compatibilidad en `AUTH-DB-020`; `AUTH-DB-033`   |
|    6 | selección del turno mediante `limit 1` no prueba unicidad                                | `BLOQUEADO`              | `AUTH-DB-033`                                                               |
|    7 | la sede activa puede derivarse de selección, check-in o default                          | `BLOQUEADO`              | `AUTH-DB-033`; consumir sede exacta del turno                               |
|    8 | existe bypass por nombre de rol administrativo                                           | `BLOQUEADO`              | `AUTH-DB-034`; permisos explícitos                                          |
|    9 | el chequeo de área en permisos admite casos nulos de forma permisiva                     | `BLOQUEADO`              | `AUTH-DB-034`; contrato de área de `AUTH-ERR-014`                           |
|   10 | un evaluador acepta `role_code` suministrado por el llamador                             | `BLOQUEADO`              | `AUTH-DB-034`; actor y contexto autoritativos                               |
|   11 | el contexto de dispositivo usa `navigation_role` como rol efectivo                       | `BLOQUEADO`              | `SHELL-AUTH-004`                                                            |
|   12 | NEXO puede mutar rol y área desde cookie y primera coincidencia                          | `BLOQUEADO`              | `SHELL-AUTH-005`                                                            |
|   13 | no existen casos físicos positivos actuales de rol inválido para sede                    | `PENDIENTE_DE_EVIDENCIA` | fixtures sintéticos y pruebas en `SHELL-CI-016`; no crear datos productivos |
|   14 | consumidoras carecen de código, envelope y copy canónicos                                | `BLOQUEADO`              | `SHELL-AUTH-002`; `AUTH-ERR-020`                                            |

Ninguna brecha autoriza cambios físicos durante esta tarea documental.

---

#### 35. Handoff de implementación

La materialización futura deberá incluir, como mínimo:

1. contrato versionado de razón y envelope;
2. resolver único de turno, rol y sede sin fallbacks;
3. consulta separada de habilitación sede–rol y compatibilidad de área;
4. catálogo y matriz con versión, vigencia e integridad verificables;
5. detección determinista de duplicidad y contradicción;
6. evaluación por permiso, modalidad y carril;
7. retiro de bypasses por nombre y datos aportados por cliente;
8. adapters equivalentes para diez canales y diez aplicaciones;
9. fixtures sintéticos para caso positivo, relación inactiva, otra sede,
   contradicción y retiro concurrente;
10. pruebas contractuales, base de datos, RPC, RLS, integración, E2E y
    regresión;
11. observabilidad, invalidación, cero efectos y recuperación;
12. estrategia de compatibilidad y rollback para cambios de matriz.

Toda modificación de Supabase deberá originarse, versionarse, documentarse y
ejecutarse desde `vento-shell`.

---

#### 36. Requisitos de prueba derivados

Esta tarea crea diez requisitos:

- `TREQ-AUTH-249`;
- `TREQ-AUTH-250`;
- `TREQ-AUTH-251`;
- `TREQ-AUTH-252`;
- `TREQ-AUTH-253`;
- `TREQ-AUTH-254`;
- `TREQ-AUTH-255`;
- `TREQ-AUTH-256`;
- `TREQ-AUTH-257`;
- `TREQ-AUTH-258`.

Los diez quedan en estado `IDENTIFICADO`. La definición documental no equivale
a implementación ni a evidencia de ejecución.

---

#### 37. Validaciones documentales definidas

La implementación deberá probar al menos:

1. código, estado, `403`, decisión de carril y cero efectos;
2. aplicación exclusiva a los 58 carriles operativos;
3. no afectación de los 54 permisos sin carril operativo;
4. independencia de `BASE_OR_OPERATIONAL`;
5. par exacto de rol y sede del turno;
6. relación inexistente, inactiva y retirada;
7. rol habilitado únicamente en otra sede;
8. separación de sede y área;
9. separación de grant faltante;
10. prohibición de fallback desde selección, perfil, check-in, dispositivo,
    cookie, cliente o historial;
11. precedencia con turno, check-in y rol faltante;
12. equivalencia de diez canales;
13. decisión explícita para diez aplicaciones;
14. invalidación por cambio de turno, sede, rol, catálogo o matriz;
15. auditoría minimizada y cero efectos;
16. copy, privacidad, accesibilidad y recuperación;
17. cardinalidad, unicidad y cobertura de habilitaciones por sede y área;
18. no creación de rol o sede para actores `SYSTEM`;
19. simulación no ejecutable;
20. reconciliación de las catorce brechas físicas.

---

#### 38. Evidencia y estados

| Resultado                          | Estado al cerrar esta tarea                                   |
| ---------------------------------- | ------------------------------------------------------------- |
| contrato documental                | `ESPECIFICADO`                                                |
| matriz de veinticuatro escenarios  | `ESPECIFICADO`                                                |
| matriz de diez canales             | `ESPECIFICADO`                                                |
| cobertura de diez aplicaciones     | `ESPECIFICADO`                                                |
| snapshot físico                    | `PENDIENTE_DE_EVIDENCIA` para certificación de implementación |
| casos físicos positivos observados | `0`; no equivalen a validación                                |
| migraciones o ajustes de datos     | `NO_APLICA` en esta fase documental                           |
| código compartido y adapters       | `NO_APLICA` en esta fase documental                           |
| pruebas automatizadas              | `PENDIENTE_DE_EVIDENCIA`                                      |
| validación operativa               | `PENDIENTE_DE_EVIDENCIA`                                      |

No se presenta ninguna brecha física como implementada o validada.

---

#### 39. Fuera del alcance

Esta tarea no:

- corrige turnos;
- crea o activa habilitaciones;
- cambia sedes, áreas o roles;
- modifica grants;
- completa datos históricos;
- crea migraciones;
- valida constraints físicas;
- edita aplicaciones;
- implementa SDK;
- despliega funciones;
- ejecuta DDL, DML o backfills;
- crea datos productivos para pruebas;
- inicia `AUTH-ERR-014`.

---

#### 40. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. existe una sola identidad pública;
2. la sede no habilitada está definida por ausencia concluyente del par exacto;
3. rol y sede proceden de la misma revisión publicada;
4. se prohíben fallbacks de cliente, perfil, check-in y dispositivo;
5. asignación laboral, habilitación, área y grant permanecen separados;
6. los 112 permisos se reconcilian en distribución 54/19/39;
7. los 58 carriles operativos evalúan la habilitación;
8. las cuatro modalidades tienen decisión explícita;
9. la precedencia aprobada permanece inalterada;
10. rol faltante queda en `AUTH-ERR-012`;
11. incompatibilidad de área queda en `AUTH-ERR-014`;
12. contradicción e indisponibilidad conservan razones diferentes;
13. veinticuatro escenarios tienen resultado;
14. diez canales tienen respuesta equivalente;
15. diez aplicaciones tienen decisión explícita;
16. copy, privacidad, accesibilidad y recuperación están definidos;
17. se exige cero efectos y contexto nuevo;
18. el snapshot físico declara cero casos positivos sin confundirlo con prueba;
19. catorce brechas poseen estado y destino;
20. diez requisitos `TREQ-*` están derivados;
21. la siguiente tarea permanece únicamente reservada.

---

#### 41. Riesgos controlados

La tarea controla:

- rol válido usado en una sede no habilitada;
- búsqueda de una sede alternativa más permisiva;
- sustitución por sede seleccionada o check-in;
- grant interpretado como habilitación territorial;
- área incompatible presentada como sede inválida;
- bypass por nombre de administrador;
- rol o sede prestados por dispositivo;
- override mediante cookie o cliente;
- decisión no determinista por `limit 1`;
- relación retirada conservada por caché;
- divergencia entre RPC, RLS, API y UI;
- mensaje genérico sin recuperación;
- exposición de rol, sede o matriz;
- efectos parciales antes del deny;
- pruebas productivas inventadas por ausencia de casos actuales.

---

#### 42. Cierre de tarea y continuidad

```text
ÚLTIMA TAREA APROBADA
AUTH-ERR-012 — Rol operativo faltante

TAREA ACTUAL APROBADA
AUTH-ERR-013 — Rol operativo inválido para la sede

SIGUIENTE TAREA RESERVADA
AUTH-ERR-014 — Rol operativo inválido para el área
```

No se inicia ni modifica `AUTH-ERR-014` en esta tarea.


### ✅ AUTH-ERR-014 — Rol operativo inválido para el área

**Estado:** APROBADA
**Tarea anterior:** `AUTH-ERR-013 — Rol operativo inválido para la sede` — APROBADA
**Tarea siguiente:** `AUTH-ERR-015 — Dispositivo no autorizado` — RESERVADA
**Tipo de tarea:** documental; definición contractual, causal, funcional, territorial, de seguridad y experiencia del bloqueo producido cuando una capacidad necesita carril operativo, el rol operativo canónico del turno está habilitado en su sede, pero no existe una habilitación activa y concluyente para el área exacta del mismo turno

---

#### 1. Propósito

Definir de forma única, segura y verificable qué debe ocurrir cuando una
solicitud necesita participar en el carril operativo, ya superó los controles
anteriores aplicables, consume exactamente un turno laboral publicado y
vigente, contiene un rol operativo canónico y activo, resuelve una sede y un
área operativas válidas desde esa misma revisión, encuentra al menos una
habilitación activa del rol dentro de la sede, pero no encuentra una
habilitación site-wide ni una habilitación activa para el área exacta del
turno.

La regla raíz queda:

```text
SESIÓN AUTENTICADA VÁLIDA
+
IDENTIDAD LABORAL ACTIVA
+
ACCESO A LA APLICACIÓN PERMITIDO
+
CAPACIDAD CON CARRIL OPERATIVO APLICABLE
+
TURNO LABORAL PUBLICADO Y VIGENTE INEQUÍVOCO
+
CHECK-IN VÁLIDO CUANDO EL CARRIL EXIGE T+C
+
ROL OPERATIVO PRESENTE, CANÓNICO Y ACTIVO
+
SEDE EXACTA DEL TURNO VÁLIDA Y OPERATIVA
+
SITE_ROLE_ENABLEMENT = PRESENT_AREA_SCOPED
+
ÁREA EXACTA DEL TURNO PRESENTE, ACTIVA Y PERTENECIENTE A LA SEDE
+
SITE_WIDE_ENABLEMENT = ABSENT
+
EXACT_AREA_ENABLEMENT = CONCLUSIVE_ABSENT
→
DENY DEL CARRIL OPERATIVO
+
AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA
+
403 CUANDO LA DECISIÓN FINAL QUEDA DENEGADA
+
CERO EFECTOS
```

La tarea responde exclusivamente:

```text
¿EL ROL OPERATIVO CANÓNICO DEL TURNO ESTÁ HABILITADO
EN LA SEDE, PERO NO PARA EL ÁREA EXACTA DE ESE MISMO TURNO?
```

No responde:

```text
¿EXISTE SESIÓN DE AUTENTICACIÓN?
¿EL EMPLEADO ESTÁ ACTIVO?
¿EXISTE UN TURNO PUBLICADO Y VIGENTE?
¿EXISTE CHECK-IN CUANDO ES REQUERIDO?
¿EL TURNO CONTIENE ROL OPERATIVO?
¿EL CÓDIGO DE ROL ES CANÓNICO Y ACTIVO?
¿LA SEDE DEL TURNO EXISTE Y ESTÁ ACTIVA?
¿EL ROL ESTÁ HABILITADO EN LA SEDE?
¿EL ÁREA DEL TURNO EXISTE, ESTÁ ACTIVA Y PERTENECE A LA SEDE?
¿EL ROL TIENE EL GRANT DEL PERMISO?
¿EL RECURSO PERTENECE AL TERRITORIO?
¿LA FUENTE TÉCNICA ESTÁ DISPONIBLE?
```

La ausencia limpia del rol pertenece a `AUTH-ERR-012`. La ausencia total de
habilitación del rol dentro de la sede pertenece a `AUTH-ERR-013`. Un área
nula, inexistente, inactiva, perteneciente a otra sede, ambigua o no resoluble
constituye contexto o configuración inválida y no se degradará a esta razón.

---

#### 2. Resultado material

Se aprueban cinco artefactos documentales completos:

1. `OPERATIONAL-ROLE-AREA-BLOCKING-CONTRACT-001`, que congela identidad
   pública, aplicabilidad, fuentes autoritativas, decisión, recuperación,
   privacidad, auditoría y cero efectos;
2. `OPERATIONAL-ROLE-AREA-STATE-DECISION-MATRIX-001`, que decide veinticuatro
   escenarios y separa área incompatible, sede no habilitada, área no
   resoluble, rol faltante, rol inválido, grant faltante, simulación e
   indisponibilidad;
3. `OPERATIONAL-ROLE-AREA-CHANNEL-RESPONSE-MATRIX-001`, que materializa diez
   canales con semántica equivalente;
4. `OPERATIONAL-ROLE-AREA-APPLICATION-COVERAGE-REGISTER-001`, que decide el
   alcance para las diez aplicaciones canónicas sin autorizar por nombre de
   aplicación;
5. `OPERATIONAL-ROLE-AREA-PHYSICAL-RECONCILIATION-001`, que registra el
   snapshot físico, los dos casos agregados observados y catorce brechas con
   destino documental explícito.

Cobertura materializada:

| Elemento                                              | Cantidad |
| ----------------------------------------------------- | -------: |
| Código público canónico                               |        1 |
| Estado HTTP no navegacional                           | 1, `403` |
| Causas internas admitidas                             |        3 |
| Escenarios con decisión explícita                     |       24 |
| Canales con respuesta explícita                       |       10 |
| Aplicaciones canónicas reconciliadas                  |       10 |
| Permisos canónicos evaluados por carril               |      112 |
| Permisos sin carril operativo                         |       54 |
| Permisos con carril operativo                         |       58 |
| Carriles operativos `T`                               |       19 |
| Carriles operativos `T+C`                             |       39 |
| Roles operativos canónicos consumibles                |       12 |
| Roles operativos físicos activos observados           |       13 |
| Sedes con habilitaciones activas observadas           |        5 |
| Habilitaciones físicas activas sede/área              |       16 |
| Pares distintos sede–rol activos                      |       16 |
| Habilitaciones site-wide activas                      |        3 |
| Habilitaciones con área activa                        |       13 |
| Turnos laborales publicados no cancelados             |     2318 |
| Turnos clasificados como rol faltante                 |     1535 |
| Turnos válidos por habilitación site-wide             |       23 |
| Turnos válidos por coincidencia de área exacta        |      758 |
| Turnos con rol inválido para sede                     |        0 |
| Turnos con rol inválido para área                     |        2 |
| Casos agregados distintos de incompatibilidad de área |        2 |
| Brechas físicas registradas                           |       14 |
| Requisitos de prueba derivados                        |       10 |

Las cifras físicas son un snapshot de solo lectura. Los dos casos observados no
certifican implementación del contrato, no autorizan exponer identidades de
trabajadores y no deberán corregirse mediante una mutación indiscriminada.

---

#### 3. Identidad canónica del bloqueo

La identidad pública única es:

```text
reason_code = AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA
```

| Propiedad                                    | Valor                                                                                                              |
| -------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| Dominio                                      | `AUTHORIZATION_CONTEXT`                                                                                            |
| Estado público                               | `OPERATIONAL_ROLE_NOT_ENABLED_FOR_ACTIVE_AREA`                                                                     |
| Decisión de carril                           | `DENY` para el carril operativo                                                                                    |
| Decisión final                               | depende de la modalidad; nunca autoriza un carril operativo territorialmente incompleto                            |
| Estado HTTP cuando la decisión final deniega | `403 Forbidden`                                                                                                    |
| `executable`                                 | `false` cuando no existe otro carril completo que autorice                                                         |
| Sesión de autenticación                      | se conserva                                                                                                        |
| Efectos empresariales                        | cero                                                                                                               |
| Reintento automático                         | prohibido                                                                                                          |
| Recuperación principal                       | corrección administrativa del turno o de la matriz territorial; después, resolución de contexto y solicitud nuevas |
| Copy principal                               | `Tu rol operativo no está habilitado para esta área. Solicita que revisen tu turno para continuar.`                |
| Causas internas públicas                     | ninguna                                                                                                            |

Quedan prohibidos como códigos públicos alternativos:

- `invalid_operational_role`;
- `invalid_area`;
- `wrong_area`;
- `role_not_allowed`;
- `area_role_invalid` sin namespace;
- `no_permission`;
- el código del rol;
- el código o nombre del área;
- mensajes libres usados como identidad contractual.

Una razón legacy podrá mapearse temporalmente como alias interno, pero no podrá
competir con la identidad pública canónica.

---

#### 4. Definición exacta de área no habilitada

Existe área no habilitada únicamente cuando:

```text
active_shift = exactly_one
AND
operational_role = PRESENT_CANONICAL_ACTIVE
AND
active_shift.site = PRESENT_ACTIVE_OPERATIONAL
AND
active_enablement(role_code, active_shift.site_id) = ONE_OR_MORE
AND
active_shift.area = PRESENT_ACTIVE_AND_BELONGS_TO_SHIFT_SITE
AND
SITE_ROLE_ENABLEMENT_READ = SUCCESS
AND
SITE_WIDE_ENABLEMENT = NONE
AND
EXACT_AREA_ENABLEMENT(role_code, site_id, area_id) = NONE
```

La búsqueda territorial deberá realizarse por identidad estable:

```text
active_shift.operational_role_code
+
active_shift.site_id
+
active_shift.area_id
```

No se autorizará por coincidencia de nombre, `kind`, etiqueta, posición,
jerarquía visual o primera fila devuelta.

Estados diferenciados:

| Estado de la fuente          | Significado                                                                                                                | Resultado propietario       |
| ---------------------------- | -------------------------------------------------------------------------------------------------------------------------- | --------------------------- |
| `PRESENT_SITE_WIDE`          | el rol está habilitado para toda la sede                                                                                   | continuar a grant y recurso |
| `PRESENT_EXACT_AREA`         | existe relación activa para el área exacta                                                                                 | continuar a grant y recurso |
| `PRESENT_OTHER_AREA_ONLY`    | el rol está habilitado en la sede, pero solo en otra área                                                                  | `AUTH-ERR-014`              |
| `INACTIVE_EXACT_AREA_ONLY`   | la coincidencia exacta existe, pero está retirada o inactiva, y otra relación activa mantiene habilitado el rol en la sede | `AUTH-ERR-014`              |
| `NO_SITE_ENABLEMENT`         | no existe ninguna relación activa del rol en la sede                                                                       | `AUTH-ERR-013`              |
| `INVALID_OR_UNRESOLVED_AREA` | área nula, inexistente, inactiva, ajena a la sede o ambigua                                                                | `AUTH-ERR-017`              |
| `CONTRADICTORY`              | configuración mixta o revisiones incompatibles impiden decisión única                                                      | `AUTH-ERR-017`              |
| `UNAVAILABLE`                | la fuente no pudo consultarse                                                                                              | `AUTH-ERR-019`              |

Una relación retirada no concede autoridad y no podrá revivirse por caché,
historial, equivalencia semántica ni coincidencia textual.

---

#### 5. Fuentes autoritativas de rol, sede y área

El rol, la sede y el área evaluados procederán de la misma revisión publicada:

```text
active_shift.operational_role_code
active_shift.site_id
active_shift.area_id
```

La habilitación procederá del contrato canónico equivalente a:

```text
site_operational_roles
role_code = active_shift.operational_role_code
site_id   = active_shift.site_id
is_active = true
```

La compatibilidad exacta se resuelve así:

```text
area_id IS NULL
→ habilitación site-wide

area_id = active_shift.area_id
→ habilitación exacta

area_id distinto
→ no habilita el área del turno
```

La implementación futura deberá además confirmar:

- existencia y actividad del área;
- pertenencia del área a la sede exacta del turno;
- existencia y actividad de la sede y del rol;
- vigencia de la relación en `resolved_at`;
- ausencia de contradicción estructural;
- versión reproducible de turno, catálogo y matriz.

No podrán sustituir estas fuentes:

- área del check-in;
- área seleccionada en interfaz;
- área primaria o preferida del trabajador;
- área del dispositivo;
- última área utilizada;
- área recibida en query, body, cookie o header;
- primera área de la sede;
- un área con el mismo `kind`;
- un área con el mismo nombre;
- perfil operativo predeterminado;
- una coincidencia del rol en otra sede;
- un grant de permiso;
- una heurística por aplicación.

---

#### 6. Separación entre asignación, habilitación y grant

Estas condiciones son independientes:

```text
EMPLEADO ASIGNADO A UN ÁREA
≠
ROL HABILITADO EN ESA ÁREA
```

```text
ROL HABILITADO EN LA SEDE
≠
ROL HABILITADO EN EL ÁREA
```

```text
ROL HABILITADO EN EL ÁREA
≠
PERMISO CONCEDIDO
```

```text
PERMISO CONCEDIDO
≠
RECURSO DENTRO DEL SCOPE
```

Una asignación laboral válida no crea una habilitación del rol. Una
habilitación site-wide autoriza el gate territorial de área, pero no concede el
grant ni amplía el scope del recurso. Un grant no corrige un área incompatible.

La validación territorial completa conserva, como mínimo:

1. empleado habilitado para trabajar en el territorio;
2. turno vigente en la sede y área exactas;
3. rol canónico del turno;
4. rol habilitado en la sede;
5. habilitación site-wide o coincidencia de área exacta;
6. grant exacto del permiso;
7. recurso dentro del alcance.

---

#### 7. Matriz territorial consumida

La matriz deberá admitir dos modalidades explícitas:

| Modalidad     | Representación                                      | Efecto                                                                  |
| ------------- | --------------------------------------------------- | ----------------------------------------------------------------------- |
| `SITE_WIDE`   | relación activa con `area_id = null`                | el gate de área queda satisfecho para cualquier área válida de esa sede |
| `AREA_SCOPED` | una o más relaciones activas con `area_id` concreto | solo las áreas exactas relacionadas satisfacen el gate                  |

La ausencia de un campo explícito de modalidad no autoriza inferencias
contradictorias. La implementación deberá normalizar la modalidad y validar su
integridad.

Para un mismo par `site_id + role_code` queda prohibida una configuración
activa simultánea `SITE_WIDE + AREA_SCOPED` sin una regla contractual versionada
que elimine la ambigüedad. Mientras dicha mezcla no esté aprobada, se tratará
como `CONTRADICTORY` y pertenecerá a `AUTH-ERR-017`.

La modalidad `AREA_SCOPED` deberá poder representar más de un área para el
mismo rol dentro de una sede. El orden físico de filas no participa en la
decisión.

---

#### 8. Aplicabilidad por permiso y carril

La razón se evalúa únicamente si el permiso admite o exige carril operativo.

| Clasificación                 | Cantidad | Efecto ante área incompatible                                  |
| ----------------------------- | -------: | -------------------------------------------------------------- |
| permisos sin carril operativo |       54 | no evalúan esta razón                                          |
| carriles operativos `T`       |       19 | evalúan área después de turno, rol y sede                      |
| carriles operativos `T+C`     |       39 | evalúan área después de turno, check-in, rol y sede            |
| total con carril operativo    |       58 | el carril operativo queda denegado si el área no es compatible |

Ninguna aplicación podrá convertir todos sus permisos en una única política de
área. La unidad de decisión continúa siendo el permiso, su modalidad y el
carril evaluado.

---

#### 9. Modalidades de autorización

##### `BASE_ONLY`

No consume rol ni área operativos. La incompatibilidad de área no produce esta
razón.

##### `OPERATIONAL_ONLY`

El área incompatible deniega la decisión final porque el único carril admitido
está incompleto.

##### `BASE_OR_OPERATIONAL`

Los carriles se evalúan de forma independiente:

```text
BASE_ALLOW completo
+
ÁREA OPERATIVA INCOMPATIBLE
→ ALLOW por carril base
→ carril operativo DENY
```

```text
BASE_DENY
+
ÁREA OPERATIVA INCOMPATIBLE
→ DENY final
→ AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA
```

##### `BASE_AND_OPERATIONAL`

La incompatibilidad de área deniega la decisión final aunque el carril base sea
válido. No se combinan fragmentos incompletos.

---

#### 10. Precondiciones exactas

Antes de producir esta razón deberán haberse resuelto:

1. sesión y actor efectivo;
2. actividad laboral;
3. aplicación solicitada;
4. permiso y modalidad;
5. selección del carril operativo;
6. turno publicado;
7. vigencia temporal del turno;
8. check-in cuando el carril es `T+C`;
9. presencia y validez del rol;
10. existencia, actividad y carácter operativo de la sede del turno;
11. al menos una habilitación activa del rol dentro de esa sede;
12. existencia, actividad y pertenencia del área del turno a esa sede;
13. lectura concluyente de la matriz territorial.

Para un carril `T`, la evaluación de área ocurre después de la vigencia, rol y
sede, sin exigir check-in.

Para un carril `T+C`, la evaluación ocurre después de confirmar el check-in
activo compatible. El check-in no crea, sustituye ni corrige el área del turno.

---

#### 11. Causas internas admitidas

Se admiten exactamente tres causas internas para esta identidad pública:

| Causa interna                          | Condición                                                                                                      |
| -------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `ROLE_ENABLED_ONLY_IN_OTHER_AREA`      | existen relaciones activas del rol en la sede, pero ninguna corresponde al área exacta del turno               |
| `EXACT_AREA_ENABLEMENT_INACTIVE`       | existe relación exacta retirada o inactiva y otra relación activa mantiene al rol habilitado dentro de la sede |
| `AREA_SCOPED_ROLE_WITHOUT_EXACT_MATCH` | la modalidad resuelta es `AREA_SCOPED`, el área es válida y la lectura concluye sin coincidencia exacta        |

Estas causas podrán registrarse en auditoría restringida. No se expondrán al
usuario ni cambiarán el código público.

No pertenecen a esta identidad:

- rol faltante;
- código desconocido, inactivo o deprecado;
- ausencia total de habilitación del rol en la sede;
- área nula, inexistente, inactiva o de otra sede;
- configuración mixta o contradictoria;
- múltiples turnos o revisiones candidatas;
- grant faltante;
- fallo de catálogo, matriz o base de datos.

---

#### 12. `OPERATIONAL-ROLE-AREA-BLOCKING-CONTRACT-001`

El contrato queda:

```text
INPUT
  actor_effective
  requested_permission
  authorization_requirement
  selected_lane
  active_shift
  active_checkin_session
  operational_role
  active_site
  active_area
  site_role_enablements
  resolved_at
  contract_versions
  context_fingerprint

PRECONDITION
  selected_lane = OPERATIONAL
  active_shift = valid_published_current_shift
  checkin_requirement_satisfied = true
  operational_role = canonical_active
  active_site = valid_active_operational_site
  site_role_enablement = present
  active_area = valid_active_area_belonging_to_active_site
  enablement_read = conclusive
  site_wide_enablement = absent
  exact_area_enablement = absent

OUTPUT
  lane_decision = DENY
  reason_code = AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA
  public_state = OPERATIONAL_ROLE_NOT_ENABLED_FOR_ACTIVE_AREA
  executable = false for the operational lane
  side_effects = 0
  session_preserved = true
  automatic_retry = false
```

Si otro carril independiente produce `ALLOW`, la decisión final respetará la
modalidad sin presentar el bloqueo como denegación global.

---

#### 13. Frontera con rol faltante o inválido

| Estado del rol del turno       | Propietario                            |
| ------------------------------ | -------------------------------------- |
| `null`, vacío u omitido        | `AUTH-ERR-012`                         |
| presente, desconocido          | configuración inválida; `AUTH-ERR-017` |
| presente, inactivo o deprecado | configuración inválida; `AUTH-ERR-017` |
| canónico y activo              | continuar a sede y área                |

No se buscará un rol alternativo compatible con el área. La función del turno
no puede cambiarse durante autorización.

---

#### 14. Frontera con sede

La evaluación de sede responde si el rol puede existir dentro de la sede. La
evaluación de área responde dónde puede operar dentro de esa sede.

```text
NO EXISTE NINGUNA HABILITACIÓN ACTIVA DEL ROL EN LA SEDE
→
AUTH-ERR-013
```

```text
EXISTE AL MENOS UNA HABILITACIÓN ACTIVA DEL ROL EN LA SEDE
+
NO EXISTE HABILITACIÓN SITE-WIDE
+
NO EXISTE COINCIDENCIA DE ÁREA EXACTA
→
AUTH-ERR-014
```

Una habilitación por otra área demuestra que el rol está admitido en la sede,
pero no autoriza el área actual. No se utilizará
`AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE` para ese caso.

---

#### 15. Frontera con área inválida o no resoluble

Esta razón exige un área válida antes de evaluar compatibilidad. Los siguientes
casos no son “rol inválido para el área”:

| Estado del área                                   | Resultado                                           |
| ------------------------------------------------- | --------------------------------------------------- |
| `area_id = null` cuando el contrato necesita área | configuración o contexto inválido; `AUTH-ERR-017`   |
| identificador inexistente                         | configuración inválida; `AUTH-ERR-017`              |
| área inactiva o retirada                          | configuración inválida; `AUTH-ERR-017`              |
| área perteneciente a otra sede                    | contexto territorial contradictorio; `AUTH-ERR-017` |
| más de un área candidata                          | contexto contradictorio; `AUTH-ERR-017`             |
| lectura no disponible                             | `AUTH-ERR-019`                                      |

El evaluador no podrá elegir el área del check-in, del perfil, del dispositivo,
del cliente ni la primera área de la sede para producir un diagnóstico
aparentemente recuperable.

---

#### 16. Frontera con permisos y recursos

Un rol compatible con el área no implica que posea el permiso solicitado.

```text
AREA_COMPATIBILITY = ALLOW
+
OPERATIONAL_GRANT = ABSENT
→
DENEGACIÓN DE PERMISO POSTERIOR
```

Un grant existente para un rol incompatible con el área tampoco corrige la
relación territorial:

```text
OPERATIONAL_GRANT = PRESENT
+
AREA_COMPATIBILITY = DENY
→
AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA
```

Después de área y grant deberá validarse el scope del recurso. Un recurso de
otra sede, área o territorio no se presentará como incompatibilidad del rol si
el contexto laboral ya era válido.

---

#### 17. Perfil operativo predeterminado

El perfil predeterminado puede sugerir rol, sede o área durante planificación,
pero no puede:

- reemplazar el rol del turno;
- reemplazar la sede o el área del turno;
- añadir una habilitación territorial;
- elegir otra área donde el rol sí esté habilitado;
- convertir una relación inactiva en activa;
- corregir el bloqueo durante la solicitud.

La corrección deberá persistirse por autoridad administrativa y producir una
revisión nueva y consumible.

---

#### 18. Dispositivos compartidos y navegación

Un dispositivo puede declarar una plantilla de navegación, pero no presta
área ni autoridad territorial.

Queda prohibido:

- usar `navigation_role` como rol efectivo;
- usar el área o la sede del dispositivo como contexto del turno;
- conservar el área del actor anterior;
- sustituir una coincidencia faltante con una cookie;
- elegir automáticamente un área compatible;
- mutar el contexto en memoria para superar el gate;
- continuar una suscripción protegida iniciada por otro actor.

El actor real debe resolver su propio turno, rol, sede, área y habilitación.

---

#### 19. Simulación

Una simulación podrá evaluar hipotéticamente:

```text
role_code hipotético
+
site_id hipotético
+
area_id hipotético
+
matriz hipotética aprobada
→
WOULD_ALLOW o WOULD_DENY
```

No podrá:

- modificar el contexto real;
- convertir `WOULD_ALLOW` en autoridad;
- habilitar una mutación;
- persistir rol, sede o área en el turno;
- modificar la matriz;
- omitir el contexto real en auditoría de una operación real.

Cuando la simulación reproduzca este caso, el estado será informativo y
`executable = false`.

---

#### 20. Actor `SYSTEM`

Un actor `SYSTEM` autónomo no recibe área laboral ni habilitación de rol por
área.

Las automatizaciones deberán utilizar permisos técnicos explícitos y un
contrato de territorio propio. No se les asignará un área operativa sintética
para superar esta razón.

Una operación delegada en nombre de un empleado conserva el empleado como
actor efectivo y evalúa el mismo turno, rol, sede y área.

---

#### 21. Entradas mínimas y determinismo

Las entradas mínimas son:

- actor efectivo;
- permiso, modalidad y prerrequisito;
- carril evaluado;
- turno publicado vigente y revisión;
- estado del check-in cuando aplique;
- rol operativo canónico del turno;
- sede y área exactas del turno;
- catálogo de roles;
- estados de sede y área;
- relación área–sede;
- conjunto completo de habilitaciones activas del rol en la sede;
- modalidad territorial resuelta;
- `resolved_at` de servidor;
- versiones contractuales y fingerprint.

Para las mismas entradas autoritativas deberá producirse exactamente el mismo
resultado. No participan el orden físico de filas, el primer registro devuelto,
la aplicación abierta, el área seleccionada, el área del dispositivo ni el
estado local del cliente.

---

#### 22. `OPERATIONAL-ROLE-AREA-STATE-DECISION-MATRIX-001`

|    # | Escenario                                                                                     | Decisión                                                                                    |
| ---: | --------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
|    1 | `BASE_ONLY`, sin turno, rol, sede ni área                                                     | no aplica; evaluar carril base                                                              |
|    2 | `BASE_OR_OPERATIONAL`, carril base completo y área incompatible                               | `ALLOW` por base; carril operativo `DENY`                                                   |
|    3 | sin turno publicado                                                                           | `AUTH-ERR-009`                                                                              |
|    4 | turno publicado fuera de ventana                                                              | `AUTH-ERR-010`                                                                              |
|    5 | carril `T+C`, check-in ausente                                                                | `AUTH-ERR-011`                                                                              |
|    6 | turno vigente con rol ausente                                                                 | `AUTH-ERR-012`                                                                              |
|    7 | rol presente, pero desconocido, inactivo o deprecado                                          | configuración inválida; `AUTH-ERR-017`                                                      |
|    8 | sede del turno nula, inexistente o inactiva                                                   | configuración o contexto inválido; `AUTH-ERR-017`                                           |
|    9 | rol canónico sin ninguna relación activa en la sede                                           | `AUTH-ERR-013`                                                                              |
|   10 | existe habilitación site-wide activa y configuración no contradictoria                        | continuar a grant y recurso                                                                 |
|   11 | existe habilitación activa para el área exacta                                                | continuar a grant y recurso                                                                 |
|   12 | el rol está habilitado en la sede únicamente para otra área                                   | `AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA`                                                    |
|   13 | la relación exacta está inactiva y otra relación activa mantiene habilitado el rol en la sede | `AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA`                                                    |
|   14 | área del turno nula cuando la modalidad es `AREA_SCOPED`                                      | configuración o contexto inválido; `AUTH-ERR-017`                                           |
|   15 | área inexistente, inactiva o perteneciente a otra sede                                        | configuración o contexto inválido; `AUTH-ERR-017`                                           |
|   16 | cliente propone un área donde el rol sí está habilitado                                       | ignorar propuesta; mantener decisión del turno                                              |
|   17 | check-in contiene otra área                                                                   | razón previa de check-in o contexto; no sustituir área del turno                            |
|   18 | dispositivo o perfil contienen un área compatible                                             | ignorar fallback; mantener decisión real                                                    |
|   19 | mismo nombre o `area_kind`, identificador distinto                                            | no equivale; `AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA` si ambas áreas son válidas de la sede |
|   20 | configuración activa mezcla site-wide y area-scoped sin regla versionada                      | `AUTH-ERR-017`                                                                              |
|   21 | simulación hipotética con área incompatible                                                   | `WOULD_DENY`; cero efectos                                                                  |
|   22 | área compatible, pero grant ausente                                                           | denegación de permiso posterior                                                             |
|   23 | matriz, revisión o cardinalidad contradictoria                                                | `AUTH-ERR-017`                                                                              |
|   24 | fuente de catálogo, área o matriz no disponible                                               | `AUTH-ERR-019`                                                                              |

La matriz conserva una decisión explícita para cada escenario y prohíbe
fallback territorial.

---

#### 23. Precedencia

El orden mínimo relevante permanece:

```text
AUTENTICACIÓN
→ IDENTIDAD LABORAL
→ ACCESO A APLICACIÓN
→ TERRITORIO LABORAL PREVIO APLICABLE
→ TURNO PUBLICADO
→ VIGENCIA TEMPORAL
→ CHECK-IN CUANDO T+C
→ PRESENCIA DEL ROL OPERATIVO
→ VALIDEZ DEL CÓDIGO
→ VALIDEZ DE LA SEDE DEL TURNO
→ HABILITACIÓN DEL ROL EN LA SEDE
→ VALIDEZ Y PERTENENCIA DEL ÁREA DEL TURNO
→ COMPATIBILIDAD EXACTA DEL ROL CON EL ÁREA
→ DISPOSITIVO Y SIMULACIÓN
→ GRANT DEL PERMISO
→ SCOPE Y RECURSO
```

La primera causa concluyente aplicable prevalece. `AUTH-ERR-014` no ocultará
turno o check-in faltante, rol ausente o inválido, sede no resoluble, ausencia
total de habilitación en sede, área inválida, contradicción o indisponibilidad.

---

#### 24. Regla de cero efectos

Antes de cualquier efecto empresarial, el servidor deberá confirmar que el
rol operativo está habilitado site-wide o para el área exacta del turno.

Mientras la razón esté vigente quedan prohibidos:

- inserciones o actualizaciones empresariales;
- cambios de estado;
- movimientos de inventario;
- preparación, producción, despacho o recepción;
- operaciones de caja o cierre;
- impresión o emisión de documentos;
- eventos empresariales;
- jobs, colas o notificaciones derivados;
- suscripciones protegidas;
- reserva de recursos;
- auditoría de éxito.

Solo se permite registrar el intento denegado con minimización de datos.

---

#### 25. Envelope público

Cuando la decisión final sea denegada por esta causa, la respuesta compartida
representará como mínimo:

```json
{
  "decision": "DENY",
  "reason_code": "AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA",
  "public_state": "OPERATIONAL_ROLE_NOT_ENABLED_FOR_ACTIVE_AREA",
  "http_status": 403,
  "executable": false,
  "retryable": false,
  "session_preserved": true
}
```

No incluirá:

- código o nombre del rol;
- código o nombre de la sede o del área;
- áreas donde sí estaría habilitado;
- rol o área esperados;
- turno o revisión;
- nombre del empleado;
- grants existentes;
- nombres físicos de tablas, funciones o políticas;
- causas internas.

---

#### 26. Copy, accesibilidad y recuperación

Copy principal exacto:

```text
Tu rol operativo no está habilitado para esta área. Solicita que revisen tu turno para continuar.
```

La experiencia deberá:

- conservar la sesión;
- explicar que la operación está bloqueada por contexto, no por cuenta inactiva;
- no permitir cambiar área o rol desde el cliente como recuperación;
- no revelar otras áreas donde el rol esté permitido;
- ofrecer un canal accesible de soporte cuando exista;
- anunciar el bloqueo mediante texto y semántica accesible;
- mantener vistas base independientes que sí estén autorizadas;
- no reintentar automáticamente sobre el mismo snapshot.

La recuperación autoritativa es:

```text
revisar turno, área y matriz
→ corregir la fuente propietaria autorizada
→ publicar o activar la revisión aprobada
→ invalidar snapshot anterior
→ resolver contexto nuevo
→ emitir solicitud nueva
```

---

#### 27. `OPERATIONAL-ROLE-AREA-CHANNEL-RESPONSE-MATRIX-001`

| Canal                           | Resultado obligatorio                                                                                               |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| navegación web y guard          | bloquear la superficie operativa; conservar sesión y accesos base independientes                                    |
| Server Action                   | no ejecutar cuerpo ni efectos; devolver razón tipada                                                                |
| Route Handler o API             | `403` con envelope canónico                                                                                         |
| RSC o fetch de servidor         | no serializar datos protegidos; representar el estado tipado                                                        |
| RPC o PostgREST                 | fail closed; distinguir sede, área inválida y área incompatible; no reducirse a `false` sin diagnóstico contractual |
| RLS o Data API                  | impedir lectura o mutación protegida y conservar correlación diagnóstica fuera de la política                       |
| Edge Function                   | revalidar rol, sede, área y matriz; responder razón equivalente                                                     |
| Realtime                        | cancelar o negar suscripción protegida cuando la relación territorial no existe o fue retirada                      |
| cliente nativo u offline        | no usar área ni matriz cacheadas como autoridad; reautorizar en línea antes de ejecutar                             |
| dispositivo compartido o kiosco | no sustituir área mediante plantilla, cookie, selección ni actor anterior                                           |

Los diez canales deberán producir la misma decisión semántica y cero efectos.

---

#### 28. Reintentos, concurrencia y frescura

Repetir la solicitud sobre el mismo snapshot no resuelve esta causa.

Invalidan la decisión anterior:

- publicación de un turno corregido;
- cambio del rol, sede o área del turno;
- activación, retiro o modificación de una habilitación site-wide o por área;
- activación o desactivación del rol, sede o área;
- corrección de la pertenencia área–sede;
- cambio de actor;
- entrada o salida de simulación;
- cambio de dispositivo compartido;
- fin del turno;
- nueva versión de catálogo o matriz.

Una operación iniciada con área compatible deberá revalidar antes del commit
cuando exista riesgo de retiro concurrente, cambio de turno o transferencia de
actor.

---

#### 29. Auditoría

El evento de denegación deberá registrar de forma restringida:

- identificador de correlación;
- actor efectivo;
- permiso, modalidad y carril;
- `shift_id` y revisión;
- identificadores internos de rol, sede y área;
- modalidad territorial resuelta;
- estado normalizado de la coincidencia;
- causa interna;
- versiones del catálogo y matriz;
- `resolved_at`;
- fingerprint del contexto;
- aplicación y canal;
- decisión final;
- confirmación de cero efectos.

La telemetría pública no expondrá rol, sede, área, matriz ni causa interna. El
copy localizado no será identidad técnica.

---

#### 30. `OPERATIONAL-ROLE-AREA-APPLICATION-COVERAGE-REGISTER-001`

| Aplicación | Decisión                                                                                                                |
| ---------- | ----------------------------------------------------------------------------------------------------------------------- |
| SHELL      | sus capacidades base no exigen área operativa; toda superficie operativa decide por permiso, turno y territorio exacto  |
| ANIMA      | acceso y asistencia base permanecen disponibles; el check-in no puede sustituir ni corregir el área publicada del turno |
| AURA       | no recibe rol, sede ni área laborales sintéticos para identidades de cliente o sistema                                  |
| VISO       | planificación puede corregir turno o matriz mediante permisos base; una acción operativa consume el área real publicada |
| NEXO       | inventario y logística validan el área exacta; cookies, overrides y primera coincidencia local carecen de autoridad     |
| FOGO       | producción exige habilitación site-wide o coincidencia exacta antes de operar órdenes, estaciones o lotes               |
| ORIGO      | compras administrativas permanecen separadas de recepción o ejecución operativa contextualizada por área                |
| PULSO      | caja y operación presencial no pueden usar la terminal, ubicación o área seleccionada para sustituir el turno           |
| NUMERA     | administración base permanece independiente; cualquier operación contextualizada consume el mismo contrato territorial  |
| PASS       | la identidad cliente no recibe ni presta rol, sede o área laborales                                                     |

La aplicación no es la unidad de autorización. Cada fila obliga a consumir el
contrato por permiso, modalidad, actor y carril.

---

#### 31. Site-wide, area-scoped y operación multiárea

La habilitación site-wide satisface el gate de compatibilidad para cualquier
área válida perteneciente a la misma sede. No autoriza áreas inexistentes,
inactivas o de otra sede y no sustituye el scope del recurso.

La habilitación area-scoped exige coincidencia exacta por `area_id`. Un mismo
rol podrá necesitar varias áreas dentro de una sede; cada identidad autorizada
deberá estar materializada de forma explícita y versionable.

Quedan prohibidos:

- comparar solo `area_kind`;
- comparar nombres normalizados;
- heredar autorización desde áreas padre o hermanas sin contrato explícito;
- escoger una sola fila mediante `limit 1`;
- asumir que `area_id = null` en el turno significa site-wide;
- asumir que un área ausente elimina el requisito;
- interpretar la ubicación física del recurso como área laboral del actor.

El contrato de multiárea deberá conservar unicidad por identidad completa y no
por el par incompleto `site_id + role_code`.

---

#### 32. Snapshot físico observado

El snapshot de solo lectura observó:

| Elemento físico                               | Resultado |
| --------------------------------------------- | --------: |
| `operational_roles` activas                   |        13 |
| roles canónicos consumibles por este contrato |        12 |
| sedes con habilitaciones activas              |         5 |
| `site_operational_roles` activas              |        16 |
| pares distintos sede–rol activos              |        16 |
| habilitaciones site-wide activas              |         3 |
| habilitaciones con área activa                |        13 |
| turnos laborales publicados no cancelados     |      2318 |
| turnos con rol faltante                       |      1535 |
| turnos con rol presente                       |       783 |
| turnos válidos por habilitación site-wide     |        23 |
| turnos válidos por área exacta                |       758 |
| turnos con rol inválido para sede             |         0 |
| turnos con rol inválido para área             |         2 |
| casos agregados distintos de incompatibilidad |         2 |

Los conteos clasifican cada turno una sola vez. Los 23 casos site-wide y los
758 casos de área exacta suman los 781 turnos territorialmente compatibles
observados.

---

#### 33. Casos físicos agregados observados

Sin exponer identidades de trabajadores, los dos casos agregados son:

| Sede    | Rol del turno      | Área del turno          | Área activa observada para el rol | Turnos |
| ------- | ------------------ | ----------------------- | --------------------------------- | -----: |
| `SAUDO` | `barista_satelite` | `CAJA` (`caja`)         | `COCINA` (`cocina_bar`)           |      1 |
| `SAUDO` | `cajero_satelite`  | `COCINA` (`cocina_bar`) | `CAJA` (`caja`)                   |      1 |

Ambos casos satisfacen la frontera de esta tarea: el rol está habilitado dentro
de `SAUDO`, pero no existe relación site-wide ni coincidencia con el área
exacta del turno.

El snapshot no determina por sí solo si debe corregirse el turno, la matriz o
la planificación laboral. Esa decisión deberá tomarse mediante autoridad
administrativa, evidencia operativa y una revisión publicada; queda prohibido
realizar un backfill automático por semejanza de nombres o roles.

---

#### 34. Comportamiento físico observado

El resolver físico actual presenta estas conductas relevantes:

- combina rol, sede y área en una sola búsqueda y reduce fallos diferentes a
  `invalid_operational_role`;
- puede derivar sede o área desde check-in, selección o perfil antes de decidir;
- no valida de forma concluyente que el área esté activa y pertenezca a la sede
  del turno;
- selecciona turno mediante `limit 1` sin demostrar unicidad;
- permite bypass por nombres de roles administrativos;
- no expone un estado público específico para esta tarea.

El evaluador físico de permiso contiene una condición equivalente a:

```text
sor.area_id IS NULL
OR active_area_id IS NULL
OR sor.area_id = active_area_id
```

Por tanto, un área nula puede convertir una relación area-scoped en compatible,
lo que contradice el contrato fail closed.

El contexto efectivo de dispositivo puede derivar rol, sede o área desde
navegación o simulación. El consumidor NEXO observado puede modificar rol desde
cookie y, cuando falta área, seleccionar la primera área de la sede mediante
`limit(1)`.

---

#### 35. `OPERATIONAL-ROLE-AREA-PHYSICAL-RECONCILIATION-001`

|    # | Brecha física                                                                                                    | Estado                   | Destino de cierre                                                                                   |
| ---: | ---------------------------------------------------------------------------------------------------------------- | ------------------------ | --------------------------------------------------------------------------------------------------- |
|    1 | razón legacy agrupa rol faltante, sede y área                                                                    | `BLOQUEADO`              | `AUTH-DB-034`; catálogo y evaluador tipado                                                          |
|    2 | el resolver combina sede y área en un mismo `exists`                                                             | `BLOQUEADO`              | `AUTH-DB-033`; resolución territorial por etapas                                                    |
|    3 | el área efectiva puede priorizar check-in o valores seleccionados sobre el turno                                 | `BLOQUEADO`              | `AUTH-DB-033`; fuente única de revisión publicada                                                   |
|    4 | no existe validación cruzada concluyente de que `employee_shifts.area_id` pertenezca a `employee_shifts.site_id` | `BLOQUEADO`              | `AUTH-DB-020`; integridad territorial compatible                                                    |
|    5 | `site_operational_roles.area_id` carece de foreign key y de garantía cruzada con su sede                         | `BLOQUEADO`              | `AUTH-DB-020`; constraint y validación progresiva                                                   |
|    6 | el índice único por `site_id + role_code` impide varias áreas para un mismo rol en una sede                      | `BLOQUEADO`              | `AUTH-DB-020`; cardinalidad multiárea versionada                                                    |
|    7 | el catálogo físico no declara modalidad `SITE_WIDE` o `AREA_SCOPED`                                              | `BLOQUEADO`              | `AUTH-DB-030`; contrato explícito de alcance de área                                                |
|    8 | `has_operational_permission` considera compatible cualquier relación cuando el área resuelta es nula             | `BLOQUEADO`              | `AUTH-DB-034`; fail closed y razón tipada                                                           |
|    9 | el evaluador booleano no separa área inválida, incompatible, grant faltante ni indisponibilidad                  | `BLOQUEADO`              | `AUTH-DB-034`; envelope compartido                                                                  |
|   10 | existen bypasses por nombres de roles y valores suministrados por el llamador                                    | `BLOQUEADO`              | `AUTH-DB-034`; permisos y contexto autoritativos                                                    |
|   11 | `get_effective_context_v1` puede derivar rol, sede o área desde dispositivo o simulación                         | `BLOQUEADO`              | `SHELL-AUTH-004`; separación de autoridad real y contexto presentado                                |
|   12 | NEXO admite override por cookie y selecciona una primera área local mediante `limit(1)`                          | `BLOQUEADO`              | `SHELL-AUTH-005`; adapter canónico                                                                  |
|   13 | existen dos turnos productivos agregados con área incompatible y su corrección causal no está certificada        | `PENDIENTE_DE_EVIDENCIA` | revisión administrativa controlada y fixtures sintéticos en `SHELL-CI-016`; sin mutación automática |
|   14 | consumidoras carecen de código, envelope, copy, invalidación y pruebas canónicos                                 | `BLOQUEADO`              | `SHELL-AUTH-002`; `AUTH-ERR-020`; `SHELL-CI-016`; `SHELL-CI-018`; `SHELL-CI-019`                    |

Ninguna brecha autoriza cambios físicos durante esta tarea documental.

---

#### 36. Requisitos de prueba derivados

Esta tarea crea diez requisitos:

- `TREQ-AUTH-259`;
- `TREQ-AUTH-260`;
- `TREQ-AUTH-261`;
- `TREQ-AUTH-262`;
- `TREQ-AUTH-263`;
- `TREQ-AUTH-264`;
- `TREQ-AUTH-265`;
- `TREQ-AUTH-266`;
- `TREQ-AUTH-267`;
- `TREQ-AUTH-268`.

Los diez quedan en estado `IDENTIFICADO`. La definición documental no equivale
a implementación ni a evidencia de ejecución.

---

#### 37. Validaciones documentales definidas

La implementación deberá probar al menos:

1. código, estado, `403`, decisión de carril y cero efectos;
2. aplicación exclusiva a los 58 carriles operativos;
3. no afectación de los 54 permisos sin carril operativo;
4. independencia de `BASE_OR_OPERATIONAL`;
5. rol, sede y área tomados de la misma revisión publicada;
6. habilitación site-wide válida;
7. coincidencia de área exacta válida;
8. relación únicamente en otra área;
9. relación exacta inactiva o retirada;
10. ausencia total de habilitación en sede separada de área incompatible;
11. área nula, inexistente, inactiva o ajena a la sede separada de incompatibilidad;
12. prohibición de coincidencia por nombre, `kind` o primera fila;
13. prohibición de fallback desde check-in, perfil, dispositivo, cookie, cliente o historial;
14. precedencia con turno, check-in, rol y sede;
15. separación de grant y scope;
16. equivalencia de diez canales;
17. decisión explícita para diez aplicaciones;
18. invalidación y revalidación concurrente;
19. auditoría minimizada, copy y recuperación;
20. reconciliación de catorce brechas y dos casos físicos agregados.

---

#### 38. Evidencia y estados

| Resultado                         | Estado al cerrar esta tarea                                                  |
| --------------------------------- | ---------------------------------------------------------------------------- |
| contrato documental               | `ESPECIFICADO`                                                               |
| matriz de veinticuatro escenarios | `ESPECIFICADO`                                                               |
| matriz de diez canales            | `ESPECIFICADO`                                                               |
| cobertura de diez aplicaciones    | `ESPECIFICADO`                                                               |
| snapshot físico                   | `PENDIENTE_DE_EVIDENCIA` para certificación de implementación                |
| dos casos físicos agregados       | `IDENTIFICADO`; no equivalen a validación ni autorizan corrección automática |
| migraciones o ajustes de datos    | `NO_APLICA` en esta fase documental                                          |
| código compartido y adapters      | `NO_APLICA` en esta fase documental                                          |
| pruebas automatizadas             | `PENDIENTE_DE_EVIDENCIA`                                                     |
| validación operativa              | `PENDIENTE_DE_EVIDENCIA`                                                     |

No se presenta ninguna brecha física como implementada o validada.

---

#### 39. Fuera del alcance

Esta tarea no:

- corrige turnos productivos;
- crea, activa, retira o amplía habilitaciones;
- cambia sedes, áreas o roles;
- modifica grants;
- completa datos históricos;
- crea migraciones;
- valida constraints físicas;
- edita aplicaciones;
- implementa SDK;
- despliega funciones;
- ejecuta DDL, DML o backfills;
- crea datos productivos para pruebas;
- inicia `AUTH-ERR-015`.

---

#### 40. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. existe una sola identidad pública;
2. área no habilitada se define por ausencia concluyente de site-wide y del par exacto;
3. rol, sede y área proceden de la misma revisión publicada;
4. el área debe existir, estar activa y pertenecer a la sede antes de evaluar compatibilidad;
5. se prohíben fallbacks de cliente, perfil, check-in y dispositivo;
6. asignación, sede, área, habilitación, grant y scope permanecen separados;
7. los 112 permisos se reconcilian en distribución 54/19/39;
8. los 58 carriles operativos evalúan compatibilidad de área;
9. las cuatro modalidades tienen decisión explícita;
10. site-wide y area-scoped tienen semántica definida;
11. multiárea no depende del orden ni de una primera coincidencia;
12. rol faltante queda en `AUTH-ERR-012`;
13. ausencia de habilitación en sede queda en `AUTH-ERR-013`;
14. área inválida, contradicción e indisponibilidad conservan razones diferentes;
15. veinticuatro escenarios tienen resultado;
16. diez canales tienen respuesta equivalente;
17. diez aplicaciones tienen decisión explícita;
18. copy, privacidad, accesibilidad y recuperación están definidos;
19. se exige cero efectos y contexto nuevo;
20. snapshot físico reconcilia 23 casos site-wide, 758 exactos y 2 incompatibles;
21. catorce brechas poseen estado y destino;
22. diez requisitos `TREQ-*` están derivados;
23. la siguiente tarea permanece únicamente reservada.

---

#### 41. Riesgos controlados

La tarea controla:

- rol válido usado en un área no habilitada;
- área de otra función tomada por coincidencia de nombre o tipo;
- primera área seleccionada de forma no determinista;
- área nula tratada como permiso universal;
- check-in, cookie o dispositivo usados para sustituir el turno;
- grant interpretado como habilitación territorial;
- sede inválida presentada como área incompatible;
- área inválida presentada como incompatibilidad ordinaria;
- bypass por nombre de administrador;
- configuración multiárea imposible por cardinalidad física;
- relación retirada conservada por caché;
- divergencia entre RPC, RLS, API y UI;
- mensaje genérico sin recuperación;
- exposición de rol, sede, área o matriz;
- efectos parciales antes del deny;
- backfill productivo basado en inferencia.

---

#### 42. Cierre de tarea y continuidad

```text
ÚLTIMA TAREA APROBADA
AUTH-ERR-013 — Rol operativo inválido para la sede

TAREA ACTUAL APROBADA
AUTH-ERR-014 — Rol operativo inválido para el área

SIGUIENTE TAREA RESERVADA
AUTH-ERR-015 — Dispositivo no autorizado
```

No se inicia ni modifica `AUTH-ERR-015` en esta tarea.


### ✅ AUTH-ERR-015 — Dispositivo no autorizado

**Estado:** APROBADA
**Tarea anterior:** `AUTH-ERR-014 — Rol operativo inválido para el área` — APROBADA
**Tarea siguiente:** `AUTH-ERR-016 — Acción no permitida en simulación` — RESERVADA
**Tipo de tarea:** documental; definición contractual, causal, funcional, de seguridad, experiencia y reconciliación física del bloqueo producido cuando una solicitud procede de un principal de dispositivo compartido o intenta ejecutarse desde una instancia compartida y una restricción concluyente del dispositivo impide continuar

---

#### 1. Propósito

Definir de forma única, segura y verificable qué debe ocurrir cuando una
solicitud empresarial intenta utilizar un dispositivo compartido y, después de
resolver la sesión de autenticación y el tipo de principal, el servidor concluye
que la identidad técnica, la instancia, el estado, la configuración, la
aplicación, el paquete de capacidades, la política de actor, el territorio o el
soporte de seguridad del dispositivo no autorizan la solicitud.

La regla raíz queda:

```text
SESIÓN DE AUTENTICACIÓN VÁLIDA
+
PRINCIPAL = SHARED_DEVICE
+
SOLICITUD EMPRESARIAL O ACCESO A APLICACIÓN PROTEGIDA
+
RESTRICCIÓN CONCLUYENTE DEL DISPOSITIVO
→
DENY DE LA SOLICITUD DESDE ESE DISPOSITIVO
+
AUTH_SHARED_DEVICE_NOT_AUTHORIZED
+
403 CUANDO LA DECISIÓN FINAL QUEDA DENEGADA
+
SESIÓN TÉCNICA PRESERVADA O REVOCADA SEGÚN EL ESTADO DEL DISPOSITIVO
+
CERO EFECTOS EMPRESARIALES
```

La tarea responde exclusivamente:

```text
¿ESTE PRINCIPAL Y ESTA INSTANCIA COMPARTIDA PUEDEN PARTICIPAR
EN LA APLICACIÓN Y ACCIÓN SOLICITADAS BAJO SU CONFIGURACIÓN EFECTIVA?
```

No responde:

```text
¿EXISTE UNA SESIÓN DE AUTENTICACIÓN VÁLIDA?
¿FALTA IDENTIFICAR AL TRABAJADOR EN UN DISPOSITIVO VÁLIDO?
¿EL EMPLEADO ESTÁ ACTIVO?
¿EXISTE UN TURNO VIGENTE?
¿EXISTE CHECK-IN CUANDO ES REQUERIDO?
¿EL ROL OPERATIVO ESTÁ PRESENTE Y ES CANÓNICO?
¿EL ROL ES VÁLIDO PARA LA SEDE Y EL ÁREA?
¿EL ACTOR TIENE EL GRANT DEL PERMISO?
¿EL RECURSO ESTÁ DENTRO DEL ALCANCE?
¿LA ACCIÓN ESTÁ SIENDO SIMULADA?
¿LA FUENTE TÉCNICA ESTÁ TEMPORALMENTE INDISPONIBLE?
```

Un equipo físicamente compartido utilizado mediante una sesión personal
`HUMAN_USER` no produce esta razón por el solo hecho de ser una tablet, caja,
kiosco o computador de uso común. La clasificación depende del principal
resuelto en servidor.

---

#### 2. Resultado material

Se aprueban cinco artefactos documentales completos:

1. `SHARED-DEVICE-AUTHORIZATION-BLOCKING-CONTRACT-001`, que congela identidad
   pública, aplicabilidad, fuentes autoritativas, decisión, recuperación,
   privacidad, auditoría y cero efectos;
2. `SHARED-DEVICE-AUTHORIZATION-STATE-DECISION-MATRIX-001`, que decide
   veinticuatro escenarios y separa dispositivo no autorizado, actor no
   identificado, contexto laboral inválido, permiso faltante, simulación e
   indisponibilidad técnica;
3. `SHARED-DEVICE-AUTHORIZATION-CHANNEL-RESPONSE-MATRIX-001`, que materializa
   diez canales con semántica equivalente;
4. `SHARED-DEVICE-AUTHORIZATION-APPLICATION-COVERAGE-REGISTER-001`, que decide
   el alcance para las diez aplicaciones canónicas sin autorizar por nombre de
   aplicación;
5. `SHARED-DEVICE-AUTHORIZATION-PHYSICAL-RECONCILIATION-001`, que registra el
   snapshot físico de solo lectura y catorce brechas con destino documental
   explícito.

Cobertura materializada:

| Elemento                                         | Cantidad |
| ------------------------------------------------ | -------: |
| Código público canónico                          |        1 |
| Estado HTTP no navegacional                      | 1, `403` |
| Familias internas de causa                       |        8 |
| Causas internas normalizadas                     |       18 |
| Escenarios con decisión explícita                |       24 |
| Canales con respuesta explícita                  |       10 |
| Aplicaciones canónicas reconciliadas             |       10 |
| Permisos canónicos evaluados                     |      112 |
| Permisos `STANDARD_ACTOR_SESSION`                |       52 |
| Permisos `STRONG_REAUTH_REQUIRED`                |       40 |
| Permisos `NOT_ALLOWED`                           |       20 |
| Claves únicas presentes en algún paquete         |       83 |
| Claves ausentes de todos los paquetes            |       29 |
| Paquetes documentales exactos                    |        9 |
| Membresías documentales de paquete               |      177 |
| Plantillas objetivo                              |       14 |
| Asociaciones máximas plantilla–permiso           |      266 |
| Instancias físicas configuradas observadas       |        2 |
| Observaciones físicas sin identidad autoritativa |        2 |
| Plantillas físicas registradas                   |        6 |
| Asociaciones físicas plantilla–aplicación        |       17 |
| Asociaciones físicas instancia–aplicación        |        4 |
| Políticas físicas de actor por instancia         |        2 |
| Políticas físicas de actor por plantilla         |        7 |
| Sesiones físicas de actor persistidas            |        0 |
| Eventos físicos de dispositivo                   |        3 |
| Instancias con `last_seen_at`                    |        0 |
| Rutinas físicas relacionadas identificadas       |       11 |
| Políticas RLS físicas relacionadas observadas    |        8 |
| Brechas físicas registradas                      |       14 |
| Requisitos de prueba derivados                   |       10 |

Las cifras físicas representan un snapshot de solo lectura. No certifican que
las instancias estén listas para operación canónica, no exponen credenciales y
no autorizan correcciones automáticas sobre producción.

---

#### 3. Identidad canónica del bloqueo

La identidad pública única es:

```text
reason_code = AUTH_SHARED_DEVICE_NOT_AUTHORIZED
```

| Propiedad                                    | Valor                                                                                                                                |
| -------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| Dominio                                      | `AUTHORIZATION_CONTEXT`                                                                                                              |
| Estado público                               | `SHARED_DEVICE_NOT_AUTHORIZED_FOR_REQUEST`                                                                                           |
| Categoría humana                             | `DENIED` cuando la restricción es estable; `BLOCKED` cuando exige corrección administrativa                                          |
| Decisión                                     | `DENY` para la solicitud desde esa instancia                                                                                         |
| Estado HTTP cuando la decisión final deniega | `403 Forbidden`                                                                                                                      |
| `executable`                                 | `false`                                                                                                                              |
| Sesión personal                              | no aplica al principal técnico                                                                                                       |
| Sesión técnica                               | se conserva solo si el dispositivo continúa activo y no revocado                                                                     |
| Sesión de actor                              | se termina cuando el dispositivo queda `INACTIVE`, `INVALID` o revocado                                                              |
| Efectos empresariales                        | cero                                                                                                                                 |
| Reintento automático                         | prohibido mientras no cambie la configuración o el contexto                                                                          |
| Recuperación principal                       | utilizar una instancia autorizada, iniciar una sesión personal cuando el permiso lo exija o solicitar corrección de la configuración |
| Copy principal                               | `Este dispositivo no está autorizado para esta operación. Usa un dispositivo permitido o inicia sesión de forma personal.`           |
| Causas internas públicas                     | ninguna                                                                                                                              |

Quedan prohibidos como códigos públicos alternativos:

- `app_not_allowed`;
- `device_invalid`;
- `device_inactive`;
- `device_not_found`;
- `shared_device_permission_not_listed`;
- `shared_device_permission_not_allowed`;
- `navigation_role_invalid`;
- `no_permission`;
- el código del dispositivo;
- el código de la plantilla;
- el código del paquete;
- mensajes libres usados como identidad contractual.

Razones legacy podrán mapearse temporalmente como causas internas, pero no
competirán con la identidad pública canónica.

---

#### 4. Definición exacta de dispositivo no autorizado

Existe dispositivo no autorizado cuando la sesión de autenticación ya fue
validada, el principal se clasificó como `SHARED_DEVICE` y al menos una de las
siguientes condiciones concluyentes se cumple:

```text
NO EXISTE VÍNCULO EMPRESARIAL ÚNICO PARA EL PRINCIPAL TÉCNICO
OR
LA INSTANCIA ESTÁ INACTIVA, SUSPENDIDA, RETIRADA O REVOCADA
OR
LA INSTANCIA O SU CONFIGURACIÓN SON INVALIDAS
OR
LA APLICACIÓN SOLICITADA NO PERTENECE AL CONJUNTO EFECTIVO
OR
NO EXISTE PAQUETE EFECTIVO APROBADO PARA LA ACCIÓN EMPRESARIAL
OR
LA CLAVE SOLICITADA NO PERTENECE AL TECHO EFECTIVO
OR
EL PERMISO ESTÁ CLASIFICADO NOT_ALLOWED EN DISPOSITIVO COMPARTIDO
OR
EL DISPOSITIVO NO SOPORTA LA REAUTENTICACIÓN FUERTE EXIGIDA
OR
LA POLÍTICA DE ACTOR DEL DISPOSITIVO NO ADMITE AL ACTOR
OR
EL TERRITORIO O RECURSO DEL DISPOSITIVO ES INCOMPATIBLE
```

La evaluación deberá ser exacta, server-side, determinista y fail closed.

No existe dispositivo no autorizado por:

- ausencia de heartbeat por sí sola;
- uso físico de un equipo compartido bajo sesión personal;
- falta de actor en una instancia válida;
- falta de turno, check-in, rol o grant del actor;
- que una aplicación no esté instalada localmente si la solicitud no la usa;
- que el dispositivo no haya sido usado recientemente;
- que el actor anterior haya cerrado su sesión correctamente.

---

#### 5. Fuente autoritativa del dispositivo

La fuente autoritativa se resuelve exclusivamente en servidor:

```text
principal autenticado
→ tipo de principal
→ vínculo técnico único y vigente
→ instancia empresarial exacta
→ plantilla y versión exactas
→ estado efectivo
→ aplicaciones efectivas
→ paquete efectivo
→ política de actor
→ restricciones territoriales y de recurso
```

No podrán actuar como fuente autoritativa:

- `device_id` enviado por el cliente;
- `device_code` guardado en local storage;
- cookie no firmada;
- correo técnico interpretado por prefijo;
- IP, MAC, serial o user agent;
- hostname;
- ruta visitada;
- aplicación instalada;
- QR no validado;
- `navigation_role`;
- último dispositivo usado;
- último actor;
- sede o área seleccionadas;
- rol base u operativo del actor;
- nombre físico del equipo;
- metadata no tipada del cliente.

Un error, ausencia o ambigüedad de la fuente no se resolverá escogiendo la
primera fila ni convirtiendo el principal en `HUMAN_USER`.

---

#### 6. Principal técnico, instancia y actor humano

Se conservan tres identidades distintas:

| Identidad             | Función                                       | Puede conceder autorización empresarial |
| --------------------- | --------------------------------------------- | --------------------------------------- |
| Principal técnico     | Autentica la procedencia técnica              | No                                      |
| Instancia empresarial | Define restricciones máximas y estado         | No; solo restringe                      |
| Actor humano          | Aporta identidad, carriles, grants y contexto | Sí, si toda la decisión es válida       |

Reglas:

```text
principal técnico ≠ dispositivo empresarial

dispositivo empresarial ≠ actor humano

actor humano ≠ último actor recordado

identidad técnica válida ≠ acción autorizada
```

Un dispositivo autorizado no ejecuta acciones anónimas. Un actor autorizado no
puede utilizar un dispositivo que no admita la acción.

---

#### 7. Estados del dispositivo

| Estado contractual | Significado                                                        | Resultado empresarial                     |
| ------------------ | ------------------------------------------------------------------ | ----------------------------------------- |
| `ACTIVE`           | instancia única, habilitada y configuración resoluble              | puede continuar la evaluación; no concede |
| `INACTIVE`         | deshabilitada, suspendida, retirada o revocada administrativamente | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED`       |
| `INVALID`          | identidad o configuración contradictoria                           | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED`       |

`ACTIVE` no significa:

- conectado;
- saludable;
- con actor vigente;
- con turno;
- con check-in;
- con aplicación autorizada para la solicitud;
- con permiso concedido;
- operativamente verificado.

La ausencia de `last_seen_at` no transforma automáticamente un dispositivo en
`INACTIVE`. La presencia de `last_seen_at` tampoco demuestra autorización.

---

#### 8. Configuración mínima autorizable

Una instancia `ACTIVE` deberá resolver sin ambigüedad:

1. identidad empresarial única;
2. vínculo técnico único y vigente;
3. tipo canónico;
4. plantilla canónica;
5. versión exacta de plantilla;
6. sede fija o política territorial autorizada;
7. política de área cuando aplique;
8. aplicaciones efectivas;
9. paquete efectivo versionado;
10. política de actor;
11. soporte de sesión ordinaria;
12. soporte de reautenticación fuerte cuando la acción lo exija;
13. estado de revocación;
14. reglas de invalidación y limpieza.

Una ampliación de instancia sobre la plantilla, una referencia inexistente, una
lista con códigos no canónicos, un paquete obsoleto o una combinación imposible
produce `INVALID`.

---

#### 9. Aplicaciones efectivas

La lista efectiva será:

```text
APLICACIONES DE LA PLANTILLA VERSIONADA
∩
APLICACIONES NO RETIRADAS POR LA INSTANCIA
∩
APLICACIONES CANÓNICAS ACTIVAS
∩
CLIENTE DESPLEGADO COMPATIBLE CUANDO APLIQUE
```

Para principal `SHARED_DEVICE`:

```text
requested_app_code ∉ allowed_application_codes
→ AUTH_SHARED_DEVICE_NOT_AUTHORIZED
```

La coincidencia de aplicación solo permite continuar. No concede:

- `<app>.access`;
- módulos internos;
- rutas;
- permisos;
- carril base;
- carril operativo;
- alcance;
- recurso.

Lista vacía significa ninguna aplicación empresarial disponible.

---

#### 10. Paquete efectivo y techo de capacidades

La clave solicitada deberá pertenecer simultáneamente a:

```text
PAQUETES EXACTOS DE LA VERSIÓN DE PLANTILLA
∩
REDUCCIONES EXPLÍCITAS DE LA INSTANCIA
∩
APLICACIONES EFECTIVAS
∩
CATÁLOGO CANÓNICO ACTIVO
```

El paquete:

- es un techo restrictivo;
- utiliza claves exactas;
- no admite wildcards ni prefijos;
- no concede al actor;
- no reemplaza matrices;
- no elimina denegaciones;
- no crea turno, check-in, rol, sede o área;
- no transforma una aplicación en permiso.

Para una acción empresarial:

```text
capability_package_code = null
OR
package_version = unresolved
OR
permission_key ∉ effective_package
→ AUTH_SHARED_DEVICE_NOT_AUTHORIZED
```

Un paquete nulo puede ser válido para una superficie técnica o una instancia en
configuración, pero no para ejecutar una acción empresarial.

---

#### 11. Compatibilidad del permiso

Los 112 permisos conservan exactamente una clasificación:

| Clasificación            | Cantidad | Regla                                                                    |
| ------------------------ | -------: | ------------------------------------------------------------------------ |
| `STANDARD_ACTOR_SESSION` |       52 | requiere dispositivo autorizado y sesión ordinaria de actor válida       |
| `STRONG_REAUTH_REQUIRED` |       40 | requiere además reautenticación fuerte personal válida                   |
| `NOT_ALLOWED`            |       20 | exige sesión personal y no puede ejecutarse desde dispositivo compartido |

Casos:

```text
NOT_ALLOWED
→ AUTH_SHARED_DEVICE_NOT_AUTHORIZED
→ ofrecer sesión personal cuando sea procedente
```

```text
STRONG_REAUTH_REQUIRED
+
dispositivo sin soporte fuerte
→ AUTH_SHARED_DEVICE_NOT_AUTHORIZED
```

```text
STRONG_REAUTH_REQUIRED
+
dispositivo con soporte
+
evidencia fuerte ausente o expirada
→ REAUTENTICACIÓN REQUERIDA
→ no degradar a dispositivo no autorizado
```

Un permiso nuevo inicia denegado en dispositivos hasta clasificación y versión
de paquete aprobadas.

---

#### 12. `SHARED-DEVICE-AUTHORIZATION-BLOCKING-CONTRACT-001`

```ts
type SharedDeviceAuthorizationBlockingContract = {
  contract_id: "SHARED-DEVICE-AUTHORIZATION-BLOCKING-CONTRACT-001";
  reason_code: "AUTH_SHARED_DEVICE_NOT_AUTHORIZED";
  public_state: "SHARED_DEVICE_NOT_AUTHORIZED_FOR_REQUEST";
  category: "DENIED" | "BLOCKED";
  decision: "DENY";
  http_status: 403;
  executable: false;
  session_effect:
    | "PRESERVE_TECHNICAL_SESSION"
    | "TERMINATE_ACTOR_SESSION"
    | "REQUIRE_TECHNICAL_REAUTHENTICATION";
  effects_committed: false;
  retry_policy: "AFTER_CONTEXT_OR_CONFIGURATION_CHANGE";
  recovery:
    | "USE_AUTHORIZED_DEVICE"
    | "USE_PERSONAL_SESSION"
    | "REQUEST_DEVICE_CONFIGURATION_REVIEW";
};
```

El envelope no expondrá causa interna, identificadores técnicos, plantillas,
paquetes, políticas, claves permitidas ni reglas de seguridad.

---

#### 13. Frontera con autenticación

| Situación                                              | Resultado                                                    |
| ------------------------------------------------------ | ------------------------------------------------------------ |
| JWT ausente, inválido o expirado                       | error de autenticación anterior; no `AUTH-ERR-015`           |
| sesión personal válida                                 | evaluar como `HUMAN_USER`; no `AUTH-ERR-015` por el hardware |
| principal técnico válido sin vínculo empresarial único | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED`                          |
| credencial técnica revocada y sesión ya inválida       | autenticación requerida; revocación auditada                 |
| vínculo técnico ambiguo                                | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED` y `INVALID`              |

La tarea no convierte un fallo de autenticación en `403` ni un vínculo
empresarial inválido en usuario personal.

---

#### 14. Frontera con actor no identificado

Un dispositivo válido sin sesión de actor produce:

```text
ACTOR_IDENTIFICATION_REQUIRED
```

Copy objetivo:

```text
Este equipo está autorizado, pero todavía no sabemos quién está operando.
Identifícate para registrar la acción a tu nombre.
```

No produce `AUTH_SHARED_DEVICE_NOT_AUTHORIZED`.

La superficie previa a identificación podrá mostrar únicamente:

- identidad visual segura del terminal;
- estado técnico mínimo;
- mecanismo de identificación;
- aplicaciones permitidas por configuración sin datos empresariales;
- mantenimiento o bloqueo.

---

#### 15. Frontera con sesión de actor inválida

| Situación                                    | Resultado                                              |
| -------------------------------------------- | ------------------------------------------------------ |
| sesión ausente                               | identificación requerida                               |
| sesión expirada                              | cerrar y solicitar identificación nueva                |
| dos o más sesiones activas incompatibles     | problema estructural; no elegir una                    |
| sesión de otro dispositivo                   | problema estructural                                   |
| actor inactivo                               | identidad laboral inválida                             |
| último actor recordado sin sesión vigente    | actor ausente                                          |
| dispositivo `INACTIVE`, `INVALID` o revocado | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED` y cierre de sesión |

Una sesión inválida no se corrige reutilizando PIN, cookie, actor previo o
estado local sin nueva resolución autoritativa.

---

#### 16. Frontera con turno, check-in, rol, sede y área

Cuando el dispositivo raíz es válido y la acción admite dispositivo compartido,
se conservan los bloqueos específicos del actor:

- turno ausente o inválido;
- check-in requerido;
- rol operativo faltante;
- rol operativo inválido para la sede;
- rol operativo inválido para el área;
- sede o área estructuralmente inválidas.

El dispositivo:

- no crea turno;
- no crea check-in;
- no aporta rol;
- no reemplaza sede ni área;
- no convierte `navigation_role` en rol efectivo;
- no elige el turno que mejor coincida con su territorio.

Si la restricción territorial del dispositivo falla después de resolver un
contexto laboral válido, se utiliza `AUTH_SHARED_DEVICE_NOT_AUTHORIZED` con
causa interna de incompatibilidad territorial del dispositivo.

---

#### 17. Frontera con grant, scope, recurso y denegaciones

| Situación                                          | Resultado                                             |
| -------------------------------------------------- | ----------------------------------------------------- |
| clave no incluida en el techo del dispositivo      | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED`                   |
| permiso `NOT_ALLOWED` en dispositivo               | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED`                   |
| actor sin grant                                    | denegación de permiso del actor, no esta razón        |
| scope del actor insuficiente                       | denegación de alcance, no esta razón                  |
| recurso fuera del territorio del actor             | denegación territorial o de recurso                   |
| recurso fuera del límite adicional del dispositivo | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED`                   |
| denegación explícita aplicable                     | prevalece la denegación; el dispositivo no la elimina |

La tarea preserva la fórmula:

```text
AUTORIDAD DEL ACTOR
∩
LÍMITE DEL DISPOSITIVO
=
CAPACIDAD EVALUABLE
```

Nunca unión.

---

#### 18. Política de actor

Una instancia puede restringir quién puede iniciar o mantener una sesión.

La política final deberá consumir hechos canónicos:

- empleado activo;
- sesión de actor vigente;
- asignación laboral cuando aplique;
- turno;
- rol operativo;
- sede;
- área;
- relación con recurso;
- modo de sesión permitido.

No podrá autorizar únicamente por:

- mismo sitio físico;
- nombre de rol;
- `navigation_role`;
- correo;
- último actor;
- perfil predeterminado;
- primer empleado coincidente.

Política no satisfecha:

```text
AUTH_SHARED_DEVICE_NOT_AUTHORIZED
```

La respuesta pública no revelará qué roles o trabajadores sí serían elegibles.

---

#### 19. Territorio y recurso del dispositivo

La instancia restringe por intersección:

```text
territorio válido del actor
∩
territorio permitido por dispositivo
∩
territorio del recurso
```

No podrá:

- trasladar el turno;
- sustituir el área del actor;
- convertir `null` en toda la sede;
- usar `area_kind` como `area_id`;
- autorizar por cercanía física;
- ampliar una plantilla;
- convertir una ruta o vehículo en wildcard cross-site.

Una incompatibilidad concluyente del dispositivo con el territorio o recurso
solicitado produce `AUTH_SHARED_DEVICE_NOT_AUTHORIZED`.

---

#### 20. Simulación

La simulación administrativa no puede iniciarse ni mantenerse desde:

- identidad técnica de dispositivo;
- sesión ligera de actor;
- kiosco;
- terminal POS compartida;
- PIN de dispositivo.

Casos:

| Situación                                             | Resultado                                                           |
| ----------------------------------------------------- | ------------------------------------------------------------------- |
| principal compartido intenta iniciar simulación       | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED` para el acceso a la herramienta |
| sesión personal simula hipotéticamente un dispositivo | evaluación simulada; no `AUTH-ERR-015` real                         |
| simulación activa intenta ejecutar una acción         | `AUTH-ERR-016`                                                      |
| permiso de simulación no permitido en dispositivo     | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED`                                 |

La simulación no crea vínculo técnico, paquete, actor session ni soporte fuerte.

---

#### 21. Actor `SYSTEM` y procesos asíncronos

Un actor `SYSTEM` no se representa como dispositivo compartido ni como empleado
ligero.

Una acción iniciada válidamente desde dispositivo y continuada de forma
asíncrona deberá conservar:

- actor humano original;
- dispositivo original;
- aplicación;
- permiso;
- contexto y recurso;
- decisión o evidencia reevaluable;
- correlación.

La expiración posterior de la sesión no transforma el proceso en una acción del
dispositivo. Un callback, worker o cola no podrá usar la identidad técnica del
terminal para adquirir autoridad nueva.

---

#### 22. Causas internas admitidas

Las causas internas se agrupan sin exposición pública:

| Familia        | Causas normalizadas                                                                                      |
| -------------- | -------------------------------------------------------------------------------------------------------- |
| Identidad      | `device_binding_missing`, `device_binding_ambiguous`, `device_binding_revoked`                           |
| Estado         | `device_inactive`, `device_suspended`, `device_retired`                                                  |
| Configuración  | `device_template_unresolved`, `device_template_version_invalid`, `device_configuration_conflicted`       |
| Aplicación     | `shared_device_app_not_allowed`, `shared_device_app_catalog_invalid`                                     |
| Paquete        | `shared_device_package_unresolved`, `shared_device_package_stale`, `shared_device_permission_not_listed` |
| Compatibilidad | `shared_device_permission_not_allowed`, `shared_device_strong_not_supported`                             |
| Política       | `shared_device_actor_policy_not_satisfied`                                                               |
| Territorio     | `shared_device_territory_mismatch`                                                                       |

Reglas:

- cada causa interna tendrá exactamente una familia;
- la primera causa concluyente se conserva;
- causas derivadas se suprimen sin perder auditoría;
- la respuesta pública usa siempre el mismo `reason_code`;
- causas de actor, turno, permiso o fuente no se mezclarán en este catálogo.

---

#### 23. `SHARED-DEVICE-AUTHORIZATION-STATE-DECISION-MATRIX-001`

|    # | Escenario                                                                      | Decisión                                            | Razón pública o destino             |
| ---: | ------------------------------------------------------------------------------ | --------------------------------------------------- | ----------------------------------- |
|    1 | sesión personal válida en equipo físicamente compartido                        | evaluar como humano                                 | no aplica                           |
|    2 | sesión de autenticación ausente o inválida                                     | denegar antes                                       | autenticación requerida             |
|    3 | principal técnico sin vínculo empresarial                                      | denegar                                             | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED` |
|    4 | principal técnico vinculado a varias instancias                                | denegar                                             | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED` |
|    5 | instancia inactiva, suspendida o retirada                                      | denegar y cerrar actor                              | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED` |
|    6 | instancia revocada                                                             | denegar, invalidar y exigir reautenticación técnica | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED` |
|    7 | plantilla o versión no resoluble                                               | denegar                                             | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED` |
|    8 | instancia amplía plantilla o contiene configuración contradictoria             | denegar                                             | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED` |
|    9 | aplicación solicitada ausente del conjunto efectivo                            | denegar                                             | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED` |
|   10 | aplicación desconocida o inactiva en configuración                             | denegar                                             | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED` |
|   11 | paquete empresarial nulo o no resoluble                                        | denegar                                             | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED` |
|   12 | paquete obsoleto o contradictorio con catálogo/apps                            | denegar                                             | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED` |
|   13 | clave solicitada ausente del paquete efectivo                                  | denegar                                             | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED` |
|   14 | permiso clasificado `NOT_ALLOWED`                                              | denegar y ofrecer sesión personal                   | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED` |
|   15 | permiso `STRONG`, dispositivo sin soporte fuerte                               | denegar y ofrecer sesión personal                   | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED` |
|   16 | permiso `STRONG`, soporte disponible, evidencia ausente                        | bloquear hasta reautenticación                      | reautenticación requerida           |
|   17 | dispositivo válido sin actor                                                   | bloquear identificación                             | actor requerido                     |
|   18 | sesión de actor expirada                                                       | cerrar y solicitar nueva identificación             | sesión de actor expirada            |
|   19 | varias sesiones activas incompatibles                                          | denegar y reconciliar                               | problema estructural                |
|   20 | política de actor no satisfecha                                                | denegar                                             | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED` |
|   21 | contexto del actor válido pero territorio/recurso del dispositivo incompatible | denegar                                             | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED` |
|   22 | dispositivo válido y actor sin grant                                           | denegar por actor                                   | permiso faltante                    |
|   23 | dispositivo válido, simulación intenta mutar                                   | denegar                                             | `AUTH-ERR-016`                      |
|   24 | fuente autoritativa no responde o no permite concluir                          | fail closed temporal                                | `AUTH-ERR-019`                      |

La matriz es exhaustiva para esta tarea. Un caso nuevo deberá incorporarse con
identidad, precedencia, recuperación y prueba explícitas.

---

#### 24. Precedencia

Orden obligatorio:

```text
1. autenticación y principal
2. identidad empresarial del dispositivo
3. estado, revocación, plantilla y configuración raíz
4. aplicación solicitada
5. actor session cuando la superficie lo exige
6. identidad laboral y contexto del actor
7. compatibilidad del permiso con dispositivo
8. paquete y clave exacta
9. política de actor y territorio del dispositivo
10. grants, carriles, prerrequisitos, scope, recurso y denegaciones
11. simulación
12. decisión final
```

Reglas de presentación:

- un dispositivo raíz `INACTIVE` o `INVALID` impide resolver o exponer datos del
  actor;
- una aplicación no permitida puede bloquearse antes de solicitar PIN;
- en una aplicación permitida, actor ausente se presenta como identificación
  requerida, no como dispositivo no autorizado;
- una vez el dispositivo participa válidamente, los bloqueos específicos de
  turno, check-in, rol, sede y área conservan su identidad;
- una indisponibilidad de fuente no se presenta como denegación estable.

---

#### 25. Regla de cero efectos

Ante `AUTH_SHARED_DEVICE_NOT_AUTHORIZED`:

- no se inserta, actualiza ni elimina información empresarial;
- no se cambia estado de dominio;
- no se reserva inventario;
- no se mueve stock;
- no se registra venta, entrega, producción, recepción o retiro;
- no se publica asistencia;
- no se firma una acción;
- no se crea una sesión de actor como recuperación implícita;
- no se cambia aplicación, paquete, política, sede o área;
- no se reutiliza una decisión positiva anterior;
- no se emite evento empresarial de éxito;
- no se muestra información protegida;
- no se degrada a solo lectura salvo que exista un permiso independiente válido;
- no se intenta automáticamente con otro rol, actor o dispositivo.

La auditoría de denegación no constituye efecto empresarial de la acción.

---

#### 26. Envelope público

Ejemplo no vinculante de forma pública:

```json
{
  "ok": false,
  "reason_code": "AUTH_SHARED_DEVICE_NOT_AUTHORIZED",
  "state": "SHARED_DEVICE_NOT_AUTHORIZED_FOR_REQUEST",
  "category": "DENIED",
  "message": "Este dispositivo no está autorizado para esta operación. Usa un dispositivo permitido o inicia sesión de forma personal.",
  "executable": false,
  "effects_committed": false,
  "recovery_actions": [
    "USE_AUTHORIZED_DEVICE",
    "USE_PERSONAL_SESSION",
    "REQUEST_DEVICE_CONFIGURATION_REVIEW"
  ]
}
```

No se incluirán:

- `auth_user_id`;
- email técnico;
- `device_id` interno salvo referencia segura autorizada;
- plantilla o versión;
- paquete;
- lista de aplicaciones o permisos;
- política de actor;
- roles elegibles;
- PIN, hash, QR o token;
- causas internas;
- consultas SQL;
- nombres de tablas o funciones.

---

#### 27. Copy, accesibilidad y recuperación

Copy principal:

```text
Este dispositivo no está autorizado para esta operación.
Usa un dispositivo permitido o inicia sesión de forma personal.
```

Variantes permitidas por recuperación:

| Condición segura                   | Título                                                   | Acción principal                       |
| ---------------------------------- | -------------------------------------------------------- | -------------------------------------- |
| permiso requiere sesión personal   | `Esta operación requiere una sesión personal`            | `Iniciar sesión de forma personal`     |
| dispositivo está fuera de servicio | `Este dispositivo no está disponible para operar`        | `Usar otro dispositivo`                |
| configuración requiere revisión    | `Este dispositivo necesita una revisión`                 | `Solicitar revisión`                   |
| aplicación no admitida             | `Esta aplicación no está disponible en este dispositivo` | `Volver a las aplicaciones permitidas` |

Reglas:

- no culpar al trabajador;
- no mostrar solo `Acceso denegado`;
- no sugerir usar cuenta ajena;
- no sugerir cambiar manualmente sede, área o rol;
- no enumerar quién sí tiene acceso;
- no mostrar códigos internos;
- anunciar con tecnología asistiva;
- mover el foco al resumen del bloqueo;
- conservar una referencia segura para soporte;
- informar que no se realizaron cambios.

---

#### 28. `SHARED-DEVICE-AUTHORIZATION-CHANNEL-RESPONSE-MATRIX-001`

| Canal                               | Comportamiento obligatorio                                                                 |
| ----------------------------------- | ------------------------------------------------------------------------------------------ |
| Launcher o navegación               | ocultar o bloquear app no permitida sin convertir visibilidad en autorización              |
| Server Component / RSC              | resolver en servidor y no serializar datos protegidos                                      |
| Server Action                       | responder `403`, cero efectos y razón pública canónica                                     |
| Route Handler / API                 | envelope canónico, sin detalles internos ni reintento automático                           |
| RPC / PostgREST                     | fail closed; no usar booleano permisivo como decisión completa                             |
| RLS / Data API                      | impedir filas o mutaciones; conservar evidencia diagnóstica fuera de la respuesta sensible |
| Edge Function                       | reevaluar principal, dispositivo, app, paquete, actor y recurso                            |
| Realtime                            | no suscribir ni filtrar solo en cliente; revocar al invalidar contexto                     |
| Cliente offline o caché             | vista cacheada no autoriza; ninguna mutación protegida sin confirmación server-side        |
| Cola, impresión o proceso asíncrono | conservar actor y dispositivo originales; no adquirir autoridad nueva                      |

Todos los canales deberán producir la misma decisión para la misma entrada y
frescura contractual.

---

#### 29. Reintentos, concurrencia e invalidación

`AUTH_SHARED_DEVICE_NOT_AUTHORIZED` no admite reintento automático mientras no
cambie una de estas condiciones:

- vínculo técnico;
- estado o revocación;
- plantilla o versión;
- aplicaciones;
- paquete;
- política de actor;
- territorio o recurso;
- soporte fuerte;
- sesión utilizada.

Eventos que invalidan contexto y decisiones positivas:

```text
device_activated
device_deactivated
device_suspended
device_revoked
device_template_changed
device_template_version_changed
device_apps_changed
device_package_changed
device_actor_policy_changed
device_territory_changed
device_actor_session_started
device_actor_session_ended
device_actor_session_expired
device_actor_changed
permission_catalog_changed
```

Una acción deberá conservar el mismo dispositivo, actor, app, permiso, contexto
y recurso desde la evaluación hasta la confirmación transaccional. Cualquier
cambio obliga a reiniciar la decisión.

---

#### 30. Auditoría

La auditoría mínima conservará, cuando exista y sea seguro:

- `reason_code` público;
- causa interna;
- familia de causa;
- principal type;
- identificador técnico pseudonimizado;
- `device_id` empresarial;
- `device_code` interno;
- estado del dispositivo;
- plantilla y versión;
- paquete y versión;
- aplicación solicitada;
- permiso solicitado;
- actor y actor session cuando existan;
- sede, área y recurso;
- política evaluada;
- soporte fuerte;
- decisión y carril;
- `resolved_at`;
- fingerprint de contexto;
- correlación e idempotency key;
- efectos confirmados, siempre cero;
- recuperación ofrecida;
- fuente y versión de reglas.

No se registrarán en logs ordinarios:

- PIN;
- hash de PIN;
- token;
- JWT;
- QR secreto;
- contraseña;
- factor MFA;
- contenido protegido de la acción;
- listas completas de permisos del actor.

---

#### 31. `SHARED-DEVICE-AUTHORIZATION-APPLICATION-COVERAGE-REGISTER-001`

| Aplicación | Compatibilidad documental                                                        | Decisión de `AUTH-ERR-015`                                                              |
| ---------- | -------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| SHELL      | `shell.access` es `STANDARD`; la superficie previa se controla por configuración | bloquear app o acción no incluida; no conceder por launcher                             |
| ANIMA      | sus 10 permisos son `NOT_ALLOWED`                                                | exigir sesión personal; la asistencia no usa actor ligero                               |
| AURA       | `aura.access` es `NOT_ALLOWED` y la aplicación permanece diferida                | bloquear desde dispositivo compartido                                                   |
| FOGO       | 5 permisos `STANDARD`, 1 `NOT_ALLOWED`                                           | admitir solo claves exactas del paquete y área de producción compatibles                |
| NEXO       | mezcla de `STANDARD`, `STRONG` y `NOT_ALLOWED`                                   | aplicar paquete, actor, territorio, recurso y soporte fuerte por acción                 |
| NUMERA     | 6 permisos `STRONG`                                                              | solo terminal y paquete aprobados con reautenticación fuerte; de lo contrario bloquear  |
| ORIGO      | 4 permisos compartibles y 1 `STRONG`                                             | aplicar app, paquete, recepción y soporte fuerte exactos                                |
| PASS       | `pass.access` es `NOT_ALLOWED`                                                   | conservar sesión de cliente separada; bloquear identidad técnica laboral                |
| PULSO      | 1 `STANDARD` y 1 `STRONG`                                                        | admitir POS autorizado; override exige soporte y evidencia fuerte                       |
| VISO       | 17 permisos `STRONG`                                                             | únicamente terminal administrativa aprobada y sesión personal fuerte; no bypass por rol |

La cobertura no asigna aplicaciones ni permisos a instancias concretas. Consume
las clasificaciones y paquetes aprobados y define la respuesta cuando una
restricción del dispositivo falla.

---

#### 32. Plantillas, instancias y observaciones

Se conservan exactamente diecinueve claves documentales:

| Clase                     | Cantidad | Tratamiento                                        |
| ------------------------- | -------: | -------------------------------------------------- |
| `CONFIGURED_INSTANCE`     |        2 | registradas pero no verificadas operacionalmente   |
| `PHYSICAL_OBSERVATION`    |        2 | no constituyen identidad autoritativa              |
| `TARGET_TEMPLATE`         |       14 | política definida, no instancia activa por sí sola |
| `RETIRED_LEGACY_TEMPLATE` |        1 | no admite nuevas instancias ni paquetes            |

Reglas:

- una observación no se autoriza por ubicación o etiqueta;
- una plantilla no es un dispositivo;
- una instancia registrada no queda certificada por estar activa en una tabla;
- la plantilla retirada no recibe nuevas aplicaciones ni capacidades;
- no se crea instancia por inferencia desde una pantalla o equipo físico.

---

#### 33. Snapshot físico observado

Snapshot de solo lectura:

| Elemento                                                         |   Resultado observado |
| ---------------------------------------------------------------- | --------------------: |
| `shared_operational_devices`                                     |                     2 |
| instancias con `is_active = true` y `activation_status = active` |                     2 |
| instancias vinculadas a Auth                                     |                     2 |
| instancias con sede                                              |                     2 |
| instancias con área                                              |                     2 |
| instancias con `last_seen_at`                                    |                     0 |
| `shared_operational_device_apps`                                 |                     4 |
| apps de `CAJA_VENTO_CAFE_01`                                     | 3: SHELL, NEXO, PULSO |
| apps de `KIOSCO_BODEGA_CP`                                       |               1: NEXO |
| `shared_operational_device_actor_sessions`                       |                     0 |
| `shared_operational_device_events`                               |                     3 |
| `shared_operational_device_templates`                            |                     6 |
| `shared_operational_device_template_apps`                        |                    17 |
| `shared_operational_device_actor_policies`                       |                     2 |
| `shared_operational_device_template_actor_policies`              |                     7 |
| rutinas relacionadas identificadas                               |                    11 |
| políticas RLS relacionadas observadas                            |                     8 |

Instancias observadas:

| Instancia            | Tipo                 | Plantilla física  | Política física de actor  | Estado documental       |
| -------------------- | -------------------- | ----------------- | ------------------------- | ----------------------- |
| `CAJA_VENTO_CAFE_01` | `pos_terminal`       | `pos_satellite`   | `role_in_area`            | `REGISTERED_UNVERIFIED` |
| `KIOSCO_BODEGA_CP`   | `warehouse_terminal` | `warehouse_kiosk` | `same_site_active_worker` | `REGISTERED_UNVERIFIED` |

La ausencia de sesiones y heartbeat no vuelve inactivas las filas, pero impide
presentarlas como evidencia de operación canónica verificada.

---

#### 34. Comportamiento físico observado

El runtime físico actual presenta estas características:

1. `current_shared_operational_device_v1()` selecciona por `auth.uid()`, estado
   activo y relaciones de aplicación;
2. la función no demuestra versión de plantilla ni paquete efectivo;
3. devuelve `navigation_role`;
4. `get_effective_context_v1()` usa `navigation_role` como
   `effective_operational_role`;
5. el `can_operate` compartido se calcula principalmente por pertenencia de la
   aplicación;
6. `current_shared_device_can_access_app(text)` devuelve un booleano basado en
   instancia y app activa;
7. las funciones legacy de actor usan asistencia, campos legacy del empleado y
   fallbacks de rol;
8. NEXO consulta directamente `shared_operational_devices`;
9. NEXO permite que `preferredSiteId` y `preferredAreaId` precedan al territorio
   de la instancia;
10. NEXO asigna `navigation_role` como rol de la sesión compartida;
11. NEXO trata `<app>.access` como permitido cuando la app está listada;
12. no existen sesiones de actor persistidas que demuestren el flujo objetivo;
13. el kiosco de bodega conserva una política `same_site_active_worker` que el
   contrato documental considera insuficiente como política final;
14. no se demostró una capa física versionada de paquetes y reducciones que
   materialice el techo documental.

Ninguno de estos comportamientos se corrige dentro de esta tarea documental.

---

#### 35. `SHARED-DEVICE-AUTHORIZATION-PHYSICAL-RECONCILIATION-001`

|    # | Brecha física                                                                   | Estado                        | Riesgo                                              | Destino exacto                                                  |
| ---: | ------------------------------------------------------------------------------- | ----------------------------- | --------------------------------------------------- | --------------------------------------------------------------- |
|    1 | no existe productor físico completo de `DeviceContext@1.0.0`                    | `PENDIENTE_DE_IMPLEMENTACION` | decisión fragmentada                                | `AUTH-CTX-025`; `AUTH-DB-033`; `AUTH-DB-034`                    |
|    2 | vínculo técnico no expone diagnóstico canónico de missing/ambiguous/revoked     | `PENDIENTE_DE_IMPLEMENTACION` | principal mal clasificado                           | `AUTH-CTX-025`; `AUTH-CTX-028`                                  |
|    3 | plantilla y versión exactas no se resuelven en el contexto efectivo             | `PENDIENTE_DE_IMPLEMENTACION` | configuración no reproducible                       | `AUTH-DEV-014`; `AUTH-CTX-025`; BLOQUE R                        |
|    4 | paquetes versionados y reducciones no están materializados conforme al contrato | `PENDIENTE_DE_IMPLEMENTACION` | techo inexistente o ampliable                       | `AUTH-DEV-006`; `AUTH-CTX-028`; BLOQUE E5; BLOQUE R             |
|    5 | `navigation_role` participa como rol efectivo                                   | `BLOQUEADO`                   | elevación y rol inventado                           | `AUTH-DEV-009`; `AUTH-CTX-027`; `AUTH-CTX-028`; `AUTH-DB-030`   |
|    6 | app permitida puede convertirse en `<app>.access`                               | `BLOQUEADO`                   | app convertida en grant                             | `AUTH-CAT-014`; `AUTH-CTX-017`; `AUTH-CTX-026`; `AUTH-QA-030`   |
|    7 | `can_operate` legacy solo refleja app y no decisión completa                    | `BLOQUEADO`                   | allow parcial                                       | `AUTH-CTX-026`; `AUTH-DB-034`                                   |
|    8 | territorio de la instancia puede ser sustituido por valores preferidos          | `BLOQUEADO`                   | operación cross-site/cross-area                     | `AUTH-CTX-027`; `AUTH-CTX-028`; `AUTH-QA-030`                   |
|    9 | funciones de actor usan asistencia y campos legacy como fallback                | `BLOQUEADO`                   | actor, turno o rol incorrectos                      | `AUTH-DEV-008`; `AUTH-CTX-028`; `AUTH-DB-030`                   |
|   10 | no existen sesiones de actor persistidas                                        | `PENDIENTE_DE_IMPLEMENTACION` | acciones sin atribución                             | `AUTH-DEV-007`; `AUTH-DEV-012`; BLOQUE R                        |
|   11 | cambio, expiración y revocación de actor no están validados operacionalmente    | `PENDIENTE_DE_EVIDENCIA`      | autoridad residual                                  | `AUTH-DEV-011` a `AUTH-DEV-013`; `AUTH-QA-030`                  |
|   12 | política `same_site_active_worker` del kiosco es demasiado amplia               | `BLOQUEADO`                   | cualquier trabajador de sede podría intentar operar | `AUTH-DEV-008`; `AUTH-DEV-014`                                  |
|   13 | no existe evidencia de heartbeat ni operación física verificada                 | `PENDIENTE_DE_EVIDENCIA`      | estado registral confundido con disponibilidad      | `AUTH-DEV-014` a `AUTH-DEV-016`; BLOQUE E4                      |
|   14 | mensajes y reason codes de consumidoras no están unificados                     | `PENDIENTE_DE_IMPLEMENTACION` | UX y respuesta divergentes                          | `AUTH-ERR-015`; `SHELL-AUTH-004`; `SHELL-CI-016`; `AUTH-QA-030` |

Cada brecha conserva propietario y condición de salida. No se crean tareas
nuevas porque existen destinos canónicos concretos.

---

#### 36. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se incorporan al registro canónico:

- `TREQ-AUTH-269`;
- `TREQ-AUTH-270`;
- `TREQ-AUTH-271`;
- `TREQ-AUTH-272`;
- `TREQ-AUTH-273`;
- `TREQ-AUTH-274`;
- `TREQ-AUTH-275`;
- `TREQ-AUTH-276`;
- `TREQ-AUTH-277`;
- `TREQ-AUTH-278`.

Cobertura:

| Rango | Cobertura                                                   |
| ----- | ----------------------------------------------------------- |
| `269` | contrato público, `403`, cero efectos y recuperación        |
| `270` | separación principal, instancia, actor y sesión personal    |
| `271` | identidad, estado, plantilla, versión, apps y configuración |
| `272` | clasificación de 112 permisos, paquete y techo exacto       |
| `273` | actor session, política, territorio y soporte fuerte        |
| `274` | causas, fronteras y precedencia                             |
| `275` | equivalencia de diez canales                                |
| `276` | cobertura de diez aplicaciones e inventario documental      |
| `277` | UX, privacidad, invalidación, concurrencia y auditoría      |
| `278` | reconciliación física y eliminación de fallbacks legacy     |

Los requisitos permanecen `IDENTIFICADO` hasta que existan implementación y
evidencia reproducibles.

---

#### 37. Validaciones documentales definidas

El artefacto deberá permitir comprobar:

1. un único código público;
2. un único estado público;
3. `403` solo después de autenticación válida;
4. cero efectos en todos los canales;
5. sesión personal separada del principal técnico;
6. actor ausente separado de dispositivo no autorizado;
7. turno, check-in, rol, sede y área con razones propias;
8. app visible sin grant implícito;
9. paquete exacto sin wildcard;
10. `NOT_ALLOWED` bloqueado universalmente;
11. `STRONG` sin degradación;
12. `navigation_role` excluido de autorización;
13. 24 escenarios sin decisión nula;
14. 10 canales equivalentes;
15. 10 aplicaciones reconciliadas;
16. 19 claves documentales conservadas;
17. 14 brechas con destino;
18. 10 requisitos nuevos únicos;
19. 6.666 requisitos históricos preservados;
20. catorce columnas en cada fila del registro.

---

#### 38. Evidencia y estados

| Elemento                       | Estado                             |
| ------------------------------ | ---------------------------------- |
| contrato de bloqueo            | `ESPECIFICADO`                     |
| matriz de escenarios           | `ESPECIFICADO`                     |
| matriz de canales              | `ESPECIFICADO`                     |
| cobertura de aplicaciones      | `ESPECIFICADO`                     |
| snapshot de Supabase           | `PENDIENTE_DE_EVIDENCIA_OPERATIVA` |
| productor central de contexto  | `PENDIENTE_DE_IMPLEMENTACION`      |
| evaluador uniforme             | `PENDIENTE_DE_IMPLEMENTACION`      |
| paquetes físicos versionados   | `PENDIENTE_DE_IMPLEMENTACION`      |
| sesiones de actor              | `PENDIENTE_DE_IMPLEMENTACION`      |
| pruebas automatizadas          | `PENDIENTE_DE_IMPLEMENTACION`      |
| pruebas en dispositivos reales | `PENDIENTE_DE_EVIDENCIA`           |

La presencia de tablas, filas, funciones o una compilación no equivale a
`VALIDADO` ni `VERIFICADO`.

---

#### 39. Fuera del alcance

AUTH-ERR-015 no:

- crea o revoca dispositivos;
- cambia credenciales técnicas;
- crea plantillas o versiones;
- modifica aplicaciones permitidas;
- crea paquetes o membresías;
- cambia políticas de actor;
- crea PIN, passkey o MFA;
- crea sesiones de actor;
- modifica turnos, check-ins, roles, sedes o áreas;
- asigna permisos;
- elimina `navigation_role`;
- cambia NEXO, PULSO, FOGO u otra aplicación;
- crea tablas, constraints, triggers, RLS, RPC o funciones;
- crea migraciones;
- ejecuta DDL, DML, backfills o despliegues;
- modifica Supabase;
- certifica dispositivos físicos;
- inicia `AUTH-ERR-016`.

---

#### 40. Criterios de aceptación

- [x] Se definió un código público único.
- [x] Se definió un estado público único.
- [x] Se definió `403` para una sesión autenticada cuya instancia no autoriza.
- [x] Se separó autenticación de autorización de dispositivo.
- [x] Se separó sesión personal de principal compartido.
- [x] Se separó dispositivo de actor humano.
- [x] Se separó actor ausente de dispositivo no autorizado.
- [x] Se preservaron turno, check-in, rol, sede y área con razones propias.
- [x] Se definieron estados `ACTIVE`, `INACTIVE` e `INVALID`.
- [x] Se prohibió usar heartbeat como autorización.
- [x] Se definió identidad técnica única y server-side.
- [x] Se definió plantilla y versión exactas.
- [x] Se definió instancia solo restrictiva.
- [x] Se definieron aplicaciones efectivas por intersección.
- [x] Se prohibió convertir app visible en grant.
- [x] Se definió paquete efectivo y clave exacta.
- [x] Se conservaron 52 `STANDARD`, 40 `STRONG` y 20 `NOT_ALLOWED`.
- [x] Se prohibió degradar `STRONG`.
- [x] Se definió recuperación mediante dispositivo autorizado o sesión personal.
- [x] Se definieron dieciocho causas internas en ocho familias.
- [x] Se decidieron veinticuatro escenarios.
- [x] Se definió precedencia determinista.
- [x] Se exigieron cero efectos.
- [x] Se definieron diez canales equivalentes.
- [x] Se reconciliaron diez aplicaciones.
- [x] Se preservaron diecinueve claves documentales de dispositivo.
- [x] Se registró el snapshot físico sin presentarlo como validación operativa.
- [x] Se registraron catorce brechas con destino exacto.
- [x] Se derivaron `TREQ-AUTH-269` a `TREQ-AUTH-278`.
- [x] No se modificó código, Supabase, migraciones, configuración, datos ni dispositivos.
- [x] `AUTH-ERR-016` permanece únicamente reservada.

---

#### 41. Riesgos controlados

| Riesgo                                             | Control                                     |
| -------------------------------------------------- | ------------------------------------------- |
| identidad técnica convertida en trabajador         | separación principal–instancia–actor        |
| fila activa presentada como dispositivo verificado | estado documental `REGISTERED_UNVERIFIED`   |
| app permitida convertida en permiso                | evaluación independiente de grant y paquete |
| `navigation_role` usado como rol efectivo          | prohibición y brecha explícita              |
| instancia amplía plantilla                         | `INVALID` y fail closed                     |
| paquete nulo tratado como ilimitado                | ninguna capacidad empresarial               |
| permiso `NOT_ALLOWED` degradado                    | sesión personal obligatoria                 |
| acción `STRONG` ejecutada solo con PIN             | soporte y reautenticación fuerte separados  |
| actor anterior reutilizado                         | sesión vigente única e invalidación         |
| territorio del dispositivo reemplaza turno         | intersección restrictiva                    |
| causa técnica presentada como denegación estable   | frontera con `AUTH-ERR-019`                 |
| datos internos expuestos en mensaje                | envelope público mínimo                     |
| reintentos duplican efectos                        | cero efectos e invalidación por versión     |
| consumidoras divergen                              | matriz de canales y TREQ transversal        |

---

#### 42. Cierre de tarea y continuidad

**ÚLTIMA TAREA APROBADA**

`AUTH-ERR-014 — Rol operativo inválido para el área`

**TAREA ACTUAL APROBADA**

`AUTH-ERR-015 — Dispositivo no autorizado`

**SIGUIENTE TAREA RESERVADA**

`AUTH-ERR-016 — Acción no permitida en simulación`


### [ ] AUTH-ERR-016 — Acción no permitida en simulación
