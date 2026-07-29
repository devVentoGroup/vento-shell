### SECCIÓN — EXCEPCIONES Y DISPOSITIVOS

<!-- PLAN-SECTION-META:START -->
Esta sección reúne contenido canónico con una responsabilidad documental única dentro del plan. Debe conservarse cohesionada y actualizarse junto con sus referencias y validaciones dependientes.

**Cobertura canónica:** `AUTH-RBAC-020` a `AUTH-RBAC-023` — 4 tareas.
<!-- PLAN-SECTION-META:END -->

### ✅ AUTH-RBAC-020 — Definir concesiones individuales base

#### 1. Identificación de la tarea

| Campo                     | Valor                                                              |
| ------------------------- | ------------------------------------------------------------------ |
| Bloque                    | BLOQUE D — Matrices canónicas de roles, excepciones y dispositivos |
| Sección                   | Capas adicionales                                                  |
| Tarea                     | AUTH-RBAC-020 — Definir concesiones individuales base              |
| Estado                    | **APROBADA**                                                       |
| Naturaleza                | Definición documental de excepciones positivas del carril base     |
| Implementación física     | No incluida                                                        |
| Catálogo evaluado         | 112 permisos canónicos vigentes                                    |
| Tarea anterior vigente    | AUTH-RBAC-019 — APROBADA                                           |
| Tarea posterior reservada | AUTH-RBAC-021 — Definir concesiones individuales operativas        |

Esta tarea no modifica Supabase, migraciones, tablas, RLS, RPC, aplicaciones, repositorios ni datasets físicos. La estructura definitiva y el dataset canónico de excepciones se definirán posteriormente en `AUTH-RBAC-026` y se implementarán únicamente en el BLOQUE R mediante migraciones versionadas en `vento-shell`.

#### 2. Objetivo

Definir cuándo, cómo y bajo qué límites un trabajador puede recibir una concesión individual positiva en el carril base para añadir una responsabilidad administrativa específica que no procede de su matriz de rol, sin convertir `employee_permissions` en una segunda matriz general, sin duplicar permisos heredados, sin volver permanentes capacidades operativas y sin evadir modalidad, alcance, sensibilidad, segregación de funciones, vigencia o auditoría.

#### 3. Decisión principal

Una concesión individual base es una excepción positiva, explícita y atribuida a un trabajador concreto.

Su finalidad es cubrir una responsabilidad administrativa legítima que:

- corresponde únicamente a una persona o a un grupo excepcionalmente reducido;
- no justifica modificar la matriz canónica del rol completo;
- requiere un alcance concreto;
- tiene una causa empresarial verificable;
- puede tener vigencia temporal o permanente revisable;
- debe poder revocarse sin cambiar el rol base del trabajador.

```text
TRABAJADOR ACTIVO
+ PERMISO CANÓNICO COMPATIBLE CON CARRIL BASE
+ CONCESIÓN INDIVIDUAL VIGENTE
+ ALCANCE APROBADO Y COMPATIBLE
+ RECURSO REAL DENTRO DEL ALCANCE
+ SIN DENEGACIÓN APLICABLE
= BASE_ALLOW INDIVIDUAL POSIBLE
```

No se admite:

```text
concesión individual base = segundo rol base
concesión individual base = copia de la matriz del rol
concesión individual base = bypass de autorización
concesión individual base = permiso operativo permanente
concesión individual base = turno o check-in implícito
concesión individual base = alcance global por defecto
concesión positiva más específica = restricción de un allow más amplio
```

#### 4. Relación con la matriz del rol base

Dentro del carril base, las concesiones positivas se combinan por unión:

```text
ROLE_BASE_ALLOW
OR
EMPLOYEE_BASE_ALLOW
=
BASE_ALLOW POSIBLE
```

La concesión individual puede añadir una capacidad que el rol no tenga, pero no reemplaza ni reescribe la matriz del rol.

| Situación                                                                       | Resultado                                                        |
| ------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| El rol no concede el permiso y la excepción individual sí                       | La excepción puede autorizar dentro de su alcance.               |
| El rol concede el permiso y la excepción individual repite el mismo alcance     | Configuración redundante; no debe crearse.                       |
| El rol concede un alcance más amplio y la excepción concede uno más estrecho    | La excepción no restringe el rol; no produce reducción efectiva. |
| El rol concede un alcance limitado y la excepción añade otro alcance compatible | Se evalúa la unión de ambos alcances.                            |
| Existe una denegación aplicable                                                 | La denegación prevalece conforme a AUTH-MOD-019 y AUTH-RBAC-022. |

Regla crítica:

> Una concesión positiva nunca se utiliza para reducir otra concesión positiva. Para restringir deberá existir una denegación explícita en la capa correspondiente.

#### 5. Compatibilidad por modalidad

| `authorization_requirement` | ¿Admite concesión individual base? | Efecto                                                                                                                                            |
| --------------------------- | ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| `BASE_ONLY`                 | **SÍ**                             | Puede producir una autorización completa del carril base si se cumplen alcance, recurso y controles.                                              |
| `BASE_OR_OPERATIONAL`       | **SÍ**                             | Concede únicamente el carril base. No altera ni crea el carril operativo.                                                                         |
| `BASE_AND_OPERATIONAL`      | **SÍ, SOLO COMO COMPONENTE BASE**  | No autoriza la acción por sí sola. Continúa siendo obligatorio un componente operativo válido con turno, check-in y contexto cuando correspondan. |
| `OPERATIONAL_ONLY`          | **NO**                             | Una asignación base sería incompatible y deberá denegarse como configuración inválida.                                                            |

Resultado sobre el catálogo vigente:

| Clasificación                                                   | Cantidad |
| --------------------------------------------------------------- | -------: |
| Permisos que admiten componente base                            |       99 |
| Capacidades directas base (`BASE_ONLY` o `BASE_OR_OPERATIONAL`) |       94 |
| Componentes base de doble condición (`BASE_AND_OPERATIONAL`)    |        5 |
| Permisos exclusivamente operativos prohibidos en esta capa      |       13 |
| Total evaluado                                                  |      112 |

No es necesario repetir en esta tarea las 112 filas del catálogo: la elegibilidad se deriva exclusivamente de la modalidad canónica vigente de cada permiso. Una modalidad ausente, desconocida o legacy produce denegación.

#### 6. Usos válidos

Una concesión individual base puede utilizarse para:

1. **Responsabilidad especializada estable**  
   Una persona cumple una función administrativa singular que no corresponde al conjunto de su rol.

2. **Cobertura temporal administrativa**  
   Sustitución por vacaciones, incapacidad, vacante, proyecto o transición, con fecha de inicio y expiración.

3. **Responsabilidad territorial adicional**  
   El trabajador conserva el mismo permiso, pero requiere cobertura sobre otra sede, área o conjunto autorizado no incluido en su matriz ordinaria.

4. **Participación controlada en un proyecto**  
   Acceso administrativo limitado a un recurso, sede, área o periodo específico.

5. **Componente base de una acción `BASE_AND_OPERATIONAL`**  
   Autoridad administrativa individual para una acción sensible que solo podrá completarse además con contexto operativo válido.

6. **Acceso de consulta excepcional**  
   Lectura concreta y justificada de información necesaria para una responsabilidad temporal o especializada.

#### 7. Usos prohibidos

No se utilizarán concesiones individuales base para:

- asignar permisos `OPERATIONAL_ONLY`;
- permitir operar sin turno, check-in, rol operativo, sede o área cuando el contrato los exige;
- compensar permanentemente una matriz de rol incompleta;
- replicar en múltiples trabajadores el mismo paquete de permisos que debería pertenecer a un rol;
- reconstruir un rol informal mediante decenas de excepciones;
- conceder wildcards, prefijos, aplicaciones completas o permisos no canónicos;
- otorgar acceso automático a APP-REVIEW, demo, sedes aisladas o entornos no productivos;
- utilizar un permiso de entrada `<app>.access` como sustituto de capacidades internas;
- elevar el alcance por encima del máximo aprobado en AUTH-CAT-011;
- eliminar sensibilidad, reautenticación, segregación de funciones o controles del recurso;
- autorizar por nombre de cargo, relación personal, jerarquía informal o urgencia no documentada;
- conceder capacidades a empleados inactivos, identidades técnicas o dispositivos;
- crear la excepción a favor del mismo actor que la solicita o aprueba cuando exista conflicto de interés.

#### 8. Alcance territorial y de recurso

Toda concesión individual base deberá declarar un alcance explícito compatible con el permiso.

Podrá utilizar únicamente las dimensiones aprobadas para esa capacidad, entre ellas:

- organizacional;
- sedes asignadas;
- sede específica;
- tipo de sede con modo de cobertura explícito;
- área específica;
- tipo de área con modo de cobertura explícito;
- recursos propios;
- conjunto de recursos expresamente relacionado.

Reglas obligatorias:

1. El alcance concedido nunca puede superar el alcance máximo del permiso.
2. `null` no significa global ni todas las sedes.
3. Una sede específica requiere un `site_id` válido y activo.
4. Un área específica requiere un `area_id` válido, activo y perteneciente a la sede correspondiente.
5. Un tipo de sede o tipo de área debe declarar si cubre únicamente asignaciones del trabajador o todas las entidades del tipo cuando el permiso lo admita.
6. APP-REVIEW, demo y territorios aislados requieren autorización separada y no se incluyen por coincidencia de tipo.
7. La sede o área seleccionada en el frontend no modifica el alcance concedido.
8. El recurso real debe resolverse en servidor antes de decidir.
9. Un recurso multisede debe validar todos los lados obligatorios definidos por su contrato.
10. El alcance organizacional individual debe ser excepcional, explícito y sujeto a aprobación reforzada.

#### 9. Vigencia

Toda concesión individual base deberá declarar:

- `effective_from`;
- `effective_until`, cuando sea temporal;
- estado actual;
- motivo de creación;
- responsable solicitante;
- responsable aprobador;
- fecha de última revisión.

Estados conceptuales permitidos:

```text
DRAFT
PENDING_APPROVAL
SCHEDULED
ACTIVE
SUSPENDED
REVOKED
EXPIRED
REJECTED
```

Reglas:

- una concesión temporal expira automáticamente;
- no existe renovación silenciosa;
- extender la vigencia genera una nueva decisión auditada;
- una concesión futura no autoriza antes de `effective_from`;
- una concesión vencida permanece en historial, pero no participa como allow;
- desactivar al trabajador produce denegación estructural aunque la concesión siga registrada;
- desactivar la aplicación o el permiso invalida la concesión;
- un cambio de rol, sede, área o responsabilidad dispara revisión obligatoria;
- una concesión permanente solo se admite para responsabilidades individualizadas estables y deberá revisarse periódicamente.

#### 10. Contrato documental mínimo de una concesión

Cada concesión individual base deberá conservar como mínimo:

| Campo conceptual            | Regla                                                                               |
| --------------------------- | ----------------------------------------------------------------------------------- |
| `employee_id`               | Trabajador humano exacto y activo.                                                  |
| `permission_code`           | Clave canónica exacta, activa y sin wildcard.                                       |
| `lane`                      | Siempre `BASE`.                                                                     |
| `effect`                    | Siempre `ALLOW` dentro de esta tarea. Las denegaciones se definen en AUTH-RBAC-022. |
| `scope_type`                | Tipo de alcance permitido por el permiso.                                           |
| `scope_mode`                | Modo explícito cuando el alcance use tipos o conjuntos.                             |
| `scope_site_id`             | Obligatorio cuando el alcance sea sede específica.                                  |
| `scope_site_type`           | Obligatorio cuando el alcance sea por tipo de sede.                                 |
| `scope_area_id`             | Obligatorio cuando el alcance sea área específica.                                  |
| `scope_area_kind`           | Obligatorio cuando el alcance sea por tipo de área.                                 |
| `resource_constraint`       | Restricción adicional de propiedad, relación o conjunto cuando aplique.             |
| `effective_from`            | Inicio de vigencia.                                                                 |
| `effective_until`           | Fin de vigencia o nulo solo para responsabilidad estable aprobada.                  |
| `reason_code`               | Causa normalizada.                                                                  |
| `justification`             | Explicación humana verificable.                                                     |
| `requested_by`              | Actor que solicita.                                                                 |
| `approved_by`               | Actor autorizado que aprueba.                                                       |
| `created_by` / `updated_by` | Trazabilidad de mantenimiento.                                                      |
| `source_reference`          | Acta, solicitud, proyecto, suplencia o evidencia que origina la concesión.          |
| `reviewed_at`               | Última revisión administrativa.                                                     |
| `revoked_at` / `revoked_by` | Trazabilidad de revocación.                                                         |

La estructura física definitiva podrá usar tablas separadas o una tabla unificada de asignaciones. La semántica anterior es obligatoria independientemente del diseño físico.

#### 11. Flujo de aprobación

```text
SOLICITUD JUSTIFICADA
        ↓
VALIDAR TRABAJADOR Y RESPONSABILIDAD
        ↓
VALIDAR PERMISO Y MODALIDAD
        ↓
COMPROBAR MATRIZ DEL ROL Y REDUNDANCIA
        ↓
VALIDAR ALCANCE MÁXIMO Y RECURSO
        ↓
EVALUAR SENSIBILIDAD Y SEGREGACIÓN
        ↓
APROBACIÓN AUTORIZADA
        ↓
ACTIVACIÓN O PROGRAMACIÓN
        ↓
REVISIÓN, EXPIRACIÓN O REVOCACIÓN
```

Controles mínimos:

1. El solicitante no se autoaprueba.
2. El beneficiario no aprueba su propia concesión.
3. La persona que administra técnicamente el registro no adquiere por ello autoridad empresarial para aprobarlo.
4. Los permisos sensibles, de configuración, finanzas, personal, clientes, inventario excepcional o seguridad requieren aprobación reforzada.
5. Los alcances globales requieren aprobación reforzada.
6. Las concesiones `BASE_AND_OPERATIONAL` deben identificar expresamente que solo aportan el componente base.
7. No se activa una concesión con conflictos de segregación de funciones sin una excepción de gobierno documentada.
8. La aprobación debe comprobar el resultado efectivo, no solo la fila solicitada.

#### 12. Sensibilidad y segregación de funciones

La concesión individual no reduce la sensibilidad canónica del permiso.

Cuando la capacidad sea sensible, deberán conservarse según corresponda:

- reautenticación fuerte;
- motivo obligatorio;
- evidencia adjunta;
- aprobación dual;
- separación entre creador, ejecutor, verificador y aprobador;
- protección frente a autoaprobación;
- control de versión del recurso;
- idempotencia;
- auditoría reforzada;
- revisión posterior.

Para permisos `BASE_AND_OPERATIONAL`:

```text
EMPLOYEE_BASE_ALLOW
+ OPERATIONAL_ALLOW VÁLIDO
+ CONTEXTO OPERATIVO VÁLIDO
+ CONTROLES SENSIBLES
+ SIN DENY
= ACCIÓN POSIBLE
```

La concesión individual base no permite que la misma persona capture y apruebe una diferencia, ajuste, variación, entrega excepcional u otra operación cuando el contrato exija actores distintos.

#### 13. Dependencias y acceso a aplicaciones

Una concesión sobre una acción interna no concede automáticamente `<app>.access`.

Cuando el catálogo declare una dependencia explícita:

```text
PERMISO INTERNO
requiere
<app>.access
```

ambos permisos deberán resultar autorizados en el carril compatible.

No se infiere dependencia por compartir prefijo. Tampoco se permite crear un paquete oculto de permisos bajo una sola excepción.

#### 14. Relación con otras capas

| Capa                           | Relación con la concesión individual base                                                                                                     |
| ------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------- |
| Rol base                       | Fuente independiente de allows dentro del mismo carril.                                                                                       |
| Concesión individual operativa | Se define en AUTH-RBAC-021 y nunca es creada por esta capa.                                                                                   |
| Denegación base                | Prevalece sobre este allow cuando coincide.                                                                                                   |
| Bloqueo transversal            | Prevalece sobre todos los carriles compatibles.                                                                                               |
| Turno y check-in               | No son creados ni exigidos por una capacidad base ordinaria; continúan siendo obligatorios para el componente operativo de permisos híbridos. |
| Dispositivo compartido         | Puede restringir o impedir el uso; nunca amplía la concesión.                                                                                 |
| Simulación                     | Puede mostrar el resultado hipotético autorizado, pero no activar ni usar la concesión.                                                       |
| RLS, RPC y servidor            | Deben evaluar la misma concesión, alcance, vigencia y denegaciones.                                                                           |
| Caché                          | Debe invalidarse al activar, suspender, revocar o expirar la concesión.                                                                       |

#### 15. Prevención de redundancias

Antes de crear una concesión deberá calcularse el permiso base efectivo del trabajador.

La creación se rechazará como redundante cuando:

- el rol ya concede la misma clave con el mismo alcance;
- el rol ya concede un alcance que contiene completamente el solicitado;
- otra concesión individual activa ya cubre el mismo permiso y alcance;
- dos aliases legacy se normalizan hacia la misma clave canónica;
- la concesión no produce ninguna capacidad adicional verificable.

Una concesión individual repetida en varios trabajadores o mantenida indefinidamente para compensar una omisión deberá generar una revisión de la matriz del rol.

Regla:

```text
NECESIDAD GENERAL DEL ROL
→ CORREGIR MATRIZ DEL ROL

NECESIDAD PARTICULAR DEL TRABAJADOR
→ CONCESIÓN INDIVIDUAL
```

No se establece un número automático de personas que convierta la excepción en matriz. La decisión depende de si la responsabilidad es estructural del rol o particular del trabajador.

#### 16. Estado legacy de `employee_permissions`

La auditoría encontró 17 concesiones individuales existentes, asignadas a dos identidades, sin denegaciones reales y sin capacidades diferenciales frente a sus roles.

Resultado conceptual:

```text
17 filas existentes
→ 0 excepciones funcionales reales confirmadas
→ múltiples redundancias
→ una identidad inactiva con asignaciones
→ duplicados físicos
```

Decisión para la transición:

1. Ninguna fila legacy se declarará canónica automáticamente.
2. Las nueve asignaciones asociadas a la auxiliar administrativa deberán compararse contra la matriz base definitiva; si siguen totalmente cubiertas, se clasificarán como redundantes.
3. Las asignaciones de la identidad `Tablet Bodega` no se migrarán como concesiones humanas activas mientras la identidad permanezca inactiva o represente un dispositivo.
4. Los duplicados físicos se consolidarán durante el dataset y migración posterior.
5. Cada fila deberá normalizarse hacia permiso canónico, carril, alcance, vigencia, motivo y actor humano.
6. Una fila sin intención verificable se clasificará como `legacy_grant_unresolved` y no autorizará hasta revisión.
7. La limpieza física no se ejecuta en esta tarea.

