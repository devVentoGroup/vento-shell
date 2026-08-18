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


### ✅ SHELL-CI-011 — Probar VISO antes de actualizar

**Estado:** APROBADA
**Tarea anterior:** SHELL-CI-010 — Probar PULSO antes de actualizar
**Tarea siguiente:** SHELL-CI-012 — Probar NUMERA antes de actualizar
**Tipo de tarea:** Habilitador global único — contrato documental de pruebas específicas de VISO previas a actualización de packages compartidos
**Bloque:** BLOQUE T — CI, pruebas, despliegue y rollback base
**Repositorio propietario:** `devVentoGroup/vento-viso`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/T_CALIDAD_Y_DESPLIEGUE/02_PRUEBAS_DE_CONSUMIDORES_Y_ROLLBACK.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada el contrato de pruebas que deberá demostrar que **VISO conserva una línea base reproducible, íntegra, atribuible y fail-closed antes de modificar su conjunto de packages compartidos**, de modo que una actualización preparada por CI006 nunca parta de un consumidor ambiguo, de un inventario de superficies desactualizado, de evidencia perteneciente a otro commit, de un handler tratado como página, de una ruta protegida sin guard efectivo, de una mutación administrativa que amplíe autoridad por parámetros controlados por cliente o de una ejecución de prueba que produzca cambios reales en roles, permisos, menús, productos, contenido, personal, horarios, Storage, datos o configuración Supabase.

La regla vinculante queda:

```text
VISO EN UN COMMIT BASE EXACTO
+ MANIFEST Y LOCKFILE EXACTOS
+ INVENTARIO 61 PÁGINAS / 10 HANDLERS CONCILIADO
+ CLASIFICACIÓN 48 ESTÁTICAS / 13 DINÁMICAS CONCILIADA
+ EXPOSICIÓN 59 PROTEGIDAS / 2 SUPERFICIES PÚBLICAS CONTROLADAS CONCILIADA
+ ENTORNO DE PRUEBA AISLADO
+ RELACIÓN PACKAGE–VISO EXACTA
+ PERFIL DE PRUEBAS VISO APLICABLE
+ PRUEBAS FUNCIONALES, DE AUTORIZACIÓN, SERVIDOR, DATOS E INTERFAZ SATISFACTORIAS
+ EVIDENCIA VIGENTE
= LÍNEA BASE VISO APTA PARA INICIAR UNA PROPUESTA DE ACTUALIZACIÓN
```

Y, de forma fail-closed:

```text
LINT VERDE
O BUILD VERDE
O LOGIN QUE REDIRIGE
O DASHBOARD QUE RENDERIZA
O HANDLER QUE RESPONDE
O COMPATIBILIDAD DE OTRO CONSUMIDOR
O PRUEBAS DE OTRO COMMIT
O AUSENCIA DE TESTS AUTOMATIZADOS
O USO DE DATOS REALES PARA OBTENER VERDE
≠ LÍNEA BASE VISO CERTIFICADA
```

CI011 certifica la línea base específica de VISO. No publica packages, no modifica la versión objetivo, no prepara el pull request, no fusiona, no despliega, no ejecuta rollback y no convierte la autocertificación del habilitador en una afirmación de que todos los módulos administrativos, comerciales, de personal, programación, service desk, cumplimiento o gobierno de información estén funcionalmente cerrados.

#### 2. Resultado canónico

`SHELL-CI-011` establece un único habilitador reutilizable para:

1. identificar el commit base exacto de `devVentoGroup/vento-viso` que se pretende actualizar;
2. fijar las identidades del manifest, lockfile, configuración, suite, fixtures, inventario de rutas, inventario de handlers, contratos fuente y entorno;
3. seleccionar únicamente las relaciones package–VISO aplicables;
4. seleccionar el perfil VISO correspondiente a cada familia compartida objetivo;
5. ejecutar una línea base técnica reproducible sobre el commit base sin modificar versiones de packages;
6. reconciliar exactamente 61 páginas, 48 patrones estáticos, 13 patrones dinámicos y 10 route handlers;
7. conservar los diez handlers fuera del conteo de páginas y con identidad técnica propia;
8. conservar 59 rutas protegidas y dos superficies públicas controladas sin interpretar publicidad como autorización;
9. conservar `/login` como puente SSO hacia Shell y `/no-access` como estado de denegación que no repara autoridad;
10. proteger middleware, guardas, sesión operativa, acceso a VISO, sede, área, rol efectivo, simulación, dispositivo compartido y permisos;
11. impedir que `returnTo`, `site_id`, IDs, slugs, parámetros de búsqueda, formularios o payloads cliente amplíen autoridad;
12. proteger roles, permisos, sedes, áreas, perfiles y excepciones administrativas;
13. proteger empresas, catálogo, productos, menú, colecciones, disponibilidad, delivery y configuración comercial;
14. proteger CMS, bloques de contenido, medios y handlers de carga;
15. proteger personal, vacantes, documentos, asistencia, calendarios, programación semanal y mensual;
16. proteger la separación entre páginas, layouts, componentes, Server Actions, helpers y handlers;
17. proteger handlers excluidos del matcher mediante autenticación, autorización, contexto y validación propias;
18. proteger clientes Supabase browser, server y admin, incluido el confinamiento server-only de service-role;
19. probar RLS, RPC, consultas, Storage y operaciones administrativas sin autorizar migraciones ni cambios remotos desde VISO;
20. proteger fronteras VISO–Shell–PASS–NEXO–ANIMA y evitar apropiación de dominios ajenos;
21. probar render, hidratación, interacción, formularios, feedback, accesibilidad y denegación representativa cuando la familia objetivo sea UI;
22. producir evidencia machine-readable ligada al commit base y al conjunto exacto de pruebas;
23. invalidar la evidencia cuando cambie cualquiera de sus entradas materiales;
24. bloquear una actualización cuando no exista infraestructura de prueba suficiente;
25. entregar a CI006 un resultado de línea base consumible para comparar el comportamiento previo y el `proposal_commit` posterior;
26. soportar una actualización multi-package mediante la unión de perfiles requeridos, sin reducir cobertura;
27. autocertificar el habilitador global una sola vez antes de reutilizarlo en futuras actualizaciones de VISO;
28. separar la certificación del habilitador de la conformidad funcional completa del consumidor.

#### 3. Frontera de responsabilidad

| Responsabilidad                                              | Propietario         |
| ------------------------------------------------------------ | ------------------- |
| pruebas propias del package                                  | `SHELL-CI-001`      |
| artefacto distribuible del package                           | `SHELL-CI-002`      |
| identidad y publicación de release                           | `SHELL-CI-003`      |
| changelog y release notes                                    | `SHELL-CI-004`      |
| compatibilidad package–consumidor                            | `SHELL-CI-005`      |
| preparación y mantenimiento del PR consumidor                | `SHELL-CI-006`      |
| línea base y pruebas específicas de NEXO                     | `SHELL-CI-007`      |
| línea base y pruebas específicas de FOGO                     | `SHELL-CI-008`      |
| línea base y pruebas específicas de ORIGO                    | `SHELL-CI-009`      |
| línea base y pruebas específicas de PULSO                    | `SHELL-CI-010`      |
| línea base y pruebas específicas de VISO antes de actualizar | `SHELL-CI-011`      |
| pruebas específicas de NUMERA                                | `SHELL-CI-012`      |
| pruebas específicas de ANIMA                                 | `SHELL-CI-013`      |
| rollback por repositorio                                     | `SHELL-CI-014`      |
| independencia de despliegue                                  | `SHELL-CI-015`      |
| normalización transversal de comandos                        | `SHELL-CI-016`      |
| trazabilidad de requisitos y evidencia por PR                | `SHELL-CI-017..019` |

CI011 puede exigir un punto de entrada reproducible para su propia suite. No absorbe la normalización transversal de comandos reservada a CI016, no convierte la línea base en implementación funcional de los pendientes de VISO y no corrige por anticipado obligaciones cuyo owner ya esté asignado a otros bloques.

#### 4. Topología de trabajo

`PHASE-03-T-CI-FOUNDATION` aplica `GLOBAL_ENABLE_ONCE` a `SHELL-CI-011`.

Por tanto:

```text
MARCADOR CANÓNICO
SHELL-CI-011
→ define una sola vez el contrato de pruebas previas de VISO

INSTANCIA FÍSICA FUTURA
SHELL-CI-011::GLOBAL
→ materializa y autocertifica una sola vez el habilitador VISO

ACTUALIZACIONES POSTERIORES DE VISO
→ reutilizan el habilitador certificado
→ generan evidencia nueva por commit base y conjunto objetivo
→ no vuelven a implementar CI011
```

La instancia global puede utilizar fixtures, dobles, oracles sintéticos, snapshots de inventario y entornos locales o CI aislados. No necesita actualizar un package real, cambiar permisos reales, publicar horarios, cargar medios, crear productos ni mutar Supabase productivo para demostrar que el habilitador funciona.

#### 5. Handoff vinculante desde CI006, CI007, CI008, CI009 y CI010

CI006 ya materializó el actualizador común y conserva las 28 relaciones base, los gates de actualización, la invalidación por commit y la prohibición de auto-merge y auto-deploy.

CI007 a CI010 ya establecieron la disciplina común para líneas base previas de consumidores:

- identidad exacta;
- evidencia atribuible;
- semántica fail-closed;
- invalidación por cambios materiales;
- separación entre habilitador global y ejecución por actualización;
- prohibición de reutilizar evidencia de otro consumidor;
- ausencia de tests distinta de PASS;
- separación entre harness autocertificado y consumidor integralmente conforme.

CI011 conserva esa disciplina y la especializa para VISO, donde deben coexistir un inventario amplio de superficies administrativas, diez handlers técnicos separados, middleware con `/api` excluido, guardas de autorización especializados, SSO, contexto operativo, administración comercial, personal, programación y operaciones server-side.

La secuencia lógica será:

```text
RELEASE OBJETIVO CONOCIDA
→ RELACIÓN PACKAGE–VISO RESUELTA
→ COMMIT BASE VISO FIJADO
→ CI011 CERTIFICA LA LÍNEA BASE DEL COMMIT BASE
→ CI006 MATERIALIZA LA PROPUESTA AISLADA
→ CI006 EJECUTA O CONSUME LOS GATES SOBRE EL PROPOSAL COMMIT
→ SE COMPARA CON LA LÍNEA BASE VIGENTE
→ REVISIÓN HUMANA
```

Un `PASS` de CI011 no sustituye CI005 ni autoriza por sí mismo `ELIGIBLE`, `READY_FOR_REVIEW`, merge, despliegue o adopción.

#### 6. Relaciones package–VISO gobernadas

CI011 gobierna exactamente las cuatro combinaciones VISO de la matriz web base:

| Familia             | Compatibilidad CI005 | Actualización CI006 | Consumidor   |
| ------------------- | -------------------- | ------------------- | ------------ |
| `@vento/contracts`  | `PKG-COMP-MX-002`    | `PKG-PR-REL-002`    | `vento-viso` |
| `@vento/os-context` | `PKG-COMP-MX-009`    | `PKG-PR-REL-009`    | `vento-viso` |
| `@vento/supabase`   | `PKG-COMP-MX-016`    | `PKG-PR-REL-016`    | `vento-viso` |
| `@vento/ui-web`     | `PKG-COMP-MX-023`    | `PKG-PR-REL-023`    | `vento-viso` |

**Conciliación:** 4 relaciones VISO esperadas, 4 materializadas en el contrato, 0 faltantes y 0 duplicadas.

Ninguna evidencia de NEXO, FOGO, ORIGO, PULSO, NUMERA, SHELL o ANIMA satisface estas cuatro relaciones.

#### 7. Línea base física observada de VISO

En el corte remoto inspeccionado de `devVentoGroup/vento-viso`:

- la rama principal es `main`;
- el commit remoto observado es `47322403f3c64e83ae0c4a2f68c05d47093e5bb4`;
- existe `package-lock.json` y el repositorio es una aplicación Next privada;
- el manifest declara `lint`, `build` y `audit:i18n`;
- el manifest no declara un script de pruebas automatizadas;
- el manifest no declara un script dedicado de typecheck;
- no se observaron archivos `.test.*` ni `.spec.*` en el árbol completo;
- no se declaran todavía dependencias publicadas `@vento/*`;
- se observan Next `^16.1.6`, React `19.2.3`, React DOM `19.2.3`, Supabase JS `^2.90.1` y Supabase SSR `^0.8.0`;
- el inventario canónico reconciliado contiene 61 páginas: 48 estáticas y 13 dinámicas;
- el inventario canónico mantiene 59 rutas protegidas y dos superficies públicas controladas;
- existen diez route handlers separados del inventario de páginas;
- `/login` materializa un puente SSO hacia Shell y normaliza `returnTo`;
- `/no-access` materializa un estado de denegación y solo acepta un `returnTo` relativo;
- el middleware excluye `login` y `/api` de su matcher, por lo que los handlers no pueden depender del middleware como único control;
- el guard central resuelve usuario, sesión operativa, acceso a aplicación, sede, área, dispositivo compartido, permisos y role override;
- existe cliente Supabase admin protegido con `server-only` y service-role únicamente en servidor;
- el árbol materializa superficies administrativas, comerciales, CMS, operaciones, personal, programación, asistencia, vacantes, usuarios PASS y componentes estándar;
- la programación mensual y semanal conviven dentro del mismo dominio de personal y requieren conservar paridad, límites, borrador/publicación, validación server-side y trazabilidad según sus requisitos propietarios;
- cualquier modificación futura de schema, RPC, RLS, Storage, Realtime, Edge Functions, datos o configuración Supabase permanece propiedad de `devVentoGroup/vento-shell`.

Conclusión documental: **VISO todavía no puede considerarse físicamente certificado para CI011 por la sola existencia de lint y build**. La futura `SHELL-CI-011::GLOBAL` deberá materializar infraestructura de pruebas automatizadas reproducible y autocertificar el habilitador.

#### 8. Inventario contractual de rutas y handlers VISO

CI011 toma como línea base canónica:

```text
PÁGINAS
61 totales
48 estáticas
13 dinámicas

EXPOSICIÓN
59 protegidas
2 superficies públicas controladas

HANDLERS
10 route handlers
separados de las páginas

PATRONES TÉCNICOS COMBINADOS
71
sin llamar pantallas a los handlers
```

Las dos superficies públicas controladas son:

- `/login`;
- `/no-access`.

Esta clasificación no significa que ambas permitan acceso anónimo irrestricto. `/login` permanece como puente SSO; `/no-access` permanece como estado de denegación y nunca concede autoridad.

Los trece patrones dinámicos conservan `[id]` o `[slug]` como parte de la identidad contractual y no se expanden por cada entidad existente.

Los diez handlers observados permanecen separados de las 61 páginas. Entre sus familias se encuentran:

- health;
- attendance report;
- reordenamiento de menú;
- programación de personal;
- ocultamiento de personal en programación;
- carga de medios comerciales;
- carga de logo;
- carga de imagen de producto;
- carga de medios de website;
- personalizaciones técnicas de menú.

Cualquier alta, baja, movimiento, duplicación, cambio de patrón, cambio de guard o nuevo handler vuelve stale la evidencia que dependa del inventario hasta que exista un delta explícito.

#### 9. Distinción entre habilitador certificado y consumidor conforme

CI011 fija dos afirmaciones diferentes que nunca podrán fusionarse:

```text
SHELL-CI-011::GLOBAL = VERIFIED
```

significa:

- existe el harness;
- el harness es reproducible;
- detecta sus escenarios positivos y negativos;
- detecta drift de 61 páginas, 13 dinámicas, 10 handlers y exposición de rutas;
- detecta stale evidence, otro consumidor, cero tests, aislamiento inválido, secretos y falsas condiciones de PASS;
- produce evidencia machine-readable;
- no requiere mutaciones productivas.

No significa:

```text
EL COMMIT ACTUAL DE VISO CUMPLE TODOS LOS REQUISITOS FUNCIONALES FUTUROS DEL DOMINIO
```

La conformidad del consumidor se determina en cada ejecución real de línea base contra su commit exacto.

Deudas o capacidades todavía no implementadas —incluidos cierres posteriores de service desk, gobierno de información, políticas de programación, seguridad de handlers, experiencia o paquetes E5— pueden coexistir con un harness global correctamente autocertificado. Cuando una deuda registrada sea aplicable al perfil ejecutado, la ejecución real deberá devolver `FAIL` o `BLOCKED` en lugar de ocultarla.

#### 10. Unidad exacta de certificación previa

