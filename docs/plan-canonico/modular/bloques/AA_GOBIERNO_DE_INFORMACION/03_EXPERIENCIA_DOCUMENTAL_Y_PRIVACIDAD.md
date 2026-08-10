### MINI-BLOQUE — EXPERIENCIA DOCUMENTAL Y PRIVACIDAD

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **experiencia documental y privacidad** dentro de **AA GOBIERNO DE INFORMACION**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `INFO-UX-001` a `INFO-UX-006` — 6 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `INFO-UX-001`: Diseñar tablero simple de gobierno, obligaciones, alertas, solicitudes y brechas
- `INFO-UX-002`: Diseñar biblioteca documental con búsqueda autorizada, expediente, versión y vigencia
- `INFO-UX-003`: Diseñar creación, revisión, aprobación, publicación y firma de documentos
- `INFO-UX-004`: Diseñar portal y caso de solicitudes de privacidad para trabajadores y clientes
- `INFO-UX-005`: Diseñar retención, legal hold, archivo y disposición controlada
- `INFO-UX-006`: Diseñar explorador de auditoría e investigación con divulgación progresiva
<!-- PLAN-SECTION-META:END -->

### ✅ INFO-UX-001 — Diseñar tablero simple de gobierno, obligaciones, alertas, solicitudes y brechas

