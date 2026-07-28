COBERTURA DE PROCESOS

### ✅ PROC-COVER-001 — Vincular cada proceso con una capacidad aprobada en E1

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] PROC-COVER-001 — Vincular cada proceso con una capacidad aprobada en E1`

**Tarea anterior:** `PROC-SCREEN-028 — Definir criterio de aceptación operativo` — APROBADA

**Siguiente tarea reservada:** `PROC-COVER-002 — Vincular cada proceso con su operación manual actual` — NO INICIADA

**Artefactos lógicos contenidos en esta tarea:**

- `PROCESS-E1-CAPABILITY-BINDING-CONTRACT-001`;
- `PROCESS-PRIMARY-CAPABILITY-RULE-001`;
- `PROCESS-SUPPORTING-CAPABILITY-RULE-001`;
- `PROCESS-E1-FAMILY-REFINEMENT-RULE-001`;
- `PROCESS-E1-CAPABILITY-BINDING-MATRIX-001`;
- `PROCESS-CAPABILITY-CROSS-FAMILY-REGISTER-001`;
- `PROCESS-CAPABILITY-VERSIONING-AND-IMPACT-001`;
- `PROCESS-COVERAGE-CARRYOVER-001`;

**Naturaleza:** contrato documental de trazabilidad entre los 69 procesos canónicos `VPROC-*` y el mapa aprobado de capacidades de E1. No determina todavía operación manual, implementación actual, completitud, alcance mínimo u objetivo ni estado productivo.

**Cambios en procesos aprobados, capacidades E1, aplicaciones, pantallas, actores, permisos, datos, código, Supabase, migraciones o producción:** no autorizados por esta tarea.

---

#### 1. Propósito

Garantizar que cada proceso canónico existe para producir al menos un resultado empresarial reconocido por el mapa E1 y que su frontera no fue creada únicamente por una aplicación, pantalla, rol, tabla, documento o costumbre operativa.

```text
CAPACIDAD E1 APROBADA
        +
PROCESO VPROC-* CANÓNICO
        +
RESULTADO PRIMARIO Y CAPACIDADES DE APOYO
        =
TRAZABILIDAD FUNCIONAL SIN AFIRMAR IMPLEMENTACIÓN
```

El vínculo acredita necesidad empresarial y coherencia de frontera. No acredita que el proceso esté implementado, completo, digitalizado, operativo ni aceptado.

---

#### 2. Dependencias y línea base preservada

Esta tarea consume sin reemplazar:

- `E1-GATE-MANIFEST-002`, que cerró E1 como `CLOSED_WITH_CARRYOVER`;
- `CAP-MAP-001` a `CAP-MAP-015` y su mapa de 18 familias y 217 capacidades;
- `PROC-ASIS-CATALOG-001`, con 62 agrupaciones AS-IS y referencias de capacidad;
- `PROC-TOBE-DESIGN-001` y los siete procesos adicionales materializados;
- `PROC-CANONICAL-ID-REGISTRY-001`, con `VPROC-0001` a `VPROC-0069`;
- `PROC-CAT-004` a `PROC-CAT-020`, que completaron el contrato de proceso;
- las 177 pantallas y sus vínculos de proceso aprobados;
- el registro canónico de brechas de E1.

La huella de las 69 identidades y definiciones consumidas es:

```text
a294bbd6b3564b155af78314b86849089b64e18efcdaad4f11764b40e70639ad
```

La huella del catálogo aprobado de capacidades utilizado es:

```text
5f0cf2e28f96475daf4b7f46007e830d09700c41e1d23e82c5284105f1651872
```

---

#### 3. Distinciones obligatorias

| Concepto | Significado | Prohibición |
| --- | --- | --- |
| capacidad | Resultado estable que Vento Group debe poder producir. | No se convierte en proceso, permiso, pantalla o módulo. |
| proceso | Secuencia de principio a fin que produce un resultado y conserva estados, actores, información y evidencia. | No se considera implementado por estar vinculado a una capacidad. |
| capacidad primaria | Resultado dominante que justifica la identidad y frontera del proceso. | No implica propiedad exclusiva sobre toda la familia. |
| capacidad de apoyo | Resultado adicional consumido o coordinado por el proceso. | No se absorbe ni desaparece del mapa E1. |
| familia E1 | Agrupación `CAP-01` a `CAP-18`. | No podrá quedar como referencia ambigua si el propósito TO-BE permite seleccionar miembros aprobados. |
| aplicación o soporte | Medio actual o futuro. | No define la capacidad ni la identidad `VPROC-*`. |

---

#### 4. Regla canónica de vinculación

Cada proceso deberá declarar:

1. un único `primary_capability_id` existente en el mapa E1;
2. cero o más `supporting_capability_ids[]` existentes;
3. la referencia original de E1 que originó el vínculo;
4. el tipo de vínculo y cualquier refinamiento desde familia;
5. la evidencia AS-IS o TO-BE que justifica la relación;
6. una frontera que impida confundir capacidad con proceso;
7. estado `LINKED_TO_APPROVED_E1_CAPABILITY`.

```text
VPROC SIN CAPACIDAD VÁLIDA → INVALID_COVERAGE
CAPACIDAD INEXISTENTE → INVALID_REFERENCE
FAMILIA REFINADA FUERA DE SU RAMA → INVALID_REFINEMENT
VÍNCULO VÁLIDO → LINKED_TO_APPROVED_E1_CAPABILITY
```

Un proceso no podrá continuar hacia `PROC-COVER-008` con estado inválido.

---

#### 5. Capacidad primaria y capacidades de apoyo

- La capacidad primaria expresa el resultado dominante del proceso, no necesariamente su primer paso.
- Las capacidades de apoyo preservan resultados necesarios que cruzan familias o etapas.
- Un proceso puede coordinar varias capacidades sin apropiarse de ellas ni crear duplicados.
- Dos procesos pueden apoyar una misma capacidad si producen resultados, casos o cierres distintos.
- Cambiar la capacidad primaria exige análisis de identidad, propósito, pantallas, eventos, métricas y paquetes.
- Añadir o retirar una capacidad de apoyo exige versionar la matriz y verificar consumidores.

---

#### 6. Refinamiento de referencias familiares de E1

En 12 procesos, la fuente AS-IS utilizó una familia completa como `CAP-13`, `CAP-15`, `CAP-16`, `CAP-17` o `CAP-18`. Esta tarea no crea capacidades nuevas: selecciona exclusivamente miembros ya aprobados dentro de la misma rama, utilizando el propósito TO-BE como evidencia de precisión.

```text
REFERENCIA E1 A FAMILIA
        ↓
