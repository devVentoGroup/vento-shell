### MINI-BLOQUE — PRUEBAS DE CONSUMIDORES Y ROLLBACK

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **pruebas de consumidores y rollback** dentro de **T CALIDAD Y DESPLIEGUE**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `SHELL-CI-007` a `SHELL-CI-015` — 9 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Probar NEXO antes de actualizar” y concluye con “Evitar despliegue simultáneo obligatorio”.
<!-- PLAN-SECTION-META:END -->

### ✅ SHELL-CI-007 — Probar NEXO antes de actualizar

**Estado:** APROBADA
**Tarea anterior:** SHELL-CI-006 — Crear actualización de consumidores mediante PR
**Tarea siguiente:** SHELL-CI-008 — Probar FOGO antes de actualizar
**Tipo de tarea:** Habilitador global único — contrato documental de pruebas específicas de NEXO previas a actualización de packages compartidos
**Bloque:** BLOQUE T — CI, pruebas, despliegue y rollback base
**Repositorio propietario:** `devVentoGroup/vento-nexo`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/T_CALIDAD_Y_DESPLIEGUE/02_PRUEBAS_DE_CONSUMIDORES_Y_ROLLBACK.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada el contrato de pruebas que deberá demostrar que **NEXO conserva una línea base reproducible, íntegra y atribuible antes de modificar su conjunto de packages compartidos**, de modo que una actualización preparada por CI006 nunca utilice como punto de partida un consumidor ya roto, no probado, ambiguo o con evidencia perteneciente a otro commit.

La regla vinculante queda:

```text
NEXO EN UN COMMIT BASE EXACTO
+ MANIFEST Y LOCKFILE EXACTOS
+ ENTORNO DE PRUEBA IDENTIFICADO
+ RELACIÓN PACKAGE–NEXO EXACTA
+ PERFIL DE PRUEBAS NEXO APLICABLE
+ PRUEBAS FUNCIONALES Y DE AUTORIZACIÓN SATISFACTORIAS
+ EVIDENCIA VIGENTE
= LÍNEA BASE NEXO APTA PARA INICIAR UNA PROPUESTA DE ACTUALIZACIÓN
```

Y, de forma fail-closed:

```text
LINT VERDE
O BUILD VERDE
O COMPATIBILIDAD DE OTRO CONSUMIDOR
O PRUEBAS DE OTRO COMMIT
O EXISTENCIA DE UNA RELEASE
O AUSENCIA DE TESTS AUTOMATIZADOS
≠ LÍNEA BASE NEXO CERTIFICADA
```

CI007 certifica la línea base específica de NEXO. No publica packages, no modifica la versión objetivo, no prepara el pull request, no fusiona, no despliega y no ejecuta rollback.

#### 2. Resultado canónico

`SHELL-CI-007` establece un único habilitador reutilizable para:

1. identificar el commit base exacto de `devVentoGroup/vento-nexo` que se pretende actualizar;
2. fijar las identidades del manifest, lockfile, configuración y entorno que participaron en la prueba;
3. seleccionar únicamente las relaciones package–NEXO aplicables;
4. seleccionar el perfil NEXO correspondiente a cada familia compartida objetivo;
5. ejecutar una línea base común de instalación, análisis, tipos, build y pruebas automatizadas;
6. ejecutar pruebas de comportamiento NEXO en superficies de inventario, logística, autorización y operación afectables por la fundación compartida;
7. probar rutas permitidas y denegadas de autorización sin ampliar permisos por fallback;
8. conservar aislamiento de sede, LOC, sesión, dispositivo y contexto operativo;
9. proteger invariantes de catálogo, unidad, presentación, stock, movimiento y trazabilidad;
10. proteger el ciclo de remisiones desde solicitud hasta recepción, incluida preparación, tránsito, división de líneas y recepción parcial;
11. proteger board, kiosk, posiciones internas y retiros por LOC;
12. proteger activos físicos, conteos y operaciones de inventario sin convertir un test en mutación productiva;
13. probar contratos de cliente/servidor y Supabase sin autorizar migraciones ni cambios remotos desde NEXO;
14. probar render, hidratación, interacción y accesibilidad representativa cuando la familia objetivo sea UI;
15. producir evidencia machine-readable ligada al commit base y al conjunto exacto de pruebas;
16. invalidar la evidencia cuando cambie cualquiera de sus entradas materiales;
17. bloquear una actualización cuando no exista infraestructura de prueba suficiente;
18. entregar a CI006 un resultado de línea base consumible para comparar el comportamiento previo y el `proposal_commit` posterior;
19. soportar una actualización multi-package mediante la unión de perfiles requeridos, sin reducir cobertura;
20. autocertificar el habilitador global una sola vez antes de reutilizarlo en futuras actualizaciones de NEXO.

#### 3. Frontera de responsabilidad

| Responsabilidad                                              | Propietario         |
| ------------------------------------------------------------ | ------------------- |
| pruebas propias del package                                  | `SHELL-CI-001`      |
| artefacto distribuible del package                           | `SHELL-CI-002`      |
| identidad y publicación de release                           | `SHELL-CI-003`      |
| changelog y release notes                                    | `SHELL-CI-004`      |
| compatibilidad package–consumidor                            | `SHELL-CI-005`      |
| preparación y mantenimiento del PR consumidor                | `SHELL-CI-006`      |
| línea base y pruebas específicas de NEXO antes de actualizar | `SHELL-CI-007`      |
| pruebas específicas de FOGO                                  | `SHELL-CI-008`      |
| pruebas específicas de ORIGO                                 | `SHELL-CI-009`      |
| pruebas específicas de PULSO                                 | `SHELL-CI-010`      |
| pruebas específicas de VISO                                  | `SHELL-CI-011`      |
| pruebas específicas de NUMERA                                | `SHELL-CI-012`      |
| pruebas específicas de ANIMA                                 | `SHELL-CI-013`      |
| rollback por repositorio                                     | `SHELL-CI-014`      |
| independencia de despliegue                                  | `SHELL-CI-015`      |
| normalización de comandos de prueba por repositorio          | `SHELL-CI-016`      |
| trazabilidad de requisitos y evidencia por PR                | `SHELL-CI-017..019` |

CI007 puede exigir un punto de entrada reproducible para ejecutar su propia suite, pero no absorbe la normalización transversal de comandos reservada a CI016.

#### 4. Topología de trabajo

`PHASE-03-T-CI-FOUNDATION` aplica `GLOBAL_ENABLE_ONCE` a `SHELL-CI-007`.

Por tanto:

```text
MARCADOR CANÓNICO
SHELL-CI-007
→ define una sola vez el contrato de pruebas previas de NEXO

INSTANCIA FÍSICA FUTURA
SHELL-CI-007::GLOBAL
→ materializa y autocertifica una sola vez el habilitador NEXO

ACTUALIZACIONES POSTERIORES DE NEXO
→ reutilizan el habilitador certificado
→ generan evidencia nueva por commit base y conjunto objetivo
→ no vuelven a implementar CI007
```

La instancia global puede utilizar fixtures, dobles, snapshots y entornos locales o CI aislados. No necesita actualizar un package real para demostrar el funcionamiento del habilitador.

#### 5. Handoff vinculante desde CI006

CI006 ya materializó el actualizador común y conserva las 28 relaciones base, los dieciséis `PKG-GATE-*`, la invalidación por commit y la prohibición de auto-merge y auto-deploy.

CI007 entrega a CI006 únicamente la evidencia específica de NEXO que le corresponde.

La secuencia lógica será:

```text
RELEASE OBJETIVO CONOCIDA
→ RELACIÓN PACKAGE–NEXO RESUELTA
→ COMMIT BASE NEXO FIJADO
→ CI007 CERTIFICA LA LÍNEA BASE DEL COMMIT BASE
→ CI006 MATERIALIZA LA PROPUESTA AISLADA
→ CI006 EJECUTA O CONSUME LOS GATES SOBRE EL PROPOSAL COMMIT
→ SE COMPARA CON LA LÍNEA BASE VIGENTE
→ REVISIÓN HUMANA
```

Un `PASS` de CI007 no sustituye CI005 ni autoriza por sí mismo `ELIGIBLE`, `READY_FOR_REVIEW`, merge, despliegue o adopción.

#### 6. Relaciones package–NEXO gobernadas

CI007 gobierna exactamente las cuatro combinaciones NEXO de la matriz web base:

| Familia             | Compatibilidad CI005 | Actualización CI006 | Consumidor   |
| ------------------- | -------------------- | ------------------- | ------------ |
| `@vento/contracts`  | `PKG-COMP-MX-003`    | `PKG-PR-REL-003`    | `vento-nexo` |
| `@vento/os-context` | `PKG-COMP-MX-010`    | `PKG-PR-REL-010`    | `vento-nexo` |
| `@vento/supabase`   | `PKG-COMP-MX-017`    | `PKG-PR-REL-017`    | `vento-nexo` |
| `@vento/ui-web`     | `PKG-COMP-MX-024`    | `PKG-PR-REL-024`    | `vento-nexo` |

**Conciliación:** 4 relaciones NEXO esperadas, 4 materializadas en el contrato, 0 faltantes y 0 duplicadas.

Ninguna evidencia de FOGO, ORIGO, PULSO, VISO, NUMERA, SHELL o ANIMA satisface estas cuatro relaciones.

#### 7. Línea base física observada de NEXO

En el corte remoto inspeccionado de `devVentoGroup/vento-nexo`:

- la rama principal es `main`;
- existe `package-lock.json` y el repositorio es una aplicación Next privada;
- el manifest declara `lint` y `build`;
- el manifest no declara un script de pruebas automatizadas;
- el manifest no declara un script dedicado de typecheck;
- no se confirmó una suite `test/spec` ni un framework de pruebas automatizadas ya materializado;
- no se declaran todavía dependencias publicadas `@vento/*` en el manifest observado;
- se observan Next `^16.2.3`, React `19.2.3`, React DOM `19.2.3`, Supabase JS `^2.90.1` y Supabase SSR `^0.8.0`;
- el código materializa Auth/SSO, guardas, contexto operativo, inventario, catálogo, presentaciones, stock, LOC, movimientos, conteos, ajustes, retiros, traslados, remisiones, activos, settings y superficies de impresión;
- se observan modos de remisión para preparación, conductor, tránsito, fulfillment y recepción;
- se observan superficies de board, kiosk, posiciones internas y retiro por LOC;
- se observan clientes Supabase browser/server y middleware o proxy de sesión;
- existe historia de migraciones dentro del repositorio NEXO, pero CI007 no autoriza crear, modificar ni ejecutar migraciones allí;
- cualquier modificación futura de schema, RPC, RLS, Storage, Realtime, Edge Functions, datos o configuración Supabase permanece propiedad de `devVentoGroup/vento-shell`.

Conclusión documental: **NEXO todavía no puede considerarse físicamente certificado para CI007 por la sola existencia de lint y build**. La futura `SHELL-CI-007::GLOBAL` deberá materializar la infraestructura de pruebas automatizadas que falta y autocertificarla.

#### 8. Unidad exacta de certificación previa

Cada resultado de CI007 se atribuye como mínimo a:

```text
consumer_repository
consumer_branch
consumer_base_commit
consumer_manifest_identity
consumer_lockfile_identity
test_contract_identity
test_suite_identity
fixture_set_identity
environment_identity
runtime_identity
framework_identity
target_package_set
compatibility_refs
nexo_profile_set
execution_identity
started_at
completed_at
result
invalidation_reason
```

La unidad certificada es el **commit base sin la actualización propuesta**.

Cambiar el commit, manifest, lockfile, suite, fixtures, configuración, entorno o perfil invalida la reutilización del resultado anterior.

#### 9. Momento de ejecución

La prueba previa debe ejecutarse después de conocer el conjunto objetivo y antes de materializar la actualización sobre NEXO.

Orden obligatorio:

1. resolver release o conjunto mínimo cerrado de releases objetivo;
2. resolver una o más de las cuatro relaciones NEXO;
3. fijar `consumer_base_commit`;
4. fijar manifest y lockfile del commit base;
5. resolver los perfiles NEXO exigidos por las familias objetivo;
6. ejecutar la línea base común y los perfiles seleccionados sin cambiar versiones de packages;
7. consolidar la evidencia;
8. solo con resultado satisfactorio permitir que CI006 continúe con la preparación aislada de la propuesta.

Si durante la prueba cambia el commit base, la ejecución en curso deja de ser atribuible y debe reiniciarse sobre la nueva identidad.

#### 10. Semántica de resultado

CI007 reutiliza la semántica fail-closed aprobada para los gates:

- `PENDING`;
- `RUNNING`;
- `PASS`;
- `FAIL`;
- `BLOCKED`;
- `CANCELLED`;
- `TIMED_OUT`;
- `STALE`;
- `NOT_APPLICABLE` únicamente para comprobaciones realmente condicionales y justificadas.

Para declarar la línea base NEXO apta se requiere `PASS` global.

No satisfacen el contrato:

- suite ausente;
- cero tests ejecutados cuando existan superficies obligatorias;
- tests deshabilitados;
- salida ambigua;
- `SKIPPED` no justificado;
- snapshots actualizados automáticamente para forzar verde;
- mocks que eliminen la condición que se pretendía probar;
- `NOT_APPLICABLE` en una comprobación obligatoria;
- un resultado de otro commit;
- un resultado de otro consumidor.

#### 11. Línea base técnica común

Toda certificación previa de NEXO deberá demostrar, sobre el mismo commit base:

1. instalación bloqueada reproducible con el lockfile vigente;
2. manifest y lockfile coherentes;
3. lint o análisis estático aplicable;
4. typecheck real de TypeScript, aunque la normalización del comando común pertenezca a CI016;
5. build de producción o export aplicable;
6. ejecución de la suite automatizada específica de NEXO;
7. ausencia de tests omitidos silenciosamente por configuración;
8. identidad del entorno y runtime registrada;
9. evidencia separada por comprobación;
10. resultado global fail-closed.

Un build satisfactorio no sustituye las pruebas automatizadas específicas.

#### 12. Matriz funcional mínima obligatoria de NEXO

La suite global deberá cubrir como mínimo estas doce superficies de comportamiento. La implementación física puede dividir cada superficie en varios tests, pero no eliminarla sin una decisión canónica posterior.

|    # | Superficie                                      | Afirmación positiva mínima                                                               | Afirmación negativa o de borde mínima                                                                                                                             |
| ---: | ----------------------------------------------- | ---------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | identidad, sesión y permisos                    | una identidad autorizada conserva sesión y capacidad esperadas                           | identidad ausente, expirada o sin permiso falla cerrado                                                                                                           |
|    2 | contexto operativo                              | sede, LOC y contexto válidos limitan la operación al alcance autorizado                  | contexto incompleto, manipulado o fuera de alcance no amplía autoridad                                                                                            |
|    3 | catálogo, categorías, unidad y presentación     | producto y presentación conservan identidad, unidad y reglas de disponibilidad           | unidad incompatible, presentación inválida o categoría visual no redefine el contrato físico                                                                      |
|    4 | stock por sede y LOC                            | saldo y dimensión física se leen y actualizan de forma atribuible                        | no se infieren bolsas, cajas, presentaciones o saldo inexistente desde una magnitud base                                                                          |
|    5 | entradas, conteos, ajustes, retiros y traslados | cada operación produce efecto y trazabilidad coherentes                                  | cantidad inválida, origen insuficiente, duplicidad o transición ilegal no produce éxito aparente                                                                  |
|    6 | LOC, board, kiosk y posiciones                  | stock visible y acciones corresponden al LOC y posición autorizados                      | un kiosk, slug, LOC o dispositivo no puede acceder o retirar fuera de su alcance                                                                                  |
|    7 | remisiones                                      | solicitud, preparación, despacho, tránsito y recepción conservan cantidades y estados    | salto de estado, doble acción, actor no autorizado o cantidad inválida queda bloqueado                                                                            |
|    8 | división y recepción parcial                    | líneas divididas y recepciones parciales conservan identidad y saldo restante            | una recepción parcial no cierra ni duplica cantidades pendientes incorrectamente                                                                                  |
|    9 | activos físicos y conteos                       | identidad, ubicación, condición y conteo se conservan cuando aplican                     | un activo individual no se degrada a saldo fungible ni pierde trazabilidad por una actualización compartida                                                       |
|   10 | settings, rutas y políticas operativas          | sedes, rutas, unidades y políticas válidas son interpretadas de forma estable            | configuración incompleta o no autorizada no se convierte en permiso o dato operativo válido                                                                       |
|   11 | integración y fronteras de dominio              | NEXO consume contratos de ORIGO, FOGO y Shell sin apropiarse de responsabilidades ajenas | NEXO no convierte recetas, ventas, compras o cambios Supabase en autoridad local por conveniencia                                                                 |
|   12 | UI, SSR, interacción, accesibilidad e impresión | superficies representativas renderizan y conservan interacción, foco y contratos de UI   | fallo de hidratación, evento, accesibilidad o integración de impresión no se normaliza como éxito; hardware real no es requisito para la autocertificación global |

Estas doce superficies son la línea base común. Los perfiles de familia agregan obligaciones, no las sustituyen.

#### 13. Perfil NEXO para `@vento/contracts`

Cuando la relación objetivo incluya `PKG-PR-REL-003`, la línea base deberá cubrir especialmente:

- tipos y estructuras consumidas por inventario y remisiones;
- schemas, catálogos, códigos y errores compartidos aplicables;
- serialización y deserialización de datos operativos;
- compatibilidad de identificadores, unidades, estados y razones;
- límites entre dato ausente, `null`, inválido y denegado;
- compilación de los puntos de consumo TypeScript;
- comportamiento de adaptadores locales que consuman contratos compartidos;
- ausencia de casts globales o fallbacks que oculten una incompatibilidad.

La evidencia se vincula a `PKG-COMP-MX-003` y `PKG-PR-REL-003`.

#### 14. Perfil NEXO para `@vento/os-context`

Cuando la relación objetivo incluya `PKG-PR-REL-010`, la línea base deberá cubrir especialmente:

- sesión real y sesión ausente;
- contexto operativo por sede y LOC;
- permiso concedido y permiso denegado;
- contexto incompleto o manipulado;
- navegación y acceso a superficies protegidas;
- fronteras server/client y propagación de sesión;
- shared device y override cuando sean aplicables;
- preservación de razones de denegación;
- prohibición de elevar autoridad desde valores controlados por cliente.

La evidencia se vincula a `PKG-COMP-MX-010` y `PKG-PR-REL-010`.

#### 15. Perfil NEXO para `@vento/supabase`

Cuando la relación objetivo incluya `PKG-PR-REL-017`, la línea base deberá cubrir especialmente:

- creación y uso de clientes browser y server;
- propagación de sesión y cookies aplicable;
- tipos generados y shapes de respuesta consumidos por NEXO;
- consultas, RPC y errores realmente utilizados por las superficies bajo prueba;
- operaciones permitidas dentro del alcance autorizado;
- operaciones denegadas por permisos o RLS;
- ausencia de service-role o credenciales privilegiadas en cliente o fixtures;
- aislamiento de datos entre sedes o alcances cuando el contrato lo exija;
- ausencia de bypass provocado por wrapper, fallback o manejo de errores;
- correspondencia entre schema de prueba y fuente canónica de `vento-shell`.

Las pruebas de RLS o schema que requieran base de datos deberán usar un entorno local o CI aislado derivado de la fuente canónica de `vento-shell`. La falta de ese entorno cuando la comprobación sea obligatoria produce `BLOCKED`, no `NOT_APPLICABLE`.

La evidencia se vincula a `PKG-COMP-MX-017` y `PKG-PR-REL-017`.

#### 16. Perfil NEXO para `@vento/ui-web`

Cuando la relación objetivo incluya `PKG-PR-REL-024`, la línea base deberá cubrir especialmente:

- render servidor y cliente de superficies representativas;
- hidratación sin divergencias silenciosas;
- formularios y controles de inventario;
- navegación, menús, tablas, filtros y estados vacíos;
- eventos de usuario y feedback de éxito/error;
- foco, teclado y semántica accesible aplicable;
- integración de tokens y estilos sin degradar legibilidad u operación;
- comportamiento de loading, error y deny states;
- ausencia de imports privados o acoplamiento a una implementación no contractual;
- smoke controlado de impresión o preview sin requerir dispositivo físico productivo.

La evidencia se vincula a `PKG-COMP-MX-024` y `PKG-PR-REL-024`.

#### 17. Protección reforzada de remisiones

El ciclo de remisiones es una superficie crítica de NEXO y deberá permanecer cubierto en toda ejecución en la que el cambio compartido pueda afectar tipos, contexto, Supabase o UI.

Cobertura mínima:

1. creación de solicitud válida;
2. identidad de origen y destino;
3. selección de líneas y cantidades;
4. preparación por LOC;
5. división de líneas;
6. despacho;
7. transición a tránsito;
8. vista o actuación de conductor cuando aplique;
9. recepción;
10. recepción parcial;
11. saldo pendiente después de recepción parcial;
12. idempotencia ante reintento de una acción ya aplicada;
13. rechazo de transición ilegal;
14. rechazo de actor sin autoridad;
15. conservación de trazabilidad de movimiento y documento.

No se exige completar dentro de CI007 integraciones funcionales pendientes de ORIGO o FOGO que pertenezcan a tareas propietarias futuras. Se prueba el contrato existente y la frontera vigente; no se inventa funcionalidad para obtener cobertura.

#### 18. Protección reforzada de autorización y RLS

La suite no se considera suficiente si solo prueba caminos felices de UI.

Deberá demostrar, según aplicabilidad:

- acceso permitido con identidad y contexto válidos;
- acceso denegado sin sesión;
- acceso denegado sin permiso;
- acceso denegado fuera de sede o LOC autorizado;
- ausencia de escalamiento por parámetros de URL, formulario o cliente;
- ausencia de escalamiento por override no permitido;
- persistencia fail-closed ante error de lectura de contexto;
- operaciones Supabase denegadas cuando RLS o contrato lo requieren;
- separación entre autenticación, contexto y autorización;
- ausencia de exposición de secretos o credenciales privilegiadas en evidencia.

