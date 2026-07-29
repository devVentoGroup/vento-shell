### SECCIÓN — ALCANCE DE PERMISOS

<!-- PLAN-SECTION-META:START -->
Esta sección reúne contenido canónico con una responsabilidad documental única dentro del plan. Debe conservarse cohesionada y actualizarse junto con sus referencias y validaciones dependientes.

**Cobertura canónica:** `AUTH-CAT-011` — 1 tarea.
<!-- PLAN-SECTION-META:END -->

### ✅ AUTH-CAT-011 — Definir alcance permitido de cada permiso

#### 1. Identificación de la tarea

Bloque: BLOQUE C — Catálogo canónico de aplicaciones y permisos.
Tarea: AUTH-CAT-011 — Definir alcance permitido de cada permiso.
Versión documental de origen: 2026-07-18.
Revisión documental de origen: 18.
Estado: APROBADA
Naturaleza: definición documental.
Implementación: no incluida.
Tarea anterior vigente: AUTH-CAT-010 — Clasificar permisos sensibles.
Tarea posterior reservada: AUTH-CAT-012 — Definir prerrequisitos de turno y check-in de cada permiso.

AUTH-CAT-011 fue aprobada explícitamente el 18 de julio de 2026.

#### 2. Objetivo

Definir, para cada uno de los 112 permisos canónicos activos, el conjunto de alcances que su contrato puede admitir y el alcance máximo que puede recibir sin transformar el permiso en una capacidad distinta.

La tarea determina exclusivamente:

los territorios, recursos y conjuntos de recursos sobre los que puede operar cada permiso;
si el permiso admite alcance global organizacional;
si admite sedes asignadas;
si admite una sede específica;
si admite un tipo de sede;
si admite un área específica;
si admite un tipo de área;
si puede limitarse a recursos propios o creados por el actor;
si puede actuar sobre recursos de otros trabajadores;
si admite lectura o actuación transversal entre sedes;
qué alcances quedan expresamente prohibidos;
cómo se evalúa cuando el recurso no tiene territorio aplicable.

Esta tarea no determina:

qué rol recibe el permiso;
qué trabajador recibe una excepción;
si exige turno;
si exige check-in;
si exige área activa;
qué dispositivos lo admiten;
si admite simulación;
el contrato técnico final para resolver la sede o área del recurso;
las matrices base u operativas.

#### 3. Alcance de la tarea

Esta propuesta cubre exactamente:

10 aplicaciones canónicas;
112 permisos canónicos activos;
112 decisiones de alcance;
0 permisos legacy;
0 permisos técnicos retirados;
0 aliases tratados como permisos independientes;
0 cambios en Supabase;
0 migraciones;
0 cambios de repositorio.

#### 4. Base normativa y jerarquía

La propuesta aplica, sin reinterpretarlas, las decisiones aprobadas en:

ADR-AUTH-001.
AUTH-MOD-013 — Permisos globales.
AUTH-MOD-014 — Permisos por sede.
AUTH-MOD-015 — Permisos por tipo de sede.
AUTH-MOD-016 — Permisos por área.
AUTH-MOD-017 — Permisos por tipo de área.
AUTH-MOD-018 — Precedencia entre carriles base y operativo.
AUTH-MOD-019 — Denegación explícita.
AUTH-CAT-001 a AUTH-CAT-005 — Catálogo, convención, normalización, deduplicación y descripciones.
AUTH-CAT-006 — authorization_requirement.
AUTH-CAT-007 — is_operational.
AUTH-CAT-008 — is_read_only.
AUTH-CAT-009 — is_configuration.
AUTH-CAT-010 — is_sensitive.

Ante cualquier diferencia futura prevalecerá la decisión aprobada más reciente conforme a la jerarquía documental canónica.

#### 5. Definiciones canónicas

5.1 Alcance del permiso

El alcance responde:

¿Sobre qué territorio, recurso o conjunto de recursos puede aplicarse la capacidad exacta?

No responde:

qué carril autoriza;
qué rol concede;
si existe contexto operativo válido;
si la acción es sensible;
si el recurso pertenece al actor;
si existe bypass.
5.2 Alcance máximo permitido

Es el límite superior que el contrato del permiso puede admitir.

No significa que:

todos los roles deban recibirlo;
el permiso deba sembrarse con ese alcance;
el actor tenga ese alcance en una decisión concreta;
un alcance inferior pueda elevarse automáticamente.
5.3 Alcance global organizacional

G significa la capacidad exacta sobre todo el ámbito organizacional ordinario de Vento.

No significa:

wildcard;
acceso universal;
acceso a todas las aplicaciones;
acceso a APP-REVIEW;
acceso a datos de otra organización;
acceso a secretos técnicos;
bypass de recurso;
bypass de modalidad;
bypass de sensibilidad;
bypass de denegación.

Cuando una fila indica G(B), el alcance global solo puede existir por el carril base.

El carril operativo no hereda ese alcance.

5.4 Recurso organizacional no territorial

ORG identifica un recurso cuya frontera primaria es la organización, unidad de negocio, catálogo, canal o dominio, no una sede o área.

ORG no es sinónimo de G.

Cuando el recurso es no territorial:

no se inventará una sede;
no se usará la sede primaria como fallback;
no se usará la sede seleccionada como fallback;
no se usará un área arbitraria;
se evaluará el recurso exacto y su frontera organizacional.
5.5 Alcance propio

OWN limita la capacidad a:

el recurso cuyo sujeto es el actor;
el recurso creado por el actor, cuando el contrato lo reconozca;
la sesión o trabajo atribuido al actor.

OWN no reemplaza:

el permiso;
la sede;
el área;
el estado del recurso;
la modalidad;
la sensibilidad.
5.6 Recursos de terceros

Un permiso puede actuar sobre recursos de otros trabajadores únicamente cuando la fila lo declara y el tercero o recurso se encuentra dentro del alcance concedido.

La mera pertenencia al mismo rol, sede o aplicación no concede acceso a terceros.

5.7 Alcance transversal

Una operación es transversal cuando consulta o afecta más de una sede o área.

Reglas:

una lectura transversal devuelve la unión de territorios individualmente autorizados;
una mutación transversal exige autorización sobre todos los extremos que el contrato declare obligatorios;
participar en un lado de una relación no concede autoridad general sobre el otro lado;
las excepciones propias de remisiones se definen expresamente en su fila.

#### 6. Tipos de alcance permitidos

| Código | Significado                                                                                                |
| ------ | ---------------------------------------------------------------------------------------------------------- |
| NT     | Sin dimensión territorial variable.                                                                        |
| ORG    | Recurso delimitado por organización, unidad de negocio, catálogo, canal o dominio.                         |
| G      | Alcance global organizacional ordinario.                                                                   |
| AS     | Todas las sedes activamente asignadas al actor.                                                            |
| SS     | Una sede específica.                                                                                       |
| AST    | Sedes asignadas que coinciden con un tipo de sede.                                                         |
| TST    | Todas las sedes ordinarias de un tipo exacto; requiere concesión transversal explícita.                    |
| AA     | Áreas activamente asignadas al actor.                                                                      |
| SA     | Un área específica dentro de una sede autorizada.                                                          |
| AAT    | Áreas asignadas que coinciden con un tipo de área.                                                         |
| ATW    | Todas las áreas de un tipo exacto dentro de un alcance superior de sedes autorizado.                       |
| CTX    | Territorio operativo efectivo resuelto por el carril operativo. AUTH-CAT-011 no define sus prerrequisitos. |
| OWN    | Recurso propio, creado por el actor o atribuido al actor, según contrato.                                  |

6.1 Reglas obligatorias de los tipos
TST nunca será la modalidad predeterminada. La modalidad predeterminada por tipo de sede es AST.
ATW nunca existe sin un límite superior de sedes.
SA, AA, AAT y ATW no autorizan recursos de nivel sede sin segmentación por área.
AS se resuelve desde employee_sites, no desde employees.site_id.
OWN puede combinarse con territorio, pero no ampliarlo.
CTX describe un límite territorial operativo. No define en esta tarea turno, check-in o área obligatoria.
Un recurso aislado queda fuera de G, TST y ATW salvo autorización aislada específica.
Las sedes y áreas inactivas no forman parte de ningún alcance efectivo.

#### 7. Convenciones de la matriz

7.1 Clasificaciones heredadas

La columna M/O/R/C/S usa:

BO: BASE_ONLY.
OO: OPERATIONAL_ONLY.
BOR: BASE_OR_OPERATIONAL.
BAO: BASE_AND_OPERATIONAL.
O: is_operational.
R: is_read_only.
C: is_configuration.
S: is_sensitive.

Estas clasificaciones se reproducen únicamente para verificar consistencia.

AUTH-CAT-011 no las modifica.

7.2 Valor normativo de cada fila

En cada fila son normativos:

el permiso exacto;
el perfil de alcance y los tipos admitidos;
el recurso o conjunto de recursos;
la regla de propiedad y terceros;
el alcance máximo;
la transversalidad permitida;
las prohibiciones expresas;
el comportamiento sin territorio.

#### 8. Reglas transversales

