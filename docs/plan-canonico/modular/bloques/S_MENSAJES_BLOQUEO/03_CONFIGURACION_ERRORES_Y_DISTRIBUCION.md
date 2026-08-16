### MINI-BLOQUE — CONFIGURACION ERRORES Y DISTRIBUCION

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **configuracion errores y distribucion** dentro de **S MENSAJES BLOQUEO**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `AUTH-ERR-017` a `AUTH-ERR-020` — 4 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `AUTH-ERR-017`: Configuración administrativa inconsistente
- `AUTH-ERR-018`: Permiso no registrado
- `AUTH-ERR-019`: Diferenciar error técnico y denegación
- `AUTH-ERR-020`: Compartir mensajes desde vento-shell
<!-- PLAN-SECTION-META:END -->

### ✅ AUTH-ERR-017 — Configuración administrativa inconsistente

**Estado:** APROBADA
**Tarea anterior:** `AUTH-ERR-016 — Acción no permitida en simulación` — APROBADA
**Tarea siguiente:** `AUTH-ERR-018 — Permiso no registrado` — RESERVADA
**Tipo de tarea:** documental; definición contractual, causal, funcional, de seguridad, experiencia y reconciliación física del bloqueo producido cuando la configuración administrada necesaria para resolver una autorización es contradictoria, ambigua, incompleta, incompatible, obsoleta o no reproducible de forma concluyente

---

#### 1. Propósito

Definir de forma única, segura y verificable qué debe ocurrir cuando una
solicitud ya alcanzó una superficie protegida y las fuentes autoritativas sí
pudieron leerse, pero la configuración administrada necesaria para construir
el contexto o evaluar el permiso contiene una contradicción que impide obtener
una decisión positiva reproducible.

La regla raíz queda:

```text
SOLICITUD PROTEGIDA
+
PRINCIPAL RESOLUBLE
+
IDENTIDAD DE APLICACION SOLICITADA
+
LECTURA AUTORITATIVA CONCLUYENTE
+
CONFIGURACION O SNAPSHOT OBLIGATORIO INCONSISTENTE
+
NINGUNA RAZON ESPECIFICA ANTERIOR APLICABLE
+
EL CARRIL REQUERIDO QUEDA INVALIDO
→
DENY DE LA DECISION FINAL
+
AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT
+
409
+
SESION PRESERVADA
+
CERO EFECTOS EMPRESARIALES
```

La tarea responde exclusivamente:

```text
¿LA CONFIGURACION ADMINISTRADA NECESARIA PARA ESTA EVALUACION
ES INTERNAMENTE COHERENTE, VERSIONABLE Y REPRODUCIBLE?
```

No responde:

```text
¿FALTA UNA SESION?
¿EL USUARIO ESTA INACTIVO?
¿EL ACTOR CARECE DE ACCESO A LA APLICACION?
¿FALTA UN GRANT O EXISTE UN DENY?
¿FALTA UNA ASIGNACION, TURNO, CHECK-IN O ROL EN UN ESTADO NORMAL?
¿EL DISPOSITIVO VALIDO RESTRINGE LA ACCION?
¿SE INTENTA EJECUTAR UNA SIMULACION?
¿EL CODIGO DE PERMISO NO ESTA REGISTRADO?
¿LA FUENTE AUTORITATIVA FALLO, EXPIRÓ O NO RESPONDE?
```

En esta tarea, “administrativa” describe configuración gobernada y mantenida
por Vento OS —catálogos, relaciones, contratos, matrices, versiones y
asignaciones—. No significa que el bloqueo aplique únicamente al carril base o
a la aplicación VISO.

---

#### 2. Resultado material

Se aprueban cinco artefactos documentales completos:

1. `ADMINISTRATIVE-CONFIGURATION-BLOCKING-CONTRACT-001`, que congela identidad
   pública, aplicabilidad, composición por carriles, respuesta, recuperación,
   privacidad, auditoría y cero efectos;
2. `ADMINISTRATIVE-CONFIGURATION-STATE-DECISION-MATRIX-001`, que decide
   veinticuatro escenarios y separa contradicción, ausencia ordinaria,
   denegación, catálogo desconocido e indisponibilidad técnica;
3. `ADMINISTRATIVE-CONFIGURATION-CHANNEL-RESPONSE-MATRIX-001`, que materializa
   diez canales con semántica equivalente;
4. `ADMINISTRATIVE-CONFIGURATION-APPLICATION-COVERAGE-REGISTER-001`, que
   decide el alcance para las diez aplicaciones canónicas;
5. `ADMINISTRATIVE-CONFIGURATION-PHYSICAL-RECONCILIATION-001`, que registra el
   snapshot desplegado de solo lectura y dieciséis brechas con destino canónico.

Cobertura materializada:

| Elemento                                                 |    Cantidad |
| -------------------------------------------------------- | ----------: |
| Código público canónico                                  |           1 |
| Estado HTTP no navegacional                              |    1, `409` |
| Catálogo estructural heredado y preservado               | 100 códigos |
| Códigos de disponibilidad excluidos de `StructuralIssue` |          10 |
| Severidades bloqueantes consumidas                       |           3 |
| Perfiles de enrutamiento de razones                      |          11 |
| Familias privadas de configuración                       |           8 |
| Escenarios con decisión explícita                        |          24 |
| Canales con respuesta explícita                          |          10 |
| Aplicaciones canónicas reconciliadas                     |          10 |
| Aplicaciones físicas activas observadas                  |          10 |
| Permisos físicos activos observados                      |         179 |
| Permisos canónicos documentales de referencia            |         140 |
| Combinaciones legacy de flags contradictorias observadas |          14 |
| Empleados físicos observados                             |          59 |
| Asignaciones de sede observadas                          |          91 |
| Asignaciones de área observadas                          |           1 |
| Habilitaciones de rol operativo observadas               |          16 |
| Turnos físicos observados                                |       2.844 |
| Turnos publicados observados                             |       2.723 |
| Brechas físicas registradas                              |          16 |
| Requisitos de prueba derivados                           |          10 |

Las cifras físicas son un snapshot agregado de solo lectura. La ausencia de
contradicciones en varias relaciones actuales no demuestra que el contrato
esté implementado, que futuros cambios estén protegidos ni que todos los
consumidores produzcan la misma respuesta.

---

#### 3. Identidad canónica del bloqueo

La identidad pública única es:

```text
reason_code = AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT
```

| Propiedad                   | Valor                                                                                                           |
| --------------------------- | --------------------------------------------------------------------------------------------------------------- |
| Dominio                     | `AUTHORIZATION_CONFIGURATION`                                                                                   |
| Decisión final              | `DENY`, únicamente cuando la modalidad exige un carril inválido y ningún carril independiente completo autoriza |
| Estado público              | `ADMINISTRATIVE_CONFIGURATION_INCONSISTENT`                                                                     |
| Categoría pública           | `CONFIGURATION_CONFLICT`                                                                                        |
| Estado HTTP no navegacional | `409 Conflict`                                                                                                  |
| Ejecutable                  | `false`                                                                                                         |
| Sesión                      | preservada                                                                                                      |
| Reintento automático        | prohibido                                                                                                       |
| Recuperación                | revisión administrativa y solicitud nueva después de corregir la fuente                                         |
| Efectos empresariales       | `0`                                                                                                             |

Quedan prohibidos como identidad pública alternativa:

- `AUTH_ERROR`;
- `CONFIG_ERROR` sin namespace;
- `INVALID_CONFIG`;
- `MISSING_PERMISSION`;
- `NO_PERMISSION`;
- `UNKNOWN_PERMISSION`;
- `OUT_OF_SHIFT`;
- `TECHNICAL_ERROR`;
- mensajes SQL, de Supabase o de un consumidor;
- un booleano `false` sin procedencia.

El código público es estable y no se traduce. El copy humano podrá localizarse.

---

#### 4. Definición exacta de configuración inconsistente

Existe configuración administrativa inconsistente cuando una fuente
obligatoria fue consultada de forma concluyente y presenta al menos una de
estas condiciones:

- falta un elemento contractual obligatorio distinto del código de permiso
  solicitado;
- existen dos o más configuraciones simultáneamente autoritativas e
  incompatibles;
- la forma almacenada no corresponde con el modo declarado;
- una relación referencia una identidad inexistente o territorialmente
  incompatible;
- un estado, tipo, modalidad, versión o código utiliza un valor no admitido;
- una instancia amplía una plantilla o un límite superior;
- el contexto combina hechos de snapshots, revisiones o instantes
  incompatibles;
- el consumidor no soporta la versión contractual o de esquema vigente;
- un problema estructural utiliza código, severidad, sujeto, fuente o mensaje
  distintos del catálogo congelado;
- la configuración no puede reproducirse determinísticamente con las mismas
  fuentes y versiones.

No existe esta razón cuando el sistema encontró una configuración coherente
que simplemente produce una denegación, una ausencia normal o una restricción
válida.

```text
CONFIGURACION COHERENTE + RESULTADO NEGATIVO
≠
CONFIGURACION INCONSISTENTE
```

```text
FUENTE NO DISPONIBLE
≠
LECTURA CONCLUYENTE DE CONFIGURACION INVALIDA
```

---

#### 5. Condición exacta de aplicación

`AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT` se produce únicamente cuando:

1. la superficie requiere evaluación de autorización;
2. la autenticación, el principal y la identidad aplicable fueron resueltos o
   conservan una razón anterior distinta;
3. la aplicación y el permiso solicitado se conocen suficientemente para
   seleccionar su contrato, salvo que la inconsistencia sea precisamente la
   ausencia o contradicción del contrato de aplicación;
4. las fuentes obligatorias respondieron y permitieron concluir;
5. existe un `StructuralIssue` catalogado o una contradicción contractual
   equivalente cuya propiedad corresponde a configuración;
6. no existe una razón pública más específica ya concluyente;
7. el problema invalida todos los carriles o el carril exigido por la
   modalidad;
8. ningún carril independiente completo produce `ALLOW`;
9. la decisión se vuelve a comprobar antes de cualquier efecto.

Forma lógica:

```text
CONFIGURATION_READ = CONCLUSIVE
AND
CONFIGURATION_CONFLICT = TRUE
AND
SPECIFIC_REASON_OWNER = NONE
AND
REQUIRED_LANE_INVALID = TRUE
AND
ALTERNATIVE_COMPLETE_ALLOW = FALSE
→
AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT
```

Una lista vacía, un `null` legítimo, la falta ordinaria de turno o check-in y
la ausencia de un grant no satisfacen esta fórmula.

---

#### 6. Composición por carriles

Los problemas estructurales conservan la severidad aprobada en
`AUTH-CTX-015`:

| Severidad              | Efecto sobre carriles             |
| ---------------------- | --------------------------------- |
| `BLOCKING_ALL`         | base y operativo quedan `INVALID` |
| `BLOCKING_BASE`        | solo base queda `INVALID`         |
| `BLOCKING_OPERATIONAL` | solo operativo queda `INVALID`    |

La modalidad gobierna la decisión final:

| Modalidad              | Regla ante inconsistencia                                                                                  |
| ---------------------- | ---------------------------------------------------------------------------------------------------------- |
| `BASE_ONLY`            | una inconsistencia `BLOCKING_BASE` o `BLOCKING_ALL` produce esta razón                                     |
| `OPERATIONAL_ONLY`     | una inconsistencia `BLOCKING_OPERATIONAL` o `BLOCKING_ALL` produce esta razón                              |
| `BASE_OR_OPERATIONAL`  | un carril inválido no bloquea un `ALLOW` completo del otro; esta razón solo se publica si ninguno autoriza |
| `BASE_AND_OPERATIONAL` | cualquier carril requerido inválido deniega la decisión final mediante esta razón                          |

Queda prohibido:

- convertir `BLOCKING_BASE` en bloqueo operativo;
- convertir `BLOCKING_OPERATIONAL` en bloqueo base;
- ocultar un `BLOCKING_ALL` mediante un grant;
- mezclar fragmentos de dos carriles incompletos;
- tratar `WARNING` o `INFO` como `ALLOW`;
- tratar `UNAVAILABLE` como `INVALID` sin contradicción.

Si `BASE_OR_OPERATIONAL` autoriza por un carril completo, el problema del otro
carril permanece en auditoría y no se presenta como denegación global.

---

#### 7. Fuentes autoritativas

La resolución deberá consumir fuentes versionadas y server-side para, según la
solicitud:

- catálogo de aplicaciones;
- catálogo de permisos y clave completa;
- modalidad de autorización;
- `authorization_requirement`;
- prerrequisitos `N`, `T` o `T+C`;
- clasificación de área, dispositivo y simulación;
- catálogo de roles base y operativos;
- matrices de grants y denegaciones;
- asignaciones de sede y área;
- cobertura administrativa;
- publicación y revisión de turno;
- check-in;
- habilitaciones territoriales de rol;
- configuración y paquete de dispositivo;
- contratos de simulación;
- versiones de `AccessContext` y `AuthorizationDecision`;
- catálogo de 100 códigos estructurales;
- fingerprints y momento de resolución.

No serán autoritativos:

- body, query string o headers empresariales enviados por el cliente;
- `localStorage`;
- estado de React;
- primera fila devuelta sin orden contractual;
- `employees.site_id`, `employees.area_id` o `employees.role` sin adapter
  versionado;
- `navigation_role`;
- aplicación visible;
- último turno;
- selección de sede o área;
- resultado simulado;
- caché sin fingerprint vigente;
- mensajes libres de una RPC o middleware.

---

#### 8. Enrutamiento de razones y propiedad

`ADMINISTRATIVE-CONFIGURATION-STATE-DECISION-MATRIX-001` conserva once perfiles
de enrutamiento:

| Perfil                      | Hecho concluyente                                                                                             | Propietario público                                   |
| --------------------------- | ------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------- |
| `NO_AUTHENTICATED_SESSION`  | sesión ausente, inválida, expirada o revocada                                                                 | `AUTH-ERR-001`                                        |
| `IDENTITY_INACTIVE`         | identidad requerida explícitamente inactiva                                                                   | `AUTH-ERR-002`                                        |
| `APP_ACCESS_DENIED`         | aplicación registrada y evaluación coherente sin acceso                                                       | `AUTH-ERR-003`                                        |
| `PERMISSION_DENIED`         | permiso registrado, configuración coherente y grant insuficiente, deny aplicable o scope mismatch concluyente | `AUTH-ERR-004`, seleccionando perfil base u operativo |
| `ORDINARY_CONTEXT_ABSENCE`  | asignación, sede, área, turno, check-in o rol ausentes/inactivos bajo una configuración coherente             | `AUTH-ERR-005` a `AUTH-ERR-014`                       |
| `DEVICE_RESTRICTION`        | dispositivo coherente restringe la solicitud                                                                  | `AUTH-ERR-015`                                        |
| `SIMULATION_EXECUTION`      | simulación intenta producir autoridad o efectos reales                                                        | `AUTH-ERR-016`                                        |
| `CONFIGURATION_CONFLICT`    | contradicción, ambigüedad, forma inválida, versión incompatible o snapshot mixto                              | `AUTH-ERR-017`                                        |
| `PERMISSION_NOT_REGISTERED` | la clave completa solicitada no existe                                                                        | `AUTH-ERR-018`                                        |
| `TECHNICAL_UNAVAILABLE`     | lectura, red, RPC, proveedor o fuente no permite concluir                                                     | `AUTH-ERR-019`                                        |
| `MESSAGE_DISTRIBUTION`      | adaptación y presentación compartida del resultado                                                            | `AUTH-ERR-020`                                        |

Una misma solicitud no publica dos razones principales. La primera causa
concluyente aplicable prevalece, mientras las causas internas subordinadas se
conservan en auditoría protegida.

---

#### 9. Catálogo estructural heredado

Esta tarea no crea un catálogo paralelo. Consume los `100` códigos congelados
en `AUTH-CTX-015`, su severidad, `subject_type`, `source` y `safe_message`.

Los códigos de disponibilidad —por ejemplo `NO_ACTIVE_SHIFT`,
`NO_ACTIVE_CHECKIN` o `NO_OPERATIONAL_AREA`— no son `StructuralIssue` y no
producen esta razón por sí solos.

Los códigos transversales de configuración con propiedad directa incluyen:

```text
STRUCTURAL_ISSUE_CODE_UNKNOWN
STRUCTURAL_ISSUE_METADATA_INVALID
RESOLVER_CONFIGURATION_MISSING
RESOLVER_CONFIGURATION_AMBIGUOUS
CONTRACT_VERSION_UNSUPPORTED
SCHEMA_VERSION_UNSUPPORTED
RESOLUTION_TIME_INVALID
CONTEXT_SNAPSHOT_MIXED
CONTEXT_STALE
```

También pueden conducir a esta razón, después de aplicar las fronteras de la
sección 8, las contradicciones catalogadas de:

- principal, identidad de dominio y actor;
- empleo y rol base;
- asignaciones y cobertura administrativa;
- revisión, intervalo y pertenencia del turno;
- cardinalidad o coherencia del check-in;
- rol y territorio operativos;
- configuración administrada de dispositivo;
- contrato o escenario de simulación;
- metadatos y frescura del contexto.

La respuesta pública no expone el `issue_code`. El código permanece en el
envelope de auditoría restringida.

---

#### 10. `ADMINISTRATIVE-CONFIGURATION-BLOCKING-CONTRACT-001`

El contrato lógico queda:

```ts
type AdministrativeConfigurationBlockingInput = {
  principal_type: "HUMAN_USER" | "SHARED_DEVICE" | "SYSTEM_SERVICE";
  actor_reference: string | null;
  app_code: string;
  permission_key: string | null;
  authorization_mode: string | null;
  authorization_requirement: string | null;
  access_context_id: string | null;
  context_contract_version: string | null;
  decision_contract_version: string | null;
  base_lane_status: "READY" | "UNAVAILABLE" | "INVALID" | "NOT_APPLICABLE";
  operational_lane_status: "READY" | "UNAVAILABLE" | "INVALID" | "NOT_APPLICABLE";
  structural_issues: StructuralIssue[];
  resource_reference: string | null;
  configuration_read: "CONCLUSIVE" | "UNAVAILABLE";
  resolved_at: string;
  source_versions: Record<string, string>;
  context_fingerprint: string;
};
```

```ts
type AdministrativeConfigurationBlockingResult = {
  final_decision: "DENY" | "CONTINUE_BY_INDEPENDENT_LANE";
  reason_code: "AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT" | null;
  public_state: "ADMINISTRATIVE_CONFIGURATION_INCONSISTENT" | null;
  category: "CONFIGURATION_CONFLICT" | null;
  http_status: 409 | null;
  executable: false;
  effects_committed: false;
  session_effect: "PRESERVE_SESSION";
  automatic_retry: false;
  recovery_actions: (
    | "REQUEST_ADMINISTRATIVE_REVIEW"
    | "RETURN_TO_SAFE_SURFACE"
    | "ISSUE_FRESH_REQUEST_AFTER_CORRECTION"
  )[];
};
```

La forma es contractual. No autoriza una implementación física dentro de esta
tarea.

---

#### 11. Entradas mínimas y determinismo

Las entradas mínimas son:

- principal y actor efectivo;
- aplicación y clave completa solicitadas;
- modalidad y requisitos contractuales;
- snapshot de contexto y carriles;
- conjunto deduplicado y ordenado de `StructuralIssue`;
- recurso o borrador exacto cuando aplique;
- versiones de catálogos, matrices y contratos;
- instante de servidor;
- fingerprints de fuentes;
- resultado de disponibilidad de cada fuente.

Para las mismas entradas autoritativas deberá producirse exactamente el mismo
resultado.

La identidad lógica de un problema conserva:

```text
issue_code
+
subject_type
+
subject_id
+
source
```

La causa raíz se emite una sola vez. No se agregan problemas derivados cuando
un nodo nulo es consecuencia directa de una contradicción anterior.

Un orden físico de filas, un fallback legacy o una selección del cliente no
pueden cambiar el resultado.

---

#### 12. Familias privadas de configuración

Sin crear nuevos códigos estructurales, los diagnósticos se agrupan para
observabilidad en ocho familias privadas:

| Familia                          | Alcance                                                                   |
| -------------------------------- | ------------------------------------------------------------------------- |
| `CONTRACT_AND_METADATA`          | código estructural, metadatos, forma, versión y schema                    |
| `IDENTITY_AND_ATTRIBUTION`       | principal, identidad de dominio, actor, empleado y delegación             |
| `BASE_ROLE_AND_COVERAGE`         | rol base, asignaciones y cobertura administrativa                         |
| `SHIFT_AND_CHECKIN`              | revisión, intervalo, cardinalidad, pertenencia y estados terminales       |
| `OPERATIONAL_ROLE_AND_TERRITORY` | rol, sede, área, habilitación, fuente y pertenencia                       |
| `DEVICE_CONFIGURATION`           | vínculo, plantilla, instancia, apps, paquete y territorio del dispositivo |
| `SIMULATION_CONFIGURATION`       | escenario, versión, procedencia y separación de planos                    |
| `FRESHNESS_AND_SNAPSHOT`         | resolución temporal, caché, mezcla, obsolescencia y fingerprint           |

Las familias no salen en la respuesta pública y no sustituyen los códigos de
`AUTH-CTX-015`.

---

#### 13. Frontera con autenticación

| Situación                                                                                             | Resultado                                                        |
| ----------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| no existe sesión válida                                                                               | `AUTH-ERR-001`                                                   |
| la sesión es válida, pero falta vínculo empresarial requerido                                         | `AUTH-ERR-017` si la ausencia contradice el contrato del dominio |
| existen varios vínculos empresariales incompatibles                                                   | `AUTH-ERR-017`                                                   |
| falta URL, clave pública o configuración obligatoria y la ausencia se comprueba de forma determinista | `AUTH-ERR-017`; no simular sesión perdida                        |
| Auth, red o proveedor lanza error y no permite concluir                                               | `AUTH-ERR-019`                                                   |
| la sesión es válida y la configuración técnica es coherente                                           | continuar                                                        |

Una configuración ausente no autoriza limpiar todas las cookies, cerrar la
sesión o redirigir indefinidamente al login.

```text
SE COMPROBO UNA CONFIGURACION INVALIDA
≠
NO SE PUDO VERIFICAR LA CONFIGURACION
```

---

#### 14. Frontera con identidad e inactividad

| Situación                                                 | Resultado                |
| --------------------------------------------------------- | ------------------------ |
| identidad requerida explícitamente inactiva               | `AUTH-ERR-002`           |
| `is_active = null` o estado no reconocido                 | `AUTH-ERR-017`           |
| identidad laboral requerida inexistente                   | `AUTH-ERR-017`           |
| varias identidades laborales candidatas                   | `AUTH-ERR-017`           |
| actor no coincide con la identidad resuelta               | `AUTH-ERR-017`           |
| cliente legítimo sin identidad laboral en dominio cliente | no aplica carril laboral |
| fuente de identidad no responde                           | `AUTH-ERR-019`           |

La tarea no convierte toda ausencia de empleado en usuario inactivo. Tampoco
convierte un usuario Auth válido en empleado por coincidencia de correo, UUID
legacy, rol o sede.

---

#### 15. Frontera con aplicación y permiso

| Situación                                                                 | Resultado                                                                |
| ------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| `app_code` no está registrado y la superficie declara que debe existir    | `AUTH-ERR-017`                                                           |
| aplicación conocida y explícitamente inactiva conforme a su ciclo de vida | estado de disponibilidad de aplicación; no negar al actor por inferencia |
| aplicación activa sin permiso exacto `access`                             | `AUTH-ERR-017`                                                           |
| clave completa solicitada no existe                                       | `AUTH-ERR-018`                                                           |
| permiso registrado pero inactivo o con contrato incompleto                | `AUTH-ERR-017`                                                           |
| falta `authorization_requirement`                                         | `AUTH-ERR-017`                                                           |
| falta modalidad o contiene valor no admitido                              | `AUTH-ERR-017`                                                           |
| aplicación y permiso están registrados y su contrato es coherente         | continuar                                                                |
| consulta de catálogo falla                                                | `AUTH-ERR-019`                                                           |

La clave canónica es la composición exacta de aplicación y código. El sufijo
`access` aislado no identifica un permiso global.

---

#### 16. Frontera con grants, denies y scope

Una configuración coherente puede producir legítimamente `DENY`.

No son configuración inconsistente:

- ausencia de allow coincidente;
- deny individual;
- deny transversal;
- grant vencido;
- scope mismatch concluyente;
- recurso fuera del alcance;
- carril no admitido por la modalidad;
- intersección vacía de autoridad válida.

Es configuración inconsistente cuando las mismas identidades de política
contienen filas incompatibles que no pueden resolverse mediante precedencia,
la forma de scope contradice su modo, una referencia obligatoria no existe o
el contrato no permite determinar qué carril evaluar.

```text
MATRIZ VALIDA SIN ALLOW
→ DENEGACION DE PERMISO
```

```text
MATRIZ CONTRADICTORIA SIN PRECEDENCIA RESOLUBLE
→ AUTH-ERR-017
```

---

#### 17. Asignaciones y cobertura administrativa

Ausencias ordinarias conservan sus razones específicas:

- sin sede asignada: `AUTH-ERR-005`;
- sede asignada o requerida inactiva: `AUTH-ERR-006`;
- sin área asignada cuando es obligatoria: `AUTH-ERR-007`;
- área requerida inactiva: `AUTH-ERR-008`.

Pertenecen a `AUTH-ERR-017`:

- asignaciones duplicadas con datos contradictorios;
- más de una sede primaria vigente;
- más de un área primaria vigente para la misma sede;
- asignación que referencia una sede o área inexistente;
- área asignada a una sede distinta de su propietaria;
- modo de cobertura desconocido;
- fuente de cobertura inválida;
- identificadores incompatibles con el modo declarado;
- cobertura que amplía indebidamente el rol;
- cobertura no determinista;
- `null` interpretado como organización;
- mezcla de asignaciones y valores legacy sin regla versionada.

Una contradicción `BLOCKING_BASE` no invalida por sí sola un carril operativo
independiente completo.

---

#### 18. Turnos y check-in

Ausencias ordinarias conservan:

- sin turno publicado: `AUTH-ERR-009`;
- turno válido fuera de ventana: `AUTH-ERR-010`;
- check-in requerido ausente: `AUTH-ERR-011`;
- rol operativo faltante: `AUTH-ERR-012`.

Pertenecen a `AUTH-ERR-017`, cuando la lectura es concluyente:

- dos revisiones publicadas autoritativas;
- revisión no publicada seleccionada como vigente;
- tipo, estado, intervalo o zona horaria inválidos;
- turno de otro empleado;
- sede inválida o área de otra sede;
- más de un turno vigente candidato;
- campos mezclados entre revisiones;
- turno seleccionado por el cliente;
- check-in no confirmado presentado como activo;
- sesión sin identificador;
- mismatch de actor, turno, sede o área;
- tiempo, cardinalidad o secuencia terminal inválidos;
- sesión expirada o cerrada presentada como activa;
- evento offline pendiente presentado como confirmado.

Las causas derivadas de un `SHIFT_OVERLAP` se suprimen. No se inventan además
rol, sede o área desconocidos.

---

#### 19. Rol y territorio operativos

Con configuración territorial coherente:

- rol ausente pertenece a `AUTH-ERR-012`;
- rol canónico no habilitado en sede pertenece a `AUTH-ERR-013`;
- rol canónico habilitado en sede pero no en el área exacta pertenece a
  `AUTH-ERR-014`.

Pertenecen a `AUTH-ERR-017`:

- código de rol desconocido, inactivo o deprecado contenido en un turno que se
  pretende vigente;
- rol resuelto distinto del turno;
- configuración territorial contradictoria;
- modalidad site-wide/area-scoped no resoluble;
- sede o área inexistentes dentro del contexto construido;
- área de otra sede;
- fuente territorial inválida;
- relación activa que referencia un catálogo incompatible;
- cardinalidad o matriz que no permite determinar una habilitación única.

Un grant no repara una configuración territorial inválida. Un perfil o
`navigation_role` tampoco reemplazan el rol del turno.

---

#### 20. Dispositivo compartido

`AUTH-ERR-015` conserva propiedad sobre una restricción concluyente del
principal o de una instancia compartida cuya configuración efectiva es
resoluble.

```text
DISPOSITIVO COHERENTE
+
APP, PAQUETE, POLITICA O TERRITORIO NO PERMITEN
→ AUTH-ERR-015
```

Una contradicción global de catálogo, contrato o snapshot que impide resolver
la evaluación para cualquier principal puede producir `AUTH-ERR-017`.

Cuando el principal es `SHARED_DEVICE`, los problemas propios de vínculo,
estado, plantilla, instancia, aplicación, paquete, sesión de actor o territorio
se presentan públicamente mediante `AUTH-ERR-015`, aunque internamente estén
catalogados como `StructuralIssue`. Esto evita dos códigos públicos para el
mismo terminal.

Una sesión personal en hardware compartido no se convierte en dispositivo por
la forma física del equipo.

---

