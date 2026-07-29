### MINI-BLOQUE — BASE DISEÑO E IDENTIDAD DE PROCESOS

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **base diseño e identidad de procesos** dentro de **E2 PROCESOS Y EXPERIENCIA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `PROC-CAT-001` a `PROC-CAT-003` — 3 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `PROC-CAT-001`: Consolidar el catálogo AS-IS de procesos levantado y aprobado en E1
- `PROC-CAT-002`: Diseñar el proceso TO-BE para capacidades manuales, parciales, rotas o ausentes
- `PROC-CAT-003`: Crear identificador estable para cada proceso
<!-- PLAN-SECTION-META:END -->

### ✅ PROC-CAT-001 — Consolidar el catálogo AS-IS de procesos levantado y aprobado en E1

**Estado:** APROBADA  
**Bloque:** BLOQUE E2 — Arquitectura funcional, procesos y experiencia transversal  
**Dependencia obligatoria:** `E1-GATE-001 — Ejecutar y aprobar la puerta de cierre de BLOQUE E1` — APROBADA  
**Línea base recibida:** operación real, mapa de 18 familias y 217 subcapacidades, actores observados, aplicaciones y medios actuales, matriz de cobertura, inventario técnico y registro canónico de brechas aprobados en E1  
**Naturaleza:** consolidación documental del funcionamiento actual  
**Artefacto producido:** `PROC-ASIS-CATALOG-001` en `01A_PROC_ASIS_CATALOG_001.md`  
**Diseño TO-BE:** no incluido  
**Implementación física:** no incluida  
**Cambios en código, migraciones o Supabase:** no autorizados  
**Siguiente tarea reservada:** `PROC-CAT-002 — Diseñar el proceso TO-BE para capacidades manuales, parciales, rotas o ausentes`

---

#### 1. Propósito

Consolidar en un único catálogo trazable los procesos que actualmente existen en Vento Group, independientemente de que se ejecuten verbalmente, en papel, Excel, WhatsApp, aplicaciones internas, plataformas externas o mediante combinaciones manuales y digitales.

El catálogo describe cómo fluye actualmente el trabajo de principio a fin, sin asumir que esa forma es correcta ni convertirla automáticamente en el proceso objetivo.

```text
EVIDENCIA OPERATIVA DE E1
        ↓
FRAGMENTOS DE TRABAJO ACTUAL
        ↓
CANDIDATOS DE PROCESO AS-IS
        ↓
PROC-ASIS-CATALOG-001
        ↓
DISEÑO TO-BE EN PROC-CAT-002 Y TAREAS POSTERIORES
```

---

#### 2. Resultado obligatorio

La tarea produce:

```text
PROC-ASIS-CATALOG-001
```

El artefacto deberá:

1. reunir los procesos observados en E1;
2. conservar sus variantes reales;
3. identificar su soporte actual;
4. indicar su condición operativa;
5. vincularlos con las capacidades correspondientes;
6. conservar sus fuentes y brechas relacionadas;
7. distinguir procesos de capacidades, actividades, pantallas y documentos;
8. evitar decisiones TO-BE prematuras.

---

#### 3. Distinciones obligatorias

##### 3.1. Capacidad

Resultado estable que Vento Group necesita poder producir.

##### 3.2. Proceso

Secuencia de principio a fin que conecta capacidades, personas, información y decisiones para resolver un caso empresarial.

##### 3.3. Actividad

Paso puntual dentro de un proceso.

##### 3.4. Herramienta o soporte

Medio utilizado para ejecutar o registrar una parte del proceso.

##### 3.5. Documento o evidencia

Registro que demuestra una solicitud, decisión, ejecución, recepción, corrección o cierre.

Una aplicación, pantalla, documento o actividad aislada no constituye por sí sola un proceso.

---

#### 4. Alcance

Incluye procesos actuales de:

1. gobierno y dirección;
2. personas y trabajo;
3. salud, seguridad y cumplimiento;
4. productos, recetas y conocimiento;
5. abastecimiento y proveedores;
6. inventario y almacenamiento;
7. activos y reutilizables;
8. producción;
9. pedidos, ventas y pagos;
10. clientes y fidelización;
11. transporte y entregas;
12. dinero, costos y obligaciones;
13. instalaciones;
14. marketing y desarrollo comercial;
15. tecnología y soporte;
16. información, documentos y evidencia;
17. análisis y mejora;
18. continuidad operativa.

También incluye procesos externos, compartidos entre sedes, parcialmente implementados, informales y manuales.

---

#### 5. Fuentes canónicas

- `OPS-AUD-001` a `OPS-AUD-015`;
- `OPS-ADM-001`;
- `OPS-GOV-001`;
- `OPS-ACT-001`;
- `OPS-PLAN-001` a `OPS-PLAN-004`;
- `CAP-MAP-001` a `CAP-MAP-015`;
- `CODE-AUD-001` a `CODE-AUD-020`;
- `CAP-SCOPE-001` a `CAP-SCOPE-019`;
- `CAP-COVER-001` a `CAP-COVER-012`;
- `GAP-CTRL-001` a `GAP-CTRL-008`;
- `E1-GATE-MANIFEST-001`;
- `E1-GATE-MANIFEST-002`;
- registro vivo incorporado a E1;
- documentación técnica y operativa citada por E1.

Una afirmación no podrá presentarse como proceso confirmado si no tiene una fuente identificable.

---

#### 6. Identificadores provisionales

`PROC-CAT-003` definirá los identificadores estables.

Esta tarea utiliza únicamente:

```text
ASIS-SRC-001
ASIS-SRC-002
ASIS-SRC-003
```

Estas claves:

- sirven para revisión y reconciliación;
- no son identificadores permanentes;
- pueden fusionarse, dividirse o retirarse;
- no deberán utilizarse en código, tablas, permisos, rutas o integraciones;
- serán sustituidas en `PROC-CAT-003`.

---

#### 7. Contrato mínimo de cada candidato

| Campo                      | Contenido                                          |
| -------------------------- | -------------------------------------------------- |
| `source_key`               | Clave provisional                                  |
| `current_name`             | Nombre descriptivo                                 |
| `trigger_observed`         | Hecho que actualmente inicia el trabajo            |
| `current_end_condition`    | Resultado que actualmente se considera final       |
| `capability_refs[]`        | Capacidades relacionadas                           |
| `organizational_scope[]`   | Empresa, marca, sede, área o canal                 |
| `current_participants[]`   | Funciones observadas                               |
| `current_support[]`        | Aplicaciones, plataformas, papel, Excel o mensajes |
| `execution_mode`           | Forma actual de ejecución                          |
| `operational_condition`    | Condición AS-IS                                    |
| `evidence_state`           | Nivel de certeza                                   |
| `known_variants[]`         | Variantes actuales                                 |
| `known_breaks[]`           | Cortes o falta de trazabilidad                     |
| `gap_refs[]`               | Brechas relacionadas                               |
| `source_refs[]`            | Fuentes canónicas                                  |
| `later_definition_tasks[]` | Tareas `PROC-CAT-*` responsables                   |
| `notes`                    | Restricciones o incertidumbres                     |

---

#### 8. Modalidades permitidas

- `MANUAL`;
- `MANUAL_CONTROLADO`;
- `MANUAL_DISTRIBUIDO`;
- `DIGITAL_PARCIAL`;
- `HIBRIDO`;
- `DIGITAL_INTERNO`;
- `EXTERNO`;
- `EXTERNO_CON_CONTINUIDAD_INTERNA`;
- `AUTOMATICO_PARCIAL`;
- `POR_CONFIRMAR`.

---

#### 9. Condiciones AS-IS permitidas

- `OPERATIVO_ESTABLE`;
- `OPERATIVO_CON_VARIANTES`;
- `PARCIAL`;
- `FRAGMENTADO`;
- `INFORMAL`;
- `CONCENTRADO`;
- `EXTERNO_DEPENDIENTE`;
- `TEMPORAL`;
- `ROTO`;
- `POR_CONFIRMAR`.

Estas clasificaciones no establecen el proceso TO-BE.

---

#### 10. Tratamiento de variantes

Una variante permanece en el mismo candidato cuando conserva el mismo inicio, resultado empresarial y contrato general, aunque cambie sede, canal, herramienta o distribución de actividades.

Se mantiene separada cuando cambia materialmente:

- titular jurídico o documental;
- resultado empresarial;
- transferencia de custodia;
- controles;
- estados o excepciones;
- evidencia de cierre.

---

#### 11. Duplicidades y solapamientos

Se registrarán sin resolverlos definitivamente:

```text
POSSIBLE_DUPLICATE
POSSIBLE_SUBPROCESS
POSSIBLE_VARIANT
POSSIBLE_SHARED_STAGE
```

`PROC-CAT-020` decidirá las duplicidades.

---

#### 12. Decisiones reservadas

| Decisión                | Tarea          |
| ----------------------- | -------------- |
| proceso TO-BE           | `PROC-CAT-002` |
| identificador estable   | `PROC-CAT-003` |
| propósito empresarial   | `PROC-CAT-004` |
| aplicación propietaria  | `PROC-CAT-005` |
| consumidoras            | `PROC-CAT-006` |
| actor iniciador         | `PROC-CAT-007` |
| actores continuadores   | `PROC-CAT-008` |
| estado inicial          | `PROC-CAT-009` |
| estados intermedios     | `PROC-CAT-010` |
| estado final            | `PROC-CAT-011` |
| transiciones            | `PROC-CAT-012` |
| excepciones             | `PROC-CAT-013` |
| cancelación y reversión | `PROC-CAT-014` |
| entradas                | `PROC-CAT-015` |
| salidas                 | `PROC-CAT-016` |
| eventos                 | `PROC-CAT-017` |
| auditoría               | `PROC-CAT-018` |
| métricas                | `PROC-CAT-019` |
| duplicidades            | `PROC-CAT-020` |

---

#### 13. Relación con brechas

La consolidación no cierra brechas.

```text
PROCESO AS-IS
→ EXPLICA DÓNDE OCURRE LA BRECHA

BRECHA
→ EXPLICA QUÉ PARTE DEL PROCESO REQUIERE CORRECCIÓN
```

Toda brecha nueva deberá vincularse de inmediato con una tarea existente o generar una tarea explícita.

---

#### 14. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA NUEVOS.

**Justificación:** consolida evidencia AS-IS; no define comportamiento objetivo, estados contractuales, transiciones, cálculos, autorización o integración.

---

#### 15. Criterios de aceptación

- [ ] `E1-GATE-001` figura aprobada.
- [ ] BLOQUE E1 figura cerrado.
- [ ] Existe un único `PROC-ASIS-CATALOG-001`.
- [ ] Cada candidato tiene fuente verificable.
- [ ] Capacidad, proceso, actividad, soporte y evidencia están diferenciados.
- [ ] Se conservan procesos manuales, externos, informales y parciales.
- [ ] Las variantes relevantes están identificadas.
- [ ] Las posibles duplicidades están registradas.
- [ ] Cada candidato está vinculado con capacidades y brechas aplicables.
- [ ] No se crearon identificadores estables antes de `PROC-CAT-003`.
- [ ] No se diseñó el TO-BE.
- [ ] No se decidieron aplicaciones, actores, estados, transiciones, datos, eventos, auditoría o métricas fuera de sus tareas.
- [ ] No se modificó código, Supabase, migraciones ni operación.
- [ ] Toda duda material tiene tarea responsable.
- [ ] El compilado y el registro global permanecen sincronizados.

---

#### 16. Estado

```text
APROBADO
```

No se inicia `PROC-CAT-002` hasta la aprobación expresa de `PROC-CAT-001`.

### ✅ PROC-CAT-002 — Diseñar el proceso TO-BE para capacidades manuales, parciales, rotas o ausentes

**Estado:** APROBADO  
**Bloque:** BLOQUE E2 — Arquitectura funcional, procesos y experiencia transversal  
**Dependencias obligatorias:** `E1-GATE-001` — APROBADA; `PROC-CAT-001` — APROBADA  
**Línea base recibida:** `PROC-ASIS-CATALOG-001`, mapa de 18 familias y 217 subcapacidades, matriz de cobertura, inventario técnico y registro canónico de brechas de E1  
**Naturaleza:** diseño funcional objetivo de procesos, sin implementación  
**Artefacto producido:** `PROC-TOBE-DESIGN-001`  
**Identificadores de proceso:** provisionales hasta `PROC-CAT-003`  
**Cambios en código, migraciones o Supabase:** no autorizados  
**Siguiente tarea reservada:** `PROC-CAT-003 — Crear identificador estable para cada proceso`

---

#### 1. Propósito

Diseñar la forma objetivo en que Vento Group deberá ejecutar las capacidades que actualmente son manuales, parciales, fragmentadas, informales, rotas, dependientes de terceros o todavía ausentes.

La tarea no digitaliza automáticamente el AS-IS ni presupone que todo proceso deba convertirse en software propio.

```text
CAPACIDAD APROBADA
        +
PROCESO AS-IS O AUSENCIA CONFIRMADA
        +
BRECHAS Y RIESGOS
        ↓
TRATAMIENTO OBJETIVO
        ↓
DISEÑO TO-BE PROVISIONAL
        ↓
CONTRATO COMPLETO EN PROC-CAT-003 A PROC-CAT-020
```

---

#### 2. Resultado obligatorio

La tarea produce:

```text
PROC-TOBE-DESIGN-001
```

El artefacto deberá:

1. asignar un tratamiento objetivo a cada candidato AS-IS;
2. definir la frontera funcional y el resultado objetivo de cada proceso;
3. cubrir capacidades aprobadas sin precursor AS-IS explícito;
4. separar proceso humano, proceso digital, autoridad externa y automatización;
5. conservar continuidad mientras el TO-BE no esté implementado;
6. prohibir que infraestructura parcial se presente como proceso completo;
7. dejar todas las decisiones posteriores vinculadas con tareas exactas;
8. no crear identificadores estables, pantallas, permisos, estados ni estructuras físicas antes de sus tareas propietarias.

