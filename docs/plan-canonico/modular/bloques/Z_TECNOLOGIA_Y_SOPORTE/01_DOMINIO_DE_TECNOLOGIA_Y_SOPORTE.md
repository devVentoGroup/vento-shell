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


### ✅ TI-DOM-004 — Definir arquitectura, inventario, segmentación, direccionamiento, monitoreo y contingencia de redes

**Estado:** APROBADA
**Tarea anterior:** `TI-DOM-003 — Definir ciclo de vida de computadores, celulares, tabletas y endpoints` — APROBADA
**Tarea siguiente:** `TI-DOM-005 — Definir gobierno de impresoras y periféricos físicos frente al servicio transversal de impresión` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de arquitectura, inventario, topología, segmentación, direccionamiento, observabilidad requerida y contingencia de redes
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/01_DOMINIO_DE_TECNOLOGIA_Y_SOPORTE.md`
**Cambios físicos autorizados:** ninguno; no crea ni modifica redes, enlaces, routers, switches, puntos de acceso, segmentos, VLAN, SSID, DHCP, DNS, direccionamiento, reservas, firewalls, cableado, configuraciones, proveedores, código, tablas, migraciones, datos ni Supabase
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el modelo canónico mediante el cual Vento administrará redes y conectividad sin convertir una dirección IP, un SSID, una MAC, un nombre de equipo, una marca o una configuración observada en identidad empresarial.

La red deberá poder responder de forma trazable:

- qué recurso de red existe;
- cuál es su identidad estable;
- en qué sede o alcance participa;
- qué activo físico lo materializa cuando corresponda;
- qué servicio tecnológico depende de él;
- cómo se conecta con otros recursos;
- qué segmento y límite de confianza representa;
- qué política de direccionamiento utiliza;
- qué configuración deseada y observada posee;
- qué señales permiten conocer su estado;
- qué alternativa existe ante una falla;
- qué cambio produjo una desviación;
- qué evidencia permite declarar una relación, recuperación o retiro.

Regla raíz:

```text
RECURSO DE RED
≠ ACTIVO FÍSICO
≠ ENDPOINT
≠ DIRECCIÓN IP
≠ DIRECCIÓN MAC
≠ SSID
≠ PROVEEDOR
≠ SERVICIO TECNOLÓGICO
```

La tarea define el contrato completo. No afirma que la infraestructura física actual ya cumpla el diseño.

---

#### 2. Resultado material

Se aprueban seis artefactos documentales:

1. `TI-NETWORK-ARCHITECTURE-CONTRACT-001`;
2. `TI-NETWORK-RESOURCE-INVENTORY-001`;
3. `TI-NETWORK-SEGMENTATION-MATRIX-001`;
4. `TI-NETWORK-ADDRESSING-CONTRACT-001`;
5. `TI-NETWORK-MONITORING-HANDOFF-001`;
6. `TI-NETWORK-CONTINGENCY-MATRIX-001`.

Cobertura materializada:

| Elemento                                    |     Cantidad |
| ------------------------------------------- | -----------: |
| Subtipos canónicos de `NETWORK_RESOURCE`    |        **7** |
| Capas arquitectónicas                       |        **6** |
| Relaciones internas de topología            |        **6** |
| Finalidades de segmentación                 |        **6** |
| Pares de finalidades distintos clasificados | **15 de 15** |
| Modos de asignación de dirección            |        **4** |
| Perfiles de señales por subtipo             |   **7 de 7** |
| Modos de falla de red                       |        **8** |
| Estrategias de contingencia permitidas      |        **5** |
| Instancias AS-IS declaradas `VALIDADO`      |        **0** |
| Cambios físicos                             |        **0** |
| Cambios de requisitos de prueba             |        **0** |

---

#### 3. Autoridades y decisiones heredadas

Se conservan sin modificación:

- `TI-SERVICE-003 — Redes y conectividad` como familia de servicio tecnológico;
- la clase `NETWORK_RESOURCE` de `TI-DOM-002`;
- `ENDPOINT_CONNECTS_VIA_NETWORK`;
- `NETWORK_RESOURCE_RUNS_ON_ASSET`;
- `PRINTER_CONNECTS_VIA_NETWORK`;
- `SERVICE_DEPENDS_ON_NETWORK`;
- la identidad y ciclo de vida del activo físico bajo NEXO;
- la identidad y ciclo del endpoint bajo `TI-DOM-003`;
- el dispositivo compartido bajo `AUTH-DEV-*`;
- la identidad de impresora y el routing de trabajos bajo PRINT-ARC;
- la propiedad de aplicaciones, ambientes, proveedores y dependencias bajo `TI-DOM-006`;
- el gobierno de incidentes bajo `TI-DOM-007`;
- el gobierno de cambios bajo `TI-DOM-009`;
- la semántica detallada de métricas, logs, alertas y SLI bajo `TI-DOM-010`;
- respaldo, restauración y recuperación técnica bajo `TI-DOM-011`;
- contratos, costos y renovaciones bajo `TI-DOM-012`;
- privilegios y soporte técnico elevado bajo `TI-AUTH-*`;
- los perfiles no funcionales de red, hardware, observabilidad y operación degradada ya aprobados.

La arquitectura de red no concede permisos empresariales ni sustituye autorización, RLS, contexto de actor o límites del dispositivo.

---

#### 4. Subtipos canónicos de `NETWORK_RESOURCE`

Se aprueban exactamente siete subtipos.

| Subtipo               | Semántica                                                                                      | Naturaleza                                            | Relación física                                                                                                         |
| --------------------- | ---------------------------------------------------------------------------------------------- | ----------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `NETWORK_LINK`        | enlace externo, intersede o de transporte cuya disponibilidad afecta conectividad              | lógica y contractual con posibles componentes físicos | no se infiere un activo; se referencia evidencia del enlace y, si existe equipo físico propio, sus relaciones separadas |
| `ROUTER`              | nodo que ejecuta routing y, cuando corresponda, funciones de borde                             | física/técnica                                        | deberá reconciliarse con un activo antes de quedar físicamente validado                                                 |
| `SWITCH`              | nodo de conmutación que transporta conectividad entre interfaces y segmentos                   | física/técnica                                        | deberá reconciliarse con un activo antes de quedar físicamente validado                                                 |
| `ACCESS_POINT`        | nodo de acceso inalámbrico que presenta uno o más SSID                                         | física/técnica                                        | deberá reconciliarse con un activo antes de quedar físicamente validado                                                 |
| `SEGMENT`             | límite lógico de conectividad; puede materializarse mediante VLAN u otro mecanismo equivalente | lógica                                                | no exige activo propio                                                                                                  |
| `SSID`                | identidad lógica de una superficie inalámbrica y su finalidad                                  | lógica                                                | se relaciona con puntos de acceso; no es el punto de acceso                                                             |
| `ADDRESS_RESERVATION` | asignación estable y gobernada dentro de un plan de direccionamiento                           | lógica                                                | referencia un objetivo; no se convierte en identidad del objetivo                                                       |

No se crea un subtipo genérico para almacenar cualquier elemento no clasificado.

---

#### 5. Identidad canónica

Toda instancia futura de red conservará:

```text
network_resource_id
network_resource_type
canonical_label
site_reference
area_reference_when_applicable
asset_reference_when_applicable
service_reference
lifecycle_reference
configuration_baseline_id
configuration_version
observed_configuration_version
segmentation_purpose_when_applicable
addressing_profile_reference
monitoring_profile_reference
contingency_profile_reference
evidence_references
last_observed_at
last_reconciled_at
reconciliation_state
```

Reglas:

1. `network_resource_id` es la raíz estable de identidad;
2. IP, MAC, serial, SSID visible, hostname y nombre del proveedor son atributos o evidencias, no la identidad;
3. el mismo equipo físico no se duplica para representar cada interfaz;
4. un segmento lógico no se convierte en activo;
5. un SSID no se convierte en punto de acceso;
6. una reserva no se convierte en endpoint o impresora;
7. un cambio de dirección no crea por sí mismo un recurso nuevo;
8. un reemplazo físico conserva historia y utiliza las reglas del activo correspondiente;
9. toda relación debe conservar vigencia, evidencia y reconciliación;
10. secretos de administración, PSK, certificados privados, tokens y credenciales completas no forman parte del inventario.

---

#### 6. `TI-NETWORK-ARCHITECTURE-CONTRACT-001`

La arquitectura se organiza en seis capas conceptuales.

| Capa                           | Responsabilidad                                                      | Objetos principales                  |
| ------------------------------ | -------------------------------------------------------------------- | ------------------------------------ |
| `EXTERNAL_CONNECTIVITY`        | entrada o salida hacia proveedor, Internet o transporte intersede    | `NETWORK_LINK`                       |
| `EDGE_AND_ROUTING`             | terminación de enlaces, routing y límites técnicos de borde          | `ROUTER`                             |
| `DISTRIBUTION_AND_ACCESS`      | distribución cableada y acceso físico de red                         | `SWITCH`                             |
| `WIRELESS_ACCESS`              | acceso radio y emisión de superficies inalámbricas                   | `ACCESS_POINT`, `SSID`               |
| `LOGICAL_SEGMENTATION`         | aislamiento, finalidad, gateway lógico y dominio de direccionamiento | `SEGMENT`                            |
| `CONSUMPTION_AND_DEPENDENCIES` | consumo por endpoints, impresoras y servicios                        | relaciones heredadas de `TI-DOM-002` |

Una implementación puede combinar funciones en un mismo equipo físico, pero las responsabilidades lógicas permanecen separadas.

---

#### 7. Relaciones internas de topología

Se aprueban seis relaciones internas.

| ID               | Relación                         | Origen → destino                             | Regla                                                                                  |
| ---------------- | -------------------------------- | -------------------------------------------- | -------------------------------------------------------------------------------------- |
| `TI-NET-REL-001` | `LINK_TERMINATES_ON_ROUTER`      | `NETWORK_LINK → ROUTER`                      | registra la terminación lógica o técnica del enlace; no presupone propiedad del equipo |
| `TI-NET-REL-002` | `NETWORK_UPLINK`                 | `ROUTER/SWITCH/ACCESS_POINT → ROUTER/SWITCH` | expresa un uplink físico o lógico comprobado; dirección inversa es una vista           |
| `TI-NET-REL-003` | `SEGMENT_PRESENT_ON_NODE`        | `SEGMENT → ROUTER/SWITCH`                    | declara dónde existe o se transporta el segmento; no se deriva de texto aislado        |
| `TI-NET-REL-004` | `SSID_BROADCAST_BY_AP`           | `SSID → ACCESS_POINT`                        | un SSID puede ser emitido por varios AP sin duplicar su identidad lógica               |
| `TI-NET-REL-005` | `SSID_MAPS_TO_SEGMENT`           | `SSID → SEGMENT`                             | cada proyección activa del SSID debe resolver el segmento esperado                     |
| `TI-NET-REL-006` | `RESERVATION_BELONGS_TO_SEGMENT` | `ADDRESS_RESERVATION → SEGMENT`              | la reserva pertenece a un dominio de direccionamiento explícito                        |

Una relación solo queda `VALIDADO` cuando existe evidencia suficiente de ambos extremos y del vínculo.

---

#### 8. Reglas de topología

1. la topología es una colección versionada de nodos y relaciones, no un diagrama sin fuente;
2. una conexión observada no crea identidad por sí sola;
3. la ausencia de una arista esperada produce drift, no una relación inventada;
4. una interfaz desconectada no elimina historia;
5. un uplink redundante se representa como relación adicional, no como comentario;
6. una conexión física y un camino lógico pueden diferir y deben poder diagnosticarse por separado;
7. el mismo segmento puede estar presente en varios nodos;
8. el mismo SSID puede emitirse desde varios AP;
9. un SSID no podrá mapearse silenciosamente a un segmento distinto;
10. una dirección repetida o una MAC observada en dos lugares es conflicto a investigar, no mecanismo de fusión;
11. los cambios de topología deberán quedar correlacionados con el gobierno de cambio;
12. la topología histórica se conserva para diagnóstico y reconstrucción de incidentes.

---

#### 9. `TI-NETWORK-RESOURCE-INVENTORY-001`

El inventario no se limita a equipos físicos. Debe contener cada instancia de los siete subtipos cuando exista evidencia suficiente.

Cada fila deberá conservar como mínimo:

| Dimensión        | Contenido requerido                                   |
| ---------------- | ----------------------------------------------------- |
| identidad        | `network_resource_id`, subtipo y etiqueta humana      |
| alcance          | sede, área o alcance técnico aplicable                |
| fuente           | origen que demuestra la existencia                    |
| activo           | referencia NEXO cuando sea un elemento físico         |
| proveedor        | referencia cuando corresponda, sin duplicar contrato  |
| topología        | relaciones directas vigentes                          |
| finalidad        | uso técnico o propósito de segmentación               |
| direccionamiento | perfil y referencias, nunca secreto                   |
| configuración    | baseline, versión deseada y observada                 |
| capacidad        | perfil de capacidad o límites conocidos               |
| salud            | referencia a señales disponibles                      |
| contingencia     | perfil de alternativa aplicable                       |
| cambio           | última decisión o cambio correlacionado cuando exista |
| evidencia        | evidencia técnica suficiente y fecha                  |
| reconciliación   | estado y última reconciliación                        |

No se permite usar un campo libre de metadatos como sustituto indefinido de estas dimensiones.

---

#### 10. Línea base AS-IS del inventario

Las fuentes técnicas verificables actuales no permiten declarar una instancia física o lógica de `NETWORK_RESOURCE` como `VALIDADO`.

La línea base queda:

| Subtipo               | Instancias `VALIDADO` | Estado AS-IS             | Insumo faltante para validar una instancia                                              |
| --------------------- | --------------------: | ------------------------ | --------------------------------------------------------------------------------------- |
| `NETWORK_LINK`        |                 **0** | `PENDIENTE_DE_EVIDENCIA` | identidad del enlace, sede/alcance, proveedor o fuente técnica, terminación y evidencia |
| `ROUTER`              |                 **0** | `PENDIENTE_DE_EVIDENCIA` | activo reconciliado, identidad técnica, sede, interfaces, configuración y evidencia     |
| `SWITCH`              |                 **0** | `PENDIENTE_DE_EVIDENCIA` | activo reconciliado, identidad técnica, uplinks, segmentos y evidencia                  |
| `ACCESS_POINT`        |                 **0** | `PENDIENTE_DE_EVIDENCIA` | activo reconciliado, identidad técnica, uplink, SSID emitidos y evidencia               |
| `SEGMENT`             |                 **0** | `PENDIENTE_DE_EVIDENCIA` | identidad lógica, finalidad, dominio de direccionamiento y presencia demostrada         |
| `SSID`                |                 **0** | `PENDIENTE_DE_EVIDENCIA` | identidad lógica, finalidad, AP emisores, segmento y política de acceso                 |
| `ADDRESS_RESERVATION` |                 **0** | `PENDIENTE_DE_EVIDENCIA` | segmento, objetivo, valor gobernado, origen y vigencia                                  |

Reconciliación:

```text
7 subtipos esperados
7 subtipos clasificados
0 instancias canónicas validadas
0 instancias creadas por inferencia
0 subtipos sin decisión
```

La ausencia de instancias validadas no afirma que no exista infraestructura física en las sedes. Afirma que las fuentes actuales no suministran identidad, topología y evidencia suficientes para registrarla canónicamente sin inventar datos.

---

#### 11. Evidencia AS-IS conservada

El diagnóstico actual conserva estas conclusiones:

- existe `asset_items` como fuente física general, pero no demuestra por sí sola qué activos son recursos de red;
- no se detecta una estructura pública transversal dedicada a enlaces, routers, switches, puntos de acceso, segmentos, SSID o reservas;
- no se detectan columnas públicas canónicas dedicadas a VLAN, SSID, DHCP, IP, MAC, gateway, subnet o CIDR;
- los registros de activos y perfiles de activo visibles no permiten declarar recursos de red por coincidencia de nombre, marca o modelo;
- el grafo transversal de red continúa sin persistencia física canónica detectada;
- `TI-DOM-002` ya especificó la clase y las relaciones externas, pero no la topología real;
- la materialización física del inventario requiere evidencia de campo y un paquete de implementación autorizado.

No se hará backfill desde texto libre, notas, seriales, nombres comerciales o descripciones.

---

#### 12. Estados de reconciliación

Se consumen los estados canónicos vigentes:

| Estado                   | Aplicación en red                                                           |
| ------------------------ | --------------------------------------------------------------------------- |
| `ESPECIFICADO`           | el contrato, subtipo, relación o política está definido documentalmente     |
| `IMPLEMENTADO`           | existe una estructura o configuración que materializa parte del contrato    |
| `VALIDADO`               | identidad, relación o configuración fue comprobada con evidencia suficiente |
| `BLOQUEADO`              | conflicto, duplicidad o falta de prerrequisito impide usar el dato          |
| `PENDIENTE_DE_EVIDENCIA` | existe una posibilidad o referencia incompleta, pero no prueba suficiente   |
| `NO_APLICA`              | el dato o relación no corresponde al subtipo                                |
| `FUERA_DE_ALCANCE`       | la decisión pertenece expresamente a otra tarea                             |

Un recurso no pasa a `VALIDADO` por antigüedad, conectividad aparente o ausencia de incidentes.

---

#### 13. Finalidades canónicas de segmentación

Se aprueban exactamente seis finalidades heredadas de la decisión empresarial de redes.

| Finalidad        | Uso                                                                                                |
| ---------------- | -------------------------------------------------------------------------------------------------- |
| `GUEST`          | conectividad de invitados o actores no administrados                                               |
| `ADMINISTRATION` | estaciones y endpoints administrativos autorizados                                                 |
| `OPERATIONS`     | dispositivos que ejecutan procesos operativos de Vento                                             |
| `IOT`            | dispositivos conectados de propósito acotado que no deben heredar confianza de endpoints generales |
| `CAMERAS`        | videovigilancia y componentes relacionados cuando existan                                          |
| `PRINTING`       | impresoras, puentes o componentes cuya finalidad principal sea impresión                           |

Una finalidad es una política lógica. No presupone que hoy exista una VLAN física para ella.

---

#### 14. `TI-NETWORK-SEGMENTATION-MATRIX-001`

Todos los pares distintos quedan clasificados.

|  N.º | Finalidad A      | Finalidad B      | Decisión base         |
| ---: | ---------------- | ---------------- | --------------------- |
|    1 | `GUEST`          | `ADMINISTRATION` | `SEPARATE_BY_DEFAULT` |
|    2 | `GUEST`          | `OPERATIONS`     | `SEPARATE_BY_DEFAULT` |
|    3 | `GUEST`          | `IOT`            | `SEPARATE_BY_DEFAULT` |
|    4 | `GUEST`          | `CAMERAS`        | `SEPARATE_BY_DEFAULT` |
|    5 | `GUEST`          | `PRINTING`       | `SEPARATE_BY_DEFAULT` |
|    6 | `ADMINISTRATION` | `OPERATIONS`     | `SEPARATE_BY_DEFAULT` |
|    7 | `ADMINISTRATION` | `IOT`            | `SEPARATE_BY_DEFAULT` |
|    8 | `ADMINISTRATION` | `CAMERAS`        | `SEPARATE_BY_DEFAULT` |
|    9 | `ADMINISTRATION` | `PRINTING`       | `SEPARATE_BY_DEFAULT` |
|   10 | `OPERATIONS`     | `IOT`            | `SEPARATE_BY_DEFAULT` |
|   11 | `OPERATIONS`     | `CAMERAS`        | `SEPARATE_BY_DEFAULT` |
|   12 | `OPERATIONS`     | `PRINTING`       | `SEPARATE_BY_DEFAULT` |
|   13 | `IOT`            | `CAMERAS`        | `SEPARATE_BY_DEFAULT` |
|   14 | `IOT`            | `PRINTING`       | `SEPARATE_BY_DEFAULT` |
|   15 | `CAMERAS`        | `PRINTING`       | `SEPARATE_BY_DEFAULT` |

`SEPARATE_BY_DEFAULT` significa que la convivencia o comunicación transversal no se presume.

Una excepción deberá declarar:

```text
exception_id
source_purpose
destination_purpose
required_direction
required_service_or_protocol
business_or_technical_reason
risk
owner
authorizer
effective_from
expires_or_review_at
evidence
change_reference
status
```

La excepción habilita únicamente el flujo autorizado; no fusiona los segmentos.

---

#### 15. Reglas de segmentación

1. las seis finalidades deben permanecer distinguibles incluso si una sede usa menos segmentos físicos;
2. convivir en el mismo segmento requiere excepción explícita y evidencia;
3. un SSID no define por sí solo el límite de confianza;
4. un cambio de SSID no cambia automáticamente el segmento;
5. una VLAN no concede autorización empresarial;
6. el acceso a interfaces de administración de red debe limitarse a principales técnicos autorizados;
7. `GUEST` no se utiliza como superficie de administración de infraestructura;
8. IoT, cámaras e impresión no heredan acceso general por compartir sede;
9. todo flujo transversal debe tener origen, destino, dirección, finalidad y mecanismo controlado;
10. la ausencia de una regla explícita no equivale a permiso;
11. un endpoint autorizado para una aplicación no queda autorizado para administrar la red;
12. la segmentación debe conservarse durante contingencia salvo decisión controlada que documente el riesgo.

---

#### 16. SSID y acceso inalámbrico

Un `SSID` conserva identidad separada de:

- nombre visible;
- punto de acceso;
- segmento;
- credencial;
- política de actor;
- sede;
- proveedor.

Reglas:

1. varios AP pueden emitir el mismo SSID lógico;
2. cada proyección activa debe resolver su segmento esperado;
3. cambiar el nombre visible no autoriza cambiar finalidad;
4. un SSID de invitados no se reutiliza silenciosamente para operación interna;
5. credenciales inalámbricas no se almacenan en el inventario;
6. la cobertura, roaming y capacidad se evalúan como propiedades técnicas, no como identidad;
7. una red visible no se declara disponible por el solo hecho de ser anunciada;
8. la autenticación de red no sustituye la autorización de Vento OS.

---

#### 17. `TI-NETWORK-ADDRESSING-CONTRACT-001`

Se aprueban cuatro modos de asignación.

| Modo                | Uso                                                                                                 |
| ------------------- | --------------------------------------------------------------------------------------------------- |
| `DYNAMIC_DHCP`      | asignación dinámica para clientes que no necesitan locator estable                                  |
| `DHCP_RESERVATION`  | asignación estable administrada desde el servicio de direccionamiento                               |
| `CONTROLLED_STATIC` | dirección fija configurada deliberadamente cuando reserva no sea viable o la tecnología lo requiera |
| `PROVIDER_ASSIGNED` | dirección o prefijo suministrado por un proveedor o servicio externo                                |

No se aprueba ningún rango, prefijo, gateway, DNS, VLAN ID o dirección concreta en esta tarea.

---

#### 18. Reglas de direccionamiento

1. cada `SEGMENT` deberá tener un dominio de direccionamiento explícito;
2. dos segmentos vigentes dentro del mismo ámbito de routing no utilizarán rangos solapados sin diseño expresamente aprobado;
3. endpoints ordinarios usarán asignación dinámica salvo necesidad estable documentada;
4. impresoras y otros destinos que requieran locator estable preferirán reserva administrada cuando la plataforma lo permita;
5. infraestructura que requiera dirección fija utilizará reserva o estática controlada según capacidad técnica;
6. enlaces externos consumirán direccionamiento de proveedor sin convertirlo en identidad del enlace;
7. una reserva tendrá identidad, segmento, objetivo, vigencia, origen y evidencia;
8. cambiar una dirección o reserva será un cambio tecnológico versionado;
9. ninguna configuración empresarial deberá depender de una IP cruda cuando exista una referencia o nombre estable aprobado;
10. nombres, resolución y time service deberán formar parte del perfil técnico de red;
11. una dirección observada fuera de la asignación esperada produce drift;
12. una colisión de dirección es `BLOQUEADO` hasta reconciliarse;
13. IP o MAC no se utilizan para fusionar activos, endpoints o recursos;
14. los valores sensibles de autenticación no forman parte del plan de direccionamiento;
15. el retiro de una reserva conserva historia suficiente para reconstruir su vigencia anterior.

---

#### 19. Perfil de servicio de red

Cada sede, zona o estación que requiera conectividad podrá referenciar un perfil que conserve:

```text
network_profile_id
physical_medium
logical_segment
trust_boundary
address_assignment
name_resolution
time_service
internet_dependency
internal_service_dependency
bandwidth_and_latency_budget
loss_and_jitter_tolerance
roaming_requirement
redundancy_or_fallback
security_controls
observability
configuration_owner
change_and_rollback
```

Los presupuestos o límites numéricos deberán provenir de decisiones no funcionales aprobadas o de una tarea propietaria posterior. No se inventan valores físicos por sede.

---

#### 20. Capacidad

El inventario y el perfil deberán poder registrar, sin confundir capacidad con salud:

- capacidad contratada o nominal del enlace cuando exista evidencia;
- capacidad técnica de interfaces;
- capacidad inalámbrica relevante;
- consumo o utilización observados;
- presión del pool de direccionamiento;
- cantidad de clientes o asociaciones cuando sea una señal útil;
- dependencia de energía o UPS;
- dependencia de proveedor;
- redundancia realmente instalada.

Una capacidad declarada por ficha técnica no demuestra capacidad disponible en operación.

---

#### 21. Configuración deseada, observada y reconciliación

Se separan:

```text
CONFIGURACIÓN APROBADA
≠
CONFIGURACIÓN OBSERVADA
≠
ESTADO OPERATIVO
```

Toda configuración gobernada deberá conservar:

- baseline o versión aprobada;
- versión observada cuando pueda determinarse;
- diferencias estructuradas;
- fuente de observación;
- momento de observación;
- cambio correlacionado;
- estado de reconciliación;
- evidencia.

No se normaliza una desviación modificando el baseline para que coincida con el estado encontrado.

---

#### 22. Cambios de red

Se consideran cambios tecnológicos, como mínimo:

- alta, sustitución o retiro de enlace;
- cambio de router, switch o AP;
- cambio de uplink;
- creación, modificación o retiro de segmento;
- creación, modificación o retiro de SSID;
- cambio de mapeo SSID–segmento;
- cambio de DHCP, reserva o estática;
- cambio de gateway, DNS o time service;
- cambio de firmware o configuración de infraestructura;
- modificación de controles de acceso entre segmentos;
- cambio de proveedor que altere conectividad o direccionamiento;
- restauración de configuración después de una falla.

Su autorización, ventana, prueba, rollback y revisión posterior pertenecen a `TI-DOM-009`.

---

#### 23. `TI-NETWORK-MONITORING-HANDOFF-001`

`TI-DOM-004` define qué debe poder observarse por subtipo. `TI-DOM-010` define métricas, logs, SLI, alertas, umbrales, dashboards, retención y routing operativo.

| Subtipo               | Señales mínimas que deberá poder exponer                                                                                                                                           |
| --------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `NETWORK_LINK`        | disponibilidad observada, estado administrativo cuando exista, latencia, pérdida, jitter, utilización/capacidad, cambio de estado y evidencia del proveedor cuando esté disponible |
| `ROUTER`              | alcanzabilidad, estado de interfaces, caminos esperados, capacidad relevante, versión/configuración y drift                                                                        |
| `SWITCH`              | alcanzabilidad, uplinks, estado de interfaces relevantes, errores, utilización, capacidad y drift                                                                                  |
| `ACCESS_POINT`        | alcanzabilidad, radios, SSID esperados, asociaciones, carga, fallas de acceso, calidad radio disponible y drift                                                                    |
| `SEGMENT`             | alcanzabilidad del gateway esperado, disponibilidad de DHCP/DNS aplicables, presión de direccionamiento y pruebas de conectividad permitida                                        |
| `SSID`                | emisión esperada, resultado de asociación/autenticación técnica, segmento resuelto, carga y cobertura observada                                                                    |
| `ADDRESS_RESERVATION` | correspondencia objetivo–segmento–asignación, conflicto, divergencia y última reconciliación                                                                                       |

No se definen aquí nombres físicos de métricas ni valores umbral.

---

#### 24. Principios de monitoreo

1. conectado no equivale a saludable;
2. una interfaz `up` no demuestra conectividad extremo a extremo;
3. disponibilidad de Internet no demuestra disponibilidad de servicios internos;
4. reachability de un equipo no demuestra que su configuración sea correcta;
5. ausencia de telemetría se registra como ausencia de evidencia, no como salud;
6. señales de red deben poder correlacionarse con servicio, sede, recurso y cambio;
7. cardinalidad sensible o identificadores individuales no se convierten en etiquetas de métricas ordinarias;
8. secretos, PSK, claves, tokens y configuraciones completas no se incorporan a telemetría;
9. pruebas sintéticas deberán distinguirse de tráfico real;
10. el monitoreo de red no sustituye el diagnóstico de endpoint, aplicación, impresora o proveedor.

---

#### 25. Modos de falla

Se materializan ocho modos de falla.

| ID             | Modo                                                                      | Alcance primario                    |
| -------------- | ------------------------------------------------------------------------- | ----------------------------------- |
| `NET-FAIL-001` | pérdida total de enlace externo                                           | `NETWORK_LINK`                      |
| `NET-FAIL-002` | degradación de enlace: latencia, pérdida, jitter o capacidad insuficiente | `NETWORK_LINK`                      |
| `NET-FAIL-003` | falla de routing o borde                                                  | `ROUTER`                            |
| `NET-FAIL-004` | falla de switch, uplink o distribución                                    | `SWITCH`                            |
| `NET-FAIL-005` | falla o degradación de acceso inalámbrico                                 | `ACCESS_POINT` / `SSID`             |
| `NET-FAIL-006` | falla de segmentación, DHCP, DNS, gateway o direccionamiento              | `SEGMENT` / `ADDRESS_RESERVATION`   |
| `NET-FAIL-007` | regresión o drift de configuración                                        | cualquier recurso configurable      |
| `NET-FAIL-008` | pérdida de energía que inutiliza componentes de red                       | recursos físicos y sus dependencias |

Una causa física puede producir varios modos. No se colapsan para ocultar alcance.

---

#### 26. Estrategias de contingencia permitidas

Se aprueban cinco estrategias conceptuales.

| Estrategia                      | Regla                                                                                                                        |
| ------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `ALTERNATE_NETWORK_PATH`        | usar un enlace, nodo o camino alterno únicamente cuando esté inventariado, probado y autorizado                              |
| `LOCAL_DEGRADED_OPERATION`      | continuar localmente solo cuando el proceso y la aplicación tengan contrato de operación degradada aprobado                  |
| `SEGMENT_ISOLATION`             | aislar el segmento o componente afectado para evitar propagación y conservar servicios no afectados                          |
| `CONTROLLED_MANUAL_CONTINGENCY` | ejecutar el procedimiento manual aprobado por el propietario del proceso cuando la tecnología no pueda sostener la operación |
| `STOP_AND_RECOVER`              | detener el efecto empresarial cuando ninguna alternativa preserve seguridad, integridad o trazabilidad                       |

La existencia de una estrategia en el catálogo no demuestra que esté disponible en una sede.

---

#### 27. `TI-NETWORK-CONTINGENCY-MATRIX-001`

| Modo de falla  | Respuesta técnica inicial                                               | Estrategias aplicables                                                                                    | Condición de retorno                                                       |
| -------------- | ----------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| `NET-FAIL-001` | confirmar alcance, separar proveedor de red local y preservar evidencia | `ALTERNATE_NETWORK_PATH`, `LOCAL_DEGRADED_OPERATION`, `CONTROLLED_MANUAL_CONTINGENCY`, `STOP_AND_RECOVER` | enlace o camino aprobado restablecido y dependencias validadas             |
| `NET-FAIL-002` | confirmar degradación y servicios afectados                             | `ALTERNATE_NETWORK_PATH`, `LOCAL_DEGRADED_OPERATION`, `CONTROLLED_MANUAL_CONTINGENCY`, `STOP_AND_RECOVER` | comportamiento dentro del perfil aprobado y servicios validados            |
| `NET-FAIL-003` | aislar borde afectado y verificar configuración/versiones               | `ALTERNATE_NETWORK_PATH`, `SEGMENT_ISOLATION`, `STOP_AND_RECOVER`                                         | routing esperado comprobado y efectos dependientes validados               |
| `NET-FAIL-004` | localizar uplink o dominio afectado y evitar cambios ad hoc             | `ALTERNATE_NETWORK_PATH`, `SEGMENT_ISOLATION`, `LOCAL_DEGRADED_OPERATION`, `STOP_AND_RECOVER`             | conectividad y segmentos esperados comprobados                             |
| `NET-FAIL-005` | separar falla radio, AP, SSID, autenticación y segmento                 | `ALTERNATE_NETWORK_PATH`, `LOCAL_DEGRADED_OPERATION`, `STOP_AND_RECOVER`                                  | acceso inalámbrico y segmento esperado comprobados                         |
| `NET-FAIL-006` | identificar servicio lógico afectado, conflicto o drift                 | `SEGMENT_ISOLATION`, `LOCAL_DEGRADED_OPERATION`, `CONTROLLED_MANUAL_CONTINGENCY`, `STOP_AND_RECOVER`      | direccionamiento, resolución y conectividad esperados reconciliados        |
| `NET-FAIL-007` | correlacionar último cambio, contener y preparar reversión autorizada   | `SEGMENT_ISOLATION`, `ALTERNATE_NETWORK_PATH`, `STOP_AND_RECOVER`                                         | configuración aprobada restaurada o nueva versión aprobada y validada      |
| `NET-FAIL-008` | determinar componentes sin energía y conservar seguridad                | `ALTERNATE_NETWORK_PATH`, `LOCAL_DEGRADED_OPERATION`, `CONTROLLED_MANUAL_CONTINGENCY`, `STOP_AND_RECOVER` | energía estable, equipos reiniciados controladamente y servicios validados |

No se inventan enlaces redundantes, UPS, canales móviles o mecanismos alternos que no estén realmente instalados y probados.

---

#### 28. Ciclo de contingencia de red

El ciclo conceptual será:

```text
DETECTAR
→ CLASIFICAR ALCANCE
→ CONTENER
→ ACTIVAR ALTERNATIVA APROBADA CUANDO EXISTA
→ RESTAURAR COMPONENTE O CONFIGURACIÓN
→ VALIDAR RED
→ VALIDAR SERVICIOS DEPENDIENTES
→ RECONCILIAR TRABAJO PENDIENTE
→ CERRAR CON EVIDENCIA
```

Reglas:

1. restaurar conectividad no equivale a restaurar el servicio empresarial;
2. el retorno se valida desde red y desde los consumidores afectados;
3. cualquier efecto pendiente se reconcilia antes del cierre;
4. una contingencia no autoriza saltarse segregación de funciones;
5. una excepción de segmentación durante contingencia queda versionada y expira;
6. el incidente y su comunicación pertenecen al modelo de `TI-DOM-007`;
7. recuperación, backup y prueba de restore pertenecen a `TI-DOM-011`;
8. el orden empresarial de continuidad permanece bajo el dominio de continuidad;
9. no se declara failover exitoso si solo cambió la configuración sin evidencia de conectividad;
10. el retorno al estado ordinario no elimina la evidencia del período degradado.

---

#### 29. Configuración recuperable

Router, switch y punto de acceso deberán declarar si su configuración:

- puede exportarse;
- puede versionarse;
- contiene secretos;
- requiere sanitización;
- depende de proveedor;
- puede restaurarse;
- necesita hardware o versión compatible;
- tiene evidencia de una prueba de recuperación.

`TI-DOM-004` exige que esa propiedad sea inventariable. `TI-DOM-011` gobierna respaldo, retención, restauración y ejercicios. `TI-DOM-009` gobierna cambios y reversión.

Una captura de pantalla no sustituye un artefacto recuperable cuando la plataforma permita una exportación estructurada.

---

#### 30. Seguridad y privacidad

1. el inventario no almacenará contraseñas, PSK, claves privadas, tokens, códigos de recuperación ni secretos de proveedor;
2. interfaces de administración de infraestructura no se exponen a actores empresariales por pertenecer a una sede;
3. acceso técnico requiere principal autorizado y trazabilidad;
4. direcciones internas pueden ser información operativa restringida y su exposición debe ser proporcional;
5. los diagramas de topología no se publican indiscriminadamente;
6. logs y eventos no copian configuraciones completas si contienen material sensible;
7. una red de invitados no obtiene acceso a recursos internos por conveniencia;
8. dispositivos IoT o cámaras no se convierten en puente de confianza hacia aplicaciones empresariales;
9. la segmentación limita conectividad, pero no sustituye autenticación ni autorización de aplicaciones;
10. el soporte de proveedor se limita por finalidad, tiempo y alcance según las reglas de acceso privilegiado.

---

#### 31. Criterios para materializar el inventario físico

Una instancia futura podrá pasar de `PENDIENTE_DE_EVIDENCIA` a `VALIDADO` únicamente cuando se resuelvan, según subtipo:

- identidad estable;
- sede o alcance;
- activo físico cuando corresponda;
- propietario técnico;
- topología directa relevante;
- segmento o finalidad;
- direccionamiento;
- configuración y versión;
- capacidad relevante;
- señales disponibles;
- contingencia aplicable;
- proveedor cuando corresponda;
- evidencia;
- última reconciliación.

Para equipos físicos se exigirá reconciliación con NEXO antes de declarar la relación física validada.

La materialización deberá comparar primero contra la línea base de esta tarea y registrar faltantes, duplicados, conflictos y evidencia; no crear identidades desde heurísticas.

---

#### 32. Handoffs y propietarios exactos

| Decisión o ejecución                                                              | Propietario                                                                 | Condición de salida                                                                                         |
| --------------------------------------------------------------------------------- | --------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| activo físico, ubicación, custodia, mantenimiento y disposición de equipo de red  | NEXO                                                                        | activo reconciliado y evidencia física suficiente                                                           |
| endpoint conectado a red                                                          | `TI-DOM-003` + relación aprobada en `TI-DOM-002`                            | endpoint canónico y relación técnica comprobada                                                             |
| impresora conectada a red                                                         | `TI-DOM-005` + PRINT-ARC                                                    | identidad física y routing de impresión reconciliados                                                       |
| aplicaciones, proveedores, dependencias y ambientes                               | `TI-DOM-006`                                                                | catálogo técnico detallado aprobado                                                                         |
| incidente, impacto, prioridad, comunicación y cierre                              | `TI-DOM-007`                                                                | modelo de incidente aprobado                                                                                |
| cambios de red, aprobación, ventana, rollback y revisión                          | `TI-DOM-009`                                                                | gobierno de cambio aprobado                                                                                 |
| métricas, logs, SLI, alertas, dashboards y routing de alertas                     | `TI-DOM-010`                                                                | contrato de observabilidad aprobado                                                                         |
| backup, restore, recuperación y ejercicios de configuración                       | `TI-DOM-011`                                                                | política de recuperación aprobada                                                                           |
| contratos, renovaciones, garantías y costos de enlaces/proveedores                | `TI-DOM-012`                                                                | modelo contractual y económico aprobado                                                                     |
| acceso privilegiado y soporte de proveedor                                        | `TI-AUTH-*`                                                                 | autorización tecnológica aprobada                                                                           |
| materialización física del inventario, topología, segmentación y direccionamiento | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` si resulta aprobada | paquete de implementación autorizado, evidencia física disponible, cambios versionados y pruebas aplicables |
| continuidad empresarial y prioridad de recuperación de procesos                   | dominio de continuidad                                                      | análisis de impacto y decisiones de continuidad aprobadas                                                   |

