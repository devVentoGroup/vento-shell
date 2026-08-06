### MINI-BLOQUE — EXPERIENCIA USABILIDAD Y APROBACIÓN

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **experiencia usabilidad y aprobación** dentro de **I NAVEGACIÓN Y PANTALLAS**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `AUTH-UI-046` a `AUTH-UI-060` — 15 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Mostrar contexto activo en cada aplicación” y concluye con “Aprobar la pantalla antes de retirarla del roadmap”.
<!-- PLAN-SECTION-META:END -->

### [ ] AUTH-UI-046 — Mostrar contexto activo en cada aplicación
### [ ] AUTH-UI-047 — Mostrar rol simulado claramente
### [ ] AUTH-UI-048 — Estandarizar estados sin acceso
### [ ] AUTH-UI-049 — Estandarizar estados de carga
### [ ] AUTH-UI-050 — Estandarizar estados vacíos
### [ ] AUTH-UI-051 — Estandarizar errores recuperables
### ✅ AUTH-UI-052 — Diseñar página inicial según actor

**Estado:** APROBADA
**Tarea anterior:** `NEXO-UX-025 — Definir métricas de tiempo, error y capacitación para el piloto operativo` — APROBADA
**Tarea siguiente:** `AUTH-UI-053 — Diseñar navegación según tareas frecuentes` — RESERVADA
**Tipo de tarea:** documental; diseño funcional materializado de la página inicial de NEXO según actor efectivo, función activa, contexto territorial, trabajo autorizado y modalidad de dispositivo
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/I_NAVEGACION_Y_PANTALLAS/06_EXPERIENCIA_USABILIDAD_Y_APROBACION.md`
**Repositorio de aplicación inspeccionado:** `vento-nexo`
**Ruta prioritaria:** `NEXO-REMISSIONS-001`
**Etapa prioritaria:** `NEXO_UI_VALIDATION`
**Superficie propietaria:** `NEXO-ROUTE-001` — `/`
**Cambios físicos autorizados:** ninguno; no modifica código, rutas, permisos, roles, procesos, datos, Supabase, migraciones, RLS, configuración ni despliegues

---

#### 1. Propósito

Diseñar la página inicial de NEXO como una proyección de trabajo resuelta según
el actor efectivo, la función activa y el contexto autorizado, sin convertir el
nombre de un rol, la URL, el dispositivo o la presencia de una tarjeta en una
fuente de autoridad.

La regla canónica es:

```text
PRINCIPAL AUTENTICADO
+
ACTOR EFECTIVO ATRIBUIBLE
+
FUNCIÓN ACTIVA
+
CONTEXTO TERRITORIAL Y LABORAL VIGENTE
+
DISPOSITIVO Y SESIÓN COMPATIBLES
+
PERMISOS, RECURSOS, ETAPAS Y RELACIONES RESUELTOS EN SERVIDOR
+
PRIORIDAD DE TRABAJO AUTORITATIVA
→
UNA SOLA PROYECCIÓN INICIAL COHERENTE
```

La página inicial organiza y presenta trabajo autorizado. No concede permisos,
no mezcla funciones, no crea procesos y no sustituye las comprobaciones de
servidor aplicables a cada lectura o mutación.

---

#### 2. Resultado material

Se aprueban ocho artefactos documentales consumibles:

1. `NEXO-ACTOR-HOME-PAGE-CONTRACT-001`, que define la identidad, autoridad,
   límites y comportamiento común de la página inicial;
2. `NEXO-ACTOR-HOME-RESOLUTION-MATRIX-001`, que materializa una decisión para
   los ocho contextos de actor, función y dispositivo aprobados;
3. `NEXO-ACTOR-HOME-COMPOSITION-MATRIX-001`, que vincula cada contexto con su
   contrato de inicio, entradas prioritarias, contenido secundario y
   ocultamientos obligatorios;
4. `NEXO-ACTOR-HOME-INFORMATION-ARCHITECTURE-001`, que define ocho zonas de
   composición sin alterar el orden interno de cada proyección aprobada;
5. `NEXO-ACTOR-HOME-PRIORITY-CONTRACT-001`, que define selección de proyección,
   acción primaria y siguiente trabajo sin prioridad calculada por el cliente;
6. `NEXO-ACTOR-HOME-STATE-CONTRACT-001`, que materializa diez resultados de
   presentación y sus reglas de recuperación;
7. `NEXO-ACTOR-HOME-RESPONSIVE-ACCESSIBILITY-CONTRACT-001`, que define
   comportamiento en móvil, tablet, escritorio y estación compartida;
8. `NEXO-ACTOR-HOME-HANDOFF-001`, que entrega el diseño a la navegación por
   tareas frecuentes sin iniciar la tarea siguiente.

Cobertura materializada:

| Elemento                                      | Total esperado | Total materializado | Faltantes | Duplicados |
| --------------------------------------------- | -------------: | ------------------: | --------: | ---------: |
| Superficies iniciales existentes reutilizadas |              1 |                   1 |         0 |          0 |
| Contextos canónicos resueltos                 |              8 |                   8 |         0 |          0 |
| Proyecciones funcionales principales          |              6 |                   6 |         0 |          0 |
| Casos especiales de composición               |              2 |                   2 |         0 |          0 |
| Zonas de composición                          |              8 |                   8 |         0 |          0 |
| Resultados de presentación                    |             10 |                  10 |         0 |          0 |
| Rutas nuevas                                  |              0 |                   0 |         0 |          0 |
| Roles o funciones nuevas                      |              0 |                   0 |         0 |          0 |
| Permisos nuevos                               |              0 |                   0 |         0 |          0 |
| Requisitos de prueba nuevos o modificados     |              0 |                   0 |         0 |          0 |

El resultado queda `ESPECIFICADO`. No se declara `IMPLEMENTADO`, `VALIDADO` ni
disponible en producción.

---

#### 3. Decisiones y contratos consumidos

La tarea consume sin modificar:

- `NEXO-REQUESTER-HOME-CONTRACT-001` y su arquitectura de información;
- `NEXO-WAREHOUSE-HOME-CONTRACT-001` y sus colas operativas;
- `NEXO-DRIVER-HOME-CONTRACT-001` y su composición de custodia;
- `NEXO-RECEIVER-HOME-CONTRACT-001` y su composición de recepción;
- `NEXO-SUPERVISOR-HOME-CONTRACT-001` y sus colas de control;
- `NEXO-TASK-NAVIGATION-CONTRACT-001`;
- `NEXO-NAVIGATION-TASK-CATALOG-001`;
- `NEXO-ACTOR-TASK-COMPOSITION-MATRIX-001`;
- `NEXO-ROUTE-TO-TASK-REGISTRY-001`;
- `NEXO-NAVIGATION-ENTRY-RETURN-CONTRACT-001`;
- contratos aprobados de lectura, acciones, turno, check-in, sede, área,
  dispositivo compartido, simulación, sensibilidad y masking;
- contratos vigentes de razones de autorización y estados interactivos
  auxiliares;
- requisitos `TREQ-*` vigentes asociados a los contratos anteriores.

No se renombra ninguna identidad consumida ni se altera la distribución de
familias, tareas, rutas, procesos, etapas o responsabilidades aprobadas.

---

#### 4. Alcance y límites

##### 4.1. Incluido

- resolución de una proyección inicial según actor efectivo y función activa;
- contexto visible de actor, sede, área, turno, check-in y dispositivo cuando
  resulten aplicables;
- una acción primaria coherente con la proyección activa;
- siguiente trabajo y colas autorizadas resueltos por el servidor;
- contenido secundario limitado a referencias necesarias para la tarea;
- separación explícita entre operación, supervisión y configuración;
- composición segura para una persona con varias funciones;
- comportamiento de estación compartida con actor humano activo;
- carga, vacío, parcialidad, denegación, fallo técnico, revocación y estados
  interactivos auxiliares;
- reglas responsive, accesibilidad, privacidad y minimización.

##### 4.2. Excluido

- diseñar el menú y la navegación completa por frecuencia;
- reducir opciones irrelevantes fuera de la página inicial;
- crear prototipos visuales;
- validar con usuarios;
- implementar componentes, consultas, guards, resolutores o telemetría;
- crear una ruta adicional por actor;
- inferir permisos desde nombres de rol;
- mezclar acciones de solicitante, bodega, conductor, receptor, supervisor o
  configuración en una única vista operativa;
- mostrar métricas de productividad individual;
- ejecutar cambios físicos o desplegados.

---

#### 5. `NEXO-ACTOR-HOME-PAGE-CONTRACT-001`

##### 5.1. Identidad de la superficie

La página inicial reutiliza exclusivamente `NEXO-ROUTE-001` con patrón `/`.
No se crean rutas como `/home-bodeguero`, `/home-conductor` o equivalentes.
La misma superficie obtiene una respuesta distinta porque cambia el contexto
autoritativo, no porque el cliente elija una URL o envíe un rol.

##### 5.2. Autoridad

La proyección se calcula con la intersección de:

- principal autenticado;
- actor efectivo;
- función activa;
- rol base y rol operativo cuando apliquen;
- turno y check-in cuando sean obligatorios;
- sede, área, LOC, origen, destino o territorio aplicables;
- dispositivo, paquete y sesión de actor cuando apliquen;
- permisos de lectura y acción exactos;
- asignación, participación, custodia, handoff o responsabilidad válida;
- estado, etapa, versión y frescura del recurso.

Una ausencia, conflicto o revocación de un componente requerido falla cerrado.
La página nunca obtiene un universo global para ocultarlo después en el
cliente.

##### 5.3. Proyección única

En cada render existe una sola proyección activa. El actor puede tener varias
funciones autorizadas, pero sus controles no se fusionan. Cambiar de función
provoca una resolución completa nueva antes de presentar información o
acciones.

##### 5.4. No autoridad de presentación

No conceden autoridad:

- una tarjeta visible;
- un conteo;
- un elemento de navegación;
- una ruta directa;
- un nombre de cargo;
- `navigation_role`;
- el tipo de dispositivo;
- haber participado en otra etapa;
- pertenecer a la misma sede;
- conocer un identificador;
- haber tenido acceso en una sesión anterior.

---

#### 6. `NEXO-ACTOR-HOME-RESOLUTION-MATRIX-001`

| Caso           | Contexto canónico                       | Proyección activa                             | Entrada prioritaria                                                                                               | Acción primaria                                        | Regla de resolución                                                                            | Estado         |
| -------------- | --------------------------------------- | --------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------ | ---------------------------------------------------------------------------------------------- | -------------- |
| `HOME-CTX-001` | solicitante autorizado                  | `NEXO-REQUESTER-HOME-CONTRACT-001`            | `NEXO-TASK-003` y solicitudes propias continuables                                                                | `NUEVA SOLICITUD` cuando la autorización permita crear | actor, participación propia, territorio y permiso exacto resueltos en servidor                 | `ESPECIFICADO` |
| `HOME-CTX-002` | bodeguero o preparador autorizado       | `NEXO-WAREHOUSE-HOME-CONTRACT-001`            | `NEXO-TASK-004`, `NEXO-TASK-007` a `NEXO-TASK-011` según trabajo vigente                                          | `CONTINUAR_SIGUIENTE_TAREA`                            | función de bodega, turno, área warehouse, asignación, recurso y prioridad autoritativa         | `ESPECIFICADO` |
| `HOME-CTX-003` | conductor o custodio autorizado         | `NEXO-DRIVER-HOME-CONTRACT-001`               | `NEXO-TASK-005`                                                                                                   | `CONTINUAR_SIGUIENTE_TAREA`                            | jornada, asignación, ruta, vehículo, custodia, etapa y permiso compatibles                     | `ESPECIFICADO` |
| `HOME-CTX-004` | receptor autorizado                     | `NEXO-RECEIVER-HOME-CONTRACT-001`             | `NEXO-TASK-006` y `NEXO-TASK-007` cuando el origen empresarial lo permita                                         | `CONTINUAR_SIGUIENTE_TAREA`                            | función receptora, destino, handoff, custodia, segregación y permiso exacto                    | `ESPECIFICADO` |
| `HOME-CTX-005` | supervisor con cobertura territorial    | `NEXO-SUPERVISOR-HOME-CONTRACT-001`           | `NEXO-TASK-012`; referencias `NEXO-TASK-013` a `NEXO-TASK-017` y `NEXO-TASK-026` según permiso                    | `CONTINUAR_SIGUIENTE_TAREA`                            | cobertura, responsabilidad, conflicto, evidencia, autorización atómica y segregación           | `ESPECIFICADO` |
| `HOME-CTX-006` | configurador autorizado                 | `NEXO-TASK-NAVIGATION-CONTRACT-001`           | `NEXO-TASK-021`; referencias `NEXO-TASK-020`, `NEXO-TASK-022` a `NEXO-TASK-025` y `NEXO-TASK-027` según capacidad | abrir la tarea de configuración prioritaria autorizada | capacidad administrativa exacta y territorio, sin ejecución física ni supervisión implícita    | `ESPECIFICADO` |
| `HOME-CTX-007` | persona con varias funciones            | proyección de la función activa               | siguiente tarea autoritativa de la función activa                                                                 | la definida por la proyección activa                   | las otras funciones aparecen únicamente como cambio de contexto separado y sin datos mezclados | `ESPECIFICADO` |
| `HOME-CTX-008` | dispositivo compartido con actor activo | proyección compatible con actor y dispositivo | tareas compatibles con dispositivo, actor, turno y contexto                                                       | la definida por la proyección activa                   | la identidad del dispositivo limita; nunca sustituye actor, permiso, turno o territorio        | `ESPECIFICADO` |

Reconciliación:

```text
EXPECTED_CONTEXTS = 8
MATERIALIZED_CONTEXTS = 8
UNIQUE_CONTEXT_IDS = 8
MISSING_CONTEXTS = 0
DUPLICATE_CONTEXTS = 0
```

---

#### 7. `NEXO-ACTOR-HOME-COMPOSITION-MATRIX-001`

| Proyección             | Contenido principal                                                                                    | Contenido secundario permitido                                                 | Ocultamiento obligatorio                                                                                 |
| ---------------------- | ------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------- |
| solicitante            | creación autorizada, solicitudes propias, siguiente paso y estado                                      | referencia mínima de solicitud y resultado propio                              | preparación, conducción, recepción, supervisión, configuración, stock global y costos                    |
| bodega                 | siguiente tarea, recepción, ubicación, preparación, handoff, movimientos, conteos y reportes asignados | stock, LOC, movimientos, lote, LPN, impresión y escaneo vinculados a una tarea | creación de solicitudes ajenas, tránsito, decisiones supervisoras, configuración y métricas individuales |
| conductor              | recogida, custodia, tránsito, parada, entrega, incidente, retorno y bloqueo asignados                  | manifiesto, carga, sello, evidencia y referencias de ruta necesarias           | solicitud, picking, recepción, ajustes, configuración y trabajo ajeno                                    |
| receptor               | arribos, handoff, verificación, recepción parcial o completa, diferencias y evidencia                  | existencia, ubicación y documento necesarios para recibir                      | conducción, preparación, decisiones supervisoras, configuración y datos de otros destinos                |
| supervisor             | bloqueos, vencimientos, excepciones, diferencias, autorizaciones, cumplimiento, cierre y continuidad   | referencias territoriales y evidencia necesarias para decidir                  | mutaciones operativas, configuración no concedida y métricas individuales fuera de propósito             |
| configuración          | tarea administrativa exacta y capacidades publicadas                                                   | referencias de catálogo o política indispensables                              | ejecución física, supervisión, colas operativas y autoridad derivada del cargo                           |
| multifunción           | una sola proyección activa                                                                             | selector de función autorizada sin datos previos de la otra proyección         | controles mezclados, autoaprobación, herencia de autoridad y acciones cruzadas                           |
| dispositivo compartido | proyección mínima compatible con la estación y el actor activo                                         | utilidades contextuales requeridas por la tarea                                | datos sensibles no necesarios, administración y toda acción sin actor atribuible                         |

Las secciones vacías no se sustituyen por contenido de otra función ni por
accesos técnicos.

---

#### 8. `NEXO-ACTOR-HOME-INFORMATION-ARCHITECTURE-001`

La página utiliza ocho zonas de composición. Cada proyección conserva el orden,
las secciones y el lenguaje de su contrato aprobado; estas zonas son el
contenedor común y no renombran su contenido interno.

| Orden | Zona común                  | Regla                                                                                                                               |
| ----: | --------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
|     1 | Contexto activo             | muestra actor, función, sede, área, turno, dispositivo y frescura aplicables; no expone permisos ni detalles internos               |
|     2 | Acción primaria             | presenta una sola acción primaria válida para la proyección activa; se oculta cuando falta autorización                             |
|     3 | Siguiente trabajo           | muestra una tarea autoritativa o un vacío válido; no calcula prioridad en el cliente                                                |
|     4 | Trabajo en curso            | agrupa únicamente instancias propias, asignadas, participadas o bajo custodia válida                                                |
|     5 | Entradas y handoffs         | presenta arribos, entregas o continuaciones que requieren participación del actor activo                                            |
|     6 | Bloqueos y excepciones      | explica causa, efecto, propietario y recuperación segura sin sugerir bypass                                                         |
|     7 | Referencias contextuales    | ofrece datos y utilidades necesarios para la tarea sin convertirlos en navegación global                                            |
|     8 | Cambio de contexto y sesión | permite resolver otra función autorizada o cerrar/cambiar actor de forma controlada; nunca conserva datos de la proyección anterior |

Reglas de jerarquía:

1. contexto y acción primaria preceden a listas y referencias;
2. el siguiente trabajo precede a accesos secundarios;
3. bloqueos críticos preceden a contenido informativo;
4. una referencia nunca compite visualmente con la acción primaria;
5. la configuración no ocupa espacio en proyecciones operativas;
6. los conteos describen trabajo, no desempeño individual;
7. toda sección conserva una salida accesible de carga, vacío, parcialidad o
   fallo;
8. el cambio de función es explícito y provoca una nueva resolución.

---

#### 9. `NEXO-ACTOR-HOME-PRIORITY-CONTRACT-001`

##### 9.1. Selección de proyección

La selección ocurre antes de consultar datos de la página. El resolutor no
utiliza una precedencia fija de cargos; evalúa funciones vigentes y exige una
función activa cuando exista más de una posibilidad compatible.

##### 9.2. Acción primaria

- solicitante: `NUEVA SOLICITUD`, solo cuando la creación esté autorizada;
- bodeguero, conductor, receptor y supervisor:
  `CONTINUAR_SIGUIENTE_TAREA`;
- configurador: abrir únicamente la tarea administrativa prioritaria ya
  autorizada;
- multifunción y dispositivo compartido: heredan la acción de la proyección
  activa, sin añadir una acción paralela.

No aparece una acción primaria si el resultado autoritativo no incluye acción,
recurso, etapa, territorio, versión y condición de ejecución compatibles.

##### 9.3. Prioridad de trabajo

La prioridad se entrega resuelta por el servidor y conserva las reglas del
contrato propietario de cada proyección. El cliente puede ordenar
presentación secundaria, pero no puede aumentar prioridad, cambiar propietario,
reclasificar severidad ni convertir una referencia en tarea ejecutable.

##### 9.4. Reanudación

Una tarea reanudada conserva identidad, instancia, actor, función, contexto,
etapa y versión. Una URL directa revalida el mismo conjunto antes de mostrar
datos o acciones.

---

#### 10. Binding de superficie y navegación

1. `NEXO-ROUTE-001` es la única entrada inicial.
2. La página consume tareas humanas y bindings aprobados; no organiza el inicio
   por segmentos de URL.
3. Las rutas de escáner, kiosco, código, alias y utilidades se abren desde una
   tarea y regresan a la tarea invocante.
4. Breadcrumb, retorno y reanudación conservan tarea e instancia, no una ruta
   técnica como identidad empresarial.
5. La navegación secundaria completa pertenece a `AUTH-UI-053` y permanece
   reservada.
6. Un acceso directo nunca crea una entrada visible ni concede autoridad.

---

#### 11. `NEXO-ACTOR-HOME-STATE-CONTRACT-001`

| Resultado                          | Condición                                                                                   | Presentación obligatoria                                          | Acción permitida                                                |
| ---------------------------------- | ------------------------------------------------------------------------------------------- | ----------------------------------------------------------------- | --------------------------------------------------------------- |
| `RESOLVIENDO_CONTEXTO`             | todavía no existe actor, función y contexto concluyentes                                    | estructura mínima sin conteos, colas ni datos empresariales       | esperar o cancelar resolución                                   |
| `ACTOR_IDENTIFICATION_REQUIRED`    | dispositivo compartido válido sin actor humano activo                                       | flujo de identificación separado, sin presentarlo como denegación | identificar actor mediante mecanismo autorizado                 |
| `STRONG_REAUTHENTICATION_REQUIRED` | la acción o sensibilidad exige soporte fuerte vigente                                       | solicitud de reautenticación separada y propósito visible         | iniciar una solicitud nueva de soporte fuerte                   |
| `CARGANDO_PROYECCION`              | contexto resuelto y datos todavía en carga                                                  | contexto visible, controles deshabilitados y esqueleto coherente  | cancelar navegación o esperar                                   |
| `PROYECCION_LISTA`                 | contexto, autorización y datos elegibles completos                                          | arquitectura de la proyección activa y una acción primaria        | ejecutar solo comandos incluidos en la respuesta autoritativa   |
| `VACIO_VALIDO`                     | no existe trabajo elegible y la consulta fue concluyente                                    | mensaje de ausencia real sin fabricar conteos ni accesos alternos | acción primaria propia si continúa autorizada                   |
| `DATOS_PARCIALES`                  | una sección falló o perdió frescura mientras otras siguen confirmadas                       | identificar sección afectada y último dato confirmado             | lectura segura y reintento de consulta; no mutación dependiente |
| `AUTORIZACION_DENEGADA`            | evaluación concluyente de denegación                                                        | mensaje canónico minimizado, sesión preservada y cero efectos     | recuperación segura derivada del perfil, sin bypass             |
| `FALLO_TECNICO`                    | no existe una decisión estable por indisponibilidad o error                                 | mensaje técnico recuperable sin presentarlo como política         | reintentar consulta cuando sea seguro                           |
| `CONTEXTO_CAMBIADO_O_REVOCADO`     | actor, función, turno, territorio, dispositivo, asignación o versión dejaron de ser válidos | retirar datos y acciones de la proyección anterior                | resolver nuevamente el contexto                                 |

Reglas transversales:

- los dos estados interactivos auxiliares no se presentan como `403`;
- una denegación no se presenta como fallo técnico;
- un fallo técnico no se degrada a vacío;
- datos parciales no se completan con cero o valores estimados;
- una acción revocada desaparece antes de permitir otra mutación;
- un resultado desconocido de una escritura no se presenta como éxito ni se
  reintenta automáticamente desde la página inicial.

---

#### 12. Multifunción y dispositivo compartido

##### 12.1. Persona con varias funciones

- el selector muestra únicamente funciones autorizadas y vigentes;
- la función activa es visible y no se infiere desde la última ruta visitada;
- cambiar de función invalida datos, conteos, acciones y caché de la proyección
  anterior;
- cada acción conserva segregación y no permite autoaprobar, autopreparar,
  autotransportar o autorecibir cuando el contrato lo prohíba;
- las otras funciones no aparecen como tarjetas accionables dentro del mismo
  home.

##### 12.2. Estación compartida

- el dispositivo se identifica antes de habilitar la aplicación;
- el actor humano se identifica antes de mostrar trabajo atribuible;
- actor, dispositivo y contexto se conservan juntos en cada acción;
- cambiar o cerrar actor retira información sensible y acciones;
- la estación limita aplicaciones y capacidades máximas, pero no aporta rol,
  permiso, turno, check-in ni territorio;
- las tareas incompatibles con la estación no se muestran como bloqueadas: no
  forman parte de la proyección.

---

#### 13. `NEXO-ACTOR-HOME-RESPONSIVE-ACCESSIBILITY-CONTRACT-001`

##### 13.1. Móvil

- contexto compacto y acción primaria visibles antes del primer desplazamiento
  largo;
- una columna;
- siguiente trabajo antes de referencias;
- tablas convertidas en estructuras semánticas sin perder etiquetas;
- ninguna acción crítica depende de hover o gesto oculto.

##### 13.2. Tablet

- contexto, siguiente trabajo y primera cola visibles sin convertir la página
  en tablero supervisor;
- objetivos táctiles compatibles con operación física;
- escaneo e impresión aparecen únicamente cuando la tarea los requiere;
- orientación y tamaño no cambian autoridad ni prioridad.

##### 13.3. Escritorio

- máximo dos columnas para contenido operativo;
- el espacio adicional no habilita configuración, métricas ni trabajo ajeno;
- detalle resumido y lista conservan orden de lectura y foco.

##### 13.4. Accesibilidad

- orden de foco equivalente a las ocho zonas;
- nombre y propósito estables para la acción primaria;
- estados, severidad y bloqueo no dependen solo del color;
- cambios importantes se anuncian de forma accesible;
- errores se asocian con la zona afectada;
- conteos tienen etiqueta, unidad y contexto;
- el cambio de función y actor es explícito y confirmable;
- la información sensible no se expone en atributos, URLs, títulos o mensajes.

---

#### 14. Seguridad, privacidad y minimización

1. La autorización filtra datos antes de construir la proyección.
2. La página no consulta datos globales para filtrarlos en el navegador.
3. Cada acción vuelve a validar actor, función, permiso, territorio, recurso,
   etapa y versión.
4. La página aplica los contratos de sensibilidad y masking vigentes.
5. No expone claves de permiso, reglas RLS, reason codes internos, nombres de
   tablas, trazas ni actores elegibles.
6. Simulación, cuando sea admisible, permanece visualmente diferenciada y no
   produce acciones reales.
7. Los datos personales de terceros se minimizan a la función o identificación
   estrictamente necesaria.
8. Los costos, saldos, existencias sensibles, notas de control y evidencia no
   aparecen fuera de la necesidad de la tarea.
9. Un conteo agregado no permite inferir trabajo, datos o recursos fuera del
   territorio autorizado.
10. Cerrar sesión, cambiar actor o revocar contexto elimina la proyección y sus
    datos temporales.

---

#### 15. Estado técnico y brecha de implementación

| Elemento                                                                      | Estado documental        | Evidencia permitida                        | Condición de salida                                        |
| ----------------------------------------------------------------------------- | ------------------------ | ------------------------------------------ | ---------------------------------------------------------- |
| contratos de inicio por solicitante, bodega, conductor, receptor y supervisor | `ESPECIFICADO`           | tareas `NEXO-UX-003` a `NEXO-UX-007`       | consumo íntegro en prototipo e implementación              |
| navegación por tareas y composición de ocho contextos                         | `ESPECIFICADO`           | `NEXO-UX-008`                              | binding físico y pruebas posteriores                       |
| flujo funcional de remisiones y estados de experiencia                        | `ESPECIFICADO`           | `NEXO-UX-009` a `NEXO-UX-025`              | prototipo, implementación y evidencia                      |
| superficie raíz existente                                                     | `IMPLEMENTADO_PARCIAL`   | `NEXO-ROUTE-001` en `vento-nexo`           | sustituir composición agregada por resolución autoritativa |
| página inicial según actor                                                    | `ESPECIFICADO`           | esta tarea                                 | `AUTH-UI-055`, implementación NEXO y pruebas               |
| prototipo visual por función                                                  | `NO_IMPLEMENTADO`        | no existe evidencia aprobada en esta tarea | `AUTH-UI-055`                                              |
| validación de usabilidad                                                      | `PENDIENTE_DE_EVIDENCIA` | no ejecutada                               | `AUTH-UI-056` a `AUTH-UI-060`                              |

La existencia de la ruta raíz no demuestra que el diseño aquí definido esté
implementado o validado.

---

#### 16. Criterios de aceptación

La tarea se considera documentalmente completa cuando se confirme que:

- existe exactamente una superficie inicial, `NEXO-ROUTE-001` — `/`;
- los ocho contextos canónicos tienen una decisión explícita;
- las seis proyecciones principales conservan sus contratos propietarios;
- multifunción y dispositivo compartido no crean proyecciones adicionales;
- la resolución depende de actor efectivo, función, contexto, permiso, recurso
  y etapa, no de un nombre de rol enviado por cliente;
- existe una sola proyección y una sola acción primaria por render;
- solicitante, bodega, conductor, receptor, supervisor y configuración no
  mezclan controles;
- el selector multifunción provoca una nueva resolución y retira datos previos;
- el dispositivo compartido no sustituye al actor humano;
- las ocho zonas comunes no alteran el orden interno de cada home aprobado;
- prioridad y siguiente trabajo se resuelven en servidor;
- rutas, deep links, kioscos y escáner no conceden autoridad;
- los diez resultados de presentación distinguen interacción, denegación,
  fallo técnico, vacío, parcialidad y revocación;
- móvil, tablet, escritorio y estación compartida tienen reglas explícitas;
- la página conserva accesibilidad, minimización, sensibilidad y masking;
- no se crean rutas, roles, funciones, procesos, permisos ni requisitos nuevos;
- todas las brechas tienen propietario y condición de salida;
- `AUTH-UI-053` permanece únicamente reservada.

---

#### 17. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación: esta tarea no introduce un comportamiento autorizativo,
operativo, de navegación o de seguridad nuevo. Materializa la composición de la
superficie inicial usando exclusivamente contratos, matrices, estados y
requisitos vigentes ya aprobados para los inicios por función y la navegación
por tareas. No modifica, difiere, descarta ni declara obsoleto ningún requisito
histórico, por lo que el Registro Canónico de Requisitos de Prueba no cambia.

---

#### 18. `NEXO-ACTOR-HOME-HANDOFF-001`

| Destino                        | Handoff aprobado                                                                                                                                                                  |
| ------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `AUTH-UI-053`                  | diseñar la navegación según tareas frecuentes consumiendo la proyección activa, las entradas prioritarias y los ocultamientos definidos aquí, sin cambiar la resolución por actor |
| `AUTH-UI-054`                  | reducir opciones irrelevantes sin eliminar trabajo autorizado ni usar frecuencia como fuente de permiso                                                                           |
| `AUTH-UI-055`                  | crear prototipos separados por proyección y por casos multifunción y dispositivo compartido                                                                                       |
| `AUTH-UI-056`                  | validar el prototipo sin presentar inspección documental como prueba con usuarios                                                                                                 |
| `AUTH-UI-057` a `AUTH-UI-060`  | definir criterios, probar, registrar problemas y aprobar pantallas con evidencia real                                                                                             |
| paquete de implementación NEXO | construir resolutor, componentes, consultas, guards, estados, pruebas y telemetría cuando la continuidad lo autorice                                                              |

Ningún destino anterior se inicia mediante esta tarea.

---

#### 19. Continuidad canónica

**ÚLTIMA TAREA APROBADA**

`NEXO-UX-025 — Definir métricas de tiempo, error y capacitación para el piloto operativo`

**TAREA ACTUAL APROBADA**

`AUTH-UI-052 — Diseñar página inicial según actor`

**SIGUIENTE TAREA RESERVADA**

`AUTH-UI-053 — Diseñar navegación según tareas frecuentes`


### ✅ AUTH-UI-053 — Diseñar navegación según tareas frecuentes

**Estado:** APROBADA
**Tarea anterior:** `AUTH-UI-052 — Diseñar página inicial según actor` — APROBADA
**Tarea siguiente:** `AUTH-UI-054 — Reducir opciones irrelevantes` — RESERVADA
**Tipo de tarea:** documental; diseño funcional materializado de navegación de NEXO según tareas frecuentes, elegibilidad autoritativa, función activa, trabajo vigente, recurrencia verificable, continuidad reciente y modalidad de dispositivo
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/I_NAVEGACION_Y_PANTALLAS/06_EXPERIENCIA_USABILIDAD_Y_APROBACION.md`
**Repositorio de aplicación inspeccionado:** `vento-nexo`
**Ruta prioritaria:** `NEXO-REMISSIONS-001`
**Etapa prioritaria:** `NEXO_UI_VALIDATION`
**Superficie inicial consumida:** `NEXO-ROUTE-001` — `/`
**Cambios físicos autorizados:** ninguno; no modifica código, rutas, permisos, roles, procesos, datos, Supabase, migraciones, RLS, configuración, telemetría ni despliegues