---

#### 3. Decisiones normativas

##### 3.1. El TO-BE describe el resultado empresarial, no la interfaz

Una pantalla, tabla, ruta, formulario, bot, mensaje o documento podrá soportar el proceso, pero no lo define por sí solo.

##### 3.2. Manual no significa defectuoso

Un proceso podrá permanecer manual cuando la actividad sea física, profesional, creativa, de emergencia o dependa legítimamente de juicio humano.

Para ser aceptable deberá convertirse en `MANUAL_CONTROLADO` y conservar como mínimo:

- propósito;
- alcance;
- responsable funcional;
- procedimiento vigente;
- información mínima;
- evidencia;
- tratamiento de excepciones;
- continuidad;
- criterio de cierre;
- revisión periódica.

##### 3.3. Digital no significa completo

Un proceso digital se considera incompleto cuando carece de cualquiera de estos elementos:

- inicio y final verificables;
- responsable funcional;
- fuente de verdad;
- controles de autorización;
- tratamiento de errores;
- trazabilidad;
- continuidad;
- conciliación con otros sistemas;
- criterio de aceptación operativo.

##### 3.4. La autoridad externa no se convierte en propietaria interna

Bancos, plataformas de venta, POS externos, Rappi, Shopify, ManyChat, proveedores, asesores, autoridades o cualquier tercero podrán ser fuentes autorizadas de un resultado externo.

Vento deberá conservar internamente:

- la solicitud o intención;
- el identificador de correlación;
- el resultado recibido;
- la validación;
- la conciliación;
- la evidencia;
- la contingencia;
- la salida o cambio de proveedor.

##### 3.5. Las variantes no crean procesos técnicos independientes

Las diferencias por sede, turno, canal, estación, marca o dispositivo se modelarán como variantes cuando compartan propósito, frontera y resultado empresarial.

`PROC-CAT-020` decidirá fusiones o separaciones definitivas.

##### 3.6. La transición es parte del diseño

Ningún mecanismo vigente se retira únicamente porque exista un prototipo nuevo.

Cada transición deberá conservar:

```text
MÉTODO AS-IS VIGENTE
        +
CAPTURA O EJECUCIÓN TO-BE EN PARALELO
        +
CONCILIACIÓN
        +
CRITERIO DE CORTE
        +
ROLLBACK
        ↓
RETIRO CONTROLADO
```

---

#### 4. Tratamientos objetivo permitidos

| Tratamiento                  | Uso obligatorio                                                                                                           |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `PRESERVAR_Y_ENDURECER`      | El proceso es utilizable; se protegen integridad, seguridad, continuidad y trazabilidad sin rediseñarlo innecesariamente. |
| `REUTILIZAR_Y_COMPLETAR`     | Existen piezas válidas; se completa el ciclo sin perder operación ni crear una fuente competidora.                        |
| `UNIFICAR_Y_GOBERNAR`        | Existen fragmentos en varias herramientas o áreas; se establece un único contrato de proceso y handoffs controlados.      |
| `CONSTRUIR`                  | No existe proceso integral verificable; se diseña el ciclo completo antes de implementar.                                 |
| `MANUAL_CONTROLADO`          | La ejecución seguirá siendo humana o física, pero con procedimiento, evidencia, excepción y cierre gobernados.            |
| `INTEGRAR_AUTORIDAD_EXTERNA` | Un tercero ejecuta o certifica parte material; Vento integra, valida, deduplica, concilia y audita.                       |
| `DIFERIR_CON_CONTROL`        | La capacidad no se implementa todavía; se conserva un método temporal explícito y una puerta exacta de reactivación.      |
| `RETIRAR_PATRÓN`             | Se elimina una práctica, duplicidad o mecanismo legacy; no se retira silenciosamente una capacidad empresarial.           |

---

#### 5. Tratamiento según condición AS-IS

| Condición AS-IS           | Regla TO-BE                                                                                                      |
| ------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `OPERATIVO_ESTABLE`       | Preservar la operación y endurecer contratos, seguridad, pruebas, auditoría y continuidad.                       |
| `OPERATIVO_CON_VARIANTES` | Definir núcleo común y variantes gobernadas; evitar clones por sede o pantalla.                                  |
| `PARCIAL`                 | Conservar piezas válidas y diseñar las fases faltantes, especialmente cierre, corrección y conciliación.         |
| `FRAGMENTADO`             | Unificar el contrato de extremo a extremo y controlar cada transferencia entre herramientas o áreas.             |
| `INFORMAL`                | Establecer de inmediato un procedimiento manual controlado antes de cualquier automatización.                    |
| `CONCENTRADO`             | Reducir dependencia de una persona mediante responsabilidad explícita, suplencia, evidencia y transferencia.     |
| `EXTERNO_DEPENDIENTE`     | Mantener autoridad externa, crear adaptador o procedimiento interno y exigir conciliación.                       |
| `TEMPORAL`                | Definir fecha o puerta de salida, compatibilidad, evidencia y rollback.                                          |
| `ROTO`                    | Bloquear la ruta insegura o establecer contingencia controlada; no extender el comportamiento defectuoso.        |
| `POR_CONFIRMAR`           | No aprobar proceso objetivo hasta obtener evidencia; la duda deberá quedar en tarea exacta.                      |
| capacidad `AUSENTE`       | Crear candidato TO-BE provisional o diferir con control; nunca declararla operativa por tener tablas o permisos. |

---

#### 6. Arquitectura funcional mínima del TO-BE

Todo proceso objetivo deberá poder descomponerse, cuando aplique, en las siguientes fases funcionales:

1. **Activación:** ocurre un hecho, necesidad, solicitud, obligación o evento.
2. **Admisión:** se valida identidad, contexto, alcance, duplicidad y datos mínimos.
3. **Preparación:** se reúnen recursos, capacidad, documentos y dependencias.
4. **Decisión:** se aprueba, rechaza, prioriza, libera o asigna cuando exista autoridad requerida.
5. **Ejecución:** se realiza el trabajo material o digital.
6. **Transferencia:** se entrega custodia, información, responsabilidad o resultado.
7. **Verificación:** se confirma cantidad, calidad, conformidad, pago, recepción o aceptación.
8. **Cierre:** se conserva resultado final, evidencia y obligaciones restantes.
9. **Corrección y conciliación:** se resuelven diferencias sin borrar el historial original.
10. **Continuidad:** se mantiene operación mínima y se recupera ante indisponibilidad.

Estas son fases de diseño y **no** constituyen nombres de estados. Los estados y transiciones se reservan para `PROC-CAT-009` a `PROC-CAT-012`.

---

#### 7. Contrato mínimo provisional de cada proceso TO-BE

| Campo                      | Contenido permitido en esta tarea                                      |
| -------------------------- | ---------------------------------------------------------------------- |
| `asis_ref`                 | Referencia al candidato AS-IS o indicación de ausencia confirmada.     |
| `target_name`              | Nombre funcional provisional, no identificador estable.                |
| `target_boundary`          | Qué resultado abarca y dónde termina.                                  |
| `target_treatment`         | Uno de los tratamientos aprobados en la sección 4.                     |
| `preserve[]`               | Elementos AS-IS válidos que no deberán perderse.                       |
| `eliminate[]`              | Patrones defectuosos que no deberán heredarse.                         |
| `mandatory_controls[]`     | Controles funcionales mínimos.                                         |
| `external_authority`       | Autoridad externa aplicable, sin asignar propiedad interna definitiva. |
| `continuity_mode`          | Forma temporal de mantener la operación antes del cutover.             |
| `gap_refs[]`               | Brechas que el diseño aborda o deriva.                                 |
| `later_definition_tasks[]` | Tareas exactas que completarán el contrato.                            |

---

#### 8. Decisiones reservadas

| Decisión                                         | Tarea propietaria                                                          |
| ------------------------------------------------ | -------------------------------------------------------------------------- |
| identificador estable                            | `PROC-CAT-003`                                                             |
| propósito empresarial definitivo                 | `PROC-CAT-004`                                                             |
| aplicación propietaria                           | `PROC-CAT-005`                                                             |
| aplicaciones consumidoras                        | `PROC-CAT-006`                                                             |
| actor iniciador                                  | `PROC-CAT-007`                                                             |
| actores continuadores                            | `PROC-CAT-008`                                                             |
| estados                                          | `PROC-CAT-009` a `PROC-CAT-011`                                            |
| transiciones                                     | `PROC-CAT-012`                                                             |
| excepciones                                      | `PROC-CAT-013`                                                             |
| cancelación, reversión y corrección              | `PROC-CAT-014`                                                             |
| entradas                                         | `PROC-CAT-015`                                                             |
| salidas                                          | `PROC-CAT-016`                                                             |
| eventos                                          | `PROC-CAT-017`                                                             |
| auditoría                                        | `PROC-CAT-018`                                                             |
| métricas                                         | `PROC-CAT-019`                                                             |
| duplicidades y fusiones                          | `PROC-CAT-020`                                                             |
| actores y responsabilidades detalladas           | `PROC-ACTOR-001` a `PROC-ACTOR-010`                                        |
| pantallas y estaciones                           | `PROC-SCREEN-001` a `PROC-SCREEN-028`; `UX-STATION-001` a `UX-STATION-012` |
| arquitectura física de datos                     | BLOQUE E3                                                                  |
| servicios de impresión, notificación y evidencia | BLOQUE E4                                                                  |
| paquetes, cutover y rollout                      | BLOQUE E5                                                                  |

---

#### 9. Matriz provisional AS-IS → TO-BE

##### Gobierno y estructura

| Referencia AS-IS | Diseño TO-BE provisional                                                                                          | Tratamiento              | Control obligatorio                                                                                                  | Continuidad exacta                                                                                    |
| ---------------- | ----------------------------------------------------------------------------------------------------------------- | ------------------------ | -------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `ASIS-SRC-001`   | Gobernar decisiones empresariales con registro, alcance, responsable, compromisos y seguimiento                   | `UNIFICAR_Y_GOBERNAR`    | Toda decisión material debe conservar contexto, vigencia, responsables, obligaciones y evidencia de cierre.          | `PROC-CAT-003` a `PROC-CAT-020`; `PROC-ACTOR-003`; `PROC-SCREEN-001` a `PROC-SCREEN-028`              |
| `ASIS-SRC-002`   | Mantener una estructura organizativa y jurídica coherente entre empresas, marcas, establecimientos, sedes y áreas | `REUTILIZAR_Y_COMPLETAR` | Separar titularidad jurídica, marca, operación, sede y área; ninguna relación se infiere solo por nombre.            | `PROC-CAT-003` a `PROC-CAT-020`; `PROC-COVER-001` a `PROC-COVER-010`; `SUPA-AUD-019`                  |
| `ASIS-SRC-003`   | Gobernar responsabilidades, políticas, delegaciones y límites de decisión mediante versiones vigentes             | `UNIFICAR_Y_GOBERNAR`    | Toda responsabilidad debe indicar alcance, vigencia, suplencia, aprobación y evidencia de aceptación.                | `PROC-CAT-003` a `PROC-CAT-020`; `PROC-ACTOR-001` a `PROC-ACTOR-010`; `EVID-ARC-001` a `EVID-ARC-010` |
| `ASIS-SRC-004`   | Coordinar compromisos y transferencias de trabajo entre negocios, sedes y áreas                                   | `CONSTRUIR`              | Cada compromiso debe tener origen, receptor, resultado esperado, fecha, prioridad, dependencia y cierre verificable. | `PROC-CAT-003` a `PROC-CAT-020`; `OPS-CAN-001`; `INT-WORK-001` a `INT-WORK-005`                       |
##### Personas y trabajo

| Referencia AS-IS | Diseño TO-BE provisional                                                                           | Tratamiento                  | Control obligatorio                                                                                                             | Continuidad exacta                                                                                     |
| ---------------- | -------------------------------------------------------------------------------------------------- | ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `ASIS-SRC-005`   | Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo | `REUTILIZAR_Y_COMPLETAR`     | La necesidad aprobada precede a la vacante; la persona sigue siendo candidata hasta la vinculación autorizada.                  | `CAP-TAL-001` a `CAP-TAL-004`; `PROC-CAT-003` a `PROC-CAT-020`; `TREQ-TALENTO-001`                     |
| `ASIS-SRC-006`   | Orquestar vinculación, expediente, incorporación, preparación y habilitación inicial de la persona | `UNIFICAR_Y_GOBERNAR`        | El alta laboral, documental, tecnológica y operativa debe correlacionarse sin duplicar identidad ni conceder acceso anticipado. | `CAP-TAL-003` a `CAP-TAL-006`; `AUTH-DB-019`; `EVID-ARC-001` a `EVID-ARC-010`                          |
| `ASIS-SRC-007`   | Administrar asignaciones laborales y programación publicada con historial y revisión controlada    | `REUTILIZAR_Y_COMPLETAR`     | La programación no debe tener editores competidores ni perder la versión que fundamentó asistencia o autorización.              | `VISO-UX-003`; `INT-WORK-001`; `INT-WORK-002`; `PROC-CAT-009` a `PROC-CAT-018`                         |
| `ASIS-SRC-008`   | Capturar asistencia como hechos inmutables y corregirla mediante decisiones auditables             | `PRESERVAR_Y_ENDURECER`      | Nunca se reemplaza silenciosamente la marcación original; toda corrección conserva antes, después, motivo, actor y efecto.      | `PROC-CAT-013`; `PROC-CAT-014`; `PROC-CAT-018`; `ANIMA-UX-011`; `ANIMA-UX-012`; `TREQ-INTEGRATION-007` |
| `ASIS-SRC-009`   | Gestionar novedades, ausencias, permisos y reemplazos como casos laborales completos               | `CONSTRUIR`                  | Reporte, evaluación, decisión, sustitución, efecto sobre turno y cierre deben pertenecer al mismo caso correlacionado.          | `ANIMA-AUTH-012`; `PROC-CAT-009` a `PROC-CAT-018`; `PROC-ACTOR-003`; `ANIMA-UX-017`                    |
| `ASIS-SRC-010`   | Preparar y reconciliar el paquete autorizado para pagos y beneficios laborales                     | `INTEGRAR_AUTORIDAD_EXTERNA` | El sistema interno no se declara motor de nómina; conserva insumos aprobados, resultado recibido, diferencias y conciliación.   | `CAP-SCOPE-012`; `OPS-CST-001`; `INT-EXT-001` a `INT-EXT-019`; `DAT-14`; `DAT-15`                      |
| `ASIS-SRC-011`   | Orquestar retiro laboral, devolución, revocación de accesos y cierre documental                    | `CONSTRUIR`                  | La salida no se completa mientras existan accesos, sesiones, activos, documentos o responsabilidades pendientes.                | `CAP-TAL-006`; `AUTH-DB-019`; `AUTH-DB-035`; `AUTH-DEV-011` a `AUTH-DEV-013`; `TREQ-AUTH-016`          |
##### Seguridad, higiene y cumplimiento