Un mock que siempre autorice no satisface estas pruebas.

#### 19. Datos, fixtures y aislamiento

Las pruebas de CI007 deberán cumplir simultáneamente:

1. no leer ni modificar datos productivos;
2. usar fixtures deterministas o un entorno local/CI aislado;
3. no depender de IDs aleatorios no registrados como parte de la ejecución;
4. limpiar o descartar estado temporal de forma reproducible;
5. no compartir estado mutable entre tests que deba permanecer independiente;
6. no utilizar credenciales reales como fixture;
7. no introducir una migración NEXO para acomodar la prueba;
8. cuando se necesite schema Supabase, consumir la fuente canónica de `vento-shell`;
9. registrar versión o identidad del fixture set;
10. impedir que una falla de cleanup convierta el resultado en `PASS`.

#### 20. Línea base antes de `INITIAL_ADOPTION`

El manifest observado de NEXO no declara todavía packages publicados `@vento/*`.

Por tanto, la primera adopción futura de cualquiera de las cuatro familias deberá tratar la evidencia CI007 como **oráculo del comportamiento previo**:

```text
COMMIT BASE SIN EL PACKAGE COMPARTIDO
→ CI007 PASS
→ PROPUESTA INITIAL_ADOPTION
→ MISMA COBERTURA ESENCIAL SOBRE PROPOSAL COMMIT
→ COMPARACIÓN DE RESULTADOS
```

La ausencia actual del package no convierte sus pruebas específicas en no aplicables: CI007 protege el comportamiento que la adopción pretende preservar.

#### 21. Actualizaciones `PATCH`, `MINOR`, `MAJOR`, seguridad y deprecación

CI007 no sustituye las clases de actualización de CI006, pero ajusta la selección de escenarios:

- `PATCH_UPDATE`: ejecuta línea base completa y regresión focal del defecto o superficie afectada;
- `MINOR_UPDATE`: añade escenarios para la nueva capacidad consumida sin retirar la línea base vigente;
- `MAJOR_UPDATE`: exige línea base completa y una matriz explícita de comportamiento que cambiará, se preservará o migrará;
- `SECURITY_UPDATE`: mantiene pruebas de autorización, RLS, denegación y rollback; la urgencia no permite omitirlas;
- `DEPRECATION_MIGRATION`: mantiene pruebas de superficie antigua mientras siga soportada y prueba la ruta objetivo cuando exista;
- `ROLLBACK_UPDATE`: CI007 puede aportar línea base, pero la ejecución y certificación de rollback pertenece a CI014.

#### 22. Actualización multi-package

Cuando CI006 resuelva un conjunto mínimo cerrado con más de una familia compartida:

1. CI007 selecciona la unión de todos los perfiles correspondientes;
2. ninguna familia reduce la cobertura exigida por otra;
3. las doce superficies comunes permanecen;
4. una sola ejecución puede producir evidencia para el conjunto si todas las identidades se conservan juntas;
5. el conjunto objetivo queda registrado en la evidencia;
6. cambiar una sola versión objetivo invalida la evidencia dependiente;
7. no se usa lockstep artificial para incluir familias no requeridas.

#### 23. Evidencia consumible por CI006

La evidencia satisfactoria deberá permitir a CI006 demostrar al menos:

- repositorio consumidor exacto: `devVentoGroup/vento-nexo`;
- commit base exacto;
- manifest y lockfile exactos;
- relación o relaciones NEXO aplicables;
- conjunto de packages objetivo conocido;
- referencias de compatibilidad CI005 aplicables;
- perfil o perfiles NEXO ejecutados;
- identidad de la suite y fixtures;
- identidad del entorno;
- resultados por capa y superficie;
- total de tests ejecutados, aprobados, fallidos y omitidos;
- evidencia de caminos denegados aplicables;
- started/completed timestamps;
- resultado global;
- razón de bloqueo o invalidación cuando no sea `PASS`.

La evidencia podrá formar parte de `validation_results` y `evidence_refs` del expediente `PKG-PR-*`, pero CI007 no crea ni mantiene ese expediente.

#### 24. Invalidación obligatoria

El resultado pasa a `STALE` cuando cambia materialmente cualquiera de estas entradas antes de que CI006 la consuma:

- `consumer_base_commit`;
- manifest;
- lockfile;
- configuración de build, TypeScript o test;
- suite de pruebas;
- fixtures u oracles;
- variables o configuración del entorno relevantes;
- runtime o framework relevante;
- fuente de schema usada para pruebas Supabase;
- relación package–NEXO;
- versión o conjunto objetivo;
- referencia de compatibilidad CI005;
- superficie marcada como obligatoria;
- contrato de CI007.

No se conserva un `PASS` anterior mediante rebase, cherry-pick, cambio de fixture o actualización de snapshot sin nueva ejecución atribuible.

#### 25. Condiciones de bloqueo

La futura ejecución deberá quedar `BLOCKED` o `FAIL` según corresponda cuando ocurra cualquiera de estas condiciones:

1. no existe un runner o punto de entrada reproducible para las pruebas NEXO;
2. el runner ejecuta cero tests obligatorios;
3. falta la identidad del commit base;
4. manifest o lockfile no corresponden al commit base;
5. la suite fue modificada después de producir la evidencia;
6. existe un test obligatorio omitido sin justificación válida;
7. lint, typecheck o build obligatorio falla;
8. una prueba funcional obligatoria falla;
9. una prueba de denegación o autorización falla;
10. se requiere prueba de RLS y no existe entorno aislado válido;
11. el entorno apunta a datos o servicios productivos;
12. un fixture contiene una credencial real;
13. la evidencia CI005 pertenece a otra versión, artefacto o consumidor;
14. la relación resuelta no corresponde a NEXO;
15. se intenta modificar packages antes de cerrar la línea base;
16. se intenta resolver el fallo mediante bypass, cast global, skip o snapshot forzado;
17. una operación de prueba intenta crear o cambiar schema, RLS, RPC, datos o configuración remota desde NEXO;
18. resultados contradictorios o flaky no han sido explicados y estabilizados.

Ninguna aprobación humana convierte estas condiciones técnicas en `PASS`.

#### 26. Materialización futura de `SHELL-CI-007::GLOBAL`

La instancia física solo podrá declararse materializada cuando, dentro del alcance expresamente autorizado:

1. exista una infraestructura de pruebas automatizadas reproducible en `devVentoGroup/vento-nexo`;
2. exista un punto de entrada determinista para ejecutar la suite CI007;
3. las pruebas cubran las doce superficies comunes;
4. existan perfiles seleccionables para las cuatro familias compartidas;
5. existan casos permitidos y denegados de autorización;
6. exista estrategia aislada para las pruebas que requieran Supabase;
7. la suite no use datos productivos ni secretos reales;
8. las pruebas no modifiquen schema ni migraciones de NEXO;
9. la identidad de commit, manifest, lockfile, suite, fixtures y entorno forme parte de la evidencia;
10. un cambio material vuelva `STALE` la evidencia;
11. una ejecución multi-package una perfiles sin reducir cobertura;
12. la salida sea machine-readable y consumible por CI006;
13. la suite falle de forma demostrable ante al menos una ruptura sintética por cada perfil de familia;
14. la suite demuestre que evidencia de otro consumidor o commit no es reutilizable;
15. la suite demuestre que una ausencia de tests no se normaliza a `PASS`;
16. la autocertificación no actualice un package real, no abra PR, no despliegue y no ejecute rollback.

La selección física concreta de framework, archivos de configuración y devDependencies se resolverá durante la instancia con el estado actualizado de NEXO. El contrato no impone un proveedor inexistente por inferencia.

#### 27. Recuperación e idempotencia

Reglas:

1. una repetición exacta sobre las mismas entradas puede reproducir la misma decisión sin duplicar identidad lógica;
2. los intentos fallidos se conservan como evidencia, no se borran al obtener un verde posterior;
3. un test flaky no se resuelve reintentando hasta pasar sin registrar la intermitencia;
4. si cambia el commit base, se crea una ejecución nueva;
5. si cambia el conjunto objetivo, se recalculan los perfiles y se ejecuta nuevamente lo afectado;
6. un fallo de infraestructura produce `BLOCKED` cuando impide evaluar el comportamiento, no `PASS`;
7. un fallo funcional produce `FAIL` cuando la infraestructura sí permitió evaluar el comportamiento;
8. una ejecución cancelada o con timeout no certifica la línea base;
9. la recuperación nunca modifica datos reales ni amplía permisos;
10. una corrección del harness no reescribe la evidencia histórica anterior.

#### 28. Estado documental conciliado

| Métrica                                      |                          Resultado |
| -------------------------------------------- | ---------------------------------: |
| Repositorio consumidor                       | **1 — `devVentoGroup/vento-nexo`** |
| Familias compartidas base                    |                              **4** |
| Relaciones CI005 de NEXO                     |                              **4** |
| Relaciones CI006 de NEXO                     |                              **4** |
| Superficies funcionales comunes obligatorias |                             **12** |
| Perfiles de familia                          |                              **4** |
| Auto-merge autorizado                        |                              **0** |
| Auto-deploy autorizado                       |                              **0** |
| Migraciones Supabase autorizadas en NEXO     |                              **0** |
| Datos productivos autorizados para pruebas   |                              **0** |
| Requisitos de prueba creados o modificados   |                              **0** |

#### 29. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA
**Requisitos creados:** **0**
**Requisitos modificados:** **0**

**Justificación:** la obligación de probar cada consumidor antes de adoptar packages compartidos, disponer de comandos reproducibles, conservar evidencia atribuible y bloquear resultados ambiguos ya existe en el registro canónico. CI007 especializa esas obligaciones para NEXO y define su habilitador reutilizable; no introduce una regla empresarial independiente que requiera una nueva fila del registro.

#### 30. Cobertura de prueba vigente reutilizada

La tarea reutiliza sin modificar, entre otras, estas obligaciones existentes:

- `TREQ-SHELL-005`, sobre comandos reproducibles y ausencia de falsos verdes;
- `TREQ-SHELL-006`, sobre pruebas propias, matriz de compatibilidad y validación por consumidor antes de publicar o adoptar;
- `TREQ-SHELL-008`, sobre requisitos afectados y resultados reproducibles por package y PR;
- `TREQ-SHELL-009`, sobre identidad verificable de repositorio, commit y ambiente;
- los requisitos NEXO vigentes que gobiernan clasificación física, inventario, logística, remisiones, autorización, trazabilidad y operación y que sean tocados por el perfil ejecutado.

Estas referencias son trazabilidad de cobertura existente y no constituyen una modificación del registro 04A.

#### 31. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                                                                                                     |
| --------- | -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | El marcador documental no instala dependencias, no ejecuta build de NEXO y no materializa el harness.                                                                                                                                                                                                                                         |
| LOCAL     | NOT_EXECUTED   | El artefacto todavía no ha sido incorporado ni validado por el checkout local del usuario.                                                                                                                                                                                                                                                    |
| REMOTA    | PASS           | Se verificaron la continuidad CI006→CI007→CI008, la topología `GLOBAL_ENABLE_ONCE`, el estado `VERIFIED` de CI006, las cuatro relaciones package–NEXO, el manifest remoto de NEXO, su árbol actual, las superficies de inventario/logística/autorización, la ausencia observada de suite automatizada y la cobertura de requisitos existente. |
| OPERATIVA | NOT_EXECUTED   | No se ejecutaron flujos reales de inventario, remisiones, kiosk, impresión, Supabase ni datos.                                                                                                                                                                                                                                                |
| FÍSICA    | NOT_APPLICABLE | La materialización pertenece a `SHELL-CI-007::GLOBAL` después de aprobación documental y autorización física explícita.                                                                                                                                                                                                                       |

#### 32. Criterios de aceptación

`SHELL-CI-007` queda documentalmente completa cuando:

- identifica `devVentoGroup/vento-nexo` como consumidor propietario de la prueba específica;
- conserva CI006 como propietario del cambio y del PR;
- gobierna exactamente las cuatro relaciones package–NEXO;
- define una unidad de evidencia ligada al commit base, manifest, lockfile, suite, fixtures y entorno;
- exige ejecutar la línea base antes de modificar las versiones objetivo;
- define las doce superficies funcionales comunes;
- define los cuatro perfiles de familia;
- exige caminos permitidos y denegados de autorización;
- protege sede, LOC, sesión y contexto operativo;
- protege stock, movimientos, remisiones, recepción parcial, assets y settings relevantes;
- protege clientes Supabase y RLS sin autorizar cambios de base de datos desde NEXO;
- protege UI, SSR, interacción y accesibilidad cuando corresponda;
- convierte ausencia de suite automatizada en bloqueo físico, no en éxito;
- soporta `INITIAL_ADOPTION` usando el commit base como oráculo de comportamiento;
- soporta conjuntos multi-package sin reducir cobertura;
- invalida evidencia ante cambios materiales;
- produce evidencia consumible por CI006;
- no crea PR, no actualiza packages, no fusiona, no despliega y no ejecuta rollback durante el marcador;
- no crea ni modifica requisitos de prueba.

#### 33. Límites

Esta tarea no:

- implementa físicamente `SHELL-CI-007::GLOBAL`;
- instala un framework de pruebas durante el marcador documental;
- modifica `package.json` o `package-lock.json` de NEXO;
- actualiza `@vento/contracts`, `@vento/os-context`, `@vento/supabase` ni `@vento/ui-web`;
- modifica código funcional de NEXO;
- crea ramas ni pull requests;
- modifica la lógica del actualizador CI006;
- recalcula compatibilidad CI005;
- normaliza todos los comandos del repositorio, responsabilidad de CI016;
- corrige integraciones pendientes de ORIGO o FOGO;
- modifica schema, tablas, RPC, RLS, Storage, Realtime, Edge Functions, datos, secretos o configuración Supabase;
- crea ni modifica migraciones dentro de NEXO;
- usa datos productivos;
- requiere hardware Zebra físico para la autocertificación global;
- ejecuta rollback de CI014;
- coordina despliegue de CI015;
- desarrolla CI008 ni otra tarea posterior;
- crea, modifica, difiere, descarta u obsolete requisitos del registro 04A.

#### 34. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-CI-006 — Crear actualización de consumidores mediante PR`

**TAREA ACTUAL APROBADA**
`SHELL-CI-007 — Probar NEXO antes de actualizar`

**SIGUIENTE TAREA RESERVADA**
`SHELL-CI-008 — Probar FOGO antes de actualizar`


### ✅ SHELL-CI-008 — Probar FOGO antes de actualizar

**Estado:** APROBADA
**Tarea anterior:** SHELL-CI-007 — Probar NEXO antes de actualizar
**Tarea siguiente:** SHELL-CI-009 — Probar ORIGO antes de actualizar
**Tipo de tarea:** Habilitador global único — contrato documental de pruebas específicas de FOGO previas a actualización de packages compartidos
**Bloque:** BLOQUE T — CI, pruebas, despliegue y rollback base
**Repositorio propietario:** `devVentoGroup/vento-fogo`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/T_CALIDAD_Y_DESPLIEGUE/02_PRUEBAS_DE_CONSUMIDORES_Y_ROLLBACK.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada el contrato de pruebas que deberá demostrar que **FOGO conserva una línea base reproducible, íntegra y atribuible antes de modificar su conjunto de packages compartidos**, de modo que una actualización preparada por CI006 nunca utilice como punto de partida un consumidor ya roto, no probado, ambiguo o con evidencia perteneciente a otro commit.

La regla vinculante queda:

```text
FOGO EN UN COMMIT BASE EXACTO
+ MANIFEST Y LOCKFILE EXACTOS
+ ENTORNO DE PRUEBA IDENTIFICADO
+ RELACIÓN PACKAGE–FOGO EXACTA
+ PERFIL DE PRUEBAS FOGO APLICABLE
+ PRUEBAS FUNCIONALES Y DE AUTORIZACIÓN SATISFACTORIAS
+ EVIDENCIA VIGENTE
= LÍNEA BASE FOGO APTA PARA INICIAR UNA PROPUESTA DE ACTUALIZACIÓN
```

Y, de forma fail-closed:

```text
LINT VERDE
O BUILD VERDE
O COMPATIBILIDAD DE OTRO CONSUMIDOR
O PRUEBAS DE OTRO COMMIT
O EXISTENCIA DE UNA RELEASE
O AUSENCIA DE TESTS AUTOMATIZADOS
≠ LÍNEA BASE FOGO CERTIFICADA
```

CI008 certifica la línea base específica de FOGO. No publica packages, no modifica la versión objetivo, no prepara el pull request, no fusiona, no despliega y no ejecuta rollback.

#### 2. Resultado canónico

`SHELL-CI-008` establece un único habilitador reutilizable para:

1. identificar el commit base exacto de `devVentoGroup/vento-fogo` que se pretende actualizar;
2. fijar las identidades del manifest, lockfile, configuración y entorno que participaron en la prueba;
3. seleccionar únicamente las relaciones package–FOGO aplicables;
4. seleccionar el perfil FOGO correspondiente a cada familia compartida objetivo;
5. ejecutar una línea base común de instalación, análisis, tipos, build y pruebas automatizadas;
6. proteger la identidad y autorización de las nueve páginas de la línea base FOGO y del handler técnico de exportación de recetas;
7. proteger administración de recetas, recipe book operacional y separación entre edición y consulta;
8. proteger producto, sede, área, rendimiento, porción, ingredientes, unidades, pasos, salidas y estados de receta que formen parte del comportamiento vigente;
9. proteger la creación de lotes desde recetas publicadas, incluida validación de cantidad, contexto, destino, ingredientes, empaques, salidas y modo de producción aplicable;
10. proteger autorización de lectura y creación de lotes, incluida revalidación server-side y firma de actor cuando corresponda a dispositivo compartido;
11. proteger la consulta de lotes, cantidades esperadas y producidas, consumos, destinos, empaques, estados y desviaciones visibles;
12. proteger la frontera por la cual FOGO conserva recetas, BOM, ejecución y rendimiento, mientras NEXO conserva inventario/logística, ORIGO conserva compras y Shell conserva contratos, datos y Supabase;
13. probar clientes, consultas, RPC y denegaciones Supabase sin autorizar migraciones ni cambios remotos desde FOGO;
14. probar render, hidratación, interacción, accesibilidad y exportación representativa cuando la familia objetivo sea UI;
15. producir evidencia machine-readable ligada al commit base y al conjunto exacto de pruebas;
16. invalidar la evidencia cuando cambie cualquiera de sus entradas materiales;
17. bloquear una actualización cuando no exista infraestructura de prueba suficiente;
18. entregar a CI006 un resultado de línea base consumible para comparar el comportamiento previo y el `proposal_commit` posterior;
19. soportar una actualización multi-package mediante la unión de perfiles requeridos, sin reducir cobertura;
20. autocertificar el habilitador global una sola vez antes de reutilizarlo en futuras actualizaciones de FOGO.

#### 3. Frontera de responsabilidad

| Responsabilidad                                              | Propietario         |
| ------------------------------------------------------------ | ------------------- |
| pruebas propias del package                                  | `SHELL-CI-001`      |
| artefacto distribuible del package                           | `SHELL-CI-002`      |
| identidad y publicación de release                           | `SHELL-CI-003`      |
| changelog y release notes                                    | `SHELL-CI-004`      |
| compatibilidad package–consumidor                            | `SHELL-CI-005`      |
| preparación y mantenimiento del PR consumidor                | `SHELL-CI-006`      |
| línea base y pruebas específicas de NEXO antes de actualizar | `SHELL-CI-007`      |
| línea base y pruebas específicas de FOGO antes de actualizar | `SHELL-CI-008`      |
| pruebas específicas de ORIGO                                 | `SHELL-CI-009`      |
| pruebas específicas de PULSO                                 | `SHELL-CI-010`      |
| pruebas específicas de VISO                                  | `SHELL-CI-011`      |
| pruebas específicas de NUMERA                                | `SHELL-CI-012`      |
| pruebas específicas de ANIMA                                 | `SHELL-CI-013`      |
| rollback por repositorio                                     | `SHELL-CI-014`      |
| independencia de despliegue                                  | `SHELL-CI-015`      |
| normalización de comandos de prueba por repositorio          | `SHELL-CI-016`      |
| trazabilidad de requisitos y evidencia por PR                | `SHELL-CI-017..019` |

CI008 puede exigir un punto de entrada reproducible para ejecutar su propia suite, pero no absorbe la normalización transversal de comandos reservada a CI016.

#### 4. Topología de trabajo

`PHASE-03-T-CI-FOUNDATION` aplica `GLOBAL_ENABLE_ONCE` a `SHELL-CI-008`.

Por tanto:

```text
MARCADOR CANÓNICO
SHELL-CI-008
→ define una sola vez el contrato de pruebas previas de FOGO

INSTANCIA FÍSICA FUTURA
SHELL-CI-008::GLOBAL
→ materializa y autocertifica una sola vez el habilitador FOGO

ACTUALIZACIONES POSTERIORES DE FOGO
→ reutilizan el habilitador certificado
→ generan evidencia nueva por commit base y conjunto objetivo
→ no vuelven a implementar CI008
```

La instancia global puede utilizar fixtures, dobles, snapshots y entornos locales o CI aislados. No necesita actualizar un package real ni ejecutar producción real para demostrar el funcionamiento del habilitador.

#### 5. Handoff vinculante desde CI006 y CI007

CI006 ya materializó el actualizador común y conserva las 28 relaciones base, los dieciséis `PKG-GATE-*`, la invalidación por commit y la prohibición de auto-merge y auto-deploy.

CI007 ya definió y materializó la semántica de línea base previa para NEXO. CI008 conserva esa disciplina de identidad, evidencia, fail-closed, invalidación y separación de responsabilidades, pero reemplaza las superficies NEXO por las superficies propias de FOGO.

CI008 entrega a CI006 únicamente la evidencia específica de FOGO que le corresponde.

La secuencia lógica será:

```text
RELEASE OBJETIVO CONOCIDA
→ RELACIÓN PACKAGE–FOGO RESUELTA
→ COMMIT BASE FOGO FIJADO
→ CI008 CERTIFICA LA LÍNEA BASE DEL COMMIT BASE
→ CI006 MATERIALIZA LA PROPUESTA AISLADA
→ CI006 EJECUTA O CONSUME LOS GATES SOBRE EL PROPOSAL COMMIT
→ SE COMPARA CON LA LÍNEA BASE VIGENTE
→ REVISIÓN HUMANA
```

Un `PASS` de CI008 no sustituye CI005 ni autoriza por sí mismo `ELIGIBLE`, `READY_FOR_REVIEW`, merge, despliegue o adopción.

#### 6. Relaciones package–FOGO gobernadas

CI008 gobierna exactamente las cuatro combinaciones FOGO de la matriz web base:

| Familia             | Compatibilidad CI005 | Actualización CI006 | Consumidor   |
| ------------------- | -------------------- | ------------------- | ------------ |
| `@vento/contracts`  | `PKG-COMP-MX-004`    | `PKG-PR-REL-004`    | `vento-fogo` |
| `@vento/os-context` | `PKG-COMP-MX-011`    | `PKG-PR-REL-011`    | `vento-fogo` |
| `@vento/supabase`   | `PKG-COMP-MX-018`    | `PKG-PR-REL-018`    | `vento-fogo` |
| `@vento/ui-web`     | `PKG-COMP-MX-025`    | `PKG-PR-REL-025`    | `vento-fogo` |

**Conciliación:** 4 relaciones FOGO esperadas, 4 materializadas en el contrato, 0 faltantes y 0 duplicadas.

Ninguna evidencia de NEXO, ORIGO, PULSO, VISO, NUMERA, SHELL o ANIMA satisface estas cuatro relaciones.

#### 7. Línea base física observada de FOGO

En el corte remoto inspeccionado de `devVentoGroup/vento-fogo`:

- la rama principal es `main`;
- el commit remoto observado es `b6b9ed00e5267cabaac1a5a1090d93d5f60e86f2`;
- existe `package-lock.json` y el repositorio es una aplicación Next privada;
- el manifest declara `lint` y `build`;
- el manifest no declara un script de pruebas automatizadas;
- el manifest no declara un script dedicado de typecheck;
- no se confirmó una suite `test/spec` ni un framework de pruebas automatizadas ya materializado;
- no se declaran todavía dependencias publicadas `@vento/*` en el manifest observado;
- se observan Next `^16.2.4`, React `19.2.3`, React DOM `19.2.3`, Supabase JS `^2.90.1`, Supabase SSR `^0.8.0` y `@react-pdf/renderer` `^4.5.1`;
- el inventario fuente contiene exactamente nueve archivos de página: `/`, `/login`, `/no-access`, `/production-batches`, `/production-batches/new`, `/recipe-book`, `/recipes`, `/recipes/[id]/edit` y `/recipes/new`;
- existe además el handler técnico `GET /recipes/pdf`, separado del inventario de pantallas;
- se observan Auth/SSO, guardas, permisos, contexto operativo, role override y firma de actor para dispositivo compartido;
- se observan administración de recetas, recipe book operacional, ingredientes, unidades, pasos, salidas, lotes de producción y exportación PDF;
- la creación vigente de lotes consume recetas publicadas, sede, área, LOCs, rutas de producción, ingredientes, empaques, salidas y firma de actor cuando aplica;
- la consulta vigente de lotes consume cantidades producidas/esperadas, consumos, rutas, destinos, empaques, costos y estados;
- se observan clientes Supabase browser/server y RPC de producción;
- FOGO no es propietario de inventario/LOCs ni de compras: consume esas fronteras y conserva recetas, BOM, ejecución y rendimiento;
- cualquier modificación futura de schema, RPC, RLS, Storage, Realtime, Edge Functions, datos o configuración Supabase permanece propiedad de `devVentoGroup/vento-shell`.

Conclusión documental: **FOGO todavía no puede considerarse físicamente certificado para CI008 por la sola existencia de lint y build**. La futura `SHELL-CI-008::GLOBAL` deberá materializar la infraestructura de pruebas automatizadas que falta y autocertificarla.

#### 8. Unidad exacta de certificación previa

Cada resultado de CI008 se atribuye como mínimo a:

```text
consumer_repository
consumer_branch
consumer_base_commit
consumer_manifest_identity
consumer_lockfile_identity
test_contract_identity
test_suite_identity
fixture_set_identity
environment_identity
runtime_identity
framework_identity
target_package_set
compatibility_refs
fogo_profile_set
execution_identity
started_at
completed_at
result
invalidation_reason
```

La unidad certificada es el **commit base sin la actualización propuesta**.

Cambiar el commit, manifest, lockfile, suite, fixtures, configuración, entorno o perfil invalida la reutilización del resultado anterior.

#### 9. Momento de ejecución

La prueba previa debe ejecutarse después de conocer el conjunto objetivo y antes de materializar la actualización sobre FOGO.

Orden obligatorio:

1. resolver release o conjunto mínimo cerrado de releases objetivo;
2. resolver una o más de las cuatro relaciones FOGO;
3. fijar `consumer_base_commit`;
4. fijar manifest y lockfile del commit base;
5. resolver los perfiles FOGO exigidos por las familias objetivo;
6. ejecutar la línea base común y los perfiles seleccionados sin cambiar versiones de packages;
7. consolidar la evidencia;
8. solo con resultado satisfactorio permitir que CI006 continúe con la preparación aislada de la propuesta.

Si durante la prueba cambia el commit base, la ejecución en curso deja de ser atribuible y debe reiniciarse sobre la nueva identidad.

#### 10. Semántica de resultado

CI008 reutiliza la semántica fail-closed aprobada para los gates:

- `PENDING`;
- `RUNNING`;
- `PASS`;
- `FAIL`;
- `BLOCKED`;
- `CANCELLED`;
- `TIMED_OUT`;
- `STALE`;
- `NOT_APPLICABLE` únicamente para comprobaciones realmente condicionales y justificadas.

Para declarar la línea base FOGO apta se requiere `PASS` global.

No satisfacen el contrato:

- suite ausente;
- cero tests ejecutados cuando existan superficies obligatorias;
- tests deshabilitados;
- salida ambigua;
- `SKIPPED` no justificado;
- snapshots actualizados automáticamente para forzar verde;
- mocks que eliminen la condición que se pretendía probar;
- `NOT_APPLICABLE` en una comprobación obligatoria;
- un resultado de otro commit;
- un resultado de otro consumidor.

#### 11. Línea base técnica común

Toda certificación previa de FOGO deberá demostrar, sobre el mismo commit base:

1. instalación bloqueada reproducible con el lockfile vigente;
2. manifest y lockfile coherentes;
3. lint o análisis estático aplicable;
4. typecheck real de TypeScript, aunque la normalización del comando común pertenezca a CI016;
5. build de producción o export aplicable;
6. ejecución de la suite automatizada específica de FOGO;
7. ausencia de tests omitidos silenciosamente por configuración;
8. identidad del entorno y runtime registrada;
9. evidencia separada por comprobación;
10. resultado global fail-closed.

Un build satisfactorio no sustituye las pruebas automatizadas específicas.

#### 12. Matriz funcional mínima obligatoria de FOGO

La suite global deberá cubrir como mínimo estas doce superficies de comportamiento. La implementación física puede dividir cada superficie en varios tests, pero no eliminarla sin una decisión canónica posterior.

|    # | Superficie                                              | Afirmación positiva mínima                                                                                               | Afirmación negativa o de borde mínima                                                                                                                  |
| ---: | ------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
|    1 | identidad, sesión y permisos                            | una identidad autorizada conserva acceso FOGO y el permiso requerido                                                     | sesión ausente, app no autorizada, permiso ausente o fallo de autorización falla cerrado                                                               |
|    2 | contexto operativo, sede, área y actor                  | sede, área, sesión operativa y actor efectivo limitan la operación al alcance permitido                                  | contexto incompleto, manipulado, override no autorizado o actor no firmado no amplía autoridad                                                         |
|    3 | inventario de rutas y acceso                            | las nueve páginas y el handler técnico conservan identidad, clasificación y protección                                   | una ruta nueva/ausente, acceso directo indebido, duplicado o handler tratado como pantalla queda bloqueado                                             |
|    4 | administración de recetas                               | listar, crear y editar conserva identidad de producto, sede, área y estado aplicable                                     | dato inválido, actor sin permiso o acceso fuera de contexto no produce una receta válida                                                               |
|    5 | estructura, unidades e ingredientes de receta           | rendimiento, porción, ingredientes, cantidades y unidades compatibles conservan cálculo determinista                     | unidad incompatible, cantidad inválida, referencia inexistente o conversión implícita no produce éxito aparente                                        |
|    6 | pasos, salidas y publicación de receta                  | pasos y salidas permanecen vinculados a la receta y una receta publicada es consumible por las superficies operativas    | receta no publicada, retirada o inconsistente no se normaliza como receta apta para producción                                                         |
|    7 | recipe book operacional                                 | el recetario presenta recetas y cantidades operativas bajo autorización y contexto aplicables                            | la vista operacional no concede edición, publicación ni acceso a fórmulas fuera del alcance autorizado                                                 |
|    8 | creación de lote de producción                          | una receta publicada válida puede producir un lote con cantidad, ingredientes, salidas y destino coherentes              | cantidad no positiva, receta no publicada, falta de ingredientes, empaque incoherente, destino obligatorio ausente o actor sin permiso queda bloqueado |
|    9 | rutas de producción, destino, empaques y modo de salida | ruta, LOC, posición, empaques y modo de salida aplicables se conservan de forma atribuible                               | una ruta ajena, destino incompatible, empaque que no concilia o modo no reconocido no puede producir una decisión silenciosamente válida               |
|   10 | lotes, consumos, rendimiento y trazabilidad             | listado e historia conservan cantidades, consumos, estados, costos, destino, empaque y desviación observable             | lote duplicado, consumo incoherente, resultado no atribuible o estado imposible no se presenta como cierre válido                                      |
|   11 | integración y fronteras de dominio                      | FOGO consume inventario/LOCs, compras y contratos compartidos sin apropiarse de responsabilidades de NEXO, ORIGO o Shell | FOGO no convierte inventario, compras o cambios Supabase en autoridad local por conveniencia                                                           |
|   12 | UI, SSR, interacción, accesibilidad y exportación       | recetas, recetario, lotes, formularios y exportación representativa renderizan y conservan interacción y autorización    | hidratación, evento, accesibilidad, exportación o autorización fallida no se normaliza como éxito                                                      |

Estas doce superficies son la línea base común. Los perfiles de familia agregan obligaciones, no las sustituyen.

#### 13. Perfil FOGO para `@vento/contracts`

Cuando la relación objetivo incluya `PKG-PR-REL-004`, la línea base deberá cubrir especialmente:

- tipos y estructuras consumidas por recetas, recipe book y lotes;
- identidades de producto, receta, sede, área, LOC, ruta y lote;
- cantidades, unidades, rendimiento, porción, empaques, salidas y consumos;
- estados de receta, lote y empaque realmente consumidos;
- serialización y deserialización de payloads operativos;
- límites entre dato ausente, `null`, inválido y denegado;
- compilación de los puntos de consumo TypeScript;
- comportamiento de adaptadores locales que consuman contratos compartidos;
- ausencia de casts globales o fallbacks que oculten una incompatibilidad.

La evidencia se vincula a `PKG-COMP-MX-004` y `PKG-PR-REL-004`.

#### 14. Perfil FOGO para `@vento/os-context`

Cuando la relación objetivo incluya `PKG-PR-REL-011`, la línea base deberá cubrir especialmente:

- sesión real y sesión ausente;
- acceso a la aplicación FOGO;
- contexto operativo por sede y área;
- permiso concedido y permiso denegado;
- contexto incompleto o manipulado;
- navegación y acceso a superficies protegidas;
- fronteras server/client y propagación de sesión;
- role override únicamente cuando el contrato lo permita;
- firma de actor en dispositivo compartido cuando la acción lo requiera;
- preservación de razones de denegación;
- prohibición de elevar autoridad desde valores controlados por cliente.

La evidencia se vincula a `PKG-COMP-MX-011` y `PKG-PR-REL-011`.

#### 15. Perfil FOGO para `@vento/supabase`

Cuando la relación objetivo incluya `PKG-PR-REL-018`, la línea base deberá cubrir especialmente:

- creación y uso de clientes browser y server;
- propagación de sesión y cookies aplicable;
- tipos y shapes de respuesta consumidos por FOGO;
- consultas sobre recetas, ingredientes, pasos, salidas, lotes, consumos, productos, sedes, áreas, LOCs y rutas de producción realmente utilizadas;
- RPC `has_permission` y RPC de creación de lote real cuando formen parte del escenario;
- operaciones permitidas dentro del alcance autorizado;
- operaciones denegadas por permisos o RLS;
- ausencia de service-role o credenciales privilegiadas en cliente o fixtures;
- aislamiento de datos entre sedes o áreas cuando el contrato lo exija;
- ausencia de bypass provocado por wrapper, fallback o manejo de errores;
- correspondencia entre schema de prueba y fuente canónica de `vento-shell`.

Las pruebas de RLS o schema que requieran base de datos deberán usar un entorno local o CI aislado derivado de la fuente canónica de `vento-shell`. La falta de ese entorno cuando la comprobación sea obligatoria produce `BLOCKED`, no `NOT_APPLICABLE`.

La evidencia se vincula a `PKG-COMP-MX-018` y `PKG-PR-REL-018`.

#### 16. Perfil FOGO para `@vento/ui-web`

Cuando la relación objetivo incluya `PKG-PR-REL-025`, la línea base deberá cubrir especialmente:

- render servidor y cliente de superficies representativas;
- hidratación sin divergencias silenciosas;
- formularios de receta y producción;
- navegación, tablas, filtros, estados vacíos y estados de denegación;
- eventos de usuario y feedback de éxito/error;
- foco, teclado y semántica accesible aplicable;
- integración de tokens y estilos sin degradar legibilidad u operación;
- comportamiento de loading, error y deny states;
- ausencia de imports privados o acoplamiento a una implementación no contractual;
- smoke controlado de `/recipes/pdf` sin requerir impresora ni dispositivo físico productivo.

La evidencia se vincula a `PKG-COMP-MX-025` y `PKG-PR-REL-025`.

#### 17. Protección reforzada de recetas y recipe book

La receta es una superficie crítica de FOGO y deberá permanecer cubierta en toda ejecución en la que el cambio compartido pueda afectar tipos, contexto, Supabase o UI.

Cobertura mínima:

1. identidad de producto de salida;
2. sede y área aplicables;
3. rendimiento y unidad;
4. porción y unidad cuando aplique;
5. ingredientes y cantidades;
6. compatibilidad de unidades;
7. pasos ordenados;
8. salidas adicionales cuando existan;
9. estado de receta;
10. lectura de recipe book;
11. separación entre capacidad de consulta y capacidad de administración;
12. rechazo de receta no apta para iniciar producción;
13. exportación de recetas bajo autorización;
14. preservación de identidad y contenido ante relectura;
15. comportamiento determinista del escalamiento aplicable.

CI008 protege la conducta existente y las invariantes vigentes; no implementa por anticipado funcionalidades de versionado, planificación, calidad, inocuidad o trazabilidad productiva cuya materialización pertenezca a tareas propietarias posteriores.

#### 18. Protección reforzada de producción, autorización y dispositivo compartido

La creación de lotes no se considera cubierta si solo se prueba que la página renderiza.

Deberá demostrarse, según aplicabilidad:

- acceso permitido a recipe book con `production.recipe_book.view`;
- lectura de lotes con `production.batches.view`;
- creación efectiva únicamente cuando `production.batches.create` resulte autorizada para sede y área;
- receta publicada, con sede y área, antes de crear lote;
- cantidad producida positiva;
- ingredientes reales presentes;
- destino requerido cuando el modo de salida lo exija;
- conciliación entre rendimiento real y empaques cuando aplique;
- salidas válidas y cantidades positivas;
- firma de actor cuando el contexto de dispositivo compartido lo requiera;
- ausencia de escalamiento por parámetros de formulario o cliente;
- fallo cerrado ante error de autorización;
- llamada al contrato de producción únicamente después de validar el escenario;
- ausencia de exposición de secretos o credenciales privilegiadas en evidencia.

Un mock que siempre autorice o que elimine las condiciones de receta, contexto, cantidad, destino o firma no satisface estas pruebas.

#### 19. Datos, fixtures y aislamiento

Las pruebas de CI008 deberán cumplir simultáneamente:

1. no leer ni modificar datos productivos;
2. usar fixtures deterministas o un entorno local/CI aislado;
3. no depender de IDs aleatorios no registrados como parte de la ejecución;
4. limpiar o descartar estado temporal de forma reproducible;
5. no compartir estado mutable entre tests que deba permanecer independiente;
6. no utilizar credenciales reales como fixture;
7. no introducir una migración FOGO para acomodar la prueba;
8. cuando se necesite schema Supabase, consumir la fuente canónica de `vento-shell`;
9. registrar versión o identidad del fixture set;
10. impedir que una falla de cleanup convierta el resultado en `PASS`;
11. no disparar producción, inventario, compras o movimientos productivos reales;
12. no depender de una impresora física para la autocertificación global.

#### 20. Línea base antes de `INITIAL_ADOPTION`

El manifest observado de FOGO no declara todavía packages publicados `@vento/*`.

Por tanto, la primera adopción futura de cualquiera de las cuatro familias deberá tratar la evidencia CI008 como **oráculo del comportamiento previo**:

```text
COMMIT BASE SIN EL PACKAGE COMPARTIDO
→ CI008 PASS
→ PROPUESTA INITIAL_ADOPTION
→ MISMA COBERTURA ESENCIAL SOBRE PROPOSAL COMMIT
→ COMPARACIÓN DE RESULTADOS
```

La ausencia actual del package no convierte sus pruebas específicas en no aplicables: CI008 protege el comportamiento que la adopción pretende preservar.

#### 21. Actualizaciones `PATCH`, `MINOR`, `MAJOR`, seguridad y deprecación

CI008 no sustituye las clases de actualización de CI006, pero ajusta la selección de escenarios:

- `PATCH_UPDATE`: ejecuta línea base completa y regresión focal del defecto o superficie afectada;
- `MINOR_UPDATE`: añade escenarios para la nueva capacidad consumida sin retirar la línea base vigente;
- `MAJOR_UPDATE`: exige línea base completa y una matriz explícita de comportamiento que cambiará, se preservará o migrará;
- `SECURITY_UPDATE`: mantiene pruebas de autorización, contexto, firma de actor, RLS, denegación y rollback; la urgencia no permite omitirlas;
- `DEPRECATION_MIGRATION`: mantiene pruebas de superficie antigua mientras siga soportada y prueba la ruta objetivo cuando exista;
- `ROLLBACK_UPDATE`: CI008 puede aportar línea base, pero la ejecución y certificación de rollback pertenece a CI014.

#### 22. Actualización multi-package

Cuando CI006 resuelva un conjunto mínimo cerrado con más de una familia compartida:

1. CI008 selecciona la unión de todos los perfiles correspondientes;
2. ninguna familia reduce la cobertura exigida por otra;
3. las doce superficies comunes permanecen;
4. una sola ejecución puede producir evidencia para el conjunto si todas las identidades se conservan juntas;
5. el conjunto objetivo queda registrado en la evidencia;
6. cambiar una sola versión objetivo invalida la evidencia dependiente;
7. no se usa lockstep artificial para incluir familias no requeridas.

#### 23. Evidencia consumible por CI006

La evidencia satisfactoria deberá permitir a CI006 demostrar al menos:

- repositorio consumidor exacto: `devVentoGroup/vento-fogo`;
- commit base exacto;
- manifest y lockfile exactos;
- relación o relaciones FOGO aplicables;
- conjunto de packages objetivo conocido;
- referencias de compatibilidad CI005 aplicables;
- perfil o perfiles FOGO ejecutados;
- identidad de la suite y fixtures;
- identidad del entorno;
- resultados por capa y superficie;
- total de tests ejecutados, aprobados, fallidos y omitidos;
- evidencia de caminos denegados aplicables;
- evidencia de rutas/páginas y handler técnico aplicables;
- started/completed timestamps;
- resultado global;
- razón de bloqueo o invalidación cuando no sea `PASS`.

La evidencia podrá formar parte de `validation_results` y `evidence_refs` del expediente `PKG-PR-*`, pero CI008 no crea ni mantiene ese expediente.

#### 24. Invalidación obligatoria

El resultado pasa a `STALE` cuando cambia materialmente cualquiera de estas entradas antes de que CI006 la consuma:

- `consumer_base_commit`;
- manifest;
- lockfile;
- configuración de build, TypeScript o test;
- suite de pruebas;
- fixtures u oracles;
- variables o configuración del entorno relevantes;
- runtime o framework relevante;
- fuente de schema usada para pruebas Supabase;
- inventario de rutas FOGO;
- contrato de autorización o contexto consumido por la suite;
- relación package–FOGO;
- versión o conjunto objetivo;
- referencia de compatibilidad CI005;
- superficie marcada como obligatoria;
- contrato de CI008.

No se conserva un `PASS` anterior mediante rebase, cherry-pick, cambio de fixture o actualización de snapshot sin nueva ejecución atribuible.

#### 25. Condiciones de bloqueo

La futura ejecución deberá quedar `BLOCKED` o `FAIL` según corresponda cuando ocurra cualquiera de estas condiciones:

