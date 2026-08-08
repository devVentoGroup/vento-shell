### MINI-BLOQUE — DOMINIO DE TECNOLOGÍA Y SOPORTE

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **dominio de tecnología y soporte** dentro de **Z TECNOLOGÍA Y SOPORTE**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `TI-DOM-001` a `TI-DOM-013` — 13 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Definir modelo operativo de tecnología, catálogo de servicios, propietarios y niveles de atención” y concluye con “Definir base de conocimiento, capacitación, adopción y comunicación de cambios tecnológicos”.
<!-- PLAN-SECTION-META:END -->

### ✅ TI-DOM-001 — Definir modelo operativo de tecnología, catálogo de servicios, propietarios y niveles de atención

**Estado:** APROBADA
**Tarea anterior:** `NOTIFY-ARC-010 — Definir métricas y auditoría de entrega` — APROBADA
**Tarea siguiente:** `TI-DOM-002 — Definir configuración canónica de elementos tecnológicos y relaciones entre activo, endpoint, dispositivo compartido, red, impresora, aplicación y servicio` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada del modelo operativo transversal de tecnología, catálogo inicial de servicios, propiedad funcional, reglas de criticidad y niveles de atención
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/01_DOMINIO_DE_TECNOLOGIA_Y_SOPORTE.md`
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, tablas, RLS, RPC, Edge Functions, migraciones, datos, redes, dispositivos, impresoras, cuentas, licencias, proveedores, secretos, despliegues ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** establecer un único modelo operativo para tecnología en Vento Group, adoptar un catálogo inicial de once servicios tecnológicos trazables a `CAP-15.01` a `CAP-15.11`, fijar quién responde funcional y técnicamente por cada servicio, definir cómo se conserva la propiedad de las fuentes empresariales y materializar cuatro niveles de atención que permitan resolver o escalar trabajo sin convertir el nivel técnico en prioridad, SLA, autorización o propiedad del caso.

---

#### 1. Resultado sustantivo

`TI-DOM-001` queda documentalmente cerrada con:

- un modelo operativo transversal único para tecnología y soporte;
- once servicios `TI-SERVICE-001` a `TI-SERVICE-011`, uno por cada subcapacidad `CAP-15.01` a `CAP-15.11`;
- once decisiones explícitas de propiedad, frontera y atención;
- cuatro niveles de atención `TI-ATTN-001` a `TI-ATTN-004`;
- cinco reglas de derivación de criticidad de servicio, sin inventar prioridad de incidente ni objetivos de tiempo;
- una función responsable transversal basada en el actor canónico `RESPONSABLE_TECNOLOGICO`;
- una separación obligatoria entre servicio tecnológico, proceso empresarial, activo físico, autorización, proveedor y caso de soporte;
- una regla única de registro: `VPROC-0058` en VISO gobierna la solicitud o incidente tecnológico y no crea una fuente paralela del hecho empresarial;
- una excepción explícita para el ciclo de acceso tecnológico, cuyo proceso propietario es `VPROC-0059`;
- una frontera explícita con `VPROC-0062` para continuidad empresarial;
- estado documental `ESPECIFICADO` para las once familias del catálogo;
- cero cambios físicos;
- cero cambios en requisitos de prueba.

El catálogo define familias de servicio y reglas de operación. No afirma que exista todavía una implementación completa de mesa de servicio, CMDB, monitoreo, MDM, SLA, automatización de escalamiento o integración con proveedores.

---

#### 2. Entradas canónicas conservadas

La tarea consume y conserva, sin redefinirlas:

1. `CAP-SCOPE-015`, incluida la familia `CAP-15 — Gestionar tecnología y soporte`, sus once subcapacidades y las fronteras entre SHELL, NEXO, ANIMA, VISO, PRINT-ARC, ORIGO, NUMERA y los bloques de calidad y despliegue;
2. `VPROC-0058 — Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento`;
3. `VPROC-0059 — Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación`;
4. `VPROC-0062 — Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje`;
5. la propiedad funcional aprobada de `VPROC-0058` en VISO;
6. los iniciadores, continuadores, controles y participantes aprobados para `VPROC-0058`;
7. el catálogo vigente de roles base y operativos que pueden reportar o aportar evidencia sin adquirir privilegios de soporte;
8. las reglas de propiedad de procesos, aplicaciones consumidoras y segregación aprobadas en `PROC-CAT-*` y `PROC-ACTOR-*`;
9. `TREQ-VISO-002`, `TREQ-SHELL-010`, `TREQ-NEXO-019` y `TREQ-INTEGRATION-020`;
10. la arquitectura documental vigente de notificaciones, evidencia, impresión, autorización, continuidad e integraciones.

La tarea no convierte ninguna referencia histórica a una ubicación anterior del bloque en continuidad vigente. El propietario documental actual es el bloque `Z_TECNOLOGIA_Y_SOPORTE`.

---

#### 3. Problema que se cierra

La línea base aprobada identifica dos brechas que pertenecen directamente a esta tarea:

- las capacidades tecnológicas están distribuidas entre varias aplicaciones, servicios y procesos sin un modelo operativo único;
- no existe un catálogo canónico de servicios tecnológicos con propiedad, regla de criticidad y nivel de atención.

La respuesta aprobada es:

```text
UNA NECESIDAD TECNOLÓGICA
→ SE CLASIFICA CONTRA UN SERVICIO `TI-SERVICE-*`
→ SE REGISTRA EN EL PROCESO EMPRESARIAL CORRECTO
→ CONSERVA LA FUENTE DE VERDAD DE CADA OBJETO
→ SE ASIGNA AL NIVEL DE ATENCIÓN NECESARIO
→ SE RESUELVE O TRANSFIERE SIN CAMBIAR LA IDENTIDAD DEL CASO
→ SE VALIDA EL RESULTADO
→ SE CIERRA CON EVIDENCIA Y, CUANDO APLIQUE, CONOCIMIENTO
```

No se crea una aplicación monolítica de TI ni una tabla genérica que absorba identidad, activos, permisos, costos, contratos, impresión, continuidad o procesos empresariales.

---

#### 4. Modelo operativo transversal

##### 4.1. Entrada

Una necesidad puede originarse por:

- un trabajador;
- una alerta o umbral;
- `RESPONSABLE_TECNOLOGICO`;
- `GERENCIA_O_SUPERVISION_DE_SEDE`;
- un proceso o integración autorizados;
- un proveedor o técnico externo únicamente como participante autorizado.

El canal de entrada no se convierte en propietario del caso. ANIMA, correo, mensajería, formulario, monitoreo o integración pueden captar la señal, pero el registro empresarial se conserva en el proceso correspondiente.

##### 4.2. Registro y clasificación

Cuando la necesidad sea una solicitud o incidente tecnológico, VISO materializa el caso de `VPROC-0058` con, como mínimo, la información ya aprobada para ese proceso:

- tipo de solicitud o incidente;
- solicitante;
- servicio o elemento afectado;
- descripción;
- impacto;
- momento de reporte;
- contexto condicional de urgencia, sede, evidencia, workaround, seguridad o proveedor.

La prioridad calculada, los SLA, los umbrales y el escalamiento temporal pertenecen a `TI-DOM-007`.

##### 4.3. Enrutamiento

El caso se vincula con exactamente una familia `TI-SERVICE-*` primaria. Puede referenciar servicios secundarios cuando exista dependencia real, pero no se duplica el caso para aparentar propiedad múltiple.

El nivel de atención se selecciona por la capacidad necesaria para avanzar, no por jerarquía organizacional, severidad ni tiempo transcurrido.

##### 4.4. Ejecución

`RESPONSABLE_TECNOLOGICO` responde por la coordinación técnica del servicio. La ejecución puede involucrar:

- soporte guiado;
- mesa de servicio;
- especialista interno;
- propietario del proceso;
- responsable de seguridad tecnológica;
- proveedor o técnico externo.

La ejecución técnica no concede autoridad empresarial, acceso permanente ni permiso para modificar directamente la fuente de verdad de otro dominio.

##### 4.5. Restauración, cumplimiento y validación

Una acción técnica puede:

- cumplir una solicitud;
- restaurar un servicio;
- aplicar un workaround;
- producir una necesidad de cambio;
- requerir validación del solicitante o del responsable del proceso;
- derivar un problema o error conocido;
- alcanzar un umbral de continuidad.

`resolved`, workaround aplicado, respuesta del proveedor o cierre técnico de una tarea no constituyen por sí solos validación empresarial ni eliminación de causa.

##### 4.6. Cierre

El cierre de `VPROC-0058` conserva la distinción entre:

- restauración;
- validación;
- aceptación o cierre justificado;
- conocimiento;
- reapertura;
- recurrencia.

La causa recurrente se deriva a `TI-DOM-008`; los cambios tecnológicos a `TI-DOM-009`; la continuidad empresarial a `VPROC-0062` y sus tareas propietarias.

---

#### 5. Propiedad y responsabilidades

| Función canónica                            | Responsabilidad en el modelo                                                                                                                                          | Lo que no puede asumir                                                                                                                                                      |
| ------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `RESPONSABLE_TECNOLOGICO`                   | Responde por catálogo tecnológico, coordinación técnica, asignación del nivel de atención, diagnóstico, restauración y trazabilidad del trabajo tecnológico.          | No concede permisos por criterio propio, no se autoaprueba acceso privilegiado, no sustituye al propietario del proceso y no declara por sí solo el cierre de alto impacto. |
| `RESPONSABLE_DEL_PROCESO`                   | Declara contexto empresarial, impacto funcional y valida que la recuperación permita volver a producir el resultado protegido.                                        | No adquiere privilegios técnicos ni administra infraestructura por ser dueño del proceso.                                                                                   |
| `GERENCIA_O_SUPERVISION_DE_SEDE`            | Aporta contexto territorial, afectación operativa, disponibilidad local y coordinación con personas de la sede.                                                       | No se convierte en propietario técnico ni puede ampliar autoridad de soporte.                                                                                               |
| `RESPONSABLE_DE_SEGURIDAD_TECNOLOGICA`      | Participa cuando el diagnóstico, acceso, evidencia, configuración o incidente tiene impacto de seguridad.                                                             | No convierte un incidente técnico en autorización ilimitada ni expone secretos o logs completos.                                                                            |
| `COORDINACION_DE_OPERACIONES`               | Conserva la función de control o aceptación ya aprobada para prioridad crítica, cambio sensible, cierre de incidente mayor o aceptación de riesgo cuando corresponda. | No sustituye el diagnóstico ni convierte todo caso ordinario en flujo de aprobación.                                                                                        |
| `TRABAJADOR`                                | Puede reportar, aportar evidencia y confirmar recuperación dentro de su contexto autorizado.                                                                          | No recibe soporte privilegiado, administración de cuentas ni acceso a logs sensibles.                                                                                       |
| `TECNICO_O_PRESTADOR_EXTERNO` / `PROVEEDOR` | Ejecuta trabajo contratado o especializado dentro del alcance concedido y devuelve evidencia técnica.                                                                 | Nunca se convierte en propietario del caso, fuente de autoridad, aprobador de acceso o responsable final del cierre empresarial.                                            |

##### 5.1. Propietario del servicio frente a propietario del dato o proceso

Se fija la distinción:

```text
RESPONSABLE DEL SERVICIO TECNOLÓGICO
≠
PROPIETARIO DEL PROCESO EMPRESARIAL
≠
FUENTE DE VERDAD DEL OBJETO
≠
EJECUTOR TÉCNICO
≠
PROVEEDOR
```

El catálogo de TI coordina servicios. No absorbe los objetos que ya tienen propietario.

##### 5.2. Asignación nominal

La función `RESPONSABLE_TECNOLOGICO` queda definida como responsabilidad canónica del modelo. La identidad nominal de la persona y su suplencia no se inventan en ausencia de una asignación vigente verificable.

Estado: `PENDIENTE_DE_EVIDENCIA`.

- bloqueo: las fuentes consumidas no declaran una persona nominal vigente para esa función;
- propietario de resolución: `TI-AUTH-001`, reutilizando las reglas de segregación y actores aprobadas;
- condición de salida: persona activa y suplente registrados mediante la autoridad organizacional correspondiente, con alcance y autorización explícitos, antes de activar una mesa de servicio productiva o acceso privilegiado.

Este pendiente nominal no impide aprobar el modelo funcional ni el catálogo.

---

#### 6. Niveles canónicos de atención

Los niveles indican qué capacidad técnica debe intervenir. No son prioridad, severidad, SLA, tiempo de respuesta, escalamiento empresarial ni autorización.

| ID            | Nivel                       | Propósito                                                                                                              | Capacidades permitidas                                                                                                                     | Condición de salida                                                                               |
| ------------- | --------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------- |
| `TI-ATTN-001` | `L0_AUTOSERVICIO_GUIADO`    | Resolver necesidades repetibles mediante guía aprobada, información contextual o acción de autoservicio ya autorizada. | Consulta, diagnóstico no privilegiado, guía, comprobación simple y uso de conocimiento aprobado.                                           | Resuelto y comprobado, o creación/continuación del caso en L1.                                    |
| `TI-ATTN-002` | `L1_MESA_DE_SERVICIO`       | Recibir, clasificar, completar contexto, aplicar acciones estándar seguras y enrutar.                                  | Acuse, categorización, captura de evidencia, comprobaciones conocidas, comunicación, seguimiento y acciones preautorizadas de bajo riesgo. | Cumplimiento/restauración validable, o transferencia correlacionada a L2.                         |
| `TI-ATTN-003` | `L2_ESPECIALISTA_TECNICO`   | Ejecutar diagnóstico especializado y recuperación que exige conocimiento o acceso técnico superior.                    | Diagnóstico avanzado, correlación de dependencias, configuración controlada, restauración y preparación de cambio cuando aplique.          | Restauración validable, cambio formal, problema, continuidad o transferencia a L3.                |
| `TI-ATTN-004` | `L3_PROVEEDOR_O_FABRICANTE` | Obtener capacidad externa contratada, de garantía, fabricante, ISP, plataforma o especialista.                         | Diagnóstico o ejecución externa delimitada, soporte contractual, RMA, intervención de fabricante o proveedor.                              | Evidencia devuelta al caso interno y validación por VENTO; el tercero no cierra el caso canónico. |

Reglas:

1. un caso conserva el mismo identificador al cambiar de nivel;
2. un nivel superior no concede mayor autoridad empresarial;
3. el técnico puede saltar una acción innecesaria, pero no controles de autorización, evidencia o seguridad;
4. L0 nunca ejecuta acciones privilegiadas;
5. L1 no realiza cambios sensibles por conveniencia;
6. L2 no se autoautoriza privilegios ni cambios;
7. L3 requiere propietario interno, alcance, vigencia y evidencia;
8. volver de L3 a L2 o L1 no crea un caso nuevo;
9. tiempo transcurrido por sí solo no cambia el nivel;
10. `TI-DOM-007` definirá prioridad, SLA, escalamiento y comunicación sin redefinir estos niveles.

---

#### 7. Regla de criticidad de servicios

La criticidad tecnológica se registra por instancia de servicio y contexto, no se fija artificialmente para toda una familia.

Se aprueban cinco modos de derivación:

| Código                         | Regla                                                                                              |
| ------------------------------ | -------------------------------------------------------------------------------------------------- |
| `CRIT_FROM_PROTECTED_RESOURCE` | Hereda la necesidad de control del recurso, identidad o autorización protegidos.                   |
| `CRIT_FROM_DEPENDENCY`         | Deriva de los procesos, sedes, estaciones y servicios que dependen del componente.                 |
| `CRIT_FROM_AFFECTED_SERVICE`   | Una solicitud o incidente hereda la criticidad del servicio realmente afectado.                    |
| `CRIT_FROM_CHANGE_SCOPE`       | Un cambio o prueba hereda la mayor criticidad de los servicios y controles que puede afectar.      |
| `CRIT_FROM_ENABLED_CAPABILITY` | Conocimiento, licencia o capacidad de soporte heredan la criticidad de la capacidad que habilitan. |

Invariantes:

- criticidad del servicio no equivale a prioridad del caso;
- un servicio no se vuelve crítico porque una persona lo declare urgente;
- un incidente no pierde criticidad porque exista un workaround;
- el valor definitivo de una instancia requiere dependencias verificadas;
- `TI-DOM-002` y `TI-DOM-006` materializarán relaciones y criticidad de elementos y aplicaciones;
- `CONT-DOM-002` conserva la decisión empresarial de servicios y procesos críticos para continuidad;
- `TI-DOM-007` conserva impacto, urgencia, prioridad y SLA.

---

#### 8. Catálogo canónico inicial de servicios tecnológicos

Cada fila es una familia única y estable. Todas quedan en estado documental `ESPECIFICADO`.

| ID               | Capacidad   | Servicio                                                                | Autoridades y fuentes conservadas                                                                                                        | Responsable técnico       | Regla de criticidad            | Ruta normal de atención             | Frontera principal                                                                                                                  | Tarea que profundiza                         |
| ---------------- | ----------- | ----------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | ------------------------- | ------------------------------ | ----------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------- |
| `TI-SERVICE-001` | `CAP-15.01` | Cuentas, identidad y acceso tecnológico                                 | SHELL conserva identidad, catálogo de aplicaciones y política de acceso; VISO conserva `VPROC-0059`.                                     | `RESPONSABLE_TECNOLOGICO` | `CRIT_FROM_PROTECTED_RESOURCE` | L1 → L2 → L3 condicional            | El servicio ejecuta decisiones autorizadas; no concede permisos ni guarda secretos en el caso.                                      | `TI-AUTH-001`, `TI-AUTH-002`, `TI-DOM-006`   |
| `TI-SERVICE-002` | `CAP-15.02` | Endpoints, computadores, celulares, tabletas y dispositivos compartidos | NEXO conserva activo físico, ubicación y custodia; SHELL conserva restricciones de dispositivo y acceso.                                 | `RESPONSABLE_TECNOLOGICO` | `CRIT_FROM_DEPENDENCY`         | L0 → L1 → L2 → L3 condicional       | Activo, endpoint, dispositivo compartido, sesión y actor permanecen separados.                                                      | `TI-DOM-002`, `TI-DOM-003`                   |
| `TI-SERVICE-003` | `CAP-15.03` | Redes y conectividad                                                    | La operación técnica administra conectividad; NEXO conserva activos físicos relacionados; continuidad conserva recuperación empresarial. | `RESPONSABLE_TECNOLOGICO` | `CRIT_FROM_DEPENDENCY`         | L1 → L2 → L3                        | Red, enlace, router, switch, AP, segmento, SSID, reserva e IP no se conflan.                                                        | `TI-DOM-004`, `TI-DOM-010`, `TI-DOM-011`     |
| `TI-SERVICE-004` | `CAP-15.04` | Impresoras y periféricos                                                | NEXO conserva el activo físico; PRINT-ARC conserva cola, routing, adaptador, trabajo y resultado de impresión.                           | `RESPONSABLE_TECNOLOGICO` | `CRIT_FROM_DEPENDENCY`         | L0 → L1 → L2 → L3 condicional       | Reparar impresora no autoriza ni ejecuta el hecho empresarial que originó la impresión.                                             | `TI-DOM-005`, `PRINT-ARC-*`                  |
| `TI-SERVICE-005` | `CAP-15.05` | Aplicaciones, ambientes y proveedores tecnológicos                      | SHELL conserva catálogo e identidad de aplicaciones; cada aplicación conserva sus procesos; ORIGO conserva contratación.                 | `RESPONSABLE_TECNOLOGICO` | `CRIT_FROM_DEPENDENCY`         | L1 → L2 → L3                        | El catálogo técnico no convierte proveedor, repositorio, ambiente o aplicación en propietario del proceso.                          | `TI-DOM-006`, `TI-INT-*`                     |
| `TI-SERVICE-006` | `CAP-15.06` | Solicitudes de soporte tecnológico                                      | VISO conserva `VPROC-0058`; ANIMA puede reportar y consultar.                                                                            | `RESPONSABLE_TECNOLOGICO` | `CRIT_FROM_AFFECTED_SERVICE`   | L0 → L1 → L2 → L3 condicional       | Canal, bandeja o mensaje no sustituyen el caso; solicitud no equivale a incidente.                                                  | `TI-DOM-007`, `TI-UX-001`, `TI-UX-002`       |
| `TI-SERVICE-007` | `CAP-15.07` | Incidentes y restauración tecnológica                                   | VISO conserva `VPROC-0058`; el proceso afectado conserva el hecho empresarial; `VPROC-0062` conserva continuidad.                        | `RESPONSABLE_TECNOLOGICO` | `CRIT_FROM_AFFECTED_SERVICE`   | L1 → L2 → L3 condicional            | Restaurar servicio no elimina causa; incidente tecnológico no equivale a incidente de continuidad.                                  | `TI-DOM-007`, `TI-DOM-008`, `TI-DOM-010`     |
| `TI-SERVICE-008` | `CAP-15.08` | Cambios, configuración y versiones tecnológicas                         | VISO conserva el caso de cambio; BLOQUE T conserva calidad, release, despliegue y rollback; propietarios conservan decisión del proceso. | `RESPONSABLE_TECNOLOGICO` | `CRIT_FROM_CHANGE_SCOPE`       | L2 → L3 condicional                 | Diagnóstico no autoriza cambio; despliegue, aprobación de cambio y rollback permanecen separados.                                   | `TI-DOM-009`                                 |
| `TI-SERVICE-009` | `CAP-15.09` | Pruebas y aceptación técnica de soluciones                              | BLOQUES E5/T/U conservan pruebas, piloto, release y certificación; el propietario funcional valida el resultado empresarial.             | `RESPONSABLE_TECNOLOGICO` | `CRIT_FROM_CHANGE_SCOPE`       | L2 → L3 condicional                 | Una prueba técnica no sustituye aceptación operativa, seguridad, dispositivo físico o validación remota cuando correspondan.        | BLOQUES E5/T/U; tareas técnicas propietarias |
| `TI-SERVICE-010` | `CAP-15.10` | Licencias, garantías, contratos y costos tecnológicos                   | ORIGO conserva compra, proveedor y contrato; NUMERA conserva compromiso, gasto y costo; TI conserva uso técnico y necesidad.             | `RESPONSABLE_TECNOLOGICO` | `CRIT_FROM_ENABLED_CAPABILITY` | L1 → L2 → L3 condicional            | Licencia, asiento, cuenta, contrato, garantía y costo son objetos distintos.                                                        | `TI-DOM-012`                                 |
| `TI-SERVICE-011` | `CAP-15.11` | Conocimiento, capacitación y adopción tecnológica                       | ANIMA puede presentar aprendizaje al trabajador; propietarios funcionales conservan procedimiento y uso empresarial.                     | `RESPONSABLE_TECNOLOGICO` | `CRIT_FROM_ENABLED_CAPABILITY` | L0 → L1; L2 si existe falla técnica | Guía, capacitación y comunicación de cambio no sustituyen soporte, autorización ni evidencia de competencia cuando sea obligatoria. | `TI-DOM-013`, `TI-UX-006`                    |

##### 8.1. Reconciliación del catálogo

- subcapacidades esperadas: **11**;
- servicios materializados: **11**;
- faltantes: **0**;
- duplicados: **0**;
- identificadores repetidos: **0**;
- familias sin responsable técnico: **0**;
- familias sin regla de criticidad: **0**;
- familias sin ruta de atención: **0**.

Los identificadores `TI-SERVICE-*` identifican familias del catálogo tecnológico; no reemplazan `VPROC-*`, `VSCREEN-*`, activos, aplicaciones, contratos, tickets, proveedores ni permisos.

---

#### 9. Regla única de caso y handoff

##### 9.1. Solicitud o incidente tecnológico

La necesidad usa `VPROC-0058`.

VISO conserva:

- identidad del caso;
- solicitante;
- servicio y elemento afectados;
- clasificación;
- trabajo;
- comunicaciones;
- diagnóstico;
- workaround;
- restauración;
- validación;
- cierre o reapertura;
- referencia de conocimiento.

##### 9.2. Acceso

Cuando el resultado solicitado sea alta, modificación, suspensión, recuperación o revocación de acceso, el proceso propietario es `VPROC-0059`.

Un ticket de soporte puede capturar o correlacionar la necesidad, pero no sustituye aprobación, vigencia, provisión, revisión ni revocación del ciclo de acceso.

##### 9.3. Activo físico

NEXO conserva identidad, ubicación, custodia, mantenimiento, garantía y retiro del activo. El caso de soporte referencia el activo; no crea un inventario paralelo.

##### 9.4. Impresión

PRINT-ARC conserva cola, routing, adaptador, intento y resultado de impresión. El caso de soporte puede diagnosticar impresora, red o adaptador; no altera la intención empresarial que originó el trabajo.

##### 9.5. Compra, contrato, licencia y costo

ORIGO conserva compra, proveedor y contrato. NUMERA conserva compromiso, gasto y costo. TI conserva necesidad técnica, uso, cumplimiento del servicio y evidencia de soporte.

##### 9.6. Continuidad

Cuando la interrupción supera el umbral empresarial aplicable, se correlaciona con `VPROC-0062`. El incidente tecnológico permanece como expediente técnico; el caso de continuidad gobierna operación mínima, recuperación empresarial, reconciliación y cierre de continuidad.

---

#### 10. Reglas de autorización y seguridad

1. pertenecer a un nivel de atención no concede permisos;
2. asignarse un caso no concede acceso al recurso afectado;
3. un proveedor no recibe acceso persistente por tener contrato;
4. soporte remoto requiere alcance, vigencia, actor y evidencia conforme a las tareas de autorización;
5. diagnóstico sensible utiliza la proyección mínima necesaria;
6. capturas, logs, IP, identificadores, tokens y secretos se protegen según su clasificación;
7. una acción técnica que modifique configuración o estado protegido debe usar la autorización y el mecanismo propietarios;
8. ningún técnico puede concederse a sí mismo acceso o aprobar su propio cambio sensible;
9. la intervención sobre un dispositivo compartido no amplía la capacidad del trabajador activo;
10. los canales de soporte no almacenan secretos como mecanismo de transferencia.

---

#### 11. Estados del resultado de esta tarea

| Objeto                                                  | Estado                                      | Evidencia o límite                                                                                             |
| ------------------------------------------------------- | ------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| Modelo operativo transversal                            | `ESPECIFICADO`                              | Definido documentalmente en esta tarea.                                                                        |
| Catálogo `TI-SERVICE-001` a `011`                       | `ESPECIFICADO`                              | Once familias reconciliadas contra `CAP-15.01` a `CAP-15.11`.                                                  |
| Niveles `TI-ATTN-001` a `004`                           | `ESPECIFICADO`                              | Cuatro niveles definidos sin tiempos ni privilegios implícitos.                                                |
| Propiedad funcional del caso tecnológico                | `ESPECIFICADO`                              | Reutiliza `VPROC-0058` y la propiedad aprobada de VISO.                                                        |
| Implementación completa de mesa de servicio             | `NO_APLICA` en esta tarea                   | La fase actual es documental; implementación física depende del alcance de implementación aprobado.            |
| `support_tickets` actual frente al modelo objetivo      | `IMPLEMENTADO` parcialmente como base AS-IS | Existe estructura básica de ticket, mensajes, estado y asignación; no demuestra el contrato objetivo completo. |
| SLA, impacto, urgencia, prioridad y escalamiento        | `FUERA_DE_ALCANCE`                          | Propietario documental: `TI-DOM-007`.                                                                          |
| Relaciones de configuración y CMDB                      | `FUERA_DE_ALCANCE`                          | Propietarios documentales: `TI-DOM-002` y `TI-DOM-006`.                                                        |
| Persona nominal y suplente de `RESPONSABLE_TECNOLOGICO` | `PENDIENTE_DE_EVIDENCIA`                    | Se resuelve en `TI-AUTH-001` antes de operación productiva, con designación organizacional vigente.            |

---

#### 12. Fronteras obligatorias

```text
SERVICIO TECNOLÓGICO ≠ PROCESO EMPRESARIAL
```

```text
CASO DE SOPORTE ≠ ACTIVO ≠ ENDPOINT ≠ DISPOSITIVO COMPARTIDO
```

```text
ASIGNACIÓN DE CASO ≠ PERMISO ≠ CREDENCIAL ≠ SECRETO
```

```text
NIVEL DE ATENCIÓN ≠ PRIORIDAD ≠ SEVERIDAD ≠ SLA
```

```text
RESTAURACIÓN ≠ CAUSA ELIMINADA ≠ CIERRE ACEPTADO
```

```text
PROVEEDOR ≠ PROPIETARIO DEL SERVICIO ≠ AUTORIDAD EMPRESARIAL
```

```text
TICKET ≠ CONTRATO ≠ LICENCIA ≠ COSTO
```

```text
INCIDENTE TECNOLÓGICO ≠ INCIDENTE DE CONTINUIDAD
```

---

#### 13. Decisiones reservadas con propietario

| Decisión posterior                                                                           | Propietario documental          |
| -------------------------------------------------------------------------------------------- | ------------------------------- |
| Modelo detallado de activo, endpoint, dispositivo, red, impresora, aplicación y servicio     | `TI-DOM-002`                    |
| Ciclo de vida y estándar de endpoints                                                        | `TI-DOM-003`                    |
| Arquitectura y gobierno de redes                                                             | `TI-DOM-004`                    |
| Gobierno físico de impresión y periféricos                                                   | `TI-DOM-005`                    |
| Aplicaciones, ambientes, dependencias, proveedores, licencias y criticidad por instancia     | `TI-DOM-006`                    |
| Solicitud, incidente, impacto, urgencia, prioridad, SLA, escalamiento, comunicación y cierre | `TI-DOM-007`                    |
| Problema, causa raíz, error conocido y prevención                                            | `TI-DOM-008`                    |
| Gobierno de cambios tecnológicos                                                             | `TI-DOM-009`                    |
| Monitoreo, eventos, alertas, logs y salud técnica                                            | `TI-DOM-010`                    |
| Respaldo y recuperación técnica                                                              | `TI-DOM-011`                    |
| Licencias, asientos, garantías, contratos, renovación, uso y costos                          | `TI-DOM-012`                    |
| Base de conocimiento, capacitación, adopción y comunicación de cambios                       | `TI-DOM-013`                    |
| Segregación, acceso privilegiado y funciones autorizadas de soporte                          | `TI-AUTH-001` a `TI-AUTH-004`   |
| Experiencia del portal y mesa de servicio                                                    | `TI-UX-001` a `TI-UX-006`       |
| Contratos y coordinación técnica entre dominios                                              | `TI-INT-001` a `TI-INT-003`     |
| BIA, servicios empresariales críticos, MTPD, RTO, RPO y MBCO                                 | `CONT-DOM-002` a `CONT-DOM-004` |

No se deja una decisión material de `TI-DOM-001` sin propietario documental.

---

#### 14. Criterios de aceptación

- [x] se conserva la continuidad `NOTIFY-ARC-010 → TI-DOM-001 → TI-DOM-002`;
- [x] la tarea se limita a diseño documental;
- [x] se materializan exactamente once servicios tecnológicos;
- [x] los once servicios cubren `CAP-15.01` a `CAP-15.11` una sola vez;
- [x] cada servicio tiene responsable técnico;
- [x] cada servicio conserva las autoridades y fuentes de verdad externas a TI que le aplican;
- [x] cada servicio tiene una regla explícita de criticidad;
- [x] cada servicio tiene una ruta de niveles de atención;
- [x] se definen exactamente cuatro niveles de atención;
- [x] los niveles no se convierten en prioridad, SLA o autorización;
- [x] `VPROC-0058` permanece como proceso canónico de solicitudes e incidentes tecnológicos;
- [x] `VPROC-0059` permanece separado para el ciclo de acceso;
- [x] `VPROC-0062` permanece separado para continuidad empresarial;
- [x] VISO conserva el caso tecnológico sin absorber hechos de otras aplicaciones;
- [x] SHELL conserva identidad, aplicaciones y política de acceso;
- [x] NEXO conserva activos físicos, ubicación y custodia;
- [x] PRINT-ARC conserva ejecución técnica de impresión;
- [x] ORIGO y NUMERA conservan contrato, compra, gasto y costo según su autoridad;
- [x] proveedor y técnico externo no adquieren propiedad ni autoridad implícita;
- [x] la asignación nominal no se inventa y queda con propietario y condición de salida;
- [x] no se definen tiempos, matrices de impacto/urgencia, SLA ni escalamiento de `TI-DOM-007`;
- [x] no se crea CMDB ni relaciones físicas de `TI-DOM-002`;
- [x] no se modifica código, Supabase, red, dispositivos, impresoras ni operación;
- [x] no se crean ni modifican requisitos de prueba;
- [x] `TI-DOM-002` permanece únicamente reservada.

---

#### 15. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** `CAP-SCOPE-015` ya creó y registró los requisitos transversales que protegen esta materia y asignó expresamente `TI-DOM-001` entre sus tareas responsables. Esos requisitos vigentes cubren la mesa de servicio y su ciclo; la separación entre identidad, autorización, cuentas, credenciales, licencias y endpoints; las relaciones de los elementos físicos, redes e impresión; y la correlación transversal entre servicios, aplicaciones, activos, tickets, proveedores, costos, monitoreo, recuperación y conocimiento.

Las reglas de propiedad y handoff también permanecen cubiertas por requisitos vigentes de procesos y actores que prohíben fuentes mutables paralelas, autoridad implícita y transferencias sin contexto. Esta tarea especializa documentalmente el catálogo y los niveles de atención; no introduce un comportamiento ejecutable nuevo que requiera una fila adicional.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 16. Continuidad

ÚLTIMA TAREA APROBADA
`NOTIFY-ARC-010 — Definir métricas y auditoría de entrega`

TAREA ACTUAL APROBADA
`TI-DOM-001 — Definir modelo operativo de tecnología, catálogo de servicios, propietarios y niveles de atención`

SIGUIENTE TAREA RESERVADA
`TI-DOM-002 — Definir configuración canónica de elementos tecnológicos y relaciones entre activo, endpoint, dispositivo compartido, red, impresora, aplicación y servicio`


### ✅ TI-DOM-002 — Definir configuración canónica de elementos tecnológicos y relaciones entre activo, endpoint, dispositivo compartido, red, impresora, aplicación y servicio

**Estado:** APROBADA
**Tarea anterior:** `TI-DOM-001 — Definir modelo operativo de tecnología, catálogo de servicios, propietarios y niveles de atención` — APROBADA
**Tarea siguiente:** `TI-DOM-003 — Definir ciclo de vida de computadores, celulares, tabletas y endpoints` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de configuración tecnológica federada, identidad referencial, relaciones tipadas, cardinalidades, evidencia y reconciliación entre elementos tecnológicos
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/01_DOMINIO_DE_TECNOLOGIA_Y_SOPORTE.md`
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, tablas, constraints, RLS, RPC, Edge Functions, migraciones, datos, redes, dispositivos, impresoras, cuentas, aplicaciones, servicios, secretos, despliegues ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir una configuración canónica única y federada para relacionar los elementos tecnológicos que participan en la operación de Vento OS sin convertir el registro técnico en una nueva fuente de verdad empresarial.

