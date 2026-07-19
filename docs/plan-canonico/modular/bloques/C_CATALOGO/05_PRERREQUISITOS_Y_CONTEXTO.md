### ✅ AUTH-CAT-012 — Definir prerrequisitos de turno y check-in de cada permiso

#### 1. Identificación de la tarea

Bloque: BLOQUE C — Catálogo canónico de aplicaciones y permisos.
Tarea: AUTH-CAT-012 — Definir prerrequisitos de turno y check-in de cada permiso.
Versión documental de origen: 2026-07-18.
Revisión documental de origen: 18.
Estado: APROBADA.
Naturaleza: definición documental.
Implementación: no incluida.
Tarea anterior vigente: AUTH-CAT-011 — Definir alcance permitido de cada permiso.
Tarea posterior reservada: AUTH-CAT-013 — Definir permisos que exigen área activa.

Progreso actualizado:

AUTH-CAT-001 a AUTH-CAT-012
→ APROBADAS

AUTH-CAT-013 a AUTH-CAT-019
→ PENDIENTES

AUTH-CAT-012 fue aprobada explícitamente el 18 de julio de 2026.

#### 2. Objetivo

Definir, para cada uno de los 112 permisos canónicos, si su evaluación exige:

un turno vigente;
un check-in activo;
ambos;
ninguno.

La decisión se realiza por permiso y por carril de autorización.

La tarea debe permitir distinguir claramente:

PERMISO BASE
→ puede existir sin turno

PERMISO OPERATIVO
→ puede exigir turno

PERMISO OPERATIVO PRESENCIAL
→ puede exigir turno y check-in

PERMISO BASE Y OPERATIVO
→ evalúa cada carril de forma independiente

#### 3. Alcance de la tarea

AUTH-CAT-012 determina exclusivamente:

si el carril base exige turno;
si el carril base exige check-in;
si el carril operativo exige turno;
si el carril operativo exige check-in;
cómo se comportan los permisos BASE_OR_OPERATIONAL;
cómo se comportan los permisos BASE_AND_OPERATIONAL;
qué ocurre cuando existe turno pero no check-in;
qué ocurre cuando existe un check-in incompatible;
qué ocurre al finalizar el turno o cerrar el check-in;
la matriz explícita de los 112 permisos.

AUTH-CAT-012 no determina:

qué permisos exigen área activa;
qué roles reciben cada permiso;
qué dispositivos compartidos pueden ejecutarlo;
qué recursos pertenecen al actor;
qué estados del recurso permiten la acción;
qué alcance territorial recibe un rol;
qué sede o área concreta se resuelve;
compatibilidad con simulación;
implementación SQL;
estructuras de tablas;
RLS;
migraciones;
cambios en aplicaciones.

Los requisitos de área corresponden a AUTH-CAT-013.

#### 4. Base normativa

Esta propuesta conserva sin cambios:

ADR-AUTH-001;
AUTH-MOD-002 — Separación de rol base y operativo;
AUTH-MOD-007 — Sede asignada y sede activa;
AUTH-MOD-008 — Área asignada y área activa;
AUTH-MOD-009 — Turno publicado;
AUTH-MOD-010 — Check-in activo;
AUTH-MOD-018 — Precedencia entre permisos base y operativos;
AUTH-MOD-019 — Denegación explícita;
AUTH-CAT-001 a AUTH-CAT-011.

Regla de jerarquía:

MODALIDAD
→ define qué carril puede autorizar

ALCANCE
→ define sobre qué territorio o recurso

TURNO Y CHECK-IN
→ definen si el carril operativo está habilitado

ÁREA ACTIVA
→ se definirá en AUTH-CAT-013

Estas propiedades son independientes.

#### 5. Definiciones canónicas

5.1 Turno publicado

Un turno publicado es una asignación laboral comunicada oficialmente.

TURNO PUBLICADO
≠
TURNO VIGENTE

Un turno futuro publicado no habilita permisos operativos antes de su ventana temporal.

5.2 Turno vigente

Para esta tarea, un turno vigente debe cumplir como mínimo:

pertenece al actor efectivo;
corresponde a una revisión publicada;
es laboral;
no está cancelado;
no está retirado;
se encuentra dentro de la ventana temporal autorizada;
tiene sede válida;
tiene rol operativo válido;
el trabajador está activo;
no existe ambigüedad entre varios turnos elegibles.

La confirmación del trabajador no participa.

confirmed
→ NO AUTORIZA
→ NO BLOQUEA
→ NO REEMPLAZA PUBLICACIÓN

Cuando existan varios turnos simultáneamente elegibles y no pueda resolverse uno inequívocamente:

AMBIGÜEDAD DE TURNO
→ DENEGAR CARRIL OPERATIVO
5.3 Check-in activo

Un check-in activo debe:

pertenecer al actor efectivo;
estar confirmado por el servidor;
corresponder al turno vigente;
corresponder a la sede o punto de marcación admitido;
no estar cerrado;
no estar expirado;
no haber sido reemplazado;
no encontrarse únicamente pendiente en el cliente;
no depender de una solicitud offline todavía no confirmada.
SOLICITUD DE CHECK-IN
≠
CHECK-IN ACTIVO
5.4 Turno activo

Se conserva la definición aprobada:

TURNO ACTIVO
**=**
TURNO VIGENTE
+
CHECK-IN ACTIVO

Sin embargo, no todos los permisos operativos requieren un turno activo.

Un permiso puede declarar:

TURNO VIGENTE REQUERIDO
CHECK-IN NO REQUERIDO

En ese caso, el permiso puede evaluarse antes de la marcación, dentro de la ventana válida del turno.

5.5 Prerrequisito N

Código:

N

Significado:

TURNO
→ NO REQUERIDO

CHECK-IN
→ NO REQUERIDO

Se utiliza en el carril base.

No significa:

acceso global;
autorización automática;
ausencia de alcance;
ausencia de permiso;
ausencia de controles de recurso;
bypass de denegaciones.
5.6 Prerrequisito T

Código:

T

Significado:

TURNO VIGENTE
→ REQUERIDO

CHECK-IN ACTIVO
→ NO REQUERIDO

Se reserva para capacidades operativas que permiten:

entrar a una aplicación;
consultar referencias estables;
consultar configuraciones necesarias para prepararse;
revisar instrucciones o recursos aplicables al turno;
identificar por qué todavía no puede iniciarse una operación.

No permite mutaciones operativas.

5.7 Prerrequisito T+C

Código:

T+C

Significado:

TURNO VIGENTE
→ REQUERIDO

CHECK-IN ACTIVO
→ REQUERIDO

Equivale a exigir un turno activo.

Se utiliza para:

modificar estado empresarial;
registrar movimientos;
crear operaciones;
preparar, despachar o recibir recursos;
consultar estado operativo vivo o sensible;
consultar existencias;
consultar operaciones de otros trabajadores;
actuar sobre recursos compartidos;
ejecutar excepciones;
aprobar o resolver diferencias;
consultar trazabilidad operacional sensible.
5.8 Combinación prohibida

Queda prohibida la combinación:

TURNO
→ NO REQUERIDO

CHECK-IN
→ REQUERIDO

Un check-in activo siempre debe estar relacionado con un turno vigente.

#### 6. Reglas por modalidad de autorización

6.1 BASE_ONLY
CARRIL BASE
→ N

CARRIL OPERATIVO
→ NO APLICA

Un permiso BASE_ONLY nunca exige turno ni check-in.

Esto no significa que cualquier trabajador pueda recibirlo.

Debe existir:

concesión base;
alcance coincidente;
recurso coincidente;
ausencia de denegación aplicable.
6.2 OPERATIONAL_ONLY
CARRIL BASE
→ NO APLICA

CARRIL OPERATIVO
→ T o T+C

Todo permiso OPERATIONAL_ONLY exige al menos un turno vigente.

Ningún permiso OPERATIONAL_ONLY puede evaluarse con:

rol base legacy;
sede primaria;
perfil operativo predeterminado;
nombre del oficio;
bypass por nombre de rol.
6.3 BASE_OR_OPERATIONAL

Cada carril se evalúa independientemente:

CARRIL BASE
→ N

CARRIL OPERATIVO
→ T o T+C

Resultado:

BASE VÁLIDO
→ PUEDE AUTORIZAR SIN TURNO

OPERATIVO VÁLIDO
→ DEBE CUMPLIR SU PRERREQUISITO

AMBOS INVÁLIDOS
→ DENEGAR

El carril base no toma prestado el turno.

El carril operativo no toma prestados permisos base.

6.4 BASE_AND_OPERATIONAL
CARRIL BASE
→ N

CARRIL OPERATIVO
→ T+C

DECISIÓN FINAL
→ AMBOS CARRILES OBLIGATORIOS

Los cinco permisos de esta modalidad exigen turno y check-in por el carril operativo.

Una concesión base válida no permite ejecutar la acción sin contexto operativo.

#### 7. Comportamiento cuando no existe check-in

7.1 Permiso N
SIN CHECK-IN
→ NO AFECTA EL PERMISO
7.2 Permiso T
TURNO VIGENTE
+
SIN CHECK-IN
→ EL PRERREQUISITO PUEDE CUMPLIRSE

El usuario puede consultar únicamente las capacidades clasificadas como T.

7.3 Permiso T+C
TURNO VIGENTE
+
SIN CHECK-IN
→ DENEGAR CARRIL OPERATIVO

Razón canónica:

active_checkin_required

#### 8. Check-in incompatible

Aunque un permiso sea T, un check-in activo incompatible no se ignora silenciosamente.

Ejemplos:

check-in de otro turno;
check-in de otra sede;
check-in duplicado;
check-in cerrado;
check-in de un actor distinto;
check-in sin turno relacionado;
check-in asociado a una revisión retirada.

Resultado:

CONFLICTO ESTRUCTURAL DE CHECK-IN
→ DENEGAR CARRIL OPERATIVO

Razones posibles:

checkin_shift_mismatch
checkin_site_mismatch
checkin_actor_mismatch
multiple_active_checkins
invalid_active_checkin

#### 9. Entrada a aplicaciones antes del check-in

Los permisos operativos de entrada:

fogo.access;
nexo.access;
origo.access;
pulso.access;

requieren:

T

Esto permite entrar a la aplicación durante un turno vigente antes de marcar entrada.

La aplicación podrá mostrar:

Tu turno está vigente.

Para iniciar operaciones:
[ Registrar entrada ]

Pero no podrá mostrar o ejecutar capacidades T+C.

Ejemplo:

TURNO VIGENTE
CHECK-IN AUSENTE

NEXO
├── Entrar a la aplicación               ✅
├── Consultar productos                  ✅
├── Consultar ubicaciones                ✅
├── Consultar rutas aplicables           ✅
├── Consultar existencias                ❌
├── Consultar movimientos vivos          ❌
├── Registrar retiro                     ❌
└── Preparar remisión                     ❌

#### 10. Reglas transversales

Todo permiso operativo exige al menos un turno vigente.
Ningún permiso base exige turno o check-in.
Todo permiso mutador operativo exige T+C.
Todo permiso BASE_AND_OPERATIONAL exige T+C.
Los permisos operativos de entrada a aplicaciones utilizan T.
Las referencias operativas estables pueden utilizar T.
Las consultas de estado operativo vivo utilizan T+C.
Las consultas sensibles sobre operaciones de terceros utilizan T+C.
Un turno futuro no autoriza.
Un turno borrador no autoriza.
Un turno retirado no autoriza.
Un turno de descanso no autoriza.
Un turno sin rol operativo válido no autoriza.
Un perfil operativo predeterminado no reemplaza el turno.
Un rol base legacy no reemplaza el rol operativo.
El check-in no crea permisos.
El turno no crea permisos.
El check-in no amplía alcance.
El turno no amplía alcance.
La sede seleccionada no reemplaza la sede del turno.
El cierre del check-in revoca inmediatamente los permisos T+C.
El fin de la vigencia del turno revoca los permisos T y T+C.
Un permiso base válido continúa vigente al terminar el turno.
No existe bypass por propietario, gerente_general o cualquier nombre de rol.
Una concesión base explícita puede autorizar un permiso BASE_OR_OPERATIONAL sin turno.
En BASE_AND_OPERATIONAL, la concesión base no elimina el requisito operativo.
Un dispositivo compartido no elimina turno ni check-in.
Una simulación no crea un turno o check-in real.
APP-REVIEW no recibe excepciones automáticas.
PASS conserva separada la sesión del cliente.

#### 11. Matriz completa de los 112 permisos

Columnas:

BASE
→ prerrequisito del carril base

OPERATIVO
→ prerrequisito del carril operativo

Valores:

N
→ sin turno y sin check-in

T
→ turno vigente, sin check-in obligatorio

T+C
→ turno vigente y check-in activo

—
→ carril no admitido
11.1 SHELL — 1 permiso

| Permiso      | Modalidad | Base | Operativo | Decisión                                                          |
| ------------ | --------- | ---- | --------- | ----------------------------------------------------------------- |
| shell.access | BASE_ONLY | N    | —         | La entrada al hub es permanente. No depende de jornada operativa. |

11.2 ANIMA — 10 permisos

| Permiso                                   | Modalidad | Base | Operativo | Decisión                                                                                        |
| ----------------------------------------- | --------- | ---- | --------- | ----------------------------------------------------------------------------------------------- |
| anima.access                              | BASE_ONLY | N    | —         | ANIMA debe poder utilizarse fuera del turno para consultar programación y registrar asistencia. |
| anima.workforce.employee_documents.view   | BASE_ONLY | N    | —         | La consulta laboral no depende de jornada operativa.                                            |
| anima.workforce.employee_documents.upload | BASE_ONLY | N    | —         | La gestión documental laboral pertenece al carril base.                                         |
| anima.workforce.employee_documents.delete | BASE_ONLY | N    | —         | La eliminación documental requiere autoridad base, no presencia operativa.                      |
| anima.workforce.employee_photos.upload    | BASE_ONLY | N    | —         | La administración de fotografías laborales no depende del turno.                                |
| anima.workforce.team_members.view         | BASE_ONLY | N    | —         | La consulta del equipo es una capacidad laboral permanente.                                     |
| anima.workforce.staff_invitations.create  | BASE_ONLY | N    | —         | Invitar trabajadores es administración laboral.                                                 |
| anima.attendance.shifts.create            | BASE_ONLY | N    | —         | Crear turnos es planificación administrativa.                                                   |
| anima.attendance.shifts.update            | BASE_ONLY | N    | —         | Actualizar turnos es planificación administrativa.                                              |
| anima.attendance.shifts.cancel            | BASE_ONLY | N    | —         | Cancelar turnos es planificación administrativa.                                                |

11.3 AURA — 1 permiso

| Permiso     | Modalidad | Base | Operativo | Decisión                                                                   |
| ----------- | --------- | ---- | --------- | -------------------------------------------------------------------------- |
| aura.access | BASE_ONLY | N    | —         | La entrada a AURA no depende de turno. Su funcionalidad continúa diferida. |

11.4 FOGO — 6 permisos

| Permiso                          | Modalidad           | Base | Operativo | Decisión                                                                                           |
| -------------------------------- | ------------------- | ---- | --------- | -------------------------------------------------------------------------------------------------- |
| fogo.access                      | BASE_OR_OPERATIONAL | N    | T         | El carril operativo puede entrar durante un turno vigente antes del check-in.                      |
| fogo.production.batches.view     | BASE_OR_OPERATIONAL | N    | T+C       | Los lotes reflejan ejecución productiva viva y trabajo de otros actores.                           |
| fogo.production.batches.create   | OPERATIONAL_ONLY    | —    | T+C       | Crear un lote inicia estado productivo y exige presencia confirmada.                               |
| fogo.production.orders.view      | BASE_OR_OPERATIONAL | N    | T         | Las órdenes son instrucciones de trabajo consultables durante el turno antes de iniciar ejecución. |
| fogo.production.recipe_book.view | OPERATIONAL_ONLY    | —    | T         | El recetario operativo es una referencia necesaria para prepararse durante el turno.               |
| fogo.production.recipes.view     | BASE_ONLY           | N    | —         | Las definiciones maestras de recetas son administrativas y no dependen del turno.                  |

Resultado FOGO:

N       1 permiso base exclusivo
T       3 carriles operativos
T+C     2 carriles operativos
11.5 NEXO — 63 permisos
11.5.1 Acceso y catálogo

| Permiso                            | Modalidad           | Base | Operativo | Decisión                                                                                  |
| ---------------------------------- | ------------------- | ---- | --------- | ----------------------------------------------------------------------------------------- |
| nexo.access                        | BASE_OR_OPERATIONAL | N    | T         | Permite entrar y visualizar el estado del contexto antes del check-in.                    |
| nexo.catalog.products.view         | BASE_OR_OPERATIONAL | N    | T         | El catálogo de productos es referencia estable y no muestra cantidades vivas por sí solo. |
| nexo.catalog.products.create       | BASE_ONLY           | N    | —         | Crear productos es administración del maestro de datos.                                   |
| nexo.catalog.presentations.view    | BASE_OR_OPERATIONAL | N    | T         | Las presentaciones son referencia estable necesaria para operar.                          |
| nexo.catalog.request_policies.view | BASE_OR_OPERATIONAL | N    | T         | Las políticas aplicables pueden consultarse antes de iniciar una operación.               |
| nexo.catalog.categories.view       | BASE_OR_OPERATIONAL | N    | T         | Las categorías son referencia estable.                                                    |
| nexo.catalog.units.view            | BASE_OR_OPERATIONAL | N    | T         | Las unidades y empaques son referencia estable.                                           |

11.5.2 Activos

| Permiso                  | Modalidad           | Base | Operativo | Decisión                                                                                            |
| ------------------------ | ------------------- | ---- | --------- | --------------------------------------------------------------------------------------------------- |
| nexo.assets.items.view   | BASE_OR_OPERATIONAL | N    | T         | El catálogo de activos puede consultarse para identificar el recurso antes de iniciar la operación. |
| nexo.assets.items.create | BASE_ONLY           | N    | —         | Crear activos es administración del maestro de activos.                                             |
| nexo.assets.groups.view  | BASE_OR_OPERATIONAL | N    | T         | Los grupos son clasificación estable.                                                               |
| nexo.assets.counts.view  | BASE_OR_OPERATIONAL | N    | T+C       | Los conteos contienen estado operativo, responsables y diferencias sensibles.                       |

11.5.3 Ajustes y entradas

| Permiso                             | Modalidad            | Base | Operativo | Decisión                                                                                |
| ----------------------------------- | -------------------- | ---- | --------- | --------------------------------------------------------------------------------------- |
| nexo.inventory.adjustments.view     | BASE_OR_OPERATIONAL  | N    | T+C       | Los ajustes reflejan movimientos sensibles y acciones de otros actores.                 |
| nexo.inventory.adjustments.register | BASE_AND_OPERATIONAL | N    | T+C       | Registrar ajustes exige autoridad base y presencia operativa simultáneamente.           |
| nexo.inventory.entries.view         | BASE_OR_OPERATIONAL  | N    | T+C       | Las entradas representan estado vivo de inventario y trazabilidad de terceros.          |
| nexo.inventory.entries.register     | OPERATIONAL_ONLY     | —    | T+C       | Registrar una entrada modifica existencias.                                             |
| nexo.inventory.entries.override     | BASE_AND_OPERATIONAL | N    | T+C       | La entrada excepcional exige autoridad base explícita y participación operativa activa. |

