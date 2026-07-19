## BLOQUE E3

**Arquitectura canónica de datos y gobierno integral de Supabase**

Este bloque convierte Supabase en una parte explícita del modelo canónico
de Vento OS.

No reemplaza:

BLOQUE E2
→ define procesos, actores, pantallas y fuentes de verdad empresariales

BLOQUE X
→ define eventos, emisores, consumidores y traspasos

BLOQUE H
→ implementa contratos y tipos compartidos en `vento-shell`

BLOQUE R
→ implementa físicamente la arquitectura, seguridad y transición aprobadas

BLOQUE E3
→ audita Supabase completo, define su arquitectura objetivo y aprueba
  el plan de transición antes de modificar la base

Durante este bloque no se ejecutan migraciones ni cambios físicos.

### Principios obligatorios

SUPABASE
→ plataforma de datos y ejecución

VENTO-SHELL
→ fuente versionada de migraciones, configuración, contratos y pruebas

ESQUEMA
→ frontera lógica, de nombres, exposición y seguridad

DOMINIO
→ responsabilidad empresarial estable

APLICACIÓN
→ experiencia que consume uno o varios dominios

AUTHENTICATION
→ identifica la sesión técnica

IDENTIDAD EMPRESARIAL
→ identifica trabajador, cliente, dispositivo o actor de sistema

AUTHORIZATION
→ decide qué capacidad puede ejecutar el actor en un contexto y recurso

Reglas:

- no crear un esquema por aplicación automáticamente;
- no utilizar rutas o pantallas como estructura de datos;
- no mover objetos antes de identificar todos sus consumidores;
- no considerar `public` como destino universal;
- no mezclar esquemas administrados por Supabase con dominios de Vento;
- no convertir `auth.users` en catálogo laboral o de clientes;
- no utilizar tipos TypeScript como sustituto de RLS o autorización;
- no implementar el modelo objetivo mediante una migración masiva única;
- no retirar legacy antes de completar adopción, verificación y rollback.

### AUDITORÍA INTEGRAL DE SUPABASE

### [ ] SUPA-AUD-001 — Inventariar todos los esquemas existentes
### [ ] SUPA-AUD-002 — Clasificar esquemas administrados por Supabase y esquemas de Vento
### [ ] SUPA-AUD-003 — Identificar esquemas expuestos mediante Data API
### [ ] SUPA-AUD-004 — Inventariar tablas, particiones, vistas y vistas materializadas
### [ ] SUPA-AUD-005 — Inventariar claves primarias, foráneas, constraints, enums y secuencias
### [ ] SUPA-AUD-006 — Inventariar funciones, RPC, procedimientos y firmas públicas
### [ ] SUPA-AUD-007 — Inventariar funciones `SECURITY DEFINER` y `SECURITY INVOKER`
### [ ] SUPA-AUD-008 — Inventariar triggers y funciones ejecutadas por triggers
### [ ] SUPA-AUD-009 — Inventariar políticas RLS, grants y privilegios por rol
### [ ] SUPA-AUD-010 — Auditar Auth, usuarios, identidades, sesiones y vínculos empresariales
### [ ] SUPA-AUD-011 — Auditar identidades de trabajadores, clientes, dispositivos y actores de sistema
### [ ] SUPA-AUD-012 — Auditar buckets, rutas, políticas y ciclos de vida de Storage
### [ ] SUPA-AUD-013 — Auditar publicaciones, canales y consumidores de Realtime
### [ ] SUPA-AUD-014 — Auditar Edge Functions, webhooks, cron, colas y automatizaciones
### [ ] SUPA-AUD-015 — Auditar extensiones, secretos, variables y configuración del proyecto
### [ ] SUPA-AUD-016 — Comparar Supabase remoto con migraciones y configuración de `vento-shell`
### [ ] SUPA-AUD-017 — Detectar drift, cambios manuales y objetos sin migración
### [ ] SUPA-AUD-018 — Identificar tablas, columnas, funciones y políticas legacy
### [ ] SUPA-AUD-019 — Detectar duplicidades, datos huérfanos y fuentes de verdad competidoras
### [ ] SUPA-AUD-020 — Auditar índices, consultas, planes, crecimiento y retención
### [ ] SUPA-AUD-021 — Auditar generación y consumo de tipos de base de datos
### [ ] SUPA-AUD-022 — Crear mapa objeto → capacidad empresarial preliminar → propietario actual → consumidores actuales
### [ ] SUPA-AUD-023 — Crear mapa proceso → datos → RPC → eventos → aplicaciones
### [ ] SUPA-AUD-024 — Clasificar riesgos críticos, altos, medios y deuda técnica

