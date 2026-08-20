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

<!-- EXECUTION-GATE-RECONCILIATION:B401-600:INFO-UX -->
### Reconciliación topológica de INFO-UX-001 a INFO-UX-006

Estas tareas son contratos y diseños canónicos de experiencia documental, privacidad, firma, retención e investigación. No poseen una instancia física independiente.

| Propiedad | Valor |
| --- | --- |
| modalidad | `DEFINE_ONCE` |
| gate temporal | `NO_PHYSICAL_INSTANCE` |
| identidad | `<task_id>` |

La implementación física posterior pertenece a los `package_id`, repositorios, aplicaciones, servicios, infraestructura y tareas propietarias que materialicen el alcance aprobado. El contrato de esta familia se reutiliza como entrada y criterio de aceptación; no se duplica mediante una instancia `<task_id>::<implementation_unit_id>`.

Esta reconciliación no autoriza cambios físicos ni modifica las decisiones sustantivas ya aprobadas.

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

| Aplicación propietaria | Procesos `VPROC-*` heredados |
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

Estas cantidades representan procesos `VPROC-*` por aplicación propietaria dentro del universo documental heredado y no sustituyen las 332 identidades contextuales ni sus relaciones canónicas.

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


### ✅ INFO-UX-004 — Diseñar portal y caso de solicitudes de privacidad para trabajadores y clientes