| Referencia AS-IS | Diseño TO-BE provisional                                                                      | Tratamiento         | Control obligatorio                                                                                                                 | Continuidad exacta                                                                          |
| ---------------- | --------------------------------------------------------------------------------------------- | ------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `ASIS-SRC-012`   | Gestionar riesgos, inspecciones, controles preventivos y acciones correctivas                 | `CONSTRUIR`         | Cada hallazgo debe conservar criterio, evidencia, responsable, plazo, verificación y relación con el riesgo tratado.                | `CAP-SCOPE-003`; `VISO-UX-006`; `VISO-UX-007`; `PROC-CAT-013`; `PROC-CAT-018`               |
| `ASIS-SRC-013`   | Gestionar incidentes, accidentes y emergencias con respuesta inmediata y expediente posterior | `CONSTRUIR`         | La atención física no depende del sistema; el registro posterior debe conservar reporte original, investigación, acciones y cierre. | `PROC-CAT-009` a `PROC-CAT-018`; `PROC-ACTOR-003`; `UX-STATION-007`; `TREQ-INTEGRATION-008` |
| `ASIS-SRC-014`   | Ejecutar controles de higiene, inocuidad y cumplimiento mediante procedimientos versionados   | `MANUAL_CONTROLADO` | La ejecución física permanece manual; frecuencia, criterio, evidencia, desviación y acción correctiva deben estar gobernados.       | `CAP-SCOPE-003`; `PROC-CAT-013`; `PROC-CAT-018`; `EVID-ARC-001` a `EVID-ARC-010`            |
##### Productos, recetas y conocimiento

| Referencia AS-IS | Diseño TO-BE provisional                                                                | Tratamiento              | Control obligatorio                                                                                                                | Continuidad exacta                                                                                  |
| ---------------- | --------------------------------------------------------------------------------------- | ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `ASIS-SRC-015`   | Gobernar el ciclo de vida de productos, presentaciones, unidades y equivalencias        | `REUTILIZAR_Y_COMPLETAR` | Debe existir identidad estable, versión, vigencia y reglas de conversión; ninguna app crea un maestro competidor.                  | `NEXO-DOM-002` a `NEXO-DOM-007`; `PROC-CAT-015`; `PROC-CAT-016`; `SUPA-AUD-019`                     |
| `ASIS-SRC-016`   | Gestionar desarrollo, prueba, aprobación, publicación y versión de recetas              | `REUTILIZAR_Y_COMPLETAR` | La receta aprobada debe distinguir borrador, prueba, versión publicada, rendimiento, sustituciones y vigencia.                     | `PROC-CAT-009` a `PROC-CAT-018`; `FOGO-AUTH-001` a `FOGO-AUTH-014`; `EVID-ARC-001` a `EVID-ARC-010` |
| `ASIS-SRC-017`   | Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales | `UNIFICAR_Y_GOBERNAR`    | Los canales consumen una decisión vigente; no mantienen catálogos manuales independientes sin reconciliación.                      | `OPS-CAN-001`; `PULSO-UX-001` a `PULSO-UX-019`; `INT-SALES-001` a `INT-SALES-011`                   |
| `ASIS-SRC-018`   | Mantener especificaciones, alérgenos, restricciones y criterios de calidad del producto | `CONSTRUIR`              | La información sensible debe estar versionada, aprobada, disponible para producción y venta, y vinculada a cada versión aplicable. | `PROC-CAT-015`; `PROC-CAT-016`; `PROC-CAT-018`; `EVID-ARC-001` a `EVID-ARC-010`                     |
##### Compras y proveedores

| Referencia AS-IS | Diseño TO-BE provisional                                                                                           | Tratamiento              | Control obligatorio                                                                                                             | Continuidad exacta                                                                                               |
| ---------------- | ------------------------------------------------------------------------------------------------------------------ | ------------------------ | ------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `ASIS-SRC-019`   | Capturar y priorizar necesidades de compra mediante una entrada única y trazable                                   | `CONSTRUIR`              | Toda solicitud debe indicar necesidad, contexto, urgencia, cantidad, destino y justificación sin depender de mensajes aislados. | `OPS-LOG-001`; `ORIGO-UX-001` a `ORIGO-UX-014`; `PROC-CAT-015`; `PROC-CAT-018`                                   |
| `ASIS-SRC-020`   | Comparar proveedores y condiciones con evidencia suficiente para decidir                                           | `MANUAL_CONTROLADO`      | La negociación puede ser humana; cotizaciones, criterios, vigencia, selección y conflicto de interés deben conservarse.         | `OPS-LOG-001`; `PROC-CAT-015`; `PROC-CAT-016`; `PROC-CAT-018`; `EVID-ARC-001` a `EVID-ARC-010`                   |
| `ASIS-SRC-021`   | Aprobar y emitir compras separando flujo ordinario, urgencia y excepción                                           | `REUTILIZAR_Y_COMPLETAR` | La urgencia no elimina autorización, presupuesto, proveedor, trazabilidad ni conciliación posterior.                            | `OPS-LOG-001`; `ORIGO-AUTH-001` a `ORIGO-AUTH-014`; `PROC-CAT-013`; `PROC-CAT-014`                               |
| `ASIS-SRC-022`   | Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica | `UNIFICAR_Y_GOBERNAR`    | Cantidad, calidad, lote, documento, precio, aceptación, rechazo y efecto de inventario deben quedar correlacionados.            | `OPS-LOG-001`; `ORIGO-UX-001` a `ORIGO-UX-014`; `NEXO-DOM-002` a `NEXO-DOM-007`; `INT-WORK-001` a `INT-WORK-005` |
##### Inventario, almacenamiento y remisiones

| Referencia AS-IS | Diseño TO-BE provisional                                                                       | Tratamiento              | Control obligatorio                                                                                                                | Continuidad exacta                                                                                 |
| ---------------- | ---------------------------------------------------------------------------------------------- | ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| `ASIS-SRC-023`   | Gobernar sedes, LOC, zonas, posiciones y condiciones de almacenamiento                         | `REUTILIZAR_Y_COMPLETAR` | La ubicación física y lógica debe coincidir, conservar jerarquía, vigencia, restricciones y método de identificación.              | `NEXO-DOM-002` a `NEXO-DOM-007`; `NEXO-UX-026` a `NEXO-UX-029`; `TREQ-NEXO-011`                    |
| `ASIS-SRC-024`   | Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados                | `REUTILIZAR_Y_COMPLETAR` | Toda proyección de stock debe derivarse de movimientos; reintentos no duplican cantidades ni pierden lote, presentación o LPN.     | `OPS-LOG-001`; `NEXO-DOM-002` a `NEXO-DOM-007`; `TREQ-NEXO-011`; `TREQ-SUPABASE-002`               |
| `ASIS-SRC-025`   | Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino     | `REUTILIZAR_Y_COMPLETAR` | Paquete y unidad no se descuentan dos veces; cada operación preserva intención, cantidad equivalente y evidencia.                  | `NEXO-UX-014` a `NEXO-UX-022`; `NEXO-DOM-019` a `NEXO-DOM-024`; `TREQ-NEXO-011`                    |
| `ASIS-SRC-026`   | Contar como observación, investigar diferencias y ajustar mediante decisión separada           | `REUTILIZAR_Y_COMPLETAR` | El conteo no modifica stock automáticamente; la observación original, diferencia, investigación y ajuste permanecen distinguibles. | `NEXO-UX-026` a `NEXO-UX-029`; `PROC-CAT-013`; `PROC-CAT-014`; `TREQ-NEXO-011`                     |
| `ASIS-SRC-027`   | Gestionar condición, vencimiento, cuarentena, merma, pérdida, frío y disposición               | `CONSTRUIR`              | Una lectura faltante o desviada crea un caso pendiente; no libera ni descarta automáticamente existencia o producto.               | `PROC-CAT-009` a `PROC-CAT-018`; `CAP-SCOPE-006`; `CAP-SCOPE-018`; `TREQ-NEXO-012`                 |
| `ASIS-SRC-028`   | Ejecutar abastecimiento interno de solicitud a recepción con cantidades conciliables por etapa | `UNIFICAR_Y_GOBERNAR`    | Solicitado, producido, preparado, cargado, transportado y recibido deben conservar cantidades propias y una correlación única.     | `OPS-LOG-001`; `PROC-CAT-009` a `PROC-CAT-018`; `NEXO-AUTH-011` a `NEXO-AUTH-013`; `TREQ-NEXO-011` |
##### Activos, reutilizables y vehículos

| Referencia AS-IS | Diseño TO-BE provisional                                                                    | Tratamiento         | Control obligatorio                                                                                                                | Continuidad exacta                                                                               |
| ---------------- | ------------------------------------------------------------------------------------------- | ------------------- | ---------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| `ASIS-SRC-029`   | Gestionar identidad, ubicación, custodia, préstamo y transferencia de activos               | `CONSTRUIR`         | La custodia requiere entrega y aceptación; conteo, movimiento o reimpresión de etiqueta no crean identidad nueva.                  | `NEXO-DOM-001`; `NEXO-DOM-007` a `NEXO-DOM-015`; `NEXO-UX-030` a `NEXO-UX-040`; `TREQ-NEXO-013`  |
| `ASIS-SRC-030`   | Gestionar mantenimiento, reparación, garantía, repuesto y disposición de activos            | `CONSTRUIR`         | El historial técnico no se sobrescribe; cada intervención conserva condición, diagnóstico, costo, evidencia y decisión final.      | `NEXO-DOM-007` a `NEXO-DOM-017`; `NEXO-DOM-007` a `NEXO-DOM-017`; `PROC-CAT-013`; `PROC-CAT-018` |
| `ASIS-SRC-031`   | Gestionar disponibilidad de vehículos, combustible, kilometraje e incidencias               | `MANUAL_CONTROLADO` | La conducción y abastecimiento permanecen físicos; disponibilidad, consumo, lectura, soporte y excepción deben quedar registrados. | `NEXO-DOM-015` a `NEXO-DOM-017`; `PROC-CAT-013`; `PROC-CAT-018`; `EVID-ARC-001` a `EVID-ARC-010` |
| `ASIS-SRC-032`   | Controlar entrega, tenencia, retorno, pérdida y completitud de reutilizables y contenedores | `CONSTRUIR`         | El ciclo no termina al despachar; debe cerrar con retorno, aceptación, diferencia, daño o disposición autorizada.                  | `NEXO-DOM-014`; `NEXO-DOM-019`; `NEXO-UX-033`; `PROC-CAT-009` a `PROC-CAT-018`                   |
##### Producción

| Referencia AS-IS | Diseño TO-BE provisional                                                             | Tratamiento              | Control obligatorio                                                                                                               | Continuidad exacta                                                                                 |
| ---------------- | ------------------------------------------------------------------------------------ | ------------------------ | --------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| `ASIS-SRC-033`   | Planear producción desde demanda, inventario, capacidad, prioridad y fecha requerida | `CONSTRUIR`              | La planificación debe distinguir necesidad, orden, disponibilidad, capacidad y compromiso sin convertir mensajes en fuente final. | `PROC-CAT-009` a `PROC-CAT-018`; `FOGO-AUTH-001` a `FOGO-AUTH-014`; `OPS-PRD-001`                  |
| `ASIS-SRC-034`   | Preparar materiales y ejecutar producción contra una versión aprobada                | `REUTILIZAR_Y_COMPLETAR` | Materiales, lote, receta, versión, cantidades, operador y resultados deben correlacionarse sin descontar o producir dos veces.    | `PROC-CAT-009` a `PROC-CAT-018`; `FOGO-AUTH-001` a `FOGO-AUTH-014`; `TREQ-NEXO-011`                |
| `ASIS-SRC-035`   | Inspeccionar y decidir liberación, retención, rechazo o corrección de producto       | `CONSTRUIR`              | La decisión de calidad debe conservar criterio, muestra, evidencia, lote, responsable y efecto sobre disponibilidad.              | `PROC-CAT-009` a `PROC-CAT-018`; `CAP-SCOPE-003`; `TREQ-NEXO-012`; `EVID-ARC-001` a `EVID-ARC-010` |
| `ASIS-SRC-036`   | Empacar, etiquetar y almacenar producto terminado con trazabilidad preservada        | `REUTILIZAR_Y_COMPLETAR` | Empaque, etiqueta, lote, cantidad, fecha, condición, LPN y ubicación deben permanecer vinculados.                                 | `NEXO-DOM-019` a `NEXO-DOM-024`; `PROC-CAT-015`; `PROC-CAT-018`; `TREQ-NEXO-012`                   |
| `ASIS-SRC-037`   | Gestionar reproceso, aprovechamiento, rendimiento, merma y cierre productivo         | `CONSTRUIR`              | El reproceso no borra el lote de origen; rendimiento y merma deben reconciliar entradas, salidas y disposición.                   | `PROC-CAT-009` a `PROC-CAT-019`; `FOGO-AUTH-001` a `FOGO-AUTH-014`; `TREQ-NEXO-011`                |
##### Pedidos, ventas, pagos y clientes