La tarea fija el contrato que permite responder de forma determinista:

```text
QUÉ OBJETO TECNOLÓGICO ES
→ QUIÉN ES SU FUENTE AUTORITATIVA
→ CON QUÉ IDENTIDAD SE REFERENCIA
→ DE QUÉ OTROS OBJETOS DEPENDE
→ QUÉ RELACIONES SON DIRECTAS
→ QUÉ RELACIONES SOLO SE DERIVAN
→ QUÉ EVIDENCIA DEMUESTRA CADA VÍNCULO
→ QUÉ CAMBIÓ
→ QUÉ QUEDA AFECTADO CUANDO FALLA
```

El resultado no crea una CMDB monolítica ni reemplaza NEXO, SHELL, el modelo de dispositivos compartidos, PRINT-ARC o el catálogo tecnológico aprobado en `TI-DOM-001`.

---

#### 2. Resultado material

Se aprueba `TI-CONFIGURATION-GRAPH-CONTRACT-001` como contrato documental de configuración tecnológica.

El resultado materializa:

| Elemento                                  |    Resultado |
| ----------------------------------------- | -----------: |
| Clases canónicas de configuración         |        **7** |
| Relaciones directas tipadas               |       **15** |
| Pares clase–clase evaluados               | **49 de 49** |
| Servicios heredados reconciliados         | **11 de 11** |
| Servicios faltantes                       |        **0** |
| Servicios duplicados                      |        **0** |
| Fuentes de verdad sustituidas             |        **0** |
| Relaciones creadas por inferencia nominal |        **0** |
| Cambios físicos                           |        **0** |
| Cambios de requisitos de prueba           |        **0** |

