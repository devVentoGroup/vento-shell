### MINI-BLOQUE — ACTOR TAREA NAVEGACIÓN Y CONTEXTO

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **actor tarea navegación y contexto** dentro de **E2 PROCESOS Y EXPERIENCIA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `UX-BASE-001` a `UX-BASE-005` — 5 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `UX-BASE-001`: Separar experiencia operativa y administrativa
- `UX-BASE-002`: Mostrar primero la tarea actual del trabajador
- `UX-BASE-003`: Evitar navegación basada en nombres técnicos
- `UX-BASE-004`: Ocultar funciones irrelevantes para el actor
- `UX-BASE-005`: Mantener visible sede, área, turno y rol activos
<!-- PLAN-SECTION-META:END -->

### ✅ UX-BASE-001 — Separar experiencia operativa y administrativa

**Estado:** APROBADA 
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `CAP-TAL-006 — Diseñar período de prueba, permisos provisionales, continuidad definitiva y cierre` — APROBADA  
**Siguiente tarea reservada:** `UX-BASE-002 — Mostrar primero la tarea actual del trabajador`  
**Artefacto producido:** `UX-EXPERIENCE-LANES-CONTRACT-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069` y procesos futuros que ingresen al catálogo canónico  
**Aplicaciones cubiertas:** SHELL, VISO, ANIMA, NEXO, FOGO, ORIGO, PULSO, NUMERA, PASS, TALENTO, AURA y cualquier aplicación futura de Vento OS  
**Naturaleza:** principio transversal de arquitectura de experiencia, clasificación de superficies, composición, autorización, contexto, dispositivos, handoffs y migración UX  
**Cambios en código, rutas, componentes, datos, migraciones, RLS, RPC, Supabase, permisos, navegación o aplicaciones:** no autorizados

---

#### 1. Propósito

Definir una frontera canónica y verificable entre la experiencia destinada a
**ejecutar trabajo real** y la experiencia destinada a **planificar, gobernar,
configurar, aprobar, conciliar o analizar** ese trabajo.

La tarea deberá impedir que Vento OS continúe resolviendo ambos planos mediante
pantallas híbridas donde:

- la acción ordinaria compite con configuración, reportes o excepciones;
- un trabajador debe navegar tablas, filtros o formularios administrativos para
  realizar una tarea frecuente;
- un gerente registra como propio un hecho físico ejecutado por otra persona;
- una vista operacional contiene botones de aprobación, ajuste, configuración o
  cambio de maestro sin separación suficiente;
- una vista administrativa permite fabricar retrospectivamente producción,
  conteos, recepciones, entregas, asistencia o servicio;
- el nombre de una aplicación determina equivocadamente la naturaleza de todas
  sus pantallas;
- el nombre del rol determina qué interfaz se muestra sin resolver tarea,
  contexto, permiso, dispositivo y etapa;
- un dispositivo compartido abre administración sensible porque posee una sesión
  técnica válida;
- una selección global de sede se interpreta como sede operativa activa;
- cambiar de modo conserva autoridad, filtros, actor o contexto obsoletos;
- la densidad administrativa invade estaciones táctiles y flujos de campo;
- la simplificación operativa elimina controles de seguridad, evidencia o
  autorización;
- la riqueza administrativa se usa como excusa para exponer información no
  necesaria;
- una superficie de supervisión se confunde con administración total;
- una pantalla personal, de cliente o de candidato se mezcla con backoffice;
- rutas legacy permanecen disponibles porque todavía “funcionan”, aunque violen
  la separación aprobada.

Esta tarea crea el contrato transversal. No diseña todavía cada pantalla ni
reclasifica físicamente todas las rutas actuales.

---

#### 2. Por qué esta es la continuidad lógica

El orden canónico de E2 exige:

```text
PROCESOS Y ACTORES
        ↓
CAPACIDADES TRANSVERSALES
        ↓
TALENTO Y VINCULACIÓN
        ↓
PRINCIPIOS DE EXPERIENCIA
        ↓
REQUISITOS NO FUNCIONALES
        ↓
ESTACIONES, PROTOTIPOS Y PANTALLAS
```

La separación debe definirse antes de:

- decidir qué tarea aparece primero;
- diseñar navegación;
- ocultar opciones irrelevantes;
- definir densidad;
- diseñar estaciones físicas;
- clasificar rutas reales;
- prototipar por rol;
- rediseñar NEXO, FOGO, ORIGO, PULSO, VISO, NUMERA o ANIMA.

Diseñar pantallas antes de fijar esta frontera produciría una repetición del
problema actual: formularios y controles administrativos insertados dentro de
la ejecución diaria, o acciones operativas ejecutadas desde backoffice sin actor
y evidencia propios.

---

#### 3. Resultado esperado

Al aprobar esta tarea deberá quedar definido:

1. qué significa experiencia operativa;
2. qué significa experiencia administrativa;
3. por qué la clasificación pertenece a la acción, etapa y superficie;
4. por qué una aplicación, un rol o un dispositivo no determinan por sí solos el
   carril;
5. cómo se tratan procesos híbridos;
6. cómo se diferencian supervisión, configuración, auditoría y experiencia
   personal o de cliente;
7. qué contexto debe mostrar cada carril;
8. qué densidad, navegación y composición corresponden a cada uno;
9. cómo se cambia de un carril a otro;
10. qué ocurre con tareas pendientes, borradores, filtros y contexto al cambiar;
11. cómo se aplican permisos y protección de servidor;
12. qué restricciones tienen tablets, kioscos y dispositivos compartidos;
13. cómo se minimizan datos y campos sensibles;
14. cómo se manejan excepciones y overrides;
15. cómo se preserva propiedad de datos entre aplicaciones;
16. cómo se instrumentan eventos, métricas y pruebas;
17. cómo se auditan y migran superficies legacy;
18. qué decisiones quedan asignadas a tareas posteriores;
19. qué requisitos `TREQ-*` protegen el contrato;
20. cuál es la continuidad inmediata.

---

#### 4. Dependencias y decisiones preservadas

Esta propuesta consume y no reemplaza:

- `ADR-AUTH-001 — ACCEPTED`;
- `AUTH-MOD-001` a `AUTH-MOD-021`;
- `AUTH-CAT-001` a `AUTH-CAT-024`;
- `AUTH-RBAC-001` a `AUTH-RBAC-028`;
- `AUTH-CTX-001` a `AUTH-CTX-030`;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-STATION-001` y el inventario físico aprobado;
- `OPS-CAN-001`, `OPS-LOG-001` y `OPS-B2B-001`;
- `CAP-TAL-001` a `CAP-TAL-006`;
- los 112 permisos canónicos y sus clasificaciones;
- las matrices de roles base, roles operativos, dispositivos y excepciones;
- el contrato `AccessContext@1.0.0` y sus decisiones de principal, identidad,
  actor efectivo, sede, área, turno, check-in, rol operativo, dispositivo,
  recurso y territorio;
- la propiedad canónica de procesos y datos por aplicación;
- la prohibición de inferir autorización desde nombres de rol, rutas,
  componentes, frontend o `service_role`.

Decisiones preservadas:

1. un proceso puede contener etapas personales, administrativas y operativas;
2. la autorización se resuelve nuevamente por acción y etapa;
3. supervisar no equivale a aprobar ni ejecutar;
4. administrar no equivale a registrar un hecho físico;
5. operar no equivale a aprobar, conciliar o configurar;
6. VISO puede presentar vistas administrativas sin adquirir propiedad universal
   sobre los datos de otras aplicaciones;
7. una aplicación operativa puede contener superficies administrativas
   separadas;
8. un rol base puede participar en una acción operativa si cumple el contrato
   operativo exacto;
9. un rol operativo no obtiene administración por estar dentro de una app;
10. un dispositivo compartido conserva principal técnico separado del actor
    humano;
11. la interfaz nunca sustituye controles de servidor;
12. los procesos híbridos conservan una sola identidad `VPROC-*` y handoffs
    explícitos.

---

#### 5. Principio rector

```text
EJECUTAR EL TRABAJO
→ CARRIL OPERATIVO

PLANIFICAR, GOBERNAR, APROBAR, CONFIGURAR O CONCILIAR
→ CARRIL ADMINISTRATIVO

OBSERVAR Y COORDINAR SIN ADQUIRIR AUTORIDAD UNIVERSAL
→ CARRIL DE SUPERVISIÓN

MANTENER MAESTROS, POLÍTICAS O PARÁMETROS
→ CARRIL DE CONFIGURACIÓN

RECONSTRUIR, INVESTIGAR O VERIFICAR HISTORIA
→ CARRIL DE AUDITORÍA

ACTUAR SOBRE EL PROPIO CASO O RELACIÓN
→ CARRIL PERSONAL / CLIENTE / CANDIDATO
```

Regla canónica:

```text
LA CLASIFICACIÓN PERTENECE A LA ACCIÓN Y A LA SUPERFICIE

NO PERTENECE AUTOMÁTICAMENTE
→ A LA APLICACIÓN
→ AL NOMBRE DEL ROL
→ AL TIPO DE DISPOSITIVO
→ A LA RUTA
→ AL COMPONENTE
→ AL NIVEL JERÁRQUICO
```

---

#### 6. Unidad de clasificación

La unidad mínima será la combinación:

```text
PROCESS_ID
+
PROCESS_STAGE
+
PRIMARY_INTENT
+
ACTION
+
BUSINESS_EFFECT
+
ACTOR CONTRACT
+
SURFACE
```

No bastará clasificar una aplicación completa.

Ejemplos:

```text
NEXO
≠ OPERATIVO EN TODAS SUS RUTAS

VISO
≠ ADMINISTRATIVO EN TODAS SUS RUTAS

ANIMA
≠ PERSONAL EN TODAS SUS ACCIONES
```

Una ruta podrá contener varias superficies, pero cada superficie deberá tener una
intención principal inequívoca. Cuando dos intenciones materiales compitan, se
deberán separar mediante:

- otra ruta;
- otro panel claramente delimitado;
- un modal o workflow independiente;
- un handoff a la aplicación propietaria;
- una acción excepcional fuera del flujo ordinario.

No se permitirá solucionar la mezcla únicamente mediante colores, acordeones o
permisos ocultos.

---

#### 7. Taxonomía canónica de experiencia

| Código conceptual             | Propósito principal                                                            | Ejemplos                                                                            | No autoriza por sí solo                                           |
| ----------------------------- | ------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| `OPERATIONAL_EXECUTION`       | ejecutar o confirmar trabajo real, físico, de servicio, custodia o campo       | producir, contar, preparar, cargar, vender, recibir, entregar, registrar asistencia | aprobar, configurar, conciliar, administrar maestros              |
| `OPERATIONAL_SUPERVISION`     | observar operación vigente, coordinar recursos y resolver bloqueos autorizados | ver cola, reasignar tarea, escalar falta, confirmar cobertura                       | modificar políticas, inventar hechos, aprobar cualquier excepción |
| `ADMINISTRATIVE_WORK`         | planificar, decidir, aprobar, reconciliar, administrar casos u obligaciones    | programar, aprobar, revisar, cerrar, conciliar, gestionar expediente                | ejecutar hechos físicos en nombre de terceros                     |
| `CONFIGURATION_GOVERNANCE`    | mantener maestros, versiones, reglas, políticas y parámetros                   | productos, recetas, rutas, permisos, precios, plantillas                            | ejecutar operación ni aprobar casos automáticamente               |
| `AUDIT_ANALYTICS`             | reconstruir historia, investigar, comparar y medir                             | auditoría, trazabilidad, reportes, métricas, exportación controlada                 | corregir la fuente de verdad por visualizar una diferencia        |
| `PERSONAL_CUSTOMER_CANDIDATE` | permitir que una persona actúe sobre su propio caso                            | turnos propios, documentos propios, postulación, pedido, puntos                     | administración del dominio ni acceso a otros sujetos              |

Los códigos son conceptos documentales. Sus nombres físicos deberán definirse en
arquitectura posterior sin crear un enum prematuro.

---

#### 8. Definición de experiencia operativa

Una superficie es operativa cuando su propósito principal consiste en ejecutar,
registrar o confirmar una etapa real del proceso durante el trabajo cotidiano.

Características:

- está vinculada a una tarea o instancia concreta;
- opera dentro de un contexto activo y limitado;
- produce un hecho, movimiento, confirmación o evidencia;
- se utiliza con alta frecuencia o bajo presión temporal;
- puede depender de tablet, móvil, kiosco, escáner, impresora, balanza, cámara o
  vehículo;
- debe reducir lectura, memoria y navegación innecesarias;
- debe mostrar una acción principal ordinaria;
- debe tolerar interrupciones y conectividad inestable cuando el proceso lo
  admita;
- debe impedir acciones fuera de etapa, recurso o territorio;
- debe conservar actor efectivo y evidencia del hecho.

Ejemplos:

- escanear una ubicación;
- contar unidades físicas;
- preparar una línea de remisión;
- recibir una entrega;
- registrar consumo de un lote;
- iniciar o cerrar una producción autorizada;
- registrar una venta;
- confirmar carga, custodia o entrega;
- realizar check-in o check-out;
- completar una tarea de apertura o cierre asignada.

No es operativa por el solo hecho de ocurrir en una sede o durante un turno.

---

#### 9. Contrato mínimo del carril operativo

Toda superficie operativa deberá declarar:

1. proceso e instancia;
2. etapa y acción permitida;
3. tarea actual o cola de trabajo;
4. actor efectivo;
5. rol operativo efectivo cuando aplique;
6. permiso atómico;
7. sede, área, estación, vehículo o territorio;
8. turno y check-in cuando correspondan;
9. dispositivo y periféricos admitidos;
10. recurso, lote, documento, línea o unidad bajo operación;
11. estado previo y transición esperada;
12. evidencia exigida;
13. comportamiento offline, de retry y reanudación;
14. resultado confirmado o pendiente;
15. aplicación propietaria de la escritura.

```text
ACTOR EFECTIVO
+
CONTEXTO OPERATIVO VIGENTE
+
TAREA O INSTANCIA
+
PERMISO EXACTO
+
ESTADO COMPATIBLE
+
RECURSO BAJO ALCANCE
=
ACCIÓN OPERATIVA AUTORIZABLE
```

El carril operativo no podrá usar como sustituto:

- el último rol seleccionado;
- una sede elegida en un filtro administrativo;
- el usuario técnico de la tablet;
- una ruta visible;
- un botón habilitado;
- el rol base del trabajador;
- el nombre de la estación;
- una preferencia almacenada en cliente.

---

#### 10. Composición del carril operativo

La composición ordinaria deberá priorizar:

1. contexto mínimo visible;
2. estado actual;
3. tarea o elemento en curso;
4. acción primaria;
5. evidencia o dato necesario;
6. confirmación inmediata;
7. siguiente paso.

Puede incluir:

- cola corta y priorizada;
- búsqueda o escaneo contextual;
- cantidades y unidades relevantes;
- alertas accionables;
- ayuda breve;
- estado de red o sincronización;
- acciones de recuperación compatibles.

No deberá mostrar en el flujo ordinario:

- maestros completos;
- configuraciones globales;
- ediciones masivas;
- reportes densos;
- permisos;
- costos o salarios sin necesidad;
- parámetros técnicos;
- SQL, IDs internos o códigos opacos;
- herramientas de soporte;
- acciones excepcionales al mismo nivel visual que la acción habitual.

La definición exacta de prioridad corresponde a `UX-BASE-002`; la terminología y
navegación corresponden a `UX-BASE-003`.

---

#### 11. Definición de experiencia administrativa

Una superficie es administrativa cuando su propósito principal consiste en
planificar, versionar, decidir, aprobar, configurar, revisar, corregir,
conciliar, cerrar o gobernar un objeto empresarial.

Características:

- trabaja con poblaciones, periodos, versiones o territorios más amplios;
- puede comparar varios casos o recursos;
- necesita filtros, tablas, historial, diferencias y evidencia;
- puede requerir segregación, doble aprobación o reason codes;
- suele utilizarse con menor frecuencia y mayor deliberación;
- debe mostrar impacto antes de ejecutar acciones sensibles;
- debe permitir revisión, trazabilidad y resultado por elemento;
- no representa por sí sola un hecho físico;
- no debe ejecutarse desde una identidad de dispositivo compartido como actor.

Ejemplos:

- crear o versionar una política;
- planificar turnos;
- aprobar una compra;
- definir un precio;
- mantener una receta maestra;
- revisar una diferencia de inventario;
- aprobar un ajuste;
- conciliar una venta;
- administrar una vacante;
- revisar documentos laborales;
- configurar rutas, ubicaciones o catálogos;
- cerrar un periodo o una obligación.

No es administrativa por el solo hecho de utilizar una tabla, un escritorio o un
usuario gerente.

---

#### 12. Contrato mínimo del carril administrativo

Toda superficie administrativa deberá declarar:

1. proceso, caso, maestro, política u obligación;
2. intención administrativa exacta;
3. empresa y territorio autorizados;
4. periodo, fecha de corte o vigencia;
5. versión visible y versión esperada;
6. filtros o población seleccionada;
7. actor efectivo y rol base aplicable;
8. permiso atómico;
9. segregación entre preparación, revisión, aprobación y conciliación;
10. datos sensibles visibles y masking;
11. impacto previsto;
12. reason code, comentario y evidencia;
13. concurrencia, idempotencia y resultado parcial;
14. aplicación propietaria de cada escritura;
15. historial y receipt.

```text
ACTOR ADMINISTRATIVO AUTORIZADO
+
TERRITORIO
+
PERMISO EXACTO
+
VERSIÓN Y ESTADO
+
SEGREGACIÓN
+
IMPACTO PREVISUALIZADO
=
ACCIÓN ADMINISTRATIVA AUTORIZABLE
```

Una selección administrativa de sede, empresa o periodo será un **alcance de
consulta o gestión**, no un check-in ni un contexto operativo activo.

---

#### 13. Composición del carril administrativo

La experiencia administrativa podrá utilizar:

- navegación por dominios y responsabilidades;
- tablas densas;
- filtros persistentes controlados;
- comparación;
- paneles laterales;
- historiales;
- vistas de diferencias;
- acciones masivas;
- previsualización;
- exportaciones autorizadas;
- aprobaciones y comentarios;
- simulación claramente identificada.

Deberá evitar:

- esconder el alcance territorial;
- ejecutar cambios masivos sin población exacta;
- mezclar edición y aprobación sin segregación;
- tratar una fila como hecho físico no verificado;
- usar el último filtro como autoridad;
- copiar datos canónicos a un maestro paralelo;
- presentar una proyección como fuente de verdad;
- ocultar cambios parciales o rechazados.

La densidad administrativa detallada corresponde a `UX-BASE-012` y el diseño de
backoffice a `UX-ADMIN-001` a `UX-ADMIN-005`.

---

#### 14. Rol, persona y carril son dimensiones independientes

```text
ROL BASE
≠ CARRIL ADMINISTRATIVO PERMANENTE

ROL OPERATIVO
≠ CARRIL OPERATIVO PERMANENTE

GERENTE
≠ TODAS LAS PANTALLAS ADMINISTRATIVAS

PROPIETARIO
≠ BYPASS DE FLUJOS OPERATIVOS
```

Una misma persona podrá participar en carriles diferentes si satisface cada
contrato.

Ejemplo:

```text
GERENTE DE SEDE
→ revisa y publica programación en carril administrativo
→ coordina una contingencia en carril de supervisión
→ apoya una recepción en carril operativo si posee asignación, turno,
  contexto y permiso aplicables
```

Al entrar al carril operativo, la jerarquía no le permitirá:

- declarar hechos de otro trabajador;
- saltar evidencia;
- actuar fuera de sede o área;
- registrar retroactivamente sin autorización;
- usar permisos administrativos como permisos operativos.

---

#### 15. Aplicación y carril son dimensiones independientes

Una aplicación propietaria puede contener varios carriles.

| Aplicación | Carriles esperados, sin limitar el diseño futuro                                                                            |
| ---------- | --------------------------------------------------------------------------------------------------------------------------- |
| SHELL      | acceso, cambio de aplicación y contexto; no backoffice universal                                                            |
| VISO       | administrativo, supervisión, configuración y auditoría; operación solo mediante superficies explícitas y limitadas          |
| ANIMA      | personal del trabajador y operación móvil ligera; supervisión puntual para managers; no planner administrativo denso        |
| NEXO       | ejecución logística e inventario; supervisión; administración separada de maestros, políticas, conciliaciones y excepciones |
| FOGO       | ejecución productiva; supervisión; administración separada de recetas, planes, versiones y liberaciones sensibles           |
| ORIGO      | recepción física delimitada; administración de proveedores, compras, aprobaciones y conciliación                            |
| PULSO      | venta y servicio operativo; administración comercial, configuración, cierres y análisis separados                           |
| NUMERA     | administrativo, financiero, conciliación y auditoría; no fabricación de hechos físicos                                      |
| PASS       | personal/cliente; operaciones internas solo mediante superficies empresariales separadas                                    |
| TALENTO    | personal/candidato e interno administrativo separados; nunca el mismo panel                                                 |
| AURA       | cliente/comercial, supervisión y administración según roadmap futuro; sin mezclarlos por defecto                            |

La matriz no autoriza rutas ni cambia propiedad actual.

---

#### 16. Procesos híbridos

Un proceso híbrido conservará:

- un solo `process_id`;
- etapas clasificadas por carril;
- handoffs explícitos;
- autorización resuelta de nuevo;
- evidencia del origen y aceptación del destino;
- aplicación propietaria de cada escritura.

Ejemplo genérico:

```text
ADMINISTRACIÓN
planifica y autoriza
        ↓
OPERACIÓN
realiza y evidencia
        ↓
SUPERVISIÓN
atiende bloqueos
        ↓
ADMINISTRACIÓN
revisa diferencias y concilia
```

No se permitirá:

```text
UNA PANTALLA
+
TODOS LOS BOTONES
+
VISIBILIDAD CONDICIONAL POR ROL
=
PROCESO HÍBRIDO BIEN DISEÑADO
```

El cruce deberá ser comprensible y auditable.

---

#### 17. Supervisión no equivale a administración

El carril de supervisión sirve para observar operación vigente y coordinar la
respuesta inmediata.

Puede incluir:

- estado de la cola;
- cobertura de puestos;
- bloqueos;
- riesgos;
- SLA operativo;
- reasignación autorizada;
- escalamiento;
- confirmación de atención;
- lectura de evidencia necesaria.

No concede por sí solo:

- edición de maestros;
- aprobación financiera;
- cambio de políticas;
- ajuste de inventario;
- modificación de receta;
- administración de permisos;
- cierre laboral;
- acceso a todos los datos sensibles.

Una capacidad de supervisión deberá declararse separadamente de lectura,
operación, aprobación y configuración.

---

#### 18. Configuración y auditoría no deben ocultarse como administración ordinaria

Las acciones de configuración alteran reglas futuras. Las acciones de auditoría
reconstruyen o verifican historia. Ambas requieren superficies propias o zonas
claramente separadas.

```text
CONFIGURAR
≠ OPERAR
≠ APROBAR UN CASO
≠ AUDITAR

AUDITAR
≠ CORREGIR LA FUENTE DE VERDAD
```

Una diferencia encontrada en auditoría deberá abrir el proceso de corrección
correspondiente. No se corregirá directamente desde la proyección auditora salvo
que exista una acción canónica separada y autorizada.

---

#### 19. Experiencia personal, de cliente o candidato

Una superficie personal permite actuar sobre el propio caso, relación o recurso.

Ejemplos:

- trabajador consulta su turno;
- trabajador solicita una novedad;
- candidato gestiona su postulación;
- cliente consulta puntos o pedido;
- proveedor aporta documentación mediante un portal limitado.

No se presentará el backoffice interno dentro de la misma navegación personal.

```text
MI CASO
≠ BANDEJA DE TODOS LOS CASOS

MI DOCUMENTO
≠ EXPEDIENTE ADMINISTRATIVO COMPLETO