| Referencia AS-IS | Diseño TO-BE provisional                                                                               | Tratamiento                  | Control obligatorio                                                                                                                                   | Continuidad exacta                                                                                  |
| ---------------- | ------------------------------------------------------------------------------------------------------ | ---------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `ASIS-SRC-038`   | Gestionar servicio en mesa de apertura a cierre con pedido, preparación, entrega, pago y conciliación  | `UNIFICAR_Y_GOBERNAR`        | Mesa, comanda, producción, modificaciones, pago y cierre deben pertenecer al mismo caso de venta sin doble captura.                                   | `PULSO-UX-001` a `PULSO-UX-021`; `OPS-POS-001`; `INT-SALES-001` a `INT-SALES-011`                   |
| `ASIS-SRC-039`   | Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados                         | `UNIFICAR_Y_GOBERNAR`        | Debe soportar variantes por sede y estación sin crear procesos técnicos distintos por cada pantalla.                                                  | `PULSO-UX-001` a `PULSO-UX-021`; `OPS-POS-001`; `PROC-CAT-020`                                      |
| `ASIS-SRC-040`   | Normalizar pedidos de canales externos y transferirlos al proceso interno con reconciliación           | `INTEGRAR_AUTORIDAD_EXTERNA` | El canal externo conserva su autoridad de origen; el adaptador deduplica, valida, correlaciona y reconcilia cambios.                                  | `OPS-CAN-001`; `INT-EXT-001` a `INT-EXT-019`; `INT-SALES-001` a `INT-SALES-011`; `PROC-CAT-017`     |
| `ASIS-SRC-041`   | Gestionar cotización, aprobación, capacidad, producción, facturación y entrega de catering o venta B2B | `CONSTRUIR`                  | No se compromete capacidad, precio o fecha sin validación; el proceso conserva aceptación del cliente y cambios posteriores.                          | `OPS-B2B-001`; `PROC-CAT-003` a `PROC-CAT-020`; `OPS-CST-001`                                       |
| `ASIS-SRC-042`   | Gestionar modificación, sustitución, cancelación, anulación y devolución sin confundir sus efectos     | `REUTILIZAR_Y_COMPLETAR`     | Cada acción debe tener semántica propia, autorización, motivo, efecto económico, efecto operativo y trazabilidad.                                     | `PROC-CAT-013`; `PROC-CAT-014`; `PULSO-AUTH-001` a `PULSO-AUTH-010`; `TREQ-PULSO-001`               |
| `ASIS-SRC-043`   | Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable                           | `INTEGRAR_AUTORIDAD_EXTERNA` | Intento, autorización, confirmación, rechazo, reverso, soporte y conciliación deben distinguirse; ningún mensaje visual confirma por sí solo el pago. | `INT-EXT-001` a `INT-EXT-019`; `PULSO-AUTH-001` a `PULSO-AUTH-010`; `PROC-CAT-009` a `PROC-CAT-018` |
| `ASIS-SRC-044`   | Cerrar caja y conciliar ventas, pagos, efectivo, diferencias y responsables                            | `REUTILIZAR_Y_COMPLETAR`     | El cierre no sobrescribe la jornada; conserva totales esperados, observados, diferencias, explicación y aprobación.                                   | `PULSO-UX-007` a `PULSO-UX-010`; `NUMERA-UX-001` a `NUMERA-UX-012`; `PROC-CAT-018`; `PROC-CAT-019`  |
| `ASIS-SRC-045`   | Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados            | `REUTILIZAR_Y_COMPLETAR`     | Identidad, perfil, consentimiento, puntos, redención y beneficio no se mezclan ni se modifican como saldo arbitrario.                                 | `PASS-UX-001` a `PASS-UX-013`; `PASS-INT-001` a `PASS-INT-005`; `TREQ-AUTH-006`                     |
| `ASIS-SRC-046`   | Gestionar reclamo, devolución, compensación y aprendizaje de causa                                     | `CONSTRUIR`                  | La compensación no sustituye la investigación; deben conservarse pedido, evidencia, decisión, autorización y resultado comunicado.                    | `PASS-UX-001` a `PASS-UX-013`; `PULSO-AUTH-009`; `PROC-CAT-013`; `PROC-CAT-018`                     |
| `ASIS-SRC-047`   | Gestionar reservas, eventos y comunicaciones al cliente con capacidad y consentimiento                 | `CONSTRUIR`                  | La reserva debe distinguir solicitud, disponibilidad, confirmación, cambio, no presentación y cierre sin depender de mensajes sueltos.                | `PASS-UX-001` a `PASS-UX-013`; `OPS-CAN-001`; `PROC-CAT-009` a `PROC-CAT-018`                       |
##### Transporte y entrega

| Referencia AS-IS | Diseño TO-BE provisional                                                            | Tratamiento                  | Control obligatorio                                                                                                        | Continuidad exacta                                                                |
| ---------------- | ----------------------------------------------------------------------------------- | ---------------------------- | -------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| `ASIS-SRC-048`   | Planear ruta, vehículo, carga, secuencia y restricciones antes del despacho         | `CONSTRUIR`                  | La planificación debe considerar capacidad, ventana, prioridad, condición, evidencia de carga y contingencia.              | `OPS-LOG-001`; `PROC-CAT-009` a `PROC-CAT-018`; `NEXO-DOM-015` a `NEXO-DOM-017`   |
| `ASIS-SRC-049`   | Ejecutar ruta y confirmar entrega, rechazo, novedad o retorno con prueba suficiente | `CONSTRUIR`                  | La salida no equivale a entrega; cada parada debe cerrar con resultado, cantidades, evidencia y consecuencias conciliadas. | `OPS-LOG-001`; `PROC-CAT-009` a `PROC-CAT-018`; `NEXO-AUTH-011` a `NEXO-AUTH-013` |
| `ASIS-SRC-050`   | Integrar entrega de tercero con seguimiento, prueba y conciliación interna          | `INTEGRAR_AUTORIDAD_EXTERNA` | El tercero no se convierte en propietario del proceso interno; sus eventos deben validarse, mapearse y reconciliarse.      | `INT-EXT-001` a `INT-EXT-019`; `PROC-CAT-017`; `PROC-CAT-018`; `OPS-CAN-001`      |
##### Finanzas y obligaciones

| Referencia AS-IS | Diseño TO-BE provisional                                                                  | Tratamiento                  | Control obligatorio                                                                                                                  | Continuidad exacta                                                                                 |
| ---------------- | ----------------------------------------------------------------------------------------- | ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------- |
| `ASIS-SRC-051`   | Registrar hechos económicos desde eventos operativos y soportes correlacionados           | `UNIFICAR_Y_GOBERNAR`        | NUMERA no inventa el hecho; recibe una referencia estable al evento origen, titular, fecha, valor, moneda, centro y soporte.         | `NUMERA-UX-001` a `NUMERA-UX-012`; `CAP-SCOPE-012`; `CAP-SCOPE-017`; `PROC-CAT-017`                |
| `ASIS-SRC-052`   | Gestionar obligación, aprobación y pago a proveedor con conciliación bancaria             | `INTEGRAR_AUTORIDAD_EXTERNA` | La plataforma bancaria ejecuta el pago; el proceso interno conserva obligación, aprobación, instrucción, resultado y conciliación.   | `CAP-SCOPE-012`; `INT-EXT-001` a `INT-EXT-019`; `NUMERA-UX-001` a `NUMERA-UX-012`; `PROC-CAT-018`  |
| `ASIS-SRC-053`   | Gestionar cartera, cobro, recaudo, aplicación y diferencia                                | `CONSTRUIR`                  | Ingreso esperado, pago observado y aplicación contable deben distinguirse hasta quedar conciliados.                                  | `CAP-SCOPE-012`; `NUMERA-UX-001` a `NUMERA-UX-012`; `PROC-CAT-009` a `PROC-CAT-018`                |
| `ASIS-SRC-054`   | Gestionar costos, distribución, presupuesto, cierre y rentabilidad con reglas versionadas | `REUTILIZAR_Y_COMPLETAR`     | Los cálculos deben declarar fuente, versión, periodo, supuestos, distribución y conciliación; una tabla vacía no constituye proceso. | `OPS-CST-001`; `CAP-SCOPE-012`; `CAP-SCOPE-017`; `PROC-CAT-019`; `NUMERA-UX-021` a `NUMERA-UX-028` |
##### Instalaciones, marketing, tecnología, información y continuidad

| Referencia AS-IS | Diseño TO-BE provisional                                                                                 | Tratamiento                  | Control obligatorio                                                                                                                          | Continuidad exacta                                                                                                                               |
| ---------------- | -------------------------------------------------------------------------------------------------------- | ---------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| `ASIS-SRC-055`   | Gestionar limpieza, inspección, mantenimiento, plagas, servicios y cierre de novedades de instalaciones  | `MANUAL_CONTROLADO`          | La ejecución física puede seguir manual o tercerizada; plan, frecuencia, evidencia, desviación, responsable y cierre deben estar gobernados. | `NEXO-DOM-029` a `NEXO-DOM-038`; `NEXO-UX-043` a `NEXO-UX-048`; `CAP-SCOPE-013`; `PROC-CAT-013`; `PROC-CAT-018`; `EVID-ARC-001` a `EVID-ARC-010` |
| `ASIS-SRC-056`   | Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro                | `MANUAL_CONTROLADO`          | La creación sigue siendo humana; versión, derechos, aprobación, calendario, canal, publicación y retiro deben conservar trazabilidad.        | `OPS-CAN-001`; `CAP-SCOPE-014`; `PROC-CAT-015` a `PROC-CAT-019`; `AURA-AUTH-001` a `AURA-AUTH-004`                                               |
| `ASIS-SRC-057`   | Convertir consultas y oportunidades de canales digitales en casos comerciales trazables                  | `INTEGRAR_AUTORIDAD_EXTERNA` | La conversación externa se conserva, pero el interés, calificación, transferencia y resultado deben correlacionarse internamente.            | `OPS-CAN-001`; `INT-MKT-001` a `INT-MKT-003`; `INT-EXT-001` a `INT-EXT-019`; `PROC-CAT-017`                                                      |
| `ASIS-SRC-058`   | Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento    | `CONSTRUIR`                  | Toda intervención debe conservar solicitante, activo o servicio afectado, impacto, diagnóstico, acción, evidencia y cierre.                  | `CAP-SCOPE-015`; `PROC-CAT-009` a `PROC-CAT-019`; `CONT-DOM-001` a `CONT-DOM-015`                                                                |
| `ASIS-SRC-059`   | Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación                 | `CONSTRUIR`                  | Ningún acceso se concede por mensaje informal; identidad, autorización, ejecución, validación y retiro deben quedar correlacionados.         | `AUTH-DB-019`; `AUTH-DB-035`; `AUTH-DEV-011` a `AUTH-DEV-013`; `PROC-CAT-018`                                                                    |
| `ASIS-SRC-060`   | Gestionar documentos y evidencia desde creación hasta disposición con metadatos y custodia               | `UNIFICAR_Y_GOBERNAR`        | El archivo físico no es suficiente: clasificación, propietario, versión, acceso, retención, integridad y disposición deben acompañarlo.      | `INFO-DOM-001` a `INFO-DOM-013`; `EVID-ARC-001` a `EVID-ARC-010`; `TREQ-SUPABASE-004`                                                            |
| `ASIS-SRC-061`   | Gestionar medición, análisis, decisión de mejora y verificación de resultado                             | `REUTILIZAR_Y_COMPLETAR`     | Cada indicador debe tener definición, fuente, periodo, calidad, responsable y acción; exportar datos no equivale a analizar.                 | `PROC-CAT-019`; `DATA-DOM-001` a `DATA-DOM-017`; `CAP-SCOPE-017`; `CAP-COVER-008`                                                                |
| `ASIS-SRC-062`   | Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje | `CONSTRUIR`                  | Cada proceso crítico debe tener contingencia, autoridad, evidencia manual, recuperación segura y conciliación antes de volver a normalidad.  | `CONT-DOM-001` a `CONT-DOM-015`; `NFR-REQ-001`; `NFR-REQ-004`; `NFR-REQ-010`; `UX-STATION-007`                                                   |

---

#### 10. Capacidades sin precursor AS-IS explícito

Las siguientes capacidades aprobadas no aparecen como referencia explícita dentro de los 62 candidatos AS-IS. Se crean candidatos TO-BE provisionales o extensiones explícitas sin asignar identificador estable.