Las siete clases son:

```text
ASSET
ENDPOINT
SHARED_DEVICE
NETWORK_RESOURCE
PRINTER
APPLICATION
TECH_SERVICE
```

Las clases son proyecciones referenciales de configuración. No crean por sí mismas una nueva identidad cuando una identidad canónica ya existe en otro dominio.

---

#### 3. Entradas canónicas conservadas

La tarea consume y preserva:

1. `TI-DOM-001`, incluidos `TI-SERVICE-001` a `TI-SERVICE-011`;
2. `CAP-SCOPE-015` y sus fronteras entre SHELL, NEXO, ANIMA, VISO, PRINT-ARC, ORIGO, NUMERA y las capas de calidad, despliegue y continuidad;
3. `AUTH-DEV-001` y `AUTH-DEV-002`, incluido `SHARED-DEVICE-IDENTITY-CONTRACT-001`;
4. la separación aprobada entre `device_id`, `device_code`, `endpoint_id`, `asset_id`, estación, principal técnico, credencial, plantilla, observación y actor;
5. el catálogo canónico de aplicaciones y su regla de `app_code` estable;
6. la clasificación física de NEXO y su propiedad sobre identidad física, ubicación, condición y custodia;
7. el inventario y la arquitectura documental de PRINT-ARC;
8. `TREQ-AUTH-019` a `TREQ-AUTH-029`;
9. `TREQ-SHELL-010`;
10. `TREQ-NEXO-019`;
11. `TREQ-INTEGRATION-020`;
12. la regla transversal de que una fuente técnica, caché, proyección, cola, índice o adaptador no se convierte en propietario del hecho original.