**Estado:** APROBADA
**Tarea anterior:** `INFO-UX-003 — Diseñar creación, revisión, aprobación, publicación y firma de documentos` — APROBADA
**Tarea siguiente:** `INFO-UX-005 — Diseñar retención, legal hold, archivo y disposición controlada` — RESERVADA
**Tipo de tarea:** documental; diseño UX transversal del portal personal y del expediente administrativo para consultas, reclamos y solicitudes de privacidad de trabajadores y clientes
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/AA_GOBIERNO_DE_INFORMACION/03_EXPERIENCIA_DOCUMENTAL_Y_PRIVACIDAD.md`
**Fase:** exclusivamente documental; no crea ni modifica código, rutas, pantallas canónicas, componentes, contratos técnicos, tablas, RLS, Storage, migraciones, funciones, datos, configuración, secretos, integraciones ni despliegues
**Contratos materializados:** `INFO-PRIVACY-REQUEST-PORTAL-UX-CONTRACT-001`; `INFO-PRIVACY-REQUEST-INTAKE-UX-CONTRACT-001`; `INFO-PRIVACY-REQUEST-CASE-UX-CONTRACT-001`; `INFO-PRIVACY-REQUEST-VERIFICATION-UX-CONTRACT-001`; `INFO-PRIVACY-REQUEST-STATUS-UX-CONTRACT-001`; `INFO-PRIVACY-REQUEST-RESPONSE-UX-CONTRACT-001`; `INFO-PRIVACY-REQUEST-SURFACE-MATRIX-001`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito y resultado sustantivo

Esta tarea define la experiencia canónica para que un trabajador o cliente pueda iniciar, comprender y seguir una solicitud de privacidad sin necesitar conocer terminología técnica, estructuras internas o aplicaciones propietarias, y para que el personal autorizado gestione el mismo caso de extremo a extremo sin convertir el portal, una cuenta autenticada, una edición de perfil o una acción local sobre datos en la fuente de verdad del expediente.

El diseño queda materializado en siete contratos UX consumibles y una matriz explícita de superficies. Se adoptan íntegramente la identidad, tipos, verificación, ciclo de vida, descubrimiento, ejecución, respuesta y cierre ya definidos por `INFO-DOM-009`, así como los contratos de finalidad, aviso, fundamento, consentimiento y revocación de `INFO-DOM-008` y las decisiones de autorización vigentes de `INFO-AUTH-*`.

La experiencia resuelve cuatro responsabilidades diferenciadas:

1. un canal personal del trabajador dentro de ANIMA para iniciar y seguir solicitudes propias;
2. un canal personal del cliente dentro de PASS para iniciar y seguir solicitudes propias;
3. un espacio administrativo en VISO para verificar, evaluar, coordinar, responder y cerrar el caso;
4. una proyección resumida en el dashboard de gobierno de información para priorizar y navegar, sin sustituir el expediente.

Ninguna de estas superficies crea una identidad empresarial paralela: todas proyectan el mismo `request_case_id` y el mismo estado autoritativo.

---

#### 2. Invariantes de experiencia

Se fijan las siguientes separaciones obligatorias:

```text
portal_personal
!= request_case
!= cuenta_autenticada
!= titular_verificado
!= representante_verificado
!= edición_autogestionable_de_perfil
!= mutación_directa_del_dato
!= investigación
!= eliminación_de_cuenta
!= disposición_documental
```

Reglas:

1. Una cuenta autenticada aporta evidencia de identidad, pero no demuestra por sí sola que la persona sea titular de todos los datos o recursos incluidos en una solicitud.
2. El solicitante no se trata automáticamente como titular; una representación requiere verificación propia.
3. El portal es un canal de entrada y seguimiento. La fuente de verdad del trámite es el caso trazable definido por `INFO-DOM-009`.
4. Una edición autogestionable permitida puede resolverse como acción ordinaria del perfil; no se registra falsamente como ejercicio formal de un derecho cuando no lo es.
5. Cuando el dato no sea autogestionable, exista disputa sobre su exactitud, se requiera prueba, haya múltiples sistemas o la persona elija expresamente una solicitud formal, la experiencia crea o enlaza un caso.
6. Solicitar supresión no equivale a borrar una cuenta, fila, archivo, historial o evidencia.
7. Revocar una autorización no equivale a supresión general ni a cierre de cuenta.
8. Solicitar acceso o copia no concede una exportación irrestricta de terceros, secretos, credenciales, reglas internas o información fuera de alcance.
9. Rectificar no permite reescribir hechos históricos verdaderos, auditoría, evidencia preservada o versiones anteriores.
10. Un reclamo de privacidad no se fusiona con soporte, servicio al cliente, devolución, compensación o investigación; los vínculos entre casos permanecen explícitos.
11. Una notificación no constituye estado autoritativo, aceptación, respuesta ni cierre.
12. La interfaz no mostrará `CERRADA`, `COMPLETADA` o equivalente mientras el caso no cumpla el cierre definido por el contrato de dominio.
13. Ningún plazo se inventará a partir del tipo de solicitud, jurisdicción supuesta o texto de interfaz.
14. Un error de verificación, consulta o integración no se presentará como ausencia de datos.
15. La experiencia nunca convertirá una decisión visual, checkbox, filtro, URL, deep link o botón disponible en autorización material.

---

#### 3. `INFO-PRIVACY-REQUEST-PORTAL-UX-CONTRACT-001` — portal personal

El portal personal es la experiencia de titular o solicitante. Su objetivo es permitir iniciar una solicitud comprensible, obtener un recibo trazable y consultar su estado sin exponer la complejidad interna del caso.

##### 3.1 Composición mínima

El portal debe ofrecer, cuando corresponda al actor y contexto:

- explicación breve de para qué sirve el canal;
- acción principal `Crear solicitud`;
- acceso a solicitudes propias existentes;
- identificación segura del contexto de cuenta utilizado sin afirmar titularidad no verificada;
- catálogo comprensible de intenciones disponibles;
- resumen de cada solicitud con tipo, fecha recibida, estado seguro, siguiente paso y referencia del caso;
- fecha objetivo solo cuando exista `due_at` autoritativo;
- solicitudes de aclaración o verificación pendientes;
- respuesta disponible o estado de entrega cuando aplique;
- acceso a la versión de respuesta autorizada para esa persona;
- canal de ayuda cuando la persona no pueda completar la solicitud digital.

##### 3.2 Información que no se muestra por defecto

Las listas y resúmenes no expondrán:

- texto íntegro de la declaración original;
- documentos de identidad completos;
- datos de terceros;
- resultados de descubrimiento internos;
- nombres de tablas, buckets, RPC, logs, proveedores o sistemas técnicos;
- fundamentos internos no necesarios para comprender el resultado;
- notas de investigación;
- detalle de legal hold, antifraude, seguridad o controles internos cuya divulgación no corresponda;
- archivos o metadatos que la autorización de lectura vigente no permita revelar.

##### 3.3 Estado de envío

Al enviar una solicitud:

1. la interfaz muestra `Enviando` mientras no exista confirmación del servidor;
2. solo después del receipt autoritativo muestra `Recibida`;
3. el receipt visible incluye `request_case_id`, fecha de recepción confirmada, tipos solicitados y canal;
4. un timeout o respuesta desconocida no genera una segunda intención: primero se consulta o reconcilia el resultado;
5. un borrador local o una pantalla de éxito no sustituyen el receipt.

---

#### 4. Canales por audiencia

##### 4.1 Trabajador — ANIMA

Se define `WORKER_PRIVACY_PORTAL` como experiencia lógica dentro del canal personal de ANIMA. Esta tarea no crea un nuevo `VSCREEN-*` ni una nueva ruta canónica.

La experiencia se integra con las superficies personales existentes de ANIMA bajo estas reglas:

- `VSCREEN-0027 — Inicio personal del trabajador` puede presentar acceso y resumen de solicitudes propias;
- `VSCREEN-0032 — Mi perfil laboral` conserva la autogestión permitida y ofrece entrada al caso cuando la necesidad exceda una edición ordinaria;
- `VSCREEN-0126 — Mis documentos laborales` puede aportar referencias documentales propias cuando sean necesarias, sin convertirse en propietario del caso ni en biblioteca irrestricta de evidencia;
- la salida desde cualquiera de estas superficies conserva el mismo `request_case_id` y vuelve al mismo caso personal;
- no se exponen expedientes de otros trabajadores, listas de empleados, decisiones administrativas ni herramientas internas de cumplimiento;
- terminar el vínculo laboral o revocar una cuenta no se presenta como supresión automática de historia laboral, asistencia, contratos, SST, pagos, auditoría o evidencia sujeta a conservación.

Si una fase posterior decide materializar una pantalla dedicada, deberá tramitarse como cambio del catálogo de pantallas y no podrá inferirse de esta tarea.

##### 4.2 Cliente — PASS

Se define `CUSTOMER_PRIVACY_PORTAL` dentro de `VSCREEN-0112 — Perfil, privacidad y consentimientos`.

La superficie mantiene dos carriles visibles pero separados:

1. **Autogestión ordinaria:** datos de perfil, preferencias y consentimientos que el contrato de producto permita modificar directamente.
2. **Solicitudes formales de privacidad:** creación y seguimiento del `request_case_id` para acceso, copia, actualización, rectificación, prueba, información de uso, revocación, supresión, restricción/oposición o reclamo de privacidad.

Reglas:

- cambiar una preferencia no cierra una solicitud formal que ya exista;
- retirar un consentimiento aplicable puede generar o enlazar el hecho de revocación correspondiente sin afirmar supresión general;
- eliminar o desactivar la cuenta no se comunica como eliminación integral de datos;
- una solicitud de supresión permanece como evaluación y caso trazable hasta que todos los sistemas y excepciones aplicables alcancen estado final;
- una cuenta cerrada no vuelve inaccesible la respuesta por una ruta insegura ni elimina evidencia necesaria del caso; la entrega posterior deberá usar un mecanismo autorizado para el titular verificado.

---

#### 5. `INFO-PRIVACY-REQUEST-INTAKE-UX-CONTRACT-001` — creación de solicitud

La creación utiliza un flujo guiado breve y reversible. La experiencia pregunta únicamente lo necesario para entender la intención, el alcance y la identidad o representación requerida.

##### 5.1 Etapas

| Etapa            | Objetivo UX                                                         | Resultado                                                             |
| ---------------- | ------------------------------------------------------------------- | --------------------------------------------------------------------- |
| `INTENT`         | Entender qué necesita la persona.                                   | Uno o más códigos canónicos de solicitud.                             |
| `SCOPE`          | Delimitar personas, relación, datos, periodo o situación relevante. | Alcance comprensible y no técnico.                                    |
| `REQUESTER`      | Confirmar quién está presentando la solicitud.                      | Solicitante identificado para iniciar verificación.                   |
| `REPRESENTATION` | Capturar representación solo cuando aplique.                        | Referencia de representación pendiente o verificable.                 |
| `DETAIL`         | Recibir explicación adicional solo cuando aporte un hecho nuevo.    | Declaración original preservable.                                     |
| `EVIDENCE`       | Solicitar soporte proporcional únicamente cuando sea necesario.     | Referencias de evidencia; nunca requisito universal por conveniencia. |
| `REVIEW`         | Mostrar exactamente qué se enviará.                                 | Intenciones, alcance y adjuntos revisables.                           |
| `SUBMIT`         | Crear una única intención de caso.                                  | Receipt o resultado desconocido a reconciliar.                        |

Volver a una etapa anterior no ejecuta efectos ni pierde los datos ya válidos. Si un cambio invalida información posterior, la interfaz la marca para revisión antes del envío.

##### 5.2 Catálogo de intención — 10 de 10

Los códigos de dominio permanecen estables; la etiqueta visible puede adaptarse al idioma y audiencia sin cambiar su significado.

| Código canónico       | Etiqueta humana principal                     | Pregunta que responde                                                       | No debe interpretarse como                        |
| --------------------- | --------------------------------------------- | --------------------------------------------------------------------------- | ------------------------------------------------- |
| `DSR_QUERY_ACCESS`    | Consultar mis datos                           | ¿Qué información sobre mí puede consultarse dentro del alcance autorizado?  | Exportación irrestricta.                          |
| `DSR_COPY`            | Solicitar una copia                           | ¿Qué representación autorizada puede entregarse de mis datos?               | Copia de secretos o datos de terceros.            |
| `DSR_UPDATE`          | Actualizar mis datos                          | ¿Qué dato actual puede actualizarse en su fuente propietaria?               | Reescritura histórica.                            |
| `DSR_RECTIFY`         | Corregir un dato                              | ¿Qué dato considero incorrecto y por qué?                                   | Sobrescritura de evidencia o auditoría.           |
| `DSR_PROOF`           | Consultar prueba de autorización o fundamento | ¿Qué evidencia respalda un tratamiento concreto?                            | Declaración genérica de consentimiento.           |
| `DSR_USE_INFO`        | Conocer cómo se usan mis datos                | ¿Para qué finalidad y bajo qué tratamiento se usa la información aplicable? | Acceso a reglas internas innecesarias.            |
| `DSR_REVOKE`          | Retirar una autorización aplicable            | ¿Qué autorización o finalidad revocable deseo retirar?                      | Supresión automática de todos los datos.          |
| `DSR_SUPPRESS`        | Solicitar supresión                           | ¿Qué información o tratamiento deseo que se evalúe para supresión?          | Borrado inmediato de cuenta, archivos o historia. |
| `DSR_RESTRICT_OBJECT` | Solicitar restricción u oposición             | ¿Qué uso deseo restringir u objetar dentro del alcance aplicable?           | Bloqueo universal sin evaluación.                 |
| `DSR_PRIVACY_CLAIM`   | Reportar un problema de privacidad            | ¿Qué hecho de privacidad necesito que sea revisado?                         | Reclamo comercial o investigación ya concluida.   |

Una sola solicitud puede contener más de un código cuando la declaración de la persona incluya varias pretensiones relacionadas. La interfaz las muestra y responde por separado, pero conserva un solo caso cuando el contrato de dominio permita tratarlas conjuntamente.

##### 5.3 Identificación y evidencia proporcional

La experiencia no exigirá por defecto cargar un documento de identidad completo para todas las solicitudes. La verificación utilizará la evidencia necesaria según el tipo, riesgo, canal, relación y acción solicitada.

Cuando se requiera información adicional:

- se explica qué dimensión falta sin revelar existencia de datos;
- se solicita el mínimo necesario;
- se informa si la persona puede continuar por otro canal aprobado;
- se conserva el trabajo ya enviado;
- se evita solicitar nuevamente información que el sistema ya puede verificar de forma autorizada.

---

#### 6. `INFO-PRIVACY-REQUEST-VERIFICATION-UX-CONTRACT-001` — identidad y representación

La interfaz proyecta exactamente los cinco estados de verificación del contrato de dominio.

| Estado canónico             | Presentación humana                 | Acción permitida en la experiencia                                           |
| --------------------------- | ----------------------------------- | ---------------------------------------------------------------------------- |
| `NOT_CHECKED`               | Verificación pendiente              | Mostrar recepción y siguientes pasos sin divulgar coincidencias.             |
| `IDENTITY_VERIFIED`         | Identidad verificada                | Continuar con el alcance que esa verificación soporte.                       |
| `REPRESENTATION_VERIFIED`   | Representación verificada           | Continuar exclusivamente respecto del sujeto y alcance representados.        |
| `VERIFICATION_INSUFFICIENT` | Necesitamos información adicional   | Solicitar el mínimo faltante y mantener el caso abierto.                     |
| `VERIFICATION_CONFLICT`     | No pudimos confirmar la información | Detener divulgaciones o mutaciones dependientes y ofrecer resolución segura. |

Reglas:

1. La pantalla no dirá `No encontramos datos` cuando la causa real sea verificación insuficiente, conflicto, indisponibilidad o falta de autorización.
2. La sesión autenticada no autoriza automáticamente a actuar por otra persona, empresa, cliente, trabajador o relación histórica.
3. La representación se trata como una relación verificable; el representante no obtiene acceso general al perfil del titular.
4. Un cambio de cuenta, actor, sesión, representación o alcance revalida la capacidad antes de revelar o actuar.
5. Los errores visibles no exponen qué dato interno no coincidió cuando esa revelación aumente el riesgo de suplantación o enumeración.

---

#### 7. `INFO-PRIVACY-REQUEST-STATUS-UX-CONTRACT-001` — estado comprensible del caso

El portal y VISO proyectan la misma máquina de estados. Las etiquetas humanas nunca sustituyen los códigos canónicos ni crean transiciones propias.

##### 7.1 Ciclo principal — 9 de 9

| Estado canónico  | Etiqueta humana                        | Significado visible                                                             |
| ---------------- | -------------------------------------- | ------------------------------------------------------------------------------- |
| `RECEIVED`       | Recibida                               | La solicitud fue registrada y tiene referencia de caso.                         |
| `VERIFICATION`   | Verificando identidad o representación | Se comprueba quién solicita y qué relación puede acreditarse.                   |
| `CLASSIFIED`     | Clasificada                            | Las intenciones y el alcance fueron identificados.                              |
| `DISCOVERY`      | Buscando información aplicable         | Se consultan las fuentes autorizadas que podrían estar dentro del alcance.      |
| `ASSESSMENT`     | Evaluando la solicitud                 | Se revisan resultados, reglas, restricciones y decisiones necesarias.           |
| `EXECUTION`      | Aplicando decisiones aprobadas         | Los sistemas propietarios ejecutan las acciones autorizadas.                    |
| `RESPONSE_READY` | Respuesta preparada                    | El resultado consolidado está listo para entrega autorizada.                    |
| `RESPONDED`      | Respuesta enviada                      | Se registró la respuesta y su versión.                                          |
| `CLOSED`         | Cerrada                                | Todas las pretensiones y efectos exigidos alcanzaron condición final de cierre. |

##### 7.2 Condiciones transversales — 8 de 8

| Condición canónica             | Presentación segura al titular                    | Comportamiento UX                                                                              |
| ------------------------------ | ------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| `CLARIFICATION_REQUIRED`       | Necesitamos una aclaración                        | Mostrar la pregunta concreta y conservar el resto del caso.                                    |
| `IDENTITY_UNVERIFIED`          | Verificación pendiente                            | No revelar coincidencias ni ejecutar acciones dependientes.                                    |
| `BLOCKED_BY_RETENTION`         | Existe una obligación de conservación en revisión | Explicar el efecto sobre la pretensión sin exponer detalle innecesario.                        |
| `BLOCKED_BY_HOLD`              | Existe una preservación vigente en revisión       | Mantener el caso abierto o la decisión parcial según corresponda.                              |
| `BLOCKED_BY_INDEPENDENT_BASIS` | Existe otro fundamento documentado en revisión    | Explicar el alcance que no puede detenerse o suprimirse sin presentar una denegación genérica. |
| `PARTIALLY_EXECUTED`           | Aplicación parcial                                | Mostrar qué pretensiones finalizaron y cuáles siguen pendientes.                               |
| `EXECUTION_FAILED`             | Hay una acción pendiente por resolver             | No afirmar éxito; indicar que el caso sigue en gestión.                                        |
| `REOPENED`                     | Reabierta                                         | Conservar la respuesta y cierre anteriores como historia y mostrar el nuevo motivo.            |

##### 7.3 Plazos

La experiencia usa `received_at`, `verified_at`, `classified_at`, `due_at`, `responded_at` y `closed_at` con semántica diferenciada.

- `received_at` se muestra cuando existe receipt confirmado.
- `due_at` solo se muestra cuando proviene de una obligación aprobada y de un cálculo autoritativo.
- Si `due_at` no está resuelto, la interfaz muestra `Plazo en verificación` o equivalente neutral.
- Un caso sin `due_at` no se marca como vencido, no recibe semáforo de incumplimiento y no se ordena como si existiera una fecha inferida.
- Cambiar una fecha calculada conserva la versión y causa; la interfaz no reescribe la historia.

---

#### 8. `INFO-PRIVACY-REQUEST-CASE-UX-CONTRACT-001` — espacio administrativo en VISO

`PRIVACY_CASE_WORKSPACE` se materializa sobre `VSCREEN-0122 — Privacidad, cumplimiento y conservación`. VISO es la experiencia administrativa para coordinar el caso, pero no sustituye la fuente de verdad de los datos empresariales ni ejecuta mutaciones propietarias por edición local.

##### 8.1 Encabezado persistente

Debe mantener visibles, de forma minimizada y autorizada:

- `request_case_id`;
- tipos de solicitud;
- fecha de recepción;
- canal;
- solicitante y titular diferenciados;
- estado de representación;
- estado de verificación;
- ciclo de vida actual;
- responsable del caso;
- `due_at` únicamente cuando esté resuelto;
- clasificación de sensibilidad aplicable;
- alertas de bloqueo o parcialidad;
- siguiente acción segura.

La declaración original, archivos sensibles y datos completos de identidad no permanecen abiertos por defecto en el encabezado.

##### 8.2 Secciones del caso

| Sección             | Contenido                                                                                 | Prohibición                                                       |
| ------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| `Solicitud`         | Declaración original preservada, tipos, canal, alcance y aclaraciones.                    | Reescribir el mensaje original.                                   |
| `Verificación`      | Evidencia mínima, identidad, representación, estado y conflictos.                         | Exponer datos de verificación fuera del rol permitido.            |
| `Alcance y fuentes` | Sistemas, propietarios, fuentes y resultados de descubrimiento por elemento.              | Copiar información de fuentes como maestro local.                 |
| `Evaluación`        | Pretensiones, reglas aplicables, restricciones, fundamento y decisión por pretensión.     | Fusionar decisiones distintas en un único `aprobado/rechazado`.   |
| `Ejecución`         | Acción por sistema propietario, estado, resultado, evidencia, excepción y reconciliación. | Marcar éxito por haber enviado un comando.                        |
| `Respuesta`         | Resultado por pretensión, versión de respuesta, anexos autorizados y canal.               | Redactar éxito manual incompatible con los estados reales.        |
| `Evidencia`         | Referencias necesarias de receipt, decisiones, entregas, restricciones y excepciones.     | Usar adjuntos como sustituto de datos estructurados obligatorios. |
| `Cronología`        | Eventos, actor, tiempo, razón, versión y cambios de estado.                               | Borrar o reordenar historia para simplificar el caso.             |

##### 8.3 Matriz de ejecución por sistema

Cada sistema o propietario en alcance se presenta como una fila independiente con:

- propietario funcional;
- referencia de fuente;
- resultado de descubrimiento;
- pretensión aplicable;
- decisión;
- acción ordenada o requerida;
- estado de ejecución;
- última actualización confirmada;
- evidencia o receipt;
- excepción o bloqueo;
- reconciliación pendiente.

VISO no ofrecerá una acción `Forzar completado`. El estado agregado se calcula desde las decisiones y resultados autoritativos.

##### 8.4 Resultados de descubrimiento

La interfaz conserva los resultados canónicos definidos por `INFO-DOM-009` y los agrupa para comprensión sin ocultar diferencias materiales:

- coincidencia consultable;
- coincidencia rectificable;
- autorización revocable;
- elemento potencialmente suprimible;
- elemento restringido;
- bloqueo por conservación;
- bloqueo por preservación;
- fundamento independiente;
- acción externa requerida;
- revisión requerida;
- ausencia de coincidencia demostrada.

La lista no confunde `sin coincidencia` con `sin autorización para consultar`, `verificación insuficiente`, `fuente no disponible` o `resultado desconocido`.

---

#### 9. Decisiones UX por tipo de solicitud

##### 9.1 Acceso y copia

- La persona ve qué parte del alcance puede entregarse y qué limitaciones aplicaron.
- Datos de terceros, secretos, credenciales, información antifraude o contenido no autorizado se minimizan, separan o protegen.
- Una copia conserva versión, periodo, fuentes y fecha de corte cuando sean materiales para entenderla.
- El artefacto de respuesta se presenta como entrega controlada vinculada al caso, no como exportación general de la aplicación.

##### 9.2 Actualización y rectificación

- El portal distingue `Actualizar un dato actual` de `Corregir un dato que considero incorrecto`.
- La interfaz muestra la fuente propietaria que resolverá la modificación cuando esa información sea segura y útil.
- El caso conserva antes, después, razón, actor y efecto en derivados cuando corresponda.
- Los hechos históricos preservados no se presentan como campos ordinarios editables.

##### 9.3 Prueba e información de uso

- La persona puede identificar la finalidad o contexto sobre el que solicita prueba.
- La respuesta distingue evidencia de consentimiento, autorización, aviso, fundamento documentado y otros hechos; no los presenta como equivalentes.
- Un estado `UNRESOLVED` nunca se traduce a `autorizado`.

##### 9.4 Revocación

- La UI pregunta qué autorización o finalidad se desea retirar cuando el alcance pueda diferenciarse.
- Antes de confirmar, muestra el efecto conocido y qué aspectos independientes no necesariamente cambian.
- La respuesta muestra el alcance efectivamente revocado y cualquier ejecución pendiente.
- El portal nunca promete borrado total como consecuencia automática.

##### 9.5 Supresión

- La acción visible es `Solicitar supresión`, no `Borrar todos mis datos`.
- La revisión previa explica que la solicitud será evaluada contra conservación, preservación, fundamentos independientes, obligaciones, sistemas y copias controladas aplicables.
- La respuesta puede indicar supresión por disposición, anonimización, restricción, conservación limitada, ausencia de coincidencia o revisión requerida según el resultado autoritativo.
- Ninguna eliminación técnica aislada se muestra como evidencia suficiente de cierre.

##### 9.6 Restricción u oposición

- La persona identifica el uso, finalidad o alcance al que dirige la solicitud.
- La interfaz evita formular una prohibición universal si el contrato solo puede evaluar un tratamiento específico.
- Si existe una restricción efectiva, se muestra su alcance y vigencia sin afirmar supresión.

##### 9.7 Reclamo de privacidad

- La entrada conserva el relato original antes de cualquier corrección.
- La interfaz permite enlazar un caso de investigación cuando corresponda, sin fusionar los expedientes.
- Quien gestiona el caso no puede presentar como resuelto un reclamo cuya investigación, acción correctiva o aprobación de cierre siga pendiente.
- Los reclamos comerciales o de servicio permanecen en sus expedientes propietarios aunque tengan un vínculo de referencia.

---

#### 10. Respuesta y cierre

##### 10.1 `INFO-PRIVACY-REQUEST-RESPONSE-UX-CONTRACT-001`

La respuesta se construye a partir de resultados estructurados y conserva una sección por pretensión.

Debe permitir comprender:

- referencia del caso;
- qué se pidió;
- qué alcance fue evaluado;
- resultado de cada pretensión;
- información entregada cuando aplique;
- actualizaciones o rectificaciones confirmadas;
- revocaciones efectivas;
- restricciones aplicadas;
- resultado de supresión;
- información conservada y explicación permitida cuando corresponda;
- elementos no localizados cuando esa conclusión esté demostrada;
- limitaciones o denegaciones con explicación segura;
- acciones externas todavía pendientes;
- fecha, canal y versión de respuesta;
- siguiente acción disponible, incluida reapertura o aclaración cuando proceda.

Una respuesta parcial se etiqueta explícitamente como parcial. La interfaz no convierte `RESPONDED` en `CLOSED` si permanecen efectos que el contrato exige resolver.

##### 10.2 Puerta de cierre visible

VISO solo ofrece cierre final cuando la proyección autoritativa confirma:

1. todas las pretensiones tienen decisión final o excepción aprobada;
2. cada sistema en alcance está finalizado o cubierto por excepción válida;
3. los efectos parciales y externos fueron reconciliados;
4. las restricciones de conservación o preservación están reflejadas correctamente;
5. la respuesta entregada coincide con el estado agregado real;
6. existe evidencia suficiente de la respuesta y de los efectos materiales;
7. no queda un resultado técnico desconocido presentado como éxito.

Si una condición falla, la UI muestra cuál falta y mantiene el caso abierto.

---

#### 11. Dashboard de gobierno — resumen, no expediente

La proyección `PRIVACY_REQUEST_DASHBOARD_ENTRY` conserva el alcance ya definido por `INFO-UX-001`.

Cada fila puede mostrar únicamente:

- referencia del caso;
- tipo o tipos resumidos;
- identidad o representación minimizada;
- responsable;
- estado fuente;
- `due_at` cuando esté autoritativamente resuelto;
- siguiente paso fuente;
- bloqueo o parcialidad;
- acción `Abrir solicitud`.

El dashboard no:

- muestra por defecto el contenido enviado por la persona;
- infiere un plazo por el tipo de solicitud;
- decide rectificación, revocación, supresión o cierre;
- ejecuta mutaciones sobre datos personales;
- convierte un reclamo de privacidad en investigación;
- marca vencido un caso con plazo no resuelto.

---

#### 12. Notificaciones y comunicaciones

1. Una notificación informa que existe una actualización; no contiene por defecto datos sensibles, documentos, motivo completo ni resultado detallado.
2. Abrir una notificación revalida identidad, relación, autorización y estado antes de mostrar el caso.
3. Una notificación antigua no conserva capacidad después de revocación, cambio de cuenta, cierre o expiración de su contexto.
4. El silencio del destinatario no se interpreta como aceptación, desistimiento, aprobación ni cierre.
5. El estado de entrega de una comunicación se mantiene separado del estado del caso.
6. Los mensajes usan lenguaje humano y describen la acción siguiente sin exponer códigos internos como contenido principal.

---

#### 13. Privacidad de la propia experiencia

La experiencia de privacidad aplica minimización reforzada a sus propios metadatos:

- las bandejas no se convierten en directorios de titulares;
- búsqueda y autocompletado muestran una proyección menor que el detalle del caso;
- badges y contadores no revelan poblaciones o identidades fuera del alcance del actor;
- copias, impresión, exportación o entrega de información son acciones distintas de visualizar;
- archivos y evidencia se revelan solo por finalidad y permiso;
- el cambio de actor o contexto elimina de la superficie datos del caso que ya no puedan mostrarse;
- la telemetría no registra el relato completo, documentos de identidad ni payloads personales por conveniencia;
- una URL conocida, referencia de caso o nombre de archivo no concede lectura.

---

#### 14. Estados de error, bloqueo y recuperación

| Situación                                   | Presentación obligatoria                   | Recuperación                                          |
| ------------------------------------------- | ------------------------------------------ | ----------------------------------------------------- |
| Falló la creación antes de obtener receipt  | `No pudimos confirmar el envío`            | Consultar estado antes de repetir.                    |
| Receipt existe pero la UI perdió respuesta  | `Estamos confirmando el resultado`         | Recuperar por referencia/idempotencia.                |
| Verificación insuficiente                   | `Necesitamos información adicional`        | Solicitar solo el dato o evidencia faltante.          |
| Verificación conflictiva                    | `No pudimos confirmar la información`      | Canal seguro alterno o revisión autorizada.           |
| Fuente no disponible                        | `Hay una fuente pendiente de consulta`     | Mantener caso abierto; no concluir ausencia.          |
| Resultado parcial                           | `La solicitud sigue en gestión`            | Mostrar pretensiones completadas y pendientes.        |
| Acción externa pendiente                    | `Existe una acción externa pendiente`      | Seguir reconciliación; no cerrar por envío.           |
| Restricción por conservación o preservación | Explicación segura del efecto              | Mostrar resultado aplicable sin prometer eliminación. |
| Respuesta lista pero acceso no autorizado   | `Necesitamos volver a verificar tu acceso` | Revalidar sin exponer la respuesta.                   |

Ningún mensaje culpabiliza a la persona por fallos de infraestructura, concurrencia, integración o política.

---

#### 15. Accesibilidad y lenguaje

1. La acción primaria se expresa como verbo + objeto: `Crear solicitud`, `Enviar aclaración`, `Revisar respuesta`, `Solicitar supresión`.
2. Etiquetas genéricas como `Procesar`, `Resolver` o `Continuar` no se usan cuando oculten un efecto material.
3. Los códigos `DSR_*`, estados internos, nombres de tablas y conceptos técnicos pueden aparecer en detalle administrativo autorizado, pero nunca son el texto principal para trabajadores o clientes.
4. Estado, bloqueo, parcialidad y siguiente acción no dependen solo de color o icono.
5. Los flujos personales deben ser operables con teclado, tacto y lector de pantalla y conservar orden de foco comprensible.
6. La persona puede revisar y corregir su solicitud antes de enviarla sin reescribir información que el sistema ya conoce de forma segura.
7. Una validación tardía no exige corregir un campo oculto sin revelar previamente la condición que lo vuelve necesario.
8. La respuesta y los estados mantienen lenguaje neutral, concreto y no punitivo.

---

#### 16. `INFO-PRIVACY-REQUEST-SURFACE-MATRIX-001`

| Superficie lógica                 | Aplicación / superficie canónica                                                  | Actor principal                                | Alcance                                              | Fuente de verdad                                                             | Mutación permitida desde UX                                                                      | Decisión       |
| --------------------------------- | --------------------------------------------------------------------------------- | ---------------------------------------------- | ---------------------------------------------------- | ---------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ | -------------- |
| `WORKER_PRIVACY_PORTAL`           | ANIMA / canal personal existente (`VSCREEN-0027`, `VSCREEN-0032`, `VSCREEN-0126`) | trabajador o representante verificado          | iniciar y seguir solicitudes propias                 | `request_case_id` y contratos de dominio                                     | crear solicitud, aportar aclaración/evidencia y consumir respuesta mediante comandos autorizados | `ESPECIFICADO` |
| `CUSTOMER_PRIVACY_PORTAL`         | PASS / `VSCREEN-0112`                                                             | cliente o representante verificado             | autogestión separada de solicitudes formales propias | perfil propietario para autogestión; `request_case_id` para solicitud formal | autogestión permitida o creación/seguimiento de caso según intención                             | `ESPECIFICADO` |
| `PRIVACY_CASE_WORKSPACE`          | VISO / `VSCREEN-0122`                                                             | personal autorizado de privacidad/cumplimiento | verificar, evaluar, coordinar, responder y cerrar    | caso trazable y resultados propietarios por sistema                          | decisiones y órdenes autorizadas; nunca edición local como sustituto del propietario             | `ESPECIFICADO` |
| `PRIVACY_REQUEST_DASHBOARD_ENTRY` | VISO / dashboard de gobierno de información                                       | responsable autorizado                         | resumen y priorización                               | proyección del caso                                                          | navegación al caso; sin decisión ni mutación material                                            | `ESPECIFICADO` |

Reconciliación:

```text
4 superficies logicas esperadas
4 superficies logicas materializadas
4 identidades unicas
0 superficies duplicadas
2 canales personales
1 espacio administrativo de caso
1 proyeccion resumida de dashboard
0 nuevos VSCREEN-* creados
0 nuevas rutas canónicas creadas
```

---

#### 17. Reconciliación de contratos consumidos

| Contrato o decisión heredada                                      | Uso en esta tarea                                   | Resultado UX                                                     |
| ----------------------------------------------------------------- | --------------------------------------------------- | ---------------------------------------------------------------- |
| Finalidad, aviso, fundamento, consentimiento y revocación         | Presentar alcance y efectos sin fusionar conceptos. | El portal no convierte términos o perfil en autorización global. |
| Caso de solicitud de titular                                      | Identidad única del trámite.                        | Un `request_case_id` compartido entre canal personal y VISO.     |
| Catálogo de diez tipos                                            | Intención de entrada y respuesta por pretensión.    | 10 de 10 tipos cubiertos.                                        |
| Cinco estados de verificación                                     | Protección antes de divulgación o mutación.         | 5 de 5 estados proyectados.                                      |
| Nueve estados principales                                         | Línea de progreso fuente.                           | 9 de 9 estados proyectados.                                      |
| Ocho condiciones transversales                                    | Bloqueo, parcialidad y reapertura.                  | 8 de 8 condiciones proyectadas.                                  |
| Descubrimiento y ejecución por fuente                             | Trabajo interno por sistema propietario.            | Matriz de ejecución sin copias maestras en VISO.                 |
| Respuesta y evidencia                                             | Comunicación final reproducible.                    | Respuesta por pretensión, versión y evidencia.                   |
| Autorización por identidad, relación, finalidad, recurso y acción | Revelado y acción mínimos.                          | La UI no concede autoridad por visibilidad o sesión.             |
| Retención, hold, anonimización y disposición                      | Limitar promesas de supresión.                      | Solicitud de supresión nunca equivale a borrado inmediato.       |

---

#### 18. Casos de frontera resueltos

##### 18.1 Trabajador pide corregir un dato autogestionable

Si el dato pertenece a la autogestión ordinaria autorizada, ANIMA permite corregirlo mediante la capacidad propietaria y muestra su receipt. Si la persona cuestiona un hecho histórico, la fuente no es editable, existe disputa, requiere prueba o solicita tratamiento formal, la interfaz ofrece crear o enlazar `DSR_UPDATE` o `DSR_RECTIFY` sin duplicar la modificación.

##### 18.2 Cliente retira marketing

PASS separa la preferencia o autorización de marketing de términos, cuenta, compra y otras finalidades. Si la revocación puede ejecutarse como capacidad autogestionable autorizada, registra el hecho correspondiente; si requiere análisis transversal o ya existe un caso, lo enlaza al `request_case_id`. La interfaz no promete supresión de compras, facturación, antifraude, puntos o auditoría.

##### 18.3 Persona solicita supresión y también cierre de cuenta

La experiencia presenta dos efectos distintos. El cierre de cuenta gobierna acceso y relación de producto; la supresión continúa como pretensión de privacidad evaluada por categoría, sistema, retención, preservación y fundamento. Una acción puede finalizar antes que la otra sin que la UI las marque como equivalentes.

##### 18.4 Representante solicita datos de otra persona

El portal crea el caso con solicitante y titular separados. Hasta `REPRESENTATION_VERIFIED`, no muestra coincidencias, documentos, perfil ni resultados de búsqueda del titular. La verificación aprobada limita el alcance de la representación y no concede acceso general.

##### 18.5 No se localizan datos en un sistema

`NO_MATCH` solo se muestra como conclusión cuando la búsqueda autoritativa pudo ejecutarse dentro del alcance correspondiente. Si la fuente falló, el actor no estaba verificado, el sistema quedó fuera de alcance o el resultado fue desconocido, el caso conserva ese estado y no comunica `No encontramos datos`.

##### 18.6 Rectificación afecta una fuente histórica

La UI muestra que el dato fue revisado y, cuando aplique, que la corrección se materializa como nueva versión, anotación o hecho correctivo. No presenta como editable una evidencia inmutable ni oculta que el valor histórico usado en un evento anterior se conserva.

##### 18.7 Revocación con uso todavía permitido por otro fundamento

La respuesta distingue el alcance revocado del tratamiento que permanece bajo otro fundamento documentado. La interfaz no usa el término `rechazada` para ocultar esta diferencia: muestra una decisión por pretensión y una explicación segura del alcance que continúa.

##### 18.8 Acción parcial en varios sistemas

El portal muestra `Aplicación parcial`; VISO lista cada sistema, resultado y pendiente. Los sistemas confirmados no se repiten por reintento global y el caso no se cierra hasta reconciliar los restantes o registrar una excepción válida.

---

#### 19. Cobertura y cifras de diseño

| Métrica                                  | Resultado |
| ---------------------------------------- | --------: |
| Tipos canónicos de solicitud esperados   |        10 |
| Tipos materializados                     |        10 |
| Tipos faltantes                          |         0 |
| Estados principales esperados            |         9 |
| Estados principales materializados       |         9 |
| Condiciones transversales esperadas      |         8 |
| Condiciones transversales materializadas |         8 |
| Estados de verificación esperados        |         5 |
| Estados de verificación materializados   |         5 |
| Canales personales                       |         2 |
| Espacios administrativos de caso         |         1 |
| Proyecciones de dashboard                |         1 |
| Nuevas identidades `VSCREEN-*`           |         0 |
| Nuevas rutas canónicas                   |         0 |
| Cambios físicos                          |         0 |

No se materializa una matriz de 332 `DOCCTX-*` porque esta tarea no reclasifica documentos ni decide el contenido personal de cada identidad. El universo documental, sus clases, retención, integridad y propietarios permanecen bajo los contratos aprobados y se consultan por alcance durante el caso.

---

#### 20. Criterios de aceptación

- [x] Existen experiencias diferenciadas para trabajador, cliente, gestor interno y dashboard resumido.
- [x] Trabajador y cliente usan canales personales sin acceder al backoffice de privacidad.
- [x] El diseño no crea una pantalla canónica nueva para ANIMA ni altera el catálogo `VSCREEN-*`.
- [x] PASS conserva `VSCREEN-0112` como superficie personal de perfil, privacidad y consentimientos y separa autogestión de solicitud formal.
- [x] VISO utiliza `VSCREEN-0122` como espacio de coordinación del caso y no como maestro alterno de datos empresariales.
- [x] Los 10 tipos canónicos de solicitud están materializados con etiqueta humana y frontera explícita.
- [x] Los 5 estados de verificación están proyectados sin convertir login en titularidad universal.
- [x] Los 9 estados principales y las 8 condiciones transversales están cubiertos sin crear estados paralelos.
- [x] El receipt autoritativo precede al mensaje `Recibida`.
- [x] Un timeout o resultado desconocido se reconcilia antes de permitir una nueva intención equivalente.
- [x] La UI no comunica ausencia de datos cuando existe un problema de verificación, autorización, fuente o resultado desconocido.
- [x] Acceso y copia aplican minimización y no se presentan como exportación irrestricta.
- [x] Actualización y rectificación no sobrescriben silenciosamente historia, auditoría o evidencia.
- [x] Revocación, supresión, cierre de cuenta, restricción, anonimización y disposición permanecen diferenciados.
- [x] La solicitud de supresión se presenta como evaluación y no como borrado inmediato.
- [x] Los plazos solo se muestran cuando existe `due_at` autoritativo; no se inventan fechas ni reglas jurídicas.
- [x] El dashboard de solicitudes no decide ni ejecuta el caso y no muestra contenido sensible por defecto.
- [x] La matriz de ejecución conserva resultado por sistema y evita un `éxito global` opaco.
- [x] La respuesta conserva resultado por pretensión y un estado parcial no se presenta como cierre.
- [x] El cierre solo está disponible cuando todas las condiciones autoritativas exigidas están satisfechas o cubiertas por excepción válida.
- [x] Las notificaciones son avisos y revalidan antes de abrir información protegida.
- [x] La experiencia aplica minimización a búsquedas, listas, contadores, archivos, telemetría y respuestas.
- [x] Los flujos personales y administrativos conservan lenguaje humano y accesibilidad sin depender de color, hover o códigos técnicos.
- [x] No se crean cambios de código, Supabase, Storage, migraciones, datos, integraciones, rutas ni configuración.
- [x] La siguiente tarea permanece reservada y no se desarrolla en este artefacto.

---

#### 21. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

**Justificación:** el comportamiento ejecutable necesario para esta experiencia ya está protegido por el registro canónico vigente en los dominios de trabajador, cliente, administración, autorización, almacenamiento e integración: solicitudes comprensibles, caso trazable, verificación de identidad y representación, minimización, decisiones por pretensión, cierre reconciliado, conservación, propagación y evidencia. Esta tarea materializa la experiencia UX que consume esos contratos y no introduce una mutación, permiso, transición técnica, plazo, integración, esquema de almacenamiento o comportamiento ejecutable adicional. Crea 0 requisitos, modifica 0, difiere 0, descarta 0 y vuelve obsoletos 0.

---

#### 22. Continuidad

ÚLTIMA TAREA APROBADA

`INFO-UX-003 — Diseñar creación, revisión, aprobación, publicación y firma de documentos`

TAREA ACTUAL APROBADA

`INFO-UX-004 — Diseñar portal y caso de solicitudes de privacidad para trabajadores y clientes`

SIGUIENTE TAREA RESERVADA

`INFO-UX-005 — Diseñar retención, legal hold, archivo y disposición controlada`


### ✅ INFO-UX-005 — Diseñar retención, legal hold, archivo y disposición controlada

**Estado:** APROBADA
**Tarea anterior:** `INFO-UX-004 — Diseñar portal y caso de solicitudes de privacidad para trabajadores y clientes` — APROBADA
**Tarea siguiente:** `INFO-UX-006 — Diseñar explorador de auditoría e investigación con divulgación progresiva` — RESERVADA
**Tipo de tarea:** documental

#### 1. Propósito

Materializar la experiencia documental para administrar retención, legal hold, archivo y disposición controlada sin convertir estados incompletos, ausencia de evidencia o capacidad técnica en autorización de negocio. La experiencia conserva la separación entre política, trigger, cómputo temporal, archivo, preservación, hold, elegibilidad, método de disposición, verificación y certificado.

El diseño se apoya exclusivamente en contratos documentales aprobados. No fija periodos numéricos, no presume jurisdicción, no habilita acciones destructivas y no crea implementación física.

#### 2. Resultado sustantivo

Quedan definidos cuatro artefactos lógicos de experiencia:

1. `INFO-RETENTION-LIFECYCLE-UX-CONTRACT-001` — experiencia del ciclo de retención y archivo.
2. `INFO-LEGAL-HOLD-UX-CONTRACT-001` — experiencia para imponer, revisar, modificar y liberar legal hold.
3. `INFO-DISPOSITION-UX-CONTRACT-001` — experiencia para elegibilidad, manifiesto, aprobación, ejecución, verificación y certificación de disposición.
4. `INFO-RETENTION-DISPOSITION-UX-MATRIX-001` — decisión explícita para 69 procesos y 332 identidades `DOCCTX-*`.

La superficie administrativa se resuelve en `VSCREEN-0122`, ya existente y propietaria de gobierno de información en VISO. Esta tarea crea **0 VSCREEN** y **0 rutas**.

#### 3. Entradas canónicas consumidas

- `INFO-DOM-006` aporta los contratos de política de retención, schedule, eventos de cómputo, archivo, legal hold, disposición, certificado y matriz por identidad.
- `INFO-DOM-012` conserva pendiente la evidencia material de periodos o criterios temporales cuando no existe soporte verificable; por ello no se infieren duraciones.
- `INFO-AUTH-003` mantiene separadas las funciones de crear, revisar, aprobar, firmar, retener, imponer hold, disponer y eliminar; la capacidad técnica no constituye autoridad de negocio.
- `INFO-UX-004` conserva la regla de que una solicitud de supresión no equivale por sí sola a eliminación inmediata cuando existe retención, preservación o hold aplicable.
- `INFO-RETENTION-DISPOSITION-MATRIX-001` conserva 69 procesos y 332 identidades documentales, sin reidentificación ni reclasificación por esta tarea.

#### 4. Decisiones rectoras de experiencia

1. La ausencia de una política ejecutable se representa como `POLICY_UNRESOLVED`; nunca como retención indefinida aprobada.
2. `RET_UNRESOLVED` bloquea disposición, anonimización destructiva y eliminación hasta resolver base, versión, trigger y condiciones temporales exigibles.
3. Un `HOLD_ACTIVE` prevalece sobre cualquier acción destructiva incompatible y no amplía visibilidad, permisos, finalidad ni clasificación.
4. Archivo, backup, retención, legal hold, disposición y eliminación técnica permanecen conceptos distintos en interfaz, estado y autoridad.
5. La elegibilidad no equivale a ejecución; `ELIGIBLE_FOR_DISPOSITION` solo habilita el siguiente control cuando todas las precondiciones se encuentran verificadas.
6. Solicitar, aprobar, ejecutar, verificar y certificar son funciones distintas. La interfaz no las colapsa en una sola acción.
7. La liberación de un hold recalcula elegibilidad; nunca dispara eliminación automática.
8. Una falla parcial de disposición permanece visible como `DISPOSITION_FAILED`; no puede mostrarse como éxito ni cerrarse con un certificado completo.
9. Copias, representaciones, índices, cachés, exportes, terceros y backups se tratan como alcance gobernado cuando el contrato aplicable los incluye.
10. Una restauración no puede resucitar material ya dispuesto: debe reaplicar decisiones, revocaciones, tombstones, políticas y holds antes de volver a exponer contenido.
11. La experiencia nunca revela a una persona no autorizada el motivo sensible de una investigación, preservación o hold; comunica solo el estado permitido y la consecuencia operativa necesaria.
12. Toda acción sensible se niega cuando identidad, autoridad, propósito, recurso, alcance o contexto obligatorio no pueden resolverse.

#### 5. `INFO-RETENTION-LIFECYCLE-UX-CONTRACT-001`

##### 5.1. Vista de detalle de retención

Para una identidad autorizada, la experiencia debe poder presentar, según permiso:

- identidad `DOCCTX-*`, proceso y recurso;
- tipo documental, clasificación y propietario/custodio vigentes;
- clase de retención heredada;
- identificador y versión de política, cuando estén resueltos;
- trigger autorizado y evento material que lo satisface;
- mínimo, máximo o criterio temporal solo cuando exista evidencia verificable;
- estado de ciclo de vida;
- estado de archivo;
- hold y preservación aplicables;
- bloqueos por investigación, obligación, excepción o evidencia faltante;
- estado de copias, representaciones, terceros y backups cuando sea relevante;
- motivos de elegibilidad o de bloqueo;
- referencias a manifiesto y certificado cuando existan.

Los valores pendientes deben mostrarse como evidencia no resuelta y no como `0`, vacío, inexistente o periodo ilimitado.

##### 5.2. Estados principales

La experiencia representa el flujo canónico:

`ACTIVE -> INACTIVE -> ARCHIVE_PENDING -> ARCHIVED -> ELIGIBLE_FOR_DISPOSITION -> DISPOSITION_PENDING -> DISPOSED | ANONYMIZED | TRANSFERRED`

Estados transversales visibles cuando apliquen:

- `HOLD_ACTIVE`
- `PRESERVATION_REQUIRED`
- `DISPOSITION_BLOCKED`
- `DISPOSITION_FAILED`
- `POLICY_UNRESOLVED`

Los estados transversales no sustituyen el estado principal; explican por qué una transición está permitida, bloqueada o incompleta.

##### 5.3. Cómputo temporal

La interfaz no usa como sustituto de trigger autorizado:

- `created_at`;
- `updated_at`;
- último acceso;
- sincronización;
- cambio de ubicación;
- movimiento de bucket o prefijo;
- timestamp de backup.

Solo un evento aprobado por la política aplicable puede iniciar o modificar el cómputo. Un cambio de versión de política no reescribe retroactivamente el historial.

#### 6. Archivo controlado

La experiencia de archivo representa una conservación gobernada posterior al uso operativo ordinario. Archivar conserva:

- identidad, versión y relación con `DOCCTX-*`;
- proceso y recurso;
- clasificación y reglas de acceso;
- metadatos y representaciones necesarias;
- integridad, legibilidad y trazabilidad;
- política de retención y versión aplicable;
- trigger y evidencia temporal permitida;
- procedencia y custodia;
- capacidad de búsqueda autorizada;
- migrabilidad;
- futura elegibilidad y disposición.

No se presenta como archivo, por sí solo, un backup, una carpeta personal, un cambio de almacenamiento, un exporte manual sin custodia, una tabla abandonada, correo personal, dispositivo local o almacenamiento frío sin gobierno.

Archivar no reduce automáticamente clasificación, permisos ni obligaciones de disposición futura.

#### 7. `INFO-LEGAL-HOLD-UX-CONTRACT-001`

##### 7.1. Acciones separadas

La interfaz trata como intenciones distintas:

- imponer hold;
- revisar hold;
- modificar alcance o condiciones autorizadas;
- liberar hold.

No existe un interruptor binario que combine estas funciones.

##### 7.2. Datos mínimos de trabajo

La experiencia solicita o presenta, según permiso:

- `hold_id`;
- tipo de hold;
- alcance mediante consulta gobernada o manifiesto;
- código de razón;
- referencia de autoridad;
- solicitante;
- aprobador;
- fecha de emisión y efectividad;
- fecha de revisión;
- condición de liberación;
- fecha de liberación cuando corresponda;
- custodio;
- estado de notificación;
- acciones de preservación;
- excepciones autorizadas.

##### 7.3. Previsualización y alcance

Antes de imponer o modificar un hold, la experiencia muestra el alcance que el actor está autorizado a conocer. El conteo, la muestra y los detalles se reautorizan y no pueden usarse como canal lateral para descubrir contenido restringido.

Un hold debe tener alcance explícito. No se ofrece una opción de hold global por conveniencia.

##### 7.4. Efectos

Con `HOLD_ACTIVE`:

- se bloquea anonimización destructiva, eliminación y disposición incompatible;
- se conserva la clasificación y el modelo de acceso vigentes;
- no se amplía propósito ni visibilidad;
- la preservación se propaga a copias y derivados gobernados cuando el manifiesto o política los incluyen;
- cualquier modificación o liberación queda como hecho separado y auditable.

Liberar el hold conserva su historia y ordena recalcular elegibilidad; la interfaz no encadena una acción destructiva automática.

#### 8. `INFO-DISPOSITION-UX-CONTRACT-001`

##### 8.1. Evaluación de elegibilidad

La experiencia solo puede mostrar `ELIGIBLE_FOR_DISPOSITION` cuando todas las siguientes condiciones están resueltas:

1. política y versión aplicables;
2. trigger autorizado;
3. mínimo satisfecho cuando aplique;
4. máximo o acción evaluable cuando aplique;
5. estado del recurso compatible;
6. ausencia de hold incompatible;
7. ausencia de preservación, investigación, obligación o excepción pendiente que bloquee;
8. inventario suficiente de copias y derivados;
9. estado conocido de terceros y backups;
10. ausencia de fallas previas sin reconciliar;
11. autoridad verificable para aprobar el método.

Si cualquiera falla, la experiencia muestra `DISPOSITION_BLOCKED` o `POLICY_UNRESOLVED` con razones autorizadas y no habilita ejecución.

##### 8.2. Manifiesto previo

Antes de aprobar una disposición, la interfaz presenta un manifiesto controlado con:

- política y versión;
- alcance exacto;
- proceso y recurso;
- trigger y fecha de elegibilidad;
- método;
- filas, objetos o representaciones incluidas;
- adjuntos, miniaturas, cachés, índices y superficies de búsqueda aplicables;
- exportes y copias temporales gobernadas;
- derivados o agregados alcanzados;
- estado de terceros;
- estado de backups;
- holds y excepciones;
- segregación de aprobador y ejecutor cuando corresponda;
- criterio de reintento idempotente;
- criterio de éxito, resultado parcial y residual;
- evidencia esperada.

##### 8.3. Funciones y autoridad

La experiencia conserva la separación:

`SOLICITAR != APROBAR != EJECUTAR != VERIFICAR != CERTIFICAR`

Ninguna capacidad administrativa o técnica reemplaza la autoridad de negocio. Cada paso revalida actor, función, propósito, alcance, estado, política y bloqueos aplicables.

##### 8.4. Anonimización

La interfaz solo puede tratar una operación como anonimización cuando el contrato aplicable resuelve método y versión, cobertura de atributos y derivados, riesgo de reidentificación, irreversibilidad o desvinculación razonable, conflictos de hold/preservación y tratamiento de copias, índices, exportes y derivados.

Enmascarado, tokenización, pseudonimización o truncamiento no se presentan como anonimización definitiva por sí solos.

##### 8.5. Eliminación controlada

La experiencia no considera completada una eliminación por la desaparición de una fila u objeto principal. Debe existir verificación del alcance gobernado, dependencias, representaciones, cachés, índices, exportes, derivados, terceros y backups según contrato.

Una ejecución parcial permanece en `DISPOSITION_FAILED` o estado pendiente compatible. Los reintentos deben reconciliar resultados anteriores y no repetir efectos destructivos de forma ciega.

##### 8.6. Certificación

El certificado solo puede emitirse después de un resultado verificado. Como mínimo representa:

- identificador de manifiesto;
- versión de política;
- alcance, proceso y recurso;
- trigger y tiempo de elegibilidad;
- verificación de hold;
- método;
- tiempos de ejecución;
- solicitante, aprobador, ejecutor y verificador;
- componentes esperados, exitosos y fallidos;
- estado de terceros, backups y residuales;
- resultado;
- referencias de evidencia;
- fecha de emisión;
- referencia de integridad.

No se muestra certificado completo de éxito si existe falla material, resultado desconocido, política no resuelta o evidencia insuficiente.

#### 9. Integración con solicitudes de privacidad

Cuando una solicitud de privacidad pida supresión o eliminación:

1. la solicitud no salta la evaluación de retención, obligación, preservación, investigación o hold;
2. la experiencia puede informar que parte del material permanece conservado por una base o bloqueo aplicable sin exponer detalles restringidos;
3. puede completarse parcialmente una solicitud cuando el contrato permita separar material elegible de material preservado;
4. el usuario externo no recibe controles administrativos de hold, archivo o disposición;
5. una liberación posterior de un bloqueo no promete eliminación inmediata: se reevalúa elegibilidad bajo la política vigente.

#### 10. Superficie, navegación y divulgación

- Superficie administrativa principal: `VSCREEN-0122` en VISO.
- Nuevas pantallas: **0**.
- Nuevas rutas: **0**.
- Los accesos desde tablero, alertas o casos son enlaces contextuales; abrir el destino exige reautorización.
- Una alerta no transporta en su texto información sensible innecesaria sobre hold, investigación o evidencia.
- La interfaz aplica divulgación progresiva: primero estado y bloqueo; luego detalle solo para actores autorizados.
- Búsqueda, filtrado, vista de manifiesto y vista de certificado respetan clasificación, propósito, relación, territorio y estado vigentes.

#### 11. Lenguaje de estados y acciones

La interfaz usa acciones verbo + objeto, por ejemplo:

- `Revisar política`
- `Revisar elegibilidad`
- `Imponer hold`
- `Revisar hold`
- `Liberar hold`
- `Preparar manifiesto`
- `Solicitar disposición`
- `Aprobar disposición`
- `Verificar resultado`
- `Consultar certificado`

No usa etiquetas ambiguas como `Procesar`, `Resolver`, `Limpiar` o `Eliminar todo` cuando oculten el alcance real.

Toda acción destructiva requiere confirmación con objeto, alcance, método, efecto, bloqueos resueltos y consecuencia no reversible aplicable.

#### 12. Accesibilidad y estados operativos

La experiencia debe:

- funcionar con teclado y lector de pantalla;
- no depender exclusivamente de color para diferenciar `HOLD_ACTIVE`, `DISPOSITION_BLOCKED`, `DISPOSITION_FAILED` o éxito;
- asociar razones de bloqueo a texto legible y controles correspondientes;
- mantener foco y contexto después de validaciones;
- anunciar cambios de estado relevantes;
- distinguir carga, estado vacío, falta de autorización, ausencia real de resultados y error de servicio;
- impedir que un error de consulta parezca ausencia de hold o elegibilidad positiva.

#### 13. Matriz por proceso — 69 de 69

| Proceso      | DOCCTX esperados | Estado heredado                                                           | Decisión de experiencia                                                                                                          |
| ------------ | ---------------: | ------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0001` |                2 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0002` |                2 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0003` |                1 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0004` |                1 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0005` |                5 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0006` |                4 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0007` |                3 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0008` |                1 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0009` |                1 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0010` |                4 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0011` |                4 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0012` |                5 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0013` |                3 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0014` |                4 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0015` |                4 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0016` |                4 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0017` |                1 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0018` |                4 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0019` |                3 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0020` |                5 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0021` |                3 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0022` |                3 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0023` |                2 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0024` |                3 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0025` |                2 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0026` |                5 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0027` |                2 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0028` |                7 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0029` |                6 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0030` |                6 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0031` |                7 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0032` |                5 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0033` |                5 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0034` |                8 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0035` |                4 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0036` |                4 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0037` |                5 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0038` |                6 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0039` |                6 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0040` |                5 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0041` |                5 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0042` |                4 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0043` |                6 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0044` |                6 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0045` |                4 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0046` |                7 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0047` |                6 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0048` |                7 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0049` |                8 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0050` |                7 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0051` |                4 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0052` |                5 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0053` |                4 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0054` |                6 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0055` |                5 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0056` |                7 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0057` |                7 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0058` |                6 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0059` |                6 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0060` |                8 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0061` |                6 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0062` |                7 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0063` |                5 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0064` |                6 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0065` |                7 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0066` |                7 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0067` |                6 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0068` |                6 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |
| `VPROC-0069` |                9 | Retención y frontera heredadas de `INFO-RETENTION-DISPOSITION-MATRIX-001` | ESPECIFICADO: mantener control fail-closed, sin inferir periodos ni habilitar disposición mientras exista evidencia no resuelta. |

#### 14. `INFO-RETENTION-DISPOSITION-UX-MATRIX-001` — 332 de 332

Cada fila conserva identidad y proceso. Esta tarea no altera la clase de retención, el trigger ni la frontera heredados; materializa la decisión de experiencia aplicable a cada identidad.

| Identidad              | Proceso      | Política         | Hold                  | Archivo                               | Disposición           | Decisión de experiencia                                                                                                                                           |
| ---------------------- | ------------ | ---------------- | --------------------- | ------------------------------------- | --------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `DOCCTX-VPROC-0001-01` | `VPROC-0001` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0001-02` | `VPROC-0001` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0002-01` | `VPROC-0002` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0002-02` | `VPROC-0002` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0003-01` | `VPROC-0003` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0004-01` | `VPROC-0004` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0005-01` | `VPROC-0005` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0005-02` | `VPROC-0005` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0005-03` | `VPROC-0005` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0005-04` | `VPROC-0005` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0005-05` | `VPROC-0005` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0006-01` | `VPROC-0006` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0006-02` | `VPROC-0006` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0006-03` | `VPROC-0006` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0006-04` | `VPROC-0006` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0007-01` | `VPROC-0007` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0007-02` | `VPROC-0007` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0007-03` | `VPROC-0007` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0008-01` | `VPROC-0008` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0009-01` | `VPROC-0009` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0010-01` | `VPROC-0010` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0010-02` | `VPROC-0010` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0010-03` | `VPROC-0010` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0010-04` | `VPROC-0010` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0011-01` | `VPROC-0011` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0011-02` | `VPROC-0011` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0011-03` | `VPROC-0011` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0011-04` | `VPROC-0011` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0012-01` | `VPROC-0012` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0012-02` | `VPROC-0012` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0012-03` | `VPROC-0012` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0012-04` | `VPROC-0012` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0012-05` | `VPROC-0012` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0013-01` | `VPROC-0013` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0013-02` | `VPROC-0013` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0013-03` | `VPROC-0013` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0014-01` | `VPROC-0014` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0014-02` | `VPROC-0014` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0014-03` | `VPROC-0014` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0014-04` | `VPROC-0014` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0015-01` | `VPROC-0015` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0015-02` | `VPROC-0015` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0015-03` | `VPROC-0015` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0015-04` | `VPROC-0015` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0016-01` | `VPROC-0016` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0016-02` | `VPROC-0016` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0016-03` | `VPROC-0016` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0016-04` | `VPROC-0016` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0017-01` | `VPROC-0017` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0018-01` | `VPROC-0018` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0018-02` | `VPROC-0018` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0018-03` | `VPROC-0018` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0018-04` | `VPROC-0018` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0019-01` | `VPROC-0019` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0019-02` | `VPROC-0019` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0019-03` | `VPROC-0019` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0020-01` | `VPROC-0020` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0020-02` | `VPROC-0020` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0020-03` | `VPROC-0020` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0020-04` | `VPROC-0020` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0020-05` | `VPROC-0020` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0021-01` | `VPROC-0021` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0021-02` | `VPROC-0021` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0021-03` | `VPROC-0021` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0022-01` | `VPROC-0022` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0022-02` | `VPROC-0022` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0022-03` | `VPROC-0022` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0023-01` | `VPROC-0023` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0023-02` | `VPROC-0023` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0024-01` | `VPROC-0024` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0024-02` | `VPROC-0024` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0024-03` | `VPROC-0024` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0025-01` | `VPROC-0025` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0025-02` | `VPROC-0025` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0026-01` | `VPROC-0026` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0026-02` | `VPROC-0026` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0026-03` | `VPROC-0026` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0026-04` | `VPROC-0026` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0026-05` | `VPROC-0026` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0027-01` | `VPROC-0027` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0027-02` | `VPROC-0027` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0028-01` | `VPROC-0028` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0028-02` | `VPROC-0028` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0028-03` | `VPROC-0028` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0028-04` | `VPROC-0028` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0028-05` | `VPROC-0028` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0028-06` | `VPROC-0028` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0028-07` | `VPROC-0028` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0029-01` | `VPROC-0029` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0029-02` | `VPROC-0029` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0029-03` | `VPROC-0029` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0029-04` | `VPROC-0029` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0029-05` | `VPROC-0029` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0029-06` | `VPROC-0029` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0030-01` | `VPROC-0030` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0030-02` | `VPROC-0030` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0030-03` | `VPROC-0030` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0030-04` | `VPROC-0030` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0030-05` | `VPROC-0030` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0030-06` | `VPROC-0030` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0031-01` | `VPROC-0031` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0031-02` | `VPROC-0031` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0031-03` | `VPROC-0031` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0031-04` | `VPROC-0031` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0031-05` | `VPROC-0031` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0031-06` | `VPROC-0031` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0031-07` | `VPROC-0031` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0032-01` | `VPROC-0032` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0032-02` | `VPROC-0032` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0032-03` | `VPROC-0032` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0032-04` | `VPROC-0032` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0032-05` | `VPROC-0032` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0033-01` | `VPROC-0033` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0033-02` | `VPROC-0033` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0033-03` | `VPROC-0033` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0033-04` | `VPROC-0033` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0033-05` | `VPROC-0033` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0034-01` | `VPROC-0034` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0034-02` | `VPROC-0034` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0034-03` | `VPROC-0034` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0034-04` | `VPROC-0034` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0034-05` | `VPROC-0034` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0034-06` | `VPROC-0034` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0034-07` | `VPROC-0034` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0034-08` | `VPROC-0034` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0035-01` | `VPROC-0035` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0035-02` | `VPROC-0035` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0035-03` | `VPROC-0035` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0035-04` | `VPROC-0035` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0036-01` | `VPROC-0036` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0036-02` | `VPROC-0036` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0036-03` | `VPROC-0036` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0036-04` | `VPROC-0036` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0037-01` | `VPROC-0037` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0037-02` | `VPROC-0037` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0037-03` | `VPROC-0037` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0037-04` | `VPROC-0037` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0037-05` | `VPROC-0037` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0038-01` | `VPROC-0038` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0038-02` | `VPROC-0038` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0038-03` | `VPROC-0038` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0038-04` | `VPROC-0038` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0038-05` | `VPROC-0038` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0038-06` | `VPROC-0038` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0039-01` | `VPROC-0039` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0039-02` | `VPROC-0039` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0039-03` | `VPROC-0039` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0039-04` | `VPROC-0039` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0039-05` | `VPROC-0039` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0039-06` | `VPROC-0039` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0040-01` | `VPROC-0040` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0040-02` | `VPROC-0040` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0040-03` | `VPROC-0040` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0040-04` | `VPROC-0040` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0040-05` | `VPROC-0040` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0041-01` | `VPROC-0041` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0041-02` | `VPROC-0041` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0041-03` | `VPROC-0041` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0041-04` | `VPROC-0041` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0041-05` | `VPROC-0041` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0042-01` | `VPROC-0042` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0042-02` | `VPROC-0042` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0042-03` | `VPROC-0042` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0042-04` | `VPROC-0042` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0043-01` | `VPROC-0043` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0043-02` | `VPROC-0043` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0043-03` | `VPROC-0043` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0043-04` | `VPROC-0043` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0043-05` | `VPROC-0043` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0043-06` | `VPROC-0043` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0044-01` | `VPROC-0044` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0044-02` | `VPROC-0044` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0044-03` | `VPROC-0044` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0044-04` | `VPROC-0044` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0044-05` | `VPROC-0044` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0044-06` | `VPROC-0044` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0045-01` | `VPROC-0045` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0045-02` | `VPROC-0045` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0045-03` | `VPROC-0045` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0045-04` | `VPROC-0045` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0046-01` | `VPROC-0046` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0046-02` | `VPROC-0046` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0046-03` | `VPROC-0046` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0046-04` | `VPROC-0046` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0046-05` | `VPROC-0046` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0046-06` | `VPROC-0046` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0046-07` | `VPROC-0046` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0047-01` | `VPROC-0047` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0047-02` | `VPROC-0047` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0047-03` | `VPROC-0047` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0047-04` | `VPROC-0047` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0047-05` | `VPROC-0047` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0047-06` | `VPROC-0047` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0048-01` | `VPROC-0048` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0048-02` | `VPROC-0048` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0048-03` | `VPROC-0048` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0048-04` | `VPROC-0048` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0048-05` | `VPROC-0048` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0048-06` | `VPROC-0048` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0048-07` | `VPROC-0048` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0049-01` | `VPROC-0049` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0049-02` | `VPROC-0049` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0049-03` | `VPROC-0049` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0049-04` | `VPROC-0049` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0049-05` | `VPROC-0049` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0049-06` | `VPROC-0049` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0049-07` | `VPROC-0049` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0049-08` | `VPROC-0049` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0050-01` | `VPROC-0050` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0050-02` | `VPROC-0050` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0050-03` | `VPROC-0050` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0050-04` | `VPROC-0050` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0050-05` | `VPROC-0050` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0050-06` | `VPROC-0050` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0050-07` | `VPROC-0050` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0051-01` | `VPROC-0051` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0051-02` | `VPROC-0051` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0051-03` | `VPROC-0051` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0051-04` | `VPROC-0051` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0052-01` | `VPROC-0052` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0052-02` | `VPROC-0052` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0052-03` | `VPROC-0052` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0052-04` | `VPROC-0052` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0052-05` | `VPROC-0052` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0053-01` | `VPROC-0053` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0053-02` | `VPROC-0053` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0053-03` | `VPROC-0053` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0053-04` | `VPROC-0053` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0054-01` | `VPROC-0054` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0054-02` | `VPROC-0054` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0054-03` | `VPROC-0054` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0054-04` | `VPROC-0054` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0054-05` | `VPROC-0054` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0054-06` | `VPROC-0054` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0055-01` | `VPROC-0055` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0055-02` | `VPROC-0055` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0055-03` | `VPROC-0055` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0055-04` | `VPROC-0055` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0055-05` | `VPROC-0055` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0056-01` | `VPROC-0056` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0056-02` | `VPROC-0056` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0056-03` | `VPROC-0056` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0056-04` | `VPROC-0056` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0056-05` | `VPROC-0056` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0056-06` | `VPROC-0056` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0056-07` | `VPROC-0056` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0057-01` | `VPROC-0057` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0057-02` | `VPROC-0057` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0057-03` | `VPROC-0057` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0057-04` | `VPROC-0057` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0057-05` | `VPROC-0057` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0057-06` | `VPROC-0057` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0057-07` | `VPROC-0057` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0058-01` | `VPROC-0058` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0058-02` | `VPROC-0058` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0058-03` | `VPROC-0058` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0058-04` | `VPROC-0058` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0058-05` | `VPROC-0058` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0058-06` | `VPROC-0058` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0059-01` | `VPROC-0059` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0059-02` | `VPROC-0059` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0059-03` | `VPROC-0059` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0059-04` | `VPROC-0059` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0059-05` | `VPROC-0059` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0059-06` | `VPROC-0059` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0060-01` | `VPROC-0060` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0060-02` | `VPROC-0060` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0060-03` | `VPROC-0060` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0060-04` | `VPROC-0060` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0060-05` | `VPROC-0060` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0060-06` | `VPROC-0060` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0060-07` | `VPROC-0060` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0060-08` | `VPROC-0060` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0061-01` | `VPROC-0061` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0061-02` | `VPROC-0061` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0061-03` | `VPROC-0061` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0061-04` | `VPROC-0061` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0061-05` | `VPROC-0061` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0061-06` | `VPROC-0061` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0062-01` | `VPROC-0062` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0062-02` | `VPROC-0062` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0062-03` | `VPROC-0062` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0062-04` | `VPROC-0062` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0062-05` | `VPROC-0062` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0062-06` | `VPROC-0062` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0062-07` | `VPROC-0062` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0063-01` | `VPROC-0063` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0063-02` | `VPROC-0063` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0063-03` | `VPROC-0063` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0063-04` | `VPROC-0063` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0063-05` | `VPROC-0063` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0064-01` | `VPROC-0064` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0064-02` | `VPROC-0064` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0064-03` | `VPROC-0064` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0064-04` | `VPROC-0064` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0064-05` | `VPROC-0064` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0064-06` | `VPROC-0064` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0065-01` | `VPROC-0065` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0065-02` | `VPROC-0065` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0065-03` | `VPROC-0065` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0065-04` | `VPROC-0065` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0065-05` | `VPROC-0065` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0065-06` | `VPROC-0065` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0065-07` | `VPROC-0065` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0066-01` | `VPROC-0066` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0066-02` | `VPROC-0066` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0066-03` | `VPROC-0066` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0066-04` | `VPROC-0066` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0066-05` | `VPROC-0066` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0066-06` | `VPROC-0066` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0066-07` | `VPROC-0066` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0067-01` | `VPROC-0067` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0067-02` | `VPROC-0067` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0067-03` | `VPROC-0067` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0067-04` | `VPROC-0067` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0067-05` | `VPROC-0067` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0067-06` | `VPROC-0067` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0068-01` | `VPROC-0068` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0068-02` | `VPROC-0068` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0068-03` | `VPROC-0068` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0068-04` | `VPROC-0068` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0068-05` | `VPROC-0068` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0068-06` | `VPROC-0068` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0069-01` | `VPROC-0069` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0069-02` | `VPROC-0069` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0069-03` | `VPROC-0069` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0069-04` | `VPROC-0069` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0069-05` | `VPROC-0069` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0069-06` | `VPROC-0069` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0069-07` | `VPROC-0069` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0069-08` | `VPROC-0069` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |
| `DOCCTX-VPROC-0069-09` | `VPROC-0069` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | Solo bajo contrato de archivo vigente | `DISPOSITION_BLOCKED` | ESPECIFICADO: conservar clase, trigger y frontera heredados; no habilitar acción destructiva hasta resolver política, evidencia, autoridad y bloqueos aplicables. |

#### 15. Reconciliación cuantitativa

- Procesos esperados: **69**.
- Procesos materializados: **69**.
- Identidades `DOCCTX-*` esperadas: **332**.
- Identidades materializadas: **332**.
- Identificadores únicos: **332**.
- Faltantes: **0**.
- Duplicados: **0**.
- Políticas ejecutables con periodo numérico y base verificable materializadas por esta tarea: **0**.
- Identidades en `RET_UNRESOLVED`: **332**.
- Disposición automática habilitada: **0**.

Distribución heredada de clases de retención, sin modificación:

| Clase                |   Total |
| -------------------- | ------: |
| `RET_ACTIVE_CASE`    |      33 |
| `RET_BUSINESS_CYCLE` |     184 |
| `RET_RELATIONSHIP`   |      36 |
| `RET_OBLIGATION`     |      66 |
| `RET_ARCHIVAL`       |      13 |
| **TOTAL**            | **332** |

Distribución heredada de frontera de evidencia, sin modificación:

| Frontera               |   Total |
| ---------------------- | ------: |
| `NINGUNO`              |      73 |
| `FRONTERA_OBLIGATORIA` |     245 |
| `APLICACION_DIFERIDA`  |      14 |
| **TOTAL**              | **332** |

#### 16. Bloqueos documentales vigentes

Para las 332 identidades, los periodos mínimos, máximos o criterios temporales no se completan por inferencia cuando falta evidencia autoritativa. El estado documental es:

- política ejecutable: `PENDIENTE_DE_EVIDENCIA` cuando la fuente material no resuelve base o duración;
- disposición automática: `BLOQUEADO`;
- preservación de incertidumbre: obligatoria hasta resolver evidencia;
- tarea responsable de resolver periodos o bases: la tarea canónica que incorpore evidencia normativa o contractual suficiente, sin que `INFO-UX-005` la sustituya.

Este bloqueo no impide cerrar el diseño de experiencia: la interfaz queda definida para representar el estado pendiente y negar acciones incompatibles.

#### 17. Criterios de aceptación materializados

1. Existe una superficie administrativa concreta y heredada: `VSCREEN-0122`.
2. Se distinguen retención, archivo, legal hold, elegibilidad, disposición, anonimización, eliminación, backup y certificado.
3. La experiencia implementable conoce los estados principales y transversales exactos.
4. `RET_UNRESOLVED` y `POLICY_UNRESOLVED` bloquean acciones destructivas.
5. Un hold activo bloquea disposición incompatible sin ampliar acceso.
6. Imponer, revisar, modificar y liberar hold son intenciones separadas.
7. Solicitar, aprobar, ejecutar, verificar y certificar disposición son funciones separadas.
8. Liberar un hold no produce eliminación automática.
9. El manifiesto hace visible el alcance gobernado antes de una decisión destructiva.
10. Falla parcial, terceros pendientes y backups no reconciliados impiden representar éxito completo.
11. Una solicitud de privacidad no omite retención, preservación, obligaciones ni hold.
12. Los detalles sensibles se divulgan progresivamente y solo tras autorización.
13. No se crean pantallas ni rutas nuevas.
14. Se preservan las 69 identidades de proceso y las 332 identidades documentales.
15. La matriz contiene 332 decisiones explícitas, sin faltantes ni duplicados.
16. No se inventan periodos numéricos ni bases legales ausentes.
17. No se materializan cambios físicos en datos, servicios, almacenamiento, permisos o infraestructura.

#### 18. Frontera documental

`INFO-UX-005` especifica la experiencia y sus decisiones, pero no ejecuta:

- jobs de retención;
- DDL o DML;
- migraciones;
- cambios de RLS;
- movimientos de objetos;
- archivado físico;
- imposición real de holds;
- anonimización o eliminación;
- emisión real de certificados;
- integraciones con terceros;
- purga o tratamiento de backups.

Resultado de fase: `ESPECIFICADO`. No se declara `IMPLEMENTADO` ni `VALIDADO` operativamente.

#### 19. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación: esta tarea materializa una experiencia documental sobre contratos canónicos ya aprobados y no introduce un comportamiento técnico nuevo, persistencia, ejecución de disposición, jobs, RLS, servicios, integraciones ni superficies nuevas. La evidencia de implementación y ejecución permanece bajo los requisitos vigentes de los componentes responsables.

#### 20. Continuidad

**ÚLTIMA TAREA APROBADA:** `INFO-UX-004 — Diseñar portal y caso de solicitudes de privacidad para trabajadores y clientes`

**TAREA ACTUAL APROBADA:** `INFO-UX-005 — Diseñar retención, legal hold, archivo y disposición controlada`

**SIGUIENTE TAREA RESERVADA:** `INFO-UX-006 — Diseñar explorador de auditoría e investigación con divulgación progresiva`


### ✅ INFO-UX-006 — Diseñar explorador de auditoría e investigación con divulgación progresiva

**Estado:** APROBADA
**Tarea anterior:** `INFO-UX-005 — Diseñar retención, legal hold, archivo y disposición controlada` — APROBADA
**Tarea siguiente:** `INFO-INT-001 — Definir adaptadores de Storage, escaneo, OCR, firma, certificación, preservación y archivo externo` — RESERVADA
**Tipo de tarea:** documental; diseño normativo y materializado de la experiencia de exploración de auditoría e investigación en VISO, con búsqueda autorizada, correlación no destructiva, segregación investigativa y divulgación progresiva de información sensible, logs y evidencia preservada
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/AA_GOBIERNO_DE_INFORMACION/03_EXPERIENCIA_DOCUMENTAL_Y_PRIVACIDAD.md`
**Aplicación objetivo:** `VISO`
**Superficie canónica consumida:** `VSCREEN-0122 — Privacidad, cumplimiento y conservación`
**Fase:** exclusivamente documental
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, rutas, pantallas implementadas, tablas, vistas, buckets, políticas, RLS, RPC, funciones, triggers, Edge Functions, migraciones, datos, permisos, grants, roles, logs físicos, sistemas forenses, integraciones ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Diseñar una experiencia administrativa segura para explorar auditoría empresarial e investigaciones formales sin convertir el explorador en una copia irrestricta de logs, una consola forense universal, un mecanismo de bypass de autorización ni una vía para alterar evidencia histórica.