No queda una decisión sustantiva propia de `TI-DOM-004` sin propietario.

---

#### 33. Estado de materialización

| Componente                                     | Estado                                                 |
| ---------------------------------------------- | ------------------------------------------------------ |
| taxonomía de recursos                          | `ESPECIFICADO`                                         |
| arquitectura por capas                         | `ESPECIFICADO`                                         |
| contrato de topología                          | `ESPECIFICADO`                                         |
| matriz de segmentación                         | `ESPECIFICADO`                                         |
| contrato de direccionamiento                   | `ESPECIFICADO`                                         |
| requisitos de señales de red                   | `ESPECIFICADO`                                         |
| matriz de contingencia                         | `ESPECIFICADO`                                         |
| inventario físico canónico por instancia       | `PENDIENTE_DE_EVIDENCIA`                               |
| topología real de sedes                        | `PENDIENTE_DE_EVIDENCIA`                               |
| segmentos, SSID y direccionamiento productivos | `PENDIENTE_DE_EVIDENCIA`                               |
| configuración de dispositivos de red           | `PENDIENTE_DE_EVIDENCIA`                               |
| observabilidad física                          | `FUERA_DE_ALCANCE` hacia `TI-DOM-010` e implementación |
| cambios productivos de red                     | `FUERA_DE_ALCANCE` hacia `TI-DOM-009` e implementación |
| recuperación física de configuración           | `FUERA_DE_ALCANCE` hacia `TI-DOM-011` e implementación |

