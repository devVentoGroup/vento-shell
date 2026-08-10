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


### [ ] INFO-UX-002 — Diseñar biblioteca documental con búsqueda autorizada, expediente, versión y vigencia
### [ ] INFO-UX-003 — Diseñar creación, revisión, aprobación, publicación y firma de documentos
### [ ] INFO-UX-004 — Diseñar portal y caso de solicitudes de privacidad para trabajadores y clientes
### [ ] INFO-UX-005 — Diseñar retención, legal hold, archivo y disposición controlada
### [ ] INFO-UX-006 — Diseñar explorador de auditoría e investigación con divulgación progresiva