La experiencia debe permitir que una persona autorizada responda, dentro de su alcance real:

1. qué ocurrió y bajo qué categoría auditable;
2. qué actor, principal, servicio, recurso, proceso y contexto pueden revelarse para la finalidad autorizada;
3. qué eventos se relacionan con un caso sin fusionar identidades ni inventar causalidad;
4. en qué estado se encuentra una investigación y qué condiciones de control la bloquean;
5. qué fuentes fueron preservadas antes de una corrección que pudiera alterarlas;
6. qué elementos son hechos, hipótesis, hallazgos o limitaciones;
7. qué autoridad independiente puede revisar, cerrar o reabrir el caso;
8. qué detalle puede mostrarse ahora y qué detalle requiere una decisión adicional de autorización.

Principio rector:

```text
EXPLORADOR
= BÚSQUEDA AUTORIZADA
+ PROYECCIÓN MINIMIZADA
+ CORRELACIÓN TRAZABLE
+ DIVULGACIÓN PROGRESIVA
+ NAVEGACIÓN GOBERNADA

≠ LOG COMPLETO POR DEFECTO
≠ COPIA DEL CONTENIDO PROTEGIDO
≠ AUTORIDAD DE INVESTIGACIÓN
≠ AUTORIDAD DE CIERRE
≠ AUTORIDAD DE EXPORTACIÓN
≠ AUTORIDAD DE PRESERVACIÓN O DISPOSICIÓN
```