La ausencia de evidencia física no reduce el alcance documental: arquitectura, inventario canónico, reglas, matrices y handoffs quedan completamente definidos.

---

#### 34. Invariantes

1. una IP no es identidad;
2. una MAC no es identidad;
3. un SSID no es un AP;
4. un segmento no es una sede;
5. una VLAN no es autorización;
6. un router físico y su activo NEXO no se fusionan;
7. un enlace y su proveedor no se fusionan;
8. una reserva y su objetivo no se fusionan;
9. un cambio de dirección conserva historia;
10. una relación topológica requiere evidencia;
11. un equipo alcanzable no se presume saludable;
12. una red visible no se presume operativa;
13. ausencia de telemetría no equivale a salud;
14. configuración deseada y observada permanecen separadas;
15. los seis propósitos de segmentación quedan diferenciados;
16. convivencia entre propósitos distintos requiere excepción;
17. la contingencia no elimina límites de seguridad;
18. no existe failover por mera intención;
19. no se inventan enlaces, VLAN, SSID, direcciones, proveedores o capacidades;
20. la recuperación requiere validación de servicios dependientes;
21. cambios de red se gobiernan como cambios tecnológicos;
22. secretos no forman parte del inventario;
23. historia de topología y configuración no se sobrescribe destructivamente;
24. ninguna decisión de esta tarea modifica infraestructura o Supabase.