Denegación por defecto. Un alcance no declarado en la fila queda prohibido.
Sin wildcard. Ningún permiso admite *, prefijos o herencia por módulo.
app.access no concede capacidades internas.
Global no equivale a sin restricción.
Global operativo prohibido. Ningún permiso obtiene alcance operativo global por pertenecer a una aplicación híbrida.
Carriles independientes. En BASE_OR_OPERATIONAL, el carril base y el operativo resuelven su alcance por separado.
Intersección obligatoria. En BASE_AND_OPERATIONAL, el alcance efectivo es la intersección de ambos carriles.
Propiedad no es bypass. Crear un recurso no concede acceso fuera del permiso y estado autorizados.
Terceros explícitos. Actuar sobre recursos de otros solo es válido cuando la fila lo permite.
Recursos multisede. Deben resolver cada extremo y la relación entre ellos.
Lectura agregada. No podrá revelar datos de territorios excluidos mediante totales, inferencias o comparaciones.
Mutación concreta. Una concesión amplia no elimina la obligación de identificar el recurso exacto.
Configuración mínima. Los permisos configurativos mutadores no reciben G genérico salvo una justificación expresa en su fila.
Sensibilidad mínima. Los permisos sensibles con G(B) exigen concesión global explícita. Nunca se derivan del nombre del rol.
Sin fallback territorial. Si el recurso exige territorio y este no puede resolverse, se deniega.
Sin territorio aplicable. Si la fila es NT u ORG, la ausencia de sede o área no bloquea por sí sola ni permite inventarlas.
Aplicación propietaria. El prefijo del permiso delimita la aplicación propietaria. Otra aplicación puede consumir la capacidad, no duplicarla.
APP-REVIEW aislado. Ningún alcance ordinario lo incluye.
PASS separado. El RBAC laboral no autentica ni autoriza al cliente final.
SHELL separado de vento-shell. shell.access pertenece a la aplicación. vento-shell continúa siendo repositorio técnico.
AURA diferida. aura.access no habilita nuevas funciones ni implementación.
Sin prerrequisitos anticipados. Esta tarea no declara requisitos de turno o check-in.

#### 9. Matriz completa de los 112 permisos

9.1 SHELL — 1 permiso

| Permiso                          | M/O/R/C/S           | Alcances admitidos                                         | Recurso, propiedad y terceros                                          | Máximo, transversalidad, prohibiciones y ausencia de territorio                                                                      |
| -------------------------------- | ------------------- | ---------------------------------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| shell.access — Entrar a Vento OS | BO · O · Rí · C · S | NT-APP — NT únicamente. G/AS/SS/AST/TST/AA/SA/AAT/ATW: no. | Superficie de entrada del hub SHELL. Propiedad y terceros: no aplican. | Sin territorio variable. No admite global, sede, tipo de sede, área ni tipo de área. No concede acceso interno a ninguna aplicación. |

9.2 ANIMA — 10 permisos

| Permiso                                                                         | M/O/R/C/S            | Alcances admitidos                                                                                                    | Recurso, propiedad y terceros                                                                                                                                                                      | Máximo, transversalidad, prohibiciones y ausencia de territorio                                                                                                                          |
| ------------------------------------------------------------------------------- | -------------------- | --------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| anima.access — Entrar a ANIMA                                                   | BO · O · Rí · C · S  | NT-APP — NT únicamente. Los alcances territoriales no aplican.                                                        | Superficie de entrada de ANIMA. Propiedad y terceros: no aplican.                                                                                                                                  | Sin territorio variable. No concede acceso a documentos, equipo ni turnos.                                                                                                               |
| anima.workforce.employee_documents.view — Consultar documentos de trabajadores  | BO · O · Rí · C · Sí | WF — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW y variante OWN.                                                         | Documentos laborales vinculados a un trabajador objetivo. Admite el propio trabajador y otros trabajadores dentro del alcance laboral concedido. La propiedad no sustituye el permiso.             | Máximo G(B), explícito y sensible. El cruce de sedes solo incluye trabajadores cubiertos por territorios autorizados. APP-REVIEW y dominios aislados quedan fuera.                       |
| anima.workforce.employee_documents.upload — Cargar documentos de trabajadores   | BO · O · R · C · Sí  | WF — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW y variante OWN.                                                         | Nuevos documentos laborales vinculados a un trabajador. Puede cargar para el propio actor cuando el tipo documental admita autoservicio y para otros trabajadores dentro del alcance administrado. | Máximo G(B) explícito. Prohibido cargar documentos para trabajadores o territorios no autorizados. La carga no concede lectura, eliminación ni administración posterior por implicación. |
| anima.workforce.employee_documents.delete — Eliminar documentos de trabajadores | BO · O · R · C · Sí  | WF — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW. OWN puede actuar como restricción, nunca como autorización suficiente. | Documento laboral exacto de un trabajador. Permite afectar documentos de terceros únicamente dentro del alcance laboral y bajo el contrato de conservación aplicable.                              | Máximo G(B) explícito y sensible. La autoría o propiedad no concede por sí sola eliminación. Prohibida la eliminación transversal sin cobertura sobre el trabajador objetivo.            |
| anima.workforce.employee_photos.upload — Cargar fotografías de trabajadores     | BO · O · R · C · Sí  | WF — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW y variante OWN.                                                         | Fotografía laboral asociada a un trabajador. Puede actuar sobre el propio trabajador o sobre terceros dentro del alcance administrado.                                                             | Máximo G(B) explícito. El permiso no concede lectura general de expedientes ni modificación de otros datos laborales.                                                                    |
| anima.workforce.team_members.view — Consultar integrantes del equipo            | BO · O · Rí · C · Sí | WF — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW.                                                                        | Trabajadores que integran un equipo, sede o área. Permite consultar a otros trabajadores dentro del alcance. El propio actor queda incluido sin ampliar el territorio.                             | Máximo G(B) explícito. La consulta multisede es la unión de territorios autorizados, no toda la organización por defecto.                                                                |
| anima.workforce.staff_invitations.create — Invitar trabajadores                 | BO · O · R · C · Sí  | WF — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW.                                                                        | Invitación laboral dirigida a una persona y a una cobertura organizacional prevista. No es un recurso propio. Permite actuar sobre terceros solo dentro de la cobertura administrable.             | Máximo G(B) explícito. Prohibido invitar hacia sedes, áreas, roles o dominios aislados no autorizados. La invitación no concede automáticamente permisos al invitado.                    |
| anima.attendance.shifts.create — Crear turnos                                   | BO · O · R · C · Sí  | WF — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW.                                                                        | Turno de un trabajador, territorializado por sede y, cuando exista, área. Puede crear turnos propios solo cuando la asignación lo permita y turnos de otros trabajadores dentro del alcance.       | Máximo G(B) explícito. Las operaciones multisede son conjuntos de turnos individualmente autorizados. Prohibido crear un turno cuya sede o área quede fuera.                             |
| anima.attendance.shifts.update — Actualizar turnos                              | BO · O · R · C · Sí  | WF — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW.                                                                        | Turno existente de un trabajador. Ser creador del turno no concede autoridad adicional. Permite actuar sobre terceros dentro del alcance laboral.                                                  | Máximo G(B) explícito. La sede y área reales del turno determinan el territorio. Prohibido trasladar el turno hacia un territorio no autorizado mediante una actualización.              |
| anima.attendance.shifts.cancel — Cancelar turnos                                | BO · O · R · C · Sí  | WF — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW.                                                                        | Turno exacto de un trabajador. Admite turnos propios y de terceros solo dentro del alcance concedido.                                                                                              | Máximo G(B) explícito. La cancelación no concede modificación, creación ni administración de otros turnos.                                                                               |

9.3 AURA — 1 permiso

| Permiso                     | M/O/R/C/S           | Alcances admitidos                                             | Recurso, propiedad y terceros                                    | Máximo, transversalidad, prohibiciones y ausencia de territorio                                                                   |
| --------------------------- | ------------------- | -------------------------------------------------------------- | ---------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| aura.access — Entrar a AURA | BO · O · Rí · C · S | NT-APP — NT únicamente. Los alcances territoriales no aplican. | Superficie de entrada de AURA. Propiedad y terceros: no aplican. | Sin territorio variable. No amplía ni anticipa capacidades de AURA. AURA continúa activa en el catálogo y diferida en el roadmap. |

9.4 FOGO — 6 permisos

| Permiso                                                              | M/O/R/C/S             | Alcances admitidos                                                                                                                | Recurso, propiedad y terceros                                                                                                                                               | Máximo, transversalidad, prohibiciones y ausencia de territorio                                                                                                                                      |
| -------------------------------------------------------------------- | --------------------- | --------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| fogo.access — Entrar a FOGO                                          | BOR · Oí · Rí · C · S | NT-APP — NT únicamente. Los alcances territoriales no aplican al permiso de entrada.                                              | Superficie de entrada de FOGO. Propiedad y terceros: no aplican.                                                                                                            | Sin territorio variable. El carril autorizado no concede lotes, órdenes ni recetas.                                                                                                                  |
| fogo.production.batches.view — Consultar lotes de producción         | BOR · Oí · Rí · C · S | SITE-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW y CTX(O).                                                                    | Lotes vinculados a una sede productiva y, cuando corresponda, área o línea. Permite consultar lotes propios o de otros actores dentro del territorio.                       | Máximo G(B) para consulta administrativa explícita. En el carril operativo, máximo CTX. La lectura multisede es la unión de lotes autorizados.                                                       |
| fogo.production.batches.create — Crear lotes de producción           | OO · Oí · R · C · Sí  | SITE-WRITE — AS, SS, AST, AA, SA, AAT y CTX. G, TST y ATW: no.                                                                    | Nuevo lote en una sede productiva y área o línea concretas. El lote queda atribuido al actor, pero su autoría no amplía el alcance.                                         | Debe resolverse un único destino concreto. Prohibida la creación transversal, organizacional global o sin sede y área aplicables.                                                                    |
| fogo.production.orders.view — Consultar órdenes de producción        | BOR · Oí · Rí · C · S | SITE-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW y CTX(O).                                                                    | Órdenes vinculadas a sede solicitante, sede productiva y áreas relacionadas. Permite consultar órdenes propias y de terceros dentro de una relación empresarial autorizada. | Máximo G(B). Si la orden cruza sedes, la vista debe justificarse por participación en origen, destino o coordinación autorizada.                                                                     |
| fogo.production.recipe_book.view — Consultar recetario de producción | OO · Oí · Rí · C · Sí | RECIPE-APPLICABLE — recurso publicado y filtro de aplicabilidad al CTX. G y alcances territoriales asignables independientes: no. | Recetario publicado y aplicable a la producción que el actor puede ejecutar. No depende de propiedad ni autoría.                                                            | Sin alcance territorial variable independiente. El conjunto se filtra por publicación, producto, proceso y aplicabilidad. Prohibido usarlo para consultar borradores o definiciones administrativas. |
| fogo.production.recipes.view — Consultar definiciones de recetas     | BO · O · Rí · Cí · Sí | ORG-SECRET — ORG exacto y no territorial. G/AS/SS/AST/TST/AA/SA/AAT/ATW: no.                                                      | Definiciones estructurales de recetas de la organización. Permite consultar recetas creadas por otros dentro del catálogo autorizado.                                       | Se limita al catálogo exacto de la organización o unidad de negocio autorizada. No incluye el recetario operativo por implicación ni secretos de otro dominio.                                       |