---

#### 2. Resultado sustantivo

La tarea materializa cuatro artefactos lógicos coordinados:

1. `INFO-AUDIT-INVESTIGATION-EXPLORER-UX-CONTRACT-001` — contrato de experiencia para búsqueda, resultados, detalle, correlación y navegación de auditoría e investigaciones.
2. `INFO-AUDIT-INVESTIGATION-PROGRESSIVE-DISCLOSURE-MATRIX-001` — decisión concreta de qué grupos de información se muestran por defecto, cuáles requieren una nueva evaluación de autorización y cuáles no se exponen en la vista ordinaria.
3. `INFO-AUDIT-INVESTIGATION-EXPLORER-STATE-PROJECTION-001` — proyección visual de categorías auditables, ciclo investigativo, condiciones transversales, tipos investigativos y estados de hallazgo sin crear estados paralelos.
4. `INFO-AUDIT-INVESTIGATION-EXPLORER-BOUNDARY-MATRIX-001` — fronteras entre auditoría empresarial, log técnico, evidencia preservada, investigación, ciclo documental, legal hold, exportación e integraciones posteriores.

Balance materializado:

| Control                                                |     Resultado |
| ------------------------------------------------------ | ------------: |
| Superficies canónicas reutilizadas                     |         **1** |
| Nuevas identidades `VSCREEN-*`                         |         **0** |
| Nuevas rutas canónicas                                 |         **0** |
| Modos lógicos dentro de la superficie                  |         **2** |
| Categorías mínimas de acciones auditables proyectadas  |   **10 / 10** |
| Estados principales de investigación proyectados       |     **9 / 9** |
| Condiciones transversales de investigación proyectadas |     **6 / 6** |
| Tipos investigativos proyectados                       |     **4 / 4** |
| Estados de hallazgo proyectados                        |     **6 / 6** |
| Procesos heredados referenciados                       |   **69 / 69** |
| Identidades documentales heredadas referenciadas       | **332 / 332** |
| Duplicación del inventario heredado                    |         **0** |
| Nuevos estados de negocio                              |         **0** |
| Nuevas capacidades de autorización                     |         **0** |
| Cambios físicos                                        |         **0** |

