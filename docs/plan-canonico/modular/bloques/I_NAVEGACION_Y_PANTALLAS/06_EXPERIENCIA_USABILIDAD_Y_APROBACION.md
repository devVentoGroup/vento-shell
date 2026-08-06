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


### [ ] AUTH-UI-053 — Diseñar navegación según tareas frecuentes
### [ ] AUTH-UI-054 — Reducir opciones irrelevantes
### [ ] AUTH-UI-055 — Crear prototipo por rol
### [ ] AUTH-UI-056 — Validar prototipo antes de implementar
### [ ] AUTH-UI-057 — Definir criterio de usabilidad por pantalla
### [ ] AUTH-UI-058 — Probar con usuarios reales
### [ ] AUTH-UI-059 — Registrar problemas encontrados
### [ ] AUTH-UI-060 — Aprobar la pantalla antes de retirarla del roadmap