11.5.4 Ubicaciones, LPN, movimientos y stock

| Permiso                                    | Modalidad           | Base | Operativo | Decisión                                                                         |
| ------------------------------------------ | ------------------- | ---- | --------- | -------------------------------------------------------------------------------- |
| nexo.inventory.locations.view              | BASE_OR_OPERATIONAL | N    | T         | Las ubicaciones son topología estable necesaria para preparar la operación.      |
| nexo.inventory.location_assignments.assign | OPERATIONAL_ONLY    | —    | T+C       | La asignación modifica la ubicación efectiva de existencias o contenedores.      |
| nexo.inventory.location_catalog.update     | BASE_ONLY           | N    | —         | Modificar el catálogo de una ubicación es configuración administrativa.          |
| nexo.inventory.lpns.view                   | BASE_OR_OPERATIONAL | N    | T+C       | Los LPN muestran contenido, posición y custodia operativa viva.                  |
| nexo.inventory.movements.view              | BASE_OR_OPERATIONAL | N    | T+C       | Los movimientos representan trazabilidad operacional viva.                       |
| nexo.inventory.stock.view                  | BASE_OR_OPERATIONAL | N    | T+C       | Las existencias son estado operativo vivo y sensible.                            |
| nexo.inventory.production_batches.view     | BASE_OR_OPERATIONAL | N    | T+C       | Los lotes productivos en inventario reflejan disponibilidad y trazabilidad viva. |
| nexo.inventory.transfers.view              | BASE_OR_OPERATIONAL | N    | T+C       | Los traslados reflejan movimientos actuales entre territorios.                   |
| nexo.inventory.transfers.create            | OPERATIONAL_ONLY    | —    | T+C       | Crear un traslado compromete existencias y dos extremos territoriales.           |
| nexo.inventory.withdrawals.view            | BASE_OR_OPERATIONAL | N    | T+C       | Los retiros muestran consumo operativo y actividad de terceros.                  |
| nexo.inventory.withdrawals.register        | OPERATIONAL_ONLY    | —    | T+C       | Registrar un retiro modifica existencias.                                        |

11.5.5 Zonas y operación de bodega

| Permiso                                  | Modalidad           | Base | Operativo | Decisión                                                               |
| ---------------------------------------- | ------------------- | ---- | --------- | ---------------------------------------------------------------------- |
| nexo.inventory.zones.view                | BASE_OR_OPERATIONAL | N    | T         | Las zonas son topología estable.                                       |
| nexo.inventory.storage_positions.view    | BASE_OR_OPERATIONAL | N    | T         | Las posiciones son topología estable.                                  |
| nexo.inventory.warehouse_operations.view | BASE_OR_OPERATIONAL | N    | T+C       | La vista contiene operaciones vivas, actores y estados de bodega.      |
| nexo.inventory.stock_validations.perform | OPERATIONAL_ONLY    | —    | T+C       | Validar existencias es una acción física atribuible al actor presente. |

11.5.6 Conteos

| Permiso                             | Modalidad           | Base | Operativo | Decisión                                                                          |
| ----------------------------------- | ------------------- | ---- | --------- | --------------------------------------------------------------------------------- |
| nexo.inventory.stock_counts.view    | BASE_OR_OPERATIONAL | N    | T+C       | Los conteos contienen datos sensibles, diferencias y trabajo de terceros.         |
| nexo.inventory.stock_counts.perform | OPERATIONAL_ONLY    | —    | T+C       | Realizar un conteo exige presencia física confirmada.                             |
| nexo.inventory.initial_counts.view  | BASE_OR_OPERATIONAL | N    | T+C       | Los conteos iniciales contienen cantidades, diferencias y trazabilidad operativa. |

11.5.7 Remisiones

| Permiso                            | Modalidad           | Base | Operativo | Decisión                                                                         |
| ---------------------------------- | ------------------- | ---- | --------- | -------------------------------------------------------------------------------- |
| nexo.inventory.remissions.view     | BASE_OR_OPERATIONAL | N    | T+C       | Las remisiones muestran estados vivos, cantidades, origen, destino y actores.    |
| nexo.inventory.remissions.update   | BASE_OR_OPERATIONAL | N    | T+C       | Actualizar una remisión modifica estado empresarial.                             |
| nexo.inventory.remissions.request  | OPERATIONAL_ONLY    | —    | T+C       | Solicitar una remisión inicia una operación empresarial desde el actor presente. |
| nexo.inventory.remissions.prepare  | OPERATIONAL_ONLY    | —    | T+C       | Preparar exige presencia física y atribución del alistamiento.                   |
| nexo.inventory.remissions.dispatch | OPERATIONAL_ONLY    | —    | T+C       | Despachar cambia custodia y estado logístico.                                    |
| nexo.inventory.remissions.receive  | OPERATIONAL_ONLY    | —    | T+C       | Recibir confirma entrega, cantidades y custodia en destino.                      |
| nexo.inventory.remissions.cancel   | BASE_OR_OPERATIONAL | N    | T+C       | La cancelación operativa exige participación activa y trazable.                  |

11.5.8 Logística

| Permiso                                | Modalidad           | Base | Operativo | Decisión                                                                  |
| -------------------------------------- | ------------------- | ---- | --------- | ------------------------------------------------------------------------- |
| nexo.logistics.operations_board.view   | BASE_OR_OPERATIONAL | N    | T+C       | El tablero consolida operaciones vivas de múltiples actores.              |
| nexo.logistics.operations.view         | BASE_OR_OPERATIONAL | N    | T+C       | Las operaciones logísticas son estado vivo y transversal.                 |
| nexo.logistics.driver_operations.view  | BASE_OR_OPERATIONAL | N    | T+C       | Contiene actividad, asignaciones y trazabilidad sensible de conductores.  |
| nexo.logistics.fulfillment.view        | BASE_OR_OPERATIONAL | N    | T+C       | El cumplimiento logístico refleja ejecución actual.                       |
| nexo.logistics.fulfillment_routes.view | BASE_OR_OPERATIONAL | N    | T         | Las rutas configuradas son referencia estable para el turno.              |
| nexo.logistics.supply_routes.view      | BASE_OR_OPERATIONAL | N    | T         | Las rutas de suministro son referencia estable para preparar operaciones. |

11.5.9 Finanzas internas

| Permiso                                    | Modalidad            | Base | Operativo | Decisión                                                                  |
| ------------------------------------------ | -------------------- | ---- | --------- | ------------------------------------------------------------------------- |
| nexo.finance.internal_invoices.view        | BASE_ONLY            | N    | —         | La consulta financiera pertenece al carril administrativo.                |
| nexo.finance.internal_invoices.generate    | BASE_ONLY            | N    | —         | Generar documentos financieros no depende de presencia operativa.         |
| nexo.finance.internal_invoices.issue       | BASE_ONLY            | N    | —         | La emisión es una capacidad financiera base.                              |
| nexo.finance.internal_invoices.cancel      | BASE_ONLY            | N    | —         | La cancelación es una capacidad financiera base.                          |
| nexo.finance.internal_invoice_amounts.view | BASE_ONLY            | N    | —         | La consulta de importes es administrativa.                                |
| nexo.finance.internal_prices.view          | BASE_ONLY            | N    | —         | Los precios internos son configuración sensible base.                     |
| nexo.finance.internal_variances.view       | BASE_ONLY            | N    | —         | La consulta completa de variaciones pertenece al carril base.             |
| nexo.finance.internal_variances.approve    | BASE_AND_OPERATIONAL | N    | T+C       | Aprobar exige autoridad administrativa y participación operativa activa.  |
| nexo.finance.internal_variances.resolve    | BASE_AND_OPERATIONAL | N    | T+C       | Resolver exige autoridad administrativa y participación operativa activa. |
| nexo.finance.cost_centers.view             | BASE_ONLY            | N    | —         | Los centros de costo son configuración financiera base.                   |

11.5.10 Analítica

| Permiso                              | Modalidad | Base | Operativo | Decisión                                                |
| ------------------------------------ | --------- | ---- | --------- | ------------------------------------------------------- |
| nexo.analytics.internal_reports.view | BASE_ONLY | N    | —         | Los reportes internos son administrativos.              |
| nexo.analytics.margin_reports.view   | BASE_ONLY | N    | —         | Los reportes de margen son administrativos y sensibles. |

11.5.11 Impresión y configuración

| Permiso                               | Modalidad           | Base | Operativo | Decisión                                                                            |
| ------------------------------------- | ------------------- | ---- | --------- | ----------------------------------------------------------------------------------- |
| nexo.printing.templates.update        | BASE_ONLY           | N    | —         | Modificar plantillas es configuración administrativa.                               |
| nexo.printing.jobs.view               | BASE_OR_OPERATIONAL | N    | T+C       | Los trabajos muestran documentos, actores, dispositivos y estados operativos vivos. |
| nexo.settings.sites.view              | BASE_ONLY           | N    | —         | La configuración de sedes pertenece al carril base.                                 |
| nexo.settings.remission_policies.view | BASE_ONLY           | N    | —         | La configuración completa de remisiones pertenece al carril base.                   |

Resultado NEXO:

BASE_ONLY
→ 16

OPERATIVOS CON T
→ 13

OPERATIVOS CON T+C
→ 34

TOTAL
→ 63
11.6 NUMERA — 6 permisos

| Permiso                                 | Modalidad | Base | Operativo | Decisión                                                   |
| --------------------------------------- | --------- | ---- | --------- | ---------------------------------------------------------- |
| numera.access                           | BASE_ONLY | N    | —         | La entrada administrativa no depende del turno.            |
| numera.finance.cost_centers.view        | BASE_ONLY | N    | —         | Los centros de costo son configuración financiera.         |
| numera.finance.expenses.view            | BASE_ONLY | N    | —         | La consulta de gastos es administrativa.                   |
| numera.analytics.break_even.view        | BASE_ONLY | N    | —         | El análisis de equilibrio es administrativo.               |
| numera.analytics.profitability.view     | BASE_ONLY | N    | —         | La rentabilidad es información analítica administrativa.   |
| numera.analytics.financial_reports.view | BASE_ONLY | N    | —         | Los reportes financieros no dependen de jornada operativa. |

11.7 ORIGO — 5 permisos

| Permiso                                | Modalidad           | Base | Operativo | Decisión                                                                                |
| -------------------------------------- | ------------------- | ---- | --------- | --------------------------------------------------------------------------------------- |
| origo.access                           | BASE_OR_OPERATIONAL | N    | T         | El actor operativo puede entrar durante un turno vigente antes del check-in.            |
| origo.procurement.purchase_orders.view | BASE_OR_OPERATIONAL | N    | T+C       | Las órdenes contienen cantidades, precios, proveedor y destinos sensibles.              |
| origo.procurement.receipts.view        | BASE_OR_OPERATIONAL | N    | T+C       | Las recepciones contienen estado vivo, cantidades y actividad de terceros.              |
| origo.procurement.suppliers.view       | BASE_OR_OPERATIONAL | N    | T         | El carril operativo accede únicamente a la proyección mínima del proveedor relacionado. |
| origo.catalog.product_reviews.view     | BASE_ONLY           | N    | —         | La revisión del maestro de productos es administrativa.                                 |

Resultado ORIGO:

BASE_ONLY
→ 1

OPERATIVOS CON T
→ 2

OPERATIVOS CON T+C
→ 2
11.8 PASS — 1 permiso

| Permiso     | Modalidad | Base | Operativo | Decisión                                                                                      |
| ----------- | --------- | ---- | --------- | --------------------------------------------------------------------------------------------- |
| pass.access | BASE_ONLY | N    | —         | Representa entrada laboral o administrativa. La sesión normal del cliente permanece separada. |

11.9 PULSO — 2 permisos

| Permiso                            | Modalidad            | Base | Operativo | Decisión                                                                                                            |
| ---------------------------------- | -------------------- | ---- | --------- | ------------------------------------------------------------------------------------------------------------------- |
| pulso.access                       | OPERATIONAL_ONLY     | —    | T         | Permite entrar durante un turno vigente y mostrar el requisito de marcación. No autoriza ventas o caja por sí solo. |
| pulso.delivery.deliveries.override | BASE_AND_OPERATIONAL | N    | T+C       | La excepción exige autoridad base explícita y participación operacional activa.                                     |

11.10 VISO — 17 permisos

| Permiso                                     | Modalidad | Base | Operativo | Decisión                                                                                 |
| ------------------------------------------- | --------- | ---- | --------- | ---------------------------------------------------------------------------------------- |
| viso.access                                 | BASE_ONLY | N    | —         | La entrada administrativa no depende del turno.                                          |
| viso.platform.app_updates.view              | BASE_ONLY | N    | —         | La consulta de actualizaciones es administrativa.                                        |
| viso.organization.businesses.view           | BASE_ONLY | N    | —         | La consulta organizacional no depende del turno.                                         |
| viso.workforce.employees.view               | BASE_ONLY | N    | —         | La consulta de trabajadores es administrativa.                                           |
| viso.workforce.staff_calendar.view          | BASE_ONLY | N    | —         | El calendario del personal es administrativo.                                            |
| viso.workforce.schedules.view               | BASE_ONLY | N    | —         | La programación del personal es administrativa.                                          |
| viso.workforce.vacancies.view               | BASE_ONLY | N    | —         | Las vacantes son información administrativa.                                             |
| viso.authorization.context_simulations.view | BASE_ONLY | N    | —         | La simulación no requiere contexto operativo real.                                       |
| viso.authorization.audit_logs.view          | BASE_ONLY | N    | —         | La auditoría pertenece al carril administrativo.                                         |
| viso.catalog.commercial_categories.view     | BASE_ONLY | N    | —         | Las categorías comerciales son configuración base.                                       |
| viso.content.content_blocks.view            | BASE_ONLY | N    | —         | Los bloques de contenido son configuración base.                                         |
| viso.content.menu.view                      | BASE_ONLY | N    | —         | El menú es configuración administrativa.                                                 |
| viso.content.website_content.view           | BASE_ONLY | N    | —         | El contenido web es configuración administrativa.                                        |
| viso.finance.accounting.view                | BASE_ONLY | N    | —         | La información contable pertenece al carril base.                                        |
| viso.delivery.rates.view                    | BASE_ONLY | N    | —         | Las tarifas son configuración administrativa.                                            |
| viso.loyalty.products.view                  | BASE_ONLY | N    | —         | La administración laboral de productos de fidelización no depende del turno.             |
| viso.loyalty.customers.view                 | BASE_ONLY | N    | —         | La consulta laboral de clientes no depende del turno y no pertenece a la sesión cliente. |

#### 12. Resumen cuantitativo

12.1 Por prerrequisito operativo

| Clasificación            | Permisos |
| ------------------------ | -------- |
| Sin carril operativo     | 54       |
| Carril operativo con T   | 19       |
| Carril operativo con T+C | 39       |
| Total                    | 112      |

12.2 Por modalidad

| Modalidad            | Sin carril operativo | Operativo T | Operativo T+C | Total |
| -------------------- | -------------------- | ----------- | ------------- | ----- |
| BASE_ONLY            | 54                   | 0           | 0             | 54    |
| OPERATIONAL_ONLY     | 0                    | 2           | 11            | 13    |
| BASE_OR_OPERATIONAL  | 0                    | 17          | 23            | 40    |
| BASE_AND_OPERATIONAL | 0                    | 0           | 5             | 5     |
| Total                | 54                   | 19          | 39            | 112   |

12.3 Por aplicación

| Aplicación | Sin carril operativo | Operativo T | Operativo T+C | Total |
| ---------- | -------------------- | ----------- | ------------- | ----- |
| SHELL      | 1                    | 0           | 0             | 1     |
| ANIMA      | 10                   | 0           | 0             | 10    |
| AURA       | 1                    | 0           | 0             | 1     |
| FOGO       | 1                    | 3           | 2             | 6     |
| NEXO       | 16                   | 13          | 34            | 63    |
| NUMERA     | 6                    | 0           | 0             | 6     |
| ORIGO      | 1                    | 2           | 2             | 5     |
| PASS       | 1                    | 0           | 0             | 1     |
| PULSO      | 0                    | 1           | 1             | 2     |
| VISO       | 17                   | 0           | 0             | 17    |
| Total      | 54                   | 19          | 39            | 112   |

#### 13. Revocación del contexto

13.1 Cierre del check-in

Cuando el check-in se cierra:

PERMISOS T
→ PUEDEN CONTINUAR
  SI EL TURNO SIGUE VIGENTE
  Y NO EXISTE CONFLICTO ESTRUCTURAL

PERMISOS T+C
→ REVOCADOS INMEDIATAMENTE

Esto permite, por ejemplo:

conservar acceso a instrucciones estables durante el cierre;
impedir nuevos movimientos o mutaciones;
impedir consulta de estado vivo después de finalizar la presencia activa.
13.2 Fin del turno

Cuando termina la vigencia del turno:

PERMISOS T
→ REVOCADOS

PERMISOS T+C
→ REVOCADOS

PERMISOS BASE
→ NO AFECTADOS
13.3 Cancelación o retiro del turno

La cancelación o retiro invalida inmediatamente:

el rol operativo efectivo;
el carril operativo;
los permisos T;
los permisos T+C.

Una operación ya confirmada no se elimina.

Debe conservar su auditoría.

13.4 Check-out anticipado

Un check-out anticipado:

revoca los permisos T+C;
no cancela automáticamente el turno;
no elimina los permisos T mientras el turno siga vigente;
puede generar una inconsistencia administrativa;
no puede reabrirse silenciosamente sin un nuevo check-in válido.

#### 14. Casos especiales

14.1 Administrador con permiso BASE_OR_OPERATIONAL

Ejemplo:

PERMISO
nexo.inventory.stock.view

MODALIDAD
BASE_OR_OPERATIONAL

Caso administrativo:

CONCESIÓN BASE VÁLIDA
SIN TURNO
SIN CHECK-IN

RESULTADO
→ PUEDE AUTORIZAR

Caso operativo:

CONCESIÓN OPERATIVA VÁLIDA
TURNO VIGENTE
SIN CHECK-IN

RESULTADO
→ DENEGAR

Porque nexo.inventory.stock.view exige T+C en el carril operativo.

14.2 Gerente trabajando operacionalmente

Un gerente puede tener:

CARRIL BASE
+
CARRIL OPERATIVO

El turno no elimina sus permisos base.

Cuando una capacidad BASE_OR_OPERATIONAL se autoriza por el carril base:

no necesita check-in;
conserva el alcance base;
no hereda el alcance operativo.

Cuando se autoriza por el carril operativo:

debe cumplir T o T+C;
se limita al contexto operativo.
14.3 Dispositivo compartido