| Referencia provisional    | Capacidad                                                     | Diseño TO-BE provisional                                                                                                                                    | Tratamiento                  | Continuidad exacta                                                                 |
| ------------------------- | ------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------- | ---------------------------------------------------------------------------------- |
| `ADICIONAL-PROVISIONAL-A` | `CAP-01.07` — Gestionar riesgos empresariales                 | Gestionar riesgos estratégicos, financieros, operativos, legales y tecnológicos como registro versionado de riesgo, tratamiento y seguimiento.              | `CONSTRUIR`                  | `PROC-CAT-003` a `PROC-CAT-019`; `CAP-SCOPE-001`; `CAP-SCOPE-017`                  |
| `ADICIONAL-PROVISIONAL-B` | `CAP-01.09` — Gestionar relaciones con asesores y autoridades | Gobernar requerimientos, conceptos, entregables, vencimientos, comunicaciones y evidencia sin delegar la propiedad interna del resultado.                   | `INTEGRAR_AUTORIDAD_EXTERNA` | `INT-EXT-001` a `INT-EXT-019`; `EVID-ARC-001` a `EVID-ARC-010`; `PROC-CAT-018`     |
| `ADICIONAL-PROVISIONAL-C` | `CAP-02.10` — Acompañar desempeño y desarrollo                | Mantener un proceso diferido y sensible de objetivos, retroalimentación y decisiones, con uso explícito y privacidad aprobada.                              | `DIFERIR_CON_CONTROL`        | `PROC-CAT-018`; `PROC-CAT-019`; `PROC-ACTOR-004`; `PROC-ACTOR-005`; `VISO-UX-002`  |
| `ADICIONAL-PROVISIONAL-D` | `CAP-03.03` — Entregar y controlar elementos de protección    | Gestionar requisito, entrega, aceptación, vigencia, cambio, devolución y evidencia de elementos de protección.                                              | `CONSTRUIR`                  | `CAP-SCOPE-003`; `PROC-CAT-009` a `PROC-CAT-018`; `EVID-ARC-001` a `EVID-ARC-010`  |
| `ADICIONAL-PROVISIONAL-E` | `CAP-07.11` — Gestionar kits y conjuntos                      | Definir kit, instancia, componentes obligatorios y opcionales, completitud, préstamo, devolución y sustitución sin confundir kit, activo, LPN o contenedor. | `CONSTRUIR`                  | `NEXO-DOM-014`; `NEXO-DOM-019`; `NEXO-DOM-020`; `NEXO-UX-033`; `TREQ-NEXO-013`     |
| `ADICIONAL-PROVISIONAL-F` | `CAP-10.06` — Medir satisfacción                              | Separar medición, incentivo, reclamo y compensación; conservar muestra, canal, consentimiento, respuesta y sesgo conocido.                                  | `REUTILIZAR_Y_COMPLETAR`     | `PASS-UX-001` a `PASS-UX-013`; `PASS-INT-001` a `PASS-INT-005`; `PROC-CAT-019`     |
| `ADICIONAL-PROVISIONAL-G` | `CAP-12.11` — Gestionar presupuestos                          | Gestionar versión presupuestal, supuestos, aprobación, vigencia, consumo, proyección y desviación sin convertir el presupuesto en hecho contable.           | `CONSTRUIR`                  | `OPS-CST-001`; `CAP-SCOPE-012`; `CAP-SCOPE-017`; `NUMERA-UX-001` a `NUMERA-UX-012` |

Las capacidades `CAP-12.10`, `CAP-12.12`, `CAP-12.13`, `CAP-12.14` y `CAP-12.15` se incorporan expresamente dentro del diseño TO-BE de `ASIS-SRC-052` a `ASIS-SRC-054` y no generan candidatos separados en esta tarea.

---

#### 11. Reglas de coexistencia y cutover

1. Papel, Excel, WhatsApp, Makos, Rappi, Shopify, ManyChat, bancos, Drive y proveedores podrán continuar durante transición únicamente si existe un responsable, una fuente temporal declarada y una conciliación definida.
2. El doble registro solo se permitirá como control temporal con fecha o puerta de salida.
3. La captura paralela no convierte el sistema nuevo en fuente de verdad hasta superar validación y conciliación.
4. El retiro del origen vigente requiere paridad funcional, integridad de datos, pruebas, formación, contingencia y rollback.
5. Una falla del sistema nuevo no autoriza reconstruir datos mediante memoria o mensajes sin evidencia.
6. Las migraciones futuras de Supabase deberán crearse y documentarse en `vento-shell`.

---

#### 12. Reconciliación de brechas asignadas

| Brecha o grupo                                                      | Resolución en esta tarea                                                                                                          | Continuidad obligatoria                                                                                          |
| ------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `H-CAP-COVER-002-004`; `H-CAP-COVER-002-008`; `H-CAP-COVER-003-007` | Se establece contrato de `MANUAL_CONTROLADO`, tratamiento por condición y obligación de evidencia, excepción y continuidad.       | `PROC-COVER-004` a `PROC-COVER-010`; `NFR-REQ-001` a `NFR-REQ-012`                                               |
| `H-CAP-COVER-011-005`; `H-CODE-012-015`                             | Se prohíbe confundir valor operativo manual o parcial con readiness final y se conserva transición controlada.                    | `PROC-COVER-006` a `PROC-COVER-010`; BLOQUES E5, T y U                                                           |
| `H-CAP-SCOPE-002-007`; `H-CODE-011-009`                             | Se define asistencia inmutable con corrección auditable separada.                                                                 | `PROC-CAT-013`; `PROC-CAT-014`; `PROC-CAT-018`; `TREQ-INTEGRATION-007`                                           |
| `H-CAP-SCOPE-002-008`                                               | Se define caso integral de novedad, ausencia, permiso y reemplazo.                                                                | `PROC-CAT-009` a `PROC-CAT-018`; `ANIMA-AUTH-012`; `ANIMA-UX-017`                                                |
| `H-CAP-SCOPE-002-010`                                               | Se mantiene desempeño y desarrollo como capacidad diferida y sensible bajo control.                                               | `PROC-CAT-018`; `PROC-CAT-019`; `PROC-ACTOR-004`; `PROC-ACTOR-005`; `VISO-UX-002`                                |
| `H-CAP-SCOPE-003-002`; `H-CAP-SCOPE-003-005`; `H-CAP-SCOPE-003-009` | Se diseñan ciclos objetivo para prevención, incidentes, emergencia y acciones correctivas.                                        | `PROC-CAT-009` a `PROC-CAT-018`; `UX-STATION-007`; `TREQ-INTEGRATION-008`                                        |
| `H-CAP-SCOPE-006-007`; `H-CAP-SCOPE-006-008`                        | Se define inventario basado en movimientos, reservas, estados de cantidad y conciliación.                                         | `PROC-CAT-009` a `PROC-CAT-018`; `NEXO-DOM-002` a `NEXO-DOM-024`; `TREQ-NEXO-011`                                |
| `H-CAP-SCOPE-006-016`                                               | Se define el ciclo objetivo de lectura, excursión, cuarentena, evaluación, decisión y disposición sin liberación automática.      | `PROC-CAT-009` a `PROC-CAT-018`; BLOQUES E3 y E4; `TREQ-NEXO-012`                                                |
| `H-CAP-SCOPE-019-007`                                               | Se define que la autoridad externa no sustituye propiedad interna, validación, correlación ni conciliación.                       | `PROC-CAT-005`; `PROC-CAT-006`; `PROC-CAT-015` a `PROC-CAT-018`; BLOQUE X                                        |
| `H-CAP-SCOPE-019-013`                                               | Se prohíbe declarar AURA o TALENTO como propietarias operativas mientras permanezcan futuras o diferidas.                         | `PROC-CAT-005`; `CAP-TAL-001` a `CAP-TAL-006`; BLOQUE W                                                          |
| `H-CODE-011-010`                                                    | Se define corrección y conciliación de pagos sin sobrescritura ni confirmación visual como autoridad.                             | `PROC-CAT-013`; `PROC-CAT-014`; `PROC-CAT-018`; `PULSO-AUTH-008`; `PULSO-UX-008`; `PULSO-UX-009`                 |
| `H-CODE-019-008`                                                    | Se diseña mantenimiento de instalaciones y continuidad como procesos empresariales controlados, no como tablas o listas aisladas. | `NEXO-DOM-029` a `NEXO-DOM-038`; `NEXO-UX-043` a `NEXO-UX-048`; `CAP-SCOPE-013`; `CONT-DOM-001` a `CONT-DOM-015` |
| `DIF-09`                                                            | Las variantes menores por sede o turno se mantienen como configuración gobernada, no como procesos duplicados.                    | `PROC-CAT-020`; `PROC-COVER-009`; `UX-STATION-001` a `UX-STATION-012`                                            |

No se crea una brecha nueva sin destino documental.

---

#### 13. Impacto contractual

| Dimensión                     | Resultado                                                                                   |
| ----------------------------- | ------------------------------------------------------------------------------------------- |
| permisos                      | No se crean ni cambian claves de permiso.                                                   |
| modalidad y alcance           | No se modifican; deberán derivarse después del proceso, actor y acción aprobados.           |
| turno, check-in y área activa | Se reconocen como contexto de ejecución cuando corresponda, sin cambiar el contrato AUTH.   |
| dispositivos compartidos      | No se diseñan pantallas ni sesiones; se reservan `UX-STATION-*` y BLOQUE P.                 |
| simulación                    | No se modifica.                                                                             |
| recursos                      | No se crean contratos de recurso; se reservan tareas de proceso y autorización posteriores. |
| matrices                      | No se regeneran.                                                                            |
| Supabase, RLS, RPC y Storage  | No se modifica arquitectura ni datos.                                                       |
| aplicaciones                  | No se asigna propiedad definitiva antes de `PROC-CAT-005`.                                  |
| experiencia y navegación      | No se diseñan pantallas antes de `PROC-SCREEN-*` y `UX-*`.                                  |

---

#### 14. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

| ID              | Regla protegida                                                                                                                  | Riesgo evitado                                               | Tipo                                          | Prioridad | Momento de implementación                           | Destino                                                                                             |
| --------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ | --------------------------------------------- | --------- | --------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `TREQ-PROC-001` | Ningún proceso podrá declararse completo por existir solo tabla, ruta, permiso, formulario o prototipo.                          | falsa cobertura y rollout incompleto                         | contractual + regresión                       | crítica   | validación de cada paquete E5                       | Registro Canónico de Requisitos de Prueba; `PROC-COVER-007`; BLOQUE U                               |
| `TREQ-PROC-002` | Todo proceso manual controlado deberá conservar procedimiento vigente, responsable, evidencia, excepción, contingencia y cierre. | operación informal no reproducible                           | procedimiento + E2E operativo                 | alta      | paquete del dominio antes del piloto                | Registro Canónico de Requisitos de Prueba; `READY-GATE-009`; BLOQUE U                               |
| `TREQ-PROC-003` | Toda integración externa deberá correlacionar, deduplicar, validar y conciliar reintentos y resultados.                          | duplicados, pérdida de pedidos o pagos y autoridad ambigua   | contrato + integración + idempotencia         | crítica   | junto con el adaptador o integración                | Registro Canónico de Requisitos de Prueba; BLOQUE X; paquete E5 correspondiente                     |
| `TREQ-PROC-004` | Toda corrección deberá preservar el hecho original, motivo, actor, antes, después y efecto derivado.                             | sobrescritura de historia y fraude                           | contractual + auditoría + regresión           | crítica   | junto con cada flujo de corrección                  | Registro Canónico de Requisitos de Prueba; `PROC-CAT-014`; `PROC-CAT-018`                           |
| `TREQ-PROC-005` | Una variante por sede, turno, canal o dispositivo no podrá alterar silenciosamente el núcleo del proceso.                        | divergencia funcional y procesos duplicados                  | contractual + configuración + E2E             | alta      | antes de aprobar variantes o estaciones             | Registro Canónico de Requisitos de Prueba; `PROC-CAT-020`; `UX-STATION-009`                         |
| `TREQ-PROC-006` | El cutover deberá demostrar captura paralela, conciliación, criterio de corte y rollback antes de retirar el método AS-IS.       | interrupción operativa y pérdida de evidencia                | migración + E2E + continuidad                 | crítica   | paquete E5 y piloto                                 | Registro Canónico de Requisitos de Prueba; `PROC-COVER-009`; BLOQUE E5; BLOQUES E5 y U              |
| `TREQ-PROC-007` | Una capacidad ausente o diferida no podrá aparecer como operativa por tener infraestructura parcial.                             | exposición prematura y decisiones falsas                     | contractual + navegación + seguridad negativa | alta      | antes de publicar navegación o permisos             | Registro Canónico de Requisitos de Prueba; `PROC-COVER-004`; `PROC-COVER-007`; BLOQUES I y U        |
| `TREQ-PROC-008` | La continuidad deberá conservar intención, evidencia y conciliación al volver del modo degradado.                                | doble ejecución, pérdida de datos y recuperación incoherente | continuidad + offline + E2E                   | crítica   | junto con el paquete de continuidad de cada proceso | Registro Canónico de Requisitos de Prueba; `NFR-REQ-004`; `CONT-DOM-001` a `CONT-DOM-015`; BLOQUE U |

Los ocho requisitos deberán materializarse en el Registro Canónico de Requisitos de Prueba durante la consolidación posterior a la aprobación.

---

#### 15. Criterios de aceptación