---

#### 35. Criterios de aceptación

- [x] se conserva la continuidad `TI-DOM-003 → TI-DOM-004 → TI-DOM-005`;
- [x] la tarea permanece exclusivamente documental;
- [x] se definen exactamente siete subtipos de `NETWORK_RESOURCE`;
- [x] identidad técnica permanece separada de IP, MAC, SSID, activo, proveedor y servicio;
- [x] se definen seis capas arquitectónicas;
- [x] se definen seis relaciones internas de topología;
- [x] se define inventario canónico con campos, evidencia y reconciliación;
- [x] los siete subtipos tienen decisión AS-IS explícita;
- [x] se declaran cero instancias validadas sin convertir ausencia de evidencia en inexistencia física;
- [x] se definen exactamente seis finalidades de segmentación;
- [x] los quince pares distintos de finalidades tienen decisión explícita;
- [x] convivencia transversal requiere excepción estructurada;
- [x] se definen cuatro modos de asignación de dirección;
- [x] no se inventan rangos, VLAN ID, SSID, IP, DNS, gateway, proveedor ni capacidad;
- [x] se define relación entre SSID, AP y segmento;
- [x] se separan configuración aprobada, observada y estado operativo;
- [x] los siete subtipos reciben un perfil mínimo de señales;
- [x] el detalle de observabilidad permanece en `TI-DOM-010`;
- [x] se materializan ocho modos de falla;
- [x] se materializan cinco estrategias de contingencia;
- [x] los ocho modos de falla tienen respuesta y condición de retorno;
- [x] recuperación técnica permanece separada de continuidad empresarial;
- [x] cambios de red permanecen bajo `TI-DOM-009`;
- [x] backup y restore permanecen bajo `TI-DOM-011`;
- [x] activos físicos permanecen bajo NEXO;
- [x] impresión permanece coordinada con `TI-DOM-005` y PRINT-ARC;
- [x] no se crean tablas, migraciones, datos, configuraciones o cambios de infraestructura;
- [x] no se modifica Supabase;
- [x] no se crean ni modifican requisitos de prueba;
- [x] `TI-DOM-005` permanece únicamente reservada.

---

#### 36. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el inventario y las relaciones físicas de tecnología, la separación de recursos de red, la versionación de enlaces, equipos, segmentos, SSID, direccionamiento y reservas, la detección de divergencias, la observabilidad de dependencias y la continuidad con failover controlado ya están protegidos por requisitos canónicos vigentes. Esta tarea materializa las decisiones documentales que esa cobertura debe consumir y no introduce una conducta ejecutable adicional ni modifica una condición de prueba existente.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 37. Continuidad

ÚLTIMA TAREA APROBADA
`TI-DOM-003 — Definir ciclo de vida de computadores, celulares, tabletas y endpoints`

TAREA ACTUAL APROBADA
`TI-DOM-004 — Definir arquitectura, inventario, segmentación, direccionamiento, monitoreo y contingencia de redes`

SIGUIENTE TAREA RESERVADA
`TI-DOM-005 — Definir gobierno de impresoras y periféricos físicos frente al servicio transversal de impresión`


### ✅ TI-DOM-005 — Definir gobierno de impresoras y periféricos físicos frente al servicio transversal de impresión