---

#### 1. Propósito

Diseñar la navegación de NEXO para que cada actor encuentre primero el trabajo
que realmente puede y suele ejecutar dentro de su función activa, sin convertir
historial de clics, frecuencia, orden visual, una URL o un nombre de rol en
fuente de autoridad.

La regla canónica es:

```text
ACTOR EFECTIVO Y FUNCIÓN ACTIVA
+
CONTEXTO, TERRITORIO Y DISPOSITIVO VIGENTES
+
CONJUNTO DE TAREAS AUTORIZADAS RESUELTO EN SERVIDOR
+
TRABAJO ACTIVO, CUSTODIA, HANDOFF, VENCIMIENTO Y BLOQUEO
+
CONTINUACIONES RECIENTES TODAVÍA VÁLIDAS
+
RECURRENCIA VERIFICABLE DE TAREAS ELEGIBLES
→
NAVEGACIÓN CORTA, ESTABLE Y ORIENTADA A TAREAS FRECUENTES
```

La frecuencia únicamente ordena opciones que ya son elegibles. Nunca crea
permisos, amplía territorio, cambia la función activa, convierte una referencia
en mutación ni permite omitir la revalidación de servidor.

---

#### 2. Resultado material

Se materializan siete artefactos documentales consumibles:

1. `NEXO-FREQUENT-TASK-NAVIGATION-CONTRACT-001`, que define identidad,
   jerarquía, límites, cantidades máximas y reglas de exposición;
2. `NEXO-FREQUENCY-SIGNAL-CONTRACT-001`, que define señales permitidas,
   precedencia, evidencia, desempate y prohibiciones;
3. `NEXO-ACTOR-FREQUENT-TASK-MATRIX-001`, que decide la navegación para los
   ocho contextos aprobados;
4. `NEXO-TASK-PLACEMENT-REGISTER-001`, que asigna una disposición explícita a
   las veintinueve tareas del catálogo canónico;
5. `NEXO-RECENT-CONTINUATION-CONTRACT-001`, que define reanudación segura,
   invalidez y retiro de accesos recientes;
6. `NEXO-FREQUENT-TASK-STATE-CONTRACT-001`, que materializa diez estados de
   interfaz y recuperación;
7. `NEXO-FREQUENT-TASK-HANDOFF-001`, que entrega las decisiones a la reducción
   de opciones y al prototipo sin iniciar dichas tareas.

Cobertura materializada:

| Elemento                                  | Total esperado | Total materializado | Faltantes | Duplicados |
| ----------------------------------------- | -------------: | ------------------: | --------: | ---------: |
| Familias de tareas canónicas              |              8 |                   8 |         0 |          0 |
| Tareas humanas o resolutores              |             29 |                  29 |         0 |          0 |
| Contextos de actor, función y dispositivo |              8 |                   8 |         0 |          0 |
| Grupos de navegación conservados          |              4 |                   4 |         0 |          0 |
| Zonas de navegación                       |              8 |                   8 |         0 |          0 |
| Clases de disposición                     |              6 |                   6 |         0 |          0 |
| Estados de interfaz                       |             10 |                  10 |         0 |          0 |
| Rutas, roles, funciones o permisos nuevos |              0 |                   0 |         0 |          0 |
| Requisitos de prueba nuevos o modificados |              0 |                   0 |         0 |          0 |

El resultado queda `ESPECIFICADO`. No se declara `IMPLEMENTADO`, `VALIDADO` ni
disponible en producción.

---

#### 3. Decisiones y contratos consumidos

La tarea consume sin modificar:

- `NEXO-ACTOR-HOME-PAGE-CONTRACT-001`;
- `NEXO-ACTOR-HOME-RESOLUTION-MATRIX-001`;
- `NEXO-ACTOR-HOME-COMPOSITION-MATRIX-001`;
- `NEXO-ACTOR-HOME-INFORMATION-ARCHITECTURE-001`;
- `NEXO-ACTOR-HOME-PRIORITY-CONTRACT-001`;
- `NEXO-TASK-NAVIGATION-CONTRACT-001`;
- `NEXO-NAVIGATION-TASK-CATALOG-001`;
- `NEXO-ACTOR-TASK-COMPOSITION-MATRIX-001`;
- `NEXO-ROUTE-TO-TASK-REGISTRY-001`;
- `NEXO-NAVIGATION-ENTRY-RETURN-CONTRACT-001`;
- `NEXO-CONTEXTUAL-UTILITY-CONTRACT-001`;
- `NEXO-NAVIGATION-STATE-CONTRACT-001`;
- los contratos de inicio de solicitante, bodega, conductor, receptor y
  supervisor;
- los contratos vigentes de autorización, contexto, sensibilidad, masking,
  dispositivo compartido y estados interactivos auxiliares;
- los requisitos de prueba vigentes asociados a los contratos anteriores.

No se cambia la identidad, etiqueta, familia, carril, grupo, audiencia,
responsable o regla de exposición de ninguna tarea consumida.

---

#### 4. Alcance y límites

##### 4.1. Incluido

- navegación inicial y secundaria según función activa;
- una acción primaria y una siguiente tarea resueltas autoritativamente;
- hasta cuatro tareas frecuentes visibles en la superficie general;
- hasta tres continuaciones recientes todavía válidas;
- acceso secundario a todas las tareas autorizadas, agrupadas por familia;
- orden por trabajo activo, riesgo, vencimiento, continuidad y recurrencia;
- decisión explícita para las veintinueve identidades de tarea;
- tratamiento de multifunción y dispositivo compartido;
- estados de carga, vacío, parcialidad, revocación, conflicto y fallo técnico;
- reglas responsive, accesibilidad, seguridad, privacidad y minimización.

##### 4.2. Excluido

- eliminar opciones del catálogo o retirar rutas;
- convertir frecuencia en permiso, asignación o autoridad;
- diseñar el prototipo visual final;
- validar con usuarios;
- implementar resolutores, consultas, cachés, eventos o telemetría;
- usar historial local del navegador como fuente autoritativa;
- publicar métricas de productividad individual;
- mezclar funciones activas en un único menú;
- ejecutar cambios de código, datos, Supabase o despliegue.

---

#### 5. `NEXO-FREQUENT-TASK-NAVIGATION-CONTRACT-001`

##### 5.1. Unidad de navegación

La unidad visible es una tarea humana del catálogo canónico, no una ruta,
archivo, módulo, tabla, componente, permiso o estado técnico.

Cada entrada visible conserva:

- `task_id` canónico;
- etiqueta humana aprobada;
- familia y grupo aprobados;
- función activa;
- instancia cuando exista trabajo concreto;
- recurso, etapa, territorio y versión aplicables;
- acción permitida o condición de solo lectura;
- bloqueo estructurado cuando no pueda continuar;
- origen de la prioridad y frescura suficiente para revalidar.

##### 5.2. Jerarquía obligatoria

La navegación utiliza ocho zonas en este orden:

| Orden | Zona                            | Regla                                                                                                                     |
| ----: | ------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
|     1 | Contexto activo                 | Actor, función, sede, área, turno y dispositivo aplicables; sin claves de permiso ni detalles internos.                   |
|     2 | Acción primaria                 | Una sola acción válida para la proyección activa.                                                                         |
|     3 | Siguiente tarea                 | Una tarea o instancia prioritaria resuelta en servidor; nunca calculada por el cliente.                                   |
|     4 | Tareas frecuentes               | Máximo cuatro entradas elegibles, sin duplicar la acción primaria ni la siguiente tarea.                                  |
|     5 | Continuar trabajo reciente      | Máximo tres instancias revalidadas; una entrada obsoleta se retira y no se presenta como error del usuario.               |
|     6 | Bloqueos y vencimientos         | Trabajo que requiere atención, con causa, efecto, responsable y recuperación segura.                                      |
|     7 | Todas las tareas disponibles    | Entradas restantes agrupadas por familia humana, sin rutas técnicas ni utilidades globales.                               |
|     8 | Utilidades y cambio de contexto | Herramientas contextuales, cambio de función y sesión; se muestran únicamente cuando la tarea o el dispositivo las exige. |

##### 5.3. Cantidades y estabilidad

- la acción primaria no cuenta dentro del máximo de cuatro tareas frecuentes;
- la siguiente tarea no se duplica en `Tareas frecuentes` ni en `Continuar
  trabajo reciente`;
- una misma identidad puede tener varias instancias, pero la lista frecuente
  muestra una entrada agregada y la continuación reciente muestra instancias
  concretas;
- el orden no cambia durante el mismo render por eventos locales o animaciones;
- una actualización autoritativa puede reordenar la lista y debe anunciar el
  cambio de forma accesible;
- el espacio adicional de escritorio no aumenta los máximos;
- las tareas restantes permanecen accesibles en su familia cuando continúan
  autorizadas.

##### 5.4. Clases de disposición

| Clase                        | Significado                                                                                          |
| ---------------------------- | ---------------------------------------------------------------------------------------------------- |
| `HOME_ONLY`                  | Identidad de inicio o retorno; no aparece como opción dentro de la misma página.                     |
| `PRIMARY_FIXED`              | Acción principal estable de una proyección cuando la autorización la habilita.                       |
| `PRIMARY_RESOLVED_CANDIDATE` | Puede ser la siguiente tarea o acción primaria cuando existe trabajo autoritativo compatible.        |
| `FREQUENT_CANDIDATE`         | Puede ocupar la lista frecuente después de superar elegibilidad y señales de orden.                  |
| `SECONDARY_DISCOVERABLE`     | Permanece en la familia correspondiente y no compite por el primer nivel sin una condición material. |
| `CONTEXTUAL_ONLY`            | Resolutor o utilidad oculta que solo se invoca desde una tarea y retorna a la instancia invocante.   |

---

#### 6. `NEXO-FREQUENCY-SIGNAL-CONTRACT-001`