#### 21. Simulación

La simulación conserva tres resultados hipotéticos:

```text
WOULD_ALLOW
WOULD_DENY
INDETERMINATE
```

Reglas:

- escenario incompleto o inválido produce `INDETERMINATE` o `WOULD_DENY`
  dentro del evaluador, no una acción real;
- un intento de ejecutar con autoridad simulada pertenece a `AUTH-ERR-016`;
- versión contractual, esquema, metadatos o snapshot de la herramienta
  incompatibles pueden producir `AUTH-ERR-017` para el acceso o evaluación de
  la herramienta;
- fuente indisponible pertenece a `AUTH-ERR-019`;
- una simulación nunca corrige la configuración real;
- un resultado hipotético no se usa como fallback.

---

#### 22. Frontera con error técnico

La distinción obligatoria es:

| Estado de la fuente                                                       | Clasificación                       |
| ------------------------------------------------------------------------- | ----------------------------------- |
| respondió y demostró contradicción                                        | `AUTH-ERR-017`                      |
| respondió y demostró configuración coherente                              | continuar o emitir razón específica |
| no respondió, timeout, excepción, conexión caída o resultado no confiable | `AUTH-ERR-019`                      |
| código de permiso no existe tras lectura concluyente                      | `AUTH-ERR-018`                      |

No se transformará un timeout en “configuración inválida”. No se transformará
una fila contradictoria en “servicio temporalmente caído”.

El error bruto de SQL, Supabase, middleware, RPC o proveedor no se muestra en
la respuesta pública.

---

#### 23. Versiones, frescura y snapshot

Los siguientes códigos estructurales pertenecen a esta tarea cuando invalidan
la decisión final:

- `CONTRACT_VERSION_UNSUPPORTED`;
- `SCHEMA_VERSION_UNSUPPORTED`;
- `RESOLUTION_TIME_INVALID`;
- `CONTEXT_SNAPSHOT_MIXED`;
- `CONTEXT_STALE`.

Al detectar obsolescencia antes de un efecto, el servidor podrá descartar el
snapshot y resolver una vez un contexto completamente nuevo. No podrá:

- actualizar un solo nodo;
- conservar grants anteriores;
- cambiar únicamente turno, actor o área;
- reutilizar un `ALLOW`;
- repetir una mutación;
- consumir una clave de idempotencia como si hubiera existido un intento
  autorizado.

Si la nueva resolución es coherente, se continúa normalmente. Si vuelve a
producir una contradicción concluyente, se emite `AUTH-ERR-017`. Si la nueva
lectura falla, se emite `AUTH-ERR-019`.

---

#### 24. Recuperación

La recuperación segura es administrativa y explícita:

1. conservar la sesión y el estado no sensible de navegación;
2. impedir toda mutación o exposición adicional;
3. registrar correlación y diagnóstico privado;
4. permitir volver a una superficie segura ya autorizada;
5. ofrecer `Solicitar revisión` únicamente cuando exista un canal autorizado, funcional y disponible; si no existe, conservar `Volver` como única acción principal;
6. corregir la fuente mediante el proceso propietario;
7. invalidar cachés y snapshots afectados;
8. emitir una solicitud nueva después de la corrección;
9. evaluar desde cero aplicación, permiso, contexto, recurso y versiones.

Queda prohibido sugerir o ejecutar como recuperación:

- seleccionar otra sede o área para “probar”;
- cambiar el rol en el cliente;
- usar un dispositivo o actor anterior;
- activar filas automáticamente;
- elegir la primera configuración candidata;
- degradar modalidad o prerrequisito;
- crear un grant;
- ignorar la contradicción;
- repetir automáticamente la acción.

---

#### 25. Regla de cero efectos

Antes de cualquier efecto empresarial, el servidor deberá confirmar que la
configuración requerida es coherente y que la decisión final es `ALLOW`.

Ante esta razón quedan prohibidos:

- inserciones, actualizaciones o eliminaciones de dominio;
- cambios de estado;
- movimientos de inventario;
- preparación, despacho o recepción;
- ventas, pagos, cierres o devoluciones;
- publicación de turnos o asistencia;
- creación o modificación de roles, permisos o asignaciones como fallback;
- impresión, exportación o emisión de documentos;
- notificaciones, webhooks o eventos empresariales de éxito;
- jobs o colas derivados de la acción;
- suscripciones protegidas nuevas;
- cachear un `ALLOW` parcial;
- auditoría de éxito;
- consumo irreversible de idempotency key.

Solo se permite registrar el intento bloqueado y la evidencia técnica mínima.

---

#### 26. Envelope público

Ejemplo no vinculante de forma pública:

```json
{
  "ok": false,
  "reason_code": "AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT",
  "state": "ADMINISTRATIVE_CONFIGURATION_INCONSISTENT",
  "category": "CONFIGURATION_CONFLICT",
  "message": "La configuración necesaria para autorizar esta acción es inconsistente. Solicita una revisión administrativa antes de continuar.",
  "executable": false,
  "effects_committed": false,
  "recovery_actions": [
    "REQUEST_ADMINISTRATIVE_REVIEW",
    "RETURN_TO_SAFE_SURFACE",
    "ISSUE_FRESH_REQUEST_AFTER_CORRECTION"
  ]
}
```

El transporte no navegacional utiliza `409 Conflict`.

No se incluyen:

- `issue_code` estructural;
- severidad o source interna;
- nombres de tablas, columnas, policies o funciones;
- variables de entorno;
- UUID de actor, empleado, sede, área, turno, rol o dispositivo;
- lista de configuraciones candidatas;
- grants, denies o roles elegibles;
- stack trace;
- SQL;
- mensaje bruto de Supabase;
- detalles que permitan evadir el bloqueo.

---

#### 27. Copy y experiencia

Copy aprobado en español:

| Elemento           | Texto exacto                                                                                                                       |
| ------------------ | ---------------------------------------------------------------------------------------------------------------------------------- |
| Título             | `No pudimos validar la configuración`                                                                                              |
| Mensaje            | `La configuración necesaria para autorizar esta acción es inconsistente. Solicita una revisión administrativa antes de continuar.` |
| Acción principal   | `Volver`                                                                                                                           |
| Acción condicional | `Solicitar revisión`, solo cuando existe un canal autorizado, funcional y disponible                                               |
| Código de soporte  | `AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT`                                                                                   |

Reglas de experiencia:

1. confirmar que no se aplicaron cambios;
2. no culpar al trabajador;
3. no pedir que cambie de rol, sede o área localmente;
4. no afirmar que “no tiene permiso”;
5. no cerrar sesión;
6. no prometer corrección automática;
7. no ofrecer reintento inmediato de una mutación;
8. no mostrar detalles internos de la contradicción;
9. preservar accesos independientes válidos;
10. permitir copiar un código de soporte sin exponer la causa privada.

En superficies no visuales, el envelope tipado sustituye el copy, pero conserva
el mismo `reason_code`.

---

#### 28. Privacidad y minimización

La respuesta pública no revelará:

- cuál fila está duplicada;
- cuál rol o permiso sería correcto;
- qué sede o área es candidata;
- qué trabajador, dispositivo o recurso causó el conflicto;
- qué versión interna está desplegada;
- qué configuración falta;
- qué variable de entorno existe o no existe;
- qué tabla, función o policy se consultó;
- reglas de precedencia internas;
- datos personales;
- secretos o credenciales.

La auditoría privada conservará identificadores opacos estrictamente
necesarios. Los eventos analíticos públicos usarán categorías agregadas y no
valores de configuración.

---

#### 29. Auditoría

El intento bloqueado deberá permitir registrar, en un canal protegido:

```text
audit_event_id
correlation_id
actor_reference
principal_type
app_code
permission_key
resource_reference opaca
reason_code publico
structural_issue_codes privados
issue_severities
issue_sources
lane_statuses
modalidad
versiones contractuales
fingerprints de fuentes
resolved_at
request_channel
final_decision
effects_committed = false
```

Reglas:

- se conserva causa raíz y se suprimen cascadas;
- duplicados exactos se registran una sola vez;
- no se guardan tokens, cookies, PIN ni payload sensible;
- una corrección posterior no altera el evento histórico;
- el evento de bloqueo no equivale a evidencia de una acción ejecutada;
- la ausencia de evento de éxito es verificable;
- la auditoría diferencia configuración contradictoria, permiso desconocido y
  fallo técnico.

---

#### 30. Invalidación, concurrencia e idempotencia

Cambios en cualquiera de estas fuentes invalidan contextos y decisiones
afectados:

- aplicación o permiso;
- modalidad, prerrequisito o clasificación;
- rol, matriz, grant o deny;
- asignación de sede o área;
- cobertura administrativa;
- turno, revisión o check-in;
- habilitación territorial;
- dispositivo, plantilla, paquete o sesión de actor;
- contrato de simulación;
- catálogo estructural;
- versión de contexto o decisión.

Toda mutación revalida antes del commit. Realtime, caché, offline y procesos
asíncronos no reutilizan una configuración anterior.

Ante carreras concurrentes:

- un cambio detectado invalida la decisión;
- un resultado tardío se descarta por fingerprint;
- `409` no confirma ni consume el efecto empresarial;
- una clave de idempotencia no se marca como completada;
- una nueva solicitud después de corregir usa un nuevo contexto y revalida el
  recurso;
- no existe replay automático.

---

#### 31. `ADMINISTRATIVE-CONFIGURATION-STATE-DECISION-MATRIX-001`

|    # | Escenario                                                                   | Decisión                                         | Razón pública o destino                            |
| ---: | --------------------------------------------------------------------------- | ------------------------------------------------ | -------------------------------------------------- |
|    1 | superficie pública que no exige autorización laboral                        | continuar                                        | no aplica                                          |
|    2 | superficie protegida sin sesión válida                                      | denegar antes                                    | `AUTH-ERR-001`                                     |
|    3 | identidad requerida explícitamente inactiva                                 | denegar antes                                    | `AUTH-ERR-002`                                     |
|    4 | aplicación registrada y configuración coherente sin acceso                  | denegar por aplicación                           | `AUTH-ERR-003`                                     |
|    5 | clave completa de permiso no registrada                                     | no evaluar matrices                              | `AUTH-ERR-018`                                     |
|    6 | consulta de catálogo, contexto o matriz falla                               | fail closed temporal                             | `AUTH-ERR-019`                                     |
|    7 | superficie exige una aplicación cuyo `app_code` no existe                   | denegar por configuración                        | `AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT`   |
|    8 | aplicación activa sin permiso exacto de acceso                              | denegar por configuración                        | `AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT`   |
|    9 | permiso registrado pero inactivo para una solicitud que lo exige            | denegar por configuración                        | `AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT`   |
|   10 | falta `authorization_requirement`                                           | denegar por configuración                        | `AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT`   |
|   11 | modalidad ausente o no admitida                                             | denegar por configuración                        | `AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT`   |
|   12 | `BASE_ONLY` con cobertura de forma contradictoria                           | denegar carril base y decisión final             | `AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT`   |
|   13 | `OPERATIONAL_ONLY` con dos turnos vigentes candidatos                       | denegar carril operativo y decisión final        | `AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT`   |
|   14 | `BASE_OR_OPERATIONAL`, base inválido y operativo completo `ALLOW`           | autorizar por operativo; conservar issue privado | ninguna razón global                               |
|   15 | `BASE_OR_OPERATIONAL`, operativo inválido y base completo `ALLOW`           | autorizar por base; conservar issue privado      | ninguna razón global                               |
|   16 | `BASE_OR_OPERATIONAL`, ambos carriles inválidos o sin `ALLOW` completo      | denegar decisión final                           | esta razón si la causa determinante es estructural |
|   17 | `BASE_AND_OPERATIONAL`, uno de los carriles requeridos es inválido          | denegar decisión final                           | `AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT`   |
|   18 | configuración coherente, pero no existe sede asignada requerida             | denegar por ausencia ordinaria                   | `AUTH-ERR-005`                                     |
|   19 | asignaciones duplicadas o varias primarias vigentes                         | denegar carril afectado                          | `AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT`   |
|   20 | configuración coherente, pero no existe turno publicado                     | denegar carril operativo                         | `AUTH-ERR-009`                                     |
|   21 | rol canónico no habilitado en la sede                                       | denegar por compatibilidad                       | `AUTH-ERR-013`                                     |
|   22 | dispositivo coherente restringe app, permiso, actor o territorio            | denegar por dispositivo                          | `AUTH-ERR-015`                                     |
|   23 | una simulación intenta ejecutar una acción real                             | denegar ejecución                                | `AUTH-ERR-016`                                     |
|   24 | contexto obsoleto o mixto persiste después de una resolución completa nueva | denegar por configuración                        | `AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT`   |

La matriz no permite decisiones nulas, combinación de carriles incompletos ni
fallback a datos legacy.

---

#### 32. Precedencia

El orden mínimo relevante queda:

```text
1. NATURALEZA PUBLICA O PROTEGIDA DE LA SUPERFICIE
2. DISPONIBILIDAD TECNICA DE LAS FUENTES
3. AUTENTICACION Y PRINCIPAL
4. IDENTIDAD Y ACTIVIDAD
5. APLICACION Y REGISTRO DE LA CLAVE SOLICITADA
6. INTEGRIDAD DE CONTRATOS, CATALOGOS, VERSIONES Y SNAPSHOT
7. READINESS E INTEGRIDAD DE CADA CARRIL
8. BLOQUEOS CONTEXTUALES ESPECIFICOS
9. DISPOSITIVO Y SIMULACION
10. GRANTS, DENIES, SCOPE Y RECURSO
11. COMPOSICION POR MODALIDAD
12. DECISION FINAL
```

Reglas:

- una fuente caída precede al diagnóstico de configuración;
- un permiso no registrado conserva `AUTH-ERR-018`;
- una contradicción impide afirmar ausencia ordinaria o deny legítimo;
- una razón específica coherente prevalece sobre esta razón genérica de
  integridad;
- un `BLOCKING_ALL` no se oculta con grants;
- un carril independiente completo puede autorizar `BASE_OR_OPERATIONAL`;
- toda revalidación ocurre antes del efecto.

---

#### 33. `ADMINISTRATIVE-CONFIGURATION-CHANNEL-RESPONSE-MATRIX-001`

| Canal                                 | Detección mínima                                            | Respuesta                                                         | Efectos | Recuperación                                 |
| ------------------------------------- | ----------------------------------------------------------- | ----------------------------------------------------------------- | ------- | -------------------------------------------- |
| Launcher y navegación                 | adapter server-side valida aplicación, versión y contexto   | pantalla de bloqueo o ruta segura con código estable              | 0       | revisión y volver                            |
| React Server Components               | resolutor consume snapshot completo                         | estado de configuración sin renderizar datos protegidos           | 0       | superficie segura                            |
| Server Actions                        | gate previo a lógica de dominio                             | resultado tipado y `409`                                          | 0       | solicitud nueva después de corregir          |
| Route Handlers y API                  | middleware o handler central                                | envelope JSON y `409`                                             | 0       | cliente no reintenta automáticamente         |
| RPC y PostgREST                       | adapter valida contexto y contrato antes de invocar negocio | error tipado mapeado al código público                            | 0       | corregir y reevaluar                         |
| RLS y Data API                        | policies no interpretan contradicción como wildcard         | cero filas o error controlado más diagnóstico de servidor         | 0       | no fallback cliente                          |
| Edge Functions                        | evaluador común antes de service role o efectos             | envelope equivalente                                              | 0       | revisión administrativa                      |
| Realtime                              | autorización de canal y payload usa fingerprint vigente     | no suscribir o cerrar canal afectado                              | 0       | suscripción nueva después de corregir        |
| Cliente offline y caché               | snapshot y versiones se validan antes de cola               | intento permanece no ejecutable                                   | 0       | descartar y crear operación nueva            |
| Jobs, colas, webhooks e integraciones | worker revalida contrato y recurso                          | mensaje bloqueado o dead-letter controlado sin evento empresarial | 0       | intervención y replay explícito reautorizado |

Ningún canal transforma el conflicto en login, lista vacía permisiva, primera
fila, `false` sin razón o retry automático.

---

#### 34. `ADMINISTRATIVE-CONFIGURATION-APPLICATION-COVERAGE-REGISTER-001`

| Aplicación | Decisión                                                                                                                                                                   |
| ---------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| SHELL      | aplica a registro de aplicaciones, contratos compartidos, login, launcher y contexto; no convierte falta de sesión en configuración                                        |
| ANIMA      | aplica a configuración laboral, turnos, check-in, identidad y asignaciones; ausencias ordinarias conservan razones propias                                                 |
| AURA       | su estado diferido no se presenta como inconsistencia; una referencia activa contradictoria sí falla cerrada                                                               |
| FOGO       | aplica a contratos de producción, roles, territorio y permisos; ninguna receta o lote se modifica                                                                          |
| NEXO       | aplica a inventario, remisiones, dispositivos y contexto operativo; no fabrica sede, área, turno o rol                                                                     |
| NUMERA     | aplica a contratos financieros y de alcance; no expone costos ni ejecuta contabilización                                                                                   |
| ORIGO      | aplica a compras, proveedores, recepción y catálogo; no degrada configuración administrativa a permiso operativo                                                           |
| PASS       | conserva identidad y autorización de cliente separadas; solo usa esta razón para configuración compartida de plataforma o contrato, no para denegación laboral del cliente |
| PULSO      | aplica antes de venta, pago, caja, impresión o cierre; cero efectos de POS                                                                                                 |
| VISO       | aplica a la administración de roles, permisos, apps, asignaciones y simulación; VISO no puede corregir automáticamente la fila contradictoria dentro del intento bloqueado |

Reconciliación:

```text
aplicaciones esperadas = 10
aplicaciones materializadas = 10
faltantes = 0
duplicados = 0
aplicaciones autorizadas por configuracion contradictoria = 0
```

La aplicación no determina por sí sola la razón. La propiedad se resuelve por
contrato, fuente, carril y causa.

---

#### 35. Snapshot físico de solo lectura

El estado desplegado observado presenta:

| Elemento                                                           |         Resultado observado |
| ------------------------------------------------------------------ | --------------------------: |
| Aplicaciones registradas                                           |                          10 |
| Aplicaciones activas                                               |                          10 |
| Códigos de aplicación duplicados                                   |                           0 |
| Aplicaciones con sufijo activo `access`                            |                          10 |
| Permisos físicos                                                   |                         179 |
| Permisos físicos activos                                           |                         179 |
| Pares `(app_id, code)` duplicados                                  |                           0 |
| Claves completas duplicadas después de componer app y código       |                           0 |
| Sufijos de permiso repetidos globalmente                           |                    5 grupos |
| Columna física `authorization_requirement`                         |                     ausente |
| Columna física de modalidad canónica                               |                     ausente |
| `is_operational = true`                                            |                          30 |
| `requires_active_work_context = true`                              |                          43 |
| Filas `requires_active_work_context=true` e `is_operational=false` |                          14 |
| Empleados                                                          |                          59 |
| Empleados con `is_active = null`                                   |                           0 |
| Empleados con rol base desconocido o inactivo                      |                           0 |
| Asignaciones de sede                                               |                          91 |
| Duplicados o varias sedes primarias activas                        |                           0 |
| Asignaciones de área                                               |                           1 |
| Duplicados o varias áreas primarias activas observadas             |                           0 |
| Habilitaciones de rol operativo                                    |                  16 activas |
| Contradicciones observadas de rol, sede o área                     |                           0 |
| Turnos                                                             |                       2.844 |
| Turnos publicados                                                  |                       2.723 |
| Referencias básicas inválidas observadas en turnos publicados      |                           0 |
| Funciones públicas inspeccionadas con `blocked_reasons`            |                           2 |
| Funciones públicas inspeccionadas con `structural_issues`          |                           0 |
| Funciones públicas inspeccionadas con `authorization_requirement`  |                           0 |
| Funciones principales de contexto/permiso observadas               | 5, todas `SECURITY DEFINER` |

La tabla `app_permissions` almacena el código como sufijo dentro de una
aplicación; la clave canónica requiere componer `apps.code + '.' + code`.

El middleware actual redirige tanto `no-config` como excepciones de Auth hacia
login; además puede limpiar cookies ante una excepción. Este comportamiento no
distingue configuración inconsistente, ausencia real de sesión y fallo
técnico.

Los conteos limpios de asignaciones, matriz y turnos no certifican constraints,
versionado, contratos, consumidores ni comportamiento multicanal futuro.

---

#### 36. `ADMINISTRATIVE-CONFIGURATION-PHYSICAL-RECONCILIATION-001`

|    # | Brecha física                                                                                                                  | Estado                        | Riesgo                                                                                       | Destino exacto                                                                                                                         |
| ---: | ------------------------------------------------------------------------------------------------------------------------------ | ----------------------------- | -------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | `app_permissions` no materializa modalidad ni `authorization_requirement` canónicos                                            | `BLOQUEADO`                   | el evaluador infiere carril y prerrequisitos desde flags insuficientes                       | `AUTH-CAT-012`; `AUTH-CAT-017`; `AUTH-CTX-016`; `AUTH-CTX-017`; `AUTH-DB-034`                                                          |
|    2 | catorce permisos tienen `requires_active_work_context=true` con `is_operational=false`                                         | `PENDIENTE_DE_RECONCILIACION` | clasificación legacy contradictoria y bloqueos administrativos falsos                        | `AUTH-CAT-012`; `AUTH-CTX-017`; `AUTH-DB-034`; `SHELL-CI-016`                                                                          |
|    3 | el catálogo físico contiene 179 permisos y el snapshot documental base conserva 140 sin versión física de paridad              | `PENDIENTE_DE_RECONCILIACION` | deriva, claves nuevas sin contrato o cobertura incompleta                                    | `AUTH-CAT-017`; `AUTH-CTX-016`; `AUTH-DB-034`; `SHELL-CI-018`                                                                          |
|    4 | los códigos físicos son sufijos por app y existen cinco grupos repetidos globalmente                                           | `BLOQUEADO`                   | consumidor que consulte solo `code` puede resolver una clave incorrecta                      | `AUTH-CTX-016`; `AUTH-DB-034`; `SHELL-AUTH-001`; `SHELL-AUTH-004`                                                                      |
|    5 | middleware redirige `no-config` a login                                                                                        | `BLOQUEADO`                   | configuración ausente presentada como sesión perdida y posible loop                          | `AUTH-ERR-017`; `AUTH-ERR-019`; `SHELL-AUTH-002`; `SHELL-AUTH-005`                                                                     |
|    6 | middleware convierte excepción de Auth en login y limpia cookies                                                               | `BLOQUEADO`                   | fallo técnico destruye estado y oculta la causa                                              | `AUTH-ERR-001`; `AUTH-ERR-019`; `SHELL-AUTH-002`; `SHELL-AUTH-005`                                                                     |
|    7 | no existe productor físico del catálogo de 100 `StructuralIssue` ni de `lane_readiness`                                        | `PENDIENTE_DE_IMPLEMENTACION` | contradicciones se reducen a booleanos o strings locales                                     | `AUTH-CTX-015`; `AUTH-CTX-025`; `AUTH-DB-033`                                                                                          |
|    8 | las funciones observadas usan `blocked_reasons`, pero ninguna expone `structural_issues` o `authorization_requirement`         | `BLOQUEADO`                   | no hay severidad, propiedad de carril, metadata ni procedencia tipada                        | `AUTH-CTX-015`; `AUTH-CTX-017`; `AUTH-CTX-023`; `AUTH-DB-033`; `AUTH-DB-034`                                                           |
|    9 | cinco funciones principales de contexto y permiso observadas son `SECURITY DEFINER`                                            | `PENDIENTE_DE_REVISION`       | una interpretación inconsistente puede amplificarse por privilegio                           | `AUTH-DB-033`; `AUTH-DB-034`; revisión de grants y seguridad en BLOQUE R                                                               |
|   10 | `employees.role`, `site_id` y `area_id` legacy siguen disponibles como fallbacks físicos                                       | `BLOQUEADO`                   | rol o territorio incoherentes pueden sustituir relaciones canónicas                          | `AUTH-CTX-027`; `AUTH-CTX-028`; `AUTH-DB-030`; `SHELL-AUTH-005`                                                                        |
|   11 | el índice de área primaria permite solo una por empleado, no una por empleado y sede                                           | `PENDIENTE_DE_RECONCILIACION` | el modelo físico no representa la cardinalidad administrativa multisede aprobada             | `AUTH-CTX-009`; `AUTH-DB-020`; `AUTH-DB-033`                                                                                           |
|   12 | la matriz de rol tiene unicidad `(site_id, role_code)`, `area_id` sin FK observada y FK de rol `NOT VALID`                     | `BLOQUEADO`                   | no puede representar varias áreas del mismo rol y no garantiza integridad histórica completa | `AUTH-CTX-013`; `AUTH-DB-020`; `AUTH-DB-033`; `AUTH-DB-034`                                                                            |
|   13 | turnos usan `published_at` sin identidad física de revisión ni zona horaria contractual y no existe constraint de solapamiento | `PENDIENTE_DE_IMPLEMENTACION` | snapshot no reproducible, ambigüedad temporal o mezcla de revisión                           | `AUTH-CTX-010`; `AUTH-CTX-025`; `AUTH-DB-020`; `AUTH-DB-033`                                                                           |
|   14 | no existe envelope compartido `409` ni suite multicanal que pruebe las fronteras `017/018/019`                                 | `PENDIENTE_DE_IMPLEMENTACION` | UI, RPC, RLS, Edge, Realtime y offline pueden divergir                                       | `AUTH-ERR-020`; `SHELL-AUTH-001`; `SHELL-AUTH-002`; `SHELL-AUTH-004`; `SHELL-AUTH-005`; `SHELL-CI-016`; `SHELL-CI-018`; `SHELL-CI-019` |
|   15 | evaluadores y consumidores físicos no discriminan denegación base de denegación operativa                                      | `PENDIENTE_DE_IMPLEMENTACION` | un deny operativo puede mostrarse como administrativo o reducirse a `false`                  | `AUTH-ERR-004`; `AUTH-DB-034`; `SHELL-AUTH-001`; `SHELL-AUTH-002`; `SHELL-CI-016`                                                      |
|   16 | no existe catálogo compartido para identificación de actor y reautenticación fuerte                                            | `PENDIENTE_DE_IMPLEMENTACION` | estados interactivos pueden degradarse a dispositivo no autorizado o copy local              | `AUTH-ERR-015`; `AUTH-DEV-007`; `AUTH-DEV-012`; `AUTH-DEV-014`; `SHELL-AUTH-002`; `SHELL-UI-016`                                       |

Cada brecha conserva propietario y condición de salida. No se crean tareas
nuevas porque existen destinos canónicos concretos.

---

#### 37. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se incorporan al registro canónico:

- `TREQ-AUTH-289`;
- `TREQ-AUTH-290`;
- `TREQ-AUTH-291`;
- `TREQ-AUTH-292`;
- `TREQ-AUTH-293`;
- `TREQ-AUTH-294`;
- `TREQ-AUTH-295`;
- `TREQ-AUTH-296`;
- `TREQ-AUTH-297`;
- `TREQ-AUTH-298`.

| Rango | Cobertura                                                         |
| ----- | ----------------------------------------------------------------- |
| `289` | contrato público, `409`, sesión preservada y cero efectos         |
| `290` | enrutamiento de razones y fronteras `001` a `020`                 |
| `291` | catálogo estructural, metadata, deduplicación y determinismo      |
| `292` | severidades, carriles y composición por modalidad                 |
| `293` | integridad de aplicación, permiso, contrato, cobertura y contexto |
| `294` | precedencia, disponibilidad técnica, versiones y frescura         |
| `295` | equivalencia de diez canales                                      |
| `296` | cobertura de diez aplicaciones                                    |
| `297` | UX, privacidad, auditoría, invalidación e idempotencia            |
| `298` | reconciliación física y cierre de dieciséis brechas               |

Los requisitos permanecen `IDENTIFICADO` hasta que existan implementación y
evidencia reproducibles.

---

#### 38. Validaciones documentales definidas

El artefacto permite comprobar:

1. un único código público;
2. un único estado público;
3. `409` reservado para conflicto concluyente de configuración;
4. sesión preservada;
5. cero efectos empresariales;
6. cien códigos estructurales heredados sin crear catálogo paralelo;
7. diez códigos de disponibilidad excluidos de `StructuralIssue`;
8. tres severidades bloqueantes aplicadas por carril;
9. cuatro modalidades compuestas sin mezclar carriles;
10. once perfiles de enrutamiento;
11. fronteras explícitas con `AUTH-ERR-001` a `AUTH-ERR-020`;
12. veinticuatro escenarios sin decisión nula;
13. diez canales equivalentes;
14. diez aplicaciones reconciliadas;
15. copy y recuperación seguros;
16. dieciséis brechas con destino;
17. diez requisitos nuevos únicos;
18. 6.686 requisitos históricos preservados;
19. 6.696 filas con catorce columnas;
20. cero relaciones `TREQ-*` no resolubles.

---