PROPÓSITO TO-BE APROBADO
        ↓
SELECCIÓN DE CAPACIDADES EXISTENTES DENTRO DE LA MISMA FAMILIA
        ↓
CERO CÓDIGOS NUEVOS
```

Un refinamiento fuera de la familia original requeriría una relación E1 adicional explícita y revisión en `PROC-COVER-010`.

---

#### 7. Tipos de vínculo utilizados

| Tipo | Regla | Cantidad |
| --- | --- | ---: |
| `DIRECT_EXACT` | Una capacidad exacta aprobada coincide con el resultado dominante. | 15 |
| `COMPOSITE_EXACT` | La fuente E1 enumeró varias capacidades exactas. | 28 |
| `RANGE_EXPANDED_TO_APPROVED_CAPABILITIES` | Un rango E1 se expande únicamente a códigos existentes. | 14 |
| `FAMILY_REFINED_WITHIN_APPROVED_E1_MAP` | Una referencia familiar se precisa con miembros aprobados de la misma rama. | 12 |

---

#### 8. PROCESS-E1-CAPABILITY-BINDING-MATRIX-001

| Proceso | Definición TO-BE preservada | Origen E1 | Referencia E1 original | Capacidad primaria | Capacidades de apoyo | Tipo de vínculo | Alcance observado | Evidencia E1 | Justificación de frontera | Estado |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `VPROC-0001` | Gobernar decisiones empresariales con registro, alcance, responsable, compromisos y seguimiento | `ASIS-SRC-001` | CAP-01.01; CAP-01.02; CAP-01.10 | `CAP-01.02` — Tomar y registrar decisiones empresariales | `CAP-01.01`; `CAP-01.10` | `COMPOSITE_EXACT` | Dirección corporativa; empresas y marcas | OPS-GOV-001; decisiones y seguimiento dispersos | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0002` | Mantener una estructura organizativa y jurídica coherente entre empresas, marcas, establecimientos, sedes y áreas | `ASIS-SRC-002` | CAP-01.03; CAP-01.04 | `CAP-01.03` — Gobernar empresas, marcas y establecimientos | `CAP-01.04` | `COMPOSITE_EXACT` | Vento Group; marcas; sedes | OPS-AUD-001; OPS-ADM-001; titularidad, marca y operación no siempre coinciden | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0003` | Gobernar responsabilidades, políticas, delegaciones y límites de decisión mediante versiones vigentes | `ASIS-SRC-003` | CAP-01.05; CAP-01.06 | `CAP-01.05` — Definir responsabilidades y límites de decisión | `CAP-01.06` | `COMPOSITE_EXACT` | Transversal | OPS-AUD-002; responsabilidades implícitas, temporales o vacantes | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0004` | Coordinar compromisos y transferencias de trabajo entre negocios, sedes y áreas | `ASIS-SRC-004` | CAP-01.08 | `CAP-01.08` — Coordinar operación entre negocios y sedes | — | `DIRECT_EXACT` | Todas las sedes y marcas | OPS-AUD-003; dependencia de conocimiento personal | El propósito TO-BE coincide directamente con una capacidad aprobada en E1. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0005` | Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo | `ASIS-SRC-005` | CAP-02.01; CAP-02.02 | `CAP-02.02` — Reclutar y seleccionar | `CAP-02.01` | `COMPOSITE_EXACT` | Todas las operaciones | OPS-AUD-005; criterios no uniformes | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0006` | Orquestar vinculación, expediente, incorporación, preparación y habilitación inicial de la persona | `ASIS-SRC-006` | CAP-02.03; CAP-02.04; CAP-02.09; CAP-02.11 | `CAP-02.03` — Vincular e incorporar trabajadores | `CAP-02.04`; `CAP-02.09`; `CAP-02.11` | `COMPOSITE_EXACT` | Todas las operaciones | OPS-AUD-005; alta documental y tecnológica separadas | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0007` | Administrar asignaciones laborales y programación publicada con historial y revisión controlada | `ASIS-SRC-007` | CAP-02.05; CAP-02.06 | `CAP-02.06` — Programar turnos | `CAP-02.05` | `COMPOSITE_EXACT` | Sedes y áreas | OPS-AUD-002; variaciones por sede y reemplazos | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0008` | Capturar asistencia como hechos inmutables y corregirla mediante decisiones auditables | `ASIS-SRC-008` | CAP-02.07 | `CAP-02.07` — Registrar asistencia y tiempo trabajado | — | `DIRECT_EXACT` | Trabajadores y sedes | CAP-MAP-006; correcciones y excepciones pendientes | El propósito TO-BE coincide directamente con una capacidad aprobada en E1. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0009` | Gestionar novedades, ausencias, permisos y reemplazos como casos laborales completos | `ASIS-SRC-009` | CAP-02.08 | `CAP-02.08` — Gestionar novedades, ausencias y reemplazos | — | `DIRECT_EXACT` | Todas las sedes | OPS-AUD-002; flujo de corrección no uniforme | El propósito TO-BE coincide directamente con una capacidad aprobada en E1. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0010` | Preparar y reconciliar el paquete autorizado para pagos y beneficios laborales | `ASIS-SRC-010` | CAP-02.12 | `CAP-02.12` — Gestionar pagos y beneficios laborales | — | `DIRECT_EXACT` | Administración; trabajadores | OPS-PLAN-001; fuentes y aprobaciones distribuidas | El propósito TO-BE coincide directamente con una capacidad aprobada en E1. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0011` | Orquestar retiro laboral, devolución, revocación de accesos y cierre documental | `ASIS-SRC-011` | CAP-02.13; CAP-15 | `CAP-02.13` — Gestionar retiro y cierre de accesos | `CAP-15.01`; `CAP-15.02`; `CAP-15.05` | `FAMILY_REFINED_WITHIN_APPROVED_E1_MAP` | Aplicaciones y sedes | CAP-SCOPE-015; cierre integral no confirmado | E1 vinculó el candidato a una familia; este contrato selecciona miembros existentes de esa misma familia según el resultado TO-BE, sin crear ni renombrar capacidades. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0012` | Gestionar riesgos, inspecciones, controles preventivos y acciones correctivas | `ASIS-SRC-012` | CAP-03.01; CAP-03.02; CAP-03.07; CAP-03.10 | `CAP-03.01` — Identificar peligros y riesgos laborales | `CAP-03.02`; `CAP-03.07`; `CAP-03.10` | `COMPOSITE_EXACT` | Sedes y áreas | OPS-AUD-006; seguimiento no uniforme | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0013` | Gestionar incidentes, accidentes y emergencias con respuesta inmediata y expediente posterior | `ASIS-SRC-013` | CAP-03.04; CAP-03.05; CAP-03.09 | `CAP-03.04` — Reportar e investigar incidentes | `CAP-03.05`; `CAP-03.09` | `COMPOSITE_EXACT` | Todas las sedes | OPS-AUD-006; evidencia y acciones separadas | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0014` | Ejecutar controles de higiene, inocuidad y cumplimiento mediante procedimientos versionados | `ASIS-SRC-014` | CAP-03.06; CAP-03.08; CAP-03.10 | `CAP-03.06` — Controlar higiene e inocuidad | `CAP-03.08`; `CAP-03.10` | `COMPOSITE_EXACT` | Producción y puntos de venta | OPS-AUD-006; variación por área | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0015` | Gobernar el ciclo de vida de productos, presentaciones, unidades y equivalencias | `ASIS-SRC-015` | CAP-04.01 a CAP-04.04 | `CAP-04.01` — Definir productos y servicios | `CAP-04.02`; `CAP-04.03`; `CAP-04.04` | `RANGE_EXPANDED_TO_APPROVED_CAPABILITIES` | Todas las marcas y aplicaciones | OPS-AUD-007; identidad y versiones no unificadas | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0016` | Gestionar desarrollo, prueba, aprobación, publicación y versión de recetas | `ASIS-SRC-016` | CAP-04.05; CAP-04.06; CAP-04.09; CAP-04.10 | `CAP-04.05` — Definir recetas y métodos de preparación | `CAP-04.06`; `CAP-04.09`; `CAP-04.10` | `COMPOSITE_EXACT` | Centro de Producción; sedes | CAP-SCOPE-006; recetas incompletas | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0017` | Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales | `ASIS-SRC-017` | CAP-04.07; CAP-09.01 | `CAP-04.07` — Gestionar menús y disponibilidad | `CAP-09.01` | `COMPOSITE_EXACT` | Vento Café; Saudo; Molka; canales | OPS-AUD-008; actualización duplicada | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0018` | Mantener especificaciones, alérgenos, restricciones y criterios de calidad del producto | `ASIS-SRC-018` | CAP-04.08; CAP-04.09 | `CAP-04.09` — Gestionar calidad y especificaciones | `CAP-04.08` | `COMPOSITE_EXACT` | Producción y venta | CAP-SCOPE-010; publicación incompleta | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0019` | Capturar y priorizar necesidades de compra mediante una entrada única y trazable | `ASIS-SRC-019` | CAP-05.01; CAP-05.02 | `CAP-05.02` — Solicitar productos, materiales o servicios | `CAP-05.01` | `COMPOSITE_EXACT` | Áreas productivas; sedes; administración | OPS-AUD-009; no existe entrada única | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0020` | Comparar proveedores y condiciones con evidencia suficiente para decidir | `ASIS-SRC-020` | CAP-05.03 a CAP-05.05 | `CAP-05.04` — Solicitar y comparar ofertas | `CAP-05.03`; `CAP-05.05` | `RANGE_EXPANDED_TO_APPROVED_CAPABILITIES` | Compras | OPS-AUD-009; decisión no siempre trazable | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0021` | Aprobar y emitir compras separando flujo ordinario, urgencia y excepción | `ASIS-SRC-021` | CAP-05.06; CAP-05.07; CAP-05.12 | `CAP-05.07` — Emitir y controlar órdenes | `CAP-05.06`; `CAP-05.12` | `COMPOSITE_EXACT` | Gerencia; compras | CODE-AUD-001; compra ordinaria y urgente mezcladas | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0022` | Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica | `ASIS-SRC-022` | CAP-05.08 a CAP-05.11 | `CAP-05.08` — Recibir productos y servicios | `CAP-05.09`; `CAP-05.10`; `CAP-05.11` | `RANGE_EXPANDED_TO_APPROVED_CAPABILITIES` | Centro de Producción; sedes | CAP-COVER-006; recepción, inventario y documentos no conciliados | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0023` | Gobernar sedes, LOC, zonas, posiciones y condiciones de almacenamiento | `ASIS-SRC-023` | CAP-06.01; CAP-06.02 | `CAP-06.01` — Definir lugares de almacenamiento | `CAP-06.02` | `COMPOSITE_EXACT` | Sedes; áreas; ubicaciones | CAP-MAP-003; ubicaciones físicas y lógicas incompletas | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0024` | Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados | `ASIS-SRC-024` | CAP-06.03; CAP-06.04; CAP-06.05 | `CAP-06.03` — Registrar entradas | `CAP-06.04`; `CAP-06.05` | `COMPOSITE_EXACT` | Centro de Producción; satélites | CODE-AUD-001; efecto real por ubicación incompleto | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0025` | Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino | `ASIS-SRC-025` | CAP-06.06 a CAP-06.08 | `CAP-06.07` — Registrar consumo y salida | `CAP-06.06`; `CAP-06.08` | `RANGE_EXPANDED_TO_APPROVED_CAPABILITIES` | Áreas y ubicaciones | CAP-SCOPE-006; conversiones y ubicaciones | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0026` | Contar como observación, investigar diferencias y ajustar mediante decisión separada | `ASIS-SRC-026` | CAP-06.12; CAP-06.13 | `CAP-06.12` — Contar inventario | `CAP-06.13` | `COMPOSITE_EXACT` | Sedes; áreas; ubicaciones | CODE-AUD-010; ajuste y evidencia incompletos | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0027` | Gestionar condición, vencimiento, cuarentena, merma, pérdida, frío y disposición | `ASIS-SRC-027` | CAP-06.14; CAP-06.15 | `CAP-06.14` — Controlar vencimiento, daño y pérdida | `CAP-06.15` | `COMPOSITE_EXACT` | Inventarios y producción | CAP-SCOPE-018; cuarentena y disposición incompletas | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0028` | Ejecutar abastecimiento interno de solicitud a recepción con cantidades conciliables por etapa | `ASIS-SRC-028` | CAP-06.09 a CAP-06.11; CAP-11 | `CAP-06.09` — Solicitar y gestionar remisiones | `CAP-06.10`; `CAP-06.11`; `CAP-11.01`; `CAP-11.02`; `CAP-11.03`; `CAP-11.04`; `CAP-11.05`; `CAP-11.06`; `CAP-11.07`; `CAP-11.08`; `CAP-11.09`; `CAP-11.10`; `CAP-11.11` | `FAMILY_REFINED_WITHIN_APPROVED_E1_MAP` | Centro de Producción; satélites | CAP-MAP-009; estados y cantidades no conciliados | E1 vinculó el candidato a una familia; este contrato selecciona miembros existentes de esa misma familia según el resultado TO-BE, sin crear ni renombrar capacidades. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0029` | Gestionar identidad, ubicación, custodia, préstamo y transferencia de activos | `ASIS-SRC-029` | CAP-07.01 a CAP-07.06 | `CAP-07.02` — Registrar ubicación y custodia | `CAP-07.01`; `CAP-07.03`; `CAP-07.04`; `CAP-07.05`; `CAP-07.06` | `RANGE_EXPANDED_TO_APPROVED_CAPABILITIES` | Sedes; puntos externos; trabajadores | OPS-ACT-001; custodia incompleta | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0030` | Gestionar mantenimiento, reparación, garantía, repuesto y disposición de activos | `ASIS-SRC-030` | CAP-07.07 a CAP-07.10 | `CAP-07.07` — Planear y ejecutar mantenimiento | `CAP-07.08`; `CAP-07.09`; `CAP-07.10` | `RANGE_EXPANDED_TO_APPROVED_CAPABILITIES` | Equipos e instalaciones | CAP-SCOPE-015; historial no centralizado | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0031` | Gestionar disponibilidad de vehículos, combustible, kilometraje e incidencias | `ASIS-SRC-031` | CAP-07.12; CAP-07.13 | `CAP-07.12` — Gestionar vehículos y equipos de transporte | `CAP-07.13` | `COMPOSITE_EXACT` | Camioneta; conductor; gerencia | OPS-ACT-001; dependencia del conductor | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0032` | Controlar entrega, tenencia, retorno, pérdida y completitud de reutilizables y contenedores | `ASIS-SRC-032` | CAP-07.03 a CAP-07.06; CAP-11 | `CAP-07.03` — Entregar, prestar y devolver | `CAP-07.04`; `CAP-07.05`; `CAP-07.06`; `CAP-11.04`; `CAP-11.06`; `CAP-11.09`; `CAP-11.10`; `CAP-11.11` | `FAMILY_REFINED_WITHIN_APPROVED_E1_MAP` | Centro de Producción y satélites | OPS-AUD-001; ciclo de retorno incompleto | E1 vinculó el candidato a una familia; este contrato selecciona miembros existentes de esa misma familia según el resultado TO-BE, sin crear ni renombrar capacidades. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0033` | Planear producción desde demanda, inventario, capacidad, prioridad y fecha requerida | `ASIS-SRC-033` | CAP-08.01 a CAP-08.05 | `CAP-08.02` — Planear cantidades y fechas | `CAP-08.01`; `CAP-08.03`; `CAP-08.04`; `CAP-08.05` | `RANGE_EXPANDED_TO_APPROVED_CAPABILITIES` | Centro de Producción; satélites | OPS-AUD-011; demanda, stock y capacidad separados | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0034` | Preparar materiales y ejecutar producción contra una versión aprobada | `ASIS-SRC-034` | CAP-08.06 a CAP-08.09 | `CAP-08.07` — Ejecutar lotes o preparaciones | `CAP-08.06`; `CAP-08.08`; `CAP-08.09` | `RANGE_EXPANDED_TO_APPROVED_CAPABILITIES` | Áreas productivas | CAP-SCOPE-006; captura incompleta | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0035` | Inspeccionar y decidir liberación, retención, rechazo o corrección de producto | `ASIS-SRC-035` | CAP-08.10; CAP-08.12 | `CAP-08.12` — Liberar, retener o rechazar producto | `CAP-08.10` | `COMPOSITE_EXACT` | Áreas productivas; almacenamiento | CAP-SCOPE-018; criterios no uniformes | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0036` | Empacar, etiquetar y almacenar producto terminado con trazabilidad preservada | `ASIS-SRC-036` | CAP-08.11 | `CAP-08.11` — Empacar y etiquetar | — | `DIRECT_EXACT` | Áreas productivas; despacho | CAP-MAP-011; etiquetado central pendiente | El propósito TO-BE coincide directamente con una capacidad aprobada en E1. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0037` | Gestionar reproceso, aprovechamiento, rendimiento, merma y cierre productivo | `ASIS-SRC-037` | CAP-08.13; CAP-08.14 | `CAP-08.13` — Gestionar reproceso y aprovechamiento | `CAP-08.14` | `COMPOSITE_EXACT` | Áreas productivas | CAP-COVER-008; rendimiento y merma no conciliados | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0038` | Gestionar servicio en mesa de apertura a cierre con pedido, preparación, entrega, pago y conciliación | `ASIS-SRC-038` | CAP-09.02 a CAP-09.11 | `CAP-09.11` — Gestionar mesas y servicio presencial | `CAP-09.02`; `CAP-09.03`; `CAP-09.04`; `CAP-09.05`; `CAP-09.06`; `CAP-09.07`; `CAP-09.08`; `CAP-09.09`; `CAP-09.10` | `RANGE_EXPANDED_TO_APPROVED_CAPABILITIES` | Vento Café; Saudo; Molka | OPS-AUD-012; variantes por sede | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0039` | Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados | `ASIS-SRC-039` | CAP-09.02 a CAP-09.12 | `CAP-09.12` — Gestionar pedidos para llevar | `CAP-09.02`; `CAP-09.03`; `CAP-09.04`; `CAP-09.05`; `CAP-09.06`; `CAP-09.07`; `CAP-09.08`; `CAP-09.09`; `CAP-09.10`; `CAP-09.11` | `RANGE_EXPANDED_TO_APPROVED_CAPABILITIES` | Vento Café; Saudo; Molka | CAP-MAP-003; puntos integrados distintos | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0040` | Normalizar pedidos de canales externos y transferirlos al proceso interno con reconciliación | `ASIS-SRC-040` | CAP-09.13; CAP-11.12 | `CAP-09.13` — Gestionar pedidos recibidos por aplicaciones o mensajes | `CAP-11.12` | `COMPOSITE_EXACT` | Canales externos y sedes | CAP-MAP-009; sin integración automática confirmada | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0041` | Gestionar cotización, aprobación, capacidad, producción, facturación y entrega de catering o venta B2B | `ASIS-SRC-041` | CAP-09.14 | `CAP-09.14` — Gestionar pedidos especiales, catering y ventas a empresas | — | `DIRECT_EXACT` | Catering; empresas compradoras | OPS-GOV-001; modelo objetivo pendiente | El propósito TO-BE coincide directamente con una capacidad aprobada en E1. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0042` | Gestionar modificación, sustitución, cancelación, anulación y devolución sin confundir sus efectos | `ASIS-SRC-042` | CAP-09.05 | `CAP-09.05` — Modificar, sustituir o cancelar pedidos | — | `DIRECT_EXACT` | Puntos de venta y canales | GAP-CTRL-003; transiciones no diferenciadas | El propósito TO-BE coincide directamente con una capacidad aprobada en E1. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0043` | Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable | `ASIS-SRC-043` | CAP-09.08 a CAP-09.10; CAP-12.02; CAP-12.06 | `CAP-09.09` — Cobrar y confirmar pagos | `CAP-09.08`; `CAP-09.10`; `CAP-12.02`; `CAP-12.06` | `RANGE_EXPANDED_TO_APPROVED_CAPABILITIES` | Puntos de venta; titulares | OPS-GOV-001; marca, titular y emisor difieren | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0044` | Cerrar caja y conciliar ventas, pagos, efectivo, diferencias y responsables | `ASIS-SRC-044` | CAP-09.15; CAP-12.02; CAP-12.07 | `CAP-09.15` — Cerrar y revisar la jornada de venta | `CAP-12.02`; `CAP-12.07` | `COMPOSITE_EXACT` | Puntos de venta; administración | CAP-SCOPE-012; conciliación pendiente | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0045` | Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados | `ASIS-SRC-045` | CAP-10.01; CAP-10.02; CAP-10.07; CAP-10.10 | `CAP-10.07` — Gestionar fidelización y beneficios | `CAP-10.01`; `CAP-10.02`; `CAP-10.10` | `COMPOSITE_EXACT` | PASS; PULSO; puntos de venta | CAP-SCOPE-010; privacidad y redención | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0046` | Gestionar reclamo, devolución, compensación y aprendizaje de causa | `ASIS-SRC-046` | CAP-10.03 a CAP-10.05 | `CAP-10.04` — Recibir y resolver reclamos | `CAP-10.03`; `CAP-10.05` | `RANGE_EXPANDED_TO_APPROVED_CAPABILITIES` | Canales de atención y sedes | OPS-AUD-013; decisión y efecto separados | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0047` | Gestionar reservas, eventos y comunicaciones al cliente con capacidad y consentimiento | `ASIS-SRC-047` | CAP-10.08; CAP-10.09 | `CAP-10.08` — Gestionar reservas y eventos | `CAP-10.09` | `COMPOSITE_EXACT` | Vento Café; eventos; catering | CAP-MAP-009; disponibilidad no centralizada | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0048` | Planear ruta, vehículo, carga, secuencia y restricciones antes del despacho | `ASIS-SRC-048` | CAP-11.01 a CAP-11.06 | `CAP-11.02` — Definir recorridos y prioridades | `CAP-11.01`; `CAP-11.03`; `CAP-11.04`; `CAP-11.05`; `CAP-11.06` | `RANGE_EXPANDED_TO_APPROVED_CAPABILITIES` | Centro de Producción; sedes; vehículo | OPS-AUD-014; rutas y custodia personales | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0049` | Ejecutar ruta y confirmar entrega, rechazo, novedad o retorno con prueba suficiente | `ASIS-SRC-049` | CAP-11.07 a CAP-11.11 | `CAP-11.09` — Entregar y confirmar recepción | `CAP-11.07`; `CAP-11.08`; `CAP-11.10`; `CAP-11.11` | `RANGE_EXPANDED_TO_APPROVED_CAPABILITIES` | Rutas internas | CAP-MAP-009; novedades no centralizadas | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0050` | Integrar entrega de tercero con seguimiento, prueba y conciliación interna | `ASIS-SRC-050` | CAP-11.12 | `CAP-11.12` — Gestionar entregas mediante terceros | — | `DIRECT_EXACT` | Domicilios y canales externos | CAP-SCOPE-017; custodia externa | El propósito TO-BE coincide directamente con una capacidad aprobada en E1. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0051` | Registrar hechos económicos desde eventos operativos y soportes correlacionados | `ASIS-SRC-051` | CAP-12.01; CAP-12.06 | `CAP-12.01` — Registrar hechos económicos | `CAP-12.06` | `COMPOSITE_EXACT` | Operaciones; Contabilidad | CAP-SCOPE-012; fuentes no integradas | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0052` | Gestionar obligación, aprobación y pago a proveedor con conciliación bancaria | `ASIS-SRC-052` | CAP-12.03; CAP-12.05; CAP-12.08 | `CAP-12.05` — Gestionar cuentas por pagar | `CAP-12.03`; `CAP-12.08` | `COMPOSITE_EXACT` | Administración; proveedores | CAP-MAP-006; aprobaciones distribuidas | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0053` | Gestionar cartera, cobro, recaudo, aplicación y diferencia | `ASIS-SRC-053` | CAP-12.04; CAP-12.07 | `CAP-12.04` — Gestionar cuentas por cobrar | `CAP-12.07` | `COMPOSITE_EXACT` | Administración; clientes; canales | CAP-SCOPE-012; fuente de verdad pendiente | La capacidad primaria representa el resultado dominante; las restantes son capacidades necesarias de apoyo y no procesos independientes. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0054` | Gestionar costos, distribución, presupuesto, cierre y rentabilidad con reglas versionadas | `ASIS-SRC-054` | CAP-12.09; CAP-17 | `CAP-12.09` — Calcular costos | `CAP-17.03`; `CAP-17.04`; `CAP-17.09`; `CAP-17.10`; `CAP-17.11`; `CAP-17.12` | `FAMILY_REFINED_WITHIN_APPROVED_E1_MAP` | Administración; NUMERA | CODE-AUD-010; costeo y reglas incompletos | E1 vinculó el candidato a una familia; este contrato selecciona miembros existentes de esa misma familia según el resultado TO-BE, sin crear ni renombrar capacidades. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0055` | Gestionar limpieza, inspección, mantenimiento, plagas, servicios y cierre de novedades de instalaciones | `ASIS-SRC-055` | CAP-13 | `CAP-13.07` — Inspeccionar condiciones | `CAP-13.02`; `CAP-13.03`; `CAP-13.04`; `CAP-13.05`; `CAP-13.06`; `CAP-13.11` | `FAMILY_REFINED_WITHIN_APPROVED_E1_MAP` | Todas las sedes | OPS-ACT-001; evidencia variable | E1 vinculó el candidato a una familia; este contrato selecciona miembros existentes de esa misma familia según el resultado TO-BE, sin crear ni renombrar capacidades. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0056` | Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro | `ASIS-SRC-056` | CAP-14 | `CAP-14.03` — Crear y aprobar contenido | `CAP-14.02`; `CAP-14.04`; `CAP-14.05`; `CAP-14.06`; `CAP-14.10` | `FAMILY_REFINED_WITHIN_APPROVED_E1_MAP` | Marcas y canales | CAP-MAP-006; medición no uniforme | E1 vinculó el candidato a una familia; este contrato selecciona miembros existentes de esa misma familia según el resultado TO-BE, sin crear ni renombrar capacidades. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0057` | Convertir consultas y oportunidades de canales digitales en casos comerciales trazables | `ASIS-SRC-057` | CAP-14; CAP-09; CAP-10 | `CAP-14.07` — Captar oportunidades de venta | `CAP-09.02`; `CAP-10.03` | `FAMILY_REFINED_WITHIN_APPROVED_E1_MAP` | Instagram; ManyChat; WhatsApp | CAP-MAP-009; conversación y pedido separados | E1 vinculó el candidato a una familia; este contrato selecciona miembros existentes de esa misma familia según el resultado TO-BE, sin crear ni renombrar capacidades. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0058` | Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento | `ASIS-SRC-058` | CAP-15 | `CAP-15.06` — Atender solicitudes de soporte | `CAP-15.07`; `CAP-15.08`; `CAP-15.09`; `CAP-15.11` | `FAMILY_REFINED_WITHIN_APPROVED_E1_MAP` | Aplicaciones y dispositivos | CAP-SCOPE-015; sin registro único | E1 vinculó el candidato a una familia; este contrato selecciona miembros existentes de esa misma familia según el resultado TO-BE, sin crear ni renombrar capacidades. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0059` | Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación | `ASIS-SRC-059` | CAP-15; CAP-02.13 | `CAP-15.01` — Gestionar cuentas y accesos | `CAP-02.13`; `CAP-15.02`; `CAP-15.05` | `FAMILY_REFINED_WITHIN_APPROVED_E1_MAP` | SHELL; aplicaciones; Supabase | AUTH-CTX-001 a AUTH-CTX-030; decisión y ejecución separadas | E1 vinculó el candidato a una familia; este contrato selecciona miembros existentes de esa misma familia según el resultado TO-BE, sin crear ni renombrar capacidades. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0060` | Gestionar documentos y evidencia desde creación hasta disposición con metadatos y custodia | `ASIS-SRC-060` | CAP-16 | `CAP-16.03` — Guardar y localizar documentos | `CAP-16.01`; `CAP-16.02`; `CAP-16.04`; `CAP-16.05`; `CAP-16.07`; `CAP-16.08` | `FAMILY_REFINED_WITHIN_APPROVED_E1_MAP` | Todas las áreas | CAP-SCOPE-016; fuentes y retención no uniformes | E1 vinculó el candidato a una familia; este contrato selecciona miembros existentes de esa misma familia según el resultado TO-BE, sin crear ni renombrar capacidades. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0061` | Gestionar medición, análisis, decisión de mejora y verificación de resultado | `ASIS-SRC-061` | CAP-17 | `CAP-17.11` — Definir y seguir acciones de mejora | `CAP-17.01`; `CAP-17.02`; `CAP-17.03`; `CAP-17.04`; `CAP-17.10`; `CAP-17.12` | `FAMILY_REFINED_WITHIN_APPROVED_E1_MAP` | Gerencia; administración; áreas | CAP-COVER-012; métricas pendientes | E1 vinculó el candidato a una familia; este contrato selecciona miembros existentes de esa misma familia según el resultado TO-BE, sin crear ni renombrar capacidades. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0062` | Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje | `ASIS-SRC-062` | CAP-18 | `CAP-18.05` — Mantener operación mínima | `CAP-18.01`; `CAP-18.02`; `CAP-18.03`; `CAP-18.04`; `CAP-18.06`; `CAP-18.07`; `CAP-18.08`; `CAP-18.09`; `CAP-18.10`; `CAP-18.11`; `CAP-18.12` | `FAMILY_REFINED_WITHIN_APPROVED_E1_MAP` | Todas las operaciones | CAP-SCOPE-018; contingencia y conciliación no formalizadas | E1 vinculó el candidato a una familia; este contrato selecciona miembros existentes de esa misma familia según el resultado TO-BE, sin crear ni renombrar capacidades. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0063` | CAP-01.07 — Gestionar riesgos empresariales: Gestionar riesgos estratégicos, financieros, operativos, legales y tecnológicos como registro versionado de riesgo, tratamiento y seguimiento. | `ADICIONAL-PROVISIONAL-A` | CAP-01.07 | `CAP-01.07` — Gestionar riesgos empresariales | — | `DIRECT_EXACT` | Capacidad ausente o insuficientemente procesada en la consolidación AS-IS; materializada en PROC-CAT-002 | PROC-TOBE-DESIGN-001; CAP-MAP-015 | El propósito TO-BE coincide directamente con una capacidad aprobada en E1. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0064` | CAP-01.09 — Gestionar relaciones con asesores y autoridades: Gobernar requerimientos, conceptos, entregables, vencimientos, comunicaciones y evidencia sin delegar la propiedad interna del resultado. | `ADICIONAL-PROVISIONAL-B` | CAP-01.09 | `CAP-01.09` — Gestionar relaciones con asesores y autoridades | — | `DIRECT_EXACT` | Capacidad ausente o insuficientemente procesada en la consolidación AS-IS; materializada en PROC-CAT-002 | PROC-TOBE-DESIGN-001; CAP-MAP-015 | El propósito TO-BE coincide directamente con una capacidad aprobada en E1. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0065` | CAP-02.10 — Acompañar desempeño y desarrollo: Mantener un proceso diferido y sensible de objetivos, retroalimentación y decisiones, con uso explícito y privacidad aprobada. | `ADICIONAL-PROVISIONAL-C` | CAP-02.10 | `CAP-02.10` — Acompañar desempeño y desarrollo | — | `DIRECT_EXACT` | Capacidad ausente o insuficientemente procesada en la consolidación AS-IS; materializada en PROC-CAT-002 | PROC-TOBE-DESIGN-001; CAP-MAP-015 | El propósito TO-BE coincide directamente con una capacidad aprobada en E1. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0066` | CAP-03.03 — Entregar y controlar elementos de protección: Gestionar requisito, entrega, aceptación, vigencia, cambio, devolución y evidencia de elementos de protección. | `ADICIONAL-PROVISIONAL-D` | CAP-03.03 | `CAP-03.03` — Entregar y controlar elementos de protección | — | `DIRECT_EXACT` | Capacidad ausente o insuficientemente procesada en la consolidación AS-IS; materializada en PROC-CAT-002 | PROC-TOBE-DESIGN-001; CAP-MAP-015 | El propósito TO-BE coincide directamente con una capacidad aprobada en E1. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0067` | CAP-07.11 — Gestionar kits y conjuntos: Definir kit, instancia, componentes obligatorios y opcionales, completitud, préstamo, devolución y sustitución sin confundir kit, activo, LPN o contenedor. | `ADICIONAL-PROVISIONAL-E` | CAP-07.11 | `CAP-07.11` — Gestionar kits y conjuntos | — | `DIRECT_EXACT` | Capacidad ausente o insuficientemente procesada en la consolidación AS-IS; materializada en PROC-CAT-002 | PROC-TOBE-DESIGN-001; CAP-MAP-015 | El propósito TO-BE coincide directamente con una capacidad aprobada en E1. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0068` | CAP-10.06 — Medir satisfacción: Separar medición, incentivo, reclamo y compensación; conservar muestra, canal, consentimiento, respuesta y sesgo conocido. | `ADICIONAL-PROVISIONAL-F` | CAP-10.06 | `CAP-10.06` — Medir satisfacción | — | `DIRECT_EXACT` | Capacidad ausente o insuficientemente procesada en la consolidación AS-IS; materializada en PROC-CAT-002 | PROC-TOBE-DESIGN-001; CAP-MAP-015 | El propósito TO-BE coincide directamente con una capacidad aprobada en E1. | `LINKED_TO_APPROVED_E1_CAPABILITY` |
| `VPROC-0069` | CAP-12.11 — Gestionar presupuestos: Gestionar versión presupuestal, supuestos, aprobación, vigencia, consumo, proyección y desviación sin convertir el presupuesto en hecho contable. | `ADICIONAL-PROVISIONAL-G` | CAP-12.11 | `CAP-12.11` — Gestionar presupuestos | — | `DIRECT_EXACT` | Capacidad ausente o insuficientemente procesada en la consolidación AS-IS; materializada en PROC-CAT-002 | PROC-TOBE-DESIGN-001; CAP-MAP-015 | El propósito TO-BE coincide directamente con una capacidad aprobada en E1. | `LINKED_TO_APPROVED_E1_CAPABILITY` |