9.5 NEXO — 63 permisos
9.5.1 Acceso y catálogo

| Permiso                                                               | M/O/R/C/S              | Alcances admitidos                                                                                                           | Recurso, propiedad y terceros                                                                                               | Máximo, transversalidad, prohibiciones y ausencia de territorio                                                                                                               |
| --------------------------------------------------------------------- | ---------------------- | ---------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| nexo.access — Entrar a NEXO                                           | BOR · Oí · Rí · C · S  | NT-APP — NT únicamente.                                                                                                      | Superficie de entrada de NEXO. Propiedad y terceros: no aplican.                                                            | Sin territorio variable. No concede catálogo, inventario, logística ni finanzas.                                                                                              |
| nexo.catalog.products.view — Consultar productos                      | BOR · Oí · Rí · Cí · S | ORG-CONFIG-READ — ORG exacto. Puede filtrarse por aplicabilidad sin transformarse en alcance territorial.                    | Productos del maestro organizacional. No depende de propiedad y permite consultar definiciones creadas por otros.           | Sin G como atajo. El recurso ya está limitado al maestro de la organización. La disponibilidad por sede es un filtro de aplicabilidad, no propiedad territorial del producto. |
| nexo.catalog.products.create — Crear productos                        | BO · O · R · Cí · Sí   | ORG-CONFIG-WRITE — ORG exacto y no territorial. Sin G ni alcance territorial variable.                                       | Nuevo producto del maestro organizacional. El actor crea el recurso, pero la propiedad no concede futuras acciones.         | Limitado al maestro exacto de Vento. Prohibida la creación en dominios aislados, PASS u otros catálogos por implicación.                                                      |
| nexo.catalog.presentations.view — Consultar presentaciones            | BOR · Oí · Rí · Cí · S | ORG-CONFIG-READ — ORG exacto.                                                                                                | Presentaciones del maestro organizacional. No depende de propiedad.                                                         | Sin territorio variable principal. Puede filtrarse por disponibilidad, pero no concede autoridad sobre productos o inventario.                                                |
| nexo.catalog.request_policies.view — Consultar políticas de solicitud | BOR · Oí · Rí · Cí · S | CONFIG-READ — G(B), AS, SS, AST, TST y, cuando la política declare área, AA, SA, AAT, ATW; CTX(O) para políticas aplicables. | Políticas asociadas a productos, sedes, tipos de sede o rutas de suministro. Permite consultar políticas creadas por otros. | Máximo G(B). En operación solo se muestran políticas aplicables al territorio y proceso resueltos. No permite modificarlas.                                                   |
| nexo.catalog.categories.view — Consultar categorías                   | BOR · Oí · Rí · Cí · S | ORG-CONFIG-READ — ORG exacto.                                                                                                | Categorías del maestro organizacional. No depende de propiedad.                                                             | Sin territorio variable principal. La aplicabilidad a una sede no transforma la categoría en recurso propiedad de esa sede.                                                   |
| nexo.catalog.units.view — Consultar unidades y empaques               | BOR · Oí · Rí · Cí · S | ORG-CONFIG-READ — ORG exacto.                                                                                                | Unidades y empaques del maestro organizacional. No depende de propiedad.                                                    | Sin territorio variable. No concede modificación ni autoridad sobre existencias.                                                                                              |

9.5.2 Activos

| Permiso                                                | M/O/R/C/S              | Alcances admitidos                                             | Recurso, propiedad y terceros                                                                                                            | Máximo, transversalidad, prohibiciones y ausencia de territorio                                                          |
| ------------------------------------------------------ | ---------------------- | -------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| nexo.assets.items.view — Consultar activos             | BOR · Oí · Rí · Cí · S | SITE-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW y CTX(O). | Activos vinculados a sede, área o custodio. Admite activos bajo custodia propia y activos de terceros dentro del alcance.                | Máximo G(B). La custodia no reemplaza permiso ni territorio. La consulta transversal es la unión de activos autorizados. |
| nexo.assets.items.create — Crear activos               | BO · O · R · Cí · Sí   | BASE-TERR-WRITE — AS, SS, AST, AA, SA, AAT. G, TST y ATW: no.  | Nuevo activo con sede, área y custodio concretos cuando apliquen. Puede asignarse a otro custodio solo dentro del territorio autorizado. | Debe existir un destino concreto. Prohibida la creación sin clasificación territorial cuando el activo deba tenerla.     |
| nexo.assets.groups.view — Consultar grupos de activos  | BOR · Oí · Rí · Cí · S | ORG-CONFIG-READ — ORG exacto.                                  | Grupos organizacionales para clasificar activos. No depende de propiedad.                                                                | Sin territorio variable principal. Ver grupos no concede acceso a los activos clasificados.                              |
| nexo.assets.counts.view — Consultar conteos de activos | BOR · Oí · Rí · C · Sí | SITE-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW y CTX(O). | Conteos vinculados a sede, área y conjunto contado. Permite consultar conteos de otros actores dentro del alcance.                       | Máximo G(B) explícito y sensible. Prohibida la exposición de resultados o diferencias fuera del conjunto autorizado.     |

9.5.3 Ajustes y entradas

| Permiso                                                               | M/O/R/C/S              | Alcances admitidos                                                                                     | Recurso, propiedad y terceros                                                                                                                       | Máximo, transversalidad, prohibiciones y ausencia de territorio                                                              |
| --------------------------------------------------------------------- | ---------------------- | ------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| nexo.inventory.adjustments.view — Consultar ajustes de inventario     | BOR · Oí · Rí · C · Sí | SITE-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW y CTX(O).                                         | Ajustes territorializados por sede, área, ubicación, producto o lote. Permite consultar registros propios y de terceros dentro del alcance.         | Máximo G(B) sensible. Cruce de sedes solo como unión autorizada. No revela diferencias de territorios excluidos.             |
| nexo.inventory.adjustments.register — Registrar ajustes de inventario | BAO · Oí · R · C · Sí  | INTERSECT — carril base: G/AS/SS/AST/TST/AA/SA/AAT/ATW; carril operativo: CTX; efectivo: intersección. | Ajuste sobre existencias de una sede, área, ubicación y producto concretos. Actúa sobre stock organizacional, no únicamente propio.                 | El alcance efectivo nunca es global. Prohibidos ajustes masivos multisede y ajustes sobre recursos sin territorio resoluble. |
| nexo.inventory.entries.view — Consultar entradas de inventario        | BOR · Oí · Rí · C · S  | SITE-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW y CTX(O).                                         | Entradas territorializadas por sede, área, recepción, ubicación o lote. Permite consultar entradas propias y de terceros dentro del alcance.        | Máximo G(B). La lectura transversal solo reúne entradas de territorios autorizados.                                          |
| nexo.inventory.entries.register — Registrar entradas de inventario    | OO · Oí · R · C · Sí   | SITE-WRITE — AS, SS, AST, AA, SA, AAT, CTX. G, TST, ATW: no.                                           | Entrada física a una sede, área y ubicación de destino concretas. El registro queda atribuido al actor.                                             | Debe existir un destino concreto. Prohibido registrar una entrada en otra sede por selección manual o fallback.              |
| nexo.inventory.entries.override — Registrar entradas excepcionales    | BAO · Oí · R · C · Sí  | INTERSECT — alcance base amplio permitido, CTX operativo e intersección efectiva.                      | Entrada excepcional sobre una recepción e inventario concretos. Puede corregir una entrada de otro actor solo dentro de la intersección autorizada. | Sin alcance global efectivo. Prohibido usar la excepción para sedes, áreas o lotes que no coincidan con ambos carriles.      |

9.5.4 Ubicaciones, LPN, movimientos y stock