#### 39. Evidencia, estados y límites materiales

| Elemento                                          | Estado                             |
| ------------------------------------------------- | ---------------------------------- |
| contrato de bloqueo                               | `ESPECIFICADO`                     |
| matriz de escenarios                              | `ESPECIFICADO`                     |
| matriz de canales                                 | `ESPECIFICADO`                     |
| cobertura de aplicaciones                         | `ESPECIFICADO`                     |
| snapshot de Supabase                              | `PENDIENTE_DE_EVIDENCIA_OPERATIVA` |
| catálogo físico de modalidad y requisitos         | `BLOQUEADO`                        |
| productor de `StructuralIssue` y `lane_readiness` | `PENDIENTE_DE_IMPLEMENTACION`      |
| evaluador uniforme de configuración               | `PENDIENTE_DE_IMPLEMENTACION`      |
| envelope compartido `409`                         | `PENDIENTE_DE_IMPLEMENTACION`      |
| pruebas automatizadas                             | `PENDIENTE_DE_IMPLEMENTACION`      |
| pruebas E2E, RLS, RPC, Edge y offline             | `PENDIENTE_DE_EVIDENCIA`           |

AUTH-ERR-017 no:

- corrige filas productivas;
- activa o desactiva aplicaciones, permisos, roles, sedes, áreas o empleados;
- crea grants o denies;
- corrige turnos o check-ins;
- cambia dispositivos o simulaciones;
- crea tablas, constraints, tipos, funciones, RPC, RLS o migrations;
- ejecuta DDL, DML, backfills o despliegues;
- modifica Supabase;
- modifica middleware o aplicaciones;
- declara inválidos los 14 permisos legacy sin una reconciliación propietaria;
- certifica el estado operativo por conteos agregados;
- inicia `AUTH-ERR-018`.

---

#### 40. Criterios de aceptación

- [x] Se definió un código público único.
- [x] Se definió un estado público único.
- [x] Se definió `409 Conflict` para configuración concluyentemente contradictoria.
- [x] Se preservó la sesión.
- [x] Se exigieron cero efectos.
- [x] Se aclaró el significado de “administrativa”.
- [x] Se separó configuración inconsistente de ausencia ordinaria.
- [x] Se separó configuración inconsistente de deny legítimo.
- [x] Se separó configuración inconsistente de permiso no registrado.
- [x] Se separó configuración inconsistente de error técnico.
- [x] Se preservó el catálogo de 100 códigos estructurales.
- [x] Se excluyeron los diez códigos de disponibilidad.
- [x] Se aplicaron `BLOCKING_ALL`, `BLOCKING_BASE` y `BLOCKING_OPERATIONAL`.
- [x] Se preservó un carril independiente válido en `BASE_OR_OPERATIONAL`.
- [x] Se exigieron ambos carriles en `BASE_AND_OPERATIONAL`.
- [x] Se prohibió mezclar carriles incompletos.
- [x] Se definieron once perfiles de enrutamiento.
- [x] Se definieron ocho familias privadas sin crear códigos paralelos.
- [x] Se definieron fuentes autoritativas y fallbacks prohibidos.
- [x] Se definieron fronteras de autenticación e identidad.
- [x] Se definieron fronteras de aplicación, permiso y política.
- [x] Se definieron fronteras de asignación y cobertura.
- [x] Se definieron fronteras de turno, check-in, rol y territorio.
- [x] Se definieron fronteras de dispositivo y simulación.
- [x] Se definieron versiones, frescura y snapshot.
- [x] Se definió recuperación administrativa sin auto-retry.
- [x] Se definieron privacidad y auditoría.
- [x] Se definieron invalidación, concurrencia e idempotencia.
- [x] Se decidieron veinticuatro escenarios.
- [x] Se definieron diez canales equivalentes.
- [x] Se reconciliaron diez aplicaciones.
- [x] Se registró el snapshot físico sin presentarlo como conformidad.
- [x] Se registraron dieciséis brechas con destino exacto.
- [x] Se derivaron `TREQ-AUTH-289` a `TREQ-AUTH-298`.
- [x] No se modificó código, Supabase, migraciones, configuración, datos ni aplicaciones.
- [x] `AUTH-ERR-018` permanece únicamente reservada.

---

#### 41. Riesgos controlados

| Riesgo                                         | Control                                        |
| ---------------------------------------------- | ---------------------------------------------- |
| contradicción tratada como ausencia normal     | lectura concluyente y routing por propiedad    |
| error técnico tratado como configuración       | frontera `CONCLUSIVE` versus `UNAVAILABLE`     |
| permiso desconocido ocultado                   | `AUTH-ERR-018` conserva propiedad              |
| deny legítimo presentado como error            | grants, denies y scope se evalúan por separado |
| carril base inválido bloquea operativo válido  | severidad y composición por modalidad          |
| carril operativo inválido bloquea base válido  | independencia de carriles                      |
| grant repara contexto inválido                 | structural issues preceden política            |
| primera fila resuelve ambigüedad               | determinismo y fail closed                     |
| `null` amplía cobertura                        | `null` nunca significa organización o wildcard |
| código de permiso se confunde entre apps       | clave completa y composición exacta            |
| middleware crea login loop                     | respuesta de configuración separada            |
| cookies se eliminan por fallo de configuración | sesión preservada                              |
| snapshot stale ejecuta                         | invalidación y resolución completa nueva       |
| explicación filtra arquitectura                | envelope público mínimo                        |
| retry duplica una mutación                     | cero efectos e idempotencia no consumida       |
| conteos limpios certifican implementación      | estados de evidencia explícitos                |

---

#### 42. Cierre de tarea y continuidad

**ÚLTIMA TAREA APROBADA**

`AUTH-ERR-016 — Acción no permitida en simulación`

**TAREA ACTUAL APROBADA**

`AUTH-ERR-017 — Configuración administrativa inconsistente`

**SIGUIENTE TAREA RESERVADA**

`AUTH-ERR-018 — Permiso no registrado`


### ✅ AUTH-ERR-018 — Permiso no registrado

**Estado:** APROBADA
**Tarea anterior:** `AUTH-ERR-017 — Configuración administrativa inconsistente` — APROBADA
**Tarea siguiente:** `AUTH-ERR-019 — Diferenciar error técnico y denegación` — RESERVADA
**Tipo de tarea:** documental; definición contractual, causal, funcional, de seguridad, experiencia y reconciliación física del bloqueo producido cuando una operación protegida exige una clave de permiso sintácticamente válida y la versión canónica publicada del catálogo responde de forma concluyente que esa clave exacta no está registrada

---

#### 1. Propósito

Definir de forma única, segura y verificable qué debe ocurrir cuando una
operación protegida de Vento OS ya conoce la aplicación y la capacidad exactas
que debe exigir, puede consultar una versión canónica compatible del catálogo
y esa consulta concluye que la clave completa solicitada no existe.

La regla raíz queda:

```text
OPERACION PROTEGIDA
+
APLICACION CANONICA RESUELTA
+
PERMISO EXIGIDO POR EL CONTRATO SERVER-SIDE
+
FORMA SINTACTICA VALIDA
+
CATALOGO PUBLICADO, COMPATIBLE E INTEGRO
+
BUSQUEDA EXACTA CONCLUYENTE
+
CERO COINCIDENCIAS PARA APP_CODE + PERMISSION_CODE
→
DENY
+
AUTH_PERMISSION_NOT_REGISTERED
+
500
+
SESION PRESERVADA
+
CERO EFECTOS EMPRESARIALES
```

La tarea responde exclusivamente:

```text
¿LA CLAVE EXACTA EXIGIDA POR ESTA OPERACION
EXISTE EN LA VERSION CANONICA PUBLICADA DEL CATALOGO?
```

No responde:

```text
¿EL CLIENTE ENVIO UNA FORMA VALIDA?
¿LA APLICACION EXISTE O ESTA ACTIVA?
¿EL PERMISO EXISTE PERO ESTA INACTIVO, RETIRADO O INCOMPLETO?
¿EL ACTOR TIENE UN GRANT?
¿EXISTE UN DENY?
¿EL SCOPE COINCIDE?
¿FALTA TURNO, CHECK-IN, AREA, ROL O DISPOSITIVO?
¿LA FUENTE DEL CATALOGO FALLO O NO RESPONDE?
```

Un permiso no registrado es un defecto determinista entre la operación y el
catálogo vigente. No es una denegación ordinaria del trabajador y no deberá
presentarse como falta de autorización personal.

---

#### 2. Resultado material

Se aprueban cinco artefactos documentales completos:

1. `PERMISSION-NOT-REGISTERED-BLOCKING-CONTRACT-001`, que congela identidad,
   aplicabilidad, respuesta pública, recuperación, privacidad, auditoría y
   cero efectos;
2. `PERMISSION-NOT-REGISTERED-STATE-DECISION-MATRIX-001`, que decide
   veinticuatro escenarios y separa clave ausente, entrada inválida,
   configuración inconsistente, ciclo de vida, denegación e indisponibilidad;
3. `PERMISSION-NOT-REGISTERED-CHANNEL-RESPONSE-MATRIX-001`, que materializa
   diez canales con una decisión equivalente;
4. `PERMISSION-NOT-REGISTERED-APPLICATION-COVERAGE-REGISTER-001`, que decide
   el alcance para las diez aplicaciones canónicas;
5. `PERMISSION-NOT-REGISTERED-PHYSICAL-RECONCILIATION-001`, que registra el
   snapshot físico de solo lectura y catorce brechas con destino canónico.

Cobertura materializada:

| Elemento                                                           |                  Cantidad |
| ------------------------------------------------------------------ | ------------------------: |
| Código público canónico                                            |                         1 |
| Razón interna canónica consumida                                   | 1, `PERMISSION_NOT_FOUND` |
| Categoría de decisión                                              |      1, `STRUCTURAL_DENY` |
| Estado HTTP no navegacional                                        |                  1, `500` |
| Versiones de catálogo admitidas por evaluación                     |     1 exacta y compatible |
| Estrategias de búsqueda permitidas                                 |    1, coincidencia exacta |
| Estrategias de fallback permitidas                                 |                         0 |
| Perfiles de enrutamiento causal                                    |                        10 |
| Escenarios con decisión explícita                                  |                        24 |
| Canales con respuesta explícita                                    |                        10 |
| Aplicaciones canónicas reconciliadas                               |                        10 |
| Permisos canónicos documentales vigentes                           |                       140 |
| Permisos físicos activos observados                                |                       179 |
| Referencias físicas de navegación, pantallas y política observadas |                       153 |
| Referencias físicas de matrices base e individuales observadas     |                       630 |
| Referencias físicas de matriz operativa observadas                 |                        32 |
| Capacidades legacy relativas observadas                            |                        26 |
| Funciones físicas relevantes inspeccionadas                        |                         7 |
| Funciones con razón explícita `PERMISSION_NOT_FOUND`               |                         0 |
| Repositorios de aplicaciones con helper booleano inspeccionado     |                         6 |
| Brechas físicas registradas                                        |                        14 |
| Requisitos de prueba derivados                                     |                        10 |

Las cifras físicas son un snapshot agregado de solo lectura. Que las referencias
observadas coincidan con la proyección física actual no demuestra que pertenezcan
a la versión contractual de 140 permisos ni que la ausencia futura de una clave
sea clasificada correctamente.

---

#### 3. Identidad canónica del bloqueo

La identidad pública única es:

```text
reason_code = AUTH_PERMISSION_NOT_REGISTERED
```

La razón técnica consumida desde la resolución canónica es:

```text
internal_reason_code = PERMISSION_NOT_FOUND
```

Propiedades normativas:

| Propiedad                    | Valor                       |
| ---------------------------- | --------------------------- |
| Dominio                      | `AUTHORIZATION_CATALOG`     |
| Estado público               | `PERMISSION_NOT_REGISTERED` |
| Decisión                     | `DENY`                      |
| Categoría final              | `STRUCTURAL_DENY`           |
| Mensaje seguro de decisión   | `ACCESS_NOT_AVAILABLE`      |
| Estado HTTP no navegacional  | `500 Internal Server Error` |
| Ejecutable                   | `false`                     |
| Reintentable automáticamente | `false`                     |
| Sesión                       | preservada                  |
| Efectos empresariales        | `0`                         |
| Acción de recuperación       | `CONTACT_SUPPORT`           |

`500` expresa que una operación server-side exigió una capacidad que el
contrato publicado no reconoce. No convierte la causa en timeout, caída de red
o excepción no clasificada. Es un resultado determinista y auditable de la
resolución del catálogo.

Quedan prohibidos como códigos públicos alternativos:

- `PERMISSION_NOT_FOUND` expuesto directamente;
- `NO_PERMISSION`;
- `UNKNOWN_PERMISSION`;
- `FORBIDDEN`;
- `AUTH_ERROR`;
- `NOT_AUTHORIZED`;
- el código bruto de PostgreSQL o Supabase;
- un booleano `false` sin procedencia;
- el texto de una excepción;
- el nombre del permiso solicitado.

---

#### 4. Definición exacta de permiso no registrado

Existe `AUTH_PERMISSION_NOT_REGISTERED` si y solo si se cumplen todas estas
condiciones:

1. la superficie exige autorización laboral, administrativa, operativa o de
   sistema mediante el contrato canónico;
2. la aplicación solicitada ya fue resuelta como una aplicación canónica
   activa;
3. la operación de servidor, RPC, comando o adapter confiable determinó el
   permiso exacto requerido;
4. `app_code` y `permission_code` superaron la validación de forma;
5. la versión del catálogo es conocida, compatible, publicada e íntegra;
6. la clave completa se construyó como `app_code + "." + permission_code`;
7. la búsqueda fue exacta y determinista;
8. la fuente respondió correctamente;
9. el resultado fue exactamente cero coincidencias;
10. no existe un alias o registro de retiro que cambie la clasificación;
11. no se ejecutó ninguna evaluación de grants, denies, contexto o recurso;
12. no se produjo efecto empresarial.

Forma lógica:

```text
CATALOG_LOOKUP.status = CONCLUSIVE
AND
CATALOG_LOOKUP.match_count = 0
AND
CATALOG_LOOKUP.lookup_mode = EXACT_FULL_KEY
AND
CATALOG_LOOKUP.catalog_status = PUBLISHED_COMPATIBLE
→
AUTH_PERMISSION_NOT_REGISTERED
```

Una tabla física vacía, un `false` de un helper o una respuesta sin versión no
bastan para demostrar estas condiciones.

---

#### 5. Condición exacta de aplicación

La tarea aplica a una solicitud sintácticamente válida que intenta resolver
una capacidad empresarial exacta y recibe una ausencia concluyente en el
catálogo canónico.

Aplica a:

- navegación protegida ligada a una capacidad canónica;
- render server-side protegido;
- Server Actions;
- Route Handlers y APIs;
- RPC y PostgREST mediante un adapter autoritativo;
- políticas o funciones que requieren una clave exacta;
- Edge Functions;
- suscripciones protegidas;
- operaciones offline al sincronizar;
- jobs, colas, webhooks e integraciones.

No aplica a:

- una cadena vacía o de tipo incorrecto;
- una clave con wildcard;
- una clave completa enviada dentro de `permission_code`;
- una aplicación inexistente;
- un permiso existente pero inactivo;
- un permiso registrado como retirado;
- un alias conocido;
- un permiso legacy que requiere descomposición;
- ausencia de grants;
- explicit deny;
- scope mismatch;
- fallo de red, timeout o excepción;
- catálogo sin versión compatible;
- catálogo con integridad inválida.

---

#### 6. Fuente canónica de registro

La única fuente normativa de existencia es el catálogo publicado y versionado
de autorización propiedad de `vento-shell`.

Identidad vigente de referencia:

```text
catalog_id = vento.authorization
catalog_version = 1.0.0
schema_version = 1.0.0
application_count = 10
active_permission_count = 140
```

La cifra de 140 procede del congelamiento contractual aprobado en
`AUTH-CAT-024` para `vento.authorization@1.0.0` y prevalece sobre el snapshot
documental histórico de 112 permisos anterior a esa reconciliación.

La base de datos puede contener una proyección operativa, pero:

```text
FILA EN app_permissions
≠
REGISTRO CANONICO PUBLICADO
```

La existencia contractual requiere:

- versión conocida;
- estado publicado;
- hash verificable;
- esquema compatible;
- clave única;
- ciclo de vida canónico;
- pertenencia exacta a la aplicación;
- ausencia de corrupción o mutación in-place.

No son fuentes canónicas independientes:

- una ruta;
- una pantalla;
- un componente;
- una fila creada por un scanner;
- una cadena en una policy;
- una matriz;
- un rol;
- una prueba;
- un valor enviado por el cliente;
- una tabla legacy sin versión.

---

#### 7. Identidad exacta de la capacidad

La identidad se resuelve únicamente mediante:

```text
permission_key
=
app_code
+
"."
+
permission_code
```

Ejemplo válido:

```text
app_code = nexo
permission_code = inventory.remissions.request
permission_key = nexo.inventory.remissions.request
```

Reglas:

1. la búsqueda usa la clave completa exacta;
2. `permission_code` no se busca globalmente;
3. el mismo sufijo en otra aplicación no cuenta como coincidencia;
4. no se aceptan prefijos, sufijos o segmentos parciales;
5. no se aplica `startsWith`, `contains`, similitud ni búsqueda humana;
6. no se convierte la clave a otra forma después de validar;
7. no se sustituye por `<app>.access`;
8. no se elige un permiso más amplio;
9. no se consulta el permiso del rol como sustituto;
10. no se crean capacidades desde nombres de rutas.

Resultado permitido:

```text
match_count = 1
→ continuar

match_count = 0
→ AUTH_PERMISSION_NOT_REGISTERED

match_count > 1
→ AUTH-ERR-017
```

---

#### 8. Propiedad de la operación

La operación de servidor es propietaria del permiso que protege su efecto.

Fuentes permitidas:

- contrato de Server Action;
- contrato de Route Handler;
- comando empresarial;
- RPC canónica;
- registro central de operaciones;
- adapter de integración versionado;
- definición generada desde `PERMISSIONS`.

El cliente puede solicitar la operación, pero no seleccionar libremente la
capacidad que la protege.

Queda prohibido:

```text
CLIENTE ELIGE PERMISO
→ SERVIDOR CONFIA
→ MUTACION
```

La secuencia correcta es:

```text
OPERACION SERVER-SIDE
→ PERMISO CANONICO FIJO
→ RESOLUCION DE CATALOGO
→ EVALUACION
→ EFECTO SOLO SI FINAL ALLOW
```

Si el cliente envía una clave distinta, se ignora como autoridad. Si una API
administrativa recibe una referencia de permiso como dato, deberá validarla en
una frontera separada y no usarla para reducir la protección de la operación.

---

#### 9. Enrutamiento de causas y propiedad

| Condición concluyente                                                     | Propietario                                                                  |
| ------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| contrato de entrada ausente, vacío, múltiple o sintácticamente inválido   | contrato de invocación de `AUTH-CTX-026`                                     |
| `app_code` no existe o la aplicación requerida no puede resolverse        | `AUTH-ERR-017`                                                               |
| clave exacta no existe en catálogo publicado compatible                   | `AUTH-ERR-018`                                                               |
| clave existe pero está inactiva o su contrato obligatorio está incompleto | `AUTH-ERR-017`                                                               |
| clave figura como retirada                                                | ciclo de vida y adapter de `AUTH-CTX-016/028`                                |
| clave figura como alias uno-a-uno                                         | adapter de `AUTH-CTX-028`                                                    |
| clave legacy exige descomposición                                         | `AUTH-CTX-028` y consumidor propietario                                      |
| clave válida sin allow coincidente                                        | default deny o bloqueo de carril aplicable                                   |
| clave válida con explicit deny                                            | razón de deny aplicable                                                      |
| fuente no responde, expira o devuelve resultado no confiable              | `AUTH-ERR-019`                                                               |
| versión o hash del catálogo son incompatibles                             | `AUTH-ERR-017` o `AUTH-ERR-019` según lectura concluyente o indisponibilidad |

Regla obligatoria:

```text
NO EXISTE
≠
EXISTE PERO NO ESTA CONCEDIDO
≠
NO SE PUDO COMPROBAR SI EXISTE
```

---

#### 10. `PERMISSION-NOT-REGISTERED-BLOCKING-CONTRACT-001`

Forma lógica mínima:

```ts
type PermissionNotRegisteredBlockingReason = {
  contract: "PERMISSION-NOT-REGISTERED-BLOCKING-CONTRACT-001";
  contract_version: "1.0.0";
  reason_code: "AUTH_PERMISSION_NOT_REGISTERED";
  internal_reason_code: "PERMISSION_NOT_FOUND";
  state: "PERMISSION_NOT_REGISTERED";
  domain: "AUTHORIZATION_CATALOG";
  decision: "DENY";
  reason_category: "STRUCTURAL_DENY";
  safe_message_code: "ACCESS_NOT_AVAILABLE";
  executable: false;
  retryable: false;
  session_preserved: true;
  effects_committed: false;
  recovery_action: "CONTACT_SUPPORT";
  http_status: 500;
  app_code: string;
  channel: PermissionNotRegisteredChannel;
  correlation_id: string;
  support_code: string;
  catalog_version: string;
  occurred_at: string;
};
```

La forma pública no incluye `permission_key`, `permission_code`, rutas,
componentes, roles, grants, denies, tablas, SQL, hashes completos ni stack
trace.

La evidencia privada conserva la clave exacta y la operación propietaria.

---

#### 11. Entradas mínimas y determinismo

La clasificación consume como mínimo:

- identidad de la operación;
- consumidor confiable;
- `app_code` validado;
- `permission_code` relativo validado;
- clave completa derivada;
- `catalog_id`;
- `catalog_version`;
- `schema_version`;
- hash o fingerprint verificado;
- estado de publicación;
- instante de resolución;
- resultado exacto de búsqueda;
- procedencia de la fuente;
- `correlation_id`.

Para las mismas entradas y el mismo catálogo, el resultado debe ser idéntico.

No depende de:

- usuario o rol;
- grants o denies;
- sede o área;
- turno o check-in;
- recurso;
- orden físico de filas;
- primera coincidencia parcial;
- interfaz abierta;
- permiso parecido;
- caché sin versión;
- normalización silenciosa;
- estado del frontend.

---

#### 12. Familias privadas de causa

La auditoría podrá distinguir estas causas privadas sin crear códigos públicos
alternativos:

| Causa privada                 | Condición                                                                  |
| ----------------------------- | -------------------------------------------------------------------------- |
| `EXACT_KEY_ABSENT`            | cero coincidencias exactas                                                 |
| `WRONG_APPLICATION_ONLY`      | el sufijo existe únicamente en otra aplicación                             |
| `UNPUBLISHED_KEY_REFERENCE`   | un consumidor referencia una clave fuera de la versión publicada           |
| `ROUTE_DERIVED_KEY_ABSENT`    | una superficie técnica produjo una cadena no canónica                      |
| `LEGACY_STRING_UNMAPPED`      | una cadena legacy no figura como alias o retiro conocido                   |
| `CONSUMER_CATALOG_DRIFT`      | consumidor y catálogo resuelven versiones distintas                        |
| `DATABASE_PROJECTION_EXTRA`   | la proyección física contiene una clave que la versión canónica no publica |
| `DATABASE_PROJECTION_MISSING` | la versión canónica publica una clave ausente en la proyección requerida   |

`DATABASE_PROJECTION_EXTRA` y `DATABASE_PROJECTION_MISSING` exigen
reconciliación. La respuesta pública solo utiliza
`AUTH_PERMISSION_NOT_REGISTERED` cuando la operación consultó la fuente
canónica y obtuvo cero coincidencias.

---

#### 13. Frontera con el contrato de entrada

Los siguientes casos no producen `AUTH_PERMISSION_NOT_REGISTERED`:

- `app_code` ausente;
- `permission_code` ausente;
- tipo distinto de string;
- cadena vacía;
- espacios iniciales o finales no admitidos;
- mayúsculas cuando la forma exige minúsculas;
- wildcard;
- lista o expresión booleana;
- clave completa dentro de `permission_code`;
- versión de request no soportada.

Esos casos son errores de invocación. La operación permanece sin ejecutar y
`AUTH-CTX-026` define la respuesta técnica del canal.

Queda prohibido “reparar” la entrada mediante:

- `trim` permisivo después de fallar;
- conversión automática a minúsculas;
- prefijo inferido;
- permiso predeterminado;
- primer elemento de una lista;
- eliminación de segmentos;
- wildcard implícito.

---

#### 14. Frontera con la aplicación

La aplicación debe existir y estar activa antes de buscar el permiso.

| Estado de aplicación                     | Resultado                                        |
| ---------------------------------------- | ------------------------------------------------ |
| forma inválida                           | error de entrada                                 |
| no registrada                            | `AUTH-ERR-017` según contrato vigente del bloque |
| registrada pero inactiva                 | ciclo de vida de aplicación; no `AUTH-ERR-018`   |
| registrada, activa y catálogo disponible | continuar a permiso                              |
| fuente de aplicaciones no disponible     | `AUTH-ERR-019`                                   |

Una clave con prefijo de otra aplicación no se reasigna. Si la aplicación
solicitada es válida pero la clave completa construida no existe, la causa
puede ser `WRONG_APPLICATION_ONLY` en auditoría y
`AUTH_PERMISSION_NOT_REGISTERED` públicamente.

---

#### 15. Frontera con permiso inactivo o contrato incompleto

Un permiso registrado conserva identidad aunque esté inactivo.

```text
match_count = 1
AND
lifecycle = INACTIVE
→
PERMISSION_INACTIVE
→
AUTH-ERR-017 O CICLO DE VIDA PROPIETARIO
```

No utiliza `AUTH-ERR-018`.

También pertenecen a configuración inconsistente:

- `authorization_requirement` ausente;
- modalidad desconocida;
- propiedad derivada contradictoria;
- contrato de recurso obligatorio ausente;
- clasificación de dispositivo o simulación inválida;
- metadata de la fila incompatible con el catálogo;
- más de una fila para la misma clave;
- hash publicado que no coincide.

La existencia de una fila incompleta no se degrada a ausencia.

---

#### 16. Alias, retiro y legado

La fuente canónica deberá consultar registros separados de:

- permisos activos;
- aliases;
- permisos retirados;
- claves legacy;
- descomposiciones requeridas.

Clasificaciones:

```text
ALIAS CONOCIDO
→ PERMISSION_ALIAS_REQUIRES_ADAPTER

RETIRADO CONOCIDO
→ PERMISSION_RETIRED

LEGACY UNO-A-MUCHOS
→ PERMISSION_LEGACY_REQUIRES_DECOMPOSITION

CADENA SIN REGISTRO ACTIVO, ALIAS, RETIRO NI LEGADO
→ PERMISSION_NOT_FOUND
```

Un alias no se resuelve silenciosamente dentro del evaluador. Un adapter
aprobado transforma antes de evaluar y conserva la referencia original en
la auditoría.

---

#### 17. Grants, denies y ausencia de allow

La existencia del permiso se resuelve antes de consultar política.

```text
PERMISO REGISTRADO
+
0 ALLOWS COINCIDENTES
→
DEFAULT DENY
```

```text
PERMISO REGISTRADO
+
EXPLICIT DENY COINCIDENTE
→
DENY DE POLITICA
```

Ninguno utiliza `AUTH_PERMISSION_NOT_REGISTERED`.

Una fila de `role_permissions`, `employee_permissions` u
`operational_role_permissions` no registra una capacidad. Si referencia una
clave ausente, la relación es huérfana y no puede convertirla en válida.

Queda prohibido:

- inferir existencia porque un rol contiene una cadena;
- tratar un grant como registro de catálogo;
- crear automáticamente la capacidad desde una matriz;
- devolver `false` indistinguible para ausencia, deny y falta de allow.

---

#### 18. Scope, contexto, prerrequisitos y recurso

Cuando la clave no está registrada, no se evalúan:

- modalidad;
- carril base;
- carril operativo;
- scopes;
- cobertura administrativa;
- turno;
- check-in;
- rol operativo;
- sede o área;
- dispositivo;
- sensibilidad;
- dependencias;
- recurso;
- estado del recurso;
- ownership;
- concurrencia;
- idempotencia empresarial.

Estas evaluaciones no pueden reparar una capacidad inexistente y tampoco deben
filtrar información sobre el actor o el recurso.

Una respuesta obtenida después de consultar esas capas indica orden de
precedencia incorrecto.

---

#### 19. Frontera con error técnico

`AUTH_PERMISSION_NOT_REGISTERED` exige una lectura concluyente.

| Estado de la fuente                                  | Clasificación                             |
| ---------------------------------------------------- | ----------------------------------------- |
| respondió, versión válida, cero coincidencias        | `AUTH-ERR-018`                            |
| respondió, una coincidencia activa                   | continuar                                 |
| respondió, duplicados o metadata contradictoria      | `AUTH-ERR-017`                            |
| respondió, versión incompatible de forma concluyente | `AUTH-ERR-017`                            |
| timeout, error de red, excepción o conexión caída    | `AUTH-ERR-019`                            |
| respuesta parcial, stale o sin confianza suficiente  | `AUTH-ERR-019` o invalidación propietaria |