1. no existe un runner o punto de entrada reproducible para las pruebas FOGO;
2. el runner ejecuta cero tests obligatorios;
3. falta la identidad del commit base;
4. manifest o lockfile no corresponden al commit base;
5. la suite fue modificada después de producir la evidencia;
6. existe un test obligatorio omitido sin justificación válida;
7. lint, typecheck o build obligatorio falla;
8. una prueba funcional obligatoria falla;
9. una prueba de denegación, autorización, contexto o firma de actor falla;
10. se requiere prueba de RLS y no existe entorno aislado válido;
11. el entorno apunta a datos o servicios productivos;
12. un fixture contiene una credencial real;
13. la evidencia CI005 pertenece a otra versión, artefacto o consumidor;
14. la relación resuelta no corresponde a FOGO;
15. se intenta modificar packages antes de cerrar la línea base;
16. se intenta resolver el fallo mediante bypass, cast global, skip o snapshot forzado;
17. una operación de prueba intenta crear o cambiar schema, RLS, RPC, datos o configuración remota desde FOGO;
18. la suite atribuye a FOGO inventario/LOCs, compras o gobierno Supabase que pertenecen a NEXO, ORIGO o Shell;
19. una receta no publicada o una cantidad inválida puede alcanzar la creación de lote como éxito;
20. una ruta protegida o `/recipes/pdf` omite el control de acceso exigido;
21. resultados contradictorios o flaky no han sido explicados y estabilizados.

Ninguna aprobación humana convierte estas condiciones técnicas en `PASS`.

#### 26. Materialización futura de `SHELL-CI-008::GLOBAL`

La instancia física solo podrá declararse materializada cuando, dentro del alcance expresamente autorizado:

1. exista una infraestructura de pruebas automatizadas reproducible en `devVentoGroup/vento-fogo`;
2. exista un punto de entrada determinista para ejecutar la suite CI008;
3. las pruebas cubran las doce superficies comunes;
4. existan perfiles seleccionables para las cuatro familias compartidas;
5. existan casos permitidos y denegados de autorización;
6. exista cobertura de las nueve páginas y del handler técnico aplicable;
7. exista estrategia aislada para las pruebas que requieran Supabase;
8. la suite no use datos productivos ni secretos reales;
9. las pruebas no modifiquen schema ni migraciones de FOGO;
10. la identidad de commit, manifest, lockfile, suite, fixtures y entorno forme parte de la evidencia;
11. un cambio material vuelva `STALE` la evidencia;
12. una ejecución multi-package una perfiles sin reducir cobertura;
13. la salida sea machine-readable y consumible por CI006;
14. la suite falle de forma demostrable ante al menos una ruptura sintética por cada perfil de familia;
15. la suite demuestre que evidencia de otro consumidor o commit no es reutilizable;
16. la suite demuestre que una ausencia de tests no se normaliza a `PASS`;
17. la autocertificación no actualice un package real, no abra PR, no despliegue y no ejecute rollback;
18. la autocertificación no ejecute producción, inventario, compra, impresión o mutación Supabase productiva.

La selección física concreta de framework, archivos de configuración y devDependencies se resolverá durante la instancia con el estado actualizado de FOGO. El contrato no impone un proveedor inexistente por inferencia.

#### 27. Recuperación e idempotencia

Reglas:

1. una repetición exacta sobre las mismas entradas puede reproducir la misma decisión sin duplicar identidad lógica;
2. los intentos fallidos se conservan como evidencia, no se borran al obtener un verde posterior;
3. un test flaky no se resuelve reintentando hasta pasar sin registrar la intermitencia;
4. si cambia el commit base, se crea una ejecución nueva;
5. si cambia el conjunto objetivo, se recalculan los perfiles y se ejecuta nuevamente lo afectado;
6. un fallo de infraestructura produce `BLOCKED` cuando impide evaluar el comportamiento, no `PASS`;
7. un fallo funcional produce `FAIL` cuando la infraestructura sí permitió evaluar el comportamiento;
8. una ejecución cancelada o con timeout no certifica la línea base;
9. la recuperación nunca modifica datos reales ni amplía permisos;
10. una corrección del harness no reescribe la evidencia histórica anterior.

#### 28. Estado documental conciliado

| Métrica                                      |                          Resultado |
| -------------------------------------------- | ---------------------------------: |
| Repositorio consumidor                       | **1 — `devVentoGroup/vento-fogo`** |
| Familias compartidas base                    |                              **4** |
| Relaciones CI005 de FOGO                     |                              **4** |
| Relaciones CI006 de FOGO                     |                              **4** |
| Páginas de la línea base FOGO                |                              **9** |
| Handlers técnicos FOGO observados            |                              **1** |
| Superficies funcionales comunes obligatorias |                             **12** |
| Perfiles de familia                          |                              **4** |
| Auto-merge autorizado                        |                              **0** |
| Auto-deploy autorizado                       |                              **0** |
| Migraciones Supabase autorizadas en FOGO     |                              **0** |
| Datos productivos autorizados para pruebas   |                              **0** |
| Requisitos de prueba creados o modificados   |                              **0** |

#### 29. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA
**Requisitos creados:** **0**
**Requisitos modificados:** **0**

**Justificación:** la obligación de probar cada consumidor antes de adoptar packages compartidos, disponer de comandos reproducibles, conservar evidencia atribuible y bloquear resultados ambiguos ya existe en el registro canónico. La cobertura FOGO vigente ya protege ciclo productivo, recetas, autorización, rutas, handler técnico, identidad de evidencia y fronteras operativas. CI008 especializa esas obligaciones para la línea base previa de FOGO y define su habilitador reutilizable; no introduce una regla empresarial independiente que requiera una nueva fila del registro.

#### 30. Cobertura de prueba vigente reutilizada

La tarea reutiliza sin modificar, entre otras, estas obligaciones existentes:

- `TREQ-SHELL-005`, sobre comandos reproducibles y ausencia de falsos verdes;
- `TREQ-SHELL-006`, sobre pruebas propias, matriz de compatibilidad y validación por consumidor antes de publicar o adoptar;
- `TREQ-SHELL-008`, sobre requisitos afectados y resultados reproducibles por package y PR;
- `TREQ-SHELL-009`, sobre identidad verificable de repositorio, commit y ambiente;
- `TREQ-FOGO-001`, sobre ciclo productivo y efectos auditables;
- `TREQ-FOGO-002`, sobre receta publicada, identidad, unidades y comportamiento reproducible;
- `TREQ-FOGO-004`, sobre ejecución productiva, rendimiento, merma, controles, empaque y cierre;
- `TREQ-FOGO-005` a `TREQ-FOGO-024`, sobre inventario de rutas, autorización, handler técnico, identidad de evidencia, dispositivo compartido y separación entre aplicaciones.

Estas referencias son trazabilidad de cobertura existente y no constituyen una modificación del registro 04A.

#### 31. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                                                                                                                        |
| --------- | -------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | El marcador documental no instala dependencias, no ejecuta build de FOGO y no materializa el harness.                                                                                                                                                                                                                                                            |
| LOCAL     | NOT_EXECUTED   | El artefacto todavía no ha sido incorporado ni validado por el checkout local del usuario.                                                                                                                                                                                                                                                                       |
| REMOTA    | PASS           | Se verificaron continuidad CI007→CI008→CI009, topología `GLOBAL_ENABLE_ONCE`, relaciones package–FOGO, manifest y lockfile existentes, commit remoto observado, manifest de FOGO, árbol de archivos, nueve páginas, handler `/recipes/pdf`, Auth/SSO, permisos, contexto operativo, recipe book, recetas, lotes, clientes Supabase y cobertura 04A FOGO vigente. |
| OPERATIVA | NOT_EXECUTED   | No se ejecutaron flujos reales de recetas, producción, inventario, compras, PDF, Supabase ni datos.                                                                                                                                                                                                                                                              |
| FÍSICA    | NOT_APPLICABLE | La materialización pertenece a `SHELL-CI-008::GLOBAL` después de aprobación documental y autorización física explícita.                                                                                                                                                                                                                                          |

#### 32. Criterios de aceptación

`SHELL-CI-008` queda documentalmente completa cuando:

- identifica `devVentoGroup/vento-fogo` como consumidor propietario de la prueba específica;
- conserva CI006 como propietario del cambio y del PR;
- conserva CI007 como precedente de disciplina de línea base sin reutilizar evidencia NEXO;
- gobierna exactamente las cuatro relaciones package–FOGO;
- define una unidad de evidencia ligada al commit base, manifest, lockfile, suite, fixtures y entorno;
- exige ejecutar la línea base antes de modificar las versiones objetivo;
- define las doce superficies funcionales comunes;
- define los cuatro perfiles de familia;
- protege las nueve páginas y el handler técnico de exportación;
- exige caminos permitidos y denegados de autorización;
- protege sede, área, sesión, actor efectivo y firma de dispositivo compartido cuando aplique;
- protege recetas, recipe book, ingredientes, unidades, pasos, salidas y lotes relevantes;
- protege clientes Supabase y RLS sin autorizar cambios de base de datos desde FOGO;
- protege UI, SSR, interacción, accesibilidad y exportación cuando corresponda;
- convierte ausencia de suite automatizada en bloqueo físico, no en éxito;
- soporta `INITIAL_ADOPTION` usando el commit base como oráculo de comportamiento;
- soporta conjuntos multi-package sin reducir cobertura;
- invalida evidencia ante cambios materiales;
- produce evidencia consumible por CI006;
- conserva las fronteras FOGO–NEXO–ORIGO–Shell;
- no crea PR, no actualiza packages, no fusiona, no despliega y no ejecuta rollback durante el marcador;
- no crea ni modifica requisitos de prueba.

#### 33. Límites

Esta tarea no:

- implementa físicamente `SHELL-CI-008::GLOBAL`;
- instala un framework de pruebas durante el marcador documental;
- modifica `package.json` o `package-lock.json` de FOGO;
- actualiza `@vento/contracts`, `@vento/os-context`, `@vento/supabase` ni `@vento/ui-web`;
- modifica código funcional de FOGO;
- crea ramas ni pull requests;
- modifica la lógica del actualizador CI006;
- recalcula compatibilidad CI005;
- reutiliza evidencia de CI007 como si perteneciera a FOGO;
- normaliza todos los comandos del repositorio, responsabilidad de CI016;
- implementa planificación productiva, calidad, inocuidad, costeo, etiquetas o sinergias futuras cuya propiedad corresponda a tareas posteriores;
- convierte FOGO en propietario de inventario/LOCs de NEXO ni de compras de ORIGO;
- modifica schema, tablas, RPC, RLS, Storage, Realtime, Edge Functions, datos, secretos o configuración Supabase;
- crea ni modifica migraciones dentro de FOGO;
- usa datos productivos;
- requiere impresora física para la autocertificación global;
- ejecuta rollback de CI014;
- coordina despliegue de CI015;
- desarrolla CI009 ni otra tarea posterior;
- crea, modifica, difiere, descarta u obsolete requisitos del registro 04A.

#### 34. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-CI-007 — Probar NEXO antes de actualizar`

**TAREA ACTUAL APROBADA**
`SHELL-CI-008 — Probar FOGO antes de actualizar`

**SIGUIENTE TAREA RESERVADA**
`SHELL-CI-009 — Probar ORIGO antes de actualizar`


### ✅ SHELL-CI-009 — Probar ORIGO antes de actualizar

**Estado:** APROBADA
**Tarea anterior:** SHELL-CI-008 — Probar FOGO antes de actualizar
**Tarea siguiente:** SHELL-CI-010 — Probar PULSO antes de actualizar
**Tipo de tarea:** Habilitador global único — contrato documental de pruebas específicas de ORIGO previas a actualización de packages compartidos
**Bloque:** BLOQUE T — CI, pruebas, despliegue y rollback base
**Repositorio propietario:** `devVentoGroup/vento-origo`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/T_CALIDAD_Y_DESPLIEGUE/02_PRUEBAS_DE_CONSUMIDORES_Y_ROLLBACK.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada el contrato de pruebas que deberá demostrar que **ORIGO conserva una línea base reproducible, íntegra, atribuible y fail-closed antes de modificar su conjunto de packages compartidos**, de modo que una actualización preparada por CI006 nunca parta de un consumidor ambiguo, de evidencia perteneciente a otro commit, de una ruta no inventariada o de una ejecución que haya mutado navegación, Supabase o datos durante la propia certificación.

La regla vinculante queda:

```text
ORIGO EN UN COMMIT BASE EXACTO
+ MANIFEST Y LOCKFILE EXACTOS
+ INVENTARIO DE 13 PÁGINAS Y 1 HANDLER CONCILIADO
+ ENTORNO DE PRUEBA AISLADO
+ RELACIÓN PACKAGE–ORIGO EXACTA
+ PERFIL DE PRUEBAS ORIGO APLICABLE
+ PRUEBAS FUNCIONALES, DE AUTORIZACIÓN Y DE FRONTERA SATISFACTORIAS
+ EVIDENCIA VIGENTE
= LÍNEA BASE ORIGO APTA PARA INICIAR UNA PROPUESTA DE ACTUALIZACIÓN
```

Y, de forma fail-closed:

```text
LINT VERDE
O BUILD VERDE
O NAVEGACIÓN SIN ERROR
O COMPATIBILIDAD DE OTRO CONSUMIDOR
O PRUEBAS DE OTRO COMMIT
O EXISTENCIA DE UNA RELEASE
O AUSENCIA DE TESTS AUTOMATIZADOS
O BUILD QUE MUTÓ SUPABASE DURANTE LA PRUEBA
≠ LÍNEA BASE ORIGO CERTIFICADA
```

CI009 certifica la línea base específica de ORIGO. No publica packages, no modifica la versión objetivo, no prepara el pull request, no fusiona, no despliega, no ejecuta rollback y no convierte la autocertificación del habilitador en una afirmación de cumplimiento integral de todos los requisitos ORIGO todavía planificados.

#### 2. Resultado canónico

`SHELL-CI-009` establece un único habilitador reutilizable para:

1. identificar el commit base exacto de `devVentoGroup/vento-origo` que se pretende actualizar;
2. fijar las identidades del manifest, lockfile, configuración, suite, fixtures y entorno;
3. seleccionar únicamente las relaciones package–ORIGO aplicables;
4. seleccionar el perfil ORIGO correspondiente a cada familia compartida objetivo;
5. ejecutar una línea base técnica reproducible sin activar escrituras de navegación ni efectos remotos por `prebuild`;
6. proteger el inventario exacto de trece páginas y el handler técnico de PDF;
7. detectar drift entre las trece páginas fuente, las doce rutas sincronizables y las cuatro candidatas de menú;
8. proteger identidad, sesión, acceso ORIGO, sede, contexto operacional y autorización por recurso;
9. proteger proveedores, asociaciones producto–proveedor, presentaciones y revisión de maestro de productos;
10. proteger creación, consulta, edición, envío y eliminación permitida de órdenes de compra según estado y autoridad aplicable;
11. proteger cantidades, presentación, equivalencia a unidad de stock, costo unitario y total de líneas de compra;
12. proteger el documento PDF de orden, su handler técnico, el token firmado y el uso condicionado de service role;
13. proteger recepciones contra duplicación, replay, efectos parciales, correcciones destructivas y pérdida de trazabilidad;
14. proteger modalidades de recepción, relación con orden de compra, sede, LOC, posición, lote, vencimiento, costos y movimientos aplicables;
15. proteger la frontera por la cual ORIGO conserva abastecimiento, proveedores, órdenes y recepción, mientras NEXO conserva inventario/LOC como dominio logístico, FOGO conserva producción y Shell conserva contratos, datos y Supabase;
16. probar clientes, consultas, RPC y denegaciones Supabase sin autorizar migraciones ni cambios remotos desde ORIGO;
17. probar render, hidratación, interacción, accesibilidad, formularios y exportación representativa cuando la familia objetivo sea UI;
18. producir evidencia machine-readable ligada al commit base y al conjunto exacto de pruebas;
19. invalidar la evidencia cuando cambie cualquiera de sus entradas materiales;
20. bloquear una actualización cuando no exista infraestructura de prueba suficiente;
21. entregar a CI006 un resultado de línea base consumible para comparar el comportamiento previo y el `proposal_commit` posterior;
22. soportar una actualización multi-package mediante la unión de perfiles requeridos, sin reducir cobertura;
23. autocertificar el habilitador global una sola vez antes de reutilizarlo en futuras actualizaciones de ORIGO;
24. separar la certificación del habilitador de la certificación funcional del consumidor para impedir que un harness correcto oculte una deuda funcional conocida.

#### 3. Frontera de responsabilidad

| Responsabilidad                                               | Propietario         |
| ------------------------------------------------------------- | ------------------- |
| pruebas propias del package                                   | `SHELL-CI-001`      |
| artefacto distribuible del package                            | `SHELL-CI-002`      |
| identidad y publicación de release                            | `SHELL-CI-003`      |
| changelog y release notes                                     | `SHELL-CI-004`      |
| compatibilidad package–consumidor                             | `SHELL-CI-005`      |
| preparación y mantenimiento del PR consumidor                 | `SHELL-CI-006`      |
| línea base y pruebas específicas de NEXO antes de actualizar  | `SHELL-CI-007`      |
| línea base y pruebas específicas de FOGO antes de actualizar  | `SHELL-CI-008`      |
| línea base y pruebas específicas de ORIGO antes de actualizar | `SHELL-CI-009`      |
| pruebas específicas de PULSO                                  | `SHELL-CI-010`      |
| pruebas específicas de VISO                                   | `SHELL-CI-011`      |
| pruebas específicas de NUMERA                                 | `SHELL-CI-012`      |
| pruebas específicas de ANIMA                                  | `SHELL-CI-013`      |
| rollback por repositorio                                      | `SHELL-CI-014`      |
| independencia de despliegue                                   | `SHELL-CI-015`      |
| normalización transversal de comandos                         | `SHELL-CI-016`      |
| trazabilidad de requisitos y evidencia por PR                 | `SHELL-CI-017..019` |

CI009 puede exigir un punto de entrada reproducible para su propia suite y un build aislado que no ejecute el `prebuild` mutante de ORIGO. No absorbe la normalización transversal de comandos reservada a CI016 ni la corrección funcional de requisitos ORIGO cuyo owner ya esté asignado.

#### 4. Topología de trabajo

`PHASE-03-T-CI-FOUNDATION` aplica `GLOBAL_ENABLE_ONCE` a `SHELL-CI-009`.

Por tanto:

```text
MARCADOR CANÓNICO
SHELL-CI-009
→ define una sola vez el contrato de pruebas previas de ORIGO

INSTANCIA FÍSICA FUTURA
SHELL-CI-009::GLOBAL
→ materializa y autocertifica una sola vez el habilitador ORIGO

ACTUALIZACIONES POSTERIORES DE ORIGO
→ reutilizan el habilitador certificado
→ generan evidencia nueva por commit base y conjunto objetivo
→ no vuelven a implementar CI009
```

La instancia global puede utilizar fixtures, dobles, oracles sintéticos y entornos locales o CI aislados. No necesita actualizar un package real, abrir PR, ejecutar una compra real ni mutar Supabase para demostrar que el habilitador funciona.

#### 5. Handoff vinculante desde CI006, CI007 y CI008

CI006 ya materializó el actualizador común y conserva las 28 relaciones base, los gates de actualización, la invalidación por commit y la prohibición de auto-merge y auto-deploy.

CI007 y CI008 ya establecieron la disciplina común para líneas base previas de consumidor:

- identidad exacta;
- evidencia atribuible;
- semántica fail-closed;
- invalidación por cambios materiales;
- separación entre habilitador global y ejecución por actualización;
- prohibición de reutilizar evidencia de otro consumidor;
- ausencia de tests distinta de PASS.

CI009 conserva esa disciplina, pero sustituye las superficies NEXO y FOGO por las superficies propias de ORIGO.

La secuencia lógica será:

```text
RELEASE OBJETIVO CONOCIDA
→ RELACIÓN PACKAGE–ORIGO RESUELTA
→ COMMIT BASE ORIGO FIJADO
→ CI009 CERTIFICA LA LÍNEA BASE DEL COMMIT BASE
→ CI006 MATERIALIZA LA PROPUESTA AISLADA
→ CI006 EJECUTA O CONSUME LOS GATES SOBRE EL PROPOSAL COMMIT
→ SE COMPARA CON LA LÍNEA BASE VIGENTE
→ REVISIÓN HUMANA
```

Un `PASS` de CI009 no sustituye CI005 ni autoriza por sí mismo `ELIGIBLE`, `READY_FOR_REVIEW`, merge, despliegue o adopción.

#### 6. Relaciones package–ORIGO gobernadas

CI009 gobierna exactamente las cuatro combinaciones ORIGO de la matriz web base:

| Familia             | Compatibilidad CI005 | Actualización CI006 | Consumidor    |
| ------------------- | -------------------- | ------------------- | ------------- |
| `@vento/contracts`  | `PKG-COMP-MX-005`    | `PKG-PR-REL-005`    | `vento-origo` |
| `@vento/os-context` | `PKG-COMP-MX-012`    | `PKG-PR-REL-012`    | `vento-origo` |
| `@vento/supabase`   | `PKG-COMP-MX-019`    | `PKG-PR-REL-019`    | `vento-origo` |
| `@vento/ui-web`     | `PKG-COMP-MX-026`    | `PKG-PR-REL-026`    | `vento-origo` |

**Conciliación:** 4 relaciones ORIGO esperadas, 4 materializadas en el contrato, 0 faltantes y 0 duplicadas.

Ninguna evidencia de NEXO, FOGO, PULSO, VISO, NUMERA, SHELL o ANIMA satisface estas cuatro relaciones.

#### 7. Línea base física observada de ORIGO

En el corte remoto inspeccionado de `devVentoGroup/vento-origo`:

- la rama principal es `main`;
- el commit remoto observado es `b7a8303fa078ef087f522b6c99059ababfc27472`;
- existe `package-lock.json` y el repositorio es una aplicación Next privada;
- el manifest declara `lint`, `build`, `prebuild` y `sync:navigation`;
- el manifest no declara un script de pruebas automatizadas;
- el manifest no declara un script dedicado de typecheck;
- no se confirmó una suite `test/spec` materializada en el árbol observado;
- no se declaran todavía dependencias publicadas `@vento/*` en el manifest observado;
- se observan Next `^16.2.1`, React `19.2.3`, React DOM `19.2.3`, Supabase JS `^2.90.1` y Supabase SSR `^0.8.0`;
- el inventario fuente contiene exactamente trece archivos de página;
- existen exactamente tres patrones de página con segmento dinámico `[id]`;
- existe el handler técnico `GET /purchase-orders/[id]/pdf`, separado del inventario de páginas;
- `sync-navigation.mjs` excluye la raíz `/` del conjunto que sincroniza, por lo que la línea base distingue trece páginas fuente de doce rutas sincronizables;
- la navegación define cuatro candidatas de menú: `/purchase-orders`, `/receipts`, `/suppliers` y `/product-master-review`;
- se observan Auth/SSO, guardas, contexto operacional, permisos, role override y firma de actor compartido;
- se observan órdenes de compra, proveedores, recepciones, revisión de maestro de producto, presentaciones y normalización de unidades;
- las acciones de órdenes consumen productos, perfiles de UOM, asociaciones producto–proveedor, costos, estados y líneas;
- el código observado permite edición solo sobre órdenes `draft` y contiene una eliminación de borradores restringida por rol;
- la recepción materializa superficies de orden, proveedor, sede, LOC, posición, lote, vencimiento, costos, corrección y firma de actor;
- el middleware protege páginas ordinarias y deriva el PDF público al handler para su autorización;
- el handler PDF separa acceso por token de acceso autenticado y solo crea el cliente service-role en el camino de token válido;
- el helper actual del token PDF conserva un fallback de desarrollo para el secreto, hallazgo ya cubierto por requisitos ORIGO existentes y no normalizable como seguridad satisfactoria;
- `prebuild` ejecuta `sync-navigation.mjs`;
- `sync-navigation.mjs` carga `.env.local` o `.env`, exige URL Supabase y una service-role key, ejecuta `upsert_app_screen_registry` y actualiza `app_screen_registry`;
- por tanto, el `build` ordinario no es una operación de prueba puramente local ni puede utilizarse sin control dentro de la autocertificación CI009;
- cualquier modificación de schema, RPC, RLS, Storage, Realtime, Edge Functions, datos o configuración Supabase permanece propiedad de `devVentoGroup/vento-shell`.

Conclusión documental: **ORIGO todavía no puede considerarse físicamente certificado para CI009 por la sola existencia de lint y build**. La futura `SHELL-CI-009::GLOBAL` deberá materializar la infraestructura de pruebas automatizadas, disponer de un build CI seguro que no active `sync-navigation` y autocertificar el habilitador.

#### 8. Inventario contractual de rutas ORIGO

La línea base fuente de CI009 queda fijada en estas trece páginas:

1. `/`;
2. `/login`;
3. `/no-access`;
4. `/product-master-review`;
5. `/purchase-orders`;
6. `/purchase-orders/new`;
7. `/purchase-orders/[id]`;
8. `/purchase-orders/[id]/edit`;
9. `/receipts`;
10. `/receipts/new`;
11. `/suppliers`;
12. `/suppliers/new`;
13. `/suppliers/[id]/edit`.

Patrones dinámicos de página:

1. `/purchase-orders/[id]`;
2. `/purchase-orders/[id]/edit`;
3. `/suppliers/[id]/edit`.

Handler técnico separado:

```text
GET /purchase-orders/[id]/pdf
```

Conciliación de navegación:

```text
13 páginas fuente
- 1 raíz excluida deliberadamente por sync-navigation
= 12 rutas sincronizables

4 candidatas de menú:
- /purchase-orders
- /receipts
- /suppliers
- /product-master-review
```

Layouts, componentes, server actions, helpers, loading states y route handlers no se contabilizan como páginas.

Cualquier alta, baja, movimiento, duplicación o cambio de patrón frente a estas cardinalidades vuelve stale la evidencia que dependa del inventario.

#### 9. Distinción entre habilitador certificado y consumidor conforme

CI009 fija dos afirmaciones diferentes que nunca podrán fusionarse:

```text
SHELL-CI-009::GLOBAL = VERIFIED
```

significa:

- existe el harness;
- el harness es reproducible;
- detecta sus escenarios positivos y negativos;
- detecta drift, stale evidence, otro consumidor, cero tests, secretos y falsas condiciones de PASS;
- produce evidencia machine-readable;
- no requiere mutaciones productivas.

No significa:

```text
EL COMMIT ACTUAL DE ORIGO CUMPLE TODOS LOS TREQ-ORIGO-*
```

La conformidad del consumidor se determina en cada ejecución real de línea base contra su commit exacto.

Por tanto, una deuda funcional o de seguridad existente puede coexistir con un habilitador correctamente autocertificado. Cuando esa deuda sea aplicable al perfil ejecutado, la ejecución real deberá devolver `FAIL` o `BLOCKED` y conservar la evidencia hasta que el owner canónico la resuelva.

Esta separación evita dos errores:

1. bloquear para siempre la materialización del harness porque el consumidor aún tiene trabajo planificado;
2. declarar al consumidor correcto solamente porque el harness se autocertificó.

#### 10. Unidad exacta de certificación previa

Cada resultado de CI009 se atribuye como mínimo a:

```text
consumer_repository
consumer_branch
consumer_base_commit
consumer_manifest_identity
consumer_lockfile_identity
test_contract_identity
test_suite_identity
fixture_set_identity
route_inventory_identity
source_contract_identity
environment_identity
runtime_identity
framework_identity
target_package_set
compatibility_refs
origo_profile_set
execution_identity
started_at
completed_at
result
invalidation_reason
```

La unidad certificada es el **commit base sin la actualización propuesta**.

Cambiar commit, manifest, lockfile, suite, fixtures, inventario, configuración, source contracts, entorno o perfil invalida la reutilización del resultado anterior.

#### 11. Momento de ejecución

La prueba previa debe ejecutarse después de conocer el conjunto objetivo y antes de materializar la actualización sobre ORIGO.

Orden obligatorio:

1. resolver release o conjunto mínimo cerrado de releases objetivo;
2. resolver una o más de las cuatro relaciones ORIGO;
3. fijar `consumer_base_commit`;
4. fijar manifest y lockfile del commit base;
5. fijar inventario de rutas y source contracts aplicables;
6. resolver los perfiles ORIGO exigidos por las familias objetivo;
7. ejecutar la línea base común y los perfiles seleccionados sin cambiar versiones de packages;
8. consolidar la evidencia;
9. solo con resultado satisfactorio permitir que CI006 continúe con la preparación aislada de la propuesta.

Si durante la prueba cambia el commit base, la ejecución en curso deja de ser atribuible y debe reiniciarse sobre la nueva identidad.

#### 12. Semántica de resultado

CI009 reutiliza la semántica fail-closed aprobada:

- `PENDING`;
- `RUNNING`;
- `PASS`;
- `FAIL`;
- `BLOCKED`;
- `CANCELLED`;
- `TIMED_OUT`;
- `STALE`;
- `NOT_APPLICABLE` únicamente para comprobaciones realmente condicionales y justificadas.

Para declarar una línea base ORIGO apta se requiere `PASS` global de las comprobaciones obligatorias seleccionadas.

No satisfacen el contrato:

- suite ausente;
- cero tests ejecutados;
- tests obligatorios deshabilitados;
- salida ambigua;
- `SKIPPED` no justificado;
- snapshots actualizados automáticamente para forzar verde;
- mocks que eliminen la condición que se pretendía probar;
- build que active sincronización de navegación o escritura remota;
- `NOT_APPLICABLE` en una comprobación obligatoria;
- evidencia de otro commit;
- evidencia de otro consumidor;
- omisión de una ruta o handler exigido por la línea base;
- deuda crítica aplicable convertida manualmente en PASS.

#### 13. Línea base técnica común y build seguro

Toda certificación previa de ORIGO deberá demostrar, sobre el mismo commit base:

1. instalación bloqueada reproducible con el lockfile vigente;
2. manifest y lockfile coherentes;
3. lint o análisis estático aplicable;
4. typecheck real de TypeScript;
5. build de producción o export aplicable;
6. ejecución de la suite automatizada específica de ORIGO;
7. ausencia de tests omitidos silenciosamente;
8. identidad del entorno y runtime registrada;
9. evidencia separada por comprobación;
10. resultado global fail-closed;
11. ausencia de escrituras Supabase provocadas por la propia validación técnica;
12. inventario de rutas y source contracts conciliados.

El build usado por CI009 deberá **evitar el `prebuild` que ejecuta `sync-navigation.mjs`**. La implementación física podrá añadir un punto de entrada dedicado o ejecutar directamente la herramienta de build aplicable, pero deberá demostrar que el camino escogido no invoca el sincronizador.

Queda prohibido considerar segura una validación que:

- carga service-role para registrar navegación;
- ejecuta RPC de sincronización;
- actualiza `app_screen_registry`;
- depende de conectarse a un proyecto remoto solo para compilar;
- altera datos antes de producir el resultado de línea base.

#### 14. Matriz funcional mínima obligatoria de ORIGO

La suite global deberá cubrir como mínimo estas doce superficies de comportamiento. La implementación física puede dividir cada superficie en varios tests, pero no eliminarla sin una decisión canónica posterior.

|    # | Superficie                                        | Afirmación positiva mínima                                                                                | Afirmación negativa o de borde mínima                                                                 |
| ---: | ------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
|    1 | identidad, sesión y acceso ORIGO                  | una identidad válida conserva sesión y acceso requerido a ORIGO                                           | sesión ausente, auth error o app no autorizada falla cerrado                                          |
|    2 | contexto operativo, sede, actor y recurso         | sede, contexto y autoridad efectiva limitan la operación al recurso permitido                             | cambiar sede, `id`, query param, override o actor no concede autoridad                                |
|    3 | inventario de rutas y navegación                  | 13 páginas, 3 patrones dinámicos, 1 handler, 12 sincronizables y 4 candidatas de menú conservan identidad | alta, baja, duplicado, handler contado como página o drift silencioso bloquea                         |
|    4 | proveedores y relación comercial                  | proveedor, relación producto–proveedor y datos comerciales permanecen atribuibles                         | proveedor inexistente, inactivo, duplicado o relación ajena no se normaliza como válida               |
|    5 | maestro de producto, presentación y UOM           | producto, presentación, unidad, equivalencia y asociación con proveedor son coherentes                    | presentación ajena, unidad incompatible, factor no positivo o producto no elegible falla              |
|    6 | orden de compra y líneas                          | una orden válida conserva proveedor, sede, líneas, cantidad, costo, presentación y total                  | orden sin proveedor/sede, línea inválida, cantidad no positiva o producto no asociado falla           |
|    7 | estados, edición y autorización de orden          | transición y mutación respetan estado y autoridad aplicables                                              | edición fuera de borrador, transición inválida, eliminación no autorizada o recurso ajeno falla       |
|    8 | PDF, token y privilegio de servicio               | acceso autenticado o token válido producen el documento aplicable sin ampliar autoridad                   | token inválido, secreto ausente/inseguro, token de otra orden o service-role anticipado falla         |
|    9 | recepción y modalidad                             | una recepción válida conserva modalidad, orden aplicable, proveedor, sede, líneas y destino               | recepción duplicada, modalidad incoherente, cantidad inválida o contexto insuficiente falla           |
|   10 | atomicidad, idempotencia, corrección y costos     | efectos de recepción permanecen atribuibles, idempotentes y reconciliables                                | replay, efecto parcial, doble costo, doble stock o reversa sin reemplazo no produce éxito aparente    |
|   11 | integración y fronteras de dominio                | ORIGO consume inventario/LOC y contratos compartidos sin apropiarse de NEXO, FOGO o Shell                 | ORIGO no convierte inventario, producción o gobierno Supabase en autoridad local por conveniencia     |
|   12 | UI, SSR, interacción, accesibilidad y exportación | listas, formularios, detalles, denegaciones y PDF representativos renderizan y conservan interacción      | hidratación, formulario, accesibilidad, exportación o autorización fallida no se normaliza como éxito |

Estas doce superficies son la línea base común. Los perfiles de familia agregan obligaciones, no las sustituyen.

#### 15. Perfil ORIGO para `@vento/contracts`

Cuando la relación objetivo incluya `PKG-PR-REL-005`, la línea base deberá cubrir especialmente:

- tipos y estructuras consumidas por proveedor, orden, línea, recepción y maestro de producto;
- identidades de proveedor, producto, presentación, orden, línea, recepción, sede, LOC y posición;
- cantidades, unidades, factores de conversión, costos, impuestos, totales y moneda aplicables;
- estados de orden y recepción realmente consumidos;
- serialización y deserialización de payloads operativos;
- límites entre dato ausente, `null`, inválido, denegado y no aplicable;
- compilación de los puntos de consumo TypeScript;
- comportamiento de adaptadores locales que consuman contratos compartidos;
- ausencia de casts globales o fallbacks que oculten una incompatibilidad.

La evidencia se vincula a `PKG-COMP-MX-005` y `PKG-PR-REL-005`.

#### 16. Perfil ORIGO para `@vento/os-context`

Cuando la relación objetivo incluya `PKG-PR-REL-012`, la línea base deberá cubrir especialmente:

- sesión real y sesión ausente;
- acceso a la aplicación ORIGO;
- contexto operativo por sede y área cuando aplique;
- permiso concedido y permiso denegado;
- contexto incompleto o manipulado;
- acceso directo a rutas dinámicas;
- revalidación de recurso por `id`;
- fronteras server/client;
- role override únicamente cuando el contrato lo permita;
- firma de actor en dispositivo compartido cuando la acción lo requiera;
- preservación de razones de denegación;
- prohibición de elevar autoridad desde valores controlados por cliente.

La evidencia se vincula a `PKG-COMP-MX-012` y `PKG-PR-REL-012`.

#### 17. Perfil ORIGO para `@vento/supabase`

Cuando la relación objetivo incluya `PKG-PR-REL-019`, la línea base deberá cubrir especialmente:

- clientes browser y server;
- propagación de sesión y cookies;
- tipos y shapes de respuesta consumidos;
- consultas sobre proveedores, asociaciones producto–proveedor, perfiles UOM, productos, órdenes, líneas, recepciones, sedes, LOC y posiciones realmente utilizadas;
- RPC o funciones de autorización aplicables;
- operaciones permitidas dentro del alcance autorizado;
- operaciones denegadas por permisos o RLS;
- aislamiento territorial aplicable;
- ausencia de service-role en cliente o fixtures;
- creación de service-role únicamente en un camino explícitamente autorizado;
- prohibición de sincronizar navegación durante el build de certificación;
- correspondencia entre schema de prueba y fuente canónica de `vento-shell`;
- ausencia de bypass por wrapper, fallback o manejo de errores.

Las pruebas que requieran base de datos deberán usar un entorno local o CI aislado derivado de la fuente canónica de `vento-shell`. La falta de ese entorno cuando la comprobación sea obligatoria produce `BLOCKED`, no `NOT_APPLICABLE`.

La evidencia se vincula a `PKG-COMP-MX-019` y `PKG-PR-REL-019`.

#### 18. Perfil ORIGO para `@vento/ui-web`

Cuando la relación objetivo incluya `PKG-PR-REL-026`, la línea base deberá cubrir especialmente:

- render servidor y cliente de superficies representativas;
- hidratación sin divergencias silenciosas;
- formularios de proveedor, orden y recepción;
- navegación, tablas, filtros, estados vacíos y denegaciones;
- rutas dinámicas y detalle de orden;
- eventos de usuario y feedback de éxito/error;
- foco, teclado y semántica accesible aplicable;
- integración de tokens y estilos sin degradar legibilidad u operación;
- loading, error y deny states;
- ausencia de imports privados no contractuales;
- smoke controlado de `GET /purchase-orders/[id]/pdf` sin requerir impresión física.

La evidencia se vincula a `PKG-COMP-MX-026` y `PKG-PR-REL-026`.

#### 19. Protección reforzada de proveedores y maestro de producto

La cobertura de proveedor no puede reducirse a que `/suppliers` renderice.

Según aplicabilidad, la línea base deberá conservar:

1. identidad estable del proveedor;
2. estado aplicable;
3. edición ligada al mismo `[id]`;
4. relación producto–proveedor;
5. producto activo y elegible;
6. presentación aprobada;
7. unidad de entrada;
8. equivalencia a unidad de stock;
9. costos de entrada y stock cuando existan;
10. separación entre proveedor, relación comercial, presentación y producto;
11. revisión de maestro de producto como superficie administrativa distinta;
12. rechazo de asociaciones o presentaciones que no correspondan al proveedor/producto seleccionado.

CI009 no implementa el modelo TO-BE completo de contratos, ofertas, vigencias, Storage ni scoring de proveedor; protege las invariantes aplicables a la línea base y asegura que futuras actualizaciones de fundación compartida no degraden las superficies vigentes.

#### 20. Protección reforzada de órdenes de compra

La orden de compra deberá conservar pruebas representativas de:

- proveedor requerido;
- sede requerida;
- al menos una línea válida;
- producto elegible;
- asociación producto–proveedor;
- presentación perteneciente al producto;
- factor de conversión positivo;
- cantidad positiva;
- costo y total calculables;
- estado inicial y transiciones aplicables;
- edición condicionada por estado;
- autoridad aplicable a eliminación de borrador;
- detalle y edición sobre el mismo recurso dinámico;
- generación de referencia y documento;
- rechazo de transición o mutación fuera de alcance.

La suite deberá diferenciar:

```text
PRUEBA DE COMPORTAMIENTO VIGENTE
≠
CERTIFICACIÓN DE QUE TODO EL FLUJO TO-BE DE ABASTECIMIENTO YA ESTÁ IMPLEMENTADO
```

Las obligaciones todavía planificadas conservan sus owners existentes y no se consideran cumplidas por CI009.

#### 21. Protección reforzada de recepciones

La recepción es una superficie crítica porque puede afectar órdenes, inventario y costos a través de integraciones.

La línea base deberá poder evaluar, según el commit y perfil aplicables:

- recepción vinculada a orden;
- recepción directa cuando esté permitida;
- proveedor y sede;
- producto y presentación;
- cantidad recibida;
- unidad y equivalencia;
- LOC y posición;
- lote y vencimiento cuando aplique;
- costos;
- firma de actor cuando corresponda;
- corrección;
- replay;
- identidad de la operación;
- cantidades recibidas de la orden;
- estados resultantes;
- efectos de inventario/costo únicamente en un entorno aislado.

La suite no deberá simular idempotencia eliminando la repetición del escenario. Debe poder demostrar que una misma clave o identidad lógica no produce dos recepciones ni dobla efectos cuando ese contrato esté materializado.

Cuando la implementación actual todavía no satisfaga una obligación crítica ya registrada, la ejecución real se clasifica `FAIL` o `BLOCKED`; no se redefine el requisito para obtener verde.

#### 22. Protección reforzada del PDF público y secretos

El handler `GET /purchase-orders/[id]/pdf` es una superficie técnica y de seguridad separada de las trece páginas.

La cobertura deberá distinguir dos caminos:

```text
TOKEN VÁLIDO APLICABLE A LA ORDEN
→ acceso público controlado
→ service-role solo después de validar token

SIN TOKEN VÁLIDO
→ sesión requerida
→ acceso ORIGO requerido
→ denegación cerrada cuando no corresponde
```

La suite deberá cubrir, según aplicabilidad:

- token vacío;
- token malformado;
- token expirado;
- token de otra orden;
- firma inválida;
- ausencia de secreto obligatorio;
- secreto inseguro o fallback prohibido;
- creación prematura de service-role;
- sesión ausente sin token válido;
- acceso ORIGO denegado;
- orden inexistente;
- exportación válida.

El helper físico observado conserva un fallback de desarrollo para el secreto. Ese hallazgo ya está gobernado por requisitos ORIGO existentes y **no crea un requisito nuevo en CI009**.

La autocertificación global del habilitador podrá demostrar sintéticamente que la política detecta el fallback. Una ejecución real sobre un commit que siga incumpliendo la regla aplicable no podrá declararse PASS por el hecho de que el harness esté VERIFIED.

#### 23. Datos, fixtures y aislamiento

Las pruebas de CI009 deberán cumplir simultáneamente:

1. no leer ni modificar datos productivos;
2. usar fixtures deterministas o entorno local/CI aislado;
3. no depender de IDs aleatorios no registrados;
4. limpiar o descartar estado temporal de forma reproducible;
5. no compartir estado mutable entre tests independientes;
6. no utilizar credenciales reales como fixture;
7. no introducir una migración ORIGO para acomodar la prueba;
8. cuando se necesite schema Supabase, consumir la fuente canónica de `vento-shell`;
9. registrar identidad del fixture set;
10. impedir que una falla de cleanup convierta el resultado en PASS;
11. no ejecutar `sync-navigation.mjs` contra un proyecto remoto;
12. no crear órdenes, recepciones, proveedores, movimientos, costos o registros de navegación productivos;
13. no depender de impresora física;
14. no utilizar service-role real en autocertificación sintética;
15. separar fixtures de compra, recepción y autorización para evitar contaminación entre escenarios.

#### 24. Línea base antes de `INITIAL_ADOPTION`

El manifest observado de ORIGO no declara todavía packages publicados `@vento/*`.

Por tanto, la primera adopción futura de cualquiera de las cuatro familias deberá tratar la evidencia CI009 como **oráculo del comportamiento previo**:

```text
COMMIT BASE SIN EL PACKAGE COMPARTIDO
→ CI009 PASS
→ PROPUESTA INITIAL_ADOPTION
→ MISMA COBERTURA ESENCIAL SOBRE PROPOSAL COMMIT
→ COMPARACIÓN DE RESULTADOS
```

La ausencia actual del package no convierte sus pruebas específicas en no aplicables.

#### 25. Actualizaciones `PATCH`, `MINOR`, `MAJOR`, seguridad y deprecación

CI009 no sustituye las clases de actualización de CI006:

- `PATCH_UPDATE`: línea base completa y regresión focal;
- `MINOR_UPDATE`: añade escenarios para la nueva capacidad consumida;
- `MAJOR_UPDATE`: exige línea base completa y matriz explícita de comportamiento preservado/cambiado;
- `SECURITY_UPDATE`: mantiene autorización, token, service-role, RLS, denegación e IDOR; la urgencia no permite omitirlos;
- `DEPRECATION_MIGRATION`: conserva pruebas de la superficie antigua mientras siga soportada y de la ruta objetivo cuando exista;
- `ROLLBACK_UPDATE`: CI009 aporta la línea base; la ejecución y certificación del rollback pertenece a CI014.

