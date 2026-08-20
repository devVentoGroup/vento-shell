### MINI-BLOQUE — AUTORIZACIÓN DE DATOS Y METRICAS

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **autorización de datos y metricas** dentro de **AB ANALITICA INDICADORES Y DATOS MAESTROS**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `DATA-AUTH-001` a `DATA-AUTH-004` — 4 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `DATA-AUTH-001`: Proteger datos maestros, métricas, reportes y análisis por dominio, entidad, territorio y finalidad
- `DATA-AUTH-002`: Proteger información sensible, poblaciones pequeñas, comparaciones, exportaciones y drill-down
- `DATA-AUTH-003`: Separar definición, certificación, publicación, fijación de metas, anotación, exportación y administración
- `DATA-AUTH-004`: Auditar consultas, descargas, suscripciones, alertas, modelos y recomendaciones
<!-- PLAN-SECTION-META:END -->

<!-- EXECUTION-GATE-RECONCILIATION:B401-600:DATA-AUTH -->
### Reconciliación topológica de DATA-AUTH-001 a DATA-AUTH-004

Estas tareas son contratos y diseños canónicos de autorización, sensibilidad, segregación y auditoría de datos y métricas. No poseen una instancia física independiente.

| Propiedad | Valor |
| --- | --- |
| modalidad | `DEFINE_ONCE` |
| gate temporal | `NO_PHYSICAL_INSTANCE` |
| identidad | `<task_id>` |

La implementación física posterior pertenece a los `package_id`, repositorios, aplicaciones, servicios, infraestructura y tareas propietarias que materialicen el alcance aprobado. El contrato de esta familia se reutiliza como entrada y criterio de aceptación; no se duplica mediante una instancia `<task_id>::<implementation_unit_id>`.

Esta reconciliación no autoriza cambios físicos ni modifica las decisiones sustantivas ya aprobadas.

### ✅ DATA-AUTH-001 — Proteger datos maestros, métricas, reportes y análisis por dominio, entidad, territorio y finalidad

**Estado:** APROBADA
**Tarea anterior:** `DATA-DOM-017 — Definir versionado de métricas, restatements, correcciones históricas y reproducibilidad` — APROBADA
**Tarea siguiente:** `DATA-AUTH-002 — Proteger información sensible, poblaciones pequeñas, comparaciones, exportaciones y drill-down` — RESERVADA
**Tipo de tarea:** documental; contrato canónico y materializado de autorización de lectura y consumo analítico por dominio, entidad, recurso, territorio y finalidad
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, DDL, DML, migraciones, RLS, RPC, grants, cambios de permisos, cambios de datos, backfills, despliegues o cambios en Supabase:** no autorizados
**Requisitos de prueba creados o modificados:** 0

#### 1. Propósito

Definir cómo Vento OS decide qué datos maestros, métricas, reportes y análisis puede conocer un actor o proceso autorizado sin confundir propiedad funcional con permiso, dominio con aplicación, territorio con filtro de pantalla, finalidad con conveniencia ni un agregado con autoridad sobre el detalle que lo compone.

La tarea completa la frontera que `DATA-DOM-001` a `DATA-DOM-017` dejaron reservada para autorización y deberá permitir responder de forma determinista:

```text
qué capacidad exacta se solicita
quién es el principal y actor efectivo
qué dominio conserva la autoridad funcional
qué entidad, recurso, métrica o artefacto se pretende conocer
qué fuente y versión sustentan el resultado
qué territorio real pertenece al recurso o a los hechos
qué alcance tiene concedido el actor para esa capacidad
qué finalidad empresarial justifica el uso
qué población queda dentro y fuera del conjunto autorizado
qué estado de calidad, bloqueo o vigencia debe permanecer visible
cómo se compone una consulta que cruza varios dominios
cómo se evita inferir datos excluidos mediante agregados, filtros o comparaciones
qué debe reevaluarse al consultar historia, snapshots o restatements
```

Esta tarea no crea permisos nuevos, no asigna permisos a roles o personas, no define masking de campos sensibles, no fija umbrales de poblaciones pequeñas, no habilita exportaciones o drill-down, no define quién puede certificar o publicar y no crea auditoría física. Esas responsabilidades permanecen en `DATA-AUTH-002` a `DATA-AUTH-004` y en los contratos canónicos de autorización existentes.

#### 2. Resultado sustantivo

Queda materializado el contrato de autorización DATA con los siguientes resultados:

- una decisión fail closed compuesta por capacidad exacta, actor, dominio, entidad/recurso, territorio, finalidad, estado y conjunto autorizado;
- separación explícita entre propiedad funcional, stewardship, custodia técnica y autoridad efectiva del actor;
- regla de que finalidad, territorio, dominio y entidad **restringen** una capacidad, pero nunca la crean ni sustituyen;
- regla de que un permiso global conserva el límite de la capacidad exacta y no se convierte en wildcard global de datos;
- construcción server-side del conjunto autorizado antes de agregación, ordenamiento, paginación o cálculo;
- composición transversal por intersección de autorizaciones cuando un resultado consume más de un dominio;
- protección histórica: la publicación o visibilidad pasada no concede acceso perpetuo y los restatements deben reevaluarse bajo autorización vigente;
- **62 de 62 objetos** maestros/referencia reciben una decisión explícita de autorización; **43 maestros + 19 referencias; 0 faltantes; 0 duplicados**;
- se preservan **3 objetos AURA `BLOQUEADO`** sin inventar fuente operativa;
- **14 de 14 métricas de asistencia** reciben una decisión explícita de acceso; se preservan **11 `NO EVALUADO` + 3 `BLOQUEADO`**;
- **55 de 55 familias analíticas** de D009 a D013 reciben una decisión explícita de composición de acceso: `11 + 12 + 10 + 12 + 10`;
- **6 de 6 familias de artefacto** de D008 reciben reglas de herencia y reevaluación de autorización;
- ninguna decisión de esta tarea eleva calidad, certificación, causalidad, publicación, meta o estado operativo;
- cero cambios físicos y cero cambios de requisitos de prueba.

#### 3. Decisión principal

Vento OS adopta un modelo de **autorización analítica por conjunto de datos gobernado**.

```text
CAPACIDAD CANÓNICA EXACTA
+ PRINCIPAL Y ACTOR EFECTIVO
+ DOMINIO Y ENTIDAD/RECURSO RESUELTOS
+ TERRITORIO REAL DEL RECURSO O HECHO
+ ALCANCE CONCEDIDO
+ FINALIDAD EMPRESARIAL COMPATIBLE
+ ESTADO / VIGENCIA / VERSIONES APLICABLES
+ AUSENCIA DE DENEGACIÓN PREVALENTE
= CONJUNTO AUTORIZADO

CONJUNTO AUTORIZADO
→ FILTROS ADICIONALES DEL USUARIO
→ AGREGACIÓN / MÉTRICA / REPORTE / ANÁLISIS

NUNCA
CONSULTA AMPLIA → AGREGADO → FILTRO DE SEGURIDAD EN EL CLIENTE
```

La capa analítica no obtiene una autoridad transversal propia. Cada fila, hecho, dimensión, maestro o dependencia material continúa protegido por su dominio y por el contrato de autorización que le corresponde.

#### 4. Fuentes y decisiones heredadas

DATA-AUTH-001 consume sin redefinir:

- `DATA-DOM-001` para gobierno federado, propiedad, stewardship y fuentes de verdad;
- `DATA-DOM-002` y `DATA-DOM-003` para los 62 objetos, sus clases, identidades, vigencias y fronteras;
- `DATA-DOM-004` y `DATA-DOM-005` para identidad/versionado de métricas, tiempo, grano, dimensiones y comparabilidad;
- `DATA-DOM-006` y `DATA-DOM-007` para procedencia, linaje, datos tardíos, reconciliación, calidad y certificación;
- `DATA-DOM-008` para tableros, reportes, exportaciones, suscripciones, alertas y snapshots oficiales;
- `DATA-DOM-009` a `DATA-DOM-013` para las 55 familias analíticas;
- `DATA-DOM-014` a `DATA-DOM-017` para diagnóstico, objetivos, intervenciones, historia, correcciones y restatements;
- `INFO-AUTH-001` para la regla transversal de información por clasificación, finalidad, identidad/actor, relación, recurso, territorio, estado, permiso, campos y denegaciones;
- el modelo canónico de autorización para principal, actor efectivo, permisos exactos, modalidad, alcance, turnos, check-in, recurso, precedencia y denegación por defecto;
- el contrato canónico de recurso, incluido que el territorio se deriva del recurso y que `UNRESOLVED`, `CONFLICT` o aislamiento no autorizado producen denegación;
- el alcance global organizacional como ausencia de restricción territorial ordinaria dentro de la **capacidad exacta**, nunca como acceso universal;
- los requisitos de prueba vigentes que protegen gobierno de maestros, versionado y contexto de métricas, artefactos analíticos, autorización consistente y territorio.

#### 5. Fronteras conceptuales obligatorias

```text
dominio empresarial ≠ aplicación consumidora ≠ tabla física
```

```text
propietario funcional ≠ steward ≠ custodio técnico ≠ actor autorizado
```

```text
permiso ≠ alcance ≠ territorio ≠ finalidad
```

```text
rol ≠ permiso ≠ autorización final
```

```text
entidad ≠ filtro ≠ dimensión ≠ miembro de una población
```

```text
sede seleccionada ≠ territorio del recurso
```

```text
global ≠ universal ≠ todas las capacidades
```

```text
acceso a maestro ≠ acceso a hechos que lo referencian
```

```text
acceso a métrica ≠ acceso al detalle fuente
```

```text
acceso a agregado ≠ acceso a cada sujeto subyacente
```

```text
finalidad empresarial ≠ permiso de aplicación
```

```text
finalidad analítica ≠ finalidad de marketing ≠ finalidad de soporte
```

```text
calidad/certificación ≠ autorización
```

```text
publicación previa ≠ derecho perpetuo de acceso
```

```text
copiar/exportar ≠ adquirir autoridad sobre el dato
```

```text
consulta técnica posible ≠ consulta autorizada
```

#### 6. Coordenada mínima de autorización DATA

| Dimensión              | Regla canónica                                                                                              | Si no puede resolverse                                                                                  |
| ---------------------- | ----------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| capacidad              | Permiso/capacidad canónica exacta exigida por la operación; el consumidor no puede escoger una más débil.   | Denegar.                                                                                                |
| principal y actor      | Principal autenticado y actor efectivo según el modelo vigente.                                             | Denegar una acción protegida que requiera actor.                                                        |
| dominio propietario    | Dominio/aplicación que conserva la autoridad funcional del objeto o hecho.                                  | Bloquear el cruce o consumo; no elegir propietario por ubicación física.                                |
| entidad o recurso      | Objeto, hecho, métrica, artefacto, colección o agregado exactos.                                            | Denegar; no usar nombre, pantalla o parámetro libre como sustituto.                                     |
| relación               | Vínculo con sujeto, caso, recurso o propiedad cuando el contrato lo exija.                                  | Denegar cuando sea obligatoria.                                                                         |
| territorio             | Territorio real derivado del recurso/hecho y comparado con el alcance concedido.                            | Denegar; no usar sede seleccionada, primaria o enviada por cliente.                                     |
| finalidad              | Uso empresarial compatible con proceso, caso, recurso y gobierno de información.                            | Bloquear cuando la acción exige finalidad; no usar una finalidad genérica.                              |
| vigencia y versión     | Versiones de maestro, métrica, fuente y regla aplicables al corte solicitado.                               | Bloquear el resultado que dependa de la versión ausente.                                                |
| estado de dato/calidad | Estado D007 y bloqueos heredados se conservan; acceso no los mejora.                                        | No presentar uso oficial cuando el estado lo impida; acceso de investigación sigue su capacidad propia. |
| población autorizada   | Conjunto de miembros que satisfacen todas las fronteras anteriores.                                         | No calcular un agregado que requiera miembros no autorizados.                                           |
| denegaciones           | Denegaciones estructurales y explícitas conservan precedencia.                                              | Denegar aunque exista un allow coincidente.                                                             |
| artefacto/uso derivado | El tablero, reporte, alerta, snapshot u otra salida hereda como máximo el conjunto autorizado de su origen. | No producir el artefacto con población más amplia.                                                      |

#### 7. Orden de resolución y construcción del conjunto autorizado

1. Identificar la aplicación y la capacidad canónica exactas que exige la operación.
2. Resolver principal y actor efectivo sin usar rol, dispositivo o service role como identidad empresarial sustitutiva.
3. Resolver el dominio propietario y la entidad/recurso exactos desde contratos canónicos.
4. Resolver las relaciones que condicionan acceso al sujeto, maestro, hecho o colección cuando apliquen.
5. Derivar el territorio desde el recurso o hecho y compararlo con el alcance concedido; el contexto del actor solo restringe.
6. Resolver la finalidad empresarial de la consulta o uso y comprobar compatibilidad con proceso, fuente, población y gobierno de información.
7. Resolver versiones, vigencias, corte y estados necesarios para interpretar el dato sin aplicar contexto actual al pasado por defecto.
8. Evaluar allows, modalidad, prerrequisitos, denegaciones y demás condiciones del contrato de autorización.
9. Construir del lado servidor el conjunto de filas/miembros autorizado.
10. Aplicar filtros solicitados por el consumidor únicamente como reducción del conjunto ya autorizado.
11. Calcular agregados, métricas y artefactos únicamente sobre ese conjunto.
12. Cuando existan varias fuentes o dominios, intersectar las poblaciones/relaciones que cada fuente puede exponer al actor para la finalidad solicitada.
13. Reevaluar autorización al cambiar finalidad, recurso, territorio, periodo, detalle, destinatario o clase de artefacto cuando ese cambio altere la frontera.

#### 8. Reglas de dominio, entidad y recurso

- Una aplicación consumidora nunca obtiene autoridad de lectura amplia sobre otro dominio por tener una integración o copia.
- La fuente propietaria no implica que cualquier actor de esa aplicación pueda consultar el dato; la capacidad exacta sigue siendo obligatoria.
- La propiedad funcional de una entidad no concede al propietario humano acceso técnico automático; el actor debe estar autorizado.
- El recurso se resuelve en servidor. Un `site_id`, `employee_id`, `customer_id`, `product_id` o identificador enviado por cliente es un localizador, no una autorización.
- Una colección o agregado se forma a partir de miembros autorizados; no se recupera una colección amplia para ocultar miembros únicamente en la interfaz.
- Cuando una entidad tenga autoridad por atributo, el acceso al recurso no amplía los atributos permitidos; la protección fina continúa en DATA-AUTH-002/003.
- Un dato maestro compartido conserva su propietario aunque sea usado como dimensión en varios dominios.
- Un maestro retirado o una versión histórica puede ser visible para reproducibilidad solo bajo autorización vigente para ese uso histórico.

#### 9. Reglas de territorio y alcance

- El territorio del recurso se resuelve antes de compararlo con el alcance del actor.
- El alcance global organizacional elimina restricciones territoriales ordinarias únicamente para la capacidad concreta concedida; no concede otras capacidades, campos, finalidades, dominios o entornos aislados.
- La sede seleccionada y la sede primaria son contexto o preferencia; nunca sustituyen el territorio real del recurso.
- Para recursos organizacionales legítimamente no territoriales no se inventa una sede para autorizar o denegar.
- Para recursos territoriales cuyo territorio no puede resolverse, la decisión es fail closed.
- Una lectura multisede devuelve la unión de miembros individualmente autorizados; no incluye miembros no autorizados para completar totales o comparables.
- Una mutación, cuando se implemente en tareas propietarias, conservará las reglas de todos los lados requeridos; A001 no concede ninguna mutación.
- Un agregado organizacional solo es legítimo si la capacidad y el alcance permiten todos los miembros que participan o si el resultado se calcula explícitamente sobre el subconjunto autorizado y se identifica como tal.
- No se inferirá la cifra de un territorio excluido mediante total menos subtotal, comparaciones, errores diferenciados o metadatos de conteo.

#### 10. Reglas de finalidad

La finalidad es una restricción empresarial independiente de permiso y territorio. Consume el gobierno aprobado en BLOQUE AA y se deriva del proceso, caso o acción que justifica el uso.

- Una finalidad válida no crea permiso; un permiso válido no autoriza una finalidad incompatible.
- La finalidad debe poder correlacionarse con el recurso, la población y el resultado solicitado.
- Una decisión de acceso para operación no se reutiliza automáticamente para analítica, marketing, soporte, investigación, IA u otra finalidad materialmente distinta.
- Cuando exista fundamento, consentimiento u otra referencia de tratamiento, debe permanecer compatible con la finalidad; A001 no redefine ese gobierno.
- Cambiar finalidad obliga a reevaluar la decisión aunque actor, recurso y territorio sean iguales.
- No se usa “administración”, “operación”, “analítica” o “soporte” como comodín para una finalidad que el contrato exige resolver con mayor precisión.
- La finalidad puede reducir población, periodo, precisión, volumen o atributos incluso cuando el actor tenga alcance territorial suficiente.
- Una finalidad de análisis no autoriza actuar sobre el proceso ni ejecutar una recomendación.

#### 11. Matriz materializada de autorización para los 62 objetos maestros y de referencia

La matriz conserva exactamente el inventario de D002/D003. `Estado` es el estado documental/operativo heredado del objeto; no expresa una concesión al actor.

|    # | Objeto canónico               | Clase             | Fuente lógica / contrato propietario                         | Decisión de entidad y acceso                                                                                                                                        | Resolución territorial                                                                                                                   | Finalidad / uso                                                                                                                             | Estado         |
| ---: | ----------------------------- | ----------------- | ------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
|    1 | `ORGANIZATION_SCOPE`          | `DATO_MAESTRO`    | VISO                                                         | La identidad organizacional se consulta dentro de la capacidad exacta; no convierte organización en wildcard de datos.                                              | Recurso organizacional; no se inventa sede o área.                                                                                       | Finalidad de gobierno, operación o análisis compatible con el proceso que solicita el dato.                                                 | `ESPECIFICADO` |
|    2 | `LEGAL_SUBJECT`               | `DATO_MAESTRO`    | VISO                                                         | La consulta o administración se limita al sujeto jurídico exacto y a los atributos que la capacidad permita; evidencia registral externa no amplía acceso.          | Organizacional o relación explícita con establecimiento/sede cuando el uso la requiera.                                                  | Finalidad jurídica, financiera, contractual, documental o analítica explícita; datos sensibles conservan controles posteriores.             | `ESPECIFICADO` |
|    3 | `BRAND`                       | `DATO_MAESTRO`    | VISO                                                         | Marca, titular, establecimiento, sede y activo publicado siguen siendo recursos distintos; acceso a marca no autoriza sus relaciones sensibles.                     | Organizacional; los resultados locales se limitan después por la territorialidad de los hechos consumidos.                               | Finalidad de marca, comercial, publicación o análisis compatible con la acción solicitada.                                                  | `ESPECIFICADO` |
|    4 | `COMMERCIAL_ESTABLISHMENT`    | `DATO_MAESTRO`    | VISO                                                         | La autorización resuelve el establecimiento exacto y sus relaciones canónicas; conocer matrícula, nombre o dirección no concede acceso.                             | Desde el establecimiento y sus relaciones vigentes con sujeto, marca y sede; sin fallback a sede seleccionada.                           | Finalidad empresarial, contable, documental o analítica compatible con el recurso.                                                          | `ESPECIFICADO` |
|    5 | `BUSINESS_LINE`               | `DATO_MAESTRO`    | VISO                                                         | La línea de negocio se trata como recurso organizacional; no hereda por sí sola autoridad sobre marcas, sedes o canales relacionados.                               | Organizacional; cualquier desglose territorial se resuelve desde los hechos o relaciones consultados.                                    | Finalidad de dirección, planeación, operación o análisis expresamente compatible.                                                           | `ESPECIFICADO` |
|    6 | `PHYSICAL_FACILITY`           | `DATO_MAESTRO`    | VISO con operación NEXO                                      | Se autoriza la instalación exacta y no cualquier recurso que se encuentre físicamente dentro de ella.                                                               | Se resuelve desde PHYSICAL_FACILITY y sus relaciones vigentes con OPERATIONAL_SITE, zonas y áreas.                                       | Finalidad de instalaciones, activos, continuidad, SST u otra finalidad gobernada compatible.                                                | `ESPECIFICADO` |
|    7 | `OPERATIONAL_SITE`            | `DATO_MAESTRO`    | VISO                                                         | La sede es recurso territorial primario; acceso a una sede no implica acceso a todas las entidades o acciones de esa sede.                                          | La propia sede es la coordenada territorial; G, AS, SS u otro alcance solo operan si la capacidad exacta los admite y fueron concedidos. | Finalidad del proceso o análisis que justifica consultar esa sede; no existe finalidad genérica de administración.                          | `ESPECIFICADO` |
|    8 | `ORGANIZATIONAL_AREA`         | `DATO_MAESTRO`    | VISO                                                         | El área se resuelve como recurso funcional separado de zona física y estación; acceso a sede no autoriza automáticamente todas sus áreas.                           | Sede + área vigentes mediante relación canónica; sin área activa inventada.                                                              | Finalidad funcional u analítica compatible con el proceso propietario.                                                                      | `ESPECIFICADO` |
|    9 | `PHYSICAL_ZONE`               | `DATO_MAESTRO`    | NEXO con referencia VISO                                     | La zona física se autoriza por su identidad y contención; no concede autoridad funcional sobre procesos o personas de la zona.                                      | Desde zona → instalación/sede/área según relación vigente.                                                                               | Finalidad de instalación, inventario, producción, SST, continuidad o análisis compatible.                                                   | `ESPECIFICADO` |
|   10 | `WORKSTATION`                 | `DATO_MAESTRO`    | NEXO con contratos SHELL/AUTH-DEV cuando aplique             | La estación es recurso de ejecución; dispositivo, actor, endpoint y área no se sustituyen entre sí para autorizarla.                                                | Desde estación → zona/área/sede; el dispositivo solo puede restringir, nunca ampliar.                                                    | Finalidad operativa, técnica o analítica vinculada al proceso de la estación.                                                               | `ESPECIFICADO` |
|   11 | `EXTERNAL_OPERATIONAL_POINT`  | `DATO_MAESTRO`    | VISO con custodia NEXO                                       | El punto externo se autoriza como recurso gobernado con vigencia y finalidad; no se promueve a sede ni se amplía por conocimiento de su dirección.                  | Territorio declarado por su contrato y relaciones vigentes; puede ser externo y no equivalente a una sede interna.                       | Solo la finalidad explícita que originó o gobierna el punto externo y sus usos autorizados.                                                 | `ESPECIFICADO` |
|   12 | `PERSON_IDENTITY`             | `DATO_MAESTRO`    | VISO                                                         | La identidad de persona no se autoriza por nombre, correo, documento ni coincidencia con cliente; requiere relación y capacidad sobre el sujeto objetivo.           | La territorialidad se deriva de la relación empresarial aplicable, no de una sede arbitraria de la persona.                              | Finalidad laboral, administrativa, de cumplimiento o analítica compatible; finalidad distinta exige nueva evaluación.                       | `ESPECIFICADO` |
|   13 | `WORKER_PROFILE`              | `DATO_MAESTRO`    | VISO                                                         | El perfil laboral se protege por trabajador objetivo, relación y capacidad; ser supervisor, creador o compañero no concede acceso.                                  | Desde las asignaciones laborales vigentes/históricas aplicables al trabajador y al uso.                                                  | Finalidad laboral, de programación, autorización contextual o analítica expresamente justificada.                                           | `ESPECIFICADO` |
|   14 | `EMPLOYMENT_RELATIONSHIP`     | `DATO_MAESTRO`    | VISO                                                         | Cada vínculo se autoriza como recurso propio; persona, cargo y contrato visible no sustituyen la decisión sobre el vínculo.                                         | Desde empleador, alcance organizacional y asignaciones relacionadas según la vigencia consultada.                                        | Finalidad laboral, contractual, financiera, cumplimiento o analítica compatible.                                                            | `ESPECIFICADO` |
|   15 | `CONTRACTUAL_POSITION`        | `DATO_REFERENCIA` | VISO                                                         | La referencia de cargo puede consultarse dentro de la capacidad concedida; no concede acceso a trabajadores que la usan ni autoridad por jerarquía nominal.         | Organizacional; cualquier consulta de personas se reevalúa sobre los trabajadores objetivo.                                              | Finalidad laboral, planificación o análisis compatible.                                                                                     | `ESPECIFICADO` |
|   16 | `BASE_ROLE`                   | `DATO_REFERENCIA` | SHELL / modelo canónico de autorización                      | El rol base es dato de referencia del modelo de autorización; conocerlo o poseerlo no concede datos fuera de permisos exactos.                                      | Organizacional y no territorial por sí mismo; el alcance se resuelve en cada permiso concedido.                                          | Solo finalidades de autorización, gobierno o análisis autorizado del modelo; nunca como bypass de acceso a datos.                           | `ESPECIFICADO` |
|   17 | `OPERATIONAL_ROLE`            | `DATO_REFERENCIA` | VISO con consumo del modelo de autorización                  | El rol operativo describe función contextual; no crea por sí solo permiso ni autoridad sobre datos del proceso.                                                     | Se consume junto con turno/contexto cuando una capacidad operativa lo requiera; no sustituye territorio del recurso.                     | Finalidad de operación, planificación, autorización o análisis compatible.                                                                  | `ESPECIFICADO` |
|   18 | `WORK_ASSIGNMENT`             | `DATO_MAESTRO`    | VISO                                                         | La asignación se consulta o administra como recurso explícito; compartir sede/área con el actor no autoriza la asignación de otro trabajador.                       | Desde trabajador + sede + área + función + vigencia de la asignación.                                                                    | Finalidad laboral, planificación, autorización contextual o análisis expresamente compatible.                                               | `ESPECIFICADO` |
|   19 | `CUSTOMER_PERSON`             | `DATO_MAESTRO`    | PASS                                                         | La persona cliente requiere relación, finalidad y capacidad; una venta, teléfono, correo o coincidencia con PERSON_IDENTITY no concede acceso al maestro.           | Se resuelve por relación cliente/marca/canal cuando aplique; no se deriva del territorio laboral del actor.                              | Finalidad de servicio, fidelización, soporte, cumplimiento o analítica autorizada; marketing u otra finalidad exige evaluación propia.      | `ESPECIFICADO` |
|   20 | `CUSTOMER_CONTACT`            | `DATO_MAESTRO`    | PASS                                                         | El contacto es recurso separado y no una llave para acceso masivo al cliente; la autorización de la persona no implica todos sus contactos.                         | Relación con CUSTOMER_PERSON y alcance de marca/canal cuando el contrato lo exija.                                                       | Finalidad compatible con contacto/verificación/servicio/comunicación; uso distinto requiere nueva evaluación.                               | `ESPECIFICADO` |
|   21 | `CUSTOMER_RELATIONSHIP`       | `DATO_MAESTRO`    | PASS                                                         | La relación cliente-marca/alcance se protege como recurso propio y no se confunde con consentimiento ni preferencia.                                                | Desde los extremos y la vigencia de la relación; no se inventa sede.                                                                     | Finalidad de relación, servicio, fidelización o análisis compatible.                                                                        | `ESPECIFICADO` |
|   22 | `CUSTOMER_PROFILE`            | `DATO_MAESTRO`    | PASS                                                         | El perfil se limita a la proyección y capacidad autorizadas; no habilita decisiones internas o atributos no incluidos por ser perfil del mismo cliente.             | Desde CUSTOMER_PERSON/CUSTOMER_RELATIONSHIP y alcance del uso.                                                                           | Finalidad de autoservicio, servicio o análisis explícito; minimización detallada queda en DATA-AUTH-002.                                    | `ESPECIFICADO` |
|   23 | `CUSTOMER_PREFERENCE`         | `DATO_MAESTRO`    | PASS                                                         | La preferencia es recurso gobernado y no autorización; acceso a preferencias no equivale a permiso para contactar o perfilar.                                       | Desde cliente, tipo, alcance y vigencia de la preferencia.                                                                               | Finalidad compatible con el uso declarado; consentimiento/fundamento permanece independiente.                                               | `ESPECIFICADO` |
|   24 | `LOYALTY_ACCOUNT`             | `DATO_MAESTRO`    | PASS                                                         | La cuenta se autoriza separada del ledger, saldo y cliente; acceso a una cuenta no concede transacciones o perfiles completos.                                      | Desde cliente/programa/alcance aplicables; territorio solo cuando el programa o uso lo defina.                                           | Finalidad de fidelización, servicio, conciliación o análisis autorizado.                                                                    | `ESPECIFICADO` |
|   25 | `LOYALTY_PROGRAM_RULE`        | `DATO_REFERENCIA` | PASS                                                         | La regla se consulta por versión y programa; acceso a la regla no concede cuentas, movimientos o clientes.                                                          | Organizacional/programa; no se inventa sede salvo que la versión tenga alcance territorial explícito.                                    | Finalidad de operación del programa, soporte, conciliación o análisis compatible.                                                           | `ESPECIFICADO` |
|   26 | `PRODUCTO_MAESTRO`            | `DATO_MAESTRO`    | NEXO                                                         | La identidad maestra se autoriza por capacidad de catálogo; consumir producto en FOGO, ORIGO o PULSO no concede administración NEXO.                                | Identidad maestra organizacional; atributos/localizaciones territoriales se resuelven en sus propios recursos.                           | Finalidad de catálogo, abastecimiento, producción, venta o análisis compatible con el contrato consumidor.                                  | `ESPECIFICADO` |
|   27 | `VARIANTE`                    | `DATO_MAESTRO`    | NEXO                                                         | La variante conserva la misma frontera de catálogo: usarla en otro dominio no transfiere autoridad de edición.                                                      | Organizacional respecto del maestro; cualquier oferta/stock local se autoriza sobre esos recursos separados.                             | Finalidad de catálogo, compra, producción, venta o análisis compatible.                                                                     | `ESPECIFICADO` |
|   28 | `PRESENTACION`                | `DATO_MAESTRO`    | NEXO                                                         | La presentación se autoriza como identidad de catálogo y no por coincidencia de etiqueta, cantidad o unidad.                                                        | Organizacional respecto del maestro; los usos locales heredan territorio del hecho o configuración consumidora.                          | Finalidad de catálogo, abastecimiento, inventario, producción, venta o análisis compatible.                                                 | `ESPECIFICADO` |
|   29 | `UNIDAD_DE_MEDIDA`            | `DATO_REFERENCIA` | NEXO                                                         | La unidad es referencia compartida; acceso no concede productos, conversiones o hechos fuera de la capacidad solicitada.                                            | Organizacional/no territorial por sí misma.                                                                                              | Finalidad de cálculo, catálogo, operación o análisis compatible.                                                                            | `ESPECIFICADO` |
|   30 | `TAXONOMIA_TIPO_MAESTRO`      | `DATO_REFERENCIA` | NEXO                                                         | La taxonomía se consulta/gestiona por capacidad de catálogo; no concede objetos clasificados por pertenecer a la categoría.                                         | Organizacional; la territorialidad de objetos clasificados se evalúa aparte.                                                             | Finalidad de catálogo, gobierno o análisis compatible.                                                                                      | `ESPECIFICADO` |
|   31 | `TAXONOMIA_INVENTARIO`        | `DATO_REFERENCIA` | NEXO                                                         | La clasificación de inventario no concede acceso a existencias, lotes o movimientos; esos recursos conservan autorización propia.                                   | Organizacional; los hechos de inventario se filtran por su territorio real.                                                              | Finalidad de catálogo, inventario, calidad o análisis compatible.                                                                           | `ESPECIFICADO` |
|   32 | `TAXONOMIA_OPERACIONAL`       | `DATO_REFERENCIA` | NEXO                                                         | La clasificación operacional no controla menús ni permisos y no concede los recursos que clasifica.                                                                 | Organizacional; los recursos operativos conservan territorio propio.                                                                     | Finalidad de catálogo, operación o análisis compatible.                                                                                     | `ESPECIFICADO` |
|   33 | `LOC`                         | `DATO_MAESTRO`    | NEXO                                                         | La LOC se autoriza por su identidad y contención; conocer código o nombre no concede existencia, movimiento o ajuste.                                               | Desde LOC → sede/área/zona/parentaje vigente; UNRESOLVED o conflicto territorial deniega.                                                | Finalidad de inventario, producción, logística o análisis compatible.                                                                       | `ESPECIFICADO` |
|   34 | `ACTIVO_FISICO`               | `DATO_MAESTRO`    | NEXO                                                         | El activo se autoriza separado de endpoint, dispositivo y custodio; TI no adquiere autoridad sobre el maestro físico por operar el endpoint.                        | Desde activo → ubicación/custodia/sede vigentes o históricas según el corte.                                                             | Finalidad de activos, mantenimiento, soporte, continuidad, finanzas o análisis compatible.                                                  | `ESPECIFICADO` |
|   35 | `CLASE_DE_ACTIVO`             | `DATO_REFERENCIA` | NEXO                                                         | La clase de activo es referencia; acceso no concede activos concretos ni políticas de mantenimiento.                                                                | Organizacional; cada activo resuelve su territorio.                                                                                      | Finalidad de catálogo de activos, mantenimiento o análisis compatible.                                                                      | `ESPECIFICADO` |
|   36 | `ESPECIFICACION_PRODUCTO`     | `DATO_MAESTRO`    | NEXO; FOGO para especificación productiva cuando corresponda | La especificación se autoriza por objeto, versión y atributo propietario; no se amplía a producto completo o receta por relación.                                   | Derivada del objeto y alcance al que aplica la versión; puede ser organizacional o territorial según contrato.                           | Finalidad de calidad, catálogo, compra, producción o cumplimiento compatible con la versión aplicable.                                      | `ESPECIFICADO` |
|   37 | `PROVEEDOR`                   | `DATO_MAESTRO`    | ORIGO                                                        | El proveedor se protege como recurso comercial; consultar identidad no concede contactos, condiciones, cuentas u otros atributos sensibles.                         | Organizacional o alcance comercial explícito; relaciones territoriales se resuelven desde contratos/operaciones que las contengan.       | Finalidad de compras, abastecimiento, cumplimiento, finanzas o análisis compatible.                                                         | `ESPECIFICADO` |
|   38 | `CONTACTO_PROVEEDOR`          | `DATO_MAESTRO`    | ORIGO                                                        | El contacto se autoriza por relación con proveedor y finalidad; no es un atajo para el expediente completo del proveedor.                                           | Desde la relación de proveedor y el contexto de uso; no se inventa sede.                                                                 | Finalidad de compra, recepción, soporte o comunicación empresarial compatible.                                                              | `ESPECIFICADO` |
|   39 | `RELACION_PRODUCTO_PROVEEDOR` | `DATO_MAESTRO`    | ORIGO                                                        | La relación de suministro se autoriza sobre ambos extremos y su alcance; no concede precio, contrato o condición no incluidos.                                      | Desde proveedor + producto/presentación + alcance y vigencia de la relación.                                                             | Finalidad de abastecimiento, compra, planificación o análisis compatible.                                                                   | `ESPECIFICADO` |
|   40 | `CONDICION_COMERCIAL`         | `DATO_MAESTRO`    | ORIGO                                                        | La condición comercial requiere capacidad sobre la relación y versión; valores monetarios o términos no se exponen por acceso genérico a proveedor.                 | Desde proveedor/relación/producto/alcance y vigencia de la condición.                                                                    | Finalidad de negociación, compra, aprobación, conciliación o análisis compatible.                                                           | `ESPECIFICADO` |
|   41 | `TAXONOMIA_COMPRA`            | `DATO_REFERENCIA` | ORIGO                                                        | La taxonomía de compra es referencia; no concede órdenes, proveedores ni importes clasificados.                                                                     | Organizacional; los recursos de compra resuelven territorio propio.                                                                      | Finalidad de compras, clasificación o análisis compatible.                                                                                  | `ESPECIFICADO` |
|   42 | `RECETA`                      | `DATO_MAESTRO`    | FOGO                                                         | La receta raíz y sus versiones se autorizan por capacidad productiva; relación con producto no concede catálogo NEXO ni ejecución de lotes.                         | Desde el alcance productivo de la receta y, cuando exista, sede/área aplicables a la versión o uso.                                      | Finalidad de producción, calidad, planeación, costo o análisis compatible.                                                                  | `ESPECIFICADO` |
|   43 | `FAMILIA_PRODUCTIVA`          | `DATO_REFERENCIA` | FOGO                                                         | La familia productiva es referencia y no concede recetas, órdenes o lotes clasificados.                                                                             | Organizacional; hechos productivos conservan su territorio.                                                                              | Finalidad de producción, planificación o análisis compatible.                                                                               | `ESPECIFICADO` |
|   44 | `RUTA_PRODUCTIVA`             | `DATO_MAESTRO`    | FOGO                                                         | La ruta se autoriza como definición versionada; acceso a una ruta no concede ejecuciones ni recursos relacionados.                                                  | Desde el alcance de la ruta y las sedes/áreas donde sea aplicable; sin asumir que todas las sedes la usan.                               | Finalidad de producción, planificación, calidad o análisis compatible.                                                                      | `ESPECIFICADO` |
|   45 | `RECURSO_PRODUCTIVO`          | `DATO_MAESTRO`    | FOGO con referencia a activos NEXO cuando corresponda        | El recurso funcional se autoriza separado del activo físico; relación con ACTIVO_FISICO no transfiere autoridad entre FOGO y NEXO.                                  | Desde recurso → área/sede productiva y relación vigente con activo cuando aplique.                                                       | Finalidad de producción, capacidad, mantenimiento o análisis compatible.                                                                    | `ESPECIFICADO` |
|   46 | `COMMERCIAL_CHANNEL`          | `DATO_REFERENCIA` | PULSO                                                        | El canal se consulta como referencia; acceso no concede pedidos, clientes o cuentas externas del canal.                                                             | Organizacional/canal; hechos locales se filtran por sede y demás dimensiones del hecho.                                                  | Finalidad comercial, servicio, logística, marketing o análisis compatible.                                                                  | `ESPECIFICADO` |
|   47 | `CATEGORIA_COMERCIAL`         | `DATO_REFERENCIA` | PULSO                                                        | La categoría comercial es referencia de oferta; no concede productos, stock, clientes o campañas.                                                                   | Organizacional/brand-channel según contrato; los hechos conservan territorio propio.                                                     | Finalidad de oferta, navegación, comercial o análisis compatible.                                                                           | `ESPECIFICADO` |
|   48 | `OFERTA_COMERCIAL`            | `DATO_MAESTRO`    | PULSO                                                        | La oferta se autoriza por versión y contexto; acceso al producto no concede automáticamente la oferta ni viceversa.                                                 | Desde marca/canal/sede/producto/vigencia declarados por la oferta.                                                                       | Finalidad de venta, servicio, publicación comercial o análisis compatible.                                                                  | `ESPECIFICADO` |
|   49 | `CENTRO_DE_COSTO`             | `DATO_MAESTRO`    | NUMERA                                                       | El centro económico se autoriza como dimensión financiera propia; no se sustituye por sede, área, marca o canal.                                                    | Desde su jerarquía/alcance económico y relaciones territoriales explícitas; no se infiere sede por nombre.                               | Finalidad financiera, presupuestal, control, conciliación o análisis compatible.                                                            | `ESPECIFICADO` |
|   50 | `MONEDA`                      | `DATO_REFERENCIA` | NUMERA                                                       | La moneda es referencia; acceso no concede importes, tasas, saldos o documentos financieros.                                                                        | Organizacional/no territorial; hechos monetarios conservan su alcance.                                                                   | Finalidad de cálculo, finanzas o análisis compatible.                                                                                       | `ESPECIFICADO` |
|   51 | `PERIODO_ECONOMICO`           | `DATO_REFERENCIA` | NUMERA                                                       | El periodo económico es referencia versionada; no concede hechos contenidos en ese periodo.                                                                         | Organizacional/calendario; cada hecho conserva territorio y fuente.                                                                      | Finalidad económica, presupuestal, cierre o análisis compatible.                                                                            | `ESPECIFICADO` |
|   52 | `PERIODO_CONTABLE`            | `DATO_REFERENCIA` | NUMERA o sistema contable autorizado según alcance vigente   | El periodo contable es referencia y no se confunde con periodo económico; acceso no concede asientos o documentos.                                                  | Según el alcance contable vigente; no se inventa sede si el periodo es organizacional.                                                   | Finalidad contable, cierre, conciliación o análisis compatible.                                                                             | `ESPECIFICADO` |
|   53 | `PERIODO_FISCAL`              | `DATO_REFERENCIA` | NUMERA con autoridad externa aplicable                       | La referencia fiscal conserva su autoridad externa; conocer el periodo no concede datos tributarios o expedientes.                                                  | Según marco/alcance fiscal aplicable; territorialidad de hechos se evalúa aparte.                                                        | Finalidad fiscal, cumplimiento, conciliación o análisis compatible.                                                                         | `ESPECIFICADO` |
|   54 | `CLASIFICACION_ECONOMICA`     | `DATO_REFERENCIA` | NUMERA                                                       | La clasificación económica no concede hechos, importes ni centros que la utilicen.                                                                                  | Organizacional; los hechos clasificados conservan su territorio.                                                                         | Finalidad financiera, control, presupuesto o análisis compatible.                                                                           | `ESPECIFICADO` |
|   55 | `PERFIL_DE_MARCA`             | `DATO_MAESTRO`    | AURA objetivo                                                | No se presume una superficie operativa ni autoridad productiva mientras AURA esté diferida; cualquier dato real proveniente de otra fuente conserva su propietario. | No se materializa un territorio operativo AURA inexistente; solo contratos/documentación aprobados pueden definir alcance.               | Finalidad de marca gobernada; no se inventa uso operativo para superar el bloqueo.                                                          | `BLOQUEADO`    |
|   56 | `AUDIENCIA`                   | `DATO_MAESTRO`    | AURA objetivo                                                | La audiencia permanece bloqueada como fuente operativa; pertenencia, segmentación o superposición no autorizan acceso a personas.                                   | No se materializa territorio operativo AURA inexistente; cualquier población futura deberá resolver su alcance real.                     | Finalidad de audiencia/marketing compatible con gobierno de privacidad y consentimiento; no se reutiliza finalidad analítica o de servicio. | `BLOQUEADO`    |
|   57 | `ACTIVO_DE_MARCA`             | `DATO_MAESTRO`    | AURA objetivo bajo gobierno documental                       | El activo de marca permanece bloqueado operativamente; URL, archivo o Storage no conceden acceso ni autoridad.                                                      | Alcance de marca/publicación gobernado; no se inventa sede por ubicación técnica del archivo.                                            | Finalidad de marca/publicación compatible con derechos y gobierno documental.                                                               | `BLOQUEADO`    |
|   58 | `ENDPOINT`                    | `DATO_MAESTRO`    | BLOQUE Z / contrato TI-DOM-002                               | El endpoint se autoriza por identidad técnica estable; IP, MAC, hostname, asset o dispositivo relacionado no son sustitutos de la decisión.                         | Desde endpoint → activo/sede/área/servicio según relaciones TI vigentes.                                                                 | Finalidad de operación TI, soporte, seguridad, continuidad o análisis autorizado.                                                           | `ESPECIFICADO` |
|   59 | `SHARED_DEVICE`               | `DATO_MAESTRO`    | SHELL / contratos AUTH-DEV consumidos por BLOQUE Z           | El dispositivo compartido no presta sus límites ni permisos al actor; actor efectivo y recurso permanecen separados.                                                | Desde configuración canónica del dispositivo y contexto válido; solo restringe la operación.                                             | Finalidad técnica/operativa compatible; no concede acceso por estar físicamente en la estación.                                             | `ESPECIFICADO` |
|   60 | `NETWORK_RESOURCE`            | `DATO_MAESTRO`    | BLOQUE Z                                                     | El recurso de red se autoriza por identidad técnica; dirección, SSID o proveedor no conceden acceso a otros recursos técnicos o empresariales.                      | Desde topología/instalación/sede/segmento gobernados por TI.                                                                             | Finalidad de operación TI, seguridad, soporte, continuidad o análisis autorizado.                                                           | `ESPECIFICADO` |
|   61 | `APPLICATION`                 | `DATO_MAESTRO`    | SHELL                                                        | La aplicación se autoriza como dato maestro de SHELL; acceso a su registro no equivale a `app.access`, y `app.access` no concede sus datos maestros internos.       | Organizacional/no territorial por identidad; ambientes aislados mantienen contratos propios.                                             | Finalidad de gobierno de aplicaciones, TI, autorización o análisis compatible.                                                              | `ESPECIFICADO` |
|   62 | `TECH_SERVICE`                | `DATO_REFERENCIA` | BLOQUE Z / TI-DOM-001                                        | La familia de servicio conserva las once identidades existentes; acceder al catálogo no concede tickets, incidentes, endpoints o contratos relacionados.            | Organizacional/servicio; los recursos concretos conservan territorio propio.                                                             | Finalidad de soporte, operación TI, continuidad, costos o análisis compatible.                                                              | `ESPECIFICADO` |