#### 17. Ejemplos válidos

##### Ejemplo A — Cobertura administrativa temporal

```text
Trabajador: auxiliar_administrativa
Permiso: viso.workforce.schedules.view
Modalidad: BASE_ONLY
Alcance: sede específica
Vigencia: dos semanas
Motivo: cobertura de vacaciones
```

Resultado: concesión válida si el rol no cubre ya completamente esa sede y existe aprobación.

##### Ejemplo B — Consulta especializada

```text
Trabajador: contador
Permiso: nexo.finance.internal_invoices.view
Modalidad: BASE_OR_OPERATIONAL
Carril concedido: BASE
Alcance: sedes asignadas
```

Resultado: permite la consulta administrativa dentro del alcance. No crea turno ni facultad operativa.

##### Ejemplo C — Componente base de doble condición

```text
Trabajador: gerente de sede
Permiso: nexo.inventory.adjustments.register
Modalidad: BASE_AND_OPERATIONAL
Concesión individual: componente BASE en una sede
```

Resultado: no puede registrar un ajuste sin componente operativo válido, presencia requerida, evidencia, segregación y demás controles.

#### 18. Ejemplos inválidos

##### Ejemplo D — Permiso exclusivamente operativo

```text
Permiso: nexo.inventory.entries.register
Modalidad: OPERATIONAL_ONLY
Concesión solicitada: BASE
```

Resultado: **DENEGAR — incompatible_assignment_lane**.

##### Ejemplo E — Falsa restricción

```text
Rol: permite permiso global
Excepción individual: mismo permiso solo en Vento Café
```

Resultado: el permiso global continúa vigente. La excepción positiva no restringe.

##### Ejemplo F — Copia redundante

```text
Rol: ya permite viso.workforce.employees.view en sedes asignadas
Excepción: mismo permiso y mismo alcance
```

Resultado: **RECHAZAR COMO REDUNDANTE**.

##### Ejemplo G — Reconstrucción de rol informal

```text
Trabajador recibe 30 permisos individuales permanentes
porque su rol no fue actualizado
```

Resultado: revisar y corregir la matriz de rol; no normalizar la excepción masiva.

#### 19. Auditoría obligatoria

Deberán generarse eventos para:

```text
individual_base_grant_requested
individual_base_grant_approved
individual_base_grant_rejected
individual_base_grant_scheduled
individual_base_grant_activated
individual_base_grant_updated
individual_base_grant_suspended
individual_base_grant_reactivated
individual_base_grant_revoked
individual_base_grant_expired
individual_base_grant_redundancy_detected
individual_base_grant_conflict_detected
```

Cada evento deberá registrar como mínimo:

- actor efectivo;
- trabajador beneficiario;
- permiso exacto;
- carril base;
- alcance;
- vigencia;
- motivo;
- referencia de origen;
- estado anterior y nuevo;
- solicitante;
- aprobador;
- fecha de servidor;
- resultado de validación de redundancia;
- conflictos o denegaciones detectadas.

#### 20. Brechas contractuales identificadas

| Brecha                                                                                          | Impacto                                                                                                                | Decisión                                                                                                                  |
| ----------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| El catálogo vigente no contiene una capacidad atómica para administrar concesiones individuales | No existe todavía un permiso empresarial exacto para crear, aprobar, suspender o revocar estas excepciones desde VISO. | No reutilizar un permiso amplio o de lectura. Crear capacidades de gobierno específicas antes de implementar la interfaz. |
| `employee_permissions` no distingue claramente carril base y operativo                          | Una fila podría interpretarse por la función incorrecta.                                                               | El modelo futuro deberá declarar `lane` de forma obligatoria.                                                             |
| La estructura actual no representa adecuadamente vigencia, motivo y aprobación                  | Las excepciones pueden permanecer activas sin contexto de negocio.                                                     | Añadir ciclo de vida, justificación y auditoría en el diseño físico posterior.                                            |
| Las claves y alcances legacy contienen redundancias                                             | Pueden generar resultados engañosos o duplicados.                                                                      | Normalizar y consolidar únicamente durante AUTH-RBAC-026 y BLOQUE R.                                                      |
| Las RLS y funciones actuales no consumen una decisión unificada                                 | Una concesión podría funcionar en una superficie y no en otra.                                                         | No activar el dataset definitivo antes del BLOQUE E y de pruebas transversales.                                           |

#### 21. Invariantes

1. Toda concesión individual base pertenece a un trabajador humano concreto.
2. Toda concesión utiliza una clave canónica exacta.
3. No existen wildcards.
4. Toda concesión declara carril `BASE`.
5. `OPERATIONAL_ONLY` no admite concesión base.
6. `BASE_AND_OPERATIONAL` recibe únicamente componente base.
7. Una concesión individual no crea turno, check-in, rol operativo, sede activa ni área activa.
8. Una concesión positiva no restringe otra concesión positiva.
9. Una denegación aplicable prevalece sobre la concesión.
10. El alcance concedido no supera el máximo contractual del permiso.
11. `null` no equivale a global.
12. La sede seleccionada no autoriza.
13. El recurso real se resuelve en servidor.
14. Una concesión redundante no debe crearse.
15. Una necesidad estructural del rol se resuelve en la matriz del rol.
16. Una concesión temporal expira automáticamente.
17. Una concesión vencida o revocada no se elimina del historial.
18. Un trabajador inactivo no puede utilizar la concesión.
19. Un permiso inactivo no puede ser autorizado por una concesión vigente.
20. La identidad técnica de un dispositivo no recibe concesiones humanas.
21. APP-REVIEW no se incluye por tipo de sede.
22. La sensibilidad y segregación de funciones permanecen intactas.
23. El frontend no es fuente de verdad de alcance, vigencia o estado.
24. RPC, Server Actions, API y RLS deben producir la misma decisión.
25. Toda modificación es auditada.

#### 22. Criterios de aprobación

AUTH-RBAC-020 podrá aprobarse cuando se acepte expresamente que:

- las concesiones individuales base son excepciones positivas para trabajadores concretos;
- no constituyen un segundo rol ni una matriz paralela;
- 99 permisos admiten componente base y 13 permisos `OPERATIONAL_ONLY` quedan prohibidos;
- los permisos `BASE_AND_OPERATIONAL` reciben únicamente el componente base;
- una concesión positiva más específica no restringe un allow más amplio;
- las concesiones redundantes deben rechazarse;
- cada concesión declara permiso, carril, alcance, vigencia, motivo, solicitante, aprobador y auditoría;
- los alcances globales y permisos sensibles requieren aprobación reforzada;
- los datos legacy actuales no se consideran excepciones canónicas automáticamente;
- las concesiones operativas se reservan para AUTH-RBAC-021;
- las denegaciones se reservan para AUTH-RBAC-022;
- no se realiza implementación física durante esta tarea.

#### 23. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-RBAC-019 | APROBADA    |
| AUTH-RBAC-020 | APROBADA    |
| AUTH-RBAC-021 | NO INICIADA |

No se avanza a AUTH-RBAC-021 hasta recibir aprobación explícita.


### ✅ AUTH-RBAC-021 — Definir concesiones individuales operativas

#### 1. Identificación de la tarea

| Campo                     | Valor                                                               |
| ------------------------- | ------------------------------------------------------------------- |
| Bloque                    | BLOQUE D — Matrices canónicas de roles, excepciones y dispositivos  |
| Sección                   | Capas adicionales                                                   |
| Tarea                     | AUTH-RBAC-021 — Definir concesiones individuales operativas         |
| Estado                    | **APROBADA**                                                        |
| Naturaleza                | Definición documental de excepciones positivas del carril operativo |
| Implementación física     | No incluida                                                         |
| Catálogo evaluado         | 112 permisos canónicos vigentes                                     |
| Tarea anterior vigente    | AUTH-RBAC-020 — APROBADA                                            |
| Tarea posterior reservada | AUTH-RBAC-022 — Definir denegaciones individuales y transversales   |

Esta tarea no modifica Supabase, migraciones, tablas, RLS, RPC, aplicaciones, repositorios ni datasets físicos. La estructura definitiva y el dataset canónico de excepciones se definirán posteriormente en `AUTH-RBAC-026` y se implementarán únicamente en el BLOQUE R mediante migraciones versionadas en `vento-shell`.

#### 2. Objetivo

Definir cuándo, cómo y bajo qué límites un trabajador puede recibir una concesión individual positiva en el carril operativo para ejecutar una capacidad excepcional durante un contexto de trabajo válido, sin convertir la excepción en un segundo rol operativo, sin reconstruir una matriz incompleta, sin permitir operación permanente y sin evadir turno, check-in, sede, área, rol operativo, dispositivo, modalidad, alcance, sensibilidad, segregación de funciones o contrato de recurso.

#### 3. Decisión principal

Una concesión individual operativa es una excepción positiva, explícita, temporal o revisable, atribuida a un trabajador humano concreto y utilizable únicamente dentro de un contexto operativo compatible.

Su finalidad es añadir una capacidad puntual que:

- corresponde a una persona específica y no al rol completo;
- se utiliza únicamente durante un turno publicado y vigente;
- conserva el rol operativo efectivo del turno;
- se limita a sedes, áreas, recursos y estados aprobados;
- cumple el prerrequisito de check-in de la capacidad;
- tiene causa empresarial verificable;
- puede expirar o revocarse sin modificar la matriz del rol;
- no representa una sustitución informal de otro oficio completo.

```text
TRABAJADOR ACTIVO
+ TURNO PUBLICADO Y VIGENTE
+ ROL OPERATIVO EFECTIVO COMPATIBLE
+ CONCESIÓN INDIVIDUAL OPERATIVA VIGENTE
+ SEDE Y ÁREA OPERATIVAS COMPATIBLES
+ CHECK-IN CUANDO EL PERMISO LO EXIJA
+ RECURSO DENTRO DEL ALCANCE
+ SIN DENEGACIÓN APLICABLE
= OPERATIONAL_ALLOW INDIVIDUAL POSIBLE
```

No se admite:

```text
concesión individual operativa = segundo rol operativo
concesión individual operativa = permiso permanente sin turno
concesión individual operativa = sustituto de check-in
concesión individual operativa = cambio automático de sede o área
concesión individual operativa = acceso técnico del dispositivo
concesión individual operativa = paquete oculto de otro oficio
concesión individual operativa = permiso futuro todavía inexistente
```

#### 4. Relación con la matriz del rol operativo

Dentro del carril operativo, las concesiones positivas se combinan por unión:

```text
OPERATIONAL_ROLE_ALLOW
OR
EMPLOYEE_OPERATIONAL_ALLOW
=
OPERATIONAL_ALLOW POSIBLE
```

La unión solo se evalúa después de resolver un contexto operativo válido. La concesión individual no crea el contexto y no reemplaza el rol operativo efectivo.

| Situación                                                                                   | Resultado                                                                              |
| ------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| El rol operativo no concede el permiso y la excepción individual sí                         | La excepción puede autorizar dentro de su vigencia, rol compatible, alcance y recurso. |
| El rol operativo ya concede el mismo permiso y alcance                                      | Configuración redundante; no debe crearse.                                             |
| El rol concede un alcance más amplio y la excepción concede uno más estrecho                | La excepción no restringe el rol; no produce reducción efectiva.                       |
| El rol concede un alcance limitado y la excepción añade otro alcance compatible             | Se evalúa la unión sin superar el máximo contractual.                                  |
| El trabajador tiene turno, pero el rol operativo efectivo no es compatible con la excepción | La excepción no participa y la acción se deniega.                                      |
| Existe una denegación operativa o transversal aplicable                                     | La denegación prevalece conforme a AUTH-MOD-019 y AUTH-RBAC-022.                       |

Regla crítica:

> La concesión individual operativa amplía una capacidad del actor dentro de su contexto de trabajo; no transforma el contexto ni cambia el oficio que está ejecutando.

#### 5. Compatibilidad por modalidad

| `authorization_requirement` | ¿Admite concesión individual operativa? | Efecto                                                                                                       |
| --------------------------- | --------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `OPERATIONAL_ONLY`          | **SÍ**                                  | Puede producir una autorización completa del carril operativo si el contexto, alcance y recurso son válidos. |
| `BASE_OR_OPERATIONAL`       | **SÍ**                                  | Concede únicamente el carril operativo. No crea ni modifica el carril base.                                  |
| `BASE_AND_OPERATIONAL`      | **SÍ, SOLO COMO COMPONENTE OPERATIVO**  | No autoriza la acción por sí sola. Continúa siendo obligatorio un componente base válido.                    |
| `BASE_ONLY`                 | **NO**                                  | Una asignación operativa sería incompatible y deberá denegarse como configuración inválida.                  |

Resultado sobre el catálogo vigente:

| Clasificación                                | Cantidad |
| -------------------------------------------- | -------: |
| Permisos que admiten componente operativo    |       58 |
| `OPERATIONAL_ONLY`                           |       13 |
| `BASE_OR_OPERATIONAL`                        |       40 |
| `BASE_AND_OPERATIONAL`                       |        5 |
| Permisos `BASE_ONLY` prohibidos en esta capa |       54 |
| Total evaluado                               |      112 |

No es necesario repetir en esta tarea las 112 filas del catálogo: la elegibilidad se deriva exclusivamente de la modalidad canónica vigente. Una modalidad ausente, desconocida, retirada o legacy produce denegación.

#### 6. Prerrequisitos operativos inalterables

La concesión individual no modifica los prerrequisitos aprobados en AUTH-CAT-012 y AUTH-CAT-013.

Distribución vigente de los 58 permisos que admiten carril operativo:

| Prerrequisito            | Cantidad | Regla                                                                                                  |
| ------------------------ | -------: | ------------------------------------------------------------------------------------------------------ |
| Turno vigente (`T`)      |       19 | Puede consultarse o accederse durante un turno válido sin exigir check-in para esa capacidad concreta. |
| Turno y check-in (`T+C`) |       39 | Exige turno y sesión de check-in activa y coincidente.                                                 |
| Área activa requerida    |       31 | El turno debe contener un área operativa válida y compatible con el recurso.                           |
| Sede activa suficiente   |       27 | Puede evaluarse a nivel de sede cuando el contrato de la capacidad no exige área.                      |

Reglas:

1. Toda concesión individual operativa exige turno vigente.
2. Una capacidad `T+C` nunca podrá degradarse a `T`.
3. Un permiso con área requerida nunca podrá ejecutarse únicamente con sede.
4. El check-in debe coincidir con el turno, la sede y el actor.
5. El fin del turno retira inmediatamente la capacidad operativa.
6. El cierre del check-in retira las capacidades `T+C`.
7. La concesión puede estar vigente administrativamente y, aun así, no autorizar por ausencia de contexto.
8. El turno no concede por sí mismo el permiso.
9. El check-in no concede por sí mismo el permiso.

#### 7. Compatibilidad con el rol operativo efectivo

Toda concesión deberá declarar el conjunto de roles operativos con los que puede utilizarse.

La compatibilidad podrá expresarse mediante:

- un rol operativo exacto;
- varios roles operativos exactos;
- una familia de roles aprobada, únicamente cuando la semántica esté definida canónicamente;
- cualquier rol operativo, solo para capacidades genuinamente transversales y con aprobación reforzada.

Reglas:

1. La ausencia de restricción de rol no significa cualquier rol.
2. El rol activo del turno debe coincidir con la restricción aprobada.
3. Una excepción para `cajero_satelite` no se activa durante un turno de `barista_satelite`.
4. Una excepción para `bodeguero` no se activa durante un turno de `conductor_logistica`.
5. Un permiso de consulta transversal puede admitir varios roles únicamente si el recurso y la finalidad lo justifican.
6. Una responsabilidad que requiera casi toda la matriz de otro rol deberá resolverse asignando correctamente ese rol al turno, no copiando sus permisos como excepciones.

Regla de sustitución:

```text
COBERTURA DE UNA ACCIÓN PARTICULAR
→ CONCESIÓN INDIVIDUAL OPERATIVA

COBERTURA DEL OFICIO COMPLETO
→ ASIGNAR EL ROL OPERATIVO CORRECTO EN EL TURNO
```

#### 8. Usos válidos

Una concesión individual operativa puede utilizarse para:

1. **Capacidad excepcional dentro del mismo oficio**  
   Un trabajador requiere una acción adicional puntual compatible con su función principal.

2. **Cobertura temporal de una acción específica**  
   Sustitución breve por vacaciones, contingencia, entrenamiento o piloto, sin asumir todo el rol de otra persona.

3. **Responsabilidad operativa especializada**  
   Una persona concreta está capacitada para una tarea técnica adicional que no corresponde a todos los integrantes del rol.

4. **Acción sobre un recurso o ruta específica**  
   Capacidad limitada a una remisión, ruta, equipo, sede, área, lote, turno o conjunto aprobado.

5. **Componente operativo de una acción `BASE_AND_OPERATIONAL`**  
   Participación física o contextual necesaria para una acción sensible que además exige responsabilidad base.

6. **Piloto controlado**  
   Habilitación temporal para validar una capacidad antes de decidir si debe incorporarse a la matriz del rol.

#### 9. Usos prohibidos

No se utilizarán concesiones individuales operativas para:

- asignar permisos `BASE_ONLY`;
- operar sin turno publicado y vigente;
- omitir check-in cuando la capacidad sea `T+C`;
- conceder una sede o área no autorizada;
- cambiar el rol operativo efectivo del turno;
- convertir un trabajador en bodeguero, conductor, cajero, productor o receptor mediante un paquete de permisos;
- compensar permanentemente una matriz de rol incompleta;
- replicar en varios trabajadores una responsabilidad estructural del rol;
- crear wildcards, prefijos, acceso total a una aplicación o permisos no canónicos;
- utilizar `<app>.access` como sustituto de capacidades internas;
- autorizar capacidades futuras que todavía no tengan clave canónica activa;
- permitir a un dispositivo técnico actuar como beneficiario;
- conceder automáticamente acceso por conocer el PIN de un kiosco;
- evadir segregación de funciones, doble aprobación o reautenticación;
- utilizar una excepción para autoaprobar, autocorregir o confirmar la propia operación cuando el contrato exija otro actor;
- ampliar silenciosamente el alcance por urgencia, cargo informal o confianza personal.

