### ✅ AUTH-CAT-016 — Definir contrato de recurso y resolución territorial de cada permiso

#### 1. Identificación de la tarea

| Campo                     | Valor                                                                               |
| ------------------------- | ----------------------------------------------------------------------------------- |
| Bloque                    | BLOQUE C — Catálogo canónico de aplicaciones y permisos                             |
| Tarea                     | AUTH-CAT-016 — Definir contrato de recurso y resolución territorial de cada permiso |
| Estado                    | APROBADO                                                                            |
| Naturaleza                | Definición documental                                                               |
| Implementación            | No incluida                                                                         |
| Tarea anterior vigente    | AUTH-CAT-015 — Definir permisos que admiten simulación                              |
| Tarea posterior reservada | AUTH-CAT-017 — Crear catálogo versionado en `vento-shell`                           |

Esta tarea no realiza cambios en Supabase, migraciones, tablas, RLS, RPC, aplicaciones, repositorios, matrices de roles ni guards.

Toda implementación futura deberá crearse y documentarse mediante contratos y migraciones versionadas en `vento-shell`.

#### 2. Objetivo

Formalizar para cada uno de los 112 permisos canónicos el contrato mínimo que permite responder, de forma determinista y cerrada:

- cuál es el recurso empresarial exacto;
- cómo se localiza el recurso o su borrador de creación;
- cómo se resuelven su sede, área y demás dimensiones territoriales;
- quién es el sujeto objetivo y cuándo existe una relación `OWN`;
- qué lados deben autorizarse en recursos multisede;
- qué estado debe cumplir el recurso;
- qué control de concurrencia e idempotencia requiere;
- qué evidencia debe quedar en auditoría;
- cuándo la resolución es insuficiente y debe producir denegación o `indeterminate` en simulación.

Regla central:

> **NO SE AUTORIZA UNA ACCIÓN CONTRA UN `site_id` O `area_id` AISLADOS. SE AUTORIZA UNA ACCIÓN CONTRA UN RECURSO RESUELTO, CUYO TERRITORIO SE COMPARA CON EL CONTEXTO Y EL ALCANCE DEL ACTOR.**

#### 3. Alcance de la tarea

AUTH-CAT-016 determina exclusivamente:

- el contrato lógico de recurso de los 112 permisos;
- el localizador exigido para recurso existente, colección, agregado o creación;
- la ruta lógica canónica de resolución territorial;
- la relación entre actor, trabajador objetivo, creador, custodio, responsable y propietario funcional;
- la resolución de origen, destino, rutas y conjuntos multisede;
- los controles mínimos de estado, concurrencia, idempotencia y trazabilidad;
- las reglas para listas, agregados, operaciones masivas e históricos;
- la matriz explícita de los 112 permisos.

AUTH-CAT-016 no determina:

- la tabla física definitiva de contratos;
- nombres definitivos de columnas SQL o tipos TypeScript;
- funciones RLS o RPC concretas;
- qué rol recibe cada permiso;
- qué excepción individual se crea;
- la implementación de estados empresariales todavía inexistentes;
- cambios de código, migraciones o frontend.

Los nombres de campos utilizados en esta tarea son **rutas lógicas contractuales**. La implementación podrá mapearlas a tablas actuales o futuras, pero no cambiar su significado ni introducir fallbacks permisivos.

#### 4. Base normativa

Esta propuesta conserva sin cambios:

- ADR-AUTH-001;
- AUTH-MOD-001 a AUTH-MOD-020;
- AUTH-CAT-001 a AUTH-CAT-015;
- los 112 permisos canónicos;
- las modalidades base y operativa;
- los alcances máximos y admitidos;
- los requisitos de turno, check-in y área;
- la compatibilidad con dispositivos compartidos y simulación;
- la precedencia de denegaciones explícitas.

AUTH-CAT-016 precisa **cómo resolver el recurso**. No puede ampliar un alcance, eliminar un prerrequisito ni convertir una relación con un recurso en autorización por sí misma.

#### 5. Contrato canónico de recurso

Todo permiso canónico deberá declarar un contrato lógico equivalente a:

| Propiedad            | Función                                                                                                |
| -------------------- | ------------------------------------------------------------------------------------------------------ |
| `resource_type`      | Clase empresarial protegida.                                                                           |
| `resource_locator`   | Datos mínimos para localizar un recurso existente, una colección autorizada o un borrador de creación. |
| `subject_resolver`   | Persona, actor, custodio o responsable relacionado con el recurso.                                     |
| `territory_resolver` | Ruta lógica para obtener organización, negocio, sede, área, origen, destino, ruta o conjunto.          |
| `ownership_resolver` | Condición exacta para `OWN`, cuando exista.                                                            |
| `required_sides`     | Lados del recurso multisede que deben estar autorizados para la acción.                                |
| `state_predicate`    | Estado o transición empresarial necesaria.                                                             |
| `concurrency_policy` | Control de versión, bloqueo, snapshot o idempotencia.                                                  |
| `field_policy`       | Campos visibles o mutables; permite permisos separados para datos sensibles.                           |
| `audit_policy`       | Evidencia mínima de decisión y ejecución.                                                              |

La ausencia de cualquiera de los componentes necesarios no activa un valor predeterminado permisivo.

#### 6. Formas canónicas de localización

| Forma               | Regla                                                                                                                                    |
| ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| Recurso existente   | Debe recibirse una referencia estable y resolverse del lado servidor. Un objeto enviado por el cliente no sustituye la lectura canónica. |
| Creación            | Se autoriza un `ResourceDraft` normalizado antes de persistir. Toda sede, área, relación y padre deben validarse.                        |
| Colección           | El servidor construye el conjunto autorizado. No se recupera un conjunto amplio para filtrarlo únicamente en el cliente.                 |
| Agregado            | Cada miembro territorial que alimenta el resultado debe estar autorizado antes del cálculo.                                              |
| Recurso relacionado | Se resuelve desde una relación canónica, por ejemplo documento → trabajador, posición → zona → sede o factura → partes.                  |
| Histórico           | Se utiliza el snapshot territorial del evento histórico, no el territorio actual del recurso cuando eso reescriba el pasado.             |

#### 7. Estados de resolución

| Estado           | Resultado                                                                                      |
| ---------------- | ---------------------------------------------------------------------------------------------- |
| `RESOLVED`       | Existe un recurso exacto y un territorio coherente. La evaluación puede continuar.             |
| `MULTI_RESOLVED` | Se resolvieron todos los lados o miembros requeridos. La evaluación continúa lado por lado.    |
| `NOT_APPLICABLE` | El contrato es legítimamente no territorial u organizacional exacto.                           |
| `UNRESOLVED`     | Falta el recurso o una dimensión obligatoria. Denegar; en simulación devolver `indeterminate`. |
| `CONFLICT`       | Campos o relaciones territoriales se contradicen. Denegar.                                     |
| `ISOLATED`       | El recurso pertenece a APP-REVIEW, otro dominio o aislamiento no concedido. Denegar.           |

No se permite convertir `UNRESOLVED` en la sede seleccionada, sede primaria, área del dispositivo, primera área disponible ni territorio enviado libremente por el cliente.

#### 8. Resolución territorial

Orden obligatorio:

1. resolver el recurso o borrador exacto;
2. resolver sus relaciones canónicas;
3. obtener su territorio real o declarado;
4. validar coherencia interna entre organización, sede, área, ruta y lados;
5. comparar el territorio con el alcance concedido;
6. intersectar con el contexto operativo cuando el carril operativo participe;
7. aplicar estado, propiedad, dispositivo, simulación, denegaciones y restricciones de campos;
8. registrar la decisión;
9. ejecutar la mutación en la misma frontera transaccional o volver a validar antes de escribir.

El contexto del actor **limita** el recurso. Nunca crea ni reemplaza el territorio del recurso.

#### 9. Sujeto y propiedad