**Reconciliación:** 62 esperados; 62 materializados; 0 faltantes; 0 duplicados; 43 `DATO_MAESTRO`; 19 `DATO_REFERENCIA`; 3 objetos AURA `BLOQUEADO`.

#### 12. Reglas globales de la matriz de 62 objetos

- La decisión por objeto define la frontera de autorización; no crea un permiso nuevo ni un catálogo DATA paralelo.
- Los tres objetos AURA bloqueados continúan en el inventario para preservar identidad y gobierno, pero A001 no presume fuente, usuarios, pantallas o datos operativos inexistentes.
- Un objeto de referencia organizacional puede ser consultable sin sede solo cuando su contrato de recurso sea legítimamente no territorial; esto no concede hechos relacionados.
- Los objetos de persona, cliente, proveedor y contacto requieren relación/finalidad compatibles cuando su contrato lo exija; compartir sede, marca o proceso no basta.
- Los objetos territoriales se resuelven desde sus relaciones canónicas y nunca desde un filtro elegido por el cliente.
- Los objetos compartidos entre dominios conservan la fuente propietaria y no admiten edición o lectura ampliada por el consumidor.
- La matriz no sustituye DATA-AUTH-002 para datos sensibles, campos, poblaciones pequeñas, comparación, exportación o drill-down.

#### 13. Matriz materializada de autorización para las 14 métricas de asistencia

Las métricas conservan identidad, fórmula, versión semántica `1`, fuentes lógicas y estado DQ ya aprobados. A001 solo decide la frontera de acceso.

|    # | `metric_key`        | Nombre empresarial                                 | Estado DQ heredado | Territorio / población autorizable                      | Decisión A001                                                                                                                                                                                             |
| ---: | ------------------- | -------------------------------------------------- | ------------------ | ------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | `scheduledShifts`   | Turnos programados computables                     | `NO EVALUADO`      | sede + trabajador autorizado + periodo/corte aplicables | Puede consumirse únicamente para trabajador/sede/periodo dentro del conjunto autorizado y con finalidad laboral/analítica compatible; el agregado no concede el detalle.                                  |
|    2 | `attendedShifts`    | Turnos con asistencia registrada                   | `NO EVALUADO`      | sede + trabajador autorizado + periodo/corte aplicables | Puede consumirse únicamente para trabajador/sede/periodo dentro del conjunto autorizado y con finalidad laboral/analítica compatible; el agregado no concede el detalle.                                  |
|    3 | `restDayCount`      | Turnos clasificados como descanso                  | `NO EVALUADO`      | sede + trabajador autorizado + periodo/corte aplicables | Puede consumirse únicamente para trabajador/sede/periodo dentro del conjunto autorizado y con finalidad laboral/analítica compatible; el agregado no concede el detalle.                                  |
|    4 | `lateCount`         | Turnos con llegada tardía                          | `NO EVALUADO`      | sede + trabajador autorizado + periodo/corte aplicables | Puede consumirse únicamente para trabajador/sede/periodo dentro del conjunto autorizado y con finalidad laboral/analítica compatible; el agregado no concede el detalle.                                  |
|    5 | `noShowCount`       | Turnos finalizados sin asistencia                  | `NO EVALUADO`      | sede + trabajador autorizado + periodo/corte aplicables | Puede consumirse únicamente para trabajador/sede/periodo dentro del conjunto autorizado y con finalidad laboral/analítica compatible; el agregado no concede el detalle.                                  |
|    6 | `openCount`         | Turnos con sesión de asistencia abierta            | `NO EVALUADO`      | sede + trabajador autorizado + periodo/corte aplicables | Puede consumirse únicamente para trabajador/sede/periodo dentro del conjunto autorizado y con finalidad laboral/analítica compatible; el agregado no concede el detalle.                                  |
|    7 | `missingCloseCount` | Turnos vencidos sin cierre                         | `BLOQUEADO`        | sede + trabajador autorizado + periodo/corte aplicables | Puede ser visible solo bajo un uso autorizado que admita resultado no oficial/bloqueado; A001 no la certifica ni permite presentarla como oficial. Trabajador/sede/periodo siguen limitando la población. |
|    8 | `autoCloseCount`    | Turnos cerrados automáticamente                    | `NO EVALUADO`      | sede + trabajador autorizado + periodo/corte aplicables | Puede consumirse únicamente para trabajador/sede/periodo dentro del conjunto autorizado y con finalidad laboral/analítica compatible; el agregado no concede el detalle.                                  |
|    9 | `departureCount`    | Turnos con salida de sede detectada durante sesión | `NO EVALUADO`      | sede + trabajador autorizado + periodo/corte aplicables | Puede consumirse únicamente para trabajador/sede/periodo dentro del conjunto autorizado y con finalidad laboral/analítica compatible; el agregado no concede el detalle.                                  |
|   10 | `scheduledMinutes`  | Minutos netos programados                          | `NO EVALUADO`      | sede + trabajador autorizado + periodo/corte aplicables | Puede consumirse únicamente para trabajador/sede/periodo dentro del conjunto autorizado y con finalidad laboral/analítica compatible; el agregado no concede el detalle.                                  |
|   11 | `netMinutes`        | Minutos netos registrados                          | `NO EVALUADO`      | sede + trabajador autorizado + periodo/corte aplicables | Puede consumirse únicamente para trabajador/sede/periodo dentro del conjunto autorizado y con finalidad laboral/analítica compatible; el agregado no concede el detalle.                                  |
|   12 | `incidentCount`     | Turnos con señal de incidencia de asistencia       | `NO EVALUADO`      | sede + trabajador autorizado + periodo/corte aplicables | Puede consumirse únicamente para trabajador/sede/periodo dentro del conjunto autorizado y con finalidad laboral/analítica compatible; el agregado no concede el detalle.                                  |
|   13 | `attendanceRate`    | Tasa de asistencia                                 | `BLOQUEADO`        | sede + trabajador autorizado + periodo/corte aplicables | Puede ser visible solo bajo un uso autorizado que admita resultado no oficial/bloqueado; A001 no la certifica ni permite presentarla como oficial. Trabajador/sede/periodo siguen limitando la población. |
|   14 | `punctualityRate`   | Tasa de puntualidad entre turnos asistidos         | `BLOQUEADO`        | sede + trabajador autorizado + periodo/corte aplicables | Puede ser visible solo bajo un uso autorizado que admita resultado no oficial/bloqueado; A001 no la certifica ni permite presentarla como oficial. Trabajador/sede/periodo siguen limitando la población. |

**Reconciliación:** 14 esperadas; 14 materializadas; 14 claves únicas; 0 faltantes; 0 duplicadas; 11 `NO EVALUADO`; 3 `BLOQUEADO`.

#### 14. Calidad, bloqueo y autorización

- `CERTIFICADO` no concede acceso; el actor sigue necesitando autorización.
- `NO EVALUADO` no convierte el dato en público; puede permitir usos provisionales solo cuando el contrato de publicación/calidad lo admita y el actor esté autorizado.
- `DEGRADADO` no amplía acceso y su condición debe permanecer visible.
- `BLOQUEADO` puede impedir uso oficial/certificado sin impedir necesariamente una investigación autorizada destinada a resolver el bloqueo; la capacidad de investigación debe ser propia y no un bypass.
- La calidad de una dependencia no se mejora porque el actor tenga permiso global.
- La autorización no modifica el estado D007 ni el nivel de confianza D014.

#### 15. Matriz materializada de autorización para las 55 familias analíticas

Cada fila conserva el nombre de la familia aprobada. La decisión indica cómo debe componerse su población autorizada; no crea métricas, fórmulas ni permisos.

| Tarea propietaria |    # | Familia canónica                                        | Decisión de composición de acceso                                                                                                                              |
| ----------------- | ---: | ------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `DATA-DOM-009`    |    1 | ventas netas y brutas                                   | El conjunto se limita a hechos comerciales autorizados por territorio/finalidad; un consolidado no puede incluir sedes excluidas ni convertir venta en margen. |
| `DATA-DOM-009`    |    2 | pedidos y conversión                                    | Numerador y denominador deben provenir de poblaciones autorizadas equivalentes; no se calcula conversión con universo más amplio que el permitido al actor.    |
| `DATA-DOM-009`    |    3 | ticket y unidades                                       | Transacciones y unidades se filtran antes de agregar; no se exponen líneas o clientes no autorizados mediante un promedio agregado.                            |
| `DATA-DOM-009`    |    4 | mezcla por producto, categoría, canal y sede            | Cada dimensión conserva su propia autorización; segmentar por una dimensión no concede miembros excluidos de otra.                                             |
| `DATA-DOM-009`    |    5 | demanda por franja, día y temporada                     | La ventana y población autorizadas limitan la serie; la comparación histórica no amplía territorio ni finalidad.                                               |
| `DATA-DOM-009`    |    6 | disponibilidad perdida                                  | Solo usa intención/disponibilidad que el actor pueda consultar y cuyo estado permita el uso; el bloqueo analítico no se oculta por agregación.                 |
| `DATA-DOM-009`    |    7 | cancelaciones, devoluciones y descuentos                | Cada hecho permanece separado y sujeto a su recurso/territorio; consultar una familia no concede los expedientes o motivos sensibles subyacentes.              |
| `DATA-DOM-009`    |    8 | promociones y efecto incremental                        | Exposición, promoción y resultado se autorizan por sus fuentes; finalidad analítica no equivale a finalidad de marketing ni permite actuar sobre campañas.     |
| `DATA-DOM-009`    |    9 | recurrencia y frecuencia                                | La identidad de cliente y la finalidad deben estar autorizadas; un agregado no autoriza drill-down individual, que queda bajo DATA-AUTH-002.                   |
| `DATA-DOM-009`    |   10 | margen relacionado                                      | Consume resultados NUMERA únicamente dentro del alcance económico permitido; permiso comercial no concede detalle financiero por implicación.                  |
| `DATA-DOM-009`    |   11 | capacidad comercial no utilizada                        | Capacidad y venta pueden provenir de dominios distintos; el resultado usa la intersección de ambos conjuntos autorizados.                                      |
| `DATA-DOM-010`    |    1 | existencia disponible y comprometida                    | Existencia, compromiso, cuarentena y tránsito se limitan a LOC/sedes autorizadas; stock agregado no puede revelar ubicaciones excluidas.                       |
| `DATA-DOM-010`    |    2 | cobertura y días de inventario                          | Inventario y consumo/demanda se autorizan de forma independiente y se intersectan antes del cálculo.                                                           |
| `DATA-DOM-010`    |    3 | rotación y permanencia                                  | Lotes/cohortes y existencias se limitan al territorio autorizado; historia no concede acceso permanente a ubicaciones retiradas del alcance actual.            |
| `DATA-DOM-010`    |    4 | faltantes y quiebres                                    | Necesidad y disponibilidad deben estar autorizadas; el actor no recibe detalle de demanda o stock fuera de su ámbito por observar un quiebre.                  |
| `DATA-DOM-010`    |    5 | vencimiento, daño y pérdida                             | Hechos de pérdida se filtran por recurso y territorio; causa, evidencia o detalle sensible pueden requerir protección adicional de DATA-AUTH-002.              |
| `DATA-DOM-010`    |    6 | diferencias de conteo                                   | Conteo y ajuste se consultan solo para LOC autorizadas; la diferencia agregada no revela conteos de otra sede.                                                 |
| `DATA-DOM-010`    |    7 | cumplimiento de remisiones                              | Origen, ruta, destino y estado se resuelven según el recurso; una relación con un lado no concede el otro cuando el contrato exija ambos.                      |
| `DATA-DOM-010`    |    8 | lead time y cumplimiento de proveedores                 | Proveedor, orden y recepción se consumen bajo finalidades compatibles; permiso de inventario no concede expediente comercial del proveedor.                    |
| `DATA-DOM-010`    |    9 | compras urgentes                                        | La clasificación de urgencia no amplía el acceso al documento de compra, proveedor o importes.                                                                 |
| `DATA-DOM-010`    |   10 | consumo versus plan                                     | Plan y consumo deben compartir una población autorizada; si uno contiene sedes excluidas, no se usa para comparar.                                             |
| `DATA-DOM-010`    |   11 | costo de inventario                                     | Inventario y valoración financiera se intersectan; lectura de stock no concede costos y lectura financiera no concede movimientos operativos no autorizados.   |
| `DATA-DOM-010`    |   12 | capacidad de almacenamiento                             | Capacidad y ocupación se limitan a instalaciones/LOC autorizadas; un total organizacional solo incluye miembros cubiertos por el alcance concedido.            |
| `DATA-DOM-011`    |    1 | demanda planificada versus producción                   | Plan y producción se filtran por producto/sede/periodo autorizados; ninguna capa analítica amplía acceso a órdenes o necesidades fuente.                       |
| `DATA-DOM-011`    |    2 | capacidad disponible y utilizada                        | Recursos y resultados productivos se autorizan antes del cálculo; capacidad de otra sede no puede inferirse mediante el agregado.                              |
| `DATA-DOM-011`    |    3 | adherencia al programa                                  | Programa y ejecución se consumen por versión y alcance autorizados; consultar KPI no concede editar programación.                                              |
| `DATA-DOM-011`    |    4 | rendimiento teórico y real                              | Receta/versión y lote real conservan autoridades separadas; se usa solo la intersección autorizada.                                                            |
| `DATA-DOM-011`    |    5 | consumo estándar y real                                 | Estándar y consumo real se autorizan por receta/ingrediente/lote/sede; costos o proveedores relacionados no se heredan.                                        |
| `DATA-DOM-011`    |    6 | merma, reproceso y aprovechamiento                      | Hechos y categorías se limitan al proceso/producto/sede autorizados; detalle de causa o responsables puede tener protección adicional.                         |
| `DATA-DOM-011`    |    7 | calidad, retención y rechazo                            | El acceso al resultado de calidad no concede automáticamente evidencia, documentos o datos personales asociados.                                               |
| `DATA-DOM-011`    |    8 | tiempo de ciclo                                         | Hitos de proceso se filtran por orden/lote/sede autorizados; la secuencia agregada no expone recursos fuera del alcance.                                       |
| `DATA-DOM-011`    |    9 | cumplimiento de liberación                              | Liberación y producción terminada conservan recursos/estados separados; solo se muestra lo que la capacidad exacta permita.                                    |
| `DATA-DOM-011`    |   10 | costo y variación por lote, producto y sede             | Producción y NUMERA se intersectan por lote/producto/sede autorizados; acceso productivo no implica autoridad financiera.                                      |
| `DATA-DOM-012`    |    1 | cumplimiento de promesa                                 | Promesa aceptada y resultado se limitan a pedidos/clientes/territorios autorizados; la métrica no concede el expediente completo.                              |
| `DATA-DOM-012`    |    2 | tiempos de preparación, despacho y entrega              | Cada fase conserva su proceso y territorio; un consumidor transversal recibe solo las fases que su capacidad/finalidad cubra.                                  |
| `DATA-DOM-012`    |    3 | pedidos completos                                       | Cabecera, líneas, sustituciones y revisiones se filtran por el mismo conjunto autorizado antes de determinar completitud.                                      |
| `DATA-DOM-012`    |    4 | reclamos y tiempo de resolución                         | El agregado puede ser visible sin detalle de caso; acceso a reclamos individuales y contenido queda sujeto a DATA-AUTH-002.                                    |
| `DATA-DOM-012`    |    5 | compensaciones                                          | Tipo, importe y beneficiario permanecen protegidos por sus dominios; la familia analítica no concede datos financieros o personales por asociación.            |
| `DATA-DOM-012`    |    6 | satisfacción y feedback                                 | Feedback interno y reputación externa conservan finalidades distintas; una autorización no se reutiliza automáticamente entre ambas.                           |
| `DATA-DOM-012`    |    7 | recurrencia, frecuencia y abandono                      | La población de clientes exige finalidad compatible y autorización; segmentos pequeños/detalle pertenecen a DATA-AUTH-002.                                     |
| `DATA-DOM-012`    |    8 | adquisición y activación                                | Origen y evento de activación se consumen solo cuando están gobernados; finalidad analítica no concede uso de marketing posterior.                             |
| `DATA-DOM-012`    |    9 | fidelización, puntos y redenciones                      | Cuenta, ledger, movimiento y redención se autorizan separadamente; un saldo agregado no concede movimientos individuales.                                      |
| `DATA-DOM-012`    |   10 | reputación y temas recurrentes                          | Fuentes internas/externas conservan contrato y finalidad; no se presume acceso a una fuente pública o externa inexistente/no gobernada.                        |
| `DATA-DOM-012`    |   11 | reservas, no-show y utilización                         | Reserva, capacidad y resultado se intersectan por alcance; detalle de cliente no se deriva del KPI de utilización.                                             |
| `DATA-DOM-012`    |   12 | valor y rentabilidad del cliente cuando esté autorizado | Exige simultáneamente finalidad/identidad de cliente autorizadas y resultado económico autorizado; si una frontera falla, no se produce el cruce.              |
| `DATA-DOM-013`    |    1 | costos estándar y reales                                | Costos se consultan por centro/producto/sede/periodo autorizados; estándar y real no amplían mutuamente su población.                                          |
| `DATA-DOM-013`    |    2 | variaciones                                             | La base de comparación y el real deben estar autorizados; una variación no revela automáticamente los componentes restringidos que la explican.                |
| `DATA-DOM-013`    |    3 | margen y contribución                                   | Ingreso y costos se intersectan por alcance; acceso a ventas no concede costos ni viceversa.                                                                   |
| `DATA-DOM-013`    |    4 | gastos                                                  | Gasto se limita por centro, entidad, sede, periodo y finalidad aplicables; estado/documento subyacente conserva controles propios.                             |
| `DATA-DOM-013`    |    5 | centros de costo                                        | El centro es dimensión; consultarlo no concede todos los hechos clasificados en él y el detalle se filtra por los hechos autorizados.                          |
| `DATA-DOM-013`    |    6 | presupuesto y forecast                                  | Versiones y escenarios se autorizan separadamente del real; una comparación no convierte un escenario en dato operativo ni amplía cobertura.                   |
| `DATA-DOM-013`    |    7 | caja, bancos y tesorería                                | La posición económica exige capacidad financiera explícita; territorio comercial u operativo no concede saldos bancarios.                                      |
| `DATA-DOM-013`    |    8 | cartera y obligaciones                                  | Contrapartes, documentos, aplicaciones y saldos conservan fronteras; un KPI agregado no concede expedientes de terceros.                                       |
| `DATA-DOM-013`    |    9 | rentabilidad multidimensional                           | Cada dimensión del resultado conserva autorización y la población se construye solo con intersecciones válidas; no se filtra únicamente en cliente.            |
| `DATA-DOM-013`    |   10 | escenarios y simulaciones                               | El escenario conserva audiencia/finalidad autorizadas y nunca amplía acceso a datos fuente por estar simulado.                                                 |

**Reconciliación:** `11 + 12 + 10 + 12 + 10 = 55`; 55 esperadas; 55 materializadas; 0 faltantes; 0 duplicadas.

#### 16. Reglas transversales para las 55 familias

- Una familia puede consumir varios dominios, pero el resultado solo usa datos que cada dominio puede exponer al mismo actor para la finalidad solicitada.
- Un permiso sobre el dominio que presenta el dashboard no sustituye permisos sobre fuentes restringidas que alimentan el resultado.
- Cuando una métrica derivada solo necesita un agregado autorizado de otro dominio, el contrato técnico futuro podrá exponer ese agregado sin entregar detalle; la autoridad sigue siendo del dominio fuente.
- La capa semántica no consulta un universo más amplio y luego aplica seguridad únicamente en la visualización.
- Una dimensión compartida no ensancha por sí sola la población de hechos; segmenta el conjunto ya autorizado.
- Una comparación entre sedes o periodos requiere que el actor tenga autoridad sobre cada miembro mostrado y que DATA-AUTH-002 permita la comparación cuando exista sensibilidad o riesgo de inferencia.
- Un resultado bloqueado por falta de fuente, denominador o calidad continúa bloqueado aunque el actor tenga acceso a otras familias relacionadas.

#### 17. Matriz materializada de autorización para las seis familias de artefacto D008

|    # | Familia          | Regla A001                                                                                                                                                                        | Frontera posterior                                                                                          |
| ---: | ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
|    1 | tablero          | El servidor construye primero el conjunto autorizado y luego agrega/segmenta. Filtros del usuario solo reducen ese conjunto; no lo amplían.                                       | Detalle y poblaciones pequeñas se gobiernan en DATA-AUTH-002.                                               |
|    2 | reporte          | La edición conserva el mismo alcance de datos autorizado para su generación. Ser destinatario de un reporte previo no concede acceso permanente a la fuente o a nuevas ediciones. | Protección de contenido sensible y redistribución específica queda en DATA-AUTH-002/003.                    |
|    3 | exportación      | La exportación no puede contener más entidades, territorios, periodos o campos que el conjunto autorizado de origen.                                                              | DATA-AUTH-002 define protección específica de exportaciones; DATA-AUTH-003 separa la capacidad de exportar. |
|    4 | suscripción      | Cada entrega reevalúa autorización, finalidad y alcance vigentes; una suscripción creada en el pasado no congela permisos ni territorio.                                          | DATA-AUTH-004 audita la entrega; DATA-AUTH-002 protege contenido sensible.                                  |
|    5 | alerta           | La señal solo puede revelar la información mínima autorizada. Una alerta sobre un territorio excluido no se vuelve visible por ser automática.                                    | Detalle, destinatarios sensibles y acciones derivadas conservan sus contratos propios.                      |
|    6 | snapshot oficial | La publicación histórica conserva su corte, pero el consumidor actual debe estar autorizado para conocerla; la publicación original no crea un derecho perpetuo de acceso.        | Restatement e historia siguen D017; detalle/exportación siguen DATA-AUTH-002.                               |

**Reconciliación:** 6 esperadas; 6 materializadas; 0 faltantes; 0 duplicadas.

#### 18. Agregación, consultas, filtros, paginación y caché

- La consulta de origen debe aplicar las fronteras de autorización antes de devolver miembros o agregados al consumidor.
- Paginación y ordenamiento operan sobre el conjunto autorizado o mediante una consulta equivalente; nunca se pagina primero un conjunto no autorizado para filtrarlo después.
- Búsqueda y filtros enviados por cliente reducen el conjunto; no pueden añadir territorios, entidades, campos o finalidades.
- Los totales, conteos, min/max, distribuciones y metadatos pueden revelar información y por ello se calculan sobre miembros autorizados.
- Un caché o materialización deberá estar particionado/versionado de forma suficiente para no servir a un actor un resultado construido con una población más amplia que su autorización.
- Un identificador de caché, dashboard o snapshot no es un recurso suficiente si el contrato no puede reconstruir la población/territorio que contiene.
- El hecho de que dos usuarios reciban el mismo número no demuestra que su conjunto autorizado sea idéntico.
- Una consulta técnica con service role o privilegio de backend conserva la autorización empresarial del actor/proceso; service role no es bypass.

#### 19. Cruces entre dominios

Un análisis transversal debe declarar qué fuentes y dominios participan. Para una misma finalidad:

```text
CONJUNTO RESULTANTE
=
RELACIONES VÁLIDAS
∩ POBLACIÓN AUTORIZADA EN DOMINIO A
∩ POBLACIÓN AUTORIZADA EN DOMINIO B
∩ ...
∩ TERRITORIO AUTORIZADO
∩ FINALIDAD COMPATIBLE
```

- La intersección no exige que todos los dominios expongan el mismo detalle; puede consumirse un agregado o contrato mínimo autorizado.
- Si una relación necesaria entre identidades no puede resolverse, no se adivina por nombre, correo, producto, código o texto normalizado.
- Un crosswalk externo faltante bloquea la unión que dependa de él; no se amplía la población por similitud.
- Una dimensión organizacional compartida no es prueba de que las filas de todos los dominios pertenezcan al mismo conjunto autorizado.
- La capa analítica no se convierte en broker de permisos entre aplicaciones.

#### 20. Historia, snapshots, correcciones y restatements

- Consultar una edición histórica exige autorización vigente del actor para conocer ese recurso/resultado histórico; haber recibido una edición anterior no crea un derecho permanente.
- El territorio histórico se resuelve con las relaciones y vigencias que correspondan al hecho/publicación cuando usar el territorio actual reescribiría el pasado.
- Una corrección o restatement no puede revelar a un actor un territorio o entidad que no podía consultar por la finalidad actual.
- La publicación original y la reexpresión permanecen recursos distinguibles; el acceso a una no se infiere automáticamente desde la otra si la política cambió materialmente.
- La comparación original vs reexpresado queda sujeta a DATA-AUTH-002 cuando la diferencia pueda revelar información sensible o poblaciones pequeñas.
- La reproducibilidad D017 no obliga a conservar acceso de un actor cuyo permiso, relación, finalidad o alcance ya no son vigentes.

#### 21. Propietario, steward, certificador y autoridad del actor

| Función               | Lo que gobierna                                                  | Lo que no obtiene por el cargo                                         |
| --------------------- | ---------------------------------------------------------------- | ---------------------------------------------------------------------- |
| propietario funcional | semántica, reglas y decisión empresarial sobre el dato           | permiso técnico automático para consultar o modificar toda instancia   |
| steward               | metadatos, calidad, triage y correcciones dentro de delegación   | acceso irrestricto, certificación o administración fuera de delegación |
| custodio técnico      | infraestructura, almacenamiento, disponibilidad y soporte        | autoridad empresarial o derecho de usar el contenido                   |
| certificador          | decisión de certificación dentro del contrato D007/A003          | propiedad del dato, publicación o acceso universal                     |
| publicador            | emisión de artefactos cuando A003 lo autorice                    | definición de métrica, certificación o acceso a más detalle            |
| actor consumidor      | uso exacto concedido por capacidad, recurso, alcance y finalidad | propiedad, administración, exportación o drill-down no concedidos      |

#### 22. Service role, procesos técnicos, BI e inteligencia artificial

- `service_role` es privilegio técnico y no autorización empresarial.
- Un job o proceso autónomo debe tener identidad/allowlist técnica, finalidad, fuentes y alcance explícitos; no actúa como usuario omnisciente.
- Una herramienta BI consume únicamente modelos o contratos que preserven las mismas fronteras de dominio, entidad, territorio y finalidad.
- Una hoja de cálculo o exportación no se reutiliza como fuente para ampliar el conjunto autorizado.
- Un modelo analítico o IA no recibe datos adicionales por necesitar más variables; cualquier ampliación de población o finalidad requiere nueva decisión.
- Las reglas específicas de herramientas externas, modelos e IA permanecen en DATA-INT-004 y su auditoría en DATA-AUTH-004.

#### 23. Handoffs con propietario documental exacto

| Decisión o materialización fuera del alcance                                                               | Propietario documental                              | Condición de salida                                                                   |
| ---------------------------------------------------------------------------------------------------------- | --------------------------------------------------- | ------------------------------------------------------------------------------------- |
| campos sensibles, minimización fina, poblaciones pequeñas, comparaciones, exportaciones y drill-down       | `DATA-AUTH-002`                                     | antes de exponer detalle, comparar poblaciones sensibles, exportar o navegar al hecho |
| separar definición, certificación, publicación, fijación de metas, anotación, exportación y administración | `DATA-AUTH-003`                                     | antes de conceder capacidades administrativas o de publicación DATA                   |
| auditar consultas, descargas, suscripciones, alertas, modelos y recomendaciones                            | `DATA-AUTH-004`                                     | antes de habilitar trazabilidad operativa de consumo analítico                        |
| experiencia ejecutiva, catálogo, tableros, calidad, investigación, objetivos y reportes                    | `DATA-UX-001` a `DATA-UX-008`                       | antes de implementar superficies de consumo y decisión                                |
| contratos de eventos/lectura y filtro de fuentes compartidas                                               | `DATA-INT-001`                                      | antes de servir datos productivos entre dominios                                      |
| capa semántica física, modelos, consultas, caché y snapshots con enforcement server-side                   | `DATA-INT-002`                                      | antes de materializar el conjunto autorizado en servicios/modelos compartidos         |
| crosswalks e identidades externas                                                                          | `DATA-INT-003`                                      | antes de unir fuentes que dependan de correspondencias externas                       |
| BI, hojas, modelos externos e inteligencia artificial                                                      | `DATA-INT-004`                                      | antes de integrar consumidores analíticos externos                                    |
| clasificación, finalidad, fundamento, consentimiento y gobierno de información                             | BLOQUE AA / tareas `INFO-*` propietarias            | antes de usar información bajo una finalidad o tratamiento que lo requiera            |
| RLS, RPC, grants, modelos físicos y enforcement en Supabase                                                | E3/BLOQUE R y paquetes de implementación aplicables | después de aprobar diseño y dentro del paquete físico autorizado                      |

No queda una decisión material de DATA-AUTH-001 diferida sin propietario documental y condición de salida.

#### 24. Cobertura de requisitos de prueba vigente

La conducta que DATA-AUTH-001 materializa ya está protegida por requisitos canónicos vigentes:

- `TREQ-DATA-001` conserva autoridad, fuente, identidad, historia y fronteras de maestros compartidos;
- `TREQ-DATA-002` exige identidad/versionado/contexto común de métricas y prohíbe fórmulas locales competidoras;
- `TREQ-DATA-004` protege explícitamente tableros, reportes, alertas, exportaciones y suscripciones y asigna responsabilidades a las tareas DATA-AUTH;
- `TREQ-AUTH-001` exige capacidad, contexto y alcance canónicos y prohíbe autorización por listas locales de roles;
- `TREQ-AUTH-004` exige decisiones equivalentes entre evaluadores para el mismo principal, actor, permiso y contexto;
- `TREQ-AUTH-009` protege la resolución determinista de sede/área y la denegación de cruces territoriales no autorizados.

A001 especializa estas reglas para consumo de maestros y analítica. No cambia su regla protegida, prioridad, modalidad, estado, relaciones ni destino de implementación.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa documentalmente la autorización de datos maestros y analítica usando comportamientos ya protegidos por requisitos canónicos vigentes de datos, alcance, territorio, recursos y decisión de autorización. No introduce una capacidad ejecutable nueva, no crea un permiso, no cambia el contrato físico de autorización y no implementa acceso, RLS, RPC, exportación, drill-down ni auditoría.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

#### 25. Criterios de aceptación

1. dominio, aplicación, tabla y consumidor permanecen conceptos distintos;
2. propietario, steward, custodio y actor autorizado permanecen funciones distintas;
3. permiso, alcance, territorio y finalidad permanecen condiciones independientes;
4. la autorización final no se deriva del nombre de rol;
5. global conserva la capacidad exacta y no se convierte en wildcard de datos;
6. el territorio se resuelve desde el recurso/hecho y no desde sede seleccionada o parámetro libre;
7. un recurso territorial no resoluble falla de forma cerrada;
8. un recurso legítimamente organizacional no recibe una sede inventada;
9. la finalidad se deriva del proceso/caso/acción y no de conveniencia técnica;
10. una finalidad no crea permiso y un permiso no autoriza finalidades incompatibles;
11. un cambio material de finalidad exige nueva evaluación;
12. la finalidad puede reducir población, periodo, precisión y volumen;
13. la fuente propietaria no concede acceso automático a todos los actores de la aplicación;
14. una aplicación consumidora no adquiere autoridad por poseer una copia;
15. un identificador enviado por cliente localiza pero no autoriza;
16. el conjunto autorizado se construye en servidor antes de agregación;
17. filtros del consumidor solo reducen el conjunto autorizado;
18. paginación, búsqueda y ordenamiento no anteceden una frontera de seguridad de forma que revelen miembros excluidos;
19. totales y conteos se calculan únicamente con miembros autorizados;
20. no se permite inferir territorios excluidos mediante total menos subtotal u otras combinaciones;
21. los cruces de dominio usan intersección de poblaciones autorizadas y relaciones válidas;
22. una dimensión compartida no amplía la población de hechos;
23. un crosswalk ausente no se sustituye por similitud;
24. la capa semántica no se convierte en broker de permisos;
25. service role no es autorización empresarial;
26. BI, hojas, modelos o IA no amplían población ni finalidad;
27. se materializan exactamente 62 objetos de D002/D003;
28. la reconciliación de objetos es 62/62, 43 maestros, 19 referencias, 0 faltantes y 0 duplicados;
29. los tres objetos AURA permanecen BLOQUEADO y no reciben fuente operativa inventada;
30. cada uno de los 62 objetos contiene una decisión explícita de entidad, territorio y finalidad;
31. se preservan exactamente 14 metric_key de asistencia;
32. la reconciliación de métricas es 14/14, 0 faltantes y 0 duplicados;
33. se preservan 11 estados NO EVALUADO y 3 BLOQUEADO;
34. calidad/certificación no concede ni revoca por sí sola la autorización;
35. un resultado BLOQUEADO no se presenta como oficial por tener acceso;
36. una investigación autorizada sobre un bloqueo no se convierte en bypass general;
37. se materializan exactamente 55 familias analíticas;
38. la distribución de familias conserva 11 + 12 + 10 + 12 + 10 = 55;
39. cada familia define cómo compone su población autorizada sin crear una métrica o permiso;
40. acceso comercial no concede finanzas por implicación;
41. acceso productivo no concede costos por implicación;
42. acceso de inventario no concede expediente comercial de proveedor por implicación;
43. acceso a KPI de cliente no concede detalle personal por implicación;
44. se materializan exactamente seis familias de artefacto D008;
45. un tablero se calcula sobre el conjunto autorizado antes de presentar resultados;
46. un reporte previo no concede acceso perpetuo a su fuente;
47. una exportación no puede ampliar el conjunto de origen;
48. una suscripción reevalúa autorización en cada entrega;
49. una alerta automática no revela un territorio excluido;
50. un snapshot histórico exige autorización vigente para su consulta;
51. la publicación histórica no crea derecho permanente de acceso;
52. restatements y correcciones históricas conservan D017 sin reescribir autoridad pasada;
53. la autorización actual no inserta retroactivamente un actor en una publicación histórica;
54. la comparación original/reexpresado conserva la protección específica de DATA-AUTH-002;
55. acceso al maestro no concede hechos relacionados;
56. acceso a métrica no concede drill-down;
57. acceso a agregado no concede cada sujeto subyacente;
58. campos sensibles, poblaciones pequeñas, comparaciones, exportaciones y drill-down permanecen en DATA-AUTH-002;
59. definición, certificación, publicación, metas, anotación, exportación y administración permanecen segregadas para DATA-AUTH-003;
60. consultas, descargas, suscripciones, alertas, modelos y recomendaciones permanecen bajo auditoría de DATA-AUTH-004;
61. no se crea ni modifica ningún requisito de prueba;
62. no se crea o asigna ningún permiso;
63. no se modifica código, DDL, DML, RLS, RPC, grants, datos, migraciones, backfills, despliegues o Supabase;
64. `DATA-AUTH-002` permanece únicamente reservada.

#### 26. Continuidad

ÚLTIMA TAREA APROBADA
`DATA-DOM-017 — Definir versionado de métricas, restatements, correcciones históricas y reproducibilidad`

TAREA ACTUAL APROBADA
`DATA-AUTH-001 — Proteger datos maestros, métricas, reportes y análisis por dominio, entidad, territorio y finalidad`

SIGUIENTE TAREA RESERVADA
`DATA-AUTH-002 — Proteger información sensible, poblaciones pequeñas, comparaciones, exportaciones y drill-down`


### ✅ DATA-AUTH-002 — Proteger información sensible, poblaciones pequeñas, comparaciones, exportaciones y drill-down

**Estado:** APROBADA
**Tarea anterior:** `DATA-AUTH-001 — Proteger datos maestros, métricas, reportes y análisis por dominio, entidad, territorio y finalidad` — APROBADA
**Tarea siguiente:** `DATA-AUTH-003 — Separar definición, certificación, publicación, fijación de metas, anotación, exportación y administración` — RESERVADA
**Tipo de tarea:** documental; contrato canónico y materializado de protección de divulgación analítica por clasificación efectiva, proyección de campos, riesgo de inferencia, población, comparación, exportación y nivel de detalle
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, DDL, DML, migraciones, RLS, RPC, grants, cambios de permisos, cambios de datos, backfills, despliegues o cambios en Supabase:** no autorizados
**Requisitos de prueba creados o modificados:** 0

#### 1. Propósito

Definir cómo Vento OS limita **qué contenido puede revelarse** después de que `DATA-AUTH-001` ya haya construido el conjunto autorizado. La tarea separa autorización de población y autorización de divulgación: un actor puede estar autorizado a consultar un conjunto y, aun así, no estar autorizado a conocer todos sus campos, su precisión, una comparación, una celda pequeña, una exportación o el siguiente nivel de detalle.

La protección aplica a datos maestros, métricas, tableros, reportes, comparaciones, alertas, suscripciones, snapshots y demás resultados analíticos. No crea permisos, no asigna capacidades a roles o personas, no habilita exportaciones, no publica métricas y no implementa controles físicos. `DATA-AUTH-003` conserva la segregación de capacidades; `DATA-AUTH-004` conserva auditoría y trazabilidad operativa.

#### 2. Resultado sustantivo

Queda materializado un contrato de protección de divulgación con los siguientes resultados:

- autorización de conjunto y autorización de divulgación quedan separadas y ambas son obligatorias;
- cada campo o derivado consume clasificación efectiva `S0_PUBLIC` a `S4_HIGHLY_RESTRICTED`, finalidad y política de campos;
- se definen seis modos de exposición: exacto, enmascarado, generalizado, agregado, suprimido y denegado;
- una representación enmascarada, seudonimizada o agregada no se denomina anónima sin evaluación documentada de reidentificación;
- no se adopta un número universal como sinónimo de “población segura”; la seguridad depende también de identificabilidad, cuasi-identificadores, precisión, complementos, consultas sucesivas y contexto;
- todo agregado sensible que necesite distinguir poblaciones pequeñas exige una regla de divulgación versionada; si esa regla no puede resolverse, el resultado sensible se suprime;
- se exige supresión complementaria cuando total, subtotal, porcentaje, diferencia, ranking o serie temporal permitan reconstruir una celda protegida;
- toda comparación debe autorizar y proteger de forma independiente cada población, denominador, benchmark y componente;
- la exportación solo puede materializar la proyección ya autorizada y protegida o una proyección detallada autorizada de forma independiente;
- cada salto de drill-down se trata como una nueva solicitud y nunca hereda detalle desde un agregado;
- quedan materializadas decisiones para **62 de 62 objetos**, **14 de 14 métricas**, **55 de 55 familias analíticas** y **6 de 6 familias de artefacto** heredadas de `DATA-AUTH-001`;
- se preservan los **3 objetos AURA `BLOQUEADO`** y las **3 métricas `BLOQUEADO`** sin elevar su estado;
- no se crea, modifica, difiere, descarta u obsoleta ningún requisito `TREQ-*`.

#### 3. Fuentes y decisiones heredadas

La tarea consume sin redefinir:

- `DATA-AUTH-001` para el conjunto autorizado, las 62 identidades maestras/de referencia, las 14 métricas de asistencia, las 55 familias analíticas y las seis familias de artefacto;
- `DATA-DOM-002` y `DATA-DOM-003` para identidad, clase y fronteras de los 62 objetos;
- `DATA-DOM-004` y `DATA-DOM-005` para identidad/versionado de métricas, grano, dimensiones, ruta de drill-down y reglas de comparación;
- `DATA-DOM-008` a `DATA-DOM-013` para artefactos y familias analíticas;
- `DATA-DOM-017` para historia, correcciones y restatements;
- `INFO-AUTH-001` para clasificación, finalidad, identidad/actor, relación, recurso, territorio, estado y política de campos;
- `INFO-AUTH-002` para autorización diferenciada de salidas, población/campos mínimos, destinatario/destino, vigencia y control de copias;
- `NFR-REQ-005` para clasificación `S0_PUBLIC` a `S4_HIGHLY_RESTRICTED`, minimización, no exposición indirecta, celdas pequeñas, reidentificación y límites de drill-down;
- el contrato canónico de recurso para colecciones, agregados, campos protegidos, filtros, inferencia y construcción server-side;
- los requisitos vigentes `TREQ-DATA-002`, `TREQ-DATA-004`, `TREQ-SHELL-011`, `TREQ-AUTH-001`, `TREQ-AUTH-006`, `TREQ-AUTH-013`, `TREQ-AUTH-017`, `TREQ-AUTH-018`, `TREQ-SUPABASE-004`, `TREQ-SUPABASE-013` y `TREQ-INTEGRATION-021`.

#### 4. Fronteras conceptuales obligatorias

```text
AUTORIZACIÓN DEL CONJUNTO ≠ AUTORIZACIÓN DE CADA CAMPO
AUTORIZACIÓN DE CADA CAMPO ≠ AUTORIZACIÓN DE EXPORTACIÓN
AGREGADO ≠ ANÓNIMO ≠ SEGURO POR DEFINICIÓN
ENMASCARAMIENTO ≠ ANONIMIZACIÓN
OMITIR IDENTIFICADOR DIRECTO ≠ IMPOSIBILIDAD DE REIDENTIFICAR
TAMAÑO DE POBLACIÓN ≠ ÚNICO CRITERIO DE DIVULGACIÓN
TOTAL AUTORIZADO ≠ DERECHO A RECONSTRUIR SUBGRUPOS EXCLUIDOS
COMPARACIÓN AUTORIZADA ≠ DETALLE AUTORIZADO
RUTA DE DRILL-DOWN ≠ PERMISO DE DRILL-DOWN
CAMPO OCULTO EN UI ≠ CAMPO PROTEGIDO
EXPORTACIÓN ≠ COPIA MÁS AMPLIA DEL MODELO INTERNO
REPORTE HISTÓRICO ≠ DERECHO PERPETUO A SU DETALLE
```

#### 5. Contrato `DATA-DISCLOSURE-PROTECTION-CONTRACT-001`

Después de formar el conjunto autorizado de `DATA-AUTH-001`, toda salida analítica deberá resolver como mínimo:

| Dimensión                | Decisión obligatoria                                                                                               | Si no puede resolverse                                              |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------- |
| conjunto autorizado      | población resultante de capacidad, actor, recurso, territorio, finalidad, estado y denegaciones                    | no calcular ni revelar un conjunto más amplio                       |
| clasificación efectiva   | clase vigente del campo, combinación o derivado                                                                    | aplicar la protección más restrictiva y no asumir baja sensibilidad |
| política de campos       | campos, precisión, representación y atributos auxiliares permitidos                                                | omitir o denegar el campo                                           |
| finalidad de divulgación | uso concreto del resultado, no solo finalidad de lectura de la fuente                                              | bloquear reutilización incompatible                                 |
| identificabilidad        | identificadores directos, cuasi-identificadores y combinación de dimensiones                                       | generalizar, suprimir o denegar                                     |
| regla de población       | regla de divulgación aplicable a la población/celda sensible                                                       | suprimir la celda o desglose sensible                               |
| riesgo de reconstrucción | totales, complementos, porcentajes, diferencias, rankings y consultas sucesivas                                    | aplicar supresión complementaria o bloquear la comparación          |
| comparación              | poblaciones, versiones, periodos, denominadores y benchmark autorizados/comparables                                | no producir la comparación                                          |
| artefacto/canal          | tablero, reporte, exportación, alerta, suscripción, snapshot u otro destino                                        | aplicar el canal más restrictivo o no producir salida               |
| nivel de detalle         | nivel actual y nivel solicitado en la ruta de drill-down                                                           | detener navegación y no revelar la existencia del detalle protegido |
| historia/versiones       | corte, snapshot, versión de métrica, corrección o restatement                                                      | bloquear el resultado que dependa de una versión no resoluble       |
| frescura de decisión     | actor, finalidad, clasificación, campos, población, recurso, destinatario y versión vigentes al momento del efecto | reautorizar o denegar                                               |

La decisión de divulgación **solo puede restringir** el conjunto autorizado. Nunca agrega filas, campos, territorios, finalidades, sujetos o capacidades.

#### 6. Modos canónicos de exposición

| Modo documental | Uso                                                                                                | Regla                                                                                               |
| --------------- | -------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `EXACTO`        | valor o detalle completo necesario                                                                 | solo si la política de campos y la finalidad exigen el valor exacto y la autoridad cubre el recurso |
| `ENMASCARADO`   | ocultar parte del valor sin eliminar su sensibilidad                                               | no cambia clasificación ni habilita usos nuevos                                                     |
| `GENERALIZADO`  | reducir precisión temporal, geográfica, numérica o categórica                                      | se usa cuando la precisión exacta incrementa inferencia y la finalidad admite menor detalle         |
| `AGREGADO`      | resultado sobre múltiples miembros autorizados                                                     | requiere evaluación de población, inferencia y componentes; no concede miembros                     |
| `SUPRIMIDO`     | celda, campo, etiqueta, conteo, porcentaje o detalle no revelable dentro de un artefacto permitido | no se sustituye por cero, null, error distintivo o metadato que permita reconstrucción              |
| `DENEGADO`      | el artefacto, acción o nivel de detalle no puede producirse                                        | no se degrada silenciosamente a otra finalidad o conjunto                                           |

La precedencia es de mayor protección: `DENEGADO` > `SUPRIMIDO` > `GENERALIZADO`/`ENMASCARADO` > `AGREGADO` > `EXACTO`. Una fuente más sensible, un join, una combinación de dimensiones o un derivado puede elevar la protección aunque cada campo aislado parezca inocuo.

#### 7. Protección por clasificación efectiva

| Clase                  | Decisión A002                                                                                                                                                                                                                                      |
| ---------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `S0_PUBLIC`            | Solo la proyección publicada, aprobada y vigente puede exponerse como pública. Fuente, borrador, historial y metadatos relacionados conservan su propia clase.                                                                                     |
| `S1_INTERNAL`          | Proyección mínima interna. El tamaño por sí solo no obliga a suprimir una celda no identificable, pero una combinación que eleve sensibilidad hereda la protección superior.                                                                       |
| `S2_CONFIDENTIAL`      | Identificadores, términos, relaciones y segmentos se minimizan. Todo desglose potencialmente identificable requiere regla de divulgación resoluble; sin ella se generaliza o suprime.                                                              |
| `S3_RESTRICTED`        | Analítica y comparación operan con proyección mínima y protección reforzada. El detalle individual o financiero no se deriva de un agregado y toda salida detallada exige autoridad exacta.                                                        |
| `S4_HIGHLY_RESTRICTED` | No existe exposición analítica general por defecto. El detalle solo puede existir dentro de un caso/finalidad y autorización específicos; un agregado exige regla de divulgación explícita y evaluación de reidentificación, o se suprime/deniega. |

Una clasificación desconocida, contradictoria o no resoluble no se interpreta como `S0` o `S1`. La salida adopta la protección más restrictiva compatible con la evidencia disponible y falla cerrada cuando la acción exige resolver la clase.

#### 8. Regla materializada para poblaciones pequeñas e inferencia

Vento OS **no adopta un único número corporativo como prueba suficiente de seguridad**. Una población grande puede ser reidentificable por combinación de sede, cargo, fecha, turno, producto, caso o evento; una población pequeña no puede hacerse segura únicamente ocultando el nombre.

Todo agregado `S2`, `S3`, `S4` o cualquier derivado con riesgo de identificación deberá resolver una regla de divulgación versionada que declare como mínimo:

- identidad de la regla y versión;
- finalidad y familia/métrica a la que aplica;
- dimensiones y precisiones permitidas;
- criterio mínimo de población cuando el producto use uno;
- cuasi-identificadores que no pueden combinarse por debajo del nivel seguro;
- tratamiento de numerador, denominador, porcentaje, ranking y percentil;
- supresión primaria y complementaria;
- protección frente a diferencias entre total y subtotal;
- protección frente a consultas sucesivas que aíslen miembros;
- tratamiento de comparación, exportación y drill-down;
- versión de clasificación y política de campos usada para la decisión.

Reglas obligatorias:

1. si un agregado sensible necesita una regla de divulgación y la regla no existe, está vencida, es incompatible o no puede resolverse, la celda o desglose se marca `SUPRIMIDO`;
2. no se muestra el conteo exacto de una celda suprimida mediante tooltip, etiqueta, paginación, mensaje de error, API auxiliar, exportación o metadato;
3. si un total y las demás celdas permiten calcular una celda suprimida, se suprime adicionalmente la cantidad mínima necesaria de componentes para impedir la reconstrucción;
4. porcentajes, tasas y promedios se protegen junto con numerador, denominador y componentes capaces de revelar la población;
5. filtros temporales, territoriales o categóricos no pueden aplicarse repetidamente para aislar un único miembro o un grupo protegido;
6. cambiar precisión, agrupar categorías o ampliar periodo es una reducción permitida cuando conserva utilidad y elimina la inferencia;
7. `0`, ausencia, `null`, error, “sin datos” y “no aplica” no se intercambian para ocultar una celda; cada estado conserva su semántica sin revelar información prohibida;
8. un actor con acceso individual explícito a todos los miembros para la misma finalidad puede usar una vista operacional necesaria sin que el umbral analítico cree o quite autoridad; esa excepción no convierte la vista en comparación, exportación o divulgación general;
9. un agregado no se denomina anónimo solo por superar una regla de población;
10. no se introduce en esta tarea ruido aleatorio, privacidad diferencial u otro algoritmo estadístico no aprobado por una tarea propietaria.

#### 9. Comparaciones, rankings, benchmarks y deltas

Toda comparación exige que **cada lado** sea autorizable y divulgable de forma independiente.

- dos sedes, periodos, cohortes o segmentos solo se comparan si ambos conjuntos están dentro del alcance del actor y satisfacen su propia protección;
- una población autorizada no se usa como total para derivar por resta una población excluida;
- un benchmark organizacional no puede incluir miembros fuera de autoridad si su comparación permite deducirlos;
- ranking, top/bottom, percentil, participación y cuota se tratan como comparaciones y no como simples etiquetas;
- si una celda base está suprimida, también se suprime delta, porcentaje, ranking o explicación que la reconstruya;
- comparar periodos consecutivos no puede revelar la incorporación, salida o evento de una sola persona o entidad protegida mediante el cambio observado;
- una comparación entre versión original y restatement conserva autorización actual, corte histórico, clasificación y protección de inferencia;
- una diferencia estadística no se presenta como causalidad y no modifica la separación ya definida por `DATA-DOM-014` a `DATA-DOM-016`.

#### 10. Exportaciones

`DATA-AUTH-002` define **qué contenido puede salir**; `DATA-AUTH-003` conserva la decisión de **quién posee la capacidad de exportar**. Esta tarea no habilita esa capacidad.

Reglas:

1. el conjunto exportable se construye del lado servidor a partir del conjunto autorizado y después aplica exactamente la protección de campos, población e inferencia correspondiente;
2. una exportación de la vista protegida no incluye columnas ocultas, claves de join, identificadores auxiliares, campos usados solo para cálculo ni precisión superior a la presentada;
3. una exportación detallada exige autorización independiente para el detalle y para la acción de exportar; la capacidad de lectura no se convierte en copia masiva;
4. una celda `SUPRIMIDO` permanece suprimida en archivos tabulares, impresos, payloads, snapshots y representaciones alternativas;
5. cambiar CSV, XLSX, PDF, JSON, imagen u otro formato no modifica clasificación ni autoridad;
6. la exportación conserva versión de métrica, periodo, filtros, dimensiones, fecha de corte, cobertura, calidad y versión de la regla de divulgación aplicable;
7. una exportación histórica se reautoriza al generarse; una copia anterior no concede una nueva exportación ni detalle adicional;
8. una herramienta cliente no reconstruye una exportación completa desde datos más amplios ocultando columnas después.

#### 11. Drill-down y navegación al detalle

La ruta de drill-down definida por una métrica expresa **hasta dónde existe semánticamente un detalle posible**. No expresa hasta dónde puede navegar un actor concreto.

En cada salto se reevalúan: capacidad exacta; actor; recurso; dominio; territorio; finalidad; relación; campos; clasificación; población; estado; versión; y regla de divulgación.

- un KPI autorizado no concede filas fuente;
- un agregado autorizado no concede sujetos subyacentes;
- un tooltip, modal, fila expandida, deep link, búsqueda o endpoint de detalle se trata como un nuevo nivel de divulgación;
- una celda suprimida no puede tener un drill-down funcional que revele el conjunto que la originó;
- un resultado `S3` o `S4` no navega a personas por permiso agregado; el actor necesita autoridad directa sobre el sujeto/recurso para la misma finalidad;
- en cruces de dominio se vuelve a intersectar la autorización de cada fuente;
- un identificador conocido no permite saltar directamente a un nivel que la navegación normal habría bloqueado;
- caché, historial del navegador o estado cliente no conservan un detalle después de cambio de actor, finalidad, alcance, clasificación o autorización.

#### 12. Metadatos y canales indirectos

La protección cubre también elementos que pueden revelar información sin mostrar la fila fuente:

- conteos de paginación y “N resultados”;
- min/max, distribuciones, percentiles y cardinalidades;
- tooltips, labels, leyendas y texto alternativo;
- nombres de archivos, títulos de reportes y URLs;
- búsqueda, autocomplete, sugerencias y filtros disponibles;
- mensajes de error y diferencias entre “no existe” y “no autorizado”;
- tiempos o respuestas diferenciadas cuando revelen existencia de un recurso;
- logs, analytics, trazas y payloads de soporte;
- metadatos de exportación, cache keys y snapshots;
- alertas y notificaciones que revelen una condición de una población excluida.

Un canal indirecto consume la misma clasificación y finalidad que el dato que podría revelar. No existe una excepción por ser “solo metadata”.

#### 13. Matriz materializada para los 62 objetos maestros y de referencia

|    # | Objeto canónico               | Clase heredada    | Perfil A002              | Decisión de protección                                                                                                                                                                                                                                                                                       | Estado heredado |
| ---: | ----------------------------- | ----------------- | ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------- |
|    1 | `ORGANIZATION_SCOPE`          | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | La identidad maestra no implica exposición de todos sus atributos. Se aplican proyección mínima, clasificación efectiva y protección de inferencia; una segmentación confidencial sin regla de divulgación se suprime y el detalle se reautoriza al navegar o exportar.                                      | `ESPECIFICADO`  |
|    2 | `LEGAL_SUBJECT`               | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | La identidad maestra no implica exposición de todos sus atributos. Se aplican proyección mínima, clasificación efectiva y protección de inferencia; una segmentación confidencial sin regla de divulgación se suprime y el detalle se reautoriza al navegar o exportar.                                      | `ESPECIFICADO`  |
|    3 | `BRAND`                       | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | La identidad maestra no implica exposición de todos sus atributos. Se aplican proyección mínima, clasificación efectiva y protección de inferencia; una segmentación confidencial sin regla de divulgación se suprime y el detalle se reautoriza al navegar o exportar.                                      | `ESPECIFICADO`  |
|    4 | `COMMERCIAL_ESTABLISHMENT`    | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | La identidad maestra no implica exposición de todos sus atributos. Se aplican proyección mínima, clasificación efectiva y protección de inferencia; una segmentación confidencial sin regla de divulgación se suprime y el detalle se reautoriza al navegar o exportar.                                      | `ESPECIFICADO`  |
|    5 | `BUSINESS_LINE`               | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | La identidad maestra no implica exposición de todos sus atributos. Se aplican proyección mínima, clasificación efectiva y protección de inferencia; una segmentación confidencial sin regla de divulgación se suprime y el detalle se reautoriza al navegar o exportar.                                      | `ESPECIFICADO`  |
|    6 | `PHYSICAL_FACILITY`           | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | La identidad maestra no implica exposición de todos sus atributos. Se aplican proyección mínima, clasificación efectiva y protección de inferencia; una segmentación confidencial sin regla de divulgación se suprime y el detalle se reautoriza al navegar o exportar.                                      | `ESPECIFICADO`  |
|    7 | `OPERATIONAL_SITE`            | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | La identidad maestra no implica exposición de todos sus atributos. Se aplican proyección mínima, clasificación efectiva y protección de inferencia; una segmentación confidencial sin regla de divulgación se suprime y el detalle se reautoriza al navegar o exportar.                                      | `ESPECIFICADO`  |
|    8 | `ORGANIZATIONAL_AREA`         | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | La identidad maestra no implica exposición de todos sus atributos. Se aplican proyección mínima, clasificación efectiva y protección de inferencia; una segmentación confidencial sin regla de divulgación se suprime y el detalle se reautoriza al navegar o exportar.                                      | `ESPECIFICADO`  |
|    9 | `PHYSICAL_ZONE`               | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | La identidad maestra no implica exposición de todos sus atributos. Se aplican proyección mínima, clasificación efectiva y protección de inferencia; una segmentación confidencial sin regla de divulgación se suprime y el detalle se reautoriza al navegar o exportar.                                      | `ESPECIFICADO`  |
|   10 | `WORKSTATION`                 | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | La identidad maestra no implica exposición de todos sus atributos. Se aplican proyección mínima, clasificación efectiva y protección de inferencia; una segmentación confidencial sin regla de divulgación se suprime y el detalle se reautoriza al navegar o exportar.                                      | `ESPECIFICADO`  |
|   11 | `EXTERNAL_OPERATIONAL_POINT`  | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | La identidad maestra no implica exposición de todos sus atributos. Se aplican proyección mínima, clasificación efectiva y protección de inferencia; una segmentación confidencial sin regla de divulgación se suprime y el detalle se reautoriza al navegar o exportar.                                      | `ESPECIFICADO`  |
|   12 | `PERSON_IDENTITY`             | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | Identificadores y cuasi-identificadores se minimizan por finalidad. El detalle individual exige relación y capacidad exactas; un agregado no concede personas. Toda segmentación sensible sin regla de divulgación resoluble se suprime, y exportación o drill-down reevalúan campos, población y finalidad. | `ESPECIFICADO`  |
|   13 | `WORKER_PROFILE`              | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | Identificadores y cuasi-identificadores se minimizan por finalidad. El detalle individual exige relación y capacidad exactas; un agregado no concede personas. Toda segmentación sensible sin regla de divulgación resoluble se suprime, y exportación o drill-down reevalúan campos, población y finalidad. | `ESPECIFICADO`  |
|   14 | `EMPLOYMENT_RELATIONSHIP`     | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | Identificadores y cuasi-identificadores se minimizan por finalidad. El detalle individual exige relación y capacidad exactas; un agregado no concede personas. Toda segmentación sensible sin regla de divulgación resoluble se suprime, y exportación o drill-down reevalúan campos, población y finalidad. | `ESPECIFICADO`  |
|   15 | `CONTRACTUAL_POSITION`        | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | La referencia puede consumirse solo dentro de la capacidad y finalidad aplicables. No concede hechos ni sujetos relacionados; si un atributo, combinación o derivado eleva sensibilidad, prevalece la política de campos y divulgación más restrictiva.                                                      | `ESPECIFICADO`  |
|   16 | `BASE_ROLE`                   | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | La referencia puede consumirse solo dentro de la capacidad y finalidad aplicables. No concede hechos ni sujetos relacionados; si un atributo, combinación o derivado eleva sensibilidad, prevalece la política de campos y divulgación más restrictiva.                                                      | `ESPECIFICADO`  |
|   17 | `OPERATIONAL_ROLE`            | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | La referencia puede consumirse solo dentro de la capacidad y finalidad aplicables. No concede hechos ni sujetos relacionados; si un atributo, combinación o derivado eleva sensibilidad, prevalece la política de campos y divulgación más restrictiva.                                                      | `ESPECIFICADO`  |
|   18 | `WORK_ASSIGNMENT`             | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | Identificadores y cuasi-identificadores se minimizan por finalidad. El detalle individual exige relación y capacidad exactas; un agregado no concede personas. Toda segmentación sensible sin regla de divulgación resoluble se suprime, y exportación o drill-down reevalúan campos, población y finalidad. | `ESPECIFICADO`  |
|   19 | `CUSTOMER_PERSON`             | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | Identificadores y cuasi-identificadores se minimizan por finalidad. El detalle individual exige relación y capacidad exactas; un agregado no concede personas. Toda segmentación sensible sin regla de divulgación resoluble se suprime, y exportación o drill-down reevalúan campos, población y finalidad. | `ESPECIFICADO`  |
|   20 | `CUSTOMER_CONTACT`            | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | Identificadores y cuasi-identificadores se minimizan por finalidad. El detalle individual exige relación y capacidad exactas; un agregado no concede personas. Toda segmentación sensible sin regla de divulgación resoluble se suprime, y exportación o drill-down reevalúan campos, población y finalidad. | `ESPECIFICADO`  |
|   21 | `CUSTOMER_RELATIONSHIP`       | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | Identificadores y cuasi-identificadores se minimizan por finalidad. El detalle individual exige relación y capacidad exactas; un agregado no concede personas. Toda segmentación sensible sin regla de divulgación resoluble se suprime, y exportación o drill-down reevalúan campos, población y finalidad. | `ESPECIFICADO`  |
|   22 | `CUSTOMER_PROFILE`            | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | Identificadores y cuasi-identificadores se minimizan por finalidad. El detalle individual exige relación y capacidad exactas; un agregado no concede personas. Toda segmentación sensible sin regla de divulgación resoluble se suprime, y exportación o drill-down reevalúan campos, población y finalidad. | `ESPECIFICADO`  |
|   23 | `CUSTOMER_PREFERENCE`         | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | Identificadores y cuasi-identificadores se minimizan por finalidad. El detalle individual exige relación y capacidad exactas; un agregado no concede personas. Toda segmentación sensible sin regla de divulgación resoluble se suprime, y exportación o drill-down reevalúan campos, población y finalidad. | `ESPECIFICADO`  |
|   24 | `LOYALTY_ACCOUNT`             | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | Identificadores y cuasi-identificadores se minimizan por finalidad. El detalle individual exige relación y capacidad exactas; un agregado no concede personas. Toda segmentación sensible sin regla de divulgación resoluble se suprime, y exportación o drill-down reevalúan campos, población y finalidad. | `ESPECIFICADO`  |
|   25 | `LOYALTY_PROGRAM_RULE`        | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | La referencia puede consumirse solo dentro de la capacidad y finalidad aplicables. No concede hechos ni sujetos relacionados; si un atributo, combinación o derivado eleva sensibilidad, prevalece la política de campos y divulgación más restrictiva.                                                      | `ESPECIFICADO`  |
|   26 | `PRODUCTO_MAESTRO`            | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | La identidad maestra no implica exposición de todos sus atributos. Se aplican proyección mínima, clasificación efectiva y protección de inferencia; una segmentación confidencial sin regla de divulgación se suprime y el detalle se reautoriza al navegar o exportar.                                      | `ESPECIFICADO`  |
|   27 | `VARIANTE`                    | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | La identidad maestra no implica exposición de todos sus atributos. Se aplican proyección mínima, clasificación efectiva y protección de inferencia; una segmentación confidencial sin regla de divulgación se suprime y el detalle se reautoriza al navegar o exportar.                                      | `ESPECIFICADO`  |
|   28 | `PRESENTACION`                | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | La identidad maestra no implica exposición de todos sus atributos. Se aplican proyección mínima, clasificación efectiva y protección de inferencia; una segmentación confidencial sin regla de divulgación se suprime y el detalle se reautoriza al navegar o exportar.                                      | `ESPECIFICADO`  |
|   29 | `UNIDAD_DE_MEDIDA`            | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | La referencia puede consumirse solo dentro de la capacidad y finalidad aplicables. No concede hechos ni sujetos relacionados; si un atributo, combinación o derivado eleva sensibilidad, prevalece la política de campos y divulgación más restrictiva.                                                      | `ESPECIFICADO`  |
|   30 | `TAXONOMIA_TIPO_MAESTRO`      | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | La referencia puede consumirse solo dentro de la capacidad y finalidad aplicables. No concede hechos ni sujetos relacionados; si un atributo, combinación o derivado eleva sensibilidad, prevalece la política de campos y divulgación más restrictiva.                                                      | `ESPECIFICADO`  |
|   31 | `TAXONOMIA_INVENTARIO`        | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | La referencia puede consumirse solo dentro de la capacidad y finalidad aplicables. No concede hechos ni sujetos relacionados; si un atributo, combinación o derivado eleva sensibilidad, prevalece la política de campos y divulgación más restrictiva.                                                      | `ESPECIFICADO`  |
|   32 | `TAXONOMIA_OPERACIONAL`       | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | La referencia puede consumirse solo dentro de la capacidad y finalidad aplicables. No concede hechos ni sujetos relacionados; si un atributo, combinación o derivado eleva sensibilidad, prevalece la política de campos y divulgación más restrictiva.                                                      | `ESPECIFICADO`  |
|   33 | `LOC`                         | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | La identidad maestra no implica exposición de todos sus atributos. Se aplican proyección mínima, clasificación efectiva y protección de inferencia; una segmentación confidencial sin regla de divulgación se suprime y el detalle se reautoriza al navegar o exportar.                                      | `ESPECIFICADO`  |
|   34 | `ACTIVO_FISICO`               | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | La identidad maestra no implica exposición de todos sus atributos. Se aplican proyección mínima, clasificación efectiva y protección de inferencia; una segmentación confidencial sin regla de divulgación se suprime y el detalle se reautoriza al navegar o exportar.                                      | `ESPECIFICADO`  |
|   35 | `CLASE_DE_ACTIVO`             | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | La referencia puede consumirse solo dentro de la capacidad y finalidad aplicables. No concede hechos ni sujetos relacionados; si un atributo, combinación o derivado eleva sensibilidad, prevalece la política de campos y divulgación más restrictiva.                                                      | `ESPECIFICADO`  |
|   36 | `ESPECIFICACION_PRODUCTO`     | `DATO_MAESTRO`    | `COMERCIAL_CONFIDENCIAL` | Términos comerciales, conocimiento propietario y atributos de relación se exponen por proyección mínima. Comparaciones no pueden revelar condiciones de una contraparte o fórmula excluida; exportación y drill-down conservan autorización diferenciada.                                                    | `ESPECIFICADO`  |
|   37 | `PROVEEDOR`                   | `DATO_MAESTRO`    | `COMERCIAL_CONFIDENCIAL` | Términos comerciales, conocimiento propietario y atributos de relación se exponen por proyección mínima. Comparaciones no pueden revelar condiciones de una contraparte o fórmula excluida; exportación y drill-down conservan autorización diferenciada.                                                    | `ESPECIFICADO`  |
|   38 | `CONTACTO_PROVEEDOR`          | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | Identificadores y cuasi-identificadores se minimizan por finalidad. El detalle individual exige relación y capacidad exactas; un agregado no concede personas. Toda segmentación sensible sin regla de divulgación resoluble se suprime, y exportación o drill-down reevalúan campos, población y finalidad. | `ESPECIFICADO`  |
|   39 | `RELACION_PRODUCTO_PROVEEDOR` | `DATO_MAESTRO`    | `COMERCIAL_CONFIDENCIAL` | Términos comerciales, conocimiento propietario y atributos de relación se exponen por proyección mínima. Comparaciones no pueden revelar condiciones de una contraparte o fórmula excluida; exportación y drill-down conservan autorización diferenciada.                                                    | `ESPECIFICADO`  |
|   40 | `CONDICION_COMERCIAL`         | `DATO_MAESTRO`    | `FINANCIERO_RESTRINGIDO` | Importes, saldos, condiciones y dimensiones económicas conservan protección por campo. Comparaciones y agregados no pueden reconstruir valores excluidos; una salida detallada exige autoridad específica y la exportación nunca hereda permiso de la vista.                                                 | `ESPECIFICADO`  |
|   41 | `TAXONOMIA_COMPRA`            | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | La referencia puede consumirse solo dentro de la capacidad y finalidad aplicables. No concede hechos ni sujetos relacionados; si un atributo, combinación o derivado eleva sensibilidad, prevalece la política de campos y divulgación más restrictiva.                                                      | `ESPECIFICADO`  |
|   42 | `RECETA`                      | `DATO_MAESTRO`    | `COMERCIAL_CONFIDENCIAL` | Términos comerciales, conocimiento propietario y atributos de relación se exponen por proyección mínima. Comparaciones no pueden revelar condiciones de una contraparte o fórmula excluida; exportación y drill-down conservan autorización diferenciada.                                                    | `ESPECIFICADO`  |
|   43 | `FAMILIA_PRODUCTIVA`          | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | La referencia puede consumirse solo dentro de la capacidad y finalidad aplicables. No concede hechos ni sujetos relacionados; si un atributo, combinación o derivado eleva sensibilidad, prevalece la política de campos y divulgación más restrictiva.                                                      | `ESPECIFICADO`  |
|   44 | `RUTA_PRODUCTIVA`             | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | La identidad maestra no implica exposición de todos sus atributos. Se aplican proyección mínima, clasificación efectiva y protección de inferencia; una segmentación confidencial sin regla de divulgación se suprime y el detalle se reautoriza al navegar o exportar.                                      | `ESPECIFICADO`  |
|   45 | `RECURSO_PRODUCTIVO`          | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | La identidad maestra no implica exposición de todos sus atributos. Se aplican proyección mínima, clasificación efectiva y protección de inferencia; una segmentación confidencial sin regla de divulgación se suprime y el detalle se reautoriza al navegar o exportar.                                      | `ESPECIFICADO`  |
|   46 | `COMMERCIAL_CHANNEL`          | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | La referencia puede consumirse solo dentro de la capacidad y finalidad aplicables. No concede hechos ni sujetos relacionados; si un atributo, combinación o derivado eleva sensibilidad, prevalece la política de campos y divulgación más restrictiva.                                                      | `ESPECIFICADO`  |
|   47 | `CATEGORIA_COMERCIAL`         | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | La referencia puede consumirse solo dentro de la capacidad y finalidad aplicables. No concede hechos ni sujetos relacionados; si un atributo, combinación o derivado eleva sensibilidad, prevalece la política de campos y divulgación más restrictiva.                                                      | `ESPECIFICADO`  |
|   48 | `OFERTA_COMERCIAL`            | `DATO_MAESTRO`    | `COMERCIAL_CONFIDENCIAL` | Términos comerciales, conocimiento propietario y atributos de relación se exponen por proyección mínima. Comparaciones no pueden revelar condiciones de una contraparte o fórmula excluida; exportación y drill-down conservan autorización diferenciada.                                                    | `ESPECIFICADO`  |
|   49 | `CENTRO_DE_COSTO`             | `DATO_MAESTRO`    | `FINANCIERO_RESTRINGIDO` | Importes, saldos, condiciones y dimensiones económicas conservan protección por campo. Comparaciones y agregados no pueden reconstruir valores excluidos; una salida detallada exige autoridad específica y la exportación nunca hereda permiso de la vista.                                                 | `ESPECIFICADO`  |
|   50 | `MONEDA`                      | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | La referencia puede consumirse solo dentro de la capacidad y finalidad aplicables. No concede hechos ni sujetos relacionados; si un atributo, combinación o derivado eleva sensibilidad, prevalece la política de campos y divulgación más restrictiva.                                                      | `ESPECIFICADO`  |
|   51 | `PERIODO_ECONOMICO`           | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | La referencia puede consumirse solo dentro de la capacidad y finalidad aplicables. No concede hechos ni sujetos relacionados; si un atributo, combinación o derivado eleva sensibilidad, prevalece la política de campos y divulgación más restrictiva.                                                      | `ESPECIFICADO`  |
|   52 | `PERIODO_CONTABLE`            | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | La referencia puede consumirse solo dentro de la capacidad y finalidad aplicables. No concede hechos ni sujetos relacionados; si un atributo, combinación o derivado eleva sensibilidad, prevalece la política de campos y divulgación más restrictiva.                                                      | `ESPECIFICADO`  |
|   53 | `PERIODO_FISCAL`              | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | La referencia puede consumirse solo dentro de la capacidad y finalidad aplicables. No concede hechos ni sujetos relacionados; si un atributo, combinación o derivado eleva sensibilidad, prevalece la política de campos y divulgación más restrictiva.                                                      | `ESPECIFICADO`  |
|   54 | `CLASIFICACION_ECONOMICA`     | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | La referencia puede consumirse solo dentro de la capacidad y finalidad aplicables. No concede hechos ni sujetos relacionados; si un atributo, combinación o derivado eleva sensibilidad, prevalece la política de campos y divulgación más restrictiva.                                                      | `ESPECIFICADO`  |
|   55 | `PERFIL_DE_MARCA`             | `DATO_MAESTRO`    | `BLOQUEADO`              | Permanece `BLOQUEADO`; no se inventa fuente, población ni proyección. Comparación, exportación y drill-down permanecen bloqueados mientras el objeto no tenga fuente y contrato operativos aprobados.                                                                                                        | `BLOQUEADO`     |
|   56 | `AUDIENCIA`                   | `DATO_MAESTRO`    | `BLOQUEADO`              | Permanece `BLOQUEADO`; no se inventa fuente, población ni proyección. Comparación, exportación y drill-down permanecen bloqueados mientras el objeto no tenga fuente y contrato operativos aprobados.                                                                                                        | `BLOQUEADO`     |
|   57 | `ACTIVO_DE_MARCA`             | `DATO_MAESTRO`    | `BLOQUEADO`              | Permanece `BLOQUEADO`; no se inventa fuente, población ni proyección. Comparación, exportación y drill-down permanecen bloqueados mientras el objeto no tenga fuente y contrato operativos aprobados.                                                                                                        | `BLOQUEADO`     |
|   58 | `ENDPOINT`                    | `DATO_MAESTRO`    | `TECNICO_SENSIBLE`       | Identidades técnicas se minimizan y secretos, credenciales, tokens o material equivalente quedan fuera de superficies analíticas. Topología, configuración y metadatos no se revelan por errores, conteos o exportaciones; el detalle exige capacidad técnica exacta.                                        | `ESPECIFICADO`  |
|   59 | `SHARED_DEVICE`               | `DATO_MAESTRO`    | `TECNICO_SENSIBLE`       | Identidades técnicas se minimizan y secretos, credenciales, tokens o material equivalente quedan fuera de superficies analíticas. Topología, configuración y metadatos no se revelan por errores, conteos o exportaciones; el detalle exige capacidad técnica exacta.                                        | `ESPECIFICADO`  |
|   60 | `NETWORK_RESOURCE`            | `DATO_MAESTRO`    | `TECNICO_SENSIBLE`       | Identidades técnicas se minimizan y secretos, credenciales, tokens o material equivalente quedan fuera de superficies analíticas. Topología, configuración y metadatos no se revelan por errores, conteos o exportaciones; el detalle exige capacidad técnica exacta.                                        | `ESPECIFICADO`  |
|   61 | `APPLICATION`                 | `DATO_MAESTRO`    | `TECNICO_SENSIBLE`       | Identidades técnicas se minimizan y secretos, credenciales, tokens o material equivalente quedan fuera de superficies analíticas. Topología, configuración y metadatos no se revelan por errores, conteos o exportaciones; el detalle exige capacidad técnica exacta.                                        | `ESPECIFICADO`  |
|   62 | `TECH_SERVICE`                | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | La referencia puede consumirse solo dentro de la capacidad y finalidad aplicables. No concede hechos ni sujetos relacionados; si un atributo, combinación o derivado eleva sensibilidad, prevalece la política de campos y divulgación más restrictiva.                                                      | `ESPECIFICADO`  |

