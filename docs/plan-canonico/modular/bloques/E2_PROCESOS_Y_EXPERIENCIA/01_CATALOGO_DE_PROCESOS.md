### CATÁLOGO DE PROCESOS

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

### [ ] PROC-CAT-002 — Diseñar el proceso TO-BE para capacidades manuales, parciales, rotas o ausentes
### [ ] PROC-CAT-003 — Crear identificador estable para cada proceso
### [ ] PROC-CAT-004 — Definir propósito empresarial de cada proceso
### [ ] PROC-CAT-005 — Definir aplicación propietaria de cada proceso
### [ ] PROC-CAT-006 — Definir aplicaciones consumidoras de cada proceso
### [ ] PROC-CAT-007 — Definir actor que inicia cada proceso
### [ ] PROC-CAT-008 — Definir actores que continúan cada proceso
### [ ] PROC-CAT-009 — Definir estado inicial de cada proceso
### [ ] PROC-CAT-010 — Definir estados intermedios
### [ ] PROC-CAT-011 — Definir estado final
### [ ] PROC-CAT-012 — Definir transiciones permitidas
### [ ] PROC-CAT-013 — Definir acciones excepcionales
### [ ] PROC-CAT-014 — Definir cancelación, reversión y corrección
### [ ] PROC-CAT-015 — Definir información de entrada
### [ ] PROC-CAT-016 — Definir información producida
### [ ] PROC-CAT-017 — Definir eventos empresariales emitidos
### [ ] PROC-CAT-018 — Definir auditoría necesaria
### [ ] PROC-CAT-019 — Definir métricas de operación
### [ ] PROC-CAT-020 — Identificar procesos duplicados entre aplicaciones