MI TURNO
≠ PLANNER DE TODA LA SEDE
```

---

#### 20. Entrada y cambio de carril

El cambio deberá ser explícito cuando altere materialmente:

- propósito;
- densidad;
- territorio;
- actor;
- dispositivo;
- permisos;
- información sensible;
- riesgo de las acciones.

Antes del cambio se deberá:

1. detectar tarea o mutación en curso;
2. guardar, enviar, cancelar o mantener borrador según contrato;
3. advertir si existe una operación crítica no abandonable;
4. revalidar sesión y step-up cuando corresponda;
5. resolver nuevamente `AccessContext`;
6. limpiar selecciones incompatibles;
7. conservar solo referencias seguras;
8. mostrar el carril y alcance de destino;
9. registrar el evento de cambio.

No se transferirán silenciosamente:

- actor de dispositivo compartido;
- check-in;
- sede operativa;
- filtros globales;
- selección masiva;
- simulación;
- permiso temporal;
- reason code;
- datos sensibles ya cargados;
- acción administrativa pendiente.

---

#### 21. Cambio desde administración hacia operación

La entrada al carril operativo deberá partir de una tarea, asignación o instancia
válida.

```text
SEDE SELECCIONADA EN REPORTE
↛ SEDE OPERATIVA ACTIVA

FILA ABIERTA EN BACKOFFICE
↛ TAREA ASIGNADA

PERMISO DE APROBACIÓN
↛ PERMISO DE EJECUCIÓN
```

El sistema deberá resolver:

- actor humano;
- rol operativo;
- turno;
- check-in;
- sede y área;
- dispositivo;
- recurso;
- estado;
- permiso.

Si falta una condición, el usuario permanecerá en una vista informativa o será
dirigido al proceso correcto; no se fabricará contexto.

---

#### 22. Cambio desde operación hacia administración

Una acción operativa podrá abrir un caso administrativo únicamente mediante un
handoff explícito.

Ejemplos:

- diferencia de conteo abre revisión;
- faltante abre excepción de abastecimiento;
- recepción con discrepancia abre conciliación;
- equipo averiado abre mantenimiento;
- incidente abre investigación;
- venta con inconsistencia abre caso financiero.

El handoff conservará:

- proceso e instancia;
- actor que reportó;
- contexto del hecho;
- evidencia;
- estado y versión;
- motivo;
- receptor;
- siguiente acción.

El trabajador no será obligado a resolver la administración completa para poder
terminar su aporte operativo.

---

#### 23. Navegación separada

Principios iniciales:

**Operación**

- navegación por tarea, cola, estación o proceso en curso;
- acceso corto a acciones frecuentes;
- contexto visible;
- una acción primaria dominante;
- excepciones fuera del trayecto ordinario.

**Administración**

- navegación por dominio, responsabilidad, caso o maestro;
- filtros, búsqueda, historial y vistas comparativas;
- acciones de preparación, aprobación y conciliación separadas;
- alcance territorial y temporal visible.

No se permitirá un menú único que mezcle al mismo nivel:

```text
RECIBIR
CONTAR
CREAR PRODUCTO
EDITAR PERMISOS
APROBAR AJUSTE
EXPORTAR AUDITORÍA
CONFIGURAR IMPRESORA
```

La estructura final de navegación corresponde a `UX-BASE-003`,
`PROC-SCREEN-001` a `PROC-SCREEN-028` y tareas posteriores del BLOQUE I.

---

#### 24. Contexto visible por carril

**Carril operativo** deberá mostrar, cuando apliquen:

- actor;
- rol operativo;
- sede;
- área;
- turno;
- check-in;
- estación o dispositivo;
- tarea o recurso;
- estado de sincronización.

**Carril administrativo** deberá mostrar, cuando apliquen:

- empresa;
- territorio gestionado;
- sede o conjunto de sedes filtrado;
- periodo;
- versión;
- estado del caso;
- población seleccionada;
- simulación;
- actor y capacidad administrativa.

Los dos contextos no se representarán con una única etiqueta ambigua de “sede
activa”. La definición visual completa corresponde a `UX-BASE-005`.

---

#### 25. Separación de datos y proyecciones

La superficie operativa recibirá la proyección mínima necesaria para ejecutar.

Ejemplos de minimización:

- cantidades y ubicaciones necesarias, no costos completos;
- nombre operativo del proveedor, no datos bancarios;
- restricciones funcionales, no diagnóstico médico;
- estado de una orden, no negociación confidencial;
- instrucción de entrega, no expediente completo del cliente;
- rol efectivo, no matrices globales de permisos.

La superficie administrativa podrá requerir mayor amplitud, pero continuará
sujeta a:

- permiso;
- finalidad;
- territorio;
- masking;
- segregación;
- necesidad;
- exportación controlada;
- auditoría.

Ocultar visualmente no sustituye RLS, RPC, vistas seguras o protección de
servidor.

---

#### 26. Propiedad de escritura

La separación de carriles no cambia la propiedad del dominio.

```text
VISO MUESTRA UNA DECISIÓN DE INVENTARIO
≠ VISO ESCRIBE INVENTARIO DIRECTAMENTE

NEXO MUESTRA UNA ORDEN DE COMPRA
≠ NEXO ADMINISTRA LA ORDEN

ANIMA MUESTRA UN TURNO
≠ ANIMA PUBLICA LA PROGRAMACIÓN MASIVA
```

Una superficie consumidora deberá:

- leer una proyección autorizada;
- enviar un comando al propietario;
- recibir resultado o receipt;
- no mantener una copia mutable competidora.

---

#### 27. Protección de acciones

La clasificación de experiencia orienta composición, pero no concede autoridad.

Cada acción deberá validar en servidor:

- principal;
- identidad de dominio;
- actor efectivo;
- permiso;
- alcance;
- contexto;
- recurso;
- estado;
- versión;
- segregación;
- dispositivo;
- vigencia;
- idempotencia.

```text
MODO ADMINISTRACIÓN
≠ PERMISO ADMINISTRATIVO

MODO OPERACIÓN
≠ PERMISO OPERATIVO
```

Un control oculto no es una protección. Un control visible no es una concesión.

---

#### 28. Dispositivos personales y compartidos

Regla por defecto:

```text
DISPOSITIVO COMPARTIDO
→ OPERACIÓN LIMITADA AL PERFIL DEL TERMINAL
→ ACTOR HUMANO SEPARADO
→ SIN BACKOFFICE SENSIBLE
```

El carril administrativo requerirá normalmente:

- sesión personal;
- dispositivo confiable;
- timeout adecuado;
- step-up para acciones sensibles;
- no persistencia de datos sensibles;
- cierre de sesión verificable.

Una excepción administrativa en dispositivo compartido deberá declarar:

- necesidad operativa real;
- aplicación y superficie exactas;
- permisos admitidos;
- actor personal obligatorio;
- vigencia corta;
- masking;
- bloqueo de exportación;
- no almacenamiento local;
- auditoría;
- aprobación de riesgo.

No se heredará el usuario técnico del terminal como actor administrativo.

---

#### 29. Densidad, responsive y accesibilidad

La separación no dependerá únicamente de tamaño de pantalla.

- una tablet puede mostrar administración limitada;
- un escritorio puede ejecutar una tarea operativa;
- un móvil puede ofrecer supervisión puntual;
- una pantalla grande no justifica densidad innecesaria.

La experiencia deberá diferenciar carriles mediante una combinación de:

- título y propósito;
- arquitectura de información;
- jerarquía de acciones;
- densidad;
- etiquetas;
- iconografía;
- contexto;
- navegación;
- confirmaciones.

No se utilizará solo color. Toda distinción deberá ser perceptible con lector de
pantalla, teclado, contraste reducido y daltonismo.

Los detalles táctiles pertenecen a `UX-BASE-011`; la densidad administrativa a
`UX-BASE-012`.

---

#### 30. Excepciones y acciones sensibles

Una excepción no aparecerá como alternativa equivalente a la acción ordinaria.

Secuencia mínima:

```text
ACCIÓN ORDINARIA BLOQUEADA O INSUFICIENTE
        ↓
EXPLICACIÓN HUMANA
        ↓
SOLICITAR O ABRIR EXCEPCIÓN
        ↓
REVALIDAR AUTORIDAD
        ↓
MOTIVO, ALCANCE Y EVIDENCIA
        ↓
APROBACIÓN O CONTROL COMPENSATORIO
        ↓
EJECUCIÓN SEPARADA
        ↓
RETORNO AL FLUJO ORDINARIO
```

No se permitirá:

- “forzar” junto al CTA principal;
- override permanente;
- motivo libre como único control;
- aprobación implícita por jerarquía;
- excepción desde sesión de dispositivo;
- uso de la excepción para fabricar un hecho físico.

El diseño detallado corresponde a `UX-BASE-009` y `UX-BASE-010`.

---

#### 31. Interrupciones, borradores y reanudación

Cuando una persona cambie de carril, aplicación, dispositivo o contexto:

- el borrador deberá tener propietario y estado;
- la operación ya enviada no se repetirá;
- la acción pendiente conservará idempotency key;
- la autoridad se revalidará;
- los datos sensibles no viajarán en URL;
- la referencia de retorno será segura;
- el sistema distinguirá guardado local, pendiente de envío y confirmado;
- un contexto obsoleto no se restaurará automáticamente;
- una tarea reclamada por otro actor producirá conflicto visible;
- un filtro administrativo no se convertirá en contexto operativo.

La política completa offline y de reanudación corresponde a `UX-BASE-013` y
`UX-BASE-014`.

---

#### 32. Deep links, favoritos y URLs directas

Una URL directa deberá validar:

1. superficie y carril;
2. sesión;
3. actor;
4. permiso;
5. contexto;
6. recurso;
7. estado;
8. dispositivo;
9. sensibilidad.

Si el usuario puede leer pero no actuar, se mostrará una proyección de solo
lectura o el estado estándar correspondiente.

No se redirigirá silenciosamente hacia una superficie con más autoridad.

Los favoritos no conservarán:

- selección masiva;
- actor de dispositivo;
- simulación;
- secretos;
- reason codes;
- datos sensibles;
- permisos temporales.

---

#### 33. Eventos mínimos

Se deberán registrar, cuando sean materiales:

```text
EXPERIENCE_SURFACE_OPENED
EXPERIENCE_LANE_RESOLVED
EXPERIENCE_LANE_SWITCH_REQUESTED
EXPERIENCE_LANE_SWITCH_COMPLETED
EXPERIENCE_LANE_SWITCH_BLOCKED
OPERATIONAL_CONTEXT_RESOLVED
ADMINISTRATIVE_SCOPE_RESOLVED
CROSS_LANE_HANDOFF_CREATED
CROSS_LANE_HANDOFF_ACCEPTED
EXCEPTION_FLOW_OPENED
LEGACY_MIXED_SURFACE_USED
```

Los eventos conservarán referencias, no contenido sensible innecesario:

- actor;
- principal;
- superficie;
- carril;
- proceso y etapa;
- aplicación;
- contexto o alcance resumido;
- resultado;
- bloqueo;
- correlation ID;
- versión.

La telemetría no será fuente de autorización.

---

#### 34. Matriz de ejemplos por dominio

| Dominio    | Operativo                                                 | Administrativo / configuración                        | Frontera crítica                                      |
| ---------- | --------------------------------------------------------- | ----------------------------------------------------- | ----------------------------------------------------- |
| Inventario | contar, retirar, ubicar, escanear, preparar               | maestros, políticas, ajustes, conciliación            | registrar diferencia no permite aprobar ajuste        |
| Logística  | cargar, custodiar, conducir, entregar, recibir            | planificar ruta, asignar, revisar incidentes          | planificar no prueba salida ni entrega                |
| Producción | ejecutar lote, pesar, consumir, registrar rendimiento     | receta, versión, plan, liberación sensible            | editar receta no debe aparecer durante ejecución      |
| Compras    | verificar físicamente una recepción                       | proveedor, orden, aprobación, negociación             | recepción física no puede modificar la orden aprobada |
| Ventas     | tomar pedido, cobrar, entregar, cerrar operación asignada | precios, menú, canales, promociones, conciliación     | gerente no fabrica venta desde reporte                |
| Personal   | check-in, consulta de turno, acciones propias             | planner, contratos, permisos, expediente              | ANIMA móvil no reemplaza VISO administrativo          |
| Talento    | candidato completa su proceso                             | reclutador y VISO evalúan, deciden y preparan ingreso | candidato no ve backoffice ni notas internas          |
| Finanzas   | aportar documento o evidencia del hecho                   | contabilizar, conciliar, aprobar, cerrar              | NUMERA consume hechos; no inventa movimiento físico   |
| Cliente    | consultar pedido, puntos, beneficios o solicitud propia   | administrar caso, compensación, contenido y políticas | PASS no expone backoffice comercial                   |

---

#### 35. Antipatrones prohibidos

1. menú único para operación, configuración y reportes;
2. pantalla “detalle” con todos los estados y todas las acciones;
3. botón `Administrar` que concede capacidades por nombre de rol;
4. toggle global `modo gerente`;
5. utilizar VISO como editor universal de otras fuentes;
6. utilizar NEXO como backoffice de compras o producción;
7. utilizar ANIMA como planner completo;
8. permitir que una tablet compartida abra salarios, permisos o expedientes;
9. mostrar costos en una tarea física sin justificación;
10. aprobar desde la misma acción que ejecuta;
11. convertir un reporte en formulario de corrección;
12. ocultar controles con CSS y dejar la mutación accesible;
13. cargar todas las relaciones y enmascararlas solo en frontend;
14. asumir que una ruta `/admin` está protegida;
15. restaurar automáticamente filtros y contexto de otra sesión;
16. pedir al operativo que complete campos administrativos no necesarios;
17. pedir al administrador que registre un hecho físico de otro actor;
18. duplicar la misma acción en varias aplicaciones con reglas diferentes;
19. separar solo por color;
20. mantener una pantalla mixta sin tarea y fecha de retiro.

---

#### 36. Metadatos documentales requeridos por superficie

Toda superficie futura deberá poder describirse mediante:

```text
surface_id
process_id
process_stage
primary_intent
experience_lane
owner_app
consumer_app
primary_actor_type
allowed_device_profiles
requires_active_operational_context
administrative_scope_model
data_sensitivity_profile
density_profile
offline_policy
mode_switch_policy
primary_action
exception_entrypoint
```

Estos campos son un contrato conceptual. La forma física se definirá en
`PROC-SCREEN-001` a `PROC-SCREEN-028` y en el BLOQUE I.

---

#### 37. Métricas y criterios de calidad

**Carril operativo** deberá medir:

- tiempo hasta identificar la tarea;
- tiempo de ejecución;
- errores y correcciones;
- toques o pasos;
- reintentos;
- escaneos fallidos;
- ayuda requerida;
- abandono;
- recuperación tras interrupción;
- acciones fuera de contexto bloqueadas.

**Carril administrativo** deberá medir:

- tiempo de decisión;
- errores de alcance;
- población afectada incorrectamente;
- conflictos de versión;
- aprobaciones rechazadas;
- cambios masivos parciales;
- reversión;
- trazabilidad completa;
- datos sensibles expuestos;
- segregación incumplida.

Criterios transversales:

```text
ACCIONES ADMINISTRATIVAS ACCIDENTALES DESDE OPERACIÓN = 0
HECHOS FÍSICOS FABRICADOS DESDE ADMINISTRACIÓN = 0
AUTORIDAD CONCEDIDA POR CAMBIO VISUAL DE CARRIL = 0
```

Los umbrales definitivos se establecerán con línea base y pilotos en tareas UX y
QA posteriores.

---

#### 38. Auditoría y migración AS-IS

La implementación futura deberá inventariar:

- rutas;
- tabs;
- sidebars;
- modales;
- cards accionables;
- menús contextuales;
- comandos;
- deep links;
- pantallas móviles;
- pantallas de tablet;
- kioscos;
- herramientas de soporte;
- superficies legacy.

Cada acción se clasificará y se marcará como:

```text
CONFORME
REQUIERE_SEPARACIÓN
REQUIERE_HANDOFF
REQUIERE_RESTRICCIÓN_DE_DISPOSITIVO
REQUIERE_CAMBIO_DE_PROPIEDAD
DUPLICADA
LEGACY
CANDIDATA_A_RETIRO
```

La migración deberá incluir:

1. inventario;
2. clasificación;
3. diseño target;
4. protección de servidor;
5. prototipo;
6. validación con actores;
7. feature flag o cutover;
8. monitoreo;
9. retiro de rutas antiguas;
10. regresión y rollback.

No se retirará una superficie antes de demostrar cobertura funcional y operativa
del reemplazo.

---

#### 39. Aplicación en tareas posteriores

| Materia                            | Tarea responsable                                                    |
| ---------------------------------- | -------------------------------------------------------------------- |
| tarea actual y acción principal    | `UX-BASE-002`                                                        |
| lenguaje y navegación no técnica   | `UX-BASE-003`                                                        |
| ocultar funciones irrelevantes     | `UX-BASE-004`                                                        |
| contexto visible                   | `UX-BASE-005`                                                        |
| bloqueos y explicación             | `UX-BASE-006`                                                        |
| doble digitación                   | `UX-BASE-007`                                                        |
| reducción de pasos                 | `UX-BASE-008`                                                        |
| excepciones fuera del flujo        | `UX-BASE-009`                                                        |
| divulgación progresiva             | `UX-BASE-010`                                                        |
| tactilidad y estaciones            | `UX-BASE-011`, `UX-STATION-002` a `UX-STATION-009`                   |
| densidad administrativa            | `UX-BASE-012`, `UX-ADMIN-001` a `UX-ADMIN-005`                       |
| conectividad y reanudación         | `UX-BASE-013`, `UX-BASE-014`                                         |
| lenguaje validado con trabajadores | `UX-BASE-015`                                                        |
| clasificación de rutas y acciones  | `PROC-SCREEN-001` a `PROC-SCREEN-028`; `AUTH-UI-011` a `AUTH-UI-029` |
| autorización de vistas             | `AUTH-UI-030` a `AUTH-UI-045`                                        |
| experiencia aplicada               | `AUTH-UI-046` a `AUTH-UI-060` y subbloques UX por aplicación         |
| pruebas y pilotos                  | `UX-QA-001` a `UX-QA-030`                                            |

No queda ninguna decisión diferida sin tarea responsable.

---

#### 40. Requisitos de prueba derivados

Se crean:

```text
TREQ-UX-008
TREQ-UX-009
TREQ-UX-010
TREQ-UX-011
TREQ-UX-012
TREQ-UX-013
TREQ-UX-014
TREQ-UX-015
TREQ-UX-016
TREQ-UX-017
TREQ-UX-018
TREQ-UX-019
TREQ-UX-020
TREQ-UX-021
TREQ-UX-022
TREQ-UX-023
```

Se actualiza evidencia, sin alterar la regla protegida, para:

- `TREQ-UX-001`;
- `TREQ-UX-003`;
- `TREQ-TALENTO-001`;
- `TREQ-TALENTO-075` a `TREQ-TALENTO-097`.

El detalle canónico vive exclusivamente en
`04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

---

#### 41. Criterios de aprobación

`UX-BASE-001` podrá aprobarse cuando se confirme que:

1. operación y administración están definidas por intención y efecto;
2. la clasificación no depende de aplicación, rol, ruta o dispositivo;
3. los procesos híbridos conservan etapas y handoffs separados;
4. supervisión, configuración, auditoría y experiencia personal no quedan
   colapsadas;
5. el carril operativo exige contexto, tarea, actor y permiso;
6. el carril administrativo exige alcance, versión, segregación e impacto;
7. cambiar de carril revalida autoridad y protege trabajo pendiente;
8. filtros administrativos no crean contexto operativo;
9. roles administrativos no fabrican hechos físicos;
10. roles operativos no obtienen configuración o aprobación;
11. dispositivos compartidos no abren backoffice sensible por defecto;
12. navegación, densidad y datos están separados;
13. las acciones continúan protegidas en servidor;
14. las excepciones quedan fuera del flujo ordinario;
15. la propiedad de escritura por aplicación se conserva;
16. offline, deep links y reanudación no transfieren autoridad obsoleta;
17. existe estrategia de auditoría y migración legacy;
18. cada decisión posterior tiene tarea responsable;
19. el registro TREQ completo es válido;
20. no se implementó ningún cambio físico.

---

#### 42. Materias no autorizadas

La aprobación no autoriza:

- rediseñar todavía una aplicación completa;
- crear o retirar rutas;
- cambiar menús;
- modificar AppShell;
- agregar un selector de modo;
- crear enums o tablas;
- cambiar permisos;
- modificar RLS o RPC;
- ocultar controles actuales sin reemplazo validado;
- retirar pantallas legacy;
- declarar una pantalla lista;
- iniciar un piloto;
- implementar estaciones;
- publicar cambios en producción.

---

#### 43. Resultado y continuidad

Si se aprueba:

```text
CAP-TAL-006 APROBADA
UX-BASE-001 APROBADA
UX-BASE-002 NO INICIADA
```

Quedará aprobado el contrato transversal de separación, pero no la composición
final de cada pantalla.

La continuidad inmediata será:

```text
UX-BASE-002 — Mostrar primero la tarea actual del trabajador
```


### ✅ UX-BASE-002 — Mostrar primero la tarea actual del trabajador

**Estado:** APROBADA 
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `UX-BASE-001 — Separar experiencia operativa y administrativa` — APROBADA  
**Siguiente tarea reservada:** `UX-BASE-003 — Evitar navegación basada en nombres técnicos`  
**Artefacto producido:** `UX-WORK-FOCUS-CONTRACT-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069` y procesos futuros que ingresen al catálogo canónico  
**Aplicaciones cubiertas:** SHELL, ANIMA, NEXO, FOGO, ORIGO, PULSO, VISO, NUMERA, TALENTO, PASS, AURA y aplicaciones futuras de Vento OS  
**Naturaleza:** principio transversal de priorización, foco de trabajo, asignación, toma, concurrencia, handoff, acción siguiente, recuperación y observabilidad  
**Cambios en código, componentes, rutas, datos, migraciones, RLS, RPC, Supabase, colas, permisos o aplicaciones:** no autorizados

---

#### 1. Propósito

Definir el contrato transversal mediante el cual una experiencia de trabajo de
Vento OS deberá responder, de forma inmediata y verificable:

```text
¿QUÉ DEBO HACER AHORA?
¿POR QUÉ ESTA TAREA ES LA PRIMERA?
¿PUEDO EJECUTARLA EN ESTE CONTEXTO?
¿CUÁL ES LA SIGUIENTE ACCIÓN VÁLIDA?
¿QUÉ OCURRE SI ESTÁ BLOQUEADA O ME INTERRUMPEN?
```

La interfaz no deberá obligar al trabajador a reconstruir la prioridad desde:

- nombres de módulos;
- tabs o menús técnicos;
- listas extensas sin jerarquía;
- estados de proceso que no explican la acción;
- notificaciones mezcladas con trabajo;
- órdenes verbales paralelas;
- filtros persistidos de otro turno;
- el orden de creación de registros;
- el color de una tarjeta;
- una cifra de prioridad calculada únicamente en frontend;
- una bandeja general que mezcla sedes, áreas, roles o estaciones;
- una pantalla de detalle donde todos los botones compiten entre sí.

Esta tarea define el contrato de **foco de trabajo**. No diseña todavía la
navegación definitiva, la gramática visual de estaciones ni cada pantalla de
cada aplicación.

---

#### 2. Por qué esta es la continuidad lógica

`UX-BASE-001` separó los carriles de experiencia. El siguiente paso lógico es
definir qué debe aparecer primero dentro del carril operativo.

```text
SEPARAR CARRILES
UX-BASE-001
        ↓
DEFINIR FOCO DE TRABAJO
UX-BASE-002
        ↓
NOMBRAR Y NAVEGAR EN LENGUAJE HUMANO
UX-BASE-003
        ↓
OCULTAR LO IRRELEVANTE
UX-BASE-004
        ↓
MOSTRAR CONTEXTO ACTIVO
UX-BASE-005
```

Sin este contrato, una futura estación podría estar correctamente clasificada
como operativa y aun así presentar:

- múltiples tareas sin orden;
- una tarea no ejecutable como principal;
- trabajo de otra sede;
- una alerta sin acción como si fuera tarea;
- una actividad ya tomada por otra persona;
- una operación vencida que no puede realizarse en esa estación;
- un CTA que abre otra pantalla sin explicar el paso;
- un trabajo nuevo mientras existe una operación crítica sin cerrar;
- una prioridad manual que oculta compromisos más urgentes;
- una tarea terminada que continúa apareciendo por caché.

---

#### 3. Resultado esperado

Al aprobar esta tarea deberá quedar definido:

1. qué significa `tarea actual`;
2. qué objetos no son tareas;
3. cuál es la unidad mínima de foco de trabajo;
4. cómo se relaciona con proceso, instancia, etapa, actor y recurso;
5. cómo se distinguen elegibilidad, asignación, toma y ejecución;
6. qué estados puede tener un ítem de trabajo;
7. qué condiciones lo hacen ejecutable;
8. cómo se selecciona el foco principal;
9. cómo se combinan urgencia, seguridad, compromiso, dependencia, vencimiento,
   ubicación, antigüedad y continuidad;
10. cómo se evita que el ranking se convierta en una caja negra;
11. qué ocurre con una tarea ya iniciada;
12. cuándo se permite interrumpir o sustituir el foco;
13. cómo se representan bloqueo, espera y dependencia;
14. cómo funcionan colas de equipo, asignaciones individuales y estaciones;
15. cómo se evita que dos personas ejecuten el mismo trabajo;
16. cómo se formula la acción siguiente;
17. qué debe mostrar la superficie inicial;
18. cómo se conservan obligaciones secundarias sin competir con el foco;
19. qué ocurre cuando no hay tarea, contexto, permiso o recurso;
20. cómo se comporta en dispositivos compartidos;
21. cómo se abre una tarea cuya propietaria es otra aplicación;
22. cómo se maneja conexión inestable, reanudación y estado obsoleto;
23. qué datos mínimos puede exponer el foco;
24. qué eventos y métricas deben existir;
25. qué decisiones quedan asignadas a tareas posteriores;
26. qué requisitos `TREQ-*` protegen el contrato;
27. cuál es la continuidad inmediata.

---

#### 4. Dependencias y decisiones preservadas

Esta propuesta consume y no reemplaza:

- `ADR-AUTH-001 — ACCEPTED`;
- `AUTH-MOD-001` a `AUTH-MOD-021`;
- `AUTH-CAT-001` a `AUTH-CAT-024`;
- `AUTH-RBAC-001` a `AUTH-RBAC-028`;
- `AUTH-CTX-001` a `AUTH-CTX-030`;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-STATION-001`;
- `OPS-CAN-001`, `OPS-LOG-001` y `OPS-B2B-001`;
- `CAP-TAL-001` a `CAP-TAL-006`;
- `UX-BASE-001`;
- los 112 permisos canónicos y sus matrices;
- el contrato `AccessContext@1.0.0`;
- la propiedad de procesos, datos y mutaciones por aplicación;
- la separación entre principal, identidad, actor efectivo, rol base, rol
  operativo, turno, check-in, sede, área, dispositivo y permiso;
- la prohibición de convertir una presentación de UI en autoridad empresarial.

Decisiones preservadas:

1. el foco no concede permiso;
2. ver una tarea no equivale a tomarla;
3. tomar una tarea no equivale a iniciarla;
4. iniciar una tarea no equivale a completarla;
5. un estado de proceso no identifica por sí solo la acción siguiente;
6. una notificación no es fuente de verdad de la tarea;
7. un dispositivo compartido no es el actor humano;
8. una sede seleccionada no se interpreta como contexto operativo vigente;
9. una aplicación consumidora no modifica directamente la tarea de otra
   propietaria;
10. una prioridad calculada no permite saltar autorización, secuencia o
    segregación;
11. una tarea puede permanecer abierta después de un handoff, pero la obligación
    activa debe pertenecer al actor o cola correctos;
12. la pantalla inicial no reemplaza la protección del servidor.

---

#### 5. Principio rector

```text
TRABAJADOR + CONTEXTO VÁLIDO + TRABAJO EJECUTABLE
        ↓
UN FOCO PRINCIPAL EXPLICABLE
        ↓
UNA SIGUIENTE ACCIÓN VÁLIDA
        ↓
OBLIGACIONES SECUNDARIAS VISIBLES SIN COMPETIR
```

Regla canónica:

```text
LA INTERFAZ MOSTRARÁ PRIMERO
LA MEJOR TAREA EJECUTABLE PARA ESE ACTOR, CONTEXTO E INSTANTE
```

No mostrará primero:

```text
LA ÚLTIMA PANTALLA VISITADA
LA TAREA MÁS NUEVA
LA TAREA CON EL NÚMERO MÁS ALTO
LA TAREA ELEGIDA POR EL FRONTEND
LA TAREA GENERAL DE LA SEDE
LA TAREA DE MAYOR VALOR ECONÓMICO SIN CONTEXTO
LA TAREA QUE UN MANAGER MARCÓ COMO URGENTE SIN AUTORIDAD
```

---

#### 6. Definición de `tarea actual`

La `tarea actual` será la proyección de un **ítem de trabajo ejecutable** que:

1. pertenece a una instancia real de proceso o a una obligación personal válida;
2. se encuentra en una etapa que admite acción humana;
3. tiene actor asignado, actor elegible o cola autorizada;
4. es compatible con rol, permiso, territorio y dispositivo;
5. cumple sus dependencias de ejecución;
6. está disponible en el instante evaluado;
7. no está completado, cancelado, sustituido o tomado por otro actor de forma
   incompatible;
8. posee una acción siguiente resoluble;
9. puede abrirse en una superficie compatible;
10. conserva versión, fuente y trazabilidad.

Forma conceptual:

```text
CURRENT_WORK_FOCUS
=
WORK_ITEM
+ ELIGIBILITY
+ READINESS
+ AUTHORIZATION_PRECHECK
+ CONTEXT_COMPATIBILITY
+ PRIORITY_POLICY
+ FRESHNESS
```

La proyección es una recomendación operativa autoritativa y explicable. La
acción definitiva seguirá reautorizándose en servidor.

---

#### 7. Objetos que no deben confundirse

```text
PROCESO
≠ INSTANCIA DE PROCESO
≠ ETAPA
≠ ÍTEM DE TRABAJO
≠ TAREA ACTUAL
≠ ACCIÓN SIGUIENTE
≠ ALERTA
≠ NOTIFICACIÓN
≠ MENSAJE
≠ NAVEGACIÓN
```

| Objeto           | Significado                                           | No produce por sí solo                   |
| ---------------- | ----------------------------------------------------- | ---------------------------------------- |
| proceso          | definición canónica `VPROC-*`                         | una obligación concreta                  |
| instancia        | caso, pedido, lote, remisión, turno u otro ciclo real | asignación automática                    |
| etapa            | estado o tramo del ciclo                              | permiso para actuar                      |
| ítem de trabajo  | obligación ejecutable o evaluable                     | inicio automático                        |
| foco actual      | ítem priorizado para un contexto                      | cierre ni mutación                       |
| acción siguiente | comando humano permitido desde el estado actual       | autorización futura garantizada          |
| alerta           | señal de riesgo, vencimiento o anomalía               | tarea si no existe tratamiento asignable |
| notificación     | mecanismo de comunicación                             | fuente de verdad                         |
| mensaje          | comunicación humana                                   | instrucción empresarial canónica         |
| navegación       | medio para abrir superficie                           | autoridad ni propiedad                   |

Una alerta podrá **originar o escalar** un ítem de trabajo, pero no será presentada
como tarea hasta que exista responsabilidad, tratamiento y estado propios.

---

#### 8. Unidad mínima del ítem de trabajo

El contrato futuro deberá poder representar, como mínimo:

```text
work_item_id
process_id
process_instance_id
process_step
owner_app_code
source_ref
work_item_type
work_lane
status
readiness_status
assignment_mode
assigned_actor_ref
eligible_actor_set_ref
queue_ref
required_context_ref
required_permission_ref
resource_ref
location_ref
available_at
due_at
priority_class
priority_policy_version
blocking_refs
next_action_code
work_item_version
claim_or_lease_ref
idempotency_scope
created_at
updated_at
```

Esta lista es contractual y no define todavía tabla, schema, columna ni API
físicos.

El ítem no duplicará toda la entidad de negocio. Conservará referencias a la
fuente canónica y una proyección mínima para trabajar.

---

#### 9. Clases de ítems de trabajo

| Clase                  | Ejemplo                                                    | Regla                                              |
| ---------------------- | ---------------------------------------------------------- | -------------------------------------------------- |
| `EXECUTE_STEP`         | preparar una línea, producir una orden, registrar conteo   | exige hecho operativo y evidencia                  |
| `VERIFY_STEP`          | verificar recepción, confirmar cantidad, revisar condición | verificar no equivale a aprobar                    |
| `HANDOFF_ACCEPTANCE`   | aceptar custodia, recibir lote o entrega                   | cambia responsabilidad solo mediante evento válido |
| `PERSONAL_OBLIGATION`  | confirmar turno, completar documento propio                | solo sobre la propia relación                      |
| `SUPERVISORY_RESPONSE` | resolver bloqueo operativo autorizado                      | no concede administración universal                |
| `SAFETY_RESPONSE`      | responder incidente o condición crítica                    | puede interrumpir el foco ordinario                |
| `FOLLOW_UP`            | revisar pendiente después de espera                        | requiere fecha o condición de reactivación         |
| `RECOVERY`             | reconciliar operación pendiente o conflicto                | no repite el efecto original                       |

Las decisiones administrativas densas conservarán su propio contrato posterior
en `UX-ADMIN-001` a `UX-ADMIN-005`; solo aparecerán como foco de un trabajador
cuando el actor esté actuando en un carril compatible y la obligación sea
concreta, asignada y ejecutable.

---

#### 10. Elegible, asignada, tomada y en ejecución

Separación obligatoria:

```text
ELIGIBLE
→ el actor podría realizarla

ASSIGNED
→ la obligación fue dirigida al actor o equipo

CLAIMED
→ un actor obtuvo una reserva temporal para iniciarla

IN_PROGRESS
→ existe evidencia de ejecución real
```

Por tanto:

```text
VER DETALLE ≠ CLAIM
CLAIM ≠ START
START ≠ COMPLETE
```

Reglas:

1. abrir una tarjeta no tomará la tarea;
2. una tarea de cola no se atribuirá al primer usuario que la visualice;
3. la toma deberá ser idempotente y, cuando aplique, usar lease o bloqueo con
   expiración;
4. el inicio deberá corresponder a una acción real, no a una navegación;
5. una tarea asignada individualmente no podrá ser tomada por otro actor sin
   reasignación o sustitución autorizada;
6. una tarea de equipo podrá tomarse por un actor elegible, preservando quién,
   cuándo y desde qué contexto;
7. abandonar una pantalla no liberará automáticamente trabajo en ejecución;
8. una lease vencida no borrará la evidencia ya registrada;
9. la reasignación conservará motivo, actor anterior, actor nuevo y obligaciones
   pendientes;
10. una tarea completada no podrá reaparecer como disponible por sincronización
    tardía.

---

#### 11. Estados canónicos conceptuales

```text
NOT_READY
AVAILABLE
OFFERED
ASSIGNED
CLAIMED
IN_PROGRESS
WAITING
BLOCKED
PAUSED
COMPLETION_PENDING_SYNC
COMPLETED
CANCELLED
SUPERSEDED
EXPIRED
CONFLICT
RECONCILIATION_REQUIRED
```

| Estado                    | Significado UX                                               |
| ------------------------- | ------------------------------------------------------------ |
| `NOT_READY`               | existe obligación futura, pero faltan dependencias           |
| `AVAILABLE`               | puede ser tomada por un actor elegible                       |
| `OFFERED`                 | fue presentada a actor o estación, sin asignación definitiva |
| `ASSIGNED`                | tiene responsable o equipo definido                          |
| `CLAIMED`                 | existe reserva activa para un actor                          |
| `IN_PROGRESS`             | la ejecución ya comenzó                                      |
| `WAITING`                 | depende de tiempo, tercero o evento externo esperado         |
| `BLOCKED`                 | existe impedimento que requiere tratamiento                  |
| `PAUSED`                  | interrupción controlada con punto de reanudación             |
| `COMPLETION_PENDING_SYNC` | el dispositivo conserva evidencia pendiente de confirmación  |
| `COMPLETED`               | el resultado fue confirmado por la fuente canónica           |
| `CANCELLED`               | la obligación fue retirada válidamente                       |
| `SUPERSEDED`              | otra versión o tarea la reemplazó                            |
| `EXPIRED`                 | perdió vigencia sin considerarse completada                  |
| `CONFLICT`                | existe una versión o actor competidor                        |
| `RECONCILIATION_REQUIRED` | el efecto y la vista no coinciden y requieren reparación     |

La implementación podrá especializar estados, pero no podrá colapsar
`WAITING`, `BLOCKED`, `COMPLETED` y `PENDING_SYNC` en un único estado ambiguo.

---

#### 12. Condiciones de ejecutabilidad

Una tarea será ejecutable únicamente si satisface:

```text
ACTOR EFECTIVO VÁLIDO
+ RELACIÓN LABORAL O PERSONAL VIGENTE
+ ROL Y PERMISO REQUERIDOS
+ TURNO Y CHECK-IN CUANDO APLIQUEN
+ SEDE Y ÁREA COMPATIBLES
+ DISPOSITIVO O ESTACIÓN COMPATIBLE
+ RECURSO Y VERSIÓN VIGENTES
+ DEPENDENCIAS COMPLETAS
+ ESTADO QUE ADMITE LA ACCIÓN
+ NO CONFLICTO EXCLUYENTE
```

La proyección de foco distinguirá:

- `EXECUTABLE_NOW`;
- `VISIBLE_NOT_EXECUTABLE`;
- `WAITING_EXTERNAL`;
- `BLOCKED_RECOVERABLE`;
- `BLOCKED_REQUIRES_OTHER_ACTOR`;
- `STALE_REQUIRES_REFRESH`;
- `NOT_ELIGIBLE`.

Una tarea visible pero no ejecutable no deberá ocupar el foco principal salvo
que la única acción válida del trabajador sea resolver, escalar o esperar ese
bloqueo.

---

#### 13. Política de selección del foco

La selección será determinista, versionada y explicable. No dependerá de una
suma opaca de puntos que el usuario no pueda comprender.

Orden conceptual por niveles:

```text
NIVEL 0 — SEGURIDAD, EMERGENCIA O CUSTODIA CRÍTICA
NIVEL 1 — TRABAJO YA EN EJECUCIÓN QUE DEBE CONTINUAR
NIVEL 2 — COMPROMISO INMEDIATO CON CLIENTE, PRODUCCIÓN, ENTREGA O CADENA
NIVEL 3 — TAREA ASIGNADA CON VENCIMIENTO O BLOQUEO DE TERCEROS
NIVEL 4 — TAREA DISPONIBLE PRIORIZADA POR POLÍTICA
NIVEL 5 — MANTENIMIENTO, SEGUIMIENTO O TRABAJO SIN URGENCIA
```

Dentro de un mismo nivel podrán considerarse, de manera explícita:

- seguridad y riesgo;
- custodia física;
- cliente o receptor esperando;
- dependencia que bloquea trabajo posterior;
- fecha requerida y ventana válida;
- SLA;
- secuencia de proceso;
- tarea ya iniciada;
- asignación directa;
- antigüedad y prevención de starvation;
- proximidad física o compatibilidad de estación;
- agrupación razonable por lote, ruta o ubicación;
- disponibilidad de recurso;
- coste de cambio de contexto;
- carga del actor o equipo;
- prioridad autorizada y su motivo.

No podrán utilizarse como prioridad autoritativa:

- posición manual en una lista sin evento;
- `created_at desc` como regla universal;
- nombre del rol;
- jerarquía de quien envió un mensaje;
- valor económico aislado;
- cliente “importante” sin política;
- color elegido en frontend;
- presión verbal no registrada;
- una alerta duplicada;
- una preferencia personal persistida.

---

#### 14. Explicabilidad de la prioridad

La tarjeta principal deberá poder explicar, en lenguaje humano, por qué aparece
primero.

Ejemplos:

```text
Continúa esta recepción: ya la empezaste y conserva custodia pendiente.
```

```text
Prepara esta remisión ahora: el vehículo está listo y la ventana de salida vence pronto.
```

```text
Atiende esta novedad primero: bloquea la producción del área.
```

La explicación no revelará:

- scores internos sensibles;
- datos de otros trabajadores;
- información comercial no necesaria;
- reglas de seguridad explotables;
- diagnósticos o motivos protegidos.

Una prioridad manual deberá mostrar:

- quién la cambió;
- con qué autoridad;
- motivo estructurado;
- alcance;
- vigencia;
- política aplicable.

---

#### 15. Continuidad de una tarea ya iniciada

Por defecto:

```text
TRABAJO VÁLIDO EN EJECUCIÓN
→ PERMANECE COMO FOCO
```

No se sustituirá silenciosamente porque:

- llegó una tarea más nueva;
- cambió el orden visual;
- se abrió otra aplicación;
- apareció una notificación;
- se actualizó una métrica;
- otro usuario modificó una prioridad no crítica.

Podrá interrumpirse cuando exista:

1. riesgo de seguridad o emergencia;
2. pérdida de autorización o contexto;
3. recurso inválido o conflicto;
4. tarea de custodia o cliente con precedencia aprobada;
5. orden explícita de pausa o reasignación;
6. fallo de dispositivo que obliga a contingencia;
7. handoff válido a otro actor.

La interrupción conservará:

- punto de reanudación;
- estado confirmado;
- evidencia capturada;
- responsable actual;
- causa;
- siguiente acción;
- vencimiento o condición de retorno.

---

#### 16. Preemption y cambio de foco

La preemption no será una simple sustitución visual.

```text
FOCO ACTUAL
→ SOLICITUD DE INTERRUPCIÓN
→ VALIDAR CRITICIDAD Y AUTORIDAD
→ GUARDAR O CERRAR PUNTO SEGURO
→ PAUSAR / HANDOFF / CONTINUAR
→ ABRIR NUEVO FOCO
```

Una emergencia podrá imponerse, pero deberá registrar el efecto sobre el trabajo
interrumpido.

No se permitirá:

- dejar cantidades parciales sin estado;
- abandonar custodia sin handoff;
- perder un formulario enviado parcialmente;
- liberar una tarea mientras persiste un efecto físico;
- iniciar una segunda operación incompatible;
- ocultar al trabajador que su tarea fue reasignada.

---

#### 17. Bloqueos y espera

```text
WAITING
→ la dependencia esperada es conocida y normal

BLOCKED
→ existe un impedimento que requiere acción o decisión
```

Todo bloqueo deberá indicar:

- qué impide continuar;
- qué información quedó guardada;
- quién puede resolverlo;
- si el trabajador debe hacer algo;
- cuándo se revisará;
- cómo escalar;
- si puede tomar otra tarea;
- si conserva custodia o responsabilidad.

Una tarea bloqueada podrá permanecer como foco cuando:

- el trabajador debe corregir información;
- debe aportar evidencia;
- debe escalar;
- no puede abandonar custodia;
- no existe otra tarea compatible y el seguimiento es la obligación actual.

Si únicamente espera a otro actor, deberá salir del foco principal y entrar en
`En espera`, con condición de reactivación y visibilidad suficiente.

---

#### 18. Handoffs

Un handoff deberá distinguir:

```text
READY_TO_HANDOFF
OFFERED_TO_NEXT_ACTOR
ACCEPTED_BY_NEXT_ACTOR
CUSTODY_TRANSFERRED
PREVIOUS_ACTOR_RELEASED
```

No será válido:

```text
MARCAR COMO ENVIADO
→ ASUMIR QUE EL SIGUIENTE ACTOR LO RECIBIÓ
```

La tarea actual del actor saliente permanecerá hasta el punto de liberación
aprobado. La del actor entrante no se considerará en ejecución hasta aceptar o
confirmar el evento requerido.

Handoffs entre aplicaciones conservarán el mismo `process_instance_id`,
correlación, recurso y versión.

---

#### 19. Asignación individual, equipo y cola de estación

| Modalidad  | Regla                                                                        |
| ---------- | ---------------------------------------------------------------------------- |
| individual | solo el actor asignado o una reasignación autorizada puede tomarla           |
| equipo     | cualquier miembro elegible puede reclamarla; después queda atribuida         |
| estación   | la cola pertenece al puesto, pero cada ejecución se atribuye al actor humano |
| rol/área   | elegibilidad dinámica según contexto; no concede toma simultánea             |
| sistema    | el sistema puede crear o enrutar, no ejecutar el hecho humano                |

Una cola de estación podrá mostrar trabajo disponible antes de que un actor se
identifique, pero deberá minimizar datos y no permitir mutaciones humanas sin
sesión de actor cuando sean exigidas.

---

#### 20. Concurrencia, claims y leases

Para tareas excluyentes:

```text
AVAILABLE
→ CLAIM ATÓMICO
→ LEASE VIGENTE
→ IN_PROGRESS
```

El contrato deberá impedir:

- doble toma;
- dos actores registrando la misma cantidad;
- claim exitoso en dos dispositivos;
- reanudación desde versión obsoleta;
- liberación automática mientras existe evidencia pendiente;
- completar después de una cancelación o sustitución.

Si otro actor tomó la tarea, la interfaz deberá:

1. retirar el CTA de ejecución;
2. mostrar estado actualizado;
3. identificar al responsable solo cuando sea necesario y permitido;
4. ofrecer otra tarea o volver a la cola;
5. conservar cualquier borrador local como no enviado hasta resolver el
   conflicto.

---

#### 21. Acción siguiente

La tarjeta principal tendrá **una acción primaria** que corresponda al siguiente
comando válido.

Ejemplos correctos:

- `Confirmar cantidades recibidas`;
- `Escanear ubicación de origen`;
- `Registrar lote producido`;
- `Aceptar custodia`;
- `Corregir documento rechazado`;
- `Confirmar asistencia al turno`.

Etiquetas insuficientes cuando no existe contexto:

- `Continuar`;
- `Gestionar`;
- `Procesar`;
- `Ver`;
- `Acción`;
- `Siguiente`.

La acción primaria deberá declarar:

```text
VERBO HUMANO
+ OBJETO
+ ALCANCE O RESULTADO CUANDO SEA NECESARIO
```

Las acciones secundarias no competirán visualmente y estarán limitadas a:

- ver contexto;
- reportar bloqueo;
- solicitar ayuda;
- pausar cuando sea válido;
- rechazar o devolver cuando el proceso lo permita;
- abrir evidencia o instrucciones.

La acción se reautorizará al ejecutarse. El frontend no enviará estado objetivo,
prioridad efectiva, actor, permiso ni resultado derivado como autoridad.

---

#### 22. Superficie inicial del trabajador

La entrada operativa deberá mostrar en este orden:

```text
1. CONTEXTO ESENCIAL
2. FOCO ACTUAL
3. ACCIÓN PRINCIPAL
4. ESTADO O BLOQUEO
5. SIGUIENTES OBLIGACIONES RESUMIDAS
6. ACCESOS SECUNDARIOS
```

El foco deberá incluir, según necesidad:

- nombre humano de la tarea;
- objeto o recurso;
- sede, área o estación cuando evita errores;
- estado;
- por qué aparece primero;
- fecha o ventana relevante;
- responsable o modalidad de asignación;
- progreso real;
- bloqueo;
- acción principal.

No deberá convertirse en un dashboard denso de KPIs, gráficos, anuncios y menús.
Los anuncios críticos se integrarán como alertas separadas y no desplazarán una
tarea sin regla de precedencia.

---

#### 23. Una tarea principal, no una sola obligación

La interfaz mostrará un foco principal, pero no ocultará que existen otras
obligaciones.

Patrón:

```text
AHORA
→ 1 foco principal

DESPUÉS
→ próximas tareas compatibles, resumidas y ordenadas

EN ESPERA
→ obligaciones suspendidas por tercero o tiempo