| Permiso                                                                            | M/O/R/C/S              | Alcances admitidos                                             | Recurso, propiedad y terceros                                                                                                     | Máximo, transversalidad, prohibiciones y ausencia de territorio                                                                                                |
| ---------------------------------------------------------------------------------- | ---------------------- | -------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| nexo.inventory.locations.view — Consultar ubicaciones de inventario                | BOR · Oí · Rí · Cí · S | SITE-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW y CTX(O). | Ubicaciones vinculadas a una sede y, cuando corresponda, área o zona. No depende de propiedad.                                    | Máximo G(B). Una ubicación no se convierte en área empresarial. La consulta operativa se limita a ubicaciones aplicables al territorio resuelto.               |
| nexo.inventory.location_assignments.assign — Asignar existencias a ubicaciones     | OO · Oí · R · C · S    | SITE-WRITE — AS, SS, AST, AA, SA, AAT, CTX. G/TST/ATW: no.     | Asignación de existencias, LPN o ítems a una ubicación concreta. Puede actuar sobre recursos de otros dentro del territorio.      | Recurso y ubicación deben pertenecer a la misma sede o a una relación de movimiento expresamente válida. No concede traslado entre sedes.                      |
| nexo.inventory.location_catalog.update — Actualizar catálogo de ubicación          | BO · O · R · Cí · Sí   | CONFIG-WRITE — AS, SS, AST, AA, SA, AAT. G/TST/ATW: no.        | Catálogo permitido de una ubicación, zona o posición concreta. Puede modificar configuración creada por otros dentro del alcance. | Prohibidos cambios masivos transversales o sobre ubicaciones de otra sede. La ubicación objetivo debe ser exacta.                                              |
| nexo.inventory.lpns.view — Consultar LPN                                           | BOR · Oí · Rí · C · S  | SITE-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW, CTX(O).  | LPN y contenedores vinculados a sede, área, ubicación y contenido. No hay propiedad automática.                                   | Máximo G(B). Si el LPN cambia de territorio, se utiliza su territorio real vigente o histórico según el recurso consultado.                                    |
| nexo.inventory.movements.view — Consultar movimientos de inventario                | BOR · Oí · Rí · C · S  | SITE-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW, CTX(O).  | Movimientos con origen, destino, producto, ubicación y actor. Permite ver movimientos de terceros dentro del alcance.             | Máximo G(B). Para movimientos entre territorios, la consulta debe estar autorizada por relación con alguno de los lados o por cobertura transversal explícita. |
| nexo.inventory.stock.view — Consultar existencias                                  | BOR · Oí · Rí · C · S  | SITE-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW, CTX(O).  | Existencias por sede, área, ubicación, producto, presentación o lote. No depende de propiedad.                                    | Máximo G(B). La consolidación no puede incluir stock de territorios no autorizados.                                                                            |
| nexo.inventory.production_batches.view — Consultar lotes productivos en inventario | BOR · Oí · Rí · C · S  | SITE-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW, CTX(O).  | Lotes productivos reflejados en inventario y relacionados con sede, área y producto.                                              | Máximo G(B). No concede consulta administrativa de recetas ni creación de lotes.                                                                               |

9.5.5 Traslados y retiros

| Permiso                                                 | M/O/R/C/S             | Alcances admitidos                                                                     | Recurso, propiedad y terceros                                                                                                                          | Máximo, transversalidad, prohibiciones y ausencia de territorio                                                                                 |
| ------------------------------------------------------- | --------------------- | -------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| nexo.inventory.transfers.view — Consultar traslados     | BOR · Oí · Rí · C · S | SITE-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW, CTX(O).                          | Traslados con origen y destino. Permite consultar traslados propios o de terceros por relación con un extremo autorizado.                              | Máximo G(B). Ver un traslado no concede autoridad para crearlo ni modificar sus extremos.                                                       |
| nexo.inventory.transfers.create — Crear traslados       | OO · Oí · R · C · Sí  | MULTI-WRITE — AS, SS, AST, AA, SA, AAT sobre los extremos obligatorios. G/TST/ATW: no. | Traslado con origen y destino explícitos, dentro de una sede o entre sedes. Puede mover stock registrado por otros dentro de los extremos autorizados. | Cruce de sedes sí, pero exige autorización en origen y destino o un contrato transversal específico. No basta pertenecer a uno de los extremos. |
| nexo.inventory.withdrawals.view — Consultar retiros     | BOR · Oí · Rí · C · S | SITE-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW, CTX(O).                          | Retiros vinculados a sede, área, ubicación, producto y actor.                                                                                          | Máximo G(B). La consulta de retiros de otros requiere territorio autorizado.                                                                    |
| nexo.inventory.withdrawals.register — Registrar retiros | OO · Oí · R · C · Sí  | SITE-WRITE — AS, SS, AST, AA, SA, AAT, CTX. G/TST/ATW: no.                             | Retiro desde una sede, área, ubicación y stock concretos. Puede retirar stock ingresado por otros dentro del territorio.                               | No concede autoridad sobre un destino externo ni otra sede. El origen debe ser concreto y autorizado.                                           |

9.5.6 Zonas y operación de bodega

| Permiso                                                                        | M/O/R/C/S              | Alcances admitidos                                            | Recurso, propiedad y terceros                                                                                                               | Máximo, transversalidad, prohibiciones y ausencia de territorio                                      |
| ------------------------------------------------------------------------------ | ---------------------- | ------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| nexo.inventory.zones.view — Consultar zonas de inventario                      | BOR · Oí · Rí · Cí · S | SITE-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW, CTX(O). | Zonas vinculadas a una sede o área. No depende de propiedad.                                                                                | Máximo G(B). Ver una zona no concede modificación ni acceso a todas sus existencias por implicación. |
| nexo.inventory.storage_positions.view — Consultar posiciones de almacenamiento | BOR · Oí · Rí · Cí · S | SITE-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW, CTX(O). | Posiciones vinculadas a zona, sede y área.                                                                                                  | Máximo G(B). Una posición no se interpreta como área empresarial independiente.                      |
| nexo.inventory.warehouse_operations.view — Consultar operaciones de bodega     | BOR · Oí · Rí · C · S  | SITE-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW, CTX(O). | Operaciones de bodega vinculadas a sede, área, ubicación y actor.                                                                           | Máximo G(B). La vista operativa se limita a operaciones relacionadas con el territorio efectivo.     |
| nexo.inventory.stock_validations.perform — Validar existencias                 | OO · Oí · R · C · Sí   | SITE-WRITE — AS, SS, AST, AA, SA, AAT, CTX. G/TST/ATW: no.    | Validación física de stock en una sede, área, ubicación o conjunto concreto. Puede validar registros de otros dentro del conjunto asignado. | Prohibida la validación simultánea de sedes o áreas no individualmente autorizadas.                  |

9.5.7 Conteos

| Permiso                                                               | M/O/R/C/S              | Alcances admitidos                                            | Recurso, propiedad y terceros                                                                                                       | Máximo, transversalidad, prohibiciones y ausencia de territorio                                      |
| --------------------------------------------------------------------- | ---------------------- | ------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| nexo.inventory.stock_counts.view — Consultar conteos de existencias   | BOR · Oí · Rí · C · Sí | SITE-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW, CTX(O). | Conteos vinculados a sede, área, zona, ubicación y conjunto contado. Permite consultar conteos de otros actores dentro del alcance. | Máximo G(B) sensible. No revela resultados, diferencias o responsables de territorios excluidos.     |
| nexo.inventory.stock_counts.perform — Realizar conteos de existencias | OO · Oí · R · C · Sí   | SITE-WRITE — AS, SS, AST, AA, SA, AAT, CTX. G/TST/ATW: no.    | Ejecución de un conteo en un conjunto territorial concreto. Puede contar stock de otros custodios dentro del conjunto.              | Debe resolverse un único conjunto operativo. No permite aplicar ajustes resultantes por implicación. |
| nexo.inventory.initial_counts.view — Consultar conteos iniciales      | BOR · Oí · Rí · C · Sí | SITE-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW, CTX(O). | Conteos iniciales vinculados a sede, área, ubicación y sesión.                                                                      | Máximo G(B) sensible. No concede ejecución ni aplicación de diferencias.                             |

9.5.8 Remisiones