##### 6.1. Elegibilidad previa

Antes de ordenar, el servidor elimina toda tarea que no satisfaga la
intersección de:

```text
ACTOR EFECTIVO
+
FUNCIÓN ACTIVA
+
PERMISO EXACTO
+
TERRITORIO Y RECURSO
+
ETAPA Y ESTADO
+
ASIGNACIÓN, PARTICIPACIÓN, CUSTODIA O RESPONSABILIDAD
+
DISPOSITIVO Y SESIÓN COMPATIBLES
+
FRESCURA Y VERSIÓN
```

La frecuencia se evalúa únicamente sobre el conjunto resultante.

##### 6.2. Precedencia determinista

Las entradas se ordenan en esta secuencia:

1. instancia ya iniciada o reclamada por el mismo actor y todavía vigente;
2. custodia, handoff o condición física con riesgo autorizado de seguridad,
   inocuidad, pérdida o interrupción;
3. tarea asignada con fecha, ventana o vencimiento autoritativo más próximo;
4. bloqueo que requiere una acción permitida del actor actual;
5. continuación reciente cuya instancia, etapa, territorio y versión continúan
   válidos;
6. tarea recurrente con al menos tres finalizaciones o continuaciones elegibles
   durante los últimos treinta días calendario para el mismo actor, función y
   contexto territorial;
7. entrada canónica predeterminada de la función activa;
8. desempate por fecha requerida, actualización autoritativa y `task_id`
   ascendente.

Una señal de menor nivel nunca desplaza trabajo activo, custodia, riesgo,
vencimiento o bloqueo de mayor nivel.

##### 6.3. Evidencia permitida

| Señal                     | Fuente permitida                                                           | Uso permitido                                      |
| ------------------------- | -------------------------------------------------------------------------- | -------------------------------------------------- |
| trabajo activo            | instancia y asignación autoritativas                                       | seleccionar siguiente tarea                        |
| custodia o handoff        | estado de dominio, receipt y relación vigente                              | elevar prioridad operativa                         |
| vencimiento               | fecha o ventana persistida y aplicable                                     | ordenar trabajo elegible                           |
| bloqueo accionable        | causa estructurada y acción autorizada                                     | presentar en bloqueos y, cuando corresponda, subir |
| continuación reciente     | registro server-side de instancia visitada o mutada con identidad completa | reanudar tras revalidación                         |
| recurrencia               | eventos server-side elegibles del mismo actor, función y territorio        | ordenar candidatos frecuentes                      |
| predeterminado de función | matriz canónica de composición                                             | fallback estable sin inventar frecuencia           |

##### 6.4. Fuentes prohibidas

No se utilizan como señal autoritativa:

- clics almacenados solo en el navegador;
- una ruta visitada;
- orden manual enviado por el cliente;
- nombre de cargo o `navigation_role`;
- acceso anterior ya revocado;
- actividad de otro actor;
- volumen global de la sede;
- popularidad entre usuarios;
- métricas de desempeño;
- una tarjeta visible o un conteo parcial;
- un resultado de escritura todavía desconocido.

Los datos de recurrencia no se presentan como productividad, comparación,
ranking o evaluación individual.

---

#### 7. `NEXO-ACTOR-FREQUENT-TASK-MATRIX-001`

| Caso           | Contexto activo                         | Acción primaria                            | Candidatos de primer nivel                                                                   | Secundarias permitidas                                       | Ocultamiento obligatorio                                                                    | Estado         |
| -------------- | --------------------------------------- | ------------------------------------------ | -------------------------------------------------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------------------------------------- | -------------- |
| `FREQ-CTX-001` | solicitante autorizado                  | `NEXO-TASK-003` cuando puede crear         | solicitudes propias continuables y `NEXO-TASK-002` cuando exista etapa propia vigente        | `NEXO-TASK-013` con lectura autorizada                       | preparación, transporte, recepción, supervisión, configuración y trabajo ajeno              | `ESPECIFICADO` |
| `FREQ-CTX-002` | bodeguero o preparador autorizado       | siguiente instancia elegible               | `NEXO-TASK-004`; `NEXO-TASK-007` a `NEXO-TASK-011` según trabajo y recurrencia               | `NEXO-TASK-013` a `NEXO-TASK-015` cuando apoyen la tarea     | conducción, recepción ajena, decisión supervisora y configuración                           | `ESPECIFICADO` |
| `FREQ-CTX-003` | conductor o custodio autorizado         | siguiente instancia de `NEXO-TASK-005`     | `NEXO-TASK-005` y sus continuaciones de custodia, tránsito, entrega, incidente o retorno     | referencias mínimas de carga, ruta y evidencia               | solicitud, picking, recepción, ajustes, configuración y trabajo sin custodia                | `ESPECIFICADO` |
| `FREQ-CTX-004` | receptor autorizado                     | siguiente instancia de `NEXO-TASK-006`     | `NEXO-TASK-006`; `NEXO-TASK-007` cuando el origen y la autorización lo permitan              | `NEXO-TASK-013`; `NEXO-TASK-015` como referencias necesarias | conducción, preparación, decisiones supervisoras, configuración y otros destinos            | `ESPECIFICADO` |
| `FREQ-CTX-005` | supervisor con cobertura territorial    | siguiente caso elegible de `NEXO-TASK-012` | `NEXO-TASK-012`; `NEXO-TASK-013` a `NEXO-TASK-017`; `NEXO-TASK-026` según señales válidas    | consultas y evidencia dentro de cobertura                    | mutaciones operativas, configuración no concedida y métricas individuales                   | `ESPECIFICADO` |
| `FREQ-CTX-006` | configurador autorizado                 | capacidad prioritaria de `NEXO-TASK-021`   | `NEXO-TASK-020`; `NEXO-TASK-022` a `NEXO-TASK-025`; `NEXO-TASK-027` según capacidad          | referencias indispensables para evaluar impacto              | ejecución física, supervisión y capacidades administrativas no concedidas                   | `ESPECIFICADO` |
| `FREQ-CTX-007` | persona con varias funciones            | la definida por una única función activa   | exclusivamente candidatos de la función activa                                               | cambio explícito a otra función autorizada                   | mezcla de listas, acciones cruzadas, autoaprobación y frecuencia compartida entre funciones | `ESPECIFICADO` |
| `FREQ-CTX-008` | dispositivo compartido con actor activo | la definida por la proyección compatible   | tareas compatibles con actor, función, turno, contexto y capacidades máximas del dispositivo | utilidades contextuales requeridas por la tarea              | administración, datos sensibles y toda acción sin actor humano atribuible                   | `ESPECIFICADO` |

Reconciliación:

```text
EXPECTED_CONTEXTS = 8
MATERIALIZED_CONTEXTS = 8
UNIQUE_CONTEXT_IDS = 8
MISSING_CONTEXTS = 0
DUPLICATE_CONTEXTS = 0
```

---

#### 8. `NEXO-TASK-PLACEMENT-REGISTER-001`

Cada identidad conserva su etiqueta y familia aprobadas. La disposición indica
su posición base; la exposición final todavía exige el contrato de frecuencia,
la función activa y la elegibilidad autoritativa.

| Tarea           | Etiqueta humana                   | Familia                | Disposición base             | Condición de primer nivel                                                     | Resultado materializado                                                                                     |
| --------------- | --------------------------------- | ---------------------- | ---------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| `NEXO-TASK-001` | Ir al inicio                      | `NEXO-TASK-FAMILY-001` | `HOME_ONLY`                  | ninguna; representa la superficie vigente                                     | no se repite como opción dentro del inicio; se usa para retorno y resolución de proyección                  |
| `NEXO-TASK-002` | Gestionar abastecimiento interno  | `NEXO-TASK-FAMILY-002` | `PRIMARY_RESOLVED_CANDIDATE` | actor participante con una etapa propia o una continuación vigente            | resuelve función, etapa e instancia antes de abrir; nunca mezcla solicitar, preparar, transportar y recibir |
| `NEXO-TASK-003` | Solicitar abastecimiento          | `NEXO-TASK-FAMILY-002` | `PRIMARY_FIXED`              | solicitante autorizado para crear o continuar solicitudes propias             | acción principal del solicitante; los borradores válidos también pueden aparecer como continuaciones        |
| `NEXO-TASK-004` | Preparar abastecimiento           | `NEXO-TASK-FAMILY-002` | `PRIMARY_RESOLVED_CANDIDATE` | preparación, picking, faltante o handoff atribuido a la bodega activa         | puede ser siguiente tarea y frecuente; no concede despacho ni tránsito                                      |
| `NEXO-TASK-005` | Transportar abastecimiento        | `NEXO-TASK-FAMILY-002` | `PRIMARY_RESOLVED_CANDIDATE` | asignación, custodia o ruta vigente                                           | única entrada operativa principal del conductor; conserva carga, etapa y custodia                           |
| `NEXO-TASK-006` | Recibir abastecimiento            | `NEXO-TASK-FAMILY-002` | `PRIMARY_RESOLVED_CANDIDATE` | entrega, handoff o recepción atribuida al destino autorizado                  | puede ser siguiente tarea y frecuente; no concede decisión supervisora                                      |
| `NEXO-TASK-007` | Registrar una entrada             | `NEXO-TASK-FAMILY-003` | `PRIMARY_RESOLVED_CANDIDATE` | fuente empresarial o excepción expresamente autorizada                        | aparece para receptor o bodega elegible; conserva la fuente y no se convierte en formulario libre           |
| `NEXO-TASK-008` | Ubicar existencias                | `NEXO-TASK-FAMILY-003` | `PRIMARY_RESOLVED_CANDIDATE` | existencia recibida con ubicación pendiente y destino compatible              | prioriza putaway pendiente sin exponer configuración de ubicaciones                                         |
| `NEXO-TASK-009` | Mover existencias                 | `NEXO-TASK-FAMILY-003` | `PRIMARY_RESOLVED_CANDIDATE` | traslado autorizado dentro del territorio                                     | aparece por trabajo o recurrencia elegible; no sustituye remisiones entre sedes                             |
| `NEXO-TASK-010` | Registrar un retiro               | `NEXO-TASK-FAMILY-003` | `PRIMARY_RESOLVED_CANDIDATE` | retiro autorizado con origen, destino, unidad y motivo                        | aparece por trabajo o recurrencia elegible; nunca muestra stock global                                      |
| `NEXO-TASK-011` | Contar inventario                 | `NEXO-TASK-FAMILY-003` | `PRIMARY_RESOLVED_CANDIDATE` | sesión asignada y etapa compatible con captura o control                      | el resolutor separa captura operativa de control supervisor                                                 |
| `NEXO-TASK-012` | Controlar la operación            | `NEXO-TASK-FAMILY-004` | `PRIMARY_RESOLVED_CANDIDATE` | supervisor con caso, bloqueo, vencimiento o responsabilidad territorial       | acción principal de supervisión; no concede mutaciones operativas                                           |
| `NEXO-TASK-013` | Consultar existencias             | `NEXO-TASK-FAMILY-004` | `FREQUENT_CANDIDATE`         | lectura autorizada y uso recurrente o necesidad contextual                    | puede subir a frecuente; de otro modo permanece en consulta, control y trazabilidad                         |
| `NEXO-TASK-014` | Investigar movimientos            | `NEXO-TASK-FAMILY-004` | `FREQUENT_CANDIDATE`         | investigación autorizada, caso vigente o recurrencia verificable              | conserva trazabilidad y no habilita escritura                                                               |
| `NEXO-TASK-015` | Consultar ubicaciones             | `NEXO-TASK-FAMILY-004` | `FREQUENT_CANDIDATE`         | lectura territorial autorizada y necesidad contextual o recurrencia           | puede subir a frecuente sin exponer edición de estructura                                                   |
| `NEXO-TASK-016` | Consultar contenedores logísticos | `NEXO-TASK-FAMILY-004` | `SECONDARY_DISCOVERABLE`     | permiso de lectura y contexto LPN compatible                                  | permanece en su familia hasta que el subdominio materialice sus señales propias                             |
| `NEXO-TASK-017` | Gestionar activos                 | `NEXO-TASK-FAMILY-005` | `FREQUENT_CANDIDATE`         | permiso, territorio, trabajo o recurrencia de activos                         | puede subir a frecuente para actores de activos; no anticipa acciones de configuración                      |
| `NEXO-TASK-018` | Capturar activos                  | `NEXO-TASK-FAMILY-005` | `PRIMARY_RESOLVED_CANDIDATE` | actor de campo autorizado y captura pendiente                                 | puede ser siguiente tarea en la función activa; no aparece en remisiones                                    |
| `NEXO-TASK-019` | Contar activos                    | `NEXO-TASK-FAMILY-005` | `PRIMARY_RESOLVED_CANDIDATE` | sesión y etapa de conteo de activos compatibles                               | separa captura y cierre según función                                                                       |
| `NEXO-TASK-020` | Configurar activos                | `NEXO-TASK-FAMILY-005` | `SECONDARY_DISCOVERABLE`     | capacidad exacta de configuración de activos                                  | se presenta únicamente en configuración; nunca en navegación operativa                                      |
| `NEXO-TASK-021` | Administrar NEXO                  | `NEXO-TASK-FAMILY-006` | `PRIMARY_RESOLVED_CANDIDATE` | actor con al menos una capacidad administrativa exacta                        | resuelve la capacidad prioritaria sin convertir el cargo en acceso global                                   |
| `NEXO-TASK-022` | Administrar productos y unidades  | `NEXO-TASK-FAMILY-006` | `FREQUENT_CANDIDATE`         | capacidad de catálogo y recurrencia administrativa verificable                | puede subir dentro de configuración; queda excluida de funciones operativas                                 |
| `NEXO-TASK-023` | Administrar ubicaciones           | `NEXO-TASK-FAMILY-006` | `FREQUENT_CANDIDATE`         | capacidad de ubicación y recurrencia administrativa verificable               | puede subir dentro de configuración; no se confunde con ubicar existencias                                  |
| `NEXO-TASK-024` | Configurar abastecimiento         | `NEXO-TASK-FAMILY-006` | `FREQUENT_CANDIDATE`         | capacidad logística y recurrencia administrativa verificable                  | puede subir dentro de configuración; no expone solicitudes concretas salvo referencia necesaria             |
| `NEXO-TASK-025` | Configurar referencias internas   | `NEXO-TASK-FAMILY-006` | `SECONDARY_DISCOVERABLE`     | permiso financiero o de referencia exacto                                     | permanece en administración y no se promueve mediante actividad operativa                                   |
| `NEXO-TASK-026` | Controlar impresión               | `NEXO-TASK-FAMILY-007` | `PRIMARY_RESOLVED_CANDIDATE` | trabajos de impresión bloqueados, fallidos o pendientes dentro del territorio | puede ser siguiente tarea de supervisor o soporte; no abre monitor global sin cobertura                     |
| `NEXO-TASK-027` | Configurar impresión              | `NEXO-TASK-FAMILY-007` | `SECONDARY_DISCOVERABLE`     | capacidad exacta de configuración de impresión                                | se presenta únicamente en administración y no por existencia de trabajos                                    |
| `NEXO-TASK-028` | Resolver un destino contextual    | `NEXO-TASK-FAMILY-008` | `CONTEXTUAL_ONLY`            | tarea invocante, actor, dispositivo y destino compatibles                     | permanece oculto; resuelve código, ubicación, kiosco o escáner y retorna a la tarea                         |
| `NEXO-TASK-029` | Resolver acceso                   | `NEXO-TASK-FAMILY-008` | `CONTEXTUAL_ONLY`            | entrada técnica, autenticación o denegación segura                            | permanece fuera de la navegación empresarial y nunca se clasifica como frecuente                            |

Reconciliación:

```text
EXPECTED_TASK_IDS = 29
MATERIALIZED_TASK_IDS = 29
UNIQUE_TASK_IDS = 29
MISSING_TASK_IDS = 0
DUPLICATE_TASK_IDS = 0
```

Distribución de disposición:

| Disposición                  | Cantidad |
| ---------------------------- | -------: |
| `HOME_ONLY`                  |        1 |
| `PRIMARY_FIXED`              |        1 |
| `PRIMARY_RESOLVED_CANDIDATE` |       14 |
| `FREQUENT_CANDIDATE`         |        7 |
| `SECONDARY_DISCOVERABLE`     |        4 |
| `CONTEXTUAL_ONLY`            |        2 |
| **Total**                    |   **29** |

---

#### 9. `NEXO-RECENT-CONTINUATION-CONTRACT-001`

##### 9.1. Identidad mínima

Cada continuación reciente conserva conjuntamente:

```text
TASK_ID
+
INSTANCE_ID
+
ACTOR_ID
+
FUNCIÓN_ACTIVA
+
TERRITORIO
+
RECURSO
+
ETAPA
+
VERSIÓN
+
ÚLTIMA_CONFIRMACION_AUTORITATIVA
```

No se crea una continuación desde una URL sin identidad de tarea e instancia.

##### 9.2. Revalidación

Antes de mostrar o abrir una continuación, el servidor confirma:

- sesión y actor vigentes;
- misma función activa;
- permiso exacto;
- territorio y recurso todavía cubiertos;
- asignación, participación, custodia o responsabilidad todavía válidas;
- estado y etapa compatibles;
- versión no obsoleta;
- dispositivo y soporte fuerte compatibles cuando apliquen;
- ausencia de resultado desconocido pendiente de conciliación.

##### 9.3. Causas de retiro

| Causa                              | Tratamiento                                                             | Destino documental                         |
| ---------------------------------- | ----------------------------------------------------------------------- | ------------------------------------------ |
| instancia cerrada                  | retirar de recientes; conservar acceso histórico solo si existe permiso | contrato del proceso propietario           |
| reasignación o pérdida de custodia | retirar acción y actualizar propietario                                 | contrato de asignación o custodia          |
| territorio fuera de cobertura      | retirar datos y acción                                                  | contratos de contexto y autorización       |
| permiso o función revocados        | invalidar la proyección y resolver nuevamente                           | contrato de página inicial y autorización  |
| etapa incompatible                 | sustituir por la siguiente tarea válida si existe                       | contrato del flujo propietario             |
| conflicto de versión               | bloquear mutación, recargar y presentar el estado específico            | paquete de implementación NEXO             |
| dispositivo incompatible           | retirar la entrada sin sugerir bypass                                   | contrato de dispositivo compartido         |
| resultado de escritura desconocido | conciliar por identidad o idempotencia antes de permitir otro intento   | contrato del flujo e implementación        |
| evidencia técnica indisponible     | no inferir denegación ni cierre; presentar indisponibilidad recuperable | paquete de implementación y observabilidad |

Las causas anteriores no quedan como pendientes narrativos: cada una conserva
contrato propietario y condición de salida verificable.

---

#### 10. Comportamiento responsive y accesible

##### 10.1. Móvil

- acción primaria y siguiente tarea antes del primer desplazamiento largo;
- máximo tres tareas frecuentes visibles antes de `Ver todas las tareas`;
- continuaciones recientes después del trabajo frecuente y antes de familias;
- una columna y objetivos táctiles aptos para operación física;
- ninguna acción crítica depende de hover o gesto oculto.

##### 10.2. Tablet

- contexto, siguiente tarea y hasta cuatro tareas frecuentes visibles sin
  convertir la pantalla en tablero supervisor;
- escaneo e impresión únicamente desde la tarea que los requiere;
- orientación y tamaño no cambian prioridad, autorización ni cantidad máxima.

##### 10.3. Escritorio

- máximo dos columnas;
- el espacio adicional no muestra más tareas frecuentes, configuración ni
  trabajo ajeno;
- `Todas las tareas disponibles` conserva agrupación por familia y orden de
  lectura equivalente.

##### 10.4. Accesibilidad

- el foco sigue el orden de las ocho zonas;
- la acción primaria y la siguiente tarea tienen nombre y propósito estables;
- la razón de prioridad no depende solo de color o posición;
- un cambio de orden autoritativo se anuncia sin mover el foco;
- cada conteo tiene etiqueta, unidad y contexto;
- `Ver todas las tareas` es operable por teclado y conserva el grupo activo;
- los estados vacíos y fallos mantienen encabezado y recuperación accesibles;
- las utilidades contextuales retornan al mismo elemento de la tarea invocante.

---

#### 11. `NEXO-FREQUENT-TASK-STATE-CONTRACT-001`