- [ ] `E1-GATE-001` y `PROC-CAT-001` figuran aprobadas.
- [ ] Existe un único artefacto `PROC-TOBE-DESIGN-001`.
- [ ] Los 62 candidatos AS-IS tienen diseño TO-BE provisional y tratamiento objetivo.
- [ ] Las capacidades aprobadas sin precursor AS-IS explícito tienen candidato o extensión TO-BE provisional.
- [ ] Manual, digital, externo, parcial, roto, ausente y diferido tienen tratamiento normativo distinto.
- [ ] Ningún proceso se define por una pantalla, tabla, permiso, ruta o repositorio.
- [ ] Ninguna práctica defectuosa del AS-IS se convierte automáticamente en TO-BE.
- [ ] La operación manual válida conserva procedimiento, responsable, evidencia, excepción y continuidad.
- [ ] Las integraciones externas conservan autoridad, correlación, validación y conciliación.
- [ ] Las correcciones no borran hechos originales.
- [ ] Las variantes no generan clones silenciosos por sede, turno, canal o dispositivo.
- [ ] El método AS-IS no se retira sin paridad, conciliación, criterio de corte y rollback.
- [ ] No se asignaron identificadores estables antes de `PROC-CAT-003`.
- [ ] No se asignó aplicación propietaria antes de `PROC-CAT-005`.
- [ ] No se definieron actores, estados, transiciones, entradas, salidas, eventos, auditoría o métricas fuera de sus tareas propietarias.
- [ ] Todas las brechas tratadas tienen continuidad exacta.
- [ ] Se generaron y vincularon `TREQ-PROC-001` a `TREQ-PROC-008`.
- [ ] No se modificó código, Supabase, migraciones ni operación.
- [ ] Toda futura migración de Supabase queda reservada para `vento-shell`.
- [ ] El marcador de `PROC-CAT-003` permanece sin iniciar.

---

#### 16. Estado

```text
APROBADO
```

No se inicia `PROC-CAT-003` hasta la aprobación expresa de `PROC-CAT-002`.

### ✅ PROC-CAT-003 — Crear identificador estable para cada proceso

**Estado:** APROBADA  
**Bloque:** BLOQUE E2 — Arquitectura funcional, procesos y experiencia transversal  
**Dependencias obligatorias:** `E1-GATE-001` — APROBADA; `PROC-CAT-001` — APROBADA; `PROC-CAT-002` — APROBADA  
**Línea base recibida:** `PROC-ASIS-CATALOG-001` y `PROC-TOBE-DESIGN-001`  
**Naturaleza:** gobierno de identidad canónica de procesos, sin implementación  
**Artefacto producido:** `PROC-CANONICAL-ID-REGISTRY-001`  
**Cantidad de procesos identificados:** **69**  
**Rango asignado:** `VPROC-0001` a `VPROC-0069`  
**Siguiente identificador disponible:** `VPROC-0070`  
**Cambios en código, migraciones o Supabase:** no autorizados  
**Siguiente tarea reservada:** `PROC-CAT-004 — Definir propósito empresarial de cada proceso`

---

#### 1. Propósito

Asignar una identidad canónica, estable, única e inmutable a cada proceso TO-BE definido por `PROC-CAT-002`, de manera que el proceso pueda conservar trazabilidad aunque cambien posteriormente su nombre humano, propósito detallado, aplicación propietaria, actores, estados, implementación, dominio técnico o condición operativa.

```text
REFERENCIA AS-IS O CAPACIDAD AUSENTE
        ↓
DISEÑO TO-BE APROBADO
        ↓
IDENTIDAD CANÓNICA INMUTABLE
        ↓
VPROC-####
        ↓
CONTRATO COMPLETO EN PROC-CAT-004 A PROC-CAT-020
```

La asignación del identificador **no** demuestra que el proceso esté implementado, operativo, listo para producción ni cubierto de extremo a extremo.

---

#### 2. Resultado obligatorio

La tarea produce:

```text
PROC-CANONICAL-ID-REGISTRY-001
```

El registro deberá:

1. asignar exactamente un `VPROC-*` a cada uno de los 69 diseños TO-BE aprobados;
2. conservar como alias de trazabilidad las referencias `ASIS-SRC-*` y `ADICIONAL-PROVISIONAL-*`;
3. impedir reutilización, renumeración y mutación semántica de identificadores;
4. distinguir identidad de proceso, tarea documental, artefacto y capacidad;
5. soportar renombre, traslado de propiedad, fusión, división, retiro y reactivación sin perder historia;
6. establecer el siguiente número disponible sin reservar significados por rango;
7. permitir que las tareas posteriores completen el contrato utilizando una referencia única;
8. permanecer independiente de aplicaciones, repositorios, tablas, rutas, permisos y pantallas.

---

#### 3. Espacios de identidad separados

| Espacio                      | Ejemplo                | Significado                                               |
| ---------------------------- | ---------------------- | --------------------------------------------------------- |
| tarea documental             | `PROC-CAT-003`         | trabajo que define o modifica documentación canónica      |
| artefacto documental         | `PROC-TOBE-DESIGN-001` | documento o registro producido por una tarea              |
| capacidad empresarial        | `CAP-06.09`            | resultado estable que la organización debe poder producir |
| referencia histórica AS-IS   | `ASIS-SRC-028`         | agrupación de trabajo observada en E1                     |
| proceso empresarial canónico | `VPROC-0028`           | identidad estable del proceso TO-BE                       |
| requisito de prueba          | `TREQ-PROC-009`        | regla verificable que protege el contrato                 |

Ninguno de estos identificadores podrá utilizarse como sustituto de otro.

---

#### 4. Convención canónica

##### 4.1. Forma

```text
VPROC-####
```

Expresión regular normativa:

```regex
^VPROC-[0-9]{4}$
```

##### 4.2. Semántica

`VPROC` significa **Vento Process** y el componente numérico es deliberadamente opaco.

El número:

- no identifica aplicación;
- no identifica dominio;
- no identifica familia de capacidad;
- no identifica sede, área, marca o canal;
- no identifica actor o propietario;
- no expresa prioridad, orden de ejecución, madurez o estado;
- no cambia cuando cualquiera de esas dimensiones cambie.

##### 4.3. Restricciones

- `VPROC-0000` es inválido y no podrá asignarse.
- Los identificadores se asignan en secuencia ascendente desde el registro canónico.
- Un número asignado, retirado, fusionado, dividido o anulado nunca vuelve a estar disponible.
- No se rellenarán huecos históricos.
- No se crearán identificadores manualmente fuera de la tarea o mecanismo canónico que gobierne el registro.
- La comparación será exacta y sensible a la forma canónica en mayúsculas.
- Alias, slugs, nombres humanos y claves legacy no sustituyen al `VPROC-*`.

---

#### 5. Propiedades obligatorias de estabilidad

##### 5.1. Inmutabilidad

Una vez aprobado, el identificador no cambia por:

- renombre del proceso;
- ajuste de propósito;
- cambio de aplicación propietaria;
- adición o retiro de aplicaciones consumidoras;
- cambio de actor, sede, área o modalidad;
- cambio de tratamiento TO-BE;
- migración técnica;
- cambio de tabla, esquema, API, pantalla o repositorio;
- paso de manual a digital o de digital a contingencia manual;
- reactivación del mismo proceso después de una suspensión.

##### 5.2. Unicidad

Cada identificador representa una sola identidad de proceso y cada identidad de proceso activa posee un único identificador primario.

##### 5.3. No reutilización

Un identificador retirado conserva toda su historia y no podrá asignarse a otro proceso, incluso cuando el proceso original nunca haya llegado a producción.

##### 5.4. Opacidad

No se inferirá comportamiento, autorización, propiedad, criticidad o secuencia desde el número.

##### 5.5. Resolución

Toda referencia deberá poder resolver a:

- la entrada primaria vigente;
- su estado de registro;
- sus alias históricos;
- su linaje de fusión o división;
- la tarea que autorizó el cambio.

---

#### 6. Estado del registro, no estado de ejecución

El campo `registry_status` administra la vida del identificador y no reemplaza los estados empresariales que se definirán en `PROC-CAT-009` a `PROC-CAT-011`.

| Estado de registro | Uso                                                                 |
| ------------------ | ------------------------------------------------------------------- |
| `UNDER_DEFINITION` | Identidad asignada; contrato funcional todavía se completa en E2.   |
| `CANONICAL`        | Contrato de proceso aprobado por la puerta correspondiente.         |
| `MERGED_ALIAS`     | Identidad histórica fusionada; resuelve a otro `VPROC-*`.           |
| `SPLIT_PARENT`     | Identidad histórica dividida; conserva relación con procesos hijos. |
| `RETIRED`          | Proceso retirado; historia y referencias permanecen consultables.   |
| `VOID`             | Asignación anulada por error documental; nunca reutilizable.        |

Los 69 identificadores creados por esta tarea nacen como `UNDER_DEFINITION`.

---

#### 7. Contrato mínimo del registro

| Campo               | Regla                                                                                               |
| ------------------- | --------------------------------------------------------------------------------------------------- |
| `process_id`        | `VPROC-*` primario, único e inmutable.                                                              |
| `registry_status`   | Uno de los estados de la sección 6.                                                                 |
| `source_aliases[]`  | Referencias AS-IS, provisionales o legacy conservadas para trazabilidad.                            |
| `working_reference` | Texto provisional usado solo para reconocer el diseño; no reemplaza el propósito de `PROC-CAT-004`. |
| `origin_task`       | Tarea que creó la identidad.                                                                        |
| `created_from`      | Artefacto o diseño del cual se derivó.                                                              |
| `merged_into`       | `VPROC-*` sobreviviente cuando el estado sea `MERGED_ALIAS`.                                        |
| `split_from`        | Identidad padre cuando un proceso nazca de una división.                                            |
| `split_into[]`      | Identidades hijas cuando el estado sea `SPLIT_PARENT`.                                              |
| `retired_reason`    | Razón aprobada del retiro.                                                                          |
| `decision_ref`      | Tarea, ADR o decisión que autorizó la evolución.                                                    |

La persistencia física de este contrato se definirá en BLOQUE E3 y se implementará posteriormente mediante migración versionada en `vento-shell` cuando corresponda.

---

#### 8. Reglas de evolución

##### 8.1. Renombre o refinamiento

El proceso conserva el mismo `VPROC-*`. El nombre, propósito y contrato cambian mediante versión documental aprobada.

##### 8.2. Cambio de propietario o aplicación

El proceso conserva el mismo `VPROC-*`. La propiedad no forma parte de su identidad.

##### 8.3. Fusión

Cuando `PROC-CAT-020` determine que dos o más entradas representan el mismo proceso:

1. se seleccionará una identidad sobreviviente mediante trazabilidad y continuidad, no por preferencia numérica automática;
2. las demás pasarán a `MERGED_ALIAS`;
3. `merged_into` apuntará al sobreviviente;
4. los identificadores fusionados seguirán resolviendo para historia, auditoría e integraciones;
5. ningún identificador fusionado se reutilizará.

##### 8.4. División

Cuando una frontera de proceso deba separarse materialmente:

1. el proceso original conservará su identidad histórica;
2. si deja de representar un proceso ejecutable, pasará a `SPLIT_PARENT`;
3. cada proceso hijo recibirá un nuevo `VPROC-*` desde el siguiente consecutivo disponible;
4. se registrarán `split_from` y `split_into[]`;
5. no se reescribirá la historia previa como si los hijos siempre hubieran existido.

##### 8.5. Retiro

El proceso pasa a `RETIRED`, conserva su contrato, evidencia, fechas y razón. El retiro de una implementación no implica automáticamente retiro de la capacidad empresarial.

##### 8.6. Reactivación

Si vuelve el mismo propósito y frontera, se reactiva el mismo identificador mediante decisión aprobada. Si existe un resultado empresarial materialmente diferente, se crea un identificador nuevo y se conserva relación de linaje.

##### 8.7. Error de asignación

Una asignación aprobada por error pasa a `VOID`. El número no vuelve al conjunto disponible.

---

#### 9. Asignación canónica

**Resumen de cobertura**

| Origen                                                              | Cantidad | Rango asignado              |
| ------------------------------------------------------------------- | -------: | --------------------------- |
| candidatos de `PROC-ASIS-CATALOG-001`                               |       62 | `VPROC-0001` a `VPROC-0062` |
| capacidades sin precursor AS-IS explícito de `PROC-TOBE-DESIGN-001` |        7 | `VPROC-0063` a `VPROC-0069` |
| **Total**                                                           |   **69** | `VPROC-0001` a `VPROC-0069` |

Las descripciones de las tablas siguientes son **referencias de trabajo heredadas de `PROC-CAT-002`**. No constituyen todavía el propósito empresarial definitivo de `PROC-CAT-004`.

##### 9.1. Gobierno y estructura

| Identificador estable | Alias de origen | Referencia funcional provisional                                                                                  | Tratamiento heredado     | Estado de registro |
| --------------------- | --------------- | ----------------------------------------------------------------------------------------------------------------- | ------------------------ | ------------------ |
| `VPROC-0001`          | `ASIS-SRC-001`  | Gobernar decisiones empresariales con registro, alcance, responsable, compromisos y seguimiento                   | `UNIFICAR_Y_GOBERNAR`    | `UNDER_DEFINITION` |
| `VPROC-0002`          | `ASIS-SRC-002`  | Mantener una estructura organizativa y jurídica coherente entre empresas, marcas, establecimientos, sedes y áreas | `REUTILIZAR_Y_COMPLETAR` | `UNDER_DEFINITION` |
| `VPROC-0003`          | `ASIS-SRC-003`  | Gobernar responsabilidades, políticas, delegaciones y límites de decisión mediante versiones vigentes             | `UNIFICAR_Y_GOBERNAR`    | `UNDER_DEFINITION` |
| `VPROC-0004`          | `ASIS-SRC-004`  | Coordinar compromisos y transferencias de trabajo entre negocios, sedes y áreas                                   | `CONSTRUIR`              | `UNDER_DEFINITION` |

##### 9.2. Personas y trabajo

