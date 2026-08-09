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


### ✅ TI-DOM-006 — Definir catálogo de aplicaciones, ambientes, dependencias, proveedores, licencias y criticidad

**Estado:** APROBADA
**Tarea anterior:** `TI-DOM-005 — Definir gobierno de impresoras y periféricos físicos frente al servicio transversal de impresión` — APROBADA
**Tarea siguiente:** `TI-DOM-007 — Definir solicitud de servicio, incidente, impacto, urgencia, prioridad, SLA, escalamiento, comunicación y cierre` — RESERVADA
**Tipo de tarea:** documental; catálogo técnico-operativo materializado de aplicaciones, ambientes, dependencias, proveedores, licencias, contratos de salida y derivación de criticidad por instancia
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/01_DOMINIO_DE_TECNOLOGIA_Y_SOPORTE.md`
**Artefactos producidos:** `TI-APPLICATION-PORTFOLIO-CONTRACT-001`; `TI-APPLICATION-ENVIRONMENT-MATRIX-001`; `TI-APPLICATION-DEPENDENCY-MATRIX-001`; `TI-APPLICATION-PROVIDER-LICENSE-MATRIX-001`; `TI-APPLICATION-CRITICALITY-CONTRACT-001`; `TI-APPLICATION-ASIS-RECONCILIATION-001`
**Cambios físicos autorizados:** ninguno; no crea, modifica ni elimina aplicaciones, repositorios, ambientes, despliegues, dominios, cuentas, proveedores, contratos, licencias, asientos, secretos, datos, tablas, RLS, RPC, Edge Functions, migraciones, configuración o Supabase
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el catálogo técnico-operativo que permita administrar las diez aplicaciones canónicas de Vento sin confundir la identidad de aplicación con repositorio, ambiente, dominio, despliegue, proveedor, licencia, servicio tecnológico o proceso empresarial.

La tarea debe permitir responder, para cualquier instancia de aplicación:

- qué `app_code` canónico representa;
- qué repositorio implementa actualmente su código cuando exista evidencia;
- qué versión de manifiesto se observa sin presentarla como versión desplegada;
- qué ambientes y superficies técnicas están documentados;
- qué URL o canal de distribución se encuentra referenciado y con qué fuerza de evidencia;
- de qué plataformas, aplicaciones, datos y servicios depende;
- qué proveedores técnicos participan y bajo qué evidencia;
- qué contrato, licencia, asiento o renovación debe referenciar sin convertirlo en la identidad de la aplicación;
- qué propietario funcional y técnico conserva;
- qué datos o dominios funcionales trata sin asignar una sensibilidad global artificial;
- cómo se deriva su criticidad por instancia y proceso;
- qué ocurre si un proveedor, ambiente o dependencia deja de estar disponible;
- qué evidencia se exige para declarar una relación contractual, un ambiente o un despliegue como verificado.

Regla raíz:

```text
APLICACIÓN
≠ REPOSITORIO
≠ AMBIENTE
≠ URL
≠ DESPLIEGUE
≠ PROVEEDOR
≠ CONTRATO
≠ LICENCIA
≠ ASIENTO
≠ SERVICIO TECNOLÓGICO
≠ PROCESO EMPRESARIAL
```

El `app_code` permanece estable entre ambientes, sedes, plataformas y versiones.

---

#### 2. Resultado material

Se aprueban seis artefactos documentales:

1. `TI-APPLICATION-PORTFOLIO-CONTRACT-001`, con identidad, autoridad, frontera, ciclo y datos mínimos del catálogo tecnológico;
2. `TI-APPLICATION-ENVIRONMENT-MATRIX-001`, con una decisión de ambiente y superficie para las diez aplicaciones;
3. `TI-APPLICATION-DEPENDENCY-MATRIX-001`, con dependencias funcionales y técnicas mínimas, sin crear aristas por inferencia;
4. `TI-APPLICATION-PROVIDER-LICENSE-MATRIX-001`, con proveedores observados, estado contractual, licencia, asiento, renovación y salida;
5. `TI-APPLICATION-CRITICALITY-CONTRACT-001`, que impide asignar una criticidad global a una aplicación y define la derivación por instancia;
6. `TI-APPLICATION-ASIS-RECONCILIATION-001`, que reconcilia catálogo canónico, registro runtime, repositorios y superficies técnicas observadas.

Cobertura materializada:

| Elemento                                                     |             Cantidad |
| ------------------------------------------------------------ | -------------------: |
| Aplicaciones canónicas esperadas                             |               **10** |
| Aplicaciones materializadas                                  |         **10 de 10** |
| Códigos duplicados                                           |                **0** |
| Códigos nuevos                                               |                **0** |
| Filas runtime `public.apps` observadas                       |         **10 de 10** |
| Filas runtime activas observadas                             |         **10 de 10** |
| Repositorios propietarios confirmados                        |          **9 de 10** |
| Repositorio propietario pendiente                            |         **1 — AURA** |
| Aplicaciones con manifiesto técnico observado                |          **9 de 10** |
| Aplicaciones con perfiles EAS explícitos de ambiente         | **2 — ANIMA y PASS** |
| Aplicaciones con clase de criticidad global fija             |                **0** |
| Aplicaciones con regla explícita de derivación de criticidad |         **10 de 10** |
| Aplicaciones con licencia o asiento inventado                |                **0** |
| Cambios físicos                                              |                **0** |
| Cambios de requisitos de prueba                              |                **0** |

---

#### 3. Autoridades y entradas heredadas

La tarea conserva sin modificación:

- el catálogo canónico de diez aplicaciones aprobado por `AUTH-CAT-001`;
- la regla de código estable, en minúsculas, sin duplicación por ambiente, plataforma o sede;
- la separación `shell` como aplicación frente a `vento-shell` como repositorio;
- el estado de AURA como aplicación activa de catálogo con roadmap diferido;
- el dominio cliente de `pass`, separado del RBAC laboral;
- el diseño del catálogo versionado de `AUTH-CAT-017`;
- `TI-SERVICE-001` a `TI-SERVICE-011` y las cinco reglas de derivación de criticidad aprobadas en `TI-DOM-001`;
- la clase `APPLICATION` y `TI-REL-003`, `TI-REL-005` y `TI-REL-015` aprobadas en `TI-DOM-002`;
- `TI-DOM-003` como autoridad de endpoints y clientes instalados;
- `TI-DOM-004` como autoridad de red y direccionamiento;
- `TI-DOM-005` como autoridad de reconciliación física de impresoras;
- ORIGO como autoridad contractual y de compra cuando corresponda;
- NUMERA como autoridad de compromiso, gasto y costo;
- SHELL como autoridad de identidad de aplicación y política de acceso;
- VISO como autoridad de mesa de servicio y gobierno administrativo;
- `TI-DOM-007` como autoridad de impacto, urgencia, prioridad y SLA de casos;
- `TI-DOM-009` como autoridad de cambio tecnológico;
- `TI-DOM-010` como autoridad de observabilidad;
- `TI-DOM-011` como autoridad de respaldo y recuperación;
- `TI-DOM-012` como autoridad de licencias, garantías, contratos, renovaciones, uso y costos;
- `TI-AUTH-*` como autoridad de cuentas técnicas, privilegios, secretos y soporte sensible;
- los procesos empresariales como autoridad de su resultado, criticidad y ventana de disponibilidad.

Ninguna decisión de esta tarea concede acceso, modifica permisos ni redefine propiedad funcional de procesos.

---

#### 4. Fronteras del catálogo tecnológico

El catálogo tecnológico se superpone con otros registros sin sustituirlos:

```text
AUTH-CAT
→ identidad y clasificación canónica de la aplicación

SHELL
→ registro y navegación autorizada de aplicaciones

TI-DOM-006
→ instancia técnica, ambiente, dependencia, proveedor,
  licencia referenciada, soporte, criticidad derivada y salida

ORIGO
→ proveedor contratado, compra y contrato

NUMERA
→ compromiso, gasto, costo y conciliación económica

TI-DOM-012
→ uso de licencia, asiento, renovación, garantía y relación contractual tecnológica

PROCESO EMPRESARIAL
→ resultado, propietario y criticidad del proceso

E5 / T / U
→ implementación, pruebas, despliegue, piloto y certificación
```

Reglas:

1. TI no crea una aplicación porque encuentre un repositorio;
2. TI no crea un ambiente porque encuentre una URL;
3. una dependencia de paquete no prueba un contrato comercial;
4. una aplicación activa en registro no prueba que esté desplegada;
5. un dominio que responde no prueba que el ambiente sea el aprobado;
6. una licencia no concede autorización empresarial;
7. una cuenta técnica no equivale a asiento;
8. una factura no prueba que el servicio esté en uso;
9. una suscripción activa no prueba dependencia crítica;
10. un proveedor no se convierte en fuente de identidad, costo, proceso o autorización.

---

#### 5. `TI-APPLICATION-PORTFOLIO-CONTRACT-001`

Cada aplicación conserva conceptualmente:

```text
app_code
display_name
app_kind
identity_domain
roadmap_scope
lifecycle_status
functional_owner_ref
technical_owner_ref
repository_ref
manifest_version
surface_profile
environment_profiles[]
deployment_refs[]
dependency_refs[]
provider_refs[]
contract_refs[]
license_refs[]
seat_refs[]
renewal_refs[]
data_domain_refs[]
authentication_ref
criticality_derivation
support_ref
observability_ref
backup_recovery_ref
provider_exit_ref
evidence_refs[]
reconciliation_state
```

Reglas:

- `app_code` proviene del catálogo canónico y no se edita desde TI;
- `repository_ref` puede estar ausente sin crear otra identidad;
- `manifest_version` describe el manifiesto observado, no una release desplegada;
- `deployment_refs[]` requiere evidencia por ambiente;
- `provider_refs[]` no contiene secretos ni credenciales;
- `contract_refs[]`, `license_refs[]` y `seat_refs[]` apuntan a sus fuentes propietarias;
- `data_domain_refs[]` describe dominios funcionales, no una clasificación global de sensibilidad;
- `criticality_derivation` es obligatoria, pero no fija una clase única para toda la aplicación;
- toda relación incierta utiliza `PENDIENTE_DE_EVIDENCIA` con propietario y condición de salida.

---

#### 6. Catálogo canónico de aplicaciones

Se preservan exactamente las diez identidades aprobadas, en su orden canónico:

| `app_code` | Nombre     | Tipo canónico  | Dominio de identidad | Roadmap   | Ciclo de catálogo |
| ---------- | ---------- | -------------- | -------------------- | --------- | ----------------- |
| `shell`    | Vento OS   | Hub            | Laboral              | Núcleo    | `active`          |
| `anima`    | ANIMA      | Híbrida        | Laboral              | Núcleo    | `active`          |
| `viso`     | VISO       | Administrativa | Laboral              | Núcleo    | `active`          |
| `nexo`     | NEXO       | Híbrida        | Laboral              | Núcleo    | `active`          |
| `fogo`     | FOGO       | Operativa      | Laboral              | Núcleo    | `active`          |
| `origo`    | ORIGO      | Híbrida        | Laboral              | Núcleo    | `active`          |
| `pulso`    | PULSO      | Operativa      | Laboral              | Núcleo    | `active`          |
| `numera`   | NUMERA     | Híbrida        | Laboral              | Núcleo    | `active`          |
| `aura`     | AURA       | Administrativa | Laboral              | Diferido  | `active`          |
| `pass`     | Vento Pass | Cliente        | Cliente              | Adyacente | `active`          |

Control:

```text
10 esperadas
10 materializadas
0 omitidas
0 duplicadas
0 renombradas
0 añadidas
```

`active` significa pertenencia al catálogo vigente. No significa disponibilidad, despliegue, acceso o inclusión inmediata en el roadmap.

---

#### 7. Estado AS-IS del registro runtime

La lectura de solo consulta del registro vigente `public.apps` materializa exactamente los diez códigos canónicos:

```text
anima
aura
fogo
nexo
numera
origo
pass
pulso
shell
viso
```

Las diez filas observadas tienen `is_active = true`.

La reconciliación queda:

| Control                                | Resultado |
| -------------------------------------- | --------- |
| Códigos canónicos                      | 10        |
| Códigos runtime                        | 10        |
| Coincidencias por código               | 10        |
| Códigos runtime fuera del catálogo     | 0         |
| Códigos canónicos ausentes del runtime | 0         |
| Duplicados por código                  | 0         |

La coincidencia registral no demuestra ambientes, proveedores, licencias ni disponibilidad.

---

#### 8. Reconciliación de repositorios y versiones de manifiesto

El repositorio es evidencia técnica de implementación, no identidad de aplicación.

| `app_code` | Repositorio observado        | Versión de manifiesto observada | Superficie técnica observada               | Estado                   |
| ---------- | ---------------------------- | ------------------------------- | ------------------------------------------ | ------------------------ |
| `shell`    | `devVentoGroup/vento-shell`  | `0.1.0`                         | Next.js web                                | `REPOSITORIO_CONFIRMADO` |
| `anima`    | `devVentoGroup/vento-anima`  | `1.3.4`                         | Expo / React Native; script web disponible | `REPOSITORIO_CONFIRMADO` |
| `viso`     | `devVentoGroup/vento-viso`   | `0.1.0`                         | Next.js web                                | `REPOSITORIO_CONFIRMADO` |
| `nexo`     | `devVentoGroup/vento-nexo`   | `0.1.0`                         | Next.js web                                | `REPOSITORIO_CONFIRMADO` |
| `fogo`     | `devVentoGroup/vento-fogo`   | `0.1.0`                         | Next.js web                                | `REPOSITORIO_CONFIRMADO` |
| `origo`    | `devVentoGroup/vento-origo`  | `0.1.0`                         | Next.js web                                | `REPOSITORIO_CONFIRMADO` |
| `pulso`    | `devVentoGroup/vento-pulso`  | `0.1.0`                         | Next.js web                                | `REPOSITORIO_CONFIRMADO` |
| `numera`   | `devVentoGroup/vento-numera` | `0.1.0`                         | Next.js web                                | `REPOSITORIO_CONFIRMADO` |
| `aura`     | no confirmado                | no confirmado                   | no confirmada                              | `PENDIENTE_DE_EVIDENCIA` |
| `pass`     | `devVentoGroup/vento-pass`   | `2.0.0`                         | Expo / React Native                        | `REPOSITORIO_CONFIRMADO` |

La versión del `package.json` no se presenta como versión productiva, release certificada ni versión de contrato.

Para AURA:

- `AURA-AUD-001` conserva la confirmación del repositorio;
- `AURA-AUD-002` conserva la confirmación del estado real;
- `AURA-AUD-010` conserva la decisión de continuidad, reemplazo o retiro;
- mientras esas tareas no cierren, TI-DOM-006 no inventa repositorio, versión ni proveedor.

---

#### 9. Contrato de ambiente

Un ambiente se identifica por la combinación:

```text
app_code
+
environment_role
+
surface_or_distribution_channel
+
deployment_or_build_reference
```

No se crea un nuevo `app_code`.

Se aprueban seis roles descriptivos:

| Rol           | Significado                                                 |
| ------------- | ----------------------------------------------------------- |
| `DEVELOPMENT` | ejecución de desarrollo no productiva                       |
| `CI`          | ejecución automática destinada a build, pruebas y controles |
| `PREVIEW`     | superficie temporal o distribución interna para revisión    |
| `STAGING`     | ambiente estable de validación previa cuando exista         |
| `PRODUCTION`  | ambiente autorizado para operación real                     |
| `SANDBOX`     | ambiente aislado de proveedor o integración externa         |

Estos roles no prueban que exista físicamente un ambiente. Cada instancia debe materializar evidencia.

---

#### 10. Estados de evidencia de ambiente

Se aprueban:

```text
CONFIGURADO_EN_REPOSITORIO
REFERENCIADO_EN_CODIGO
DESPLIEGUE_VERIFICADO
PENDIENTE_DE_EVIDENCIA
NO_APLICA
```

Reglas:

1. `CONFIGURADO_EN_REPOSITORIO` demuestra una configuración declarada;
2. `REFERENCIADO_EN_CODIGO` demuestra una referencia consumida por código;
3. `DESPLIEGUE_VERIFICADO` exige evidencia del ambiente realmente desplegado;
4. un dominio escrito en código no alcanza `DESPLIEGUE_VERIFICADO`;
5. un build exitoso no alcanza `DESPLIEGUE_VERIFICADO`;
6. una fila `public.apps` activa no alcanza `DESPLIEGUE_VERIFICADO`;
7. `PENDIENTE_DE_EVIDENCIA` debe indicar qué evidencia falta y quién la aporta.

---

#### 11. `TI-APPLICATION-ENVIRONMENT-MATRIX-001`

| `app_code` | Evidencia de ambiente actual                                                                            | Referencia de superficie / canal         | Decisión                                                                                                           |
| ---------- | ------------------------------------------------------------------------------------------------------- | ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| `shell`    | web Next.js; dos orígenes productivos distintos aparecen en fuentes actuales                            | `os.ventogroup.co` y `hub.ventogroup.co` | `PENDIENTE_DE_EVIDENCIA`: reconciliar un origen canónico o alias explícito antes de declarar producción verificada |
| `anima`    | perfiles EAS `development`, `preview` y `production`; referencia web del ecosistema                     | `anima.ventogroup.co`; canales EAS       | `CONFIGURADO_EN_REPOSITORIO` para perfiles EAS; URL `REFERENCIADO_EN_CODIGO`; disponibilidad real no inferida      |
| `viso`     | Next.js web                                                                                             | `viso.ventogroup.co`                     | URL `REFERENCIADO_EN_CODIGO`; despliegue y ambiente exacto requieren evidencia                                     |
| `nexo`     | Next.js web                                                                                             | `nexo.ventogroup.co`                     | URL `REFERENCIADO_EN_CODIGO`; despliegue y ambiente exacto requieren evidencia                                     |
| `fogo`     | Next.js web                                                                                             | `fogo.ventogroup.co`                     | URL `REFERENCIADO_EN_CODIGO`; despliegue y ambiente exacto requieren evidencia                                     |
| `origo`    | Next.js web                                                                                             | `origo.ventogroup.co`                    | URL `REFERENCIADO_EN_CODIGO`; despliegue y ambiente exacto requieren evidencia                                     |
| `pulso`    | Next.js web                                                                                             | `pulso.ventogroup.co`                    | URL `REFERENCIADO_EN_CODIGO`; despliegue y ambiente exacto requieren evidencia                                     |
| `numera`   | Next.js web                                                                                             | `numera.ventogroup.co`                   | URL `REFERENCIADO_EN_CODIGO`; despliegue y ambiente exacto requieren evidencia                                     |
| `aura`     | URL incluida en un selector actual con estado de próxima disponibilidad; roadmap canónico diferido      | `aura.ventogroup.co`                     | `PENDIENTE_DE_EVIDENCIA`: referencia no equivale a ambiente operativo ni autoriza implementación                   |
| `pass`     | perfiles EAS `development`, `preview` y `production`; producción configurada para distribución en store | canales EAS / stores                     | `CONFIGURADO_EN_REPOSITORIO`; release instalada o publicada requiere evidencia independiente                       |

No se asigna `STAGING` a ninguna aplicación que no lo demuestre.

---

#### 12. Drift actual entre consumidores del catálogo

Se observa que distintas superficies mantienen subconjuntos o estados diferentes del catálogo:

- el launcher runtime de SHELL materializa cinco aplicaciones laborales;
- un selector actual del shell estándar en NEXO materializa nueve entradas del ecosistema, con AURA como próxima;
- el catálogo canónico conserva diez aplicaciones;
- Vento Pass no debe incorporarse a un selector laboral por el solo hecho de ser la décima aplicación, porque su dominio principal es cliente;
- `shell` puede mostrarse humanamente como Hub, pero su código no cambia a `hub`;
- los estados locales `active` o `soon` no sustituyen `lifecycle_status` ni `roadmap_scope`.

Decisión:

```text
LISTA LOCAL DE UN CONSUMIDOR
≠
CATÁLOGO CANÓNICO
```

La tarea no modifica esas listas. Conserva el drift como deuda de consumo ya protegida por los contratos de catálogo y continuidad correspondientes.

---

#### 13. Contrato de dependencia

Una dependencia de aplicación deberá conservar:

```text
app_code
environment_role
dependency_kind
dependency_ref
direction
required_capability
failure_effect
degraded_behavior_ref
data_or_event_contract_ref
authentication_ref
owner_ref
evidence_state
effective_from
effective_to
```

Clases iniciales:

| Clase               | Uso                                                           |
| ------------------- | ------------------------------------------------------------- |
| `AUTHORIZATION`     | identidad, sesión, permiso o contexto necesarios              |
| `DATA_PLATFORM`     | base, almacenamiento, funciones o servicios de datos          |
| `APPLICATION`       | otra aplicación cuyo contrato produce una capacidad consumida |
| `INTEGRATION`       | API, evento, webhook, archivo o adaptador                     |
| `NETWORK`           | conectividad o resolución necesaria                           |
| `ENDPOINT`          | cliente administrado o dispositivo requerido                  |
| `PERIPHERAL`        | impresión, captura o efecto físico                            |
| `EXTERNAL_PROVIDER` | proveedor ajeno al ecosistema que presta una capacidad        |
| `OBSERVABILITY`     | telemetría, alertas o diagnóstico                             |
| `DISTRIBUTION`      | canal de build, store o publicación                           |

Una dependencia se materializa solo con contrato o evidencia. Coincidencia de paquete, URL o nombre no crea una dependencia empresarial no demostrada.

---

#### 14. Dependencias técnicas observadas por repositorio

Las nueve aplicaciones con repositorio confirmado declaran una dependencia de cliente Supabase en su manifiesto técnico.

| `app_code` | Base técnica principal observada | Dependencias técnicas relevantes observadas         |
| ---------- | -------------------------------- | --------------------------------------------------- |
| `shell`    | Next.js                          | Supabase SSR/JS                                     |
| `anima`    | Expo / React Native              | Supabase JS; Expo Updates/Notifications; Sentry SDK |
| `viso`     | Next.js                          | Supabase SSR/JS                                     |
| `nexo`     | Next.js                          | Supabase SSR/JS; utilidades de códigos e inventario |
| `fogo`     | Next.js                          | Supabase SSR/JS; renderizado PDF                    |
| `origo`    | Next.js                          | Supabase SSR/JS                                     |
| `pulso`    | Next.js                          | Supabase SSR/JS; procesamiento XLSX                 |
| `numera`   | Next.js                          | Supabase SSR/JS                                     |
| `aura`     | no confirmado                    | `PENDIENTE_DE_EVIDENCIA`                            |
| `pass`     | Expo / React Native              | Supabase JS; RevenueCat SDK; utilidades PassKit     |

Estas observaciones prueban dependencias de código. No prueban:

- contrato vigente;
- ambiente de proveedor;
- cuenta técnica propietaria;
- licencia pagada;
- asiento asignado;
- SLA;
- consumo;
- fecha de renovación.

---

#### 15. Dependencias funcionales canónicas mínimas

| `app_code` | Dependencias funcionales que deben permanecer correlacionables                                                                                      |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `shell`    | identidad y autorización; catálogo de aplicaciones; destinos de aplicaciones consumidoras; sesión y navegación central                              |
| `anima`    | trabajador; programación publicada por VISO; asistencia y contexto operativo; documentos y notificaciones del trabajador                            |
| `viso`     | identidad laboral; roles, permisos, sedes y áreas; programación; mesa de servicio; auditoría administrativa                                         |
| `nexo`     | inventario, logística, activos y ubicaciones; autorización; servicio transversal de impresión cuando exista salida física                           |
| `fogo`     | producto, receta, producción, lote y trazabilidad; inventario relacionado; impresión cuando el proceso la requiera                                  |
| `origo`    | proveedor, compra, orden y recepción; inventario y costo relacionados mediante contratos propietarios                                               |
| `pulso`    | venta, orden, pago y operación POS; fidelización y datos económicos mediante contratos propietarios                                                 |
| `numera`   | gastos, costos, compromisos, ingresos y hechos económicos originados en dominios propietarios                                                       |
| `aura`     | NEXO, PULSO, PASS, NUMERA, VISO y FOGO mediante lectura o eventos autorizados; canales externos solo después de auditoría y decisión de continuidad |
| `pass`     | identidad cliente, fidelización y hechos de compra/redención; plataformas externas únicamente mediante contratos autorizados                        |

La tabla expresa fronteras que deben poder reconciliarse. No declara que todas esas integraciones estén implementadas.

---

#### 16. Relación con `TI-REL-015`

`TI-REL-015 — SERVICE_DEPENDS_ON_APPLICATION` permanece como relación directa entre `TECH_SERVICE` y `APPLICATION`.

Reglas específicas:

1. no se crea una arista `TI-REL-015` porque una aplicación exista en `public.apps`;
2. una dependencia de un servicio requiere demostrar que la indisponibilidad o degradación de la aplicación afecta ese servicio;
3. `TI-SERVICE-005 — Aplicaciones, ambientes y proveedores tecnológicos` administra el universo de diez aplicaciones, pero esa administración no convierte automáticamente cada fila en una dependencia de todos los demás servicios;
4. solicitudes e incidentes podrán referenciar aplicaciones afectadas en `TI-DOM-007`;
5. cambios podrán referenciar aplicaciones afectadas en `TI-DOM-009`;
6. observabilidad podrá recorrer relaciones de dependencia en `TI-DOM-010`;
7. no se crea una relación genérica `RELATED_TO`.

---

#### 17. Contrato de proveedor

Una relación con proveedor deberá poder declarar:

```text
provider_name_or_reference
provider_role
app_code
environment_role
service_scope
technical_owner
business_owner
contract_ref
account_ref
authentication_ref
license_ref
seat_ref
renewal_ref
sla_ref
support_ref
data_exposure_ref
subprocessor_ref
backup_or_export_ref
provider_exit_ref
evidence_state
```

Prohibiciones:

- guardar contraseñas, tokens o secretos en el catálogo;
- asumir contrato porque exista un SDK;
- asumir proveedor de hosting por framework;
- asumir licencia por una factura aislada;
- convertir el proveedor en propietario funcional;
- convertir una cuenta del proveedor en identidad empresarial;
- usar una cuenta personal sin propietario y vigencia como base operativa permanente.

---

#### 18. Familias de proveedor observadas

La evidencia técnica actual permite reconocer cinco familias externas sin afirmar su estado comercial completo:

| Proveedor / familia | Evidencia técnica                                                             | Aplicaciones afectadas                        | Estado contractual                                                                           |
| ------------------- | ----------------------------------------------------------------------------- | --------------------------------------------- | -------------------------------------------------------------------------------------------- |
| GitHub              | repositorios actuales                                                         | nueve aplicaciones con repositorio confirmado | relación de código confirmada; contrato y propietario comercial fuera de esta evidencia      |
| Supabase            | clientes SDK en los nueve repositorios confirmados y proyecto VENTO accesible | nueve aplicaciones con repositorio confirmado | dependencia técnica confirmada; alcance contractual y económico se referencia a su autoridad |
| Expo / EAS          | configuración de build y canales                                              | `anima`, `pass`                               | configuración técnica confirmada; plan, cuenta y condiciones comerciales requieren evidencia |
| Sentry              | SDK React Native en ANIMA                                                     | `anima`                                       | `OBSERVED_SDK`; servicio activo, contrato y retención no se infieren                         |
| RevenueCat          | SDK de purchases en PASS                                                      | `pass`                                        | `OBSERVED_SDK`; servicio activo, producto contratado y costos no se infieren                 |

Para las siete aplicaciones Next.js no se declara proveedor de hosting sin evidencia específica.

Para AURA no se declara proveedor actual.

---

#### 19. `TI-APPLICATION-PROVIDER-LICENSE-MATRIX-001`

| `app_code` | Proveedores técnicos observados                         | Estado de licencia / asiento | Propietario de cierre                                     | Condición de salida                                                                                            |
| ---------- | ------------------------------------------------------- | ---------------------------- | --------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `shell`    | GitHub; Supabase; hosting `PENDIENTE_DE_EVIDENCIA`      | `PENDIENTE_DE_EVIDENCIA`     | `TI-DOM-012`                                              | contrato o no-aplicabilidad, propietario, uso, renovación y costo demostrables                                 |
| `anima`    | GitHub; Supabase; Expo/EAS; Sentry SDK                  | `PENDIENTE_DE_EVIDENCIA`     | `TI-DOM-012`                                              | plan/cuenta, asientos si aplican, renovación, costo, retención y soporte demostrables                          |
| `viso`     | GitHub; Supabase; hosting `PENDIENTE_DE_EVIDENCIA`      | `PENDIENTE_DE_EVIDENCIA`     | `TI-DOM-012`                                              | contrato o no-aplicabilidad y uso técnico reconciliados                                                        |
| `nexo`     | GitHub; Supabase; hosting `PENDIENTE_DE_EVIDENCIA`      | `PENDIENTE_DE_EVIDENCIA`     | `TI-DOM-012`                                              | contrato o no-aplicabilidad y uso técnico reconciliados                                                        |
| `fogo`     | GitHub; Supabase; hosting `PENDIENTE_DE_EVIDENCIA`      | `PENDIENTE_DE_EVIDENCIA`     | `TI-DOM-012`                                              | contrato o no-aplicabilidad y uso técnico reconciliados                                                        |
| `origo`    | GitHub; Supabase; hosting `PENDIENTE_DE_EVIDENCIA`      | `PENDIENTE_DE_EVIDENCIA`     | `TI-DOM-012`                                              | contrato o no-aplicabilidad y uso técnico reconciliados                                                        |
| `pulso`    | GitHub; Supabase; hosting `PENDIENTE_DE_EVIDENCIA`      | `PENDIENTE_DE_EVIDENCIA`     | `TI-DOM-012`                                              | contrato o no-aplicabilidad y uso técnico reconciliados                                                        |
| `numera`   | GitHub; Supabase; hosting `PENDIENTE_DE_EVIDENCIA`      | `PENDIENTE_DE_EVIDENCIA`     | `TI-DOM-012`                                              | contrato o no-aplicabilidad y uso técnico reconciliados                                                        |
| `aura`     | todos los proveedores actuales `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA`     | `AURA-AUD-001` a `AURA-AUD-010`; `TI-DOM-012` si continúa | auditoría de AURA resuelve producto y proveedores; contratos se reconcilian si la continuidad resulta aprobada |
| `pass`     | GitHub; Supabase; Expo/EAS; RevenueCat SDK              | `PENDIENTE_DE_EVIDENCIA`     | `TI-DOM-012`                                              | plan/cuenta, producto contratado, renovación, costo y propietarios demostrables                                |

La ausencia de evidencia contractual no invalida la identidad de aplicación. Bloquea afirmar contrato, licencia, SLA o costo.

---

#### 20. Licencia, asiento, cuenta y contrato

Se conserva la separación:

```text
LICENCIA
≠ ASIENTO
≠ CUENTA
≠ CONTRATO
≠ CREDENCIAL
≠ SUSCRIPCIÓN DE USUARIO
```

Definiciones:

- **licencia:** derecho de uso de un producto o capacidad;
- **asiento:** unidad asignable de una licencia cuando el modelo lo utilice;
- **cuenta:** identidad en el proveedor;
- **contrato:** acuerdo comercial o jurídico;
- **credencial:** material de autenticación;
- **suscripción de usuario:** producto o relación de consumo que puede pertenecer a un dominio distinto.

Reglas:

1. una licencia podrá habilitar varias cuentas o ninguna cuenta individual;
2. una cuenta puede existir sin consumir un asiento;
3. un asiento no concede permiso empresarial;
4. una licencia no se cierra marcando una cuenta como inactiva;
5. un contrato cancelado exige revisar datos, cuentas, integración y continuidad;
6. los paquetes open source no se confunden con una licencia tecnológica empresarial administrada por asiento;
7. cumplimiento de licencias de dependencias de software y gobierno económico del servicio se registran en sus ámbitos correspondientes.

---

#### 21. Estado mínimo de una licencia administrada

Cuando una licencia o asiento aplique, deberá poder referenciar:

```text
license_ref
provider_ref
product_or_plan
contract_ref
license_model
seat_model
entitlement_scope
assigned_identity_ref
business_owner
technical_owner
start_at
renewal_at
end_at
auto_renewal_state
usage_evidence_ref
cost_ref
cancellation_window_ref
exit_ref
status
```

Estados conceptuales:

```text
PENDIENTE_DE_EVIDENCIA
ACTIVE
SUSPENDED
EXPIRING
EXPIRED
CANCELLED
NO_APLICA
```

La transición y los datos económicos se profundizan en `TI-DOM-012`. Esta tarea fija la frontera y la referencia desde la aplicación.

---

#### 22. Autenticación y cuentas técnicas

La aplicación no posee autoridad por la cuenta de un proveedor.

Cada ambiente deberá poder referenciar:

- autoridad de autenticación;
- principal técnico cuando exista;
- propietario humano o empresarial;
- finalidad;
- alcance;
- vigencia;
- método de rotación;
- revocación;
- evidencia de uso;
- relación con contrato o proveedor cuando corresponda.

No se almacenan en el catálogo:

- contraseñas;
- claves privadas;
- service-role keys;
- tokens;
- códigos de recuperación;
- secretos de webhooks;
- claves de API.

Un secreto detectado en configuración se trata por su autoridad de seguridad; no se replica para completar este catálogo.

---

#### 23. Datos y clasificación

La aplicación declara los dominios funcionales que procesa, pero no recibe una sensibilidad única.

| `app_code` | Dominio funcional de datos                                                       |
| ---------- | -------------------------------------------------------------------------------- |
| `shell`    | identidad, sesión, autorización, catálogo y navegación                           |
| `anima`    | trabajador, asistencia, jornada, documentos y contexto personal                  |
| `viso`     | trabajadores, roles, permisos, programación, administración, soporte y auditoría |
| `nexo`     | inventario, logística, activos, ubicaciones, remisiones y custodia               |
| `fogo`     | recetas, producción, lotes, preparación y trazabilidad productiva                |
| `origo`    | proveedores, compras, órdenes, recepción y abastecimiento                        |
| `pulso`    | ventas, órdenes, pagos, salón, entregas y fidelización operativa                 |
| `numera`   | gastos, costos, rentabilidad, reportes y centros de costo                        |
| `aura`     | marketing, contenido, campañas, leads y métricas si su continuidad se aprueba    |
| `pass`     | identidad cliente, fidelización, beneficios y transacciones relacionadas         |

Regla:

```text
SENSIBILIDAD
=
PROPIEDAD DEL RECURSO / CAMPO / EVENTO / DOCUMENTO
NO DEL NOMBRE DE LA APLICACIÓN
```

Un ambiente no puede reducir la clasificación aprobada de los datos que procesa.

---

#### 24. `TI-APPLICATION-CRITICALITY-CONTRACT-001`

La unidad de criticidad es la instancia de aplicación dentro de un contexto y una ventana, no el `app_code` completo.

```text
app_instance
=
app_code
+
environment_role
+
surface
+
business_context
+
dependency_snapshot
```

La clase efectiva se deriva de:

1. criticidad de los procesos que dependen de la instancia;
2. etapas críticas aplicables;
3. recursos protegidos cuya indisponibilidad afecte seguridad, identidad o acceso;
4. servicios tecnológicos dependientes;
5. dependencia externa y contingencia disponible;
6. ventana de disponibilidad aplicable;
7. alcance del cambio o falla.

No se promedian impactos.

---

#### 25. Regla de derivación

Se conservan los cinco modos aprobados:

```text
CRIT_FROM_PROTECTED_RESOURCE
CRIT_FROM_DEPENDENCY
CRIT_FROM_AFFECTED_SERVICE
CRIT_FROM_CHANGE_SCOPE
CRIT_FROM_ENABLED_CAPABILITY
```

Para una aplicación:

- el modo ordinario es `CRIT_FROM_DEPENDENCY`;
- una superficie que protege identidad, autorización o un recurso sensible puede aplicar `CRIT_FROM_PROTECTED_RESOURCE`;
- un caso hereda mediante `CRIT_FROM_AFFECTED_SERVICE`;
- un cambio hereda mediante `CRIT_FROM_CHANGE_SCOPE`;
- una licencia o capacidad habilitante hereda mediante `CRIT_FROM_ENABLED_CAPABILITY`.

La clase de proceso `C0` a `C4` no se convierte en una etiqueta permanente de la aplicación.

---

#### 26. Matriz de criticidad por aplicación

| `app_code` | Regla primaria         | Modificador obligatorio                                                                                             | Clase global fija |
| ---------- | ---------------------- | ------------------------------------------------------------------------------------------------------------------- | ----------------- |
| `shell`    | `CRIT_FROM_DEPENDENCY` | elevar según recurso protegido cuando identidad, sesión o acceso estén implicados                                   | ninguna           |
| `anima`    | `CRIT_FROM_DEPENDENCY` | respetar etapas laborales, seguridad y disponibilidad del proceso                                                   | ninguna           |
| `viso`     | `CRIT_FROM_DEPENDENCY` | respetar recursos protegidos y procesos administrativos afectados                                                   | ninguna           |
| `nexo`     | `CRIT_FROM_DEPENDENCY` | respetar inventario, custodia, logística y dependencias físicas                                                     | ninguna           |
| `fogo`     | `CRIT_FROM_DEPENDENCY` | respetar producción, inocuidad y etapas críticas                                                                    | ninguna           |
| `origo`    | `CRIT_FROM_DEPENDENCY` | respetar abastecimiento, recepción y compromisos                                                                    | ninguna           |
| `pulso`    | `CRIT_FROM_DEPENDENCY` | respetar venta, pago, caja y resultado desconocido                                                                  | ninguna           |
| `numera`   | `CRIT_FROM_DEPENDENCY` | respetar obligaciones económicas, cierres y fuentes propietarias                                                    | ninguna           |
| `aura`     | `CRIT_FROM_DEPENDENCY` | roadmap diferido no equivale a criticidad baja; cualquier continuidad futura deberá derivarse de procesos aprobados | ninguna           |
| `pass`     | `CRIT_FROM_DEPENDENCY` | dominio cliente no reduce criticidad de pagos, identidad o redenciones cuando apliquen                              | ninguna           |

Control:

```text
10 aplicaciones
10 reglas explícitas
0 clases globales inventadas
```

---

#### 27. Disponibilidad de aplicación

Se distinguen:

```text
CATALOG_ACTIVE
DEPLOYMENT_PRESENT
TECHNICALLY_HEALTHY
BUSINESS_AVAILABLE
AUTHORIZED_FOR_ACTOR
DEPENDENCY_AVAILABLE
```

Ninguna implica automáticamente las demás.

Reglas:

1. `public.apps.is_active` representa pertenencia runtime, no uptime;
2. un health check técnico no demuestra resultado empresarial;
3. una app puede estar disponible técnicamente y bloqueada por autorización;
4. una app puede estar saludable y un proceso permanecer indisponible por una dependencia externa;
5. una contingencia aprobada puede mantener el proceso en `DEGRADED_SAFE` aunque la aplicación esté indisponible;
6. la medición de disponibilidad se gobierna por procesos y servicios, no por una única cifra de app.

---

#### 28. Cambios y versiones

Todo cambio que altere cualquiera de los siguientes elementos deberá referenciar `TI-DOM-009`:

- repositorio o fuente de build;
- ambiente;
- dominio u origen;
- runtime principal;
- proveedor;
- versión mayor de framework cuando implique riesgo;
- autenticación;
- integración;
- plan o licencia que habilita capacidad;
- método de distribución;
- secreto o principal técnico;
- dependencia crítica;
- estrategia de recuperación o salida.

El cambio conserva:

```text
before
after
reason
authorization
affected_apps
affected_environments
affected_dependencies
test_ref
rollback_ref
result
```

Un commit en `main` no equivale a despliegue productivo.

---

#### 29. SLA, soporte y escalamiento

La aplicación podrá referenciar:

- canal de soporte interno;
- soporte del proveedor;
- horario;
- severidades o categorías del proveedor;
- SLA contractual;
- límites de soporte;
- responsable de escalamiento.

La prioridad de un caso y el SLA interno pertenecen a `TI-DOM-007`.

El SLA externo no redefine la prioridad empresarial.

Si el proveedor ofrece una clasificación propia, deberá mapearse sin reemplazar:

- criticidad del proceso;
- impacto;
- urgencia;
- prioridad del caso;
- nivel de atención interno.

---

#### 30. Respaldo, recuperación y salida del proveedor

Cada dependencia externa crítica deberá tener un `provider_exit_ref` que permita decidir cómo continuar si el proveedor se degrada, deja de prestar servicio o se sustituye.

El contrato mínimo de salida cubre:

1. propiedad y exportabilidad de datos;
2. formato y completitud de exportación;
3. revocación de cuentas, tokens y accesos;
4. tratamiento de secretos;
5. retención y eliminación por el proveedor;
6. sustituto o modo degradado cuando aplique;
7. restauración o importación en el destino;
8. reconciliación de trabajos pendientes;
9. preservación de auditoría;
10. cierre contractual y económico;
11. prueba de retorno a operación;
12. evidencia de salida.

`TI-DOM-011` define respaldo y recuperación técnica.

`TI-DOM-012` materializa contrato, renovación, uso y costo.

E5/T/U materializan y prueban la salida cuando un paquete la requiera.

---

#### 31. Tratamiento específico de SHELL

Se conserva:

```text
app_code = shell
display_name = Vento OS
repository = vento-shell
```

El estado actual contiene dos orígenes referenciados:

- `os.ventogroup.co` en superficies del shell estándar;
- `hub.ventogroup.co` en metadata actual de `vento-shell`.

Decisión:

- no se elige silenciosamente uno;
- ambos permanecen como evidencia de drift;
- la identidad `shell` no cambia;
- la reconciliación de dominio pertenece a las tareas propietarias de navegación y contrato de aplicaciones;
- hasta cerrarla, el ambiente productivo de SHELL no se declara verificado únicamente por la URL.

---

#### 32. Tratamiento específico de AURA

AURA conserva:

```text
app_code = aura
catalog_status = active
roadmap_scope = deferred
```

La evidencia actual aporta una URL referenciada como próxima disponibilidad, pero no confirma:

- repositorio propietario;
- producto desplegado;
- usuarios activos;
- rutas actuales;
- funciones activas;
- proveedores actuales;
- contratos;
- licencias;
- ambiente productivo;
- criticidad efectiva.

Propietarios:

| Decisión                               | Propietario    |
| -------------------------------------- | -------------- |
| repositorio                            | `AURA-AUD-001` |
| estado real                            | `AURA-AUD-002` |
| rutas                                  | `AURA-AUD-004` |
| datos y permisos                       | `AURA-AUD-006` |
| continuidad, reemplazo o retiro        | `AURA-AUD-010` |
| decisión arquitectónica si corresponde | `AURA-AUD-011` |

TI-DOM-006 no desbloquea AURA.

---

#### 33. Tratamiento específico de PASS

PASS conserva:

```text
app_code = pass
identity_domain = cliente
roadmap_scope = adjacent
```

La aplicación no se incorpora automáticamente a selectores laborales.

El repositorio actual muestra:

- aplicación Expo / React Native;
- perfiles de build `development`, `preview` y `production`;
- producción distribuida mediante store;
- cliente Supabase;
- SDK de purchases;
- utilidades de PassKit.

Reglas:

1. las cuentas cliente no se convierten en empleados;
2. un producto o suscripción externa no concede permiso laboral;
3. el SDK de purchases no prueba contrato, plan ni costo;
4. la criticidad de pagos, beneficios o redenciones se deriva del proceso y del resultado comprometido;
5. cualquier licencia, contrato o renovación tecnológica se referencia a `TI-DOM-012`.

---

#### 34. Hallazgos y propietarios

| ID                 | Hallazgo                                                                                                                  | Estado                   | Propietario                                                 | Condición de salida                                                                               |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------- | ------------------------ | ----------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| `H-TI-DOM-006-001` | catálogo canónico y `public.apps` coinciden 10/10, pero consumidores mantienen subconjuntos o estados locales divergentes | `ESPECIFICADO`           | tareas de contratos compartidos y consumidores propietarios | consumidores obtienen identidad, destino y estado desde fuente versionada sin listas competidoras |
| `H-TI-DOM-006-002` | SHELL presenta referencias `os` y `hub` para la misma aplicación                                                          | `PENDIENTE_DE_EVIDENCIA` | tareas propietarias de navegación y dominio SHELL           | dominio canónico o alias aprobado queda documentado y probado                                     |
| `H-TI-DOM-006-003` | AURA no tiene repositorio propietario confirmado en la evidencia actual                                                   | `BLOQUEADO`              | `AURA-AUD-001`                                              | repositorio confirmado o decisión explícita de ausencia/reemplazo                                 |
| `H-TI-DOM-006-004` | AURA carece de evidencia suficiente para declarar ambiente o proveedor actual                                             | `BLOQUEADO`              | `AURA-AUD-002` a `AURA-AUD-010`                             | auditoría y decisión de continuidad cierran el producto real                                      |
| `H-TI-DOM-006-005` | los contratos, licencias, asientos, renovaciones y costos por aplicación no están demostrados en las fuentes consultadas  | `PENDIENTE_DE_EVIDENCIA` | `TI-DOM-012`                                                | inventario contractual completo y reconciliado con ORIGO/NUMERA                                   |
| `H-TI-DOM-006-006` | proveedor de hosting de las siete aplicaciones Next.js no se declara sin evidencia                                        | `PENDIENTE_DE_EVIDENCIA` | `TI-DOM-012` + paquete de despliegue propietario            | proveedor, proyecto, propietario, contrato y ambiente demostrados                                 |
| `H-TI-DOM-006-007` | la presencia de SDK Sentry en ANIMA no demuestra servicio activo ni retención contratada                                  | `PENDIENTE_DE_EVIDENCIA` | `TI-DOM-010`; `TI-DOM-012`                                  | configuración, cuenta, retención, propietario y contrato demostrados                              |
| `H-TI-DOM-006-008` | la presencia del SDK de purchases en PASS no demuestra producto contratado, reglas o costos                               | `PENDIENTE_DE_EVIDENCIA` | `TI-DOM-012` + propietario PASS                             | cuenta, producto, contrato, renovación y conciliación demostrados                                 |
| `H-TI-DOM-006-009` | las referencias de dominio observadas no equivalen a despliegue verificado                                                | `ESPECIFICADO`           | paquetes de implementación y CI propietarios                | evidencia de build, commit, configuración y superficie desplegada por ambiente                    |
| `H-TI-DOM-006-010` | no existe criticidad única válida por aplicación                                                                          | `RESUELTO_POR_CONTRATO`  | `TI-APPLICATION-CRITICALITY-CONTRACT-001`                   | toda instancia deriva criticidad desde procesos, recursos y dependencias                          |

No queda un pendiente narrativo sin propietario ni condición de salida.

---

#### 35. Estado de materialización

| Componente                    | Estado                                                         |
| ----------------------------- | -------------------------------------------------------------- |
| catálogo de diez aplicaciones | `ESPECIFICADO`                                                 |
| reconciliación `public.apps`  | `VALIDADO_DOCUMENTALMENTE`                                     |
| repositorios                  | `9 CONFIRMADOS / 1 PENDIENTE_DE_EVIDENCIA`                     |
| versiones de manifiesto       | `9 OBSERVADAS / 1 PENDIENTE_DE_EVIDENCIA`                      |
| perfiles EAS                  | `CONFIGURADO_EN_REPOSITORIO` para ANIMA y PASS                 |
| URLs de ecosistema            | `REFERENCIADO_EN_CODIGO`; no equivalen a despliegue verificado |
| dependencias técnicas         | `ESPECIFICADO` con evidencia de manifiesto                     |
| contratos y licencias         | `PENDIENTE_DE_EVIDENCIA` por aplicación                        |
| proveedor de hosting web      | `PENDIENTE_DE_EVIDENCIA`                                       |
| criticidad                    | `DERIVADA_POR_INSTANCIA`; ninguna clase global fija            |
| observabilidad runtime        | `FUERA_DE_ALCANCE` de esta tarea; propietaria `TI-DOM-010`     |
| recuperación                  | `FUERA_DE_ALCANCE` de esta tarea; propietaria `TI-DOM-011`     |
| costos y renovaciones         | `FUERA_DE_ALCANCE` de esta tarea; propietaria `TI-DOM-012`     |
| implementación                | `FUERA_DE_ALCANCE`                                             |
| cambios Supabase              | `NO_APLICA`                                                    |

---

#### 36. Invariantes

1. existen exactamente diez `app_code` canónicos;
2. TI-DOM-006 no crea un undécimo código;
3. `shell` es aplicación y `vento-shell` es repositorio;
4. `hub` no sustituye el `app_code` `shell`;
5. AURA conserva código mientras su roadmap permanezca diferido;
6. PASS conserva identidad cliente;
7. ambiente no modifica `app_code`;
8. plataforma no modifica `app_code`;
9. sede no modifica `app_code`;
10. URL no es identidad;
11. repositorio no es identidad;
12. proveedor no es identidad;
13. licencia no es permiso;
14. asiento no es usuario;
15. cuenta no es credencial;
16. contrato no es disponibilidad;
17. `is_active` no es despliegue;
18. build no es despliegue;
19. dominio referenciado no es despliegue verificado;
20. SDK no es contrato;
21. framework no prueba proveedor de hosting;
22. una dependencia técnica no crea propiedad funcional;
23. una dependencia externa no reduce responsabilidad interna;
24. no se guardan secretos en el catálogo;
25. una sensibilidad pertenece al recurso, campo, evento o documento, no a toda la aplicación;
26. una aplicación no recibe una clase C0-C4 global;
27. criticidad se deriva por instancia y proceso;
28. workaround no reduce la criticidad del hecho afectado;
29. roadmap diferido no equivale a baja criticidad;
30. proveedor externo no puede convertirse en maestro de identidad, contrato o costo;
31. salida del proveedor conserva datos, cuentas, auditoría y reconciliación;
32. cambio de ambiente o proveedor requiere gobierno de cambio;
33. licencia y costo se profundizan en `TI-DOM-012`;
34. backup y restore se profundizan en `TI-DOM-011`;
35. SLA de caso se profundiza en `TI-DOM-007`;
36. no se modifica código, datos, ambientes, proveedores ni Supabase desde esta tarea.

---

#### 37. Criterios de aceptación

- [x] se conserva la continuidad `TI-DOM-005 → TI-DOM-006 → TI-DOM-007`;
- [x] la tarea permanece exclusivamente documental;
- [x] se conservan exactamente diez aplicaciones canónicas;
- [x] 10/10 aplicaciones reciben una decisión explícita;
- [x] `public.apps` queda reconciliado 10/10 sin nuevos códigos;
- [x] se diferencian aplicación, repositorio, ambiente, URL, despliegue, proveedor, contrato, licencia, asiento y servicio;
- [x] se confirman nueve repositorios y AURA queda con propietario exacto de resolución;
- [x] las versiones de manifiesto se registran sin presentarlas como release desplegada;
- [x] se definen seis roles de ambiente;
- [x] se materializa una decisión de ambiente para 10/10 aplicaciones;
- [x] se preserva el drift `os`/`hub` sin elegir silenciosamente;
- [x] se preserva AURA como activa de catálogo y diferida de roadmap;
- [x] PASS permanece en dominio cliente;
- [x] se define el contrato de dependencia y sus clases;
- [x] se materializan dependencias técnicas observadas para los nueve repositorios confirmados;
- [x] se materializan fronteras funcionales mínimas para las diez aplicaciones;
- [x] se define el contrato de proveedor sin almacenar secretos;
- [x] se separa SDK observado de proveedor contratado;
- [x] se materializa el estado de proveedor/licencia para 10/10 aplicaciones;
- [x] toda licencia no demostrada queda `PENDIENTE_DE_EVIDENCIA` con `TI-DOM-012` como propietario;
- [x] se define salida del proveedor;
- [x] se define criticidad por instancia y se prohíbe la clase global de aplicación;
- [x] las diez aplicaciones tienen regla explícita de derivación de criticidad;
- [x] no se inventan SLA, contratos, licencias, asientos, proveedores de hosting, ambientes desplegados ni costos;
- [x] todos los hallazgos tienen propietario y condición de salida;
- [x] no se modifica Supabase;
- [x] no se crean ni modifican requisitos de prueba;
- [x] `TI-DOM-007` permanece únicamente reservada.

---

#### 38. Cobertura de prueba consumida

La tarea consume cobertura vigente que ya protege:

- unicidad y estabilidad del catálogo de aplicaciones;
- correspondencia entre catálogo, destinos, consumidores y navegación;
- identificación verificable de ambiente, repositorio, versión, configuración y superficie desplegada;
- separación entre aplicación, cuenta, permiso, credencial, licencia y asiento;
- correlación de aplicaciones, proveedores, licencias, contratos, costos y servicios;
- separación entre activos, configuración, aplicación y proveedor;
- uso de contratos versionados para integraciones y dependencias;
- criticidad y disponibilidad derivadas por proceso y dependencia;
- ausencia de secretos en adaptadores, tickets y catálogos.

TI-DOM-006 especializa y materializa esas obligaciones para las diez aplicaciones sin alterar su comportamiento protegido.

---

#### 39. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea no introduce una nueva conducta ejecutable. Materializa el catálogo técnico de las diez aplicaciones, separa ambientes, dependencias, proveedores y licencias, y aplica reglas de criticidad ya protegidas por los contratos vigentes de catálogo, ambientes, integración, tecnología y criticidad por proceso. Las relaciones que todavía requieren evidencia permanecen explícitamente bloqueadas o asignadas a su tarea propietaria; no se cambia una condición de prueba existente.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 40. Continuidad

ÚLTIMA TAREA APROBADA
`TI-DOM-005 — Definir gobierno de impresoras y periféricos físicos frente al servicio transversal de impresión`

TAREA ACTUAL APROBADA
`TI-DOM-006 — Definir catálogo de aplicaciones, ambientes, dependencias, proveedores, licencias y criticidad`

SIGUIENTE TAREA RESERVADA
`TI-DOM-007 — Definir solicitud de servicio, incidente, impacto, urgencia, prioridad, SLA, escalamiento, comunicación y cierre`


### ✅ TI-DOM-007 — Definir solicitud de servicio, incidente, impacto, urgencia, prioridad, SLA, escalamiento, comunicación y cierre

**Estado:** APROBADA
**Tarea anterior:** `TI-DOM-006 — Definir catálogo de aplicaciones, ambientes, dependencias, proveedores, licencias y criticidad` — APROBADA
**Tarea siguiente:** `TI-DOM-008 — Definir problema, causa raíz, error conocido, workaround y prevención de recurrencia` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada del caso tecnológico, clasificación de solicitudes e incidentes, impacto, urgencia, prioridad, compromisos de servicio, escalamiento, comunicación, restauración, validación, cierre y reapertura
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/01_DOMINIO_DE_TECNOLOGIA_Y_SOPORTE.md`
**Artefactos producidos:** `TI-SERVICE-CASE-CONTRACT-001`; `TI-CASE-CLASSIFICATION-MATRIX-001`; `TI-IMPACT-URGENCY-PRIORITY-MATRIX-001`; `TI-SLA-COMMITMENT-MATRIX-001`; `TI-ESCALATION-COMMUNICATION-MATRIX-001`; `TI-CASE-CLOSURE-REOPEN-CONTRACT-001`; `TI-SERVICE-DESK-ASIS-RECONCILIATION-001`
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, tablas, enums, RLS, RPC, funciones, triggers, Edge Functions, migraciones, datos, aplicaciones, proveedores, canales, cuentas, licencias, infraestructura, redes, dispositivos, despliegues ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el modelo canónico con el que VENTO recibe, clasifica y atiende una necesidad tecnológica desde su reporte hasta su cierre, conservando una sola identidad de caso, un criterio determinista de prioridad, compromisos de servicio verificables y una separación estricta entre restaurar servicio, resolver una solicitud, investigar causa, ejecutar un cambio y cerrar el expediente.

La tarea materializa la respuesta a estas preguntas:

- qué constituye una solicitud de servicio y qué constituye un incidente;
- qué datos mínimos permiten abrir un caso sin exigir conocimiento técnico al solicitante;
- cómo se calculan impacto y urgencia sin aceptar una prioridad escrita libremente por el usuario;
- cómo se obtiene una prioridad reproducible;
- qué compromisos de acuse, primera respuesta, restauración o cumplimiento, comunicación y escalamiento corresponden a cada prioridad;
- qué condiciones permiten escalar de L0 a L3;
- cuándo una falla tecnológica debe vincularse con continuidad empresarial;
- cómo se comunica un caso sin exponer secretos, logs o diagnósticos sensibles;
- qué evidencia demuestra restauración o cumplimiento;
- cuándo puede cerrarse un caso;
- cómo se reabre sin reescribir la historia;
- cómo se reconcilia el modelo objetivo con `support_tickets` y `support_messages` existentes.

Regla raíz:

```text
REPORTE
≠ CLASIFICACIÓN
≠ PRIORIDAD
≠ DIAGNÓSTICO
≠ WORKAROUND
≠ RESTAURACIÓN
≠ RESOLUCIÓN DE CAUSA
≠ VALIDACIÓN
≠ CIERRE
```

---

#### 2. Resultado material

Se aprueban siete artefactos documentales coordinados:

1. `TI-SERVICE-CASE-CONTRACT-001`, contrato único de identidad, datos, estados, propietario y evidencia del caso;
2. `TI-CASE-CLASSIFICATION-MATRIX-001`, clasificación materializada de solicitud, incidente, consulta y handoffs hacia acceso, problema y cambio;
3. `TI-IMPACT-URGENCY-PRIORITY-MATRIX-001`, escala determinista de impacto, urgencia y prioridad;
4. `TI-SLA-COMMITMENT-MATRIX-001`, compromisos internos por prioridad, reglas de reloj, pausa, incumplimiento y dependencia externa;
5. `TI-ESCALATION-COMMUNICATION-MATRIX-001`, escalamiento funcional, técnico, de proveedor, seguridad y continuidad, junto con cadencia de comunicaciones;
6. `TI-CASE-CLOSURE-REOPEN-CONTRACT-001`, criterios de restauración, validación, cierre, cancelación, nulidad y reapertura;
7. `TI-SERVICE-DESK-ASIS-RECONCILIATION-001`, reconciliación explícita entre el contrato objetivo y el soporte técnico existente.

Cobertura materializada:

| Control                                           |                                   Resultado |
| ------------------------------------------------- | ------------------------------------------: |
| Proceso propietario                               |                        **1 — `VPROC-0058`** |
| Servicios tecnológicos directamente cubiertos     | **2 — `TI-SERVICE-006` y `TI-SERVICE-007`** |
| Niveles de atención conservados                   |                             **4 — L0 a L3** |
| Clases primarias de caso dentro de `VPROC-0058`   |                                       **3** |
| Handoffs especializados definidos                 |                                       **3** |
| Niveles de impacto                                |                                       **4** |
| Niveles de urgencia                               |                                       **4** |
| Prioridades calculadas                            |                                       **4** |
| Perfiles SLA internos                             |                                       **4** |
| Estados canónicos de `VPROC-0058` conservados     |                                       **9** |
| Transiciones normales conservadas                 |                                      **10** |
| Excepciones conservadas                           |                                       **4** |
| Acciones CCR conservadas                          |                                       **4** |
| Estados legacy de `support_tickets` reconciliados |                                       **4** |
| Requisitos de prueba nuevos o modificados         |                                       **0** |
| Cambios físicos                                   |                                       **0** |

---

#### 3. Autoridades y entradas heredadas

La tarea consume y preserva:

- `VPROC-0058 — Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento` como proceso único de mesa de servicio tecnológica;
- `VPROC-0059` como proceso separado para el ciclo de acceso tecnológico;
- `VPROC-0062` como proceso separado para continuidad empresarial;
- `TI-SERVICE-006 — Solicitudes de soporte tecnológico`;
- `TI-SERVICE-007 — Incidentes y restauración tecnológica`;
- `TI-ATTN-001` a `TI-ATTN-004`;
- `TI-DOM-002` y su grafo de activos, endpoints, dispositivos compartidos, redes, impresoras, aplicaciones y servicios;
- `TI-DOM-003` a `TI-DOM-006` como autoridades del elemento técnico afectado;
- la criticidad por proceso `C0` a `C4` y las ventanas `A0` a `A4`;
- para `VPROC-0058`, baseline `C1`, ventana `A0` y degradación `CONTROLLED_DEGRADED`;
- para `VPROC-0058`, perfil de carga `L2`, concurrencia `K2` y crecimiento `G2+G3+G4`;
- clase foreground `R1` y clase asíncrona `A2`;
- perfil offline `OF1_CACHED_REFERENCE + OF3_LOCAL_CAPTURE + OF5_MANUAL_CONTINGENCY`;
- prioridad de sincronización `SYNC-1_URGENT`;
- eventos, auditoría y métricas ya aprobados para `VPROC-0058`;
- `NOTIFY-ARC-*` como autoridad del servicio transversal de entrega de notificaciones;
- `TI-DOM-008` como autoridad de problema, causa raíz, error conocido y prevención de recurrencia;
- `TI-DOM-009` como autoridad del cambio tecnológico;
- `TI-DOM-010` como autoridad de monitoreo, eventos, alertas y salud técnica;
- `TI-DOM-011` como autoridad de respaldo y recuperación técnica;
- `TI-AUTH-*` como autoridad de privilegios, soporte remoto, secretos y acceso técnico sensible.

Ninguna decisión de esta tarea concede acceso, habilita soporte privilegiado, ejecuta un cambio o declara continuidad.

---

#### 4. Propiedad empresarial

Se conserva la siguiente separación:

```text
VISO
→ caso tecnológico
→ clasificación
→ impacto
→ urgencia
→ prioridad
→ SLA
→ asignación
→ comunicación
→ restauración
→ validación
→ cierre

ANIMA
→ canal simple para reportar y consultar
→ no decide prioridad
→ no cierra el caso canónico por sí sola

NEXO
→ identidad y estado del activo físico cuando aplique
→ no se convierte en mesa de servicio

APLICACIÓN O PROCESO AFECTADO
→ conserva su hecho empresarial
→ no convierte la falla en un segundo ticket propietario

PROVEEDOR
→ aporta diagnóstico o ejecución externa delimitada
→ nunca cierra el caso VENTO

TI-DOM-008
→ problema y causa raíz

TI-DOM-009
→ cambio tecnológico

VPROC-0062
→ continuidad empresarial
```

El caso tecnológico es la coordinación del soporte; no absorbe los objetos propietarios de otros dominios.

---

#### 5. Definiciones canónicas

| Concepto          | Definición                                                                                                                                                 |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `SERVICE_REQUEST` | necesidad planificable de información, provisión, configuración estándar, asistencia o servicio predefinido que no nace de una interrupción no planificada |
| `INCIDENT`        | interrupción, degradación, resultado desconocido o pérdida no planificada de una capacidad tecnológica que afecta o puede afectar un servicio o proceso    |
| `CONSULTATION`    | pregunta o necesidad informativa que puede resolverse sin ejecutar un cambio de autoridad o infraestructura                                                |
| `PROBLEM`         | investigación de causa o recurrencia que puede relacionar uno o varios incidentes; propietaria `TI-DOM-008`                                                |
| `KNOWN_ERROR`     | problema con causa o condición conocida y tratamiento documentado; propietaria `TI-DOM-008`                                                                |
| `CHANGE`          | modificación deliberada de configuración, versión, infraestructura, proveedor o comportamiento; propietaria `TI-DOM-009`                                   |
| `WORKAROUND`      | medida temporal y controlada que reduce impacto sin afirmar que la causa fue eliminada                                                                     |
| `RESTORATION`     | recuperación demostrable del resultado tecnológico requerido o de un modo degradado autorizado                                                             |
| `FULFILLMENT`     | entrega verificable del resultado pedido en una solicitud de servicio                                                                                      |
| `RESOLUTION`      | decisión o acción que termina el trabajo requerido para el caso; no siempre elimina causa raíz                                                             |
| `CLOSURE`         | estado terminal aceptado después de validación, conocimiento y transferencia de pendientes aplicables                                                      |
| `REOPEN`          | nueva revisión o caso vinculado al cierre anterior, sin reescribir el expediente original                                                                  |

---

#### 6. `TI-CASE-CLASSIFICATION-MATRIX-001`

Toda entrada se clasifica durante `VPROC-0058.TRIAGE_IN_PROGRESS`.

| Clasificación            | Permanece en `VPROC-0058`                          | Criterio                                                                             | Handoff obligatorio                                                    |
| ------------------------ | -------------------------------------------------- | ------------------------------------------------------------------------------------ | ---------------------------------------------------------------------- |
| `SERVICE_REQUEST`        | Sí                                                 | necesidad tecnológica planificada sin interrupción no prevista                       | ninguno salvo que derive en acceso o cambio                            |
| `INCIDENT`               | Sí                                                 | interrupción, degradación o resultado desconocido no planificado                     | continuidad, problema o cambio solo cuando sus disparadores se cumplen |
| `CONSULTATION`           | Sí                                                 | consulta resoluble sin modificación material                                         | ninguno                                                                |
| `ACCESS_REQUEST_HANDOFF` | No como ciclo de acceso                            | crea o modifica cuenta, permiso, MFA, privilegio, alcance o vigencia                 | `VPROC-0059`                                                           |
| `PROBLEM_CANDIDATE`      | El incidente permanece; la investigación se separa | recurrencia, patrón, causa desconocida material o necesidad de RCA                   | `TI-DOM-008`                                                           |
| `CHANGE_REQUIRED`        | El caso permanece como origen                      | la resolución exige modificación no preautorizada de configuración o infraestructura | `TI-DOM-009`                                                           |

Reglas:

1. una solicitud no se convierte en incidente porque el solicitante la marque urgente;
2. un incidente no se convierte en problema solo por durar mucho;
3. un workaround no transforma un incidente en solicitud;
4. un cambio requerido para resolver un incidente conserva identidad propia;
5. el ciclo de acceso siempre conserva `VPROC-0059`;
6. un incidente que activa continuidad conserva el incidente técnico y crea el vínculo con `VPROC-0062`;
7. la reclasificación conserva versión anterior, motivo, actor y evidencia;
8. una consulta que termina requiriendo cambio o acceso genera el handoff correspondiente;
9. la UI no obliga al trabajador a conocer estas categorías antes de reportar.

---

#### 7. Identidad del caso

`TI-SERVICE-CASE-CONTRACT-001` conserva un identificador estable durante todos los niveles de atención:

```text
tech_case_id
process_id = VPROC-0058
case_type
case_revision
requester_ref
reporting_source
reported_at
affected_service_ref
affected_element_refs[]
site_ref
area_ref
symptom_summary
business_impact_refs[]
impact_level
urgency_level
priority
sla_profile_ref
attention_level
assigned_owner_ref
provider_case_refs[]
security_flag
continuity_ref
problem_ref
change_refs[]
workaround_refs[]
communication_state
restoration_state
validation_state
closure_state
evidence_refs[]
correlation_id
causation_id
created_at
updated_at
closed_at
reopened_from_ref
```

Reglas:

- `tech_case_id` no cambia al pasar de L1 a L2 o L3;
- reasignar no crea otro caso;
- un caso de proveedor se referencia, no sustituye la identidad VENTO;
- un incidente puede afectar varios elementos sin duplicarse por cada componente;
- una misma alerta repetida puede deduplicarse cuando demuestra el mismo incidente;
- dos usuarios afectados por la misma causa no obligan a crear dos incidentes si existe correlación demostrable;
- las comunicaciones de cada usuario pueden conservar subreferencias sin fragmentar el incidente principal.

---

#### 8. Entrada mínima

El nacimiento válido conserva:

```text
requester_or_monitor
affected_service_or_element
symptom_or_need
reported_at
context
```

Se materializan estos campos:

| Campo                 | Origen                                 | Regla                                                                                                |
| --------------------- | -------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| solicitante o monitor | sesión, actor o integración autorizada | debe ser atribuible; un monitor técnico conserva principal técnico                                   |
| servicio afectado     | catálogo `TI-SERVICE-*`                | obligatorio cuando pueda resolverse; si es desconocido queda `UNRESOLVED_AT_TRIAGE`, nunca inventado |
| elemento afectado     | grafo `TI-DOM-002`                     | opcional al reportar; L1 lo completa cuando exista evidencia                                         |
| síntoma o necesidad   | solicitante/monitor                    | descripción observable, sin exigir causa técnica                                                     |
| momento observado     | fuente del hecho                       | separado de `received_at`                                                                            |
| sede y área           | contexto                               | se resuelven cuando correspondan; no se confían como autoridad desde texto libre                     |
| adjuntos              | evidencia                              | opcionales y protegidos; no se solicitan secretos                                                    |
| impacto declarado     | solicitante/monitor                    | señal de entrada; el impacto canónico se determina en triage                                         |
| urgencia declarada    | solicitante                            | señal de entrada; no equivale a prioridad                                                            |

Prioridad, SLA, causa, estado final y autoridad efectiva son valores resueltos, no campos libres aceptados desde el cliente.

---

#### 9. Principio de impacto

El impacto mide la amplitud y gravedad empresarial actual o razonablemente inminente del caso.

No mide:

- jerarquía del solicitante;
- volumen de mensajes;
- antigüedad del ticket;
- presión verbal;
- complejidad técnica;
- nivel de atención;
- costo de la solución.

La evaluación considera:

1. procesos afectados y su criticidad;
2. etapa crítica activa;
3. sedes, áreas y canales afectados;
4. cantidad y tipo de actores afectados;
5. pérdida de identidad, autorización o seguridad;
6. dinero, custodia, inventario, producción o inocuidad en riesgo;
7. existencia y seguridad del workaround;
8. propagación hacia dependencias;
9. reversibilidad y capacidad de reconstrucción;
10. alcance de proveedor o infraestructura compartida.

---

#### 10. Niveles de impacto

| Código         | Nombre     | Criterio material                                                                                                                                                                                                                   |
| -------------- | ---------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `TI-IMPACT-01` | `CRITICAL` | afecta un proceso o etapa `C0`, compromete identidad o seguridad, produce estado financiero/custodia desconocido de alto riesgo, impide operación mínima o afecta simultáneamente múltiples servicios/sedes sin contingencia segura |
| `TI-IMPACT-02` | `HIGH`     | detiene o degrada materialmente un proceso `C1`, una sede, un área crítica o un conjunto relevante de actores; existe contingencia limitada o con capacidad reducida                                                                |
| `TI-IMPACT-03` | `MEDIUM`   | afecta una capacidad acotada, equipo, grupo o usuario con resultado recuperable y workaround seguro sin comprometer controles críticos                                                                                              |
| `TI-IMPACT-04` | `LOW`      | consulta, solicitud planificada o afectación individual de bajo impacto sin bloqueo de un resultado empresarial activo                                                                                                              |

Reglas:

- una afectación individual puede ser `CRITICAL` si compromete acceso privilegiado, seguridad, pago o una etapa `C0`;
- afectar muchos usuarios no vuelve crítico un caso si el resultado mínimo sigue disponible de forma segura;
- la existencia de workaround no reduce automáticamente la clase;
- el impacto se versiona cuando cambia el alcance.

---

#### 11. Principio de urgencia

La urgencia mide cuánto puede esperar la atención antes de que el impacto empeore o se pierda una ventana necesaria.

No mide prioridad final por sí sola.

Se evalúa contra:

- ventana de disponibilidad del proceso;
- deadline empresarial;
- turno, cierre, despacho, producción, venta o atención activa;
- progresión del daño;
- riesgo de pérdida irreversible;
- ventana de proveedor;
- vencimiento de una credencial o control;
- capacidad restante de contingencia.

---

#### 12. Niveles de urgencia

| Código          | Nombre           | Criterio material                                                                                                                      |
| --------------- | ---------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| `TI-URGENCY-01` | `IMMEDIATE`      | requiere atención ahora durante una ventana crítica o porque la espera aumenta daño, exposición, pérdida de control o indisponibilidad |
| `TI-URGENCY-02` | `CURRENT_WINDOW` | debe resolverse o quedar bajo workaround seguro antes de terminar la ventana operativa, turno, handoff o hito actualmente aplicable    |
| `TI-URGENCY-03` | `CURRENT_CYCLE`  | puede esperar dentro del día o ciclo empresarial vigente sin producir impacto material adicional                                       |
| `TI-URGENCY-04` | `PLANNED`        | puede programarse con propietario y fecha sin afectar el resultado operativo actual                                                    |

Reglas:

- la urgencia no aumenta por el simple transcurso del tiempo;
- un vencimiento mal gestionado puede elevar urgencia porque cambia la ventana, no porque el ticket sea antiguo;
- una solicitud planificada puede escalar si una dependencia real bloquea una operación activa;
- todo cambio de urgencia conserva motivo y evidencia.

---

#### 13. Cálculo de prioridad

La prioridad es un valor derivado de impacto y urgencia.

```text
PRIORITY
=
F(IMPACT, URGENCY)
```

Matriz aprobada:

| Impacto \ Urgencia | `IMMEDIATE`   | `CURRENT_WINDOW` | `CURRENT_CYCLE` | `PLANNED`   |
| ------------------ | ------------- | ---------------- | --------------- | ----------- |
| `CRITICAL`         | `P1_CRITICAL` | `P1_CRITICAL`    | `P2_HIGH`       | `P3_MEDIUM` |
| `HIGH`             | `P1_CRITICAL` | `P2_HIGH`        | `P2_HIGH`       | `P3_MEDIUM` |
| `MEDIUM`           | `P2_HIGH`     | `P2_HIGH`        | `P3_MEDIUM`     | `P4_LOW`    |
| `LOW`              | `P3_MEDIUM`   | `P3_MEDIUM`      | `P4_LOW`        | `P4_LOW`    |

Control:

```text
4 impactos
×
4 urgencias
=
16 combinaciones
→
4 prioridades
```

No existe prioridad escrita directamente por el solicitante.

---

#### 14. Reglas de prioridad

1. la prioridad inicial se calcula en triage;
2. una alerta automatizada puede proponer impacto/urgencia, pero VISO conserva la decisión;
3. una prioridad puede subir o bajar solo mediante una nueva revisión;
4. bajar prioridad exige demostrar reducción real de impacto o urgencia;
5. un workaround puede cambiar urgencia o impacto únicamente si está aplicado y verificado;
6. esperar a un proveedor no reduce prioridad;
7. la llegada de otro caso más crítico no altera la prioridad del caso original, aunque cambie el orden operativo de atención;
8. `P1_CRITICAL` no concede privilegio técnico;
9. prioridad no equivale a criticidad del servicio;
10. prioridad no equivale al nivel L0-L3;
11. prioridad no equivale a clase de notificación;
12. prioridad no equivale a severidad de continuidad.

---

#### 15. Activación de incidente mayor

Se utiliza la marca `MAJOR_INCIDENT` sin crear otro proceso.

Un incidente se marca `MAJOR_INCIDENT` cuando cumple al menos una condición:

- `TI-IMPACT-01` y prioridad `P1_CRITICAL`;
- afecta múltiples servicios con causa o dependencia común;
- afecta más de una sede o un componente transversal;
- compromete identidad, seguridad o autoridad de forma material;
- no existe operación mínima segura para un proceso `C0` o `C1`;
- amenaza propagarse a una interrupción empresarial mayor.

La marca exige:

- coordinador visible;
- línea de tiempo;
- canal de comunicación de incidente;
- frecuencia de actualización P1;
- evaluación explícita de continuidad;
- preservación de evidencia;
- revisión posterior cuando aplique.

`MAJOR_INCIDENT` no equivale automáticamente a activar `VPROC-0062`; el disparador de continuidad se evalúa separadamente.

---

#### 16. `TI-SLA-COMMITMENT-MATRIX-001`

Se aprueban cuatro perfiles internos de compromiso.

Los tiempos son objetivos máximos de operación del caso, no tiempos de respuesta de interfaz ni promesas de eliminación de causa raíz.

| Perfil       | Prioridad     |                        Acuse | Primera respuesta humana o técnica atribuible |        Restauración / workaround seguro para incidente |                Cumplimiento o plan comprometido para solicitud | Comunicación mientras sigue abierto                           |
| ------------ | ------------- | ---------------------------: | --------------------------------------------: | -----------------------------------------------------: | -------------------------------------------------------------: | ------------------------------------------------------------- |
| `TI-SLA-001` | `P1_CRITICAL` |                      ≤ 5 min |                                      ≤ 15 min |                                               ≤ 60 min | ≤ 60 min para acción preautorizada o plan/autoridad explícitos | cada ≤ 30 min                                                 |
| `TI-SLA-002` | `P2_HIGH`     |                     ≤ 15 min |                                      ≤ 30 min |                                                  ≤ 4 h |     ≤ 8 h de ventana de servicio o fecha comprometida aceptada | cada ≤ 60 min                                                 |
| `TI-SLA-003` | `P3_MEDIUM`   | ≤ 4 h de ventana de servicio |                  ≤ 8 h de ventana de servicio |     ≤ 2 días hábiles de servicio o workaround acordado |                          ≤ 2 días hábiles o fecha comprometida | al menos una vez por día hábil mientras exista trabajo activo |
| `TI-SLA-004` | `P4_LOW`      |                ≤ 1 día hábil |                                 ≤ 1 día hábil | fecha planificada; objetivo ordinario ≤ 5 días hábiles |         programación o cumplimiento ordinario ≤ 5 días hábiles | por hito y ante cambio de fecha                               |

La resolución definitiva puede superar el objetivo de restauración cuando exista workaround seguro, dependencia externa o necesidad de cambio formal. El caso conserva la deuda y su handoff; no se declara causa eliminada.

---

#### 17. Reloj del SLA

El reloj debe ser reproducible.

Se conservan:

```text
reported_at
accepted_at
first_response_at
work_started_at
restored_at
fulfilled_at
validation_requested_at
validated_at
closed_at
```

Reglas:

1. para P1 y P2 durante una ventana empresarial requerida, el reloj corre de forma continua mientras el proceso afectado necesita el servicio;
2. un incidente de seguridad, identidad o continuidad no espera al siguiente horario administrativo cuando la capacidad afectada debe responder en `A0`;
3. para P3 y P4 se utiliza la ventana de servicio declarada para el servicio y la sede;
4. no se asume `24×7` para todas las solicitudes;
5. la aplicación debe conservar zona horaria y calendario aplicables;
6. el acuse no detiene el reloj de primera respuesta;
7. la primera respuesta no detiene el reloj de restauración o cumplimiento;
8. un workaround validado puede cerrar el objetivo de restauración, pero no el problema relacionado;
9. el cierre administrativo no modifica retroactivamente los tiempos.

---

#### 18. Pausas y tiempos excluidos

Solo pueden separarse del objetivo aplicable mediante estado explícito y evidencia:

| Estado                       | Puede pausar                                                                 | Condición                                                                                        |
| ---------------------------- | ---------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| `WAITING_REQUESTER_INFO`     | cumplimiento de solicitud; no acuse ni primera respuesta                     | información estrictamente necesaria solicitada con pregunta concreta y canal disponible          |
| `WAITING_REQUIRED_APPROVAL`  | solicitud o cambio asociado                                                  | la decisión pertenece a una autoridad externa al soporte; incidente sigue requiriendo contención |
| `PLANNED_WINDOW_NOT_STARTED` | solicitud planificada                                                        | fecha/ventana aceptada antes de iniciar el trabajo                                               |
| `WAITING_EXTERNAL_PROVIDER`  | no elimina ownership ni comunicación; el tiempo externo se mide por separado | existe caso de proveedor correlacionado y no hay alternativa interna segura                      |

Prohibiciones:

- pausar un P1 por “esperando proveedor” y dejar de comunicar;
- pausar porque el técnico cambió de turno;
- pausar por falta de asignación interna;
- pausar por falta de documentación que el propio equipo debió conservar;
- pausar retrospectivamente para ocultar incumplimiento.

---

#### 19. Incumplimiento de SLA

Un incumplimiento no cambia el estado empresarial del caso.

Debe producir:

```text
sla_breach_detected_at
breached_objective
elapsed_time
current_priority
current_owner
cause_class
escalation_ref
next_commitment
communication_ref
```

Clases iniciales:

- `NO_ASSIGNMENT`;
- `CAPACITY_LIMIT`;
- `WAITING_PROVIDER`;
- `WAITING_APPROVAL`;
- `TECHNICAL_COMPLEXITY`;
- `MISSING_DEPENDENCY`;
- `MISCLASSIFICATION`;
- `COMMUNICATION_FAILURE`;
- `OTHER_DOCUMENTED`.

El incumplimiento:

- no reduce la prioridad;
- no autoriza cerrar;
- no reinicia el reloj;
- no se borra al reclasificar;
- forma parte de métricas y revisión.

---

#### 20. Niveles de atención conservados

| ID            | Nivel                       | Uso en el caso                                                                                                      |
| ------------- | --------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `TI-ATTN-001` | `L0_AUTOSERVICIO_GUIADO`    | consulta, guía y comprobación segura sin privilegio; puede cerrar solo una solicitud/consulta resuelta y comprobada |
| `TI-ATTN-002` | `L1_MESA_DE_SERVICIO`       | recibe, clasifica, completa contexto, aplica acciones estándar seguras, comunica y enruta                           |
| `TI-ATTN-003` | `L2_ESPECIALISTA_TECNICO`   | diagnóstico avanzado, correlación, restauración y preparación de cambio                                             |
| `TI-ATTN-004` | `L3_PROVEEDOR_O_FABRICANTE` | soporte externo delimitado, garantía, ISP, fabricante o plataforma; devuelve evidencia al caso interno              |

Nivel de atención y prioridad son dimensiones independientes.

---

#### 21. Escalamiento funcional y técnico

Se aprueban cinco clases:

| Código           | Disparador                                                                                  | Resultado                                                                           |
| ---------------- | ------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| `ESC_FUNCTIONAL` | ownership ambiguo, aprobación o decisión empresarial necesaria                              | transfiere o incorpora al responsable funcional sin perder el owner tecnológico     |
| `ESC_TECHNICAL`  | L1 no puede diagnosticar/restaurar de forma segura                                          | L2 acepta el caso con contexto, evidencia y pendientes                              |
| `ESC_PROVIDER`   | requiere garantía, ISP, fabricante, plataforma o servicio contratado                        | L3 recibe subcaso; VENTO conserva el caso maestro                                   |
| `ESC_SECURITY`   | secreto, identidad, privilegio, compromiso, soporte remoto sensible o evidencia de abuso    | activa responsable y controles de seguridad; no expone detalles al público del caso |
| `ESC_CONTINUITY` | no existe resultado mínimo seguro o la degradación supera la capacidad ordinaria de soporte | evaluación y posible caso vinculado `VPROC-0062`                                    |

Todo escalamiento conserva:

```text
from_owner
to_owner_or_role
reason
accepted_at
pending_actions
evidence_refs
due_at
communication_ref
```

Una reasignación sin aceptación no transfiere responsabilidad.

---

#### 22. Escalamiento temporal

El SLA activa escalamiento antes del incumplimiento:

| Prioridad     | Umbral preventivo                                                                 |
| ------------- | --------------------------------------------------------------------------------- |
| `P1_CRITICAL` | al consumir 50 % del objetivo de restauración sin una estrategia validada         |
| `P2_HIGH`     | al consumir 50 % del objetivo de restauración sin diagnóstico o workaround viable |
| `P3_MEDIUM`   | al consumir 75 % del objetivo vigente sin siguiente acción y propietario          |
| `P4_LOW`      | cuando la fecha comprometida queda en riesgo o cambia una dependencia             |

Al alcanzar el objetivo sin resultado:

- se registra breach;
- se eleva el nivel requerido;
- se comunica el nuevo compromiso;
- se preserva prioridad según impacto/urgencia actual;
- no se cierra ni se reinicia el caso.

---

#### 23. Escalamiento hacia continuidad

El incidente técnico conserva `VPROC-0058`.

Se evalúa `VPROC-0062` cuando:

- un proceso `C0` pierde el resultado mínimo;
- un proceso `C1` queda sin operación mínima segura durante su ventana activa;
- el incidente afecta múltiples sedes o servicios y requiere coordinación extraordinaria;
- el workaround ordinario no es suficiente o introduce riesgo material;
- la recuperación exige activar un sitio, canal, procedimiento o modo alternativo empresarial;
- existe trabajo degradado que requerirá reconciliación transversal.

Relación:

```text
TECH_CASE
→ puede originar
CONTINUITY_CASE

TECH_CASE RESTORED
≠
CONTINUITY CASE RECONCILED
```

---

#### 24. Escalamiento hacia problema

`TI-DOM-008` conserva la autoridad de problema.

Se genera handoff cuando:

- existe recurrencia material;
- varios incidentes comparten síntoma o dependencia;
- la causa permanece desconocida después de restaurar;
- un workaround temporal se vuelve recurrente;
- un incidente causado por cambio requiere análisis causal;
- el guardrail de recurrencia del proceso se incumple.

El cierre del incidente no espera necesariamente la eliminación de la causa si el servicio fue restaurado, validado y el problema quedó aceptado con propietario.

---

#### 25. Escalamiento hacia cambio

`TI-DOM-009` conserva la autoridad de cambio.

Se requiere cambio formal cuando la resolución exige, entre otros:

- modificar red, direccionamiento, firmware o driver;
- alterar configuración administrada;
- desplegar software;
- cambiar proveedor o integración;
- modificar políticas, permisos o identidad técnica fuera de una acción ya autorizada;
- instalar, sustituir o reconfigurar un elemento con riesgo material;
- aplicar una corrección que deba tener prueba y rollback.

Diagnóstico:

```text
PUEDE PROPONER CAMBIO
≠
AUTORIZA CAMBIO
```

El incidente conserva su SLA de restauración mientras el cambio sigue su propio gobierno.

---

#### 26. Comunicación al solicitante

Toda comunicación externa al equipo técnico debe responder:

1. qué se sabe;
2. qué está afectado;
3. qué está funcionando;
4. qué acción segura debe realizar o evitar el usuario;
5. quién es responsable;
6. cuál es la siguiente actualización o compromiso;
7. si existe workaround;
8. cuándo se solicita validación;
9. qué quedó cerrado y qué permanece pendiente.

No se muestra por defecto:

- secretos;
- tokens;
- credenciales;
- claves;
- IP o topología innecesarias;
- logs completos;
- payloads sensibles;
- datos personales de terceros;
- hipótesis no verificadas como causa confirmada.

---

#### 27. Cadencia de comunicación

`TI-ESCALATION-COMMUNICATION-MATRIX-001` materializa:

| Prioridad     | Solicitante                                    | Responsables operativos                | Coordinación técnica                      | Proveedor                      |
| ------------- | ---------------------------------------------- | -------------------------------------- | ----------------------------------------- | ------------------------------ |
| `P1_CRITICAL` | acuse y cada ≤ 30 min                          | inmediato y cada cambio material       | canal activo hasta restauración           | inmediato cuando sea necesario |
| `P2_HIGH`     | acuse y cada ≤ 60 min                          | ante bloqueo, riesgo o cambio material | seguimiento hasta workaround/restauración | según necesidad y SLA externo  |
| `P3_MEDIUM`   | al menos diaria mientras exista trabajo activo | por hito o desviación                  | según asignación                          | cuando exista dependencia      |
| `P4_LOW`      | por hito, fecha o cambio de compromiso         | solo cuando afecte planificación       | según cola                                | cuando aplique                 |

El servicio `NOTIFY-ARC` podrá transportar esas comunicaciones, pero la política de caso conserva destinatario, contenido mínimo, obligatoriedad y cadencia.

---

#### 28. Comunicación de incidente mayor

Un `MAJOR_INCIDENT` conserva una línea de comunicación separada del diagnóstico detallado.

Contenido mínimo:

```text
incident_ref
started_at
affected_services
affected_business_scope
current_status
workaround_status
next_update_at
owner
continuity_status
restoration_status
```

La comunicación:

- no declara causa antes de confirmarla;
- no culpa personas o proveedores sin evidencia;
- no publica secretos;
- no expone detalles de seguridad que amplíen el riesgo;
- distingue restauración de resolución definitiva;
- finaliza con resumen de restauración y siguientes acciones.

---

#### 29. Evidencia de diagnóstico

El caso puede referenciar:

- health signals;
- eventos;
- logs minimizados;
- screenshots;
- versiones;
- configuración aprobada;
- relaciones de dependencia;
- evidencia física;
- caso de proveedor;
- resultado de prueba;
- cambio relacionado.

Reglas:

1. el adjunto se protege por sensibilidad;
2. un log no se pega íntegramente cuando basta una referencia;
3. los secretos se redactan o excluyen;
4. la evidencia conserva fuente y momento;
5. una captura del usuario no sustituye la comprobación técnica;
6. una señal técnica saludable no invalida una falla empresarial comprobada;
7. un diagnóstico puede evolucionar sin sobrescribir hipótesis anteriores.

---

#### 30. Restauración

Un incidente alcanza restauración cuando existe evidencia suficiente de que:

- el resultado mínimo aplicable volvió a estar disponible;
- el actor o responsable puede ejecutar la operación necesaria;
- el workaround, si existe, está explícitamente autorizado y vigente;
- no existe un estado de resultado desconocido pendiente que impida confiar en la operación;
- las dependencias críticas requeridas están disponibles o degradadas de forma segura;
- se registró `restored_at`;
- se conoce qué queda pendiente después de restaurar.

Restaurar no significa:

- cerrar;
- resolver causa raíz;
- retirar el workaround;
- completar un problema;
- completar un cambio;
- cerrar continuidad.

---

#### 31. Cumplimiento de solicitud

Una `SERVICE_REQUEST` queda cumplida cuando:

- el resultado solicitado fue entregado;
- el alcance coincide con la solicitud aceptada;
- cualquier aprobación requerida pertenece al proceso correcto;
- la evidencia de ejecución está disponible;
- el usuario puede comprobar el resultado;
- no queda un efecto pendiente oculto.

Una solicitud de acceso no se cumple dentro de `VPROC-0058`; el cumplimiento pertenece a `VPROC-0059`.

Una solicitud que exige cambio no se considera cumplida solo porque el cambio fue creado; debe verificarse el resultado esperado después del cambio.

---

#### 32. Validación

Después de restauración o cumplimiento:

```text
→ VPROC-0058.USER_VALIDATION_PENDING
```

La validación puede provenir de:

- solicitante;
- responsable del proceso;
- responsable de sede/área;
- señal objetiva autorizada cuando el resultado es técnicamente verificable y la aceptación humana no es necesaria.

Reglas:

- una validación negativa regresa a `RESOLUTION_IN_PROGRESS`;
- la evidencia automática debe estar definida para el tipo de resultado;
- el silencio del usuario no constituye aceptación automática;
- cuando el solicitante no pueda validar, el responsable autorizado registra fundamento y evidencia;
- una verificación del proveedor no sustituye la validación VENTO.

---

#### 33. Conocimiento y handoff

Después de validación:

```text
→ VPROC-0058.KNOWLEDGE_CAPTURE_PENDING
```

Se registra, cuando aplique:

- síntoma;
- contexto;
- causa confirmada o `UNKNOWN`;
- diagnóstico útil;
- acción aplicada;
- workaround y vigencia;
- resultado;
- versión o configuración afectada;
- referencias a cambio/problema;
- advertencias;
- quién puede reutilizar el conocimiento;
- fecha de revisión.

No se incluyen secretos ni datos personales innecesarios.

Un caso sin conocimiento reutilizable puede declarar `NO_REUSABLE_KNOWLEDGE` con motivo; no se inventa una guía vacía.

---

#### 34. Cierre normal

`TI-CASE-CLOSURE-REOPEN-CONTRACT-001` exige para `VPROC-0058.TECH_CASE_CLOSED`:

- restauración o fulfillment comprobados;
- validación aceptada o evidencia objetiva equivalente autorizada;
- prioridad y SLA final registrados;
- comunicaciones requeridas emitidas;
- acciones técnicas y cambios relacionados registrados;
- problema relacionado creado cuando corresponda;
- conocimiento capturado o excepción justificada;
- pendientes transferidos con aceptación;
- adjuntos y evidencia referenciados;
- cierre con actor, tiempo y código.

Códigos normales:

```text
FULFILLED_VALIDATED
RESTORED_VALIDATED
CONSULTATION_COMPLETED
```

No se usa `CLOSED` como sustituto de esos criterios.

---

#### 35. Cancelación, nulidad, compensación y corrección

Se conservan las acciones aprobadas:

| Acción                            | Uso                                                                                  |
| --------------------------------- | ------------------------------------------------------------------------------------ |
| `VPROC-0058.CCR-001 — CANCEL`     | detener un caso abierto por causa válida sin afirmar cumplimiento                    |
| `VPROC-0058.CCR-002 — VOID`       | anular registro duplicado o inválido conservando referencia al correcto              |
| `VPROC-0058.CCR-003 — COMPENSATE` | crear medida compensatoria por efectos válidos que no pueden deshacerse literalmente |
| `VPROC-0058.CCR-004 — CORRECT`    | corregir hechos, clasificación o responsables mediante versión auditada              |

Estas acciones no se expresan como cierre normal exitoso.

---

#### 36. Reapertura

Se conserva:

```text
VPROC-0058.EX-004 — REOPEN
```

Reglas:

1. el expediente cerrado permanece inmutable;
2. se crea revisión o caso vinculado;
3. se conserva `reopened_from_ref`;
4. se recalculan impacto, urgencia, prioridad y SLA con el contexto actual;
5. recurrencia puede activar handoff a problema;
6. el SLA anterior no se reescribe;
7. las métricas distinguen reapertura de un caso que nunca debió cerrarse;
8. una validación fallida antes del cierre utiliza el loop normal y no `REOPEN`.

---

#### 37. Estados canónicos de `VPROC-0058`

Se preservan sin renombrar:

| Orden | Estado                                 |
| ----: | -------------------------------------- |
|     0 | `VPROC-0058.TECH_CASE_REPORTED`        |
|     1 | `VPROC-0058.TRIAGE_IN_PROGRESS`        |
|     2 | `VPROC-0058.PRIORITIZED`               |
|     3 | `VPROC-0058.DIAGNOSIS_IN_PROGRESS`     |
|     4 | `VPROC-0058.WORKAROUND_APPLIED`        |
|     5 | `VPROC-0058.RESOLUTION_IN_PROGRESS`    |
|     6 | `VPROC-0058.USER_VALIDATION_PENDING`   |
|     7 | `VPROC-0058.KNOWLEDGE_CAPTURE_PENDING` |
|     8 | `VPROC-0058.TECH_CASE_CLOSED`          |

La tarea no crea un segundo state machine.

---

#### 38. Transiciones y excepciones conservadas

Transiciones normales:

```text
TR-001 reporte → triage
TR-002 triage → priorizado
TR-003 priorizado → diagnóstico
TR-004 diagnóstico → workaround
TR-005 diagnóstico → resolución sin workaround
TR-006 workaround → resolución
TR-007 resolución → validación
TR-008 validación negativa → resolución
TR-009 validación aceptada → conocimiento
TR-010 conocimiento → cierre
```

Excepciones:

```text
EX-001 ESCALATE
EX-002 CONTINGENCY
EX-003 REASSIGN
EX-004 REOPEN
```

Esta tarea especializa sus datos y condiciones; no cambia las identidades aprobadas.

---

#### 39. `TI-SERVICE-DESK-ASIS-RECONCILIATION-001`

La implementación actual observada contiene `support_tickets`, `support_messages` y `support_ticket_reads`.

`support_tickets` materializa actualmente:

```text
id
created_by
site_id
category
title
description
status
assigned_to
resolved_at
created_at
updated_at
target_employee_id
```

El enum observado de `status` contiene:

```text
open
in_progress
resolved
closed
```

La evidencia actual no materializa en `support_tickets` campos canónicos separados para:

- `affected_service_ref`;
- `affected_element_refs`;
- `impact_level`;
- `urgency_level`;
- `priority`;
- `sla_profile_ref`;
- `restored_at`;
- `validation_state`;
- referencias a problema, cambio, continuidad o proveedor;
- razón estructurada de cierre.

Estado:

```text
MODELO AS-IS = PARCIAL
MODELO OBJETIVO TI-DOM-007 = ESPECIFICADO
IMPLEMENTACIÓN = PENDIENTE DE PAQUETE PROPIETARIO
```

---

#### 40. Reconciliación de estados legacy

| Estado AS-IS  | Significado máximo admisible durante transición | No puede inferirse                                                                  |
| ------------- | ----------------------------------------------- | ----------------------------------------------------------------------------------- |
| `open`        | caso reportado o pendiente de triage            | prioridad, causa, asignación efectiva                                               |
| `in_progress` | existe actividad sobre el caso                  | diagnóstico, workaround o resolución concreta                                       |
| `resolved`    | existe una afirmación de resolución legacy      | restauración validada, causa eliminada o cierre                                     |
| `closed`      | conversación/ticket legacy marcado cerrado      | `VPROC-0058.TECH_CASE_CLOSED` sin reconciliar validación, conocimiento y pendientes |

La migración futura no asignará estados canónicos por nombre solamente. Cada fila requiere reglas deterministas y evidencia.

---

#### 41. Comportamiento AS-IS de ANIMA

La implementación observada en ANIMA permite:

- crear `support_tickets` desde cliente;
- usar actualmente `category = attendance` en los flujos revisados;
- crear un primer `support_message`;
- mover un ticket a `in_progress` al enviar mensaje;
- cerrar conversación actualizando `status = closed`;
- escribir `resolved_at` al cerrar desde esa experiencia;
- mostrar y actualizar mensajes y no leídos.

Decisión:

```text
CERRAR CONVERSACIÓN
≠
CERRAR CASO TECNOLÓGICO CANÓNICO
```

La implementación futura deberá mantener una experiencia simple en ANIMA mientras VISO conserva clasificación, SLA, restauración, aceptación y cierre.

---

#### 42. Privacidad y seguridad de soporte

El caso se clasifica como información restringida cuando contiene diagnóstico, identidad, datos laborales, infraestructura o evidencia.

Reglas:

1. ANIMA muestra al solicitante únicamente información necesaria para entender estado y siguiente acción;
2. VISO puede mostrar diagnóstico ampliado solo a funciones autorizadas;
3. un proveedor recibe el mínimo contexto necesario;
4. secretos no se escriben en descripción, mensajes, screenshots ni conocimiento;
5. soporte remoto requiere la autoridad y controles definidos por `TI-AUTH-*`;
6. una captura debe poder redactarse antes de compartirse;
7. logs completos se conservan en su sistema propietario y el caso guarda referencia;
8. no se usa el caso como almacén de credenciales;
9. los accesos diagnósticos forman parte de auditoría;
10. la prioridad alta no amplía autorización.

---

#### 43. Operación degradada y offline

Para `VPROC-0058` se conserva:

```text
OF1_CACHED_REFERENCE
+
OF3_LOCAL_CAPTURE
+
OF5_MANUAL_CONTINGENCY
→
SYNC-1_URGENT
```

Esto permite:

- consultar guías cacheadas con versión y frescura;
- capturar localmente reporte y evidencia cuando la conectividad no está disponible;
- aplicar contención manual autorizada;
- sincronizar prioritariamente al recuperar conectividad.

No permite:

- cerrar el caso localmente como si VISO hubiera aceptado;
- asignar prioridad final desde caché;
- conceder acceso;
- ejecutar un cambio no autorizado;
- declarar restauración sin reconciliación.

---

#### 44. Métricas y SLI del caso

Se materializan los indicadores ya requeridos por `VPROC-0058`:

| ID                | Indicador                   | Definición                                                              |
| ----------------- | --------------------------- | ----------------------------------------------------------------------- |
| `TI-CASE-SLI-001` | tiempo de acuse             | `accepted_at - reported_at` bajo el calendario aplicable                |
| `TI-CASE-SLI-002` | tiempo de primera respuesta | primera respuesta atribuible menos `reported_at`                        |
| `TI-CASE-SLI-003` | tiempo de restauración      | `restored_at - reported_at`, separando pausas válidas                   |
| `TI-CASE-SLI-004` | tiempo de fulfillment       | `fulfilled_at - reported_at`, separando pausas válidas                  |
| `TI-CASE-SLI-005` | cumplimiento SLA            | objetivo cumplido / casos elegibles por prioridad                       |
| `TI-CASE-SLI-006` | tiempo en espera            | tiempo por clase de espera y responsable                                |
| `TI-CASE-SLI-007` | reasignaciones              | cantidad y tiempo por transferencia                                     |
| `TI-CASE-SLI-008` | reapertura                  | casos reabiertos / casos cerrados                                       |
| `TI-CASE-SLI-009` | recurrencia                 | incidentes vinculados a problema o patrón repetido                      |
| `TI-CASE-SLI-010` | cierre sin validación       | debe permanecer en cero salvo evidencia objetiva autorizada equivalente |

Dimensiones mínimas:

```text
service
affected_element_class
site
area
priority
case_type
attention_level
provider
cause_class
change_related
major_incident
```

Las métricas no se usan para penalizar al trabajador por fallas de infraestructura.

---

#### 45. Cobertura de prueba consumida

La tarea se apoya en requisitos vigentes que ya protegen:

- una mesa de servicio que distingue solicitud, incidente, problema, error conocido y cambio;
- servicio, elemento, sede, solicitante, impacto, urgencia, prioridad, SLA, asignación, comunicaciones, diagnóstico, trabajo, workaround, restauración, validación, cierre y reapertura;
- separación de incidente, problema, cambio y continuidad;
- correlación de servicios, activos, endpoints, aplicaciones, tickets, proveedores y cambios;
- protección de secretos y diagnósticos sensibles;
- latencia, timeout, resultado desconocido y trabajos asíncronos;
- operación offline, captura local y reconciliación;
- inventario tecnológico y relaciones físicas;
- métricas de primera respuesta, restauración, espera, recurrencia y cierre sin validación.

Entre las coberturas vigentes se encuentran `TREQ-VISO-002`, `TREQ-INTEGRATION-020`, `TREQ-NEXO-019` y los requisitos de proceso ya aprobados para tiempos de respuesta, offline, observabilidad y auditoría.

TI-DOM-007 especializa esos comportamientos para el caso tecnológico sin crear una segunda obligación de prueba paralela.

---

#### 46. Hallazgos y propietarios

| ID                 | Hallazgo                                                                                                        | Estado                   | Propietario                                                                           | Condición de salida                                                                                      |
| ------------------ | --------------------------------------------------------------------------------------------------------------- | ------------------------ | ------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| `H-TI-DOM-007-001` | `support_tickets` no materializa servicio afectado, impacto, urgencia, prioridad ni SLA                         | `ESPECIFICADO`           | paquete de implementación VISO / E3                                                   | modelo físico implementa el contrato sin perder historial                                                |
| `H-TI-DOM-007-002` | estados legacy `open/in_progress/resolved/closed` no son equivalentes al state machine de `VPROC-0058`          | `ESPECIFICADO`           | paquete de transición Supabase propietario                                            | mapping determinista, compatibilidad y backfill quedan probados antes de retirar legacy                  |
| `H-TI-DOM-007-003` | ANIMA puede marcar la conversación `closed` y `resolved_at` desde cliente                                       | `ESPECIFICADO`           | paquete E5 ANIMA/VISO + autorización de servidor                                      | la experiencia distingue cerrar conversación de validar/cerrar caso y el servidor gobierna la transición |
| `H-TI-DOM-007-004` | el flujo actual mueve `status` a `in_progress` al enviar un mensaje                                             | `ESPECIFICADO`           | paquete E5 ANIMA/VISO                                                                 | mensajería y transición de proceso quedan separadas                                                      |
| `H-TI-DOM-007-005` | no se demostró en las fuentes revisadas una mesa de servicio VISO completa que materialice el contrato objetivo | `PENDIENTE_DE_EVIDENCIA` | paquete E5 VISO                                                                       | superficie, guards, modelo, acciones y pruebas quedan inventariados e implementados                      |
| `H-TI-DOM-007-006` | el calendario real de cobertura humana por servicio y sede no está materializado en el soporte actual           | `PENDIENTE_DE_EVIDENCIA` | `TI-DOM-012` para soporte contratado y paquete operativo VISO para calendario interno | cada servicio referencia una ventana de soporte vigente sin reducir P1/A0                                |
| `H-TI-DOM-007-007` | no existe evidencia de cumplimiento histórico de los SLA definidos en esta tarea                                | `PENDIENTE_DE_EVIDENCIA` | `TI-DOM-010` + paquete E5 VISO                                                        | instrumentación y datos reales calculan SLI por prioridad                                                |
| `H-TI-DOM-007-008` | la espera de proveedor puede ocultar incumplimiento si no se separan reloj interno y externo                    | `RESUELTO_POR_CONTRATO`  | `TI-SLA-COMMITMENT-MATRIX-001`                                                        | implementación conserva ambos tiempos y no pausa comunicación                                            |
| `H-TI-DOM-007-009` | un incidente crítico puede requerir continuidad sin convertirse en el mismo expediente                          | `RESUELTO_POR_CONTRATO`  | `ESC_CONTINUITY` + `VPROC-0062`                                                       | implementación conserva dos identidades correlacionadas                                                  |
| `H-TI-DOM-007-010` | causa raíz y cambio pueden confundirse con cierre del incidente                                                 | `RESUELTO_POR_CONTRATO`  | `TI-DOM-008`; `TI-DOM-009`                                                            | incidentes cierran por restauración/validación y handoffs mantienen su propio ciclo                      |

No queda un pendiente narrativo sin propietario y condición de salida.

---

#### 47. Estado de materialización

| Componente                                 | Estado                   |
| ------------------------------------------ | ------------------------ |
| identidad del caso tecnológico             | `ESPECIFICADO`           |
| clasificación solicitud/incidente/consulta | `ESPECIFICADO`           |
| handoff acceso/problema/cambio             | `ESPECIFICADO`           |
| impacto 4 niveles                          | `ESPECIFICADO`           |
| urgencia 4 niveles                         | `ESPECIFICADO`           |
| matriz 16 combinaciones                    | `ESPECIFICADO`           |
| prioridad P1-P4                            | `ESPECIFICADO`           |
| SLA P1-P4                                  | `ESPECIFICADO`           |
| escalamiento                               | `ESPECIFICADO`           |
| comunicación                               | `ESPECIFICADO`           |
| restauración y fulfillment                 | `ESPECIFICADO`           |
| validación, conocimiento y cierre          | `ESPECIFICADO`           |
| reapertura                                 | `ESPECIFICADO`           |
| modelo físico VISO                         | `FUERA_DE_ALCANCE`       |
| migración de `support_tickets`             | `FUERA_DE_ALCANCE`       |
| ejecución de SLA real                      | `PENDIENTE_DE_EVIDENCIA` |
| cambios Supabase                           | `NO_APLICA`              |

---

#### 48. Invariantes

1. `VPROC-0058` permanece como proceso propietario del caso tecnológico;
2. `VPROC-0059` permanece separado para accesos;
3. `VPROC-0062` permanece separado para continuidad;
4. solicitud no equivale a incidente;
5. incidente no equivale a problema;
6. problema no equivale a cambio;
7. prioridad no es entrada libre del usuario;
8. impacto no es urgencia;
9. criticidad de proceso no es prioridad;
10. prioridad no es nivel L0-L3;
11. prioridad no concede autorización;
12. antigüedad no eleva prioridad por sí sola;
13. workaround no equivale a causa eliminada;
14. restauración no equivale a cierre;
15. `resolved` legacy no equivale a validación;
16. `closed` legacy no equivale a cierre canónico;
17. un mensaje no cambia por sí solo el estado empresarial;
18. proveedor externo no cierra el caso VENTO;
19. espera de proveedor no elimina ownership interno;
20. SLA vencido no reinicia el reloj;
21. pausa de SLA requiere causa estructurada;
22. P1 durante ventana crítica no espera horario administrativo;
23. no se asume cobertura 24×7 para toda solicitud;
24. soporte remoto no amplía autoridad;
25. diagnóstico no autoriza cambio;
26. causa desconocida puede coexistir con servicio restaurado;
27. incidente cerrado puede tener problema abierto relacionado;
28. reapertura no reescribe el cierre anterior;
29. prioridad se recalcula con impacto y urgencia actuales;
30. downgrade de prioridad conserva razón y evidencia;
31. incidente mayor no equivale automáticamente a continuidad;
32. comunicación no expone secretos;
33. logs se referencian y minimizan;
34. silencio del usuario no equivale a validación;
35. cierre exige pendientes transferidos;
36. cancelación no se presenta como fulfillment;
37. void no se presenta como cierre exitoso;
38. métricas distinguen espera interna, externa y validación;
39. la operación offline no puede declarar cierre autoritativo;
40. esta tarea no modifica código, datos ni Supabase.

---

#### 49. Criterios de aceptación

- [x] se conserva la continuidad `TI-DOM-006 → TI-DOM-007 → TI-DOM-008`;
- [x] la tarea permanece exclusivamente documental;
- [x] `VPROC-0058` se conserva como proceso único del caso;
- [x] se distinguen solicitud, incidente y consulta;
- [x] acceso, problema y cambio conservan handoffs propios;
- [x] se define un contrato completo de identidad del caso;
- [x] se define entrada mínima sin exigir diagnóstico técnico al usuario;
- [x] se definen exactamente cuatro niveles de impacto;
- [x] se definen exactamente cuatro niveles de urgencia;
- [x] se materializan las 16 combinaciones impacto × urgencia;
- [x] se definen exactamente cuatro prioridades;
- [x] prioridad se deriva y no se acepta como texto del solicitante;
- [x] se define el marcador `MAJOR_INCIDENT` sin crear otro proceso;
- [x] se definen exactamente cuatro perfiles SLA;
- [x] cada SLA distingue acuse, primera respuesta, restauración o cumplimiento y comunicación;
- [x] se define un reloj reproducible y condiciones de pausa;
- [x] esperar proveedor no elimina ownership ni comunicación;
- [x] se conservan los cuatro niveles L0-L3;
- [x] se definen escalamiento funcional, técnico, proveedor, seguridad y continuidad;
- [x] se define escalamiento preventivo antes del breach;
- [x] se define la frontera con `VPROC-0062`;
- [x] se define la frontera con `TI-DOM-008`;
- [x] se define la frontera con `TI-DOM-009`;
- [x] se materializa cadencia de comunicación por prioridad;
- [x] se definen restauración, fulfillment, validación y conocimiento;
- [x] se preservan los nueve estados, diez transiciones, cuatro excepciones y cuatro CCR de `VPROC-0058`;
- [x] se reconcilian los cuatro estados legacy observados;
- [x] se documenta el comportamiento AS-IS de ANIMA sin presentarlo como modelo objetivo;
- [x] se preserva privacidad de diagnósticos, logs y secretos;
- [x] se preserva el perfil offline y `SYNC-1_URGENT`;
- [x] se materializan diez SLI del caso;
- [x] los diez hallazgos tienen propietario y condición de salida;
- [x] no se crea ni modifica ningún requisito de prueba;
- [x] no se modifica Supabase;
- [x] `TI-DOM-008` permanece únicamente reservada.

---

#### 50. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea especializa y materializa para el caso tecnológico reglas de mesa de servicio, clasificación, prioridad, compromiso de servicio, trazabilidad, restauración, validación, cierre, integración, rendimiento, operación degradada y auditoría que ya están protegidas por el registro canónico vigente. El resultado no crea una nueva superficie ejecutable, esquema físico, autorización, integración, transporte, proveedor ni comportamiento empresarial fuera de esas obligaciones; por tanto no requiere una fila adicional ni modificar una existente.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 51. Continuidad

ÚLTIMA TAREA APROBADA
`TI-DOM-006 — Definir catálogo de aplicaciones, ambientes, dependencias, proveedores, licencias y criticidad`

TAREA ACTUAL APROBADA
`TI-DOM-007 — Definir solicitud de servicio, incidente, impacto, urgencia, prioridad, SLA, escalamiento, comunicación y cierre`

SIGUIENTE TAREA RESERVADA
`TI-DOM-008 — Definir problema, causa raíz, error conocido, workaround y prevención de recurrencia`


### ✅ TI-DOM-008 — Definir problema, causa raíz, error conocido, workaround y prevención de recurrencia

**Estado:** APROBADA
**Tarea anterior:** `TI-DOM-007 — Definir solicitud de servicio, incidente, impacto, urgencia, prioridad, SLA, escalamiento, comunicación y cierre` — APROBADA
**Tarea siguiente:** `TI-DOM-009 — Definir cambio tecnológico, aprobación, ventana, prueba, despliegue, rollback y revisión posterior` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada de gestión de problemas tecnológicos, análisis causal, errores conocidos, workarounds reutilizables, correlación de recurrencia, acciones preventivas y verificación de eficacia
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/01_DOMINIO_DE_TECNOLOGIA_Y_SOPORTE.md`
**Artefactos producidos:** `TI-PROBLEM-MANAGEMENT-CONTRACT-001`; `TI-PROBLEM-LIFECYCLE-MATRIX-001`; `TI-RCA-EVIDENCE-CONTRACT-001`; `TI-KNOWN-ERROR-CONTRACT-001`; `TI-WORKAROUND-GOVERNANCE-MATRIX-001`; `TI-RECURRENCE-DETECTION-MATRIX-001`; `TI-PREVENTION-EFFECTIVENESS-CONTRACT-001`; `TI-PROBLEM-ASIS-RECONCILIATION-001`
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, tablas, enums, RLS, RPC, funciones, triggers, Edge Functions, migraciones, datos, aplicaciones, redes, endpoints, impresoras, configuraciones, proveedores, cuentas, licencias, despliegues ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el modelo canónico con el que VENTO transforma señales repetidas, incidentes relacionados, causas no explicadas y workarounds recurrentes en un problema tecnológico trazable, hasta determinar causalidad suficiente, gobernar un error conocido, transferir las acciones preventivas a sus autoridades propietarias y comprobar si la recurrencia fue realmente reducida.

La tarea conserva una separación estricta:

```text
INCIDENTE
≠ PROBLEMA
≠ HIPÓTESIS
≠ CAUSA CONFIRMADA
≠ ERROR CONOCIDO
≠ WORKAROUND
≠ CAMBIO
≠ ACCIÓN PREVENTIVA
≠ EFICACIA DEMOSTRADA
```

Un incidente busca restaurar el servicio. Un problema investiga la causa o el patrón de recurrencia. Un error conocido conserva una causa o condición suficientemente identificada y un workaround gobernado. Un cambio modifica deliberadamente un componente o configuración y pertenece a `TI-DOM-009`.

La tarea cierra documentalmente cinco riesgos:

1. cerrar un incidente y asumir que la causa desapareció;
2. tratar cada recurrencia como un caso aislado;
3. convertir una hipótesis técnica en causa raíz sin evidencia;
4. mantener workarounds por memoria personal, sin versión, alcance ni revisión;
5. declarar prevención efectiva solo porque una corrección fue ejecutada.

---

#### 2. Resultado material

Se aprueban ocho artefactos documentales coordinados:

1. `TI-PROBLEM-MANAGEMENT-CONTRACT-001`, identidad, propiedad, relaciones, estados e invariantes del problema;
2. `TI-PROBLEM-LIFECYCLE-MATRIX-001`, siete estados y nueve transiciones documentales;
3. `TI-RCA-EVIDENCE-CONTRACT-001`, hipótesis, factores causales, evidencia, confirmación y trazabilidad de análisis;
4. `TI-KNOWN-ERROR-CONTRACT-001`, publicación, vigencia, alcance y retiro del error conocido;
5. `TI-WORKAROUND-GOVERNANCE-MATRIX-001`, estados, condiciones de uso, riesgos, revisión y retiro de workarounds;
6. `TI-RECURRENCE-DETECTION-MATRIX-001`, señales y reglas de correlación sin umbrales numéricos inventados;
7. `TI-PREVENTION-EFFECTIVENESS-CONTRACT-001`, acciones preventivas, handoffs y verificación de eficacia;
8. `TI-PROBLEM-ASIS-RECONCILIATION-001`, reconciliación del modelo objetivo contra la base actual de soporte.

Cobertura materializada:

| Control                                           |            Resultado |
| ------------------------------------------------- | -------------------: |
| Proceso de incidente conservado                   | **1 — `VPROC-0058`** |
| Registros documentales especializados de problema |       **1 contrato** |
| Estados de problema                               |                **7** |
| Transiciones de problema                          |                **9** |
| Estados de evidencia causal                       |                **4** |
| Clases causales iniciales                         |                **9** |
| Estados de error conocido                         |                **4** |
| Estados de workaround                             |                **5** |
| Señales de recurrencia                            |                **8** |
| Niveles de confirmación de recurrencia            |                **3** |
| Clases de acción preventiva                       |                **8** |
| Estados de eficacia                               |                **5** |
| Códigos de cierre de problema                     |                **4** |
| Indicadores de problema y recurrencia             |               **10** |
| Hallazgos con propietario y condición de salida   |               **10** |
| Requisitos de prueba nuevos o modificados         |                **0** |
| Cambios físicos                                   |                **0** |

---

#### 3. Autoridades y entradas heredadas

La tarea consume y preserva:

- `VPROC-0058 — Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento`;
- `TI-DOM-007` y su contrato de caso, prioridad, SLA, restauración, validación, cierre y reapertura;
- el handoff `PROBLEM_CANDIDATE` ya aprobado;
- los seis disparadores de problema aprobados en `TI-DOM-007`;
- `TI-SERVICE-007 — Incidentes y restauración tecnológica`;
- `TI-SERVICE-011 — Conocimiento, capacitación y adopción tecnológica`;
- las clases de configuración y relaciones de `TI-DOM-002`;
- el ciclo de endpoint de `TI-DOM-003`;
- arquitectura y drift de red de `TI-DOM-004`;
- gobierno físico de impresión de `TI-DOM-005`;
- catálogo de aplicaciones, ambientes, dependencias y proveedores de `TI-DOM-006`;
- `TI-DOM-009` como autoridad exclusiva de cambio tecnológico;
- `TI-DOM-010` como autoridad de observabilidad, señales, alertas, métricas y salud técnica;
- `TI-DOM-011` como autoridad de respaldo, restauración y recuperación técnica;
- `TI-DOM-013` como autoridad de base de conocimiento, capacitación y adopción;
- `TI-AUTH-*` como autoridad de acceso privilegiado y soporte sensible;
- `VPROC-0062` como proceso separado de continuidad empresarial.

Ninguna decisión de esta tarea autoriza una modificación técnica, un despliegue, una elevación de privilegios ni una aceptación de riesgo por parte del técnico.

---

#### 4. Fronteras conceptuales

Se fijan las siguientes definiciones:

| Concepto              | Definición canónica                                                                                                              |
| --------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `INCIDENT`            | interrupción, degradación o resultado desconocido cuya prioridad inmediata es restaurar o contener                               |
| `PROBLEM`             | expediente de investigación causal o de recurrencia que correlaciona evidencia, incidentes, componentes, cambios y dependencias  |
| `SYMPTOM`             | comportamiento observable; no es causa                                                                                           |
| `HYPOTHESIS`          | explicación candidata todavía no confirmada                                                                                      |
| `CONTRIBUTING_FACTOR` | condición que aumentó probabilidad, alcance o impacto sin demostrar por sí sola causalidad suficiente                            |
| `ROOT_CAUSE`          | condición o conjunto causal confirmado con evidencia suficiente para explicar el patrón investigado dentro del alcance declarado |
| `KNOWN_ERROR`         | problema cuya causa o condición está suficientemente identificada y para el que existe un workaround gobernado y consumible      |
| `WORKAROUND`          | medida temporal y controlada que reduce impacto o permite operar sin afirmar eliminación de causa                                |
| `PREVENTIVE_ACTION`   | obligación orientada a eliminar, reducir o controlar la recurrencia                                                              |
| `EFFECTIVENESS`       | evidencia posterior que demuestra si la acción produjo el resultado preventivo esperado                                          |

Reglas:

```text
SÍNTOMA REPETIDO
≠
CAUSA COMPARTIDA CONFIRMADA
```

```text
CORRELACIÓN TEMPORAL
≠
CAUSALIDAD
```

```text
WORKAROUND EXITOSO
≠
CAUSA RAÍZ CONFIRMADA
```

```text
CAMBIO APLICADO
≠
PREVENCIÓN EFECTIVA
```

---

#### 5. Propiedad y responsabilidades

| Función                                             | Responsabilidad                                                                                             | Límite                                                                  |
| --------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| `RESPONSABLE_TECNOLOGICO`                           | aceptar el problema, coordinar investigación, mantener relaciones, asegurar evidencia y transferir acciones | no se autoautoriza cambios, acceso privilegiado ni aceptación de riesgo |
| responsable técnico asignado                        | ejecutar análisis, comparar evidencia, documentar hipótesis y resultados                                    | no convierte opinión en causa confirmada                                |
| `RESPONSABLE_DEL_PROCESO`                           | aportar impacto, contexto y validar consecuencias empresariales de recurrencia o prevención                 | no sustituye el análisis técnico                                        |
| `RESPONSABLE_DE_SEGURIDAD_TECNOLOGICA`              | intervenir cuando causa, evidencia o workaround afecten identidad, privilegios, secretos o seguridad        | no publica detalles sensibles como conocimiento general                 |
| propietario del componente                          | aportar configuración, versión, historial, cambio y evidencia de su dominio                                 | no cierra por sí solo el problema transversal                           |
| proveedor / fabricante                              | aportar diagnóstico, defecto conocido, workaround o corrección bajo alcance contratado                      | su afirmación es evidencia externa hasta reconciliación VENTO           |
| `COORDINACION_DE_OPERACIONES` o autoridad aplicable | aceptar decisiones excepcionales de alto impacto o riesgo cuando corresponda                                | no sustituye causa ni eficacia                                          |
| propietario de cambio                               | ejecutar la acción de cambio bajo `TI-DOM-009`                                                              | no reescribe el problema ni su evidencia histórica                      |

El problema pertenece a VISO como expediente tecnológico coordinador, pero sus elementos afectados conservan las fuentes autoritativas de sus dominios.

---

#### 6. Disparadores canónicos de problema

Se conservan exactamente los seis disparadores aprobados por `TI-DOM-007`:

| ID                    | Disparador                                                                        | Resultado                                                                   |
| --------------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| `TI-PROB-TRIGGER-001` | existe recurrencia material                                                       | crear o relacionar candidato de problema                                    |
| `TI-PROB-TRIGGER-002` | varios incidentes comparten síntoma o dependencia                                 | iniciar correlación causal                                                  |
| `TI-PROB-TRIGGER-003` | la causa permanece desconocida después de restaurar                               | aceptar investigación separada del incidente                                |
| `TI-PROB-TRIGGER-004` | un workaround temporal se vuelve recurrente                                       | revisar causalidad, riesgo y necesidad de prevención                        |
| `TI-PROB-TRIGGER-005` | un incidente causado o potencialmente causado por cambio requiere análisis causal | correlacionar cambio y evidencia sin declarar culpa por proximidad temporal |
| `TI-PROB-TRIGGER-006` | se incumple el guardrail de recurrencia                                           | exigir revisión de patrón y propietario                                     |

Reglas:

1. un incidente no se convierte en problema por duración;
2. un P1 no crea automáticamente un problema si la causa está clara y no existe necesidad de investigación posterior;
3. un incidente cerrado puede originar o permanecer relacionado con un problema abierto;
4. una reapertura repetida es evidencia de recurrencia, no causa;
5. un proveedor puede proponer un problema, pero VENTO conserva la identidad del expediente;
6. la detección futura por `TI-DOM-010` podrá proponer candidatos cuando exista patrón técnico suficiente; el monitor no los confirma automáticamente.

---

#### 7. Identidad de problema

`TI-PROBLEM-MANAGEMENT-CONTRACT-001` conserva:

```text
problem_id
problem_revision
problem_status
title
problem_statement
detection_source
accepted_at
owner_ref
affected_service_refs[]
affected_element_refs[]
incident_links[]
first_observed_at
last_observed_at
recurrence_state
recurrence_signature_ref
analysis_scope
hypothesis_refs[]
causal_factor_refs[]
root_cause_ref
known_error_ref
workaround_refs[]
change_refs[]
preventive_action_refs[]
effectiveness_status
residual_risk_ref
evidence_refs[]
review_due_at
closed_at
closure_code
reopened_from_problem_ref
```

Reglas:

- `problem_id` es estable durante el expediente;
- una nueva revisión no borra la anterior;
- un incidente conserva su `tech_case_id`;
- el problema referencia incidentes; no los absorbe;
- un cambio conserva su identidad propia;
- un error conocido referencia exactamente un problema fuente vigente;
- un workaround puede ser reutilizado por varios incidentes solo bajo alcance compatible;
- un problema puede afectar varios servicios y elementos;
- la relación no modifica la fuente autoritativa del elemento;
- las evidencias sensibles se referencian y minimizan.

---

#### 8. Relación incidente ↔ problema

Se aprueban cuatro tipos de vínculo:

| Tipo                       | Uso                                                                                 |
| -------------------------- | ----------------------------------------------------------------------------------- |
| `PRIMARY_CAUSAL_CANDIDATE` | el problema es la explicación principal actualmente investigada para el incidente   |
| `CONTRIBUTING_RELATION`    | el problema representa un factor material, pero no necesariamente la causa completa |
| `RECURRENCE_INSTANCE`      | el incidente es una nueva ocurrencia del patrón del problema                        |
| `POST_INCIDENT_FINDING`    | el problema nació de una revisión posterior y conserva el incidente origen          |

Reglas:

1. un incidente puede tener cero o más relaciones de problema;
2. un problema reactivo debe relacionar al menos un incidente;
3. una relación `PRIMARY_CAUSAL_CANDIDATE` no confirma causa;
4. cuando la evidencia cambia, la relación se versiona;
5. el incidente no reabre automáticamente porque el problema siga abierto;
6. cerrar el problema no modifica retroactivamente el cierre del incidente;
7. una correlación errónea se corrige mediante revisión auditada, no borrando el vínculo.

---

#### 9. Estados del problema

`TI-PROBLEM-LIFECYCLE-MATRIX-001` define siete estados documentales.

| Estado                   | Significado                                                   | Entrada mínima                                                             | Salida normal                                               |
| ------------------------ | ------------------------------------------------------------- | -------------------------------------------------------------------------- | ----------------------------------------------------------- |
| `IDENTIFIED`             | candidato aceptado como problema investigable                 | disparador, servicio o componente, propietario y evidencia inicial         | `ANALYSIS_IN_PROGRESS`                                      |
| `ANALYSIS_IN_PROGRESS`   | hipótesis y evidencia en evaluación                           | alcance y plan de análisis                                                 | `CAUSE_CONFIRMED` o cierre excepcional justificado          |
| `CAUSE_CONFIRMED`        | existe causa o conjunto causal confirmado para el alcance     | evidencia suficiente y revisión técnica                                    | `PREVENTION_PLANNED`                                        |
| `PREVENTION_PLANNED`     | existen acciones preventivas con propietarios y criterios     | causa, riesgo y acciones asignadas                                         | `PREVENTION_IN_PROGRESS`                                    |
| `PREVENTION_IN_PROGRESS` | acciones propietarias en ejecución                            | referencias a cambios, proveedor, monitoreo, conocimiento u otras acciones | `EFFECTIVENESS_REVIEW`                                      |
| `EFFECTIVENESS_REVIEW`   | se observa el resultado después de las acciones               | criterios, ventana de observación y evidencia                              | `CLOSED` o retorno a `PREVENTION_PLANNED`                   |
| `CLOSED`                 | expediente cerrado con resultado y riesgo residual explícitos | criterio de cierre satisfecho                                              | terminal; una nueva investigación crea expediente vinculado |

El estado de problema no reemplaza estados de incidente, cambio, activo, aplicación, proveedor o continuidad.

---

#### 10. Transiciones del problema

Se aprueban nueve transiciones:

| ID               | Origen                   | Destino                  | Guarda                                                           |
| ---------------- | ------------------------ | ------------------------ | ---------------------------------------------------------------- |
| `TI-PROB-TR-001` | `IDENTIFIED`             | `ANALYSIS_IN_PROGRESS`   | alcance, owner y evidencia inicial suficientes                   |
| `TI-PROB-TR-002` | `ANALYSIS_IN_PROGRESS`   | `CAUSE_CONFIRMED`        | causa confirmada según contrato de evidencia                     |
| `TI-PROB-TR-003` | `CAUSE_CONFIRMED`        | `PREVENTION_PLANNED`     | acciones y propietarios definidos                                |
| `TI-PROB-TR-004` | `PREVENTION_PLANNED`     | `PREVENTION_IN_PROGRESS` | al menos una acción exigible aceptada por su propietario         |
| `TI-PROB-TR-005` | `PREVENTION_IN_PROGRESS` | `EFFECTIVENESS_REVIEW`   | acciones aplicables completadas o condición controlada alcanzada |
| `TI-PROB-TR-006` | `EFFECTIVENESS_REVIEW`   | `CLOSED`                 | eficacia suficiente o cierre excepcional autorizado              |
| `TI-PROB-TR-007` | `EFFECTIVENESS_REVIEW`   | `PREVENTION_PLANNED`     | recurrencia, efecto adverso o evidencia insuficiente             |
| `TI-PROB-TR-008` | `ANALYSIS_IN_PROGRESS`   | `CLOSED`                 | únicamente duplicidad o invalidación demostrada                  |
| `TI-PROB-TR-009` | `IDENTIFIED`             | `CLOSED`                 | únicamente duplicidad inequívoca con problema canónico existente |

No existe transición `CLOSED → ANALYSIS_IN_PROGRESS`. Una investigación posterior conserva el cierre anterior y utiliza `reopened_from_problem_ref`.

---

#### 11. Declaración del problema

El problema se formula con estructura:

```text
CONDICIÓN OBSERVADA
+
SERVICIO / ELEMENTO / ALCANCE
+
>PATRÓN O RECURRENCIA
+
>IMPACTO O RIESGO
+
>LO QUE TODAVÍA NO SE SABE
```

La redacción no debe:

- declarar una causa antes de probarla;
- culpar a una persona;
- confundir error de usuario con causa sistémica;
- convertir una tecnología específica en culpable por coincidencia temporal;
- esconder una incertidumbre detrás de términos genéricos;
- usar “intermitente” como explicación causal;
- copiar el texto del ticket como causa.

---

#### 12. Hipótesis y evidencia causal

`TI-RCA-EVIDENCE-CONTRACT-001` conserva cada hipótesis como revisión independiente:

```text
hypothesis_id
problem_id
statement
proposed_at
proposed_by
scope
expected_observations[]
contradicting_observations[]
evidence_refs[]
test_or_comparison_ref
evidence_state
reviewed_by
reviewed_at
decision_reason
```

Estados de evidencia:

| Estado       | Significado                                                                                          |
| ------------ | ---------------------------------------------------------------------------------------------------- |
| `HYPOTHESIS` | explicación candidata sin soporte suficiente                                                         |
| `SUPPORTED`  | evidencia compatible relevante, todavía insuficiente para confirmar                                  |
| `CONFIRMED`  | evidencia convergente suficiente y ausencia de contradicción material no resuelta dentro del alcance |
| `REFUTED`    | evidencia incompatible con la explicación en el alcance evaluado                                     |

Una hipótesis refutada permanece histórica.

---

#### 13. Evidencia admisible para análisis causal

Pueden participar, según el caso:

- línea de tiempo de incidentes;
- estado anterior y posterior de configuración;
- cambio correlacionado;
- logs y trazas minimizados;
- health signals;
- métricas;
- versiones;
- fallos reproducibles;
- comparación contra baseline;
- dependencia degradada;
- evidencia física;
- resultado de proveedor;
- resultado de rollback;
- observaciones de usuarios;
- pruebas controladas;
- incidentes similares;
- evidencia de ausencia de recurrencia posterior.

Reglas:

1. proximidad temporal entre cambio e incidente es señal, no prueba;
2. una prueba de rollback compatible fortalece causalidad, pero debe interpretarse dentro de su alcance;
3. una única captura no demuestra patrón;
4. un proveedor puede confirmar un defecto propio, pero VENTO conserva alcance e impacto interno;
5. una métrica agregada puede mostrar asociación sin identificar causalidad;
6. logs sensibles se referencian sin copiar secretos;
7. el análisis debe registrar evidencia contradictoria;
8. la imposibilidad de reproducir no convierte la hipótesis en falsa ni confirmada;
9. la ausencia de datos se registra como limitación;
10. un análisis no obtiene acceso privilegiado por necesidad declarada; la autorización se resuelve por su autoridad propietaria.

---

#### 14. Métodos de análisis

No se impone una única técnica. El análisis puede combinar:

| Método                       | Uso adecuado                                                                         |
| ---------------------------- | ------------------------------------------------------------------------------------ |
| `TIMELINE_ANALYSIS`          | ordenar hechos, cambios, síntomas y recuperación                                     |
| `CHANGE_CORRELATION`         | comparar comportamiento antes/después de cambios relevantes                          |
| `BASELINE_COMPARISON`        | identificar drift de configuración, versión o dependencia                            |
| `DEPENDENCY_TRACE`           | recorrer relaciones de servicio y componentes                                        |
| `REPRODUCTION_TEST`          | reproducir condición bajo entorno controlado cuando sea seguro                       |
| `CAUSAL_QUESTIONING`         | profundizar desde síntoma hacia controles y condiciones sin reducirse a culpa humana |
| `FAULT_TREE_OR_CAUSAL_GRAPH` | analizar múltiples factores y condiciones necesarias                                 |
| `VENDOR_EVIDENCE_REVIEW`     | reconciliar defectos, advisories o diagnósticos externos                             |

Cada problema declara qué método se utilizó y qué limitaciones tuvo.

---

#### 15. Confirmación de causa raíz

Una causa puede declararse `CONFIRMED` cuando:

1. explica el síntoma o patrón dentro del alcance;
2. es compatible con la línea de tiempo;
3. la evidencia distingue causa de mera correlación;
4. las observaciones relevantes no dejan una contradicción material sin tratar;
5. las dependencias y cambios relacionados fueron considerados;
6. existe evidencia reproducible o convergente suficiente para el riesgo del problema;
7. se documentan factores contribuyentes por separado;
8. el alcance exacto está declarado;
9. existe revisión por un actor autorizado distinto del autor cuando la criticidad o sensibilidad lo exija;
10. la afirmación puede actualizarse mediante nueva revisión si aparece mejor evidencia.

No se exige una única causa. Un problema puede tener varias condiciones necesarias o contribuyentes.

---

#### 16. Clases causales iniciales

Se aprueban nueve clases de clasificación. La clase organiza análisis; no sustituye el enunciado causal.

| Código                      | Clase                                                                 |
| --------------------------- | --------------------------------------------------------------------- |
| `CAUSE_CONFIGURATION`       | configuración, drift o parámetro incorrecto                           |
| `CAUSE_SOFTWARE`            | defecto o incompatibilidad de software                                |
| `CAUSE_HARDWARE`            | falla o degradación física                                            |
| `CAUSE_NETWORK`             | red, conectividad, direccionamiento o dependencia de transporte       |
| `CAUSE_EXTERNAL_DEPENDENCY` | proveedor o servicio externo                                          |
| `CAUSE_CAPACITY`            | saturación, límite o capacidad insuficiente                           |
| `CAUSE_IDENTITY_SECURITY`   | identidad, sesión, autorización, credencial o control de seguridad    |
| `CAUSE_DATA_STATE`          | estado, integridad, sincronización, migración o dato incompatible     |
| `CAUSE_PROCESS_CONTROL`     | procedimiento, handoff, control o condición organizativa insuficiente |

Reglas:

- `CAUSE_PROCESS_CONTROL` no se etiqueta automáticamente como “error humano”;
- un acto humano puede ser evento contribuyente sin ser causa raíz;
- `UNKNOWN` no es una clase causal confirmada;
- varias clases pueden coexistir;
- la clasificación no determina por sí sola la acción preventiva.

---

#### 17. Error conocido

`TI-KNOWN-ERROR-CONTRACT-001` materializa un objeto consumible solo cuando:

```text
PROBLEMA
+
CAUSA O CONDICIÓN SUFICIENTEMENTE IDENTIFICADA
+
WORKAROUND VALIDADO
=
ERROR CONOCIDO PUBLICABLE
```

Campos mínimos:

```text
known_error_id
problem_id
known_error_revision
title
affected_service_refs[]
affected_element_or_version_scope[]
symptom_signature
confirmed_cause_ref
workaround_ref
prerequisites
contraindications
risk
authorization_requirements
valid_from
review_at
supersedes_ref
state
evidence_refs[]
```

Un error conocido no equivale a una solución definitiva.

---

#### 18. Estados del error conocido

Se aprueban cuatro estados:

| Estado       | Uso                                                                                                              |
| ------------ | ---------------------------------------------------------------------------------------------------------------- |
| `DRAFT`      | causa y workaround se están estructurando; no es consumible como guía operativa                                  |
| `ACTIVE`     | causa/condición y workaround están suficientemente validados para uso dentro del alcance                         |
| `SUPERSEDED` | una revisión posterior reemplazó la guía anterior sin borrar historia                                            |
| `RETIRED`    | ya no debe aplicarse por corrección definitiva, cambio de versión, riesgo, obsolescencia o retiro del componente |

Reglas:

1. `DRAFT` no aparece como solución recomendada al operador;
2. `ACTIVE` requiere un workaround con estado compatible;
3. un error conocido se limita a versiones, servicios, sitios o componentes demostrados;
4. una nueva versión no edita silenciosamente la anterior;
5. el retiro no borra su relación con incidentes históricos;
6. un error conocido puede continuar activo mientras el problema espera prevención;
7. un error conocido no autoriza un cambio.

---

#### 19. Workaround gobernado

`TI-WORKAROUND-GOVERNANCE-MATRIX-001` define que todo workaround reutilizable conserve:

```text
workaround_id
problem_id
known_error_ref
revision
purpose
applicable_scope
preconditions
steps_or_action_ref
expected_result
safety_limits
authorization_requirements
data_or_state_risk
rollback_or_exit
validation_method
valid_from
review_at
expires_at_when_required
owner
state
evidence_refs[]
```

No se utiliza un ticket antiguo como guía operativa sin convertir la acción en una revisión gobernada.

---

#### 20. Estados de workaround

Se aprueban cinco estados:

| Estado      | Significado                                                                         |
| ----------- | ----------------------------------------------------------------------------------- |
| `DRAFT`     | propuesta todavía no validada para reutilización                                    |
| `VALIDATED` | comprobada dentro de un alcance, todavía no publicada o habilitada operacionalmente |
| `ACTIVE`    | puede aplicarse en el alcance declarado y bajo sus guardas                          |
| `SUSPENDED` | uso detenido por riesgo, cambio de contexto, contradicción o falla                  |
| `RETIRED`   | no debe volver a utilizarse como acción vigente                                     |

Reglas:

1. un workaround aplicado una vez no se vuelve `ACTIVE` automáticamente;
2. `ACTIVE` no concede acceso o privilegio;
3. la acción debe declarar cuándo no aplicarla;
4. un workaround que modifica configuración material puede requerir un cambio;
5. un workaround que opera en modo degradado conserva reconciliación posterior;
6. un workaround no se extiende a otra versión, sede o servicio por similitud;
7. si deja de ser seguro, se suspende aunque todavía reduzca impacto;
8. la repetición de un workaround aumenta la evidencia de recurrencia y deuda, no su legitimidad permanente.

---

#### 21. Uso del workaround desde el incidente

El incidente de `VPROC-0058` puede referenciar un workaround activo.

La aplicación registra:

- caso;
- workaround y revisión;
- actor;
- momento;
- precondiciones comprobadas;
- autorización cuando aplique;
- resultado;
- efecto sobre impacto o urgencia;
- evidencia;
- necesidad de seguimiento.

```text
WORKAROUND_APPLIED
≠
PROBLEM_CLOSED
```

Una aplicación fallida del workaround no se oculta; alimenta el problema y puede suspender la guía.

---

#### 22. Detección de recurrencia

`TI-RECURRENCE-DETECTION-MATRIX-001` define ocho señales:

| ID               | Señal                                                                         | Uso                                                  |
| ---------------- | ----------------------------------------------------------------------------- | ---------------------------------------------------- |
| `REC-SIGNAL-001` | mismo servicio y firma de síntoma compatible                                  | candidato de patrón                                  |
| `REC-SIGNAL-002` | mismo componente o dependencia afectada                                       | correlación técnica                                  |
| `REC-SIGNAL-003` | mismo código o firma de error verificable                                     | correlación fuerte cuando el código es estable       |
| `REC-SIGNAL-004` | mismo cambio o familia de versión relacionada                                 | evaluar regresión o incompatibilidad                 |
| `REC-SIGNAL-005` | reutilización del mismo workaround                                            | detectar deuda temporal recurrente                   |
| `REC-SIGNAL-006` | reapertura o validación negativa repetida                                     | revisar si el cierre/restauración fue insuficiente   |
| `REC-SIGNAL-007` | mismo proveedor o dependencia externa con patrón compatible                   | correlación externa                                  |
| `REC-SIGNAL-008` | mismo patrón temporal, carga, sede o contexto técnico con evidencia adicional | soporte contextual; no prueba causalidad por sí solo |

No se fija un número universal de incidentes ni una ventana temporal arbitraria. La materialidad depende de criticidad, alcance, riesgo y evidencia.

---

#### 23. Niveles de recurrencia

Se aprueban tres niveles:

| Estado                  | Criterio                                                                                         |
| ----------------------- | ------------------------------------------------------------------------------------------------ |
| `RECURRENCE_SIGNAL`     | existe similitud suficiente para revisar correlación                                             |
| `RECURRENCE_CORRELATED` | múltiples señales y evidencia permiten relacionar casos bajo un mismo patrón operativo           |
| `RECURRENCE_CONFIRMED`  | existe una causa/condición compartida confirmada o un error conocido que explica las ocurrencias |

Reglas:

- una coincidencia de texto no confirma recurrencia;
- un mismo usuario no convierte casos en recurrentes;
- una misma aplicación no basta;
- un patrón puede quedar correlacionado antes de conocer la causa;
- la confirmación de recurrencia puede retroalimentar la prioridad de investigación, pero no reescribe la prioridad histórica de incidentes cerrados.

---

#### 24. Firma de recurrencia

La firma puede incluir, según aplicabilidad:

```text
service_ref
element_class
element_ref_or_family
symptom_signature
error_signature
version_or_baseline
dependency_ref
change_ref
provider_ref
workaround_ref
site_or_context
operational_window
```

La firma:

- no almacena secretos;
- no usa datos personales como llave causal cuando no son necesarios;
- puede versionarse;
- no reemplaza la evidencia;
- se utiliza para correlación, no para cerrar automáticamente casos.

---

#### 25. Prevención de recurrencia

`TI-PREVENTION-EFFECTIVENESS-CONTRACT-001` define ocho clases de acción:

| Clase                              | Autoridad principal                                        |
| ---------------------------------- | ---------------------------------------------------------- |
| `PREV_CONFIGURATION_CHANGE`        | `TI-DOM-009`                                               |
| `PREV_SOFTWARE_OR_FIRMWARE_CHANGE` | `TI-DOM-009` + propietario técnico                         |
| `PREV_HARDWARE_ACTION`             | NEXO + `TI-DOM-009` cuando exista cambio tecnológico       |
| `PREV_PROVIDER_ACTION`             | proveedor + `TI-DOM-012`; cambio técnico bajo `TI-DOM-009` |
| `PREV_MONITORING_CONTROL`          | `TI-DOM-010`                                               |
| `PREV_RECOVERY_CONTROL`            | `TI-DOM-011` cuando aplique                                |
| `PREV_KNOWLEDGE_OR_TRAINING`       | `TI-DOM-013` + propietario funcional                       |
| `PREV_PROCESS_OR_POLICY_CONTROL`   | propietario del proceso o política correspondiente         |

El problema conserva la obligación y su resultado, pero no ejecuta acciones fuera de su autoridad.

---

#### 26. Contrato de acción preventiva

Cada acción conserva:

```text
preventive_action_id
problem_id
action_class
action_statement
owner_ref
authority_ref
target_ref
risk
success_criteria
required_evidence
change_ref
planned_at
due_at
completed_at
result
effectiveness_measure_ref
status
```

Estados conceptuales:

```text
PLANNED
ACCEPTED
IN_PROGRESS
COMPLETED_PENDING_EFFECTIVENESS
FAILED
CANCELLED_WITH_REASON
```

Una acción transferida no desaparece del problema; permanece correlacionada hasta conocer su resultado.

---

#### 27. Frontera con cambio tecnológico

El problema puede recomendar o exigir una acción que necesita cambio.

Regla:

```text
CAUSA CONFIRMADA
→ PUEDE PRODUCIR
CHANGE_REQUIRED

CHANGE_REQUIRED
≠
CHANGE_APPROVED
≠
CHANGE_IMPLEMENTED
≠
CHANGE_EFFECTIVE
```

`TI-DOM-009` conserva:

- evaluación de riesgo;
- aprobación;
- ventana;
- plan de prueba;
- despliegue;
- rollback;
- revisión posterior.

El problema consume el resultado del cambio y evalúa recurrencia después.

---

#### 28. Frontera con observabilidad

`TI-DOM-010` conserva:

- telemetría;
- eventos;
- health;
- logs;
- alertas;
- SLI;
- umbrales;
- dashboards;
- retención técnica.

`TI-DOM-008` utiliza esas señales como evidencia y define qué pregunta causal debe responder.

Una alerta no crea automáticamente causa ni problema confirmado.

La acción preventiva puede solicitar una señal nueva cuando la falta de observabilidad impida demostrar recurrencia o eficacia.

---

#### 29. Frontera con conocimiento y capacitación

`TI-DOM-013` conserva la base de conocimiento y adopción.

`TI-DOM-008` entrega como entradas:

- error conocido activo;
- workaround activo;
- alcance;
- precondiciones;
- riesgos;
- revisión;
- restricciones;
- causa confirmada publicable;
- indicadores de obsolescencia.

La base de conocimiento no recibe:

- secretos;
- datos personales innecesarios;
- hipótesis sin revisar presentadas como hechos;
- topología sensible completa;
- evidencia bruta que deba permanecer restringida.

---

#### 30. Proveedor y fabricante

Un proveedor puede aportar:

- identificación de defecto;
- advisory;
- workaround;
- parche;
- RMA;
- evidencia de plataforma;
- caso externo;
- fecha estimada;
- limitación conocida.

Reglas:

1. el caso externo se referencia y no reemplaza `problem_id`;
2. el proveedor no cierra el problema VENTO;
3. “known issue” del proveedor no se convierte automáticamente en error conocido interno;
4. se valida que versión, producto y condición correspondan al alcance VENTO;
5. la espera del proveedor no elimina propietario interno;
6. una corrección del proveedor sigue requiriendo cambio/prueba cuando modifica el entorno;
7. una promesa de fecha no se registra como corrección ejecutada;
8. la salida o sustitución de proveedor se gobierna por sus tareas propietarias.

---

#### 31. Revisión posterior de incidente

Una revisión posterior de incidente crítico debe evaluar al menos:

1. línea de tiempo;
2. alcance e impacto;
3. señales de detección;
4. diagnóstico;
5. decisiones;
6. workaround;
7. cambios relacionados;
8. restauración;
9. validación;
10. hipótesis causal;
11. recurrencia previa;
12. acciones preventivas;
13. brechas de comunicación;
14. brechas de observabilidad;
15. necesidad de problema.

La revisión posterior no es sinónimo de problema. Puede:

- cerrar sin problema cuando no existe investigación pendiente;
- crear `POST_INCIDENT_FINDING`;
- enriquecer un problema existente;
- descubrir una acción de cambio, observabilidad, recuperación o conocimiento.

---

#### 32. Estados de eficacia

Se aprueban cinco estados:

| Estado         | Significado                                                                                   |
| -------------- | --------------------------------------------------------------------------------------------- |
| `NOT_READY`    | la acción todavía no está completa o no existe criterio de medición                           |
| `OBSERVING`    | acción completada y evidencia en ventana de observación                                       |
| `EFFECTIVE`    | el criterio preventivo fue satisfecho con evidencia suficiente                                |
| `INEFFECTIVE`  | la recurrencia, degradación o resultado demuestra que la acción no produjo el efecto esperado |
| `INCONCLUSIVE` | la evidencia disponible no permite concluir y requiere nueva decisión                         |

No se fija una ventana universal. Cada problema declara una ventana coherente con frecuencia, criticidad, estacionalidad y posibilidad real de observación.

---

#### 33. Verificación de eficacia

La eficacia puede considerar:

- ausencia de recurrencia dentro de la ventana declarada;
- reducción demostrable de recurrencia;
- eliminación de la condición causal;
- prueba controlada posterior;
- comparación antes/después;
- ausencia de efectos adversos;
- health estable;
- cumplimiento de guardrails;
- validación de procesos dependientes.

Reglas:

1. “no volvió a ocurrir todavía” no basta sin una ventana razonable;
2. una métrica debe declarar denominador y contexto;
3. un resultado local no prueba eficacia en todas las sedes;
4. un cambio exitoso técnicamente no prueba prevención empresarial;
5. una acción puede quedar `INCONCLUSIVE` sin falsificar cierre;
6. una recurrencia durante observación devuelve el problema a planificación preventiva.

---

#### 34. Cierre del problema

El cierre normal exige:

- alcance y relaciones actualizados;
- causa confirmada cuando el cierre sea por prevención efectiva;
- acciones preventivas completadas o reconciliadas;
- eficacia `EFFECTIVE`;
- error conocido y workaround reconciliados;
- riesgo residual explícito;
- conocimiento transferido cuando corresponda;
- incidentes vinculados conservados;
- cambios vinculados conservados;
- evidencia y decisión de cierre;
- actor y timestamp.

Códigos de cierre:

| Código                              | Uso                                                                                                      |
| ----------------------------------- | -------------------------------------------------------------------------------------------------------- |
| `PREVENTION_EFFECTIVE`              | causa tratada y eficacia demostrada                                                                      |
| `DUPLICATE_MERGED`                  | el expediente era duplicado y queda vinculado al problema canónico                                       |
| `INVALIDATED_BY_EVIDENCE`           | nueva evidencia demuestra que el problema planteado no existe en el alcance                              |
| `RISK_ACCEPTED_BY_AUTHORIZED_OWNER` | la causa/riesgo permanece, pero la autoridad correspondiente acepta explícitamente el riesgo y controles |

`RISK_ACCEPTED_BY_AUTHORIZED_OWNER` no puede ser decidido unilateralmente por el técnico.

---

#### 35. Error conocido y workaround al cierre

Al cerrar:

- un error conocido puede pasar a `RETIRED` si la causa quedó eliminada para todo su alcance;
- puede pasar a `SUPERSEDED` si existe una revisión nueva;
- puede permanecer `ACTIVE` únicamente cuando el cierre utiliza aceptación de riesgo y el control sigue siendo necesario;
- un workaround se retira cuando ya no debe aplicarse;
- un workaround no se conserva activo solo por costumbre;
- incidentes históricos conservan referencia a la revisión utilizada.

---

#### 36. Nueva investigación después del cierre

Un problema cerrado no se reabre destructivamente.

Ante recurrencia posterior:

```text
PROBLEMA CERRADO
+
NUEVA EVIDENCIA MATERIAL
→
NUEVO PROBLEMA O NUEVA INVESTIGACIÓN VINCULADA
→
reopened_from_problem_ref
```

La nueva investigación:

- conserva la causa anterior como evidencia histórica;
- puede confirmarla, refutarla o descubrir otra;
- no altera métricas históricas;
- no borra la eficacia declarada en la ventana anterior;
- recalcula el alcance con el contexto actual.

---

#### 37. Métricas de problema y recurrencia

Se materializan diez indicadores:

| ID                   | Indicador                                             | Definición                                                      |
| -------------------- | ----------------------------------------------------- | --------------------------------------------------------------- |
| `TI-PROBLEM-SLI-001` | incidentes con problema relacionado                   | proporción y volumen por servicio y causa                       |
| `TI-PROBLEM-SLI-002` | recurrencia sin problema relacionado                  | guardrail de casos recurrentes sin investigación aceptada       |
| `TI-PROBLEM-SLI-003` | tiempo hasta aceptación del problema                  | desde el disparador material hasta `IDENTIFIED`                 |
| `TI-PROBLEM-SLI-004` | problemas con causa confirmada                        | problemas que alcanzan `CAUSE_CONFIRMED` / problemas analizados |
| `TI-PROBLEM-SLI-005` | antigüedad de error conocido activo                   | tiempo desde publicación y última revisión                      |
| `TI-PROBLEM-SLI-006` | uso de workaround                                     | aplicaciones por workaround, servicio y alcance                 |
| `TI-PROBLEM-SLI-007` | recurrencia después de prevención                     | nuevas ocurrencias compatibles después de acción preventiva     |
| `TI-PROBLEM-SLI-008` | eficacia preventiva                                   | acciones `EFFECTIVE` / acciones evaluadas                       |
| `TI-PROBLEM-SLI-009` | problemas reabiertos mediante investigación vinculada | recurrencia material posterior a cierre                         |
| `TI-PROBLEM-SLI-010` | problemas cerrados por aceptación de riesgo           | volumen y criticidad con autoridad y control explícitos         |

Dimensiones mínimas:

```text
service
element_class
application
site
cause_class
known_error
workaround
provider
change_related
problem_status
```

Las métricas no se usan para atribuir culpa individual.

---

#### 38. Estado AS-IS verificable

La implementación actual de soporte conserva una base simple de tickets y mensajes.

La migración vigente de fundación define para `support_tickets`:

```text
id
created_by
site_id
category
title
description
status
assigned_to
resolved_at
created_at
updated_at
```

Una migración posterior agrega:

```text
target_employee_id
```

El enum actual de estado continúa:

```text
open
in_progress
resolved
closed
```

En las fuentes técnicas revisadas no se encontró un modelo dedicado de `problem_id` ni un campo `root_cause` en la fundación de soporte. La búsqueda actual de `workaround` devuelve principalmente contratos documentales, no una persistencia de gestión de problemas. Las apariciones de términos semejantes fuera del dominio de soporte no se reinterpretan como modelo ITSM.

Estado:

```text
INCIDENTE / TICKET AS-IS = IMPLEMENTADO PARCIAL
PROBLEMA CANÓNICO = NO MATERIALIZADO FÍSICAMENTE EN LAS FUENTES REVISADAS
ERROR CONOCIDO CANÓNICO = NO MATERIALIZADO FÍSICAMENTE EN LAS FUENTES REVISADAS
WORKAROUND REUTILIZABLE GOBERNADO = NO MATERIALIZADO FÍSICAMENTE EN LAS FUENTES REVISADAS
MODELO TI-DOM-008 = ESPECIFICADO
```

La ausencia de persistencia no autoriza cambios de esquema durante esta fase.

---

#### 39. Reconciliación con `support_tickets`

`support_tickets` no se reutiliza como problema genérico mediante cambio de `category`.

Reglas de transición futura:

1. ticket e incidente conservan su identidad;
2. problema requiere identidad propia;
3. relaciones incidente–problema son explícitas;
4. `resolved_at` no se convierte en `root_cause_confirmed_at`;
5. mensajes no se convierten en evidencia causal estructurada por defecto;
6. una descripción libre no se convierte en known error;
7. una respuesta de soporte no se convierte en workaround publicado;
8. el backfill futuro debe ser determinista y conservar incertidumbre;
9. registros legacy sin evidencia suficiente permanecen sin problem link;
10. cualquier modelo físico deberá ejecutarse mediante un paquete autorizado y migraciones de `vento-shell`.

---

#### 40. Privacidad, seguridad y evidencia

1. un problema puede contener información técnica más sensible que el ticket visible al solicitante;
2. hipótesis de seguridad no se publican como conocimiento general;
3. secretos no se copian en causas, workarounds ni known errors;
4. logs completos permanecen en su sistema propietario cuando una referencia basta;
5. evidencia de proveedor se minimiza antes de exponerla;
6. direcciones, topología y datos de usuarios se muestran solo cuando la finalidad lo exige;
7. una investigación no habilita soporte remoto;
8. un workaround no contiene credenciales como “paso”;
9. la causa no identifica personas cuando el hecho causal puede expresarse mediante control, proceso o condición verificable;
10. exportaciones de problemas respetan clasificación y alcance.

---

#### 41. Operación degradada y continuidad

Un problema puede estudiarse mientras el incidente ya está restaurado.

Si existe un workaround:

- el incidente conserva su validación y cierre;
- el problema conserva la deuda;
- el error conocido conserva la guía temporal;
- el proceso puede operar degradado solo dentro del contrato aprobado;
- la continuidad empresarial permanece bajo `VPROC-0062`.

Un problema no activa continuidad por existir. La continuidad depende del impacto empresarial actual y de la capacidad de producir el resultado mínimo.

---

#### 42. Handoffs exactos

| Resultado de TI-DOM-008                     | Propietario receptor                  | Condición de salida                                   |
| ------------------------------------------- | ------------------------------------- | ----------------------------------------------------- |
| cambio requerido                            | `TI-DOM-009`                          | cambio aceptado con alcance, prueba y rollback        |
| señal o control de observabilidad requerido | `TI-DOM-010`                          | señal implementada y evidencia utilizable             |
| control de recuperación                     | `TI-DOM-011`                          | restauración/recuperación probada cuando aplique      |
| proveedor, garantía o contrato              | `TI-DOM-012`                          | obligación contractual y soporte reconciliados        |
| error conocido, guía o entrenamiento        | `TI-DOM-013`                          | conocimiento publicado con versión y alcance          |
| acceso privilegiado requerido               | `TI-AUTH-*`                           | autorización temporal, mínima y auditable             |
| control de proceso                          | propietario funcional aplicable       | acción aceptada con criterio verificable              |
| riesgo de continuidad                       | `VPROC-0062` y dominio de continuidad | expediente de continuidad separado cuando corresponda |

El handoff no transfiere ni elimina el `problem_id`.

---

#### 43. Hallazgos y propietarios

| ID                 | Hallazgo                                                                             | Estado                   | Propietario                                  | Condición de salida                                              |
| ------------------ | ------------------------------------------------------------------------------------ | ------------------------ | -------------------------------------------- | ---------------------------------------------------------------- |
| `H-TI-DOM-008-001` | el modelo actual de soporte no materializa una identidad de problema                 | `ESPECIFICADO`           | paquete E5 VISO / modelo E3                  | persistencia y contratos implementados con relaciones explícitas |
| `H-TI-DOM-008-002` | `resolved` legacy puede confundirse con causa eliminada                              | `RESUELTO_POR_CONTRATO`  | `TI-DOM-007`; `TI-DOM-008`                   | implementación separa restauración, causa y cierre               |
| `H-TI-DOM-008-003` | no existe campo estructurado de causa raíz en la fundación actual de soporte         | `ESPECIFICADO`           | paquete E5 VISO                              | modelo físico conserva hipótesis, evidencia y causa confirmada   |
| `H-TI-DOM-008-004` | no existe error conocido gobernado demostrado en el soporte actual                   | `ESPECIFICADO`           | paquete E5 VISO + `TI-DOM-013`               | known error versionado, autorizado y consumible                  |
| `H-TI-DOM-008-005` | workarounds pueden permanecer como mensajes o memoria personal                       | `ESPECIFICADO`           | paquete E5 VISO + `TI-DOM-013`               | workaround versionado con alcance, guardas y revisión            |
| `H-TI-DOM-008-006` | la recurrencia no está materializada como relación estructurada en `support_tickets` | `ESPECIFICADO`           | paquete E5 VISO + `TI-DOM-010`               | correlación y señales instrumentadas sin heurística silenciosa   |
| `H-TI-DOM-008-007` | la proximidad entre cambio e incidente puede confundirse con causalidad              | `RESUELTO_POR_CONTRATO`  | `TI-RCA-EVIDENCE-CONTRACT-001`; `TI-DOM-009` | análisis conserva evidencia antes/después y resultado            |
| `H-TI-DOM-008-008` | no existe evidencia histórica de eficacia preventiva bajo este contrato              | `PENDIENTE_DE_EVIDENCIA` | `TI-DOM-010` + paquete E5 VISO               | SLI y ventanas de observación producen evidencia reproducible    |
| `H-TI-DOM-008-009` | una corrección de proveedor puede quedar como promesa sin verificación VENTO         | `RESUELTO_POR_CONTRATO`  | propietario técnico + `TI-DOM-009`           | corrección aplicada bajo autoridad y eficacia evaluada           |
| `H-TI-DOM-008-010` | conocimiento técnico puede quedar desconectado de su problema y revisión             | `ESPECIFICADO`           | `TI-DOM-013`                                 | guía o known error conserva origen, revisión y retiro            |

No queda un hallazgo narrativo sin propietario ni condición de salida.

---

#### 44. Estado de materialización

| Componente                            | Estado                                |
| ------------------------------------- | ------------------------------------- |
| contrato de problema                  | `ESPECIFICADO`                        |
| lifecycle de problema                 | `ESPECIFICADO`                        |
| relación incidente–problema           | `ESPECIFICADO`                        |
| hipótesis y evidencia causal          | `ESPECIFICADO`                        |
| confirmación de causa raíz            | `ESPECIFICADO`                        |
| error conocido                        | `ESPECIFICADO`                        |
| workaround gobernado                  | `ESPECIFICADO`                        |
| recurrencia                           | `ESPECIFICADO`                        |
| acciones preventivas                  | `ESPECIFICADO`                        |
| eficacia                              | `ESPECIFICADO`                        |
| modelo físico VISO                    | `FUERA_DE_ALCANCE`                    |
| migración de soporte                  | `FUERA_DE_ALCANCE`                    |
| observabilidad runtime de recurrencia | `FUERA_DE_ALCANCE` hacia `TI-DOM-010` |
| ejecución de cambios preventivos      | `FUERA_DE_ALCANCE` hacia `TI-DOM-009` |
| evidencia histórica de eficacia       | `PENDIENTE_DE_EVIDENCIA`              |
| cambios Supabase                      | `NO_APLICA`                           |

---

#### 45. Invariantes

1. incidente y problema son objetos distintos.
2. un incidente puede cerrar con problema abierto.
3. un problema no cambia la prioridad histórica del incidente.
4. duración no convierte incidente en problema.
5. síntoma no es causa.
6. correlación no es causalidad.
7. cambio reciente no es causa confirmada por sí solo.
8. hipótesis no es causa raíz.
9. hipótesis refutada no se borra.
10. causa puede ser multifactorial.
11. no se usa “error humano” como cierre automático del análisis.
12. error conocido requiere causa o condición suficientemente identificada.
13. error conocido requiere workaround gobernado.
14. error conocido no es corrección definitiva.
15. workaround no es causa eliminada.
16. workaround no concede permisos.
17. workaround reutilizable exige alcance y versión.
18. workaround inseguro se suspende.
19. repetición del workaround es señal de deuda.
20. recurrencia por texto parecido no se confirma automáticamente.
21. no existe umbral universal de cantidad para declarar problema.
22. un proveedor no se convierte en autoridad del problema VENTO.
23. caso de proveedor no reemplaza `problem_id`.
24. acción preventiva no equivale a cambio aprobado.
25. cambio ejecutado no equivale a eficacia.
26. eficacia requiere evidencia posterior.
27. una ventana de observación no se inventa universalmente.
28. una acción fallida devuelve el problema a planificación.
29. un problema cerrado no se reabre reescribiendo historia.
30. una nueva investigación referencia el problema anterior.
31. aceptar riesgo requiere autoridad aplicable.
32. el técnico no acepta unilateralmente riesgo residual.
33. un known error retirado conserva historia.
34. el cierre del problema no borra incidentes.
35. el cierre del problema no borra cambios.
36. la base de conocimiento no almacena secretos.
37. un log no se copia completo si una referencia basta.
38. el problema no amplía acceso privilegiado.
39. continuidad permanece separada.
40. esta tarea no modifica código, datos ni Supabase.

---

#### 46. Criterios de aceptación

- [x] se conserva la continuidad `TI-DOM-007 → TI-DOM-008 → TI-DOM-009`;
- [x] la tarea permanece exclusivamente documental;
- [x] `VPROC-0058` permanece como proceso propietario del incidente;
- [x] se define una identidad especializada de problema sin inventar un nuevo `VPROC-*`;
- [x] se conservan los seis disparadores aprobados de problema;
- [x] se definen exactamente siete estados de problema;
- [x] se definen exactamente nueve transiciones;
- [x] se definen cuatro estados de evidencia causal;
- [x] se distinguen síntoma, hipótesis, factor contribuyente y causa raíz;
- [x] se permite causalidad multifactorial;
- [x] se definen ocho métodos de análisis utilizables sin imponer uno universal;
- [x] se definen nueve clases causales;
- [x] se prohíbe convertir correlación temporal en causa;
- [x] se define un error conocido consumible y versionado;
- [x] se definen cuatro estados de error conocido;
- [x] se define un workaround con alcance, guardas, riesgo, revisión y evidencia;
- [x] se definen cinco estados de workaround;
- [x] se materializan ocho señales de recurrencia;
- [x] se definen tres niveles de recurrencia;
- [x] no se inventa un umbral numérico universal;
- [x] se definen ocho clases de acción preventiva;
- [x] los handoffs conservan su autoridad propietaria;
- [x] se definen cinco estados de eficacia;
- [x] el cambio tecnológico permanece bajo `TI-DOM-009`;
- [x] observabilidad permanece bajo `TI-DOM-010`;
- [x] recuperación permanece bajo `TI-DOM-011`;
- [x] conocimiento y capacitación permanecen bajo `TI-DOM-013`;
- [x] se definen cuatro códigos de cierre;
- [x] aceptación de riesgo no puede ser unilateral del técnico;
- [x] se materializan diez indicadores;
- [x] se reconcilia el modelo contra `support_tickets` actual sin reinterpretar campos legacy;
- [x] los diez hallazgos tienen propietario y condición de salida;
- [x] no se crean tablas, migraciones, datos, problemas, known errors o workarounds físicos;
- [x] no se modifica Supabase;
- [x] no se crean ni modifican requisitos de prueba;
- [x] `TI-DOM-009` permanece únicamente reservada.

---

#### 47. Cobertura de prueba consumida

La tarea consume cobertura vigente que ya protege:

- distinción entre solicitud, incidente, problema, error conocido y cambio;
- separación entre restauración, causa eliminada y cierre aceptado;
- problema, workaround, diagnóstico, cambio, validación y reapertura dentro de la mesa de servicio;
- recurrencia no investigada como guardrail de soporte;
- correlación entre servicio, activos, endpoints, aplicaciones, incidentes, problemas, cambios y proveedores;
- historial y evidencia de configuración;
- protección de logs, secretos y acceso diagnóstico;
- observabilidad, resultado desconocido y reconciliación;
- conocimiento versionado y transferencia de pendientes.

Entre las coberturas existentes se encuentra `TREQ-VISO-002`, que asigna expresamente responsabilidad a las tareas del dominio tecnológico para el ciclo completo de incidentes, problemas, errores conocidos y cambios, junto con requisitos transversales de integración y configuración ya vigentes.

TI-DOM-008 especializa esas obligaciones sin crear una segunda conducta de prueba paralela.

---

#### 48. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa documentalmente la gestión de problema, análisis causal, error conocido, workaround, recurrencia y prevención que ya forman parte de la cobertura canónica vigente de mesa de servicio, configuración, integración, trazabilidad, observabilidad y conocimiento. No introduce una nueva superficie ejecutable, esquema físico, autorización, proveedor, contrato de transporte ni comportamiento empresarial adicional; por tanto no se requiere una fila nueva ni una modificación del registro.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 49. Continuidad

ÚLTIMA TAREA APROBADA
`TI-DOM-007 — Definir solicitud de servicio, incidente, impacto, urgencia, prioridad, SLA, escalamiento, comunicación y cierre`

TAREA ACTUAL APROBADA
`TI-DOM-008 — Definir problema, causa raíz, error conocido, workaround y prevención de recurrencia`

SIGUIENTE TAREA RESERVADA
`TI-DOM-009 — Definir cambio tecnológico, aprobación, ventana, prueba, despliegue, rollback y revisión posterior`


### ✅ TI-DOM-009 — Definir cambio tecnológico, aprobación, ventana, prueba, despliegue, rollback y revisión posterior

**Estado:** APROBADA
**Tarea anterior:** `TI-DOM-008 — Definir problema, causa raíz, error conocido, workaround y prevención de recurrencia` — APROBADA
**Tarea siguiente:** `TI-DOM-010 — Definir monitoreo, eventos técnicos, alertas, logs, salud y observabilidad de servicios` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada del gobierno transversal de cambios tecnológicos, clasificación, evaluación de riesgo, aprobación, ventana, prueba, ejecución controlada, rollback, validación y revisión posterior
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/01_DOMINIO_DE_TECNOLOGIA_Y_SOPORTE.md`
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, tablas, enums, RLS, RPC, funciones, triggers, Edge Functions, migraciones, datos, redes, endpoints, impresoras, cuentas, proveedores, configuraciones, releases, despliegues ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el contrato canónico con el que VENTO gobierna cualquier modificación tecnológica relevante desde que aparece la necesidad hasta que el resultado queda validado y revisado, sin confundir la aprobación empresarial con la ejecución técnica, el release de software con el cambio operativo ni el rollback con un cierre exitoso.

La tarea cubre cambios sobre:

- software y releases;
- esquemas, migraciones y datos cuando exista un paquete autorizado;
- configuración de aplicaciones y servicios;
- red y direccionamiento;
- endpoints y dispositivos administrados;
- impresoras, drivers, firmware, canales y periféricos;
- configuración de identidad y seguridad tecnológica;
- integraciones, proveedores y dependencias externas.

La regla raíz queda:

```text
NECESIDAD DE CAMBIO
≠
CAMBIO EVALUADO
≠
CAMBIO APROBADO
≠
VENTANA AUTORIZADA
≠
EJECUCIÓN
≠
VALIDACIÓN
≠
ROLLBACK
≠
REVISIÓN POSTERIOR
≠
EFICACIA PREVENTIVA
```

Un incidente puede necesitar un cambio para restaurar. Un problema puede necesitar un cambio para prevenir recurrencia. Ninguno de los dos autoriza por sí mismo la modificación.

---

#### 2. Resultado material

Se materializan nueve piezas documentales coordinadas dentro de esta tarea:

1. un contrato único de identidad y ciclo de vida del cambio tecnológico;
2. una clasificación materializada de cambios estándar, normales y de emergencia;
3. una matriz cualitativa de riesgo y autoridad de aprobación;
4. un contrato de ventana, conflictos, freeze, dependencias y decisión go/no-go;
5. un contrato de prueba pre-cambio, validación posterior y aceptación;
6. un contrato de ejecución y despliegue que separa software, datos, configuración, hardware y proveedores;
7. un contrato de rollback y recuperación del estado controlado;
8. un contrato de cambio de emergencia sin bypass permanente;
9. un contrato de revisión posterior, cierre y handoff hacia problema, observabilidad, recuperación, conocimiento o soporte.

Cobertura materializada:

| Control                                         | Resultado |
| ----------------------------------------------- | --------: |
| Clases de cambio                                |     **3** |
| Dominios tecnológicos de cambio                 |     **8** |
| Estados de ciclo de vida                        |    **10** |
| Niveles cualitativos de riesgo                  |     **4** |
| Dimensiones obligatorias de evaluación          |     **8** |
| Estados de aprobación                           |     **5** |
| Controles mínimos de ventana                    |    **10** |
| Dimensiones mínimas del plan de prueba          |     **9** |
| Modos de resultado de ejecución                 |     **4** |
| Condiciones obligatorias de rollback            |    **10** |
| Disparadores de revisión posterior reforzada    |     **8** |
| Códigos de cierre                               |     **4** |
| Hallazgos con propietario y condición de salida |    **10** |
| Cambios físicos                                 |     **0** |
| Cambios de requisitos de prueba                 |     **0** |

---

#### 3. Autoridades y decisiones heredadas

La tarea consume y conserva sin redefinir:

- el modelo operativo y las fronteras de `TI-DOM-001`;
- el grafo federado de configuración de `TI-DOM-002`;
- el ciclo de endpoints de `TI-DOM-003`;
- el gobierno de red de `TI-DOM-004`;
- el gobierno físico de impresión de `TI-DOM-005`;
- el catálogo de aplicaciones, ambientes, dependencias y proveedores de `TI-DOM-006`;
- el caso tecnológico, impacto, urgencia, prioridad, SLA, escalamiento, restauración y cierre de `TI-DOM-007`;
- problema, causa, error conocido, workaround, prevención y eficacia de `TI-DOM-008`;
- `VPROC-0058` como proceso de solicitudes e incidentes tecnológicos;
- `VPROC-0059` como proceso separado del ciclo de acceso;
- `VPROC-0062` como proceso separado de continuidad empresarial;
- BLOQUE T como autoridad de pruebas, releases, despliegue y rollback técnico;
- BLOQUE E5 como autoridad de diseño de paquetes, readiness, cutover, piloto e hypercare;
- BLOQUE R como autoridad de implementación de migraciones Supabase cuando exista paquete autorizado;
- BLOQUE U como autoridad de certificación integral posterior;
- `TI-AUTH-001` a `TI-AUTH-004` como tareas propietarias de segregación, acceso privilegiado, configuración protegida y evidencia sensible;
- `TI-UX-004` como tarea propietaria de la experiencia de incidente, problema, cambio, mantenimiento y recuperación;
- `TI-INT-002` como tarea propietaria de los contratos tecnológicos entre dominios y BLOQUE T.

Esta tarea no crea un proceso empresarial nuevo ni un identificador `VPROC-*`.

---

#### 4. Fronteras canónicas del cambio

Se fijan las siguientes separaciones:

```text
CAMBIO TECNOLÓGICO
≠
SOLICITUD DE SERVICIO
≠
INCIDENTE
≠
PROBLEMA
```

```text
CAMBIO APROBADO
≠
RELEASE PUBLICADO
≠
DESPLIEGUE EJECUTADO
```

```text
PLAN DE ROLLBACK
≠
ROLLBACK PROBADO
≠
ROLLBACK EJECUTADO
```

```text
CAMBIO EJECUTADO
≠
CAMBIO VALIDADO
≠
CAMBIO EFECTIVO
```

```text
CAMBIO DE ACCESO
≠
AUTORIZACIÓN DE ACCESO
```

Reglas:

1. la aprobación del cambio autoriza un alcance técnico definido; no concede permisos empresariales al actor ejecutor;
2. un release puede existir sin estar aprobado para un ambiente concreto;
3. un despliegue puede pertenecer a un cambio, pero no sustituye su evaluación, aprobación ni revisión;
4. un rollback no elimina automáticamente los efectos producidos durante la ventana;
5. una restauración de incidente no demuestra que el cambio preventivo sea efectivo;
6. una acción ordinaria de alta, baja o ajuste de acceso que ya pertenece al proceso autorizado de acceso no se convierte artificialmente en cambio; modificar política, configuración, proveedor o mecanismo de seguridad sí queda sujeto a gobierno de cambio;
7. un cambio de configuración de red, impresora, endpoint, proveedor o aplicación se gobierna aunque no exista commit de software.

---

#### 5. Identidad canónica del cambio

Cada cambio deberá conservar conceptualmente:

```text
change_id
change_revision
change_class
change_domain
title
reason
requested_by_ref
requested_at
source_case_refs[]
problem_refs[]
affected_service_refs[]
affected_element_refs[]
affected_process_refs[]
current_state_snapshot_ref
proposed_state_ref
risk_level
risk_assessment_ref
dependency_refs[]
authorization_refs[]
approval_state
approver_refs[]
planned_window_ref
test_plan_ref
rollback_plan_ref
communication_plan_ref
executor_refs[]
implementation_refs[]
validation_refs[]
post_review_ref
outcome
closure_code
evidence_refs[]
created_at
updated_at
closed_at
```

Invariantes:

- `change_id` permanece estable durante el expediente;
- un cambio material de alcance crea una nueva revisión;
- una revisión anterior no se sobrescribe;
- un incidente, problema, release, migración, asset, endpoint o proveedor conserva su propia identidad;
- la relación con un elemento no concede permiso para modificarlo;
- el cambio referencia evidencia; no almacena secretos como mecanismo de transferencia.

---

#### 6. Dominios de cambio

Se materializan ocho dominios para clasificación transversal:

| Dominio                              | Incluye                                                                                           | Autoridad técnica relacionada                          |
| ------------------------------------ | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------ |
| `SOFTWARE_RELEASE`                   | código, paquete compartido, versión, build, release y despliegue                                  | BLOQUE T + repositorio propietario                     |
| `DATABASE_OR_DATA`                   | esquema, migración, backfill, función, trigger o transformación de datos                          | `vento-shell`, E3/R y paquete autorizado               |
| `APPLICATION_CONFIGURATION`          | configuración de aplicación, ambiente, runtime o dependencia                                      | propietario de aplicación + `TI-DOM-006`               |
| `NETWORK_CONFIGURATION`              | router, switch, AP, segmento, SSID, DHCP, DNS, reserva, direccionamiento o firmware de red        | `TI-DOM-004`                                           |
| `ENDPOINT_OR_DEVICE`                 | baseline, sistema, agente, postura, firmware, software o configuración administrada               | `TI-DOM-003`                                           |
| `PRINTING_OR_PERIPHERAL`             | driver, firmware, IP, canal, host, adaptador o configuración física/técnica                       | `TI-DOM-005` + PRINT-ARC                               |
| `IDENTITY_OR_SECURITY_CONFIGURATION` | configuración tecnológica de identidad, MFA, política, principal técnico o control privilegiado   | SHELL + `TI-AUTH-*` + proceso de acceso cuando aplique |
| `PROVIDER_OR_INTEGRATION`            | proveedor, API, webhook, credencial técnica, endpoint externo, MDM, ISP, fabricante o integración | `TI-DOM-006`, `TI-DOM-012`, `TI-INT-*`                 |

Una misma modificación puede afectar varios dominios. Se registra una identidad de cambio y múltiples alcances, no un expediente duplicado por dominio.

---

#### 7. Clases de cambio

Se aprueban tres clases.

| Clase       | Uso                                                                                                         | Regla principal                                                                                                              |
| ----------- | ----------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `STANDARD`  | modificación repetible, de bajo riesgo, con procedimiento, guardas, prueba y rollback previamente aprobados | cada ejecución debe coincidir exactamente con la revisión autorizada del procedimiento; una desviación la saca de esta clase |
| `NORMAL`    | modificación planificada que exige evaluación y aprobación específica                                       | no se ejecuta hasta completar evaluación, autoridad, ventana, prueba y rollback aplicables                                   |
| `EMERGENCY` | modificación necesaria para contener o restaurar una afectación crítica o reducir un riesgo inmediato       | acelera la decisión, pero no elimina identidad, autoridad, alcance, evidencia, rollback, validación ni revisión posterior    |

Prohibiciones:

- usar `STANDARD` para evitar una aprobación que corresponde;
- convertir un cambio repetido en estándar únicamente por frecuencia;
- usar `EMERGENCY` por atraso de planificación;
- convertir presión de un proveedor en emergencia interna;
- declarar estándar una acción sin rollback o sin criterio de validación;
- mantener indefinidamente una excepción como cambio estándar.

---

#### 8. Contrato del cambio estándar

Un cambio `STANDARD` solo es elegible cuando se cumplen simultáneamente:

1. procedimiento versionado;
2. alcance acotado y repetible;
3. clase de elementos definida;
4. riesgo `LOW`;
5. precondiciones verificables;
6. prueba de salida definida;
7. rollback definido y previamente demostrado para el alcance;
8. ausencia de alteración material de autorización empresarial;
9. ausencia de migración irreversible o estado de datos no reconciliable;
10. registro obligatorio de cada ejecución;
11. propietario técnico;
12. revisión periódica de la autorización del procedimiento.

La preautorización pertenece al procedimiento y su revisión, no a la persona que lo ejecuta.

Cualquier diferencia de versión, alcance, dependencia, riesgo o condición convierte la ejecución en `NORMAL` o `EMERGENCY` según el contexto.

---

#### 9. Contrato del cambio normal

El cambio `NORMAL` requiere, antes de ejecución:

- necesidad y resultado esperado;
- alcance;
- estado anterior;
- estado propuesto;
- servicios y elementos afectados;
- dependencias;
- evaluación de riesgo;
- autoridad técnica y empresarial aplicable;
- ventana;
- plan de prueba;
- plan de rollback;
- comunicaciones;
- ejecutor;
- validadores;
- evidencia de go/no-go.

La aprobación pierde vigencia cuando cambia materialmente el alcance, el riesgo, la ventana, el estado anterior o una dependencia relevante. En ese caso vuelve a evaluación mediante nueva revisión.

---

#### 10. Contrato del cambio de emergencia

Un cambio `EMERGENCY` requiere como mínimo:

- incidente, hallazgo de seguridad o condición urgente correlacionada;
- razón por la que el flujo normal no protege el resultado a tiempo;
- alcance mínimo necesario;
- autoridad de emergencia aplicable;
- ejecutor identificado;
- riesgo conocido y limitaciones;
- estado anterior disponible en la medida técnicamente posible;
- estrategia de rollback, contención o recuperación;
- criterio de éxito;
- criterio de detención;
- prueba posterior inmediata al efecto modificado;
- comunicación proporcional;
- evidencia;
- revisión posterior obligatoria.

Reglas:

1. emergencia no significa “sin aprobación”;
2. emergencia no concede acceso privilegiado por sí misma;
3. cuando el acceso requerido todavía no esté autorizado, aplica la autoridad de `TI-AUTH-*`;
4. un cambio de emergencia no se convierte automáticamente en configuración estándar;
5. toda excepción temporal debe tener propietario y condición de retiro;
6. el expediente del incidente permanece separado;
7. la revisión posterior debe decidir si el cambio se conserva, se normaliza mediante otro cambio, se revierte o genera problema/acción preventiva.

---

#### 11. Estados del ciclo de vida

Se materializan diez estados documentales:

| Estado                       | Significado                                                           | Restricción                                                      |
| ---------------------------- | --------------------------------------------------------------------- | ---------------------------------------------------------------- |
| `DRAFT`                      | necesidad registrada, todavía incompleta                              | no ejecutable                                                    |
| `ASSESSMENT_IN_PROGRESS`     | alcance, riesgo, dependencias, prueba y rollback en evaluación        | no ejecutable                                                    |
| `APPROVAL_PENDING`           | expediente suficiente y enviado a las autoridades aplicables          | no ejecutable                                                    |
| `APPROVED`                   | alcance y condiciones autorizados                                     | aún no implica inicio                                            |
| `SCHEDULED`                  | ventana, ejecutores, comunicaciones y dependencias confirmados        | no ejecutar fuera de la ventana salvo reclasificación autorizada |
| `IMPLEMENTATION_IN_PROGRESS` | ejecución controlada en curso                                         | cada paso y desviación material conserva evidencia               |
| `VALIDATION_PENDING`         | ejecución o rollback terminados y resultado pendiente de comprobación | no cerrar ni declarar éxito                                      |
| `POST_IMPLEMENTATION_REVIEW` | resultado validado o controlado y revisión posterior abierta          | evalúa desviaciones, incidentes, rollback y deuda                |
| `CLOSED`                     | cambio finalizado con resultado, evidencia y pendientes transferidos  | terminal para esa revisión                                       |
| `CANCELLED`                  | cambio detenido antes de producir el efecto autorizado                | terminal; no se presenta como implementado                       |

`CLOSED` no significa necesariamente que la modificación quedó activa: el código de cierre conserva el resultado real.

---

#### 12. Transiciones y revisiones

Flujo ordinario:

```text
DRAFT
→ ASSESSMENT_IN_PROGRESS
→ APPROVAL_PENDING
→ APPROVED
→ SCHEDULED
→ IMPLEMENTATION_IN_PROGRESS
→ VALIDATION_PENDING
→ POST_IMPLEMENTATION_REVIEW
→ CLOSED
```

Retornos controlados:

```text
APPROVAL_PENDING
→ ASSESSMENT_IN_PROGRESS
```

cuando se exige corregir alcance, riesgo, prueba, rollback o autoridad.

```text
APPROVED / SCHEDULED
→ ASSESSMENT_IN_PROGRESS
```

cuando cambia materialmente el contexto antes de ejecutar.

```text
VALIDATION_PENDING
→ IMPLEMENTATION_IN_PROGRESS
```

solo para ejecutar el rollback ya autorizado o una acción correctiva que siga dentro del alcance aprobado. Si cambia el alcance, se requiere nueva revisión o un cambio distinto.

Cancelación:

- `DRAFT`, `ASSESSMENT_IN_PROGRESS`, `APPROVAL_PENDING`, `APPROVED` o `SCHEDULED` pueden terminar en `CANCELLED` con motivo;
- después de producir un efecto técnico no se usa `CANCELLED`; se registra el resultado real y se valida o revierte.

---

#### 13. Dimensiones de evaluación de riesgo

Se materializan ocho dimensiones obligatorias:

| Dimensión                | Pregunta                                                                                    |
| ------------------------ | ------------------------------------------------------------------------------------------- |
| servicio y proceso       | ¿qué resultado empresarial y qué criticidad pueden verse afectados?                         |
| alcance                  | ¿cuántos servicios, sedes, actores, componentes o ambientes pueden recibir el efecto?       |
| seguridad y autorización | ¿cambia identidad, privilegios, secretos, controles, segmentación o superficie de ataque?   |
| datos y estado           | ¿puede producir pérdida, corrupción, duplicación, irreversibilidad o resultado desconocido? |
| dependencias             | ¿qué aplicaciones, proveedores, redes, dispositivos o contratos dependen del elemento?      |
| reversibilidad           | ¿existe retorno verificable y compatible con el estado producido durante la ventana?        |
| prueba y observabilidad  | ¿es posible comprobar antes, durante y después el resultado sin inferencia?                 |
| ventana y continuidad    | ¿qué indisponibilidad, coexistencia, contingencia o reconciliación requiere la operación?   |

La evaluación es cualitativa y trazable. No se inventa un puntaje numérico universal.

---

#### 14. Niveles de riesgo

Se aprueban cuatro niveles:

| Nivel      | Criterio                                                                                                                                                     |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `LOW`      | alcance acotado, efecto conocido, reversibilidad demostrada, sin control sensible ni estado empresarial comprometido                                         |
| `MEDIUM`   | efecto limitado pero material sobre servicio, configuración o disponibilidad, con rollback y pruebas suficientes                                             |
| `HIGH`     | puede afectar proceso crítico, múltiples dependencias, seguridad, disponibilidad relevante, datos o rollback complejo                                        |
| `CRITICAL` | puede comprometer identidad/seguridad, integridad o estado irreversible, operación mínima, múltiples sedes/servicios o carece de reversión segura suficiente |

Reglas:

1. la categoría más severa aplicable gobierna;
2. un cambio pequeño sobre un control privilegiado puede ser `HIGH` o `CRITICAL`;
3. un cambio con rollback no probado no puede declararse `LOW`;
4. una modificación con resultado de datos desconocido no se reduce por tener poca duración;
5. la emergencia no reduce el nivel de riesgo;
6. el riesgo se reevalúa si cambia el alcance o una dependencia.

---

#### 15. Autoridad de aprobación

La matriz de aprobación conserva funciones canónicas y evita asignar personas nominales.

| Caso                | Autoridad mínima de cambio                                                                                                     | Participación adicional                                                       |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------- |
| `STANDARD / LOW`    | preautorización vigente del procedimiento bajo `RESPONSABLE_TECNOLOGICO` y segregación definida por `TI-AUTH-001`              | propietario del componente cuando corresponda                                 |
| `NORMAL / LOW`      | `RESPONSABLE_TECNOLOGICO`                                                                                                      | propietario del componente                                                    |
| `NORMAL / MEDIUM`   | `RESPONSABLE_TECNOLOGICO`                                                                                                      | `RESPONSABLE_DEL_PROCESO` cuando exista efecto empresarial                    |
| `NORMAL / HIGH`     | `RESPONSABLE_TECNOLOGICO` + autoridad funcional aplicable                                                                      | `COORDINACION_DE_OPERACIONES`; seguridad cuando el cambio sea sensible        |
| `NORMAL / CRITICAL` | `RESPONSABLE_TECNOLOGICO` + `COORDINACION_DE_OPERACIONES` + autoridad funcional aplicable                                      | `RESPONSABLE_DE_SEGURIDAD_TECNOLOGICA` cuando corresponda                     |
| `EMERGENCY`         | autoridad técnica y de control aplicable al alcance, conservando `COORDINACION_DE_OPERACIONES` en cambios críticos o sensibles | seguridad, propietario funcional y proveedor según el riesgo y disponibilidad |

Invariantes:

- el ejecutor no se convierte en autoridad por poseer acceso;
- una aprobación funcional no concede privilegios técnicos;
- para cambios sensibles, la segregación definitiva queda bajo `TI-AUTH-001`;
- proveedor o fabricante nunca es aprobador empresarial final;
- una aprobación de cambio no sustituye aprobación de acceso, compra, contrato, riesgo o continuidad cuando alguna de ellas sea necesaria.

---

#### 16. Estados de aprobación

Se materializan cinco estados:

| Estado                   | Significado                                                    |
| ------------------------ | -------------------------------------------------------------- |
| `NOT_READY_FOR_APPROVAL` | falta información o control necesario                          |
| `PENDING`                | expediente enviado a autoridad aplicable                       |
| `APPROVED`               | autorizado en alcance, riesgo, ventana y condiciones definidos |
| `CHANGES_REQUIRED`       | requiere corrección y nueva revisión                           |
| `REJECTED`               | no autorizado; la decisión y razón se conservan                |

Una aprobación no es reutilizable cuando cambia la revisión material del cambio.

---

#### 17. Ventana de cambio

Todo cambio ejecutable conserva una ventana o una regla explícita de ejecución previamente autorizada.

Se materializan diez controles mínimos:

1. sede, ambiente o alcance;
2. zona horaria;
3. inicio permitido;
4. fin esperado;
5. límite para iniciar rollback;
6. ventana o etapa crítica del proceso afectado;
7. dependencias y ventanas de proveedor;
8. freeze o restricción temporal aplicable;
9. cambios concurrentes o conflictivos;
10. decisión go/no-go y responsable.

No se fija una hora universal de mantenimiento.

Un cambio `STANDARD` puede usar una ventana preautorizada por procedimiento. Un `EMERGENCY` usa una ventana de emergencia correlacionada con el incidente, sin borrar sus restricciones de seguridad.

---

#### 18. Conflictos y cambios concurrentes

Antes de iniciar se comprueba:

- mismo servicio;
- mismo elemento;
- misma dependencia;
- mismo repositorio o release;
- misma migración o conjunto de datos;
- misma sede o segmento;
- mismo endpoint, dispositivo o impresora;
- mismo proveedor;
- cambios que modifiquen la capacidad de rollback del otro.

Reglas:

1. dos cambios aprobados no son automáticamente compatibles;
2. un conflicto se resuelve antes del go/no-go;
3. ejecutar cambios simultáneos que impidan atribuir el resultado requiere coordinación explícita;
4. un cambio no puede usar como baseline un estado que otro cambio está modificando sin versionarlo;
5. la urgencia de un incidente puede suspender una ventana planificada sin convertirla en fallida;
6. la decisión de suspender conserva razón, actor y nuevo estado.

---

#### 19. Freeze y excepción

Un freeze es una restricción de cambio sobre un alcance y período definidos.

Debe conservar:

- alcance;
- razón;
- inicio;
- fin o condición de salida;
- autoridad;
- excepciones permitidas;
- proceso de emergencia;
- evidencia.

Una excepción al freeze:

- no lo elimina;
- se limita al cambio autorizado;
- conserva riesgo y razón;
- requiere aprobación compatible con el nivel del cambio;
- queda incluida en la revisión posterior.

---

#### 20. Plan de prueba

Todo cambio conserva un plan de prueba proporcional al riesgo.

Se materializan nueve dimensiones:

1. baseline pre-cambio;
2. precondiciones;
3. prueba técnica del elemento;
4. prueba del servicio dependiente;
5. validación funcional del proceso cuando aplique;
6. seguridad y autorización cuando aplique;
7. integridad y reconciliación de datos cuando aplique;
8. prueba física, de red, dispositivo o impresora cuando aplique;
9. prueba de rollback o evidencia de reversibilidad.

Cada prueba conserva:

```text
scope
environment_or_site
input_or_fixture
expected_result
failure_condition
evidence
actor
timestamp
version_or_configuration
```

Probar únicamente una aplicación no satisface un cambio que también afecta red, hardware, impresión, dispositivo, datos, contingencia o operación real.

---

#### 21. Baseline previo

Antes de ejecutar se conserva el estado necesario para comparar:

- versión;
- commit, release o artefacto cuando exista;
- configuración;
- esquema y migraciones aplicables;
- datos de control o conteos cuando sean necesarios;
- dependencias;
- health disponible;
- relaciones de red o dispositivo afectadas;
- binding de impresora cuando aplique;
- proveedor o endpoint externo;
- autorizaciones y principals técnicos relevantes;
- evidencia de disponibilidad del servicio.

El baseline no se inventa después del cambio para justificar el resultado.

Cuando no sea técnicamente posible capturarlo, el riesgo y la limitación quedan explícitos antes de aprobar.

---

#### 22. Go/no-go

Inmediatamente antes de ejecutar se confirma:

```text
APPROVAL VALID
+
WINDOW VALID
+
BASELINE AVAILABLE
+
DEPENDENCIES READY
+
TEST PLAN READY
+
ROLLBACK READY
+
EXECUTORS READY
+
COMMUNICATION READY
=
GO
```

Cualquier condición obligatoria no satisfecha produce `NO-GO`, salvo un cambio `EMERGENCY` cuya autoridad haya aceptado explícitamente la limitación y exista una estrategia de contención suficiente.

`NO-GO` no se presenta como fallo de implementación.

---

#### 23. Ejecución controlada

Durante `IMPLEMENTATION_IN_PROGRESS` se conserva:

- actor o principal técnico;
- inicio;
- paso ejecutado;
- estado anterior;
- resultado;
- evidencia;
- desviación;
- decisión de continuar, detener o revertir;
- correlación con release, migración, configuración o proveedor;
- comunicación cuando corresponda.

Reglas:

1. el plan no se edita retrospectivamente para que coincida con lo ocurrido;
2. una desviación material exige detener y reevaluar;
3. una acción manual fuera del repositorio o herramienta controlada se documenta como tal;
4. el acceso privilegiado sigue las reglas de `TI-AUTH-*`;
5. un proveedor ejecuta únicamente dentro del alcance concedido;
6. la ejecución no modifica automáticamente el estado del incidente o problema relacionado.

---

#### 24. Software, release y despliegue

Para `SOFTWARE_RELEASE` se conserva la separación:

```text
COMMIT
→ BUILD
→ RELEASE
→ CHANGE APPROVAL
→ PACKAGE / ENVIRONMENT
→ DEPLOYMENT
→ VALIDATION
```

BLOQUE T conserva:

- pruebas de paquetes;
- build;
- release versionado;
- changelog;
- compatibilidad de consumidores;
- rollback por repositorio;
- gates de CI;
- evidencia;
- ciclo de despliegue por paquete.

BLOQUE E5 conserva el diseño del paquete, readiness, cutover, piloto e hypercare.

`TI-DOM-009` gobierna la decisión operacional del cambio y consume esas evidencias. No reemplaza las tareas de BLOQUE T/E5.

---

#### 25. Supabase, migraciones y datos

Toda modificación Supabase de VENTO deberá:

- originarse y versionarse en `vento-shell`;
- relacionarse con el paquete autorizado;
- identificar objetos y consumidores afectados;
- conservar migración, orden y precondiciones;
- evaluar grants, RLS, funciones, triggers, Realtime, Storage y Edge Functions cuando apliquen;
- definir validación de datos;
- definir reversibilidad, compensación o estrategia forward-fix;
- evitar que un rollback destruya datos válidos producidos durante la ventana;
- conservar evidencia del ambiente y de la versión aplicada.

Una migración irreversible o un backfill no se presenta como reversible mediante una instrucción ficticia. Si el retorno literal no es seguro, el expediente declara la limitación, eleva el riesgo y define compensación o forward-fix controlado.

Durante esta tarea no se ejecuta DDL, DML, backfill ni despliegue.

---

#### 26. Red, endpoints, impresoras y configuración física

Los cambios no basados en software conservan el mismo principio de control.

Ejemplos:

- IP, reserva, DHCP, DNS, segmento, SSID o firmware de red;
- baseline, sistema, agente, firmware o configuración de endpoint;
- driver, firmware, host, canal, red o dirección de impresora;
- configuración de aplicación;
- integración, endpoint externo o proveedor.

En estos casos:

- el estado anterior sustituye al concepto de commit cuando no exista commit;
- la configuración deseada y observada permanecen separadas;
- el activo y su identidad no cambian por editar configuración;
- la prueba incluye el servicio dependiente;
- la restauración física o técnica no se declara por intención;
- el resultado queda correlacionado con el elemento canónico.

---

#### 27. Identidad, cuentas y seguridad

Un cambio tecnológico puede modificar una configuración de identidad o seguridad, pero no puede fabricar la autoridad que lo permite.

Se mantiene:

```text
CHANGE APPROVAL
≠
ACCESS APPROVAL
≠
PRIVILEGED SESSION
```

Reglas:

1. altas, bajas o cambios de acceso siguen `VPROC-0059`;
2. modificar políticas, MFA, integración de identidad, principal técnico o configuración protegida exige además gobierno de cambio;
3. rollback no restaura automáticamente un privilegio revocado o inseguro;
4. secretos no se copian al expediente;
5. una credencial rotada no se “revierte” reutilizando material comprometido;
6. la intervención privilegiada debe ser mínima, temporal y auditada conforme a `TI-AUTH-*`.

---

#### 28. Proveedores e integraciones externas

Un cambio de proveedor o integración conserva:

- proveedor interno de la decisión;
- contrato y soporte referenciados;
- ambiente;
- endpoint o interfaz;
- autenticación;
- datos expuestos;
- dependencia;
- ventana externa;
- compatibilidad;
- contingencia;
- rollback o salida;
- evidencia.

Reglas:

- la aprobación del proveedor no sustituye la aprobación VENTO;
- una ventana externa no determina por sí sola la ventana empresarial;
- una actualización impuesta por proveedor se evalúa como cambio;
- un SaaS que cambia sin control directo puede originar cambio de configuración, compatibilidad, contingencia o proveedor;
- la indisponibilidad de rollback del proveedor eleva el riesgo y exige estrategia alternativa.

---

#### 29. Resultado de ejecución

Se aprueban cuatro modos de resultado:

| Resultado           | Uso                                                                                                  |
| ------------------- | ---------------------------------------------------------------------------------------------------- |
| `IMPLEMENTED`       | el efecto planificado fue ejecutado; todavía requiere validación                                     |
| `ROLLED_BACK`       | se ejecutó la estrategia de retorno; todavía requiere validar estado recuperado y efectos residuales |
| `STOPPED_NO_EFFECT` | la ejecución se detuvo antes de producir el efecto material                                          |
| `FAILED_OR_UNKNOWN` | existe fallo, efecto parcial o resultado que no puede declararse con certeza                         |

Ninguno equivale automáticamente a cierre.

`FAILED_OR_UNKNOWN` obliga a contener, preservar evidencia y correlacionar incidente cuando el servicio o la integridad puedan estar afectados.

---

#### 30. Contrato de rollback

Todo cambio que pueda producir un efecto material debe resolver, antes de ejecución, estas diez condiciones:

1. estado objetivo al que se pretende retornar;
2. mecanismo de rollback;
3. actor autorizado;
4. trigger para iniciar;
5. límite temporal o punto de no retorno;
6. dependencias requeridas;
7. tratamiento de datos y efectos producidos durante la ventana;
8. compatibilidad con consumidores y versiones;
9. prueba o evidencia de reversibilidad;
10. validación posterior del estado recuperado.

El rollback puede ser:

- retorno de versión;
- restauración de configuración;
- retorno de routing o binding;
- recuperación desde estado anterior;
- compensación controlada;
- forward-fix cuando volver literalmente sea más riesgoso.

La estrategia elegida debe corresponder al objeto real; no se fuerza un `git revert` como respuesta universal.

---

#### 31. Disparadores de rollback

El plan define condiciones observables, por ejemplo:

- prueba crítica fallida;
- pérdida de autorización o seguridad;
- corrupción o resultado desconocido;
- indisponibilidad superior a la condición aceptada;
- incompatibilidad de consumidor;
- health o dependencia fuera de condición segura;
- resultado físico no conforme;
- desviación de alcance que invalida la aprobación;
- ausencia de evidencia necesaria para continuar.

El trigger no puede depender únicamente de percepción informal.

En un `EMERGENCY`, si el rollback empeora el riesgo, la decisión puede ser contener o aplicar forward-fix, pero debe quedar autorizada y evidenciada.

---

#### 32. Validación posterior

Después de la ejecución o rollback se valida:

- elemento técnico;
- servicio afectado;
- dependencias;
- proceso empresarial cuando corresponda;
- seguridad;
- datos y conciliación;
- observabilidad disponible;
- operación física cuando aplique;
- contingencia y pendientes.

La validación distingue:

```text
CAMBIO APLICADO
≠
SERVICIO DISPONIBLE
≠
PROCESO VALIDADO
```

Una señal técnica saludable no invalida una falla empresarial comprobada.

Una prueba funcional positiva no oculta una divergencia de datos o seguridad.

---

#### 33. Revisión posterior

Todo cambio conserva al menos un registro de revisión posterior.

La revisión reforzada es obligatoria cuando ocurra cualquiera de estos ocho disparadores:

1. clase `EMERGENCY`;
2. riesgo `HIGH` o `CRITICAL`;
3. rollback ejecutado;
4. resultado `FAILED_OR_UNKNOWN`;
5. incidente causado o agravado por el cambio;
6. desviación material de alcance, ventana o procedimiento;
7. cambio de seguridad, identidad o datos con efecto no previsto;
8. dependencia externa que obligó a una decisión distinta de la aprobada.

La revisión responde:

- qué se planeó;
- qué se ejecutó;
- qué cambió respecto del plan;
- qué evidencia demuestra el resultado;
- qué incidentes aparecieron;
- si el rollback fue necesario;
- si el baseline se recuperó;
- qué deuda quedó;
- qué aprendizaje o cambio de control se requiere.

---

#### 34. Handoff posterior

La revisión puede generar, sin duplicar autoridad:

| Hallazgo                                        | Propietario                                                           |
| ----------------------------------------------- | --------------------------------------------------------------------- |
| causa o recurrencia por investigar              | `TI-DOM-008`                                                          |
| nueva señal, alerta o health requerido          | `TI-DOM-010`                                                          |
| respaldo, restore o recuperación insuficiente   | `TI-DOM-011`                                                          |
| contrato, garantía, proveedor o costo           | `TI-DOM-012`                                                          |
| guía, known error, capacitación o adopción      | `TI-DOM-013`                                                          |
| segregación, privilegio o evidencia sensible    | `TI-AUTH-*`                                                           |
| experiencia de flujo de cambio                  | `TI-UX-004`                                                           |
| contrato entre dominios o proveedor tecnológico | `TI-INT-002` / `TI-INT-003`                                           |
| defecto de implementación de paquete            | `SHELL-CI-020` + tarea documental propietaria del componente afectado |

La revisión no crea pendientes narrativos sin dueño.

---

#### 35. Códigos de cierre

Se aprueban cuatro códigos:

| Código                           | Condición                                                                                                                                |
| -------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `IMPLEMENTED_VALIDATED`          | cambio aplicado, validado y revisión completada                                                                                          |
| `ROLLED_BACK_VALIDATED`          | rollback ejecutado, estado recuperado validado y efectos pendientes reconciliados                                                        |
| `CANCELLED_BEFORE_EFFECT`        | detenido antes de producir efecto material                                                                                               |
| `CLOSED_WITH_CONTROLLED_HANDOFF` | no existe resultado final limpio, pero el efecto está contenido y cada deuda o riesgo posee autoridad, propietario y expediente aceptado |

`CLOSED_WITH_CONTROLLED_HANDOFF` no permite ocultar un estado desconocido que todavía pueda producir efecto empresarial.

---

#### 36. Relación con incidentes

Desde `TI-DOM-007`:

```text
INCIDENT
→ PUEDE PRODUCIR
CHANGE_REQUIRED
```

El cambio conserva:

- `tech_case_id` de origen;
- motivo;
- prioridad e impacto como contexto;
- restauración requerida;
- cambio de emergencia cuando aplique.

El incidente conserva su SLA y su ciclo.

```text
INCIDENTE RESTAURADO
≠
CAMBIO CERRADO
```

Un cambio puede quedar en revisión posterior después de que el incidente haya sido restaurado y validado, siempre que el pendiente tenga propietario y no exista riesgo operativo oculto.

---

#### 37. Relación con problemas

Desde `TI-DOM-008`:

```text
CAUSE_CONFIRMED
→ PUEDE PRODUCIR
CHANGE_REQUIRED
```

Se conserva:

```text
CHANGE_REQUIRED
≠
CHANGE_APPROVED
≠
CHANGE_IMPLEMENTED
≠
CHANGE_EFFECTIVE
```

El problema consume el resultado del cambio y evalúa eficacia posteriormente.

Un cambio ejecutado no permite cerrar el problema por sí solo.

---

#### 38. Relación con BLOQUE T, E5 y U

La separación obligatoria queda:

```text
TI-DOM-009
→ GOBIERNA EL CAMBIO TECNOLÓGICO

E5
→ DISEÑA PAQUETE, READINESS, CUTOVER, PILOTO, ROLLBACK E HYPERCARE

SHELL-CI-001 A SHELL-CI-019
→ PRUEBAS, RELEASES, COMPATIBILIDAD, ROLLBACK Y GATES DE CI

SHELL-CI-020 A SHELL-CI-024
→ IMPLEMENTACIÓN, READINESS, CUTOVER, HYPERCARE Y CIERRE POR PAQUETE

BLOQUE R
→ IMPLEMENTA MIGRACIONES SUPABASE CUANDO APLIQUE

BLOQUE U
→ CERTIFICA COBERTURA INTEGRAL
```

Un paquete aprobado no autoriza un cambio fuera de su alcance.

Un cambio aprobado no omite las gates del paquete.

---

#### 39. Estado AS-IS verificable

La evidencia actual de `vento-shell` muestra:

- el BLOQUE T existe documentalmente, pero `SHELL-CI-001` a `SHELL-CI-024` permanecen no iniciadas;
- E5 define documentalmente readiness, cutover, piloto e hypercare, sin ejecutar esos controles en la fase actual;
- el único workflow GitHub localizado bajo `.github/workflows` en `vento-shell` valida el plan canónico;
- la fundación actual de `support_tickets` conserva ticket, categoría, título, descripción, estado, asignación y timestamps, pero no materializa un expediente de cambio tecnológico;
- las búsquedas de solo lectura realizadas sobre `main` no localizaron una estructura dedicada denominada `change_requests`, `technology_change`, `change_id` o `emergency_change`;
- existen artefactos documentales y SQL específicos con estrategias de rollback en otros contextos, pero eso no constituye por sí mismo un gobierno transversal de cambios implementado.

Clasificación:

| Componente                                   | Estado                                                 |
| -------------------------------------------- | ------------------------------------------------------ |
| contrato transversal de cambio               | `ESPECIFICADO` por esta tarea                          |
| estado físico de cambios tecnológicos        | `FUERA_DE_ALCANCE` de esta fase                        |
| workflow transversal de aprobación/ejecución | `PENDIENTE_DE_EVIDENCIA` para implementación           |
| CI documental del plan canónico              | `IMPLEMENTADO`                                         |
| BLOQUE T general                             | `ESPECIFICADO` / tareas de implementación no iniciadas |
| E5 readiness/cutover/hypercare               | `ESPECIFICADO`                                         |
| modelo de soporte actual                     | `IMPLEMENTADO` parcialmente                            |
| persistencia dedicada de cambio              | no demostrada en las fuentes revisadas                 |
| cambios Supabase de esta tarea               | `NO_APLICA`                                            |

---

#### 40. Hallazgos y propietarios

| ID                 | Hallazgo                                                                                                                             | Estado                   | Propietario                              | Condición de salida                                                                                                                          |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------ | ------------------------ | ---------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| `H-TI-DOM-009-001` | no se demuestra una identidad física transversal de cambio tecnológico                                                               | `ESPECIFICADO`           | `SHELL-CI-020`                           | el paquete aprobado que implemente la mesa de servicio materializa identidad, revisiones y relaciones sin duplicar ticket/incidente/problema |
| `H-TI-DOM-009-002` | el BLOQUE T está definido pero sus tareas de CI/release/rollback permanecen no iniciadas                                             | `PENDIENTE_DE_EVIDENCIA` | `SHELL-CI-001` a `SHELL-CI-019`          | pruebas, releases, compatibilidad, rollback y gates quedan implementados y evidenciados                                                      |
| `H-TI-DOM-009-003` | el ciclo de despliegue por paquete está definido pero no ejecutado                                                                   | `PENDIENTE_DE_EVIDENCIA` | `SHELL-CI-020` a `SHELL-CI-024`          | un paquete autorizado ejecuta implementación, readiness, cutover, hypercare y cierre con evidencia                                           |
| `H-TI-DOM-009-004` | la segregación final para solicitar, aprobar, ejecutar y cerrar cambios todavía no está materializada                                | `PENDIENTE_DE_EVIDENCIA` | `TI-AUTH-001`                            | roles, segregación y acciones protegidas quedan definidos antes de operación real                                                            |
| `H-TI-DOM-009-005` | cambios privilegiados pueden requerir elevación o soporte remoto                                                                     | `PENDIENTE_DE_EVIDENCIA` | `TI-AUTH-002`                            | privilegio temporal, principal, alcance, vigencia y revocación quedan protegidos                                                             |
| `H-TI-DOM-009-006` | la configuración protegida de endpoints, redes, impresoras, aplicaciones y monitoreo requiere controles de autorización propios      | `PENDIENTE_DE_EVIDENCIA` | `TI-AUTH-003`                            | operaciones protegidas y evidencia quedan definidas antes de implementación                                                                  |
| `H-TI-DOM-009-007` | la experiencia de solicitud, evaluación, aprobación, ventana, rollback y revisión no está materializada en una superficie de usuario | `PENDIENTE_DE_EVIDENCIA` | `TI-UX-004`                              | flujo de cambio queda diseñado sin conflar incidente, problema, mantenimiento o recuperación                                                 |
| `H-TI-DOM-009-008` | las señales que demostrarán éxito, drift o necesidad de rollback requieren contrato de observabilidad                                | `PENDIENTE_DE_EVIDENCIA` | `TI-DOM-010`                             | health, eventos, logs y alertas aplicables quedan especificados                                                                              |
| `H-TI-DOM-009-009` | backup, restore y recuperación no pueden darse por probados por existir un plan de rollback                                          | `PENDIENTE_DE_EVIDENCIA` | `TI-DOM-011`                             | política y prueba de recuperación técnica quedan definidas                                                                                   |
| `H-TI-DOM-009-010` | cambios sobre proveedor o integración requieren contratos técnicos explícitos y salida controlada                                    | `PENDIENTE_DE_EVIDENCIA` | `TI-INT-002`; `TI-INT-003`; `TI-DOM-012` | contratos, proveedor, soporte, dependencia, licencia/costo y mecanismo de salida quedan reconciliados                                        |

No se cierra ningún hallazgo mediante una afirmación sin evidencia.

---

#### 41. Estado de materialización

| Componente                       | Estado                                                              |
| -------------------------------- | ------------------------------------------------------------------- |
| identidad y revisión del cambio  | `ESPECIFICADO`                                                      |
| tres clases de cambio            | `ESPECIFICADO`                                                      |
| ocho dominios de cambio          | `ESPECIFICADO`                                                      |
| ciclo de vida                    | `ESPECIFICADO`                                                      |
| evaluación cualitativa de riesgo | `ESPECIFICADO`                                                      |
| autoridad de aprobación          | `ESPECIFICADO` con segregación detallada pendiente de `TI-AUTH-001` |
| ventana y conflictos             | `ESPECIFICADO`                                                      |
| baseline y go/no-go              | `ESPECIFICADO`                                                      |
| plan de prueba                   | `ESPECIFICADO`                                                      |
| ejecución y despliegue           | `ESPECIFICADO` como contrato; no ejecutado                          |
| rollback                         | `ESPECIFICADO` como contrato; no ejecutado                          |
| cambio de emergencia             | `ESPECIFICADO`                                                      |
| validación posterior             | `ESPECIFICADO`                                                      |
| revisión posterior               | `ESPECIFICADO`                                                      |
| modelo físico VISO/E3            | `FUERA_DE_ALCANCE`                                                  |
| CI/release general               | `FUERA_DE_ALCANCE` hacia BLOQUE T                                   |
| monitoreo runtime                | `FUERA_DE_ALCANCE` hacia `TI-DOM-010`                               |
| recuperación técnica             | `FUERA_DE_ALCANCE` hacia `TI-DOM-011`                               |
| cambios de código o Supabase     | `NO_APLICA`                                                         |

---

#### 42. Invariantes

1. cambio no equivale a incidente.
2. cambio no equivale a problema.
3. cambio no equivale a release.
4. cambio no equivale a despliegue.
5. aprobación no equivale a acceso.
6. aprobación no equivale a ejecución.
7. ejecutor no obtiene autoridad por tener credenciales.
8. proveedor no aprueba el cambio empresarial.
9. estándar no significa sin registro.
10. emergencia no significa sin control.
11. una urgencia causada por mala planificación no convierte el cambio en emergencia.
12. una revisión material del alcance invalida la aprobación anterior.
13. una ventana no es universal.
14. una ventana externa no sustituye la ventana empresarial.
15. dos cambios aprobados pueden ser incompatibles.
16. un freeze no se elimina por una excepción.
17. el baseline se captura antes del efecto.
18. una prueba de aplicación no sustituye prueba física, red, datos o proceso cuando aplican.
19. cambio aplicado no equivale a servicio disponible.
20. servicio disponible no equivale a proceso validado.
21. plan de rollback no equivale a rollback probado.
22. rollback ejecutado no equivale a estado recuperado validado.
23. rollback no puede destruir efectos empresariales válidos sin reconciliación.
24. `git revert` no es estrategia universal.
25. una migración irreversible no se presenta como reversible.
26. una intervención manual se registra como tal.
27. una desviación material exige reevaluación.
28. secretos no forman parte del expediente.
29. acceso privilegiado permanece bajo `TI-AUTH-*`.
30. Supabase se modifica únicamente desde `vento-shell` en una fase autorizada.
31. una corrección de proveedor sigue requiriendo validación VENTO.
32. incidente restaurado no cierra el cambio.
33. cambio ejecutado no cierra el problema.
34. revisión posterior conserva desviaciones y deuda.
35. toda deuda material tiene propietario y condición de salida.
36. `TI-DOM-010` conserva observabilidad.
37. `TI-DOM-011` conserva recuperación técnica.
38. `TI-DOM-012` conserva contrato, licencia, garantía, renovación, uso y costo.
39. BLOQUE T conserva releases, despliegue y rollback técnico.
40. esta tarea no modifica código, infraestructura, datos ni Supabase.

---

#### 43. Cobertura de prueba consumida

La tarea consume cobertura vigente que ya protege:

- distinción entre solicitud, incidente, problema, error conocido y cambio;
- cambio de emergencia y revisión posterior en incidentes críticos;
- autorización, estado anterior, prueba y resultado para cambios de IP, driver, firmware, red o configuración;
- rollback independiente de código, contratos, caché, migraciones y configuración;
- compatibilidad entre consumidores durante despliegues no simultáneos;
- identificación verificable del ambiente, commit, configuración y migraciones;
- bloqueo de merge o despliegue cuando fallen controles obligatorios;
- correlación transversal de servicios, activos, endpoints, redes, impresoras, aplicaciones, incidentes, problemas, cambios y proveedores;
- detección de cambio sin prueba y riesgo de cambio sin rollback;
- separación entre identidad, acceso, endpoint, dispositivo, configuración y autoridad.

La cobertura vigente relevante incluye `TREQ-VISO-002`, `TREQ-SHELL-005` a `TREQ-SHELL-010`, `TREQ-NEXO-019` y `TREQ-INTEGRATION-020`.

TI-DOM-009 especializa documentalmente esas obligaciones y conserva sus responsables posteriores de implementación y certificación.

---

#### 44. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el registro canónico vigente ya protege de forma explícita la existencia del cambio como objeto separado, el cambio de emergencia, la autorización, el estado anterior, la prueba, el resultado, la compatibilidad, el rollback, la identificación del ambiente, los gates de despliegue y la correlación transversal de cambios con servicios y elementos tecnológicos. Esta tarea materializa el contrato operativo que esas obligaciones ya requieren y no incorpora una nueva superficie ejecutable, esquema físico, permiso, algoritmo de negocio o efecto técnico adicional.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 45. Criterios de aceptación

- [x] se conserva la continuidad `TI-DOM-008 → TI-DOM-009 → TI-DOM-010`;
- [x] la tarea permanece exclusivamente documental;
- [x] se preservan las autoridades de `VPROC-0058`, `VPROC-0059` y `VPROC-0062`;
- [x] se define una identidad estable de cambio sin inventar un nuevo proceso empresarial;
- [x] se definen exactamente ocho dominios tecnológicos de cambio;
- [x] se definen exactamente tres clases de cambio;
- [x] `STANDARD` exige procedimiento, guardas, prueba y rollback previamente aprobados;
- [x] `EMERGENCY` acelera decisión sin eliminar controles;
- [x] se definen exactamente diez estados de ciclo de vida;
- [x] se preservan revisiones ante cambios materiales de alcance;
- [x] se definen exactamente ocho dimensiones de riesgo;
- [x] se definen exactamente cuatro niveles cualitativos de riesgo;
- [x] no se inventa un puntaje universal;
- [x] se materializa una matriz de autoridad por clase y riesgo;
- [x] la segregación detallada permanece en `TI-AUTH-001`;
- [x] se definen exactamente cinco estados de aprobación;
- [x] se materializan diez controles mínimos de ventana;
- [x] se definen freeze, excepciones y conflictos concurrentes;
- [x] se materializan nueve dimensiones del plan de prueba;
- [x] se define baseline previo y decisión go/no-go;
- [x] se separan commit, build, release, aprobación, despliegue y validación;
- [x] se preserva BLOQUE T como autoridad de release, CI, despliegue y rollback técnico;
- [x] se preserva E5 como autoridad de diseño de paquete, readiness, cutover, piloto e hypercare;
- [x] se preserva BLOQUE R como autoridad de migraciones Supabase dentro de paquetes autorizados;
- [x] se define gobierno de cambios de red, endpoint, impresora, configuración y proveedor aunque no exista commit;
- [x] se definen exactamente cuatro resultados de ejecución;
- [x] se materializan diez condiciones obligatorias del rollback;
- [x] el rollback conserva datos, compatibilidad y validación posterior;
- [x] se materializan ocho disparadores de revisión posterior reforzada;
- [x] se definen cuatro códigos de cierre;
- [x] se preservan handoffs hacia problema, observabilidad, recuperación, contratos, conocimiento, autorización e integraciones;
- [x] se reconcilia el AS-IS sin declarar implementado un gobierno transversal no demostrado;
- [x] los diez hallazgos tienen propietario y condición de salida;
- [x] no se ejecuta ningún cambio tecnológico;
- [x] no se crean ni modifican requisitos de prueba;
- [x] no se modifica Supabase;
- [x] `TI-DOM-010` permanece únicamente reservada.

---

#### 46. Continuidad

ÚLTIMA TAREA APROBADA
`TI-DOM-008 — Definir problema, causa raíz, error conocido, workaround y prevención de recurrencia`

TAREA ACTUAL APROBADA
`TI-DOM-009 — Definir cambio tecnológico, aprobación, ventana, prueba, despliegue, rollback y revisión posterior`

SIGUIENTE TAREA RESERVADA
`TI-DOM-010 — Definir monitoreo, eventos técnicos, alertas, logs, salud y observabilidad de servicios`


### ✅ TI-DOM-010 — Definir monitoreo, eventos técnicos, alertas, logs, salud y observabilidad de servicios

**Estado:** APROBADA
**Tarea anterior:** `TI-DOM-009 — Definir cambio tecnológico, aprobación, ventana, prueba, despliegue, rollback y revisión posterior` — APROBADA
**Tarea siguiente:** `TI-DOM-011 — Definir respaldo, restauración, recuperación técnica y relación con continuidad empresarial` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada del modelo operativo de observabilidad tecnológica, señales, salud, alertas, logs, correlación con servicios, incidentes y cambios
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/01_DOMINIO_DE_TECNOLOGIA_Y_SOPORTE.md`
**Artefactos producidos:** `TI-OBSERVABILITY-OPERATING-CONTRACT-001`; `TI-TECHNICAL-SIGNAL-CONTRACT-001`; `TI-SERVICE-HEALTH-MATRIX-001`; `TI-ALERT-GOVERNANCE-MATRIX-001`; `TI-LOGGING-EVIDENCE-CONTRACT-001`; `TI-CHANGE-OBSERVABILITY-CORRELATION-001`; `TI-OBSERVABILITY-ASIS-RECONCILIATION-001`
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, tablas, vistas, RLS, RPC, funciones, triggers, Edge Functions, migraciones, datos, dispositivos, redes, impresoras, aplicaciones, alertas productivas, herramientas externas, secretos, despliegues ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** materializar el contrato tecnológico que permite observar de manera coherente los once servicios `TI-SERVICE-*`, los siete tipos de elemento técnico ya definidos, las operaciones locales y las dependencias externas; conservar la separación entre señal, alerta, incidente, problema, cambio y continuidad; adoptar sin duplicar el contrato transversal de SLI/SLO ya aprobado; y fijar cómo se deriva salud, cómo se correlacionan eventos, cómo se gobiernan alertas, qué debe registrar un log y qué evidencia deberá conservarse antes de implementar adaptadores, tableros o automatizaciones.

---

#### 1. Resultado sustantivo

`TI-DOM-010` queda documentalmente cerrada con:

- un contrato operativo único de observabilidad tecnológica;
- una adopción explícita de `OBSERVABILITY-SLI-SLO-CONTRACT-001` como contrato transversal de SLI, SLO, umbrales, severidad y observabilidad;
- seis clases de señal conservadas: `INFO`, `WARNING`, `FAILURE`, `RECOVERY`, `SATURATION` y `SECURITY_SIGNAL`;
- siete formas de observación definidas para operación tecnológica: métrica, evento o transición, log, heartbeat, prueba sintética, resultado de operación y observación manual controlada;
- cinco estados de salud conservados: `HEALTHY`, `DEGRADED`, `OFFLINE`, `MISCONFIGURED` y `UNKNOWN`;
- ocho categorías de SLI conservadas y cuatro categorías obligatorias de SLO conservadas;
- un conjunto mínimo de doce familias métricas;
- un ciclo de alerta de seis etapas operativas, sin convertir señal en incidente por inferencia;
- una matriz materializada para los once servicios `TI-SERVICE-001` a `TI-SERVICE-011`;
- una matriz materializada para las siete clases de configuración de `TI-DOM-002`;
- correlación obligatoria entre observabilidad y cambio tecnológico antes, durante y después de la ventana;
- reglas de logging seguro y de evidencia que prohíben secretos y datos sensibles innecesarios;
- una reconciliación AS-IS contra código, migraciones y estado desplegado consultado en modo de solo lectura;
- cero cambios físicos;
- cero cambios en requisitos de prueba.

La tarea define el modelo operativo. No afirma que exista actualmente una plataforma unificada de monitoreo ni activa alarmas, integraciones, dashboards o recolección de telemetría en producción.

---

#### 2. Entradas canónicas conservadas

La tarea consume y conserva, sin redefinir su autoridad:

1. `TI-DOM-001` y las once familias `TI-SERVICE-001` a `TI-SERVICE-011`;
2. `TI-DOM-002` y `TI-CONFIGURATION-GRAPH-CONTRACT-001`, incluidas las clases `ASSET`, `ENDPOINT`, `SHARED_DEVICE`, `NETWORK_RESOURCE`, `PRINTER`, `APPLICATION` y `TECH_SERVICE`;
3. `TI-DOM-003` y su separación entre baseline deseado, estado observado, postura, frescura de evidencia, última comprobación y salud del endpoint;
4. `TI-DOM-004` y sus reglas de observación de red, donde conectado no equivale a saludable y ausencia de telemetría no equivale a salud;
5. `TI-DOM-005` y la separación entre impresora física, cola, routing, adaptador, trabajo y resultado;
6. `TI-DOM-006` y su catálogo de aplicaciones, ambientes, dependencias, proveedores y dependencia de observabilidad;
7. `TI-DOM-007` y la separación entre solicitud, incidente, prioridad, restauración, validación y cierre;
8. `TI-DOM-008` y la separación entre incidente, problema, causa, error conocido y workaround;
9. `TI-DOM-009` y la separación entre cambio requerido, aprobado, implementado y eficaz, con ventana, prueba, rollback y revisión posterior;
10. `CAP-SCOPE-015`, incluido el hallazgo de ausencia de monitoreo integrado para aplicaciones, endpoints, redes, impresoras, colas y servicios;
11. `NFR-REQ-009` y `OBSERVABILITY-SLI-SLO-CONTRACT-001`;
12. las cuarenta condiciones de prueba de observabilidad ya registradas desde `TREQ-PROC-461` hasta `TREQ-PROC-500`;
13. `VPROC-0058` como proceso propietario de solicitudes e incidentes tecnológicos en VISO;
14. NOTIFY-ARC como autoridad de transporte de notificaciones;
15. EVID-ARC como autoridad de evidencia transversal;
16. QUEUE-ARC como autoridad de colas transversales;
17. BLOQUE T como autoridad de pruebas, releases, despliegue y rollback de software;
18. E5 como autoridad de diseño de readiness, cutover, piloto e hypercare;
19. los contratos vigentes de autorización, dispositivos compartidos, impresión, integración y continuidad que producen o consumen señales técnicas.

Las referencias históricas de `NFR-REQ-009` a la familia `OBS-ARC-*` no se utilizan como propietario de ejecución de esta tarea: la ruta canónica vigente no materializa esa familia y las decisiones posteriores aprobadas de BLOQUE Z asignan operación de monitoreo y salud a `TI-DOM-010`, adaptadores de telemetría a `TI-INT-001`, experiencia de salud a `TI-UX-003` y protección de monitoreo y logs a `TI-AUTH-003` y `TI-AUTH-004`. No se crea una tarea nueva ni se altera la secuencia vigente por esa referencia histórica.

---

#### 3. Problema que se cierra

La línea base tecnológica contiene señales parciales, estados de objetos, eventos y logs de distintas fuentes, pero no un contrato único que responda de forma consistente:

```text
QUÉ SERVICIO SE OBSERVA
→ QUÉ ELEMENTO PRODUJO LA SEÑAL
→ QUÉ SE OBSERVÓ Y CUÁNDO
→ SI LA EVIDENCIA ES FRESCA
→ QUÉ SLI O REGLA SE AFECTA
→ SI EXISTE CANDIDATO DE ALERTA
→ SI LA ALERTA ES ACCIONABLE
→ SI SE CORRELACIONA CON INCIDENTE O CAMBIO
→ QUÉ EVIDENCIA QUEDA
→ QUIÉN DEBE ACTUAR
```

La respuesta canónica no es una tabla genérica de logs ni un proveedor externo convertido en fuente de verdad. Es una capa federada de observabilidad que referencia identidades y hechos ya propiedad de otros dominios.

---

#### 4. Contrato operativo `TI-OBSERVABILITY-OPERATING-CONTRACT-001`

Se fija la cadena operativa:

```text
FUENTE
→ SEÑAL
→ REGISTRO OBSERVABLE
→ CORRELACIÓN
→ SLI
→ SLO O REGLA OPERATIVA
→ UMBRAL / ESTADO DE CONSUMO
→ CANDIDATO DE ALERTA
→ ALERTA ACCIONABLE
→ INCIDENTE CUANDO CORRESPONDA
→ COMUNICACIÓN
→ MITIGACIÓN
→ RECUPERACIÓN
→ EVIDENCIA
→ APRENDIZAJE
```

Invariantes:

1. una señal no es una alerta;
2. una alerta no es un incidente;
3. un incidente no es una causa;
4. un SLI no es un SLO;
5. un SLO no es el SLA de servicio de `TI-DOM-007`;
6. un umbral no diagnostica automáticamente la causa;
7. `RECOVERY` no demuestra estabilidad sostenida;
8. un `HEALTHY` previo no permanece vigente cuando la evidencia requerida queda obsoleta;
9. una alarma cerrada no prueba que el problema fue eliminado;
10. observabilidad no concede autorización, no modifica configuración y no ejecuta un cambio;
11. los proveedores de monitoreo no se convierten en maestros de servicio, activo, identidad, incidente o cambio;
12. una ausencia de señales esperadas se vuelve evidencia de incertidumbre, no evidencia de salud.

---

#### 5. Objetos observables y autoridad

La observabilidad se proyecta sobre identidades existentes. No crea identidades técnicas paralelas.

| Objeto observado       | Identidad o autoridad conservada              | Qué puede aportar observabilidad                                                                | Qué no puede concluir por sí sola                           |
| ---------------------- | --------------------------------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------- |
| Servicio tecnológico   | `TI-SERVICE-*`                                | salud derivada, SLI, tendencia, alertas, dependencias afectadas                                 | prioridad de incidente, SLA o continuidad                   |
| Activo físico          | NEXO / `ASSET`                                | condición observada, disponibilidad física reportada, mantenimiento o pérdida de señal          | identidad de endpoint o estado lógico                       |
| Endpoint               | `ENDPOINT` / `TI-DOM-003`                     | última comprobación, postura, baseline, actualización, disponibilidad y frescura                | autorización del actor o propiedad física                   |
| Dispositivo compartido | `SHARED_DEVICE`                               | heartbeat, última presencia, fallas locales, versión de cliente, sesión técnica correlacionable | identidad del trabajador ni sus permisos                    |
| Recurso de red         | `NETWORK_RESOURCE`                            | reachability, latencia, pérdida, saturación, drift y evidencia de conectividad                  | salud de una aplicación solo porque hay red                 |
| Impresora              | `PRINTER` + NEXO + PRINT-ARC                  | heartbeat, conectividad, estado técnico, cola, resultado y error correlacionados                | éxito del hecho empresarial que originó el documento        |
| Aplicación             | `APPLICATION` / SHELL + propietaria funcional | disponibilidad, latencia, error, versión, entorno y dependencia                                 | disponibilidad por la sola existencia del registro          |
| Cola o integración     | QUEUE-ARC / contratos X                       | backlog, edad, error, reintento, latencia, resultado y recuperación                             | propiedad del proceso empresarial                           |
| Proveedor externo      | contrato propietario                          | disponibilidad reportada, error, latencia, cuota o incidente externo correlacionado             | autoridad sobre identidad, contrato, costo o cierre interno |

Cuando una señal apunte a un elemento del grafo de `TI-DOM-002`, deberá conservar clase e identidad canónica del nodo. La observación no fusiona activo, endpoint, dispositivo, red, impresora, aplicación o servicio.

---

#### 6. Contrato de señal `TI-TECHNICAL-SIGNAL-CONTRACT-001`

Toda señal que pretenda participar en salud, alerta, diagnóstico o evidencia deberá poder reconstruir, cuando aplique:

| Dato                 | Regla                                                                                                                     |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| Momento observado    | instante en que ocurrió o fue medido el hecho                                                                             |
| Momento recibido     | instante en que Vento recibió la señal                                                                                    |
| Clase de señal       | una de las seis clases canónicas                                                                                          |
| Forma de observación | métrica, evento/transición, log, heartbeat, prueba sintética, resultado de operación u observación manual                 |
| Clase de fuente      | aplicación, endpoint, dispositivo, red, impresora, cola, proveedor, base de datos, integración u otra fuente identificada |
| Fuente               | identidad estable o referencia verificable de la fuente                                                                   |
| Servicio             | `TI-SERVICE-*` cuando la relación esté demostrada                                                                         |
| Elemento técnico     | clase e identidad de configuración cuando aplique                                                                         |
| Ambiente             | ambiente técnico cuando exista                                                                                            |
| Sede o área          | contexto territorial solo cuando tenga semántica para la señal                                                            |
| Clave de correlación | valor estable que permita unir intentos, eventos o estados de la misma operación                                          |
| Resumen              | descripción breve no sensible                                                                                             |
| Medición             | valor y unidad cuando la señal sea cuantitativa                                                                           |
| Detalle estructurado | contexto mínimo para diagnóstico sin secretos                                                                             |
| Evidencia            | referencia al soporte probatorio cuando deba conservarse                                                                  |
| Sensibilidad         | regla de enmascaramiento o restricción aplicable                                                                          |
| Frescura             | vigente, retrasada, obsoleta o desconocida según el contrato de la fuente                                                 |
| Cambio relacionado   | referencia al cambio cuando la señal ocurra en una ventana controlada                                                     |
| Caso relacionado     | referencia a solicitud, incidente o problema únicamente cuando exista correlación real                                    |

No se infieren relaciones únicamente por nombre, IP, serial, URL, sede o coincidencia temporal.

---

#### 7. Clases y formas de señal

Se conservan las seis clases de `OBSERVABILITY-SLI-SLO-CONTRACT-001`:

| Clase             | Uso                                                                                                              |
| ----------------- | ---------------------------------------------------------------------------------------------------------------- |
| `INFO`            | hecho técnico útil que no representa por sí mismo degradación                                                    |
| `WARNING`         | condición que requiere atención o tendencia de riesgo                                                            |
| `FAILURE`         | fallo observado de una operación, componente o capacidad                                                         |
| `RECOVERY`        | recuperación observada de una condición previa                                                                   |
| `SATURATION`      | agotamiento o presión de capacidad                                                                               |
| `SECURITY_SIGNAL` | señal con relevancia de seguridad que requiere evaluación y no equivale automáticamente a incidente de seguridad |

Las formas de observación son:

1. **métrica:** medición numérica periódica o por operación;
2. **evento o transición:** cambio de estado o hecho discreto;
3. **log:** registro contextual de una operación o error;
4. **heartbeat:** evidencia periódica de presencia o capacidad de reportar;
5. **prueba sintética:** comprobación controlada diferenciada del tráfico real;
6. **resultado de operación:** éxito, error o resultado desconocido de una acción concreta;
7. **observación manual controlada:** captura humana con actor, método, momento y evidencia.

La forma no determina severidad. Un heartbeat recibido puede ser `INFO`; su ausencia puede producir `UNKNOWN` o un candidato de alerta según la frescura esperada.

---

#### 8. Semántica temporal y orden de eventos

Se conservan como tiempos distintos:

- `ObservedAt`: cuando ocurrió o se midió el hecho;
- `ReceivedAt`: cuando la plataforma recibió la señal;
- `StartedAt`: inicio de una condición;
- `LastObservedAt`: última evidencia de que la condición seguía presente;
- `ResolvedAt`: evidencia de recuperación o resolución de la condición.

Reglas:

1. el instante canónico se conserva en UTC mediante una representación equivalente a `timestamptz`;
2. la presentación territorial usa la zona IANA de la sede cuando corresponda;
3. la hora declarada por un cliente o dispositivo no es autoridad única;
4. drift de reloj, backfill, retraso y llegada fuera de orden deben ser detectables;
5. una señal tardía no reescribe silenciosamente el presente;
6. la línea de tiempo de VISO debe poder ordenar hechos por tiempo observado y distinguir el tiempo de recepción;
7. la correlación no depende de que dos señales hayan llegado en el mismo orden.

---

#### 9. Salud de elemento y salud de servicio

Se conservan cinco estados:

| Estado          | Significado operativo                                                                                                                                     |
| --------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `HEALTHY`       | existe evidencia fresca y suficiente de que las capacidades observadas cumplen su condición esperada                                                      |
| `DEGRADED`      | la capacidad continúa parcialmente disponible, pero existe incumplimiento, reducción, error repetido, retraso, saturación o pérdida de calidad demostrada |
| `OFFLINE`       | existe evidencia suficiente de indisponibilidad de la capacidad observada                                                                                 |
| `MISCONFIGURED` | la configuración observada diverge del perfil esperado de manera demostrable                                                                              |
| `UNKNOWN`       | la evidencia es ausente, obsoleta, contradictoria o insuficiente para concluir salud                                                                      |

Reglas:

1. `UNKNOWN` es un estado válido y preferible a fabricar `HEALTHY`;
2. `MISCONFIGURED` describe conformidad de configuración del elemento; el efecto sobre el servicio puede ser `DEGRADED`, `OFFLINE` o todavía no demostrado;
3. salud de componente y salud de servicio no se confunden;
4. un servicio no adopta automáticamente el peor estado de todos sus componentes; deberá distinguir dependencia crítica, redundancia, alcance e impacto;
5. un servicio tampoco puede ignorar un componente crítico porque otra señal esté verde;
6. estado deseado, estado observado, excepción y salud permanecen separados;
7. el estado deberá declarar fuente y frescura;
8. el cambio de estado genera un evento observable;
9. la recuperación de una señal no cierra por sí sola un incidente;
10. un recurso alcanzable no se presume correctamente configurado.

---

#### 10. SLI y SLO adoptados

`TI-DOM-010` adopta las ocho categorías de SLI ya aprobadas:

1. disponibilidad;
2. integridad;
3. rendimiento;
4. capacidad;
5. frescura;
6. confiabilidad;
7. observabilidad;
8. resultado humano.

Para cada flujo crítico deberán existir, cuando aplique, cuatro categorías de SLO:

1. disponibilidad;
2. integridad;
3. rendimiento o capacidad;
4. observabilidad.

Cada SLO deberá conservar:

- objetivo;
- ventana;
- población;
- exclusiones;
- muestra mínima;
- retraso permitido de datos;
- condición de incumplimiento;
- consecuencia operativa.

Los SLO técnicos no reemplazan los SLA de atención definidos por `TI-DOM-007`. El SLA gobierna compromiso de atención; el SLO describe objetivo técnico medible.

---

#### 11. Conjunto mínimo de métricas

El conjunto mínimo adoptado es:

1. latencia `p50`, `p95` y `p99` cuando exista población suficiente;
2. razón de éxito empresarial;
3. razón de error por código o clase;
4. throughput;
5. tamaño y edad de backlog;
6. cantidad de reintentos o reprocesos;
7. cumplimiento de SLI/SLO y burn rate cuando exista SLO;
8. salud de dispositivo local;
9. disponibilidad de integración o workflow;
10. razón de captura exitosa de evidencia;
11. frescura de sincronización o lag de replicación cuando aplique;
12. cantidad de excepciones observacionales o manuales cuando no exista métrica automática.

No se exige que toda fuente produzca las doce métricas. Cada servicio seleccionará las aplicables y justificará `NO_APLICA` para las restantes durante su paquete de implementación.

---

#### 12. Baseline provisional y umbrales

Mientras no exista suficiente historia operacional, se conservan como referencias provisionales, no como SLO finales:

| Condición                     | Referencia inicial                                                  |
| ----------------------------- | ------------------------------------------------------------------- |
| Caída sostenida de throughput | reducción igual o superior al 20 % frente a la referencia aplicable |
| Degradación de latencia       | `p95` por encima de la referencia inicial durante cinco minutos     |
| Saturación                    | 80 % como advertencia y 90 % como candidato crítico                 |
| Captura de evidencia          | razón inferior a `0.99`                                             |
| Backlog                       | tamaño o edad por encima del baseline del servicio                  |
| Drift                         | diferencia superior a la tolerancia aprobada del objeto             |
| Falla de dispositivo local    | repetición dentro de una ventana de diez minutos                    |

Reglas:

1. estas referencias son transitorias hasta que exista baseline histórico suficiente;
2. no se aplican ciegamente a todos los servicios;
3. eventos de integridad crítica pueden requerir tolerancia cero a pérdida silenciosa;
4. percentiles solo se interpretan con muestra suficiente;
5. backlog se evalúa por cantidad y edad;
6. error repetido requiere frecuencia y ventana;
7. la fuente del umbral debe quedar explícita;
8. un umbral sin propietario, destinatario o acción no constituye una alerta operativa.

---

#### 13. Ciclo de alerta `TI-ALERT-GOVERNANCE-MATRIX-001`

Se adopta el ciclo:

```text
CANDIDATO
→ SUPRIMIDO O DEDUPLICADO, SI APLICA
→ ACTIVO Y ACCIONABLE
→ ACK
→ CORRELACIONADO CON INCIDENTE, CUANDO CORRESPONDA
→ CLEAR / CIERRE DE LA ALERTA
```

La recuperación puede ocurrir antes o después de que exista incidente y deberá conservarse como hecho.

Toda regla de alerta deberá declarar, como mínimo:

1. identidad única de la regla;
2. condición de activación;
3. fuente o SLI;
4. severidad;
5. propietario;
6. destinatario;
7. canal;
8. intervalo de deduplicación;
9. regla de inhibición o silencio;
10. ruta de escalamiento;
11. runbook;
12. relación esperada con incidente;
13. fecha o condición de revisión;
14. comportamiento cuando falle el canal de notificación.

Una regla sin destinatario y sin canal verificable no se considera operativa.

---

#### 14. Deduplicación, inhibición, silencio y mantenimiento

1. señales originales no se eliminan por deduplicación;
2. la deduplicación agrupa candidatos equivalentes por regla, recurso, correlación y ventana;
3. un cambio o mantenimiento planificado puede inhibir una alerta si la regla lo permite;
4. la inhibición no convierte un fallo en éxito;
5. la ventana aprobada de `TI-DOM-009` deberá correlacionarse con las señales que cambien durante el trabajo;
6. un silencio deberá conservar alcance, razón, actor autorizado, inicio y fin;
7. un silencio vencido deja de inhibir;
8. una señal de seguridad no se silencia por mera conveniencia operativa;
9. una señal `RECOVERY` deberá seguir siendo registrable durante una ventana silenciada;
10. una condición que exceda el efecto esperado del cambio puede reactivar alertamiento aunque exista mantenimiento planificado.

---

#### 15. Severidad de alerta

Se conservan cuatro niveles:

| Severidad | Criterio general                                                                                                                    |
| --------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `SEV1`    | interrupción crítica, pérdida de una capacidad esencial, riesgo material de integridad o seguridad, o afectación empresarial severa |
| `SEV2`    | degradación significativa con impacto alto, pero con operación parcial o mitigación disponible                                      |
| `SEV3`    | degradación moderada, error localizado o riesgo que requiere atención programada                                                    |
| `SEV4`    | información operativa, anomalía de bajo impacto o seguimiento preventivo                                                            |

La severidad de una alerta no reemplaza el cálculo de impacto, urgencia y prioridad del incidente. Cuando se cree un incidente, `TI-DOM-007` calcula la prioridad con su propio contrato.

---

#### 16. Correlación con solicitud, incidente y problema

```text
SEÑAL
≠ ALERTA
≠ INCIDENTE
≠ PROBLEMA
```

Reglas:

1. una señal puede existir sin caso;
2. un candidato de alerta puede ser deduplicado o suprimido sin crear incidente;
3. una alerta activa crea o se correlaciona con incidente únicamente cuando la regla y el impacto lo requieren;
4. el incidente conserva `VPROC-0058` y la identidad de VISO;
5. la alerta conserva vínculo con el servicio y elemento afectado;
6. el incidente puede consumir múltiples alertas;
7. una alerta puede correlacionarse con un incidente existente en lugar de duplicarlo;
8. recurrencia, patrón o causa desconocida se transfieren a `TI-DOM-008`;
9. resolución del incidente no elimina la historia de señales;
10. un problema puede seguir observando señales después de restaurar el servicio.

---

#### 17. Correlación con cambio `TI-CHANGE-OBSERVABILITY-CORRELATION-001`

Todo cambio de `TI-DOM-009` que afecte un servicio observable deberá definir qué se observará antes, durante y después.

| Momento            | Evidencia mínima                                                                                                            |
| ------------------ | --------------------------------------------------------------------------------------------------------------------------- |
| Antes de ventana   | baseline disponible, salud actual, señales críticas, dependencias y evidencia de que el monitoreo requerido está disponible |
| Inicio             | identificación del cambio, ventana, elementos afectados y momento efectivo de inicio                                        |
| Durante            | variación de métricas, errores, saturación, salud, alertas y operaciones fallidas relacionadas                              |
| Validación         | comparación contra baseline y criterios de éxito de la prueba                                                               |
| Rollback           | disparador, estado que motivó reversión, ejecución y señales posteriores                                                    |
| Estabilización     | observación suficiente para distinguir recuperación puntual de estabilidad                                                  |
| Revisión posterior | tendencias, alertas, incidentes, drift, regresiones y efecto empresarial correlacionados                                    |

Una métrica favorable no convierte por sí sola un cambio en eficaz. La revisión posterior conserva la decisión de `TI-DOM-009`.

---

#### 18. Logging seguro `TI-LOGGING-EVIDENCE-CONTRACT-001`

Un log técnico deberá conservar únicamente el contexto necesario para reconstruir operación y diagnóstico.

Campos mínimos cuando apliquen:

- timestamp;
- proceso, servicio u operación;
- fuente;
- actor o principal técnico;
- elemento técnico;
- correlation id;
- resultado;
- código o clase de error;
- versión o ambiente;
- referencia al cambio o incidente cuando exista;
- contexto estructurado minimizado;
- clasificación de sensibilidad.

Queda prohibido registrar en texto claro o payload ordinario:

- contraseñas;
- tokens completos;
- secretos;
- OTP;
- códigos de recuperación MFA;
- credenciales privilegiadas;
- datos de pago;
- datos personales completos cuando no sean necesarios;
- secretos embebidos en URLs;
- dumps indiscriminados de cabeceras, cookies o variables de ambiente;
- configuraciones completas que contengan credenciales.

Los logs de diagnóstico sensibles requieren autorización específica. La definición detallada de acceso corresponde a `TI-AUTH-004`.

---

#### 19. Evidencia frente a log operativo

```text
LOG OPERATIVO
≠ EVIDENCIA CANÓNICA
```

1. un log puede aportar evidencia, pero no toda línea de log debe preservarse como expediente;
2. EVID-ARC conserva la evidencia que requiera permanencia empresarial;
3. una captura o exportación de diagnóstico debe minimizar datos antes de adjuntarse a un caso;
4. eliminar ruido de un dashboard no elimina el hecho histórico que deba conservarse;
5. una observación manual solo se acepta si identifica actor, método, momento, fuente y resultado;
6. una observación manual no puede presentarse como telemetría automática;
7. el acceso a logs sensibles deberá ser auditable;
8. el usuario final no recibe trazas internas, IP, tokens, payloads o errores técnicos que no necesite para actuar.

---

#### 20. Observabilidad de los once servicios

`TI-SERVICE-001` a `TI-SERVICE-011` se conservan sin renombrar y reciben una decisión explícita.

| Servicio         | Servicio canónico                                                       | Observación primaria                                      | Señales o indicadores relevantes                                                                                                    | Propietario de profundización                            |
| ---------------- | ----------------------------------------------------------------------- | --------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------- |
| `TI-SERVICE-001` | Cuentas, identidad y acceso tecnológico                                 | disponibilidad y resultado del ciclo autorizado de acceso | autenticación, MFA cuando aplique, aprovisionamiento, revocación, error técnico, dependencia de aplicación y evidencia de ejecución | `TI-AUTH-001`; `TI-AUTH-002`; `TI-INT-002`; `TI-INT-003` |
| `TI-SERVICE-002` | Endpoints, computadores, celulares, tabletas y dispositivos compartidos | salud y frescura de endpoint/dispositivo                  | última comprobación, postura, baseline, versión, actualización, heartbeat, fallas locales y disponibilidad de señal                 | `TI-DOM-003`; `TI-INT-001`; `TI-AUTH-003`                |
| `TI-SERVICE-003` | Redes y conectividad                                                    | disponibilidad y calidad de conectividad                  | enlace, reachability, latencia, pérdida, saturación, drift, segmento, AP y dependencia de sede/servicio                             | `TI-DOM-004`; `TI-INT-001`; `TI-DOM-011`                 |
| `TI-SERVICE-004` | Impresoras y periféricos                                                | salud de impresora y camino de impresión                  | heartbeat, conectividad, cola, edad, resultado, error, adaptador, routing y falla local o de red                                    | `TI-DOM-005`; PRINT-ARC; `TI-INT-001`                    |
| `TI-SERVICE-005` | Aplicaciones, ambientes y proveedores tecnológicos                      | disponibilidad y rendimiento de la capacidad publicada    | disponibilidad, error, latencia, versión, ambiente, integración, proveedor y dependencia crítica                                    | `TI-DOM-006`; `TI-INT-001`; `TI-INT-003`                 |
| `TI-SERVICE-006` | Solicitudes de soporte tecnológico                                      | salud del flujo de atención                               | backlog, edad, asignación, comunicaciones, acciones pendientes y dependencia del servicio afectado                                  | `TI-DOM-007`; `TI-UX-002`                                |
| `TI-SERVICE-007` | Incidentes y restauración tecnológica                                   | estado del servicio afectado y evolución de restauración  | salud del servicio, alertas correlacionadas, degradación, recuperación, recurrencia y evidencia de validación                       | `TI-DOM-007`; `TI-DOM-008`; `TI-UX-004`                  |
| `TI-SERVICE-008` | Cambios, configuración y versiones tecnológicas                         | comportamiento antes, durante y después del cambio        | baseline, drift, error, latencia, alertas, rollback, estabilización y revisión posterior                                            | `TI-DOM-009`; BLOQUE T; `TI-UX-004`                      |
| `TI-SERVICE-009` | Pruebas y aceptación técnica de soluciones                              | disponibilidad y resultado verificable de pruebas         | ejecución, resultado, evidencia, compatibilidad, hardware, red, impresión, recuperación y observabilidad requerida                  | E5; BLOQUE T; BLOQUE U                                   |
| `TI-SERVICE-010` | Licencias, garantías, contratos y costos tecnológicos                   | condiciones técnicas que pueden afectar disponibilidad    | vigencia, asiento o uso cuando aplique, renovación, garantía, proveedor y evento de expiración o restricción                        | `TI-DOM-012`; ORIGO; NUMERA; `TI-INT-003`                |
| `TI-SERVICE-011` | Conocimiento, capacitación y adopción tecnológica                       | disponibilidad y vigencia del soporte guiado              | presencia de runbook, versión relacionada, cambios comunicados, material disponible y señal de adopción cuando exista               | `TI-DOM-013`; `TI-UX-006`                                |

Cobertura materializada: **11 de 11 servicios**, sin faltantes ni duplicados.

---

#### 21. Observabilidad de las siete clases de configuración

| Clase              | Señales principales                                                                            | Regla de interpretación                                              |
| ------------------ | ---------------------------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `ASSET`            | condición física reportada, mantenimiento, disponibilidad o falla demostrada                   | no determina salud de endpoint por sí sola                           |
| `ENDPOINT`         | última evaluación, postura, baseline, versión, parche, cifrado, disponibilidad y frescura      | sin evidencia fresca, la salud no se presume                         |
| `SHARED_DEVICE`    | heartbeat, `last_seen`, sesión técnica, versión de cliente, fallas locales, operación reciente | actor humano y dispositivo permanecen separados                      |
| `NETWORK_RESOURCE` | reachability, latencia, pérdida, saturación, drift, estado observado                           | interfaz activa no demuestra conectividad extremo a extremo          |
| `PRINTER`          | heartbeat, conectividad, resultado de trabajo, cola, error y ruta                              | impresora disponible no demuestra entrega empresarial correcta       |
| `APPLICATION`      | disponibilidad, latencia, error, versión, ambiente, proveedor y dependencias                   | registro activo no equivale a disponibilidad operativa               |
| `TECH_SERVICE`     | SLI, SLO, dependencias críticas, alertas, incidentes, cambios y tendencias                     | salud es una proyección explicable, no una fuente de verdad paralela |

Cobertura materializada: **7 de 7 clases**.

---

#### 22. Dispositivos locales y estación compartida

Una estación o dispositivo local deberá poder correlacionar, cuando aplique:

- `device_code`;
- identidad del endpoint;
- red o dirección observada sin convertir IP en identidad;
- versión de navegador o aplicación;
- periférico o cola relacionada;
- perfil esperado;
- heartbeat;
- última operación exitosa;
- cola local;
- última sincronización;
- última evaluación de postura.

Reglas:

1. una falla local debe distinguirse de una falla de backend;
2. pérdida de red debe distinguirse de aplicación caída;
3. periférico desconectado debe distinguirse de cola bloqueada;
4. configuración incorrecta puede producir `MISCONFIGURED`;
5. ausencia prolongada de heartbeat produce incertidumbre conforme al contrato de frescura, no una presunción automática de `OFFLINE`;
6. soporte remoto no se habilita por el solo estado de salud;
7. el trabajador activo no hereda privilegios técnicos del dispositivo.

---

#### 23. Redes

La observación de red deberá permitir distinguir:

- enlace;
- equipo;
- interfaz;
- segmento o VLAN;
- SSID;
- direccionamiento o reserva;
- reachability;
- latencia;
- pérdida;
- saturación;
- configuración esperada frente a observada;
- cambio activo;
- dependencia de servicio.

Invariantes:

1. conectado no equivale a saludable;
2. interfaz `up` no prueba conectividad extremo a extremo;
3. Internet disponible no prueba disponibilidad de servicios internos;
4. equipo alcanzable no prueba configuración correcta;
5. ausencia de telemetría es ausencia de evidencia;
6. la telemetría no almacena PSK, claves, secretos o configuraciones completas;
7. pruebas sintéticas se distinguen de tráfico real;
8. monitoreo de red no sustituye diagnóstico de endpoint, aplicación, impresora o proveedor.

---

#### 24. Impresión y periféricos

La observabilidad de impresión conserva:

```text
IMPRESORA
≠ COLA
≠ ROUTING
≠ ADAPTADOR
≠ TRABAJO
≠ RESULTADO
```

Debe ser posible distinguir:

- impresora no disponible;
- impresora disponible pero mal configurada;
- red no disponible;
- cola con backlog;
- trabajo en reintento;
- adaptador no disponible;
- resultado desconocido;
- trabajo enviado pero no confirmado;
- error de formato o capacidad;
- recuperación técnica.

PRINT-ARC conserva el trabajo y resultado de impresión. `TI-DOM-010` únicamente define cómo esos hechos participan en salud, alerta y diagnóstico.

---

#### 25. Aplicaciones, colas, integraciones y proveedores

Para aplicaciones y servicios remotos se observarán, cuando apliquen:

- disponibilidad;
- latencia;
- razón de éxito;
- razón de error;
- throughput;
- backlog;
- edad de backlog;
- reintentos;
- respuesta de dependencia;
- versión o ambiente;
- cuota o saturación;
- frescura;
- resultado desconocido;
- estado reportado por proveedor.

Reglas:

1. métrica del proveedor no sustituye evidencia interna del efecto;
2. status page externa no cierra un incidente interno;
3. fallo de pool o base de datos debe distinguirse de error empresarial;
4. error de integración debe conservar contrato y correlación;
5. reintentos no pueden duplicar efectos;
6. los adaptadores específicos pertenecen a `TI-INT-001` a `TI-INT-003`;
7. secretos de proveedor no aparecen en logs o casos.

---

#### 26. Notificación y escalamiento

NOTIFY-ARC conserva transporte y entrega. La alerta conserva verdad operativa.

Secuencia:

```text
ALERTA ACCIONABLE
→ SELECCIÓN DE DESTINATARIO
→ CANAL PRIMARIO
→ FALLBACK CONTROLADO SI CORRESPONDE
→ EVIDENCIA DE ENTREGA
→ ACK CUANDO SEA REQUERIDO
```

El baseline de canal mantiene:

```text
push / in-app
→ email
→ contingencia manual controlada
```

El fallo de notificación es un hecho observable distinto de la condición técnica que originó la alerta. No se cierra la alerta porque falló el canal.

---

#### 27. Experiencia operativa

La experiencia se divide:

**Trabajador:**
- estado comprensible;
- efecto operativo;
- acción segura disponible;
- referencia al caso cuando exista;
- sin trazas sensibles.

**Responsable tecnológico o VISO autorizado:**
- servicio;
- elemento;
- origen;
- alcance;
- inicio;
- estado actual;
- impacto;
- propietario;
- acción siguiente;
- alertas relacionadas;
- incidente o cambio relacionado;
- tendencia reciente;
- evidencia disponible según autorización.

La materialización de pantallas corresponde a `TI-UX-003` y `TI-UX-004`. Esta tarea no crea interfaz.

---

#### 28. Seguridad de monitoreo y diagnóstico

La observabilidad aplica mínimo privilegio.

1. ver estado resumido no autoriza ver logs completos;
2. diagnosticar no autoriza cambiar configuración;
3. abrir un log no autoriza exportarlo;
4. una herramienta externa recibe solo el alcance y credencial estrictamente necesarios;
5. credenciales técnicas no se reutilizan como permisos empresariales;
6. acceso extraordinario deberá ser temporal y trazable;
7. toda elevación permanece bajo `TI-AUTH-002`;
8. configuración de monitoreo queda bajo `TI-AUTH-003`;
9. logs, exportaciones, capturas y datos sensibles quedan bajo `TI-AUTH-004`;
10. la señal conserva suficiente contexto para diagnosticar sin exponer secretos.

---

#### 29. Reconciliación AS-IS `TI-OBSERVABILITY-ASIS-RECONCILIATION-001`

La inspección de solo lectura del repositorio y del proyecto desplegado permite materializar el siguiente estado sin asumir capacidades no demostradas:

| Elemento                                           | Estado                                                  | Evidencia o límite                                                                                                                                                         |
| -------------------------------------------------- | ------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Contrato transversal SLI/SLO                       | `ESPECIFICADO`                                          | `OBSERVABILITY-SLI-SLO-CONTRACT-001` ya define envelope, SLI, SLO, alertas, salud, logging y métricas mínimas                                                              |
| Observabilidad tecnológica de los once servicios   | `ESPECIFICADO`                                          | esta tarea materializa el modelo; no existe evidencia de una implementación transversal completa                                                                           |
| `shared_operational_devices.last_seen_at`          | `IMPLEMENTADO` parcialmente                             | la columna existe; en la inspección desplegada se observaron 2 dispositivos y 0 con `last_seen_at` informado                                                               |
| Eventos de dispositivo compartido                  | `IMPLEMENTADO` parcialmente                             | existe `shared_operational_device_events`; se observaron 3 filas, sin asumir que constituyan telemetría de salud completa                                                  |
| Mesa de soporte AS-IS                              | `IMPLEMENTADO` parcialmente                             | se observaron 2 `support_tickets` y 4 `support_messages`; la estructura básica no demuestra incidente, alerta o observabilidad completos                                   |
| Registro de dispositivos de trabajador             | `IMPLEMENTADO` como estructura, sin población observada | `employee_devices` existe y se observaron 0 registros                                                                                                                      |
| Impresión en esquema desplegado inspeccionado      | `IMPLEMENTADO` parcialmente                             | se observó `printing_label_templates` con 1 fila; la búsqueda de tablas por nombres de monitoreo/alerta/health no demostró un registro transversal de runtime de impresión |
| Auditoría de Auth                                  | `IMPLEMENTADO` por la plataforma                        | `auth.audit_log_entries` existe; no se promueve a log tecnológico empresarial general                                                                                      |
| Tabla transversal dedicada de monitor/health/alert | `PENDIENTE_DE_EVIDENCIA`                                | la inspección por nombres en `public`, `auth`, `storage` y `realtime` no localizó una estructura dedicada; esto no prueba ausencia de telemetría externa                   |
| Plataforma externa unificada de observabilidad     | `PENDIENTE_DE_EVIDENCIA`                                | la búsqueda específica en `vento-shell` no localizó referencias a Sentry, OpenTelemetry, Prometheus, Grafana o Datadog; no se infiere inexistencia fuera del repositorio   |
| Adaptadores tecnológicos de telemetría             | `FUERA_DE_ALCANCE` de esta tarea                        | propietario documental: `TI-INT-001` a `TI-INT-003`                                                                                                                        |
| Panel operativo de salud                           | `FUERA_DE_ALCANCE` de esta tarea                        | propietario documental: `TI-UX-003`; flujos correlacionados: `TI-UX-004`                                                                                                   |
| Autorización sobre monitoreo y logs                | `FUERA_DE_ALCANCE` de esta tarea                        | propietario documental: `TI-AUTH-003` y `TI-AUTH-004`                                                                                                                      |
| Implementación física transversal                  | `NO_APLICA` en esta tarea                               | la fase actual es documental; cualquier implementación requiere alcance de implementación autorizado                                                                       |

No se interpreta la ausencia de una tabla dedicada como ausencia absoluta de logs o métricas. Solo se concluye que la evidencia inspeccionada no demuestra una plataforma tecnológica transversal ya materializada.

---

#### 30. Brechas y destinos documentales

| Brecha o resultado pendiente                                                           | Estado                        | Propietario exacto                                                          | Condición de salida                                                                 |
| -------------------------------------------------------------------------------------- | ----------------------------- | --------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| Adaptadores de telemetría para endpoint, red, impresora, aplicación y servicio externo | `FUERA_DE_ALCANCE`            | `TI-INT-001`                                                                | contrato por fuente, autenticación, reloj, retries, idempotencia y mapping aprobado |
| Contratos de integración con fuentes Vento                                             | `FUERA_DE_ALCANCE`            | `TI-INT-002`                                                                | interfaces y propietarios por sistema aprobados                                     |
| Integraciones con MDM, soporte remoto, ISP, fabricantes y licenciamiento               | `FUERA_DE_ALCANCE`            | `TI-INT-003`                                                                | proveedor, alcance, credencial, eventos y conciliación definidos                    |
| Mapa y panel de salud técnica                                                          | `FUERA_DE_ALCANCE`            | `TI-UX-003`                                                                 | experiencia de dispositivos, redes, impresoras, aplicaciones y salud aprobada       |
| Flujos visuales de incidente, problema, cambio, mantenimiento y recuperación           | `FUERA_DE_ALCANCE`            | `TI-UX-004`                                                                 | correlación y acciones operativas aprobadas                                         |
| Gobierno de configuración de monitoreo                                                 | `FUERA_DE_ALCANCE`            | `TI-AUTH-003`                                                               | capacidades y segregación autorizadas                                               |
| Acceso a logs y diagnósticos sensibles                                                 | `FUERA_DE_ALCANCE`            | `TI-AUTH-004`                                                               | política de acceso, masking, exportación y auditoría aprobada                       |
| Señales de respaldo, restauración y recuperación                                       | `FUERA_DE_ALCANCE`            | `TI-DOM-011`                                                                | contrato de respaldo y restauración aprobado                                        |
| Señales de licencias, garantías, contratos, renovaciones, uso y costo                  | `FUERA_DE_ALCANCE`            | `TI-DOM-012`                                                                | modelo contractual y económico aprobado                                             |
| Runbooks, conocimiento y aprendizaje                                                   | `FUERA_DE_ALCANCE`            | `TI-DOM-013`                                                                | base de conocimiento y gobierno de capacitación aprobados                           |
| Implementación física del alcance tecnológico aplicable al carril                      | `NO_APLICA` en la fase actual | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` si resulta aprobado | alcance de implementación explícitamente aprobado antes de cambios físicos          |

No queda una brecha de esta tarea sin propietario documental.

---

#### 31. Frontera con respaldo y continuidad

`TI-DOM-010` puede observar:

- ejecución reportada de backup;
- fallo técnico de una tarea de backup;
- frescura de última ejecución;
- disponibilidad de una señal de restauración;
- estado de infraestructura necesaria para recuperar.

No define:

- política de respaldo;
- RTO;
- RPO;
- alcance de copias;
- restauración;
- recuperación técnica;
- activación de continuidad empresarial.

Esos resultados pertenecen a `TI-DOM-011` y a las tareas canónicas de continuidad. Un backup marcado como exitoso no equivale a restauración comprobada.

---

#### 32. Frontera con licencias y contratos

`TI-DOM-010` puede recibir o enrutar señales como:

- vigencia próxima;
- asiento sin uso;
- cuota o límite;
- fallo del proveedor;
- garantía próxima a vencer;
- restricción del plan;
- alerta contractual ya originada por su autoridad.

No calcula compromiso, gasto o costo ni redefine contrato. `TI-DOM-012`, ORIGO y NUMERA conservan esas autoridades.

---

#### 33. Frontera con conocimiento

Toda alerta accionable deberá disponer de runbook cuando el riesgo o frecuencia lo requiera.

`TI-DOM-010` conserva la referencia al runbook y su versión. `TI-DOM-013` gobierna:

- creación;
- publicación;
- mantenimiento;
- capacitación;
- adopción;
- comunicación de cambios tecnológicos.

Un runbook existente no prueba que la causa esté diagnosticada y una capacitación no modifica la salud técnica.

---

#### 34. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea especializa documentalmente para tecnología un contrato de observabilidad y un conjunto de condiciones verificables ya materializados previamente en el registro canónico. No introduce una condición ejecutable adicional, no modifica la semántica de las pruebas existentes y no autoriza implementación física. Las matrices de esta tarea asignan esas condiciones existentes a servicios, elementos técnicos y handoffs sin crear comportamiento nuevo que requiera otra identidad de prueba.

---

#### 35. Criterios de aceptación

`TI-DOM-010` se considera documentalmente completa cuando:

1. existe un único contrato de observabilidad tecnológica;
2. las once familias `TI-SERVICE-*` tienen decisión explícita de observación;
3. las siete clases de configuración tienen interpretación de salud;
4. se conservan las seis clases de señal aprobadas;
5. se conservan los cinco estados de salud aprobados;
6. se conservan las ocho categorías de SLI y cuatro de SLO;
7. se conservan las doce familias métricas mínimas;
8. la ausencia de evidencia no puede producir `HEALTHY`;
9. señal, alerta, incidente, problema y cambio permanecen separados;
10. el ciclo de alerta define deduplicación, silencio, ACK, correlación y cierre;
11. un cambio tecnológico puede correlacionar baseline, ventana, resultado, rollback y revisión posterior;
12. los logs tienen campos mínimos y exclusiones de secretos;
13. NOTIFY-ARC, EVID-ARC y QUEUE-ARC conservan su autoridad;
14. VISO conserva la identidad y ciclo del incidente;
15. la observabilidad no crea una fuente de verdad paralela;
16. los estados AS-IS están diferenciados entre implementado, especificado, pendiente de evidencia, fuera de alcance y no aplica;
17. toda brecha detectada tiene propietario exacto;
18. no se ejecutan cambios físicos;
19. no se crean ni modifican requisitos de prueba;
20. `TI-DOM-011` queda únicamente reservada.

---

#### 36. Estado del resultado

| Resultado                                         | Estado                                             |
| ------------------------------------------------- | -------------------------------------------------- |
| `TI-OBSERVABILITY-OPERATING-CONTRACT-001`         | `ESPECIFICADO`                                     |
| `TI-TECHNICAL-SIGNAL-CONTRACT-001`                | `ESPECIFICADO`                                     |
| `TI-SERVICE-HEALTH-MATRIX-001`                    | `ESPECIFICADO`                                     |
| `TI-ALERT-GOVERNANCE-MATRIX-001`                  | `ESPECIFICADO`                                     |
| `TI-LOGGING-EVIDENCE-CONTRACT-001`                | `ESPECIFICADO`                                     |
| `TI-CHANGE-OBSERVABILITY-CORRELATION-001`         | `ESPECIFICADO`                                     |
| `TI-OBSERVABILITY-ASIS-RECONCILIATION-001`        | `ESPECIFICADO`                                     |
| Implementación de adaptadores                     | `FUERA_DE_ALCANCE` — `TI-INT-001` a `TI-INT-003`   |
| Implementación de panel de salud                  | `FUERA_DE_ALCANCE` — `TI-UX-003` y `TI-UX-004`     |
| Configuración de autorización de monitoreo y logs | `FUERA_DE_ALCANCE` — `TI-AUTH-003` y `TI-AUTH-004` |
| Implementación física transversal                 | `NO_APLICA` en esta tarea                          |

---

#### 37. Continuidad

ÚLTIMA TAREA APROBADA
`TI-DOM-009 — Definir cambio tecnológico, aprobación, ventana, prueba, despliegue, rollback y revisión posterior`

TAREA ACTUAL APROBADA
`TI-DOM-010 — Definir monitoreo, eventos técnicos, alertas, logs, salud y observabilidad de servicios`

SIGUIENTE TAREA RESERVADA
`TI-DOM-011 — Definir respaldo, restauración, recuperación técnica y relación con continuidad empresarial`


### ✅ TI-DOM-011 — Definir respaldo, restauración, recuperación técnica y relación con continuidad empresarial

**Estado:** APROBADA
**Tarea anterior:** `TI-DOM-010 — Definir monitoreo, eventos técnicos, alertas, logs, salud y observabilidad de servicios` — APROBADA
**Tarea siguiente:** `TI-DOM-012 — Definir licencias, asientos, garantías, contratos, renovaciones, uso y costos tecnológicos` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada del modelo tecnológico de respaldo, restauración, recuperación técnica, pruebas de restauración y handoff hacia continuidad empresarial
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/01_DOMINIO_DE_TECNOLOGIA_Y_SOPORTE.md`
**Artefactos producidos:** `TI-TECHNICAL-RECOVERY-CONTRACT-001`; `TI-RECOVERY-SERVICE-MATRIX-001`; `TI-RECOVERABLE-TECHNICAL-OBJECT-MATRIX-001`; `TI-BACKUP-RESTORE-GATE-CONTRACT-001`; `TI-RECOVERY-ORDER-CONTRACT-001`; `TI-CONTINUITY-HANDOFF-MATRIX-001`; `TI-RECOVERY-ASIS-RECONCILIATION-001`
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, SQL, migraciones, tablas, datos, RLS, funciones, triggers, Storage, Edge Functions, cron, secretos, políticas de proveedor, respaldos administrados, restauraciones, failover, dispositivos, redes, aplicaciones ni configuración desplegada
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** materializar el contrato tecnológico que define qué debe poder protegerse y recuperarse, cómo se distingue una copia de un respaldo verificable, qué condiciones habilitan una restauración, cómo se reconstruyen los once servicios tecnológicos y las siete clases de configuración, qué controles aplican a Supabase y a los demás objetos técnicos, y dónde termina la recuperación técnica para entregar el control a continuidad empresarial sin inventar RTO, RPO, MTPD o MBCO numéricos.

---

#### 1. Resultado sustantivo

`TI-DOM-011` queda documentalmente cerrada con:

- un contrato único de recuperación técnica;
- una separación explícita entre respaldo, réplica, snapshot, archivo, exportación, rollback, failover, restauración, recuperación técnica y continuidad empresarial;
- la adopción de los cinco perfiles cualitativos de recuperación ya aprobados;
- la adopción de los nueve estados canónicos del ciclo de respaldo ya aprobados;
- quince clases de objeto recuperable materializadas;
- decisiones explícitas de recuperación para los once servicios `TI-SERVICE-001` a `TI-SERVICE-011`;
- decisiones explícitas de recuperación para las siete clases del grafo tecnológico;
- un contrato de puerta de restauración que impide tratar una copia completada pero no verificada como evidencia de recuperabilidad;
- un orden técnico de recuperación con dependencias y reconciliación;
- una política de primera restauración en entorno aislado cuando sea técnicamente posible y seguro;
- controles para impedir efectos reales durante pruebas de restauración;
- separación entre validación técnica y validación empresarial;
- separación entre failover y retorno al primario;
- integración con observabilidad de `TI-DOM-010`;
- handoff explícito hacia el BLOQUE AC de continuidad;
- reconciliación AS-IS contra repositorio y estado desplegado consultado en modo de solo lectura;
- cero cambios físicos;
- cero cambios en requisitos de prueba.

La tarea no afirma que Vento disponga hoy de un respaldo administrado, PITR, réplica, restore drill, failover o recuperación integral ya comprobados cuando esa evidencia no fue verificable.

---

#### 2. Entradas canónicas conservadas

La tarea consume y conserva:

1. `TI-DOM-001` y los once servicios tecnológicos;
2. `TI-DOM-002` y las siete clases del grafo de configuración;
3. `TI-DOM-003` para reconstrucción y re-enrolamiento de endpoints;
4. `TI-DOM-004` para configuración de redes, direccionamiento y contingencia técnica;
5. `TI-DOM-005` para impresoras, periféricos y separación entre hardware, cola, routing, adaptador, trabajo y resultado;
6. `TI-DOM-006` para aplicaciones, ambientes, dependencias y proveedores tecnológicos;
7. `TI-DOM-007` para solicitud, incidente, restauración de servicio, prioridad, SLA y cierre;
8. `TI-DOM-008` para problema, causa, error conocido y recurrencia;
9. `TI-DOM-009` para cambio, ventana, prueba, despliegue, rollback y revisión posterior;
10. `TI-DOM-010` para señales de respaldo, frescura, fallos, salud, alertas y evidencia de restauración;
11. `NFR-BACKUP-RECOVERY-CONTRACT-001`;
12. `NFR-RECOVERY-OBJECT-INVENTORY-001`;
13. `NFR-PROCESS-RECOVERY-PROFILE-001`;
14. `NFR-RTO-RPO-MATRIX-001`;
15. `NFR-BACKUP-POLICY-MATRIX-001`;
16. `NFR-RESTORE-RUNBOOK-CATALOG-001`;
17. `NFR-RECOVERY-EXERCISE-MATRIX-001`;
18. `NFR-RECOVERY-EXCEPTION-REGISTER-001`;
19. `CAP-SCOPE-015` para tecnología y soporte;
20. `CAP-SCOPE-018` para continuidad empresarial;
21. el BLOQUE AC como propietario del gobierno permanente de continuidad;
22. BLOQUE T como propietario de calidad, release, despliegue y rollback de software;
23. QUEUE-ARC para colas, reintentos y replay;
24. EVID-ARC para evidencia durable;
25. las autoridades de Supabase, Storage, autorización e integraciones ya definidas.

Esta tarea especializa para BLOQUE Z el contrato de recuperación aprobado. No reemplaza los artefactos NFR ni adelanta las decisiones que pertenecen al BLOQUE AC.

---

#### 3. Separaciones obligatorias

Se fija como invariante:

```text
BACKUP
≠ REPLICA
≠ SNAPSHOT
≠ ARCHIVE
≠ EXPORT
≠ ROLLBACK
≠ FAILOVER
≠ RESTORE
≠ TECHNICAL_RECOVERY
≠ BUSINESS_CONTINUITY
```

Significado:

| Concepto            | Decisión                                                                                               |
| ------------------- | ------------------------------------------------------------------------------------------------------ |
| Backup              | copia protegida que cumple una política identificable y puede aspirar a ser fuente de restauración     |
| Replica             | copia sincronizada para disponibilidad o distribución; puede replicar corrupción o borrado             |
| Snapshot            | captura puntual de un objeto o volumen; su utilidad depende de alcance, consistencia y verificabilidad |
| Archive             | conservación de largo plazo o cumplimiento; no implica restauración operativa rápida                   |
| Export              | extracción portable o intercambio; no es respaldo por el solo hecho de existir                         |
| Rollback            | reversión de una versión o cambio; no restaura automáticamente datos perdidos                          |
| Failover            | traslado de servicio a una alternativa; no equivale a recuperar el estado correcto                     |
| Restore             | reposición de datos, configuración o artefactos desde una fuente de recuperación                       |
| Technical recovery  | reconstrucción coordinada de la capacidad técnica hasta un estado verificable                          |
| Business continuity | decisión y operación empresarial para mantener o reanudar el proceso mínimo aceptable                  |

Consecuencias:

1. un backup completado no demuestra restaurabilidad;
2. una réplica verde no demuestra recuperabilidad;
3. un rollback exitoso no repara datos corruptos;
4. un failover exitoso no demuestra integridad empresarial;
5. una base restaurada no demuestra que el proceso empresarial esté recuperado;
6. una aplicación respondiendo no demuestra que las obligaciones pendientes estén reconciliadas;
7. la disponibilidad técnica no autoriza a BLOQUE Z a declarar activada o cerrada la continuidad empresarial.

---

#### 4. Perfiles cualitativos de recuperación adoptados

Se conservan exactamente los cinco perfiles aprobados:

| Perfil                    | Uso tecnológico                                                                                                                              |
| ------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| `RC0_SAFETY_INTEGRITY`    | capacidades cuya pérdida o corrupción puede comprometer seguridad, integridad, obligaciones críticas o una fuente de verdad no reconstruible |
| `RC1_CRITICAL_OPERATION`  | capacidades necesarias para sostener una operación empresarial crítica                                                                       |
| `RC2_IMPORTANT_OPERATION` | capacidades importantes cuya degradación admite una ventana controlada de recuperación                                                       |
| `RC3_SUPPORTING`          | capacidades de soporte que pueden recuperarse después de las dependencias críticas                                                           |
| `RC4_RECONSTRUCTIBLE`     | capacidades regenerables desde fuentes autoritativas sin conservar una copia operativa completa                                              |

Reglas:

1. el perfil no contiene una duración numérica implícita;
2. el perfil tecnológico se vincula al proceso y dependencias que protege;
3. un objeto puede elevar su perfil si habilita una dependencia crítica;
4. el perfil no se degrada por facilidad técnica de reconstrucción si existe riesgo de integridad;
5. los objetivos numéricos se consumen del BIA y del gobierno de continuidad cuando estén aprobados;
6. esta tarea no inventa RTO, RPO, MTPD ni MBCO cuantitativos.

---

#### 5. Estados del ciclo de respaldo

Se conservan exactamente los nueve estados aprobados:

1. `SCHEDULED`
2. `RUNNING`
3. `COMPLETED_UNVERIFIED`
4. `VERIFIED`
5. `FAILED`
6. `DEGRADED`
7. `QUARANTINED`
8. `EXPIRED`
9. `DELETED`

Reglas:

- `COMPLETED_UNVERIFIED` no es evidencia de restaurabilidad;
- `VERIFIED` exige la verificación definida por la política del objeto;
- cuando la política exija prueba de restauración, la preparación para recuperar requiere además evidencia vigente de una restauración satisfactoria;
- `DEGRADED` conserva el motivo, alcance y riesgo;
- `QUARANTINED` impide usar la copia hasta resolver integridad o seguridad;
- `EXPIRED` no puede presentarse como copia vigente;
- `DELETED` conserva evidencia de disposición cuando la política lo requiera;
- ningún estado se eleva por una marca de éxito emitida únicamente por el proceso que creó la copia.

---

#### 6. Contrato `TI-TECHNICAL-RECOVERY-CONTRACT-001`

La recuperación técnica sigue esta secuencia conceptual:

```text
OBJETO AUTORITATIVO
→ PERFIL DE RECUPERACIÓN
→ OBJETIVO DE CONTINUIDAD RECIBIDO
→ POLÍTICA DE PROTECCIÓN
→ CREACIÓN DE COPIA
→ VERIFICACIÓN
→ PRUEBA DE RESTAURACIÓN
→ SOLICITUD DE RECUPERACIÓN
→ AUTORIZACIÓN
→ RESTAURACIÓN AISLADA O CONTROLADA
→ VALIDACIÓN TÉCNICA
→ VALIDACIÓN EMPRESARIAL
→ RECONCILIACIÓN
→ RETORNO CONTROLADO
→ EVIDENCIA Y APRENDIZAJE
```

Toda política técnica deberá poder declarar, cuando aplique:

- objeto o grupo protegido;
- autoridad del objeto;
- perfil cualitativo;
- referencia al RPO aprobado;
- método de copia;
- frecuencia o disparador;
- regla de consistencia;
- cadena completa o incremental;
- PITR o mecanismo equivalente, si existe;
- ubicación o dominio de falla;
- inmutabilidad o protección contra eliminación;
- cifrado;
- referencia de llave;
- accesos autorizados;
- retención;
- legal hold o retención extraordinaria;
- verificación de integridad;
- monitoreo;
- método de restauración;
- última restauración verificada;
- dependencia de proveedor;
- capacidad y costo cuando corresponda;
- excepción activa;
- estado vigente.

La frecuencia se deriva del objetivo aprobado; la frecuencia no se utiliza para fabricar el objetivo.

---

#### 7. Inventario `TI-RECOVERABLE-TECHNICAL-OBJECT-MATRIX-001`

Se materializan quince clases de objeto recuperable.

|    # | Clase de objeto                      | Protección esperada                                                          | Regla de recuperación                                                      | Riesgo principal                                         | Autoridad / handoff             |
| ---: | ------------------------------------ | ---------------------------------------------------------------------------- | -------------------------------------------------------------------------- | -------------------------------------------------------- | ------------------------------- |
|    1 | Fuente canónica                      | respaldo consistente y verificable acorde al perfil                          | restaurar sin crear una fuente competidora; reconciliar hechos posteriores | pérdida o corrupción irreversible                        | dominio propietario + TI        |
|    2 | Proyección o copia regenerable       | puede omitirse del backup si la regeneración está demostrada                 | regenerar desde la fuente y verificar paridad                              | reconstrucción incompleta o stale                        | dominio propietario             |
|    3 | Caché descartable                    | no requiere recuperación de contenido si puede invalidarse                   | vaciar y regenerar                                                         | datos obsoletos tratados como autoridad                  | aplicación propietaria          |
|    4 | Estado transaccional                 | protección consistente e idempotente                                         | restaurar con atención a transacciones posteriores y efectos externos      | doble efecto, pérdida o orden incorrecto                 | dominio propietario + TI        |
|    5 | Ledger o secuencia                   | protección fuerte de integridad y orden                                      | restaurar sin renumerar ni sobrescribir historia válida                    | doble contabilización o ruptura de secuencia             | dominio propietario             |
|    6 | Documento o evidencia                | archivo, metadatos, versión, hash, permisos y referencia                     | restaurar contenido y vínculo, preservando retención y autoridad           | archivo huérfano o evidencia alterada                    | EVID-ARC + dominio              |
|    7 | Configuración                        | versión y fuente autoritativa identificables                                 | aplicar la versión correcta y comprobar drift                              | configuración incompatible o desactualizada              | TI / propietario técnico        |
|    8 | Secreto o llave                      | mecanismo seguro de recuperación o rotación, separado del backup ordinario   | recuperar o rotar según autoridad; nunca depender de texto plano en copias | exposición o imposibilidad de descifrar                  | TI-AUTH / autoridad de secretos |
|    9 | Artefacto de software                | repositorio, commit, dependencias bloqueadas, build y release identificables | reconstruir o desplegar artefacto verificable                              | binario no reproducible o versión equivocada             | BLOQUE T + propietario          |
|   10 | Estado de integración                | correlación, idempotencia y posición recuperables                            | reanudar sin duplicar efectos ni perder acknowledgements                   | replay doble o evento perdido                            | INT / QUEUE-ARC                 |
|   11 | Cola o trabajo pendiente             | payload mínimo, identidad estable y estado durable                           | reconciliar antes de replay; no reinyectar ciegamente                      | duplicación, orden incorrecto o trabajo obsoleto         | QUEUE-ARC + propietario         |
|   12 | Dato local u offline                 | intención original y clave idempotente cuando el flujo lo requiera           | sincronizar después de conocer el punto restaurado                         | duplicación o pérdida de trabajo ocurrido fuera de línea | aplicación + TI                 |
|   13 | Telemetría o auditoría               | retención según obligación y valor probatorio                                | restaurar solo cuando sea necesario; no convertirla en fuente empresarial  | pérdida de trazabilidad o exceso de retención            | TI-DOM-010 + EVID-ARC           |
|   14 | Configuración de activo o periférico | configuración versionada separada del objeto físico                          | reaplicar sobre hardware válido y luego probar                             | confundir reemplazo físico con restore                   | NEXO + TI                       |
|   15 | Registro de proveedor externo        | exportabilidad, evidencia y contrato de recuperación                         | usar exportación, API o procedimiento alterno aprobado                     | lock-in, cierre de cuenta o proveedor indisponible       | ORIGO + TI + continuidad        |

Total materializado: **15 de 15 clases**.

---

#### 8. Decisiones para los once servicios `TI-RECOVERY-SERVICE-MATRIX-001`

| Servicio         | Qué debe poder recuperarse                                                                                    | Regla principal                                                                                                                               | Validación mínima                                                           | Handoff                                               |
| ---------------- | ------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------- | ----------------------------------------------------- |
| `TI-SERVICE-001` | configuración de cuentas, vínculos técnicos, políticas y evidencia necesaria para ejecutar identidad y acceso | una restauración no revive cuentas revocadas, permisos retirados, sesiones caducadas ni credenciales reemplazadas sin reconciliación          | identidad, vigencia, autorización y ausencia de acceso residual indebido    | SHELL + TI-AUTH + continuidad si el proceso se afecta |
| `TI-SERVICE-002` | baseline de endpoint, enrolamiento, configuración administrada y estado local recuperable                     | reimagen o reconstrucción crea el estado técnico correcto sin reutilizar sesiones o autoridad obsoleta; trabajo local pendiente se reconcilia | endpoint correcto, baseline, postura, aplicación y red                      | `TI-DOM-003` + NEXO                                   |
| `TI-SERVICE-003` | configuración versionada de enlaces, equipos, segmentos, SSID, direccionamiento, reservas y dependencias      | restaurar configuración no sustituye reemplazo de hardware; topología y direccionamiento se validan después                                   | conectividad, routing, resolución, segmentación y dependencias              | `TI-DOM-004` + continuidad                            |
| `TI-SERVICE-004` | configuración de impresora, adaptador, routing, cola y trabajos pendientes recuperables                       | trabajos pendientes no se reimprimen ciegamente; hardware físico y estado lógico permanecen separados                                         | conectividad, capacidad, cola, resultado y reconciliación de trabajos       | `TI-DOM-005` + PRINT-ARC                              |
| `TI-SERVICE-005` | código, release, configuración, esquema, datos, archivos, integraciones y dependencias de aplicación          | reconstrucción debe identificar commit, ambiente, migraciones, configuración y datos compatibles                                              | build/release, esquema, datos, Storage, dependencias y pruebas de servicio  | `TI-DOM-006` + BLOQUE T                               |
| `TI-SERVICE-006` | casos de soporte, mensajes y evidencia necesaria                                                              | restaurar el caso no repite notificaciones, cambios o acciones técnicas ya ejecutadas                                                         | integridad del caso, autoría, estado y efectos correlacionados              | `TI-DOM-007`                                          |
| `TI-SERVICE-007` | línea de tiempo, señales, estado de restauración y dependencias del incidente                                 | un incidente puede solicitar recuperación técnica, pero su cierre requiere validación del servicio y no activa continuidad por sí solo        | servicio restaurado, efectos reconciliados y aceptación aplicable           | `TI-DOM-007` + AC                                     |
| `TI-SERVICE-008` | configuración previa, versión desplegada, evidencia pre/post y datos protegidos cuando el cambio lo requiera  | rollback y restauración de datos son mecanismos distintos y se coordinan cuando ambos son necesarios                                          | estado anterior o objetivo, datos, compatibilidad y señales posteriores     | `TI-DOM-009` + BLOQUE T                               |
| `TI-SERVICE-009` | entornos y datos de prueba de restauración autorizados, resultados y evidencia                                | la primera prueba usa aislamiento y efectos externos suprimidos cuando aplique                                                                | restore reproducible, integridad, seguridad, tiempos observados y evidencia | E5 + T + U                                            |
| `TI-SERVICE-010` | referencias técnicas a licencias, garantías y habilitaciones necesarias para reconstruir capacidad            | la recuperación técnica no convierte copia de licencia o contrato en fuente financiera o contractual                                          | vigencia, titularidad, asiento y habilitación técnica                       | `TI-DOM-012` + ORIGO + NUMERA                         |
| `TI-SERVICE-011` | runbooks, guías, versiones y conocimiento necesario para recuperación                                         | conocimiento recuperado no sustituye configuración, autoridad ni prueba técnica                                                               | versión vigente, disponibilidad y vínculo con el servicio                   | `TI-DOM-013`                                          |

Total materializado: **11 de 11 servicios**, sin faltantes ni duplicados.

---

#### 9. Decisiones para las siete clases del grafo tecnológico

| Clase              | Decisión de recuperación                                                                                        | No se permite inferir                                                          |
| ------------------ | --------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| `ASSET`            | reparar o reemplazar físicamente bajo NEXO; recuperar después la configuración técnica que le corresponda       | que una copia de configuración equivale a recuperar el activo                  |
| `ENDPOINT`         | reconstruir baseline, enrolamiento, configuración y aplicaciones; reconciliar estado local pendiente            | reusar identidad técnica o sesión obsoleta solo porque el hardware es el mismo |
| `SHARED_DEVICE`    | reconstruir plantilla, aplicaciones, perfil y binding técnico autorizado; revalidar credenciales                | restaurar una sesión de trabajador, PIN, actor efectivo o permiso ya vencido   |
| `NETWORK_RESOURCE` | restaurar configuración versionada, direccionamiento y topología sobre equipo válido y probar extremo a extremo | que `up` equivale a servicio recuperado                                        |
| `PRINTER`          | restaurar configuración, routing, adaptador y cola reconciliada; hardware permanece bajo NEXO                   | reimprimir automáticamente todo trabajo pendiente                              |
| `APPLICATION`      | reconstruir release, esquema, datos, archivos, configuración e integraciones compatibles                        | que un deploy sano equivale a datos recuperados                                |
| `TECH_SERVICE`     | derivar recuperación desde dependencias técnicas y validación empresarial del servicio                          | crear una fuente de verdad paralela para datos de los componentes              |

Total materializado: **7 de 7 clases**.

---

#### 10. Alcance técnico mínimo de Supabase

Para un servicio VENTO que dependa de Supabase, el plan de recuperación deberá considerar por separado, cuando existan:

| Superficie                | Qué debe quedar reconstruible o recuperable                                       |
| ------------------------- | --------------------------------------------------------------------------------- |
| Esquema de base de datos  | tablas, tipos, extensiones y estructura compatible                                |
| Datos                     | fuentes autoritativas y estado transaccional según perfil                         |
| Lógica de base            | funciones, triggers, vistas y RPC                                                 |
| Seguridad                 | RLS, policies, grants y ownership aplicable                                       |
| Auth                      | relaciones empresariales y configuración necesaria sin revivir autoridad revocada |
| Storage                   | objetos, metadatos, buckets, permisos, referencias, hashes o versiones requeridas |
| Realtime                  | configuración y consumidores necesarios para reanudar operación                   |
| Edge Functions            | código, versión, configuración y dependencias                                     |
| Secretos y llaves         | recuperación o rotación mediante autoridad separada                               |
| Migraciones               | historial versionado y orden reproducible                                         |
| Releases                  | commit, artefactos, dependencias y manifiesto del ambiente                        |
| Cron y jobs               | definición, estado, último efecto y prevención de doble ejecución                 |
| Colas y pending work      | identidad, estado, idempotencia y reconciliación antes de replay                  |
| Integraciones externas    | endpoints, contratos, credenciales y posiciones reconciliables                    |
| Configuración de ambiente | valores no secretos, feature flags y referencias necesarias                       |

Invariantes:

1. la base restaurada debe ser compatible con las migraciones y el release que se pretende ejecutar;
2. restaurar datos no autoriza saltar una migración pendiente;
3. RLS y grants son parte de la recuperación, no un ajuste posterior opcional;
4. Storage incluye tanto contenido como metadatos y referencias;
5. secretos no se incluyen en respaldos ordinarios en texto claro;
6. cron, webhooks y Edge Functions se controlan durante una restauración para evitar efectos reales;
7. PITR solo se declara disponible si existe evidencia de la capacidad y su cobertura;
8. el nombre de un objeto con la palabra `backup` no demuestra que forme parte de una política canónica;
9. una restauración de Supabase no se considera completa hasta validar contratos consumidores y efectos pendientes.

---

#### 11. Política de protección y dominios de falla

La política de un objeto recuperable deberá demostrar que una falla relevante no destruye simultáneamente la fuente y todas sus copias.

Se deberá evaluar:

- mismo proyecto;
- misma cuenta;
- misma región;
- mismo proveedor;
- mismas credenciales;
- misma llave;
- misma sede;
- mismo dispositivo;
- mismo repositorio;
- misma persona administradora;
- misma ruta de red.

Una segunda copia en el mismo dominio de falla puede aumentar conveniencia, pero no demuestra resiliencia frente a la causa compartida.

La existencia de redundancia, réplica o alta disponibilidad no elimina la necesidad de recuperación frente a:

- borrado accidental;
- actualización masiva incorrecta;
- migración defectuosa;
- corrupción latente;
- credencial comprometida;
- eliminación de copias;
- ransomware;
- pérdida de llave;
- indisponibilidad del proveedor;
- cierre de cuenta;
- falla regional;
- restauración de una versión con vulnerabilidad conocida.

---

#### 12. Consistencia y grupos de recuperación

Los objetos relacionados se recuperan respetando consistencia empresarial.

Ejemplos de grupos que pueden requerir coordinación:

- base y Storage;
- ledger y proyecciones;
- caso y evidencia;
- cola y resultado aplicado;
- identidad y vínculo empresarial;
- aplicación y configuración;
- impresora y trabajo pendiente;
- endpoint y estado local pendiente.

Reglas:

1. una restauración no mezcla puntos temporales incompatibles sin reconciliación explícita;
2. una proyección puede regenerarse después de la fuente si su proceso es determinista;
3. un ledger no se reconstruye desde un saldo cuando la historia es autoridad;
4. documentos restaurados requieren que la referencia empresarial vuelva a apuntar al objeto correcto;
5. restaurar únicamente un lado de una relación crítica deja la recuperación en estado incompleto;
6. el punto de restauración se selecciona por el daño y el objetivo, no por el archivo más reciente de forma automática.

---

#### 13. Contrato de puerta `TI-BACKUP-RESTORE-GATE-CONTRACT-001`

Antes de presentar una copia como fuente apta para recuperación deberán existir, según política:

1. identidad de la copia;
2. objeto y alcance;
3. punto temporal;
4. estado no inferior al requerido por política;
5. verificación de integridad;
6. cadena completa de dependencias de la copia;
7. acceso a la llave o procedimiento de rotación;
8. versión del formato;
9. método de restauración;
10. ambiente de destino permitido;
11. última prueba de restauración exigida y su resultado;
12. evidencia disponible;
13. ausencia de cuarentena;
14. retención vigente;
15. compatibilidad conocida o procedimiento de migración posterior.

Una copia `COMPLETED_UNVERIFIED` nunca supera esta puerta por el solo resultado del job.

---

#### 14. Solicitud de restauración

Toda restauración real o ejercicio deberá registrar, cuando aplique:

- incidente, ejercicio o razón;
- solicitante;
- autoridad aprobadora;
- objeto;
- alcance;
- punto de restauración;
- naturaleza del daño;
- riesgo de sobrescritura;
- datos creados después del punto;
- ambiente de destino;
- copia seleccionada;
- prueba de integridad;
- efectos externos que deben suprimirse;
- dependencias;
- ventana;
- criterios de validación;
- condición de aborto;
- mecanismo para volver atrás de la restauración si falla;
- comunicaciones;
- evidencia;
- responsable de validación técnica;
- responsable de validación empresarial.

La restauración de producción no se inicia únicamente porque exista un backup disponible.

---

#### 15. Entorno aislado y supresión de efectos

La primera restauración de una prueba o de una recuperación que admita verificación previa deberá ejecutarse en un destino aislado o equivalente controlado.

Durante la verificación deberán suprimirse, según el sistema:

- pagos reales;
- correos reales;
- mensajería real;
- push productivo;
- webhooks externos;
- impresión física;
- reintentos contra proveedores reales;
- jobs que muten producción;
- conciliaciones automáticas que no correspondan al ejercicio;
- sesiones o credenciales productivas no necesarias.

La supresión de efectos no puede alterar la evidencia de que esos componentes necesitarán ser reactivados y validados durante la recuperación real.

---

#### 16. Validación técnica de restauración

La restauración técnica debe verificar, según aplique:

1. integridad de la copia;
2. esquema y tipos;
3. orden de migraciones;
4. funciones, triggers, vistas y RPC;
5. RLS y grants;
6. objetos de Storage y referencias;
7. releases y contratos;
8. configuración de ambiente;
9. ausencia de secretos expuestos;
10. colas y trabajos pendientes;
11. cron y jobs;
12. Edge Functions;
13. integraciones;
14. endpoints y periféricos;
15. observabilidad;
16. drift frente al estado objetivo;
17. presencia de vulnerabilidades conocidas que invaliden la versión restaurada.

Una verificación técnica exitosa habilita la siguiente decisión; no constituye validación empresarial.

---

#### 17. Validación empresarial

El propietario empresarial deberá determinar, según el proceso:

- si el mínimo de servicio requerido está disponible;
- si faltan obligaciones;
- si existen hechos duplicados;
- si existen hechos posteriores al punto restaurado;
- si hay transacciones, inventario, pagos, documentos, evidencia o comunicaciones pendientes;
- si hay trabajo offline o manual no incorporado;
- si existen conflictos entre fuentes;
- si la cola de pendientes puede reanudarse;
- si el proceso puede operar sin crear daño adicional;
- si la reconciliación pendiente es tolerable dentro del objetivo vigente.

BLOQUE Z entrega la capacidad técnica y evidencia. No sustituye esta aceptación empresarial.

---

#### 18. Contrato `TI-RECOVERY-ORDER-CONTRACT-001`

Como orden técnico base, sujeto al perfil del proceso y a dependencias reales:

```text
1. AUTORIDADES, CREDENCIALES Y LLAVES
2. RED Y CONECTIVIDAD
3. BASE DE DATOS Y STORAGE
4. COLAS, JOBS E INTEGRACIONES
5. APLICACIONES Y SERVICIOS
6. ENDPOINTS, DISPOSITIVOS E IMPRESORAS
7. VALIDACIÓN TÉCNICA
8. VALIDACIÓN EMPRESARIAL
9. RECONCILIACIÓN DE EFECTOS Y TRABAJO PENDIENTE
10. RETORNO CONTROLADO A OPERACIÓN NORMAL
```

Reglas:

1. el orden genérico no reemplaza el runbook específico;
2. una dependencia real puede exigir invertir o intercalar pasos;
3. credenciales rotadas no se reemplazan por credenciales históricas restauradas;
4. colas se mantienen controladas hasta conocer el punto restaurado;
5. integraciones externas se reactivan después de validar idempotencia y estado;
6. trabajo local/offline se reconcilia contra la verdad restaurada;
7. no se reabre tráfico normal antes de la validación requerida;
8. todo desvío del orden queda justificado en el runbook del servicio.

---

#### 19. Replay, reintentos y trabajo posterior al punto restaurado

Una restauración puede dejar fuera del nuevo estado datos o efectos creados después del punto elegido.

Por ello:

1. las colas no se reproducen ciegamente;
2. cada operación reintentable conserva identidad estable;
3. el mismo identificador con el mismo contenido no produce doble efecto;
4. un identificador reutilizado con contenido distinto produce conflicto;
5. eventos tardíos se comparan con el estado restaurado;
6. trabajo offline se importa únicamente después de reconciliar el recurso objetivo;
7. pagos, inventario, impresión y notificaciones requieren especial control de efectos;
8. si no puede determinarse si una operación ocurrió, el estado es resultado desconocido y requiere conciliación;
9. compensar es distinto de borrar historia;
10. el objetivo es converger a una única historia empresarial explicable.

---

#### 20. Relación con cambio y rollback

`TI-DOM-009` y `TI-DOM-011` se conectan sin fusionarse.

Antes de un cambio que tenga riesgo de datos deberá existir:

- evaluación de daño potencial;
- protección pre-cambio cuando corresponda;
- identificación del punto de retorno;
- criterio para rollback de software;
- criterio separado para restauración de datos;
- compatibilidad entre release y esquema;
- prueba de que el mecanismo elegido no agrava la pérdida.

Después:

- rollback revierte software o configuración;
- restore repone datos o estado;
- ambos pueden ser necesarios;
- cualquiera puede fallar independientemente;
- la revisión posterior conserva cuál mecanismo se usó y su resultado.

---

#### 21. Failover y retorno

```text
FAILOVER ≠ FAILBACK
```

Failover:
- cambia la capacidad activa hacia una alternativa;
- requiere comprobar autoridad, datos, dependencias y tráfico;
- no implica que el primario deba recuperarse inmediatamente.

Retorno:
- se ejecuta solo cuando el primario o destino objetivo es estable;
- reconcilia datos y trabajo producido durante el failover;
- verifica rutas, credenciales e integraciones;
- evita doble procesamiento;
- conserva ventana, decisión y evidencia.

La mera respuesta del primario no autoriza el retorno automático.

---

#### 22. Relación con observabilidad

`TI-DOM-010` deberá poder observar, cuando la implementación exista:

- inicio y resultado del job de copia;
- estado canónico de la copia;
- edad desde la última copia válida;
- edad desde la última restauración verificada exigida por política;
- fallo o degradación de la cadena;
- copia en cuarentena;
- vencimiento;
- capacidad insuficiente;
- prueba de restauración;
- tiempo real observado de recuperación;
- errores de reconciliación;
- dependencias no disponibles.

Reglas:

1. ausencia de señal no equivale a backup saludable;
2. éxito del job no equivale a restore exitoso;
3. un dashboard no reemplaza la evidencia del ejercicio;
4. alertas de backup pueden producir incidente, pero no recalculan por sí solas RTO o RPO;
5. la telemetría no contiene secretos, llaves o copias completas.

---

#### 23. Handoff `TI-CONTINUITY-HANDOFF-MATRIX-001`

| Decisión                         | BLOQUE Z / TI                                     | BLOQUE AC / continuidad                 | Propietario empresarial           |
| -------------------------------- | ------------------------------------------------- | --------------------------------------- | --------------------------------- |
| Inventario técnico recuperable   | define y mantiene objetos técnicos                | consolida la visión de continuidad      | confirma criticidad empresarial   |
| Método técnico de backup/restore | define capacidad y procedimiento técnico          | comprueba cobertura frente al escenario | consume resultado                 |
| BIA                              | aporta dependencias y capacidades                 | gobierna análisis de impacto            | aporta impacto y mínimo aceptable |
| MTPD                             | no lo inventa                                     | lo gobierna                             | lo valida                         |
| MBCO                             | implementa soporte técnico necesario              | lo gobierna                             | lo valida                         |
| RTO                              | consume el objetivo y reporta capacidad observada | lo establece/gobierna                   | lo valida                         |
| RPO                              | deriva protección técnica del objetivo recibido   | lo establece/gobierna                   | lo valida                         |
| Activación de continuidad        | informa incidente y capacidad técnica             | decide y coordina                       | participa según proceso           |
| Restauración técnica             | ejecuta o coordina bajo autoridad                 | integra al plan de recuperación         | valida efecto empresarial         |
| Failover técnico                 | ejecuta si está autorizado                        | coordina dentro del escenario           | valida capacidad mínima           |
| Retorno                          | ejecuta parte técnica                             | coordina normalización                  | acepta reanudación                |
| Ejercicio empresarial            | aporta restauración y evidencia técnica           | diseña y gobierna ejercicio             | participa y valida                |
| Cierre                           | entrega evidencia técnica                         | decide cierre de continuidad            | confirma resultado del proceso    |

Invariantes:

- disponibilidad técnica no equivale a proceso recuperado;
- continuidad puede activarse aunque el servicio técnico siga en recuperación;
- un restore exitoso puede requerir trabajo empresarial de reconciliación;
- BLOQUE Z no inventa tiempos que pertenecen al BIA;
- BLOQUE AC no sustituye la autoridad técnica de restauración sobre componentes.

---

#### 24. Relación con CONT-DOM-011 a CONT-DOM-015

Esta tarea deja listo el insumo tecnológico que las tareas de continuidad consumirán:

| Tarea futura de continuidad | Insumo entregado por TI-DOM-011                                                   |
| --------------------------- | --------------------------------------------------------------------------------- |
| `CONT-DOM-011`              | clases recuperables, política técnica, estado de evidencia y brechas de cobertura |
| `CONT-DOM-012`              | orden técnico, restore gate, dependencias y fronteras de validación               |
| `CONT-DOM-013`              | dependencias de proveedor y requisitos de exportabilidad/alternativa              |
| `CONT-DOM-014`              | condiciones de ejercicio, aislamiento y evidencia                                 |
| `CONT-DOM-015`              | resultados observados, fallas, excepciones y aprendizaje técnico                  |

Las tareas futuras pueden completar el gobierno empresarial sin reabrir las separaciones técnicas ya fijadas aquí.

---

#### 25. Proveedores externos

Un servicio dependiente de proveedor deberá conocer, cuando aplique:

- propietario interno;
- servicio habilitado;
- datos o configuración almacenados por el proveedor;
- formato de exportación;
- frecuencia o mecanismo de extracción;
- API o procedimiento de recuperación;
- credenciales;
- llaves;
- retención;
- borrado;
- contactos;
- SLA contractual;
- región;
- dependencia de DNS/red;
- alternativa manual o secundaria;
- procedimiento ante cierre de cuenta;
- evidencia de prueba.

Una copia retenida únicamente dentro de la misma cuenta del proveedor puede ser insuficiente frente al cierre o compromiso de esa cuenta.

---

#### 26. Secretos y llaves

Secretos y llaves se gestionan separados de los respaldos ordinarios.

Reglas:

1. no se escriben secretos en documentos, logs, casos o dumps sin protección;
2. una copia de base de datos no debe ser el único mecanismo para recuperar una llave;
3. recuperar una llave histórica puede ser incorrecto si ya fue revocada;
4. rotación y recuperación son decisiones distintas;
5. una restauración puede requerir rotar credenciales antes de reactivar integraciones;
6. pérdida de llave puede volver inútil una copia cifrada y debe formar parte del escenario de recuperación;
7. el acceso a material de recuperación privilegiado requiere segregación y auditoría.

La autorización detallada continúa en `TI-AUTH-001` a `TI-AUTH-004`.

---

#### 27. Retención y disposición

Retención de backup no equivale a retención legal del dato.

Una política deberá resolver:

- cuánto tiempo se conserva una copia;
- por qué;
- qué ocurre con datos cuyo periodo empresarial ya terminó;
- qué ocurre con legal holds;
- cómo se evita que restaurar una copia reviva datos que ya debían estar eliminados o restringidos;
- cómo se elimina una copia vencida;
- qué evidencia de disposición queda.

La restauración exige reconciliar eliminaciones, revocaciones, consentimientos y cambios de autoridad ocurridos después del punto restaurado.

---

#### 28. Reconciliación AS-IS `TI-RECOVERY-ASIS-RECONCILIATION-001`

La inspección de solo lectura permite declarar el siguiente estado, sin promover indicios a evidencia de recuperabilidad:

| Elemento                                                 | Estado                                          | Evidencia o límite                                                                                                                                                |
| -------------------------------------------------------- | ----------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Contrato NFR de respaldo y recuperación                  | `ESPECIFICADO`                                  | existe el contrato aprobado con inventario, perfiles, política, runbooks, ejercicios y excepciones                                                                |
| Contrato tecnológico de recuperación                     | `ESPECIFICADO`                                  | esta tarea materializa la especialización para BLOQUE Z                                                                                                           |
| Gobierno empresarial de continuidad                      | `PENDIENTE_DE_EVIDENCIA` en su ejecución futura | las tareas `CONT-DOM-*` relevantes permanecen reservadas para su bloque                                                                                           |
| Proyecto Supabase de desarrollo                          | `IMPLEMENTADO` como plataforma desplegada       | el proyecto consultado se reportó activo y saludable; esto no demuestra recuperación                                                                              |
| Historial de migraciones Supabase                        | `IMPLEMENTADO`                                  | se observaron 550 versiones aplicadas entre la primera y la última versión reportadas por el esquema de migraciones                                               |
| Buckets de Storage                                       | `IMPLEMENTADO` como superficie actual           | se observaron 14 buckets; su política de respaldo y restauración no fue demostrada por la inspección                                                              |
| Edge Functions                                           | `IMPLEMENTADO` como superficie actual           | se observaron 24 funciones activas; su restauración integral como conjunto no fue demostrada                                                                      |
| Jobs de `pg_cron`                                        | `IMPLEMENTADO` como superficie actual           | se observaron 7 jobs activos; ninguno de los nombres observados constituía por sí mismo una política de backup                                                    |
| Extensiones relevantes observadas                        | `IMPLEMENTADO` parcialmente                     | `pg_cron` y `pg_net` están presentes; esto no informa el estado de respaldos administrados                                                                        |
| Tabla `product_categories_backup_20260316_preparaciones` | `IMPLEMENTADO` como copia ad hoc existente      | se observaron aproximadamente 35 filas y 24 kB; no existe evidencia suficiente para clasificarla como respaldo canónico                                           |
| Rutina dedicada de backup/restore por nombre             | `PENDIENTE_DE_EVIDENCIA`                        | la inspección de rutinas por nombres de backup, restore, recovery o snapshot no reveló una rutina técnica general; no prueba ausencia de mecanismos administrados |
| Backup administrado de Supabase                          | `PENDIENTE_DE_EVIDENCIA`                        | las herramientas consultadas no expusieron una política verificable de backup administrado                                                                        |
| PITR o equivalente                                       | `PENDIENTE_DE_EVIDENCIA`                        | no se obtuvo evidencia verificable de disponibilidad, cobertura o ventana                                                                                         |
| Última restauración verificada de base                   | `PENDIENTE_DE_EVIDENCIA`                        | no se obtuvo resultado de ejercicio o restore verificable                                                                                                         |
| Restauración verificada de Storage                       | `PENDIENTE_DE_EVIDENCIA`                        | no se obtuvo evidencia de ejercicio que reconcilie archivo, metadatos y referencia                                                                                |
| Recuperación de secretos y llaves                        | `PENDIENTE_DE_EVIDENCIA`                        | no se inspeccionó ni se expuso material secreto; debe definirse/probarse por mecanismo seguro                                                                     |
| Recuperación de cola/trabajo pendiente                   | `PENDIENTE_DE_EVIDENCIA`                        | existen superficies asíncronas, pero no se demostró un procedimiento transversal de replay post-restore                                                           |
| Recuperación de endpoint/red/impresión                   | `PENDIENTE_DE_EVIDENCIA`                        | los contratos existen, pero no se demostró un ejercicio físico integral                                                                                           |
| Implementación física creada por esta tarea              | `NO_APLICA`                                     | la fase es exclusivamente documental                                                                                                                              |

Los conteos AS-IS sirven para delimitar la superficie actual. No constituyen prueba de respaldo, restauración o continuidad.

---

#### 29. Brechas y propietarios

| Brecha                                                        | Estado                               | Propietario exacto                                                          | Condición de salida                                   |
| ------------------------------------------------------------- | ------------------------------------ | --------------------------------------------------------------------------- | ----------------------------------------------------- |
| Valores empresariales de MTPD/MBCO/RTO/RPO                    | `FUERA_DE_ALCANCE`                   | `CONT-DOM-002` a `CONT-DOM-004`                                             | BIA y objetivos aprobados                             |
| Consolidación empresarial del inventario y política de backup | `FUERA_DE_ALCANCE`                   | `CONT-DOM-011`                                                              | inventario transversal y política aprobados           |
| Runbooks empresariales de recuperación y retorno              | `FUERA_DE_ALCANCE`                   | `CONT-DOM-012`                                                              | runbooks por escenario aprobados                      |
| Alternativas de proveedor y dependencias externas             | `FUERA_DE_ALCANCE`                   | `CONT-DOM-013`; `TI-INT-003`                                                | dependencias, fallback y evidencia definidos          |
| Ejercicios de restauración y continuidad                      | `FUERA_DE_ALCANCE`                   | `CONT-DOM-014` + paquetes de implementación                                 | ejercicio autorizado y evidencia real                 |
| Aprendizaje y actualización posterior                         | `FUERA_DE_ALCANCE`                   | `CONT-DOM-015`; `TI-DOM-013`                                                | acciones y conocimiento versionados                   |
| Señales y alertas de protección/restore                       | `FUERA_DE_ALCANCE` de implementación | `TI-DOM-010`; `TI-INT-001`                                                  | adaptadores y reglas implementados en fase autorizada |
| Autorización de restore, secretos y acceso privilegiado       | `FUERA_DE_ALCANCE`                   | `TI-AUTH-001` a `TI-AUTH-004`; `CONT-AUTH-*`                                | matriz de segregación aprobada                        |
| Implementación Supabase de cualquier mecanismo nuevo          | `NO_APLICA` en la fase actual        | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` si resulta aprobado | alcance físico explícitamente autorizado              |

No queda una brecha detectada sin propietario y condición de salida.

---

#### 30. Cobertura de prueba ya existente

El contrato transversal de respaldo y recuperación ya materializó pruebas para:

- clasificación de objetos;
- RTO/RPO y perfiles;
- frecuencia derivada del objetivo;
- consistencia;
- cobertura de Supabase y Storage;
- secretos y llaves;
- software y artefactos;
- colas y replay;
- proveedores;
- dominios de falla;
- segregación;
- retención;
- estados de backup;
- solicitud de restore;
- aislamiento;
- validación técnica;
- validación empresarial;
- failover y retorno;
- escenarios de corrupción y pérdida;
- ejercicios y evidencia.

El registro canónico de continuidad además protege específicamente el inventario, la política, la restauración probada, la reentrada idempotente, la reconciliación y los ejercicios donde participa esta tarea. `TI-DOM-011` materializa esas reglas para los servicios y objetos de BLOQUE Z sin ampliar ni alterar su condición verificable.

---

#### 31. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** las condiciones verificables de respaldo, restauración, recuperación, consistencia, seguridad, ejercicios, reconciliación y continuidad ya están protegidas por requisitos canónicos vigentes. Esta tarea las especializa para las identidades y servicios tecnológicos, materializa matrices y responsabilidades y conserva las mismas condiciones de prueba sin crear una obligación ejecutable nueva.

---

#### 32. Criterios de aceptación

`TI-DOM-011` queda documentalmente completa cuando:

1. existe un contrato único de recuperación técnica;
2. respaldo, réplica, snapshot, archivo, exportación, rollback, failover, restore, recuperación técnica y continuidad permanecen separados;
3. los cinco perfiles cualitativos están conservados sin tiempos inventados;
4. los nueve estados del ciclo de backup están conservados;
5. las quince clases recuperables tienen decisión explícita;
6. los once servicios tecnológicos tienen decisión de recuperación;
7. las siete clases del grafo tienen decisión de recuperación;
8. `COMPLETED_UNVERIFIED` no puede presentarse como restaurable;
9. la política deriva frecuencia del objetivo, no al contrario;
10. Supabase se trata como conjunto de esquema, datos, seguridad, Auth, Storage, Realtime, Edge Functions, secretos, migraciones, jobs e integraciones;
11. secretos y llaves están separados del backup ordinario;
12. la primera restauración de prueba usa aislamiento cuando sea posible;
13. efectos externos reales se suprimen durante pruebas controladas;
14. restauración no revive autoridad o consentimiento obsoletos sin reconciliación;
15. colas, reintentos y trabajo offline se reconcilian antes de replay;
16. validación técnica y empresarial permanecen separadas;
17. rollback y restore permanecen separados;
18. failover y retorno permanecen separados;
19. `TI-DOM-010` puede observar el estado sin convertir telemetría en evidencia de restore;
20. BLOQUE AC conserva BIA, MTPD, MBCO, RTO/RPO y activación de continuidad;
21. los datos AS-IS están diferenciados entre implementado, especificado, pendiente de evidencia, fuera de alcance y no aplica;
22. toda brecha tiene propietario y condición de salida;
23. no se ejecuta ningún cambio físico;
24. no se crean ni modifican requisitos de prueba;
25. `TI-DOM-012` queda únicamente reservada.

---

#### 33. Estado de los artefactos

| Artefacto                                    | Estado                                                      |
| -------------------------------------------- | ----------------------------------------------------------- |
| `TI-TECHNICAL-RECOVERY-CONTRACT-001`         | `ESPECIFICADO`                                              |
| `TI-RECOVERY-SERVICE-MATRIX-001`             | `ESPECIFICADO`                                              |
| `TI-RECOVERABLE-TECHNICAL-OBJECT-MATRIX-001` | `ESPECIFICADO`                                              |
| `TI-BACKUP-RESTORE-GATE-CONTRACT-001`        | `ESPECIFICADO`                                              |
| `TI-RECOVERY-ORDER-CONTRACT-001`             | `ESPECIFICADO`                                              |
| `TI-CONTINUITY-HANDOFF-MATRIX-001`           | `ESPECIFICADO`                                              |
| `TI-RECOVERY-ASIS-RECONCILIATION-001`        | `ESPECIFICADO`                                              |
| Implementación física de backup/restore      | `NO_APLICA` en esta tarea                                   |
| Restore drills reales                        | `PENDIENTE_DE_EVIDENCIA` hasta fase y ejercicio autorizados |
| Objetivos numéricos empresariales            | `FUERA_DE_ALCANCE` — BLOQUE AC                              |

---

#### 34. Continuidad

ÚLTIMA TAREA APROBADA
`TI-DOM-010 — Definir monitoreo, eventos técnicos, alertas, logs, salud y observabilidad de servicios`

TAREA ACTUAL APROBADA
`TI-DOM-011 — Definir respaldo, restauración, recuperación técnica y relación con continuidad empresarial`

SIGUIENTE TAREA RESERVADA
`TI-DOM-012 — Definir licencias, asientos, garantías, contratos, renovaciones, uso y costos tecnológicos`


### ✅ TI-DOM-012 — Definir licencias, asientos, garantías, contratos, renovaciones, uso y costos tecnológicos

**Estado:** APROBADA
**Tarea anterior:** `TI-DOM-011 — Definir respaldo, restauración, recuperación técnica y relación con continuidad empresarial` — APROBADA
**Tarea siguiente:** `TI-DOM-013 — Definir base de conocimiento, capacitación, adopción y comunicación de cambios tecnológicos` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada del gobierno comercial-tecnológico de licencias, asientos, garantías, contratos, renovaciones, uso y costos
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/01_DOMINIO_DE_TECNOLOGIA_Y_SOPORTE.md`
**Artefactos producidos:** `TI-TECHNOLOGY-COMMERCIAL-GOVERNANCE-CONTRACT-001`; `TI-TECHNOLOGY-LICENSE-SEAT-CONTRACT-001`; `TI-APPLICATION-ENTITLEMENT-RECONCILIATION-MATRIX-001`; `TI-TECHNOLOGY-PROVIDER-COMMERCIAL-MATRIX-001`; `TI-TECHNOLOGY-WARRANTY-CONTRACT-001`; `TI-TECHNOLOGY-RENEWAL-DECISION-MATRIX-001`; `TI-TECHNOLOGY-USAGE-COST-RECONCILIATION-CONTRACT-001`; `TI-TECHNOLOGY-ASIS-RECONCILIATION-001`
**Cambios físicos autorizados:** ninguno; no crea, modifica ni elimina proveedores, compras, contratos, licencias, asientos, garantías, cuentas, usuarios, activos, gastos, costos, tablas, funciones, políticas, RLS, migraciones, Edge Functions, secretos, configuraciones, suscripciones ni datos desplegados
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** materializar el contrato tecnológico que permite saber qué capacidad comercial habilita cada aplicación o servicio, quién es su autoridad, qué licencia o asiento aplica, qué evidencia demuestra uso, qué garantía cubre un activo, qué contrato y renovación deben seguirse, cómo se detecta sobredimensionamiento o riesgo de vencimiento y cómo se reconcilia el costo con ORIGO y NUMERA sin construir una fuente económica paralela.

---

#### 1. Resultado sustantivo

`TI-DOM-012` queda documentalmente cerrada con:

- un contrato único de gobierno comercial-tecnológico;
- una separación obligatoria entre proveedor, producto o plan, contrato, suscripción, licencia, entitlement, asiento, cuenta, credencial, factura, compromiso, gasto, costo, garantía, activo, aplicación y servicio;
- una frontera explícita entre TI, ORIGO, NUMERA, NEXO, SHELL y los propietarios funcionales;
- un contrato completo de licencia y asiento que reutiliza los estados aprobados en `TI-DOM-006`;
- una decisión explícita para las diez aplicaciones canónicas;
- una reconciliación explícita para las cinco familias de proveedor observadas en `TI-DOM-006`;
- una decisión expresa para los siete casos de hosting aún no identificados;
- un contrato de garantía que mantiene la identidad física bajo NEXO;
- un ciclo de renovación que separa alerta, análisis, decisión, compra, cambio técnico y efecto económico;
- reglas de uso, consumo, disponibilidad y rightsizing sin inferir uso desde una mera asignación;
- conciliación de costo tecnológico contra compra, contrato, compromiso y gasto;
- integración con observabilidad, soporte, cambio y recuperación;
- reconciliación AS-IS con el estado desplegado consultado en modo de solo lectura;
- cero valores comerciales, fechas, planes, cantidades o proveedores inventados;
- cero cambios físicos;
- cero cambios en requisitos de prueba.

La tarea no afirma que GitHub, Supabase, Expo/EAS, Sentry, RevenueCat o cualquier hosting tengan hoy un plan comercial, contrato, costo, asiento, fecha de renovación o propietario económico confirmado cuando esa evidencia no está disponible.

---

#### 2. Entradas canónicas conservadas

La tarea consume y conserva:

1. `TI-DOM-001`, especialmente `TI-SERVICE-010 — Licencias, garantías, contratos y costos tecnológicos`;
2. `TI-DOM-002` y la separación entre activo, endpoint, dispositivo compartido, red, impresora, aplicación y servicio;
3. `TI-DOM-003` para activos relacionados con endpoints;
4. `TI-DOM-004` para infraestructura y servicios de red;
5. `TI-DOM-005` para impresoras, periféricos, consumibles y relaciones físicas;
6. `TI-DOM-006` como catálogo de diez aplicaciones y fuente de las relaciones proveedor/licencia pendientes;
7. `TI-DOM-007` para solicitudes, incidentes, soporte y casos relacionados;
8. `TI-DOM-008` para problemas y recurrencia;
9. `TI-DOM-009` para cambios de producto, plan, configuración o proveedor cuando afecten operación;
10. `TI-DOM-010` para señales, alertas y observabilidad;
11. `TI-DOM-011` para recuperación, exportabilidad y salida de proveedor;
12. `CAP-SCOPE-015`, en particular `CAP-15.10`;
13. ORIGO como autoridad de proveedor, compra y contrato;
14. NUMERA como autoridad de compromiso, gasto, costo y conciliación económica;
15. NEXO como autoridad del activo físico, compra relacionada, garantía, mantenimiento y retiro;
16. SHELL como autoridad de identidad, catálogo de aplicaciones y autorización;
17. los propietarios funcionales como autoridad de necesidad empresarial;
18. el registro vigente de requisitos de prueba y su cobertura transversal;
19. el estado desplegado disponible en Supabase únicamente como evidencia AS-IS.

Esta tarea no modifica las identidades heredadas. Las profundiza dentro del alcance comercial-tecnológico.

---

#### 3. Regla raíz de autoridad

Se conserva:

```text
ORIGO
→ proveedor, compra, contrato y condición comercial

NUMERA
→ compromiso, gasto, costo, periodo, centro de costo y conciliación económica

NEXO
→ activo físico, compra relacionada, valor patrimonial operativo, garantía,
  mantenimiento y retiro

SHELL
→ identidad, cuenta empresarial, aplicación y política de acceso

TI
→ necesidad técnica, relación licencia/asiento/capacidad,
  asignación técnica, uso observado, renovación operativa,
  riesgo de expiración, soporte y relación con el servicio

PROPIETARIO FUNCIONAL
→ necesidad empresarial y aceptación de continuidad o retiro
```

Invariantes:

1. TI no se convierte en maestro de proveedor, contrato o costo;
2. ORIGO no decide por sí solo si una capacidad técnica sigue siendo necesaria;
3. NUMERA no convierte una fila de gasto en licencia activa;
4. NEXO no convierte `commercial_value` en gasto tecnológico realizado;
5. SHELL no convierte una cuenta en asiento de licencia;
6. el proveedor no se convierte en fuente de identidad empresarial;
7. una factura no demuestra uso;
8. un pago no demuestra entitlement vigente;
9. una licencia no concede autorización empresarial;
10. una suscripción activa no demuestra criticidad ni necesidad.

---

#### 4. Separaciones obligatorias

Se fija:

```text
PROVIDER
≠ PRODUCT_OR_PLAN
≠ CONTRACT
≠ SUBSCRIPTION
≠ LICENSE
≠ ENTITLEMENT
≠ SEAT
≠ ACCOUNT
≠ CREDENTIAL
≠ INVOICE
≠ COMMITMENT
≠ EXPENSE
≠ COST
≠ WARRANTY
≠ ASSET
≠ APPLICATION
≠ TECH_SERVICE
```

Definiciones:

| Objeto            | Significado                                                                   |
| ----------------- | ----------------------------------------------------------------------------- |
| `PROVIDER`        | tercero o contraparte que entrega un producto, servicio, soporte o capacidad  |
| `PRODUCT_OR_PLAN` | oferta comercial o técnica identificable del proveedor                        |
| `CONTRACT`        | acuerdo comercial o jurídico gobernado por su fuente propietaria              |
| `SUBSCRIPTION`    | relación recurrente de consumo o acceso; puede existir sin modelo por asiento |
| `LICENSE`         | derecho de uso sobre producto o capacidad                                     |
| `ENTITLEMENT`     | alcance concreto de derechos habilitados por licencia, plan o contrato        |
| `SEAT`            | unidad asignable de un entitlement cuando el modelo comercial la utiliza      |
| `ACCOUNT`         | identidad registrada ante un proveedor o sistema                              |
| `CREDENTIAL`      | material de autenticación                                                     |
| `INVOICE`         | documento de cobro; no es licencia ni uso                                     |
| `COMMITMENT`      | obligación económica reconocida por su autoridad                              |
| `EXPENSE`         | hecho económico reconocido por NUMERA                                         |
| `COST`            | medida económica derivada de hechos y reglas trazables                        |
| `WARRANTY`        | derecho de cobertura sobre un activo o producto bajo condiciones determinadas |
| `ASSET`           | bien físico con identidad NEXO                                                |
| `APPLICATION`     | aplicación canónica de VENTO                                                  |
| `TECH_SERVICE`    | familia de servicio tecnológico que consume o administra capacidades          |

---

#### 5. Contrato `TI-TECHNOLOGY-COMMERCIAL-GOVERNANCE-CONTRACT-001`

Toda capacidad comercial-tecnológica administrada deberá poder relacionar, cuando aplique:

```text
commercial_relation_id
provider_ref
product_or_plan
contract_ref
subscription_ref
license_ref
entitlement_ref
seat_model
seat_ref
account_ref
application_refs[]
tech_service_refs[]
asset_refs[]
business_owner_ref
technical_owner_ref
procurement_owner_ref
economic_owner_ref
start_at
renewal_at
end_at
cancellation_window_ref
auto_renewal_state
usage_evidence_ref
quantity_entitled
quantity_assigned
quantity_usage_confirmed
cost_ref
cost_center_ref
currency_ref
support_ref
warranty_ref
exit_ref
evidence_refs[]
reconciliation_state
```

Reglas:

- los campos económicos son referencias a NUMERA u ORIGO cuando exista fuente propietaria;
- los datos de identidad y acceso son referencias a SHELL o a la autoridad correspondiente;
- no se almacenan secretos ni credenciales dentro del contrato;
- un campo sin evidencia queda `PENDIENTE_DE_EVIDENCIA`;
- la ausencia de dato no se sustituye por cero;
- una cantidad ilimitada no se representa con un número arbitrariamente alto;
- un plan gratuito no se presenta como costo cero verificado sin evidencia del plan vigente;
- una oferta observada públicamente no prueba que VENTO tenga ese plan;
- una relación técnica confirmada no prueba relación comercial.

---

#### 6. Contrato `TI-TECHNOLOGY-LICENSE-SEAT-CONTRACT-001`

Se reutilizan exactamente los estados de licencia aprobados en `TI-DOM-006`:

1. `PENDIENTE_DE_EVIDENCIA`
2. `ACTIVE`
3. `SUSPENDED`
4. `EXPIRING`
5. `EXPIRED`
6. `CANCELLED`
7. `NO_APLICA`

La clasificación no se eleva a `ACTIVE` por:

- una cuenta existente;
- un SDK instalado;
- una aplicación que responde;
- una factura aislada;
- una orden histórica;
- una tarjeta registrada;
- una credencial disponible;
- un correo comercial;
- un monto encontrado en una hoja de cálculo;
- un plan mostrado por el proveedor.

Una licencia o entitlement deberá conservar:

```text
license_ref
provider_ref
product_or_plan
contract_ref
license_model
entitlement_scope
seat_model
quantity_entitled
business_owner_ref
technical_owner_ref
effective_from
renewal_at
effective_to
auto_renewal_state
usage_evidence_ref
cost_ref
exit_ref
status
evidence_refs[]
```

---

#### 7. Modelos de licencia y entitlement

El modelo deberá clasificarse por evidencia del proveedor o contrato, sin forzar un esquema por asiento.

Clases normalizadas:

| Clase                    | Uso                                                      |
| ------------------------ | -------------------------------------------------------- |
| `NAMED_USER`             | derecho asignado a una identidad nominal                 |
| `CONCURRENT_USER`        | límite por uso simultáneo sin asiento nominal permanente |
| `DEVICE`                 | derecho ligado a un dispositivo o activo elegible        |
| `ORGANIZATION_OR_TENANT` | derecho a nivel de organización, tenant o workspace      |
| `CAPACITY_OR_TIER`       | derecho condicionado por capacidad, plan o nivel         |
| `USAGE_BASED`            | derecho/costo determinado por consumo medible            |
| `HYBRID`                 | combinación demostrada de dos o más modelos              |

Reglas:

1. `seat_model` solo se usa cuando el producto realmente tiene unidad asignable;
2. una licencia organizacional no se convierte artificialmente en asientos;
3. un modelo por consumo no se convierte en asientos por comodidad de reporte;
4. la cuenta de servicio no implica una licencia independiente;
5. un usuario invitado puede o no consumir asiento; se determina por contrato;
6. un dispositivo compartido puede consumir entitlement sin convertir al trabajador activo en propietario del asiento;
7. el modelo se versiona cuando cambia el plan o contrato.

---

#### 8. Asiento, asignación y acceso

Se fija:

```text
SEAT_ASSIGNMENT
≠ ACCESS_GRANT
≠ PROVIDER_ACCOUNT
≠ ACTIVE_SESSION
```

Cada asiento, cuando exista, deberá poder declarar:

```text
seat_ref
license_ref
assignment_target_type
assignment_target_ref
assigned_at
effective_from
effective_to
assignment_reason
usage_evidence_ref
reclaim_candidate_state
reconciliation_state
evidence_refs[]
```

`assignment_target_type` puede referenciar únicamente una identidad válida para el modelo demostrado, por ejemplo:

- trabajador;
- cuenta técnica;
- aplicación;
- dispositivo;
- servicio;
- tenant.

Reglas:

1. asignar un asiento no concede permiso empresarial;
2. revocar acceso no demuestra que el asiento haya sido liberado;
3. liberar asiento no revoca por sí solo una cuenta;
4. una cuenta compartida no sirve como identidad suficiente para un asiento nominal;
5. una identidad retirada o sin vínculo vigente produce revisión de asiento, no borrado automático de historia;
6. un asiento reasignado conserva la asignación anterior como historia;
7. una asignación sin licencia o entitlement vigente queda bloqueada para conciliación;
8. un asiento no se asigna dos veces simultáneamente cuando el modelo no lo permite.

---

#### 9. Cantidades y disponibilidad

Para modelos finitos por asiento:

```text
ENTITLED
= cantidad reconocida por contrato o proveedor

ASSIGNED
= asignaciones vigentes reconciliadas

AVAILABLE
= ENTITLED - ASSIGNED
```

La fórmula se usa solo si:

- existe cantidad finita demostrada;
- las asignaciones están reconciliadas;
- el proveedor no aplica reglas adicionales que modifiquen la disponibilidad.

Reglas:

1. `AVAILABLE < 0` es una anomalía de conciliación, no una cantidad normal;
2. `NULL` no equivale a cero;
3. unlimited, usage-based o tenant-wide no reciben una cantidad ficticia;
4. cantidad comprada no equivale a cantidad usada;
5. cantidad asignada no equivale a uso efectivo;
6. cantidad usada no autoriza compra adicional sin decisión;
7. una reducción de cantidad requiere verificar dependencia y continuidad antes de materializarse.

---

#### 10. Uso y evidencia de consumo

Se separa:

```text
ASSIGNED
≠ USED
≠ NEEDED
≠ CRITICAL
```

Una evidencia de uso puede provenir, según proveedor:

- actividad de cuenta;
- consumo de API;
- ejecuciones;
- builds;
- usuarios activos;
- almacenamiento;
- ancho de banda;
- eventos;
- dispositivos habilitados;
- tickets o soporte utilizado;
- utilización de capacidad;
- telemetría del propio servicio.

Reglas:

1. el indicador de uso debe declarar fuente y periodo observado;
2. no usar una herramienta durante una ventana corta no prueba que sea innecesaria;
3. una capacidad pasiva, de contingencia o recuperación puede ser necesaria sin uso frecuente;
4. el uso de una cuenta no demuestra que el asiento correspondiente esté correctamente asignado;
5. la ausencia de telemetría deja uso `PENDIENTE_DE_EVIDENCIA`;
6. los datos de uso sensibles se minimizan;
7. no se copia información personal innecesaria desde consolas de proveedor.

---

#### 11. Rightsizing y sobredimensionamiento

Una licencia, plan o capacidad puede ser candidata a rightsizing cuando exista evidencia de:

- asientos asignados sin identidad vigente;
- asientos disponibles persistentemente por encima de la necesidad aprobada;
- capacidad contratada muy superior al consumo observado;
- producto duplicado por dos proveedores sin justificación;
- aplicación retirada que mantiene suscripción;
- plan premium con funciones no utilizadas cuando la alternativa inferior mantiene los requisitos;
- proveedor que sigue facturando después de cancelación documentada;
- múltiples contratos para la misma capacidad sin causa aprobada.

La detección es una señal de revisión.

```text
RIGHTSIZING_CANDIDATE
≠ AUTOMATIC_CANCEL
≠ AUTOMATIC_DOWNGRADE
```

La decisión conserva propietario, impacto, dependencia, costo, salida, seguridad, continuidad y evidencia.

---

#### 12. Ciclo de renovación

El ciclo conceptual queda:

```text
RELACIÓN VIGENTE
→ FECHAS Y CONDICIONES DEMOSTRADAS
→ SEÑAL DE RENOVACIÓN
→ SNAPSHOT DE USO
→ SNAPSHOT DE COSTO
→ DEPENDENCIAS Y CRITICIDAD
→ ALTERNATIVAS Y SALIDA
→ DECISIÓN
→ COMPRA / CONTRATO SI APLICA
→ CAMBIO TÉCNICO SI APLICA
→ CONCILIACIÓN ECONÓMICA
→ EVIDENCIA
```

La señal no ejecuta la decisión.

Se aprueban siete resultados documentales de decisión:

1. `RENEW`
2. `RIGHTSIZE`
3. `RENEGOTIATE`
4. `MIGRATE_OR_EXIT`
5. `CANCEL`
6. `NO_ACTION_REQUIRED`
7. `PENDIENTE_DE_EVIDENCIA`

Una decisión de renovación deberá poder relacionar:

```text
renewal_ref
provider_ref
product_or_plan
contract_ref
license_ref
current_term_ref
renewal_at
cancellation_window_ref
notice_deadline_ref
auto_renewal_state
business_owner_ref
technical_owner_ref
usage_snapshot_ref
cost_snapshot_ref
dependency_snapshot_ref
support_snapshot_ref
exit_ref
decision
decision_reason
decision_at
procurement_ref
change_ref
evidence_refs[]
```

No se inventa una fecha de aviso si el contrato no la demuestra.

---

#### 13. Renovación automática

```text
AUTO_RENEWAL_ENABLED
≠ BUSINESS_APPROVAL
```

Reglas:

1. la existencia de auto-renovación debe conocerse por evidencia;
2. si está activa, la ventana de cancelación debe correlacionarse con la decisión;
3. desactivar auto-renovación puede requerir autorización y evidencia del proveedor;
4. la renovación automática no justifica mantener asientos o capacidad innecesarios;
5. una alerta tardía no reescribe las condiciones contractuales;
6. una renovación ejecutada sin decisión previa se registra como hecho y genera conciliación, no como aprobación retroactiva.

---

#### 14. Contrato y suscripción

ORIGO conserva el contrato y la relación comercial propietaria.

TI conserva referencias suficientes para responder:

- qué servicio o aplicación depende del contrato;
- qué producto o plan habilita;
- qué entitlement produce;
- qué soporte incluye;
- qué ambientes cubre;
- qué datos o integración dependen del proveedor;
- qué renovación o terminación puede afectar operación;
- qué salida o exportación existe;
- qué cambio técnico debe ejecutarse si cambia.

Prohibiciones:

- duplicar el documento contractual como texto libre en TI;
- convertir una orden de compra en contrato cuando no lo sea;
- convertir una factura en prueba de entitlement;
- convertir una suscripción de usuario final en licencia tecnológica sin autoridad;
- editar condiciones históricas para reflejar un término nuevo;
- conservar credenciales en la ficha contractual.

---

#### 15. Contrato `TI-TECHNOLOGY-WARRANTY-CONTRACT-001`

La garantía permanece vinculada al activo o producto físico propietario de NEXO.

```text
WARRANTY
≠ SUPPORT_CONTRACT
≠ MAINTENANCE_PLAN
≠ ASSET_HEALTH
≠ INCIDENT
≠ REPLACEMENT_ASSET
```

Cada garantía tecnológica deberá poder referenciar:

```text
warranty_ref
asset_ref
product_ref
provider_or_manufacturer_ref
purchase_ref
invoice_or_document_ref
coverage_scope_ref
effective_from
effective_to
claim_channel_ref
support_ref
replacement_terms_ref
evidence_refs[]
status
```

Estados documentales admitidos:

- `PENDIENTE_DE_EVIDENCIA`
- `ACTIVE`
- `EXPIRING`
- `EXPIRED`
- `NO_APLICA`

Reglas:

1. `warranty_until` sin documento o alcance no demuestra cobertura completa;
2. garantía vigente no demuestra que el activo esté operativo;
3. garantía vencida no retira el activo;
4. mantenimiento no extiende garantía salvo evidencia;
5. soporte contratado no se presenta como garantía del fabricante;
6. un caso de garantía puede correlacionarse con soporte, pero no sustituye el incidente;
7. reparación conserva la identidad del activo cuando sigue siendo el mismo bien;
8. sustitución por otro bien requiere la identidad NEXO correspondiente;
9. garantía, compra, factura y costo permanecen relacionados pero separados.

---

#### 16. Costos tecnológicos

TI no crea un ledger económico.

Se reconocen como modalidades comerciales descriptivas:

| Modalidad                       | Uso tecnológico                       |
| ------------------------------- | ------------------------------------- |
| `FIXED_RECURRING`               | cargo periódico fijo                  |
| `PER_SEAT`                      | cargo asociado a cantidad de asientos |
| `USAGE_BASED`                   | cargo asociado a consumo              |
| `CAPACITY_OR_TIER`              | cargo por nivel o capacidad           |
| `ONE_TIME`                      | adquisición o servicio no recurrente  |
| `SUPPORT_OR_MAINTENANCE`        | soporte o mantenimiento contratado    |
| `HARDWARE_ACQUISITION`          | adquisición de activo físico          |
| `WARRANTY_OR_SUPPORT_EXTENSION` | extensión comercial de cobertura      |
| `MIXED`                         | combinación demostrada de modalidades |

Estas modalidades describen la relación tecnológica. El hecho económico efectivo pertenece a NUMERA.

Se fija:

```text
CATALOG_PRICE
≠ CONTRACTED_PRICE
≠ INVOICE_AMOUNT
≠ COMMITMENT
≠ PAID_AMOUNT
≠ EXPENSE
≠ ALLOCATED_COST
```

---

#### 17. Contrato `TI-TECHNOLOGY-USAGE-COST-RECONCILIATION-CONTRACT-001`

Para relacionar costo y tecnología se exige trazabilidad:

```text
PROVIDER
→ PRODUCT / PLAN
→ CONTRACT / PURCHASE
→ LICENSE / ENTITLEMENT
→ APPLICATION / SERVICE / ASSET
→ COMMITMENT / EXPENSE
→ COST CENTER
→ RECONCILIATION
```

Campos conceptuales:

```text
technology_cost_relation_id
provider_ref
product_or_plan
contract_ref
purchase_ref
license_ref
application_refs[]
tech_service_refs[]
asset_refs[]
expense_ref
commitment_ref
cost_center_ref
economic_period_ref
currency_ref
allocation_basis_ref
usage_snapshot_ref
reconciliation_state
evidence_refs[]
```

Reglas:

1. monto, moneda, impuesto y periodo provienen de la autoridad económica;
2. TI puede explicar el destino tecnológico, no reescribir el monto;
3. una relación puede distribuirse entre aplicaciones, servicios o centros solo con base explícita;
4. una distribución conserva método y versión;
5. un monto estimado no se presenta como gasto real;
6. `commercial_value` de NEXO no se suma automáticamente como gasto;
7. una compra de hardware y su depreciación o tratamiento contable permanecen fuera de la autoridad de TI;
8. costo por asiento puede calcularse solo con precio y cantidad demostrados;
9. ahorro potencial de rightsizing es una estimación separada del gasto real;
10. el costo total tecnológico se reporta únicamente desde hechos económicos reconciliados.

---

#### 18. Alertas y observabilidad

`TI-DOM-010` podrá observar, cuando exista implementación:

- licencia próxima a vencimiento;
- contrato próximo a término;
- ventana de cancelación próxima;
- auto-renovación sin decisión registrada;
- asiento sin identidad vigente;
- asignación por encima del entitlement;
- capacidad contratada sin evidencia de uso suficiente;
- falla de facturación que pueda afectar servicio;
- garantía próxima a vencimiento;
- garantía vencida sobre activo crítico;
- proveedor sin propietario;
- relación comercial sin evidencia vigente;
- diferencia entre costo esperado y hecho económico reconciliado.

Reglas:

1. una alerta no renueva, cancela ni compra;
2. una alerta no cambia permisos;
3. ausencia de alerta no demuestra vigencia;
4. el umbral concreto pertenece a la política de observabilidad y no se inventa aquí;
5. la señal conserva referencia al objeto comercial, no secretos del proveedor.

---

#### 19. Relación con soporte

`TI-SERVICE-010` utiliza la mesa de servicio cuando:

- falta una licencia necesaria;
- una asignación no puede completarse;
- el proveedor suspende capacidad;
- existe duda de cobertura de garantía;
- un asiento no puede liberarse;
- una renovación tiene impacto operativo;
- una factura o estado comercial amenaza continuidad técnica;
- se requiere asistencia del proveedor.

El caso de soporte no modifica contrato, gasto, licencia o asiento por sí solo. Las acciones se ejecutan en sus autoridades propietarias.

---

#### 20. Relación con cambio tecnológico

Una decisión comercial puede requerir `TI-DOM-009`.

Ejemplos:

- cambio de plan con funciones distintas;
- migración de proveedor;
- retiro de una integración;
- cambio de tenant;
- cambio de región o capacidad;
- sustitución de software;
- reemplazo de hardware derivado de garantía;
- cambio de autenticación o cuenta técnica.

Se conserva:

```text
COMMERCIAL_DECISION
≠ CHANGE_APPROVAL
≠ CHANGE_IMPLEMENTATION
```

La renovación de un contrato sin cambio técnico no crea artificialmente un cambio de configuración.

---

#### 21. Relación con recuperación y salida

`TI-DOM-011` consume de esta tarea:

- producto o plan;
- proveedor;
- contrato;
- entitlement requerido para recuperar capacidad;
- vigencia;
- soporte;
- exportabilidad;
- restricciones de salida;
- dependencias;
- evidencia de acceso a procedimientos de recuperación.

Reglas:

1. terminar contrato exige revisar datos, integraciones, cuentas y recuperación;
2. cancelar licencia no elimina automáticamente datos del proveedor;
3. restaurar una copia de contrato no reactiva una licencia;
4. una cuenta cerrada puede bloquear exportación si no se planificó salida;
5. la salida del proveedor debe poder completarse sin convertir al proveedor en única fuente de identidad empresarial.

---

#### 22. Seguridad y segregación

Se conserva:

- quien necesita una licencia no se la autoaprueba por esa necesidad;
- soporte de proveedor no recibe acceso persistente por existir contrato;
- las cuentas técnicas tienen propietario y vigencia;
- credenciales, API keys, tokens, recovery codes y secretos quedan fuera del inventario comercial;
- la asignación de asiento no modifica RBAC;
- facturas, contratos, precios negociados y datos bancarios usan su autoridad y control de acceso;
- la telemetría de uso minimiza datos personales;
- el acceso a consola de proveedor se gobierna por las tareas de autorización;
- una cuenta personal no se convierte en fundamento permanente de una capacidad empresarial.

La segregación detallada corresponde a `TI-AUTH-001` a `TI-AUTH-004`.

---

#### 23. Matriz `TI-APPLICATION-ENTITLEMENT-RECONCILIATION-MATRIX-001`

Se preservan exactamente las diez aplicaciones de `TI-DOM-006`.

| `app_code` | Evidencia técnica heredada                 | Licencia / asiento       | Contrato / renovación    | Uso                      | Costo                    | Decisión y propietario                                                                                         |
| ---------- | ------------------------------------------ | ------------------------ | ------------------------ | ------------------------ | ------------------------ | -------------------------------------------------------------------------------------------------------------- |
| `shell`    | GitHub; Supabase; hosting no identificado  | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | TI + ORIGO + NUMERA; demostrar plan, cuenta, entitlement, uso, renovación y costo                              |
| `anima`    | GitHub; Supabase; Expo/EAS; Sentry SDK     | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | TI + ORIGO + NUMERA; demostrar planes, cuentas, asientos si aplican, uso, soporte y costo                      |
| `viso`     | GitHub; Supabase; hosting no identificado  | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | TI + ORIGO + NUMERA; reconciliar relaciones comerciales con la operación real                                  |
| `nexo`     | GitHub; Supabase; hosting no identificado  | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | TI + ORIGO + NUMERA; reconciliar relaciones comerciales y dependencia de activos/periféricos                   |
| `fogo`     | GitHub; Supabase; hosting no identificado  | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | TI + ORIGO + NUMERA; reconciliar relaciones comerciales con capacidad productiva                               |
| `origo`    | GitHub; Supabase; hosting no identificado  | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | TI + ORIGO + NUMERA; conservar separación entre la aplicación ORIGO y sus propios proveedores                  |
| `pulso`    | GitHub; Supabase; hosting no identificado  | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | TI + ORIGO + NUMERA; reconciliar relaciones comerciales con operación POS                                      |
| `numera`   | GitHub; Supabase; hosting no identificado  | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | TI + ORIGO + NUMERA; la aplicación no es autoridad de su propia licencia por el solo hecho de registrar costos |
| `aura`     | proveedores actuales no confirmados        | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | auditoría AURA conserva decisión de continuidad; TI reconcilia relaciones si continúa                          |
| `pass`     | GitHub; Supabase; Expo/EAS; RevenueCat SDK | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | TI + ORIGO + NUMERA; demostrar planes, producto contratado, renovación, uso y costo                            |

Reconciliación:

```text
10 aplicaciones esperadas
10 aplicaciones materializadas
0 omitidas
0 duplicadas
0 añadidas
10 con decisión comercial explícita
0 con licencia inventada
0 con asiento inventado
0 con costo inventado
```

---

#### 24. Matriz `TI-TECHNOLOGY-PROVIDER-COMMERCIAL-MATRIX-001`

Se preservan las cinco familias externas cuya relación técnica fue reconocida en `TI-DOM-006`.

| Familia    | Evidencia técnica heredada                                        | Alcance observado                             | Contrato                 | Licencia / asiento       | Renovación               | Uso comercial            | Costo                    | Estado                                                           |
| ---------- | ----------------------------------------------------------------- | --------------------------------------------- | ------------------------ | ------------------------ | ------------------------ | ------------------------ | ------------------------ | ---------------------------------------------------------------- |
| GitHub     | repositorios actuales                                             | nueve aplicaciones con repositorio confirmado | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | relación técnica confirmada; relación comercial no demostrada    |
| Supabase   | SDK en nueve repositorios confirmados y proyecto VENTO observable | nueve aplicaciones con repositorio confirmado | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | dependencia técnica confirmada; relación comercial no demostrada |
| Expo/EAS   | configuración técnica                                             | `anima`, `pass`                               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | configuración confirmada; plan/cuenta no demostrados             |
| Sentry     | SDK observado                                                     | `anima`                                       | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | SDK no prueba servicio contratado o activo                       |
| RevenueCat | SDK observado                                                     | `pass`                                        | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | SDK no prueba producto contratado ni costo                       |

Control:

```text
5 familias esperadas
5 familias materializadas
0 omitidas
0 duplicadas
5 con estado comercial pendiente de evidencia
```

---

#### 25. Hosting no identificado

Las siete aplicaciones Next.js con repositorio confirmado:

- `shell`;
- `viso`;
- `nexo`;
- `fogo`;
- `origo`;
- `pulso`;
- `numera`;

conservan `hosting = PENDIENTE_DE_EVIDENCIA`.

Reglas:

1. no se crea una identidad de proveedor por inferencia del framework;
2. una URL que responda no identifica automáticamente el contrato de hosting;
3. un dominio DNS no prueba quién paga ni qué plan existe;
4. la condición de salida exige proveedor, cuenta, propietario, plan, renovación, costo y evidencia;
5. el hosting pendiente no se cuenta dentro de las cinco familias confirmadas.

---

#### 26. Garantías y activos: reconciliación AS-IS

El esquema desplegado de NEXO dispone de campos y documentos capaces de representar:

- fecha de compra;
- inicio de uso;
- `warranty_until`;
- valor comercial;
- referencia de factura de compra;
- documentos con tipo `warranty`.

La lectura AS-IS disponible muestra:

| Control                                       | Resultado |
| --------------------------------------------- | --------: |
| `asset_items` existentes                      |        38 |
| con `commercial_value` informado              |        29 |
| con `purchase_date` informada                 |        25 |
| con `warranty_until` informado                |         0 |
| con referencia de factura de compra informada |         1 |
| `asset_documents` existentes                  |         0 |

Una búsqueda nominal de candidatos tecnológicos encontró tres registros que requieren reconciliación con el inventario tecnológico, sin elevar la coincidencia nominal a binding canónico:

| `asset_code`                     | Nombre runtime             | Estado de garantía observable | Decisión                                                                       |
| -------------------------------- | -------------------------- | ----------------------------- | ------------------------------------------------------------------------------ |
| `ACT-EQP-COMPUT-000984-MRXNMWUI` | Computadora multifuncional | `warranty_until` ausente      | `PENDIENTE_DE_EVIDENCIA`; reconciliar identidad tecnológica y cobertura        |
| `ACT-EQP-MULTIF-000932-MRF4E56U` | Multifuncional epson       | `warranty_until` ausente      | `PENDIENTE_DE_EVIDENCIA`; no vincular a PRINT-ARC sin evidencia                |
| `ACT-EQP-TABLET-000985-MRXNO5BA` | Tablet lenovo              | `warranty_until` ausente      | `PENDIENTE_DE_EVIDENCIA`; reconciliar con endpoint antes de atribuir cobertura |

Consecuencias:

- no existe una garantía verificable por esos campos en las 38 unidades actuales;
- ello no demuestra que físicamente no exista garantía;
- la evidencia puede residir fuera de las estructuras consultadas;
- los nueve targets de PRINT-ARC no reciben garantía por identidad de impresión;
- una garantía solo se relaciona con un activo NEXO reconciliado.

---

#### 27. Proveedores, compras y costos: reconciliación AS-IS

La lectura desplegada muestra:

| Superficie                                                                                                          | Resultado observado            |
| ------------------------------------------------------------------------------------------------------------------- | ------------------------------ |
| proveedores en `public.suppliers`                                                                                   | 91                             |
| coincidencias de nombre contra las cinco familias tecnológicas conocidas y términos tecnológicos consultados        | 0                              |
| órdenes en `public.purchase_orders`                                                                                 | 3                              |
| órdenes observadas vinculadas nominalmente a las cinco familias tecnológicas conocidas                              | 0                              |
| filas en `public.numera_expenses`                                                                                   | 0                              |
| categorías de gasto NUMERA                                                                                          | 7 categorías genéricas activas |
| tablas públicas cuyo nombre identifica licencia, contrato, suscripción, asiento, renovación, garantía o entitlement | 0                              |

Las siete categorías NUMERA observadas son:

- arriendo;
- nómina;
- servicios públicos;
- mantenimiento;
- mercadeo;
- insumos no inventariables;
- otros gastos.

Interpretación:

1. el maestro de proveedores existe, pero la búsqueda actual no demuestra proveedor tecnológico reconciliado;
2. la estructura de órdenes existe, pero las tres órdenes observadas no prueban compra tecnológica;
3. la estructura económica NUMERA existe, pero actualmente no contiene hechos de gasto;
4. las categorías genéricas no constituyen por sí mismas un catálogo comercial tecnológico;
5. la ausencia de tabla dedicada no autoriza a construir una tabla paralela durante esta tarea;
6. la futura implementación deberá decidir la materialización física respetando las autoridades ya definidas.

---

#### 28. Estado de Supabase relevante

El proyecto VENTO consultado se encuentra desplegado y permite observar las superficies descritas.

Para esta tarea:

- `asset_items` aporta hechos físicos y patrimoniales operativos;
- `asset_documents` puede contener evidencia documental del activo;
- `suppliers` aporta maestro de proveedor existente;
- `purchase_orders` aporta hechos de compra;
- `numera_expenses` y presupuestos aportan superficie económica;
- ninguna de esas estructuras, por sí sola, constituye el contrato tecnológico objetivo completo;
- no se observó una estructura pública dedicada por nombre a licencia, asiento, entitlement o renovación;
- no se ejecuta ninguna alteración física para cerrar esa brecha en esta fase.

---

#### 29. Regla de evidencia

Fuerza de evidencia, de menor a mayor para una relación comercial:

```text
REFERENCIA TÉCNICA
→ EVIDENCIA DE CUENTA
→ EVIDENCIA DE PLAN O ENTITLEMENT
→ EVIDENCIA CONTRACTUAL / COMERCIAL
→ EVIDENCIA DE USO
→ EVIDENCIA ECONÓMICA RECONCILIADA
```

Cada nivel responde una pregunta distinta.

Ejemplos:

- SDK → prueba dependencia de código, no contrato;
- cuenta → prueba identidad en proveedor, no asiento;
- entitlement → prueba derecho, no necesidad;
- contrato → prueba condición comercial, no uso;
- telemetría → prueba consumo, no costo;
- gasto → prueba hecho económico, no licencia vigente.

Ninguna capa sustituye a las demás.

---

#### 30. Matriz `TI-TECHNOLOGY-RENEWAL-DECISION-MATRIX-001`

La decisión se evalúa con estas dimensiones:

| Dimensión   | Pregunta obligatoria                                                                                     |
| ----------- | -------------------------------------------------------------------------------------------------------- |
| Necesidad   | ¿qué proceso, aplicación o servicio necesita la capacidad?                                               |
| Criticidad  | ¿qué capacidad se degrada si se retira?                                                                  |
| Uso         | ¿qué evidencia de utilización existe y para qué periodo?                                                 |
| Asientos    | ¿cuántos están habilitados, asignados, utilizados y disponibles cuando el modelo aplica?                 |
| Costo       | ¿qué hecho económico y centro de costo lo soportan?                                                      |
| Contrato    | ¿qué término, ventana, auto-renovación y restricciones aplican?                                          |
| Soporte     | ¿qué SLA, soporte o garantía se perderían?                                                               |
| Seguridad   | ¿qué cuentas, secretos, datos y privilegios dependen del proveedor?                                      |
| Continuidad | ¿qué recuperación, fallback o dependencia crítica existe?                                                |
| Salida      | ¿cómo se exportan datos y se retiran cuentas/integraciones?                                              |
| Alternativa | ¿existe opción equivalente validada?                                                                     |
| Decisión    | renovar, redimensionar, renegociar, migrar/salir, cancelar, no actuar o mantener pendiente por evidencia |

No se permite seleccionar una decisión únicamente por precio o únicamente por consumo.

---

#### 31. Ciclo de baja comercial y técnica

La terminación de una relación tecnológica sigue:

```text
DECISIÓN APROBADA
→ CONDICIÓN CONTRACTUAL
→ COMPRA / CANCELACIÓN
→ CAMBIO TÉCNICO
→ EXPORTACIÓN / RETENCIÓN
→ REVOCACIÓN DE ACCESOS
→ LIBERACIÓN DE ASIENTOS
→ RETIRO DE INTEGRACIONES
→ RECONCILIACIÓN DE COSTOS
→ EVIDENCIA DE CIERRE
```

Reglas:

1. el orden concreto depende del proveedor y del riesgo;
2. cancelar primero puede impedir exportar datos;
3. eliminar cuenta primero puede impedir facturación o soporte de cierre;
4. una factura final no confirma cierre técnico;
5. una aplicación retirada no elimina automáticamente el contrato;
6. una licencia cancelada no elimina el gasto ya causado;
7. el cierre debe reconciliar obligaciones, datos, accesos, integraciones y recuperación.

---

#### 32. Brechas y propietarios

| Brecha                                                                                      | Estado                               | Propietario exacto                               | Condición de salida                                          |
| ------------------------------------------------------------------------------------------- | ------------------------------------ | ------------------------------------------------ | ------------------------------------------------------------ |
| plan, contrato, entitlement, asiento y renovación de las cinco familias técnicas observadas | `PENDIENTE_DE_EVIDENCIA`             | TI + ORIGO                                       | evidencia contractual/comercial reconciliada                 |
| uso y cantidad necesaria de licencias o capacidad                                           | `PENDIENTE_DE_EVIDENCIA`             | TI + propietario funcional                       | fuente, periodo y criterio de uso demostrables               |
| costo tecnológico realizado por proveedor/aplicación/servicio                               | `PENDIENTE_DE_EVIDENCIA`             | NUMERA + ORIGO + TI                              | hecho económico y relación tecnológica reconciliados         |
| hosting de siete aplicaciones Next.js                                                       | `PENDIENTE_DE_EVIDENCIA`             | `TI-DOM-006` + TI + ORIGO                        | proveedor, cuenta, propietario y evidencia técnica/comercial |
| proveedores actuales de AURA                                                                | `PENDIENTE_DE_EVIDENCIA`             | `AURA-AUD-001` a `AURA-AUD-010`                  | auditoría y decisión de continuidad                          |
| garantía de activos tecnológicos actuales                                                   | `PENDIENTE_DE_EVIDENCIA`             | NEXO + TI                                        | activo reconciliado, documento/condición y vigencia          |
| alertas productivas de renovación, asiento, costo y garantía                                | `FUERA_DE_ALCANCE` de implementación | `TI-DOM-010`; `TI-INT-001`; `TI-UX-005`          | implementación autorizada y fuentes conectadas               |
| permisos sobre contratos, precios, licencias y consolas                                     | `FUERA_DE_ALCANCE`                   | `TI-AUTH-001` a `TI-AUTH-004`                    | segregación y autorización aprobadas                         |
| integración con consolas de licenciamiento                                                  | `FUERA_DE_ALCANCE`                   | `TI-INT-003`                                     | contrato de integración y sandbox aprobados                  |
| materialización física del modelo                                                           | `NO_APLICA` en esta tarea            | paquete de implementación que resulte autorizado | alcance físico explícito y aprobado                          |

No queda una brecha detectada sin propietario y condición de salida.

---

#### 33. Estado de los artefactos

| Artefacto                                              | Estado                    |
| ------------------------------------------------------ | ------------------------- |
| `TI-TECHNOLOGY-COMMERCIAL-GOVERNANCE-CONTRACT-001`     | `ESPECIFICADO`            |
| `TI-TECHNOLOGY-LICENSE-SEAT-CONTRACT-001`              | `ESPECIFICADO`            |
| `TI-APPLICATION-ENTITLEMENT-RECONCILIATION-MATRIX-001` | `ESPECIFICADO`            |
| `TI-TECHNOLOGY-PROVIDER-COMMERCIAL-MATRIX-001`         | `ESPECIFICADO`            |
| `TI-TECHNOLOGY-WARRANTY-CONTRACT-001`                  | `ESPECIFICADO`            |
| `TI-TECHNOLOGY-RENEWAL-DECISION-MATRIX-001`            | `ESPECIFICADO`            |
| `TI-TECHNOLOGY-USAGE-COST-RECONCILIATION-CONTRACT-001` | `ESPECIFICADO`            |
| `TI-TECHNOLOGY-ASIS-RECONCILIATION-001`                | `ESPECIFICADO`            |
| licencias/asientos comerciales actuales                | `PENDIENTE_DE_EVIDENCIA`  |
| contratos/renovaciones comerciales actuales            | `PENDIENTE_DE_EVIDENCIA`  |
| uso comercial reconciliado                             | `PENDIENTE_DE_EVIDENCIA`  |
| costos tecnológicos reconciliados                      | `PENDIENTE_DE_EVIDENCIA`  |
| garantías tecnológicas verificadas                     | `PENDIENTE_DE_EVIDENCIA`  |
| implementación física del modelo                       | `NO_APLICA` en esta tarea |

---

#### 34. Cobertura de prueba consumida

La cobertura vigente ya protege:

- correlación transversal entre proveedores, licencias, contratos y costos;
- detección de licencia sin usuario;
- uso de identificadores y eventos versionados;
- autenticación mínima, idempotencia y reconciliación de adaptadores externos;
- prohibición de convertir proveedor o adaptador en maestro de contrato o costo;
- identidad, garantía, mantenimiento y retiro de activos tecnológicos;
- separación entre proveedor, condición comercial y contrato;
- trazabilidad de hechos económicos y costos hacia fuentes y centros;
- consistencia entre compra, servicio, activo, contrato y gasto;
- relaciones de aplicación con proveedor, licencia, asiento, renovación y salida.

`TI-DOM-012` especializa y materializa esas condiciones para el servicio tecnológico y las diez aplicaciones sin ampliar su condición verificable.

---

#### 35. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el alcance verificable de licencias, asignaciones, proveedores, contratos, garantías, costos y reconciliación ya está protegido por requisitos canónicos vigentes de integración, activos, abastecimiento y economía. Esta tarea materializa las fronteras, estados, matrices y handoffs tecnológicos sobre esas obligaciones existentes, sin introducir un efecto empresarial, regla de autorización o algoritmo económico adicional.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 36. Criterios de aceptación

`TI-DOM-012` queda documentalmente completa cuando:

1. existe una autoridad clara para TI, ORIGO, NUMERA, NEXO, SHELL y propietario funcional;
2. proveedor, plan, contrato, suscripción, licencia, entitlement, asiento, cuenta, credencial, factura, gasto, costo, garantía, activo, aplicación y servicio permanecen separados;
3. se conservan exactamente los siete estados de licencia heredados;
4. se definen entitlement, asiento, cantidades y disponibilidad sin forzar modelo por asiento;
5. asignación de asiento y autorización empresarial permanecen separadas;
6. uso, asignación, necesidad y criticidad permanecen separados;
7. rightsizing produce revisión y no cancelación automática;
8. renovación separa señal, decisión, compra, cambio técnico y efecto económico;
9. auto-renovación no equivale a aprobación;
10. contrato y suscripción conservan ORIGO como autoridad;
11. costo y gasto conservan NUMERA como autoridad;
12. garantía conserva NEXO como autoridad física;
13. se definen relación de garantía, soporte, mantenimiento, incidente y sustitución sin conflación;
14. las diez aplicaciones canónicas tienen decisión explícita;
15. se materializan 10/10 aplicaciones, sin omisiones ni duplicados;
16. las cinco familias técnicas heredadas tienen reconciliación comercial explícita;
17. se materializan 5/5 familias, sin omisiones ni duplicados;
18. los siete hostings no identificados permanecen pendientes y no se inventa proveedor;
19. AURA mantiene su handoff de auditoría;
20. no se inventa plan, precio, cantidad, asiento, fecha, costo o renovación;
21. el estado AS-IS diferencia estructura disponible de evidencia comercial real;
22. los 38 activos actuales se tratan sin afirmar garantías inexistentes en la evidencia consultada;
23. `commercial_value` no se convierte en gasto;
24. las tres coincidencias nominales de activos tecnológicos no se promueven a binding canónico;
25. las 91 filas de proveedor actuales no se presentan como inventario tecnológico;
26. las tres órdenes actuales no se presentan como compras tecnológicas sin evidencia;
27. cero filas de gasto actuales no se interpreta como costo tecnológico cero;
28. alertas se remiten a observabilidad sin umbrales inventados;
29. salida de proveedor se enlaza con recuperación y cambio;
30. toda brecha tiene propietario y condición de salida;
31. no se ejecuta cambio físico;
32. no se crean ni modifican requisitos de prueba;
33. `TI-DOM-013` queda únicamente reservada.

---

#### 37. Continuidad

ÚLTIMA TAREA APROBADA
`TI-DOM-011 — Definir respaldo, restauración, recuperación técnica y relación con continuidad empresarial`

TAREA ACTUAL APROBADA
`TI-DOM-012 — Definir licencias, asientos, garantías, contratos, renovaciones, uso y costos tecnológicos`

SIGUIENTE TAREA RESERVADA
`TI-DOM-013 — Definir base de conocimiento, capacitación, adopción y comunicación de cambios tecnológicos`


### ✅ TI-DOM-013 — Definir base de conocimiento, capacitación, adopción y comunicación de cambios tecnológicos

**Estado:** APROBADA
**Tarea anterior:** `TI-DOM-012 — Definir licencias, asientos, garantías, contratos, renovaciones, uso y costos tecnológicos` — APROBADA
**Tarea siguiente:** `TI-AUTH-001 — Definir roles y segregación para solicitar, diagnosticar, administrar, aprobar, cambiar y cerrar servicios tecnológicos` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada del gobierno de conocimiento técnico, capacitación contextual, evidencia de competencia, adopción y comunicación de cambios tecnológicos
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/01_DOMINIO_DE_TECNOLOGIA_Y_SOPORTE.md`
**Artefactos producidos:** `TI-KNOWLEDGE-GOVERNANCE-CONTRACT-001`; `TI-KNOWLEDGE-ARTICLE-LIFECYCLE-CONTRACT-001`; `TI-KNOWLEDGE-SOURCE-INTAKE-MATRIX-001`; `TI-TRAINING-AND-COMPETENCE-CONTRACT-001`; `TI-CHANGE-COMMUNICATION-CONTRACT-001`; `TI-ADOPTION-EVIDENCE-CONTRACT-001`; `TI-TECHNOLOGY-LEARNING-AUDIENCE-MATRIX-001`; `TI-TECHNOLOGY-LEARNING-SERVICE-MATRIX-001`; `TI-KNOWLEDGE-ASIS-RECONCILIATION-001`
**Cambios físicos autorizados:** ninguno; no crea, modifica ni elimina conocimiento persistido, anuncios, cursos, asignaciones, expedientes de competencia, tickets, mensajes, tablas, RLS, RPC, Edge Functions, migraciones, datos, cuentas, permisos, canales, configuraciones ni Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** cerrar documentalmente el último dominio `TI-DOM-*` mediante una base de conocimiento versionada y gobernada, un contrato de capacitación y competencia que no confunde lectura con aprendizaje, un modelo de adopción basado en señales trazables, un contrato de comunicación ligado a cambios aprobados y una reconciliación explícita de los once servicios tecnológicos y del estado AS-IS disponible.

---

#### 1. Resultado sustantivo

`TI-DOM-013` queda documentalmente cerrada con:

- una autoridad única de conocimiento tecnológico que no sustituye la fuente de verdad del proceso, activo, aplicación, servicio, configuración o cambio;
- una identidad estable y versionada para piezas de conocimiento;
- un ciclo de vida que permite publicar, sustituir, expirar y retirar contenido sin borrar historia;
- doce clases de fuente con decisión explícita de entrada, publicación y revisión;
- un contrato de capacitación que separa asignación, disponibilidad, inicio, finalización, comprobación, competencia y adopción;
- ocho audiencias de aprendizaje que no crean roles ni privilegios;
- once decisiones explícitas, una para cada `TI-SERVICE-001` a `TI-SERVICE-011`;
- un contrato de comunicación que consume cambios aprobados sin aprobarlos ni desplegarlos;
- un contrato de adopción con clases de señal y reglas de denominador, periodo, versión y contexto;
- una regla de soporte guiado que reutiliza conocimiento vigente y nunca instrucciones obsoletas;
- un handoff explícito desde problema, error conocido y workaround hacia conocimiento publicable;
- un handoff explícito desde cambio tecnológico hacia comunicación y material de aprendizaje;
- una reconciliación AS-IS de anuncios y soporte sin promover esos registros a base de conocimiento o aprendizaje;
- diez hallazgos con propietario y condición de salida;
- cero cambios físicos;
- cero cambios de requisitos de prueba.

No se inventan cursos, porcentajes de adopción, tasas de lectura, puntajes, umbrales de aprobación, duraciones, calendarios, destinatarios nominales, autores, instructores, canales externos ni evidencias de competencia.

---

#### 2. Entradas y decisiones heredadas

La tarea consume y conserva:

1. `CAP-15.11 — Capacitar en el uso de herramientas`;
2. la decisión de `CAP-SCOPE-015` de construir conocimiento, guías cortas, entrenamiento por rol, comprobación, novedades de versión, soporte guiado y evidencia de adopción sin saturar pantallas;
3. `H-CAP-SCOPE-015-027`, que asigna a este dominio la eliminación de dependencia de memoria personal para workarounds, procedimientos y conocimiento;
4. `H-CAP-SCOPE-015-028`, que exige vincular capacitación y adopción con cambio, versión, rol, herramienta y evidencia de comprensión;
5. `TI-SERVICE-011 — Conocimiento, capacitación y adopción tecnológica`;
6. los once servicios `TI-SERVICE-001` a `TI-SERVICE-011`;
7. `TI-DOM-006` como autoridad del catálogo de aplicaciones y sus ambientes;
8. `TI-DOM-007` como autoridad de solicitudes, incidentes, comunicación de casos y cierre;
9. `TI-DOM-008` como autoridad de problema, causa raíz, error conocido, workaround y candidato de conocimiento;
10. `TI-DOM-009` como autoridad exclusiva de cambio tecnológico, aprobación, ventana, prueba, despliegue, rollback y revisión posterior;
11. `TI-DOM-010` como autoridad de observabilidad y señales técnicas;
12. `TI-DOM-011` como autoridad de respaldo, recuperación y runbooks técnicos relacionados;
13. `TI-DOM-012` como autoridad tecnológica de licencias, proveedores, garantías, contratos, renovaciones, uso y costos;
14. ANIMA como superficie posible de presentación y seguimiento personal, sin convertirla en autoridad del contenido técnico;
15. VISO como autoridad de mesa de servicio y expediente administrativo;
16. SHELL como autoridad de identidad, aplicaciones y acceso;
17. propietarios funcionales como autoridad del procedimiento y competencia empresarial que les corresponda;
18. `TI-UX-006` como tarea posterior de experiencia para diagnóstico guiado, base de conocimiento y capacitación contextual;
19. `TI-AUTH-001` a `TI-AUTH-004` como autoridad posterior de segregación, administración, publicación y acceso sensible;
20. la cobertura de prueba ya vigente para correlación, conocimiento, soporte, cambios, aplicaciones y operación tecnológica.

Esta tarea no crea un proceso empresarial nuevo ni cambia identidades `VPROC-*`.

---

#### 3. Regla raíz de separación

Se fija:

```text
KNOWLEDGE_ITEM
≠ SOURCE_EVIDENCE
≠ QUICK_GUIDE
≠ RUNBOOK
≠ KNOWN_ERROR
≠ WORKAROUND
≠ CHANGE
≠ CHANGE_COMMUNICATION
≠ ANNOUNCEMENT
≠ TRAINING_MODULE
≠ TRAINING_ASSIGNMENT
≠ COMPLETION
≠ COMPETENCE_EVIDENCE
≠ ADOPTION_SIGNAL
≠ SUPPORT_CASE
```

Y:

```text
PUBLISHED
≠ DELIVERED
≠ VIEWED
≠ ACKNOWLEDGED
≠ COMPLETED
≠ PASSED_CHECK
≠ COMPETENT
≠ ADOPTED
```

Consecuencias:

1. cerrar un ticket no publica conocimiento;
2. publicar una guía no demuestra que alguien la haya recibido;
3. leer una guía no demuestra comprensión;
4. completar una capacitación no demuestra competencia cuando exista un criterio adicional;
5. competencia no demuestra adopción sostenida;
6. comunicación enviada no demuestra que el cambio haya sido implementado;
7. un workaround vigente no se convierte automáticamente en procedimiento permanente;
8. un artículo del proveedor no se convierte automáticamente en conocimiento canónico de VENTO;
9. una instrucción técnica no puede ampliar permisos;
10. la base de conocimiento nunca sustituye una configuración o fuente técnica propietaria.

---

#### 4. Autoridades

| Autoridad                      | Responsabilidad                                                                                       | No asume                                                                              |
| ------------------------------ | ----------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| TI / `RESPONSABLE_TECNOLOGICO` | curación técnica, versión, vigencia, revisión, soporte guiado y señales de adopción tecnológica       | propiedad del procedimiento empresarial, aprobación de acceso o aprobación del cambio |
| Propietario funcional          | exactitud del procedimiento empresarial, audiencia y criterio de competencia cuando aplique           | privilegio técnico o administración de infraestructura                                |
| ANIMA                          | presentación al trabajador, contexto y seguimiento personal cuando el diseño posterior lo materialice | autoridad sobre verdad técnica, cambio o permisos                                     |
| VISO                           | expediente de soporte, incidente, problema, cambio y referencias de conocimiento                      | publicación automática de conocimiento a partir de mensajes                           |
| SHELL                          | identidad, aplicación, contexto y política de acceso                                                  | verdad de aprendizaje, competencia o adopción                                         |
| `TI-DOM-008`                   | known error, workaround, causa y candidato de conocimiento                                            | publicación y ciclo de vida del conocimiento                                          |
| `TI-DOM-009`                   | cambio aprobado, impacto, ventana, despliegue, rollback y resultado                                   | conocimiento permanente o evidencia de adopción                                       |
| `TI-DOM-010`                   | telemetría y señales observables                                                                      | interpretación automática de una señal como aprendizaje                               |
| `TI-DOM-011`                   | recuperación técnica y runbooks de recuperación                                                       | gobierno general de publicación de conocimiento                                       |
| `TI-AUTH-*`                    | segregación y autorización de capacidades sensibles                                                   | contenido funcional o criterio pedagógico                                             |
| `TI-UX-006`                    | experiencia de diagnóstico guiado y capacitación contextual                                           | redefinición del contrato de conocimiento                                             |

---

#### 5. Contrato `TI-KNOWLEDGE-GOVERNANCE-CONTRACT-001`

Cada unidad canónica de conocimiento tecnológico deberá poder declarar:

```text
knowledge_id
title
knowledge_kind
service_refs[]
application_refs[]
capability_refs[]
source_refs[]
known_error_refs[]
change_refs[]
runbook_refs[]
audience_refs[]
functional_owner_ref
technical_owner_ref
reviewer_ref
version
state
valid_from
review_due_or_expiry_condition
sensitivity_ref
safe_fallback_ref
feedback_refs[]
evidence_refs[]
```

Reglas:

1. `knowledge_id` es estable y no cambia al publicar una revisión;
2. `version` identifica la revisión consumible;
3. el contenido actual se resuelve por estado y vigencia, no por sobrescritura histórica;
4. todo contenido tiene propietario técnico;
5. cuando contiene procedimiento empresarial, conserva propietario funcional;
6. no se guardan secretos, tokens, credenciales, dumps sensibles ni datos personales innecesarios;
7. una instrucción con impacto privilegiado referencia la autoridad que permite ejecutarla;
8. `source_refs[]` preserva el origen y permite revalidación;
9. una referencia de proveedor conserva proveedor, producto y versión cuando exista evidencia;
10. el conocimiento puede referenciar una aplicación o servicio sin apropiarse de su configuración;
11. el contenido debe poder declarar idioma o variante si la implementación lo requiere, sin duplicar identidad conceptual por traducción;
12. el conocimiento retirado conserva historia y referencias de casos o cambios pasados.

---

#### 6. Clases de conocimiento

Clases iniciales:

| Clase                        | Uso                                                                                |
| ---------------------------- | ---------------------------------------------------------------------------------- |
| `QUICK_GUIDE`                | instrucción corta y contextual para una acción segura y repetible                  |
| `DIAGNOSTIC_GUIDE`           | diagnóstico guiado sin autoridad implícita para ejecutar cambios                   |
| `RUNBOOK`                    | procedimiento técnico controlado para operación, recuperación o respuesta          |
| `KNOWN_ERROR_ARTICLE`        | explicación publicable de error conocido y workaround vigente                      |
| `APPLICATION_GUIDE`          | uso o soporte de una aplicación y versión identificables                           |
| `DEVICE_OR_PERIPHERAL_GUIDE` | uso o soporte de endpoint, impresora u otro elemento físico                        |
| `NETWORK_GUIDE`              | uso o diagnóstico de conectividad dentro del alcance permitido                     |
| `CHANGE_NOTE`                | explicación de efecto observable de un cambio aprobado                             |
| `TRAINING_REFERENCE`         | contenido base de una actividad de aprendizaje                                     |
| `PROVIDER_REFERENCE`         | referencia curada a documentación externa, sin volver al proveedor maestro interno |

Una misma pieza puede relacionarse con varias clases de contexto, pero conserva una identidad y propósito principal.

---

#### 7. Contrato `TI-KNOWLEDGE-ARTICLE-LIFECYCLE-CONTRACT-001`

Estados:

1. `DRAFT`
2. `IN_REVIEW`
3. `PUBLISHED`
4. `SUPERSEDED`
5. `EXPIRED`
6. `WITHDRAWN`

Transiciones:

```text
DRAFT
→ IN_REVIEW
→ PUBLISHED
→ SUPERSEDED | EXPIRED | WITHDRAWN
```

Reglas:

- solo `PUBLISHED` vigente se presenta como guía actual;
- `SUPERSEDED` conserva su sucesora;
- `EXPIRED` conserva la razón o condición que venció;
- `WITHDRAWN` conserva motivo de retiro;
- una revisión nueva no reescribe la versión usada por un caso histórico;
- una corrección urgente de seguridad puede retirar una versión sin esperar la revisión editorial ordinaria, bajo autoridad aplicable;
- un artículo no permanece indefinidamente vigente si su fuente exige revisión por versión, cambio, proveedor, hardware o fecha;
- el vencimiento documental no demuestra que el servicio técnico haya fallado;
- si no existe orientación segura vigente, el autoservicio queda bloqueado y se deriva a soporte.

---

#### 8. Criterio de publicabilidad de un candidato

Un candidato puede llegar a `PUBLISHED` solo cuando:

1. está generalizado para la audiencia prevista;
2. su causa o condición está suficientemente entendida para no inducir una acción falsa;
3. el workaround tiene alcance, guardas y condición de retiro;
4. no expone secretos, datos personales o diagnósticos sensibles innecesarios;
5. tiene propietario;
6. tiene fuente;
7. tiene revisión o condición de expiración;
8. identifica servicio, aplicación, versión o capacidad cuando son relevantes;
9. diferencia observación, hipótesis y procedimiento confirmado;
10. no instruye a saltarse autorización, seguridad o cambio;
11. puede declarar un fallback seguro cuando el procedimiento principal no sea aplicable;
12. conserva evidencia de revisión.

Un mensaje útil de un caso de soporte sigue siendo `SOURCE_EVIDENCE` hasta pasar esta puerta.

---

#### 9. Matriz `TI-KNOWLEDGE-SOURCE-INTAKE-MATRIX-001`

|    # | Clase de fuente                         | ¿Puede originar candidato? | Propietario de origen                   | Puerta de publicación                                                  | Condición de revisión o retiro                               |
| ---: | --------------------------------------- | -------------------------- | --------------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------ |
|    1 | patrón repetido de soporte              | sí                         | VISO / TI                               | repetición demostrable, generalización y procedimiento seguro          | cambio de causa, producto, versión o evidencia               |
|    2 | incidente                               | sí                         | `TI-DOM-007`                            | servicio restaurado, contexto delimitado y aprendizaje útil            | nuevo incidente contradice el contenido o cambia el servicio |
|    3 | problema / causa raíz                   | sí                         | `TI-DOM-008`                            | causa confirmada o alcance de incertidumbre expresamente delimitado    | nueva evidencia invalida causa o prevención                  |
|    4 | error conocido                          | sí                         | `TI-DOM-008`                            | error y población afectada identificados                               | error corregido, retirado o cambiado                         |
|    5 | workaround                              | sí                         | `TI-DOM-008`                            | guardas, riesgo, alcance y condición de retiro documentados            | corrección definitiva, riesgo nuevo o expiración             |
|    6 | cambio tecnológico aprobado             | sí                         | `TI-DOM-009`                            | resultado del cambio y efecto al usuario confirmados                   | nueva versión, rollback o cambio sucesor                     |
|    7 | documentación de proveedor o fabricante | sí, como referencia curada | proveedor + propietario técnico         | producto/versión aplicable y validación interna suficiente             | cambio del proveedor, versión, plan o producto               |
|    8 | procedimiento de aplicación o servicio  | sí                         | propietario de aplicación/servicio + TI | fuente propietaria y versión identificadas                             | cambio de proceso, servicio o aplicación                     |
|    9 | endpoint, red, impresora o periférico   | sí                         | dominio técnico propietario             | dispositivo/configuración y límites identificados                      | cambio físico, firmware, red, driver o configuración         |
|   10 | respaldo o recuperación                 | sí                         | `TI-DOM-011`                            | runbook y condiciones de restauración aprobados                        | cambio de estrategia, plataforma o ejercicio                 |
|   11 | seguridad o autorización                | sí, con acceso controlado  | `TI-AUTH-*` / autoridad de seguridad    | mínimo contenido operativo y autorización separada                     | cambio de política, secreto, privilegio o amenaza            |
|   12 | feedback, duda o confusión de usuario   | sí, como señal             | TI + propietario funcional              | patrón validado; no publicar una interpretación individual como verdad | evidencia posterior, cambio de interfaz o capacitación       |

Control:

```text
12 clases esperadas
12 clases materializadas
0 omitidas
0 duplicadas
12 con puerta de publicación
12 con condición de revisión o retiro
```

---

#### 10. Soporte guiado y autoservicio

`TI-ATTN-001 — L0_AUTOSERVICIO_GUIADO` consume únicamente contenido:

- `PUBLISHED`;
- vigente;
- apropiado para la audiencia;
- asociado al contexto correcto;
- sin privilegios implícitos.

`TI-ATTN-002 — L1_MESA_DE_SERVICIO` puede usar guías diagnósticas y artículos internos según autorización.

Reglas:

1. la guía no ejecuta una mutación por sí sola;
2. una comprobación fallida conserva contexto al escalar;
3. el usuario no debe repetir información ya capturada por el caso;
4. una guía que no aplica permite continuar con soporte;
5. no se presentan pasos privilegiados a una audiencia no autorizada;
6. si el contenido vigente desaparece o expira, el sistema no usa una copia obsoleta como fallback silencioso;
7. los resultados del soporte alimentan feedback del artículo sin reescribirlo automáticamente.

---

#### 11. Contrato `TI-TRAINING-AND-COMPETENCE-CONTRACT-001`

Se fija:

```text
TRAINING_MODULE
≠ TRAINING_ASSIGNMENT
≠ CONTENT_VERSION
≠ COMPLETION
≠ KNOWLEDGE_CHECK
≠ COMPETENCE_EVIDENCE
≠ AUTHORIZATION
```

Cada módulo deberá poder referenciar:

```text
training_module_id
title
capability_ref
service_refs[]
application_refs[]
knowledge_version_refs[]
audience_refs[]
functional_owner_ref
technical_owner_ref
required_or_optional
assignment_reason
version
effective_from
review_condition
evidence_refs[]
```

Cada asignación deberá poder referenciar:

```text
training_assignment_id
training_module_id
module_version
target_identity_or_context_ref
assigned_at
availability_state
started_at
completed_at
knowledge_check_ref
competence_evidence_ref
superseded_by_ref
evidence_state
```

No se inventan duración, nota mínima, periodicidad ni vigencia temporal. Esos parámetros aparecen únicamente cuando una autoridad funcional, normativa o técnica aplicable los exige.

---

#### 12. Estados de aprendizaje y competencia

La asignación de aprendizaje puede conservar:

- `ASSIGNED`;
- `AVAILABLE`;
- `STARTED`;
- `COMPLETED`;
- `CANCELLED`;
- `SUPERSEDED`.

La comprobación o competencia se conserva en dimensión separada:

- `NOT_REQUIRED`;
- `PENDIENTE_DE_EVIDENCIA`;
- `PASSED`;
- `FAILED`;
- `EXPIRED`.

Reglas:

1. `COMPLETED` no equivale a `PASSED`;
2. `PASSED` no equivale a privilegio;
3. `NOT_REQUIRED` debe provenir de la regla del módulo, no de ausencia de dato;
4. una versión nueva puede exigir reasignación sin borrar la anterior;
5. una capacitación retirada no borra la evidencia histórica;
6. una persona que cambia de función puede requerir otra asignación por contexto, sin que TI invente la política laboral;
7. la competencia regulatoria o profesional permanece bajo su dominio propietario.

---

#### 13. Matriz `TI-TECHNOLOGY-LEARNING-AUDIENCE-MATRIX-001`

Estas son **audiencias de aprendizaje**, no roles de autorización.

|    # | Audiencia                      | Necesidad principal                                                         | Contenido permitido                                                        | Límite                                                 |
| ---: | ------------------------------ | --------------------------------------------------------------------------- | -------------------------------------------------------------------------- | ------------------------------------------------------ |
|    1 | `END_USER`                     | usar herramientas autorizadas y resolver necesidades simples                | guías cortas, novedades, autoservicio seguro                               | no recibe instrucciones privilegiadas                  |
|    2 | `SHARED_STATION_OPERATOR`      | operar una estación o dispositivo compartido dentro de capacidad habilitada | operación, fallback autorizado, periféricos y recuperación no privilegiada | la estación no presta permisos administrativos         |
|    3 | `SERVICE_DESK_L1`              | clasificar, diagnosticar y resolver patrones estándar                       | diagnóstico guiado, known errors y procedimientos preautorizados           | no adquiere permisos por pertenecer a la audiencia     |
|    4 | `TECHNICAL_SUPPORT_L2`         | diagnóstico y recuperación especializada                                    | runbooks, dependencias, configuración y troubleshooting según autorización | conocimiento no sustituye elevación o cambio formal    |
|    5 | `APPLICATION_OR_SERVICE_OWNER` | comprender operación, impacto y dependencias                                | cambios, riesgos, recuperación, soporte y adopción                         | no se vuelve administrador técnico                     |
|    6 | `CHANGE_APPROVER_OR_OWNER`     | comprender impacto y preparación del cambio                                 | readiness, comunicación, rollback, material de adopción                    | capacitación no sustituye aprobación de cambio         |
|    7 | `PRIVILEGED_TECHNICAL_ADMIN`   | administrar capacidad técnica bajo segregación                              | runbooks restringidos y procedimientos administrativos                     | privilegio real queda en `TI-AUTH-*`                   |
|    8 | `EXTERNAL_SUPPORT_PROVIDER`    | ejecutar soporte contratado dentro de alcance                               | mínimo conocimiento necesario y referencias autorizadas                    | no recibe acceso permanente ni propiedad del contenido |

Control:

```text
8 audiencias esperadas
8 audiencias materializadas
0 omitidas
0 duplicadas
0 convertidas en roles de autorización
```

---

#### 14. Capacitación contextual

La capacitación se activa por hechos, no por saturación indiscriminada.

Disparadores documentales admitidos:

- incorporación a una capacidad o herramienta;
- cambio de función o contexto;
- cambio tecnológico con efecto observable;
- introducción de una nueva aplicación, dispositivo o procedimiento;
- error recurrente que requiere prevención;
- cambio de seguridad que exige nueva práctica;
- actualización de runbook o procedimiento crítico;
- resultado de post-incident o post-change review;
- evidencia de adopción insuficiente que justifica refuerzo.

Reglas:

1. un disparador no asigna automáticamente a todas las personas;
2. la audiencia se resuelve contra contexto e identidad autorizados;
3. un cambio sin efecto al usuario puede quedar `NO_APLICA` para capacitación, con decisión del propietario;
4. material de formación apunta a versiones exactas de conocimiento;
5. la ayuda contextual prioriza la acción actual y reserva detalle técnico bajo demanda;
6. la formación de TI no absorbe desarrollo profesional o gestión de talento.

---

#### 15. Contrato `TI-CHANGE-COMMUNICATION-CONTRACT-001`

La comunicación consume un cambio gobernado por `TI-DOM-009`.

Se fija:

```text
CHANGE
≠ CHANGE_APPROVAL
≠ RELEASE
≠ DEPLOYMENT
≠ COMMUNICATION
≠ KNOWLEDGE_UPDATE
≠ TRAINING_ASSIGNMENT
```

Cada comunicación tecnológica deberá poder declarar:

```text
communication_id
change_ref
communication_kind
affected_service_refs[]
affected_application_refs[]
audience_refs[]
content_version_ref
knowledge_refs[]
planned_at
published_at
delivery_channel_ref
owner_ref
status
rollback_or_degraded_ref
evidence_refs[]
```

Clases mínimas:

- `PRE_CHANGE_NOTICE`;
- `IN_WINDOW_STATUS`;
- `CHANGE_AVAILABLE`;
- `DEGRADED_OR_PARTIAL`;
- `ROLLBACK_NOTICE`;
- `KNOWN_ISSUE_NOTICE`;
- `POST_CHANGE_LEARNING`.

---

#### 16. Reglas de comunicación de cambio

1. una comunicación no aprueba un cambio;
2. una comunicación no demuestra despliegue;
3. `CHANGE_AVAILABLE` exige evidencia del resultado aplicable, no solo intención;
4. si ocurre rollback, la comunicación posterior no mantiene un mensaje de éxito como estado actual;
5. instrucciones extensas referencian conocimiento versionado en lugar de duplicarlo;
6. la audiencia se deriva del impacto del cambio, no de una lista inventada;
7. la comunicación distingue indisponibilidad, degradación, cambio disponible y problema conocido;
8. mensajes antiguos pueden permanecer como historia, pero no como estado operativo vigente;
9. un cambio sin impacto visible puede tener comunicación `NO_APLICA` cuando la autoridad de cambio lo justifique;
10. comunicación de emergencia no elimina el registro, la revisión ni el aprendizaje posterior;
11. el canal utilizado no se convierte en fuente de verdad del cambio;
12. la expiración o retiro del mensaje no elimina el conocimiento asociado.

---

#### 17. Relación con anuncios

`public.announcements` se reconoce únicamente como una **superficie AS-IS potencial de publicación general**.

El contrato objetivo exige distinguir:

```text
ANNOUNCEMENT
≠ CHANGE_COMMUNICATION
≠ KNOWLEDGE_ITEM
≠ TRAINING_ASSIGNMENT
```

Un anuncio puede presentar una comunicación o enlazar conocimiento, pero no se vuelve su identidad canónica.

Para una futura reutilización deberá poder conservar, directamente o por relación:

- cambio o hecho que lo origina;
- audiencia;
- aplicación o servicio afectados;
- versión del contenido;
- vigencia;
- enlace a conocimiento;
- estado de entrega cuando ese canal lo permita.

La tarea actual no modifica la estructura de anuncios.

---

#### 18. Contrato `TI-ADOPTION-EVIDENCE-CONTRACT-001`

La adopción se evalúa por una capacidad y versión dentro de una población y periodo definidos.

```text
ADOPTION_OBSERVATION
=
CAPABILITY
+
VERSION
+
POPULATION_OR_CONTEXT
+
PERIOD
+
SIGNAL_SOURCE
+
DENOMINATOR
+
EVIDENCE
```

Clases de señal:

1. `DELIVERY_SIGNAL`
2. `READ_SIGNAL`
3. `LEARNING_SIGNAL`
4. `COMPETENCE_SIGNAL`
5. `USAGE_SIGNAL`
6. `SUPPORT_SIGNAL`
7. `ERROR_SIGNAL`
8. `ROLLBACK_SIGNAL`

Cada observación deberá poder declarar:

```text
adoption_observation_id
capability_ref
service_refs[]
application_refs[]
version_ref
population_or_context_ref
period_start
period_end
signal_class
signal_source_ref
numerator_or_observation
denominator_ref
interpretation_owner_ref
evidence_refs[]
evidence_state
```

---

#### 19. Reglas de adopción

1. no existe porcentaje sin denominador definido;
2. no existe tendencia sin periodo comparable;
3. una lectura no demuestra adopción;
4. una finalización no demuestra uso real;
5. bajo volumen de tickets no demuestra por sí solo adopción;
6. alto volumen de tickets puede significar cambio, mala usabilidad, mayor uso o falta de conocimiento y requiere contexto;
7. uso real puede existir sin aprendizaje formal;
8. una capacidad de contingencia puede tener poco uso y seguir siendo necesaria;
9. errores y rollback forman parte de la evidencia de adopción, no se excluyen para mejorar la métrica;
10. la señal conserva versión para evitar mezclar comportamientos antes y después de un cambio;
11. una muestra parcial no se presenta como población completa;
12. ausencia de telemetría produce `PENDIENTE_DE_EVIDENCIA`, no adopción cero.

---

#### 20. Feedback y mejora del conocimiento

Fuentes de feedback admitidas:

- resolución o reapertura de caso;
- repetición de pregunta;
- fallo de una guía;
- paso que produce escalamiento;
- comentario del usuario;
- error posterior a capacitación;
- resultado de cambio;
- resultado de ejercicio de recuperación;
- observación del propietario funcional;
- actualización de proveedor.

El feedback produce una **solicitud de revisión** o candidato.

No puede:

- editar silenciosamente contenido publicado;
- cambiar la fuente de verdad;
- reducir controles;
- incorporar secretos;
- convertir una opinión individual en procedimiento.

---

#### 21. Relación con problema, error conocido y workaround

`TI-DOM-008` entrega:

- `problem_ref`;
- causa confirmada o estado de investigación;
- known error vigente;
- workaround vigente;
- alcance;
- riesgo;
- evidencia;
- condición de retiro.

`TI-DOM-013` decide si ese insumo supera la puerta de publicación.

Se conserva:

```text
KNOWN_ERROR
≠ KNOWLEDGE_ITEM

WORKAROUND
≠ PERMANENT_PROCEDURE
```

Cuando una corrección elimina el error:

- el known error cambia bajo `TI-DOM-008`;
- el artículo relacionado se revisa;
- el workaround se retira o sustituye;
- los casos históricos conservan la versión utilizada.

---

#### 22. Relación con observabilidad

`TI-DOM-010` puede producir señales para:

- artículo sin uso detectable cuando exista telemetría;
- guía que termina frecuentemente en escalamiento;
- recurrencia posterior a capacitación;
- cambio que incrementa errores;
- material asociado a versión obsoleta;
- capacidad sin señal de adopción disponible.

La telemetría no:

- reescribe conocimiento;
- califica competencia automáticamente;
- suspende acceso;
- asigna capacitación por sí sola;
- crea causa raíz.

---

#### 23. Relación con recuperación y continuidad

Runbooks de recuperación:

- conservan autoridad técnica en `TI-DOM-011` o continuidad cuando corresponda;
- se publican y versionan mediante el contrato de conocimiento;
- pueden tener audiencia restringida;
- deben sobrevivir a la indisponibilidad del mismo sistema cuando la estrategia de recuperación lo exija;
- no contienen secretos como mecanismo de contingencia;
- una copia disponible no demuestra que el procedimiento funcione;
- un ejercicio puede producir revisión de conocimiento y capacitación.

El aprendizaje posterior de continuidad se entrega a este dominio como entrada sin transferir la autoridad de continuidad.

---

#### 24. Matriz `TI-TECHNOLOGY-LEARNING-SERVICE-MATRIX-001`

Se preservan exactamente los once servicios tecnológicos aprobados.

| `TI-SERVICE-*`   | Servicio                                                                | Conocimiento mínimo gobernado                                                    | Capacitación / adopción                                                                      | Decisión       |
| ---------------- | ----------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- | -------------- |
| `TI-SERVICE-001` | Cuentas, identidad y acceso tecnológico                                 | acceso, recuperación, MFA, alta/baja y errores comunes sin secretos              | formación por contexto y cambios de acceso; competencia solo si autoridad aplicable la exige | `ESPECIFICADO` |
| `TI-SERVICE-002` | Endpoints, computadores, celulares, tabletas y dispositivos compartidos | uso seguro, baseline visible, recuperación y operación de dispositivo compartido | capacitación por dispositivo/capacidad; adopción separada de inventario físico               | `ESPECIFICADO` |
| `TI-SERVICE-003` | Redes y conectividad                                                    | diagnóstico permitido, conectividad esperada, contingencia y escalamiento        | guía por sede/contexto sin exponer configuración privilegiada                                | `ESPECIFICADO` |
| `TI-SERVICE-004` | Impresoras y periféricos                                                | selección/routing visible, fallas, consumibles, fallback y diagnóstico permitido | capacitación por tarea física y medio; no sustituye PRINT-ARC                                | `ESPECIFICADO` |
| `TI-SERVICE-005` | Aplicaciones, ambientes y proveedores tecnológicos                      | uso, ambiente, dependencia, soporte y salida aplicables                          | capacitación por aplicación/versión; adopción correlacionada con capacidad                   | `ESPECIFICADO` |
| `TI-SERVICE-006` | Solicitudes de soporte tecnológico                                      | autoservicio, clasificación comprensible, seguimiento y reapertura               | uso del portal y autoservicio; señal de soporte no equivale a adopción                       | `ESPECIFICADO` |
| `TI-SERVICE-007` | Incidentes y restauración tecnológica                                   | síntomas, comunicación, workaround autorizado y validación                       | aprendizaje posterior al incidente cuando sea generalizable                                  | `ESPECIFICADO` |
| `TI-SERVICE-008` | Cambios, configuración y versiones tecnológicas                         | notas de cambio, impacto, rollback visible y nueva forma de uso                  | comunicación y capacitación derivadas del cambio aprobado                                    | `ESPECIFICADO` |
| `TI-SERVICE-009` | Pruebas y aceptación técnica de soluciones                              | preparación, criterios, limitaciones y evidencia de prueba                       | capacitación de participantes cuando el piloto o prueba lo exija                             | `ESPECIFICADO` |
| `TI-SERVICE-010` | Licencias, garantías, contratos y costos tecnológicos                   | uso permitido, soporte, renovación y restricciones operativas                    | capacitación de administradores/usuarios según entitlement, sin sustituir contrato           | `ESPECIFICADO` |
| `TI-SERVICE-011` | Conocimiento, capacitación y adopción tecnológica                       | gobierno de artículos, módulos, audiencias, comunicación y evidencia             | servicio propietario de este contrato                                                        | `ESPECIFICADO` |

Control:

```text
11 servicios esperados
11 servicios materializados
0 omitidos
0 duplicados
11 con decisión explícita
```

---

#### 25. Reconciliación AS-IS `TI-KNOWLEDGE-ASIS-RECONCILIATION-001`

La inspección de solo lectura disponible permite declarar:

| Superficie                                          | Estado                                                  | Evidencia o límite                                                                                                                                                                                           |
| --------------------------------------------------- | ------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| contrato canónico de conocimiento y capacitación    | `ESPECIFICADO`                                          | esta tarea materializa el contrato documental                                                                                                                                                                |
| `public.announcements`                              | `IMPLEMENTADO` parcialmente como superficie genérica    | existen columnas `id`, `title`, `body`, `tag`, `published_at`, `is_active`, `display_order`, `created_by`, `created_at`, `updated_at`; no demuestra versionado de conocimiento ni relación tipada con cambio |
| filas actuales de `public.announcements`            | `IMPLEMENTADO` como estructura; contenido actual vacío  | 0 filas observadas en la consulta actual                                                                                                                                                                     |
| `public.support_tickets`                            | `IMPLEMENTADO` parcialmente como fuente de casos        | 2 filas observadas; no constituyen conocimiento publicado                                                                                                                                                    |
| `public.support_messages`                           | `IMPLEMENTADO` parcialmente como fuente de conversación | 4 filas observadas; un mensaje no supera por sí mismo la puerta de publicación                                                                                                                               |
| `public.support_ticket_reads`                       | `IMPLEMENTADO` como lectura del caso                    | 4 filas observadas; lectura de ticket no es lectura de conocimiento ni adopción                                                                                                                              |
| modelo dedicado de artículo versionado              | `PENDIENTE_DE_EVIDENCIA`                                | búsqueda por nombres de tabla no evidenció una superficie pública dedicada a knowledge/article/guide equivalente                                                                                             |
| modelo dedicado de módulo de capacitación           | `PENDIENTE_DE_EVIDENCIA`                                | búsqueda por nombres no evidenció módulo, curso o training tecnológico dedicado                                                                                                                              |
| asignación/finalización de capacitación tecnológica | `PENDIENTE_DE_EVIDENCIA`                                | no se evidenció estructura dedicada por nombre en las superficies consultadas                                                                                                                                |
| evidencia de competencia tecnológica                | `PENDIENTE_DE_EVIDENCIA`                                | no se evidenció contrato persistido específico de esta capacidad                                                                                                                                             |
| observación de adopción por capacidad/versión       | `PENDIENTE_DE_EVIDENCIA`                                | no se evidenció estructura dedicada ni métricas verificables                                                                                                                                                 |
| vínculo tipado anuncio ↔ cambio ↔ conocimiento      | `PENDIENTE_DE_EVIDENCIA`                                | la estructura actual de anuncios no expone esos campos                                                                                                                                                       |
| experiencia contextual de ANIMA / VISO              | `FUERA_DE_ALCANCE` de esta tarea                        | `TI-UX-006`, `TI-UX-001` y `TI-UX-002` gobiernan experiencia futura                                                                                                                                          |
| implementación física de nuevas estructuras         | `NO_APLICA`                                             | fase exclusivamente documental                                                                                                                                                                               |

La ausencia de una tabla dedicada por nombre no prueba ausencia absoluta de información equivalente en cualquier otra superficie; solo impide declarar una implementación canónica de este contrato sin evidencia adicional.

---

#### 26. Estado AS-IS de anuncios

La estructura actual permite:

- título;
- cuerpo;
- etiqueta;
- fecha de publicación;
- activación;
- orden de presentación;
- autor de creación;
- timestamps.

No se evidenciaron en esa tabla, en la inspección actual:

- `knowledge_id`;
- versión de conocimiento;
- `change_ref`;
- aplicación o servicio afectado;
- audiencia tipada;
- estado de entrega;
- reconocimiento;
- finalización de aprendizaje;
- competencia;
- adopción.

Por ello:

```text
ANNOUNCEMENTS_EXIST
≠ KNOWLEDGE_BASE_IMPLEMENTED
≠ TRAINING_IMPLEMENTED
≠ ADOPTION_MEASURED
```

---

#### 27. Cierre del mini-bloque `TI-DOM-*`

`TI-DOM-013` completa documentalmente la cobertura `TI-DOM-001` a `TI-DOM-013`.

El cierre significa:

- modelo operativo definido;
- configuración y relaciones definidas;
- endpoints definidos;
- redes definidas;
- impresoras/periféricos definidos;
- aplicaciones/proveedores definidos;
- solicitudes/incidentes definidos;
- problemas/known errors definidos;
- cambios definidos;
- observabilidad definida;
- recuperación definida;
- licencias/contratos/costos definidos;
- conocimiento/capacitación/adopción definidos.

No significa implementación física del bloque.

La continuidad pasa a autorización tecnológica únicamente después de aprobación explícita de esta tarea.

---

#### 28. Hallazgos y condiciones de salida

| ID                 | Hallazgo                                                                                                                | Estado                  | Propietario                                | Condición de salida                                                              |
| ------------------ | ----------------------------------------------------------------------------------------------------------------------- | ----------------------- | ------------------------------------------ | -------------------------------------------------------------------------------- |
| `H-TI-DOM-013-001` | no se evidenció una base versionada de conocimiento tecnológico implementada                                            | `ESPECIFICADO`          | paquete E5 aplicable + `TI-UX-006`         | persistencia, versión, búsqueda, publicación, revisión y retiro implementados    |
| `H-TI-DOM-013-002` | la superficie `announcements` no materializa identidad de conocimiento ni relación tipada con cambio                    | `ESPECIFICADO`          | `TI-UX-006`; `TI-INT-002`; paquete E5      | anuncio referencia cambio/conocimiento/servicio/audiencia bajo contrato aprobado |
| `H-TI-DOM-013-003` | no se evidenció módulo tecnológico de capacitación persistido                                                           | `ESPECIFICADO`          | `TI-UX-006`; ANIMA; paquete E5             | módulos versionados y consumibles implementados                                  |
| `H-TI-DOM-013-004` | no se evidenció asignación y finalización de capacitación tecnológica separadas                                         | `ESPECIFICADO`          | ANIMA; `TI-UX-006`; paquete E5             | asignación y finalización persistidas con identidad y versión                    |
| `H-TI-DOM-013-005` | no se evidenció competencia tecnológica separada de finalización                                                        | `ESPECIFICADO`          | propietario funcional + ANIMA + paquete E5 | criterio aplicable y evidencia de competencia diferenciados                      |
| `H-TI-DOM-013-006` | mensajes y resoluciones de soporte pueden contener conocimiento no curado                                               | `ESPECIFICADO`          | `TI-DOM-008`; `TI-DOM-013`; VISO           | intake de candidato, revisión, publicación y feedback implementados              |
| `H-TI-DOM-013-007` | no se evidenció medición de adopción por capacidad, versión, población y periodo                                        | `ESPECIFICADO`          | `TI-DOM-010`; `TI-INT-001`; `TI-UX-006`    | señales instrumentadas y observaciones reconciliables disponibles                |
| `H-TI-DOM-013-008` | documentación externa puede quedar obsoleta respecto de producto o versión                                              | `RESUELTO_POR_CONTRATO` | propietario técnico + `TI-INT-003`         | referencia externa curada conserva producto/versión y revisión                   |
| `H-TI-DOM-013-009` | permisos de publicar, administrar, revisar o consumir contenido sensible aún no están materializados para este contrato | `FUERA_DE_ALCANCE`      | `TI-AUTH-001` a `TI-AUTH-004`              | segregación y capacidades autorizadas antes de operación real                    |
| `H-TI-DOM-013-010` | experiencia contextual de búsqueda, diagnóstico y capacitación todavía no está diseñada bajo este contrato              | `FUERA_DE_ALCANCE`      | `TI-UX-006`                                | experiencia aprobada sin saturación técnica y con estados verificables           |

No queda un hallazgo narrativo sin propietario ni condición de salida.

---

#### 29. Estado de los artefactos

| Artefacto                                       | Estado                   |
| ----------------------------------------------- | ------------------------ |
| `TI-KNOWLEDGE-GOVERNANCE-CONTRACT-001`          | `ESPECIFICADO`           |
| `TI-KNOWLEDGE-ARTICLE-LIFECYCLE-CONTRACT-001`   | `ESPECIFICADO`           |
| `TI-KNOWLEDGE-SOURCE-INTAKE-MATRIX-001`         | `ESPECIFICADO`           |
| `TI-TRAINING-AND-COMPETENCE-CONTRACT-001`       | `ESPECIFICADO`           |
| `TI-CHANGE-COMMUNICATION-CONTRACT-001`          | `ESPECIFICADO`           |
| `TI-ADOPTION-EVIDENCE-CONTRACT-001`             | `ESPECIFICADO`           |
| `TI-TECHNOLOGY-LEARNING-AUDIENCE-MATRIX-001`    | `ESPECIFICADO`           |
| `TI-TECHNOLOGY-LEARNING-SERVICE-MATRIX-001`     | `ESPECIFICADO`           |
| `TI-KNOWLEDGE-ASIS-RECONCILIATION-001`          | `ESPECIFICADO`           |
| base de conocimiento runtime bajo este contrato | `PENDIENTE_DE_EVIDENCIA` |
| capacitación runtime bajo este contrato         | `PENDIENTE_DE_EVIDENCIA` |
| competencia runtime bajo este contrato          | `PENDIENTE_DE_EVIDENCIA` |
| adopción runtime bajo este contrato             | `PENDIENTE_DE_EVIDENCIA` |
| implementación física                           | `NO_APLICA`              |

---

#### 30. Cobertura de prueba consumida

La cobertura canónica vigente ya protege:

- correlación versionada entre servicios, aplicaciones, tickets, incidentes, problemas, cambios, proveedores, monitoreo, respaldos y conocimiento;
- autenticación mínima, reconciliación y trazabilidad de integraciones tecnológicas;
- mesa de servicio, diagnóstico guiado, comunicación, validación y evidencia;
- identidad y contexto de aplicaciones y acceso;
- relaciones de activos, endpoints, red, impresoras y configuración;
- cambio con prueba, rollback y resultado;
- comunicación verdadera frente al estado técnico;
- protección de información sensible y prevención de fuentes paralelas.

Esta tarea materializa el gobierno documental de conocimiento, capacitación, comunicación y adopción sobre esa cobertura existente.

---

#### 31. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** las condiciones verificables de correlación, versionado, soporte, comunicación, cambio, autorización, reconciliación y conocimiento tecnológico ya están protegidas por la cobertura canónica vigente originada en la evaluación de tecnología. Esta tarea especializa esas obligaciones mediante identidades, estados, matrices, audiencias y handoffs documentales, sin introducir un efecto empresarial, permiso, algoritmo de aprobación, métrica ejecutable o comportamiento físico adicional.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 32. Criterios de aceptación

`TI-DOM-013` queda documentalmente completa cuando:

1. conocimiento, evidencia fuente, guía, runbook, error conocido, workaround, cambio, comunicación, anuncio, capacitación, finalización, competencia, adopción y ticket permanecen separados;
2. publicación, entrega, lectura, reconocimiento, finalización, comprobación, competencia y adopción permanecen separados;
3. existe identidad estable y versión para conocimiento;
4. existen seis estados de ciclo de vida de conocimiento con historia preservada;
5. existe una puerta explícita de publicabilidad;
6. las doce clases de fuente tienen decisión de entrada, publicación y revisión;
7. se materializan 12/12 clases, con 0 omisiones y 0 duplicados;
8. la base de conocimiento no almacena secretos ni amplía permisos;
9. L0 utiliza únicamente conocimiento publicado, vigente y apropiado para su audiencia;
10. capacitación separa módulo, asignación, contenido, finalización, comprobación y competencia;
11. no se inventan duraciones, puntajes ni periodicidades;
12. las ocho audiencias de aprendizaje no se convierten en roles de autorización;
13. se materializan 8/8 audiencias, con 0 omisiones y 0 duplicados;
14. el cambio permanece bajo `TI-DOM-009`;
15. comunicación no equivale a aprobación ni despliegue;
16. rollback o degradación pueden invalidar un mensaje previo de éxito;
17. adopción exige capacidad, versión, población/contexto, periodo, fuente, denominador y evidencia cuando corresponda;
18. existen ocho clases de señal de adopción;
19. lectura, finalización, competencia y uso no se confunden;
20. se conservan exactamente los once servicios tecnológicos;
21. se materializan 11/11 servicios, con 0 omisiones y 0 duplicados;
22. cada servicio tiene decisión de conocimiento/capacitación/adopción;
23. `TI-DOM-008` entrega candidatos, pero esta tarea gobierna publicación;
24. `TI-DOM-010` entrega señales, pero no interpreta automáticamente aprendizaje;
25. `TI-DOM-011` conserva autoridad de recuperación;
26. ANIMA y VISO permanecen superficies consumidoras con sus autoridades;
27. el AS-IS de anuncios se registra sin presentarlo como base de conocimiento;
28. las 0 filas actuales de anuncios no se interpretan como ausencia de capacidad futura;
29. los 2 tickets, 4 mensajes y 4 registros de lectura observados no se presentan como conocimiento ni adopción;
30. toda brecha tiene propietario y condición de salida;
31. no se crea un proceso empresarial nuevo;
32. no se ejecuta cambio físico ni modificación de Supabase;
33. no se crean ni modifican requisitos de prueba;
34. `TI-AUTH-001` queda únicamente reservada.

---

#### 33. Continuidad

ÚLTIMA TAREA APROBADA
`TI-DOM-012 — Definir licencias, asientos, garantías, contratos, renovaciones, uso y costos tecnológicos`

TAREA ACTUAL APROBADA
`TI-DOM-013 — Definir base de conocimiento, capacitación, adopción y comunicación de cambios tecnológicos`

SIGUIENTE TAREA RESERVADA
`TI-AUTH-001 — Definir roles y segregación para solicitar, diagnosticar, administrar, aprobar, cambiar y cerrar servicios tecnológicos`