Regla:

```text
CATALOGO NO DISPONIBLE
≠
PERMISO NO REGISTRADO
```

Un `catch { return false }` viola esta frontera.

---

#### 20. `app.access` y capacidades específicas

`<app>.access` es una capacidad independiente.

```text
nexo.access
≠
nexo.inventory.remissions.request
```

Si una capacidad específica no existe, no se sustituye por `nexo.access`.

Si `nexo.access` existe, eso no demuestra que cualquier otra clave de NEXO
esté registrada. Si una capacidad específica existe, tampoco sintetiza
`nexo.access`.

Cada operación resuelve exactamente la clave que su contrato exige.

---

#### 21. Simulación

La simulación puede solicitar una clave hipotética, pero no puede fabricar una
capacidad inexistente.

Resultado mínimo:

```text
CLAVE NO REGISTRADA
→ WOULD_DENY O INDETERMINATE SEGUN CONTRATO
→ internal_reason = PERMISSION_NOT_FOUND
→ NUNCA WOULD_ALLOW
→ CERO EFECTOS
```

La respuesta de preview podrá mostrar el mismo copy seguro sin convertir el
resultado en autorización real.

Una sesión simulada no agrega filas al catálogo, no activa aliases y no altera
la versión publicada.

---

#### 22. Evaluación por lotes y contratos compuestos

Cada elemento de un lote conserva:

- aplicación;
- permiso relativo;
- clave completa;
- resultado de resolución;
- razón;
- correlación;
- efecto cero cuando falla.

Una clave ausente no se sustituye por otra clave del lote.

Para una operación atómica:

```text
CUALQUIER CLAVE REQUERIDA NO REGISTRADA
→ LOTE NO EJECUTABLE
→ CERO EFECTOS
```

Para una consulta diagnóstica no atómica, cada elemento puede devolver su
propio resultado, pero ninguno autoriza ejecución.

Un contrato compuesto debe enumerar claves canónicas; no puede usar una
expresión dinámica o una cadena separada por comas.

---

#### 23. Enumeración, privacidad y minimización

La respuesta ordinaria no deberá revelar:

- la clave solicitada;
- otros permisos existentes;
- permisos parecidos;
- módulos internos;
- rutas o componentes;
- aplicación propietaria cuando no sea necesario;
- roles que normalmente poseen la capacidad;
- grants o denies;
- conteos del catálogo;
- versión completa o hash;
- tablas, funciones o policies;
- datos del actor o recurso.

El `support_code` permite correlación sin exponer la clave.

Una interfaz administrativa expresamente autorizada podrá mostrar la clave y
la versión en un panel de diagnóstico, pero esa proyección requiere permiso
propio y no cambia la decisión.

No se ofrecerán sugerencias de permisos similares a consumidores no
administrativos.

---

#### 24. Recuperación

La acción primaria es:

```text
CONTACT_SUPPORT
```

La interfaz deberá:

1. confirmar que la acción no se realizó;
2. conservar la sesión;
3. permitir copiar un código de soporte opaco;
4. permitir volver a una superficie segura;
5. evitar reintento automático;
6. no pedir al trabajador que cambie de rol, sede o turno;
7. no sugerir que solicite un grant como solución;
8. no crear el permiso desde la interfaz;
9. no recargar indefinidamente;
10. permitir que soporte investigue operación, consumidor y versión.

Después de corregir y publicar el catálogo o el consumidor, el usuario deberá
emitir una solicitud nueva. La acción original no se reproduce.

---

#### 25. Regla de cero efectos

Antes de emitir el bloqueo se exige:

```text
effects_committed = false
```

No se permite:

- insertar, actualizar o eliminar datos empresariales;
- reservar inventario;
- mover stock;
- crear remisiones;
- cambiar turnos;
- cobrar, devolver o cerrar caja;
- producir lotes;
- crear órdenes o recepciones;
- exportar, imprimir o notificar;
- emitir eventos empresariales;
- programar jobs;
- abrir suscripciones con alcance ampliado;
- consumir idempotency keys como éxito;
- persistir una decisión `ALLOW` parcial;
- crear o reactivar automáticamente el permiso.

Los logs y la auditoría técnica del intento no se consideran efecto empresarial.

---

#### 26. Envelope público

Respuesta mínima:

```json
{
  "ok": false,
  "reason_code": "AUTH_PERMISSION_NOT_REGISTERED",
  "state": "PERMISSION_NOT_REGISTERED",
  "category": "AUTHORIZATION_CATALOG",
  "message_code": "ACCESS_NOT_AVAILABLE",
  "executable": false,
  "retryable": false,
  "session_preserved": true,
  "effects_committed": false,
  "recovery_action": "CONTACT_SUPPORT",
  "support_code": "opaque-support-code",
  "correlation_id": "opaque-correlation-id"
}
```

Estado HTTP:

```text
500 Internal Server Error
```

El envelope no contiene la clave solicitada. Los clientes no deberán inferir
`403`, `404`, login requerido o permiso faltante del actor.

---

#### 27. Copy y experiencia

Copy aprobado en español:

| Elemento                | Texto exacto                                                                                                            |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| Título                  | `Esta función no está disponible`                                                                                       |
| Mensaje                 | `La función solicitada no está registrada en Vento OS. Informa el código de soporte para que revisen la configuración.` |
| Acción principal        | `Copiar código de soporte`                                                                                              |
| Acción secundaria       | `Volver`                                                                                                                |
| Confirmación de efectos | `No se realizó ningún cambio.`                                                                                          |
| Código visible          | `AUTH_PERMISSION_NOT_REGISTERED`                                                                                        |

Reglas:

1. no afirmar “no tienes permiso”;
2. no afirmar “tu rol no puede hacerlo”;
3. no pedir cambio de turno, sede o área;
4. no cerrar sesión;
5. no mostrar la clave técnica;
6. no mostrar stack trace;
7. no ofrecer crear el permiso;
8. no prometer recuperación automática;
9. no convertir el estado en una pantalla vacía;
10. el foco inicial y la lectura accesible deben anunciar título, mensaje y
    confirmación de cero cambios.

---

#### 28. Auditoría

Cada intento conservará, como mínimo:

- `audit_event_id`;
- `correlation_id`;
- `support_code`;
- identidad del consumidor;
- operación propietaria;
- actor y principal cuando ya estén resueltos;
- `app_code`;
- `permission_code` y clave completa en evidencia privada;
- `catalog_id`;
- versión, schema y hash;
- estado de publicación;
- modo de búsqueda `EXACT_FULL_KEY`;
- `match_count = 0`;
- causa privada;
- razón interna `PERMISSION_NOT_FOUND`;
- razón pública;
- canal;
- timestamp de servidor;
- confirmación de cero efectos;
- fingerprint de request sin secretos.

La auditoría no registrará tokens, cookies, secretos, PIN, datos sensibles del
recurso ni payload completo cuando no sea necesario.

---

#### 29. Invalidación, concurrencia e idempotencia

La decisión queda vinculada a una versión exacta del catálogo.

Se invalida cuando cambia:

- `catalog_version`;
- `schema_version`;
- hash;
- estado de publicación;
- registro de aliases o retirados;
- contrato de la operación;
- mapping del consumidor;
- aplicación propietaria;
- permiso requerido.

Reglas:

1. una ausencia cacheada no se reutiliza después de cambiar versión;
2. una presencia cacheada tampoco se reutiliza sin fingerprint compatible;
3. una respuesta tardía no ejecuta la acción;
4. una cola offline descarta la operación y exige una solicitud nueva;
5. una idempotency key fallida no se convierte en éxito después de publicar;
6. una corrección genera una nueva evaluación y un nuevo `decision_id`;
7. varias pestañas no reintentan automáticamente;
8. Realtime no amplía acceso mientras se corrige;
9. ningún consumidor usa `latest` sin versión resuelta;
10. no se muta una versión publicada in-place.

---

#### 30. `PERMISSION-NOT-REGISTERED-STATE-DECISION-MATRIX-001`

|    # | Escenario                                              | Decisión                  | Propietario o resultado                            |
| ---: | ------------------------------------------------------ | ------------------------- | -------------------------------------------------- |
|    1 | superficie pública sin requisito de permiso            | continuar                 | contrato público                                   |
|    2 | sesión ausente                                         | denegar antes             | `AUTH-ERR-001`                                     |
|    3 | aplicación no resuelta                                 | denegar antes             | `AUTH-ERR-017`                                     |
|    4 | `app_code` o `permission_code` ausente                 | error de entrada          | `AUTH-CTX-026`                                     |
|    5 | forma inválida, wildcard o lista                       | error de entrada          | `AUTH-CTX-026`                                     |
|    6 | clave completa enviada como código relativo            | error de entrada          | `AUTH-CTX-026`                                     |
|    7 | catálogo no disponible o timeout                       | fail closed temporal      | `AUTH-ERR-019`                                     |
|    8 | catálogo con versión incompatible concluyente          | denegar                   | `AUTH-ERR-017`                                     |
|    9 | catálogo con hash o integridad inválidos               | denegar                   | `AUTH-ERR-017`                                     |
|   10 | aplicación válida, clave exacta con cero coincidencias | denegar                   | `AUTH_PERMISSION_NOT_REGISTERED`                   |
|   11 | mismo sufijo existe en otra aplicación                 | denegar                   | `AUTH_PERMISSION_NOT_REGISTERED`                   |
|   12 | clave existe una vez y está activa                     | continuar                 | evaluar contrato del permiso                       |
|   13 | clave existe pero está inactiva                        | denegar                   | `AUTH-ERR-017` o ciclo de vida                     |
|   14 | clave existe duplicada                                 | denegar                   | `AUTH-ERR-017`                                     |
|   15 | alias conocido enviado al evaluador directo            | denegar                   | `PERMISSION_ALIAS_REQUIRES_ADAPTER`                |
|   16 | permiso retirado conocido                              | denegar                   | `PERMISSION_RETIRED`                               |
|   17 | legacy uno-a-muchos                                    | denegar                   | `PERMISSION_LEGACY_REQUIRES_DECOMPOSITION`         |
|   18 | matriz contiene una cadena ausente del catálogo        | denegar antes de política | `AUTH_PERMISSION_NOT_REGISTERED` + brecha huérfana |
|   19 | clave válida sin allow                                 | denegar por política      | default deny                                       |
|   20 | clave válida con explicit deny                         | denegar por política      | razón de deny aplicable                            |
|   21 | `app.access` existe, capacidad específica no           | denegar                   | `AUTH_PERMISSION_NOT_REGISTERED`                   |
|   22 | simulación solicita clave inexistente                  | no autorizar              | `WOULD_DENY` o `INDETERMINATE`                     |
|   23 | lote atómico contiene una clave inexistente            | denegar lote              | cero efectos                                       |
|   24 | versión nueva registra la clave después del fallo      | reevaluar solicitud nueva | nunca replay automático                            |

La matriz es exhaustiva para esta tarea. Ningún escenario convierte ausencia
de registro en falta de grant del actor.

---

#### 31. Precedencia

Orden mínimo:

```text
1. superficie publica o protegida
2. autenticacion y sesion
3. identidad y actividad aplicables
4. contrato de entrada
5. aplicacion exacta
6. disponibilidad, version e integridad del catalogo
7. identidad exacta del permiso
8. ciclo de vida, alias y legado
9. contrato del permiso
10. contexto y recurso
11. grants y denies
12. composicion final
13. efecto
```

Reglas:

- una causa anterior concluyente conserva su propietario;
- `PERMISSION_NOT_FOUND` precede matrices, contexto y recurso;
- ausencia de allow no puede retroceder y convertirse en permiso inexistente;
- error técnico no puede convertirse en cero coincidencias;
- una clave retirada no se presenta como nunca registrada;
- una operación mal formada no consulta el catálogo;
- un permiso inexistente no revela razones posteriores del actor.

---

#### 32. `PERMISSION-NOT-REGISTERED-CHANNEL-RESPONSE-MATRIX-001`

| Canal                                 | Detección obligatoria                     | Respuesta                                            | Efecto |
| ------------------------------------- | ----------------------------------------- | ---------------------------------------------------- | -----: |
| Launcher y navegación                 | binding server-side + catálogo exacto     | estado de bloqueo; sin login ni fallback de menú     |      0 |
| RSC y render server-side              | contrato de superficie + versión          | no renderizar contenido protegido; componente seguro |      0 |
| Server Actions                        | permiso fijo de la acción                 | `500` antes de transacción                           |      0 |
| Route Handlers y API                  | contrato de operación                     | envelope uniforme y soporte opaco                    |      0 |
| RPC y PostgREST                       | adapter que diferencia catálogo de policy | excepción/envelope tipado; no booleano ambiguo       |      0 |
| RLS y Data API                        | preflight autoritativo fuera de policy    | no depender de cero filas como explicación           |      0 |
| Edge Functions                        | permiso fijo y catálogo compatible        | no llamar efectos externos                           |      0 |
| Realtime                              | clave de suscripción validada             | no abrir canal ni filtrar topic                      |      0 |
| Cliente offline y caché               | versión y fingerprint                     | descartar replay; requerir solicitud nueva           |      0 |
| Jobs, colas, webhooks e integraciones | contrato del productor                    | no programar, emitir ni confirmar                    |      0 |

RLS puede negar filas, pero no transporta por sí sola la razón pública. La capa
de servicio deberá resolver la capacidad antes de depender de la policy.

---

#### 33. `PERMISSION-NOT-REGISTERED-APPLICATION-COVERAGE-REGISTER-001`

| Aplicación | Superficies incluidas                                    | Regla ante clave no registrada                                   | Recuperación             |
| ---------- | -------------------------------------------------------- | ---------------------------------------------------------------- | ------------------------ |
| SHELL      | launcher, navegación y contratos compartidos             | bloquear sin inventar `app.access`                               | soporte y retorno seguro |
| ANIMA      | turnos, asistencia, documentos y equipo                  | no tratar como `false` de rol ni crear capability relativa       | soporte                  |
| AURA       | dominio laboral diferido                                 | no fabricar claves para una superficie no materializada          | retorno seguro           |
| FOGO       | recetas, producción, lotes y órdenes                     | bloquear antes de producir o consultar datos protegidos          | soporte                  |
| NEXO       | inventario, ubicaciones, conteos y remisiones            | coincidencia exacta; nunca permiso parecido                      | soporte                  |
| NUMERA     | finanzas, costos y rentabilidad                          | no devolver datos parciales ni exportaciones                     | soporte                  |
| ORIGO      | proveedores, compras y recepciones                       | no crear órdenes ni recepciones                                  | soporte                  |
| PASS       | capacidades internas modeladas; dominio cliente separado | no aplicar RBAC laboral a acciones de cliente no modeladas       | contrato propietario     |
| PULSO      | POS, pagos, ventas y devoluciones                        | bloquear antes de transacción, impresión o integración           | soporte                  |
| VISO       | administración y diagnóstico                             | puede mostrar detalle solo con permiso diagnóstico independiente | soporte autorizado       |

Cobertura:

```text
aplicaciones esperadas = 10
aplicaciones materializadas = 10
faltantes = 0
duplicados = 0
aplicaciones que crean fallback permisivo = 0
```

---

#### 34. Snapshot físico de solo lectura

El estado desplegado inspeccionado muestra:

| Elemento                                                             | Resultado observado |
| -------------------------------------------------------------------- | ------------------: |
| aplicaciones físicas                                                 |                  10 |
| permisos en `app_permissions`                                        |                 179 |
| permisos activos                                                     |                 179 |
| claves completas duplicadas                                          |                   0 |
| códigos relativos repetidos entre aplicaciones                       |                   5 |
| referencias de `app_navigation_items`                                |                  71 |
| referencias de `app_screen_registry`                                 |                  81 |
| referencia de `app_operation_policies`                               |                   1 |
| referencias físicas anteriores que resuelven en la proyección actual |          153 de 153 |
| filas de `role_permissions`                                          |                 613 |
| filas de `employee_permissions`                                      |                  17 |
| referencias UUID huérfanas observadas                                |                   0 |
| filas de `operational_role_permissions`                              |                  32 |
| claves operativas sin coincidencia física observadas                 |                   0 |
| filas legacy de `role_capabilities`                                  |                  26 |
| capacidades legacy actualmente resolubles solo en ANIMA              |                  26 |
| funciones relevantes inspeccionadas                                  |                   7 |
| funciones `SECURITY DEFINER` entre ellas                             |                   6 |
| funciones ejecutables por `authenticated`                            |                   6 |
| funciones ejecutables por `anon`                                     |                   2 |
| funciones con razón explícita `PERMISSION_NOT_FOUND`                 |                   0 |
| repositorios con helper booleano equivalente inspeccionado           |                   6 |

Comportamientos observados:

- `has_permission` busca una clave física activa, pero devuelve `false` tanto
  para clave ausente como para falta de grant o deny;
- `has_role_permission` conserva la misma ambigüedad;
- los evaluadores operativos consultan directamente
  `operational_role_permissions` sin validar primero el catálogo;
- `has_effective_permission_v1` combina helpers booleanos y conserva la
  pérdida de procedencia;
- `check_nexo_permissions` solo enumera permisos físicos y devuelve booleanos;
- `upsert_app_screen_registry` puede insertar o reactivar permisos a partir de
  una pantalla escaneada;
- los helpers de NEXO, FOGO, ORIGO, PULSO y VISO concatenan cadenas y convierten
  error RPC y resultado negativo en el mismo `false`;
- ANIMA acepta arreglos de strings, consulta `has_permission` y también reduce
  error y resultado a booleano;
- la proyección física no materializa versión, hash y ciclo de vida completos
  del catálogo contractual de 140 permisos.

---

#### 35. `PERMISSION-NOT-REGISTERED-PHYSICAL-RECONCILIATION-001`

|    # | Brecha física                                                                                                             | Estado                               | Riesgo                                                                      | Destino exacto                                                                                     |
| ---: | ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------ | --------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
|    1 | no existe publicación física verificable del catálogo contractual de 140 permisos con versión, schema y hash              | `PENDIENTE_DE_IMPLEMENTACION`        | la tabla de 179 filas se usa como fuente semántica no versionada            | `AUTH-CAT-017`; `AUTH-CAT-018`; `AUTH-DB-020`; `AUTH-DB-031`                                       |
|    2 | la proyección física no separa activos, aliases, retirados y legacy con ciclo de vida canónico                            | `BLOQUEADO`                          | una cadena retirada puede parecer ausente o activa                          | `AUTH-CAT-017`; `AUTH-CTX-028`; `AUTH-DB-020`                                                      |
|    3 | cinco evaluadores `has_*` devuelven booleanos y no preservan `PERMISSION_NOT_FOUND`                                       | `BLOQUEADO`                          | clave ausente, deny, falta de allow y contexto inválido son indistinguibles | `AUTH-CTX-026`; `AUTH-DB-034`; `SHELL-AUTH-001`; `SHELL-AUTH-002`                                  |
|    4 | evaluadores operativos no validan la existencia canónica antes de consultar la matriz                                     | `BLOQUEADO`                          | una fila huérfana podría autorizar una clave inexistente                    | `AUTH-DB-009`; `AUTH-DB-034`; `AUTH-QA-019`                                                        |
|    5 | `operational_role_permissions.permission_code` no tiene integridad referencial con una clave versionada                   | `PENDIENTE_DE_IMPLEMENTACION`        | drift y permisos operativos huérfanos                                       | `AUTH-DB-011`; `AUTH-DB-020`; `AUTH-DB-027`                                                        |
|    6 | `role_capabilities` usa código relativo sin `app_code`; 26 filas solo son unívocas por el estado actual                   | `PENDIENTE_DE_RECONCILIACION`        | una nueva coincidencia entre apps vuelve ambiguo el legado                  | `AUTH-CTX-028`; `AUTH-DB-020`; `AUTH-DB-030`                                                       |
|    7 | navegación y pantallas guardan referencias textuales sin FK al catálogo publicado                                         | `PENDIENTE_DE_IMPLEMENTACION`        | una ruta puede conservar una clave huérfana                                 | `AUTH-CAT-019`; `SHELL-AUTH-004`; `SHELL-AUTH-005`                                                 |
|    8 | `upsert_app_screen_registry` crea o reactiva permisos desde rutas y pantallas                                             | `BLOQUEADO`                          | la superficie técnica redefine el catálogo empresarial                      | `AUTH-CAT-019`; `AUTH-CTX-027`; `AUTH-DB-020`; `AUTH-DB-030`                                       |
|    9 | NEXO, FOGO, ORIGO, PULSO y VISO normalizan cadenas dinámicamente y colapsan error y deny                                  | `BLOQUEADO`                          | código inexistente se oculta como falta de acceso                           | `SHELL-AUTH-001`; `SHELL-AUTH-002`; `SHELL-AUTH-005`                                               |
|   10 | ANIMA acepta listas libres de strings y no conserva razón ni versión                                                      | `BLOQUEADO`                          | typo, error RPC y deny producen la misma interfaz                           | `AUTH-CAT-019`; `SHELL-AUTH-005`; `SHELL-CI-016`                                                   |
|   11 | ninguna de las siete funciones inspeccionadas emite razón explícita `PERMISSION_NOT_FOUND`                                | `PENDIENTE_DE_IMPLEMENTACION`        | canales y auditoría no pueden distinguir la causa                           | `AUTH-CTX-023`; `AUTH-CTX-026`; `AUTH-ERR-020`; `AUTH-DB-034`                                      |
|   12 | `has_permission` y `check_nexo_permissions` son ejecutables por `anon` y devuelven resultados sin contrato de enumeración | `PENDIENTE_DE_REVISION_DE_SEGURIDAD` | superficie pública no gobernada y semántica ambigua                         | `AUTH-DB-004`; `AUTH-DB-034`; `SHELL-AUTH-004`                                                     |
|   13 | policies y migraciones conservan cadenas manuales, incluso variantes legacy relativas                                     | `PENDIENTE_DE_RECONCILIACION`        | typo silencioso y policy que siempre devuelve falso                         | `AUTH-CAT-019`; `AUTH-DB-020`; `AUTH-DB-030`; `SHELL-AUTH-004`                                     |
|   14 | no existe envelope `500`, soporte opaco ni suite multicanal para la frontera `017/018/019`                                | `PENDIENTE_DE_IMPLEMENTACION`        | UI, RPC, RLS, offline y procesos asíncronos divergen                        | `AUTH-ERR-020`; `SHELL-AUTH-001`; `SHELL-AUTH-002`; `SHELL-CI-016`; `SHELL-CI-018`; `SHELL-CI-019` |

Cada brecha conserva propietario y condición de salida. No se crean tareas
nuevas porque existen destinos canónicos concretos.

---

#### 36. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se incorporan al registro canónico:

- `TREQ-AUTH-299`;
- `TREQ-AUTH-300`;
- `TREQ-AUTH-301`;
- `TREQ-AUTH-302`;
- `TREQ-AUTH-303`;
- `TREQ-AUTH-304`;
- `TREQ-AUTH-305`;
- `TREQ-AUTH-306`;
- `TREQ-AUTH-307`;
- `TREQ-AUTH-308`.

| Rango | Cobertura                                                               |
| ----- | ----------------------------------------------------------------------- |
| `299` | contrato público, `500`, sesión preservada y cero efectos               |
| `300` | identidad exacta, versión, hash y búsqueda concluyente                  |
| `301` | routing entre entrada, aplicación, ciclo de vida, política y técnica    |
| `302` | propiedad server-side y prohibición de selección o fallback del cliente |
| `303` | precedencia y prohibición de evaluar capas posteriores                  |
| `304` | equivalencia de diez canales                                            |
| `305` | cobertura de diez aplicaciones                                          |
| `306` | UX, privacidad, soporte y auditoría                                     |
| `307` | invalidación, caché, concurrencia e idempotencia                        |
| `308` | reconciliación física y cierre de catorce brechas                       |

Los requisitos permanecen `IDENTIFICADO` hasta que existan implementación y
evidencia reproducibles.

---

#### 37. Validaciones documentales definidas

El artefacto permite comprobar:

1. un único código público;
2. consumo exacto de `PERMISSION_NOT_FOUND`;
3. `STRUCTURAL_DENY` y `ACCESS_NOT_AVAILABLE` preservados;
4. `500` reservado para una operación con binding server-side inválido;
5. sesión preservada y cero efectos;
6. definición exhaustiva de lectura concluyente;
7. catálogo contractual vigente de 140 permisos;
8. identidad exacta `app_code + permission_code`;
9. cero fallbacks permitidos;
10. operación server-side propietaria del permiso;
11. diez perfiles causales separados;
12. alias, retiro y legado clasificados por separado;
13. grants y denies evaluados solo después de registro;
14. contexto y recurso no consultados ante ausencia;
15. frontera explícita con `AUTH-ERR-017` y `AUTH-ERR-019`;
16. veinticuatro escenarios sin decisión nula;
17. diez canales equivalentes;
18. diez aplicaciones reconciliadas;
19. catorce brechas con destino;
20. diez requisitos nuevos únicos;
21. 6.696 requisitos históricos preservados;
22. 6.706 filas con catorce columnas;
23. cero relaciones `TREQ-*` no resolubles.

---

#### 38. Evidencia, estados y límites materiales

| Elemento                                        | Estado                             |
| ----------------------------------------------- | ---------------------------------- |
| contrato de bloqueo                             | `ESPECIFICADO`                     |
| matriz de escenarios                            | `ESPECIFICADO`                     |
| matriz de canales                               | `ESPECIFICADO`                     |
| cobertura de aplicaciones                       | `ESPECIFICADO`                     |
| catálogo contractual documental                 | `ESPECIFICADO`                     |
| catálogo técnico publicado                      | `PENDIENTE_DE_IMPLEMENTACION`      |
| snapshot de Supabase                            | `PENDIENTE_DE_EVIDENCIA_OPERATIVA` |
| razón diferenciada en RPC y SDK                 | `BLOQUEADO`                        |
| adapters de aplicaciones                        | `PENDIENTE_DE_IMPLEMENTACION`      |
| integridad referencial de referencias textuales | `PENDIENTE_DE_IMPLEMENTACION`      |
| envelope compartido `500`                       | `PENDIENTE_DE_IMPLEMENTACION`      |
| pruebas automatizadas                           | `PENDIENTE_DE_IMPLEMENTACION`      |
| pruebas E2E, RLS, RPC, Edge y offline           | `PENDIENTE_DE_EVIDENCIA`           |

La ausencia actual de referencias huérfanas en varias tablas es evidencia de
estado, no certificación del contrato ni protección contra regresión.

---

#### 39. Fuera del alcance

AUTH-ERR-018 no:

- agrega, renombra, activa, retira o elimina permisos;
- decide qué permisos nuevos necesita una aplicación;
- corrige las 179 filas físicas;
- publica el catálogo técnico;
- crea aliases o mappings legacy;
- modifica rutas, pantallas o matrices;
- corrige helpers de aplicaciones;
- cambia funciones, grants o policies;
- crea tablas, constraints, índices, tipos, RPC o RLS;
- ejecuta DDL, DML, backfills o despliegues;
- modifica Supabase;
- escribe en repositorios remotos;
- prueba una ausencia mediante datos productivos creados para la tarea;
- certifica comportamiento operativo;
- inicia `AUTH-ERR-019`.

La implementación corresponde a los destinos exactos registrados en la
reconciliación física.

---

#### 40. Criterios de aceptación

- [x] Se definió `AUTH_PERMISSION_NOT_REGISTERED` como código público único.
- [x] Se consumió `PERMISSION_NOT_FOUND` como razón interna.
- [x] Se preservó `STRUCTURAL_DENY`.
- [x] Se preservó `ACCESS_NOT_AVAILABLE`.
- [x] Se definió `500 Internal Server Error` para la operación protegida.
- [x] Se preservó la sesión.
- [x] Se exigieron cero efectos.
- [x] Se prohibió reintento automático.
- [x] Se definieron las doce condiciones de aplicabilidad.
- [x] Se exigió catálogo publicado, compatible e íntegro.
- [x] Se tomó 140 como cantidad contractual vigente.
- [x] Se separó la proyección física de la fuente normativa.
- [x] Se exigió búsqueda exacta por aplicación y código relativo.
- [x] Se prohibieron coincidencias parciales y similares.
- [x] Se prohibió fallback a `app.access`.
- [x] Se definió que la operación de servidor es propietaria del permiso.
- [x] Se impidió al cliente reducir la protección.
- [x] Se definieron ocho causas privadas.
- [x] Se separó error de entrada.
- [x] Se separó aplicación no resuelta.
- [x] Se separó permiso inactivo o incompleto.
- [x] Se separaron alias, retiro y legado.
- [x] Se separaron falta de allow y explicit deny.
- [x] Se prohibió consultar contexto y recurso después de la ausencia.
- [x] Se separó indisponibilidad técnica.
- [x] Se definió simulación sin `WOULD_ALLOW`.
- [x] Se definieron lotes atómicos y diagnósticos.
- [x] Se definieron privacidad y prevención de enumeración.
- [x] Se definió recuperación mediante soporte.
- [x] Se definieron copy y accesibilidad.
- [x] Se definió auditoría privada suficiente.
- [x] Se definieron invalidación e idempotencia.
- [x] Se decidieron veinticuatro escenarios.
- [x] Se definieron diez canales equivalentes.
- [x] Se reconciliaron diez aplicaciones.
- [x] Se registró el snapshot físico sin presentarlo como conformidad.
- [x] Se registraron catorce brechas con destino exacto.
- [x] Se derivaron `TREQ-AUTH-299` a `TREQ-AUTH-308`.
- [x] No se modificó código, Supabase, migraciones, configuración, datos ni aplicaciones.
- [x] `AUTH-ERR-019` permanece únicamente reservada.

