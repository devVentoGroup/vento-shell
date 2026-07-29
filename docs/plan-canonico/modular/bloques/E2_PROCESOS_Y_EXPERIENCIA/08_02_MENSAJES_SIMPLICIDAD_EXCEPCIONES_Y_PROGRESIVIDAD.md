### MINI-BLOQUE — MENSAJES SIMPLICIDAD EXCEPCIONES Y PROGRESIVIDAD

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **mensajes simplicidad excepciones y progresividad** dentro de **E2 PROCESOS Y EXPERIENCIA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `UX-BASE-006` a `UX-BASE-010` — 5 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `UX-BASE-006`: Explicar bloqueos con lenguaje humano
- `UX-BASE-007`: Evitar registrar dos veces la misma información
- `UX-BASE-008`: Reducir pasos para tareas frecuentes
- `UX-BASE-009`: Mantener acciones excepcionales fuera del flujo ordinario
- `UX-BASE-010`: Aplicar divulgación progresiva a opciones avanzadas
<!-- PLAN-SECTION-META:END -->

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
