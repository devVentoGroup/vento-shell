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


### ✅ TI-DOM-003 — Definir ciclo de vida de computadores, celulares, tabletas y endpoints

**Estado:** APROBADA
**Tarea anterior:** `TI-DOM-002 — Definir configuración canónica de elementos tecnológicos y relaciones entre activo, endpoint, dispositivo compartido, red, impresora, aplicación y servicio` — APROBADA
**Tarea siguiente:** `TI-DOM-004 — Definir arquitectura, inventario, segmentación, direccionamiento, monitoreo y contingencia de redes` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de ciclo de vida, enrolamiento, configuración base versionada, postura, actualización, protección, mantenimiento, revocación y retiro de computadores, celulares, tabletas y endpoints administrados
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/01_DOMINIO_DE_TECNOLOGIA_Y_SOPORTE.md`
**Artefactos producidos:** `TI-ENDPOINT-LIFECYCLE-CONTRACT-001`, `TI-ENDPOINT-BASELINE-CONTRACT-001`, `TI-ENDPOINT-LIFECYCLE-TRANSITION-MATRIX-001` y `TI-ENDPOINT-ASIS-RECONCILIATION-001`
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, tablas, constraints, RLS, RPC, Edge Functions, migraciones, datos, endpoints, dispositivos, cuentas, credenciales, aplicaciones, redes, configuración de sistema operativo, cifrado, MDM, borrado remoto, despliegues ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el ciclo de vida completo de un endpoint administrado por Vento sin confundir la instalación técnica con el equipo físico, el dispositivo compartido, la cuenta técnica, el registro de notificaciones, la sesión o el trabajador que lo utiliza.

La regla raíz queda:

```text
ACTIVO FÍSICO
≠ ENDPOINT
≠ DISPOSITIVO COMPARTIDO
≠ PRINCIPAL TÉCNICO
≠ ACTOR HUMANO
≠ REGISTRO DE PUSH
≠ SESIÓN
```

El contrato deberá permitir determinar, para cualquier endpoint administrado:

- qué identidad técnica conserva;
- sobre qué activo opera cuando exista activo empresarial reconciliado;
- qué clase física y modo de uso posee;
- en qué estado de ciclo de vida se encuentra;
- qué configuración base debe cumplir;
- qué configuración fue realmente observada;
- qué postura de seguridad posee;
- qué condición de parches, cifrado, bloqueo y aplicaciones fue observada;
- si puede operar productivamente;
- qué evidencia permite afirmarlo;
- qué ocurre ante reinstalación, mantenimiento, pérdida, compromiso, reemplazo, revocación o retiro;
- qué relaciones deben cerrarse sin perder historia.

La tarea define el contrato completo. No ejecuta enrolamientos, cambios de configuración, actualizaciones, cifrado, borrados, soporte remoto ni retiros físicos.

---

#### 2. Resultado material

Se aprueban cuatro artefactos documentales:

1. `TI-ENDPOINT-LIFECYCLE-CONTRACT-001`, que define identidad, clases, modos, estados, invariantes, eventos y evidencia;
2. `TI-ENDPOINT-BASELINE-CONTRACT-001`, que define la configuración base versionada, la comparación entre estado deseado y observado y el tratamiento de excepciones;
3. `TI-ENDPOINT-LIFECYCLE-TRANSITION-MATRIX-001`, que materializa las transiciones válidas y sus guardas;
4. `TI-ENDPOINT-ASIS-RECONCILIATION-001`, que clasifica las estructuras técnicas existentes sin convertir registros parciales en endpoints canónicos.

Cobertura materializada:

| Elemento                                       | Cantidad |
| ---------------------------------------------- | -------: |
| Form factors canónicos                         |    **6** |
| Modos de uso                                   |    **3** |
| Estados de ciclo de vida                       |    **8** |
| Estados de postura                             |    **4** |
| Estados de evaluación de configuración         |    **4** |
| Estados de evaluación de actualización         |    **4** |
| Transiciones ordinarias explícitas             |   **15** |
| Familias AS-IS reconciliadas                   |    **6** |
| Estados de ciclo sin regla de entrada y salida |    **0** |
| Identidades creadas por inferencia             |    **0** |
| Cambios físicos                                |    **0** |
| Cambios de requisitos de prueba                |    **0** |

---

#### 3. Autoridades y decisiones heredadas

Esta tarea conserva sin modificación:

- la clase `ENDPOINT` aprobada en `TI-DOM-002`;
- `ENDPOINT_RUNS_ON_ASSET`, `SHARED_DEVICE_USES_ENDPOINT`, `ENDPOINT_CONNECTS_VIA_NETWORK`, `ENDPOINT_CLIENT_FOR_APPLICATION` y las relaciones de servicio aprobadas en `TI-DOM-002`;
- la identidad de activo, ubicación, condición, custodia, mantenimiento, garantía y disposición física bajo NEXO;
- la identidad de dispositivo compartido y su separación respecto de endpoint, activo, principal técnico y actor bajo `AUTH-DEV-*`;
- la regla de que una reinstalación crea un endpoint nuevo;
- la regla de que un reemplazo de hardware crea un activo y endpoint nuevos, conservando un dispositivo lógico compartido solo cuando la autoridad de `AUTH-DEV-*` lo permita expresamente;
- el catálogo de aplicaciones de SHELL;
- la propiedad de redes de `TI-DOM-004`;
- la propiedad de aplicaciones, ambientes, dependencias, proveedores y licencias de `TI-DOM-006`;
- la propiedad de incidentes y restauración de `TI-DOM-007`;
- la propiedad de cambios de `TI-DOM-009`;
- la propiedad de observabilidad de `TI-DOM-010`;
- la propiedad de recuperación técnica de `TI-DOM-011`;
- la propiedad de privilegios y soporte remoto de `TI-AUTH-*`.

Ninguna decisión de esta tarea amplía autorización empresarial.

---

#### 4. Definición canónica de endpoint

Un `ENDPOINT` es una instalación técnica administrada e identificable que ejecuta software de Vento o participa como cliente administrado dentro del ecosistema.

Un endpoint:

- posee `endpoint_id` propio;
- puede operar sobre un activo físico administrado;
- puede vincularse a un dispositivo compartido;
- puede ejecutar o presentar aplicaciones;
- puede conectarse mediante recursos de red;
- puede cambiar de custodio sin cambiar necesariamente de identidad técnica;
- puede ser reinstalado, caso en el cual la instalación anterior deja de ser el endpoint vigente;
- no obtiene autoridad empresarial por su existencia;
- no sustituye al actor humano;
- no se identifica únicamente por IP, MAC, serial, hostname, user agent, fingerprint o etiqueta.

No todo equipo físico es automáticamente un endpoint. Un activo almacenado, en reparación, retirado o aún no enrolado puede existir sin endpoint productivo.

No todo registro técnico que contiene la palabra `device` es un endpoint empresarial.

---

#### 5. Form factors canónicos

Se aprueban exactamente seis valores:

| Código                | Uso conceptual                                                                                                                   |
| --------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `COMPUTER`            | Computador de escritorio, portátil o equipo general que ejecuta un sistema operativo de propósito general.                       |
| `MOBILE`              | Celular o terminal móvil administrado.                                                                                           |
| `TABLET`              | Tableta administrada, personal o compartida.                                                                                     |
| `FIXED_TERMINAL`      | Terminal fijo dedicado a un punto operativo o estación.                                                                          |
| `KIOSK`               | Endpoint de propósito restringido con superficie de operación controlada.                                                        |
| `SPECIALIZED_STATION` | Equipo administrado destinado a una función tecnológica especializada no cubierta adecuadamente por las cinco clases anteriores. |

Reglas:

1. el form factor describe la forma de operación técnica, no la propiedad;
2. no concede sede, área, rol, permiso, aplicación ni capacidad;
3. no se deduce desde el nombre del activo;
4. cambiar de form factor exige decisión explícita y evidencia;
5. impresoras y recursos de red conservan sus clases propias y no se fuerzan dentro de estas seis categorías.

---

#### 6. Modos de uso

Se aprueban exactamente tres modos:

| Modo               | Definición                                                                                                                          |
| ------------------ | ----------------------------------------------------------------------------------------------------------------------------------- |
| `PERSONAL_MANAGED` | Endpoint administrado asignado para uso principal de una persona identificada, sin convertir la persona en identidad del endpoint.  |
| `SHARED_MANAGED`   | Endpoint administrado utilizado por múltiples actores bajo controles de dispositivo compartido, estación o identificación de actor. |
| `TECHNICAL_ONLY`   | Endpoint administrado dedicado a una función técnica sin uso empresarial directo como persona.                                      |

El form factor y el modo son dimensiones independientes.

```text
FORM_FACTOR ≠ USAGE_MODE
```

Un equipo personal no administrado por Vento no se registra como endpoint empresarial por el solo hecho de acceder a un servicio. Su tratamiento de acceso pertenece a autorización y seguridad.

---

#### 7. Identidades mínimas del contrato

El endpoint conserva conceptualmente:

```ts
type ManagedEndpoint = {
  endpoint_id: string;
  form_factor:
    | "COMPUTER"
    | "MOBILE"
    | "TABLET"
    | "FIXED_TERMINAL"
    | "KIOSK"
    | "SPECIALIZED_STATION";
  usage_mode:
    | "PERSONAL_MANAGED"
    | "SHARED_MANAGED"
    | "TECHNICAL_ONLY";
  lifecycle_state:
    | "REGISTERED"
    | "ENROLLMENT_PENDING"
    | "ENROLLED"
    | "ACTIVE"
    | "SUSPENDED"
    | "MAINTENANCE"
    | "REVOKED"
    | "RETIRED";
  asset_id: string | null;
  shared_device_id: string | null;
  installation_generation: number;
  assigned_baseline_id: string;
  assigned_baseline_version: number;
  desired_configuration_version: number;
  observed_configuration_version: number | null;
  posture_state:
    | "UNKNOWN"
    | "COMPLIANT"
    | "NONCOMPLIANT"
    | "EXCEPTION_ACTIVE";
  last_evaluated_at: string | null;
  registered_at: string;
  enrolled_at: string | null;
  activated_at: string | null;
  suspended_at: string | null;
  revoked_at: string | null;
  retired_at: string | null;
};
```

Esta forma es contractual. La arquitectura física futura podrá normalizarla sin perder identidad, estados, relaciones, versiones o historia.

---

#### 8. Estados del ciclo de vida

Se aprueban exactamente ocho estados.

| Estado               | Significado                                                                                                   | Entrada mínima                                                                                 | Restricción principal                                                    | Salida permitida                       |
| -------------------- | ------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------ | -------------------------------------- |
| `REGISTERED`         | Identidad administrativa creada, todavía sin enrolamiento técnico iniciado.                                   | alta autorizada, identidad única, clase y modo definidos                                       | no opera productivamente                                                 | `ENROLLMENT_PENDING` o `REVOKED`       |
| `ENROLLMENT_PENDING` | Existe una operación de enrolamiento abierta y controlada.                                                    | identidad previa, autorización de enrolamiento, vínculo candidato y evidencia requerida        | no se considera endpoint productivo ni conforme                          | `ENROLLED` o `REVOKED`                 |
| `ENROLLED`           | La instalación demostró la identidad y posesión exigidas, pero aún no superó todas las guardas de activación. | `endpoint_id`, generación, relaciones requeridas y prueba de enrolamiento válidas              | acceso productivo bloqueado hasta evaluación                             | `ACTIVE` o `SUSPENDED`                 |
| `ACTIVE`             | Endpoint productivo autorizado técnicamente dentro de su baseline y postura permitidos.                       | enrolamiento válido, baseline asignado, evaluación de postura y ausencia de bloqueo            | solo capacidades compatibles con su autorización y configuración vigente | `SUSPENDED`, `MAINTENANCE` o `REVOKED` |
| `SUSPENDED`          | Endpoint temporalmente impedido de operar productivamente sin destruir su identidad histórica.                | decisión de suspensión, causa y evidencia                                                      | no inicia nuevas acciones empresariales autorizadas por el endpoint      | `ACTIVE`, `MAINTENANCE` o `REVOKED`    |
| `MAINTENANCE`        | Endpoint sometido a intervención técnica controlada.                                                          | caso o cambio autorizado cuando corresponda, aislamiento apropiado y conservación de identidad | no se presume productivo; soporte no amplía privilegios                  | `ACTIVE` o `REVOKED`                   |
| `REVOKED`            | Se cerró la autoridad técnica vigente del endpoint.                                                           | revocación registrada, vínculos aplicables cerrados o invalidados                              | no vuelve a operación productiva con la misma instalación                | `RETIRED`                              |
| `RETIRED`            | Identidad de endpoint cerrada de forma terminal e histórica.                                                  | revocación previa, tratamiento de datos y disposición documentados según aplicabilidad         | no se reutiliza, reactiva ni reasigna                                    | ninguna                                |

Invariante:

```text
RETIRED = TERMINAL
```

Un estado de ciclo de vida no sustituye la condición física del activo en NEXO.

---

#### 9. `TI-ENDPOINT-LIFECYCLE-TRANSITION-MATRIX-001`

Se aprueban las transiciones ordinarias siguientes:

|  N.º | Origen               | Destino              | Guarda obligatoria                                                                  |
| ---: | -------------------- | -------------------- | ----------------------------------------------------------------------------------- |
|    1 | `REGISTERED`         | `ENROLLMENT_PENDING` | enrolamiento autorizado e identidad no conflictiva                                  |
|    2 | `REGISTERED`         | `REVOKED`            | alta cancelada o identidad invalidada con motivo                                    |
|    3 | `ENROLLMENT_PENDING` | `ENROLLED`           | prueba de posesión, identidad y vínculos mínimos demostrados                        |
|    4 | `ENROLLMENT_PENDING` | `REVOKED`            | enrolamiento cancelado, vencido, fallido o conflictivo                              |
|    5 | `ENROLLED`           | `ACTIVE`             | guardas de activación completas                                                     |
|    6 | `ENROLLED`           | `SUSPENDED`          | enrolamiento válido pero condición productiva no satisfecha                         |
|    7 | `ACTIVE`             | `SUSPENDED`          | incumplimiento, pérdida de confianza, cambio pendiente o decisión autorizada        |
|    8 | `ACTIVE`             | `MAINTENANCE`        | intervención técnica controlada                                                     |
|    9 | `ACTIVE`             | `REVOKED`            | retiro de autoridad técnica o compromiso que exige invalidación                     |
|   10 | `SUSPENDED`          | `ACTIVE`             | misma instalación, identidad vigente y revalidación completa                        |
|   11 | `SUSPENDED`          | `MAINTENANCE`        | intervención requerida para recuperar conformidad                                   |
|   12 | `SUSPENDED`          | `REVOKED`            | recuperación no permitida o autoridad terminada                                     |
|   13 | `MAINTENANCE`        | `ACTIVE`             | misma instalación, intervención cerrada y revalidación completa                     |
|   14 | `MAINTENANCE`        | `REVOKED`            | instalación sustituida, comprometida o no recuperable                               |
|   15 | `REVOKED`            | `RETIRED`            | cierre técnico, tratamiento de datos y evidencia de disposición según aplicabilidad |

No se aprueban saltos implícitos.

La recuperación desde `SUSPENDED` o `MAINTENANCE` solo conserva `endpoint_id` cuando sigue siendo la misma instalación técnica. Una reinstalación crea una identidad nueva.

---

#### 10. Guardas de enrolamiento y activación

Antes de alcanzar `ACTIVE`, la futura implementación deberá demostrar como mínimo:

1. `endpoint_id` emitido mediante proceso autorizado;
2. generación de instalación explícita;
3. relación con activo validada cuando exista activo empresarial aplicable;
4. relación con dispositivo compartido validada cuando corresponda;
5. baseline y versión asignados;
6. familia y versión de sistema operativo observadas;
7. cifrado evaluado conforme al baseline;
8. bloqueo local evaluado conforme al baseline;
9. postura evaluada;
10. aplicaciones requeridas, permitidas y prohibidas comparadas contra baseline;
11. estado de actualización observado;
12. sede, área y custodia referenciadas desde sus fuentes propietarias cuando apliquen;
13. principal técnico y vínculo de credencial válidos cuando el modelo los requiera;
14. ausencia de clon, conflicto de identidad o múltiples vínculos autoritativos;
15. timestamp y evidencia de la evaluación;
16. capacidad de soporte remoto registrada separadamente de la autorización para usarla;
17. ausencia de secretos completos en evidencias, logs o metadatos empresariales;
18. ninguna identidad creada desde coincidencia de nombre, IP, MAC, serial, hostname, user agent o fingerprint.

Una guarda desconocida que sea obligatoria no se trata como aprobada.

---

#### 11. `TI-ENDPOINT-BASELINE-CONTRACT-001`

Todo endpoint administrado deberá tener exactamente una configuración base vigente aplicable a su clase, modo y contexto.

El baseline conceptual conserva:

| Campo                              | Regla                                                    |
| ---------------------------------- | -------------------------------------------------------- |
| `baseline_id`                      | identidad estable de la familia de configuración         |
| `baseline_version`                 | versión inmutable de una definición publicada            |
| `form_factor`                      | uno de los seis form factors aprobados                   |
| `usage_mode`                       | uno de los tres modos aprobados                          |
| `supported_os_policy`              | política de familias y versiones soportadas              |
| `encryption_requirement`           | exigencia de protección de almacenamiento                |
| `lock_requirement`                 | exigencia de bloqueo local                               |
| `local_data_protection_policy`     | regla para caché, offline y datos empresariales locales  |
| `required_app_refs`                | aplicaciones o agentes obligatorios                      |
| `allowed_app_policy`               | política de software permitido                           |
| `prohibited_app_policy`            | política de software incompatible o prohibido            |
| `patch_policy_ref`                 | política versionada de actualización                     |
| `telemetry_requirement`            | señales mínimas requeridas para evaluar salud y postura  |
| `remote_support_capability_policy` | capacidades permitidas, separadas de autorización de uso |
| `recovery_policy_ref`              | política aplicable a recuperación                        |
| `wipe_policy_ref`                  | regla de borrado o inaccesibilidad cuando corresponda    |
| `evidence_requirements`            | evidencia mínima para evaluar cumplimiento               |
| `exception_policy_ref`             | autoridad, vigencia y expiración de excepciones          |

Esta tarea no fija:

- una versión mínima concreta de Windows, Android, iOS, macOS, Linux u otro sistema;
- un número de días para aplicar parches;
- una longitud de PIN;
- un algoritmo criptográfico específico;
- un proveedor de MDM;
- una herramienta de soporte remoto;
- un método físico de destrucción;
- un fabricante obligatorio.

Esos valores deben versionarse mediante su autoridad técnica y gobierno de cambio cuando la implementación sea aprobada.

---

#### 12. Estado deseado y estado observado

La administración del endpoint debe separar obligatoriamente:

```text
CONFIGURACIÓN DESEADA
≠
CONFIGURACIÓN OBSERVADA
≠
RESULTADO DE EVALUACIÓN
```

Campos conceptuales mínimos:

- baseline asignado;
- versión deseada;
- versión observada;
- fecha de observación;
- fuente de observación;
- resultado de evaluación;
- lista estructurada de desviaciones;
- excepción aplicable, si existe;
- próxima acción requerida, si corresponde.

No se sobrescribe el estado deseado con el observado ni viceversa.

Una ausencia de telemetría no equivale a cumplimiento.

---

#### 13. Evaluación de configuración

Se aprueban exactamente cuatro valores:

| Estado                   | Regla                                                                                          |
| ------------------------ | ---------------------------------------------------------------------------------------------- |
| `UNKNOWN`                | No existe evidencia suficiente o está fuera de vigencia.                                       |
| `WITHIN_ASSIGNED_POLICY` | El estado observado satisface la configuración asignada.                                       |
| `ACTION_REQUIRED`        | Existe una desviación que requiere remediación, suspensión, mantenimiento o cambio autorizado. |
| `EXCEPTION_ACTIVE`       | Existe una excepción vigente y autorizada para una desviación concreta.                        |

La excepción:

- debe tener alcance;
- debe tener motivo;
- debe tener autoridad;
- debe tener inicio y vencimiento;
- no reescribe el baseline;
- no convierte una desviación en configuración estándar;
- debe reevaluarse al expirar.

---

#### 14. Postura de seguridad

Se aprueban exactamente cuatro estados de postura:

| Estado             | Significado                                                                    |
| ------------------ | ------------------------------------------------------------------------------ |
| `UNKNOWN`          | no existe evidencia suficiente para afirmar conformidad                        |
| `COMPLIANT`        | las guardas de seguridad aplicables fueron evaluadas y satisfechas             |
| `NONCOMPLIANT`     | existe al menos un incumplimiento sin excepción válida                         |
| `EXCEPTION_ACTIVE` | existe incumplimiento conocido cubierto por una excepción vigente y autorizada |

Reglas:

1. postura y ciclo de vida son dimensiones distintas;
2. `ACTIVE` requiere normalmente `COMPLIANT` o una excepción vigente compatible con el uso productivo;
3. `UNKNOWN` no se convierte silenciosamente en conformidad;
4. `NONCOMPLIANT` no se corrige modificando únicamente el indicador;
5. una excepción no oculta el hecho técnico observado;
6. un endpoint puede permanecer identificado aunque no esté autorizado a operar;
7. la lógica específica de bloqueo por tipo de incumplimiento deberá respetar la política técnica vigente y el gobierno de cambio.

---

#### 15. Actualizaciones, parches y versión de sistema

Se aprueban cuatro resultados conceptuales de evaluación de actualización:

| Estado                   | Regla                                                           |
| ------------------------ | --------------------------------------------------------------- |
| `UNKNOWN`                | no hay evidencia suficiente de versión o nivel de actualización |
| `WITHIN_ASSIGNED_POLICY` | la versión observada cumple la política asignada                |
| `ACTION_REQUIRED`        | la versión o actualización observada requiere intervención      |
| `EXCEPTION_ACTIVE`       | existe excepción vigente para la desviación concreta            |

La política de actualización deberá distinguir:

- sistema operativo;
- firmware cuando aplique;
- componentes de seguridad;
- agentes de administración;
- aplicaciones requeridas;
- dependencias críticas.

Esta tarea no fija ventanas ni plazos. El cambio operativo de versión deberá gobernarse mediante `TI-DOM-009`, mientras que la detección y frescura de señales pertenecen a `TI-DOM-010`.

---

#### 16. Cifrado, bloqueo y datos locales

El baseline deberá expresar por separado:

- requisito de cifrado;
- estado observado de cifrado;
- requisito de bloqueo;
- estado observado de bloqueo;
- protección de caché y datos offline;
- tratamiento de datos empresariales locales ante suspensión, revocación o retiro.

Reglas:

1. un valor desconocido no se presenta como protegido;
2. una capacidad declarada por el sistema operativo no prueba que esté activa;
3. una señal local enviada por el propio cliente no basta cuando la política exige evidencia más fuerte;
4. secretos y material de recuperación no se guardan en el grafo de configuración;
5. el borrado o inaccesibilidad de datos debe registrarse como resultado real, no como intención;
6. el tratamiento de información sensible conserva las reglas de privacidad vigentes.

---

#### 17. Aplicaciones instaladas y superficie técnica

La relación `ENDPOINT_CLIENT_FOR_APPLICATION` de `TI-DOM-002` se conserva.

Para ciclo de vida:

- baseline define aplicaciones requeridas, permitidas y prohibidas;
- estado observado registra presencia, versión o ausencia cuando la evidencia lo permita;
- una aplicación instalada no concede permiso empresarial;
- una aplicación visible no demuestra uso vigente;
- una aplicación ausente no elimina su identidad del catálogo;
- una aplicación no autorizada puede producir desviación sin transformar el endpoint en actor;
- ambientes, proveedor, licencia y criticidad pertenecen a `TI-DOM-006`.

La tarea no crea un inventario de software ficticio para endpoints que todavía no existen como identidades canónicas persistidas.

---

#### 18. Salud, última comprobación y observabilidad

El endpoint deberá poder exponer referencias mínimas de salud:

- última evaluación;
- fuente de la evaluación;
- frescura de evidencia;
- disponibilidad de señales esperadas;
- postura;
- evaluación de baseline;
- evaluación de actualización;
- estado de enrolamiento;
- estado de ciclo de vida.

La semántica detallada de heartbeat, métricas, alertas, umbrales, retención, eventos y logs pertenece a `TI-DOM-010`.

Reglas:

```text
SIN TELEMETRÍA
≠
SALUDABLE