**Estado:** APROBADA
**Tarea anterior:** `INFO-AUTH-004 — Proteger auditoría, investigaciones, accesos de emergencia, logs y evidencia preservada` — APROBADA
**Tarea siguiente:** `INFO-UX-002 — Diseñar biblioteca documental con búsqueda autorizada, expediente, versión y vigencia` — RESERVADA
**Tipo de tarea:** documental; diseño normativo y materializado de la experiencia de un tablero simple de gobierno de información en VISO que proyecta obligaciones, alertas, solicitudes y brechas desde sus fuentes canónicas sin crear una segunda verdad de negocio
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/AA_GOBIERNO_DE_INFORMACION/03_EXPERIENCIA_DOCUMENTAL_Y_PRIVACIDAD.md`
**Aplicación objetivo:** `VISO`
**Fase:** exclusivamente documental
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, rutas, pantallas implementadas, tablas, vistas, buckets, políticas, RLS, RPC, funciones, triggers, Edge Functions, migraciones, datos, permisos, grants, roles, archivos reales ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Diseñar una superficie única, simple y accionable para que una persona autorizada pueda responder, sin navegar primero por múltiples dominios, cinco preguntas operativas:

1. ¿qué elementos de gobierno de información requieren atención?;
2. ¿qué obligaciones necesitan revisión o acción?;
3. ¿qué alertas se derivan de hechos canónicos vigentes?;
4. ¿qué solicitudes requieren una actuación dentro del alcance autorizado?;
5. ¿qué brechas permanecen abiertas o sin evidencia suficiente?

El tablero no crea estados de negocio, no determina cumplimiento por sí mismo y no reemplaza los expedientes propietarios. Su función es proyectar hechos ya definidos, priorizarlos visualmente y dirigir al usuario hacia la superficie propietaria de la acción.

La experiencia queda gobernada por un principio central:

```text
TABLERO
= PROYECCIÓN AUTORIZADA + PRIORIZACIÓN VISUAL + NAVEGACIÓN A LA FUENTE
≠ REGISTRO MAESTRO
≠ MOTOR DE CUMPLIMIENTO
≠ SISTEMA DE CASOS
≠ EXPEDIENTE DE INVESTIGACIÓN
```

---

#### 2. Resultado sustantivo

La tarea materializa cuatro artefactos lógicos coordinados:

1. `INFO-GOVERNANCE-DASHBOARD-UX-CONTRACT-001`: contrato de experiencia, contenido, navegación y autorización del tablero.
2. `INFO-GOVERNANCE-ACTION-QUEUE-MATRIX-001`: reglas deterministas para construir la cola transversal de atención requerida.
3. `INFO-GOVERNANCE-DASHBOARD-STATE-PROJECTION-001`: equivalencias visuales entre estados canónicos y lenguaje comprensible para el usuario.
4. `INFO-GOVERNANCE-DASHBOARD-BOUNDARY-MATRIX-001`: límites entre este tablero y las experiencias propietarias de biblioteca, creación documental, privacidad, retención y auditoría.

Balance heredado que el diseño debe conservar:

| Control                                               | Resultado |
| ----------------------------------------------------- | --------: |
| Procesos `VPROC-*` cubiertos por el gobierno heredado |    **69** |
| Identidades documentales `DOCCTX-*` cubiertas         |   **332** |
| Aplicaciones propietarias representadas               |     **9** |
| Identidades omitidas por el diseño                    |     **0** |
| Nuevos registros maestros creados                     |     **0** |
| Nuevos estados de negocio creados                     |     **0** |
| Nuevas rutas físicas definidas                        |     **0** |
| Cambios físicos                                       |     **0** |

---

#### 3. Entradas canónicas consumidas

El tablero consume sin redefinir:

- `INFO-DOM-001` para universo de gobierno, identidad documental, aplicación propietaria, propósito, territorio, custodia y estados pendientes de evidencia;
- `INFO-DOM-009` para solicitudes de titulares y sus casos, decisiones, bloqueos y referencias de plazo cuando estén resueltos;
- `INFO-DOM-012` para obligaciones, aplicabilidad, controles, evidencia, frecuencia, vencimientos, excepciones, brechas y acciones correctivas;
- `INFO-DOM-013` para referencias de auditoría e investigación cuando una condición deba escalarse, sin convertir el tablero en explorador investigativo;
- `INFO-AUTH-001` para decisión transversal de autorización por identidad, clasificación, finalidad, relación, recurso, territorio y estado;
- `INFO-AUTH-002` para minimización y protección reforzada de datos sensibles, copias, impresiones, exportaciones, compartición y accesos temporales;
- `INFO-AUTH-003` para segregación de acciones del ciclo de vida documental;
- `INFO-AUTH-004` para independencia, auditoría, investigación, accesos de emergencia, logs y evidencia preservada;
- la propiedad funcional aprobada del bloque AA, según la cual VISO administra cumplimiento, solicitudes, investigaciones y supervisión.

No se crea un modelo de autorización local del tablero. Toda visibilidad, conteo, detalle y acción se subordina a la decisión canónica de autorización.

---

#### 4. Universo de gobierno visible

El diseño debe poder proyectar el universo heredado completo sin duplicarlo. La aplicación propietaria es un filtro y una dimensión de agrupación, no una fuente nueva de propiedad.

| Aplicación propietaria | Identidades `DOCCTX-*` heredadas |
| ---------------------- | -------------------------------: |
| `ANIMA`                |                            **1** |
| `VISO`                 |                           **20** |
| `NEXO`                 |                           **16** |
| `FOGO`                 |                            **6** |
| `ORIGO`                |                            **4** |
| `PULSO`                |                           **12** |
| `NUMERA`               |                            **7** |
| `AURA`                 |                            **2** |
| `PASS`                 |                            **1** |

Estas cantidades representan aplicaciones propietarias dentro del universo documental heredado y no sustituyen las 332 identidades contextuales ni sus relaciones canónicas.

Reglas:

1. una identidad solo aparece cuando el actor puede conocer su existencia;
2. un conteo agregado se calcula después de aplicar autorización, nunca antes;
3. un estado `PENDIENTE_DE_EVIDENCIA` se presenta como pendiente y no se completa por inferencia;
4. la ausencia de un valor no se representa como “no aplica” salvo que la fuente canónica lo determine;
5. propietario de aplicación, custodio, responsable, encargado, finalidad y territorio permanecen dimensiones distintas.

---

#### 5. Contrato `INFO-GOVERNANCE-DASHBOARD-UX-CONTRACT-001`

La superficie objetivo pertenece a VISO. Esta tarea no asigna una URL ni una ruta física.

El tablero se compone de siete zonas visuales:

1. encabezado de alcance;
2. resumen ejecutivo de cinco indicadores;
3. filtros;
4. cola de atención requerida;
5. bloque de gobierno;
6. bloques de obligaciones, solicitudes y brechas;
7. bloque de alertas derivadas y acceso a la fuente propietaria.

Cada renderizado deberá poder resolver conceptualmente:

```text
actor efectivo
+ alcance autorizado
+ filtros aplicados
+ fuentes visibles
+ estados canónicos
+ condiciones derivadas de atención
+ acciones navegables autorizadas
→ proyección del tablero
```

Si cualquiera de las dimensiones de autorización necesarias no puede resolverse de manera confiable, la información afectada no se expone.

---

#### 6. Encabezado y contexto del tablero

El encabezado mostrará:

- título: **Gobierno de información**;
- alcance efectivo del usuario cuando sea representable sin revelar información no autorizada;
- filtros activos;
- fecha o instante de referencia solo cuando la fuente pueda aportarlo de forma confiable;
- acceso para limpiar filtros;
- estado parcial de disponibilidad cuando una fuente necesaria no pueda confirmarse.

No se mostrará una falsa fecha de “actualización” calculada por la interfaz si el origen no proporciona una referencia temporal confiable.

---

#### 7. Resumen ejecutivo de cinco indicadores

Los cinco indicadores corresponden exactamente a la intención de la tarea:

| Indicador                   | Qué cuenta                                                                                             | Qué no significa                                        |
| --------------------------- | ------------------------------------------------------------------------------------------------------ | ------------------------------------------------------- |
| **Gobierno por completar**  | elementos visibles cuyo gobierno conserva evidencia pendiente o una dimensión obligatoria no resoluble | no significa incumplimiento                             |
| **Obligaciones con acción** | obligaciones visibles con una condición que exige revisión o actuación según sus hechos canónicos      | no significa automáticamente no cumplimiento            |
| **Alertas activas**         | condiciones visuales derivadas y actualmente aplicables dentro del alcance visible                     | no crea un estado persistente de alerta                 |
| **Solicitudes con acción**  | casos visibles cuya fuente determina una actuación pendiente o próxima decisión                        | no sustituye el estado del caso                         |
| **Brechas abiertas**        | brechas visibles que la fuente no considera cerradas                                                   | no equivale automáticamente a incidente o investigación |

Los conteos son calculados en tiempo de consulta sobre el alcance autorizado. Ningún número queda fijado documentalmente como valor operativo.

Un indicador no se renderiza como `0` cuando la fuente correspondiente no pudo confirmarse. En ese caso muestra **No disponible**.

---

#### 8. Filtros y reducción de alcance

El tablero deberá permitir filtrar, cuando las fuentes y permisos lo soporten, por:

- proceso;
- aplicación propietaria;
- responsable o propietario;
- territorio;
- clasificación de información;
- tipo de elemento;
- estado canónico;
- rango temporal;
- vencimiento resuelto;
- presencia de bloqueo;
- presencia de acción requerida.

Reglas:

1. los filtros nunca amplían alcance;
2. una opción de filtro no debe revelar la existencia de un valor que el usuario no esté autorizado a conocer;
3. combinar filtros produce una intersección, no una unión de permisos;
4. limpiar filtros regresa al alcance autorizado inicial;
5. la URL futura, si la implementación decide reflejar filtros, no podrá transportar contenido sensible ni conceder acceso;
6. ningún filtro cambia el estado de una obligación, solicitud, brecha o elemento de gobierno.

---

#### 9. Cola transversal de atención requerida

La cola de atención requerida es el centro operativo del tablero. Reúne elementos de las cinco áreas sin mezclar sus identidades.

Cada fila deberá poder proyectar:

```text
attention_item_key
source_kind
source_ref
condition_codes[]
display_priority
display_title
display_summary_minimized
owner_ref
due_at_if_resolved
blocking_reason_if_visible
next_navigation_label
destination_owner
```

`attention_item_key` es una clave lógica de presentación para evitar duplicados visuales; no crea identidad de negocio.

Un mismo `source_ref` aparece una sola vez en la cola. Si concurren varias condiciones, se conserva la prioridad visual más alta y se muestran las razones compatibles dentro de la misma fila.

---

#### 10. Matriz `INFO-GOVERNANCE-ACTION-QUEUE-MATRIX-001`

Las prioridades son categorías de presentación, no estados de negocio.

| Prioridad visual         | Condición de entrada                                                                                                                                | Regla                                                                 | Acción de navegación              |
| ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- | --------------------------------- |
| **Atención inmediata**   | vencimiento canónico resuelto y superado; incumplimiento confirmado; o condición equivalente que la fuente declare vencida                          | se ordena primero; no se inventa vencimiento                          | abrir la fuente propietaria       |
| **Atención prioritaria** | evidencia faltante o vencida necesaria para una obligación; conflicto de evidencia; bloqueo explícito con acción responsable                        | se ordena después de lo vencido                                       | revisar la fuente y su evidencia  |
| **Próxima por fecha**    | existe `computed_due_at` o fecha límite de caso resuelta y aún no vencida                                                                           | se ordena por la fecha más próxima; no se inventa umbral de “próximo” | abrir obligación o solicitud      |
| **Revisión pendiente**   | validación pendiente, aplicabilidad pendiente de evidencia, gobierno pendiente de evidencia o acción correctiva pendiente sin vencimiento resoluble | se ordena después de fechas resolubles                                | abrir el registro propietario     |
| **Informativa**          | estado sano o sin acción requerida                                                                                                                  | no ingresa por defecto a la cola de atención                          | disponible en su bloque de origen |

Reglas de orden:

1. vencido antes que no vencido;
2. entre elementos con fecha resoluble, primero la fecha más cercana;
3. una fecha ausente nunca se fabrica para ordenar;
4. una condición sin fecha se ordena por categoría y luego por referencia estable;
5. la interfaz no puede convertir `PENDING_EVIDENCE` en “no aplica”;
6. la interfaz no puede convertir `PENDING_VALIDATION` en “cumple”;
7. una alerta no desaparece por una acción local de ocultamiento; deja de aparecer cuando la condición fuente ya no la produce.

---

#### 11. Alertas derivadas

Se establece la separación:

```text
ALERTA DE INTERFAZ
≠ ESTADO DE NEGOCIO
≠ INCUMPLIMIENTO
≠ INCIDENTE
≠ INVESTIGACIÓN
```

La alerta es una representación derivada, determinista y no autoritativa.

Códigos lógicos de presentación:

| Código de presentación        | Hecho fuente mínimo                                                     | Mensaje base               |
| ----------------------------- | ----------------------------------------------------------------------- | -------------------------- |
| `DEADLINE_EXCEEDED`           | vencimiento resuelto y superado                                         | Vencimiento superado       |
| `EVIDENCE_MISSING`            | evidencia `MISSING`                                                     | Falta evidencia            |
| `EVIDENCE_EXPIRED`            | evidencia `EXPIRED`                                                     | Evidencia vencida          |
| `EVIDENCE_CONFLICT`           | evidencia `CONFLICT`                                                    | Evidencia en conflicto     |
| `VALIDATION_PENDING`          | cumplimiento `PENDING_VALIDATION`                                       | Requiere validación        |
| `APPLICABILITY_PENDING`       | aplicabilidad `PENDING_EVIDENCE`                                        | Aplicabilidad por resolver |
| `GOVERNANCE_EVIDENCE_PENDING` | gobierno `PENDIENTE_DE_EVIDENCIA`                                       | Gobierno por completar     |
| `REQUEST_ACTION_PENDING`      | el caso fuente exige una acción visible                                 | Solicitud con acción       |
| `GAP_ACTION_PENDING`          | brecha visible con acción correctiva o cierre pendiente según la fuente | Brecha con acción          |

Estos códigos pertenecen a la capa de experiencia. No deberán persistirse como sustitutos de los estados canónicos.

---

#### 12. Proyección de estados canónicos

`INFO-GOVERNANCE-DASHBOARD-STATE-PROJECTION-001` define lenguaje legible manteniendo siempre disponible la referencia del estado fuente para trazabilidad.

##### 12.1. Aplicabilidad

| Estado canónico    | Etiqueta visible           |
| ------------------ | -------------------------- |
| `APPLIES`          | Aplica                     |
| `CONDITIONAL`      | Aplicación condicionada    |
| `NOT_APPLIES`      | No aplica                  |
| `PENDING_EVIDENCE` | Aplicabilidad por resolver |

##### 12.2. Evidencia

| Estado canónico | Etiqueta visible       |
| --------------- | ---------------------- |
| `VALID`         | Evidencia válida       |
| `MISSING`       | Falta evidencia        |
| `EXPIRED`       | Evidencia vencida      |
| `CONFLICT`      | Evidencia en conflicto |
| `PENDING`       | Evidencia por validar  |

##### 12.3. Cumplimiento

| Estado canónico       | Etiqueta visible         |
| --------------------- | ------------------------ |
| `COMPLIANT_EVIDENCED` | Cumplimiento evidenciado |
| `PARTIALLY_EVIDENCED` | Evidencia incompleta     |
| `NON_COMPLIANT`       | Brecha confirmada        |
| `PENDING_VALIDATION`  | Requiere validación      |
| `NOT_APPLICABLE`      | No aplica                |

##### 12.4. Gobierno

| Estado canónico          | Etiqueta visible       |
| ------------------------ | ---------------------- |
| `PENDIENTE_DE_EVIDENCIA` | Gobierno por completar |

La etiqueta visible nunca sustituye el código original en exportaciones autorizadas, evidencia o trazabilidad.

---

#### 13. Bloque Gobierno

El bloque **Gobierno** resume el estado del universo documental autorizado.

Cada fila o tarjeta de gobierno podrá mostrar, cuando exista y sea visible:

- referencia estable;
- proceso;
- aplicación propietaria;
- clasificación;
- finalidad;
- territorio;
- propietario o responsable;
- custodio;
- estado de evidencia;
- bloqueo;
- acción de navegación.

El bloque debe permitir distinguir:

```text
APLICACIÓN PROPIETARIA
≠ PROPIETARIO FUNCIONAL
≠ CUSTODIO
≠ RESPONSABLE
≠ ENCARGADO
≠ FINALIDAD
≠ TERRITORIO
```

Una dimensión no resuelta se muestra como pendiente de evidencia. No se completa con el valor de otra dimensión.

---

#### 14. Bloque Obligaciones

El bloque **Obligaciones** es una proyección de los contratos de cumplimiento aprobados.

Cada elemento podrá mostrar:

- referencia de obligación;
- descripción minimizada;
- fuente o tipo de fuente cuando sea visible;
- aplicabilidad;
- responsable;
- control relacionado;
- estado de evidencia;
- estado de cumplimiento;
- frecuencia cuando esté resuelta;
- vencimiento cuando esté computado por la fuente;
- excepción o bloqueo visible;
- acción de navegación.

Reglas:

1. una obligación no se marca cumplida por la mera existencia de un control;
2. un control no se marca efectivo por la mera existencia de evidencia;
3. `COMPLIANT_EVIDENCED` solo se presenta cuando la fuente ya lo determinó;
4. `NOT_APPLICABLE` solo se presenta cuando existe decisión sustentada;
5. un vencimiento vacío se muestra como **Plazo no resoluble con la evidencia actual**;
6. la interfaz no calcula días hábiles, extensiones ni calendarios por su cuenta;
7. la fecha fuente, el trigger y la regla temporal permanecen trazables desde el detalle autorizado.

---

#### 15. Bloque Solicitudes

El bloque **Solicitudes** presenta únicamente el resumen necesario para priorizar y navegar. La gestión completa del caso pertenece a `INFO-UX-004`.

Cada fila podrá mostrar:

- referencia del caso;
- tipo de solicitud;
- identidad o representación minimizada;
- responsable;
- estado fuente;
- ruta jurídica o contractual cuando esté resuelta;
- vencimiento cuando la fuente lo haya calculado;
- próximo paso fuente cuando exista;
- bloqueo;
- acción **Abrir solicitud**.

Reglas:

1. no se presenta por defecto contenido aportado por el titular;
2. no se expone información personal innecesaria para distinguir el caso;
3. una fecha legal no se infiere desde el tipo de solicitud;
4. una solicitud sin plazo resuelto no se ordena como si tuviera uno;
5. el tablero no decide rectificación, supresión, revocación ni cierre;
6. el tablero no convierte una solicitud en investigación;
7. la superficie de caso conserva la autoridad sobre decisiones, evidencia y respuesta.

---

#### 16. Bloque Brechas

El bloque **Brechas** proyecta las brechas y acciones correctivas del registro propietario de cumplimiento.

Cada fila podrá mostrar:

- referencia de brecha;
- obligación o control relacionado;
- alcance;
- responsable;
- evidencia relacionada en forma minimizada;
- condición actual;
- fecha objetivo si existe y es resoluble;
- acción correctiva referenciada;
- bloqueo;
- acción de navegación.

Se conserva la separación:

```text
BRECHA
≠ EXCEPCIÓN
≠ INCUMPLIMIENTO
≠ INCIDENTE
≠ INVESTIGACIÓN
```

La interfaz no convierte una brecha en hallazgo investigativo ni la cierra por una interacción local.

---

#### 17. Detalle contextual y navegación

Seleccionar una fila abre un detalle contextual minimizado antes de navegar, siempre que el actor tenga permiso para ese detalle.

El detalle podrá contener:

- referencia;
- tipo;
- estado fuente;
- razones de atención;
- responsable;
- fechas resolubles;
- bloqueo;
- metadatos de evidencia permitidos;
- acción principal de navegación.

No deberá contener por defecto:

- documentos completos;
- datos personales completos;
- secretos;
- logs completos;
- evidencia preservada completa;
- contenido de investigaciones;
- copias de archivos;
- información de terceros no necesaria.

La acción principal navega a la superficie propietaria. El tablero no ejecuta desde esta vista decisiones irreversibles de aprobación, cierre, disposición, eliminación, supresión, liberación de hold o cierre investigativo.

---

#### 18. Matriz de acciones de interfaz

| Acción           | Resultado permitido                         | Resultado prohibido                                          |
| ---------------- | ------------------------------------------- | ------------------------------------------------------------ |
| Filtrar          | reducir la proyección autorizada            | ampliar permisos                                             |
| Ordenar          | cambiar el orden visual                     | cambiar prioridad o estado fuente                            |
| Abrir detalle    | mostrar metadatos autorizados y minimizados | exponer contenido sensible por defecto                       |
| Abrir obligación | navegar al registro propietario             | declarar cumplimiento                                        |
| Abrir solicitud  | navegar al caso propietario                 | resolver el caso desde el tablero                            |
| Abrir brecha     | navegar a su gestión propietaria            | cerrar la brecha localmente                                  |
| Abrir gobierno   | navegar al contexto gobernado               | modificar propietario, finalidad o territorio por inferencia |
| Revisar alerta   | mostrar las razones que la generan          | silenciar permanentemente una condición fuente               |
| Cambiar filtros  | recalcular la proyección                    | alterar datos de negocio                                     |

---

#### 19. Wireframe semántico materializado

```text
┌────────────────────────────────────────────────────────────────────────────┐
│ Gobierno de información                                      [Alcance]     │
│ Contexto autorizado · filtros activos · referencia temporal disponible     │
├────────────────────────────────────────────────────────────────────────────┤
│ Gobierno por completar │ Obligaciones con acción │ Alertas activas         │
│ Solicitudes con acción │ Brechas abiertas                                  │
├────────────────────────────────────────────────────────────────────────────┤
│ Filtros: proceso · aplicación · responsable · territorio · estado · fecha │
├────────────────────────────────────────────────────────────────────────────┤
│ ATENCIÓN REQUERIDA                                                         │
│ Prioridad │ Tipo │ Referencia │ Razón │ Vence │ Responsable │ Acción       │
├────────────────────────────────────────────────────────────────────────────┤
│ GOBIERNO                                                                   │
│ referencia · aplicación · clasificación · finalidad · territorio · estado │
├────────────────────────────────────────────────────────────────────────────┤
│ OBLIGACIONES                                                               │
│ referencia · aplica · evidencia · cumplimiento · vence · responsable      │
├────────────────────────────────────────────────────────────────────────────┤
│ ALERTAS                                                                    │
│ referencia fuente · condición · razón · prioridad visual · acción         │
├────────────────────────────────────────────────────────────────────────────┤
│ SOLICITUDES                                                                │
│ caso · tipo · estado · vence · responsable · siguiente acción             │
├────────────────────────────────────────────────────────────────────────────┤
│ BRECHAS                                                                    │
│ brecha · obligación/control · responsable · condición · acción correctiva │
└────────────────────────────────────────────────────────────────────────────┘
```

Los términos mostrados son campos semánticos del diseño. Ninguna cifra operativa queda preestablecida.

---

#### 20. Estados de experiencia

##### 20.1. Carga

- conservar estructura visual y filtros;
- usar indicadores de carga sin exponer datos anteriores de otro alcance;
- no presentar ceros hasta confirmar la fuente;
- no bloquear todo el tablero si solo una sección independiente está cargando.

##### 20.2. Vacío

Se distinguen al menos:

- **Sin elementos para estos filtros**: la consulta autorizada fue válida y no produjo elementos;
- **Sin acciones requeridas**: la consulta fue válida y las condiciones de atención no produjeron filas;
- **Sin acceso visible**: no se presenta como un vacío de negocio si el actor carece de visibilidad.

##### 20.3. Error

- el error no incluye logs completos, trazas internas, secretos ni payloads sensibles;
- una sección fallida muestra **No fue posible confirmar esta información**;
- las demás secciones pueden permanecer utilizables;
- un error nunca se transforma en un conteo cero.

##### 20.4. Datos parciales o no confirmados

Cuando una fuente requerida no pueda confirmarse:

- se identifica la sección afectada;
- se evita afirmar integridad del conteo;
- no se mezclan datos parciales con una etiqueta de estado saludable;
- no se inventa una hora de actualización;
- la navegación a fuentes confirmadas puede permanecer disponible.

---

#### 21. Autorización, privacidad y minimización

La seguridad visual es parte del contrato del tablero.

Reglas obligatorias:

1. los conteos se calculan después de la autorización;
2. un total agregado no puede revelar la existencia de recursos ocultos;
3. una fila solo se muestra si el actor puede conocer su referencia;
4. el título y resumen no incluyen por defecto nombres, identificadores personales, secretos ni contenido documental sensible;
5. la clasificación puede mostrarse cuando sea autorizada, pero no concede acceso al contenido;
6. si existe visibilidad sin permiso de acción, la interfaz presenta una navegación o estado de solo lectura compatible; no simula una acción habilitada;
7. una denegación no expone el motivo sensible de otra política;
8. una sesión o acceso de emergencia no cambia la estructura del tablero ni crea un modo irrestricto;
9. logs, investigación y evidencia preservada permanecen minimizados y sujetos a la autorización reforzada aprobada;
10. cualquier futura exportación del tablero deberá usar su propia decisión autorizada y no se considera incluida por este diseño.

---

#### 22. Accesibilidad y legibilidad

El tablero deberá:

- usar títulos jerárquicos y regiones identificables;
- permitir recorrido por teclado;
- conservar foco visible;
- no depender exclusivamente de color para distinguir prioridad o estado;
- acompañar cualquier icono con texto o nombre accesible;
- ofrecer etiquetas humanas junto al estado canónico cuando este sea relevante;
- mantener tablas legibles en ancho reducido mediante priorización de columnas, no mediante eliminación silenciosa de información crítica;
- preservar lectura de vencimiento, responsable y acción principal sin depender de hover;
- evitar animaciones que dificulten seguimiento de cambios;
- usar mensajes de error y vacío inequívocos.

---

#### 23. Simplicidad operativa

La simplicidad del tablero se obtiene por reducción de decisiones visibles, no por ocultar incertidumbre.

Se aplican estas reglas:

1. una sola cola de atención transversal;
2. cinco indicadores alineados con el título de la tarea;
3. máximo una acción principal por fila;
4. detalle contextual antes del salto cuando aporte contexto sin exponer contenido sensible;
5. el estado fuente se traduce a lenguaje humano sin modificarlo;
6. los elementos saludables permanecen en sus bloques, fuera de la cola de atención por defecto;
7. las razones múltiples se agrupan por referencia para evitar duplicados;
8. filtros consistentes entre bloques;
9. ninguna aprobación o cierre crítico se ejecuta desde el resumen;
10. la ausencia de evidencia se muestra como incertidumbre explícita.

---

#### 24. Fronteras con las tareas siguientes

`INFO-GOVERNANCE-DASHBOARD-BOUNDARY-MATRIX-001` conserva las siguientes fronteras:

| Materia                                                           | INFO-UX-001                                             | Tarea propietaria                                 |
| ----------------------------------------------------------------- | ------------------------------------------------------- | ------------------------------------------------- |
| resumen de gobierno, obligaciones, alertas, solicitudes y brechas | diseña y materializa la proyección                      | `INFO-UX-001`                                     |
| biblioteca, búsqueda, expediente, versión y vigencia              | solo puede recibir navegación o referencia              | `INFO-UX-002`                                     |
| creación, revisión, aprobación, publicación, aceptación y firma   | no diseña el flujo                                      | `INFO-UX-003`                                     |
| portal y gestión completa de solicitudes de privacidad            | muestra resumen y navegación                            | `INFO-UX-004`                                     |
| retención, legal hold, archivo, disposición y eliminación         | muestra bloqueo o referencia cuando sea pertinente      | `INFO-UX-005`                                     |
| exploración de auditoría e investigaciones                        | muestra únicamente referencia o escalamiento autorizado | `INFO-UX-006`                                     |
| propagación y sincronización entre sistemas                       | define experiencia esperada, no integración             | `INFO-INT-*` aplicables                           |
| implementación física de VISO                                     | no crea ruta ni componentes                             | fase de implementación autorizada correspondiente |

Ninguna frontera difiere el resultado principal de esta tarea: el tablero simple queda diseñado y materializado como contrato de experiencia completo.

---

#### 25. Handoff de implementación futura

Cuando la ruta canónica autorice implementación, el equipo deberá materializar esta experiencia en VISO respetando, como mínimo:

- el catálogo de pantallas y rutas vigente en ese momento;
- el evaluador de autorización canónico;
- la fuente propietaria de cada bloque;
- la minimización de datos;
- la segregación de acciones;
- el contrato de estados visuales;
- la cola determinista de atención;
- los límites con las cinco experiencias posteriores;
- pruebas de no filtración mediante conteos, filtros, detalles y errores.

Esta tarea no determina archivos de código, endpoints, queries, tablas o componentes físicos porque la fase actual no autoriza esa materialización.

---

#### 26. Criterios de aceptación

La tarea queda documentalmente satisfecha cuando se conserva todo lo siguiente:

- VISO queda identificado como aplicación objetivo sin inventar una ruta física;
- existe un tablero único con gobierno, obligaciones, alertas, solicitudes y brechas;
- existe una cola transversal de atención requerida;
- los cinco indicadores se calculan sobre el alcance autorizado;
- los 69 procesos y 332 contextos documentales permanecen cubiertos por referencia al universo heredado;
- las nueve aplicaciones propietarias permanecen distinguibles;
- obligación, aplicabilidad, control, evidencia, brecha y cumplimiento no se fusionan;
- una alerta se mantiene como condición derivada y no como estado maestro;
- las fechas se muestran y ordenan únicamente cuando la fuente las ha resuelto;
- los estados canónicos se traducen sin cambiar su significado;
- las solicitudes se resumen sin adelantar la experiencia completa de `INFO-UX-004`;
- auditoría e investigación no se convierten en explorador antes de `INFO-UX-006`;
- biblioteca, creación documental y retención permanecen en sus tareas propietarias;
- conteos y filtros no filtran existencia de recursos no autorizados;
- contenido sensible, logs completos y evidencia preservada no se exponen por defecto;
- errores parciales no se convierten en ceros ni en estados saludables;
- no se ejecutan decisiones irreversibles desde el tablero;
- no se crean estados de negocio paralelos;
- no se crea ningún registro maestro nuevo;
- no se crea código, migración, cambio de Supabase ni implementación física;
- no se alteran requisitos de prueba existentes.

---

#### 27. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el registro vigente ya protege expresamente la administración segregada en VISO del gobierno de información, obligaciones, solicitudes, auditorías e investigaciones, además de exigir que la interfaz muestre prioridades y acciones sin exponer por defecto contenido sensible, logs completos ni datos innecesarios. Esta tarea materializa la experiencia del tablero sobre esa cobertura ya existente y no introduce un criterio de aceptación ejecutable adicional.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 28. Continuidad

ÚLTIMA TAREA APROBADA

`INFO-AUTH-004 — Proteger auditoría, investigaciones, accesos de emergencia, logs y evidencia preservada`

TAREA ACTUAL APROBADA

`INFO-UX-001 — Diseñar tablero simple de gobierno, obligaciones, alertas, solicitudes y brechas`

SIGUIENTE TAREA RESERVADA

`INFO-UX-002 — Diseñar biblioteca documental con búsqueda autorizada, expediente, versión y vigencia`


### ✅ INFO-UX-002 — Diseñar biblioteca documental con búsqueda autorizada, expediente, versión y vigencia

**Estado:** APROBADA
**Tarea anterior:** `INFO-UX-001 — Diseñar tablero simple de gobierno, obligaciones, alertas, solicitudes y brechas` — APROBADA
**Tarea siguiente:** `INFO-UX-003 — Diseñar creación, revisión, aprobación, publicación y firma de documentos` — RESERVADA
**Tipo de tarea:** documental; diseño normativo y materializado de la experiencia de biblioteca documental transversal, búsqueda autorizada, navegación por expediente, consulta de versiones y lectura inequívoca de vigencia sobre fuentes propietarias federadas
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/AA_GOBIERNO_DE_INFORMACION/03_EXPERIENCIA_DOCUMENTAL_Y_PRIVACIDAD.md`
**Fase:** exclusivamente documental
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, rutas, componentes, tablas, índices, buckets, objetos, Storage, RLS, RPC, funciones, triggers, Edge Functions, migraciones, datos, permisos, contratos técnicos publicados ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Materializar la experiencia documental que permite a un actor autorizado localizar información de VENTO, reconocer a qué proceso y expediente pertenece, distinguir identidad lógica de representación física, consultar la versión aplicable y comprender su vigencia sin crear una biblioteca maestra paralela a las aplicaciones propietarias.