| Estado                              | Condición                                                           | Presentación obligatoria                                                       | Acción permitida                                              |
| ----------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------------------ | ------------------------------------------------------------- |
| `RESOLVIENDO_CONTEXTO`              | actor, función o contexto todavía no concluyentes                   | estructura mínima sin tareas, conteos ni datos empresariales                   | esperar, cancelar o completar interacción autorizada          |
| `CARGANDO_NAVEGACION`               | contexto resuelto y conjunto elegible todavía en carga              | contexto visible, jerarquía estable y controles deshabilitados                 | esperar o cancelar navegación                                 |
| `NAVEGACION_LISTA`                  | conjunto elegible, orden y frescura completos                       | acción primaria, siguiente tarea, frecuentes, recientes y familias autorizadas | ejecutar solo comandos incluidos en la respuesta autoritativa |
| `SIN_TAREAS_FRECUENTES_ELEGIBLES`   | consulta concluyente sin candidatos frecuentes                      | vacío válido; conservar acción primaria y tareas secundarias autorizadas       | abrir una tarea secundaria o acción primaria válida           |
| `DATOS_PARCIALES`                   | una zona falló o perdió frescura mientras otras siguen confirmadas  | identificar zona afectada y último dato confirmado                             | lectura segura y reintento de consulta                        |
| `CONTINUACION_RECIENTE_OBSOLETA`    | una instancia reciente dejó de ser válida                           | retirarla, explicar actualización sin revelar causa sensible                   | abrir la siguiente tarea válida o refrescar                   |
| `AUTORIZACION_REVOCADA`             | permiso, función, territorio, sesión o actor dejaron de ser válidos | retirar tareas, datos y acciones de la proyección anterior                     | resolver contexto o recuperación canónica                     |
| `CONFLICTO_DE_VERSION`              | tarea o recurso cambió respecto de la versión presentada            | bloquear mutación y mostrar que el trabajo fue actualizado                     | recargar fuente autoritativa                                  |
| `INDISPONIBILIDAD_TECNICA`          | no existe decisión estable por error o dependencia indisponible     | mensaje técnico recuperable, sin convertirlo en denegación o vacío             | reintentar consulta cuando sea seguro                         |
| `RESULTADO_DE_MUTACION_DESCONOCIDO` | una escritura no tiene receipt concluyente                          | mantener identidad, impedir repetición automática y explicar conciliación      | consultar resultado por identidad o idempotencia              |

Reglas transversales:

- ausencia de tareas frecuentes no equivale a ausencia de autorización;
- una denegación no se presenta como indisponibilidad técnica;
- una indisponibilidad no se degrada a una lista vacía;
- datos parciales no se completan con cero o valores estimados;
- una continuación obsoleta no permanece accionable;
- un resultado desconocido nunca se presenta como éxito ni se reintenta a
  ciegas;
- la lista completa conserva solo tareas todavía autorizadas.

---

#### 12. Seguridad, privacidad y minimización

1. La navegación recibe un conjunto ya filtrado por autorización; no solicita
   opciones globales para ocultarlas en el navegador.
2. La frecuencia no se usa para conceder permisos ni saltar comprobaciones.
3. Cada apertura y acción revalida actor, función, permiso, territorio,
   recurso, etapa y versión.
4. El historial de recurrencia se limita al actor, función y territorio
   aplicables y no se expone como métrica de desempeño.
5. No se muestran claves de permiso, reason codes internos, nombres de tabla,
   trazas ni rutas técnicas como etiquetas.
6. La simulación, cuando sea admisible, permanece separada y no produce efectos
   reales.
7. Cambiar función, actor o dispositivo invalida orden, recientes y caché de la
   proyección anterior.
8. Las tareas contextuales no aparecen en menús, búsquedas globales ni listas
   frecuentes.
9. Sensibilidad y masking se aplican antes de construir etiquetas, subtítulos,
   conteos o previews.
10. Una tarea sin datos suficientes se omite o muestra estado seguro; nunca se
    completa con información de otro territorio o actor.

---

#### 13. Estado técnico y brecha de implementación

| Elemento                                  | Estado documental        | Evidencia permitida                                     | Condición de salida                                 |
| ----------------------------------------- | ------------------------ | ------------------------------------------------------- | --------------------------------------------------- |
| catálogo de 29 tareas y 8 familias        | `ESPECIFICADO`           | `NEXO-NAVIGATION-TASK-CATALOG-001`                      | conservar identidades en prototipo e implementación |
| composición de 8 contextos                | `ESPECIFICADO`           | `NEXO-ACTOR-TASK-COMPOSITION-MATRIX-001`; `AUTH-UI-052` | consumo íntegro por el resolutor                    |
| disposición de las 29 tareas              | `ESPECIFICADO`           | esta tarea                                              | `AUTH-UI-054`, prototipo e implementación           |
| precedencia y señales de frecuencia       | `ESPECIFICADO`           | esta tarea                                              | implementación server-side y pruebas                |
| eventos de recurrencia y continuidad      | `NO_IMPLEMENTADO`        | no existe evidencia aprobada de instrumentación         | paquete de implementación NEXO                      |
| navegación física según tareas frecuentes | `NO_IMPLEMENTADO`        | no existe evidencia aprobada en esta tarea              | paquete de implementación NEXO                      |
| prototipo de navegación                   | `NO_IMPLEMENTADO`        | no existe evidencia aprobada en esta tarea              | `AUTH-UI-055`                                       |
| validación con usuarios                   | `PENDIENTE_DE_EVIDENCIA` | no ejecutada                                            | `AUTH-UI-056` a `AUTH-UI-060`                       |

La existencia de rutas y pantallas actuales no demuestra que la jerarquía,
orden, frecuencia, reanudación o estados aquí definidos estén implementados.

---

#### 14. Criterios de aceptación

La tarea se considera documentalmente completa cuando se confirme que:

- las ocho familias y las veintinueve tareas conservan identidad y etiqueta;
- las veintinueve tareas tienen una disposición base explícita;
- los ocho contextos tienen acción primaria, candidatos, secundarios y
  ocultamientos explícitos;
- la frecuencia solo ordena tareas previamente autorizadas;
- trabajo activo, custodia, riesgo, vencimiento y bloqueo preceden a la
  recurrencia;
- la recurrencia utiliza evidencia server-side del mismo actor, función y
  territorio;
- la acción primaria, la siguiente tarea, frecuentes y recientes no se
  duplican;
- se muestran máximo cuatro tareas frecuentes y máximo tres continuaciones
  recientes;
- las tareas restantes permanecen accesibles por familia cuando siguen
  autorizadas;
- multifunción usa una única función activa y no mezcla señales;
- el dispositivo compartido exige actor humano y limita tareas compatibles;
- resolutores, acceso, escáner, kioscos, códigos y aliases permanecen
  contextuales y fuera del menú;
- diez estados distinguen carga, vacío, parcialidad, obsolescencia, revocación,
  conflicto, indisponibilidad y resultado desconocido;
- móvil, tablet y escritorio conservan la misma autoridad y jerarquía;
- no se crean rutas, roles, funciones, procesos, permisos ni requisitos de
  prueba;
- toda brecha conserva propietario y condición de salida;
- `AUTH-UI-054` permanece únicamente reservada.

---

#### 15. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación: esta tarea materializa la presentación y el orden de las ocho
familias, las veintinueve tareas, los ocho contextos, los cuatro grupos, la
reanudación y los estados ya protegidos por los contratos y requisitos vigentes
de navegación, página inicial, autorización y dispositivo compartido. No crea
una capacidad, ruta, permiso, transición, dato o efecto nuevo; tampoco modifica,
difiere, descarta ni declara obsoleto ningún requisito histórico. El Registro
Canónico de Requisitos de Prueba no cambia.

---

#### 16. `NEXO-FREQUENT-TASK-HANDOFF-001`

| Destino                        | Handoff aprobado                                                                                                                                               |
| ------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `AUTH-UI-054`                  | reducir opciones irrelevantes consumiendo la disposición de las 29 tareas, los máximos, los ocultamientos y las señales definidas aquí, sin eliminar autoridad |
| `AUTH-UI-055`                  | crear prototipos que materialicen las ocho zonas, ocho contextos, jerarquía responsive y estados sin inventar resultados de uso                                |
| `AUTH-UI-056`                  | validar el prototipo sin presentar inspección documental o telemetría inexistente como prueba con usuarios                                                     |
| `AUTH-UI-057` a `AUTH-UI-060`  | definir criterios, probar, registrar problemas y aprobar pantallas con evidencia real                                                                          |
| paquete de implementación NEXO | construir resolutor, consultas, eventos, almacenamiento de recientes, orden, componentes, pruebas y observabilidad cuando la continuidad lo autorice           |

Ningún destino anterior se inicia mediante esta tarea.

---

#### 17. Continuidad canónica

**ÚLTIMA TAREA APROBADA**

`AUTH-UI-052 — Diseñar página inicial según actor`

**TAREA ACTUAL APROBADA**

`AUTH-UI-053 — Diseñar navegación según tareas frecuentes`

**SIGUIENTE TAREA RESERVADA**

`AUTH-UI-054 — Reducir opciones irrelevantes`


### ✅ AUTH-UI-054 — Reducir opciones irrelevantes