Los 69 procesos y las 332 identidades `DOCCTX-*` se consumen por referencia a sus matrices canónicas ya aprobadas. Esta tarea no reclasifica, reasigna ni modifica decisiones por identidad; por ello no crea una segunda tabla de 332 filas.

---

#### 3. Entradas canónicas consumidas

El diseño consume sin redefinir:

##### 3.1 Auditoría e investigación

- `INFO-AUDIT-EVENT-CONTRACT-001`;
- `INFO-AUDIT-TRAIL-CONTRACT-001`;
- `INFO-INVESTIGATION-CASE-CONTRACT-001`;
- `INFO-INVESTIGATION-LIFECYCLE-CONTRACT-001`;
- `INFO-INVESTIGATION-EVIDENCE-PRESERVATION-CONTRACT-001`;
- `INFO-INVESTIGATION-FINDING-ACTION-CONTRACT-001`;
- `INFO-INVESTIGATION-CLOSURE-REOPEN-CONTRACT-001`;
- `INFO-AUDIT-INVESTIGATION-MATRIX-001`.

##### 3.2 Autorización reforzada

- `INFO-AUDIT-INVESTIGATION-AUTHORIZATION-CONTRACT-001`;
- `INFO-AUDIT-INDEPENDENCE-SEGREGATION-CONTRACT-001`;
- `INFO-EMERGENCY-INFORMATION-ACCESS-CONTRACT-001`;
- `INFO-PROTECTED-LOG-AUTHORIZATION-CONTRACT-001`;
- `INFO-PRESERVED-EVIDENCE-AUTHORIZATION-CONTRACT-001`;
- `INFO-AUDIT-INVESTIGATION-AUTH-MATRIX-001`.