**Reconciliación:** 62 esperados; 62 materializados; 43 `DATO_MAESTRO`; 19 `DATO_REFERENCIA`; 0 faltantes; 0 duplicados; 3 objetos AURA `BLOQUEADO`.

#### 14. Reglas globales de la matriz de 62 objetos

- El perfil A002 no reemplaza la clasificación `S0`–`S4`; es una regla de exposición que obliga a resolver la clasificación real de cada campo o derivado.
- Un dato de referencia no se vuelve público por ser referencia y no concede los hechos que lo usan.
- Un objeto con relación personal no puede exponerse de forma masiva por una capacidad de consulta de un solo recurso.
- Un maestro operativo puede adquirir sensibilidad por custodio, ubicación, precio, condición, responsable, incidente o relación.
- Los objetos AURA bloqueados permanecen sin población analítica, comparación, exportación o drill-down inventados.
- La clasificación o protección más restrictiva de un campo prevalece sobre el perfil general de la fila.

#### 15. Matriz materializada para las 14 métricas de asistencia

|    # | `metric_key`        | Estado DQ heredado | Decisión A002                                                                                                                                                                                                                                                                                                   |
| ---: | ------------------- | ------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | `scheduledShifts`   | `NO EVALUADO`      | La programación puede revelar patrón laboral y disponibilidad individual. Vista individual solo con relación/capacidad exactas; vista agregada o comparativa sensible requiere regla de divulgación resoluble, supresión complementaria y reautorización de exportación/drill-down.                             |
|    2 | `attendedShifts`    | `NO EVALUADO`      | El resultado de asistencia puede revelar conducta laboral individual. Vista individual solo con relación/capacidad exactas; vista agregada o comparativa sensible requiere regla de divulgación resoluble, supresión complementaria y reautorización de exportación/drill-down.                                 |
|    3 | `restDayCount`      | `NO EVALUADO`      | El descanso agregado no habilita calendario individual ni inferencia de presencia. Vista individual solo con relación/capacidad exactas; vista agregada o comparativa sensible requiere regla de divulgación resoluble, supresión complementaria y reautorización de exportación/drill-down.                    |
|    4 | `lateCount`         | `NO EVALUADO`      | La tardanza es señal de desempeño laboral y no se usa para ranking individual por permiso agregado. Vista individual solo con relación/capacidad exactas; vista agregada o comparativa sensible requiere regla de divulgación resoluble, supresión complementaria y reautorización de exportación/drill-down.   |
|    5 | `noShowCount`       | `NO EVALUADO`      | La ausencia es señal laboral sensible y no se reconstruye por diferencias entre totales. Vista individual solo con relación/capacidad exactas; vista agregada o comparativa sensible requiere regla de divulgación resoluble, supresión complementaria y reautorización de exportación/drill-down.              |
|    6 | `openCount`         | `NO EVALUADO`      | Sesiones abiertas no exponen quién mantiene una sesión salvo acceso individual autorizado. Vista individual solo con relación/capacidad exactas; vista agregada o comparativa sensible requiere regla de divulgación resoluble, supresión complementaria y reautorización de exportación/drill-down.            |
|    7 | `missingCloseCount` | `BLOQUEADO`        | Conserva `BLOQUEADO`; ninguna protección de divulgación convierte el resultado en oficial. El bloqueo DQ se conserva. Cualquier vista por trabajador exige autorización directa; cualquier agregado, comparación o exportación sensible necesita regla de divulgación resoluble y no habilita detalle.          |
|    8 | `autoCloseCount`    | `NO EVALUADO`      | El cierre automático no habilita identificación de trabajador ni causa subyacente. Vista individual solo con relación/capacidad exactas; vista agregada o comparativa sensible requiere regla de divulgación resoluble, supresión complementaria y reautorización de exportación/drill-down.                    |
|    9 | `departureCount`    | `NO EVALUADO`      | Puede implicar ubicación o comportamiento; la precisión y el detalle se minimizan. Vista individual solo con relación/capacidad exactas; vista agregada o comparativa sensible requiere regla de divulgación resoluble, supresión complementaria y reautorización de exportación/drill-down.                    |
|   10 | `scheduledMinutes`  | `NO EVALUADO`      | Minutos programados no habilitan comparación individual de carga sin finalidad y detalle autorizados. Vista individual solo con relación/capacidad exactas; vista agregada o comparativa sensible requiere regla de divulgación resoluble, supresión complementaria y reautorización de exportación/drill-down. |
|   11 | `netMinutes`        | `NO EVALUADO`      | Minutos registrados son señal de desempeño y requieren protección de comparación e inferencia. Vista individual solo con relación/capacidad exactas; vista agregada o comparativa sensible requiere regla de divulgación resoluble, supresión complementaria y reautorización de exportación/drill-down.        |
|   12 | `incidentCount`     | `NO EVALUADO`      | Las incidencias pueden elevar sensibilidad por causa o sujeto; el detalle no se deriva del conteo. Vista individual solo con relación/capacidad exactas; vista agregada o comparativa sensible requiere regla de divulgación resoluble, supresión complementaria y reautorización de exportación/drill-down.    |
|   13 | `attendanceRate`    | `BLOQUEADO`        | Conserva `BLOQUEADO`; una tasa no se publica como oficial por superar un control de divulgación. El bloqueo DQ se conserva. Cualquier vista por trabajador exige autorización directa; cualquier agregado, comparación o exportación sensible necesita regla de divulgación resoluble y no habilita detalle.    |
|   14 | `punctualityRate`   | `BLOQUEADO`        | Conserva `BLOQUEADO`; la comparación no autoriza identificación de personas ni certifica la tasa. El bloqueo DQ se conserva. Cualquier vista por trabajador exige autorización directa; cualquier agregado, comparación o exportación sensible necesita regla de divulgación resoluble y no habilita detalle.   |

**Reconciliación:** 14 esperadas; 14 materializadas; 14 claves únicas; 0 faltantes; 0 duplicadas; 11 `NO EVALUADO`; 3 `BLOQUEADO`.

#### 16. Reglas de métricas, denominadores y precisión

- Numerador y denominador deben ser divulgables bajo la misma finalidad y no pueden usar poblaciones protegidas de forma incompatible.
- Una tasa no oculta una población pequeña si el denominador, numerador u otra métrica permite reconstruirla.
- Precisión decimal se reduce cuando una precisión mayor revele un recuento o valor subyacente que la finalidad no necesita.
- Un estado `BLOQUEADO` o `NO EVALUADO` no mejora porque el resultado sea agregado, enmascarado o comparativo.
- La comparación de trabajadores individualmente no se deriva del permiso sobre una métrica agregada.

#### 17. Matriz materializada para las 55 familias analíticas

| Tarea propietaria |    # | Familia canónica                                        | Perfil A002            | Decisión de protección                                                                                                                                                                                                                                                                                 |
| ----------------- | ---: | ------------------------------------------------------- | ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `DATA-DOM-009`    |    1 | ventas netas y brutas                                   | `COMERCIAL_OPERATIVO`  | Segmentación y comparación se calculan sobre hechos autorizados; subtotales, porcentajes y diferencias no pueden revelar sedes, clientes o transacciones excluidas. El detalle y la exportación requieren una nueva decisión.                                                                          |
| `DATA-DOM-009`    |    2 | pedidos y conversión                                    | `COMERCIAL_OPERATIVO`  | Segmentación y comparación se calculan sobre hechos autorizados; subtotales, porcentajes y diferencias no pueden revelar sedes, clientes o transacciones excluidas. El detalle y la exportación requieren una nueva decisión.                                                                          |
| `DATA-DOM-009`    |    3 | ticket y unidades                                       | `COMERCIAL_OPERATIVO`  | Segmentación y comparación se calculan sobre hechos autorizados; subtotales, porcentajes y diferencias no pueden revelar sedes, clientes o transacciones excluidas. El detalle y la exportación requieren una nueva decisión.                                                                          |
| `DATA-DOM-009`    |    4 | mezcla por producto, categoría, canal y sede            | `COMERCIAL_OPERATIVO`  | Segmentación y comparación se calculan sobre hechos autorizados; subtotales, porcentajes y diferencias no pueden revelar sedes, clientes o transacciones excluidas. El detalle y la exportación requieren una nueva decisión.                                                                          |
| `DATA-DOM-009`    |    5 | demanda por franja, día y temporada                     | `COMERCIAL_OPERATIVO`  | Segmentación y comparación se calculan sobre hechos autorizados; subtotales, porcentajes y diferencias no pueden revelar sedes, clientes o transacciones excluidas. El detalle y la exportación requieren una nueva decisión.                                                                          |
| `DATA-DOM-009`    |    6 | disponibilidad perdida                                  | `COMERCIAL_OPERATIVO`  | Segmentación y comparación se calculan sobre hechos autorizados; subtotales, porcentajes y diferencias no pueden revelar sedes, clientes o transacciones excluidas. El detalle y la exportación requieren una nueva decisión.                                                                          |
| `DATA-DOM-009`    |    7 | cancelaciones, devoluciones y descuentos                | `COMERCIAL_OPERATIVO`  | Segmentación y comparación se calculan sobre hechos autorizados; subtotales, porcentajes y diferencias no pueden revelar sedes, clientes o transacciones excluidas. El detalle y la exportación requieren una nueva decisión.                                                                          |
| `DATA-DOM-009`    |    8 | promociones y efecto incremental                        | `CLIENTE_SENSIBLE`     | La población se trata como potencialmente identificable: segmentación, cohortes, tasas y comparaciones requieren regla de divulgación vigente; sin ella se suprime el resultado sensible. El agregado no concede identidad, contacto, caso ni perfil y el drill-down no llega a personas por herencia. |
| `DATA-DOM-009`    |    9 | recurrencia y frecuencia                                | `CLIENTE_SENSIBLE`     | La población se trata como potencialmente identificable: segmentación, cohortes, tasas y comparaciones requieren regla de divulgación vigente; sin ella se suprime el resultado sensible. El agregado no concede identidad, contacto, caso ni perfil y el drill-down no llega a personas por herencia. |
| `DATA-DOM-009`    |   10 | margen relacionado                                      | `FINANCIERO`           | Importes y componentes económicos se minimizan por campo y precisión. Comparaciones, variaciones y contribuciones no pueden reconstruir componentes excluidos; drill-down y exportación detallados exigen autoridad independiente sobre la fuente financiera.                                          |
| `DATA-DOM-009`    |   11 | capacidad comercial no utilizada                        | `COMERCIAL_OPERATIVO`  | Segmentación y comparación se calculan sobre hechos autorizados; subtotales, porcentajes y diferencias no pueden revelar sedes, clientes o transacciones excluidas. El detalle y la exportación requieren una nueva decisión.                                                                          |
| `DATA-DOM-010`    |    1 | existencia disponible y comprometida                    | `INVENTARIO_OPERATIVO` | Se calcula solo sobre LOC y sedes autorizadas. Conteos, capacidad y diferencias no pueden permitir inferir ubicaciones excluidas; campos comerciales, responsables o causas sensibles elevan la protección y bloquean el drill-down implícito.                                                         |
| `DATA-DOM-010`    |    2 | cobertura y días de inventario                          | `INVENTARIO_OPERATIVO` | Se calcula solo sobre LOC y sedes autorizadas. Conteos, capacidad y diferencias no pueden permitir inferir ubicaciones excluidas; campos comerciales, responsables o causas sensibles elevan la protección y bloquean el drill-down implícito.                                                         |
| `DATA-DOM-010`    |    3 | rotación y permanencia                                  | `INVENTARIO_OPERATIVO` | Se calcula solo sobre LOC y sedes autorizadas. Conteos, capacidad y diferencias no pueden permitir inferir ubicaciones excluidas; campos comerciales, responsables o causas sensibles elevan la protección y bloquean el drill-down implícito.                                                         |
| `DATA-DOM-010`    |    4 | faltantes y quiebres                                    | `INVENTARIO_OPERATIVO` | Se calcula solo sobre LOC y sedes autorizadas. Conteos, capacidad y diferencias no pueden permitir inferir ubicaciones excluidas; campos comerciales, responsables o causas sensibles elevan la protección y bloquean el drill-down implícito.                                                         |
| `DATA-DOM-010`    |    5 | vencimiento, daño y pérdida                             | `CALIDAD_OPERATIVA`    | El agregado operativo puede elevarse a sensibilidad personal, disciplinaria o comercial por causa, evidencia o responsable. Si el desglose permite identificar sujeto o contraparte, se aplica la regla sensible y se suprime sin perfil de divulgación.                                               |
| `DATA-DOM-010`    |    6 | diferencias de conteo                                   | `CALIDAD_OPERATIVA`    | El agregado operativo puede elevarse a sensibilidad personal, disciplinaria o comercial por causa, evidencia o responsable. Si el desglose permite identificar sujeto o contraparte, se aplica la regla sensible y se suprime sin perfil de divulgación.                                               |
| `DATA-DOM-010`    |    7 | cumplimiento de remisiones                              | `INVENTARIO_OPERATIVO` | Se calcula solo sobre LOC y sedes autorizadas. Conteos, capacidad y diferencias no pueden permitir inferir ubicaciones excluidas; campos comerciales, responsables o causas sensibles elevan la protección y bloquean el drill-down implícito.                                                         |
| `DATA-DOM-010`    |    8 | lead time y cumplimiento de proveedores                 | `PROVEEDOR_COMERCIAL`  | La comparación no revela términos, evaluaciones o importes de una contraparte fuera de la autoridad exacta. Los agregados por proveedor conservan finalidad y protección comercial; detalle y exportación se reevalúan.                                                                                |
| `DATA-DOM-010`    |    9 | compras urgentes                                        | `PROVEEDOR_COMERCIAL`  | La comparación no revela términos, evaluaciones o importes de una contraparte fuera de la autoridad exacta. Los agregados por proveedor conservan finalidad y protección comercial; detalle y exportación se reevalúan.                                                                                |
| `DATA-DOM-010`    |   10 | consumo versus plan                                     | `INVENTARIO_OPERATIVO` | Se calcula solo sobre LOC y sedes autorizadas. Conteos, capacidad y diferencias no pueden permitir inferir ubicaciones excluidas; campos comerciales, responsables o causas sensibles elevan la protección y bloquean el drill-down implícito.                                                         |
| `DATA-DOM-010`    |   11 | costo de inventario                                     | `FINANCIERO`           | Importes y componentes económicos se minimizan por campo y precisión. Comparaciones, variaciones y contribuciones no pueden reconstruir componentes excluidos; drill-down y exportación detallados exigen autoridad independiente sobre la fuente financiera.                                          |
| `DATA-DOM-010`    |   12 | capacidad de almacenamiento                             | `INVENTARIO_OPERATIVO` | Se calcula solo sobre LOC y sedes autorizadas. Conteos, capacidad y diferencias no pueden permitir inferir ubicaciones excluidas; campos comerciales, responsables o causas sensibles elevan la protección y bloquean el drill-down implícito.                                                         |
| `DATA-DOM-011`    |    1 | demanda planificada versus producción                   | `PRODUCCION_OPERATIVA` | El agregado productivo se limita a productos, lotes, recursos y sedes autorizados. Fórmulas, causas, responsables y costos mantienen su clasificación propia; la segmentación que eleve sensibilidad usa supresión y reautorización.                                                                   |
| `DATA-DOM-011`    |    2 | capacidad disponible y utilizada                        | `PRODUCCION_OPERATIVA` | El agregado productivo se limita a productos, lotes, recursos y sedes autorizados. Fórmulas, causas, responsables y costos mantienen su clasificación propia; la segmentación que eleve sensibilidad usa supresión y reautorización.                                                                   |
| `DATA-DOM-011`    |    3 | adherencia al programa                                  | `PRODUCCION_OPERATIVA` | El agregado productivo se limita a productos, lotes, recursos y sedes autorizados. Fórmulas, causas, responsables y costos mantienen su clasificación propia; la segmentación que eleve sensibilidad usa supresión y reautorización.                                                                   |
| `DATA-DOM-011`    |    4 | rendimiento teórico y real                              | `PRODUCCION_OPERATIVA` | El agregado productivo se limita a productos, lotes, recursos y sedes autorizados. Fórmulas, causas, responsables y costos mantienen su clasificación propia; la segmentación que eleve sensibilidad usa supresión y reautorización.                                                                   |
| `DATA-DOM-011`    |    5 | consumo estándar y real                                 | `PRODUCCION_OPERATIVA` | El agregado productivo se limita a productos, lotes, recursos y sedes autorizados. Fórmulas, causas, responsables y costos mantienen su clasificación propia; la segmentación que eleve sensibilidad usa supresión y reautorización.                                                                   |
| `DATA-DOM-011`    |    6 | merma, reproceso y aprovechamiento                      | `CALIDAD_OPERATIVA`    | El agregado operativo puede elevarse a sensibilidad personal, disciplinaria o comercial por causa, evidencia o responsable. Si el desglose permite identificar sujeto o contraparte, se aplica la regla sensible y se suprime sin perfil de divulgación.                                               |
| `DATA-DOM-011`    |    7 | calidad, retención y rechazo                            | `CALIDAD_OPERATIVA`    | El agregado operativo puede elevarse a sensibilidad personal, disciplinaria o comercial por causa, evidencia o responsable. Si el desglose permite identificar sujeto o contraparte, se aplica la regla sensible y se suprime sin perfil de divulgación.                                               |
| `DATA-DOM-011`    |    8 | tiempo de ciclo                                         | `PRODUCCION_OPERATIVA` | El agregado productivo se limita a productos, lotes, recursos y sedes autorizados. Fórmulas, causas, responsables y costos mantienen su clasificación propia; la segmentación que eleve sensibilidad usa supresión y reautorización.                                                                   |
| `DATA-DOM-011`    |    9 | cumplimiento de liberación                              | `PRODUCCION_OPERATIVA` | El agregado productivo se limita a productos, lotes, recursos y sedes autorizados. Fórmulas, causas, responsables y costos mantienen su clasificación propia; la segmentación que eleve sensibilidad usa supresión y reautorización.                                                                   |
| `DATA-DOM-011`    |   10 | costo y variación por lote, producto y sede             | `FINANCIERO`           | Importes y componentes económicos se minimizan por campo y precisión. Comparaciones, variaciones y contribuciones no pueden reconstruir componentes excluidos; drill-down y exportación detallados exigen autoridad independiente sobre la fuente financiera.                                          |
| `DATA-DOM-012`    |    1 | cumplimiento de promesa                                 | `SERVICIO_OPERATIVO`   | El resultado operacional se limita al conjunto autorizado y no concede expediente de cliente. Cuando el desglose vincule persona, reclamo, compensación o comportamiento, prevalece la protección sensible y se bloquea la inferencia.                                                                 |
| `DATA-DOM-012`    |    2 | tiempos de preparación, despacho y entrega              | `SERVICIO_OPERATIVO`   | El resultado operacional se limita al conjunto autorizado y no concede expediente de cliente. Cuando el desglose vincule persona, reclamo, compensación o comportamiento, prevalece la protección sensible y se bloquea la inferencia.                                                                 |
| `DATA-DOM-012`    |    3 | pedidos completos                                       | `SERVICIO_OPERATIVO`   | El resultado operacional se limita al conjunto autorizado y no concede expediente de cliente. Cuando el desglose vincule persona, reclamo, compensación o comportamiento, prevalece la protección sensible y se bloquea la inferencia.                                                                 |
| `DATA-DOM-012`    |    4 | reclamos y tiempo de resolución                         | `CLIENTE_SENSIBLE`     | La población se trata como potencialmente identificable: segmentación, cohortes, tasas y comparaciones requieren regla de divulgación vigente; sin ella se suprime el resultado sensible. El agregado no concede identidad, contacto, caso ni perfil y el drill-down no llega a personas por herencia. |
| `DATA-DOM-012`    |    5 | compensaciones                                          | `CLIENTE_SENSIBLE`     | La población se trata como potencialmente identificable: segmentación, cohortes, tasas y comparaciones requieren regla de divulgación vigente; sin ella se suprime el resultado sensible. El agregado no concede identidad, contacto, caso ni perfil y el drill-down no llega a personas por herencia. |
| `DATA-DOM-012`    |    6 | satisfacción y feedback                                 | `CLIENTE_SENSIBLE`     | La población se trata como potencialmente identificable: segmentación, cohortes, tasas y comparaciones requieren regla de divulgación vigente; sin ella se suprime el resultado sensible. El agregado no concede identidad, contacto, caso ni perfil y el drill-down no llega a personas por herencia. |
| `DATA-DOM-012`    |    7 | recurrencia, frecuencia y abandono                      | `CLIENTE_SENSIBLE`     | La población se trata como potencialmente identificable: segmentación, cohortes, tasas y comparaciones requieren regla de divulgación vigente; sin ella se suprime el resultado sensible. El agregado no concede identidad, contacto, caso ni perfil y el drill-down no llega a personas por herencia. |
| `DATA-DOM-012`    |    8 | adquisición y activación                                | `CLIENTE_SENSIBLE`     | La población se trata como potencialmente identificable: segmentación, cohortes, tasas y comparaciones requieren regla de divulgación vigente; sin ella se suprime el resultado sensible. El agregado no concede identidad, contacto, caso ni perfil y el drill-down no llega a personas por herencia. |
| `DATA-DOM-012`    |    9 | fidelización, puntos y redenciones                      | `CLIENTE_SENSIBLE`     | La población se trata como potencialmente identificable: segmentación, cohortes, tasas y comparaciones requieren regla de divulgación vigente; sin ella se suprime el resultado sensible. El agregado no concede identidad, contacto, caso ni perfil y el drill-down no llega a personas por herencia. |
| `DATA-DOM-012`    |   10 | reputación y temas recurrentes                          | `CLIENTE_SENSIBLE`     | La población se trata como potencialmente identificable: segmentación, cohortes, tasas y comparaciones requieren regla de divulgación vigente; sin ella se suprime el resultado sensible. El agregado no concede identidad, contacto, caso ni perfil y el drill-down no llega a personas por herencia. |
| `DATA-DOM-012`    |   11 | reservas, no-show y utilización                         | `CLIENTE_SENSIBLE`     | La población se trata como potencialmente identificable: segmentación, cohortes, tasas y comparaciones requieren regla de divulgación vigente; sin ella se suprime el resultado sensible. El agregado no concede identidad, contacto, caso ni perfil y el drill-down no llega a personas por herencia. |
| `DATA-DOM-012`    |   12 | valor y rentabilidad del cliente cuando esté autorizado | `CLIENTE_FINANCIERO`   | Exige simultáneamente protección de cliente y financiera. Ningún agregado permite reconstruir valor o identidad individual; la comparación y la exportación usan solo la proyección protegida y el detalle requiere ambas autoridades.                                                                 |
| `DATA-DOM-013`    |    1 | costos estándar y reales                                | `FINANCIERO`           | Importes y componentes económicos se minimizan por campo y precisión. Comparaciones, variaciones y contribuciones no pueden reconstruir componentes excluidos; drill-down y exportación detallados exigen autoridad independiente sobre la fuente financiera.                                          |
| `DATA-DOM-013`    |    2 | variaciones                                             | `FINANCIERO`           | Importes y componentes económicos se minimizan por campo y precisión. Comparaciones, variaciones y contribuciones no pueden reconstruir componentes excluidos; drill-down y exportación detallados exigen autoridad independiente sobre la fuente financiera.                                          |
| `DATA-DOM-013`    |    3 | margen y contribución                                   | `FINANCIERO`           | Importes y componentes económicos se minimizan por campo y precisión. Comparaciones, variaciones y contribuciones no pueden reconstruir componentes excluidos; drill-down y exportación detallados exigen autoridad independiente sobre la fuente financiera.                                          |
| `DATA-DOM-013`    |    4 | gastos                                                  | `FINANCIERO`           | Importes y componentes económicos se minimizan por campo y precisión. Comparaciones, variaciones y contribuciones no pueden reconstruir componentes excluidos; drill-down y exportación detallados exigen autoridad independiente sobre la fuente financiera.                                          |
| `DATA-DOM-013`    |    5 | centros de costo                                        | `FINANCIERO`           | Importes y componentes económicos se minimizan por campo y precisión. Comparaciones, variaciones y contribuciones no pueden reconstruir componentes excluidos; drill-down y exportación detallados exigen autoridad independiente sobre la fuente financiera.                                          |
| `DATA-DOM-013`    |    6 | presupuesto y forecast                                  | `FINANCIERO`           | Importes y componentes económicos se minimizan por campo y precisión. Comparaciones, variaciones y contribuciones no pueden reconstruir componentes excluidos; drill-down y exportación detallados exigen autoridad independiente sobre la fuente financiera.                                          |
| `DATA-DOM-013`    |    7 | caja, bancos y tesorería                                | `FINANCIERO`           | Importes y componentes económicos se minimizan por campo y precisión. Comparaciones, variaciones y contribuciones no pueden reconstruir componentes excluidos; drill-down y exportación detallados exigen autoridad independiente sobre la fuente financiera.                                          |
| `DATA-DOM-013`    |    8 | cartera y obligaciones                                  | `FINANCIERO`           | Importes y componentes económicos se minimizan por campo y precisión. Comparaciones, variaciones y contribuciones no pueden reconstruir componentes excluidos; drill-down y exportación detallados exigen autoridad independiente sobre la fuente financiera.                                          |
| `DATA-DOM-013`    |    9 | rentabilidad multidimensional                           | `FINANCIERO`           | Importes y componentes económicos se minimizan por campo y precisión. Comparaciones, variaciones y contribuciones no pueden reconstruir componentes excluidos; drill-down y exportación detallados exigen autoridad independiente sobre la fuente financiera.                                          |
| `DATA-DOM-013`    |   10 | escenarios y simulaciones                               | `FINANCIERO`           | Importes y componentes económicos se minimizan por campo y precisión. Comparaciones, variaciones y contribuciones no pueden reconstruir componentes excluidos; drill-down y exportación detallados exigen autoridad independiente sobre la fuente financiera.                                          |

**Reconciliación:** `11 + 12 + 10 + 12 + 10 = 55`; 55 esperadas; 55 materializadas; 0 faltantes; 0 duplicadas.

#### 18. Reglas transversales para las 55 familias

- El perfil de una familia puede elevarse por dimensión, campo, join, sujeto, evidencia, importe o finalidad; nunca se degrada por pertenecer a una familia “operativa”.
- La dimensión usada para segmentar forma parte de la evaluación de inferencia. Añadir sede, franja, producto, cargo o periodo puede convertir un agregado seguro en identificable.
- Un cruce con clientes, trabajadores, proveedores, costos o incidentes conserva la protección del dominio más restrictivo.
- Si una comparación solo puede producirse ocultando un lado y mostrando el delta, el delta también se suprime.
- Una familia puede seguir siendo útil con generalización, agrupación o menor precisión sin revelar el miembro protegido.
- Ninguna familia adquiere por A002 permiso de exportación, publicación, administración o actuación empresarial.

#### 19. Matriz materializada para las seis familias de artefacto D008

|    # | Familia          | Decisión A002                                                                                                                                                                       |
| ---: | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | tablero          | Cada visual, tooltip, filtro, subtotal, comparación y detalle usa la proyección protegida. Una celda suprimida no tiene ruta lateral o de drill-down que permita reconstruirla.     |
|    2 | reporte          | La edición conserva clasificación, regla de divulgación, filtros, periodo y supresiones. Reenviar o recibir una edición no concede el detalle fuente ni una nueva finalidad.        |
|    3 | exportación      | Solo materializa la proyección protegida o un detalle autorizado de forma independiente. Campos ocultos, claves auxiliares y celdas suprimidas no reaparecen por cambio de formato. |
|    4 | suscripción      | Cada entrega reevalúa autorización, clasificación, población y regla de divulgación; una entrega previa no congela detalle ni supresiones.                                          |
|    5 | alerta           | Revela la señal mínima necesaria. No identifica una población, sede, sujeto o condición excluidos a través del texto, contador o enlace de la alerta.                               |
|    6 | snapshot oficial | Conserva la protección y versión de divulgación del corte; la consulta actual reevalúa autoridad y una comparación con otro snapshot aplica nuevamente inferencia y supresión.      |