**Estado:** APROBADA
**Tarea anterior:** `AUTH-UI-053 — Diseñar navegación según tareas frecuentes` — APROBADA
**Tarea siguiente:** `AUTH-UI-055 — Crear prototipo por rol` — RESERVADA
**Tipo de tarea:** documental; diseño funcional materializado de reducción de opciones de NEXO según relevancia autoritativa, función activa, trabajo vigente, disposición canónica, recurrencia válida, modalidad de dispositivo y necesidad de descubrimiento secundario
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/I_NAVEGACION_Y_PANTALLAS/06_EXPERIENCIA_USABILIDAD_Y_APROBACION.md`
**Repositorio de aplicación inspeccionado:** `vento-nexo`
**Ruta prioritaria:** `NEXO-REMISSIONS-001`
**Etapa prioritaria:** `NEXO_UI_VALIDATION`
**Superficie inicial consumida:** `NEXO-ROUTE-001` — `/`
**Cambios físicos autorizados:** ninguno; no modifica código, rutas, permisos, roles, procesos, datos, Supabase, migraciones, RLS, configuración, telemetría ni despliegues

---

#### 1. Propósito

Reducir las opciones visibles de NEXO hasta conservar únicamente aquellas que
son relevantes para el actor efectivo, la función activa, el contexto vigente,
el trabajo disponible y la superficie utilizada, sin eliminar tareas
canónicas, ocultar trabajo autorizado ni convertir la presentación en una
fuente de autoridad.

La regla canónica es:

```text
CONJUNTO DE TAREAS AUTORIZADAS
+
FUNCIÓN ACTIVA Y CONTEXTO VIGENTE
+
TRABAJO, RESPONSABILIDAD, CUSTODIA, HANDOFF Y BLOQUEOS REALES
+
DISPOSICIÓN CANÓNICA Y RELEVANCIA PARA LA SUPERFICIE
+
DEDUCCIÓN DE DUPLICADOS Y AGRUPACIÓN POR INTENCIÓN HUMANA
→
SOLO LAS OPCIONES NECESARIAS EN EL NIVEL ADECUADO
```

Reducir no significa revocar. Una tarea autorizada puede salir del primer
nivel, permanecer dentro de su familia o mostrarse únicamente dentro de otra
tarea. La ausencia visual nunca modifica permisos, asignaciones, territorio,
responsabilidad, custodia, estado empresarial ni capacidad de acceso directo
cuando este último continúe autorizado y sea revalidado por el servidor.

---

#### 2. Resultado material

Se materializan siete artefactos documentales consumibles:

1. `NEXO-OPTION-RELEVANCE-CONTRACT-001`, que define relevancia, exclusión,
   descenso de nivel, conservación y autoridad;
2. `NEXO-OPTION-REDUCTION-LAYER-CATALOG-001`, que define cinco niveles de
   presentación y una salida fuera de la proyección;
3. `NEXO-ACTOR-OPTION-REDUCTION-MATRIX-001`, que decide el tratamiento para los
   ocho contextos aprobados;
4. `NEXO-TASK-REDUCTION-REGISTER-001`, que materializa una decisión explícita
   para las veintinueve tareas canónicas;
5. `NEXO-OPTION-DEDUPE-AND-COLLAPSE-CONTRACT-001`, que elimina duplicación entre
   acción primaria, siguiente tarea, frecuentes, recientes, familias y pasos;
6. `NEXO-OPTION-REDUCTION-STATE-CONTRACT-001`, que define diez estados de
   presentación y recuperación;
7. `NEXO-OPTION-REDUCTION-HANDOFF-001`, que entrega las decisiones al prototipo
   y a la implementación posterior sin iniciar dichas tareas.

Cobertura materializada:

| Elemento                                  | Total esperado | Total materializado | Faltantes | Duplicados |
| ----------------------------------------- | -------------: | ------------------: | --------: | ---------: |
| Familias de tareas canónicas              |              8 |                   8 |         0 |          0 |
| Tareas humanas o resolutores              |             29 |                  29 |         0 |          0 |
| Contextos de actor, función y dispositivo |              8 |                   8 |         0 |          0 |
| Grupos humanos conservados                |              4 |                   4 |         0 |          0 |
| Niveles de presentación                   |              5 |                   5 |         0 |          0 |
| Salidas fuera de la proyección            |              1 |                   1 |         0 |          0 |
| Estados de presentación                   |             10 |                  10 |         0 |          0 |
| Rutas, roles, funciones o permisos nuevos |              0 |                   0 |         0 |          0 |
| Requisitos de prueba nuevos o modificados |              0 |                   0 |         0 |          0 |

El resultado queda `ESPECIFICADO`. No se declara `IMPLEMENTADO`, `VALIDADO` ni
disponible en producción.

---

#### 3. Decisiones y contratos consumidos

La tarea consume sin modificar:

- `NEXO-ACTOR-HOME-PAGE-CONTRACT-001`;
- `NEXO-ACTOR-HOME-RESOLUTION-MATRIX-001`;
- `NEXO-ACTOR-HOME-COMPOSITION-MATRIX-001`;
- `NEXO-ACTOR-HOME-INFORMATION-ARCHITECTURE-001`;
- `NEXO-ACTOR-HOME-PRIORITY-CONTRACT-001`;
- `NEXO-FREQUENT-TASK-NAVIGATION-CONTRACT-001`;
- `NEXO-FREQUENCY-SIGNAL-CONTRACT-001`;
- `NEXO-ACTOR-FREQUENT-TASK-MATRIX-001`;
- `NEXO-TASK-PLACEMENT-REGISTER-001`;
- `NEXO-RECENT-CONTINUATION-CONTRACT-001`;
- `NEXO-FREQUENT-TASK-STATE-CONTRACT-001`;
- `NEXO-TASK-NAVIGATION-CONTRACT-001`;
- `NEXO-NAVIGATION-TASK-CATALOG-001`;
- `NEXO-ACTOR-TASK-COMPOSITION-MATRIX-001`;
- `NEXO-ROUTE-TO-TASK-REGISTRY-001`;
- `NEXO-NAVIGATION-ENTRY-RETURN-CONTRACT-001`;
- `NEXO-CONTEXTUAL-UTILITY-CONTRACT-001`;
- `NEXO-NAVIGATION-STATE-CONTRACT-001`;
- los contratos de inicio de solicitante, bodega, conductor, receptor y
  supervisor;
- los contratos vigentes de autorización, contexto, sensibilidad, masking,
  dispositivo compartido y estados interactivos auxiliares;
- los requisitos `TREQ-NEXO-050` a `TREQ-NEXO-090` y requisitos relacionados
  vigentes.

No se cambia la identidad, etiqueta, familia, carril, grupo, audiencia,
responsable, disposición base o regla de exposición de ninguna tarea
consumida.

---

#### 4. Alcance y límites

##### 4.1. Incluido

- eliminación de opciones no autorizadas antes de construir la presentación;
- retiro de opciones incompatibles con la función, territorio, recurso, etapa,
  trabajo o dispositivo vigentes;
- descenso de tareas autorizadas pero no prioritarias a su familia humana;
- conservación de una acción primaria y una siguiente tarea sin duplicación;
- máximo cuatro tareas frecuentes y tres continuaciones recientes;
- ocultamiento de resolutores, utilidades y pasos que no son tareas humanas;
- colapso de rutas, instancias y accesos que representan la misma intención;
- decisión explícita para las veintinueve identidades canónicas;
- tratamiento de los ocho contextos aprobados;
- comportamiento de familias vacías, datos parciales, revocación y cambio de
  función;
- reglas responsive, accesibilidad, seguridad, privacidad y minimización.

##### 4.2. Excluido

- eliminar tareas del catálogo canónico;
- retirar rutas físicas o bindings aprobados;
- revocar permisos, asignaciones, capacidades o territorios;
- diseñar el prototipo visual final;
- validar con usuarios;
- modificar el selector de aplicaciones del ecosistema;
- implementar resolutores, consultas, eventos, cachés, componentes o
  telemetría;
- cambiar el modelo de autorización o usar la navegación como guard final;
- publicar métricas de productividad individual;
- ejecutar cambios de código, datos, Supabase o despliegue.

---

#### 5. `NEXO-OPTION-RELEVANCE-CONTRACT-001`

##### 5.1. Definición de relevancia

Una opción es relevante para una proyección cuando cumple simultáneamente:

```text
TAREA CANÓNICA VIGENTE
+
ACTOR EFECTIVO Y FUNCIÓN ACTIVA
+
PERMISO EXACTO
+
TERRITORIO, RECURSO, ETAPA Y ESTADO COMPATIBLES
+
RELACIÓN OPERATIVA, ASIGNACIÓN, CUSTODIA O RESPONSABILIDAD CUANDO APLIQUE
+
DISPOSITIVO Y SESIÓN COMPATIBLES
+
DISPOSICIÓN BASE ADMISIBLE EN LA SUPERFICIE
+
NECESIDAD ACTUAL, CONTINUIDAD VÁLIDA O DESCUBRIMIENTO SECUNDARIO JUSTIFICADO
```

La tarea se excluye de la proyección cuando falla cualquiera de los componentes
obligatorios. La exclusión ocurre antes de enviar etiquetas, conteos, datos o
acciones al cliente.

##### 5.2. Resultados posibles

Cada tarea autorizada recibe exactamente uno de estos resultados por render:

| Resultado                  | Significado                                                                                                        |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| `DESTACAR`                 | ocupa acción primaria o siguiente tarea por una decisión autoritativa vigente                                      |
| `MOSTRAR_FRECUENTE`        | aparece dentro del máximo de cuatro tareas frecuentes después de elegibilidad y deduplicación                      |
| `MOSTRAR_RECIENTE`         | representa una instancia reanudable dentro del máximo de tres continuaciones recientes                             |
| `CONSERVAR_EN_FAMILIA`     | permanece disponible en el grupo y familia humanos sin competir en el primer nivel                                 |
| `INVOCAR_SOLO_EN_CONTEXTO` | se abre desde una tarea invocante y permanece fuera de listas globales                                             |
| `EXCLUIR_DE_PROYECCION`    | no forma parte de la proyección por falta de autoridad, función, contexto, trabajo, compatibilidad o aplicabilidad |

`EXCLUIR_DE_PROYECCION` no se representa mediante una tarjeta deshabilitada,
un candado, un conteo cero o una etiqueta “sin acceso”. La opción simplemente no
forma parte de esa proyección. Los estados de denegación se reservan para una
solicitud explícita o acceso directo ya realizado.

##### 5.3. Reglas de conservación

- una tarea autorizada sin prioridad ni recurrencia se conserva en su familia;
- una tarea de configuración nunca se conserva en una función operativa por el
  solo hecho de que el actor posea otra función administrativa;
- una referencia contextual se muestra dentro de la tarea que la necesita, no
  como acceso global;
- una tarea sin trabajo actual puede conservarse si permite iniciar una acción
  autorizada o si su descubrimiento secundario está aprobado;
- una tarea que requiere una instancia, asignación o custodia no se muestra
  cuando no existe una relación vigente;
- una opción visible no prueba que una mutación continúe autorizada; cada
  comando revalida el contrato completo.

##### 5.4. Señales que no justifican relevancia

No justifican mostrar una opción:

- que exista una página o un `href`;
- que la pantalla esté registrada o activa;
- que el usuario la haya visitado anteriormente;
- que otro actor de la sede la utilice;
- que el rol tenga un nombre parecido a la tarea;
- que la aplicación pueda renderizar el componente;
- que exista un conteo parcial o desconocido;
- que la tarea sea popular globalmente;
- que el dispositivo haya usado esa función antes;
- que una lista local del cliente la considere disponible.

---

#### 6. `NEXO-OPTION-REDUCTION-LAYER-CATALOG-001`

La presentación utiliza cinco niveles y una salida fuera de la proyección:

| Nivel | Identidad              | Capacidad máxima | Contenido                                                                                     | Regla de reducción                                                                                         |
| ----: | ---------------------- | ---------------: | --------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
|     0 | Acción primaria        |                1 | comando o entrada principal de la proyección activa                                           | se oculta cuando no existe acción autorizada; nunca se sustituye con una opción de otra función            |
|     1 | Siguiente tarea        |                1 | tarea o instancia prioritaria resuelta autoritativamente                                      | no se duplica en frecuentes, recientes o familias destacadas                                               |
|     2 | Frecuentes y recientes |            4 + 3 | tareas recurrentes elegibles e instancias recientes revalidadas                               | se llenan solo después de retirar duplicados, obsoletas, incompatibles y opciones sin evidencia suficiente |
|     3 | Familias disponibles   |         variable | tareas restantes autorizadas bajo Mi trabajo, Consultar y controlar o Administrar             | se ocultan familias vacías y se conservan etiquetas humanas                                                |
|     4 | Contexto de la tarea   |         variable | referencias, utilidades, pasos, impresión, escaneo o acciones auxiliares necesarias           | solo aparece dentro de la tarea invocante y conserva retorno                                               |
| fuera | Fuera de la proyección |                0 | tareas no autorizadas, incompatibles, no aplicables, revocadas o técnicas sin tarea invocante | no se envían como opciones ni se convierten en elementos deshabilitados                                    |

Reglas adicionales:

1. el nivel inferior no repite una identidad ya materializada en un nivel
   superior;
2. el espacio adicional del escritorio no aumenta los máximos;
3. una familia vacía no se muestra con cero elementos;
4. “Todas las tareas disponibles” contiene únicamente tareas autorizadas y no
   rutas técnicas;
5. el acceso a un paso o detalle ocurre desde su tarea, no desde una opción
   adicional;
6. una opción retirada por revocación desaparece antes de permitir otra acción;
7. cambiar actor, función, sede, área, turno o dispositivo recalcula todos los
   niveles desde cero.

---

#### 7. `NEXO-ACTOR-OPTION-REDUCTION-MATRIX-001`

| Caso          | Contexto activo                         | Primer nivel permitido                                                                                           | Descubrimiento secundario permitido                                      | Exclusiones obligatorias                                                                                      | Resultado      |
| ------------- | --------------------------------------- | ---------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------- | -------------- |
| `RED-CTX-001` | solicitante autorizado                  | `NEXO-TASK-003`; `NEXO-TASK-002` o continuaciones propias cuando exista trabajo vigente                          | `NEXO-TASK-013` únicamente con lectura necesaria y autorizada            | preparación, transporte, recepción, supervisión, configuración, trabajo ajeno y utilidades globales           | `ESPECIFICADO` |
| `RED-CTX-002` | bodeguero o preparador autorizado       | `NEXO-TASK-004`; `NEXO-TASK-007` a `NEXO-TASK-011` según trabajo, prioridad y recurrencia                        | `NEXO-TASK-013` a `NEXO-TASK-016` cuando apoyen una tarea o lectura      | conducción, recepción ajena, decisión supervisora, administración y opciones de otra sede o área              | `ESPECIFICADO` |
| `RED-CTX-003` | conductor o custodio autorizado         | `NEXO-TASK-005` y continuaciones válidas de custodia, tránsito, entrega, incidencia o retorno                    | referencias mínimas de carga, ruta, sello y evidencia dentro de la tarea | solicitud, picking, recepción, ajustes, configuración, trabajo sin asignación y consultas globales            | `ESPECIFICADO` |
| `RED-CTX-004` | receptor autorizado                     | `NEXO-TASK-006`; `NEXO-TASK-007` cuando el origen empresarial y la autorización lo permitan                      | `NEXO-TASK-013` y `NEXO-TASK-015` como referencias necesarias            | conducción, preparación, decisiones supervisoras, configuración, otras sedes o destinos y utilidades globales | `ESPECIFICADO` |
| `RED-CTX-005` | supervisor con cobertura territorial    | `NEXO-TASK-012`; tareas `NEXO-TASK-013` a `NEXO-TASK-017` y `NEXO-TASK-026` cuando exista caso o señal admisible | referencias y evidencia dentro de cobertura                              | mutaciones operativas, configuración no concedida, datos fuera de cobertura y métricas individuales           | `ESPECIFICADO` |
| `RED-CTX-006` | configurador autorizado                 | `NEXO-TASK-021`; `NEXO-TASK-020`, `NEXO-TASK-022` a `NEXO-TASK-025` y `NEXO-TASK-027` según capacidad exacta     | referencias indispensables para evaluar impacto                          | ejecución física, supervisión, colas operativas, trabajo concreto ajeno y capacidades no concedidas           | `ESPECIFICADO` |
| `RED-CTX-007` | persona con varias funciones            | únicamente opciones de una función activa                                                                        | selector de funciones autorizadas, sin datos de las otras proyecciones   | mezcla de tareas, frecuencia compartida, herencia de autoridad, acciones cruzadas y autoaprobación            | `ESPECIFICADO` |
| `RED-CTX-008` | dispositivo compartido con actor activo | tareas compatibles con actor, función, turno, contexto y capacidades máximas del dispositivo                     | utilidades requeridas por la tarea vigente                               | administración, información sensible no necesaria, funciones incompatibles y toda acción sin actor atribuible | `ESPECIFICADO` |

Reconciliación:

```text
EXPECTED_CONTEXTS = 8
MATERIALIZED_CONTEXTS = 8
UNIQUE_CONTEXT_IDS = 8
MISSING_CONTEXTS = 0
DUPLICATE_CONTEXTS = 0
```

---

#### 8. `NEXO-TASK-REDUCTION-REGISTER-001`

Cada identidad conserva su etiqueta, familia y disposición base aprobadas. La
columna de reducción materializa qué debe ocurrir cuando la tarea no ocupa su
posición máxima dentro de la proyección activa.

| Tarea           | Etiqueta humana                   | Disposición base             | Conservación máxima               | Reducción obligatoria cuando no aplica el máximo                                                                               | Resultado      |
| --------------- | --------------------------------- | ---------------------------- | --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ | -------------- |
| `NEXO-TASK-001` | Ir al inicio                      | `HOME_ONLY`                  | retorno o resolución de inicio    | no se presenta como opción dentro de la propia superficie inicial                                                              | `ESPECIFICADO` |
| `NEXO-TASK-002` | Gestionar abastecimiento interno  | `PRIMARY_RESOLVED_CANDIDATE` | siguiente tarea o frecuente       | se conserva en Mi trabajo solo si el actor participa; sin etapa propia se excluye                                              | `ESPECIFICADO` |
| `NEXO-TASK-003` | Solicitar abastecimiento          | `PRIMARY_FIXED`              | acción primaria o continuación    | sin autorización de creación ni solicitud propia continuable se excluye; nunca baja a otro actor                               | `ESPECIFICADO` |
| `NEXO-TASK-004` | Preparar abastecimiento           | `PRIMARY_RESOLVED_CANDIDATE` | siguiente tarea o frecuente       | sin preparación, picking, faltante o handoff atribuible se conserva solo si puede iniciarse autorizadamente; si no, se excluye | `ESPECIFICADO` |
| `NEXO-TASK-005` | Transportar abastecimiento        | `PRIMARY_RESOLVED_CANDIDATE` | siguiente tarea o frecuente       | sin asignación, custodia, ruta o trabajo iniciable autorizado se excluye                                                       | `ESPECIFICADO` |
| `NEXO-TASK-006` | Recibir abastecimiento            | `PRIMARY_RESOLVED_CANDIDATE` | siguiente tarea o frecuente       | sin entrega, handoff, recepción atribuible o capacidad de inicio autorizada se excluye                                         | `ESPECIFICADO` |
| `NEXO-TASK-007` | Registrar una entrada             | `PRIMARY_RESOLVED_CANDIDATE` | siguiente tarea o frecuente       | sin fuente empresarial o excepción autorizada se conserva en Mi trabajo solo si puede iniciarse; en otro caso se excluye       | `ESPECIFICADO` |
| `NEXO-TASK-008` | Ubicar existencias                | `PRIMARY_RESOLVED_CANDIDATE` | siguiente tarea o frecuente       | sin existencia pendiente ni capacidad de inicio autorizada se conserva en Mi trabajo o se excluye según la función             | `ESPECIFICADO` |
| `NEXO-TASK-009` | Mover existencias                 | `PRIMARY_RESOLVED_CANDIDATE` | siguiente tarea o frecuente       | sin traslado vigente se conserva en Mi trabajo únicamente cuando puede iniciarse en el territorio                              | `ESPECIFICADO` |
| `NEXO-TASK-010` | Registrar un retiro               | `PRIMARY_RESOLVED_CANDIDATE` | siguiente tarea o frecuente       | sin retiro vigente se conserva en Mi trabajo únicamente cuando existe capacidad de inicio                                      | `ESPECIFICADO` |
| `NEXO-TASK-011` | Contar inventario                 | `PRIMARY_RESOLVED_CANDIDATE` | siguiente tarea o frecuente       | sin sesión o campaña asignada se conserva solo si puede iniciarse autorizadamente; captura y control no se mezclan             | `ESPECIFICADO` |
| `NEXO-TASK-012` | Controlar la operación            | `PRIMARY_RESOLVED_CANDIDATE` | siguiente tarea o frecuente       | sin caso, bloqueo, vencimiento o responsabilidad se conserva en Consultar y controlar si la lectura continúa autorizada        | `ESPECIFICADO` |
| `NEXO-TASK-013` | Consultar existencias             | `FREQUENT_CANDIDATE`         | frecuente                         | sin señal suficiente permanece en Consultar y controlar; fuera del territorio se excluye                                       | `ESPECIFICADO` |
| `NEXO-TASK-014` | Investigar movimientos            | `FREQUENT_CANDIDATE`         | frecuente                         | sin caso ni recurrencia permanece en Consultar y controlar; sin lectura autorizada se excluye                                  | `ESPECIFICADO` |
| `NEXO-TASK-015` | Consultar ubicaciones             | `FREQUENT_CANDIDATE`         | frecuente                         | sin necesidad ni recurrencia permanece en Consultar y controlar; edición no se añade                                           | `ESPECIFICADO` |
| `NEXO-TASK-016` | Consultar contenedores logísticos | `SECONDARY_DISCOVERABLE`     | familia secundaria                | se mantiene en Consultar y controlar únicamente con permiso y contexto LPN; nunca sube sin señal propietaria                   | `ESPECIFICADO` |
| `NEXO-TASK-017` | Gestionar activos                 | `FREQUENT_CANDIDATE`         | frecuente                         | sin trabajo ni recurrencia permanece en su familia; fuera de la función o territorio se excluye                                | `ESPECIFICADO` |
| `NEXO-TASK-018` | Capturar activos                  | `PRIMARY_RESOLVED_CANDIDATE` | siguiente tarea o frecuente       | sin captura pendiente ni capacidad de inicio autorizada se conserva en Mi trabajo o se excluye                                 | `ESPECIFICADO` |
| `NEXO-TASK-019` | Contar activos                    | `PRIMARY_RESOLVED_CANDIDATE` | siguiente tarea o frecuente       | sin sesión compatible se conserva solo si puede iniciarse; captura y cierre permanecen separados                               | `ESPECIFICADO` |
| `NEXO-TASK-020` | Configurar activos                | `SECONDARY_DISCOVERABLE`     | familia de configuración          | se conserva únicamente en Administrar con capacidad exacta; en toda función operativa se excluye                               | `ESPECIFICADO` |
| `NEXO-TASK-021` | Administrar NEXO                  | `PRIMARY_RESOLVED_CANDIDATE` | acción o siguiente administrativa | sin capacidad administrativa se excluye; con una sola capacidad resuelve directamente y no añade un menú intermedio            | `ESPECIFICADO` |
| `NEXO-TASK-022` | Administrar productos y unidades  | `FREQUENT_CANDIDATE`         | frecuente administrativa          | sin recurrencia permanece en Administrar; en funciones operativas se excluye                                                   | `ESPECIFICADO` |
| `NEXO-TASK-023` | Administrar ubicaciones           | `FREQUENT_CANDIDATE`         | frecuente administrativa          | sin recurrencia permanece en Administrar; no se confunde con ubicar existencias                                                | `ESPECIFICADO` |
| `NEXO-TASK-024` | Configurar abastecimiento         | `FREQUENT_CANDIDATE`         | frecuente administrativa          | sin recurrencia permanece en Administrar; no muestra solicitudes concretas como opciones                                       | `ESPECIFICADO` |
| `NEXO-TASK-025` | Configurar referencias internas   | `SECONDARY_DISCOVERABLE`     | familia de configuración          | se conserva solo con permiso financiero o de referencia exacto; no sube por actividad operativa                                | `ESPECIFICADO` |
| `NEXO-TASK-026` | Controlar impresión               | `PRIMARY_RESOLVED_CANDIDATE` | siguiente tarea o frecuente       | sin trabajo fallido, bloqueado o pendiente se conserva en Consultar y controlar solo con cobertura autorizada                  | `ESPECIFICADO` |
| `NEXO-TASK-027` | Configurar impresión              | `SECONDARY_DISCOVERABLE`     | familia de configuración          | se conserva únicamente en Administrar con capacidad exacta; nunca aparece por existencia de trabajos                           | `ESPECIFICADO` |
| `NEXO-TASK-028` | Resolver un destino contextual    | `CONTEXTUAL_ONLY`            | contexto de tarea                 | permanece fuera de listas; sin tarea invocante compatible se excluye                                                           | `ESPECIFICADO` |
| `NEXO-TASK-029` | Resolver acceso                   | `CONTEXTUAL_ONLY`            | sistema de acceso                 | permanece fuera de la navegación empresarial; autenticación o denegación se resuelven como estado                              | `ESPECIFICADO` |

Reconciliación:

```text
EXPECTED_TASK_IDS = 29
MATERIALIZED_TASK_IDS = 29
UNIQUE_TASK_IDS = 29
MISSING_TASK_IDS = 0
DUPLICATE_TASK_IDS = 0
```

Distribución heredada y conservada:

| Disposición base             | Cantidad esperada | Cantidad materializada | Diferencia |
| ---------------------------- | ----------------: | ---------------------: | ---------: |
| `HOME_ONLY`                  |                 1 |                      1 |          0 |
| `PRIMARY_FIXED`              |                 1 |                      1 |          0 |
| `PRIMARY_RESOLVED_CANDIDATE` |                14 |                     14 |          0 |
| `FREQUENT_CANDIDATE`         |                 7 |                      7 |          0 |
| `SECONDARY_DISCOVERABLE`     |                 4 |                      4 |          0 |
| `CONTEXTUAL_ONLY`            |                 2 |                      2 |          0 |
| **Total**                    |            **29** |                 **29** |      **0** |

---

#### 9. `NEXO-OPTION-DEDUPE-AND-COLLAPSE-CONTRACT-001`

##### 9.1. Clave de deduplicación

La deduplicación utiliza `task_id` y, cuando existe trabajo concreto,
`instance_id`, función, territorio, etapa y versión. No utiliza únicamente
`href`, etiqueta o componente.

##### 9.2. Precedencia entre zonas

Cuando la misma identidad sea elegible en varias zonas se conserva en la
primera aplicable:

1. acción primaria;
2. siguiente tarea;
3. continuación reciente de una instancia concreta;
4. tarea frecuente agregada;
5. familia secundaria;
6. contexto interno de la tarea.

Una identidad retirada de una zona inferior no pierde sus instancias ni su
capacidad. Solo evita repetir la misma intención.

##### 9.3. Colapso obligatorio

- solicitar, preparar, transportar y recibir permanecen tareas separadas; el
  resolutor de abastecimiento no las duplica como cuatro accesos adicionales;
- una tarea frecuente muestra una entrada agregada; sus instancias concretas
  aparecen únicamente como continuaciones válidas;
- detalle, edición, impresión, escaneo, referencia, configuración subordinada y
  pasos de flujo se abren desde la tarea propietaria;
- una misma ruta vinculada a varias etapas no crea varias opciones si conserva
  una sola intención humana;
- rutas alias, kioscos, códigos y resolutores no aparecen en familias;
- una acción primaria que lleva a la misma tarea que la siguiente tarea se
  presenta una sola vez y conserva el contexto más específico;
- familias con una sola tarea pueden abrir esa tarea directamente sin mostrar
  un nivel intermedio vacío;
- familias sin tareas relevantes se retiran por completo de la proyección.

##### 9.4. Prohibiciones

Queda prohibido:

- mostrar una opción deshabilitada para informar que no existe permiso;
- repetir una tarea con etiquetas distintas por tener varias rutas;
- mostrar una opción genérica y otra específica que resuelven la misma
  instancia;
- completar máximos con tareas irrelevantes;
- mantener una opción reciente después de revocación, cambio de actor, función,
  territorio, etapa, asignación o versión;
- utilizar ocultamiento visual como sustituto de autorización de servidor.

---

#### 10. Familias, descubrimiento y opciones vacías

##### 10.1. Grupos humanos conservados

Los cuatro grupos permanecen en este orden cuando contienen tareas relevantes:

1. Inicio;
2. Mi trabajo;
3. Consultar y controlar;
4. Administrar.

`Inicio` representa retorno y contexto, no una lista adicional. `Administrar`
se excluye de proyecciones operativas salvo que la función activa sea de
configuración. Una persona multifunción cambia explícitamente de función antes
de obtener otro grupo.

##### 10.2. Familias vacías

- una familia con cero tareas relevantes no se renderiza;
- no se muestra un encabezado vacío, un contador cero ni una explicación de
  permisos ausentes;
- si la consulta es parcial, no se declara que la familia está vacía;
- si la familia falla de manera independiente, se identifica la parcialidad y
  se ofrece reintento seguro sin fabricar opciones;
- si todas las familias quedan vacías y la decisión es concluyente, se presenta
  un vacío válido coherente con la función activa.

##### 10.3. Descubrimiento seguro

- las tareas autorizadas pero no destacadas permanecen localizables por su
  familia;
- la búsqueda, cuando exista en implementación posterior, opera únicamente
  sobre el conjunto autorizado y ya minimizado;
- las etiquetas conservan verbo e intención empresarial;
- no se muestran nombres de tablas, permisos, rutas, carpetas o componentes;
- una búsqueda sin resultados no revela la existencia de tareas no autorizadas;
- una tarea infrecuente conserva propósito y contexto suficiente para reingreso
  sin depender de memoria del usuario.

---

#### 11. `NEXO-OPTION-REDUCTION-STATE-CONTRACT-001`

| Estado                           | Condición                                                                                   | Presentación obligatoria                                                        | Opciones permitidas                                    |
| -------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------ |
| `RESOLVIENDO_RELEVANCIA`         | actor, función, contexto o conjunto autorizado todavía no son concluyentes                  | estructura mínima sin opciones, conteos ni familias                             | cancelar o esperar                                     |
| `OPCIONES_LISTAS`                | la decisión es completa y existen tareas relevantes                                         | niveles ordenados, sin duplicados y con contexto visible                        | solo opciones incluidas en la respuesta autoritativa   |
| `ACCION_PRIMARIA_AUSENTE`        | la proyección es válida pero no existe comando principal autorizado                         | contexto y trabajo disponible sin fabricar una acción                           | navegación secundaria autorizada                       |
| `VACIO_VALIDO`                   | la decisión es concluyente y no existe trabajo ni tarea iniciable relevante                 | mensaje de ausencia real, sin accesos alternos ni conteos cero                  | cambio de contexto autorizado o salida segura          |
| `SOLO_DESCUBRIMIENTO_SECUNDARIO` | no existe trabajo destacado, pero permanecen tareas autorizadas dentro de familias          | familias disponibles sin promoverlas artificialmente                            | abrir una tarea secundaria autorizada                  |
| `DATOS_PARCIALES`                | una fuente de trabajo, frecuencia, recientes o familias perdió frescura o falló             | último conjunto confirmado, sección afectada y advertencia de incompletitud     | lectura segura y reintento; no completar con supuestos |
| `CONTEXTO_CAMBIADO_O_REVOCADO`   | actor, función, turno, territorio, dispositivo, asignación o permiso dejaron de ser válidos | retirar inmediatamente opciones y datos previos                                 | resolver nuevamente el contexto                        |
| `OPCION_CAMBIADA_O_RETIRADA`     | tarea o instancia visible dejó de ser relevante antes de abrirse o continuar                | explicar cambio sin presentar culpa ni conservar un control obsoleto            | volver al conjunto recalculado                         |
| `ACCESO_DIRECTO_DENEGADO`        | se solicitó explícitamente una tarea o ruta que no supera la revalidación                   | denegación canónica minimizada, sin revelar opciones elegibles de otros actores | recuperación segura derivada del perfil                |
| `FALLO_TECNICO`                  | no existe una decisión estable por indisponibilidad o error                                 | mensaje recuperable diferenciado de vacío, denegación y revocación              | reintentar consulta cuando sea seguro                  |

Reglas transversales:

- un fallo técnico no se degrada a vacío;
- datos parciales no se completan con cero ni con opciones de una respuesta
  anterior incompatible;
- una denegación explícita no provoca que la opción aparezca deshabilitada en
  renders posteriores;
- una opción retirada invalida su acción antes de presentar el nuevo conjunto;
- un cambio de función elimina frecuencia, recientes y caché de la función
  anterior;
- un resultado desconocido de escritura no se convierte en reciente ni se
  utiliza como señal de frecuencia hasta reconciliarse.

---

#### 12. Responsive y accesibilidad

##### 12.1. Móvil

- acción primaria y siguiente tarea preceden a toda lista;
- frecuentes y recientes mantienen sus máximos y no se expanden por scroll
  horizontal;
- familias secundarias permanecen colapsables con nombre y cantidad accesible;
- utilidades contextuales aparecen dentro de la tarea, no en una barra global;
- ninguna opción depende de hover, gesto oculto o reconocimiento por color.

##### 12.2. Tablet y estación compartida

- la primera vista muestra contexto, siguiente tarea y bloqueo prioritario;
- los objetivos táctiles son compatibles con operación física;
- escaneo, impresión y periféricos aparecen únicamente cuando la tarea los
  requiere;
- cambiar actor retira inmediatamente opciones y datos del actor anterior;
- el dispositivo limita el conjunto máximo, pero no aporta autoridad humana.

##### 12.3. Escritorio

- el espacio adicional permite mejor lectura, no más opciones de primer nivel;
- el sidebar no reproduce todas las rutas autorizadas sin aplicar reducción;
- las familias secundarias no compiten visualmente con la acción primaria;
- configuración y supervisión permanecen fuera de funciones operativas.

##### 12.4. Accesibilidad

- el orden de foco sigue los niveles de presentación;
- la acción primaria tiene nombre y propósito estables;
- cambios de conjunto, opción retirada y revocación se anuncian de forma
  accesible;
- una familia colapsada informa su nombre y estado expandido;
- etiquetas y descripciones no dependen de iconos;
- el vacío, la parcialidad, la denegación y el fallo técnico son distinguibles;
- el cambio de función exige confirmación comprensible y nuevo contexto visible.

---

#### 13. Seguridad, privacidad y minimización

1. El servidor filtra tareas y datos antes de construir la proyección.
2. El cliente no recibe un catálogo global para ocultarlo después.
3. Frecuencia y recientes se calculan únicamente sobre eventos del actor,
   función y territorio aplicables.
4. La lista no revela tareas, conteos, recursos, sedes, actores ni capacidades
   fuera de alcance.
5. Cada acceso y cada comando revalidan actor, función, permiso, territorio,
   recurso, etapa, estado y versión.
6. El ocultamiento no se utiliza como control de seguridad final.
7. La simulación, cuando sea admisible, permanece diferenciada y no produce
   autoridad ni eventos reales de frecuencia.
8. Un dispositivo compartido no conserva opciones, recientes o señales del
   actor anterior.
9. La reducción no expone claves de permiso, reason codes internos, reglas RLS,
   nombres de tablas ni rutas técnicas.
10. Los eventos de navegación no se usan para comparar productividad,
    desempeño o ranking individual.
11. Cerrar sesión o revocar contexto elimina proyección, caché y referencias
    temporales.
12. Un acceso directo no reintroduce una opción excluida ni concede permiso.

---

#### 14. Estado técnico y brecha de implementación

| Elemento                                                      | Estado documental        | Evidencia actual permitida                                                                   | Condición de salida                                                          |
| ------------------------------------------------------------- | ------------------------ | -------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| catálogo de 29 tareas y 8 familias                            | `ESPECIFICADO`           | `NEXO-NAVIGATION-TASK-CATALOG-001` y `NEXO-TASK-PLACEMENT-REGISTER-001`                      | consumo íntegro en prototipo e implementación                                |
| reducción para 8 contextos                                    | `ESPECIFICADO`           | `NEXO-ACTOR-OPTION-REDUCTION-MATRIX-001`                                                     | prototipo diferenciado y pruebas posteriores                                 |
| decisión individual para 29 tareas                            | `ESPECIFICADO`           | `NEXO-TASK-REDUCTION-REGISTER-001`                                                           | binding físico sin faltantes ni duplicados                                   |
| filtro actual por permiso en shell                            | `IMPLEMENTADO_PARCIAL`   | `vento-nexo` consulta `app_navigation_items` activas y filtra permisos                       | añadir identidad de tarea, relevancia, disposición, prioridad y reducción    |
| agrupación y render actual del sidebar                        | `IMPLEMENTADO_PARCIAL`   | `vento-nexo` agrupa por `group_label` y renderiza todos los elementos recibidos              | consumir una proyección reducida y no una lista de pantallas permitidas      |
| acciones actuales de la superficie inicial                    | `IMPLEMENTADO_PARCIAL`   | `vento-nexo` mantiene una lista local de acciones y reglas de enfoque por rol y tipo de sede | sustituirla por actor, función, tarea y contexto autoritativos               |
| sincronización técnica de pantallas                           | `IMPLEMENTADO_PARCIAL`   | el sincronizador clasifica páginas y candidatos de menú a partir de rutas y registros        | separar inventario técnico de navegación humana y enlazar `task_id` canónico |
| prototipo visual de reducción                                 | `NO_IMPLEMENTADO`        | no existe evidencia aprobada en esta tarea                                                   | `AUTH-UI-055`                                                                |
| validación con usuarios                                       | `PENDIENTE_DE_EVIDENCIA` | no ejecutada                                                                                 | `AUTH-UI-056` a `AUTH-UI-060`                                                |
| implementación de resolutor, consultas, componentes y pruebas | `NO_IMPLEMENTADO`        | fuera de la fase documental actual                                                           | paquete de implementación NEXO autorizado por la continuidad                 |

La existencia de filtros de permiso, grupos de navegación o reglas locales de
foco no demuestra que la reducción aquí definida esté implementada o validada.

---

#### 15. Criterios de aceptación

La tarea se considera documentalmente completa cuando se confirme que:

- las ocho familias y veintinueve tareas conservan sus identidades canónicas;
- los ocho contextos tienen una decisión explícita de reducción;
- cada tarea tiene exactamente una fila y un resultado de conservación o
  exclusión;
- se materializan veintinueve identidades únicas, sin faltantes ni duplicados;
- la distribución heredada de disposiciones suma veintinueve y no cambia;
- la acción primaria y la siguiente tarea no se duplican;
- frecuentes no superan cuatro tareas y recientes no superan tres instancias;
- las tareas autorizadas pero secundarias permanecen accesibles por familia;
- una familia vacía no produce encabezado, conteo cero ni opción deshabilitada;
- tareas no autorizadas o incompatibles no se envían al cliente;
- resolutores, acceso, alias, kioscos, códigos y utilidades permanecen fuera del
  menú empresarial;
- rutas, detalles, edición, referencias y pasos no se convierten en tareas
  adicionales;
- una persona multifunción conserva una sola función activa por proyección;
- el dispositivo compartido no conserva opciones del actor anterior;
- cambiar actor, función o contexto recalcula la proyección completa;
- frecuencia, orden y visibilidad no conceden autoridad;
- acceso directo y comandos revalidan el contrato autoritativo;
- los diez estados distinguen vacío, parcialidad, revocación, retiro,
  denegación y fallo técnico;
- las reglas responsive y de accesibilidad no aumentan opciones ni autoridad;
- no se crean rutas, roles, funciones, permisos, procesos ni requisitos nuevos;
- las brechas técnicas tienen propietario y condición de salida;
- `AUTH-UI-055` permanece únicamente reservada.

---

#### 16. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación: esta tarea no introduce un comportamiento autorizativo,
operativo, de navegación o de seguridad nuevo. Materializa la reducción y
presentación de las veintinueve tareas ya protegidas por los requisitos
vigentes asociados a los contratos consumidos, en particular las reglas sobre
familias, tareas, contextos, ocultamiento, rutas, utilidades, estados y
separación entre inventario técnico y navegación humana. No modifica, difiere,
descarta ni declara obsoleto ningún requisito histórico, por lo que el Registro
Canónico de Requisitos de Prueba no cambia.

---

#### 17. `NEXO-OPTION-REDUCTION-HANDOFF-001`

| Destino                        | Handoff aprobado                                                                                                                                                          |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `AUTH-UI-055`                  | crear prototipos separados por proyección que materialicen los cinco niveles, máximos, familias, ocultamientos, estados y deduplicación aprobados aquí                    |
| `AUTH-UI-056`                  | validar el prototipo sin presentar inspección documental o ejecución técnica como prueba con usuarios                                                                     |
| `AUTH-UI-057`                  | definir criterios de usabilidad por pantalla para relevancia, tiempo de localización, carga cognitiva, recuperación y comprensión                                         |
| `AUTH-UI-058`                  | probar con usuarios reales las proyecciones de solicitante, bodega, conductor, receptor, supervisor, configuración, multifunción y dispositivo compartido                 |
| `AUTH-UI-059`                  | registrar problemas sin cambiar silenciosamente tareas, identidades, permisos, disposiciones o continuidad                                                                |
| `AUTH-UI-060`                  | aprobar cada pantalla únicamente con evidencia real y criterios satisfechos                                                                                               |
| paquete de implementación NEXO | implementar resolutor, bindings, consultas, componentes, estados, caché, eventos, migraciones desde `vento-shell`, pruebas y telemetría cuando la continuidad lo autorice |

Ningún destino anterior se inicia mediante esta tarea.

---

#### 18. Continuidad canónica

**ÚLTIMA TAREA APROBADA**

`AUTH-UI-053 — Diseñar navegación según tareas frecuentes`

**TAREA ACTUAL APROBADA**

`AUTH-UI-054 — Reducir opciones irrelevantes`

**SIGUIENTE TAREA RESERVADA**

`AUTH-UI-055 — Crear prototipo por rol`


### ✅ AUTH-UI-055 — Crear prototipo por rol

**Estado:** APROBADA
**Tarea anterior:** `AUTH-UI-054 — Reducir opciones irrelevantes` — APROBADA
**Tarea siguiente:** `AUTH-UI-056 — Validar prototipo antes de implementar` — RESERVADA
**Tipo de tarea:** documental; prototipo funcional materializado de la superficie inicial y navegación de NEXO para ocho contextos de actor, función y dispositivo, sin implementación física ni validación con usuarios
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/I_NAVEGACION_Y_PANTALLAS/06_EXPERIENCIA_USABILIDAD_Y_APROBACION.md`
**Repositorio de aplicación inspeccionado:** `vento-nexo`
**Ruta prioritaria:** `NEXO-REMISSIONS-001`
**Etapa prioritaria:** `NEXO_UI_VALIDATION`
**Superficie propietaria:** `NEXO-ROUTE-001` — `/`
**Cambios físicos autorizados:** ninguno; no modifica código, componentes, rutas, permisos, roles, funciones, procesos, datos, Supabase, migraciones, RLS, configuración, telemetría ni despliegues