#### 10. Alcance territorial y de recurso

Toda concesión individual operativa deberá declarar un alcance explícito compatible con el permiso y con el contexto activo.

Podrá utilizar únicamente las dimensiones aprobadas para la capacidad:

- sede operativa activa;
- sede específica;
- área operativa activa;
- área específica;
- tipo de área dentro de sedes autorizadas;
- recurso asignado al trabajador;
- recurso originado, preparado, transportado o recibido dentro de una relación aprobada;
- ruta, remisión, lote, orden, conteo, dispositivo o sesión exactos cuando corresponda.

Reglas obligatorias:

1. El alcance concedido nunca puede superar el alcance máximo del permiso.
2. `null` no significa global, todas las sedes ni cualquier área.
3. La sede seleccionada en la interfaz no autoriza.
4. El área seleccionada en la interfaz no autoriza.
5. La sede y el área deben proceder del turno y del contexto efectivo.
6. El recurso real debe resolverse en servidor.
7. Un recurso multisede debe validar origen, destino y actor según su contrato.
8. La excepción no permite consultar recursos semejantes no relacionados.
9. APP-REVIEW, demo y territorios aislados quedan excluidos salvo concesión separada y finalidad expresa.
10. Una concesión operativa organizacional o global está prohibida salvo que una capacidad futura defina expresamente ese alcance y supere aprobación reforzada.

#### 11. Vigencia y ciclo de vida

Toda concesión individual operativa deberá declarar:

- `effective_from`;
- `effective_until`;
- estado actual;
- motivo de creación;
- responsable solicitante;
- responsable aprobador;
- fecha de última revisión.

Estados conceptuales permitidos:

```text
DRAFT
PENDING_APPROVAL
SCHEDULED
ACTIVE
SUSPENDED
REVOKED
EXPIRED
REJECTED
```

Reglas:

- la vigencia indefinida no será el valor predeterminado;
- una concesión operativa permanente requiere justificación excepcional y revisión periódica;
- una concesión temporal expira automáticamente;
- no existe renovación silenciosa;
- extender la vigencia genera una nueva decisión auditada;
- una concesión futura no participa antes de `effective_from`;
- una concesión vencida permanece en historial, pero no autoriza;
- una concesión suspendida o revocada invalida caché y sesiones de autorización;
- desactivar al trabajador produce denegación estructural;
- desactivar el permiso o la aplicación invalida la concesión;
- cambiar los roles compatibles, sedes, áreas o funciones del trabajador dispara revisión obligatoria.

#### 12. Contrato documental mínimo

Cada concesión individual operativa deberá conservar como mínimo:

| Campo conceptual               | Regla                                                                               |
| ------------------------------ | ----------------------------------------------------------------------------------- |
| `employee_id`                  | Trabajador humano exacto y activo.                                                  |
| `permission_code`              | Clave canónica exacta, activa y sin wildcard.                                       |
| `lane`                         | Siempre `OPERATIONAL`.                                                              |
| `effect`                       | Siempre `ALLOW` dentro de esta tarea. Las denegaciones se definen en AUTH-RBAC-022. |
| `compatible_operational_roles` | Uno o más roles operativos exactos compatibles.                                     |
| `scope_type`                   | Tipo de alcance permitido por el permiso.                                           |
| `scope_mode`                   | Modo explícito cuando el alcance use tipos o conjuntos.                             |
| `scope_site_id`                | Sede específica cuando corresponda.                                                 |
| `scope_area_id`                | Área específica cuando corresponda.                                                 |
| `scope_area_kind`              | Tipo de área cuando el permiso lo admita.                                           |
| `resource_constraint`          | Restricción de propiedad, asignación, relación o conjunto.                          |
| `effective_from`               | Inicio de vigencia.                                                                 |
| `effective_until`              | Fin de vigencia; obligatorio salvo excepción estable aprobada.                      |
| `reason_code`                  | Causa normalizada.                                                                  |
| `justification`                | Explicación humana verificable.                                                     |
| `requested_by`                 | Actor que solicita.                                                                 |
| `approved_by`                  | Actor autorizado que aprueba.                                                       |
| `created_by` / `updated_by`    | Trazabilidad de mantenimiento.                                                      |
| `source_reference`             | Acta, contingencia, capacitación, proyecto o evidencia de origen.                   |
| `reviewed_at`                  | Última revisión administrativa.                                                     |
| `revoked_at` / `revoked_by`    | Trazabilidad de revocación.                                                         |

La estructura física definitiva podrá usar tablas separadas o una tabla unificada de asignaciones. La semántica anterior es obligatoria independientemente del diseño físico.

#### 13. Flujo de aprobación

```text
SOLICITUD JUSTIFICADA
        ↓
VALIDAR TRABAJADOR Y NECESIDAD PARTICULAR
        ↓
VALIDAR PERMISO Y CARRIL OPERATIVO
        ↓
COMPROBAR MATRIZ DEL ROL Y REDUNDANCIA
        ↓
DEFINIR ROLES OPERATIVOS COMPATIBLES
        ↓
VALIDAR TURNO, CHECK-IN, ÁREA Y RECURSO REQUERIDOS
        ↓
EVALUAR SENSIBILIDAD Y SEGREGACIÓN
        ↓
APROBACIÓN AUTORIZADA
        ↓
ACTIVACIÓN O PROGRAMACIÓN
        ↓
REVISIÓN, EXPIRACIÓN O REVOCACIÓN
```

Controles mínimos:

1. El solicitante no se autoaprueba.
2. El beneficiario no aprueba su propia concesión.
3. La persona que administra técnicamente el registro no adquiere autoridad empresarial para aprobarlo.
4. Las capacidades sensibles o `BASE_AND_OPERATIONAL` requieren aprobación reforzada.
5. La aprobación debe comprobar el resultado efectivo, no solo la fila solicitada.
6. Debe verificarse si la responsabilidad corresponde realmente a otro rol operativo.
7. Debe comprobarse que la excepción no produzca una combinación incompatible de funciones.
8. Debe definirse una fecha de revisión antes de activar concesiones de vigencia amplia.

#### 14. Sensibilidad y segregación de funciones

La concesión individual no reduce la sensibilidad canónica del permiso.

Cuando la capacidad sea sensible, deberán conservarse según corresponda:

- reautenticación fuerte;
- motivo obligatorio;
- evidencia adjunta;
- aprobación dual;
- separación entre preparador, transportador, receptor, verificador y aprobador;
- separación entre creador, ejecutor y corrector;
- control de versión del recurso;
- idempotencia;
- auditoría reforzada;
- revisión posterior.

Para permisos `BASE_AND_OPERATIONAL`:

```text
BASE_ALLOW VÁLIDO
+ EMPLOYEE_OPERATIONAL_ALLOW O ROLE_OPERATIONAL_ALLOW
+ CONTEXTO OPERATIVO VÁLIDO
+ CONTROLES SENSIBLES
+ SIN DENY
= ACCIÓN POSIBLE
```

La concesión individual operativa no aporta el componente base.

Casos especialmente restringidos:

- ajustes de inventario;
- entradas excepcionales;
- aprobación o resolución de variaciones;
- confirmaciones excepcionales de entrega.

La misma persona no podrá crear artificialmente ambos carriles mediante autoaprobación ni utilizar la excepción para aprobar su propia evidencia cuando el contrato exija segregación.

#### 15. Dependencias y acceso a aplicaciones

Una concesión sobre una acción interna no concede automáticamente `<app>.access`.

Cuando el catálogo declare una dependencia explícita:

```text
PERMISO INTERNO
requiere
<app>.access
```

ambos permisos deberán resultar autorizados en el carril compatible.

No se infiere dependencia por compartir prefijo. Tampoco se permite crear un paquete oculto bajo una sola excepción.

Ejemplo:

```text
conceder nexo.inventory.remissions.dispatch
≠ conceder nexo.access automáticamente
```

Ambas decisiones deben estar representadas y auditadas por separado cuando sean necesarias.

#### 16. Dispositivos compartidos

Una concesión individual operativa puede utilizarse desde un dispositivo compartido únicamente cuando:

- el dispositivo está activo;
- la aplicación está permitida en el dispositivo;
- el actor humano está identificado;
- la sesión del actor está vigente;
- el turno y check-in cumplen el contrato;
- el rol operativo efectivo es compatible;
- la sede y área del dispositivo coinciden;
- la capacidad está permitida para ese tipo de dispositivo conforme a AUTH-RBAC-023.

El dispositivo:

- no recibe la concesión;
- no transfiere la concesión entre trabajadores;
- no mantiene el permiso después de cerrar la sesión del actor;
- no convierte `navigation_role` en autorización;
- no permite ejecutar acciones como usuario técnico.

#### 17. Relación con otras capas

| Capa                      | Relación con la concesión individual operativa                                                     |
| ------------------------- | -------------------------------------------------------------------------------------------------- |
| Rol operativo             | Fuente independiente de allows dentro del mismo carril.                                            |
| Concesión individual base | Se define en AUTH-RBAC-020 y no es creada por esta capa.                                           |
| Denegación operativa      | Prevalece sobre este allow cuando coincide.                                                        |
| Bloqueo transversal       | Prevalece sobre ambos carriles.                                                                    |
| Turno                     | Siempre obligatorio.                                                                               |
| Check-in                  | Obligatorio cuando el permiso sea `T+C`.                                                           |
| Rol operativo efectivo    | Debe ser compatible con la excepción.                                                              |
| Sede y área               | Se resuelven desde el contexto, no desde selección frontend.                                       |
| Dispositivo compartido    | Puede restringir o impedir el uso; nunca amplía la concesión.                                      |
| Simulación                | Puede calcular un resultado hipotético, pero no activar la concesión.                              |
| RLS, RPC y servidor       | Deben evaluar la misma excepción, contexto, alcance, recurso y denegaciones.                       |
| Caché                     | Debe invalidarse ante activación, suspensión, revocación, expiración, check-out o cambio de turno. |

#### 18. Prevención de redundancias y excepciones masivas

Antes de crear una concesión deberá calcularse el permiso operativo efectivo del trabajador para los roles compatibles.

La creación se rechazará como redundante cuando:

- la matriz del rol ya concede la misma clave con el mismo alcance;
- la matriz del rol ya concede un alcance que contiene completamente el solicitado;
- otra concesión individual activa ya cubre el mismo permiso, roles y alcance;
- dos aliases legacy se normalizan hacia la misma clave canónica;
- la concesión no produce ninguna capacidad adicional verificable.

Una excepción repetida en varios trabajadores o mantenida indefinidamente para compensar una omisión deberá generar revisión de la matriz del rol.

```text
NECESIDAD GENERAL DEL ROL
→ CORREGIR MATRIZ OPERATIVA

NECESIDAD PARTICULAR DEL TRABAJADOR
→ CONCESIÓN INDIVIDUAL OPERATIVA

NECESIDAD DE EJECUTAR OTRO OFICIO COMPLETO
→ ASIGNAR OTRO ROL OPERATIVO AL TURNO
```

#### 19. Relación con el estado legacy

La auditoría no encontró una capa canónica de concesiones operativas individuales diferenciada por carril.

El estado actual mezcla:

- permisos individuales en `employee_permissions` sin campo de carril;
- permisos de rol operativo en `operational_role_permissions`;
- roles base legacy que todavía conceden acciones operativas permanentes;
- funciones separadas que pueden consultar fuentes distintas.

Decisión para la transición:

1. Ninguna fila legacy se interpretará como concesión operativa individual automáticamente.
2. Toda fila deberá normalizarse hacia permiso canónico, carril, roles compatibles, alcance, vigencia y justificación.
3. Las asignaciones redundantes frente al rol se retirarán del dataset futuro.
4. Los permisos operativos conservados en roles base legacy no se migrarán como excepciones individuales.
5. Las identidades técnicas y dispositivos no podrán convertirse en beneficiarios humanos.
6. Una fila sin intención verificable se clasificará como `legacy_grant_unresolved` y no autorizará hasta revisión.
7. La limpieza física no se ejecuta en esta tarea.

#### 20. Ejemplos válidos

##### Ejemplo A — Capacidad puntual de entrega

```text
Trabajador: operador_integral_satelite
Permiso: futura clave atómica de entrega ordinaria
Carril: OPERATIONAL
Rol compatible: operador_integral_satelite
Alcance: sede integrada activa
Vigencia: periodo de piloto
```

Resultado: solo será posible cuando la clave exista en el catálogo, tenga modalidad operativa aprobada y se cumplan turno, contexto y recurso. La brecha actual no autoriza la acción.

##### Ejemplo B — Consulta logística temporal

```text
Trabajador: bodeguero
Permiso: nexo.logistics.operations.view
Modalidad: BASE_OR_OPERATIONAL
Carril concedido: OPERATIONAL
Rol compatible: bodeguero
Alcance: operaciones relacionadas con la sede activa
Vigencia: dos semanas
```

Resultado: permite consulta operativa dentro del alcance; no concede despacho, tránsito ni recepción.

##### Ejemplo C — Componente operativo de doble condición

```text
Trabajador: gerente con turno de gerencia_operativa
Permiso: nexo.inventory.adjustments.register
Modalidad: BASE_AND_OPERATIONAL
Concesión individual: componente OPERATIONAL
Alcance: sede y área activas
```

Resultado: no puede registrar el ajuste sin componente base válido, check-in, evidencia, recurso compatible y segregación.

##### Ejemplo D — Capacidad especializada dentro de bodega

```text
Trabajador: bodeguero
Permiso: nexo.inventory.stock_validations.perform
Modalidad: OPERATIONAL_ONLY
Rol compatible: bodeguero
Alcance: área de bodega activa
Vigencia: entrenamiento supervisado
```

Resultado: puede ejecutar validaciones durante el contexto autorizado. No puede aprobar diferencias ni registrar ajustes.

#### 21. Ejemplos inválidos

##### Ejemplo E — Permiso base en el carril operativo

```text
Permiso: viso.workforce.employees.update
Modalidad: BASE_ONLY
Concesión solicitada: OPERATIONAL
```

Resultado: **DENEGAR — incompatible_assignment_lane**.

##### Ejemplo F — Sustitución completa de rol

```text
Trabajador con turno de barista_satelite
recibe 30 permisos individuales de bodeguero
```

Resultado: inválido. Debe programarse un turno con el rol `bodeguero` si realmente cubrirá ese oficio.

##### Ejemplo G — Sin check-in

```text
Permiso T+C
Turno válido
Sin check-in activo
```

Resultado: **DENEGAR — active_checkin_required**.

##### Ejemplo H — Rol incompatible

```text
Excepción compatible con conductor_logistica
Turno actual: cocinero_satelite
```

Resultado: **DENEGAR — incompatible_operational_role**.

##### Ejemplo I — Permiso futuro inexistente

```text
Responsabilidad: registrar prueba de entrega
Clave canónica actual: inexistente
```

Resultado: **DENEGAR POR DEFECTO**. La responsabilidad deberá convertirse primero en una capacidad atómica mediante una nueva versión del catálogo.

#### 22. Auditoría obligatoria

Deberán generarse eventos para:

```text
individual_operational_grant_requested
individual_operational_grant_approved
individual_operational_grant_rejected
individual_operational_grant_scheduled
individual_operational_grant_activated
individual_operational_grant_used
individual_operational_grant_blocked
individual_operational_grant_updated
individual_operational_grant_suspended
individual_operational_grant_reactivated
individual_operational_grant_revoked
individual_operational_grant_expired
individual_operational_grant_redundancy_detected
individual_operational_grant_conflict_detected
```

Cada evento deberá registrar como mínimo:

- actor efectivo;
- trabajador beneficiario;
- permiso exacto;
- carril operativo;
- rol operativo efectivo;
- roles compatibles configurados;
- turno y check-in;
- sede y área activas;
- alcance y recurso;
- vigencia;
- motivo;
- referencia de origen;
- estado anterior y nuevo;
- solicitante;
- aprobador;
- dispositivo cuando corresponda;
- fecha de servidor;
- resultado de validación de redundancia;
- conflictos o denegaciones detectadas.

#### 23. Tratamiento de permisos todavía inexistentes

Las responsabilidades identificadas durante las matrices que no cuentan con una clave atómica vigente se consideran **brechas contractuales**, no permisos implícitos.

Flujo obligatorio:

```text
BRECHA DOCUMENTADA EN UNA MATRIZ O PROCESO
        ↓
DEFINIR PROCESO, ACTOR, ACCIÓN Y APLICACIÓN PROPIETARIA
        ↓
CREAR PROPUESTA DE PERMISO ATÓMICO
        ↓
DEFINIR MODALIDAD, ALCANCE, TURNO, CHECK-IN, ÁREA,
DISPOSITIVO, SIMULACIÓN, SENSIBILIDAD Y RECURSO
        ↓
APROBAR NUEVA VERSIÓN DEL CATÁLOGO
        ↓
REVISAR MATRICES Y EXCEPCIONES AFECTADAS
        ↓
GENERAR DATASETS CANÓNICOS
        ↓
IMPLEMENTAR EN VENTO-SHELL Y REPOSITORIO PROPIETARIO
        ↓
MIGRACIÓN VERSIONADA EN VENTO-SHELL CUANDO AFECTE SUPABASE
        ↓
PRUEBAS, STAGING, ROLLBACK Y ACTUALIZACIÓN DOCUMENTAL
```

Reglas:

1. Una brecha identificada no equivale a una capacidad ya aprobada.
2. El nombre preliminar escrito en una matriz no constituye una clave canónica.
3. No se reutilizará un permiso amplio para cubrir una acción ausente.
4. Todo permiso nuevo inicia denegado en matrices y excepciones hasta evaluación expresa.
5. Una capacidad nueva puede exigir reabrir la matriz de uno o varios roles.
6. La implementación física solo ocurre en las fases de implementación y, si afecta Supabase, mediante migración documentada en `vento-shell`.

#### 24. Brechas contractuales identificadas