- `OWN` debe derivarse de una relación explícita del contrato, no del hecho de haber abierto la pantalla.
- Ser creador, registrador, preparador, receptor, custodio o conductor no equivale automáticamente a ser propietario autorizante.
- La propiedad nunca reemplaza permiso, alcance, estado, turno, check-in, área, reautenticación ni denegación.
- Para trabajadores objetivo, `OWN` significa que el trabajador objetivo es el actor efectivo; no significa que todas sus sedes o datos queden visibles.
- En simulación, el propietario de la sesión es el actor real, no el sujeto simulado.

#### 10. Recursos multisede y multilado

| Tipo de acción          | Regla                                                                                                                    |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| Lectura relacional      | Puede autorizarse por relación legítima con un lado, pero debe ocultar campos o lados no autorizados cuando corresponda. |
| Mutación de un lado     | Exige autoridad sobre el lado que cambia y las relaciones necesarias para validar la operación.                          |
| Mutación de ambos lados | Exige autorización sobre todos los extremos obligatorios.                                                                |
| Traslado de inventario  | Origen y destino son obligatorios; no basta pertenecer a uno.                                                            |
| Remisión                | Cada acción declara su lado: solicitud, origen, ruta, destino o responsable por estado.                                  |
| Orden multidestino      | Cada destino mostrado o modificado debe resolverse. La visibilidad parcial no concede los demás destinos.                |
| Agregado multisede      | Solo incluye miembros autorizados y no puede permitir inferir miembros excluidos.                                        |

#### 11. Estado, concurrencia e idempotencia

- Toda mutación sobre recurso existente exige un predicado de estado explícito.
- Los nombres de estados concretos deberán provenir del estado canónico del dominio; no se inventarán desde el frontend.
- Cambiar territorio mediante una actualización exige autorizar tanto el territorio vigente como el propuesto.
- Las mutaciones de inventario se ejecutan atómicamente con bloqueo o mecanismo equivalente sobre stock y ubicación afectados.
- Las transiciones terminales, creaciones y eventos repetibles usan clave de idempotencia.
- Las ediciones ordinarias usan versión esperada, `updated_at` confiable o mecanismo equivalente.
- La decisión no puede quedar separada de la escritura por una ventana que permita cambiar el recurso sin revalidación.
- Las lecturas agregadas utilizan snapshot consistente cuando la inconsistencia pueda revelar o mezclar territorios.

#### 12. Campos protegidos

Autorizar un recurso no autoriza automáticamente todos sus campos.

Ejemplos obligatorios:

- `nexo.finance.internal_invoices.view` no concede importes; estos requieren `nexo.finance.internal_invoice_amounts.view`;
- la vista operativa de proveedores puede recibir campos mínimos y no el expediente comercial completo;
- la simulación no muestra datos reales por autoridad simulada;
- auditoría, clientes, trabajadores, documentos y datos financieros aplican minimización y máscaras;
- una lectura parcial no puede inferir campos ocultos mediante totales, conteos o errores diferenciados.

#### 13. Listas, filtros y operaciones masivas

- Toda lista se filtra en servidor por el contrato del permiso.
- Un filtro solicitado por el cliente reduce el conjunto; nunca lo amplía.
- Una operación masiva se descompone en decisiones por recurso, salvo que exista un permiso masivo canónico explícito.
- Si un miembro falla, la política de atomicidad deberá ser explícita: todo o nada, o resultado parcial documentado. No se elige silenciosamente.
- Paginación, búsqueda y ordenamiento se aplican después de establecer el conjunto autorizado o mediante una consulta que preserve esa equivalencia.

#### 14. Dispositivo compartido y simulación

- El dispositivo compartido no sustituye el `resource_locator` ni el `territory_resolver`.
- El territorio fijo del dispositivo solo puede restringir y debe coincidir con el recurso cuando aplique.
- La reautenticación fuerte no cambia el contrato del recurso.
- La simulación puede resolver un recurso sintético, enmascarado o real ya autorizado al actor real.
- `UNRESOLVED` o `CONFLICT` produce `indeterminate` o `would_deny`, nunca `would_allow`.
- Una mutación simulada no ejecuta bloqueos, reservas, eventos ni escrituras empresariales reales.

#### 15. Matriz completa de los 112 permisos

Las rutas indicadas son lógicas y normativas. No presuponen una columna física concreta.

##### 15.1 SHELL — 1

| Permiso        | Tipo de recurso | Localizador         | Resolución territorial               | Sujeto / propiedad      | Estado, concurrencia y auditoría           |
| -------------- | --------------- | ------------------- | ------------------------------------ | ----------------------- | ------------------------------------------ |
| `shell.access` | `APP_SURFACE`   | `app_code` canónico | NT — no existe territorio de recurso | Sin sujeto ni propiedad | Sin estado empresarial; decisión auditable |

##### 15.2 ANIMA — 10

| Permiso                                     | Tipo de recurso       | Localizador                                                                      | Resolución territorial                                                                            | Sujeto / propiedad                                                       | Estado, concurrencia y auditoría                                                                       |
| ------------------------------------------- | --------------------- | -------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------ |
| `anima.access`                              | `APP_SURFACE`         | `app_code` canónico                                                              | NT — no existe territorio de recurso                                                              | Sin sujeto ni propiedad                                                  | Sin estado empresarial; decisión auditable                                                             |
| `anima.workforce.employee_documents.view`   | `EMPLOYEE_DOCUMENT`   | `document_id → employee_id` o filtro por `target_employee_id`                    | EMPLOYEE — territorios activos del trabajador objetivo ∩ alcance concedido                        | Trabajador objetivo; `OWN` solo cuando `employee_id = actor_employee_id` | Lectura actual/histórica según retención; auditoría sensible                                           |
| `anima.workforce.employee_documents.upload` | `EMPLOYEE_DOCUMENT`   | Borrador con `target_employee_id`, `document_type`, archivo y metadatos          | EMPLOYEE — territorios activos del trabajador objetivo ∩ alcance concedido                        | Trabajador objetivo; autoservicio solo si el tipo admite `OWN`           | Creación idempotente; validar tipo, tamaño, hash y destino; auditoría de mutación                      |
| `anima.workforce.employee_documents.delete` | `EMPLOYEE_DOCUMENT`   | `document_id → employee_id`                                                      | EMPLOYEE — territorios del trabajador objetivo; no usar autoría como territorio                   | Trabajador objetivo; creador no obtiene autoridad automática             | Solo estado eliminable conforme a retención; bloqueo de fila o versión; auditoría reforzada            |
| `anima.workforce.employee_photos.upload`    | `EMPLOYEE_PHOTO`      | Borrador con `target_employee_id` y archivo                                      | EMPLOYEE — territorios activos del trabajador objetivo ∩ alcance concedido                        | Trabajador objetivo; `OWN` únicamente para foto propia permitida         | Creación o reemplazo idempotente; validación de formato; auditoría de mutación                         |
| `anima.workforce.team_members.view`         | `EMPLOYEE_COLLECTION` | Filtro normalizado de trabajadores                                               | EMPLOYEE_SET — cada trabajador se resuelve individualmente; unión solo de territorios autorizados | Colección de terceros; el actor propio no amplía el conjunto             | Lectura paginada y filtrada en servidor; auditoría sensible cuando exponga datos privados              |
| `anima.workforce.staff_invitations.create`  | `STAFF_INVITATION`    | Borrador con persona, rol previsto, sedes y áreas previstas                      | INTENDED_WORKFORCE — cada sede/área prevista debe existir y estar dentro del alcance              | Persona invitada; no existe propiedad `OWN`                              | Creación idempotente; estado inicial pendiente; evitar invitaciones duplicadas; auditoría de acceso    |
| `anima.attendance.shifts.create`            | `SHIFT`               | Borrador con `employee_id`, fecha, horario, `site_id`, `area_id?`, rol operativo | SHIFT_DRAFT — sede y área propuestas; área debe pertenecer a sede; trabajador debe ser compatible | Trabajador objetivo; creador no es propietario del turno                 | Creación idempotente; validar solapamientos, publicación y coherencia temporal; auditoría de mutación  |
| `anima.attendance.shifts.update`            | `SHIFT`               | `shift_id` + versión esperada + cambios propuestos                               | SHIFT_BOTH — autorizar territorio actual y territorio propuesto si cambia sede/área               | Trabajador del turno; creador no obtiene autoridad                       | Solo estado editable; control optimista; revalidar solapamientos y relaciones; auditoría antes/después |
| `anima.attendance.shifts.cancel`            | `SHIFT`               | `shift_id`                                                                       | SHIFT — `shift.site_id + shift.area_id?`                                                          | Trabajador del turno; `OWN` solo si el contrato de asignación lo permite | Solo estado cancelable; bloqueo o versión; evento idempotente; auditoría reforzada                     |