**Reconciliación:** 6 esperadas; 6 materializadas; 0 faltantes; 0 duplicadas.

#### 20. Caché, materializaciones, historia y restatements

- Una caché o materialización no puede servir una proyección más amplia que la autorización y la regla de divulgación actuales del consumidor.
- El identificador de caché deberá distinguir al menos las dimensiones necesarias para impedir mezcla entre poblaciones, finalidades, versiones y perfiles de divulgación incompatibles; la forma física queda para `DATA-INT-002`.
- Cambiar clasificación, finalidad, política de campos, autorización o regla de divulgación invalida cualquier resultado que ya no sea seguro para el mismo uso.
- Un snapshot conserva su corte y versión semántica, pero el actor actual no obtiene por ello derecho a conocer detalle retirado de su autoridad.
- Original y restatement pueden compararse solo si ambos lados pasan autorización y protección actuales; la diferencia se suprime cuando permita inferir una corrección sensible o una población protegida.

#### 21. BI, hojas, modelos e inteligencia artificial

- Una herramienta BI recibe la proyección protegida, no un universo amplio para aplicar seguridad solo en la visualización.
- Una hoja o archivo derivado no se convierte en fuente autorizante para retirar supresiones o reidentificar sujetos.
- Un modelo o IA no recibe campos, sujetos o precisión adicionales por necesitar variables; la entrada debe respetar la misma finalidad, clasificación y regla de divulgación.
- Features, embeddings, prompts, resultados y explicaciones pueden adquirir sensibilidad por inferencia y se reevalúan como derivados.
- Integraciones analíticas externas conservan la frontera de `DATA-INT-004` y la auditoría de `DATA-AUTH-004`.

#### 22. Handoffs con propietario documental exacto

| Decisión o materialización fuera del alcance                                                                       | Propietario documental                                                  | Condición de salida                                                    |
| ------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| quién recibe capacidades de definición, certificación, publicación, metas, anotación, exportación o administración | `DATA-AUTH-003`                                                         | antes de asignar o habilitar cualquiera de esas capacidades            |
| auditoría de consultas, exportaciones, suscripciones, alertas, modelos y recomendaciones                           | `DATA-AUTH-004`                                                         | antes de considerar trazable el consumo analítico en operación         |
| experiencia de supresión, mensajes, estados de protección, navegación y detalle                                    | `DATA-UX-001` a `DATA-UX-008`                                           | antes de implementar superficies analíticas                            |
| aplicación física de proyección, supresión, comparación, caché y drill-down server-side                            | `DATA-INT-002`                                                          | antes de materializar modelos, consultas o capa semántica productiva   |
| consumidores BI, hojas, modelos externos e IA                                                                      | `DATA-INT-004`                                                          | antes de integrar consumidores externos                                |
| clasificación, finalidad, campos, compartición y salida de información                                             | `INFO-AUTH-001` a `INFO-AUTH-004`                                       | en toda salida que trate información gobernada por BLOQUE AA           |
| enforcement físico RLS/RPC/servicios y cualquier cambio de Supabase                                                | E3/BLOQUE R y paquetes de implementación aplicables desde `vento-shell` | solo cuando la fase de implementación correspondiente quede autorizada |

No queda una decisión material de `DATA-AUTH-002` diferida sin propietario documental y condición de salida.

#### 23. Cobertura de requisitos de prueba vigente

La conducta materializada por esta tarea ya está protegida por requisitos canónicos vigentes y por el contrato no funcional de privacidad:

- `TREQ-DATA-002` exige que toda métrica registre ruta de drill-down y reglas de comparación, evitando definiciones locales divergentes;
- `TREQ-DATA-004` exige artefactos distinguibles, divulgación progresiva y drill-down autorizado, con versión, filtros, dimensiones, cobertura y estado de calidad;
- `TREQ-SHELL-011` exige acción exacta, finalidad, clasificación, recurso, relación, territorio, estado y destinatario para consulta o salida de información y prohíbe filtración por búsqueda, URL y metadatos;
- `TREQ-AUTH-006` protege proyección mínima y exposición masiva; `TREQ-AUTH-013` exige validación server-side de campos y recurso;
- `TREQ-AUTH-017` y `TREQ-AUTH-018` cubren exposición sensible de SST/medicina y clientes, incluida exportación y detalle fuera de necesidad;
- `TREQ-SUPABASE-004` y `TREQ-SUPABASE-013` protegen almacenamiento sensible, acceso temporal y copias controladas;
- `TREQ-INTEGRATION-021` conserva control y reconciliación de copias y salidas;
- `NFR-REQ-005` exige explícitamente minimización, no exposición indirecta, supresión o agrupación de celdas pequeñas, limitación de drill-down y pruebas de agregados pequeños/reidentificación.

A002 especializa esas reglas para la capa analítica sin crear una capacidad ejecutable nueva, sin cambiar un requisito vigente y sin introducir un algoritmo estadístico nuevo.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa documentalmente controles ya exigidos por requisitos vigentes de autorización, proyección mínima, artefactos analíticos, drill-down, exportación, información sensible, metadatos y no exposición indirecta. No implementa acceso, no crea permisos, no cambia el modelo físico, no introduce un comportamiento ejecutable adicional fuera de esa cobertura y no modifica texto, estado, relación, prioridad, paquete o evidencia de ningún `TREQ-*`.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

#### 24. Criterios de aceptación

1. la autorización del conjunto y la autorización de divulgación permanecen decisiones separadas;
2. la política de campos se evalúa después de formar el conjunto autorizado y antes de producir la salida;
3. la clasificación efectiva puede elevarse por combinación o derivado y no se degrada por formato;
4. no se declara anónimo un conjunto por ocultar un identificador directo;
5. no se adopta un umbral numérico universal como prueba suficiente de anonimato o seguridad;
6. un agregado sensible sin regla de divulgación resoluble se suprime;
7. la supresión primaria no puede reconstruirse mediante total menos subtotal;
8. la supresión complementaria cubre porcentajes, deltas, rankings y componentes derivados;
9. consultas sucesivas no pueden aislar miembros mediante diferencias de filtros;
10. precisión temporal, geográfica, numérica o categórica puede reducirse para controlar inferencia;
11. un estado suprimido no se reemplaza por cero, null o error distintivo;
12. la vista operacional necesaria sobre miembros individualmente autorizados no se convierte en divulgación analítica general;
13. cada lado de una comparación se autoriza y protege por separado;
14. un benchmark no revela miembros excluidos por resta o complemento;
15. ranking, top/bottom, percentil y cuota se tratan como comparaciones;
16. original y restatement se comparan solo bajo autorización y protección vigentes;
17. una exportación no contiene más filas, campos o precisión que la proyección protegida salvo autorización detallada independiente;
18. una exportación no recupera columnas ocultas, claves auxiliares ni celdas suprimidas;
19. cambiar formato no cambia clasificación ni autoridad;
20. `DATA-AUTH-003` conserva la capacidad de exportar y A002 no la asigna;
21. cada nivel de drill-down reevalúa actor, recurso, territorio, finalidad, clasificación, campos y población;
22. un KPI no concede filas fuente;
23. una celda suprimida no permite un deep link o tooltip que revele sus miembros;
24. conocer un identificador no permite saltar un nivel de detalle bloqueado;
25. conteos de paginación, autocomplete, errores, tooltips y metadatos aplican la misma protección;
26. caché y materializaciones no mezclan poblaciones o perfiles de divulgación incompatibles;
27. cambio de actor, finalidad, clasificación o autorización invalida resultados incompatibles;
28. BI, hojas, modelos e IA no reciben datos adicionales por conveniencia técnica;
29. se materializan exactamente 62 objetos y se preservan 43 maestros, 19 referencias y 3 AURA bloqueados;
30. cada uno de los 62 objetos recibe una decisión explícita de protección;
31. se materializan exactamente 14 métricas y se preservan 11 `NO EVALUADO` y 3 `BLOQUEADO`;
32. cada una de las 14 métricas recibe decisión de detalle, población, comparación y drill-down;
33. se materializan exactamente 55 familias analíticas y la distribución permanece 11 + 12 + 10 + 12 + 10;
34. cada una de las 55 familias recibe un perfil de protección y una decisión explícita;
35. se materializan exactamente seis familias de artefacto;
36. ninguna decisión de A002 eleva calidad, certificación, publicación, causalidad o estado operativo;
37. no se crea ni asigna ningún permiso;
38. no se modifica código, DDL, DML, RLS, RPC, grants, datos, migraciones, backfills, despliegues o Supabase;
39. no se crea ni modifica ningún requisito de prueba;
40. `DATA-AUTH-003` permanece únicamente reservada.

#### 25. Continuidad

ÚLTIMA TAREA APROBADA
`DATA-AUTH-001 — Proteger datos maestros, métricas, reportes y análisis por dominio, entidad, territorio y finalidad`

TAREA ACTUAL APROBADA
`DATA-AUTH-002 — Proteger información sensible, poblaciones pequeñas, comparaciones, exportaciones y drill-down`

SIGUIENTE TAREA RESERVADA
`DATA-AUTH-003 — Separar definición, certificación, publicación, fijación de metas, anotación, exportación y administración`


### ✅ DATA-AUTH-003 — Separar definición, certificación, publicación, fijación de metas, anotación, exportación y administración

**Estado:** APROBADA
**Tarea anterior:** `DATA-AUTH-002 — Proteger información sensible, poblaciones pequeñas, comparaciones, exportaciones y drill-down` — APROBADA
**Tarea siguiente:** `DATA-AUTH-004 — Auditar consultas, descargas, suscripciones, alertas, modelos y recomendaciones` — RESERVADA
**Tipo de tarea:** documental; contrato canónico y materializado de segregación de capacidades de gobierno y uso analítico para definición, certificación, publicación, fijación de metas, anotación, exportación y administración, sin asignar roles, permisos ni cambios físicos
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, DDL, DML, migraciones, RLS, RPC, grants, cambios de permisos, cambios de datos, backfills, despliegues o cambios en Supabase:** no autorizados
**Requisitos de prueba creados o modificados:** 0

#### 1. Propósito

Cerrar la separación de autoridad entre las siete acciones de gobierno y uso analítico reservadas por `DATA-AUTH-001` y `DATA-AUTH-002`: definir, certificar, publicar, fijar metas, anotar, exportar y administrar.

La tarea determina qué función empresarial puede ser elegible para cada acción, qué autorización adicional debe existir, qué dependencias debe consumir y qué acciones nunca se heredan unas de otras. No crea un rol empresarial nuevo, no asigna permisos a personas, no introduce claves técnicas de permiso y no convierte propiedad funcional, stewardship, custodia técnica, acceso de lectura o administración en autoridad universal.

El principio rector es:

```text
DEFINIR ≠ CERTIFICAR ≠ PUBLICAR ≠ FIJAR META ≠ ANOTAR ≠ EXPORTAR ≠ ADMINISTRAR

PROPIETARIO FUNCIONAL ≠ PERMISO
STEWARD ≠ PERMISO
CERTIFICADOR ≠ PUBLICADOR
PUBLICADOR ≠ EXPORTADOR
ADMINISTRADOR ≠ SUPERUSUARIO
CUSTODIO TÉCNICO ≠ AUTORIDAD EMPRESARIAL
```

Cada acción real deberá resolverse mediante el modelo canónico de autorización, con permiso exacto, actor, recurso, alcance, finalidad, contexto, estado, versiones y denegaciones aplicables. Una función documental solo define elegibilidad y responsabilidad; nunca sustituye esa decisión.

#### 2. Resultado sustantivo

Queda materializado el contrato `DATA-GOVERNANCE-CAPABILITY-SEGREGATION-CONTRACT-001` con los siguientes resultados:

- siete acciones gobernadas y mutuamente no heredables: `DEFINE`, `CERTIFY`, `PUBLISH`, `SET_TARGET`, `ANNOTATE`, `EXPORT` y `ADMINISTER`;
- propiedad funcional, stewardship, certificación, publicación, custodia técnica y consumo permanecen funciones distintas;
- ningún rol base, rol operativo, cargo, jerarquía, aplicación o capacidad administrativa recibe por inferencia alguna de las siete acciones;
- la coincidencia de una misma persona en dos funciones solo puede operar cuando existan autorizaciones separadas, no haya denegación y la política de segregación del recurso permita expresamente esa acumulación; si la independencia requerida no puede resolverse, la segunda acción se bloquea;
- definición y certificación quedan separadas: crear o cambiar semántica no certifica datos ni resultados;
- certificación y publicación quedan separadas: `CERTIFICADO` no publica y publicar no cambia el estado D007;
- publicación y exportación quedan separadas: una publicación oficial no concede una copia portable y una exportación no se vuelve publicación oficial;
- fijar una meta consume una métrica gobernada y una línea base válida, pero no modifica fórmula, fuente, certificación ni resultado observado;
- una anotación es contextual y no autoritativa: no cambia valor, fórmula, estado DQ, meta, publicación, fuente ni historia;
- administración gobierna mecánica y workflow dentro de autoridad separada; no puede autoasignarse capacidades, redefinir semántica, certificar, publicar, fijar metas ni ampliar exportaciones;
- la protección de `DATA-AUTH-001` y `DATA-AUTH-002` sigue siendo obligatoria para toda lectura, publicación, anotación o exportación que revele información;
- quedan materializadas decisiones para **62 de 62 objetos**, **14 de 14 métricas**, **55 de 55 familias analíticas** y **6 de 6 familias de artefacto** heredadas;
- se preservan **3 objetos AURA `BLOQUEADO`**, **11 métricas `NO EVALUADO`** y **3 métricas `BLOQUEADO`** sin elevar su estado;
- no se crea ni asigna ninguna clave de permiso, rol, grant o excepción;
- no se crea, modifica, difiere, descarta u obsoleta ningún requisito `TREQ-*`.

#### 3. Fuentes y decisiones heredadas

La tarea consume sin redefinir:

- `DATA-AUTH-001` para conjunto autorizado, roles funcionales, 62 objetos, 14 métricas, 55 familias y seis artefactos;
- `DATA-AUTH-002` para clasificación efectiva, proyección mínima, población, inferencia, comparación, exportación protegida y drill-down;
- `DATA-DOM-001` a `DATA-DOM-003` para propiedad, stewardship, custodia, identidad y gobierno de maestros/referencias;
- `DATA-DOM-004` para identidad, versión, fórmula, propietario y contrato de métricas;
- `DATA-DOM-007` para calidad y los estados `NO EVALUADO`, `EN OBSERVACIÓN`, `CERTIFICADO`, `DEGRADADO` y `BLOQUEADO`;
- `DATA-DOM-008` para tablero, reporte, exportación, suscripción, alerta y snapshot oficial, y para la independencia entre certificación y publicación;
- `DATA-DOM-014` para diagnóstico, evidencia, confianza y publicación de conclusiones;
- `DATA-DOM-015` para objetivo, línea base, meta, drivers, guardrails y plan de medición;
- `DATA-DOM-016` para acción, experimento, seguimiento, aprendizaje y comprobación;
- `DATA-DOM-017` para versiones, restatements, historia y reproducibilidad;
- el modelo canónico AUTH para permiso exacto, contexto, alcance, recurso, segregación, denegaciones y evidencia;
- `INFO-AUTH-001` y `INFO-AUTH-002` para clasificación, finalidad, campos, destinatarios y salidas de información;
- los requisitos vigentes `TREQ-DATA-001`, `TREQ-DATA-002`, `TREQ-DATA-004`, `TREQ-DATA-005`, `TREQ-AUTH-001`, `TREQ-AUTH-002`, `TREQ-AUTH-010`, `TREQ-AUTH-013`, `TREQ-AUTH-015` y `TREQ-SHELL-011`.

Esta tarea no altera ninguna definición, estado de certificación, métrica, meta, publicación, anotación, exportación o asignación física existente. Define la autoridad que deberá evaluarse cuando esas acciones se implementen.

#### 4. Fronteras conceptuales obligatorias

```text
ELEGIBILIDAD FUNCIONAL ≠ AUTORIZACIÓN EFECTIVA
PROPIEDAD ≠ DEFINICIÓN AUTORIZADA
DEFINICIÓN APROBADA ≠ CERTIFICACIÓN
CERTIFICACIÓN ≠ PUBLICACIÓN
PUBLICACIÓN ≠ EXPORTACIÓN
LECTURA ≠ EXPORTACIÓN
MÉTRICA DEFINIDA ≠ META FIJADA
META FIJADA ≠ ALERTA CONFIGURADA
ANOTACIÓN ≠ CORRECCIÓN
ANOTACIÓN ≠ CERTIFICACIÓN
ANOTACIÓN ≠ RESTATEMENT
ADMINISTRACIÓN ≠ DEFINICIÓN
ADMINISTRACIÓN ≠ AUTORIZACIÓN PARA OTORGARSE PERMISOS
CUSTODIA TÉCNICA ≠ AUTORIDAD SEMÁNTICA
CAPACIDAD EN UNA APLICACIÓN ≠ CAPACIDAD TRANSVERSAL
```

#### 5. Contrato `DATA-GOVERNANCE-CAPABILITY-SEGREGATION-CONTRACT-001`

Toda solicitud de una de las siete acciones deberá resolver como mínimo:

| Dimensión        | Decisión obligatoria                                                                     | Bloqueo fail closed                                                             |
| ---------------- | ---------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| acción exacta    | una de `DEFINE`, `CERTIFY`, `PUBLISH`, `SET_TARGET`, `ANNOTATE`, `EXPORT`, `ADMINISTER`  | acción genérica, implícita o inferida desde otra capacidad                      |
| recurso          | objeto, definición, métrica, versión, resultado, objetivo, anotación o artefacto exactos | identificador aislado, pantalla, fila enviada por cliente o recurso ambiguo     |
| actor            | principal autenticado y actor efectivo exigidos por el contrato                          | rol, dispositivo, service role o sesión aislados                                |
| permiso          | permiso canónico exacto y vigente que autoriza la acción concreta                        | nombre de función, cargo, propiedad, stewardship, aplicación o permiso parecido |
| alcance          | dominio, entidad, organización, sede, área, sujeto, colección o recurso autorizado       | alcance global inferido o enviado libremente por cliente                        |
| finalidad        | finalidad empresarial concreta compatible con la acción                                  | conveniencia, administración genérica o reutilización no declarada              |
| estado y versión | versión, vigencia y estado del recurso compatibles con la acción                         | versión retirada, bloqueada, conflictiva o no resoluble                         |
| prerrequisitos   | contratos D004/D007/D008/D015/D016/D017 que la acción consuma                            | omitir certificación, baseline, publicación o estado requerido                  |
| segregación      | política aplicable entre actor actual y funciones/decisiones relacionadas                | asumir acumulación por ser la misma persona, propietario o administrador        |
| protección       | A001/A002 e INFO-AUTH cuando la acción pueda revelar o producir una salida               | ocultar campos solo en UI o confiar en un canal técnico                         |
| frescura         | autorización, recurso, estado, versiones y denegaciones vigentes al efecto               | decisión obsoleta, caché, sesión anterior o preview                             |
| evidencia        | correlación mínima entre acción, actor, recurso, permiso, versión, decisión y resultado  | log o comentario usado como autoridad                                           |

Una dimensión puede ser `NO_APLICA` únicamente cuando el contrato propietario de la acción lo determine expresamente. La ausencia de una clave técnica de permiso compatible no se sustituye por una función documental: la acción permanece denegada hasta que exista un binding canónico aprobado.

#### 6. Matriz canónica de las siete capacidades

| Acción       | Recurso gobernado                                                                                   | Función elegible primaria                                                             | Prerrequisitos                                                                                    | Efecto autorizado                                                                               | Nunca concede                                                                                                                   |
| ------------ | --------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `DEFINE`     | definición de maestro/referencia, definición/versionado de métrica o semántica gobernada            | propietario funcional y gobierno AB según el dominio, siempre con autorización exacta | identidad del recurso; fuente/owner; versión; contrato D001-D004 y D017 aplicable                 | crear o cambiar una definición o versión semántica dentro del alcance autorizado                | certificación, publicación, meta, exportación, administración ni mutación de hechos por inferencia                              |
| `CERTIFY`    | coordenada de calidad de fuente, objeto, métrica o resultado                                        | certificador autorizado conforme a D007                                               | evidencia DQ; uso; periodo; corte; versiones; dependencias; segregación                           | emitir uno de los estados D007 para la coordenada exacta                                        | corregir fuente, cambiar definición, publicar, fijar meta o ampliar acceso                                                      |
| `PUBLISH`    | tablero/reporte/snapshot/conclusión u otro artefacto oficial admitido por D008/D017                 | publicador autorizado                                                                 | recurso y versión; calidad/certificación exigible; audiencia/finalidad; A001/A002                 | emitir una publicación oficial o edición gobernada                                              | certificar, redefinir, exportar por defecto, cambiar meta o sobrescribir historia                                               |
| `SET_TARGET` | objetivo y versión de meta D015                                                                     | propietario funcional del resultado con capacidad exacta de meta                      | métrica gobernada; baseline; horizonte; población; guardrails; calidad; versión                   | fijar o cambiar valor/horizonte de meta para el objetivo exacto                                 | cambiar fórmula, baseline observado, certificación, publicación o resultado medido                                              |
| `ANNOTATE`   | versión/corte de métrica, resultado, diagnóstico, objetivo, intervención, publicación o restatement | actor con capacidad exacta de anotación sobre el recurso                              | recurso/version/corte; finalidad; visibilidad; A001/A002; versión esperada                        | añadir contexto, limitación, razonamiento, seguimiento o referencia sin autoridad sobre el dato | editar fuente, fórmula, certificado, meta, estado de publicación, evidencia previa o historia                                   |
| `EXPORT`     | proyección portable de un conjunto/resultado/artefacto                                              | actor con capacidad exacta de exportación                                             | autorización A001; protección A002; recurso; campos; población; finalidad; destino cuando aplique | materializar únicamente la proyección autorizada y protegida                                    | publicación oficial, detalle adicional, nueva finalidad, certificación ni fuente de verdad                                      |
| `ADMINISTER` | workflow y mecánica de gobierno dentro de un recurso autorizado                                     | administrador de gobierno con capacidad exacta y alcance acotado                      | recurso; alcance; acción administrativa concreta; estado/version; separación; AUTH                | operar asignación, enrutamiento o mecánica administrativa expresamente autorizada               | autootorgarse capacidades, alterar semántica, certificar, publicar, fijar metas, ampliar exportación o neutralizar denegaciones |

Los nombres anteriores son **tipos documentales de acción**, no claves de permiso ni roles técnicos. La implementación futura deberá vincular cada tipo a permisos canónicos exactos sin usar wildcards, prefijos, roles genéricos o strings locales.

#### 7. Elegibilidad funcional y no concesión automática

| Función heredada o contextual             | Elegibilidad documental                                                                                                        | Autoridad que no obtiene por la función                                                     |
| ----------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------- |
| propietario funcional                     | puede ser elegible para `DEFINE` y `SET_TARGET` dentro de su dominio y para otras acciones solo mediante autorización separada | no recibe `CERTIFY`, `PUBLISH`, `EXPORT`, `ANNOTATE` o `ADMINISTER` por ser propietario     |
| steward                                   | puede preparar evidencia, proponer cambios, anotar o administrar workflow dentro de delegación explícita                       | no define semántica final, certifica, publica, fija metas ni exporta por ser steward        |
| certificador autorizado                   | puede ejercer `CERTIFY` cuando la autorización, evidencia y segregación sean válidas                                           | no recibe `DEFINE`, `PUBLISH`, `SET_TARGET`, `EXPORT` o `ADMINISTER`                        |
| publicador autorizado                     | puede ejercer `PUBLISH` sobre el artefacto y audiencia autorizados                                                             | no cambia definición, certificación, fuente, meta ni protección de salida                   |
| actor con capacidad exacta de meta        | puede ejercer `SET_TARGET` sobre el objetivo autorizado                                                                        | no redefine KPI, baseline observado, certificación o resultados                             |
| actor con capacidad exacta de anotación   | puede ejercer `ANNOTATE` sobre el recurso autorizado                                                                           | no transforma la nota en corrección, aprobación, certificación o publicación                |
| actor con capacidad exacta de exportación | puede ejercer `EXPORT` sobre la proyección autorizada                                                                          | no recibe publicación, administración, detalle adicional ni acceso futuro permanente        |
| administrador de gobierno                 | puede ejercer `ADMINISTER` sobre la operación administrativa exacta                                                            | no es superusuario y no hereda ninguna de las otras seis capacidades                        |
| custodio técnico                          | puede implementar u operar mecanismos técnicos autorizados en fases posteriores                                                | no adquiere semántica, certificación, publicación, meta, exportación o gobierno empresarial |
| consumidor                                | puede consultar o usar información conforme a su capacidad de consumo                                                          | consumo no concede ninguna de las siete acciones de gobierno                                |
| principal técnico, job o integración      | puede ejecutar únicamente el contrato técnico expresamente autorizado                                                          | no se convierte en actor humano, propietario, certificador, publicador o administrador      |

Ninguna fila anterior asigna una capacidad a una persona o rol actual. La elegibilidad solo limita quién podría recibirla; la autoridad efectiva sigue dependiendo del permiso exacto y del contexto canónico.

#### 8. Regla de acumulación y separación de actor

1. las siete acciones siempre conservan permisos, decisiones y evidencia independientes;
2. una persona puede coincidir en más de una función únicamente cuando cada acción tenga autorización separada y la política del recurso no exija independencia de actor;
3. cuando un contrato exija revisión o certificación independiente, el actor que produjo la decisión incompatible no puede satisfacer esa independencia con otra etiqueta funcional;
4. ausencia de política resoluble sobre una combinación sensible no autoriza acumulación; la acción posterior se bloquea;
5. un grant individual no neutraliza una denegación estructural o transversal;
6. cambiar de acción exige reevaluar permiso, recurso, alcance, finalidad, estado y versiones; no existe sesión de gobierno universal;
7. el administrador no puede otorgarse a sí mismo otra de las siete capacidades dentro de la misma operación;
8. una reautenticación fuerte, cuando una capa futura la exija, confirma identidad pero no amplía capacidad ni scope;
9. la simulación puede evaluar hipotéticamente una matriz futura, pero nunca ejecuta una de estas acciones ni convierte `WOULD_ALLOW` en autoridad real.

#### 9. Matriz de segregación entre decisiones relacionadas

| Decisión origen | Decisión posterior           | Regla A003                                                                                                                                              |
| --------------- | ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `DEFINE`        | `CERTIFY`                    | independiente; definir no certifica. Si la política exige certificador independiente, la coincidencia de actor sin excepción explícita produce bloqueo. |
| `DEFINE`        | `PUBLISH`                    | independiente; una versión definida no queda publicada por existir.                                                                                     |
| `DEFINE`        | `SET_TARGET`                 | la meta consume la definición vigente; no puede modificarla dentro de la misma acción.                                                                  |
| `CERTIFY`       | `PUBLISH`                    | la publicación puede consumir el estado D007 exigido, pero el publicador no puede crearlo ni elevarlo.                                                  |
| `CERTIFY`       | `SET_TARGET`                 | una certificación puede habilitar el uso de baseline/métrica; no decide el valor de meta.                                                               |
| `SET_TARGET`    | `CERTIFY`                    | fijar una meta no certifica baseline, fuente, KPI ni resultado posterior.                                                                               |
| `ANNOTATE`      | cualquiera de las otras seis | una anotación nunca produce una transición autoritativa; toda acción posterior se autoriza de nuevo.                                                    |
| `PUBLISH`       | `EXPORT`                     | publicar no concede exportar; la copia portable aplica `EXPORT` y A002.                                                                                 |
| `EXPORT`        | `PUBLISH`                    | una exportación no se convierte en reporte/snapshot oficial por almacenarse o compartirse.                                                              |
| `ADMINISTER`    | cualquiera de las otras seis | administración no concede ni reemplaza semántica, calidad, publicación, meta, anotación o exportación.                                                  |

#### 10. `DEFINE` — autoridad sobre definiciones

`DEFINE` gobierna el significado, no la ejecución técnica ni los hechos observados.

Reglas:

- una definición de métrica conserva `metric_key`, versión, fórmula, numerador/denominador, unidad, granularidad, dimensiones, filtros, inclusiones, exclusiones, fuente y demás contrato D004;
- cambiar semántica crea o referencia una versión gobernada; no reescribe silenciosamente periodos históricos;
- un propietario funcional puede ser fuente de decisión semántica, pero su propiedad no sustituye el permiso exacto;
- un steward puede preparar, validar o proponer información dentro de su delegación, pero no adquiere decisión final por esa función;
- definir un maestro o referencia no autoriza mutar hechos, consolidar identidades, fusionar registros ni alterar consumidores fuera del contrato propietario;
- una definición nueva no se autocertifica, no se publica y no activa una meta por el mismo acto;
- una definición que afecte historia, comparación o publicaciones consume `DATA-DOM-017` antes de reexpresar resultados.

#### 11. `CERTIFY` — autoridad sobre calidad

`CERTIFY` solo puede emitir una decisión D007 para una coordenada exacta.

Reglas:

- se preservan exclusivamente `NO EVALUADO`, `EN OBSERVACIÓN`, `CERTIFICADO`, `DEGRADADO` y `BLOQUEADO`;
- certificación exige uso, periodo, versión, corte, fuentes/dependencias y evidencia reproducible;
- completar una carga, ejecutar una consulta o disponer de código no certifica;
- el certificador no corrige la fuente ni cambia la fórmula dentro de la decisión de certificación;
- una dependencia `BLOQUEADO` no se supera mediante publicación, anotación, meta o administración;
- una recertificación posterior es una nueva decisión vinculada; no reescribe la decisión histórica;
- el actor que deba ser independiente se valida contra la política de segregación antes de emitir la decisión.

#### 12. `PUBLISH` — autoridad sobre publicación oficial

`PUBLISH` convierte un artefacto elegible en una publicación gobernada; no convierte información en verdadera, certificada o pública por sí sola.

Reglas:

- publicación consume D008, D007, A001 y A002 según el artefacto y audiencia;
- un artefacto que dependa de una entrada `BLOQUEADO` no se publica como oficial;
- `NO EVALUADO` no se presenta como `CERTIFICADO`;
- `DEGRADADO` solo puede publicarse con la condición visible que admita el contrato de uso;
- una edición oficial o snapshot conserva corte, versiones, contexto y estado de calidad aplicable;
- cambiar fórmula, datos o estado después de publicar no modifica silenciosamente la edición anterior;
- publicación de una conclusión D014 conserva confianza, límites y calidad; no transforma correlación en causalidad;
- publicar no concede exportación adicional, drill-down ni acceso a filas fuente.

#### 13. `SET_TARGET` — autoridad para fijar metas

`SET_TARGET` opera exclusivamente sobre un objetivo D015 y no sobre el valor observado de la métrica.

Reglas:

- debe identificar objetivo, métrica/KPI, versión, baseline, valor de meta, horizonte, población, segmentos, drivers, guardrails y plan de medición aplicables;
- el valor y horizonte de meta corresponden al propietario funcional con la capacidad exacta de meta;
- una anomalía, forecast, presupuesto, escenario, recomendación o modelo puede informar la decisión, pero no fija la meta automáticamente;
- el baseline usa evidencia observada conforme a D015 y no se cambia para hacer alcanzable la meta;
- una métrica o fuente `BLOQUEADO` no produce baseline oficial; el objetivo debe conservar ese bloqueo o condición hasta resolverlo;
- fijar una meta no crea una alerta, no modifica una fórmula y no autoriza una acción empresarial;
- el responsable de medición no cambia la meta por el solo hecho de medir el resultado;
- cambiar una meta crea una nueva decisión/version aplicable al periodo futuro definido y conserva la anterior.

#### 14. `ANNOTATE` — autoridad de anotación no autoritativa

Una anotación añade contexto a un recurso gobernado sin sustituirlo.

Toda anotación deberá vincularse, cuando aplique, a:

- recurso y tipo de recurso;
- versión, periodo, corte o snapshot exactos;
- autor/actor efectivo;
- finalidad de la anotación;
- alcance y visibilidad autorizados;
- timestamp y correlación;
- referencia a evidencia o decisión relacionada cuando exista;
- estado de la anotación y supersesión/corrección cuando corresponda.

Reglas:

1. una anotación no cambia el valor de una métrica ni una celda;
2. no modifica fórmula, dimensión, fuente o versión;
3. no cambia `NO EVALUADO`, `EN OBSERVACIÓN`, `CERTIFICADO`, `DEGRADADO` o `BLOQUEADO`;
4. no fija ni cambia una meta;
5. no publica ni retira un artefacto;
6. no corrige una fuente ni ejecuta un restatement;
7. una corrección de anotación conserva historia o supersesión; no reescribe evidencia ajena;
8. contenido sensible de una anotación hereda clasificación, finalidad y política A001/A002;
9. una nota de administrador, steward, analista o propietario no equivale a aprobación, certificación ni permiso.

#### 15. `EXPORT` — autoridad de salida portable

`EXPORT` es una capacidad propia, separada de consulta y publicación.

Reglas:

- la acción se ejecuta únicamente sobre el conjunto ya autorizado por A001 y protegido por A002;
- campos ocultos, claves auxiliares, poblaciones excluidas y celdas suprimidas no reaparecen por formato;
- filtros del consumidor solo reducen un conjunto autorizado;
- exportar un tablero, reporte o snapshot no cambia su estado de publicación ni certificación;
- una exportación nueva reevalúa actor, permiso, finalidad, recurso, corte, población, campos y restricciones de destino aplicables;
- la capacidad de exportar un artefacto no concede exportar sus hechos fuente ni un nivel de detalle adicional;
- una exportación no se convierte en fuente de verdad, definición, baseline o evidencia suficiente de certificación;
- cualquier destinatario o canal externo mantiene las reglas de INFO-AUTH aplicables.

#### 16. `ADMINISTER` — autoridad administrativa sin superpermiso

`ADMINISTER` gobierna únicamente la operación administrativa exacta autorizada sobre registros y workflows de gobierno.

Puede abarcar, cuando el contrato propietario lo contemple, mecánicas como asignación de trabajo, enrutamiento, mantenimiento de metadatos administrativos, transición de workflow ya autorizada o gestión de referencias no semánticas.

No puede por sí sola:

- crear o cambiar una definición semántica;
- emitir certificación;
- publicar o retirar una publicación por inferencia;
- fijar o modificar metas;
- convertir una anotación en decisión;
- exportar información;
- cambiar hechos o fuentes de verdad;
- asignar permisos de seguridad o ampliarse a sí misma;
- desactivar denegaciones;
- usar credenciales técnicas, service role o acceso de base como autoridad empresarial.

Toda operación administrativa que en realidad produzca uno de esos efectos se reclasifica a la acción correspondiente y exige su autorización separada.

#### 17. Orden mínimo de decisión

Para cualquiera de las siete acciones:

1. identificar la acción exacta;
2. resolver el recurso y su versión desde fuente autoritativa;
3. resolver principal y actor efectivo;
4. resolver el permiso canónico exacto y vigente para esa acción;
5. resolver dominio, entidad, territorio, relación, alcance y finalidad aplicables;
6. resolver estado, vigencia, versión y precondiciones del recurso;
7. consumir D004, D007, D008, D015, D016 o D017 cuando correspondan;
8. evaluar política de segregación y conflicto de funciones;
9. aplicar A001/A002 e INFO-AUTH cuando exista exposición o salida;
10. evaluar denegaciones estructurales y explícitas;
11. revalidar frescura inmediatamente antes del efecto;
12. producir `ALLOW` o `DENY` mediante el contrato canónico de autorización;
13. ejecutar únicamente el efecto de la acción autorizada;
14. correlacionar la evidencia requerida sin convertirla en autoridad.

Una acción obligatoria `UNRESOLVED`, `CONFLICT`, inactiva, bloqueada, obsoleta o no verificable produce `DENY`. No se busca una acción parecida, un rol alternativo ni una ruta administrativa como fallback.

#### 18. Versiones, concurrencia y cambios de estado

- cada acción se aplica a una versión o estado esperado del recurso;
- un cambio concurrente de definición, calidad, meta, publicación, actor, permiso o scope obliga a revalidar;
- una decisión tomada sobre una versión obsoleta no se aplica silenciosamente a la nueva;
- retries deben conservar idempotencia y no duplicar publicación, certificación, anotación, exportación o transición administrativa;
- una respuesta perdida no autoriza repetir un efecto sin consultar primero el resultado lógico cuando el contrato así lo requiera;
- una operación compuesta no convierte éxito parcial en éxito total;
- historia, snapshots, publicaciones, metas y anotaciones anteriores permanecen distinguibles de sus sustituciones o restatements.