El dispositivo técnico no satisface:

turno;
check-in;
rol operativo;
permiso del actor.

Secuencia obligatoria:

DISPOSITIVO AUTENTICADO
+
ACTOR EFECTIVO IDENTIFICADO
+
TURNO VIGENTE
+
CHECK-IN CUANDO EL PERMISO EXIJA T+C
+
PERMISO COINCIDENTE
**=**
POSIBLE AUTORIZACIÓN

La compatibilidad concreta con dispositivos se definirá en AUTH-CAT-014.

14.4 Trabajo previo al inicio físico

Los permisos T permiten preparar el trabajo dentro de la ventana vigente.

Ejemplos:

consultar productos;
consultar presentaciones;
consultar unidades;
consultar ubicaciones;
consultar zonas;
consultar posiciones;
consultar rutas;
consultar órdenes de producción;
consultar el recetario operativo;
consultar la proyección mínima de un proveedor.

No permiten:

consultar stock vivo;
consultar movimientos;
consultar conteos;
consultar remisiones activas;
registrar transacciones;
modificar estado.
14.5 Trabajo fuera de la ventana del turno

Un turno publicado para más tarde no satisface T.

Una planificación futura puede consultarse mediante permisos base de ANIMA o VISO, pero no mediante el rol operativo futuro.

TURNO PUBLICADO FUTURO
→ NO CREA ROL OPERATIVO EFECTIVO
14.6 Operación offline

Una acción creada offline no se considera autorizada únicamente porque el cliente hubiera mostrado un estado permitido.

Al sincronizar:

debe reconstruirse el contexto aplicable;
debe verificarse el turno;
debe verificarse el check-in cuando corresponda;
debe verificarse la vigencia temporal aceptada por el contrato;
debe denegarse si no puede demostrarse autorización.

El diseño detallado de operaciones offline queda fuera de esta tarea.

#### 15. Prohibiciones

Queda prohibido:

conceder un permiso operativo sin turno vigente;
utilizar un turno futuro;
utilizar un turno borrador;
utilizar un turno de descanso;
utilizar un turno cancelado;
utilizar un perfil operativo como sustituto del turno;
utilizar un rol base legacy como rol operativo;
considerar una solicitud offline como check-in activo;
aceptar un check-in de otra sede;
aceptar un check-in de otro turno;
aceptar varios check-ins activos ambiguos;
ignorar un check-in estructuralmente incompatible;
permitir mutaciones operativas con T;
convertir app.access en autorización para capacidades internas;
conceder bypass por nombre de rol;
mantener permisos T+C después del check-out;
mantener permisos operativos después de terminar el turno;
revocar permisos base por terminar el turno;
usar la sede seleccionada para sustituir la sede del turno;
tratar la confirmación del empleado como requisito de autorización;
tratar el check-in como concesión de alcance;
tratar el turno como concesión de permiso;
usar una sesión de dispositivo como sesión laboral del actor;
usar una simulación como contexto operativo real;
mezclar la sesión del cliente de PASS con el RBAC laboral.

#### 16. Validación de integridad

| Validación                                  | Resultado |
| ------------------------------------------- | --------- |
| Permisos canónicos evaluados                | 112       |
| Permisos con decisión explícita de turno    | 112       |
| Permisos con decisión explícita de check-in | 112       |
| Permisos omitidos                           | 0         |
| Permisos duplicados                         | 0         |
| Permisos sin decisión                       | 0         |
| Permisos legacy reincorporados              | 0         |
| Permisos técnicos reincorporados            | 0         |
| Combinaciones check-in sin turno            | 0         |

Consistencia con clasificaciones aprobadas:

| Clasificación                     | Resultado                                                |
| --------------------------------- | -------------------------------------------------------- |
| BASE_ONLY                         | 54 permisos sin prerrequisito operativo                  |
| OPERATIONAL_ONLY                  | 13 permisos con turno obligatorio                        |
| BASE_OR_OPERATIONAL               | 40 permisos con decisión independiente por carril        |
| BASE_AND_OPERATIONAL              | 5 permisos con turno y check-in obligatorios             |
| is_operational = false            | 54 permisos sin carril operativo                         |
| is_operational = true             | 58 permisos con turno obligatorio en el carril operativo |
| Mutadores operativos              | Todos exigen T+C                                         |
| Permisos operativos de referencia | Pueden utilizar T                                        |
| Permisos base                     | Ninguno exige turno o check-in                           |

#### 17. Invariantes

Todo permiso canónico declara su prerrequisito.
Solo existen N, T y T+C.
Check-in sin turno es inválido.
Todo carril operativo exige turno.
Todo permiso mutador operativo exige check-in.
Todo permiso BASE_AND_OPERATIONAL exige check-in.
Un permiso base no exige turno.
El turno no concede permisos.
El check-in no concede permisos.
El turno no amplía alcance.
El check-in no amplía alcance.
La modalidad no define por sí sola el requisito exacto de check-in.
La aplicación no define automáticamente el requisito.
Ser sensible no implica automáticamente check-in.
Ser de solo lectura no implica automáticamente ausencia de check-in.
Ser configuración no implica automáticamente ausencia de turno.
La entrada a una aplicación no concede capacidades internas.
Un permiso T no puede modificar estado empresarial.
Un permiso T+C requiere coincidencia entre turno y check-in.
El fin del turno revoca el carril operativo.
El cierre del check-in revoca las capacidades T+C.
El cierre del turno no revoca permisos base.
Los permisos base y operativos conservan independencia.
Las denegaciones aprobadas continúan teniendo precedencia.
Los aliases heredan los prerrequisitos de la clave canónica.
Los permisos legacy no reciben prerrequisitos independientes.
Los permisos técnicos retirados no reciben prerrequisitos.
Los dispositivos no modifican el prerrequisito.
La simulación no modifica el prerrequisito.
Un cambio de prerrequisito es un cambio contractual versionado.

#### 18. Criterios de aprobación

AUTH-CAT-012 podrá aprobarse cuando se acepte que:

los 112 permisos tienen decisión explícita;
existen únicamente los estados N, T y T+C;
los 54 permisos no operativos no exigen turno;
los 58 permisos operativos exigen turno;
19 carriles operativos permiten operar con turno vigente sin check-in obligatorio;
39 carriles operativos exigen turno y check-in;
toda mutación operativa exige T+C;
los permisos operativos de entrada utilizan T;
las referencias estables pueden utilizar T;
el estado operativo vivo utiliza T+C;
los cinco permisos BASE_AND_OPERATIONAL exigen T+C;
el carril base de BASE_OR_OPERATIONAL no exige turno;
el turno no concede permisos;
el check-in no concede permisos;
no existe bypass por nombre de rol;
el check-in debe coincidir con el turno;
la confirmación del trabajador no participa;
la tarea no define todavía requisitos de área.

#### 19. Impacto sobre tareas posteriores

AUTH-CAT-013

Definirá, dentro de los 58 permisos operativos:

cuáles requieren área activa;
cuáles pueden operar únicamente con sede;
cuáles admiten un rol operativo de sede general;
qué ocurre cuando el turno no contiene área;
qué ocurre cuando el rol está restringido a un área.

AUTH-CAT-013 no podrá eliminar los requisitos de turno o check-in aprobados aquí.

AUTH-CAT-014

Definirá compatibilidad con dispositivos compartidos.

Un dispositivo podrá añadir restricciones.

No podrá convertir:

T+C
→ T

T
→ N
AUTH-CAT-015

Definirá simulación.

La simulación podrá calcular hipotéticamente si los prerrequisitos se cumplirían.

No creará:

un turno real;
un check-in real;
un permiso efectivo real.
AUTH-CAT-016

Deberá completar el contrato de cada recurso:

sujeto;
propiedad;
territorio;
estado;
operación;
relación con turno;
relación con check-in;
comportamiento ante concurrencia;
trazabilidad.
BLOQUE D

Las matrices deberán impedir:

permisos OPERATIONAL_ONLY en el carril base;
permisos operativos sin turno;
mutaciones operativas sin check-in;
asignaciones incompatibles con la clasificación aprobada.
BLOQUE E

AccessContext deberá exponer separadamente:

published_shift
current_valid_shift
active_checkin
active_operational_role
operational_site
operational_area

AuthorizationDecision deberá registrar:

requires_shift
requires_checkin
shift_satisfied
checkin_satisfied
blocked_reasons

#### 20. Estado final

AUTH-CAT-011
→ APROBADA

AUTH-CAT-012
→ APROBADA

AUTH-CAT-013
→ NO INICIADA

No se implementan:

código;
migraciones;
cambios en Supabase;
RLS;
RPC;
tablas;
repositorios;
guards;
pantallas.

AUTH-CAT-013 permanece NO INICIADA hasta que el usuario solicite continuar con ella.

### ✅ AUTH-CAT-013 — Definir permisos que exigen área activa

#### 1. Identificación de la tarea

| Campo                     | Valor                                                                     |
| ------------------------- | ------------------------------------------------------------------------- |
| Bloque                    | BLOQUE C — Catálogo canónico de aplicaciones y permisos                   |
| Tarea                     | AUTH-CAT-013 — Definir permisos que exigen área activa                    |
| Estado                    | **APROBADA**                                                              |
| Naturaleza                | Definición documental                                                     |
| Implementación            | No incluida                                                               |
| Tarea anterior vigente    | AUTH-CAT-012 — Definir prerrequisitos de turno y check-in de cada permiso |
| Tarea posterior reservada | AUTH-CAT-014 — Definir permisos que admiten dispositivo compartido        |

Esta tarea no realiza:

- cambios en Supabase;
- migraciones;
- modificaciones de tablas, RLS o RPC;
- cambios en aplicaciones;
- asignaciones a roles;
- implementación en `vento-shell`.

Toda futura migración derivada de esta decisión deberá crearse y documentarse en `vento-shell`.

#### 2. Objetivo

Definir, para cada uno de los 112 permisos canónicos, si su carril operativo:

- exige un área operativa activa;
- puede operar únicamente con una sede operativa activa;
- no admite carril operativo y, por tanto, no utiliza área operativa activa.

La tarea debe distinguir claramente:

| Concepto         | Pregunta que responde                                           |
| ---------------- | --------------------------------------------------------------- |
| Modalidad        | ¿Qué carril o carriles pueden autorizar?                        |
| Turno y check-in | ¿Cuándo está habilitado el carril operativo?                    |
| Área operativa   | ¿El permiso necesita un área concreta dentro de la sede activa? |
| Alcance          | ¿Sobre qué territorio o recurso puede actuar?                   |
| Recurso          | ¿Qué entidad empresarial exacta se consulta o modifica?         |

Estas propiedades son independientes y deben cumplirse simultáneamente cuando correspondan.

#### 3. Alcance de la tarea

AUTH-CAT-013 determina exclusivamente:

- la propiedad `operational_area_requirement` de los 112 permisos;
- qué permisos operativos exigen `active_area_id`;
- qué permisos operativos pueden evaluarse con sede activa y sin área activa;
- qué permisos no tienen carril operativo;
- qué ocurre cuando el turno no contiene área;
- qué ocurre cuando el rol operativo está restringido a un área;
- qué ocurre cuando el área del recurso no coincide con el área activa;
- cómo se comportan los permisos de recursos multisede o de varios lados territoriales;
- la matriz explícita de los 112 permisos.

AUTH-CAT-013 no determina:

- qué roles reciben cada permiso;
- qué trabajador recibe una excepción;
- qué dispositivos compartidos pueden ejecutarlo;
- compatibilidad con simulación;
- la estructura física definitiva de tablas o columnas;
- la ruta técnica final para resolver el área de cada recurso;
- estados permitidos del recurso;
- propiedad del recurso;
- implementación SQL, RLS, RPC, guards o frontend.

Esos temas corresponden a AUTH-CAT-014 a AUTH-CAT-019, BLOQUE D, BLOQUE E y las fases de implementación.

#### 4. Base normativa

Esta propuesta conserva sin cambios:

- ADR-AUTH-001;
- AUTH-MOD-007 — Sede asignada y sede activa;
- AUTH-MOD-008 — Área asignada y área activa;
- AUTH-MOD-009 — Turno publicado;
- AUTH-MOD-010 — Check-in activo;
- AUTH-MOD-014 a AUTH-MOD-017 — Alcances por sede, tipo de sede, área y tipo de área;
- AUTH-MOD-018 — Precedencia entre permisos base y operativos;
- AUTH-MOD-019 — Denegación explícita;
- AUTH-CAT-001 a AUTH-CAT-012.

Regla de jerarquía:

| Propiedad                      | Función                                                         |
| ------------------------------ | --------------------------------------------------------------- |
| `authorization_requirement`    | Define qué carril o carriles pueden autorizar.                  |
| Alcance aprobado               | Define el territorio máximo admitido.                           |
| Turno y check-in               | Habilitan o bloquean el carril operativo.                       |
| `operational_area_requirement` | Determina si el carril operativo necesita un área activa.       |
| Recurso real                   | Determina el territorio concreto afectado.                      |
| Denegaciones                   | Pueden bloquear una autorización que de otro modo sería válida. |

AUTH-CAT-013 no puede:

- eliminar un requisito de turno o check-in aprobado en AUTH-CAT-012;
- ampliar un alcance aprobado en AUTH-CAT-011;
- convertir un permiso base en operativo;
- convertir sede activa en autorización sobre todas sus áreas;
- utilizar un área seleccionada o asignada como sustituto del área del turno.

#### 5. Propiedad canónica

Todo permiso canónico activo deberá declarar exactamente un:

`operational_area_requirement`

Valores admitidos:

| Valor             | significado                                                                                                                                       |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| `REQUIRED`        | El carril operativo exige un área activa válida proveniente del turno.                                                                            |
| `SITE_SUFFICIENT` | El permiso no exige área por sí mismo y puede evaluarse con sede operativa válida, siempre que el rol y el recurso no requieran un área concreta. |
| `NOT_APPLICABLE`  | El permiso no tiene carril operativo. La propiedad de área operativa no participa.                                                                |

No existe valor nulo permisivo.

Ausencia o valor desconocido:

**DENEGAR EL CARRIL OPERATIVO**

#### 6. Área operativa activa

La fuente canónica del área operativa activa es:

`employee_shifts.area_id`

perteneciente al turno vigente que produce el rol operativo efectivo.

Un área activa válida debe cumplir como mínimo:

- existir;
- estar activa;
- pertenecer a la sede operativa del turno;
- corresponder al turno vigente del actor efectivo;
- ser compatible con el rol operativo;
- no estar aislada del contexto aplicable;
- coincidir con el área exigida por el recurso cuando corresponda.

No son fuentes válidas del área operativa activa:

- `employees.area_id`;
- `employee_areas`;
- área primaria;
- área seleccionada;
- primera área de la sede;
- área del dispositivo compartido;
- punto de check-in;
- geocerca;
- área enviada libremente por el cliente;
- área deducida únicamente desde el recurso.

El recurso puede confirmar o contradecir el área del contexto, pero no crearla.

#### 7. Reglas de evaluación

##### 7.1 Permiso `REQUIRED`

El carril operativo solo puede autorizar cuando existe:

- turno vigente;
- check-in activo cuando AUTH-CAT-012 lo exige;
- sede operativa activa;
- área operativa activa;
- rol operativo válido en esa sede y área;
- permiso operativo aplicable;
- recurso compatible con el área activa;
- ausencia de denegaciones superiores.

Resultado sin área:

`active_area_required`

→ **DENEGAR**

##### 7.2 Permiso `SITE_SUFFICIENT`

El permiso no exige `active_area_id` por sí mismo.

Puede utilizarse sin área únicamente cuando:

- el rol operativo está habilitado a nivel general de la sede; o
- el recurso y la acción son realmente de nivel sede, ruta o lado territorial; y
- el alcance concedido admite esa operación; y
- no existe una restricción superior que exija área.

`SITE_SUFFICIENT` no significa:

- acceso a todas las áreas;
- acceso a todos los recursos de la sede;
- permiso global operativo;
- omitir la sede del turno;
- omitir el rol operativo;
- ignorar el área del recurso;
- convertir un rol de área en rol de sede.

##### 7.3 Restricción del rol operativo

La restricción más específica prevalece.

Un rol configurado mediante:

`site_operational_roles.area_id IS NOT NULL`

continúa exigiendo que el turno contenga esa área, incluso cuando el permiso sea `SITE_SUFFICIENT`.

Regla:

**PERMISO `SITE_SUFFICIENT` + ROL RESTRINGIDO A ÁREA + TURNO SIN ÁREA = DENEGAR**

Código conceptual:

`operational_role_area_required`

##### 7.4 Rol operativo de nivel sede

Un rol con:

`site_operational_roles.area_id IS NULL`

puede operar sin área únicamente con permisos `SITE_SUFFICIENT`.

No puede utilizar un permiso `REQUIRED` sin área.

Regla:

**PERMISO `REQUIRED` + ROL DE NIVEL SEDE + TURNO SIN ÁREA = DENEGAR**

##### 7.5 Carril base

El área operativa activa no se aplica al carril base.

En permisos `BASE_OR_OPERATIONAL`:

- el carril base conserva sus alcances administrativos aprobados;
- el carril operativo aplica `REQUIRED` o `SITE_SUFFICIENT`;
- un carril no toma prestado el contexto del otro.

En permisos `BASE_AND_OPERATIONAL`:

- el carril base debe ser válido;
- el carril operativo debe ser válido;
- la exigencia de área corresponde al carril operativo;
- la decisión final utiliza la intersección de ambos carriles.

##### 7.6 Coincidencia con el recurso

Cuando el permiso sea `REQUIRED`, el recurso deberá resolver un área compatible.

Casos válidos:

- recurso pertenece directamente al área activa;
- ubicación pertenece al área activa;
- inventario está custodiado en el área activa;
- el actor actúa sobre el lado del recurso correspondiente al área activa.

Casos inválidos:

- recurso pertenece a otra área;
- área del recurso pertenece a otra sede;
- el área no puede resolverse;
- el cliente envía un área distinta de la resuelta por el servidor;
- se intenta actuar sobre todas las áreas de la sede.

Resultado:

`resource_area_mismatch`

→ **DENEGAR**

##### 7.7 Recursos con varios lados territoriales

Una remisión, traslado, recepción u operación logística puede contener:

- origen;
- destino;
- segmento logístico;
- punto de recepción;
- punto de despacho.

`SITE_SUFFICIENT` permite que un rol legítimo de sede general actúe sobre el lado o segmento autorizado del recurso.

No concede autoridad sobre todos los lados.

`REQUIRED` exige que el actor tenga un área activa compatible con el lado desde el que ejecuta la acción.

##### 7.8 Área del dispositivo compartido

El área fijada al dispositivo podrá actuar como restricción adicional en AUTH-CAT-014.

No podrá:

- crear el área del actor;
- reemplazar el área del turno;
- convertir `REQUIRED` en `SITE_SUFFICIENT`;
- ampliar el alcance del permiso.

##### 7.9 Cambio de área durante el turno