---

#### 9. Resumen por familia primaria

| Familia primaria | Procesos |
| --- | ---: |
| `CAP-01` — Dirigir y gobernar la organización | 6 |
| `CAP-02` — Gestionar personas y trabajo | 8 |
| `CAP-03` — Proteger salud, seguridad y cumplimiento | 4 |
| `CAP-04` — Gestionar productos, preparaciones y conocimiento | 4 |
| `CAP-05` — Abastecer la operación | 4 |
| `CAP-06` — Controlar inventario y almacenamiento | 6 |
| `CAP-07` — Gestionar activos, equipos y elementos reutilizables | 5 |
| `CAP-08` — Planear y ejecutar producción | 5 |
| `CAP-09` — Vender, cobrar y atender pedidos | 7 |
| `CAP-10` — Atender clientes y fortalecer relaciones | 4 |
| `CAP-11` — Transportar, despachar y entregar | 3 |
| `CAP-12` — Gestionar dinero, costos y obligaciones | 5 |
| `CAP-13` — Mantener instalaciones y condiciones de operación | 1 |
| `CAP-14` — Comunicar, promocionar y desarrollar ventas | 2 |
| `CAP-15` — Gestionar tecnología y soporte | 2 |
| `CAP-16` — Proteger información, documentos y evidencia | 1 |
| `CAP-17` — Medir, analizar y mejorar | 1 |
| `CAP-18` — Mantener continuidad y responder a incidentes | 1 |