##### 15.3 AURA — 1

| Permiso       | Tipo de recurso | Localizador         | Resolución territorial               | Sujeto / propiedad      | Estado, concurrencia y auditoría           |
| ------------- | --------------- | ------------------- | ------------------------------------ | ----------------------- | ------------------------------------------ |
| `aura.access` | `APP_SURFACE`   | `app_code` canónico | NT — no existe territorio de recurso | Sin sujeto ni propiedad | Sin estado empresarial; decisión auditable |

##### 15.4 FOGO — 6

| Permiso                            | Tipo de recurso      | Localizador                                                              | Resolución territorial                                                                                   | Sujeto / propiedad                                                            | Estado, concurrencia y auditoría                                                                                  |
| ---------------------------------- | -------------------- | ------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `fogo.access`                      | `APP_SURFACE`        | `app_code` canónico                                                      | NT — no existe territorio de recurso                                                                     | Sin sujeto ni propiedad                                                       | Sin estado empresarial; decisión auditable                                                                        |
| `fogo.production.batches.view`     | `PRODUCTION_BATCH`   | `batch_id` o filtro normalizado                                          | SITE_AREA — territorio persistido del lote; histórico usa snapshot del evento                            | Sin propiedad automática; creador solo como filtro                            | Lectura del estado vigente o histórico; auditoría estándar                                                        |
| `fogo.production.batches.create`   | `PRODUCTION_BATCH`   | Borrador con sede, área/línea, producto, receta publicada y orden origen | SITE_AREA_DRAFT — destino productivo exacto; área obligatoria cuando el contrato operativo lo exige      | Actor creador queda atribuido, sin privilegio futuro                          | Creación idempotente; reservar número/lote atómicamente; validar receta, orden y capacidad; auditoría de mutación |
| `fogo.production.orders.view`      | `PRODUCTION_ORDER`   | `order_id` o filtro por participación                                    | RELATION_SIDES — sede solicitante, sede productiva y áreas relacionadas                                  | Actor solicitante/productivo/coordinador según relación; no propiedad general | Lectura por relación; proyección parcial si un lado queda oculto; auditoría estándar                              |
| `fogo.production.recipe_book.view` | `RECIPE_PUBLICATION` | `published_recipe_version_id` o consulta por producto/proceso            | APPLICABILITY — publicación + producto + proceso + sede/área del contexto; no crea alcance independiente | Sin propiedad; autoría de receta no participa                                 | Solo versiones publicadas y vigentes; lectura inmutable de versión; auditoría sensible                            |
| `fogo.production.recipes.view`     | `RECIPE_DEFINITION`  | `recipe_definition_id` o filtro del catálogo organizacional              | ORG — organización o unidad de negocio exacta del recurso                                                | Sin propiedad automática; autor solo como dato                                | Lectura de versión/borrador autorizados; secretos enmascarados por campos; auditoría sensible                     |

##### 15.5 NEXO — 63