BLOQUEADAS
→ tareas que requieren tratamiento
```

No se mostrarán diez tarjetas con el mismo peso visual.

La cola secundaria deberá permitir entender:

- cuántas tareas existen;
- cuáles vencen pronto;
- cuáles pertenecen a otro contexto;
- cuáles están en espera;
- cuáles ya fueron tomadas;
- por qué una no puede ejecutarse.

---

#### 24. Estado sin tarea

`NO_WORK_AVAILABLE` es un estado válido. No se inventará trabajo para llenar la
pantalla.

Se distinguirán:

| Estado                 | Respuesta                                                 |
| ---------------------- | --------------------------------------------------------- |
| sin turno              | explicar cómo consultar o resolver turno                  |
| sin check-in           | mostrar acción de check-in si está autorizada             |
| sin contexto           | pedir seleccionar o establecer contexto por flujo válido  |
| sin tareas             | confirmar que no existe trabajo asignado o disponible     |
| solo tareas futuras    | mostrar próxima disponibilidad sin habilitar ejecución    |
| solo tareas bloqueadas | mostrar causa y responsable                               |
| permiso insuficiente   | explicar el límite sin sugerir bypass                     |
| fuera de estación      | indicar dónde debe ejecutarse                             |
| datos no sincronizados | mostrar que el foco no es confiable y permitir actualizar |

El estado vacío podrá ofrecer:

- consultar turno;
- revisar instrucciones;
- reportar disponibilidad;
- abrir una tarea personal propia;
- solicitar ayuda;
- actualizar la cola.

No ofrecerá administración o configuración como relleno.

---

#### 25. Contexto incompatible

Una tarea de otra sede, área, turno, vehículo o estación no se convertirá en foco
por aparecer en la cuenta del trabajador.

Podrá mostrarse en una sección informativa cuando el actor deba trasladarse o
prepararse, pero deberá indicar:

- contexto requerido;
- hora o condición;
- si el traslado está autorizado;
- si la tarea puede abrirse en modo lectura;
- qué acción debe ocurrir antes.

Cambiar contexto para ejecutar la tarea será un flujo explícito y revalidado; no
un side effect del clic sobre la tarjeta.

---

#### 26. Dispositivos compartidos

En un dispositivo compartido se separarán:

```text
COLA DE LA ESTACIÓN
ACTOR HUMANO ACTUAL
FOCO DEL ACTOR
SESIÓN TÉCNICA DEL DISPOSITIVO
```

Reglas:

1. sin actor humano podrá mostrarse únicamente una proyección mínima de la cola;
2. identificar actor reconstruirá elegibilidad y foco;
3. cambiar actor limpiará el foco personal y cualquier dato privado;
4. una tarea tomada por el actor anterior no pasará al siguiente;
5. el dispositivo no conservará filtros o borradores personales sin política;
6. la estación podrá restringir qué clases de tarea admite;
7. un actor no podrá reclamar trabajo incompatible con su turno, área o rol;
8. al cerrar sesión se resolverán claims, borradores y evidencia pendiente de
   acuerdo con su estado, no mediante borrado ciego.

---

#### 27. SHELL y apertura entre aplicaciones

SHELL podrá presentar una proyección agregada de foco o redirigir hacia la
aplicación propietaria, pero no será propietario universal de tareas.

```text
SHELL
→ RESUELVE DESTINO Y CONTEXTO
→ ABRE OWNER_APP + PROCESS_INSTANCE + STEP

OWNER APP
→ REVALIDA Y EJECUTA
```

Un deep link deberá transportar referencias no secretas y no podrá incluir:

- permisos;
- actor autoritativo;
- tokens;
- datos personales sensibles;
- estado objetivo;
- prioridad efectiva;
- resultado de autorización.

Si la aplicación no está disponible, la tarea conservará estado y ofrecerá una
ruta segura de recuperación; no se marcará iniciada por el intento de apertura.

---

#### 28. Ejemplos por aplicación

| Aplicación | Foco correcto                                                                                      | No debe aparecer como foco ordinario                          |
| ---------- | -------------------------------------------------------------------------------------------------- | ------------------------------------------------------------- |
| NEXO       | preparar remisión, contar ubicación, recibir custodia, ubicar LPN                                  | editar políticas, ajustar stock, configurar maestros          |
| FOGO       | ejecutar paso de lote, registrar rendimiento, resolver control requerido                           | editar receta maestra o plan global desde estación            |
| ORIGO      | verificar entrega o recepción física asignada                                                      | aprobar compra o administrar proveedor desde puesto operativo |
| PULSO      | atender pedido, cobrar, entregar o resolver caso inmediato                                         | configurar menú, precio o conciliación financiera             |
| ANIMA      | confirmar turno, completar obligación propia, consultar siguiente acción laboral                   | planner denso de sede o expediente de terceros                |
| VISO       | responder bloqueo o decisión concreta cuando el actor está en carril correspondiente               | fabricar conteo, producción o recepción física                |
| TALENTO    | candidato completa su siguiente requisito; reclutador atiende caso asignado en backoffice separado | notas internas expuestas al candidato                         |
| NUMERA     | revisión o conciliación concreta asignada                                                          | registrar hecho físico inexistente                            |

Estos ejemplos no sustituyen el diseño por proceso, estación y pantalla futura.

---

#### 29. Offline, latencia y estado obsoleto

La tarea mostrada desde caché deberá declarar su frescura.

```text
FRESH
STALE_READ_ONLY
OFFLINE_EXECUTABLE_WITH_LEASE
OFFLINE_CAPTURE_ONLY
REFRESH_REQUIRED
```

Reglas:

1. una tarea crítica no se reclamará offline sin lease o política explícita;
2. completar offline producirá `PENDING_SYNC`, no `COMPLETED` confirmado;
3. la reanudación revalidará versión, actor, contexto, claim y permiso;
4. un conflicto no se resolverá con last-write-wins destructivo;
5. una tarea cancelada o tomada por otro actor no aceptará silenciosamente el
   efecto tardío;
6. la evidencia local conservará idempotency key y estado;
7. la interfaz distinguirá “guardado en el dispositivo” de “confirmado por el
   sistema”.

La definición detallada corresponderá a `UX-BASE-013`, `UX-BASE-014` y
`QUEUE-ARC-001` a `QUEUE-ARC-012`.

---

#### 30. Datos y privacidad

La proyección del foco solo contendrá datos necesarios para ejecutar la acción.

No mostrará por defecto:

- salario;
- diagnóstico;
- datos bancarios;
- información completa del cliente;
- márgenes o costos;
- expediente del trabajador;
- notas internas;
- datos de otros actores;
- razones sensibles de prioridad.

Una pantalla bloqueada o de estación sin actor aplicará mayor minimización.

Logs y analítica no capturarán payload completo, documentos, secretos ni texto
libre sensible.

---

#### 31. Accesibilidad y carga cognitiva

El foco deberá ser comprensible mediante:

- jerarquía estructural, no solo color;
- encabezado y CTA accesibles;
- foco de teclado predecible;
- lector de pantalla;
- estado y prioridad expresados en texto;
- tamaños táctiles compatibles con la estación;
- lenguaje breve y concreto;
- ausencia de animación que distraiga de una tarea crítica;
- cuenta regresiva solo cuando exista una ventana real;
- confirmaciones proporcionales al riesgo.

Una tarea urgente no dependerá de rojo, sonido o vibración como única señal.

---

#### 32. Eventos mínimos

El contrato futuro deberá emitir o correlacionar eventos como:

```text
work_item_became_available
work_item_assigned
work_item_offered
work_item_claimed
work_item_claim_conflicted
work_item_started
work_item_paused
work_item_blocked
work_item_waiting
work_item_resumed
work_item_reprioritized
work_item_handoff_offered
work_item_handoff_accepted
work_item_completed_pending_sync
work_item_completed
work_item_cancelled
work_item_superseded
work_focus_presented
work_focus_opened
work_focus_skipped
work_focus_stale_detected
```

Cada evento deberá conservar, según aplique:

- actor;
- dispositivo;
- proceso e instancia;
- ítem y versión;
- contexto;
- política de prioridad;
- motivo;
- correlation y causation IDs;
- timestamp del servidor;
- resultado;
- evidencia no sensible.

Mostrar una tarea no se registrará como inicio.

---

#### 33. Métricas y guardrails

Métricas de experiencia:

- tiempo para identificar qué hacer;
- tiempo hasta iniciar la acción válida;
- pasos antes del primer efecto real;
- aperturas de tareas incorrectas;
- cambios de foco;
- tareas omitidas;
- ayuda solicitada;
- bloqueos sin responsable;
- reanudaciones exitosas;
- conflictos de claim;
- tareas vencidas;
- tareas disponibles no vistas;
- tiempo en espera;
- starvation por clase o actor.

Guardrails:

- cero autorización concedida por el ranking;
- cero doble ejecución por claim concurrente;
- cero tarea completada mostrada como disponible;
- cero obligación crítica ocultada por anuncios o métricas;
- cero cambio de foco sin tratar trabajo físico pendiente;
- cero datos sensibles expuestos en estación sin actor;
- cero presión para “mejorar productividad” mediante omisión de seguridad,
  descansos o controles.

Las métricas no se utilizarán de forma aislada para sancionar trabajadores. La
productividad deberá interpretarse con volumen, complejidad, bloqueos, recursos,
formación, ubicación y condiciones reales.

---

#### 34. Casos límite obligatorios

El diseño y las pruebas posteriores cubrirán al menos:

1. dos actores intentan tomar la misma tarea;
2. un actor abre la misma tarea en dos dispositivos;
3. la tarea es cancelada mientras está abierta;
4. la prioridad cambia durante ejecución;
5. aparece una emergencia;
6. el turno termina con tarea en progreso;
7. el actor hace check-out con custodia pendiente;
8. el dispositivo pierde red después de capturar evidencia;
9. el recurso cambia de versión;
10. la tarea se traslada a otra sede;
11. la estación queda fuera de servicio;
12. el actor cambia en un dispositivo compartido;
13. un handoff es ofrecido pero no aceptado;
14. una notificación llega después de completar;
15. una tarea bloqueada se desbloquea;
16. un manager reasigna sin cerrar el claim anterior;
17. una tarea futura aparece antes de `available_at`;
18. el foco apunta a una app no instalada o no disponible;
19. existe una obligación personal y una operativa simultáneas;
20. no existe ninguna tarea ejecutable.

---

#### 35. Relación con tareas posteriores

| Decisión pendiente                               | Tarea propietaria                                                    |
| ------------------------------------------------ | -------------------------------------------------------------------- |
| nombres humanos de navegación y acciones         | `UX-BASE-003`                                                        |
| ocultamiento de funciones irrelevantes           | `UX-BASE-004`                                                        |
| visualización estable de sede, área, turno y rol | `UX-BASE-005`                                                        |
| lenguaje de bloqueos y recuperación              | `UX-BASE-006`                                                        |
| evitar doble captura                             | `UX-BASE-007`                                                        |
| reducir pasos y accesos rápidos                  | `UX-BASE-008`                                                        |
| separar excepciones                              | `UX-BASE-009`; `UX-BASE-010`                                         |
| interacción táctil y estación                    | `UX-BASE-011`; `UX-STATION-002` a `UX-STATION-009`                   |
| conectividad y reanudación                       | `UX-BASE-013`; `UX-BASE-014`                                         |
| terminología con trabajadores                    | `UX-BASE-015`                                                        |
| gramática visual, bandeja y composición          | `UX-STATION-010` a `UX-STATION-012`                                  |
| bandejas administrativas                         | `UX-ADMIN-001` a `UX-ADMIN-005`                                      |
| rutas y pantallas reales                         | `PROC-SCREEN-001` a `PROC-SCREEN-028`; `AUTH-UI-001` a `AUTH-UI-060` |
| arquitectura física de colas y eventos           | `QUEUE-ARC-001` a `QUEUE-ARC-012`; `INT-APP-001` a `INT-APP-010`     |
| implementación de autorización                   | `AUTH-DB-*`; `AUTH-SRV-*`; `AUTH-UI-*`                               |
| validación con usuarios                          | `UX-STATION-008`; `UX-QA-001` a `UX-QA-030`                          |

No queda pendiente narrativo sin tarea responsable.

---

#### 36. Antipatrones prohibidos

```text
HOME = MENÚ DE MÓDULOS
```

```text
TAREA ACTUAL = ÚLTIMO REGISTRO CREADO
```

```text
PRIORIDAD = NÚMERO EDITABLE POR CUALQUIERA
```

```text
VER TARJETA = TOMAR TAREA
```

```text
ABRIR DETALLE = INICIAR OPERACIÓN
```

```text
NOTIFICACIÓN = FUENTE DE VERDAD
```

```text
DISPOSITIVO = ACTOR
```

```text
TAREA BLOQUEADA = OCULTARLA
```

```text
SIN TAREA = MOSTRAR CONFIGURACIÓN
```

```text
COMPLETADO OFFLINE = COMPLETADO CONFIRMADO
```

```text
GERENTE DIJO URGENTE = SALTAR POLÍTICA Y AUDITORÍA
```

---

#### 37. Requisitos de prueba derivados

**Resultado:** GENERA 17 REQUISITOS DE PRUEBA.

Se incorporan en el registro canónico:

```text
TREQ-UX-024 a TREQ-UX-040
```

Protegen:

1. identidad y fuente del ítem de trabajo;
2. elegibilidad, asignación, claim e inicio;
3. política determinista de prioridad;
4. precedencia de seguridad y custodia;
5. continuidad del trabajo en ejecución;
6. foco principal y cola secundaria;
7. acción siguiente exacta y reautorizada;
8. bloqueos, espera y seguimiento;
9. handoff y aceptación;
10. estación compartida y cambio de actor;
11. apertura cross-app y propiedad;
12. concurrencia y leases;
13. offline, frescura y reanudación;
14. estados vacíos y contexto incompatible;
15. accesibilidad y carga cognitiva;
16. métricas, equidad y prevención de starvation;
17. eventos, auditoría y versionado.

---

#### 38. Criterios de aceptación

`UX-BASE-002` podrá aprobarse cuando:

- [ ] la tarea actual se define como ítem real, ejecutable y trazable;
- [ ] proceso, etapa, tarea, acción, alerta, notificación y navegación están
      separados;
- [ ] la unidad mínima del ítem está definida sin imponer schema físico;
- [ ] elegibilidad, asignación, claim e inicio son distintos;
- [ ] los estados conceptuales cubren espera, bloqueo, offline y conflicto;
- [ ] la ejecutabilidad depende de actor, contexto, permiso, recurso y estado;
- [ ] la política de foco es determinista, versionada y explicable;
- [ ] la seguridad, custodia y trabajo en ejecución tienen precedencia definida;
- [ ] la preemption conserva un punto seguro y obligaciones residuales;
- [ ] bloqueos y esperas tienen tratamiento diferente;
- [ ] los handoffs exigen aceptación cuando corresponda;
- [ ] las colas individuales, de equipo y estación están diferenciadas;
- [ ] doble claim y ejecución concurrente están prohibidos;
- [ ] existe una única acción primaria contextual;
- [ ] la superficie inicial prioriza contexto, foco y acción;
- [ ] las obligaciones secundarias permanecen visibles sin competir;
- [ ] los estados sin tarea o contexto no inventan trabajo;
- [ ] un dispositivo compartido reconstruye el foco por actor;
- [ ] SHELL no se convierte en propietario de las tareas;
- [ ] offline y caché distinguen pendiente de confirmado;
- [ ] se minimizan datos y se preserva accesibilidad;
- [ ] eventos, métricas y guardrails están definidos;
- [ ] todos los vacíos tienen tarea responsable;
- [ ] no se implementó código ni se alteró una decisión aprobada;
- [ ] `UX-BASE-003` permanece sin iniciar.

---

#### 39. Estado y continuidad

```text
UX-BASE-001   APROBADA
UX-BASE-002   APROBADA
UX-BASE-003   NO INICIADA
```

No se inicia `UX-BASE-003` hasta aprobación expresa de esta tarea.


### ✅ UX-BASE-003 — Evitar navegación basada en nombres técnicos

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `UX-BASE-002 — Mostrar primero la tarea actual del trabajador` — APROBADA  
**Siguiente tarea reservada:** `UX-BASE-004 — Ocultar funciones irrelevantes para el actor`  
**Artefacto producido:** `UX-NAVIGATION-LANGUAGE-CONTRACT-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069` y procesos futuros que ingresen al catálogo canónico  
**Aplicaciones cubiertas:** SHELL, ANIMA, NEXO, FOGO, ORIGO, PULSO, VISO, NUMERA, TALENTO, PASS, AURA y aplicaciones futuras de Vento OS  
**Naturaleza:** principio transversal de arquitectura de información, lenguaje, navegación, búsqueda, enlaces, accesibilidad, localización, telemetría y migración de rutas  
**Cambios en código, componentes, rutas, datos, migraciones, RLS, RPC, Supabase, permisos o aplicaciones:** no autorizados

---

#### 1. Propósito

Definir el contrato transversal mediante el cual toda navegación de Vento OS
deberá responder en lenguaje comprensible:

```text
¿DÓNDE ESTOY?
¿QUÉ PUEDO HACER AQUÍ?
¿QUÉ RESULTADO OBTENDRÉ AL ENTRAR?
¿CÓMO REGRESO AL PROCESO EN EL QUE ESTABA?
¿QUÉ APLICACIÓN EJECUTARÁ REALMENTE LA ACCIÓN?
```

La persona no deberá conocer previamente:

- nombres de tablas o schemas;
- nombres de RPC, Edge Functions, hooks o componentes;
- códigos de permisos;
- nombres de repositorios;
- slugs de rutas;
- enums internos;
- nombres de migraciones;
- abreviaturas no validadas;
- términos en inglés usados por desarrollo;
- divisiones internas del código;
- nombres históricos de pantallas;
- el organigrama técnico de Vento OS.

Esta tarea no elimina los identificadores técnicos. Los mantiene fuera de la
arquitectura mental exigida al usuario y establece una traducción controlada
entre identidad técnica estable y lenguaje humano versionado.

---

#### 2. Continuidad lógica

`UX-BASE-001` separó los carriles de experiencia y `UX-BASE-002` definió el
foco de trabajo. El siguiente paso es impedir que ese foco, sus destinos y las
opciones secundarias vuelvan a expresarse mediante la estructura técnica del
sistema.

```text
SEPARAR EXPERIENCIA OPERATIVA Y ADMINISTRATIVA
UX-BASE-001
        ↓
MOSTRAR PRIMERO EL TRABAJO ACTUAL
UX-BASE-002
        ↓
NOMBRAR DESTINOS Y ACCIONES EN LENGUAJE HUMANO
UX-BASE-003
        ↓
OCULTAR LO IRRELEVANTE PARA CADA ACTOR
UX-BASE-004
        ↓
MOSTRAR CONTEXTO ACTIVO
UX-BASE-005
```

Sin este contrato, una pantalla podría mostrar correctamente la tarea actual,
pero obligar a buscarla en opciones como:

```text
inventory_movements
LPN
LOC
RPC de recepción
ops/audit
Website CMS
settings
role_permissions
pending_review
```

El problema no se resuelve únicamente cambiando textos aislados. Requiere
separar de forma canónica:

```text
IDENTIDAD SEMÁNTICA
RUTA TÉCNICA
PERMISO
ETIQUETA HUMANA
DESCRIPCIÓN
ALIASES DE BÚSQUEDA
CONTEXTO
APLICACIÓN PROPIETARIA
```

---

#### 3. Resultado esperado

Al aprobar esta tarea deberá quedar definido:

1. qué se considera navegación basada en nombres técnicos;
2. qué identificadores pueden existir internamente y cuáles pueden mostrarse;
3. cuál es la unidad semántica estable de navegación;
4. cómo se separan destino, ruta, permiso, etiqueta y acción;
5. cómo se nombran grupos, destinos, tareas, acciones, estados y objetos;
6. cuándo una marca de aplicación puede aparecer;
7. cómo se navega entre aplicaciones sin exigir conocer su arquitectura;
8. cómo se tratan términos operativos legítimos y abreviaturas;
9. cómo se mantiene consistencia entre aplicaciones;
10. cómo se personaliza la navegación sin cambiar el significado de una acción;
11. cómo funcionan breadcrumbs, historial, favoritos y regreso al proceso;
12. cómo funciona la búsqueda con sinónimos y términos históricos;
13. cómo se traducen estados internos a lenguaje humano;
14. cómo se separa el mensaje humano del diagnóstico técnico;
15. cómo se versionan etiquetas y vocabulario;
16. cómo se preservan accesibilidad y localización;
17. cómo se mide el uso sin depender del texto visible;
18. cómo se migran rutas y nombres legacy;
19. qué decisiones quedan asignadas a tareas posteriores;
20. qué requisitos `TREQ-*` protegen el contrato;
21. cuál es la continuidad inmediata.

---

#### 4. Dependencias y decisiones preservadas

Esta propuesta consume y no reemplaza:

- `ADR-AUTH-001 — ACCEPTED`;
- `AUTH-MOD-001` a `AUTH-MOD-021`;
- `AUTH-CAT-001` a `AUTH-CAT-024`;
- `AUTH-RBAC-001` a `AUTH-RBAC-028`;
- `AUTH-CTX-001` a `AUTH-CTX-030`;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-STATION-001`;
- `OPS-CAN-001`, `OPS-LOG-001` y `OPS-B2B-001`;
- `CAP-TAL-001` a `CAP-TAL-006`;
- `UX-BASE-001` y `UX-BASE-002`;
- el catálogo de 112 permisos canónicos;
- `AccessContext@1.0.0` y `AuthorizationDecision`;
- la propiedad de procesos, datos y mutaciones por aplicación;
- la separación entre navegación, visibilidad y autorización;
- la prohibición de derivar permisos desde una ruta o un nombre visible;
- la continuidad posterior de `UX-BASE-004` a `UX-BASE-015`;
- el inventario y clasificación futura de `AUTH-UI-001` a `AUTH-UI-060`;
- el diseño posterior de `PROC-SCREEN-001` a `PROC-SCREEN-028`.

Decisiones preservadas:

1. ocultar un enlace no concede ni revoca permisos;
2. mostrar un enlace no autoriza la acción;
3. una ruta no es un permiso;
4. una etiqueta no es un identificador de dominio;
5. cambiar un texto no cambia el contrato empresarial;
6. una aplicación conserva su nombre de producto, pero el usuario no debe
   conocerla para comprender la tarea;
7. una misma acción conserva significado aunque cambie de dispositivo o actor;
8. una personalización no puede convertir el mismo CTA en comandos distintos;
9. un deep link no transporta autoridad;
10. un alias de búsqueda no concede visibilidad ni acceso;
11. los códigos técnicos permanecen disponibles para auditoría autorizada, no
    como lenguaje ordinario;
12. la validación terminológica final corresponde a `UX-BASE-015`.

---

#### 5. Problema que se prohíbe

Existe navegación basada en nombres técnicos cuando la persona debe inferir el
trabajo o resultado a partir de cualquiera de estas capas:

```text
SCHEMA
TABLA
RECURSO DE API
RPC
PERMISSION CODE
ENUM
ROUTE SLUG
COMPONENTE
REPOSITORIO
MÓDULO DE CÓDIGO
ACRÓNIMO NO VALIDADO
NOMBRE HISTÓRICO SIN SIGNIFICADO ACTUAL
```

También existe cuando la jerarquía visible reproduce directamente:

- carpetas del código;
- dominios de base de datos;
- nombres de migraciones;
- familias de permisos;
- nombres de equipos de desarrollo;
- nombres internos de proyectos;
- estados de máquina;
- el organigrama empresarial sin relación con la tarea;
- el inventario completo de entidades del sistema.

Ejemplos prohibidos como navegación primaria:

```text
inventory_lpn_items
purchase_receptions
application_stage_history
role_permissions
pending_sync
AUTH-CTX
RPCs
Admin Tools
Settings v2
```

---

#### 6. Principio rector

```text
LA PERSONA NAVEGA POR
INTENCIÓN + RESULTADO + CONTEXTO

EL SISTEMA NAVEGA POR
ID SEMÁNTICO + RUTA + CONTRATO + PERMISO
```

