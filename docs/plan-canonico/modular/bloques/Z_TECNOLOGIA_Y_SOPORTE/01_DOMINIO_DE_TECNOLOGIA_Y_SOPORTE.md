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


### [ ] TI-DOM-002 — Definir configuración canónica de elementos tecnológicos y relaciones entre activo, endpoint, dispositivo compartido, red, impresora, aplicación y servicio
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