| Permiso                                      | Tipo de recurso              | Localizador                                                       | Resolución territorial                                                                                                                        | Sujeto / propiedad                                                                             | Estado, concurrencia y auditoría                                                                                   |
| -------------------------------------------- | ---------------------------- | ----------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| `nexo.access`                                | `APP_SURFACE`                | `app_code` canónico                                               | NT — no existe territorio de recurso                                                                                                          | Sin sujeto ni propiedad                                                                        | Sin estado empresarial; decisión auditable                                                                         |
| `nexo.catalog.products.view`                 | `PRODUCT_MASTER`             | `product_id` o filtro normalizado                                 | ORG — maestro organizacional; disponibilidad por sede es aplicabilidad, no territorio                                                         | Sin propiedad                                                                                  | Lectura vigente/versionada; auditoría estándar                                                                     |
| `nexo.catalog.products.create`               | `PRODUCT_MASTER`             | Borrador normalizado del producto                                 | ORG_DRAFT — organización o unidad propietaria exacta                                                                                          | Creador atribuido, sin propiedad autorizante                                                   | Creación idempotente; unicidad de código/nombre normalizado; auditoría de configuración                            |
| `nexo.catalog.presentations.view`            | `PRESENTATION_MASTER`        | `presentation_id → product_id` o filtro                           | ORG — hereda organización del producto padre                                                                                                  | Sin propiedad                                                                                  | Lectura vigente; auditoría estándar                                                                                |
| `nexo.catalog.request_policies.view`         | `REQUEST_POLICY`             | `policy_id` o consulta de aplicabilidad                           | DECLARED_SCOPE — organización, sede, tipo de sede, área, tipo de área o ruta declarados en la política                                        | Sin propiedad                                                                                  | Solo políticas activas/vigentes para operación; historial según versión; auditoría de configuración                |
| `nexo.catalog.categories.view`               | `CATEGORY_MASTER`            | `category_id` o filtro                                            | ORG — maestro organizacional                                                                                                                  | Sin propiedad                                                                                  | Lectura vigente; auditoría estándar                                                                                |
| `nexo.catalog.units.view`                    | `UNIT_MASTER`                | `unit_id` o filtro                                                | ORG — maestro organizacional                                                                                                                  | Sin propiedad                                                                                  | Lectura vigente; auditoría estándar                                                                                |
| `nexo.assets.items.view`                     | `ASSET_ITEM`                 | `asset_id` o filtro normalizado                                   | SITE_AREA_CUSTODY — `asset.site_id`, `area_id?`, custodio y snapshot histórico                                                                | Custodio o responsable solo como relación; no bypass                                           | Lectura actual o snapshot histórico; auditoría estándar                                                            |
| `nexo.assets.items.create`                   | `ASSET_ITEM`                 | Borrador con clasificación, sede, área?, custodio?                | SITE_AREA_DRAFT — destino exacto; área debe pertenecer a sede                                                                                 | Creador atribuido; custodio no obtiene permisos implícitos                                     | Creación idempotente; código/serial único; auditoría de configuración y custodia                                   |
| `nexo.assets.groups.view`                    | `ASSET_GROUP`                | `group_id` o filtro                                               | ORG — grupo del maestro organizacional                                                                                                        | Sin propiedad                                                                                  | Lectura vigente; auditoría estándar                                                                                |
| `nexo.assets.counts.view`                    | `ASSET_COUNT`                | `count_id` o filtro de sesiones                                   | SITE_AREA_SET — sede, área y conjunto contado persistidos                                                                                     | Responsable o ejecutor como relación; no propiedad                                             | Lectura de sesión y resultados; snapshot consistente; auditoría sensible                                           |
| `nexo.inventory.adjustments.view`            | `INVENTORY_ADJUSTMENT`       | `adjustment_id` o filtro                                          | SITE_AREA_LOCATION — territorio persistido del ajuste y su stock afectado                                                                     | Actor registrador solo como filtro                                                             | Lectura append-only del evento; auditoría sensible                                                                 |
| `nexo.inventory.adjustments.register`        | `INVENTORY_ADJUSTMENT`       | Borrador con stock objetivo, cantidad, motivo y territorio        | SITE_AREA_LOCATION_DRAFT — stock, ubicación, producto/lote y contexto deben coincidir                                                         | Sin propiedad; actúa sobre stock empresarial                                                   | Mutación atómica de stock; idempotency key; bloqueo de stock; evento append-only y auditoría reforzada             |
| `nexo.inventory.entries.view`                | `INVENTORY_ENTRY`            | `entry_id` o filtro                                               | DESTINATION — sede, área, ubicación, recepción/lote persistidos                                                                               | Actor receptor/registrador solo como relación                                                  | Lectura append-only; auditoría estándar                                                                            |
| `nexo.inventory.entries.register`            | `INVENTORY_ENTRY`            | Borrador con destino, producto/presentación, cantidad, recepción? | DESTINATION_DRAFT — sede, área y ubicación destino exactas                                                                                    | Actor registrador atribuido, sin propiedad                                                     | Mutación atómica de stock; idempotencia; bloqueo de destino/stock; auditoría reforzada                             |
| `nexo.inventory.entries.override`            | `INVENTORY_ENTRY_OVERRIDE`   | `entry_id` o recepción + corrección propuesta                     | DESTINATION_INTERSECTION — territorio real del recurso ∩ carril base ∩ contexto operativo                                                     | Sin propiedad; tercero permitido solo por responsabilidad explícita                            | Solo estado corregible; bloqueo de fila/stock; idempotencia; motivo obligatorio; auditoría reforzada               |
| `nexo.inventory.locations.view`              | `INVENTORY_LOCATION`         | `location_id` o filtro                                            | SITE_AREA — `location.site_id + area_id?`; zona/posición no sustituyen área empresarial                                                       | Sin propiedad                                                                                  | Lectura de ubicación activa o histórica; auditoría estándar                                                        |
| `nexo.inventory.location_assignments.assign` | `LOCATION_ASSIGNMENT`        | Stock/LPN/ítem origen + `target_location_id`                      | SAME_TERRITORY_OR_VALID_MOVE — resolver recurso actual y ubicación destino; relación válida obligatoria                                       | Sin propiedad                                                                                  | Mutación atómica; bloqueo del recurso y ubicación; idempotencia; auditoría de custodia                             |
| `nexo.inventory.location_catalog.update`     | `LOCATION_CATALOG`           | `location_id` + catálogo propuesto + versión                      | SITE_AREA — territorio de la ubicación objetivo                                                                                               | Sin propiedad                                                                                  | Configuración versionada; control optimista; auditoría antes/después                                               |
| `nexo.inventory.lpns.view`                   | `LPN`                        | `lpn_id` o filtro                                                 | LPN_TERRITORY — territorio vigente para estado actual; snapshot del movimiento para historial                                                 | Custodio/actor solo como relación                                                              | Lectura actual o histórica explícita; auditoría estándar                                                           |
| `nexo.inventory.movements.view`              | `INVENTORY_MOVEMENT`         | `movement_id` o filtro                                            | ORIGIN_DESTINATION — ambos extremos persistidos; lectura por relación o cobertura transversal                                                 | Actor ejecutor solo como dato                                                                  | Evento inmutable append-only; auditoría estándar                                                                   |
| `nexo.inventory.stock.view`                  | `STOCK_POSITION`             | Clave de stock o filtro normalizado                               | SITE_AREA_LOCATION — cada posición de stock se resuelve individualmente                                                                       | Sin propiedad                                                                                  | Lectura consistente; agregación solo de posiciones autorizadas; auditoría estándar                                 |
| `nexo.inventory.production_batches.view`     | `INVENTORY_PRODUCTION_BATCH` | `inventory_batch_id` o filtro                                     | SITE_AREA — territorio de inventario del lote, no la receta                                                                                   | Sin propiedad                                                                                  | Lectura vigente/histórica; auditoría estándar                                                                      |
| `nexo.inventory.transfers.view`              | `INVENTORY_TRANSFER`         | `transfer_id` o filtro                                            | ORIGIN_DESTINATION — sedes, áreas y ubicaciones de ambos extremos                                                                             | Actor creador/transportador solo como relación                                                 | Lectura por cualquiera de los lados autorizados; evento/estado versionado; auditoría estándar                      |
| `nexo.inventory.transfers.create`            | `INVENTORY_TRANSFER`         | Borrador con origen, destino, ítems y cantidades                  | BOTH_SIDES_REQUIRED — cada origen y destino debe resolverse y autorizarse; sin fallback                                                       | Sin propiedad; mueve stock empresarial                                                         | Reserva y mutación atómicas; idempotencia; bloqueo de stock; validar capacidad y misma unidad; auditoría reforzada |
| `nexo.inventory.withdrawals.view`            | `INVENTORY_WITHDRAWAL`       | `withdrawal_id` o filtro                                          | ORIGIN — sede, área, ubicación y stock de salida                                                                                              | Actor registrador solo como filtro                                                             | Evento append-only; auditoría estándar                                                                             |
| `nexo.inventory.withdrawals.register`        | `INVENTORY_WITHDRAWAL`       | Borrador con origen, producto/presentación, cantidad y motivo     | ORIGIN_DRAFT — sede, área, ubicación y stock exactos                                                                                          | Sin propiedad                                                                                  | Mutación atómica de stock; idempotencia; bloqueo de origen; auditoría reforzada                                    |
| `nexo.inventory.zones.view`                  | `INVENTORY_ZONE`             | `zone_id` o filtro                                                | SITE_AREA — sede y área declaradas por la zona                                                                                                | Sin propiedad                                                                                  | Lectura vigente; auditoría estándar                                                                                |
| `nexo.inventory.storage_positions.view`      | `STORAGE_POSITION`           | `position_id → zone_id`                                           | SITE_AREA — hereda sede/área de zona y ubicación                                                                                              | Sin propiedad                                                                                  | Lectura vigente; auditoría estándar                                                                                |
| `nexo.inventory.warehouse_operations.view`   | `WAREHOUSE_OPERATION`        | `operation_id` o filtro                                           | SITE_AREA_LOCATION — territorio persistido de la operación                                                                                    | Actor ejecutor solo como relación                                                              | Lectura de eventos/estados; auditoría estándar                                                                     |
| `nexo.inventory.stock_validations.perform`   | `STOCK_VALIDATION`           | Conjunto de stock/ubicaciones + resultados propuestos             | SITE_AREA_SET — todos los miembros del conjunto deben quedar autorizados                                                                      | Ejecutor atribuido, sin propiedad                                                              | Sesión única; idempotencia; bloqueo o snapshot de stock; diferencias append-only; auditoría reforzada              |
| `nexo.inventory.stock_counts.view`           | `STOCK_COUNT`                | `count_id` o filtro                                               | SITE_AREA_SET — territorio y conjunto persistidos                                                                                             | Responsable/contador como relación                                                             | Lectura de snapshot y resultados; auditoría sensible                                                               |
| `nexo.inventory.stock_counts.perform`        | `STOCK_COUNT`                | `count_id` + captura de líneas                                    | SITE_AREA_SET — conjunto cerrado del conteo; no admitir ítems externos                                                                        | Ejecutor atribuido, sin propiedad                                                              | Estado abierto obligatorio; control de sesión; idempotencia por línea; snapshot/locks; auditoría reforzada         |
| `nexo.inventory.initial_counts.view`         | `INITIAL_STOCK_COUNT`        | `initial_count_session_id` o filtro                               | SITE_AREA_SET — territorio y conjunto persistidos                                                                                             | Responsable como relación                                                                      | Lectura de snapshot inicial; auditoría sensible                                                                    |
| `nexo.inventory.remissions.view`             | `REMISSION`                  | `remission_id` o filtro relacional                                | REMISSION_RELATION — origen, destino, áreas, ruta y actores; lectura por relación legítima                                                    | Creador, solicitante, preparador, transportador o receptor como relaciones; no propiedad total | Lectura de estado versionado; ocultar campos de lados no autorizados cuando proceda; auditoría estándar            |
| `nexo.inventory.remissions.update`           | `REMISSION`                  | `remission_id` + versión + cambios propuestos                     | REMISSION_BOTH — autorizar territorio vigente y cualquier territorio propuesto modificado                                                     | OWN solo para solicitud propia en estados editables; terceros por responsabilidad              | Solo campos y estados editables; control optimista; revalidar ruta/lados; auditoría antes/después                  |
| `nexo.inventory.remissions.request`          | `REMISSION`                  | Borrador con solicitante/destino, origen permitido, líneas y ruta | REQUEST_SIDE — autoridad sobre lado solicitante/destino + ruta válida; origen se valida como destino de solicitud, no como autoridad de stock | Solicitante funcional mientras el estado lo permita                                            | Creación idempotente; validar políticas/presentaciones/ruta; estado inicial solicitado; auditoría de mutación      |
| `nexo.inventory.remissions.prepare`          | `REMISSION`                  | `remission_id` + líneas preparadas                                | ORIGIN_SIDE — sede/área/ubicaciones de origen                                                                                                 | Responsabilidad de preparación; no propiedad                                                   | Solo estado preparable; reservas y stock atómicos; idempotencia por línea; auditoría reforzada                     |
| `nexo.inventory.remissions.dispatch`         | `REMISSION`                  | `remission_id` + asignación/confirmación logística                | ORIGIN_ROUTE — origen y segmento logístico asignado                                                                                           | Responsabilidad de despacho/transporte                                                         | Solo estado despachable; transición atómica e idempotente; auditoría reforzada                                     |
| `nexo.inventory.remissions.receive`          | `REMISSION`                  | `remission_id` + cantidades/observaciones recibidas               | DESTINATION_SIDE — sede/área/ubicaciones de destino                                                                                           | Responsabilidad de recepción                                                                   | Solo estado recibible; entrada de inventario atómica; idempotencia por recepción; auditoría reforzada              |
| `nexo.inventory.remissions.cancel`           | `REMISSION`                  | `remission_id` + motivo                                           | RESPONSIBLE_SIDE_BY_STATE — lado autorizado depende del estado y participación                                                                | OWN solo para solicitud propia cancelable; terceros por responsabilidad explícita              | Solo estado cancelable; bloqueo/versión; compensaciones atómicas; evento idempotente; auditoría reforzada          |
| `nexo.logistics.operations_board.view`       | `LOGISTICS_BOARD`            | Filtro normalizado de operaciones                                 | RELATION_SET — cada operación se resuelve por sedes, áreas, ruta y actor                                                                      | Actor relacionado o supervisor territorial                                                     | Consulta paginada; agregación sin inferir territorios ocultos; auditoría estándar                                  |
| `nexo.logistics.operations.view`             | `LOGISTICS_OPERATION`        | `operation_id` o filtro                                           | RELATION_SIDES — sedes, áreas, ruta, vehículo y actores de la operación                                                                       | Participante/asignado como relación                                                            | Lectura de estado vigente/histórico; auditoría estándar                                                            |
| `nexo.logistics.driver_operations.view`      | `DRIVER_OPERATION`           | `operation_id`, `driver_id` o filtro                              | DRIVER_RELATION — rutas/sedes/asignaciones del conductor objetivo                                                                             | `OWN` para el conductor; terceros solo por alcance explícito                                   | Lectura sensible; paginación/filtrado servidor; auditoría sensible                                                 |
| `nexo.logistics.fulfillment.view`            | `FULFILLMENT_TASK`           | `task_id` o filtro                                                | RELATION_SIDES — rutas, sedes, áreas y recursos asociados                                                                                     | Actor asignado o supervisor por relación                                                       | Lectura de estado; auditoría estándar                                                                              |
| `nexo.logistics.fulfillment_routes.view`     | `FULFILLMENT_ROUTE`          | `route_id` o filtro                                               | ROUTE_ENDPOINTS — todos los extremos declarados; en operación solo rutas aplicables                                                           | Sin propiedad                                                                                  | Lectura de configuración vigente/versionada; auditoría de configuración                                            |
| `nexo.logistics.supply_routes.view`          | `SUPPLY_ROUTE`               | `route_id` o filtro                                               | ROUTE_ENDPOINTS — sedes/áreas/tipos de ambos extremos y reglas                                                                                | Sin propiedad                                                                                  | Lectura de configuración vigente/versionada; auditoría de configuración                                            |
| `nexo.finance.internal_invoices.view`        | `INTERNAL_INVOICE`           | `invoice_id` o filtro                                             | FINANCIAL_PARTIES — sedes, áreas, centros de costo y operación origen                                                                         | Sin propiedad; creador solo como dato                                                          | Lectura del documento; importes protegidos por permiso separado; auditoría sensible                                |
| `nexo.finance.internal_invoices.generate`    | `INTERNAL_INVOICE`           | Operaciones origen + borrador de partes/centros de costo          | FINANCIAL_PARTIES_DRAFT — todos los lados y centros deben resolverse                                                                          | Sin propiedad                                                                                  | Generación idempotente por periodo/origen; snapshot de líneas; auditoría financiera                                |
| `nexo.finance.internal_invoices.issue`       | `INTERNAL_INVOICE`           | `invoice_id` + versión                                            | FINANCIAL_PARTIES — territorio del documento exacto                                                                                           | Sin propiedad                                                                                  | Solo estado emitible; bloqueo de fila; transición idempotente; auditoría financiera reforzada                      |
| `nexo.finance.internal_invoices.cancel`      | `INTERNAL_INVOICE`           | `invoice_id` + motivo                                             | FINANCIAL_PARTIES — territorio del documento exacto                                                                                           | Sin propiedad                                                                                  | Solo estado cancelable; bloqueo de fila; compensación/nota según contrato; auditoría financiera reforzada          |
| `nexo.finance.internal_invoice_amounts.view` | `INTERNAL_INVOICE_AMOUNTS`   | `invoice_id`                                                      | FINANCIAL_PARTIES — hereda contrato territorial de la factura                                                                                 | Sin propiedad                                                                                  | Lectura de campos económicos únicamente; auditoría sensible de acceso                                              |
| `nexo.finance.internal_prices.view`          | `INTERNAL_PRICE`             | `price_id` o filtro por producto/vigencia                         | DECLARED_SCOPE — organización, negocio, sede y vigencia del precio                                                                            | Sin propiedad                                                                                  | Solo versión vigente o histórica solicitada; auditoría sensible/configuración                                      |
| `nexo.finance.internal_variances.view`       | `INTERNAL_VARIANCE`          | `variance_id` o filtro                                            | OPERATION_RELATION — documento/operación, sedes, áreas y centros de costo                                                                     | Sin propiedad                                                                                  | Lectura del estado y evidencia; auditoría sensible                                                                 |
| `nexo.finance.internal_variances.approve`    | `INTERNAL_VARIANCE`          | `variance_id` + versión                                           | OPERATION_INTERSECTION — recurso exacto ∩ alcance base ∩ contexto operativo                                                                   | Aprobador no es propietario                                                                    | Solo estado aprobable; bloqueo; decisión idempotente; separación de funciones; auditoría reforzada                 |
| `nexo.finance.internal_variances.resolve`    | `INTERNAL_VARIANCE`          | `variance_id` + resolución + versión                              | OPERATION_INTERSECTION — recurso exacto ∩ alcance base ∩ contexto operativo                                                                   | Resolutor no es propietario                                                                    | Solo estado resoluble; bloqueo; resolución idempotente; evidencia obligatoria; auditoría reforzada                 |
| `nexo.finance.cost_centers.view`             | `COST_CENTER`                | `cost_center_id` o filtro                                         | COST_CENTER_SCOPE — organización, negocio, sede o área declarados por el centro                                                               | Sin propiedad                                                                                  | Lectura vigente/versionada; auditoría sensible                                                                     |
| `nexo.analytics.internal_reports.view`       | `ANALYTICS_RESULT`           | Consulta normalizada con dimensiones autorizables                 | AGGREGATE_MEMBERS — autorizar cada miembro territorial antes de agregar                                                                       | Sin propiedad                                                                                  | Snapshot reproducible; supresión de celdas pequeñas/inferibles cuando aplique; auditoría sensible                  |
| `nexo.analytics.margin_reports.view`         | `MARGIN_RESULT`              | Consulta normalizada con dimensiones autorizables                 | AGGREGATE_MEMBERS — autorizar cada sede/área/producto/centro incluido                                                                         | Sin propiedad                                                                                  | Snapshot reproducible; campos económicos protegidos; auditoría sensible                                            |
| `nexo.printing.templates.update`             | `PRINT_TEMPLATE`             | `template_id` + versión + contenido propuesto                     | DECLARED_SCOPE — organización, app, sede, área o dispositivo declarado por plantilla                                                          | Creador no es propietario autorizante                                                          | Configuración versionada; control optimista; validación/preview; auditoría antes/después                           |
| `nexo.printing.jobs.view`                    | `PRINT_JOB`                  | `job_id` o filtro                                                 | PRINT_RELATION — recurso origen + dispositivo + sede/área + actor                                                                             | `OWN` para trabajo propio; terceros por soporte/supervisión                                    | Evento/estado de cola; lectura sensible cuando incluye payload; auditoría estándar                                 |
| `nexo.settings.sites.view`                   | `SITE_DEFINITION`            | `site_id` o filtro                                                | SITE_SELF — la sede definida es el recurso; puntos técnicos y aislados requieren clasificación explícita                                      | Sin propiedad                                                                                  | Lectura de configuración vigente; auditoría de configuración                                                       |
| `nexo.settings.remission_policies.view`      | `REMISSION_POLICY`           | `policy_id` o consulta de aplicabilidad                           | DECLARED_SCOPE — organización, sede, tipo, área o ruta declarados                                                                             | Sin propiedad                                                                                  | Lectura de versión activa/histórica; auditoría de configuración                                                    |