#### 26. Actualización multi-package

Cuando CI006 resuelva más de una familia compartida:

1. CI009 selecciona la unión de todos los perfiles correspondientes;
2. ninguna familia reduce la cobertura de otra;
3. las doce superficies comunes permanecen;
4. una ejecución puede producir evidencia para el conjunto si las identidades permanecen unidas;
5. el conjunto objetivo queda registrado;
6. cambiar una sola versión objetivo invalida la evidencia dependiente;
7. no se usa lockstep artificial para incluir familias no requeridas.

#### 27. Evidencia consumible por CI006

La evidencia satisfactoria deberá permitir a CI006 demostrar al menos:

- repositorio consumidor exacto: `devVentoGroup/vento-origo`;
- commit base exacto;
- manifest y lockfile exactos;
- inventario de rutas exacto;
- source contracts exactos;
- relación o relaciones ORIGO aplicables;
- conjunto de packages objetivo;
- referencias de compatibilidad CI005;
- perfil o perfiles ORIGO ejecutados;
- identidad de suite y fixtures;
- identidad del entorno;
- resultados por capa y superficie;
- total de tests ejecutados, aprobados, fallidos y omitidos;
- evidencia de caminos denegados aplicables;
- evidencia de páginas, rutas dinámicas y handler;
- evidencia de que el build no ejecutó sincronización remota;
- started/completed timestamps;
- resultado global;
- razón de bloqueo o invalidación cuando no sea PASS.

La evidencia podrá formar parte de `validation_results` y `evidence_refs` del expediente `PKG-PR-*`, pero CI009 no crea ni mantiene ese expediente.

#### 28. Invalidación obligatoria

El resultado pasa a `STALE` cuando cambia materialmente cualquiera de estas entradas antes de que CI006 la consuma:

- `consumer_base_commit`;
- manifest;
- lockfile;
- configuración de build, TypeScript o test;
- suite;
- fixtures u oracles;
- variables/configuración de entorno relevantes;
- runtime o framework;
- inventario de trece páginas;
- inventario del handler;
- source contracts;
- reglas de sincronización de navegación;
- contrato de token PDF;
- fuente de schema usada para pruebas Supabase;
- contrato de autorización o contexto;
- relación package–ORIGO;
- versión o conjunto objetivo;
- referencia de compatibilidad CI005;
- superficie obligatoria;
- contrato de CI009.

No se conserva un PASS anterior mediante rebase, cherry-pick, actualización de snapshot o cambio de fixture sin nueva ejecución atribuible.

#### 29. Condiciones de bloqueo

La futura ejecución deberá quedar `BLOCKED` o `FAIL` según corresponda cuando ocurra cualquiera de estas condiciones:

1. no existe runner reproducible para pruebas ORIGO;
2. el runner ejecuta cero tests obligatorios;
3. falta identidad del commit base;
4. manifest o lockfile no corresponden al commit;
5. la suite cambió después de producir evidencia;
6. existe un test obligatorio omitido;
7. lint, typecheck o build obligatorio falla;
8. el build de certificación invoca `sync-navigation.mjs`;
9. la prueba intenta escribir `app_screen_registry` u otra superficie remota;
10. una prueba funcional obligatoria falla;
11. una prueba de denegación, autorización, contexto, recurso o IDOR falla;
12. una comprobación de token/service-role aplicable falla;
13. se requiere RLS y no existe entorno aislado válido;
14. el entorno apunta a datos o servicios productivos;
15. un fixture contiene una credencial real;
16. evidencia CI005 pertenece a otra versión o consumidor;
17. la relación resuelta no corresponde a ORIGO;
18. se intenta modificar packages antes de cerrar línea base;
19. se intenta resolver el fallo mediante bypass, cast global, skip o snapshot forzado;
20. una operación de prueba intenta crear o cambiar schema, RLS, RPC, datos o configuración remota desde ORIGO;
21. la suite atribuye a ORIGO inventario/LOC, producción o gobierno Supabase que pertenecen a NEXO, FOGO o Shell;
22. una orden inválida se normaliza como válida;
23. una recepción repetida puede duplicar el mismo efecto lógico cuando la idempotencia sea aplicable;
24. el PDF usa privilegio service-role antes de validar el camino autorizado;
25. el inventario deja de conciliar 13 páginas, 3 dinámicas, 1 handler, 12 sincronizables y 4 candidatas de menú sin delta explícito;
26. resultados contradictorios o flaky no han sido explicados;
27. una deuda crítica conocida se transforma manualmente en PASS.

Ninguna aprobación humana convierte estas condiciones técnicas en PASS.

#### 30. Materialización futura de `SHELL-CI-009::GLOBAL`

La instancia física solo podrá declararse materializada cuando, dentro del alcance expresamente autorizado:

1. exista infraestructura de pruebas automatizadas reproducible en `devVentoGroup/vento-origo`;
2. exista un punto de entrada determinista para la suite CI009;
3. exista un camino de build CI que no ejecute `sync-navigation.mjs`;
4. las pruebas cubran las doce superficies comunes;
5. existan perfiles seleccionables para las cuatro familias;
6. existan casos permitidos y denegados de autorización;
7. exista cobertura de trece páginas, tres patrones dinámicos y un handler;
8. exista validación de las cardinalidades 13/12/4 de navegación;
9. exista estrategia aislada para pruebas Supabase;
10. la suite no use datos productivos ni secretos reales;
11. las pruebas no modifiquen schema ni migraciones ORIGO;
12. identidad de commit, manifest, lockfile, suite, fixtures, rutas, source contracts y entorno forme parte de evidencia;
13. un cambio material vuelva STALE la evidencia;
14. una ejecución multi-package una perfiles sin reducir cobertura;
15. la salida sea machine-readable y consumible por CI006;
16. el habilitador falle sintéticamente ante al menos una ruptura por cada perfil;
17. demuestre que evidencia de otro consumidor o commit no es reutilizable;
18. demuestre que cero tests no se normaliza a PASS;
19. demuestre que drift de rutas no se normaliza a PASS;
20. demuestre que un camino de build mutante no se normaliza a PASS;
21. demuestre que un token inseguro o un uso anticipado de service-role puede ser clasificado como fallo sin usar secretos reales;
22. la autocertificación no actualice packages, no abra PR, no despliegue y no ejecute rollback;
23. la autocertificación no cree órdenes, recepciones, proveedores, navegación ni mutaciones Supabase productivas.

La selección física concreta de framework, archivos y devDependencies se resolverá durante la instancia con el estado actualizado de ORIGO. El contrato no impone un proveedor inexistente por inferencia.

#### 31. Recuperación e idempotencia

Reglas:

1. una repetición exacta sobre las mismas entradas puede reproducir la misma decisión sin duplicar identidad lógica;
2. los intentos fallidos se conservan como evidencia;
3. un test flaky no se resuelve reintentando hasta pasar sin registrar intermitencia;
4. si cambia el commit base, se crea una ejecución nueva;
5. si cambia el conjunto objetivo, se recalculan perfiles;
6. un fallo de infraestructura produce `BLOCKED` cuando impide evaluar comportamiento;
7. un fallo funcional produce `FAIL` cuando la infraestructura sí permitió evaluar;
8. una ejecución cancelada o con timeout no certifica;
9. la recuperación nunca modifica datos reales ni amplía permisos;
10. una corrección del harness no reescribe evidencia histórica;
11. una deuda preexistente del consumidor permanece visible como fallo o bloqueo de esa ejecución y no se borra al autocertificar el habilitador.

#### 32. Estado documental conciliado

| Métrica                                      |                           Resultado |
| -------------------------------------------- | ----------------------------------: |
| Repositorio consumidor                       | **1 — `devVentoGroup/vento-origo`** |
| Familias compartidas base                    |                               **4** |
| Relaciones CI005 de ORIGO                    |                               **4** |
| Relaciones CI006 de ORIGO                    |                               **4** |
| Páginas fuente ORIGO                         |                              **13** |
| Patrones dinámicos de página                 |                               **3** |
| Handlers técnicos observados                 |                               **1** |
| Rutas sincronizables observadas              |                              **12** |
| Candidatas de menú observadas                |                               **4** |
| Superficies funcionales comunes obligatorias |                              **12** |
| Perfiles de familia                          |                               **4** |
| Auto-merge autorizado                        |                               **0** |
| Auto-deploy autorizado                       |                               **0** |
| Migraciones Supabase autorizadas en ORIGO    |                               **0** |
| Datos productivos autorizados para pruebas   |                               **0** |
| Requisitos de prueba creados o modificados   |                               **0** |

#### 33. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA
**Requisitos creados:** **0**
**Requisitos modificados:** **0**

**Justificación:** las obligaciones de probar cada consumidor antes de adoptar packages compartidos, disponer de comandos reproducibles, conservar evidencia atribuible y bloquear falsos verdes ya existen en el registro canónico. La cobertura ORIGO vigente ya protege órdenes, recepción, proveedores, autorización, inventario de rutas, handler PDF, identidad de evidencia y fronteras operativas. CI009 especializa esas obligaciones para la línea base previa de ORIGO y define su habilitador reutilizable; no introduce una regla empresarial independiente.

#### 34. Cobertura de prueba vigente reutilizada

La tarea reutiliza sin modificar, entre otras, estas obligaciones existentes:

- `TREQ-SHELL-005`, sobre comandos reproducibles y ausencia de falsos verdes;
- `TREQ-SHELL-006`, sobre pruebas propias, matriz de compatibilidad y validación por consumidor antes de publicar o adoptar;
- `TREQ-SHELL-008`, sobre requisitos afectados y resultados reproducibles por package y PR;
- `TREQ-SHELL-009`, sobre identidad verificable de repositorio, commit y ambiente;
- `TREQ-ORIGO-001`, sobre modalidad de recepción, duplicación, costos y auditabilidad;
- `TREQ-ORIGO-002`, sobre autorización, alcance de órdenes y token externo firmado sin fallback inseguro;
- `TREQ-ORIGO-003`, sobre atomicidad, idempotencia y reconciliación de recepción;
- `TREQ-ORIGO-004`, sobre identidades y estados separados del ciclo de abastecimiento;
- `TREQ-ORIGO-005`, sobre maestro de proveedores, relaciones comerciales y datos sensibles;
- `TREQ-ORIGO-006` a `TREQ-ORIGO-025`, sobre trece páginas, rutas dinámicas, handler PDF, middleware, autorización, identidad de evidencia, drift, navegación y fronteras de aplicación.

Estas referencias son trazabilidad de cobertura existente y no constituyen una modificación del registro 04A.

#### 35. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                                                                                                                                                     |
| --------- | -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | El marcador documental no instala dependencias, no ejecuta build de ORIGO y no materializa el harness.                                                                                                                                                                                                                                                                                        |
| LOCAL     | NOT_EXECUTED   | El artefacto todavía no ha sido incorporado ni validado por el checkout local del usuario.                                                                                                                                                                                                                                                                                                    |
| REMOTA    | PASS           | Se verificaron continuidad CI008→CI009→CI010, topología `GLOBAL_ENABLE_ONCE`, las cuatro relaciones package–ORIGO, commit remoto observado, manifest y lockfile, árbol completo, trece páginas, tres patrones dinámicos, handler PDF, cuatro candidatas de menú, Auth/guard, órdenes, proveedores, recepciones, clientes Supabase, sincronizador de navegación y cobertura 04A ORIGO vigente. |
| OPERATIVA | NOT_EXECUTED   | No se ejecutaron compras, órdenes, recepciones, PDF, navegación, Supabase ni datos reales.                                                                                                                                                                                                                                                                                                    |
| FÍSICA    | NOT_APPLICABLE | La materialización pertenece a `SHELL-CI-009::GLOBAL` después de aprobación documental y autorización física explícita.                                                                                                                                                                                                                                                                       |

#### 36. Criterios de aceptación

`SHELL-CI-009` queda documentalmente completa cuando:

- identifica `devVentoGroup/vento-origo` como consumidor propietario;
- conserva CI006 como propietario del cambio y del PR;
- conserva la disciplina de CI007/CI008 sin reutilizar evidencia de otro consumidor;
- gobierna exactamente cuatro relaciones package–ORIGO;
- define unidad de evidencia ligada a commit, manifest, lockfile, suite, fixtures, rutas, source contracts y entorno;
- exige ejecutar línea base antes de modificar versiones objetivo;
- define doce superficies funcionales comunes;
- define cuatro perfiles de familia;
- protege trece páginas, tres patrones dinámicos y un handler;
- concilia trece páginas fuente, doce sincronizables y cuatro candidatas de menú;
- exige caminos permitidos y denegados;
- protege sede, sesión, actor, recurso e identidad dinámica;
- protege proveedores, presentaciones, unidades y relaciones comerciales aplicables;
- protege órdenes, líneas, estados y documento;
- protege recepciones, idempotencia y efectos integrados aplicables;
- protege token PDF y frontera de service-role;
- exige un build CI que no active `sync-navigation`;
- protege clientes Supabase/RLS sin autorizar cambios de base de datos desde ORIGO;
- protege UI, SSR, interacción, accesibilidad y exportación;
- convierte ausencia de suite en bloqueo físico;
- soporta `INITIAL_ADOPTION`;
- soporta conjuntos multi-package;
- invalida evidencia ante cambios materiales;
- produce evidencia consumible por CI006;
- conserva fronteras ORIGO–NEXO–FOGO–Shell;
- separa habilitador VERIFIED de consumidor conforme;
- no crea PR, no actualiza packages, no fusiona, no despliega y no ejecuta rollback durante el marcador;
- no crea ni modifica requisitos de prueba.

#### 37. Límites

Esta tarea no:

- implementa físicamente `SHELL-CI-009::GLOBAL`;
- instala un framework de pruebas durante el marcador documental;
- modifica `package.json` o `package-lock.json` de ORIGO;
- actualiza `@vento/contracts`, `@vento/os-context`, `@vento/supabase` ni `@vento/ui-web`;
- modifica código funcional ORIGO;
- corrige el fallback físico del token PDF durante el marcador;
- crea ramas ni pull requests;
- modifica la lógica del actualizador CI006;
- recalcula compatibilidad CI005;
- reutiliza evidencia NEXO o FOGO como si perteneciera a ORIGO;
- normaliza todos los comandos del repositorio, responsabilidad de CI016;
- implementa por anticipado todo el ciclo TO-BE de abastecimiento, contratos, aprobaciones, evaluación de proveedores o compras urgentes;
- convierte ORIGO en propietario de inventario/LOC de NEXO ni de producción de FOGO;
- modifica schema, tablas, RPC, RLS, Storage, Realtime, Edge Functions, datos, secretos o configuración Supabase;
- crea ni modifica migraciones dentro de ORIGO;
- ejecuta `sync-navigation.mjs` contra un proyecto remoto;
- usa datos productivos;
- requiere impresora física;
- ejecuta rollback de CI014;
- coordina despliegue de CI015;
- desarrolla CI010 ni otra tarea posterior;
- crea, modifica, difiere, descarta u obsolete requisitos del registro 04A.

#### 38. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-CI-008 — Probar FOGO antes de actualizar`

**TAREA ACTUAL APROBADA**
`SHELL-CI-009 — Probar ORIGO antes de actualizar`

**SIGUIENTE TAREA RESERVADA**
`SHELL-CI-010 — Probar PULSO antes de actualizar`


### ✅ SHELL-CI-010 — Probar PULSO antes de actualizar

**Estado:** APROBADA
**Tarea anterior:** SHELL-CI-009 — Probar ORIGO antes de actualizar
**Tarea siguiente:** SHELL-CI-011 — Probar VISO antes de actualizar
**Tipo de tarea:** Habilitador global único — contrato documental de pruebas específicas de PULSO previas a actualización de packages compartidos
**Bloque:** BLOQUE T — CI, pruebas, despliegue y rollback base
**Repositorio propietario:** `devVentoGroup/vento-pulso`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/T_CALIDAD_Y_DESPLIEGUE/02_PRUEBAS_DE_CONSUMIDORES_Y_ROLLBACK.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada el contrato de pruebas que deberá demostrar que **PULSO conserva una línea base reproducible, íntegra, atribuible y fail-closed antes de modificar su conjunto de packages compartidos**, de modo que una actualización preparada por CI006 nunca parta de un consumidor ambiguo, de evidencia perteneciente a otro commit, de una sede distinta, de una ruta no inventariada, de una acción que amplíe autoridad por parámetros controlados por cliente o de una ejecución de prueba que produzca ventas, redenciones, movimientos, llamados, publicaciones de ventas u otros efectos reales.

La regla vinculante queda:

```text
PULSO EN UN COMMIT BASE EXACTO
+ MANIFEST Y LOCKFILE EXACTOS
+ INVENTARIO DE 6 PÁGINAS Y 0 HANDLERS CONCILIADO
+ ENTORNO DE PRUEBA AISLADO
+ RELACIÓN PACKAGE–PULSO EXACTA
+ PERFIL DE PRUEBAS PULSO APLICABLE
+ PRUEBAS FUNCIONALES, DE AUTORIZACIÓN, REALTIME Y DE FRONTERA SATISFACTORIAS
+ EVIDENCIA VIGENTE
= LÍNEA BASE PULSO APTA PARA INICIAR UNA PROPUESTA DE ACTUALIZACIÓN
```

Y, de forma fail-closed:

```text
LINT VERDE
O BUILD VERDE
O ESCÁNER QUE RENDERIZA
O TABLERO QUE ABRE
O REALTIME CONECTADO
O COMPATIBILIDAD DE OTRO CONSUMIDOR
O PRUEBAS DE OTRO COMMIT
O AUSENCIA DE TESTS AUTOMATIZADOS
O USO DE DATOS REALES PARA OBTENER VERDE
≠ LÍNEA BASE PULSO CERTIFICADA
```

CI010 certifica la línea base específica de PULSO. No publica packages, no modifica la versión objetivo, no prepara el pull request, no fusiona, no despliega, no ejecuta rollback y no convierte la autocertificación del habilitador en una afirmación de que el POS, caja, pagos, entrega, inventario, fidelización o reporting futuros ya estén completamente implementados.

#### 2. Resultado canónico

`SHELL-CI-010` establece un único habilitador reutilizable para:

1. identificar el commit base exacto de `devVentoGroup/vento-pulso` que se pretende actualizar;
2. fijar las identidades del manifest, lockfile, configuración, suite, fixtures, inventario de rutas y entorno;
3. seleccionar únicamente las relaciones package–PULSO aplicables;
4. seleccionar el perfil PULSO correspondiente a cada familia compartida objetivo;
5. ejecutar una línea base técnica reproducible sobre el commit base sin modificar versiones de packages;
6. proteger el inventario exacto de seis páginas, cero segmentos dinámicos y cero route handlers;
7. conservar `/` y `/scanner` como identidades de ruta separadas mientras la decisión canónica posterior no autorice su consolidación;
8. conservar la delegación SSO al Shell sin inventar una ruta `/login` local;
9. proteger sesión, acceso a PULSO, sede, contexto operacional, actor y denegación;
10. proteger el escáner, identificación de cliente y fronteras server-only de cualquier privilegio elevado;
11. proteger validación y consumo de redenciones, acreditación de loyalty y firma de actor en dispositivo compartido;
12. proteger lectura, filtrado y transición operacional de pedidos;
13. proteger pago previo aplicable, fulfillment, despacho, conversación, historial, opciones, facturación y actualización operativa de pedidos;
14. proteger zonas, mesas, sesiones y llamados del salón, incluidos refresh y Realtime;
15. proteger importación de ventas XLSX, hashing, mapeos, lotes, filas, warnings y publicación posterior;
16. proteger idempotencia, replay, atomicidad y no duplicación de efectos donde corresponda;
17. impedir que `site_id`, filtros, mensajes o cualquier query param amplíen autoridad;
18. impedir que abrir una página equivalga a autorizar las mutaciones que la página expone;
19. proteger la frontera PULSO–PASS–NEXO–Shell y los dominios que no pertenecen a PULSO;
20. probar clientes, consultas, RPC y denegaciones Supabase sin autorizar migraciones ni cambios remotos desde PULSO;
21. probar render, hidratación, interacción, feedback, accesibilidad y comportamiento Realtime representativo cuando la familia objetivo sea UI;
22. producir evidencia machine-readable ligada al commit base y al conjunto exacto de pruebas;
23. invalidar la evidencia cuando cambie cualquiera de sus entradas materiales;
24. bloquear una actualización cuando no exista infraestructura de prueba suficiente;
25. entregar a CI006 un resultado de línea base consumible para comparar el comportamiento previo y el `proposal_commit` posterior;
26. soportar una actualización multi-package mediante la unión de perfiles requeridos, sin reducir cobertura;
27. autocertificar el habilitador global una sola vez antes de reutilizarlo en futuras actualizaciones de PULSO;
28. separar la certificación del habilitador de la conformidad funcional completa del consumidor.

#### 3. Frontera de responsabilidad

| Responsabilidad                                               | Propietario         |
| ------------------------------------------------------------- | ------------------- |
| pruebas propias del package                                   | `SHELL-CI-001`      |
| artefacto distribuible del package                            | `SHELL-CI-002`      |
| identidad y publicación de release                            | `SHELL-CI-003`      |
| changelog y release notes                                     | `SHELL-CI-004`      |
| compatibilidad package–consumidor                             | `SHELL-CI-005`      |
| preparación y mantenimiento del PR consumidor                 | `SHELL-CI-006`      |
| línea base y pruebas específicas de NEXO                      | `SHELL-CI-007`      |
| línea base y pruebas específicas de FOGO                      | `SHELL-CI-008`      |
| línea base y pruebas específicas de ORIGO                     | `SHELL-CI-009`      |
| línea base y pruebas específicas de PULSO antes de actualizar | `SHELL-CI-010`      |
| pruebas específicas de VISO                                   | `SHELL-CI-011`      |
| pruebas específicas de NUMERA                                 | `SHELL-CI-012`      |
| pruebas específicas de ANIMA                                  | `SHELL-CI-013`      |
| rollback por repositorio                                      | `SHELL-CI-014`      |
| independencia de despliegue                                   | `SHELL-CI-015`      |
| normalización transversal de comandos                         | `SHELL-CI-016`      |
| trazabilidad de requisitos y evidencia por PR                 | `SHELL-CI-017..019` |