| Permiso                                                   | M/O/R/C/S             | Alcances admitidos                                                                                            | Recurso, propiedad y terceros                                                                                                                                                                | Máximo, transversalidad, prohibiciones y ausencia de territorio                                                                                                                       |
| --------------------------------------------------------- | --------------------- | ------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| nexo.inventory.remissions.view — Consultar remisiones     | BOR · Oí · Rí · C · S | REM-VIEW — base: G/AS/SS/AST/TST/AA/SA/AAT/ATW; operativo: CTX más relación con un lado o función.            | Remisión con sede y área de origen, sede y área de destino y ruta asociada. Admite remisiones propias y de terceros cuando el actor participa en origen, destino, transporte o coordinación. | Máximo G(B). Cruce de sedes sí. Para solo lectura no se exige autoridad mutadora sobre ambos lados cuando exista participación legítima. No expone remisiones ajenas a toda relación. |
| nexo.inventory.remissions.update — Actualizar remisiones  | BOR · Oí · R · C · Sí | REM-UPDATE — base: G/AS/SS/AST/TST/AA/SA/AAT/ATW; operativo: CTX; cada cambio queda en una remisión concreta. | Campos editables de una remisión. OWN aplica a remisiones creadas por el actor en estados editables. Terceros solo con responsabilidad base u operativa expresa.                             | Máximo G(B), pero no global operativo. Cruce de sedes solo sobre la misma remisión. No concede preparar, despachar, recibir o cancelar.                                               |
| nexo.inventory.remissions.request — Solicitar remisiones  | OO · Oí · R · C · S   | REM-REQUEST — AS, SS, AST, AA, SA, AAT, CTX del lado solicitante y ruta válida. G/TST/ATW: no.                | Nueva solicitud desde una sede o área solicitante hacia un origen permitido. El actor crea y posee funcionalmente la solicitud mientras el contrato de estado lo permita.                    | Cruce de sedes sí como solicitud. Basta autoridad sobre el lado solicitante y una ruta válida; no otorga autoridad de inventario sobre el origen.                                     |
| nexo.inventory.remissions.prepare — Preparar remisiones   | OO · Oí · R · C · S   | REM-SIDE — AS, SS, AST, AA, SA, AAT, CTX del lado de origen. G/TST/ATW: no.                                   | Preparación de líneas en el lado de origen. Permite preparar remisiones creadas por otros cuando el actor está autorizado en origen.                                                         | La mutación se limita al origen y sus áreas o ubicaciones. Ver el destino no concede autoridad allí. No incluye despacho ni recepción.                                                |
| nexo.inventory.remissions.dispatch — Despachar remisiones | OO · Oí · R · C · Sí  | REM-ROUTE — AS, SS, AST, AA, SA, AAT, CTX sobre origen y segmento logístico. G/TST/ATW: no.                   | Despacho e inicio del tránsito desde el origen sobre una remisión y ruta concretas. Puede actuar sobre remisiones de terceros asignadas al flujo.                                            | Cruce de sedes sí por la ruta, pero la autoridad mutadora se limita al origen y segmento logístico. No concede recepción en destino.                                                  |
| nexo.inventory.remissions.receive — Recibir remisiones    | OO · Oí · R · C · Sí  | REM-SIDE — AS, SS, AST, AA, SA, AAT, CTX del lado de destino. G/TST/ATW: no.                                  | Recepción en el destino. Permite recibir remisiones creadas o preparadas por otros cuando el actor está autorizado en el destino.                                                            | La mutación se limita al destino y sus áreas o ubicaciones. Ver el origen no concede autoridad allí. No incluye preparación ni despacho.                                              |
| nexo.inventory.remissions.cancel — Cancelar remisiones    | BOR · Oí · R · C · Sí | REM-CANCEL — base: G/AS/SS/AST/TST/AA/SA/AAT/ATW; operativo: CTX del lado responsable.                        | Cancelación de una remisión según actor, estado y lado responsable. OWN puede aplicar a la solicitud propia. Terceros requieren responsabilidad explícita.                                   | Máximo G(B). Cruce de sedes solo sobre la misma remisión. Prohibido cancelar por mera visibilidad o cuando el estado exija autoridad de otro lado.                                    |

9.5.9 Logística

| Permiso                                                                      | M/O/R/C/S              | Alcances admitidos                                                                             | Recurso, propiedad y terceros                                                                                                                                   | Máximo, transversalidad, prohibiciones y ausencia de territorio                                                                                |
| ---------------------------------------------------------------------------- | ---------------------- | ---------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| nexo.logistics.operations_board.view — Consultar tablero logístico           | BOR · Oí · Rí · C · S  | MULTI-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW y CTX(O) por relación.                   | Tablero de operaciones asociado a sedes, áreas, rutas y actores. Permite consultar recursos propios y de terceros dentro de la función autorizada.              | Máximo G(B). La consolidación multisede solo incluye operaciones con relación territorial autorizada.                                          |
| nexo.logistics.operations.view — Consultar operaciones logísticas            | BOR · Oí · Rí · C · S  | MULTI-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW, CTX(O).                                 | Operaciones logísticas vinculadas a sedes, áreas, rutas, vehículos y actores.                                                                                   | Máximo G(B). La participación en una ruta permite la visibilidad definida por el contrato, no autoridad general sobre sus extremos.            |
| nexo.logistics.driver_operations.view — Consultar operaciones de conductores | BOR · Oí · Rí · C · Sí | MULTI-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW, CTX(O) por asignación o relación.       | Operaciones, rutas y actividades vinculadas a conductores. El conductor puede ver las propias; terceros solo dentro de sedes, rutas o asignaciones autorizadas. | Máximo G(B) únicamente con concesión sensible explícita. Prohibida la consulta transversal por nombre de rol o de conductores no relacionados. |
| nexo.logistics.fulfillment.view — Consultar cumplimiento logístico           | BOR · Oí · Rí · C · S  | MULTI-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW, CTX(O).                                 | Cumplimientos y tareas de abastecimiento asociados a rutas y territorios.                                                                                       | Máximo G(B). La consolidación incluye únicamente tareas territorial o funcionalmente relacionadas.                                             |
| nexo.logistics.fulfillment_routes.view — Consultar rutas de cumplimiento     | BOR · Oí · Rí · Cí · S | CONFIG-READ — G(B), AS, SS, AST, TST; áreas cuando estén declaradas; CTX(O) por aplicabilidad. | Rutas que relacionan sedes, áreas o tipos territoriales. No depende de propiedad.                                                                               | Cruce de sedes sí como relación de configuración. Ver la ruta no concede permisos sobre sus extremos ni permite modificarla.                   |
| nexo.logistics.supply_routes.view — Consultar rutas de suministro            | BOR · Oí · Rí · Cí · S | CONFIG-READ — G(B), AS, SS, AST, TST; áreas cuando estén declaradas; CTX(O) por aplicabilidad. | Rutas de suministro entre sedes, áreas, tipos de sede o tipos de área.                                                                                          | Máximo G(B). En operación solo se muestran rutas aplicables. La vista no concede solicitud, preparación, despacho ni recepción.                |

9.5.10 Finanzas internas

| Permiso                                                                              | M/O/R/C/S             | Alcances admitidos                                                                          | Recurso, propiedad y terceros                                                                                                                                           | Máximo, transversalidad, prohibiciones y ausencia de territorio                                                                               |
| ------------------------------------------------------------------------------------ | --------------------- | ------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| nexo.finance.internal_invoices.view — Consultar facturas internas                    | BO · O · Rí · C · Sí  | FIN-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW.                                        | Facturas vinculadas a sedes, centros de costo y operaciones internas. Permite consultar documentos de otros actores dentro del alcance financiero.                      | Máximo G(B) explícito. Cruce de sedes solo cuando todos los lados o el ámbito financiero transversal estén autorizados.                       |
| nexo.finance.internal_invoices.generate — Generar facturas internas                  | BO · O · R · C · Sí   | FIN-ACTION — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW; siempre sobre documento exacto.      | Generación de una factura vinculada a sedes y centros de costo concretos. Puede actuar sobre operaciones registradas por otros dentro de la responsabilidad financiera. | Máximo G(B) explícito. Prohibida la generación fuera del ámbito financiero concedido o sin resolver las partes del documento.                 |
| nexo.finance.internal_invoices.issue — Emitir facturas internas                      | BO · O · R · C · Sí   | FIN-ACTION — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW.                                      | Emisión de una factura interna exacta. No se limita a documentos propios.                                                                                               | Máximo G(B) explícito. La emisión no concede generación, cancelación ni modificación de otras facturas.                                       |
| nexo.finance.internal_invoices.cancel — Cancelar facturas internas                   | BO · O · R · C · Sí   | FIN-ACTION — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW.                                      | Cancelación de una factura exacta dentro de la responsabilidad financiera autorizada.                                                                                   | Máximo G(B) explícito. Prohibida la cancelación por propiedad, autoría o mera visibilidad.                                                    |
| nexo.finance.internal_invoice_amounts.view — Consultar importes de facturas internas | BO · O · Rí · C · Sí  | FIN-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW.                                        | Importes y componentes económicos de facturas internas.                                                                                                                 | Máximo G(B) explícito. La vista de una factura sin este permiso no implica visibilidad de sus importes.                                       |
| nexo.finance.internal_prices.view — Consultar precios internos                       | BO · O · Rí · Cí · Sí | CONFIG-READ — G(B), AS, SS, AST, TST y recursos ORG cuando el precio no tenga sede.         | Precios internos por producto, unidad, negocio, sede o vigencia.                                                                                                        | Máximo G(B) explícito. Para precios organizacionales sin sede se autoriza el conjunto exacto, no un fallback global. No concede modificación. |
| nexo.finance.internal_variances.view — Consultar variaciones internas                | BO · O · Rí · C · Sí  | FIN-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW.                                        | Variaciones vinculadas a documentos, operaciones, sedes y centros de costo.                                                                                             | Máximo G(B) explícito. No concede aprobación ni resolución.                                                                                   |
| nexo.finance.internal_variances.approve — Aprobar variaciones internas               | BAO · Oí · R · C · Sí | INTERSECT — alcance base permitido, CTX operativo y recurso exacto; efectivo: intersección. | Aprobación de una variación ligada a una operación y territorios concretos. Puede actuar sobre variaciones generadas por otros.                                         | No existe aprobación global operativa. Cruce de sedes solo si cada lado afectado queda dentro de la intersección.                             |
| nexo.finance.internal_variances.resolve — Resolver variaciones internas              | BAO · Oí · R · C · Sí | INTERSECT — alcance base permitido, CTX operativo y recurso exacto; efectivo: intersección. | Resolución de una variación ligada a una operación y territorios concretos.                                                                                             | No existe resolución global operativa. Prohibido resolver recursos fuera del alcance de cualquiera de los dos carriles.                       |
| nexo.finance.cost_centers.view — Consultar centros de costo                          | BO · O · Rí · Cí · Sí | CONFIG-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW.                                     | Centros de costo organizacionales, por sede o por área.                                                                                                                 | Máximo G(B) explícito. Un centro sin sede se autoriza por recurso exacto o ámbito organizacional explícito.                                   |

9.5.11 Analítica