| Brecha                                                                                             | Impacto                                                                                                        | Decisión                                                                                                                     |
| -------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| El catálogo no contiene una capacidad atómica para administrar concesiones operativas individuales | No existe un permiso empresarial exacto para crear, aprobar, suspender o revocar estas excepciones desde VISO. | Crear capacidades de gobierno específicas antes de implementar la interfaz.                                                  |
| `employee_permissions` no distingue carril base y operativo                                        | Una fila podría utilizarse por la función incorrecta.                                                          | El modelo futuro deberá declarar `lane` obligatoriamente.                                                                    |
| La estructura actual no vincula una excepción con roles operativos compatibles                     | Una capacidad podría activarse durante un oficio no relacionado.                                               | Incorporar restricción obligatoria de rol o familia canónica.                                                                |
| La estructura actual no representa vigencia, motivo y aprobación                                   | Las excepciones pueden permanecer activas sin causa verificable.                                               | Añadir ciclo de vida, justificación y auditoría en el diseño físico posterior.                                               |
| Las funciones actuales no consumen una decisión unificada                                          | La excepción podría funcionar en una superficie y fallar en otra.                                              | No activar el dataset definitivo antes del BLOQUE E y de pruebas transversales.                                              |
| Varias responsabilidades operativas identificadas no tienen permiso atómico                        | No pueden asignarse todavía a roles ni individuos.                                                             | Definirlas en el roadmap funcional y de autorización de la aplicación propietaria, versionar el catálogo y revisar matrices. |

#### 25. Invariantes

1. Toda concesión individual operativa pertenece a un trabajador humano concreto.
2. Toda concesión utiliza una clave canónica exacta y activa.
3. No existen wildcards.
4. Toda concesión declara carril `OPERATIONAL`.
5. `BASE_ONLY` no admite concesión operativa.
6. `BASE_AND_OPERATIONAL` recibe únicamente componente operativo.
7. Toda concesión exige turno publicado y vigente.
8. Las capacidades `T+C` exigen check-in activo y coincidente.
9. La concesión no crea ni cambia el rol operativo.
10. El rol operativo efectivo debe ser compatible.
11. La concesión no crea sede ni área activas.
12. El alcance concedido no supera el máximo contractual.
13. `null` no equivale a global.
14. La sede seleccionada no autoriza.
15. El recurso real se resuelve en servidor.
16. Una concesión positiva no restringe otra concesión positiva.
17. Una denegación aplicable prevalece.
18. Una concesión redundante no debe crearse.
19. Una necesidad estructural se resuelve en la matriz del rol.
20. La cobertura de otro oficio completo se resuelve asignando el rol correcto.
21. Una concesión temporal expira automáticamente.
22. Una concesión vencida o revocada no se elimina del historial.
23. Un trabajador inactivo no puede utilizarla.
24. Un permiso inactivo no puede autorizarse.
25. Una identidad técnica o dispositivo no recibe concesiones humanas.
26. Un dispositivo puede restringir, pero nunca ampliar.
27. APP-REVIEW no se incluye por coincidencia de tipo.
28. La sensibilidad y segregación permanecen intactas.
29. Un permiso futuro inexistente permanece denegado.
30. RPC, Server Actions, API y RLS deben producir la misma decisión.
31. El fin del turno o check-in invalida inmediatamente la capacidad correspondiente.
32. Toda modificación y uso relevante queda auditado.

#### 26. Impacto sobre tareas posteriores

| Tarea                               | Impacto                                                                                               |
| ----------------------------------- | ----------------------------------------------------------------------------------------------------- |
| AUTH-RBAC-022                       | Definirá denegaciones de carril y bloqueos transversales que prevalecen sobre estas concesiones.      |
| AUTH-RBAC-023                       | Determinará qué capacidades operativas pueden ejecutarse desde cada dispositivo compartido.           |
| AUTH-RBAC-026                       | Proyectará concesiones base, operativas y denegaciones en un dataset canónico versionado.             |
| AUTH-RBAC-027                       | Verificará que ninguna excepción produzca acceso operativo global accidental.                         |
| BLOQUE E                            | Diseñará la decisión unificada que combina rol, excepción, contexto, recurso y denegaciones.          |
| BLOQUE E2 y roadmaps por aplicación | Convertirán las brechas funcionales en procesos y permisos atómicos propuestos.                       |
| BLOQUE E3                           | Definirá la estructura objetivo y transición de Supabase.                                             |
| BLOQUE R                            | Implementará datasets, backfills, funciones, RLS, RPC y migraciones versionadas en `vento-shell`.     |
| BLOQUE QA                           | Probará expiración, cambio de turno, check-out, manipulación de recursos, segregación y denegaciones. |

#### 27. Criterios de aprobación

AUTH-RBAC-021 podrá aprobarse cuando se acepte expresamente que:

- las concesiones individuales operativas son excepciones positivas para trabajadores concretos;
- no constituyen un segundo rol operativo ni un paquete de otro oficio;
- 58 permisos admiten componente operativo y 54 permisos `BASE_ONLY` quedan prohibidos;
- toda concesión exige turno válido;
- los 39 permisos `T+C` continúan exigiendo check-in;
- los 31 permisos con área requerida continúan exigiendo área activa;
- el rol operativo efectivo debe ser compatible con la excepción;
- los permisos `BASE_AND_OPERATIONAL` reciben únicamente el componente operativo;
- una concesión positiva más específica no restringe un allow más amplio;
- las concesiones redundantes deben rechazarse;
- cada concesión declara permiso, carril, roles compatibles, alcance, vigencia, motivo, solicitante, aprobador y auditoría;
- las capacidades futuras inexistentes permanecen denegadas hasta crear y aprobar una nueva versión del catálogo;
- las denegaciones se reservan para AUTH-RBAC-022;
- no se realiza implementación física durante esta tarea.

#### 28. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-RBAC-020 | APROBADA    |
| AUTH-RBAC-021 | APROBADA    |
| AUTH-RBAC-022 | NO INICIADA |

No se avanza a AUTH-RBAC-022 hasta recibir aprobación explícita.


### ✅ AUTH-RBAC-022 — Definir denegaciones individuales y transversales

**Estado:** APROBADA 
**Bloque:** BLOQUE D — Matrices canónicas de roles, excepciones y dispositivos  
**Naturaleza:** Definición documental de denegaciones explícitas aplicables a trabajadores  
**Implementación física:** No incluida  
**Catálogo evaluado:** 112 permisos canónicos vigentes  
**Tarea anterior vigente:** AUTH-RBAC-021 — APROBADA  
**Tarea posterior reservada:** AUTH-RBAC-023 — Definir capacidades permitidas por dispositivo compartido

Esta tarea no modifica Supabase, migraciones, tablas, RLS, RPC, aplicaciones, repositorios, guards, dispositivos ni datasets físicos.

La implementación posterior deberá materializarse mediante `AUTH-RBAC-026`, el modelo de decisión unificado del BLOQUE E y migraciones versionadas en `vento-shell` dentro del BLOQUE R.

---

#### 1. Objetivo

Definir el contrato canónico para restringir capacidades que un trabajador podría recibir mediante:

- su rol base;
- una concesión individual base;
- su rol operativo;
- una concesión individual operativa;
- una combinación `BASE_OR_OPERATIONAL`;
- una combinación `BASE_AND_OPERATIONAL`.

La denegación deberá permitir retirar una capacidad exacta sin:

- modificar silenciosamente la matriz completa de un rol;
- convertir la ausencia de concesión en un bloqueo explícito;
- mezclar los carriles base y operativo;
- depender de la interfaz;
- utilizar nombres de rol como bypass;
- crear permisos negativos por prefijo o wildcard;
- ignorar el recurso y su territorio real.

---

#### 2. Decisión principal

Vento OS distinguirá cuatro causas diferentes de resultado negativo:

```text
DEFAULT_DENY
→ no existe una concesión aplicable completa

CONTEXT_DENY
→ falta o es inválido un prerrequisito del permiso

LANE_DENY
→ existe una denegación individual explícita en BASE u OPERATIONAL

ACTOR_WIDE_DENY
→ existe una denegación individual transversal para la clave exacta

STRUCTURAL_DENY
→ una condición estructural impide cualquier autorización compatible
```

La precedencia permanece:

```text
STRUCTURAL_DENY
>
ACTOR_WIDE_DENY
>
LANE_DENY
>
ALLOW
>
DEFAULT_DENY
```

Regla definitiva:

```text
UNA CONCESIÓN INDIVIDUAL
NO PUEDE VENCER
UNA DENEGACIÓN APLICABLE
```

La especificidad territorial determina si una denegación coincide con el recurso.

No determina que un `allow` más específico pueda vencerla.

---

#### 3. Base normativa

Esta propuesta conserva sin cambios:

- ADR-AUTH-001 — Modelo canónico de identidad, contexto y autorización;
- AUTH-MOD-001 — Actor efectivo;
- AUTH-MOD-002 — Separación entre rol base y rol operativo;
- AUTH-MOD-007 y AUTH-MOD-008 — Sede y área;
- AUTH-MOD-009 y AUTH-MOD-010 — Turno y check-in;
- AUTH-MOD-011 — Dispositivos compartidos;
- AUTH-MOD-018 — Combinación de carriles;
- AUTH-MOD-019 — Denegación explícita;
- AUTH-CAT-001 a AUTH-CAT-019 — Catálogo canónico de 112 permisos;
- AUTH-RBAC-001 a AUTH-RBAC-019 — Matrices de roles;
- AUTH-RBAC-020 — Concesiones individuales base;
- AUTH-RBAC-021 — Concesiones individuales operativas.

Reglas heredadas obligatorias:

```text
DENY APLICABLE
=
PERMISO EXACTO
∩
SUJETO COINCIDENTE
∩
CARRIL COINCIDENTE
∩
VIGENCIA ACTIVA
∩
ALCANCE COINCIDENTE
∩
RECURSO DENTRO DEL ALCANCE
```

```text
SIN ALLOW APLICABLE
→ DEFAULT_DENY
```

```text
RECURSO AMBIGUO O NO RESUELTO
→ DENEGAR
```

---

#### 4. Alcance de AUTH-RBAC-022

Esta tarea define:

- denegación individual del carril base;
- denegación individual del carril operativo;
- bloqueo individual transversal por permiso exacto;
- relación con las cuatro modalidades de autorización;
- alcance territorial y contractual de la denegación;
- vigencia, activación, expiración y revocación;
- motivos y evidencia mínima;
- aprobación y segregación de funciones;
- conflictos y superposición entre varias denegaciones;
- comportamiento frente a dispositivos compartidos y simulación;
- transición de posibles datos legacy;
- información mínima que deberá contener el dataset de AUTH-RBAC-026.

Esta tarea no define:

- denegaciones técnicas de infraestructura;
- suspensión de cuentas de Supabase Auth;
- desactivación de trabajadores;
- bloqueo de dispositivos completos;
- matrices positivas de roles;
- nuevos permisos;
- claves negativas por aplicación o módulo;
- políticas físicas de RLS;
- funciones SQL;
- estructura definitiva de tablas;
- interfaz final de VISO;
- retención física de auditoría;
- flujos disciplinarios o laborales.

---

#### 5. Clases canónicas de denegación

##### 5.1 `STRUCTURAL_DENY`

Bloqueo producido por una condición que hace inválida cualquier autorización compatible.

Ejemplos:

- actor efectivo inexistente;
- trabajador inactivo;
- aplicación inactiva;
- permiso inexistente, retirado o inactivo;
- modalidad ausente;
- recurso irresoluble o ambiguo;
- aislamiento obligatorio de APP-REVIEW;
- violación de una regla estructural de seguridad;
- inexistencia del principal de recuperación requerido.

Reglas:

- no es una excepción individual administrada mediante `employee_permissions`;
- no se neutraliza con roles, allows ni excepciones;
- no requiere una fila negativa por cada permiso;
- deberá producir razones estructuradas y auditables;
- su solución consiste en corregir el estado estructural, no en crear un override.

##### 5.2 `LANE_DENY`

Denegación individual que bloquea un permiso exacto únicamente dentro de uno de los carriles:

```text
BASE
OPERATIONAL
```

Variantes:

```text
BASE_LANE_DENY
OPERATIONAL_LANE_DENY
```

Ejemplos:

- trabajador que conserva su rol administrativo, pero no puede aprobar una capacidad financiera concreta;
- trabajador operativo temporalmente impedido para registrar ajustes;
- colaborador que puede consultar una aplicación administrativamente, pero no ejecutar una función operativa específica;
- restricción limitada a una sede o área determinada.

Reglas:

- no bloquea automáticamente el carril contrario;
- solo puede aplicarse a un carril compatible con la modalidad del permiso;
- no elimina ni modifica la concesión positiva de origen;
- se evalúa después de las denegaciones transversales y antes de los allows del carril;
- cualquier deny aplicable vence todos los allows del mismo carril.

##### 5.3 `ACTOR_WIDE_DENY`

Bloqueo individual transversal para un permiso exacto.

Afecta todos los carriles compatibles de la modalidad del permiso.

Ejemplo:

```text
permission_key = nexo.inventory.adjustments.register
subject = trabajador X
deny_class = ACTOR_WIDE_DENY
```

Resultado:

```text
concesión por rol base        → bloqueada
concesión individual base     → bloqueada
concesión por rol operativo   → bloqueada
concesión operativa individual→ bloqueada
```

Reglas:

- no bloquea otras claves de permiso;
- no acepta prefijos;
- no acepta `*`;
- no acepta un nombre de aplicación como sustituto de permisos;
- no equivale a suspender al trabajador;
- deberá utilizarse únicamente cuando la restricción deba mantenerse sin importar el carril por el que pudiera autorizarse la capacidad.

---

#### 6. Clases que no se crean en esta tarea

No se crean denegaciones positivas o negativas asociadas automáticamente a:

- un rol base completo;
- un rol operativo completo;
- una familia de roles;
- una aplicación completa;
- un módulo completo;
- un prefijo de permisos;
- todos los trabajadores de una sede;
- todos los trabajadores de un área;
- un dispositivo compartido.

Para modificar lo que un rol recibe ordinariamente deberá modificarse la matriz canónica correspondiente y versionar el dataset.

```text
CAPACIDAD QUE NINGÚN MIEMBRO DEL ROL DEBE TENER
→ corregir la matriz del rol

CAPACIDAD QUE UN TRABAJADOR CONCRETO NO DEBE EJERCER
→ crear deny individual
```

Los bloqueos propios del dispositivo se definirán en `AUTH-RBAC-023`.

---

#### 7. Compatibilidad con las modalidades de autorización

| Modalidad              | `BASE_LANE_DENY` | `OPERATIONAL_LANE_DENY` | `ACTOR_WIDE_DENY` | Resultado relevante                                                                      |
| ---------------------- | ---------------: | ----------------------: | ----------------: | ---------------------------------------------------------------------------------------- |
| `BASE_ONLY`            |               Sí |                      No |                Sí | un deny base o transversal bloquea la clave                                              |
| `OPERATIONAL_ONLY`     |               No |                      Sí |                Sí | un deny operativo o transversal bloquea la clave                                         |
| `BASE_OR_OPERATIONAL`  |               Sí |                      Sí |                Sí | un lane deny deja disponible el otro carril; actor-wide bloquea ambos                    |
| `BASE_AND_OPERATIONAL` |               Sí |                      Sí |                Sí | negar cualquiera de los carriles bloquea la autorización final; actor-wide bloquea ambos |

Validación cuantitativa sobre la versión vigente:

```text
PERMISOS CANÓNICOS                         112
COMPATIBLES CON BASE_LANE_DENY             99
COMPATIBLES CON OPERATIONAL_LANE_DENY      58
COMPATIBLES CON ACTOR_WIDE_DENY           112
```

Desglose de modalidades:

```text
BASE_ONLY               54
OPERATIONAL_ONLY        13
BASE_OR_OPERATIONAL     40
BASE_AND_OPERATIONAL     5
TOTAL                   112
```

Una asignación de deny incompatible con la modalidad:

```text
→ no se activa
→ se clasifica como configuración inválida
→ produce alerta administrativa
→ no amplía el efecto del deny
```

---

#### 8. Efecto sobre permisos híbridos

##### 8.1 `BASE_OR_OPERATIONAL`

Un lane deny afecta únicamente su carril.

```text
BASE_LANE_DENY
+
OPERATIONAL_ALLOW VÁLIDO
=
ALLOW POR CARRIL OPERATIVO
```

```text
OPERATIONAL_LANE_DENY
+
BASE_ALLOW VÁLIDO
=
ALLOW POR CARRIL BASE
```

```text
ACTOR_WIDE_DENY
+
CUALQUIER ALLOW
=
EXPLICIT_DENY
```

##### 8.2 `BASE_AND_OPERATIONAL`

Ambos carriles son obligatorios.

```text
BASE_LANE_DENY
+
OPERATIONAL_ALLOW
=
EXPLICIT_DENY
```

```text
BASE_ALLOW
+
OPERATIONAL_LANE_DENY
=
EXPLICIT_DENY
```

```text
ACTOR_WIDE_DENY
=
EXPLICIT_DENY
```

No existe autorización parcial para un permiso `BASE_AND_OPERATIONAL`.

---

#### 9. Permiso exacto obligatorio

Toda denegación deberá almacenar una `permission_key` canónica exacta y activa.

Permitido:

```text
nexo.inventory.adjustments.register
```

Prohibido:

```text
nexo.*
nexo.inventory.*
inventory.adjustments
NEXO
all_sensitive_permissions
```

Una denegación sobre `app.access` afecta exclusivamente la capacidad exacta de entrada a la aplicación.

No sustituye la autorización servidor de las capacidades internas.

```text
APP ACCESS DENEGADO
≠
PERMISOS INTERNOS AUTOMÁTICAMENTE DENEGADOS
```

Cuando se requiera suspender completamente el acceso de un trabajador deberá utilizarse el mecanismo estructural correspondiente —por ejemplo, desactivación laboral o bloqueo de identidad— y no crear cientos de denies individuales.

---

#### 10. Sujeto de la denegación

Las denegaciones de esta tarea tienen como sujeto exclusivo:

```text
employee_id
```

El trabajador deberá:

- existir;
- pertenecer al dominio laboral;
- estar identificado de forma inequívoca;
- no depender de nombre, correo o rol como identificador;
- conservar el historial aunque después quede inactivo.

No se utilizará como sujeto:

- `auth.uid()` sin resolver trabajador;
- rol base;
- rol operativo;
- sede;
- área;
- plantilla de dispositivo;
- usuario técnico del dispositivo;
- cliente de Vento Pass;
- service role.

El actor afectado no podrá crear, aprobar, modificar, revocar ni neutralizar su propia denegación.

---

#### 11. Alcance de la denegación

Toda denegación deberá declarar un alcance explícito.

Valores conceptuales admitidos:

| Alcance             | Significado                                                                                      |
| ------------------- | ------------------------------------------------------------------------------------------------ |
| `GLOBAL_PERMISSION` | bloquea la clave exacta sobre todos los recursos compatibles                                     |
| `ORGANIZATION`      | bloquea la clave en una organización o unidad empresarial concreta                               |
| `SITE`              | bloquea la clave en una sede concreta                                                            |
| `AREA`              | bloquea la clave en un área concreta                                                             |
| `SITE_TYPE`         | bloquea la clave en sedes del tipo exacto definido                                               |
| `AREA_KIND`         | bloquea la clave en áreas del tipo exacto dentro de una cobertura superior explícita             |
| `RESOURCE`          | bloquea la clave sobre un recurso empresarial exacto                                             |
| `RELATION`          | bloquea la clave cuando el actor mantiene una relación concreta con el recurso, origen o destino |

Reglas:

1. `null` no significa todas las sedes o áreas.
2. `GLOBAL_PERMISSION` debe declararse expresamente.
3. `AREA_KIND` requiere la cobertura superior necesaria.
4. Una denegación por sede no se interpreta como global.
5. Una denegación por tipo no incluye tipos parecidos.
6. La sede seleccionada no modifica la denegación.
7. El área seleccionada no modifica la denegación.
8. El recurso real se resuelve en el servidor.
9. Un origen o destino bloqueado puede bloquear la operación completa cuando ambos son obligatorios.
10. El contrato de recurso del permiso define qué dimensiones deben compararse.

---

#### 12. Especificidad territorial

La especificidad sirve para decidir si una denegación coincide con el recurso.

Ejemplo:

```text
DENY EN SEDE VENTO_CAFE
+
RECURSO DE SAUDO
=
DENY NO APLICABLE
```

```text
DENY GLOBAL DE LA CLAVE
+
ALLOW LIMITADO A UN ÁREA
=
DENY APLICABLE
```

No se adoptará esta regla:

```text
allow más específico > deny más general
```

La regla correcta será:

```text
si el deny coincide con el recurso
→ deny prevalece
```

---

#### 13. Operaciones con múltiples territorios o recursos

Cuando una acción afecte:

- origen y destino;
- varias sedes;
- varias áreas;
- varios lotes;
- varios productos;
- varios trabajadores;
- varios documentos relacionados;

la evaluación deberá realizarse sobre todos los recursos requeridos.

```text
DENY APLICABLE EN CUALQUIER RECURSO OBLIGATORIO
→ DENEGAR LA OPERACIÓN COMPLETA
```

Solo podrá existir ejecución parcial cuando el contrato de la acción la permita expresamente y la respuesta identifique qué elementos fueron aceptados o rechazados.

---

#### 14. Vigencia

Toda denegación deberá declarar:

- `effective_from`;
- `effective_until` o una justificación de vigencia indefinida;
- zona horaria canónica;
- estado de ciclo de vida;
- fecha de revisión cuando corresponda.

Estados conceptuales:

```text
DRAFT
SCHEDULED
ACTIVE
REVOKED
EXPIRED
REJECTED
```

Reglas:

- un borrador no bloquea;
- una denegación programada bloquea únicamente al iniciar su vigencia;
- la expiración se valida al autorizar y no depende exclusivamente de un cron;
- una denegación revocada conserva historial;
- una denegación vencida no se elimina físicamente;
- modificar una denegación activa deberá producir una nueva versión o evento auditable;
- una denegación indefinida requiere justificación reforzada y revisión periódica.

---

#### 15. Motivos permitidos

Toda denegación deberá incluir un `reason_code` estructurado.

Categorías conceptuales permitidas:

```text
SEGREGATION_OF_DUTIES
TEMPORARY_RESPONSIBILITY_RESTRICTION
TRAINING_OR_CERTIFICATION_REQUIRED
SECURITY_INCIDENT
CREDENTIAL_OR_IDENTITY_RISK
INVESTIGATION_HOLD
DATA_PROTECTION_RESTRICTION
FINANCIAL_CONTROL_RESTRICTION
OPERATIONAL_SAFETY_RESTRICTION
CONTRACTUAL_RESTRICTION
OTHER_APPROVED
```

Reglas:

- `OTHER_APPROVED` exige explicación obligatoria;
- la explicación no deberá almacenar datos laborales, disciplinarios, médicos o personales innecesarios;
- el motivo visible para el trabajador puede ser una versión segura y resumida;
- la evidencia confidencial deberá permanecer en el sistema propietario correspondiente, no dentro del permiso;
- el motivo no podrá quedar vacío para una denegación activa.

---

#### 16. Casos de uso válidos

##### Caso A — Segregación financiera

Un trabajador puede consultar comprobantes, pero no cancelar facturas internas.

```text
employee_id = trabajador
permission_key = nexo.finance.internal_invoices.cancel
deny_class = BASE_LANE_DENY
scope = ORGANIZATION
reason_code = SEGREGATION_OF_DUTIES
```

##### Caso B — Restricción operativa temporal

Un bodeguero conserva su rol, pero no puede registrar ajustes mientras completa una certificación o revisión.

```text
permission_key = nexo.inventory.adjustments.register
deny_class = OPERATIONAL_LANE_DENY
scope = SITE o AREA
effective_until = fecha definida
```

##### Caso C — Bloqueo transversal de una capacidad sensible

Un trabajador no puede ejecutar una clave sensible por ningún carril durante una investigación de seguridad.

```text
permission_key = pulso.delivery.deliveries.override
deny_class = ACTOR_WIDE_DENY
scope = GLOBAL_PERMISSION
```

##### Caso D — Restricción territorial

Un gerente puede cancelar remisiones dentro de su cobertura, excepto en una sede concreta durante una transición controlada.

```text
permission_key = nexo.inventory.remissions.cancel
deny_class = BASE_LANE_DENY
scope = SITE
```

---

#### 17. Casos de uso inválidos

No se utilizarán denegaciones para:

- representar que el trabajador no recibió un permiso;
- corregir una matriz de rol mal diseñada;
- sustituir la desactivación de un trabajador;
- sustituir la eliminación o corrección de un turno;
- sustituir el cierre de check-in;
- ocultar una aplicación defectuosa;
- impedir una transición de estado que debe validar el recurso;
- resolver stock insuficiente;
- aplicar límites monetarios o cuantitativos propios del proceso;
- bloquear una ruta frontend sin proteger la acción servidor;
- suspender una sede completa;
- bloquear un dispositivo compartido;
- crear un override universal;
- impedir permanentemente toda operación mediante cientos de filas individuales.

---

#### 18. Relación con concesiones individuales

##### 18.1 Concesión individual base

```text
BASE_ALLOW INDIVIDUAL
+
BASE_LANE_DENY APLICABLE
=
EXPLICIT_DENY EN BASE
```

##### 18.2 Concesión individual operativa

```text
OPERATIONAL_ALLOW INDIVIDUAL
+
OPERATIONAL_LANE_DENY APLICABLE
=
EXPLICIT_DENY EN OPERATIONAL
```

##### 18.3 Concesión posterior

Crear un allow después de crear un deny no neutraliza el deny.

##### 18.4 Revocación del deny

Revocar o expirar un deny:

```text
NO CONCEDE EL PERMISO
```

La autorización solo será posible si continúa existiendo una concesión positiva compatible y todos los demás requisitos son válidos.

---

#### 19. Relación con roles

Los roles continúan siendo fuentes positivas de responsabilidad.

```text
ROL BASE
→ puede producir BASE_ALLOW

ROL OPERATIVO
→ puede producir OPERATIONAL_ALLOW
```

Las denegaciones individuales restringen al trabajador concreto.

No modifican la matriz del rol para otros trabajadores.

Un rol no puede utilizarse como sujeto de `ACTOR_WIDE_DENY` dentro de esta tarea.

---

#### 20. Relación con dispositivo compartido

El dispositivo nunca anula una denegación.

```text
ACTOR IDENTIFICADO EN DISPOSITIVO
+
PERMISO COMPATIBLE CON DISPOSITIVO
+
DENY APLICABLE AL ACTOR
=
DENEGAR
```

La sesión del dispositivo deberá conservar:

- actor efectivo;
- permiso evaluado;
- deny aplicable;
- motivo de bloqueo seguro;
- auditoría.

El usuario técnico del dispositivo no podrá recibir una excepción para ignorar denies del trabajador.

Las restricciones propias de dispositivo se definirán en `AUTH-RBAC-023`.

---

#### 21. Relación con simulación

La simulación puede mostrar el resultado hipotético de una denegación cuando el permiso admite simulación.

Reglas:

- una simulación no crea, revoca ni ignora denegaciones;
- simular otro rol no elimina las denegaciones del sujeto simulado;
- el actor real conserva sus propios permisos para consultar la simulación;
- los detalles confidenciales del motivo deberán enmascararse;
- una simulación nunca convierte `would_allow` en autorización ejecutable.

---

#### 22. Gobernanza y aprobación

Toda denegación activa deberá tener:

- solicitante identificado;
- aprobador autorizado;
- sujeto afectado;
- clave exacta;
- clase de deny;
- carril cuando aplique;
- alcance;
- vigencia;
- motivo;
- evidencia o referencia documental cuando corresponda;
- fecha de creación;
- fecha de aprobación;
- auditoría de cambios.

Reglas de segregación:

1. El trabajador afectado no puede aprobarla ni revocarla.
2. Un aprobador no podrá usar la denegación para ampliar sus propias capacidades.
3. Las denegaciones sensibles, globales o transversales requerirán revisión reforzada.
4. Las denegaciones que afecten propietarios, gerentes generales o capacidades de recuperación requerirán gobierno especial.
5. La activación deberá comprobar que permanece al menos un principal válido de recuperación de seguridad.
6. No existirá un permiso universal para ignorar denegaciones.
7. Las emergencias deberán usar capacidades específicas y producir revisión posterior.

---

#### 23. Prevención de bloqueo organizacional

Antes de activar una denegación sobre capacidades de seguridad o recuperación deberá verificarse:

```text
AL MENOS UN PRINCIPAL DE RECUPERACIÓN VÁLIDO
```

No se permitirá una combinación que deje sin actores capaces de:

- administrar propietarios;
- recuperar acceso de seguridad;
- revocar denegaciones críticas;
- restaurar la administración del catálogo;
- atender una emergencia autorizada.

Resultado de validación fallida:

```text
security_recovery_principal_required
→ no activar la denegación
```

---

#### 24. Conflictos y superposición

##### 24.1 Duplicado exacto

No podrán existir dos denegaciones activas idénticas para:

```text
employee_id
permission_key
deny_class
lane
scope
resource constraint
periodo coincidente
```

##### 24.2 Superposición válida

Pueden coexistir:

- un deny de sede y otro de recurso;
- un deny operativo y uno transversal;
- periodos consecutivos;
- restricciones con motivos diferentes, cuando exista necesidad aprobada.

##### 24.3 Evaluación

Si coinciden varias denegaciones:

- se aplican todas las que correspondan;
- la decisión final permanece `DENY`;
- se registra la clase de mayor precedencia como razón primaria;
- se conservan todos los `deny_id` coincidentes para auditoría;
- no se selecciona un allow para compensarlas.

##### 24.4 Conflicto administrativo

Una superposición incoherente deberá generar:

```text
deny_conflict_detected
```

La detección de conflicto no autoriza la operación.

---

#### 25. Contrato conceptual mínimo

El dataset canónico y la estructura física futura deberán poder representar como mínimo:

```text
ExplicitDeny
├── deny_id
├── employee_id
├── permission_key
├── deny_class
├── authorization_lane
├── scope_type
├── organization_id
├── site_id
├── site_type
├── area_id
├── area_kind
├── resource_type
├── resource_id
├── relation_type
├── effective_from
├── effective_until
├── status
├── reason_code
├── reason_note
├── evidence_reference
├── requested_by
├── approved_by
├── created_by
├── created_at
├── updated_by
├── updated_at
├── revoked_by
├── revoked_at
├── revocation_reason
└── version
```

La implementación física podrá normalizar este contrato en más de una tabla, pero no podrá perder su semántica.

---

#### 26. Validación de integridad

Toda creación o actualización deberá validar:

- trabajador existente;
- permiso canónico exacto y activo;
- clase de deny válida;
- carril compatible con la modalidad;
- alcance coherente;
- sede y área existentes y activas;
- pertenencia del área a la sede;
- recurso válido cuando aplique;
- vigencia no contradictoria;
- motivo obligatorio;
- aprobador autorizado;
- sujeto distinto del aprobador cuando corresponda;
- ausencia de duplicado exacto;
- conservación del principal de recuperación;
- imposibilidad de wildcard;
- imposibilidad de neutralización por el propio sujeto.

Ante ambigüedad:

```text
NO ACTIVAR LA DENEGACIÓN
+
REGISTRAR CONFIGURACIÓN INVÁLIDA
```

Esto evita que una configuración ambigua bloquee silenciosamente toda la organización.

---

#### 27. Orden canónico de evaluación

La decisión deberá seguir este orden:

1. Resolver principal autenticado.
2. Resolver actor efectivo.
3. Validar identidad laboral.
4. Validar trabajador activo.
5. Validar aplicación.
6. Validar permiso.
7. Resolver modalidad.
8. Resolver recurso real.
9. Resolver territorio real.
10. Evaluar `STRUCTURAL_DENY`.
11. Evaluar `ACTOR_WIDE_DENY`.
12. Evaluar carril base cuando corresponda.
13. Evaluar `BASE_LANE_DENY`.
14. Evaluar allows base.
15. Resolver contexto operativo cuando corresponda.
16. Evaluar `OPERATIONAL_LANE_DENY`.
17. Evaluar allows operativos.
18. Combinar carriles según la modalidad.
19. Validar prerrequisitos restantes.
20. Producir decisión final.
21. Registrar auditoría.

No será válido evaluar primero los allows y omitir una búsqueda posterior de denies.

---

#### 28. Respuesta de autorización

Una decisión afectada por denegación deberá devolver como mínimo:

```text
allowed = false
decision = DENY
deny_class
deny_source
deny_scope
deny_reason_code
authorization_lane
blocked_reasons
decision_id
```

No será suficiente devolver solamente:

```text
false
```

La interfaz deberá distinguir:

- ausencia de concesión;
- contexto operativo inválido;
- denegación individual por carril;
- bloqueo transversal;
- bloqueo estructural;
- recurso fuera de alcance.

Los detalles confidenciales del motivo no deberán exponerse al cliente sin autorización específica.

---

#### 29. Aplicación obligatoria en todas las superficies

La misma decisión deberá aplicarse en:

- guards;
- Server Actions;
- Route Handlers;
- RPC;
- funciones SQL;
- políticas RLS;
- jobs;
- procesos con service role;
- dispositivos compartidos;
- navegación;
- componentes;
- exportaciones;
- impresión;
- integraciones.

Regla:

```text
PANTALLA OCULTA
≠
OPERACIÓN PROTEGIDA
```

Las mutaciones y lecturas sensibles deberán volver a evaluar la denegación en el servidor.

---

#### 30. Caché e invalidación

Una denegación activada, revocada o expirada deberá invalidar cualquier caché de autorización afectada.

No se permitirá que:

- una sesión iniciada antes del deny conserve la capacidad;
- una aplicación use permisos cargados al iniciar sesión como fuente definitiva;
- un dispositivo compartido mantenga un actor autorizado después del bloqueo;
- una revocación tarde indefinidamente en surtir efecto.

La estrategia técnica exacta se definirá en el BLOQUE E y en la implementación.

---

#### 31. Auditoría

Toda decisión afectada por un deny deberá registrar:

- principal autenticado;
- actor efectivo;
- trabajador afectado;
- aplicación;
- permiso;
- modalidad;
- carril;
- recurso;
- sede;
- área;
- deny aplicable;
- clase;
- alcance;
- motivo estructurado;
- creador;
- aprobador;
- inicio de vigencia;
- decisión final;
- fecha de evaluación.

Eventos administrativos mínimos:

```text
deny_created
deny_scheduled
deny_approved
deny_activated
deny_updated
deny_revoked
deny_expired
deny_rejected
deny_conflict_detected
deny_recovery_risk_detected
```

---

#### 32. Estado legacy y transición

Estado conocido:

```text
role_permissions
→ solo concesiones positivas conocidas

employee_permissions
→ 17 concesiones redundantes
→ 0 denegaciones funcionales confirmadas

operational_role_permissions
→ solo concesiones positivas conocidas
```

Por tanto:

- no existe una denegación individual vigente que deba preservarse automáticamente;
- las 17 filas actuales de `employee_permissions` no se convertirán en denies;
- un valor legacy `is_allowed = false` no se activará automáticamente;
- toda fila negativa histórica ambigua se clasificará como `legacy_deny_unresolved`;
- deberá revisarse manualmente su intención, carril, alcance, vigencia y motivo;
- la implementación deberá separar claramente allows y denies, aunque físicamente puedan compartir una estructura normalizada.

---

#### 33. Dataset posterior

`AUTH-RBAC-026` deberá definir el dataset canónico de:

- concesiones individuales base;
- concesiones individuales operativas;
- denegaciones individuales base;
- denegaciones individuales operativas;
- bloqueos individuales transversales;
- vigencias;
- alcances;
- motivos;
- estados de transición legacy.

Esta tarea define el contrato.

No crea todavía filas para trabajadores concretos.

Toda denegación real deberá surgir de una necesidad empresarial aprobada y no de una suposición documental.

---

#### 34. Impacto sobre tareas posteriores

| Tarea                                  | Impacto                                                                                             |
| -------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `AUTH-RBAC-023`                        | deberá garantizar que el dispositivo nunca amplíe permisos ni ignore denies del actor efectivo      |
| revisión contractual previa a datasets | deberá analizar si nuevas claves requieren reglas específicas de deny                               |
| `AUTH-RBAC-024`                        | conservará las matrices base como fuentes positivas; no incorporará bloqueos individuales           |
| `AUTH-RBAC-025`                        | conservará las matrices operativas como fuentes positivas; no incorporará bloqueos individuales     |
| `AUTH-RBAC-026`                        | materializará el dataset canónico de excepciones y denegaciones                                     |
| `AUTH-RBAC-027`                        | verificará que las excepciones y denies no produzcan acceso operativo global accidental             |
| `AUTH-RBAC-028`                        | confirmará que los denies base no conviertan funciones administrativas en dependientes del check-in |
| BLOQUE E                               | implementará la decisión unificada, las razones estructuradas y la precedencia                      |
| VISO                                   | deberá administrar solicitudes, aprobaciones, vigencia, conflictos, revocación y auditoría          |
| BLOQUE R                               | implementará estructuras, backfills, migraciones, pruebas y rollback en `vento-shell`               |