---

#### 41. Riesgos controlados

| Riesgo                                     | Control                                        |
| ------------------------------------------ | ---------------------------------------------- |
| typo tratado como falta de grant           | resolución de catálogo antes de política       |
| error RPC tratado como permiso ausente     | frontera concluyente versus indisponible       |
| permiso de otra app usado por sufijo       | identidad completa exacta                      |
| `app.access` usado como wildcard           | capacidades independientes                     |
| alias presentado como inexistente          | registros de ciclo de vida separados           |
| ruta técnica crea capacidad                | catálogo propietario y scanner no autoritativo |
| matriz registra una capacidad              | catálogo precede matrices                      |
| helper booleano pierde causa               | resultado discriminado y envelope tipado       |
| usuario culpado por defecto del consumidor | copy de función no disponible                  |
| clave expuesta permite enumeración         | soporte opaco y evidencia privada              |
| RLS devuelve cero filas ambiguas           | preflight en capa de servicio                  |
| permiso físico extra se considera canónico | versión, hash y publicación obligatorios       |
| caché stale conserva ausencia              | invalidación por fingerprint                   |
| corrección reproduce mutación              | solicitud nueva e idempotencia no consumida    |
| simulación fabrica capacidad               | nunca `WOULD_ALLOW`                            |
| lote omite miembro inválido                | atomicidad y cero efectos                      |

---

#### 42. Cierre de tarea y continuidad

**ÚLTIMA TAREA APROBADA**

`AUTH-ERR-017 — Configuración administrativa inconsistente`

**TAREA ACTUAL APROBADA**

`AUTH-ERR-018 — Permiso no registrado`

**SIGUIENTE TAREA RESERVADA**

`AUTH-ERR-019 — Diferenciar error técnico y denegación`


### ✅ AUTH-ERR-019 — Diferenciar error técnico y denegación

**Estado:** APROBADA
**Tarea anterior:** `AUTH-ERR-018 — Permiso no registrado` — APROBADA
**Tarea siguiente:** `AUTH-ERR-020 — Compartir mensajes desde vento-shell` — RESERVADA
**Tipo de tarea:** documental; definición contractual, causal, funcional, transaccional, de seguridad, experiencia, observabilidad y reconciliación física de la frontera entre una denegación de autorización válida y un fallo técnico que impide producir una decisión canónica completa

---

#### 1. Propósito

Definir de forma única, segura y verificable cómo Vento OS distingue entre:

1. una evaluación completada correctamente cuyo resultado final es `DENY`; y
2. un fallo técnico que impide construir, validar, emitir o utilizar una
   `AuthorizationDecision@1.0.0` completa.

La regla raíz queda:

```text
EVALUACION COMPLETA Y CONTRACTUALMENTE VALIDA
+
FINAL_DECISION.OUTCOME = DENY
→
DENEGACION DE AUTORIZACION
→
DECISION_ID VALIDO
→
RAZONES CANONICAS
```

```text
FUENTE, RESOLVER, TRANSPORTE, RPC, SERIALIZADOR
O DEPENDENCIA TECNICA OBLIGATORIA NO CONCLUYENTE
+
NO ES POSIBLE CONSTRUIR EL CONTRATO COMPLETO
→
FALLO TECNICO
→
SIN AuthorizationDecision PARCIAL
→
SIN DECISION_ID PUBLICADO
→
AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE
```

En ambos casos la acción empresarial queda bloqueada. Sin embargo, solo el
primer caso constituye una denegación de autorización.

```text
BLOQUEAR EJECUCION
≠
AFIRMAR DENEGACION
```

```text
NO PUDO VERIFICARSE
≠
NO ESTA AUTORIZADO
```

---

#### 2. Resultado material

Se aprueban cinco artefactos documentales completos:

1. `AUTHORIZATION-TECHNICAL-UNAVAILABILITY-CONTRACT-001`, que congela la
   identidad pública, forma discriminada, respuesta, recuperación,
   transacción, privacidad y observabilidad del fallo técnico;
2. `AUTHORIZATION-RESULT-STATE-DECISION-MATRIX-001`, que decide veinticuatro
   escenarios y separa decisión válida, configuración inválida, permiso no
   registrado e indisponibilidad técnica;
3. `AUTHORIZATION-TECHNICAL-CHANNEL-RESPONSE-MATRIX-001`, que materializa diez
   canales con semántica equivalente;
4. `AUTHORIZATION-TECHNICAL-APPLICATION-COVERAGE-REGISTER-001`, que decide el
   alcance para las diez aplicaciones canónicas;
5. `AUTHORIZATION-TECHNICAL-PHYSICAL-RECONCILIATION-001`, que registra el
   snapshot desplegado de solo lectura y catorce brechas con destino canónico.

Cobertura materializada:

| Elemento                                        |                   Cantidad |
| ----------------------------------------------- | -------------------------: |
| Código público canónico                         |                          1 |
| Estado público canónico                         |                          1 |
| Categoría pública                               | 1, `TECHNICAL_UNAVAILABLE` |
| Estado HTTP no navegacional                     |                   1, `503` |
| Variantes raíz del resultado de evaluación      |                          2 |
| Estados de fuente tipados                       |                          4 |
| Familias privadas de fallo técnico              |                          8 |
| Escenarios con decisión explícita               |                         24 |
| Canales con respuesta explícita                 |                         10 |
| Aplicaciones canónicas reconciliadas            |                         10 |
| Funciones físicas relevantes inspeccionadas     |                          8 |
| Funciones con estado técnico discriminado       |                          0 |
| Funciones con handler de excepción contractual  |                          0 |
| Funciones ejecutables por `authenticated`       |                          8 |
| Funciones ejecutables por `anon` y `PUBLIC`     |                          2 |
| Repositorios con consumo booleano inspeccionado |                          6 |
| Guards server-side inspeccionados               |                          5 |
| Middleware de SHELL inspeccionado               |                          1 |
| Brechas físicas registradas                     |                         14 |
| Requisitos de prueba derivados                  |                         10 |

Las cifras físicas son un snapshot agregado de solo lectura. No certifican
implementación ni paridad entre ambientes.

---

#### 3. Identidad canónica del fallo técnico

La identidad pública única es:

```text
reason_code = AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE
```

| Propiedad                            | Valor                                  |
| ------------------------------------ | -------------------------------------- |
| Dominio                              | `AUTHORIZATION_PLATFORM`               |
| Estado público                       | `AUTHORIZATION_EVALUATION_UNAVAILABLE` |
| Categoría pública                    | `TECHNICAL_UNAVAILABLE`                |
| Resultado de evaluación              | `TECHNICAL_FAILURE`                    |
| Decisión de autorización emitida     | `false`                                |
| Estado HTTP no navegacional          | `503 Service Unavailable`              |
| Ejecutable                           | `false`                                |
| Sesión                               | preservada                             |
| Efectos empresariales                | `0`                                    |
| Recuperación primaria                | `RETRY_LATER` cuando sea seguro        |
| Recuperación alternativa             | `CONTACT_SUPPORT`                      |
| Reproducción automática de la acción | prohibida                              |

Quedan prohibidos como identidad pública alternativa:

- `DENY`;
- `FORBIDDEN`;
- `NO_PERMISSION`;
- `AUTH_ERROR` sin clasificación;
- `PERMISSION_NOT_FOUND`;
- `CONFIGURATION_INCONSISTENT`;
- `LOGIN_REQUIRED`;
- un booleano `false`;
- el código bruto de PostgreSQL o Supabase;
- el texto de una excepción;
- el nombre de una tabla, función o proveedor.

---

#### 4. Distinción contractual fundamental

Una denegación válida requiere un objeto completo:

```text
AuthorizationDecision@1.0.0
+
decision_id
+
decided_at
+
context_fingerprint
+
permission_contract
+
resource
+
lane decisions
+
blocked_reasons
+
final_decision.outcome = DENY
+
audit
```

Un fallo técnico no podrá rellenar esos campos con valores sintéticos.

```text
FALLO TECNICO
→
NO AuthorizationDecision PARCIAL
```

```text
FALLO TECNICO
→
NO final_decision.outcome = DENY FABRICADO
```

```text
FALLO TECNICO
→
BLOQUEO DE EJECUCION SIN JUICIO AUTORIZATIVO
```

La ausencia de decisión positiva no es suficiente para afirmar una decisión
negativa.

---

#### 5. Unión discriminada del resultado

La frontera canónica deberá representar el resultado mediante una unión
cerrada equivalente a:

```ts
type AuthorizationEvaluationResult =
  | {
      status: "DECIDED";
      decision: AuthorizationDecision;
    }
  | {
      status: "TECHNICAL_FAILURE";
      failure: AuthorizationTechnicalFailure;
    };
```

Invariantes:

1. `DECIDED` siempre contiene una decisión completa;
2. `TECHNICAL_FAILURE` nunca contiene una decisión;
3. no existe una variante híbrida;
4. no existe `decision: null` dentro de `DECIDED`;
5. no existe `failure: null` dentro de `TECHNICAL_FAILURE`;
6. una variante desconocida falla cerrada;
7. ningún consumidor reduce la unión a booleano antes de tratar la variante;
8. `FinalDecision` conserva exclusivamente `ALLOW | DENY`.

Esta tarea no agrega un tercer outcome a `AuthorizationDecision`.

---

#### 6. Contrato del fallo técnico

`AUTHORIZATION-TECHNICAL-UNAVAILABILITY-CONTRACT-001` tendrá una forma lógica
equivalente a:

```ts
type AuthorizationTechnicalFailure = {
  contract: "AUTHORIZATION-TECHNICAL-UNAVAILABILITY-CONTRACT-001";
  contract_version: "1.0.0";
  reason_code: "AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE";
  state: "AUTHORIZATION_EVALUATION_UNAVAILABLE";
  category: "TECHNICAL_UNAVAILABLE";
  result_status: "TECHNICAL_FAILURE";
  decision_produced: false;
  executable: false;
  retryable: boolean;
  retry_after_seconds: number | null;
  session_preserved: true;
  effects_committed: false;
  recovery_action: "RETRY_LATER" | "CONTACT_SUPPORT";
  evaluation_attempt_id: string;
  correlation_id: string;
  support_code: string;
  occurred_at: string;
};
```

La forma pública no incluye:

- `decision_id`;
- `permission_key`;
- stack trace;
- SQLSTATE;
- nombre de proveedor;
- hostname;
- credenciales;
- payload empresarial;
- actor, rol o recurso completos.

---

#### 7. Identificadores y atribución

El fallo técnico utilizará:

```text
evaluation_attempt_id
```

para identificar el intento de evaluación.

Reglas:

- es generado en servidor;
- es único por intento externo;
- permanece estable durante reintentos internos del mismo intento;
- no es un `decision_id`;
- no es token de capacidad;
- no se reutiliza para una nueva solicitud del usuario;
- se vincula con `correlation_id` y `support_code`;
- no concede acceso ni confirma denegación.

Un `decision_id` candidato generado internamente antes del fallo se descarta y
no se publica, persiste ni reutiliza como decisión válida.

---

#### 8. Estados de fuente obligatorios

Toda fuente autoritativa utilizada por el evaluador deberá producir uno de
estos estados:

```ts
type AuthorizationSourceStatus =
  | "CONCLUSIVE"
  | "NOT_APPLICABLE"
  | "INVALID"
  | "UNAVAILABLE";
```

Semántica:

| Estado           | Significado                                                            | Enrutamiento                                     |
| ---------------- | ---------------------------------------------------------------------- | ------------------------------------------------ |
| `CONCLUSIVE`     | la fuente respondió completa, vigente y verificable                    | continuar o producir resultado causal específico |
| `NOT_APPLICABLE` | el contrato no exige la fuente para esta solicitud                     | no consultar o ignorar sin fabricar datos        |
| `INVALID`        | la fuente respondió de forma concluyente con contradicción contractual | `AUTH-ERR-017` o razón estructural propietaria   |
| `UNAVAILABLE`    | no existe evidencia suficiente para afirmar el contenido de la fuente  | `AUTH-ERR-019` cuando la fuente es obligatoria   |

Queda prohibido representar los cuatro estados mediante:

```text
true
false
null
[]
```

sin procedencia adicional.

---

#### 9. Condición exacta de aplicabilidad

`AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE` aplica si y solo si:

1. la superficie exige una evaluación de autorización;
2. el contrato de invocación permite identificar la operación;
3. al menos una fuente, resolver, transporte, serializer o dependencia
   obligatoria queda `UNAVAILABLE`;
4. esa indisponibilidad impide construir o validar el resultado completo;
5. no existe una decisión completa emitida antes del fallo;
6. no se produjo un efecto empresarial;
7. no existe una causa concluyente propietaria anterior que permita cerrar la
   solicitud sin la fuente fallida;
8. el intento se registra de forma técnica y minimizada;
9. la sesión se conserva;
10. la acción no se reproduce automáticamente.

Forma lógica:

```text
PROTECTED_OPERATION = TRUE
AND
MANDATORY_AUTH_SOURCE_STATUS = UNAVAILABLE
AND
FULL_DECISION_CONSTRUCTIBLE = FALSE
AND
BUSINESS_EFFECTS_COMMITTED = FALSE
→
AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE
```

---

#### 10. Qué constituye indisponibilidad técnica

Pertenecen a `UNAVAILABLE`, cuando impiden una conclusión confiable:

- timeout;
- error DNS o de red;
- conexión rechazada o agotamiento de pool;
- RPC no ejecutable o respuesta de transporte fallida;
- proveedor temporalmente no disponible;
- respuesta truncada, parcial o no verificable;
- lectura que no puede demostrar freshness o fingerprint requerido;
- error de serialización o deserialización;
- fallo del validador de invariantes que impide producir el contrato;
- versión o hash que no pudieron leerse;
- fuente obligatoria que no responde dentro del presupuesto aprobado;
- persistencia obligatoria de evidencia no disponible antes de ejecutar;
- dependencia técnica cuyo estado no puede determinarse.

La clasificación se realiza con códigos privados normalizados, no con el texto
libre de una excepción.

---

#### 11. Qué no constituye indisponibilidad técnica

No utiliza `AUTH-ERR-019`:

- sesión ausente o expirada de forma concluyente;
- identidad inactiva;
- aplicación registrada sin acceso;
- permiso exacto registrado pero no concedido;
- explicit deny;
- default deny;
- scope mismatch;
- ausencia ordinaria de turno, check-in, sede, área o rol;
- dispositivo coherente que restringe la solicitud;
- simulación que intenta producir efectos;
- configuración leída de forma concluyente y contradictoria;
- clave exacta concluyentemente ausente;
- recurso existente en estado incompatible;
- campo no autorizado;
- dependencia de permiso denegada;
- concurrencia o idempotencia fallidas de forma concluyente.

Todos esos hechos pueden bloquear ejecución, pero tienen un propietario causal
distinto.

---

#### 12. Frontera con AUTH-ERR-017

La diferencia queda:

```text
FUENTE LEIDA COMPLETA
+
CONTRADICCION DEMOSTRADA
→
INVALID
→
AUTH-ERR-017
```

```text
FUENTE NO LEIDA O NO VERIFICABLE
+
NO PUEDE DEMOSTRARSE SU CONTENIDO
→
UNAVAILABLE
→
AUTH-ERR-019
```

Ejemplos:

| Caso                                                               | Clasificación |
| ------------------------------------------------------------------ | ------------- |
| schema completo con enum desconocido                               | `INVALID`     |
| versión completa y concluyentemente incompatible                   | `INVALID`     |
| dos filas autoritativas contradictorias                            | `INVALID`     |
| metadata contractual obligatoria ausente en una respuesta completa | `INVALID`     |
| timeout antes de leer metadata                                     | `UNAVAILABLE` |
| respuesta truncada antes de validar versión                        | `UNAVAILABLE` |
| hash no pudo consultarse                                           | `UNAVAILABLE` |
| snapshot mezclado demostrado                                       | `INVALID`     |
| freshness no demostrable por falla de fuente                       | `UNAVAILABLE` |

No se elegirá silenciosamente entre `017` y `019`.

---

#### 13. Frontera con AUTH-ERR-018

La diferencia queda:

```text
CATALOGO CONCLUYENTE
+
VERSION PUBLICADA COMPATIBLE
+
BUSQUEDA EXACTA
+
MATCH_COUNT = 0
→
AUTH-ERR-018
```

```text
CATALOGO NO RESPONDE
O NO PUEDE VERIFICARSE
→
AUTH-ERR-019
```

Queda prohibido:

- convertir un error RPC en `match_count = 0`;
- convertir una tabla no visible por RLS en permiso ausente;
- convertir una respuesta vacía sin versión en ausencia concluyente;
- convertir una excepción del parser en permiso no registrado;
- usar caché sin fingerprint para declarar la ausencia.

---

#### 14. Frontera con una denegación válida

Existe una denegación válida cuando:

1. el contrato de entrada es válido;
2. el contexto fue resuelto suficientemente;
3. la aplicación y el permiso fueron identificados;
4. el recurso y las fuentes obligatorias fueron resueltos;
5. los datasets requeridos fueron cargados o declarados no aplicables;
6. los carriles aplicables tienen outcomes contractuales;
7. las restricciones finales fueron evaluadas;
8. las razones se consolidaron;
9. los invariantes se validaron;
10. la decisión completa fue serializada.

Resultado:

```text
status = DECIDED
final_decision.outcome = DENY
```

Un consumidor deberá poder diferenciar ese resultado de:

```text
status = TECHNICAL_FAILURE
```

sin analizar texto humano.

---

#### 15. Fuentes obligatorias y no aplicables

La indisponibilidad solo bloquea cuando afecta una fuente necesaria para la
solicitud actual.

```text
SOURCE = NOT_APPLICABLE
→
NO FALLO TECNICO
```

```text
SOURCE = MANDATORY
+
SOURCE = UNAVAILABLE
→
NO DECISION
```

Ejemplos:

- el carril base no consulta turno cuando no participa;
- un permiso `N` no exige check-in;
- un contrato `NON_RESOURCE` no consulta un resolver empresarial;
- una fuente de simulación no participa en una evaluación real;
- una integración no aplicable no se registra como fallida.

El silencio no equivale a `NOT_APPLICABLE`; la no aplicabilidad debe derivarse
del contrato.

---

#### 16. Modalidad y composición por carriles

Una fuente obligatoria indisponible para un carril aplicable impide producir
una `LaneDecision` completa para ese carril.

Por tanto:

| Modalidad              | Regla ante fuente obligatoria indisponible                                                                  |
| ---------------------- | ----------------------------------------------------------------------------------------------------------- |
| `BASE_ONLY`            | no emitir decisión                                                                                          |
| `OPERATIONAL_ONLY`     | no emitir decisión                                                                                          |
| `BASE_OR_OPERATIONAL`  | no emitir decisión si la fuente pertenece a un carril aplicable o puede ocultar una restricción transversal |
| `BASE_AND_OPERATIONAL` | no emitir decisión                                                                                          |

En `BASE_OR_OPERATIONAL` solo se preserva una decisión ya completa cuando el
fallo posterior afecta exclusivamente una dependencia no autoritativa y
opcional, como telemetría no obligatoria. No se representa un carril aplicable
`UNAVAILABLE` como `DENY`, `NOT_APPLICABLE` ni `ALLOW`.

Queda prohibido:

- prestar un resultado del otro carril para rellenar el carril fallido;
- asumir que una fuente caída no contiene un deny;
- omitir un carril aplicable para completar el contrato;
- convertir indisponibilidad en default deny;
- emitir `ALLOW` con evidencia obligatoria incompleta.

---

#### 17. Momento del fallo y frontera transaccional

AUTH-ERR-019 aplica únicamente cuando puede afirmarse:

```text
effects_committed = false
```

La secuencia mínima para una mutación será:

```text
CONSTRUIR SOLICITUD
→ EVALUAR AUTORIZACION
→ OBTENER RESULTADO DECIDED
→ VERIFICAR ALLOW
→ REVALIDAR CONTEXTO Y RECURSO
→ EJECUTAR EFECTO
```

Si un fallo ocurre después de iniciar efectos empresariales y no puede
probarse atomicidad o rollback completo:

- no se afirmará `effects_committed = false`;
- no se utilizará AUTH-ERR-019 como resultado final de la operación;
- se activará el contrato de incidente y reconciliación propietario del
  proceso;
- se conservará evidencia de estado incierto;
- no se reintentará automáticamente la mutación.

Esta tarea no sustituye los incidentes funcionales de cada dominio.

---

#### 18. Persistencia y auditoría obligatoria

Cuando el contrato de una operación exige persistir la decisión antes del
efecto, una falla de persistencia produce:

```text
TECHNICAL_FAILURE
+
NO EJECUCION
```

Aunque exista un candidato completo en memoria:

- no se considera decisión emitida;
- no se expone el `decision_id` candidato;
- no se marca la idempotency key como éxito;
- no se ejecuta el dominio;
- se registra el intento técnico cuando sea posible;
- una solicitud nueva deberá reevaluar todo.

Si la persistencia o telemetría es explícitamente opcional, su falla no cambia
una decisión completa ya emitida, pero genera observabilidad técnica separada.

---

#### 19. Reintentos internos

Los reintentos internos solo se permiten cuando:

- la lectura es idempotente;
- existe un presupuesto máximo;
- existe backoff;
- la fuente clasifica el fallo como transitorio;
- el mismo `evaluation_attempt_id` se conserva;
- no se inició ningún efecto empresarial;
- cada intento mantiene trazabilidad;
- el límite no oculta una latencia excesiva.

Queda prohibido:

- bucle ilimitado;
- reintentar un error contractual;
- reintentar un explicit deny;
- cambiar de fuente semántica como fallback;
- usar datos stale para “rescatar” la evaluación;
- transformar agotamiento de reintentos en `DENY`.

---

#### 20. Reintento visible y recuperación

Después de emitir el envelope público:

- no se reproduce automáticamente la acción;
- no se conserva una mutación pendiente para ejecutarla sin nueva intención;
- el usuario podrá iniciar una solicitud nueva cuando `retryable = true`;
- el cliente respetará `retry_after_seconds` cuando exista;
- cada solicitud nueva obtiene nuevo `evaluation_attempt_id`;
- la autorización se resuelve desde fuentes frescas;
- la sesión permanece;
- una clave de idempotencia fallida no se marca como completada.

`retryable = false` se utiliza cuando el fallo requiere soporte o despliegue,
no cuando el usuario carece de autorización.

---

#### 21. Familias privadas de fallo técnico

La auditoría podrá utilizar estas familias privadas sin crear códigos públicos
alternativos:

| Familia privada                          | Condición                                                  |
| ---------------------------------------- | ---------------------------------------------------------- |
| `NETWORK_OR_DNS_FAILURE`                 | no se alcanzó la dependencia                               |
| `TIMEOUT_BUDGET_EXHAUSTED`               | no hubo respuesta confiable dentro del presupuesto         |
| `CONNECTION_OR_POOL_UNAVAILABLE`         | no fue posible adquirir conexión                           |
| `RPC_OR_PROVIDER_FAILURE`                | la frontera técnica devolvió error no contractual          |
| `PARTIAL_OR_UNVERIFIABLE_RESPONSE`       | respuesta incompleta, truncada o sin evidencia suficiente  |
| `SOURCE_FRESHNESS_UNPROVABLE`            | no pudo validarse versión, hash, snapshot o vigencia       |
| `SERIALIZATION_OR_INVARIANT_FAILURE`     | no pudo producirse el contrato completo                    |
| `MANDATORY_EVIDENCE_PERSISTENCE_FAILURE` | la operación exige evidencia durable y no pudo persistirse |

La causa privada no se expone a un consumidor ordinario.

---

#### 22. Envelope público

Respuesta mínima:

```json
{
  "ok": false,
  "result_status": "TECHNICAL_FAILURE",
  "reason_code": "AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE",
  "state": "AUTHORIZATION_EVALUATION_UNAVAILABLE",
  "category": "TECHNICAL_UNAVAILABLE",
  "message_code": "AUTHORIZATION_CHECK_UNAVAILABLE",
  "decision_produced": false,
  "executable": false,
  "retryable": true,
  "retry_after_seconds": 30,
  "session_preserved": true,
  "effects_committed": false,
  "recovery_action": "RETRY_LATER",
  "evaluation_attempt_id": "opaque-attempt-id",
  "support_code": "opaque-support-code",
  "correlation_id": "opaque-correlation-id"
}
```

Estado HTTP:

```text
503 Service Unavailable
```

Cuando no existe un tiempo fiable, `retry_after_seconds` será `null`. El
cliente no inventará un valor ni reintentará en bucle.

---

#### 23. Copy y experiencia

Copy aprobado en español:

| Elemento                                | Texto exacto                                                                                                                                          |
| --------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| Título                                  | `No pudimos verificar el acceso`                                                                                                                      |
| Mensaje                                 | `Ocurrió un problema técnico al verificar tu acceso. No se realizó ningún cambio. Intenta nuevamente en unos minutos o informa el código de soporte.` |
| Acción primaria cuando sea reintentable | `Intentar de nuevo`                                                                                                                                   |
| Acción de soporte                       | `Copiar código de soporte`                                                                                                                            |
| Acción secundaria                       | `Volver`                                                                                                                                              |
| Confirmación de efectos                 | `No se realizó ningún cambio.`                                                                                                                        |
| Código visible                          | `AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE`                                                                                                           |

Reglas:

1. no afirmar “no tienes permiso”;
2. no afirmar “tu rol no puede hacerlo”;
3. no redirigir a login por la causa técnica;
4. no cerrar sesión;
5. no borrar cookies;
6. no mostrar stack trace;
7. no mostrar la clave de permiso;
8. no mostrar proveedor, SQL o infraestructura;
9. anunciar accesiblemente título, mensaje, estado y recuperación;
10. no presentar el fallo como sanción o configuración del trabajador.

---

#### 24. Privacidad y minimización

La respuesta pública no revelará:

- nombre de función o tabla;
- hostname, región o proyecto;
- clave solicitada;
- catálogo completo;
- rol, grant o deny consultado;
- actor o recurso completo;
- SQLSTATE;
- detalles de red;
- stack trace;
- secretos, cookies o tokens;
- payload empresarial;
- versión interna completa cuando facilite enumeración.

El `support_code` permite correlación. Una interfaz de diagnóstico autorizada
podrá consultar evidencia ampliada mediante un permiso independiente.

---

#### 25. Auditoría técnica separada

Cada fallo deberá permitir registrar, cuando la plataforma de evidencia esté
disponible:

```text
evaluation_attempt_id
correlation_id
support_code
request_source
consumer_id
app_code
permission_key privada
operation_kind
failure_stage
private_failure_family
sanitized_provider_code
source_status = UNAVAILABLE
retry_count
retry_budget
duration_ms
source_versions conocidas
source_fingerprints conocidos
session_preserved = true
effects_committed = false
occurred_at
```

No registra una `AuthorizationDecision` inexistente.

Un fallo de la propia plataforma de auditoría se reporta por un canal de
emergencia minimizado y no justifica ejecutar la acción sin evidencia cuando
la persistencia es obligatoria.

---

#### 26. Métricas y observabilidad

Se separan dos familias métricas:

```text
authorization_decisions_total{outcome="DENY", reason_category=...}
```

```text
authorization_evaluation_failures_total{failure_family=..., stage=...}
```

Reglas:

- un fallo técnico no incrementa denegaciones;
- una denegación no incrementa indisponibilidad;
- la tasa de `DENY` no se usa como disponibilidad del evaluador;
- la tasa de 503 no se interpreta como conducta del actor;
- las alertas técnicas usan agregados y no PII;
- el diagnóstico conserva etapa, latencia, fuente y presupuesto;
- una recuperación posterior no reescribe el evento histórico;
- la telemetría opcional no es autoridad de ejecución.

---

#### 27. Códigos HTTP y caché

| Resultado           |                                   HTTP | Cacheable                      | Sesión                           |
| ------------------- | -------------------------------------: | ------------------------------ | -------------------------------- |
| `DECIDED + ALLOW`   |                        según operación | según contrato de la operación | preservada                       |
| `DECIDED + DENY`    | código de la razón pública propietaria | no por defecto                 | preservada salvo razón de sesión |
| `TECHNICAL_FAILURE` |                                  `503` | no                             | preservada                       |