Regla canónica:

```text
NINGÚN USUARIO DEBERÁ CONOCER
LA ESTRUCTURA TÉCNICA DE VENTO OS
PARA ENCONTRAR O EJECUTAR SU TRABAJO
```

La traducción será explícita:

```text
CONCEPTO EMPRESARIAL
→ DESTINO SEMÁNTICO
→ ETIQUETA HUMANA
→ RUTA TÉCNICA
→ PERMISO Y PROTECCIÓN DE SERVIDOR
```

Nunca al contrario:

```text
TABLA O RUTA
→ GENERAR AUTOMÁTICAMENTE EL MENÚ
```

---

#### 7. Vocabulario de capas

Se definen cinco capas de lenguaje:

| Capa                        | Uso                                        | Ejemplo                                |
| --------------------------- | ------------------------------------------ | -------------------------------------- |
| `PRODUCT_BRAND`             | identidad del producto                     | `NEXO`, `FOGO`, `ANIMA`                |
| `BUSINESS_CONCEPT`          | concepto real comprendido por la operación | `Remisión`, `Turno`, `Recepción`       |
| `HUMAN_NAV_LABEL`           | destino o grupo visible                    | `Recibir mercancía`, `Mis turnos`      |
| `TECHNICAL_IDENTIFIER`      | identidad estable interna                  | `inventory.receipt.workbench`          |
| `IMPLEMENTATION_IDENTIFIER` | detalle físico no visible                  | tabla, RPC, ruta, componente o permiso |

Reglas:

1. `PRODUCT_BRAND` puede identificar la aplicación, no explicar por sí sola el
   trabajo;
2. `BUSINESS_CONCEPT` solo será visible si existe definición canónica y uso
   operativo real;
3. `HUMAN_NAV_LABEL` deberá expresar intención o resultado;
4. `TECHNICAL_IDENTIFIER` será estable y no dependerá del texto visible;
5. `IMPLEMENTATION_IDENTIFIER` permanecerá fuera de la navegación ordinaria.

---

#### 8. Unidad semántica de navegación

Cada destino navegable deberá poseer una identidad independiente de su ruta,
texto y permiso.

Forma conceptual:

```ts
type NavigationSemanticContract = {
  navigation_id: string;
  intent_code: string;
  owner_app_code: string;
  process_id: string | null;
  process_step: string | null;
  experience_lane: string;
  audience_codes: string[];
  canonical_label_key: string;
  short_description_key: string;
  search_alias_keys: string[];
  route_reference: string;
  required_view_permission: string | null;
  context_requirements: string[];
  terminology_version: string;
  lifecycle_status: string;
};
```

Esta forma es conceptual y no autoriza schema físico.

Separaciones obligatorias:

```text
navigation_id
≠ href
≠ label
≠ permission_code
≠ component_name
≠ process_id
```

Consecuencias:

- cambiar `/ops/audit` no cambia el concepto;
- cambiar `Auditoría ops` por un término validado no cambia el permiso;
- retirar una ruta no elimina automáticamente el destino semántico;
- una etiqueta localizada conserva el mismo `navigation_id`;
- telemetría y favoritos no dependerán del texto visible;
- una misma ruta no deberá representar intenciones contradictorias.

---

#### 9. Tipos visibles de navegación

La navegación distinguirá:

| Tipo              | Pregunta que responde                      | Forma recomendada                          |
| ----------------- | ------------------------------------------ | ------------------------------------------ |
| tarea             | ¿qué hago ahora?                           | verbo + objeto + alcance                   |
| destino operativo | ¿dónde ejecuto este trabajo?               | resultado o conjunto de trabajo            |
| referencia        | ¿qué necesito consultar?                   | objeto empresarial comprensible            |
| supervisión       | ¿qué debo vigilar o resolver?              | resultado o excepción                      |
| administración    | ¿qué debo planificar, aprobar o mantener?  | intención administrativa                   |
| configuración     | ¿qué regla o catálogo autorizado mantengo? | concepto empresarial, no tabla             |
| auditoría         | ¿qué hecho debo reconstruir?               | evento o proceso revisado                  |
| personal          | ¿qué necesito sobre mi relación?           | lenguaje en primera persona cuando proceda |

No se utilizará una única gramática para todos los carriles.

---

#### 10. Gramática de nombres

##### 10.1 Grupos

Un grupo deberá representar una finalidad estable:

```text
RECIBIR Y ALMACENAR
PRODUCIR
DESPACHAR Y ENTREGAR
COMPRAR Y ABASTECER
EQUIPO Y TURNOS
REVISAR Y APROBAR
CONFIGURAR INVENTARIO
```

No deberá representar:

```text
MÓDULO 1
TABLAS
MAESTROS
OTROS
GENERAL
UTILIDADES
BACKOFFICE
LIBRETAS
ADMIN
```

Un término histórico podrá conservarse únicamente si `UX-BASE-015` demuestra
que los usuarios comprenden de forma consistente qué contiene y qué resultado
produce.

##### 10.2 Destinos

Los destinos utilizarán sustantivos o frases de resultado:

```text
Recepciones pendientes
Remisiones por preparar
Producción de hoy
Horarios del equipo
Solicitudes por aprobar
Ubicaciones de almacenamiento
```

##### 10.3 Acciones

Las acciones utilizarán verbo + objeto y, cuando sea necesario, alcance o
resultado:

```text
Confirmar cantidades recibidas
Asignar ubicación
Iniciar lote de producción
Aceptar custodia
Publicar horario
Aprobar solicitud de compra
```

##### 10.4 Estados

Los estados deberán describir la situación humana:

```text
Esperando confirmación del destino
Guardado en este dispositivo; falta sincronizar
Bloqueado por diferencia de cantidades
Listo para despacho
```

No se expondrán directamente:

```text
ready_for_transport
pending_sync
validation_failed
in_progress_v2
```

---

#### 11. Consistencia terminológica

Regla doble:

```text
MISMO CONCEPTO EMPRESARIAL
→ MISMO TÉRMINO CANÓNICO

CONCEPTOS DIFERENTES
→ TÉRMINOS DIFERENTES
```

Ejemplos:

- `sede asignada`, `sede activa` y `sede filtrada` no podrán llamarse todas
  `Sede` sin explicación;
- `preparar`, `despachar`, `iniciar tránsito` y `recibir` no podrán colapsarse
  en `Procesar remisión`;
- `guardar borrador`, `enviar`, `aprobar` y `completar` no utilizarán el mismo
  CTA `Guardar`;
- `trabajador`, `candidato`, `cliente` y `usuario Auth` no serán sinónimos;
- `contar`, `validar diferencia` y `ajustar stock` deberán permanecer separados.

El glosario será transversal. Una aplicación no podrá redefinir un concepto
canónico sin decisión de dominio y versionado.

---

#### 12. Marcas de aplicaciones

Los nombres `NEXO`, `FOGO`, `ORIGO`, `PULSO`, `VISO`, `NUMERA`, `ANIMA`,
`TALENTO`, `PASS` y `SHELL` pueden mantenerse como identidad de producto.

No serán la única instrucción al usuario.

Forma permitida:

```text
Recibir una compra
ORIGO · Compras y proveedores
```

Forma insuficiente:

```text
Ir a ORIGO
```

El selector de aplicaciones deberá mostrar, además de la marca:

- finalidad humana;
- tareas principales disponibles para el actor;
- estado de acceso;
- contexto cuando sea relevante;
- destino de regreso cuando proviene de otro proceso.

La persona podrá aprender la marca, pero no deberá memorizar qué aplicación
contiene cada paso para completar un proceso transversal.

---

#### 13. Términos operativos y abreviaturas

No todo término especializado es un término técnico prohibido.

Un término podrá ser canónico si:

1. representa un objeto o práctica real del negocio;
2. es utilizado de forma consistente por los trabajadores;
3. tiene una definición única;
4. no depende de una implementación particular;
5. su uso reduce ambigüedad;
6. fue validado mediante `UX-BASE-015`.

Ejemplos que requieren validación:

| Término             | Tratamiento inicial                                             |
| ------------------- | --------------------------------------------------------------- |
| `Remisión`          | candidato a concepto empresarial canónico                       |
| `LPN`               | abreviatura experta; no usar sola como navegación primaria      |
| `LOC`               | abreviatura experta; acompañar con `Ubicación` hasta validación |
| `SKU`               | mostrar nombre o referencia de producto según tarea             |
| `Kiosco`            | describe estación o modalidad, no necesariamente el trabajo     |
| `RPC`, `RLS`, `JWT` | diagnóstico técnico; nunca navegación ordinaria                 |

Divulgación progresiva permitida:

```text
Ubicación de almacenamiento
LOC-CP-BOD-01
```

```text
Contenedor logístico
LPN 000184
```

La abreviatura identifica la instancia después de presentar el concepto; no
reemplaza el concepto.

---

#### 14. Navegación operativa

En el carril operativo, la navegación seguirá el trabajo y su resultado:

```text
AHORA
DESPUÉS
EN ESPERA
BLOQUEADAS
HISTORIAL NECESARIO
```

Los destinos secundarios responderán a necesidades reales:

- buscar una tarea;
- escanear un recurso;
- consultar instrucciones;
- revisar trabajo propio;
- reportar un bloqueo;
- aceptar un handoff;
- continuar un borrador.

No se presentará al trabajador un árbol completo de entidades como condición
para operar.

Ejemplo:

```text
Remisiones
├── Preparar
├── Entregar al transporte
└── Recibir
```

es preferible a:

```text
remission_headers
remission_lines
remission_events
remission_statuses
```

La gramática exacta de bandejas y estaciones se desarrollará en
`UX-STATION-010` a `UX-STATION-012`.

---

#### 15. Navegación administrativa

El carril administrativo podrá ser más denso, pero seguirá organizado por
resultado empresarial:

```text
PLANIFICAR
REVISAR
APROBAR
CONCILIAR
CONFIGURAR
AUDITAR
```

No se generará automáticamente un menú por cada tabla o catálogo.

Ejemplos:

```text
Administrar accesos por rol
```

en lugar de:

```text
role_permissions
```

```text
Editar contenido del sitio web
```

en lugar de:

```text
Website CMS
```

```text
Revisar áreas, ubicaciones y asignaciones
```

en lugar de:

```text
Auditoría ops
```

Estos ejemplos son orientativos y no se convierten todavía en etiquetas
aprobadas. Deberán pasar por inventario, prototipo y validación.

---

#### 16. Personalización por actor y contexto

La navegación podrá:

- ocultar destinos no autorizados;
- ordenar por frecuencia y foco;
- priorizar el carril actual;
- mostrar tareas de la sede y área activas;
- adaptar descripciones al dispositivo;
- presentar accesos personales diferentes de los administrativos.

No podrá:

- cambiar el significado empresarial de un `navigation_id`;
- reutilizar `Aprobar` para registrar una recepción según el rol;
- renombrar una acción sensible para ocultar su impacto;
- convertir el mismo enlace en comandos diferentes sin señal explícita;
- mostrar una etiqueta operativa cuando la superficie realmente abre
  configuración;
- derivar permisos desde la etiqueta elegida.

```text
PERSONALIZAR ORDEN Y VISIBILIDAD
≠ CAMBIAR SEMÁNTICA
```

Si dos actores realizan acciones diferentes, existirán destinos o acciones
semánticamente diferentes, aunque compartan parte de la pantalla física.

---

#### 17. Permisos y navegación

La navegación podrá consumir la decisión de autorización para determinar
visibilidad, pero mantendrá separación estricta:

```text
ETIQUETA HUMANA
≠ PERMISSION CODE
≠ DECISIÓN DE AUTORIZACIÓN
```

Reglas:

1. el código `nexo.inventory.remissions.prepare` no será texto visible;
2. el nombre de una ruta no concederá permiso;
3. ocultar el enlace no reemplazará el guard de servidor;
4. abrir una URL directamente revalidará contexto y permiso;
5. una descripción no prometerá una acción que el permiso no permite;
6. la navegación visible no enumerará capacidades sensibles denegadas;
7. una pantalla de diagnóstico autorizada podrá mostrar códigos en una sección
   técnica separada;
8. los aliases de búsqueda se filtrarán después de autorización y alcance.

El estado AS-IS ya separa en `app_navigation_items` campos de etiqueta,
descripción, ruta y permiso requerido. El contrato futuro preservará esa
separación y evitará interpretar cualquiera de esos campos como equivalente a
los demás.

---

#### 18. Navegación entre aplicaciones

Un proceso transversal podrá atravesar varias aplicaciones sin obligar a la
persona a reconstruir la arquitectura.

Contrato conceptual:

```text
ACCIÓN O RESULTADO HUMANO
→ APLICACIÓN PROPIETARIA COMO CONTEXTO SECUNDARIO
→ DEEP LINK A DESTINO SEMÁNTICO
→ REVALIDACIÓN
→ REGRESO AL PROCESO
```

Ejemplo:

```text
Revisar recepción de compra
Se abrirá en ORIGO
```

No:

```text
Abrir /purchase-receptions/[id]
```

El handoff conservará referencias no secretas:

- `navigation_id`;
- `process_instance_id`;
- `work_item_id` cuando aplique;
- `resource_reference` opaca;
- `return_navigation_id`;
- correlation ID.

No transportará:

- permiso;
- actor autoritativo;
- rol;
- estado objetivo;
- token;
- dato sensible;
- etiqueta como fuente de verdad.

---

#### 19. Breadcrumbs, regreso e historial

Los breadcrumbs reflejarán la ubicación semántica y el proceso, no carpetas ni
slugs.

Ejemplo:

```text
Remisiones
› Preparar
› RM-2026-00418
```

No:

```text
inventory
› remissions
› [id]
› edit
```

Reglas:

- `Volver` regresará al punto lógico, no necesariamente a la URL anterior;
- un regreso cross-app conservará el proceso cuando siga vigente;
- historial y recientes mostrarán etiquetas humanas y contexto;
- favoritos guardarán `navigation_id`, no URL ni texto;
- una ruta retirada podrá redirigir al destino semántico sustituto;
- el historial no expondrá nombres de recursos técnicos o datos sensibles.

---

#### 20. Búsqueda y aliases

La búsqueda ayudará a encontrar trabajo con vocabulario humano.

Podrá indexar:

- etiqueta canónica;
- descripción;
- sinónimos aprobados;
- término operativo local validado;
- abreviatura aprobada;
- nombre histórico durante migración;
- número o referencia empresarial autorizada.

No exigirá conocer:

- ruta;
- permiso;
- tabla;
- UUID;
- nombre del componente;
- nombre del repositorio.

Reglas:

1. aliases no cambian la etiqueta canónica;
2. resultados respetan autorización y minimización;
3. la búsqueda no revela que existe una superficie sensible denegada;
4. el resultado explica destino, aplicación propietaria y contexto;
5. las coincidencias ambiguas se diferencian por intención;
6. los aliases legacy tendrán fecha de retiro;
7. las búsquedas técnicas solo existirán en herramientas de soporte autorizadas.

---

#### 21. Estados internos y lenguaje humano

Cada enum o estado de máquina que aparezca deberá tener una proyección humana
versionada.

Forma conceptual:

```text
INTERNAL_STATE
→ HUMAN_STATUS_LABEL
→ EXPLANATION
→ NEXT_ACTION
→ SEVERITY
```

Reglas:

- dos estados con consecuencias diferentes no compartirán una etiqueta que los
  haga indistinguibles;
- un cambio de copy no alterará el estado interno;
- el frontend no inferirá transiciones desde el texto;
- traducciones no serán enviadas al servidor como comando;
- el estado visible podrá ser más comprensible, pero no engañosamente optimista;
- el detalle técnico solo aparecerá en diagnóstico autorizado.

Ejemplo:

```text
Guardado en este dispositivo
Se enviará cuando vuelva la conexión
```

para `COMPLETION_PENDING_SYNC`, sin afirmar `Completado`.

---

#### 22. Errores, bloqueos y falta de acceso

La persona verá:

- qué ocurrió en lenguaje humano;
- qué parte se guardó;
- qué puede hacer;
- quién puede resolverlo;
- si puede continuar otro trabajo;
- una referencia de soporte no secreta cuando proceda.

No verá como mensaje principal:

```text
PGRST116
42501
RLS violation
RPC failed
undefined is not a function
permission_code missing
```

Separación:

```text
MENSAJE HUMANO
→ superficie ordinaria

REASON CODE Y CORRELATION ID
→ soporte y auditoría

STACK, SQL Y PAYLOAD
→ observabilidad restringida
```

El diseño completo de bloqueos en lenguaje humano corresponde además a
`UX-BASE-006`.

---

#### 23. Diagnóstico técnico autorizado

Las herramientas de soporte, auditoría o administración técnica podrán mostrar:

- `navigation_id`;
- route reference;
- permission code;
- reason code;
- correlation ID;
- versión del glosario;
- aplicación propietaria;
- estado interno;
- timestamp y fuente.

Condiciones:

1. sección separada y claramente marcada como técnica;
2. permiso específico;
3. masking de datos sensibles;
4. no convertir el dato técnico en acción empresarial;
5. no reutilizar el panel como navegación ordinaria;
6. no permitir copiar secretos;
7. conservar auditoría de acceso.

```text
TÉRMINO TÉCNICO OCULTO AL TRABAJADOR
≠ TÉRMINO TÉCNICO ELIMINADO DEL SISTEMA
```

---

#### 24. Localización y versionado

El español será el idioma canónico inicial de las superficies internas de Vento
Group, sin incrustar textos de navegación dispersos como identidad lógica.

Cada etiqueta deberá poder conservar:

- key estable;
- locale;
- versión;
- texto corto;
- descripción;
- plural;
- aliases;
- fecha de vigencia;
- estado;
- fuente de aprobación.

Reglas:

- traducir no cambia `navigation_id`;
- una traducción no cambia permiso ni ruta;
- fallback no mostrará keys técnicas como texto final;
- etiquetas críticas tendrán revisión humana;
- una actualización de vocabulario podrá desplegarse sin alterar contratos;
- screenshots, ayudas y entrenamiento deberán indicar la versión aplicable;
- términos legales o laborales tendrán revisión correspondiente.

---

#### 25. Accesibilidad

Toda navegación deberá:

- tener nombre accesible completo;
- evitar iconos sin texto o accessible name;
- expandir abreviaturas en lectores de pantalla;
- conservar orden lógico de teclado;
- usar headings y landmarks coherentes;
- distinguir destino, estado y acción;
- no depender de color, posición o logo;
- evitar etiquetas ambiguas repetidas como múltiples `Ver más`;
- conservar el contexto cuando una persona usa zoom o navegación lineal;
- anunciar cambios de destino y aplicación cuando corresponda.

Ejemplo:

```text
Abrir remisión RM-2026-00418 para recepción
```

es preferible a varios botones llamados:

```text
Abrir
```

sin contexto accesible.

---

#### 26. Telemetría y analítica

La telemetría utilizará identificadores semánticos estables:

```text
navigation_id
intent_code
owner_app_code
experience_lane
actor_class
context_class
entry_source
result
terminology_version
```

No utilizará el texto visible como clave primaria del evento.

Esto permitirá:

- cambiar una etiqueta sin fragmentar métricas;
- comparar web, móvil y kiosco;
- detectar rutas técnicas usadas directamente;
- medir búsquedas sin resultado;
- medir regreso y abandono cross-app;
- identificar términos confusos;
- evaluar si aliases legacy siguen siendo necesarios.

Las métricas no capturarán texto libre sensible ni consultas completas cuando
puedan contener datos personales.

---

#### 27. Fuente y gobierno del glosario

Se requerirá un glosario canónico versionado con, como mínimo:

| Campo               | Propósito                         |
| ------------------- | --------------------------------- |
| `term_id`           | identidad estable                 |
| `canonical_term`    | término principal                 |
| `definition`        | significado empresarial           |
| `concept_owner`     | dominio responsable               |
| `allowed_surfaces`  | dónde puede aparecer              |
| `prohibited_uses`   | usos ambiguos o técnicos          |
| `aliases`           | sinónimos de búsqueda             |
| `abbreviations`     | abreviaturas aprobadas            |
| `locale`            | variante lingüística              |
| `version`           | control de cambios                |
| `validation_status` | pendiente, probado o aprobado     |
| `evidence`          | pruebas con usuarios y decisiones |

Esta tarea define el contrato, no crea todavía la tabla ni el archivo físico
definitivo.

Propiedad:

- el dominio empresarial define el concepto;
- UX define su aplicación visible;
- legal o talento revisa términos laborales o sensibles;
- seguridad revisa diagnósticos;
- `UX-BASE-015` valida comprensión con trabajadores;
- ninguna aplicación crea silenciosamente un sinónimo canónico paralelo.

---

#### 28. Evidencia AS-IS y tratamiento

El estado actual ya contiene una separación útil entre:

- `label`;
- `description`;
- `href`;
- `required_permission_code`.

Sin embargo, existen etiquetas históricas o mixtas que deberán validarse, como:

- `Panel`;
- `Libretas`;
- `Auditoría ops`;
- `Permisos por rol`;
- `Website CMS`;
- `Actualización app`.

Esta propuesta no ordena cambiarlas todavía. Las clasifica como evidencia para:

1. inventario de rutas;
2. asociación con proceso e intención;
3. investigación de lenguaje real;
4. propuesta de etiqueta;
5. prototipo;
6. validación;
7. migración con aliases y redirects;
8. retiro del término legacy.

---

#### 29. Ejemplos orientativos de traducción

| Identificador o nombre AS-IS   | Posible intención humana                  | Estado                  |
| ------------------------------ | ----------------------------------------- | ----------------------- |
| `ops/audit` o `Auditoría ops`  | Revisar áreas, ubicaciones y asignaciones | por validar             |
| `role_permissions`             | Administrar accesos por rol               | por validar             |
| `Website CMS`                  | Editar contenido del sitio web            | por validar             |
| `inventory_locations` o `LOCs` | Ubicaciones de almacenamiento             | por validar             |
| `inventory_lpns` o `LPNs`      | Contenedores logísticos                   | por validar             |
| `purchase_receptions`          | Recibir mercancía de una compra           | por validar             |
| `application_stage_history`    | Historial del proceso de selección        | por validar             |
| `settings`                     | Configuración del dominio específico      | requiere descomposición |

Los ejemplos no sustituyen investigación con trabajadores ni definen una
traducción automática uno-a-uno.

Una tabla puede alimentar varios destinos humanos y un destino humano puede
coordinar varias entidades técnicas.

---

#### 30. Migración de navegación legacy

La migración será gradual:

```text
INVENTARIAR
→ ASIGNAR NAVIGATION_ID E INTENCIÓN
→ CLASIFICAR TÉRMINO
→ PROPONER ETIQUETA
→ PROTOTIPAR
→ VALIDAR
→ PUBLICAR ALIAS Y REDIRECT
→ MEDIR
→ RETIRAR TÉRMINO LEGACY
```

Reglas:

1. no renombrar masivamente sin mapa de equivalencias;
2. conservar deep links mediante redirects cuando sea seguro;
3. favoritos migrarán por `navigation_id`;
4. aliases históricos tendrán fecha de retiro;
5. documentación y capacitación se actualizarán coordinadamente;
6. no mantener dos destinos activos que ejecuten la misma capacidad sin
   estrategia de transición;
7. un cambio de etiqueta no se usará para ocultar un cambio funcional;
8. la ruta legacy no podrá conservar un bypass de autorización;
9. el retiro exigirá evidencia de tráfico, reemplazo y rollback;
10. toda brecha se asignará a tarea existente.

---

#### 31. Matriz de aplicación posterior