**Estado:** APROBADA
**Tarea anterior:** `TI-DOM-004 — Definir arquitectura, inventario, segmentación, direccionamiento, monitoreo y contingencia de redes` — APROBADA
**Tarea siguiente:** `TI-DOM-006 — Definir catálogo de aplicaciones, ambientes, dependencias, proveedores, licencias y criticidad` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de gobierno físico, reconciliación de activos, dependencias, mantenimiento, consumibles, cambios y soporte de impresoras y periféricos frente al servicio transversal PRINT-ARC
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/01_DOMINIO_DE_TECNOLOGIA_Y_SOPORTE.md`
**Artefactos producidos:** `TI-PRINT-PHYSICAL-GOVERNANCE-CONTRACT-001`; `TI-PRINT-ASSET-RECONCILIATION-001`; `TI-PRINT-PHYSICAL-STATE-MATRIX-001`; `TI-PRINT-BINDING-AND-DEPENDENCY-CONTRACT-001`; `TI-PRINT-MAINTENANCE-AND-CONSUMABLES-CONTRACT-001`; `TI-PRINT-CHANGE-SUPPORT-HANDOFF-001`
**Cambios físicos autorizados:** ninguno; no compra, instala, conecta, reubica, repara, configura, sustituye ni retira impresoras o periféricos, no cambia IP, red, driver, firmware, USB, LAN, Wi-Fi, Bluetooth, colas, adaptadores, rutas ni consumibles, y no crea ni modifica código, tablas, migraciones, datos o Supabase
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo Vento gobierna la dimensión física y de soporte de una impresora sin duplicar la autoridad del maestro de activos de NEXO ni absorber las responsabilidades del servicio transversal de impresión.

La tarea debe permitir responder, para cada dispositivo de impresión:

- qué identidad de servicio `PRN-*` representa el dispositivo dentro de PRINT-ARC;
- qué activo físico NEXO lo materializa, cuando esa relación esté demostrada;
- dónde está y bajo qué condición física se encuentra;
- qué modelo, serie, garantía, mantenimiento y evidencia física posee;
- qué canal o dependencia técnica utiliza sin convertir ese canal en identidad;
- qué host, red, reserva, energía o accesorio necesita;
- qué consumibles y medios son compatibles;
- qué estado físico bloquea o permite avanzar a la evaluación de salud de PRINT-ARC;
- qué cambio físico o técnico exige gobierno de cambio;
- qué incidente, reparación, sustitución o retiro debe conservar historia;
- qué evidencia permite declarar reconciliada la relación entre NEXO, TI y PRINT-ARC.

Regla raíz:

```text
ACTIVO FÍSICO NEXO
≠ PRINTER / PRN-* DE PRINT-ARC
≠ CANAL
≠ COLA
≠ RUTA
≠ TARGET
≠ ADAPTADOR
≠ PLANTILLA
≠ TRABAJO
≠ INTENTO
≠ RECEIPT
≠ BROWSERPRINT UID
≠ IP
≠ MAC
```

La disponibilidad física y la disponibilidad del servicio de impresión son dimensiones relacionadas, no equivalentes.

---

#### 2. Resultado material

Se aprueban seis artefactos documentales:

1. `TI-PRINT-PHYSICAL-GOVERNANCE-CONTRACT-001`, que fija autoridades, identidades, relaciones, evidencia, ciclo físico e invariantes;
2. `TI-PRINT-ASSET-RECONCILIATION-001`, que materializa una decisión para las nueve identidades `PRN-*` vigentes;
3. `TI-PRINT-PHYSICAL-STATE-MATRIX-001`, que separa condición física, estado administrativo, health del servicio, canal, job y receipt;
4. `TI-PRINT-BINDING-AND-DEPENDENCY-CONTRACT-001`, que define cómo se relacionan activo, impresora, endpoint, red, canal, adaptador y dependencias físicas;
5. `TI-PRINT-MAINTENANCE-AND-CONSUMABLES-CONTRACT-001`, que gobierna mantenimiento, garantía, repuestos, medios y consumibles sin crear una fuente de inventario paralela;
6. `TI-PRINT-CHANGE-SUPPORT-HANDOFF-001`, que materializa los handoffs de cambio, incidente, soporte, sustitución, despliegue y retiro.

Cobertura materializada:

| Elemento                                                                 |                           Cantidad |
| ------------------------------------------------------------------------ | ---------------------------------: |
| Identidades de impresora `PRN-*` consumidas de PRINT-ARC                 |                              **9** |
| Identidades con decisión de reconciliación física                        |                         **9 de 9** |
| Relaciones `PRINTER_REPRESENTS_ASSET` declaradas `VALIDADO`              |                              **0** |
| Candidatos individuales NEXO detectados que requieren reconciliación     |                              **1** |
| Evidencias grupales NEXO no resolubles por identidad individual          | **1 grupo / 3 unidades esperadas** |
| Identidades `PRN-*` creadas por inferencia                               |                              **0** |
| Activos NEXO creados por inferencia                                      |                              **0** |
| Roles de dependencia física/técnica definidos                            |                              **7** |
| Instancias adicionales de periférico declaradas `VALIDADO` sin evidencia |                              **0** |
| Cambios físicos                                                          |                              **0** |
| Cambios de requisitos de prueba                                          |                              **0** |

---

#### 3. Autoridades heredadas

Se conservan sin modificación:

- `TI-SERVICE-004 — Impresoras y periféricos`;
- la clase `PRINTER` de `TI-DOM-002`;
- `TI-REL-007 — PRINTER_REPRESENTS_ASSET`;
- `TI-REL-008 — PRINTER_CONNECTS_VIA_NETWORK`;
- `TI-REL-009 — PRINTER_ATTACHED_TO_ENDPOINT`;
- `TI-REL-014 — SERVICE_DEPENDS_ON_PRINTER`;
- NEXO como autoridad de activo físico, ubicación, custodia, condición, mantenimiento, garantía, movimiento y disposición;
- `TI-DOM-003` como autoridad del ciclo de vida del endpoint que pueda actuar como host o puente;
- `TI-DOM-004` como autoridad de topología, segmento, SSID, direccionamiento, reserva y cambio de red;
- PRINT-ARC como autoridad de inventario de servicio de impresión, perfil imprimible, trabajo, cola, routing, target, fallback, health, heartbeat, idempotencia, reintentos, receipts, reimpresión, privacidad, operación offline, adaptadores, monitoreo y piloto;
- `TI-DOM-007` como autoridad del incidente y restauración de servicio;
- `TI-DOM-009` como autoridad de cambio tecnológico, aprobación, ventana, prueba, rollback y revisión posterior;
- `TI-DOM-010` como autoridad de métricas, logs, SLI, alertas y observabilidad transversal;
- `TI-DOM-011` como autoridad de respaldo y recuperación técnica cuando exista configuración recuperable;
- `TI-DOM-012` como autoridad de contratos, garantías económicas, proveedores y costos tecnológicos;
- `TI-AUTH-*` como autoridad de acceso privilegiado, soporte remoto y acciones técnicas sensibles.

`TI-DOM-005` no crea una nueva fuente de verdad para ninguno de esos objetos. Define la reconciliación entre ellos.

---

#### 4. Frontera física frente a PRINT-ARC

La separación obligatoria queda:

```text
NEXO
→ identidad y ciclo del bien físico
→ ubicación, custodia, condición
→ mantenimiento, garantía y disposición

TI-DOM-005
→ contrato de reconciliación física
→ dependencias técnicas del dispositivo
→ reglas de soporte físico
→ handoff entre NEXO, red, endpoint y PRINT-ARC