Las 18 familias poseen al menos un proceso cuya capacidad primaria pertenece a la familia. El total reconciliado es 69.

---

#### 10. Procesos con apoyo entre familias

Los siguientes procesos coordinan capacidades de más de una familia sin fusionar sus fuentes de verdad:

| Proceso | Familias relacionadas | Regla |
| --- | --- | --- |
| `VPROC-0011` | CAP-02, CAP-15 | La capacidad primaria conserva el resultado dominante; cada apoyo mantiene contrato, propietario y evidencia propios. |
| `VPROC-0017` | CAP-04, CAP-09 | La capacidad primaria conserva el resultado dominante; cada apoyo mantiene contrato, propietario y evidencia propios. |
| `VPROC-0028` | CAP-06, CAP-11 | La capacidad primaria conserva el resultado dominante; cada apoyo mantiene contrato, propietario y evidencia propios. |
| `VPROC-0032` | CAP-07, CAP-11 | La capacidad primaria conserva el resultado dominante; cada apoyo mantiene contrato, propietario y evidencia propios. |
| `VPROC-0040` | CAP-09, CAP-11 | La capacidad primaria conserva el resultado dominante; cada apoyo mantiene contrato, propietario y evidencia propios. |
| `VPROC-0043` | CAP-09, CAP-12 | La capacidad primaria conserva el resultado dominante; cada apoyo mantiene contrato, propietario y evidencia propios. |
| `VPROC-0044` | CAP-09, CAP-12 | La capacidad primaria conserva el resultado dominante; cada apoyo mantiene contrato, propietario y evidencia propios. |
| `VPROC-0054` | CAP-12, CAP-17 | La capacidad primaria conserva el resultado dominante; cada apoyo mantiene contrato, propietario y evidencia propios. |
| `VPROC-0057` | CAP-09, CAP-10, CAP-14 | La capacidad primaria conserva el resultado dominante; cada apoyo mantiene contrato, propietario y evidencia propios. |
| `VPROC-0059` | CAP-02, CAP-15 | La capacidad primaria conserva el resultado dominante; cada apoyo mantiene contrato, propietario y evidencia propios. |