| Identificador estable | Alias de origen | Referencia funcional provisional                                                                   | Tratamiento heredado         | Estado de registro |
| --------------------- | --------------- | -------------------------------------------------------------------------------------------------- | ---------------------------- | ------------------ |
| `VPROC-0005`          | `ASIS-SRC-005`  | Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo | `REUTILIZAR_Y_COMPLETAR`     | `UNDER_DEFINITION` |
| `VPROC-0006`          | `ASIS-SRC-006`  | Orquestar vinculación, expediente, incorporación, preparación y habilitación inicial de la persona | `UNIFICAR_Y_GOBERNAR`        | `UNDER_DEFINITION` |
| `VPROC-0007`          | `ASIS-SRC-007`  | Administrar asignaciones laborales y programación publicada con historial y revisión controlada    | `REUTILIZAR_Y_COMPLETAR`     | `UNDER_DEFINITION` |
| `VPROC-0008`          | `ASIS-SRC-008`  | Capturar asistencia como hechos inmutables y corregirla mediante decisiones auditables             | `PRESERVAR_Y_ENDURECER`      | `UNDER_DEFINITION` |
| `VPROC-0009`          | `ASIS-SRC-009`  | Gestionar novedades, ausencias, permisos y reemplazos como casos laborales completos               | `CONSTRUIR`                  | `UNDER_DEFINITION` |
| `VPROC-0010`          | `ASIS-SRC-010`  | Preparar y reconciliar el paquete autorizado para pagos y beneficios laborales                     | `INTEGRAR_AUTORIDAD_EXTERNA` | `UNDER_DEFINITION` |
| `VPROC-0011`          | `ASIS-SRC-011`  | Orquestar retiro laboral, devolución, revocación de accesos y cierre documental                    | `CONSTRUIR`                  | `UNDER_DEFINITION` |

##### 9.3. Seguridad, higiene y cumplimiento

| Identificador estable | Alias de origen | Referencia funcional provisional                                                              | Tratamiento heredado | Estado de registro |
| --------------------- | --------------- | --------------------------------------------------------------------------------------------- | -------------------- | ------------------ |
| `VPROC-0012`          | `ASIS-SRC-012`  | Gestionar riesgos, inspecciones, controles preventivos y acciones correctivas                 | `CONSTRUIR`          | `UNDER_DEFINITION` |
| `VPROC-0013`          | `ASIS-SRC-013`  | Gestionar incidentes, accidentes y emergencias con respuesta inmediata y expediente posterior | `CONSTRUIR`          | `UNDER_DEFINITION` |
| `VPROC-0014`          | `ASIS-SRC-014`  | Ejecutar controles de higiene, inocuidad y cumplimiento mediante procedimientos versionados   | `MANUAL_CONTROLADO`  | `UNDER_DEFINITION` |

##### 9.4. Productos, recetas y conocimiento

| Identificador estable | Alias de origen | Referencia funcional provisional                                                        | Tratamiento heredado     | Estado de registro |
| --------------------- | --------------- | --------------------------------------------------------------------------------------- | ------------------------ | ------------------ |
| `VPROC-0015`          | `ASIS-SRC-015`  | Gobernar el ciclo de vida de productos, presentaciones, unidades y equivalencias        | `REUTILIZAR_Y_COMPLETAR` | `UNDER_DEFINITION` |
| `VPROC-0016`          | `ASIS-SRC-016`  | Gestionar desarrollo, prueba, aprobación, publicación y versión de recetas              | `REUTILIZAR_Y_COMPLETAR` | `UNDER_DEFINITION` |
| `VPROC-0017`          | `ASIS-SRC-017`  | Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales | `UNIFICAR_Y_GOBERNAR`    | `UNDER_DEFINITION` |
| `VPROC-0018`          | `ASIS-SRC-018`  | Mantener especificaciones, alérgenos, restricciones y criterios de calidad del producto | `CONSTRUIR`              | `UNDER_DEFINITION` |

##### 9.5. Compras y proveedores

| Identificador estable | Alias de origen | Referencia funcional provisional                                                                                   | Tratamiento heredado     | Estado de registro |
| --------------------- | --------------- | ------------------------------------------------------------------------------------------------------------------ | ------------------------ | ------------------ |
| `VPROC-0019`          | `ASIS-SRC-019`  | Capturar y priorizar necesidades de compra mediante una entrada única y trazable                                   | `CONSTRUIR`              | `UNDER_DEFINITION` |
| `VPROC-0020`          | `ASIS-SRC-020`  | Comparar proveedores y condiciones con evidencia suficiente para decidir                                           | `MANUAL_CONTROLADO`      | `UNDER_DEFINITION` |
| `VPROC-0021`          | `ASIS-SRC-021`  | Aprobar y emitir compras separando flujo ordinario, urgencia y excepción                                           | `REUTILIZAR_Y_COMPLETAR` | `UNDER_DEFINITION` |
| `VPROC-0022`          | `ASIS-SRC-022`  | Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica | `UNIFICAR_Y_GOBERNAR`    | `UNDER_DEFINITION` |

##### 9.6. Inventario y almacenamiento

| Identificador estable | Alias de origen | Referencia funcional provisional                                                               | Tratamiento heredado     | Estado de registro |
| --------------------- | --------------- | ---------------------------------------------------------------------------------------------- | ------------------------ | ------------------ |
| `VPROC-0023`          | `ASIS-SRC-023`  | Gobernar sedes, LOC, zonas, posiciones y condiciones de almacenamiento                         | `REUTILIZAR_Y_COMPLETAR` | `UNDER_DEFINITION` |
| `VPROC-0024`          | `ASIS-SRC-024`  | Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados                | `REUTILIZAR_Y_COMPLETAR` | `UNDER_DEFINITION` |
| `VPROC-0025`          | `ASIS-SRC-025`  | Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino     | `REUTILIZAR_Y_COMPLETAR` | `UNDER_DEFINITION` |
| `VPROC-0026`          | `ASIS-SRC-026`  | Contar como observación, investigar diferencias y ajustar mediante decisión separada           | `REUTILIZAR_Y_COMPLETAR` | `UNDER_DEFINITION` |
| `VPROC-0027`          | `ASIS-SRC-027`  | Gestionar condición, vencimiento, cuarentena, merma, pérdida, frío y disposición               | `CONSTRUIR`              | `UNDER_DEFINITION` |
| `VPROC-0028`          | `ASIS-SRC-028`  | Ejecutar abastecimiento interno de solicitud a recepción con cantidades conciliables por etapa | `UNIFICAR_Y_GOBERNAR`    | `UNDER_DEFINITION` |

##### 9.7. Activos, vehículos, reutilizables y contenedores

| Identificador estable | Alias de origen | Referencia funcional provisional                                                            | Tratamiento heredado | Estado de registro |
| --------------------- | --------------- | ------------------------------------------------------------------------------------------- | -------------------- | ------------------ |
| `VPROC-0029`          | `ASIS-SRC-029`  | Gestionar identidad, ubicación, custodia, préstamo y transferencia de activos               | `CONSTRUIR`          | `UNDER_DEFINITION` |
| `VPROC-0030`          | `ASIS-SRC-030`  | Gestionar mantenimiento, reparación, garantía, repuesto y disposición de activos            | `CONSTRUIR`          | `UNDER_DEFINITION` |
| `VPROC-0031`          | `ASIS-SRC-031`  | Gestionar disponibilidad de vehículos, combustible, kilometraje e incidencias               | `MANUAL_CONTROLADO`  | `UNDER_DEFINITION` |
| `VPROC-0032`          | `ASIS-SRC-032`  | Controlar entrega, tenencia, retorno, pérdida y completitud de reutilizables y contenedores | `CONSTRUIR`          | `UNDER_DEFINITION` |

##### 9.8. Producción

| Identificador estable | Alias de origen | Referencia funcional provisional                                                     | Tratamiento heredado     | Estado de registro |
| --------------------- | --------------- | ------------------------------------------------------------------------------------ | ------------------------ | ------------------ |
| `VPROC-0033`          | `ASIS-SRC-033`  | Planear producción desde demanda, inventario, capacidad, prioridad y fecha requerida | `CONSTRUIR`              | `UNDER_DEFINITION` |
| `VPROC-0034`          | `ASIS-SRC-034`  | Preparar materiales y ejecutar producción contra una versión aprobada                | `REUTILIZAR_Y_COMPLETAR` | `UNDER_DEFINITION` |
| `VPROC-0035`          | `ASIS-SRC-035`  | Inspeccionar y decidir liberación, retención, rechazo o corrección de producto       | `CONSTRUIR`              | `UNDER_DEFINITION` |
| `VPROC-0036`          | `ASIS-SRC-036`  | Empacar, etiquetar y almacenar producto terminado con trazabilidad preservada        | `REUTILIZAR_Y_COMPLETAR` | `UNDER_DEFINITION` |
| `VPROC-0037`          | `ASIS-SRC-037`  | Gestionar reproceso, aprovechamiento, rendimiento, merma y cierre productivo         | `CONSTRUIR`              | `UNDER_DEFINITION` |

##### 9.9. Pedidos, ventas, pagos y caja

| Identificador estable | Alias de origen | Referencia funcional provisional                                                                       | Tratamiento heredado         | Estado de registro |
| --------------------- | --------------- | ------------------------------------------------------------------------------------------------------ | ---------------------------- | ------------------ |
| `VPROC-0038`          | `ASIS-SRC-038`  | Gestionar servicio en mesa de apertura a cierre con pedido, preparación, entrega, pago y conciliación  | `UNIFICAR_Y_GOBERNAR`        | `UNDER_DEFINITION` |
| `VPROC-0039`          | `ASIS-SRC-039`  | Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados                         | `UNIFICAR_Y_GOBERNAR`        | `UNDER_DEFINITION` |
| `VPROC-0040`          | `ASIS-SRC-040`  | Normalizar pedidos de canales externos y transferirlos al proceso interno con reconciliación           | `INTEGRAR_AUTORIDAD_EXTERNA` | `UNDER_DEFINITION` |
| `VPROC-0041`          | `ASIS-SRC-041`  | Gestionar cotización, aprobación, capacidad, producción, facturación y entrega de catering o venta B2B | `CONSTRUIR`                  | `UNDER_DEFINITION` |
| `VPROC-0042`          | `ASIS-SRC-042`  | Gestionar modificación, sustitución, cancelación, anulación y devolución sin confundir sus efectos     | `REUTILIZAR_Y_COMPLETAR`     | `UNDER_DEFINITION` |
| `VPROC-0043`          | `ASIS-SRC-043`  | Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable                           | `INTEGRAR_AUTORIDAD_EXTERNA` | `UNDER_DEFINITION` |
| `VPROC-0044`          | `ASIS-SRC-044`  | Cerrar caja y conciliar ventas, pagos, efectivo, diferencias y responsables                            | `REUTILIZAR_Y_COMPLETAR`     | `UNDER_DEFINITION` |

##### 9.10. Clientes, fidelización, reclamos y reservas

| Identificador estable | Alias de origen | Referencia funcional provisional                                                            | Tratamiento heredado     | Estado de registro |
| --------------------- | --------------- | ------------------------------------------------------------------------------------------- | ------------------------ | ------------------ |
| `VPROC-0045`          | `ASIS-SRC-045`  | Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados | `REUTILIZAR_Y_COMPLETAR` | `UNDER_DEFINITION` |
| `VPROC-0046`          | `ASIS-SRC-046`  | Gestionar reclamo, devolución, compensación y aprendizaje de causa                          | `CONSTRUIR`              | `UNDER_DEFINITION` |
| `VPROC-0047`          | `ASIS-SRC-047`  | Gestionar reservas, eventos y comunicaciones al cliente con capacidad y consentimiento      | `CONSTRUIR`              | `UNDER_DEFINITION` |

##### 9.11. Transporte y entregas

| Identificador estable | Alias de origen | Referencia funcional provisional                                                    | Tratamiento heredado         | Estado de registro |
| --------------------- | --------------- | ----------------------------------------------------------------------------------- | ---------------------------- | ------------------ |
| `VPROC-0048`          | `ASIS-SRC-048`  | Planear ruta, vehículo, carga, secuencia y restricciones antes del despacho         | `CONSTRUIR`                  | `UNDER_DEFINITION` |
| `VPROC-0049`          | `ASIS-SRC-049`  | Ejecutar ruta y confirmar entrega, rechazo, novedad o retorno con prueba suficiente | `CONSTRUIR`                  | `UNDER_DEFINITION` |
| `VPROC-0050`          | `ASIS-SRC-050`  | Integrar entrega de tercero con seguimiento, prueba y conciliación interna          | `INTEGRAR_AUTORIDAD_EXTERNA` | `UNDER_DEFINITION` |

##### 9.12. Finanzas y obligaciones

| Identificador estable | Alias de origen | Referencia funcional provisional                                                          | Tratamiento heredado         | Estado de registro |
| --------------------- | --------------- | ----------------------------------------------------------------------------------------- | ---------------------------- | ------------------ |
| `VPROC-0051`          | `ASIS-SRC-051`  | Registrar hechos económicos desde eventos operativos y soportes correlacionados           | `UNIFICAR_Y_GOBERNAR`        | `UNDER_DEFINITION` |
| `VPROC-0052`          | `ASIS-SRC-052`  | Gestionar obligación, aprobación y pago a proveedor con conciliación bancaria             | `INTEGRAR_AUTORIDAD_EXTERNA` | `UNDER_DEFINITION` |
| `VPROC-0053`          | `ASIS-SRC-053`  | Gestionar cartera, cobro, recaudo, aplicación y diferencia                                | `CONSTRUIR`                  | `UNDER_DEFINITION` |
| `VPROC-0054`          | `ASIS-SRC-054`  | Gestionar costos, distribución, presupuesto, cierre y rentabilidad con reglas versionadas | `REUTILIZAR_Y_COMPLETAR`     | `UNDER_DEFINITION` |

##### 9.13. Instalaciones, marketing, tecnología, información y continuidad