---

#### 35. Riesgos controlados

##### Riesgo 1 — Usar deny para corregir matrices deficientes

Control:

```text
corregir matriz del rol
≠
crear cientos de denies individuales
```

##### Riesgo 2 — Wildcards

Control:

```text
permission_key exacta obligatoria
```

##### Riesgo 3 — Bloqueo total accidental

Control:

```text
principal de recuperación obligatorio
```

##### Riesgo 4 — Allow específico vence deny global

Control:

```text
cualquier deny aplicable vence el allow del carril
```

##### Riesgo 5 — Motivos sensibles expuestos

Control:

```text
reason_code estructurado
+
notas confidenciales separadas
```

##### Riesgo 6 — Deny vencido sigue bloqueando

Control:

```text
vigencia evaluada en cada autorización
```

##### Riesgo 7 — Frontend como única protección

Control:

```text
servidor + RPC + RLS + guards
```

##### Riesgo 8 — Dispositivo ignora deny

Control:

```text
actor efectivo conserva sus denies en la sesión compartida
```

##### Riesgo 9 — Revocar deny concede permiso

Control:

```text
se vuelve a evaluar el allow positivo y el contexto
```

##### Riesgo 10 — Datos legacy ambiguos

Control:

```text
legacy_deny_unresolved
→ revisión manual
```

---

#### 36. Invariantes

1. Toda autorización se deniega por defecto.
2. Ausencia de allow no equivale a deny explícito.
3. Toda denegación utiliza una clave exacta.
4. No existen wildcards de deny.
5. No existe jerarquía implícita entre permisos.
6. Un deny no concede ninguna capacidad.
7. Un deny estructural no puede ser anulado por permisos.
8. Un actor-wide deny afecta todos los carriles compatibles de la clave.
9. Un lane deny afecta únicamente su carril.
10. Un deny aplicable vence cualquier allow de su carril.
11. Una concesión individual no vence una denegación.
12. Un allow específico no vence un deny global aplicable.
13. La especificidad determina coincidencia, no precedencia.
14. Un deny no aplica fuera de su alcance.
15. La sede seleccionada no altera la denegación.
16. El área seleccionada no altera la denegación.
17. El recurso real se resuelve en el servidor.
18. `null` no significa global.
19. Una denegación por sede no es global.
20. Una denegación por tipo no incluye tipos parecidos.
21. Los roles no crean bloqueos transversales dentro de esta tarea.
22. Un rol base no deniega automáticamente la operación.
23. Un rol operativo no deniega automáticamente la administración.
24. `BASE_OR_OPERATIONAL` conserva independencia entre carriles salvo actor-wide deny.
25. `BASE_AND_OPERATIONAL` falla si cualquiera de sus carriles queda denegado.
26. El actor afectado no puede neutralizar su propia denegación.
27. El dispositivo restringe; nunca elimina denies.
28. La simulación no elimina denies.
29. El service role no es un bypass universal.
30. Revocar un deny no crea un allow.
31. Las denegaciones vencidas conservan trazabilidad.
32. Debe mantenerse al menos un principal de recuperación válido.
33. Los datos legacy ambiguos no se activan automáticamente.
34. Toda decisión sensible debe ser explicable y auditable.
35. Toda implementación física derivada se versionará en `vento-shell`.

---

#### 37. Validaciones finales

| Validación                                          | Resultado |
| --------------------------------------------------- | --------: |
| Permisos canónicos considerados                     |       112 |
| Modalidades consideradas                            |         4 |
| Permisos compatibles con deny base                  |        99 |
| Permisos compatibles con deny operativo             |        58 |
| Permisos compatibles con bloqueo transversal exacto |       112 |
| Wildcards permitidos                                |         0 |
| Bypasses por nombre de rol                          |         0 |
| Denegaciones legacy confirmadas                     |         0 |
| Clases de deny administradas en esta tarea          |         2 |
| Variantes de carril                                 |         2 |
| Condiciones estructurales conservadas               |        Sí |
| Implementación física realizada                     |        No |

Aclaración:

```text
CLASES ADMINISTRADAS
├── LANE_DENY
│   ├── BASE_LANE_DENY
│   └── OPERATIONAL_LANE_DENY
└── ACTOR_WIDE_DENY

STRUCTURAL_DENY
→ forma parte de la decisión canónica
→ no se crea como excepción individual en esta tarea
```

---

#### 38. Criterios de aprobación

AUTH-RBAC-022 podrá aprobarse cuando se acepte expresamente que:

1. la ausencia de concesión continúa siendo `DEFAULT_DENY`, no deny explícito;
2. las denegaciones individuales solo afectan trabajadores concretos;
3. `LANE_DENY` puede bloquear únicamente BASE u OPERATIONAL;
4. `ACTOR_WIDE_DENY` bloquea la clave exacta en todos sus carriles compatibles;
5. `STRUCTURAL_DENY` no se administra como excepción individual;
6. toda denegación utiliza una clave exacta y no admite wildcards;
7. la modalidad determina qué lanes pueden ser denegados;
8. los 99 permisos con carril base admiten deny base;
9. los 58 permisos con carril operativo admiten deny operativo;
10. las 112 claves admiten bloqueo transversal exacto;
11. un deny aplicable prevalece sobre todos los allows de su carril;
12. un allow más específico no vence un deny aplicable;
13. el recurso y el territorio reales se resuelven en el servidor;
14. toda denegación tiene alcance, vigencia, motivo, solicitante y aprobador;
15. el trabajador no puede neutralizar su propia denegación;
16. se conserva al menos un principal de recuperación de seguridad;
17. el dispositivo compartido no ignora los denies del actor;
18. revocar o expirar un deny no concede automáticamente el permiso;
19. los posibles denies legacy ambiguos se mantienen inactivos hasta revisión;
20. `AUTH-RBAC-026` definirá los datos concretos y el BLOQUE R implementará el modelo mediante migraciones de `vento-shell`.

---

#### 39. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-RBAC-020 | APROBADA    |
| AUTH-RBAC-021 | APROBADA    |
| AUTH-RBAC-022 | APROBADA    |
| AUTH-RBAC-023 | NO INICIADA |

No se avanza a `AUTH-RBAC-023` hasta recibir aprobación expresa.


### ✅ AUTH-RBAC-023 — Definir capacidades permitidas por dispositivo compartido

**Estado:** APROBADA 
**Bloque:** BLOQUE D — Matrices canónicas de roles, excepciones y dispositivos  
**Naturaleza:** Definición documental de matriz restrictiva de plantillas e instancias de dispositivo compartido  
**Implementación física:** No incluida  
**Catálogo evaluado:** 112 permisos canónicos vigentes  
**Tarea anterior vigente:** AUTH-RBAC-022 — APROBADA  
**Tarea posterior reservada:** AUTH-RBAC-024 — Definir dataset canónico de matriz base

Esta tarea no modifica Supabase, migraciones, tablas, RLS, RPC, aplicaciones, plantillas físicas, dispositivos, repositorios ni datasets desplegados.

La implementación posterior deberá materializarse mediante el contexto unificado del BLOQUE E, la auditoría y arquitectura objetivo del BLOQUE E3 y migraciones versionadas en `vento-shell` dentro del BLOQUE R.

---

#### 1. Objetivo

Definir el límite máximo de capacidades que puede intentar ejecutar un actor humano desde cada clase de dispositivo compartido, sin convertir la identidad técnica, la plantilla, la aplicación instalada, el PIN o el rol de navegación en una concesión empresarial.

La tarea debe resolver simultáneamente:

- qué plantillas canónicas de dispositivo existen;
- qué aplicaciones puede presentar cada plantilla;
- qué claves exactas forman el techo restrictivo de cada plantilla;
- qué política de actor, sede, área y recurso debe satisfacer cada sesión;
- cuáles acciones exigen reautenticación fuerte;
- qué ocurre con plantillas, políticas y dispositivos legacy;
- cómo se versionan las plantillas sin ampliar silenciosamente la autoridad;
- cómo se cruzan la matriz del actor y la matriz del dispositivo.

---

#### 2. Decisión principal

Un dispositivo compartido será un **filtro restrictivo versionado**. No será una fuente de permisos.

```text
PERMISO EFECTIVO DEL ACTOR
∩ CLAVE EXACTA ADMITIDA POR LA PLANTILLA
∩ APLICACIÓN ADMITIDA POR LA INSTANCIA
∩ POLÍTICA DE ACTOR SATISFECHA
∩ SEDE, ÁREA Y RECURSO COMPATIBLES
∩ SESIÓN DE ACTOR VIGENTE
∩ REAUTENTICACIÓN FUERTE CUANDO APLIQUE
∩ AUSENCIA DE DENEGACIONES
= CAPACIDAD EJECUTABLE DESDE EL DISPOSITIVO
```

Regla definitiva:

```text
DISPOSITIVO PERMITE
≠
ACTOR TIENE PERMISO
```

El dispositivo solo puede producir uno de estos efectos:

- conservar una capacidad que el actor ya posee y cuyo contexto es válido;
- exigir una condición adicional;
- restringir el territorio o el recurso;
- bloquear una capacidad;
- exigir reautenticación fuerte;
- impedir que una aplicación o acción aparezca en ese terminal.

Nunca podrá ampliar el carril base u operativo del actor.

---

#### 3. Base normativa

Esta propuesta conserva sin cambios:

- ADR-AUTH-001 — Modelo canónico de identidad, contexto y autorización;
- AUTH-MOD-001 — Actor efectivo;
- AUTH-MOD-002 — Separación entre rol base y rol operativo;
- AUTH-MOD-007 y AUTH-MOD-008 — Sede y área;
- AUTH-MOD-009 y AUTH-MOD-010 — Turno y check-in;
- AUTH-MOD-011 — Dispositivo compartido;
- AUTH-MOD-018 y AUTH-MOD-019 — Combinación de carriles y denegaciones;
- AUTH-CAT-001 a AUTH-CAT-019 — Catálogo de 112 permisos y sus propiedades;
- AUTH-RBAC-001 a AUTH-RBAC-019 — Matrices base y operativas;
- AUTH-RBAC-020 y AUTH-RBAC-021 — Concesiones individuales;
- AUTH-RBAC-022 — Denegaciones individuales y transversales.

Invariantes heredados:

> El dispositivo no tiene turno; el trabajador sí.

> El dispositivo puede restringir, pero nunca conceder.

> La sesión de actor no es un login personal completo ni un check-in laboral.

> El PIN ligero identifica al actor, pero no satisface `STRONG_REAUTH_REQUIRED`.

> Ningún permiso `NOT_ALLOWED` puede formar parte de una plantilla.

---

#### 4. Alcance de AUTH-RBAC-023

Esta tarea define:

- plantillas canónicas objetivo;
- modo de sesión permitido por plantilla;
- aplicaciones permitidas;
- paquetes exactos de claves permitidas;
- políticas de actor compatibles;
- restricciones por sede, área, vehículo o recurso;
- comportamiento de `STANDARD` y `STRONG`;
- herencia entre plantilla e instancia;
- tratamiento de las dos instancias actuales;
- corrección o retiro de las seis plantillas legacy auditadas;
- datos mínimos que deberá exponer el contrato futuro de dispositivo.

Esta tarea no define:

- PIN, passkey, MFA o proveedor técnico definitivo;
- duración numérica de sesiones;
- estructura física definitiva de tablas;
- implementación de heartbeat o modo offline;
- interfaz definitiva del launcher;
- nuevos permisos funcionales;
- nuevas concesiones para roles;
- creación inmediata de dispositivos;
- aplicación física de cambios legacy;
- política de gestión de equipos personales no compartidos.

---

#### 5. Resultado cuantitativo

| Elemento                               | Cantidad | Decisión                                                                                    |
| -------------------------------------- | -------: | ------------------------------------------------------------------------------------------- |
| Permisos canónicos evaluados           |      112 | Se conserva íntegramente AUTH-CAT-014.                                                      |
| `STANDARD_ACTOR_SESSION`               |       52 | Techo global compatible con sesión ordinaria; no todos se incluyen en todas las plantillas. |
| `STRONG_REAUTH_REQUIRED`               |       40 | Techo global compatible únicamente con reautenticación fuerte y plantilla autorizada.       |
| `NOT_ALLOWED`                          |       20 | Excluidos de todas las plantillas.                                                          |
| Plantillas objetivo                    |       14 | Cada una tiene apps, política, territorio y paquetes exactos.                               |
| Plantilla legacy retirada              |        1 | `production_center`, sustituida por tres plantillas de área.                                |
| Dispositivos reales auditados          |        2 | Se conservan como instancias, pero requieren correcciones antes de considerarse conformes.  |
| Permisos concedidos por un dispositivo |        0 | El dispositivo nunca concede.                                                               |
| Wildcards permitidos                   |        0 | Toda capacidad se referencia por clave exacta.                                              |

---

#### 6. Capas de configuración

##### 6.1 Plantilla

Define el máximo reutilizable:

- código y versión;
- tipo de terminal;
- modo de sesión;
- aplicaciones máximas;
- paquetes exactos de permisos;
- política de actor;
- compatibilidad con reautenticación fuerte;
- restricciones territoriales requeridas;
- comportamiento de bloqueo y limpieza.

##### 6.2 Instancia

Vincula la plantilla con un equipo físico:

- `device_id`;
- usuario técnico;
- sede y área exactas;
- vehículo o recurso vinculado, cuando corresponda;
- versión de plantilla fijada;
- aplicaciones deshabilitadas;
- permisos retirados localmente;
- estado de activación;
- soporte real de reautenticación fuerte.

La instancia puede **reducir**, nunca ampliar, la plantilla.

##### 6.3 Sesión de actor

Vincula temporalmente:

```text
DISPOSITIVO
+ EMPLEADO
+ MODO DE SESIÓN
+ INICIO Y EXPIRACIÓN
+ CONTEXTO RESUELTO
```

Solo puede existir un actor efectivo por dispositivo en un instante.

##### 6.4 Decisión por acción

La autorización se recalcula en servidor para la clave y el recurso exactos. No se deriva de una pantalla cargada, una app visible o una decisión cacheada.

---

#### 7. Regla de herencia plantilla → instancia

La semántica canónica será:

```text
APPS EFECTIVAS
= APPS DE LA PLANTILLA
− APPS DESHABILITADAS EN LA INSTANCIA

PERMISOS EFECTIVOS DEL DISPOSITIVO
= PERMISOS EXACTOS DE LA PLANTILLA
− PERMISOS RETIRADOS EN LA INSTANCIA
```

No se permite:

- añadir una aplicación desde la instancia;
- añadir una clave desde la instancia;
- cambiar `NOT_ALLOWED` a permitido;
- bajar `STRONG` a `STANDARD`;
- sustituir una clave por un permiso más amplio;
- activar una plantilla nueva sin versión y aprobación;
- aplicar silenciosamente una nueva versión a dispositivos existentes.

Cada instancia queda fijada a una versión concreta. Un cambio de versión requiere despliegue controlado y rollback.

---

#### 8. Paquetes exactos de capacidades

Los siguientes paquetes son agrupaciones documentales reutilizables. **No son permisos, roles, wildcards ni fuentes de autorización.** Cada paquete enumera claves exactas y queda versionado.

##### DEVICE-SHELL-CORE-v1

**Total:** 1 claves exactas — `1` STANDARD, `0` STRONG, `0` NOT_ALLOWED.

| Permiso exacto | Compatibilidad compartida |
| -------------- | ------------------------- |
| `shell.access` | `STANDARD`                |

##### DEVICE-SATELLITE-REQUESTER-v1

**Total:** 11 claves exactas — `10` STANDARD, `1` STRONG, `0` NOT_ALLOWED.

| Permiso exacto                       | Compatibilidad compartida |
| ------------------------------------ | ------------------------- |
| `nexo.access`                        | `STANDARD`                |
| `nexo.catalog.products.view`         | `STANDARD`                |
| `nexo.catalog.presentations.view`    | `STANDARD`                |
| `nexo.catalog.request_policies.view` | `STANDARD`                |
| `nexo.catalog.categories.view`       | `STANDARD`                |
| `nexo.catalog.units.view`            | `STANDARD`                |
| `nexo.inventory.remissions.view`     | `STANDARD`                |
| `nexo.inventory.remissions.update`   | `STRONG`                  |
| `nexo.inventory.remissions.request`  | `STANDARD`                |
| `nexo.logistics.supply_routes.view`  | `STANDARD`                |
| `pulso.access`                       | `STANDARD`                |

##### DEVICE-INTEGRATED-SATELLITE-v1

**Total:** 12 claves exactas — `11` STANDARD, `1` STRONG, `0` NOT_ALLOWED.

| Permiso exacto                       | Compatibilidad compartida |
| ------------------------------------ | ------------------------- |
| `nexo.access`                        | `STANDARD`                |
| `nexo.catalog.products.view`         | `STANDARD`                |
| `nexo.catalog.presentations.view`    | `STANDARD`                |
| `nexo.catalog.request_policies.view` | `STANDARD`                |
| `nexo.catalog.categories.view`       | `STANDARD`                |
| `nexo.catalog.units.view`            | `STANDARD`                |
| `nexo.inventory.remissions.view`     | `STANDARD`                |
| `nexo.inventory.remissions.update`   | `STRONG`                  |
| `nexo.inventory.remissions.request`  | `STANDARD`                |
| `nexo.inventory.remissions.receive`  | `STANDARD`                |
| `nexo.logistics.supply_routes.view`  | `STANDARD`                |
| `pulso.access`                       | `STANDARD`                |

##### DEVICE-PRODUCTION-CORE-v1

**Total:** 16 claves exactas — `16` STANDARD, `0` STRONG, `0` NOT_ALLOWED.

| Permiso exacto                           | Compatibilidad compartida |
| ---------------------------------------- | ------------------------- |
| `fogo.access`                            | `STANDARD`                |
| `fogo.production.batches.view`           | `STANDARD`                |
| `fogo.production.batches.create`         | `STANDARD`                |
| `fogo.production.orders.view`            | `STANDARD`                |
| `fogo.production.recipe_book.view`       | `STANDARD`                |
| `nexo.access`                            | `STANDARD`                |
| `nexo.catalog.products.view`             | `STANDARD`                |
| `nexo.catalog.presentations.view`        | `STANDARD`                |
| `nexo.catalog.categories.view`           | `STANDARD`                |
| `nexo.catalog.units.view`                | `STANDARD`                |
| `nexo.inventory.locations.view`          | `STANDARD`                |
| `nexo.inventory.lpns.view`               | `STANDARD`                |
| `nexo.inventory.stock.view`              | `STANDARD`                |
| `nexo.inventory.production_batches.view` | `STANDARD`                |
| `nexo.inventory.withdrawals.view`        | `STANDARD`                |
| `nexo.inventory.withdrawals.register`    | `STANDARD`                |