El `503` podrá incluir `Retry-After` únicamente cuando exista una política
calculada y segura.

Queda prohibido:

- usar `401` para una dependencia caída;
- usar `403` para un timeout;
- usar `404` para ocultar indisponibilidad;
- cachear el 503 como denegación;
- limpiar sesión por un 503;
- convertir un error de transporte en pantalla de no acceso.

---

#### 28. RLS y Data API

RLS puede devolver cero filas por múltiples causas y no transporta por sí sola
la clasificación de la decisión.

```text
ZERO ROWS
≠
DENY DEMOSTRADO
```

```text
ZERO ROWS
≠
TECHNICAL FAILURE DEMOSTRADO
```

La capa de servicio deberá:

1. resolver o evaluar mediante una frontera autoritativa;
2. distinguir error de transporte de resultado de policy;
3. no usar ausencia de filas como única explicación pública;
4. no ampliar acceso si falla el preflight;
5. no revelar existencia de datos protegidos;
6. mantener equivalencia certificada entre predicados optimizados y el núcleo.

Una policy sigue fallando cerrada, pero el consumidor no puede inventar la
causa sin evidencia.

---

#### 29. Realtime, offline y procesos asíncronos

Realtime:

- no abre una suscripción si la evaluación técnica no concluye;
- no conserva una suscripción con fingerprint inválido;
- no presenta cierre técnico como deny del actor;
- requiere una suscripción nueva después de recuperar.

Offline:

- una cola no ejecuta con autorización desconocida;
- no convierte un 503 en denegación permanente;
- no reproduce una mutación automáticamente después de recuperar;
- exige intención nueva o confirmación explícita según el proceso.

Jobs, colas, webhooks e integraciones:

- pueden aplicar reintentos internos limitados;
- reevaluarán autorización en cada intento ejecutable;
- no confirmarán éxito ante fallo técnico;
- después de agotar presupuesto quedarán bloqueados o en dead-letter;
- un replay posterior será explícito, auditable y reautorizado.

---

#### 30. `AUTHORIZATION-RESULT-STATE-DECISION-MATRIX-001`

|    # | Escenario                                                                      | Resultado                                   | Propietario o acción                                                                           |
| ---: | ------------------------------------------------------------------------------ | ------------------------------------------- | ---------------------------------------------------------------------------------------------- |
|    1 | superficie pública sin autorización                                            | continuar                                   | no aplica                                                                                      |
|    2 | envelope ausente o mal formado                                                 | error contractual                           | `AUTH-CTX-026`                                                                                 |
|    3 | sesión concluyentemente ausente                                                | `DECIDED + DENY` o bloqueo previo           | `AUTH-ERR-001`                                                                                 |
|    4 | identidad concluyentemente inactiva                                            | `DECIDED + DENY`                            | `AUTH-ERR-002`                                                                                 |
|    5 | aplicación registrada y evaluación completa sin acceso                         | `DECIDED + DENY`                            | `AUTH-ERR-003`                                                                                 |
|    6 | permiso registrado sin allow suficiente                                        | `DECIDED + DENY`                            | default deny o razón de carril                                                                 |
|    7 | explicit deny coincidente                                                      | `DECIDED + DENY`                            | `AUTH_ADMIN_PERMISSION_DENIED` o `AUTH_OPERATIONAL_PERMISSION_DENIED` según el carril decisivo |
|    8 | ausencia ordinaria de turno, check-in, sede, área o rol                        | `DECIDED + DENY` cuando el permiso lo exige | `AUTH-ERR-005` a `AUTH-ERR-014`                                                                |
|    9 | dispositivo coherente restringe la solicitud                                   | `DECIDED + DENY`                            | `AUTH-ERR-015`                                                                                 |
|   10 | simulación intenta ejecutar                                                    | `DECIDED + DENY`                            | `AUTH-ERR-016`                                                                                 |
|   11 | configuración completa pero contradictoria                                     | `DECIDED + DENY`                            | `AUTH-ERR-017`                                                                                 |
|   12 | catálogo completo y clave exacta ausente                                       | `DECIDED + DENY`                            | `AUTH-ERR-018`                                                                                 |
|   13 | DNS, red o conexión impiden consultar fuente obligatoria                       | `TECHNICAL_FAILURE`                         | `AUTH-ERR-019`                                                                                 |
|   14 | RPC devuelve error técnico                                                     | `TECHNICAL_FAILURE`                         | `AUTH-ERR-019`                                                                                 |
|   15 | presupuesto de timeout agotado                                                 | `TECHNICAL_FAILURE`                         | `AUTH-ERR-019`                                                                                 |
|   16 | respuesta parcial o no verificable                                             | `TECHNICAL_FAILURE`                         | `AUTH-ERR-019`                                                                                 |
|   17 | no puede demostrarse versión, hash o freshness                                 | `TECHNICAL_FAILURE`                         | `AUTH-ERR-019`                                                                                 |
|   18 | resolver de recurso obligatorio no responde                                    | `TECHNICAL_FAILURE`                         | `AUTH-ERR-019`                                                                                 |
|   19 | serializer o validador impide producir contrato completo                       | `TECHNICAL_FAILURE`                         | `AUTH-ERR-019`                                                                                 |
|   20 | RLS devuelve cero filas sin preflight concluyente                              | bloquear sin atribuir causa                 | reevaluar por frontera autoritativa; si no está disponible, `AUTH-ERR-019`                     |
|   21 | `BASE_AND_OPERATIONAL` con un carril denegado y otro técnicamente indisponible | `TECHNICAL_FAILURE`                         | no fabricar `DENY` completo                                                                    |
|   22 | `BASE_OR_OPERATIONAL` con fuente obligatoria de un carril indisponible         | `TECHNICAL_FAILURE`                         | no omitir carril aplicable ni posible deny transversal                                         |
|   23 | decisión completa ya emitida y falla telemetría opcional                       | conservar decisión                          | incidente de observabilidad separado                                                           |
|   24 | falla persistencia obligatoria antes del efecto                                | `TECHNICAL_FAILURE` y cero efectos          | nueva solicitud después de recuperar                                                           |

La matriz no permite `ALLOW`, `DENY` ni `NOT_APPLICABLE` sintéticos para una
fuente obligatoria indisponible.

---

#### 31. Precedencia causal

Orden mínimo:

```text
1. naturaleza publica o protegida de la superficie
2. validez del contrato de invocacion
3. disponibilidad de fuentes obligatorias para construir la evaluacion
4. autenticacion e identidad concluyentes
5. aplicacion y permiso exactos
6. integridad contractual y de catalogo
7. contexto, recurso y datasets
8. carriles, denies, allows y prerrequisitos
9. restricciones finales
10. decision completa o fallo tecnico discriminado
11. efecto empresarial
```

Reglas:

- una indisponibilidad impide afirmar hechos posteriores no observados;
- una causa concluyente anterior no se degrada a fallo técnico;
- una denegación completa no se reescribe por un fallo opcional posterior;
- `AUTH-ERR-017` exige contradicción concluyente;
- `AUTH-ERR-018` exige cero coincidencias concluyentes;
- `AUTH-ERR-019` exige imposibilidad de concluir una fuente obligatoria;
- una decisión parcial no se serializa como válida;
- ningún efecto precede una variante `DECIDED + ALLOW` completa.

---

#### 32. `AUTHORIZATION-TECHNICAL-CHANNEL-RESPONSE-MATRIX-001`

| Canal                                 | Detección mínima                                         | Respuesta                                    | Recuperación                    | Efectos |
| ------------------------------------- | -------------------------------------------------------- | -------------------------------------------- | ------------------------------- | ------: |
| Launcher y navegación                 | adapter server-side distingue sesión, deny y dependencia | estado técnico; no login ni no-access        | retry explícito o volver        |       0 |
| RSC y render server-side              | frontera tipada antes de datos protegidos                | componente seguro y `503` semántico          | solicitud nueva                 |       0 |
| Server Actions                        | evaluación antes de transacción                          | resultado tipado sin lanzar texto al cliente | retry explícito                 |       0 |
| Route Handlers y API                  | handler central trata la unión discriminada              | envelope JSON y `503`                        | respetar backoff                |       0 |
| RPC y PostgREST                       | adapter separa error RPC de decisión                     | error/envelope controlado; no booleano       | nueva invocación                |       0 |
| RLS y Data API                        | preflight o servicio autoritativo                        | cero filas no recibe causa inventada         | evaluación concluyente nueva    |       0 |
| Edge Functions                        | evaluador común antes de efectos o secret key            | envelope equivalente                         | retry limitado o soporte        |       0 |
| Realtime                              | autorización de canal y fingerprint vigentes             | no suscribir o cerrar técnicamente           | suscripción nueva               |       0 |
| Cliente offline y caché               | versión, fingerprint y estado discriminado               | operación no ejecutable; no deny permanente  | intención nueva                 |       0 |
| Jobs, colas, webhooks e integraciones | worker distingue resultado y transporte                  | retry interno limitado o dead-letter         | replay explícito y reautorizado |       0 |

Todos los canales conservan el mismo código público y no convierten el fallo en
login, permiso ausente, lista vacía, `false` o excepción sin contrato.

---

#### 33. `AUTHORIZATION-TECHNICAL-APPLICATION-COVERAGE-REGISTER-001`

| Aplicación | Decisión ante fallo técnico                                                                                               |
| ---------- | ------------------------------------------------------------------------------------------------------------------------- |
| SHELL      | launcher, sesión y contratos compartidos preservan sesión; falta de configuración o excepción no se presentan como login  |
| ANIMA      | turnos, asistencia, documentos y equipo distinguen estado no cargado de permiso denegado; no vacían el mapa como decisión |
| AURA       | su condición diferida no es indisponibilidad; una dependencia técnica real se clasifica sin fabricar capacidades          |
| FOGO       | recetas, producción y lotes bloquean antes de efectos y no muestran “sin permiso” por error RPC                           |
| NEXO       | inventario, conteos y remisiones separan deny, permiso no registrado y servicio no disponible                             |
| NUMERA     | costos, finanzas y exportaciones no devuelven datos parciales ni convierten dependencia caída en acceso denegado          |
| ORIGO      | órdenes, proveedores y recepciones bloquean antes de persistir y conservan intención sin replay automático                |
| PASS       | autorización de cliente permanece separada; solo capacidades internas modeladas usan este contrato técnico compartido     |
| PULSO      | venta, pago, caja, impresión e integración bloquean antes de cualquier transacción o comando físico                       |
| VISO       | administración y diagnóstico muestran estado técnico separado; role override no convierte un error en deny concluyente    |

Reconciliación:

```text
aplicaciones esperadas = 10
aplicaciones materializadas = 10
faltantes = 0
duplicados = 0
aplicaciones autorizadas con fuente obligatoria indisponible = 0
```

---

#### 34. Snapshot físico de solo lectura

El estado desplegado inspeccionado muestra:

| Elemento                                                      | Resultado observado |
| ------------------------------------------------------------- | ------------------: |
| funciones relevantes de contexto y permiso                    |                   8 |
| funciones con resultado booleano directo o incluido           |                   8 |
| funciones con handler de excepción contractual                |                   0 |
| funciones que emiten estado técnico explícito                 |                   0 |
| funciones que emiten `PERMISSION_NOT_FOUND` explícito         |                   0 |
| funciones ejecutables por `authenticated`                     |                   8 |
| funciones ejecutables por `anon` y `PUBLIC`                   |                   2 |
| funciones `SECURITY DEFINER`                                  |                   7 |
| helpers de aplicaciones que convierten error RPC en `false`   |                   5 |
| repositorio adicional que convierte error de lote en ausencia |            1, ANIMA |
| guards server-side inspeccionados                             |                   5 |
| guards que fusionan error y resultado negativo                |                   5 |
| middleware de SHELL inspeccionado                             |                   1 |
| middleware que dirige falta de configuración a login          |                   1 |
| middleware que limpia cookies ante excepción de Auth          |                   1 |
| unión compartida `DECIDED \| TECHNICAL_FAILURE` observada     |                   0 |

Comportamientos observados:

- `has_permission`, `has_role_permission` y evaluadores operativos devuelven
  booleanos sin procedencia;
- `get_operational_context` y `get_effective_context_v1` publican
  `can_operate` y arreglos de razones, pero no una disponibilidad técnica
  discriminada;
- ninguna de las ocho funciones inspeccionadas tiene handler contractual de
  excepción o estado `UNAVAILABLE`;
- NEXO, FOGO, ORIGO, PULSO y VISO convierten un error RPC en `false`;
- ANIMA convierte cada error en `false` y un fallo general en un mapa vacío;
- los guards consultados fusionan error y resultado negativo como no acceso o
  no permiso;
- varios guards exponen la clave normalizada en parámetros de navegación;
- SHELL trata falta de configuración como login y puede borrar cookies ante
  una excepción de Auth.

---

#### 35. `AUTHORIZATION-TECHNICAL-PHYSICAL-RECONCILIATION-001`

|    # | Brecha física                                                                                                           | Estado                               | Riesgo                                                              | Destino exacto                                                                               |
| ---: | ----------------------------------------------------------------------------------------------------------------------- | ------------------------------------ | ------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
|    1 | cinco evaluadores `has_*` retornan un booleano sin variante técnica                                                     | `BLOQUEADO`                          | error, deny, ausencia y contexto inválido son indistinguibles       | `AUTH-CTX-026`; `AUTH-DB-034`; `SHELL-AUTH-001`; `SHELL-AUTH-002`                            |
|    2 | los resolvers de contexto exponen `can_operate` y razones sin estado de fuente                                          | `BLOQUEADO`                          | un fallo de resolución puede parecer contexto negativo válido       | `AUTH-CTX-025`; `AUTH-DB-033`; `SHELL-CTX-001`; `SHELL-CTX-002`                              |
|    3 | ocho funciones carecen de handler contractual y de estado técnico discriminado                                          | `PENDIENTE_DE_IMPLEMENTACION`        | excepción sin envelope, decisión parcial o causa perdida            | `AUTH-DB-033`; `AUTH-DB-034`; `AUTH-DB-027`                                                  |
|    4 | dos funciones relevantes continúan ejecutables por `anon` y `PUBLIC`                                                    | `PENDIENTE_DE_REVISION_DE_SEGURIDAD` | superficie no gobernada y enumeración de comportamiento             | `AUTH-DB-004`; `AUTH-DB-034`; `SHELL-AUTH-004`                                               |
|    5 | helpers de NEXO, FOGO, ORIGO, PULSO y VISO convierten error RPC y deny en `false`                                       | `BLOQUEADO`                          | mensaje equivocado, métrica falsa y recuperación incorrecta         | `SHELL-AUTH-001`; `SHELL-AUTH-002`; `SHELL-AUTH-005`                                         |
|    6 | ANIMA reduce errores individuales y globales a permisos falsos o mapa vacío                                             | `BLOQUEADO`                          | interfaz oculta indisponibilidad como falta de acceso               | `SHELL-AUTH-001`; `SHELL-AUTH-005`; `SHELL-CI-016`                                           |
|    7 | cinco guards server-side fusionan error y resultado negativo                                                            | `BLOQUEADO`                          | redirección de no acceso ante dependencia caída                     | `SHELL-AUTH-002`; `SHELL-AUTH-003`; `SHELL-AUTH-005`                                         |
|    8 | varios guards incluyen la clave de permiso en parámetros de navegación                                                  | `PENDIENTE_DE_CORRECCION`            | enumeración y exposición innecesaria de capacidades                 | `AUTH-CTX-024`; `SHELL-AUTH-004`; `SHELL-AUTH-005`                                           |
|    9 | SHELL redirige falta de configuración técnica a login                                                                   | `BLOQUEADO`                          | login loop y falsa pérdida de sesión                                | `SHELL-AUTH-002`; `SHELL-AUTH-003`; `AUTH-ERR-020`                                           |
|   10 | SHELL limpia cookies ante una excepción de Auth no clasificada                                                          | `BLOQUEADO`                          | sesión válida destruida por indisponibilidad temporal               | `SHELL-AUTH-002`; `SHELL-AUTH-004`; `SHELL-CI-019`                                           |
|   11 | RLS y Data API no disponen de una explicación autoritativa diferenciada por sí solas                                    | `PENDIENTE_DE_IMPLEMENTACION`        | cero filas tratado como deny, ausencia o éxito vacío                | `AUTH-DB-021`; `AUTH-DB-027`; `AUTH-DB-034`                                                  |
|   12 | no existe una unión compartida `DECIDED \| TECHNICAL_FAILURE`                                                           | `PENDIENTE_DE_IMPLEMENTACION`        | cada consumidor inventa fallback y semántica                        | `AUTH-CTX-026`; `AUTH-ERR-020`; `SHELL-AUTH-001`; `SHELL-AUTH-002`                           |
|   13 | denegaciones y fallos técnicos no tienen streams métricos y auditorías claramente separados                             | `PENDIENTE_DE_IMPLEMENTACION`        | tasa de deny contaminada, alertas equivocadas y atribución al actor | `AUTH-CTX-024`; `AUTH-DB-032`; `AUTH-DB-034`; `SHELL-CI-019`                                 |
|   14 | no existe certificación multicanal de timeout, RPC error, 503, retry, sesión, cero efectos y ausencia de decisión falsa | `PENDIENTE_DE_EVIDENCIA`             | regresión silenciosa y adopción parcial                             | `AUTH-CTX-030`; `AUTH-DB-027`; `AUTH-QA-019`; `SHELL-CI-016`; `SHELL-CI-018`; `SHELL-CI-019` |

Ninguna brecha autoriza cambios físicos durante esta tarea documental.

---

#### 36. Invalidación, caché y respuestas tardías

Una evaluación técnica queda invalidada cuando cambia:

- solicitud o consumidor;
- contexto o fingerprint;
- catálogo, schema o hash;
- datasets o resolvers;
- recurso o versión;
- disponibilidad de dependencias;
- versión del evaluador;
- política de retry.

Reglas:

1. un fallo técnico no se cachea como deny;
2. una denegación no se reutiliza como disponibilidad técnica;
3. una respuesta tardía después del 503 se descarta;
4. una recuperación de la fuente exige nueva evaluación;
5. una operación offline no ejecuta por haber vuelto la conectividad;
6. una decisión previa no autoriza otra solicitud;
7. `Retry-After` no reserva autoridad;
8. ningún cache hit omite validación de fingerprint;
9. una versión desconocida no usa “latest” como fallback;
10. un contexto parcial no se convierte en contrato válido.

---

#### 37. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

| ID              | Regla protegida                                                             | Tipo                                       | Prioridad | Momento de implementación               | Destino                                                                      |
| --------------- | --------------------------------------------------------------------------- | ------------------------------------------ | --------- | --------------------------------------- | ---------------------------------------------------------------------------- |
| `TREQ-AUTH-309` | resultado discriminado y prohibición de decisión técnica falsa              | contractual + integración + regresión      | crítica   | implementación del evaluador y SDK      | `AUTH-DB-034`; `SHELL-AUTH-001`; `SHELL-AUTH-002`                            |
| `TREQ-AUTH-310` | estados de fuente y fronteras exactas entre `017`, `018`, `019` y deny      | contractual + disponibilidad + regresión   | crítica   | implementación de resolvers y evaluador | `AUTH-DB-033`; `AUTH-DB-034`; `AUTH-CTX-030`                                 |
| `TREQ-AUTH-311` | cero efectos, ausencia de decisión parcial y frontera post-efecto           | integración + seguridad + transaccional    | crítica   | paquetes que ejecuten mutaciones        | `AUTH-DB-032`; `AUTH-DB-034`; `SHELL-CI-018`                                 |
| `TREQ-AUTH-312` | retry limitado, backoff, idempotencia y solicitud nueva                     | concurrencia + idempotencia + regresión    | crítica   | caché, offline y procesos asíncronos    | `AUTH-CTX-029`; `AUTH-DB-035`; `SHELL-CI-019`                                |
| `TREQ-AUTH-313` | equivalencia en diez canales y tratamiento de RLS cero filas                | integración + RLS + RPC + E2E              | crítica   | adopción multicanal                     | `AUTH-DB-021`; `AUTH-DB-027`; `SHELL-AUTH-005`                               |
| `TREQ-AUTH-314` | equivalencia en diez aplicaciones sin login, cookie clear ni fallback local | aplicación + integración + E2E             | crítica   | migración de consumidores               | `SHELL-AUTH-005`; `SHELL-CI-016`; `SHELL-CI-018`                             |
| `TREQ-AUTH-315` | copy, privacidad, sesión y soporte opaco                                    | experiencia + privacidad + accesibilidad   | alta      | componentes compartidos                 | `AUTH-ERR-020`; `SHELL-AUTH-004`; `SHELL-CI-016`                             |
| `TREQ-AUTH-316` | auditoría y métricas separadas de decision_id                               | auditoría + observabilidad + regresión     | crítica   | persistencia y telemetría               | `AUTH-CTX-024`; `AUTH-DB-032`; `SHELL-CI-019`                                |
| `TREQ-AUTH-317` | persistencia obligatoria y dependencia técnica antes de ejecutar            | integración + transaccional + idempotencia | crítica   | vínculo decisión–ejecución              | `AUTH-DB-032`; `AUTH-DB-034`; `SHELL-CI-018`                                 |
| `TREQ-AUTH-318` | cierre de catorce brechas y certificación transversal                       | seguridad + integración + E2E + regresión  | crítica   | paquete E5 y certificación              | `AUTH-DB-027`; `AUTH-QA-019`; `SHELL-CI-016`; `SHELL-CI-018`; `SHELL-CI-019` |

Los requisitos quedan incorporados en el registro canónico completo. Esta tarea
no implementa las pruebas.

---

#### 38. Estados y evidencia

| Elemento                             | Estado                             |
| ------------------------------------ | ---------------------------------- |
| contrato de indisponibilidad técnica | `ESPECIFICADO`                     |
| unión discriminada                   | `ESPECIFICADO`                     |
| matriz de estados y escenarios       | `ESPECIFICADO`                     |
| matriz de canales                    | `ESPECIFICADO`                     |
| cobertura de aplicaciones            | `ESPECIFICADO`                     |
| snapshot físico de solo lectura      | `PENDIENTE_DE_EVIDENCIA_OPERATIVA` |
| evaluador canónico físico            | `PENDIENTE_DE_IMPLEMENTACION`      |
| SDK compartido                       | `PENDIENTE_DE_IMPLEMENTACION`      |
| envelope `503`                       | `PENDIENTE_DE_IMPLEMENTACION`      |
| telemetría separada                  | `PENDIENTE_DE_IMPLEMENTACION`      |
| manejo de RLS y Data API             | `PENDIENTE_DE_IMPLEMENTACION`      |
| pruebas automatizadas                | `PENDIENTE_DE_IMPLEMENTACION`      |
| pruebas E2E y operativas             | `PENDIENTE_DE_EVIDENCIA`           |

La inspección del estado actual demuestra la brecha, no la conformidad futura.

---

#### 39. Fuera del alcance

AUTH-ERR-019 no:

- implementa el evaluador;
- modifica `FinalDecision`;
- crea una tercera decisión de autorización;
- modifica funciones SQL;
- crea RPC, RLS, triggers, tablas o migraciones;
- modifica Supabase;
- cambia helpers o guards;
- cambia middleware;
- cambia cookies o sesiones;
- implementa telemetría;
- ejecuta reintentos reales;
- simula caídas productivas;
- crea datos operativos de prueba;
- despliega componentes;
- escribe en repositorios remotos;
- certifica comportamiento operativo;
- inicia `AUTH-ERR-020`.

La implementación corresponde exclusivamente a los destinos exactos de la
reconciliación física.

---

#### 40. Criterios de aceptación

- [x] Se definió una denegación como `AuthorizationDecision` completa con outcome `DENY`.
- [x] Se definió un fallo técnico como ausencia de decisión completa.
- [x] Se prohibió fabricar un `DENY` por indisponibilidad.
- [x] Se preservó `FinalDecision = ALLOW | DENY`.
- [x] Se definió la unión `DECIDED | TECHNICAL_FAILURE`.
- [x] Se definió `AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE`.
- [x] Se definió `AUTHORIZATION_EVALUATION_UNAVAILABLE`.
- [x] Se definió `TECHNICAL_UNAVAILABLE`.
- [x] Se definió `503 Service Unavailable`.
- [x] Se definió `evaluation_attempt_id` separado de `decision_id`.
- [x] Se prohibió publicar una decisión candidata descartada.
- [x] Se definieron cuatro estados de fuente.
- [x] Se separó `INVALID` de `UNAVAILABLE`.
- [x] Se separó `AUTH-ERR-017` de `AUTH-ERR-019`.
- [x] Se separó `AUTH-ERR-018` de `AUTH-ERR-019`.
- [x] Se separaron default deny y explicit deny del fallo técnico.
- [x] Se prohibió usar cero filas como explicación suficiente.
- [x] Se definió no aplicabilidad contractual.
- [x] Se definió el efecto de la indisponibilidad sobre las cuatro modalidades.
- [x] Se prohibió omitir un carril aplicable.
- [x] Se definió la frontera transaccional antes de efectos.
- [x] Se excluyeron fallos posteriores con estado incierto.
- [x] Se definió persistencia obligatoria antes de ejecutar.
- [x] Se definieron reintentos internos limitados.
- [x] Se prohibió replay automático después del envelope.
- [x] Se definieron ocho familias privadas.
- [x] Se definió envelope público con `decision_produced=false`.
- [x] Se definieron copy, acciones y accesibilidad.
- [x] Se preservó sesión y se prohibió borrar cookies.
- [x] Se definieron privacidad y minimización.
- [x] Se separaron auditoría técnica y auditoría de decisión.
- [x] Se separaron métricas de failure y deny.
- [x] Se definieron HTTP, caché y `Retry-After`.
- [x] Se definió la frontera de RLS y Data API.
- [x] Se definieron Realtime, offline y procesos asíncronos.
- [x] Se decidieron veinticuatro escenarios.
- [x] Se definieron diez canales equivalentes.
- [x] Se reconciliaron diez aplicaciones.
- [x] Se registró el snapshot físico sin presentarlo como conformidad.
- [x] Se registraron catorce brechas con destino exacto.
- [x] Se derivaron `TREQ-AUTH-309` a `TREQ-AUTH-318`.
- [x] No se modificó código, Supabase, migraciones, configuración, datos ni aplicaciones.
- [x] `AUTH-ERR-020` permanece únicamente reservada.

---

#### 41. Riesgos controlados

| Riesgo                                                  | Control                                      |
| ------------------------------------------------------- | -------------------------------------------- |
| error RPC tratado como deny                             | unión discriminada                           |
| timeout tratado como falta de permiso                   | estado `UNAVAILABLE`                         |
| contradicción tratada como caída                        | estado `INVALID`                             |
| permiso ausente tratado como red caída                  | lectura concluyente exigida                  |
| decisión parcial serializada                            | contrato completo o failure                  |
| `decision_id` técnico reutilizado                       | `evaluation_attempt_id` separado             |
| `BASE_OR_OPERATIONAL` autoriza con evidencia incompleta | fuentes obligatorias de ambos carriles       |
| RLS cero filas recibe causa inventada                   | preflight autoritativo                       |
| falla técnica cierra sesión                             | sesión preservada                            |
| excepción Auth borra cookies                            | prohibición contractual                      |
| retry duplica mutación                                  | nueva intención e idempotencia no completada |
| telemetría contamina deny rate                          | streams métricos separados                   |
| error posterior oculta estado incierto                  | frontera transaccional                       |
| detalle técnico filtra arquitectura                     | soporte opaco y causa privada                |
| canal local cambia semántica                            | matriz de diez canales                       |
| aplicación inventa fallback                             | cobertura de diez aplicaciones               |

---

#### 42. Cierre de tarea y continuidad

**ÚLTIMA TAREA APROBADA**

`AUTH-ERR-018 — Permiso no registrado`

**TAREA ACTUAL APROBADA**

`AUTH-ERR-019 — Diferenciar error técnico y denegación`

**SIGUIENTE TAREA RESERVADA**

`AUTH-ERR-020 — Compartir mensajes desde vento-shell`


### ✅ AUTH-ERR-020 — Compartir mensajes desde vento-shell