| Decisión                                        | Tarea responsable                     |
| ----------------------------------------------- | ------------------------------------- |
| ocultar destinos irrelevantes por actor         | `UX-BASE-004`                         |
| mostrar sede, área, turno y rol                 | `UX-BASE-005`                         |
| mensajes humanos de bloqueo                     | `UX-BASE-006`                         |
| reducir pasos y opciones frecuentes             | `UX-BASE-008`                         |
| excepciones fuera del flujo ordinario           | `UX-BASE-009`                         |
| divulgación progresiva de términos expertos     | `UX-BASE-010`                         |
| interfaces táctiles y kioscos                   | `UX-BASE-011`                         |
| densidad administrativa                         | `UX-BASE-012`                         |
| reanudación y navegación tras interrupción      | `UX-BASE-014`                         |
| validar terminología con trabajadores           | `UX-BASE-015`                         |
| gramática de estaciones y bandejas              | `UX-STATION-010` a `UX-STATION-012`   |
| inventario de rutas reales                      | `AUTH-UI-001` a `AUTH-UI-010`         |
| process_id, intención, actor y acción           | `AUTH-UI-011` a `AUTH-UI-029`         |
| navegación y autorización                       | `AUTH-UI-030` a `AUTH-UI-045`         |
| home, tareas frecuentes y opciones irrelevantes | `AUTH-UI-052` a `AUTH-UI-054`         |
| prototipos y validación                         | `AUTH-UI-055` a `AUTH-UI-060`         |
| contrato detallado de pantallas                 | `PROC-SCREEN-001` a `PROC-SCREEN-028` |
| rediseño por aplicación                         | subbloques UX de cada producto        |

No queda decisión diferida sin responsable documental.

---

#### 32. Eventos mínimos

Deberán existir eventos conceptuales para:

```text
navigation_presented
navigation_selected
navigation_denied
navigation_redirected
navigation_alias_matched
navigation_search_no_result
cross_app_opened
cross_app_returned
legacy_route_used
terminology_version_changed
```

Campos mínimos:

- `navigation_id`;
- `intent_code`;
- aplicación origen y destino;
- actor y contexto minimizados;
- surface type;
- entry source;
- terminology version;
- resultado;
- reason code;
- correlation ID;
- timestamp del servidor.

No se registrará como evento empresarial ejecutar una acción únicamente por
haber navegado hacia su pantalla.

---

#### 33. Métricas y guardrails

Métricas de validación:

- tiempo para encontrar una tarea frecuente;
- porcentaje de primera selección correcta;
- uso de búsqueda;
- búsquedas sin resultado;
- uso de aliases técnicos o legacy;
- retrocesos inmediatos;
- aperturas de destino equivocado;
- abandono durante un salto cross-app;
- solicitudes de ayuda terminológica;
- lectura y uso con lector de pantalla;
- frecuencia de rutas directas legacy;
- diferencia entre trabajadores nuevos y experimentados.

Guardrails:

- no optimizar únicamente clics;
- no ocultar obligaciones para reducir complejidad aparente;
- no inferir incompetencia del trabajador por usar búsqueda;
- no usar términos técnicos para favorecer usuarios expertos a costa del resto;
- no medir texto libre sensible;
- no sancionar a una persona por una arquitectura de información deficiente.

---

#### 34. Antipatrones prohibidos

```text
MENÚ = TABLAS
```

```text
LABEL = PERMISSION CODE
```

```text
RUTA = IDENTIDAD EMPRESARIAL
```

```text
ICONO = NOMBRE SUFICIENTE
```

```text
IR A NEXO = INSTRUCCIÓN COMPLETA
```

```text
SETTINGS = TODA CONFIGURACIÓN
```

```text
PENDING_SYNC = MENSAJE PARA EL TRABAJADOR
```

```text
RENOMBRAR = REDISEÑAR
```

```text
OCULTAR LINK = AUTORIZAR
```

```text
ALIAS DE BÚSQUEDA = VISIBILIDAD SIN PERMISO
```

```text
MISMA ETIQUETA = MISMO COMANDO SEGÚN EL ROL
```

---

#### 35. Requisitos de prueba derivados

**Resultado:** GENERA 18 REQUISITOS DE PRUEBA.

Se incorporan en el registro canónico:

```text
TREQ-UX-041 a TREQ-UX-058
```

Protegen:

1. exclusión de identificadores técnicos;
2. identidad semántica estable;
3. gramática de grupos, destinos y acciones;
4. vocabulario especializado y abreviaturas;
5. consistencia entre conceptos;
6. marcas de aplicación y finalidad humana;
7. navegación operativa por trabajo;
8. navegación administrativa por resultado;
9. personalización sin mutación semántica;
10. separación entre permiso y navegación;
11. handoff y deep links cross-app;
12. búsqueda, aliases y minimización;
13. breadcrumbs, regreso, historial y favoritos;
14. estados humanos y enums internos;
15. errores y diagnóstico técnico;
16. localización y accesibilidad;
17. telemetría por identificadores estables;
18. migración legacy y validación terminológica.

---

#### 36. Criterios de aceptación

`UX-BASE-003` podrá aprobarse cuando:

- [ ] navegación técnica y navegación humana están diferenciadas;
- [ ] `navigation_id`, ruta, etiqueta y permiso son conceptos separados;
- [ ] la unidad semántica de navegación está definida sin imponer schema físico;
- [ ] grupos, destinos, acciones y estados tienen gramática específica;
- [ ] mismo concepto usa el mismo término y conceptos distintos no colapsan;
- [ ] las marcas de aplicaciones no son la única guía;
- [ ] términos operativos y abreviaturas tienen gate de validación;
- [ ] el carril operativo navega por trabajo y resultado;
- [ ] el carril administrativo no reproduce tablas o schemas;
- [ ] personalización modifica orden o visibilidad, no significado;
- [ ] navegación, permiso y autorización permanecen separados;
- [ ] deep links cross-app conservan intención y revalidación;
- [ ] breadcrumbs y regreso usan contexto empresarial;
- [ ] búsqueda admite aliases sin revelar destinos denegados;
- [ ] enums y reason codes no se exponen como copy ordinario;
- [ ] diagnóstico técnico queda separado y protegido;
- [ ] localización no altera contratos;
- [ ] accesibilidad no depende de iconos o texto ambiguo;
- [ ] telemetría usa identificadores estables;
- [ ] la migración legacy tiene aliases, redirects, medición y rollback;
- [ ] todos los pendientes tienen tarea responsable;
- [ ] no se implementó código ni se alteró una decisión aprobada;
- [ ] `UX-BASE-004` permanece sin iniciar.

---

#### 37. Estado y continuidad

```text
UX-BASE-002   APROBADA
UX-BASE-003   APROBADA
UX-BASE-004   NO INICIADA
```

No se inicia `UX-BASE-004` hasta aprobación expresa de esta tarea.


### ✅ UX-BASE-004 — Ocultar funciones irrelevantes para el actor

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `UX-BASE-003 — Evitar navegación basada en nombres técnicos` — APROBADA  
**Siguiente tarea reservada:** `UX-BASE-005 — Mantener visible sede, área, turno y rol activos`  
**Artefacto producido:** `UX-CONTEXTUAL-RELEVANCE-CONTRACT-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069` y procesos futuros incorporados al catálogo canónico  
**Aplicaciones cubiertas:** SHELL, ANIMA, NEXO, FOGO, ORIGO, PULSO, VISO, NUMERA, TALENTO, PASS, AURA y aplicaciones futuras de Vento OS  
**Naturaleza:** principio transversal de relevancia contextual, minimización de interfaz, visibilidad, descubrimiento, seguridad perceptual, accesibilidad y migración de superficies  
**Cambios en código, componentes, rutas, permisos, roles, tablas, RLS, RPC, Supabase o aplicaciones:** no autorizados

---

#### 1. Propósito

Definir el contrato mediante el cual Vento OS decidirá qué funciones, acciones,
datos, indicadores, accesos y mensajes deben aparecer ante una persona en un
instante concreto.

La interfaz deberá responder:

```text
¿ESTO LE CORRESPONDE A ESTE ACTOR?
¿ES RELEVANTE PARA LA TAREA Y ETAPA ACTUALES?
¿ES VÁLIDO EN ESTA SEDE, ÁREA, TURNO Y DISPOSITIVO?
¿PUEDE EJECUTARSE AHORA?
¿DEBE MOSTRARSE, EXPLICARSE, RELEGARSE U OCULTARSE?
```

La reducción visual no se logrará borrando información necesaria ni usando el
menú como mecanismo de seguridad. Se logrará mediante una proyección contextual
trazable, consistente y protegida por servidor.

---

#### 2. Continuidad lógica

```text
SEPARAR EXPERIENCIA OPERATIVA Y ADMINISTRATIVA
UX-BASE-001
        ↓
MOSTRAR PRIMERO LA TAREA ACTUAL
UX-BASE-002
        ↓
NAVEGAR EN LENGUAJE HUMANO
UX-BASE-003
        ↓
MOSTRAR SOLO LO RELEVANTE PARA EL ACTOR
UX-BASE-004
        ↓
MANTENER VISIBLE EL CONTEXTO ACTIVO
UX-BASE-005
```

`UX-BASE-004` no define todavía el diseño visual final de cada menú o pantalla.
Define la regla transversal que esas superficies deberán cumplir.

---

#### 3. Problema que se corrige

Un sistema puede respetar permisos y aun así ofrecer una experiencia incorrecta:

- mostrar decenas de opciones porque el actor tiene varios permisos;
- presentar configuración durante una tarea física;
- enseñar acciones de otra etapa del proceso;
- mostrar datos de otras sedes sin necesidad operativa;
- dejar botones deshabilitados sin explicar por qué;
- revelar cantidades o alertas de recursos que el actor no debe conocer;
- mezclar funciones de trabajador, supervisor y administrador;
- conservar menús del trabajador anterior en una tablet compartida;
- permitir que favoritos o búsqueda reintroduzcan opciones ocultas;
- usar la misma superficie para ejecutar, aprobar, corregir y auditar.

El problema no se resuelve únicamente con:

```text
IF has_permission THEN SHOW
```

porque:

```text
TENER PERMISO
≠ NECESITAR VER LA FUNCIÓN AHORA
```

---

#### 4. Decisión principal

Toda función visible deberá superar dos puertas independientes:

```text
PUERTA 1 — AUTORIZACIÓN
¿El actor puede acceder o actuar según permiso, alcance y contexto?

PUERTA 2 — RELEVANCIA
¿La función aporta a la intención, tarea, etapa y dispositivo actuales?
```

Resultado:

```text
AUTORIZADO + RELEVANTE
→ MOSTRAR EN LA SUPERFICIE CORRESPONDIENTE

AUTORIZADO + NO RELEVANTE AHORA
→ OCULTAR, RELEGAR O HACER DESCUBRIBLE SEGÚN POLÍTICA

NO AUTORIZADO
→ NO OFRECER COMO CAPACIDAD EJECUTABLE
```

Ninguna de estas decisiones sustituye la protección del servidor.

---

#### 5. Vocabulario canónico

Se congelan los siguientes conceptos:

```text
AUTHORIZED
El actor posee una concesión válida para el alcance solicitado.

RELEVANT
La capacidad corresponde a su intención, tarea, etapa y contexto actuales.

VISIBLE
La interfaz la presenta en la superficie ordinaria.

DISCOVERABLE
Puede encontrarse mediante un mecanismo autorizado sin ocupar la superficie principal.

ENABLED
La acción puede intentarse ahora porque sus precondiciones inmediatas están satisfechas.

ACTIONABLE
El servidor podría aceptar el comando después de revalidar estado y autorización.

REQUIRED
El actor tiene una obligación o paso que no debe ocultarse.

SENSITIVE
La mera existencia, conteo o detalle requiere minimización adicional.
```

Invariantes:

```text
VISIBLE ≠ AUTHORIZED
AUTHORIZED ≠ RELEVANT
RELEVANT ≠ ENABLED
ENABLED ≠ ACTIONABLE CONFIRMADO
HIDDEN ≠ DENIED
DISABLED ≠ FORBIDDEN
DISCOVERABLE ≠ VISIBLE PARA TODOS
```

---

#### 6. Unidad mínima de relevancia

La relevancia no se asignará únicamente a una ruta completa. Se evaluará, según
corresponda, para:

- aplicación;
- grupo de navegación;
- destino;
- vista;
- sección;
- pestaña;
- card;
- columna;
- campo;
- filtro;
- indicador;
- alerta;
- acción primaria;
- acción secundaria;
- acción masiva;
- exportación;
- dato sensible;
- enlace cross-app;
- notificación;
- resultado de búsqueda.

Una pantalla autorizada podrá contener elementos que deban permanecer ocultos.

---

#### 7. Dimensiones obligatorias de relevancia

La proyección se resolverá utilizando, cuando apliquen:

| Dimensión               | Pregunta                                                                       |
| ----------------------- | ------------------------------------------------------------------------------ |
| actor efectivo          | ¿Quién actúa realmente?                                                        |
| identidad de dominio    | ¿Actúa como trabajador, candidato, cliente, dispositivo o servicio?            |
| carril de experiencia   | ¿Opera, supervisa, administra, configura, audita o actúa sobre su propio caso? |
| rol base                | ¿Qué autoridad estructural posee?                                              |
| rol operativo efectivo  | ¿Qué función temporal ejecuta?                                                 |
| permiso exacto          | ¿Qué capacidad y alcance fueron concedidos?                                    |
| tarea actual            | ¿Qué trabajo debe realizar ahora?                                              |
| proceso y etapa         | ¿Qué acciones corresponden al estado vigente?                                  |
| recurso                 | ¿Sobre qué objeto o conjunto puede actuar?                                     |
| propiedad o custodia    | ¿El recurso está asignado, bajo custodia o relacionado con el actor?           |
| empresa, sede y área    | ¿Cuál es el territorio autorizado y activo?                                    |
| turno y check-in        | ¿Existe contexto operativo vigente cuando se exige?                            |
| dispositivo             | ¿Es personal, compartido, kiosco, móvil, tablet o escritorio?                  |
| conectividad            | ¿La información está fresca, obsoleta o solo local?                            |
| sensibilidad            | ¿Qué minimización y masking requiere el dato?                                  |
| frecuencia              | ¿Es una acción ordinaria, ocasional o excepcional?                             |
| riesgo                  | ¿Exige confirmación, step-up o superficie separada?                            |
| delegación o simulación | ¿El actor real difiere del contexto representado?                              |
| tiempo                  | ¿La capacidad está dentro de vigencia y ventana operativa?                     |

No se aceptará una relevancia derivada únicamente de:

```text
nombre del rol
nombre de la ruta
aplicación abierta
cookie de frontend
último menú visitado
ancho de pantalla
```

---

#### 8. Fuente de verdad

La interfaz consumirá una proyección producida a partir de hechos autoritativos.
El frontend podrá decidir composición visual, pero no inventar autoridad ni
ampliar el conjunto relevante.

Forma conceptual:

```ts
type ExperienceRelevanceProjection = {
  actor_context_fingerprint: string;
  policy_version: string;
  generated_at: string;
  expires_at: string | null;
  surface_id: string;
  items: Array<{
    semantic_id: string;
    relevance_state:
      | "PRIMARY"
      | "SECONDARY"
      | "DISCOVERABLE"
      | "CONTEXTUAL_DISABLED"
      | "REQUIRED_BLOCKED"
      | "HIDDEN";
    reason_code: string;
    required_permission_code: string | null;
    context_requirements: string[];
    sensitivity_class: string | null;
  }>;
};
```

La forma anterior es conceptual; no impone tabla, RPC o schema físico.

---

#### 9. Estados de presentación

##### 9.1 `PRIMARY`

Función o acción principal para la tarea actual.

- visible de inmediato;
- prioridad visual alta;
- una intención inequívoca;
- no compite con configuración o excepciones.

##### 9.2 `SECONDARY`

Capacidad útil y frecuente que no debe competir con la acción principal.

- visible con jerarquía menor;
- cantidad limitada;
- vinculada al mismo proceso o resultado.

##### 9.3 `DISCOVERABLE`

Capacidad autorizada pero no relevante para la superficie ordinaria.

Podrá aparecer mediante:

- búsqueda autorizada;
- menú secundario;
- cambio explícito de carril;
- backoffice correspondiente;
- acción contextual desde el recurso correcto.

##### 9.4 `CONTEXTUAL_DISABLED`

La capacidad es relevante y autorizada, pero una precondición temporal impide
su ejecución.

Debe mostrar:

- causa humana;
- condición faltante;
- quién puede resolverla;
- siguiente paso;
- información ya conservada.

##### 9.5 `REQUIRED_BLOCKED`

Existe una obligación que no puede ocultarse aunque esté bloqueada.

Ejemplos:

- confirmar recepción bajo custodia;
- resolver un conteo rechazado;
- completar un documento obligatorio;
- atender una alerta de seguridad;
- cerrar una jornada pendiente.

##### 9.6 `HIDDEN`

No ocupa espacio, foco, navegación, tab order ni accesibilidad ordinaria.

Ocultar no autoriza ni deniega por sí mismo.

---

#### 10. Regla para ocultar, deshabilitar o explicar

| Situación                                                     | Tratamiento ordinario                                                |
| ------------------------------------------------------------- | -------------------------------------------------------------------- |
| no autorizado y no necesario para comprender el flujo         | ocultar                                                              |
| no autorizado, pero el usuario llegó por URL o enlace válido  | estado estándar sin acceso, sin revelar datos                        |
| autorizado, irrelevante para el contexto actual               | ocultar o hacer descubrible                                          |
| autorizado y relevante, pero falta una precondición resoluble | mostrar deshabilitado con explicación                                |
| obligación vigente bloqueada                                  | mantener visible y explicar bloqueo                                  |
| acción futura de otra etapa                                   | no mostrar como CTA; podrá mostrarse como próximo hito no accionable |
| acción excepcional                                            | mover a flujo separado conforme a `UX-BASE-009`                      |
| opción avanzada                                               | no ocupar flujo ordinario; tratamiento posterior en `UX-BASE-010`    |
| dato sensible innecesario                                     | no cargar ni renderizar                                              |
| dato necesario con masking                                    | mostrar solo proyección mínima                                       |

Queda prohibido llenar una pantalla con botones deshabilitados para demostrar
que existen funciones.

---

#### 11. Carril operativo

Una superficie operativa deberá priorizar:

1. tarea actual;
2. acción siguiente;
3. evidencia necesaria;
4. estado del recurso;
5. bloqueo o handoff;
6. próximas obligaciones compatibles.

No deberá mostrar ordinariamente:

- administración de catálogos;
- configuración global;
- matrices de permisos;
- reportes gerenciales densos;
- exportaciones;
- ajustes excepcionales;
- auditoría técnica;
- controles de otras etapas;
- acciones masivas no relacionadas con la tarea.

Ejemplos:

```text
BODEGUERO PREPARANDO UNA REMISIÓN
→ líneas por preparar, LOC de origen, cantidad, evidencia y faltantes
↛ catálogo completo, costos, permisos, rutas maestras o ajustes
```

```text
OPERARIO EJECUTANDO UN LOTE
→ receta publicada, paso actual, cantidades, tiempo y evidencia
↛ editor de receta, versionado, costos o liberación administrativa
```

```text
CAJERO EN VENTA
→ pedido, pago, entrega y contingencias autorizadas
↛ configuración de menú, impuestos, conciliación histórica o usuarios
```

---

#### 12. Carril administrativo

Una superficie administrativa podrá mostrar más información, pero conservará
relevancia por:

- alcance territorial;
- proceso administrado;
- periodo;
- decisión pendiente;
- población seleccionada;
- autoridad;
- sensibilidad;
- segregación de funciones.

Un gerente con muchos permisos no recibirá automáticamente un menú con todas
las capacidades del ecosistema.

```text
GERENCIA REVISANDO HORARIOS
→ cobertura, excepciones, conflictos, publicación y evidencia
↛ edición de inventario, recetas o proveedores sin cambio de intención
```

```text
CONTABILIDAD CONCILIANDO
→ documentos, periodos, diferencias y aprobaciones permitidas
↛ acciones físicas de recepción, conteo o despacho
```

---

#### 13. Supervisión

Supervisar no significa ejecutar ni administrar todo.

La superficie de supervisión mostrará:

- estado de la operación bajo responsabilidad;
- bloqueos;
- riesgos;
- carga;
- SLA;
- excepciones que requieren su intervención;
- evidencia necesaria para coordinar.

No mostrará por defecto:

- controles para fabricar hechos operativos;
- datos personales no necesarios;
- configuración global;
- capacidad de corregir unilateralmente;
- funciones de otros territorios.

```text
VER QUE UNA RECEPCIÓN ESTÁ BLOQUEADA
≠ PODER REGISTRARLA EN NOMBRE DEL RECEPTOR
```

---

#### 14. Configuración, gobierno y auditoría

Estas capacidades permanecerán fuera de los flujos ordinarios.

##### Configuración

Se mostrará únicamente cuando exista intención explícita de mantener:

- catálogos;
- políticas;
- plantillas;
- reglas;
- versiones;
- parámetros.

##### Auditoría

Podrá mostrar trazabilidad más amplia, pero no convertirá automáticamente la
observación en edición.

##### Gobierno

Los controles de roles, permisos, aplicaciones, RLS, integraciones o contratos
se ubicarán en superficies protegidas y separadas.

---

#### 15. Experiencias personal, cliente y candidato

Una persona que actúa sobre su propio caso verá solamente:

- su información;
- sus acciones;
- sus documentos;
- sus estados;
- sus solicitudes;
- sus comunicaciones.

No verá:

- herramientas internas;
- notas privadas;
- scores internos;
- comparaciones con terceros;
- datos de otros trabajadores, candidatos o clientes;
- estructura técnica del caso.

Que la misma identidad Auth tenga una relación laboral, comercial o de
candidatura no fusionará sus menús.

---

#### 16. Personas con múltiples roles o carriles

La interfaz no construirá una unión indiscriminada de todas las capacidades.

```text
ROL BASE
+
ROL OPERATIVO
+
DELEGACIÓN
+
SIMULACIÓN
≠ MENÚ ÚNICO CON TODO
```

Reglas:

1. el carril actual será explícito;
2. la tarea actual limitará la superficie operativa;
3. cambiar de carril reconstruirá contexto y relevancia;
4. una simulación mostrará claramente su condición;
5. la sesión personal real conservará atribución;
6. los filtros del backoffice no se convertirán en sede activa;
7. los permisos no relacionados permanecerán descubribles solo en su superficie.

---

#### 17. Dispositivos compartidos

```text
DISPOSITIVO AUTORIZADO
≠ ACTOR AUTORIZADO
≠ MENÚ PERMANENTE PARA TODO EL TURNO
```

En una estación compartida:

- el menú técnico permitido por el dispositivo es solo el límite máximo;
- cada actor obtiene una proyección nueva;
- las tareas del actor anterior se retiran;
- no se heredan favoritos, búsquedas, borradores o datos personales;
- las opciones sensibles permanecen ocultas;
- cambiar de trabajador limpia la superficie;
- una sesión sin actor muestra únicamente funciones realmente anónimas o de identificación.

La política de dispositivo no podrá usar `navigation_role` como sustituto del
actor humano definitivo.

---

#### 18. Proceso, etapa y recurso

Una acción será relevante únicamente cuando corresponda al estado vigente.

Ejemplo de remisiones:

```text
REQUESTED
→ solicitar o revisar solicitud

IN_PRODUCTION
→ producir o preparar según responsabilidad

READY_FOR_TRANSPORT
→ cargar o aceptar custodia de transporte

IN_TRANSIT
→ seguimiento y entrega

COMPLETED
→ consulta y cierre; no volver a preparar
```

No se mostrarán simultáneamente `Preparar`, `Despachar`, `Recibir`, `Cancelar`,
`Reabrir` y `Ajustar` si el estado, actor y extremo no lo permiten.

La mera visibilidad de un recurso tampoco habilita todas sus acciones.

---

#### 19. Territorio, propiedad y custodia

La relevancia deberá considerar:

- empresa;
- sede;
- área;
- tipo de área;
- recurso de origen y destino;
- asignación;
- custodia;
- relación operativa;
- territorio delegado.

Ejemplos:

```text
VER REMISIÓN HACIA MI SEDE
≠ EDITAR EL ORIGEN
```

```text
RECIBIR EN MI ÁREA
≠ PREPARAR EN EL ÁREA DE ORIGEN
```

```text
SUPERVISAR VARIAS SEDES
≠ MEZCLAR SUS TAREAS SIN INDICAR TERRITORIO
```

---