Un cambio válido de área deberá producir un nuevo contexto operativo verificable.

Mientras el área anterior y la nueva sean ambiguas:

→ **DENEGAR PERMISOS `REQUIRED`**

No se conservará autorización residual del área anterior.

#### 8. Criterio funcional de clasificación

Se clasifica como `REQUIRED` cuando la capacidad:

- consulta o modifica inventario ubicado físicamente;
- actúa sobre ubicaciones, zonas o posiciones;
- registra conteos, retiros, entradas, ajustes o traslados;
- ejecuta producción dentro de una línea o área productiva;
- prepara recursos desde un área de origen;
- aprueba o resuelve una diferencia originada en un área;
- consulta una cola operativa propia de un área o dispositivo localizado.

Se clasifica como `SITE_SUFFICIENT` cuando la capacidad:

- permite entrar a una aplicación;
- consulta referencias estables compartidas;
- opera sobre rutas o logística de sede;
- corresponde a conductor o coordinación de sede general;
- consulta o actúa sobre una remisión mediante un lado territorial concreto sin exigir universalmente un área interna;
- gestiona abastecimiento o recepción de nivel sede;
- ejecuta una capacidad comercial ligada a la sede y al recurso, no a un área universal.

Se clasifica como `NOT_APPLICABLE` cuando:

- el permiso es `BASE_ONLY`;
- no existe carril operativo que pueda satisfacerlo.

#### 9. Matriz completa de los 112 permisos

La columna **Turno / check-in operativo** reproduce la decisión aprobada en AUTH-CAT-012.

La columna **Área operativa** agrega únicamente la decisión de AUTH-CAT-013.

##### 9.1 Permisos `REQUIRED` — 31

| Permiso                                      | Justificación                                                                                                                     |
| -------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `fogo.production.batches.view`               | Los lotes operativos pertenecen a una línea o área productiva concreta y deben filtrarse por el área del turno.                   |
| `fogo.production.batches.create`             | Crear un lote inicia ejecución en un área productiva concreta; no puede atribuirse solo a la sede.                                |
| `fogo.production.orders.view`                | Las órdenes de producción deben mostrarse según el área productiva asignada al turno.                                             |
| `fogo.production.recipe_book.view`           | El recetario operativo debe limitarse a la función y área productiva activas.                                                     |
| `nexo.assets.counts.view`                    | Los conteos de activos corresponden a recursos ubicados y responsables dentro de un área concreta.                                |
| `nexo.inventory.adjustments.view`            | Los ajustes afectan existencias territorializadas y deben consultarse desde el área operativa correspondiente.                    |
| `nexo.inventory.adjustments.register`        | El ajuste excepcional debe ejecutarse y atribuirse en el área donde existe el inventario afectado.                                |
| `nexo.inventory.entries.view`                | Las entradas representan inventario recibido dentro de un área de almacenamiento o recepción concreta.                            |
| `nexo.inventory.entries.register`            | Registrar una entrada modifica existencias dentro de un área operativa concreta.                                                  |
| `nexo.inventory.entries.override`            | La entrada excepcional exige área activa además de los carriles base y operativo.                                                 |
| `nexo.inventory.locations.view`              | Las ubicaciones operativas pertenecen a una estructura física de área y no deben exponerse como todas las ubicaciones de la sede. |
| `nexo.inventory.location_assignments.assign` | Asignar existencias o contenedores exige coincidir con el área de la ubicación destino.                                           |
| `nexo.inventory.lpns.view`                   | El contenido y la custodia de un LPN deben evaluarse contra el área operativa donde se encuentra.                                 |
| `nexo.inventory.movements.view`              | Los movimientos físicos se consultan dentro del área operativa o sobre recursos vinculados a ella.                                |
| `nexo.inventory.stock.view`                  | Las existencias operativas deben limitarse al área activa; sede sola no autoriza todas las existencias.                           |
| `nexo.inventory.production_batches.view`     | Los lotes disponibles en inventario se territorializan por el área donde están almacenados o utilizados.                          |
| `nexo.inventory.transfers.view`              | La consulta operativa de traslados requiere un área activa en uno de los extremos autorizados.                                    |
| `nexo.inventory.transfers.create`            | Crear un traslado exige área activa para resolver el extremo desde el que actúa el trabajador.                                    |
| `nexo.inventory.withdrawals.view`            | Los retiros representan consumo de existencias dentro de un área concreta.                                                        |
| `nexo.inventory.withdrawals.register`        | Registrar un retiro exige el área activa desde la que se descuentan existencias.                                                  |
| `nexo.inventory.zones.view`                  | Las zonas son subdivisiones operativas de un área y deben filtrarse por el área activa.                                           |
| `nexo.inventory.storage_positions.view`      | Las posiciones pertenecen a zonas y áreas concretas; sede sola sería demasiado amplia.                                            |
| `nexo.inventory.warehouse_operations.view`   | La operación de bodega debe quedar limitada al área de bodega activa.                                                             |
| `nexo.inventory.stock_validations.perform`   | La validación física debe atribuirse al área donde se encuentra el inventario validado.                                           |
| `nexo.inventory.stock_counts.view`           | Los conteos de inventario contienen cantidades y diferencias de un área concreta.                                                 |
| `nexo.inventory.stock_counts.perform`        | Realizar conteo exige presencia y área activa sobre el inventario contado.                                                        |
| `nexo.inventory.initial_counts.view`         | Los conteos iniciales deben limitarse al área donde se inicializa el inventario.                                                  |
| `nexo.inventory.remissions.prepare`          | El alistamiento afecta existencias y ubicaciones del área de origen, por lo que exige área activa.                                |
| `nexo.finance.internal_variances.approve`    | La aprobación exige participación operativa en el área donde surgió la variación.                                                 |
| `nexo.finance.internal_variances.resolve`    | La resolución exige área activa coincidente con el inventario o proceso que originó la variación.                                 |
| `nexo.printing.jobs.view`                    | Los trabajos operativos deben limitarse al área o dispositivo asociado para evitar exponer colas de otras áreas.                  |

##### 9.2 Permisos `SITE_SUFFICIENT` — 27

| Permiso                                  | Justificación                                                                                                                                       |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `fogo.access`                            | La entrada puede resolverse con sede y rol operativo válidos; el área se exige después para las capacidades productivas clasificadas como REQUIRED. |
| `nexo.access`                            | La entrada puede resolverse con sede y rol operativo válidos para mostrar el contexto y los bloqueos sin inferir un área.                           |
| `nexo.catalog.products.view`             | El catálogo de productos es referencia estable y puede consultarse a nivel de sede.                                                                 |
| `nexo.catalog.presentations.view`        | Las presentaciones son referencia estable compartida por la sede.                                                                                   |
| `nexo.catalog.request_policies.view`     | Las políticas aplicables pueden consultarse a nivel de sede; una operación concreta resolverá después su área o lado territorial.                   |
| `nexo.catalog.categories.view`           | Las categorías son referencia estable y no requieren un área activa por sí solas.                                                                   |
| `nexo.catalog.units.view`                | Las unidades y empaques son referencia estable compartida.                                                                                          |
| `nexo.assets.items.view`                 | El catálogo de activos puede consultarse a nivel de sede para identificar recursos.                                                                 |
| `nexo.assets.groups.view`                | Los grupos de activos son clasificación estable y no exigen área activa.                                                                            |
| `nexo.inventory.remissions.view`         | Las remisiones son recursos de nivel sede y ruta; pueden consultarse sin área cuando el rol sea legítimamente de sede general.                      |
| `nexo.inventory.remissions.update`       | La actualización general de una remisión puede corresponder a coordinación de sede; cada transición conservará su contrato territorial específico.  |
| `nexo.inventory.remissions.request`      | La solicitud puede originarse desde una sede o un rol integrado de sede; si el rol está restringido a área, esa restricción seguirá exigiendo área. |
| `nexo.inventory.remissions.dispatch`     | El despacho puede ejecutarse por logística de sede general o conductor sobre una ruta y remisión concretas.                                         |
| `nexo.inventory.remissions.receive`      | La recepción puede realizarse por un punto o rol general de la sede destino sin imponer un área universal.                                          |
| `nexo.inventory.remissions.cancel`       | La cancelación puede corresponder a coordinación de sede o al lado responsable de la remisión.                                                      |
| `nexo.logistics.operations_board.view`   | El tablero logístico coordina operaciones de la sede y admite roles operativos de nivel sede.                                                       |
| `nexo.logistics.operations.view`         | Las operaciones logísticas se resuelven por sede, ruta y recurso, no necesariamente por una única área.                                             |
| `nexo.logistics.driver_operations.view`  | La operación del conductor es de nivel sede y ruta; no requiere un área interna activa.                                                             |
| `nexo.logistics.fulfillment.view`        | El cumplimiento logístico puede abarcar la sede y rutas asignadas sin una única área interna.                                                       |
| `nexo.logistics.fulfillment_routes.view` | Las rutas son referencia de nivel sede o multisede y no dependen de área activa.                                                                    |
| `nexo.logistics.supply_routes.view`      | Las rutas de suministro pueden consultarse por sede y rol logístico general.                                                                        |
| `origo.access`                           | La entrada operativa puede resolverse a nivel de sede antes de seleccionar o validar una recepción concreta.                                        |
| `origo.procurement.purchase_orders.view` | Las órdenes pueden abastecer varios destinos o áreas; el carril operativo se limita por sede y por el recurso concreto.                             |
| `origo.procurement.receipts.view`        | Las recepciones pueden gestionarse desde un punto general de recepción de la sede y después resolver sus destinos internos.                         |
| `origo.procurement.suppliers.view`       | La proyección mínima del proveedor es referencia de abastecimiento a nivel de sede.                                                                 |
| `pulso.access`                           | La entrada a PULSO exige turno y rol válidos, pero no impone área por el permiso de acceso.                                                         |
| `pulso.delivery.deliveries.override`     | La entrega es una operación comercial de nivel sede y actor; el recurso concreto y la autoridad base limitan la excepción.                          |

##### 9.3 Permisos `NOT_APPLICABLE` — 54

Estos permisos no tienen carril operativo. El alcance administrativo por área aprobado en AUTH-CAT-011 permanece independiente.

**SHELL — 1**

- `shell.access`

**ANIMA — 10**

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

**AURA — 1**

- `aura.access`

**FOGO — 1**

- `fogo.production.recipes.view`

**NEXO — 16**

- `nexo.catalog.products.create`
- `nexo.assets.items.create`
- `nexo.inventory.location_catalog.update`
- `nexo.finance.internal_invoices.view`
- `nexo.finance.internal_invoices.generate`
- `nexo.finance.internal_invoices.issue`
- `nexo.finance.internal_invoices.cancel`
- `nexo.finance.internal_invoice_amounts.view`
- `nexo.finance.internal_prices.view`
- `nexo.finance.internal_variances.view`
- `nexo.finance.cost_centers.view`
- `nexo.analytics.internal_reports.view`
- `nexo.analytics.margin_reports.view`
- `nexo.printing.templates.update`
- `nexo.settings.sites.view`
- `nexo.settings.remission_policies.view`

**NUMERA — 6**

- `numera.access`
- `numera.finance.cost_centers.view`
- `numera.finance.expenses.view`
- `numera.analytics.break_even.view`
- `numera.analytics.profitability.view`
- `numera.analytics.financial_reports.view`

**ORIGO — 1**

- `origo.catalog.product_reviews.view`

**PASS — 1**

- `pass.access`

**VISO — 17**

- `viso.access`
- `viso.platform.app_updates.view`
- `viso.organization.businesses.view`
- `viso.workforce.employees.view`
- `viso.workforce.staff_calendar.view`
- `viso.workforce.schedules.view`
- `viso.workforce.vacancies.view`
- `viso.authorization.context_simulations.view`
- `viso.authorization.audit_logs.view`
- `viso.catalog.commercial_categories.view`
- `viso.content.content_blocks.view`
- `viso.content.menu.view`
- `viso.content.website_content.view`
- `viso.finance.accounting.view`
- `viso.delivery.rates.view`
- `viso.loyalty.products.view`
- `viso.loyalty.customers.view`

#### 10. Resumen cuantitativo

##### 10.1 Clasificación general

| Clasificación     | Permisos |
| ----------------- | -------: |
| `REQUIRED`        |       31 |
| `SITE_SUFFICIENT` |       27 |
| `NOT_APPLICABLE`  |       54 |
| **Total**         |  **112** |

##### 10.2 Por aplicación

| Aplicación | `REQUIRED` | `SITE_SUFFICIENT` | `NOT_APPLICABLE` |   Total |
| ---------- | ---------: | ----------------: | ---------------: | ------: |
| SHELL      |          0 |                 0 |                1 |       1 |
| ANIMA      |          0 |                 0 |               10 |      10 |
| AURA       |          0 |                 0 |                1 |       1 |
| FOGO       |          4 |                 1 |                1 |       6 |
| NEXO       |         27 |                20 |               16 |      63 |
| NUMERA     |          0 |                 0 |                6 |       6 |
| ORIGO      |          0 |                 4 |                1 |       5 |
| PASS       |          0 |                 0 |                1 |       1 |
| PULSO      |          0 |                 2 |                0 |       2 |
| VISO       |          0 |                 0 |               17 |      17 |
| **Total**  |     **31** |            **27** |           **54** | **112** |

##### 10.3 Relación con turno y check-in

| Prerrequisito operativo | `REQUIRED` | `SITE_SUFFICIENT` |  Total |
| ----------------------- | ---------: | ----------------: | -----: |
| `T`                     |          5 |                14 |     19 |
| `T+C`                   |         26 |                13 |     39 |
| **Total operativo**     |     **31** |            **27** | **58** |

##### 10.4 Relación con modalidad

| Modalidad              | `REQUIRED` | `SITE_SUFFICIENT` | `NOT_APPLICABLE` |   Total |
| ---------------------- | ---------: | ----------------: | ---------------: | ------: |
| `BASE_ONLY`            |          0 |                 0 |               54 |      54 |
| `OPERATIONAL_ONLY`     |          9 |                 4 |                0 |      13 |
| `BASE_OR_OPERATIONAL`  |         18 |                22 |                0 |      40 |
| `BASE_AND_OPERATIONAL` |          4 |                 1 |                0 |       5 |
| **Total**              |     **31** |            **27** |           **54** | **112** |

#### 11. Ejemplos normativos

##### 11.1 Producción con área obligatoria

| Elemento  | Valor                                                                                |
| --------- | ------------------------------------------------------------------------------------ |
| Permiso   | `fogo.production.batches.create`                                                     |
| Turno     | Vigente                                                                              |
| Check-in  | Activo                                                                               |
| Sede      | Centro de Producción                                                                 |
| Área      | Repostería                                                                           |
| Rol       | `produccion_reposteria`                                                              |
| Resultado | Puede crear un lote de Repostería si el recurso y las demás restricciones coinciden. |

Sin área en el turno:

→ **DENEGAR**

##### 11.2 Conductor sin área interna

| Elemento  | Valor                                          |
| --------- | ---------------------------------------------- |
| Permiso   | `nexo.inventory.remissions.dispatch`           |
| Turno     | Vigente                                        |
| Check-in  | Activo                                         |
| Sede      | Centro de Producción                           |
| Área      | Ausente                                        |
| Rol       | `conductor_logistica`, habilitado a nivel sede |
| Recurso   | Remisión y ruta asignadas                      |
| Resultado | Puede despachar el lado logístico autorizado.  |

No obtiene acceso a inventario de todas las áreas.

##### 11.3 Permiso de sede con rol restringido a área

| Elemento  | Valor                                                   |
| --------- | ------------------------------------------------------- |
| Permiso   | `nexo.inventory.remissions.request` — `SITE_SUFFICIENT` |
| Rol       | `cocinero_satelite`, restringido a Cocina               |
| Turno     | Sin área                                                |
| Resultado | **DENEGAR**                                             |

La clasificación del permiso no elimina la restricción del rol.

##### 11.4 Permiso base sin área operativa

| Elemento       | Valor                                                                                 |
| -------------- | ------------------------------------------------------------------------------------- |
| Permiso        | `viso.workforce.schedules.view`                                                       |
| Modalidad      | `BASE_ONLY`                                                                           |
| Área operativa | `NOT_APPLICABLE`                                                                      |
| Resultado      | Se evalúa con el alcance administrativo aprobado, sin exigir turno ni área operativa. |

##### 11.5 Recurso en otra área

| Elemento           | Valor                                     |
| ------------------ | ----------------------------------------- |
| Permiso            | `nexo.inventory.stock.view` — `REQUIRED`  |
| Área activa        | Bodega                                    |
| Recurso solicitado | Inventario de Repostería                  |
| Resultado          | **DENEGAR** por `resource_area_mismatch`. |

#### 12. Razones conceptuales de bloqueo

La futura decisión canónica deberá poder expresar, como mínimo:

| Razón                                  | Significado                                                              |
| -------------------------------------- | ------------------------------------------------------------------------ |
| `active_area_required`                 | El permiso exige área y el contexto no contiene una.                     |
| `active_area_not_found`                | El identificador de área no existe.                                      |
| `active_area_inactive`                 | El área está desactivada.                                                |
| `active_area_site_mismatch`            | El área no pertenece a la sede operativa.                                |
| `operational_role_area_required`       | El rol está restringido a un área y el turno no la contiene.             |
| `operational_role_not_allowed_in_area` | El rol no está habilitado en el área activa.                             |
| `resource_area_unresolved`             | El servidor no puede resolver el área del recurso cuando es obligatoria. |
| `resource_area_mismatch`               | El recurso pertenece a otra área.                                        |
| `device_area_mismatch`                 | El dispositivo restringe a un área distinta.                             |
| `multiple_operational_areas`           | El contexto presenta más de un área efectiva posible.                    |

La nomenclatura técnica definitiva se formalizará durante los contratos de BLOQUE E.

#### 13. Invariantes

- Todo permiso canónico declara `operational_area_requirement`.
- Solo existen `REQUIRED`, `SITE_SUFFICIENT` y `NOT_APPLICABLE`.
- Los 54 permisos sin carril operativo utilizan `NOT_APPLICABLE`.
- Los 58 permisos operativos utilizan `REQUIRED` o `SITE_SUFFICIENT`.
- `REQUIRED` siempre exige `active_area_id` válido.
- `SITE_SUFFICIENT` nunca significa acceso a todas las áreas.
- Un rol restringido a área continúa exigiendo área aunque el permiso sea `SITE_SUFFICIENT`.
- Un rol de nivel sede no puede ejecutar un permiso `REQUIRED` sin área.
- El área operativa procede del turno vigente.
- El check-in no define el área.
- El dispositivo no define el área del actor.
- `employee_areas` no define el área operativa activa.
- El área seleccionada no concede autorización.
- El área del recurso no crea contexto operativo.
- El recurso debe coincidir con el área activa cuando el permiso sea `REQUIRED`.
- Un permiso base conserva sus alcances administrativos sin utilizar área operativa.
- Un carril base no reemplaza el área exigida por el carril operativo.
- Un carril operativo no toma prestado el alcance del carril base.
- AUTH-CAT-013 no modifica T ni T+C.
- AUTH-CAT-013 no amplía los alcances de AUTH-CAT-011.
- No existe bypass por nombre de rol.
- Los aliases heredan la clasificación de la clave canónica.
- Los permisos legacy no reciben clasificación independiente.
- Los permisos técnicos retirados no reciben clasificación.
- La simulación no crea un área activa real.
- Un cambio futuro de clasificación es un cambio contractual versionado.