---

#### 1. Propósito

Materializar un prototipo funcional y revisable para cada contexto aprobado de
NEXO, de modo que la superficie inicial muestre una sola proyección coherente,
una sola acción primaria y únicamente las tareas relevantes para el actor
humano, la función activa, el territorio, el trabajo vigente y el dispositivo.

El título canónico conserva la expresión “por rol”, pero el prototipo no usa el
nombre del cargo como fuente de autoridad. La variante visible se resuelve con:

```text
ACTOR EFECTIVO
+
FUNCIÓN ACTIVA
+
CONTEXTO TERRITORIAL Y LABORAL
+
DISPOSITIVO Y SESIÓN COMPATIBLES
+
TAREAS AUTORIZADAS Y TRABAJO VIGENTE
+
PRIORIDAD, ESTADO, CUSTODIA, HANDOFF Y BLOQUEOS
→
UNA PROYECCIÓN PROTOTIPADA
```

La misma ruta `/` presenta variantes de composición. No existen rutas distintas
por actor y ninguna decisión visual concede permiso, asignación, territorio,
custodia, etapa o capacidad de mutación.

---

#### 2. Resultado material

Se materializan ocho artefactos documentales consumibles:

1. `NEXO-ACTOR-PROTOTYPE-CONTRACT-001`, que define identidad, autoridad,
   fidelidad, límites y unidad del prototipo;
2. `NEXO-ACTOR-PROTOTYPE-VISUAL-GRAMMAR-001`, que fija jerarquía, densidad,
   componentes, interacción y compatibilidad con el sistema visual vigente;
3. `NEXO-ACTOR-PROTOTYPE-CATALOG-001`, que materializa ocho variantes de
   proyección;
4. `NEXO-ACTOR-PROTOTYPE-WIREFRAME-SET-001`, que representa la composición
   completa de cada variante;
5. `NEXO-PROTOTYPE-TASK-TRACEABILITY-REGISTER-001`, que asigna una decisión
   explícita a las veintinueve tareas canónicas;
6. `NEXO-ACTOR-PROTOTYPE-STATE-MATRIX-001`, que materializa diez estados de
   presentación y recuperación;
7. `NEXO-ACTOR-PROTOTYPE-RESPONSIVE-INTERACTION-CONTRACT-001`, que define móvil,
   tablet, escritorio, estación compartida, foco, tacto y accesibilidad;
8. `NEXO-ACTOR-PROTOTYPE-HANDOFF-001`, que entrega el prototipo a validación sin
   iniciar la tarea siguiente.

Cobertura materializada:

| Elemento                                            | Total esperado | Total materializado | Faltantes | Duplicados |
| --------------------------------------------------- | -------------: | ------------------: | --------: | ---------: |
| Superficies iniciales reutilizadas                  |              1 |                   1 |         0 |          0 |
| Contextos de actor, función y dispositivo           |              8 |                   8 |         0 |          0 |
| Proyecciones funcionales principales                |              6 |                   6 |         0 |          0 |
| Composiciones especiales                            |              2 |                   2 |         0 |          0 |
| Zonas comunes de composición                        |              8 |                   8 |         0 |          0 |
| Familias de tareas canónicas                        |              8 |                   8 |         0 |          0 |
| Tareas humanas o resolutores                        |             29 |                  29 |         0 |          0 |
| Niveles visibles de presentación                    |              5 |                   5 |         0 |          0 |
| Clases fuera de la proyección                       |              1 |                   1 |         0 |          0 |
| Estados de presentación                             |             10 |                  10 |         0 |          0 |
| Rutas, roles, funciones, procesos o permisos nuevos |              0 |                   0 |         0 |          0 |
| Requisitos de prueba nuevos o modificados           |              0 |                   0 |         0 |          0 |

El resultado queda `ESPECIFICADO` y `PROTOTIPADO_DOCUMENTALMENTE`. No se declara
`IMPLEMENTADO`, `VALIDADO`, probado con usuarios ni disponible en producción.

---

#### 3. Decisiones y contratos consumidos

La tarea consume sin modificar:

- `NEXO-ACTOR-HOME-PAGE-CONTRACT-001`;
- `NEXO-ACTOR-HOME-RESOLUTION-MATRIX-001`;
- `NEXO-ACTOR-HOME-COMPOSITION-MATRIX-001`;
- `NEXO-ACTOR-HOME-INFORMATION-ARCHITECTURE-001`;
- `NEXO-ACTOR-HOME-PRIORITY-CONTRACT-001`;
- `NEXO-ACTOR-HOME-STATE-CONTRACT-001`;
- `NEXO-ACTOR-HOME-RESPONSIVE-ACCESSIBILITY-CONTRACT-001`;
- `NEXO-FREQUENT-TASK-NAVIGATION-CONTRACT-001`;
- `NEXO-FREQUENCY-SIGNAL-CONTRACT-001`;
- `NEXO-ACTOR-FREQUENT-TASK-MATRIX-001`;
- `NEXO-TASK-PLACEMENT-REGISTER-001`;
- `NEXO-RECENT-CONTINUATION-CONTRACT-001`;
- `NEXO-FREQUENT-TASK-STATE-CONTRACT-001`;
- `NEXO-OPTION-RELEVANCE-CONTRACT-001`;
- `NEXO-OPTION-REDUCTION-LAYER-CATALOG-001`;
- `NEXO-ACTOR-OPTION-REDUCTION-MATRIX-001`;
- `NEXO-TASK-REDUCTION-REGISTER-001`;
- `NEXO-OPTION-DEDUPE-AND-COLLAPSE-CONTRACT-001`;
- `NEXO-OPTION-REDUCTION-STATE-CONTRACT-001`;
- `NEXO-TASK-NAVIGATION-CONTRACT-001`;
- `NEXO-NAVIGATION-TASK-CATALOG-001`;
- `NEXO-ACTOR-TASK-COMPOSITION-MATRIX-001`;
- `NEXO-ROUTE-TO-TASK-REGISTRY-001`;
- `NEXO-NAVIGATION-ENTRY-RETURN-CONTRACT-001`;
- `NEXO-CONTEXTUAL-UTILITY-CONTRACT-001`;
- `NEXO-NAVIGATION-STATE-CONTRACT-001`;
- los contratos de inicio de solicitante, bodega, conductor, receptor y
  supervisor;
- los contratos vigentes de contexto visible, captura única, tareas frecuentes,
  divulgación progresiva, tacto, densidad, accesibilidad, sensibilidad, masking,
  dispositivo compartido y estados interactivos auxiliares;
- los requisitos `TREQ-NEXO-050` a `TREQ-NEXO-090` y los requisitos `TREQ-UX-*`
  vigentes asociados a prototipos, accesibilidad, relevancia, contexto, tacto y
  validación humana.

No se cambia la identidad, etiqueta, familia, grupo, disposición, audiencia,
responsabilidad, permiso, proceso, etapa o regla de exposición de ninguna tarea
consumida.

---

#### 4. Alcance y límites

##### 4.1. Incluido

- ocho variantes completas de la misma superficie `/`;
- una composición diferenciada para solicitante, bodega, conductor, receptor,
  supervisor y configuración;
- composición específica para persona multifunción y dispositivo compartido;
- ocho zonas comunes en orden estable;
- una única acción primaria por variante;
- siguiente tarea, frecuentes, recientes, bloqueos, familias y utilidades;
- máximo cuatro tareas frecuentes y tres continuaciones recientes;
- estados de carga, vacío, parcialidad, retiro, denegación, revocación y fallo;
- decisión explícita para las veintinueve tareas del catálogo;
- reglas de móvil, tablet, escritorio y estación compartida;
- especificación de foco, tacto, teclado, lector de pantalla y lenguaje;
- evidencia documental de diferencias entre el comportamiento actual y el
  objetivo prototipado.

##### 4.2. Excluido

- construir componentes ejecutables;
- modificar la página actual, el shell, el sidebar o el launcher de aplicaciones;
- crear rutas por actor;
- conectar consultas, resolutores, caché, eventos o telemetría;
- crear datos de ejemplo en Supabase;
- validar tiempos, comprensión, errores, accesibilidad o ergonomía con personas;
- declarar resultados de uso, aceptación o desempeño;
- seleccionar una variante desde un parámetro enviado por el cliente;
- cambiar permisos, funciones, asignaciones, contexto o reglas de autorización;
- iniciar `AUTH-UI-056` a `AUTH-UI-060`;
- ejecutar cambios físicos o desplegados.

---

#### 5. `NEXO-ACTOR-PROTOTYPE-CONTRACT-001`

##### 5.1. Unidad prototipada

La unidad es una proyección de trabajo sobre `NEXO-ROUTE-001` — `/`. Cada
proyección conserva:

- actor efectivo atribuible;
- función activa;
- sede, área, turno, check-in y dispositivo cuando aplican;
- acción primaria;
- siguiente tarea o ausencia concluyente de ella;
- tareas frecuentes elegibles;
- continuaciones recientes revalidadas;
- bloqueos y vencimientos accionables;
- tareas secundarias por familia;
- utilidades contextuales y cambio seguro de contexto.

El prototipo usa datos semánticos de ejemplo, nunca IDs de recursos, personas,
sedes, remisiones, cantidades, fechas o métricas que pretendan representar el
estado real.

##### 5.2. Autoridad

El prototipo representa una respuesta ya resuelta por servidor. No permite que
el cliente declare:

- actor;
- rol o función;
- sede o área;
- turno o check-in;
- permiso;
- prioridad;
- etapa o estado;
- asignación, custodia o handoff;
- variante de pantalla;
- disponibilidad de una tarea.

Cada acceso y acción del futuro producto deberá revalidar el contrato vigente.
La presencia de un control en este prototipo no constituye una concesión.

##### 5.3. Fidelidad

El prototipo es de fidelidad funcional media:

- suficiente para revisar jerarquía, contenido, secuencia, estados y adaptación;
- suficiente para identificar qué se muestra, se colapsa, se invoca en contexto
  o se excluye;
- insuficiente para acreditar usabilidad, rendimiento, accesibilidad ejecutada,
  integración, autorización, datos, periféricos o comportamiento real.

##### 5.4. Invariantes

1. Una sola proyección activa por render.
2. Una sola acción primaria.
3. La siguiente tarea precede a listas secundarias.
4. No se duplican acción primaria, siguiente tarea, reciente y frecuente.
5. Las tareas autorizadas no prioritarias permanecen descubribles por familia.
6. Las tareas incompatibles no se muestran como controles bloqueados.
7. Los resolutores permanecen dentro de la tarea invocante.
8. El contexto material permanece visible durante acciones relevantes.
9. El espacio adicional no aumenta opciones de primer nivel.
10. Cambiar actor, función o contexto invalida la proyección anterior.

---

#### 6. `NEXO-ACTOR-PROTOTYPE-VISUAL-GRAMMAR-001`

##### 6.1. Zonas y orden