#### 20. Campos, columnas y datos sensibles

Ocultar funciones irrelevantes incluye minimizar datos dentro de una función
relevante.

Cada campo deberá clasificarse como:

```text
REQUIRED_FOR_ACTION
REQUIRED_FOR_DECISION
CONTEXT_ONLY
OPTIONAL_DETAIL
SENSITIVE_MASKED
SENSITIVE_HIDDEN
NOT_RELEVANT
```

El backend deberá evitar enviar datos que la interfaz no necesita.

No bastará con:

- esconder una columna con CSS;
- recortar visualmente un valor cargado;
- colocar el dato en un tab cerrado;
- confiar en que el usuario no abrirá DevTools;
- ocultar un botón manteniendo el comando expuesto.

---

#### 21. Conteos, badges, previews y estados agregados

Un elemento oculto no podrá filtrarse mediante:

- badge;
- total;
- contador;
- resumen;
- gráfico;
- tooltip;
- preview;
- autocompletado;
- nombre de archivo;
- texto de notificación;
- estado vacío.

Ejemplo:

```text
3 casos sensibles pendientes
```

puede revelar existencia y volumen incluso sin listar los casos.

Los agregados deberán usar el mismo alcance de visibilidad que sus detalles o
una proyección aprobada más restrictiva.

---

#### 22. Búsqueda, favoritos, recientes y deep links

Todos estos mecanismos recalcularán relevancia al momento de uso.

```text
FUE VISIBLE AYER
≠ ES RELEVANTE HOY
```

```text
ESTÁ EN FAVORITOS
≠ CONSERVA PERMISO
```

```text
CONOCE LA URL
≠ PUEDE DESCUBRIR EL RECURSO
```

Reglas:

- la búsqueda filtra antes de mostrar;
- los favoritos guardan identidad semántica, no autoridad;
- los recientes no revelan datos después de un cambio de actor;
- los deep links revalidan actor, contexto, recurso y estado;
- una redirección no mostrará el título sensible antes de autorizar;
- aliases legacy no reintroducen funciones retiradas.

---

#### 23. Navegación entre aplicaciones

Una aplicación consumidora podrá mostrar una acción cross-app solo cuando:

- la intención sea relevante;
- la aplicación propietaria esté disponible;
- exista visibilidad mínima autorizada;
- el enlace no transporte autoridad;
- el destino revalide todo el contexto.

Ejemplo:

```text
Revisar recepción de compra
Se abrirá en ORIGO
```

No se mostrarán todos los accesos del ecosistema en cada aplicación por el solo
hecho de que el usuario pueda abrirlos desde SHELL.

---

#### 24. Alertas y notificaciones

Una alerta será visible cuando exija:

- acción;
- conocimiento;
- decisión;
- seguimiento;
- escalamiento;
- cumplimiento.

No se enviarán alertas simplemente porque el actor puede consultar el dominio.

Toda alerta indicará:

- por qué le corresponde;
- qué requiere;
- fecha o urgencia;
- recurso mínimo;
- canal de resolución.

Las notificaciones respetarán masking y no incluirán datos irrelevantes en la
pantalla bloqueada del dispositivo.

---

#### 25. Estados vacíos

Se distinguirán:

```text
NO HAY DATOS EN EL ALCANCE
NO HAY TRABAJO PARA ESTE ACTOR
NO HAY TRABAJO EN ESTE CONTEXTO
EXISTE TRABAJO, PERO NO ES VISIBLE
FALTA SELECCIONAR CONTEXTO
LA INFORMACIÓN NO PUDO CARGARSE
LA PROYECCIÓN ESTÁ DESACTUALIZADA
```

No se afirmará `No existen registros` cuando el sistema solo sabe que no puede
mostrarlos.

El estado vacío tampoco ofrecerá crear, configurar o importar si esas acciones
no son relevantes y autorizadas.

---

#### 26. Cambios de contexto y consistencia

La proyección deberá invalidarse cuando cambie materialmente:

- actor efectivo;
- rol operativo;
- sede;
- área;
- turno;
- check-in;
- dispositivo;
- permiso;
- asignación;
- estado del proceso;
- custodia;
- delegación;
- simulación;
- sensibilidad;
- vigencia.

Una interfaz no podrá conservar controles de un contexto anterior después de
cambiar de sede, actor o carril.

---

#### 27. Offline, caché y datos obsoletos

La experiencia offline usará una proyección con vigencia y fingerprint.

Estados mínimos:

```text
FRESH
STALE_READ_ONLY
OFFLINE_ALLOWED
REFRESH_REQUIRED
REVOKED
```

Reglas:

- no aparecerán nuevas capacidades por usar una caché antigua;
- una revocación prevalecerá al reconectar;
- funciones sensibles podrán desaparecer offline;
- tareas ya iniciadas conservarán únicamente el mínimo necesario;
- una acción local se revalidará antes de sincronizar;
- el cambio de actor limpiará la caché personal de la estación;
- un menú cacheado nunca será una fuente de autorización.

---

#### 28. Accesibilidad

Ocultar y deshabilitar deberá ser accesible:

- un elemento oculto no permanecerá en el árbol accesible ni en el tab order;
- un control deshabilitado relevante tendrá explicación accesible;
- no se dependerá únicamente de opacidad o color;
- no se anunciarán controles que no pueden utilizarse;
- la acción principal mantendrá orden lógico de foco;
- los cambios dinámicos importantes se anunciarán sin saturación;
- la reducción de opciones no eliminará rutas necesarias para teclado o lector;
- el nombre accesible conservará intención y contexto.

---

#### 29. Seguridad, salud, cumplimiento y obligaciones críticas

La minimización no ocultará:

- alertas de seguridad;
- riesgos de custodia;
- requerimientos legales;
- documentos obligatorios;
- conflictos de segregación;
- salidas de emergencia del proceso;
- acciones para reportar incidentes;
- mecanismos de soporte;
- bloqueos que impiden una operación segura.

Estas funciones podrán tener prioridad superior a la personalización y al
orden habitual.

---

#### 30. Personalización

La persona podrá, dentro de límites aprobados:

- ordenar accesos secundarios;
- fijar funciones frecuentes;
- contraer grupos;
- conservar preferencias de visualización.

No podrá:

- hacer visible una función no autorizada;
- ocultar una obligación crítica;
- convertir una acción excepcional en primaria;
- renombrar una acción de forma engañosa;
- compartir preferencias personales con otro actor de una estación;
- fijar un recurso sensible fuera de su alcance.

---

#### 31. Excepciones y acciones avanzadas

Una función excepcional no se considerará relevante por el solo hecho de que el
actor pueda solicitarla.

El flujo ordinario mostrará, cuando proceda:

```text
Resolver mediante excepción
```

Luego abrirá una superficie separada con:

- autoridad;
- motivo estructurado;
- evidencia;
- vigencia;
- impacto;
- aprobación;
- auditoría;
- retorno al flujo.

La definición detallada de excepciones visuales corresponde además a
`UX-BASE-009` y la divulgación de opciones avanzadas a `UX-BASE-010`.

---

#### 32. Aplicación por producto

| Producto | Ejemplos de relevancia contextual                                               |
| -------- | ------------------------------------------------------------------------------- |
| SHELL    | mostrar aplicaciones e intenciones disponibles, no todas las rutas internas     |
| ANIMA    | priorizar jornada, turno y acciones personales; separar herramientas de manager |
| NEXO     | mostrar trabajo de inventario y logística según etapa, custodia, sede y rol     |
| FOGO     | diferenciar ejecución productiva, supervisión, liberación y edición de recetas  |
| ORIGO    | separar recepción física, compras, aprobación y maestro de proveedores          |
| PULSO    | separar venta, servicio, cierre, configuración comercial y auditoría            |
| VISO     | proyectar backoffice por responsabilidad sin convertirse en menú universal      |
| NUMERA   | limitar datos y acciones por entidad, periodo, función financiera y segregación |
| TALENTO  | separar candidato, reclutador, evaluador, decisor y administrador laboral       |
| PASS     | mostrar únicamente experiencia del cliente y acciones propias                   |
| AURA     | separar creación, revisión, publicación, campañas y configuración               |

Estas son reglas de clasificación; no diseñan todavía cada pantalla.

---

#### 33. Estado AS-IS y migración

La infraestructura actual ya separa, en ciertos puntos:

- registro de pantalla;
- navegación activa;
- etiqueta;
- ruta;
- permiso requerido;
- disponibilidad;
- orden.

Sin embargo, esa separación no prueba que exista todavía una política canónica
de relevancia por tarea, actor, etapa, territorio, dispositivo y sensibilidad.

La migración posterior seguirá:

```text
INVENTARIAR SUPERFICIES Y ELEMENTOS
→ ASIGNAR IDENTIDAD SEMÁNTICA
→ CLASIFICAR ACTORES Y CARRILES
→ ASIGNAR REQUISITOS DE CONTEXTO
→ DEFINIR ESTADO DE PRESENTACIÓN
→ PROTOTIPAR
→ VALIDAR CON ACTORES REALES
→ IMPLEMENTAR PROYECCIÓN Y PROTECCIÓN
→ MEDIR
→ RETIRAR ELEMENTOS LEGACY
```

No se ejecutará un ocultamiento masivo antes de inventariar dependencias, deep
links, contingencias, soporte y reemplazos.

---

#### 34. Propiedad de decisiones posteriores

| Decisión pendiente                        | Tarea responsable                                        |
| ----------------------------------------- | -------------------------------------------------------- |
| contexto visible y cambio de contexto     | `UX-BASE-005`                                            |
| mensajes de bloqueo                       | `UX-BASE-006`                                            |
| duplicidad de captura                     | `UX-BASE-007`                                            |
| reducción de pasos                        | `UX-BASE-008`                                            |
| acciones excepcionales                    | `UX-BASE-009`                                            |
| opciones avanzadas                        | `UX-BASE-010`                                            |
| tablet, kiosco y táctil                   | `UX-BASE-011`                                            |
| densidad administrativa                   | `UX-BASE-012`                                            |
| conectividad inestable                    | `UX-BASE-013`                                            |
| reanudación                               | `UX-BASE-014`                                            |
| validación terminológica                  | `UX-BASE-015`                                            |
| diseño de estación y composición          | `UX-STATION-002` a `UX-STATION-012`                      |
| clasificación de rutas y pantallas reales | `AUTH-UI-001` a `AUTH-UI-060`                            |
| contrato detallado de pantallas           | `PROC-SCREEN-001` a `PROC-SCREEN-028`                    |
| diseño concreto por producto              | roadmaps UX de cada aplicación                           |
| implementación de autorización            | `AUTH-DB-*`, `AUTH-SRV-*` y paquetes de aplicación       |
| pruebas y certificación                   | `UX-QA-001` a `UX-QA-030`; `AUTH-QA-001` a `AUTH-QA-030` |

No queda ningún pendiente narrativo sin tarea.

---

#### 35. Métricas y guardrails

Se medirán, por actor, carril, superficie y contexto:

- cantidad de opciones visibles;
- uso de acción primaria;
- apertura de opciones secundarias;
- búsquedas para encontrar trabajo;
- intentos sobre funciones no relevantes;
- llegada por deep link;
- denegaciones después de mostrar una acción;
- cambios de contexto;
- tiempo hasta la primera acción válida;
- errores por selección de función equivocada;
- uso de excepciones;
- elementos nunca utilizados;
- bloqueos sin explicación;
- diferencias entre dispositivo personal y compartido;
- resultados de pruebas con trabajadores reales.

Guardrails:

- no reducir opciones ocultando obligaciones;
- no considerar éxito la ausencia de clics sobre una función necesaria;
- no ampliar visibilidad para disminuir tickets de soporte;
- no penalizar al trabajador por no encontrar una función mal ubicada;
- no usar telemetría para inferir atributos sensibles;
- no medir datos personales innecesarios;
- no optimizar exclusivamente para usuarios expertos.

---

#### 36. Antipatrones prohibidos

```text
TIENE PERMISO = MOSTRAR SIEMPRE
```

```text
NO TIENE PERMISO = BOTÓN DESHABILITADO EN TODAS PARTES
```

```text
OCULTAR BOTÓN = SEGURIDAD
```

```text
ROL GERENTE = MENÚ COMPLETO
```

```text
DISPOSITIVO COMPARTIDO = MENÚ DEL ÚLTIMO TRABAJADOR
```

```text
RUTA CONOCIDA = RECURSO DESCUBRIBLE
```

```text
TAB CERRADO = DATO PROTEGIDO
```

```text
BADGE SIN DETALLE = NO REVELA INFORMACIÓN
```

```text
PERSONALIZACIÓN = IGNORAR OBLIGACIONES
```

```text
SIN FILAS VISIBLES = NO EXISTEN REGISTROS
```

```text
MÁS OPCIONES = MÁS PODER DEL USUARIO
```

```text
MENOS OPCIONES = MEJOR UX SIN MEDIR RESULTADOS
```

---

#### 37. Requisitos de prueba derivados

**Resultado:** GENERA 18 REQUISITOS DE PRUEBA.

Se incorporan en el registro canónico:

```text
TREQ-UX-059 a TREQ-UX-076
```

Protegen:

1. separación entre autorización, relevancia, visibilidad y ejecución;
2. resolución contextual autoritativa;
3. tratamiento de funciones no autorizadas y acceso directo;
4. reglas de ocultar, deshabilitar y explicar;
5. minimización de superficies operativas;
6. relevancia administrativa;
7. múltiples roles, carriles y simulación;
8. aislamiento en dispositivos compartidos;
9. proceso, estado, recurso, territorio y custodia;
10. minimización de datos y campos;
11. prevención de filtraciones por agregados;
12. búsqueda, favoritos, recientes y deep links;
13. navegación cross-app y alertas;
14. estados vacíos correctos;
15. caché, offline e invalidación;
16. accesibilidad de ocultamiento y bloqueo;
17. separación de excepciones, configuración y auditoría;
18. telemetría, migración y validación con actores reales.

---

#### 38. Criterios de aceptación

`UX-BASE-004` podrá aprobarse cuando:

- [ ] autorización y relevancia están separadas;
- [ ] `AUTHORIZED`, `RELEVANT`, `VISIBLE`, `DISCOVERABLE`, `ENABLED`, `ACTIONABLE` y `REQUIRED` tienen semántica inequívoca;
- [ ] la unidad de relevancia cubre rutas, vistas, acciones, campos, datos, alertas y resultados;
- [ ] las dimensiones de actor, tarea, proceso, contexto, dispositivo, sensibilidad y tiempo están definidas;
- [ ] la proyección contextual no depende de autoridad declarada por frontend;
- [ ] existen estados `PRIMARY`, `SECONDARY`, `DISCOVERABLE`, `CONTEXTUAL_DISABLED`, `REQUIRED_BLOCKED` y `HIDDEN`;
- [ ] ocultar, deshabilitar y explicar tienen reglas distintas;
- [ ] una obligación crítica no puede desaparecer por simplificación;
- [ ] las superficies operativas excluyen administración y configuración irrelevantes;
- [ ] las superficies administrativas conservan alcance y segregación;
- [ ] supervisión no equivale a ejecución ni corrección;
- [ ] configuración y auditoría permanecen separadas del flujo ordinario;
- [ ] identidades de trabajador, candidato, cliente y usuario Auth no fusionan sus menús;
- [ ] múltiples roles no generan una unión indiscriminada de capacidades;
- [ ] dispositivos compartidos reconstruyen relevancia por actor;
- [ ] proceso, etapa, recurso, territorio y custodia condicionan acciones visibles;
- [ ] campos y agregados aplican minimización y masking;
- [ ] búsqueda, favoritos, recientes y deep links revalidan relevancia;
- [ ] cross-app no convierte SHELL en propietario universal;
- [ ] alertas se dirigen únicamente a quien debe conocer o actuar;
- [ ] estados vacíos no confunden ausencia con falta de visibilidad;
- [ ] cambios de contexto invalidan controles incompatibles;
- [ ] offline y caché no conservan capacidades revocadas;
- [ ] ocultamiento y deshabilitación son accesibles;
- [ ] personalización no puede ampliar acceso ni ocultar obligaciones;
- [ ] excepciones y opciones avanzadas conservan tareas responsables posteriores;
- [ ] la migración legacy exige inventario, prototipo, validación y rollback;
- [ ] todos los pendientes están asignados a tareas exactas;
- [ ] no se implementó código ni se modificó una decisión aprobada;
- [ ] `UX-BASE-005` permanece sin iniciar.

---

#### 39. Estado y continuidad

```text
UX-BASE-003   APROBADA
UX-BASE-004   APROBADA
UX-BASE-005   NO INICIADA
```

No se inicia `UX-BASE-005` hasta aprobación expresa de esta tarea.


### ✅ UX-BASE-005 — Mantener visible sede, área, turno y rol activos

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `UX-BASE-004 — Ocultar funciones irrelevantes para el actor` — APROBADA  
**Siguiente tarea reservada:** `UX-BASE-006 — Explicar bloqueos con lenguaje humano`  
**Artefacto producido:** `UX-ACTIVE-CONTEXT-VISIBILITY-CONTRACT-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069` y procesos futuros incorporados al catálogo canónico  
**Aplicaciones cubiertas:** SHELL, ANIMA, NEXO, FOGO, ORIGO, PULSO, VISO, NUMERA, TALENTO, PASS, AURA y aplicaciones futuras de Vento OS  
**Naturaleza:** principio transversal de visibilidad, comprensión, vigencia, transición, accesibilidad y seguridad perceptual del contexto activo  
**Cambios en código, componentes, rutas, permisos, roles, tablas, RLS, RPC, Supabase o aplicaciones:** no autorizados

---

#### 1. Propósito

Definir el contrato mediante el cual toda superficie de Vento OS deberá mantener
visible, comprensible y verificable el contexto bajo el que una persona consulta,
decide o ejecuta una acción.

El trabajador deberá poder responder sin abrir configuración ni interpretar
identificadores técnicos:

```text
¿EN QUÉ SEDE ESTOY OPERANDO?
¿EN QUÉ ÁREA?
¿QUÉ TURNO O JORNADA ESTÁ VIGENTE?
¿CON QUÉ ROL ESTOY ACTUANDO?
¿ESTE CONTEXTO ESTÁ VÁLIDO, CAMBIANDO, VENCIDO O BLOQUEADO?
```

El contexto visible deberá reducir errores territoriales, atribuciones falsas,
operaciones ejecutadas bajo otro rol y decisiones tomadas sobre un alcance que
la persona no comprendía.

---

#### 2. Continuidad lógica

```text
SEPARAR CARRILES
UX-BASE-001
        ↓
MOSTRAR LA TAREA ACTUAL
UX-BASE-002
        ↓
NAVEGAR EN LENGUAJE HUMANO
UX-BASE-003
        ↓
MOSTRAR SOLO LO RELEVANTE
UX-BASE-004
        ↓
HACER VISIBLE EL CONTEXTO ACTIVO
UX-BASE-005
        ↓
EXPLICAR BLOQUEOS
UX-BASE-006
```

`UX-BASE-005` no diseña todavía un header definitivo ni un componente visual
único. Define la información, semántica, persistencia y comportamiento que
posteriormente deberán materializar SHELL, las aplicaciones, las estaciones y
las pantallas reales.

---

#### 3. Problema que se corrige

Una pantalla puede mostrar la tarea correcta y aun así inducir una operación
incorrecta cuando la persona no sabe claramente:

- en qué sede está actuando;
- si el área corresponde a la tarea;
- si el turno sigue activo;
- si está usando rol base, rol operativo, delegación o simulación;
- si una sede visible es solo un filtro administrativo;
- si el recurso pertenece a otro territorio;
- si el contexto proviene de un dispositivo compartido;
- si la información quedó obsoleta por un cambio reciente;
- si la aplicación todavía está resolviendo un cambio de contexto.

No se considera suficiente:

```text
MOSTRAR EL NOMBRE DE LA SEDE EN ALGÚN MENÚ
```

ni:

```text
GUARDAR selected_site_id EN UNA COOKIE
```

ni:

```text
INFERIR EL ROL DESDE LA RUTA ABIERTA
```

---

#### 4. Decisión principal

Toda superficie que permita ejecutar, confirmar, aprobar, rechazar, corregir,
transferir custodia, publicar, conciliar o registrar evidencia deberá mostrar
un **resumen persistente del contexto efectivo aplicable a la acción**.

Regla canónica:

```text
CONTEXTO RESUELTO POR FUENTE AUTORITATIVA
        ↓
PROYECCIÓN HUMANA, COMPACTA Y PERSISTENTE
        ↓
ACCIÓN COHERENTE CON ESE CONTEXTO
```

La proyección visible no será fuente de autoridad. Representará el contexto que
el servidor resolvió y permitirá a la persona detectar errores antes de actuar.

```text
CONTEXTO MOSTRADO
≠ CONTEXTO DECLARADO POR EL CLIENTE
≠ PERMISO
≠ DECISIÓN DE AUTORIZACIÓN
```

---

#### 5. Conceptos que deben permanecer separados

| Concepto                     | Significado                                      | Puede presentarse como contexto operativo activo |
| ---------------------------- | ------------------------------------------------ | -----------------------------------------------: |
| Sede asignada                | Relación laboral vigente con una sede            |                                               No |
| Sede primaria                | Referencia laboral principal                     |                                               No |
| Sede seleccionada            | Preferencia o filtro de navegación               |                                               No |
| Sede administrativa filtrada | Territorio consultado en backoffice              |                                               No |
| Sede operativa activa        | Sede del turno o contexto operativo vigente      |                                               Sí |
| Sede del recurso             | Territorio real del objeto afectado              |                 Solo como territorio del recurso |
| Área asignada                | Relación laboral con un área                     |                                               No |
| Área seleccionada            | Filtro o preferencia visual                      |                                               No |
| Área operativa activa        | Área vigente para la ejecución                   |                                               Sí |
| Turno publicado              | Jornada programada                               |                                No necesariamente |
| Check-in activo              | Presencia o inicio de jornada confirmado         |                                   No por sí solo |
| Turno operativo activo       | Turno vigente asociado al contexto de trabajo    |                                               Sí |
| Rol base                     | Autoridad administrativa permanente o funcional  |                            No como rol operativo |
| Rol operativo                | Función temporal ejecutada en el contexto activo |                                               Sí |
| Rol simulado                 | Escenario de simulación autorizado               |                      Sí, marcado como simulación |
| Rol de navegación            | Recorte técnico o legacy de menú                 |                                               No |

Principio obligatorio:

```text
ASIGNADO
≠ ACTIVO
≠ SELECCIONADO
≠ FILTRADO
≠ TERRITORIO DEL RECURSO
```

---

#### 6. Unidad de contexto visible

La unidad mínima será:

```text
ACTOR EFECTIVO
+
CARRIL DE EXPERIENCIA
+
SEDE ACTIVA O ALCANCE ADMINISTRATIVO
+
ÁREA ACTIVA CUANDO APLIQUE
+
TURNO Y ESTADO DE CHECK-IN CUANDO APLIQUEN
+
ROL EFECTIVO
+
DISPOSITIVO O SIMULACIÓN CUANDO ALTEREN LA INTERPRETACIÓN
+
FRESCURA DEL CONTEXTO
```

No todos los campos deberán mostrarse con el mismo peso, pero ninguno de los
componentes materiales podrá quedar implícito cuando cambie el significado de
la acción.

---

#### 7. Contrato conceptual de proyección

Forma documental objetivo:

```ts
type ActiveContextPresentation = {
  presentation_state:
    | "RESOLVING"
    | "ACTIVE"
    | "CHANGING"
    | "STALE"
    | "INVALID"
    | "UNAVAILABLE";

  experience_lane:
    | "OPERATIONAL_EXECUTION"
    | "OPERATIONAL_SUPERVISION"
    | "ADMINISTRATIVE_WORK"
    | "CONFIGURATION_GOVERNANCE"
    | "AUDIT_ANALYTICS"
    | "PERSONAL_CUSTOMER_CANDIDATE";

  actor_label: string | null;
  site_label: string | null;
  area_label: string | null;
  shift_label: string | null;
  check_in_state: string | null;
  effective_role_label: string | null;
  base_role_label: string | null;
  device_label: string | null;
  simulation_label: string | null;
  administrative_scope_label: string | null;
  resource_scope_label: string | null;
  resolved_at: string | null;
  expires_at: string | null;
  context_reference: string | null;
};
```