La configuración canónica definida aquí no modifica ninguna de esas decisiones.

---

#### 4. Decisión principal: grafo federado, no CMDB competidora

Se adopta el siguiente modelo:

```text
FUENTE CANÓNICA DEL OBJETO
        ↓
REFERENCIA DE CONFIGURACIÓN
        ↓
RELACIÓN TIPADA Y VERSIONADA
        ↓
REFERENCIA DE OTRO OBJETO
        ↓
EVIDENCIA + ESTADO DE RECONCILIACIÓN
```

Reglas:

1. la fuente canónica conserva el objeto y sus atributos propietarios;
2. la capa tecnológica conserva referencias y relaciones necesarias para soporte, impacto, diagnóstico, cambio y recuperación;
3. una referencia no duplica un registro completo del objeto;
4. un cambio en la proyección no modifica la fuente propietaria;
5. una relación no concede autorización;
6. un nombre, IP, MAC, serial, etiqueta, URL, ubicación o texto libre no bastan para crear una relación autoritativa;
7. una relación derivada se calcula desde relaciones directas y no se mantiene como fuente competidora;
8. el historial se conserva cuando cambia un vínculo;
9. una relación sin evidencia suficiente queda explícitamente pendiente;
10. una contradicción entre fuentes se trata como conflicto de reconciliación y no se resuelve mediante sobrescritura automática.