La implementación física de control de versión, idempotencia, transacciones y rollback pertenece a E3/E5 y tareas DATA-INT/SUPA aplicables.

#### 19. Dispositivos compartidos, simulación y principales técnicos

- un dispositivo compartido no recibe ninguna de las siete capacidades por su plantilla, aplicación visible o paquete máximo;
- una acción humana de gobierno exige actor humano efectivo cuando el contrato así lo determine;
- principal técnico, service role, job o integración solo ejecutan la operación técnica expresamente delegada y no se convierten en propietarios, certificadores, publicadores o administradores;
- la simulación conserva `executable=false`; puede representar una decisión hipotética pero no define, certifica, publica, fija meta, anota, exporta ni administra recursos reales;
- cambiar de actor invalida cualquier autoridad de gobierno vinculada al actor anterior;
- una sesión administrativa real no se transfiere al trabajador operativo de un dispositivo compartido.

#### 20. Perfiles A003 para objetos maestros y de referencia

`CAPACIDADES_SEPARADAS` significa que el objeto queda cubierto por las siete fronteras A003: definición, certificación, anotación, exportación y administración requieren decisiones propias; publicación solo ocurre mediante un artefacto autorizado que proyecte el objeto; fijación de meta solo ocurre mediante un objetivo que consuma una métrica gobernada. Propiedad y stewardship no son permisos.

`AURA_BLOQUEADO` preserva el bloqueo heredado: la definición documental puede existir, pero ninguna función A003 habilita fuente operativa, certificación, publicación oficial, exportación operativa o baseline/meta basada en una fuente AURA inexistente.

#### 21. Matriz materializada para los 62 objetos maestros y de referencia

|    # | Objeto canónico               | Clase heredada    | Perfil A002              | Decisión A003           | Estado heredado | Bloqueo / regla                                                                                                  |
| ---: | ----------------------------- | ----------------- | ------------------------ | ----------------------- | --------------- | ---------------------------------------------------------------------------------------------------------------- |
|    1 | `ORGANIZATION_SCOPE`          | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|    2 | `LEGAL_SUBJECT`               | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|    3 | `BRAND`                       | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|    4 | `COMMERCIAL_ESTABLISHMENT`    | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|    5 | `BUSINESS_LINE`               | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|    6 | `PHYSICAL_FACILITY`           | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|    7 | `OPERATIONAL_SITE`            | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|    8 | `ORGANIZATIONAL_AREA`         | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|    9 | `PHYSICAL_ZONE`               | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   10 | `WORKSTATION`                 | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   11 | `EXTERNAL_OPERATIONAL_POINT`  | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   12 | `PERSON_IDENTITY`             | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   13 | `WORKER_PROFILE`              | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   14 | `EMPLOYMENT_RELATIONSHIP`     | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   15 | `CONTRACTUAL_POSITION`        | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   16 | `BASE_ROLE`                   | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   17 | `OPERATIONAL_ROLE`            | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   18 | `WORK_ASSIGNMENT`             | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   19 | `CUSTOMER_PERSON`             | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   20 | `CUSTOMER_CONTACT`            | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   21 | `CUSTOMER_RELATIONSHIP`       | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   22 | `CUSTOMER_PROFILE`            | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   23 | `CUSTOMER_PREFERENCE`         | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   24 | `LOYALTY_ACCOUNT`             | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   25 | `LOYALTY_PROGRAM_RULE`        | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   26 | `PRODUCTO_MAESTRO`            | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   27 | `VARIANTE`                    | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   28 | `PRESENTACION`                | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   29 | `UNIDAD_DE_MEDIDA`            | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   30 | `TAXONOMIA_TIPO_MAESTRO`      | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   31 | `TAXONOMIA_INVENTARIO`        | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   32 | `TAXONOMIA_OPERACIONAL`       | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   33 | `LOC`                         | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   34 | `ACTIVO_FISICO`               | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   35 | `CLASE_DE_ACTIVO`             | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   36 | `ESPECIFICACION_PRODUCTO`     | `DATO_MAESTRO`    | `COMERCIAL_CONFIDENCIAL` | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   37 | `PROVEEDOR`                   | `DATO_MAESTRO`    | `COMERCIAL_CONFIDENCIAL` | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   38 | `CONTACTO_PROVEEDOR`          | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   39 | `RELACION_PRODUCTO_PROVEEDOR` | `DATO_MAESTRO`    | `COMERCIAL_CONFIDENCIAL` | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   40 | `CONDICION_COMERCIAL`         | `DATO_MAESTRO`    | `FINANCIERO_RESTRINGIDO` | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   41 | `TAXONOMIA_COMPRA`            | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   42 | `RECETA`                      | `DATO_MAESTRO`    | `COMERCIAL_CONFIDENCIAL` | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   43 | `FAMILIA_PRODUCTIVA`          | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   44 | `RUTA_PRODUCTIVA`             | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   45 | `RECURSO_PRODUCTIVO`          | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   46 | `COMMERCIAL_CHANNEL`          | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   47 | `CATEGORIA_COMERCIAL`         | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   48 | `OFERTA_COMERCIAL`            | `DATO_MAESTRO`    | `COMERCIAL_CONFIDENCIAL` | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   49 | `CENTRO_DE_COSTO`             | `DATO_MAESTRO`    | `FINANCIERO_RESTRINGIDO` | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   50 | `MONEDA`                      | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   51 | `PERIODO_ECONOMICO`           | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   52 | `PERIODO_CONTABLE`            | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   53 | `PERIODO_FISCAL`              | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   54 | `CLASIFICACION_ECONOMICA`     | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   55 | `PERFIL_DE_MARCA`             | `DATO_MAESTRO`    | `BLOQUEADO`              | `AURA_BLOQUEADO`        | `BLOQUEADO`     | Fuente AURA no habilitada; ninguna capacidad A003 levanta el bloqueo ni crea una fuente sustituta.               |
|   56 | `AUDIENCIA`                   | `DATO_MAESTRO`    | `BLOQUEADO`              | `AURA_BLOQUEADO`        | `BLOQUEADO`     | Fuente AURA no habilitada; ninguna capacidad A003 levanta el bloqueo ni crea una fuente sustituta.               |
|   57 | `ACTIVO_DE_MARCA`             | `DATO_MAESTRO`    | `BLOQUEADO`              | `AURA_BLOQUEADO`        | `BLOQUEADO`     | Fuente AURA no habilitada; ninguna capacidad A003 levanta el bloqueo ni crea una fuente sustituta.               |
|   58 | `ENDPOINT`                    | `DATO_MAESTRO`    | `TECNICO_SENSIBLE`       | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   59 | `SHARED_DEVICE`               | `DATO_MAESTRO`    | `TECNICO_SENSIBLE`       | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   60 | `NETWORK_RESOURCE`            | `DATO_MAESTRO`    | `TECNICO_SENSIBLE`       | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   61 | `APPLICATION`                 | `DATO_MAESTRO`    | `TECNICO_SENSIBLE`       | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |
|   62 | `TECH_SERVICE`                | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO`  | Ninguna función, propiedad, stewardship, custodia o acceso previo sustituye la autorización exacta de la acción. |

**Reconciliación:** 62 esperados; 62 materializados; 62 identidades únicas; 0 faltantes; 0 duplicados; 43 datos maestros; 19 datos de referencia; 59 `ESPECIFICADO`; 3 AURA `BLOQUEADO`.

#### 22. Leyenda de capacidades para métricas

- `SEPARADA_D004_D017`: definición/versionado independiente conforme a D004/D017;
- `SEPARADA_D007`: certificación independiente conforme a D007;
- `BLOQUEADO_D007`: no puede elevarse mientras persista el bloqueo heredado;
- `SEPARADA_D008`: publicación independiente conforme a D008 y al estado aplicable;
- `BLOQUEADO_OFICIAL`: no puede publicarse como resultado oficial mientras la dependencia bloqueante persista;
- `SEPARADA_D015`: fijación de meta independiente conforme a D015;
- `SEPARADA_D015_CON_BASELINE_BLOQUEADO`: la capacidad de meta es independiente, pero no existe baseline oficial válido mientras persista el bloqueo;
- `SEPARADA_NO_AUTORITATIVA`: la anotación no modifica la métrica ni sus estados;
- `SEPARADA_A001_A002`: exportación exige autorización de conjunto y protección de divulgación;
- `SEPARADA_NO_SUPERPERMISO`: administración no concede otra acción.

#### 23. Matriz materializada para las 14 métricas de asistencia

|    # | `metric_key`        | DQ heredado   | `DEFINE`             | `CERTIFY`        | `PUBLISH`           | `SET_TARGET`                           | `ANNOTATE`                 | `EXPORT`             | `ADMINISTER`               | Estado A003    |
| ---: | ------------------- | ------------- | -------------------- | ---------------- | ------------------- | -------------------------------------- | -------------------------- | -------------------- | -------------------------- | -------------- |
|    1 | `scheduledShifts`   | `NO EVALUADO` | `SEPARADA_D004_D017` | `SEPARADA_D007`  | `SEPARADA_D008`     | `SEPARADA_D015`                        | `SEPARADA_NO_AUTORITATIVA` | `SEPARADA_A001_A002` | `SEPARADA_NO_SUPERPERMISO` | `ESPECIFICADO` |
|    2 | `attendedShifts`    | `NO EVALUADO` | `SEPARADA_D004_D017` | `SEPARADA_D007`  | `SEPARADA_D008`     | `SEPARADA_D015`                        | `SEPARADA_NO_AUTORITATIVA` | `SEPARADA_A001_A002` | `SEPARADA_NO_SUPERPERMISO` | `ESPECIFICADO` |
|    3 | `restDayCount`      | `NO EVALUADO` | `SEPARADA_D004_D017` | `SEPARADA_D007`  | `SEPARADA_D008`     | `SEPARADA_D015`                        | `SEPARADA_NO_AUTORITATIVA` | `SEPARADA_A001_A002` | `SEPARADA_NO_SUPERPERMISO` | `ESPECIFICADO` |
|    4 | `lateCount`         | `NO EVALUADO` | `SEPARADA_D004_D017` | `SEPARADA_D007`  | `SEPARADA_D008`     | `SEPARADA_D015`                        | `SEPARADA_NO_AUTORITATIVA` | `SEPARADA_A001_A002` | `SEPARADA_NO_SUPERPERMISO` | `ESPECIFICADO` |
|    5 | `noShowCount`       | `NO EVALUADO` | `SEPARADA_D004_D017` | `SEPARADA_D007`  | `SEPARADA_D008`     | `SEPARADA_D015`                        | `SEPARADA_NO_AUTORITATIVA` | `SEPARADA_A001_A002` | `SEPARADA_NO_SUPERPERMISO` | `ESPECIFICADO` |
|    6 | `openCount`         | `NO EVALUADO` | `SEPARADA_D004_D017` | `SEPARADA_D007`  | `SEPARADA_D008`     | `SEPARADA_D015`                        | `SEPARADA_NO_AUTORITATIVA` | `SEPARADA_A001_A002` | `SEPARADA_NO_SUPERPERMISO` | `ESPECIFICADO` |
|    7 | `missingCloseCount` | `BLOQUEADO`   | `SEPARADA_D004_D017` | `BLOQUEADO_D007` | `BLOQUEADO_OFICIAL` | `SEPARADA_D015_CON_BASELINE_BLOQUEADO` | `SEPARADA_NO_AUTORITATIVA` | `SEPARADA_A001_A002` | `SEPARADA_NO_SUPERPERMISO` | `BLOQUEADO`    |
|    8 | `autoCloseCount`    | `NO EVALUADO` | `SEPARADA_D004_D017` | `SEPARADA_D007`  | `SEPARADA_D008`     | `SEPARADA_D015`                        | `SEPARADA_NO_AUTORITATIVA` | `SEPARADA_A001_A002` | `SEPARADA_NO_SUPERPERMISO` | `ESPECIFICADO` |
|    9 | `departureCount`    | `NO EVALUADO` | `SEPARADA_D004_D017` | `SEPARADA_D007`  | `SEPARADA_D008`     | `SEPARADA_D015`                        | `SEPARADA_NO_AUTORITATIVA` | `SEPARADA_A001_A002` | `SEPARADA_NO_SUPERPERMISO` | `ESPECIFICADO` |
|   10 | `scheduledMinutes`  | `NO EVALUADO` | `SEPARADA_D004_D017` | `SEPARADA_D007`  | `SEPARADA_D008`     | `SEPARADA_D015`                        | `SEPARADA_NO_AUTORITATIVA` | `SEPARADA_A001_A002` | `SEPARADA_NO_SUPERPERMISO` | `ESPECIFICADO` |
|   11 | `netMinutes`        | `NO EVALUADO` | `SEPARADA_D004_D017` | `SEPARADA_D007`  | `SEPARADA_D008`     | `SEPARADA_D015`                        | `SEPARADA_NO_AUTORITATIVA` | `SEPARADA_A001_A002` | `SEPARADA_NO_SUPERPERMISO` | `ESPECIFICADO` |
|   12 | `incidentCount`     | `NO EVALUADO` | `SEPARADA_D004_D017` | `SEPARADA_D007`  | `SEPARADA_D008`     | `SEPARADA_D015`                        | `SEPARADA_NO_AUTORITATIVA` | `SEPARADA_A001_A002` | `SEPARADA_NO_SUPERPERMISO` | `ESPECIFICADO` |
|   13 | `attendanceRate`    | `BLOQUEADO`   | `SEPARADA_D004_D017` | `BLOQUEADO_D007` | `BLOQUEADO_OFICIAL` | `SEPARADA_D015_CON_BASELINE_BLOQUEADO` | `SEPARADA_NO_AUTORITATIVA` | `SEPARADA_A001_A002` | `SEPARADA_NO_SUPERPERMISO` | `BLOQUEADO`    |
|   14 | `punctualityRate`   | `BLOQUEADO`   | `SEPARADA_D004_D017` | `BLOQUEADO_D007` | `BLOQUEADO_OFICIAL` | `SEPARADA_D015_CON_BASELINE_BLOQUEADO` | `SEPARADA_NO_AUTORITATIVA` | `SEPARADA_A001_A002` | `SEPARADA_NO_SUPERPERMISO` | `BLOQUEADO`    |

**Reconciliación:** 14 esperadas; 14 materializadas; 14 claves únicas; 0 faltantes; 0 duplicadas; 11 `NO EVALUADO`; 3 `BLOQUEADO`.

Las tres métricas bloqueadas (`missingCloseCount`, `attendanceRate`, `punctualityRate`) no se elevan mediante A003. Una definición nueva, anotación, permiso de publicación, permiso de exportación o capacidad administrativa no sustituye la corrección y evidencia exigidas por D007.

#### 24. Perfiles A003 para familias analíticas

`CAPACIDADES_SEPARADAS` significa que la etiqueta de familia no es un permiso ni una métrica. Cualquier definición concreta, certificación de resultado, publicación, meta, anotación, exportación o administración exige recurso y autorización propios. El perfil A002 heredado continúa limitando contenido, precisión, población, comparación y detalle.

#### 25. Matriz materializada para las 55 familias analíticas

| Tarea propietaria |    # | Familia canónica                                        | Perfil A002            | Decisión A003           | Estado         |
| ----------------- | ---: | ------------------------------------------------------- | ---------------------- | ----------------------- | -------------- |
| `DATA-DOM-009`    |    1 | ventas netas y brutas                                   | `COMERCIAL_OPERATIVO`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-009`    |    2 | pedidos y conversión                                    | `COMERCIAL_OPERATIVO`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-009`    |    3 | ticket y unidades                                       | `COMERCIAL_OPERATIVO`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-009`    |    4 | mezcla por producto, categoría, canal y sede            | `COMERCIAL_OPERATIVO`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-009`    |    5 | demanda por franja, día y temporada                     | `COMERCIAL_OPERATIVO`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-009`    |    6 | disponibilidad perdida                                  | `COMERCIAL_OPERATIVO`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-009`    |    7 | cancelaciones, devoluciones y descuentos                | `COMERCIAL_OPERATIVO`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-009`    |    8 | promociones y efecto incremental                        | `CLIENTE_SENSIBLE`     | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-009`    |    9 | recurrencia y frecuencia                                | `CLIENTE_SENSIBLE`     | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-009`    |   10 | margen relacionado                                      | `FINANCIERO`           | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-009`    |   11 | capacidad comercial no utilizada                        | `COMERCIAL_OPERATIVO`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-010`    |    1 | existencia disponible y comprometida                    | `INVENTARIO_OPERATIVO` | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-010`    |    2 | cobertura y días de inventario                          | `INVENTARIO_OPERATIVO` | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-010`    |    3 | rotación y permanencia                                  | `INVENTARIO_OPERATIVO` | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-010`    |    4 | faltantes y quiebres                                    | `INVENTARIO_OPERATIVO` | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-010`    |    5 | vencimiento, daño y pérdida                             | `CALIDAD_OPERATIVA`    | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-010`    |    6 | diferencias de conteo                                   | `CALIDAD_OPERATIVA`    | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-010`    |    7 | cumplimiento de remisiones                              | `INVENTARIO_OPERATIVO` | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-010`    |    8 | lead time y cumplimiento de proveedores                 | `PROVEEDOR_COMERCIAL`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-010`    |    9 | compras urgentes                                        | `PROVEEDOR_COMERCIAL`  | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-010`    |   10 | consumo versus plan                                     | `INVENTARIO_OPERATIVO` | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-010`    |   11 | costo de inventario                                     | `FINANCIERO`           | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-010`    |   12 | capacidad de almacenamiento                             | `INVENTARIO_OPERATIVO` | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-011`    |    1 | demanda planificada versus producción                   | `PRODUCCION_OPERATIVA` | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-011`    |    2 | capacidad disponible y utilizada                        | `PRODUCCION_OPERATIVA` | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-011`    |    3 | adherencia al programa                                  | `PRODUCCION_OPERATIVA` | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-011`    |    4 | rendimiento teórico y real                              | `PRODUCCION_OPERATIVA` | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-011`    |    5 | consumo estándar y real                                 | `PRODUCCION_OPERATIVA` | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-011`    |    6 | merma, reproceso y aprovechamiento                      | `CALIDAD_OPERATIVA`    | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-011`    |    7 | calidad, retención y rechazo                            | `CALIDAD_OPERATIVA`    | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-011`    |    8 | tiempo de ciclo                                         | `PRODUCCION_OPERATIVA` | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-011`    |    9 | cumplimiento de liberación                              | `PRODUCCION_OPERATIVA` | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-011`    |   10 | costo y variación por lote, producto y sede             | `FINANCIERO`           | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-012`    |    1 | cumplimiento de promesa                                 | `SERVICIO_OPERATIVO`   | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-012`    |    2 | tiempos de preparación, despacho y entrega              | `SERVICIO_OPERATIVO`   | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-012`    |    3 | pedidos completos                                       | `SERVICIO_OPERATIVO`   | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-012`    |    4 | reclamos y tiempo de resolución                         | `CLIENTE_SENSIBLE`     | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-012`    |    5 | compensaciones                                          | `CLIENTE_SENSIBLE`     | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-012`    |    6 | satisfacción y feedback                                 | `CLIENTE_SENSIBLE`     | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-012`    |    7 | recurrencia, frecuencia y abandono                      | `CLIENTE_SENSIBLE`     | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-012`    |    8 | adquisición y activación                                | `CLIENTE_SENSIBLE`     | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-012`    |    9 | fidelización, puntos y redenciones                      | `CLIENTE_SENSIBLE`     | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-012`    |   10 | reputación y temas recurrentes                          | `CLIENTE_SENSIBLE`     | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-012`    |   11 | reservas, no-show y utilización                         | `CLIENTE_SENSIBLE`     | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-012`    |   12 | valor y rentabilidad del cliente cuando esté autorizado | `CLIENTE_FINANCIERO`   | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-013`    |    1 | costos estándar y reales                                | `FINANCIERO`           | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-013`    |    2 | variaciones                                             | `FINANCIERO`           | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-013`    |    3 | margen y contribución                                   | `FINANCIERO`           | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-013`    |    4 | gastos                                                  | `FINANCIERO`           | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-013`    |    5 | centros de costo                                        | `FINANCIERO`           | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-013`    |    6 | presupuesto y forecast                                  | `FINANCIERO`           | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-013`    |    7 | caja, bancos y tesorería                                | `FINANCIERO`           | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-013`    |    8 | cartera y obligaciones                                  | `FINANCIERO`           | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-013`    |    9 | rentabilidad multidimensional                           | `FINANCIERO`           | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |
| `DATA-DOM-013`    |   10 | escenarios y simulaciones                               | `FINANCIERO`           | `CAPACIDADES_SEPARADAS` | `ESPECIFICADO` |

**Reconciliación:** `11 + 12 + 10 + 12 + 10 = 55`; 55 esperadas; 55 materializadas; 0 faltantes; 0 duplicadas.

Reglas transversales:

- una familia no crea por sí sola una definición ejecutable de métrica;
- certificación se emite sobre una coordenada concreta, no sobre el nombre genérico de la familia;
- publicación y exportación siguen siendo acciones distintas incluso cuando consumen el mismo resultado;
- una meta solo se fija sobre un objetivo que referencia una métrica gobernada y una baseline válida;
- una anotación de diagnóstico, oportunidad o resultado no eleva confianza ni calidad;
- administración de una familia no permite cambiar datos de dominio ni ampliar su acceso;
- perfiles `CLIENTE_SENSIBLE`, `CLIENTE_FINANCIERO` y `FINANCIERO` conservan las restricciones A001/A002 sin excepción administrativa.

#### 26. Matriz materializada para las seis familias de artefacto D008

|    # | Familia          | Relación con capacidades A003                                                                                    | Estado         |
| ---: | ---------------- | ---------------------------------------------------------------------------------------------------------------- | -------------- |
|    1 | tablero          | Publicar o hacer oficial el tablero requiere `PUBLISH`; exportarlo requiere además `EXPORT`.                     | `ESPECIFICADO` |
|    2 | reporte          | Emitir una edición oficial requiere `PUBLISH`; producir una copia portable adicional requiere `EXPORT`.          | `ESPECIFICADO` |
|    3 | exportación      | Su acción primaria es `EXPORT`; existir como archivo no la convierte en publicación oficial ni en fuente.        | `ESPECIFICADO` |
|    4 | suscripción      | Administrar la regla de entrega no concede `PUBLISH` ni `EXPORT`; cada entrega conserva autorización vigente.    | `ESPECIFICADO` |
|    5 | alerta           | Emitir la señal no concede `SET_TARGET`, `ANNOTATE`, `DEFINE` ni autoridad para ejecutar acciones empresariales. | `ESPECIFICADO` |
|    6 | snapshot oficial | Crear una publicación inmutable exige `PUBLISH`; certificación y exportación permanecen decisiones separadas.    | `ESPECIFICADO` |

**Reconciliación:** 6 esperadas; 6 materializadas; 0 faltantes; 0 duplicadas.

#### 27. Escenarios de decisión obligatorios

| Escenario                                                                                  | Resultado A003                                                                                            |
| ------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------- |
| propietario define una nueva versión y luego intenta certificarla solo por ser propietario | `DENY` salvo que exista `CERTIFY` separado y la política de segregación permita esa coincidencia de actor |
| steward mantiene metadatos y pretende publicar                                             | `DENY`; stewardship no concede `PUBLISH`                                                                  |
| certificador emite `CERTIFICADO` y el sistema publica automáticamente                      | `DENY`; publicación requiere `PUBLISH` independiente                                                      |
| publicador intenta cambiar fórmula antes de emitir reporte                                 | `DENY`; requiere `DEFINE` separado sobre la definición gobernada                                          |
| responsable de meta modifica baseline observado para alcanzar el objetivo                  | `DENY`; `SET_TARGET` no modifica hechos ni baseline                                                       |
| responsable de medición cambia la meta desde el resultado observado                        | `DENY`; medición no concede `SET_TARGET`                                                                  |
| anotador marca una métrica como certificada dentro de una nota                             | `DENY`; la anotación no modifica D007                                                                     |
| anotador cambia una meta editando el texto visible                                         | `DENY`; la meta requiere `SET_TARGET`                                                                     |
| actor con lectura exporta una tabla completa                                               | `DENY` sin `EXPORT`; la lectura no se amplía por formato                                                  |
| actor con `EXPORT` solicita columnas ocultas o celdas suprimidas                           | `DENY` por A002 aunque posea capacidad de exportación                                                     |
| publicador intenta reutilizar una exportación como snapshot oficial                        | `DENY`; requiere `PUBLISH` sobre un artefacto D008 válido                                                 |
| administrador pretende asignarse `CERTIFY` o neutralizar una denegación                    | `DENY`; `ADMINISTER` no administra autoridad de seguridad ni vence denies                                 |
| custodio técnico usa service role para certificar o publicar                               | `DENY`; capacidad técnica no equivale a actor empresarial autorizado                                      |
| métrica `BLOQUEADO` se intenta publicar como oficial                                       | `DENY` mientras persista la condición D007                                                                |
| objeto AURA bloqueado se intenta certificar usando una hoja o copia paralela               | `DENY`; no existe fuente sustituta autorizada                                                             |
| misma persona posee dos grants separados y la política exige actores distintos             | `DENY` para la segunda acción incompatible                                                                |
| misma persona posee dos grants separados y la política permite acumulación                 | reevaluar cada acción por separado; nunca heredar la decisión anterior                                    |
| restatement se intenta publicar sobre la edición previa                                    | crear decisión/publicación nueva conforme a D017; no sobrescribir historia                                |
| simulación devuelve `WOULD_ALLOW` para publicar o exportar                                 | `DENY` para el efecto real; debe salir de simulación y emitir solicitud real nueva                        |

#### 28. Historia, restatements y decisiones previas

- cambiar una definición no reescribe el significado histórico de una versión anterior;
- recertificar no altera la evidencia ni el estado histórico emitido para otro corte;
- cambiar meta conserva la meta anterior, su periodo y la decisión que la produjo;
- corregir una anotación crea una relación de corrección/supersesión sin borrar la anterior cuando tenga valor histórico;
- una publicación corregida o restatement crea una edición distinguible;
- una nueva exportación no modifica la copia ya emitida;
- administración de workflow nunca edita retrospectivamente una decisión para aparentar que una función distinta la tomó.

#### 29. Handoffs con propietario documental exacto

| Decisión o materialización fuera del alcance                                                       | Propietario documental                                        | Condición de salida                                              |
| -------------------------------------------------------------------------------------------------- | ------------------------------------------------------------- | ---------------------------------------------------------------- |
| auditoría detallada de consultas, exportaciones, suscripciones, alertas, modelos y recomendaciones | `DATA-AUTH-004`                                               | antes de considerar trazable la operación analítica productiva   |
| experiencia de matriz, estados, publicación, metas, anotaciones y bloqueos                         | `DATA-UX-001` a `DATA-UX-008`                                 | antes de implementar superficies de gobierno y analítica         |
| binding físico de definiciones, calidad, artefactos, objetivos, consultas y modelos                | `DATA-INT-001` a `DATA-INT-004` según el recurso              | antes de materializar integración o capa semántica productiva    |
| permisos técnicos, catálogo, evaluadores, RLS/RPC y enforcement                                    | bloques AUTH/C/SHELL y E3/E5 aplicables                       | antes de habilitar una de las siete acciones en runtime          |
| clasificación, finalidad, campos, destinatarios y salidas de información                           | `INFO-AUTH-001` a `INFO-AUTH-004`                             | en toda acción que exponga o transfiera información gobernada    |
| versiones, restatements y reconstrucción histórica                                                 | `DATA-DOM-017`                                                | antes de reexpresar o republicar resultados históricos           |
| cambios físicos de Supabase                                                                        | tareas E3/BLOQUE R y paquetes autorizados desde `vento-shell` | únicamente en una fase de implementación expresamente autorizada |

No queda una decisión material de A003 diferida sin propietario documental y condición de salida. La ausencia de un binding técnico para una acción se resuelve con denegación por defecto y no altera el contrato documental ya cerrado.

#### 30. Cobertura de requisitos de prueba vigente

La conducta materializada por esta tarea ya se encuentra cubierta por requisitos vigentes:

- `TREQ-DATA-001` protege identidad, propiedad, stewardship, fuente de verdad y gobierno de maestros y asigna responsabilidad a `DATA-AUTH-003`;
- `TREQ-DATA-002` protege definición/versionado de métricas, propietario, fórmula, certificación, drill-down y comparabilidad y asigna responsabilidad a `DATA-AUTH-003`;
- `TREQ-DATA-004` protege la separación de artefactos, publicación, exportación, snapshots y estado de calidad y asigna responsabilidad a `DATA-AUTH-001` a `DATA-AUTH-004`;
- `TREQ-DATA-005` exige separar señal, diagnóstico, hipótesis, acción, experimento, responsable, baseline, meta, KPI, drivers, guardrails, resultado, aprendizaje y decisión y asigna responsabilidad a `DATA-AUTH-003`;
- `TREQ-AUTH-001` exige permiso, contexto y alcance canónicos en toda capacidad protegida;
- `TREQ-AUTH-002` exige que toda clave de permiso consumida exista en el catálogo vigente y prohíbe strings huérfanos o inventados;
- `TREQ-AUTH-010` protege segregación de funciones y evita que una concesión individual neutralice prohibiciones transversales;
- `TREQ-AUTH-013` exige validación server-side de permiso exacto, actor, territorio, recurso, estado y campos para toda mutación;
- `TREQ-AUTH-015` exige evidencia correlacionable de actor, permiso, recurso, decisión, razones y versión;
- `TREQ-SHELL-011` protege consulta, exportación, compartición y administración de información mediante acción exacta, finalidad, clasificación, recurso, relación, territorio, estado y destinatario.

A003 especializa y materializa esas obligaciones para las siete acciones de gobierno de datos. No introduce una nueva superficie ejecutable ni cambia texto, estado, relación, prioridad, paquete o evidencia de los requisitos vigentes.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la segregación de capacidades, ausencia de herencia por rol/propiedad/administración, separación de artefactos, metas, exportación, permiso exacto, validación server-side, segregación de funciones y evidencia ya están protegidas por `TREQ-DATA-001`, `TREQ-DATA-002`, `TREQ-DATA-004`, `TREQ-DATA-005`, `TREQ-AUTH-001`, `TREQ-AUTH-002`, `TREQ-AUTH-010`, `TREQ-AUTH-013`, `TREQ-AUTH-015` y `TREQ-SHELL-011`. Esta tarea materializa su aplicación al dominio DATA sin crear permisos, tablas, APIs, acciones ejecutables o un comportamiento técnico adicional fuera de esa cobertura.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

#### 31. Criterios de aceptación

1. existen exactamente siete acciones A003: `DEFINE`, `CERTIFY`, `PUBLISH`, `SET_TARGET`, `ANNOTATE`, `EXPORT` y `ADMINISTER`;
2. los siete nombres son tipos documentales y no se presentan como claves técnicas de permiso;
3. ninguna acción hereda autorización de otra;
4. propiedad funcional no constituye permiso;
5. stewardship no constituye permiso;
6. custodia técnica no constituye autoridad empresarial;
7. ningún rol base, operativo, cargo o jerarquía recibe una de las siete capacidades por inferencia;
8. toda acción exige permiso canónico exacto y vigente;
9. una clave de permiso ausente no se sustituye por wildcard, prefijo, rol, aplicación o string local;
10. toda acción resuelve recurso y versión exactos;
11. toda acción resuelve actor efectivo, scope y finalidad;
12. una denegación aplicable prevalece sobre cualquier función o grant incompatible;
13. `DEFINE` no certifica;
14. `DEFINE` no publica;
15. `DEFINE` no fija meta;
16. `CERTIFY` utiliza exclusivamente estados D007 y no corrige la fuente;
17. `CERTIFY` no publica;
18. `PUBLISH` no cambia la certificación;
19. `PUBLISH` no concede exportación;
20. un artefacto con dependencia `BLOQUEADO` no se publica como oficial;
21. `NO EVALUADO` no se rotula como `CERTIFICADO`;
22. `SET_TARGET` no cambia fórmula ni baseline observado;
23. una fuente o métrica `BLOQUEADO` no produce baseline oficial por una capacidad de meta;
24. fijar una meta no crea automáticamente alerta ni acción empresarial;
25. `ANNOTATE` no cambia datos, fórmula, certificación, meta ni publicación;
26. una corrección de anotación conserva historia o supersesión cuando corresponda;
27. `EXPORT` exige A001 y A002 además de su capacidad propia;
28. lectura o publicación no conceden `EXPORT`;
29. `EXPORT` no reintroduce columnas ocultas ni celdas suprimidas;
30. una exportación no se convierte en fuente de verdad ni publicación oficial;
31. `ADMINISTER` no es superpermiso;
32. `ADMINISTER` no puede autootorgar otra capacidad ni neutralizar denegaciones;
33. una operación administrativa que produzca un efecto de otra acción se reautoriza como esa acción;
34. dos capacidades en el mismo actor requieren autorizaciones independientes;
35. una política de independencia de actor no se satisface cambiando la etiqueta funcional de la misma persona;
36. si la política de segregación necesaria no puede resolverse, la acción posterior se deniega;
37. principal técnico, service role, job o integración no se convierten en actor humano autorizado;
38. simulación no ejecuta ninguna de las siete acciones;
39. se materializan exactamente 62 objetos con decisión A003 explícita;
40. se preservan 43 maestros, 19 referencias, 59 `ESPECIFICADO` y 3 AURA `BLOQUEADO`;
41. se materializan exactamente 14 métricas y se preservan 11 `NO EVALUADO` y 3 `BLOQUEADO`;
42. las tres métricas bloqueadas no se elevan por definición, publicación, anotación, exportación o administración;
43. se materializan exactamente 55 familias con distribución `11 + 12 + 10 + 12 + 10`;
44. cada familia conserva perfil A002 y separación A003;
45. se materializan exactamente seis familias de artefacto D008;
46. certificación y publicación permanecen distintas en los seis artefactos;
47. publicación y exportación permanecen distintas;
48. restatements y publicaciones corregidas conservan la edición/historia previa;
49. no se crea ni asigna ninguna clave de permiso, rol, grant o excepción;
50. no se modifica código, DDL, DML, RLS, RPC, datos, migraciones, backfills, despliegues o Supabase;
51. no se crea ni modifica ningún requisito de prueba;
52. `DATA-AUTH-004` permanece únicamente reservada.

#### 32. Balance de cierre

| Control                                        |                  Resultado |
| ---------------------------------------------- | -------------------------: |
| Capacidades A003 esperadas / materializadas    |                  **7 / 7** |
| Objetos esperados / materializados             |                **62 / 62** |
| Datos maestros / referencias preservados       |                **43 / 19** |
| Objetos AURA bloqueados preservados            |                  **3 / 3** |
| Métricas esperadas / materializadas            |                **14 / 14** |
| Métricas `NO EVALUADO` / `BLOQUEADO`           |                 **11 / 3** |
| Familias analíticas esperadas / materializadas |                **55 / 55** |
| Distribución D009-D013                         | **11 + 12 + 10 + 12 + 10** |
| Artefactos D008 esperados / materializados     |                  **6 / 6** |
| Claves de permiso creadas                      |                      **0** |
| Roles o grants asignados                       |                      **0** |
| Cambios físicos                                |                      **0** |
| Requisitos TREQ nuevos o modificados           |                      **0** |

#### 33. Continuidad

ÚLTIMA TAREA APROBADA
`DATA-AUTH-002 — Proteger información sensible, poblaciones pequeñas, comparaciones, exportaciones y drill-down`

TAREA ACTUAL APROBADA
`DATA-AUTH-003 — Separar definición, certificación, publicación, fijación de metas, anotación, exportación y administración`

SIGUIENTE TAREA RESERVADA
`DATA-AUTH-004 — Auditar consultas, descargas, suscripciones, alertas, modelos y recomendaciones`


### ✅ DATA-AUTH-004 — Auditar consultas, descargas, suscripciones, alertas, modelos y recomendaciones

**Estado:** APROBADA
**Tarea anterior:** `DATA-AUTH-003 — Separar definición, certificación, publicación, fijación de metas, anotación, exportación y administración` — APROBADA
**Tarea siguiente:** `DATA-UX-001 — Diseñar inicio ejecutivo simple y accionable por rol` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de auditoría y trazabilidad para consumo, distribución y automatización analítica
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, DDL, DML, migraciones, RLS, RPC, grants, backfills, cambios de datos, despliegues o cambios en Supabase:** no autorizados
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo Vento OS conserva evidencia correlacionable y minimizada de las operaciones analíticas que pueden revelar, distribuir, transformar o influir sobre información gobernada, sin convertir el registro de auditoría en una nueva fuente de verdad, un repositorio de datos sensibles, un mecanismo de autorización o una prueba automática de calidad.

La tarea cubre exactamente las seis familias expresadas en su título:

1. consultas;
2. descargas;
3. suscripciones;
4. alertas;
5. modelos;
6. recomendaciones.

