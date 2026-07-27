PRINCIPIOS DE EXPERIENCIA

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


### ✅ UX-BASE-006 — Explicar bloqueos con lenguaje humano

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `UX-BASE-005 — Mantener visible sede, área, turno y rol activos` — APROBADA  
**Siguiente tarea reservada:** `UX-BASE-007 — Evitar registrar dos veces la misma información`  
**Artefacto producido:** `UX-HUMAN-BLOCKING-EXPLANATION-CONTRACT-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069` y procesos futuros incorporados al catálogo canónico  
**Aplicaciones cubiertas:** SHELL, ANIMA, NEXO, FOGO, ORIGO, PULSO, VISO, NUMERA, TALENTO, PASS, AURA y aplicaciones futuras de Vento OS  
**Naturaleza:** principio transversal de clasificación, explicación, recuperación, escalamiento, accesibilidad, seguridad y trazabilidad de bloqueos  
**Cambios en código, componentes, rutas, permisos, roles, tablas, RLS, RPC, Supabase o aplicaciones:** no autorizados

---

#### 1. Propósito

Definir el contrato mediante el cual Vento OS deberá comunicar cualquier estado
que impida, limite, suspenda o retrase una acción de forma comprensible,
accionable y segura para la persona que está trabajando.

La persona deberá poder responder, sin interpretar códigos técnicos:

```text
¿QUÉ ME IMPIDE CONTINUAR?
¿POR QUÉ OCURRE EN ESTE CASO?
¿QUÉ INFORMACIÓN YA QUEDÓ GUARDADA?
¿QUÉ PUEDO HACER AHORA?
¿QUIÉN PUEDE RESOLVERLO SI YO NO PUEDO?
¿CUÁNDO O BAJO QUÉ CONDICIÓN DEBO INTENTAR DE NUEVO?
¿QUÉ REFERENCIA PUEDO DAR A SOPORTE O AL RESPONSABLE?
```

La explicación no concederá permisos, no ocultará errores materiales, no
expondrá detalles sensibles y no culpará al trabajador por condiciones que
pertenecen al sistema, la configuración, otro actor o una dependencia.

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
HACER VISIBLE EL CONTEXTO
UX-BASE-005
        ↓
EXPLICAR POR QUÉ NO SE PUEDE CONTINUAR
UX-BASE-006
        ↓
EVITAR CAPTURA DUPLICADA
UX-BASE-007
```

`UX-BASE-006` no diseña todavía todos los textos definitivos de cada pantalla.
Define la gramática, estructura, clasificación, responsabilidades y límites que
posteriormente deberán aplicar las tareas de estaciones, pantallas, autorización,
mensajería, soporte, observabilidad y UX por aplicación.

---

#### 3. Problema que se corrige

Los siguientes mensajes no son suficientes:

```text
Ocurrió un error
Acceso denegado
No autorizado
Algo salió mal
No se pudo procesar
Intenta nuevamente
Operación inválida
Error 500
PGRST116
42501
```

Tampoco es correcto ocultar la acción sin explicar por qué falta, ni mostrar un
botón deshabilitado sin indicar la condición que debe cumplirse.

Un mensaje genérico produce, entre otros riesgos:

- reintentos repetidos y operaciones duplicadas;
- abandono de la tarea;
- capturas paralelas en papel o mensajería;
- escalamiento al responsable equivocado;
- pérdida de evidencia;
- interpretación de un bloqueo técnico como sanción personal;
- exposición de códigos internos a trabajadores;
- soporte sin referencia reproducible;
- bypasses improvisados;
- aceptación silenciosa de una operación incompleta.

---

#### 4. Decisión principal

Toda condición que impida continuar deberá resolverse en dos capas separadas:

```text
CAUSA ESTRUCTURADA Y AUDITABLE
        ↓
TRADUCCIÓN HUMANA SEGÚN ACTOR, CONTEXTO Y CANAL
```

Regla canónica:

```text
REASON CODE ESTABLE
+
CONTEXTO SEGURO
+
ESTADO DE LA OPERACIÓN
+
POLÍTICA DE RECUPERACIÓN
=
EXPLICACIÓN HUMANA ACCIONABLE
```

La interfaz nunca utilizará el texto visible como fuente de lógica.

```text
MENSAJE HUMANO
≠ REASON CODE
≠ DECISIÓN DE AUTORIZACIÓN
≠ ESTADO DE DOMINIO
≠ EXCEPCIÓN TÉCNICA
```

---

#### 5. Taxonomía obligatoria

No toda imposibilidad será tratada como error.

| Clase                 | Significado                                                                   | Respuesta esperada                                                    |
| --------------------- | ----------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| `BLOCKED`             | La acción es pertinente, pero una condición obligatoria impide ejecutarla     | Explicar causa, responsable y condición de desbloqueo                 |
| `DENIED`              | La evaluación de autorización no permite la acción                            | Explicar el límite sin revelar información sensible ni ofrecer bypass |
| `WAITING`             | La tarea depende normalmente de tiempo, evento o actor externo                | Mostrar dependencia, propietario y próxima revisión                   |
| `CONFLICT`            | El recurso o la versión cambió y la acción ya no puede aplicarse como estaba  | Detener, refrescar, comparar y resolver sin sobrescritura silenciosa  |
| `TECHNICAL_FAILURE`   | Una dependencia técnica falló o no respondió                                  | Declarar alcance conocido, persistencia y política de reintento       |
| `VALIDATION_REQUIRED` | Faltan datos, evidencia o correcciones que la persona puede aportar           | Señalar exactamente qué debe corregirse                               |
| `WARNING`             | Puede continuarse, pero existe un riesgo o consecuencia que debe comprenderse | Advertir sin bloquear y exigir confirmación solo cuando corresponda   |
| `INFO`                | Cambio o condición relevante que no requiere acción inmediata                 | Informar sin competir con la tarea principal                          |

No será válido clasificar automáticamente todo resultado distinto de éxito como
`TECHNICAL_FAILURE`.

---

#### 6. Bloqueo frente a denegación

```text
BLOCKED
→ la acción puede llegar a ser válida
→ falta una condición, dependencia o resolución

DENIED
→ la acción no está permitida para ese actor, alcance o recurso
→ no se ofrece una forma improvisada de continuar
```

Ejemplo de bloqueo:

```text
No puedes recibir esta remisión todavía.
El vehículo aún conserva la custodia y no ha confirmado la entrega.
Cuando el conductor registre la entrega, podrás verificar las cantidades.
```

Ejemplo de denegación:

```text
No puedes aprobar esta diferencia.
Tu función en este proceso es registrar y validar el conteo.
La aprobación corresponde a una persona con autoridad administrativa.
```

La interfaz no deberá decir `Falta el permiso
nexo.inventory.adjustments.approve` a un trabajador ordinario.

---

#### 7. Contrato conceptual de presentación

```ts
type HumanBlockingExplanation = {
  presentation_id: string;
  category:
    | "BLOCKED"
    | "DENIED"
    | "WAITING"
    | "CONFLICT"
    | "TECHNICAL_FAILURE"
    | "VALIDATION_REQUIRED"
    | "WARNING"
    | "INFO";
  reason_code: string;
  severity: "INFO" | "LOW" | "MEDIUM" | "HIGH" | "CRITICAL";
  title_key: string;
  summary_key: string;
  safe_detail_keys: string[];
  preserved_state: "NONE" | "LOCAL" | "SERVER" | "PARTIAL" | "UNKNOWN";
  primary_action: RecoveryAction | null;
  secondary_actions: RecoveryAction[];
  resolver_type: string | null;
  review_at: string | null;
  correlation_reference: string | null;
  freshness: "FRESH" | "STALE" | "SUPERSEDED";
};
```

La forma es documental. No constituye todavía un tipo físico ni una obligación
de implementación concreta.

---

#### 8. Anatomía mínima de una explicación

Cuando corresponda, la explicación contendrá:

1. **Título humano:** describe el impedimento, no el subsistema que falló.
2. **Causa segura:** explica qué condición no se cumple.
3. **Efecto:** indica qué acción queda bloqueada y qué continúa disponible.
4. **Estado preservado:** informa si el trabajo quedó guardado.
5. **Acción siguiente:** ofrece una acción segura y concreta.
6. **Responsable:** identifica quién o qué proceso puede resolverlo.
7. **Condición temporal:** informa cuándo revisar o reintentar.
8. **Referencia:** entrega un identificador seguro para soporte o auditoría.

No todas las explicaciones requerirán ocho párrafos. La interfaz podrá compactar
la presentación, pero no eliminar información necesaria para decidir con
seguridad.

---

#### 9. Títulos y descripciones

El título deberá expresar el efecto humano:

```text
Falta identificar al trabajador
La recepción espera la entrega del conductor
Tu jornada terminó
La cantidad cambió en otro dispositivo
No pudimos confirmar el envío
Este documento necesita una corrección
```

No deberá expresar únicamente la causa técnica:

```text
Actor session null
Shift invalid
Version mismatch
RPC timeout
Constraint violation
RLS denied
```

La explicación podrá incluir términos empresariales precisos, pero no dependerá
de códigos, nombres de tablas o estructuras internas.

---

#### 10. Acción siguiente

Toda acción propuesta deberá ser ejecutable y corresponder al actor actual.

Ejemplos válidos:

```text
Identificarme en este dispositivo
Revisar las cantidades modificadas
Solicitar corrección al proveedor
Volver a cargar el documento
Abrir la tarea pendiente del conductor
Guardar y continuar después
Actualizar la información
```

Ejemplos insuficientes:

```text
Aceptar
Continuar
Resolver
Reintentar
Contactar administrador
```

`Reintentar` solo aparecerá cuando:

- la causa sea transitoria;
- repetir sea seguro;
- la operación sea idempotente o no haya comenzado;
- se conozca qué parte quedó guardada;
- exista un límite o estrategia de backoff.

---

#### 11. Estado preservado

La interfaz deberá declarar uno de estos resultados:

```text
NO SE GUARDÓ NINGÚN CAMBIO
SE GUARDÓ UN BORRADOR EN ESTE DISPOSITIVO
EL SERVIDOR CONFIRMÓ LOS CAMBIOS
SE GUARDÓ SOLO UNA PARTE
NO SE PUDO CONFIRMAR EL ESTADO
```

Regla crítica:

```text
NO RECIBIR RESPUESTA
≠ OPERACIÓN NO EJECUTADA
```

Ante timeout o pérdida de conexión se consultará el receipt, idempotency key,
estado de dominio o reconciliación antes de ofrecer repetir una mutación.

---

#### 12. Responsabilidad y escalamiento

El mensaje no utilizará `Contacta al administrador` como salida universal.

Deberá identificar una clase de responsable coherente, por ejemplo:

- responsable de la tarea anterior;
- supervisor del área activa;
- gerente de la sede;
- responsable de Talento;
- Compras;
- Contabilidad;
- soporte técnico;
- seguridad o privacidad;
- proceso automático de conciliación.

Cuando el actor no pueda resolverlo, el sistema deberá ofrecer, según el caso:

```text
SOLICITAR RESOLUCIÓN
ESCALAR CON CONTEXTO
ABRIR CASO
CONSULTAR ESTADO
VER RESPONSABLE
```

El escalamiento conservará la referencia del proceso, recurso, motivo y contexto,
sin exigir que el trabajador vuelva a explicar manualmente toda la situación.

---

#### 13. Bloqueos de contexto

Ejemplos de mensajes objetivo:

##### Falta de turno

```text
No puedes iniciar esta preparación porque no tienes un turno operativo vigente.
Inicia tu jornada en ANIMA o solicita al responsable que revise tu turno.
No se modificó la remisión.
```

##### Check-in faltante

```text
Tu turno está vigente, pero esta acción requiere confirmar tu presencia.
Registra el check-in para continuar.
```

##### Área incompatible

```text
Esta tarea pertenece a Repostería y estás operando en Panadería.
Cambia de contexto mediante el flujo autorizado o solicita una reasignación.
```

##### Actor ausente en dispositivo compartido

```text
Este equipo está autorizado, pero todavía no sabemos quién está operando.
Identifícate para registrar la acción a tu nombre.
```

Los mensajes no utilizarán una sede, área, rol o turno de fallback para permitir
continuar.

---

#### 14. Denegaciones de autorización

Una denegación deberá explicar la frontera funcional conocida, sin revelar:

- permisos de otras personas;
- existencia de recursos secretos;
- reglas antifraude;
- detalles de seguridad;
- datos sensibles;
- nombres internos innecesarios.

Se usarán categorías humanas como:

```text
Esta acción pertenece a otra etapa del proceso
Solo puedes consultar este registro
Tu alcance no incluye esta sede
Esta aprobación requiere una función diferente
Este dispositivo no admite esta operación
La delegación ya venció
```

La explicación no ofrecerá elevar permisos, cambiar el rol o usar una cuenta
ajena como solución inmediata.

---

#### 15. Reglas de proceso y validación

Cuando la persona pueda corregir el bloqueo, el mensaje identificará el dato o
condición exactos.

```text
Falta seleccionar el lote de origen
La cantidad recibida no puede superar la entregada
Debes registrar una razón para esta diferencia
La fecha de vencimiento debe ser posterior a la recepción
Falta una fotografía legible del documento
```

No se mostrará una lista de errores que pertenezcan a secciones ocultas o a
campos que el actor no puede modificar.

La validación deberá aparecer cerca del dato afectado y conservar además un
resumen accesible cuando existan varios errores.

---

#### 16. Esperas y dependencias

Una espera normal no se presentará como fallo.

```text
Esperando confirmación de despacho
Responsable: Bodega del Centro de Producción
Próxima revisión automática: 15:30
Mientras tanto puedes continuar con otras tareas disponibles.
```

Toda espera deberá identificar:

- evento esperado;
- propietario de la siguiente acción;
- fecha o condición de revisión;
- efecto sobre la custodia;
- tareas alternativas permitidas;
- forma de escalar cuando venza el plazo.

No se afirmará que otra persona recibió una tarea únicamente porque se envió una
notificación.

---

#### 17. Conflictos y concurrencia

Ante versión obsoleta, claim perdido o modificación concurrente:

```text
LA INTERFAZ NO SOBRESCRIBIRÁ SILENCIOSAMENTE
```

Deberá explicar:

- qué recurso cambió;
- si los cambios locales se conservaron;
- qué versión es autoritativa;
- quién realizó el cambio cuando sea apropiado y autorizado;
- si se puede comparar, reaplicar o descartar;
- quién conserva la tarea o custodia.

Ejemplo:

```text
Las cantidades de esta recepción cambiaron mientras la revisabas.
Tus observaciones quedaron guardadas como borrador.
Actualiza la recepción y revisa las diferencias antes de confirmar.
```

---

#### 18. Fallos técnicos

Un fallo técnico deberá distinguir:

```text
DEPENDENCIA NO DISPONIBLE
TIMEOUT CON RESULTADO DESCONOCIDO
FALLO ANTES DE ENVIAR
FALLO DESPUÉS DE CONFIRMACIÓN
SINCRONIZACIÓN PARCIAL
ERROR TERMINAL
```

No se ofrecerá repetir una operación cuyo resultado sea desconocido hasta
consultar el estado o ejecutar conciliación.

El detalle técnico completo permanecerá en observabilidad restringida. La
persona recibirá:

- efecto conocido;
- estado guardado;
- acción segura;
- referencia de soporte.

---

#### 19. Conectividad inestable

`UX-BASE-006` fija la explicación mínima, mientras `UX-BASE-013` y
`UX-BASE-014` definirán el comportamiento detallado de conectividad y reanudación.

Estados humanos diferenciados:

```text
TRABAJANDO SIN CONEXIÓN
GUARDADO EN ESTE DISPOSITIVO
PENDIENTE DE CONFIRMACIÓN DEL SERVIDOR
SINCRONIZACIÓN EN CONFLICTO
ACCIÓN REQUIERE CONEXIÓN
```

No se mostrará `Completado` cuando el servidor todavía no lo confirmó.

---

#### 20. Seguridad, privacidad y antienumeración

La explicación aplicará divulgación segura.

A una persona autorizada podrá indicársele:

```text
Tu alcance no incluye esta sede.
```

A una persona no autenticada o sin derecho a conocer la existencia del recurso
podrá mostrársele:

```text
No pudimos abrir este contenido.
Verifica el enlace o inicia sesión con la cuenta correspondiente.
```

No se revelarán:

- si existe una cuenta con un correo concreto;
- si existe un candidato, cliente o trabajador sensible;
- el nombre de quien sí tiene permisos;
- reglas de detección de fraude;
- rutas internas;
- stack traces;
- SQL;
- payloads;
- tokens;
- información médica o financiera.

---

#### 21. Dispositivos compartidos

En kioscos y tablets compartidas, los mensajes deberán diferenciar:

```text
DISPOSITIVO NO AUTORIZADO
ACTOR NO IDENTIFICADO
ACTOR SIN TURNO
ROL INCOMPATIBLE
APLICACIÓN NO ADMITIDA EN LA ESTACIÓN
SESIÓN DEL ACTOR VENCIDA
```

Un bloqueo de actor no deberá cerrar o invalidar automáticamente la sesión
técnica del dispositivo, y un bloqueo del dispositivo no se atribuirá como error
personal del trabajador.

Al cambiar de actor se retirarán mensajes, detalles, borradores y referencias
privadas del actor anterior.

---

#### 22. Operaciones administrativas y masivas

Las acciones masivas deberán devolver resultados por elemento:

```text
18 APROBADOS
2 BLOQUEADOS POR CAMBIO DE ESTADO
1 SIN AUTORIDAD EN ESA SEDE
1 PENDIENTE DE RECONCILIACIÓN
```

No será válido mostrar `Operación completada` si solo una parte tuvo éxito.

La interfaz permitirá:

- revisar los elementos fallidos;
- exportar una referencia segura cuando corresponda;
- reintentar únicamente los casos elegibles;
- conservar los éxitos sin duplicarlos;
- identificar si la selección quedó obsoleta.

---

#### 23. Navegación, alertas y aplicaciones

El mismo `reason_code` deberá conservar una semántica coherente entre SHELL y
la aplicación propietaria.

Una notificación podrá resumir:

```text
Una recepción requiere tu revisión.
```

Al abrirla, la aplicación deberá reconstruir el contexto y mostrar la explicación
vigente. La notificación no congelará el texto, el estado ni la autorización.

Un deep link obsoleto no mostrará una instrucción contradictoria con el estado
actual del proceso.

---

#### 24. Accesibilidad

Las explicaciones deberán:

- estar asociadas al control o región bloqueada;
- anunciarse cuando el bloqueo aparezca después de una acción;
- mover foco solo cuando sea necesario para evitar pérdida de contexto;
- ofrecer un resumen navegable de validaciones;
- no depender únicamente de color, icono, vibración o sonido;
- conservar el orden entre causa, efecto y acción;
- utilizar texto claro para enlaces y botones;
- permitir copiar o leer la referencia de soporte;
- evitar anuncios repetitivos en actualizaciones automáticas.

Un tooltip por hover no será el único lugar donde se explique un bloqueo.

---

#### 25. Lenguaje, terminología y tono

La explicación deberá ser:

- directa;
- neutral;
- específica;
- no punitiva;
- consistente con el vocabulario real;
- adecuada al nivel de conocimiento del actor;
- traducible y versionada.

No se utilizarán expresiones como:

```text
Cometiste un error
No sabes hacer esta tarea
Operación ilegal
Usuario inválido
Fallaste la validación
```

cuando la causa real sea un dato incompleto, configuración, concurrencia,
dependencia o restricción del sistema.

Los textos definitivos se validarán con trabajadores reales en `UX-BASE-015`.

---

#### 26. Ciclo de vida del mensaje

Cada explicación deberá poder declararse:

```text
ACTIVE
RESOLVED
SUPERSEDED
STALE
ACKNOWLEDGED
```

Reglas:

1. un mensaje resuelto no permanecerá como bloqueo activo;
2. un mensaje obsoleto no sustituirá al estado vigente;
3. varios síntomas de la misma causa podrán agruparse;
4. causas distintas no se colapsarán en un único texto ambiguo;
5. una actualización automática no generará notificaciones repetidas sin valor;
6. la severidad no aumentará solo por cantidad de reintentos del trabajador;
7. el texto podrá evolucionar sin cambiar el significado del `reason_code`.

---

#### 27. Auditoría y observabilidad

La interfaz conservará o podrá resolver una referencia segura, mientras la capa
técnica registrará, según corresponda:

- `reason_code`;
- categoría;
- severidad;
- contexto y versión;
- proceso, etapa y recurso;
- actor técnico y efectivo;
- aplicación y dispositivo;
- operación intentada;
- resultado conocido;
- estado preservado;
- acción de recuperación;
- correlation y causation IDs;
- timestamps;
- resolución final.

La observabilidad no almacenará textos libres sensibles ni convertirá los
bloqueos en métricas disciplinarias contra trabajadores.

Métricas permitidas:

- bloqueos por causa y proceso;
- tiempo hasta resolución;
- reintentos evitables;
- tareas abandonadas después de un bloqueo;
- porcentaje de mensajes sin acción útil;
- escalamiento al responsable incorrecto;
- conflictos y estados desconocidos;
- bloqueos causados por configuración o fallos del sistema.

---

#### 28. Relación con contratos aprobados

`AccessContext` ya exige representar problemas estructurales y aplicar
`fail closed` ante contradicción, ambigüedad o fuente obligatoria ausente.

La forma aprobada de `StructuralIssue` incluye:

```text
issue_code
severity
subject_type
subject_id
source
safe_message
```

`safe_message` será una entrada segura para la presentación, pero no sustituirá
la gramática completa definida en esta tarea.

```text
STRUCTURAL ISSUE
≠ MENSAJE FINAL ÚNICO
```

Una misma causa podrá requerir diferente detalle y acción para trabajador,
supervisor, soporte o auditor, conservando el mismo significado contractual.

---

#### 29. Ejemplos por dominio

##### NEXO — stock insuficiente

```text
No puedes completar el retiro.
En la ubicación seleccionada hay menos unidades disponibles que las solicitadas.
Revisa otra ubicación o registra el faltante según el flujo autorizado.
No se descontó inventario.
```

##### FOGO — lote sin liberación

```text
Este lote todavía no puede enviarse a inventario.
Falta la liberación requerida para esta receta y etapa.
La producción registrada permanece guardada.
```

##### ORIGO — recepción sin orden válida

```text
No puedes registrar esta entrega como recepción de compra.
La orden vinculada está cerrada o no corresponde a esta sede.
Revisa la orden o solicita corrección a Compras.
```

##### PULSO — operación no confirmada

```text
No pudimos confirmar la venta con el servidor.
Antes de intentarlo de nuevo, revisaremos si ya fue registrada para evitar un cobro duplicado.
Referencia: PUL-7F3K2.
```

##### TALENTO — documento rechazado

```text
Este documento necesita una nueva versión.
La imagen no permite leer la fecha de vigencia.
Carga una fotografía completa y nítida. La versión anterior se conserva en el historial restringido.
```

##### ANIMA — check-in incompatible

```text
No puedes iniciar la jornada en esta sede.
El turno publicado corresponde a otra ubicación.
Revisa el turno o solicita una corrección antes de continuar.
```

---

#### 30. Antipatrones prohibidos

```text
MOSTRAR EL CÓDIGO TÉCNICO COMO MENSAJE PRINCIPAL
```

```text
BOTÓN DESHABILITADO SIN EXPLICACIÓN
```

```text
OCULTAR UNA OBLIGACIÓN CRÍTICA
```

```text
REINTENTAR UNA MUTACIÓN CON RESULTADO DESCONOCIDO
```

```text
CONTACTA AL ADMINISTRADOR PARA TODO
```

```text
CULPAR AL TRABAJADOR POR UN FALLO DEL SISTEMA
```

```text
AFIRMAR QUE NO SE GUARDÓ CUANDO EL ESTADO ES DESCONOCIDO
```

```text
REVELAR DATOS SENSIBLES PARA EXPLICAR UNA DENEGACIÓN
```

```text
MOSTRAR ÉXITO GLOBAL EN UNA OPERACIÓN PARCIAL
```

```text
USAR EL TEXTO VISIBLE PARA DECIDIR LÓGICA
```

---

#### 31. Responsabilidades posteriores

| Decisión o materialización                      | Tarea propietaria                                                    |
| ----------------------------------------------- | -------------------------------------------------------------------- |
| catálogo físico de reason codes de autorización | `AUTH-CTX-015`, `AUTH-CTX-016` a `AUTH-CTX-024`, `AUTH-SRV-*`        |
| mensajes y estados por pantalla                 | `PROC-SCREEN-001` a `PROC-SCREEN-028`, `AUTH-UI-048` a `AUTH-UI-051` |
| gramática de estaciones                         | `UX-STATION-005`, `UX-STATION-010` a `UX-STATION-012`                |
| conectividad y reanudación                      | `UX-BASE-013`, `UX-BASE-014`, `UX-STATION-007`                       |
| componentes y contratos compartidos             | `SHELL-CON-001` a `SHELL-CON-020`, `INT-APP-001` a `INT-APP-010`     |
| observabilidad y auditoría                      | `OBS-ARC-001` a `OBS-ARC-016`, `AUD-EVT-001` a `AUD-EVT-018`         |
| validación de lenguaje con trabajadores         | `UX-BASE-015`, `UX-STATION-008`, `UX-QA-001` a `UX-QA-030`           |
| soporte y operación de incidentes               | `SUPPORT-*`, `RUN-*` y tareas futuras exactas cuando se materialicen |

La mención de familias futuras no autoriza crear identificadores improvisados.
Cuando el roadmap materialice una capacidad sin tarea existente, la brecha deberá
vincularse de inmediato a una tarea canónica concreta conforme a la regla global
de pendientes.

---

#### 32. Estrategia de migración

La implementación posterior deberá inventariar:

- mensajes inline;
- toasts;
- modales;
- banners;
- pantallas de error;
- estados vacíos;
- respuestas de RPC;
- errores RLS;
- códigos HTTP;
- excepciones de frontend;
- mensajes offline;
- notificaciones;
- textos de botones deshabilitados;
- mensajes en kioscos;
- acciones masivas;
- referencias de soporte.

Cada mensaje se clasificará como:

```text
CONFORME
GENÉRICO
TÉCNICO
NO ACCIONABLE
INSEGURO
CULPABILIZANTE
CON ESTADO DE GUARDADO FALSO
SIN RESPONSABLE
SIN REFERENCIA
DUPLICADO
LEGACY
CANDIDATO_A_RETIRO
```

La migración seguirá:

```text
INVENTARIAR
→ ASIGNAR REASON CODE
→ CLASIFICAR CATEGORÍA Y SEVERIDAD
→ DEFINIR ESTADO PRESERVADO
→ DEFINIR ACCIÓN SEGURA
→ PROTOTIPAR
→ VALIDAR CON TRABAJADORES
→ IMPLEMENTAR
→ MEDIR
→ RETIRAR LEGACY
```

No se retirará un mensaje legacy si era la única vía que permitía recuperar una
tarea y todavía no existe reemplazo funcional.

---

#### 33. Requisitos de prueba derivados

**Resultado:** GENERA 21 REQUISITOS DE PRUEBA.

Se incorporan en el registro canónico completo:

```text
TREQ-UX-097 a TREQ-UX-117
```

Protegen:

1. taxonomía de estados;
2. razón estructurada y traducción humana;
3. anatomía mínima;
4. acciones de recuperación;
5. estado preservado;
6. responsabilidad y escalamiento;
7. denegaciones;
8. bloqueos de contexto;
9. reglas de proceso y validación;
10. esperas y handoffs;
11. conflictos y concurrencia;
12. conectividad y sincronización;
13. fallos técnicos e idempotencia;
14. seguridad y privacidad;
15. dispositivos compartidos;
16. operaciones masivas;
17. navegación y notificaciones;
18. accesibilidad;
19. lenguaje y localización;
20. ciclo de vida, auditoría y métricas;
21. migración legacy y validación con trabajadores.

---

#### 34. Criterios de aceptación

- [ ] Se distinguen bloqueo, denegación, espera, conflicto, fallo técnico, validación, advertencia e información.
- [ ] Todo bloqueo puede conservar una causa estructurada independiente del texto visible.
- [ ] La explicación indica causa, efecto, estado preservado y acción siguiente cuando corresponda.
- [ ] Los reintentos solo se ofrecen cuando son seguros e idempotentes.
- [ ] Los resultados desconocidos no se presentan como fallo definitivo ni como operación no ejecutada.
- [ ] Las denegaciones no revelan información sensible ni ofrecen bypasses.
- [ ] Los bloqueos de contexto no utilizan fallbacks permisivos.
- [ ] Las esperas identifican dependencia, responsable y revisión.
- [ ] Los conflictos no sobrescriben cambios silenciosamente.
- [ ] Los dispositivos compartidos separan bloqueo técnico, actor y contexto.
- [ ] Las operaciones masivas muestran resultados parciales por elemento.
- [ ] Las explicaciones son accesibles y no dependen de color, icono o tooltip.
- [ ] El lenguaje es neutral, específico y no punitivo.
- [ ] Se conserva referencia segura para soporte y auditoría.
- [ ] La observabilidad no convierte bloqueos en métricas disciplinarias.
- [ ] Toda brecha queda vinculada a una tarea o familia canónica responsable.
- [ ] Se generó el registro completo con `TREQ-UX-097` a `TREQ-UX-117`.
- [ ] No se implementaron componentes, código, migraciones ni cambios físicos.
- [ ] `UX-BASE-007` permanece sin iniciar.

---

#### 35. Estado y continuidad

```text
UX-BASE-005   APROBADA
UX-BASE-006   APROBADA
UX-BASE-007   NO INICIADA
```

No se inicia `UX-BASE-007` hasta la aprobación expresa de esta tarea y una
solicitud explícita de continuidad.


### ✅ UX-BASE-007 — Evitar registrar dos veces la misma información

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `UX-BASE-006 — Explicar bloqueos con lenguaje humano` — APROBADA  
**Siguiente tarea reservada:** `UX-BASE-008 — Reducir pasos para tareas frecuentes`  
**Artefacto producido:** `UX-SINGLE-CAPTURE-REUSE-CONTRACT-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069` y procesos futuros incorporados al catálogo canónico  
**Aplicaciones cubiertas:** SHELL, ANIMA, NEXO, FOGO, ORIGO, PULSO, VISO, NUMERA, TALENTO, PASS, AURA y aplicaciones futuras de Vento OS  
**Naturaleza:** principio transversal de captura única, reutilización trazable, precarga, confirmación, recaptura, verificación independiente, corrección, privacidad, offline e integración  
**Cambios en código, componentes, rutas, permisos, roles, tablas, RLS, RPC, Supabase o aplicaciones:** no autorizados

---

#### 1. Propósito

Definir el contrato mediante el cual Vento OS evitará solicitar, transcribir,
copiar o capturar nuevamente información que ya existe y puede reutilizarse de
forma correcta, vigente, autorizada y trazable.

La experiencia deberá responder antes de presentar un campo:

```text
¿ESTE DATO YA EXISTE?
¿ES EXACTAMENTE EL MISMO HECHO EMPRESARIAL?
¿QUIÉN ES SU FUENTE AUTORITATIVA?
¿SIGUE VIGENTE PARA ESTE PROPÓSITO?
¿PUEDE REUTILIZARSE O SOLO MOSTRARSE COMO REFERENCIA?
¿REQUIERE CONFIRMACIÓN, CORRECCIÓN O UNA OBSERVACIÓN NUEVA?
¿DEBE OCULTARSE PARA PRESERVAR UNA VERIFICACIÓN INDEPENDIENTE?
```

El objetivo no es eliminar controles, firmas, conteos, validaciones ni evidencia.
Es eliminar recapturas que no agregan información y convertir las verificaciones
necesarias en acciones explícitas, comprensibles y auditables.

---

#### 2. Continuidad lógica

```text
MOSTRAR SOLO LO RELEVANTE
UX-BASE-004
        ↓
MOSTRAR EL CONTEXTO EFECTIVO
UX-BASE-005
        ↓
EXPLICAR BLOQUEOS Y RECUPERACIÓN
UX-BASE-006
        ↓
CAPTURAR CADA HECHO UNA VEZ
UX-BASE-007
        ↓
REDUCIR PASOS SIN PERDER CONTROLES
UX-BASE-008
```

`UX-BASE-007` define qué información puede heredarse, derivarse, precargarse,
confirmarse o debe capturarse nuevamente. `UX-BASE-008` podrá después reducir
pasos físicos y visuales sin romper estas fronteras semánticas.

---

#### 3. Problema que se corrige

La captura duplicada aparece cuando una persona debe:

- volver a escribir su nombre, documento, sede, área, turno o rol;
- copiar manualmente un número de pedido, remisión, lote, recepción o factura;
- repetir proveedor, cliente, destino, fecha o responsable ya vinculados;
- transcribir productos y cantidades entre aplicaciones;
- cargar varias veces el mismo documento o fotografía;
- explicar nuevamente un bloqueo al siguiente actor o a soporte;
- copiar información desde un mensaje, PDF, hoja de cálculo o pantalla anterior;
- registrar en NUMERA hechos ya producidos por PULSO, ORIGO, NEXO o FOGO;
- completar formularios paralelos con datos personales idénticos;
- repetir una operación porque el sistema no confirmó claramente su resultado.

Esto produce:

- errores de transcripción;
- divergencia entre copias;
- más tiempo operativo;
- pérdida de trazabilidad;
- documentos duplicados;
- sobreescritura del dato autoritativo;
- reintentos con efectos dobles;
- datos personales innecesariamente replicados;
- conciliaciones manuales evitables;
- trabajadores que abandonan el sistema y usan papel o mensajería.

---

#### 4. Decisión principal

Regla canónica:

```text
UN HECHO EMPRESARIAL
→ UNA FUENTE AUTORITATIVA
→ UNA CAPTURA O PRODUCCIÓN ORIGINAL
→ REUTILIZACIONES TRAZABLES
```

Pero:

```text
MISMO TEXTO O NÚMERO
≠ MISMO HECHO EMPRESARIAL
```

Ejemplo:

```text
CANTIDAD SOLICITADA
≠ CANTIDAD PRODUCIDA
≠ CANTIDAD PREPARADA
≠ CANTIDAD CARGADA
≠ CANTIDAD RECIBIDA
```

Cada una puede tener el mismo valor numérico, pero representa una observación,
responsabilidad, momento y evidencia diferentes.

---

#### 5. Separaciones conceptuales obligatorias

```text
REUTILIZAR
≠ COPIAR SIN LINAJE
```

```text
PRECARGAR
≠ CONFIRMAR
≠ ATESTAR
```

```text
MOSTRAR COMO REFERENCIA
≠ UTILIZAR COMO VALOR ACTUAL
```

```text
VALOR PLANIFICADO
≠ VALOR EJECUTADO
≠ VALOR OBSERVADO
```

```text
CORREGIR LA FUENTE
≠ ALTERAR EL HISTÓRICO
```

```text
VERIFICACIÓN INDEPENDIENTE
≠ RECAPTURA INNECESARIA
```

```text
DATO DE PERFIL
≠ DATO DEL CASO
≠ SNAPSHOT CONTRACTUAL
```

```text
DOCUMENTO
≠ ARCHIVO BINARIO
≠ VERSIÓN
≠ REVISIÓN
```

---

#### 6. Unidad mínima de información reutilizable

La reutilización no se decidirá por el nombre visible de un campo. Cada elemento
conceptual deberá poder identificar:

```ts
type ReusableInformationElement = {
  information_definition_id: string;
  semantic_name: string;
  subject_type: string;
  subject_id: string | null;
  value_type: string;
  source_domain: string;
  source_record_type: string;
  source_record_id: string;
  source_version: string | null;
  source_field: string | null;
  captured_or_produced_at: string;
  effective_from: string | null;
  effective_until: string | null;
  captured_or_produced_by: string | null;
  purpose_code: string;
  territorial_scope: string | null;
  classification: string;
  validation_status: string;
  confidence: string | null;
  reuse_policy: string;
  correction_policy: string;
};
```

La forma es documental y no obliga todavía a una tabla o tipo físico.

---

#### 7. Modos canónicos de tratamiento

| Modo                       | Uso                                                                             |
| -------------------------- | ------------------------------------------------------------------------------- |
| `DERIVE_AUTOMATICALLY`     | El sistema obtiene el dato desde una fuente autoritativa sin pedirlo al usuario |
| `REUSE_AS_FACT`            | El hecho vigente se reutiliza directamente con linaje                           |
| `PREFILL_EDITABLE`         | Se precarga y la persona puede corregirlo antes de enviar                       |
| `DISPLAY_FOR_CONFIRMATION` | Se muestra como información conocida y se exige una confirmación explícita      |
| `REFERENCE_ONLY`           | Se muestra para comparación, pero no se transforma en el valor del paso actual  |
| `RECAPTURE_REQUIRED`       | El paso necesita una observación o declaración nueva                            |
| `INDEPENDENT_OBSERVATION`  | Debe capturarse sin revelar el valor anterior para evitar sesgo                 |
| `NOT_REUSABLE`             | La finalidad, sensibilidad, vigencia o semántica impiden reutilizarlo           |

No se admitirá un modo implícito llamado `COPY_PREVIOUS_VALUE`.

---

#### 8. Política de decisión

La interfaz deberá aplicar conceptualmente esta secuencia:

```text
1. IDENTIFICAR EL HECHO REQUERIDO
2. LOCALIZAR FUENTE AUTORITATIVA O CANDIDATOS
3. COMPARAR SEMÁNTICA, SUJETO, PROPÓSITO Y ALCANCE
4. VALIDAR VERSIÓN, VIGENCIA, CLASIFICACIÓN Y DERECHO DE USO
5. DETERMINAR SI ES HECHO, REFERENCIA O NUEVA OBSERVACIÓN
6. ELEGIR MODO DE TRATAMIENTO
7. MOSTRAR ORIGEN Y FRESCURA CUANDO SEA RELEVANTE
8. REGISTRAR CONFIRMACIÓN, CORRECCIÓN O RECAPTURA
```

Si la equivalencia no puede demostrarse, el sistema no reutilizará el valor como
hecho actual.

---

#### 9. Fuente autoritativa y copias

Cada definición de información deberá declarar un dominio propietario.

Ejemplos conceptuales:

| Hecho                                 | Fuente esperada                       |
| ------------------------------------- | ------------------------------------- |
| identidad del trabajador              | identidad laboral canónica            |
| sede, área, turno y rol operativos    | `AccessContext` resuelto              |
| proveedor y orden aprobada            | ORIGO                                 |
| remisión y custodia logística         | NEXO                                  |
| receta y lote productivo              | FOGO                                  |
| venta, pedido y pago                  | PULSO                                 |
| decisión laboral y episodio           | VISO                                  |
| candidatura y expediente de selección | TALENTO                               |
| hechos contables derivados            | NUMERA, consumiendo eventos de origen |

Una proyección, caché o réplica podrá utilizarse para lectura, pero deberá conservar
fuente, versión, frescura y estrategia de reconciliación.

```text
COPIA SIN LINAJE
≠ FUENTE AUTORITATIVA
```

---

#### 10. Procedencia y frescura

Todo valor reutilizado deberá permitir reconstruir, según criticidad:

- de qué registro procede;
- qué versión se utilizó;
- cuándo se capturó o produjo;
- desde cuándo es efectivo;
- quién lo originó;
- qué validación posee;
- hasta cuándo puede reutilizarse;
- si fue corregido o supersedido;
- para qué propósito se reutilizó.

Estados mínimos:

```text
CURRENT
STALE_BUT_DISPLAYABLE
CONFIRMATION_REQUIRED
SUPERSEDED
INVALID
UNKNOWN
```

Un valor obsoleto no se convertirá en un campo vacío silencioso ni se reutilizará
sin advertencia.

---

#### 11. Igualdad semántica

Antes de reutilizar se comparará:

```text
DEFINICIÓN
+
SUJETO
+
UNIDAD
+
MOMENTO
+
ALCANCE
+
FINALIDAD
+
RESPONSABLE
+
MÉTODO DE OBTENCIÓN
```

Dos campos llamados `cantidad`, `fecha`, `responsable`, `sede`, `estado` o
`observación` no son equivalentes por compartir etiqueta.

Ejemplos:

```text
FECHA SOLICITADA
≠ FECHA PROMETIDA
≠ FECHA EJECUTADA
≠ FECHA REGISTRADA
```

```text
RESPONSABLE ASIGNADO
≠ ACTOR QUE EJECUTÓ
≠ ACTOR QUE APROBÓ
```

---

#### 12. Herencia entre pasos de un proceso

La salida aprobada de un paso deberá convertirse en entrada referenciada del
siguiente cuando represente el mismo hecho.

```text
PASO A PRODUCE
→ REGISTRO AUTORITATIVO
→ EVENTO O CONTRATO
→ PASO B CONSUME
```

No se pedirá al actor B copiar manualmente información visible en el paso A.

El handoff deberá transportar referencias como:

- `process_instance_id`;
- `work_item_id`;
- `resource_id`;
- `source_version`;
- `correlation_id`;
- estado de custodia;
- evidencia ya disponible;
- razón o bloqueo vigente.

El siguiente actor confirmará únicamente los hechos que le corresponda observar,
aceptar o asumir.

---

#### 13. Valores de referencia frente a valores actuales

Los valores anteriores deberán presentarse como referencia cuando el paso actual
necesite una observación nueva.

Ejemplo de recepción:

```text
ORDENADO: 24 unidades
DESPACHADO POR PROVEEDOR: 24 unidades
RECIBIDO FÍSICAMENTE: [captura actual]
```

El sistema no precargará `24` como cantidad recibida y la marcará como confirmada
por defecto.

Ejemplo de producción:

```text
RENDIMIENTO ESPERADO: 40 porciones
RENDIMIENTO REAL: [medición actual]
```

La diferencia podrá calcularse automáticamente después de capturar el valor real.

---

#### 14. Observaciones físicas y hechos de ejecución

Deberán capturarse nuevamente cuando representen una realidad que puede cambiar:

- cantidad física recibida;
- cantidad producida;
- temperatura observada;
- peso real;
- estado de un empaque;
- ubicación física confirmada;
- custodia aceptada;
- pago efectivamente recibido;
- asistencia o presencia;
- activo devuelto;
- resultado de inspección.

El sistema reutilizará identidad, recurso, unidad, lote, expectativa y contexto,
pero no inventará la observación actual.

---

#### 15. Verificación independiente y conteos ciegos

Una segunda captura es válida cuando busca evidencia independiente, no cuando
repite una transcripción.

Casos posibles:

- conteo ciego de inventario;
- doble control de caja;
- verificación de cantidades por receptor;
- inspección de calidad independiente;
- aprobación segregada;
- confirmación de custodia por actor entrante;
- segunda lectura de un dato crítico.

Reglas:

1. el valor previo podrá ocultarse para evitar sesgo;
2. la segunda observación tendrá actor, momento y método propios;
3. no se presentará como corrección automática de la primera;
4. la comparación será posterior y auditable;
5. la interfaz explicará por qué se solicita nuevamente.

```text
CAPTURA INDEPENDIENTE
≠ COPIAR Y CONFIRMAR
```

---

#### 16. Identidad y contexto

La interfaz no pedirá al trabajador escribir:

- su nombre;
- su `employee_id`;
- su rol operativo;
- sede o área activas;
- turno;
- check-in;
- dispositivo o estación;
- fecha y hora del servidor.

Estos hechos deberán resolverse desde contratos autoritativos y mostrarse conforme
a `UX-BASE-005`.

Cuando la persona deba seleccionar un destino, tercero, lote o recurso, la
selección representará una decisión empresarial real, no una recaptura del
contexto ya resuelto.

---

#### 17. Precarga editable

`PREFILL_EDITABLE` se utilizará cuando:

- existe una fuente razonablemente vigente;
- la persona tiene autoridad para corregirla;
- la corrección pertenece a ese flujo;
- el cambio no altera silenciosamente históricos;
- el origen del valor puede mostrarse.

Ejemplo:

```text
Teléfono de contacto
Precargado desde tu perfil · actualizado el 20 de julio
[300 000 0000]
```

La persona podrá confirmar o corregir. El sistema deberá indicar si la corrección:

- actualiza únicamente el caso;
- solicita actualizar el perfil maestro;
- crea una nueva versión;
- requiere revisión.

---

#### 18. Confirmación y atestación

Una confirmación no exigirá reescribir el valor.

```text
MOSTRAR EL HECHO
+
EXPLICAR EL EFECTO
+
ACCIÓN EXPLÍCITA
+
IDENTIDAD Y TIMESTAMP
=
CONFIRMACIÓN TRAZABLE
```

Casos:

- aceptar una oferta versionada;
- aceptar custodia;
- confirmar que se revisó una política;
- aprobar un paquete de decisión;
- confirmar destino antes de despacho;
- validar un resumen antes de enviar.

Pedir escribir nuevamente nombre, documento, valor o frase completa no prueba por
sí solo conocimiento, identidad ni consentimiento.

---

#### 19. Corrección y actualización

Cuando un dato conocido sea incorrecto, la experiencia deberá distinguir:

```text
CORREGIR EL DATO MAESTRO
CORREGIR SOLO ESTE CASO
CREAR UNA VERSIÓN NUEVA
REGISTRAR UNA EXCEPCIÓN
SOLICITAR REVISIÓN A LA FUENTE
```

No se editará una copia local si el dominio propietario es otro.

Los registros históricos conservarán el snapshot utilizado en la decisión o
transacción, aun cuando el maestro cambie después.

Ejemplo:

```text
DIRECCIÓN ACTUAL DEL CLIENTE
≠ DIRECCIÓN UTILIZADA EN UNA ENTREGA YA CERRADA
```

---

#### 20. Documentos, archivos y evidencia

El mismo archivo no deberá cargarse varias veces para cada etapa o aplicación.

Se reutilizará mediante:

```text
DOCUMENT_ID
+
VERSION_ID
+
FILE_OBJECT_ID
+
CLASIFICACIÓN
+
PROPÓSITO
+
VIGENCIA
+
DERECHO DE ACCESO
```

Modos permitidos entre dominios:

```text
REFERENCE
COPY_WITH_LINEAGE
DERIVED_FACT_ONLY
NO_TRANSFER
```

No se confundirá reutilización con acceso universal. Un documento podrá existir y
seguir siendo invisible para un actor o aplicación que no lo necesita.

Una nueva carga será necesaria cuando:

- el documento expiró;
- cambió materialmente;
- se exige una versión firmada diferente;
- la calidad o integridad no es suficiente;
- la finalidad no permite reutilizarlo;
- el usuario decidió reemplazarlo.

---

#### 21. Integración entre aplicaciones

Las aplicaciones intercambiarán información mediante:

- contratos versionados;
- referencias de recursos;
- eventos empresariales;
- proyecciones controladas;
- APIs o RPC protegidos;
- receipts e idempotency keys;
- conciliación.

No mediante:

- copy-paste del trabajador;
- texto libre en observaciones;
- archivos intermedios no gobernados;
- consultas directas a tablas ajenas;
- duplicación de maestros;
- parámetros de URL tratados como verdad.

```text
APLICACIÓN CONSUMIDORA
≠ NUEVA PROPIETARIA DEL DATO
```

---

#### 22. NEXO

Ejemplo de remisión:

| Etapa       | Reutiliza                                            | Captura nueva                                  |
| ----------- | ---------------------------------------------------- | ---------------------------------------------- |
| solicitud   | solicitante, sede, catálogo, unidad, políticas       | cantidad solicitada y necesidad                |
| preparación | líneas solicitadas, producto, destino                | lote, ubicación, cantidad preparada, faltantes |
| carga       | remisión preparada, vehículo y conductor autorizados | cantidad cargada y aceptación de custodia      |
| recepción   | origen, destino, líneas, lote y trazabilidad         | cantidad recibida, diferencias y estado físico |
| cierre      | todas las evidencias previas                         | decisión de diferencia cuando corresponda      |

El receptor nunca deberá reescribir el número de remisión, productos, origen o
conductor; sí deberá registrar su observación física independiente.

---

#### 23. FOGO

La orden o plan de producción podrá aportar:

- receta y versión;
- productos objetivo;
- cantidades planificadas;
- insumos esperados;
- área;
- prioridad;
- destino.

El trabajador capturará cuando corresponda:

- lote real;
- insumos efectivamente consumidos;
- rendimiento real;
- mermas;
- tiempos observados;
- evidencia de control;
- liberación o bloqueo.

La receta no se copiará a cada lote como texto editable sin versión ni linaje.

---

#### 24. ORIGO

Una recepción consumirá de la orden aprobada:

- proveedor;
- destino;
- productos;
- presentaciones;
- cantidades ordenadas;
- condiciones relevantes;
- documentos esperados.

La recepción capturará:

- cantidades físicas;
- lote o vencimiento cuando corresponda;
- calidad;
- diferencias;
- documento realmente presentado;
- responsable y timestamp.

```text
CANTIDAD ORDENADA
≠ CANTIDAD RECIBIDA
```

El proveedor no volverá a crearse desde la pantalla de recepción.

---

#### 25. PULSO

Pedido, cuenta, producción, entrega, pago y factura deberán compartir la misma
identidad transaccional.

No se volverán a escribir:

- productos y modificadores;
- mesa, canal o cliente cuando ya estén vinculados;
- precios y reglas aprobadas;
- referencia del pedido;
- sede y cajero efectivos.

Sí se capturarán como hechos distintos:

- preparación y entrega;
- medio y resultado de pago;
- propina;
- devolución;
- autorización excepcional;
- evidencia de cierre.

---

#### 26. TALENTO, VISO y ANIMA

El flujo aprobado conservará:

```text
PERSONA
→ CANDIDATO
→ POSTULACIÓN
→ OFERTA
→ PRE-REGISTRO
→ EMPLEADO
→ EPISODIO LABORAL
```

Datos ya verificados se transferirán por referencia, copia con linaje o hecho
derivado según política. No se pedirá al trabajador volver a completar identidad,
contacto o documentos válidos solo porque cambió de aplicación.

Pero:

- una aceptación de oferta seguirá siendo una atestación nueva;
- una observación ocupacional actual no se inferirá de información antigua;
- el empleado podrá corregir datos vigentes sin reescribir el expediente histórico;
- ANIMA no recibirá notas de selección ni información no necesaria.

---

#### 27. NUMERA y hechos financieros

NUMERA deberá consumir eventos y documentos fuente de:

- ventas;
- compras;
- recepciones;
- inventario;
- producción;
- pagos;
- devoluciones;
- nómina cuando corresponda.

No se diseñará como una segunda captura manual de la operación.

Una intervención contable podrá:

- clasificar;
- conciliar;
- distribuir;
- aprobar;
- ajustar mediante documento formal;
- registrar un hecho que no exista en otro dominio.

No podrá reemplazar el hecho operativo original con una copia sin linaje.

---

#### 28. PASS y datos del cliente

Los datos del cliente podrán precargarse desde su perfil cuando sean necesarios y
esté permitido utilizarlos para ese propósito.

No se pedirá nuevamente información por conveniencia de una campaña o módulo.

Se distinguirán:

- perfil vigente;
- dirección de una entrega concreta;
- datos fiscales de una factura;
- preferencia de comunicación;
- consentimiento por finalidad;
- snapshot histórico de una transacción.

El cliente podrá corregir el dato adecuado sin alterar transacciones cerradas.

---

#### 29. Dispositivos compartidos

En una estación compartida:

- el contexto del dispositivo podrá precargar estación, sede y área permitidas;
- el actor deberá identificarse conforme al contrato aprobado;
- no se conservarán datos personales del actor anterior;
- un borrador no se reasignará al siguiente trabajador;
- no se reutilizará PIN, firma, búsqueda, favorito o selección personal;
- los valores operativos comunes podrán mantenerse solo si pertenecen a la tarea y no a la persona.

```text
REUTILIZAR CONTEXTO DE LA ESTACIÓN
≠ REUTILIZAR IDENTIDAD DEL TRABAJADOR ANTERIOR
```

---

#### 30. Offline, reintentos e idempotencia

La experiencia offline deberá evitar tanto la pérdida como la duplicación.

Cada captura local conservará:

- identificador local estable;
- actor y contexto de origen;
- recurso y versión;
- idempotency key;
- estado de sincronización;
- campos producidos localmente;
- referencias reutilizadas;
- conflicto o receipt.

Al reconectar:

```text
CONSULTAR ESTADO
→ REVALIDAR CONTEXTO Y VERSIÓN
→ SINCRONIZAR UNA VEZ
→ CONCILIAR CONFLICTOS
```

No se presentará un formulario vacío como única recuperación cuando ya existe un
borrador válido.

---

#### 31. Escaneo, importación y captura automática

Cuando un código, documento o dispositivo puede aportar información confiable, el
sistema deberá evitar la transcripción manual.

Ejemplos:

- escanear LOC o LPN;
- leer código de producto;
- seleccionar una orden existente;
- importar una factura estructurada;
- capturar peso desde una báscula integrada;
- resolver fecha y hora desde servidor;
- obtener georreferencia cuando sea necesaria y permitida.

La automatización deberá mostrar el resultado relevante y permitir corregir o
rechazar cuando corresponda.

```text
CAPTURA AUTOMÁTICA
≠ VERDAD INCUESTIONABLE
```

La contingencia manual quedará identificada y no se convertirá en el flujo
ordinario por comodidad técnica.

---

#### 32. Operaciones repetitivas y masivas

Para múltiples líneas o casos se permitirán:

- valores comunes aplicados explícitamente;
- plantillas versionadas;
- escaneo consecutivo;
- selección masiva;
- importación validada;
- confirmación por excepción;
- edición solo de diferencias.

No se aplicará silenciosamente un valor común a elementos incompatibles.

Ejemplo:

```text
MISMO DESTINO PARA 20 LÍNEAS
→ seleccionar una vez
→ mostrar alcance
→ permitir excepciones
→ confirmar resumen
```

---

#### 33. Valores predeterminados e inferencias

Un valor predeterminado solo será permitido cuando:

- proceda de una regla aprobada;
- sea visible;
- no simule una observación física;
- pueda cambiarse cuando corresponda;
- su origen sea comprensible;
- no amplíe autoridad.

Quedan prohibidos:

```text
USAR LA ÚLTIMA SEDE COMO SEDE ACTIVA
PRECARGAR CANTIDAD RECIBIDA CON CANTIDAD ORDENADA
MARCAR ACEPTACIÓN POR DEFECTO
COPIAR FECHA ACTUAL COMO FECHA REAL DE UN HECHO PASADO
HEREDAR RESPONSABLE DEL ÚLTIMO CASO
```

---

#### 34. Privacidad, finalidad y minimización

La existencia de un dato no autoriza reutilizarlo para cualquier propósito.

Antes de reutilizar información personal o sensible se validará:

- finalidad;
- base o autorización aplicable;
- clasificación;
- actor consumidor;
- minimización;
- territorio y transferencia;
- conservación;
- revocación o restricción vigente.

Una pantalla no deberá pedir nuevamente un dato sensible solo porque no puede
acceder al original. Si no tiene derecho, deberá rediseñarse el flujo o utilizar
un hecho derivado permitido.

Ejemplo:

```text
CERTIFICADO DE APTITUD Y RESTRICCIONES PERMITIDAS
≠ HISTORIA CLÍNICA COMPLETA
```

---

#### 35. Explicar por qué se pregunta otra vez

Cuando exista `RECAPTURE_REQUIRED` o `INDEPENDENT_OBSERVATION`, la interfaz deberá
explicar la diferencia:

```text
Te mostramos la cantidad solicitada como referencia.
Registra la cantidad que recibiste físicamente.
```

```text
Este conteo es independiente.
No mostramos la existencia teórica para evitar sesgo.
```

```text
El documento anterior venció.
Carga una versión vigente para continuar.
```

No se utilizará `Confirma tus datos` para pedir de nuevo un formulario completo
sin indicar qué cambió o por qué necesita revisión.

---

#### 36. Accesibilidad y eficiencia

- Los valores precargados deberán distinguirse de campos vacíos y placeholders.
- El origen, frescura y condición de edición serán accesibles sin depender de color.
- La confirmación no exigirá copiar texto innecesario.
- Los campos derivados podrán leerse, revisarse y comprenderse.
- Los errores se asociarán solo a datos que la persona puede corregir.
- En móvil, tablet y kiosco se minimizará teclado cuando existan selección, escaneo o contexto.
- La automatización no moverá el foco de forma impredecible ni ocultará cambios.

---

#### 37. Antipatrones prohibidos

```text
PEDIR NOMBRE Y DOCUMENTO EN CADA FORMULARIO
```

```text
COPIAR PEDIDO EN REMISIÓN Y LUEGO EN RECEPCIÓN
```

```text
PRECARGAR UN HECHO FÍSICO CON EL VALOR PLANIFICADO
```

```text
CREAR UN MAESTRO DUPLICADO POR APLICACIÓN
```

```text
CARGAR EL MISMO ARCHIVO PARA CADA ETAPA
```

```text
USAR TEXTO LIBRE PARA TRANSPORTAR DATOS ESTRUCTURADOS
```

```text
CORREGIR UNA COPIA SIN CORREGIR O NOTIFICAR A LA FUENTE
```

```text
REUTILIZAR DATOS PERSONALES SIN FINALIDAD COMPATIBLE
```

```text
MOSTRAR EL VALOR TEÓRICO EN UNA VERIFICACIÓN CIEGA
```

```text
HACER QUE EL SIGUIENTE ACTOR RECONSTRUYA EL CONTEXTO DEL HANDOFF
```

```text
REPETIR UNA MUTACIÓN PORQUE NO LLEGÓ RESPUESTA
```

---

#### 38. Responsabilidades posteriores

| Decisión o materialización                                      | Tarea propietaria                                                       |
| --------------------------------------------------------------- | ----------------------------------------------------------------------- |
| catálogo de información, entradas, salidas y linaje por proceso | `PROC-CAT-015` a `PROC-CAT-018`; `PROC-SCREEN-001` a `PROC-SCREEN-028`  |
| contratos compartidos, APIs, eventos y proyecciones             | `SHELL-CON-001` a `SHELL-CON-020`; `INT-APP-001` a `INT-APP-010`        |
| autorización y minimización de campos                           | `AUTH-SRV-*`; `AUTH-UI-030` a `AUTH-UI-045`                             |
| documentos, versiones y transferencias                          | `EVID-ARC-001` a `EVID-ARC-010`; `CAP-TAL-003` a `CAP-TAL-006`          |
| offline, colas, idempotencia y conciliación                     | `QUEUE-ARC-001` a `QUEUE-ARC-012`; `UX-BASE-013`; `UX-BASE-014`         |
| estaciones, escáneres y captura automática                      | `UX-STATION-002` a `UX-STATION-012`                                     |
| formularios y flujos reales por aplicación                      | `PROC-SCREEN-001` a `PROC-SCREEN-028`; subbloques UX de cada aplicación |
| validación con trabajadores y pruebas                           | `UX-BASE-015`; `UX-QA-001` a `UX-QA-030`                                |
| observabilidad, auditoría y métricas                            | `OBS-ARC-001` a `OBS-ARC-016`; `AUD-EVT-001` a `AUD-EVT-018`            |

Las familias ya existentes identifican responsables posteriores. Si durante la
materialización aparece una brecha sin tarea concreta, deberá vincularse de
inmediato a una tarea canónica o generar una nueva tarea explícita conforme a la
regla global de pendientes.

---

#### 39. Estrategia de migración

Se inventariarán por pantalla y proceso:

- campos repetidos;
- formularios duplicados;
- copy-paste entre aplicaciones;
- maestros paralelos;
- documentos cargados más de una vez;
- valores predeterminados no trazables;
- datos derivados capturados manualmente;
- información de contexto solicitada al usuario;
- observaciones físicas precargadas indebidamente;
- verificaciones independientes contaminadas con valores previos;
- correcciones locales sin fuente;
- reintentos que recrean registros;
- integraciones reemplazadas por hojas de cálculo o mensajes.

Cada caso se clasificará:

```text
REUSE_AS_FACT
PREFILL_EDITABLE
DISPLAY_FOR_CONFIRMATION
REFERENCE_ONLY
RECAPTURE_REQUIRED
INDEPENDENT_OBSERVATION
DERIVE_AUTOMATICALLY
NOT_REUSABLE
DUPLICATE_SOURCE
LEGACY
```

Migración:

```text
INVENTARIAR
→ DEFINIR SEMÁNTICA Y PROPIETARIO
→ IDENTIFICAR FUENTE Y VERSIÓN
→ CLASIFICAR MODO DE TRATAMIENTO
→ DISEÑAR CONTRATO O HANDOFF
→ PROTOTIPAR
→ VALIDAR CON TRABAJADORES
→ IMPLEMENTAR CON TELEMETRÍA
→ CONCILIAR
→ RETIRAR CAPTURA LEGACY
```

No se retirará una captura si todavía constituye la única evidencia válida de un
hecho independiente.

---

#### 40. Métricas

Métricas válidas:

- campos manuales por tarea;
- porcentaje de campos derivados o reutilizados;
- correcciones sobre valores precargados;
- recapturas justificadas y no justificadas;
- tiempo de captura;
- errores de transcripción;
- duplicados documentales;
- divergencias entre fuentes;
- conflictos de sincronización;
- operaciones repetidas por resultado desconocido;
- abandono de formularios;
- uso de contingencia manual;
- éxito de escaneo o importación.

No se utilizarán para sancionar al trabajador por corregir un dato precargado o
por registrar una diferencia física real.

---

#### 41. Requisitos de prueba derivados

**Resultado:** GENERA 21 REQUISITOS DE PRUEBA.

Se incorporan en el registro canónico completo:

```text
TREQ-UX-118 a TREQ-UX-138
```

Protegen:

1. captura única por hecho semántico;
2. fuente autoritativa y procedencia;
3. política de reutilización;
4. modos de precarga, confirmación y recaptura;
5. contexto derivado automáticamente;
6. herencia entre pasos y handoffs;
7. separación de valores planificados y observados;
8. verificaciones independientes;
9. documentos y versiones;
10. integración cross-app;
11. corrección y snapshots históricos;
12. frescura y vencimiento;
13. privacidad y finalidad;
14. dispositivos compartidos;
15. offline, idempotencia y deduplicación;
16. escaneo, importación y captura automática;
17. operaciones masivas;
18. predeterminados e inferencias;
19. explicación de recapturas;
20. accesibilidad y eficiencia;
21. migración, auditoría y métricas.

---

#### 42. Criterios de aceptación

- [ ] Se define captura única por hecho empresarial, no por etiqueta de campo.
- [ ] Se distinguen reutilización, precarga, confirmación, referencia, recaptura y observación independiente.
- [ ] Todo valor reutilizado conserva fuente, versión, vigencia y propósito cuando corresponda.
- [ ] Los contextos de actor, sede, área, turno y rol no se solicitan manualmente.
- [ ] Los handoffs transportan referencias y estado sin reconstrucción manual.
- [ ] Los valores planificados no se convierten en valores ejecutados u observados.
- [ ] Conteos ciegos y verificaciones segregadas permanecen independientes.
- [ ] Las correcciones distinguen maestro, caso, versión e histórico.
- [ ] Los documentos se reutilizan por referencia o transferencia con linaje.
- [ ] Las aplicaciones consumidoras no crean maestros paralelos.
- [ ] La reutilización de datos personales valida finalidad y minimización.
- [ ] Los dispositivos compartidos no heredan datos del actor anterior.
- [ ] Offline y reintentos no duplican registros ni efectos.
- [ ] Escaneo e importación reducen transcripción sin ocultar el resultado.
- [ ] Los valores comunes en operaciones masivas muestran alcance y excepciones.
- [ ] Los predeterminados no simulan observaciones físicas ni autoridad.
- [ ] Toda recaptura necesaria explica por qué se solicita nuevamente.
- [ ] La experiencia es accesible y reduce teclado innecesario.
- [ ] Toda brecha queda vinculada a una tarea o familia canónica responsable.
- [ ] Se generó el registro completo con `TREQ-UX-118` a `TREQ-UX-138`.
- [ ] No se implementaron componentes, código, migraciones ni cambios físicos.
- [ ] `UX-BASE-008` permanece sin iniciar.

---

#### 43. Estado y continuidad

```text
UX-BASE-006   APROBADA
UX-BASE-007   APROBADA
UX-BASE-008   NO INICIADA
```

No se inicia `UX-BASE-008` hasta la aprobación expresa de esta tarea y una
solicitud explícita de continuidad.


### ✅ UX-BASE-008 — Reducir pasos para tareas frecuentes

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `UX-BASE-007 — Evitar registrar dos veces la misma información` — APROBADA  
**Siguiente tarea reservada:** `UX-BASE-009 — Mantener acciones excepcionales fuera del flujo ordinario`  
**Artefacto producido:** `UX-FREQUENT-TASK-FRICTION-REDUCTION-CONTRACT-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069` y procesos futuros incorporados al catálogo canónico  
**Aplicaciones cubiertas:** SHELL, ANIMA, NEXO, FOGO, ORIGO, PULSO, VISO, NUMERA, TALENTO, PASS, AURA y aplicaciones futuras de Vento OS  
**Naturaleza:** principio transversal de reducción segura de pasos, tiempo, desplazamiento, carga cognitiva, esperas, cambios de contexto y recuperación en tareas frecuentes  
**Cambios en código, componentes, rutas, permisos, roles, tablas, RLS, RPC, Supabase o aplicaciones:** no autorizados

---

#### 1. Propósito

Definir el contrato mediante el cual Vento OS reducirá la fricción de las tareas
que las personas ejecutan con mayor frecuencia, sin eliminar controles que
protegen:

- seguridad física;
- identidad y atribución;
- autorización;
- segregación de funciones;
- observación independiente;
- evidencia;
- custodia;
- integridad financiera;
- privacidad;
- recuperación;
- trazabilidad.

La optimización deberá responder:

```text
¿QUÉ RESULTADO EMPRESARIAL DEBE OBTENERSE?
¿QUÉ PASOS AGREGAN INFORMACIÓN, CONTROL O EVIDENCIA REAL?
¿QUÉ PASOS SOLO COMPENSAN UNA MALA ARQUITECTURA O NAVEGACIÓN?
¿QUÉ PUEDE DERIVARSE, AGRUPARSE, AUTOMATIZARSE O EJECUTARSE EN PARALELO?
¿QUÉ DEBE PERMANECER EXPLÍCITO POR RIESGO, RESPONSABILIDAD O LEY?
¿CÓMO SE RECUPERA LA PERSONA SI EL FLUJO SE INTERRUMPE?
```

Reducir pasos no significa acelerar cualquier transición. Significa lograr el
resultado correcto con el mínimo trabajo humano necesario y una recuperación
segura.

---

#### 2. Continuidad lógica

```text
MOSTRAR LA TAREA ACTUAL
UX-BASE-002
        ↓
MOSTRAR SOLO LO RELEVANTE
UX-BASE-004
        ↓
EXPLICAR BLOQUEOS
UX-BASE-006
        ↓
EVITAR CAPTURA DUPLICADA
UX-BASE-007
        ↓
REDUCIR FRICCIÓN END-TO-END
UX-BASE-008
        ↓
SEPARAR EXCEPCIONES
UX-BASE-009
        ↓
REVELAR OPCIONES AVANZADAS PROGRESIVAMENTE
UX-BASE-010
```

`UX-BASE-007` determina qué información no debe recapturarse. Esta tarea define
cómo reducir los pasos restantes. `UX-BASE-009` y `UX-BASE-010` separarán
posteriormente las rutas excepcionales y las opciones avanzadas sin reabrir el
flujo ordinario.

---

#### 3. Problema que se corrige

Una tarea frecuente se vuelve ineficiente cuando obliga a:

- entrar por una portada y atravesar varios menús;
- seleccionar repetidamente sede, área, turno o actor ya resueltos;
- abrir una lista, buscar un registro y volver a abrirlo después de cada acción;
- confirmar decisiones de bajo riesgo varias veces;
- saltar entre aplicaciones sin conservar el proceso;
- esperar cargas secuenciales que podrían resolverse antes;
- repetir autenticación sin cambio de riesgo;
- usar teclado cuando existe escaneo, selección o contexto;
- cerrar y reabrir modales para cada línea;
- guardar, volver a la lista y localizar el siguiente elemento;
- registrar una línea por vez cuando comparten contexto y acción;
- comenzar a llenar un formulario antes de descubrir que faltaba una condición;
- rehacer trabajo después de una interrupción o timeout;
- navegar por pantallas administrativas para ejecutar una acción operativa simple.

La consecuencia no es solo más clics. También produce:

- recorridos físicos innecesarios;
- mayor tiempo de atención al cliente;
- manos ocupadas por más tiempo;
- errores de selección;
- abandono;
- uso de WhatsApp, papel o memoria como atajo;
- operaciones duplicadas;
- fatiga;
- pérdida de custodia;
- trabajadores que aceptan valores sin revisarlos para avanzar más rápido.

---

#### 4. Decisión principal

Regla canónica:

```text
RESULTADO CORRECTO
+
CONTROLES NECESARIOS
+
EVIDENCIA SUFICIENTE
+
RECUPERACIÓN SEGURA
CON
EL MÍNIMO TRABAJO HUMANO NECESARIO
```

No se optimizará únicamente:

```text
NÚMERO DE CLICS
```

Se optimizará:

```text
TIEMPO TOTAL
+
TOQUES Y TECLEO
+
DESPLAZAMIENTO FÍSICO
+
CAMBIO DE CONTEXTO
+
ESPERA
+
CARGA COGNITIVA
+
PROBABILIDAD DE ERROR
+
COSTE DE RECUPERACIÓN
```

Por tanto:

```text
MENOS PASOS
≠ MEJOR FLUJO AUTOMÁTICAMENTE
```

Una confirmación adicional puede ser correcta si evita un ajuste de inventario,
un pago equivocado, una entrega al destinatario incorrecto o una exposición de
datos sensibles.

---

#### 5. Qué se considera tarea frecuente

Una tarea no será declarada frecuente por intuición, jerarquía o preferencia del
equipo de producto.

La clasificación considerará:

- ejecuciones por día, semana y turno;
- cantidad de actores que la realizan;
- repetición dentro de una misma sesión;
- tiempo acumulado;
- estacionalidad y picos;
- criticidad operativa;
- dependencia de clientes, vehículos, producción o terceros;
- frecuencia de error, corrección y abandono;
- dispositivo y condición física;
- tareas que bloquean otras tareas;
- rutas de contingencia utilizadas como flujo ordinario.

Categorías iniciales:

```text
HIGH_FREQUENCY
REPEATED_IN_SESSION
PEAK_CRITICAL
LOW_FREQUENCY_HIGH_FRICTION
EXCEPTIONAL
UNKNOWN
```

`LOW_FREQUENCY_HIGH_FRICTION` podrá priorizarse por impacto, pero no se hará
pasar por tarea frecuente.

---

#### 6. Línea base obligatoria

Antes de reducir pasos deberá existir una línea base por combinación real:

```text
PROCESO
+
PASO
+
ACTOR
+
SEDE Y ÁREA
+
DISPOSITIVO O ESTACIÓN
+
CONDICIÓN OPERATIVA
```

La línea base registrará, como mínimo:

- punto de inicio y resultado final;
- pasos visibles;
- comandos de servidor;
- pantallas, modales y aplicaciones atravesadas;
- campos manuales;
- confirmaciones;
- escaneos;
- esperas y latencias;
- desplazamientos;
- interrupciones;
- errores y recuperación;
- tiempo activo y tiempo de espera;
- frecuencia;
- evidencia requerida;
- controles obligatorios;
- uso de contingencias.

No se eliminará un paso sin saber qué función cumplía.

---

#### 7. Unidad correcta de optimización

La unidad de análisis será el resultado empresarial end-to-end, no una pantalla
aisladamente.

Ejemplo incorrecto:

```text
LA PANTALLA DE RECEPCIÓN AHORA TIENE DOS CLICS MENOS
```

si el trabajador todavía debe:

- copiar la orden desde ORIGO;
- buscar el mismo producto en NEXO;
- tomar una fotografía con otra aplicación;
- avisar por mensajería;
- volver a VISO para cerrar la novedad.

Ejemplo correcto:

```text
ABRIR RECEPCIÓN ASIGNADA
→ VER ORDEN Y EXPECTATIVAS
→ REGISTRAR HECHOS FÍSICOS
→ RESOLVER DIFERENCIAS
→ CONFIRMAR
→ PRODUCIR EVENTOS Y SIGUIENTE TAREA
```

sin reconstrucción manual del contexto.

---

#### 8. Clasificación de pasos

Todo paso deberá clasificarse como:

| Clase                 | Tratamiento                                                       |
| --------------------- | ----------------------------------------------------------------- |
| `VALUE_PRODUCING`     | Produce un hecho, decisión, evidencia o aceptación nueva          |
| `CONTROL_REQUIRED`    | Protege un riesgo o precondición obligatoria                      |
| `CONTEXT_RESOLUTION`  | Debe resolverse automáticamente cuando exista fuente autoritativa |
| `NAVIGATION_ONLY`     | Candidato a eliminar, fusionar o sustituir por deep link          |
| `DUPLICATE_CAPTURE`   | Se rige por `UX-BASE-007`                                         |
| `SYSTEM_WAIT`         | Candidato a paralelización, prefetch o feedback progresivo        |
| `LEGACY_COMPENSATION` | Candidato a retiro después de resolver la causa                   |
| `EXCEPTION_ONLY`      | Debe salir del camino ordinario mediante `UX-BASE-009`            |
| `UNKNOWN`             | No se elimina hasta observar y asignar función                    |

Un paso `CONTROL_REQUIRED` podrá simplificarse, pero no desaparecer sin que otro
mecanismo equivalente y probado asuma el control.

---

#### 9. Camino ordinario mínimo

Cada tarea frecuente tendrá un `golden path` explícito:

```text
ENTRADA CORRECTA
→ CONTEXTO RESUELTO
→ PRECONDICIONES VALIDADAS
→ CAPTURA O DECISIÓN ESENCIAL
→ CONFIRMACIÓN PROPORCIONAL AL RIESGO
→ RESULTADO Y RECEIPT
→ SIGUIENTE TAREA O RETORNO
```

El camino ordinario:

- comenzará desde la tarea actual o una cola pertinente;
- no exigirá visitar una portada intermedia;
- conservará proceso, recurso y contexto;
- ofrecerá una acción primaria;
- mantendrá visible el resultado esperado;
- finalizará con estado claro y siguiente paso;
- no mezclará acciones excepcionales.

---

#### 10. Controles que no se eliminan por frecuencia

La repetición no convierte una acción en segura.

No se eliminarán automáticamente:

- identificación del actor en dispositivo compartido;
- autorización de servidor;
- validación de recurso y versión;
- segregación entre ejecutar y aprobar;
- aceptación de custodia;
- verificación física de cantidad, calidad o pago;
- confirmación de acciones destructivas o irreversibles;
- step-up para acciones sensibles;
- evidencia requerida;
- revisión de diferencias materiales;
- consentimiento o aceptación que deba ser explícita;
- control de concurrencia;
- idempotencia.

```text
FRECUENTE
≠ BAJO RIESGO
```

---

#### 11. Validar antes de pedir trabajo

Las precondiciones que el sistema pueda conocer deberán validarse antes de que la
persona invierta tiempo.

Antes de abrir una captura se resolverán, según corresponda:

- actor;
- turno y check-in;
- rol operativo;
- sede y área;
- permiso;
- recurso y estado;
- claim o lease;
- versión;
- disponibilidad de catálogo;
- dispositivo y periférico;
- conectividad mínima;
- dependencias obligatorias.

No será válido pedir veinte líneas y bloquear al final porque:

- el turno venció antes de empezar;
- el recurso ya estaba cerrado;
- otra persona tenía la tarea;
- el actor no tenía el permiso;
- la estación no admitía la acción.

Si una condición puede cambiar durante la ejecución, se revalidará al confirmar,
pero el riesgo se comunicará desde el inicio.

---

#### 12. Continuar desde el punto correcto

La entrada principal deberá abrir:

```text
LA TAREA
+
EL RECURSO
+
LA ETAPA
+
EL PUNTO DE CONTINUACIÓN
```

No simplemente la aplicación o la lista general.

Ejemplos:

```text
Continuar conteo en Congelados
```

```text
Recibir OC-2026-00418
```

```text
Confirmar entrega de RM-2026-00183
```

La aplicación propietaria revalidará contexto y estado antes de presentar la
acción.

---

#### 13. Una acción primaria y transición local

Las tareas repetitivas deberán evitar ciclos artificiales:

```text
ABRIR MODAL
→ GUARDAR
→ CERRAR
→ VOLVER A LISTA
→ BUSCAR SIGUIENTE
→ ABRIR MODAL
```

Cuando sea seguro, se preferirá:

```text
REGISTRAR
→ CONFIRMACIÓN INLINE
→ CARGAR SIGUIENTE ELEMENTO COMPATIBLE
```

La transición automática solo procederá si:

- el resultado anterior fue confirmado;
- no existe conflicto;
- el siguiente elemento es inequívoco;
- el actor conserva contexto y permiso;
- la persona puede detener la secuencia;
- no se oculta una diferencia o advertencia.

---

#### 14. Precarga, defaults y memoria de sesión

Se aplican las reglas de `UX-BASE-007`.

Podrán conservarse durante una secuencia:

- contexto de estación;
- filtro de tarea;
- unidad seleccionada compatible;
- LOC o recurso padre cuando el alcance permanezca visible;
- método de captura;
- valores comunes aprobados para un lote;
- preferencias no autoritativas.

No se conservarán silenciosamente:

- actor de otra sesión;
- sede operativa después de cambiar turno;
- aprobación anterior;
- cantidad física;
- destinatario cuando cambie el recurso;
- valor sensible;
- excepción;
- firma;
- decisión irreversible.

Toda memoria que afecte el resultado será visible y corregible.

---

#### 15. Confirmaciones proporcionales al riesgo

La confirmación no será universal ni inexistente.

Niveles iniciales:

```text
NO_EXTRA_CONFIRMATION
INLINE_ACKNOWLEDGEMENT
SUMMARY_CONFIRMATION
STEP_UP_CONFIRMATION
DUAL_CONTROL
```

Podrá omitirse una pantalla adicional cuando la acción sea:

- reversible;
- de bajo impacto;
- claramente expresada;
- idempotente;
- visible inmediatamente;
- fácil de corregir.

Se exigirá confirmación reforzada cuando exista:

- movimiento físico o financiero material;
- aceptación de custodia;
- eliminación o cancelación;
- publicación masiva;
- cambio de precios o permisos;
- cierre irreversible;
- dato sensible;
- excepción;
- divergencia relevante;
- efecto sobre terceros.

No se utilizarán confirmaciones genéricas repetidas que las personas aprenden a
aceptar sin leer.

---

#### 16. Repetición y operaciones por lotes

Para tareas repetidas sobre elementos compatibles se permitirá:

- aplicar contexto común una vez;
- escanear secuencialmente;
- mantener una cola local visible;
- registrar valores por línea sin reabrir pantallas;
- confirmar un resumen;
- separar excepciones;
- deshacer o corregir antes del commit cuando sea posible.

El lote declarará:

- alcance;
- cantidad de elementos;
- regla común;
- elementos excluidos;
- diferencias;
- efecto total;
- autorización;
- estado parcial.

```text
LOTE RÁPIDO
≠ APLICAR CIEGAMENTE A TODO
```

Los éxitos parciales no se repetirán cuando fallen otras líneas.

---

#### 17. Escaneo, periféricos y captura contextual

La modalidad más rápida no se elegirá por moda tecnológica.

Para cada paso se compararán:

- toque visual;
- escáner fijo;
- cámara;
- escáner portátil;
- báscula u otro periférico;
- captura automática desde contexto;
- modalidad híbrida;
- contingencia manual.

La elección dependerá de frecuencia, movilidad, ergonomía, higiene, manos
ocupadas, riesgo, trazabilidad, conectividad y mantenimiento.

Ejemplo:

```text
ESCANEAR LOC
→ RESOLVER UBICACIÓN
→ MOSTRAR CONTEXTO
→ CAPTURAR CANTIDAD
```

es preferible a navegar por sede, bodega, estantería y nivel cuando el código es
confiable y la estación lo permite.

---

#### 18. Transiciones entre aplicaciones

Un cambio de aplicación no podrá reiniciar el proceso.

```text
TAREA EN APLICACIÓN A
→ DEEP LINK SEMÁNTICO
→ APLICACIÓN PROPIETARIA B
→ REVALIDACIÓN
→ ACCIÓN
→ RETORNO O SIGUIENTE PASO
```

Se conservarán referencias a:

- proceso;
- tarea;
- recurso;
- versión;
- actor y contexto como referencias no autoritativas;
- origen de retorno;
- acción pendiente.

No se transportarán permisos, tokens, autoridad ni estado objetivo impuesto por
el cliente.

---

#### 19. Espera, latencia y respuesta progresiva

Reducir pasos incluye reducir esperas evitables.

Se podrán aplicar:

- precarga de la siguiente tarea probable;
- carga paralela de datos independientes;
- caché con versión y vigencia;
- optimismo solo para acciones reversibles y seguras;
- skeletons que conserven estructura;
- resultados parciales claramente identificados;
- procesamiento asíncrono con receipt;
- actualización en segundo plano.

No se simulará éxito antes de la confirmación autoritativa.

```text
RESPUESTA VISUAL RÁPIDA
≠ EFECTO EMPRESARIAL CONFIRMADO
```

---

#### 20. Sesión y reautenticación

No se solicitará PIN, contraseña o step-up repetidamente dentro de una secuencia
sin cambio material de riesgo.

La reautenticación podrá exigirse por:

- sesión vencida;
- cambio de actor;
- cambio a una acción sensible;
- elevación temporal;
- dispositivo compartido sin atribución vigente;
- operación financiera, de permisos o privacidad;
- política de vigencia.

```text
REUTILIZAR UNA SESIÓN VÁLIDA
≠ OMITIR AUTORIZACIÓN POR ACCIÓN
```

Cada comando seguirá evaluando permiso, contexto y recurso en servidor.

---

#### 21. Idempotencia y doble toque

Una interfaz rápida aumenta el riesgo de doble activación.

Toda acción frecuente reintentable deberá:

- deshabilitar o controlar activación repetida durante el envío;
- obtener una clave idempotente estable;
- mostrar estado pendiente;
- recuperar el resultado original;
- distinguir timeout de rechazo;
- no duplicar movimientos, pagos, recepciones, impresiones ni handoffs;
- permitir consultar el receipt.

Un botón visualmente bloqueado no será la única defensa. La frontera de servidor
deberá ser idempotente y concurrente de forma segura.

---

#### 22. Offline y conectividad inestable

El camino frecuente declarará uno de estos modos:

```text
ONLINE_REQUIRED
OFFLINE_CAPTURE_ALLOWED
OFFLINE_QUEUE_ALLOWED
STALE_READ_ONLY
MANUAL_CONTINGENCY
```

Cuando exista capacidad offline:

- se conservará el punto de la tarea;
- se capturarán únicamente acciones permitidas;
- se mostrará qué está pendiente;
- se mantendrá actor y contexto;
- se revalidará al sincronizar;
- no se repetirá trabajo confirmado;
- los conflictos saldrán del flujo ordinario.

El diseño detallado de conectividad corresponde a `UX-BASE-013` y la reanudación
a `UX-BASE-014`.

---

#### 23. Dispositivos compartidos

La optimización en kioscos y tablets compartidas no permitirá sesión humana
permanente.

Se podrá acelerar mediante:

- identificación rápida aprobada;
- estación y aplicación precargadas;
- cola limitada al territorio del equipo;
- reanudación de tareas del actor identificado;
- limpieza automática al cerrar o vencer sesión;
- acción principal de gran tamaño;
- escaneo de recurso.

No se reutilizarán:

- actor anterior;
- PIN;
- firma;
- borrador personal;
- permisos;
- selecciones sensibles;
- tareas privadas.

---

#### 24. Ergonomía y accesibilidad

Reducir pasos también implica reducir precisión motora y esfuerzo.

El camino frecuente deberá:

- permitir operación táctil adecuada;
- evitar targets pequeños;
- minimizar teclado;
- mantener orden de foco lógico;
- evitar desplazamientos horizontales innecesarios;
- ofrecer acciones por teclado cuando aplique;
- anunciar cambios y resultados;
- no depender de gestos ocultos;
- permitir deshacer o corregir;
- evitar timeouts demasiado cortos;
- funcionar con manos ocupadas, guantes o ambiente real cuando corresponda.

El diseño táctil físico se concretará en `UX-BASE-011` y `UX-STATION-*`.

---

#### 25. Ejemplo NEXO — retiro frecuente

Camino objetivo conceptual:

```text
ESCANEAR LOC
→ VER PRODUCTOS DISPONIBLES Y CONTEXTO
→ SELECCIONAR PRODUCTO O ESCANEARLO
→ REGISTRAR CANTIDAD Y UNIDAD
→ CONFIRMAR RESUMEN
→ RECIBIR RECEIPT Y CONTINUAR
```

No deberá exigir:

- escoger nuevamente sede y área;
- navegar por el catálogo completo;
- escribir el código de LOC;
- abrir y cerrar una pantalla por cada unidad;
- volver a buscar el producto después de confirmar;
- repetir el movimiento ante un timeout sin consultar estado.

La conversión de paquete a unidad deberá estar visible y validada; no se ocultará
para ahorrar un paso.

---

#### 26. Ejemplo ORIGO — recepción de compra

Camino objetivo conceptual:

```text
ABRIR ORDEN ASIGNADA
→ ESCANEAR O SELECCIONAR LÍNEA
→ REGISTRAR CANTIDAD, LOTE, VENCIMIENTO Y CALIDAD
→ SEPARAR DIFERENCIAS
→ CONFIRMAR RECEPCIÓN
→ GENERAR MOVIMIENTOS Y NOVEDADES
```

Los datos de proveedor, orden y producto se reutilizan. La cantidad física se
captura. Las diferencias no obligan a abandonar todas las líneas correctas.

---

#### 27. Ejemplo FOGO — producción repetitiva

```text
ABRIR LOTE PLANIFICADO
→ CONFIRMAR RECURSOS Y RECETA VIGENTE
→ CAPTURAR CONSUMOS Y CONTROLES EN SECUENCIA
→ REGISTRAR RENDIMIENTO
→ REVISAR DIFERENCIAS
→ CERRAR O ENVIAR A LIBERACIÓN
```

No se abrirá una pantalla distinta para cada control si pueden conservarse
contexto, orden y evidencia en una secuencia clara.

---

#### 28. Ejemplo PULSO — servicio y pago

La persona no deberá reconstruir pedido, mesa, cliente, total o canal.

El flujo podrá llevar directamente desde pedido pendiente a:

- preparar o entregar;
- registrar método de pago;
- confirmar propina cuando corresponda;
- emitir comprobante;
- cerrar el pedido.

El pago seguirá teniendo confirmación proporcional al riesgo. La reducción de
pasos no mezclará pago iniciado, aprobado, rechazado y conciliado.

---

#### 29. Ejemplo ANIMA, TALENTO y VISO

- ANIMA abrirá la acción personal pendiente, no una portada general.
- TALENTO presentará la siguiente evaluación, documento o decisión requerida.
- VISO agrupará decisiones administrativas compatibles con resumen de impacto.
- La aprobación no se combinará con la ejecución cuando exista segregación.
- Una acción masiva mostrará alcance, excepciones y resultado parcial.

---

#### 30. NUMERA no recaptura para acelerar

La eficiencia de NUMERA procederá de consumir contratos y eventos de origen.

```text
IMPORTAR, CLASIFICAR Y CONCILIAR
≠ COPIAR MANUALMENTE LA OPERACIÓN
```

Los atajos contables no podrán inventar ventas, recepciones, consumos o pagos
que pertenecen a otras aplicaciones.

---

#### 31. Ruta ordinaria y excepciones

```text
CAMINO FRECUENTE
→ SOLO CASOS ORDINARIOS COMPATIBLES

DIFERENCIA MATERIAL O EXCEPCIÓN
→ RUTA SEPARADA
```

No se añadirán campos opcionales, overrides, ajustes y motivos excepcionales al
flujo principal para evitar otra pantalla.

La separación definitiva de acciones excepcionales corresponde a
`UX-BASE-009`.

---

#### 32. Divulgación progresiva

La información secundaria y las opciones avanzadas podrán mantenerse accesibles
sin ocupar el camino principal.

No se diseñará todavía la jerarquía final. Esa definición corresponde a
`UX-BASE-010`.

Esta tarea únicamente fija que ocultar complejidad no puede ocultar:

- contexto efectivo;
- efecto de la acción;
- riesgos materiales;
- diferencias;
- evidencia;
- bloqueo;
- estado pendiente;
- información necesaria para decidir.

---

#### 33. Dependencia de estaciones reales

No se aprobará una reducción basada solo en mockups.

La modalidad deberá probarse considerando:

- distancia al dispositivo;
- montaje;
- movilidad;
- ruido;
- iluminación;
- manos ocupadas;
- guantes;
- humedad o grasa;
- escáner y periféricos;
- energía y conectividad;
- cambio de actor;
- picos reales.

`UX-STATION-002` a `UX-STATION-012` definirán y validarán las modalidades físicas.

---

#### 34. Métricas válidas

La mejora se medirá con:

- tasa de finalización correcta;
- tiempo end-to-end;
- tiempo activo y de espera;
- toques y campos manuales;
- uso de teclado;
- desplazamientos o cambios de estación;
- aplicaciones y pantallas atravesadas;
- retrocesos;
- abandonos;
- errores y correcciones;
- reintentos;
- conflictos;
- acciones duplicadas evitadas;
- recuperación exitosa;
- uso de contingencia;
- satisfacción y comprensión de trabajadores.

No se utilizarán las métricas para:

- comparar velocidad individual sin contexto;
- sancionar a quien registra una diferencia;
- incentivar omisión de controles;
- ocultar condiciones físicas deficientes;
- convertir cada segundo en vigilancia laboral.

---

#### 35. Criterio de éxito

Una reducción será válida cuando:

```text
MISMO O MEJOR RESULTADO
+
MISMO O MEJOR CONTROL
+
MENOR FRICCIÓN
+
RECUPERACIÓN NO PEOR
```

Deberá rechazarse si mejora el tiempo promedio pero aumenta:

- errores materiales;
- operaciones duplicadas;
- diferencias no registradas;
- bypass de permisos;
- exposición de datos;
- trabajo perdido;
- carga sobre otro actor;
- uso de contingencias;
- dificultad de personas con discapacidad.

---

#### 36. Antipatrones prohibidos

```text
AUTOAPROBAR PORQUE ES FRECUENTE
```

```text
OCULTAR EL EFECTO PARA AHORRAR UNA PANTALLA
```

```text
USAR EL ÚLTIMO VALOR COMO HECHO ACTUAL
```

```text
UN BOTÓN QUE EJECUTA VARIOS EFECTOS NO EXPLICADOS
```

```text
CONFIRMACIÓN GENÉRICA PARA TODO
```

```text
QUITAR SEGREGACIÓN PARA EVITAR UN HANDOFF
```

```text
ABRIR LA APLICACIÓN EN VEZ DE LA TAREA
```

```text
OPTIMIZAR SOLO EL FRONTEND Y MANTENER COPIAS MANUALES ENTRE APPS
```

```text
MEDIR CLICS SIN MEDIR ERRORES Y RECUPERACIÓN
```

---

#### 37. Aplicación posterior

| Decisión o implementación           | Tarea propietaria                     |
| ----------------------------------- | ------------------------------------- |
| separar excepciones                 | `UX-BASE-009`                         |
| divulgar opciones avanzadas         | `UX-BASE-010`                         |
| diseño táctil                       | `UX-BASE-011`                         |
| conectividad inestable              | `UX-BASE-013`                         |
| reanudación                         | `UX-BASE-014`                         |
| terminología con trabajadores       | `UX-BASE-015`                         |
| modalidad física y periféricos      | `UX-STATION-002` a `UX-STATION-012`   |
| clasificación de rutas y frecuencia | `AUTH-UI-001` a `AUTH-UI-060`         |
| contrato de pantallas por proceso   | `PROC-SCREEN-001` a `PROC-SCREEN-028` |
| cobertura de procesos               | `PROC-COVER-001` a `PROC-COVER-010`   |
| colas, leases e idempotencia        | `QUEUE-ARC-001` a `QUEUE-ARC-012`     |
| integración cross-app               | `INT-APP-001` a `INT-APP-010`         |
| pruebas y certificación             | `UX-QA-001` a `UX-QA-030`             |

No se crea una tarea nueva porque las familias existentes cubren la
materialización y validación.

---

#### 38. Migración del estado actual

Cada flujo actual se clasificará como:

```text
CONFORME
PASO ELIMINABLE
PASO FUSIONABLE
PASO AUTOMATIZABLE
CAPTURA DUPLICADA
CONFIRMACIÓN EXCESIVA
CONTROL NECESARIO MAL DISEÑADO
NAVEGACIÓN INNECESARIA
LATENCIA EVITABLE
EXCEPCIÓN MEZCLADA
DEPENDENCIA LEGACY
REQUIERE OBSERVACIÓN
```

La migración seguirá:

```text
INVENTARIAR
→ MEDIR LÍNEA BASE
→ CLASIFICAR PASOS
→ DISEÑAR CAMINO OBJETIVO
→ PROTOTIPAR
→ PROBAR CON TRABAJADORES
→ COMPARAR RESULTADOS Y RIESGO
→ PILOTAR
→ DESPLEGAR CON ROLLBACK
→ RETIRAR LEGACY
```

No se retirará un paso antes de tener reemplazo, pruebas y evidencia.

---

#### 39. Requisitos de prueba derivados

**Resultado:** GENERA 21 REQUISITOS DE PRUEBA.

Se incorporan en el registro canónico completo:

```text
TREQ-UX-139 a TREQ-UX-159
```

Protegen:

1. identificación basada en evidencia de tareas frecuentes;
2. línea base de fricción end-to-end;
3. camino ordinario mínimo;
4. conservación de controles y evidencia;
5. validación temprana de precondiciones;
6. continuidad desde la tarea y transición local;
7. confirmaciones proporcionales al riesgo;
8. defaults y memoria de sesión seguros;
9. repetición y lotes compatibles;
10. modalidad de interacción y periféricos;
11. continuidad entre aplicaciones;
12. latencia, prefetch y estado de confirmación;
13. sesión válida y step-up proporcional;
14. idempotencia y concurrencia;
15. offline y sincronización;
16. dispositivos compartidos;
17. ergonomía y accesibilidad;
18. recuperación sin rehacer trabajo;
19. separación de excepciones;
20. métricas con guardrails laborales;
21. migración, prototipo y validación real.

---

#### 40. Criterios de aceptación

- [ ] Se define la tarea frecuente mediante evidencia y no por intuición.
- [ ] Se exige línea base end-to-end por actor, contexto y estación.
- [ ] Cada paso se clasifica antes de eliminarse o fusionarse.
- [ ] La optimización considera tiempo, toques, desplazamiento, espera, carga cognitiva, error y recuperación.
- [ ] Se define un camino ordinario mínimo desde tarea hasta resultado.
- [ ] Autorización, atribución, segregación, custodia, evidencia e idempotencia permanecen obligatorias.
- [ ] Las precondiciones conocidas se validan antes de solicitar trabajo.
- [ ] La tarea abre en el recurso y punto de continuidad correctos.
- [ ] Los ciclos lista-modal-lista se reducen cuando existe transición segura.
- [ ] Defaults y memoria de sesión no se convierten en hechos autoritativos.
- [ ] Las confirmaciones se ajustan al riesgo y no se vuelven ruido habitual.
- [ ] Los lotes muestran alcance, diferencias, excepciones y resultados parciales.
- [ ] La modalidad de interacción depende de operación real y estación.
- [ ] Los cambios entre aplicaciones conservan el proceso y revalidan autoridad.
- [ ] La respuesta visual rápida no se confunde con confirmación empresarial.
- [ ] El step-up no se repite sin cambio material de riesgo.
- [ ] Doble toque, timeout y reintento no duplican efectos.
- [ ] Offline conserva estado, revalida y sincroniza una sola vez.
- [ ] Los dispositivos compartidos no retienen al actor anterior.
- [ ] Se incluyen accesibilidad, ergonomía y condiciones físicas reales.
- [ ] Las métricas no incentivan omitir controles ni vigilan velocidad individual sin contexto.
- [ ] Toda excepción permanece destinada a `UX-BASE-009`.
- [ ] Toda opción avanzada permanece destinada a `UX-BASE-010`.
- [ ] Toda brecha queda vinculada a una tarea o familia canónica responsable.
- [ ] Se generó el registro completo con `TREQ-UX-139` a `TREQ-UX-159`.
- [ ] No se implementaron componentes, código, migraciones ni cambios físicos.
- [ ] `UX-BASE-009` permanece sin iniciar.

---

#### 41. Estado y continuidad

```text
UX-BASE-007   APROBADA
UX-BASE-008   APROBADA
UX-BASE-009   NO INICIADA
```

No se inicia `UX-BASE-009` hasta la aprobación expresa de esta tarea y una
solicitud explícita de continuidad.


### ✅ UX-BASE-009 — Mantener acciones excepcionales fuera del flujo ordinario

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `UX-BASE-008 — Reducir pasos para tareas frecuentes` — APROBADA  
**Siguiente tarea reservada:** `UX-BASE-010 — Aplicar divulgación progresiva a opciones avanzadas`  
**Artefacto producido:** `UX-EXCEPTIONAL-ACTION-SEPARATION-CONTRACT-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069` y procesos futuros incorporados al catálogo canónico  
**Aplicaciones cubiertas:** SHELL, ANIMA, NEXO, FOGO, ORIGO, PULSO, VISO, NUMERA, TALENTO, PASS, AURA y aplicaciones futuras de Vento OS  
**Naturaleza:** principio transversal de separación, solicitud, autorización, ejecución, expiración, retorno, conciliación y auditoría de acciones excepcionales  
**Cambios en código, componentes, rutas, permisos, roles, tablas, RLS, RPC, Supabase o aplicaciones:** no autorizados

---

#### 1. Propósito

Definir el contrato mediante el cual Vento OS mantendrá cancelaciones, anulaciones,
reversiones, compensaciones, correcciones, overrides, contingencias, reaperturas,
cuarentenas, escalaciones y demás acciones extraordinarias fuera del camino
ordinario de ejecución.

La experiencia deberá asegurar que una excepción:

- no compita visualmente con la acción frecuente;
- no pueda ejecutarse por error, costumbre o jerarquía informal;
- no sea un botón que escriba directamente un estado;
- no convierta una regla temporal en comportamiento permanente;
- no borre ni reinterprete silenciosamente hechos confirmados;
- no permita que quien solicita se autoapruebe cuando exista segregación;
- conserve actor, autoridad, causa, evidencia, alcance, vigencia y efectos;
- tenga una salida definida hacia operación normal, cierre, revisión o conciliación.

Regla de alto nivel:

```text
CAMINO ORDINARIO
→ visible, directo y optimizado

SITUACIÓN EXCEPCIONAL
→ ruta separada
→ autoridad y controles propios
→ resultado vinculado
→ retorno o cierre explícito
```

---

#### 2. Continuidad lógica

```text
CAPTURAR CADA HECHO UNA VEZ
UX-BASE-007
        ↓
REDUCIR EL CAMINO FRECUENTE
UX-BASE-008
        ↓
SEPARAR ACCIONES EXCEPCIONALES
UX-BASE-009
        ↓
REVELAR OPCIONES AVANZADAS PROGRESIVAMENTE
UX-BASE-010
```

`UX-BASE-008` definió que el camino frecuente solo contiene casos ordinarios
compatibles. Esta tarea congela la frontera entre ese camino y las acciones
extraordinarias. `UX-BASE-010` definirá después cómo presentar opciones avanzadas
sin volver a mezclar ambos carriles.

---

#### 3. Base canónica heredada

Esta tarea aplica en experiencia las decisiones ya aprobadas en:

- `PROC-CAT-013 — Definir acciones excepcionales`;
- `PROC-CAT-014 — Definir cancelación, reversión y corrección`;
- `PROC-CAT-017 — Definir eventos empresariales emitidos`;
- `PROC-CAT-018 — Definir auditoría necesaria`;
- `AUTH-RBAC-*`, `AUTH-CTX-*`, `AUTH-DEC-*`, `AUTH-DEV-*` y familias posteriores de autorización;
- `UX-BASE-001` a `UX-BASE-008`.

Principios heredados:

```text
EXCEPCIÓN NO DECLARADA
→ DENEGADA POR DEFECTO
```

```text
ACCIÓN EXCEPCIONAL
≠ ESCRITURA DIRECTA DE ESTADO
```

```text
REABRIR
→ CREAR REVISIÓN O INSTANCIA VINCULADA
→ NO MODIFICAR EL FINAL ORIGINAL
```

```text
REVERSIÓN EMPRESARIAL
→ ACCIÓN NUEVA Y AUDITABLE
→ NO ROLLBACK TÉCNICO DEL HECHO ORIGINAL
```

---

#### 4. Problema que se corrige

Una experiencia mezcla excepciones con el flujo normal cuando:

- `Cancelar`, `Forzar`, `Anular`, `Reabrir` o `Ajustar` aparecen junto al CTA principal;
- todos los usuarios ven acciones extraordinarias aunque no puedan usarlas;
- un menú de tres puntos contiene operaciones destructivas sin contexto;
- el trabajador utiliza un override porque el camino ordinario es defectuoso;
- un motivo libre es el único control;
- la interfaz permite editar directamente el estado o saldo;
- una contingencia manual queda activada indefinidamente;
- un gerente resuelve una excepción ejecutando la tarea como si fuera el trabajador;
- una reversa se presenta como si eliminara el hecho original;
- una corrección sobrescribe el histórico;
- una reapertura modifica una instancia cerrada;
- una acción sensible se confirma con el mismo patrón que una acción reversible de bajo riesgo.

Las consecuencias incluyen:

- fraude o abuso accidental;
- pérdida de segregación;
- estados imposibles;
- inventario, dinero o custodia sin conciliación;
- excepciones convertidas en hábito;
- controles legales o de seguridad omitidos;
- auditoría insuficiente;
- trabajadores que desconocen el efecto real de una acción;
- imposibilidad de volver a la operación normal.

---

#### 5. Decisión principal

Regla canónica:

```text
ACCIÓN ORDINARIA
→ CAMINO ORDINARIO

ACCIÓN EXCEPCIONAL
→ CASO EXCEPCIONAL IDENTIFICADO
→ RUTA DIFERENCIADA
→ AUTORIDAD ESPECÍFICA
→ MOTIVO Y EVIDENCIA
→ EJECUCIÓN VINCULADA
→ CONCILIACIÓN
→ RETORNO O CIERRE
```

La excepción no ampliará el conjunto de acciones ordinarias disponibles para el
actor.

```text
APROBAR UNA EXCEPCIÓN
≠ CAMBIAR EL ROL PERMANENTE
≠ CREAR UN PERMISO IMPLÍCITO
≠ HABILITAR TODAS LAS EXCEPCIONES
```

---

#### 6. Separaciones conceptuales obligatorias

```text
REPORTAR UNA NOVEDAD
≠ SOLICITAR UNA EXCEPCIÓN
≠ APROBARLA
≠ EJECUTARLA
```

```text
BLOQUEO
≠ EXCEPCIÓN APROBADA
```

```text
PERMISO ORDINARIO
≠ AUTORIDAD EXCEPCIONAL
```

```text
OVERRIDE TEMPORAL
≠ CAMBIO DE POLÍTICA
```

```text
CANCELAR
≠ ANULAR
≠ REVERTIR
≠ COMPENSAR
≠ CORREGIR
≠ REABRIR
```

```text
EMERGENCIA
≠ BYPASS GENERAL
```

```text
MODO CONTINGENCIA
≠ OPERACIÓN NORMAL ALTERNATIVA PERMANENTE
```

```text
ACCIÓN APROBADA
≠ EFECTO COMPLETAMENTE CONCILIADO
```

---

#### 7. Clasificación de la situación antes de abrir la ruta

La interfaz no ofrecerá una excepción genérica llamada `Forzar`.

Primero clasificará el problema:

| Situación                                         | Ruta conceptual                                          |
| ------------------------------------------------- | -------------------------------------------------------- |
| Falta información                                 | `REQUEST_INFO`                                           |
| Dependencia temporal                              | `HOLD` o `WAITING` ordinario, según contrato             |
| Requiere autoridad superior                       | `ESCALATE`                                               |
| Debe cambiar responsable                          | `REASSIGN`                                               |
| Existe riesgo sobre un recurso                    | `QUARANTINE` o `EMERGENCY_SUSPEND`                       |
| Se necesita una ruta alterna                      | `CONTINGENCY`, `SUBSTITUTE` o `REROUTE`                  |
| Solo una parte puede continuar                    | `PARTIAL` o `SPLIT`                                      |
| Debe repetirse una interacción                    | `RETRY` controlado                                       |
| Se solicita excepción temporal                    | `OVERRIDE`                                               |
| Se requiere nueva verificación                    | `REQUEST_RETEST`                                         |
| Debe terminar excepcionalmente                    | `REJECT`, `WITHDRAW`, `EXPIRE`, `IMPOSSIBLE` o `ABANDON` |
| Debe detenerse trabajo futuro                     | `CANCEL`                                                 |
| El registro nunca debió ser válido                | `VOID`                                                   |
| Existe efecto válido que debe contrarrestarse     | `REVERSE`, `RETURN`, `REFUND`, `REVOKE` o `COMPENSATE`   |
| Existe error factual o clasificatorio             | `CORRECT`, `ADJUST` o `RESTATE`                          |
| Una definición debe reemplazarse prospectivamente | `SUPERSEDE`                                              |
| Debe revisarse un cierre                          | `REOPEN` mediante instancia vinculada                    |

Si la situación cabe en una transición normal, no se abrirá una excepción.

---

#### 8. Unidad mínima: caso excepcional

Toda ruta extraordinaria se apoyará conceptualmente en un caso identificable:

```ts
type ExceptionalActionCase = {
  exception_case_id: string;
  process_id: string;
  process_instance_id: string;
  work_item_id: string | null;
  resource_type: string;
  resource_id: string;
  resource_version: string;

  requested_action_id: string;
  exception_class: string;
  materiality: string;
  risk_level: string;

  requested_by_actor_id: string;
  requested_at: string;
  request_context_id: string;
  reason_code: string;
  reason_detail: string | null;
  evidence_refs: string[];

  approval_policy_id: string;
  approver_actor_ids: string[];
  approved_scope: Record<string, unknown>;
  valid_from: string | null;
  expires_at: string | null;

  execution_status: string;
  executed_by_actor_id: string | null;
  executed_at: string | null;
  idempotency_key: string;
  receipt_id: string | null;

  reconciliation_status: string;
  return_condition: string | null;
  linked_case_ids: string[];
};
```

La forma es documental. No obliga todavía a una tabla, RPC o implementación.

---

#### 9. Entrada a la ruta excepcional

La acción ordinaria bloqueada deberá conservar su contexto y ofrecer, cuando el
actor sea elegible, una entrada separada:

```text
No puedes completar esta recepción porque existen diferencias.

[Revisar diferencias]

Acción secundaria:
[Solicitar tratamiento excepcional]
```

No se utilizará:

```text
[Confirmar] [Forzar] [Anular] [Ajustar] [Cancelar]
```

al mismo nivel visual.

La entrada deberá mostrar antes de abrir:

- nombre humano de la acción;
- efecto general;
- si solo solicita o también ejecuta;
- autoridad necesaria;
- si exige evidencia;
- si es reversible o compensable;
- si afecta terceros, dinero, inventario, acceso o custodia.

---

#### 10. Solicitud, aprobación y ejecución

La experiencia distinguirá tres responsabilidades:

```text
SOLICITANTE
→ describe la situación y aporta evidencia

APROBADOR
→ evalúa autoridad, riesgo, materialidad y alcance

EJECUTOR
→ aplica exactamente la acción aprobada
```

Una persona podrá ocupar más de una función solo cuando la política lo permita de
forma explícita.

Reglas:

1. solicitar no habilita la acción;
2. aprobar no ejecuta automáticamente salvo contrato explícito y seguro;
3. ejecutar revalida autorización, versión y vigencia;
4. un aprobador no podrá ampliar silenciosamente el alcance pedido;
5. cambios materiales exigirán nueva aprobación;
6. la autoaprobación quedará bloqueada cuando exista segregación obligatoria;
7. la interfaz indicará claramente en qué función está actuando la persona.

---

#### 11. Ciclo de vida del caso excepcional

Estados conceptuales:

```text
DRAFT
REQUESTED
UNDER_REVIEW
MORE_INFORMATION_REQUIRED
APPROVED
REJECTED
WITHDRAWN
EXPIRED
SCHEDULED
EXECUTING
EXECUTED
PARTIALLY_EXECUTED
EXECUTION_FAILED_RETRYABLE
EXECUTION_FAILED_TERMINAL
RECONCILIATION_REQUIRED
RECONCILING
CLOSED
SUPERSEDED
CANCELLED
```

Separaciones:

```text
APPROVED
≠ EXECUTED
≠ RECONCILED
≠ CLOSED
```

Un caso no permanecerá indefinidamente en `APPROVED` sin vigencia, responsable ni
tratamiento.

---

#### 12. Motivo estructurado

Toda solicitud utilizará un `reason_code` gobernado para la clase y proceso.

El texto libre será complementario, no la única justificación.

El motivo deberá permitir responder:

- qué condición normal no puede cumplirse;
- por qué no existe una transición ordinaria aplicable;
- qué alcance se solicita;
- qué riesgo se evita o acepta;
- qué evidencia lo demuestra;
- qué ocurrirá si se rechaza;
- qué condición permitirá cerrar o volver al flujo normal.

Quedan prohibidos como justificación suficiente:

```text
urgente
lo pidió gerencia
el sistema no deja
siempre se ha hecho así
corregir error
otro
```

sin clasificación y evidencia adicional.

---

#### 13. Evidencia y materialidad

La evidencia será proporcional al impacto.

Puede incluir:

- observación física;
- fotografía permitida;
- documento o versión;
- conteo independiente;
- confirmación de tercero;
- receipt técnico;
- evento previo;
- comparación antes/después;
- dictamen o revisión especializada;
- aprobación dual.

Niveles conceptuales de materialidad:

```text
LOW
MEDIUM
HIGH
CRITICAL
```

La materialidad considerará:

- dinero;
- cantidad y valor de inventario;
- seguridad física o alimentaria;
- datos personales;
- derechos laborales;
- autoridad y acceso;
- efecto fiscal o legal;
- número de personas o recursos afectados;
- reversibilidad;
- propagación entre aplicaciones.

La interfaz no podrá reducir los controles de una acción crítica porque su uso sea
frecuente.

---

#### 14. Autoridad y segregación

La visibilidad y ejecución se resolverán con:

```text
ACTOR EFECTIVO
+
PERMISO EXCEPCIONAL EXACTO
+
TERRITORIO Y RECURSO
+
ESTADO Y VERSIÓN
+
POLÍTICA DE APROBACIÓN
+
SEGREGACIÓN
+
VIGENCIA
+
AUSENCIA DE DENEGACIÓN
```

No serán autoridad:

- nombre del rol;
- acceso a la pantalla ordinaria;
- propiedad de la aplicación;
- ser gerente de otra sede;
- conocer la URL;
- estar usando un dispositivo compartido;
- haber ejecutado antes una excepción similar;
- recibir una petición por WhatsApp.

La persona que produjo el hecho original podrá quedar impedida para aprobar su
corrección, reversa o ajuste cuando la política lo exija.

---

#### 15. Presentación visual

La interfaz separará las acciones extraordinarias mediante una o más de estas
estrategias, según riesgo:

- enlace secundario bajo el bloqueo;
- panel `Resolver una excepción`;
- página o modal dedicado con contexto completo;
- bandeja administrativa de solicitudes;
- step-up antes de mostrar controles sensibles;
- revisión en dos etapas;
- deep link hacia la aplicación propietaria.

Las acciones destructivas o irreversibles:

- no dependerán solo de color;
- no usarán iconos ambiguos;
- no serán el botón predeterminado;
- no se activarán con un único gesto accidental;
- no se ubicarán junto a acciones frecuentes sin separación y explicación.

---

#### 16. Previsualización del efecto

Antes de confirmar, la interfaz mostrará:

- recurso y versión;
- estado actual;
- acción solicitada;
- alcance exacto;
- efectos futuros bloqueados;
- hechos que permanecerán intactos;
- movimientos, transacciones o registros vinculados que se crearán;
- consumidores que requerirán conciliación;
- obligaciones residuales;
- reversibilidad o compensabilidad;
- fecha de vigencia y expiración;
- responsable posterior.

Ejemplo:

```text
Anular esta remisión no eliminará sus movimientos confirmados.

Se creará una acción vinculada y quedará pendiente la reversa de inventario.
La instancia original permanecerá en el historial.
```

---

#### 17. Cancelar, anular, revertir y corregir

La experiencia usará verbos distintos y explicará el efecto real.

| Acción     | Explicación humana mínima                                    |
| ---------- | ------------------------------------------------------------ |
| Cancelar   | Detiene trabajo futuro; conserva lo ya ejecutado             |
| Anular     | Declara inválido un instrumento que no produjo efecto válido |
| Revertir   | Crea un efecto inverso vinculado                             |
| Devolver   | Crea un movimiento físico de retorno                         |
| Reembolsar | Crea una transacción financiera vinculada                    |
| Compensar  | Crea una obligación que contrarresta un efecto no reversible |
| Corregir   | Registra antes, después, motivo e impacto                    |
| Ajustar    | Registra una diferencia cuantitativa o de condición          |
| Reexpresar | Modifica clasificación o reporte, no el hecho fuente         |
| Reabrir    | Crea una revisión o instancia vinculada                      |

Nunca se utilizará `Eliminar` para ocultar una acción empresarial ya trazable.

---

#### 18. Overrides temporales

Un override deberá ser:

```text
MÍNIMO
ESPECÍFICO
TEMPORAL
REVOCABLE
AUDITABLE
```

Declarará:

- capacidad exacta;
- recurso o conjunto finito;
- actor beneficiario;
- actor aprobador;
- razón;
- inicio y vencimiento;
- límites cuantitativos;
- controles no dispensables;
- condición de revocación;
- uso efectuado;
- revisión posterior.

No permitirá omitir:

- identidad del actor;
- evidencia legalmente obligatoria;
- controles de seguridad;
- integridad de pagos;
- segregación no dispensable;
- privacidad;
- trazabilidad;
- límites del dispositivo.

Al expirar:

```text
OVERRIDE EXPIRADO
→ NO SE RENUEVA SILENCIOSAMENTE
→ BLOQUEA NUEVO USO
→ CONSERVA HISTORIAL
→ RECONCILIA EFECTOS PENDIENTES
```

---

#### 19. Emergencia y contención

Una emergencia puede justificar detener, aislar o preservar antes de completar la
aprobación ordinaria.

Ruta:

```text
RIESGO INMEDIATO
→ CONTENCIÓN MÍNIMA AUTORIZADA
→ REGISTRO INMEDIATO
→ PROTECCIÓN DE PERSONAS, RECURSOS O EVIDENCIA
→ REVISIÓN POSTERIOR OBLIGATORIA
→ LIBERACIÓN, ESCALAMIENTO O ACCIÓN DEFINITIVA
```

La emergencia:

- no concede autoridad general;
- no permite borrar evidencia;
- no transforma al ejecutor en aprobador definitivo;
- no permanece activa sin revisión;
- no reemplaza el proceso de corrección, reversa o investigación.

---

#### 20. Contingencias

Una contingencia manual o alternativa declarará:

- causa de activación;
- alcance;
- actor y estación;
- procedimiento temporal;
- datos mínimos capturados;
- identificadores manuales;
- custodia;
- vigencia;
- responsable de digitación o importación posterior;
- regla de reconciliación;
- criterio de desactivación.

```text
CONTINGENCIA RESUELTA
→ NO SIGNIFICA DATOS CONCILIADOS
```

La ruta normal no volverá a habilitarse plenamente hasta que los efectos críticos
estén conciliados o exista una excepción explícita para hacerlo.

---

#### 21. Retorno al flujo ordinario

Toda excepción temporal definirá un `return_condition`.

Posibles resultados:

```text
RETURN_TO_SAME_STEP
RETURN_TO_NEXT_VALID_STEP
HANDOFF_TO_ANOTHER_ACTOR
CLOSE_EXCEPTIONALLY
OPEN_LINKED_REVIEW
RECONCILIATION_REQUIRED
NO_RETURN_ALLOWED
```

Al volver se recalcularán:

- actor;
- permiso;
- contexto;
- recurso y versión;
- estado;
- tareas y claims;
- datos visibles;
- siguiente acción.

No se conservará una interfaz en `modo excepción` después de cerrar el caso.

---

#### 22. Estados parciales y fallos

Una excepción por lotes o con varios efectos podrá quedar:

```text
PARTIALLY_EXECUTED
RECONCILIATION_REQUIRED
```

La interfaz deberá mostrar:

- qué se ejecutó;
- qué no se ejecutó;
- qué quedó pendiente;
- qué no debe repetirse;
- quién conserva la responsabilidad;
- siguiente acción segura;
- receipt y referencia.

Ante timeout:

```text
RESPUESTA AUSENTE
≠ EXCEPCIÓN NO EJECUTADA
```

Se consultará el resultado original mediante idempotencia y conciliación antes de
ofrecer repetir.

---

#### 23. Concurrencia

La aprobación y ejecución deberán validar la misma versión o una versión
compatible del recurso.

Si cambia materialmente:

```text
APROBACIÓN OBSOLETA
→ NO EJECUTAR
→ MOSTRAR CAMBIO
→ REVISAR ALCANCE
→ SOLICITAR NUEVA APROBACIÓN
```

No se permitirá:

- aprobar dos overrides incompatibles;
- ejecutar una reversa sobre un efecto ya revertido;
- corregir simultáneamente la misma versión sin resolución de conflicto;
- cerrar el caso mientras existe ejecución pendiente;
- reabrir una instancia ya reemplazada por otra revisión activa incompatible.

---

#### 24. Offline

Por defecto, la aprobación y ejecución de acciones excepcionales sensibles será:

```text
ONLINE_REQUIRED
```

Offline podrá, cuando la política lo permita:

- reportar la novedad;
- guardar borrador;
- capturar evidencia local;
- activar contención física mínima previamente autorizada;
- registrar una contingencia manual.

No podrá offline, salvo contrato específico y limitado:

- aprobar overrides;
- ampliar alcance;
- anular instrumentos;
- revertir inventario o dinero;
- cambiar permisos;
- corregir registros autoritativos;
- ejecutar una acción con versión no revalidada.

---

#### 25. Dispositivos compartidos

En una estación compartida:

- el actor humano deberá estar identificado;
- el dispositivo solo limitará capacidades;
- solicitudes en borrador no pasarán al siguiente actor;
- evidencias personales se limpiarán al cerrar la sesión;
- aprobaciones sensibles requerirán sesión personal o step-up;
- acciones administrativas no permanecerán expuestas después de usarse;
- el worker técnico del dispositivo no figurará como aprobador ni ejecutor humano.

Una excepción no podrá utilizarse para convertir el kiosco en backoffice general.

---

#### 26. Cross-app

La aplicación propietaria del proceso o acción conservará la ejecución autoritativa.

```text
APLICACIÓN CONSUMIDORA
→ EXPLICA Y SOLICITA
→ DEEP LINK SEMÁNTICO

APLICACIÓN PROPIETARIA
→ REVALIDA
→ APRUEBA O EJECUTA
→ EMITE RECEIPT Y EVENTO

APLICACIÓN CONSUMIDORA
→ ACTUALIZA SU PROYECCIÓN
```

El deep link transportará referencias opacas y retorno, nunca permiso, aprobación
o estado objetivo.

---

#### 27. Operaciones masivas

Una acción excepcional masiva deberá:

- mostrar el conjunto exacto;
- validar cada elemento;
- excluir incompatibles;
- evitar selección implícita de elementos ocultos;
- resumir materialidad total;
- exigir aprobación acorde con el impacto acumulado;
- utilizar idempotencia por operación y elemento;
- informar resultados parciales;
- permitir descargar o revisar evidencia autorizada.

No se aplicará `Forzar a todos` sobre un conjunto heterogéneo.

---

#### 28. Notificaciones y escalamiento

Una notificación informará:

- qué requiere atención;
- clase de solicitud;
- proceso y recurso permitidos;
- plazo;
- materialidad;
- acción esperada;
- estado del caso.

No incluirá datos sensibles innecesarios.

```text
NOTIFICACIÓN ENVIADA
≠ REVISIÓN INICIADA
≠ APROBACIÓN
≠ EJECUCIÓN
```

Los vencimientos escalarán según política, pero no se autoaprobarán por silencio.

---

#### 29. Seguridad y privacidad

La interfaz minimizará:

- datos personales;
- diagnóstico o información médica;
- salarios;
- datos financieros;
- reglas antifraude;
- identidades de aprobadores cuando no sea necesario;
- evidencia sensible;
- payloads y códigos internos.

Un actor podrá conocer que la solicitud requiere revisión especializada sin ver el
motivo protegido.

Los detalles técnicos quedarán en observabilidad y auditoría restringida, no como
copy principal.

---

#### 30. Accesibilidad

La ruta excepcional:

- será accesible por teclado y lector de pantalla;
- no dependerá de hover, color o gesto oculto;
- anunciará la entrada y salida del modo excepcional;
- mantendrá visible el recurso y efecto;
- permitirá revisar antes de confirmar;
- no utilizará diálogos encadenados que impidan comprender el alcance;
- ofrecerá tiempo suficiente para decisiones sensibles;
- identificará claramente acción primaria, cancelación y regreso seguro.

La separación visual no podrá convertir la excepción legítima en una función
imposible de descubrir para quien realmente la necesita.

---

#### 31. Aplicación por dominio

##### 31.1 NEXO

Camino ordinario:

- solicitar;
- preparar;
- cargar;
- transportar;
- recibir.

Rutas separadas:

- faltante material;
- cambio de destino;
- sustitución;
- recepción parcial;
- cuarentena;
- anulación y reversa;
- ajuste de inventario;
- reasignación de custodia.

##### 31.2 FOGO

Rutas separadas para:

- desviación de receta;
- sustitución no prevista;
- lote en cuarentena;
- liberación extraordinaria;
- rendimiento materialmente distinto;
- reproceso;
- anulación o corrección de lote.

##### 31.3 ORIGO

Rutas separadas para:

- compra urgente;
- proveedor fuera de catálogo;
- exceder tolerancia;
- recepción con diferencia;
- documento inválido;
- devolución;
- cambio de condiciones después de aprobación.

##### 31.4 PULSO y PASS

Rutas separadas para:

- descuento extraordinario;
- entrega sin confirmación ordinaria;
- pago incierto;
- reembolso;
- anulación fiscal;
- ajuste de puntos;
- atención de fraude;
- reapertura de reclamo.

##### 31.5 VISO, TALENTO y ANIMA

Rutas separadas para:

- contratación directa excepcional;
- override temporal de acceso;
- corrección de episodio laboral;
- no continuidad;
- reapertura vinculada;
- permiso sensible;
- ajuste de horario o asistencia con evidencia;
- offboarding excepcional.

##### 31.6 NUMERA

NUMERA no corregirá hechos fuente mediante edición local. Abrirá:

- conciliación;
- reexpresión;
- asiento de ajuste;
- reversa o compensación vinculada;
- solicitud a la aplicación propietaria.

---

#### 32. Métricas y prevención de abuso

Se medirán:

- excepciones por proceso, clase, sede y causa;
- tasa de aprobación y rechazo;
- tiempo de revisión;
- expiraciones;
- ejecución parcial;
- fallos y reintentos;
- conciliación pendiente;
- repetición por actor, recurso o estación;
- excepciones que terminan convirtiéndose en flujo habitual;
- acciones ejecutadas fuera de política;
- diferencias entre solicitante, aprobador y ejecutor;
- impacto material.

Guardrails:

- una alta tasa no se resolverá ocultando reportes;
- una baja tasa no probará que el proceso está sano;
- las métricas no se usarán para sancionar reportes legítimos;
- patrones repetidos deberán originar corrección del proceso o política;
- no se premiará aprobar rápido sin revisar evidencia.

---

#### 33. Migración de interfaces actuales

Cada acción actual deberá inventariarse como:

```text
ORDINARY_VALID
EXCEPTION_DECLARED
EXCEPTION_UNDECLARED
DIRECT_STATE_WRITE
LEGACY_OVERRIDE
DESTRUCTIVE_AMBIGUOUS
DUPLICATE_ACTION
CANDIDATE_FOR_REMOVAL
```

La migración seguirá:

```text
INVENTARIAR
→ VINCULAR CON VPROC Y ACTION_ID
→ CLASIFICAR EFECTO
→ ASIGNAR AUTORIDAD Y SEGREGACIÓN
→ DISEÑAR RUTA SEPARADA
→ PROTOTIPAR
→ PROBAR CON TRABAJADORES Y APROBADORES
→ PILOTAR
→ MEDIR
→ RETIRAR CONTROL LEGACY
```

Un botón legacy no se retirará antes de que el reemplazo cubra las situaciones
reales y exista rollback.

---

#### 34. Propiedad de decisiones diferidas

| Decisión pendiente                              | Tarea o familia propietaria                 |
| ----------------------------------------------- | ------------------------------------------- |
| Presentación progresiva de opciones avanzadas   | `UX-BASE-010`                               |
| Diseño táctil de la ruta excepcional            | `UX-BASE-011`; `UX-STATION-*`               |
| Comportamiento offline detallado                | `UX-BASE-013`; `UX-BASE-014`                |
| Validación del lenguaje con trabajadores        | `UX-BASE-015`                               |
| Inventario y clasificación de rutas reales      | `AUTH-UI-001` a `AUTH-UI-029`               |
| Permisos, ocultamiento y protección de servidor | `AUTH-UI-030` a `AUTH-UI-045`; `AUTH-SRV-*` |
| Contrato concreto de pantalla                   | `PROC-SCREEN-001` a `PROC-SCREEN-028`       |
| Identidad y restricciones de dispositivo        | `AUTH-DEV-001` a `AUTH-DEV-016`             |
| Eventos, colas e idempotencia                   | `INT-APP-*`; `QUEUE-ARC-*`; `AUD-EVT-*`     |
| Evidencia                                       | `EVID-ARC-001` a `EVID-ARC-010`             |
| Observabilidad y detección de abuso             | `OBS-ARC-001` a `OBS-ARC-016`               |
| Implementación y piloto                         | paquetes E5 correspondientes                |

No queda una decisión diferida sin propietario documental.

---

#### 35. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA.

Se incorporan al registro completo:

```text
TREQ-UX-160 a TREQ-UX-181
```

Cubren:

- clasificación ordinaria y excepcional;
- separación visual;
- caso excepcional y snapshot;
- solicitud, aprobación y ejecución;
- lifecycle;
- motivo y evidencia;
- materialidad;
- autorización y segregación;
- overrides;
- emergencia;
- cancelación, reversión y corrección;
- inmutabilidad y acciones vinculadas;
- retorno al flujo normal;
- fallos, idempotencia y concurrencia;
- offline;
- dispositivos compartidos;
- cross-app;
- lotes;
- notificación y privacidad;
- accesibilidad;
- métricas y abuso;
- migración legacy.

---

#### 36. Criterios de aceptación

- [ ] Se distingue con precisión acción ordinaria, bloqueo y acción excepcional.
- [ ] Toda excepción corresponde a una clase y acción canónica declarada.
- [ ] Las acciones excepcionales no compiten con el CTA ordinario.
- [ ] Se distingue reportar, solicitar, aprobar y ejecutar.
- [ ] Existe un caso excepcional con recurso, versión, contexto y linaje.
- [ ] Se define lifecycle desde borrador hasta cierre y conciliación.
- [ ] Motivo libre no es el único control.
- [ ] La evidencia y aprobación son proporcionales a materialidad y riesgo.
- [ ] La autorización se revalida en servidor y respeta segregación.
- [ ] Cancelar, anular, revertir, compensar, corregir y reabrir no se confunden.
- [ ] Ninguna acción reescribe silenciosamente estados, dinero, inventario o historia.
- [ ] Los overrides son mínimos, específicos, temporales y revocables.
- [ ] Las emergencias exigen revisión posterior.
- [ ] Las contingencias tienen activación, reconciliación y desactivación.
- [ ] Toda excepción temporal declara condición de retorno.
- [ ] Los resultados parciales muestran efectos aplicados y pendientes.
- [ ] Timeout y doble envío se resuelven con idempotencia y consulta de estado.
- [ ] Las aprobaciones obsoletas no se ejecutan sobre versiones nuevas.
- [ ] Offline no amplía autoridad ni ejecuta acciones sensibles sin contrato explícito.
- [ ] Los dispositivos compartidos no exponen backoffice ni heredan casos personales.
- [ ] Las aplicaciones consumidoras no ejecutan acciones de otro dominio sin revalidación.
- [ ] Los lotes validan cada elemento y muestran resultados parciales.
- [ ] Notificaciones no equivalen a aprobación ni ejecución.
- [ ] La experiencia protege privacidad y es accesible.
- [ ] Las métricas detectan abuso sin castigar reportes legítimos.
- [ ] Toda brecha y decisión diferida tiene propietario exacto.
- [ ] Se generó el registro completo con `TREQ-UX-160` a `TREQ-UX-181`.
- [ ] No se implementaron componentes, código, migraciones ni cambios físicos.
- [ ] `UX-BASE-010` permanece sin iniciar.

---

#### 37. Estado y continuidad

```text
UX-BASE-008   APROBADA
UX-BASE-009   APROBADA
UX-BASE-010   NO INICIADA
```

No se inicia `UX-BASE-010` hasta la aprobación expresa de esta tarea y una
solicitud explícita de continuidad.


### ✅ UX-BASE-010 — Aplicar divulgación progresiva a opciones avanzadas

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `UX-BASE-009 — Mantener acciones excepcionales fuera del flujo ordinario` — APROBADA  
**Siguiente tarea reservada:** `UX-BASE-011 — Diseñar interfaces táctiles para tablets y kioscos`  
**Artefacto producido:** `UX-PROGRESSIVE-DISCLOSURE-CONTRACT-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069` y procesos futuros incorporados al catálogo canónico  
**Aplicaciones cubiertas:** SHELL, ANIMA, NEXO, FOGO, ORIGO, PULSO, VISO, NUMERA, TALENTO, PASS, AURA y aplicaciones futuras de Vento OS  
**Naturaleza:** principio transversal de jerarquización, descubrimiento, revelado, edición, persistencia, accesibilidad y protección de opciones avanzadas  
**Cambios en código, componentes, rutas, permisos, roles, tablas, RLS, RPC, Supabase o aplicaciones:** no autorizados

---

#### 1. Propósito

Definir el contrato mediante el cual Vento OS presentará primero la información,
las decisiones y las acciones necesarias para completar el caso actual, y revelará
progresivamente detalles, controles, filtros, configuraciones o diagnósticos de
mayor complejidad solo cuando:

- sean relevantes para la intención actual;
- el actor esté autorizado para conocerlos o utilizarlos;
- exista un contexto válido;
- el nivel de riesgo permita su presentación;
- la persona los solicite o una condición objetiva los haga necesarios;
- el patrón de revelado conserve comprensión, accesibilidad y retorno seguro.

La divulgación progresiva deberá reducir carga cognitiva sin esconder:

- obligaciones;
- bloqueos;
- diferencias;
- consecuencias materiales;
- información necesaria para decidir;
- acciones que el actor debe ejecutar;
- evidencia requerida;
- estados de sincronización o conciliación.

Regla de alto nivel:

```text
MOSTRAR PRIMERO
LO NECESARIO PARA ENTENDER Y ACTUAR
        ↓
REVELAR DESPUÉS
LO RELEVANTE PARA PROFUNDIZAR, AJUSTAR O DIAGNOSTICAR
```

---

#### 2. Continuidad lógica

```text
REDUCIR EL CAMINO FRECUENTE
UX-BASE-008
        ↓
SEPARAR EXCEPCIONES
UX-BASE-009
        ↓
REVELAR COMPLEJIDAD AVANZADA PROGRESIVAMENTE
UX-BASE-010
        ↓
ADAPTAR LA INTERACCIÓN A TABLETS Y KIOSCOS
UX-BASE-011
```

`UX-BASE-009` estableció que una acción excepcional no puede ocultarse como una
opción avanzada ordinaria. Esta tarea conserva esa frontera y define cómo
presentar complejidad legítima sin volver a mezclar:

- operación habitual;
- detalle contextual;
- configuración avanzada;
- excepción;
- diagnóstico técnico.

---

#### 3. Base canónica heredada

Esta tarea aplica las decisiones ya aprobadas en:

- `UX-BASE-001` — separación de carriles;
- `UX-BASE-002` — foco en la tarea actual;
- `UX-BASE-003` — lenguaje humano;
- `UX-BASE-004` — relevancia contextual;
- `UX-BASE-005` — contexto visible;
- `UX-BASE-006` — bloqueos explicables;
- `UX-BASE-007` — captura única;
- `UX-BASE-008` — camino frecuente mínimo;
- `UX-BASE-009` — excepciones separadas;
- `AUTH-UI-001` a `AUTH-UI-060` — inventario, clasificación, autorización y experiencia de rutas;
- `PROC-SCREEN-001` a `PROC-SCREEN-028` — contratos posteriores de pantalla;
- `UX-STATION-*` — modalidad y estación física;
- `AUTH-CTX-*`, `AUTH-DEC-*`, `AUTH-SRV-*` y `AUTH-DEV-*` — contexto, autorización y dispositivo.

Principios heredados:

```text
RELEVANTE
≠ AUTORIZADO
```

```text
AUTORIZADO
≠ NECESARIO AHORA
```

```text
OCULTO POR FALTA DE AUTORIZACIÓN
≠ COLAPSADO POR DIVULGACIÓN PROGRESIVA
```

```text
REVELAR UNA OPCIÓN
≠ EJECUTARLA
```

---

#### 4. Problema que se corrige

Una interfaz incumple este principio cuando:

- muestra todos los campos, filtros, columnas y acciones desde el inicio;
- utiliza una pantalla de configuración completa para una tarea operativa simple;
- esconde información crítica dentro de un acordeón cerrado;
- mezcla detalle avanzado con excepciones destructivas;
- utiliza `Más`, `Avanzado` o un icono sin explicar qué contiene;
- revela datos sensibles antes de comprobar autorización;
- abre diez niveles anidados de paneles o modales;
- obliga a navegar a otra pantalla para consultar un dato básico del caso;
- colapsa automáticamente una sección mientras la persona la está editando;
- conserva opciones expandidas de otro trabajador en un dispositivo compartido;
- trata una URL conocida o un favorito como derecho a ver la opción;
- activa un “modo experto” que habilita capacidades amplias sin contexto;
- esconde el resultado, impacto o estado de una acción después de ejecutarla.

Consecuencias:

- carga cognitiva innecesaria;
- errores por selección accidental;
- capacitación extensa;
- descubrimiento deficiente;
- opciones críticas invisibles;
- exposición de datos;
- flujos operativos densos;
- pérdida de contexto;
- configuraciones incorrectas;
- dependencia de usuarios expertos informales.

---

#### 5. Decisión principal

Regla canónica:

```text
PRIMERA CAPA
→ propósito, contexto, estado, tarea y acción necesaria

CAPAS POSTERIORES
→ detalle, comparación, parámetros, configuración o diagnóstico
  justificados por intención, permiso y contexto
```

La divulgación progresiva se aplicará después de resolver:

```text
ACTOR
+
CARRIL
+
TAREA
+
PROCESO Y ETAPA
+
RECURSO
+
CONTEXTO
+
AUTORIZACIÓN
+
RELEVANCIA
```

No se utilizará para compensar una arquitectura de información incorrecta.

---

#### 6. Separaciones conceptuales obligatorias

```text
INFORMACIÓN ESENCIAL
≠ DETALLE COMPLEMENTARIO
≠ OPCIÓN AVANZADA
≠ CONFIGURACIÓN
≠ EXCEPCIÓN
≠ DIAGNÓSTICO TÉCNICO
```

```text
COLAPSAR
≠ OCULTAR POR PERMISO
≠ ELIMINAR
≠ DESHABILITAR
```

```text
DESCUBRIR
≠ AUTORIZAR
≠ PRECARGAR DATOS SENSIBLES
```

```text
PREFERENCIA DE PRESENTACIÓN
≠ CAMBIO DE POLÍTICA
≠ CAMBIO DE CONTEXTO
```

```text
USUARIO EXPERIMENTADO
≠ AUTORIDAD AMPLIADA
```

---

#### 7. Niveles canónicos de divulgación

Cada elemento se clasificará en uno de estos niveles:

| Nivel | Código                            | Semántica                                                            |
| ----- | --------------------------------- | -------------------------------------------------------------------- |
| 0     | `ESSENTIAL_ALWAYS_VISIBLE`        | Necesario para comprender el caso, actuar o evitar un error material |
| 1     | `CONTEXTUAL_ON_DEMAND`            | Detalle útil para verificar o profundizar sin cambiar política       |
| 2     | `ADVANCED_AUTHORIZED`             | Parámetros o acciones avanzadas pertinentes para actores autorizados |
| 3     | `SPECIALIZED_WORKSPACE`           | Trabajo complejo que requiere una superficie o ruta dedicada         |
| 4     | `TECHNICAL_DIAGNOSTIC_RESTRICTED` | Diagnóstico técnico reservado a soporte u observabilidad autorizada  |
| X     | `NOT_DISCLOSABLE`                 | No debe revelarse a ese actor, contexto o finalidad                  |

Regla:

```text
NOT_DISCLOSABLE
≠ ACORDEÓN CERRADO
```

Un elemento no autorizado no será descargado, contado, previsualizado ni
anunciado como si solo estuviera colapsado.

---

#### 8. Contenido que siempre debe permanecer visible

Se clasificará como `ESSENTIAL_ALWAYS_VISIBLE`, cuando aplique:

- identidad del recurso o caso;
- estado real y frescura;
- sede, área, turno y rol activos;
- actor en dispositivo compartido;
- tarea actual;
- acción principal;
- cantidad, importe, fecha o alcance material que será confirmado;
- diferencias que cambian la decisión;
- bloqueo y condición de recuperación;
- información no guardada o pendiente de sincronización;
- consecuencia irreversible o difícilmente reversible;
- quién conserva la custodia;
- resultado parcial;
- datos obligatorios;
- advertencia de simulación o delegación;
- expiración inminente que afecta la acción.

Queda prohibido esconder bajo `Ver detalles`:

```text
SE VA A DESCONTAR INVENTARIO
SE VA A COBRAR O REEMBOLSAR DINERO
SE TRANSFIERE CUSTODIA
SE PUBLICA A TERCEROS
SE REVOCA ACCESO
EXISTE UNA DIFERENCIA MATERIAL
LA OPERACIÓN AÚN NO FUE CONFIRMADA
```

---

#### 9. Criterio para clasificar una opción como avanzada

Una opción podrá ser `ADVANCED_AUTHORIZED` cuando:

1. no sea necesaria para completar correctamente el caso ordinario;
2. solo aplique a una minoría legítima de situaciones;
3. exija conocimiento o autoridad especializada;
4. modifique parámetros, alcance o representación, pero no oculte el efecto;
5. su ausencia inicial reduzca carga cognitiva;
6. siga siendo descubrible para quien la necesita;
7. tenga permiso, contexto y política explícitos;
8. no corresponda a una excepción de `UX-BASE-009`;
9. no sea un dato crítico o una obligación;
10. pueda explicarse con un nombre humano y un resultado previsible.

Ejemplos:

- cambiar el criterio de agrupación de una tabla administrativa;
- añadir columnas autorizadas;
- configurar una vista guardada;
- definir tolerancias dentro de límites permitidos;
- seleccionar una estrategia de impresión autorizada;
- abrir comparación histórica;
- ajustar parámetros de un reporte;
- consultar linaje o evidencia extendida.

---

#### 10. Matriz de decisión de presentación

| Relevante | Autorizado | Necesario ahora          | Tratamiento                                                                                    |
| --------- | ---------- | ------------------------ | ---------------------------------------------------------------------------------------------- |
| No        | No         | No                       | `NOT_DISCLOSABLE`                                                                              |
| No        | Sí         | No                       | Oculto o disponible en una superficie especializada, nunca compitiendo con el caso             |
| Sí        | No         | Sí o No                  | Explicar ausencia solo si la persona debe comprender un bloqueo; no revelar datos ni controles |
| Sí        | Sí         | Sí                       | `ESSENTIAL_ALWAYS_VISIBLE`                                                                     |
| Sí        | Sí         | No, pero útil            | `CONTEXTUAL_ON_DEMAND` o `ADVANCED_AUTHORIZED`                                                 |
| Sí        | Sí         | Complejo y especializado | `SPECIALIZED_WORKSPACE`                                                                        |

La decisión deberá ser reproducible y no depender únicamente de estado local de
frontend.

---

#### 11. Disparadores válidos de revelado

Una capa adicional podrá abrirse por:

- solicitud explícita del usuario;
- selección de un caso que exige detalle;
- diferencia o condición detectada;
- transición a una etapa donde el dato se vuelve necesario;
- cambio explícito de intención;
- ingreso a un carril de configuración, auditoría o supervisión;
- rol o permiso efectivo compatible;
- necesidad de comparar antes de decidir;
- solicitud de ayuda o diagnóstico autorizada.

No se abrirá automáticamente por:

- nombre del rol;
- historial de navegación de otra persona;
- inferencia opaca de “usuario experto”;
- tamaño de pantalla como única razón;
- error técnico que exponga stack o payload;
- presencia de una URL o query string;
- cookie no validada;
- última opción usada en otro contexto.

---

#### 12. Patrones de interacción permitidos

Patrones iniciales:

```text
INLINE_EXPANSION
DETAILS_DRAWER
SECONDARY_PANEL
TABBED_DETAIL
DEDICATED_SPECIALIZED_ROUTE
COMPARE_VIEW
INSPECTOR
CONTEXTUAL_POPOVER
```

Reglas:

- la etiqueta deberá describir el contenido o propósito;
- el control indicará estado expandido o colapsado;
- el regreso conservará la tarea y posición;
- no se encadenarán modales como arquitectura principal;
- una ruta dedicada será preferible a un acordeón interminable;
- el revelado no ejecutará mutaciones;
- los datos se solicitarán con autorización y minimización;
- el nivel abierto no ocultará la acción principal sin una transición explícita.

Etiquetas válidas:

```text
Ver diferencias de cantidades
Mostrar trazabilidad del lote
Añadir columnas financieras
Revisar historial de aprobaciones
Configurar impresión para esta estación
```

Etiquetas insuficientes:

```text
Más
Avanzado
Opciones
Otros
...
```

cuando no exista contexto adicional comprensible.

---

#### 13. Profundidad máxima y rutas especializadas

La interfaz evitará estructuras como:

```text
PANEL
→ ACORDEÓN
→ TAB
→ MODAL
→ SEGUNDO MODAL
→ MENÚ DE TRES PUNTOS
```

Regla inicial:

- máximo dos niveles de revelado dentro de una superficie ordinaria;
- el tercer nivel se convertirá en una superficie especializada;
- una configuración con múltiples secciones, dependencias o preview tendrá ruta propia;
- el regreso llevará al mismo recurso, versión y punto de trabajo;
- la ruta especializada mostrará que se abandonó temporalmente el camino ordinario.

La cifra definitiva se validará por tipo de dispositivo y proceso en
`UX-BASE-011`, `UX-BASE-012` y `UX-STATION-*`.

---

#### 14. Divulgación progresiva no oculta obligaciones

Cuando una condición avanzada se vuelva obligatoria:

```text
OPCIÓN SECUNDARIA
→ CONDICIÓN DETECTADA
→ SE CONVIERTE EN PASO REQUERIDO
→ SE EXPLICA POR QUÉ
```

Ejemplo:

```text
La recepción ordinaria no pide motivo de diferencia.
Al detectar una diferencia, el sistema revela y exige
la clasificación y evidencia correspondientes.
```

No será válido mantener el campo obligatorio dentro de una sección cerrada y
mostrar un error genérico al final.

---

#### 15. Relación con acciones excepcionales

`UX-BASE-009` prevalece:

```text
OPCIÓN AVANZADA
→ amplía detalle o parametrización dentro de la política ordinaria

ACCIÓN EXCEPCIONAL
→ altera una regla, transición, alcance o efecto ordinario
→ exige caso excepcional separado
```

Por tanto, no podrán ocultarse bajo `Opciones avanzadas`:

- forzar;
- anular;
- revertir;
- reabrir;
- aprobar un override;
- editar directamente un estado;
- modificar permisos;
- omitir evidencia;
- saltar una aprobación;
- cambiar retrospectivamente un hecho.

La entrada a una excepción podrá ser secundaria y progresiva, pero al abrirse
cambiará a la ruta excepcional completa, con sus controles propios.

---

#### 16. Estado, edición y pérdida de trabajo

Al expandir una sección editable se conservarán:

- recurso;
- versión;
- actor;
- contexto;
- borrador;
- campos modificados;
- validaciones;
- timestamp;
- estado de guardado.

La interfaz no colapsará automáticamente una sección que tenga:

- cambios sin guardar;
- error de validación;
- operación pendiente;
- upload en curso;
- conflicto;
- evidencia requerida.

Antes de cerrar o cambiar de nivel deberá:

```text
GUARDAR
DESCARTAR
CONTINUAR EDITANDO
```

según la naturaleza del dato.

---

#### 17. Persistencia de preferencias

Se distinguirán:

```text
PREFERENCIA DE CUENTA
PREFERENCIA DE DISPOSITIVO
PREFERENCIA DE ESTACIÓN
ESTADO TEMPORAL DE SESIÓN
ESTADO DEL RECURSO
```

Reglas:

- una preferencia no cambiará autorización ni contexto;
- un dispositivo compartido no conservará expansiones personales entre actores;
- una preferencia de columnas no expondrá campos sin permiso;
- una preferencia incompatible con una versión nueva se invalidará;
- un recurso distinto no heredará borradores o expansiones sensibles;
- el sistema podrá recordar vistas administrativas explícitamente guardadas;
- no se recordarán automáticamente acciones destructivas, overrides o secretos.

---

#### 18. Valores predeterminados y opciones avanzadas

Una opción avanzada podrá tener un valor predeterminado solo si:

- procede de una política versionada;
- es visible antes de producir el efecto;
- es seguro para el caso ordinario;
- no amplía alcance;
- no reutiliza datos de otro actor;
- puede corregirse cuando corresponda;
- queda registrado en el receipt si afecta el resultado.

```text
VALOR COLAPSADO
≠ VALOR DESCONOCIDO PARA EL USUARIO
```

Si un parámetro avanzado afecta dinero, inventario, fecha, destino, privacidad,
calidad, acceso o terceros, su valor efectivo deberá resumirse en la capa
esencial antes de confirmar.

---

#### 19. Revalidación de autorización y contexto

Cada apertura de una capa avanzada deberá respetar:

- actor efectivo;
- permiso de lectura;
- permiso exacto de edición o acción;
- empresa, sede y área;
- recurso y versión;
- sensibilidad;
- vigencia;
- dispositivo;
- simulación o delegación;
- estado del proceso.

La autorización se revalidará en servidor cuando se consulte información
protegida o se ejecute una acción.

```text
CONTROL EXPANDIDO
≠ PERMISO CONGELADO
```

Si el contexto cambia, la capa deberá refrescarse, cerrarse o quedar en modo de
solo lectura según política.

---

#### 20. Datos sensibles y minimización

La divulgación progresiva no será una medida de seguridad suficiente.

```text
DATO COLAPSADO EN EL DOM
≠ DATO PROTEGIDO
```

Los datos sensibles:

- no se enviarán antes de comprobar autorización y finalidad;
- podrán mostrarse resumidos o enmascarados;
- requerirán una acción explícita de revelado cuando corresponda;
- podrán exigir step-up, motivo o auditoría;
- se ocultarán nuevamente al cambiar de actor, contexto o pantalla;
- no aparecerán en títulos, badges, previews o conteos no autorizados;
- no quedarán en caché compartida.

Ejemplos:

```text
Valor total autorizado
→ visible

Detalle de costos unitarios
→ avanzado y autorizado
```

```text
Revisión especializada requerida
→ visible

Diagnóstico médico
→ no revelable al manager ordinario
```

---

#### 21. Experiencia operativa

En operación, la capa inicial deberá privilegiar:

- tarea actual;
- recurso;
- cantidad o elemento a tratar;
- ubicación;
- evidencia inmediata;
- acción principal;
- bloqueo;
- siguiente paso.

Podrán revelarse progresivamente:

- historial del lote;
- detalles del producto;
- instrucciones extendidas;
- trazabilidad completa;
- opciones de impresión permitidas;
- comparación con valores esperados;
- notas complementarias.

No se revelarán ordinariamente:

- configuración global;
- maestros completos;
- auditoría técnica;
- matrices de permisos;
- parámetros de otras sedes;
- acciones excepcionales.

---

#### 22. Experiencia administrativa

La administración admite mayor densidad, pero no deberá mostrar todos los
controles simultáneamente.

La capa inicial priorizará:

- objetivo de la vista;
- periodo;
- territorio;
- estado;
- decisiones pendientes;
- métricas y diferencias relevantes;
- acciones principales.

Podrán revelarse:

- filtros avanzados;
- columnas adicionales;
- agrupaciones;
- comparaciones;
- segmentaciones;
- fórmulas y supuestos;
- linaje;
- parámetros de exportación;
- opciones de visualización.

Una tarea compleja y frecuente podrá justificar una superficie densa dedicada,
lo cual se definirá en `UX-BASE-012`; no se resolverá agregando acordeones a una
pantalla operativa.

---

#### 23. Filtros, columnas y vistas guardadas

Los filtros esenciales deberán permanecer visibles cuando cambien el universo
del análisis, por ejemplo:

- periodo;
- empresa;
- sede;
- estado principal;
- propietario del caso.

Filtros avanzados podrán abrirse en un panel con:

- resumen de filtros activos;
- contador comprensible;
- opción de limpiar selectivamente;
- identificación de filtros ocultos activos;
- guardado explícito de vista;
- nombre y propietario de la vista;
- versión o compatibilidad.

```text
FILTRO AVANZADO ACTIVO
→ SIEMPRE RESUMIDO EN LA CAPA PRINCIPAL
```

No se permitirá que una tabla parezca vacía porque existe un filtro oculto y no
visible.

---

#### 24. Acciones masivas

La selección masiva podrá comenzar simple, pero antes de ejecutar deberá revelar:

- número exacto de elementos;
- alcance territorial;
- efectos comunes;
- elementos incompatibles;
- permisos requeridos;
- consecuencias;
- resultado parcial esperado;
- política de confirmación.

Opciones avanzadas de lote, como segmentación o reglas de aplicación, se
presentarán después de establecer el conjunto exacto.

No existirá una casilla avanzada oculta que cambie silenciosamente el universo o
el efecto de la operación.

---

#### 25. Diagnóstico técnico y soporte

El diagnóstico técnico pertenecerá a un nivel separado:

```text
MENSAJE HUMANO
→ operación ordinaria

REFERENCIA DE SOPORTE
→ usuario y soporte

DETALLE TÉCNICO
→ soporte autorizado u observabilidad
```

El nivel técnico podrá incluir:

- correlation ID;
- reason code;
- versión de contrato;
- estado de sincronización;
- dependencia afectada;
- timestamp;
- diagnóstico seguro.

No expondrá en interfaz ordinaria:

- stack trace;
- SQL;
- secretos;
- tokens;
- payload completo;
- reglas antifraude;
- datos personales no necesarios.

---

#### 26. Tablets, kioscos y dispositivos compartidos

En tablet y kiosco:

- no se dependerá de hover;
- el control de revelado tendrá objetivo táctil suficiente;
- se evitarán paneles laterales demasiado estrechos;
- no se mantendrán capas personales al cambiar de actor;
- el actor y contexto permanecerán visibles;
- el teclado en pantalla no ocultará la acción o estado;
- una capa avanzada no convertirá el kiosco en backoffice;
- las opciones no compatibles con el dispositivo no se mostrarán;
- el cierre de sesión limpiará datos y preferencias temporales.

La interacción física definitiva corresponde a `UX-BASE-011` y
`UX-STATION-*`.

---

#### 27. Accesibilidad

Todo control de divulgación deberá:

- ser operable por teclado;
- exponer nombre y estado accesibles;
- utilizar `aria-expanded` o semántica equivalente;
- relacionar el control con la región revelada;
- mover el foco solo cuando ayude a la tarea;
- conservar orden lógico;
- anunciar errores o cambios relevantes;
- no depender de color, icono, gesto o hover;
- permitir volver sin perder posición;
- evitar contenido crítico inaccesible dentro de una región colapsada.

Una región no visible no permanecerá navegable ni anunciada como si estuviera
abierta.

---

#### 28. Conectividad inestable y caché

Cada nivel declarará su dependencia de conexión:

```text
AVAILABLE_OFFLINE
CACHED_READ_ONLY
ONLINE_REQUIRED
REFRESH_REQUIRED
NOT_AVAILABLE_OFFLINE
```

Reglas:

- la capa esencial mostrará frescura;
- un detalle cacheado no se presentará como actual;
- una opción avanzada que requiere validación no se habilitará offline;
- expandir no descartará un borrador;
- la caché se particionará por actor y contexto;
- al reconectar se revalidarán permiso, recurso y versión;
- una sección abierta no podrá ejecutar una acción con contexto vencido.

El contrato detallado corresponde a `UX-BASE-013` y `UX-BASE-014`.

---

#### 29. Navegación entre aplicaciones

Un destino avanzado en otra aplicación deberá presentarse con intención humana:

```text
Revisar trazabilidad financiera
Se abrirá en NUMERA
```

El deep link transportará referencias opacas y retorno, pero no:

- autorización;
- actor autoritativo;
- permiso;
- estado objetivo;
- información sensible;
- preferencia que amplíe alcance.

La aplicación propietaria volverá a resolver contexto, relevancia y autorización.

---

#### 30. Búsqueda, favoritos y enlaces directos

La búsqueda podrá encontrar una opción avanzada únicamente cuando:

- el actor esté autorizado;
- sea relevante o descubrible en su carril;
- el resultado no revele datos protegidos;
- el destino revalide contexto y recurso.

Los favoritos conservarán una identidad semántica, no autoridad ni estado
expandido inseguro.

```text
ESTÁ EN FAVORITOS
≠ DEBE APARECER EN TODA TAREA
≠ CONSERVA PERMISO
```

Una URL directa podrá abrir la superficie especializada, pero nunca evitar sus
precondiciones.

---

#### 31. Ayuda y formación contextual

La divulgación progresiva también aplicará a la ayuda:

```text
INSTRUCCIÓN BREVE EN EL MOMENTO
→ EJEMPLO O DEFINICIÓN
→ GUÍA COMPLETA
```

La capa inicial no deberá convertirse en manual permanente.

La ayuda avanzada:

- explicará el efecto empresarial;
- utilizará términos validados;
- incluirá ejemplos relevantes;
- no reemplazará un diseño comprensible;
- no revelará información protegida;
- podrá adaptarse a proceso y dispositivo;
- se validará con trabajadores en `UX-BASE-015`.

---

#### 32. Métricas y guardrails éticos

Se medirán:

- frecuencia de apertura por nivel;
- tiempo hasta encontrar una opción;
- abandonos;
- retornos;
- errores después de expandir;
- opciones nunca descubiertas;
- campos obligatorios ocultos por error;
- uso de búsqueda para encontrar funciones;
- diferencias entre dispositivo y actor;
- solicitudes de ayuda;
- exposición accidental de datos;
- profundidad utilizada.

Guardrails:

- poca utilización no prueba que una opción sea innecesaria;
- mucha utilización puede indicar que debe subir de nivel;
- las métricas no se usarán para ocultar controles incómodos;
- no se manipulará al usuario mediante defaults o jerarquía visual;
- no se degradará a trabajadores por usar detalles o ayuda;
- los cambios deberán probarse con actores reales.

---

#### 33. Aplicación inicial por producto

##### 33.1 NEXO

Capa esencial:

- tarea;
- LOC o recurso;
- producto;
- cantidad;
- unidad;
- estado;
- acción.

Capas posteriores:

- trazabilidad del LPN;
- historial de movimientos;
- comparación de stock;
- opciones de impresión;
- evidencias extendidas.

##### 33.2 FOGO

Capa esencial:

- lote;
- receta y versión;
- etapa;
- cantidad objetivo;
- captura real;
- control requerido.

Capas posteriores:

- parámetros técnicos autorizados;
- historial de receta;
- consumos comparados;
- evidencia de liberación.

##### 33.3 ORIGO

Capa esencial:

- orden;
- proveedor;
- producto;
- cantidad esperada y recibida;
- calidad;
- diferencia.

Capas posteriores:

- condiciones comerciales;
- documentos relacionados;
- historial del proveedor;
- distribución contable autorizada.

##### 33.4 PULSO y PASS

Capa esencial:

- pedido o beneficio;
- cliente necesario;
- total;
- pago o canje;
- estado;
- entrega.

Capas posteriores:

- detalle de puntos;
- trazabilidad de pago;
- información fiscal autorizada;
- historial relacionado.

##### 33.5 VISO, TALENTO, ANIMA y NUMERA

Se aplicará divulgación por intención:

- primero decisión, estado, periodo, territorio y pendientes;
- después comparación, evidencia, configuración, linaje y diagnóstico;
- datos laborales, médicos, financieros o personales permanecerán minimizados;
- la administración compleja usará superficies dedicadas.

---

#### 34. Migración de interfaces actuales

Cada elemento actual se clasificará como:

```text
ESSENTIAL_VALID
CONTEXTUAL_VALID
ADVANCED_VALID
SPECIALIZED_ROUTE_REQUIRED
TECHNICAL_RESTRICTED
CRITICAL_WRONGLY_HIDDEN
IRRELEVANT_WRONGLY_VISIBLE
UNAUTHORIZED_LEAK
EXCEPTION_WRONGLY_EMBEDDED
LEGACY_NESTING
CANDIDATE_FOR_REMOVAL
```

Secuencia:

```text
INVENTARIAR
→ CLASIFICAR NIVEL Y ACTOR
→ IDENTIFICAR DATOS, ACCIONES Y EFECTOS
→ VINCULAR PERMISOS Y CONTEXTO
→ PROTOTIPAR
→ PROBAR DESCUBRIMIENTO Y COMPRENSIÓN
→ PILOTAR
→ MEDIR
→ RETIRAR PATRÓN LEGACY
```

No se retirará un detalle antes de validar que la persona autorizada puede
encontrarlo y volver al flujo con seguridad.

---

#### 35. Propiedad de decisiones diferidas

| Decisión pendiente                                          | Tarea o familia propietaria                                               |
| ----------------------------------------------------------- | ------------------------------------------------------------------------- |
| Dimensiones, objetivos táctiles y patrones de tablet/kiosco | `UX-BASE-011`; `UX-STATION-*`                                             |
| Densidad administrativa y superficies especializadas        | `UX-BASE-012`; `UX-ADMIN-*`                                               |
| Conectividad y reanudación                                  | `UX-BASE-013`; `UX-BASE-014`                                              |
| Terminología y descubrimiento con trabajadores              | `UX-BASE-015`                                                             |
| Inventario y clasificación de rutas reales                  | `AUTH-UI-001` a `AUTH-UI-029`                                             |
| Visibilidad, masking y protección de servidor               | `AUTH-UI-030` a `AUTH-UI-045`; `AUTH-SRV-*`                               |
| Diseño de pantallas concretas                               | `PROC-SCREEN-001` a `PROC-SCREEN-028`                                     |
| Identidad y límites de dispositivos                         | `AUTH-DEV-001` a `AUTH-DEV-016`                                           |
| Persistencia de vistas y preferencias                       | paquetes E3/E4 de datos y contratos por definir en el roadmap propietario |
| Observabilidad                                              | `OBS-ARC-001` a `OBS-ARC-016`                                             |
| Prototipos, pruebas y piloto                                | `UX-QA-001` a `UX-QA-030`; paquetes E5 correspondientes                   |

La persistencia de vistas y preferencias deberá materializarse en una tarea
explícita del roadmap propietario cuando se diseñe el contrato físico; no se
implementará como estado local permanente sin dueño.

---

#### 36. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA.

Se incorporan al registro completo:

```text
TREQ-UX-182 a TREQ-UX-203
```

Cubren:

- jerarquía de divulgación;
- contenido esencial;
- clasificación y niveles;
- relevancia y autorización;
- descubrimiento;
- patrones de interacción;
- profundidad y rutas especializadas;
- obligaciones dinámicas;
- frontera con excepciones;
- estado y borradores;
- preferencias y defaults;
- revalidación;
- privacidad;
- operación;
- administración;
- filtros y lotes;
- dispositivos;
- accesibilidad;
- offline;
- cross-app y búsqueda;
- diagnóstico y ayuda;
- métricas y migración.

---

#### 37. Criterios de aceptación

- [ ] La capa inicial muestra lo necesario para comprender y completar la tarea.
- [ ] Ninguna obligación, diferencia, consecuencia material o estado pendiente queda escondido.
- [ ] Cada elemento tiene nivel de divulgación explícito.
- [ ] Se distingue elemento colapsado de elemento no autorizable.
- [ ] Relevancia y autorización se resuelven antes de revelar.
- [ ] Una opción avanzada no se confunde con una excepción.
- [ ] Las etiquetas explican el contenido o resultado.
- [ ] La profundidad evita paneles y modales anidados indefinidamente.
- [ ] El tercer nivel complejo se mueve a una superficie especializada cuando corresponde.
- [ ] Una condición dinámica revela a tiempo los campos que se vuelven obligatorios.
- [ ] Expandir no ejecuta acciones ni cambia política.
- [ ] Las secciones editadas no se colapsan perdiendo trabajo.
- [ ] Preferencias de cuenta, estación, dispositivo y sesión permanecen separadas.
- [ ] Un dispositivo compartido no hereda expansiones o datos personales.
- [ ] Los defaults avanzados son seguros, visibles y versionados.
- [ ] El efecto material de un valor avanzado se resume antes de confirmar.
- [ ] Autorización y contexto se revalidan al consultar o actuar.
- [ ] Los datos sensibles no se envían ni revelan solo por estar colapsados.
- [ ] Las superficies operativas mantienen foco y baja densidad.
- [ ] Las tareas administrativas complejas usan vistas dedicadas cuando procede.
- [ ] Los filtros ocultos activos quedan resumidos en la capa principal.
- [ ] Las acciones masivas revelan alcance y efectos antes de ejecutar.
- [ ] El diagnóstico técnico permanece separado y restringido.
- [ ] Los controles son táctiles, accesibles y no dependen de hover.
- [ ] Offline muestra frescura y no amplía capacidades.
- [ ] Deep links, búsqueda y favoritos revalidan permiso y contexto.
- [ ] Las métricas no se usan para ocultar obligaciones ni manipular al usuario.
- [ ] Toda brecha y decisión diferida tiene propietario exacto.
- [ ] Se generó el registro completo con `TREQ-UX-182` a `TREQ-UX-203`.
- [ ] No se implementaron componentes, rutas, código, migraciones ni cambios físicos.
- [ ] `UX-BASE-011` permanece sin iniciar.

---

#### 38. Estado y continuidad

```text
UX-BASE-009   APROBADA
UX-BASE-010   APROBADA
UX-BASE-011   NO INICIADA
```

No se inicia `UX-BASE-011` hasta la aprobación expresa de esta tarea y una
solicitud explícita de continuidad.


### ✅ UX-BASE-011 — Diseñar interfaces táctiles para tablets y kioscos

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `UX-BASE-010 — Aplicar divulgación progresiva a opciones avanzadas` — APROBADA  
**Siguiente tarea reservada:** `UX-BASE-012 — Diseñar interfaces densas solo para administración`  
**Artefacto producido:** `UX-TACTILE-TABLET-KIOSK-CONTRACT-001`  
**Versión del estándar transversal:** `TOUCH-BASELINE-1.0.0`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069` y procesos futuros incorporados al catálogo canónico  
**Aplicaciones cubiertas:** SHELL, ANIMA, NEXO, FOGO, ORIGO, PULSO, VISO, NUMERA, TALENTO, PASS, AURA y aplicaciones futuras de Vento OS  
**Naturaleza:** principio transversal de interacción táctil, ergonomía, legibilidad, atribución, periféricos, seguridad, accesibilidad, continuidad y validación física  
**Cambios en código, componentes, rutas, dispositivos, compras, permisos, tablas, RLS, RPC, Supabase o aplicaciones:** no autorizados

---

#### 1. Propósito

Definir el contrato mínimo que deberá cumplir toda superficie de Vento OS utilizada principalmente mediante tacto en:

- tablets personales o compartidas;
- kioscos fijos o semifijos;
- terminales de caja y servicio;
- pantallas de producción;
- estaciones de recepción, bodega, despacho y entrega;
- dispositivos móviles usados como apoyo operativo;
- superficies híbridas con escáner, cámara, impresora, báscula, datáfono u otros periféricos.

La interfaz deberá poder utilizarse con precisión y comprensión bajo las condiciones reales del puesto, sin asumir:

- manos limpias y libres;
- atención continua;
- iluminación ideal;
- silencio;
- conectividad estable;
- postura sentada;
- teclado físico;
- un único trabajador por dispositivo;
- precisión fina de mouse;
- conocimiento técnico;
- hardware homogéneo.

Regla de alto nivel:

```text
LA PANTALLA SE ADAPTA
A LA TAREA, LA ESTACIÓN Y EL CUERPO HUMANO

NO

EL TRABAJADOR SE ADAPTA
A UNA VERSIÓN ENCOGIDA DEL ESCRITORIO
```

---

#### 2. Continuidad lógica

```text
DIVULGAR COMPLEJIDAD DE FORMA PROGRESIVA
UX-BASE-010
        ↓
HACER OPERABLE LA CAPA RESULTANTE
EN TABLETS Y KIOSCOS REALES
UX-BASE-011
        ↓
RESERVAR DENSIDAD AL BACKOFFICE
UX-BASE-012
```

`UX-BASE-011` no diseña todavía cada estación ni selecciona hardware. Establece la línea base transversal que deberá consumir:

- `UX-STATION-001` a `UX-STATION-012` para adaptar la interacción a cada puesto real;
- `AUTH-DEV-001` a `AUTH-DEV-016` para identidad, límites, sesión y auditoría del dispositivo;
- `PROC-SCREEN-001` a `PROC-SCREEN-028` para las pantallas concretas;
- `AUTH-UI-001` a `AUTH-UI-060` para rutas, acciones y protección;
- `UX-QA-001` a `UX-QA-030` para prototipos y validación.

---

#### 3. Base canónica heredada

Esta tarea conserva las decisiones aprobadas en:

- `UX-BASE-001` — separación entre experiencia operativa y administrativa;
- `UX-BASE-002` — tarea actual primero;
- `UX-BASE-003` — lenguaje humano;
- `UX-BASE-004` — relevancia contextual;
- `UX-BASE-005` — contexto activo visible;
- `UX-BASE-006` — bloqueos explicables;
- `UX-BASE-007` — captura única;
- `UX-BASE-008` — reducción segura de pasos;
- `UX-BASE-009` — excepciones separadas;
- `UX-BASE-010` — divulgación progresiva;
- `UX-STATION-001` — inventario físico y operativo de estaciones;
- `AUTH-CTX-*`, `AUTH-DEC-*`, `AUTH-SRV-*` y `AUTH-DEV-*` — identidad, contexto, autorización y dispositivo.

Principios heredados:

```text
DISPOSITIVO COMPARTIDO
≠ CUENTA COMPARTIDA
≠ ACTOR HUMANO
≠ ESTACIÓN FÍSICA
```

```text
RESPONSIVE
≠ TÁCTIL
≠ OPERABLE EN EL PUESTO REAL
```

```text
OBJETIVO GRANDE
≠ ACCIÓN AUTORIZADA
```

```text
PANTALLA COMPLETA
≠ OPERACIÓN CONFIRMADA
```

---

#### 4. Referencias técnicas mínimas

`TOUCH-BASELINE-1.0.0` toma como piso de referencia:

- WCAG 2.2, criterio 2.5.8: objetivo mínimo de puntero de `24 × 24 CSS px`, con excepciones controladas;
- WCAG 2.2, criterio 2.5.5: objetivo mejorado de `44 × 44 CSS px`;
- WCAG 2.2, criterio 2.5.7: toda interacción basada en arrastre deberá tener alternativa de puntero simple;
- Android Accessibility: objetivo táctil recomendado de al menos `48 × 48 dp`;
- Apple Human Interface Guidelines: objetivo táctil de al menos `44 × 44 pt` en iOS y iPadOS.

Política propia de Vento OS:

```text
SUPERFICIE OPERATIVA TÁCTIL ORDINARIA
→ OBJETIVO PREFERENTE DE 48 × 48 UNIDADES LÓGICAS

PISO DE CONFORMIDAD WEB
→ 24 × 24 CSS PX

EL PISO NO SE UTILIZA
COMO TAMAÑO ORDINARIO DEL TRABAJO OPERATIVO
```

La equivalencia física deberá comprobarse en el dispositivo real. Los valores lógicos no sustituyen una prueba con manos, postura, montaje y entorno reales.

Toda modificación futura de esta línea base deberá crear una nueva versión y conservar compatibilidad o plan de transición.

---

#### 5. Decisión principal

Toda superficie táctil deberá resolverse desde un perfil explícito:

```text
TAREA
+
ACTOR
+
ESTACIÓN
+
DISPOSITIVO
+
POSTURA Y MOVILIDAD
+
CONDICIONES AMBIENTALES
+
MÉTODO DE ENTRADA
+
PERIFÉRICOS
+
RIESGO
+
CONECTIVIDAD
=
PERFIL DE INTERACCIÓN
```

No existirá un componente universal cuya única estrategia sea reducir columnas o aumentar botones.

---

#### 6. Clases de superficie

Se distinguen inicialmente:

| Clase                       | Uso principal                                               | Regla                                                   |
| --------------------------- | ----------------------------------------------------------- | ------------------------------------------------------- |
| `PERSONAL_TABLET`           | dispositivo asignado o de uso individual durante una sesión | puede conservar preferencias no sensibles del actor     |
| `SHARED_TABLET`             | varios trabajadores por turno o franja                      | exige cambio de actor y limpieza entre sesiones         |
| `FIXED_KIOSK`               | estación anclada a lugar y función                          | territorio y capacidades máximas definidos por estación |
| `SEMI_FIXED_STATION`        | equipo desplazable dentro de una zona controlada            | deberá revalidar ubicación y montaje permitido          |
| `COUNTER_TERMINAL`          | caja, mostrador, recepción o entrega                        | prioriza rapidez, privacidad lateral y periféricos      |
| `PRODUCTION_DISPLAY`        | consulta o captura en producción                            | considera guantes, humedad, distancia y manos ocupadas  |
| `MOBILE_COMPANION`          | apoyo móvil, recorrido o entrega                            | no sustituye automáticamente una estación completa      |
| `HYBRID_PERIPHERAL_STATION` | tacto más escáner, impresora, báscula, cámara u otro equipo | el estado de cada periférico forma parte de la tarea    |

La clase no concede autoridad ni determina por sí sola el diseño definitivo.

---

#### 7. Perfil obligatorio de estación y uso

Antes de aprobar una interfaz concreta deberán conocerse, como mínimo:

- dispositivo y sistema operativo;
- tamaño, densidad y relación de aspecto;
- orientación permitida;
- montaje, altura e inclinación;
- distancia de lectura;
- uso con una o dos manos;
- postura sentada, de pie o en movimiento;
- movilidad dentro del puesto;
- número de actores y frecuencia de relevo;
- guantes, humedad, grasa, polvo o frío;
- iluminación, reflejos y contraste ambiental;
- ruido y posibilidad de feedback sonoro;
- vibración o movimiento del vehículo o superficie;
- teclado, escáner, cámara y periféricos;
- conectividad, energía y contingencia;
- sensibilidad de la información visible;
- frecuencia, duración y criticidad de la tarea.

La ausencia de estos datos deberá producir `PROFILE_INCOMPLETE`, con responsable y cierre en `UX-STATION-001`, `UX-STATION-002` o `UX-STATION-008`, según corresponda.

---

#### 8. Tamaño de objetivos táctiles

Reglas:

1. El objetivo táctil incluye toda el área activable, no solo el icono visible.
2. Los controles operativos ordinarios utilizarán preferentemente un área mínima equivalente a `48 × 48` unidades lógicas.
3. Las superficies nativas Apple respetarán como mínimo `44 × 44 pt`.
4. Ningún control web dependerá ordinariamente del piso de `24 × 24 CSS px` ni de la excepción de espaciado para tareas frecuentes.
5. Los controles críticos, de uso con guantes, en movimiento o bajo presión podrán requerir objetivos mayores.
6. Un icono pequeño podrá mantenerse visualmente compacto si su hit area cumple el contrato y no invade otro objetivo.
7. El tamaño se validará en orientación, zoom, teclado visible y estados de error.
8. El área táctil no podrá cambiar de forma impredecible durante carga o actualización.

No se congelará una equivalencia física en milímetros sin validar modelo, densidad y montaje.

---

#### 9. Espaciado y agrupación

Los objetivos deberán separarse de forma que un toque impreciso no active una acción vecina.

Se evitará colocar juntos:

- confirmar y cancelar;
- aceptar y rechazar;
- avanzar y eliminar;
- acción ordinaria y excepción;
- dos cantidades de líneas distintas;
- controles de actores diferentes;
- cerrar sesión y cerrar panel.

Reglas:

- el espacio visual no sustituye el hit area;
- las áreas activables no se superpondrán;
- los grupos tendrán título o relación perceptible;
- la acción destructiva no será el objetivo más fácil de alcanzar;
- las barras densas de iconos no se usarán como patrón operativo principal;
- los controles repetidos por fila conservarán alineación y separación estables.

---

#### 10. Jerarquía y ubicación de acciones

La acción principal deberá:

- permanecer próxima al contenido que modifica;
- ser alcanzable sin tapar el dato crítico;
- conservar posición estable durante la tarea;
- evitar esquinas o zonas propensas a toque accidental según montaje;
- mantenerse visible cuando el teclado o un panel secundario aparezcan;
- no competir con navegación, configuración o excepción.

En pantallas largas podrá existir una barra de acción persistente, siempre que:

- no cubra campos, errores o contenido;
- resuma el efecto antes de confirmar;
- respete áreas seguras del sistema;
- no active automáticamente al desplazarse;
- informe si existen cambios no guardados.

La distribución por zona de alcance deberá validarse con mano dominante, postura y montaje reales. No se impondrá una zona universal desde el escritorio.

---

#### 11. Postura, alcance y montaje

El diseño deberá contemplar:

- trabajo de pie;
- pantalla por encima o debajo de la línea visual;
- tablet sostenida con una mano;
- interacción con brazo extendido;
- dispositivo fijo en pared, base, caja o vehículo;
- necesidad de mirar simultáneamente producto, persona o entorno;
- periodos prolongados de uso;
- relevo entre personas de distinta altura o lateralidad.

No se aprobará una interfaz que requiera:

- precisión fina sostenida;
- mantener el brazo elevado durante el flujo completo;
- alternar repetidamente entre extremos de la pantalla;
- sostener el dispositivo y escribir textos largos;
- bloquear la visión del producto o área de trabajo;
- abandonar físicamente la tarea para alcanzar el control.

El montaje y hardware definitivos pertenecen a `UX-STATION-003`, `UX-STATION-006` y la matriz final `UX-STATION-009`.

---

#### 12. Orientación, reflow y teclado virtual

Una interfaz no podrá ser simplemente una captura de escritorio escalada.

Deberá:

- reordenar contenido sin scroll horizontal ordinario;
- mantener contexto, estado y acción principal;
- preservar relación entre etiqueta, valor, error y control;
- evitar que el teclado oculte el campo, el error o la confirmación;
- conservar el punto de lectura al rotar;
- soportar cambios de tamaño sin perder borradores;
- no duplicar controles entre versión horizontal y vertical;
- utilizar orientación fija solo cuando la estación y el proceso lo justifiquen.

Si una rotación no puede soportarse de forma segura, la interfaz deberá explicarlo antes de iniciar la tarea y la estación deberá impedir una orientación incompatible.

---

#### 13. Gestos y mecanismos de entrada

Quedan prohibidos como único mecanismo:

- hover;
- arrastre preciso;
- swipe oculto para acciones críticas;
- pulsación prolongada sin alternativa visible;
- doble toque necesario;
- gesto de borde no indicado;
- pinza para acceder a información esencial;
- icono sin etiqueta o nombre accesible.

Toda función basada en arrastre tendrá una alternativa de un solo puntero, salvo que el movimiento sea esencial al significado.

La interfaz no bloqueará mouse, teclado, lector, stylus u otro mecanismo disponible cuando su uso sea compatible y seguro.

---

#### 14. Minimización de escritura

Las tareas operativas reducirán el teclado mediante:

- contexto resuelto;
- selección de tarea o recurso;
- escaneo;
- listas cortas y contextualizadas;
- valores derivados;
- botones de cantidad;
- teclado numérico cuando corresponda;
- plantillas de motivo gobernadas;
- captura automática desde periférico;
- dictado solo cuando privacidad y ruido lo permitan.

No se utilizarán grandes campos de texto para reemplazar:

- reason codes;
- selección de recurso;
- identificación del actor;
- cantidad estructurada;
- clasificación de diferencia;
- evidencia que puede capturarse de forma específica.

Cuando el texto libre sea necesario, deberá conservar borrador y permitir revisión antes de enviar.

---

#### 15. Captura numérica y cantidades

Las cantidades deberán mostrar siempre:

- valor;
- unidad;
- presentación cuando aplique;
- límites;
- precisión;
- valor esperado como referencia, no como hecho observado;
- efecto de aumentar o disminuir;
- validación inmediata.

Los steppers deberán:

- tener objetivos amplios;
- evitar cambios múltiples por toque sostenido accidental;
- permitir entrada directa cuando el rango sea grande;
- no ocultar decimales o unidad;
- no cambiar de presentación sin confirmación;
- conservar el valor ante teclado, rotación o pérdida de foco.

Un valor cero, vacío y no observado serán estados diferentes.

---

#### 16. Escáner, cámara y captura automática

Toda captura deberá informar:

```text
LISTO
LEYENDO
RECONOCIDO
NO RECONOCIDO
DUPLICADO
FUERA DE CONTEXTO
SIN PERIFÉRICO
CONTINGENCIA MANUAL
```

Reglas:

- la lectura no ejecutará una acción irreversible sin revisión proporcional;
- un código duplicado no producirá un segundo efecto;
- el resultado reconocido será visible y comprensible;
- cámara y permisos del sistema tendrán alternativa;
- la linterna no se activará sin control visible;
- la captura continua deberá limitar duplicados y lecturas vecinas;
- el trabajador podrá corregir una lectura cuando la política lo permita;
- la contingencia manual conservará trazabilidad y no se convertirá en bypass.

---

#### 17. Periféricos

Cuando una tarea dependa de impresora, báscula, datáfono, cámara, escáner o equipo externo, la interfaz mostrará:

- periférico seleccionado;
- estado conocido y última verificación;
- acción enviada;
- confirmación recibida;
- resultado pendiente o desconocido;
- alternativa segura;
- referencia de soporte.

```text
COMANDO ENVIADO
≠ IMPRESIÓN, PAGO, PESO O LECTURA CONFIRMADA
```

No se ofrecerá `Reintentar` hasta saber si repetir puede duplicar el efecto.

La selección física y técnica de periféricos corresponde a `UX-STATION-002`, `UX-STATION-006` y paquetes de integración posteriores.

---

#### 18. Guantes, humedad, higiene y contaminación cruzada

Cada estación deberá decidir si la interacción táctil directa es apropiada.

Se evaluará:

- tipo de guante;
- sensibilidad del panel;
- humedad, grasa, harina, azúcar, polvo o frío;
- necesidad de lavado de manos;
- riesgo de contaminación entre producto y pantalla;
- frecuencia de limpieza;
- químicos de limpieza compatibles;
- protección física del dispositivo;
- posibilidad de usar escáner, pedal, botón físico o captura automática.

La interfaz no resolverá una incompatibilidad higiénica aumentando solamente el tamaño de los botones.

Cuando tocar la pantalla sea inseguro o ineficiente, `UX-STATION-002` deberá seleccionar otra modalidad o una modalidad híbrida.

---

#### 19. Iluminación, ruido, vibración y ambiente

La interfaz deberá conservar legibilidad ante:

- reflejos;
- luz intensa o baja;
- ángulos laterales;
- ruido que impide escuchar alertas;
- vibración de vehículo o superficie;
- movimiento del trabajador;
- distancia variable;
- temperatura y uso exterior cuando aplique.

Reglas:

- el color nunca será el único indicador;
- el feedback sonoro tendrá equivalente visual y, cuando sea útil, háptico;
- las alertas no dependerán de audio en cocina, bar, producción o despacho;
- el contraste se validará con el dispositivo y brillo reales;
- los textos críticos no se reducirán para acomodar más contenido;
- las animaciones no desplazarán objetivos durante el toque.

---

#### 20. Seguridad física y atención al entorno

No se exigirá interactuar con la pantalla mientras la persona:

- conduce;
- manipula cuchillos, calor, maquinaria o cargas;
- sostiene producto que requiere ambas manos;
- realiza un movimiento de riesgo;
- debe mantener atención visual sobre cliente, vehículo o entorno.

El proceso deberá crear un punto seguro de interacción antes o después de la maniobra.

Las emergencias utilizarán controles de contención claros, separados y protegidos; no un menú técnico.

La optimización de clics nunca prevalecerá sobre seguridad, higiene o custodia.

---

#### 21. Actor, contexto y atribución visibles

En tablets y kioscos compartidos permanecerán visibles, según aplique:

- estación o dispositivo;
- sede y área;
- actor humano;
- rol operativo;
- turno y check-in;
- tarea o recurso;
- estado online u offline;
- simulación o delegación.

Ejemplo:

```text
Kiosco Bodega CP
Centro de Producción · Bodega
Operando: Laura Pérez · Bodeguera
Turno activo · En línea
```

Sin actor:

```text
Kiosco Bodega CP
Ningún trabajador identificado
Las acciones personales están bloqueadas
```

El nombre del dispositivo no sustituye la identidad del actor.

---

#### 22. Cambio de trabajador y sesión compartida

El cambio de actor deberá:

```text
DETENER NUEVAS MUTACIONES
→ RESOLVER TAREA, BORRADOR Y CUSTODIA
→ CERRAR O TRANSFERIR SESIÓN DEL ACTOR
→ LIMPIAR DATOS PERSONALES Y PREFERENCIAS
→ IDENTIFICAR NUEVO ACTOR
→ RESOLVER CONTEXTO NUEVO
→ RECALCULAR COLA Y CAPACIDADES
```

No se heredarán:

- permisos;
- PIN;
- firma;
- tareas privadas;
- favoritos;
- búsquedas;
- borradores;
- filtros;
- datos sensibles;
- acciones avanzadas expandidas;
- selección de recurso incompatible.

La expiración por inactividad no borrará silenciosamente trabajo; deberá bloquear nuevas acciones, proteger la pantalla, conservar o cerrar el borrador según política y ofrecer reanudación segura.

---

#### 23. Privacidad visual

En estaciones visibles para clientes o terceros se aplicarán:

- minimización;
- masking;
- ocultamiento de previews;
- bloqueo automático;
- cierre de paneles sensibles al alejarse;
- ausencia de notificaciones con contenido privado;
- limpieza al cambiar de actor;
- posición o protector físico cuando corresponda.

No se mostrará en un kiosco operativo información laboral, médica, financiera, de permisos o de terceros que no sea necesaria para la tarea.

El modo kiosco no convierte el dato en público.

---

#### 24. Acciones destructivas y sensibles

Las acciones destructivas, financieras, de custodia, publicación, acceso o excepción deberán:

- estar separadas del CTA ordinario;
- indicar recurso y efecto;
- evitar proximidad peligrosa;
- exigir confirmación proporcional;
- utilizar step-up cuando la política lo requiera;
- permitir cancelación antes del efecto;
- emitir receipt;
- impedir doble ejecución;
- mantener el resultado visible.

No se usarán gestos ocultos como única protección.

Una confirmación no repetirá innecesariamente todo el formulario, pero deberá mostrar el efecto material.

---

#### 25. Toques repetidos, concurrencia e idempotencia

La interfaz deberá manejar:

- doble toque;
- pulsación prolongada;
- taps durante latencia;
- cambio de orientación;
- reenvío por reconexión;
- dos actores sobre el mismo recurso;
- lectura duplicada del escáner;
- callback tardío de un periférico.

Reglas:

- deshabilitar el botón visualmente no será la única defensa;
- cada mutación material tendrá idempotencia en la frontera autoritativa;
- el estado `ENVIANDO` no se confundirá con `CONFIRMADO`;
- se evitarán overlays transparentes que permitan tocar controles subyacentes;
- una actualización de lista no moverá el objetivo bajo el dedo;
- los conflictos conservarán trabajo y explicarán la recuperación.

---

#### 26. Feedback, latencia y estado

Toda acción ofrecerá feedback perceptible dentro de un tiempo acorde con la tarea:

```text
TOQUE RECONOCIDO
→ PROCESANDO
→ CONFIRMADO
O
→ BLOQUEADO / PENDIENTE / RESULTADO DESCONOCIDO
```

La interfaz deberá:

- reconocer el toque sin simular éxito;
- mostrar progreso cuando la espera sea perceptible;
- evitar spinners sin explicación prolongados;
- permitir continuar con otra tarea cuando la operación sea asíncrona y segura;
- conservar una referencia para consultar el resultado;
- diferenciar guardado local, enviado y confirmado;
- no utilizar vibración o sonido como único feedback.

---

#### 27. Conectividad y continuidad

Cada acción táctil declarará:

```text
ONLINE_REQUIRED
OFFLINE_CAPTURE_ALLOWED
OFFLINE_QUEUE_ALLOWED
STALE_READ_ONLY
MANUAL_CONTINGENCY
```

La superficie mostrará:

- estado de conexión;
- frescura;
- elementos pendientes;
- último punto confirmado;
- limitaciones actuales;
- acción segura disponible.

El diseño detallado de colas, reanudación y conciliación pertenece a `UX-BASE-013`, `UX-BASE-014` y `QUEUE-ARC-001` a `QUEUE-ARC-012`.

Esta tarea prohíbe que una tablet o kiosco oculte el estado offline mientras continúa aceptando mutaciones como si estuvieran confirmadas.

---

#### 28. Modo kiosco y administración del dispositivo

Un kiosco deberá limitar:

- aplicaciones disponibles;
- navegación del sistema;
- apertura de enlaces externos;
- descarga de archivos;
- portapapeles cuando corresponda;
- acceso a configuración técnica;
- persistencia de credenciales;
- salida accidental del flujo.

Pero también deberá existir una salida de mantenimiento autorizada y auditable.

```text
BLOQUEAR SALIDA ACCIDENTAL
≠ IMPEDIR SOPORTE, EMERGENCIA O RECUPERACIÓN AUTORIZADA
```

La interfaz ordinaria no expondrá controles de administración del dispositivo. `AUTH-DEV-*` y la arquitectura de despliegue definirán identidad, revocación, políticas y administración remota.

---

#### 29. Accesibilidad táctil

Además del tamaño de objetivos, se deberá validar:

- nombre, rol y estado accesibles;
- orden lógico de foco;
- lector de pantalla;
- teclado y switch access;
- zoom y tamaño de texto;
- contraste;
- reflow;
- alternativas a gesto, arrastre, audio y color;
- prevención de activación accidental;
- tiempo suficiente;
- mensajes de estado;
- autenticación accesible;
- compatibilidad con stylus o mouse cuando exista.

Las áreas invisibles ampliadas deberán coincidir con el control anunciado y no capturar toques destinados a otro elemento.

---

#### 30. Aplicación inicial por producto

##### 30.1 NEXO

- botones de cantidad y escaneo amplios;
- LOC, LPN, producto, unidad y tarea visibles;
- feedback inequívoco de lectura;
- preparación, carga, transporte y recepción diferenciados;
- kiosco de bodega sin backoffice general;
- impresión y periféricos con estado explícito.

##### 30.2 FOGO

- etapa, lote, receta y cantidad objetivo visibles;
- captura compatible con guantes, humedad y manos ocupadas;
- controles críticos fuera de zonas de toque accidental;
- puntos seguros de interacción antes o después de manipulación peligrosa.

##### 30.3 ORIGO

- orden, proveedor, línea, cantidad esperada y observada legibles;
- cámara o escáner como apoyo, no como confirmación automática;
- recepción parcial y diferencias con controles táctiles claros.

##### 30.4 PULSO y PASS

- controles rápidos de venta, pago, canje y entrega;
- privacidad ante cliente;
- datáfono y pago con estado confirmado;
- cancelación, devolución y override fuera del flujo ordinario.

##### 30.5 ANIMA

- experiencia móvil y tablet ligera;
- check-in, tareas y avisos con objetivos amplios;
- no reproducir backoffice denso;
- sesiones personales separadas de dispositivos operativos.

##### 30.6 VISO, NUMERA y TALENTO

Podrán utilizar tablet para consulta o decisiones acotadas, pero la administración densa se diseñará en `UX-BASE-012` y `UX-ADMIN-*`. Una tablet no convierte automáticamente una tabla administrativa compleja en interfaz operativa.

---

#### 31. Prototipado y pruebas físicas

Ninguna pantalla táctil crítica se aprobará solo mediante navegador de escritorio o emulación.

La validación deberá incluir:

- modelo o clase real de dispositivo;
- orientación y montaje;
- trabajador representativo;
- condición ordinaria y pico;
- guantes o condiciones reales;
- periféricos;
- conectividad degradada;
- cambio de actor;
- iluminación y ruido;
- interrupción y reanudación;
- errores y excepciones;
- tecnología de asistencia cuando aplique.

Resultados mínimos:

- finalización correcta;
- toques erróneos;
- controles no encontrados;
- bloqueos incomprendidos;
- tiempo y esfuerzo;
- postura y fatiga observada;
- pérdida de contexto;
- datos expuestos;
- fallos de periférico;
- recuperación.

`UX-STATION-008` valida con trabajadores; `UX-STATION-009` consolida la matriz final; `UX-QA-*` protege prototipos y aceptación.

---

#### 32. Métricas y guardrails

Se medirán:

- tasa de finalización correcta;
- toques accidentales;
- retrocesos;
- repetición de mutaciones;
- tiempo hasta feedback;
- uso de teclado;
- escaneos fallidos o duplicados;
- cambios de orientación;
- bloqueos por periférico;
- sesiones heredadas detectadas;
- trabajo perdido al expirar;
- recuperación offline;
- necesidad de ayuda;
- incidentes de privacidad;
- incompatibilidades por estación.

Guardrails:

- la velocidad individual no se utilizará como métrica disciplinaria sin contexto;
- menos toques no justifica eliminar controles;
- mayor tamaño no justifica saturar la pantalla;
- poca utilización no elimina una función necesaria;
- los datos de accesibilidad no se usarán para perfilar negativamente al trabajador;
- las métricas deberán analizar proceso, estación y condiciones, no solo persona.

---

#### 33. Migración de interfaces actuales

Cada superficie actual se clasificará como:

```text
TOUCH_READY
TOUCH_PARTIAL
DESKTOP_SHRUNK
TARGETS_UNDERSIZED
SPACING_UNSAFE
HOVER_DEPENDENT
DRAG_ONLY
KEYBOARD_HEAVY
CONTEXT_NOT_VISIBLE
ACTOR_LEAK_RISK
PERIPHERAL_STATE_MISSING
OFFLINE_STATE_MISSING
ORIENTATION_UNSAFE
ENVIRONMENT_UNVALIDATED
PHYSICAL_TEST_REQUIRED
CANDIDATE_FOR_RETIREMENT
```

Secuencia:

```text
INVENTARIAR RUTA Y ESTACIÓN
→ MEDIR OBJETIVOS Y DENSIDAD
→ OBSERVAR USO FÍSICO
→ CLASIFICAR RIESGOS
→ DEFINIR PERFIL OBJETIVO
→ PROTOTIPAR EN DISPOSITIVO REAL
→ PROBAR CON TRABAJADORES
→ PILOTAR
→ MEDIR
→ DESPLEGAR CON ROLLBACK
→ RETIRAR PATRÓN LEGACY
```

No se retirará una pantalla hasta que el reemplazo soporte la tarea completa, contingencia, accesibilidad, actor y contexto.

---

#### 34. Propiedad de decisiones diferidas

| Decisión                                | Tarea o familia propietaria                         |
| --------------------------------------- | --------------------------------------------------- |
| inventario físico vigente               | `UX-STATION-001`                                    |
| selección de modalidad por paso         | `UX-STATION-002`                                    |
| perfiles de estación                    | `UX-STATION-003`                                    |
| identidad y cambio de actor de estación | `UX-STATION-004`; `AUTH-DEV-001` a `AUTH-DEV-016`   |
| superficie contextual de estación       | `UX-STATION-005`                                    |
| hardware, montaje y periféricos         | `UX-STATION-006`                                    |
| contingencia física                     | `UX-STATION-007`                                    |
| prueba con trabajadores                 | `UX-STATION-008`; `UX-QA-*`                         |
| matriz final de estaciones              | `UX-STATION-009`                                    |
| gramática y composición concreta        | `UX-STATION-010` a `UX-STATION-012`                 |
| densidad administrativa                 | `UX-BASE-012`; `UX-ADMIN-001` a `UX-ADMIN-005`      |
| conectividad y reanudación              | `UX-BASE-013`; `UX-BASE-014`; `QUEUE-ARC-*`         |
| terminología real                       | `UX-BASE-015`                                       |
| rutas y acciones concretas              | `AUTH-UI-*`; `PROC-SCREEN-*`                        |
| pruebas ejecutables                     | `UX-QA-*`; paquetes E5 y certificación del BLOQUE U |

No queda decisión diferida sin propietario documental.

---

#### 35. Requisitos de prueba derivados

**Resultado:** GENERA 23 REQUISITOS DE PRUEBA.

Se incorporan al registro completo:

```text
TREQ-UX-204 a TREQ-UX-226
```

Protegen:

1. perfil táctil por tarea y estación;
2. tamaños mínimos;
3. espaciado;
4. ubicación y alcance;
5. postura y montaje;
6. orientación y reflow;
7. alternativas a gestos;
8. minimización de teclado;
9. captura numérica;
10. escaneo y periféricos;
11. ambiente e higiene;
12. seguridad física;
13. actor y contexto;
14. cambio de trabajador;
15. privacidad;
16. acciones sensibles;
17. doble toque e idempotencia;
18. feedback y latencia;
19. conectividad;
20. accesibilidad;
21. modo kiosco;
22. adaptación por producto y prueba física;
23. migración y métricas.

---

#### 36. Criterios de aceptación

- [ ] Se definieron clases de superficie táctil sin confundirlas con actor o permiso.
- [ ] Se estableció un perfil obligatorio de estación y uso.
- [ ] Se fijaron pisos y objetivos preferentes versionados.
- [ ] Se definieron espaciado, alcance, postura, orientación y reflow.
- [ ] Se prohibió depender de hover, arrastre o gesto oculto.
- [ ] Se definieron escritura, cantidades, escaneo y periféricos.
- [ ] Se trataron guantes, higiene, iluminación, ruido y vibración.
- [ ] Se protegió la seguridad física del trabajador.
- [ ] Se mantuvieron actor, contexto, turno y estado visibles.
- [ ] Se definió cambio de trabajador sin herencia de sesión.
- [ ] Se protegieron privacidad y datos sensibles.
- [ ] Se separaron acciones destructivas y excepcionales.
- [ ] Se cubrieron doble toque, latencia, idempotencia y offline.
- [ ] Se incluyeron accesibilidad y modo kiosco.
- [ ] Se exigieron prototipos y pruebas en dispositivos reales.
- [ ] Cada decisión diferida tiene tarea propietaria.
- [ ] Se generó el registro completo con `TREQ-UX-204` a `TREQ-UX-226`.
- [ ] No se implementó código, hardware, compra, migración ni cambio en Supabase.
- [ ] `UX-BASE-012` permanece sin iniciar.

---

#### 37. Estado y continuidad

```text
UX-BASE-010   APROBADA
UX-BASE-011   APROBADA
UX-BASE-012   NO INICIADA
```

No se inicia `UX-BASE-012` hasta la aprobación expresa de esta tarea y una solicitud explícita de continuidad.


### ✅ UX-BASE-012 — Diseñar interfaces densas solo para administración

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `UX-BASE-011 — Diseñar interfaces táctiles para tablets y kioscos` — APROBADA  
**Siguiente tarea reservada:** `UX-BASE-013 — Definir comportamiento con conectividad inestable`  
**Artefacto producido:** `UX-ADMIN-DENSITY-CONTRACT-001`  
**Versión del estándar transversal:** `ADMIN-DENSITY-1.0.0`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069` y procesos futuros incorporados al catálogo canónico  
**Aplicaciones cubiertas:** SHELL, ANIMA, NEXO, FOGO, ORIGO, PULSO, VISO, NUMERA, TALENTO, PASS, AURA y aplicaciones futuras de Vento OS  
**Naturaleza:** principio transversal de densidad informativa, superficies administrativas, tablas, filtros, operaciones masivas, contexto, accesibilidad, seguridad, estaciones compartidas y separación entre consulta y ejecución  
**Caso operativo incorporado:** dos computadores POS táctiles del primer piso del Centro de Producción y posible uso compartido por más de un área productiva  
**Cambios en código, componentes, rutas, dispositivos, permisos, tablas, RLS, RPC, Supabase o aplicaciones:** no autorizados

---

#### 1. Propósito

Definir cuándo una superficie de Vento OS podrá utilizar una composición densa y
qué controles deberá cumplir para evitar que tablas, filtros, columnas, paneles,
acciones masivas y múltiples regiones simultáneas se trasladen indebidamente a
trabajadores que ejecutan tareas operativas.

La densidad se reservará para trabajo que realmente exige:

- comparar múltiples registros;
- revisar excepciones o diferencias;
- planificar y asignar;
- conciliar;
- aprobar;
- configurar;
- auditar;
- analizar tendencias;
- administrar catálogos o versiones;
- ejecutar operaciones masivas controladas.

No se utilizará densidad porque:

- el dispositivo tenga pantalla grande;
- sea un computador y no una tablet;
- la aplicación se ejecute en escritorio;
- el usuario tenga un rol jerárquico;
- exista una tabla en la base de datos;
- sea más rápido reutilizar un componente administrativo;
- el equipo sea denominado POS;
- el desarrollador pueda mostrar más información.

Regla central:

```text
DENSIDAD
→ SOLO CUANDO LA TAREA ADMINISTRATIVA
  NECESITA COMPARAR, DECIDIR O GOBERNAR

OPERACIÓN
→ FOCO, CONTEXTO, TAREA Y ACCIÓN
  AUNQUE EL DISPOSITIVO SEA UN PC GRANDE
```

---

#### 2. Continuidad lógica

```text
INTERFAZ TÁCTIL OPERABLE
UX-BASE-011
        ↓
EVITAR QUE EL TAMAÑO DEL EQUIPO
CONVIERTA LA OPERACIÓN EN BACKOFFICE
UX-BASE-012
        ↓
DEFINIR QUÉ OCURRE CUANDO LA RED
NO PERMITE CARGAR O CONFIRMAR
UX-BASE-013
```

`UX-BASE-012` utiliza las decisiones aprobadas de:

- `UX-BASE-001` — carriles de experiencia;
- `UX-BASE-002` — tarea actual primero;
- `UX-BASE-003` — lenguaje humano;
- `UX-BASE-004` — funciones relevantes;
- `UX-BASE-005` — contexto activo visible;
- `UX-BASE-006` — bloqueos explicables;
- `UX-BASE-007` — captura única;
- `UX-BASE-008` — reducción segura de pasos;
- `UX-BASE-009` — excepciones separadas;
- `UX-BASE-010` — divulgación progresiva;
- `UX-BASE-011` — interacción táctil y estaciones reales.

No diseña todavía cada pantalla concreta. Su aplicación posterior corresponde a:

- `AUTH-UI-001` a `AUTH-UI-060`;
- `PROC-SCREEN-001` a `PROC-SCREEN-028`;
- `UX-STATION-002` a `UX-STATION-012`;
- subbloques UX de cada aplicación;
- paquetes E5;
- `UX-QA-001` a `UX-QA-030`.

---

#### 3. Respuesta canónica al caso de los dos computadores POS

**Sí es posible que un mismo dispositivo compartido sirva a dos áreas**, siempre
que no se conviertan las dos áreas en una identidad operativa ficticia ni se
mezclen sus ejecuciones.

Modelo preliminar permitido:

```text
DISPOSITIVO FÍSICO
Centro de Producción · Primer piso · Estación 01

SEDE FIJA
Centro de Producción

ÁREAS PERMITIDAS DEL DISPOSITIVO
- Repostería
- Pastelería y Tortas

ACTOR HUMANO ACTUAL
trabajador identificado

ÁREA OPERATIVA ACTIVA
exactamente una para cada acción ejecutada
```

Por tanto:

```text
DISPOSITIVO MULTIÁREA PERMITIDO
≠ ÁREA COMBINADA INVENTADA
≠ COLA SIN PROPIETARIO
≠ PRODUCCIÓN SIN ATRIBUCIÓN TERRITORIAL
```

El dispositivo podrá presentar:

1. **recetarios separados por área**, mediante dos accesos táctiles claros;
2. **una bandeja unificada agrupada por área**, cuando ayude a coordinar el
   trabajo y cada tarjeta conserve su área propietaria;
3. **apertura directa del área del turno vigente**, cuando el actor solo esté
   autorizado para una de las dos;
4. **cambio explícito de área**, cuando actor, turno, proceso y política permitan
   trabajar en ambas.

No se permitirá:

- mezclar recetas en una lista sin mostrar área;
- registrar producción de Pastelería bajo Repostería;
- conservar el área elegida por el trabajador anterior;
- utilizar la última área del dispositivo como autoridad;
- permitir que el selector visual amplíe el turno o el permiso;
- duplicar la misma receta para cada recetario si existe una única receta y
  versión empresarial compartida.

---

#### 4. Decisión provisional para Repostería y Pastelería y Tortas

La recomendación documental inicial es:

```text
INICIO DEL DISPOSITIVO
→ mostrar actor y contexto
→ resolver turno y áreas permitidas

SI SOLO EXISTE UN ÁREA OPERATIVA VÁLIDA
→ abrir directamente su bandeja

SI EXISTEN DOS ÁREAS VÁLIDAS
→ mostrar selector explícito o bandeja agrupada
→ conservar siempre el área en encabezado, tarea y receta

AL ABRIR UNA TAREA
→ fijar área propietaria
→ revalidar permiso, turno y contexto
→ registrar toda ejecución con esa área
```

Para recetas:

```text
RECETARIO OPERATIVO
→ separado por área activa

RECETA EMPRESARIAL COMPARTIDA
→ una identidad y una versión
→ visible en las áreas autorizadas
→ no duplicada físicamente

ADMINISTRACIÓN DE RECETAS
→ superficie administrativa separada
→ no disponible como tabla densa en el POS compartido
```

La decisión definitiva entre dos recetarios visibles, selector de área o bandeja
agrupada no se congela en esta tarea porque depende de:

- ubicación física de los dos equipos;
- distancia entre áreas;
- circulación y contaminación cruzada;
- cantidad de trabajadores concurrentes;
- turnos y rotaciones;
- frecuencia de cambio de área;
- volumen de producción;
- tamaño y resolución real de los POS;
- periféricos;
- pruebas con trabajadores.

---

#### 5. Tareas propietarias de la decisión definitiva

La pregunta detectada no queda como pendiente narrativo. Se asigna a tareas
concretas:

| Decisión                                                   | Tarea propietaria                                     |
| ---------------------------------------------------------- | ----------------------------------------------------- |
| comprobar si un equipo puede atender físicamente dos áreas | `UX-STATION-002`                                      |
| definir perfil de estación multiárea                       | `UX-STATION-003`                                      |
| identificar actor y limpiar contexto al relevar            | `UX-STATION-004`; `AUTH-DEV-007`; `AUTH-DEV-013`      |
| diseñar selector, bandeja y contexto por área              | `UX-STATION-005`; `UX-STATION-010` a `UX-STATION-012` |
| definir hardware, montaje y periféricos de los dos POS     | `UX-STATION-006`                                      |
| probar la alternativa con trabajadores                     | `UX-STATION-008`                                      |
| congelar la matriz estación–áreas–procesos                 | `UX-STATION-009`                                      |
| fijar sede del dispositivo                                 | `AUTH-DEV-003`                                        |
| declarar una o varias áreas permitidas                     | `AUTH-DEV-004`                                        |
| declarar aplicaciones y capacidad máxima                   | `AUTH-DEV-005`; `AUTH-DEV-006`                        |
| combinar límite del dispositivo y autoridad humana         | `AUTH-DEV-008`                                        |
| probar pantallas de FOGO                                   | `AUTH-DEV-016`                                        |
| definir contrato y acceso de recetas                       | `OPS-REC-001`                                         |
| separar áreas productivas en FOGO                          | `FOGO-UX-002`; `FOGO-UX-003`                          |
| diseñar receta operativa                                   | `FOGO-UX-008`                                         |
| separar recetario operativo y administración               | `FOGO-UX-009`                                         |
| validar el prototipo por área                              | `FOGO-UX-015`                                         |
| proteger recetas y acceso por área                         | `FOGO-AUTH-002`; `FOGO-AUTH-003`; `FOGO-AUTH-013`     |

Ninguna de estas decisiones exige implementar anticipadamente los dispositivos.

---

#### 6. Qué significa densidad

Una interfaz será densa cuando presente simultáneamente una combinación alta de:

- filas;
- columnas;
- filtros;
- agrupaciones;
- comparaciones;
- indicadores;
- acciones por fila;
- selección múltiple;
- edición inline;
- paneles paralelos;
- totales;
- historial;
- relaciones entre registros;
- controles avanzados.

La densidad no se mide únicamente por número de elementos. Una pantalla con seis
controles ambiguos puede tener mayor carga cognitiva que una tabla bien
estructurada con veinte filas.

```text
DENSIDAD VISUAL
+
DENSIDAD DE DECISIÓN
+
DENSIDAD DE ACCIONES
+
DENSIDAD DE CONTEXTO
=
CARGA REAL DE LA SUPERFICIE
```

---

#### 7. Carriles autorizados para densidad

| Carril                        | Densidad permitida | Regla                                            |
| ----------------------------- | ------------------ | ------------------------------------------------ |
| `OPERATIONAL_EXECUTION`       | baja               | tarea y acción actual primero                    |
| `OPERATIONAL_SUPERVISION`     | baja a media       | coordinación y bloqueos; no backoffice completo  |
| `ADMINISTRATIVE_WORK`         | media a alta       | comparación, planeación, decisión y conciliación |
| `CONFIGURATION_GOVERNANCE`    | media a alta       | parámetros versionados y efectos claros          |
| `AUDIT_ANALYTICS`             | media a alta       | reconstrucción, filtros y trazabilidad           |
| `PERSONAL_CUSTOMER_CANDIDATE` | baja               | caso propio y acciones comprensibles             |

Una superficie densa deberá declarar expresamente su carril. No podrá inferirlo
por el nombre de la aplicación o del rol.

---

#### 8. Criterios para autorizar una superficie densa

Una composición densa solo se justificará cuando concurran:

1. necesidad legítima de comparar o gobernar múltiples elementos;
2. actor administrativo, de configuración, auditoría o supervisión autorizada;
3. permiso de lectura de la vista;
4. permisos exactos para cada acción;
5. territorio y periodo visibles;
6. dispositivo compatible;
7. sensibilidad y masking resueltos;
8. frecuencia y complejidad que justifiquen la composición;
9. alternativa comprensible para tareas individuales;
10. prueba de accesibilidad, rendimiento y error.

La densidad no concede autoridad.

```text
TABLA VISIBLE
≠ PERMISO PARA EDITAR TODAS LAS FILAS
```

---

#### 9. Prohibición de densidad operativa por hardware

Un computador POS táctil puede ser físicamente un PC completo y, aun así, su
superficie ordinaria deberá seguir siendo operativa.

```text
PC TÁCTIL GRANDE
≠ ESCRITORIO ADMINISTRATIVO
```

En los dos equipos del Centro de Producción no deberán aparecer ordinariamente:

- tabla maestra completa de recetas;
- costos;
- márgenes;
- versiones históricas completas;
- permisos;
- publicación global;
- configuración de ingredientes;
- edición de rendimientos base;
- catálogos empresariales completos;
- exportaciones masivas;
- auditoría técnica.

La estación operativa podrá mostrar:

- producción pendiente;
- receta resumida vigente;
- ingredientes y cantidades aplicables;
- pasos;
- alérgenos y controles;
- lote actual;
- captura de resultado;
- bloqueo o diferencia;
- siguiente acción.

---

#### 10. Niveles de densidad

Se definen conceptualmente:

| Nivel            | Descripción                                   | Uso                                                |
| ---------------- | --------------------------------------------- | -------------------------------------------------- |
| `D0_FOCUSED`     | un caso, una tarea, una acción                | operación táctil                                   |
| `D1_CONTEXTUAL`  | caso más contexto y próximos elementos        | supervisión local y operación compleja             |
| `D2_COMPARATIVE` | lista o tabla moderada con filtros esenciales | administración ordinaria                           |
| `D3_ANALYTICAL`  | múltiples columnas, agrupaciones y paneles    | análisis, conciliación y auditoría                 |
| `D4_SPECIALIZED` | workspace experto con configuración compleja  | gobierno, finanzas, datos o configuración avanzada |

`D3` y `D4` no se utilizarán en kioscos o POS compartidos salvo una herramienta
de soporte protegida, temporal y fuera del flujo ordinario.

---

#### 11. Arquitectura de una superficie administrativa densa

La composición deberá conservar una jerarquía estable:

```text
1. PROPÓSITO Y TERRITORIO
2. PERIODO Y FRESCURA
3. RESUMEN O DIFERENCIA PRINCIPAL
4. FILTROS ACTIVOS
5. TABLA, MATRIZ O VISUALIZACIÓN
6. SELECCIÓN Y ACCIONES AUTORIZADAS
7. DETALLE DEL ELEMENTO
8. RESULTADO, RECEIPT O HISTORIAL
```

No se presentarán diez paneles con igual peso visual.

---

#### 12. Tablas y cuadrículas

Toda tabla administrativa deberá definir:

- identidad estable de fila;
- significado de cada columna;
- unidad y formato;
- origen y frescura;
- orden inicial;
- claves de desempate;
- estados de carga y vacío;
- comportamiento ante datos parciales;
- sensibilidad;
- acciones disponibles;
- mecanismo de detalle;
- paginación o virtualización;
- exportación permitida o prohibida.

Quedan prohibidas:

- columnas sin encabezado comprensible;
- iconos como único significado;
- acciones críticas ocultas en cada fila sin contexto;
- celdas editables que no indiquen modo edición;
- filas sin identidad estable;
- scroll horizontal que oculte contexto crítico sin alternativa;
- totales calculados sobre una selección distinta a la visible sin explicarlo.

---

#### 13. Filtros y alcance

Los filtros que cambien el universo deberán permanecer visibles:

- empresa;
- sede;
- área;
- periodo;
- estado;
- propietario;
- proceso;
- versión;
- sensibilidad cuando aplique.

```text
FILTRO ACTIVO
→ VISIBLE
→ REMOVIBLE
→ INCLUIDO EN EXPORTACIÓN Y RECEIPT
```

`Todas las sedes` o `Todas las áreas` no se interpretarán como autoridad. Solo
podrán representar el conjunto autorizado resultante.

Un filtro administrativo no cambiará el área operativa activa.

---

#### 14. Orden, agrupación y agregación

La interfaz explicará:

- criterio de orden;
- desempate;
- agrupación;
- nivel de subtotal;
- elementos excluidos;
- moneda, unidad y precisión;
- periodo de cálculo;
- datos pendientes o incompletos.

Una agrupación por área no fusionará los hechos de las áreas.

Ejemplo permitido:

```text
PRODUCCIÓN PENDIENTE

Repostería
- tarea 1
- tarea 2

Pastelería y Tortas
- tarea 3
- tarea 4
```

Cada tarea conserva su `area_id` y no hereda el encabezado visual como fuente
autoritativa.

---

#### 15. Columnas y personalización

Las vistas podrán permitir:

- mostrar u ocultar columnas autorizadas;
- reordenar;
- redimensionar;
- guardar vista;
- cambiar agrupación;
- fijar columnas esenciales.

Pero una preferencia:

- no concede acceso a una columna;
- no supera masking;
- no se comparte entre actores sin política;
- no conserva información sensible en dispositivo compartido;
- no oculta consecuencias obligatorias;
- se invalida cuando cambia el contrato.

---

#### 16. Selección y operaciones masivas

Toda selección deberá indicar:

```text
CUÁNTOS ELEMENTOS
+
QUÉ TERRITORIO
+
QUÉ FILTRO
+
QUÉ PÁGINAS
+
QUÉ ELEMENTOS NO SON ELEGIBLES
```

Se distinguirán:

- seleccionar filas visibles;
- seleccionar la página;
- seleccionar todos los resultados filtrados;
- seleccionar una agrupación;
- seleccionar manualmente un subconjunto.

Antes de ejecutar una acción masiva se mostrará:

- efecto común;
- excepciones;
- permisos;
- impacto total;
- ejecución parcial;
- estrategia de idempotencia;
- rollback o compensación cuando corresponda.

---

#### 17. Edición

Se diferencian:

```text
CONSULTAR
EDITAR UNA FILA
EDITAR VARIAS FILAS
CONFIGURAR UNA REGLA
APROBAR
CORREGIR UN HECHO
```

La edición inline se permitirá solo cuando:

- el campo sea de bajo riesgo;
- el efecto sea claro;
- exista control de versión;
- se muestre estado guardado;
- pueda cancelarse;
- no oculte validaciones dependientes.

Cambios de receta, precio, permiso, salario, costo, inventario, estado contable,
publicación o configuración sensible utilizarán una superficie de revisión
apropiada, no una celda casual.

---

#### 18. Concurrencia y conflictos

Una tabla densa puede mostrar datos obsoletos mientras el usuario decide. Toda
acción deberá revalidar:

- versión;
- estado;
- permiso;
- territorio;
- selección;
- dependencias;
- actor;
- periodo.

Ante conflicto:

```text
NO SOBRESCRIBIR
→ MOSTRAR QUÉ CAMBIÓ
→ CONSERVAR TRABAJO SEGURO
→ ACTUALIZAR, COMPARAR O DESCARTAR
```

---

#### 19. Rendimiento y virtualización

La densidad no justificará cargar todos los registros ni bloquear la pantalla.

Se admitirán:

- paginación;
- virtualización;
- carga incremental;
- agregados de servidor;
- caché versionada;
- prefetch controlado.

Pero deberán conservar:

- identidad de fila;
- selección;
- foco;
- lectura accesible;
- total correcto;
- orden estable;
- frescura;
- filtros;
- contexto.

```text
FILA NO RENDERIZADA
≠ FILA NO SELECCIONADA
```

---

#### 20. Teclado, mouse y tacto

Las superficies densas administrativas se optimizarán principalmente para
teclado y mouse cuando el trabajo lo justifique, sin excluir tacto ni
accesibilidad.

Podrán ofrecer:

- navegación por teclado;
- atajos visibles;
- búsqueda;
- selección con modificadores;
- copia controlada;
- edición rápida.

Los atajos:

- no serán la única vía;
- no activarán acciones destructivas sin control;
- no funcionarán cuando el foco esté en un campo incompatible;
- respetarán permisos y contexto;
- serán localizables y documentados.

En táctil, una vista `D2` podrá adaptarse, pero `D3` o `D4` deberá pasar a una
superficie especializada o equipo apropiado.

---

#### 21. Responsive y reflow

Una interfaz administrativa densa no se convertirá en una tabla ilegible en
pantalla pequeña.

Estrategias permitidas:

- columnas prioritarias;
- tarjetas comparativas;
- detalle por fila;
- filtros en panel;
- agrupaciones;
- vistas especializadas;
- modo consulta de solo lectura;
- derivación a un equipo compatible.

No se permitirá:

- reducir tipografía por debajo de legibilidad;
- objetivos táctiles mínimos;
- scroll horizontal sin contexto fijo;
- ocultar filtros activos;
- ejecutar un lote complejo sin resumen.

---

#### 22. Accesibilidad de tablas densas

Toda superficie deberá conservar:

- encabezados programáticos;
- nombre y propósito de la tabla;
- asociación de celdas;
- foco lógico;
- estado de selección;
- anuncios de orden y filtro;
- navegación por teclado;
- equivalentes de color e icono;
- zoom y reflow;
- alternativa a drag;
- resumen de errores;
- persistencia de foco después de actualizar.

Una tabla visual no podrá ser un conjunto de `div` sin semántica cuando su
función sea tabular.

---

#### 23. Sensibilidad y minimización

La densidad aumenta el riesgo de exposición porque reúne muchos datos en una
misma superficie.

Deberán aplicarse:

- proyección mínima;
- masking por campo;
- permiso de columna;
- límites de búsqueda;
- protección de exportación;
- bloqueo por inactividad;
- no persistencia en equipos compartidos;
- prevención de previews sensibles;
- auditoría de consulta cuando corresponda.

Un usuario autorizado para una fila no necesariamente podrá ver todas sus
columnas.

---

#### 24. Contexto administrativo visible

Toda vista densa mostrará permanentemente:

- finalidad;
- actor o simulación;
- rol;
- cobertura;
- sede o áreas incluidas;
- periodo;
- filtros activos;
- frescura;
- modo de solo lectura o edición.

```text
COBERTURA ADMINISTRATIVA
≠ ÁREA OPERATIVA ACTIVA
```

Un supervisor podrá consultar dos áreas en una tabla agrupada, pero al ejecutar
una acción física deberá ingresar al carril operativo y fijar el área exacta.

---

#### 25. Exportación, impresión y copia

Exportar, imprimir o copiar datos será una capacidad separada de visualizar.

Antes de producir un archivo o reporte se validarán:

- permiso;
- finalidad;
- columnas;
- territorio;
- periodo;
- filtros;
- masking;
- volumen;
- retención;
- clasificación;
- destinatario cuando aplique.

El artefacto deberá registrar los criterios utilizados.

No se habilitará exportación en un POS compartido por el solo hecho de que el
navegador pueda descargar archivos.

---

#### 26. Offline y frescura

Las superficies densas administrativas serán, por defecto:

```text
ONLINE_REQUIRED
```

Podrán ofrecer lectura limitada `STALE_READ_ONLY` cuando:

- la frescura sea visible;
- no se confunda con dato actual;
- no se permitan mutaciones;
- la sensibilidad lo permita;
- exista expiración.

No se ejecutarán operaciones masivas, cambios de configuración ni aprobaciones
sensibles desde un snapshot offline salvo contrato específico posterior.

`UX-BASE-013` definirá el comportamiento transversal con conectividad inestable.

---

#### 27. Dispositivos compartidos

En un dispositivo compartido ordinario:

```text
D0 O D1 OPERATIVO
→ PERMITIDO SEGÚN PERFIL

D2 ADMINISTRATIVO
→ EXCEPCIONAL Y LIMITADO

D3 O D4
→ PROHIBIDO EN FLUJO ORDINARIO
```

La pantalla no mostrará automáticamente backoffice porque el actor sea gerente.

Una herramienta administrativa temporal exigirá, según riesgo:

- sesión personal;
- step-up;
- equipo confiable;
- no persistencia;
- masking;
- cierre automático;
- auditoría;
- limpieza completa.

---

#### 28. Contrato de estación multiárea

Un dispositivo con varias áreas permitidas deberá declarar conceptualmente:

```text
station_id
fixed_site_id
allowed_area_ids[]
allowed_process_ids[]
allowed_application_codes[]
device_capability_ceiling
actor_session_required
area_selection_policy
context_reset_policy
```

La forma física se diseñará en `AUTH-DEV-*` y `UX-STATION-*`; esta lista es
conceptual y no autoriza tablas nuevas.

Reglas:

1. `allowed_area_ids` limita al dispositivo; no concede autoridad al actor.
2. El actor deberá estar autorizado para el área y proceso exactos.
3. Toda mutación tendrá un único `active_area_id`.
4. Un selector no podrá elegir áreas fuera del turno o permiso.
5. Cambiar de área revalidará tarea, borrador, claim, recurso y custodia.
6. El área anterior permanecerá visible hasta que el cambio sea confirmado.
7. Las colas podrán agruparse, pero no perderán su área propietaria.
8. El relevo de actor limpiará el área seleccionada cuando no sea compatible.

---

#### 29. Recetarios en una estación multiárea

Se adopta el siguiente principio objetivo:

```text
RECETA
→ IDENTIDAD EMPRESARIAL ÚNICA
→ VERSIÓN VIGENTE
→ ÁREAS EN LAS QUE PUEDE EJECUTARSE

RECETARIO OPERATIVO
→ PROYECCIÓN SEGÚN ÁREA ACTIVA

ADMINISTRACIÓN DE RECETAS
→ WORKSPACE ADMINISTRATIVO SEPARADO
```

Una receta compartida no se copiará en dos registros independientes. Se
referenciará la misma identidad y versión desde los recetarios autorizados.

Una receta exclusiva de Pastelería y Tortas no aparecerá como ejecutable al
operar en Repostería.

Una persona con autorización en ambas podrá cambiar de área explícitamente o
abrir una tarea ya atribuida a la otra área; la interfaz mostrará el cambio antes
de capturar producción.

---

#### 30. Bandeja unificada frente a recetarios separados

Ambas alternativas son válidas, pero resuelven problemas diferentes.

##### 30.1 Recetarios separados

Adecuado cuando:

- los equipos se ubican cerca de cada área;
- los trabajadores permanecen normalmente en una sola;
- las recetas y colas son numerosas;
- el cambio de área es poco frecuente;
- existe riesgo de confusión o contaminación cruzada.

##### 30.2 Bandeja unificada agrupada

Adecuada cuando:

- un mismo equipo es realmente compartido;
- los trabajadores alternan legítimamente;
- el volumen es manejable;
- se necesita coordinación visible;
- cada tarea conserva área y contexto;
- la selección abre un cambio explícito de área cuando sea necesario.

##### 30.3 Recomendación inicial

Para los dos computadores POS del primer piso:

```text
NO MEZCLAR TODAS LAS RECETAS EN UNA SOLA LISTA PLANA
```

Preferir inicialmente:

```text
DOS ACCESOS GRANDES
Repostería | Pastelería y Tortas
```

más una opción de `Pendientes de ambas áreas` agrupada, solo cuando el actor esté
autorizado y la prueba física confirme que mejora la coordinación.

La decisión final se tomará en `UX-STATION-005`, `UX-STATION-008`,
`UX-STATION-009`, `FOGO-UX-002`, `FOGO-UX-003`, `FOGO-UX-008`,
`FOGO-UX-009` y `FOGO-UX-015`.

---

#### 31. Aplicación por producto

##### 31.1 FOGO

Operación:

- producción pendiente por área;
- receta resumida;
- lote;
- cantidades;
- controles;
- resultado.

Administración densa separada:

- versiones de receta;
- ingredientes maestros;
- rendimientos;
- equivalencias;
- restricciones;
- publicación;
- historial;
- acceso por área;
- comparación de versiones.

##### 31.2 NEXO

Operación:

- tarea, ubicación, producto, cantidad y escaneo.

Administración:

- conciliación;
- maestros;
- políticas;
- análisis de diferencias;
- configuraciones territoriales.

##### 31.3 ORIGO

Operación:

- orden seleccionada;
- recepción física;
- lote;
- vencimiento;
- diferencias.

Administración:

- proveedores;
- condiciones;
- órdenes;
- aprobaciones;
- comparación y desempeño.

##### 31.4 PULSO

Operación:

- venta, cobro, entrega y servicio.

Administración:

- menú;
- precios;
- cierres;
- conciliaciones;
- promociones;
- configuración.

##### 31.5 VISO y NUMERA

Podrán utilizar densidad media o alta porque concentran planeación, aprobación,
configuración, conciliación, finanzas y auditoría, pero deberán mantener contexto,
masking, permisos por acción, accesibilidad y protección de operaciones masivas.

##### 31.6 TALENTO y ANIMA

Los trabajadores y candidatos conservarán experiencias enfocadas. Las tablas
densas de personas, turnos, expedientes o novedades pertenecerán a superficies
administrativas protegidas, no al dispositivo operativo compartido.

---

#### 32. Supervisión

Un supervisor podrá necesitar una vista comparativa de dos áreas, pero se
separarán:

```text
VER Y COORDINAR
→ superficie de supervisión

EJECUTAR PRODUCCIÓN
→ superficie operativa con área exacta

CAMBIAR RECETA O POLÍTICA
→ administración o configuración
```

La vista de supervisión no concederá por sí misma capacidad para producir,
corregir, anular o administrar recetas.

---

#### 33. Estados vacíos y datos parciales

Se distinguirán:

- no existen registros;
- no existen en el periodo;
- filtros excluyen resultados;
- actor sin visibilidad;
- área sin tareas;
- datos cargados parcialmente;
- agregados pendientes;
- fuente desactualizada;
- error de una sección;
- resultado demasiado grande.

No se mostrará `0` como resultado confirmado cuando una parte de los datos no
pudo cargarse.

---

#### 34. Antipatrones prohibidos

```text
UNA TABLA POR CADA TABLA DE BASE DE DATOS
```

```text
TODO EN UNA SOLA PANTALLA PORQUE CABE
```

```text
PC GRANDE = BACKOFFICE
```

```text
GERENTE = TODAS LAS COLUMNAS Y ACCIONES
```

```text
DOS ÁREAS PERMITIDAS = ÁREA UNIFICADA
```

```text
RECETA COMPARTIDA = DOS COPIAS EDITABLES
```

```text
SELECCIONAR TODO = TODA LA ORGANIZACIÓN
```

```text
COLUMNA OCULTA CON CSS = DATO PROTEGIDO
```

```text
EXPORTAR = VER EN PANTALLA
```

```text
EDITAR CELDA = CORREGIR HECHO HISTÓRICO
```

---

#### 35. Eventos conceptuales

Podrán definirse posteriormente eventos como:

```text
DENSE_VIEW_OPENED
DENSE_VIEW_SCOPE_RESOLVED
DENSE_VIEW_FILTER_CHANGED
DENSE_VIEW_COLUMNS_CHANGED
BULK_SELECTION_CREATED
BULK_ACTION_REQUESTED
BULK_ACTION_COMPLETED
BULK_ACTION_PARTIAL
ADMIN_DATA_CONFLICT_DETECTED
MULTI_AREA_STATION_OPENED
ACTIVE_AREA_SWITCH_REQUESTED
ACTIVE_AREA_SWITCH_CONFIRMED
ACTIVE_AREA_SWITCH_BLOCKED
RECIPE_AREA_PROJECTION_OPENED
```

La telemetría no será autorización ni fuente de contexto.

---

#### 36. Métricas

Se medirán:

- tiempo para encontrar información;
- errores de alcance;
- filtros olvidados;
- columnas utilizadas;
- acciones masivas parciales;
- conflictos;
- exportaciones;
- retrocesos;
- accesibilidad;
- tiempo de decisión;
- confusión entre áreas;
- cambios de área fallidos;
- producción atribuida al área incorrecta;
- recetas abiertas fuera de contexto.

Criterios duros:

```text
PRODUCCIÓN REGISTRADA SIN ÁREA EXACTA = 0

RECETA EJECUTABLE FUERA DE SU ALCANCE = 0

DATO SENSIBLE EXPUESTO POR COLUMNA O EXPORTACIÓN = 0

ACCIÓN MASIVA SOBRE ELEMENTOS FUERA DEL RESUMEN = 0
```

Las métricas no se utilizarán para maximizar cantidad de registros visibles ni
sancionar a quien detecte diferencias reales.

---

#### 37. Migración de superficies existentes

La aplicación posterior deberá inventariar:

- tablas;
- grids;
- paneles;
- filtros;
- columnas;
- acciones por fila;
- operaciones masivas;
- vistas táctiles que reutilizan componentes de escritorio;
- POS con backoffice expuesto;
- dispositivos que conservan áreas o actores;
- recetarios duplicados;
- rutas de exportación;
- densidad sin justificación.

Clasificación:

```text
CONFORME
REQUIERE_SIMPLIFICACIÓN_OPERATIVA
REQUIERE_WORKSPACE_ADMINISTRATIVO
REQUIERE_SEPARACIÓN_DE_CARRIL
REQUIERE_MASKING
REQUIERE_PROTECCIÓN_DE_LOTE
REQUIERE_REDISEÑO_MULTIÁREA
LEGACY
CANDIDATA_A_RETIRO
```

No se retirará una superficie hasta contar con reemplazo, validación, migración,
rollback y cobertura de pruebas.

---

#### 38. Requisitos de prueba derivados

Se crean:

```text
TREQ-UX-227 a TREQ-UX-249
```

El detalle completo se incorpora al archivo canónico
`04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

Cobertura resumida:

1. densidad reservada a trabajo administrativo justificable;
2. clasificación explícita de densidad;
3. prohibición de backoffice en operación;
4. independencia frente al hardware;
5. tablas y semántica;
6. filtros y alcance;
7. orden y agregaciones;
8. columnas y preferencias;
9. selección y operaciones masivas;
10. edición y conflictos;
11. rendimiento y virtualización;
12. teclado, mouse y tacto;
13. responsive y reflow;
14. accesibilidad;
15. sensibilidad y masking;
16. contexto administrativo;
17. exportación e impresión;
18. offline y frescura;
19. límites de dispositivos compartidos;
20. estación multiárea;
21. proyección de recetas por área;
22. cambio de área y atribución;
23. prototipado, métricas y migración.

---

#### 39. Criterios de aceptación

- [ ] La densidad queda definida por necesidad de decisión, no por tamaño del equipo.
- [ ] Las superficies operativas permanecen enfocadas aunque se ejecuten en PC táctil.
- [ ] Se distinguen los niveles `D0` a `D4`.
- [ ] Tablas, filtros, columnas, selección y lotes tienen contratos explícitos.
- [ ] La densidad no amplía permisos ni visibilidad de campos.
- [ ] Se protegen sensibilidad, exportación y dispositivos compartidos.
- [ ] Los dos POS del Centro de Producción pueden modelarse como estaciones multiárea sin inventar un área combinada.
- [ ] Cada ejecución conserva un área exacta y autoritativa.
- [ ] Se recomienda inicialmente acceso separado a Repostería y Pastelería y Tortas, con bandeja conjunta agrupada solo si el prototipo lo valida.
- [ ] Una receta compartida conserva identidad y versión únicas.
- [ ] La administración de recetas queda fuera del POS operativo.
- [ ] Todas las decisiones pendientes tienen tarea propietaria concreta.
- [ ] Se crean `TREQ-UX-227` a `TREQ-UX-249`.
- [ ] No se implementa código, hardware, migraciones ni cambios en Supabase.
- [ ] `UX-BASE-013` permanece sin iniciar.

---

#### 40. Estado y continuidad

```text
UX-BASE-011 APROBADA
UX-BASE-012 APROBADA
UX-BASE-013 NO INICIADA
```

No se inicia `UX-BASE-013` hasta la aprobación expresa de esta tarea.


### ✅ UX-BASE-013 — Definir comportamiento con conectividad inestable

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `UX-BASE-012 — Diseñar interfaces densas solo para administración` — APROBADA  
**Siguiente tarea reservada:** `UX-BASE-014 — Definir reanudación del proceso después de interrupciones`  
**Artefacto producido:** `UX-CONNECTIVITY-DEGRADATION-CONTRACT-001`  
**Versión del estándar transversal:** `CONNECTIVITY-DEGRADATION-1.0.0`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069` y procesos futuros incorporados al catálogo canónico  
**Aplicaciones cubiertas:** SHELL, ANIMA, NEXO, FOGO, ORIGO, PULSO, VISO, NUMERA, TALENTO, PASS, AURA y aplicaciones futuras de Vento OS  
**Naturaleza:** principio transversal de conectividad, frescura, captura local, sincronización, idempotencia, conflictos, autorización, dispositivos compartidos, periféricos, contingencia y recuperación  
**Caso operativo incorporado:** computadores POS táctiles multiárea del primer piso del Centro de Producción  
**Cambios en código, Service Workers, almacenamiento local, colas, RPC, RLS, Supabase, dispositivos, red o aplicaciones:** no autorizados

---

#### 1. Propósito

Definir cómo deberá comportarse Vento OS cuando la conectividad sea lenta,
intermitente, parcial, ausente o incierta, evitando dos fallos opuestos:

1. detener innecesariamente toda la operación ante una degradación recuperable;
2. presentar como confirmado un efecto que solo existe en el dispositivo o cuya
   ejecución real es desconocida.

El contrato deberá permitir que cada proceso declare, de forma explícita:

- qué información puede consultarse desde una copia local;
- qué datos pueden capturarse sin conexión;
- qué comandos pueden quedar en cola;
- qué acciones exigen conexión y autorización en línea;
- qué nivel de frescura requiere cada dato;
- cómo se identifica y ordena cada operación pendiente;
- qué sucede al recuperar conectividad;
- cómo se resuelven conflictos;
- cuándo debe activarse una contingencia manual;
- cómo se mantiene informado al trabajador sin lenguaje técnico.

Regla central:

```text
SIN CONEXIÓN
≠ SIN CONTROL

CAPTURA LOCAL
≠ EFECTO EMPRESARIAL CONFIRMADO

REINTENTO
≠ NUEVA OPERACIÓN
```

---

#### 2. Continuidad lógica

```text
SUPERFICIE ADECUADA AL CARRIL Y DISPOSITIVO
UX-BASE-011 Y UX-BASE-012
        ↓
COMPORTAMIENTO PREDECIBLE CUANDO
LA CONECTIVIDAD CAMBIA
UX-BASE-013
        ↓
REANUDAR LA TAREA, EL BORRADOR,
LA CUSTODIA Y EL PUNTO EXACTO
UX-BASE-014
```

`UX-BASE-013` define el comportamiento durante la degradación y la
sincronización inicial. `UX-BASE-014` definirá con mayor detalle cómo una
persona retoma el proceso después de interrupciones humanas, técnicas,
operativas o de sesión.

---

#### 3. Decisión principal

Toda superficie deberá separar cuatro preguntas:

```text
1. ¿EL DISPOSITIVO TIENE RED?
2. ¿EL SERVICIO REQUERIDO RESPONDE?
3. ¿LOS DATOS SIGUEN SIENDO VIGENTES?
4. ¿LA OPERACIÓN FUE CONFIRMADA?
```

No se permitirá deducirlas de un único icono de Wi-Fi.

```text
WIFI CONECTADO
≠ INTERNET DISPONIBLE
≠ SUPABASE DISPONIBLE
≠ SESIÓN VÁLIDA
≠ DATOS FRESCOS
≠ OPERACIÓN CONFIRMADA
```

---

#### 4. Vector canónico de conectividad

La interfaz y los contratos internos deberán representar, como mínimo, estas
dimensiones:

```text
network_reachability
service_reachability
session_validity
context_freshness
resource_freshness
sync_health
peripheral_health
last_verified_at
```

Estados conceptuales iniciales:

```text
ONLINE_HEALTHY
ONLINE_DEGRADED
INTERMITTENT
OFFLINE_CONFIRMED
CONNECTIVITY_UNKNOWN
RECOVERING
SYNC_BLOCKED
```

El estado será derivado y versionado. No será una selección del usuario.

##### 4.1 `ONLINE_HEALTHY`

Los servicios necesarios responden dentro del umbral aprobado y las
operaciones pueden seguir su política ordinaria.

##### 4.2 `ONLINE_DEGRADED`

Existe comunicación, pero con latencia, errores parciales o servicios
secundarios no disponibles. No se cambiará automáticamente a offline si una
operación segura todavía puede confirmarse.

##### 4.3 `INTERMITTENT`

La disponibilidad cambia durante la interacción. La interfaz deberá evitar
reenvíos automáticos no controlados y conservar el estado de cada intento.

##### 4.4 `OFFLINE_CONFIRMED`

La ausencia de conectividad está comprobada. Solo se habilitarán capacidades
expresamente autorizadas para este estado.

##### 4.5 `CONNECTIVITY_UNKNOWN`

No puede determinarse si la solicitud no salió, llegó, se ejecutó o perdió la
respuesta. Es el estado de mayor riesgo para reintentos.

##### 4.6 `RECOVERING`

La red reapareció, pero todavía deben revalidarse hora, sesión, contexto,
versiones, colas y conflictos.

##### 4.7 `SYNC_BLOCKED`

Existe conectividad, pero una o más operaciones no pueden sincronizarse por
conflicto, autorización, versión, esquema, dependencia o evidencia faltante.

---

#### 5. Política por capacidad

Cada consulta y comando deberá declarar uno de estos modos:

```text
ONLINE_REQUIRED
ONLINE_PREFERRED
STALE_READ_ONLY
OFFLINE_CAPTURE_ALLOWED
OFFLINE_QUEUE_ALLOWED
MANUAL_CONTINGENCY
NOT_AVAILABLE_OFFLINE
```

| Modo                      | Comportamiento                                                      |
| ------------------------- | ------------------------------------------------------------------- |
| `ONLINE_REQUIRED`         | No se inicia ni confirma sin respuesta autoritativa                 |
| `ONLINE_PREFERRED`        | Opera en línea y puede degradarse según política específica         |
| `STALE_READ_ONLY`         | Permite consultar una copia con frescura y limitaciones visibles    |
| `OFFLINE_CAPTURE_ALLOWED` | Permite registrar observaciones como borrador local                 |
| `OFFLINE_QUEUE_ALLOWED`   | Permite preparar un comando idempotente para sincronización         |
| `MANUAL_CONTINGENCY`      | Remite a procedimiento físico controlado y reconciliación posterior |
| `NOT_AVAILABLE_OFFLINE`   | Explica por qué la acción no puede ejecutarse                       |

Regla:

```text
LA APLICACIÓN NO DECLARA "MODO OFFLINE" GLOBAL

CADA CAPACIDAD DECLARA
SU POLÍTICA DE CONECTIVIDAD
```

Una misma pantalla podrá mostrar una receta en `STALE_READ_ONLY`, permitir
capturar una medición en `OFFLINE_CAPTURE_ALLOWED` y bloquear una aprobación
`ONLINE_REQUIRED`.

---

#### 6. Clasificación inicial de operaciones

##### 6.1 Consultas de referencia

Podrán admitir `STALE_READ_ONLY` cuando exista:

- snapshot identificado;
- versión;
- fecha de última verificación;
- política de expiración;
- alcance del actor;
- ausencia de datos revocados o sensibles no reutilizables.

##### 6.2 Borradores

Podrán guardarse localmente si:

- pertenecen a un actor identificado;
- el dispositivo es confiable;
- la información está minimizada y protegida;
- existe identificador estable;
- no se presentan como confirmados;
- pueden eliminarse o transferirse de forma controlada.

##### 6.3 Observaciones físicas

Cantidades, temperaturas, pesos, daños, tiempos, fotos o resultados podrán
capturarse localmente cuando el proceso lo autorice. El dato conservará momento,
actor, dispositivo, método y recurso observado.

##### 6.4 Claims, inicios y handoffs

Serán `ONLINE_REQUIRED` por defecto porque afectan concurrencia, responsabilidad
y custodia. Una excepción offline requerirá lease o autorización previa,
alcance finito, vencimiento y reconciliación explícita.

##### 6.5 Acciones irreversibles o sensibles

Aprobaciones, anulaciones, reversas, pagos, reembolsos, permisos, publicaciones,
exportaciones, cierre de caja, cambios maestros y excepciones sensibles serán
`ONLINE_REQUIRED` salvo contrato específico posterior.

##### 6.6 Administración densa

Las superficies `D2`, `D3` y `D4` serán `ONLINE_REQUIRED` por defecto. Una copia
obsoleta podrá ser solo lectura y nunca aprobar, configurar o ejecutar lotes.

---

#### 7. Presentación persistente del estado

La conectividad deberá permanecer visible sin cubrir la tarea.

Ejemplos:

```text
Con conexión
Última verificación: ahora
```

```text
Conexión inestable
Tus cambios se guardarán en este equipo hasta poder confirmarlos
```

```text
Sin conexión
3 operaciones pendientes de sincronizar
Última actualización de datos: 14:32
```

```text
Conexión recuperada
Validando sesión y operaciones pendientes
```

No serán suficientes:

```text
Offline
Error de red
Algo salió mal
```

La interfaz distinguirá:

- estado de la red;
- estado del dato mostrado;
- estado de la acción actual;
- cantidad de operaciones pendientes;
- conflictos que requieren intervención.

---

#### 8. Estados de una captura o comando

```text
LOCAL_DRAFT
READY_TO_SYNC
WAITING_FOR_DEPENDENCY
SYNCING
ACKNOWLEDGED
REJECTED_RETRYABLE
REJECTED_TERMINAL
CONFLICT
REAUTH_REQUIRED
RECONCILIATION_REQUIRED
CANCELLED_LOCAL
SUPERSEDED
```

Definiciones:

- `LOCAL_DRAFT`: trabajo guardado únicamente en el dispositivo;
- `READY_TO_SYNC`: operación completa y elegible para intentar sincronización;
- `WAITING_FOR_DEPENDENCY`: depende de otra operación local o remota;
- `SYNCING`: intento activo con identificador estable;
- `ACKNOWLEDGED`: servidor confirmó receipt y resultado;
- `REJECTED_RETRYABLE`: fallo temporal seguro para reintentar;
- `REJECTED_TERMINAL`: no puede repetirse sin corrección;
- `CONFLICT`: el recurso o su versión cambiaron;
- `REAUTH_REQUIRED`: la autoridad anterior no puede reutilizarse;
- `RECONCILIATION_REQUIRED`: el resultado físico y digital deben compararse;
- `CANCELLED_LOCAL`: borrador descartado antes de envío;
- `SUPERSEDED`: reemplazado por una operación posterior vinculada.

```text
LOCAL_DRAFT O READY_TO_SYNC
≠ COMPLETADO
```

---

#### 9. Mensajes de confirmación

La interfaz utilizará lenguaje inequívoco:

```text
Guardado en este equipo
Pendiente de sincronizar
```

```text
Enviado al servidor
Esperando confirmación
```

```text
Confirmado por el servidor
Movimiento MV-2026-00184
```

```text
No sabemos si la operación se completó
Verificaremos el estado antes de permitir otro intento
```

Queda prohibido mostrar:

```text
Listo
Completado
Guardado
```

sin indicar si el resultado es local o autoritativo cuando exista ambigüedad.

---

#### 10. Registro conceptual de operación local

Toda operación pendiente deberá conservar, cuando aplique:

```text
local_operation_id
idempotency_key
operation_type
process_id
process_instance_id
task_id
resource_type
resource_id
resource_version_observed
actor_id
principal_id
device_id
site_id
area_id
shift_id
checkin_id
permission_code_requested
context_id_observed
context_resolved_at
captured_at_device
captured_at_server_estimate
payload_schema_version
application_version
payload_minimized
evidence_refs
dependency_ids
retry_policy
sync_status
attempt_count
last_attempt_at
server_receipt_id
conflict_ref
```

Esta forma es conceptual. No autoriza una tabla, tecnología o estructura física.

---

#### 11. Idempotencia y reintentos

Toda mutación elegible para cola deberá poseer una clave de idempotencia estable.

```text
MISMA INTENCIÓN EMPRESARIAL
→ MISMA IDEMPOTENCY KEY

NUEVA INTENCIÓN
→ NUEVA KEY
```

El sistema deberá impedir duplicar:

- movimientos de inventario;
- recepciones;
- consumos;
- producción;
- pagos;
- entregas;
- check-ins;
- impresiones empresariales;
- handoffs;
- eventos de auditoría de negocio.

Un botón deshabilitado o un indicador de carga no será defensa suficiente.

Ante `CONNECTIVITY_UNKNOWN`:

```text
CONSULTAR RECEIPT O ESTADO
→ SOLO DESPUÉS DECIDIR
  REINTENTAR, CONCILIAR O DETENER
```

---

#### 12. Orden y dependencias

Las operaciones no se sincronizarán únicamente por fecha de creación.

Se conservará un grafo o secuencia explícita cuando exista dependencia:

```text
CREAR BORRADOR DE LOTE
→ REGISTRAR MEDICIÓN
→ COMPLETAR RESULTADO
→ EMITIR MOVIMIENTO
```

Reglas:

1. una operación dependiente no se enviará antes de su prerequisito;
2. un rechazo terminal bloqueará dependientes;
3. una operación independiente podrá continuar;
4. las colas de actores diferentes no se fusionarán;
5. las operaciones de áreas distintas conservarán su área;
6. la prioridad no alterará el orden causal;
7. una operación superseded no se ejecutará posteriormente.

---

#### 13. Frescura y expiración

Cada dato susceptible de obsolescencia deberá declarar:

```text
fetched_at
valid_until
freshness_class
source_version
stale_behavior
```

Clases iniciales:

```text
REAL_TIME_REQUIRED
SHORT_LIVED
SHIFT_SCOPED
DAY_SCOPED
VERSION_SCOPED
REFERENCE_LONG_LIVED
```

Ejemplos:

- permisos, actor, claims y estados transaccionales: `REAL_TIME_REQUIRED`;
- turno y check-in: `SHIFT_SCOPED`, con expiración explícita;
- receta aprobada: `VERSION_SCOPED`;
- instrucciones generales no sensibles: `REFERENCE_LONG_LIVED`;
- existencia disponible para prometer o retirar: normalmente requiere alta
  frescura y validación previa a la mutación.

```text
DATO EN CACHÉ
≠ DATO VIGENTE
```

Una pantalla deberá mostrar cuándo fue actualizada y qué acciones están
limitadas por su antigüedad.

---

#### 14. Autorización durante la degradación

El dispositivo no conservará permisos como autoridad indefinida.

Solo podrá admitirse operación offline protegida cuando exista un paquete o
envelope previamente emitido y verificable que declare:

```text
actor
capacidad exacta
recurso o alcance finito
sitio y área
turno o ventana
actividad permitida
límites cuantitativos
emitido en
vence en
versión de política
identificador de dispositivo
revocación o condición de revalidación
```

Reglas:

```text
PERMISO VISTO ANTES
≠ PERMISO VÁLIDO AHORA

CONTEXTO EN CACHÉ
≠ CONTEXTO AUTORIZADO PARA NUEVA MUTACIÓN
```

Al sincronizar se revalidarán actor, vínculo, turno, contexto, dispositivo,
permiso, recurso, versión y denegaciones aplicables.

Una revocación podrá convertir una captura local en evidencia conservable, pero
no obligará al servidor a ejecutar el efecto solicitado.

---

#### 15. Dispositivos compartidos y cambio de actor

Toda cola local deberá estar aislada por:

```text
DISPOSITIVO
+
ACTOR
+
CONTEXTO
+
ÁREA
```

Al cambiar de trabajador:

1. se detendrán nuevas mutaciones del actor anterior;
2. se mostrará el estado de sus borradores y pendientes;
3. no se asignarán al nuevo actor;
4. se protegerán o retirarán de la vista;
5. se resolverá una sesión nueva;
6. se creará una cola lógica separada;
7. las operaciones pendientes conservarán la atribución original.

Sin conexión, el cambio de actor solo permitirá mutaciones cuando exista un
mecanismo offline de identidad y autorización aprobado para ese dispositivo.
De lo contrario, la estación quedará en consulta o contingencia.

---

#### 16. Lecturas y caché

La caché deberá aplicar:

- partición por actor, territorio y sensibilidad;
- versión de esquema;
- cifrado cuando corresponda;
- expiración;
- invalidación por logout o cambio de actor;
- limpieza remota o local ante revocación cuando sea técnicamente posible;
- límites de volumen;
- exclusión de secretos;
- minimización de datos.

No se almacenarán offline por conveniencia:

- salarios completos;
- diagnósticos;
- información bancaria;
- permisos detallados de terceros;
- notas internas sensibles;
- secretos o tokens de larga duración;
- datasets administrativos masivos.

---

#### 17. Captura de hechos físicos

Una observación offline deberá distinguir:

```text
HECHO OBSERVADO
MOMENTO DE OBSERVACIÓN
MOMENTO DE REGISTRO LOCAL
MOMENTO DE SINCRONIZACIÓN
```

Ejemplo:

```text
Temperatura observada: 3,8 °C
Observada a las 10:14
Guardada en este equipo a las 10:14
Sincronizada a las 10:27
```

No se sustituirá la hora de observación por la hora de sincronización.

Una fotografía, firma o medición deberá quedar vinculada a la observación y no
subirse como archivo huérfano.

---

#### 18. Claims, custodia y handoffs

Por defecto, no se permitirá offline:

- tomar una tarea de una cola compartida;
- transferir custodia;
- declarar recepción definitiva;
- liberar a un actor anterior;
- completar un handoff;
- iniciar trabajo que excluya a otros actores.

Una excepción requerirá:

- lease emitido previamente;
- actor y recurso exactos;
- vencimiento;
- ámbito territorial;
- secuencia permitida;
- evidencia local;
- tratamiento de doble ejecución;
- reconciliación posterior.

```text
ENTREGA FÍSICA REALIZADA SIN CONEXIÓN
→ PUEDE SER HECHO OBSERVADO

HANDOFF DIGITAL CONFIRMADO
→ SOLO DESPUÉS DE RECONCILIAR Y ACEPTAR
```

---

#### 19. Acciones obligatoriamente en línea

Sin contrato posterior más específico, serán `ONLINE_REQUIRED`:

- aprobar o rechazar decisiones sensibles;
- anular, revertir o reabrir;
- cambiar permisos, roles o dispositivo;
- publicar horarios, recetas, precios o configuración;
- realizar pagos, reembolsos o cierres financieros;
- aceptar exportaciones o descargas sensibles;
- ejecutar lotes administrativos;
- cambiar fuentes maestras;
- resolver conflictos con pérdida de información;
- aplicar overrides;
- finalizar una conciliación.

La interfaz explicará la razón y conservará el trabajo preparatorio permitido.

---

#### 20. Conflictos

Se clasifican inicialmente:

```text
RESOURCE_VERSION_CONFLICT
CONTEXT_CHANGED
AUTHORIZATION_CHANGED
DUPLICATE_OPERATION
DEPENDENCY_REJECTED
SCHEMA_INCOMPATIBLE
BUSINESS_STATE_CHANGED
QUANTITY_CONFLICT
CUSTODY_CONFLICT
TIME_WINDOW_EXPIRED
```

La resolución nunca utilizará `last write wins` para efectos empresariales.

Opciones controladas:

```text
ACCEPT_SERVER_STATE
REAPPLY_ALLOWED_FIELDS
CREATE_CORRECTION
SPLIT_OPERATION
ESCALATE
DISCARD_LOCAL_DRAFT
MANUAL_RECONCILIATION
```

El trabajador deberá saber:

- qué cambió;
- qué parte local se conserva;
- qué parte no puede aplicarse;
- quién puede resolver;
- si el hecho físico ya ocurrió;
- cuál es la siguiente acción segura.

---

#### 21. Secuencia de reconexión

Al detectar conectividad no se enviará toda la cola inmediatamente.

Secuencia canónica:

```text
1. ESTABILIZAR CONECTIVIDAD
2. VERIFICAR HORA Y SERVICIOS
3. REVALIDAR SESIÓN Y DISPOSITIVO
4. RESOLVER NUEVO ACCESS CONTEXT
5. DESCARGAR REVOCACIONES Y VERSIONES
6. CLASIFICAR OPERACIONES PENDIENTES
7. SINCRONIZAR POR DEPENDENCIAS
8. CONSULTAR RECEIPTS
9. DETENER Y EXPLICAR CONFLICTOS
10. ACTUALIZAR PROYECCIONES
11. CONFIRMAR AL TRABAJADOR
```

La recuperación parcial de un servicio no habilitará capacidades dependientes
de otro servicio todavía indisponible.

---

#### 22. Ciclo de vida de la aplicación

La cola deberá sobrevivir, según política, a:

- recarga;
- cierre accidental;
- suspensión del sistema;
- reinicio;
- cambio de orientación;
- pérdida temporal de energía.

Pero no deberá ejecutarse en segundo plano sin validar:

- actor todavía atribuible;
- sesión o envelope vigente;
- dispositivo autorizado;
- aplicación y esquema compatibles;
- red suficientemente estable;
- operación no cancelada;
- dependencias satisfechas.

Cerrar la aplicación no equivaldrá a descartar una operación ni a confirmarla.

---

#### 23. Evidencias y archivos

Los archivos usarán estados propios:

```text
LOCAL_ONLY
QUEUED
UPLOADING
UPLOADED_UNLINKED
LINKED_AND_CONFIRMED
FAILED_RETRYABLE
FAILED_TERMINAL
```

Reglas:

- se mostrará progreso real;
- un upload parcial no será evidencia confirmada;
- se evitarán duplicados mediante hash o identificador estable;
- se validará tamaño, tipo, sensibilidad y retención;
- el recurso de negocio no se cerrará si la evidencia obligatoria falta;
- una evidencia local sensible se protegerá y eliminará según política después
  de la confirmación.

---

#### 24. Periféricos y conectividad independiente

La red del backend y el periférico se tratarán por separado.

Ejemplos:

```text
BACKEND OFFLINE + IMPRESORA LOCAL DISPONIBLE
```

no significa que una impresión empresarial pueda emitirse sin cola, receipt y
política.

```text
BACKEND ONLINE + DATÁFONO SIN RESPUESTA
```

no significa que el pago falló ni que pueda repetirse.

Cada integración deberá indicar:

- comando enviado;
- recepción por el periférico;
- ejecución física;
- resultado conocido o desconocido;
- posibilidad de reintento;
- conciliación requerida.

---

#### 25. Contingencia manual

La contingencia no será una autorización genérica para usar papel.

Todo procedimiento manual deberá definir:

```text
CONDICIÓN DE ACTIVACIÓN
RESPONSABLE
FORMATO O IDENTIFICADOR
DATOS MÍNIMOS
CONTROL DE DUPLICADOS
CUSTODIA
NUMERACIÓN
MOMENTO DE DIGITALIZACIÓN
RESPONSABLE DE CONCILIAR
CRITERIO DE CIERRE
```

Cuando vuelva la conexión:

- no se copiará ciegamente;
- se verificará si el sistema ya contiene el efecto;
- se relacionará el soporte físico;
- se registrará el actor original;
- se distinguirá observación, transcripción y aprobación;
- se cerrará la contingencia únicamente después de conciliar.

---

#### 26. NEXO

Política inicial:

- catálogos, LOC y LPN podrán consultarse offline solo con versión y frescura;
- conteos físicos podrán capturarse localmente;
- retiros o movimientos requerirán política específica, reserva o envelope;
- una existencia cacheada no permitirá prometer disponibilidad definitiva;
- preparación, carga, tránsito y recepción conservarán estados separados;
- la custodia no se transferirá digitalmente sin confirmación o reconciliación;
- escaneos repetidos no crearán movimientos duplicados.

---

#### 27. FOGO

Política inicial:

- una receta aprobada y versionada podrá quedar disponible como referencia
  offline cuando su política lo permita;
- deberá mostrarse la versión y la última validación;
- el inicio de un lote será online por defecto;
- cantidades, tiempos, temperaturas, merma y resultado podrán capturarse como
  observaciones locales cuando exista lote válido y actor atribuible;
- finalizar el lote y emitir consumos o producto terminado exigirá
  sincronización y conciliación;
- una receta revocada o sustituida no podrá iniciar trabajo nuevo al reconectar.

---

#### 28. POS multiárea del Centro de Producción

Para los computadores táctiles compartidos de Repostería y Pastelería y Tortas:

```text
COLA LOCAL
→ SEPARADA POR DISPOSITIVO, ACTOR Y ÁREA
```

Reglas:

1. la pantalla conservará visible el área activa;
2. una receta cacheada conservará su área y versión;
3. cambiar de área sin conexión no ampliará la autorización;
4. si el trabajador ya posee un contexto offline válido para ambas áreas, el
   cambio deberá ser explícito y cada operación conservará el área elegida;
5. si no existe autorización offline válida, el cambio quedará bloqueado o en
   consulta;
6. un borrador de Repostería no aparecerá como borrador de Pastelería y Tortas;
7. las operaciones de las dos estaciones no se fusionarán por cercanía física;
8. al reconectar se detectarán conflictos de lote, receta, claim y versión.

La decisión definitiva de capacidad offline por estación corresponde a
`UX-STATION-007`, `NFR-REQ-004`, `AUTH-DEV-*`, `FOGO-UX-*` y los paquetes E5.

---

#### 29. ORIGO

- órdenes y líneas podrán consultarse con frescura visible;
- cantidades recibidas, lotes, vencimientos y condición física podrán capturarse
  localmente;
- la recepción definitiva, actualización de inventario, documento y diferencias
  deberán sincronizarse como una unidad o saga controlada;
- una orden modificada producirá conflicto, no sobrescritura;
- la misma recepción no podrá registrarse dos veces por timeout.

---

#### 30. PULSO y pagos

- crear o preparar un pedido offline requerirá contrato específico de numeración,
  precios, impuestos, catálogo y disponibilidad;
- aceptar un pago nunca se inferirá del estado de red;
- datáfono, efectivo, pago en línea y factura tendrán estados independientes;
- una respuesta desconocida del proveedor bloqueará un segundo cobro hasta
  consultar o conciliar;
- cierres, devoluciones, reembolsos y anulaciones serán online por defecto;
- comandas e impresiones usarán colas idempotentes y receipts.

---

#### 31. ANIMA, TALENTO y PASS

- check-in y check-out requerirán política estricta de identidad, hora y
  duplicados;
- una marcación local deberá mostrar que está pendiente y no conceder por sí
  sola un contexto operativo confirmado;
- documentos sensibles no se almacenarán offline salvo necesidad y protección
  aprobadas;
- formularios largos conservarán borrador local protegido;
- el cliente podrá consultar información cacheada no sensible con frescura
  visible;
- consentimientos, canjes, cambios de identidad y acciones financieras serán
  online por defecto.

---

#### 32. VISO y NUMERA

Las superficies administrativas densas serán `ONLINE_REQUIRED`.

Podrán admitir `STALE_READ_ONLY` únicamente para consulta claramente marcada,
sin:

- aprobaciones;
- conciliaciones;
- ajustes;
- configuración;
- exportaciones;
- lotes;
- cambios de periodo;
- decisiones sobre información incompleta.

Un snapshot administrativo deberá mostrar periodo, territorio, filtros, versión
y momento de extracción.

---

#### 33. Privacidad y seguridad local

El almacenamiento local deberá protegerse con controles proporcionales:

- cifrado o protección del sistema;
- aislamiento por aplicación y actor;
- bloqueo del dispositivo;
- expiración;
- minimización;
- borrado después de confirmar;
- detección de manipulación cuando corresponda;
- no inclusión de tokens o secretos de larga duración;
- logs sin payload sensible;
- procedimiento ante pérdida o revocación del dispositivo.

Una función offline se descartará si el riesgo de conservar el dato localmente
supera el beneficio operativo.

---

#### 34. Accesibilidad y carga cognitiva

El estado de conectividad:

- no dependerá solo de color;
- tendrá texto y semántica accesible;
- se anunciará cuando cambie materialmente;
- no interrumpirá repetidamente con modales;
- permitirá revisar operaciones pendientes;
- diferenciará local, en cola, conflicto y confirmado;
- no usará animaciones continuas innecesarias;
- ofrecerá acciones comprensibles por teclado, tacto y lector de pantalla.

Los contadores se expresarán con significado:

```text
3 operaciones guardadas en este equipo
1 necesita revisión
```

No:

```text
Sync queue: 3
Error 409: 1
```

---

#### 35. Observabilidad y soporte

Se registrarán sin culpabilizar al trabajador:

- cambios de estado de conectividad;
- latencia y disponibilidad por servicio;
- tamaño y edad de colas;
- intentos;
- receipts;
- duplicados evitados;
- conflictos;
- rechazos por autorización;
- tiempo hasta sincronización;
- contingencias;
- pérdida o recuperación de borradores;
- versión de aplicación y esquema.

Los logs técnicos no expondrán datos sensibles. La interfaz mostrará una
referencia segura para soporte.

---

#### 36. Métricas y guardrails

Métricas:

- porcentaje de tareas completadas sin pérdida;
- tiempo offline y hasta sincronización;
- cantidad y antigüedad de pendientes;
- conflictos por tipo;
- duplicados evitados;
- reintentos;
- operaciones con resultado desconocido;
- contingencias activadas;
- tiempo de reconciliación;
- tareas abandonadas por conectividad;
- claridad reportada por trabajadores.

Guardrails:

```text
EFECTO DUPLICADO POR REINTENTO = 0

OPERACIÓN LOCAL PRESENTADA COMO CONFIRMADA = 0

BORRADOR DE UN ACTOR ENTREGADO A OTRO = 0

MUTACIÓN SENSIBLE CON CONTEXTO VENCIDO = 0

CONFLICTO RESUELTO POR LAST WRITE WINS = 0
```

Las métricas no se utilizarán para responsabilizar al trabajador por fallas de
red, infraestructura, latencia o sincronización.

---

#### 37. Pruebas obligatorias

Cada capacidad deberá probar, según aplique:

- red lenta;
- pérdida antes de enviar;
- pérdida durante envío;
- pérdida después de ejecutar y antes de responder;
- reconexión breve y nueva caída;
- servidor parcial;
- sesión expirada;
- permiso revocado;
- cambio de actor;
- cambio de área;
- dos dispositivos sobre el mismo recurso;
- esquema de cola antiguo;
- aplicación actualizada con pendientes;
- almacenamiento lleno;
- reloj incorrecto;
- periférico disponible sin backend;
- backend disponible sin periférico;
- cierre y reinicio del equipo;
- evidencia parcialmente subida;
- contingencia manual y reconciliación.

La prueba se realizará además en estaciones reales cuando la operación dependa
de red, dispositivo o periférico.

---

#### 38. Propiedad de decisiones posteriores

| Decisión                                       | Tarea propietaria                                                                                                        |
| ---------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| política offline y sincronización no funcional | `NFR-REQ-004`                                                                                                            |
| disponibilidad por proceso                     | `NFR-REQ-001`                                                                                                            |
| tiempos y latencia                             | `NFR-REQ-003`                                                                                                            |
| hardware, red y periféricos                    | `NFR-REQ-008`                                                                                                            |
| observabilidad y soporte                       | `NFR-REQ-009`                                                                                                            |
| respaldo, RTO y RPO                            | `NFR-REQ-010`                                                                                                            |
| compatibilidad de dispositivos                 | `NFR-REQ-011`                                                                                                            |
| contingencia por estación                      | `UX-STATION-007`                                                                                                         |
| recuperación del punto de trabajo              | `UX-BASE-014`                                                                                                            |
| identidad y límites de dispositivos            | `AUTH-DEV-001` a `AUTH-DEV-016`                                                                                          |
| colas y entrega confiable                      | `QUEUE-ARC-001` a `QUEUE-ARC-012`                                                                                        |
| integración entre aplicaciones                 | `INT-APP-001` a `INT-APP-010`                                                                                            |
| protección de comandos                         | `AUTH-SRV-*` y `AUTH-DB-*`                                                                                               |
| materialización por pantalla                   | `PROC-SCREEN-001` a `PROC-SCREEN-028`; `AUTH-UI-001` a `AUTH-UI-060`                                                     |
| comportamiento por dominio                     | subbloques `NEXO-UX-*`, `FOGO-UX-*`, `ORIGO-UX-*`, `PULSO-UX-*`, `ANIMA-*`, `VISO-*`, `NUMERA-*`, `TALENTO-*` y `PASS-*` |
| prueba física y con trabajadores               | `UX-STATION-008`; `UX-QA-001` a `UX-QA-030`                                                                              |

No queda una decisión diferida sin tarea propietaria.

---

#### 39. Migración de comportamiento existente

La aplicación posterior deberá inventariar:

- formularios que pierden contenido al caer la red;
- botones que reenvían mutaciones;
- mensajes `Guardado` ambiguos;
- cachés sin fecha;
- permisos persistidos en cliente;
- colas sin actor o área;
- service workers no gobernados;
- reintentos automáticos sin idempotencia;
- impresiones o pagos con resultado desconocido;
- operaciones en `localStorage` sin protección;
- pantallas que se vacían offline;
- borradores heredados entre trabajadores;
- sincronizaciones `last write wins`;
- contingencias en papel sin reconciliación;
- dispositivos que cambian de área usando un selector local.

Clasificación:

```text
CONFORME
REQUIERE_ESTADO_VISIBLE
REQUIERE_IDEMPOTENCIA
REQUIERE_OUTBOX
REQUIERE_FRESCURA
REQUIERE_REAUTORIZACIÓN
REQUIERE_CONCILIACIÓN
REQUIERE_CONTINGENCIA
NO_APTO_OFFLINE
LEGACY
CANDIDATA_A_RETIRO
```

Ningún flujo se declarará offline-capable antes de pruebas de pérdida, duplicado,
conflicto, actor, área, reinicio y reconciliación.

---

#### 40. Requisitos de prueba derivados

Se crean:

```text
TREQ-UX-250 a TREQ-UX-273
```

El detalle completo se incorpora al archivo canónico
`04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

Cobertura resumida:

1. vector de conectividad;
2. política por capacidad;
3. estado visible;
4. diferenciación local-servidor;
5. contrato de outbox;
6. idempotencia;
7. dependencias;
8. frescura;
9. autorización offline;
10. dispositivos compartidos;
11. caché y privacidad;
12. observaciones físicas;
13. claims, handoffs y custodia;
14. acciones sensibles;
15. conflictos;
16. reconexión;
17. ciclo de vida;
18. evidencias;
19. periféricos;
20. contingencia;
21. estaciones multiárea FOGO;
22. administración en solo lectura;
23. accesibilidad;
24. pruebas, observabilidad y migración.

---

#### 41. Criterios de aceptación

- [ ] Se distinguen red, servicio, frescura, sesión y confirmación.
- [ ] Cada capacidad declara una política explícita de conectividad.
- [ ] La interfaz diferencia borrador local, cola, sincronización, conflicto y confirmación.
- [ ] Ningún resultado desconocido se reintenta ciegamente.
- [ ] Las mutaciones en cola conservan identidad, actor, contexto, versión e idempotencia.
- [ ] Las dependencias se sincronizan en orden causal.
- [ ] La caché muestra frescura y no amplía autorización.
- [ ] Los dispositivos compartidos aíslan colas por actor y área.
- [ ] Las observaciones físicas conservan la hora real de observación.
- [ ] Claims, custodia y handoffs son online por defecto.
- [ ] Las acciones sensibles permanecen online salvo contrato posterior específico.
- [ ] Los conflictos no se resuelven mediante `last write wins`.
- [ ] La reconexión revalida sesión, contexto, versiones y revocaciones antes de enviar.
- [ ] Archivos y periféricos tienen estados independientes y receipts.
- [ ] La contingencia manual posee activación y conciliación formal.
- [ ] Los POS multiárea del Centro de Producción conservan colas, recetas y operaciones por área.
- [ ] Las superficies administrativas son online por defecto.
- [ ] Se protegen privacidad, accesibilidad y soporte.
- [ ] Todas las decisiones posteriores tienen tarea propietaria exacta.
- [ ] Se crean `TREQ-UX-250` a `TREQ-UX-273`.
- [ ] No se implementan colas, código, Service Workers, migraciones ni cambios en Supabase.
- [ ] `UX-BASE-014` permanece sin iniciar.

---

#### 42. Estado y continuidad

```text
UX-BASE-012 APROBADA
UX-BASE-013 APROBADA
UX-BASE-014 NO INICIADA
```

No se inicia `UX-BASE-014` hasta la aprobación expresa de esta tarea.


### ✅ UX-BASE-014 — Definir reanudación del proceso después de interrupciones

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `UX-BASE-013 — Definir comportamiento con conectividad inestable` — APROBADA  
**Siguiente tarea reservada:** `UX-BASE-015 — Validar terminología con trabajadores reales`  
**Artefacto producido:** `UX-PROCESS-RESUMPTION-CONTRACT-001`  
**Versión del estándar transversal:** `PROCESS-RESUMPTION-1.0.0`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069` y procesos futuros incorporados al catálogo canónico  
**Aplicaciones cubiertas:** SHELL, ANIMA, NEXO, FOGO, ORIGO, PULSO, VISO, NUMERA, TALENTO, PASS, AURA y aplicaciones futuras de Vento OS  
**Naturaleza:** principio transversal de pausa, checkpoint, borradores, claims, custodia, handoffs, conflictos, reautorización, recuperación, dispositivos compartidos y continuidad entre aplicaciones  
**Caso operativo incorporado:** computadores POS táctiles multiárea del primer piso del Centro de Producción  
**Cambios en código, almacenamiento local, colas, RPC, RLS, Supabase, dispositivos o aplicaciones:** no autorizados

---

#### 1. Propósito

Definir cómo deberá retomar Vento OS una tarea después de una interrupción sin:

1. obligar a la persona a reconstruir manualmente todo el contexto;
2. repetir efectos que ya pudieron quedar confirmados;
3. continuar sobre una versión, actor, área, turno o custodia vencidos;
4. perder borradores, observaciones o evidencia recuperable;
5. permitir que otro trabajador herede trabajo o autoridad de forma implícita;
6. tratar la última URL visitada como el estado real del proceso.

Regla central:

```text
REANUDAR
≠ VOLVER A LA ÚLTIMA PANTALLA

REANUDAR
=
RECONSTRUIR EL PUNTO DE TRABAJO
+
REVALIDAR EL ESTADO ACTUAL
+
COMPARAR CAMBIOS
+
CONTINUAR DE FORMA SEGURA
```

---

#### 2. Continuidad lógica

```text
OPERACIÓN DEGRADADA, COLAS Y RESULTADOS DESCONOCIDOS
UX-BASE-013
        ↓
CHECKPOINT, VALIDACIÓN Y PUNTO SEGURO DE RETORNO
UX-BASE-014
        ↓
VALIDACIÓN DEL LENGUAJE Y COMPRENSIÓN REAL
UX-BASE-015
```

`UX-BASE-013` determina qué puede quedar local, en cola, confirmado o en
conciliación. Esta tarea determina cómo retomar el trabajo después de una pausa,
cambio de sesión, pérdida de energía, navegación, handoff, conflicto o recuperación
técnica.

---

#### 3. Decisión principal

Toda reanudación seguirá esta secuencia:

```text
IDENTIFICAR ACTOR Y DISPOSITIVO
→ RESOLVER ACCESS CONTEXT NUEVO
→ LOCALIZAR TAREA Y RECURSO AUTORITATIVOS
→ LOCALIZAR CHECKPOINT Y BORRADORES
→ CONSULTAR RECEIPTS Y OPERACIONES PENDIENTES
→ COMPARAR VERSIONES, CLAIM Y CUSTODIA
→ CLASIFICAR EL ESTADO DE REANUDACIÓN
→ MOSTRAR RESUMEN HUMANO
→ CONTINUAR, REVISAR, REASIGNAR O CONCILIAR
```

Ningún campo autoritativo se restaurará desde una URL, cookie no firmada,
`localStorage`, estado React o selección visual sin revalidación de servidor.

---

#### 4. Taxonomía de interrupciones

Toda interrupción deberá clasificarse, como mínimo, en una de estas categorías:

```text
HUMAN_PAUSE
APP_BACKGROUND
NAVIGATION_AWAY
SESSION_EXPIRED
ACTOR_CHANGE
DEVICE_CHANGE
SITE_OR_AREA_CHANGE
SHIFT_OR_CHECKIN_CHANGE
CONNECTIVITY_LOSS
POWER_OR_RESTART
PERIPHERAL_FAILURE
DEPENDENCY_WAIT
HANDOFF
CONCURRENT_CHANGE
EMERGENCY
APPLICATION_UPDATE
UNKNOWN_INTERRUPTION
```

La categoría no determina por sí sola que el trabajo sea reanudable. Solo orienta
qué hechos deben comprobarse.

---

#### 5. Tres modos distintos

```text
PAUSA
→ el mismo actor conserva una tarea recuperable

HANDOFF
→ otro actor acepta explícitamente tarea o custodia

RECUPERACIÓN
→ existe conflicto, resultado desconocido, pérdida de contexto
  o inconsistencia que exige conciliación
```

Reglas:

```text
PAUSA
≠ HANDOFF

HANDOFF
≠ CAMBIO SILENCIOSO DE USUARIO

RECUPERACIÓN
≠ REINTENTAR TODO
```

---

#### 6. Checkpoint semántico

Un checkpoint será una referencia durable al punto lógico de trabajo, no una
copia completa de la interfaz.

```text
CHECKPOINT SEMÁNTICO
≠ URL
≠ HISTORIAL DEL NAVEGADOR
≠ SCREENSHOT
≠ ESTADO COMPLETO DEL COMPONENTE
≠ PERMISO CONGELADO
```

Forma conceptual:

```ts
type ProcessCheckpoint = {
  checkpoint_id: string;
  process_id: string;
  process_instance_id: string;
  task_id: string | null;
  process_step: string;
  owner_app_code: string;

  resource_refs: Array<{
    resource_type: string;
    resource_id: string;
    observed_version: string | null;
  }>;

  actor_id: string;
  principal_id: string | null;
  device_id: string | null;
  context_id_observed: string;
  site_id: string | null;
  area_id: string | null;
  shift_id: string | null;
  checkin_id: string | null;

  claim_id: string | null;
  custody_ref: string | null;
  draft_ref: string | null;
  pending_operation_ids: string[];
  evidence_refs: string[];

  created_at: string;
  last_updated_at: string;
  valid_until: string | null;
  resume_policy: string;
  sensitivity_class: string;
  schema_version: string;
};
```

La forma es documental. No autoriza tablas, tipos físicos ni almacenamiento.

---

#### 7. Qué debe conservar y qué no

El checkpoint podrá conservar referencias a:

- proceso, instancia y etapa;
- tarea;
- recurso y versión observada;
- actor y contexto originales;
- sede y área;
- claim o lease;
- custodia;
- borrador;
- operaciones locales o pendientes;
- evidencia;
- aplicación propietaria;
- momento y vigencia.

No conservará como autoridad:

- permisos ya concedidos;
- rol efectivo futuro;
- sesión válida indefinidamente;
- estado objetivo solicitado por el cliente;
- resultado empresarial no confirmado;
- secretos, PIN o tokens reutilizables;
- payloads sensibles innecesarios;
- una copia completa del recurso autoritativo.

---

#### 8. Estados de reanudación

```text
NO_CHECKPOINT
DRAFT_ONLY
CHECKPOINT_AVAILABLE
VALIDATING
RESUMABLE
RESUMABLE_WITH_REVIEW
WAITING_FOR_DEPENDENCY
HANDOFF_REQUIRED
REASSIGNMENT_REQUIRED
CONFLICT
RESULT_UNKNOWN
REAUTH_REQUIRED
RECONCILIATION_REQUIRED
SUPERSEDED
COMPLETED
EXPIRED
INVALID
```

La interfaz no mostrará un botón `Continuar` hasta terminar la clasificación.

---

#### 9. Reanudación directa

`RESUMABLE` solo procederá cuando se compruebe:

- mismo actor atribuible;
- sesión y dispositivo permitidos;
- contexto compatible;
- turno y check-in válidos cuando se exijan;
- tarea todavía abierta;
- recurso en versión compatible;
- claim o lease vigente o renovable;
- custodia compatible;
- ausencia de resultado desconocido;
- borrador compatible con el esquema actual;
- permiso exacto revalidado.

La aplicación abrirá el punto semántico y no la portada genérica.

Ejemplos:

```text
Continuar conteo de Congelados

Retomar recepción OC-2026-00418

Continuar lote de torta de chocolate
```

---

#### 10. Reanudación con revisión

`RESUMABLE_WITH_REVIEW` se utilizará cuando el trabajo pueda continuar, pero
cambió información relevante.

La interfaz deberá mostrar:

```text
DESDE TU PAUSA
- cambió el estado del recurso;
- se actualizaron dos líneas;
- tu borrador conserva tres observaciones;
- la tarea sigue asignada a ti;
- debes revisar las diferencias antes de confirmar.
```

Acciones posibles:

```text
COMPARAR CAMBIOS
APLICAR CAMPOS COMPATIBLES
DESCARTAR CAMPOS OBSOLETOS
CONTINUAR CON LA VERSIÓN ACTUAL
SOLICITAR REVISIÓN
```

Nunca se aplicará `last write wins` de forma silenciosa.

---

#### 11. Borrador frente a estado empresarial

```text
BORRADOR
→ trabajo todavía no confirmado

CHECKPOINT
→ referencia al punto de continuidad

OPERACIÓN PENDIENTE
→ intención ya preparada para sincronizar

RECEIPT
→ evidencia de que el servidor recibió o ejecutó

ESTADO EMPRESARIAL
→ verdad autoritativa del proceso
```

Estos objetos no se sustituirán entre sí.

Un borrador podrá recuperarse aunque la acción final ya no sea ejecutable. En
ese caso se conservará como evidencia, se permitirá copiar información segura o
se enviará a conciliación, pero no se aplicará automáticamente.

---

#### 12. Resultados desconocidos

Cuando una interrupción ocurra después de enviar una mutación:

```text
RESULTADO DESCONOCIDO
→ CONSULTAR IDEMPOTENCY KEY
→ CONSULTAR RECEIPT
→ CONSULTAR ESTADO DEL RECURSO
→ CLASIFICAR
```

Posibles resultados:

```text
CONFIRMADO
NO EJECUTADO Y REINTENTABLE
RECHAZADO
PARCIAL
CONFLICTO
SIN EVIDENCIA SUFICIENTE
```

Queda prohibido regenerar una nueva intención para “intentar de nuevo” antes de
resolver la intención original.

---

#### 13. Actor y cambio de trabajador

Un checkpoint pertenecerá al actor que produjo el trabajo, salvo handoff formal.

```text
CAMBIAR DE TRABAJADOR
≠ TRANSFERIR BORRADOR
≠ TRANSFERIR CLAIM
≠ TRANSFERIR CUSTODIA
```

Al cambiar de actor:

1. se detienen nuevas mutaciones del actor anterior;
2. se clasifica su trabajo como guardado, pendiente, confirmado o en conflicto;
3. se limpia información personal de la superficie;
4. el nuevo actor se identifica;
5. se resuelve un contexto nuevo;
6. el sistema ofrece solo tareas que pueda aceptar;
7. cualquier transferencia exige un handoff explícito.

---

#### 14. Handoff formal

Un handoff deberá conservar:

```text
QUIÉN ENTREGA
QUIÉN RECIBE
QUÉ TAREA O CUSTODIA
ESTADO Y VERSIÓN
EVIDENCIA
PENDIENTES
CONDICIONES
MOMENTO DE OFERTA
MOMENTO DE ACEPTACIÓN
```

Estados conceptuales:

```text
OFFERED
ACCEPTED
REJECTED
EXPIRED
CANCELLED
PARTIALLY_ACCEPTED
RECONCILIATION_REQUIRED
```

```text
HANDOFF OFRECIDO
≠ HANDOFF ACEPTADO
```

Hasta la aceptación, la responsabilidad no se atribuirá al receptor.

---

#### 15. Claims, leases y trabajo excluyente

Al reanudar una tarea con claim o lease, el sistema comprobará:

- propietario;
- recurso;
- etapa;
- vigencia;
- heartbeat cuando aplique;
- dispositivo;
- área;
- estado del proceso;
- posibilidad de renovar;
- política de takeover.

No podrá asumirse que un claim sigue vigente porque la pantalla permanece abierta.

Resultados posibles:

```text
CLAIM_VALID
CLAIM_RENEWED
CLAIM_EXPIRED_AVAILABLE
CLAIM_HELD_BY_OTHER
TAKEOVER_REQUIRES_APPROVAL
TASK_ALREADY_COMPLETED
CLAIM_CONFLICT
```

---

#### 16. Custodia física

La custodia no se deducirá de una pantalla ni de un borrador.

Si una remisión, activo, efectivo, lote o documento cambió físicamente de manos
durante la interrupción, la reanudación deberá:

- identificar la última custodia confirmada;
- registrar el hecho físico observado;
- comparar con el handoff digital;
- impedir dobles aceptaciones;
- separar actor físico, transcriptor y aprobador;
- enviar inconsistencias a conciliación.

---

#### 17. Cambio de contexto

Toda variación en:

- sede;
- área;
- turno;
- check-in;
- rol operativo;
- delegación;
- simulación;
- dispositivo;

obliga a resolver un `AccessContext` nuevo.

```text
CONTEXTO NUEVO COMPATIBLE
→ reanudar después de reautorizar

CONTEXTO NUEVO INCOMPATIBLE
→ bloquear, reasignar o hacer handoff
```

La sede primaria, último turno o selector visual no se utilizarán como fallback.

---

#### 18. Cambio de versión del recurso

La comparación deberá distinguir:

```text
SIN CAMBIOS
CAMBIOS NO SUPERPUESTOS
CAMBIOS SUPERPUESTOS
RECURSO CERRADO
RECURSO CANCELADO
RECURSO REEMPLAZADO
ESQUEMA INCOMPATIBLE
```

Política:

- cambios no superpuestos podrán reaplicarse con revisión;
- cambios superpuestos exigirán comparación;
- un recurso cerrado no se reabrirá por restaurar el navegador;
- un recurso reemplazado dirigirá al nuevo recurso vinculado;
- un esquema incompatible conservará el borrador original y exigirá migración o soporte.

---

#### 19. Reinicio, suspensión y actualización

Los checkpoints recuperables podrán sobrevivir, según política:

- recarga;
- cierre accidental;
- suspensión del dispositivo;
- reinicio;
- pérdida breve de energía;
- actualización compatible de la aplicación.

Al volver:

```text
NO EJECUTAR EN SEGUNDO PLANO AUTOMÁTICAMENTE
NO RESTAURAR AUTORIDAD OBSOLETA
NO MOSTRAR DATOS DEL ACTOR ANTERIOR
```

Primero se validarán actor, sesión, aplicación, esquema, dispositivo, red,
pendientes y cancelaciones.

---

#### 20. Continuidad entre dispositivos

Un trabajador podrá continuar en otro dispositivo solo cuando:

- el checkpoint esté sincronizado o exista una transferencia segura;
- el nuevo dispositivo admita la aplicación y capacidad;
- el actor vuelva a identificarse;
- el contexto sea compatible;
- los datos sensibles puedan mostrarse;
- el claim permita mover o renovar la sesión;
- no exista trabajo local exclusivo sin sincronizar en el equipo anterior.

Si existe un borrador solo local, la interfaz no prometerá que está disponible en
otro equipo.

---

#### 21. Continuidad entre aplicaciones

```text
APLICACIÓN A
→ CHECKPOINT SEMÁNTICO
→ DEEP LINK OPACO
→ APLICACIÓN PROPIETARIA B
→ REVALIDACIÓN
→ CONTINUACIÓN
→ RETORNO O SIGUIENTE PASO
```

El enlace podrá transportar identificadores opacos de proceso, tarea, recurso y
retorno. No transportará autoridad, permiso, actor autoritativo ni estado objetivo.

---

#### 22. POS multiárea de FOGO

Para los computadores del primer piso del Centro de Producción:

```text
REPOSTERÍA
≠ PASTELERÍA Y TORTAS
```

Cada checkpoint conservará:

- área propietaria;
- receta y versión;
- lote;
- tarea;
- actor;
- dispositivo;
- cantidades y controles registrados;
- evidencia;
- pendientes de sincronización.

Al cambiar de área:

1. se guarda o descarta conscientemente el trabajo actual;
2. se liberan o transfieren claims según política;
3. se resuelve contexto nuevo;
4. se carga la bandeja del área seleccionada;
5. no se mezclan borradores, recetarios ni lotes.

Una bandeja conjunta podrá mostrar ambos grupos, pero abrir una tarea siempre
activará y mostrará el área exacta antes de registrar producción.

---

#### 23. Tareas repetitivas y lotes

En una secuencia de elementos, el checkpoint distinguirá:

```text
ELEMENTOS CONFIRMADOS
ELEMENTO ACTUAL
ELEMENTOS PENDIENTES
ELEMENTOS FALLIDOS
ELEMENTOS EN CONFLICTO
```

Al retomar:

- no se repetirán los confirmados;
- el elemento actual se consultará por idempotencia y receipt;
- los pendientes se recalcularán;
- los incompatibles saldrán del lote;
- el resumen indicará qué cambió.

---

#### 24. Acciones sensibles y administrativas

No se reanudarán directamente después de sesión vencida o cambio de dispositivo:

- aprobaciones;
- anulaciones y reversas;
- pagos o reembolsos;
- cambios de permisos;
- publicación de recetas, horarios, precios o configuración;
- exportaciones sensibles;
- overrides;
- lotes administrativos materiales.

Podrá restaurarse el trabajo preparatorio, pero la acción final exigirá
reautorización, resumen actualizado y confirmación proporcional al riesgo.

---

#### 25. Excepciones

Un caso excepcional interrumpido conservará por separado:

- solicitud;
- aprobación;
- ejecución;
- conciliación;
- cierre.

```text
APROBACIÓN EXISTENTE
≠ EJECUCIÓN PENDIENTE AUTORIZADA INDEFINIDAMENTE
```

Al retomar se comprobarán vigencia, alcance, aprobador, recurso, versión y usos
previos. Un override expirado no reaparecerá como disponible.

---

#### 26. Dependencias y esperas largas

Una tarea en espera podrá generar un checkpoint sin ocupar permanentemente la
pantalla.

La reanudación deberá mostrar:

- evento esperado;
- responsable actual;
- última actualización;
- vencimiento;
- si la dependencia ocurrió;
- si la tarea fue reasignada;
- siguiente acción segura.

Una notificación no sustituye la aceptación ni prueba que el estado siga vigente.

---

#### 27. Archivos, evidencia y periféricos

Al retomar se distinguirán:

```text
ARCHIVO SOLO LOCAL
ARCHIVO SUBIDO SIN VINCULAR
ARCHIVO VINCULADO Y CONFIRMADO
COMANDO DE IMPRESIÓN ENVIADO
IMPRESIÓN CONFIRMADA
RESULTADO DE PERIFÉRICO DESCONOCIDO
```

No se cerrará el proceso por encontrar un archivo local o un comando enviado.
Los efectos físicos y digitales se conciliarán por separado.

---

#### 28. Superficie de reanudación

La interfaz deberá ofrecer un resumen como:

```text
Tarea interrumpida

Recepción OC-2026-00418
Vento Café · Recepción
Último avance: 14:32

Guardado:
- 8 cantidades confirmadas
- 2 observaciones en borrador

Cambió desde entonces:
- el proveedor actualizó una línea

[Comparar y continuar]
[Guardar para después]
[Descartar borrador]
```

No se limitará a:

```text
¿Deseas restaurar la sesión anterior?
```

---

#### 29. Prioridad de elementos al volver

Después de identificar al actor, la pantalla inicial priorizará:

```text
1. RESULTADOS DESCONOCIDOS O CONCILIACIONES
2. CUSTODIAS Y HANDOFFS PENDIENTES
3. TAREAS CON CLAIM VIGENTE
4. BORRADORES RECUPERABLES
5. TAREAS PRÓXIMAS A VENCER
6. COLA ORDINARIA
```

No se abrirá automáticamente una tarea sensible sin que el actor vea el contexto
y el resumen de cambios.

---

#### 30. Accesibilidad

La experiencia de reanudación:

- anunciará la existencia de trabajo recuperable;
- explicará qué se guardó y qué cambió;
- mantendrá foco lógico después de actualizar;
- funcionará con teclado, tacto y lector de pantalla;
- no dependerá de color, hover o gestos ocultos;
- permitirá revisar conflictos sin límite de tiempo arbitrario;
- evitará modales repetitivos en cada navegación;
- conservará una ruta clara para posponer o descartar.

---

#### 31. Privacidad y dispositivos compartidos

En dispositivos compartidos:

- la pantalla bloqueada no mostrará detalles sensibles del checkpoint;
- el trabajo del actor anterior no aparecerá al nuevo trabajador;
- la lista de reanudación se filtrará después de identificar al actor;
- los borradores locales estarán cifrados o protegidos según la arquitectura futura;
- logout, revocación y retención podrán volver un checkpoint no recuperable;
- soporte técnico no verá contenido empresarial completo por defecto.

---

#### 32. Retención y limpieza

Todo checkpoint tendrá política de:

```text
VIGENCIA
RETENCIÓN
EXPIRACIÓN
CANCELACIÓN
SUPERSESIÓN
BORRADO SEGURO
PRESERVACIÓN POR AUDITORÍA
```

No se acumularán indefinidamente borradores antiguos en kioscos o navegadores.
La limpieza no eliminará evidencia requerida ni operaciones todavía pendientes.

---

#### 33. Telemetría y soporte

Se registrarán, sin usar texto visible como identificador primario:

- `checkpoint_id`;
- proceso y etapa;
- categoría de interrupción;
- estado de reanudación;
- tiempo hasta retomar;
- resultado;
- conflicto;
- campos recuperados o descartados;
- cambio de actor, dispositivo o área;
- referencia de soporte;
- versión del contrato.

Métricas útiles:

```text
TASA DE REANUDACIÓN EXITOSA
PÉRDIDA DE BORRADORES
TIEMPO DE RECUPERACIÓN
CONFLICTOS POR VERSIÓN
HANDOFFS NO ACEPTADOS
RESULTADOS DESCONOCIDOS RESUELTOS
REPETICIONES EVITADAS POR IDEMPOTENCIA
```

No se utilizarán para sancionar pausas legítimas ni comparar velocidad individual
sin contexto operativo.

---

#### 34. Pruebas obligatorias

Se deberán probar, según aplique:

- recarga y cierre accidental;
- app en background;
- reinicio y pérdida de energía;
- sesión expirada;
- logout y revocación;
- cambio de actor;
- cambio de área;
- cambio de dispositivo;
- claim vencido o tomado por otro;
- recurso modificado, cerrado o reemplazado;
- resultado desconocido;
- borrador con esquema anterior;
- actualización de aplicación;
- archivo solo local;
- periférico con resultado incierto;
- handoff ofrecido, aceptado, rechazado y vencido;
- custodia física sin confirmación digital;
- lote parcial;
- dos dispositivos intentando retomar;
- contingencia manual;
- accesibilidad y privacidad en dispositivo compartido.

---

#### 35. Propiedad de decisiones posteriores

| Decisión                                   | Tarea propietaria                                                                                                                                             |
| ------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| identidad, contexto y reautorización       | `AUTH-CTX-*`; `AUTH-SRV-*`; `AUTH-DB-*`                                                                                                                       |
| sesiones y cambio de actor en dispositivos | `AUTH-DEV-007` a `AUTH-DEV-016`; `UX-STATION-004`                                                                                                             |
| superficie contextual de reanudación       | `UX-STATION-005`; `UX-STATION-010` a `UX-STATION-012`                                                                                                         |
| conectividad, outbox y reconciliación      | `UX-BASE-013`; `NFR-REQ-004`; `QUEUE-ARC-001` a `QUEUE-ARC-012`                                                                                               |
| claims, leases, tareas y handoffs          | `QUEUE-ARC-001` a `QUEUE-ARC-012`; `INT-APP-001` a `INT-APP-010`; `PROC-SCREEN-001` a `PROC-SCREEN-028`; subbloques UX y AUTH propietarios de cada aplicación |
| deep links y continuidad cross-app         | `INT-APP-001` a `INT-APP-010`; `AUTH-UI-001` a `AUTH-UI-060`                                                                                                  |
| retención, evidencia y privacidad          | `EVID-ARC-001` a `EVID-ARC-010`; `NFR-REQ-005`; `NFR-REQ-006`; `NFR-REQ-010`                                                                                  |
| comportamiento por producto                | subbloques UX y AUTH de cada aplicación                                                                                                                       |
| POS multiárea y FOGO                       | `UX-STATION-002` a `UX-STATION-012`; `FOGO-UX-002` a `FOGO-UX-015`; `FOGO-AUTH-002`, `003`, `013` y `016`                                                     |
| validación con trabajadores                | `UX-STATION-008`; `UX-QA-001` a `UX-QA-030`                                                                                                                   |

La arquitectura concreta de claims, leases y handoffs deberá materializarse en las tareas canónicas ya asignadas en la tabla anterior. Si durante E3 se detecta una brecha no cubierta, deberá vincularse en ese mismo momento a una tarea existente o generar una tarea explícita antes de implementar; no se autoriza dejarla como decisión narrativa ni inventar identificadores en código.

---

#### 36. Migración de comportamiento existente

Se inventariarán:

- formularios que desaparecen al navegar;
- restauraciones basadas en URL;
- borradores sin actor o recurso;
- modales genéricos de restaurar sesión;
- claims sin expiración;
- tareas retomadas por otro usuario;
- acciones reenviadas después de timeout;
- datos personales visibles tras logout;
- pestañas que compiten sobre el mismo recurso;
- deep links que restauran autoridad;
- borradores incompatibles después de actualización;
- dispositivos compartidos que mezclan áreas;
- cierres que eliminan evidencia recuperable.

Clasificación:

```text
CONFORME
REQUIERE_CHECKPOINT
REQUIERE_BORRADOR_DURABLE
REQUIERE_REAUTORIZACIÓN
REQUIERE_COMPARACIÓN
REQUIERE_HANDOFF
REQUIERE_CLAIM
REQUIERE_CONCILIACIÓN
NO_REANUDABLE
LEGACY
CANDIDATA_A_RETIRO
```

---

#### 37. Requisitos de prueba derivados

Se crean:

```text
TREQ-UX-274 a TREQ-UX-296
```

Cobertura resumida:

1. checkpoint semántico;
2. taxonomía de interrupciones;
3. algoritmo de reanudación;
4. estados visibles;
5. reanudación directa;
6. revisión y comparación;
7. borradores y receipts;
8. resultado desconocido;
9. cambio de actor;
10. handoffs;
11. claims y leases;
12. custodia;
13. cambio de contexto;
14. versiones y conflictos;
15. reinicio y actualización;
16. continuidad entre dispositivos;
17. continuidad entre aplicaciones;
18. POS multiárea FOGO;
19. lotes y tareas repetitivas;
20. acciones sensibles y excepciones;
21. dependencias, archivos y periféricos;
22. accesibilidad, privacidad y retención;
23. pruebas, telemetría y migración.

---

#### 38. Criterios de aceptación

- [ ] Reanudar no depende de la última URL ni del estado del componente.
- [ ] Existe un checkpoint semántico versionado y limitado.
- [ ] Se distinguen pausa, handoff y recuperación.
- [ ] La reanudación resuelve actor, contexto, recurso, versión, claim y custodia.
- [ ] No se muestra `Continuar` antes de clasificar el estado.
- [ ] Los cambios concurrentes se comparan sin `last write wins`.
- [ ] Borrador, checkpoint, operación pendiente, receipt y estado empresarial permanecen separados.
- [ ] Los resultados desconocidos se consultan antes de reintentar.
- [ ] El cambio de trabajador no transfiere trabajo ni autoridad implícitamente.
- [ ] Todo handoff exige oferta y aceptación trazables.
- [ ] Claims y leases se revalidan y no se presumen vigentes.
- [ ] La custodia física se concilia con la digital.
- [ ] Los cambios de sede, área, turno, rol o dispositivo crean contexto nuevo.
- [ ] Reinicio y actualización no restauran autoridad obsoleta.
- [ ] La continuidad entre dispositivos exige sincronización o transferencia segura.
- [ ] Los deep links no transportan autorización.
- [ ] Los POS multiárea conservan checkpoints por área, receta, lote y actor.
- [ ] Las tareas repetitivas no repiten elementos confirmados.
- [ ] Las acciones sensibles exigen reautorización y resumen actualizado.
- [ ] Se protegen accesibilidad, privacidad, retención y soporte.
- [ ] Todas las decisiones diferidas tienen propietario documental.
- [ ] Se crean `TREQ-UX-274` a `TREQ-UX-296`.
- [ ] No se implementa código, almacenamiento, migraciones ni cambios en Supabase.
- [ ] `UX-BASE-015` permanece sin iniciar.

---

#### 39. Estado y continuidad

```text
UX-BASE-013 APROBADA
UX-BASE-014 APROBADA
UX-BASE-015 NO INICIADA
```

No se inicia `UX-BASE-015` hasta la aprobación expresa de esta tarea.


### ✅ UX-BASE-015 — Validar terminología con trabajadores reales

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `UX-BASE-014 — Definir reanudación del proceso después de interrupciones` — APROBADA  
**Siguiente tarea reservada:** `NFR-REQ-001 — Definir criticidad y disponibilidad por proceso`  
**Artefactos producidos:** `UX-TERMINOLOGY-VALIDATION-CONTRACT-001`; estructura inicial de `UX-TERMINOLOGY-REGISTER-001`  
**Versión del estándar transversal:** `TERMINOLOGY-VALIDATION-1.0.0`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069` y procesos futuros incorporados al catálogo canónico  
**Aplicaciones cubiertas:** SHELL, ANIMA, NEXO, FOGO, ORIGO, PULSO, VISO, NUMERA, TALENTO, PASS, AURA y aplicaciones futuras de Vento OS  
**Naturaleza:** gobierno semántico, lenguaje de interfaz, validación contextual, accesibilidad, consistencia cross-app, métricas, cambios y migración  
**Cambios en código, traducciones, pantallas, Supabase, migraciones, roles o permisos:** no autorizados

---

#### 1. Propósito

Definir cómo Vento OS deberá seleccionar, probar, aprobar, versionar y mantener la
terminología que ven trabajadores, responsables, administradores, clientes y
otros actores, de forma que las palabras utilizadas:

1. representen correctamente el concepto empresarial;
2. sean comprendidas por el actor que debe actuar;
3. permitan predecir qué ocurrirá antes de pulsar una acción;
4. conserven el mismo significado entre aplicaciones;
5. no expongan nombres técnicos, códigos, permisos ni estructuras internas;
6. no dependan de una capacitación para compensar una interfaz ambigua;
7. puedan adaptarse a variantes locales sin fragmentar el modelo canónico.

Regla central:

```text
TERMINOLOGÍA APROBADA
≠ PALABRA PREFERIDA POR DISEÑO
≠ TEXTO ESCRITO POR DESARROLLO
≠ TÉRMINO CONOCIDO SOLO POR GERENCIA

TERMINOLOGÍA APROBADA
=
CONCEPTO SEMÁNTICO ESTABLE
+
ETIQUETA ADECUADA AL ACTOR Y CONTEXTO
+
COMPRENSIÓN DEMOSTRADA EN UNA TAREA REALISTA
+
EVIDENCIA VERSIONADA
```

---

#### 2. Continuidad lógica

```text
PRINCIPIOS DE EXPERIENCIA
UX-BASE-001 a UX-BASE-014
        ↓
VALIDACIÓN DEL LENGUAJE QUE LOS MATERIALIZA
UX-BASE-015
        ↓
CRITICIDAD, DISPONIBILIDAD Y REQUISITOS NO FUNCIONALES
NFR-REQ-001 a NFR-REQ-011
```

`UX-BASE-015` cierra la serie `UX-BASE-*`, pero no declara cerrada toda la
experiencia de E2. La terminología deberá aplicarse y volver a validarse durante
el diseño de estaciones, prototipos, pantallas y subbloques UX de cada producto.

---

#### 3. Decisión principal

Toda palabra o frase visible que pueda afectar comprensión, decisión o ejecución
seguirá este ciclo:

```text
IDENTIFICAR EL CONCEPTO
→ DEFINIR SU SIGNIFICADO Y LÍMITES
→ INVENTARIAR ETIQUETAS ACTUALES
→ PROPONER ETIQUETA POR AUDIENCIA
→ PROBARLA EN UNA TAREA CONTEXTUAL
→ OBSERVAR INTERPRETACIÓN Y CONDUCTA
→ CLASIFICAR HALLAZGOS
→ CORREGIR Y REPROBAR
→ APROBAR CON EVIDENCIA
→ VERSIONAR Y MONITOREAR
```

No se congelará una etiqueta porque “suena bien”, porque aparece en la base de
datos o porque una persona responsable la usa habitualmente.

---

#### 4. Qué significa validar

Validar un término significa demostrar que un trabajador representativo puede:

- explicar con sus propias palabras qué significa;
- distinguirlo de conceptos cercanos;
- predecir el efecto de una acción;
- encontrarlo en el momento correcto;
- completar la tarea sin instrucciones adicionales;
- reconocer el estado posterior;
- detectar cuándo no debe continuar.

No equivale a:

- preguntar si le gusta la palabra;
- mostrar la definición antes de probar;
- entrenar y después medir memoria;
- obtener aprobación exclusiva de gerencia;
- contar clics sin verificar comprensión;
- asumir que una persona silenciosa entendió.

---

#### 5. Arquitectura semántica

Se separarán cinco capas:

```text
CONCEPTO EMPRESARIAL
→ significado canónico

IDENTIFICADOR SEMÁNTICO
→ clave estable no visible

ETIQUETA POR AUDIENCIA
→ texto que comprende el actor

ALIAS RECONOCIDO
→ variante aceptada para búsqueda, ayuda o transición

IDENTIFICADOR TÉCNICO
→ código, permiso, tabla, enum, RPC o evento
```

Ejemplo conceptual:

```text
CONCEPTO: ubicación física controlada de inventario
SEMANTIC_ID: inventory.location
ETIQUETA CANDIDATA: Ubicación de inventario
ALIAS POSIBLE: Estante; Zona; Nevera
TÉRMINO TÉCNICO: LOC
```

`LOC` podrá conservarse internamente, pero no se declarará etiqueta operativa
válida hasta demostrar que el actor realmente la comprende y la necesita.

---

#### 6. Registro canónico de terminología

`UX-TERMINOLOGY-REGISTER-001` tendrá, como mínimo:

| Campo                   | Propósito                                            |
| ----------------------- | ---------------------------------------------------- |
| `concept_id`            | Identidad semántica estable                          |
| `domain_owner`          | Proceso o aplicación propietaria                     |
| `definition`            | Significado y límites                                |
| `examples`              | Casos incluidos                                      |
| `counterexamples`       | Casos que no pertenecen al concepto                  |
| `technical_identifiers` | Códigos internos relacionados                        |
| `worker_label`          | Etiqueta operativa validada                          |
| `admin_label`           | Etiqueta administrativa cuando difiera legítimamente |
| `short_label`           | Variante compacta autorizada                         |
| `accepted_aliases`      | Variantes reconocidas sin crear conceptos nuevos     |
| `prohibited_terms`      | Palabras ambiguas, técnicas o peligrosas             |
| `audiences`             | Actores para los que aplica                          |
| `contexts`              | Procesos, pasos, sedes, áreas y dispositivos         |
| `locale`                | Variante lingüística aplicable                       |
| `status`                | Estado de validación                                 |
| `validation_evidence`   | Sesiones, resultados y fecha                         |
| `owner`                 | Responsable de cambio                                |
| `version`               | Versión semántica y de etiqueta                      |
| `affected_surfaces`     | Pantallas, documentos, impresos y notificaciones     |
| `revalidation_trigger`  | Condiciones que obligan a probar otra vez            |

El registro no sustituye catálogos de permisos, estados o procesos; los referencia.

---

#### 7. Estados de un término

```text
DISCOVERED
CANDIDATE
PROVISIONAL
IN_VALIDATION
VALIDATED
VALIDATED_WITH_CONTEXT
REJECTED
DEPRECATED
REVALIDATION_REQUIRED
```

Reglas:

- `DISCOVERED`: texto existente aún no evaluado;
- `CANDIDATE`: propuesta con concepto definido;
- `PROVISIONAL`: puede usarse en prototipo, no como estándar definitivo;
- `IN_VALIDATION`: campaña activa;
- `VALIDATED`: comprensión demostrada para las audiencias declaradas;
- `VALIDATED_WITH_CONTEXT`: válido solo en contextos explícitos;
- `REJECTED`: produjo ambigüedad o riesgo;
- `DEPRECATED`: se conserva solo por transición;
- `REVALIDATION_REQUIRED`: cambió proceso, audiencia, dispositivo o significado.

```text
VALIDADO EN UNA PANTALLA
≠ VALIDADO EN TODO EL ECOSISTEMA
```

---

#### 8. Inventario de superficies

Se inventariará terminología en:

- navegación;
- títulos y subtítulos;
- botones y menús;
- campos, unidades y placeholders;
- estados y transiciones;
- errores, bloqueos y recuperación;
- notificaciones;
- impresos, etiquetas y comprobantes;
- kioscos, tablets y POS;
- tablas, reportes y exportaciones;
- documentos de soporte y capacitación;
- mensajes enviados a clientes o terceros;
- expresiones verbales utilizadas en el proceso real.

La auditoría agrupará textos por concepto, no solo por coincidencia literal.

---

#### 9. Cobertura de participantes

La validación no podrá realizarse únicamente con propietarios, gerencia,
desarrollo o personal administrativo.

La matriz incluirá, según el término:

- actor que ejecuta;
- actor que supervisa;
- actor que recibe un handoff;
- personal nuevo y experimentado;
- personas con distinta familiaridad digital;
- turnos y condiciones de pico;
- sedes o áreas con variantes operativas;
- usuarios de dispositivo personal y compartido;
- necesidades de accesibilidad relevantes.

Para términos transversales se cubrirán al menos dos contextos operativos
materialmente distintos. Para términos propios de una sola área se probarán con
personas reales de esa área.

---

#### 10. Evidencia mínima por riesgo

| Riesgo  | Evidencia mínima inicial                                                                              |
| ------- | ----------------------------------------------------------------------------------------------------- |
| crítico | todos los participantes representativos ejecutan correctamente; cero interpretación peligrosa         |
| alto    | al menos cinco participantes relevantes, dos niveles de experiencia y ningún patrón de error material |
| medio   | al menos tres participantes relevantes y comprensión consistente                                      |
| bajo    | revisión contextual y prueba dentro del prototipo correspondiente                                     |

Un resultado porcentual no compensará un fallo crítico aislado relacionado con:

- seguridad;
- dinero;
- inventario;
- custodia;
- alérgenos o calidad;
- privacidad;
- permisos;
- acciones irreversibles.

---

#### 11. Entorno de prueba

La prueba se ejecutará, según aplicabilidad, con:

- prototipo o pantalla suficientemente realista;
- dispositivo y tamaño objetivo;
- postura y montaje reales;
- ruido, iluminación, guantes o manos ocupadas;
- datos realistas no sensibles;
- secuencia completa, no una palabra aislada;
- escenario ordinario y al menos un bloqueo o diferencia;
- participantes sin haber recibido la respuesta.

Las pruebas de los POS multiárea se harán físicamente en el Centro de Producción
y deberán incluir cambio de área, receta, lote, actor e interrupción.

---

#### 12. Protocolo de sesión

Cada sesión seguirá una guía controlada:

1. explicar el objetivo sin definir los términos evaluados;
2. presentar una situación realista;
3. pedir a la persona que indique qué haría;
4. solicitar que explique lo que entiende;
5. observar acción, dudas, retrocesos y lenguaje espontáneo;
6. introducir una diferencia, bloqueo o cambio de estado;
7. verificar si distingue acciones ordinarias y excepcionales;
8. registrar resultado sin culpar ni corregir durante la tarea;
9. realizar preguntas posteriores;
10. comparar resultados por actor, sede, área y experiencia.

---

#### 13. Preguntas permitidas

Ejemplos:

```text
¿Qué crees que significa esto?

¿Qué pasaría si pulsas este botón?

Muéstrame cómo registrarías lo que recibiste.

¿Cómo sabrías que ya quedó confirmado?

¿Qué diferencia ves entre estos dos estados?

¿Con qué palabra llamas normalmente a esto en tu área?
```

No se preguntará primero:

```text
¿Entiendes?

¿Te parece claro?

¿Te gusta más A o B?

¿Sabes que LOC significa ubicación?
```

Estas preguntas inducen respuestas positivas o enseñan el término antes de medir.

---

#### 14. Técnicas de validación

Se utilizarán de forma combinada:

- comprensión espontánea;
- `teach-back` o explicación con palabras propias;
- predicción del efecto;
- selección de acción;
- clasificación de conceptos cercanos;
- búsqueda de una tarea;
- ordenamiento de estados;
- detección de información crítica;
- comparación de dos etiquetas candidatas dentro de una tarea;
- observación del vocabulario que la persona usa naturalmente.

No se aprobará una palabra solo mediante encuesta de preferencia.

---

#### 15. Métricas

Se registrarán:

- comprensión correcta;
- acción correcta al primer intento;
- predicción correcta del efecto;
- tiempo hasta decidir;
- dudas verbalizadas;
- retrocesos;
- ayuda requerida;
- confusión con otro concepto;
- interpretación peligrosa;
- confianza declarada después de actuar;
- término espontáneo utilizado;
- diferencias por actor, sede, área o experiencia.

Las métricas no se utilizarán para evaluar rendimiento individual del trabajador.

---

#### 16. Criterios iniciales de aprobación

| Elemento           | Criterio                                                                                |
| ------------------ | --------------------------------------------------------------------------------------- |
| acción crítica     | cero interpretación peligrosa y ejecución correcta por todos los participantes críticos |
| CTA frecuente      | al menos 90 % de elección correcta al primer intento y sin patrón de error por grupo    |
| estado operativo   | al menos 90 % distingue estado actual, siguiente acción y cierre                        |
| detalle secundario | al menos 80 % comprende o puede recuperarse mediante ayuda contextual                   |
| término contextual | evidencia separada para cada contexto declarado                                         |

Una muestra pequeña se evaluará además cualitativamente. Un porcentaje no se
presentará como precisión estadística si la muestra no lo permite.

---

#### 17. Severidad de hallazgos

```text
S0_CRITICAL
S1_HIGH
S2_MEDIUM
S3_LOW
OBSERVATION
```

- `S0_CRITICAL`: puede causar daño, pérdida, exposición o efecto irreversible;
- `S1_HIGH`: provoca una acción incorrecta o bloqueo frecuente;
- `S2_MEDIUM`: requiere ayuda o genera retraso considerable;
- `S3_LOW`: fricción menor y recuperable;
- `OBSERVATION`: variante de lenguaje sin impacto demostrado.

Todo `S0` o `S1` bloquea la validación del término afectado.

---

#### 18. Acciones y botones

Los CTA se validarán por el efecto que la persona predice, no por su longitud.

```text
Confirmar
```

será insuficiente cuando no indique qué se confirma.

Etiquetas candidatas deberán expresar objeto o efecto, por ejemplo:

```text
Confirmar cantidades recibidas

Iniciar preparación

Entregar custodia al conductor

Guardar como borrador
```

Las palabras definitivas dependerán de la prueba contextual.

---

#### 19. Estados y transiciones

Cada estado deberá permitir responder:

1. qué ocurrió;
2. quién debe actuar;
3. qué puede hacerse ahora;
4. si el efecto está confirmado;
5. qué falta para cerrar.

Los enums internos no se mostrarán directamente:

```text
ready_for_transport
in_transit
partial
stale
reconciliation_required
```

Podrán mapearse a etiquetas humanas distintas, siempre conservando un único
significado semántico y una transición inequívoca.

---

#### 20. Cantidades, unidades y presentaciones

Se probarán conjuntamente:

```text
VALOR
+
UNIDAD
+
PRESENTACIÓN
+
ACCIÓN
+
EFECTO
```

Ejemplos de confusión que deben detectarse:

- paquete frente a unidad;
- gramos frente a kilogramos;
- solicitado frente a recibido;
- rendimiento esperado frente a real;
- cantidad preparada frente a cargada;
- cero frente a vacío o no observado.

La terminología nunca deberá ocultar una conversión o cambiar la unidad sin
confirmación visible.

---

#### 21. Actor, rol y contexto

Se validarán de forma separada:

```text
ROL BASE
ROL OPERATIVO
ÁREA ASIGNADA
ÁREA ACTIVA
SEDE
TURNO
CHECK-IN
SIMULACIÓN
DELEGACIÓN
```

Nombres internos como `navigation_role`, `effective_role`, `checkin_id` o
`territory_scope` no serán etiquetas de trabajador.

La persona deberá poder identificar bajo qué sede, área, turno y función está
actuando sin interpretar códigos.

---

#### 22. Bloqueos, conectividad y recuperación

Los mensajes deberán permitir distinguir:

- no autorizado;
- falta de turno o identificación;
- espera normal;
- conflicto;
- fallo técnico;
- guardado local;
- pendiente de sincronizar;
- confirmado por el servidor;
- resultado desconocido;
- conciliación requerida.

```text
Ocurrió un error
```

no se considerará terminología suficiente.

Las pruebas verificarán que el trabajador comprenda qué quedó guardado, qué no
debe repetir y cuál es el siguiente paso seguro.

---

#### 23. Términos técnicos y abreviaturas

Se inventariarán, entre otros:

```text
LOC
LPN
RPC
RLS
claim
lease
override
receipt
stale
payload
batch
check-in
```

Tratamiento posible:

- mantener solo en código;
- traducir a una expresión humana;
- explicar dentro de ayuda contextual;
- conservar como término profesional validado;
- retirar de la superficie.

Que un término sea estándar técnico no demuestra que sea adecuado para operación.

---

#### 24. Alias y variantes locales

Una misma cosa puede recibir nombres cotidianos distintos entre áreas. El sistema
podrá reconocer alias para:

- búsqueda;
- ayuda;
- transición desde lenguaje anterior;
- capacitación;
- dictado o captura asistida.

Pero:

```text
ALIAS LOCAL
≠ CONCEPTO NUEVO
≠ ESTADO NUEVO
≠ PERMISO NUEVO
```

Cuando dos palabras representen hechos realmente distintos, deberán permanecer
separadas aunque los trabajadores las usen indistintamente.

---

#### 25. Consistencia entre aplicaciones

La aplicación propietaria del concepto definirá su significado. Las aplicaciones
consumidoras podrán adaptar la longitud o explicar el término, pero no cambiar su
semántica.

Ejemplo:

```text
FOGO origina el lote de producción
NEXO consume su identidad logística
NUMERA consume su efecto de costo
```

Las tres aplicaciones no podrán utilizar la misma palabra para hechos diferentes
ni crear copias semánticas independientes.

---

#### 26. Experiencia operativa y administrativa

Podrán existir etiquetas diferenciadas cuando la tarea lo exija:

```text
OPERACIÓN
→ lenguaje de acción, objeto y siguiente paso

ADMINISTRACIÓN
→ lenguaje de análisis, configuración y gobierno
```

La diferencia deberá estar registrada y validada. No se permitirá usar jerga
administrativa en un kiosco solo porque el concepto provenga de una tabla maestra.

---

#### 27. POS multiárea del Centro de Producción

Los computadores compartidos podrán mostrar:

```text
Repostería
Pastelería y Tortas
```

como áreas separadas y visibles.

La validación deberá comprobar que los trabajadores:

- distinguen el área activa;
- identifican a qué área pertenece cada tarea;
- no confunden un recetario conjunto con una autorización global;
- entienden qué ocurre al cambiar de área;
- reconocen que un borrador, lote o receta permanece en su área propietaria.

Si en la operación real se utiliza otra denominación para `Pastelería y Tortas`,
se registrará como candidata y se probará antes de modificar el nombre canónico o
la etiqueta visible.

---

#### 28. Candidatos iniciales por producto

Estos ejemplos son **candidatos para probar**, no palabras aprobadas:

| Producto    | Identificador o término técnico | Candidato humano                                          |
| ----------- | ------------------------------- | --------------------------------------------------------- |
| NEXO        | `LOC`                           | Ubicación de inventario                                   |
| NEXO        | `LPN`                           | Contenedor, canasta o caja identificada según objeto real |
| FOGO        | `batch`                         | Lote de producción                                        |
| FOGO        | recipe version                  | Versión vigente de la receta                              |
| ORIGO       | purchase reception              | Recibir compra                                            |
| ANIMA       | check-in                        | Registrar entrada o iniciar jornada                       |
| SHELL       | active context                  | Sede, área y función activas                              |
| transversal | claim                           | Tarea tomada por otra persona                             |
| transversal | receipt                         | Confirmación del servidor                                 |
| transversal | override                        | Autorización excepcional                                  |

La campaña podrá rechazar todos o algunos candidatos.

---

#### 29. Accesibilidad y lenguaje claro

La terminología deberá:

- utilizar frases directas;
- evitar dobles negaciones;
- conservar el mismo verbo para la misma acción;
- no depender únicamente de iconos, color o posición;
- ofrecer pronunciación y lectura comprensibles;
- mantener etiquetas accesibles equivalentes;
- evitar abreviaturas no explicadas;
- funcionar con ampliación, lector de pantalla y orden de foco;
- respetar plural, género y concordancia;
- permitir traducción futura sin codificar la lógica en la frase.

Una etiqueta corta no prevalecerá sobre una etiqueta comprensible.

---

#### 30. Privacidad y ética de la prueba

Las sesiones:

- utilizarán datos ficticios o minimizados;
- no registrarán credenciales, PIN ni información médica;
- informarán propósito y uso de la evidencia;
- permitirán detener la sesión;
- no evaluarán desempeño laboral individual;
- no comunicarán resultados a modo disciplinario;
- anonimizarán hallazgos cuando sea posible;
- separarán observación de identidad personal.

Una dificultad se tratará primero como problema de diseño, proceso o lenguaje.

---

#### 31. Capacitación no sustituye validación

```text
EL TRABAJADOR LO APRENDIÓ
≠ EL TÉRMINO ES CLARO
```

Se conservarán términos profesionales que sean necesarios para seguridad,
calidad, contabilidad o trazabilidad, pero deberán:

- tener definición operativa;
- enseñarse deliberadamente;
- utilizarse consistentemente;
- comprobarse en una tarea;
- disponer de ayuda contextual cuando corresponda.

La capacitación podrá complementar, no ocultar, una interfaz ambigua.

---

#### 32. Gobierno y cambios

Todo cambio de término deberá indicar:

- concepto afectado;
- razón;
- evidencia;
- audiencias;
- superficies;
- compatibilidad con documentos e impresos;
- alias de transición;
- fecha de entrada;
- versión;
- necesidad de revalidación;
- responsable de retiro del término anterior.

No se modificará una etiqueta global desde una aplicación consumidora sin acuerdo
del propietario semántico.

---

#### 33. Disparadores de revalidación

```text
CAMBIO DE PROCESO
CAMBIO DE SIGNIFICADO
NUEVO ACTOR
NUEVA SEDE O ÁREA
NUEVO DISPOSITIVO
NUEVA ACCIÓN O RIESGO
CAMBIO DE UNIDAD
NUEVA INTEGRACIÓN
HALLAZGO RECURRENTE
TRADUCCIÓN
CAMBIO REGULATORIO
```

Un cambio exclusivamente visual no exigirá siempre revalidación, salvo que afecte
visibilidad, jerarquía, truncamiento o asociación entre texto y control.

---

#### 34. Feedback continuo

Después del despliegue se habilitarán mecanismos para registrar:

- búsquedas sin resultado;
- aperturas repetidas de ayuda;
- retrocesos después de un CTA;
- selección frecuente de acción equivocada;
- bloqueos repetidos;
- términos reportados por soporte;
- alias escritos por trabajadores;
- diferencias entre sedes o áreas.

La telemetría servirá para detectar hipótesis de confusión, no para afirmar por sí
sola qué palabra debe utilizarse.

---

#### 35. Aplicación posterior y propietarios

| Decisión                               | Tarea propietaria                                                            |
| -------------------------------------- | ---------------------------------------------------------------------------- |
| prototipos y sesiones con trabajadores | `UX-STATION-008`; `AUTH-UI-055` a `AUTH-UI-060`                              |
| gramática y composición de estaciones  | `UX-STATION-010` a `UX-STATION-012`                                          |
| inventario y contrato de cada pantalla | `PROC-SCREEN-001` a `PROC-SCREEN-028`                                        |
| términos por producto                  | subbloques `*-UX-*` y `*-AUTH-*` propietarios                                |
| accesibilidad y ergonomía              | `NFR-REQ-007`; `UX-QA-001` a `UX-QA-030`                                     |
| observabilidad de confusión y soporte  | `NFR-REQ-009`; `OBS-ARC-001` a `OBS-ARC-016`                                 |
| validación de POS multiárea            | `UX-STATION-008`; `FOGO-UX-002`, `003`, `008`, `009`, `015`; `FOGO-AUTH-016` |
| certificación y regresión              | `UX-QA-001` a `UX-QA-030`; `AUTH-QA-001` a `AUTH-QA-030`                     |

Ninguna terminología quedará declarada `VALIDATED` sin evidencia generada por las
tareas anteriores. La aprobación documental de `UX-BASE-015` aprueba este
contrato, no inventa resultados de sesiones que todavía no se han ejecutado.

---

#### 36. Migración del lenguaje existente

Se inventariarán:

- términos técnicos visibles;
- traducciones literales;
- la misma acción con verbos diferentes;
- una palabra usada para conceptos distintos;
- estados mostrados como enums;
- abreviaturas no explicadas;
- textos hardcodeados utilizados como lógica;
- placeholders que sustituyen etiquetas;
- mensajes genéricos;
- documentos e impresos con vocabulario anterior;
- nombres locales no registrados;
- capacitación creada para explicar defectos de interfaz.

Clasificación:

```text
CONFORME
REQUIERE_VALIDACIÓN
REQUIERE_ALIAS_TRANSITORIO
REQUIERE_CAMBIO_COORDINADO
REQUIERE_EXPLICACIÓN
TÉCNICO_NO_VISIBLE
AMBIGUO
PELIGROSO
DEPRECATED
```

---

#### 37. Requisitos de prueba derivados

Se crean:

```text
TREQ-UX-297 a TREQ-UX-319
```

Cobertura resumida:

1. registro semántico;
2. separación entre identificador y etiqueta;
3. estados y gobierno;
4. participantes representativos;
5. validación contextual;
6. protocolo neutral;
7. umbrales y severidad;
8. términos críticos;
9. acciones y CTA;
10. estados y transiciones;
11. cantidades, unidades y presentaciones;
12. roles y contexto;
13. bloqueos y recuperación;
14. términos técnicos;
15. alias locales;
16. consistencia cross-app;
17. separación operativa y administrativa;
18. POS compartidos multiárea;
19. accesibilidad;
20. privacidad;
21. capacitación;
22. feedback y revalidación;
23. migración y certificación.

---

#### 38. Criterios de aceptación

- [ ] Existe una separación explícita entre concepto, identificador, etiqueta, alias y término técnico.
- [ ] Se define la estructura de `UX-TERMINOLOGY-REGISTER-001`.
- [ ] Los términos tienen estados de validación y versión.
- [ ] La validación exige participantes operativos representativos.
- [ ] Las pruebas se realizan dentro de tareas realistas y sin enseñar la respuesta.
- [ ] Se utilizan comprensión, predicción, conducta y `teach-back`.
- [ ] Existen umbrales diferenciados por riesgo.
- [ ] Todo hallazgo crítico o alto bloquea la aprobación del término.
- [ ] Acciones, estados, cantidades, unidades y contexto se prueban explícitamente.
- [ ] Los identificadores técnicos no se muestran automáticamente al trabajador.
- [ ] Los alias locales no crean semántica paralela.
- [ ] La aplicación propietaria conserva el significado cross-app.
- [ ] Se diferencian etiquetas operativas y administrativas solo con justificación.
- [ ] Los POS multiárea validan área activa, recetario, lote y cambio de actor.
- [ ] La prueba protege accesibilidad, privacidad y ética.
- [ ] La capacitación no sustituye comprensión demostrada.
- [ ] Todo cambio tiene propietario, evidencia y disparador de revalidación.
- [ ] Todas las decisiones diferidas tienen tarea propietaria exacta.
- [ ] Se crean `TREQ-UX-297` a `TREQ-UX-319`.
- [ ] No se implementan pantallas, código, traducciones, migraciones ni Supabase.
- [ ] `NFR-REQ-001` permanece sin iniciar.

---

#### 39. Estado y continuidad

```text
UX-BASE-014 APROBADA
UX-BASE-015 APROBADA
NFR-REQ-001 NO INICIADA
```

Al aprobarse `UX-BASE-015`, quedará cerrada la serie de principios
`UX-BASE-001` a `UX-BASE-015`. La continuidad documental interna de E2 será
`NFR-REQ-001 — Definir criticidad y disponibilidad por proceso`.