---

#### 5. Las siete clases canónicas

##### 5.1. `ASSET`

Representa el objeto físico individual controlado por NEXO cuando la clase física exige identidad individual.

Fuente y frontera:

- NEXO conserva identidad física;
- NEXO conserva ubicación, condición, custodia, mantenimiento, garantía y retiro;
- la configuración tecnológica referencia el activo;
- TI no crea un activo paralelo;
- modelo, serial, placa o etiqueta ayudan a reconciliar, pero no reemplazan la identidad estable.

Un activo puede existir sin estar habilitado como endpoint, dispositivo compartido, impresora o recurso de red.

##### 5.2. `ENDPOINT`

Representa la instalación técnica administrada que ejecuta un cliente, sistema operativo o capacidad tecnológica sobre un equipo.

Reglas:

- utiliza `endpoint_id` conforme al contrato de identidad aprobado;
- es distinto del activo físico;
- una reinstalación crea una generación de endpoint nueva conforme a la autoridad de dispositivo;
- no se identifica por IP, MAC, serial, hostname, user agent o fingerprint;
- su ciclo de vida completo pertenece a `TI-DOM-003`;
- su configuración estándar, postura, parches, cifrado, software y salud se profundizan en `TI-DOM-003` y `TI-DOM-010`.

La ausencia actual de una materialización física transversal de `endpoint_id` no autoriza a reutilizar `device_id`, `asset_id` o una cuenta técnica como sustituto.

##### 5.3. `SHARED_DEVICE`

Representa el dispositivo empresarial lógico administrado para operación compartida.

Fuente y frontera:

- conserva `device_id` y `device_code` del contrato de dispositivos compartidos;
- el dispositivo no es trabajador, endpoint, activo, estación ni principal técnico;
- puede vincularse a un endpoint vigente;
- puede declarar aplicaciones permitidas sin conceder permisos al actor;
- sede, área, aplicaciones y capacidad máxima continúan bajo las decisiones de `AUTH-DEV-*`;
- la capa TI consume esas relaciones, no las reinterpreta.

##### 5.4. `NETWORK_RESOURCE`

Representa un elemento técnico de conectividad cuya identidad y subtipo definitivos serán administrados por el dominio tecnológico.

Puede representar, según la taxonomía posterior:

- enlace;
- router;
- switch;
- punto de acceso;
- segmento o VLAN;
- SSID;
- reserva o identidad de direccionamiento;
- otro recurso técnico de red aprobado.

`TI-DOM-002` crea la clase y sus relaciones transversales, pero no inventaría topología, IP, VLAN, SSID, proveedor, capacidad o contingencia. Esas decisiones pertenecen a `TI-DOM-004`.

Un recurso físico de red deberá poder relacionarse con el activo físico correspondiente sin convertir la dirección IP o MAC en identidad del activo.

##### 5.5. `PRINTER`

Representa la proyección técnica de un dispositivo de impresión inventariado por PRINT-ARC.

Fronteras:

- el equipo físico sigue siendo un activo cuando corresponda;
- PRINT-ARC conserva capacidad, conexión, cola, routing, adaptador, trabajo y resultado según sus tareas propietarias;
- TI conserva la relación técnica necesaria para configuración, soporte y diagnóstico;
- una impresora de red puede relacionarse con red;
- una impresora local puede relacionarse con el endpoint al que está conectada;
- una impresora no recibe autoridad empresarial por estar disponible;
- aplicación y dispositivo físico no se vinculan directamente para decidir routing de impresión: la intención y el trabajo atraviesan PRINT-ARC.

La identidad física de una impresora no se crea desde marca, modelo o ubicación.

##### 5.6. `APPLICATION`

Representa una aplicación del catálogo canónico de SHELL.

Reglas:

- se referencia por su identidad canónica y `app_code`;
- aplicación no equivale a repositorio, URL, ambiente, despliegue o servicio;
- la configuración tecnológica no renombra códigos;
- que una fila esté activa en el catálogo no demuestra disponibilidad operativa;
- ambiente, proveedor, dependencias, licencias, criticidad y salida del proveedor pertenecen a `TI-DOM-006`;
- un endpoint puede presentar o ejecutar un cliente para una aplicación sin que esa relación conceda permiso.

##### 5.7. `TECH_SERVICE`

Representa una de las once familias `TI-SERVICE-001` a `TI-SERVICE-011` aprobadas en `TI-DOM-001`.

Reglas:

- la identidad del servicio se conserva;
- el servicio puede depender de otros nodos del grafo;
- la dependencia se utiliza para impacto, soporte, cambio, monitoreo y continuidad;
- el servicio no absorbe la identidad de sus componentes;
- una dependencia no convierte el componente en propietario del servicio;
- criticidad del servicio no equivale a prioridad de incidente;
- la materialización detallada de aplicaciones, proveedores, ambientes y dependencias se profundiza en `TI-DOM-006`.

---

#### 6. Contrato común de una referencia de configuración

Toda referencia que ingrese al grafo deberá resolver, conceptualmente, como mínimo:

| Campo conceptual          | Regla                                                                       |
| ------------------------- | --------------------------------------------------------------------------- |
| `configuration_class`     | Una de las siete clases aprobadas.                                          |
| `canonical_source`        | Dominio o registro propietario del objeto.                                  |
| `canonical_identity`      | Identidad estable suministrada por la fuente; nunca inferida por nombre.    |
| `source_version`          | Versión o revisión cuando la fuente la tenga.                               |
| `display_label`           | Etiqueta humana no autoritativa.                                            |
| `lifecycle_reference`     | Estado propietario del objeto, sin crear un estado paralelo.                |
| `site_reference`          | Referencia territorial cuando exista y sea necesaria; no concede autoridad. |
| `area_reference`          | Referencia funcional cuando aplique; no sustituye contexto de actor.        |
| `technical_evidence_refs` | Evidencia que permite comprobar la proyección.                              |
| `last_observed_at`        | Última observación técnica disponible cuando exista.                        |
| `last_reconciled_at`      | Última comparación controlada con la fuente.                                |
| `reconciliation_state`    | Estado explícito de la proyección conforme a las reglas de evidencia.       |

Restricciones:

- no se copian secretos;
- no se guarda una credencial completa;
- no se copian atributos sensibles si una referencia basta;
- no se utiliza `metadata` como almacén genérico para eludir contratos;
- la ausencia de un dato requerido no se rellena con una heurística.