La experiencia consume los contratos aprobados de taxonomía, ciclo documental, metadatos, localización, búsqueda y autorización. La interfaz no decide autoridad, no reclasifica documentos y no convierte un índice, una ruta, una carpeta, un bucket, una copia o una representación técnica en fuente de verdad empresarial.

---

#### 2. Resultado sustantivo

La tarea materializa cinco contratos de experiencia coordinados:

1. `INFO-DOCUMENT-LIBRARY-UX-CONTRACT-001`: composición y comportamiento de la biblioteca documental transversal.
2. `INFO-DOCUMENT-AUTHORIZED-SEARCH-UX-CONTRACT-001`: interacción de búsqueda, filtros, resultados, conteos y estados sin revelar recursos fuera del alcance autorizado.
3. `INFO-DOCUMENT-DOSSIER-UX-CONTRACT-001`: navegación por expediente y relaciones documentales sin transferir propiedad funcional.
4. `INFO-DOCUMENT-VERSION-VIGENCY-UX-CONTRACT-001`: presentación conjunta pero no fusionada de versión, estado documental, publicación y vigencia.
5. `INFO-DOCUMENT-LIBRARY-DOCCTX-MATRIX-001`: decisión explícita para las 332 identidades documentales heredadas.

Balance materializado:

| Control                                           | Resultado |
| ------------------------------------------------- | --------: |
| Procesos `VPROC-*` heredados                      |    **69** |
| Identidades `DOCCTX-*` esperadas                  |   **332** |
| Identidades `DOCCTX-*` materializadas             |   **332** |
| Identidades faltantes                             |     **0** |
| Identidades duplicadas                            |     **0** |
| Aplicaciones propietarias funcionales preservadas |     **9** |
| Reclasificaciones                                 |     **0** |
| Cambios de propietaria funcional                  |     **0** |
| Cambios físicos                                   |     **0** |
| Requisitos de prueba nuevos o modificados         |     **0** |

---

#### 3. Decisión de arquitectura de experiencia

La biblioteca se define como una **proyección autorizada y reconstruible** sobre fuentes propietarias, no como un repositorio documental central.

```text
FUENTE PROPIETARIA
→ identidad documental y recurso empresarial
→ metadatos gobernados
→ proyección de búsqueda autorizable
→ biblioteca documental
→ expediente / detalle / versión / vigencia
→ apertura controlada de la representación cuando la acción esté autorizada
```

Fronteras obligatorias:

```text
BIBLIOTECA ≠ REPOSITORIO MAESTRO
BIBLIOTECA ≠ BUCKET
BIBLIOTECA ≠ CARPETA
BIBLIOTECA ≠ ÍNDICE COMO FUENTE DE VERDAD
EXPEDIENTE ≠ PROPIETARIA FUNCIONAL
DOCUMENTO ≠ REPRESENTACIÓN
VERSIÓN ≠ VIGENCIA
APROBACIÓN ≠ VIGENCIA
PUBLICACIÓN ≠ VIGENCIA
LOCALIZAR ≠ AUTORIZAR CONTENIDO
VER METADATOS ≠ OBTENER ARCHIVO
```

Las aplicaciones propietarias conservan significado, corrección y autoridad sobre sus hechos empresariales. Supabase/Storage conserva persistencia técnica cuando corresponda. VISO puede actuar como superficie administrativa de convergencia para gobierno y cumplimiento, mientras ANIMA, PASS y las demás aplicaciones mantienen las entradas contextuales que ya les correspondan. Ninguna superficie adquiere propiedad sobre el documento por presentarlo.

---

#### 4. Universo y entradas heredadas

Se preservan sin redefinición:

- las 69 identidades de proceso `VPROC-*`;
- las 332 identidades contextuales `DOCCTX-*`;
- las nueve aplicaciones propietarias funcionales;
- la taxonomía de documento, registro, evidencia, serie, expediente, original, copia y representación;
- la escala `S0_PUBLIC`, `S1_INTERNAL`, `S2_CONFIDENTIAL`, `S3_RESTRICTED`, `S4_HIGHLY_RESTRICTED`;
- `INFO_DOCUMENT_LIFECYCLE_V1`, con versionado `NON_DESTRUCTIVE` y vigencia `EFFECTIVE_TIME` para las 332 identidades;
- los estados de preparación `RECEIVED`, `RECORDED`, `DRAFT`, `IN_REVIEW`, `REJECTED`, `APPROVED`;
- los estados de vigencia `NOT_EFFECTIVE`, `CURRENT`, `SUPERSEDED`, `EXPIRED`, `WITHDRAWN`, `ANNULLED`;
- los estados de publicación `NOT_PUBLISHED`, `PUBLISHED`, `UNPUBLISHED`;
- los contratos de metadatos, vínculo de recurso, localización, almacenamiento y búsqueda autorizada de INFO-DOM;
- la autorización fail closed por clasificación, finalidad, identidad, relación, recurso, territorio, estado, permiso, política de campos y denegaciones;
- la independencia de las capacidades de consulta, revelación, obtención de archivo, impresión, exportación y compartición.

La tarea no modifica ninguna de estas decisiones; define cómo se presentan y navegan de manera comprensible.

---

#### 5. Contrato `INFO-DOCUMENT-LIBRARY-UX-CONTRACT-001`

La biblioteca tendrá cinco regiones lógicas persistentes en la experiencia:

| Región                 | Objetivo                                              | Contenido mínimo                                                                                                                                   |
| ---------------------- | ----------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| contexto               | dejar claro desde qué autoridad y alcance se consulta | actor efectivo cuando proceda, alcance autorizado, aplicación o proceso, fecha de corte y estado de actualización                                  |
| búsqueda               | localizar sin ampliar autoridad                       | término, filtros autorizados, orden estable y limpieza explícita                                                                                   |
| resultados             | comparar candidatos autorizados                       | identidad legible, tipo documental, proceso, relación de expediente, versión aplicable, vigencia y propietaria funcional cuando sea visible        |
| detalle                | interpretar un elemento sin perder contexto           | identidad lógica, clasificación proyectable, fuente propietaria, estado, versión, vigencia, publicación, relaciones y representaciones autorizadas |
| navegación relacionada | recorrer expediente, versiones y recursos             | expediente, serie, documento relacionado, historial de versiones y salto a fuente propietaria según autorización                                   |

La biblioteca debe permitir volver del detalle a los mismos resultados sin perder consulta, filtros, orden ni selección. Abrir un elemento no cambia el alcance autorizado ni transporta una decisión de autorización a otro recurso.

---

#### 6. Entrada y contexto visible

Antes de mostrar resultados, la superficie deberá poder presentar el contexto efectivo que resulte seguro revelar. Como mínimo deberá existir una indicación inequívoca cuando la consulta esté limitada por proceso, expediente, recurso, territorio, periodo o finalidad.

Reglas:

1. un selector visual no fabrica contexto ni autorización;
2. cambiar un filtro que afecte recurso, finalidad, relación o territorio obliga a una nueva resolución de alcance;
3. una consulta guardada conserva criterios, no autoridad;
4. restaurar una sesión o volver desde historial revalida autorización y estado antes de reconstruir resultados;
5. una fecha de corte visible distingue una proyección actual de una respuesta desactualizada o parcial.

---

#### 7. Contrato `INFO-DOCUMENT-AUTHORIZED-SEARCH-UX-CONTRACT-001`

La experiencia conserva el pipeline canónico de búsqueda:

```text
actor + finalidad + acción + alcance
→ proyección de índice autorizable
→ candidatos dentro del alcance permitido
→ revalidación de autorización y estado vigente
→ proyección mínima de metadatos
→ acceso al contenido mediante su control propio
```

La interfaz nunca implementará el patrón inverso de buscar globalmente y ocultar después en el cliente.

---

#### 8. Campo de búsqueda

El campo de búsqueda:

- acepta únicamente criterios que la proyección autorizable pueda evaluar;
- no promete búsqueda de contenido completo cuando la fuente o índice autorizado no lo soporte;
- no muestra sugerencias, autocompletados, fragmentos o historial que revelen nombres o términos de recursos no autorizados;
- conserva el término visible al cambiar filtros compatibles;
- comunica cuándo una consulta se limita a metadatos gobernados;
- evita interpretar un identificador conocido, una ruta o un localizador como permiso para abrir el recurso.

Los términos de búsqueda no se convierten en finalidad empresarial ni en justificación de acceso.

---

#### 9. Filtros y facetas

La biblioteca puede proyectar, cuando estén autorizados y disponibles, filtros por:

- proceso;
- aplicación propietaria;
- tipo documental o categoría taxonómica;
- expediente o serie;
- estado de preparación;
- estado de vigencia;
- estado de publicación;
- periodo o fecha efectiva;
- relación empresarial resoluble;
- clasificación únicamente cuando revelar esa clasificación no exponga información fuera del alcance.

Reglas de facetas:

1. un valor de filtro solo aparece si su existencia es autorizable para el actor dentro del universo consultado;
2. los conteos se calculan después de aplicar autorización y minimización;
3. cero resultados no permite inferir si existen elementos fuera del alcance;
4. combinar filtros nunca amplía el universo base;
5. limpiar filtros restaura únicamente el alcance autorizado inicial, no un universo global.

---

#### 10. Resultado de búsqueda

Cada fila o tarjeta de resultado debe poder diferenciar, según disponibilidad y autorización:

| Campo                 | Regla de experiencia                                                              |
| --------------------- | --------------------------------------------------------------------------------- |
| identidad legible     | nombre o título mínimo permitido; nunca una ruta técnica como identidad principal |
| tipo                  | taxonomía documental vigente                                                      |
| proceso               | `VPROC-*` o denominación legible asociada                                         |
| expediente/serie      | relación, no carpeta física                                                       |
| propietaria funcional | aplicación que conserva autoridad empresarial                                     |
| versión               | versión concreta presentada                                                       |
| vigencia              | estado efectivo de esa versión                                                    |
| publicación           | estado separado de vigencia                                                       |
| fecha efectiva        | fecha o intervalo que explica aplicabilidad cuando exista                         |
| clasificación         | solo la proyección autorizada                                                     |
| actualización         | fecha de corte o evidencia de frescura cuando aplique                             |

Un resultado no mostrará iconos ambiguos para mezclar aprobado, publicado y vigente. Las tres dimensiones se presentan separadas cuando sean relevantes.

---

#### 11. Orden de resultados

El orden predeterminado debe ser estable y explicable. Cuando la consulta mezcle múltiples procesos o aplicaciones, la relevancia no podrá promover una versión histórica sobre la versión `CURRENT` sin una señal explícita.

Se permiten órdenes alternativos por fecha, título, proceso, tipo o vigencia cuando la fuente los soporte. El criterio activo siempre será visible y no altera autorización.

---

#### 12. Contrato `INFO-DOCUMENT-DOSSIER-UX-CONTRACT-001`

El expediente es una relación empresarial navegable entre documentos y recursos; no es una carpeta que absorbe propiedad.

```text
EXPEDIENTE
→ identifica caso, proceso o conjunto empresarial
→ referencia documentos y registros
→ cada referencia conserva identidad y propietaria
→ cada documento conserva sus propias versiones y vigencia
→ cada acceso se reautoriza según recurso y acción
```

La vista de expediente deberá poder mostrar:

- identidad y estado del expediente cuando exista fuente canónica;
- proceso o caso relacionado;
- documentos relacionados autorizados;
- papel o relación de cada documento dentro del expediente;
- versión aplicable de cada referencia;
- indicadores de faltante, no vigente o bloqueado únicamente cuando su revelación esté autorizada;
- enlaces a otros recursos empresariales sin copiar sus hechos al expediente.

Si un documento relacionado no es visible para el actor, la interfaz no mostrará un hueco, contador o etiqueta que revele su existencia salvo que otro contrato canónico autorice explícitamente esa señal.

---

#### 13. Documento, original, copia y representación

El detalle separa identidad lógica de sus representaciones:

```text
DOCUMENTO LÓGICO
→ VERSIONES
→ REPRESENTACIONES
→ LOCALIZADORES
```

Cuando los metadatos estén disponibles y autorizados, la experiencia puede indicar si una representación corresponde a original, copia controlada, representación digital, soporte físico u otra categoría canónica. La ubicación física o técnica se muestra como localización, nunca como propietaria ni como autorización.

Una representación no demostrada se presenta como información no disponible; no se inventa a partir de bucket, extensión, ruta, nombre de archivo o convención local.

---

#### 14. Contrato `INFO-DOCUMENT-VERSION-VIGENCY-UX-CONTRACT-001`

La experiencia separa cuatro dimensiones:

| Dimensión   | Pregunta que responde                                          |
| ----------- | -------------------------------------------------------------- |
| versión     | ¿qué revisión inmutable estoy viendo?                          |
| preparación | ¿en qué estado del ciclo de preparación quedó esa versión?     |
| publicación | ¿fue publicada o retirada de publicación?                      |
| vigencia    | ¿es la versión aplicable para la fecha y contexto consultados? |

La interfaz no usa “última” como sinónimo de vigente. Una versión creada más recientemente puede no estar aprobada, publicada o vigente; una versión aprobada puede permanecer `NOT_EFFECTIVE` hasta su fecha efectiva.

---

#### 15. Presentación de la versión vigente

Cuando exista una versión `CURRENT`, el detalle la identifica como **Vigente** y conserva su identificador de versión. Si no existe una versión vigente para la fecha consultada, la interfaz no selecciona automáticamente la versión cronológicamente más reciente para aparentar continuidad.

Estados mínimos de presentación:

| Estado canónico | Etiqueta legible | Tratamiento visual/funcional                                                |
| --------------- | ---------------- | --------------------------------------------------------------------------- |
| `NOT_EFFECTIVE` | Aún no vigente   | mostrar fecha efectiva cuando exista; no confundir con actual               |
| `CURRENT`       | Vigente          | destacar como aplicable al contexto temporal consultado                     |
| `SUPERSEDED`    | Sustituida       | mostrar sucesora cuando sea autorizable; evitar uso accidental como vigente |
| `EXPIRED`       | Vencida          | indicar fin de vigencia cuando exista                                       |
| `WITHDRAWN`     | Retirada         | impedir que se presente como versión activa                                 |
| `ANNULLED`      | Anulada          | dejar inequívoco que no es aplicable; conservar historial autorizado        |