#### 14. Criterios de aprobación

AUTH-CAT-013 podrá aprobarse cuando se acepte expresamente que:

- los 112 permisos tienen decisión explícita;
- 31 permisos exigen área activa;
- 27 permisos admiten sede suficiente bajo condiciones estrictas;
- 54 permisos no tienen carril operativo;
- la fuente del área activa es `employee_shifts.area_id`;
- no existen fallbacks desde área primaria, seleccionada, asignada, dispositivo o check-in;
- `SITE_SUFFICIENT` no concede todas las áreas;
- la restricción del rol puede exigir área aunque el permiso no la exija universalmente;
- los permisos `REQUIRED` no pueden operar con un rol de sede sin área;
- producción operativa se limita por área;
- inventario físico, ubicaciones, conteos, retiros, entradas, ajustes y traslados se limitan por área;
- preparar remisiones exige área de origen;
- despacho, recepción, coordinación logística y rutas pueden admitir rol de sede general;
- ORIGO actual puede operar a nivel de sede porque sus permisos canónicos son de consulta y sus recursos pueden abarcar varios destinos;
- PULSO actual no impone área universal en sus dos permisos canónicos;
- los requisitos de turno y check-in aprobados permanecen intactos;
- la tarea no implementa código ni migraciones.

#### 15. Impacto sobre tareas posteriores

##### AUTH-CAT-014

Podrá definir compatibilidad con dispositivos compartidos.

El dispositivo podrá añadir:

- coincidencia de sede;
- coincidencia de área;
- restricciones de aplicación;
- restricciones de actor.

No podrá convertir:

- `REQUIRED` en `SITE_SUFFICIENT`;
- un área del dispositivo en área del actor;
- una incompatibilidad territorial en autorización.

##### AUTH-CAT-015

Podrá simular:

- área presente o ausente;
- coincidencia del rol;
- coincidencia del recurso;
- razones de bloqueo.

La simulación no creará un área operativa real.

##### AUTH-CAT-016

Deberá formalizar por permiso:

- tipo de recurso;
- ruta canónica para resolver sede;
- ruta canónica para resolver área;
- lado territorial aplicable;
- propiedad;
- estados del recurso;
- comportamiento ante concurrencia;
- trazabilidad.

No podrá ampliar la clasificación aprobada silenciosamente.

##### BLOQUE D

Las matrices deberán impedir:

- asignar un permiso `REQUIRED` a un rol que nunca puede producir área válida;
- tratar un rol de sede como autorizado para todas las áreas;
- utilizar un permiso `SITE_SUFFICIENT` para saltar una restricción de área del rol;
- sembrar configuraciones incompatibles sin diagnóstico.

##### BLOQUE E

`AccessContext` deberá exponer separadamente:

- `operational_site`;
- `operational_area`;
- `operational_role`;
- origen del área;
- validez del área;
- restricciones del dispositivo.

`AuthorizationDecision` deberá registrar:

- `area_requirement`;
- `area_satisfied`;
- `resolved_resource_area`;
- `role_area_satisfied`;
- razones de bloqueo.

#### 16. Estado final de la propuesta

| Tarea        | Estado      |
| ------------ | ----------- |
| AUTH-CAT-012 | APROBADA    |
| AUTH-CAT-013 | APROBADA    |
| AUTH-CAT-014 | NO INICIADA |

No se avanza a AUTH-CAT-014 hasta recibir aprobación explícita.


### ✅ AUTH-CAT-014 — Definir permisos que admiten dispositivo compartido

#### 1. Identificación de la tarea

| Campo                     | Valor                                                              |
| ------------------------- | ------------------------------------------------------------------ |
| Bloque                    | BLOQUE C — Catálogo canónico de aplicaciones y permisos            |
| Tarea                     | AUTH-CAT-014 — Definir permisos que admiten dispositivo compartido |
| Estado                    | **APROBADA**                                                       |
| Naturaleza                | Definición documental                                              |
| Implementación            | No incluida                                                        |
| Tarea anterior vigente    | AUTH-CAT-013 — Definir permisos que exigen área activa             |
| Tarea posterior reservada | AUTH-CAT-015 — Definir permisos que admiten simulación             |

Esta tarea no realiza cambios en Supabase, migraciones, tablas, RLS, RPC, aplicaciones, matrices de roles ni repositorios.

Toda futura implementación derivada deberá crearse y documentarse mediante migraciones y contratos versionados en `vento-shell`.

#### 2. Objetivo

Definir, para cada uno de los 112 permisos canónicos, si puede evaluarse y ejecutarse desde un dispositivo compartido y qué nivel adicional de autenticación exige.

La tarea debe impedir que la identidad técnica del dispositivo se convierta en actor empresarial y debe conservar intactos:

- la modalidad del permiso;
- el alcance aprobado;
- los requisitos de turno y check-in;
- el requisito de área activa;
- la sensibilidad;
- la propiedad y el estado del recurso;
- las denegaciones y la precedencia aprobadas.

#### 3. Alcance de la tarea

AUTH-CAT-014 determina exclusivamente:

- la propiedad `shared_device_requirement` de los 112 permisos;
- qué permisos admiten una sesión ordinaria de actor;
- qué permisos exigen reautenticación fuerte;
- qué permisos quedan prohibidos en dispositivos compartidos;
- los requisitos mínimos del dispositivo y de la sesión de actor;
- la relación entre dispositivo, actor, turno, check-in, sede y área;
- el comportamiento al cambiar de actor, expirar la sesión o perder conectividad;
- la matriz explícita de los 112 permisos.

AUTH-CAT-014 no determina:

- qué rol recibe cada permiso;
- qué plantilla o dispositivo concreto recibe cada aplicación;
- el PIN, MFA o proveedor técnico definitivo;
- duraciones numéricas de sesión;
- el contrato técnico definitivo de cada recurso;
- compatibilidad con simulación;
- implementación SQL, RLS, RPC, guards o frontend.

#### 4. Base normativa

Esta propuesta conserva sin cambios:

- ADR-AUTH-001;
- AUTH-MOD-009 — Turno publicado;
- AUTH-MOD-010 — Check-in activo;
- AUTH-MOD-011 — Dispositivo compartido;
- AUTH-MOD-018 — Precedencia entre permisos base y operativos;
- AUTH-MOD-019 — Denegación explícita;
- AUTH-CAT-001 a AUTH-CAT-013.

Reglas heredadas obligatorias:

> El dispositivo no tiene turno; el trabajador sí.

> El dispositivo solo puede reducir autorización. Nunca puede ampliarla.

> El área del dispositivo restringe. No reemplaza el área del turno.

> `T+C` no puede degradarse a `T`, y `T` no puede degradarse a `N`.

#### 5. Propiedad canónica

Todo permiso canónico activo deberá declarar exactamente un valor de:

`shared_device_requirement`

| Valor                    | Significado                                                                                                                                       |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| `STANDARD_ACTOR_SESSION` | El permiso admite dispositivo compartido con una sesión válida de actor humano y las restricciones ordinarias del dispositivo.                    |
| `STRONG_REAUTH_REQUIRED` | El permiso admite dispositivo compartido únicamente después de una reautenticación fuerte vinculada al actor. El PIN ligero por sí solo no basta. |
| `NOT_ALLOWED`            | El permiso no puede ejecutarse ni revelar su información protegida desde un dispositivo compartido. Requiere una sesión personal autenticada.     |

No existe valor nulo permisivo.

Valor ausente o desconocido:

**DENEGAR EN DISPOSITIVO COMPARTIDO**

#### 6. Identidades separadas

Un dispositivo compartido contiene dos identidades distintas:

| Identidad                         | Función                                                                                      | Puede ejecutar permisos empresariales      |
| --------------------------------- | -------------------------------------------------------------------------------------------- | ------------------------------------------ |
| Identidad técnica del dispositivo | Mantener conexión, cargar configuración, declarar aplicaciones y registrar eventos técnicos. | **No**                                     |
| Actor humano                      | Atribuir la acción y aportar sus carriles base y operativo.                                  | **Sí**, cuando toda la decisión sea válida |

La identidad técnica nunca podrá:

- heredar permisos del actor anterior;
- recibir permisos base u operativos;
- utilizar `navigation_role` como autorización;
- usar aplicaciones permitidas como concesiones;
- ejecutar acciones sin actor;
- aparecer como responsable empresarial del recurso.

#### 7. Superficie previa a la identificación

Antes de identificar un actor, el dispositivo solo puede mostrar:

- estado técnico mínimo;
- pantalla de identificación;
- aplicaciones permitidas por configuración;
- información genérica no empresarial;
- bloqueo o mantenimiento.

La pantalla previa no utiliza `shell.access`, `nexo.access`, `pulso.access` ni otro permiso humano.

Mostrar una aplicación permitida en el launcher no significa que el actor pueda entrar en ella.

#### 8. Sesión ordinaria de actor

`STANDARD_ACTOR_SESSION` exige como mínimo:

- dispositivo activo, no revocado y reconocido por servidor;
- aplicación incluida en la configuración efectiva del dispositivo;
- empleado activo;
- identificación humana válida mediante el mecanismo aprobado;
- una única sesión de actor vigente en el dispositivo;
- política del dispositivo satisfecha;
- permiso efectivo del actor;
- turno, check-in, sede y área cuando el permiso los exige;
- recurso y alcance compatibles;
- evaluación del lado servidor;
- auditoría con `device_id`, `employee_id` y `actor_session_id`.

`STANDARD` no significa permiso de bajo riesgo. Significa que la sesión ordinaria de actor es suficiente porque la capacidad pertenece al flujo habitual del terminal.

#### 9. Reautenticación fuerte

`STRONG_REAUTH_REQUIRED` exige, además de la sesión ordinaria:

- autenticación personal fuerte vinculada al actor;
- un factor que no dependa exclusivamente del PIN ligero del dispositivo;
- vigencia corta y verificable;
- confirmación explícita de la acción o acceso;
- no persistir credenciales personales en el dispositivo;
- invalidación al cambiar de actor, bloquear el dispositivo o expirar la sesión;
- registro del método y momento de reautenticación.

La implementación podrá usar contraseña, passkey, MFA u otro mecanismo aprobado. La elección técnica queda fuera de esta tarea.

#### 10. Permisos no admitidos

Cuando un permiso sea `NOT_ALLOWED`:

- el dispositivo no mostrará datos protegidos por ese permiso;
- no ofrecerá acciones ni accesos parciales;
- no degradará la operación a solo lectura;
- no utilizará un permiso más amplio como sustituto;
- no permitirá bypass por nombre de rol;
- deberá indicar que la acción requiere una sesión personal.

#### 11. Restricciones del dispositivo

La autorización final deberá cumplir simultáneamente:

```text
DISPOSITIVO VÁLIDO
+ APLICACIÓN PERMITIDA
+ ACTOR HUMANO VÁLIDO
+ SESIÓN DE ACTOR VIGENTE
+ PERMISO EFECTIVO
+ TURNO Y CHECK-IN CUANDO APLIQUEN
+ SEDE Y ÁREA COMPATIBLES
+ RECURSO Y ESTADO COMPATIBLES
+ REAUTENTICACIÓN FUERTE CUANDO APLIQUE
+ AUSENCIA DE DENEGACIONES
= ACCIÓN AUTORIZADA
```

El dispositivo puede exigir una sede o un área más específica que el permiso.

Nunca puede convertir:

- una sede no autorizada en sede válida;
- el área del dispositivo en área del actor;
- `SITE_SUFFICIENT` en acceso a todas las áreas;
- un permiso base en operativo;
- un permiso operativo en base;
- una sesión de actor en check-in;
- una aplicación instalada en permiso concedido.

#### 12. Cambio, cierre y concurrencia de actor

- Solo puede existir un actor efectivo por dispositivo en un instante.
- Cambiar de actor cierra la sesión anterior y elimina todo dato temporal visible o cacheado del actor previo.
- La reautenticación fuerte no se transfiere al actor siguiente.
- Una acción debe conservar el mismo actor desde su inicio hasta su confirmación transaccional.
- Si el actor cambia, la sesión expira o el dispositivo se bloquea durante una operación, la acción debe reiniciarse.
- La sesión ligera no conserva autorización residual después del cierre.
- El cierre del dispositivo no crea check-out laboral.
- El check-out laboral revoca las capacidades `T+C`, aunque la sesión del dispositivo todavía exista técnicamente.

#### 13. Conectividad y validación

La identidad, el permiso y el contexto efectivo se validan en servidor antes de toda acción protegida.

Sin conectividad verificable:

- no se ejecutan mutaciones empresariales;
- no se ejecutan permisos `STRONG_REAUTH_REQUIRED`;
- no se reutiliza una decisión de autorización anterior;
- una vista cacheada no se considera autorización ni fuente de verdad;
- cualquier capacidad offline futura requerirá contrato independiente y explícito.

#### 14. Matriz completa de los 112 permisos

Leyenda:

| Código        | Valor canónico           |
| ------------- | ------------------------ |
| `STANDARD`    | `STANDARD_ACTOR_SESSION` |
| `STRONG`      | `STRONG_REAUTH_REQUIRED` |
| `NOT_ALLOWED` | `NOT_ALLOWED`            |

##### 14.1 SHELL — 1

| Permiso        | Dispositivo compartido | Condición principal                                                                                                              |
| -------------- | ---------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `shell.access` | `STANDARD`             | Actor identificado; la pantalla previa de selección de actor se controla por configuración del dispositivo, no por este permiso. |

##### 14.2 ANIMA — 10

| Permiso                                     | Dispositivo compartido | Condición principal                                                                      |
| ------------------------------------------- | ---------------------- | ---------------------------------------------------------------------------------------- |
| `anima.access`                              | `NOT_ALLOWED`          | ANIMA y la asistencia/documentación laboral permanecen fuera del dispositivo compartido. |
| `anima.workforce.employee_documents.view`   | `NOT_ALLOWED`          | ANIMA y la asistencia/documentación laboral permanecen fuera del dispositivo compartido. |
| `anima.workforce.employee_documents.upload` | `NOT_ALLOWED`          | ANIMA y la asistencia/documentación laboral permanecen fuera del dispositivo compartido. |
| `anima.workforce.employee_documents.delete` | `NOT_ALLOWED`          | ANIMA y la asistencia/documentación laboral permanecen fuera del dispositivo compartido. |
| `anima.workforce.employee_photos.upload`    | `NOT_ALLOWED`          | ANIMA y la asistencia/documentación laboral permanecen fuera del dispositivo compartido. |
| `anima.workforce.team_members.view`         | `NOT_ALLOWED`          | ANIMA y la asistencia/documentación laboral permanecen fuera del dispositivo compartido. |
| `anima.workforce.staff_invitations.create`  | `NOT_ALLOWED`          | ANIMA y la asistencia/documentación laboral permanecen fuera del dispositivo compartido. |
| `anima.attendance.shifts.create`            | `NOT_ALLOWED`          | ANIMA y la asistencia/documentación laboral permanecen fuera del dispositivo compartido. |
| `anima.attendance.shifts.update`            | `NOT_ALLOWED`          | ANIMA y la asistencia/documentación laboral permanecen fuera del dispositivo compartido. |
| `anima.attendance.shifts.cancel`            | `NOT_ALLOWED`          | ANIMA y la asistencia/documentación laboral permanecen fuera del dispositivo compartido. |

##### 14.3 AURA — 1

| Permiso       | Dispositivo compartido | Condición principal                                               |
| ------------- | ---------------------- | ----------------------------------------------------------------- |
| `aura.access` | `NOT_ALLOWED`          | AURA permanece diferida y sin contrato de dispositivo compartido. |

##### 14.4 FOGO — 6

| Permiso                            | Dispositivo compartido | Condición principal                                                                                                              |
| ---------------------------------- | ---------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `fogo.access`                      | `STANDARD`             | Flujo ordinario de producción; conserva turno, check-in y área cuando correspondan.                                              |
| `fogo.production.batches.view`     | `STANDARD`             | Flujo ordinario de producción; conserva turno, check-in y área cuando correspondan.                                              |
| `fogo.production.batches.create`   | `STANDARD`             | Flujo ordinario de producción; conserva turno, check-in y área cuando correspondan.                                              |
| `fogo.production.orders.view`      | `STANDARD`             | Flujo ordinario de producción; conserva turno, check-in y área cuando correspondan.                                              |
| `fogo.production.recipe_book.view` | `STANDARD`             | Uso operativo necesario en producción; limitar por área, impedir exportación y limpiar la vista al cerrar sesión.                |
| `fogo.production.recipes.view`     | `NOT_ALLOWED`          | El maestro completo de recetas es administrativo y secreto; usar sesión personal. El dispositivo utiliza el recetario operativo. |

##### 14.5 NEXO — 63

