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


### [ ] DATA-AUTH-002 — Proteger información sensible, poblaciones pequeñas, comparaciones, exportaciones y drill-down
### [ ] DATA-AUTH-003 — Separar definición, certificación, publicación, fijación de metas, anotación, exportación y administración
### [ ] DATA-AUTH-004 — Auditar consultas, descargas, suscripciones, alertas, modelos y recomendaciones
