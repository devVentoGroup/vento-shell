### GOBIERNO CANÓNICO DE NORMALIZACIÓN Y CALIDAD DE TEXTO

### [ ] DATA-NORM-ARC-001 — Definir política de normalización por dominio, entidad y campo
### [ ] DATA-NORM-ARC-002 — Definir clases de campo y tratamiento permitido
### [ ] DATA-NORM-ARC-003 — Definir reglas de capitalización para nombres empresariales
### [ ] DATA-NORM-ARC-004 — Definir conectores que permanecen en minúscula
### [ ] DATA-NORM-ARC-005 — Definir excepciones de marcas, siglas, unidades y nombres legales
### [ ] DATA-NORM-ARC-006 — Definir diccionario ortográfico canónico y su gobierno
### [ ] DATA-NORM-ARC-007 — Definir cola de revisión para correcciones ambiguas
### [ ] DATA-NORM-ARC-008 — Definir representación de búsqueda y comparación
### [ ] DATA-NORM-ARC-009 — Definir auditoría, versionado e idempotencia de reglas
### [ ] DATA-NORM-ARC-010 — Definir estrategia de unicidad y detección de duplicados normalizados
### [ ] DATA-NORM-ARC-011 — Definir capas de ejecución: aplicación, servicio de dominio, RPC y trigger defensivo
### [ ] DATA-NORM-ARC-012 — Definir tratamiento de datos recibidos desde integraciones externas

Regla canónica de normalización

No se aplicará `Title Case` universalmente.

Las reglas mínimas serán:

NOMBRE DE PRODUCTO
→ normalización comercial aprobada

NOMBRE DE CATEGORÍA
→ normalización comercial aprobada

NOMBRE DE RECETA
→ normalización comercial aprobada

NOMBRE DE PRESENTACIÓN
→ normalización específica que preserve cantidades y unidades

RAZÓN SOCIAL DE PROVEEDOR
→ conservar escritura legal u oficial

MARCA
→ conservar escritura oficial

DESCRIPCIÓN LIBRE
→ corregir únicamente según reglas propias de texto libre

SKU, CÓDIGO, CÓDIGO DE BARRAS, URL, EMAIL, API KEY
→ no aplicar capitalización comercial

Ejemplo esperado:

```text
"  harina   DE maiz "
        ↓
espacios normalizados
        ↓
capitalización empresarial
        ↓
diccionario aprobado
        ↓
"Harina de Maíz"
```

Conectores preliminares que permanecerán en minúscula cuando no sean
la primera palabra:

```text
a
al
con
de
del
e
el
en
la
las
lo
los
o
para
por
sin
u
y
```

El listado definitivo deberá aprobarse en DATA-NORM-ARC-004.

Ejemplos:

```text
americano
→ Americano

pan masa madre clasico
→ Pan Masa Madre Clásico

harina de maiz
→ Harina de Maíz

jugo de naranja y mango
→ Jugo de Naranja y Mango
```

Las siguientes clases deberán conservar reglas específicas:

```text
"3M"
→ conservar escritura oficial

"iPhone"
→ conservar escritura oficial

"Coca-Cola"
→ conservar escritura oficial

"COMERCIALIZADORA ABC S.A.S."
→ conservar razón social aprobada

"500 g"
→ conservar cantidad y unidad normalizadas

"expresso"
→ no corregir silenciosamente hasta determinar si corresponde a:
  - error ortográfico;
  - denominación comercial;
  - nombre histórico;
  - marca o producto externo.
```

Niveles de decisión:

```text
NORMALIZACIÓN DETERMINISTA
→ automática

CORRECCIÓN MEDIANTE DICCIONARIO APROBADO
→ automática, versionada y auditable

CORRECCIÓN AMBIGUA
→ sugerencia o revisión humana
```

Toda regla de normalización deberá ser idempotente:

```text
normalize(normalize(value))
=
normalize(value)
```

### [ ] SUPA-ARC-025 — Consolidar y aprobar ADR de arquitectura canónica de datos

La lista final de esquemas empresariales no se aprobará por intuición.

Se derivará de:

procesos aprobados
+
fuentes de verdad
+
propiedad funcional
+
dependencias reales
+
seguridad
+
frecuencia de cambio
+
necesidades de exposición

Los nombres preliminares como `organization`, `workforce`, `attendance`,
`authorization`, `catalog`, `inventory`, `logistics`, `production`,
`procurement`, `sales`, `finance`, `loyalty`, `api`, `private` y `audit`
solo podrán convertirse en canónicos después de la auditoría.
