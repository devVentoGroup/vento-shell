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


### [ ] AUTH-UI-054 — Reducir opciones irrelevantes
### [ ] AUTH-UI-055 — Crear prototipo por rol
### [ ] AUTH-UI-056 — Validar prototipo antes de implementar
### [ ] AUTH-UI-057 — Definir criterio de usabilidad por pantalla
### [ ] AUTH-UI-058 — Probar con usuarios reales
### [ ] AUTH-UI-059 — Registrar problemas encontrados
### [ ] AUTH-UI-060 — Aprobar la pantalla antes de retirarla del roadmap