CI010 puede exigir un punto de entrada reproducible para su propia suite. No absorbe la normalización transversal de comandos reservada a CI016, no convierte la línea base en implementación del POS integral y no corrige por anticipado obligaciones funcionales cuyo owner ya esté asignado.

#### 4. Topología de trabajo

`PHASE-03-T-CI-FOUNDATION` aplica `GLOBAL_ENABLE_ONCE` a `SHELL-CI-010`.

Por tanto:

```text
MARCADOR CANÓNICO
SHELL-CI-010
→ define una sola vez el contrato de pruebas previas de PULSO

INSTANCIA FÍSICA FUTURA
SHELL-CI-010::GLOBAL
→ materializa y autocertifica una sola vez el habilitador PULSO

ACTUALIZACIONES POSTERIORES DE PULSO
→ reutilizan el habilitador certificado
→ generan evidencia nueva por commit base y conjunto objetivo
→ no vuelven a implementar CI010
```

La instancia global puede utilizar fixtures, dobles, oracles sintéticos y entornos locales o CI aislados. No necesita actualizar un package real, abrir PR, registrar una venta real, consumir una redención real, manipular una mesa real ni publicar un lote real para demostrar que el habilitador funciona.

#### 5. Handoff vinculante desde CI006, CI007, CI008 y CI009

CI006 ya materializó el actualizador común y conserva las 28 relaciones base, los dieciséis gates, la invalidación por commit y la prohibición de auto-merge y auto-deploy.

CI007, CI008 y CI009 ya establecieron la disciplina común para líneas base previas de consumidores:

- identidad exacta;
- evidencia atribuible;
- semántica fail-closed;
- invalidación por cambios materiales;
- separación entre habilitador global y ejecución por actualización;
- prohibición de reutilizar evidencia de otro consumidor;
- ausencia de tests distinta de PASS;
- separación entre harness autocertificado y consumidor integralmente conforme.

CI010 conserva esa disciplina, pero sustituye las superficies NEXO, FOGO y ORIGO por las superficies propias de PULSO.

La secuencia lógica será:

```text
RELEASE OBJETIVO CONOCIDA
→ RELACIÓN PACKAGE–PULSO RESUELTA
→ COMMIT BASE PULSO FIJADO
→ CI010 CERTIFICA LA LÍNEA BASE DEL COMMIT BASE
→ CI006 MATERIALIZA LA PROPUESTA AISLADA
→ CI006 EJECUTA O CONSUME LOS GATES SOBRE EL PROPOSAL COMMIT
→ SE COMPARA CON LA LÍNEA BASE VIGENTE
→ REVISIÓN HUMANA
```

Un `PASS` de CI010 no sustituye CI005 ni autoriza por sí mismo `ELIGIBLE`, `READY_FOR_REVIEW`, merge, despliegue o adopción.

#### 6. Relaciones package–PULSO gobernadas

CI010 gobierna exactamente las cuatro combinaciones PULSO de la matriz web base:

| Familia             | Compatibilidad CI005 | Actualización CI006 | Consumidor    |
| ------------------- | -------------------- | ------------------- | ------------- |
| `@vento/contracts`  | `PKG-COMP-MX-006`    | `PKG-PR-REL-006`    | `vento-pulso` |
| `@vento/os-context` | `PKG-COMP-MX-013`    | `PKG-PR-REL-013`    | `vento-pulso` |
| `@vento/supabase`   | `PKG-COMP-MX-020`    | `PKG-PR-REL-020`    | `vento-pulso` |
| `@vento/ui-web`     | `PKG-COMP-MX-027`    | `PKG-PR-REL-027`    | `vento-pulso` |

**Conciliación:** 4 relaciones PULSO esperadas, 4 materializadas en el contrato, 0 faltantes y 0 duplicadas.

Ninguna evidencia de NEXO, FOGO, ORIGO, VISO, NUMERA, SHELL o ANIMA satisface estas cuatro relaciones.

#### 7. Línea base física observada de PULSO

En el corte remoto inspeccionado de `devVentoGroup/vento-pulso`:

- la rama principal es `main`;
- el commit remoto observado es `71e0184486b5fe11e0a42435baf4024807a80efd`;
- existe `package-lock.json` y el repositorio es una aplicación Next privada;
- el manifest declara `lint`, `build` y `audit:i18n`;
- el manifest no declara un script de pruebas automatizadas;
- el manifest no declara un script dedicado de typecheck;
- no se observaron archivos `.test.*` ni `.spec.*` en el árbol completo;
- no se declaran todavía dependencias publicadas `@vento/*`;
- se observan Next `16.1.1`, React `19.2.3`, React DOM `19.2.3`, Supabase JS `^2.90.1` y Supabase SSR `^0.8.0`;
- el inventario fuente contiene exactamente seis archivos de página;
- no se observan segmentos dinámicos de página;
- no se observan route handlers;
- no existe una página local `/login`; el acceso no autenticado se delega al Shell mediante el guard;
- `/` y `/scanner` renderizan el mismo `ScannerPage`, pero conservan identidades URL distintas;
- las cinco rutas de negocio observadas usan guard de PULSO, contexto de sede y permiso `pos.main`;
- se observan Auth/SSO, contexto operacional, role override y firma de actor para dispositivo compartido;
- `/orders` materializa filtros, estados, fulfillment, pago operativo, líneas, opciones, eventos, despacho, conversación y facturación;
- las acciones de pedidos revalidan identificación, sede y acceso antes de ejecutar el RPC operacional observado;
- `/sales-imports` materializa lectura XLSX, hash SHA-256 del archivo, mapeos externos, lotes, filas, warnings y publicación mediante RPC;
- `/salon` materializa zonas, mesas, sesiones, llamados, refresh y suscripción Realtime a cambios de llamadas y sesiones;
- el escáner materializa identificación de cliente, validación de redención y acreditación de loyalty;
- las acciones de loyalty observadas incluyen controles de acceso y firma de actor compartido donde aplica;
- la identificación de cliente puede utilizar un cliente privilegiado exclusivamente en código servidor cuando existe configuración service-role, frontera que la suite deberá proteger contra exposición o uso fuera del camino autorizado;
- el árbol conserva implementaciones live y legacy relacionadas con el tablero de órdenes, por lo que la línea base no puede inferir que la retirada de legacy ya esté completada;
- el estado actual documentado asigna PULSO como owner operacional de caja/salón, PASS como owner de cliente/loyalty, NEXO/Shell como frontera para inventario y Shell como owner de Supabase;
- el estado actual documentado mantiene pendientes futuros de cierre formal de caja, pagos, integración única con PASS, llamados persistentes, estados compartidos y reporting; CI010 no los implementa por anticipación.

Conclusión documental: **PULSO todavía no puede considerarse físicamente certificado para CI010 por la sola existencia de lint y build**. La futura `SHELL-CI-010::GLOBAL` deberá materializar infraestructura de pruebas automatizadas reproducible y autocertificar el habilitador.

#### 8. Inventario contractual de rutas PULSO

La línea base fuente de CI010 queda fijada en estas seis páginas:

1. `/`;
2. `/no-access`;
3. `/orders`;
4. `/sales-imports`;
5. `/salon`;
6. `/scanner`.

Conciliación:

```text
6 páginas fuente
0 patrones dinámicos
0 route handlers

5 rutas de negocio:
- /
- /orders
- /sales-imports
- /salon
- /scanner

1 estado de denegación:
- /no-access

0 rutas /login locales
```

`/` y `/scanner` permanecen como identidades distintas aunque compartan `ScannerPage`.

Layouts, componentes, bridges, módulos, server actions, helpers y scripts no se contabilizan como páginas.

Los query parameters `site_id`, `view`, `fulfillment`, `message`, `error` y `ok` permanecen dentro del contrato de su ruta y no generan nuevas identidades de pantalla.

Cualquier alta, baja, movimiento, duplicación, segmento dinámico o route handler frente a esta línea base vuelve stale la evidencia que dependa del inventario hasta que exista un delta explícito.

La reconciliación posterior contra navegación runtime y menú permanece separada: la ausencia de un sincronizador local no demuestra ausencia de registros remotos.

#### 9. Distinción entre habilitador certificado y consumidor conforme

CI010 fija dos afirmaciones diferentes que nunca podrán fusionarse:

```text
SHELL-CI-010::GLOBAL = VERIFIED
```

significa:

- existe el harness;
- el harness es reproducible;
- detecta sus escenarios positivos y negativos;
- detecta drift, stale evidence, otro consumidor, cero tests, aislamiento inválido y falsas condiciones de PASS;
- produce evidencia machine-readable;
- no requiere mutaciones productivas.

No significa:

```text
EL COMMIT ACTUAL DE PULSO CUMPLE TODOS LOS REQUISITOS FUNCIONALES FUTUROS DEL DOMINIO
```

La conformidad del consumidor se determina en cada ejecución real de línea base contra su commit exacto.

La coexistencia actual de tablero live y legacy, permisos todavía amplios, flujos de POS aún incompletos o fronteras de integración pendientes no impide materializar un harness correcto. Cuando una deuda registrada sea aplicable al perfil ejecutado, la ejecución real deberá devolver `FAIL` o `BLOCKED` en lugar de ocultarla.

#### 10. Unidad exacta de certificación previa

Cada resultado de CI010 se atribuye como mínimo a:

```text
consumer_repository
consumer_branch
consumer_base_commit
consumer_manifest_identity
consumer_lockfile_identity
test_contract_identity
test_suite_identity
fixture_set_identity
route_inventory_identity
source_contract_identity
environment_identity
runtime_identity
framework_identity
target_package_set
compatibility_refs
pulso_profile_set
execution_identity
started_at
completed_at
result
invalidation_reason
```

La unidad certificada es el **commit base sin la actualización propuesta**.

Cambiar commit, manifest, lockfile, suite, fixtures, inventario, configuración, contratos fuente, entorno o perfil invalida la reutilización del resultado anterior.

#### 11. Momento de ejecución

La prueba previa debe ejecutarse después de conocer el conjunto objetivo y antes de materializar la actualización sobre PULSO.

Orden obligatorio:

1. resolver release o conjunto mínimo cerrado de releases objetivo;
2. resolver una o más de las cuatro relaciones PULSO;
3. fijar `consumer_base_commit`;
4. fijar manifest y lockfile del commit base;
5. fijar inventario de rutas y contratos fuente aplicables;
6. resolver los perfiles PULSO exigidos por las familias objetivo;
7. ejecutar la línea base común y los perfiles seleccionados sin cambiar versiones de packages;
8. consolidar la evidencia;
9. solo con resultado satisfactorio permitir que CI006 continúe con la preparación aislada de la propuesta.

Si durante la prueba cambia el commit base, la ejecución en curso deja de ser atribuible y debe reiniciarse sobre la nueva identidad.

#### 12. Semántica de resultado

CI010 reutiliza la semántica fail-closed aprobada:

- `PENDING`;
- `RUNNING`;
- `PASS`;
- `FAIL`;
- `BLOCKED`;
- `CANCELLED`;
- `TIMED_OUT`;
- `STALE`;
- `NOT_APPLICABLE` únicamente para comprobaciones realmente condicionales y justificadas.

Para declarar una línea base PULSO apta se requiere `PASS` global de las comprobaciones obligatorias seleccionadas.

No satisfacen el contrato:

- suite ausente;
- cero tests ejecutados;
- tests obligatorios deshabilitados;
- salida ambigua;
- `SKIPPED` no justificado;
- snapshots actualizados automáticamente para forzar verde;
- mocks que eliminen la condición que se pretendía probar;
- `NOT_APPLICABLE` en una comprobación obligatoria;
- evidencia de otro commit;
- evidencia de otro consumidor;
- omisión de una de las seis páginas;
- tratar `/` y `/scanner` como una sola ruta sin decisión canónica;
- mutaciones contra datos reales;
- redenciones, ventas, llamados, pedidos o lotes productivos generados por la prueba;
- una deuda crítica aplicable convertida manualmente en PASS.

#### 13. Línea base técnica común

Toda certificación previa de PULSO deberá demostrar, sobre el mismo commit base:

1. instalación bloqueada reproducible con el lockfile vigente;
2. manifest y lockfile coherentes;
3. lint o análisis estático aplicable;
4. typecheck real de TypeScript;
5. build de producción o export aplicable;
6. ejecución de la suite automatizada específica de PULSO;
7. ausencia de tests omitidos silenciosamente;
8. identidad del entorno y runtime registrada;
9. evidencia separada por comprobación;
10. resultado global fail-closed;
11. inventario de rutas y contratos fuente conciliados;
12. ausencia de escrituras productivas provocadas por la propia certificación.

El manifest observado no define `prebuild` mutante. Aun así, una ejecución futura deberá demostrar que su build y sus pruebas no disparan operaciones remotas con efectos de negocio por import, prerender, script auxiliar o configuración.

Un build satisfactorio no sustituye las pruebas automatizadas específicas.

#### 14. Matriz funcional mínima obligatoria de PULSO

La suite global deberá cubrir como mínimo estas doce superficies de comportamiento. La implementación física puede dividir cada superficie en varios tests, pero no eliminarla sin una decisión canónica posterior.

|    # | Superficie                                            | Afirmación positiva mínima                                                                                 | Afirmación negativa o de borde mínima                                                                   |
| ---: | ----------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
|    1 | identidad, sesión, SSO y acceso PULSO                 | una identidad válida conserva sesión, retorno seguro y acceso requerido                                    | sesión ausente, auth error o app no autorizada falla cerrado                                            |
|    2 | contexto operativo, sede, actor y dispositivo         | sede, contexto y actor efectivo limitan la operación al territorio permitido                               | cambiar `site_id`, override, dispositivo o actor no concede autoridad                                   |
|    3 | inventario de rutas y navegación                      | 6 páginas, 0 dinámicas y 0 handlers conservan identidad; `/` y `/scanner` siguen separadas                 | alta, baja, duplicado, handler oculto o fusión silenciosa bloquea                                       |
|    4 | escáner e identificación de cliente                   | un código válido identifica al cliente dentro del contexto autorizado                                      | código inválido, usuario ausente, permiso denegado o privilegio indebido falla                          |
|    5 | loyalty, redención y acreditación                     | redención válida y award aplicable conservan identidad, estado, actor y trazabilidad                       | QR reutilizado, redención no pendiente, doble award o firma de actor inválida falla                     |
|    6 | pedidos, líneas, estado, pago y fulfillment           | pedido válido conserva sede, líneas, opciones, pago, modalidad y transición permitida                      | ID/sede inválidos, pago requerido ausente, transición prohibida o recurso ajeno falla                   |
|    7 | despacho, chat, facturación e historial               | asignación, conversación, eventos y referencia fiscal permanecen ligados al mismo pedido                   | despacho de recurso ajeno, mensaje inválido, evento incoherente o ampliación de autoridad falla         |
|    8 | salón, mesas, sesiones, llamados y Realtime           | zonas, mesas, sesión y llamados de la sede se proyectan y actualizan de forma coherente                    | llamada de otra sede, transición inválida, duplicación o evento Realtime no autorizado falla            |
|    9 | importación de ventas, mapeos, lotes y publicación    | XLSX válido produce lote atribuible, hash, filas reconciliadas y publicación controlada                    | archivo inválido, mapping ajeno, replay, doble publicación o lote de otra sede falla                    |
|   10 | atomicidad, idempotencia, concurrencia y recuperación | efectos repetibles conservan una identidad lógica y no duplican pedidos, redenciones ni publicaciones      | retry, timeout, doble submit o replay no produce dos efectos exitosos                                   |
|   11 | integración y fronteras de dominio                    | PULSO opera POS/salón y consume PASS, NEXO y Shell mediante contratos explícitos                           | PULSO no adquiere por conveniencia ownership de cliente/loyalty, inventario o gobierno Supabase         |
|   12 | UI, SSR, interacción, accesibilidad y Realtime        | páginas representativas renderizan, hidratan, reaccionan y presentan éxito/error/deny de forma consistente | hidratación, teclado, foco, formulario, realtime, loading, deny o error fallido no se normaliza a éxito |

Estas doce superficies son la línea base común. Los perfiles de familia agregan obligaciones, no las sustituyen.

#### 15. Perfil PULSO para `@vento/contracts`

Cuando la relación objetivo incluya `PKG-PR-REL-006`, la línea base deberá cubrir especialmente:

- identidades y estructuras consumidas por pedido, línea, opción, evento, conversación y mensaje;
- identidades y estados de zonas, mesas, sesiones y llamados;
- identidades de cliente, redención, reward y transacción de loyalty;
- identidades de lote, fila, mapping y publicación de ventas;
- sede, fulfillment, payment status, dispatch status y estados operativos realmente consumidos;
- cantidades, precios, subtotales, impuestos, descuentos, devoluciones y total;
- payloads de dirección, guest info, metadata y referencias externas;
- diferencia entre dato ausente, `null`, inválido, denegado y no aplicable;
- compilación de los puntos de consumo TypeScript;
- ausencia de casts o fallbacks globales que oculten una incompatibilidad.

La evidencia se vincula a `PKG-COMP-MX-006` y `PKG-PR-REL-006`.

#### 16. Perfil PULSO para `@vento/os-context`

Cuando la relación objetivo incluya `PKG-PR-REL-013`, la línea base deberá cubrir especialmente:

- sesión real y sesión ausente;
- delegación SSO al Shell;
- acceso a la aplicación PULSO;
- contexto operativo por sede y área cuando aplique;
- permiso concedido y permiso denegado;
- `site_id` solicitado frente a sede efectiva;
- contexto incompleto o manipulado;
- acceso directo a las cinco rutas de negocio;
- role override únicamente cuando el contrato lo permita;
- dispositivo compartido y aplicaciones permitidas;
- firma de actor cuando una acción la requiera;
- preservación de razones de denegación;
- prohibición de elevar autoridad desde query params o valores controlados por cliente.

La evidencia se vincula a `PKG-COMP-MX-013` y `PKG-PR-REL-013`.

#### 17. Perfil PULSO para `@vento/supabase`

Cuando la relación objetivo incluya `PKG-PR-REL-020`, la línea base deberá cubrir especialmente:

- clientes browser y server;
- propagación de sesión y cookies;
- tipos y shapes de respuesta consumidos;
- consultas de pedidos, líneas, opciones, eventos, conversaciones, mensajes y facturación;
- consultas de zonas, mesas, sesiones y llamados;
- tablas de importación de ventas, mappings, lotes y filas;
- esquema PASS consumido para redenciones;
- RPC de transición operacional de pedido y publicación de ventas;
- operaciones permitidas dentro del alcance autorizado;
- operaciones denegadas por permisos o RLS;
- aislamiento por sede;
- suscripciones Realtime y cleanup;
- ausencia de service-role en bundles cliente o fixtures;
- uso server-only de privilegio elevado únicamente en un camino explícitamente autorizado;
- correspondencia entre schema de prueba y fuente canónica de `vento-shell`;
- ausencia de bypass por wrapper, fallback o manejo de errores.

Las pruebas que requieran base de datos deberán usar un entorno local o CI aislado derivado de la fuente canónica de `vento-shell`. La falta de ese entorno cuando la comprobación sea obligatoria produce `BLOCKED`, no `NOT_APPLICABLE`.

La evidencia se vincula a `PKG-COMP-MX-020` y `PKG-PR-REL-020`.

#### 18. Perfil PULSO para `@vento/ui-web`

Cuando la relación objetivo incluya `PKG-PR-REL-027`, la línea base deberá cubrir especialmente:

- render servidor y cliente de superficies representativas;
- hidratación sin divergencias silenciosas;
- `/`, `/scanner`, `/orders`, `/sales-imports`, `/salon` y `/no-access`;
- scanner por entrada manual, lector y cámara cuando la abstracción aplicable pueda aislarse;
- filtros, tablas, estados vacíos, mensajes y errores;
- formularios, file input, botones operativos y double-submit guard;
- eventos de usuario y feedback de éxito/error;
- foco, teclado y semántica accesible aplicable;
- Realtime de salón y superficies live de pedidos;
- integración de tokens y estilos sin degradar legibilidad u operación;
- ausencia de imports privados no contractuales;
- deny states sin exposición de datos protegidos.

La evidencia se vincula a `PKG-COMP-MX-027` y `PKG-PR-REL-027`.

#### 19. Protección reforzada del escáner, cliente y loyalty

La cobertura del escáner no puede reducirse a que `ScannerPage` renderice.

Según aplicabilidad, la línea base deberá conservar:

1. parsing válido del código de cliente;
2. rechazo de formato inválido;
3. sesión válida;
4. permiso PULSO aplicable;
5. sede efectiva;
6. consulta server-side del cliente;
7. ausencia de credenciales privilegiadas en cliente;
8. redención existente y estado permitido;
9. rechazo de redención reutilizada o cancelada;
10. transición de redención una sola vez;
11. acreditación de loyalty atribuible;
12. identidad de transacción;
13. firma de actor compartido cuando aplique;
14. relación opcional con pedido sin otorgar autoridad sobre pedido;
15. frontera clara con PASS como owner de cliente y loyalty.

Una ejecución real no podrá declarar PASS si obtiene el resultado correcto únicamente mediante un bypass de permiso, service-role expuesto o fixture que omita la condición adversarial.

#### 20. Protección reforzada de pedidos, despacho, chat y facturación

El tablero de pedidos deberá conservar pruebas representativas de:

- filtrado por sede;
- filtros de vista y fulfillment;
- pedido con identidad válida;
- líneas y opciones;
- subtotal, fee y total;
- payment status;
- regla de pago previo para delivery cuando aplique;
- estados operativos permitidos;
- rechazo de transición no soportada;
- transición server-side mediante acción nombrada;
- despacho aplicable a delivery;
- partner y referencia de despacho;
- conversación y mensajes ligados al pedido;
- historial de eventos y actor;
- referencia de facturación sin convertir PULSO en proveedor fiscal;
- actualización live sin mezclar pedidos de otra sede.