La auditoría deberá permitir reconstruir quién o qué proceso solicitó la operación, bajo qué autoridad y finalidad, sobre qué recurso y versión, qué población y contexto se utilizaron, qué decisión de autorización aplicó, qué resultado lógico ocurrió y cómo se relaciona con operaciones anteriores o posteriores, sin registrar más contenido del necesario para esa finalidad de evidencia.

---

#### 2. Resultado sustantivo

Queda materializada la especialización analítica de trazabilidad con los siguientes resultados:

- seis familias auditables definidas y separadas;
- un sobre lógico de auditoría analítica compatible con `NFR-AUDIT-EVENT-ENVELOPE-001`;
- separación entre operación empresarial, intento técnico, decisión de autorización, resultado analítico y efecto posterior;
- correlación obligatoria entre consultas, artefactos portables, entregas de suscripción, ocurrencias de alerta, ejecuciones de modelos y recomendaciones derivadas;
- registro de denegaciones, reintentos, fallos y operaciones administrativas sin convertir indisponibilidad técnica en una decisión empresarial falsa;
- minimización del propio registro de auditoría para impedir que logs, trazas o metadatos recreen información protegida;
- preservación de versión semántica, corte, población, dimensiones, filtros, calidad, regla de divulgación y artefacto cuando sean materiales para reproducir la operación;
- separación entre generación de una exportación y ocurrencia de una descarga;
- separación entre definición de una suscripción y cada evaluación o entrega;
- separación entre evaluación de una regla de alerta, ocurrencia de la señal y entrega al destinatario;
- separación entre ejecución de modelo, resultado predictivo o analítico, recomendación y eventual acción empresarial;
- decisiones explícitas para 62 objetos, 14 métricas, 55 familias analíticas y seis familias de artefacto D008;
- preservación de los tres objetos AURA bloqueados y de las tres métricas de asistencia bloqueadas;
- cero permisos, roles, fuentes, métricas, modelos, recomendaciones o mecanismos físicos inventados;
- cero cambios de requisitos de prueba.

---

#### 3. Entradas canónicas consumidas

A004 consume sin redefinir:

- `DATA-AUTH-001`, que forma el conjunto autorizado por dominio, entidad, territorio y finalidad;
- `DATA-AUTH-002`, que protege campos, poblaciones pequeñas, comparaciones, exportaciones y drill-down;
- `DATA-AUTH-003`, que separa definición, certificación, publicación, metas, anotación, exportación y administración;
- `DATA-DOM-004` y `DATA-DOM-017`, para identidad y versión semántica e historia reproducible;
- `DATA-DOM-007`, para estados de calidad y certificación;
- `DATA-DOM-008`, para tablero, reporte, exportación, suscripción, alerta y snapshot oficial;
- `DATA-DOM-009` a `DATA-DOM-013`, para las 55 familias analíticas;
- `DATA-DOM-014`, para diagnóstico, modelos, confianza, causalidad y recomendaciones;
- `DATA-DOM-015` y `DATA-DOM-016`, para metas, planes de medición, intervenciones y comprobación;
- `INFO-AUTH-004`, para independencia, protección de logs, investigaciones, accesos extraordinarios y evidencia preservada;
- `NFR-REQ-005`, para clasificación, minimización y protección de logs, métricas, trazas, exportaciones y metadatos;
- `NFR-REQ-006`, para identidad de evento, recurso, correlación, causalidad, evidencia, retención e integridad;
- `TREQ-AUTH-015`, `TREQ-SHELL-011`, `TREQ-DATA-004` y `TREQ-DATA-005` como cobertura de prueba ya vigente.

A004 no modifica ninguna de esas decisiones y no sustituye a `DATA-INT-002` o `DATA-INT-004` para materialización técnica.

---

#### 4. Fronteras conceptuales obligatorias

```text
AUDITORÍA ≠ AUTORIZACIÓN
AUDITORÍA ≠ FUENTE DE VERDAD
AUDITORÍA ≠ LOG COMPLETO DE PAYLOAD
AUDITORÍA ≠ CERTIFICACIÓN
AUDITORÍA ≠ PUBLICACIÓN
AUDITORÍA ≠ CAUSALIDAD
AUDITORÍA ≠ EJECUCIÓN DE UNA RECOMENDACIÓN
```

Reglas:

1. registrar una operación no la vuelve autorizada;
2. ausencia de evidencia requerida puede impedir considerar trazable una operación, pero no convierte un evento posterior en autorización retroactiva;
3. un evento de auditoría nunca reemplaza el objeto, hecho, métrica, reporte, modelo o decisión que referencia;
4. auditoría conserva evidencia de la decisión de autorización; no vuelve a decidir permisos por su cuenta;
5. un evento técnico no se presenta como acción empresarial si el efecto empresarial no ocurrió;
6. una denegación también conserva evidencia segura cuando el contrato transversal lo exige;
7. la evidencia de un fallo técnico se distingue de una decisión `DENY` y no imputa falta de permiso al actor;
8. un administrador de plataforma, base de datos, observabilidad o BI no obtiene por ello derecho a consultar o alterar evidencia analítica protegida;
9. el actor investigado no puede borrar, sustituir o editar la evidencia para neutralizar la investigación;
10. la propia auditoría hereda sensibilidad y retención conforme a INFO y NFR.

---

#### 5. Sobre lógico mínimo de auditoría analítica

A004 especializa, sin reemplazarlo, el sobre `NFR-AUDIT-EVENT-ENVELOPE-001`. Según aplicabilidad, una operación analítica deberá poder conservar:

| Dimensión            | Evidencia mínima                                                                                               |
| -------------------- | -------------------------------------------------------------------------------------------------------------- |
| identidad del evento | identificador estable del evento, tipo y versión del contrato de evento                                        |
| tiempo               | ocurrencia, registro y zona horaria cuando sea material para interpretación                                    |
| principal y actor    | principal autenticado, actor efectivo y principal técnico o proceso cuando actúe un job o servicio             |
| contexto             | aplicación, dispositivo, sede, área, relación y demás contexto efectivo que haya condicionado la operación     |
| acción               | familia auditable y acción exacta realmente solicitada o ejecutada                                             |
| recurso              | tipo, identidad y versión del recurso, artefacto, métrica, modelo o recomendación                              |
| finalidad            | propósito empresarial que justificó el acceso o procesamiento                                                  |
| autorización         | referencia a la decisión aplicable, permiso exacto y versiones contractuales cuando existan                    |
| alcance              | territorio, población, periodo, corte, filtros y dimensiones materiales                                        |
| protección           | clasificación, política de campos, regla de divulgación y modo efectivo cuando hayan condicionado la salida    |
| calidad              | estado D007, frescura, cobertura y bloqueo aplicables al resultado consumido                                   |
| resultado            | resultado lógico y efecto realmente confirmado, sin inferir éxito a partir de una respuesta parcial            |
| distribución         | destinatario, canal, destino o audiencia cuando exista entrega o salida                                        |
| correlación          | solicitud, operación lógica, correlación, causalidad, intento e idempotencia cuando apliquen                   |
| evidencia            | referencias protegidas, integridad, versión o huella necesaria para reproducir sin duplicar contenido sensible |
| ciclo de vida        | corrección, supersesión, retención y hold mediante las referencias NFR aplicables                              |

La ausencia de una dimensión que materialmente determine autorización, población, versión o resultado no podrá ocultarse sustituyéndola por `null`, un valor genérico o un texto libre no reproducible.

---

#### 6. Minimización del registro de auditoría

El evento de auditoría conserva evidencia, no una segunda copia del dato consultado.

Queda establecido:

- secretos, tokens, PIN, credenciales, claves privadas y firmas completas nunca forman parte del payload ordinario de auditoría;
- datos personales, laborales, financieros, médicos, comerciales o técnicos sensibles se conservan mediante referencias protegidas, identificadores opacos, redacción o evidencia separada cuando sea suficiente;
- filtros sensibles no se registran como texto completo si una representación protegida permite reproducir la condición;
- resultados de consultas no se almacenan fila por fila dentro del evento;
- celdas suprimidas, poblaciones pequeñas y miembros excluidos por A002 no reaparecen en logs, métricas, tooltips de auditoría o metadatos;
- prompts, features, embeddings, documentos y datasets de un modelo no se duplican por defecto en el evento; se conserva la referencia y versión necesarias;
- una explicación o recomendación sensible puede requerir referencia protegida en lugar de texto completo;
- conteos o metadatos cuya precisión permita inferencia se someten a la misma protección A002;
- la evidencia más detallada, cuando sea necesaria, permanece separada y autorizada conforme a INFO/NFR.

---

#### 7. Matriz de las seis familias auditables

|    # | Familia       | Unidad lógica auditada                                                         | Evidencia específica mínima                                                                                                                                                                        | Separación obligatoria                                                                                                                               |
| ---: | ------------- | ------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | consulta      | una solicitud analítica protegida y su resultado lógico                        | actor o proceso, finalidad, recurso, métricas/versiones, corte, población, filtros/dimensiones, autorización, protección, calidad y resultado                                                      | una consulta empresarial puede ejecutar varias operaciones técnicas; no se exige convertir cada sentencia interna en una acción empresarial distinta |
|    2 | descarga      | la obtención efectiva de un artefacto portable o contenido autorizado          | artefacto/version, clasificación, corte, alcance, columnas o proyección, destinatario cuando aplique, integridad y resultado                                                                       | generar una exportación, emitir un enlace temporal y obtener el artefacto son hechos distinguibles y correlacionables                                |
|    3 | suscripción   | configuración o cambio gobernado y cada evaluación o entrega                   | identidad de suscripción, artefacto o métricas, política de versión, cadencia o condición, destinatarios, canal, corte, autorización vigente y resultado                                           | crear o administrar la regla no congela permiso; cada entrega reevalúa y conserva su propia evidencia                                                |
|    4 | alerta        | evaluación de regla, ocurrencia de señal y entrega cuando exista               | regla/version, métrica o condición, corte, alcance, calidad, valor o estado protegido necesario, destinatario, canal y resultado                                                                   | evaluación, señal, notificación, diagnóstico, recomendación y acción permanecen hechos distintos                                                     |
|    5 | modelo        | ejecución o consumo de un modelo analítico o predictivo sobre datos gobernados | propósito, identidad/version del modelo, datos o snapshot de entrada por referencia, corte, variables o contrato de entrada, población autorizada, configuración/version, resultado y limitaciones | ejecución de modelo no certifica datos, no prueba causalidad y no concede una acción empresarial                                                     |
|    6 | recomendación | generación, presentación o revisión de una recomendación gobernada             | origen diagnóstico/modelo/evidencia, versión/contexto, objetivo o proceso afectado, confianza y límites, destinatario y resultado de revisión cuando exista                                        | recomendación no equivale a decisión, meta, intervención ni ejecución                                                                                |

**Reconciliación:** 6 familias esperadas; 6 materializadas; 0 faltantes; 0 duplicadas.

---

#### 8. Consultas

Toda consulta analítica protegida deberá dejar una unidad lógica correlacionable cuando el contrato de trazabilidad aplicable lo exija.

Incluye, según el producto y la operación real:

- carga o actualización de un tablero;
- aplicación de filtros o dimensiones que cambien materialmente la población o el resultado;
- búsqueda analítica protegida;
- drill-down hacia otro nivel o recurso;
- apertura de un reporte o snapshot restringido;
- consulta server-side usada para un análisis, modelo o recomendación.

Reglas:

1. filtros del cliente solo reducen el conjunto autorizado y la evidencia debe poder demostrar esa frontera;
2. cada salto de drill-down que constituya nueva solicitud conserva su decisión y correlación propias;
3. una consulta denegada no registra títulos, nombres, fragmentos o metadatos que revelen el recurso protegido;
4. paginación, búsqueda, conteos y metadatos no quedan fuera de la auditoría cuando sean materialmente sensibles;
5. el registro conserva `metric_key` y versión semántica cuando una métrica participa, no una fórmula local de la pantalla;
6. consultas internas que formen parte de una sola operación lógica pueden correlacionarse como intentos o efectos técnicos sin multiplicar artificialmente la acción empresarial;
7. una herramienta BI o IA conserva el actor o principal técnico, la finalidad y el recurso empresarial; su credencial técnica no sustituye la autorización.

---

#### 9. Descargas y artefactos portables

A004 distingue la autorización de exportación definida en A003 de la evidencia de una obtención material.

Reglas:

1. una consulta autorizada no prueba que exista autoridad para exportar o producir una copia portable;
2. el evento de generación de una exportación y el evento de obtención del artefacto se correlacionan pero no se confunden;
3. si se usa un enlace temporal, la emisión del vínculo no concede autoridad y la obtención efectiva conserva su propia evidencia cuando el mecanismo lo permita;
4. el evento registra la proyección autorizada, no las columnas ocultas o celdas suprimidas;
5. clasificación, corte, versiones, filtros y dimensiones del artefacto permanecen trazables después de cambiar de formato;
6. una nueva generación o una nueva obtención no reescribe la evidencia de una anterior;
7. un fallo después de iniciar transferencia no se presenta como entrega íntegra sin evidencia suficiente;
8. integridad del artefacto se conserva mediante la referencia aprobada por NFR o el contrato físico futuro; A004 no inventa un algoritmo o almacenamiento concreto;
9. el contenido del archivo no se duplica dentro del log ordinario.

---

#### 10. Suscripciones

La suscripción tiene al menos dos planos auditables: gobierno de la regla y ejecuciones de entrega.

Para la regla se conserva, según aplicabilidad:

- identidad de la suscripción;
- actor que la crea, modifica, pausa, reactiva o termina;
- artefacto o métricas gobernadas;
- política de versión;
- cadencia o condición;
- filtros, dimensiones y alcance;
- destinatarios y canal;
- finalidad;
- autorización y versiones que permitieron el cambio.

Para cada evaluación o entrega:

- se resuelve nuevamente autorización, clasificación, población y calidad;
- se conserva el corte y la versión realmente usados;
- se registra si la entrega fue producida, suprimida, bloqueada o falló conforme al resultado real del mecanismo, sin convertir esos términos en un enum técnico obligatorio;
- un destinatario retirado o sin autoridad vigente no conserva acceso por haber estado incluido antes;
- reintentos se correlacionan con la misma entrega lógica y no justifican efectos duplicados;
- una dependencia `BLOQUEADO` no se presenta como entrega oficial completa.

---

#### 11. Alertas

La auditoría de alertas separa evaluación, señal y distribución.

Debe poder responder:

```text
qué regla y versión se evaluaron
qué métrica, dato o condición participaron
qué periodo o instante y qué corte aplicaron
qué población, territorio y dimensiones se evaluaron
qué estado de calidad era vigente
si la condición produjo o no una señal
qué destinatario y canal recibieron una notificación, cuando ocurrió
qué operación posterior se correlacionó, si existió
```

Reglas:

1. cero, ausencia, desconocido, no recibido y dato pendiente no se colapsan en un mismo resultado;
2. una alerta basada en datos degradados conserva ese estado;
3. el evento no inventa un umbral; referencia la regla gobernada que fue evaluada;
4. una alerta no constituye diagnóstico, causa, recomendación ni acción;
5. la entrega a cada destinatario conserva autorización y resultado cuando esa separación sea material;
6. una alerta sensible no reproduce en el texto de auditoría el dato o sujeto que A002 protege;
7. reevaluar una regla no borra la ocurrencia anterior ni la convierte retrospectivamente en falsa.

---

#### 12. Modelos

A004 gobierna evidencia de uso y resultado; `DATA-INT-004` conserva la integración técnica futura con BI, modelos externos e inteligencia artificial.

Toda ejecución o consumo gobernado de un modelo deberá poder atribuir, cuando aplique:

- propósito empresarial;
- identidad y versión del modelo;
- actor efectivo o proceso técnico responsable;
- fuente, dataset, snapshot o conjunto de datos de entrada mediante referencia y versión;
- corte y periodo;
- población autorizada;
- variables, features o contrato de entrada mediante referencia versionada;
- configuración o versión de parámetros materialmente relevantes;
- estado de calidad y limitaciones de las entradas;
- resultado mediante referencia protegida;
- nivel de confianza, limitaciones o condición de uso cuando el contrato del modelo los defina;
- correlación con consulta, diagnóstico, alerta, objetivo o recomendación que lo consumió.

Reglas:

1. un modelo no recibe más población, campos o precisión por necesitar variables adicionales;
2. una credencial de proveedor o `service_role` no es autoridad empresarial;
3. prompts, features, embeddings y outputs pueden adquirir sensibilidad y se minimizan en la auditoría;
4. el registro no declara causalidad por existir score, importancia de variable, explicación o precisión predictiva;
5. un modelo no certifica su propio dataset ni su resultado;
6. una ejecución automatizada conserva identidad técnica y finalidad, no un actor humano ficticio;
7. cambios de modelo, versión, dataset o configuración material no se ocultan bajo una misma evidencia;
8. si no puede reconstruirse la versión necesaria, la evidencia no se presenta como replay reproducible.

---

#### 13. Recomendaciones

Una recomendación es un resultado informativo o asistido que puede orientar una evaluación o decisión; no es por sí misma una instrucción ejecutable.

Toda recomendación gobernada deberá poder conservar, cuando aplique:

- origen en diagnóstico, modelo, regla o evidencia;
- versión y corte de sus fuentes;
- finalidad y objetivo o proceso al que se dirige;
- población y alcance sobre los que fue calculada;
- confianza, incertidumbre y limitaciones disponibles;
- guardrails o restricciones que deban acompañar su interpretación;
- actor o proceso que la generó;
- actor, audiencia o proceso al que fue presentada;
- referencia protegida al contenido cuando el texto sea sensible;
- decisión posterior de aceptar, rechazar, ignorar, investigar o convertir en propuesta cuando el proceso propietario produzca efectivamente ese resultado, sin imponer un enum técnico universal;
- correlación con una acción o experimento D016 únicamente cuando esa acción exista de forma independiente y autorizada.

Reglas:

1. una recomendación no fija metas ni modifica una baseline;
2. no eleva certificación o confianza de sus fuentes;
3. no demuestra causalidad;
4. no ejecuta cambios empresariales automáticamente;
5. una IA no puede por sí sola certificar datos, declarar causa, fijar meta o aprobar una acción;
6. contenido sensible se minimiza tanto en la presentación como en la evidencia;
7. la decisión humana o empresarial posterior conserva actor, autoridad y proceso propios y no se atribuye al modelo por inferencia.

---

#### 14. Correlación, intentos, reintentos e idempotencia

La auditoría deberá distinguir una operación lógica de sus intentos técnicos.

- `correlation_id` y `causation_id` de NFR vinculan cadena y causa sin convertir una en la otra;
- `request_id`, `command_id`, intento e idempotencia se conservan cuando existan en el contrato ejecutor;
- un reintento conserva evidencia aunque no produzca un segundo efecto empresarial;
- la misma operación lógica con respuesta perdida no se registra como dos entregas confirmadas si el mecanismo demuestra una sola;
- un intento con payload, versión o precondición incompatible no se fusiona silenciosamente con la evidencia anterior;
- rollback o compensación se registra como hecho posterior relacionado y no borra el evento original;
- si no puede demostrarse si un efecto ocurrió, el registro conserva la incertidumbre y remite al proceso propietario de reconciliación; no inventa éxito ni rollback.

---

#### 15. Integridad, independencia y acceso a la propia auditoría

A004 hereda las reglas de INFO-AUTH-004 y NFR-006:

1. la evidencia cerrada no se edita para cambiar el pasado;
2. correcciones y supersesiones se relacionan de forma aditiva;
3. retención, hold, archivo, disposición y anonimización permanecen bajo políticas NFR/INFO aplicables;
4. el actor que ejecutó una operación no obtiene por ello capacidad para administrar o retirar su evidencia;
5. el custodio técnico puede mantener infraestructura sin adquirir derecho empresarial al contenido;
6. la lectura, investigación, exportación o administración de la propia auditoría requieren autoridad diferenciada conforme al gobierno de información;
7. una investigación no amplía el acceso a objetos, métricas o poblaciones fuera de su finalidad;
8. evidencia preservada puede mantener referencia a un recurso retirado sin reactivar ese recurso o su acceso.

---

#### 16. Historia, correcciones y reproducibilidad

- una corrección de datos o un restatement no altera silenciosamente el evento que documentó qué se conocía y usó entonces;
- una reproducción posterior genera evidencia nueva vinculada al evento original y fija las versiones usadas;
- un modelo reejecutado con una versión nueva no se presenta como la misma ejecución histórica;
- una recomendación recalculada no sustituye la recomendación que fue presentada antes;
- una alerta corregida puede generar nueva señal, anotación o relación, pero la ocurrencia original permanece;
- una suscripción corregida no reescribe entregas anteriores;
- una exportación o descarga posterior no altera el artefacto entregado antes;
- la auditoría conserva diferencia entre resultado conocido entonces y resultado reconstruido ahora.

---

#### 17. Principios para herramientas BI, hojas, modelos externos e IA

- BI consume únicamente la proyección protegida autorizada y sus consultas quedan bajo el mismo contrato de auditoría;
- una hoja derivada no se convierte en autoridad ni permite retirar supresiones;
- un modelo externo conserva proveedor o integración, versión y contrato de entrada cuando `DATA-INT-004` los materialice;
- una IA no recibe datos adicionales por conveniencia técnica;
- el proveedor técnico no se convierte en propietario ni destinatario autorizado por inferencia;
- el registro no almacena secretos de integración ni contenido sensible completo para facilitar soporte;
- herramientas externas no pueden mantener una auditoría paralela como única evidencia canónica si Vento OS necesita reconstruir la operación empresarial;
- el contrato físico de integración, retorno de evidencia y conciliación pertenece a `DATA-INT-004`.

---

#### 18. Estados y bloqueos heredados

A004 registra estados reales; no los mejora.

- `NO EVALUADO` permanece `NO EVALUADO` hasta evidencia D007 suficiente;
- `BLOQUEADO` permanece `BLOQUEADO` aunque exista una consulta, intento de publicación, descarga o ejecución técnica;
- una investigación autorizada sobre un bloqueo conserva esa finalidad y no se convierte en publicación oficial;
- los tres objetos AURA bloqueados no reciben fuente operativa mediante auditoría;
- las tres métricas de asistencia bloqueadas no se presentan como oficiales por quedar registradas;
- ausencia de evento no se interpreta automáticamente como ausencia de acción cuando la implementación de auditoría todavía no exista; A004 es documental y no certifica cobertura física.

---

#### 19. Matriz materializada para los 62 objetos maestros y de referencia

Cada fila conserva identidad, clase, perfil A002 y estado heredados. A004 añade únicamente la decisión de evidencia.

|    # | Objeto canónico               | Clase heredada    | Perfil A002              | Estado heredado | Decisión A004                                                                                                                                                                                                    |
| ---: | ----------------------------- | ----------------- | ------------------------ | --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | `ORGANIZATION_SCOPE`          | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `ESPECIFICADO`  | Registrar referencia del objeto y versión o vigencia que afectó la operación, actor, finalidad, alcance, decisión y resultado; no incorporar atributos completos cuando una referencia protegida sea suficiente. |
|    2 | `LEGAL_SUBJECT`               | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `ESPECIFICADO`  | Registrar referencia del objeto y versión o vigencia que afectó la operación, actor, finalidad, alcance, decisión y resultado; no incorporar atributos completos cuando una referencia protegida sea suficiente. |
|    3 | `BRAND`                       | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `ESPECIFICADO`  | Registrar referencia del objeto y versión o vigencia que afectó la operación, actor, finalidad, alcance, decisión y resultado; no incorporar atributos completos cuando una referencia protegida sea suficiente. |
|    4 | `COMMERCIAL_ESTABLISHMENT`    | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `ESPECIFICADO`  | Registrar referencia del objeto y versión o vigencia que afectó la operación, actor, finalidad, alcance, decisión y resultado; no incorporar atributos completos cuando una referencia protegida sea suficiente. |
|    5 | `BUSINESS_LINE`               | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `ESPECIFICADO`  | Registrar referencia del objeto y versión o vigencia que afectó la operación, actor, finalidad, alcance, decisión y resultado; no incorporar atributos completos cuando una referencia protegida sea suficiente. |
|    6 | `PHYSICAL_FACILITY`           | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `ESPECIFICADO`  | Registrar referencia del objeto y versión o vigencia que afectó la operación, actor, finalidad, alcance, decisión y resultado; no incorporar atributos completos cuando una referencia protegida sea suficiente. |
|    7 | `OPERATIONAL_SITE`            | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `ESPECIFICADO`  | Registrar referencia del objeto y versión o vigencia que afectó la operación, actor, finalidad, alcance, decisión y resultado; no incorporar atributos completos cuando una referencia protegida sea suficiente. |
|    8 | `ORGANIZATIONAL_AREA`         | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `ESPECIFICADO`  | Registrar referencia del objeto y versión o vigencia que afectó la operación, actor, finalidad, alcance, decisión y resultado; no incorporar atributos completos cuando una referencia protegida sea suficiente. |
|    9 | `PHYSICAL_ZONE`               | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `ESPECIFICADO`  | Registrar referencia del objeto y versión o vigencia que afectó la operación, actor, finalidad, alcance, decisión y resultado; no incorporar atributos completos cuando una referencia protegida sea suficiente. |
|   10 | `WORKSTATION`                 | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `ESPECIFICADO`  | Registrar referencia del objeto y versión o vigencia que afectó la operación, actor, finalidad, alcance, decisión y resultado; no incorporar atributos completos cuando una referencia protegida sea suficiente. |
|   11 | `EXTERNAL_OPERATIONAL_POINT`  | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `ESPECIFICADO`  | Registrar referencia del objeto y versión o vigencia que afectó la operación, actor, finalidad, alcance, decisión y resultado; no incorporar atributos completos cuando una referencia protegida sea suficiente. |
|   12 | `PERSON_IDENTITY`             | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | `ESPECIFICADO`  | Registrar referencia protegida, relación, finalidad y proyección aplicada; excluir identidad, contacto y atributos personales completos del evento ordinario salvo evidencia autorizada y minimizada.            |
|   13 | `WORKER_PROFILE`              | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | `ESPECIFICADO`  | Registrar referencia protegida, relación, finalidad y proyección aplicada; excluir identidad, contacto y atributos personales completos del evento ordinario salvo evidencia autorizada y minimizada.            |
|   14 | `EMPLOYMENT_RELATIONSHIP`     | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | `ESPECIFICADO`  | Registrar referencia protegida, relación, finalidad y proyección aplicada; excluir identidad, contacto y atributos personales completos del evento ordinario salvo evidencia autorizada y minimizada.            |
|   15 | `CONTRACTUAL_POSITION`        | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `ESPECIFICADO`  | Registrar clave y versión de referencia cuando influya en cálculo, filtro o decisión; no volcar el catálogo ni usar la referencia como permiso para hechos relacionados.                                         |
|   16 | `BASE_ROLE`                   | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `ESPECIFICADO`  | Registrar clave y versión de referencia cuando influya en cálculo, filtro o decisión; no volcar el catálogo ni usar la referencia como permiso para hechos relacionados.                                         |
|   17 | `OPERATIONAL_ROLE`            | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `ESPECIFICADO`  | Registrar clave y versión de referencia cuando influya en cálculo, filtro o decisión; no volcar el catálogo ni usar la referencia como permiso para hechos relacionados.                                         |
|   18 | `WORK_ASSIGNMENT`             | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | `ESPECIFICADO`  | Registrar referencia protegida, relación, finalidad y proyección aplicada; excluir identidad, contacto y atributos personales completos del evento ordinario salvo evidencia autorizada y minimizada.            |
|   19 | `CUSTOMER_PERSON`             | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | `ESPECIFICADO`  | Registrar referencia protegida, relación, finalidad y proyección aplicada; excluir identidad, contacto y atributos personales completos del evento ordinario salvo evidencia autorizada y minimizada.            |
|   20 | `CUSTOMER_CONTACT`            | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | `ESPECIFICADO`  | Registrar referencia protegida, relación, finalidad y proyección aplicada; excluir identidad, contacto y atributos personales completos del evento ordinario salvo evidencia autorizada y minimizada.            |
|   21 | `CUSTOMER_RELATIONSHIP`       | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | `ESPECIFICADO`  | Registrar referencia protegida, relación, finalidad y proyección aplicada; excluir identidad, contacto y atributos personales completos del evento ordinario salvo evidencia autorizada y minimizada.            |
|   22 | `CUSTOMER_PROFILE`            | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | `ESPECIFICADO`  | Registrar referencia protegida, relación, finalidad y proyección aplicada; excluir identidad, contacto y atributos personales completos del evento ordinario salvo evidencia autorizada y minimizada.            |
|   23 | `CUSTOMER_PREFERENCE`         | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | `ESPECIFICADO`  | Registrar referencia protegida, relación, finalidad y proyección aplicada; excluir identidad, contacto y atributos personales completos del evento ordinario salvo evidencia autorizada y minimizada.            |
|   24 | `LOYALTY_ACCOUNT`             | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | `ESPECIFICADO`  | Registrar referencia protegida, relación, finalidad y proyección aplicada; excluir identidad, contacto y atributos personales completos del evento ordinario salvo evidencia autorizada y minimizada.            |
|   25 | `LOYALTY_PROGRAM_RULE`        | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `ESPECIFICADO`  | Registrar clave y versión de referencia cuando influya en cálculo, filtro o decisión; no volcar el catálogo ni usar la referencia como permiso para hechos relacionados.                                         |
|   26 | `PRODUCTO_MAESTRO`            | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `ESPECIFICADO`  | Registrar referencia del objeto y versión o vigencia que afectó la operación, actor, finalidad, alcance, decisión y resultado; no incorporar atributos completos cuando una referencia protegida sea suficiente. |
|   27 | `VARIANTE`                    | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `ESPECIFICADO`  | Registrar referencia del objeto y versión o vigencia que afectó la operación, actor, finalidad, alcance, decisión y resultado; no incorporar atributos completos cuando una referencia protegida sea suficiente. |
|   28 | `PRESENTACION`                | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `ESPECIFICADO`  | Registrar referencia del objeto y versión o vigencia que afectó la operación, actor, finalidad, alcance, decisión y resultado; no incorporar atributos completos cuando una referencia protegida sea suficiente. |
|   29 | `UNIDAD_DE_MEDIDA`            | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `ESPECIFICADO`  | Registrar clave y versión de referencia cuando influya en cálculo, filtro o decisión; no volcar el catálogo ni usar la referencia como permiso para hechos relacionados.                                         |
|   30 | `TAXONOMIA_TIPO_MAESTRO`      | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `ESPECIFICADO`  | Registrar clave y versión de referencia cuando influya en cálculo, filtro o decisión; no volcar el catálogo ni usar la referencia como permiso para hechos relacionados.                                         |
|   31 | `TAXONOMIA_INVENTARIO`        | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `ESPECIFICADO`  | Registrar clave y versión de referencia cuando influya en cálculo, filtro o decisión; no volcar el catálogo ni usar la referencia como permiso para hechos relacionados.                                         |
|   32 | `TAXONOMIA_OPERACIONAL`       | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `ESPECIFICADO`  | Registrar clave y versión de referencia cuando influya en cálculo, filtro o decisión; no volcar el catálogo ni usar la referencia como permiso para hechos relacionados.                                         |
|   33 | `LOC`                         | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `ESPECIFICADO`  | Registrar referencia del objeto y versión o vigencia que afectó la operación, actor, finalidad, alcance, decisión y resultado; no incorporar atributos completos cuando una referencia protegida sea suficiente. |
|   34 | `ACTIVO_FISICO`               | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `ESPECIFICADO`  | Registrar referencia del objeto y versión o vigencia que afectó la operación, actor, finalidad, alcance, decisión y resultado; no incorporar atributos completos cuando una referencia protegida sea suficiente. |
|   35 | `CLASE_DE_ACTIVO`             | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `ESPECIFICADO`  | Registrar clave y versión de referencia cuando influya en cálculo, filtro o decisión; no volcar el catálogo ni usar la referencia como permiso para hechos relacionados.                                         |
|   36 | `ESPECIFICACION_PRODUCTO`     | `DATO_MAESTRO`    | `COMERCIAL_CONFIDENCIAL` | `ESPECIFICADO`  | Registrar recurso, versión y contexto comercial; términos, fórmulas, condiciones o contenido propietario se conservan mediante referencia protegida y no como payload ordinario.                                 |
|   37 | `PROVEEDOR`                   | `DATO_MAESTRO`    | `COMERCIAL_CONFIDENCIAL` | `ESPECIFICADO`  | Registrar recurso, versión y contexto comercial; términos, fórmulas, condiciones o contenido propietario se conservan mediante referencia protegida y no como payload ordinario.                                 |
|   38 | `CONTACTO_PROVEEDOR`          | `DATO_MAESTRO`    | `PERSONA_RELACIONADA`    | `ESPECIFICADO`  | Registrar referencia protegida, relación, finalidad y proyección aplicada; excluir identidad, contacto y atributos personales completos del evento ordinario salvo evidencia autorizada y minimizada.            |
|   39 | `RELACION_PRODUCTO_PROVEEDOR` | `DATO_MAESTRO`    | `COMERCIAL_CONFIDENCIAL` | `ESPECIFICADO`  | Registrar recurso, versión y contexto comercial; términos, fórmulas, condiciones o contenido propietario se conservan mediante referencia protegida y no como payload ordinario.                                 |
|   40 | `CONDICION_COMERCIAL`         | `DATO_MAESTRO`    | `FINANCIERO_RESTRINGIDO` | `ESPECIFICADO`  | Registrar recurso, versión, periodo y decisión; saldos, importes, cuentas y detalle financiero no se reproducen en el evento ordinario salvo evidencia autorizada y minimizada.                                  |
|   41 | `TAXONOMIA_COMPRA`            | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `ESPECIFICADO`  | Registrar clave y versión de referencia cuando influya en cálculo, filtro o decisión; no volcar el catálogo ni usar la referencia como permiso para hechos relacionados.                                         |
|   42 | `RECETA`                      | `DATO_MAESTRO`    | `COMERCIAL_CONFIDENCIAL` | `ESPECIFICADO`  | Registrar recurso, versión y contexto comercial; términos, fórmulas, condiciones o contenido propietario se conservan mediante referencia protegida y no como payload ordinario.                                 |
|   43 | `FAMILIA_PRODUCTIVA`          | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `ESPECIFICADO`  | Registrar clave y versión de referencia cuando influya en cálculo, filtro o decisión; no volcar el catálogo ni usar la referencia como permiso para hechos relacionados.                                         |
|   44 | `RUTA_PRODUCTIVA`             | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `ESPECIFICADO`  | Registrar referencia del objeto y versión o vigencia que afectó la operación, actor, finalidad, alcance, decisión y resultado; no incorporar atributos completos cuando una referencia protegida sea suficiente. |
|   45 | `RECURSO_PRODUCTIVO`          | `DATO_MAESTRO`    | `MAESTRO_OPERATIVO`      | `ESPECIFICADO`  | Registrar referencia del objeto y versión o vigencia que afectó la operación, actor, finalidad, alcance, decisión y resultado; no incorporar atributos completos cuando una referencia protegida sea suficiente. |
|   46 | `COMMERCIAL_CHANNEL`          | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `ESPECIFICADO`  | Registrar clave y versión de referencia cuando influya en cálculo, filtro o decisión; no volcar el catálogo ni usar la referencia como permiso para hechos relacionados.                                         |
|   47 | `CATEGORIA_COMERCIAL`         | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `ESPECIFICADO`  | Registrar clave y versión de referencia cuando influya en cálculo, filtro o decisión; no volcar el catálogo ni usar la referencia como permiso para hechos relacionados.                                         |
|   48 | `OFERTA_COMERCIAL`            | `DATO_MAESTRO`    | `COMERCIAL_CONFIDENCIAL` | `ESPECIFICADO`  | Registrar recurso, versión y contexto comercial; términos, fórmulas, condiciones o contenido propietario se conservan mediante referencia protegida y no como payload ordinario.                                 |
|   49 | `CENTRO_DE_COSTO`             | `DATO_MAESTRO`    | `FINANCIERO_RESTRINGIDO` | `ESPECIFICADO`  | Registrar recurso, versión, periodo y decisión; saldos, importes, cuentas y detalle financiero no se reproducen en el evento ordinario salvo evidencia autorizada y minimizada.                                  |
|   50 | `MONEDA`                      | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `ESPECIFICADO`  | Registrar clave y versión de referencia cuando influya en cálculo, filtro o decisión; no volcar el catálogo ni usar la referencia como permiso para hechos relacionados.                                         |
|   51 | `PERIODO_ECONOMICO`           | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `ESPECIFICADO`  | Registrar clave y versión de referencia cuando influya en cálculo, filtro o decisión; no volcar el catálogo ni usar la referencia como permiso para hechos relacionados.                                         |
|   52 | `PERIODO_CONTABLE`            | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `ESPECIFICADO`  | Registrar clave y versión de referencia cuando influya en cálculo, filtro o decisión; no volcar el catálogo ni usar la referencia como permiso para hechos relacionados.                                         |
|   53 | `PERIODO_FISCAL`              | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `ESPECIFICADO`  | Registrar clave y versión de referencia cuando influya en cálculo, filtro o decisión; no volcar el catálogo ni usar la referencia como permiso para hechos relacionados.                                         |
|   54 | `CLASIFICACION_ECONOMICA`     | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `ESPECIFICADO`  | Registrar clave y versión de referencia cuando influya en cálculo, filtro o decisión; no volcar el catálogo ni usar la referencia como permiso para hechos relacionados.                                         |
|   55 | `PERFIL_DE_MARCA`             | `DATO_MAESTRO`    | `BLOQUEADO`              | `BLOQUEADO`     | Registrar únicamente el intento, bloqueo o decisión segura con referencias mínimas; no crear fuente, población, dato ni resultado operativo para superar el bloqueo heredado.                                    |
|   56 | `AUDIENCIA`                   | `DATO_MAESTRO`    | `BLOQUEADO`              | `BLOQUEADO`     | Registrar únicamente el intento, bloqueo o decisión segura con referencias mínimas; no crear fuente, población, dato ni resultado operativo para superar el bloqueo heredado.                                    |
|   57 | `ACTIVO_DE_MARCA`             | `DATO_MAESTRO`    | `BLOQUEADO`              | `BLOQUEADO`     | Registrar únicamente el intento, bloqueo o decisión segura con referencias mínimas; no crear fuente, población, dato ni resultado operativo para superar el bloqueo heredado.                                    |
|   58 | `ENDPOINT`                    | `DATO_MAESTRO`    | `TECNICO_SENSIBLE`       | `ESPECIFICADO`  | Registrar identidad técnica estable y contexto; secretos, tokens, credenciales y configuración sensible no se almacenan en el evento ordinario.                                                                  |
|   59 | `SHARED_DEVICE`               | `DATO_MAESTRO`    | `TECNICO_SENSIBLE`       | `ESPECIFICADO`  | Registrar identidad técnica estable y contexto; secretos, tokens, credenciales y configuración sensible no se almacenan en el evento ordinario.                                                                  |
|   60 | `NETWORK_RESOURCE`            | `DATO_MAESTRO`    | `TECNICO_SENSIBLE`       | `ESPECIFICADO`  | Registrar identidad técnica estable y contexto; secretos, tokens, credenciales y configuración sensible no se almacenan en el evento ordinario.                                                                  |
|   61 | `APPLICATION`                 | `DATO_MAESTRO`    | `TECNICO_SENSIBLE`       | `ESPECIFICADO`  | Registrar identidad técnica estable y contexto; secretos, tokens, credenciales y configuración sensible no se almacenan en el evento ordinario.                                                                  |
|   62 | `TECH_SERVICE`                | `DATO_REFERENCIA` | `REFERENCIA_CONTROLADA`  | `ESPECIFICADO`  | Registrar clave y versión de referencia cuando influya en cálculo, filtro o decisión; no volcar el catálogo ni usar la referencia como permiso para hechos relacionados.                                         |