##### 15.6 NUMERA — 6

| Permiso                                   | Tipo de recurso        | Localizador                           | Resolución territorial                                                           | Sujeto / propiedad                                                      | Estado, concurrencia y auditoría                                                    |
| ----------------------------------------- | ---------------------- | ------------------------------------- | -------------------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| `numera.access`                           | `APP_SURFACE`          | `app_code` canónico                   | NT — no existe territorio de recurso                                             | Sin sujeto ni propiedad                                                 | Sin estado empresarial; decisión auditable                                          |
| `numera.finance.cost_centers.view`        | `COST_CENTER`          | `cost_center_id` o filtro             | COST_CENTER_SCOPE — organización, negocio, sede o área declarados                | Sin propiedad                                                           | Lectura vigente/versionada; auditoría sensible                                      |
| `numera.finance.expenses.view`            | `EXPENSE`              | `expense_id` o filtro                 | EXPENSE_SCOPE — centro de costo, sede, área, documento y actor                   | `OWN` para creador cuando la concesión lo admita; no bypass territorial | Lectura de documento/estado; auditoría sensible                                     |
| `numera.analytics.break_even.view`        | `BREAK_EVEN_RESULT`    | Consulta normalizada                  | AGGREGATE_MEMBERS — todos los miembros territoriales incluidos deben autorizarse | Sin propiedad                                                           | Snapshot reproducible; evitar inferencia de territorios ocultos; auditoría sensible |
| `numera.analytics.profitability.view`     | `PROFITABILITY_RESULT` | Consulta normalizada                  | AGGREGATE_MEMBERS — sedes, áreas, negocios, productos y centros incluidos        | Sin propiedad                                                           | Snapshot reproducible; protección de campos económicos; auditoría sensible          |
| `numera.analytics.financial_reports.view` | `FINANCIAL_REPORT`     | Reporte exacto o consulta normalizada | AGGREGATE_MEMBERS — resolver y autorizar cada dimensión incluida                 | Sin propiedad                                                           | Snapshot reproducible/versionado; auditoría sensible                                |