| Permiso                                                            | M/O/R/C/S            | Alcances admitidos                                    | Recurso, propiedad y terceros                                                                                           | Máximo, transversalidad, prohibiciones y ausencia de territorio                                                         |
| ------------------------------------------------------------------ | -------------------- | ----------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| nexo.analytics.internal_reports.view — Consultar reportes internos | BO · O · Rí · C · Sí | ANALYTICS — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW. | Reportes agregados por organización, sede, área, ruta, producto o centro de costo. Incluyen datos producidos por otros. | Máximo G(B) explícito. La agregación no puede mostrar ni permitir inferir territorios excluidos.                        |
| nexo.analytics.margin_reports.view — Consultar reportes de margen  | BO · O · Rí · C · Sí | ANALYTICS — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW. | Márgenes por organización, sede, área, producto, ruta o centro de costo.                                                | Máximo G(B) explícito. No concede exportación, modificación de precios ni acceso a datos fuera del conjunto autorizado. |

9.5.12 Impresión y configuración

| Permiso                                                                       | M/O/R/C/S             | Alcances admitidos                                                                                  | Recurso, propiedad y terceros                                                                                                                                  | Máximo, transversalidad, prohibiciones y ausencia de territorio                                                                                |
| ----------------------------------------------------------------------------- | --------------------- | --------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| nexo.printing.templates.update — Actualizar plantillas de impresión           | BO · O · R · Cí · Sí  | CONFIG-TEMPLATE-WRITE — plantilla ORG exacta o AS, SS, AST, AA, SA, AAT. G genérico, TST y ATW: no. | Plantilla exacta con ámbito organizacional, de aplicación, sede, área o dispositivo. Puede modificar plantillas creadas por otros dentro del ámbito.           | Una plantilla organizacional exige concesión explícita sobre ese recurso exacto. Prohibidos cambios masivos por prefijo o aplicación completa. |
| nexo.printing.jobs.view — Consultar trabajos de impresión                     | BOR · Oí · Rí · C · S | PRINT-JOB — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW, CTX(O) y OWN.                                 | Trabajo vinculado a actor, sede, área, dispositivo y recurso de origen. OWN para trabajos propios; terceros para soporte o supervisión territorial autorizada. | Máximo G(B) para soporte central explícito. No permite reimprimir, cancelar ni modificar por implicación.                                      |
| nexo.settings.sites.view — Consultar configuración de sedes                   | BO · O · Rí · Cí · S  | CONFIG-READ — G(B), AS, SS, AST, TST. Alcances de área: no.                                         | Definiciones de sedes empresariales autorizables.                                                                                                              | Máximo G(B). Excluye puntos técnicos, APP-REVIEW y sedes aisladas salvo autorización específica.                                               |
| nexo.settings.remission_policies.view — Consultar configuración de remisiones | BO · O · Rí · Cí · S  | CONFIG-READ — G(B), AS, SS, AST, TST y áreas cuando la política las declare.                        | Políticas de remisión por organización, sede, tipo de sede, área o ruta.                                                                                       | Máximo G(B). No permite modificarlas ni ejecutar acciones de remisión.                                                                         |

9.6 NUMERA — 6 permisos

| Permiso                                                                  | M/O/R/C/S             | Alcances admitidos                                                  | Recurso, propiedad y terceros                                                                                               | Máximo, transversalidad, prohibiciones y ausencia de territorio                                            |
| ------------------------------------------------------------------------ | --------------------- | ------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| numera.access — Entrar a NUMERA                                          | BO · O · Rí · C · S   | NT-APP — NT únicamente.                                             | Superficie de entrada de NUMERA. Propiedad y terceros: no aplican.                                                          | Sin territorio variable. No concede datos financieros ni analíticos.                                       |
| numera.finance.cost_centers.view — Consultar centros de costo            | BO · O · Rí · Cí · Sí | CONFIG-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW.             | Centros de costo organizacionales, de sede o de área.                                                                       | Máximo G(B) explícito. Recursos sin sede se autorizan por centro exacto o ámbito organizacional explícito. |
| numera.finance.expenses.view — Consultar gastos                          | BO · O · Rí · C · Sí  | FIN-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW y variante OWN. | Gastos vinculados a centro de costo, sede, área, documento y actor. Admite gastos propios y de terceros dentro del alcance. | Máximo G(B) explícito. Ser creador del gasto no concede visibilidad fuera del territorio.                  |
| numera.analytics.break_even.view — Consultar punto de equilibrio         | BO · O · Rí · C · Sí  | ANALYTICS — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW.               | Análisis por organización, sede, área, negocio o centro de costo.                                                           | Máximo G(B) explícito. Los resultados no pueden incluir ni revelar territorios excluidos.                  |
| numera.analytics.profitability.view — Consultar rentabilidad             | BO · O · Rí · C · Sí  | ANALYTICS — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW.               | Rentabilidad por organización, sede, área, negocio, producto o centro de costo.                                             | Máximo G(B) explícito. La agregación transversal es la unión de territorios autorizados.                   |
| numera.analytics.financial_reports.view — Consultar reportes financieros | BO · O · Rí · C · Sí  | ANALYTICS — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW.               | Reportes financieros organizacionales o territorializados.                                                                  | Máximo G(B) explícito. No concede exportación, aprobación ni modificación por implicación.                 |

9.7 ORIGO — 5 permisos

| Permiso                                                                | M/O/R/C/S               | Alcances admitidos                                                                                                                          | Recurso, propiedad y terceros                                                                                                                                                               | Máximo, transversalidad, prohibiciones y ausencia de territorio                                                                                                                               |
| ---------------------------------------------------------------------- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| origo.access — Entrar a ORIGO                                          | BOR · Oí · Rí · C · S   | NT-APP — NT únicamente.                                                                                                                     | Superficie de entrada de ORIGO. Propiedad y terceros: no aplican.                                                                                                                           | Sin territorio variable. No concede órdenes, recepciones, proveedores ni revisiones.                                                                                                          |
| origo.procurement.purchase_orders.view — Consultar órdenes de compra   | BOR · Oí · Rí · C · Sí  | PROC-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW, CTX(O).                                                                               | Órdenes vinculadas a negocio, sede destino, áreas receptoras, proveedor y comprador. Admite órdenes propias y de otros compradores dentro del alcance.                                      | Máximo G(B). Una orden multidestino exige visibilidad autorizada sobre cada destino mostrado.                                                                                                 |
| origo.procurement.receipts.view — Consultar recepciones                | BOR · Oí · Rí · C · Sí  | PROC-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW, CTX(O).                                                                               | Recepciones vinculadas a orden, sede, área receptora, productos y actor receptor. Admite propias y de terceros dentro del alcance.                                                          | Máximo G(B). No concede registrar, revertir ni aprobar recepciones.                                                                                                                           |
| origo.procurement.suppliers.view — Consultar proveedores               | BOR · Oí · Rí · Cí · Sí | SUPPLIER — ORG o negocio; G(B) explícito; operativo por relación con orden, recepción y CTX. El territorio funciona como filtro relacional. | Proveedores y su relación con órdenes, productos, negocios y sedes. La vista base permite terceros dentro del ámbito comercial. La operativa solo proveedores vinculados al recurso activo. | Máximo organizacional explícito en el carril base. El carril operativo no obtiene el directorio completo y solo recibe los campos necesarios. Un proveedor no es propiedad de employee_sites. |
| origo.catalog.product_reviews.view — Consultar revisiones de productos | BO · O · Rí · C · S     | ORG-QUEUE — ORG exacto, no territorial. Los filtros por negocio o sede no crean autoridad territorial.                                      | Cola organizacional de revisión del maestro de productos. Permite ver revisiones creadas por otros dentro de la cola autorizada.                                                            | Sin G como atajo. No concede autoridad sobre inventario, proveedores o creación de productos.                                                                                                 |

9.8 VENTO PASS — 1 permiso

| Permiso                           | M/O/R/C/S           | Alcances admitidos                                                  | Recurso, propiedad y terceros                                                              | Máximo, transversalidad, prohibiciones y ausencia de territorio                                                                                                                  |
| --------------------------------- | ------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| pass.access — Entrar a Vento Pass | BO · O · Rí · C · S | NT-CLIENT-ADMIN — superficie laboral-administrativa no territorial. | Entrada laboral o administrativa a Vento Pass. Propiedad y terceros no aplican al permiso. | No autentica clientes, no concede sesión de cliente, puntos, recompensas, canjes ni lectura de datos de clientes. No depende del RBAC laboral para el acceso normal del cliente. |

9.9 PULSO — 2 permisos

| Permiso                                                                  | M/O/R/C/S             | Alcances admitidos                                                                            | Recurso, propiedad y terceros                                                                                                                                                                               | Máximo, transversalidad, prohibiciones y ausencia de territorio                                                                |
| ------------------------------------------------------------------------ | --------------------- | --------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| pulso.access — Entrar a PULSO                                            | OO · Oí · Rí · C · S  | NT-APP — NT únicamente. G: no.                                                                | Superficie de entrada de PULSO. Propiedad y terceros: no aplican.                                                                                                                                           | Sin alcance territorial variable en la concesión. La entrada no concede ventas, caja, pagos ni datos de otra sede.             |
| pulso.delivery.deliveries.override — Confirmar entregas excepcionalmente | BAO · Oí · R · C · Sí | INTERSECT — alcance base autorizado más CTX; efectivo: intersección sobre una entrega exacta. | Entrega vinculada a orden, sede comercial, área operativa y actor responsable. Permite intervenir sobre la entrega de otro actor únicamente cuando está asignada o dentro de la responsabilidad autorizada. | Sin alcance global efectivo. No admite TST, ATW ni lotes multisede. La ruta de entrega no concede autoridad sobre otras sedes. |