---

#### 16. Historial de versiones

El historial, cuando la acción esté autorizada, muestra de forma no destructiva:

- identificador de versión;
- estado de preparación;
- estado de publicación;
- estado de vigencia;
- inicio y fin efectivos cuando existan;
- relación de sustitución o anulación cuando esté resuelta;
- fecha de creación o registro cuando forme parte del metadato autorizado;
- propietaria funcional y fuente de verdad.

Seleccionar una versión histórica activa un contexto explícito **Versión histórica**. Mientras ese contexto esté activo, la superficie no ofrece acciones que puedan tratarla como versión vigente por simple selección.

---

#### 17. Fecha de consulta y vigencia temporal

Cuando el caso de uso exija responder “qué documento aplicaba en una fecha”, la biblioteca puede recibir una fecha de consulta autorizada. Esa fecha modifica la proyección de vigencia, no el contenido histórico.

Reglas:

1. la fecha de consulta siempre queda visible mientras afecte resultados;
2. volver a “hoy” es una acción explícita;
3. una comparación temporal no modifica fechas efectivas;
4. si la fuente no puede resolver vigencia para la fecha solicitada, la experiencia muestra estado no resoluble y no elige una versión por proximidad;
5. el tiempo de consulta no sustituye territorio, finalidad, relación ni autorización.

---

#### 18. Acciones documentales desde la biblioteca

La biblioteca distingue navegación de acciones con efecto o salida:

| Acción                   | Regla                                                                          |
| ------------------------ | ------------------------------------------------------------------------------ |
| consultar metadatos      | requiere proyección autorizada del recurso y campos                            |
| abrir contenido          | revalida autorización para contenido de la versión concreta                    |
| obtener representación   | capacidad independiente de consulta                                            |
| imprimir                 | capacidad independiente y controles de salida aplicables                       |
| exportar                 | capacidad independiente, alcance y minimización propios                        |
| compartir                | capacidad independiente, destinatario/finalidad/expiración cuando correspondan |
| abrir fuente propietaria | navega al recurso canónico sin transferir autoridad                            |

La visibilidad de un botón nunca se considera control suficiente. Toda acción real deberá revalidarse en la frontera autoritativa correspondiente.

---

#### 19. Datos sensibles y minimización

La superficie aplica minimización antes de representar campos. Para S2, S3 y S4, o cuando una política de campo lo exija:

- títulos, sujetos, fragmentos, etiquetas, relaciones y localizadores pueden requerir masking u omisión;
- el resultado puede mostrar una identidad funcional mínima sin exponer contenido;
- revelar un campo no concede copiarlo, obtener una representación, imprimirlo, exportarlo o compartirlo;
- las vistas de expediente y de historial aplican la misma política de campos que la búsqueda;
- los mensajes de error y telemetría no incorporan contenido sensible para explicar una denegación.

---

#### 20. Estados de interfaz

| Estado UX                    | Comportamiento obligatorio                                                                                               |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| inicial                      | explica el alcance de consulta disponible sin revelar recursos                                                           |
| cargando                     | conserva término y filtros; no muestra resultados obsoletos como actuales                                                |
| sin coincidencias            | informa que no hay resultados visibles para los criterios actuales, sin inferir existencia externa                       |
| acceso insuficiente          | no revela nombre, cantidad ni metadatos del recurso denegado                                                             |
| parcial                      | identifica que la respuesta es incompleta y qué dimensión autorizada no pudo resolverse, sin convertir faltantes en cero |
| desactualizado               | muestra fecha de corte y exige revalidación antes de una acción sensible                                                 |
| error                        | conserva criterios y permite reintento seguro sin ampliar alcance                                                        |
| versión no vigente           | mantiene etiqueta persistente mientras la versión histórica esté abierta                                                 |
| representación no disponible | conserva identidad lógica si está autorizada y evita fabricar ubicación o archivo                                        |

---

#### 21. Accesibilidad y comprensión

La experiencia deberá:

- mantener búsqueda, filtros, resultados y detalle operables por teclado;
- asociar etiquetas textuales a estados de vigencia y no depender solo de color;
- anunciar cambios relevantes de resultados y errores sin mover foco de forma destructiva;
- conservar orden de foco al abrir y cerrar detalle;
- usar lenguaje humano para vigente, sustituida, vencida, retirada y anulada, conservando el estado canónico como dato estructurado;
- evitar iconografía sin texto para clasificación, versión o estado;
- mantener contraste y densidad compatibles con una superficie administrativa de consulta.

---

#### 22. Wireframe lógico

```text
┌──────────────────────────────────────────────────────────────────────────────┐
│ Biblioteca documental                      Alcance autorizado · fecha de corte │
├──────────────────────────────────────────────────────────────────────────────┤
│ Buscar documentos, registros o expedientes                                  │
│ [ término ............................................................... ]   │
│ Filtros: Proceso · Tipo · Expediente · Vigencia · Periodo                    │
├───────────────────────────────────────────────┬──────────────────────────────┤
│ Resultados autorizados                        │ Detalle                       │
│                                               │ Documento / expediente        │
│ Título mínimo                                 │ Fuente propietaria            │
│ Tipo · Proceso · Expediente                   │ Versión seleccionada          │
│ Versión · Vigencia · Publicación              │ Vigencia · Publicación        │
│ Fecha efectiva                                │ Relaciones autorizadas        │
│                                               │ Representaciones autorizadas  │
│                                               │ Historial de versiones        │
├───────────────────────────────────────────────┴──────────────────────────────┤
│ Estado de consulta · criterios activos · fecha de corte                     │
└──────────────────────────────────────────────────────────────────────────────┘
```

El wireframe expresa jerarquía y comportamiento; no fija una ruta, componente, framework ni implementación física.

---

#### 23. Navegación y handoff entre aplicaciones

La biblioteca puede actuar como punto de descubrimiento transversal, pero cada mutación o acción propietaria se entrega a la aplicación que conserva autoridad.

Un handoff deberá conservar, cuando aplique:

- referencia estable al recurso;
- versión seleccionada;
- expediente o proceso de origen;
- intención de navegación;
- retorno seguro a la consulta;
- correlación suficiente para auditoría.

El handoff no transporta permisos ni sustituye la nueva evaluación de autorización en la aplicación destino.

---

#### 24. Fronteras con tareas siguientes

| Capacidad                                             | Decisión en INFO-UX-002                                        | Tarea propietaria                      |
| ----------------------------------------------------- | -------------------------------------------------------------- | -------------------------------------- |
| creación y edición de documentos                      | solo referencia/navegación; no se diseña flujo de mutación     | `INFO-UX-003`                          |
| revisión, aprobación, publicación y firma             | solo estado visible cuando ya existe; no se diseña ejecución   | `INFO-UX-003`                          |
| portal de derechos de privacidad                      | fuera de la biblioteca general                                 | `INFO-UX-004`                          |
| retención, legal hold, archivo y disposición          | puede mostrar estado autorizado; no ejecuta ni diseña el flujo | `INFO-UX-005`                          |
| exploración de auditoría e investigación              | no se incorpora como pestaña oculta de la biblioteca           | `INFO-UX-006`                          |
| implementación de índices, Storage, OCR o adaptadores | fuera de fase documental                                       | tareas técnicas posteriores aplicables |

Ninguna frontera difiere el resultado principal de INFO-UX-002: búsqueda autorizada, expediente, versión y vigencia quedan diseñados completamente.

---

#### 25. Matriz `INFO-DOCUMENT-LIBRARY-DOCCTX-MATRIX-001` — 332 de 332

Cada identidad heredada recibe una decisión explícita. `INCLUIDA` significa que forma parte del universo lógico de la biblioteca cuando exista una instancia materializada; no significa que cualquier actor pueda conocer su existencia. `PREAUTORIZADA` significa que la búsqueda aplica autorización antes de la proyección del resultado. `REFERENCIAL_NO_APROPIATIVO` preserva la autoridad de la aplicación propietaria. Versionado y vigencia se heredan sin modificación de INFO-DOM.