##### 15.7 ORIGO — 5

| Permiso                                  | Tipo de recurso        | Localizador                                    | Resolución territorial                                                                                   | Sujeto / propiedad                         | Estado, concurrencia y auditoría                                                                          |
| ---------------------------------------- | ---------------------- | ---------------------------------------------- | -------------------------------------------------------------------------------------------------------- | ------------------------------------------ | --------------------------------------------------------------------------------------------------------- |
| `origo.access`                           | `APP_SURFACE`          | `app_code` canónico                            | NT — no existe territorio de recurso                                                                     | Sin sujeto ni propiedad                    | Sin estado empresarial; decisión auditable                                                                |
| `origo.procurement.purchase_orders.view` | `PURCHASE_ORDER`       | `purchase_order_id` o filtro                   | PO_DESTINATIONS — negocio, proveedor y todos los destinos/áreas mostrados                                | Comprador solo como relación; no propiedad | Lectura de estado/versiones; proyección parcial si no se autorizan todos los destinos; auditoría sensible |
| `origo.procurement.receipts.view`        | `PURCHASE_RECEIPT`     | `receipt_id` o filtro                          | RECEIPT_DESTINATION — orden, sede, área, ubicación y productos recibidos                                 | Receptor solo como relación                | Lectura append-only/versionada; auditoría sensible                                                        |
| `origo.procurement.suppliers.view`       | `SUPPLIER`             | `supplier_id` o relación desde orden/recepción | SUPPLIER_SCOPE — organización/negocio; carril operativo limitado a proveedor vinculado al recurso activo | Sin propiedad                              | Lectura con field mask operativo; datos sensibles requieren autorización base; auditoría sensible         |
| `origo.catalog.product_reviews.view`     | `PRODUCT_REVIEW_QUEUE` | `review_id` o filtro de cola                   | ORG — cola organizacional exacta; filtros por sede no crean territorio                                   | Revisor/creador solo como relación         | Lectura del estado de revisión; auditoría estándar                                                        |

##### 15.8 VENTO PASS — 1

| Permiso       | Tipo de recurso | Localizador         | Resolución territorial               | Sujeto / propiedad      | Estado, concurrencia y auditoría           |
| ------------- | --------------- | ------------------- | ------------------------------------ | ----------------------- | ------------------------------------------ |
| `pass.access` | `APP_SURFACE`   | `app_code` canónico | NT — no existe territorio de recurso | Sin sujeto ni propiedad | Sin estado empresarial; decisión auditable |

##### 15.9 PULSO — 2

| Permiso                              | Tipo de recurso | Localizador                      | Resolución territorial                                                                             | Sujeto / propiedad                                                       | Estado, concurrencia y auditoría                                                                                    |
| ------------------------------------ | --------------- | -------------------------------- | -------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------- |
| `pulso.access`                       | `APP_SURFACE`   | `app_code` canónico              | NT — no existe territorio de recurso                                                               | Sin sujeto ni propiedad                                                  | Sin estado empresarial; decisión auditable                                                                          |
| `pulso.delivery.deliveries.override` | `DELIVERY`      | `delivery_id` + motivo + versión | DELIVERY_INTERSECTION — orden, sede comercial, área operativa, ruta y responsable ∩ ambos carriles | Responsable/asignado como relación; tercero solo por excepción explícita | Solo estado excepcionalmente confirmable; reautenticación según CAT-014; bloqueo; idempotencia; auditoría reforzada |

##### 15.10 VISO — 17