9.10 VISO — 17 permisos

| Permiso                                                                          | M/O/R/C/S            | Alcances admitidos                                                                                                                                            | Recurso, propiedad y terceros                                                                                                                | Máximo, transversalidad, prohibiciones y ausencia de territorio                                                                                                                                         |
| -------------------------------------------------------------------------------- | -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| viso.access — Entrar a VISO                                                      | BO · O · Rí · C · S  | NT-APP — NT únicamente.                                                                                                                                       | Superficie de entrada de VISO. Propiedad y terceros: no aplican.                                                                             | Sin territorio variable. No concede capacidades administrativas internas.                                                                                                                               |
| viso.platform.app_updates.view — Consultar actualizaciones de aplicaciones       | BO · O · Rí · C · S  | ORG-TECH — recurso técnico organizacional exacto, no territorial.                                                                                             | Información e historial de actualizaciones de Vento OS. Permite consultar publicaciones de otros.                                            | Sin G ni alcances territoriales. Excluye secretos, credenciales, repositorios, código fuente y entornos aislados.                                                                                       |
| viso.organization.businesses.view — Consultar empresas                           | BO · O · Rí · Cí · S | ORG-UNIT — organización o unidad de negocio exacta, no territorial.                                                                                           | Empresas o unidades de negocio pertenecientes a la organización autorizada.                                                                  | Sin G territorial. No atraviesa tenants, organizaciones futuras ni unidades no autorizadas.                                                                                                             |
| viso.workforce.employees.view — Consultar trabajadores                           | BO · O · Rí · C · Sí | WF — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW y variante OWN.                                                                                                 | Expedientes y datos de trabajadores. OWN para el expediente propio cuando la interfaz lo permita. Terceros solo dentro del alcance laboral.  | Máximo G(B) explícito y sensible. Un trabajador multisede se muestra por relaciones autorizadas; una sede no concede automáticamente todos los campos o las demás sedes.                                |
| viso.workforce.staff_calendar.view — Consultar calendario del personal           | BO · O · Rí · C · Sí | WF — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW y OWN.                                                                                                          | Calendario laboral propio y de otros trabajadores dentro del alcance.                                                                        | Máximo G(B) explícito. La vista multisede es la unión autorizada y no revela trabajadores externos.                                                                                                     |
| viso.workforce.schedules.view — Consultar programación del personal              | BO · O · Rí · C · Sí | WF — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW y OWN.                                                                                                          | Programación y turnos propios o de otros trabajadores por sede y área.                                                                       | Máximo G(B) explícito. Cruce de sedes solo sobre turnos individualmente autorizados.                                                                                                                    |
| viso.workforce.vacancies.view — Consultar vacantes                               | BO · O · Rí · C · S  | VACANCY — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW; ORG exacto para vacantes sin sede.                                                                        | Vacantes organizacionales o territorializadas. No depende de propiedad.                                                                      | Máximo G(B). Una vacante corporativa sin sede se autoriza por recurso organizacional exacto, no por fallback.                                                                                           |
| viso.authorization.context_simulations.view — Consultar simulaciones de contexto | BO · O · Rí · C · Sí | OWNED-SEC — OWN por defecto; NT respecto del permiso. Terceros solo con concesión administrativa sensible explícita.                                          | Sesiones y resultados de simulación de autorización.                                                                                         | El contexto simulado puede contener sedes y áreas, pero no concede acceso real a ellas. Sin G territorial ni lectura de todas las simulaciones por nombre de rol.                                       |
| viso.authorization.audit_logs.view — Consultar auditoría operacional             | BO · O · Rí · C · Sí | AUDIT — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW y filtros por aplicación o recurso.                                                                          | Registros derivados de actores, permisos, recursos, aplicaciones, sedes y áreas. No existe propiedad automática.                             | Máximo G(B) explícito. La consulta transversal excluye eventos cuyo recurso o actor quede fuera. Consultar acciones propias no se presume automáticamente.                                              |
| viso.catalog.commercial_categories.view — Consultar categorías comerciales       | BO · O · Rí · Cí · S | CONTENT-CONFIG — ORG, unidad o canal; opcionalmente AS, SS, AST, TST; áreas solo cuando el recurso las declare.                                               | Categorías comerciales creadas dentro de la organización o unidad de negocio.                                                                | Sin G territorial por defecto. No concede edición ni autoridad sobre categorías de otro negocio.                                                                                                        |
| viso.content.content_blocks.view — Consultar bloques de contenido                | BO · O · Rí · Cí · S | CONTENT-CONFIG — ORG, unidad, canal; opcionalmente AS, SS, AST, TST; áreas cuando estén declaradas.                                                           | Bloques de contenido organizacionales, de negocio, canal o sede.                                                                             | El ámbito se deriva del bloque exacto. No concede edición, publicación o acceso a otros canales.                                                                                                        |
| viso.content.menu.view — Consultar menú                                          | BO · O · Rí · Cí · S | CONTENT-CONFIG — ORG, negocio o canal; opcionalmente AS, SS, AST, TST.                                                                                        | Menús administrables por negocio, canal o sede.                                                                                              | Sin G territorial automático. Ver un menú no concede modificación, precios internos ni datos de inventario.                                                                                             |
| viso.content.website_content.view — Consultar contenido web                      | BO · O · Rí · Cí · S | CONTENT-CONFIG — ORG, negocio o canal; opcionalmente territorio cuando el recurso lo declare.                                                                 | Contenido web de la organización, marca, negocio o sitio.                                                                                    | Se limita al canal y unidad autorizados. No concede edición, publicación ni administración de infraestructura.                                                                                          |
| viso.finance.accounting.view — Consultar información contable                    | BO · O · Rí · C · Sí | FIN-READ — G(B), AS, SS, AST, TST, AA, SA, AAT, ATW.                                                                                                          | Información contable por organización, negocio, sede, área o centro de costo.                                                                | Máximo G(B) explícito. Cruce de sedes solo como conjunto autorizado. No concede modificación, exportación o aprobación.                                                                                 |
| viso.delivery.rates.view — Consultar tarifas de entrega                          | BO · O · Rí · Cí · S | CONFIG-READ — G(B), AS, SS, AST, TST; áreas cuando la tarifa esté anclada a una.                                                                              | Tarifas por negocio, sede, zona, cobertura o ruta.                                                                                           | Máximo G(B). Las zonas externas se autorizan por relación con la sede o negocio. No concede modificación.                                                                                               |
| viso.loyalty.products.view — Consultar productos de fidelización                 | BO · O · Rí · Cí · S | CLIENT-CONFIG — ORG, negocio o campaña; opcionalmente AS, SS, AST, TST por aplicabilidad.                                                                     | Productos y beneficios del dominio cliente administrados desde una superficie laboral.                                                       | No usa employee_sites como límite obligatorio del recurso. No concede identidad de cliente, puntos, canjes ni administración de PASS por implicación.                                                   |
| viso.loyalty.customers.view — Consultar clientes de fidelización                 | BO · O · Rí · C · Sí | CLIENT-DATA — dominio cliente o negocio; conjunto global de clientes solo con concesión base explícita; AS, SS, AST, TST únicamente como filtro de actividad. | Registros de clientes y actividad de fidelización. No existe alcance OWN por ser trabajador. Un cliente autenticado no obtiene este permiso. | Máximo conjunto de clientes de la organización solo con concesión sensible explícita. La actividad en una sede no convierte al cliente en recurso laboral de esa sede ni concede su identidad completa. |

#### 10. Reglas por aplicación

10.1 SHELL
SHELL solo controla la entrada al hub.
No administra territorio ni sustituye permisos internos.
shell.access no se relaciona con el repositorio vento-shell.
10.2 ANIMA
Los recursos laborales se delimitan por trabajador objetivo y cobertura administrativa.
Los permisos propios y sobre terceros deben distinguirse en la asignación o decisión.
La programación de turnos utiliza la sede y el área del turno como territorio del recurso.
ANIMA puede iniciar o cerrar contexto, pero AUTH-CAT-011 no define sus prerrequisitos.
10.3 AURA
Continúa activa en el catálogo y diferida en el roadmap.
Solo se define el alcance no territorial de entrada.
No se crea ninguna capacidad adicional.
10.4 FOGO
Los lotes y órdenes son territoriales.
El recetario operativo se filtra por aplicabilidad y no equivale al catálogo administrativo de recetas.
Las definiciones de receta son recursos organizacionales sensibles.
La creación productiva nunca recibe alcance operativo global.
10.5 NEXO
El maestro de productos, presentaciones, categorías, unidades y grupos es organizacional.
El inventario se territorializa por sede, área, ubicación, LPN, lote o relación canónica.
Las remisiones se resuelven por origen, destino, áreas, ruta, actor y lado responsable.
Las operaciones financieras se resuelven por documento, sede, centro de costo y operación relacionada.
Los reportes solo agregan territorios autorizados.
Las plantillas de impresión se autorizan por plantilla exacta y ámbito declarado.
10.6 NUMERA
Los datos financieros y analíticos pueden admitir alcance global base explícito.
Los resultados agregados no pueden revelar territorios excluidos.
numera.access no concede acceso a datos.
10.7 ORIGO
Las órdenes y recepciones son territoriales y pueden relacionar varios destinos.
El proveedor es un recurso comercial organizacional, no propiedad de una sede.
El carril operativo solo puede consultar el proveedor relacionado con la operación y los campos necesarios.
La revisión del maestro de productos permanece como cola organizacional.
10.8 PASS
pass.access representa una superficie laboral o administrativa.
No concede identidad, sesión, puntos, recompensas ni datos del cliente.
El acceso normal del cliente permanece fuera del RBAC laboral.
10.9 PULSO
La entrada a PULSO no es global ni concede capacidades operativas internas.
La confirmación excepcional de entrega actúa sobre una entrega exacta y la intersección de los dos carriles.
La ruta de una entrega no concede autoridad sobre otras sedes.
10.10 VISO
Los recursos laborales se limitan por trabajador y territorio.
Las simulaciones se limitan por propiedad o autorización administrativa explícita.
La auditoría se limita por aplicación, recurso, actor y territorio.
Los recursos de contenido pueden ser organizacionales, de negocio, canal o sede.
Los clientes y productos de fidelización pertenecen al dominio cliente, aunque la superficie administrativa sea laboral.

