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
   snapshot desplegado de solo lectura y catorce brechas con destino canónico.

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
| Permisos canónicos documentales de referencia            |         112 |
| Combinaciones legacy de flags contradictorias observadas |          14 |
| Empleados físicos observados                             |          59 |
| Asignaciones de sede observadas                          |          91 |
| Asignaciones de área observadas                          |           1 |
| Habilitaciones de rol operativo observadas               |          16 |
| Turnos físicos observados                                |       2.844 |
| Turnos publicados observados                             |       2.723 |
| Brechas físicas registradas                              |          14 |
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

| Perfil                      | Hecho concluyente                                                                                 | Propietario público                         |
| --------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------- |
| `NO_AUTHENTICATED_SESSION`  | sesión ausente, inválida, expirada o revocada                                                     | `AUTH-ERR-001`                              |
| `IDENTITY_INACTIVE`         | identidad requerida explícitamente inactiva                                                       | `AUTH-ERR-002`                              |
| `APP_ACCESS_DENIED`         | aplicación registrada y evaluación coherente sin acceso                                           | `AUTH-ERR-003`                              |
| `PERMISSION_DENIED`         | permiso registrado, configuración coherente y grant insuficiente o deny aplicable                 | `AUTH-ERR-004` o razón posterior de permiso |
| `ORDINARY_CONTEXT_ABSENCE`  | asignación, sede, área, turno, check-in o rol ausentes/inactivos bajo una configuración coherente | `AUTH-ERR-005` a `AUTH-ERR-014`             |
| `DEVICE_RESTRICTION`        | dispositivo coherente restringe la solicitud                                                      | `AUTH-ERR-015`                              |
| `SIMULATION_EXECUTION`      | simulación intenta producir autoridad o efectos reales                                            | `AUTH-ERR-016`                              |
| `CONFIGURATION_CONFLICT`    | contradicción, ambigüedad, forma inválida, versión incompatible o snapshot mixto                  | `AUTH-ERR-017`                              |
| `PERMISSION_NOT_REGISTERED` | la clave completa solicitada no existe                                                            | `AUTH-ERR-018`                              |
| `TECHNICAL_UNAVAILABLE`     | lectura, red, RPC, proveedor o fuente no permite concluir                                         | `AUTH-ERR-019`                              |
| `MESSAGE_DISTRIBUTION`      | adaptación y presentación compartida del resultado                                                | `AUTH-ERR-020`                              |

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
4. ofrecer `Solicitar revisión` cuando exista un canal autorizado;
5. permitir volver a una superficie segura ya autorizada;
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

| Elemento          | Texto exacto                                                                                                                       |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| Título            | `No pudimos validar la configuración`                                                                                              |
| Mensaje           | `La configuración necesaria para autorizar esta acción es inconsistente. Solicita una revisión administrativa antes de continuar.` |
| Acción principal  | `Solicitar revisión`                                                                                                               |
| Acción secundaria | `Volver`                                                                                                                           |
| Código de soporte | `AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT`                                                                                   |

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
|    3 | el catálogo físico contiene 179 permisos y el snapshot documental base conserva 112 sin versión física de paridad              | `PENDIENTE_DE_RECONCILIACION` | deriva, claves nuevas sin contrato o cobertura incompleta                                    | `AUTH-CAT-017`; `AUTH-CTX-016`; `AUTH-DB-034`; `SHELL-CI-018`                                                                          |
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
| `298` | reconciliación física y cierre de catorce brechas                 |

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
16. catorce brechas con destino;
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
- [x] Se registraron catorce brechas con destino exacto.
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
| Permisos canónicos documentales vigentes                           |                       112 |
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
a la versión contractual de 112 permisos ni que la ausencia futura de una clave
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
active_permission_count = 112
```

La cifra de 112 procede de la decisión aprobada más reciente de versionado del
catálogo y prevalece sobre snapshots documentales anteriores que registraron
140 durante una fase previa.

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
  del catálogo contractual de 112 permisos.

---

#### 35. `PERMISSION-NOT-REGISTERED-PHYSICAL-RECONCILIATION-001`

|    # | Brecha física                                                                                                             | Estado                               | Riesgo                                                                      | Destino exacto                                                                                     |
| ---: | ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------ | --------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
|    1 | no existe publicación física verificable del catálogo contractual de 112 permisos con versión, schema y hash              | `PENDIENTE_DE_IMPLEMENTACION`        | la tabla de 179 filas se usa como fuente semántica no versionada            | `AUTH-CAT-017`; `AUTH-CAT-018`; `AUTH-DB-020`; `AUTH-DB-031`                                       |
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
7. catálogo contractual vigente de 112 permisos;
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
- [x] Se tomó 112 como cantidad contractual vigente.
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


### [ ] AUTH-ERR-019 — Diferenciar error técnico y denegación
### [ ] AUTH-ERR-020 — Compartir mensajes desde vento-shell