---

#### 11. Gobierno de cambios y vigencia

1. Los códigos de capacidad deberán resolver contra la versión aprobada del mapa E1.
2. Un renombre humano no modifica el vínculo si el resultado empresarial permanece igual.
3. Retiro, división o sustitución de una capacidad exige registrar sucesor y evaluar todos los `VPROC-*` consumidores.
4. Un cambio de capacidad primaria puede constituir cambio material de identidad del proceso y deberá revisarse en `PROC-CAT-020` y `PROC-COVER-010`.
5. Una capacidad nueva no se añadirá directamente desde una pantalla o implementación; deberá seguir la regla de evolución del catálogo E1.
6. Las aplicaciones consumirán esta relación, pero no podrán modificarla localmente.

---

#### 12. Carryover hacia las tareas siguientes

| Tarea | Uso obligatorio de esta matriz |
| --- | --- |
| `PROC-COVER-002` | Contrastar cada proceso y capacidad con la operación manual actual. |
| `PROC-COVER-003` | Contrastar cada proceso y capacidad con implementación real. |
| `PROC-COVER-004` | Clasificar cobertura sin alterar la relación funcional. |
| `PROC-COVER-005` | Identificar dependencias que bloquean el resultado de capacidad. |
| `PROC-COVER-006` | Definir alcance mínimo y objetivo por proceso y capacidad. |
| `PROC-COVER-007` | Impedir completar una capacidad por infraestructura aislada. |
| `PROC-COVER-008` | Aprobar la matriz capacidad → proceso → pantalla → implementación. |
| `PROC-COVER-009` | Relacionar AS-IS y TO-BE conservando la capacidad. |
| `PROC-COVER-010` | Registrar cualquier capacidad ausente, relación inválida o brecha nueva. |