| Permiso                                      | Dispositivo compartido | Condición principal                                                                                             |
| -------------------------------------------- | ---------------------- | --------------------------------------------------------------------------------------------------------------- |
| `nexo.access`                                | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.catalog.products.view`                 | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.catalog.products.create`               | `NOT_ALLOWED`          | Mutación de maestro o configuración estructural; requiere sesión personal, no actor ligero de dispositivo.      |
| `nexo.catalog.presentations.view`            | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.catalog.request_policies.view`         | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.catalog.categories.view`               | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.catalog.units.view`                    | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.assets.items.view`                     | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.assets.items.create`                   | `NOT_ALLOWED`          | Mutación de maestro o configuración estructural; requiere sesión personal, no actor ligero de dispositivo.      |
| `nexo.assets.groups.view`                    | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.assets.counts.view`                    | `STANDARD`             | Flujo operativo ordinario; exige actor, contexto, confirmación del recurso y auditoría completa.                |
| `nexo.inventory.adjustments.view`            | `STANDARD`             | Flujo operativo ordinario; exige actor, contexto, confirmación del recurso y auditoría completa.                |
| `nexo.inventory.adjustments.register`        | `STRONG`               | Acción excepcional o de alto impacto; PIN solo no basta. Exige reautenticación fuerte y confirmación explícita. |
| `nexo.inventory.entries.view`                | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.inventory.entries.register`            | `STANDARD`             | Flujo operativo ordinario; exige actor, contexto, confirmación del recurso y auditoría completa.                |
| `nexo.inventory.entries.override`            | `STRONG`               | Acción excepcional o de alto impacto; PIN solo no basta. Exige reautenticación fuerte y confirmación explícita. |
| `nexo.inventory.locations.view`              | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.inventory.location_assignments.assign` | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.inventory.location_catalog.update`     | `NOT_ALLOWED`          | Mutación de maestro o configuración estructural; requiere sesión personal, no actor ligero de dispositivo.      |
| `nexo.inventory.lpns.view`                   | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.inventory.movements.view`              | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.inventory.stock.view`                  | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.inventory.production_batches.view`     | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.inventory.transfers.view`              | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.inventory.transfers.create`            | `STANDARD`             | Flujo operativo ordinario; exige actor, contexto, confirmación del recurso y auditoría completa.                |
| `nexo.inventory.withdrawals.view`            | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.inventory.withdrawals.register`        | `STANDARD`             | Flujo operativo ordinario; exige actor, contexto, confirmación del recurso y auditoría completa.                |
| `nexo.inventory.zones.view`                  | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.inventory.storage_positions.view`      | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.inventory.warehouse_operations.view`   | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.inventory.stock_validations.perform`   | `STANDARD`             | Flujo operativo ordinario; exige actor, contexto, confirmación del recurso y auditoría completa.                |
| `nexo.inventory.stock_counts.view`           | `STANDARD`             | Flujo operativo ordinario; exige actor, contexto, confirmación del recurso y auditoría completa.                |
| `nexo.inventory.stock_counts.perform`        | `STANDARD`             | Flujo operativo ordinario; exige actor, contexto, confirmación del recurso y auditoría completa.                |
| `nexo.inventory.initial_counts.view`         | `STANDARD`             | Flujo operativo ordinario; exige actor, contexto, confirmación del recurso y auditoría completa.                |
| `nexo.inventory.remissions.view`             | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.inventory.remissions.update`           | `STRONG`               | Acción excepcional o de alto impacto; PIN solo no basta. Exige reautenticación fuerte y confirmación explícita. |
| `nexo.inventory.remissions.request`          | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.inventory.remissions.prepare`          | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.inventory.remissions.dispatch`         | `STANDARD`             | Flujo operativo ordinario; exige actor, contexto, confirmación del recurso y auditoría completa.                |
| `nexo.inventory.remissions.receive`          | `STANDARD`             | Flujo operativo ordinario; exige actor, contexto, confirmación del recurso y auditoría completa.                |
| `nexo.inventory.remissions.cancel`           | `STRONG`               | Acción excepcional o de alto impacto; PIN solo no basta. Exige reautenticación fuerte y confirmación explícita. |
| `nexo.logistics.operations_board.view`       | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.logistics.operations.view`             | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.logistics.driver_operations.view`      | `STANDARD`             | Flujo operativo ordinario; exige actor, contexto, confirmación del recurso y auditoría completa.                |
| `nexo.logistics.fulfillment.view`            | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.logistics.fulfillment_routes.view`     | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.logistics.supply_routes.view`          | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.finance.internal_invoices.view`        | `STRONG`               | Información financiera o analítica reservada; exige sesión administrativa y reautenticación fuerte vigente.     |
| `nexo.finance.internal_invoices.generate`    | `NOT_ALLOWED`          | Transición financiera formal; debe ejecutarse desde sesión personal autenticada.                                |
| `nexo.finance.internal_invoices.issue`       | `NOT_ALLOWED`          | Transición financiera formal; debe ejecutarse desde sesión personal autenticada.                                |
| `nexo.finance.internal_invoices.cancel`      | `NOT_ALLOWED`          | Transición financiera formal; debe ejecutarse desde sesión personal autenticada.                                |
| `nexo.finance.internal_invoice_amounts.view` | `STRONG`               | Información financiera o analítica reservada; exige sesión administrativa y reautenticación fuerte vigente.     |
| `nexo.finance.internal_prices.view`          | `STRONG`               | Información financiera o analítica reservada; exige sesión administrativa y reautenticación fuerte vigente.     |
| `nexo.finance.internal_variances.view`       | `STRONG`               | Información financiera o analítica reservada; exige sesión administrativa y reautenticación fuerte vigente.     |
| `nexo.finance.internal_variances.approve`    | `STRONG`               | Acción excepcional o de alto impacto; PIN solo no basta. Exige reautenticación fuerte y confirmación explícita. |
| `nexo.finance.internal_variances.resolve`    | `STRONG`               | Acción excepcional o de alto impacto; PIN solo no basta. Exige reautenticación fuerte y confirmación explícita. |
| `nexo.finance.cost_centers.view`             | `STRONG`               | Información financiera o analítica reservada; exige sesión administrativa y reautenticación fuerte vigente.     |
| `nexo.analytics.internal_reports.view`       | `STRONG`               | Información financiera o analítica reservada; exige sesión administrativa y reautenticación fuerte vigente.     |
| `nexo.analytics.margin_reports.view`         | `STRONG`               | Información financiera o analítica reservada; exige sesión administrativa y reautenticación fuerte vigente.     |
| `nexo.printing.templates.update`             | `NOT_ALLOWED`          | Mutación de maestro o configuración estructural; requiere sesión personal, no actor ligero de dispositivo.      |
| `nexo.printing.jobs.view`                    | `STANDARD`             | Flujo operativo ordinario del terminal; revalidar actor, contexto, alcance y recurso en servidor.               |
| `nexo.settings.sites.view`                   | `STRONG`               | Configuración administrativa; exige reautenticación fuerte aunque sea de solo lectura.                          |
| `nexo.settings.remission_policies.view`      | `STRONG`               | Configuración administrativa; exige reautenticación fuerte aunque sea de solo lectura.                          |

##### 14.6 NUMERA — 6

| Permiso                                   | Dispositivo compartido | Condición principal                                                                                         |
| ----------------------------------------- | ---------------------- | ----------------------------------------------------------------------------------------------------------- |
| `numera.access`                           | `STRONG`               | Información financiera o analítica reservada; exige sesión administrativa y reautenticación fuerte vigente. |
| `numera.finance.cost_centers.view`        | `STRONG`               | Información financiera o analítica reservada; exige sesión administrativa y reautenticación fuerte vigente. |
| `numera.finance.expenses.view`            | `STRONG`               | Información financiera o analítica reservada; exige sesión administrativa y reautenticación fuerte vigente. |
| `numera.analytics.break_even.view`        | `STRONG`               | Información financiera o analítica reservada; exige sesión administrativa y reautenticación fuerte vigente. |
| `numera.analytics.profitability.view`     | `STRONG`               | Información financiera o analítica reservada; exige sesión administrativa y reautenticación fuerte vigente. |
| `numera.analytics.financial_reports.view` | `STRONG`               | Información financiera o analítica reservada; exige sesión administrativa y reautenticación fuerte vigente. |

##### 14.7 ORIGO — 5

| Permiso                                  | Dispositivo compartido | Condición principal                                                                              |
| ---------------------------------------- | ---------------------- | ------------------------------------------------------------------------------------------------ |
| `origo.access`                           | `STANDARD`             | Admitido en terminal de abastecimiento o recepción; exponer solo la proyección mínima necesaria. |
| `origo.procurement.purchase_orders.view` | `STANDARD`             | Admitido en terminal de abastecimiento o recepción; exponer solo la proyección mínima necesaria. |
| `origo.procurement.receipts.view`        | `STANDARD`             | Admitido en terminal de abastecimiento o recepción; exponer solo la proyección mínima necesaria. |
| `origo.procurement.suppliers.view`       | `STANDARD`             | Admitido en terminal de abastecimiento o recepción; exponer solo la proyección mínima necesaria. |
| `origo.catalog.product_reviews.view`     | `STRONG`               | Capacidad administrativa de catálogo; exige reautenticación fuerte en terminal autorizada.       |

##### 14.8 PASS — 1

| Permiso       | Dispositivo compartido | Condición principal                                                                                 |
| ------------- | ---------------------- | --------------------------------------------------------------------------------------------------- |
| `pass.access` | `NOT_ALLOWED`          | PASS conserva identidad cliente separada y no utiliza la sesión laboral del dispositivo compartido. |

##### 14.9 PULSO — 2

| Permiso                              | Dispositivo compartido | Condición principal                                                                                             |
| ------------------------------------ | ---------------------- | --------------------------------------------------------------------------------------------------------------- |
| `pulso.access`                       | `STANDARD`             | Admitido en caja compartida después de identificar actor y validar su turno.                                    |
| `pulso.delivery.deliveries.override` | `STRONG`               | Acción excepcional o de alto impacto; PIN solo no basta. Exige reautenticación fuerte y confirmación explícita. |

##### 14.10 VISO — 17

| Permiso                                       | Dispositivo compartido | Condición principal                                                                                         |
| --------------------------------------------- | ---------------------- | ----------------------------------------------------------------------------------------------------------- |
| `viso.access`                                 | `STRONG`               | Capacidad administrativa; exige terminal administrativa autorizada, reautenticación fuerte y bloqueo corto. |
| `viso.platform.app_updates.view`              | `STRONG`               | Capacidad administrativa; exige terminal administrativa autorizada, reautenticación fuerte y bloqueo corto. |
| `viso.organization.businesses.view`           | `STRONG`               | Capacidad administrativa; exige terminal administrativa autorizada, reautenticación fuerte y bloqueo corto. |
| `viso.workforce.employees.view`               | `STRONG`               | Capacidad administrativa; exige terminal administrativa autorizada, reautenticación fuerte y bloqueo corto. |
| `viso.workforce.staff_calendar.view`          | `STRONG`               | Capacidad administrativa; exige terminal administrativa autorizada, reautenticación fuerte y bloqueo corto. |
| `viso.workforce.schedules.view`               | `STRONG`               | Capacidad administrativa; exige terminal administrativa autorizada, reautenticación fuerte y bloqueo corto. |
| `viso.workforce.vacancies.view`               | `STRONG`               | Capacidad administrativa; exige terminal administrativa autorizada, reautenticación fuerte y bloqueo corto. |
| `viso.authorization.context_simulations.view` | `STRONG`               | Capacidad administrativa; exige terminal administrativa autorizada, reautenticación fuerte y bloqueo corto. |
| `viso.authorization.audit_logs.view`          | `STRONG`               | Capacidad administrativa; exige terminal administrativa autorizada, reautenticación fuerte y bloqueo corto. |
| `viso.catalog.commercial_categories.view`     | `STRONG`               | Capacidad administrativa; exige terminal administrativa autorizada, reautenticación fuerte y bloqueo corto. |
| `viso.content.content_blocks.view`            | `STRONG`               | Capacidad administrativa; exige terminal administrativa autorizada, reautenticación fuerte y bloqueo corto. |
| `viso.content.menu.view`                      | `STRONG`               | Capacidad administrativa; exige terminal administrativa autorizada, reautenticación fuerte y bloqueo corto. |
| `viso.content.website_content.view`           | `STRONG`               | Capacidad administrativa; exige terminal administrativa autorizada, reautenticación fuerte y bloqueo corto. |
| `viso.finance.accounting.view`                | `STRONG`               | Información financiera o analítica reservada; exige sesión administrativa y reautenticación fuerte vigente. |
| `viso.delivery.rates.view`                    | `STRONG`               | Capacidad administrativa; exige terminal administrativa autorizada, reautenticación fuerte y bloqueo corto. |
| `viso.loyalty.products.view`                  | `STRONG`               | Capacidad administrativa; exige terminal administrativa autorizada, reautenticación fuerte y bloqueo corto. |
| `viso.loyalty.customers.view`                 | `STRONG`               | Capacidad administrativa; exige terminal administrativa autorizada, reautenticación fuerte y bloqueo corto. |

#### 15. Resumen cuantitativo

##### 15.1 Clasificación general

| Clasificación            | Permisos |
| ------------------------ | -------: |
| `STANDARD_ACTOR_SESSION` |       52 |
| `STRONG_REAUTH_REQUIRED` |       40 |
| `NOT_ALLOWED`            |       20 |
| **Total**                |  **112** |

##### 15.2 Por aplicación

| Aplicación | `STANDARD` | `STRONG` | `NOT_ALLOWED` |   Total |
| ---------- | ---------: | -------: | ------------: | ------: |
| SHELL      |          1 |        0 |             0 |       1 |
| ANIMA      |          0 |        0 |            10 |      10 |
| AURA       |          0 |        0 |             1 |       1 |
| FOGO       |          5 |        0 |             1 |       6 |
| NEXO       |         41 |       15 |             7 |      63 |
| NUMERA     |          0 |        6 |             0 |       6 |
| ORIGO      |          4 |        1 |             0 |       5 |
| PASS       |          0 |        0 |             1 |       1 |
| PULSO      |          1 |        1 |             0 |       2 |
| VISO       |          0 |       17 |             0 |      17 |
| **Total**  |     **52** |   **40** |        **20** | **112** |

##### 15.3 Por modalidad

| Modalidad              | `STANDARD` | `STRONG` | `NOT_ALLOWED` |   Total |
| ---------------------- | ---------: | -------: | ------------: | ------: |
| `BASE_ONLY`            |          1 |       33 |            20 |      54 |
| `BASE_OR_OPERATIONAL`  |         38 |        2 |             0 |      40 |
| `OPERATIONAL_ONLY`     |         13 |        0 |             0 |      13 |
| `BASE_AND_OPERATIONAL` |          0 |        5 |             0 |       5 |
| **Total**              |     **52** |   **40** |        **20** | **112** |

##### 15.4 Relación con sensibilidad

| Sensibilidad | `STANDARD` | `STRONG` | `NOT_ALLOWED` |   Total |
| ------------ | ---------: | -------: | ------------: | ------: |
| Sensible     |         17 |       26 |            17 |      60 |
| No sensible  |         35 |       14 |             3 |      52 |
| **Total**    |     **52** |   **40** |        **20** | **112** |

##### 15.5 Relación con área operativa

| Área operativa    | `STANDARD` | `STRONG` | `NOT_ALLOWED` |   Total |
| ----------------- | ---------: | -------: | ------------: | ------: |
| `REQUIRED`        |         27 |        4 |             0 |      31 |
| `SITE_SUFFICIENT` |         24 |        3 |             0 |      27 |
| `NOT_APPLICABLE`  |          1 |       33 |            20 |      54 |
| **Total**         |     **52** |   **40** |        **20** | **112** |

#### 16. Ejemplos normativos

##### 16.1 Kiosco de bodega — operación ordinaria

| Elemento      | Valor                                                                    |
| ------------- | ------------------------------------------------------------------------ |
| Permiso       | `nexo.inventory.withdrawals.register`                                    |
| Clasificación | `STANDARD_ACTOR_SESSION`                                                 |
| Dispositivo   | Kiosco activo de Bodega                                                  |
| Actor         | Identificado mediante PIN                                                |
| Contexto      | Turno, check-in, sede y área válidos                                     |
| Resultado     | Puede registrar el retiro y la auditoría atribuye la acción al empleado. |

##### 16.2 Cancelación de remisión

| Elemento                      | Valor                                           |
| ----------------------------- | ----------------------------------------------- |
| Permiso                       | `nexo.inventory.remissions.cancel`              |
| Clasificación                 | `STRONG_REAUTH_REQUIRED`                        |
| PIN ligero                    | Insuficiente                                    |
| Requisito adicional           | Reautenticación fuerte y confirmación explícita |
| Resultado sin reautenticación | **DENEGAR**                                     |

##### 16.3 Gestión desde VISO

| Elemento      | Valor                                                                                         |
| ------------- | --------------------------------------------------------------------------------------------- |
| Permiso       | `viso.workforce.employees.view`                                                               |
| Clasificación | `STRONG_REAUTH_REQUIRED`                                                                      |
| Dispositivo   | Terminal administrativa autorizada                                                            |
| Requisito     | Actor con permiso base y reautenticación fuerte vigente                                       |
| Resultado     | Puede consultar únicamente el alcance autorizado; la pantalla se limpia al cerrar o bloquear. |

##### 16.4 ANIMA en dispositivo compartido

| Elemento      | Valor                                                                                    |
| ------------- | ---------------------------------------------------------------------------------------- |
| Permiso       | `anima.access`                                                                           |
| Clasificación | `NOT_ALLOWED`                                                                            |
| Resultado     | El dispositivo no actúa como terminal de asistencia ni abre la sesión personal de ANIMA. |

##### 16.5 Identidad técnica sin actor

| Elemento           | Valor                                     |
| ------------------ | ----------------------------------------- |
| Dispositivo        | Activo y autenticado técnicamente         |
| Actor              | Ausente                                   |
| Permiso solicitado | `nexo.inventory.stock.view`               |
| Resultado          | **DENEGAR** por ausencia de actor humano. |

#### 17. Razones conceptuales de bloqueo

| Razón                                 | Significado                                                                 |
| ------------------------------------- | --------------------------------------------------------------------------- |
| `shared_device_not_allowed`           | El permiso está clasificado como `NOT_ALLOWED`.                             |
| `shared_device_inactive`              | El dispositivo está inactivo, revocado o no reconocido.                     |
| `shared_device_app_not_allowed`       | La aplicación no pertenece a la configuración efectiva del dispositivo.     |
| `shared_device_actor_required`        | No existe un actor humano identificado.                                     |
| `shared_device_actor_session_expired` | La sesión ligera del actor expiró o fue cerrada.                            |
| `shared_device_policy_mismatch`       | El actor no satisface la política de sede, área o rol del dispositivo.      |
| `shared_device_site_mismatch`         | La sede del actor o recurso no coincide con la restricción del dispositivo. |
| `shared_device_area_mismatch`         | El área del dispositivo contradice el área activa o el recurso.             |
| `strong_reauth_required`              | El permiso exige reautenticación fuerte y no existe una válida.             |
| `strong_reauth_expired`               | La reautenticación fuerte dejó de estar vigente.                            |
| `shared_device_actor_changed`         | El actor cambió durante una operación y la acción debe reiniciarse.         |
| `shared_device_context_stale`         | El turno, check-in, permiso o contexto cambió desde la última validación.   |

La nomenclatura técnica definitiva se formalizará durante BLOQUE E.

#### 18. Invariantes

- Todo permiso canónico declara `shared_device_requirement`.
- Solo existen `STANDARD_ACTOR_SESSION`, `STRONG_REAUTH_REQUIRED` y `NOT_ALLOWED`.
- La identidad técnica del dispositivo nunca ejecuta permisos empresariales.
- Toda acción empresarial requiere un actor humano válido.
- La sesión de actor no es un login completo ni un check-in.
- El dispositivo no tiene turno, check-in, rol base ni rol operativo.
- El actor conserva sus propios carriles base y operativo.
- El dispositivo puede restringir, pero nunca conceder o ampliar.
- Una aplicación permitida no equivale a permiso concedido.
- `navigation_role` no participa como concesión.
- El PIN ligero identifica al actor, pero no satisface `STRONG_REAUTH_REQUIRED`.
- La reautenticación fuerte pertenece al actor y no se transfiere.
- El cambio de actor revoca el contexto visual y temporal anterior.
- T y T+C permanecen sin cambios.
- REQUIRED y SITE_SUFFICIENT permanecen sin cambios.
- El área del dispositivo no reemplaza el área del turno.
- BASE_AND_OPERATIONAL continúa exigiendo ambos carriles.
- No existe bypass por nombre de rol, tipo de dispositivo o plantilla.
- La autorización se revalida en servidor al ejecutar la acción.
- No se ejecutan mutaciones empresariales sin conectividad verificable.
- La auditoría registra dispositivo, actor y sesión de actor.
- Cerrar la sesión del dispositivo no crea check-out laboral.
- Cerrar el check-in revoca las capacidades T+C aunque el dispositivo siga activo.
- Los aliases heredan la clasificación de la clave canónica.
- Los permisos legacy y técnicos retirados no reciben clasificación independiente.
- Un cambio futuro de compatibilidad es un cambio contractual versionado.