---

#### 7. Estados de reconciliación aplicables

La tarea utiliza los estados generales vigentes de entrega y evidencia:

| Estado                   | Uso dentro del grafo                                                                                |
| ------------------------ | --------------------------------------------------------------------------------------------------- |
| `ESPECIFICADO`           | La clase, relación o contrato están definidos documentalmente, sin afirmar persistencia física.     |
| `IMPLEMENTADO`           | Existe una estructura o dato técnico actual que materializa parcialmente el contrato.               |
| `VALIDADO`               | La relación o identidad fue contrastada con evidencia suficiente y reproducible.                    |
| `BLOQUEADO`              | Existe un conflicto o falta un prerrequisito que impide usar la relación.                           |
| `PENDIENTE_DE_EVIDENCIA` | Existe un candidato o dato parcial, pero falta prueba suficiente para declararlo relación canónica. |
| `NO_APLICA`              | La relación no corresponde al tipo o instancia.                                                     |
| `FUERA_DE_ALCANCE`       | La decisión pertenece expresamente a otra tarea.                                                    |

Una relación pasa a `VALIDADO` por evidencia, no por antigüedad, nombre coincidente o ausencia de errores.

---

#### 8. Contrato canónico de relación

Cada relación directa deberá conservar:

| Dimensión    | Regla                                                                       |
| ------------ | --------------------------------------------------------------------------- |
| tipo         | relación incluida en el catálogo de esta tarea                              |
| origen       | clase + identidad canónica de origen                                        |
| destino      | clase + identidad canónica de destino                                       |
| dirección    | semántica única; la inversa es una vista, no otro hecho                     |
| cardinalidad | restricción aprobada por tipo                                               |
| vigencia     | inicio y fin cuando exista cambio                                           |
| versión      | nueva versión o nuevo vínculo ante cambio material                          |
| evidencia    | fuente que demuestra la relación                                            |
| estado       | reconciliación explícita                                                    |
| motivo       | razón estructurada para alta, cambio, sustitución o retiro                  |
| correlación  | referencia al cambio, caso o decisión que produjo el vínculo cuando aplique |

Clave lógica mínima:

```text
RELATION_TYPE
+
SOURCE_CANONICAL_IDENTITY
+
TARGET_CANONICAL_IDENTITY
+
VIGENCIA O VERSIÓN
```

El mismo vínculo no se duplica para representar la dirección inversa.

---

#### 9. Catálogo de relaciones directas

Se aprueban quince relaciones directas.

| ID           | Relación                           | Origen → destino                  | Cardinalidad y regla                                                                                                                                                                                                          |
| ------------ | ---------------------------------- | --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `TI-REL-001` | `ENDPOINT_RUNS_ON_ASSET`           | `ENDPOINT → ASSET`                | Un endpoint físico referencia como máximo un activo vigente. La ausencia puede existir durante transición, pero impide declararlo físicamente validado. Un activo puede conservar varias generaciones históricas de endpoint. |
| `TI-REL-002` | `SHARED_DEVICE_USES_ENDPOINT`      | `SHARED_DEVICE → ENDPOINT`        | Máximo un endpoint actual ordinario por dispositivo compartido; un endpoint vigente no pertenece simultáneamente a dos dispositivos compartidos. Historia previa se conserva.                                                 |
| `TI-REL-003` | `SHARED_DEVICE_ALLOWS_APPLICATION` | `SHARED_DEVICE → APPLICATION`     | Muchos a muchos. Expresa superficie permitida por el dispositivo; nunca concede permiso al actor.                                                                                                                             |
| `TI-REL-004` | `ENDPOINT_CONNECTS_VIA_NETWORK`    | `ENDPOINT → NETWORK_RESOURCE`     | Cero o más según la conectividad real. Solo se materializa con evidencia; no se deriva de IP o SSID textual aislado.                                                                                                          |
| `TI-REL-005` | `ENDPOINT_CLIENT_FOR_APPLICATION`  | `ENDPOINT → APPLICATION`          | Muchos a muchos. Declara cliente instalado, presentado o técnicamente disponible; no prueba autorización, disponibilidad del backend ni uso vigente.                                                                          |
| `TI-REL-006` | `NETWORK_RESOURCE_RUNS_ON_ASSET`   | `NETWORK_RESOURCE → ASSET`        | Condicional. Aplica a router, switch, AP u otro elemento físico individual; no aplica a segmento, SSID o concepto puramente lógico.                                                                                           |
| `TI-REL-007` | `PRINTER_REPRESENTS_ASSET`         | `PRINTER → ASSET`                 | Una impresora física deberá resolver a un activo físico cuando la reconciliación correspondiente exista. Hasta entonces queda pendiente y no se crea el activo por inferencia.                                                |
| `TI-REL-008` | `PRINTER_CONNECTS_VIA_NETWORK`     | `PRINTER → NETWORK_RESOURCE`      | Cero o más. Aplica cuando la conexión de red está comprobada. Capacidad del modelo no equivale a conexión configurada.                                                                                                        |
| `TI-REL-009` | `PRINTER_ATTACHED_TO_ENDPOINT`     | `PRINTER → ENDPOINT`              | Condicional para USB, puente local u otra conexión dependiente de host. No sustituye cola, routing ni adaptador de PRINT-ARC.                                                                                                 |
| `TI-REL-010` | `SERVICE_DEPENDS_ON_ASSET`         | `TECH_SERVICE → ASSET`            | Muchos a muchos. Solo para activos cuya falla afecta el servicio de forma demostrada.                                                                                                                                         |
| `TI-REL-011` | `SERVICE_DEPENDS_ON_ENDPOINT`      | `TECH_SERVICE → ENDPOINT`         | Muchos a muchos. Conserva dependencia técnica sin convertir endpoint en servicio.                                                                                                                                             |
| `TI-REL-012` | `SERVICE_DEPENDS_ON_SHARED_DEVICE` | `TECH_SERVICE → SHARED_DEVICE`    | Muchos a muchos. Aplica cuando una capacidad de servicio depende de una estación compartida administrada.                                                                                                                     |
| `TI-REL-013` | `SERVICE_DEPENDS_ON_NETWORK`       | `TECH_SERVICE → NETWORK_RESOURCE` | Muchos a muchos. La topología exacta se materializa en `TI-DOM-004`.                                                                                                                                                          |
| `TI-REL-014` | `SERVICE_DEPENDS_ON_PRINTER`       | `TECH_SERVICE → PRINTER`          | Muchos a muchos. Aplica a servicios que requieren salida física; routing de cada trabajo permanece en PRINT-ARC.                                                                                                              |
| `TI-REL-015` | `SERVICE_DEPENDS_ON_APPLICATION`   | `TECH_SERVICE → APPLICATION`      | Muchos a muchos. La instancia detallada de dependencias se materializa en `TI-DOM-006`.                                                                                                                                       |

No se crea una relación universal `RELATED_TO`. Toda arista deberá expresar una semántica aprobada.

---

#### 10. Matriz completa clase → clase

Leyenda:

- `Rnnn`: relación directa canónica;
- `INV(Rnnn)`: lectura inversa de una relación directa, no un registro adicional;
- `DERIVADA`: se obtiene recorriendo relaciones directas;
- `NO_DIRECTA`: el vínculo directo está prohibido o no aporta autoridad;
- `FUERA_DE_ALCANCE`: la semántica pertenece a la tarea indicada.

| Origen \ Destino     | ASSET                   | ENDPOINT                      | SHARED_DEVICE               | NETWORK_RESOURCE              | PRINTER                       | APPLICATION                   | TECH_SERVICE                  |
| -------------------- | ----------------------- | ----------------------------- | --------------------------- | ----------------------------- | ----------------------------- | ----------------------------- | ----------------------------- |
| **ASSET**            | `FUERA_DE_ALCANCE` NEXO | `INV(R001)`                   | `DERIVADA R001+R002`        | `INV(R006)`                   | `INV(R007)`                   | `DERIVADA R001+R005`          | `INV(R010)`                   |
| **ENDPOINT**         | `R001`                  | `FUERA_DE_ALCANCE` TI-DOM-003 | `INV(R002)`                 | `R004`                        | `INV(R009)`                   | `R005`                        | `INV(R011)`                   |
| **SHARED_DEVICE**    | `DERIVADA R002+R001`    | `R002`                        | `FUERA_DE_ALCANCE` AUTH-DEV | `DERIVADA R002+R004`          | `NO_DIRECTA`                  | `R003`                        | `INV(R012)`                   |
| **NETWORK_RESOURCE** | `R006`                  | `INV(R004)`                   | `DERIVADA R004+R002`        | `FUERA_DE_ALCANCE` TI-DOM-004 | `INV(R008)`                   | `FUERA_DE_ALCANCE` TI-DOM-006 | `INV(R013)`                   |
| **PRINTER**          | `R007`                  | `R009`                        | `NO_DIRECTA`                | `R008`                        | `FUERA_DE_ALCANCE` TI-DOM-005 | `NO_DIRECTA` — usa PRINT-ARC  | `INV(R014)`                   |
| **APPLICATION**      | `DERIVADA R005+R001`    | `INV(R005)`                   | `INV(R003)`                 | `FUERA_DE_ALCANCE` TI-DOM-006 | `NO_DIRECTA` — usa PRINT-ARC  | `FUERA_DE_ALCANCE` TI-DOM-006 | `INV(R015)`                   |
| **TECH_SERVICE**     | `R010`                  | `R011`                        | `R012`                      | `R013`                        | `R014`                        | `R015`                        | `FUERA_DE_ALCANCE` TI-DOM-006 |