##### DEVICE-WAREHOUSE-CORE-v1

**Total:** 35 claves exactas — `35` STANDARD, `0` STRONG, `0` NOT_ALLOWED.

| Permiso exacto                               | Compatibilidad compartida |
| -------------------------------------------- | ------------------------- |
| `nexo.access`                                | `STANDARD`                |
| `nexo.catalog.products.view`                 | `STANDARD`                |
| `nexo.catalog.presentations.view`            | `STANDARD`                |
| `nexo.catalog.request_policies.view`         | `STANDARD`                |
| `nexo.catalog.categories.view`               | `STANDARD`                |
| `nexo.catalog.units.view`                    | `STANDARD`                |
| `nexo.inventory.adjustments.view`            | `STANDARD`                |
| `nexo.inventory.entries.view`                | `STANDARD`                |
| `nexo.inventory.entries.register`            | `STANDARD`                |
| `nexo.inventory.locations.view`              | `STANDARD`                |
| `nexo.inventory.location_assignments.assign` | `STANDARD`                |
| `nexo.inventory.lpns.view`                   | `STANDARD`                |
| `nexo.inventory.movements.view`              | `STANDARD`                |
| `nexo.inventory.stock.view`                  | `STANDARD`                |
| `nexo.inventory.production_batches.view`     | `STANDARD`                |
| `nexo.inventory.transfers.view`              | `STANDARD`                |
| `nexo.inventory.transfers.create`            | `STANDARD`                |
| `nexo.inventory.withdrawals.view`            | `STANDARD`                |
| `nexo.inventory.withdrawals.register`        | `STANDARD`                |
| `nexo.inventory.zones.view`                  | `STANDARD`                |
| `nexo.inventory.storage_positions.view`      | `STANDARD`                |
| `nexo.inventory.warehouse_operations.view`   | `STANDARD`                |
| `nexo.inventory.stock_validations.perform`   | `STANDARD`                |
| `nexo.inventory.stock_counts.view`           | `STANDARD`                |
| `nexo.inventory.stock_counts.perform`        | `STANDARD`                |
| `nexo.inventory.initial_counts.view`         | `STANDARD`                |
| `nexo.inventory.remissions.view`             | `STANDARD`                |
| `nexo.inventory.remissions.prepare`          | `STANDARD`                |
| `nexo.inventory.remissions.receive`          | `STANDARD`                |
| `nexo.logistics.supply_routes.view`          | `STANDARD`                |
| `nexo.printing.jobs.view`                    | `STANDARD`                |
| `origo.access`                               | `STANDARD`                |
| `origo.procurement.purchase_orders.view`     | `STANDARD`                |
| `origo.procurement.receipts.view`            | `STANDARD`                |
| `origo.procurement.suppliers.view`           | `STANDARD`                |

##### DEVICE-LOGISTICS-CORE-v1

**Total:** 14 claves exactas — `14` STANDARD, `0` STRONG, `0` NOT_ALLOWED.

| Permiso exacto                           | Compatibilidad compartida |
| ---------------------------------------- | ------------------------- |
| `nexo.access`                            | `STANDARD`                |
| `nexo.catalog.products.view`             | `STANDARD`                |
| `nexo.catalog.presentations.view`        | `STANDARD`                |
| `nexo.catalog.units.view`                | `STANDARD`                |
| `nexo.inventory.lpns.view`               | `STANDARD`                |
| `nexo.inventory.movements.view`          | `STANDARD`                |
| `nexo.inventory.remissions.view`         | `STANDARD`                |
| `nexo.inventory.remissions.dispatch`     | `STANDARD`                |
| `nexo.logistics.operations_board.view`   | `STANDARD`                |
| `nexo.logistics.operations.view`         | `STANDARD`                |
| `nexo.logistics.driver_operations.view`  | `STANDARD`                |
| `nexo.logistics.fulfillment.view`        | `STANDARD`                |
| `nexo.logistics.fulfillment_routes.view` | `STANDARD`                |
| `nexo.logistics.supply_routes.view`      | `STANDARD`                |

##### DEVICE-PROCUREMENT-RECEPTION-v1

**Total:** 17 claves exactas — `16` STANDARD, `1` STRONG, `0` NOT_ALLOWED.

| Permiso exacto                               | Compatibilidad compartida |
| -------------------------------------------- | ------------------------- |
| `nexo.access`                                | `STANDARD`                |
| `nexo.catalog.products.view`                 | `STANDARD`                |
| `nexo.catalog.presentations.view`            | `STANDARD`                |
| `nexo.catalog.units.view`                    | `STANDARD`                |
| `nexo.inventory.entries.view`                | `STANDARD`                |
| `nexo.inventory.entries.register`            | `STANDARD`                |
| `nexo.inventory.locations.view`              | `STANDARD`                |
| `nexo.inventory.location_assignments.assign` | `STANDARD`                |
| `nexo.inventory.lpns.view`                   | `STANDARD`                |
| `nexo.inventory.movements.view`              | `STANDARD`                |
| `nexo.inventory.stock.view`                  | `STANDARD`                |
| `nexo.inventory.warehouse_operations.view`   | `STANDARD`                |
| `origo.access`                               | `STANDARD`                |
| `origo.procurement.purchase_orders.view`     | `STANDARD`                |
| `origo.procurement.receipts.view`            | `STANDARD`                |
| `origo.procurement.suppliers.view`           | `STANDARD`                |
| `origo.catalog.product_reviews.view`         | `STRONG`                  |

##### DEVICE-OPERATIONS-MANAGEMENT-v1

**Total:** 48 claves exactas — `41` STANDARD, `7` STRONG, `0` NOT_ALLOWED.

| Permiso exacto                             | Compatibilidad compartida |
| ------------------------------------------ | ------------------------- |
| `fogo.access`                              | `STANDARD`                |
| `fogo.production.batches.view`             | `STANDARD`                |
| `fogo.production.orders.view`              | `STANDARD`                |
| `fogo.production.recipe_book.view`         | `STANDARD`                |
| `nexo.access`                              | `STANDARD`                |
| `nexo.catalog.products.view`               | `STANDARD`                |
| `nexo.catalog.presentations.view`          | `STANDARD`                |
| `nexo.catalog.request_policies.view`       | `STANDARD`                |
| `nexo.catalog.categories.view`             | `STANDARD`                |
| `nexo.catalog.units.view`                  | `STANDARD`                |
| `nexo.assets.items.view`                   | `STANDARD`                |
| `nexo.assets.groups.view`                  | `STANDARD`                |
| `nexo.assets.counts.view`                  | `STANDARD`                |
| `nexo.inventory.adjustments.view`          | `STANDARD`                |
| `nexo.inventory.adjustments.register`      | `STRONG`                  |
| `nexo.inventory.entries.view`              | `STANDARD`                |
| `nexo.inventory.entries.override`          | `STRONG`                  |
| `nexo.inventory.locations.view`            | `STANDARD`                |
| `nexo.inventory.lpns.view`                 | `STANDARD`                |
| `nexo.inventory.movements.view`            | `STANDARD`                |
| `nexo.inventory.stock.view`                | `STANDARD`                |
| `nexo.inventory.production_batches.view`   | `STANDARD`                |
| `nexo.inventory.transfers.view`            | `STANDARD`                |
| `nexo.inventory.withdrawals.view`          | `STANDARD`                |
| `nexo.inventory.zones.view`                | `STANDARD`                |
| `nexo.inventory.storage_positions.view`    | `STANDARD`                |
| `nexo.inventory.warehouse_operations.view` | `STANDARD`                |
| `nexo.inventory.stock_counts.view`         | `STANDARD`                |
| `nexo.inventory.initial_counts.view`       | `STANDARD`                |
| `nexo.inventory.remissions.view`           | `STANDARD`                |
| `nexo.inventory.remissions.update`         | `STRONG`                  |
| `nexo.inventory.remissions.request`        | `STANDARD`                |
| `nexo.inventory.remissions.cancel`         | `STRONG`                  |
| `nexo.logistics.operations_board.view`     | `STANDARD`                |
| `nexo.logistics.operations.view`           | `STANDARD`                |
| `nexo.logistics.driver_operations.view`    | `STANDARD`                |
| `nexo.logistics.fulfillment.view`          | `STANDARD`                |
| `nexo.logistics.fulfillment_routes.view`   | `STANDARD`                |
| `nexo.logistics.supply_routes.view`        | `STANDARD`                |
| `nexo.finance.internal_variances.approve`  | `STRONG`                  |
| `nexo.finance.internal_variances.resolve`  | `STRONG`                  |
| `nexo.printing.jobs.view`                  | `STANDARD`                |
| `origo.access`                             | `STANDARD`                |
| `origo.procurement.purchase_orders.view`   | `STANDARD`                |
| `origo.procurement.receipts.view`          | `STANDARD`                |
| `origo.procurement.suppliers.view`         | `STANDARD`                |
| `pulso.access`                             | `STANDARD`                |
| `pulso.delivery.deliveries.override`       | `STRONG`                  |

##### DEVICE-ADMIN-MANAGEMENT-v1

**Total:** 23 claves exactas — `0` STANDARD, `23` STRONG, `0` NOT_ALLOWED.

| Permiso exacto                                | Compatibilidad compartida |
| --------------------------------------------- | ------------------------- |
| `numera.access`                               | `STRONG`                  |
| `numera.finance.cost_centers.view`            | `STRONG`                  |
| `numera.finance.expenses.view`                | `STRONG`                  |
| `numera.analytics.break_even.view`            | `STRONG`                  |
| `numera.analytics.profitability.view`         | `STRONG`                  |
| `numera.analytics.financial_reports.view`     | `STRONG`                  |
| `viso.access`                                 | `STRONG`                  |
| `viso.platform.app_updates.view`              | `STRONG`                  |
| `viso.organization.businesses.view`           | `STRONG`                  |
| `viso.workforce.employees.view`               | `STRONG`                  |
| `viso.workforce.staff_calendar.view`          | `STRONG`                  |
| `viso.workforce.schedules.view`               | `STRONG`                  |
| `viso.workforce.vacancies.view`               | `STRONG`                  |
| `viso.authorization.context_simulations.view` | `STRONG`                  |
| `viso.authorization.audit_logs.view`          | `STRONG`                  |
| `viso.catalog.commercial_categories.view`     | `STRONG`                  |
| `viso.content.content_blocks.view`            | `STRONG`                  |
| `viso.content.menu.view`                      | `STRONG`                  |
| `viso.content.website_content.view`           | `STRONG`                  |
| `viso.finance.accounting.view`                | `STRONG`                  |
| `viso.delivery.rates.view`                    | `STRONG`                  |
| `viso.loyalty.products.view`                  | `STRONG`                  |
| `viso.loyalty.customers.view`                 | `STRONG`                  |

---

#### 9. Matriz de plantillas objetivo

| Plantilla                        | Modo             | Aplicaciones máximas            | Paquetes máximos                                       | Elegibilidad de actor                                                    | Restricción territorial                                       | Decisión                                    |
| -------------------------------- | ---------------- | ------------------------------- | ------------------------------------------------------ | ------------------------------------------------------------------------ | ------------------------------------------------------------- | ------------------------------------------- |
| `pos_satellite`                  | OPERACIONAL      | SHELL, NEXO, PULSO              | DEVICE-SHELL-CORE-v1 + DEVICE-SATELLITE-REQUESTER-v1   | `cajero_satelite`                                                        | Sede exacta + área exacta de caja                             | RETENER Y VERSIONAR                         |
| `bar_satellite`                  | OPERACIONAL      | SHELL, NEXO, PULSO              | DEVICE-SHELL-CORE-v1 + DEVICE-SATELLITE-REQUESTER-v1   | `barista_satelite`                                                       | Sede exacta + área exacta de barra                            | CORREGIR LEGACY                             |
| `kitchen_satellite`              | OPERACIONAL      | SHELL, NEXO, PULSO              | DEVICE-SHELL-CORE-v1 + DEVICE-SATELLITE-REQUESTER-v1   | `cocinero_satelite`                                                      | Sede exacta + área exacta de cocina                           | NUEVA                                       |
| `service_satellite`              | OPERACIONAL      | SHELL, NEXO, PULSO              | DEVICE-SHELL-CORE-v1 + DEVICE-SATELLITE-REQUESTER-v1   | `servicio_salon`                                                         | Sede exacta + área exacta de salón                            | NUEVA                                       |
| `counter_satellite`              | OPERACIONAL      | SHELL, NEXO, PULSO              | DEVICE-SHELL-CORE-v1 + DEVICE-SATELLITE-REQUESTER-v1   | `mostrador_satelite`                                                     | Sede exacta + área exacta de mostrador                        | NUEVA                                       |
| `integrated_satellite`           | OPERACIONAL      | SHELL, NEXO, PULSO              | DEVICE-SHELL-CORE-v1 + DEVICE-INTEGRATED-SATELLITE-v1  | `operador_integral_satelite`                                             | Sede exacta; área exacta cuando exista en la asignación       | NUEVA                                       |
| `production_kitchen`             | OPERACIONAL      | SHELL, FOGO, NEXO               | DEVICE-SHELL-CORE-v1 + DEVICE-PRODUCTION-CORE-v1       | `produccion_cocina`                                                      | Centro de Producción + Cocina Caliente exacta                 | NUEVA; SUSTITUYE PARTE DE production_center |
| `production_bakery`              | OPERACIONAL      | SHELL, FOGO, NEXO               | DEVICE-SHELL-CORE-v1 + DEVICE-PRODUCTION-CORE-v1       | `produccion_panaderia`                                                   | Centro de Producción + Galletería y Panadería exacta          | NUEVA; SUSTITUYE PARTE DE production_center |
| `production_pastry`              | OPERACIONAL      | SHELL, FOGO, NEXO               | DEVICE-SHELL-CORE-v1 + DEVICE-PRODUCTION-CORE-v1       | `produccion_reposteria`                                                  | Centro de Producción + Repostería exacta                      | NUEVA; SUSTITUYE PARTE DE production_center |
| `warehouse_kiosk`                | OPERACIONAL      | SHELL, NEXO, ORIGO              | DEVICE-SHELL-CORE-v1 + DEVICE-WAREHOUSE-CORE-v1        | `bodeguero`                                                              | Sede exacta + área exacta de bodega                           | CORREGIR POLÍTICA                           |
| `logistics_vehicle_terminal`     | OPERACIONAL      | SHELL, NEXO                     | DEVICE-SHELL-CORE-v1 + DEVICE-LOGISTICS-CORE-v1        | `conductor_logistica`                                                    | Sede operativa + vehículo/ruta asignados; área no obligatoria | NUEVA                                       |
| `procurement_reception`          | MIXTA EXCLUYENTE | SHELL, NEXO, ORIGO              | DEVICE-SHELL-CORE-v1 + DEVICE-PROCUREMENT-RECEPTION-v1 | Operativo: `bodeguero`; administrativo: actor con permiso base explícito | Sede receptora + área exacta de recepción/bodega              | REDISEÑAR                                   |
| `operations_management_terminal` | OPERACIONAL      | SHELL, FOGO, NEXO, ORIGO, PULSO | DEVICE-SHELL-CORE-v1 + DEVICE-OPERATIONS-MANAGEMENT-v1 | `gerencia_operativa`                                                     | Sede operativa activa; área exacta cuando el permiso la exija | NUEVA                                       |
| `management_terminal`            | ADMINISTRATIVA   | SHELL, NUMERA, VISO             | DEVICE-SHELL-CORE-v1 + DEVICE-ADMIN-MANAGEMENT-v1      | Sin whitelist por nombre de rol; actor con permiso base efectivo         | Alcance real del actor; el sitio físico no amplía territorio  | REDISEÑAR                                   |

Las aplicaciones máximas solo controlan disponibilidad de superficie. Cada acción continúa exigiendo permiso exacto del actor.

---

#### 10. Reglas por familia de plantilla

##### 10.1 Terminales satélite especializados

Aplican a `pos_satellite`, `bar_satellite`, `kitchen_satellite`, `service_satellite` y `counter_satellite`.

- Exigen sesión `OPERATIONAL`.
- Exigen rol operativo exacto compatible con la plantilla.
- Exigen coincidencia de sede y área exactas.
- Admiten el núcleo de abastecimiento del área y `pulso.access`.
- `nexo.inventory.remissions.update` exige reautenticación fuerte; el PIN ligero no basta.
- No admiten inventario general, producción central, recepción, preparación, despacho, cancelación ni administración.
- Las futuras acciones atómicas de PULSO deberán añadirse únicamente mediante una versión nueva del paquete y revisión de las matrices afectadas.

##### 10.2 Terminal integrado de formato pequeño

`integrated_satellite` corresponde a sedes donde una sola función operativa cubre varias tareas ordinarias.

- Exige `operador_integral_satelite`.
- Puede incluir recepción ordinaria de remisiones de la sede integrada.
- No se convierte en suma automática de caja, barra, cocina, salón y mostrador.
- El área se exige cuando la configuración de la sede o el permiso la requiera.
- Una nueva capacidad comercial de PULSO deberá aparecer como permiso atómico antes de incorporarse.

##### 10.3 Terminales de producción

La plantilla legacy `production_center` queda retirada porque no distingue Cocina Caliente, Galletería y Panadería y Repostería.

Se sustituye por:

- `production_kitchen`;
- `production_bakery`;
- `production_pastry`.

Cada instancia queda ligada a un área exacta y a un único rol operativo compatible. No puede consultar recetas, órdenes, lotes o existencias de otra área por compartir la misma sede.

##### 10.4 Kiosco de bodega

`warehouse_kiosk` admite las 35 capacidades operativas aprobadas para `bodeguero`, más `shell.access` cuando el actor lo posea por su carril base.

Reglas:

- política exacta `operational_role_in_area`;
- rol operativo permitido: `bodeguero`;
- sede y área de bodega exactas;
- `same_site_active_worker` no es suficiente y deberá retirarse;
- no admite ajustes, overrides, aprobaciones o cancelaciones sensibles;
- el acceso a ORIGO puede habilitarse en una instancia solo si la plantilla y la aplicación ya están desplegadas;
- consultar una recepción no permite registrarla formalmente mientras no exista el permiso atómico correspondiente.