#### 19. Criterios de aprobación

AUTH-CAT-014 podrá aprobarse cuando se acepte expresamente que:

- los 112 permisos tienen una decisión explícita;
- 52 permisos admiten sesión ordinaria de actor;
- 40 permisos admiten dispositivo únicamente con reautenticación fuerte;
- 20 permisos quedan prohibidos en dispositivos compartidos;
- la identidad técnica no puede ejecutar permisos empresariales;
- la pantalla previa a la identificación no utiliza permisos humanos;
- el dispositivo no reemplaza turno, check-in, sede, área ni permiso;
- el PIN ligero no satisface permisos `STRONG`;
- los cinco permisos `BASE_AND_OPERATIONAL` permanecen combinados y requieren reautenticación fuerte;
- las operaciones ordinarias de FOGO, NEXO, ORIGO y PULSO pueden ejecutarse en terminales compartidas cuando su contexto sea válido;
- las acciones excepcionales exigen reautenticación fuerte;
- ANIMA no se convierte en terminal de asistencia compartida;
- PASS conserva separada la identidad cliente;
- AURA continúa diferida;
- las mutaciones de maestros, plantillas y ciclo formal de facturación seleccionadas quedan fuera del dispositivo compartido;
- el cambio de actor cierra y limpia el contexto anterior;
- la autorización se valida en servidor y la acción queda atribuida al empleado real;
- la tarea no implementa código ni migraciones.

#### 20. Impacto sobre tareas posteriores

##### AUTH-CAT-015

Podrá simular la compatibilidad con dispositivos, pero la simulación:

- no crea una sesión real de actor;
- no crea reautenticación fuerte;
- no habilita permisos `NOT_ALLOWED`;
- no ejecuta acciones empresariales.

##### AUTH-CAT-016

Deberá formalizar por permiso y recurso:

- identificación del dispositivo;
- ruta para resolver actor;
- sede y área del dispositivo;
- compatibilidad entre dispositivo y recurso;
- campos de auditoría;
- reglas de confirmación y concurrencia.

##### BLOQUE D

Las matrices de dispositivos deberán definir:

- plantillas;
- aplicaciones permitidas;
- políticas de actor;
- sede y área restrictivas;
- permisos compatibles;
- exigencia de reautenticación fuerte;
- prohibiciones explícitas.

Ninguna matriz podrá asignar un permiso `NOT_ALLOWED` a un dispositivo.

##### BLOQUE E

`AccessContext` deberá exponer separadamente:

- identidad técnica del dispositivo;
- actor efectivo;
- sesión de actor;
- aplicación permitida;
- sede y área del dispositivo;
- reautenticación fuerte y vigencia;
- contexto laboral del actor.

`AuthorizationDecision` deberá registrar:

- `shared_device_requirement`;
- `shared_device_satisfied`;
- `device_id`;
- `actor_session_id`;
- `strong_reauth_satisfied`;
- restricciones y razones de bloqueo.

#### 21. Estado final de la propuesta

| Tarea        | Estado      |
| ------------ | ----------- |
| AUTH-CAT-013 | APROBADA    |
| AUTH-CAT-014 | APROBADA    |
| AUTH-CAT-015 | NO INICIADA |

No se avanza a AUTH-CAT-015 hasta recibir aprobación explícita.


### ✅ AUTH-CAT-015 — Definir permisos que admiten simulación

#### 1. Identificación de la tarea

| Campo                     | Valor                                                                               |
| ------------------------- | ----------------------------------------------------------------------------------- |
| Bloque                    | BLOQUE C — Catálogo canónico de aplicaciones y permisos                             |
| Tarea                     | AUTH-CAT-015 — Definir permisos que admiten simulación                              |
| Estado                    | **APROBADA**                                                                        |
| Naturaleza                | Definición documental                                                               |
| Implementación            | No incluida                                                                         |
| Tarea anterior vigente    | AUTH-CAT-014 — Definir permisos que admiten dispositivo compartido                  |
| Tarea posterior reservada | AUTH-CAT-016 — Definir contrato de recurso y resolución territorial de cada permiso |

Esta tarea no realiza cambios en Supabase, migraciones, tablas, RLS, RPC, aplicaciones, matrices ni repositorios.

Toda futura implementación derivada deberá crearse y documentarse mediante contratos y migraciones versionadas en `vento-shell`.

#### 2. Objetivo

Definir, para cada uno de los 112 permisos canónicos, qué nivel de simulación admite sin convertir una decisión hipotética en autorización real ni exponer información que el actor real no puede consultar.

La tarea debe distinguir entre:

- previsualizar navegación, componentes y una decisión hipotética;
- calcular únicamente `would_allow`, `would_deny` o `indeterminate`;
- excluir completamente una capacidad del contexto simulado.

#### 3. Alcance de la tarea

AUTH-CAT-015 determina exclusivamente:

- la propiedad `simulation_requirement` de los 112 permisos;
- qué permisos admiten previsualización completa;
- qué permisos admiten únicamente evaluación de decisión;
- qué permisos no pueden participar en simulación;
- el tratamiento de datos reales, sintéticos y enmascarados;
- el tratamiento de mutaciones durante la vista previa;
- la relación entre actor real, sujeto simulado y recurso hipotético;
- la interacción con turno, check-in, sede, área y dispositivo;
- la matriz explícita de los 112 permisos.

AUTH-CAT-015 no determina:

- qué rol recibe cada permiso;
- qué administrador recibe el permiso de iniciar simulación;
- la implementación física de `context_simulation_sessions`;
- componentes de frontend definitivos;
- datasets sintéticos definitivos;
- duración técnica de caché;
- RPC, RLS, guards o migraciones;
- el contrato completo de cada recurso, reservado para AUTH-CAT-016.

#### 4. Base normativa

Esta propuesta conserva sin cambios:

- ADR-AUTH-001;
- AUTH-MOD-001 — Identidad laboral y actor efectivo;
- AUTH-MOD-007 y AUTH-MOD-008 — Sede y área;
- AUTH-MOD-009 y AUTH-MOD-010 — Turno y check-in;
- AUTH-MOD-011 — Dispositivo compartido;
- AUTH-MOD-012 — Simulación de contexto de autorización;
- AUTH-MOD-018 y AUTH-MOD-019 — Precedencia y denegación explícita;
- AUTH-CAT-001 a AUTH-CAT-014.

Reglas heredadas obligatorias:

> La simulación calcula una decisión hipotética; nunca concede autorización ejecutable.

> El actor real conserva `auth.uid()`, identidad, permisos, alcance y auditoría.

> El permiso simulado controla la representación hipotética; el permiso real del actor controla el acceso a datos reales.

> Una simulación activa no puede ejecutar mutaciones empresariales.

#### 5. Propiedad canónica

Todo permiso canónico activo deberá declarar exactamente un valor de `simulation_requirement`.

| Valor           | Significado                                                                                                                                                         |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `FULL_PREVIEW`  | Permite evaluar la decisión y previsualizar navegación o componentes con datos sintéticos, vacíos, enmascarados o datos reales ya autorizados al actor real.        |
| `DECISION_ONLY` | Permite calcular `would_allow`, `would_deny` o `indeterminate` y mostrar razones, pero no renderizar el contenido protegido ni un formulario operativo del recurso. |
| `NOT_ALLOWED`   | El permiso no puede utilizarse como permiso simulado ni alterar la interfaz simulada. Solo puede evaluarse mediante autorización real cuando corresponda.           |

No existe valor nulo permisivo.

Valor ausente o desconocido:

**DENEGAR LA SIMULACIÓN DEL PERMISO**

#### 6. Resultados de simulación

La evaluación simulada solo puede devolver:

| Resultado       | Significado                                                                                  |
| --------------- | -------------------------------------------------------------------------------------------- |
| `would_allow`   | El contexto hipotético cumpliría las reglas conocidas. No autoriza una acción real.          |
| `would_deny`    | El contexto hipotético incumple una o más reglas conocidas.                                  |
| `indeterminate` | Falta un dato contractual, el recurso no puede resolverse con seguridad o existe ambigüedad. |

La simulación nunca devuelve un `allow` ejecutable ni genera un token de autorización reutilizable.

#### 7. Actor real y sujeto simulado

| Elemento        | Regla                                                                        |
| --------------- | ---------------------------------------------------------------------------- |
| Actor real      | Administrador personalmente autenticado que inicia y controla la simulación. |
| Sujeto simulado | Rol, empleado o contexto hipotético evaluado. No reemplaza al actor real.    |
| Auditoría       | Toda actividad se atribuye al actor real.                                    |
| `auth.uid()`    | Nunca cambia por la simulación.                                              |
| Sesión personal | Obligatoria para iniciar o mantener la simulación.                           |

`real_actor_id` y `simulated_subject_id` nunca son intercambiables.

#### 8. Acceso a datos durante la simulación

La simulación utilizará uno de estos modos de datos:

| Modo              | Uso permitido                                                                                                          |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `SYNTHETIC`       | Datos ficticios, deterministas y sin relación con registros reales. Es el modo predeterminado.                         |
| `MASKED`          | Estructuras reales o de prueba con campos sensibles anonimizados, truncados o sustituidos.                             |
| `REAL_AUTHORIZED` | Datos reales que el actor real ya puede consultar mediante su propia autorización, nunca mediante el permiso simulado. |
| `NONE`            | Sin contenido de recurso; solo decisión y razones. Obligatorio para `DECISION_ONLY`.                                   |

Regla central:

**PERMISO SIMULADO ≠ PERMISO PARA LEER DATOS REALES**

Cuando el actor real no tiene acceso al contenido real, la vista deberá usar datos sintéticos, enmascarados o una estructura vacía.

#### 9. Mutaciones y acciones simuladas

Un permiso mutador clasificado como `FULL_PREVIEW` puede mostrar:

- botones;
- formularios;
- validaciones;
- estados habilitado o bloqueado;
- confirmaciones simuladas;
- resultado hipotético.

Pero toda acción deberá quedar:

- deshabilitada;
- interceptada antes de una RPC, Server Action o escritura; o
- dirigida exclusivamente al evaluador simulado.

Queda prohibido durante simulación:

- insertar, actualizar o eliminar datos empresariales;
- enviar notificaciones;
- registrar asistencia;
- publicar turnos;
- mover inventario;
- crear producción;
- procesar pagos;
- emitir documentos;
- modificar permisos;
- exportar información por autoridad simulada.

#### 10. Prerrequisitos hipotéticos

La simulación puede modelar hipotéticamente:

- carril base;
- carril operativo;
- turno publicado o vigente;
- check-in activo o ausente;
- sede;
- área;
- rol operativo;
- alcance;
- recurso;
- dispositivo compatible;
- reautenticación fuerte hipotética.

Pero no crea ninguno de esos elementos en el sistema real.

Las propiedades aprobadas en AUTH-CAT-012, AUTH-CAT-013 y AUTH-CAT-014 se evalúan sin degradación.

#### 11. Dispositivos compartidos

La herramienta de simulación no puede iniciarse ni mantenerse desde:

- identidad técnica de dispositivo;
- sesión ligera de actor;
- kiosco;
- terminal POS compartida;
- PIN de dispositivo.

La simulación de un escenario con dispositivo compartido sí puede calcular hipotéticamente la compatibilidad aprobada en AUTH-CAT-014, pero no crea una sesión real de actor ni una reautenticación fuerte real.

#### 12. Permiso real para iniciar simulación

El permiso canónico disponible es `viso.authorization.context_simulations.view`.

Este permiso se evalúa únicamente contra la autorización real del actor. Nunca puede ser satisfecho por:

- el rol simulado;
- un permiso simulado;
- un resultado `would_allow`;
- una sesión de dispositivo compartido;
- un nombre de rol;
- un bypass implícito.

Por esta razón, el propio permiso se clasifica como `NOT_ALLOWED` dentro de la matriz de simulación.

#### 13. Alcance simulable

El escenario simulado queda limitado por la intersección de:

- alcance administrativo real del actor;
- alcance del permiso real de simulación;
- aislamiento de la sede;
- datos que el actor real puede consultar;
- contexto hipotético coherente.

Un gerente de sede autorizado para simular no puede explorar otra sede, APP-REVIEW ni información global fuera de su alcance.

#### 14. Matriz completa de los 112 permisos

Leyenda:

| Código        | Valor canónico  |
| ------------- | --------------- |
| `FULL`        | `FULL_PREVIEW`  |
| `DECISION`    | `DECISION_ONLY` |
| `NOT_ALLOWED` | `NOT_ALLOWED`   |

##### 14.1 SHELL — 1

| Permiso        | Simulación | Condición principal                                                                                                              |
| -------------- | ---------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `shell.access` | `FULL`     | Puede previsualizar visibilidad de la aplicación y navegación, sin iniciar una sesión distinta ni conceder capacidades internas. |

##### 14.2 ANIMA — 10

| Permiso                                     | Simulación | Condición principal                                                                                                                                   |
| ------------------------------------------- | ---------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| `anima.access`                              | `FULL`     | Puede previsualizar visibilidad de la aplicación y navegación, sin iniciar una sesión distinta ni conceder capacidades internas.                      |
| `anima.workforce.employee_documents.view`   | `DECISION` | Solo decisión y razones; no mostrar documentos, metadatos privados ni formularios de carga o eliminación del trabajador.                              |
| `anima.workforce.employee_documents.upload` | `DECISION` | Solo decisión y razones; no mostrar documentos, metadatos privados ni formularios de carga o eliminación del trabajador.                              |
| `anima.workforce.employee_documents.delete` | `DECISION` | Solo decisión y razones; no mostrar documentos, metadatos privados ni formularios de carga o eliminación del trabajador.                              |
| `anima.workforce.employee_photos.upload`    | `DECISION` | Solo decisión y razones; no mostrar ni capturar fotografías reales durante la simulación.                                                             |
| `anima.workforce.team_members.view`         | `DECISION` | Solo decisión y razones; no revelar directorio laboral real mediante permisos simulados.                                                              |
| `anima.workforce.staff_invitations.create`  | `DECISION` | Solo decisión y razones por tratarse de control de acceso e incorporación de identidades.                                                             |
| `anima.attendance.shifts.create`            | `FULL`     | Puede previsualizar la interfaz y el resultado hipotético con recurso sintético; toda acción queda deshabilitada o interceptada y no produce efectos. |
| `anima.attendance.shifts.update`            | `FULL`     | Puede previsualizar la interfaz y el resultado hipotético con recurso sintético; toda acción queda deshabilitada o interceptada y no produce efectos. |
| `anima.attendance.shifts.cancel`            | `FULL`     | Puede previsualizar la interfaz y el resultado hipotético con recurso sintético; toda acción queda deshabilitada o interceptada y no produce efectos. |

##### 14.3 AURA — 1

| Permiso       | Simulación    | Condición principal                                                                                       |
| ------------- | ------------- | --------------------------------------------------------------------------------------------------------- |
| `aura.access` | `NOT_ALLOWED` | AURA permanece diferida y no tiene contrato funcional suficiente para construir una simulación confiable. |

##### 14.4 FOGO — 6

| Permiso                            | Simulación | Condición principal                                                                                                                                       |
| ---------------------------------- | ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `fogo.access`                      | `FULL`     | Puede previsualizar visibilidad de la aplicación y navegación, sin iniciar una sesión distinta ni conceder capacidades internas.                          |
| `fogo.production.batches.view`     | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `fogo.production.batches.create`   | `FULL`     | Puede previsualizar la interfaz y el resultado hipotético con recurso sintético; toda acción queda deshabilitada o interceptada y no produce efectos.     |
| `fogo.production.orders.view`      | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `fogo.production.recipe_book.view` | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `fogo.production.recipes.view`     | `DECISION` | Solo decisión y razones; el maestro completo de recetas es secreto empresarial y no se revela por simulación.                                             |

##### 14.5 NEXO — 63