PRINT-ARC
→ identidad PRN-* dentro del servicio
→ canal y adaptador de impresión
→ trabajo, cola, route, target y fallback
→ health y heartbeat
→ intentos, receipts y resultado
→ reimpresión, privacidad y piloto
```

La misma impresora puede estar físicamente `OPERATIVA` y, al mismo tiempo, permanecer no elegible para nuevos trabajos porque PRINT-ARC no dispone de heartbeat fresco, binding implementado o adaptador operativo.

También puede ocurrir lo contrario: una señal técnica antigua o un dispositivo detectable no puede elevar un activo `ALMACENADO`, `REQUIERE_MANTENIMIENTO`, retirado o físicamente no reconciliado a disponibilidad operativa.

---

#### 5. Identidad canónica y no-identidades

Una relación física validada debe poder resolver:

```text
printer_reference
asset_reference
printer_model_evidence
serial_or_equivalent_evidence_when_applicable
site_reference
area_or_point_reference
physical_condition_reference
connection_binding_reference
host_or_network_reference
maintenance_reference
warranty_reference
consumable_profile_reference
evidence_references
effective_from
effective_to
reconciliation_state
```

Reglas:

1. `printer_reference` conserva la identidad aprobada `PRN-*` de PRINT-ARC;
2. `asset_reference` debe provenir de NEXO y no se inventa desde marca, ubicación, nombre o conexión;
3. un `BrowserPrint.uid` es evidencia técnica de un dispositivo detectable, no un `asset_id`;
4. IP y MAC son atributos de conectividad, no identidad física;
5. un nombre de driver, cola o puerto no identifica el activo;
6. una fila de producto o perfil genérico no sustituye una instancia individual de activo;
7. un grupo de activos no se expande en identidades individuales por heurística;
8. la coincidencia de marca y sede no basta para declarar `PRINTER_REPRESENTS_ASSET`;
9. serial, placa, asset code y evidencia física pueden participar en la reconciliación, pero deben provenir de la fuente propietaria;
10. una reparación no cambia identidad física si continúa siendo el mismo bien;
11. una sustitución por otro bien físico requiere nueva identidad NEXO;
12. la identidad `PRN-*` y su tratamiento ante sustitución se versionan o actualizan conforme a PRINT-ARC; TI no la reescribe silenciosamente.

---

#### 6. Universo canónico de impresoras consumido

`TI-PRINT-ASSET-RECONCILIATION-001` consume exactamente las nueve referencias vigentes del servicio de impresión:

|  N.º | `printer_reference`         | Sede / punto                          | Modelo aprobado en PRINT-ARC | Estado documental físico | Canal o condición vigente                   |
| ---: | --------------------------- | ------------------------------------- | ---------------------------- | ------------------------ | ------------------------------------------- |
|    1 | `PRN-VP-ZD230-01`           | Vento Producción / equipo almacenado  | Zebra ZD230                  | `ALMACENADA`             | `CH-ZEBRA-SIN-CONEXION`                     |
|    2 | `PRN-VP-L5590-01`           | Vento Producción / fuera de operación | Epson EcoTank L5590          | `REQUIERE_MANTENIMIENTO` | `CH-EPSON-L5590-SIN-CONEXION`               |
|    3 | `PRN-ADMIN-L4260-01`        | sede administrativa / oficina         | Epson EcoTank L4260          | `OPERATIVA`              | `CH-EPSON-L4260-USB`; `CH-EPSON-L4260-WIFI` |
|    4 | `PRN-MOLKA-DIGE200I-01`     | Molka / caja                          | Digital POS DIG-E200I        | `OPERATIVA`              | `CH-DIGE200I-USB`                           |
|    5 | `PRN-SAUDO-DIGE200I-01`     | Saudo / caja                          | Digital POS DIG-E200I        | `OPERATIVA`              | `CH-DIGE200I-USB`                           |
|    6 | `PRN-VC-CAJA-DIGE200I-01`   | Vento Café / caja-mostrador           | Digital POS DIG-E200I        | `OPERATIVA`              | `CH-DIGE200I-USB`                           |
|    7 | `PRN-VC-BARRA-DIGE200I-01`  | Vento Café / barra calientes          | Digital POS DIG-E200I        | `OPERATIVA`              | `CH-DIGE200I-LAN`                           |
|    8 | `PRN-VC-BAR-DIGE200I-01`    | Vento Café / bar frías                | Digital POS DIG-E200I        | `OPERATIVA`              | `CH-DIGE200I-LAN`                           |
|    9 | `PRN-VC-COCINA-DIGE200I-01` | Vento Café / cocina                   | Digital POS DIG-E200I        | `OPERATIVA`              | `CH-DIGE200I-LAN`                           |

Reconciliación del universo:

```text
9 referencias esperadas
9 referencias materializadas
9 decisiones de reconciliación
0 duplicadas
0 omitidas
0 añadidas por inferencia
```

---

#### 7. Estado AS-IS verificable del maestro físico

La lectura de solo consulta del estado técnico actual aporta cuatro hechos relevantes:

1. existe una instancia individual `asset_items` con `asset_code = ACT-EQP-MULTIF-000932-MRF4E56U`, nombre `Multifuncional epson`, sede `VENTO_GROUP`, área `DIRECCION`, estado operativo, condición buena y ciclo activo;
2. esa instancia individual no posee actualmente marca, modelo ni serial que permitan demostrar que sea `PRN-ADMIN-L4260-01`;
3. existe un grupo `GRP-EQP-IMPRES-000989-MRXP1WP8` denominado `Impresora termica`, en `VENTO_CAFE / SALON`, con cantidad esperada 3, pero no identifica individualmente las cuatro referencias DIG-E200I de Vento Café;
4. existen productos o perfiles genéricos `Impresora epson`, `Impresora termica` y `Multifuncional epson`, pero no constituyen por sí mismos una identidad física individual; no se encontraron registros de mantenimiento asociados a esos productos o al único candidato individual durante la lectura realizada.

Conclusión:

```text
EVIDENCIA DE EXISTENCIA GENÉRICA
≠
RECONCILIACIÓN INDIVIDUAL PRN-* ↔ ACTIVO NEXO
```

El inventario físico actual es suficiente para identificar una brecha, no para fabricar los ocho vínculos faltantes ni confirmar el candidato administrativo.

---

#### 8. `TI-PRINT-ASSET-RECONCILIATION-001`

| `printer_reference`         | Evidencia NEXO actual                                                                     | Estado de `TI-REL-007`   | Bloqueo exacto                                                                                | Propietario de salida                                                                       | Condición de salida                                                                                            |
| --------------------------- | ----------------------------------------------------------------------------------------- | ------------------------ | --------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `PRN-VP-ZD230-01`           | no se localizó instancia individual modelada como Zebra ZD230                             | `PENDIENTE_DE_EVIDENCIA` | falta identidad NEXO individual, modelo/serie físicamente reconciliados y ubicación de activo | alcance físico aprobado del paquete que incorpore la Zebra; PRINT-ARC para binding y prueba | activo individual reconciliado, canal aprobado, health elegible y prueba física satisfactoria                  |
| `PRN-VP-L5590-01`           | existe perfil genérico de impresora Epson sin instancia individual demostrable como L5590 | `PENDIENTE_DE_EVIDENCIA` | falta activo individual reconciliado y cierre verificable del mantenimiento                   | NEXO para activo/mantenimiento; PRINT-ARC para binding y prueba                             | identidad física individual, mantenimiento cerrado o sustitución autorizada y prueba A4 satisfactoria          |
| `PRN-ADMIN-L4260-01`        | candidato individual `ACT-EQP-MULTIF-000932-MRF4E56U` en Vento Group / Dirección          | `PENDIENTE_DE_EVIDENCIA` | el candidato carece de modelo y serial; sede/área semejantes no prueban identidad             | NEXO para reconciliación física                                                             | modelo o evidencia física suficiente vincula inequívocamente el candidato con la L4260 y se conserva evidencia |
| `PRN-MOLKA-DIGE200I-01`     | no se localizó instancia individual DIG-E200I de Molka                                    | `PENDIENTE_DE_EVIDENCIA` | falta activo individual, modelo/serie y vínculo con caja de Molka                             | NEXO para reconciliación física                                                             | activo individual identificado y vínculo físico probado                                                        |
| `PRN-SAUDO-DIGE200I-01`     | no se localizó instancia individual DIG-E200I de Saudo                                    | `PENDIENTE_DE_EVIDENCIA` | falta activo individual, modelo/serie y vínculo con caja de Saudo                             | NEXO para reconciliación física                                                             | activo individual identificado y vínculo físico probado                                                        |
| `PRN-VC-CAJA-DIGE200I-01`   | existe grupo de 3 impresoras térmicas en Vento Café / Salón, no asignable por identidad   | `PENDIENTE_DE_EVIDENCIA` | evidencia grupal no identifica esta unidad ni cubre las cuatro referencias Vento Café         | NEXO para individualización y ubicación                                                     | activo individual identificado y reconciliado con caja-mostrador                                               |
| `PRN-VC-BARRA-DIGE200I-01`  | misma evidencia grupal no resoluble                                                       | `PENDIENTE_DE_EVIDENCIA` | el grupo no demuestra qué unidad corresponde a barra calientes                                | NEXO para individualización y ubicación                                                     | activo individual identificado y reconciliado con barra calientes                                              |
| `PRN-VC-BAR-DIGE200I-01`    | misma evidencia grupal no resoluble                                                       | `PENDIENTE_DE_EVIDENCIA` | el grupo no demuestra qué unidad corresponde a bar frías                                      | NEXO para individualización y ubicación                                                     | activo individual identificado y reconciliado con bar frías                                                    |
| `PRN-VC-COCINA-DIGE200I-01` | misma evidencia grupal no resoluble                                                       | `PENDIENTE_DE_EVIDENCIA` | el grupo no demuestra qué unidad corresponde a cocina                                         | NEXO para individualización y ubicación                                                     | activo individual identificado y reconciliado con cocina                                                       |

Control:

```text
VALIDADO = 0
PENDIENTE_DE_EVIDENCIA = 9
BLOQUEADO por conflicto confirmado = 0
IDENTIDADES OMITIDAS = 0
```

La diferencia entre un grupo de tres impresoras térmicas en la fuente física y cuatro referencias térmicas estables en Vento Café no se corrige repartiendo el grupo por intuición. Se conserva como brecha de reconciliación hasta individualizar los bienes.

---

#### 9. Regla de reconciliación física

Una relación `PRINTER_REPRESENTS_ASSET` podrá declararse `VALIDADO` solo si:

1. existe una identidad individual de activo NEXO;
2. la evidencia demuestra que ese bien es el mismo dispositivo representado por la referencia `PRN-*`;
3. modelo o clase son compatibles con el perfil aprobado;
4. serial, placa, etiqueta, inspección, ubicación o evidencia equivalente resuelven la identidad sin ambigüedad;
5. sede y punto son compatibles o existe movimiento físico versionado;
6. la relación no contradice otro vínculo vigente;
7. el estado físico no ha sido fabricado desde health o detección local;
8. se conserva fecha y fuente de reconciliación.

No es suficiente:

- que el equipo aparezca en BrowserPrint;
- que responda por red;
- que una IP coincida;
- que el nombre contenga Epson, Zebra o DIG-E200I;
- que exista un producto de catálogo con nombre parecido;
- que un grupo tenga la cantidad aproximada;
- que un usuario recuerde dónde estaba;
- que un job haya sido aceptado por un adaptador.

---

#### 10. Jerarquía de evidencia

De mayor a menor capacidad de probar identidad física:

| Evidencia                                                    | Uso permitido                                                 | Límite                                                        |
| ------------------------------------------------------------ | ------------------------------------------------------------- | ------------------------------------------------------------- |
| activo NEXO individual + serial/placa/inspección física      | ancla principal de identidad física                           | debe corresponder al equipo real                              |
| asset code individual + modelo/ubicación comprobados         | reconciliación cuando la identificación física sea inequívoca | no sustituye serial cuando sea necesario para desambiguar     |
| inspección controlada con fotografía o evidencia equivalente | soporte de reconciliación                                     | no crea por sí sola una identidad si NEXO carece de instancia |
| BrowserPrint UID, driver, USB, hostname, IP o MAC            | evidencia de canal/configuración                              | nunca crea el activo                                          |
| producto o perfil de producto                                | evidencia de clase o catálogo                                 | no identifica una unidad                                      |
| grupo de activos                                             | evidencia cuantitativa                                        | no identifica una unidad concreta                             |
| texto libre o nombre parecido                                | indicio                                                       | no habilita reconciliación                                    |

---

#### 11. `TI-PRINT-BINDING-AND-DEPENDENCY-CONTRACT-001`

Un binding físico/técnico deberá conservar, según aplique:

```text
printer_reference
asset_reference
channel_reference
endpoint_reference
network_reference
addressing_reference
adapter_reference
physical_dependency_references
desired_configuration_reference
observed_configuration_reference
effective_from
effective_to
change_reference
evidence_references
reconciliation_state
```

Reglas:

1. `asset_reference` identifica el bien físico;
2. `channel_reference` identifica la vía aprobada por PRINT-ARC;
3. `endpoint_reference` se utiliza para USB, puente local u otra dependencia de host;
4. `network_reference` se utiliza para LAN o Wi-Fi sin copiar topología;
5. `addressing_reference` se usa cuando existe direccionamiento estable; IP cruda no es identidad;
6. `adapter_reference` pertenece al contrato PRINT-ARC y no sustituye el canal físico;
7. un cambio de canal sobre el mismo dispositivo no crea otro activo;
8. una misma impresora con USB y Wi-Fi conserva un activo único y bindings de canal separados;
9. ningún binding decide qué documento debe imprimirse; esa decisión pertenece a route/target de PRINT-ARC;
10. ninguna aplicación puede saltarse PRINT-ARC usando el binding físico como selector empresarial.

---

#### 12. Roles de dependencia física y técnica

Se definen siete roles. Son roles de relación; no crean nuevas clases canónicas de configuración.

| Rol                              | Qué representa                                                | Autoridad propietaria                            | Regla                                                                              |
| -------------------------------- | ------------------------------------------------------------- | ------------------------------------------------ | ---------------------------------------------------------------------------------- |
| `PRINT_DEVICE_ASSET`             | bien físico impresora                                         | NEXO                                             | debe individualizarse antes de `VALIDADO`                                          |
| `HOST_ENDPOINT_REFERENCE`        | computador o endpoint requerido por USB/bridge                | `TI-DOM-003`                                     | no se fusiona con la impresora                                                     |
| `NETWORK_REFERENCE`              | red, segmento, SSID o recurso utilizado                       | `TI-DOM-004`                                     | no se reconstruye desde IP                                                         |
| `LOCAL_BRIDGE_REFERENCE`         | software o componente de host que media el envío              | PRINT-ARC + endpoint propietario                 | capacidad técnica no equivale a autorización                                       |
| `CONNECTION_COMPONENT_REFERENCE` | cable, interfaz, puerto o accesorio de conexión               | NEXO/TI según materialidad                       | solo se individualiza como activo cuando su ciclo lo justifique y exista evidencia |
| `POWER_PROTECTION_REFERENCE`     | fuente, UPS o protección cuya falla afecte el dispositivo     | NEXO / perfil de estación                        | no se presume instalada                                                            |
| `MEDIA_CONSUMABLE_REFERENCE`     | papel, etiqueta, ribbon, tinta, toner u otro medio compatible | dominio de inventario/abastecimiento propietario | es una referencia de compatibilidad y disponibilidad, no identidad de impresora    |

Instancias adicionales de periféricos no demostradas por las fuentes actuales permanecen `PENDIENTE_DE_EVIDENCIA`; esta tarea no las crea por inferencia.

---

#### 13. Canales físicos actuales

Se preserva exactamente la clasificación de PRINT-ARC:

| Referencia                      | Naturaleza física          | Decisión de TI-DOM-005                                              |
| ------------------------------- | -------------------------- | ------------------------------------------------------------------- |
| `CH-ZEBRA-SIN-CONEXION`         | ninguna conexión activa    | no crear binding; equipo almacenado                                 |
| `CH-EPSON-L5590-SIN-CONEXION`   | ninguna conexión operativa | no crear binding; mantenimiento bloquea                             |
| `CH-EPSON-L4260-USB`            | USB mediante host          | requiere impresora física reconciliada y host cuando se materialice |
| `CH-EPSON-L4260-WIFI`           | Wi-Fi                      | requiere impresora física reconciliada y referencia de red          |
| `CH-DIGE200I-USB`               | USB / ESC-POS              | requiere impresora individual y host por punto                      |
| `CH-DIGE200I-LAN`               | LAN / ESC-POS              | requiere impresora individual y recurso/direccionamiento de red     |
| `CH-SIN-DISPOSITIVO-COMPATIBLE` | ausencia de dispositivo    | no crear activo, canal o binding ficticio                           |

Los canales describen el servicio de impresión. TI-DOM-005 solo gobierna las dependencias físicas necesarias para que el binding sea demostrable.

---

#### 14. BrowserPrint y descubrimiento local

El código actual usa BrowserPrint para detectar dispositivos locales y conserva identificadores como `uid`, nombre, tipo y conexión.

Ese mecanismo se clasifica:

```text
DISCOVERY_LOCAL
=
EVIDENCIA TÉCNICA DE CANAL