**Estado:** APROBADA
**Tarea anterior:** `AUTH-ERR-019 — Diferenciar error técnico y denegación` — APROBADA
**Tarea siguiente:** `NEXO-DOM-001 — Clasificar consumibles, stock por cantidad, reutilizables, activos serializados, repuestos, kits y contenedores` — RESERVADA
**Tipo de tarea:** documental; definición contractual, materialización del catálogo de mensajes de autorización, distribución compartida, perfiles de presentación, localización, seguridad, adopción multicanal y reconciliación física desde `vento-shell`
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/S_MENSAJES_BLOQUEO/03_CONFIGURACION_ERRORES_Y_DISTRIBUCION.md`
**Artefactos producidos:** `AUTHORIZATION-MESSAGE-CATALOG-001`, `AUTHORIZATION-MESSAGE-DISTRIBUTION-CONTRACT-001`, `AUTHORIZATION-MESSAGE-PRESENTATION-PROFILE-REGISTER-001`, `AUTHORIZATION-MESSAGE-CONSUMER-CHANNEL-MATRIX-001` y `AUTHORIZATION-MESSAGE-PHYSICAL-RECONCILIATION-001`
**Cambios físicos autorizados:** ninguno; no crea paquetes, código, componentes, schemas, migraciones, tablas, funciones, RLS, datos, releases, despliegues ni modificaciones en repositorios consumidores

---

#### 1. Propósito

Definir de forma única, completa y verificable cómo Vento OS comparte desde
`vento-shell` los códigos, textos, perfiles, acciones y metadatos públicos de
los bloqueos de autorización aprobados en `AUTH-ERR-001` a `AUTH-ERR-019`.

La regla raíz queda:

```text
REASON_CODE CANÓNICO
+
VARIANTE DE PRESENTACIÓN APROBADA
+
LOCALE SOPORTADO
+
CANAL
→
MENSAJE COMPARTIDO VERSIONADO
+
ACCIONES SEGURAS
+
MISMA SEMÁNTICA EN TODAS LAS APLICACIONES
```

```text
APLICACIÓN CONSUMIDORA
NO DEFINE
CÓDIGO, COPY, RECUPERACIÓN, PRIVACIDAD O PRECEDENCIA LOCAL
```

La tarea elimina como diseño permitido:

- mensajes libres por aplicación;
- títulos genéricos como sustituto de una razón canónica;
- códigos locales transportados en query string;
- exposición del permiso, ruta, rol o causa interna;
- copy derivado de excepciones, SQL o mensajes de Supabase;
- divergencia entre navegador, API, RPC, RLS, Realtime, offline y workers;
- correcciones silenciosas de texto desde cada repositorio consumidor.

---

#### 2. Resultado material

Se aprueban cinco artefactos documentales completos:

1. `AUTHORIZATION-MESSAGE-CATALOG-001`, que materializa las veinte
   identidades públicas aprobadas y sus textos, acciones, confirmaciones y
   límites de exposición;
2. `AUTHORIZATION-MESSAGE-DISTRIBUTION-CONTRACT-001`, que fija propiedad,
   módulos, publicación, versionado, inmutabilidad, compatibilidad y consumo;
3. `AUTHORIZATION-MESSAGE-PRESENTATION-PROFILE-REGISTER-001`, que materializa
   veinticinco perfiles de presentación sin inventar copy donde una tarea
   anterior no lo aprobó;
4. `AUTHORIZATION-MESSAGE-CONSUMER-CHANNEL-MATRIX-001`, que decide diez canales
   y diez aplicaciones con una semántica equivalente;
6. `AUTHORIZATION-MESSAGE-PHYSICAL-RECONCILIATION-001`, que registra el estado
   físico observado y dieciséis brechas con destino canónico exacto.

Cobertura materializada:

| Elemento                                                 |   Cantidad |
| -------------------------------------------------------- | ---------: |
| Tareas de bloqueo consumidas                             |         19 |
| `reason_code` públicos únicos                            |         20 |
| Perfiles de presentación                                 |         25 |
| Estados interactivos auxiliares excluidos                |          2 |
| Locale fuente aprobado                                   | 1, `es-CO` |
| Familias de paquete con responsabilidad explícita        |          3 |
| Canales con decisión explícita                           |         10 |
| Aplicaciones canónicas reconciliadas                     |         10 |
| Páginas físicas `no-access` inspeccionadas               |          5 |
| Páginas inspeccionadas con copy local divergente         |          5 |
| Páginas inspeccionadas que exponen la ruta solicitada    |          4 |
| Páginas inspeccionadas que exponen el permiso solicitado |          2 |
| Workspace compartido de autorización existente           | 1, parcial |
| Paquetes físicos `@vento/contracts` observados           |          0 |
| Paquetes físicos `@vento/ui-web` observados              |          0 |
| Brechas físicas registradas                              |         16 |
| Requisitos de prueba derivados                           |         13 |

Las cifras físicas describen el corte inspeccionado. No certifican adopción,
publicación, paridad ni ejecución operativa.

---

#### 3. Decisión principal y propiedad

La fuente canónica de mensajes de autorización será propiedad de
`vento-shell` y se distribuirá por responsabilidades separadas:

```text
@vento/contracts/authorization
→ reason codes
→ message catalog
→ presentation profiles
→ schemas y tipos derivados
→ versiones y fingerprints

@vento/os-context
→ resolución de reason code
→ selección de perfil
→ selección de locale
→ proyección segura por canal
→ adapters de compatibilidad temporal

@vento/ui-web
→ componentes accesibles
→ layout de bloqueo
→ acciones seguras
→ estados recuperables
→ presentación visual sin decidir autorización
```

Supabase, cada aplicación y cada componente no serán propietarios alternativos
del copy.

La distribución física futura conservará el mecanismo aprobado de paquetes npm
privados e inmutables publicados desde `vento-shell`. Esta tarea define el
contenido contractual; no crea ni publica paquetes.

---

#### 4. Alcance exacto

AUTH-ERR-020 decide:

1. la identidad del catálogo;
2. el locale fuente;
3. los veinte códigos públicos incluidos;
4. los veinticinco perfiles de presentación;
5. los dos estados interactivos auxiliares excluidos y sus propietarios;
5. el modelo de campos obligatorios, opcionales y prohibidos;
7. la propiedad de cada módulo compartido;
8. el algoritmo de resolución;
9. las reglas de fallback;
10. la inmutabilidad y el versionado;
11. la separación entre respuesta pública y evidencia privada;
12. la equivalencia entre canales;
13. la cobertura de las diez aplicaciones;
14. los límites de las acciones de recuperación;
15. la estrategia de adopción y rollback;
16. las brechas físicas y sus destinos exactos.

No decide:

- el estilo visual final de cada componente;
- el proveedor definitivo del registry;
- la creación física de los paquetes;
- la implementación de adapters;
- la migración de consumidores;
- la instrumentación de métricas;
- la implementación del evaluador;
- el contenido de errores funcionales ajenos a autorización;
- traducciones adicionales a `es-CO`;
- cambios en los códigos o copy ya aprobados.

---

#### 5. Identidad del catálogo

Se congela:

```text
catalog_id = vento.authorization.messages
catalog_version = 1.0.0
schema_version = 1.0.0
source_locale = es-CO
reason_count = 20
presentation_profile_count = 25
auxiliary_interaction_state_count = 2
```

Una publicación física deberá conservar:

- versión semántica exacta;
- hash del contenido canónico;
- commit fuente;
- fecha de construcción;
- schema compatible;
- lista completa de perfiles;
- orden determinista;
- ausencia de claves duplicadas;
- procedencia desde `vento-shell`.

No se aceptan como versión:

```text
latest
main
current
production
unknown
```

---

#### 6. Contrato lógico de mensaje

Forma conceptual:

```ts
type AuthorizationMessageDescriptor = {
  catalog_id: "vento.authorization.messages";
  catalog_version: "1.0.0";
  schema_version: "1.0.0";
  source_locale: "es-CO";
  reason_code: AuthorizationReasonCode;
  profile_key: string;
  title: string | null;
  message: string;
  help_text: string | null;
  effects_confirmation: string | null;
  primary_action_label: string | null;
  secondary_action_label: string | null;
  support_action_label: string | null;
  conditional_action_labels: string[];
  public_code_visible: boolean;
  session_preserved: boolean;
  executable: false;
  retryable: boolean;
  privacy_class: "PUBLIC_SAFE";
};
```

El contrato no contiene:

- permiso exacto;
- ruta solicitada;
- rol;
- grant o deny;
- sede o área;
- identificador del recurso;
- causa interna;
- tabla, función, policy o SQL;
- stack trace;
- token, cookie o secreto;
- nombres personales;
- instrucciones administrativas no aprobadas.

---

#### 7. `AuthorizationReasonCode`

La unión cerrada será:

```text
AUTH_NO_SESSION
AUTH_USER_INACTIVE
AUTH_APP_ACCESS_DENIED
AUTH_ADMIN_PERMISSION_DENIED
AUTH_OPERATIONAL_PERMISSION_DENIED
AUTH_SITE_ASSIGNMENT_REQUIRED
AUTH_ACTIVE_SITE_REQUIRED
AUTH_AREA_ASSIGNMENT_REQUIRED
AUTH_ACTIVE_AREA_REQUIRED
AUTH_PUBLISHED_SHIFT_REQUIRED
AUTH_OUTSIDE_SHIFT_WINDOW
AUTH_CHECKIN_REQUIRED
AUTH_OPERATIONAL_ROLE_REQUIRED
AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE
AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA
AUTH_SHARED_DEVICE_NOT_AUTHORIZED
AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION
AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT
AUTH_PERMISSION_NOT_REGISTERED
AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE
```

Reglas:

1. cada código aparece exactamente una vez en el índice de razones;
2. un código puede tener uno o más perfiles;
3. ningún consumidor agrega códigos locales a esta unión;
4. un código desconocido no se convierte en el mensaje de otro bloqueo;
5. la ausencia del código esperado se trata como incompatibilidad contractual;
6. los códigos no se traducen ni se normalizan;
7. el copy no se usa como identidad.

---

#### 8. Fuente de verdad e inmutabilidad

La fuente de verdad será el artefacto versionado construido desde
`vento-shell`.

```text
DOCUMENTACIÓN APROBADA
→ CATÁLOGO FUENTE
→ VALIDACIÓN
→ BUILD INMUTABLE
→ PAQUETE VERSIONADO
→ LOCKFILE DEL CONSUMIDOR
```

No serán fuentes autoritativas independientes:

- una tabla mutable de copy;
- una variable de entorno;
- un archivo copiado a una aplicación;
- una página `no-access`;
- un guard;
- una query string;
- un mensaje de excepción;
- un diccionario local;
- una traducción del navegador;
- una respuesta de IA;
- un texto recibido desde el cliente.

Una versión publicada no se modifica in-place. Cualquier cambio de texto,
acción, semántica o perfil exige nueva versión, changelog y pruebas de
compatibilidad.

---

#### 9. Localización y fallback

El locale fuente inicial es:

```text
es-CO
```

Reglas:

1. `es-CO` siempre debe estar completo;
2. un locale adicional deberá cubrir las veinticinco claves de perfil;
3. una traducción no cambia `reason_code`, estado, decisión, HTTP, acción
   permitida ni privacidad;
4. si el locale solicitado no existe, se usa `es-CO` de la misma versión;
5. si el perfil solicitado no existe en `es-CO`, no se inventa copy;
6. ante incompatibilidad de versión se usa una superficie técnica segura con
   código de soporte, no una denegación falsa;
7. el cliente no mezcla cadenas de versiones distintas;
8. números, fechas y nombres no se insertan salvo parámetros explícitamente
   aprobados; la versión inicial no define interpolaciones públicas.

---

#### 10. Perfiles y selección determinista

La identidad de un perfil se deriva de:

```text
reason_code + "/" + variant
```

La variante predeterminada es:

```text
default
```

Algoritmo:

```text
1. validar catalog_version
2. validar reason_code
3. resolver variant permitida por la decisión
4. resolver locale exacto o fallback es-CO
5. proyectar campos permitidos por canal
6. validar acciones contra el estado real
7. renderizar o serializar
```

La aplicación no selecciona una variante para cambiar la causa. La variante
procede de hechos ya resueltos y solo modifica presentación o recuperación
aprobada.

---

#### 11. Campos opcionales y ausencia explícita

`title`, `help_text`, confirmación y etiquetas de acción pueden ser `null`
cuando la tarea propietaria anterior no aprobó un texto exacto.

Regla obligatoria:

```text
CAMPO NO APROBADO
→ null
→ NO INVENTAR COPY LOCAL
```

Un canal visual podrá usar estructura accesible sin título textual adicional,
pero no fabricará un título semántico. Una acción de navegación genérica solo
podrá mostrarse cuando el contrato del canal ya la autorice y no se presentará
como parte del copy canónico ausente.

---

#### 12. Acciones y recuperación

Las etiquetas aprobadas describen acciones de presentación. No conceden
capacidad empresarial ni autorizan ejecutar la operación bloqueada.

Reglas:

1. la acción principal no repite una mutación;
2. cualquier reintento crea una solicitud nueva y reevalúa autorización;
3. `Cerrar sesión` solo aparece cuando fue aprobado y nunca se ejecuta
   automáticamente;
4. `Volver` o `Volver a Vento OS` no transportan body, secretos ni recurso;
5. acciones condicionales solo aparecen con evidencia server-side suficiente;
6. un dispositivo no ofrece usar cuenta ajena;
7. una pantalla de bloqueo no crea permisos, asignaciones, turnos o check-ins;
8. copiar soporte solo copia un código opaco;
9. una etiqueta no sustituye la autorización de la ruta destino;
10. el consumidor no cambia la recuperación por conveniencia local.

---

#### 13. Separación pública y privada

La respuesta pública consume únicamente:

- `reason_code`;
- perfil seguro;
- locale;
- textos aprobados;
- acciones aprobadas;
- código de soporte opaco cuando corresponda;
- flags públicos de ejecución, retry y sesión.

La evidencia privada podrá conservar, con minimización:

- causa interna;
- operación propietaria;
- permiso y recurso;
- actor y principal;
- contexto y fingerprints;
- versiones;
- consumidor;
- canal;
- correlación;
- resultado técnico.

La evidencia privada nunca se serializa dentro del descriptor público.

---

#### 14. Privacidad y prevención de enumeración

El catálogo compartido no permitirá que un cliente ordinario descubra:

- permisos existentes o ausentes;
- roles con acceso;
- sedes o áreas candidatas;
- rutas protegidas;
- recursos existentes;
- configuración del dispositivo;
- versiones internas completas;
- reglas de precedencia;
- proveedores o infraestructura;
- causas disciplinarias;
- actores o identidades de terceros.

Las páginas no mostrarán `returnTo`, `permission` ni `reason` libre como
información de diagnóstico. Un estado de retorno seguro será opaco y validado.

---

#### 15. Accesibilidad

Todo renderer compartido deberá:

- mover el foco al resumen del bloqueo;
- anunciar título cuando exista, mensaje, confirmación y recuperación;
- mantener orden lógico de acciones;
- no depender únicamente de color, icono o animación;
- impedir trampas de foco;
- permitir copiar el código de soporte mediante teclado;
- conservar zoom, contraste y lectura por tecnología asistiva;
- no ocultar el mensaje detrás de un toast efímero;
- informar explícitamente cero cambios cuando el perfil lo declare;
- mantener el indicador de simulación o dispositivo cuando el contrato lo
  exija sin revelar datos internos.

---

#### 16. Resolución por canal

El catálogo no obliga a renderizar HTML. Cada canal proyecta la misma
semántica:

```text
VISUAL
→ textos y acciones aprobadas

NO VISUAL
→ reason_code + message_code/perfil + flags + correlación