| Permiso                                      | Simulación | Condición principal                                                                                                                                       |
| -------------------------------------------- | ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `nexo.access`                                | `FULL`     | Puede previsualizar visibilidad de la aplicación y navegación, sin iniciar una sesión distinta ni conceder capacidades internas.                          |
| `nexo.catalog.products.view`                 | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.catalog.products.create`               | `FULL`     | Puede previsualizar la interfaz y el resultado hipotético con recurso sintético; toda acción queda deshabilitada o interceptada y no produce efectos.     |
| `nexo.catalog.presentations.view`            | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.catalog.request_policies.view`         | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.catalog.categories.view`               | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.catalog.units.view`                    | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.assets.items.view`                     | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.assets.items.create`                   | `FULL`     | Puede previsualizar la interfaz y el resultado hipotético con recurso sintético; toda acción queda deshabilitada o interceptada y no produce efectos.     |
| `nexo.assets.groups.view`                    | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.assets.counts.view`                    | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.inventory.adjustments.view`            | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.inventory.adjustments.register`        | `FULL`     | Puede previsualizar la interfaz y el resultado hipotético con recurso sintético; toda acción queda deshabilitada o interceptada y no produce efectos.     |
| `nexo.inventory.entries.view`                | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.inventory.entries.register`            | `FULL`     | Puede previsualizar la interfaz y el resultado hipotético con recurso sintético; toda acción queda deshabilitada o interceptada y no produce efectos.     |
| `nexo.inventory.entries.override`            | `FULL`     | Puede previsualizar la interfaz y el resultado hipotético con recurso sintético; toda acción queda deshabilitada o interceptada y no produce efectos.     |
| `nexo.inventory.locations.view`              | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.inventory.location_assignments.assign` | `FULL`     | Puede previsualizar la interfaz y el resultado hipotético con recurso sintético; toda acción queda deshabilitada o interceptada y no produce efectos.     |
| `nexo.inventory.location_catalog.update`     | `FULL`     | Puede previsualizar la interfaz y el resultado hipotético con recurso sintético; toda acción queda deshabilitada o interceptada y no produce efectos.     |
| `nexo.inventory.lpns.view`                   | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.inventory.movements.view`              | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.inventory.stock.view`                  | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.inventory.production_batches.view`     | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.inventory.transfers.view`              | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.inventory.transfers.create`            | `FULL`     | Puede previsualizar la interfaz y el resultado hipotético con recurso sintético; toda acción queda deshabilitada o interceptada y no produce efectos.     |
| `nexo.inventory.withdrawals.view`            | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.inventory.withdrawals.register`        | `FULL`     | Puede previsualizar la interfaz y el resultado hipotético con recurso sintético; toda acción queda deshabilitada o interceptada y no produce efectos.     |
| `nexo.inventory.zones.view`                  | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.inventory.storage_positions.view`      | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.inventory.warehouse_operations.view`   | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.inventory.stock_validations.perform`   | `FULL`     | Puede previsualizar la interfaz y el resultado hipotético con recurso sintético; toda acción queda deshabilitada o interceptada y no produce efectos.     |
| `nexo.inventory.stock_counts.view`           | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.inventory.stock_counts.perform`        | `FULL`     | Puede previsualizar la interfaz y el resultado hipotético con recurso sintético; toda acción queda deshabilitada o interceptada y no produce efectos.     |
| `nexo.inventory.initial_counts.view`         | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.inventory.remissions.view`             | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.inventory.remissions.update`           | `FULL`     | Puede previsualizar la interfaz y el resultado hipotético con recurso sintético; toda acción queda deshabilitada o interceptada y no produce efectos.     |
| `nexo.inventory.remissions.request`          | `FULL`     | Puede previsualizar la interfaz y el resultado hipotético con recurso sintético; toda acción queda deshabilitada o interceptada y no produce efectos.     |
| `nexo.inventory.remissions.prepare`          | `FULL`     | Puede previsualizar la interfaz y el resultado hipotético con recurso sintético; toda acción queda deshabilitada o interceptada y no produce efectos.     |
| `nexo.inventory.remissions.dispatch`         | `FULL`     | Puede previsualizar la interfaz y el resultado hipotético con recurso sintético; toda acción queda deshabilitada o interceptada y no produce efectos.     |
| `nexo.inventory.remissions.receive`          | `FULL`     | Puede previsualizar la interfaz y el resultado hipotético con recurso sintético; toda acción queda deshabilitada o interceptada y no produce efectos.     |
| `nexo.inventory.remissions.cancel`           | `FULL`     | Puede previsualizar la interfaz y el resultado hipotético con recurso sintético; toda acción queda deshabilitada o interceptada y no produce efectos.     |
| `nexo.logistics.operations_board.view`       | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.logistics.operations.view`             | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.logistics.driver_operations.view`      | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.logistics.fulfillment.view`            | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.logistics.fulfillment_routes.view`     | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.logistics.supply_routes.view`          | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.finance.internal_invoices.view`        | `DECISION` | Solo decisión y razones; no renderizar documentos, montos ni controles del ciclo formal de facturación interna.                                           |
| `nexo.finance.internal_invoices.generate`    | `DECISION` | Solo decisión y razones; no renderizar documentos, montos ni controles del ciclo formal de facturación interna.                                           |
| `nexo.finance.internal_invoices.issue`       | `DECISION` | Solo decisión y razones; no renderizar documentos, montos ni controles del ciclo formal de facturación interna.                                           |
| `nexo.finance.internal_invoices.cancel`      | `DECISION` | Solo decisión y razones; no renderizar documentos, montos ni controles del ciclo formal de facturación interna.                                           |
| `nexo.finance.internal_invoice_amounts.view` | `DECISION` | Solo decisión y razones; no renderizar documentos, montos ni controles del ciclo formal de facturación interna.                                           |
| `nexo.finance.internal_prices.view`          | `DECISION` | Solo decisión y razones; no revelar precios internos ni valores comerciales mediante permisos simulados.                                                  |
| `nexo.finance.internal_variances.view`       | `DECISION` | Solo decisión y razones; no mostrar valores, soportes ni controles de aprobación o resolución reales.                                                     |
| `nexo.finance.internal_variances.approve`    | `DECISION` | Solo decisión y razones; no mostrar valores, soportes ni controles de aprobación o resolución reales.                                                     |
| `nexo.finance.internal_variances.resolve`    | `DECISION` | Solo decisión y razones; no mostrar valores, soportes ni controles de aprobación o resolución reales.                                                     |
| `nexo.finance.cost_centers.view`             | `DECISION` | Solo decisión y razones; no exponer estructura financiera real fuera de la autorización del actor real.                                                   |
| `nexo.analytics.internal_reports.view`       | `DECISION` | Solo decisión y razones; no calcular ni mostrar reportes, márgenes o agregados reales mediante el permiso simulado.                                       |
| `nexo.analytics.margin_reports.view`         | `DECISION` | Solo decisión y razones; no calcular ni mostrar reportes, márgenes o agregados reales mediante el permiso simulado.                                       |
| `nexo.printing.templates.update`             | `FULL`     | Puede previsualizar la interfaz y el resultado hipotético con recurso sintético; toda acción queda deshabilitada o interceptada y no produce efectos.     |
| `nexo.printing.jobs.view`                    | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.settings.sites.view`                   | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `nexo.settings.remission_policies.view`      | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |

##### 14.6 NUMERA — 6

| Permiso                                   | Simulación | Condición principal                                                                                                              |
| ----------------------------------------- | ---------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `numera.access`                           | `FULL`     | Puede previsualizar visibilidad de la aplicación y navegación, sin iniciar una sesión distinta ni conceder capacidades internas. |
| `numera.finance.cost_centers.view`        | `DECISION` | Solo decisión y razones; la simulación no revela información financiera, costos, gastos, rentabilidad ni reportes reales.        |
| `numera.finance.expenses.view`            | `DECISION` | Solo decisión y razones; la simulación no revela información financiera, costos, gastos, rentabilidad ni reportes reales.        |
| `numera.analytics.break_even.view`        | `DECISION` | Solo decisión y razones; la simulación no revela información financiera, costos, gastos, rentabilidad ni reportes reales.        |
| `numera.analytics.profitability.view`     | `DECISION` | Solo decisión y razones; la simulación no revela información financiera, costos, gastos, rentabilidad ni reportes reales.        |
| `numera.analytics.financial_reports.view` | `DECISION` | Solo decisión y razones; la simulación no revela información financiera, costos, gastos, rentabilidad ni reportes reales.        |

##### 14.7 ORIGO — 5

| Permiso                                  | Simulación | Condición principal                                                                                                                                       |
| ---------------------------------------- | ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `origo.access`                           | `FULL`     | Puede previsualizar visibilidad de la aplicación y navegación, sin iniciar una sesión distinta ni conceder capacidades internas.                          |
| `origo.procurement.purchase_orders.view` | `DECISION` | Solo decisión y razones; no mostrar documentos de compra, recepciones ni información comercial real del proveedor.                                        |
| `origo.procurement.receipts.view`        | `DECISION` | Solo decisión y razones; no mostrar documentos de compra, recepciones ni información comercial real del proveedor.                                        |
| `origo.procurement.suppliers.view`       | `DECISION` | Solo decisión y razones; no mostrar documentos de compra, recepciones ni información comercial real del proveedor.                                        |
| `origo.catalog.product_reviews.view`     | `FULL`     | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |

##### 14.8 Vento Pass — 1

| Permiso       | Simulación    | Condición principal                                                                                                      |
| ------------- | ------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `pass.access` | `NOT_ALLOWED` | PASS pertenece al dominio cliente; la simulación laboral no puede fabricar identidad, sesión ni autorización de cliente. |

##### 14.9 PULSO — 2

| Permiso                              | Simulación | Condición principal                                                                                                                                   |
| ------------------------------------ | ---------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| `pulso.access`                       | `FULL`     | Puede previsualizar visibilidad de la aplicación y navegación, sin iniciar una sesión distinta ni conceder capacidades internas.                      |
| `pulso.delivery.deliveries.override` | `FULL`     | Puede previsualizar la interfaz y el resultado hipotético con recurso sintético; toda acción queda deshabilitada o interceptada y no produce efectos. |

##### 14.10 VISO — 17

| Permiso                                       | Simulación    | Condición principal                                                                                                                                       |
| --------------------------------------------- | ------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `viso.access`                                 | `FULL`        | Puede previsualizar visibilidad de la aplicación y navegación, sin iniciar una sesión distinta ni conceder capacidades internas.                          |
| `viso.platform.app_updates.view`              | `FULL`        | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `viso.organization.businesses.view`           | `FULL`        | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `viso.workforce.employees.view`               | `DECISION`    | Solo decisión y razones; no revelar expedientes, datos personales ni atributos laborales de empleados reales.                                             |
| `viso.workforce.staff_calendar.view`          | `FULL`        | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `viso.workforce.schedules.view`               | `FULL`        | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `viso.workforce.vacancies.view`               | `FULL`        | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `viso.authorization.context_simulations.view` | `NOT_ALLOWED` | Es el permiso real que habilita la herramienta de simulación. No puede concederse ni evaluarse como autorización ejecutable desde la propia simulación.   |
| `viso.authorization.audit_logs.view`          | `DECISION`    | Solo decisión y razones; la bitácora real no puede exponerse mediante una autorización hipotética.                                                        |
| `viso.catalog.commercial_categories.view`     | `FULL`        | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `viso.content.content_blocks.view`            | `FULL`        | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `viso.content.menu.view`                      | `FULL`        | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `viso.content.website_content.view`           | `FULL`        | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `viso.finance.accounting.view`                | `DECISION`    | Solo decisión y razones; no revelar información contable real mediante permisos simulados.                                                                |
| `viso.delivery.rates.view`                    | `FULL`        | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `viso.loyalty.products.view`                  | `FULL`        | Puede previsualizar navegación, componentes y decisión con datos sintéticos, vacíos o enmascarados; los datos reales dependen del permiso real del actor. |
| `viso.loyalty.customers.view`                 | `DECISION`    | Solo decisión y razones; no revelar datos de clientes ni saldos reales mediante simulación laboral.                                                       |

#### 15. Resumen cuantitativo

##### 15.1 Clasificación general

| Clasificación   | Permisos |
| --------------- | -------: |
| `FULL_PREVIEW`  |       78 |
| `DECISION_ONLY` |       31 |
| `NOT_ALLOWED`   |        3 |
| **Total**       |  **112** |

##### 15.2 Por aplicación

| Aplicación | `FULL` | `DECISION` | `NOT_ALLOWED` |   Total |
| ---------- | -----: | ---------: | ------------: | ------: |
| SHELL      |      1 |          0 |             0 |       1 |
| ANIMA      |      4 |          6 |             0 |      10 |
| AURA       |      0 |          0 |             1 |       1 |
| FOGO       |      5 |          1 |             0 |       6 |
| NEXO       |     51 |         12 |             0 |      63 |
| NUMERA     |      1 |          5 |             0 |       6 |
| ORIGO      |      2 |          3 |             0 |       5 |
| Vento Pass |      0 |          0 |             1 |       1 |
| PULSO      |      2 |          0 |             0 |       2 |
| VISO       |     12 |          4 |             1 |      17 |
| **Total**  | **78** |     **31** |         **3** | **112** |

##### 15.3 Relación con dispositivo compartido

| Dispositivo compartido   | `FULL` | `DECISION` | `NOT_ALLOWED` |   Total |
| ------------------------ | -----: | ---------: | ------------: | ------: |
| `STANDARD_ACTOR_SESSION` |     49 |          3 |             0 |      52 |
| `STRONG_REAUTH_REQUIRED` |     21 |         18 |             1 |      40 |
| `NOT_ALLOWED`            |      8 |         10 |             2 |      20 |
| **Total**                | **78** |     **31** |         **3** | **112** |

La compatibilidad con dispositivo y la compatibilidad con simulación son independientes. Un permiso prohibido en dispositivo compartido puede admitir una vista previa segura desde una sesión personal, y un permiso compatible con dispositivo puede quedar limitado a decisión durante simulación.

#### 16. Ejemplos normativos

##### 16.1 Retiro de inventario

| Elemento            | Valor                                                   |
| ------------------- | ------------------------------------------------------- |
| Permiso             | `nexo.inventory.withdrawals.register`                   |
| Clasificación       | `FULL_PREVIEW`                                          |
| Escenario           | Bodeguero, Bodega, turno y check-in activos             |
| Presentación        | Formulario con producto y ubicación sintéticos          |
| Acción de confirmar | Interceptada; solo muestra `would_allow` o `would_deny` |
| Efecto real         | Ninguno                                                 |

##### 16.2 Información financiera

| Elemento         | Valor                                 |
| ---------------- | ------------------------------------- |
| Permiso          | `numera.analytics.profitability.view` |
| Clasificación    | `DECISION_ONLY`                       |
| Resultado        | Decisión y razones                    |
| Información real | No visible por autoridad simulada     |
| Vista de datos   | No se renderiza                       |

##### 16.3 Simulación del permiso de simulación

| Elemento          | Valor                                                             |
| ----------------- | ----------------------------------------------------------------- |
| Permiso           | `viso.authorization.context_simulations.view`                     |
| Clasificación     | `NOT_ALLOWED`                                                     |
| Motivo            | Evitar autorización circular o autoelevación                      |
| Evaluación válida | Únicamente autorización real del actor antes de iniciar la sesión |

##### 16.4 Permiso sensible mutador

| Elemento      | Valor                                                                 |
| ------------- | --------------------------------------------------------------------- |
| Permiso       | `nexo.inventory.adjustments.register`                                 |
| Clasificación | `FULL_PREVIEW`                                                        |
| Vista         | Formulario sintético y controles visibles                             |
| Confirmación  | No ejecuta ajuste; produce únicamente resultado hipotético            |
| Auditoría     | Registra la evaluación del actor real, no un movimiento de inventario |

##### 16.5 Vento Pass

| Elemento      | Valor                                                                           |
| ------------- | ------------------------------------------------------------------------------- |
| Permiso       | `pass.access`                                                                   |
| Clasificación | `NOT_ALLOWED`                                                                   |
| Motivo        | La identidad cliente y la autorización laboral pertenecen a dominios diferentes |

#### 17. Razones conceptuales de bloqueo

| Razón                                    | Significado                                                          |
| ---------------------------------------- | -------------------------------------------------------------------- |
| `simulation_permission_not_allowed`      | El permiso está clasificado como `NOT_ALLOWED`.                      |
| `simulation_real_actor_required`         | No existe actor real personalmente autenticado.                      |
| `simulation_control_permission_required` | El actor no posee realmente el permiso para iniciar simulación.      |
| `simulation_shared_device_not_allowed`   | Se intentó iniciar la herramienta desde un dispositivo compartido.   |
| `simulation_scope_exceeded`              | El escenario supera el alcance real del actor.                       |
| `simulation_isolated_site_denied`        | La sede aislada no pertenece al alcance real.                        |
| `simulation_context_invalid`             | La combinación rol, sede, área, turno o check-in es incoherente.     |
| `simulation_decision_only`               | El permiso admite decisión, pero no contenido ni interfaz protegida. |
| `simulation_real_data_not_authorized`    | El actor real no puede consultar el dato solicitado.                 |
| `simulation_mutation_blocked`            | Una acción intentó producir un efecto empresarial real.              |
| `simulation_export_blocked`              | Se intentó exportar o descargar por autoridad simulada.              |
| `simulation_session_expired`             | La sesión dejó de estar vigente.                                     |
| `simulation_nested_session_denied`       | Se intentó iniciar una simulación desde otra simulación.             |
| `simulation_result_indeterminate`        | Falta información contractual o existe ambigüedad.                   |

#### 18. Invariantes

- Todo permiso canónico declara `simulation_requirement`.
- Solo existen `FULL_PREVIEW`, `DECISION_ONLY` y `NOT_ALLOWED`.
- La simulación nunca concede autorización real.
- `would_allow` nunca equivale a `allow`.
- El actor real conserva identidad, permisos, alcance y auditoría.
- El sujeto simulado nunca reemplaza `auth.uid()`.
- La simulación no es impersonación.
- La simulación no crea JWT, login, turno, check-in, rol, sede, área ni sesión de dispositivo.
- La simulación no modifica RLS ni el contexto real.
- Los datos reales se autorizan mediante el actor real.
- El modo predeterminado de datos es sintético.
- `DECISION_ONLY` no muestra contenido protegido.
- Toda mutación simulada queda interceptada antes del efecto real.
- No se exporta ni descarga por autoridad simulada.
- No se envían notificaciones como el sujeto simulado.
- La simulación requiere sesión personal y permiso real explícito.
- No existe bypass por propietario, gerente, supervisor ni otro nombre de rol.
- Un dispositivo compartido no puede iniciar simulación.
- El permiso de simulación no puede simularse a sí mismo.
- PASS no se convierte en identidad laboral simulable.
- AURA continúa diferida.
- Turno, check-in, área y dispositivo pueden representarse hipotéticamente, pero no degradarse.
- Las denegaciones explícitas conservan precedencia.
- Los aliases heredan la clasificación de la clave canónica.
- Los permisos legacy y técnicos retirados no reciben clasificación independiente.
- Un cambio de compatibilidad es un cambio contractual versionado.

#### 19. Criterios de aprobación

AUTH-CAT-015 podrá aprobarse cuando se acepte expresamente que:

- los 112 permisos tienen una decisión explícita;
- 78 permisos admiten previsualización completa;
- 31 permisos admiten únicamente decisión y razones;
- 3 permisos quedan excluidos;
- la simulación produce `would_allow`, `would_deny` o `indeterminate`;
- la simulación no produce autorización ejecutable;
- el actor real controla el acceso a datos reales;
- los permisos sensibles no se vuelven visibles automáticamente;
- los permisos mutadores pueden previsualizar interfaz, pero nunca ejecutar efectos;
- el permiso que inicia simulación solo se evalúa de forma real;
- AURA y PASS quedan fuera por falta de contrato funcional laboral aplicable;
- la herramienta requiere sesión personal y no dispositivo compartido;
- el alcance simulado no supera el alcance real del actor;
- AUTH-CAT-012, AUTH-CAT-013 y AUTH-CAT-014 permanecen intactas;
- la tarea no implementa código ni migraciones.

#### 20. Impacto sobre tareas posteriores

##### AUTH-CAT-016

Deberá formalizar para cada permiso y recurso:

- `resource_type`;
- `resource_id`;
- sujeto y propiedad;
- territorio;
- estado;
- campos reales, sintéticos o enmascarados disponibles;
- condiciones para resolver `indeterminate`;
- representación segura del recurso durante simulación.

##### BLOQUE D

Las matrices deberán impedir que una asignación simulada se persista como concesión real. La matriz de simulación deberá consumir el catálogo canónico, no duplicarlo.

##### BLOQUE E

`AccessContext` deberá exponer separadamente:

- actor real;
- sujeto simulado;
- sesión de simulación;
- alcance real;
- contexto hipotético;
- modo de datos;
- permiso solicitado.

`AuthorizationDecision` deberá registrar:

- `simulation_requirement`;
- `simulation_result`;
- `real_actor_id`;
- `simulated_subject_id`;
- `data_mode`;
- razones y datos faltantes;
- indicación inequívoca de que el resultado no es ejecutable.

#### 21. Estado final de la propuesta

| Tarea        | Estado      |
| ------------ | ----------- |
| AUTH-CAT-014 | APROBADA    |
| AUTH-CAT-015 | APROBADA    |
| AUTH-CAT-016 | NO INICIADA |

No se avanza a AUTH-CAT-016 hasta recibir aprobación explícita.