| Orden | Zona                            | Composición prototipada                                                                          |
| ----: | ------------------------------- | ------------------------------------------------------------------------------------------------ |
|     1 | Contexto activo                 | función, sede, área, jornada y dispositivo aplicables; detalle ampliable sin claves técnicas     |
|     2 | Acción primaria                 | un CTA con verbo y resultado humano; nunca dos acciones equivalentes                             |
|     3 | Siguiente tarea                 | tarjeta dominante con tarea, recurso permitido, estado, motivo de prioridad y continuación       |
|     4 | Tareas frecuentes               | hasta cuatro accesos agregados, sin instancias duplicadas                                        |
|     5 | Continuar trabajo reciente      | hasta tres instancias revalidadas con estado y última confirmación                               |
|     6 | Bloqueos y vencimientos         | causa, efecto, responsable y recuperación; no usa solo color                                     |
|     7 | Todas las tareas disponibles    | familias humanas colapsables; se excluyen familias vacías                                        |
|     8 | Utilidades y cambio de contexto | escaneo, impresión o cambio de función únicamente cuando la tarea y el dispositivo lo justifican |

##### 6.2. Sistema visual conservado

El prototipo conserva la gramática visual vigente de NEXO:

- fondo claro frío y superficies blancas;
- acento de marca dorado para acción primaria y énfasis controlado;
- texto principal oscuro y texto secundario con contraste suficiente;
- tarjetas con borde, radio y sombra moderados;
- estados críticos acompañados por título, explicación y acción, no solo color;
- jerarquía tipográfica por propósito, no por tamaño decorativo;
- máximo dos columnas para contenido operativo;
- objetivos táctiles ordinarios de al menos 48 por 48 unidades lógicas;
- iconos siempre acompañados por etiqueta o nombre accesible.

No se crean tokens, logos, iconos, componentes ni paletas adicionales.

##### 6.3. Densidad

| Proyección             | Nivel base                     | Regla                                                                                      |
| ---------------------- | ------------------------------ | ------------------------------------------------------------------------------------------ |
| solicitante            | `D0_FOCUSED`                   | crear, continuar y seguir solicitudes propias sin paneles administrativos                  |
| bodega                 | `D1_CONTEXTUAL`                | siguiente trabajo, cola corta y referencias físicas necesarias                             |
| conductor              | `D0_FOCUSED`                   | una custodia o siguiente hito, sin tablas globales                                         |
| receptor               | `D0_FOCUSED`                   | handoff, verificación y recepción de una entrega atribuida                                 |
| supervisor             | `D2_COMPARATIVE`               | comparar casos, bloqueos y evidencia dentro de cobertura, sin mutación operativa ordinaria |
| configuración          | `D2_COMPARATIVE`               | capacidades administrativas, alcance y cambios pendientes, sin ejecución física            |
| multifunción           | nivel de la función activa     | no combina densidades ni controles de varias funciones                                     |
| dispositivo compartido | `D0_FOCUSED` o `D1_CONTEXTUAL` | limita información y tareas a actor y estación compatibles                                 |

##### 6.4. Componentes conceptuales

| Componente                 | Contenido mínimo                                      | Prohibición principal                           |
| -------------------------- | ----------------------------------------------------- | ----------------------------------------------- |
| resumen de contexto        | función, territorio, jornada y dispositivo aplicables | inferir autoridad desde el selector             |
| tarjeta de siguiente tarea | intención, estado, recurso permitido, motivo y CTA    | mostrar conteos parciales como definitivos      |
| acceso frecuente           | tarea agregada, propósito y contexto                  | repetir instancias recientes                    |
| continuación reciente      | instancia, etapa, última confirmación y frescura      | conservar trabajo revocado                      |
| bloqueo                    | causa humana, efecto, responsable y recuperación      | exponer razón técnica, SQL o permiso            |
| familia secundaria         | nombre humano y tareas autorizadas                    | mostrar encabezado vacío o opciones sin acceso  |
| utilidad contextual        | propósito, tarea invocante y retorno                  | convertirse en módulo global                    |
| cambio de función o actor  | función destino autorizada, efecto y confirmación     | mezclar datos o caché de la proyección anterior |

---

#### 7. `NEXO-ACTOR-PROTOTYPE-CATALOG-001`

| Prototipo        | Contexto canónico                       | Proyección propietaria                        | Acción primaria ordinaria                  | Siguiente trabajo prototipado                                      | Densidad         | Estado         |
| ---------------- | --------------------------------------- | --------------------------------------------- | ------------------------------------------ | ------------------------------------------------------------------ | ---------------- | -------------- |
| `PROTO-NEXO-001` | solicitante autorizado                  | `NEXO-REQUESTER-HOME-CONTRACT-001`            | `NUEVA SOLICITUD` cuando esté autorizado   | borrador o solicitud propia que requiere continuar                 | `D0_FOCUSED`     | `ESPECIFICADO` |
| `PROTO-NEXO-002` | bodeguero o preparador autorizado       | `NEXO-WAREHOUSE-HOME-CONTRACT-001`            | `CONTINUAR SIGUIENTE TAREA`                | preparación, entrada, ubicación, movimiento, retiro o conteo       | `D1_CONTEXTUAL`  | `ESPECIFICADO` |
| `PROTO-NEXO-003` | conductor o custodio autorizado         | `NEXO-DRIVER-HOME-CONTRACT-001`               | `CONTINUAR SIGUIENTE TAREA`                | custodia, tránsito, entrega, incidencia o retorno asignados        | `D0_FOCUSED`     | `ESPECIFICADO` |
| `PROTO-NEXO-004` | receptor autorizado                     | `NEXO-RECEIVER-HOME-CONTRACT-001`             | `CONTINUAR SIGUIENTE TAREA`                | handoff, verificación, recepción o putaway compatibles             | `D0_FOCUSED`     | `ESPECIFICADO` |
| `PROTO-NEXO-005` | supervisor con cobertura territorial    | `NEXO-SUPERVISOR-HOME-CONTRACT-001`           | `CONTINUAR SIGUIENTE TAREA`                | caso, diferencia, bloqueo, vencimiento o evidencia por revisar     | `D2_COMPARATIVE` | `ESPECIFICADO` |
| `PROTO-NEXO-006` | configurador autorizado                 | `NEXO-TASK-NAVIGATION-CONTRACT-001`           | abrir capacidad administrativa prioritaria | configuración de catálogo, ubicaciones, abastecimiento o impresión | `D2_COMPARATIVE` | `ESPECIFICADO` |
| `PROTO-NEXO-007` | persona con varias funciones            | proyección de una única función activa        | la definida por la función activa          | únicamente trabajo de la función seleccionada y revalidada         | heredada         | `ESPECIFICADO` |
| `PROTO-NEXO-008` | dispositivo compartido con actor activo | proyección compatible con actor y dispositivo | la definida por la función activa          | trabajo atribuible compatible con estación, turno y territorio     | `D0` o `D1`      | `ESPECIFICADO` |

Reconciliación:

```text
EXPECTED_PROTOTYPES = 8
MATERIALIZED_PROTOTYPES = 8
UNIQUE_PROTOTYPE_IDS = 8
MISSING_PROTOTYPES = 0
DUPLICATE_PROTOTYPES = 0
```

---

#### 8. `NEXO-ACTOR-PROTOTYPE-WIREFRAME-SET-001`

Los wireframes usan contenido semántico controlado. Expresiones como “una tarea
asignada” o “una entrega atribuida” representan posiciones de interfaz, no datos
reales ni resultados de ejecución.

##### 8.1. `PROTO-NEXO-001` — Solicitante

```text
┌──────────────────────────────────────────────────────────────┐
│ NEXO · Solicitudes propias                                   │
│ Contexto: función solicitante · sede y área activas          │
├──────────────────────────────────────────────────────────────┤
│ [ NUEVA SOLICITUD ]                                          │
├──────────────────────────────────────────────────────────────┤
│ SIGUIENTE TAREA                                              │
│ Continuar una solicitud propia · estado y siguiente paso     │
│ [ Continuar ]                                                │
├──────────────────────────────────────────────────────────────┤
│ FRECUENTES                         RECIENTES                  │
│ • Solicitar abastecimiento         • Borrador revalidado      │
│ • Gestionar solicitud propia       • Solicitud propia activa  │
├──────────────────────────────────────────────────────────────┤
│ BLOQUEOS Y ACLARACIONES                                     │
│ Mensaje, efecto y acción propia permitida                    │
├──────────────────────────────────────────────────────────────┤
│ TODAS LAS TAREAS                                             │
│ Mi trabajo · Consultar y controlar                           │
└──────────────────────────────────────────────────────────────┘
```

Decisiones:

- no muestra preparación, transporte, recepción, supervisión ni configuración;
- no muestra stock global, costos, solicitudes ajenas ni métricas de desempeño;
- una solicitud propia puede aparecer como siguiente tarea o reciente, no en
  ambas zonas;
- `NEXO-TASK-003` permanece como acción fija cuando crear está autorizado;
- sin trabajo continuable se conserva la acción de nueva solicitud y se presenta
  vacío concluyente, no una cola inventada.

##### 8.2. `PROTO-NEXO-002` — Bodega o preparación

```text
┌──────────────────────────────────────────────────────────────┐
│ NEXO · Trabajo de bodega                                     │
│ Contexto: bodega · sede · área warehouse · jornada activa    │
├──────────────────────────────────────────────────────────────┤
│ SIGUIENTE TAREA                                              │
│ Preparar una solicitud asignada · prioridad autoritativa     │
│ [ CONTINUAR SIGUIENTE TAREA ]                                │
├──────────────────────────────────────────────────────────────┤
│ TAREAS FRECUENTES                                            │
│ Preparar · Registrar entrada · Ubicar · Mover                │
├──────────────────────────────────────────────────────────────┤
│ CONTINUAR TRABAJO RECIENTE                                   │
│ Hasta tres instancias vigentes con última confirmación       │
├──────────────────────────────────────────────────────────────┤
│ BLOQUEOS Y VENCIMIENTOS                                      │
│ faltante, handoff o conteo que requiere acción permitida     │
├──────────────────────────────────────────────────────────────┤
│ TODAS LAS TAREAS                                             │
│ Mi trabajo · Consultar y controlar                           │
├──────────────────────────────────────────────────────────────┤
│ UTILIDADES CONTEXTUALES                                      │
│ Escanear o imprimir solo desde la tarea que lo necesita      │
└──────────────────────────────────────────────────────────────┘
```

Decisiones:

- no muestra conducción, recepción ajena, aprobación, ajustes ni configuración;
- preparación no concede tránsito y conteo no concede ajuste;
- consulta de existencias, movimientos y ubicaciones permanece secundaria;
- escaneo e impresión no aparecen como módulos globales;
- la cola no mezcla trabajo de otras sedes, áreas o actores.

##### 8.3. `PROTO-NEXO-003` — Conductor o custodia

```text
┌──────────────────────────────────────────────────────────────┐
│ NEXO · Transporte asignado                                   │
│ Contexto: conductor · jornada · ruta y vehículo autorizados  │
├──────────────────────────────────────────────────────────────┤
│ SIGUIENTE HITO                                               │
│ Carga bajo custodia · estado, destino y ventana permitidos   │
│ [ CONTINUAR SIGUIENTE TAREA ]                                │
├──────────────────────────────────────────────────────────────┤
│ SECUENCIA DE CUSTODIA                                        │
│ Recoger → aceptar custodia → tránsito → entrega → retorno    │
├──────────────────────────────────────────────────────────────┤
│ BLOQUEOS O INCIDENCIAS                                       │
│ condición material, efecto y recuperación autorizada         │
├──────────────────────────────────────────────────────────────┤
│ REFERENCIAS NECESARIAS                                       │
│ carga, ruta, destino y evidencia mínima                      │
├──────────────────────────────────────────────────────────────┤
│ UTILIDADES CONTEXTUALES                                      │
│ escaneo o impresión vinculados a la carga actual             │
└──────────────────────────────────────────────────────────────┘
```

Decisiones:

- no muestra solicitudes, picking, recepción, ajustes, stock global o
  configuración;
- preparar no acepta custodia y entregar físicamente no ejecuta recepción;
- la acción principal se vincula a una asignación o custodia vigente;
- la interfaz no exige interacción durante conducción o una maniobra insegura;
- sin asignación concluyente muestra vacío válido, no trabajo de otros actores.

##### 8.4. `PROTO-NEXO-004` — Recepción

```text
┌──────────────────────────────────────────────────────────────┐
│ NEXO · Recepción en sede                                     │
│ Contexto: función receptora · sede y área destino            │
├──────────────────────────────────────────────────────────────┤
│ SIGUIENTE TAREA                                              │
│ Entrega atribuida · handoff y estado de custodia             │
│ [ CONTINUAR SIGUIENTE TAREA ]                                │
├──────────────────────────────────────────────────────────────┤
│ VERIFICACIÓN FÍSICA                                          │
│ manifiesto · cantidades · condición · evidencia              │
├──────────────────────────────────────────────────────────────┤
│ RECEPCIONES RECIENTES                                        │
│ hasta tres instancias revalidadas                            │
├──────────────────────────────────────────────────────────────┤
│ DIFERENCIAS Y BLOQUEOS                                       │
│ parcialidad, conflicto o evidencia pendiente                 │
├──────────────────────────────────────────────────────────────┤
│ REFERENCIAS AUTORIZADAS                                      │
│ existencias y ubicación necesarias para la tarea             │
└──────────────────────────────────────────────────────────────┘
```

Decisiones:

- no muestra conducción, preparación, decisión supervisora o configuración;
- arribo no equivale a recepción y recepción parcial no se presenta completa;
- reportar diferencia no la resuelve ni genera un ajuste;
- putaway aparece únicamente cuando la función y el trabajo lo permiten;
- el conductor custodio no puede autoentregarse ni autorecibirse la misma carga.

##### 8.5. `PROTO-NEXO-005` — Supervisión

```text
┌──────────────────────────────────────────────────────────────┐
│ NEXO · Control de operación                                  │
│ Contexto: supervisión · cobertura territorial · periodo      │
├──────────────────────────────────────────────────────────────┤
│ SIGUIENTE CASO                                               │
│ bloqueo, vencimiento o diferencia prioritaria                │
│ [ CONTINUAR SIGUIENTE TAREA ]                                │
├──────────────────────────────────────────────────────────────┤
│ CASOS PRIORITARIOS                 EVIDENCIA                  │
│ • seguridad o custodia             • completa / insuficiente │
│ • diferencia material              • responsable y plazo     │
├──────────────────────────────────────────────────────────────┤
│ CONSULTAR Y CONTROLAR                                       │
│ existencias · movimientos · ubicaciones · activos            │
├──────────────────────────────────────────────────────────────┤
│ BLOQUEOS Y CONFLICTOS                                        │
│ alcance, segregación, versión o evidencia                    │
├──────────────────────────────────────────────────────────────┤
│ ACCIONES AUTORIZADAS                                         │
│ decisión atómica o escalamiento; sin captura física ordinaria│
└──────────────────────────────────────────────────────────────┘
```

Decisiones:

- leer no concede corregir, aprobar o ejecutar;
- la cobertura territorial no se presenta como sede operativa activa;
- un caso muestra hecho, evidencia, responsable, vencimiento y versión;
- cuando existe conflicto de interés se retira la decisión incompatible y se
  ofrece escalamiento;
- no incluye configuración no concedida ni métricas individuales.

##### 8.6. `PROTO-NEXO-006` — Configuración

```text
┌──────────────────────────────────────────────────────────────┐
│ NEXO · Administración                                       │
│ Contexto: capacidad administrativa · cobertura y modo        │
├──────────────────────────────────────────────────────────────┤
│ SIGUIENTE CONFIGURACIÓN                                      │
│ capacidad prioritaria autorizada                             │
│ [ ABRIR TAREA ]                                              │
├──────────────────────────────────────────────────────────────┤
│ FRECUENTES                                                   │
│ productos y unidades · ubicaciones · abastecimiento          │
├──────────────────────────────────────────────────────────────┤
│ ADMINISTRAR                                                  │
│ activos · referencias internas · impresión                   │
├──────────────────────────────────────────────────────────────┤
│ IMPACTO Y DEPENDENCIAS                                       │
│ alcance, versión, consumidores y cambios pendientes          │
├──────────────────────────────────────────────────────────────┤
│ REFERENCIAS                                                  │
│ datos operativos mínimos para evaluar el efecto              │
└──────────────────────────────────────────────────────────────┘
```

Decisiones:

- no muestra colas físicas, solicitudes concretas, recepción, conducción ni
  mutaciones operativas;
- una capacidad administrativa exacta no equivale a acceso global;
- cobertura y filtros no cambian jornada ni contexto operativo;
- las opciones secundarias no compiten con la capacidad prioritaria;
- acciones sensibles y cambios masivos permanecen fuera del flujo ordinario y
  requieren sus contratos propietarios.

##### 8.7. `PROTO-NEXO-007` — Persona multifunción

```text
┌──────────────────────────────────────────────────────────────┐
│ NEXO · Función activa: Bodega                                │
│ Otras funciones autorizadas: disponibles mediante cambio     │
├──────────────────────────────────────────────────────────────┤
│ [ CONTINUAR SIGUIENTE TAREA DE BODEGA ]                      │
├──────────────────────────────────────────────────────────────┤
│ Proyección completa y exclusiva de bodega                    │
├──────────────────────────────────────────────────────────────┤
│ CAMBIAR FUNCIÓN                                              │
│ Seleccionar función → explicar efecto → confirmar            │
│ → retirar datos anteriores → resolver nueva proyección       │
└──────────────────────────────────────────────────────────────┘
```

Decisiones:

- el ejemplo usa bodega únicamente para representar una función activa; no
  concede esa función;
- no fusiona listas, frecuentes, recientes, bloqueos ni datos de varias
  funciones;
- cambiar de función elimina la proyección, caché y continuaciones incompatibles;
- una persona no puede autoaprobar, autopreparar, autotransportar o autorecibir
  cuando el contrato exige separación;
- el selector muestra solo funciones vigentes y autorizadas.

##### 8.8. `PROTO-NEXO-008` — Dispositivo compartido con actor activo

```text
┌──────────────────────────────────────────────────────────────┐
│ NEXO · Estación compartida                                   │
│ Dispositivo y territorio · Actor humano y jornada vigentes   │
├──────────────────────────────────────────────────────────────┤
│ SIGUIENTE TAREA COMPATIBLE                                   │
│ trabajo atribuible al actor y admitido por la estación       │
│ [ CONTINUAR ]                                                │
├──────────────────────────────────────────────────────────────┤
│ PROYECCIÓN DE LA FUNCIÓN ACTIVA                              │
│ información minimizada · objetivos táctiles · una acción     │
├──────────────────────────────────────────────────────────────┤
│ UTILIDADES DE ESTACIÓN                                       │
│ escáner o impresora solo cuando la tarea lo exige            │
├──────────────────────────────────────────────────────────────┤
│ [ CAMBIAR ACTOR ]  [ CERRAR ACTOR ]                          │
└──────────────────────────────────────────────────────────────┘
```

Decisiones:

- el dispositivo limita aplicaciones y capacidades máximas, pero no aporta rol,
  permiso, turno, territorio ni identidad humana;
- sin actor humano se retiran trabajo atribuible, datos sensibles y mutaciones;
- cambiar actor limpia tareas, recientes, búsquedas, borradores y referencias
  privadas del actor anterior;
- administración permanece fuera de la estación ordinaria;
- una cuenta técnica no aparece como trabajador ni aprobador.

---

#### 9. `NEXO-PROTOTYPE-TASK-TRACEABILITY-REGISTER-001`

Cada identidad conserva su etiqueta, familia y disposición aprobadas. La
columna de tratamiento describe su representación dentro de los ocho
prototipos, no cambia su autorización ni crea un binding físico.