LAST_SEEN
≠
IDENTIDAD VERIFICADA

HEARTBEAT
≠
AUTORIZACIÓN
```

Un `last_seen_at` aislado no demuestra conformidad, custodia ni identidad física.

---

#### 19. Soporte remoto

La capacidad técnica y la autorización de uso se mantienen separadas.

```text
REMOTE_SUPPORT_CAPABLE
≠
REMOTE_SUPPORT_AUTHORIZED_NOW
```

El contrato debe permitir conocer:

- si la plataforma soporta asistencia remota;
- qué clase de operación puede realizar técnicamente;
- qué autorización requiere;
- qué actor la inició;
- qué caso, incidente o cambio la justifica;
- cuándo comenzó y terminó;
- qué acciones privilegiadas fueron ejecutadas;
- qué resultado produjo.

`TI-DOM-003` no concede privilegios ni define el modelo final de soporte remoto. Esas decisiones pertenecen a `TI-AUTH-*`, mientras que el caso e incidente pertenecen a `TI-DOM-007`.

---

#### 20. Custodia, sede, área y cambios de asignación

NEXO conserva la autoridad sobre activo físico, ubicación y custodia.

Reglas:

1. un cambio de custodio no crea automáticamente un endpoint nuevo;
2. un cambio de sede o área no crea automáticamente un endpoint nuevo;
3. si la instalación técnica permanece intacta y no existe conflicto, `endpoint_id` puede conservarse;
4. las relaciones territoriales, de custodia y contexto se versionan o actualizan desde sus fuentes propietarias;
5. la autorización efectiva del actor se reevalúa y no se hereda desde la configuración del endpoint;
6. si el cambio exige reinstalación, la instalación anterior deja de ser el endpoint vigente;
7. un activo sin custodio demostrado no recibe un nombre supuesto;
8. un endpoint compartido conserva además las restricciones de `AUTH-DEV-*`.

---

#### 21. Reinstalación, recuperación y reemplazo de hardware

##### 21.1. Reinstalación

Una reinstalación del sistema, recuperación que sustituye la instalación técnica o reprovisión equivalente:

```text
MISMO ACTIVO POSIBLE
+
NUEVA INSTALACIÓN
→
NUEVO endpoint_id
+
NUEVA installation_generation
```

La instalación anterior:

- deja de ser vigente;
- cierra o revoca sus vínculos técnicos;
- conserva historia;
- no puede reaparecer como `ACTIVE`.

##### 21.2. Reemplazo de hardware

Un reemplazo físico:

```text
NUEVO HARDWARE
→ NUEVO asset_id
→ NUEVO endpoint_id
→ NUEVO VÍNCULO TÉCNICO
```

El activo anterior conserva su historia y tratamiento NEXO.

Si existía un `SHARED_DEVICE`, su continuidad lógica solo podrá conservarse mediante la decisión explícita aprobada por `AUTH-DEV-*`.

##### 21.3. Recuperación sin reinstalación

Una intervención que conserva la misma instalación puede mantener `endpoint_id` únicamente si:

- identidad y vínculo permanecen verificables;
- no existe clon o ambigüedad;
- las credenciales vigentes son válidas;
- la revalidación de baseline y postura es satisfactoria;
- la autoridad técnica permite reactivación.

---

#### 22. Pérdida, robo y compromiso

Se reconocen cinco causas técnicas mínimas de escalamiento de confianza:

```text
LOST
STOLEN
SUSPECTED_COMPROMISE
CONFIRMED_COMPROMISE
CUSTODY_UNCLEAR
```

Reglas:

1. la causa se registra separada del estado de ciclo de vida;
2. el endpoint se suspende o revoca conforme a la política aplicable;
3. credenciales, sesiones o vínculos comprometidos se invalidan mediante sus autoridades propietarias;
4. un endpoint revocado no continúa ejecutando acciones empresariales con autoridad anterior;
5. borrado remoto solo se ejecutará si existe capacidad técnica y autorización explícita;
6. no se declara borrado exitoso sin evidencia del resultado;
7. si el borrado no puede ejecutarse, el resultado se registra como fallido, no disponible o pendiente de evidencia;
8. el activo físico y su custodia continúan bajo NEXO;
9. la gestión del incidente pertenece a `TI-DOM-007`;
10. la evidencia sensible conserva minimización y control de acceso.

---

#### 23. Mantenimiento y suspensión

`SUSPENDED` y `MAINTENANCE` no son sinónimos.

`SUSPENDED` expresa que la instalación no está autorizada para operar productivamente.

`MAINTENANCE` expresa que existe una intervención técnica controlada sobre la misma instalación.

Durante mantenimiento:

- se conserva identidad;
- no se presume disponibilidad;
- no se amplían privilegios;
- toda acción de cambio queda sujeta a su autoridad;
- las pruebas posteriores demuestran resultado;
- volver a `ACTIVE` exige reevaluar la instalación.

Si la intervención reinstala o sustituye la instalación, no vuelve el mismo endpoint: se crea uno nuevo.

---

#### 24. Revocación

`REVOKED` cierra la autoridad técnica de la instalación.

Como mínimo deberá:

- impedir nuevas acciones empresariales dependientes de esa identidad;
- cerrar o invalidar vínculos técnicos aplicables;
- revocar credenciales y sesiones conforme a sus autoridades;
- cerrar relaciones vigentes cuando dejen de ser válidas;
- impedir que una cola offline o cliente con estado anterior recupere autoridad;
- conservar evidencia del motivo, actor, fecha y correlación;
- preservar historia de activo, endpoint, dispositivo compartido, soporte y cambios.

Revocación no equivale a destrucción del equipo físico ni a eliminación de evidencia.

---

#### 25. Retiro seguro

`RETIRED` es terminal.

Antes de declarar un endpoint retirado, la evidencia deberá resolver según aplicabilidad:

1. revocación técnica previa;
2. cierre de credenciales o bindings vigentes;
3. cierre de relaciones productivas actuales;
4. tratamiento de caché y datos empresariales locales;
5. borrado o inaccesibilidad criptográfica cuando la política y plataforma lo exijan;
6. resultado real del borrado, si se ejecutó;
7. preservación de la evidencia que deba retenerse;
8. destino del activo físico bajo NEXO;
9. cierre o transición del dispositivo compartido bajo `AUTH-DEV-*` cuando aplique;
10. motivo, actor, timestamp y correlación.

Prohibiciones:

- reutilizar `endpoint_id`;
- reactivar un endpoint retirado;
- presentar una intención de wipe como wipe exitoso;
- eliminar historia para simular un retiro limpio;
- usar el retiro de endpoint para eliminar indebidamente el activo físico.

---

#### 26. Eventos conceptuales mínimos

La futura implementación deberá poder auditar, como mínimo:

```text
endpoint_registered
endpoint_enrollment_started
endpoint_enrolled
endpoint_activated
endpoint_suspended
endpoint_entered_maintenance
endpoint_returned_to_service
endpoint_baseline_assigned
endpoint_baseline_evaluated
endpoint_posture_changed
endpoint_update_evaluated
endpoint_custody_reference_changed
endpoint_site_reference_changed
endpoint_remote_support_started
endpoint_remote_support_finished
endpoint_loss_reported
endpoint_compromise_reported
endpoint_revoked
endpoint_reinstalled
endpoint_hardware_replaced
endpoint_wipe_requested
endpoint_wipe_result_recorded
endpoint_retired
```

Los nombres físicos definitivos podrán versionarse, pero no deberán perder:

- `endpoint_id`;
- actor administrativo o técnico;
- timestamp;
- motivo;
- estado anterior y posterior;
- baseline y versión aplicables;
- evidencia;
- correlación con caso, incidente, cambio o retiro cuando corresponda.

Los eventos no deben almacenar secretos ni payloads sensibles completos.

---

#### 27. Evidencia mínima por etapa

| Etapa         | Evidencia mínima                                                                                          |
| ------------- | --------------------------------------------------------------------------------------------------------- |
| registro      | identidad emitida, clase, modo, actor creador y fuente                                                    |
| enrolamiento  | operación autorizada, prueba de posesión, generación y vínculos                                           |
| activación    | baseline, estado observado, postura, actualización, cifrado, bloqueo, apps y timestamp                    |
| operación     | última evaluación, cambios de relación y excepciones vigentes                                             |
| suspensión    | causa, autoridad, fecha y condición de salida                                                             |
| mantenimiento | caso o cambio relacionado cuando aplique, intervención y prueba posterior                                 |
| revocación    | motivo, vínculos cerrados, credenciales/sesiones tratadas y correlación                                   |
| retiro        | tratamiento de datos, resultado de wipe cuando aplique, relaciones cerradas y destino físico referenciado |

Una evidencia puede ser automática, manual controlada o híbrida según el control. La clasificación definitiva de mecanismos y retención pertenece a las tareas de observabilidad, seguridad y evidencia correspondientes.

---

#### 28. Matriz de aplicabilidad por form factor

Las seis clases consumen el mismo ciclo de vida. Lo que cambia es el baseline asignado, no la semántica de identidad.

| Form factor           | Puede usar `PERSONAL_MANAGED`               | Puede usar `SHARED_MANAGED`                                  | Puede usar `TECHNICAL_ONLY`       | Regla                                                 |
| --------------------- | ------------------------------------------- | ------------------------------------------------------------ | --------------------------------- | ----------------------------------------------------- |
| `COMPUTER`            | sí, si está administrado                    | sí, si existe control compartido aprobado                    | sí, si cumple una función técnica | no inferir modo desde el nombre                       |
| `MOBILE`              | sí, si está administrado                    | sí, solo mediante decisión explícita y controles compatibles | sí, si está dedicado técnicamente | propiedad personal no equivale a no gestionado        |
| `TABLET`              | sí, si está administrado                    | sí, mediante controles compartidos aplicables                | sí, si se dedica técnicamente     | una tableta observada no crea endpoint por inferencia |
| `FIXED_TERMINAL`      | sí, solo si la asignación real lo justifica | sí                                                           | sí                                | condición fija no concede permisos                    |
| `KIOSK`               | no se presume; requiere decisión explícita  | sí                                                           | sí                                | superficie restringida no sustituye autorización      |
| `SPECIALIZED_STATION` | no se presume; requiere decisión explícita  | sí, cuando la operación lo justifique                        | sí                                | especialización no autoriza capacidades empresariales |

Esta matriz define posibilidades contractuales, no crea instancias.

---

#### 29. `TI-ENDPOINT-ASIS-RECONCILIATION-001`

La inspección técnica disponible se clasifica sin fusionar registros.

| Fuente o familia actual                          | Qué representa                                                                                                                | Estado frente al contrato de endpoint               | Decisión                                                                               |
| ------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------- | -------------------------------------------------------------------------------------- |
| `public.asset_items` y estructuras asociadas     | activos físicos, ubicación, custodia, condición, mantenimiento y otros atributos físicos                                      | `IMPLEMENTADO` parcial como fuente de activo        | conservar como autoridad física; no convertir cada activo en endpoint                  |
| `public.shared_operational_devices` y relaciones | dispositivo compartido lógico, principal técnico legacy, sitio, área, plantilla, aplicaciones y flags de actor                | `IMPLEMENTADO` parcial como dispositivo compartido  | conservar identidad separada; falta vínculo canónico con endpoint y activo             |
| `public.employee_devices`                        | registro orientado a token/dispositivo de notificación del empleado                                                           | `NO_APLICA` como identidad empresarial de endpoint  | no promover ni reutilizar como endpoint por nombre                                     |
| `public.wallet_devices`                          | identidad técnica acotada al dominio PASS/wallet                                                                              | `NO_APLICA` como endpoint empresarial transversal   | conservar alcance de dominio                                                           |
| `public.pos_table_call_devices`                  | dispositivo acotado a llamadas o interacción de mesa                                                                          | `NO_APLICA` como endpoint empresarial transversal   | conservar alcance de negocio                                                           |
| persistencia transversal de endpoint             | no se detectó un modelo público consolidado con `endpoint_id`, lifecycle, baseline, postura y relación con activo/dispositivo | `PENDIENTE_DE_EVIDENCIA` para implementación física | el contrato queda `ESPECIFICADO`; implementación posterior requiere paquete autorizado |

Diagnóstico AS-IS:

- existe fuente física de activos;
- existen registros técnicos de propósito específico;
- existe registro parcial de dispositivos compartidos;
- no se declara implementado un ciclo de vida empresarial de endpoint por ensamblar esas estructuras;
- no se fusionan identidades por nombre, sede, serial, IP, descripción o usuario;
- no se crean backfills en esta tarea.

---

#### 30. Tratamiento de los dos dispositivos compartidos ya documentados

Los dos dispositivos compartidos existentes permanecen bajo su identidad aprobada y no reciben `endpoint_id` por inferencia.

Para cada uno:

```text
SHARED_DEVICE EXISTENTE
+
AUSENCIA DE ENDPOINT CANÓNICO DEMOSTRADO
→
NO CREAR ENDPOINT
→
PENDIENTE_DE_EVIDENCIA PARA ENROLAMIENTO Y RECONCILIACIÓN
```

La futura implementación deberá:

- resolver el activo físico cuando aplique;
- crear o enrolar el endpoint mediante proceso autorizado;
- demostrar el vínculo `SHARED_DEVICE_USES_ENDPOINT`;
- conservar la identidad lógica existente;
- no reutilizar `auth_user_id` como endpoint;
- no interpretar `last_seen_at` como prueba de identidad;
- no alterar la autoridad empresarial del actor.

---

#### 31. Invariantes

1. activo, endpoint, dispositivo compartido, principal técnico, actor y registro de push son identidades distintas.
2. `endpoint_id` es estable únicamente durante la vida de una instalación técnica.
3. una reinstalación crea endpoint nuevo.
4. un reemplazo de hardware crea activo y endpoint nuevos.
5. un cambio de custodio puede conservar endpoint si la instalación no cambia.
6. un cambio de sede o área no concede autoridad.
7. una IP, MAC, serial, hostname o fingerprint no son raíz única de confianza.
8. un endpoint no se autodeclara válido.
9. un registro técnico de propósito específico no se promueve automáticamente a endpoint.
10. form factor y modo de uso son dimensiones independientes.
11. baseline deseado y estado observado permanecen separados.
12. una excepción no reescribe el baseline.
13. una ausencia de telemetría no equivale a conformidad.
14. `ACTIVE` no elimina la obligación de autorización del actor.
15. mantenimiento no amplía privilegios.
16. revocación cierra autoridad pero preserva historia.
17. retiro es terminal.
18. el identificador retirado no se reutiliza.
19. un wipe no se declara ejecutado sin evidencia.
20. NEXO conserva el activo físico y su disposición.
21. `AUTH-DEV-*` conserva el dispositivo compartido.
22. `TI-DOM-009` conserva gobierno de cambio.
23. `TI-DOM-010` conserva observabilidad detallada.
24. `TI-AUTH-*` conserva privilegios y soporte remoto.
25. ninguna decisión documental de esta tarea modifica Supabase o dispositivos.

---

#### 32. Cobertura de requisitos vigente

La tarea consume requisitos ya incorporados que protegen, entre otros aspectos:

- separación entre `device_id`, `endpoint_id`, `asset_id`, principal técnico, plantilla y actor;
- enrolamiento con prueba de posesión;
- reinstalación con endpoint nuevo;
- reemplazo físico con nueva identidad técnica;
- revocación y ausencia de acceso residual;
- identidad, configuración, postura, cifrado, bloqueo, aplicaciones, parches, última comprobación y retiro;
- inventario físico, custodia, garantía, mantenimiento y retiro del activo;
- correlación segura entre endpoint, dispositivo, activo, aplicación, servicio e integración;
- operación de soporte y telemetría sin exponer secretos.

La cobertura existente es suficiente para el comportamiento definido aquí. No se cambia ninguna condición de prueba.

---

#### 33. Decisiones reservadas y propietario exacto

| Decisión                                                                               | Propietario documental                                                      | Condición de salida                                                                  |
| -------------------------------------------------------------------------------------- | --------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| topología, inventario, segmentación, direccionamiento, monitoreo y contingencia de red | `TI-DOM-004`                                                                | arquitectura de red aprobada antes de cambios físicos                                |
| gobierno de impresoras y periféricos                                                   | `TI-DOM-005`                                                                | reconciliación física y administración aprobadas                                     |
| aplicaciones, ambientes, dependencias, proveedores, licencias y criticidad             | `TI-DOM-006`                                                                | catálogo tecnológico detallado aprobado                                              |
| solicitud, incidente, impacto, prioridad, SLA, escalamiento y cierre                   | `TI-DOM-007`                                                                | contrato de mesa e incidente aprobado                                                |
| problema y causa raíz                                                                  | `TI-DOM-008`                                                                | modelo de problema aprobado                                                          |
| cambios de baseline, versión, configuración y despliegue                               | `TI-DOM-009`                                                                | gobierno de cambio aprobado                                                          |
| heartbeat, eventos, métricas, alertas, logs y frescura                                 | `TI-DOM-010`                                                                | contrato de observabilidad aprobado                                                  |
| backup, restauración y recuperación técnica                                            | `TI-DOM-011`                                                                | política de recuperación aprobada                                                    |
| licencias, garantías, contratos, renovaciones y costos                                 | `TI-DOM-012`                                                                | modelo contractual y económico aprobado                                              |
| conocimiento y adopción                                                                | `TI-DOM-013`                                                                | contrato de conocimiento aprobado                                                    |
| soporte remoto privilegiado, secretos, sesiones elevadas y segregación                 | `TI-AUTH-001` a `TI-AUTH-004`                                               | autorización tecnológica completa                                                    |
| identidad, sesión, revocación y límites de dispositivo compartido                      | `AUTH-DEV-*`                                                                | contratos de dispositivo compartido consumidos por la implementación                 |
| activo físico, ubicación, custodia, mantenimiento y disposición                        | NEXO                                                                        | evidencia física y proceso de activo aplicable                                       |
| persistencia física de endpoint, baseline, postura y transiciones                      | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` si resulta aprobada | paquete autorizado, contratos cerrados, migraciones versionadas y pruebas aplicables |