| ID contextual          | Proceso      | Biblioteca | Búsqueda        | Expediente                   | Versionado        | Vigencia         | Estado         |
| ---------------------- | ------------ | ---------- | --------------- | ---------------------------- | ----------------- | ---------------- | -------------- |
| `DOCCTX-VPROC-0001-01` | `VPROC-0001` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0001-02` | `VPROC-0001` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0002-01` | `VPROC-0002` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0002-02` | `VPROC-0002` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0003-01` | `VPROC-0003` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0004-01` | `VPROC-0004` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0005-01` | `VPROC-0005` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0005-02` | `VPROC-0005` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0005-03` | `VPROC-0005` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0005-04` | `VPROC-0005` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0005-05` | `VPROC-0005` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0006-01` | `VPROC-0006` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0006-02` | `VPROC-0006` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0006-03` | `VPROC-0006` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0006-04` | `VPROC-0006` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0007-01` | `VPROC-0007` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0007-02` | `VPROC-0007` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0007-03` | `VPROC-0007` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0008-01` | `VPROC-0008` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0009-01` | `VPROC-0009` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0010-01` | `VPROC-0010` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0010-02` | `VPROC-0010` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0010-03` | `VPROC-0010` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0010-04` | `VPROC-0010` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0011-01` | `VPROC-0011` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0011-02` | `VPROC-0011` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0011-03` | `VPROC-0011` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0011-04` | `VPROC-0011` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0012-01` | `VPROC-0012` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0012-02` | `VPROC-0012` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0012-03` | `VPROC-0012` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0012-04` | `VPROC-0012` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0012-05` | `VPROC-0012` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0013-01` | `VPROC-0013` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0013-02` | `VPROC-0013` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0013-03` | `VPROC-0013` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0014-01` | `VPROC-0014` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0014-02` | `VPROC-0014` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0014-03` | `VPROC-0014` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0014-04` | `VPROC-0014` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0015-01` | `VPROC-0015` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0015-02` | `VPROC-0015` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0015-03` | `VPROC-0015` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0015-04` | `VPROC-0015` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0016-01` | `VPROC-0016` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0016-02` | `VPROC-0016` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0016-03` | `VPROC-0016` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0016-04` | `VPROC-0016` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0017-01` | `VPROC-0017` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0018-01` | `VPROC-0018` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0018-02` | `VPROC-0018` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0018-03` | `VPROC-0018` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0018-04` | `VPROC-0018` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0019-01` | `VPROC-0019` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0019-02` | `VPROC-0019` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0019-03` | `VPROC-0019` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0020-01` | `VPROC-0020` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0020-02` | `VPROC-0020` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0020-03` | `VPROC-0020` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0020-04` | `VPROC-0020` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0020-05` | `VPROC-0020` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0021-01` | `VPROC-0021` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0021-02` | `VPROC-0021` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0021-03` | `VPROC-0021` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0022-01` | `VPROC-0022` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0022-02` | `VPROC-0022` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0022-03` | `VPROC-0022` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0023-01` | `VPROC-0023` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0023-02` | `VPROC-0023` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0024-01` | `VPROC-0024` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0024-02` | `VPROC-0024` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0024-03` | `VPROC-0024` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0025-01` | `VPROC-0025` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0025-02` | `VPROC-0025` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0026-01` | `VPROC-0026` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0026-02` | `VPROC-0026` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0026-03` | `VPROC-0026` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0026-04` | `VPROC-0026` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0026-05` | `VPROC-0026` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0027-01` | `VPROC-0027` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0027-02` | `VPROC-0027` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0028-01` | `VPROC-0028` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0028-02` | `VPROC-0028` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0028-03` | `VPROC-0028` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0028-04` | `VPROC-0028` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0028-05` | `VPROC-0028` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0028-06` | `VPROC-0028` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0028-07` | `VPROC-0028` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0029-01` | `VPROC-0029` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0029-02` | `VPROC-0029` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0029-03` | `VPROC-0029` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0029-04` | `VPROC-0029` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0029-05` | `VPROC-0029` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0029-06` | `VPROC-0029` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0030-01` | `VPROC-0030` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0030-02` | `VPROC-0030` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0030-03` | `VPROC-0030` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0030-04` | `VPROC-0030` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0030-05` | `VPROC-0030` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0030-06` | `VPROC-0030` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0031-01` | `VPROC-0031` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0031-02` | `VPROC-0031` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0031-03` | `VPROC-0031` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0031-04` | `VPROC-0031` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0031-05` | `VPROC-0031` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0031-06` | `VPROC-0031` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0031-07` | `VPROC-0031` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0032-01` | `VPROC-0032` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0032-02` | `VPROC-0032` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0032-03` | `VPROC-0032` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0032-04` | `VPROC-0032` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0032-05` | `VPROC-0032` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0033-01` | `VPROC-0033` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0033-02` | `VPROC-0033` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0033-03` | `VPROC-0033` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0033-04` | `VPROC-0033` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0033-05` | `VPROC-0033` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0034-01` | `VPROC-0034` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0034-02` | `VPROC-0034` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0034-03` | `VPROC-0034` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0034-04` | `VPROC-0034` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0034-05` | `VPROC-0034` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0034-06` | `VPROC-0034` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0034-07` | `VPROC-0034` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0034-08` | `VPROC-0034` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0035-01` | `VPROC-0035` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0035-02` | `VPROC-0035` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0035-03` | `VPROC-0035` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0035-04` | `VPROC-0035` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0036-01` | `VPROC-0036` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0036-02` | `VPROC-0036` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0036-03` | `VPROC-0036` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0036-04` | `VPROC-0036` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0037-01` | `VPROC-0037` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0037-02` | `VPROC-0037` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0037-03` | `VPROC-0037` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0037-04` | `VPROC-0037` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0037-05` | `VPROC-0037` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0038-01` | `VPROC-0038` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0038-02` | `VPROC-0038` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0038-03` | `VPROC-0038` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0038-04` | `VPROC-0038` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0038-05` | `VPROC-0038` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0038-06` | `VPROC-0038` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0039-01` | `VPROC-0039` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0039-02` | `VPROC-0039` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0039-03` | `VPROC-0039` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0039-04` | `VPROC-0039` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0039-05` | `VPROC-0039` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0039-06` | `VPROC-0039` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0040-01` | `VPROC-0040` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0040-02` | `VPROC-0040` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0040-03` | `VPROC-0040` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0040-04` | `VPROC-0040` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0040-05` | `VPROC-0040` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0041-01` | `VPROC-0041` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0041-02` | `VPROC-0041` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0041-03` | `VPROC-0041` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0041-04` | `VPROC-0041` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0041-05` | `VPROC-0041` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0042-01` | `VPROC-0042` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0042-02` | `VPROC-0042` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0042-03` | `VPROC-0042` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0042-04` | `VPROC-0042` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0043-01` | `VPROC-0043` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0043-02` | `VPROC-0043` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0043-03` | `VPROC-0043` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0043-04` | `VPROC-0043` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0043-05` | `VPROC-0043` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0043-06` | `VPROC-0043` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0044-01` | `VPROC-0044` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0044-02` | `VPROC-0044` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0044-03` | `VPROC-0044` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0044-04` | `VPROC-0044` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0044-05` | `VPROC-0044` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0044-06` | `VPROC-0044` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0045-01` | `VPROC-0045` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0045-02` | `VPROC-0045` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0045-03` | `VPROC-0045` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0045-04` | `VPROC-0045` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0046-01` | `VPROC-0046` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0046-02` | `VPROC-0046` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0046-03` | `VPROC-0046` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0046-04` | `VPROC-0046` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0046-05` | `VPROC-0046` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0046-06` | `VPROC-0046` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0046-07` | `VPROC-0046` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0047-01` | `VPROC-0047` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0047-02` | `VPROC-0047` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0047-03` | `VPROC-0047` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0047-04` | `VPROC-0047` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0047-05` | `VPROC-0047` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0047-06` | `VPROC-0047` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0048-01` | `VPROC-0048` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0048-02` | `VPROC-0048` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0048-03` | `VPROC-0048` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0048-04` | `VPROC-0048` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0048-05` | `VPROC-0048` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0048-06` | `VPROC-0048` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0048-07` | `VPROC-0048` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0049-01` | `VPROC-0049` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0049-02` | `VPROC-0049` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0049-03` | `VPROC-0049` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0049-04` | `VPROC-0049` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0049-05` | `VPROC-0049` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0049-06` | `VPROC-0049` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0049-07` | `VPROC-0049` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0049-08` | `VPROC-0049` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0050-01` | `VPROC-0050` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0050-02` | `VPROC-0050` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0050-03` | `VPROC-0050` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0050-04` | `VPROC-0050` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0050-05` | `VPROC-0050` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0050-06` | `VPROC-0050` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0050-07` | `VPROC-0050` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0051-01` | `VPROC-0051` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0051-02` | `VPROC-0051` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0051-03` | `VPROC-0051` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0051-04` | `VPROC-0051` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0052-01` | `VPROC-0052` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0052-02` | `VPROC-0052` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0052-03` | `VPROC-0052` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0052-04` | `VPROC-0052` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0052-05` | `VPROC-0052` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0053-01` | `VPROC-0053` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0053-02` | `VPROC-0053` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0053-03` | `VPROC-0053` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0053-04` | `VPROC-0053` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0054-01` | `VPROC-0054` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0054-02` | `VPROC-0054` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0054-03` | `VPROC-0054` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0054-04` | `VPROC-0054` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0054-05` | `VPROC-0054` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0054-06` | `VPROC-0054` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0055-01` | `VPROC-0055` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0055-02` | `VPROC-0055` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0055-03` | `VPROC-0055` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0055-04` | `VPROC-0055` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0055-05` | `VPROC-0055` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0056-01` | `VPROC-0056` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0056-02` | `VPROC-0056` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0056-03` | `VPROC-0056` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0056-04` | `VPROC-0056` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0056-05` | `VPROC-0056` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0056-06` | `VPROC-0056` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0056-07` | `VPROC-0056` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0057-01` | `VPROC-0057` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0057-02` | `VPROC-0057` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0057-03` | `VPROC-0057` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0057-04` | `VPROC-0057` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0057-05` | `VPROC-0057` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0057-06` | `VPROC-0057` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0057-07` | `VPROC-0057` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0058-01` | `VPROC-0058` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0058-02` | `VPROC-0058` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0058-03` | `VPROC-0058` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0058-04` | `VPROC-0058` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0058-05` | `VPROC-0058` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0058-06` | `VPROC-0058` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0059-01` | `VPROC-0059` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0059-02` | `VPROC-0059` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0059-03` | `VPROC-0059` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0059-04` | `VPROC-0059` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0059-05` | `VPROC-0059` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0059-06` | `VPROC-0059` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0060-01` | `VPROC-0060` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0060-02` | `VPROC-0060` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0060-03` | `VPROC-0060` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0060-04` | `VPROC-0060` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0060-05` | `VPROC-0060` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0060-06` | `VPROC-0060` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0060-07` | `VPROC-0060` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0060-08` | `VPROC-0060` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0061-01` | `VPROC-0061` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0061-02` | `VPROC-0061` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0061-03` | `VPROC-0061` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0061-04` | `VPROC-0061` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0061-05` | `VPROC-0061` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0061-06` | `VPROC-0061` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0062-01` | `VPROC-0062` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0062-02` | `VPROC-0062` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0062-03` | `VPROC-0062` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0062-04` | `VPROC-0062` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0062-05` | `VPROC-0062` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0062-06` | `VPROC-0062` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0062-07` | `VPROC-0062` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0063-01` | `VPROC-0063` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0063-02` | `VPROC-0063` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0063-03` | `VPROC-0063` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0063-04` | `VPROC-0063` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0063-05` | `VPROC-0063` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0064-01` | `VPROC-0064` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0064-02` | `VPROC-0064` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0064-03` | `VPROC-0064` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0064-04` | `VPROC-0064` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0064-05` | `VPROC-0064` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0064-06` | `VPROC-0064` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0065-01` | `VPROC-0065` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0065-02` | `VPROC-0065` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0065-03` | `VPROC-0065` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0065-04` | `VPROC-0065` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0065-05` | `VPROC-0065` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0065-06` | `VPROC-0065` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0065-07` | `VPROC-0065` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0066-01` | `VPROC-0066` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0066-02` | `VPROC-0066` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0066-03` | `VPROC-0066` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0066-04` | `VPROC-0066` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0066-05` | `VPROC-0066` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0066-06` | `VPROC-0066` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0066-07` | `VPROC-0066` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0067-01` | `VPROC-0067` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0067-02` | `VPROC-0067` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0067-03` | `VPROC-0067` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0067-04` | `VPROC-0067` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0067-05` | `VPROC-0067` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0067-06` | `VPROC-0067` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0068-01` | `VPROC-0068` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0068-02` | `VPROC-0068` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0068-03` | `VPROC-0068` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0068-04` | `VPROC-0068` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0068-05` | `VPROC-0068` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0068-06` | `VPROC-0068` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-01` | `VPROC-0069` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-02` | `VPROC-0069` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-03` | `VPROC-0069` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-04` | `VPROC-0069` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-05` | `VPROC-0069` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-06` | `VPROC-0069` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-07` | `VPROC-0069` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-08` | `VPROC-0069` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-09` | `VPROC-0069` | `INCLUIDA` | `PREAUTORIZADA` | `REFERENCIAL_NO_APROPIATIVO` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `ESPECIFICADO` |

---

#### 26. Reconciliación cuantitativa

| Control                                 | Resultado |
| --------------------------------------- | --------: |
| `DOCCTX-*` esperadas                    |   **332** |
| `DOCCTX-*` materializadas               |   **332** |
| identificadores únicos                  |   **332** |
| faltantes                               |     **0** |
| duplicados                              |     **0** |
| decisiones `INCLUIDA`                   |   **332** |
| decisiones `PREAUTORIZADA`              |   **332** |
| expediente `REFERENCIAL_NO_APROPIATIVO` |   **332** |
| versionado `NON_DESTRUCTIVE` preservado |   **332** |
| vigencia `EFFECTIVE_TIME` preservada    |   **332** |
| propietarias funcionales modificadas    |     **0** |

---

#### 27. Criterios de aceptación

- [x] la biblioteca se define como proyección autorizada sobre fuentes propietarias y no como repositorio maestro paralelo;
- [x] los 69 procesos se conservan sin renombrar, fusionar o eliminar;
- [x] las 332 identidades `DOCCTX-*` aparecen exactamente una vez en la matriz de experiencia;
- [x] cada identidad recibe decisión explícita de biblioteca, búsqueda, expediente, versionado y vigencia;
- [x] búsqueda, sugerencias, filtros, facetas, conteos y fragmentos quedan sometidos a autorización previa;
- [x] no se revela existencia de recursos fuera del alcance mediante cero, conteos, huecos, etiquetas o relaciones;
- [x] expediente se modela como relación no apropiativa y no como carpeta que absorbe autoridad;
- [x] identidad lógica, versión, representación y localización permanecen separadas;
- [x] `CURRENT` no se confunde con “última versión creada”;
- [x] aprobación, publicación y vigencia permanecen dimensiones distintas;
- [x] una versión histórica conserva señal persistente que evita uso accidental como vigente;
- [x] las acciones de salida conservan autorización independiente de la consulta;
- [x] la experiencia define estados inicial, cargando, vacío, denegado, parcial, desactualizado y error;
- [x] se preservan accesibilidad, foco y lenguaje humano para estados documentales;
- [x] no se crean rutas, código, índices, Storage, migraciones ni cambios de Supabase;
- [x] INFO-UX-003 permanece reservada y no se inicia.

---

#### 28. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

La tarea materializa en experiencia reglas ya protegidas por el registro vigente: autorización previa de resultados y metadatos, minimización y no revelación de información fuera de alcance, separación entre fuente y proyección, versionado no destructivo, vigencia por tiempo efectivo y autorización independiente para acciones de salida. No introduce una transición, permiso, estado ejecutable o comportamiento técnico adicional que requiera un requisito nuevo.

Balance: **0 creados · 0 modificados · 0 diferidos · 0 descartados · 0 obsoletos**.

---

#### 29. Estado de materialización

| Resultado                                 | Estado                                                                                |
| ----------------------------------------- | ------------------------------------------------------------------------------------- |
| arquitectura de experiencia de biblioteca | `ESPECIFICADO`                                                                        |
| búsqueda autorizada                       | `ESPECIFICADO`                                                                        |
| navegación por expediente                 | `ESPECIFICADO`                                                                        |
| lectura de versión y vigencia             | `ESPECIFICADO`                                                                        |
| matriz 332/332                            | `ESPECIFICADO`                                                                        |
| implementación física                     | `FUERA_DE_ALCANCE`                                                                    |
| evidencia operativa                       | `PENDIENTE_DE_EVIDENCIA` hasta la fase de implementación y validación correspondiente |

---

ÚLTIMA TAREA APROBADA

`INFO-UX-001 — Diseñar tablero simple de gobierno, obligaciones, alertas, solicitudes y brechas`

TAREA ACTUAL APROBADA

`INFO-UX-002 — Diseñar biblioteca documental con búsqueda autorizada, expediente, versión y vigencia`

SIGUIENTE TAREA RESERVADA

`INFO-UX-003 — Diseñar creación, revisión, aprobación, publicación y firma de documentos`


### ✅ INFO-UX-003 — Diseñar creación, revisión, aprobación, publicación y firma de documentos

**Estado:** APROBADA
**Tarea anterior:** `INFO-UX-002 — Diseñar biblioteca documental con búsqueda autorizada, expediente, versión y vigencia` — APROBADA
**Tarea siguiente:** `INFO-UX-004 — Diseñar portal y caso de solicitudes de privacidad para trabajadores y clientes` — RESERVADA
**Tipo de tarea:** documental; diseño normativo y materializado de la experiencia transversal de creación, revisión, aprobación, publicación y firma de documentos sobre versiones o snapshots exactos, con segregación, vigencia y evidencia gobernadas por los contratos canónicos
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/AA_GOBIERNO_DE_INFORMACION/03_EXPERIENCIA_DOCUMENTAL_Y_PRIVACIDAD.md`
**Fase:** exclusivamente documental
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, componentes, tablas, índices, buckets, Storage, RLS, RPC, funciones, triggers, Edge Functions, migraciones, datos, permisos, firmas reales, proveedores, certificados ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Materializar la experiencia documental mediante la cual un actor autorizado puede preparar una versión, someterla a revisión, registrar una decisión de aprobación, publicar una versión cuando corresponda y ejecutar un acto de firma únicamente cuando una fuente canónica determine que ese acto aplica.

La experiencia debe preservar una regla central: **editar, revisar, aprobar, publicar y firmar son actos distintos sobre objetos exactos, con autoridad, estado y evidencia propios**. Una acción anterior no concede la siguiente, una pantalla no fabrica autoridad y una modificación material posterior no conserva silenciosamente decisiones emitidas sobre otra versión.

La tarea consume la biblioteca documental definida por `INFO-UX-002`, el ciclo `INFO_DOCUMENT_LIFECYCLE_V1`, la política de aprobación y firma de `INFO-DOM-011`, la segregación de `INFO-AUTH-003` y la autorización de información vigente. No redefine esos contratos ni crea una fuente de verdad documental paralela.

---

#### 2. Resultado sustantivo

La tarea materializa cinco contratos coordinados:

1. `INFO-DOCUMENT-AUTHORING-UX-CONTRACT-001`: experiencia de creación, edición, borrador, guardado y envío a revisión.
2. `INFO-DOCUMENT-REVIEW-UX-CONTRACT-001`: experiencia de revisión sobre versión o snapshot exacto, diferencias, observaciones, devolución y cierre de revisión.
3. `INFO-DOCUMENT-APPROVAL-PUBLICATION-UX-CONTRACT-001`: experiencia separada de aprobación y publicación, incluida vigencia, audiencia y retiro de publicación.
4. `INFO-DOCUMENT-SIGNATURE-UX-CONTRACT-001`: experiencia de firma únicamente cuando el acto canónico aplique, con objeto, intención y evidencia exactos.
5. `INFO-DOCUMENT-AUTHORING-DOCCTX-MATRIX-001`: decisión explícita para las 332 identidades documentales heredadas.

Balance materializado:

| Control                                                  |      Resultado |
| -------------------------------------------------------- | -------------: |
| Procesos `VPROC-*` heredados                             |         **69** |
| Identidades `DOCCTX-*` esperadas                         |        **332** |
| Identidades `DOCCTX-*` materializadas                    |        **332** |
| Identidades faltantes                                    |          **0** |
| Identidades duplicadas                                   |          **0** |
| Aplicaciones propietarias funcionales preservadas        |          **9** |
| Versionado no destructivo preservado                     | **332 de 332** |
| Vigencia por tiempo efectivo preservada                  | **332 de 332** |
| Identidades a las que se les impone firma por inferencia |          **0** |
| Reclasificaciones                                        |          **0** |
| Cambios de propietaria funcional                         |          **0** |
| Cambios físicos                                          |          **0** |
| Requisitos de prueba nuevos o modificados                |          **0** |

---

#### 3. Decisiones heredadas que no se redefinen

Se preservan:

- las 69 identidades `VPROC-*` y las 332 identidades `DOCCTX-*`;
- las nueve aplicaciones propietarias funcionales;
- la taxonomía documental aprobada;
- la clasificación `S0_PUBLIC` a `S4_HIGHLY_RESTRICTED`;
- `INFO_DOCUMENT_LIFECYCLE_V1`;
- el versionado `NON_DESTRUCTIVE`;
- la vigencia `EFFECTIVE_TIME`;
- los estados de preparación `RECEIVED`, `RECORDED`, `DRAFT`, `IN_REVIEW`, `REJECTED`, `APPROVED`;
- los estados de vigencia `NOT_EFFECTIVE`, `CURRENT`, `SUPERSEDED`, `EXPIRED`, `WITHDRAWN`, `ANNULLED`;
- los estados de publicación `NOT_PUBLISHED`, `PUBLISHED`, `UNPUBLISHED`;
- la separación canónica entre aprobación, aceptación, firma electrónica, firma digital y demás niveles de evidencia definidos por `INFO-DOM-011`;
- la decisión `NO_INFERIR_ACTO_POR_DOCUMENTO` para las 332 identidades;
- el objeto canónico del acto `VERSION_O_SNAPSHOT_EXACTO`;
- la regla `SOLO_SI_ACTO_CANONICO_APLICA`;
- la segregación entre crear, revisar, aprobar, firmar y demás actos sensibles definida por `INFO-AUTH-003`;
- la autorización fail closed por actor, permiso, finalidad, recurso, relación, territorio, estado, clasificación, política de campos y denegaciones;
- la propiedad funcional de la aplicación originadora sobre el hecho empresarial.

Esta tarea convierte esas decisiones en una experiencia coherente y verificable, sin alterar su autoridad normativa.

---

#### 4. Invariantes de experiencia documental

```text
BORRADOR ≠ VERSIÓN APROBADA
EDITAR ≠ ENVIAR A REVISIÓN
REVISAR ≠ APROBAR
APROBAR ≠ PUBLICAR
APROBAR ≠ FIRMAR
PUBLICAR ≠ HACER VIGENTE
FIRMAR ≠ PUBLICAR
ACEPTAR ≠ APROBAR
ACEPTAR ≠ FIRMAR
IMAGEN DE FIRMA ≠ FIRMA CANÓNICA
NOMBRE ESCRITO ≠ FIRMA CANÓNICA
VERSIÓN MÁS RECIENTE ≠ VERSIÓN CURRENT
VISO PRESENTANDO UNA COLA ≠ VISO PROPIETARIO DEL DOCUMENTO
AUTOGUARDADO ≠ ENVÍO
AUTOGUARDADO ≠ APROBACIÓN
AUTOGUARDADO ≠ PUBLICACIÓN
AUTOGUARDADO ≠ FIRMA
```

Ninguna simplificación visual puede eliminar estas fronteras.

---

#### 5. Modelo general de interacción

La experiencia se compone mediante actos independientes:

```text
CREAR O EDITAR BORRADOR
→ guardar cambios sobre el borrador autorizado
→ preparar snapshot exacto
→ enviar a revisión cuando corresponda

REVISAR
→ abrir snapshot exacto
→ comparar con base o versión vigente
→ registrar observaciones
→ devolver, rechazar o completar revisión según política

APROBAR
→ revalidar actor, objeto, versión, estado y segregación
→ mostrar resumen exacto
→ registrar decisión sobre esa versión o snapshot

PUBLICAR
→ revalidar autoridad y condiciones de publicación
→ seleccionar la versión aprobada que corresponda
→ resolver audiencia, vigencia y proyección
→ publicar sin alterar la historia documental

FIRMAR
→ solo si el acto canónico aplica
→ identificar intención y firmante
→ fijar versión o snapshot exacto
→ producir la evidencia exigida por el nivel aplicable
```

La política de cada documento puede omitir actos que no apliquen o imponer otros controles heredados. La interfaz no convierte este esquema en una secuencia universal obligatoria.

---

#### 6. Contrato `INFO-DOCUMENT-AUTHORING-UX-CONTRACT-001`

La creación documental se realiza sobre un **borrador versionado** vinculado a identidad documental, proceso, recurso y propietaria funcional.

La superficie de autoría deberá mostrar, cuando apliquen:

| Elemento                        | Decisión de experiencia                                        |
| ------------------------------- | -------------------------------------------------------------- |
| identidad documental            | visible en forma humana y resoluble técnicamente               |
| documento o recurso propietario | visible sin convertir la superficie en propietaria             |
| versión base                    | explícita cuando el borrador parte de una versión existente    |
| estado                          | `DRAFT` mientras no exista un acto posterior válido            |
| actor                           | autor o preparador efectivo, separado del aprobador o firmante |
| guardado                        | estado real, con confirmación de persistencia cuando exista    |
| campos modificados              | identificables frente a la base cuando exista                  |
| clasificación                   | presentada según proyección autorizada                         |
| vigencia pretendida             | dato preparatorio; no convierte el borrador en `CURRENT`       |
| dependencias                    | visibles antes de un compromiso material                       |
| evidencia requerida             | visible cuando una política canónica la exija                  |

---

#### 7. Guardado y autoguardado

1. guardar conserva trabajo de borrador; no cambia por sí solo el estado a revisión, aprobación, publicación o firma;
2. el autoguardado solo puede afirmar persistencia cuando la fuente autoritativa la haya confirmado;
3. un guardado local, pendiente o sin confirmación se muestra con estado distinto;
4. salir de la superficie no se interpreta como envío;
5. una interrupción conserva el borrador cuando la política lo permita y la reanudación revalida actor, contexto, recurso y versión;
6. un borrador no puede transferirse implícitamente a otro actor en un dispositivo compartido;
7. la interfaz no marca una casilla de aprobación, aceptación o firma como valor predeterminado.

---

#### 8. Edición sobre documento existente

Cuando se crea una nueva versión a partir de una versión vigente o histórica:

- se identifica la versión base;
- se conserva la versión anterior sin edición destructiva;
- la nueva edición ocurre en un borrador diferente;
- se muestran diferencias materiales antes de solicitar revisión o aprobación;
- si la fuente cambió concurrentemente, se impide sobrescritura silenciosa;
- la interfaz permite comparar, actualizar la base, reaplicar cambios compatibles o conservar el borrador para resolución;
- una aplicación consumidora no edita una copia local como sustituto de la propietaria funcional.

Una corrección histórica conserva el snapshot utilizado por el hecho histórico y no reescribe retroactivamente el significado de una decisión pasada.

---

#### 9. Envío a revisión

`ENVIAR_A_REVISION` es una acción distinta de guardar.

Antes del envío se resuelven:

- actor efectivo;
- permiso exacto;
- recurso y documento;
- versión o snapshot que será revisado;
- estado compatible;
- clasificación y política de campos;
- dependencias obligatorias;
- integridad mínima requerida;
- conflictos concurrentes;
- segregación aplicable;
- evidencia o adjuntos obligatorios.

El resultado debe identificar inequívocamente el snapshot sometido. Los cambios posteriores pertenecen a otro borrador o versión y no alteran el objeto ya sometido.

---

#### 10. Contrato `INFO-DOCUMENT-REVIEW-UX-CONTRACT-001`

La revisión se realiza sobre un objeto inmutable o estabilizado para la decisión:

```text
review_subject_ref
document_ref
version_ref o snapshot_ref
base_version_ref cuando aplique
reviewer_ref
review_purpose
review_started_at
review_status
findings
material_differences
review_outcome
review_completed_at
```

La experiencia puede mostrar una representación legible, pero toda observación y decisión debe seguir vinculada al objeto exacto revisado.

---

#### 11. Espacio de revisión

La superficie de revisión presenta prioritariamente:

1. propósito de la revisión;
2. documento y versión exactos;
3. versión base o vigente usada para comparación, cuando aplique;
4. cambios materiales;
5. estado, clasificación y vigencia;
6. evidencias o dependencias necesarias;
7. observaciones existentes autorizadas;
8. acciones permitidas para el revisor;
9. consecuencias de devolver, rechazar o completar la revisión.

La edición directa del contenido durante una revisión no sustituye una nueva versión. Si el revisor tiene además capacidad de edición, debe entrar explícitamente al acto de edición y la decisión de revisión anterior permanece vinculada al snapshot original.

---

#### 12. Observaciones y hallazgos de revisión

Las observaciones deben poder distinguir:

- comentario informativo;
- corrección requerida;
- inconsistencia material;
- evidencia faltante;
- conflicto de versión;
- condición de publicación;
- condición de firma;
- bloqueo de autoridad;
- rechazo;
- devolución para nueva versión.

Una observación no cambia por sí sola el contenido. Resolverla exige un acto autorizado del propietario o preparador y, cuando el cambio sea material, produce una nueva revisión sobre el nuevo objeto.

---

#### 13. Devolución, rechazo y nueva versión

`DEVOLVER`, `RECHAZAR` y `CREAR_NUEVA_VERSION` no son equivalentes.

- **devolver** conserva el objeto revisado y habilita trabajo correctivo cuando la política lo permita;
- **rechazar** registra una decisión sobre el objeto exacto sin destruirlo;
- **crear nueva versión** conserva el historial y genera un nuevo objeto editable;
- una versión rechazada no se transforma en aprobada por editarla;
- las observaciones resueltas conservan vínculo con la versión que las originó y con la nueva versión que las atiende;
- si un cambio material ocurre después de una revisión completada, la revisión anterior no se transporta automáticamente.

---

#### 14. Control de cambios entre revisión y decisión

Antes de aprobar, publicar o firmar se compara la versión objetivo con la versión o snapshot que fue objeto de la revisión relevante.

Si existe cambio material:

```text
CAMBIO MATERIAL DETECTADO
→ detener acto final
→ mostrar diferencia
→ invalidar la reutilización de la revisión incompatible
→ solicitar nueva revisión o decisión según política
```

Un cambio meramente técnico o de representación solo puede conservar decisiones anteriores cuando el contrato canónico permita demostrar equivalencia sin modificar contenido, significado ni evidencia. La interfaz no decide esa equivalencia por apariencia.

---

#### 15. Contrato `INFO-DOCUMENT-APPROVAL-PUBLICATION-UX-CONTRACT-001`

Aprobación y publicación son actos independientes.

Una decisión de aprobación debe referenciar, según aplicabilidad:

```text
approval_subject_ref
document_ref
version_ref o snapshot_ref
approver_ref
approval_authority_ref
decision
reason_or_condition
decided_at
evidence_ref
segregation_result
```

Una publicación debe referenciar, según aplicabilidad:

```text
publication_subject_ref
document_ref
version_ref
publication_actor_ref
audience_or_scope
channel_or_surface
publication_state
published_at
effective_from
effective_until
withdrawal_state
evidence_ref
```

La experiencia puede presentarlos de forma continua, pero no los fusiona en una única acción.

---

#### 16. Aprobación

Antes de aprobar se muestra un resumen que permita decidir sobre el objeto exacto:

| Dimensión    | Información mínima                                  |
| ------------ | --------------------------------------------------- |
| intención    | qué decisión se está adoptando                      |
| objeto       | documento y versión o snapshot                      |
| base         | versión anterior o vigente cuando aplique           |
| diferencias  | cambios materiales desde la base                    |
| alcance      | proceso, recurso, población o entidad pertinente    |
| vigencia     | fecha efectiva pretendida y estado actual           |
| dependencias | controles o evidencias que deben existir            |
| segregación  | incompatibilidades de actor que impidan la decisión |
| evidencia    | nivel exigido por el acto                           |
| consecuencia | qué habilita y qué no habilita la aprobación        |

La acción visible debe denominar la decisión con precisión. `Guardar`, `Confirmar` o `Continuar` no sustituyen `Aprobar` cuando el efecto real sea una aprobación.

---

#### 17. Segregación en aprobación

La superficie consume `INFO-INFORMATION-SEGREGATION-CONTRACT-001`.

Reglas:

1. crear no concede revisión;
2. revisar no concede aprobación;
3. aprobar no concede firma;
4. aprobar no concede publicación;
5. cambiar de vista, aplicación o modo no cambia la identidad efectiva del actor;
6. una simulación no satisface independencia;
7. cuando la política exige actores independientes, el actor incompatible no recibe el control ejecutable;
8. si la independencia es desconocida o contradictoria, la acción queda bloqueada;
9. una service role, job o cuenta técnica no se presenta como aprobador empresarial;
10. un mismo actor solo puede realizar varios actos cuando la política canónica lo permita expresamente.

---

#### 18. Publicación

Publicar significa exponer una versión mediante la audiencia y superficie autorizadas; no significa volver público todo el documento ni degradar su clasificación.

La experiencia deberá:

- identificar la versión exacta que será publicada;
- impedir publicación de un borrador por inferencia;
- mostrar audiencia o alcance;
- mostrar fecha efectiva cuando corresponda;
- mostrar si la publicación es inmediata, futura o expirada;
- distinguir `NOT_PUBLISHED`, `PUBLISHED` y `UNPUBLISHED`;
- revalidar autorización antes del efecto;
- preservar la versión publicada aunque después exista una nueva versión;
- evitar que una nueva versión se publique automáticamente por haber sido creada o aprobada;
- permitir comprender qué versión está visible actualmente para cada audiencia autorizada.

---

#### 19. Publicación y vigencia

Publicación, aprobación y vigencia se presentan juntas cuando sea útil, pero permanecen dimensiones independientes.

Ejemplos de combinaciones válidas que la interfaz debe distinguir:

| Aprobación | Publicación  | Vigencia               | Lectura                                                                     |
| ---------- | ------------ | ---------------------- | --------------------------------------------------------------------------- |
| aprobada   | no publicada | `NOT_EFFECTIVE`        | lista para un acto posterior, todavía no aplicable                          |
| aprobada   | publicada    | `NOT_EFFECTIVE`        | visible según audiencia, futura para efecto                                 |
| aprobada   | publicada    | `CURRENT`              | versión vigente y publicada en el alcance correspondiente                   |
| aprobada   | no publicada | `CURRENT`              | vigente para uso interno sin publicación externa, si la política lo permite |
| aprobada   | despublicada | `CURRENT`              | vigente pero ya no expuesta por esa publicación                             |
| aprobada   | publicada    | `SUPERSEDED`           | versión histórica que conserva evidencia de publicación previa              |
| rechazada  | no publicada | no aplicable al efecto | decisión conservada sin convertirse en versión aprobada                     |

La interfaz no inventa una combinación imposible si la política del documento la prohíbe.

---

#### 20. Retiro de publicación, sustitución y anulación

- retirar publicación cambia el estado de exposición; no elimina el documento;
- sustituir una versión crea o activa una relación de sucesión; no sobreescribe la anterior;
- anular conserva la identidad, el historial y la razón del acto;
- una versión `SUPERSEDED`, `WITHDRAWN` o `ANNULLED` debe conservar señal persistente;
- una versión histórica no puede volver a presentarse como vigente por abrir un enlace antiguo;
- si una publicación externa ya produjo copias o entregas, la interfaz no afirma revocación física universal cuando no existe evidencia de ella.

La disposición y eliminación física permanecen fuera del alcance de esta tarea.

---

#### 21. Contrato `INFO-DOCUMENT-SIGNATURE-UX-CONTRACT-001`

La firma se ofrece **solo cuando `INFO-DOM-011` determine que un acto de firma aplica**. La existencia de un documento, su clase, su aprobación o una plantilla con espacio visual de firma no bastan para exigirla.

La experiencia de firma debe resolver, según el nivel aplicable:

```text
signature_subject_ref
document_ref
version_ref o snapshot_ref
signature_intent
signer_ref
signer_authority_ref
evidence_level
evidence_method
signed_at
verification_state
evidence_ref
```

Si uno de los componentes obligatorios no es resoluble, el efecto dependiente queda bloqueado.

---

#### 22. Distinción de actos y métodos de evidencia

La interfaz no utiliza términos intercambiables para actos distintos.

| Concepto                       | Decisión de experiencia                                                          |
| ------------------------------ | -------------------------------------------------------------------------------- |
| aprobación                     | decisión empresarial sobre versión o snapshot exacto                             |
| aceptación                     | manifestación de conformidad o recepción cuando la fuente canónica la exija      |
| firma electrónica              | acto y evidencia tratados conforme al nivel canónico aplicable                   |
| firma digital                  | categoría diferenciada cuando el contrato canónico la exija                      |
| imagen manuscrita digitalizada | representación que no se eleva automáticamente a firma canónica                  |
| nombre escrito                 | dato de presentación que no prueba por sí solo un acto de firma                  |
| checkbox                       | control de interfaz; solo constituye evidencia si un contrato canónico lo define |
| autenticación                  | identificación o verificación de acceso; no sustituye el acto firmado            |
| aprobación previa              | no concede autoridad para firmar                                                 |

El texto visible debe describir qué está haciendo la persona y sobre qué versión.

---

#### 23. Preparación para firma

Antes del acto final se muestra:

- título o identidad humana del documento;
- versión o snapshot exacto;
- estado y vigencia relevantes;
- intención del acto;
- rol o calidad en que actúa el firmante, cuando aplique;
- evidencia o autenticación reforzada requerida;
- consecuencias del acto;
- cualquier diferencia material desde una revisión o aprobación previa;
- condición que impida firmar;
- confirmación de que el contenido presentado corresponde al objeto que recibirá la evidencia.

El usuario no firma una vista mutable cuya versión pueda cambiar silenciosamente durante el acto.

---

#### 24. Ejecución y resultado de firma

La experiencia distingue:

```text
PREPARANDO
→ LISTO_PARA_FIRMAR
→ AUTENTICANDO_O_VERIFICANDO
→ FIRMA_EN_PROCESO
→ FIRMADA_CONFIRMADA
```

y, cuando corresponda:

```text
BLOQUEADA
RECHAZADA
CANCELADA
RESULTADO_DESCONOCIDO
VERIFICACION_PENDIENTE
EVIDENCIA_INSUFICIENTE
```

Un indicador visual de éxito solo aparece cuando la fuente autoritativa confirma el resultado. Ante timeout o resultado desconocido, se consulta el estado o receipt aplicable antes de ofrecer una repetición del acto.

---

#### 25. Efecto de cambios posteriores a la firma

Una firma queda vinculada al objeto exacto firmado.

1. editar contenido material después de firmar crea una nueva versión;
2. la firma anterior permanece vinculada a la versión anterior;
3. la firma anterior no se copia como firma de la nueva versión;
4. si la nueva versión requiere firma, se ejecuta un acto nuevo conforme a la política;
5. una modificación de representación solo conserva equivalencia si existe evidencia canónica suficiente;
6. la interfaz muestra cuándo la versión visible no es la versión firmada;
7. la existencia de una firma no vuelve el documento `CURRENT`, `PUBLISHED` o `APPROVED` salvo que el contrato canónico establezca esos efectos de forma separada.

---

#### 26. Autoridad y revalidación por acto

Antes de cada acción material se revalida:

- principal y actor efectivo;
- permiso exacto;
- recurso, documento, versión o snapshot;
- relación exigida;
- clasificación;
- finalidad;
- territorio;
- estado y vigencia;
- política de campos;
- segregación;
- denegaciones;
- evidencia obligatoria;
- frescura de la decisión.

Una decisión válida al abrir la pantalla no queda congelada. Si cambia actor, permiso, relación, territorio, documento, versión, estado, sesión, dispositivo o política material, la acción final se vuelve a evaluar.

---

#### 27. Conectividad, borradores y acciones finales

La tarea adopta la frontera de seguridad ya protegida por los requisitos vigentes:

- preparación y borradores pueden conservarse cuando el contrato de la superficie lo permita;
- aprobación, publicación y actos sensibles son `ONLINE_REQUIRED` por defecto salvo contrato posterior específico;
- la firma que exija verificación o evidencia remota no se presenta como completada sin confirmación;
- después de cambio de sesión, dispositivo o contexto, una acción final no se reanuda directamente;
- puede restaurarse trabajo preparatorio, pero la decisión final revalida actor, objeto, versión, datos actuales, segregación y evidencia;
- un estado offline nunca prolonga autoridad ni convierte una copia local en objeto vigente.

---

#### 28. Dispositivos compartidos

En tablets, kioscos o estaciones compartidas:

1. el actor humano permanece separado del dispositivo técnico;
2. cambiar actor limpia identidad, firma, selección sensible, borradores no transferibles y referencias privadas incompatibles;
3. una firma o aprobación sensible exige la sesión o step-up previsto por la política;
4. el actor anterior no queda disponible como valor reutilizable;
5. el dispositivo no se convierte en aprobador ni firmante;
6. una superficie de operación ordinaria no abre administración documental general por tener capacidad técnica para hacerlo;
7. cualquier borrador conservado mantiene propietario y contexto originales y no se reasigna implícitamente.

---

#### 29. Acciones masivas

La aprobación, publicación o firma masiva solo puede existir si un contrato canónico específico la admite.

Cuando aplique:

- se congela la población exacta;
- se muestra cantidad, inclusiones, exclusiones e incompatibles;
- cada elemento conserva documento, versión, estado y política propios;
- la autoridad se evalúa por elemento cuando corresponda;
- la segregación se conserva;
- no se aplica una decisión a elementos heterogéneos sin demostrar compatibilidad;
- el resultado se informa por elemento;
- los éxitos no se repiten al reintentar fallos;
- un elemento cambiado desde la previsualización queda fuera del acto hasta nueva validación;
- una firma masiva nunca oculta la identidad del objeto exacto firmado.

La existencia técnica de selección múltiple no concede permiso masivo.

---

#### 30. Experiencia por aplicación y propiedad funcional

La experiencia respeta las fronteras aprobadas:

- la **aplicación propietaria** conserva la autoridad sobre creación, versión y hechos empresariales de su documento;
- **VISO** puede presentar colas de gobierno, revisión, cumplimiento o decisiones transversales sin convertirse en editor universal de documentos ajenos;
- **ANIMA** presenta documentos y actuaciones propias del trabajador cuando correspondan, sin adquirir autoridad administrativa general;
- **PASS** presenta documentos y actuaciones propias del cliente cuando correspondan, sin adquirir autoridad sobre backoffice interno;
- **SHELL** participa en identidad, contexto y autorización; no se convierte en repositorio documental;
- **Supabase/Storage** conserva persistencia técnica; no decide aprobación, publicación o firma;
- una aplicación consumidora debe solicitar la mutación al propietario y conservar correlación con el resultado.

---

#### 31. Integración con la biblioteca de INFO-UX-002

`INFO-UX-002` continúa siendo la experiencia de localización, expediente, versión y vigencia. `INFO-UX-003` añade el trabajo sobre una identidad autorizada sin crear una segunda biblioteca.

Desde una entrada autorizada se puede presentar, según permiso y estado:

```text
VER DETALLE
VER HISTORIAL
CREAR NUEVA VERSION
CONTINUAR BORRADOR
ENVIAR A REVISION
REVISAR
APROBAR
PUBLICAR
RETIRAR PUBLICACION
FIRMAR
```

La disponibilidad visual de cada acción se calcula por acto. Ver un documento no concede ninguna de las acciones posteriores.

---

#### 32. Estados humanos de la experiencia

La interfaz traduce estados canónicos sin cambiar su semántica.

| Estado técnico o contractual | Presentación humana mínima               |
| ---------------------------- | ---------------------------------------- |
| `DRAFT`                      | borrador en preparación                  |
| `IN_REVIEW`                  | en revisión                              |
| `REJECTED`                   | rechazado para esta versión              |
| `APPROVED`                   | aprobado para esta versión               |
| `NOT_PUBLISHED`              | no publicado                             |
| `PUBLISHED`                  | publicado en el alcance indicado         |
| `UNPUBLISHED`                | publicación retirada                     |
| `NOT_EFFECTIVE`              | todavía no vigente                       |
| `CURRENT`                    | vigente en la fecha y alcance aplicables |
| `SUPERSEDED`                 | sustituido por otra versión              |
| `EXPIRED`                    | vigencia finalizada                      |
| `WITHDRAWN`                  | retirado                                 |
| `ANNULLED`                   | anulado                                  |

Cuando exista firma, su estado se presenta por separado. No se comprime todo en un único badge como “completo”.

---

#### 33. Señales persistentes de versión y riesgo

Durante revisión, aprobación, publicación y firma deben permanecer perceptibles:

- versión exacta;
- estado actual;
- si existe una versión más nueva;
- fecha de corte o última verificación;
- diferencias materiales no resueltas;
- vigencia;
- actor efectivo cuando sea material;
- modo de simulación o delegación cuando aplique;
- consecuencia del acto;
- condición de bloqueo.

Una ventana de confirmación no debe ocultar el documento o la versión sobre la que se decide.

---

#### 34. Prevención de decisiones sobre versión obsoleta

Si la versión cambia mientras el actor revisa o decide:

```text
VERSION_CAMBIADA
→ bloquear compromiso
→ conservar trabajo seguro
→ mostrar version revisada y version vigente
→ mostrar diferencias
→ exigir actualizar o reiniciar el acto correspondiente
```

La interfaz no aplica last write wins, no reaprovecha una aprobación anterior y no oculta el conflicto mediante recarga silenciosa.

---

#### 35. Confirmaciones proporcionales

No toda edición requiere un diálogo extra. Las confirmaciones se ajustan al riesgo.

Se exige una revisión reforzada cuando el acto:

- aprueba;
- publica a una audiencia material;
- firma;
- retira una publicación con efecto relevante;
- anula;
- afecta una población;
- cambia vigencia;
- actúa sobre información sensible;
- tiene consecuencia difícil de compensar;
- requiere segregación;
- usa una excepción.

La confirmación muestra objeto, versión, efecto y actor. No se basa solo en un botón genérico.

---

#### 36. Bloqueos y mensajes

Un bloqueo debe indicar, con información segura:

- qué acto no puede completarse;
- qué versión u objeto permanece intacto;
- qué condición falta o cambió;
- qué trabajo se conservó;
- qué acción segura sigue disponible;
- qué clase de responsable debe intervenir cuando el actor no puede resolverlo.

Los mensajes no revelan permisos de terceros, evidencia restringida, reglas antifraude, secretos, tokens, detalles técnicos internos ni existencia de objetos fuera de alcance.

---

#### 37. Accesibilidad

La experiencia debe ser operable con teclado, puntero, tacto y tecnologías de asistencia según la superficie.

Requisitos de diseño:

- foco lógico entre documento, diferencias, observaciones y acciones;
- estados y bloqueos anunciables;
- etiquetas de acción que describan el efecto;
- diferencias no dependientes únicamente de color;
- relación programática entre observación y fragmento o sección;
- lectura clara de versión, estado y vigencia;
- confirmaciones accesibles sin pérdida de contexto;
- retorno de foco al punto de decisión;
- zoom y reflow sin ocultar consecuencias materiales;
- ninguna firma se limita a un gesto de precisión fina sin alternativa compatible.

---

#### 38. Evidencia visible y evidencia restringida

La interfaz distingue entre:

- evidencia necesaria para que el actor decida;
- referencia de evidencia suficiente para demostrar el acto;
- detalle técnico de verificación;
- material preservado restringido.

El actor no recibe automáticamente toda la evidencia por participar en un acto. La política de campos y la clasificación continúan aplicando a comentarios, historial, sellos de tiempo, certificados, identificadores y datos de otros actores.

---

#### 39. Auditoría de la experiencia

Esta tarea no diseña el explorador de auditoría. Sin embargo, cada acto material debe dejar referencias suficientes para que una tarea posterior pueda reconstruir:

- objeto y versión;
- actor;
- tipo de acto;
- estado anterior y posterior;
- decisión;
- tiempo;
- autoridad evaluada;
- evidencia;
- correlación;
- resultado.

La presentación detallada de investigaciones, logs y evidencia preservada corresponde a `INFO-UX-006`.

---

#### 40. Límites funcionales

| Materia                                     | Decisión en INFO-UX-003                          | Propietario canónico                         |
| ------------------------------------------- | ------------------------------------------------ | -------------------------------------------- |
| búsqueda, expediente, historial y vigencia  | se consume; no se redefine                       | `INFO-UX-002`                                |
| retención, hold, archivo y disposición      | solo señales necesarias para bloquear o informar | `INFO-UX-005`                                |
| privacidad de trabajadores y clientes       | no se diseña aquí                                | `INFO-UX-004`                                |
| exploración de auditoría e investigación    | no se diseña aquí                                | `INFO-UX-006`                                |
| clasificación y minimización                | se consume                                       | `INFO-DOM-002`                               |
| ciclo y vigencia                            | se consume                                       | `INFO-DOM-004`                               |
| aprobación y firma como actos/evidencia     | se consume                                       | `INFO-DOM-011`                               |
| segregación de funciones                    | se consume                                       | `INFO-AUTH-003`                              |
| Storage, OCR, firma externa o certificación | no se implementan                                | tareas de integración posteriores aplicables |
| código, esquema, índices o migraciones      | fuera de fase                                    | fase técnica posterior correspondiente       |

Ninguna frontera difiere el resultado principal: la experiencia de creación, revisión, aprobación, publicación y firma queda diseñada completamente.

---

#### 41. Códigos de decisión de la matriz

La matriz utiliza los siguientes valores:

| Código                                                  | Significado                                                                                                                              |
| ------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `BORRADOR_VERSIONADO`                                   | la identidad puede entrar al contrato de autoría mediante borrador no destructivo cuando exista una instancia y el actor esté autorizado |
| `SOLO_SI_ACTO_CANONICO`                                 | la revisión, aprobación, publicación o firma solo se presenta si una política canónica determina que ese acto aplica al caso             |
| `VERSION_O_SNAPSHOT_EXACTO`                             | toda decisión y evidencia se vincula al objeto exacto                                                                                    |
| `ESPECIFICADO`                                          | la regla documental de experiencia queda definida                                                                                        |
| `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` | la acción material no continúa cuando la versión, autoridad, segregación o evidencia obligatoria no son resolubles o están obsoletas     |

La matriz **no declara que las 332 identidades requieran revisión, aprobación, publicación o firma**. Declara explícitamente que ninguna de ellas puede inferir esos actos por existir como documento.

---

#### 42. Matriz `INFO-DOCUMENT-AUTHORING-DOCCTX-MATRIX-001` — 332 de 332