Reconciliación:

```text
7 × 7 = 49 pares
49 pares con decisión explícita
0 pares sin clasificación
0 relaciones inversas duplicadas como hechos
```

---

#### 11. Reglas de cardinalidad y derivación

1. un objeto puede participar en múltiples servicios sin duplicar su identidad;
2. un `SHARED_DEVICE` no se vincula directamente a un activo cuando la relación puede demostrarse mediante su endpoint;
3. un `APPLICATION` no se vincula directamente a una impresora para decidir destino de trabajo;
4. un `PRINTER` local puede depender de un endpoint y uno de red puede no necesitarlo;
5. un `NETWORK_RESOURCE` lógico no exige un activo físico;
6. un recurso físico de red sí debe poder reconciliarse con el activo correspondiente antes de declararlo validado;
7. una relación de servicio solo existe cuando el componente participa realmente en producir o restaurar el servicio;
8. una relación derivada desaparece de la vista cuando cualquiera de sus aristas directas deja de estar vigente;
9. la vista inversa no crea un segundo hecho;
10. una relación histórica no se borra para hacer parecer que nunca existió;
11. cambiar una arista no cambia la identidad de los nodos salvo que su tarea propietaria lo determine;
12. un componente retirado puede conservar relaciones históricas pero no aparecer como dependencia vigente;
13. un conflicto de cardinalidad queda `BLOQUEADO` hasta reconciliar la fuente;
14. ninguna arista expande permisos, roles, sede, área o capacidad del actor;
15. la configuración no puede resolver autoridad por recorrido del grafo.

---

#### 12. Decisión explícita para los once servicios heredados

Los once servicios de `TI-DOM-001` se conservan sin renombrar. Esta tarea define cómo consumen el grafo; no inventa todavía las dependencias de instancias que pertenecen a tareas posteriores.

| Servicio         | Decisión de configuración                                                                                                                                                                 |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `TI-SERVICE-001` | Puede referenciar `APPLICATION`, `ENDPOINT` y `SHARED_DEVICE` para ejecutar y diagnosticar decisiones de acceso ya autorizadas. Una relación no concede acceso.                           |
| `TI-SERVICE-002` | Es el consumidor principal de las relaciones `ASSET ↔ ENDPOINT ↔ SHARED_DEVICE` y de sus relaciones con red y aplicación. El ciclo de vida del endpoint continúa en `TI-DOM-003`.         |
| `TI-SERVICE-003` | Consume `NETWORK_RESOURCE` como clase primaria y sus relaciones con activos, endpoints, impresoras y servicios. La topología real continúa en `TI-DOM-004`.                               |
| `TI-SERVICE-004` | Consume `PRINTER`, su activo físico y su conexión de red o endpoint. Cola, routing, adaptador, trabajo y resultado continúan bajo PRINT-ARC y `TI-DOM-005`.                               |
| `TI-SERVICE-005` | Consume `APPLICATION` y relaciones de dependencia que serán materializadas por ambiente y proveedor en `TI-DOM-006`. No convierte repositorio, URL o proveedor en aplicación.             |
| `TI-SERVICE-006` | Una solicitud de soporte puede referenciar cualquier clase afectada; el nodo referenciado no sustituye el caso de `VPROC-0058`.                                                           |
| `TI-SERVICE-007` | Un incidente puede referenciar varios nodos y recorrer dependencias de servicio para analizar impacto; el grafo no decide por sí mismo prioridad ni continuidad.                          |
| `TI-SERVICE-008` | Todo cambio tecnológico deberá poder identificar los nodos y relaciones afectados, conservando estado anterior y resultado; gobierno de cambio continúa en `TI-DOM-009`.                  |
| `TI-SERVICE-009` | Una prueba técnica deberá identificar qué nodo o relación fue probado y con qué versión; la prueba no modifica la fuente propietaria.                                                     |
| `TI-SERVICE-010` | Licencias, garantías, contratos y costos podrán referenciar nodos tecnológicos, pero sus objetos económicos y contractuales permanecen en ORIGO y NUMERA. Profundización en `TI-DOM-012`. |
| `TI-SERVICE-011` | Conocimiento y capacitación podrán referenciar clases, nodos o servicios como contexto; una guía no cambia configuración ni autorización.                                                 |

Balance:

```text
11 servicios esperados
11 decisiones materializadas
0 omitidos
0 renombrados
0 duplicados
```

---

#### 13. Reconciliación con el estado técnico actual

La inspección de solo lectura del estado desplegado muestra una implementación fragmentada, compatible con las brechas ya declaradas.

##### 13.1. Activos

`public.asset_items` existe y contiene identidad física, código, ubicación, responsable, marca, modelo, serial, condición, estado, propiedad, garantía y especificaciones técnicas.

Estado frente al contrato:

- `IMPLEMENTADO` parcialmente como fuente de activos;
- no existe una relación transversal actual que vincule de forma canónica `asset_items` con endpoint o dispositivo compartido;
- existen registros descriptivos de equipos tecnológicos, pero una coincidencia de nombre, sede o descripción no se acepta como equivalencia.

##### 13.2. Dispositivos compartidos

`public.shared_operational_devices` y `public.shared_operational_device_apps` existen.

Se observan:

- **2** dispositivos compartidos registrados;
- **4** vínculos dispositivo–aplicación;
- unicidad registral de código y principal técnico actual;
- relación con sede, área, plantilla y aplicaciones;
- ausencia de `endpoint_id` y `asset_id` como vínculos canónicos físicos.

Estado:

- `IMPLEMENTADO` parcialmente;
- identidad física y endpoint: `PENDIENTE_DE_EVIDENCIA`;
- el contrato de `AUTH-DEV-002` permanece la autoridad para cerrar esa brecha.

##### 13.3. Aplicaciones

`public.apps` existe con **10** códigos actuales y unicidad de `code`.

Estado:

- identidad registral: `IMPLEMENTADO`;
- disponibilidad empresarial: no se infiere desde `is_active`;
- ambientes, dependencias, proveedor, licencia y criticidad: `FUERA_DE_ALCANCE`, propietaria `TI-DOM-006`.

##### 13.4. Endpoints

No se detecta una tabla pública transversal que materialice una identidad canónica `endpoint_id` ni un vínculo endpoint–activo–dispositivo compartido.

Estado:

- contrato de identidad: `ESPECIFICADO`;
- materialización transversal: `PENDIENTE_DE_EVIDENCIA`;
- propietario documental siguiente: `TI-DOM-003` para ciclo de vida y la fase de implementación autorizada para persistencia física.

##### 13.5. Red

No se detecta una estructura pública canónica consolidada de enlaces, routers, switches, puntos de acceso, segmentos, SSID, direccionamiento y reservas como grafo tecnológico.

Estado:

- clase y relaciones transversales: `ESPECIFICADO`;
- inventario/topología real: `FUERA_DE_ALCANCE`, propietaria `TI-DOM-004`.

##### 13.6. Impresoras

PRINT-ARC conserva un inventario documental de **9** impresoras y perfiles técnicos por equipo.

La estructura desplegada no demuestra una reconciliación completa de esas nueve identidades con activos físicos de NEXO. Existen registros de activos que pueden parecer corresponder a equipos de impresión, pero nombre, marca, sede o descripción no son evidencia suficiente para fusionar identidades.

Estado:

- inventario PRINT-ARC: `ESPECIFICADO`;
- reconciliación impresora–activo: `PENDIENTE_DE_EVIDENCIA`;
- propietaria documental: `TI-DOM-005` coordinada con PRINT-ARC y NEXO.

##### 13.7. Servicios tecnológicos

`TI-SERVICE-001` a `TI-SERVICE-011` existen como catálogo documental aprobado.

No se detecta una tabla pública transversal que materialice actualmente los once servicios y sus dependencias de configuración.

Estado:

- catálogo: `ESPECIFICADO`;
- persistencia y dependencias por instancia: `FUERA_DE_ALCANCE` de esta tarea y sujetas a la fase de implementación y a `TI-DOM-006`.

##### 13.8. Resumen AS-IS

| Componente                     | Evidencia actual                                            | Estado frente al objetivo                        |
| ------------------------------ | ----------------------------------------------------------- | ------------------------------------------------ |
| activos                        | tabla física existente                                      | `IMPLEMENTADO` parcial                           |
| endpoint canónico              | contrato documental, sin persistencia transversal detectada | `ESPECIFICADO` / `PENDIENTE_DE_EVIDENCIA`        |
| dispositivo compartido         | tablas existentes, 2 instancias                             | `IMPLEMENTADO` parcial                           |
| vínculo dispositivo–aplicación | 4 filas actuales                                            | `IMPLEMENTADO` parcial                           |
| red consolidada                | no detectada como grafo canónico                            | `FUERA_DE_ALCANCE` hacia `TI-DOM-004`            |
| impresoras                     | 9 unidades documentadas por PRINT-ARC                       | `ESPECIFICADO` / reconciliación física pendiente |
| aplicaciones                   | 10 identidades registrales                                  | `IMPLEMENTADO` como catálogo de identidad        |
| servicios                      | 11 identidades documentales                                 | `ESPECIFICADO`                                   |
| grafo transversal              | no detectado                                                | `NO_APLICA` como implementación en esta tarea    |