| Permiso                                       | Tipo de recurso       | Localizador                                       | Resolución territorial                                                                                  | Sujeto / propiedad                                                        | Estado, concurrencia y auditoría                                                                |
| --------------------------------------------- | --------------------- | ------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| `viso.access`                                 | `APP_SURFACE`         | `app_code` canónico                               | NT — no existe territorio de recurso                                                                    | Sin sujeto ni propiedad                                                   | Sin estado empresarial; decisión auditable                                                      |
| `viso.platform.app_updates.view`              | `APP_UPDATE`          | `update_id` o filtro                              | ORG_TECH — organización/entorno exactos; sin territorio laboral                                         | Sin propiedad                                                             | Lectura de publicación/historial; secretos excluidos; auditoría estándar                        |
| `viso.organization.businesses.view`           | `BUSINESS_UNIT`       | `business_id` o filtro                            | ORG_UNIT — organización y unidad exactas; no usar sede como sustituto                                   | Sin propiedad                                                             | Lectura vigente; auditoría de configuración                                                     |
| `viso.workforce.employees.view`               | `EMPLOYEE_PROFILE`    | `target_employee_id` o filtro                     | EMPLOYEE — relaciones activas del trabajador objetivo ∩ alcance concedido                               | `OWN` para expediente propio autorizado; terceros por cobertura           | Lectura con field masks; auditoría sensible                                                     |
| `viso.workforce.staff_calendar.view`          | `STAFF_CALENDAR`      | `target_employee_id` + rango o filtro             | EMPLOYEE_EVENT_SET — cada evento/turno se resuelve por trabajador, sede y área                          | `OWN` para calendario propio; terceros por cobertura                      | Lectura paginada por rango; evitar inferencia de eventos ocultos; auditoría sensible            |
| `viso.workforce.schedules.view`               | `SHIFT`               | `shift_id` o filtro                               | SHIFT_SET — cada turno usa sede/área persistidas                                                        | `OWN` para turnos propios cuando aplique; terceros por cobertura          | Lectura de estado/versiones; auditoría sensible                                                 |
| `viso.workforce.vacancies.view`               | `VACANCY`             | `vacancy_id` o filtro                             | DECLARED_SCOPE — organización, negocio, sede y área declarados; vacante corporativa usa ORG exacto      | Sin propiedad                                                             | Solo vacantes visibles/activas según consulta; auditoría estándar                               |
| `viso.authorization.context_simulations.view` | `CONTEXT_SIMULATION`  | `simulation_session_id` o filtro del actor real   | SIMULATION_SCOPE — `real_actor_id` propietario + alcance real; contexto simulado no crea territorio     | `OWN` por `real_actor_id`; terceros solo con concesión sensible explícita | Sesión expirable y no ejecutable; registro append-only de decisiones; auditoría de autorización |
| `viso.authorization.audit_logs.view`          | `AUDIT_EVENT`         | `audit_event_id` o filtro                         | RECURSIVE_EVENT — resolver actor, permiso, recurso y snapshot territorial del evento                    | Sin propiedad automática; eventos propios no se presumen                  | Evento inmutable append-only; filtros servidor; auditoría del acceso a la auditoría             |
| `viso.catalog.commercial_categories.view`     | `COMMERCIAL_CATEGORY` | `category_id` o filtro                            | DECLARED_SCOPE — organización, unidad, canal y territorio opcional del recurso                          | Sin propiedad                                                             | Lectura vigente/versionada; auditoría de configuración                                          |
| `viso.content.content_blocks.view`            | `CONTENT_BLOCK`       | `content_block_id` o filtro                       | DECLARED_SCOPE — organización, negocio, canal, sede y área declarados                                   | Sin propiedad                                                             | Lectura de versión/publicación solicitada; auditoría estándar                                   |
| `viso.content.menu.view`                      | `MENU`                | `menu_id` o filtro                                | DECLARED_SCOPE — organización, negocio, canal y sede declarados                                         | Sin propiedad                                                             | Lectura de versión publicada/borrador autorizado; auditoría estándar                            |
| `viso.content.website_content.view`           | `WEBSITE_CONTENT`     | `content_id` o filtro                             | DECLARED_SCOPE — organización, marca, negocio, canal y territorio opcional                              | Sin propiedad                                                             | Lectura de versión/publicación; auditoría estándar                                              |
| `viso.finance.accounting.view`                | `ACCOUNTING_DATA`     | Documento, asiento, cuenta o consulta normalizada | FINANCIAL_SCOPE — organización, negocio, centro de costo, sede y área del dato                          | Sin propiedad                                                             | Lectura con field masks y snapshot; auditoría financiera sensible                               |
| `viso.delivery.rates.view`                    | `DELIVERY_RATE`       | `rate_id` o filtro                                | DECLARED_SCOPE — negocio, sede, zona, cobertura y ruta                                                  | Sin propiedad                                                             | Lectura de versión/vigencia; auditoría de configuración                                         |
| `viso.loyalty.products.view`                  | `LOYALTY_PRODUCT`     | `loyalty_product_id` o filtro                     | CLIENT_CONFIG_SCOPE — organización, negocio, campaña; sede solo como aplicabilidad                      | Sin propiedad                                                             | Lectura de versión/vigencia; no concede datos de clientes; auditoría estándar                   |
| `viso.loyalty.customers.view`                 | `LOYALTY_CUSTOMER`    | `customer_id` o filtro autorizado                 | CLIENT_DOMAIN — organización/negocio del cliente; sede es filtro de actividad, no propiedad territorial | Sin `OWN` laboral; identidad cliente separada                             | Lectura con minimización/field masks; paginación servidor; auditoría sensible                   |

#### 16. Resumen cuantitativo

##### 16.1 Cobertura

| Elemento                                          | Cantidad |
| ------------------------------------------------- | -------: |
| Permisos canónicos evaluados                      |      112 |
| Tipos lógicos de recurso utilizados               |       78 |
| Estrategias principales de resolución territorial |       59 |
| Permisos sin contrato                             |        0 |
| Permisos duplicados                               |        0 |

##### 16.2 Por aplicación

| Aplicación | Permisos |
| ---------- | -------: |
| SHELL      |        1 |
| ANIMA      |       10 |
| AURA       |        1 |
| FOGO       |        6 |
| NEXO       |       63 |
| NUMERA     |        6 |
| ORIGO      |        5 |
| VENTO PASS |        1 |
| PULSO      |        2 |
| VISO       |       17 |
| **Total**  |  **112** |

##### 16.3 Familias de resolución más frecuentes

| Familia lógica                 | Permisos |
| ------------------------------ | -------: |
| `NT`                           |       10 |
| `DECLARED_SCOPE`               |       10 |
| `ORG`                          |        7 |
| `SITE_AREA`                    |        6 |
| `EMPLOYEE`                     |        5 |
| `SITE_AREA_SET`                |        5 |
| `AGGREGATE_MEMBERS`            |        5 |
| `FINANCIAL_PARTIES`            |        4 |
| `RELATION_SIDES`               |        3 |
| `SITE_AREA_LOCATION`           |        3 |
| `SITE_AREA_DRAFT`              |        2 |
| `ORIGIN_DESTINATION`           |        2 |
| `ROUTE_ENDPOINTS`              |        2 |
| `OPERATION_INTERSECTION`       |        2 |
| `COST_CENTER_SCOPE`            |        2 |
| `EMPLOYEE_SET`                 |        1 |
| `INTENDED_WORKFORCE`           |        1 |
| `SHIFT_DRAFT`                  |        1 |
| `SHIFT_BOTH`                   |        1 |
| `SHIFT`                        |        1 |
| `APPLICABILITY`                |        1 |
| `ORG_DRAFT`                    |        1 |
| `SITE_AREA_CUSTODY`            |        1 |
| `SITE_AREA_LOCATION_DRAFT`     |        1 |
| `DESTINATION`                  |        1 |
| `DESTINATION_DRAFT`            |        1 |
| `DESTINATION_INTERSECTION`     |        1 |
| `SAME_TERRITORY_OR_VALID_MOVE` |        1 |
| `LPN_TERRITORY`                |        1 |
| `BOTH_SIDES_REQUIRED`          |        1 |
| `ORIGIN`                       |        1 |
| `ORIGIN_DRAFT`                 |        1 |
| `REMISSION_RELATION`           |        1 |
| `REMISSION_BOTH`               |        1 |
| `REQUEST_SIDE`                 |        1 |
| `ORIGIN_SIDE`                  |        1 |
| `ORIGIN_ROUTE`                 |        1 |
| `DESTINATION_SIDE`             |        1 |
| `RESPONSIBLE_SIDE_BY_STATE`    |        1 |
| `RELATION_SET`                 |        1 |
| `DRIVER_RELATION`              |        1 |
| `FINANCIAL_PARTIES_DRAFT`      |        1 |
| `OPERATION_RELATION`           |        1 |
| `PRINT_RELATION`               |        1 |
| `SITE_SELF`                    |        1 |
| `EXPENSE_SCOPE`                |        1 |
| `PO_DESTINATIONS`              |        1 |
| `RECEIPT_DESTINATION`          |        1 |
| `SUPPLIER_SCOPE`               |        1 |
| `DELIVERY_INTERSECTION`        |        1 |
| `ORG_TECH`                     |        1 |
| `ORG_UNIT`                     |        1 |
| `EMPLOYEE_EVENT_SET`           |        1 |
| `SHIFT_SET`                    |        1 |
| `SIMULATION_SCOPE`             |        1 |
| `RECURSIVE_EVENT`              |        1 |
| `FINANCIAL_SCOPE`              |        1 |
| `CLIENT_CONFIG_SCOPE`          |        1 |
| `CLIENT_DOMAIN`                |        1 |