La presencia simultánea de implementaciones live y legacy obliga a probar la superficie realmente activa y a impedir un retiro silencioso. CI010 no declara completada la retirada del tablero legacy.

#### 21. Protección reforzada de salón, mesas y Realtime

La línea base deberá poder evaluar, según el commit y perfil aplicables:

- zonas activas de la sede;
- mesas de la sede;
- sesión abierta;
- pax y servidor cuando existan;
- llamados pendientes y acknowledged;
- creación manual de llamado;
- prioridad;
- tomar un llamado;
- resolver un llamado;
- refresh de snapshot;
- suscripción Realtime a llamados y sesiones;
- cleanup de canal;
- rechazo de datos o mutaciones de otra sede;
- estados de UI derivados de sesión y llamados;
- comportamiento ante error de red o de Supabase.

Una conexión Realtime estable no autoriza por sí misma una mutación. Cada acción deberá conservar su contrato de autorización y territorialidad.

#### 22. Protección reforzada de importación de ventas

La superficie `/sales-imports` deberá conservar pruebas representativas de:

- sede y fecha;
- archivo no vacío;
- parsing XLSX;
- encabezados requeridos;
- filas válidas;
- normalización numérica y textual;
- hash SHA-256 del archivo;
- mapping por identificador, código o nombre según contrato vigente;
- warnings de fila sin mapping;
- lote ligado a sede, fecha y archivo;
- filas ligadas al lote;
- importación repetida;
- mapping de otra sede;
- publicación mediante acción/RPC separado;
- publicación única e idempotente cuando el contrato materializado lo exija;
- ausencia de efecto de inventario durante la mera carga o validación;
- efectos de publicación únicamente en entorno aislado.

CI010 no atribuye a PULSO el ownership del inventario. Cualquier efecto integrado sobre inventario deberá probarse contra el contrato de NEXO/Shell en entorno aislado, no mediante mutación productiva.

#### 23. Protección reforzada de autorización, sede y dispositivo compartido

El permiso observado `pulso.pos.main` es evidencia de implementación actual, no aprobación de que un único permiso sea suficiente para toda acción futura.

La suite deberá demostrar como mínimo:

```text
VISIBILIDAD DE UNA RUTA
≠
AUTORIZACIÓN DE TODAS SUS MUTACIONES
```

Y deberá separar:

- `pulso.access`;
- permiso de superficie;
- autorización de recurso;
- sede efectiva;
- actor efectivo;
- rol efectivo;
- dispositivo compartido;
- aplicación permitida por el dispositivo;
- firma de actor cuando aplique;
- estado de origen y transición;
- columnas o efectos permitidos.

`site_id`, `view`, `fulfillment`, `message`, `error`, `ok`, IDs de recursos y payloads cliente nunca podrán convertirse por sí solos en fuente de autoridad.

#### 24. Datos, fixtures y aislamiento

Las pruebas de CI010 deberán cumplir simultáneamente:

1. no leer ni modificar datos productivos;
2. usar fixtures deterministas o entorno local/CI aislado;
3. no depender de IDs aleatorios no registrados;
4. limpiar o descartar estado temporal de forma reproducible;
5. no compartir estado mutable entre tests independientes;
6. no utilizar credenciales reales como fixture;
7. no introducir una migración PULSO para acomodar la prueba;
8. cuando se necesite schema Supabase, consumir la fuente canónica de `vento-shell`;
9. registrar identidad del fixture set;
10. impedir que una falla de cleanup convierta el resultado en PASS;
11. no crear pedidos, pagos, facturas, redenciones, transacciones loyalty, mesas, sesiones, llamados, mappings, lotes o ventas productivos;
12. no publicar un lote real para demostrar idempotencia;
13. no usar service-role real en la autocertificación sintética;
14. separar fixtures de pedidos, loyalty, salón e importaciones;
15. simular Realtime sin depender de eventos productivos;
16. mantener aislados los escenarios de otra sede y otro actor.

#### 25. Línea base antes de `INITIAL_ADOPTION`

El manifest observado de PULSO no declara todavía packages publicados `@vento/*`.

Por tanto, la primera adopción futura de cualquiera de las cuatro familias deberá tratar la evidencia CI010 como **oráculo del comportamiento previo**:

```text
COMMIT BASE SIN EL PACKAGE COMPARTIDO
→ CI010 PASS
→ PROPUESTA INITIAL_ADOPTION
→ MISMA COBERTURA ESENCIAL SOBRE PROPOSAL COMMIT
→ COMPARACIÓN DE RESULTADOS
```

La ausencia actual del package no convierte sus pruebas específicas en no aplicables.

#### 26. Actualizaciones `PATCH`, `MINOR`, `MAJOR`, seguridad y deprecación

CI010 no sustituye las clases de actualización de CI006:

- `PATCH_UPDATE`: línea base completa y regresión focal;
- `MINOR_UPDATE`: añade escenarios para la nueva capacidad consumida;
- `MAJOR_UPDATE`: exige línea base completa y matriz explícita de comportamiento preservado/cambiado;
- `SECURITY_UPDATE`: mantiene autorización, territorialidad, actor, RLS, denegación y secretos; la urgencia no permite omitirlos;
- `DEPRECATION_MIGRATION`: conserva pruebas de la superficie antigua mientras siga soportada y de la ruta objetivo cuando exista;
- `ROLLBACK_UPDATE`: CI010 aporta la línea base; la ejecución y certificación del rollback pertenece a CI014.

#### 27. Actualización multi-package

Cuando CI006 resuelva más de una familia compartida:

1. CI010 selecciona la unión de todos los perfiles correspondientes;
2. ninguna familia reduce la cobertura de otra;
3. las doce superficies comunes permanecen;
4. una ejecución puede producir evidencia para el conjunto si las identidades permanecen unidas;
5. el conjunto objetivo queda registrado;
6. cambiar una sola versión objetivo invalida la evidencia dependiente;
7. no se usa lockstep artificial para incluir familias no requeridas.

#### 28. Evidencia consumible por CI006

La evidencia satisfactoria deberá permitir a CI006 demostrar al menos:

- repositorio consumidor exacto: `devVentoGroup/vento-pulso`;
- commit base exacto;
- manifest y lockfile exactos;
- inventario de rutas exacto;
- contratos fuente exactos;
- relación o relaciones PULSO aplicables;
- conjunto de packages objetivo;
- referencias de compatibilidad CI005;
- perfil o perfiles PULSO ejecutados;
- identidad de suite y fixtures;
- identidad del entorno;
- resultados por capa y superficie;
- total de tests ejecutados, aprobados, fallidos y omitidos;
- evidencia de caminos denegados aplicables;
- evidencia de seis páginas, cero dinámicas y cero handlers;
- evidencia de aislamiento territorial;
- evidencia de que la certificación no produjo efectos productivos;
- timestamps de inicio y cierre;
- resultado global;
- razón de bloqueo o invalidación cuando no sea PASS.

La evidencia podrá formar parte de `validation_results` y `evidence_refs` del expediente `PKG-PR-*`, pero CI010 no crea ni mantiene ese expediente.

#### 29. Invalidación obligatoria

El resultado pasa a `STALE` cuando cambia materialmente cualquiera de estas entradas antes de que CI006 la consuma:

- `consumer_base_commit`;
- manifest;
- lockfile;
- configuración de build, TypeScript o test;
- suite;
- fixtures u oracles;
- variables/configuración de entorno relevantes;
- runtime o framework;
- inventario de seis páginas;
- presencia de segmentos dinámicos o handlers;
- contrato de `/` o `/scanner`;
- contratos fuente;
- guard, SSO, contexto o autorización;
- contrato de dispositivo compartido;
- contrato de pedidos o transición operacional;
- contrato de loyalty o redención;
- contrato de salón o Realtime;
- contrato de importación/publicación de ventas;
- fuente de schema usada para pruebas Supabase;
- relación package–PULSO;
- versión o conjunto objetivo;
- referencia de compatibilidad CI005;
- superficie obligatoria;
- contrato de CI010.

No se conserva un PASS anterior mediante rebase, cherry-pick, actualización de snapshot o cambio de fixture sin nueva ejecución atribuible.

#### 30. Condiciones de bloqueo

La futura ejecución deberá quedar `BLOCKED` o `FAIL` según corresponda cuando ocurra cualquiera de estas condiciones:

1. no existe runner reproducible para pruebas PULSO;
2. el runner ejecuta cero tests obligatorios;
3. falta identidad del commit base;
4. manifest o lockfile no corresponden al commit;
5. la suite cambió después de producir evidencia;
6. existe un test obligatorio omitido;
7. lint, typecheck o build obligatorio falla;
8. una prueba funcional obligatoria falla;
9. una prueba de denegación, autorización, contexto, actor, dispositivo, recurso o sede falla;
10. el entorno apunta a datos o servicios productivos;
11. un fixture contiene una credencial real;
12. evidencia CI005 pertenece a otra versión o consumidor;
13. la relación resuelta no corresponde a PULSO;
14. se intenta modificar packages antes de cerrar línea base;
15. se intenta resolver el fallo mediante bypass, cast global, skip o snapshot forzado;
16. una operación de prueba intenta crear o cambiar schema, RLS, RPC, datos o configuración remota desde PULSO;
17. evidencia de otro consumidor o commit se acepta como propia;
18. `/` y `/scanner` se fusionan por compartir componente sin decisión canónica;
19. el inventario deja de conciliar 6 páginas, 0 dinámicas y 0 handlers sin delta explícito;
20. `site_id` permite leer o mutar otra sede;
21. abrir `/orders` habilita una mutación sin revalidación server-side aplicable;
22. una transición de pedido inválida produce éxito;
23. un retry o replay duplica una redención o acreditación cuando la idempotencia sea aplicable;
24. una prueba expone o usa service-role en cliente o fixture;
25. `/sales-imports` acepta archivo o lote no autorizado, o una publicación repetida duplica efectos;
26. un evento o acción de salón cruza sede o aplica una transición inválida;
27. Realtime mezcla eventos de otro contexto;
28. datos de PASS, NEXO o Shell se apropian localmente para forzar la prueba;
29. resultados contradictorios o flaky no han sido explicados;
30. una deuda crítica conocida se transforma manualmente en PASS.

Ninguna aprobación humana convierte estas condiciones técnicas en PASS.

#### 31. Materialización futura de `SHELL-CI-010::GLOBAL`

La instancia física solo podrá declararse materializada cuando, dentro del alcance expresamente autorizado:

1. exista infraestructura de pruebas automatizadas reproducible en `devVentoGroup/vento-pulso`;
2. exista un punto de entrada determinista para la suite CI010;
3. exista typecheck real;
4. exista build CI reproducible sin efectos de negocio remotos;
5. las pruebas cubran las doce superficies comunes;
6. existan perfiles seleccionables para las cuatro familias;
7. existan casos permitidos y denegados de autorización;
8. exista cobertura de seis páginas, cero patrones dinámicos y cero handlers;
9. exista prueba de que `/` y `/scanner` permanecen identidades distintas;
10. exista estrategia aislada para pruebas Supabase;
11. exista cobertura de pedidos, transición, despacho, chat y facturación aplicable;
12. exista cobertura de scanner, loyalty y redención;
13. exista cobertura de salón y Realtime;
14. exista cobertura de importación y publicación de ventas;
15. la suite no use datos productivos ni secretos reales;
16. las pruebas no modifiquen schema ni migraciones PULSO;
17. identidad de commit, manifest, lockfile, suite, fixtures, rutas, contratos fuente y entorno forme parte de evidencia;
18. un cambio material vuelva STALE la evidencia;
19. una ejecución multi-package una perfiles sin reducir cobertura;
20. la salida sea machine-readable y consumible por CI006;
21. el habilitador falle sintéticamente ante al menos una ruptura por cada perfil;
22. demuestre que evidencia de otro consumidor o commit no es reutilizable;
23. demuestre que cero tests no se normaliza a PASS;
24. demuestre que drift de rutas no se normaliza a PASS;
25. demuestre que una manipulación de sede no se normaliza a PASS;
26. demuestre que un replay de efecto crítico puede ser detectado sin producir efectos reales;
27. demuestre que privilegio elevado en cliente o fixture se clasifica como fallo;
28. la autocertificación no actualice packages, no abra PR, no despliegue y no ejecute rollback;
29. la autocertificación no cree pedidos, ventas, redenciones, loyalty, llamados, lotes ni mutaciones Supabase productivas.

La selección física concreta de framework, archivos y devDependencies se resolverá durante la instancia con el estado actualizado de PULSO. El contrato no impone un proveedor inexistente por inferencia.

#### 32. Recuperación e idempotencia

Reglas:

1. una repetición exacta sobre las mismas entradas puede reproducir la misma decisión sin duplicar identidad lógica;
2. los intentos fallidos se conservan como evidencia;
3. un test flaky no se resuelve reintentando hasta pasar sin registrar intermitencia;
4. si cambia el commit base, se crea una ejecución nueva;
5. si cambia el conjunto objetivo, se recalculan perfiles;
6. un fallo de infraestructura produce `BLOCKED` cuando impide evaluar comportamiento;
7. un fallo funcional produce `FAIL` cuando la infraestructura sí permitió evaluar;
8. una ejecución cancelada o con timeout no certifica;
9. la recuperación nunca modifica datos reales ni amplía permisos;
10. una corrección del harness no reescribe evidencia histórica;
11. una deuda preexistente del consumidor permanece visible como fallo o bloqueo de esa ejecución y no se borra al autocertificar el habilitador;
12. retries de pedido, redención, award, llamado o publicación se prueban mediante fixtures u oráculos aislados, no mediante repetición contra producción.

#### 33. Estado documental conciliado

| Métrica                                      |                           Resultado |
| -------------------------------------------- | ----------------------------------: |
| Repositorio consumidor                       | **1 — `devVentoGroup/vento-pulso`** |
| Familias compartidas base                    |                               **4** |
| Relaciones CI005 de PULSO                    |                               **4** |
| Relaciones CI006 de PULSO                    |                               **4** |
| Páginas fuente PULSO                         |                               **6** |
| Rutas de negocio                             |                               **5** |
| Estados de denegación                        |                               **1** |
| Patrones dinámicos de página                 |                               **0** |
| Route handlers observados                    |                               **0** |
| Rutas `/login` locales                       |                               **0** |
| Superficies funcionales comunes obligatorias |                              **12** |
| Perfiles de familia                          |                               **4** |
| Auto-merge autorizado                        |                               **0** |
| Auto-deploy autorizado                       |                               **0** |
| Migraciones Supabase autorizadas en PULSO    |                               **0** |
| Datos productivos autorizados para pruebas   |                               **0** |
| Requisitos de prueba creados o modificados   |                               **0** |

#### 34. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA
**Requisitos creados:** **0**
**Requisitos modificados:** **0**

**Justificación:** las obligaciones de probar cada consumidor antes de adoptar packages compartidos, disponer de comandos reproducibles, conservar evidencia atribuible y bloquear falsos verdes ya existen en el registro canónico. La cobertura PULSO vigente ya protege POS, pedidos, rutas, SSO, autorización, territorialidad, importación de ventas, salón, redenciones, idempotencia, evidencia y fronteras interaplicación. CI010 especializa esas obligaciones para la línea base previa de PULSO y define su habilitador reutilizable; no introduce una regla empresarial independiente.

#### 35. Cobertura de prueba vigente reutilizada

La tarea reutiliza sin modificar, entre otras, estas obligaciones existentes:

- `TREQ-SHELL-005`, sobre comandos reproducibles y ausencia de falsos verdes;
- `TREQ-SHELL-006`, sobre pruebas propias, matriz de compatibilidad y validación por consumidor antes de publicar o adoptar;
- `TREQ-SHELL-008`, sobre requisitos afectados y resultados reproducibles por package y PR;
- `TREQ-SHELL-009`, sobre identidad verificable de repositorio, commit y ambiente;
- `TREQ-PULSO-001`, sobre el POS interno de extremo a extremo;
- `TREQ-PULSO-002`, sobre paridad y retirada controlada del tablero legacy;
- `TREQ-PULSO-003`, sobre no adoptar automáticamente piezas del prototipo histórico;
- `TREQ-PULSO-004`, sobre acciones nombradas, autorización y transición de pedidos;
- `TREQ-PULSO-005`, sobre separación del ciclo comercial y estados;
- `TREQ-PULSO-006`, sobre ventas, pagos, caja, fiscal y reversos auditables;
- `TREQ-PULSO-007`, sobre cumplimiento y entrega de pedidos;
- `TREQ-PULSO-008` a `TREQ-PULSO-027`, sobre seis páginas, identidad de rutas, ausencia de dinámicas y handlers, SSO, denegación, territorialidad, acciones de pedidos, importación de ventas, salón, query params, evidencia, drift, navegación y fronteras de aplicación.

Estas referencias son trazabilidad de cobertura existente y no constituyen una modificación del registro 04A.

#### 36. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                                                                                                                                 |
| --------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | El marcador documental no instala dependencias, no ejecuta build de PULSO y no materializa el harness.                                                                                                                                                                                                                                                                    |
| LOCAL     | NOT_EXECUTED   | El artefacto todavía no ha sido incorporado ni validado por el checkout local del usuario.                                                                                                                                                                                                                                                                                |
| REMOTA    | PASS           | Se verificaron continuidad CI009→CI010→CI011, topología `GLOBAL_ENABLE_ONCE`, las cuatro relaciones package–PULSO, commit remoto observado, manifest y lockfile, árbol completo, seis páginas, cero patrones dinámicos, cero route handlers, guard/SSO, pedidos, importación de ventas, salón/Realtime, scanner/loyalty, clientes Supabase y cobertura 04A PULSO vigente. |
| OPERATIVA | NOT_EXECUTED   | No se ejecutaron pedidos, ventas, redenciones, loyalty, salón, importaciones, Realtime, Supabase ni datos reales.                                                                                                                                                                                                                                                         |
| FÍSICA    | NOT_APPLICABLE | La materialización pertenece a `SHELL-CI-010::GLOBAL` después de aprobación documental y autorización física explícita.                                                                                                                                                                                                                                                   |

#### 37. Criterios de aceptación

`SHELL-CI-010` queda documentalmente completa cuando:

- identifica `devVentoGroup/vento-pulso` como consumidor propietario;
- conserva CI006 como propietario del cambio y del PR;
- conserva la disciplina de CI007, CI008 y CI009 sin reutilizar evidencia de otro consumidor;
- gobierna exactamente cuatro relaciones package–PULSO;
- define unidad de evidencia ligada a commit, manifest, lockfile, suite, fixtures, rutas, contratos fuente y entorno;
- exige ejecutar línea base antes de modificar versiones objetivo;
- define doce superficies funcionales comunes;
- define cuatro perfiles de familia;
- protege seis páginas, cero patrones dinámicos y cero handlers;
- conserva `/` y `/scanner` como identidades distintas;
- conserva delegación SSO al Shell y ausencia de `/login` local;
- exige caminos permitidos y denegados;
- protege sede, sesión, actor, dispositivo y recurso;
- protege scanner, identificación de cliente, loyalty y redención;
- protege pedidos, líneas, pagos operativos, estados, despacho, chat, historial y facturación;
- protege salón, mesas, sesiones, llamados y Realtime;
- protege importación XLSX, mapeos, lotes y publicación;
- protege idempotencia, replay y no duplicación de efectos;
- protege clientes Supabase/RLS sin autorizar cambios de base de datos desde PULSO;
- protege UI, SSR, interacción y accesibilidad;
- convierte ausencia de suite en bloqueo físico;
- soporta `INITIAL_ADOPTION`;
- soporta conjuntos multi-package;
- invalida evidencia ante cambios materiales;
- produce evidencia consumible por CI006;
- conserva fronteras PULSO–PASS–NEXO–Shell;
- separa habilitador VERIFIED de consumidor conforme;
- no crea PR, no actualiza packages, no fusiona, no despliega y no ejecuta rollback durante el marcador;
- no crea ni modifica requisitos de prueba.

#### 38. Límites

Esta tarea no:

- implementa físicamente `SHELL-CI-010::GLOBAL`;
- instala un framework de pruebas durante el marcador documental;
- modifica `package.json` o `package-lock.json` de PULSO;
- actualiza `@vento/contracts`, `@vento/os-context`, `@vento/supabase` ni `@vento/ui-web`;
- modifica código funcional PULSO;
- retira `orders-board-legacy`;
- fusiona `/` y `/scanner`;
- inventa una ruta `/login`;
- crea ramas ni pull requests;
- modifica la lógica del actualizador CI006;
- recalcula compatibilidad CI005;
- reutiliza evidencia NEXO, FOGO u ORIGO como si perteneciera a PULSO;
- normaliza todos los comandos del repositorio, responsabilidad de CI016;
- implementa por anticipado caja completa, pagos, sesiones POS, fiscal, delivery integral, reporting o demás capacidades futuras;
- convierte PULSO en propietario de cliente/loyalty de PASS, inventario de NEXO ni gobierno Supabase de Shell;
- modifica schema, tablas, RPC, RLS, Storage, Realtime, Edge Functions, datos, secretos o configuración Supabase;
- crea ni modifica migraciones dentro de PULSO;
- usa datos productivos;
- ejecuta rollback de CI014;
- coordina despliegue de CI015;
- desarrolla CI011 ni otra tarea posterior;
- crea, modifica, difiere, descarta ni vuelve obsoletos requisitos del registro 04A.

#### 39. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-CI-009 — Probar ORIGO antes de actualizar`

**TAREA ACTUAL APROBADA**
`SHELL-CI-010 — Probar PULSO antes de actualizar`

**SIGUIENTE TAREA RESERVADA**
`SHELL-CI-011 — Probar VISO antes de actualizar`


### [ ] SHELL-CI-011 — Probar VISO antes de actualizar
### [ ] SHELL-CI-012 — Probar NUMERA antes de actualizar
### [ ] SHELL-CI-013 — Probar ANIMA antes de actualizar
### [ ] SHELL-CI-014 — Permitir rollback por repositorio
### [ ] SHELL-CI-015 — Evitar despliegue simultáneo obligatorio