| Identificador estable | Alias de origen | Referencia funcional provisional                                                                         | Tratamiento heredado         | Estado de registro |
| --------------------- | --------------- | -------------------------------------------------------------------------------------------------------- | ---------------------------- | ------------------ |
| `VPROC-0055`          | `ASIS-SRC-055`  | Gestionar limpieza, inspección, mantenimiento, plagas, servicios y cierre de novedades de instalaciones  | `MANUAL_CONTROLADO`          | `UNDER_DEFINITION` |
| `VPROC-0056`          | `ASIS-SRC-056`  | Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro                | `MANUAL_CONTROLADO`          | `UNDER_DEFINITION` |
| `VPROC-0057`          | `ASIS-SRC-057`  | Convertir consultas y oportunidades de canales digitales en casos comerciales trazables                  | `INTEGRAR_AUTORIDAD_EXTERNA` | `UNDER_DEFINITION` |
| `VPROC-0058`          | `ASIS-SRC-058`  | Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento    | `CONSTRUIR`                  | `UNDER_DEFINITION` |
| `VPROC-0059`          | `ASIS-SRC-059`  | Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación                 | `CONSTRUIR`                  | `UNDER_DEFINITION` |
| `VPROC-0060`          | `ASIS-SRC-060`  | Gestionar documentos y evidencia desde creación hasta disposición con metadatos y custodia               | `UNIFICAR_Y_GOBERNAR`        | `UNDER_DEFINITION` |
| `VPROC-0061`          | `ASIS-SRC-061`  | Gestionar medición, análisis, decisión de mejora y verificación de resultado                             | `REUTILIZAR_Y_COMPLETAR`     | `UNDER_DEFINITION` |
| `VPROC-0062`          | `ASIS-SRC-062`  | Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje | `CONSTRUIR`                  | `UNDER_DEFINITION` |

##### 9.14. Capacidades sin precursor AS-IS explícito

| Identificador estable | Alias de origen           | Referencia funcional provisional                                                                                                                                                                         | Tratamiento heredado         | Estado de registro |
| --------------------- | ------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------- | ------------------ |
| `VPROC-0063`          | `ADICIONAL-PROVISIONAL-A` | `CAP-01.07` — Gestionar riesgos empresariales: Gestionar riesgos estratégicos, financieros, operativos, legales y tecnológicos como registro versionado de riesgo, tratamiento y seguimiento.            | `CONSTRUIR`                  | `UNDER_DEFINITION` |
| `VPROC-0064`          | `ADICIONAL-PROVISIONAL-B` | `CAP-01.09` — Gestionar relaciones con asesores y autoridades: Gobernar requerimientos, conceptos, entregables, vencimientos, comunicaciones y evidencia sin delegar la propiedad interna del resultado. | `INTEGRAR_AUTORIDAD_EXTERNA` | `UNDER_DEFINITION` |
| `VPROC-0065`          | `ADICIONAL-PROVISIONAL-C` | `CAP-02.10` — Acompañar desempeño y desarrollo: Mantener un proceso diferido y sensible de objetivos, retroalimentación y decisiones, con uso explícito y privacidad aprobada.                           | `DIFERIR_CON_CONTROL`        | `UNDER_DEFINITION` |
| `VPROC-0066`          | `ADICIONAL-PROVISIONAL-D` | `CAP-03.03` — Entregar y controlar elementos de protección: Gestionar requisito, entrega, aceptación, vigencia, cambio, devolución y evidencia de elementos de protección.                               | `CONSTRUIR`                  | `UNDER_DEFINITION` |
| `VPROC-0067`          | `ADICIONAL-PROVISIONAL-E` | `CAP-07.11` — Gestionar kits y conjuntos: Definir kit, instancia, componentes obligatorios y opcionales, completitud, préstamo, devolución y sustitución sin confundir kit, activo, LPN o contenedor.    | `CONSTRUIR`                  | `UNDER_DEFINITION` |
| `VPROC-0068`          | `ADICIONAL-PROVISIONAL-F` | `CAP-10.06` — Medir satisfacción: Separar medición, incentivo, reclamo y compensación; conservar muestra, canal, consentimiento, respuesta y sesgo conocido.                                             | `REUTILIZAR_Y_COMPLETAR`     | `UNDER_DEFINITION` |
| `VPROC-0069`          | `ADICIONAL-PROVISIONAL-G` | `CAP-12.11` — Gestionar presupuestos: Gestionar versión presupuestal, supuestos, aprobación, vigencia, consumo, proyección y desviación sin convertir el presupuesto en hecho contable.                  | `CONSTRUIR`                  | `UNDER_DEFINITION` |


---

#### 10. Consecutivo disponible y nuevas asignaciones

Después de esta tarea:

```text
ÚLTIMO IDENTIFICADOR ASIGNADO
VPROC-0069

SIGUIENTE IDENTIFICADOR DISPONIBLE
VPROC-0070
```

Toda nueva identidad de proceso deberá:

1. demostrar que no es una actividad, capacidad, pantalla, documento, evento o variante;
2. buscar coincidencias y posibles duplicados en el registro completo;
3. declarar su frontera provisional y fuente;
4. vincularse con una tarea canónica existente o materializar una tarea nueva;
5. recibir el siguiente consecutivo disponible;
6. registrar origen, alias y decisión;
7. actualizar el compilado y ejecutar validación de unicidad;
8. generar o actualizar requisitos de prueba cuando cree comportamiento verificable.

No se podrán reservar bloques numéricos por aplicación, área o dominio.

---

#### 11. Uso obligatorio en tareas posteriores

A partir de la aprobación de esta tarea:

- `PROC-CAT-004` a `PROC-CAT-020` deberán identificar cada proceso mediante `VPROC-*`;
- las referencias `ASIS-SRC-*` y `ADICIONAL-PROVISIONAL-*` permanecerán únicamente como alias y trazabilidad de origen;
- los mapas de actores, pantallas, estaciones, integraciones, datos, evidencia, cobertura y paquetes deberán utilizar `VPROC-*` como clave de enlace del proceso;
- una tarea no podrá crear otra identidad para el mismo proceso mediante nombre libre;
- una implementación futura deberá rechazar identificadores desconocidos o no resolubles;
- los alias no deberán persistirse como claves primarias de nuevas relaciones;
- la existencia de `VPROC-*` no autoriza navegación, permiso, operación ni despliegue.

---

#### 12. Decisiones reservadas

| Decisión                                         | Tarea propietaria                      |
| ------------------------------------------------ | -------------------------------------- |
| propósito empresarial definitivo                 | `PROC-CAT-004`                         |
| aplicación propietaria                           | `PROC-CAT-005`                         |
| aplicaciones consumidoras                        | `PROC-CAT-006`                         |
| actor iniciador y continuadores                  | `PROC-CAT-007`; `PROC-CAT-008`         |
| estados y transiciones                           | `PROC-CAT-009` a `PROC-CAT-012`        |
| excepciones y correcciones                       | `PROC-CAT-013`; `PROC-CAT-014`         |
| entradas y salidas                               | `PROC-CAT-015`; `PROC-CAT-016`         |
| eventos y auditoría                              | `PROC-CAT-017`; `PROC-CAT-018`         |
| métricas                                         | `PROC-CAT-019`                         |
| detección de duplicados, fusiones o separaciones | `PROC-CAT-020`                         |
| actores detallados                               | `PROC-ACTOR-001` a `PROC-ACTOR-010`    |
| modelo físico del registro                       | BLOQUE E3                              |
| materialización en código y datos                | paquete E5 y BLOQUE R correspondientes |

Esta tarea no modifica ninguna de esas decisiones.

---

#### 13. Reconciliación y pendientes

| Elemento                                | Resolución                                                                                                 |
| --------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| 62 referencias `ASIS-SRC-*`             | Todas reciben un `VPROC-*` único.                                                                          |
| 7 referencias `ADICIONAL-PROVISIONAL-*` | Todas reciben un `VPROC-*` único.                                                                          |
| posibles duplicidades entre procesos    | No se resuelven anticipadamente; quedan vinculadas a `PROC-CAT-020` con reglas de fusión sin renumeración. |
| posibles divisiones futuras             | Se resuelven con identidades hijas nuevas y linaje conforme a la sección 8.4.                              |
| persistencia física del registro        | Se reserva expresamente para BLOQUE E3 y su implementación versionada posterior en `vento-shell`.          |
| nombres y propósitos definitivos        | Se reservan para `PROC-CAT-004`.                                                                           |

**Resultado:** no se detecta una brecha nueva sin destino documental.

---

#### 14. Impacto contractual

| Dimensión                     | Resultado                                                                                   |
| ----------------------------- | ------------------------------------------------------------------------------------------- |
| permisos                      | No se crean ni modifican claves de permiso. `VPROC-*` no es un permiso.                     |
| modalidad y alcance           | No se modifican.                                                                            |
| turno, check-in y área activa | No se modifican.                                                                            |
| dispositivo compartido        | No se modifica.                                                                             |
| simulación                    | No se modifica.                                                                             |
| recursos                      | No se crean contratos de recurso.                                                           |
| matrices                      | No se regeneran.                                                                            |
| Supabase, RLS, RPC y Storage  | No se modifican.                                                                            |
| aplicaciones                  | No se asigna propiedad.                                                                     |
| experiencia y navegación      | No se diseñan pantallas ni rutas.                                                           |
| datos                         | Se define únicamente el contrato documental del registro; el modelo físico queda reservado. |
| migraciones                   | No se crean. Toda migración futura deberá crearse y documentarse en `vento-shell`.          |

---

#### 15. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

| ID              | Regla protegida                                                                                                                             | Riesgo evitado                                                    | Tipo                               | Prioridad | Momento de implementación                                                          | Destino                                                                                                |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------- | ---------------------------------- | --------- | ---------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `TREQ-PROC-009` | Todo `process_id` deberá cumplir `^VPROC-[0-9]{4}$`, ser único y resolver exactamente a una entrada del registro.                           | colisión, referencia ambigua o identificador inválido             | contrato + CI                      | crítica   | al materializar el registro y en cada cambio documental o físico                   | Registro Canónico de Requisitos de Prueba; compilador/verificador; BLOQUE E3                           |
| `TREQ-PROC-010` | Un `VPROC-*` asignado no podrá renumerarse, cambiar de identidad ni reutilizarse después de retiro, fusión, división o anulación.           | corrupción de trazabilidad histórica                              | contrato + regresión + migración   | crítica   | junto con el registro físico y cada migración que lo modifique                     | Registro Canónico de Requisitos de Prueba; BLOQUES E3, R y U                                           |
| `TREQ-PROC-011` | Las 69 referencias de origen deberán mapear uno a uno hacia `VPROC-0001` a `VPROC-0069`, sin alias huérfanos ni identificadores duplicados. | pérdida de cobertura entre AS-IS y TO-BE                          | reconciliación + CI                | crítica   | consolidación de `PROC-CAT-003` y regresión posterior                              | Registro Canónico de Requisitos de Prueba; compilador/verificador; `PROC-COVER-001` a `PROC-COVER-010` |
| `TREQ-PROC-012` | Toda fusión, división, retiro o reactivación deberá conservar linaje resoluble y referencias históricas sin reescritura retrospectiva.      | historia rota, eventos huérfanos o integraciones inconsistentes   | contrato + integración + auditoría | crítica   | cuando `PROC-CAT-020` o una decisión posterior evolucione identidades              | Registro Canónico de Requisitos de Prueba; `PROC-CAT-020`; BLOQUES E3 y U                              |
| `TREQ-PROC-013` | Ningún consumidor nuevo podrá usar `ASIS-SRC-*`, `ADICIONAL-PROVISIONAL-*`, nombre humano o slug como clave primaria del proceso.           | nuevas relaciones dependientes de claves mutables o provisionales | arquitectura + CI + integración    | alta      | desde la aprobación y junto con cada paquete que introduzca referencias de proceso | Registro Canónico de Requisitos de Prueba; BLOQUES E3, E5, T y U                                       |

Los requisitos `TREQ-PROC-009` a `TREQ-PROC-013` deberán materializarse en el Registro Canónico de Requisitos de Prueba durante la consolidación posterior a la aprobación.

---

#### 16. Criterios de aceptación

- [ ] `E1-GATE-001`, `PROC-CAT-001` y `PROC-CAT-002` figuran aprobadas.
- [ ] Existe un único artefacto `PROC-CANONICAL-ID-REGISTRY-001`.
- [ ] La convención es `VPROC-####` y no colisiona con tareas, artefactos, capacidades o pruebas.
- [ ] `VPROC-0000` permanece inválido.
- [ ] Se asignaron exactamente 69 identificadores únicos.
- [ ] `VPROC-0001` a `VPROC-0062` cubren exactamente las 62 referencias `ASIS-SRC-*`.
- [ ] `VPROC-0063` a `VPROC-0069` cubren exactamente las siete referencias adicionales de `PROC-CAT-002`.
- [ ] No existen referencias de origen duplicadas ni sin identificador.
- [ ] El siguiente consecutivo disponible es `VPROC-0070`.
- [ ] Ningún identificador codifica aplicación, dominio, propietario, actor, sede, prioridad, estado o nombre.
- [ ] Renombre, cambio de propiedad o cambio técnico conservan el mismo identificador.
- [ ] Fusión, división, retiro, reactivación y anulación conservan trazabilidad y no reutilizan números.
- [ ] Las descripciones incluidas permanecen como referencias provisionales y no sustituyen `PROC-CAT-004`.
- [ ] `PROC-CAT-020` puede fusionar o dividir sin renumerar silenciosamente la historia.
- [ ] Se generaron y vincularon `TREQ-PROC-009` a `TREQ-PROC-013`.
- [ ] No se modificó código, Supabase, RLS, RPC, Storage, migraciones ni operación.
- [ ] Toda futura migración de Supabase queda reservada para `vento-shell`.
- [ ] El marcador de `PROC-CAT-004` permanece sin iniciar.

---

#### 17. Estado

```text
APROBADA
```

No se inicia `PROC-CAT-004` hasta la aprobación expresa de `PROC-CAT-003`.