##### 10.5 Terminal logístico de vehículo

`logistics_vehicle_terminal` admite la operación asignada del conductor: consulta de carga, ruta, LPN y movimientos asociados, aceptación de custodia e inicio de tránsito.

No admite:

- preparación de carga;
- modificación libre de cantidades;
- recepción por el destino;
- cancelación;
- stock general;
- movimientos internos de bodega;
- operaciones de otros conductores.

La instancia deberá vincularse a vehículo o recurso logístico cuando el contrato del BLOQUE E lo formalice.

##### 10.6 Terminal de recepción de compras

`procurement_reception` admite dos modos mutuamente excluyentes:

| Modo             | Actor elegible                     | Requisitos                                                                                                   |
| ---------------- | ---------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `OPERATIONAL`    | `bodeguero` en el área receptora   | Turno, check-in cuando aplique, sede, área, permiso operativo y recurso.                                     |
| `ADMINISTRATIVE` | Trabajador con permiso base exacto | No requiere turno para `BASE_ONLY`; conserva alcance base y exige reautenticación fuerte cuando corresponda. |

Cambiar de modo cierra la sesión anterior, limpia la pantalla y elimina toda reautenticación vigente.

La plantilla permite consultar órdenes, recepciones, proveedor y revisión administrativa de producto. No crea por sí sola el permiso todavía inexistente para registrar formalmente una recepción de compra.

##### 10.7 Terminal de gerencia operativa

`operations_management_terminal` permite el paquete exacto aprobado para `gerencia_operativa`.

- Exige turno y rol operativo `gerencia_operativa`.
- Conserva el alcance territorial del recurso.
- Las siete capacidades STRONG del paquete requieren reautenticación fuerte.
- Coordinar no equivale a ejecutar físicamente bodega, producción, conducción o recepción.
- La plantilla no elimina la doble condición de los permisos `BASE_AND_OPERATIONAL`.

##### 10.8 Terminal administrativa

`management_terminal` admite `SHELL`, `NUMERA` y `VISO`.

- No usa `gerente_general`, `propietario` u otro nombre de rol como bypass.
- La sesión es `ADMINISTRATIVE`.
- `shell.access` puede utilizar sesión ordinaria de actor.
- Las 23 capacidades de VISO y NUMERA incluidas exigen reautenticación fuerte.
- El alcance continúa siendo el alcance real del actor.
- La pantalla se limpia al bloquear, cambiar de actor o expirar la reautenticación.
- ANIMA, PASS y AURA permanecen excluidas.

---

#### 11. Política canónica de actor

Las políticas legacy pueden participar únicamente como filtros preliminares. No autorizan acciones.

| Política legacy           | Decisión                                                                                              |
| ------------------------- | ----------------------------------------------------------------------------------------------------- |
| `same_site_active_worker` | **INSUFICIENTE**. Es demasiado amplia para terminales especializados.                                 |
| `same_area_active_worker` | **INSUFICIENTE POR SÍ SOLA**. Puede filtrar territorio, pero no oficio ni permiso.                    |
| `role_in_site`            | Requiere declarar catálogo de rol, códigos exactos y permiso efectivo; el nombre del rol no autoriza. |
| `role_in_area`            | Requiere rol operativo exacto, sede, área, turno y permiso; el campo `navigation_role` no participa.  |

Contrato objetivo de elegibilidad:

```text
session_mode
+ employee_active
+ role_catalog explícito cuando aplique
+ allowed_role_codes exactos cuando aplique
+ site_match
+ area_match cuando aplique
+ app_allowed
+ actor_session vigente
= ACTOR ELEGIBLE PARA INTENTAR
```

Ser elegible para intentar una acción no equivale a tener el permiso.

---

#### 12. `navigation_role`

`navigation_role` queda limitado a una pista de presentación o selección de interfaz.

No podrá:

- resolver el rol base;
- resolver el rol operativo;
- conceder aplicaciones;
- conceder permisos;
- sustituir el turno;
- sustituir la política de actor;
- producir bypass;
- traducir automáticamente roles legacy a roles canónicos.

Cuando exista, deberá declarar explícitamente si referencia un rol base u operativo. Su ausencia no bloquea una autorización válida y su presencia no la concede.

---

#### 13. Reautenticación fuerte en dispositivos

Una plantilla que contenga claves `STRONG` deberá declarar soporte real de reautenticación fuerte.

Reglas:

- el PIN ligero no satisface STRONG;
- la reautenticación pertenece al actor, no al equipo;
- se vincula al permiso, acción y recurso confirmados;
- expira por tiempo, cambio de actor, bloqueo o cierre;
- no se transfiere a otra aplicación;
- no se reutiliza después de cambiar el recurso de alto impacto;
- no sustituye una aprobación por segunda persona cuando el proceso la exija;
- si el equipo no soporta reautenticación fuerte, las claves STRONG se deniegan aunque aparezcan en el paquete.

---

#### 14. Prohibiciones universales

Las siguientes 20 claves `NOT_ALLOWED` quedan fuera de todas las plantillas:

- `anima.access`
- `anima.workforce.employee_documents.view`
- `anima.workforce.employee_documents.upload`
- `anima.workforce.employee_documents.delete`
- `anima.workforce.employee_photos.upload`
- `anima.workforce.team_members.view`
- `anima.workforce.staff_invitations.create`
- `anima.attendance.shifts.create`
- `anima.attendance.shifts.update`
- `anima.attendance.shifts.cancel`
- `aura.access`
- `fogo.production.recipes.view`
- `nexo.catalog.products.create`
- `nexo.assets.items.create`
- `nexo.inventory.location_catalog.update`
- `nexo.finance.internal_invoices.generate`
- `nexo.finance.internal_invoices.issue`
- `nexo.finance.internal_invoices.cancel`
- `nexo.printing.templates.update`
- `pass.access`

Además queda prohibido:

- ejecutar acciones empresariales sin actor;
- mantener dos actores efectivos simultáneos;
- reutilizar la sesión del actor anterior;
- mostrar datos protegidos antes de identificar actor;
- ejecutar mutaciones sin conectividad verificable;
- utilizar aplicaciones instaladas como permisos;
- usar la plantilla como rol;
- ampliar una instancia por configuración local;
- conceder capacidades nuevas automáticamente al actualizar el catálogo;
- almacenar credenciales personales del actor en el dispositivo.

---

#### 15. Decisión sobre dispositivos actuales

##### 15.1 `CAJA_VENTO_CAFE_01`

| Elemento         | Decisión objetivo                                                   |
| ---------------- | ------------------------------------------------------------------- |
| Instancia        | Conservar.                                                          |
| Plantilla        | `pos_satellite` versionada.                                         |
| Sede / área      | `VENTO_CAFE` / Caja exacta.                                         |
| Apps máximas     | SHELL, NEXO, PULSO.                                                 |
| Actor operativo  | `cajero_satelite`.                                                  |
| Política         | Rol operativo exacto en sede y área; no solo navegación.            |
| Capacidad máxima | DEVICE-SHELL-CORE-v1 + DEVICE-SATELLITE-REQUESTER-v1.               |
| STRONG           | `nexo.inventory.remissions.update` requiere reautenticación fuerte. |
| Acción sin actor | Prohibida.                                                          |

La existencia de la instancia no demuestra que la sesión de actor ya esté implementada. Deberá validarse en BLOQUE R.

##### 15.2 `KIOSCO_BODEGA_CP`

| Elemento          | Decisión objetivo                                                                       |
| ----------------- | --------------------------------------------------------------------------------------- |
| Instancia         | Conservar.                                                                              |
| Plantilla         | `warehouse_kiosk` versionada.                                                           |
| Sede / área       | `CENTRO_PROD` / Bodega exacta.                                                          |
| Apps máximas      | SHELL, NEXO, ORIGO; la instancia puede mantener una selección menor durante transición. |
| Actor operativo   | `bodeguero`.                                                                            |
| Política actual   | `same_site_active_worker` — **RECHAZADA COMO POLÍTICA FINAL**.                          |
| Política objetivo | Rol operativo `bodeguero` + turno + contexto de sede/área + permiso exacto.             |
| Capacidad máxima  | DEVICE-SHELL-CORE-v1 + DEVICE-WAREHOUSE-CORE-v1.                                        |
| Acción sin actor  | Prohibida.                                                                              |

No se considera conforme mientras no exista sesión de actor persistida, revalidación por acción y auditoría del empleado real.

---

#### 16. Tratamiento de plantillas legacy

| Plantilla legacy        | Decisión                                                                                                                      |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `pos_satellite`         | Conservar, versionar y limitar a `cajero_satelite`. `navigation_role` queda decorativo.                                       |
| `bar_satellite`         | Conservar, pero sustituir la referencia legacy `barista` por elegibilidad explícita de `barista_satelite`.                    |
| `warehouse_kiosk`       | Conservar, reemplazando `same_site_active_worker` por rol operativo y área exactos.                                           |
| `procurement_reception` | Rediseñar como terminal mixta excluyente; `auxiliar_administrativa` no autoriza por nombre ni exige turno para permisos base. |
| `production_center`     | Retirar y sustituir por tres plantillas de área. No traducir `cocinero` automáticamente.                                      |
| `management_terminal`   | Conservar y rediseñar; eliminar políticas duplicadas y cualquier bypass por `gerente_general`.                                |

Las plantillas nuevas permanecen sin instancia hasta que el flujo funcional correspondiente esté listo y pase por implementación, pruebas y despliegue controlado.

---

#### 17. Cambio de actor y concurrencia

1. La operación protegida captura `device_id`, `actor_session_id`, `employee_id`, permiso y recurso.
2. Antes de confirmar, el servidor verifica que siguen siendo los mismos.
3. Cambiar actor cierra la sesión anterior.
4. Se eliminan caché visual, formularios, selección de recurso y reautenticación del actor anterior.
5. Una operación iniciada por un actor no puede confirmarse por otro dentro de la misma transacción.
6. Si el proceso exige dos personas, se modelan dos intervenciones auditadas, no una transferencia de sesión.
7. Cerrar la sesión del dispositivo no genera check-out laboral.
8. El check-out laboral revoca las capacidades `T+C` del actor aunque la sesión técnica continúe abierta.

---

#### 18. Conectividad

Sin conectividad verificable:

- no se ejecutan mutaciones;
- no se ejecutan claves STRONG;
- no se reutiliza una autorización previa;
- los datos cacheados se muestran únicamente como no vigentes cuando su contrato lo permita;
- no se atribuye una acción pendiente a un actor distinto al que la inició;
- no se crea una cola offline empresarial implícita.

Cualquier modo offline futuro será un contrato separado, versionado y aprobado por capacidad.

---

#### 19. Razones de bloqueo

| Razón conceptual                         | Significado                                                             |
| ---------------------------------------- | ----------------------------------------------------------------------- |
| `shared_device_inactive`                 | Instancia inactiva, revocada o no reconocida.                           |
| `shared_device_template_version_invalid` | La instancia no está fijada a una versión válida.                       |
| `shared_device_app_not_allowed`          | La aplicación no pertenece a la intersección plantilla/instancia.       |
| `shared_device_permission_not_listed`    | La clave exacta no pertenece al paquete efectivo del dispositivo.       |
| `shared_device_permission_not_allowed`   | La clave está clasificada `NOT_ALLOWED`.                                |
| `shared_device_actor_required`           | No existe actor humano vigente.                                         |
| `shared_device_actor_session_expired`    | La sesión ligera expiró o fue cerrada.                                  |
| `shared_device_session_mode_mismatch`    | El modo administrativo u operativo no corresponde a la acción.          |
| `shared_device_actor_policy_mismatch`    | El actor no satisface la política de elegibilidad.                      |
| `shared_device_site_mismatch`            | La sede del actor, dispositivo o recurso no coincide.                   |
| `shared_device_area_mismatch`            | El área exigida no coincide.                                            |
| `shared_device_resource_mismatch`        | El vehículo, ubicación, remisión, lote u otro recurso no es compatible. |
| `strong_reauth_required`                 | Falta reautenticación fuerte válida.                                    |
| `strong_reauth_not_supported`            | La instancia no soporta el mecanismo exigido.                           |
| `shared_device_actor_changed`            | El actor cambió durante la operación.                                   |
| `shared_device_context_stale`            | Cambió turno, check-in, permiso, deny o recurso desde la evaluación.    |
| `shared_device_offline_mutation_denied`  | No existe conectividad verificable para una mutación.                   |

La nomenclatura técnica definitiva se formalizará en BLOQUE E.

---

#### 20. Auditoría mínima

Toda decisión protegida desde dispositivo compartido deberá poder registrar:

- `device_id`;
- código y versión de plantilla;
- versión de configuración de instancia;
- usuario técnico autenticado;
- `actor_session_id`;
- `employee_id`;
- modo de sesión;
- aplicación y permiso exactos;
- recurso, sede y área resueltos;
- clasificación `STANDARD`, `STRONG` o `NOT_ALLOWED`;
- evidencia y vigencia de reautenticación fuerte;
- carriles base y operativo evaluados;
- denegaciones aplicables;
- decisión y razones;
- identificador de correlación de la operación;
- fecha y hora del servidor.

La identidad técnica nunca aparece como actor empresarial de la transacción.

---

#### 21. Versionamiento y nuevos permisos

La matriz queda vinculada a la versión vigente del catálogo de 112 permisos.

Cuando se cree, divida, reemplace o retire una clave:

```text
NUEVA VERSIÓN DEL CATÁLOGO
→ permiso nuevo DENEGADO en todas las plantillas
→ análisis de compatibilidad compartida
→ revisión de paquetes afectados
→ revisión de plantillas afectadas
→ nueva versión de plantilla
→ despliegue explícito a instancias
```

No será necesario remodelar el sistema. Solo se revisan las plantillas y matrices relacionadas con las claves modificadas.

AUTH-RBAC-024 a AUTH-RBAC-026 no deberán congelar datasets incompatibles con una versión de catálogo posterior. Cada dataset deberá declarar `catalog_version` y los paquetes de dispositivo deberán hacer lo mismo.

---

#### 22. Validaciones de integridad

- ✅ Los 112 permisos conservan la clasificación aprobada en AUTH-CAT-014.
- ✅ Las 20 claves `NOT_ALLOWED` están excluidas de todos los paquetes.
- ✅ Ninguna plantilla concede permisos.
- ✅ Cada paquete contiene claves exactas y sin duplicados.
- ✅ No existen wildcards por app, módulo, prefijo o rol.
- ✅ Las instancias solo pueden reducir plantillas.
- ✅ `navigation_role` no participa en autorización.
- ✅ Los terminales operativos exigen actor, turno y contexto cuando el permiso lo requiere.
- ✅ Los permisos `T+C` continúan exigiendo check-in.
- ✅ Las claves STRONG no se degradan a PIN ligero.
- ✅ ANIMA, PASS y AURA no se convierten en aplicaciones laborales compartidas.
- ✅ La plantilla genérica de producción queda reemplazada por áreas exactas.
- ✅ El kiosco de bodega deja de admitir cualquier trabajador activo de la sede.
- ✅ El terminal administrativo no obtiene bypass por nombre de rol.
- ✅ Los dos dispositivos actuales quedan revisados, pero no declarados implementados.
- ✅ Los permisos nuevos quedan denegados hasta una nueva versión.

---

#### 23. Impacto sobre tareas posteriores

| Tarea o bloque                         | Impacto                                                                                                                  |
| -------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| Revisión contractual previa a datasets | Deberá consolidar las brechas y cambios del catálogo antes de congelar versiones finales.                                |
| AUTH-RBAC-024                          | El dataset base deberá declarar versión de catálogo; no obtiene permisos por dispositivo.                                |
| AUTH-RBAC-025                          | El dataset operativo deberá declarar versión de catálogo y conservar turno, check-in, sede y área.                       |
| AUTH-RBAC-026                          | Excepciones y denegaciones continuarán venciendo las capacidades de dispositivo.                                         |
| AUTH-RBAC-027                          | Verificará que plantillas, instancias y recursos no produzcan acceso operativo global accidental.                        |
| AUTH-RBAC-028                          | Verificará que terminales administrativos no conviertan permisos base en dependientes de check-in.                       |
| BLOQUE E                               | Diseñará `AccessContext` y `AuthorizationDecision` con identidad técnica, actor, sesión, plantilla, instancia y razones. |
| BLOQUE E3                              | Auditará la infraestructura real y definirá el modelo físico objetivo.                                                   |
| BLOQUE R                               | Implementará tablas, backfills, limpieza legacy, migraciones, pruebas y rollback en `vento-shell`.                       |

---

#### 24. Criterios de aprobación

AUTH-RBAC-023 podrá aprobarse cuando se acepte expresamente que:

1. El dispositivo es un filtro restrictivo y nunca una fuente de permisos.
2. La autorización final es la intersección entre actor, plantilla, instancia, contexto, recurso y denegaciones.
3. Se definen 14 plantillas objetivo y una plantilla legacy retirada.
4. Las aplicaciones permitidas no conceden capacidades internas.
5. Los paquetes reutilizables contienen únicamente claves exactas.
6. Las 20 claves `NOT_ALLOWED` quedan excluidas universalmente.
7. Las claves STRONG conservan reautenticación fuerte personal.
8. La instancia puede reducir, pero no ampliar, su plantilla.
9. Toda instancia queda fijada a una versión de plantilla.
10. `same_site_active_worker` no es política final válida para el kiosco de bodega.
11. `navigation_role` no participa en autorización.
12. `production_center` se divide por área productiva.
13. `procurement_reception` distingue sesión operativa y administrativa.
14. `management_terminal` no utiliza nombres de rol como bypass.
15. CAJA_VENTO_CAFE_01 y KIOSCO_BODEGA_CP se conservan, pero requieren implementación y pruebas posteriores.
16. Los permisos nuevos quedan denegados por defecto en todas las plantillas.
17. Ninguna acción empresarial puede ejecutarse sin actor humano.
18. La tarea no implementa código, Supabase ni migraciones.

---

#### 25. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-RBAC-021 | APROBADA    |
| AUTH-RBAC-022 | APROBADA    |
| AUTH-RBAC-023 | APROBADA    |
| AUTH-RBAC-024 | NO INICIADA |

No se avanza a AUTH-RBAC-024 hasta recibir aprobación explícita.