RLS/DATA API
→ deny técnico o cero filas
+
adapter autoritativo separado para la razón pública
```

Un canal no visual puede omitir etiquetas humanas, pero no cambiar el código,
la decisión, la recuperabilidad o la confirmación de efectos.

---

#### 17. Compatibilidad y fallo cerrado

Estados de consumo:

| Estado                           | Resultado                                                             |
| -------------------------------- | --------------------------------------------------------------------- |
| catálogo y schema compatibles    | resolver perfil exacto                                                |
| reason conocido, variant ausente | incompatibilidad; no inventar variant                                 |
| reason desconocido               | incompatibilidad; no mapear a otro bloqueo                            |
| locale ausente                   | fallback a `es-CO` de la misma versión                                |
| hash inválido                    | fallo técnico; no usar contenido                                      |
| versión no soportada             | fallo técnico; no mezclar versiones                                   |
| descriptor incompleto            | configuración inconsistente o fallo técnico según lectura concluyente |
| paquete no disponible            | conservar sesión, cero efectos y tratar como indisponibilidad técnica |

Queda prohibido usar un mensaje genérico de “No tienes permisos” para ocultar
una incompatibilidad del catálogo.

---

#### 18. Completitud del índice

`AUTHORIZATION-MESSAGE-CATALOG-001` deberá validar:

```text
reason_codes esperados = 20
reason_codes materializados = 20
faltantes = 0
duplicados = 0
perfiles esperados = 25
perfiles materializados = 25
faltantes = 0
duplicados = 0
```

Las razones con perfil único conservan `default`. `AUTH_USER_INACTIVE` conserva
perfiles laboral y cliente. `AUTH_SHARED_DEVICE_NOT_AUTHORIZED` conserva cinco
perfiles de presentación. `AUTH_OPERATIONAL_PERMISSION_DENIED` conserva un
perfil propio y no reutiliza el copy administrativo.

---

#### 19. `AUXILIARY-AUTH-STATE-EXCLUSION-REGISTER-001`

Los estados siguientes no son denegaciones ni fallos de autorización y quedan
fuera de `AuthorizationReasonCode`:

| Estado                             | Semántica                                                                               | Catálogo propietario                                  | Tareas de implementación                                         |
| ---------------------------------- | --------------------------------------------------------------------------------------- | ----------------------------------------------------- | ---------------------------------------------------------------- |
| `ACTOR_IDENTIFICATION_REQUIRED`    | dispositivo autorizado todavía no tiene actor humano atribuible                         | catálogo compartido de estados interactivos de sesión | `AUTH-DEV-007`; `AUTH-DEV-012`; `SHELL-AUTH-002`; `SHELL-UI-016` |
| `STRONG_REAUTHENTICATION_REQUIRED` | actor y dispositivo son válidos, pero una acción fuerte exige evidencia personal fresca | catálogo compartido de reautenticación                | `AUTH-DEV-014`; `SHELL-AUTH-002`; `SHELL-UI-016`                 |

Reglas:

1. no se mapean a `AUTH_SHARED_DEVICE_NOT_AUTHORIZED`;
2. no se cuentan dentro de los veinte reason codes;
3. no usan el catálogo de bloqueos como sustituto de su flujo interactivo;
4. completar el flujo crea una solicitud nueva;
5. la ausencia de implementación física se conserva como brecha, no como copy local.

---

#### 20. `AUTHORIZATION-MESSAGE-PRESENTATION-PROFILE-REGISTER-001` — perfiles 001 a 008

|    # | Profile key                                  | Título                                            | Mensaje                                                                                                                                         | Acción principal    | Acción secundaria / ayuda                        |
| ---: | -------------------------------------------- | ------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | ------------------- | ------------------------------------------------ |
|    1 | `AUTH_NO_SESSION/default`                    | `Inicia sesión para continuar`                    | `Tu sesión no está disponible o dejó de ser válida. Inicia sesión nuevamente para volver a la aplicación.`                                      | `Iniciar sesión`    | `Volver a Vento OS`                              |
|    2 | `AUTH_USER_INACTIVE/employee`                | `Tu acceso está inactivo`                         | `Tu identidad para esta aplicación está inactiva. No puedes continuar mientras permanezca en este estado.`                                      | `Cerrar sesión`     | `Volver a Vento OS`; ayuda aprobada              |
|    3 | `AUTH_USER_INACTIVE/customer`                | `Tu acceso está inactivo`                         | `Tu perfil de cliente está inactivo. No puedes continuar mientras permanezca en este estado.`                                                   | `Cerrar sesión`     | ayuda aprobada                                   |
|    4 | `AUTH_APP_ACCESS_DENIED/default`             | `No tienes acceso a esta aplicación`              | `Tu sesión está activa, pero esta aplicación no está habilitada para tu cuenta.`                                                                | `Volver a Vento OS` | `Cerrar sesión`                                  |
|    5 | `AUTH_ADMIN_PERMISSION_DENIED/default`       | `No tienes permiso para realizar esta acción`     | `Tu cuenta puede usar esta aplicación, pero no tiene el permiso administrativo necesario para completar esta acción.`                           | `Volver`            | `Volver a Vento OS`                              |
|    6 | `AUTH_OPERATIONAL_PERMISSION_DENIED/default` | `No tienes permiso para completar esta operación` | `Tu sesión y contexto operativo están activos, pero no tienes la autorización operativa necesaria para completar esta acción.`                  | `Volver`            | `Volver a Vento OS`                              |
|    7 | `AUTH_SITE_ASSIGNMENT_REQUIRED/default`      | `Necesitas una sede asignada`                     | `Tu perfil laboral no tiene una sede asignada para continuar con esta acción. Solicita a un administrador autorizado que revise tu asignación.` | `Volver a Vento OS` | `Ir al inicio de la aplicación`; ayuda aprobada  |
|    8 | `AUTH_ACTIVE_SITE_REQUIRED/default`          | `No hay una sede activa disponible`               | `Tu sesión está activa, pero esta acción requiere una sede activa y no hay una disponible para el contexto actual.`                             | `Volver a Vento OS` | `Cerrar sesión`; condicional: `Elegir otra sede` |

Las ayudas de identidad inactiva y sede asignada conservan exactamente el copy
de sus tareas propietarias. `Elegir otra sede` solo existe con alternativa
activa, autorizada y segura demostrada por servidor.

---

#### 21. `AUTHORIZATION-MESSAGE-PRESENTATION-PROFILE-REGISTER-001` — perfiles 009 a 015

|    # | Profile key                                      | Título                                        | Mensaje                                                                                                                                                             | Acción principal    | Acción secundaria / ayuda                                                        |
| ---: | ------------------------------------------------ | --------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------- | -------------------------------------------------------------------------------- |
|    9 | `AUTH_AREA_ASSIGNMENT_REQUIRED/default`          | `No tienes un área asignada para esta acción` | `Tu cuenta puede usar esta aplicación, pero necesita una asignación de área compatible para completar esta acción.`                                                 | `Volver`            | `Volver a Vento OS`                                                              |
|   10 | `AUTH_ACTIVE_AREA_REQUIRED/default`              | `Necesitas un área activa`                    | `No hay un área activa y compatible disponible para continuar con esta acción. Solicita a un administrador autorizado que revise la configuración correspondiente.` | `Volver a Vento OS` | `Ir al inicio de la aplicación`; ayuda aprobada; condicional: `Elegir otra área` |
|   11 | `AUTH_PUBLISHED_SHIFT_REQUIRED/default`          | `Necesitas un turno publicado`                | `No tienes un turno laboral publicado disponible para continuar con esta acción. Solicita a un administrador autorizado que revise tu programación.`                | `Volver a Vento OS` | `Ir al inicio de la aplicación`; ayuda aprobada                                  |
|   12 | `AUTH_OUTSIDE_SHIFT_WINDOW/default`              | `No estás dentro de tu turno`                 | `Tienes un turno publicado, pero no está vigente en este momento. Revisa tu horario antes de continuar.`                                                            | `Ver mi horario`    | `Volver a Vento OS`                                                              |
|   13 | `AUTH_CHECKIN_REQUIRED/default`                  | `Check-in requerido`                          | `Registra tu entrada para continuar con esta operación.`                                                                                                            | `Registrar entrada` | `Volver a una vista disponible` cuando exista una superficie autorizada          |
|   14 | `AUTH_OPERATIONAL_ROLE_REQUIRED/default`         | `null`                                        | `Tu turno no tiene un rol operativo asignado. Solicita que lo corrijan para continuar.`                                                                             | `null`              | `null`                                                                           |
|   15 | `AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE/default` | `null`                                        | `Tu rol operativo no está habilitado para esta sede. Solicita que revisen tu turno para continuar.`                                                                 | `null`              | `null`                                                                           |

Los campos `null` son deliberados. Ninguna aplicación podrá completarlos por
inferencia.

---

#### 22. `AUTHORIZATION-MESSAGE-PRESENTATION-PROFILE-REGISTER-001` — perfiles 016 a 025

|    # | Profile key                                              | Título                                                   | Mensaje                                                                                                                                               | Acción principal                                 | Acción secundaria / confirmación                                                        |
| ---: | -------------------------------------------------------- | -------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------ | --------------------------------------------------------------------------------------- |
|   16 | `AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA/default`         | `null`                                                   | `Tu rol operativo no está habilitado para esta área. Solicita que revisen tu turno para continuar.`                                                   | `null`                                           | `null`                                                                                  |
|   17 | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED/default`              | `null`                                                   | mensaje base exacto definido debajo                                                                                                                   | `null`                                           | confirmar que no se realizaron cambios                                                  |
|   18 | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED/personal_session`     | `Esta operación requiere una sesión personal`            | mensaje base del código                                                                                                                               | `Iniciar sesión de forma personal`               | —                                                                                       |
|   19 | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED/device_unavailable`   | `Este dispositivo no está disponible para operar`        | mensaje base del código                                                                                                                               | `Usar otro dispositivo`                          | —                                                                                       |
|   20 | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED/configuration_review` | `Este dispositivo necesita una revisión`                 | mensaje base del código                                                                                                                               | `Solicitar revisión`                             | —                                                                                       |
|   21 | `AUTH_SHARED_DEVICE_NOT_AUTHORIZED/app_unavailable`      | `Esta aplicación no está disponible en este dispositivo` | mensaje base del código                                                                                                                               | `Volver a las aplicaciones permitidas`           | —                                                                                       |
|   22 | `AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION/default`          | `null`                                                   | `Esta acción no puede ejecutarse durante una simulación. Sal de la simulación y abre la operación real para continuar.`                               | `Salir de simulación`                            | `Abrir operación real` cuando exista ruta conocida; `No se realizó ningún cambio real.` |
|   23 | `AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT/default` | `No pudimos validar la configuración`                    | `La configuración necesaria para autorizar esta acción es inconsistente. Solicita una revisión administrativa antes de continuar.`                    | `Volver`                                         | condicional: `Solicitar revisión` solo con canal autorizado y funcional                 |
|   24 | `AUTH_PERMISSION_NOT_REGISTERED/default`                 | `Esta función no está disponible`                        | `La función solicitada no está registrada en Vento OS. Informa el código de soporte para que revisen la configuración.`                               | `Copiar código de soporte`                       | `Volver`; `No se realizó ningún cambio.`                                                |
|   25 | `AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE/default`      | `No pudimos verificar el acceso`                         | `Ocurrió un problema técnico al verificar tu acceso. No se realizó ningún cambio. Intenta nuevamente en unos minutos o informa el código de soporte.` | `Intentar de nuevo` solo cuando `retryable=true` | `Copiar código de soporte`; `Volver`; `No se realizó ningún cambio.`                    |

El mensaje base exacto de los perfiles 17 a 21 es:

```text
Este dispositivo no está autorizado para esta operación.
Usa un dispositivo permitido o inicia sesión de forma personal.
```

Los perfiles 18 a 21 no sustituyen el mensaje base. Solo fijan un título y una
acción permitidos para una recuperación segura ya demostrada.

---

#### 23. Matriz de identidad, decisión y estado

| Reason code                                      | Resultado contractual             | HTTP no navegacional | Sesión                             | Retry automático                                      |
| ------------------------------------------------ | --------------------------------- | -------------------: | ---------------------------------- | ----------------------------------------------------- |
| `AUTH_NO_SESSION`                                | `DENY` de autenticación           |                  401 | no disponible                      | no                                                    |
| `AUTH_USER_INACTIVE`                             | `DENY`                            |                  403 | conservada hasta acción voluntaria | no                                                    |
| `AUTH_APP_ACCESS_DENIED`                         | `DENY`                            |                  403 | preservada                         | no                                                    |
| `AUTH_ADMIN_PERMISSION_DENIED`                   | `DENY`                            |                  403 | preservada                         | no                                                    |
| `AUTH_OPERATIONAL_PERMISSION_DENIED`             | `DENY`                            |                  403 | preservada                         | no                                                    |
| `AUTH_SITE_ASSIGNMENT_REQUIRED`                  | `DENY`                            |                  403 | preservada                         | no                                                    |
| `AUTH_ACTIVE_SITE_REQUIRED`                      | `DENY`                            |                  403 | preservada                         | no                                                    |
| `AUTH_AREA_ASSIGNMENT_REQUIRED`                  | `DENY`                            |                  403 | preservada                         | no                                                    |
| `AUTH_ACTIVE_AREA_REQUIRED`                      | `DENY`                            |                  403 | preservada                         | no                                                    |
| `AUTH_PUBLISHED_SHIFT_REQUIRED`                  | `DENY`                            |                  403 | preservada                         | no                                                    |
| `AUTH_OUTSIDE_SHIFT_WINDOW`                      | `DENY`                            |                  403 | preservada                         | no                                                    |
| `AUTH_CHECKIN_REQUIRED`                          | `DENY`                            |                  403 | preservada                         | no                                                    |
| `AUTH_OPERATIONAL_ROLE_REQUIRED`                 | `DENY`                            |                  403 | preservada                         | no                                                    |
| `AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE`         | `DENY`                            |                  403 | preservada                         | no                                                    |
| `AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA`         | `DENY`                            |                  403 | preservada                         | no                                                    |
| `AUTH_SHARED_DEVICE_NOT_AUTHORIZED`              | `DENY`                            |                  403 | preservada según principal         | no                                                    |
| `AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION`          | `DENY` de ejecución real          |                  403 | real preservada                    | no                                                    |
| `AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT` | `DENY` estructural                |                  409 | preservada                         | no                                                    |
| `AUTH_PERMISSION_NOT_REGISTERED`                 | `DENY` estructural                |                  500 | preservada                         | no                                                    |
| `AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE`      | `TECHNICAL_FAILURE`, sin decisión |                  503 | preservada                         | solo retry interno limitado; nunca replay de mutación |

El catálogo de mensajes no recalcula estos valores. Los consume del contrato de
la razón y los valida por consistencia.

---

#### 24. Exactitud del copy

Cada cadena de `es-CO` deberá coincidir byte a byte con el texto aprobado,
salvo normalización canónica de fin de línea y Unicode definida por el build.

Queda prohibido:

- corregir estilo o puntuación por aplicación;
- reemplazar `Vento OS` por el nombre del módulo;
- agregar el permiso o la ruta;
- abreviar por tamaño de pantalla;
- cambiar “sesión” por “usuario”;
- cambiar un error técnico por “sin permisos”;
- cambiar una falta contextual por “acceso denegado”;
- cambiar una confirmación de cero efectos;
- ocultar ayuda o soporte requeridos;
- traducir mediante un servicio en runtime.

Una variante de tono o longitud futura requiere perfil explícito y versión
nueva; no puede surgir localmente.

---

#### 25. Parámetros e interpolación

La versión `1.0.0` no autoriza interpolaciones públicas de:

- nombres;
- correo;
- rol;
- sede;
- área;
- turno;
- permiso;
- recurso;
- dispositivo;
- horario;
- cantidad de intentos;
- duración estimada;
- nombres de administradores.

Los únicos valores externos admitidos en la superficie son referencias opacas
y separadas del copy, como `support_code` o `correlation_id`, cuando el contrato
los autorice. No se insertan dentro del mensaje principal.

---

#### 26. `AUTHORIZATION-MESSAGE-CONSUMER-CHANNEL-MATRIX-001`

| Canal                                 | Consumo requerido                               | Respuesta pública                              | Prohibiciones                                     |
| ------------------------------------- | ----------------------------------------------- | ---------------------------------------------- | ------------------------------------------------- |
| Launcher y navegación                 | descriptor seguro y estado de retorno opaco     | vista de bloqueo compartida                    | query libre de reason, permiso o ruta; copy local |
| React Server Components               | resolver server-side antes de datos protegidos  | descriptor serializable mínimo                 | hidratar evidencia privada o contenido protegido  |
| Server Actions                        | resultado discriminado del evaluador            | envelope estable; no redirect como única señal | excepción bruta, efecto parcial, copy local       |
| Route Handlers y API                  | adapter compartido                              | JSON tipado con códigos y flags                | HTML inesperado, texto SQL, claves internas       |
| RPC y PostgREST                       | proyección contractual del backend              | decisión o fallo tipado                        | booleano como mensaje, texto libre                |
| RLS y Data API                        | preflight o adapter de servicio                 | razón correlacionable fuera de RLS             | inferir razón solo desde cero filas               |
| Edge Functions                        | paquete compatible y evaluador central          | mismo reason/profile                           | service role como bypass, copy embebido           |
| Realtime                              | razón en cierre o rechazo seguro cuando aplique | no suscribir o retirar entrega                 | mantener stream, filtrar solo en cliente          |
| Offline y caché                       | descriptor versionado cacheable sin autoridad   | mostrar estado; no ejecutar                    | replay automático, mezclar versiones              |
| Jobs, colas, webhooks e integraciones | códigos y schemas compartidos                   | fallo/deny tipado para observabilidad          | mensaje humano como protocolo, confirmar efectos  |

Reconciliación:

```text
canales esperados = 10
canales materializados = 10
faltantes = 0
duplicados = 0
```

---

#### 27. Envelope compartido

Forma pública mínima conceptual:

```ts
type AuthorizationPublicResponse = {
  ok: false;
  result_kind: "DENY" | "TECHNICAL_FAILURE";
  reason_code: AuthorizationReasonCode;
  message_profile_key: string;
  catalog_version: "1.0.0";
  locale: "es-CO" | string;
  executable: false;
  retryable: boolean;
  session_preserved: boolean;
  effects_committed: false;
  support_code?: string;
  correlation_id?: string;
};
```

La forma no transporta el copy completo como autoridad. Un cliente con paquete
compatible lo resuelve localmente; un servidor podrá adjuntar una proyección
humana para clientes externos, pero deberá provenir de la misma versión y
fingerprint.

---

#### 28. Cobertura de aplicaciones

| Aplicación | Decisión de consumo                                                                                                             |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------- |
| SHELL      | propietario de catálogo, retorno seguro, superficies de autenticación, Hub y distribución; no convierte fallos en login         |
| ANIMA      | consume perfiles laborales y cliente cuando corresponda; no reduce error a mapa vacío ni inventa mensajes de asistencia         |
| AURA       | su estado diferido no produce un mensaje de autorización local; adopta el contrato al materializar superficies                  |
| FOGO       | consume mensajes compartidos antes de producción, recetas, lotes y operaciones; no expone permiso ni ruta                       |
| NEXO       | consume catálogo para inventario, ubicaciones, conteos y remisiones; la página genérica actual no es canónica                   |
| NUMERA     | consume el mismo catálogo para superficies financieras sin revelar costos o recursos                                            |
| ORIGO      | consume mensajes compartidos para compras, proveedores y recepciones; no muestra claves técnicas                                |
| PASS       | conserva dominio cliente; usa el perfil `AUTH_USER_INACTIVE/customer` y no impone RBAC laboral a flujos de cliente no modelados |
| PULSO      | consume mensajes antes de ventas, pagos, caja e impresión; no atribuye siempre el bloqueo a la sede seleccionada                |
| VISO       | consume catálogo para administración y diagnóstico; detalle privado requiere autorización separada                              |

Reconciliación:

```text
aplicaciones esperadas = 10
aplicaciones materializadas = 10
faltantes = 0
duplicados = 0
aplicaciones autorizadas a definir copy alternativo = 0
```

---

#### 29. Fronteras especiales de PASS y AURA

PASS:

- no usa automáticamente mensajes laborales para clientes;
- utiliza únicamente perfiles cuya razón sea aplicable al dominio cliente;
- conserva autenticación, identidad y autorización de cliente separadas;
- no muestra roles, sedes, turnos o permisos laborales inexistentes;
- puede consumir contratos compartidos de plataforma sin perder su propietario
  funcional.

AURA:

- una aplicación diferida no es una falla técnica ni una denegación personal;
- no se publica copy de autorización para superficies no materializadas;
- cualquier futura adopción deberá fijar versión y pasar las mismas pruebas;
- no se fabrica una razón local durante su diferimiento.

---

#### 30. Propiedad server-side y cliente

El servidor decide:

- razón;
- resultado `DENY` o `TECHNICAL_FAILURE`;
- perfil permitido;
- flags;
- acciones condicionales;
- soporte;
- retorno seguro.

El cliente decide únicamente:

- layout aprobado;
- foco;
- orden visual;
- activación de la acción ya autorizada;
- locale soportado dentro de la versión compatible.

```text
CLIENTE NO ELIGE REASON_CODE
CLIENTE NO ELIGE VARIANT PARA AMPLIAR RECUPERACIÓN
CLIENTE NO CONSTRUYE SUPPORT_CODE
CLIENTE NO CONVIERTE ERROR EN DENY
```

---

#### 31. Versionado, publicación y rollback

La implementación futura deberá cumplir:

1. paquete privado e inmutable;
2. versión exacta en `package.json` y lockfile;
3. build reproducible;
4. hash y procedencia;
5. changelog;
6. pruebas antes de publicar;
7. publicación desde `vento-shell`;
8. lectura con privilegio mínimo;
9. adopción por PR, no actualización directa;
10. rollback mediante versión y lockfile anteriores;
11. prohibición de alterar una versión publicada;
12. compatibilidad declarada con `@vento/os-context` y `@vento/ui-web`.

La publicación de una nueva versión no obliga a todas las aplicaciones a
adoptarla simultáneamente, pero no se permitirá que dos versiones produzcan
semántica distinta para el mismo reason code durante una operación compartida
sin una transición explícita.

---

#### 32. Adopción y transición

Orden previsto:

```text
SHELL-PKG-001..008
→ SHELL-CON-001 y SHELL-CON-008
→ SHELL-AUTH-001 y SHELL-CTX-001
→ SHELL-AUTH-002..004
→ SHELL-UI-001 y SHELL-UI-016
→ pruebas y publicación
→ SHELL-AUTH-005
→ certificación multicanal y multi-repositorio
```

Cada consumidor deberá:

- eliminar diccionarios y copy locales alcanzados;
- reemplazar query params libres por estado seguro;
- dejar de exponer permiso y ruta;
- consumir la versión exacta;
- pasar pruebas de paridad;
- conservar rollback;
- demostrar que un código desconocido falla cerrado;
- registrar la versión adoptada.

La migración no autoriza retirar compatibilidad antes de completar inventario,
pruebas y rollback.

---

#### 33. Auditoría y observabilidad

La auditoría de resolución del mensaje podrá registrar:

```text
reason_code
profile_key
catalog_version
schema_version
locale solicitado
locale resuelto
consumer_app
consumer_version
channel
resolution_status
fallback_used
support_code_reference
correlation_id
resolved_at
```

No registrará el copy completo como causa primaria, PII, permiso, ruta, token,
cookie, secreto o payload empresarial.

Métricas mínimas:

- perfil desconocido;
- versión incompatible;
- fallback de locale;
- hash inválido;
- consumidor con versión obsoleta;
- uso de copy local detectado;
- código desconocido;
- fallo de render;
- acción condicional rechazada;
- paridad por aplicación y canal.

Las métricas de resolución de mensaje no reemplazan las métricas de denegación
o falla técnica.

---

#### 34. Seguridad de la cadena de suministro

La distribución deberá proteger:

- token de publicación separado de lectura;
- registry privado;
- versiones inmutables;
- lockfiles;
- integridad del artefacto;
- procedencia del build;
- revisión del cambio de copy;
- bloqueo de publicación desde repositorios consumidores;
- prohibición de secretos en bundle cliente;
- análisis de dependencias y paquete;
- rollback verificable;
- revocación de credenciales sin cambiar el namespace.

Un paquete alterado, no firmado por procedencia aprobada o con hash divergente
no se utiliza y produce fallo técnico seguro.

---

#### 35. Snapshot físico de solo lectura

Estado observado:

| Elemento                                                      |                   Resultado |
| ------------------------------------------------------------- | --------------------------: |
| workspaces declarados en `vento-shell`                        |                `packages/*` |
| paquete físico `@vento/os-context`                            |                           1 |
| versión física de `@vento/os-context`                         |     `0.1.0`, `private=true` |
| exports físicos de `@vento/os-context`                        |      1 raíz; types + client |
| tipos físicos legacy con `can_operate` y `blocked_reasons`    |                   presentes |
| paquete físico `@vento/contracts`                             |                           0 |
| paquete físico `@vento/ui-web`                                |                           0 |
| catálogo físico de mensajes de autorización                   |                           0 |
| perfiles físicos versionados y con hash                       |                           0 |
| páginas `no-access` inspeccionadas                            |                           5 |
| páginas con copy local divergente                             |                           5 |
| páginas que muestran ruta solicitada                          | 4: NEXO, FOGO, ORIGO y VISO |
| páginas que muestran permiso solicitado                       |             2: FOGO y ORIGO |
| páginas que usan “No tienes permisos” o equivalente genérico  |                           5 |
| guards físicos inspeccionados previamente con reasons locales |                           5 |
| repositorios con reducción booleana o copy local observada    |                           6 |

Observaciones:

- NEXO muestra un mensaje genérico y la ruta solicitada;
- FOGO y ORIGO muestran ruta, permiso y una variante local de rol de prueba;
- PULSO atribuye el bloqueo a permisos y sede seleccionada;
- VISO muestra copy genérico y la ruta solicitada;
- ninguna de las cinco páginas resuelve los veinte códigos o veinticinco
  perfiles desde una fuente compartida;
- el workspace `@vento/os-context` existente no implementa el contrato final y
  conserva tipos legacy incompatibles.

---

#### 36. `AUTHORIZATION-MESSAGE-PHYSICAL-RECONCILIATION-001`

|    # | Brecha física                                                                | Estado                        | Riesgo                                                                   | Destino exacto                                                                  |
| ---: | ---------------------------------------------------------------------------- | ----------------------------- | ------------------------------------------------------------------------ | ------------------------------------------------------------------------------- |
|    1 | no existe el paquete físico `@vento/contracts`                               | `PENDIENTE_DE_IMPLEMENTACION` | códigos y schemas no tienen distribución canónica                        | `SHELL-CON-001`; `SHELL-PKG-001` a `SHELL-PKG-008`                              |
|    2 | no existe export `@vento/contracts/authorization` con catálogo y perfiles    | `PENDIENTE_DE_IMPLEMENTACION` | cada consumidor puede definir otra semántica                             | `SHELL-CON-008`; `SHELL-AUTH-001`                                               |
|    3 | no existe schema o tipo generado que valide 20 razones y 25 perfiles         | `PENDIENTE_DE_IMPLEMENTACION` | faltantes, duplicados y campos inseguros                                 | `SHELL-CON-008`; `SHELL-AUTH-001`; `SHELL-CI-016`                               |
|    4 | `@vento/os-context` solo exporta types y client legacy                       | `BLOQUEADO`                   | no existe resolver compartido y persisten `can_operate` y strings libres | `SHELL-AUTH-001`; `SHELL-CTX-001`; `SHELL-AUTH-002`                             |
|    5 | no existe paquete físico `@vento/ui-web` ni componente de bloqueo compartido | `PENDIENTE_DE_IMPLEMENTACION` | cinco aplicaciones mantienen páginas divergentes                         | `SHELL-UI-001`; `SHELL-UI-016`                                                  |
|    6 | NEXO conserva página genérica que muestra la ruta                            | `PENDIENTE_DE_MIGRACION`      | filtración y causa incorrecta                                            | `SHELL-AUTH-005`; `SHELL-UI-016`; `SHELL-CI-016`                                |
|    7 | FOGO conserva ruta, permiso y copy local de override                         | `PENDIENTE_DE_MIGRACION`      | enumeración de capacidades y semántica de simulación incorrecta          | `SHELL-AUTH-004`; `SHELL-AUTH-005`; `SHELL-UI-016`                              |
|    8 | ORIGO conserva ruta, permiso y copy local de override                        | `PENDIENTE_DE_MIGRACION`      | enumeración y drift                                                      | `SHELL-AUTH-004`; `SHELL-AUTH-005`; `SHELL-UI-016`                              |
|    9 | PULSO conserva mensaje genérico ligado a sede seleccionada                   | `PENDIENTE_DE_MIGRACION`      | atribución falsa del bloqueo                                             | `SHELL-AUTH-005`; `SHELL-UI-016`; `SHELL-CI-016`                                |
|   10 | VISO conserva copy genérico y muestra ruta                                   | `PENDIENTE_DE_MIGRACION`      | diagnóstico administrativo filtrado sin contrato                         | `SHELL-AUTH-004`; `SHELL-AUTH-005`; `SHELL-UI-016`                              |
|   11 | guards transportan `reason`, `permission` y `returnTo` libres                | `BLOQUEADO`                   | manipulación, exposición y mapping local                                 | `SHELL-AUTH-002`; `SHELL-AUTH-003`; `SHELL-AUTH-004`; `SHELL-AUTH-005`          |
|   12 | no existe versionado, hash, locale y fingerprint físicos del catálogo        | `PENDIENTE_DE_IMPLEMENTACION` | mezcla de versiones, stale copy y rollback incierto                      | `SHELL-PKG-002` a `SHELL-PKG-005`; `SHELL-CON-008`; `SHELL-CI-019`              |
|   13 | no existe gate de completitud, exactitud y ausencia de copy local            | `PENDIENTE_DE_IMPLEMENTACION` | una app puede omitir o alterar perfiles                                  | `SHELL-PKG-008`; `SHELL-AUTH-004`; `SHELL-CI-016`                               |
|   14 | no existe adopción y certificación de diez aplicaciones y diez canales       | `PENDIENTE_DE_EVIDENCIA`      | implementación parcial y bypass entre superficies                        | `SHELL-AUTH-005`; `AUTH-QA-019`; `SHELL-CI-016`; `SHELL-CI-018`; `SHELL-CI-019` |

Ninguna brecha autoriza implementación durante esta tarea documental.

---

#### 37. Caché, invalidación y concurrencia

Una resolución cacheada deberá incluir:

```text
catalog_version
schema_version
catalog_hash
reason_code
profile_key
locale
renderer_version cuando aplique
```

Invalidan el resultado:

- nueva versión del catálogo;
- cambio de hash;
- cambio de locale pack;
- cambio de perfil;
- revocación de una acción condicional;
- cambio de contrato de la razón;
- cambio de sesión o actor cuando la variante dependa de dominio;
- cambio de dispositivo;
- salida de simulación;
- actualización del consumidor.

Un resultado tardío no reemplaza una versión más nueva. Un cache miss no
habilita copy local. Una aplicación offline puede mostrar el último descriptor
íntegro compatible, pero no usarlo como autoridad para ejecutar.

---

#### 38. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

| ID              | Regla protegida                                                                                                                                                | Tipo                                                | Prioridad | Momento de implementación                 | Destino                                                                                          |
| --------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------- | --------- | ----------------------------------------- | ------------------------------------------------------------------------------------------------ |
| `TREQ-AUTH-319` | catálogo inmutable y completo de 20 razones con versión, schema, hash y procedencia                                                                            | contractual + estática + regresión                  | crítica   | creación de contratos compartidos         | `SHELL-CON-001`; `SHELL-CON-008`; `SHELL-PKG-001` a `SHELL-PKG-008`                              |
| `TREQ-AUTH-320` | 25 perfiles `es-CO` con copy exacto, campos nulos preservados y cero variantes locales                                                                         | contractual + experiencia + regresión               | crítica   | build del catálogo y UI compartida        | `SHELL-CON-008`; `SHELL-UI-016`; `SHELL-CI-016`                                                  |
| `TREQ-AUTH-321` | fronteras de ownership entre contracts, os-context y ui-web                                                                                                    | arquitectura + integración + regresión              | crítica   | creación y exports de paquetes            | `SHELL-CON-001`; `SHELL-AUTH-001`; `SHELL-CTX-001`; `SHELL-UI-001`                               |
| `TREQ-AUTH-322` | localización segura, fallback a `es-CO`, incompatibilidad fail closed y privacidad                                                                             | contractual + localización + seguridad + regresión  | crítica   | resolver y adapters                       | `SHELL-AUTH-002`; `SHELL-AUTH-004`; `SHELL-CI-016`                                               |
| `TREQ-AUTH-323` | equivalencia de diez canales y envelope sin booleano, copy o razón inventados                                                                                  | integración + RPC + RLS + E2E + regresión           | crítica   | adopción multicanal                       | `AUTH-DB-034`; `SHELL-AUTH-002`; `SHELL-AUTH-005`; `SHELL-CI-018`                                |
| `TREQ-AUTH-324` | paridad de diez aplicaciones, sin copy local ni exposición de ruta o permiso                                                                                   | aplicación + privacidad + E2E + regresión           | crítica   | migración de consumidores                 | `SHELL-AUTH-004`; `SHELL-AUTH-005`; `SHELL-UI-016`; `SHELL-CI-016`                               |
| `TREQ-AUTH-325` | selección determinista de reason, variant, locale y acciones condicionales                                                                                     | unitaria + contractual + seguridad + regresión      | crítica   | SDK y renderer compartidos                | `SHELL-AUTH-001`; `SHELL-AUTH-002`; `SHELL-UI-016`                                               |
| `TREQ-AUTH-326` | gate de completitud, duplicados, copy exacto, códigos desconocidos y ausencia de diccionarios locales                                                          | estática + lint + CI + regresión                    | crítica   | gates de paquetes y consumidores          | `SHELL-PKG-008`; `SHELL-AUTH-004`; `SHELL-CI-016`                                                |
| `TREQ-AUTH-327` | publicación privada, semver, lockfile, inmutabilidad, procedencia, compatibilidad y rollback                                                                   | supply chain + integración + regresión              | crítica   | release y adopción                        | `SHELL-PKG-001` a `SHELL-PKG-008`; `SHELL-CI-018`; `SHELL-CI-019`                                |
| `TREQ-AUTH-328` | cierre de 16 brechas y certificación transversal de catálogo, resolver, UI y consumidores                                                                      | seguridad + integración + E2E + regresión           | crítica   | paquete de implementación y certificación | `SHELL-AUTH-005`; `AUTH-QA-019`; `SHELL-CI-016`; `SHELL-CI-018`; `SHELL-CI-019`                  |
| `TREQ-AUTH-329` | denegación operativa concluyente con reason code, copy, composición por modalidad y cero efectos                                                               | contractual + autorización + seguridad + regresión  | crítica   | evaluador y catálogo compartido           | `AUTH-DB-034`; `SHELL-AUTH-001`; `SHELL-AUTH-002`; `SHELL-CI-016`                                |
| `TREQ-AUTH-330` | conflictos de asistencia concluyentes usan `AUTH-ERR-017`, indisponibilidad usa `AUTH-ERR-019` y `AUTH-ERR-012` queda reservado a rol faltante                 | razones + contexto + regresión                      | crítica   | resolver de asistencia y precedencia      | `AUTH-DB-033`; `AUTH-DB-034`; `SHELL-CI-016`                                                     |
| `TREQ-AUTH-331` | identificación de actor y reautenticación fuerte permanecen estados interactivos auxiliares, fuera de `AuthorizationReasonCode`, con catálogo y UI compartidos | contractual + dispositivo + experiencia + regresión | crítica   | catálogo de interacción y adapters        | `AUTH-DEV-007`; `AUTH-DEV-012`; `AUTH-DEV-014`; `SHELL-AUTH-002`; `SHELL-UI-016`; `SHELL-CI-016` |

Los requisitos se incorporan al registro canónico completo. Esta tarea no
implementa las pruebas.

---

#### 39. Estados y evidencia

| Elemento                                     | Estado                             |
| -------------------------------------------- | ---------------------------------- |
| catálogo documental de 20 razones            | `ESPECIFICADO`                     |
| registro documental de 25 perfiles           | `ESPECIFICADO`                     |
| registro de 2 estados interactivos excluidos | `ESPECIFICADO`                     |
| contrato de distribución                     | `ESPECIFICADO`                     |
| matriz de diez canales                       | `ESPECIFICADO`                     |
| cobertura de diez aplicaciones               | `ESPECIFICADO`                     |
| snapshot físico de páginas y paquetes        | `PENDIENTE_DE_EVIDENCIA_OPERATIVA` |
| paquete `@vento/contracts`                   | `PENDIENTE_DE_IMPLEMENTACION`      |
| módulo `@vento/contracts/authorization`      | `PENDIENTE_DE_IMPLEMENTACION`      |
| resolver en `@vento/os-context`              | `PENDIENTE_DE_IMPLEMENTACION`      |
| componente en `@vento/ui-web`                | `PENDIENTE_DE_IMPLEMENTACION`      |
| publicación privada                          | `PENDIENTE_DE_IMPLEMENTACION`      |
| migración de consumidores                    | `PENDIENTE_DE_IMPLEMENTACION`      |
| pruebas automatizadas                        | `PENDIENTE_DE_IMPLEMENTACION`      |
| certificación multicanal y multi-repositorio | `PENDIENTE_DE_EVIDENCIA`           |

La inspección física demuestra divergencia actual; no demuestra conformidad ni
adopción futura.

---

#### 40. Fuera del alcance

AUTH-ERR-020 no:

- crea `@vento/contracts`;
- modifica `@vento/os-context`;
- crea `@vento/ui-web`;
- publica paquetes;
- elige definitivamente un proveedor de registry;
- modifica páginas `no-access`;
- cambia guards, middleware o query params;
- corrige helpers booleanos;
- implementa el evaluador;
- modifica Supabase;
- crea migraciones, tablas, funciones, RLS o datos;
- traduce a otros idiomas;
- ejecuta pruebas operativas;
- despliega componentes;
- escribe en GitHub;
- inicia `NEXO-DOM-001`.

La implementación corresponde exclusivamente a las tareas exactas registradas
en la reconciliación física.

---

#### 41. Criterios de aceptación

- [x] Se definió `vento.authorization.messages@1.0.0`.
- [x] Se definió `schema_version=1.0.0`.
- [x] Se definió `es-CO` como locale fuente.
- [x] Se materializaron veinte reason codes.
- [x] Se materializaron veinticinco perfiles.
- [x] Se excluyeron formalmente dos estados interactivos auxiliares.
- [x] Se preservó y corrigió el copy aprobado de `AUTH-ERR-001` a `AUTH-ERR-019`, incluido el perfil operativo complementario de `AUTH-ERR-004`.
- [x] Se conservaron campos `null` donde no existía texto aprobado.
- [x] Se prohibió inventar copy local.
- [x] Se separaron códigos, copy y evidencia privada.
- [x] Se definió propiedad en `@vento/contracts/authorization`.
- [x] Se definió resolución en `@vento/os-context`.
- [x] Se definió rendering en `@vento/ui-web`.
- [x] Se mantuvo `vento-shell` como propietario de autoría y publicación.
- [x] Se definió catálogo inmutable con versión y hash.
- [x] Se prohibieron versiones `latest` o equivalentes.
- [x] Se definió fallback exclusivo a `es-CO` compatible.
- [x] Se prohibió mezclar versiones o locales.
- [x] Se definió selección determinista de perfil.
- [x] Se definieron acciones condicionales server-side.
- [x] Se prohibió replay automático.
- [x] Se definió privacidad y anti-enumeración.
- [x] Se prohibió mostrar ruta, permiso o causa interna.
- [x] Se definió accesibilidad.
- [x] Se definió envelope compartido.
- [x] Se decidieron diez canales.
- [x] Se reconciliaron diez aplicaciones.
- [x] Se preservó el dominio cliente de PASS.
- [x] Se preservó el estado diferido de AURA.
- [x] Se definió versionado, publicación y rollback.
- [x] Se definió orden de adopción.
- [x] Se definieron auditoría y métricas de resolución.
- [x] Se definió seguridad de supply chain.
- [x] Se inspeccionaron cinco páginas físicas divergentes.
- [x] Se registró la ausencia física de `@vento/contracts` y `@vento/ui-web`.
- [x] Se registró el estado parcial legacy de `@vento/os-context`.
- [x] Se registraron dieciséis brechas con destino exacto.
- [x] Se conservaron `TREQ-AUTH-319` a `TREQ-AUTH-328` y se derivaron `TREQ-AUTH-329` a `TREQ-AUTH-331`.
- [x] No se modificó código, Supabase, paquetes, aplicaciones ni repositorios remotos.
- [x] `NEXO-DOM-001` permanece únicamente reservada.

---

#### 42. Riesgos controlados

| Riesgo                                                 | Control                                     |
| ------------------------------------------------------ | ------------------------------------------- |
| aplicación inventa un mensaje                          | catálogo único y gate contra copy local     |
| causa técnica mostrada como falta de permiso           | reason code y perfil tipados                |
| permiso o ruta expuestos                               | descriptor público minimizado               |
| traducción cambia semántica                            | source locale y paridad contractual         |
| campo no aprobado recibe texto local                   | `null` explícito                            |
| paquete stale mezcla versiones                         | versión, hash y lockfile                    |
| variant amplía recuperación                            | selección server-side                       |
| acción repite mutación                                 | solicitud nueva y cero replay               |
| RLS cero filas inventa causa                           | adapter autoritativo                        |
| PASS recibe RBAC laboral indebido                      | frontera de dominio cliente                 |
| AURA diferida se presenta como falla                   | no materializar superficie inexistente      |
| UI compartida decide autorización                      | separación contracts/context/UI             |
| registry comprometido altera copy                      | inmutabilidad, procedencia e integridad     |
| rollback manual pierde paridad                         | versión exacta y lockfile anterior          |
| adopción parcial deja bypass                           | certificación de diez apps y diez canales   |
| denegación operativa se presenta como administrativa   | perfil operativo y composición determinista |
| identificación o reautenticación se presenta como deny | registro explícito de estados auxiliares    |
| copy cambia sin prueba                                 | semver, changelog y gates                   |

---

#### 43. Cierre de tarea y continuidad

**ÚLTIMA TAREA APROBADA**

`AUTH-ERR-019 — Diferenciar error técnico y denegación`

**TAREA ACTUAL APROBADA**

`AUTH-ERR-020 — Compartir mensajes desde vento-shell`

**SIGUIENTE TAREA RESERVADA**

`NEXO-DOM-001 — Clasificar consumibles, stock por cantidad, reutilizables, activos serializados, repuestos, kits y contenedores`