Esta forma es contractual y no autoriza implementar un tipo, componente, RPC o
tabla con estos nombres exactos.

---

#### 8. Fuente de verdad

La proyección deberá derivarse de hechos autoritativos resueltos en servidor,
como los definidos por `AccessContext` y la decisión de autorización.

No serán fuentes de verdad:

- query parameters;
- ruta abierta;
- localStorage;
- estado de React;
- cookie no validada;
- selector de sede;
- último contexto utilizado;
- nombre del usuario;
- nombre de la aplicación;
- `navigation_role`;
- rol enviado por el frontend;
- dispositivo sin resolver actor;
- texto contenido en una tarjeta;
- tarea almacenada localmente sin revalidar.

El cliente podrá solicitar un cambio, pero no declarar que el cambio ya es
válido.

---

#### 9. Composición humana del resumen

Ejemplo operativo completo:

```text
Vento Café · Barra
Turno 14:00–22:00 · Check-in activo
Barista
```

Ejemplo en Centro de Producción:

```text
Centro de Producción · Repostería
Turno 06:00–14:00 · Check-in activo
Auxiliar de producción
```

Ejemplo administrativo:

```text
Administración · Alcance: Vento Café y Saudo
Rol base: Gerente
Periodo filtrado: semana actual
```

Ejemplo de dispositivo compartido:

```text
Tablet Barra 01 · Vento Café · Barra
Actora: María Pérez · Barista
Turno activo hasta las 22:00
```

Ejemplo de simulación:

```text
SIMULACIÓN
Supervisor · Vento Café
No representa la autoridad real de la sesión
```

Se mostrarán nombres humanos y, cuando ayuden a identificar una instancia,
códigos empresariales secundarios. No se expondrán UUID, nombres de tablas ni
códigos internos como contenido principal.

---

#### 10. Persistencia visual

El contexto deberá mantenerse perceptible durante toda acción material.

Superficies de escritorio o tablet:

- encabezado o barra persistente;
- resumen compacto siempre visible;
- detalle expandible sin abandonar la tarea;
- advertencia prominente ante inconsistencias.

Superficies móviles:

- resumen compacto fijo o recurrente en la zona superior;
- no depender exclusivamente de un drawer cerrado;
- acceso de un toque al detalle;
- cambio material anunciado antes de continuar.

Kioscos o estaciones:

- sede, área o estación visibles permanentemente;
- actor humano visible cuando exista;
- rol operativo visible;
- ausencia de actor claramente diferenciada.

No será válido ocultar todo el contexto dentro del menú de perfil.

---

#### 11. Jerarquía visual

El orden ordinario será:

```text
1. ALERTA DE CONTEXTO INVÁLIDO O EN CAMBIO
2. SEDE Y ÁREA ACTIVAS
3. ROL EFECTIVO
4. TURNO Y CHECK-IN
5. ACTOR O DISPOSITIVO CUANDO SEA NECESARIO
6. DETALLES SECUNDARIOS
```

La jerarquía podrá adaptarse al proceso. Por ejemplo, en una estación fija la
sede y área pueden ser estables y el actor puede ser el dato que más cambia.

La visibilidad no dependerá solo de color. Se utilizarán texto, estructura,
íconos accesibles y estados explícitos.

---

#### 12. Turno publicado, turno activo y check-in

La interfaz deberá distinguir:

```text
TURNO PROGRAMADO
→ existe en la planificación

TURNO VIGENTE
→ corresponde al instante y actor

CHECK-IN ACTIVO
→ la presencia o inicio fue confirmado

CONTEXTO OPERATIVO ACTIVO
→ turno, check-in, rol, sede, área y demás condiciones son coherentes
```

No se mostrará simplemente `En turno` cuando solo exista una programación.

Estados humanos mínimos:

- `Turno próximo`;
- `Turno vigente, falta iniciar jornada`;
- `Jornada activa`;
- `Turno finalizado, cierre pendiente`;
- `Jornada activa sin turno programado`, cuando la política lo permita;
- `Contexto de turno inconsistente`;
- `Sin turno operativo aplicable`.

Los horarios deberán mostrar la zona horaria empresarial aplicable y evitar
ambigüedad en cambios de día.

---

#### 13. Rol base y rol operativo

Cuando ambos existan, se mostrarán con propósito distinto.

Ejemplo:

```text
Rol operativo: Bodeguero
Autoridad administrativa: Supervisor de sede
```

La acción operativa utilizará el rol operativo efectivo. La existencia de un
rol base no deberá presentarse como autorización para ejecutar cualquier acción.

Reglas:

1. nunca se fusionarán en una etiqueta ambigua;
2. el rol operativo activo será singular por acción ordinaria;
3. una delegación tendrá etiqueta, vigencia y alcance;
4. un permiso temporal no cambiará silenciosamente el nombre del rol;
5. la simulación se mostrará de forma persistente y diferenciada;
6. `navigation_role` no se mostrará como rol laboral.

---

#### 14. Contexto administrativo

Las superficies administrativas no inventarán un turno operativo cuando no sea
necesario.

Mostrarán:

- rol base efectivo;
- empresa o cobertura administrativa;
- sedes o áreas filtradas;
- periodo;
- simulación o delegación;
- sensibilidad o alcance especial cuando corresponda.

Deberán utilizar textos como:

```text
Alcance administrativo: sedes asignadas
Filtro actual: Vento Café
```

No:

```text
Sede activa: Vento Café
```

si la persona solo está consultando información administrativa de esa sede.

```text
FILTRO ADMINISTRATIVO
≠ CONTEXTO OPERATIVO ACTIVO
```

---

#### 15. Cambio de sede, área, turno o rol

No existirá un selector genérico que cambie silenciosamente el contexto activo.

La transición deberá seguir:

```text
SOLICITAR CAMBIO
→ VALIDAR ELEGIBILIDAD
→ REVISAR TRABAJO Y CUSTODIA PENDIENTES
→ CONFIRMAR EFECTO
→ RESOLVER NUEVO CONTEXTO EN SERVIDOR
→ INVALIDAR PROYECCIONES ANTERIORES
→ MOSTRAR NUEVO CONTEXTO
→ REANUDAR O REDIRIGIR
```

Antes del cambio se deberá tratar:

- tarea en ejecución;
- claim o lease;
- borrador;
- custodia;
- formulario sensible;
- operación offline pendiente;
- dispositivo compartido;
- aprobación abierta;
- sesión simulada.

El cambio no se considerará efectivo hasta recibir confirmación autoritativa.

---

#### 16. Contextos múltiples

Una persona puede tener:

- varias sedes asignadas;
- varias áreas asignadas;
- varios roles disponibles;
- rol base y rol operativo simultáneos;
- cobertura administrativa multisede;
- varios turnos futuros.

Eso no produce varios contextos operativos activos simultáneos para una misma
acción ordinaria.

```text
MÚLTIPLES OPCIONES ELEGIBLES
≠ MÚLTIPLES CONTEXTOS ACTIVOS
```

La interfaz deberá indicar cuál está activo y cuáles son únicamente opciones,
asignaciones o filtros.

---

#### 17. Territorio del recurso

Cuando el recurso pertenezca a una sede o área distinta del contexto operativo,
la interfaz deberá mostrar ambos territorios y resolver la compatibilidad.

Ejemplo:

```text
Estás operando en:
Centro de Producción · Bodega

La remisión tiene destino:
Vento Café · Recepción
```

Esto no representa una inconsistencia cuando el proceso requiere dos extremos.

Sí será inconsistencia cuando la acción exige operar sobre la sede del recurso y
el actor no se encuentra en ella.

Estados:

```text
COMPATIBLE_CROSS_TERRITORY
CONTEXT_SWITCH_REQUIRED
ADMINISTRATIVE_SCOPE_ONLY
RESOURCE_OUT_OF_SCOPE
CONTEXT_CONFLICT
```

La interfaz no ocultará el conflicto ni sustituirá automáticamente la sede del
recurso por la sede activa.

---

#### 18. Dispositivos compartidos

En un dispositivo compartido deberán distinguirse permanentemente:

```text
DISPOSITIVO TÉCNICO
ESTACIÓN Y TERRITORIO
ACTOR HUMANO
ROL OPERATIVO DEL ACTOR
TURNO Y CHECK-IN DEL ACTOR
```

Ejemplo:

```text
Kiosco Bodega CP
Centro de Producción · Bodega
Operando: Carlos Gómez · Bodeguero
Jornada activa
```

Sin actor identificado:

```text
Kiosco Bodega CP
Centro de Producción · Bodega
Ningún trabajador identificado
Acciones personales bloqueadas
```

El usuario técnico del dispositivo nunca se mostrará como trabajador.

Al cambiar de actor se limpiarán inmediatamente:

- nombre y avatar anteriores;
- tarea y cola personales;
- rol;
- borradores;
- búsquedas;
- datos sensibles;
- claims incompatibles.

---

#### 19. Navegación entre aplicaciones

SHELL y cada aplicación podrán presentar el mismo contexto mediante una
proyección normalizada.

Un salto entre aplicaciones deberá transportar únicamente una referencia segura
y revalidar en destino:

```text
ACTOR
ROL
SEDE
ÁREA
TURNO
CHECK-IN
DISPOSITIVO
SIMULACIÓN
FRESCURA
```

La aplicación de destino no confiará en etiquetas, query params ni datos del
cliente.

Si el contexto no puede reconstruirse, deberá mostrar:

```text
No pudimos confirmar el contexto con el que abriste esta tarea.
Actualiza o vuelve a seleccionar una jornada válida.
```

No ejecutará la acción con un fallback permisivo.

---

#### 20. Cambios durante una tarea

Cuando cambie materialmente el contexto mientras una pantalla está abierta:

1. se invalidará la acción pendiente;
2. se conservará el borrador permitido;
3. se marcará qué información quedó guardada;
4. se impedirá confirmar con el contexto anterior;
5. se explicará el cambio;
6. se ofrecerá recargar, guardar, transferir o cancelar según el proceso;
7. se revalidará el recurso y la versión.

Eventos materiales incluyen:

- check-out;
- fin o cancelación de turno;
- cambio de rol;
- revocación de permiso;
- cambio de actor;
- cambio de dispositivo;
- reasignación de sede o área;
- cierre de simulación;
- expiración de delegación;
- pérdida de custodia;
- cierre del recurso.

---

#### 21. Estados de resolución y frescura

La presentación deberá declarar uno de estos estados:

```text
RESOLVING
ACTIVE
CHANGING
STALE
INVALID
UNAVAILABLE
```

Semántica:

| Estado        | Comportamiento                                                                 |
| ------------- | ------------------------------------------------------------------------------ |
| `RESOLVING`   | No presentar valores legacy como confirmados; bloquear mutaciones dependientes |
| `ACTIVE`      | Contexto vigente y utilizable para la superficie                               |
| `CHANGING`    | Cambio solicitado, todavía no confirmado                                       |
| `STALE`       | Último contexto conocido; lectura limitada según política                      |
| `INVALID`     | Contradicción o vencimiento; mutaciones bloqueadas                             |
| `UNAVAILABLE` | No fue posible resolver; no inventar fallback                                  |

El usuario deberá conocer cuándo se resolvió el contexto y, cuando importe,
hasta cuándo es válido.

---

#### 22. Conectividad inestable y offline

El modo offline no podrá presentar como activo un contexto cuya vigencia no
puede sostenerse.

La superficie podrá mostrar:

```text
Última verificación: 14:32
Trabajando sin conexión
Algunas acciones se confirmarán al recuperar internet
```

Cada acción tendrá una política:

- `READ_ONLY_WHILE_STALE`;
- `CAPTURE_ALLOWED_REVALIDATE_BEFORE_SYNC`;
- `LEASED_OFFLINE_EXECUTION`;
- `ONLINE_CONFIRMATION_REQUIRED`;
- `NOT_AVAILABLE_OFFLINE`.

La pérdida de conexión no cambiará el rol, sede o área; tampoco prolongará un
turno o permiso expirado.

---

#### 23. Contexto inexistente o inválido

Cuando falte una dimensión obligatoria, la interfaz no usará valores por defecto
para parecer funcional.

Ejemplos:

```text
No hay sede operativa activa
```

```text
Tu jornada está activa, pero no tiene un área válida
```

```text
Este dispositivo está autorizado, pero falta identificar al trabajador
```

```text
Tu rol operativo ya no está vigente
```

Cada estado deberá indicar:

- qué falta o es inconsistente;
- qué quedó disponible;
- qué acciones están bloqueadas;
- cómo resolverlo;
- quién puede ayudar;
- referencia segura para soporte.

La redacción detallada de bloqueos corresponde a `UX-BASE-006`.

---

#### 24. Simulación, delegación y soporte

Una simulación deberá permanecer visible en toda superficie afectada:

```text
SIMULACIÓN ACTIVA
Viendo como: Supervisor de Vento Café
No estás actuando con el contexto real de tu cuenta
```

Una delegación mostrará:

- autoridad delegada;
- alcance;
- concedente;
- vigencia;
- motivo cuando pueda mostrarse;
- salida de la delegación.

El soporte técnico no podrá asumir silenciosamente el contexto de una persona.
Cualquier impersonación autorizada tendrá señal persistente, auditoría y
prohibición de ocultarse mediante navegación.

---

#### 25. Datos sensibles y privacidad

El resumen visible deberá aplicar minimización:

- mostrar nombre humano solo cuando sea necesario;
- no mostrar documento de identidad;
- no mostrar correo o teléfono como identificador ordinario;
- evitar datos laborales sensibles en pantallas públicas;
- ocultar actor cuando la superficie externa no lo necesita;
- no incluir contexto sensible completo en notificaciones;
- impedir que el contexto del trabajador anterior quede en un kiosco.

El `context_reference` será opaco y no contendrá tokens, permisos, roles,
identificadores personales directos ni claims autoritativos en una URL.

---

#### 26. Accesibilidad

La visibilidad contextual deberá cumplir:

1. etiquetas textuales, no solo color o icono;
2. orden de lectura coherente;
3. anuncio accesible cuando cambie un contexto material;
4. foco dirigido a la alerta cuando el cambio bloquea una acción;
5. detalle disponible por teclado y lector de pantalla;
6. contraste suficiente para estados;
7. área táctil adecuada;
8. abreviaturas con nombre comprensible;
9. contexto no oculto por zoom o reflow;
10. no repetir contenido de forma excesiva en cada control.

El resumen persistente podrá usar una región accesible y los cambios críticos
podrán anunciarse con prioridad apropiada, sin producir ruido constante.

---

#### 27. Responsabilidades por capa

| Capa                    | Responsabilidad                                                                       |
| ----------------------- | ------------------------------------------------------------------------------------- |
| `AccessContext`         | Resolver hechos de identidad, trabajo, rol, territorio, turno, dispositivo y vigencia |
| `AuthorizationDecision` | Determinar si una acción concreta está permitida                                      |
| SHELL                   | Proyectar contexto transversal y coordinar saltos sin declararlo                      |
| Aplicación propietaria  | Revalidar, mostrar contexto relevante y ejecutar comandos                             |
| ANIMA                   | Gestionar experiencia personal de jornada y check-in autorizada                       |
| VISO                    | Administrar asignaciones, turnos y decisiones laborales                               |
| Estación compartida     | Mostrar terminal, territorio y actor sin fusionarlos                                  |
| Backend                 | Rechazar contexto declarado por cliente y mantener fail closed                        |
| Frontend                | Representar el contexto y detectar incoherencias antes de actuar                      |

---

#### 28. Antipatrones prohibidos

```text
selectedSite = activeSite
```

```text
employee.site_id = contexto operativo
```

```text
rol del usuario = rol operativo vigente
```

```text
navigation_role = autoridad empresarial
```

```text
si la URL contiene site_id, cambiar sede
```

```text
si el contexto falla, usar sede primaria
```

```text
si es gerente, ocultar turno y permitir todo
```

```text
si el dispositivo tiene área, atribuirle las acciones
```

```text
mostrar contexto solo en el menú de perfil
```

```text
cambiar el selector antes de confirmar el servidor
```

---

#### 29. Aplicación por producto

| Producto | Contexto mínimo esperado                                                  |
| -------- | ------------------------------------------------------------------------- |
| SHELL    | actor, carril, aplicación, sede/alcance, rol y estado del contexto        |
| ANIMA    | trabajador, jornada, sede, área, rol operativo y estado de check-in       |
| NEXO     | actor, sede, área/estación, rol, turno y territorio del recurso           |
| FOGO     | actor, sede, área productiva, rol, turno, lote o estación cuando aplique  |
| ORIGO    | carril, sede receptora o alcance administrativo, rol y recurso de compra  |
| PULSO    | sede comercial, punto/estación, actor, rol y jornada                      |
| VISO     | rol base, cobertura administrativa, filtros y simulación/delegación       |
| NUMERA   | entidad, periodo, alcance financiero y rol; sin fingir contexto operativo |
| TALENTO  | candidato o actor interno, proceso, alcance y rol; sin fusionarlos        |
| PASS     | cliente y negocio consultado, sin mostrar contexto laboral                |
| AURA     | marca/campaña, alcance y rol autorizado                                   |

---

#### 30. Relación con tareas posteriores

| Decisión pendiente o materialización                | Tarea responsable                   |
| --------------------------------------------------- | ----------------------------------- |
| redacción humana de contexto inválido               | `UX-BASE-006`                       |
| evitar doble captura de contexto                    | `UX-BASE-007`                       |
| reducir pasos para seleccionar o recuperar contexto | `UX-BASE-008`                       |
| excepciones de cambio o bypass                      | `UX-BASE-009`                       |
| detalle expandible                                  | `UX-BASE-010`                       |
| comportamiento táctil                               | `UX-BASE-011`                       |
| densidad administrativa                             | `UX-BASE-012`                       |
| conectividad inestable                              | `UX-BASE-013`                       |
| recuperación tras interrupción                      | `UX-BASE-014`                       |
| terminología con trabajadores                       | `UX-BASE-015`                       |
| diseño de superficie contextual de estación         | `UX-STATION-005`                    |
| gramática y composición                             | `UX-STATION-010` a `UX-STATION-012` |
| inventario y clasificación de pantallas             | `AUTH-UI-001` a `AUTH-UI-029`       |
| contexto, masking y navegación real                 | `AUTH-UI-030` a `AUTH-UI-060`       |
| implementación del resolver canónico                | `AUTH-DB-033`, `AUTH-SRV-*`         |
| pruebas de autorización                             | `AUTH-QA-001` a `AUTH-QA-030`       |
| pruebas de experiencia                              | `UX-QA-001` a `UX-QA-030`           |

Ningún pendiente queda sin una tarea exacta.

---

#### 31. Inventario y migración del estado actual

La adopción deberá inventariar en cada aplicación:

- headers y barras actuales;
- selectores de sede;
- textos de rol;
- resolvers y fallbacks;
- cookies y localStorage;
- deep links;
- dispositivos compartidos;
- estados de turno y check-in;
- roles de navegación;
- superficies administrativas;
- formularios que continúan abiertos al cambiar contexto.

Cada caso se clasificará:

```text
CONFORME
INCOMPLETO
AMBIGUO
DECLARADO_POR_CLIENTE
FALLBACK_PERMISIVO
CONFUNDE_FILTRO_Y_CONTEXTO
CONFUNDE_ROL_BASE_Y_OPERATIVO
NO_PERSISTENTE
NO_ACCESIBLE
LEGACY_A_RETIRAR
```

La existencia de componentes actuales no prueba conformidad con este contrato.

---

#### 32. Telemetría y observabilidad

Se medirán, sin almacenar datos personales innecesarios:

- contexto resuelto;
- tiempo de resolución;
- cambios solicitados y confirmados;
- cambios fallidos;
- contexto inválido;
- mismatch entre recurso y contexto;
- acción bloqueada por contexto;
- reanudación después de cambio;
- cambio de actor en dispositivo compartido;
- operación offline pendiente;
- navegación cross-app con revalidación;
- incidentes por confusión de sede, área, turno o rol.

Las métricas no se utilizarán para ocultar alertas ni para penalizar al trabajador
por detectar una inconsistencia.

---

#### 33. Eventos conceptuales

Eventos futuros podrán incluir:

```text
access_context.resolved
active_context.presentation_changed
operational_context.change_requested
operational_context.change_confirmed
operational_context.change_rejected
operational_context.invalidated
operational_context.stale
resource_context.mismatch_detected
shared_device.actor_changed
simulation_context.started
simulation_context.ended
```

Los nombres son documentales y deberán armonizarse en los bloques de eventos e
integración antes de implementación.

---

#### 34. Requisitos de prueba derivados

**Resultado:** GENERA 20 REQUISITOS DE PRUEBA.

Se incorporan en el registro canónico:

```text
TREQ-UX-077 a TREQ-UX-096
```

Protegen:

1. fuente autoritativa y permanencia del contexto visible;
2. separación entre asignación, selección, filtro, recurso y contexto activo;
3. contenido mínimo del resumen;
4. rol base, operativo, delegación y simulación;
5. turno, check-in y estado de jornada;
6. ausencia de fallbacks permisivos;
7. cambio transaccional de contexto;
8. invalidación de tareas y borradores incompatibles;
9. mismatch territorial del recurso;
10. filtros administrativos separados;
11. múltiples asignaciones y un contexto activo;
12. dispositivos compartidos;
13. consistencia cross-app y deep links;
14. persistencia responsive;
15. accesibilidad;
16. conectividad, frescura y offline;
17. minimización y privacidad;
18. estados inexistentes, inválidos o en resolución;
19. telemetría y auditoría;
20. inventario, migración y validación con trabajadores.

---

#### 35. Criterios de aceptación

`UX-BASE-005` podrá aprobarse cuando:

- [ ] sede asignada, activa, seleccionada, filtrada y del recurso están separadas;
- [ ] área asignada, activa, seleccionada y del recurso están separadas;
- [ ] turno programado, turno vigente, check-in y contexto operativo están separados;
- [ ] rol base, rol operativo, delegación, simulación y rol de navegación están separados;
- [ ] la fuente autoritativa es servidor y no frontend;
- [ ] existe una unidad mínima de contexto visible;
- [ ] la presentación conserva estados de resolución y frescura;
- [ ] el contexto se mantiene visible en web, tablet, móvil y kiosco;
- [ ] el contexto administrativo no se presenta como contexto operativo;
- [ ] múltiples asignaciones no producen múltiples contextos activos ambiguos;
- [ ] un cambio de contexto exige validación, confirmación e invalidación del anterior;
- [ ] tareas, claims, borradores, custodia y offline se tratan antes del cambio;
- [ ] territorio del recurso y contexto activo se comparan explícitamente;
- [ ] los dispositivos compartidos separan terminal y actor humano;
- [ ] los saltos cross-app revalidan el contexto en destino;
- [ ] los formularios abiertos no confirman con contexto vencido;
- [ ] no existe fallback a sede primaria, última sede o nombre del rol;
- [ ] los estados sin contexto o inválidos son representables;
- [ ] simulación, delegación e impersonación permanecen visibles;
- [ ] el resumen aplica privacidad y minimización;
- [ ] la proyección es accesible y no depende del color;
- [ ] el modo offline declara frescura y límites;
- [ ] responsabilidades por capa están definidas;
- [ ] los antipatrones están prohibidos;
- [ ] cada producto tiene un contexto mínimo objetivo;
- [ ] todos los pendientes tienen tarea responsable;
- [ ] se generaron `TREQ-UX-077` a `TREQ-UX-096`;
- [ ] no se implementó código ni se modificó una decisión aprobada;
- [ ] `UX-BASE-006` permanece sin iniciar.

---

#### 36. Estado y continuidad

```text
UX-BASE-004   APROBADA
UX-BASE-005   APROBADA
UX-BASE-006   NO INICIADA
```

No se inicia `UX-BASE-006` hasta aprobación expresa de esta tarea.