##### 3.3 Protección transversal

También se conservan las decisiones ya aprobadas sobre:

- clasificación `S0_PUBLIC` a `S4_HIGHLY_RESTRICTED`;
- finalidad, identidad, actor efectivo, relación, recurso, territorio, estado y política de campos;
- minimización y protección diferenciada de consulta, copia, impresión, exportación y compartición;
- segregación de retención, legal hold, disposición y eliminación;
- prevalencia de preservación, retención y legal hold cuando protejan material relevante;
- propiedad funcional de VISO como superficie administrativa de cumplimiento, investigación y supervisión.

Ninguna vista, filtro, pestaña, modal, URL futura o control de interfaz se interpreta como fuente de autoridad.

---

#### 4. Superficie canónica y modos lógicos

El explorador se materializa dentro de `VSCREEN-0122 — Privacidad, cumplimiento y conservación`, superficie `CANONICAL` de VISO ya vinculada con gobierno de información.

La tarea crea **0** pantallas y **0** rutas nuevas.

Dentro de la superficie existen dos modos lógicos subordinados:

1. **Auditoría** — búsqueda, filtrado, correlación y detalle autorizado de eventos de auditoría empresarial.
2. **Investigaciones** — búsqueda y exploración de casos formales, preservación, cronología, elementos investigativos, acciones, cierre y reapertura.

Estos modos no reciben identidad `VSCREEN-*` propia y no se convierten en aplicaciones, registros maestros ni autoridades separadas.

La navegación interna debe conservar el contexto autorizado, pero cada cambio de recurso, caso, detalle sensible o evidencia exige revalidar la decisión aplicable.

---

#### 5. Distinciones que la interfaz debe preservar

La experiencia muestra de forma explícita que:

```text
EVENTO DE AUDITORÍA
≠ LOG TÉCNICO
≠ EVENTO DE DOMINIO
≠ COMANDO
≠ EVIDENCIA PRESERVADA
≠ CASO DE INVESTIGACIÓN
```

También conserva:

```text
LEER AUDITORÍA
≠ BUSCAR AUDITORÍA
≠ CORRELACIONAR AUDITORÍA
≠ EXPORTAR AUDITORÍA
≠ ADMINISTRAR AUDITORÍA
≠ LEER EVIDENCIA
≠ PRESERVAR EVIDENCIA
≠ LIBERAR EVIDENCIA
≠ CERRAR INVESTIGACIÓN
```

Reglas:

1. un evento puede referenciar un log sin convertirse en ese log;
2. una investigación puede referenciar eventos sin absorber ni reescribir su identidad;
3. una evidencia preservada puede originarse en una fuente auditable sin convertir la vista de auditoría en un repositorio de evidencia;
4. un evento técnico no se presenta como hecho empresarial sin correlación suficiente;
5. una coincidencia temporal no se presenta como causalidad;
6. una persona con administración sobre un sistema no hereda por ello acceso a su auditoría;
7. la capacidad de consultar no concede exportar, copiar, imprimir, compartir, preservar, liberar ni destruir.

---

#### 6. Contrato `INFO-AUDIT-INVESTIGATION-EXPLORER-UX-CONTRACT-001`

Cada renderizado del explorador deberá resolverse conceptualmente como:

```text
actor efectivo
+ capacidad exacta
+ finalidad vigente
+ alcance autorizado
+ objeto exacto
+ clasificación efectiva
+ relación aplicable
+ proceso y territorio compatibles
+ estado vigente
+ independencia investigativa
+ política de campos
+ filtros solicitados
→ proyección mínima autorizada
```

Si una dimensión obligatoria no puede resolverse, la interfaz no completa el dato por inferencia.

El explorador opera bajo cuatro reglas:

1. **fail closed de visibilidad:** lo no autorizado no se muestra;
2. **minimización:** el permiso sobre un recurso no implica visibilidad de todos sus campos;
3. **reautorización por profundidad:** abrir más detalle exige evaluar de nuevo la acción y el objeto;
4. **no inferencia:** la interfaz no revela indirectamente la existencia de recursos ocultos mediante conteos, filtros, autocompletado, errores o diferencias de respuesta.

---

#### 7. Entrada y estado inicial

La superficie no abre por defecto un feed global de auditoría ni una lista irrestricta de investigaciones.

Estado inicial permitido:

- contexto de alcance efectivo, cuando pueda representarse sin revelar información no autorizada;
- selector de modo `Auditoría` / `Investigaciones`;
- filtros disponibles derivados únicamente del universo visible;
- casos asignados o accesos recientes solo cuando su fuente y autorización permitan presentarlos;
- orientación breve sobre qué puede buscarse.

Si no existe un alcance inicial demostrable, la experiencia solicita una intención de búsqueda o selección de contexto antes de cargar resultados.

Queda prohibido:

- precargar todos los eventos recientes por conveniencia;
- mostrar conteos globales antes de autorización;
- sugerir nombres, recursos, personas o casos ocultos;
- recordar automáticamente un detalle sensible anterior como nuevo alcance.

---

#### 8. Búsqueda autorizada

Toda búsqueda se evalúa antes de devolver resultados.

La intención de búsqueda puede combinar, según el modo y la autorización:

##### 8.1 Auditoría

- identificador estable de evento;
- proceso `VPROC-*`;
- categoría `action_code`;
- resultado de acción;
- recurso o tipo de recurso;
- intervalo temporal;
- referencia de caso o investigación;
- actor efectivo o principal cuando la política permita buscar por esa dimensión;
- servicio o principal técnico cuando aplique;
- acceso de emergencia;
- acción de proveedor o cuenta técnica.

##### 8.2 Investigaciones

- `investigation_case_id`;
- estado principal;
- condición transversal;
- proceso afectado;
- referencia de caso origen;
- propietario de investigación cuando sea visible;
- autoridad de cierre cuando sea visible;
- intervalo de apertura;
- presencia de legal hold;
- presencia de conflicto;
- referencia de recurso cuando la relación y finalidad permitan buscar por él.

Reglas comunes:

1. cada filtro reduce el universo; nunca amplía autoridad;
2. las opciones de filtro se calculan después de autorización;
3. un valor de filtro oculto no aparece en autocompletado, chips, totales ni sugerencias;
4. búsqueda por identificador directo no confirma si un recurso inexistente y uno no autorizado son casos distintos;
5. una búsqueda vacía no equivale a mostrar todo;
6. el texto libre no debe convertirse en búsqueda indiscriminada sobre payloads sensibles o logs completos;
7. la aplicación de filtros queda separada de cualquier mutación de estado.

---

#### 9. Resultados de auditoría

La lista inicial de auditoría presenta únicamente una proyección mínima autorizada.

Columnas conceptuales:

- referencia estable del evento;
- tiempo de referencia cuando la fuente pueda aportarlo con calidad suficiente;
- categoría auditable;
- resultado tipado;
- proceso;
- tipo de recurso;
- referencia de recurso minimizada cuando esté autorizada;
- actor o principal con el nivel de identificación permitido;
- vínculo con investigación cuando el actor pueda conocer el caso;
- indicador de acceso de emergencia cuando aplique y pueda mostrarse;
- disponibilidad de detalle adicional.

No se presenta por defecto:

- payload completo;
- valores antes/después completos;
- logs técnicos completos;
- secretos;
- tokens;
- credenciales;
- datos personales no necesarios;
- IP, dispositivo, sede o área si la finalidad no los necesita;
- contenido de evidencia preservada;
- información de otros recursos solo porque compartan correlación técnica.

El total de resultados se calcula únicamente sobre el universo autorizado. Si la infraestructura futura no puede garantizar un conteo no revelador, la interfaz usa paginación o continuidad sin declarar un total global.

---

#### 10. Catálogo de acciones auditables proyectado

La experiencia conserva las diez categorías mínimas canónicas:

| Código canónico                      | Etiqueta de interfaz                | Presentación mínima                                    |
| ------------------------------------ | ----------------------------------- | ------------------------------------------------------ |
| `AUDIT_AUTH_DECISION`                | Decisión de autorización            | resultado y referencias de decisión autorizadas        |
| `AUDIT_SENSITIVE_ACCESS`             | Acceso o consulta sensible          | alcance y resultado minimizados                        |
| `AUDIT_EXTRACTION`                   | Extracción, impresión o exportación | tipo de salida, alcance y resultado                    |
| `AUDIT_CONTENT_OR_METADATA_CHANGE`   | Cambio de contenido o metadatos     | recurso, versión y existencia de cambio                |
| `AUDIT_APPROVAL_OR_SIGNATURE`        | Aprobación o firma                  | acto, versión y resultado                              |
| `AUDIT_SHARING`                      | Compartición o divulgación          | tipo de divulgación y resultado                        |
| `AUDIT_CLASSIFICATION_CHANGE`        | Cambio de clasificación             | existencia del cambio y clases cuando puedan revelarse |
| `AUDIT_RETENTION_HOLD_DISPOSITION`   | Retención, legal hold o disposición | tipo de decisión y resultado                           |
| `AUDIT_EMERGENCY_ACCESS`             | Acceso de emergencia                | condición excepcional, alcance y vigencia autorizados  |
| `AUDIT_TECHNICAL_OR_PROVIDER_ACTION` | Acción técnica o de proveedor       | principal técnico, alcance y resultado autorizados     |

La etiqueta humana no sustituye `action_code`. Las especializaciones de dominio se muestran subordinadas a su categoría canónica cuando la fuente pueda resolver la equivalencia.


---

#### 11. Detalle de evento de auditoría

Abrir un evento no implica revelar todo su registro.

La vista se organiza en regiones:

1. **Identidad del evento** — `audit_event_id`, versión de contrato y referencias permitidas.
2. **Qué ocurrió** — categoría, acción y resultado.
3. **Dónde aplica** — proceso, instancia y recurso en la medida autorizada.
4. **Quién intervino** — principal, actor efectivo, servicio, simulación y dispositivo únicamente según necesidad.
5. **Contexto** — finalidad, autorización, territorio, sede, área u otras dimensiones solo si son pertinentes y visibles.
6. **Correlaciones** — eventos, caso, investigación, evidencia o fuente relacionados sin fusionar identidades.
7. **Trazabilidad de corrección** — referencias a eventos posteriores cuando exista una corrección no destructiva.

La interfaz nunca presenta la modificación del registro histórico como una acción ordinaria. Una corrección empresarial válida se representa mediante nuevas referencias o eventos vinculados conforme al contrato de dominio.

---

#### 12. Correlación y línea temporal de auditoría

La correlación visual conserva identidades separadas.

Reglas:

1. cada evento mantiene su `audit_event_id`;
2. agrupar eventos no crea un evento compuesto autoritativo;
3. fuentes distintas muestran procedencia diferenciable;
4. timestamps con calidad, zona o reloj no reconciliados no se ordenan como causalidad segura;
5. cuando el orden no sea demostrable, la interfaz indica **secuencia no concluyente**;
6. un vínculo explícito de correlación se diferencia de una proximidad temporal;
7. el mismo recurso en dos eventos no implica que uno haya causado el otro;
8. eventos ocultos por autorización no se representan con huecos, cantidades ni pistas que revelen su existencia;
9. una vista gráfica, si se implementa después, deberá tener equivalente textual y no crear relaciones nuevas;
10. la corrección no destructiva conserva el evento original y la referencia del evento posterior.

---

#### 13. Modo Investigaciones

La lista de investigaciones muestra una proyección mínima por caso.

Campos visibles cuando estén autorizados:

- `investigation_case_id`;
- estado principal;
- condiciones transversales visibles;
- `opened_at`;
- `trigger_ref` minimizado;
- `source_case_ref` cuando pueda conocerse;
- resumen de alcance;
- propietario de investigación;
- autoridad de cierre;
- presencia de conflicto;
- presencia de legal hold;
- señal de acción requerida derivada de los estados canónicos.

No se exponen por defecto:

- identidad completa del sujeto investigado;
- contenido de denuncia o reclamo;
- hipótesis;
- detalles de hallazgos;
- evidencia;
- logs;
- datos de testigos;
- información disciplinaria o sensible;
- secretos o credenciales;
- razón de una restricción cuando esa razón revele un hecho oculto.

---

#### 14. Espacio de investigación

Abrir un caso autorizado presenta siete regiones coherentes:

1. **Resumen del caso**;
2. **Alcance**;
3. **Fuentes y preservación**;
4. **Cronología**;
5. **Hechos, hipótesis, hallazgos y limitaciones**;
6. **Acciones y controles**;
7. **Cierre y reapertura**.

La navegación entre regiones no aumenta autoridad. Cada región aplica su propia proyección de campos.

El encabezado conserva de forma persistente, si son visibles:

- identificador del caso;
- estado principal;
- condiciones de control;
- propietario;
- autoridad de cierre;
- alcance resumido;
- indicador de conflicto;
- indicador de legal hold;
- referencia temporal del caso.

---

#### 15. Proyección del ciclo de investigación

La experiencia usa los nueve estados principales canónicos sin renombrarlos como estados nuevos:

| Estado canónico   | Etiqueta humana         | Significado visual                                      |
| ----------------- | ----------------------- | ------------------------------------------------------- |
| `TRIGGERED`       | Disparada               | existe un disparador que requiere control inicial       |
| `TRIAGE`          | En evaluación inicial   | se delimita necesidad y tratamiento inicial             |
| `PRESERVATION`    | Preservando fuentes     | se protege material relevante antes de cambios          |
| `SCOPE_DEFINED`   | Alcance definido        | el alcance formal está establecido                      |
| `INVESTIGATING`   | En investigación        | se analizan fuentes y hechos dentro del alcance         |
| `FINDINGS`        | Hallazgos               | se consolidan conclusiones y limitaciones               |
| `ACTION_TRACKING` | Seguimiento de acciones | se controlan contención y acciones correctivas          |
| `CLOSURE_REVIEW`  | Revisión de cierre      | se verifica independencia y suficiencia antes de cerrar |
| `CLOSED`          | Cerrada                 | existe cierre formal conforme al contrato               |

La interfaz puede presentar una línea de progreso, pero no asume que todos los estados anteriores tuvieron la misma duración ni que el caso avanzó sin reaperturas o condiciones transversales.

---

#### 16. Condiciones transversales de investigación

Las seis condiciones canónicas se representan separadas del estado principal:

| Condición               | Etiqueta de interfaz       | Efecto visual                                                          |
| ----------------------- | -------------------------- | ---------------------------------------------------------------------- |
| `PRESERVATION_PENDING`  | Preservación pendiente     | alerta de bloqueo antes de correcciones que puedan alterar fuentes     |
| `EVIDENCE_INCOMPLETE`   | Evidencia incompleta       | indica que faltan elementos materiales y evita conclusiones falsas     |
| `CONFLICT_REASSIGNMENT` | Reasignación por conflicto | muestra que existe conflicto que exige independencia suficiente        |
| `EXTERNAL_DEPENDENCY`   | Dependencia externa        | identifica dependencia de tercero, autoridad o fuente externa          |
| `LEGAL_HOLD_ACTIVE`     | Legal hold activo          | indica protección frente a liberación o disposición incompatible       |
| `REOPENED`              | Reabierta                  | muestra que existe una transición posterior vinculada al cierre previo |

Estas condiciones no se convierten en filtros globales antes de aplicar autorización.

---

#### 17. Preservación antes de corrección

Cuando el caso o evento indique `PRESERVATION_PENDING`, la interfaz debe:

1. mostrar el bloqueo de forma prominente a quien esté autorizado a conocerlo;
2. impedir que una acción local del explorador se presente como corrección segura;
3. dirigir a la superficie o acción propietaria autorizada cuando exista;
4. distinguir **preservar fuente** de **leer evidencia preservada**;
5. distinguir **preservar** de **copiar**, **transferir**, **liberar** o **disponer** evidencia;
6. mantener visible que legal hold y retención pueden prevalecer sobre disposición;
7. no permitir que una persona implicada reduzca o libere evidencia por el solo hecho de tener acceso al caso.

La ausencia de una fuente se muestra como ausencia documentada o evidencia incompleta cuando así lo determine el caso; nunca se rellena con una inferencia.

---

#### 18. Vista de fuentes y evidencia preservada

La región de preservación lista únicamente referencias y metadatos autorizados.

Puede proyectar, según disponibilidad y permiso:

- `preservation_manifest_id`;
- `investigation_case_id`;
- `source_ref`;
- `source_type`;
- `source_system`;
- `source_version`;
- `acquired_at`;
- estado o condición de preservación derivada de la fuente;
- referencia de custodia o integridad cuando el contrato propietario la aporte y la política permita mostrarla.

Por defecto no abre el contenido preservado.

Abrir contenido, copiarlo, transferirlo, liberarlo o disponerlo son acciones distintas y requieren una decisión independiente. La existencia del manifiesto no concede acceso al contenido.

Si la evidencia contiene información más sensible que el contexto visible, prevalece la protección más restrictiva aplicable.

---

#### 19. Logs protegidos

Los logs técnicos, operativos y de seguridad no se mezclan con auditoría empresarial.

La experiencia:

1. etiqueta la naturaleza de la fuente;
2. muestra únicamente el fragmento o metadato necesario para la finalidad autorizada;
3. no incluye secretos, credenciales o tokens en la vista ordinaria;
4. no presupone que un usuario autorizado a un evento empresarial puede leer el log técnico asociado;
5. no presupone que administración de infraestructura concede lectura, búsqueda o exportación de logs;
6. conserva referencia a la fuente sin copiar el log completo al expediente visual;
7. exige una nueva evaluación antes de abrir detalle protegido;
8. evita que el mensaje de error revele si existe un log que el actor no puede conocer.

La integración física con SIEM u observabilidad queda fuera de esta tarea.

---

#### 20. Hechos, hipótesis, hallazgos y limitaciones

La región investigativa mantiene los cuatro tipos canónicos:

| Tipo         | Etiqueta   | Regla visual                                                        |
| ------------ | ---------- | ------------------------------------------------------------------- |
| `FACT`       | Hecho      | se presenta como hecho solo cuando existe fuente identificada       |
| `HYPOTHESIS` | Hipótesis  | se marca siempre como explicación por comprobar                     |
| `FINDING`    | Hallazgo   | conserva soporte, alcance y nivel de confianza que provea la fuente |
| `LIMITATION` | Limitación | declara lo que no puede resolverse con la evidencia disponible      |

Los seis estados de hallazgo se proyectan sin reinterpretación:

- `SUBSTANTIATED`;
- `NOT_SUBSTANTIATED`;
- `INCONCLUSIVE`;
- `CONTROL_GAP`;
- `NO_SCOPE_MATCH`;
- `REFERRED_TO_OTHER_CASE`.

Reglas:

1. color nunca es el único diferenciador;
2. una hipótesis no puede aparecer visualmente como hecho confirmado;
3. una limitación no se oculta para hacer parecer concluyente el caso;
4. un hallazgo referido a otro caso mantiene la referencia sin fusionar expedientes;
5. la interfaz no calcula un porcentaje de culpabilidad ni una puntuación de certeza no definida por la fuente.


---

#### 21. Cierre y reapertura

La región de cierre presenta una comprobación explícita de los criterios canónicos sin crear una autoridad local.

Debe permitir visualizar, cuando la fuente pueda resolverlo:

- reconciliación del alcance y justificación de exclusiones;
- preservación de fuentes relevantes o ausencia explícita;
- calidad y conflictos de la cronología;
- identificación o indeterminación explícita de actores, recursos, dispositivos y principales;
- separación entre hechos, hipótesis, hallazgos y limitaciones;
- seguimiento de acciones requeridas;
- conflictos de interés;
- autoridad independiente de cierre.

La intención de cerrar solo se presenta cuando:

```text
capacidad de cierre autorizada
+ independencia suficiente
+ ausencia de conflicto bloqueante
+ criterios de cierre resolubles
+ estado compatible
→ acción de cierre disponible
```

El explorador no convierte el botón de cierre en autoridad.

Al reabrir:

1. el cierre anterior permanece histórico;
2. se crea o referencia una transición nueva y vinculada;
3. la nueva evidencia, contradicción o fallo de acción no sobrescribe la justificación anterior;
4. la interfaz distingue claramente **cerrada** de **reabierta**.

---

#### 22. Independencia y conflicto de interés

La experiencia diferencia, cuando sean visibles:

- sujeto o actor investigado;
- propietario de investigación;
- investigador;
- custodio de evidencia;
- revisor;
- autoridad de cierre.

Reglas:

1. estar implicado en el hecho investigado no concede autoridad sobre el caso;
2. el actor implicado no puede aprobar su propio cierre;
3. una persona que administra el sistema origen no obtiene por ello autoridad para alterar auditoría o evidencia;
4. `CONFLICT_REASSIGNMENT` bloquea el cierre hasta contar con independencia suficiente;
5. una restricción de acceso por conflicto no debe revelar más detalle del conflicto del que el actor pueda conocer;
6. la UI no ofrece controles destructivos para limpiar, ocultar o corregir la historia;
7. revocar acceso futuro a una persona no elimina su identidad histórica del caso o de la auditoría.

---

#### 23. Acceso de emergencia

Los eventos de acceso de emergencia se presentan como categoría excepcional, nunca como acceso ordinario.

Cuando el actor pueda ver el detalle, la experiencia diferencia:

- justificación;
- actor efectivo;
- alcance;
- recurso;
- ventana o duración;
- resultado;
- revisión posterior;
- referencias relacionadas.

Reglas:

1. la emergencia no convierte todas las capacidades en disponibles;
2. el fin de la emergencia no borra su trazabilidad;
3. finalizar la emergencia no autoriza disposición, eliminación, cierre ni liberación de hold;
4. una denegación absoluta por integridad, preservación o conflicto no se convierte en permiso solo por existir emergencia;
5. credenciales, secretos, cuentas de contingencia y mecanismos físicos de break-glass no forman parte de este explorador.

---

#### 24. `INFO-AUDIT-INVESTIGATION-PROGRESSIVE-DISCLOSURE-MATRIX-001`

La divulgación progresiva es un patrón de presentación, no una jerarquía de permisos. Cada apertura vuelve a evaluar autoridad sobre el objeto y los campos solicitados.

| Etapa visual                    | Contenido permitido                                                           | Condición mínima                                            | Prohibición                                                    |
| ------------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------- | -------------------------------------------------------------- |
| **Resumen autorizado**          | existencia visible, identidad minimizada, categoría/estado y contexto mínimo  | derecho a conocer el recurso o caso dentro del alcance      | no revela payload, evidencia, log completo ni campos sensibles |
| **Contexto autorizado**         | proceso, recurso minimizado, correlaciones, alcance, cronología resumida      | autorización sobre contexto y finalidad compatible          | no hereda acceso a identidades sensibles o contenido           |
| **Detalle sensible autorizado** | actor, recurso exacto, valores o metadatos sensibles estrictamente necesarios | decisión específica sobre campos, finalidad y relación      | no hereda exportación, copia, evidencia ni administración      |
| **Evidencia o log protegido**   | metadatos y contenido estrictamente permitido de la fuente preservada o log   | capacidad independiente sobre evidencia/log y objeto exacto | no concede transferencia, liberación, disposición ni cierre    |

Invariantes:

1. las etapas no son estados persistentes;
2. una etapa no concede automáticamente la siguiente;
3. el detalle puede ser parcial por campo;
4. una región puede permanecer bloqueada aunque otra más general esté disponible;
5. si la autorización expira, el contenido sensible deja de mostrarse y se exige una nueva evaluación;
6. el sistema no conserva un desbloqueo global por haber abierto un detalle previamente;
7. el motivo o finalidad, cuando el contrato lo exija, debe provenir de la decisión gobernada y no de texto libre usado como sustituto de autoridad.

---

#### 25. Matriz de grupos de información y exposición