### AUDITORÍA DE NORMALIZACIÓN Y CALIDAD DE DATOS

### [ ] DATA-NORM-AUD-001 — Inventariar campos textuales y reglas actuales de normalización
### [ ] DATA-NORM-AUD-002 — Detectar inconsistencias de espacios, mayúsculas, Unicode, tildes, signos y conectores
### [ ] DATA-NORM-AUD-003 — Identificar marcas, siglas, unidades, razones sociales y excepciones que no admiten transformación genérica
### [ ] DATA-NORM-AUD-004 — Detectar duplicados semánticos mediante valores normalizados de comparación
### [ ] DATA-NORM-AUD-005 — Clasificar transformaciones deterministas, correcciones por diccionario y casos ambiguos
### [ ] DATA-NORM-AUD-006 — Inventariar triggers, funciones, código cliente y procesos externos que actualmente modifican texto
### [ ] DATA-NORM-AUD-007 — Medir impacto de normalización sobre búsquedas, integraciones, relaciones y unicidad

Regla de auditoría

La auditoría deberá diferenciar:

VALOR MOSTRADO
→ texto empresarial visible para personas

VALOR DE BÚSQUEDA
→ representación tolerante para búsquedas y comparación

VALOR EXTERNO ORIGINAL
→ dato recibido desde una integración o importación

IDENTIFICADOR TÉCNICO
→ código que no debe corregirse ortográficamente

La coincidencia entre dos valores normalizados no autoriza por sí sola
fusionar registros.

Toda posible fusión deberá revisar:

- relaciones;
- movimientos;
- recetas;
- inventario;
- proveedores;
- integraciones;
- historial;
- auditoría.

### ARQUITECTURA CANÓNICA OBJETIVO

Criterios obligatorios de evaluación

Toda decisión de arquitectura deberá evaluarse, como mínimo, contra:

- propiedad de la fuente de verdad;
- estabilidad del dominio empresarial;
- consumidores actuales y futuros;
- exposición mediante Data API;
- seguridad, RLS y grants;
- compatibilidad temporal;
- rendimiento y crecimiento;
- auditoría y trazabilidad;
- capacidad de rollback;
- reproducibilidad desde `vento-shell`.

Estos criterios deberán aplicarse desde SUPA-ARC-001 y consolidarse
formalmente en SUPA-ARC-025 mediante una ADR aprobada.

### [ ] SUPA-ARC-001 — Definir principios de separación entre esquemas administrados y empresariales
### [ ] SUPA-ARC-002 — Definir dominios empresariales estables
### [ ] SUPA-ARC-003 — Definir esquema propietario de cada fuente de verdad
### [ ] SUPA-ARC-004 — Definir función futura de `public`
### [ ] SUPA-ARC-005 — Definir capa expuesta de vistas y RPC
### [ ] SUPA-ARC-006 — Definir capa privada de helpers y lógica interna
### [ ] SUPA-ARC-007 — Definir esquema transversal de auditoría y eventos
### [ ] SUPA-ARC-008 — Definir modelo canónico de Auth e identidad empresarial
### [ ] SUPA-ARC-009 — Definir vínculo de `auth.users` con trabajador, cliente y dispositivo
### [ ] SUPA-ARC-010 — Definir ciclo de sesión, revocación y desactivación
### [ ] SUPA-ARC-011 — Definir convenciones de nombres para esquemas, tablas y columnas
### [ ] SUPA-ARC-012 — Definir convenciones de claves, constraints, estados y timestamps
### [ ] SUPA-ARC-013 — Definir convenciones para funciones, RPC y triggers
### [ ] SUPA-ARC-014 — Definir política canónica de `SECURITY DEFINER`
### [ ] SUPA-ARC-015 — Definir política canónica de exposición, grants y RLS
### [ ] SUPA-ARC-016 — Definir contratos de lectura y mutación por dominio
### [ ] SUPA-ARC-017 — Definir política de escrituras entre dominios
### [ ] SUPA-ARC-018 — Definir arquitectura de Storage
### [ ] SUPA-ARC-019 — Definir arquitectura de Realtime y eventos
### [ ] SUPA-ARC-020 — Definir arquitectura de Edge Functions, webhooks y cron
### [ ] SUPA-ARC-021 — Definir estrategia de índices, rendimiento y crecimiento
### [ ] SUPA-ARC-022 — Definir retención, archivado, respaldo y recuperación
### [ ] SUPA-ARC-023 — Definir generación canónica de tipos para consumidores
### [ ] SUPA-ARC-024 — Definir entornos local, pruebas, staging y producción

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