#### 11. Prohibiciones y límites

Queda prohibido:

asignar G a un permiso cuya fila no lo admita;
convertir NT u ORG en G;
tratar una sede seleccionada como sede autorizada;
usar la sede primaria como sustituto de AS;
usar el tipo de sede como acceso a sedes no autorizadas cuando la modalidad sea AST;
usar un tipo de área sin límite superior de sede;
interpretar una ubicación de inventario como área empresarial;
interpretar un rol operativo como tipo de área;
asumir que un recurso creado por el actor siempre es editable o eliminable;
actuar sobre recursos de terceros cuando la fila solo permita OWN;
usar un permiso de lectura como autorización para exportar, imprimir, compartir o modificar;
usar un permiso configurativo de lectura como autorización para cambiar configuración;
usar app.access como permiso de módulo o acción;
usar el nombre de propietario, gerente general o cualquier rol como bypass;
incluir APP-REVIEW, datos demo o entornos aislados en un alcance ordinario;
extender un permiso de PASS al cliente autenticado;
extender un permiso de VISO sobre clientes al dominio laboral del cliente;
usar una relación multisede para conceder autoridad total sobre ambos extremos;
permitir una mutación multisede cuando uno de los extremos obligatorios no está autorizado;
resolver territorio inexistente mediante fallback silencioso.

#### 12. Casos especiales

12.1 Permisos BASE_OR_OPERATIONAL

Cuando una fila admita G(B) y CTX(O):

el carril base puede autorizar una cobertura administrativa amplia;
el carril operativo queda limitado a su territorio resuelto;
ninguno toma prestado el alcance del otro;
una denegación aplicable a un carril se evalúa según AUTH-MOD-019.
12.2 Permisos BASE_AND_OPERATIONAL

Los cinco permisos BASE_AND_OPERATIONAL tienen alcance efectivo por intersección:

nexo.inventory.adjustments.register;
nexo.inventory.entries.override;
nexo.finance.internal_variances.approve;
nexo.finance.internal_variances.resolve;
pulso.delivery.deliveries.override.

Aunque el carril base pueda tener una cobertura amplia, la acción concreta nunca se vuelve global.

El recurso y el territorio operativo deben quedar dentro del alcance base.

12.3 Remisiones

La remisión es un recurso multisede, pero cada acción autoriza un lado o relación diferente:

view: visibilidad legítima por origen, destino, transporte o coordinación;
update: campos y estados editables, con soporte de propiedad cuando corresponda;
request: autoridad sobre el lado solicitante y una ruta válida, sin autoridad de inventario sobre el origen;
prepare: autoridad sobre el origen;
dispatch: autoridad sobre origen y segmento logístico;
receive: autoridad sobre el destino;
cancel: autoridad según propiedad, estado y lado responsable.

Ningún permiso de remisión hereda las demás acciones.

12.4 Recursos sin sede

Cuando el recurso sea ORG o NT:

la decisión no exige una sede ficticia;
la autorización se limita al recurso exacto;
la ausencia de territorio no amplía el conjunto;
si el recurso contiene una dimensión territorial opcional, esta se valida cuando exista.
12.5 Trabajadores multisede

Para permisos laborales:

el trabajador objetivo puede aparecer por cualquiera de sus asignaciones activas autorizadas;
la vista no debe duplicar el expediente;
una relación con una sede no concede automáticamente todos los campos ni todas las demás sedes del trabajador;
los campos sensibles continúan sujetos al contrato del recurso.
12.6 Clientes

viso.loyalty.customers.view:

es un permiso laboral administrativo;
no pertenece al cliente final;
no utiliza employee_sites como propiedad del cliente;
puede usar la actividad por sede como filtro;
requiere partición por negocio o dominio cliente;
no convierte el historial de compra en identidad laboral.
12.7 Proveedores

origo.procurement.suppliers.view:

no convierte al proveedor en recurso propiedad de una sede;
permite una vista administrativa por negocio;
permite una vista operativa mínima por relación con una orden o recepción;
no expone automáticamente información bancaria, tributaria o comercial completa al carril operativo.

#### 13. Validación de integridad

13.1 Conteo general

| Validación                                    | Resultado |
| --------------------------------------------- | --------- |
| Permisos canónicos evaluados                  | 112       |
| Permisos con alcance explícito                | 112       |
| Permisos omitidos                             | 0         |
| Permisos duplicados                           | 0         |
| Permisos sin decisión                         | 0         |
| Permisos legacy reincorporados                | 0         |
| Permisos técnicos retirados reincorporados    | 0         |
| Aliases tratados como permisos independientes | 0         |

13.2 Conteo por aplicación

| Aplicación | Permisos |
| ---------- | -------- |
| SHELL      | 1        |
| ANIMA      | 10       |
| AURA       | 1        |
| FOGO       | 6        |
| NEXO       | 63       |
| NUMERA     | 6        |
| ORIGO      | 5        |
| PASS       | 1        |
| PULSO      | 2        |
| VISO       | 17       |
| Total      | 112      |

13.3 Consistencia con AUTH-CAT-006

| authorization_requirement | Cantidad |
| ------------------------- | -------- |
| BASE_ONLY                 | 54       |
| OPERATIONAL_ONLY          | 13       |
| BASE_OR_OPERATIONAL       | 40       |
| BASE_AND_OPERATIONAL      | 5        |
| Total                     | 112      |

13.4 Consistencia con AUTH-CAT-007 a AUTH-CAT-010

| Clasificación    | Verdadero | Falso | Total |
| ---------------- | --------- | ----- | ----- |
| is_operational   | 58        | 54    | 112   |
| is_read_only     | 80        | 32    | 112   |
| is_configuration | 30        | 82    | 112   |
| is_sensitive     | 60        | 52    | 112   |

13.5 Controles cruzados
Todo BASE_ONLY figura como O:no.
Todo OPERATIONAL_ONLY, BASE_OR_OPERATIONAL y BASE_AND_OPERATIONAL figura como O:sí.
Ningún permiso NT recibe G por defecto.
Ningún permiso operativo mutador recibe G como alcance efectivo.
Los cuatro permisos configurativos mutadores conservan restricciones reforzadas.
Los permisos sensibles con alcance máximo global lo limitan al carril base y a concesión explícita.
PASS conserva separada la identidad cliente.
SHELL conserva separada la aplicación del repositorio vento-shell.
AURA permanece diferida.

#### 14. Criterios de aprobación

AUTH-CAT-011 podrá aprobarse cuando se acepte expresamente que:

los 112 permisos de la matriz son los únicos permisos canónicos evaluados;
cada fila define el alcance máximo y los alcances admitidos;
los alcances no declarados quedan prohibidos;
NT y ORG no equivalen a G;
G solo existe cuando la fila lo justifica;
el carril operativo no obtiene alcance global;
BASE_AND_OPERATIONAL utiliza intersección;
la propiedad del recurso no reemplaza permiso ni territorio;
las operaciones sobre terceros y multisede requieren declaración explícita;
PASS, SHELL, vento-shell y AURA conservan sus separaciones aprobadas;
no se han definido anticipadamente prerrequisitos de turno ni check-in.

#### 15. Impacto sobre tareas posteriores

AUTH-CAT-012

Podrá definir prerrequisitos de turno y check-in sin alterar los alcances aprobados aquí.

AUTH-CAT-013

Podrá determinar qué permisos exigen área activa.

Deberá respetar los tipos de área y límites territoriales admitidos por esta tarea.

AUTH-CAT-014

Podrá decidir qué permisos admite un dispositivo compartido.

El dispositivo solo podrá reducir el alcance. Nunca podrá ampliarlo.

AUTH-CAT-015

Podrá definir simulación.

La simulación no concederá acceso real ni modificará los alcances aprobados.

AUTH-CAT-016

Deberá formalizar, para cada permiso:

el tipo de recurso;
la ruta canónica para resolver sede;
la ruta canónica para resolver área;
la propiedad;
los lados obligatorios de recursos multisede;
los estados y campos aplicables.

AUTH-CAT-016 podrá precisar la resolución técnica, pero no ampliar silenciosamente los alcances máximos aprobados en AUTH-CAT-011.

AUTH-CAT-017 a AUTH-CAT-019

El catálogo versionado, los tipos TypeScript y la eliminación de cadenas manuales deberán representar estas decisiones sin reinterpretarlas.

BLOQUE D

Las matrices de roles y excepciones solo podrán asignar alcances admitidos por cada fila.

Una asignación incompatible deberá:

denegar;
registrar configuración inválida;
no degradarse al alcance más permisivo.

#### 16. Estado final de la propuesta

AUTH-CAT-011 — APROBADA