No se interpreta esta ausencia como autorización para crear tablas o backfills durante la fase documental.

---

#### 14. Reglas de reconciliación y drift

La futura implementación deberá seguir el ciclo conceptual:

```text
LEER FUENTE PROPIETARIA
→ RESOLVER IDENTIDAD ESTABLE
→ COMPARAR PROYECCIÓN
→ COMPARAR RELACIONES DIRECTAS
→ CLASIFICAR COINCIDENCIA / FALTA / CONFLICTO
→ CONSERVAR EVIDENCIA
→ CORREGIR MEDIANTE LA TAREA Y AUTORIDAD PROPIETARIAS
→ REEVALUAR RELACIONES DERIVADAS
```

Reglas:

1. una diferencia no se corrige copiando silenciosamente un lado sobre el otro;
2. un nodo faltante en la proyección no crea el objeto fuente;
3. una relación faltante no se fabrica desde texto;
4. un serial repetido o IP repetida es señal de conflicto, no prueba de identidad;
5. un `device_code` coincidente con un activo no fusiona identidades;
6. una impresora encontrada en inventario físico no se crea automáticamente como `asset_item`;
7. una aplicación visible en un endpoint no demuestra que el servicio dependa de ella;
8. una dependencia detectada por telemetría puede proponer una relación, pero requiere fuente y evidencia;
9. la reconciliación conserva el valor anterior, el valor nuevo, el momento y la decisión;
10. los cambios que requieran escritura física se ejecutarán únicamente en su fase y paquete autorizados.

---

#### 15. Fronteras de autorización, seguridad y privacidad

1. el grafo nunca concede permiso;
2. el grafo nunca reemplaza RLS, RPC, guard, permiso o política de dispositivo;
3. la relación `SHARED_DEVICE_ALLOWS_APPLICATION` limita superficie del dispositivo y no autoriza al trabajador;
4. una relación endpoint–activo no autoriza soporte remoto;
5. una relación service–component no autoriza cambios sobre el componente;
6. un proveedor no se incorpora como autoridad por aparecer como dependencia;
7. secretos, tokens, contraseñas, códigos de recuperación y credenciales completas no son nodos ni atributos de configuración;
8. logs y telemetría pueden evidenciar relación o salud, pero no sustituyen identidad;
9. el acceso al grafo deberá respetar sensibilidad, territorio, finalidad y actor cuando se implemente;
10. la visualización de impacto no debe exponer información sensible de un recurso que el actor no puede consultar.

---

#### 16. Decisiones reservadas y propietario exacto

| Decisión                                                                                         | Propietario documental                                                      | Condición de salida                                                                                    |
| ------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| ciclo de vida, enrolamiento operativo, estándar, postura, parches, cifrado y retiro de endpoints | `TI-DOM-003`                                                                | contrato completo de endpoint antes de administración física                                           |
| taxonomía de red, topología real, segmentos, SSID, direccionamiento, monitoreo y contingencia    | `TI-DOM-004`                                                                | inventario y arquitectura aprobados antes de cambios de red                                            |
| gobierno físico de impresoras, periféricos y reconciliación con PRINT-ARC/NEXO                   | `TI-DOM-005`                                                                | identidad y relación física demostradas antes de administración productiva                             |
| ambientes, dependencias de aplicación, proveedores, licencias y criticidad por instancia         | `TI-DOM-006`                                                                | catálogo técnico aprobado antes de operación contractual del servicio                                  |
| impacto, urgencia, prioridad, SLA, escalamiento y cierre                                         | `TI-DOM-007`                                                                | matriz de servicio e incidente aprobada                                                                |
| problema, causa raíz y error conocido                                                            | `TI-DOM-008`                                                                | reglas de problema aprobadas                                                                           |
| cambios y versiones tecnológicas                                                                 | `TI-DOM-009`                                                                | gobierno de cambio aprobado                                                                            |
| salud, alertas, telemetría y logs                                                                | `TI-DOM-010`                                                                | contrato de observabilidad aprobado                                                                    |
| respaldo y recuperación técnica                                                                  | `TI-DOM-011`                                                                | política y pruebas de restauración aprobadas                                                           |
| licencias, contratos, garantías, renovación, uso y costos                                        | `TI-DOM-012`                                                                | modelo económico y contractual aprobado                                                                |
| conocimiento, capacitación y adopción                                                            | `TI-DOM-013`                                                                | contrato de conocimiento aprobado                                                                      |
| privilegios, soporte remoto, logs sensibles y segregación                                        | `TI-AUTH-001` a `TI-AUTH-004`                                               | autorización tecnológica completa antes de operación real                                              |
| implementación física del grafo y sus relaciones                                                 | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` si resulta aprobada | paquete de implementación autorizado, contratos cerrados, migraciones versionadas y pruebas aplicables |

No queda una decisión sustantiva propia de `TI-DOM-002` sin dueño documental.

---

#### 17. Criterios de aceptación

- [x] se conserva la continuidad `TI-DOM-001 → TI-DOM-002 → TI-DOM-003`;
- [x] la tarea permanece exclusivamente documental;
- [x] se definen exactamente siete clases de configuración;
- [x] activo, endpoint, dispositivo compartido, red, impresora, aplicación y servicio permanecen diferenciados;
- [x] se conservan las identidades aprobadas por sus dominios propietarios;
- [x] se definen exactamente quince relaciones directas;
- [x] los 49 pares posibles entre las siete clases tienen una decisión explícita;
- [x] las relaciones inversas no se duplican;
- [x] las relaciones derivadas no se convierten en fuente de verdad;
- [x] no existe relación genérica sin semántica;
- [x] se definen cardinalidad, vigencia, versión, evidencia y reconciliación;
- [x] se conservan los once `TI-SERVICE-*` sin omisiones ni renombres;
- [x] cada uno de los once servicios recibe una decisión explícita de consumo del grafo;
- [x] SHELL conserva identidad de aplicación;
- [x] NEXO conserva activos, ubicación, condición y custodia;
- [x] AUTH-DEV conserva identidad y autorización del dispositivo compartido;
- [x] PRINT-ARC conserva cola, routing, adaptador, trabajo y resultado;
- [x] la aplicación no se vincula directamente a una impresora para decidir routing;
- [x] un nombre, serial, IP, MAC, URL o ubicación no crean una relación por inferencia;
- [x] la inspección del estado desplegado se usa solo como diagnóstico y no altera datos;
- [x] los vacíos actuales de endpoint, red, impresora y servicios tienen propietario documental;
- [x] no se crean tablas, migraciones, datos, endpoints, redes, activos, impresoras o servicios;
- [x] no se modifica Supabase;
- [x] no se crean ni modifican requisitos de prueba;
- [x] `TI-DOM-003` permanece únicamente reservada.

---

#### 18. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la configuración tecnológica, la separación de identidades, la relación entre objetos físicos y lógicos, la correlación transversal y la reconciliación ya están protegidas por requisitos vigentes originados en las tareas de dispositivo, tecnología, NEXO e integración. Esta tarea materializa el contrato federado, las clases y las relaciones que esos requisitos ya exigen; no introduce una conducta ejecutable adicional ni cambia una condición de prueba existente.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 19. Continuidad

ÚLTIMA TAREA APROBADA
`TI-DOM-001 — Definir modelo operativo de tecnología, catálogo de servicios, propietarios y niveles de atención`

TAREA ACTUAL APROBADA
`TI-DOM-002 — Definir configuración canónica de elementos tecnológicos y relaciones entre activo, endpoint, dispositivo compartido, red, impresora, aplicación y servicio`

SIGUIENTE TAREA RESERVADA
`TI-DOM-003 — Definir ciclo de vida de computadores, celulares, tabletas y endpoints`


### [ ] TI-DOM-003 — Definir ciclo de vida de computadores, celulares, tabletas y endpoints
### [ ] TI-DOM-004 — Definir arquitectura, inventario, segmentación, direccionamiento, monitoreo y contingencia de redes
### [ ] TI-DOM-005 — Definir gobierno de impresoras y periféricos físicos frente al servicio transversal de impresión
### [ ] TI-DOM-006 — Definir catálogo de aplicaciones, ambientes, dependencias, proveedores, licencias y criticidad
### [ ] TI-DOM-007 — Definir solicitud de servicio, incidente, impacto, urgencia, prioridad, SLA, escalamiento, comunicación y cierre
### [ ] TI-DOM-008 — Definir problema, causa raíz, error conocido, workaround y prevención de recurrencia
### [ ] TI-DOM-009 — Definir cambio tecnológico, aprobación, ventana, prueba, despliegue, rollback y revisión posterior
### [ ] TI-DOM-010 — Definir monitoreo, eventos técnicos, alertas, logs, salud y observabilidad de servicios
### [ ] TI-DOM-011 — Definir respaldo, restauración, recuperación técnica y relación con continuidad empresarial
### [ ] TI-DOM-012 — Definir licencias, asientos, garantías, contratos, renovaciones, uso y costos tecnológicos
### [ ] TI-DOM-013 — Definir base de conocimiento, capacitación, adopción y comunicación de cambios tecnológicos