La cantidad de familias no implica tablas separadas. AUTH-CAT-017 deberá serializar estas decisiones en un catálogo versionado sin perder la semántica por permiso.

#### 17. Ejemplos normativos

##### 17.1 Actualizar un turno y cambiarlo de sede

La autorización debe comprobar:

- el turno existente;
- su sede y área vigentes;
- la sede y área propuestas;
- la cobertura sobre el trabajador objetivo;
- el estado editable;
- la versión esperada;
- los solapamientos resultantes.

Autoridad sobre la nueva sede sin autoridad sobre la sede actual no permite mover silenciosamente el turno.

##### 17.2 Crear traslado de inventario

Se resuelven origen y destino completos. Ambos deben quedar autorizados. La mutación reserva y descuenta stock de forma atómica y utiliza idempotencia.

##### 17.3 Solicitar una remisión

El actor necesita autoridad sobre el lado solicitante y una ruta válida. No necesita autoridad de inventario sobre el origen únicamente para crear la solicitud. Preparar la remisión sí exige autoridad sobre el origen.

##### 17.4 Consultar factura sin importes

`nexo.finance.internal_invoices.view` puede autorizar el documento y ocultar importes. Los importes solo se revelan cuando también se autoriza `nexo.finance.internal_invoice_amounts.view`.

##### 17.5 Simular una validación de stock

La simulación puede construir un conjunto sintético y producir `would_allow`, `would_deny` o `indeterminate`. No bloquea stock, no registra diferencias y no crea movimientos reales.

#### 18. Razones contractuales de bloqueo

| Razón                                | Significado                                                               |
| ------------------------------------ | ------------------------------------------------------------------------- |
| `resource_reference_required`        | Falta la referencia estable del recurso existente.                        |
| `resource_not_found`                 | El recurso no existe o no es visible dentro de la frontera de resolución. |
| `resource_contract_missing`          | El permiso no tiene contrato versionado.                                  |
| `resource_type_mismatch`             | El recurso no corresponde al tipo declarado por el permiso.               |
| `resource_territory_unresolved`      | No pudo resolverse una dimensión territorial obligatoria.                 |
| `resource_territory_conflict`        | Las relaciones territoriales del recurso se contradicen.                  |
| `resource_isolated_domain_denied`    | El recurso pertenece a una sede o dominio aislado no concedido.           |
| `resource_current_scope_denied`      | El territorio vigente queda fuera del alcance.                            |
| `resource_proposed_scope_denied`     | El territorio propuesto por una actualización queda fuera del alcance.    |
| `resource_required_side_denied`      | Uno de los lados obligatorios no está autorizado.                         |
| `resource_relation_required`         | El actor no mantiene la relación funcional exigida.                       |
| `resource_ownership_not_satisfied`   | La variante `OWN` no se cumple.                                           |
| `resource_state_not_allowed`         | El recurso no está en un estado válido para la acción.                    |
| `resource_version_conflict`          | El recurso cambió desde la decisión o versión esperada.                   |
| `resource_idempotency_conflict`      | La clave de idempotencia ya representa otra solicitud.                    |
| `resource_field_permission_required` | El recurso es visible, pero el campo solicitado requiere otro permiso.    |
| `resource_bulk_member_denied`        | Al menos un miembro de una operación masiva no está autorizado.           |
| `resource_aggregate_member_denied`   | Un miembro territorial del agregado está excluido.                        |
| `resource_snapshot_required`         | La lectura o mutación requiere un snapshot consistente no disponible.     |
| `resource_simulation_indeterminate`  | La simulación no puede resolver el contrato con seguridad.                |

#### 19. Invariantes

- Todo permiso canónico declara un tipo de recurso y un localizador.
- El recurso se resuelve del lado servidor.
- El cliente no declara autoritativamente la sede o el área de un recurso existente.
- El contexto del actor limita el recurso; no crea su territorio.
- La sede seleccionada no sustituye el territorio del recurso.
- La sede primaria no es fallback universal.
- El área del dispositivo solo restringe.
- Un área debe pertenecer a la sede resuelta.
- Los recursos históricos usan el snapshot territorial aplicable.
- Las colecciones se filtran en servidor.
- Los agregados no incluyen ni permiten inferir territorios excluidos.
- Las operaciones masivas no crean autoridad masiva implícita.
- `OWN` deriva de una relación explícita.
- Crear, registrar o custodiar un recurso no concede autoridad automática.
- Cambiar territorio exige autorizar el territorio actual y el propuesto.
- Los recursos multilado declaran qué extremos exige cada acción.
- Los traslados exigen origen y destino.
- Las acciones de remisión conservan sus lados diferenciados.
- Autorizar un recurso no autoriza todos sus campos.
- Toda mutación declara predicado de estado.
- Toda mutación crítica controla concurrencia e idempotencia.
- Las mutaciones de stock son atómicas.
- La decisión y la escritura no pueden separarse sin revalidación.
- APP-REVIEW y dominios aislados no entran por alcance ordinario.
- PASS conserva separada la identidad cliente.
- AURA continúa diferida.
- El dispositivo no amplía el contrato.
- La simulación no ejecuta el contrato mutador real.
- Las denegaciones explícitas conservan precedencia.
- Un contrato ausente o inválido deniega.
- Los aliases heredan el contrato de la clave canónica.
- Los permisos legacy y técnicos retirados no reciben contrato independiente.
- Cambiar el contrato de un permiso activo es un cambio versionado y potencialmente incompatible.

#### 20. Criterios de aprobación

AUTH-CAT-016 podrá aprobarse cuando se acepte expresamente que:

- los 112 permisos tienen un contrato explícito;
- cada permiso declara recurso, localizador, resolución territorial, sujeto o propiedad y reglas de estado/concurrencia;
- los campos indicados son lógicos y no presuponen una implementación física;
- el recurso se resuelve antes de comparar alcance y contexto;
- no existe fallback territorial permisivo;
- las creaciones se autorizan sobre un borrador normalizado;
- las actualizaciones territoriales autorizan estado actual y propuesto;
- los recursos multilado aplican la regla específica de cada acción;
- las listas, agregados y operaciones masivas se resuelven por miembro;
- la propiedad no reemplaza ninguna otra condición;
- los campos sensibles pueden exigir permisos separados;
- las mutaciones críticas son atómicas, idempotentes y auditables;
- la simulación produce decisión hipotética y no efectos;
- AUTH-CAT-011 a AUTH-CAT-015 permanecen intactas;
- no se implementa código ni migraciones en esta tarea.

#### 21. Impacto sobre tareas posteriores

##### AUTH-CAT-017

Deberá crear en `vento-shell` un catálogo versionado que serialice, como mínimo:

- `resource_type`;
- localizador y modo de operación;
- resolutor territorial;
- relación `OWN`;
- lados obligatorios;
- estado, concurrencia, campos y auditoría;
- versión contractual y compatibilidad.

No podrá reducir esta matriz a un único `scope_type`.

##### AUTH-CAT-018

Los tipos TypeScript deberán derivarse del catálogo y representar resultados `RESOLVED`, `MULTI_RESOLVED`, `NOT_APPLICABLE`, `UNRESOLVED`, `CONFLICT` e `ISOLATED`.

##### AUTH-CAT-019

Los guards y resolutores deberán consumir claves tipadas y contratos canónicos; no reconstruir rutas territoriales manualmente en cada aplicación.

##### BLOQUE D

Las matrices solo podrán conceder alcances compatibles con el contrato del recurso. Una asignación incompatible deberá denegar y registrar configuración inválida.

##### BLOQUE E

`AccessContext` deberá mantenerse separado del recurso. `AuthorizationDecision` deberá registrar al menos permiso, recurso, resolución territorial, lados evaluados, estado, propiedad, campos, versión y razones.

#### 22. Estado final de la propuesta

| Tarea        | Estado      |
| ------------ | ----------- |
| AUTH-CAT-015 | APROBADA    |
| AUTH-CAT-016 | APROBADA    |
| AUTH-CAT-017 | NO INICIADA |

No se avanza a AUTH-CAT-017 hasta recibir aprobación explícita.