DISCOVERY_LOCAL
≠
INVENTARIO FÍSICO CANÓNICO
```

Reglas:

1. detectar una impresora no crea un activo;
2. seleccionar una impresora local no crea un `PRN-*`;
3. el primer dispositivo devuelto no se vuelve principal por orden de descubrimiento;
4. un `uid` local no sustituye `asset_reference`;
5. configuraciones guardadas por `uid` pueden servir como estado local del adaptador, pero no como fuente del maestro físico;
6. una conexión indicada como lista para imprimir no sustituye heartbeat, health, route, target ni prueba física;
7. el callback de envío no se interpreta como confirmación física.

La implementación futura deberá reconciliar discovery y binding contra las identidades canónicas, no al revés.

---

#### 15. Separación de estados

`TI-PRINT-PHYSICAL-STATE-MATRIX-001` mantiene seis planos independientes:

```text
CONDICIÓN Y CICLO DEL ACTIVO NEXO
≠
ESTADO ADMINISTRATIVO DE LA IMPRESORA EN PRINT-ARC
≠
ESTADO DEL CANAL
≠
HEALTH / HEARTBEAT DEL SERVICIO
≠
ESTADO DEL JOB / INTENTO
≠
NIVEL DE RECEIPT O RESULTADO
```

Reglas de precedencia:

1. un activo almacenado, en mantenimiento o retirado puede bloquear elegibilidad antes de evaluar heartbeat;
2. health fresco no convierte un activo físicamente bloqueado en operativo;
3. un activo físicamente operativo no queda automáticamente elegible para imprimir;
4. `NEVER_OBSERVED`, `STALE` o ausencia de colector no cambia la condición física del bien;
5. `ACCEPTED_BY_ADAPTER` no prueba ejecución física;
6. un receipt físico no modifica inventario o custodia;
7. un fallo de job no implica automáticamente falla del dispositivo;
8. una falla física puede afectar múltiples jobs y debe correlacionarse sin mutar su historia.

---

#### 16. Matriz física → elegibilidad de servicio

| Condición física/documental           | Health PRINT-ARC                                            | Decisión                                                                                                            |
| ------------------------------------- | ----------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `ALMACENADA`                          | cualquiera                                                  | `SAFE_BLOCK`; no se espera heartbeat productivo                                                                     |
| `REQUIERE_MANTENIMIENTO`              | cualquiera                                                  | `SAFE_BLOCK`; una señal técnica no rehabilita el equipo                                                             |
| `OPERATIVA` + activo no reconciliado  | cualquiera                                                  | no declarar `TI-REL-007` validada; el servicio puede conservar su estado documental, pero la deuda física permanece |
| `OPERATIVA` + activo reconciliado     | `NEVER_OBSERVED`, `LATE`, `STALE` o equivalente no elegible | bloqueo de selección conforme a PRINT-ARC                                                                           |
| `OPERATIVA` + activo reconciliado     | señal fresca y estado elegible                              | puede avanzar a route/target; no prueba resultado del job                                                           |
| retirado o disposición física cerrada | cualquiera                                                  | no se selecciona para nuevos trabajos; relaciones vigentes deben cerrarse                                           |

La matriz no reemplaza los estados exactos de PRINT-ARC; solo fija la precedencia de la dimensión física.

---

#### 17. Mantenimiento, reparación y diagnóstico físico

El mantenimiento de la impresora se gobierna como intervención sobre el activo, no como edición del estado de la cola.

Un registro de mantenimiento deberá poder referenciar:

```text
asset_reference
printer_reference_when_reconciled
maintenance_type
reported_condition
case_or_incident_reference_when_applicable
scheduled_at
started_at
performed_at
responsible_or_provider_reference
work_performed
parts_or_components_replaced
cost_reference_when_applicable
resulting_physical_condition
next_service_reference_when_applicable
evidence_references
post_maintenance_test_reference
```

Reglas:

1. NEXO conserva el registro físico y la historia;
2. PRINT-ARC consume el efecto sobre elegibilidad;
3. cerrar mantenimiento no equivale a aprobar impresión;
4. el retorno productivo requiere la prueba aplicable del servicio de impresión;
5. un proveedor de reparación no adquiere autoridad sobre route, target, permisos o datos imprimibles;
6. partes reemplazadas y costos se registran en sus fuentes propietarias;
7. no se declara reparación ejecutada sin evidencia;
8. la Epson L5590 permanece bloqueada mientras no exista cierre físico y prueba suficiente.

---

#### 18. Garantía y proveedor

Para una impresora reconciliada se deberá poder conocer, por referencia:

- garantía vigente o desconocida;
- proveedor o fabricante cuando exista fuente;
- canal autorizado de soporte;
- restricciones de apertura o reparación que afecten garantía;
- evidencia de compra cuando la fuente propietaria la conserve;
- incidente, mantenimiento o cambio relacionado;
- resultado de servicio externo.

Contrato, renovación, costo y relación económica pertenecen a `TI-DOM-012` y a los dominios económicos propietarios. TI-DOM-005 solo exige que la impresora física pueda referenciarlos sin duplicarlos.

---

#### 19. Medios, consumibles y repuestos

Una impresora deberá poder referenciar el perfil de medio y consumibles requerido por su capacidad aprobada.

Dimensiones mínimas:

- familia de papel o etiqueta;
- dimensiones compatibles;
- térmica directa, transferencia, tinta o mecanismo aplicable;
- ribbon cuando aplique;
- tinta o toner cuando aplique;
- capacidad o condición de cortador cuando aplique;
- repuesto crítico aprobado cuando exista;
- disponibilidad observada cuando la fuente propietaria la proporcione;
- incompatibilidad conocida;
- evidencia de prueba con el medio real.

Reglas:

1. un consumible no forma parte de la identidad del activo;
2. la ausencia de papel, ribbon o tinta puede hacer no utilizable el servicio sin declarar dañado el activo;
3. la compatibilidad nominal no prueba calidad física;
4. el stock se mantiene en el dominio de inventario propietario;
5. TI no crea cantidades ni mínimos de reposición en esta tarea;
6. sustituir medio por otro perfil no se hace silenciosamente para evitar un bloqueo;
7. etiquetas no se degradan a A4 y tiquetes de 80 mm no se degradan a otro medio por conveniencia;
8. consumibles sensibles o con requisitos de trazabilidad conservan las reglas de su dominio propietario.

---

#### 20. Ubicación, custodia y punto operativo

NEXO conserva ubicación y custodia del bien físico.

PRINT-ARC conserva sede, área y punto requeridos para routing.

La reconciliación exige:

```text
UBICACIÓN FÍSICA NEXO
↔
PUNTO OPERATIVO PRINT-ARC
```

sin asumir equivalencia por texto.

Reglas:

1. mover una impresora no cambia automáticamente su `PRN-*`;
2. un movimiento físico debe conservar historia;
3. el movimiento obliga a revisar route, target, canal y dependencias;
4. una impresora encontrada en otro punto no se reasigna mediante discovery local;
5. una ruta no actualiza la ubicación del activo;
6. una ubicación de activo no crea por sí sola una ruta de impresión;
7. custodia colectiva no equivale a ausencia de responsable técnico;
8. responsabilidad técnica, custodia y autoridad de cambio permanecen separadas.

---

#### 21. Cambio de canal o configuración

Son cambios tecnológicos, como mínimo:

- USB ↔ LAN ↔ Wi-Fi ↔ Bluetooth;
- incorporación o retiro de puente local;
- cambio de driver;
- cambio de firmware;
- cambio de IP, reserva o configuración de red;
- cambio de host;
- cambio de puerto lógico;
- cambio de adaptador;
- cambio de configuración que afecte lenguaje, tamaño, corte o medio;
- cambio de ubicación que modifique routing o dependencia;
- sustitución del dispositivo.

Su aprobación, ventana, prueba, rollback y revisión pertenecen a `TI-DOM-009`.

TI-DOM-005 exige preservar:

- estado anterior;
- identidad física;
- binding anterior;
- binding nuevo;
- motivo;
- cambio autorizado;
- prueba posterior;
- resultado;
- posibilidad de reversión;
- efecto sobre route/target y health.

Una modificación manual que resuelve temporalmente un fallo no se convierte en configuración estándar por haber funcionado una vez.

---

#### 22. Reparación frente a sustitución

Se distinguen:

```text
REPARACIÓN
→ mismo bien físico posible
→ misma identidad NEXO
→ mantenimiento versionado
→ reevaluación de condición
→ prueba PRINT-ARC antes de habilitar servicio

SUSTITUCIÓN
→ bien físico distinto
→ nueva identidad NEXO
→ cierre del vínculo físico anterior
→ nueva reconciliación
→ actualización controlada de binding / route / target según PRINT-ARC
→ prueba física
```

No se reutiliza el asset ID anterior para el nuevo equipo.

La decisión de continuidad o versión de `PRN-*` pertenece al contrato del servicio de impresión; TI-DOM-005 no renombra la referencia por intuición.

---

#### 23. Despliegue de un equipo almacenado

Para `PRN-VP-ZD230-01` se conserva:

```text
ALMACENADA
→ no canal activo
→ no heartbeat productivo esperado
→ no routing ejecutable
```

La salida requiere, sin ejecutar desde esta tarea:

1. reconciliación con un activo individual;
2. inspección de variante física e interfaces;
3. punto y ubicación aprobados;
4. medio compatible;
5. canal y binding materializados;
6. adaptador aplicable;
7. health observable y elegible;
8. route/target vigentes;
9. prueba física de impresión satisfactoria;
10. evidencia de aceptación.

La tarea no selecciona por anticipado USB, LAN, Wi-Fi o Bluetooth para esa unidad.

---

#### 24. Equipo en mantenimiento

Para `PRN-VP-L5590-01`:

```text
REQUIERE_MANTENIMIENTO
→ canal operativo no disponible
→ selección bloqueada
```

Un cambio de estado solo podrá apoyarse en:

- identidad física reconciliada;
- reparación o sustitución real;
- evidencia del trabajo;
- condición posterior;
- binding operativo;
- health verificable;
- prueba A4 satisfactoria.

La mera actualización de un campo de estado no satisface la salida.

---

#### 25. Ausencia de capacidad de 80 mm en Vento Producción

`CH-SIN-DISPOSITIVO-COMPATIBLE` y el target asociado continúan representando ausencia real de capacidad.

Reglas:

1. no se crea una impresora ficticia;
2. no se reutiliza la Zebra por ser un periférico disponible;
3. no se degrada a A4;
4. no se toma una impresora de otra sede por descubrimiento;
5. cualquier incorporación futura exige activo, route, target, binding, health y prueba;
6. la incorporación física solo puede ejecutarse dentro de un alcance de implementación aprobado.

---

#### 26. Retiro físico

Un retiro deberá cerrar de forma coordinada:

- ciclo del activo NEXO;
- ubicación y custodia vigentes;
- binding físico;
- canal vigente;
- health esperado;
- selección como target cuando corresponda;
- relación con host o red;
- mantenimiento pendiente;
- garantía o proveedor aplicables;
- evidencia de disposición.

Historia de jobs, receipts, documentos y auditoría no se elimina porque el equipo se retire.

Un dispositivo retirado no reaparece por ser detectado localmente.

---

#### 27. Incidentes y soporte

El diagnóstico debe separar:

```text
FALLA DEL ACTIVO
FALLA DE ENERGÍA
FALLA DEL HOST
FALLA DE RED
FALLA DEL CANAL
FALLA DEL ADAPTADOR
FALLA DE COLA
FALLA DE JOB
RESULTADO DESCONOCIDO
FALTA DE CONSUMIBLE
CONFIGURACIÓN DIVERGENTE
```

`TI-DOM-007` será propietario del incidente, impacto, prioridad, comunicación y cierre.

TI-DOM-005 aporta el contexto físico:

- activo;
- printer reference;
- sede y punto;
- modelo;
- condición;
- binding;
- host o red;
- último mantenimiento;
- garantía;
- consumible;
- cambio reciente;
- evidencia disponible.

No se marca como reparada una impresora porque el ticket se cierre.

---

#### 28. Seguridad del soporte

1. una interfaz de administración de impresora no concede autoridad empresarial;
2. soporte de proveedor será mínimo, temporal y trazable;
3. credenciales, PSK, tokens y secretos no se guardan en inventario o tickets;
4. un técnico no debe imprimir datos empresariales reales para probar conectividad cuando un artefacto de prueba controlado sea suficiente;
5. un equipo de otra sede no se usa como fallback por acceso técnico accidental;
6. discovery local no permite reasignar routing;
7. logs de diagnóstico no deben copiar contenido sensible del job;
8. un cambio remoto sobre firmware, driver, red o configuración requiere autoridad de cambio;
9. los datos de topología y direccionamiento se exponen solo cuando sean necesarios para soporte;
10. la evidencia física conserva las reglas de privacidad y retención vigentes.

---

#### 29. `TI-PRINT-CHANGE-SUPPORT-HANDOFF-001`

| Situación                             | Autoridad primaria                                                          | Participación de TI-DOM-005                                 | Condición de salida                                                          |
| ------------------------------------- | --------------------------------------------------------------------------- | ----------------------------------------------------------- | ---------------------------------------------------------------------------- |
| alta de una impresora física          | NEXO                                                                        | exigir reconciliación con PRINT-ARC antes de disponibilidad | activo individual + `PRN-*`/target según contrato + binding + prueba         |
| reubicación                           | NEXO + `TI-DOM-009`                                                         | revisar dependencias y route/target afectados               | movimiento registrado, binding revisado y prueba aplicable                   |
| cambio USB/LAN/Wi-Fi/Bluetooth        | `TI-DOM-009` + PRINT-ARC                                                    | conservar identidad física y versionar dependencia          | cambio aprobado, binding nuevo y prueba                                      |
| cambio IP/reserva/red                 | `TI-DOM-004` + `TI-DOM-009`                                                 | mantener referencia sin convertir IP en identidad           | red reconciliada, binding actualizado y prueba                               |
| mantenimiento                         | NEXO                                                                        | bloquear o mantener la condición física correcta            | trabajo y condición posterior con evidencia                                  |
| incidente de impresión                | `TI-DOM-007` + PRINT-ARC                                                    | aportar contexto físico y dependencias                      | servicio restaurado y validado, sin confundir cierre con reparación          |
| sustitución                           | NEXO + `TI-DOM-009`                                                         | cerrar vínculo anterior y exigir nueva reconciliación       | nuevo activo, binding controlado y prueba                                    |
| retiro                                | NEXO                                                                        | cerrar bindings y elegibilidad sin borrar historia          | disposición y relaciones cerradas                                            |
| monitoreo runtime                     | `TI-DOM-010` + PRINT-ARC                                                    | proporcionar dimensiones físicas estables                   | señales correlacionables con printer/asset/site                              |
| contrato, garantía, costo             | `TI-DOM-012`                                                                | referenciar, no duplicar                                    | fuente económica/contractual vigente                                         |
| acceso privilegiado                   | `TI-AUTH-*`                                                                 | exigir autorización antes de intervención                   | principal, alcance, vigencia y evidencia                                     |
| implementación física del carril NEXO | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` si resulta aprobada | entregar el contrato y la matriz como entrada               | alcance aprobado y cambios ejecutados por su paquete, con pruebas aplicables |

---

#### 30. Estado material de los nueve dispositivos