| Tarea           | Etiqueta humana                   | Disposición heredada         | Prototipo o contexto principal               | Tratamiento prototipado                                                                   | Estado         |
| --------------- | --------------------------------- | ---------------------------- | -------------------------------------------- | ----------------------------------------------------------------------------------------- | -------------- |
| `NEXO-TASK-001` | Ir al inicio                      | `HOME_ONLY`                  | todos                                        | identidad de retorno y resolución; no se repite como opción dentro de `/`                 | `ESPECIFICADO` |
| `NEXO-TASK-002` | Gestionar abastecimiento interno  | `PRIMARY_RESOLVED_CANDIDATE` | solicitante, bodega, conductor y receptor    | siguiente tarea o continuación según etapa propia; nunca acceso genérico duplicado        | `ESPECIFICADO` |
| `NEXO-TASK-003` | Solicitar abastecimiento          | `PRIMARY_FIXED`              | solicitante                                  | acción primaria cuando crear o continuar solicitud propia está autorizado                 | `ESPECIFICADO` |
| `NEXO-TASK-004` | Preparar abastecimiento           | `PRIMARY_RESOLVED_CANDIDATE` | bodega                                       | siguiente tarea, frecuente o reciente según instancia; excluida de otras funciones        | `ESPECIFICADO` |
| `NEXO-TASK-005` | Transportar abastecimiento        | `PRIMARY_RESOLVED_CANDIDATE` | conductor                                    | siguiente tarea vinculada a asignación o custodia; no aparece sin relación vigente        | `ESPECIFICADO` |
| `NEXO-TASK-006` | Recibir abastecimiento            | `PRIMARY_RESOLVED_CANDIDATE` | receptor                                     | siguiente tarea vinculada a destino y handoff; no concede decisión supervisora            | `ESPECIFICADO` |
| `NEXO-TASK-007` | Registrar una entrada             | `PRIMARY_RESOLVED_CANDIDATE` | bodega o receptor autorizado                 | siguiente o frecuente solo con fuente empresarial o excepción autorizada                  | `ESPECIFICADO` |
| `NEXO-TASK-008` | Ubicar existencias                | `PRIMARY_RESOLVED_CANDIDATE` | bodega o receptor autorizado                 | siguiente tarea cuando existe putaway atribuible; no expone configuración de ubicaciones  | `ESPECIFICADO` |
| `NEXO-TASK-009` | Mover existencias                 | `PRIMARY_RESOLVED_CANDIDATE` | bodega                                       | frecuente o siguiente según traslado autorizado; no sustituye remisión entre sedes        | `ESPECIFICADO` |
| `NEXO-TASK-010` | Registrar un retiro               | `PRIMARY_RESOLVED_CANDIDATE` | bodega                                       | frecuente o siguiente con origen, unidad y motivo autorizados                             | `ESPECIFICADO` |
| `NEXO-TASK-011` | Contar inventario                 | `PRIMARY_RESOLVED_CANDIDATE` | bodega para captura; supervisor para control | la variante cambia por función y etapa; capturar nunca concede ajustar                    | `ESPECIFICADO` |
| `NEXO-TASK-012` | Controlar la operación            | `PRIMARY_RESOLVED_CANDIDATE` | supervisor                                   | acción o siguiente caso según responsabilidad, riesgo, vencimiento y cobertura            | `ESPECIFICADO` |
| `NEXO-TASK-013` | Consultar existencias             | `FREQUENT_CANDIDATE`         | solicitante, bodega, receptor o supervisor   | frecuente cuando corresponde; de otro modo permanece en consultar y controlar             | `ESPECIFICADO` |
| `NEXO-TASK-014` | Investigar movimientos            | `FREQUENT_CANDIDATE`         | bodega o supervisor autorizado               | frecuente o secundaria; conserva solo lectura e investigación                             | `ESPECIFICADO` |
| `NEXO-TASK-015` | Consultar ubicaciones             | `FREQUENT_CANDIDATE`         | bodega, receptor o supervisor autorizado     | frecuente o referencia contextual; no expone edición de estructura                        | `ESPECIFICADO` |
| `NEXO-TASK-016` | Consultar contenedores logísticos | `SECONDARY_DISCOVERABLE`     | supervisor o función compatible              | permanece en familia secundaria; no se promueve por existencia de una ruta                | `ESPECIFICADO` |
| `NEXO-TASK-017` | Gestionar activos                 | `FREQUENT_CANDIDATE`         | supervisor o función de activos compatible   | frecuente únicamente con trabajo, permiso y territorio de activos                         | `ESPECIFICADO` |
| `NEXO-TASK-018` | Capturar activos                  | `PRIMARY_RESOLVED_CANDIDATE` | función de campo compatible                  | se representa solo cuando esa función sea la activa; queda fuera de remisiones ordinarias | `ESPECIFICADO` |
| `NEXO-TASK-019` | Contar activos                    | `PRIMARY_RESOLVED_CANDIDATE` | función de activos compatible                | siguiente tarea con sesión y etapa válidas; no se mezcla con conteo de inventario         | `ESPECIFICADO` |
| `NEXO-TASK-020` | Configurar activos                | `SECONDARY_DISCOVERABLE`     | configuración                                | familia administrativa secundaria; nunca aparece en proyección operativa                  | `ESPECIFICADO` |
| `NEXO-TASK-021` | Administrar NEXO                  | `PRIMARY_RESOLVED_CANDIDATE` | configuración                                | resuelve una capacidad administrativa prioritaria sin crear acceso global                 | `ESPECIFICADO` |
| `NEXO-TASK-022` | Administrar productos y unidades  | `FREQUENT_CANDIDATE`         | configuración                                | frecuente administrativa con capacidad exacta y recurrencia válida                        | `ESPECIFICADO` |
| `NEXO-TASK-023` | Administrar ubicaciones           | `FREQUENT_CANDIDATE`         | configuración                                | frecuente administrativa; no se confunde con ubicar existencias                           | `ESPECIFICADO` |
| `NEXO-TASK-024` | Configurar abastecimiento         | `FREQUENT_CANDIDATE`         | configuración                                | frecuente administrativa; no expone solicitudes concretas salvo referencia necesaria      | `ESPECIFICADO` |
| `NEXO-TASK-025` | Configurar referencias internas   | `SECONDARY_DISCOVERABLE`     | configuración                                | familia administrativa secundaria; no se promueve por actividad operativa                 | `ESPECIFICADO` |
| `NEXO-TASK-026` | Controlar impresión               | `PRIMARY_RESOLVED_CANDIDATE` | supervisor o soporte autorizado              | siguiente tarea solo con trabajos bloqueados, fallidos o pendientes dentro de cobertura   | `ESPECIFICADO` |
| `NEXO-TASK-027` | Configurar impresión              | `SECONDARY_DISCOVERABLE`     | configuración                                | familia administrativa secundaria; permanece fuera del flujo operativo                    | `ESPECIFICADO` |
| `NEXO-TASK-028` | Resolver un destino contextual    | `CONTEXTUAL_ONLY`            | tarea invocante compatible                   | utilidad interna de escaneo, código, ubicación o kiosco; retorna a la tarea               | `ESPECIFICADO` |
| `NEXO-TASK-029` | Resolver acceso                   | `CONTEXTUAL_ONLY`            | autenticación o denegación segura            | permanece fuera de navegación empresarial y no se clasifica como frecuente                | `ESPECIFICADO` |

Reconciliación de disposiciones:

| Disposición                  | Esperado | Materializado | Diferencia |
| ---------------------------- | -------: | ------------: | ---------: |
| `HOME_ONLY`                  |        1 |             1 |          0 |
| `PRIMARY_FIXED`              |        1 |             1 |          0 |
| `PRIMARY_RESOLVED_CANDIDATE` |       14 |            14 |          0 |
| `FREQUENT_CANDIDATE`         |        7 |             7 |          0 |
| `SECONDARY_DISCOVERABLE`     |        4 |             4 |          0 |
| `CONTEXTUAL_ONLY`            |        2 |             2 |          0 |
| **Total**                    |   **29** |        **29** |      **0** |

---

#### 10. `NEXO-ACTOR-PROTOTYPE-STATE-MATRIX-001`

| Estado                           | Condición prototipada                                                             | Representación materializada                                     | Acción disponible                            |
| -------------------------------- | --------------------------------------------------------------------------------- | ---------------------------------------------------------------- | -------------------------------------------- |
| `RESOLVIENDO_RELEVANCIA`         | actor, función o conjunto autorizado todavía no son concluyentes                  | contexto mínimo, estructura estable y cero datos empresariales   | esperar o cancelar resolución                |
| `OPCIONES_LISTAS`                | decisión completa con tareas relevantes                                           | ocho zonas ordenadas, sin duplicados y con contexto visible      | acciones incluidas en respuesta autoritativa |
| `ACCION_PRIMARIA_AUSENTE`        | proyección válida sin comando principal autorizado                                | contexto, siguiente trabajo o familias sin fabricar un CTA       | navegación secundaria autorizada             |
| `VACIO_VALIDO`                   | decisión concluyente sin trabajo ni tarea iniciable relevante                     | mensaje de ausencia real y salida segura                         | cambiar contexto autorizado o salir          |
| `SOLO_DESCUBRIMIENTO_SECUNDARIO` | no hay trabajo destacado, pero permanecen tareas autorizadas                      | familias secundarias sin promover opciones artificialmente       | abrir tarea secundaria autorizada            |
| `DATOS_PARCIALES`                | una fuente perdió frescura o falló                                                | último dato confirmado, región afectada y advertencia explícita  | lectura segura y reintento                   |
| `CONTEXTO_CAMBIADO_O_REVOCADO`   | actor, función, jornada, territorio, dispositivo o permiso dejaron de ser válidos | retiro inmediato de datos y acciones previos                     | resolver nuevamente el contexto              |
| `OPCION_CAMBIADA_O_RETIRADA`     | tarea o instancia dejó de ser relevante antes de abrir o continuar                | explicación breve, control retirado y conjunto recalculado       | volver a la proyección vigente               |
| `ACCESO_DIRECTO_DENEGADO`        | una tarea o ruta explícita no supera revalidación                                 | estado estándar minimizado sin revelar opciones de otros actores | recuperación segura derivada del perfil      |
| `FALLO_TECNICO`                  | no existe decisión estable por indisponibilidad o error                           | mensaje recuperable separado de vacío, denegación y revocación   | reintentar cuando sea seguro                 |

Cobertura por prototipo:

| Prototipo        | Listo | Vacío | Parcial | Revocado | Retirado | Denegado | Fallo | Sin acción | Solo secundario | Resolviendo |
| ---------------- | :---: | :---: | :-----: | :------: | :------: | :------: | :---: | :--------: | :-------------: | :---------: |
| `PROTO-NEXO-001` |   ✓   |   ✓   |    ✓    |    ✓     |    ✓     |    ✓     |   ✓   |     ✓      |        ✓        |      ✓      |
| `PROTO-NEXO-002` |   ✓   |   ✓   |    ✓    |    ✓     |    ✓     |    ✓     |   ✓   |     ✓      |        ✓        |      ✓      |
| `PROTO-NEXO-003` |   ✓   |   ✓   |    ✓    |    ✓     |    ✓     |    ✓     |   ✓   |     ✓      |        ✓        |      ✓      |
| `PROTO-NEXO-004` |   ✓   |   ✓   |    ✓    |    ✓     |    ✓     |    ✓     |   ✓   |     ✓      |        ✓        |      ✓      |
| `PROTO-NEXO-005` |   ✓   |   ✓   |    ✓    |    ✓     |    ✓     |    ✓     |   ✓   |     ✓      |        ✓        |      ✓      |
| `PROTO-NEXO-006` |   ✓   |   ✓   |    ✓    |    ✓     |    ✓     |    ✓     |   ✓   |     ✓      |        ✓        |      ✓      |
| `PROTO-NEXO-007` |   ✓   |   ✓   |    ✓    |    ✓     |    ✓     |    ✓     |   ✓   |     ✓      |        ✓        |      ✓      |
| `PROTO-NEXO-008` |   ✓   |   ✓   |    ✓    |    ✓     |    ✓     |    ✓     |   ✓   |     ✓      |        ✓        |      ✓      |

Los símbolos anteriores documentan cobertura del prototipo, no ejecución ni
resultado de una prueba.

---

#### 11. `NEXO-ACTOR-PROTOTYPE-RESPONSIVE-INTERACTION-CONTRACT-001`

##### 11.1. Móvil

- una columna;
- contexto compacto, acción primaria y siguiente tarea antes del primer
  desplazamiento largo;
- frecuentes como lista vertical, máximo cuatro;
- recientes como lista vertical, máximo tres;
- familias secundarias colapsables con nombre y estado;
- sin tablas horizontales, hover, gestos ocultos ni controles solo por icono;
- barras persistentes no cubren contenido, teclado, error ni confirmación;
- el cambio de función o actor exige confirmación y nueva resolución.

##### 11.2. Tablet

- contexto, siguiente tarea y primer bloqueo visibles en la primera región;
- una o dos columnas según función, nunca tablero supervisor para operación;
- objetivos táctiles de al menos 48 por 48 unidades lógicas;
- espacio suficiente entre confirmar, cancelar, excepción y cambio de actor;
- escaneo e impresión aparecen dentro de la tarea compatible;
- rotación y teclado conservan borrador, foco y acción;
- el prototipo de conductor no se usa durante conducción o maniobra insegura.

##### 11.3. Escritorio

- máximo dos columnas para operación;
- supervisión y configuración pueden usar densidad comparativa sin mostrar todo;
- la acción primaria y el siguiente trabajo conservan mayor jerarquía;
- el sidebar futuro consume la proyección reducida, no todas las rutas permitidas;
- filtros activos de supervisión o configuración permanecen visibles;
- más espacio no aumenta frecuentes, recientes ni familias de primer nivel.

##### 11.4. Estación compartida

- actor humano, función y contexto permanecen visibles;
- cambiar actor retira datos, tareas, borradores y referencias previas;
- ninguna información personal depende únicamente del menú de perfil;
- objetivos amplios, lenguaje breve y periféricos contextuales;
- sin exportaciones locales, backoffice general, opciones administrativas persistentes o
  preferencias del actor anterior;
- ausencia de actor produce proyección mínima, no una falsa denegación personal.

##### 11.5. Foco, teclado y lector de pantalla

Orden de foco:

1. contexto activo y detalle;
2. acción primaria;
3. siguiente tarea;
4. tareas frecuentes;
5. continuaciones recientes;
6. bloqueos y recuperación;
7. familias secundarias;
8. utilidades y cambio de contexto.

Reglas:

- todo control tiene nombre, rol, estado y propósito perceptibles;
- expandir una familia relaciona control y región y conserva el foco;
- retirar una opción mueve el foco al conjunto recalculado y anuncia el cambio;
- una revocación crítica lleva el foco al mensaje y elimina acciones obsoletas;
- estado, severidad y prioridad no dependen solo del color;
- una alternativa de teclado y puntero simple existe para cualquier gesto;
- los wireframes no acreditan contraste, lector, navegación ni tacto reales;
  esas evidencias pertenecen a las tareas de validación posteriores.

---

#### 12. Comparación con el estado técnico actual

| Elemento                                       | Estado actual verificable                                              | Objetivo representado por el prototipo                                               | Condición de salida                                 |
| ---------------------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------ | --------------------------------------------------- |
| superficie inicial `/`                         | existe y usa reglas locales por rol, tipo de sede, permisos y acciones | una proyección por actor efectivo, función, tarea, contexto y prioridad autoritativa | paquete de implementación NEXO                      |
| acción principal                               | se construye desde listas locales y condiciones de sede                | una acción del contrato de proyección activa                                         | paquete de implementación NEXO                      |
| navegación lateral                             | carga elementos activos y filtra permisos                              | consume tareas relevantes, deduplicadas y ordenadas                                  | paquete de implementación NEXO                      |
| agrupación del sidebar                         | renderiza todos los grupos y elementos recibidos                       | cinco niveles visibles y una clase fuera de proyección                               | paquete de implementación NEXO                      |
| identidad de tarea                             | no forma parte del contrato físico observado                           | `task_id` estable separado de URL y componente                                       | paquete de implementación NEXO                      |
| frecuencia y recientes                         | no existe evidencia aprobada de resolución autoritativa                | posiciones y estados prototipados sin afirmar instrumentación                        | paquete de implementación NEXO                      |
| prototipos por contexto                        | no existe implementación física equivalente                            | ocho variantes documentales completas                                                | `AUTH-UI-056` para revisión previa a implementación |
| validación con usuarios                        | no ejecutada                                                           | no declarada                                                                         | `AUTH-UI-058`                                       |
| criterios, problemas y aprobación de pantallas | pendientes                                                             | destinos conservados                                                                 | `AUTH-UI-057`, `AUTH-UI-059` y `AUTH-UI-060`        |

La tarea no transforma este diagnóstico en implementación. El prototipo define
el objetivo que deberá revisarse antes de autorizar cambios físicos.

---

#### 13. Seguridad, privacidad y minimización

1. El prototipo representa datos ya filtrados por servidor.
2. No incluye catálogos globales ocultos en cliente.
3. Ninguna variante se selecciona mediante un rol, sede o modo enviado por URL.
4. Cada acción futura revalida actor, función, permiso, territorio, recurso,
   etapa, estado y versión.
5. La variante solicitante muestra solo trabajo propio o participación propia.
6. Bodega, conductor y receptor muestran únicamente trabajo atribuible.
7. Supervisión aplica cobertura, segregación, evidencia y conflicto de interés.
8. Configuración aplica capacidad administrativa exacta y minimización.
9. Dispositivo compartido conserva principal técnico separado del actor humano.
10. Cambiar actor, función o contexto elimina proyección, caché y referencias
    incompatibles.
11. Mensajes no exponen permission codes, reason codes internos, SQL, tablas,
    payloads, trazas, actores elegibles ni recursos fuera de alcance.
12. Conteos, badges y vacíos usan el mismo alcance o uno más restrictivo que el
    detalle.
13. Frecuencia y recientes no se presentan como productividad, ranking o
    evaluación individual.
14. La simulación, cuando sea admisible, permanece diferenciada y sin efectos.
15. Acceso directo no reintroduce una opción excluida ni concede autoridad.

---

#### 14. Criterios de aceptación

La tarea se considera documentalmente completa cuando se confirme que:

- existe una sola superficie propietaria, `NEXO-ROUTE-001` — `/`;
- se materializan ocho prototipos únicos, sin faltantes ni duplicados;
- las seis proyecciones principales y dos composiciones especiales conservan
  sus contratos propietarios;
- cada prototipo muestra contexto, acción primaria, siguiente tarea, frecuentes,
  recientes, bloqueos, familias y utilidades según aplicabilidad;
- la acción primaria es única y no se duplica con la siguiente tarea;
- frecuentes no superan cuatro y recientes no superan tres;
- las veintinueve tareas tienen una decisión explícita de representación;
- la distribución heredada `1 / 1 / 14 / 7 / 4 / 2` suma veintinueve y no cambia;
- solicitante no recibe controles de preparación, transporte, recepción,
  supervisión o configuración;
- bodega no recibe conducción, aprobación, ajuste ni configuración;
- conductor conserva asignación y custodia sin auto-recepción;
- receptor conserva handoff, verificación y parcialidad sin auto-resolución;
- supervisor distingue observación, investigación, decisión, efecto y cierre;
- configuración no ejecuta trabajo físico;
- multifunción conserva una sola función activa;
- dispositivo compartido exige actor humano antes de trabajo atribuible;
- resolutores, acceso, escaneo, impresión, códigos y kioscos permanecen
  contextuales;
- los diez estados tienen representación y recuperación diferenciadas;
- vacío, parcialidad, denegación, revocación y fallo técnico no se confunden;
- móvil, tablet, escritorio y estación compartida conservan autoridad y orden;
- objetivos táctiles, foco, teclado, lector y anuncios tienen reglas explícitas;
- el prototipo no inventa resultados de uso, métricas, datos ni evidencia;
- el estado técnico actual se declara parcial y la implementación conserva un
  propietario explícito;
- no se crean rutas, roles, funciones, procesos, permisos ni requisitos nuevos;
- `AUTH-UI-056` permanece únicamente reservada.

---

#### 15. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea no introduce una regla autorizativa, operativa, de
navegación, accesibilidad, tacto, privacidad, estado o seguridad nueva.
Materializa visualmente, en ocho prototipos documentales, los contratos y
requisitos vigentes de página inicial, tareas frecuentes, reducción,
relevancia, contexto, divulgación, densidad, dispositivo compartido y
accesibilidad. No modifica, difiere, descarta ni declara obsoleto ningún
requisito histórico; por tanto, el Registro Canónico de Requisitos de Prueba no
cambia.

---

#### 16. `NEXO-ACTOR-PROTOTYPE-HANDOFF-001`

| Destino                        | Handoff aprobado                                                                                                                                                 |
| ------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `AUTH-UI-056`                  | revisar la integridad del prototipo, sus ocho variantes, estados, trazabilidad y coherencia antes de cualquier implementación; no equivale a prueba con usuarios |
| `AUTH-UI-057`                  | definir criterios medibles de localización, comprensión, carga cognitiva, recuperación, tacto, accesibilidad y seguridad por pantalla                            |
| `AUTH-UI-058`                  | probar con usuarios reales y dispositivos representativos las ocho variantes y escenarios aprobados                                                              |
| `AUTH-UI-059`                  | registrar problemas observados con severidad, contexto, evidencia, propietario y condición de cierre                                                             |
| `AUTH-UI-060`                  | aprobar cada pantalla únicamente cuando exista evidencia y se satisfagan los criterios vigentes                                                                  |
| paquete de implementación NEXO | implementar resolutor, bindings, consultas, componentes, estados, caché, eventos, pruebas y telemetría cuando la continuidad lo autorice                         |

Ningún destino anterior se inicia mediante esta tarea.

---

#### 17. Continuidad canónica

**ÚLTIMA TAREA APROBADA**

`AUTH-UI-054 — Reducir opciones irrelevantes`

**TAREA ACTUAL APROBADA**

`AUTH-UI-055 — Crear prototipo por rol`

**SIGUIENTE TAREA RESERVADA**

`AUTH-UI-056 — Validar prototipo antes de implementar`


### [ ] AUTH-UI-056 — Validar prototipo antes de implementar
### [ ] AUTH-UI-057 — Definir criterio de usabilidad por pantalla
### [ ] AUTH-UI-058 — Probar con usuarios reales
### [ ] AUTH-UI-059 — Registrar problemas encontrados
### [ ] AUTH-UI-060 — Aprobar la pantalla antes de retirarla del roadmap