### PLAN DE TRANSICIÓN

### [ ] SUPA-TRANS-001 — Mapear cada objeto actual hacia la arquitectura objetivo
### [ ] SUPA-TRANS-002 — Clasificar cada objeto como conservar, mover, fusionar, dividir, renombrar o retirar
### [ ] SUPA-TRANS-003 — Identificar dependencias de aplicaciones, RPC, RLS, triggers y datos
### [ ] SUPA-TRANS-004 — Definir orden de migración por dominio
### [ ] SUPA-TRANS-005 — Definir backfills y correcciones de calidad de datos
### [ ] SUPA-TRANS-006 — Definir vistas, wrappers o aliases temporales de compatibilidad
### [ ] SUPA-TRANS-007 — Definir adaptación coordinada de consumidores
### [ ] SUPA-TRANS-008 — Definir estrategia ante escrituras durante la transición
### [ ] SUPA-TRANS-009 — Definir pruebas antes y después de cada migración
### [ ] SUPA-TRANS-010 — Definir mediciones de rendimiento y seguridad
### [ ] SUPA-TRANS-011 — Definir rollback por paquete de cambio
### [ ] SUPA-TRANS-012 — Definir retiro progresivo de objetos legacy
### [ ] SUPA-TRANS-013 — Definir verificación de paridad local, staging y producción
### [ ] SUPA-TRANS-014 — Definir actualización de tipos, contratos y documentación
### [ ] SUPA-TRANS-015 — Crear roadmap ejecutable de migraciones en `vento-shell`

### TRANSICIÓN DE NORMALIZACIÓN Y CALIDAD DE DATOS

### [ ] DATA-NORM-TRANS-001 — Crear baseline de valores actuales antes de transformar
### [ ] DATA-NORM-TRANS-002 — Ejecutar dry-run de cada regla de normalización
### [ ] DATA-NORM-TRANS-003 — Identificar colisiones producidas por valores normalizados
### [ ] DATA-NORM-TRANS-004 — Resolver duplicados antes de aplicar restricciones de unicidad
### [ ] DATA-NORM-TRANS-005 — Definir backfills por dominio y lotes reversibles
### [ ] DATA-NORM-TRANS-006 — Activar reglas sobre nuevas escrituras de forma progresiva
### [ ] DATA-NORM-TRANS-007 — Validar búsquedas, relaciones e integraciones después del backfill
### [ ] DATA-NORM-TRANS-008 — Definir rollback y recuperación del valor anterior
### [ ] DATA-NORM-TRANS-009 — Definir evidencia de aprobación por dominio

Regla de transición

No se ejecutará una actualización global indiscriminada equivalente a:

```text
UPDATE todas_las_tablas
SET nombre = normalize(nombre)
```

Cada dominio deberá pasar por:

```text
baseline
→ dry-run
→ detección de colisiones
→ revisión
→ aprobación
→ backfill por lote
→ verificación
→ activación sobre nuevas escrituras
→ auditoría
```

### [ ] SUPA-TRANS-016 — Aprobar transición antes de iniciar BLOQUE R

### Resultado esperado

PROCESO EMPRESARIAL
→ APLICACIÓN PROPIETARIA
→ DOMINIO
→ FUENTE DE VERDAD
→ CONTRATO
→ VISTA O RPC EXPUESTA
→ RLS Y AUTORIZACIÓN
→ AUDITORÍA Y EVENTOS
→ CONSUMIDORES

Y, físicamente:

`vento-shell`
→ migraciones, configuración, contratos y pruebas

Supabase
→ estado reproducible, organizado y protegido

Aplicaciones
→ consumidoras del modelo aprobado, sin redefinirlo