---

#### 13. Resultado cuantitativo

| Control | Resultado |
| --- | ---: |
| Procesos canónicos evaluados | **69** |
| Procesos con capacidad primaria aprobada | **69** |
| Procesos sin capacidad | **0** |
| Familias primarias representadas | **18 de 18** |
| Capacidades E1 efectivamente referenciadas | **193** |
| Procesos con refinamiento desde familia | **12** |
| Procesos con apoyo entre familias | **10** |
| Códigos de capacidad inventados | **0** |
| Alias AS-IS usados como identidad canónica | **0** |

La huella de la matriz completa es:

```text
13eff2a5f51fe718a565f32b59ac8c633615970b473bd77fde6eb33db678f7ff
```

---

#### 14. Requisitos de prueba derivados

Esta tarea crea `TREQ-PROC-1021` a `TREQ-PROC-1064`. El detalle completo y único se incorpora en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

No modifica, difiere, descarta ni vuelve obsoleto ningún requisito histórico.

---

#### 15. Validaciones estructurales obligatorias

- exactamente 69 procesos y 69 capacidades primarias;
- identificadores `VPROC-*` únicos y consecutivos;
- todos los códigos resuelven dentro de las 18 familias y 217 capacidades aprobadas;
- todo refinamiento familiar permanece dentro de la rama E1 original;
- cero procesos sin vínculo y cero códigos inventados;
- reconciliación de tipos de vínculo, familias, procesos multifamilia y capacidades efectivas;
- preservación exacta de las filas históricas de `04A`;
- requisitos nuevos únicos, consecutivos, con catorce columnas y relaciones resolubles.

---

#### 16. Estado final y continuidad

```text
PROC-COVER-001 = APROBADA
PROCESOS VINCULADOS = 69 DE 69
PROCESOS SIN CAPACIDAD = 0
SIGUIENTE = PROC-COVER-002
```

`PROC-COVER-002 — Vincular cada proceso con su operación manual actual` permanece reservada y no se inicia hasta aprobación expresa de esta tarea.


### [ ] PROC-COVER-002 — Vincular cada proceso con su operación manual actual
### [ ] PROC-COVER-003 — Vincular cada proceso con su implementación actual
### [ ] PROC-COVER-004 — Clasificar proceso completo, parcial, manual, ausente o diferido
### [ ] PROC-COVER-005 — Identificar dependencias que impiden completar el proceso
### [ ] PROC-COVER-006 — Definir alcance mínimo y alcance objetivo
### [ ] PROC-COVER-007 — Prohibir declarar completo un proceso con solo infraestructura
### [ ] PROC-COVER-008 — Aprobar matriz capacidad → proceso → pantalla → implementación
### [ ] PROC-COVER-009 — Vincular explícitamente proceso AS-IS y proceso TO-BE
### [ ] PROC-COVER-010 — Registrar nuevas brechas y devolverlas al registro canónico de E1

