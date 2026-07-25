### CORRECCIONES CANÓNICAS DE COHERENCIA — CAP-SCOPE

**Estado:** VIGENTE  
**Naturaleza:** corrección documental posterior sin cambio de alcance sustantivo  
**Precedencia:** este fragmento prevalece sobre textos de estado, ubicación o continuidad incompatibles incluidos en tareas `CAP-SCOPE-*` aprobadas anteriormente.

Este fragmento corrige deuda de consolidación detectada después de aprobar
`CAP-SCOPE-001` a `CAP-SCOPE-017`. No crea tareas nuevas, no modifica las
clasificaciones funcionales aprobadas y no autoriza implementación.

---

#### 1. Estados internos corregidos

Las siguientes tareas están **APROBADAS** y cualquier texto interno que todavía
diga `PROPUESTA PARA APROBACIÓN`, `NO APROBADA` o que ordene esperar una nueva
confirmación se considera sustituido por esta corrección:

```text
CAP-MAP-015
CAP-SCOPE-004
CAP-SCOPE-005
CAP-SCOPE-006
CAP-SCOPE-007
CAP-SCOPE-013
CAP-SCOPE-014
CAP-SCOPE-015
CAP-SCOPE-016
CAP-SCOPE-017
```

La aprobación expresa ya otorgada prevalece sobre instrucciones transitorias
conservadas dentro de los archivos de propuesta.

---

#### 2. Propiedad documental de tecnología y soporte

Toda referencia de `CAP-SCOPE-015` a:

```text
BLOQUE Y — Tecnología y soporte
```

se sustituye por:

```text
BLOQUE Z — Tecnología y soporte
```

La ubicación canónica es:

```text
docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/00_BLOQUE_Z.md
```

El BLOQUE Y permanece reservado exclusivamente para TALENTO.

Las tareas `TI-DOM-*`, `TI-AUTH-*`, `TI-UX-*` y `TI-INT-*` pertenecen al
BLOQUE Z. Las tareas `AUTH-DEV-*`, `PRINT-ARC-*` y `SHELL-CI-*` no se duplican;
el BLOQUE Z las consume como dependencias.

---

#### 3. Referencia corregida para inspecciones SST

La referencia inexistente:

```text
VISO-UX-032 a VISO-UX-039
```

incluida en `H-CAP-SCOPE-013-014` queda sustituida por los propietarios
materializados:

```text
PROC-CAT-009 a PROC-CAT-018
PROC-ACTOR-003
UX-ADMIN-001 a UX-ADMIN-005
CAP-SCOPE-003
NEXO-DOM-034
```

La inspección física de instalaciones y la inspección SST conservan objetos,
criterios y resultados diferentes, aunque puedan compartir evidencia y acciones.

---

#### 4. Rango corregido de cobertura

Toda referencia a:

```text
CAP-COVER-001 a CAP-COVER-013
```

queda sustituida por:

```text
CAP-COVER-001 a CAP-COVER-012
```

No existe ni se crea `CAP-COVER-013`.

---

#### 5. Título canónico de la tarea actual

El título único vigente es:

```text
CAP-SCOPE-018 — Evaluar continuidad operativa, contingencia, incidentes, respaldo y recuperación
```

Este título sustituye las variantes abreviadas conservadas en referencias
anteriores.

---

#### 6. Encabezado de requisitos de prueba

La denominación canónica es:

```md
#### Requisitos de prueba derivados
```

Las expresiones históricas `Requisito de prueba generado` y
`Requisitos de prueba generados` se interpretan como equivalentes documentales,
pero toda modificación sustantiva posterior deberá utilizar el encabezado
canónico.

Las tareas aprobadas antes de `QA-GOV-001` permanecen cubiertas
retrospectivamente por `QA-REG-001` cuando corresponda.

---

#### 7. Materialización confirmada

Quedan materializadas en sus bloques propietarios:

```text
NEXO-DOM-029 a NEXO-DOM-038
NEXO-AUTH-031 a NEXO-AUTH-032
NEXO-UX-043 a NEXO-UX-048
PASS-UX-011 a PASS-UX-013
```

Estas tareas permanecen **NO INICIADAS** y no alteran la tarea actual de E1.

---

#### 8. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta corrección sincroniza estado, ubicación, referencias y
nomenclatura de decisiones ya aprobadas. No introduce ni modifica comportamiento
ejecutable.