**Reconciliación:** 62 esperados; 62 materializados; 0 faltantes; 0 duplicados; 43 `DATO_MAESTRO`; 19 `DATO_REFERENCIA`; tres objetos AURA preservados en `BLOQUEADO`.

---

#### 20. Reglas transversales para los 62 objetos

- la identidad del objeto se registra mediante su referencia canónica; no se sustituye por etiqueta visible, nombre libre, correo, IP, archivo o valor normalizado;
- el perfil A002 determina cómo se minimiza el evento y puede exigir referencias más restrictivas;
- una consulta o modelo que cruza objetos de varios dominios conserva la intersección de autorizaciones y las referencias de cada fuente material;
- un evento sobre un objeto de referencia no concede hechos, personas, saldos o expedientes relacionados;
- el registro de un objeto sensible no debe permitir enumerar sus miembros mediante metadatos de auditoría;
- cambios de versión, vigencia o clasificación producen nueva evidencia y no reinterpretan silenciosamente eventos anteriores.

---

#### 21. Matriz materializada para las 14 métricas de asistencia

|    # | `metric_key`        | DQ heredado   | Estado A003    | Decisión A004                                                                                                                                                                                                                                                           |
| ---: | ------------------- | ------------- | -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | `scheduledShifts`   | `NO EVALUADO` | `ESPECIFICADO` | Registrar `metric_key`, versión semántica, corte, población, filtros/dimensiones materiales, autorización, protección, estado DQ y resultado; no incorporar filas laborales crudas o identidad de trabajadores cuando una referencia protegida sea suficiente.          |
|    2 | `attendedShifts`    | `NO EVALUADO` | `ESPECIFICADO` | Registrar `metric_key`, versión semántica, corte, población, filtros/dimensiones materiales, autorización, protección, estado DQ y resultado; no incorporar filas laborales crudas o identidad de trabajadores cuando una referencia protegida sea suficiente.          |
|    3 | `restDayCount`      | `NO EVALUADO` | `ESPECIFICADO` | Registrar `metric_key`, versión semántica, corte, población, filtros/dimensiones materiales, autorización, protección, estado DQ y resultado; no incorporar filas laborales crudas o identidad de trabajadores cuando una referencia protegida sea suficiente.          |
|    4 | `lateCount`         | `NO EVALUADO` | `ESPECIFICADO` | Registrar `metric_key`, versión semántica, corte, población, filtros/dimensiones materiales, autorización, protección, estado DQ y resultado; no incorporar filas laborales crudas o identidad de trabajadores cuando una referencia protegida sea suficiente.          |
|    5 | `noShowCount`       | `NO EVALUADO` | `ESPECIFICADO` | Registrar `metric_key`, versión semántica, corte, población, filtros/dimensiones materiales, autorización, protección, estado DQ y resultado; no incorporar filas laborales crudas o identidad de trabajadores cuando una referencia protegida sea suficiente.          |
|    6 | `openCount`         | `NO EVALUADO` | `ESPECIFICADO` | Registrar `metric_key`, versión semántica, corte, población, filtros/dimensiones materiales, autorización, protección, estado DQ y resultado; no incorporar filas laborales crudas o identidad de trabajadores cuando una referencia protegida sea suficiente.          |
|    7 | `missingCloseCount` | `BLOQUEADO`   | `BLOQUEADO`    | Registrar `metric_key`, versión, corte, población, filtros/dimensiones, autorización, protección y estado `BLOQUEADO`; consultas de investigación pueden dejar evidencia, pero no se registra certificación o publicación oficial exitosa mientras persista el bloqueo. |
|    8 | `autoCloseCount`    | `NO EVALUADO` | `ESPECIFICADO` | Registrar `metric_key`, versión semántica, corte, población, filtros/dimensiones materiales, autorización, protección, estado DQ y resultado; no incorporar filas laborales crudas o identidad de trabajadores cuando una referencia protegida sea suficiente.          |
|    9 | `departureCount`    | `NO EVALUADO` | `ESPECIFICADO` | Registrar `metric_key`, versión semántica, corte, población, filtros/dimensiones materiales, autorización, protección, estado DQ y resultado; no incorporar filas laborales crudas o identidad de trabajadores cuando una referencia protegida sea suficiente.          |
|   10 | `scheduledMinutes`  | `NO EVALUADO` | `ESPECIFICADO` | Registrar `metric_key`, versión semántica, corte, población, filtros/dimensiones materiales, autorización, protección, estado DQ y resultado; no incorporar filas laborales crudas o identidad de trabajadores cuando una referencia protegida sea suficiente.          |
|   11 | `netMinutes`        | `NO EVALUADO` | `ESPECIFICADO` | Registrar `metric_key`, versión semántica, corte, población, filtros/dimensiones materiales, autorización, protección, estado DQ y resultado; no incorporar filas laborales crudas o identidad de trabajadores cuando una referencia protegida sea suficiente.          |
|   12 | `incidentCount`     | `NO EVALUADO` | `ESPECIFICADO` | Registrar `metric_key`, versión semántica, corte, población, filtros/dimensiones materiales, autorización, protección, estado DQ y resultado; no incorporar filas laborales crudas o identidad de trabajadores cuando una referencia protegida sea suficiente.          |
|   13 | `attendanceRate`    | `BLOQUEADO`   | `BLOQUEADO`    | Registrar `metric_key`, versión, corte, población, filtros/dimensiones, autorización, protección y estado `BLOQUEADO`; consultas de investigación pueden dejar evidencia, pero no se registra certificación o publicación oficial exitosa mientras persista el bloqueo. |
|   14 | `punctualityRate`   | `BLOQUEADO`   | `BLOQUEADO`    | Registrar `metric_key`, versión, corte, población, filtros/dimensiones, autorización, protección y estado `BLOQUEADO`; consultas de investigación pueden dejar evidencia, pero no se registra certificación o publicación oficial exitosa mientras persista el bloqueo. |

**Reconciliación:** 14 esperadas; 14 materializadas; 14 claves únicas; 0 faltantes; 0 duplicadas; 11 `NO EVALUADO`; 3 `BLOQUEADO`.

Las métricas `missingCloseCount`, `attendanceRate` y `punctualityRate` conservan su bloqueo D007. La auditoría de una investigación, consulta o intento no cambia su fórmula, calidad, certificación o posibilidad de publicación oficial.

---

#### 22. Matriz materializada para las 55 familias analíticas

| Tarea propietaria |    # | Familia canónica                                        | Perfil A002            | Estado heredado | Decisión A004                                                                                                                                                                                      |
| ----------------- | ---: | ------------------------------------------------------- | ---------------------- | --------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `DATA-DOM-009`    |    1 | ventas netas y brutas                                   | `COMERCIAL_OPERATIVO`  | `ESPECIFICADO`  | Registrar familia, métricas concretas y versiones, corte, dimensiones o filtros materiales, autorización y resultado; el nombre de familia no se convierte en permiso ni se vuelcan filas fuente.  |
| `DATA-DOM-009`    |    2 | pedidos y conversión                                    | `COMERCIAL_OPERATIVO`  | `ESPECIFICADO`  | Registrar familia, métricas concretas y versiones, corte, dimensiones o filtros materiales, autorización y resultado; el nombre de familia no se convierte en permiso ni se vuelcan filas fuente.  |
| `DATA-DOM-009`    |    3 | ticket y unidades                                       | `COMERCIAL_OPERATIVO`  | `ESPECIFICADO`  | Registrar familia, métricas concretas y versiones, corte, dimensiones o filtros materiales, autorización y resultado; el nombre de familia no se convierte en permiso ni se vuelcan filas fuente.  |
| `DATA-DOM-009`    |    4 | mezcla por producto, categoría, canal y sede            | `COMERCIAL_OPERATIVO`  | `ESPECIFICADO`  | Registrar familia, métricas concretas y versiones, corte, dimensiones o filtros materiales, autorización y resultado; el nombre de familia no se convierte en permiso ni se vuelcan filas fuente.  |
| `DATA-DOM-009`    |    5 | demanda por franja, día y temporada                     | `COMERCIAL_OPERATIVO`  | `ESPECIFICADO`  | Registrar familia, métricas concretas y versiones, corte, dimensiones o filtros materiales, autorización y resultado; el nombre de familia no se convierte en permiso ni se vuelcan filas fuente.  |
| `DATA-DOM-009`    |    6 | disponibilidad perdida                                  | `COMERCIAL_OPERATIVO`  | `ESPECIFICADO`  | Registrar familia, métricas concretas y versiones, corte, dimensiones o filtros materiales, autorización y resultado; el nombre de familia no se convierte en permiso ni se vuelcan filas fuente.  |
| `DATA-DOM-009`    |    7 | cancelaciones, devoluciones y descuentos                | `COMERCIAL_OPERATIVO`  | `ESPECIFICADO`  | Registrar familia, métricas concretas y versiones, corte, dimensiones o filtros materiales, autorización y resultado; el nombre de familia no se convierte en permiso ni se vuelcan filas fuente.  |
| `DATA-DOM-009`    |    8 | promociones y efecto incremental                        | `CLIENTE_SENSIBLE`     | `ESPECIFICADO`  | Registrar referencias, versión, finalidad, población y regla de divulgación; no almacenar PII, texto libre completo, miembros de segmentos protegidos ni celdas suprimidas en el evento ordinario. |
| `DATA-DOM-009`    |    9 | recurrencia y frecuencia                                | `CLIENTE_SENSIBLE`     | `ESPECIFICADO`  | Registrar referencias, versión, finalidad, población y regla de divulgación; no almacenar PII, texto libre completo, miembros de segmentos protegidos ni celdas suprimidas en el evento ordinario. |
| `DATA-DOM-009`    |   10 | margen relacionado                                      | `FINANCIERO`           | `ESPECIFICADO`  | Registrar versión, periodo o corte, dimensiones y decisión; no copiar saldos, importes, partidas, cuentas o componentes financieros detallados salvo evidencia autorizada.                         |
| `DATA-DOM-009`    |   11 | capacidad comercial no utilizada                        | `COMERCIAL_OPERATIVO`  | `ESPECIFICADO`  | Registrar familia, métricas concretas y versiones, corte, dimensiones o filtros materiales, autorización y resultado; el nombre de familia no se convierte en permiso ni se vuelcan filas fuente.  |
| `DATA-DOM-010`    |    1 | existencia disponible y comprometida                    | `INVENTARIO_OPERATIVO` | `ESPECIFICADO`  | Registrar versión, corte, sede o alcance y resultado; no usar la auditoría para reconstruir movimientos, existencias o ubicaciones fuera del conjunto autorizado.                                  |
| `DATA-DOM-010`    |    2 | cobertura y días de inventario                          | `INVENTARIO_OPERATIVO` | `ESPECIFICADO`  | Registrar versión, corte, sede o alcance y resultado; no usar la auditoría para reconstruir movimientos, existencias o ubicaciones fuera del conjunto autorizado.                                  |
| `DATA-DOM-010`    |    3 | rotación y permanencia                                  | `INVENTARIO_OPERATIVO` | `ESPECIFICADO`  | Registrar versión, corte, sede o alcance y resultado; no usar la auditoría para reconstruir movimientos, existencias o ubicaciones fuera del conjunto autorizado.                                  |
| `DATA-DOM-010`    |    4 | faltantes y quiebres                                    | `INVENTARIO_OPERATIVO` | `ESPECIFICADO`  | Registrar versión, corte, sede o alcance y resultado; no usar la auditoría para reconstruir movimientos, existencias o ubicaciones fuera del conjunto autorizado.                                  |
| `DATA-DOM-010`    |    5 | vencimiento, daño y pérdida                             | `CALIDAD_OPERATIVA`    | `ESPECIFICADO`  | Registrar estado de calidad, versión, corte, anomalía o resultado aplicable; evidencia detallada se referencia sin convertir el evento en una copia del expediente.                                |
| `DATA-DOM-010`    |    6 | diferencias de conteo                                   | `CALIDAD_OPERATIVA`    | `ESPECIFICADO`  | Registrar estado de calidad, versión, corte, anomalía o resultado aplicable; evidencia detallada se referencia sin convertir el evento en una copia del expediente.                                |
| `DATA-DOM-010`    |    7 | cumplimiento de remisiones                              | `INVENTARIO_OPERATIVO` | `ESPECIFICADO`  | Registrar versión, corte, sede o alcance y resultado; no usar la auditoría para reconstruir movimientos, existencias o ubicaciones fuera del conjunto autorizado.                                  |
| `DATA-DOM-010`    |    8 | lead time y cumplimiento de proveedores                 | `PROVEEDOR_COMERCIAL`  | `ESPECIFICADO`  | Registrar proveedor o relación mediante referencia protegida, periodo, finalidad y resultado; condiciones comerciales y contactos permanecen minimizados.                                          |
| `DATA-DOM-010`    |    9 | compras urgentes                                        | `PROVEEDOR_COMERCIAL`  | `ESPECIFICADO`  | Registrar proveedor o relación mediante referencia protegida, periodo, finalidad y resultado; condiciones comerciales y contactos permanecen minimizados.                                          |
| `DATA-DOM-010`    |   10 | consumo versus plan                                     | `INVENTARIO_OPERATIVO` | `ESPECIFICADO`  | Registrar versión, corte, sede o alcance y resultado; no usar la auditoría para reconstruir movimientos, existencias o ubicaciones fuera del conjunto autorizado.                                  |
| `DATA-DOM-010`    |   11 | costo de inventario                                     | `FINANCIERO`           | `ESPECIFICADO`  | Registrar versión, periodo o corte, dimensiones y decisión; no copiar saldos, importes, partidas, cuentas o componentes financieros detallados salvo evidencia autorizada.                         |
| `DATA-DOM-010`    |   12 | capacidad de almacenamiento                             | `INVENTARIO_OPERATIVO` | `ESPECIFICADO`  | Registrar versión, corte, sede o alcance y resultado; no usar la auditoría para reconstruir movimientos, existencias o ubicaciones fuera del conjunto autorizado.                                  |
| `DATA-DOM-011`    |    1 | demanda planificada versus producción                   | `PRODUCCION_OPERATIVA` | `ESPECIFICADO`  | Registrar versión, lote o recurso mediante referencia cuando aplique, corte y resultado; recetas, consumos y detalle productivo permanecen fuera del evento ordinario salvo necesidad autorizada.  |
| `DATA-DOM-011`    |    2 | capacidad disponible y utilizada                        | `PRODUCCION_OPERATIVA` | `ESPECIFICADO`  | Registrar versión, lote o recurso mediante referencia cuando aplique, corte y resultado; recetas, consumos y detalle productivo permanecen fuera del evento ordinario salvo necesidad autorizada.  |
| `DATA-DOM-011`    |    3 | adherencia al programa                                  | `PRODUCCION_OPERATIVA` | `ESPECIFICADO`  | Registrar versión, lote o recurso mediante referencia cuando aplique, corte y resultado; recetas, consumos y detalle productivo permanecen fuera del evento ordinario salvo necesidad autorizada.  |
| `DATA-DOM-011`    |    4 | rendimiento teórico y real                              | `PRODUCCION_OPERATIVA` | `ESPECIFICADO`  | Registrar versión, lote o recurso mediante referencia cuando aplique, corte y resultado; recetas, consumos y detalle productivo permanecen fuera del evento ordinario salvo necesidad autorizada.  |
| `DATA-DOM-011`    |    5 | consumo estándar y real                                 | `PRODUCCION_OPERATIVA` | `ESPECIFICADO`  | Registrar versión, lote o recurso mediante referencia cuando aplique, corte y resultado; recetas, consumos y detalle productivo permanecen fuera del evento ordinario salvo necesidad autorizada.  |
| `DATA-DOM-011`    |    6 | merma, reproceso y aprovechamiento                      | `CALIDAD_OPERATIVA`    | `ESPECIFICADO`  | Registrar estado de calidad, versión, corte, anomalía o resultado aplicable; evidencia detallada se referencia sin convertir el evento en una copia del expediente.                                |
| `DATA-DOM-011`    |    7 | calidad, retención y rechazo                            | `CALIDAD_OPERATIVA`    | `ESPECIFICADO`  | Registrar estado de calidad, versión, corte, anomalía o resultado aplicable; evidencia detallada se referencia sin convertir el evento en una copia del expediente.                                |
| `DATA-DOM-011`    |    8 | tiempo de ciclo                                         | `PRODUCCION_OPERATIVA` | `ESPECIFICADO`  | Registrar versión, lote o recurso mediante referencia cuando aplique, corte y resultado; recetas, consumos y detalle productivo permanecen fuera del evento ordinario salvo necesidad autorizada.  |
| `DATA-DOM-011`    |    9 | cumplimiento de liberación                              | `PRODUCCION_OPERATIVA` | `ESPECIFICADO`  | Registrar versión, lote o recurso mediante referencia cuando aplique, corte y resultado; recetas, consumos y detalle productivo permanecen fuera del evento ordinario salvo necesidad autorizada.  |
| `DATA-DOM-011`    |   10 | costo y variación por lote, producto y sede             | `FINANCIERO`           | `ESPECIFICADO`  | Registrar versión, periodo o corte, dimensiones y decisión; no copiar saldos, importes, partidas, cuentas o componentes financieros detallados salvo evidencia autorizada.                         |
| `DATA-DOM-012`    |    1 | cumplimiento de promesa                                 | `SERVICIO_OPERATIVO`   | `ESPECIFICADO`  | Registrar proceso o caso mediante referencia, periodo, finalidad y resultado; identidad de cliente, contenido de reclamo y detalle de pedido permanecen minimizados.                               |
| `DATA-DOM-012`    |    2 | tiempos de preparación, despacho y entrega              | `SERVICIO_OPERATIVO`   | `ESPECIFICADO`  | Registrar proceso o caso mediante referencia, periodo, finalidad y resultado; identidad de cliente, contenido de reclamo y detalle de pedido permanecen minimizados.                               |
| `DATA-DOM-012`    |    3 | pedidos completos                                       | `SERVICIO_OPERATIVO`   | `ESPECIFICADO`  | Registrar proceso o caso mediante referencia, periodo, finalidad y resultado; identidad de cliente, contenido de reclamo y detalle de pedido permanecen minimizados.                               |
| `DATA-DOM-012`    |    4 | reclamos y tiempo de resolución                         | `CLIENTE_SENSIBLE`     | `ESPECIFICADO`  | Registrar referencias, versión, finalidad, población y regla de divulgación; no almacenar PII, texto libre completo, miembros de segmentos protegidos ni celdas suprimidas en el evento ordinario. |
| `DATA-DOM-012`    |    5 | compensaciones                                          | `CLIENTE_SENSIBLE`     | `ESPECIFICADO`  | Registrar referencias, versión, finalidad, población y regla de divulgación; no almacenar PII, texto libre completo, miembros de segmentos protegidos ni celdas suprimidas en el evento ordinario. |
| `DATA-DOM-012`    |    6 | satisfacción y feedback                                 | `CLIENTE_SENSIBLE`     | `ESPECIFICADO`  | Registrar referencias, versión, finalidad, población y regla de divulgación; no almacenar PII, texto libre completo, miembros de segmentos protegidos ni celdas suprimidas en el evento ordinario. |
| `DATA-DOM-012`    |    7 | recurrencia, frecuencia y abandono                      | `CLIENTE_SENSIBLE`     | `ESPECIFICADO`  | Registrar referencias, versión, finalidad, población y regla de divulgación; no almacenar PII, texto libre completo, miembros de segmentos protegidos ni celdas suprimidas en el evento ordinario. |
| `DATA-DOM-012`    |    8 | adquisición y activación                                | `CLIENTE_SENSIBLE`     | `ESPECIFICADO`  | Registrar referencias, versión, finalidad, población y regla de divulgación; no almacenar PII, texto libre completo, miembros de segmentos protegidos ni celdas suprimidas en el evento ordinario. |
| `DATA-DOM-012`    |    9 | fidelización, puntos y redenciones                      | `CLIENTE_SENSIBLE`     | `ESPECIFICADO`  | Registrar referencias, versión, finalidad, población y regla de divulgación; no almacenar PII, texto libre completo, miembros de segmentos protegidos ni celdas suprimidas en el evento ordinario. |
| `DATA-DOM-012`    |   10 | reputación y temas recurrentes                          | `CLIENTE_SENSIBLE`     | `ESPECIFICADO`  | Registrar referencias, versión, finalidad, población y regla de divulgación; no almacenar PII, texto libre completo, miembros de segmentos protegidos ni celdas suprimidas en el evento ordinario. |
| `DATA-DOM-012`    |   11 | reservas, no-show y utilización                         | `CLIENTE_SENSIBLE`     | `ESPECIFICADO`  | Registrar referencias, versión, finalidad, población y regla de divulgación; no almacenar PII, texto libre completo, miembros de segmentos protegidos ni celdas suprimidas en el evento ordinario. |
| `DATA-DOM-012`    |   12 | valor y rentabilidad del cliente cuando esté autorizado | `CLIENTE_FINANCIERO`   | `ESPECIFICADO`  | Aplicar simultáneamente protección de cliente y financiera; registrar autorización y versiones de ambos dominios mediante referencias, sin detalle personal o monetario ordinario.                 |
| `DATA-DOM-013`    |    1 | costos estándar y reales                                | `FINANCIERO`           | `ESPECIFICADO`  | Registrar versión, periodo o corte, dimensiones y decisión; no copiar saldos, importes, partidas, cuentas o componentes financieros detallados salvo evidencia autorizada.                         |
| `DATA-DOM-013`    |    2 | variaciones                                             | `FINANCIERO`           | `ESPECIFICADO`  | Registrar versión, periodo o corte, dimensiones y decisión; no copiar saldos, importes, partidas, cuentas o componentes financieros detallados salvo evidencia autorizada.                         |
| `DATA-DOM-013`    |    3 | margen y contribución                                   | `FINANCIERO`           | `ESPECIFICADO`  | Registrar versión, periodo o corte, dimensiones y decisión; no copiar saldos, importes, partidas, cuentas o componentes financieros detallados salvo evidencia autorizada.                         |
| `DATA-DOM-013`    |    4 | gastos                                                  | `FINANCIERO`           | `ESPECIFICADO`  | Registrar versión, periodo o corte, dimensiones y decisión; no copiar saldos, importes, partidas, cuentas o componentes financieros detallados salvo evidencia autorizada.                         |
| `DATA-DOM-013`    |    5 | centros de costo                                        | `FINANCIERO`           | `ESPECIFICADO`  | Registrar versión, periodo o corte, dimensiones y decisión; no copiar saldos, importes, partidas, cuentas o componentes financieros detallados salvo evidencia autorizada.                         |
| `DATA-DOM-013`    |    6 | presupuesto y forecast                                  | `FINANCIERO`           | `ESPECIFICADO`  | Registrar versión, periodo o corte, dimensiones y decisión; no copiar saldos, importes, partidas, cuentas o componentes financieros detallados salvo evidencia autorizada.                         |
| `DATA-DOM-013`    |    7 | caja, bancos y tesorería                                | `FINANCIERO`           | `ESPECIFICADO`  | Registrar versión, periodo o corte, dimensiones y decisión; no copiar saldos, importes, partidas, cuentas o componentes financieros detallados salvo evidencia autorizada.                         |
| `DATA-DOM-013`    |    8 | cartera y obligaciones                                  | `FINANCIERO`           | `ESPECIFICADO`  | Registrar versión, periodo o corte, dimensiones y decisión; no copiar saldos, importes, partidas, cuentas o componentes financieros detallados salvo evidencia autorizada.                         |
| `DATA-DOM-013`    |    9 | rentabilidad multidimensional                           | `FINANCIERO`           | `ESPECIFICADO`  | Registrar versión, periodo o corte, dimensiones y decisión; no copiar saldos, importes, partidas, cuentas o componentes financieros detallados salvo evidencia autorizada.                         |
| `DATA-DOM-013`    |   10 | escenarios y simulaciones                               | `FINANCIERO`           | `ESPECIFICADO`  | Registrar versión, periodo o corte, dimensiones y decisión; no copiar saldos, importes, partidas, cuentas o componentes financieros detallados salvo evidencia autorizada.                         |

**Reconciliación:** `11 + 12 + 10 + 12 + 10 = 55`; 55 esperadas; 55 materializadas; 0 faltantes; 0 duplicadas.

Reglas transversales:

- el nombre de familia no sustituye la identidad/version de una métrica concreta;
- cada consulta, modelo o recomendación conserva las métricas y fuentes realmente usadas;
- una familia `CLIENTE_SENSIBLE`, `CLIENTE_FINANCIERO` o `FINANCIERO` no expone miembros o valores mediante auditoría;
- una familia bloqueada o no certificable conserva ese estado en el evento que la consume;
- cruces entre familias registran las fronteras y versiones necesarias para explicar el resultado sin duplicar los datasets;
- recomendaciones y modelos sobre una familia no adquieren autoridad sobre el dominio propietario.

---

#### 23. Matriz materializada para las seis familias de artefacto D008

|    # | Familia          | Estado heredado | Decisión A004                                                                                                                                                                            |
| ---: | ---------------- | --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | tablero          | `ESPECIFICADO`  | Registrar consultas protegidas que materialmente cambien o recuperen resultados, incluidas actualizaciones, filtros y drill-down; una obtención portable se audita además como descarga. |
|    2 | reporte          | `ESPECIFICADO`  | Conservar referencia a edición, periodo, corte, versiones y autorización de consulta; cada obtención portable queda correlacionada y no reescribe la edición.                            |
|    3 | exportación      | `ESPECIFICADO`  | Correlacionar la generación autorizada por A003 con cada obtención material; registrar proyección, corte, clasificación, integridad y resultado sin duplicar el contenido.               |
|    4 | suscripción      | `ESPECIFICADO`  | Auditar gobierno de la regla y cada evaluación o entrega con autorización vigente, destinatario, canal, corte, versión y resultado.                                                      |
|    5 | alerta           | `ESPECIFICADO`  | Auditar evaluación de regla, ocurrencia de señal y distribución como hechos separados; no convertir la alerta en diagnóstico, recomendación o acción.                                    |
|    6 | snapshot oficial | `ESPECIFICADO`  | Auditar consulta u obtención contra la identidad inmutable del snapshot, corte y versiones; una reconstrucción o restatement produce evidencia nueva vinculada.                          |

**Reconciliación:** 6 esperadas; 6 materializadas; 0 faltantes; 0 duplicadas.

---

#### 24. Handoffs con propietario documental exacto

| Decisión o materialización fuera del alcance                                       | Propietario documental                                                  | Condición de salida                                                                         |
| ---------------------------------------------------------------------------------- | ----------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| experiencia del inicio ejecutivo, investigación, objetivos y artefactos analíticos | `DATA-UX-001` a `DATA-UX-008`                                           | antes de implementar superficies finales de consulta, investigación o distribución          |
| contratos físicos de eventos y lectura                                             | `DATA-INT-001`                                                          | antes de producir integración productiva de eventos o fuentes compartidas                   |
| capa semántica, consultas, modelos, caché, snapshots y rendimiento                 | `DATA-INT-002`                                                          | antes de materializar el contrato de consulta y trazabilidad en servicios o modelos físicos |
| crosswalks e identidades externas                                                  | `DATA-INT-003`                                                          | antes de correlacionar físicamente identidades externas en consultas o modelos              |
| BI, hojas, modelos externos e inteligencia artificial                              | `DATA-INT-004`                                                          | antes de integrar consumidores o proveedores analíticos externos y retornar su evidencia    |
| retención, hold, disposición e integridad de evidencia                             | `NFR-REQ-006` y tareas INFO propietarias                                | al materializar almacenamiento y ciclo de vida físico de auditoría                          |
| enforcement de autorización, RLS, RPC, persistencia y auditoría física en Supabase | E3/BLOQUE R y paquetes de implementación aplicables desde `vento-shell` | únicamente en la fase de implementación autorizada correspondiente                          |

No queda una decisión material de A004 diferida sin propietario documental y condición de salida.

---

#### 25. Cobertura de requisitos de prueba vigente

La conducta documental materializada por A004 ya está cubierta por requisitos vigentes:

- `TREQ-AUTH-015` exige evidencia correlacionable de principal, actor efectivo, contexto, permiso, recurso, decisión, razones, versión y tiempo, incluida denegación, reintento, rollback y administración;
- `TREQ-SHELL-011` exige identidad, finalidad, clasificación, recurso, relación, territorio, estado, destinatario y acción exacta en consulta, búsqueda, descarga, exportación y administración, además de protección frente a filtración por URL, búsqueda y metadatos;
- `TREQ-DATA-004` asigna responsabilidad a `DATA-AUTH-004` y protege artefactos analíticos, corte, versiones, calidad, exportación, suscripción, alerta, drill-down e historia;
- `TREQ-DATA-005` asigna responsabilidad a `DATA-AUTH-004` y protege la separación entre señal, diagnóstico, recomendación, acción, experimento, meta, resultado, confianza y aprendizaje;
- `NFR-REQ-005` protege minimización de logs, trazas, métricas, exportaciones y evidencia sensible;
- `NFR-REQ-006` ya define identidad de evento, recurso, correlación, causalidad, evidencia, integridad, retención, corrección y supersesión.

A004 especializa esas obligaciones para las seis familias analíticas del título. No cambia la regla protegida, prioridad, estado, relación o destino de implementación de ningún requisito vigente y no introduce un algoritmo, permiso, modelo o comportamiento ejecutable adicional fuera de esa cobertura.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa documentalmente la auditoría analítica usando obligaciones de trazabilidad, autorización, privacidad, artefactos y mejora basada en datos que ya cuentan con cobertura canónica. No implementa persistencia, logging, RLS, RPC, exportaciones, entregas, alertas, modelos o recomendaciones y no modifica el comportamiento ejecutable vigente.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 26. Criterios de aceptación

1. existen exactamente seis familias auditables: consulta, descarga, suscripción, alerta, modelo y recomendación;
2. cada familia conserva finalidad y unidad lógica distintas;
3. auditoría no se usa como autorización, fuente de verdad, certificación, publicación o causalidad;
4. la operación empresarial y sus intentos técnicos permanecen separados;
5. denegaciones, reintentos, rollback y administración conservan evidencia cuando el contrato transversal lo exige;
6. un fallo técnico no se registra como `DENY` empresarial por inferencia;
7. el evento conserva principal, actor efectivo y principal técnico cuando sean aplicables;
8. finalidad, recurso, acción exacta, alcance y contexto material pueden reconstruirse;
9. la evidencia de autorización conserva referencias y versiones suficientes para explicar la decisión;
10. población, periodo, corte, filtros y dimensiones materiales permanecen trazables sin duplicar el dataset;
11. clasificación, política de campos y regla de divulgación se conservan cuando afectan la salida;
12. calidad, frescura y cobertura se conservan cuando condicionan el uso;
13. la propia auditoría aplica minimización y sensibilidad;
14. secretos, tokens y credenciales no aparecen en el evento ordinario;
15. datos personales, financieros, médicos, comerciales y técnicos sensibles se referencian de forma protegida cuando sea suficiente;
16. resultados de consulta no se almacenan fila por fila en el evento;
17. celdas suprimidas y poblaciones protegidas no reaparecen mediante metadatos de auditoría;
18. cada drill-down que sea nueva solicitud conserva evidencia propia;
19. búsqueda, paginación, conteos y metadatos sensibles no evaden el contrato;
20. generación de exportación y obtención del artefacto permanecen hechos distintos y correlacionables;
21. un enlace temporal no constituye autoridad por sí mismo;
22. una nueva obtención no reescribe una anterior;
23. una transferencia incompleta no se presenta como entrega íntegra sin evidencia;
24. gobierno de suscripción y ejecuciones de entrega permanecen separados;
25. cada entrega de suscripción reevalúa autorización y conserva corte/version propios;
26. reintentos de suscripción no justifican efectos duplicados;
27. evaluación de alerta, señal y distribución permanecen separadas;
28. alerta no equivale a diagnóstico, recomendación o acción;
29. cero, ausencia y estados de dato no se colapsan en auditoría de alertas;
30. una ejecución de modelo conserva propósito, identidad/version, entrada versionada, corte, población y resultado por referencia;
31. un modelo no adquiere autoridad causal ni certifica sus entradas;
32. una credencial técnica no sustituye autorización empresarial del modelo;
33. prompts, features, embeddings y outputs sensibles se minimizan;
34. recomendación conserva origen, contexto, confianza y limitaciones cuando existan;
35. recomendación no fija meta, modifica baseline, certifica datos ni ejecuta acción;
36. una acción D016 solo se correlaciona cuando existe como decisión independiente y autorizada;
37. correcciones, supersesiones y restatements son aditivos y no reescriben eventos históricos;
38. retención, hold y disposición permanecen bajo NFR/INFO y no se inventan duraciones locales;
39. lectura o administración de la auditoría exige autoridad diferenciada;
40. se materializan exactamente 62 objetos, con 43 maestros, 19 referencias y tres AURA bloqueados;
41. cada uno de los 62 objetos tiene decisión A004 explícita;
42. se materializan exactamente 14 métricas y se conservan 11 `NO EVALUADO` y 3 `BLOQUEADO`;
43. cada una de las 14 métricas tiene decisión A004 explícita;
44. se materializan exactamente 55 familias y se conserva `11 + 12 + 10 + 12 + 10`;
45. cada una de las 55 familias tiene decisión A004 explícita;
46. se materializan exactamente seis familias D008 con decisión A004 explícita;
47. ningún evento eleva estado DQ, certificación, publicación o autoridad por existir;
48. no se crea permiso, rol, fuente, métrica, modelo o recomendación;
49. no se modifica código, DDL, DML, RLS, RPC, grants, datos, migraciones, backfills, despliegues o Supabase;
50. no se crea ni modifica ningún requisito de prueba;
51. `DATA-UX-001` permanece únicamente reservada.

---

#### 27. Continuidad

ÚLTIMA TAREA APROBADA
`DATA-AUTH-003 — Separar definición, certificación, publicación, fijación de metas, anotación, exportación y administración`

TAREA ACTUAL APROBADA
`DATA-AUTH-004 — Auditar consultas, descargas, suscripciones, alertas, modelos y recomendaciones`

SIGUIENTE TAREA RESERVADA
`DATA-UX-001 — Diseñar inicio ejecutivo simple y accionable por rol`