Cada resultado de CI011 se atribuye como mínimo a:

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
handler_inventory_identity
source_contract_identity
environment_identity
runtime_identity
framework_identity
target_package_set
compatibility_refs
viso_profile_set
execution_identity
started_at
completed_at
result
invalidation_reason
```

La unidad certificada es el **commit base sin la actualización propuesta**.

Cambiar commit, manifest, lockfile, suite, fixtures, inventario de páginas, inventario de handlers, configuración, contratos fuente, entorno o perfil invalida la reutilización del resultado anterior.

#### 11. Momento de ejecución

La prueba previa debe ejecutarse después de conocer el conjunto objetivo y antes de materializar la actualización sobre VISO.

Orden obligatorio:

1. resolver release o conjunto mínimo cerrado de releases objetivo;
2. resolver una o más de las cuatro relaciones VISO;
3. fijar `consumer_base_commit`;
4. fijar manifest y lockfile del commit base;
5. fijar inventarios de páginas, handlers y contratos fuente aplicables;
6. resolver los perfiles VISO exigidos por las familias objetivo;
7. ejecutar la línea base común y los perfiles seleccionados sin cambiar versiones de packages;
8. consolidar la evidencia;
9. solo con resultado satisfactorio permitir que CI006 continúe con la preparación aislada de la propuesta.

Si durante la prueba cambia el commit base, la ejecución en curso deja de ser atribuible y debe reiniciarse sobre la nueva identidad.

#### 12. Semántica de resultado

CI011 reutiliza la semántica fail-closed aprobada:

- `PENDING`;
- `RUNNING`;
- `PASS`;
- `FAIL`;
- `BLOCKED`;
- `CANCELLED`;
- `TIMED_OUT`;
- `STALE`;
- `NOT_APPLICABLE` únicamente para comprobaciones realmente condicionales y justificadas.

Para declarar una línea base VISO apta se requiere `PASS` global de las comprobaciones obligatorias seleccionadas.

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
- omisión de una página o handler;
- contar un handler como página;
- degradar 61 páginas a un snapshot histórico de 60;
- tratar un `[id]` o `[slug]` como múltiples rutas;
- aceptar un handler porque el middleware proteja páginas;
- mutaciones contra datos reales;
- uso de service-role real en fixtures;
- una deuda crítica aplicable convertida manualmente en PASS.

#### 13. Línea base técnica común

Toda certificación previa de VISO deberá demostrar, sobre el mismo commit base:

1. instalación bloqueada reproducible con el lockfile vigente;
2. manifest y lockfile coherentes;
3. lint o análisis estático aplicable;
4. typecheck real de TypeScript;
5. build de producción aplicable;
6. ejecución de la suite automatizada específica de VISO;
7. ausencia de tests omitidos silenciosamente;
8. identidad del entorno y runtime registrada;
9. evidencia separada por comprobación;
10. resultado global fail-closed;
11. inventarios de páginas, handlers y contratos fuente conciliados;
12. ausencia de escrituras productivas provocadas por la propia certificación.

El manifest observado no define una suite de tests ni typecheck dedicado. La futura materialización deberá incorporar puntos de entrada reproducibles dentro del alcance expresamente autorizado.

Un build satisfactorio no sustituye las pruebas automatizadas específicas.

#### 14. Matriz funcional mínima obligatoria de VISO

La suite global deberá cubrir como mínimo estas doce superficies. La implementación física puede dividir cada superficie en varios tests, pero no eliminarla sin una decisión canónica posterior.

|    # | Superficie                                                      | Afirmación positiva mínima                                                                        | Afirmación negativa o de borde mínima                                                                       |
| ---: | --------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
|    1 | identidad, sesión, SSO y denegación                             | identidad válida conserva sesión, SSO, retorno seguro y acceso requerido                          | sesión ausente, `returnTo` externo, auth error o app no autorizada falla cerrado                            |
|    2 | contexto operativo, sede, área, actor, simulación y dispositivo | contexto efectivo limita la operación al territorio y actor permitidos                            | cambiar sede, área, role override, dispositivo o actor no concede autoridad                                 |
|    3 | inventario de páginas y rutas                                   | 61 páginas, 48 estáticas, 13 dinámicas y sus identidades permanecen conciliadas                   | alta, baja, movimiento, duplicado o expansión de `[id]/[slug]` bloquea                                      |
|    4 | handlers y frontera servidor                                    | 10 handlers conservan identidad propia y controles server-side aplicables                         | handler sin auth, autorización, contexto o validación queda bloqueado                                       |
|    5 | roles, permisos, sedes y estructura                             | configuración permitida conserva alcance, origen y resultado efectivo                             | edición ajena, permiso inesperado, conflicto oculto o self-escalation falla                                 |
|    6 | comercio, menú, productos y colecciones                         | entidad comercial válida conserva identidad, pertenencia, orden y estado                          | colección ajena, orden inválido, producto no autorizado o edición fuera de alcance falla                    |
|    7 | CMS, contenido, medios y uploads                                | publicación o carga autorizada conserva tipo, tamaño, destino y ownership                         | archivo inválido, destino ajeno, nombre inseguro o almacenamiento no autorizado falla                       |
|    8 | personal, vacantes, documentos y asistencia                     | operaciones de personal autorizadas conservan sujeto, sede, rol y trazabilidad                    | recurso ajeno, documento no permitido, cambio territorial o dato sensible indebido falla                    |
|    9 | programación semanal, mensual y calendario                      | fechas, turnos, bloques, límites, borrador/publicación y paridad conservan contrato               | fecha inválida, overlap, límite excedido, publicación prohibida o doble fuente falla                        |
|   10 | atomicidad, idempotencia, concurrencia y recuperación           | reintentos conservan una identidad lógica y efectos reconciliables                                | replay, doble submit, conflicto concurrente o timeout no produce falso éxito                                |
|   11 | integración y fronteras de dominio                              | VISO administra sus superficies y consume Shell, PASS, NEXO y ANIMA mediante contratos explícitos | VISO no adquiere por conveniencia ownership de auth global, inventario, cliente/loyalty o gobierno Supabase |
|   12 | UI, SSR, interacción, accesibilidad y errores                   | superficies representativas renderizan, hidratan y presentan éxito/error/deny consistentemente    | hidratación, teclado, foco, formulario, loading, error o deny fallido no se normaliza a éxito               |

Estas doce superficies son la línea base común. Los perfiles de familia agregan obligaciones, no las sustituyen.

#### 15. Perfil VISO para `@vento/contracts`

Cuando la relación objetivo incluya `PKG-PR-REL-002`, la línea base deberá cubrir especialmente:

- identidades y estructuras consumidas por empresas, sedes, usuarios, personal, productos, menús y colecciones;
- identidades y estados de permisos, roles, perfiles, simulaciones y dispositivos;
- contratos de programación, turnos, áreas, roles operativos, asistencia y calendario;
- shapes de CMS, bloques, ítems, venues, media y metadatos comerciales;
- payloads de acciones administrativas y handlers;
- cantidades, fechas, duraciones, límites, prioridades y estados cuando sean consumidos;
- diferencia entre dato ausente, `null`, inválido, denegado y no aplicable;
- compilación de los puntos de consumo TypeScript;
- serialización y deserialización aplicables;
- ausencia de casts o fallbacks globales que oculten una incompatibilidad.

La evidencia se vincula a `PKG-COMP-MX-002` y `PKG-PR-REL-002`.

#### 16. Perfil VISO para `@vento/os-context`

Cuando la relación objetivo incluya `PKG-PR-REL-009`, la línea base deberá cubrir especialmente:

- sesión real y sesión ausente;
- delegación SSO al Shell;
- acceso a la aplicación VISO;
- contexto operativo por sede y área;
- permiso concedido y permiso denegado;
- sede solicitada frente a sede efectiva;
- contexto incompleto o manipulado;
- acceso directo a rutas protegidas representativas;
- role override únicamente cuando el contrato lo permita;
- simulación y actor efectivo;
- dispositivo compartido y aplicaciones permitidas;
- preservación de razones de denegación;
- prohibición de elevar autoridad desde query params, IDs, slugs o valores controlados por cliente.

La evidencia se vincula a `PKG-COMP-MX-009` y `PKG-PR-REL-009`.

#### 17. Perfil VISO para `@vento/supabase`

Cuando la relación objetivo incluya `PKG-PR-REL-016`, la línea base deberá cubrir especialmente:

- clientes browser, server y admin;
- propagación de sesión y cookies;
- confinamiento `server-only` del cliente privilegiado;
- ausencia de service-role en bundles cliente o fixtures;
- consultas de roles, permisos, sedes, personal, programación, comercio y contenido;
- RPC y acciones nombradas aplicables;
- Storage y handlers de medios;
- operaciones permitidas dentro del alcance autorizado;
- operaciones denegadas por permisos o RLS;
- aislamiento por sede y área;
- respuestas de error y estados parciales;
- correspondencia entre schema de prueba y fuente canónica de `vento-shell`;
- ausencia de bypass por cliente admin, wrapper, fallback o manejo de errores;
- build y suite sin mutaciones remotas.

Las pruebas que requieran base de datos deberán usar un entorno local o CI aislado derivado de la fuente canónica de `vento-shell`. La falta de ese entorno cuando la comprobación sea obligatoria produce `BLOCKED`, no `NOT_APPLICABLE`.

La evidencia se vincula a `PKG-COMP-MX-016` y `PKG-PR-REL-016`.

#### 18. Perfil VISO para `@vento/ui-web`

Cuando la relación objetivo incluya `PKG-PR-REL-023`, la línea base deberá cubrir especialmente:

- render servidor y cliente de superficies representativas;
- hidratación sin divergencias silenciosas;
- shell visual, app switcher, profile menu, tablas, headers y componentes estándar;
- formularios administrativos y comerciales;
- tablas, filtros, estados vacíos, loading, success y error;
- edición de menú, productos, colecciones y CMS;
- programación y calendario;
- foco, teclado y semántica accesible aplicable;
- deny states sin exposición de datos protegidos;
- integración de tokens y estilos sin degradar legibilidad u operación;
- ausencia de imports privados no contractuales.

La evidencia se vincula a `PKG-COMP-MX-023` y `PKG-PR-REL-023`.

#### 19. Protección reforzada de SSO, middleware y handlers

CI011 deberá conservar tres fronteras distintas:

```text
MIDDLEWARE DE SESIÓN
≠ GUARD DE APLICACIÓN Y PERMISO
≠ AUTORIZACIÓN PROPIA DEL HANDLER
```

La línea base deberá demostrar:

1. ausencia de cookies → redirección controlada;
2. ausencia de configuración Supabase → redirección controlada;
3. auth error o usuario ausente → denegación y limpieza aplicable;
4. `/login` conserva función de puente y `returnTo` seguro;
5. `/no-access` no acepta destino externo como autoridad;
6. una ruta protegida revalida aplicación, permiso y contexto;
7. `/api` no depende del matcher para su protección;
8. cada handler obligatorio demuestra controles propios;
9. `GET /api/health` no expone secretos ni valores sensibles;
10. handlers de carga validan tipo, tamaño, destino y nombre;
11. reordenamiento de menú valida pertenencia y límites;
12. cualquier handler que use privilegio elevado mantiene ese privilegio confinado al servidor.

#### 20. Protección reforzada de administración y configuración

Las superficies administrativas deberán demostrar, según aplicabilidad:

- roles y permisos;
- sedes y áreas;
- perfiles y excepciones;
- actor real y actor efectivo;
- contexto territorial;
- simulación;
- origen de permiso;
- resultado efectivo previo a guardar cuando el contrato lo requiera;
- prohibición de autoescalamiento;
- cambios de estructura con recursos pertenecientes al mismo ámbito;
- trazabilidad de quién cambió qué;
- rechazo de IDs ajenos o manipulados;
- separación entre poder ver una pantalla y poder ejecutar todas sus acciones.

Una autorización de navegación nunca sustituye la autorización de la mutación.

#### 21. Protección reforzada de comercio, menú, CMS y medios

La cobertura comercial deberá poder evaluar:

- empresas y sedes;
- productos y productos nuevos;
- menú, ítems y personalizaciones;
- categorías y colecciones;
- disponibilidad y delivery;
- orden comercial;
- website CMS;
- bloques e ítems;
- venues;
- uploads de logo, producto, menú y website;
- tipo y tamaño de medio;
- destino y ownership;
- respuesta de almacenamiento;
- edición de recurso ajeno;
- consistencia entre colección, categoría, orden y entidad;
- separación entre publicación visible y autoridad administrativa.

CI011 no convierte VISO en owner de inventario físico ni de datos de cliente de PASS.

#### 22. Protección reforzada de personal, asistencia y programación

La línea base deberá poder evaluar, según el commit y perfil aplicables:

- personal;
- alta de personal;
- ficha individual;
- vacantes;
- usuarios PASS administrados desde superficies autorizadas;
- documentos y reglas documentales;
- asistencia;
- calendario;
- programación semanal;
- programación global;
- programación mensual;
- settings y métricas;
- fechas de 28, 29, 30 y 31 días;
- bloques, inicio, fin, pausas y overnight según política vigente;
- borrador y publicación como comandos diferentes;
- límites y umbrales desde política única;
- total mensual entre sedes sin ampliar visibilidad;
- concurrencia y rollback;
- auditoría y `published_by`;
- notificación a ANIMA idempotente y correlacionada;
- paridad Semana/Mes sobre una misma fuente.

La autocertificación global puede utilizar escenarios sintéticos para demostrar detección de estas condiciones. No necesita publicar horarios reales.

#### 23. Protección reforzada del cliente privilegiado y Supabase

La presencia de un cliente admin server-only exige pruebas negativas específicas:

1. el módulo privilegiado importa `server-only`;
2. service-role nunca aparece en código cliente;
3. service-role nunca aparece en fixtures o snapshots;
4. un bundle cliente no puede importar el módulo admin;
5. un handler no obtiene permiso por el mero uso de admin client;
6. autenticación, autorización y alcance se verifican antes de efectos privilegiados;
7. un dato de otra sede o área permanece denegado;
8. errores de RLS o autorización no se normalizan como éxito;
9. las pruebas no escriben contra producción;
10. CI011 no modifica schema, RLS, RPC ni grants para hacer pasar la suite.

#### 24. Datos, fixtures y aislamiento

Las pruebas de CI011 deberán cumplir simultáneamente:

1. no leer ni modificar datos productivos;
2. usar fixtures deterministas o entorno local/CI aislado;
3. no depender de IDs aleatorios no registrados;
4. limpiar o descartar estado temporal de forma reproducible;
5. no compartir estado mutable entre tests independientes;
6. no utilizar credenciales reales como fixture;
7. no introducir una migración VISO para acomodar la prueba;
8. cuando se necesite schema Supabase, consumir la fuente canónica de `vento-shell`;
9. registrar identidad del fixture set;
10. impedir que una falla de cleanup convierta el resultado en PASS;
11. no crear roles, permisos, productos, menús, contenidos, empleados, vacantes, turnos o uploads productivos;
12. no publicar programación real para demostrar idempotencia;
13. no usar service-role real en la autocertificación sintética;
14. separar fixtures administrativos, comerciales, CMS y personal;
15. mantener aislados los escenarios de otra sede, área, actor y recurso.

#### 25. Línea base antes de `INITIAL_ADOPTION`

El manifest observado de VISO no declara todavía packages publicados `@vento/*`.

Por tanto, la primera adopción futura de cualquiera de las cuatro familias deberá tratar la evidencia CI011 como **oráculo del comportamiento previo**:

```text
COMMIT BASE SIN EL PACKAGE COMPARTIDO
→ CI011 PASS
→ PROPUESTA INITIAL_ADOPTION
→ MISMA COBERTURA ESENCIAL SOBRE PROPOSAL COMMIT
→ COMPARACIÓN DE RESULTADOS
```

La ausencia actual del package no convierte sus pruebas específicas en no aplicables.

#### 26. Actualizaciones `PATCH`, `MINOR`, `MAJOR`, seguridad y deprecación

CI011 no sustituye las clases de actualización de CI006:

- `PATCH_UPDATE`: línea base completa y regresión focal;
- `MINOR_UPDATE`: añade escenarios para la nueva capacidad consumida;
- `MAJOR_UPDATE`: exige línea base completa y matriz explícita de comportamiento preservado/cambiado;
- `SECURITY_UPDATE`: mantiene autorización, territorialidad, actor, handler security, RLS y secretos; la urgencia no permite omitirlos;
- `DEPRECATION_MIGRATION`: conserva pruebas de la superficie antigua mientras siga soportada y de la ruta objetivo cuando exista;
- `ROLLBACK_UPDATE`: CI011 aporta la línea base; la ejecución y certificación del rollback pertenece a CI014.

#### 27. Actualización multi-package

Cuando CI006 resuelva más de una familia compartida:

1. CI011 selecciona la unión de todos los perfiles correspondientes;
2. ninguna familia reduce la cobertura de otra;
3. las doce superficies comunes permanecen;
4. una ejecución puede producir evidencia para el conjunto si las identidades permanecen unidas;
5. el conjunto objetivo queda registrado;
6. cambiar una sola versión objetivo invalida la evidencia dependiente;
7. no se usa lockstep artificial para incluir familias no requeridas.

#### 28. Evidencia consumible por CI006

La evidencia satisfactoria deberá permitir a CI006 demostrar al menos:

- repositorio consumidor exacto: `devVentoGroup/vento-viso`;
- commit base exacto;
- manifest y lockfile exactos;
- inventario de 61 páginas exacto;
- inventario de 10 handlers exacto;
- clasificación de 48 estáticas y 13 dinámicas;
- clasificación de exposición vigente;
- contratos fuente exactos;
- relación o relaciones VISO aplicables;
- conjunto de packages objetivo;
- referencias de compatibilidad CI005;
- perfil o perfiles VISO ejecutados;
- identidad de suite y fixtures;
- identidad del entorno;
- resultados por capa y superficie;
- total de tests ejecutados, aprobados, fallidos y omitidos;
- evidencia de caminos denegados aplicables;
- evidencia de que handlers y páginas permanecen separados;
- evidencia de aislamiento territorial y de actor;
- evidencia de confinamiento de privilegios;
- evidencia de que la certificación no produjo efectos productivos;
- timestamps de inicio y cierre;
- resultado global;
- razón de bloqueo o invalidación cuando no sea PASS.

La evidencia podrá formar parte de `validation_results` y `evidence_refs` del expediente `PKG-PR-*`, pero CI011 no crea ni mantiene ese expediente.

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
- inventario de 61 páginas;
- clasificación 48/13;
- inventario de 10 handlers;
- clasificación de exposición;
- contrato de `/login`;
- contrato de `/no-access`;
- middleware;
- guard, SSO, contexto, role override o dispositivo compartido;
- contratos fuente;
- contrato de roles o permisos;
- contrato comercial, CMS o de medios;
- contrato de personal o programación;
- fuente de schema usada para pruebas Supabase;
- relación package–VISO;
- versión o conjunto objetivo;
- referencia de compatibilidad CI005;
- superficie obligatoria;
- contrato de CI011.

No se conserva un PASS anterior mediante rebase, cherry-pick, actualización de snapshot o cambio de fixture sin nueva ejecución atribuible.

#### 30. Condiciones de bloqueo

La futura ejecución deberá quedar `BLOCKED` o `FAIL` según corresponda cuando ocurra cualquiera de estas condiciones:

1. no existe runner reproducible para pruebas VISO;
2. el runner ejecuta cero tests obligatorios;
3. falta identidad del commit base;
4. manifest o lockfile no corresponden al commit;
5. la suite cambió después de producir evidencia;
6. existe un test obligatorio omitido;
7. lint, typecheck o build obligatorio falla;
8. una prueba funcional obligatoria falla;
9. una prueba de denegación, autorización, contexto, actor, dispositivo, recurso, sede o área falla;
10. el entorno apunta a datos o servicios productivos;
11. un fixture contiene una credencial real;
12. evidencia CI005 pertenece a otra versión o consumidor;
13. la relación resuelta no corresponde a VISO;
14. se intenta modificar packages antes de cerrar línea base;
15. se intenta resolver el fallo mediante bypass, cast global, skip o snapshot forzado;
16. una operación de prueba intenta crear o cambiar schema, RLS, RPC, datos o configuración remota desde VISO;
17. evidencia de otro consumidor o commit se acepta como propia;
18. el inventario deja de conciliar 61 páginas;
19. el inventario deja de conciliar 48 estáticas y 13 dinámicas;
20. un handler entra al conteo de páginas;
21. uno de los diez handlers desaparece o aparece otro sin delta explícito;
22. una ruta protegida queda accesible sin controles aplicables;
23. un handler excluido del matcher carece de controles propios;
24. `returnTo`, `site_id`, ID, slug o payload cliente amplía autoridad;
25. un permiso de navegación se interpreta como permiso universal de mutación;
26. service-role aparece en cliente o fixture;
27. un upload acepta tipo, tamaño, destino o ownership inválidos;
28. un reorder de menú modifica recurso ajeno o deja orden parcial;
29. una operación de programación publica cuando el contrato exige bloqueo;
30. un retry o replay duplica un efecto que debe ser idempotente;
31. resultados contradictorios o flaky no han sido explicados;
32. una deuda crítica conocida se transforma manualmente en PASS.

Ninguna aprobación humana convierte estas condiciones técnicas en PASS.

#### 31. Materialización futura de `SHELL-CI-011::GLOBAL`

La instancia física solo podrá declararse materializada cuando, dentro del alcance expresamente autorizado:

1. exista infraestructura de pruebas automatizadas reproducible en `devVentoGroup/vento-viso`;
2. exista un punto de entrada determinista para la suite CI011;
3. exista typecheck real;
4. exista build CI reproducible sin efectos remotos;
5. las pruebas cubran las doce superficies comunes;
6. existan perfiles seleccionables para las cuatro familias;
7. existan casos permitidos y denegados de autorización;
8. exista cobertura del inventario 61/48/13;
9. exista cobertura de los diez handlers separados;
10. exista cobertura de la clasificación de exposición vigente;
11. exista prueba del puente SSO y del estado de denegación;
12. exista cobertura de middleware y guardas;
13. exista estrategia aislada para pruebas Supabase;
14. exista cobertura de cliente admin server-only y prohibición de exposición de service-role;
15. exista cobertura administrativa de roles, permisos y territorialidad;
16. exista cobertura comercial/CMS/media representativa;
17. exista cobertura de personal/programación representativa;
18. la suite no use datos productivos ni secretos reales;
19. las pruebas no modifiquen schema ni migraciones VISO;
20. identidad de commit, manifest, lockfile, suite, fixtures, rutas, handlers, contratos fuente y entorno forme parte de evidencia;
21. un cambio material vuelva STALE la evidencia;
22. una ejecución multi-package una perfiles sin reducir cobertura;
23. la salida sea machine-readable y consumible por CI006;
24. el habilitador falle sintéticamente ante al menos una ruptura por cada perfil;
25. demuestre que evidencia de otro consumidor o commit no es reutilizable;
26. demuestre que cero tests no se normaliza a PASS;
27. demuestre que drift de páginas o handlers no se normaliza a PASS;
28. demuestre que una manipulación territorial no se normaliza a PASS;
29. demuestre que privilegio elevado en cliente o fixture se clasifica como fallo;
30. la autocertificación no actualice packages, no abra PR, no despliegue y no ejecute rollback.

La selección física concreta de framework, archivos y devDependencies se resolverá durante la instancia con el estado actualizado de VISO. El contrato no impone un proveedor inexistente por inferencia.

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
12. retries de permisos, menú, uploads, publicación o programación se prueban mediante fixtures u oráculos aislados, no mediante repetición contra producción.

#### 33. Estado documental conciliado

| Métrica                                      |                          Resultado |
| -------------------------------------------- | ---------------------------------: |
| Repositorio consumidor                       | **1 — `devVentoGroup/vento-viso`** |
| Familias compartidas base                    |                              **4** |
| Relaciones CI005 de VISO                     |                              **4** |
| Relaciones CI006 de VISO                     |                              **4** |
| Páginas fuente canónicas                     |                             **61** |
| Patrones estáticos                           |                             **48** |
| Patrones dinámicos                           |                             **13** |
| Rutas protegidas                             |                             **59** |
| Superficies públicas controladas             |                              **2** |
| Route handlers                               |                             **10** |
| Patrones técnicos combinados                 |                             **71** |
| Superficies funcionales comunes obligatorias |                             **12** |
| Perfiles de familia                          |                              **4** |
| Auto-merge autorizado                        |                              **0** |
| Auto-deploy autorizado                       |                              **0** |
| Migraciones Supabase autorizadas en VISO     |                              **0** |
| Datos productivos autorizados para pruebas   |                              **0** |
| Requisitos de prueba creados o modificados   |                              **0** |

#### 34. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA
**Requisitos creados:** **0**
**Requisitos modificados:** **0**

**Justificación:** las obligaciones de probar consumidores antes de adoptar packages compartidos, disponer de comandos reproducibles, conservar evidencia atribuible y bloquear falsos verdes ya existen en el registro canónico. La cobertura VISO vigente ya protege inventario de rutas, handlers, SSO, denegación, middleware, autorización, territorialidad, comercio, CMS, medios, programación, service desk, gobierno de información y fronteras interaplicación. CI011 especializa esas obligaciones para la línea base previa de VISO y define su habilitador reutilizable; no introduce una regla empresarial independiente.

#### 35. Cobertura de prueba vigente reutilizada

La tarea reutiliza sin modificar, entre otras, estas obligaciones existentes:

- `TREQ-SHELL-005`, sobre comandos reproducibles y ausencia de falsos verdes;
- `TREQ-SHELL-006`, sobre pruebas propias, matriz de compatibilidad y validación por consumidor antes de publicar o adoptar;
- `TREQ-SHELL-008`, sobre requisitos afectados y resultados reproducibles por package y PR;
- `TREQ-SHELL-009`, sobre identidad verificable de repositorio, commit y ambiente;
- `TREQ-VISO-001`, sobre roles, permisos, sedes, áreas, perfiles y excepciones;
- `TREQ-VISO-002`, sobre mesa de servicio tecnológica;
- `TREQ-VISO-003`, sobre gobierno de información y segregación;
- `TREQ-VISO-004` a `TREQ-VISO-023`, sobre 61 páginas, rutas 001–061, clasificación 48/13, raíz, separación de superficies técnicas, SSO, no-access, middleware, exposición, guardas, drift, diez handlers, seguridad de `/api`, health, reorder, uploads y dinámicas;
- `TREQ-VISO-024` a `TREQ-VISO-045`, sobre programación mensual, paridad Semana/Mes, fechas, bloques, límites, publicación, concurrencia, rollback, auditoría, ANIMA y manipulación de acciones;
- `TREQ-VISO-046` a `TREQ-VISO-048`, sobre SLA de service desk, ciclo de problemas y gobierno de cambios tecnológicos.

Estas referencias son trazabilidad de cobertura existente y no constituyen una modificación del registro 04A.

#### 36. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                                                                |
| --------- | -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | El marcador documental no instala dependencias, no ejecuta build de VISO y no materializa el harness.                                                                                                                                                                                                    |
| LOCAL     | NOT_EXECUTED   | El artefacto todavía no ha sido incorporado ni validado por el checkout local del usuario.                                                                                                                                                                                                               |
| REMOTA    | PASS           | Se verificaron continuidad CI010→CI011→CI012, topología global, las cuatro relaciones package–VISO, commit remoto observado, manifest y lockfile, árbol completo, ausencia de suite test/spec, inventario 61/48/13/10, middleware, SSO, guard, Supabase admin server-only y cobertura TREQ VISO vigente. |
| OPERATIVA | NOT_EXECUTED   | No se ejecutaron cambios de permisos, comercio, CMS, personal, programación, Storage, Supabase ni datos reales.                                                                                                                                                                                          |
| FÍSICA    | NOT_APPLICABLE | La materialización pertenece a `SHELL-CI-011::GLOBAL` después de aprobación documental y autorización física explícita.                                                                                                                                                                                  |

#### 37. Criterios de aceptación

`SHELL-CI-011` queda documentalmente completa cuando:

- identifica `devVentoGroup/vento-viso` como consumidor propietario;
- conserva CI006 como propietario del cambio y del PR;
- conserva la disciplina de CI007 a CI010 sin reutilizar evidencia de otro consumidor;
- gobierna exactamente cuatro relaciones package–VISO;
- define unidad de evidencia ligada a commit, manifest, lockfile, suite, fixtures, páginas, handlers, contratos fuente y entorno;
- exige ejecutar línea base antes de modificar versiones objetivo;
- define doce superficies funcionales comunes;
- define cuatro perfiles de familia;
- protege 61 páginas, 48 estáticas y 13 dinámicas;
- protege 59 rutas y dos superficies públicas controladas según la clasificación canónica;
- protege diez route handlers separados de las páginas;
- conserva `/login` como puente SSO;
- conserva `/no-access` como deny state;
- exige caminos permitidos y denegados;
- protege sede, área, sesión, actor, simulación, role override y dispositivo;
- protege handlers excluidos del matcher con controles propios;
- protege cliente admin server-only y secretos;
- protege roles, permisos y estructura administrativa;
- protege comercio, menú, productos, CMS y medios;
- protege personal, asistencia y programación;
- protege clientes Supabase/RLS/RPC/Storage sin autorizar cambios de base de datos desde VISO;
- protege UI, SSR, interacción y accesibilidad;
- convierte ausencia de suite en bloqueo físico;
- soporta `INITIAL_ADOPTION`;
- soporta conjuntos multi-package;
- invalida evidencia ante cambios materiales;
- produce evidencia consumible por CI006;
- conserva fronteras VISO–Shell–PASS–NEXO–ANIMA;
- separa habilitador VERIFIED de consumidor conforme;
- no crea PR, no actualiza packages, no fusiona, no despliega y no ejecuta rollback durante el marcador;
- no crea ni modifica requisitos de prueba.

#### 38. Límites

Esta tarea no:

- implementa físicamente `SHELL-CI-011::GLOBAL`;
- instala un framework de pruebas durante el marcador documental;
- modifica `package.json` o `package-lock.json` de VISO;
- actualiza `@vento/contracts`, `@vento/os-context`, `@vento/supabase` ni `@vento/ui-web`;
- modifica código funcional VISO;
- modifica el inventario canónico de rutas;
- renumera `VISO-ROUTE-*`;
- trata handlers como páginas;
- convierte `/login` en autenticación local;
- convierte `/no-access` en mecanismo de autorización;
- crea ramas ni pull requests;
- modifica la lógica del actualizador CI006;
- recalcula compatibilidad CI005;
- reutiliza evidencia NEXO, FOGO, ORIGO o PULSO como si perteneciera a VISO;
- normaliza todos los comandos del repositorio, responsabilidad de CI016;
- implementa por anticipado service desk, gobierno de información, problemas, cambios tecnológicos ni demás capacidades futuras;
- convierte VISO en propietario de cliente/loyalty de PASS, inventario de NEXO ni gobierno Supabase de Shell;
- modifica schema, tablas, vistas, funciones, RPC, triggers, grants, RLS, Storage, Realtime, Edge Functions, datos, secretos o configuración Supabase;
- crea ni modifica migraciones dentro de VISO;
- usa datos productivos;
- ejecuta rollback de CI014;
- coordina despliegue de CI015;
- desarrolla CI012 ni otra tarea posterior;
- crea, modifica, difiere, descarta ni vuelve obsoletos requisitos del registro 04A.

#### 39. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-CI-010 — Probar PULSO antes de actualizar`

**TAREA ACTUAL APROBADA**
`SHELL-CI-011 — Probar VISO antes de actualizar`

**SIGUIENTE TAREA RESERVADA**
`SHELL-CI-012 — Probar NUMERA antes de actualizar`


### ✅ SHELL-CI-012 — Probar NUMERA antes de actualizar

**Estado:** APROBADA
**Tarea anterior:** SHELL-CI-011 — Probar VISO antes de actualizar
**Tarea siguiente:** SHELL-CI-013 — Probar ANIMA antes de actualizar
**Tipo de tarea:** Habilitador global único — contrato documental de pruebas específicas de NUMERA previas a actualización de packages compartidos
**Bloque:** BLOQUE T — CI, pruebas, despliegue y rollback base
**Repositorio propietario:** `devVentoGroup/vento-numera`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/T_CALIDAD_Y_DESPLIEGUE/02_PRUEBAS_DE_CONSUMIDORES_Y_ROLLBACK.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada el contrato de pruebas que deberá demostrar que **NUMERA conserva una línea base reproducible, íntegra, atribuible, financieramente trazable y fail-closed antes de modificar su conjunto de packages compartidos**, de modo que una actualización preparada por CI006 nunca parta de un consumidor ambiguo, de evidencia perteneciente a otro commit, de un inventario de rutas desactualizado, de una navegación sincronizada con efectos remotos durante la certificación, de una autorización inferida por visibilidad de interfaz, de un valor económico ausente presentado como real, de un contexto territorial manipulado o de una ejecución de prueba que escriba sobre datos, navegación, permisos o configuración Supabase reales.

La regla vinculante queda:

```text
NUMERA EN UN COMMIT BASE EXACTO
+ MANIFEST Y LOCKFILE EXACTOS
+ INVENTARIO 7 PÁGINAS / 0 HANDLERS CONCILIADO
+ CLASIFICACIÓN 7 ESTÁTICAS / 0 DINÁMICAS CONCILIADA
+ EXPOSICIÓN 5 PROTEGIDAS / 2 SUPERFICIES PÚBLICAS CONTROLADAS CONCILIADA
+ 4 CANDIDATAS DE NAVEGACIÓN CONCILIADAS
+ ENTORNO DE PRUEBA AISLADO
+ BUILD SIN MUTACIÓN REMOTA
+ RELACIÓN PACKAGE–NUMERA EXACTA
+ PERFIL DE PRUEBAS NUMERA APLICABLE
+ PRUEBAS DE AUTORIZACIÓN, ECONOMÍA, DATOS, SERVIDOR E INTERFAZ SATISFACTORIAS
+ EVIDENCIA VIGENTE
= LÍNEA BASE NUMERA APTA PARA INICIAR UNA PROPUESTA DE ACTUALIZACIÓN
```

Y, de forma fail-closed:

```text
LINT VERDE
O BUILD VERDE
O REDIRECCIÓN SSO QUE FUNCIONA
O TABLA QUE RENDERIZA
O RPC QUE RESPONDE
O VALOR NULO MOSTRADO COMO CERO SIN ORIGEN
O PREBUILD QUE ESCRIBE NAVEGACIÓN REAL
O COMPATIBILIDAD DE OTRO CONSUMIDOR
O PRUEBAS DE OTRO COMMIT
O AUSENCIA DE TESTS AUTOMATIZADOS
≠ LÍNEA BASE NUMERA CERTIFICADA
```

CI012 certifica la línea base específica de NUMERA. No publica packages, no modifica la versión objetivo, no prepara el pull request, no fusiona, no despliega, no ejecuta rollback y no corrige por anticipado las capacidades financieras o de autorización cuyo propietario canónico pertenece a tareas posteriores.

#### 2. Resultado canónico

`SHELL-CI-012` establece un único habilitador reutilizable para:

1. identificar el commit base exacto de `devVentoGroup/vento-numera` que se pretende actualizar;
2. fijar las identidades del manifest, lockfile, configuración, suite, fixtures, inventario de rutas, contratos fuente y entorno;
3. seleccionar únicamente las relaciones package–NUMERA aplicables;
4. seleccionar el perfil NUMERA correspondiente a cada familia compartida objetivo;
5. ejecutar una línea base técnica reproducible sobre el commit base sin modificar versiones de packages;
6. reconciliar exactamente siete páginas estáticas y cero patrones dinámicos;
7. conservar exactamente cinco rutas protegidas y dos superficies públicas controladas;
8. conservar cero route handlers App Router y mantenerlos separados de páginas, Server Actions y scripts;
9. reconciliar exactamente cuatro candidatas declarativas de navegación sin convertir la raíz ni las superficies de acceso en elementos de menú;
10. conservar `/login` como puente SSO hacia Shell y `/no-access` como estado de denegación;
11. proteger middleware, guardas, sesión operativa, acceso a NUMERA, sede, área, dispositivo compartido, permisos y role override;
12. impedir que `returnTo`, IDs, query params, formularios o valores cliente amplíen autoridad;
13. proteger la separación entre permiso de lectura y permiso de administración;
14. proteger el panel raíz sin interpretar acceso a la aplicación como permiso definitivo sobre toda métrica económica;
15. proteger centros de costo, presupuestos, ingreso esperado, margen objetivo y acciones de actualización;
16. proteger gastos, categorías, centros, moneda, fecha, origen y acción de creación;
17. proteger punto de equilibrio y rentabilidad frente a datos ausentes, parciales o no conciliados;
18. proteger la distinción entre dato real, esperado, presupuestado, calculado, simulado, propuesto y ausente;
19. proteger la reconciliación con hechos y documentos fuente de PULSO, ORIGO, FOGO y NEXO;
20. proteger periodos, moneda, centro de costo, entidad, origen, documento, monto y correlación cuando resulten aplicables;
21. proteger `sync-navigation` como mecanismo declarativo separado de la certificación y bloquear cualquier efecto remoto durante la suite;
22. proteger los clientes Supabase browser/server y cualquier uso privilegiado del script de sincronización;
23. probar RLS, RPC, consultas y Server Actions sin autorizar migraciones ni cambios remotos desde NUMERA;
24. proteger fronteras NUMERA–Shell–PULSO–ORIGO–FOGO–NEXO–PASS–ANIMA;
25. probar render, hidratación, interacción, formularios, tablas, feedback, accesibilidad y estados vacíos/deny representativos cuando la familia objetivo sea UI;
26. producir evidencia machine-readable ligada al commit base y al conjunto exacto de pruebas;
27. invalidar la evidencia cuando cambie cualquiera de sus entradas materiales;
28. bloquear una actualización cuando no exista infraestructura de prueba suficiente;
29. entregar a CI006 un resultado de línea base consumible para comparar el comportamiento previo y el `proposal_commit` posterior;
30. soportar una actualización multi-package mediante la unión de perfiles requeridos, sin reducir cobertura;
31. autocertificar el habilitador global una sola vez antes de reutilizarlo en futuras actualizaciones de NUMERA;
32. separar la certificación del habilitador de la conformidad funcional completa del consumidor.

#### 3. Frontera de responsabilidad

| Responsabilidad                                                | Propietario         |
| -------------------------------------------------------------- | ------------------- |
| pruebas propias del package                                    | `SHELL-CI-001`      |
| artefacto distribuible del package                             | `SHELL-CI-002`      |
| identidad y publicación de release                             | `SHELL-CI-003`      |
| changelog y release notes                                      | `SHELL-CI-004`      |
| compatibilidad package–consumidor                              | `SHELL-CI-005`      |
| preparación y mantenimiento del PR consumidor                  | `SHELL-CI-006`      |
| línea base y pruebas específicas de NEXO                       | `SHELL-CI-007`      |
| línea base y pruebas específicas de FOGO                       | `SHELL-CI-008`      |
| línea base y pruebas específicas de ORIGO                      | `SHELL-CI-009`      |
| línea base y pruebas específicas de PULSO                      | `SHELL-CI-010`      |
| línea base y pruebas específicas de VISO                       | `SHELL-CI-011`      |
| línea base y pruebas específicas de NUMERA antes de actualizar | `SHELL-CI-012`      |
| pruebas específicas de ANIMA                                   | `SHELL-CI-013`      |
| rollback por repositorio                                       | `SHELL-CI-014`      |
| independencia de despliegue                                    | `SHELL-CI-015`      |
| normalización transversal de comandos                          | `SHELL-CI-016`      |
| trazabilidad de requisitos y evidencia por PR                  | `SHELL-CI-017..019` |

CI012 puede exigir un punto de entrada reproducible para su propia suite. No absorbe la normalización transversal de comandos reservada a CI016, no redefine el dominio financiero de NUMERA y no corrige por anticipado obligaciones cuyo owner ya esté asignado a `NUMERA-*`, `AUTH-UI-*`, integración, base de datos o paquetes posteriores.

#### 4. Topología de trabajo

`PHASE-03-T-CI-FOUNDATION` aplica `GLOBAL_ENABLE_ONCE` a `SHELL-CI-012`.

Por tanto:

```text
MARCADOR CANÓNICO
SHELL-CI-012
→ define una sola vez el contrato de pruebas previas de NUMERA

INSTANCIA FÍSICA FUTURA
SHELL-CI-012::GLOBAL
→ materializa y autocertifica una sola vez el habilitador NUMERA

ACTUALIZACIONES POSTERIORES DE NUMERA
→ reutilizan el habilitador certificado
→ generan evidencia nueva por commit base y conjunto objetivo
→ no vuelven a implementar CI012
```

La instancia global puede utilizar fixtures, dobles, oracles sintéticos, snapshots de inventario y entornos locales o CI aislados. No necesita actualizar un package real, crear gastos reales, modificar presupuestos reales, sincronizar navegación remota ni mutar Supabase productivo para demostrar que el habilitador funciona.

#### 5. Handoff vinculante desde CI006 y CI007 a CI011

CI006 conserva las 28 relaciones base, los gates de actualización, la invalidación por commit y la prohibición de auto-merge y auto-deploy.

CI007 a CI011 ya establecen la disciplina común para líneas base previas de consumidores:

- identidad exacta;
- evidencia atribuible;
- semántica fail-closed;
- invalidación por cambios materiales;
- separación entre habilitador global y ejecución por actualización;
- prohibición de reutilizar evidencia de otro consumidor;
- ausencia de tests distinta de PASS;
- separación entre harness autocertificado y consumidor integralmente conforme.

CI012 conserva esa disciplina y la especializa para NUMERA, donde la prueba previa debe añadir garantías explícitas sobre información económica, permisos atómicos de lectura/administración, navegación con prebuild potencialmente mutante, SSO, contexto operativo, Server Actions y datos financieros.

La secuencia lógica será:

```text
RELEASE OBJETIVO CONOCIDA
→ RELACIÓN PACKAGE–NUMERA RESUELTA
→ COMMIT BASE NUMERA FIJADO
→ CI012 CERTIFICA LA LÍNEA BASE DEL COMMIT BASE
→ CI006 MATERIALIZA LA PROPUESTA AISLADA
→ CI006 EJECUTA O CONSUME LOS GATES SOBRE EL PROPOSAL COMMIT
→ SE COMPARA CON LA LÍNEA BASE VIGENTE
→ REVISIÓN HUMANA
```

Un `PASS` de CI012 no sustituye CI005 ni autoriza por sí mismo `ELIGIBLE`, `READY_FOR_REVIEW`, merge, despliegue o adopción.

#### 6. Relaciones package–NUMERA gobernadas

CI012 gobierna exactamente las cuatro combinaciones NUMERA de la matriz web base:

| Familia             | Compatibilidad CI005 | Actualización CI006 | Consumidor     |
| ------------------- | -------------------- | ------------------- | -------------- |
| `@vento/contracts`  | `PKG-COMP-MX-007`    | `PKG-PR-REL-007`    | `vento-numera` |
| `@vento/os-context` | `PKG-COMP-MX-014`    | `PKG-PR-REL-014`    | `vento-numera` |
| `@vento/supabase`   | `PKG-COMP-MX-021`    | `PKG-PR-REL-021`    | `vento-numera` |
| `@vento/ui-web`     | `PKG-COMP-MX-028`    | `PKG-PR-REL-028`    | `vento-numera` |

**Conciliación:** 4 relaciones NUMERA esperadas, 4 materializadas en el contrato, 0 faltantes y 0 duplicadas.

Ninguna evidencia de NEXO, FOGO, ORIGO, PULSO, VISO, SHELL o ANIMA satisface estas cuatro relaciones.

#### 7. Línea base física observada de NUMERA

En el corte remoto inspeccionado de `devVentoGroup/vento-numera`:

- la rama principal es `main`;
- el commit remoto observado es `1b48a5da425d92e19ed89cf175b1dccc4cd960e1`;
- existe `package-lock.json` y el repositorio es una aplicación Next privada;
- el manifest declara `dev`, `build`, `start`, `lint`, `audit:i18n`, `sync:navigation` y `prebuild`;
- `prebuild` ejecuta `sync:navigation`;
- el manifest no declara un script de pruebas automatizadas;
- el manifest no declara un script dedicado de typecheck;
- no se observaron archivos `.test.*` ni `.spec.*` en el árbol completo;
- no se declaran todavía dependencias publicadas `@vento/*`;
- se observan Next `^16.2.1`, React `19.2.3`, React DOM `19.2.3`, Supabase JS `^2.90.1` y Supabase SSR `^0.8.0`;
- el inventario canónico contiene siete páginas, todas estáticas;
- existen cero patrones dinámicos y cero route handlers App Router;
- cinco páginas están protegidas y `/login` + `/no-access` son superficies públicas controladas;
- la raíz `/` es una página real, aunque no se sincroniza como navegación;
- `sync-navigation` declara exactamente cuatro candidatas de negocio;
- `/login` actúa como puente hacia Shell;
- `/no-access` restringe `returnTo` a destinos relativos;
- el middleware excluye `login`, `no-access`, `/api` y recursos técnicos del matcher;
- el guard resuelve usuario, sesión operativa, acceso a aplicación, sede, área, dispositivo compartido, permisos y role override;
- `/cost-centers` y `/expenses` materializan Server Actions con revalidación de permiso de administración;
- `/break-even` y `/profitability` materializan lectura financiera;
- el panel raíz consume `numera_current_period_summary`;
- el script `sync-navigation` puede usar service-role y ejecutar RPC/upserts cuando esas credenciales están presentes;
- cualquier modificación futura de schema, RPC, RLS, Storage, Realtime, Edge Functions, datos o configuración Supabase permanece propiedad de `devVentoGroup/vento-shell`.

Conclusión documental: **NUMERA todavía no puede considerarse físicamente certificado para CI012 por la sola existencia de lint y build**. La futura `SHELL-CI-012::GLOBAL` deberá materializar infraestructura de pruebas automatizadas reproducible, typecheck explícito y un build de certificación que no pueda sincronizar navegación remota.

#### 8. Inventario contractual de rutas y navegación NUMERA

CI012 toma como línea base canónica:

```text
PÁGINAS
7 totales
7 estáticas
0 dinámicas

EXPOSICIÓN
5 protegidas
2 superficies públicas controladas

HANDLERS APP ROUTER
0

NAVEGACIÓN DECLARATIVA
4 candidatas de negocio
```

Identidades:

| ID                 | Ruta             | Superficie                     |
| ------------------ | ---------------- | ------------------------------ |
| `NUMERA-ROUTE-001` | `/`              | panel económico inicial        |
| `NUMERA-ROUTE-002` | `/login`         | puente SSO                     |
| `NUMERA-ROUTE-003` | `/no-access`     | estado de denegación           |
| `NUMERA-ROUTE-004` | `/cost-centers`  | centros de costo y presupuesto |
| `NUMERA-ROUTE-005` | `/expenses`      | gastos                         |
| `NUMERA-ROUTE-006` | `/break-even`    | punto de equilibrio            |
| `NUMERA-ROUTE-007` | `/profitability` | rentabilidad                   |

Las cuatro candidatas de navegación son:

```text
/cost-centers
/expenses
/break-even
/profitability
```

La raíz, `/login` y `/no-access` no se convierten en menú por el solo hecho de ser páginas reales.

Cualquier alta, baja, movimiento, duplicación, aparición de `[id]`/`[slug]`, nuevo handler, cambio de exposición, cambio de guard o cambio de lista declarativa de navegación vuelve stale la evidencia dependiente del inventario hasta que exista un delta explícito.

#### 9. Distinción entre habilitador certificado y consumidor conforme

CI012 fija dos afirmaciones diferentes que nunca podrán fusionarse:

```text
SHELL-CI-012::GLOBAL = VERIFIED
```

significa:

- existe el harness;
- el harness es reproducible;
- detecta sus escenarios positivos y negativos;
- detecta drift de 7 páginas, 0 dinámicas, 0 handlers, 5 protegidas, 2 públicas controladas y 4 candidatas de navegación;
- detecta stale evidence, otro consumidor, cero tests, aislamiento inválido, secretos, build mutante y falsas condiciones de PASS;
- produce evidencia machine-readable;
- no requiere mutaciones productivas.

No significa:

```text
EL COMMIT ACTUAL DE NUMERA CUMPLE TODOS LOS REQUISITOS FINANCIEROS, DE AUTORIZACIÓN Y UX FUTUROS DEL DOMINIO
```

La conformidad del consumidor se determina en cada ejecución real de línea base contra su commit exacto.

Deudas o capacidades todavía no implementadas pueden coexistir con un harness global correctamente autocertificado. Cuando una deuda registrada sea aplicable al perfil ejecutado, la ejecución real deberá devolver `FAIL` o `BLOCKED` en lugar de ocultarla.

#### 10. Unidad exacta de certificación previa

Cada resultado de CI012 se atribuye como mínimo a:

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
navigation_inventory_identity
source_contract_identity
environment_identity
runtime_identity
framework_identity
target_package_set
compatibility_refs
numera_profile_set
execution_identity
started_at
completed_at
result
invalidation_reason
```

La unidad certificada es el **commit base sin la actualización propuesta**.

Cambiar commit, manifest, lockfile, suite, fixtures, inventario de páginas, inventario de navegación, configuración, contratos fuente, entorno o perfil invalida la reutilización del resultado anterior.

#### 11. Momento de ejecución

La prueba previa debe ejecutarse después de conocer el conjunto objetivo y antes de materializar la actualización sobre NUMERA.

Orden obligatorio:

1. resolver release o conjunto mínimo cerrado de releases objetivo;
2. resolver una o más de las cuatro relaciones NUMERA;
3. fijar `consumer_base_commit`;
4. fijar manifest y lockfile del commit base;
5. fijar inventarios de páginas, navegación y contratos fuente aplicables;
6. resolver los perfiles NUMERA exigidos por las familias objetivo;
7. ejecutar la línea base común y los perfiles seleccionados sin cambiar versiones de packages;
8. consolidar la evidencia;
9. solo con resultado satisfactorio permitir que CI006 continúe con la preparación aislada de la propuesta.

Si durante la prueba cambia el commit base, la ejecución en curso deja de ser atribuible y debe reiniciarse sobre la nueva identidad.

#### 12. Semántica de resultado

CI012 reutiliza la semántica fail-closed aprobada:

- `PENDING`;
- `RUNNING`;
- `PASS`;
- `FAIL`;
- `BLOCKED`;
- `CANCELLED`;
- `TIMED_OUT`;
- `STALE`;
- `NOT_APPLICABLE` únicamente para comprobaciones realmente condicionales y justificadas.

Para declarar una línea base NUMERA apta se requiere `PASS` global de las comprobaciones obligatorias seleccionadas.

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
- omisión de una página;
- aparición de un handler no conciliado;
- cuatro rutas de navegación tratadas como si fueran solo cuatro páginas;
- raíz omitida porque no esté en el menú;
- Server Action tratada como route handler;
- valor económico ausente convertido en valor real confirmado;
- build que ejecute sincronización remota;
- uso de service-role real durante fixtures o certificación;
- mutaciones contra datos reales;
- una deuda crítica aplicable convertida manualmente en PASS.

#### 13. Línea base técnica común

Toda certificación previa de NUMERA deberá demostrar, sobre el mismo commit base:

1. instalación bloqueada reproducible con el lockfile vigente;
2. manifest y lockfile coherentes;
3. lint o análisis estático aplicable;
4. typecheck real de TypeScript;
5. build de producción aplicable;
6. ejecución de la suite automatizada específica de NUMERA;
7. ausencia de tests omitidos silenciosamente;
8. identidad del entorno y runtime registrada;
9. evidencia separada por comprobación;
10. resultado global fail-closed;
11. inventarios de páginas y navegación conciliados;
12. ausencia de escrituras productivas provocadas por la propia certificación;
13. ausencia de service-role real en el entorno de build/test;
14. ejecución de `sync-navigation` únicamente en modo no mutante cuando forme parte del build evaluado.

El manifest observado no define una suite de tests ni typecheck dedicado. La futura materialización deberá incorporar puntos de entrada reproducibles dentro del alcance expresamente autorizado.

Un build satisfactorio no sustituye las pruebas automatizadas específicas.

#### 14. Matriz funcional mínima obligatoria de NUMERA

La suite global deberá cubrir como mínimo estas doce superficies. La implementación física puede dividir cada superficie en varios tests, pero no eliminarla sin una decisión canónica posterior.

|    # | Superficie                                          | Afirmación positiva mínima                                                               | Afirmación negativa o de borde mínima                                                            |
| ---: | --------------------------------------------------- | ---------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ |
|    1 | identidad, sesión, SSO y denegación                 | identidad válida conserva sesión, retorno seguro y acceso requerido                      | sesión ausente, auth error o retorno inseguro falla cerrado                                      |
|    2 | contexto operativo, sede, área, actor y dispositivo | contexto efectivo limita la operación al territorio y actor permitidos                   | cambiar sede, área, role override o dispositivo no concede autoridad                             |
|    3 | inventario de páginas                               | 7 páginas estáticas, 0 dinámicas y 0 handlers permanecen conciliados                     | alta, baja, movimiento, duplicado o handler nuevo bloquea                                        |
|    4 | navegación y prebuild                               | 4 candidatas conservan identidad, permiso y metadata sin escritura durante certificación | service-role presente, drift de rutas o mutación remota bloquea                                  |
|    5 | panel raíz                                          | acceso a NUMERA y resumen económico se presentan con semántica de origen                 | acceso a app no se interpreta como permiso universal ni ausencia como dato real                  |
|    6 | centros de costo y presupuesto                      | lectura y administración conservan permisos separados y entradas válidas                 | edición sin `cost_centers.manage`, centro/periodo inválido o monto inválido falla                |
|    7 | gastos                                              | lectura y creación conservan permiso, centro, fecha, moneda y origen                     | creación sin `expenses.manage`, dato incompleto o recurso no autorizado falla                    |
|    8 | punto de equilibrio                                 | cálculo disponible conserva centro, margen, gastos y resultado identificables            | ausencia de margen/cálculo no se presenta como valor económico confirmado                        |
|    9 | rentabilidad                                        | ingreso esperado, gasto real, presupuesto y variación permanecen diferenciados           | dato ausente, fuente no conciliada o dimensión mezclada no se normaliza a éxito                  |
|   10 | trazabilidad económica y conciliación               | montos, periodos, centros y fuentes conservan lineage verificable                        | duplicado manual, fuente perdida, periodo ambiguo o agregado editable bloquea                    |
|   11 | Supabase, RLS, RPC y Server Actions                 | consultas y acciones permitidas respetan autorización y aislamiento                      | bypass, RLS denegada normalizada a éxito o privilegio elevado no justificado falla               |
|   12 | UI, SSR, interacción, accesibilidad y errores       | tablas, formularios, estados vacíos y feedback renderizan de forma consistente           | hidratación, teclado, foco, error, loading, deny o null-state incorrecto no se normaliza a éxito |

Estas doce superficies son la línea base común. Los perfiles de familia agregan obligaciones, no las sustituyen.

#### 15. Perfil NUMERA para `@vento/contracts`

Cuando la relación objetivo incluya `PKG-PR-REL-007`, la línea base deberá cubrir especialmente:

- identidades de empresa, sede, centro de costo, periodo, categoría y fuente;
- shapes de presupuestos, gastos, resúmenes y métricas;
- montos, moneda, fechas, porcentajes, márgenes y variaciones;
- estados y discriminantes de dato real, esperado, presupuestado, calculado, simulado, propuesto y ausente;
- contratos de entradas y salidas consumidos por Server Actions;
- estructuras de errores y denegación;
- diferencia entre dato ausente, `null`, cero legítimo, inválido y no aplicable;
- compilación de los puntos de consumo TypeScript;
- serialización y deserialización aplicables;
- ausencia de casts o fallbacks globales que oculten una incompatibilidad.

La evidencia se vincula a `PKG-COMP-MX-007` y `PKG-PR-REL-007`.

#### 16. Perfil NUMERA para `@vento/os-context`

Cuando la relación objetivo incluya `PKG-PR-REL-014`, la línea base deberá cubrir especialmente:

- sesión real y sesión ausente;
- delegación SSO al Shell;
- acceso a la aplicación NUMERA;
- contexto operativo por sede y área;
- permiso concedido y permiso denegado;
- sede solicitada frente a sede efectiva;
- contexto incompleto o manipulado;
- acceso directo a las cinco rutas protegidas;
- role override únicamente cuando el contrato lo permita;
- dispositivo compartido y aplicaciones permitidas;
- preservación de razones de denegación;
- prohibición de elevar autoridad desde query params, IDs o valores controlados por cliente;
- separación entre `numera.access`, permisos `.view` y permisos `.manage`.

La evidencia se vincula a `PKG-COMP-MX-014` y `PKG-PR-REL-014`.

#### 17. Perfil NUMERA para `@vento/supabase`

Cuando la relación objetivo incluya `PKG-PR-REL-021`, la línea base deberá cubrir especialmente:

- clientes browser y server;
- propagación de sesión y cookies;
- consultas de periodos, centros, gastos y resúmenes;
- RPC `has_permission`;
- RPC `numera_current_period_summary`;
- vistas y tablas NUMERA consumidas por las superficies actuales;
- operaciones permitidas dentro del alcance autorizado;
- operaciones denegadas por permisos o RLS;
- aislamiento por sede y área cuando aplique;
- respuestas de error y estados parciales;
- correspondencia entre schema de prueba y fuente canónica de `vento-shell`;
- Server Actions de presupuesto y gastos;
- prohibición de usar service-role real durante la certificación;
- prohibición de permitir que `sync-navigation` escriba sobre un proyecto remoto;
- build y suite sin mutaciones remotas.

Las pruebas que requieran base de datos deberán usar un entorno local o CI aislado derivado de la fuente canónica de `vento-shell`. La falta de ese entorno cuando la comprobación sea obligatoria produce `BLOCKED`, no `NOT_APPLICABLE`.

La evidencia se vincula a `PKG-COMP-MX-021` y `PKG-PR-REL-021`.

#### 18. Perfil NUMERA para `@vento/ui-web`

Cuando la relación objetivo incluya `PKG-PR-REL-028`, la línea base deberá cubrir especialmente:

- render servidor y cliente de superficies representativas;
- hidratación sin divergencias silenciosas;
- AppShell, app switcher, profile menu, tablas y componentes estándar;
- panel económico inicial;
- formularios de centros de costo y gastos;
- tablas de gastos, equilibrio y rentabilidad;
- estados vacíos, loading, success, error y deny;
- foco, teclado y semántica accesible aplicable;
- diferenciación visual de dato real, esperado, presupuestado, calculado, simulado y ausente cuando el contrato lo exija;
- ausencia de exposición de datos protegidos en estados de error o denegación;
- integración de tokens y estilos sin degradar legibilidad de cifras;
- ausencia de imports privados no contractuales.

La evidencia se vincula a `PKG-COMP-MX-028` y `PKG-PR-REL-028`.

#### 19. Protección reforzada de SSO, middleware y guard

CI012 deberá conservar tres fronteras distintas:

```text
MIDDLEWARE DE SESIÓN
≠ GUARD DE APLICACIÓN Y PERMISO
≠ AUTORIZACIÓN PROPIA DE SERVER ACTION
```

La línea base deberá demostrar:

1. ausencia de cookies → redirección controlada;
2. ausencia de configuración Supabase → redirección controlada;
3. auth error o usuario ausente → denegación y limpieza aplicable;
4. `/login` conserva función de puente y `returnTo` seguro;
5. `/no-access` solo acepta destino local y no concede autoridad;
6. una ruta protegida revalida aplicación, permiso y contexto;
7. una Server Action no depende de la visibilidad del botón;
8. `cost_centers.manage` se revalida antes de persistir presupuesto;
9. `expenses.manage` se revalida antes de crear gasto;
10. `numera.access` no se convierte en permiso universal de lectura;
11. role override y dispositivo compartido no amplían la autoridad máxima;
12. razones de denegación no exponen secretos ni datos financieros sensibles.

El comportamiento observado que acepte un `returnTo` externo deberá ser evaluado contra el contrato vigente; si la comprobación aplicable demuestra una redirección insegura, la ejecución real devuelve `FAIL` y CI012 no la normaliza como deuda tolerada.

#### 20. Protección reforzada de navegación y `prebuild`

NUMERA tiene una frontera adicional que no podrá confundirse con build:

```text
COMPILAR LA APLICACIÓN
≠ SINCRONIZAR NAVEGACIÓN REMOTA
```

El `prebuild` observado ejecuta `sync:navigation`. El script de sincronización:

- declara cuatro rutas de negocio;
- calcula hash de fuente y metadata;
- puede invocar `upsert_app_screen_registry`;
- puede actualizar `app_screen_registry`;
- puede hacer upsert de `app_navigation_items`;
- usa service-role cuando la credencial está disponible;
- entra en modo preview cuando no existe service-role.

Por tanto, la certificación CI012 deberá:

1. comprobar antes del build que no existe una credencial service-role real utilizable;
2. bloquear si `SUPABASE_SERVICE_ROLE_KEY`, `SUPABASE_SERVICE_ROLE` o `SUPABASE_SERVICE_KEY` apuntan a credenciales reales;
3. demostrar que el build de certificación no realiza RPC ni upserts remotos;
4. conservar las cuatro rutas declarativas exactas;
5. conservar `item_key`, grupo, orden, permiso, fuente y hash como metadata verificable;
6. impedir que una sincronización previa del entorno se use como prueba de que el build fue seguro;
7. tratar cualquier escritura remota durante la certificación como `FAIL` o `BLOCKED`;
8. no modificar el script documentalmente en CI012; su corrección física pertenece a la instancia futura o al owner canónico correspondiente cuando sea autorizada.

#### 21. Protección reforzada de trazabilidad económica

La línea base deberá preservar como mínimo:

- identidad del hecho económico;
- entidad o unidad aplicable;
- sede;
- centro de costo;
- periodo;
- moneda;
- fecha;
- fuente;
- correlación cuando exista;
- documento u origen cuando exista;
- monto;
- estado;
- evidencia;
- separación entre hecho y agregado;
- separación entre dato real y supuesto;
- separación entre corrección y sobrescritura destructiva.

NUMERA no podrá declararse conforme porque una suma coincida visualmente si el resultado perdió origen, periodo, centro, moneda o relación con su fuente.

#### 22. Protección reforzada de centros de costo y presupuesto

La cobertura deberá poder evaluar:

- `numera.cost_centers.view` para lectura;
- `numera.cost_centers.manage` para modificación;
- periodo vigente;
- centro de costo válido;
- presupuesto;
- ingreso esperado;
- margen objetivo;
- notas;
- valores no negativos;
- porcentaje dentro de rango;
- separación entre configuración y gasto real;
- revalidación de vistas posterior a una mutación válida;
- fallo cerrado ante datos incompletos;
- fallo cerrado ante permiso insuficiente;
- no modificación de un centro ajeno al alcance autorizado;
- conservación de trazabilidad del cambio.

La presencia de un formulario editable no constituye autorización.

#### 23. Protección reforzada de gastos

La cobertura deberá poder evaluar:

- `numera.expenses.view` para lectura;
- `numera.expenses.manage` para creación;
- periodo;
- categoría;
- centro de costo;
- fecha;
- descripción;
- monto;
- moneda;
- `source_app`;
- respuesta de persistencia;
- error de base de datos;
- separación entre lectura y creación;
- fallo ante datos incompletos;
- fallo ante monto inválido;
- rechazo de centro o categoría fuera del alcance cuando la política aplicable lo exija;
- ausencia de duplicación mediante retry o doble submit;
- conservación de origen explícito.

Crear un gasto de prueba contra datos reales queda prohibido.

#### 24. Protección reforzada de equilibrio y rentabilidad

La cobertura deberá distinguir:

```text
AUSENTE
≠ CERO
≠ CALCULADO
≠ ESPERADO
≠ PRESUPUESTADO
≠ REAL
```

Para `/break-even` deberá poder evaluar:

- `numera.break_even.view`;
- gastos fijos;
- gastos variables;
- margen objetivo;
- resultado de equilibrio;
- ausencia de margen;
- ausencia de cálculo;
- centro de costo;
- orden y presentación.

Para `/profitability` deberá poder evaluar:

- `numera.profitability.view`;
- ingreso esperado;
- gasto real;
- presupuesto;
- variación;
- centro de costo;
- ausencia de alguno de los componentes;
- no inferencia de rentabilidad real desde ingreso esperado.

La suite deberá bloquear cualquier regresión que convierta `null` o dato no conciliado en una afirmación financiera positiva sin origen.

#### 25. Protección reforzada de Supabase y privilegios

La certificación deberá demostrar:

1. código cliente sin service-role;
2. servidor con sesión de usuario para operaciones de aplicación;
3. RLS y permisos no normalizados como éxito ante error;
4. Server Actions con autorización antes de efectos;
5. entorno de prueba no productivo;
6. schema de prueba proveniente de la fuente canónica de `vento-shell`;
7. cero migraciones creadas o ejecutadas desde NUMERA;
8. cero cambios de RLS, RPC, grants, Storage, Realtime o Edge Functions desde NUMERA;
9. cero service-role real dentro de fixtures;
10. cero service-role real durante build;
11. `sync-navigation` en preview o doble sintético durante certificación;
12. secretos ausentes de reportes, snapshots y evidencia.

#### 26. Datos, fixtures y aislamiento

Las pruebas de CI012 deberán cumplir simultáneamente:

1. no leer ni modificar datos productivos;
2. usar fixtures deterministas o entorno local/CI aislado;
3. no depender de IDs aleatorios no registrados;
4. limpiar o descartar estado temporal de forma reproducible;
5. no compartir estado mutable entre tests independientes;
6. no utilizar credenciales reales como fixture;
7. no introducir una migración NUMERA para acomodar la prueba;
8. cuando se necesite schema Supabase, consumir la fuente canónica de `vento-shell`;
9. registrar identidad del fixture set;
10. impedir que una falla de cleanup convierta el resultado en PASS;
11. no crear gastos, presupuestos, periodos, centros o navegación productivos;
12. separar fixtures de autorización, economía, navegación y UI;
13. mantener aislados los escenarios de otra sede, área, actor y centro de costo;
14. conservar oracles que distingan valor ausente de cero legítimo;
15. impedir que el build use variables remotas heredadas de la estación del desarrollador.

#### 27. Línea base antes de `INITIAL_ADOPTION`

El manifest observado de NUMERA no declara todavía packages publicados `@vento/*`.

Por tanto, la primera adopción futura de cualquiera de las cuatro familias deberá tratar la evidencia CI012 como **oráculo del comportamiento previo**:

```text
COMMIT BASE SIN EL PACKAGE COMPARTIDO
→ CI012 PASS
→ PROPUESTA INITIAL_ADOPTION
→ MISMA COBERTURA ESENCIAL SOBRE PROPOSAL COMMIT
→ COMPARACIÓN DE RESULTADOS
```

La ausencia actual del package no convierte sus pruebas específicas en no aplicables.

#### 28. Actualizaciones `PATCH`, `MINOR`, `MAJOR`, seguridad y deprecación

CI012 no sustituye las clases de actualización de CI006:

- `PATCH_UPDATE`: línea base completa y regresión focal;
- `MINOR_UPDATE`: añade escenarios para la nueva capacidad consumida;
- `MAJOR_UPDATE`: exige línea base completa y matriz explícita de comportamiento preservado/cambiado;
- `SECURITY_UPDATE`: mantiene autorización, territorialidad, RLS, secretos y frontera de navegación; la urgencia no permite omitirlos;
- `DEPRECATION_MIGRATION`: conserva pruebas de la superficie antigua mientras siga soportada y de la ruta objetivo cuando exista;
- `ROLLBACK_UPDATE`: CI012 aporta la línea base; la ejecución y certificación del rollback pertenece a CI014.

#### 29. Actualización multi-package

Cuando CI006 resuelva más de una familia compartida:

1. CI012 selecciona la unión de todos los perfiles correspondientes;
2. ninguna familia reduce la cobertura de otra;
3. las doce superficies comunes permanecen;
4. una ejecución puede producir evidencia para el conjunto si las identidades permanecen unidas;
5. el conjunto objetivo queda registrado;
6. cambiar una sola versión objetivo invalida la evidencia dependiente;
7. no se usa lockstep artificial para incluir familias no requeridas.

#### 30. Evidencia consumible por CI006

La evidencia satisfactoria deberá permitir a CI006 demostrar al menos:

- repositorio consumidor exacto: `devVentoGroup/vento-numera`;
- commit base exacto;
- manifest y lockfile exactos;
- inventario de siete páginas exacto;
- siete estáticas y cero dinámicas;
- cinco protegidas y dos públicas controladas;
- cero route handlers;
- cuatro candidatas de navegación exactas;
- contratos fuente exactos;
- relación o relaciones NUMERA aplicables;
- conjunto de packages objetivo;
- referencias de compatibilidad CI005;
- perfil o perfiles NUMERA ejecutados;
- identidad de suite y fixtures;
- identidad del entorno;
- resultados por capa y superficie;
- total de tests ejecutados, aprobados, fallidos y omitidos;
- evidencia de caminos denegados aplicables;
- evidencia de separación lectura/administración;
- evidencia de aislamiento territorial y económico;
- evidencia de ausencia de service-role real;
- evidencia de build sin sincronización remota;
- evidencia de que la certificación no produjo efectos productivos;
- timestamps de inicio y cierre;
- resultado global;
- razón de bloqueo o invalidación cuando no sea PASS.

La evidencia podrá formar parte de `validation_results` y `evidence_refs` del expediente `PKG-PR-*`, pero CI012 no crea ni mantiene ese expediente.

#### 31. Invalidación obligatoria

El resultado pasa a `STALE` cuando cambia materialmente cualquiera de estas entradas antes de que CI006 la consuma:

- `consumer_base_commit`;
- manifest;
- lockfile;
- configuración de build, TypeScript o test;
- suite;
- fixtures u oracles;
- variables/configuración de entorno relevantes;
- runtime o framework;
- inventario de siete páginas;
- clasificación 7/0;
- exposición 5/2;
- aparición de route handlers;
- lista de cuatro candidatas de navegación;
- `sync-navigation`;
- `prebuild`;
- contrato de `/login`;
- contrato de `/no-access`;
- middleware;
- guard, contexto, role override o dispositivo compartido;
- contratos fuente;
- permisos de centros de costo, gastos, equilibrio o rentabilidad;
- contratos de Server Actions;
- contratos de periodos, centros, presupuestos, gastos o resúmenes;
- fuente de schema usada para pruebas Supabase;
- relación package–NUMERA;
- versión o conjunto objetivo;
- referencia de compatibilidad CI005;
- superficie obligatoria;
- contrato de CI012.

No se conserva un PASS anterior mediante rebase, cherry-pick, actualización de snapshot o cambio de fixture sin nueva ejecución atribuible.

#### 32. Condiciones de bloqueo

La futura ejecución deberá quedar `BLOCKED` o `FAIL` según corresponda cuando ocurra cualquiera de estas condiciones:

1. no existe runner reproducible para pruebas NUMERA;
2. el runner ejecuta cero tests obligatorios;
3. falta identidad del commit base;
4. manifest o lockfile no corresponden al commit;
5. la suite cambió después de producir evidencia;
6. existe un test obligatorio omitido;
7. lint, typecheck o build obligatorio falla;
8. una prueba funcional obligatoria falla;
9. una prueba de denegación, autorización, contexto, actor, dispositivo, sede o área falla;
10. el entorno apunta a datos o servicios productivos;
11. un fixture contiene una credencial real;
12. evidencia CI005 pertenece a otra versión o consumidor;
13. la relación resuelta no corresponde a NUMERA;
14. se intenta modificar packages antes de cerrar línea base;
15. se intenta resolver el fallo mediante bypass, cast global, skip o snapshot forzado;
16. una operación de prueba intenta crear o cambiar schema, RLS, RPC, datos o configuración remota desde NUMERA;
17. evidencia de otro consumidor o commit se acepta como propia;
18. el inventario deja de conciliar siete páginas;
19. aparece una ruta dinámica sin delta explícito;
20. aparece un route handler sin delta explícito;
21. una de las cinco rutas protegidas queda fuera de controles aplicables;
22. `/login` acepta o propaga un retorno inseguro según el contrato vigente;
23. `/no-access` acepta destino externo;
24. `returnTo`, ID, query param o payload cliente amplía autoridad;
25. `numera.access` se interpreta como permiso universal de lectura;
26. una Server Action ejecuta efectos sin revalidar `.manage`;
27. se mezcla permiso `.view` con `.manage`;
28. un valor ausente se presenta como dato económico confirmado;
29. un gasto se crea sin moneda u origen explícitos;
30. un presupuesto o gasto usa centro o periodo inválido;
31. `sync-navigation` escribe remotamente durante la certificación;
32. existe service-role real disponible para el build o fixtures;
33. un retry o replay duplica un efecto que debe ser idempotente;
34. resultados contradictorios o flaky no han sido explicados;
35. una deuda crítica conocida se transforma manualmente en PASS.

Ninguna aprobación humana convierte estas condiciones técnicas en PASS.

#### 33. Materialización futura de `SHELL-CI-012::GLOBAL`

La instancia física solo podrá declararse materializada cuando, dentro del alcance expresamente autorizado:

1. exista infraestructura de pruebas automatizadas reproducible en `devVentoGroup/vento-numera`;
2. exista un punto de entrada determinista para la suite CI012;
3. exista typecheck real;
4. exista build CI reproducible sin efectos remotos;
5. las pruebas cubran las doce superficies comunes;
6. existan perfiles seleccionables para las cuatro familias;
7. existan casos permitidos y denegados de autorización;
8. exista cobertura del inventario 7/7/0/5/2/0;
9. exista cobertura de las cuatro candidatas de navegación;
10. exista prueba del puente SSO y del estado de denegación;
11. exista cobertura de middleware y guard;
12. exista cobertura de lectura y administración de centros de costo;
13. exista cobertura de lectura y creación de gastos;
14. exista cobertura de equilibrio y rentabilidad;
15. exista cobertura de null/zero/real/expected/budget semantics;
16. exista estrategia aislada para pruebas Supabase;
17. exista cobertura explícita del prebuild y del modo no mutante de `sync-navigation`;
18. la suite no use datos productivos ni secretos reales;
19. las pruebas no modifiquen schema ni migraciones NUMERA;
20. identidad de commit, manifest, lockfile, suite, fixtures, rutas, navegación, contratos fuente y entorno forme parte de evidencia;
21. un cambio material vuelva STALE la evidencia;
22. una ejecución multi-package una perfiles sin reducir cobertura;
23. la salida sea machine-readable y consumible por CI006;
24. el habilitador falle sintéticamente ante al menos una ruptura por cada perfil;
25. demuestre que evidencia de otro consumidor o commit no es reutilizable;
26. demuestre que cero tests no se normaliza a PASS;
27. demuestre que drift de páginas o navegación no se normaliza a PASS;
28. demuestre que una manipulación territorial o de permiso no se normaliza a PASS;
29. demuestre que service-role disponible durante certificación se clasifica como bloqueo;
30. demuestre que un valor financiero ausente no se normaliza a real;
31. la autocertificación no actualice packages, no abra PR, no despliegue y no ejecute rollback.

La selección física concreta de framework, archivos y devDependencies se resolverá durante la instancia con el estado actualizado de NUMERA. El contrato no impone un proveedor inexistente por inferencia.

#### 34. Recuperación e idempotencia

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
12. retries de presupuesto, gasto o sincronización se prueban mediante fixtures u oráculos aislados, no mediante repetición contra producción.

#### 35. Estado documental conciliado

| Métrica                                      |                            Resultado |
| -------------------------------------------- | -----------------------------------: |
| Repositorio consumidor                       | **1 — `devVentoGroup/vento-numera`** |
| Familias compartidas base                    |                                **4** |
| Relaciones CI005 de NUMERA                   |                                **4** |
| Relaciones CI006 de NUMERA                   |                                **4** |
| Páginas fuente canónicas                     |                                **7** |
| Patrones estáticos                           |                                **7** |
| Patrones dinámicos                           |                                **0** |
| Rutas protegidas                             |                                **5** |
| Superficies públicas controladas             |                                **2** |
| Route handlers App Router                    |                                **0** |
| Candidatas declarativas de navegación        |                                **4** |
| Superficies funcionales comunes obligatorias |                               **12** |
| Perfiles de familia                          |                                **4** |
| Auto-merge autorizado                        |                                **0** |
| Auto-deploy autorizado                       |                                **0** |
| Migraciones Supabase autorizadas en NUMERA   |                                **0** |
| Datos productivos autorizados para pruebas   |                                **0** |
| Requisitos de prueba creados o modificados   |                                **0** |

#### 36. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA
**Requisitos creados:** **0**
**Requisitos modificados:** **0**

**Justificación:** las obligaciones de probar consumidores antes de adoptar packages compartidos, disponer de comandos reproducibles, conservar evidencia atribuible y bloquear falsos verdes ya existen en el registro canónico. La cobertura NUMERA vigente ya protege hechos económicos, conciliación, costos, presupuestos, rutas, SSO, denegación, middleware, permisos de lectura y administración, navegación, Server Actions y fronteras de datos. CI012 especializa esas obligaciones para la línea base previa de NUMERA y define su habilitador reutilizable; no introduce una regla empresarial independiente.

#### 37. Cobertura de prueba vigente reutilizada

La tarea reutiliza sin modificar, entre otras, estas obligaciones existentes:

- `TREQ-SHELL-005`, sobre comandos reproducibles y ausencia de falsos verdes;
- `TREQ-SHELL-006`, sobre pruebas propias, matriz de compatibilidad y validación por consumidor antes de publicar o adoptar;
- `TREQ-SHELL-008`, sobre requisitos afectados y resultados reproducibles por package y PR;
- `TREQ-SHELL-009`, sobre identidad verificable de repositorio, commit y ambiente;
- `TREQ-NUMERA-001`, sobre conciliación con hechos económicos y documentos fuente, segregación de permisos y trazabilidad;
- `TREQ-NUMERA-002`, sobre identidad estable del hecho económico, periodos, moneda, origen, evidencia y correcciones no destructivas;
- `TREQ-NUMERA-003`, sobre cartera, obligaciones, bancos, tesorería, estados y segregación de acciones;
- `TREQ-NUMERA-004`, sobre costos, presupuestos, forecast, punto de equilibrio, rentabilidad y distinción entre datos reales y escenarios;
- `TREQ-NUMERA-005` a `TREQ-NUMERA-024`, sobre siete páginas, rutas 001–007, clasificación 7/0, raíz, cero handlers, SSO, no-access, middleware, exposición 5/2, permisos de raíz y módulos, Server Actions, cuatro rutas de navegación, idempotencia y drift frente al commit base.

Estas referencias son trazabilidad de cobertura existente y no constituyen una modificación del registro 04A.

#### 38. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                                                                                                               |
| --------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | El marcador documental no instala dependencias, no ejecuta build de NUMERA y no materializa el harness.                                                                                                                                                                                                                                                 |
| LOCAL     | NOT_EXECUTED   | El artefacto todavía no ha sido incorporado ni validado por el checkout local del usuario.                                                                                                                                                                                                                                                              |
| REMOTA    | PASS           | Se verificaron continuidad CI011→CI012→CI013, topología global, las cuatro relaciones package–NUMERA, commit remoto observado, manifest y lockfile, árbol completo, ausencia de suite test/spec, inventario 7/7/0/5/2/0, cuatro candidatas de navegación, middleware, guard, SSO/no-access, Server Actions financieras y cobertura TREQ NUMERA vigente. |
| OPERATIVA | NOT_EXECUTED   | No se ejecutaron gastos, presupuestos, navegación, permisos, Supabase ni datos reales.                                                                                                                                                                                                                                                                  |
| FÍSICA    | NOT_APPLICABLE | La materialización pertenece a `SHELL-CI-012::GLOBAL` después de aprobación documental y autorización física explícita.                                                                                                                                                                                                                                 |

#### 39. Criterios de aceptación

`SHELL-CI-012` queda documentalmente completa cuando:

- identifica `devVentoGroup/vento-numera` como consumidor propietario;
- conserva CI006 como propietario del cambio y del PR;
- conserva la disciplina de CI007 a CI011 sin reutilizar evidencia de otro consumidor;
- gobierna exactamente cuatro relaciones package–NUMERA;
- define unidad de evidencia ligada a commit, manifest, lockfile, suite, fixtures, rutas, navegación, contratos fuente y entorno;
- exige ejecutar línea base antes de modificar versiones objetivo;
- define doce superficies funcionales comunes;
- define cuatro perfiles de familia;
- protege siete páginas estáticas y cero dinámicas;
- protege cinco rutas y dos superficies públicas controladas;
- protege cero route handlers como cardinalidad observada;
- protege cuatro candidatas declarativas de navegación;
- conserva `/login` como puente SSO;
- conserva `/no-access` como deny state;
- exige caminos permitidos y denegados;
- protege sede, área, sesión, actor, role override y dispositivo;
- protege separación `.view`/`.manage`;
- protege panel raíz sin convertir `numera.access` en permiso universal;
- protege presupuestos y centros de costo;
- protege gastos, moneda y origen;
- protege equilibrio y rentabilidad;
- protege dato ausente frente a cero, real, esperado y presupuestado;
- protege clientes Supabase/RLS/RPC y Server Actions sin autorizar cambios de base de datos desde NUMERA;
- impide service-role real durante certificación;
- impide build con sincronización remota;
- protege UI, SSR, interacción y accesibilidad;
- convierte ausencia de suite en bloqueo físico;
- soporta `INITIAL_ADOPTION`;
- soporta conjuntos multi-package;
- invalida evidencia ante cambios materiales;
- produce evidencia consumible por CI006;
- conserva fronteras NUMERA–Shell–PULSO–ORIGO–FOGO–NEXO–PASS–ANIMA;
- separa habilitador VERIFIED de consumidor conforme;
- no crea PR, no actualiza packages, no fusiona, no despliega y no ejecuta rollback durante el marcador;
- no crea ni modifica requisitos de prueba.

#### 40. Límites

Esta tarea no:

- implementa físicamente `SHELL-CI-012::GLOBAL`;
- instala un framework de pruebas durante el marcador documental;
- modifica `package.json` o `package-lock.json` de NUMERA;
- actualiza `@vento/contracts`, `@vento/os-context`, `@vento/supabase` ni `@vento/ui-web`;
- modifica código funcional NUMERA;
- modifica el inventario canónico de rutas;
- renumera `NUMERA-ROUTE-*`;
- crea route handlers;
- convierte `/login` en autenticación local;
- convierte `/no-access` en mecanismo de autorización;
- corrige el `returnTo` observado de la raíz;
- corrige por anticipado el comportamiento de `sync-navigation`;
- crea ramas ni pull requests;
- modifica la lógica del actualizador CI006;
- recalcula compatibilidad CI005;
- reutiliza evidencia NEXO, FOGO, ORIGO, PULSO o VISO como si perteneciera a NUMERA;
- normaliza todos los comandos del repositorio, responsabilidad de CI016;
- implementa por anticipado cartera, tesorería, contabilidad, presupuestos, forecast, conciliación u otras capacidades futuras;
- convierte NUMERA en propietario de hechos operativos de PULSO, compras de ORIGO, producción de FOGO, inventario de NEXO, cliente/loyalty de PASS ni gobierno Supabase de Shell;
- modifica schema, tablas, vistas, funciones, RPC, triggers, grants, RLS, Storage, Realtime, Edge Functions, datos, secretos o configuración Supabase;
- crea ni modifica migraciones dentro de NUMERA;
- usa datos productivos;
- sincroniza navegación remota durante la certificación;
- ejecuta rollback de CI014;
- coordina despliegue de CI015;
- desarrolla CI013 ni otra tarea posterior;
- crea, modifica, difiere, descarta ni vuelve obsoletos requisitos del registro 04A.

#### 41. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-CI-011 — Probar VISO antes de actualizar`

**TAREA ACTUAL APROBADA**
`SHELL-CI-012 — Probar NUMERA antes de actualizar`

**SIGUIENTE TAREA RESERVADA**
`SHELL-CI-013 — Probar ANIMA antes de actualizar`


### ✅ SHELL-CI-013 — Probar ANIMA antes de actualizar

**Estado:** APROBADA
**Tarea anterior:** SHELL-CI-012 — Probar NUMERA antes de actualizar
**Tarea siguiente:** SHELL-CI-014 — Permitir rollback por repositorio
**Tipo de tarea:** Habilitador global único — contrato documental de pruebas específicas de ANIMA previas a adopción o actualización de packages compartidos
**Bloque:** BLOQUE T — CI, pruebas, despliegue y rollback base
**Repositorio propietario:** `devVentoGroup/vento-anima`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/T_CALIDAD_Y_DESPLIEGUE/02_PRUEBAS_DE_CONSUMIDORES_Y_ROLLBACK.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma cerrada el contrato con el que ANIMA deberá demostrar una línea base reproducible, atribuible, móvil/nativa y fail-closed antes de adoptar o actualizar cualquier package compartido cuya relación con `devVentoGroup/vento-anima` haya sido aprobada explícitamente.

ANIMA no pertenece a las 28 relaciones web base de `SHELL-CI-005` y no puede incorporarse por inferencia como una relación número 29. Por tanto, CI013 protege simultáneamente dos cosas:

1. la línea base funcional y técnica del consumidor ANIMA;
2. la frontera contractual que impide convertir una aplicación Expo/React Native en un consumidor web por semejanza tecnológica o por ejecutar Expo Web.

La regla vinculante queda:

```text
ANIMA EN UN COMMIT BASE EXACTO
+ MANIFEST Y LOCKFILE EXACTOS
+ TOOLCHAIN NATIVA EXACTA
+ INVENTARIO DE 14 PANTALLAS / 3 LAYOUTS / 16 SUPERFICIES INTERNAS / 2 GLOBALES
+ 14 RUTAS ESTÁTICAS / 0 DINÁMICAS
+ 9 PESTAÑAS / 5 TIPOS DE NOTIFICACIÓN CON NAVEGACIÓN EXPLÍCITA
+ 0 EXPO ROUTE HANDLERS
+ 5 SUPERFICIES WEB-AUTH AUXILIARES SEPARADAS
+ iOS / Android COMO TARGETS MÓVILES DECLARADOS
+ BINDING NATIVO APROBADO EXPLÍCITAMENTE
+ PERFIL DE PRUEBA APLICABLE
+ ENTORNO AISLADO
+ PRUEBAS DE SESIÓN, AUTORIZACIÓN, CONTEXTO, OFFLINE, DISPOSITIVO, DATOS Y RENDERER
+ EVIDENCIA VIGENTE
= LÍNEA BASE ANIMA APTA PARA SOPORTAR UNA ADOPCIÓN O ACTUALIZACIÓN AUTORIZADA
```

Y, de forma fail-closed:

```text
EXPO BUILD VERDE
O RENDER CORRECTO EN UNA SOLA PLATAFORMA
O PESTAÑA OCULTA
O CAPABILITY LOCAL
O ROL LOCAL
O ALLOWLIST DE EMAIL
O PRUEBA WEB DE OTRO CONSUMIDOR
O EXPO WEB
O BINDING SINTÉTICO
O AUSENCIA DE TESTS AUTOMATIZADOS
≠ LÍNEA BASE ANIMA CERTIFICADA
```

CI013 certifica la línea base específica de ANIMA. No crea bindings de compatibilidad, no inventa packages nativos, no extiende la matriz web de CI005, no amplía CI006, no publica packages, no abre PR, no fusiona, no despliega, no ejecuta rollback y no corrige por anticipado deudas funcionales o de autorización que ya poseen otro propietario canónico.

#### 2. Resultado canónico

`SHELL-CI-013` establece un único habilitador reutilizable para:

1. fijar el commit base exacto de `devVentoGroup/vento-anima`;
2. fijar manifest, lockfile, configuración Expo, suite, fixtures, inventario de pantallas, layouts, superficies, navegación, contratos fuente y entorno;
3. aceptar únicamente bindings nativos explícitamente aprobados para ANIMA;
4. rechazar cualquier intento de crear `PKG-COMP-MX-029`, `PKG-PR-REL-029` o equivalente por inferencia;
5. seleccionar el perfil de pruebas aplicable según el binding y contrato propietario;
6. ejecutar una línea base técnica reproducible antes de modificar una adopción o versión compartida;
7. conservar exactamente 14 pantallas móviles activas en el snapshot contractual;
8. conservar 14 patrones estáticos y cero dinámicos;
9. conservar tres layouts separados del conteo de pantallas;
10. conservar nueve pestañas autenticadas, siete generales y dos condicionadas;
11. conservar 16 superficies internas subordinadas sin convertirlas en rutas;
12. conservar dos superficies globales separadas de las rutas;
13. conservar cero Expo Router `+api` handlers en el snapshot;
14. conservar cinco superficies fuente de `web-auth` fuera del inventario móvil;
15. conservar el circuito `/` → `/splash` → `/home` o `/login`;
16. proteger sesión, actor, sede, área, turno, rol operativo y permisos efectivos cuando apliquen;
17. comprobar que ocultar pestañas o controles no sustituye protección de acceso ni servidor;
18. proteger check-in, check-out, geocerca, conectividad y cola offline;
19. proteger idempotencia y replay de marcaciones;
20. proteger turnos, descansos, historial, documentos, carné, anuncios, equipo, soporte y configuración personal;
21. proteger eliminación y limpieza de datos sin confundir solicitud, ejecución y confirmación;
22. proteger diagnóstico técnico sin conceder autoridad por correo hardcodeado;
23. proteger navegación por notificaciones mediante allowlist exacta;
24. proteger la separación entre aplicación móvil y `web-auth`;
25. proteger la frontera React Native/Expo frente a `@vento/ui-web`;
26. proteger contratos, validadores y tokens neutrales cuando exista un binding nativo aprobado;
27. proteger clientes Supabase y datos de prueba sin autorizar cambios de Supabase desde ANIMA;
28. producir evidencia machine-readable vinculada al commit y al binding ejecutado;
29. invalidar evidencia cuando cambie cualquier entrada material;
30. bloquear una adopción o actualización cuando no exista infraestructura de prueba suficiente;
31. soportar más de un binding aprobado mediante la unión de perfiles requeridos, sin inventar relaciones base;
32. autocertificar el habilitador global una sola vez;
33. separar la certificación del harness de la conformidad funcional completa del consumidor.

#### 3. Frontera de responsabilidad

| Responsabilidad                                                           | Propietario                                       |
| ------------------------------------------------------------------------- | ------------------------------------------------- |
| pruebas propias de packages compartidos                                   | `SHELL-CI-001`                                    |
| artefacto distribuible de package                                         | `SHELL-CI-002`                                    |
| release, versión y publicación                                            | `SHELL-CI-003`                                    |
| changelog y release notes                                                 | `SHELL-CI-004`                                    |
| compatibilidad y extensión explícita hacia targets nativos                | `SHELL-CI-005` y contrato propietario del binding |
| actualización automatizada de los 7 consumidores web / 28 relaciones base | `SHELL-CI-006`                                    |
| línea base NEXO                                                           | `SHELL-CI-007`                                    |
| línea base FOGO                                                           | `SHELL-CI-008`                                    |
| línea base ORIGO                                                          | `SHELL-CI-009`                                    |
| línea base PULSO                                                          | `SHELL-CI-010`                                    |
| línea base VISO                                                           | `SHELL-CI-011`                                    |
| línea base NUMERA                                                         | `SHELL-CI-012`                                    |
| línea base ANIMA nativa antes de adopción o actualización                 | `SHELL-CI-013`                                    |
| rollback por repositorio                                                  | `SHELL-CI-014`                                    |
| independencia de despliegue                                               | `SHELL-CI-015`                                    |
| normalización transversal de comandos                                     | `SHELL-CI-016`                                    |
| trazabilidad de TREQ y evidencia por cambio                               | `SHELL-CI-017..019`                               |
| tokens neutrales compatibles con ANIMA                                    | `SHELL-NATIVE-001`                                |
| contratos y validadores portables                                         | `SHELL-NATIVE-002`                                |
| separación de UI React Native/Expo frente a web                           | `SHELL-NATIVE-003`                                |
| asignación de package/unidad física                                       | `DELIV-PKG-025` + `E5-GATE-008::<package_id>`     |

CI013 puede exigir puntos de entrada reproducibles para su propia suite futura. No absorbe la normalización global de CI016 ni convierte a CI006 en actualizador nativo.

#### 4. Topología de trabajo

`PHASE-03-T-CI-FOUNDATION` aplica `GLOBAL_ENABLE_ONCE` a `SHELL-CI-013`.

```text
MARCADOR CANÓNICO
SHELL-CI-013
→ define una sola vez el contrato de pruebas previas de ANIMA

INSTANCIA FÍSICA FUTURA
SHELL-CI-013::GLOBAL
→ materializa y autocertifica una sola vez el habilitador ANIMA

ADOPCIONES O ACTUALIZACIONES POSTERIORES
→ reutilizan el habilitador
→ generan evidencia nueva por commit base + binding + target
→ no vuelven a implementar CI013
```

La autocertificación del habilitador puede utilizar bindings, fixtures, dispositivos lógicos y datos sintéticos. No necesita un package nativo real publicado para demostrar que detecta binding inválido, target equivocado, evidencia stale, drift de inventario, zero-tests, secrets, uso productivo o fronteras de renderer rotas.

#### 5. Reconciliación con CI005 y CI006

La matriz base de CI005 permanece cerrada en 28 relaciones web:

```text
4 familias base
×
7 consumidores web
=
28 relaciones PKG-COMP-MX-001..028
```

ANIMA no se agrega a esa matriz como relación 29.

CI005 ya establece que un target adicional como ANIMA se expresa mediante un **extension binding explícito**, con identidad propia proveniente de un contrato propietario, package, consumidor, target, renderer, plataforma y aprobación. La futura ejecución de CI013 solo podrá consumir bindings de ese tipo cuando estén materializados canónicamente.

CI006, por su parte, conserva exactamente siete consumidores web y `PKG-PR-REL-001..028`. CI013 no extiende silenciosamente su implementación para escribir ANIMA.

Por tanto:

```text
COMPATIBILIDAD ANIMA
→ binding nativo explícito aprobado por su owner
→ CI005 produce o valida evidencia compatible con ese binding

LÍNEA BASE ANIMA
→ CI013 produce evidencia específica del consumidor nativo

MUTACIÓN O ADOPCIÓN REAL
→ requiere expediente/unidad/owner físico autorizado
→ no se atribuye a CI006 por inferencia
```

Hasta que exista un mecanismo físico aprobado para una adopción concreta, CI013 solo certifica baseline y no autoriza modificar dependencias de ANIMA.

#### 6. Universo de bindings gobernado

CI013 no congela una lista artificial de cuatro relaciones ANIMA.

La unidad de selección es:

```text
binding aprobado
WHERE consumer_repository = devVentoGroup/vento-anima
AND target/renderer/platform coinciden con el contrato propietario
AND binding pertenece a un package/unidad físicamente aprobados
```

Reglas:

1. cero bindings aprobados sigue siendo una situación válida del marcador documental;
2. un binding sintético solo sirve para autocertificación del harness y nunca se presenta como relación real;
3. ningún `PKG-COMP-MX-*` base se reutiliza para ANIMA;
4. no se crea `PKG-COMP-MX-029`;
5. no se crea `PKG-PR-REL-029`;
6. Expo Web no crea automáticamente un binding de `@vento/ui-web`;
7. una unidad futura de tokens, contratos o validadores conserva su identidad E5;
8. una prueba de un binding no certifica otro binding;
9. cambiar binding, package, unidad, versión, target o renderer vuelve stale la evidencia dependiente.

#### 7. Línea base documental verificable de ANIMA

El último corte canónico revisado para este marcador demuestra:

- repositorio consumidor: `devVentoGroup/vento-anima`;
- ANIMA `1.3.4`;
- Expo `~54.0.35`;
- React Native `0.81.5`;
- React `19.1.0`;
- Supabase JS `^2.91.0`;
- Expo Router como navegación;
- clasificación de renderer: `NATIVE_REACT_NATIVE_EXPO`;
- targets principales declarados: iOS y Android;
- soporte de tablet iOS no aprobado;
- ningún `@vento/*` publicado aparece todavía como adopción runtime certificada en el corte de manifests reutilizado;
- scripts Expo existentes, pero sin interfaz homogénea de tests declarada;
- 14 pantallas móviles;
- 14 patrones estáticos;
- 0 patrones dinámicos;
- 3 rutas de arranque/acceso;
- 11 rutas autenticadas;
- 9 pestañas;
- 7 pestañas generales;
- 2 pestañas condicionadas;
- 3 layouts;
- 16 superficies internas;
- 2 superficies globales;
- 0 Expo Router `+api` handlers;
- 5 superficies fuente de `web-auth`;
- 5 tipos de notificación con navegación explícita;
- 2 destinos de notificación;
- roles, capabilities, permisos y allowlists observados todavía no constituyen una matriz uniforme definitiva.

Este corte es una base documental. La futura ejecución física deberá capturar de nuevo el commit, manifest, lockfile, árbol e identidades del checkout real antes de certificarlo.

#### 8. Inventario contractual de pantallas

| ID                 | Patrón               | Clase                            |
| ------------------ | -------------------- | -------------------------------- |
| `ANIMA-SCREEN-001` | `/`                  | bootstrap / redirect             |
| `ANIMA-SCREEN-002` | `/splash`            | bootstrap y resolución de sesión |
| `ANIMA-SCREEN-003` | `/login`             | autenticación                    |
| `ANIMA-SCREEN-004` | `/home`              | asistencia                       |
| `ANIMA-SCREEN-005` | `/shifts`            | turnos                           |
| `ANIMA-SCREEN-006` | `/history`           | historial                        |
| `ANIMA-SCREEN-007` | `/documents`         | documentos                       |
| `ANIMA-SCREEN-008` | `/carnet`            | carné laboral                    |
| `ANIMA-SCREEN-009` | `/announcements`     | novedades                        |
| `ANIMA-SCREEN-010` | `/operativo`         | resumen operativo                |
| `ANIMA-SCREEN-011` | `/team`              | equipo                           |
| `ANIMA-SCREEN-012` | `/support`           | soporte                          |
| `ANIMA-SCREEN-013` | `/account-settings`  | cuenta y privacidad              |
| `ANIMA-SCREEN-014` | `/anima-diagnostics` | diagnóstico técnico              |

Todos los patrones del snapshot son estáticos.

Los route groups `(auth)` y `(app)` organizan archivos pero no forman parte de la URL. Query params, hashes, selección de trabajador, turno, sede, ticket o estado de modal no crean nuevas pantallas.

#### 9. Layouts, superficies internas y globales

CI013 conserva separadas:

**Layouts — 3**
- `ANIMA-LAYOUT-001` — root stack;
- `ANIMA-LAYOUT-002` — auth stack;
- `ANIMA-LAYOUT-003` — tab layout.

**Superficies internas — 16**
- `SitePickerModal`;
- `UserMenuModal`;
- `CreateShiftModal`;
- `EditShiftModal`;
- `HistoryDetailModal`;
- `HistoryIncidentModal`;
- `UploadDocumentModal`;
- `DocumentPickerModal`;
- `AnnouncementFormModal`;
- `TeamEditModal`;
- `TeamInviteModal`;
- `TeamDeleteModal`;
- `SupportTicketModal`;
- `ContactWorkerModal`;
- `DataCleanupFlow`;
- `DeleteAccountFlow`.

**Superficies globales — 2**
- `ErrorBoundary`;
- `AppUpdateGate`.

Ninguna de esas 21 superficies incrementa el conteo de 14 pantallas móviles.

#### 10. Navegación autenticada y notificaciones

Las nueve pestañas del snapshot son:

```text
/home
/shifts
/history
/documents
/carnet
/announcements
/operativo
/team
/support
```

`/operativo` y `/team` están condicionadas en la navegación observada. Esa visibilidad no sustituye protección efectiva de la pantalla ni del servidor.

La allowlist de notificaciones observada es:

| Tipo                  | Destino    |
| --------------------- | ---------- |
| `shift_update`        | `/shifts`  |
| `shift`               | `/shifts`  |
| `shift_end_reminder`  | `/shifts`  |
| `shift_auto_checkout` | `/shifts`  |
| `support_message`     | `/support` |

Un tipo desconocido no puede convertirse en un deep link arbitrario por datos remotos.

#### 11. Frontera de `web-auth`

El repositorio conserva cinco superficies fuente auxiliares:

- request-password;
- set-password;
- privacy-policy;
- delete-account con alias en español;
- index auxiliar cuya exposición exacta depende de configuración.

Regla:

```text
WEB-AUTH AUXILIAR
≠ APP MÓVIL
≠ PANTALLA ANIMA
≠ RENDERER WEB OPERATIVO
≠ @vento/ui-web
```

Las pruebas de CI013 deberán cubrir la separación de despliegue, token y navegación cuando el binding o cambio evaluado pueda afectarla, pero no contarán estas superficies como pantallas móviles ni convertirán ANIMA en consumidor web base.

#### 12. Distinción entre habilitador certificado y consumidor conforme

```text
SHELL-CI-013::GLOBAL = VERIFIED
```

significa que el harness:

- existe;
- es reproducible;
- reconoce bindings nativos válidos e inválidos;
- detecta otro consumidor;
- detecta otro commit;
- detecta target o renderer incorrecto;
- detecta drift del inventario ANIMA;
- detecta evidencia stale;
- detecta cero tests;
- detecta secretos;
- detecta uso de datos o servicios productivos;
- detecta falsos positivos de autorización;
- detecta ruptura de frontera RN/Expo vs web;
- produce evidencia machine-readable.

No significa:

```text
EL COMMIT ACTUAL DE ANIMA CUMPLE TODAS LAS OBLIGACIONES FUNCIONALES Y DE AUTORIZACIÓN FUTURAS
```

Las brechas ya registradas continúan visibles y una ejecución real deberá producir `FAIL` o `BLOCKED` cuando una obligación aplicable todavía no se satisfaga.

#### 13. Unidad exacta de certificación

Cada resultado se atribuye como mínimo a:

```text
consumer_repository
consumer_branch
consumer_base_commit
consumer_manifest_identity
consumer_lockfile_identity
expo_config_identity
test_contract_identity
test_suite_identity
fixture_set_identity
screen_inventory_identity
layout_inventory_identity
internal_surface_identity
web_auth_identity
source_contract_identity
environment_identity
runtime_identity
expo_identity
react_native_identity
react_identity
platform_set
device_profile_set
approved_binding_set
owner_contract_refs
anima_profile_set
execution_identity
started_at
completed_at
result
invalidation_reason
```

La unidad certificada es el commit base de ANIMA antes de la mutación evaluada.

#### 14. Momento de ejecución

Orden obligatorio para una ejecución real:

1. resolver el package/unidad compartida físicamente aprobados;
2. resolver binding o bindings explícitos hacia ANIMA;
3. fijar release o versión objetivo cuando corresponda;
4. fijar `consumer_base_commit`;
5. fijar manifest, lockfile y configuración Expo;
6. fijar inventarios de pantallas, layouts, superficies y web-auth;
7. fijar contratos fuente;
8. resolver perfiles de prueba;
9. ejecutar línea base común y perfiles seleccionados sin modificar todavía ANIMA;
10. consolidar evidencia;
11. entregar el resultado al mecanismo físico autorizado de adopción/actualización;
12. ejecutar nuevamente la cobertura pertinente sobre el commit propuesto cuando el owner del cambio lo exija.

Cambiar el commit base durante la ejecución invalida la atribución.

#### 15. Semántica de resultado

Estados permitidos:

- `PENDING`;
- `RUNNING`;
- `PASS`;
- `FAIL`;
- `BLOCKED`;
- `CANCELLED`;
- `TIMED_OUT`;
- `STALE`;
- `NOT_APPLICABLE` solo para comprobaciones realmente condicionales y justificadas.

Para considerar apta la línea base se exige `PASS` en todas las comprobaciones obligatorias del perfil activo.

No satisfacen el contrato:

- cero tests;
- test obligatorio omitido;
- evidencia de otro consumidor;
- evidencia de otro target;
- evidencia de otro renderer;
- evidencia de otro commit;
- un binding sintético presentado como real;
- un binding inexistente inferido por package name;
- Expo Web usado para justificar `@vento/ui-web`;
- Android usado para certificar iOS cuando ambos sean obligatorios;
- build usado como sustituto de interacción/dispositivo;
- tab oculta usada como sustituto de autorización;
- role fallback usado como autoridad canónica;
- email allowlist usado como permiso;
- cola offline no probada;
- replay no probado;
- dato productivo usado como fixture;
- secret o service-role usado en pruebas;
- snapshot regenerado automáticamente para forzar verde.

#### 16. Línea base técnica común

Toda ejecución real deberá demostrar, según el checkout vigente:

1. instalación reproducible con lockfile;
2. manifest y lockfile coherentes;
3. análisis estático o lint aplicable;
4. typecheck real cuando la toolchain lo permita;
5. validación Expo aplicable;
6. suite automatizada específica de CI013;
7. cero tests obligatorios omitidos;
8. configuración Expo parseable y atribuible;
9. inventario de pantallas conciliado;
10. inventario de layouts conciliado;
11. inventario de superficies internas/globales conciliado;
12. inventario `web-auth` conciliado;
13. target/plataforma registrados;
14. entorno aislado;
15. secretos ausentes;
16. datos productivos ausentes;
17. evidencia machine-readable;
18. resultado fail-closed.

El marcador no selecciona un framework de tests inexistente ni agrega dependencias. La futura instancia física lo resolverá contra el estado actualizado de ANIMA y dentro de autorización expresa.

#### 17. Matriz funcional mínima obligatoria

La suite deberá cubrir exactamente estas 16 superficies comunes:

|    # | Superficie                        | Afirmación positiva mínima                         | Afirmación negativa mínima                                      |
| ---: | --------------------------------- | -------------------------------------------------- | --------------------------------------------------------------- |
|    1 | bootstrap, sesión y login         | `/` y `/splash` conducen al destino permitido      | sesión ausente o bootstrap fallido no expone pantalla protegida |
|    2 | providers, errores y update gate  | providers y gate global conservan estado coherente | fallo/update no se normaliza como app lista                     |
|    3 | inventario de pantallas           | 14 estáticas / 0 dinámicas                         | alta, baja, duplicado o ruta dinámica bloquea                   |
|    4 | tabs, deep links y notificaciones | 9 tabs y allowlist exacta                          | pestaña oculta o tipo remoto no amplía acceso                   |
|    5 | asistencia, geocerca y sede       | marcación válida conserva contexto                 | sede/geocerca inválida no se normaliza a éxito                  |
|    6 | offline, replay e idempotencia    | cola durable y replay exacto                       | duplicado o payload distinto con mismo id bloquea               |
|    7 | turnos y descansos                | lectura/mutación autorizada preserva estado        | rol local o botón visible no autoriza mutación                  |
|    8 | historial                         | actor accede solo a historial permitido            | manipulación local no expone tercero                            |
|    9 | documentos                        | alcance y Storage conservan lifecycle              | eliminación parcial o sin permiso falla cerrada                 |
|   10 | carné laboral                     | elegibilidad real produce estado válido            | condición faltante no produce carné válido                      |
|   11 | anuncios                          | audiencia persistida/notificada/leída es coherente | administración no autorizada permanece bloqueada                |
|   12 | operativo y equipo                | acceso directo coincide con decisión efectiva      | divergencia rol/capability/permiso bloquea                      |
|   13 | soporte                           | tickets/mensajes respetan actor y territorio       | deep link no expone conversación ajena                          |
|   14 | cuenta, privacidad y eliminación  | acciones operan sobre cuenta autenticada           | solicitud pendiente no se presenta como ejecución               |
|   15 | diagnóstico técnico               | capacidad técnica y servidor protegen datos        | email hardcodeado no concede autoridad                          |
|   16 | renderer, dispositivo y web-auth  | RN/Expo y auxiliares permanecen separados          | DOM/CSS/ui-web o web-auth no se infieren como renderer móvil    |

Estas 16 superficies organizan la prueba de CI013. No crean nuevas capacidades de negocio ni nuevos requisitos 04A.

#### 18. Perfil `ANIMA-PROFILE-CONTRACTS-VALIDATORS`

Se activa únicamente cuando un binding aprobado introduce o actualiza contratos/validadores portables.

Debe cubrir:

- identidad y versión del contrato;
- parser/predicate aplicable;
- paridad de resultado frente a otros targets declarados;
- conjuntos cerrados;
- schemas;
- relaciones compuestas;
- referencias opacas;
- diagnósticos contractuales;
- cero casts como validación;
- cero catálogos paralelos;
- cero dependencias Supabase/UI en el core;
- mismos fixtures → misma decisión semántica;
- incompatibilidad de versión fail-closed.

No presume un package físico hasta que el owner E5 lo materialice.

#### 19. Perfil `ANIMA-PROFILE-OPERATIONAL-CONTEXT`

Se activa únicamente cuando un binding aprobado afecta autorización/contexto.

Debe cubrir:

- usuario y sesión;
- turno publicado;
- sede;
- área;
- rol operativo;
- check-in;
- contexto activo;
- permisos efectivos;
- razones de bloqueo;
- cambio de turno;
- descanso;
- cambio temporal de área;
- cola offline;
- revalidación al sincronizar;
- cierre de contexto;
- prohibición de otorgar permisos desde ANIMA.

Un rol local, capability local o valor cliente no puede sustituir la decisión canónica.

#### 20. Perfil `ANIMA-PROFILE-DATA-NATIVE`

Se activa únicamente cuando el binding aprobado afecta cliente de datos, contratos de transporte o integración Supabase compatible con native.

Debe cubrir:

- cliente native;
- persistencia de sesión;
- refresh;
- offline;
- retry;
- error;
- RLS/permiso efectivo;
- scope por actor/sede/área;
- idempotencia;
- conflictos;
- datos parciales;
- Storage de documentos;
- ausencia de service-role;
- ausencia de escrituras productivas durante la suite;
- correspondencia con schema/fuentes canónicas de `vento-shell`.

CI013 no crea migraciones ni cambia Supabase.

#### 21. Perfil `ANIMA-PROFILE-DESIGN-TOKENS`

Se activa únicamente si una unidad física aprobada derivada de `SHELL-NATIVE-001` declara ANIMA consumidor.

Debe cubrir:

- snapshot y versión de tokens;
- 17 tokens canónicos iniciales o versión sucesora explícita;
- compatibilidad con las 22 claves ANIMA del snapshot correspondiente;
- aliases legacy mientras estén soportados;
- mismo significado por token;
- ausencia de DOM/CSS en core;
- ausencia de React/RN/Expo en core neutral;
- adaptador nativo separado;
- typecheck/build del consumidor;
- diff sin traslado de navegación, dominio o AppShell.

La tarea no inventa nombre como `@vento/ui-native`.

#### 22. Perfil `ANIMA-PROFILE-NATIVE-UI-BOUNDARY`

Este perfil es obligatorio cuando la adopción pueda tocar composición, tokens adaptados o helpers consumidos por UI.

Debe demostrar:

```text
PLATFORM_NEUTRAL
→ puede alimentar RN/Expo

NATIVE_REACT_NATIVE_EXPO
→ conserva componentes, navegación y composición propias

WEB_REACT_DOM_CSS
→ permanece fuera del renderer ANIMA

APP_LOCAL
→ conserva pantallas, formularios, procesos y consultas propias
```

Expo Web continúa dentro de la frontera RN/Expo y no autoriza `@vento/ui-web`.

#### 23. Protección reforzada de autorización

El snapshot documental registra una combinación no uniforme de:

- roles locales;
- capabilities;
- permisos;
- fallbacks;
- allowlists.

CI013 no normaliza esa realidad como correcta.

La ejecución deberá poder probar:

1. acceso directo;
2. acceso mediante tab;
3. mutación desde formulario;
4. recurso propio;
5. recurso ajeno;
6. sede propia;
7. sede ajena;
8. área válida;
9. área inválida;
10. rol permitido;
11. rol no permitido;
12. capability presente;
13. capability ausente;
14. permiso efectivo concedido;
15. permiso efectivo denegado;
16. diagnóstico técnico con y sin autoridad.

Una divergencia relevante se registra como `FAIL` o `BLOCKED`, no como deuda invisible.

#### 24. Protección reforzada de asistencia y offline

La suite deberá conservar:

- `client_event_id` estable;
- actor;
- sede;
- turno;
- instante;
- geolocalización cuando aplique;
- contexto;
- persistencia durable de la cola;
- supervivencia a reinicio;
- replay idempotente;
- detección de mismo id con contenido distinto;
- estado pendiente distinto de aplicado;
- estado fallido distinto de aplicado;
- recuperación de conectividad;
- revalidación de autorización al sincronizar.

Un comportamiento offline verde sin replay idempotente no certifica esta superficie.

#### 25. Protección reforzada de turnos y descansos

La suite deberá distinguir:

```text
VER TURNO
≠ CREAR TURNO
≠ EDITAR TURNO
≠ CONFIRMAR
≠ CANCELAR
≠ INICIAR DESCANSO
≠ FINALIZAR DESCANSO
```

Las mutaciones deben revalidar autoridad fuera de la visibilidad del botón.

Un fallback de rol observado puede existir en baseline, pero no se convierte en contrato canónico por CI013.

#### 26. Protección reforzada de documentos

La cobertura deberá distinguir:

- lectura personal;
- lectura ampliada autorizada;
- upload;
- reemplazo;
- apertura;
- eliminación lógica/fila;
- eliminación Storage;
- retención;
- evidencia;
- error parcial;
- retry;
- reconciliación posterior.

Eliminar la fila y fallar en Storage, o viceversa, no puede declararse como eliminación completa.

#### 27. Protección reforzada de privacidad y cuenta

`/account-settings` deberá probar:

- identidad autenticada;
- permisos reales del dispositivo;
- logout;
- solicitud de limpieza;
- solicitud de eliminación;
- cancelación;
- estado pendiente;
- estado ejecutado;
- trazabilidad;
- no afectación de otra cuenta.

CI013 no implementa el backend de privacidad; solo exige que el baseline haga visibles sus fallos cuando el perfil aplicable lo cubra.

#### 28. Protección reforzada de diagnóstico

`/anima-diagnostics` es superficie técnica.

Regla:

```text
EMAIL EN ALLOWLIST
≠ CAPACIDAD TÉCNICA CANÓNICA
≠ PROTECCIÓN DE SERVIDOR
```

La suite deberá detectar:

- allowlists divergentes;
- acceso directo no protegido;
- lectura de datos sin capacidad;
- acceso a otra sede;
- datos sensibles en errores;
- bypass por navegación;
- diagnóstico habilitado en ambiente incorrecto.

#### 29. Protección reforzada de renderer

La línea base deberá demostrar que:

1. componentes React Native permanecen en ANIMA o en una unidad nativa aprobada;
2. `@vento/ui-web` no aparece por inferencia;
3. no se exige DOM ni CSS a contracts/tokens neutrales;
4. Expo Web no cambia la clase de renderer;
5. Expo Router no se sustituye por navegación web;
6. AppShell web no se importa como solución universal;
7. diferencias visuales permitidas no se interpretan como divergencia contractual;
8. paridad se mide sobre semántica, contratos, tokens y comportamiento aplicable.

#### 30. Protección reforzada de dispositivo y plataformas

Cuando sea aplicable, la ejecución deberá distinguir:

- Android;
- iOS;
- dispositivo físico;
- emulador/simulador;
- permisos de ubicación;
- permisos de notificaciones;
- conectividad;
- background/foreground;
- almacenamiento local;
- actualización de aplicación.

Un target no certifica otro cuando la condición es dependiente de plataforma.

Si una comprobación exige hardware real y no está disponible, el resultado es `BLOCKED`, no `PASS`.

#### 31. Datos, fixtures y aislamiento

Las pruebas deberán cumplir:

1. no usar datos productivos;
2. no usar credenciales reales;
3. no usar service-role;
4. no usar tokens reales persistentes;
5. fixtures deterministas;
6. actores sintéticos;
7. sedes/áreas sintéticas;
8. turnos sintéticos;
9. marcaciones sintéticas;
10. documentos sintéticos;
11. notificaciones sintéticas;
12. cleanup reproducible;
13. cero migraciones desde ANIMA;
14. schema de prueba derivado de fuente canónica cuando se necesite;
15. ningún fixture puede convertirse en una autorización real;
16. ningún snapshot puede incluir PII real.

#### 32. Adopción inicial

El corte documental no confirma dependencias publicadas `@vento/*` ya adoptadas de forma certificada por ANIMA.

Por tanto, la primera adopción futura de un binding aprobado deberá usar CI013 como oráculo previo:

```text
ANIMA BASE SIN LA ADOPCIÓN
→ CI013 PASS
→ CAMBIO AUTORIZADO
→ MISMA COBERTURA ESENCIAL SOBRE COMMIT PROPUESTO
→ COMPARACIÓN
→ REVISIÓN / GATE DEL OWNER
```

La ausencia actual del package no vuelve innecesaria la línea base.

#### 33. Actualizaciones posteriores

Para un binding ya adoptado:

- `PATCH`: línea base + regresión focal;
- `MINOR`: línea base + nueva superficie consumida;
- `MAJOR`: matriz explícita de comportamiento preservado/cambiado;
- `SECURITY`: no permite omitir autorización, offline, secretos o datos;
- `DEPRECATION`: mantiene cobertura de la superficie antigua mientras continúe soportada;
- `ROLLBACK`: la línea base CI013 sirve de referencia, pero la ejecución pertenece a CI014.

#### 34. Ejecución con múltiples bindings

Cuando más de un binding ANIMA esté aprobado para el mismo cambio:

1. se registra el conjunto cerrado;
2. se selecciona la unión de perfiles;
3. las 16 superficies comunes permanecen;
4. una familia no reduce cobertura de otra;
5. cada binding conserva owner, target y renderer;
6. ningún binding sintético se mezcla con reales;
7. cambiar un binding invalida la evidencia;
8. no se crea una relación base adicional para resumir el conjunto.

#### 35. Evidencia consumible

La evidencia satisfactoria deberá declarar:

- `devVentoGroup/vento-anima`;
- commit base;
- manifest;
- lockfile;
- Expo config;
- inventario de 14 pantallas;
- 14 estáticas / 0 dinámicas;
- tres layouts;
- nueve tabs;
- 16 superficies internas;
- dos globales;
- cero Expo handlers;
- cinco superficies web-auth;
- bindings aprobados exactos;
- owner contracts;
- packages/unidades objetivo;
- target;
- renderer;
- plataforma;
- perfiles;
- suite;
- fixtures;
- entorno;
- dispositivo o simulador cuando aplique;
- tests ejecutados/aprobados/fallidos/omitidos;
- pruebas negativas;
- estado de offline/replay;
- fronteras de autorización;
- frontera RN/Expo vs web;
- ausencia de secretos/datos productivos;
- timestamps;
- resultado;
- causa de bloqueo/stale.

#### 36. Invalidación obligatoria

La evidencia pasa a `STALE` si cambia materialmente:

- commit;
- manifest;
- lockfile;
- app config;
- Expo;
- React Native;
- React;
- Supabase client;
- suite;
- fixtures;
- inventario de pantallas;
- layouts;
- superficies internas;
- superficies globales;
- tabs;
- deep links;
- notificaciones;
- web-auth;
- providers;
- update gate;
- auth/session;
- lógica offline;
- storage;
- permisos/capabilities/roles;
- contratos fuente;
- binding;
- owner contract;
- package/unidad;
- versión objetivo;
- target;
- renderer;
- plataforma;
- environment;
- device profile;
- contrato CI013.

#### 37. Condiciones de bloqueo

La ejecución queda `BLOCKED` o `FAIL` cuando:

1. no existe runner reproducible;
2. se ejecutan cero tests;
3. no puede identificarse el commit;
4. manifest/lockfile no corresponden;
5. binding no está aprobado;
6. binding pertenece a otro consumidor;
7. se intenta inventar relación 29;
8. target o renderer no coinciden;
9. se intenta inferir `@vento/ui-web` por Expo Web;
10. el inventario ya no concilia 14 pantallas;
11. aparece ruta dinámica sin delta;
12. aparece Expo handler sin delta;
13. un layout se cuenta como pantalla;
14. web-auth se cuenta como app móvil;
15. una tab oculta se toma como control de acceso;
16. un rol local sustituye permiso efectivo;
17. un email hardcodeado concede diagnóstico;
18. una mutación no revalida autoridad;
19. offline no preserva idempotencia;
20. replay duplica efecto;
21. mismo event id con payload distinto no genera conflicto;
22. estado pendiente se presenta como aplicado;
23. documento queda parcialmente eliminado sin reconciliación;
24. deep link desconocido abre destino arbitrario;
25. una plataforma obligatoria no se prueba;
26. un test dependiente de hardware se marca PASS sin hardware;
27. se usan datos productivos;
28. se usa secreto real;
29. se usa service-role;
30. se crea o ejecuta una migración desde ANIMA;
31. se intenta publicar/merge/deploy/rollback desde CI013;
32. se reutiliza evidencia de otro commit;
33. una deuda crítica aplicable se convierte manualmente en PASS.

#### 38. Materialización futura de `SHELL-CI-013::GLOBAL`

La futura instancia podrá declararse materializada únicamente cuando, dentro de autorización expresa:

1. exista infraestructura de pruebas reproducible para ANIMA;
2. exista un punto de entrada determinista;
3. exista typecheck/lint/Expo validation aplicable;
4. exista suite automatizada;
5. cubra las 16 superficies comunes;
6. soporte perfiles seleccionables;
7. reconozca bindings explícitos;
8. rechace relaciones base inventadas;
9. cubra 14/14/0;
10. cubra 3 layouts;
11. cubra 9 tabs;
12. cubra 16 superficies internas;
13. cubra 2 globales;
14. cubra 0 Expo handlers;
15. cubra web-auth por separado;
16. cubra bootstrap y sesión;
17. cubra autorización positiva/negativa;
18. cubra asistencia/geocerca;
19. cubra offline/replay;
20. cubra turnos;
21. cubra historial;
22. cubra documentos;
23. cubra carné;
24. cubra anuncios;
25. cubra operativo/equipo;
26. cubra soporte;
27. cubra cuenta/privacidad;
28. cubra diagnóstico;
29. cubra renderer boundary;
30. cubra plataformas/dispositivo cuando aplique;
31. produzca evidencia machine-readable;
32. invalide stale;
33. rechace zero-tests;
34. rechace secretos/datos productivos;
35. no modifique packages reales durante autocertificación;
36. no modifique Supabase;
37. no cree PR;
38. no haga deploy;
39. no ejecute rollback.

La elección concreta de framework, archivos, scripts, devDependencies, simuladores o dispositivos se resolverá con el checkout actualizado durante la instancia física. El marcador no inventa tecnología no observada.

#### 39. Recuperación e idempotencia

1. reintento exacto sobre mismas entradas puede reproducir decisión;
2. intentos fallidos se conservan;
3. flaky no se resuelve reintentando hasta verde sin registro;
4. cambio de commit crea ejecución nueva;
5. cambio de binding crea ejecución nueva;
6. cambio de target/plataforma vuelve stale;
7. fallo de infraestructura produce `BLOCKED`;
8. fallo funcional produce `FAIL`;
9. timeout/cancelación no certifica;
10. corrección del harness no reescribe evidencia histórica;
11. fixture sintético nunca se reutiliza como evidencia de producción;
12. replay de operación se prueba en aislamiento;
13. rollback no se ejecuta en CI013.

#### 40. Estado documental conciliado

| Métrica                                    |                           Resultado |
| ------------------------------------------ | ----------------------------------: |
| Repositorio consumidor                     | **1 — `devVentoGroup/vento-anima`** |
| Topología CI013                            |              **GLOBAL_ENABLE_ONCE** |
| Relaciones base CI005 añadidas             |                               **0** |
| `PKG-COMP-MX-029` creado                   |                               **0** |
| `PKG-PR-REL-029` creado                    |                               **0** |
| Bindings reales fijados por inferencia     |                               **0** |
| Pantallas móviles baseline                 |                              **14** |
| Patrones estáticos                         |                              **14** |
| Patrones dinámicos                         |                               **0** |
| Rutas de arranque/acceso                   |                               **3** |
| Rutas autenticadas                         |                              **11** |
| Tabs                                       |                               **9** |
| Layouts                                    |                               **3** |
| Superficies internas                       |                              **16** |
| Superficies globales                       |                               **2** |
| Expo route handlers                        |                               **0** |
| Superficies fuente web-auth                |                               **5** |
| Superficies comunes de prueba CI013        |                              **16** |
| Auto-merge autorizado                      |                               **0** |
| Auto-deploy autorizado                     |                               **0** |
| Cambios Supabase autorizados               |                               **0** |
| Datos productivos autorizados              |                               **0** |
| Requisitos de prueba creados o modificados |                               **0** |

#### 41. Hallazgos y propietarios

| Hallazgo                                                | Tratamiento                                                                  | Propietario                                                         |
| ------------------------------------------------------- | ---------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| ANIMA no pertenece a las 28 relaciones base             | usar extension binding explícito; nunca relación 29                          | `SHELL-CI-005` + owner E5 del binding                               |
| CI006 físico solo cubre 7 consumidores web              | CI013 no amplía su mutación; la adopción nativa exige owner físico explícito | expediente/unidad aprobados por `DELIV-PKG-025` + `E5-GATE-008`     |
| no existe runner homogéneo ANIMA declarado              | materializar runner específico en la futura instancia sin absorber CI016     | `SHELL-CI-013::GLOBAL`; normalización transversal en `SHELL-CI-016` |
| existen gaps de lectura/capability en superficies ANIMA | no ocultarlos; ejecución real falla/bloquea cuando sean aplicables           | `ANIMA-AUTH-001` y tareas de autorización propietarias              |
| UI RN/Expo no debe colapsar con web                     | probar frontera, no compartir renderer por inferencia                        | `SHELL-NATIVE-003`                                                  |
| contracts/tokens pueden ser neutrales                   | probar paridad solo cuando exista binding/unidad aprobados                   | `SHELL-NATIVE-001`, `SHELL-NATIVE-002`, owner E5                    |
| Supabase pertenece a Shell                              | ANIMA no crea migraciones ni eleva privilegios                               | `devVentoGroup/vento-shell` y tareas `AUTH-DB`/`SUPA-*` aplicables  |

No queda un pendiente nuevo sin owner documental.

#### 42. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA
**Requisitos creados:** **0**
**Requisitos modificados:** **0**

**Justificación:** CI013 organiza y especializa pruebas previas para un consumidor ANIMA ya cubierto por requisitos de pantalla, navegación, asistencia, offline, autorización, datos, documentación, privacidad, contratos portables, frontera nativa y compatibilidad. No introduce una regla empresarial nueva ni cambia el significado de requisitos existentes.

#### 43. Cobertura de prueba vigente reutilizada

Sin modificar el registro, CI013 reutiliza entre otras:

- `TREQ-SHELL-005`, comandos reproducibles y falsos verdes;
- `TREQ-SHELL-006`, pruebas propias y compatibilidad por consumidor;
- `TREQ-SHELL-008`, trazabilidad de requisitos y resultados;
- `TREQ-SHELL-009`, identidad verificable de repositorio/commit/ambiente;
- `TREQ-SHELL-047`, portabilidad multiplataforma aplicable;
- `TREQ-SHELL-049..054`, contratos y validadores portables, paridad y lineage por unidad;
- `TREQ-SHELL-055..060`, separación RN/Expo/web y frontera de UI;
- `TREQ-ANIMA-001..005`, anuncios, read-only, offline/idempotencia, descansos y ciclo documental;
- `TREQ-ANIMA-006..025`, inventario, bootstrap, navegación, asistencia, turnos, historial, documentos, carné, anuncios, equipo, soporte, cuenta, diagnóstico y web-auth;
- `TREQ-UX-1520`, diferenciación de pasos de las 37 superficies ANIMA;
- `TREQ-UX-1544`, distribución de las 37 superficies entre ANIMA, SHELL y VISO sin convertir autoservicio en administración laboral.

Estas referencias son trazabilidad de cobertura existente y no una modificación de 04A.

#### 44. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                               |
| --------- | -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | El marcador documental no instala dependencias, no ejecuta Expo/build y no materializa el harness.                                                                                      |
| LOCAL     | NOT_EXECUTED   | El artefacto todavía no ha sido insertado ni validado por el checkout local del usuario.                                                                                                |
| REMOTA    | NOT_EXECUTED   | En esta preparación no se ejecutó una lectura remota nueva del repositorio; se reutilizaron snapshots y contratos canónicos aprobados disponibles para ANIMA, CI005/006 y SHELL-NATIVE. |
| OPERATIVA | NOT_EXECUTED   | No se ejecutaron dispositivos, marcaciones, turnos, documentos, notificaciones, Supabase ni datos reales.                                                                               |
| FÍSICA    | NOT_APPLICABLE | La materialización corresponde a la futura `SHELL-CI-013::GLOBAL` después de aprobación documental y autorización física explícita.                                                     |

#### 45. Criterios de aceptación

`SHELL-CI-013` queda documentalmente completa cuando:

- identifica `devVentoGroup/vento-anima` como consumidor propietario;
- conserva `GLOBAL_ENABLE_ONCE`;
- no crea una relación base 29;
- no inventa `PKG-PR-REL-029`;
- consume únicamente bindings nativos explícitos;
- mantiene CI006 limitado a su implementación web vigente;
- define línea base antes de mutar ANIMA;
- define unidad de evidencia completa;
- conserva 14 pantallas;
- conserva 14 estáticas / 0 dinámicas;
- conserva tres layouts;
- conserva nueve tabs;
- conserva 16 internas y dos globales;
- conserva cero Expo handlers;
- conserva web-auth separado;
- protege bootstrap y sesión;
- protege navegación por notificaciones;
- protege autorización de acceso directo;
- protege asistencia y geocerca;
- protege offline/replay/idempotencia;
- protege turnos y descansos;
- protege historial;
- protege documentos y Storage;
- protege carné;
- protege anuncios;
- protege operativo/equipo;
- protege soporte;
- protege privacidad/cuenta;
- protege diagnóstico;
- protege renderer RN/Expo;
- protege target/dispositivo;
- define profiles sin inventar packages;
- invalida evidencia stale;
- bloquea zero-tests;
- bloquea secrets/datos productivos;
- separa harness VERIFIED de consumer conforme;
- no crea PR;
- no hace merge/deploy;
- no ejecuta rollback;
- no cambia Supabase;
- no crea ni modifica TREQ.

#### 46. Límites

Esta tarea no:

- implementa `SHELL-CI-013::GLOBAL`;
- modifica `vento-anima`;
- modifica `package.json` o lockfile de ANIMA;
- instala test runner;
- crea `PKG-COMP-MX-029`;
- crea `PKG-PR-REL-029`;
- fija bindings reales inexistentes;
- inventa `@vento/ui-native`;
- convierte Expo Web en `@vento/ui-web`;
- modifica CI005;
- amplía CI006;
- publica packages;
- materializa `SHELL-NATIVE-001..003`;
- modifica pantallas;
- modifica navegación runtime;
- modifica roles/capabilities/permisos;
- corrige allowlists;
- corrige offline;
- corrige documentos;
- corrige privacidad;
- modifica web-auth;
- crea migraciones;
- modifica schema, RLS, RPC, grants, Storage, Realtime, Edge Functions, datos o secretos;
- ejecuta pruebas productivas;
- crea branch/PR;
- fusiona;
- despliega;
- ejecuta rollback;
- desarrolla CI014;
- crea, modifica, difiere, descarta ni vuelve obsoletos requisitos 04A.

#### 47. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-CI-012 — Probar NUMERA antes de actualizar`

**TAREA ACTUAL APROBADA**
`SHELL-CI-013 — Probar ANIMA antes de actualizar`

**SIGUIENTE TAREA RESERVADA**
`SHELL-CI-014 — Permitir rollback por repositorio`


### [ ] SHELL-CI-014 — Permitir rollback por repositorio
### [ ] SHELL-CI-015 — Evitar despliegue simultáneo obligatorio