| `printer_reference`         | Gobierno físico                                               | Binding físico         | Health runtime               | Decisión actual de TI-DOM-005                          |
| --------------------------- | ------------------------------------------------------------- | ---------------------- | ---------------------------- | ------------------------------------------------------ |
| `PRN-VP-ZD230-01`           | `PENDIENTE_DE_EVIDENCIA`                                      | sin canal activo       | `NOT_EXPECTED`               | conservar almacenada y bloquear despliegue             |
| `PRN-VP-L5590-01`           | `PENDIENTE_DE_EVIDENCIA`                                      | sin canal operativo    | `NOT_EXPECTED`               | conservar mantenimiento y bloquear selección           |
| `PRN-ADMIN-L4260-01`        | `PENDIENTE_DE_EVIDENCIA`; existe candidato NEXO no confirmado | USB/Wi-Fi documentados | sin muestra runtime canónica | no convertir candidato en vínculo sin evidencia        |
| `PRN-MOLKA-DIGE200I-01`     | `PENDIENTE_DE_EVIDENCIA`                                      | USB documentado        | sin muestra runtime canónica | individualizar activo antes de validar relación física |
| `PRN-SAUDO-DIGE200I-01`     | `PENDIENTE_DE_EVIDENCIA`                                      | USB documentado        | sin muestra runtime canónica | individualizar activo antes de validar relación física |
| `PRN-VC-CAJA-DIGE200I-01`   | `PENDIENTE_DE_EVIDENCIA`                                      | USB documentado        | sin muestra runtime canónica | no repartir el grupo físico por heurística             |
| `PRN-VC-BARRA-DIGE200I-01`  | `PENDIENTE_DE_EVIDENCIA`                                      | LAN documentado        | sin muestra runtime canónica | no repartir el grupo físico por heurística             |
| `PRN-VC-BAR-DIGE200I-01`    | `PENDIENTE_DE_EVIDENCIA`                                      | LAN documentado        | sin muestra runtime canónica | no repartir el grupo físico por heurística             |
| `PRN-VC-COCINA-DIGE200I-01` | `PENDIENTE_DE_EVIDENCIA`                                      | LAN documentado        | sin muestra runtime canónica | no repartir el grupo físico por heurística             |

La matriz distingue de forma deliberada `estado documental operativo` de `relación física validada`.

---

#### 31. Hallazgos y cierre documental

| ID                 | Hallazgo                                                                                               | Estado                   | Propietario                                      | Condición de salida                                                  |
| ------------------ | ------------------------------------------------------------------------------------------------------ | ------------------------ | ------------------------------------------------ | -------------------------------------------------------------------- |
| `H-TI-DOM-005-001` | nueve `PRN-*` existen en PRINT-ARC pero ninguna relación individual con NEXO está actualmente validada | `PENDIENTE_DE_EVIDENCIA` | NEXO + paquete físico aplicable                  | 9/9 relaciones individualizadas o cada excepción documentada         |
| `H-TI-DOM-005-002` | el candidato `ACT-EQP-MULTIF-000932-MRF4E56U` no prueba por sí solo la L4260                           | `PENDIENTE_DE_EVIDENCIA` | NEXO                                             | modelo/serie o evidencia inequívoca                                  |
| `H-TI-DOM-005-003` | un grupo de tres impresoras térmicas no puede materializar cuatro identidades Vento Café               | `PENDIENTE_DE_EVIDENCIA` | NEXO                                             | individualización física y conciliación de cantidad/ubicación        |
| `H-TI-DOM-005-004` | BrowserPrint discovery y `uid` local no constituyen binding canónico                                   | `ESPECIFICADO`           | PRINT-ARC / implementación propietaria           | binding implementado contra identidades canónicas                    |
| `H-TI-DOM-005-005` | el callback actual de envío no demuestra ejecución física                                              | `ESPECIFICADO`           | PRINT-ARC                                        | receipt y prueba física conforme al contrato aprobado                |
| `H-TI-DOM-005-006` | la Zebra sigue almacenada y sin canal real verificado                                                  | `BLOQUEADO`              | alcance físico del paquete NEXO + PRINT-ARC      | despliegue autorizado, binding, health y prueba                      |
| `H-TI-DOM-005-007` | la L5590 sigue en mantenimiento                                                                        | `BLOQUEADO`              | NEXO + PRINT-ARC                                 | reparación/sustitución, health y prueba A4                           |
| `H-TI-DOM-005-008` | Vento Producción no dispone de 80 mm compatible                                                        | `BLOQUEADO`              | alcance físico del paquete aplicable + PRINT-ARC | activo compatible, route/target, binding, health y prueba            |
| `H-TI-DOM-005-009` | no hay evidencia runtime canónica de health/heartbeat/receipts para los siete dispositivos operativos  | `PENDIENTE_DE_EVIDENCIA` | PRINT-ARC-018 a PRINT-ARC-020                    | productores, monitoreo y corrida física controlada                   |
| `H-TI-DOM-005-010` | no se localizaron registros de mantenimiento asociados a las evidencias de impresora consultadas       | `PENDIENTE_DE_EVIDENCIA` | NEXO                                             | mantenimiento real queda vinculado a activo individual cuando exista |

No queda un hallazgo narrativo sin propietario y condición de salida.

---

#### 32. Estado de materialización

| Componente                          | Estado                          |
| ----------------------------------- | ------------------------------- |
| frontera NEXO / TI / PRINT-ARC      | `ESPECIFICADO`                  |
| contrato de identidad física        | `ESPECIFICADO`                  |
| nueve decisiones `PRN-*`            | `ESPECIFICADO`                  |
| relación individual `PRN-* ↔ asset` | `PENDIENTE_DE_EVIDENCIA` en 9/9 |
| roles de dependencia                | `ESPECIFICADO`                  |
| bindings runtime implementados      | `FUERA_DE_ALCANCE`              |
| mantenimiento físico ejecutado      | `FUERA_DE_ALCANCE`              |
| instalación o reubicación           | `FUERA_DE_ALCANCE`              |
| cambios de red/driver/firmware      | `FUERA_DE_ALCANCE`              |
| monitoreo runtime                   | `FUERA_DE_ALCANCE`              |
| prueba física                       | `FUERA_DE_ALCANCE`              |
| piloto                              | `FUERA_DE_ALCANCE`              |
| cambios Supabase                    | `NO_APLICA`                     |

La falta de evidencia física bloquea la reconciliación de instancias, no la definición documental.

---

#### 33. Invariantes

1. NEXO conserva el activo físico.
2. PRINT-ARC conserva `PRN-*`, route, target, channel, adapter, job y receipt.
3. TI-DOM-005 conserva el contrato de reconciliación, no una tercera identidad.
4. `PRN-*` no es `asset_id`.
5. BrowserPrint UID no es `asset_id`.
6. IP no es identidad de impresora.
7. MAC no es identidad de impresora.
8. una cola no es una impresora.
9. un target no es una impresora.
10. un canal no es una impresora.
11. un adaptador no es una impresora.
12. un trabajo no es una impresora.
13. una impresora detectable no se presume inventariada.
14. una impresora inventariada no se presume saludable.
15. una impresora saludable no prueba impresión física.
16. un receipt de adaptador no prueba entrega física.
17. un activo almacenado no se vuelve operativo por heartbeat.
18. un activo en mantenimiento no se vuelve operativo por discovery.
19. un activo operativo puede seguir bloqueado para PRINT-ARC.
20. producto genérico no equivale a activo individual.
21. grupo de activos no se descompone por intuición.
22. reparación conserva identidad del mismo bien.
23. sustitución por otro bien exige nueva identidad NEXO.
24. reubicación conserva historia y obliga a revisar routing.
25. cambio de canal conserva identidad física si el equipo es el mismo.
26. consumible no forma parte de identidad.
27. stock de consumibles no se duplica en TI.
28. cambio manual no se normaliza sin gobierno.
29. soporte no concede autorización empresarial.
30. una aplicación no selecciona impresora saltándose PRINT-ARC.
31. history de jobs y receipts no se borra al retirar el activo.
32. no se inventan seriales, IP, MAC, puertos, drivers, firmware, activos, periféricos o resultados.
33. esta tarea no modifica infraestructura ni Supabase.

---

#### 34. Criterios de aceptación

- [x] se conserva la continuidad `TI-DOM-004 → TI-DOM-005 → TI-DOM-006`;
- [x] la tarea permanece exclusivamente documental;
- [x] se preservan las nueve identidades `PRN-*` de PRINT-ARC;
- [x] las nueve identidades reciben una decisión individual de reconciliación física;
- [x] 9/9 quedan `PENDIENTE_DE_EVIDENCIA` y ninguna se declara validada por inferencia;
- [x] se registra el candidato NEXO administrativo sin convertirlo en binding;
- [x] se registra la evidencia grupal de tres impresoras térmicas sin repartirla entre cuatro identidades;
- [x] NEXO conserva activo, ubicación, custodia, condición, mantenimiento, garantía y disposición;
- [x] PRINT-ARC conserva route, target, channel, adapter, job, health, heartbeat y receipt;
- [x] BrowserPrint UID se clasifica como evidencia técnica y no como identidad física;
- [x] IP, MAC, driver, puerto y nombre de dispositivo no crean identidad;
- [x] se definen siete roles de dependencia física/técnica sin crear nuevas clases canónicas;
- [x] se separan condición física, estado administrativo, health, canal, job y receipt;
- [x] se define precedencia de bloqueo físico frente a health;
- [x] se definen mantenimiento, garantía, consumibles y repuestos sin duplicar sus fuentes propietarias;
- [x] se definen reparación, sustitución, despliegue, movimiento y retiro;
- [x] se conserva la ausencia real de Zebra desplegada, L5590 disponible y 80 mm en Vento Producción;
- [x] todos los hallazgos tienen propietario y condición de salida;
- [x] no se ejecuta compra, instalación, reparación, reubicación, configuración o retiro;
- [x] no se cambia código, red, driver, firmware, datos, migraciones ni Supabase;
- [x] no se crean ni modifican requisitos de prueba;
- [x] `TI-DOM-006` permanece únicamente reservada.

---

#### 35. Cobertura de prueba consumida

La tarea consume cobertura ya vigente que protege:

- identidad estable y separación entre activo, impresora, configuración, red, cola, ruta y proveedor;
- interfaz, dirección estable, capacidades, consumibles, mantenimiento, heartbeat, adaptador, routing y fallback;
- cambio versionado de IP, driver, firmware, red o configuración con estado anterior, prueba y resultado;
- persistencia y resultado de trabajos enviados a periféricos;
- idempotencia, reintentos, resultado desconocido, reconciliación y recuperación controlada;
- correlación transversal entre activos, impresoras, servicios, monitoreo y cambios.

`TI-DOM-005` no reduce ni sustituye esa cobertura.

---

#### 36. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa la frontera física, la reconciliación de las nueve impresoras vigentes y los handoffs que ya están exigidos por la cobertura canónica de activos, hardware, impresión e integración. No introduce un efecto empresarial, algoritmo de routing, condición de autorización, semántica de retry, receipt, health o comportamiento de periférico adicional. Las nueve filas de reconciliación quedan como decisiones documentales y toda ejecución física posterior deberá satisfacer los requisitos ya vigentes.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 37. Continuidad

ÚLTIMA TAREA APROBADA
`TI-DOM-004 — Definir arquitectura, inventario, segmentación, direccionamiento, monitoreo y contingencia de redes`

TAREA ACTUAL APROBADA
`TI-DOM-005 — Definir gobierno de impresoras y periféricos físicos frente al servicio transversal de impresión`

SIGUIENTE TAREA RESERVADA
`TI-DOM-006 — Definir catálogo de aplicaciones, ambientes, dependencias, proveedores, licencias y criticidad`


### [ ] TI-DOM-006 — Definir catálogo de aplicaciones, ambientes, dependencias, proveedores, licencias y criticidad
### [ ] TI-DOM-007 — Definir solicitud de servicio, incidente, impacto, urgencia, prioridad, SLA, escalamiento, comunicación y cierre
### [ ] TI-DOM-008 — Definir problema, causa raíz, error conocido, workaround y prevención de recurrencia
### [ ] TI-DOM-009 — Definir cambio tecnológico, aprobación, ventana, prueba, despliegue, rollback y revisión posterior
### [ ] TI-DOM-010 — Definir monitoreo, eventos técnicos, alertas, logs, salud y observabilidad de servicios
### [ ] TI-DOM-011 — Definir respaldo, restauración, recuperación técnica y relación con continuidad empresarial
### [ ] TI-DOM-012 — Definir licencias, asientos, garantías, contratos, renovaciones, uso y costos tecnológicos
### [ ] TI-DOM-013 — Definir base de conocimiento, capacitación, adopción y comunicación de cambios tecnológicos