No queda un pendiente sustantivo propio de `TI-DOM-003` sin propietario documental.

---

#### 34. Criterios de aceptación

- [x] se conserva la continuidad `TI-DOM-002 → TI-DOM-003 → TI-DOM-004`;
- [x] la tarea permanece exclusivamente documental;
- [x] se define una identidad de endpoint separada de activo, dispositivo compartido, actor y registro de push;
- [x] se definen exactamente seis form factors;
- [x] se definen exactamente tres modos de uso;
- [x] se definen exactamente ocho estados de ciclo de vida;
- [x] cada estado posee entrada, restricción y salida;
- [x] se materializan quince transiciones ordinarias;
- [x] `RETIRED` es terminal;
- [x] se definen exactamente cuatro estados de postura;
- [x] se separan configuración deseada, observada y evaluación;
- [x] se define baseline versionado;
- [x] se definen guardas de enrolamiento y activación;
- [x] se definen cifrado, bloqueo, aplicaciones y actualización sin inventar valores físicos;
- [x] se conserva la separación entre capacidad y autorización de soporte remoto;
- [x] se define tratamiento de cambio de custodio y sede;
- [x] se define reinstalación con endpoint nuevo;
- [x] se define reemplazo de hardware con activo y endpoint nuevos;
- [x] se define tratamiento de pérdida, robo y compromiso;
- [x] se define revocación sin borrado de historia;
- [x] se define retiro terminal y evidencia de wipe cuando aplique;
- [x] se materializa una reconciliación AS-IS de seis familias técnicas;
- [x] no se promueve `employee_devices`, `wallet_devices` ni `pos_table_call_devices` a endpoint canónico;
- [x] los dos dispositivos compartidos documentados no reciben endpoint por inferencia;
- [x] no se crean datos, tablas, migraciones, configuraciones, endpoints ni cuentas;
- [x] no se modifica Supabase;
- [x] no se crean ni modifican requisitos de prueba;
- [x] `TI-DOM-004` permanece únicamente reservada.

---

#### 35. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el ciclo de vida de endpoint, la separación de identidades, el enrolamiento, la reinstalación, el reemplazo, la postura, la configuración, la actualización, el cifrado, el bloqueo, la revocación, el retiro y la correlación con activos y dispositivos ya están protegidos por requisitos canónicos vigentes. Esta tarea materializa el contrato documental que esos requisitos deben consumir sin introducir una conducta ejecutable nueva ni modificar una condición de prueba existente.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 36. Continuidad

ÚLTIMA TAREA APROBADA
`TI-DOM-002 — Definir configuración canónica de elementos tecnológicos y relaciones entre activo, endpoint, dispositivo compartido, red, impresora, aplicación y servicio`

TAREA ACTUAL APROBADA
`TI-DOM-003 — Definir ciclo de vida de computadores, celulares, tabletas y endpoints`

SIGUIENTE TAREA RESERVADA
`TI-DOM-004 — Definir arquitectura, inventario, segmentación, direccionamiento, monitoreo y contingencia de redes`


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