| Grupo                           | Por defecto                                       | Apertura adicional             | Regla                                               |
| ------------------------------- | ------------------------------------------------- | ------------------------------ | --------------------------------------------------- |
| identificador de evento o caso  | minimizado si la existencia es visible            | no necesariamente              | no confirma existencia a actores no autorizados     |
| categoría auditable             | visible si el evento es visible                   | no                             | usa catálogo canónico                               |
| estado de investigación         | visible si el caso es visible                     | no                             | no expone contenido del caso                        |
| condiciones transversales       | visibles según política                           | no o parcial                   | no revelan motivo sensible no autorizado            |
| proceso y tipo de recurso       | minimizados                                       | sí, para detalle exacto        | el tipo no concede acceso al recurso                |
| `resource_id` exacto            | oculto o minimizado                               | sí                             | requiere objeto y relación autorizados              |
| actor efectivo                  | oculto, seudonimizado o minimizado según política | sí                             | identidad no se revela solo por conocer el evento   |
| principal técnico/servicio      | minimizado                                        | sí                             | se diferencia del actor humano                      |
| dispositivo, sede, área         | no por defecto                                    | sí                             | solo si la finalidad investigativa lo necesita      |
| valores antes/después           | no por defecto                                    | sí                             | mostrar solo campos necesarios; no payload completo |
| hipótesis y hallazgos           | no en lista general                               | sí dentro del caso             | conservan tipo y estado                             |
| evidencia preservada            | solo referencia/metadatos mínimos                 | sí mediante capacidad separada | preservar no equivale a leer                        |
| log técnico                     | solo referencia                                   | sí mediante capacidad separada | auditoría no equivale a log                         |
| secretos, tokens y credenciales | no                                                | no en vista ordinaria          | nunca se convierten en detalle rutinario            |
| exportación                     | no como consecuencia de lectura                   | acción separada                | aplica protección de salida                         |

---

#### 26. Acciones de interfaz

| Acción                                 | Resultado permitido                                               | Decisión                         |
| -------------------------------------- | ----------------------------------------------------------------- | -------------------------------- |
| buscar                                 | consultar un universo autorizado                                  | no muta estados                  |
| filtrar                                | reducir resultados autorizados                                    | no amplía alcance                |
| ordenar                                | reorganizar resultados visibles                                   | no altera cronología fuente      |
| abrir evento                           | mostrar proyección autorizada                                     | reevalúa campos                  |
| abrir investigación                    | mostrar espacio del caso                                          | reevalúa caso y relación         |
| expandir contexto                      | revelar detalle adicional permitido                               | no crea autoridad                |
| abrir evidencia                        | acceder a fuente protegida si existe capacidad independiente      | no hereda desde el caso          |
| abrir log protegido                    | acceder a detalle mínimo si existe capacidad independiente        | no hereda desde auditoría        |
| correlacionar visualmente              | presentar referencias ya soportadas                               | no crea causalidad               |
| exportar                               | producir salida solo si existe autorización específica            | no hereda desde lectura          |
| cerrar investigación                   | ejecutar únicamente mediante capacidad y autoridad independientes | no hereda desde ser investigador |
| reabrir investigación                  | registrar transición vinculada cuando esté autorizada             | no sobrescribe cierre            |
| eliminar u ocultar auditoría histórica | no disponible como acción ordinaria                               | prohibido                        |
| sobrescribir evidencia preservada      | no disponible                                                     | prohibido                        |

---

#### 27. Estados de experiencia y recuperación

La interfaz materializa los siguientes estados visuales sin crear estados de negocio:

##### 27.1 Cargando alcance

- no presenta datos de una sesión o consulta anterior;
- evita placeholders que parezcan resultados reales;
- anuncia que la autorización y el alcance están resolviéndose.

##### 27.2 Sin resultados autorizados

Mensaje base: **No hay resultados disponibles para los filtros y el alcance actuales.**

No diferencia entre no existe y existe pero no puede conocerlo cuando esa distinción filtraría información.

##### 27.3 Recurso no disponible

Para enlaces directos, identificadores o referencias que no pueden resolverse de forma visible:

**El recurso no está disponible para el alcance actual.**

No confirma causa interna si esa causa revela existencia o clasificación.

##### 27.4 Fuente parcial

Cuando una fuente autorizada está temporalmente incompleta:

- se muestran solo regiones verificables;
- las regiones afectadas se marcan **No disponible**;
- no se representa ausencia como `0`;
- no se infieren estados a partir de una fuente faltante.

##### 27.5 Autorización vencida o revocada

- se retira el detalle sensible;
- se conserva únicamente el contexto que siga autorizado;
- una acción en curso no se ejecuta con una decisión obsoleta;
- la persona puede reintentar la evaluación si la experiencia futura lo soporta.

##### 27.6 Registro cambiado durante la consulta

Si la fuente informa una versión o estado diferente al abierto:

- se muestra que el registro cambió;
- se evita ejecutar una acción sobre una representación obsoleta;
- se solicita recargar o reconciliar antes de actuar.

##### 27.7 Error de fuente

El error de una fuente no se convierte en sin eventos, sin evidencia o caso limpio. La interfaz comunica indisponibilidad sin exponer detalles técnicos innecesarios.

---

#### 28. Navegación y deep links

Reglas:

1. un enlace desde el tablero de gobierno puede transportar una referencia opaca, pero abrir el destino exige nueva evaluación;
2. una referencia desde retención o legal hold no concede lectura de investigación ni evidencia;
3. una referencia desde una investigación a un evento no concede acceso a todos los eventos correlacionados;
4. una URL futura no debe incluir payloads, secretos, nombres sensibles, razones investigativas ni evidencia;
5. parámetros de filtro no son autoridad;
6. bookmarks no congelan autorización;
7. volver atrás no debe restaurar visualmente detalle sensible si la decisión ya no es vigente;
8. notificaciones o alertas externas solo podrán incluir el mínimo necesario y deberán volver a autorizar al abrir.

---

#### 29. Exportación, copia e impresión

El explorador trata toda salida como acción independiente.

Una eventual exportación deberá resolver, según contrato:

- actor;
- finalidad;
- alcance;
- filtros;
- periodo;
- campos;
- cantidad;
- formato;
- clasificación;
- destino;
- destinatario cuando aplique;
- resultado.

Reglas:

1. `READ` o equivalente no implica `EXPORT`;
2. el conjunto exportado nunca puede exceder la población y campos autorizados;
3. una vista filtrada no convierte automáticamente ese filtro en autorización de copia;
4. el nombre de archivo futuro no debe filtrar información sensible innecesaria;
5. una exportación de auditoría conserva la protección de su fuente;
6. la copia de evidencia preservada se gobierna además por la autoridad específica sobre evidencia;
7. si la autorización de salida no puede resolverse, el control no se ofrece o produce denegación segura.

---

#### 30. Minimización, privacidad y no inferencia

La experiencia aplica:

- contenido sensible oculto por defecto;
- identificación progresiva de actores;
- masking o reducción de precisión cuando corresponda;
- ausencia de secretos y credenciales en la vista ordinaria;
- no exposición de valores no necesarios en tooltips, títulos, breadcrumbs o mensajes;
- no exposición de casos ocultos mediante autocompletado;
- no exposición de conteos globales antes de autorización;
- no diferenciación observable entre inexistente y no autorizado cuando esa diferencia sea sensible;
- no persistencia conceptual de un desbloqueo global de detalle;
- no reutilización de una finalidad investigativa para analítica, soporte u otra finalidad;
- no presentación de un hash, watermark, sello o canal seguro como prueba de autorización empresarial.

La interfaz no debe permitir que una persona deduzca un caso sensible por la forma de un error, la longitud de una lista, una opción de filtro o una referencia correlacionada oculta.


---

#### 31. Accesibilidad y comprensión

El explorador debe ser operable y comprensible sin depender de color, hover o memoria del usuario.

Requisitos de experiencia:

1. categorías, estados, condiciones y niveles de detalle tienen texto visible;
2. iconos y colores son redundantes con etiquetas;
3. controles de expansión comunican si una región está cerrada, disponible o restringida;
4. navegación por teclado conserva orden lógico;
5. el foco vuelve a una posición predecible al cerrar un detalle;
6. tablas y listas conservan encabezados y relaciones semánticas;
7. la cronología ofrece equivalente textual;
8. timestamps muestran zona o referencia temporal cuando la fuente pueda aportarla;
9. oculto, no disponible, parcial y sin resultados no se representan con el mismo mensaje si la distinción puede hacerse sin filtrar información;
10. una alerta de conflicto, legal hold o preservación no depende solo del color;
11. el detalle sensible nunca se expande automáticamente por recibir foco;
12. lectores de pantalla no reciben texto oculto que el usuario visual no esté autorizado a conocer.

---

#### 32. `INFO-AUDIT-INVESTIGATION-EXPLORER-STATE-PROJECTION-001`

La proyección visual queda cerrada con los siguientes universos:

```text
10 categorías auditables
+
9 estados principales de investigación
+
6 condiciones transversales
+
4 tipos investigativos
+
6 estados de hallazgo
=
35 valores canónicos proyectados sin crear estados de negocio nuevos
```

Reglas de proyección:

1. el código canónico permanece disponible para trazabilidad cuando sea apropiado;
2. la etiqueta humana puede simplificar lenguaje, no significado;
3. una condición transversal no sustituye el estado principal;
4. un tipo investigativo no sustituye el estado del hallazgo;
5. un hallazgo `INCONCLUSIVE` no se presenta como confirmado ni descartado;
6. `REOPENED` no borra `CLOSED`; representa una nueva transición vinculada;
7. `LEGAL_HOLD_ACTIVE` no se interpreta como culpabilidad, incumplimiento o hallazgo;
8. `PRESERVATION_PENDING` no se interpreta como pérdida probada de evidencia;
9. `AUDIT_EMERGENCY_ACCESS` no implica que el acceso haya sido legítimo o ilegítimo por sí solo; el resultado y la autorización deben conservarse separados.

---

#### 33. `INFO-AUDIT-INVESTIGATION-EXPLORER-BOUNDARY-MATRIX-001`

| Frontera               | Este explorador hace                                         | Este explorador no hace                                         |
| ---------------------- | ------------------------------------------------------------ | --------------------------------------------------------------- |
| auditoría empresarial  | busca y proyecta eventos autorizados                         | no reemplaza el contrato de evento                              |
| logs técnicos          | muestra referencia y detalle mínimo autorizado               | no se convierte en SIEM ni visor universal de logs              |
| investigación          | explora caso, estado, alcance, evidencia, hallazgos y cierre | no inventa autoridad de investigación                           |
| evidencia preservada   | muestra manifiesto y contenido autorizado                    | no presupone lectura, copia, liberación o disposición           |
| retención / legal hold | proyecta bloqueos y referencias                              | no cambia políticas ni libera holds por inferencia              |
| ciclo documental       | enlaza recursos y versiones autorizados                      | no edita el registro propietario                                |
| autorización           | presenta el resultado de decisiones vigentes                 | no calcula permisos localmente                                  |
| exportación            | ofrece acción solo bajo control separado                     | no deriva exportación desde lectura                             |
| emergencia             | presenta evento y contexto autorizado                        | no administra credenciales de contingencia                      |
| integración futura     | conserva referencias lógicas consumibles                     | no define SIEM, DLP, object storage, email ni otros adaptadores |
| Supabase               | no aplica cambios físicos                                    | no crea tablas, RLS, RPC, funciones, triggers ni migraciones    |
| catálogo de pantallas  | reutiliza `VSCREEN-0122`                                     | no crea ni renumera `VSCREEN-*`                                 |

---

#### 34. Handoff a implementación posterior

Una fase de implementación podrá materializar este diseño solo después de resolver, desde sus fuentes técnicas vigentes:

- rutas físicas existentes;
- componentes y layouts reales;
- contratos de servidor;
- permisos canónicos concretos;
- consultas y paginación;
- fuentes de auditoría;
- fuentes de investigación;
- sistemas de logs;
- almacenamiento de evidencia;
- integraciones;
- política de caché;
- observabilidad;
- pruebas;
- rollback cuando aplique.

Esta tarea no inventa ninguno de esos elementos.

La implementación deberá preservar como mínimo:

```text
AUTH BEFORE QUERY
AUTH BEFORE DETAIL
AUTH BEFORE EVIDENCE
AUTH BEFORE OUTPUT
AUTH BEFORE CASE ACTION
NO DESTRUCTIVE HISTORY EDIT
NO HIDDEN-RESOURCE INFERENCE
```

---

#### 35. Criterios de aceptación materializados

1. [x] Existe un explorador concreto para auditoría e investigaciones dentro de VISO.
2. [x] Se reutiliza `VSCREEN-0122` y se crean 0 pantallas y 0 rutas nuevas.
3. [x] Auditoría e investigaciones se presentan como dos modos lógicos sin crear autoridades paralelas.
4. [x] Los ocho contratos de dominio de auditoría e investigación se consumen sin redefinirlos.
5. [x] Los seis contratos de autorización reforzada se consumen sin redefinirlos.
6. [x] Las diez categorías mínimas de acciones auditables están proyectadas.
7. [x] Los nueve estados principales de investigación están proyectados.
8. [x] Las seis condiciones transversales están proyectadas.
9. [x] Los cuatro tipos `FACT`, `HYPOTHESIS`, `FINDING` y `LIMITATION` permanecen diferenciados.
10. [x] Los seis estados de hallazgo están cubiertos.
11. [x] La vista inicial no abre un feed global irrestricto.
12. [x] Filtros y autocompletado se calculan después de autorización.
13. [x] Búsqueda por referencia directa no filtra la diferencia entre inexistencia y falta de autoridad cuando esa diferencia sea sensible.
14. [x] Un evento de auditoría no se confunde con log, evidencia, comando, evento de dominio o caso investigativo.
15. [x] La correlación conserva identidades y no inventa causalidad.
16. [x] La cronología representa conflictos de tiempo como no concluyentes cuando corresponda.
17. [x] Los logs completos no se exponen por defecto.
18. [x] La evidencia preservada no se abre por el solo hecho de conocer el caso.
19. [x] `PRESERVATION_PENDING` bloquea cualquier presentación de corrección como segura antes de preservar fuentes.
20. [x] Legal hold y retención se respetan como restricciones independientes.
21. [x] La persona implicada no obtiene autoridad para alterar evidencia ni cerrar su propio caso.
22. [x] El cierre exige capacidad, independencia, criterios resolubles y estado compatible.
23. [x] La reapertura conserva el cierre anterior y crea una transición vinculada.
24. [x] El acceso de emergencia permanece visible y trazable sin convertirse en permiso universal.
25. [x] La divulgación progresiva se implementa como evaluación por profundidad y campo, no como permiso acumulativo.
26. [x] Lectura, exportación, copia, impresión y compartición permanecen capacidades distintas.
27. [x] La interfaz no crea estados de negocio nuevos.
28. [x] Los 69 procesos y 332 `DOCCTX-*` se consumen por referencia sin duplicar el inventario.
29. [x] Los estados de carga, vacío, fuente parcial, autorización revocada, recurso no disponible y cambio concurrente están definidos.
30. [x] Accesibilidad, minimización y no inferencia están incorporadas al contrato de experiencia.
31. [x] No se define implementación física, ruta, endpoint, tabla, bucket, RLS, RPC, función, trigger, job o integración.
32. [x] La siguiente tarea queda únicamente reservada.

---

#### 36. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el registro canónico vigente ya protege expresamente la administración segregada de auditorías e investigaciones en VISO, la preservación de fuentes antes de correcciones, la prohibición de cierre propio por una persona implicada y la obligación de no exponer por defecto contenido sensible, logs completos ni datos innecesarios. Esta tarea materializa esas reglas existentes como experiencia de exploración, divulgación progresiva, estados visuales y fronteras de navegación; no introduce un comportamiento verificable nuevo fuera de esa cobertura.

- Requisitos creados: **0**.
- Requisitos modificados: **0**.
- Requisitos diferidos: **0**.
- Requisitos descartados: **0**.
- Requisitos obsoletos: **0**.
- Copia adicional del registro canónico: **no corresponde**.

---

#### 37. Continuidad

**ÚLTIMA TAREA APROBADA**

`INFO-UX-005 — Diseñar retención, legal hold, archivo y disposición controlada`

**TAREA ACTUAL APROBADA**

`INFO-UX-006 — Diseñar explorador de auditoría e investigación con divulgación progresiva`

**SIGUIENTE TAREA RESERVADA**

`INFO-INT-001 — Definir adaptadores de Storage, escaneo, OCR, firma, certificación, preservación y archivo externo`