| ID contextual          | Proceso      | Creación              | Revisión                | Aprobación              | Publicación             | Firma                   | Objeto del acto             | Estado         | Bloqueo                                                 |
| ---------------------- | ------------ | --------------------- | ----------------------- | ----------------------- | ----------------------- | ----------------------- | --------------------------- | -------------- | ------------------------------------------------------- |
| `DOCCTX-VPROC-0001-01` | `VPROC-0001` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0001-02` | `VPROC-0001` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0002-01` | `VPROC-0002` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0002-02` | `VPROC-0002` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0003-01` | `VPROC-0003` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0004-01` | `VPROC-0004` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0005-01` | `VPROC-0005` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0005-02` | `VPROC-0005` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0005-03` | `VPROC-0005` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0005-04` | `VPROC-0005` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0005-05` | `VPROC-0005` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0006-01` | `VPROC-0006` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0006-02` | `VPROC-0006` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0006-03` | `VPROC-0006` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0006-04` | `VPROC-0006` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0007-01` | `VPROC-0007` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0007-02` | `VPROC-0007` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0007-03` | `VPROC-0007` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0008-01` | `VPROC-0008` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0009-01` | `VPROC-0009` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0010-01` | `VPROC-0010` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0010-02` | `VPROC-0010` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0010-03` | `VPROC-0010` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0010-04` | `VPROC-0010` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0011-01` | `VPROC-0011` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0011-02` | `VPROC-0011` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0011-03` | `VPROC-0011` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0011-04` | `VPROC-0011` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0012-01` | `VPROC-0012` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0012-02` | `VPROC-0012` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0012-03` | `VPROC-0012` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0012-04` | `VPROC-0012` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0012-05` | `VPROC-0012` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0013-01` | `VPROC-0013` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0013-02` | `VPROC-0013` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0013-03` | `VPROC-0013` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0014-01` | `VPROC-0014` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0014-02` | `VPROC-0014` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0014-03` | `VPROC-0014` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0014-04` | `VPROC-0014` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0015-01` | `VPROC-0015` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0015-02` | `VPROC-0015` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0015-03` | `VPROC-0015` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0015-04` | `VPROC-0015` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0016-01` | `VPROC-0016` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0016-02` | `VPROC-0016` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0016-03` | `VPROC-0016` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0016-04` | `VPROC-0016` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0017-01` | `VPROC-0017` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0018-01` | `VPROC-0018` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0018-02` | `VPROC-0018` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0018-03` | `VPROC-0018` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0018-04` | `VPROC-0018` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0019-01` | `VPROC-0019` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0019-02` | `VPROC-0019` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0019-03` | `VPROC-0019` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0020-01` | `VPROC-0020` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0020-02` | `VPROC-0020` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0020-03` | `VPROC-0020` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0020-04` | `VPROC-0020` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0020-05` | `VPROC-0020` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0021-01` | `VPROC-0021` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0021-02` | `VPROC-0021` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0021-03` | `VPROC-0021` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0022-01` | `VPROC-0022` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0022-02` | `VPROC-0022` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0022-03` | `VPROC-0022` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0023-01` | `VPROC-0023` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0023-02` | `VPROC-0023` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0024-01` | `VPROC-0024` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0024-02` | `VPROC-0024` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0024-03` | `VPROC-0024` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0025-01` | `VPROC-0025` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0025-02` | `VPROC-0025` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0026-01` | `VPROC-0026` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0026-02` | `VPROC-0026` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0026-03` | `VPROC-0026` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0026-04` | `VPROC-0026` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0026-05` | `VPROC-0026` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0027-01` | `VPROC-0027` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0027-02` | `VPROC-0027` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0028-01` | `VPROC-0028` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0028-02` | `VPROC-0028` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0028-03` | `VPROC-0028` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0028-04` | `VPROC-0028` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0028-05` | `VPROC-0028` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0028-06` | `VPROC-0028` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0028-07` | `VPROC-0028` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0029-01` | `VPROC-0029` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0029-02` | `VPROC-0029` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0029-03` | `VPROC-0029` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0029-04` | `VPROC-0029` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0029-05` | `VPROC-0029` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0029-06` | `VPROC-0029` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0030-01` | `VPROC-0030` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0030-02` | `VPROC-0030` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0030-03` | `VPROC-0030` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0030-04` | `VPROC-0030` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0030-05` | `VPROC-0030` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0030-06` | `VPROC-0030` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0031-01` | `VPROC-0031` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0031-02` | `VPROC-0031` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0031-03` | `VPROC-0031` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0031-04` | `VPROC-0031` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0031-05` | `VPROC-0031` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0031-06` | `VPROC-0031` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0031-07` | `VPROC-0031` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0032-01` | `VPROC-0032` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0032-02` | `VPROC-0032` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0032-03` | `VPROC-0032` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0032-04` | `VPROC-0032` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0032-05` | `VPROC-0032` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0033-01` | `VPROC-0033` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0033-02` | `VPROC-0033` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0033-03` | `VPROC-0033` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0033-04` | `VPROC-0033` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0033-05` | `VPROC-0033` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0034-01` | `VPROC-0034` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0034-02` | `VPROC-0034` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0034-03` | `VPROC-0034` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0034-04` | `VPROC-0034` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0034-05` | `VPROC-0034` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0034-06` | `VPROC-0034` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0034-07` | `VPROC-0034` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0034-08` | `VPROC-0034` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0035-01` | `VPROC-0035` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0035-02` | `VPROC-0035` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0035-03` | `VPROC-0035` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0035-04` | `VPROC-0035` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0036-01` | `VPROC-0036` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0036-02` | `VPROC-0036` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0036-03` | `VPROC-0036` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0036-04` | `VPROC-0036` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0037-01` | `VPROC-0037` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0037-02` | `VPROC-0037` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0037-03` | `VPROC-0037` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0037-04` | `VPROC-0037` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0037-05` | `VPROC-0037` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0038-01` | `VPROC-0038` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0038-02` | `VPROC-0038` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0038-03` | `VPROC-0038` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0038-04` | `VPROC-0038` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0038-05` | `VPROC-0038` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0038-06` | `VPROC-0038` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0039-01` | `VPROC-0039` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0039-02` | `VPROC-0039` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0039-03` | `VPROC-0039` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0039-04` | `VPROC-0039` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0039-05` | `VPROC-0039` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0039-06` | `VPROC-0039` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0040-01` | `VPROC-0040` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0040-02` | `VPROC-0040` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0040-03` | `VPROC-0040` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0040-04` | `VPROC-0040` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0040-05` | `VPROC-0040` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0041-01` | `VPROC-0041` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0041-02` | `VPROC-0041` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0041-03` | `VPROC-0041` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0041-04` | `VPROC-0041` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0041-05` | `VPROC-0041` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0042-01` | `VPROC-0042` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0042-02` | `VPROC-0042` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0042-03` | `VPROC-0042` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0042-04` | `VPROC-0042` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0043-01` | `VPROC-0043` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0043-02` | `VPROC-0043` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0043-03` | `VPROC-0043` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0043-04` | `VPROC-0043` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0043-05` | `VPROC-0043` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0043-06` | `VPROC-0043` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0044-01` | `VPROC-0044` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0044-02` | `VPROC-0044` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0044-03` | `VPROC-0044` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0044-04` | `VPROC-0044` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0044-05` | `VPROC-0044` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0044-06` | `VPROC-0044` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0045-01` | `VPROC-0045` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0045-02` | `VPROC-0045` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0045-03` | `VPROC-0045` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0045-04` | `VPROC-0045` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0046-01` | `VPROC-0046` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0046-02` | `VPROC-0046` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0046-03` | `VPROC-0046` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0046-04` | `VPROC-0046` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0046-05` | `VPROC-0046` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0046-06` | `VPROC-0046` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0046-07` | `VPROC-0046` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0047-01` | `VPROC-0047` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0047-02` | `VPROC-0047` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0047-03` | `VPROC-0047` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0047-04` | `VPROC-0047` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0047-05` | `VPROC-0047` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0047-06` | `VPROC-0047` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0048-01` | `VPROC-0048` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0048-02` | `VPROC-0048` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0048-03` | `VPROC-0048` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0048-04` | `VPROC-0048` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0048-05` | `VPROC-0048` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0048-06` | `VPROC-0048` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0048-07` | `VPROC-0048` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0049-01` | `VPROC-0049` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0049-02` | `VPROC-0049` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0049-03` | `VPROC-0049` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0049-04` | `VPROC-0049` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0049-05` | `VPROC-0049` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0049-06` | `VPROC-0049` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0049-07` | `VPROC-0049` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0049-08` | `VPROC-0049` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0050-01` | `VPROC-0050` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0050-02` | `VPROC-0050` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0050-03` | `VPROC-0050` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0050-04` | `VPROC-0050` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0050-05` | `VPROC-0050` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0050-06` | `VPROC-0050` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0050-07` | `VPROC-0050` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0051-01` | `VPROC-0051` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0051-02` | `VPROC-0051` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0051-03` | `VPROC-0051` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0051-04` | `VPROC-0051` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0052-01` | `VPROC-0052` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0052-02` | `VPROC-0052` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0052-03` | `VPROC-0052` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0052-04` | `VPROC-0052` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0052-05` | `VPROC-0052` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0053-01` | `VPROC-0053` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0053-02` | `VPROC-0053` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0053-03` | `VPROC-0053` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0053-04` | `VPROC-0053` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0054-01` | `VPROC-0054` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0054-02` | `VPROC-0054` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0054-03` | `VPROC-0054` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0054-04` | `VPROC-0054` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0054-05` | `VPROC-0054` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0054-06` | `VPROC-0054` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0055-01` | `VPROC-0055` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0055-02` | `VPROC-0055` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0055-03` | `VPROC-0055` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0055-04` | `VPROC-0055` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0055-05` | `VPROC-0055` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0056-01` | `VPROC-0056` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0056-02` | `VPROC-0056` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0056-03` | `VPROC-0056` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0056-04` | `VPROC-0056` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0056-05` | `VPROC-0056` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0056-06` | `VPROC-0056` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0056-07` | `VPROC-0056` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0057-01` | `VPROC-0057` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0057-02` | `VPROC-0057` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0057-03` | `VPROC-0057` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0057-04` | `VPROC-0057` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0057-05` | `VPROC-0057` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0057-06` | `VPROC-0057` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0057-07` | `VPROC-0057` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0058-01` | `VPROC-0058` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0058-02` | `VPROC-0058` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0058-03` | `VPROC-0058` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0058-04` | `VPROC-0058` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0058-05` | `VPROC-0058` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0058-06` | `VPROC-0058` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0059-01` | `VPROC-0059` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0059-02` | `VPROC-0059` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0059-03` | `VPROC-0059` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0059-04` | `VPROC-0059` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0059-05` | `VPROC-0059` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0059-06` | `VPROC-0059` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0060-01` | `VPROC-0060` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0060-02` | `VPROC-0060` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0060-03` | `VPROC-0060` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0060-04` | `VPROC-0060` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0060-05` | `VPROC-0060` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0060-06` | `VPROC-0060` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0060-07` | `VPROC-0060` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0060-08` | `VPROC-0060` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0061-01` | `VPROC-0061` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0061-02` | `VPROC-0061` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0061-03` | `VPROC-0061` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0061-04` | `VPROC-0061` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0061-05` | `VPROC-0061` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0061-06` | `VPROC-0061` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0062-01` | `VPROC-0062` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0062-02` | `VPROC-0062` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0062-03` | `VPROC-0062` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0062-04` | `VPROC-0062` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0062-05` | `VPROC-0062` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0062-06` | `VPROC-0062` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0062-07` | `VPROC-0062` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0063-01` | `VPROC-0063` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0063-02` | `VPROC-0063` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0063-03` | `VPROC-0063` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0063-04` | `VPROC-0063` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0063-05` | `VPROC-0063` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0064-01` | `VPROC-0064` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0064-02` | `VPROC-0064` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0064-03` | `VPROC-0064` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0064-04` | `VPROC-0064` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0064-05` | `VPROC-0064` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0064-06` | `VPROC-0064` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0065-01` | `VPROC-0065` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0065-02` | `VPROC-0065` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0065-03` | `VPROC-0065` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0065-04` | `VPROC-0065` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0065-05` | `VPROC-0065` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0065-06` | `VPROC-0065` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0065-07` | `VPROC-0065` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0066-01` | `VPROC-0066` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0066-02` | `VPROC-0066` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0066-03` | `VPROC-0066` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0066-04` | `VPROC-0066` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0066-05` | `VPROC-0066` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0066-06` | `VPROC-0066` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0066-07` | `VPROC-0066` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0067-01` | `VPROC-0067` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0067-02` | `VPROC-0067` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0067-03` | `VPROC-0067` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0067-04` | `VPROC-0067` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0067-05` | `VPROC-0067` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0067-06` | `VPROC-0067` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0068-01` | `VPROC-0068` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0068-02` | `VPROC-0068` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0068-03` | `VPROC-0068` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0068-04` | `VPROC-0068` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0068-05` | `VPROC-0068` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0068-06` | `VPROC-0068` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0069-01` | `VPROC-0069` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0069-02` | `VPROC-0069` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0069-03` | `VPROC-0069` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0069-04` | `VPROC-0069` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0069-05` | `VPROC-0069` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0069-06` | `VPROC-0069` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0069-07` | `VPROC-0069` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0069-08` | `VPROC-0069` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |
| `DOCCTX-VPROC-0069-09` | `VPROC-0069` | `BORRADOR_VERSIONADO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `SOLO_SI_ACTO_CANONICO` | `VERSION_O_SNAPSHOT_EXACTO` | `ESPECIFICADO` | `BLOQUEAR_SI_VERSION_AUTORIDAD_O_EVIDENCIA_NO_RESUELTA` |

---

#### 43. Reconciliación cuantitativa

| Control                                  | Resultado |
| ---------------------------------------- | --------: |
| `DOCCTX-*` esperadas                     |   **332** |
| `DOCCTX-*` materializadas                |   **332** |
| identificadores únicos                   |   **332** |
| procesos representados                   |    **69** |
| faltantes                                |     **0** |
| duplicados                               |     **0** |
| decisiones `BORRADOR_VERSIONADO`         |   **332** |
| revisión `SOLO_SI_ACTO_CANONICO`         |   **332** |
| aprobación `SOLO_SI_ACTO_CANONICO`       |   **332** |
| publicación `SOLO_SI_ACTO_CANONICO`      |   **332** |
| firma `SOLO_SI_ACTO_CANONICO`            |   **332** |
| objeto `VERSION_O_SNAPSHOT_EXACTO`       |   **332** |
| políticas que infieren firma obligatoria |     **0** |
| propietarias funcionales modificadas     |     **0** |
| reclasificaciones                        |     **0** |

---

#### 44. Criterios de aceptación

- [x] `INFO-UX-002` se conserva como entrada aprobada y no se redefine;
- [x] los 69 procesos se conservan sin renombrar, fusionar o eliminar;
- [x] las 332 identidades `DOCCTX-*` aparecen exactamente una vez;
- [x] toda identidad recibe una decisión explícita para autoría y para la no inferencia de revisión, aprobación, publicación y firma;
- [x] el borrador queda separado de envío, revisión, aprobación, publicación y firma;
- [x] el autoguardado no produce efectos de decisión;
- [x] la revisión se vincula a una versión o snapshot exacto;
- [x] las observaciones no editan silenciosamente el objeto revisado;
- [x] un cambio material posterior obliga a recalcular la decisión aplicable;
- [x] aprobación y publicación permanecen actos separados;
- [x] publicación y vigencia permanecen dimensiones separadas;
- [x] `CURRENT` no se deriva de la fecha de creación ni de la aprobación;
- [x] la publicación de una nueva versión no ocurre automáticamente por crearla o aprobarla;
- [x] la firma solo aparece cuando el acto canónico aplica;
- [x] aprobación, aceptación, firma electrónica, firma digital y representaciones visuales de firma no se confunden;
- [x] la firma queda vinculada a la versión o snapshot exacto;
- [x] una edición material posterior no hereda la firma anterior;
- [x] la segregación se revalida por acto y no puede evitarse cambiando de superficie;
- [x] la autoridad se revalida antes de cada efecto material;
- [x] aprobación, publicación y firma sensibles no se presentan como completadas sin confirmación autoritativa;
- [x] los dispositivos compartidos no heredan actor, borrador, aprobación o firma;
- [x] acciones masivas solo existen cuando una política específica las admite y conservan resultado por elemento;
- [x] las fronteras de propiedad funcional entre aplicación propietaria, VISO, ANIMA, PASS, SHELL y persistencia técnica se preservan;
- [x] la experiencia es accesible y no depende únicamente de color, gesto o precisión fina;
- [x] no se crean código, componentes, tablas, Storage, migraciones ni cambios de Supabase;
- [x] `INFO-UX-004` permanece reservada y no se inicia.

---

#### 45. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

La tarea especializa en experiencia documental comportamientos que ya están protegidos por requisitos vigentes. En particular, el registro ya exige: separación entre confirmación, aprobación y atestación; reutilización documental por identidad y versión; corrección mediante nueva versión sin reescritura histórica; conservación de segregación y evidencia; confirmación proporcional a acciones sensibles; separación de modos de consulta, edición y aprobación; operación online para aprobaciones y publicaciones sensibles; reautorización al retomar actos sensibles; separación entre crear, editar, aprobar, publicar, ejecutar y auditar; persistencia real de borradores; detección de conflicto antes del compromiso; revisión final con versión, diferencias y evidencia; invalidación de la aprobación ante cambios materiales; acciones separadas para guardar, enviar, aprobar, rechazar y publicar; revalidación de autorización por acción; separación entre borrador, versión vigente, aprobación y publicación; previsualización sin efectos laterales; verbos, permisos, transiciones y receipts diferenciados; y segregación explícita de preparación, revisión, aprobación y ejecución.

La firma consume además la decisión canónica de `INFO-DOM-011` que prohíbe inferir el acto por la existencia del documento y exige objeto `VERSION_O_SNAPSHOT_EXACTO`, junto con la segregación de `INFO-AUTH-003`. INFO-UX-003 no introduce un nuevo permiso ejecutable, proveedor de firma, esquema, API, estado técnico, transición de base de datos ni capacidad que esté fuera de esas reglas; define su composición de experiencia.

Balance: **0 creados · 0 modificados · 0 diferidos · 0 descartados · 0 obsoletos**.

---

#### 46. Cobertura TREQ heredada relevante

La ausencia de nuevos requisitos se sustenta, entre otros, en la cobertura vigente de:

- `TREQ-UX-018`;
- `TREQ-UX-121`;
- `TREQ-UX-126`;
- `TREQ-UX-128`;
- `TREQ-UX-142`;
- `TREQ-UX-145`;
- `TREQ-UX-219`;
- `TREQ-UX-236`;
- `TREQ-UX-263`;
- `TREQ-UX-293`;
- `TREQ-UX-328`;
- `TREQ-UX-350`;
- `TREQ-UX-351`;
- `TREQ-UX-358`;
- `TREQ-UX-360`;
- `TREQ-UX-361`;
- `TREQ-UX-362`;
- `TREQ-UX-363`;
- `TREQ-UX-405`;
- `TREQ-UX-438`;
- `TREQ-UX-440`;
- `TREQ-UX-441`;
- `TREQ-UX-462`.

Estos requisitos permanecen en su estado canónico; la tarea no modifica sus filas.

---

#### 47. Estado de materialización

| Resultado                           | Estado                                                                                |
| ----------------------------------- | ------------------------------------------------------------------------------------- |
| autoría y borradores                | `ESPECIFICADO`                                                                        |
| revisión y diferencias              | `ESPECIFICADO`                                                                        |
| aprobación                          | `ESPECIFICADO`                                                                        |
| publicación y relación con vigencia | `ESPECIFICADO`                                                                        |
| firma condicional por acto canónico | `ESPECIFICADO`                                                                        |
| matriz 332/332                      | `ESPECIFICADO`                                                                        |
| implementación física               | `FUERA_DE_ALCANCE`                                                                    |
| evidencia operativa                 | `PENDIENTE_DE_EVIDENCIA` hasta la fase de implementación y validación correspondiente |

---

ÚLTIMA TAREA APROBADA

`INFO-UX-002 — Diseñar biblioteca documental con búsqueda autorizada, expediente, versión y vigencia`

TAREA ACTUAL APROBADA

`INFO-UX-003 — Diseñar creación, revisión, aprobación, publicación y firma de documentos`

SIGUIENTE TAREA RESERVADA

`INFO-UX-004 — Diseñar portal y caso de solicitudes de privacidad para trabajadores y clientes`


### [ ] INFO-UX-004 — Diseñar portal y caso de solicitudes de privacidad para trabajadores y clientes
### [ ] INFO-UX-005 — Diseñar retención, legal hold, archivo y disposición controlada
### [ ] INFO-UX-006 — Diseñar explorador de auditoría e investigación con divulgación progresiva
