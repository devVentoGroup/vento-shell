### COBERTURA EMPRESARIAL OBLIGATORIA

E1 deberá evaluar como mínimo los siguientes dominios. Evaluar un dominio
no obliga a construirlo dentro de Vento OS; obliga a decidir de forma
explícita su tratamiento.

Clasificaciones permitidas:

```text
BUILD
REUSE_OR_REFACTOR
INTEGRATE_EXTERNAL
BUY
CONTROLLED_MANUAL
DEFERRED
OUT_OF_SCOPE
RETIRE
```

### ✅ CAP-SCOPE-001 — Evaluar gobierno, empresas, sedes y organización

**Estado:** APROBADA  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Dependencia cumplida:** `QA-REG-001` aprobada  
**Tarea anterior:** `QA-REG-001`  
**Siguiente tarea reservada:** `CAP-SCOPE-002`  
**Familia evaluada:** `CAP-01 — Dirigir y gobernar la organización`  
**Naturaleza:** decisión de cobertura empresarial y definición conceptual objetivo  
**Implementación técnica:** no autorizada  
**Migraciones o cambios en Supabase:** no autorizados  
**Cambios jurídicos, registrales, tributarios o contractuales:** no autorizados  
**Requisito de prueba generado:** `TREQ-SUPABASE-011`

---

#### 1. Propósito

Definir el tratamiento objetivo de las capacidades mediante las cuales Vento Group:

- dirige y gobierna el ecosistema empresarial;
- distingue titulares jurídicos, marcas, establecimientos y líneas comerciales;
- administra instalaciones físicas, sedes operativas, áreas, zonas y estaciones;
- mantiene relaciones organizacionales y territoriales sin fusionar conceptos diferentes;
- asigna propietarios funcionales, custodios de datos y responsables de validación;
- conserva una fuente interna única y trazable para la estructura operativa;
- vincula cada brecha con una tarea canónica y una puerta de resolución.

La tarea convierte la línea base AS-IS ya aprobada en una decisión de cobertura. No diseña todavía tablas físicas, interfaces finales, migraciones ni procesos detallados de implementación.

---

#### 2. Pregunta de decisión

`CAP-SCOPE-001` responde:

```text
¿QUÉ ESTRUCTURA EMPRESARIAL Y OPERATIVA NECESITA REPRESENTAR VENTO OS,
QUÉ PARTE YA PUEDE REUTILIZARSE,
QUÉ PARTE DEBE CONSTRUIRSE O RETIRARSE,
QUIÉN GOBIERNA CADA DATO
Y QUÉ VALIDACIONES EXTERNAS SIGUEN SIENDO OBLIGATORIAS?
```

La tarea no responde mediante una simplificación como:

```text
MARCA = EMPRESA = SEDE = ÁREA
```

Esa equivalencia queda prohibida.

---

#### 3. Fuentes consolidadas

La evaluación utiliza como línea base:

- `OPS-AUD-001` — empresas, sedes, áreas, canales y puntos operativos;
- `OPS-ADM-001` — brecha registral y física de `Oficina 1`;
- `OPS-GOV-001` — gobernanza AS-IS de marcas y titulares;
- `OPS-ACT-001` — activos y custodias externas;
- `OPS-CST-001` — costos y transferencias entre frentes;
- `CAP-MAP-001` a `CAP-MAP-015`;
- `CODE-AUD-001` a `CODE-AUD-020`;
- `QA-REG-001` y el Registro Canónico de Requisitos de Prueba;
- `REGISTRO_VIVO_DE_PREGUNTAS_PENDIENTES` con corte disponible;
- evidencia técnica actual de `sites`, `areas`, asignaciones territoriales, capacidades de sede, metadatos comerciales y consumidores por aplicación.

Las respuestas ya incorporadas al registro vivo no se vuelven a preguntar.

---

#### 4. Alcance evaluado

La tarea evalúa directamente:

- `CAP-01.01` — Definir dirección y objetivos;
- `CAP-01.02` — Tomar y registrar decisiones empresariales;
- `CAP-01.03` — Gobernar empresas, marcas y establecimientos;
- `CAP-01.04` — Gobernar sedes, oficinas y áreas;
- `CAP-01.05` — Definir responsabilidades y límites de decisión;
- `CAP-01.06` — Gestionar políticas y reglas internas;
- `CAP-01.07` — Gestionar riesgos empresariales;
- `CAP-01.08` — Coordinar operación entre negocios y sedes;
- `CAP-01.09` — Gestionar relaciones con asesores y autoridades;
- `CAP-01.10` — Verificar cumplimiento de decisiones.

También define las fronteras organizacionales que utilizarán posteriormente:

- autorización y contexto territorial;
- personal y asignaciones;
- inventario y almacenamiento;
- producción;
- compras;
- ventas y caja;
- costos y contabilidad;
- documentos y evidencia;
- analítica consolidada.

---

#### 5. Fuera de alcance

Esta tarea no:

- determina por sí sola la validez jurídica de una empresa, marca o establecimiento;
- modifica RUT, Cámara de Comercio, contratos, bancos, aseguradoras o plataformas externas;
- define la estructura física definitiva de Supabase;
- crea códigos productivos ni migra registros actuales;
- cambia permisos, asignaciones o contextos activos;
- diseña organigramas nominales por persona;
- define cargos, contratación, turnos o retiro, reservados para `CAP-SCOPE-002`;
- define centros de costo, imputaciones o conciliación financiera, reservados para `OPS-CST-001`, NUMERA y `CAP-SCOPE-012`;
- crea una sede para una marca que no tenga operación física propia;
- presenta como verificada información que continúa pendiente de evidencia profesional.

---

#### 6. Principios canónicos

##### 6.1. Separación semántica obligatoria

Los siguientes conceptos son distintos aunque puedan estar relacionados:

```text
ECOSISTEMA U ORGANIZACIÓN
≠ TITULAR JURÍDICO
≠ MARCA
≠ ESTABLECIMIENTO DE COMERCIO
≠ LÍNEA DE NEGOCIO
≠ INSTALACIÓN FÍSICA
≠ SEDE OPERATIVA
≠ ÁREA
≠ ZONA
≠ ESTACIÓN
≠ CANAL
≠ CENTRO DE COSTO
```

##### 6.2. Estado jurídico y estado operativo separados

Un punto puede estar operativo internamente aunque su clasificación registral siga pendiente. El sistema deberá distinguir, como mínimo, entre:

- existencia operativa confirmada;
- evidencia documental disponible;
- validación profesional pendiente;
- vigencia interna;
- vigencia externa o registral;
- publicación permitida o restringida.

##### 6.3. Identidad estable

Cada elemento canónico deberá tener:

- identificador estable e inmutable;
- código canónico independiente del nombre visible;
- nombre vigente;
- tipo explícito;
- estado y vigencia;
- propietario funcional;
- evidencia o fuente de validación;
- relaciones tipadas con otros elementos.

El nombre visible no será clave de integración ni condición de negocio.

##### 6.4. Cambios sin pérdida histórica

Una renombrada, traslado, cierre, fusión o cambio de titular no eliminará la historia. Los elementos referenciados por operaciones deberán conservarse mediante:

- vigencia temporal;
- desactivación;
- relación de reemplazo;
- alias controlado;
- trazabilidad del cambio.

##### 6.5. Fuente única y proyecciones

La estructura organizacional interna tendrá una fuente canónica. Las aplicaciones podrán consumir proyecciones específicas, pero no conservar catálogos competidores administrados manualmente.

##### 6.6. Capacidad separada de clasificación

El tipo de sede o el nombre del área no concederán automáticamente una capacidad. Las capacidades de vender, producir, almacenar, solicitar, despachar, recibir o administrar serán explícitas y versionadas.

##### 6.7. Validación externa sin bloqueo indebido

La falta de un concepto jurídico o registral no impide representar una realidad operativa confirmada. Sí impide marcarla como jurídicamente verificada o usarla externamente como dato oficial.

---

#### 7. Modelo conceptual objetivo

La siguiente taxonomía queda aprobable como frontera conceptual. No prescribe todavía nombres de tablas.

| Tipo conceptual              | Definición                                                                               | Ejemplo actual o posible                                                   | Regla principal                                                          |
| ---------------------------- | ---------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| `ORGANIZATION_SCOPE`         | paraguas interno utilizado para gobernar el ecosistema                                   | Vento Group como ecosistema administrativo                                 | no equivale automáticamente a persona jurídica                           |
| `LEGAL_SUBJECT`              | persona jurídica o natural que asume obligaciones frente a terceros                      | Vento Group S.A.S.; titulares naturales documentados                       | requiere evidencia externa y vigencia                                    |
| `BRAND`                      | identidad comercial usada frente a clientes o terceros                                   | Vento Café, Saudo, Molka, Vaila Vainilla                                   | puede operar en una o varias sedes y tener titular distinto del operador |
| `COMMERCIAL_ESTABLISHMENT`   | establecimiento registrado o figura comercial confirmada documentalmente                 | Vento Café, Vento Producción, Saudo, Molka cuando la evidencia lo confirme | no se crea por inferencia operativa                                      |
| `BUSINESS_LINE`              | oferta o frente comercial sin sede propia obligatoria                                    | Catering                                                                   | no debe inventarse como empresa o sede                                   |
| `PHYSICAL_FACILITY`          | inmueble o espacio físico identificable                                                  | local, oficina o Centro de Producción y Distribución                       | puede alojar más de un contexto operativo                                |
| `OPERATIONAL_SITE`           | contexto estable desde el cual se ejecutan capacidades y se asigna autoridad territorial | Vento Café, Saudo, Molka, Oficina 1, Centro de Producción y Distribución   | es la unidad territorial primaria de Vento OS                            |
| `ORGANIZATIONAL_AREA`        | unidad funcional dentro de una sede                                                      | Cocina, Barra, Bodega y Abastecimiento                                     | puede ser productiva, comercial, administrativa o de apoyo               |
| `PHYSICAL_ZONE`              | subdivisión espacial sin autonomía funcional completa                                    | terraza, cámara fría, cuarto de congelación                                | no concede permisos ni propiedad de proceso por sí sola                  |
| `WORKSTATION`                | punto concreto de ejecución                                                              | caja, mostrador, recepción, despacho, impresión                            | no debe modelarse automáticamente como área                              |
| `COMMERCIAL_CHANNEL`         | medio por el cual se reciben o gestionan interacciones comerciales                       | Rappi, ManyChat, web, WhatsApp                                             | no es sede, marca ni titular                                             |
| `EXTERNAL_OPERATIONAL_POINT` | punto externo, privado o temporal usado para custodia o ejecución limitada               | apartamentos asociados a Vaila, vehículo o decoraciones                    | exige custodio, propósito, vigencia y restricciones                      |

---

#### 8. Relaciones tipadas obligatorias

La relación entre elementos deberá declarar su semántica. Como mínimo se reconocen conceptualmente:

- `BELONGS_TO_ORGANIZATION_SCOPE`;
- `LEGALLY_OWNED_BY`;
- `OPERATED_BY`;
- `USES_BRAND`;
- `REGISTERED_AS_ESTABLISHMENT_OF`;
- `OCCUPIES_FACILITY`;
- `CONTAINS_AREA`;
- `CONTAINS_ZONE`;
- `HOSTS_WORKSTATION`;
- `SERVES_CHANNEL`;
- `INVOICES_THROUGH`;
- `CUSTODIED_BY`;
- `REPLACED_BY`;
- `VALID_FROM` / `VALID_TO`.

No se inferirá una relación a partir de compartir nombre, dirección, persona, inmueble o aplicación.

---

#### 9. Decisión de cobertura de `CAP-01`

| Capacidad                                                   | Tratamiento principal | Tratamiento complementario                                                | Propietario funcional candidato               | Soporte objetivo                                            |
| ----------------------------------------------------------- | --------------------- | ------------------------------------------------------------------------- | --------------------------------------------- | ----------------------------------------------------------- |
| `CAP-01.01` Definir dirección y objetivos                   | `CONTROLLED_MANUAL`   | registro posterior `BUILD`                                                | Dirección / Propietarios                      | evidencia documental y consulta administrativa              |
| `CAP-01.02` Tomar y registrar decisiones                    | `BUILD`               | `CONTROLLED_MANUAL` durante transición                                    | Dirección / Gerencia General                  | VISO + servicio de documentos y evidencia                   |
| `CAP-01.03` Gobernar empresas, marcas y establecimientos    | `BUILD`               | validación `CONTROLLED_MANUAL` externa                                    | Dirección, Contabilidad y asesoría aplicable  | catálogo organizacional canónico administrado desde VISO    |
| `CAP-01.04` Gobernar sedes, oficinas y áreas                | `REUSE_OR_REFACTOR`   | `BUILD` para instalaciones, zonas y estaciones faltantes                  | Gerencia General y Operaciones                | `sites`, `areas` y contratos compartidos refactorizados     |
| `CAP-01.05` Definir responsabilidades y límites             | `REUSE_OR_REFACTOR`   | —                                                                         | Dirección / Gerencia General                  | modelo canónico de autorización, roles y scopes             |
| `CAP-01.06` Gestionar políticas y reglas internas           | `BUILD`               | transición `CONTROLLED_MANUAL`                                            | Dirección / responsable de cada política      | VISO + documentos versionados                               |
| `CAP-01.07` Gestionar riesgos empresariales                 | `CONTROLLED_MANUAL`   | futura decisión de construcción en dominios de cumplimiento y continuidad | Dirección / Gerencia General                  | registro controlado hasta `CAP-SCOPE-016` y `CAP-SCOPE-018` |
| `CAP-01.08` Coordinar operación entre negocios y sedes      | `REUSE_OR_REFACTOR`   | —                                                                         | Gerencia General / Operaciones                | procesos propietarios e integraciones canónicas             |
| `CAP-01.09` Gestionar relaciones con asesores y autoridades | `CONTROLLED_MANUAL`   | posible `INTEGRATE_EXTERNAL` solo cuando exista caso aprobado             | Dirección / Contabilidad                      | expediente documental y tareas externas                     |
| `CAP-01.10` Verificar cumplimiento de decisiones            | `BUILD`               | evidencia manual mientras se implementa                                   | Dirección / auditoría o responsable designado | eventos de auditoría, indicadores y certificación           |

---

#### 10. Mapa organizacional objetivo de los frentes actuales

##### 10.1. Vento Group

Se distinguirán dos conceptos:

```text
VENTO GROUP — ECOSISTEMA
→ ORGANIZATION_SCOPE

VENTO GROUP S.A.S.
→ LEGAL_SUBJECT
```

La referencia pública o administrativa «Vento Group» no sustituirá la razón social cuando un proceso necesite identificar al titular jurídico.

##### 10.2. Vento Café

Vento Café deberá representarse mediante relaciones separadas:

- marca comercial;
- establecimiento documentado de Vento Group S.A.S.;
- sede operativa activa;
- instalación física correspondiente;
- áreas operativas propias;
- canales comerciales asociados.

La existencia de estos registros relacionados no implica duplicar el negocio: cada registro responde una pregunta diferente.

##### 10.3. Vento Producción y Centro de Producción y Distribución

Se adopta la siguiente decisión objetivo:

```text
VENTO PRODUCCIÓN
→ establecimiento o referencia comercial documentada

CENTRO DE PRODUCCIÓN Y DISTRIBUCIÓN
→ una instalación física
→ una sede operativa principal
→ varias áreas productivas, logísticas y de apoyo
```

No se creará por defecto una segunda sede denominada «Centro de Distribución» mientras no exista una instalación o contexto territorial independiente.

La distribución interna se modelará como:

- capacidad;
- proceso;
- área o conjunto de estaciones dentro de la sede;
- centro de costo cuando NUMERA lo defina;
- no como sede duplicada.

##### 10.4. Saudo

Saudo deberá representarse como:

- marca;
- establecimiento documentado a nombre del titular aplicable;
- sede operativa diferenciada;
- instalación física;
- área operativa integral;
- canales asociados.

La administración compartida con el grupo no cambia automáticamente su titular jurídico, facturación, recaudo o imputación de costos.

##### 10.5. Molka

Molka deberá representarse como:

- marca;
- establecimiento documentado a nombre del titular aplicable;
- sede operativa diferenciada;
- instalación física;
- área operativa integral;
- canales asociados.

No se le asignará una cocina productiva propia mientras la operación real no la tenga.

##### 10.6. Vaila Vainilla

Vaila Vainilla se clasifica actualmente como:

```text
BRAND / BUSINESS_FRONT
+ COMMERCIAL_CHANNELS
+ EXTERNAL_OPERATIONAL_POINTS PENDIENTES DE RECONCILIACIÓN
```

No se clasifica como:

- persona jurídica independiente;
- establecimiento confirmado;
- sede formal de Vento Group;
- centro de costo definitivo;
- emisor único de factura.

La variación actual de emisores de factura deberá conservarse como excepción AS-IS y resolverse en `OPS-GOV-001`, `OPS-CST-001`, `OPS-CAN-001`, `CAP-SCOPE-011` y `CAP-SCOPE-012` antes de automatizar ventas, recaudo o contabilidad.

##### 10.7. Catering

Catering se clasifica como:

- línea de negocio o servicio;
- canal comercial administrado por Vento Group;
- capacidad que utiliza producción y despacho existentes;
- sin sede propia.

Su modelo comercial y contractual continúa en `OPS-CAN-001`, `OPS-B2B-001`, `CAP-SCOPE-009`, `CAP-SCOPE-011` y `CAP-SCOPE-012`.

---

#### 11. Mapa objetivo de sedes y puntos

| Elemento                            | Clasificación objetivo                    | Decisión                                                                                                  |
| ----------------------------------- | ----------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `Oficina 1`                         | `OPERATIONAL_SITE` administrativa         | se representa internamente aunque la clasificación registral siga pendiente; no se fusiona con Vento Café |
| Vento Café                          | `OPERATIONAL_SITE` comercial              | sede diferenciada con Servicio/Salón, Cocina y Barra                                                      |
| Saudo                               | `OPERATIONAL_SITE` comercial              | sede diferenciada con área operativa integral                                                             |
| Molka                               | `OPERATIONAL_SITE` comercial              | sede diferenciada con área operativa integral                                                             |
| Centro de Producción y Distribución | `OPERATIONAL_SITE` productiva y logística | una sede; distribución no crea otra sede por compartir la misma instalación                               |
| apartamento asociado a Vaila        | `EXTERNAL_OPERATIONAL_POINT`              | provisional, limitado a preparación, empaque o custodia que se confirme                                   |
| apartamento de resguardo vehicular  | `EXTERNAL_OPERATIONAL_POINT`              | custodia del vehículo; no sede                                                                            |
| punto externo de decoraciones       | `EXTERNAL_OPERATIONAL_POINT`              | taller o custodia de activos; no sede                                                                     |

##### 11.1. Regla sobre `Oficina 1`

Hasta completar `ADM-01`, `ADM-03`, `ADM-07`, `ADM-08`, `ADM-09` y las validaciones `EXT-01` a `EXT-05`:

```text
OFICINA 1
→ SEDE ADMINISTRATIVA INTERNA ACTIVA
→ RELACIÓN FÍSICA EXACTA PENDIENTE
→ ESTADO REGISTRAL NO VERIFICADO
→ DIRECCIÓN PÚBLICA NO PUBLICABLE SIN VALIDACIÓN
```

##### 11.2. Regla sobre puntos externos

Un punto externo solo podrá registrarse cuando declare:

- propósito;
- custodio;
- bienes o procesos permitidos;
- dirección protegida;
- vigencia;
- restricciones de acceso;
- relación con una sede o proceso propietario;
- evidencia de autorización.

No se expondrá como sede disponible para trabajadores, inventario o navegación general.

---

#### 12. Áreas objetivo por sede

##### 12.1. Oficina 1

```text
OFICINA 1
└── Administración
    ├── Zona: sala administrativa
    ├── Zona: sala de propietarios
    ├── Zona o ubicación: archivo
    └── estaciones administrativas según proceso
```

Las salas son zonas, no sedes independientes.

##### 12.2. Vento Café

```text
VENTO CAFÉ
├── Servicio / Salón
│   ├── Zona: terraza
│   ├── Zona: salón climatizado
│   └── Estación: caja / mostrador
├── Cocina
└── Barra
```

Caja y mostrador no serán un área separada.

##### 12.3. Saudo

```text
SAUDO
└── Área Operativa Integral
    ├── estaciones de servicio
    ├── caja / mostrador
    ├── barra
    └── cocina
```

Las funciones pueden diferenciarse por rol, estación y permiso sin crear áreas artificiales.

##### 12.4. Molka

```text
MOLKA
└── Área Operativa Integral
    ├── servicio
    ├── caja / mostrador
    └── barra
```

Molka no tendrá Cocina como área productiva mientras la realidad operativa no cambie.

##### 12.5. Centro de Producción y Distribución

```text
CENTRO DE PRODUCCIÓN Y DISTRIBUCIÓN
├── Panadería y Bollería
├── Repostería
├── Pastelería y Tortas
├── Galletería
├── Producción de Barra — activación periódica
├── Cocina Caliente
├── Bodega y Abastecimiento
└── Servicios Generales — área de apoyo, no productiva
```

Recepción, alistamiento y despacho permanecerán inicialmente como procesos, zonas o estaciones de `Bodega y Abastecimiento`. `OPS-LOG-001` decidirá si el TO-BE exige separar alguna de estas funciones como área.

##### 12.6. Zonas compartidas del centro

Se conservan como zonas, no como áreas independientes:

- cámara fría;
- cuarto de congelación;
- lavado general;
- bienestar;
- terraza de materiales o activos;
- puntos de alistamiento;
- punto administrativo operativo.

La propiedad de inventario dentro de una zona compartida se resolverá mediante LOC, posición, custodio y contexto, no convirtiendo la zona en un área ficticia.

---

#### 13. Decisiones sobre agregados y atajos técnicos

##### 13.1. `Todos` no es un área empresarial

Cualquier área denominada `Todos`, `General` o equivalente utilizada solo para agregar opciones de interfaz:

- no constituye una unidad organizacional real;
- no deberá recibir inventario, personal, permisos o responsabilidad como si fuera un área;
- deberá reemplazarse por consultas, filtros o scopes agregados;
- podrá conservarse temporalmente únicamente con clasificación de compatibilidad, propietario y puerta de retiro.

**Tratamiento:** `RETIRE` como área empresarial persistida.

##### 13.2. `site_type` y nombres no conceden capacidades

`site_type`, `site_kind`, nombres visibles o coincidencias de texto podrán describir una sede, pero no serán la única fuente para decidir si:

- vende;
- produce;
- almacena;
- solicita remisiones;
- prepara remisiones;
- despacha;
- recibe;
- administra;
- permite dispositivos compartidos.

**Tratamiento:** `REUSE_OR_REFACTOR` para clasificación; `RETIRE` como regla exclusiva de negocio o autorización.

##### 13.3. Metadatos comerciales duplicados

Dirección, coordenadas, marca, logos, enlaces y estado público no se administrarán simultáneamente en literales, `pass_satellites`, componentes y `sites` sin contrato de precedencia.

**Tratamiento:** `REUSE_OR_REFACTOR`, con una proyección pública derivada del catálogo canónico.

---

#### 14. Gobierno y responsabilidades

| Objeto o decisión                | Aprueba                                     | Propietario funcional             | Custodio / mantenedor                 | Valida evidencia                       | Consumidores principales             |
| -------------------------------- | ------------------------------------------- | --------------------------------- | ------------------------------------- | -------------------------------------- | ------------------------------------ |
| alcance organizacional del grupo | Dirección / Propietarios                    | Dirección                         | Gerencia General                      | Contabilidad o asesoría cuando aplique | todas las aplicaciones               |
| titular jurídico                 | Dirección                                   | Contabilidad                      | responsable administrativo autorizado | documento oficial / asesoría           | NUMERA, ORIGO, PULSO, documentos     |
| marca                            | Dirección                                   | Dirección / Marketing             | Marketing o administrador autorizado  | evidencia de uso o titularidad         | PASS, PULSO, sitio público, VISO     |
| establecimiento                  | Dirección                                   | Contabilidad                      | administrador autorizado              | documento registral                    | NUMERA, ORIGO, documentos            |
| instalación física               | Gerencia General                            | Operaciones                       | Operaciones                           | visita, contrato o evidencia física    | VISO, NEXO, activos, continuidad     |
| sede operativa                   | Dirección o Gerencia General según política | Gerencia General                  | Operaciones                           | evidencia operacional                  | Shell, ANIMA, VISO y apps de dominio |
| área                             | Gerencia General                            | Operaciones / responsable de sede | Operaciones                           | validación de campo                    | autorización, turnos y procesos      |
| zona y estación                  | Operaciones                                 | responsable de sede o proceso     | responsable local                     | validación física                      | UX, inventario, impresión, POS       |
| capacidad de sede o área         | Gerencia General                            | propietario del proceso           | administrador autorizado              | proceso y permisos aprobados           | NEXO, FOGO, ORIGO, PULSO, ANIMA      |
| cierre, fusión o reemplazo       | Dirección                                   | propietario del objeto            | custodio canónico                     | impacto y evidencia                    | todos los consumidores afectados     |

La misma persona podrá ocupar varios roles en equipos pequeños, pero las responsabilidades deberán mantenerse separadas en el contrato y en la auditoría.

---

#### 15. Propiedad técnica y fuente de verdad

##### 15.1. Fuente externa

Los siguientes datos conservan autoridad externa:

- razón social o nombre del titular;
- identificación tributaria;
- matrícula o existencia de establecimiento;
- titularidad registral de marca;
- dirección registral;
- vigencia legal.

Vento OS conservará una referencia, copia o estado de validación; no sustituirá el registro oficial.

##### 15.2. Fuente interna

La estructura operativa interna tendrá como fuente canónica:

```text
SUPABASE VENTO
→ catálogo organizacional canónico
→ administrado mediante VISO
→ contratos compartidos desde vento-shell
```

##### 15.3. Aplicaciones

| Componente                | Responsabilidad                                                                                                  |
| ------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| VISO                      | administración autorizada, revisión de impacto, vigencia y auditoría de la estructura                            |
| `vento-shell`             | contratos, tipos, resolución de contexto y distribución segura a consumidores                                    |
| Supabase en `vento-shell` | persistencia, integridad, RLS, migraciones y proyecciones canónicas                                              |
| ANIMA                     | consumo para identidad laboral, asignaciones, turnos y asistencia; no crea sedes o áreas por su cuenta           |
| NEXO                      | consumo para inventario, LOC, remisiones y capacidades logísticas; no es propietario del catálogo organizacional |
| FOGO                      | consumo para producción y recetas por sede o área                                                                |
| ORIGO                     | consumo para compras, recepción y centros de responsabilidad                                                     |
| PULSO                     | consumo para ventas, caja, salón y operación comercial                                                           |
| NUMERA                    | consumo de dimensiones jurídicas, operativas y de costo; no redefine sedes o titulares                           |
| PASS                      | consumo de proyección pública de marca, sede, dirección y enlaces                                                |
| sitio público / VISO CMS  | consumo de proyección pública; no fuente jurídica ni operativa                                                   |

##### 15.4. Regla de escritura

Solo el servicio y la superficie administrativa propietarios podrán modificar el catálogo. Las aplicaciones consumidoras podrán proponer solicitudes de cambio, pero no crear copias locales con autoridad equivalente.

---

#### 16. Clasificación de implementación actual

| Elemento actual                                  | Evaluación                                                               | Tratamiento                                    |
| ------------------------------------------------ | ------------------------------------------------------------------------ | ---------------------------------------------- |
| `public.sites`                                   | base parcial útil, mezclada con semántica técnica y operativa            | `REUSE_OR_REFACTOR`                            |
| `public.areas`                                   | base parcial útil con duplicados, áreas agregadas y tipos inconsistentes | `REUSE_OR_REFACTOR`                            |
| asignaciones `employee_sites` y `employee_areas` | consumidores importantes de la estructura                                | `REUSE_OR_REFACTOR`                            |
| capacidades operativas por sede y área           | base funcional parcial                                                   | `REUSE_OR_REFACTOR`                            |
| `inventory_locations` y posiciones               | representan ubicación de inventario, no toda la organización             | `REUSE_OR_REFACTOR` dentro de NEXO             |
| validaciones físicas de ubicaciones              | evidencia reutilizable                                                   | `REUSE_OR_REFACTOR`                            |
| metadatos `pass_satellites`                      | proyección comercial parcial con riesgo de competencia                   | `REUSE_OR_REFACTOR`, luego consumidor derivado |
| nombres y direcciones hardcodeados               | fuentes competidoras                                                     | `RETIRE` después de adaptación                 |
| área técnica `Todos` / `General`                 | agregado de interfaz tratado como estructura                             | `RETIRE` como área empresarial                 |
| lógica por nombre de «Centro de Producción»      | dependencia no escalable                                                 | `RETIRE` como condición de negocio             |
| catálogo de titulares, marcas y establecimientos | inexistente o no canónico                                                | `BUILD`                                        |
| modelo de instalaciones y ocupación              | incompleto                                                               | `BUILD` con reutilización de evidencia física  |
| flujo de alta, traslado, cierre y fusión         | no canónico                                                              | `BUILD` en VISO y contratos de servidor        |
| auditoría de cambios organizacionales            | parcial o distribuida                                                    | `BUILD`                                        |

---

#### 17. Ciclo de vida obligatorio

Todo elemento organizacional deberá pasar conceptualmente por:

```text
BORRADOR
→ EN VALIDACIÓN
→ ACTIVO
→ SUSPENDIDO O EN CIERRE, CUANDO APLIQUE
→ CERRADO O REEMPLAZADO
```

La implementación física podrá usar otros nombres, pero deberá conservar los estados equivalentes.

##### 17.1. Alta

Requiere:

- tipo;
- código estable;
- nombre;
- propietario funcional;
- evidencia mínima;
- relaciones obligatorias;
- fecha de vigencia;
- capacidades iniciales explícitas;
- revisión de autorización y consumidores.

##### 17.2. Cambio

Requiere:

- motivo;
- actor;
- valor anterior y nuevo;
- fecha efectiva;
- consumidores afectados;
- tratamiento de operaciones abiertas;
- aprobación según sensibilidad.

##### 17.3. Cierre o fusión

No podrá ejecutarse mientras existan sin resolver:

- trabajadores activos asignados;
- turnos o check-ins vigentes;
- inventario o LOC activos;
- documentos abiertos;
- compras, producción, remisiones, pedidos o caja abiertos;
- dispositivos compartidos activos;
- referencias públicas o integraciones sin redirección;
- evidencias o historiales sin conservación.

---

#### 18. Reglas de autorización y contexto

1. La pertenencia a la organización no concede acceso a todas las sedes.
2. La marca no será scope de autorización por defecto.
3. El titular jurídico no sustituye el contexto operativo.
4. La instalación física no concede acceso a todos los contextos alojados en ella.
5. La sede activa y el área activa continuarán resolviéndose mediante el contrato de autorización aprobado.
6. Una zona o estación solo limitará acciones cuando el proceso lo requiera y exista contrato explícito.
7. Las capacidades administrativas y operativas conservarán los prerrequisitos aprobados en AUTH.
8. Un punto externo no será seleccionable como sede activa ordinaria.
9. Todo cambio territorial deberá invalidar o recalcular el contexto derivado.
10. La administración del catálogo requerirá permisos sensibles y auditoría.

---

#### 19. Reglas para direcciones

Se distinguirán:

- dirección física;
- dirección registral;
- dirección de correspondencia;
- dirección pública comercial;
- referencia interna;
- coordenadas;
- vigencia y fuente de cada dato.

Una aplicación solo recibirá la proyección necesaria. Por ejemplo:

- PASS puede recibir dirección pública y coordenadas;
- Contabilidad puede requerir dirección registral;
- Operaciones puede requerir referencia física interna;
- una dirección privada de punto externo no deberá exponerse públicamente.

---

#### 20. Preguntas pendientes y puerta de resolución

No se crean preguntas nuevas. Se reutiliza el registro vivo.

##### 20.1. Preguntas que afectan `Oficina 1`

| Preguntas                                        | Responsable                                                  | Momento límite                                                                 | Tratamiento provisional                                              |
| ------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------------------------ | -------------------------------------------------------------------- |
| `ADM-01`, `ADM-03`, `ADM-07`, `ADM-08`, `ADM-09` | Gerencia y Contabilidad según registro                       | antes del diseño físico definitivo de E3 y antes de publicar dirección oficial | sede administrativa interna activa con datos externos no verificados |
| `EXT-01` a `EXT-05`                              | asesoría contable, tributaria, jurídica, banco o aseguradora | antes de ejecutar cambios externos o marcar estado registral verificado        | tarea externa controlada `EXT-ADM-001`                               |

##### 20.2. Preguntas que afectan marcas y titulares

| Preguntas           | Responsable                        | Momento límite                                                                              | Tratamiento provisional                                          |
| ------------------- | ---------------------------------- | ------------------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| `EXT-06` a `EXT-09` | Gerencia o asesoría jurídica       | antes de declarar titularidad de marca verificada o transferir derechos                     | marcas operativas con estado documental pendiente                |
| `GOV-13` a `GOV-20` | Contabilidad, Gerencia o Marketing | `OPS-CST-001`, `OPS-CAN-001` y `CAP-SCOPE-012`; antes de automatizar recaudo y conciliación | no se usa la cuenta receptora para definir empresa, marca o sede |

##### 20.3. Preguntas que afectan Vaila

| Preguntas          | Responsable                   | Momento límite                                                                | Tratamiento provisional                        |
| ------------------ | ----------------------------- | ----------------------------------------------------------------------------- | ---------------------------------------------- |
| `COM-01`, `COM-02` | responsable de Vaila Vainilla | antes de modelar físicamente inventario, empaque y despacho de Vaila en E3/E5 | puntos externos provisionales, sin sede formal |
| `COM-03`           | responsable de Vaila Vainilla | `CAP-SCOPE-010` y diseño del proceso de reclamos                              | no altera clasificación organizacional         |

##### 20.4. Regla de no bloqueo

La aprobación de `CAP-SCOPE-001` no exige obtener de inmediato todos los documentos externos. Exige que:

- la estructura conceptual esté decidida;
- el dato pendiente tenga responsable;
- exista tratamiento provisional seguro;
- se indique la puerta que impide usarlo como dato verificado.

---

#### 21. Brechas y destinos obligatorios

| ID                    | Brecha                                                                                     | Riesgo                                                      | Destino canónico                                                                                    | Momento de resolución                                   |
| --------------------- | ------------------------------------------------------------------------------------------ | ----------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | ------------------------------------------------------- |
| `H-CAP-SCOPE-001-001` | no existe catálogo canónico completo de organización, titulares, marcas y establecimientos | atribución jurídica u operativa incorrecta                  | `SUPA-AUD-019`; `SUPA-AUD-022`; `SUPA-AUD-023`; `VISO-CORE-004` a `VISO-CORE-006`                   | E3 y paquete administrativo E5                          |
| `H-CAP-SCOPE-001-002` | `sites` y `areas` mezclan clasificación, capacidad y atajos técnicos                       | autorización, navegación e inventario inconsistentes        | `SUPA-TRANS-005` a `SUPA-TRANS-007`; `SHELL-CON-016`; `VISO-CORE-004` a `VISO-CORE-006`             | transición E3 antes de migrar consumidores              |
| `H-CAP-SCOPE-001-003` | `Oficina 1` carece de reconciliación física y registral completa                           | dirección, documentos y contexto incorrectos                | `OPS-ADM-001`; `EXT-ADM-001`; preguntas `ADM-*` y `EXT-01` a `EXT-05`                               | antes de publicación externa y diseño físico definitivo |
| `H-CAP-SCOPE-001-004` | titularidad y uso de marcas no están completamente verificados                             | contratos, facturación y publicaciones mal atribuidos       | `OPS-GOV-001`; `EXT-GOV-001`; `EXT-06` a `EXT-09`                                                   | antes de marcar titularidad verificada                  |
| `H-CAP-SCOPE-001-005` | Vaila usa frentes, puntos e invoice issuers variables                                      | inventario, recaudo y responsabilidad no reconciliados      | `OPS-CAN-001`; `OPS-CST-001`; `CAP-SCOPE-011`; `CAP-SCOPE-012`                                      | antes de automatización comercial o financiera          |
| `H-CAP-SCOPE-001-006` | Centro de Producción y distribución puede aparecer como sedes competidoras                 | duplicación de inventario, personal, permisos y costos      | `OPS-LOG-001`; `SUPA-AUD-019`; `SUPA-TRANS-005` a `SUPA-TRANS-007`                                  | E3 antes del modelo físico objetivo                     |
| `H-CAP-SCOPE-001-007` | área `Todos` o equivalentes pueden recibir semántica empresarial                           | permisos o datos asignados a una unidad inexistente         | `SUPA-AUD-019`; `SUPA-TRANS-005`; `VISO-CORE-004`                                                   | backfill y adaptación coordinada de consumidores        |
| `H-CAP-SCOPE-001-008` | metadatos de sede y marca están duplicados en aplicaciones                                 | direcciones, logos y disponibilidad divergentes             | `PASS-UX-001`; `PASS-UX-008`; `PASS-INT-003`; `SUPA-TRANS-007`                                      | paquete PASS y transición E3/E5                         |
| `H-CAP-SCOPE-001-009` | capacidades de sede pueden depender de nombre o tipo                                       | comportamiento no escalable y ampliación de alcance         | `NEXO-UX-009` a `NEXO-UX-013`; `NEXO-AUTH-029`; `SUPA-AUD-019`                                      | paquete NEXO y contrato compartido                      |
| `H-CAP-SCOPE-001-010` | no existe flujo canónico de alta, traslado, cierre y fusión                                | registros huérfanos y cierres destructivos                  | `VISO-AUTH-013` a `VISO-AUTH-020`; `VISO-UX-013` a `VISO-UX-020`; `VISO-CORE-004` a `VISO-CORE-006` | diseño VISO y paquete E5                                |
| `H-CAP-SCOPE-001-011` | cambios organizacionales no tienen una auditoría transversal demostrada                    | imposibilidad de reconstruir quién cambió el alcance        | `AUTH-QA-029`; `UX-QA-023`; `SUPA-AUD-023`; `TREQ-SUPABASE-011`                                     | antes de habilitar administración productiva            |
| `H-CAP-SCOPE-001-012` | puntos externos carecen de contrato homogéneo                                              | exposición de domicilios, activos o inventario sin custodio | `OPS-ACT-001`; `CAP-SCOPE-007`; `CAP-SCOPE-011`; `CAP-SCOPE-016`                                    | antes de activar custodia, inventario o rutas externas  |

Ninguna de estas brechas queda como pendiente narrativo sin destino.

---

#### 22. Decisiones canónicas resultantes

1. Vento Group como ecosistema y Vento Group S.A.S. como titular jurídico serán elementos distintos.
2. Marca, establecimiento, sede, instalación, área, zona, estación, canal y centro de costo no son equivalentes.
3. Vento Café, Saudo y Molka conservarán registros separados para marca, establecimiento, sede e instalación cuando aplique.
4. `Oficina 1` se reconoce como sede administrativa interna real, aunque su clasificación registral y dirección pública sigan pendientes.
5. `Oficina 1` y Vento Café no se fusionan por cercanía o relación física.
6. El Centro de Producción y Distribución será una sola sede operativa dentro de una sola instalación física mientras no exista evidencia de independencia territorial.
7. Distribución se representa como capacidad, proceso y organización interna, no como sede duplicada.
8. Vaila Vainilla no se considera sede ni titular jurídico independiente con la evidencia actual.
9. Catering es una línea de negocio o canal, no una sede.
10. Los apartamentos asociados a Vaila, vehículo y decoraciones son puntos externos controlados, no sedes.
11. Vento Café mantiene tres áreas: Servicio/Salón, Cocina y Barra.
12. Saudo mantiene una sola área operativa integral.
13. Molka mantiene una sola área operativa integral y no una cocina productiva propia.
14. Centro de Producción y Distribución mantiene áreas productivas diferenciadas, Bodega y Abastecimiento y Servicios Generales como área de apoyo.
15. Cámara fría, congelación, lavado, bienestar, terraza y puntos de alistamiento son zonas o estaciones.
16. `Todos` o `General` no será una unidad organizacional real.
17. La capacidad operativa se resolverá mediante reglas explícitas, no por nombre o tipo de sede exclusivamente.
18. VISO será la superficie administrativa candidata; Supabase en `vento-shell`, la fuente interna; Shell, el distribuidor contractual.
19. Las aplicaciones de dominio serán consumidoras y no propietarias del catálogo organizacional.
20. Los datos jurídicos conservarán evidencia y validación externa; Vento OS no sustituirá registros oficiales.
21. Los cambios organizacionales conservarán vigencia, impacto, aprobación y auditoría.
22. Las preguntas abiertas existentes no bloquean la clasificación conceptual, pero sí las puertas de uso externo o implementación física indicadas.

---

#### 23. Requisito de prueba generado

`CAP-SCOPE-001` genera un requisito nuevo porque el registro actual no protege de forma completa la integridad semántica de la jerarquía organizacional.

##### `TREQ-SUPABASE-011`

| Campo                  | Definición                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| ---------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ID                     | `TREQ-SUPABASE-011`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| Dominio                | `SUPABASE`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Regla protegida        | La estructura organizacional deberá distinguir de forma verificable organización, titular jurídico, marca, establecimiento, línea de negocio, instalación, sede operativa, área, zona, estación, canal y punto externo. Cada elemento tendrá identificador y código estables, tipo, estado, vigencia, propietario y relaciones tipadas válidas. Ningún nombre, dirección compartida, `site_type`, área agregada o metadato de aplicación podrá fusionar conceptos, conceder capacidades o crear una fuente competidora. Los elementos referenciados no podrán eliminarse destructivamente y los cambios de titularidad, ubicación, cierre o reemplazo conservarán historia y auditoría. |
| Origen                 | `CAP-SCOPE-001`; `OPS-AUD-001`; `OPS-ADM-001`; `OPS-GOV-001`; `CAP-MAP-003`; `CAP-MAP-008`; `CODE-AUD-006`; `CODE-AUD-019`; `CODE-AUD-020`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Riesgo / prioridad     | atribución jurídica incorrecta, acceso territorial indebido, inventario o costos imputados a la unidad equivocada, duplicación de sedes o áreas y pérdida histórica / crítica                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| Tipo / modalidad       | contractual + base de datos + migración + integridad referencial + RLS + integración + E2E + regresión / automatizada con validación documental controlada                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Tarea responsable      | `SUPA-AUD-019`; `SUPA-AUD-022`; `SUPA-AUD-023`; `SUPA-TRANS-005` a `SUPA-TRANS-007`; `VISO-CORE-004` a `VISO-CORE-006`; `VISO-AUTH-013` a `VISO-AUTH-020`; `VISO-UX-013` a `VISO-UX-020`; `AUTH-QA-029`; `UX-QA-023`                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| Paquete                | arquitectura y transición E3 del maestro organizacional; paquete administrativo VISO en E5; certificación del BLOQUE U                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Repositorio / ambiente | `vento-shell`, `vento-viso` y todos los consumidores / Supabase local, CI, staging y migración controlada de datos reales                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| Estado                 | `IDENTIFICADO`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| Artefacto              | Pendiente                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| Último resultado       | Pendiente                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| Evidencia              | decisiones de `CAP-SCOPE-001`; tablas actuales `sites` y `areas`; metadatos comerciales distribuidos; configuraciones de capacidades; validaciones físicas y hallazgos de implementación                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| Relación               | `TREQ-AUTH-009`; `TREQ-VISO-001`; `TREQ-INTEGRATION-006`; `TREQ-PASS-004`; `TREQ-PASS-006`; `TREQ-SUPABASE-003`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |

La fila deberá incorporarse al Registro Canónico después de `TREQ-SUPABASE-010`, conservando las catorce columnas reglamentarias.

---

#### 24. Dependencias habilitadas y restricciones

La aprobación de esta tarea habilita:

- `CAP-SCOPE-002`;
- uso de la taxonomía organizacional en las demás evaluaciones `CAP-SCOPE-*`;
- preparación de la reconciliación de `sites` y `areas` en E3;
- diseño posterior de administración organizacional en VISO;
- definición de proyecciones públicas y operativas por consumidor.

No habilita todavía:

- migraciones;
- backfills;
- eliminación de sedes o áreas actuales;
- renombrado de registros productivos;
- activación de nuevas sedes;
- publicación de datos registrales pendientes;
- cambios de titular, facturación o recaudo;
- cierre de puntos operativos.

---

#### 25. Criterios de aceptación

`CAP-SCOPE-001` podrá aprobarse cuando se confirme que:

- las diez capacidades `CAP-01.*` tienen tratamiento explícito;
- la taxonomía separa todos los conceptos empresariales y físicos relevantes;
- Vento Group, Vento Group S.A.S., Vento Café, Saudo, Molka, Vaila, Catering y Vento Producción tienen clasificación objetivo;
- `Oficina 1` tiene tratamiento provisional seguro y puerta de validación;
- el Centro de Producción y Distribución no se duplica como sede sin evidencia;
- las áreas objetivo por sede son coherentes con la operación aprobada;
- Servicios Generales se trata como área de apoyo y no como área productiva;
- zonas y estaciones no se convierten en áreas por conveniencia técnica;
- `Todos` queda destinado a retiro como área empresarial;
- VISO, Shell, Supabase y aplicaciones consumidoras tienen responsabilidades distintas;
- cada brecha está vinculada a una tarea existente y momento de resolución;
- las preguntas pendientes existentes tienen puerta y tratamiento provisional;
- se genera la fila completa `TREQ-SUPABASE-011`;
- no se autoriza implementación, migración ni cambio externo.

---

#### 26. Resultado y continuidad

Con la aprobación de `CAP-SCOPE-001` quedará establecida la decisión de cobertura para gobierno, empresas, marcas, establecimientos, instalaciones, sedes y organización.

La continuidad documental será exclusivamente:

```text
CAP-SCOPE-002
— Evaluar personal, contratación, turnos, asistencia, capacitación y retiro
```

`CAP-SCOPE-019` ratificará posteriormente la clasificación y propietario de los dieciocho dominios, pero no reabrirá estas decisiones sin nueva evidencia o contradicción explícita.


### ✅ CAP-SCOPE-002 — Evaluar personal, contratación, turnos, asistencia, capacitación y retiro

**Estado:** APROBADA 
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Dependencia cumplida:** `CAP-SCOPE-001` aprobada  
**Tarea anterior:** `CAP-SCOPE-001`  
**Siguiente tarea reservada:** `CAP-SCOPE-003`  
**Familia evaluada:** `CAP-02 — Gestionar personas y trabajo`  
**Naturaleza:** decisión de cobertura empresarial y definición conceptual objetivo  
**Implementación técnica:** no autorizada  
**Migraciones o cambios en Supabase:** no autorizados  
**Cambios contractuales, laborales, salariales o de seguridad social:** no autorizados  
**Requisitos de prueba generados:** `TREQ-INTEGRATION-007`, `TREQ-AUTH-016`

---

#### 1. Propósito

Definir el tratamiento objetivo de las capacidades mediante las cuales Vento Group:

- planea necesidades de personal;
- publica vacantes, recibe postulaciones y selecciona candidatos;
- vincula e incorpora trabajadores;
- mantiene información laboral vigente e histórica;
- asigna sedes, áreas, funciones y perfiles operativos;
- programa, publica, modifica y cancela turnos;
- registra asistencia, descansos y tiempo trabajado;
- gestiona ausencias, novedades, reemplazos y correcciones;
- capacita y comprueba preparación;
- acompaña desempeño y desarrollo;
- conserva documentos laborales;
- integra pagos y beneficios laborales;
- ejecuta retiro y cierre completo de accesos.

La tarea convierte la línea base AS-IS y la implementación técnica actual en una decisión de cobertura empresarial. No diseña todavía todas las pantallas, estados físicos de base de datos, contratos laborales, reglas salariales ni migraciones.

---

#### 2. Pregunta de decisión

`CAP-SCOPE-002` responde:

```text
¿CÓMO DEBE REPRESENTAR VENTO OS EL CICLO COMPLETO DE UNA PERSONA,
DESDE CANDIDATA HASTA TRABAJADORA RETIRADA,
QUÉ APLICACIÓN ES PROPIETARIA DE CADA ETAPA,
QUÉ PARTE ACTUAL SE REUTILIZA O SE CONSTRUYE,
Y CÓMO SE EVITAN IDENTIDADES DUPLICADAS,
TURNOS COMPETIDORES, CORRECCIONES DESTRUCTIVAS
Y ACCESOS ACTIVOS DESPUÉS DEL RETIRO?
```

La tarea prohíbe simplificaciones como:

```text
PERSONA = USUARIO = CANDIDATO = TRABAJADOR = CARGO = ROL = PERMISO
```

Cada concepto tendrá contrato, estado y responsabilidad propios.

---

#### 3. Fuentes consolidadas

La evaluación utiliza como línea base:

- `OPS-AUD-001` — empresas, sedes, áreas y operación física;
- `OPS-AUD-002` — familias de actores y responsabilidades AS-IS;
- `OPS-AUD-003` a `OPS-AUD-015` — observación, flujos, excepciones, controles, contingencia y validación;
- `CAP-MAP-001` a `CAP-MAP-015`;
- `CODE-AUD-001` a `CODE-AUD-020`;
- `MAP-IMPL-CAP-001` y `BKL-REPO-001`;
- decisiones `AUTH-MOD-*`, `AUTH-RBAC-*`, `AUTH-CTX-*` y requisitos `AUTH-QA-*`;
- tareas `CAP-TAL-001` a `CAP-TAL-006`;
- tareas de ANIMA, VISO, SHELL, Supabase, integración, evidencia y experiencia;
- `QA-REG-001` y el Registro Canónico de Requisitos de Prueba;
- `REGISTRO_VIVO_DE_PREGUNTAS_PENDIENTES` con el corte disponible;
- evidencia técnica de empleados, invitaciones, asignaciones, turnos, asistencia, documentos, perfiles, contexto laboral y cierre parcial de accesos.

Las respuestas ya registradas no se vuelven a solicitar.

---

#### 4. Alcance evaluado

La tarea evalúa directamente:

- `CAP-02.01` — Planear necesidades de personal;
- `CAP-02.02` — Reclutar y seleccionar;
- `CAP-02.03` — Vincular e incorporar trabajadores;
- `CAP-02.04` — Mantener información laboral;
- `CAP-02.05` — Asignar sedes, áreas y funciones;
- `CAP-02.06` — Programar turnos;
- `CAP-02.07` — Registrar asistencia y tiempo trabajado;
- `CAP-02.08` — Gestionar novedades, ausencias y reemplazos;
- `CAP-02.09` — Capacitar y comprobar preparación;
- `CAP-02.10` — Acompañar desempeño y desarrollo;
- `CAP-02.11` — Gestionar documentos laborales;
- `CAP-02.12` — Gestionar pagos y beneficios laborales;
- `CAP-02.13` — Gestionar retiro y cierre de accesos.

También define fronteras que utilizarán posteriormente:

- procesos TO-BE y experiencia;
- autorización y contexto operativo;
- seguridad y salud en el trabajo;
- documentos y evidencia;
- costos, pagos y contabilidad;
- integraciones externas;
- readiness y capacitación de los paquetes E5;
- analítica laboral y auditoría.

---

#### 5. Fuera de alcance

Esta tarea no:

- redacta contratos laborales;
- determina salarios, liquidaciones, aportes, retenciones o prestaciones;
- sustituye asesoría laboral, contable, tributaria o de seguridad social;
- selecciona un proveedor definitivo de nómina;
- publica vacantes ni recibe postulaciones reales;
- crea cuentas, invita trabajadores ni modifica sus permisos;
- cambia turnos o marcaciones actuales;
- corrige asistencia productiva;
- termina vínculos laborales;
- revoca sesiones o accesos reales;
- diseña todavía todas las pantallas de TALENTO, VISO o ANIMA;
- define las tablas físicas definitivas de E3;
- autoriza el despliegue de TALENTO;
- convierte NUMERA en sistema de nómina por la sola existencia de información financiera.

---

#### 6. Principios canónicos

##### 6.1. Separación semántica obligatoria

```text
PERSONA
≠ IDENTIDAD DE AUTENTICACIÓN
≠ CANDIDATO
≠ POSTULACIÓN
≠ VÍNCULO LABORAL
≠ PERFIL DE TRABAJADOR
≠ CARGO CONTRACTUAL
≠ FAMILIA DE ACTOR
≠ ROL BASE
≠ ROL OPERATIVO
≠ ASIGNACIÓN
≠ TURNO
≠ CHECK-IN
≠ PERMISO
```

La relación entre estos elementos deberá ser explícita y trazable.

##### 6.2. Una persona, múltiples etapas históricas

Una persona podrá:

- postularse más de una vez;
- ser rechazada o retirarse de un proceso;
- ser vinculada posteriormente;
- tener más de un vínculo laboral a lo largo del tiempo;
- cambiar de sede, área, cargo o modalidad;
- retirarse y ser recontratada.

Esto no deberá crear personas duplicadas ni reactivar silenciosamente accesos de un vínculo anterior.

##### 6.3. La cuenta no crea el vínculo

Una cuenta de autenticación no prueba por sí sola:

- contratación;
- vigencia laboral;
- rol;
- sede;
- área;
- permiso;
- turno;
- autorización operativa.

La autoridad deberá derivarse del vínculo, asignaciones y contexto aprobados.

##### 6.4. El vínculo no crea acceso automático

Una persona podrá estar pre-registrada o vinculada documentalmente sin tener todavía:

- cuenta activa;
- acceso a aplicaciones;
- permisos administrativos;
- rol operativo;
- turno publicado;
- check-in activo.

La activación de acceso será una transición independiente y auditada.

##### 6.5. Propiedad única por etapa

Cada etapa tendrá una aplicación propietaria. Otra aplicación podrá presentar, solicitar o consumir información, pero no mantendrá una copia competidora editable.

##### 6.6. Historial no destructivo

Los cambios en:

- vínculo;
- asignación;
- cargo;
- sede;
- área;
- turno;
- asistencia;
- capacitación;
- documento;
- remuneración;
- estado de acceso;

conservarán versión, vigencia, actor, motivo y evidencia cuando corresponda.

##### 6.7. Administración y autoservicio separados

El trabajador podrá consultar o actualizar únicamente datos autorizados como autoservicio. La administración laboral conservará las decisiones reservadas, validaciones y campos protegidos.

##### 6.8. El turno no es el vínculo

Un trabajador activo puede no tener turno en una fecha. Un turno no crea relación laboral ni asignación permanente. El turno define una jornada concreta y, cuando corresponda, el contexto operativo efectivo.

##### 6.9. La asistencia no se corrige sobrescribiendo historia

Una marcación original deberá conservarse. Toda corrección generará un caso o evento con:

- registro original;
- valor propuesto;
- motivo;
- evidencia;
- solicitante;
- aprobador;
- valor resultante;
- impacto sobre horas, reportes o pagos;
- timestamp y auditoría.

##### 6.10. Retiro laboral y retiro de acceso son coordinados, no equivalentes

El término del vínculo deberá disparar un cierre coordinado. Sin embargo, la conservación documental, el cierre financiero y la revocación técnica tendrán estados propios y podrán completarse en momentos controlados distintos.

---

#### 7. Modelo conceptual objetivo

| Concepto                  | Definición                                                       | Regla principal                                                                               |
| ------------------------- | ---------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `PERSON_IDENTITY`         | identidad empresarial estable de la persona                      | no se duplica por una nueva postulación o contratación                                        |
| `AUTH_IDENTITY`           | cuenta o principal técnico de acceso                             | puede no existir antes de la vinculación y puede quedar deshabilitada sin borrar a la persona |
| `CANDIDATE_PROFILE`       | información reutilizable de la persona como candidata            | pertenece a TALENTO y no concede acceso laboral                                               |
| `APPLICATION`             | postulación a una vacante o proceso concreto                     | tiene estados y decisiones independientes                                                     |
| `EMPLOYMENT_RELATIONSHIP` | vínculo laboral o contractual con vigencia                       | admite período de prueba, suspensión, retiro y reingreso versionado                           |
| `WORKER_PROFILE`          | proyección laboral operativa del vínculo vigente                 | no reemplaza la identidad de persona ni el vínculo histórico                                  |
| `CONTRACTUAL_POSITION`    | denominación contractual o administrativa del cargo              | no concede permisos automáticamente                                                           |
| `BASE_ROLE`               | rol administrativo o transversal autorizado                      | se gobierna mediante el modelo de autorización                                                |
| `OPERATIONAL_ROLE`        | función efectiva ejercida en una operación                       | se activa según turno, check-in y contexto                                                    |
| `WORK_ASSIGNMENT`         | asignación vigente a sede, área, función o cobertura             | puede ser primaria, secundaria, temporal o rotativa                                           |
| `SHIFT`                   | jornada planificada para una persona y contexto                  | requiere versión publicada para habilitar asistencia operativa                                |
| `ATTENDANCE_EVENT`        | hecho original de entrada, salida o descanso                     | es inmutable y puede tener correcciones vinculadas                                            |
| `ATTENDANCE_CORRECTION`   | decisión auditada que ajusta el resultado sin borrar el original | exige razón, autoridad y antes/después                                                        |
| `WORKFORCE_CASE`          | novedad, ausencia, permiso, incapacidad, reemplazo o solicitud   | sigue un proceso y estado explícitos                                                          |
| `TRAINING_REQUIREMENT`    | preparación exigida por función, sede, equipo o riesgo           | puede convertirse en prerrequisito de una capacidad sensible                                  |
| `TRAINING_COMPLETION`     | evidencia de formación, evaluación y vigencia                    | no se presume por asignación de rol                                                           |
| `PERFORMANCE_RECORD`      | observación, objetivo, retroalimentación o evaluación            | requiere alcance, sensibilidad y conservación diferenciados                                   |
| `LABOR_DOCUMENT`          | documento relacionado con candidato, vínculo o trabajador        | exige clasificación, propietario, retención y acceso privado                                  |
| `COMPENSATION_RESULT`     | resultado emitido por la fuente autorizada de pago laboral       | Vento OS no lo recalcula sin decisión posterior                                               |
| `OFFBOARDING_CASE`        | cierre coordinado del vínculo y accesos                          | conserva checklist, responsables, fechas y excepciones                                        |

---

#### 8. Estados canónicos del ciclo de persona y trabajo

##### 8.1. Candidato y postulación

Estados conceptuales mínimos:

```text
DRAFT
SUBMITTED
UNDER_REVIEW
INTERVIEW
EVALUATION
OFFERED
ACCEPTED_FOR_PRE_REGISTRATION
REJECTED
WITHDRAWN
CLOSED
```

Una persona continúa siendo candidata hasta que exista decisión de vinculación autorizada.

##### 8.2. Vínculo laboral

Estados conceptuales mínimos:

```text
PRE_REGISTERED
PENDING_DOCUMENTS
PENDING_ACTIVATION
PROBATION
ACTIVE
ON_LEAVE
SUSPENDED
ENDING
ENDED
CANCELLED_BEFORE_START
```

El período de prueba es un estado del vínculo, no una persona o usuario separado.

##### 8.3. Acceso laboral

Estados conceptuales mínimos:

```text
NOT_PROVISIONED
INVITED
PENDING_ACCEPTANCE
ACTIVE
TEMPORARILY_BLOCKED
REVOCATION_PENDING
REVOKED
```

El estado de acceso no sustituye el estado del vínculo.

##### 8.4. Turno

Estados conceptuales mínimos:

```text
DRAFT
PUBLISHED
SUPERSEDED
CANCELLED
COMPLETED
NO_SHOW
```

Una modificación posterior a publicación deberá crear revisión o evento equivalente, no cambiar silenciosamente la versión utilizada por el trabajador.

##### 8.5. Novedad laboral

Estados conceptuales mínimos:

```text
REPORTED
UNDER_REVIEW
APPROVED
REJECTED
APPLIED
CANCELLED
CLOSED
```

Cada tipo de novedad podrá añadir estados específicos sin romper el contrato común.

##### 8.6. Retiro

Estados conceptuales mínimos:

```text
INITIATED
LABOR_CLOSURE_PENDING
ACCESS_REVOCATION_PENDING
ASSET_RETURN_PENDING
DOCUMENT_CLOSURE_PENDING
FINANCIAL_CLOSURE_PENDING
COMPLETED
COMPLETED_WITH_EXCEPTION
```

---

#### 9. Propiedad funcional y tecnológica

| Componente                               | Propiedad objetivo                              | Responsabilidades                                                                                                                                     | Límites                                                                                               |
| ---------------------------------------- | ----------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| TALENTO                                  | proceso previo a la vinculación                 | vacantes, postulaciones, expediente de selección, entrevistas, decisión, oferta y pre-registro                                                        | no administra trabajadores activos, turnos ni asistencia; no está operativo hasta aprobar `CAP-TAL-*` |
| VISO                                     | administración laboral y programación           | vínculo, perfil administrativo, asignaciones, turnos, aprobaciones, correcciones, capacitación administrativa y offboarding                           | no captura asistencia ordinaria ni duplica la experiencia personal de ANIMA                           |
| ANIMA                                    | experiencia personal del trabajador             | consulta de vínculo permitido, turnos, check-in/out, descansos, solicitudes, novedades, notificaciones, documentos personales y capacitación asignada | no concede roles, sedes o permisos por sí sola; no mantiene un maestro laboral competidor             |
| SHELL                                    | identidad, contratos, SSO y contexto compartido | distribución de contratos, sesión, contexto efectivo e invalidación                                                                                   | no es propietario empresarial del proceso laboral                                                     |
| Supabase gobernado desde `vento-shell`   | persistencia canónica                           | identidad enlazada, vínculos, asignaciones, turnos, asistencia, documentos, auditoría y eventos                                                       | estructura física se resolverá en E3; no se modifica en esta tarea                                    |
| NUMERA                                   | consumidor financiero                           | recibe resultados y hechos económicos autorizados relacionados con pagos                                                                              | no se declara motor de nómina ni fuente legal de liquidación en esta tarea                            |
| Contabilidad o proveedor laboral externo | fuente autorizada provisional de pago laboral   | cálculo, validación y emisión según el proceso vigente                                                                                                | deberá identificarse mediante `DAT-14`, `DAT-15` e integración aprobada                               |
| Aplicaciones operativas                  | consumidoras del contexto                       | usan actor, turno, check-in, sede, área y rol efectivo                                                                                                | no administran el vínculo ni crean permisos laborales locales                                         |

---

#### 10. Línea base de implementación verificable

| Estado actual                            | Subcapacidades                                                               | Lectura                                                                                                           |
| ---------------------------------------- | ---------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CAP-02.04`, `CAP-02.05`, `CAP-02.06`                                        | existen datos y superficies de empleados, asignaciones y turnos, pero deberán alinearse con la propiedad objetivo |
| `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CAP-02.01`, `CAP-02.03`, `CAP-02.07`, `CAP-02.08`, `CAP-02.11`, `CAP-02.13` | hay estructuras y flujos parciales sin cobertura integral o cierre auditable                                      |
| `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CAP-02.09`, `CAP-02.10`, `CAP-02.12`                                        | el resultado depende principalmente de personas, documentos o sistemas externos                                   |
| `FUTURA_CON_BASE_TÉCNICA`                | `CAP-02.02`                                                                  | TALENTO posee base técnica, pero no despliegue, datos ni adopción operativa                                       |

La existencia de código no cambia por sí sola estas clasificaciones.

---

#### 11. Matriz de decisión de cobertura

| ID          | Capacidad                                   | Tratamiento objetivo | Propietario funcional candidato                            | Aplicación propietaria candidata                                                               | Fuente de verdad objetivo                                      | Tratamiento transitorio                                            | Destino canónico                                                                                                            |
| ----------- | ------------------------------------------- | -------------------- | ---------------------------------------------------------- | ---------------------------------------------------------------------------------------------- | -------------------------------------------------------------- | ------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------- |
| `CAP-02.01` | Planear necesidades de personal             | `REUSE_OR_REFACTOR`  | Gerencia general y responsables de operación               | VISO                                                                                           | plan de dotación, cobertura y vacantes aprobado                | planeación manual controlada mientras se define información mínima | `PROC-CAT-002`; `PROC-CAT-019`; `VISO-UX-002`; `CAP-TAL-001`                                                                |
| `CAP-02.02` | Reclutar y seleccionar                      | `BUILD`              | Gerencia o responsable de selección                        | TALENTO                                                                                        | expediente y decisión de selección                             | proceso manual controlado; TALENTO permanece no operativo          | `CAP-TAL-001` a `CAP-TAL-004`; `TREQ-TALENTO-001`                                                                           |
| `CAP-02.03` | Vincular e incorporar trabajadores          | `REUSE_OR_REFACTOR`  | Gerencia y administración laboral                          | VISO, con handoff desde TALENTO y experiencia en ANIMA                                         | vínculo laboral y pre-registro enlazados a persona única       | invitación actual solo bajo controles reforzados                   | `CAP-TAL-005`; `CAP-TAL-006`; `AUTH-DB-019`; `AUTH-SRV-004` a `AUTH-SRV-006`                                                |
| `CAP-02.04` | Mantener información laboral                | `REUSE_OR_REFACTOR`  | Administración laboral                                     | VISO                                                                                           | maestro laboral versionado                                     | conservar registros actuales sin ampliar campos autoadministrables | `VISO-UX-002`; `PROC-CAT-005`; `SUPA-AUD-019`; `EVID-ARC-001` a `EVID-ARC-009`                                              |
| `CAP-02.05` | Asignar sedes, áreas y funciones            | `REUSE_OR_REFACTOR`  | Gerencia y administradores con alcance                     | VISO                                                                                           | asignaciones laborales vigentes e históricas                   | mantener asignaciones existentes con validación territorial        | `VISO-AUTH-007` a `VISO-AUTH-012`; `TREQ-VISO-001`; `TREQ-AUTH-009`                                                         |
| `CAP-02.06` | Programar turnos                            | `REUSE_OR_REFACTOR`  | responsables autorizados de programación                   | VISO                                                                                           | turno versionado y revisión publicada                          | VISO será la fuente; ANIMA dejará de ser editor competidor         | `VISO-UX-003`; `INT-WORK-001`; `INT-WORK-002`; `TREQ-INTEGRATION-007`                                                       |
| `CAP-02.07` | Registrar asistencia y tiempo trabajado     | `REUSE_OR_REFACTOR`  | Administración laboral y supervisión operativa             | ANIMA para captura; VISO para revisión                                                         | eventos originales, sesión derivada y correcciones auditadas   | conservar captura actual con endurecimiento offline e idempotencia | `INT-WORK-003` a `INT-WORK-005`; `ANIMA-AUTH-001` a `ANIMA-AUTH-020`; `TREQ-ANIMA-003`; `TREQ-ANIMA-004`                    |
| `CAP-02.08` | Gestionar novedades, ausencias y reemplazos | `BUILD`              | Gerencia, supervisores y administración laboral según tipo | VISO para decisión; ANIMA para reporte y consulta                                              | caso laboral con estado, evidencia y resolución                | operación manual o parcial sin corrección destructiva              | `PROC-CAT-002`; `PROC-CAT-013`; `PROC-CAT-014`; `PROC-CAT-018`; `ANIMA-AUTH-012`; `TREQ-INTEGRATION-007`                    |
| `CAP-02.09` | Capacitar y comprobar preparación           | `BUILD`              | propietario de la capacidad y administración laboral       | VISO para asignación; ANIMA para consumo y evidencia                                           | requisito, contenido, evaluación, vigencia y evidencia         | capacitación manual controlada y registro mínimo verificable       | `CAP-TAL-006`; `DELIV-PKG-021`; `READY-GATE-009`; `E5-GATE-006`; `EVID-ARC-001` a `EVID-ARC-009`                            |
| `CAP-02.10` | Acompañar desempeño y desarrollo            | `DEFERRED`           | Gerencia y responsable directo                             | VISO candidata; ANIMA solo como experiencia personal autorizada                                | registro sensible de objetivos, retroalimentación y decisiones | `CONTROLLED_MANUAL` hasta diseñar proceso, privacidad y uso        | `PROC-CAT-002`; `PROC-CAT-018`; `PROC-CAT-019`; `PROC-ACTOR-004`; `PROC-ACTOR-005`; `VISO-UX-002`                           |
| `CAP-02.11` | Gestionar documentos laborales              | `REUSE_OR_REFACTOR`  | Administración laboral y custodio documental               | VISO y ANIMA según actor; TALENTO antes de vinculación                                         | metadatos canónicos y Storage privado                          | conservar documentos actuales sin ampliar acceso                   | `CAP-TAL-003`; `EVID-ARC-001` a `EVID-ARC-010`; `TREQ-SUPABASE-004`                                                         |
| `CAP-02.12` | Gestionar pagos y beneficios laborales      | `INTEGRATE_EXTERNAL` | Contabilidad y Gerencia                                    | proveedor o proceso externo como fuente; VISO/ANIMA consumidoras; NUMERA consumidor financiero | resultado laboral autorizado y documento emitido               | proceso actual manual o externo controlado                         | `CAP-SCOPE-012`; `OPS-CST-001`; `INT-EXT-001` a `INT-EXT-019`; `DAT-14`; `DAT-15`                                           |
| `CAP-02.13` | Gestionar retiro y cierre de accesos        | `BUILD`              | Gerencia y administración laboral                          | VISO como orquestador; servicios compartidos ejecutan cierre                                   | caso de retiro y eventos de revocación correlacionados         | checklist manual obligatorio hasta automatización                  | `CAP-TAL-006`; `AUTH-DB-019`; `AUTH-DB-035`; `AUTH-DEV-011` a `AUTH-DEV-013`; `INT-EXT-008`; `INT-EXT-019`; `TREQ-AUTH-016` |

##### 11.1. Resumen de clasificaciones

| Tratamiento          | Cantidad |
| -------------------- | -------: |
| `REUSE_OR_REFACTOR`  |        7 |
| `BUILD`              |        4 |
| `INTEGRATE_EXTERNAL` |        1 |
| `DEFERRED`           |        1 |
| **Total**            |   **13** |

No se asigna `BUY`, `OUT_OF_SCOPE` ni `RETIRE` a una capacidad completa. Sí se retiran patrones legacy específicos descritos posteriormente.

---

#### 12. CAP-02.01 — Planear necesidades de personal

La planeación deberá distinguir:

- dotación estable;
- vacante;
- cobertura temporal;
- reemplazo;
- refuerzo por temporada;
- necesidad por sede, área, función o franja;
- competencia o capacitación requerida;
- fecha objetivo;
- costo o restricción presupuestal cuando corresponda;
- decisión de cubrir, redistribuir, contratar o diferir.

VISO será la superficie administrativa candidata. TALENTO recibirá únicamente vacantes aprobadas para publicación.

La planeación no se deducirá solo del número de turnos ni de usuarios activos.

---

#### 13. CAP-02.02 — Reclutar y seleccionar

TALENTO será un producto futuro y permanecerá no operativo hasta aprobar `CAP-TAL-001` a `CAP-TAL-006`.

El proceso deberá conservar:

- vacante publicada y versión;
- canal de origen;
- consentimiento;
- postulante y postulación;
- documentos solicitados por etapa;
- evaluación;
- entrevista;
- decisión;
- oferta;
- rechazo o retiro;
- plazo de conservación;
- trazabilidad de acceso a datos.

No deberá exigirse una cuenta laboral activa para postularse.

El código o esquema existente de TALENTO no constituye prueba de despliegue, adopción ni capacidad operativa.

---

#### 14. CAP-02.03 — Vincular e incorporar trabajadores

El handoff aprobado será:

```text
TALENTO
→ candidato aceptado y pre-registro autorizado
→ VISO crea o vincula vínculo laboral
→ servicio compartido genera invitación controlada
→ ANIMA permite aceptación y experiencia del trabajador
→ SHELL y aplicaciones consumen acceso y contexto
```

Reglas:

1. una persona candidata y una trabajadora se enlazan, no se copian;
2. la invitación persistida define identidad, rol, sede, vigencia y alcance permitido;
3. el cliente no podrá elevar rol o sede mediante payload o metadatos;
4. la aceptación será idempotente;
5. la expiración o cancelación no dejará acceso parcial;
6. la incorporación podrá exigir documentos, capacitación o aprobación antes de activar capacidades sensibles;
7. período de prueba y vínculo definitivo serán estados del mismo vínculo;
8. la falta de cuenta no elimina el expediente laboral.

---

#### 15. CAP-02.04 — Mantener información laboral

La información se clasificará como:

- identidad básica;
- contacto;
- información contractual;
- asignación organizacional;
- datos operativos;
- información de emergencia;
- información financiera restringida;
- documentos;
- datos sensibles o especialmente protegidos;
- historial de cambios.

Cada campo deberá definir:

- propietario funcional;
- quién puede verlo;
- quién puede modificarlo;
- si admite autoservicio;
- evidencia requerida;
- vigencia;
- retención;
- efecto sobre otras aplicaciones.

ANIMA podrá permitir autoservicio únicamente sobre campos aprobados. VISO conservará decisiones administrativas y datos protegidos.

---

#### 16. CAP-02.05 — Asignar sedes, áreas y funciones

Se distinguirán:

```text
ASIGNACIÓN HABITUAL
ASIGNACIÓN SECUNDARIA
COBERTURA TEMPORAL
ROTACIÓN POR TURNO
ROL OPERATIVO DEL TURNO
CONTEXTO ACTIVO
```

Reglas:

- una asignación no concede todos los permisos de la sede;
- el apoyo temporal no transfiere propiedad de proceso;
- una vacante no elimina la responsabilidad;
- una rotación deberá conservar responsable habitual y ejecutor efectivo;
- la asignación deberá respetar sedes y áreas canónicas de `CAP-SCOPE-001`;
- cambios de asignación deberán invalidar contexto y caché derivados;
- VISO deberá mostrar el impacto de una asignación antes de guardar.

---

#### 17. CAP-02.06 — Programar turnos

##### 17.1. Propiedad

VISO será la fuente administrativa de turnos. ANIMA será consumidora y superficie personal.

Una capacidad administrativa puntual expuesta en ANIMA deberá usar el mismo contrato y servicio de VISO; no podrá mantener reglas o escrituras competidoras.

##### 17.2. Contenido mínimo

Cada turno deberá declarar, cuando aplique:

- trabajador;
- vínculo vigente;
- fecha y zona horaria;
- inicio y fin;
- sede;
- área;
- rol operativo;
- descanso previsto;
- estado;
- revisión;
- autor;
- fecha de publicación;
- motivo de modificación o cancelación.

##### 17.3. Publicación y cambios

```text
BORRADOR
→ VALIDACIÓN
→ PUBLICACIÓN
→ NOTIFICACIÓN
→ CONSUMO EN ANIMA
→ EJECUCIÓN / ASISTENCIA
```

Después de publicar:

- una modificación creará una revisión o evento equivalente;
- la versión anterior permanecerá auditable;
- el trabajador deberá ser notificado;
- el check-in deberá enlazarse a la revisión efectiva;
- una modificación cercana al inicio deberá aplicar reglas de autoridad y comunicación;
- una cancelación no eliminará el turno;
- solapes y contextos incompatibles deberán bloquearse antes de publicar.

---

#### 18. CAP-02.07 — Registrar asistencia y tiempo trabajado

ANIMA será propietaria de la captura personal de:

- entrada;
- salida;
- inicio de descanso;
- fin de descanso;
- evidencia de ubicación o dispositivo cuando aplique;
- estado offline y sincronización.

El contrato deberá:

- exigir turno publicado cuando la regla lo requiera;
- resolver sede, área y rol desde el turno y contexto canónicos;
- usar identificadores idempotentes;
- persistir localmente antes de confirmar que un evento está encolado;
- reautorizar al sincronizar;
- distinguir `applied`, `duplicate` y `conflict`;
- soportar turnos cruzados de medianoche;
- evitar dos sesiones activas incompatibles;
- conservar eventos originales;
- producir una sesión o resultado derivado reproducible;
- permitir revisión administrativa en VISO.

La asistencia no deberá convertirse automáticamente en resultado de nómina sin reglas y aprobación posteriores.

---

#### 19. CAP-02.08 — Gestionar novedades, ausencias y reemplazos

Se utilizará un contrato común de caso laboral para:

- ausencia informada;
- permiso;
- incapacidad;
- retraso;
- salida anticipada;
- olvido de marcación;
- corrección de turno;
- corrección de asistencia;
- reemplazo;
- cambio temporal de sede o área;
- novedad disciplinaria cuando se apruebe su tratamiento;
- otras excepciones autorizadas.

Cada caso deberá conservar:

- tipo;
- trabajador;
- turno o período afectado;
- estado;
- descripción;
- evidencia;
- solicitante;
- responsable de decisión;
- resolución;
- efectos derivados;
- notificación;
- historial.

La autoridad exacta por tipo se resolverá en los procesos TO-BE y no se deducirá únicamente del rol `gerente`.

---

#### 20. CAP-02.09 — Capacitar y comprobar preparación

La capacitación deberá distinguir:

- contenido informativo;
- inducción;
- procedimiento operativo;
- manejo de equipo;
- seguridad;
- inocuidad;
- autorización o certificación externa;
- actualización obligatoria;
- entrenamiento para una aplicación o cambio de proceso.

El sistema deberá poder registrar:

- requisito aplicable;
- versión del contenido;
- asignación;
- fecha límite;
- consumo;
- evaluación;
- resultado;
- evidencia;
- vigencia y renovación;
- excepción autorizada.

Una capacitación solo bloqueará una capacidad cuando exista política aprobada y vínculo explícito con la función o riesgo.

Los paquetes E5 conservarán su capacitación de adopción, pero esa capacitación no sustituirá el historial laboral cuando el contenido sea permanente u obligatorio.

---

#### 21. CAP-02.10 — Acompañar desempeño y desarrollo

La capacidad queda `DEFERRED` con operación `CONTROLLED_MANUAL` porque todavía no existe definición suficiente de:

- propósito;
- frecuencia;
- métricas;
- responsables;
- confidencialidad;
- derecho de consulta o respuesta;
- vínculo con período de prueba;
- impacto sobre decisiones laborales;
- retención.

El diseño posterior deberá separar:

```text
RETROALIMENTACIÓN OPERATIVA
≠ EVALUACIÓN FORMAL
≠ NOVEDAD DISCIPLINARIA
≠ PLAN DE DESARROLLO
≠ DECISIÓN DE CONTINUIDAD
```

No se habilitará un módulo genérico de calificaciones sin proceso y gobierno aprobados.

---

#### 22. CAP-02.11 — Gestionar documentos laborales

Los documentos podrán pertenecer a:

- candidatura;
- selección;
- pre-registro;
- vínculo;
- trabajador;
- capacitación;
- novedad;
- pago;
- retiro.

Cada tipo documental definirá:

- propietario del hecho respaldado;
- sensibilidad;
- etapa en que se solicita;
- obligatoriedad;
- versión;
- vigencia;
- sustitución o anulación;
- acceso del trabajador;
- acceso administrativo;
- retención legal;
- eliminación o anonimización cuando corresponda.

Reglas:

- Storage será privado;
- las URLs serán temporales y auditables;
- conocer una ruta no concederá acceso;
- TALENTO conservará documentos de selección hasta el handoff o cierre;
- VISO conservará el expediente laboral administrativo;
- ANIMA presentará al trabajador únicamente documentos propios autorizados;
- el retiro no eliminará documentos que deban conservarse.

---

#### 23. CAP-02.12 — Gestionar pagos y beneficios laborales

##### 23.1. Decisión de cobertura

La capacidad se clasifica `INTEGRATE_EXTERNAL`.

Vento OS no se declara fuente legal de nómina, liquidación, aportes o retenciones en esta fase.

##### 23.2. Fuente provisional

Hasta resolver `DAT-14` y `DAT-15`, se reconoce:

```text
CÁLCULO Y RESULTADO LABORAL
→ proceso o proveedor externo por confirmar

VENTO OS
→ consumidor de resultados autorizados y evidencia
```

##### 23.3. Fronteras

- Contabilidad o el proveedor autorizado conserva el cálculo oficial.
- VISO podrá administrar estados, incidencias y validaciones internas aprobadas.
- ANIMA podrá presentar comprobantes o beneficios propios al trabajador con acceso privado.
- NUMERA podrá recibir hechos económicos consolidados, no recalcular nómina sin decisión expresa.
- La integración deberá reconciliar período, trabajador, vínculo, conceptos, totales, estado y documento fuente.
- Las correcciones se realizarán en la fuente propietaria y se propagarán como nueva versión o ajuste.

---

#### 24. CAP-02.13 — Gestionar retiro y cierre de accesos

##### 24.1. Inicio

El retiro deberá iniciarse mediante un caso autorizado con:

- trabajador y vínculo;
- fecha efectiva;
- motivo clasificado con acceso restringido;
- responsable;
- tareas de cierre;
- excepciones;
- estado.

##### 24.2. Cierre laboral

Podrá incluir:

- documentos pendientes;
- devolución de activos;
- cierre de turnos;
- asistencia pendiente;
- novedades abiertas;
- capacitación o compromisos;
- resultado financiero;
- entrega de información;
- conservación de expediente.

##### 24.3. Cierre técnico

Deberá coordinar:

- revocación de invitaciones pendientes;
- desactivación de asignaciones vigentes;
- cierre de contexto operativo;
- invalidación de sesiones y tokens derivados;
- retiro de roles y excepciones;
- desvinculación o revocación de dispositivos;
- bloqueo de replays offline con autoridad anterior;
- revocación de credenciales externas personales cuando existan;
- cierre de acceso a documentos y aplicaciones;
- auditoría de cada resultado.

##### 24.4. Historia y reingreso

No se borrarán:

- persona;
- vínculo terminado;
- turnos históricos;
- asistencia;
- decisiones;
- documentos sujetos a retención;
- auditoría.

Un reingreso generará un nuevo vínculo y nuevas asignaciones. No reactivará automáticamente permisos del vínculo anterior.

---

#### 25. Reglas de propiedad entre TALENTO, VISO y ANIMA

| Resultado                          | Propietario                                   | Consumidores                                     |
| ---------------------------------- | --------------------------------------------- | ------------------------------------------------ |
| vacante aprobada para publicación  | VISO                                          | TALENTO                                          |
| publicación y postulación          | TALENTO                                       | VISO                                             |
| expediente y decisión de selección | TALENTO                                       | VISO según autorización                          |
| pre-registro aceptado              | TALENTO hasta handoff                         | VISO                                             |
| vínculo laboral                    | VISO                                          | ANIMA, SHELL, aplicaciones autorizadas           |
| asignaciones                       | VISO                                          | SHELL, ANIMA, aplicaciones operativas            |
| turno borrador y publicado         | VISO                                          | ANIMA, SHELL, aplicaciones operativas            |
| asistencia original                | ANIMA                                         | VISO, SHELL y consumidores autorizados           |
| corrección de asistencia           | VISO mediante proceso aprobado                | ANIMA, NUMERA o proveedor autorizado             |
| documento de selección             | TALENTO                                       | VISO mediante handoff controlado                 |
| documento laboral                  | VISO                                          | ANIMA para autoservicio permitido                |
| cierre de acceso                   | VISO orquesta; servicios compartidos ejecutan | todas las aplicaciones e integraciones afectadas |

Ninguna aplicación podrá mantener una versión editable independiente del mismo resultado.

---

#### 26. Patrones legacy destinados a retiro

Se clasifica `RETIRE` el uso de los siguientes patrones, no las capacidades empresariales:

1. aceptar rol, sede o alcance enviados por el cliente al activar una invitación;
2. considerar una cuenta activa como prueba de vínculo vigente;
3. crear una identidad laboral nueva para cada postulación o reingreso;
4. permitir que VISO y ANIMA mantengan reglas competidoras de edición de turnos;
5. modificar un turno publicado sin revisión ni notificación;
6. sobrescribir marcaciones para corregir asistencia;
7. utilizar notas libres como único registro de una novedad o corrección;
8. conservar documentos laborales en almacenamiento público o con acceso por ruta conocida;
9. inferir responsabilidad de proceso a partir del rol de software;
10. mantener acceso por sesiones, dispositivos, excepciones o colas offline después del retiro;
11. borrar el trabajador para cerrar acceso;
12. presentar TALENTO como producto operativo antes de despliegue y adopción aprobados;
13. tratar NUMERA como sistema de nómina sin contrato funcional y fuente legal definidos.

---

#### 27. Preguntas pendientes reutilizadas

No se crean preguntas nuevas.

| ID       | Dato pendiente                                        | Decisión que afecta                      | Responsable                            | Puerta máxima de resolución                                                                          | Tratamiento provisional                                                 |
| -------- | ----------------------------------------------------- | ---------------------------------------- | -------------------------------------- | ---------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| `OPE-08` | quién autoriza cambiar un horario ya enviado          | autoridad de revisión y publicación      | persona que administra horarios        | antes de aprobar proceso TO-BE de turnos en `PROC-CAT-012` a `PROC-CAT-014` y antes del paquete VISO | solo responsable autorizado y cambio documentado; no edición silenciosa |
| `OPE-09` | quién autoriza corregir una hora de entrada o salida  | flujo de corrección de asistencia        | trabajador o responsable de asistencia | antes de implementar correcciones y antes del piloto ANIMA/VISO                                      | corrección manual controlada que conserve original, motivo y aprobador  |
| `DAT-14` | dónde se calcula actualmente el pago laboral          | fuente externa y contrato de integración | Contabilidad                           | antes de `CAP-SCOPE-012`, `INT-EXT-001` y cualquier integración de pagos                             | `INTEGRATE_EXTERNAL` con proceso actual protegido                       |
| `DAT-15` | dónde se conserva el resultado final del pago laboral | documento y fuente de verdad             | Contabilidad                           | antes de `CAP-SCOPE-012`, `EVID-ARC-001` y diseño de consulta en ANIMA                               | no duplicar ni recalcular; conservar evidencia en la fuente actual      |

Estas respuestas no bloquean la clasificación de cobertura, pero sí las puertas indicadas.

---

#### 28. Riesgos principales

| Riesgo                                   | Consecuencia                          | Control objetivo                                             |
| ---------------------------------------- | ------------------------------------- | ------------------------------------------------------------ |
| persona, usuario y trabajador duplicados | expedientes y accesos inconsistentes  | identidad enlazada y vínculo versionado                      |
| TALENTO activado prematuramente          | datos de candidatos sin gobierno      | mantenerlo futuro hasta `CAP-TAL-001` a `CAP-TAL-006`        |
| invitación manipulable                   | elevación de rol o sede               | invitación persistida, validación servidor y `TREQ-AUTH-005` |
| dos fuentes de turnos                    | horarios divergentes                  | VISO propietario y contrato `INT-WORK-001`                   |
| cambio silencioso de turno publicado     | trabajador opera con versión distinta | revisiones, notificación y `TREQ-INTEGRATION-007`            |
| marcación offline perdida o duplicada    | asistencia no confiable               | persistencia durable e idempotencia                          |
| corrección destructiva                   | historia laboral irreconstruible      | evento de corrección con antes/después                       |
| reemplazo sin contexto                   | permisos del trabajador equivocado    | turno, actor y contexto recalculados                         |
| capacitación presumida por rol           | operación insegura                    | requisito y evidencia de preparación                         |
| documentos accesibles lateralmente       | exposición de datos laborales         | Storage privado y acceso temporal                            |
| nómina duplicada en Vento OS             | diferencias legales y contables       | fuente externa y reconciliación                              |
| retiro parcial                           | acceso después de terminar vínculo    | offboarding coordinado y `TREQ-AUTH-016`                     |
| reingreso reactiva permisos antiguos     | acceso indebido                       | nuevo vínculo y aprovisionamiento explícito                  |

---

#### 29. Hallazgos y destinos canónicos

| ID                    | Hallazgo                                                                                       | Riesgo                                           | Destino canónico                                                                                                            | Momento de resolución                                |
| --------------------- | ---------------------------------------------------------------------------------------------- | ------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------- |
| `H-CAP-SCOPE-002-001` | persona, candidato, usuario, vínculo y trabajador no tienen todavía un contrato integral único | duplicación e identidad inconsistente            | `CAP-TAL-003` a `CAP-TAL-006`; `AUTH-DB-019`; `SHELL-CON-014`; `SHELL-CON-023`; `TREQ-TALENTO-001`                          | E2/E3 antes de integrar TALENTO                      |
| `H-CAP-SCOPE-002-002` | TALENTO tiene base técnica sin despliegue ni adopción                                          | producto futuro presentado como actual           | `CAP-TAL-001` a `CAP-TAL-006`; `TREQ-SHELL-009`                                                                             | E2 antes de cualquier piloto o publicación           |
| `H-CAP-SCOPE-002-003` | la aceptación de invitación requiere eliminar confianza en valores del cliente                 | escalamiento de rol y sede                       | `ANIMA-AUTH-019`; `ANIMA-AUTH-020`; `AUTH-SRV-004` a `AUTH-SRV-006`; `AUTH-DB-002`; `TREQ-AUTH-005`                         | P0 antes de ampliar invitaciones                     |
| `H-CAP-SCOPE-002-004` | VISO y ANIMA pueden actuar como editores competidores de turnos                                | fuentes divergentes                              | `CAP-TAL-001`; `VISO-UX-003`; `INT-WORK-001`; `INT-WORK-002`; `SHELL-CON-016`                                               | E2 antes del rediseño de programación                |
| `H-CAP-SCOPE-002-005` | no existe contrato completo de revisión publicada del turno                                    | asistencia ligada a horario alterado             | `PROC-CAT-009` a `PROC-CAT-018`; `VISO-AUTH-010` a `VISO-AUTH-012`; `TREQ-INTEGRATION-007`                                  | antes del paquete VISO/ANIMA de turnos               |
| `H-CAP-SCOPE-002-006` | asistencia offline e idempotencia son parciales                                                | pérdida o duplicación de marcaciones             | `ANIMA-AUTH-014`; `ANIMA-AUTH-015`; `ANIMA-UX-011`; `ANIMA-UX-012`; `TREQ-ANIMA-003`; `TREQ-ANIMA-004`                      | P0 en paquete de asistencia                          |
| `H-CAP-SCOPE-002-007` | no existe corrección auditable completa de asistencia                                          | historia sobrescrita y pagos erróneos            | `PROC-CAT-002`; `PROC-CAT-013`; `PROC-CAT-014`; `PROC-CAT-018`; `TREQ-INTEGRATION-007`; `OPE-09`                            | E2 antes de implementar ajustes                      |
| `H-CAP-SCOPE-002-008` | ausencias, permisos y reemplazos no comparten un ciclo completo                                | turnos y contextos inconsistentes                | `ANIMA-AUTH-012`; `PROC-CAT-002`; `PROC-CAT-009` a `PROC-CAT-018`; `OPE-08`                                                 | E2 y paquete de programación                         |
| `H-CAP-SCOPE-002-009` | capacitación y readiness laboral se manejan principalmente de forma manual                     | tareas sensibles sin preparación comprobada      | `CAP-TAL-006`; `DELIV-PKG-021`; `READY-GATE-009`; `E5-GATE-006`; `EVID-ARC-004`                                             | antes de habilitar capacidades condicionadas         |
| `H-CAP-SCOPE-002-010` | desempeño y desarrollo carecen de propósito, privacidad y proceso aprobados                    | calificaciones arbitrarias o exposición sensible | `PROC-CAT-002`; `PROC-CAT-018`; `PROC-CAT-019`; `PROC-ACTOR-004`; `PROC-ACTOR-005`; `VISO-UX-002`                           | diferido hasta diseño funcional específico           |
| `H-CAP-SCOPE-002-011` | documentos laborales están distribuidos entre aplicaciones y Storage                           | acceso lateral y retención incoherente           | `CAP-TAL-003`; `EVID-ARC-001` a `EVID-ARC-010`; `TREQ-SUPABASE-004`                                                         | E2/E4 antes de ampliar documentos                    |
| `H-CAP-SCOPE-002-012` | la fuente de cálculo y conservación de pagos laborales sigue pendiente                         | duplicación y conciliación imposible             | `DAT-14`; `DAT-15`; `CAP-SCOPE-012`; `OPS-CST-001`; `INT-EXT-001` a `INT-EXT-019`                                           | antes de diseñar integración laboral-financiera      |
| `H-CAP-SCOPE-002-013` | el retiro técnico es parcial y no coordina todas las superficies                               | acceso residual                                  | `CAP-TAL-006`; `AUTH-DB-019`; `AUTH-DB-035`; `AUTH-DEV-011` a `AUTH-DEV-013`; `INT-EXT-008`; `INT-EXT-019`; `TREQ-AUTH-016` | P0 antes de automatizar offboarding                  |
| `H-CAP-SCOPE-002-014` | no está definido el tratamiento de reingreso tras un vínculo terminado                         | restauración accidental de autoridad anterior    | `CAP-TAL-006`; `PROC-CAT-012`; `AUTH-DB-019`; `TREQ-AUTH-016`                                                               | antes de implementar continuidad definitiva          |
| `H-CAP-SCOPE-002-015` | las autoridades actuales para cambiar horarios y corregir marcaciones siguen sin confirmación  | decisiones sin aprobador claro                   | `OPE-08`; `OPE-09`; `OPS-AUD-015`; `PROC-CAT-007` a `PROC-CAT-014`                                                          | antes de aprobar los procesos TO-BE correspondientes |

Ningún hallazgo queda como pendiente narrativo sin tarea, responsable documental y puerta de resolución.

---

#### 30. Decisiones canónicas resultantes

1. Una persona tendrá identidad empresarial estable aunque cambie de candidatura o vínculo.
2. Candidato, postulación, vínculo, trabajador, usuario, rol, asignación, turno y permiso serán conceptos distintos.
3. TALENTO gestionará el proceso previo a la vinculación y permanecerá no operativo hasta aprobar `CAP-TAL-001` a `CAP-TAL-006`.
4. VISO será la superficie administrativa propietaria del vínculo laboral, asignaciones, programación y decisiones laborales.
5. ANIMA será la experiencia personal del trabajador y la propietaria de captura de asistencia.
6. SHELL administrará identidad, contratos y contexto compartidos, pero no será propietario empresarial del proceso laboral.
7. Supabase gobernado desde `vento-shell` será la persistencia canónica; la estructura física se resolverá en E3.
8. La invitación laboral no confiará en rol, sede o alcance enviados por el cliente.
9. El período de prueba será un estado del vínculo laboral.
10. VISO será la única fuente administrativa de turnos; ANIMA no mantendrá lógica competidora.
11. Todo turno publicado tendrá versión o revisión auditable.
12. Toda modificación publicada notificará al trabajador y conservará la versión anterior.
13. La asistencia se vinculará con el turno y revisión efectivos.
14. Las marcaciones originales serán inmutables; las correcciones conservarán antes, después, motivo y aprobador.
15. Ausencias, permisos, reemplazos y otras novedades usarán casos con estados y evidencia.
16. La capacitación podrá condicionar capacidades sensibles únicamente mediante política explícita.
17. Desempeño y desarrollo quedan diferidos con manejo manual controlado hasta aprobar propósito y privacidad.
18. Los documentos laborales residirán en almacenamiento privado con propietario, sensibilidad y retención.
19. Pagos y beneficios laborales se clasifican `INTEGRATE_EXTERNAL`.
20. NUMERA no se declara sistema de nómina en esta tarea.
21. El retiro utilizará un caso coordinado de cierre laboral, técnico, documental, de activos y financiero.
22. El retiro no borrará historia ni documentos sujetos a conservación.
23. Un reingreso creará un vínculo nuevo y no reactivará permisos anteriores automáticamente.
24. Las cuatro preguntas pendientes reutilizadas tienen puerta máxima y tratamiento provisional.
25. Se generan `TREQ-INTEGRATION-007` y `TREQ-AUTH-016`.

---

#### 31. Requisitos de prueba derivados

##### 31.1. `TREQ-INTEGRATION-007`

| Campo                  | Definición                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ID                     | `TREQ-INTEGRATION-007`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| Dominio                | `INTEGRATION`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| Regla protegida        | La programación y asistencia deberán compartir un contrato único entre VISO, ANIMA, SHELL y Supabase. VISO será la fuente de turnos; cada turno publicado tendrá revisión estable y todo cambio posterior conservará la versión anterior, motivo, actor y notificación. ANIMA presentará la revisión vigente y cada entrada, salida o descanso se vinculará de forma determinista con trabajador, vínculo, turno y revisión. Las correcciones no sobrescribirán eventos originales: conservarán solicitud, evidencia, antes, después, aprobador y efectos derivados. Reemplazos, ausencias, turnos cruzados de medianoche, eventos offline y reintentos deberán converger sin duplicar jornadas, contextos ni tiempo trabajado. |
| Origen                 | `CAP-SCOPE-002`; `CAP-02.06` a `CAP-02.08`; `CODE-AUD-019`; `BKL-FUNC-002`; `BKL-ANIMA-003`; `INT-WORK-001` a `INT-WORK-005`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| Riesgo / prioridad     | horarios divergentes, trabajador informado con una versión distinta, marcaciones huérfanas, correcciones destructivas, horas o pagos erróneos y contexto operativo indebido / crítica                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| Tipo / modalidad       | contractual + integración + base de datos + concurrencia + idempotencia + autorización + E2E + regresión / automatizada con validación operativa                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| Tarea responsable      | `PROC-CAT-009` a `PROC-CAT-018`; `VISO-AUTH-010` a `VISO-AUTH-012`; `VISO-UX-003`; `ANIMA-AUTH-001` a `ANIMA-AUTH-018`; `ANIMA-UX-004` a `ANIMA-UX-012`; `INT-WORK-001` a `INT-WORK-005`; `AUTH-QA-006`; `AUTH-QA-009`; `AUTH-QA-025`; `AUTH-QA-026`; `AUTH-QA-029`                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| Paquete                | diseño E2 del proceso laboral; paquetes E5 VISO/ANIMA; contrato compartido e integración; certificación del BLOQUE U                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| Repositorio / ambiente | `vento-viso`, `vento-anima`, `vento-shell` / Supabase local, CI, staging, Android e iOS físicos y usuarios administrativos y trabajadores reales                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| Estado                 | `IDENTIFICADO`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Artefacto              | Pendiente                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| Último resultado       | Pendiente                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| Evidencia              | decisiones de `CAP-SCOPE-002`; implementación actual de turnos y asistencia; hallazgo de corrección incompleta; requisitos offline e idempotentes existentes                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| Relación               | `TREQ-ANIMA-003`; `TREQ-ANIMA-004`; `TREQ-AUTH-008`; `TREQ-AUTH-009`; `TREQ-AUTH-014`; `TREQ-AUTH-015`; `TREQ-INTEGRATION-003`; `TREQ-UX-005`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |

##### 31.2. `TREQ-AUTH-016`

| Campo                  | Definición                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| ID                     | `TREQ-AUTH-016`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| Dominio                | `AUTH`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Regla protegida        | El retiro, cancelación antes de inicio, suspensión con bloqueo o finalización de un vínculo deberá revocar de forma coordinada y comprobable las invitaciones, asignaciones activas, roles, excepciones, contextos, sesiones, tokens derivados, dispositivos y credenciales externas personales aplicables. Ninguna cola offline ni consumidor con caché podrá ejecutar después con autoridad anterior. La revocación no borrará persona, vínculo, turnos, asistencia, documentos sujetos a retención ni auditoría. Un reingreso deberá crear un vínculo y aprovisionamiento nuevos, sin restaurar automáticamente permisos, dispositivos o excepciones del vínculo terminado. |
| Origen                 | `CAP-SCOPE-002`; `CAP-02.13`; `CAP-TAL-006`; `CODE-AUD-019`; `BKL-FUNC-002`; `H-CAP-SCOPE-002-013`; `H-CAP-SCOPE-002-014`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| Riesgo / prioridad     | acceso residual después del retiro, acciones offline posteriores, exposición de documentos, uso de dispositivo o credencial antigua y reingreso con privilegios heredados / crítica                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| Tipo / modalidad       | seguridad + autorización + integración + revocación + caché + dispositivo + E2E + regresión / automatizada con checklist manual controlado                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| Tarea responsable      | `CAP-TAL-006`; `AUTH-DB-019`; `AUTH-DB-035`; `AUTH-DEV-011` a `AUTH-DEV-013`; `VISO-AUTH-007` a `VISO-AUTH-009`; `VISO-AUTH-018`; `VISO-AUTH-019`; `ANIMA-AUTH-009`; `ANIMA-AUTH-015`; `ANIMA-AUTH-019`; `INT-EXT-008`; `INT-EXT-019`; `AUTH-QA-025`; `AUTH-QA-029`; `AUTH-QA-030`                                                                                                                                                                                                                                                                                                                                                                                             |
| Paquete                | diseño E2 de offboarding; fundación de identidad y contexto; paquetes E5 VISO/ANIMA/SHELL; certificación del BLOQUE U                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| Repositorio / ambiente | `vento-viso`, `vento-anima`, `vento-shell` y consumidores / Supabase local, CI, staging, dispositivos, colas offline e integraciones externas controladas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| Estado                 | `IDENTIFICADO`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Artefacto              | Pendiente                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| Último resultado       | Pendiente                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| Evidencia              | cierre transversal incompleto identificado por auditorías; contratos de invalidación y dispositivos; decisiones de `CAP-SCOPE-002`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| Relación               | `TREQ-AUTH-003`; `TREQ-AUTH-005`; `TREQ-AUTH-007`; `TREQ-AUTH-014`; `TREQ-AUTH-015`; `TREQ-TALENTO-001`; `TREQ-SUPABASE-004`; `TREQ-INTEGRATION-003`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |

Las dos filas deberán incorporarse al Registro Canónico, conservando las catorce columnas reglamentarias y el orden por identificador de dominio.

---

#### 32. Dependencias habilitadas y restricciones

La aprobación de esta tarea habilita:

- `CAP-SCOPE-003`;
- diseño posterior `CAP-TAL-001` a `CAP-TAL-006`;
- diseño de procesos laborales en `PROC-CAT-*`;
- delimitación de Personal y Programación en VISO;
- consolidación de experiencia personal y asistencia en ANIMA;
- definición física posterior en E3;
- planificación de paquetes E5 y pruebas laborales.

No habilita todavía:

- desplegar TALENTO;
- crear candidatos o vacantes reales;
- migrar identidades o empleados;
- cambiar propiedad de turnos en producción;
- corregir marcaciones;
- modificar documentos laborales;
- calcular nómina;
- revocar accesos;
- terminar vínculos;
- borrar usuarios, trabajadores o expedientes;
- activar requisitos de capacitación como bloqueo productivo.

---

#### 33. Criterios de aceptación

`CAP-SCOPE-002` podrá aprobarse cuando se confirme que:

- las trece capacidades `CAP-02.*` tienen tratamiento explícito;
- persona, candidato, postulación, vínculo, trabajador, usuario, rol, asignación, turno y permiso están separados;
- TALENTO, VISO, ANIMA, SHELL, Supabase, NUMERA y la fuente externa de pagos tienen fronteras claras;
- TALENTO permanece futuro y no operativo;
- VISO queda como propietario administrativo de turnos;
- ANIMA queda como propietaria de captura de asistencia;
- los turnos publicados conservan revisión e historial;
- las correcciones de asistencia no sobrescriben eventos originales;
- ausencias, reemplazos y novedades se modelan como casos;
- capacitación y desempeño tienen tratamientos diferenciados;
- documentos laborales tienen privacidad y retención;
- pagos laborales se clasifican `INTEGRATE_EXTERNAL`;
- retiro y reingreso tienen contratos seguros;
- las preguntas pendientes existentes tienen puerta máxima y tratamiento provisional;
- cada brecha está vinculada con tareas existentes y momento de resolución;
- se generan `TREQ-INTEGRATION-007` y `TREQ-AUTH-016`;
- no se autoriza implementación, migración ni acción laboral real.

---

#### 34. Resultado y continuidad

Con la aprobación de `CAP-SCOPE-002` quedará establecida la decisión de cobertura para el ciclo completo de personas y trabajo, desde la planeación y candidatura hasta el retiro y cierre de accesos.

La continuidad documental será exclusivamente:

```text
CAP-SCOPE-003
— Evaluar seguridad y salud en el trabajo
```

`CAP-SCOPE-019` ratificará posteriormente la clasificación y propietario del dominio, sin reabrir estas decisiones salvo evidencia nueva o contradicción explícita.


### ✅ CAP-SCOPE-003 — Evaluar seguridad y salud en el trabajo

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Dependencia cumplida:** `CAP-SCOPE-002` aprobada  
**Tarea anterior:** `CAP-SCOPE-002`  
**Siguiente tarea reservada:** `CAP-SCOPE-004`  
**Familia evaluada:** `CAP-03 — Proteger salud, seguridad y cumplimiento`  
**Naturaleza:** decisión de cobertura empresarial y definición conceptual objetivo  
**Implementación técnica:** no autorizada  
**Migraciones o cambios en Supabase:** no autorizados  
**Cambios médicos, laborales, legales o ante autoridades:** no autorizados  
**Requisitos de prueba generados:** `TREQ-AUTH-017`, `TREQ-INTEGRATION-008`

---

#### 1. Propósito

Definir el tratamiento objetivo de las capacidades mediante las cuales Vento Group deberá:

- identificar peligros y valorar riesgos laborales;
- establecer, ejecutar y revisar controles preventivos;
- entregar y controlar elementos de protección personal;
- permitir el reporte oportuno de incidentes, accidentes, condiciones y actos inseguros;
- investigar eventos y conservar evidencia no destructiva;
- preparar y ejecutar planes de emergencia y evacuación;
- controlar higiene, saneamiento e inocuidad en la dimensión que afecta a trabajadores y operación;
- programar y ejecutar inspecciones obligatorias;
- controlar requisitos legales, certificados, conceptos y renovaciones;
- conservar evidencia de cumplimiento;
- crear, asignar, verificar y cerrar acciones correctivas.

La tarea convierte la línea base AS-IS, las preguntas pendientes y la implementación técnica actual en una decisión de cobertura empresarial. No sustituye asesoría profesional en seguridad y salud en el trabajo, medicina laboral, higiene industrial, inocuidad, derecho laboral, gestión de emergencias ni cumplimiento regulatorio.

---

#### 2. Pregunta de decisión

`CAP-SCOPE-003` responde:

```text
¿QUÉ PARTE DEL SISTEMA DE SEGURIDAD Y SALUD EN EL TRABAJO
DEBE SER GOBERNADA, REGISTRADA, PRESENTADA O INTEGRADA POR VENTO OS,
QUÉ RESPONSABILIDADES PERMANECEN EN PERSONAS Y PROVEEDORES HABILITADOS,
QUÉ APLICACIÓN ES PROPIETARIA DE CADA HECHO,
Y CÓMO SE PROTEGEN LA CONFIDENCIALIDAD,
LA EVIDENCIA, LA TRAZABILIDAD Y LA RESPUESTA OPERATIVA?
```

La tarea prohíbe simplificaciones como:

```text
NOVEDAD DE ASISTENCIA = INCIDENTE SST
```

```text
CHECKLIST COMPLETADO = CONDICIÓN SEGURA
```

```text
DOCUMENTO CARGADO = CUMPLIMIENTO LEGAL VERIFICADO
```

```text
APLICACIÓN = RESPONSABLE SST
```

```text
DATO MÉDICO = DATO OPERATIVO GENERAL
```

---

#### 3. Fuentes consolidadas

La evaluación utiliza como línea base:

- `OPS-AUD-001` — empresas, sedes, áreas, zonas, estaciones y condiciones físicas conocidas;
- `OPS-AUD-002` — familias de actores y responsabilidades AS-IS;
- `OPS-AUD-003` a `OPS-AUD-015` — observación, flujos, excepciones, controles, contingencia y validación;
- `CAP-MAP-001` a `CAP-MAP-015`;
- `CODE-AUD-001` a `CODE-AUD-020`;
- `MAP-IMPL-CAP-001` y `BKL-REPO-001`;
- `CAP-SCOPE-001` y `CAP-SCOPE-002`;
- decisiones de autorización, contexto, dispositivos, evidencia y auditoría;
- tareas futuras de VISO, ANIMA, NEXO, FOGO, SHELL, integración y diseño de procesos;
- `QA-REG-001` y el Registro Canónico de Requisitos de Prueba;
- `REGISTRO_VIVO_DE_PREGUNTAS_PENDIENTES`, especialmente `DAT-16` y `DAT-17`;
- evidencia técnica de que ANIMA utiliza actualmente la palabra `incident` para incidencias de asistencia, no para expedientes SST;
- decisión previa de que VITAL es un producto personal separado y no constituye cobertura de salud laboral.

Las respuestas ya registradas no se vuelven a solicitar.

---

#### 4. Alcance evaluado

La tarea evalúa directamente:

- `CAP-03.01` — Identificar peligros y riesgos laborales;
- `CAP-03.02` — Prevenir accidentes y enfermedades;
- `CAP-03.03` — Entregar y controlar elementos de protección;
- `CAP-03.04` — Reportar e investigar incidentes;
- `CAP-03.05` — Gestionar emergencias y evacuación;
- `CAP-03.06` — Controlar higiene e inocuidad;
- `CAP-03.07` — Realizar inspecciones obligatorias;
- `CAP-03.08` — Gestionar requisitos legales y certificados;
- `CAP-03.09` — Conservar evidencia de cumplimiento;
- `CAP-03.10` — Gestionar acciones correctivas.

También define fronteras que utilizarán posteriormente:

- gestión de personas y capacitación;
- activos, EPP, equipos, mantenimiento y calibración;
- producción, calidad e inocuidad;
- instalaciones, limpieza e inspecciones;
- privacidad, documentos, conservación y auditoría;
- continuidad operativa, emergencias y recuperación;
- analítica y métricas de cumplimiento;
- diseño de procesos TO-BE y paquetes E5.

---

#### 5. Fuera de alcance

Esta tarea no:

- diagnostica enfermedades;
- define aptitud médica o restricciones laborales individuales;
- sustituye exámenes ocupacionales ni conceptos médicos;
- determina obligaciones legales específicas sin validación profesional;
- registra accidentes ante autoridades o aseguradoras;
- ejecuta investigaciones reales;
- cambia responsables SST existentes;
- crea comités, brigadas o roles legales;
- compra, entrega o descuenta inventario de EPP;
- modifica planes de emergencia reales;
- certifica instalaciones, equipos, alimentos o procesos;
- ejecuta inspecciones productivas;
- crea tablas, buckets, políticas RLS, pantallas o integraciones;
- autoriza el tratamiento amplio de información médica;
- convierte VITAL en aplicación laboral;
- fusiona inocuidad alimentaria, calidad de producto, mantenimiento y SST en un único expediente indiferenciado.

---

#### 6. Principios canónicos

##### 6.1. La responsabilidad sigue siendo humana y empresarial

Vento OS podrá:

- registrar;
- recordar;
- presentar;
- relacionar;
- escalar;
- conservar evidencia;
- impedir cierres incompletos;
- emitir eventos;
- facilitar auditoría.

No podrá asumir por sí solo:

- responsabilidad legal;
- criterio médico;
- criterio técnico profesional;
- dirección de una emergencia;
- investigación oficial;
- certificación de cumplimiento.

Siempre deberá existir un responsable humano o proveedor expresamente identificado.

##### 6.2. Prevención antes que reacción

La cobertura no se limitará a registrar accidentes. Deberá permitir gobernar:

```text
PELIGRO
→ RIESGO
→ CONTROL
→ VERIFICACIÓN
→ REVISIÓN
```

Los incidentes serán una fuente de aprendizaje y corrección, no el único origen de acciones.

##### 6.3. Ejecución física y registro digital son distintos

```text
INSPECCIÓN FÍSICA
≠ FORMULARIO DIGITAL
```

```text
ENTREGA DE EPP
≠ FILA EN UNA TABLA
```

```text
SIMULACRO
≠ EVENTO DE CALENDARIO
```

La plataforma deberá conservar quién ejecutó la actividad, qué observó, qué evidencia aportó y qué resultado produjo.

##### 6.4. La semántica de incidentes será explícita

Se distinguirán como mínimo:

- incidencia de asistencia;
- novedad laboral;
- condición insegura;
- acto inseguro;
- casi accidente;
- incidente SST;
- accidente de trabajo reportado;
- enfermedad o evento de salud sujeto a confidencialidad;
- emergencia;
- hallazgo de inspección;
- no conformidad de higiene, inocuidad o calidad;
- daño de activo;
- incidente de tecnología o seguridad de la información.

No se reutilizará una categoría genérica `incident` sin dominio, tipo y contrato.

##### 6.5. Los datos médicos tendrán tratamiento reforzado

Los datos clínicos, diagnósticos, restricciones médicas, resultados de exámenes y conceptos de salud:

- no serán visibles por defecto a responsables operativos;
- no se copiarán a aplicaciones operativas;
- no se usarán como texto libre en novedades generales;
- deberán minimizarse;
- deberán mantenerse separados de la historia operativa ordinaria;
- solo expondrán la consecuencia laboral estrictamente necesaria cuando esté autorizada.

Ejemplo:

```text
DATO MÉDICO RESTRINGIDO
→ no se distribuye

RESTRICCIÓN LABORAL AUTORIZADA Y VIGENTE
→ puede proyectarse de forma mínima al proceso que la necesita
```

##### 6.6. El reporte inicial será inmutable

El contenido original de un reporte no se sobrescribirá. Las correcciones o ampliaciones serán eventos posteriores con:

- actor;
- fecha;
- motivo;
- antes;
- después;
- evidencia;
- autorización cuando corresponda.

##### 6.7. La evidencia no equivale a la decisión

Una fotografía, firma, certificado o archivo demuestra únicamente el hecho que representa. No prueba por sí sola:

- que el riesgo fue eliminado;
- que el certificado es auténtico;
- que la persona estaba capacitada;
- que la acción fue eficaz;
- que existe cumplimiento legal completo.

##### 6.8. El cierre exigirá verificación

Ninguna acción correctiva se cerrará únicamente porque cambió a `completada`. Deberá existir:

```text
ACCIÓN EJECUTADA
+
EVIDENCIA
+
VERIFICACIÓN DE EFICACIA
+
ACTOR AUTORIZADO
=
CIERRE
```

##### 6.9. La información de emergencia deberá ser disponible y mínima

La información crítica para actuar durante una emergencia deberá poder consultarse con rapidez, pero sin exponer expedientes médicos o administrativos completos.

##### 6.10. VITAL queda fuera de Vento OS laboral

VITAL no se utilizará como:

- historia clínica ocupacional;
- fuente de aptitud laboral;
- sistema SST;
- registro de accidentes;
- repositorio de restricciones;
- prueba de bienestar laboral.

Cualquier relación futura exigiría una decisión separada de alcance, consentimiento, privacidad y arquitectura.

---

#### 7. Modelo conceptual objetivo

##### 7.1. Conceptos separados

| Concepto            | Definición objetivo                                                                        | No equivale a                        |
| ------------------- | ------------------------------------------------------------------------------------------ | ------------------------------------ |
| peligro             | fuente, situación o acto con potencial de daño                                             | riesgo valorado                      |
| riesgo laboral      | combinación evaluada de exposición, probabilidad y consecuencia según metodología aprobada | incidente ocurrido                   |
| control             | medida preventiva, protectora o de respuesta                                               | evidencia de que funciona            |
| condición insegura  | condición observada que puede generar daño                                                 | accidente confirmado                 |
| acto inseguro       | conducta observada con potencial de daño                                                   | culpabilidad individual automática   |
| casi accidente      | evento sin lesión o daño relevante que pudo producirlo                                     | novedad de asistencia                |
| incidente SST       | evento relacionado con seguridad o salud que requiere clasificación y tratamiento          | cualquier error operativo            |
| accidente reportado | evento que ha alcanzado la clasificación y flujo aplicable                                 | diagnóstico médico definitivo        |
| emergencia          | situación que requiere respuesta inmediata coordinada                                      | incidente administrativo             |
| inspección          | actividad planificada o extraordinaria de verificación                                     | mantenimiento ejecutado              |
| hallazgo            | resultado de una inspección o revisión                                                     | acción correctiva                    |
| acción correctiva   | intervención para eliminar o reducir una causa o condición                                 | comentario o recordatorio            |
| requisito           | obligación o compromiso aplicable que debe interpretarse y controlarse                     | archivo cargado                      |
| certificado         | documento emitido por una fuente identificada, con vigencia y alcance                      | cumplimiento global                  |
| EPP                 | elemento asignable y controlable para protección                                           | capacitación o control de ingeniería |
| evidencia           | prueba vinculada a un hecho, actor, fecha y contexto                                       | verdad absoluta sin validación       |

##### 7.2. Relación general

```text
PELIGRO
→ EVALUACIÓN DE RIESGO
→ CONTROLES
→ ACTIVIDADES DE VERIFICACIÓN
→ HALLAZGOS
→ ACCIONES
→ VERIFICACIÓN DE EFICACIA
→ REVISIÓN DEL RIESGO
```

```text
REPORTE
→ CLASIFICACIÓN
→ TRIAGE
→ RESPUESTA INMEDIATA
→ INVESTIGACIÓN
→ CAUSAS Y FACTORES
→ ACCIONES
→ VERIFICACIÓN
→ CIERRE
```

---

#### 8. Estados canónicos mínimos

Los nombres definitivos y la estructura física se aprobarán en E2 y E3. Esta tarea fija la semántica mínima.

##### 8.1. Peligro y riesgo

```text
IDENTIFICADO
→ PENDIENTE_DE_EVALUACIÓN
→ EVALUADO
→ CON_CONTROLES_DEFINIDOS
→ EN_MONITOREO
→ REEVALUACIÓN_REQUERIDA
→ CERRADO_O_RETIRADO
```

Un peligro no se eliminará del historial al cerrar o modificar un área.

##### 8.2. Control

```text
PROPUESTO
→ APROBADO
→ EN_IMPLEMENTACIÓN
→ IMPLEMENTADO
→ PENDIENTE_DE_VERIFICACIÓN
→ EFICAZ
→ NO_EFICAZ
→ REEMPLAZADO_O_RETIRADO
```

##### 8.3. Reporte e investigación

```text
REPORTADO
→ RECIBIDO
→ TRIAGE
→ RESPUESTA_INMEDIATA_REGISTRADA
→ CLASIFICADO
→ EN_INVESTIGACIÓN
→ ACCIONES_DEFINIDAS
→ PENDIENTE_DE_VERIFICACIÓN
→ CERRADO
```

Estados alternos controlados:

```text
DUPLICADO
NO_CORRESPONDE_A_SST
TRANSFERIDO_A_OTRO_DOMINIO
ANULADO_CON_JUSTIFICACIÓN
```

No se permitirá eliminar un reporte porque cambió de dominio.

##### 8.4. Inspección

```text
PLANIFICADA
→ ASIGNADA
→ EN_EJECUCIÓN
→ EJECUTADA
→ HALLAZGOS_EN_REVISIÓN
→ ACCIONES_GENERADAS
→ VERIFICADA
→ CERRADA
```

##### 8.5. Acción correctiva

```text
ABIERTA
→ ASIGNADA
→ ACEPTADA
→ EN_EJECUCIÓN
→ REPORTADA_COMO_COMPLETA
→ EN_VERIFICACIÓN
→ EFICAZ
→ CERRADA
```

Estados alternos:

```text
RECHAZADA_CON_MOTIVO
VENCIDA
BLOQUEADA
REABIERTA
SUSTITUIDA
```

##### 8.6. Requisito o certificado

```text
IDENTIFICADO
→ PENDIENTE_DE_INTERPRETACIÓN
→ APLICABLE_O_NO_APLICABLE
→ RESPONSABLE_ASIGNADO
→ EVIDENCIA_PENDIENTE
→ VIGENTE
→ PRÓXIMO_A_VENCER
→ VENCIDO
→ RENOVADO_O_CERRADO
```

##### 8.7. Plan y simulacro de emergencia

```text
BORRADOR
→ EN_REVISIÓN
→ APROBADO
→ COMUNICADO
→ SIMULACRO_PLANIFICADO
→ SIMULACRO_EJECUTADO
→ EVALUADO
→ ACTUALIZACIÓN_REQUERIDA
```

---

#### 9. Propiedad funcional y tecnológica

| Componente                                                 | Propiedad objetivo                                       | Responsabilidades                                                                                               | Límites                                                                              |
| ---------------------------------------------------------- | -------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| Gerencia General                                           | responsabilidad empresarial del sistema                  | aprobar alcance, recursos, prioridades, responsables y excepciones críticas                                     | no sustituye la competencia técnica del responsable SST                              |
| Responsable SST interno o proveedor habilitado             | propiedad técnica y metodológica del dominio             | matriz de riesgos, investigación, requisitos, inspecciones, planes, asesoría y verificación                     | identidad concreta y alcance contractual deberán confirmarse antes de implementación |
| Responsables de sede y proceso                             | ejecución y respuesta territorial                        | reportar, contener, ejecutar controles, atender inspecciones y acciones                                         | no acceden automáticamente a diagnósticos ni a todos los casos                       |
| VISO                                                       | administración de SST                                    | registro maestro, riesgos, inspecciones, casos, acciones, requisitos, certificados, tableros y auditoría        | no emite criterio médico ni reemplaza proveedores externos                           |
| ANIMA                                                      | experiencia personal del trabajador                      | reporte guiado, consulta de reportes propios, alertas, capacitación, confirmaciones e información de emergencia | no investiga, no clasifica legalmente y no expone casos ajenos                       |
| NEXO                                                       | hechos físicos de EPP, activos y elementos controlados   | stock, entrega física, devolución, condición, custodia e inspección del elemento cuando aplique                 | no es propietario del expediente SST ni del criterio de necesidad del EPP            |
| FOGO                                                       | hechos de producción, higiene, inocuidad y calidad       | controles operativos, lotes, condiciones y eventos de producción                                                | no administra expedientes médicos ni el sistema SST completo                         |
| PULSO y demás aplicaciones operativas                      | origen contextual de reportes                            | permiten iniciar un reporte o emitir un evento relacionado con su operación                                     | no conservan un registro SST competidor                                              |
| SHELL                                                      | identidad, autorización, contratos y eventos compartidos | actor real, alcance territorial, permisos, revocación y distribución de contratos                               | no es propietario empresarial del dominio                                            |
| Supabase gobernado desde `vento-shell`                     | persistencia canónica                                    | datos, evidencia privada, historial, auditoría, eventos e integridad                                            | estructura física se resuelve en E3; no se modifica aquí                             |
| ARL, IPS, médico laboral, asesor, autoridad o certificador | fuente profesional o externa                             | conceptos, formatos, validaciones, reportes y certificaciones según aplique                                     | no se asumirá integración automática ni acceso general a Vento OS                    |
| Trabajador                                                 | participante y titular de derechos sobre su información  | reportar oportunamente, atender instrucciones, consultar información propia y aportar evidencia autorizada      | no clasifica ni cierra unilateralmente un expediente                                 |

##### 9.1. Propietario funcional candidato

Se propone:

```text
ACCOUNTABLE EMPRESARIAL
→ GERENCIA GENERAL

RESPONSABLE TÉCNICO
→ RESPONSABLE SST INTERNO O PROVEEDOR HABILITADO

APLICACIÓN ADMINISTRATIVA PROPIETARIA
→ VISO

SUPERFICIE PERSONAL
→ ANIMA
```

`CAP-SCOPE-019` deberá ratificar o corregir esta propiedad antes de planificación ejecutiva.

---

#### 10. Línea base de implementación verificable

| Estado actual                            | Subcapacidades                                                                                         | Lectura                                                                                                                                         |
| ---------------------------------------- | ------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CAP-03.03`, `CAP-03.09`                                                                               | existen estructuras reutilizables de inventario, activos, personas, documentos, Storage y auditoría, pero no conforman un sistema SST integrado |
| `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CAP-03.01`, `CAP-03.02`, `CAP-03.04`, `CAP-03.05`, `CAP-03.06`, `CAP-03.07`, `CAP-03.08`, `CAP-03.10` | la evidencia disponible no demuestra un flujo digital canónico de extremo a extremo                                                             |

No existe una implementación verificada en uso que cubra integralmente la familia `CAP-03`.

La implementación actual de incidencias de asistencia en ANIMA no se contabiliza como cobertura de `CAP-03.04`.

---

#### 11. Matriz de decisión de cobertura

| ID          | Capacidad                                    | Tratamiento objetivo | Propietario funcional candidato                                                         | Aplicación propietaria candidata                                  | Fuente de verdad objetivo                                                                     | Tratamiento transitorio                                                     | Destino canónico                                                                                                                               |
| ----------- | -------------------------------------------- | -------------------- | --------------------------------------------------------------------------------------- | ----------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| `CAP-03.01` | Identificar peligros y riesgos laborales     | `BUILD`              | responsable SST con Gerencia General                                                    | VISO                                                              | matriz versionada de peligros, evaluación, controles y vigencia                               | matriz o documentos actuales bajo control manual hasta conciliación         | `PROC-CAT-002`; `PROC-ACTOR-003`; `UX-ADMIN-001`; `VISO-UX-006`; `CAP-SCOPE-013`                                                               |
| `CAP-03.02` | Prevenir accidentes y enfermedades           | `BUILD`              | responsable SST y propietarios de proceso                                               | VISO, con experiencia en ANIMA                                    | plan preventivo, controles, capacitación y verificación                                       | actividades manuales con evidencia mínima y responsables                    | `PROC-CAT-002`; `CAP-SCOPE-002`; `DELIV-PKG-021`; `READY-GATE-009`; `EVID-ARC-001` a `EVID-ARC-009`                                            |
| `CAP-03.03` | Entregar y controlar elementos de protección | `REUSE_OR_REFACTOR`  | responsable SST define; Operaciones administra; trabajador custodia                     | VISO para necesidad/asignación; NEXO para existencia y movimiento | requisito y asignación vinculados con entrega física e historial                              | registro manual coordinado con inventario mientras se diseña la integración | `CAP-SCOPE-007`; `NEXO-DOM-001`; `NEXO-DOM-008` a `NEXO-DOM-011`; `NEXO-DOM-015`; `NEXO-DOM-017`; `TREQ-INTEGRATION-008`                       |
| `CAP-03.04` | Reportar e investigar incidentes             | `BUILD`              | responsable SST y Gerencia según severidad                                              | VISO; reporte personal desde ANIMA                                | expediente SST canónico con reporte original, clasificación, investigación, acciones y cierre | canal manual de emergencia y registro posterior controlado                  | `PROC-CAT-002`; `PROC-CAT-009` a `PROC-CAT-018`; `PROC-ACTOR-003`; `UX-ADMIN-001` a `UX-ADMIN-005`; `TREQ-AUTH-017`; `TREQ-INTEGRATION-008`    |
| `CAP-03.05` | Gestionar emergencias y evacuación           | `CONTROLLED_MANUAL`  | Gerencia, responsable SST y responsables de emergencia                                  | VISO para gobierno y evidencia; ANIMA para información y alertas  | planes, roles, puntos, simulacros, evaluaciones y versiones aprobadas                         | planes y respuesta física manual con copia accesible y controlada           | `PROC-CAT-002`; `UX-STATION-007`; `CAP-SCOPE-013`; `CAP-SCOPE-018`; `EVID-ARC-001` a `EVID-ARC-009`                                            |
| `CAP-03.06` | Controlar higiene e inocuidad                | `REUSE_OR_REFACTOR`  | responsables de producción, sede y calidad con gobierno SST cuando afecte al trabajador | FOGO/NEXO para ejecución; VISO para cumplimiento transversal      | controles operativos, hallazgos, lotes y evidencia enlazados sin duplicación                  | formatos y verificaciones manuales bajo responsables definidos              | `CAP-SCOPE-008`; `CAP-SCOPE-013`; `OPS-TRZ-001`; `PROC-CAT-002`; `TREQ-INTEGRATION-008`                                                        |
| `CAP-03.07` | Realizar inspecciones obligatorias           | `BUILD`              | responsable SST y propietario del objeto inspeccionado                                  | VISO; NEXO para activos y equipos cuando aplique                  | programa de inspección, versión de checklist, ejecución, hallazgos y acciones                 | formatos manuales controlados mientras se identifica `DAT-16`               | `CAP-SCOPE-013`; `NEXO-DOM-017`; `NEXO-DOM-026`; `UX-ADMIN-001` a `UX-ADMIN-005`; `DAT-16`                                                     |
| `CAP-03.08` | Gestionar requisitos legales y certificados  | `INTEGRATE_EXTERNAL` | Gerencia y responsable SST con asesor o emisor autorizado                               | VISO como registro; fuente profesional o externa como autoridad   | requisito interpretado, aplicabilidad, responsable, evidencia, vigencia y fuente              | matriz y documentos manuales hasta aprobar fuente e integración             | `CAP-SCOPE-016`; `INT-EXT-001` a `INT-EXT-019`; `EVID-ARC-001` a `EVID-ARC-010`; `TREQ-AUTH-017`                                               |
| `CAP-03.09` | Conservar evidencia de cumplimiento          | `REUSE_OR_REFACTOR`  | custodio documental y responsable del hecho                                             | VISO/ANIMA/NEXO/FOGO según hecho, con Storage privado compartido  | metadatos canónicos y objeto inmutable con acceso, retención e integridad                     | conservar archivos actuales sin ampliar acceso ni asumir validez            | `CAP-SCOPE-016`; `EVID-ARC-001` a `EVID-ARC-010`; `TREQ-SUPABASE-004`; `TREQ-AUTH-017`                                                         |
| `CAP-03.10` | Gestionar acciones correctivas               | `BUILD`              | propietario del proceso y responsable SST                                               | VISO                                                              | acción correlacionada con origen, responsable, fecha, evidencia y verificación                | seguimiento manual explícito mientras se identifica `DAT-17`                | `PROC-CAT-002`; `PROC-CAT-013`; `PROC-CAT-014`; `PROC-CAT-018`; `PROC-CAT-019`; `VISO-UX-006`; `VISO-UX-007`; `DAT-17`; `TREQ-INTEGRATION-008` |

##### 11.1. Resumen de clasificaciones

| Tratamiento          | Cantidad |
| -------------------- | -------: |
| `BUILD`              |        5 |
| `REUSE_OR_REFACTOR`  |        3 |
| `INTEGRATE_EXTERNAL` |        1 |
| `CONTROLLED_MANUAL`  |        1 |
| **Total**            |   **10** |

No se asigna `BUY`, `DEFERRED`, `OUT_OF_SCOPE` ni `RETIRE` a una capacidad completa. Sí se retiran patrones legacy específicos descritos posteriormente.

---

#### 12. CAP-03.01 — Identificar peligros y riesgos laborales

La capacidad objetivo deberá permitir:

- identificar peligros por sede, área, zona, estación, proceso, cargo o actividad;
- registrar fuente y contexto de identificación;
- aplicar una metodología aprobada sin hardcodear una fórmula arbitraria en la interfaz;
- separar peligro, exposición, consecuencia, controles existentes y riesgo residual;
- vincular población expuesta sin publicar datos médicos;
- asignar propietario del control;
- definir fecha de revisión;
- relacionar incidentes, inspecciones, cambios, activos y procesos;
- conservar versiones históricas;
- registrar quién aprobó cada evaluación.

No deberá suponerse que una matriz copiada de una sede aplica automáticamente a otra.

El cierre, traslado o cambio de un área no borrará su historia de riesgos.

---

#### 13. CAP-03.02 — Prevenir accidentes y enfermedades

La prevención deberá organizarse por controles, no por mensajes genéricos.

Cada medida deberá declarar:

- peligro o riesgo que trata;
- tipo de control;
- propietario;
- población o proceso cubierto;
- fecha objetivo;
- estado;
- evidencia de implementación;
- método de verificación;
- resultado de eficacia;
- vigencia o fecha de revisión.

Podrá incluir:

- eliminación o sustitución;
- controles de ingeniería;
- controles administrativos;
- capacitación;
- señalización;
- mantenimiento;
- inspección;
- EPP;
- restricciones operativas;
- vigilancia o seguimiento profesional autorizado.

No se utilizará la aceptación de un anuncio como prueba automática de capacitación o competencia.

---

#### 14. CAP-03.03 — Entregar y controlar elementos de protección

La capacidad deberá separar:

```text
NECESIDAD DE EPP
→ definida por riesgo, actividad o concepto autorizado

EXISTENCIA FÍSICA
→ administrada mediante inventario o activos

ASIGNACIÓN
→ persona, función, sede y vigencia

ENTREGA
→ hecho físico con actor y evidencia

DEVOLUCIÓN, CAMBIO O BAJA
→ historial de condición y custodia
```

Requisitos mínimos:

- tipo, talla o especificación cuando aplique;
- lote, serial o fecha de vencimiento cuando aplique;
- trabajador y vínculo vigentes;
- motivo de asignación;
- fecha de entrega;
- entregador y receptor;
- condición;
- mantenimiento o inspección;
- reposición;
- devolución;
- pérdida o daño;
- cierre al retiro.

NEXO no determinará por sí solo qué EPP necesita una persona. VISO no inventará existencia física.

La integración detallada continuará en `CAP-SCOPE-007` y `NEXO-DOM-*`.

---

#### 15. CAP-03.04 — Reportar e investigar incidentes

##### 15.1. Canales de inicio

Un reporte podrá originarse desde:

- ANIMA por el trabajador;
- VISO por responsable, supervisor o SST;
- una superficie operativa por evento contextual;
- registro posterior de una llamada, mensaje o atención física;
- integración externa aprobada.

La ausencia de conectividad no impedirá la respuesta humana inmediata.

##### 15.2. Información mínima del reporte

- identificador estable;
- tipo preliminar;
- fecha y hora observada;
- fecha y hora reportada;
- sede, área, zona o ubicación conocida;
- personas involucradas con acceso restringido;
- descripción original;
- acción inmediata ejecutada;
- peligro persistente;
- necesidad de escalamiento urgente;
- evidencia disponible;
- actor que reporta;
- canal;
- correlación con turno o proceso cuando exista.

##### 15.3. Investigación

La investigación deberá conservar:

- clasificación posterior;
- participantes autorizados;
- entrevistas o declaraciones con control de acceso;
- hechos confirmados y no confirmados;
- causas y factores contribuyentes;
- controles que fallaron o faltaron;
- acciones;
- decisiones externas;
- verificación y cierre.

No se usará el sistema para asignar culpabilidad automática.

##### 15.4. Separación de asistencia

Las incidencias de asistencia actuales podrán relacionarse con un caso SST únicamente mediante vínculo explícito.

```text
attendance_incident_id
≠
sst_case_id
```

Ningún contador de llegadas tarde, ausencias o marcaciones abiertas será presentado como indicador de accidentalidad.

---

#### 16. CAP-03.05 — Gestionar emergencias y evacuación

La respuesta seguirá siendo física y humana. Vento OS podrá apoyar:

- inventario y versión de planes;
- sedes y áreas cubiertas;
- escenarios;
- responsables y brigadas aprobadas;
- directorio de emergencia;
- rutas y puntos de encuentro;
- recursos y equipos;
- personas que requieren consideración autorizada, sin exponer diagnósticos;
- comunicación y confirmación de lectura;
- programación de simulacros;
- registro de ejecución;
- evaluación;
- acciones posteriores;
- revisión del plan.

La aplicación no deberá convertirse en dependencia única durante una emergencia.

Deberá existir una versión accesible fuera de línea o física según el diseño aprobado en `CAP-SCOPE-018` y `UX-STATION-007`.

---

#### 17. CAP-03.06 — Controlar higiene e inocuidad

Esta capacidad se delimita así:

```text
SST
→ exposición y protección de trabajadores

INOCUIDAD Y CALIDAD DE PRODUCCIÓN
→ producto, proceso, lote, preparación y liberación

LIMPIEZA Y CONDICIÓN DE INSTALACIÓN
→ infraestructura, frecuencia, ejecución e inspección
```

Los dominios podrán compartir:

- hallazgos;
- acciones;
- evidencia;
- sede, área, zona y estación;
- responsables;
- calendarios;
- eventos.

No compartirán necesariamente:

- propietario;
- clasificación;
- permisos;
- datos médicos;
- método de evaluación;
- criterio de cierre.

`CAP-SCOPE-008` detallará producción, calidad e inocuidad. `CAP-SCOPE-013` detallará instalaciones, limpieza, inspecciones y calibración.

---

#### 18. CAP-03.07 — Realizar inspecciones obligatorias

Toda inspección deberá estar definida mediante una versión de plantilla con:

- propósito;
- fundamento o política;
- objeto inspeccionado;
- frecuencia;
- alcance territorial;
- competencia requerida;
- preguntas o puntos de control;
- tipo de respuesta;
- evidencia obligatoria;
- criterio de hallazgo;
- severidad;
- escalamiento;
- regla de cierre.

La ejecución deberá registrar:

- plantilla y versión;
- inspector;
- fecha y hora;
- sede, área, zona, estación, equipo o activo;
- respuestas;
- omisiones justificadas;
- evidencias;
- hallazgos;
- acciones generadas;
- revisión o aprobación cuando corresponda.

No se permitirá editar retrospectivamente una plantilla y aparentar que inspecciones anteriores usaron la versión nueva.

---

#### 19. CAP-03.08 — Gestionar requisitos legales y certificados

Vento OS funcionará como registro de control, no como asesor jurídico automático.

Cada requisito deberá declarar:

- fuente;
- emisor;
- texto o referencia controlada;
- fecha de consulta;
- versión;
- alcance;
- sedes, actividades o personas afectadas;
- estado de aplicabilidad;
- responsable de interpretación;
- obligación derivada;
- evidencia;
- vigencia;
- fecha de revisión;
- dependencia externa.

Cada certificado deberá distinguir:

- emisor;
- titular;
- objeto certificado;
- alcance;
- número o referencia;
- fecha de emisión;
- vencimiento;
- estado de validación;
- archivo;
- renovación;
- restricciones.

Un certificado vencido no desaparecerá ni será reemplazado destructivamente.

---

#### 20. CAP-03.09 — Conservar evidencia de cumplimiento

La evidencia deberá cumplir:

- propietario del hecho;
- clasificación de sensibilidad;
- relación con requisito, inspección, incidente, acción, capacitación, EPP o simulacro;
- actor creador;
- fecha del hecho y fecha de carga;
- origen;
- integridad verificable;
- versión;
- retención;
- restricciones de acceso;
- estado de validación;
- motivo de corrección o sustitución;
- historial de acceso cuando corresponda.

No se aceptará como patrón objetivo:

- URL pública permanente;
- nombre de archivo como único identificador;
- bucket compartido sin clasificación;
- evidencia sobrescrita;
- acceso administrativo global por conveniencia;
- copia del mismo archivo en múltiples aplicaciones sin propietario.

---

#### 21. CAP-03.10 — Gestionar acciones correctivas

Una acción podrá originarse en:

- riesgo;
- incidente;
- inspección;
- simulacro;
- auditoría;
- requisito vencido;
- hallazgo de higiene o inocuidad;
- daño o mantenimiento;
- queja;
- análisis de tendencia;
- decisión administrativa.

Cada acción deberá conservar:

- origen y correlación;
- descripción verificable;
- propietario;
- ejecutor;
- prioridad;
- fecha objetivo;
- recursos o dependencias;
- estado;
- evidencia;
- verificador independiente cuando aplique;
- resultado de eficacia;
- motivo de reapertura;
- cierre.

No se crearán listas de tareas aisladas del hallazgo que las originó.

---

#### 22. Fronteras con otros dominios

##### 22.1. Personas y trabajo

`CAP-SCOPE-002` conserva:

- vínculo laboral;
- asignaciones;
- turnos;
- asistencia;
- novedades laborales;
- capacitación general;
- documentos laborales;
- retiro.

`CAP-SCOPE-003` conserva:

- riesgo y control SST;
- incidente SST;
- investigación;
- acción correctiva;
- EPP desde la necesidad preventiva;
- emergencia;
- evidencia SST;
- requisito y certificado SST.

##### 22.2. Activos y mantenimiento

NEXO conserva:

- identidad física;
- existencia;
- custodia;
- condición;
- mantenimiento;
- inspección técnica del activo;
- repuestos;
- baja.

VISO conserva:

- relación del activo o EPP con un riesgo, requisito, persona o acción SST.

##### 22.3. Producción e inocuidad

FOGO conserva:

- lote;
- receta;
- ejecución productiva;
- control de calidad;
- higiene e inocuidad del proceso;
- liberación o rechazo.

VISO recibe o relaciona únicamente hechos con impacto SST o de cumplimiento transversal.

##### 22.4. Instalaciones

`CAP-SCOPE-013` conservará:

- infraestructura;
- mantenimiento locativo;
- limpieza;
- calibración;
- inspección del objeto físico.

`CAP-SCOPE-003` conservará el riesgo, requisito y seguimiento SST derivados.

##### 22.5. Continuidad

`CAP-SCOPE-018` definirá:

- operación durante caída de red o energía;
- respaldo;
- recuperación;
- canales alternos;
- continuidad de información crítica.

La emergencia física no dependerá exclusivamente de Vento OS.

---

#### 23. Información conceptual requerida

Sin definir tablas físicas, el modelo deberá representar al menos:

| Objeto conceptual     | Propósito                                      |
| --------------------- | ---------------------------------------------- |
| `Hazard`              | peligro identificado y contexto                |
| `RiskAssessment`      | evaluación versionada y resultado              |
| `ControlMeasure`      | control preventivo o protector                 |
| `SstCase`             | expediente de reporte e investigación          |
| `SstCasePersonLink`   | relación restringida con personas involucradas |
| `ImmediateResponse`   | contención o atención inicial                  |
| `InvestigationRecord` | hechos, análisis y conclusiones autorizadas    |
| `EmergencyPlan`       | plan versionado por alcance                    |
| `EmergencyDrill`      | ejecución y evaluación de simulacro            |
| `InspectionTemplate`  | contrato versionado de inspección              |
| `InspectionRun`       | ejecución concreta                             |
| `Finding`             | hallazgo tipificado y priorizado               |
| `CorrectiveAction`    | acción y verificación de eficacia              |
| `LegalRequirement`    | requisito y aplicabilidad controlada           |
| `CertificateRecord`   | certificado, vigencia y alcance                |
| `PpeRequirement`      | necesidad de EPP por riesgo o función          |
| `PpeAssignment`       | asignación y entrega enlazada con NEXO         |
| `TrainingRequirement` | preparación requerida                          |
| `EvidenceReference`   | metadatos canónicos de evidencia               |

Ningún nombre anterior autoriza una tabla con ese nombre.

---

#### 24. Eventos e integraciones requeridos

Se definen candidatos funcionales, no contratos técnicos finales:

```text
sst.hazard.identified
sst.risk.assessed
sst.control.approved
sst.control.verified
sst.case.reported
sst.case.classified
sst.case.escalated
sst.investigation.completed
sst.inspection.completed
sst.finding.created
sst.corrective_action.assigned
sst.corrective_action.overdue
sst.corrective_action.verified
sst.emergency_plan.published
sst.drill.completed
sst.requirement.expiring
sst.certificate.expiring
sst.ppe.required
sst.ppe.delivered
sst.training.required
```

Reglas:

1. cada evento tendrá identificador estable e idempotente;
2. conservará actor real y contexto aplicable;
3. no incluirá diagnósticos médicos en eventos generales;
4. distinguirá hecho ocurrido y estado derivado;
5. permitirá correlación sin copiar el expediente completo;
6. un reintento no duplicará caso, inspección, acción, entrega ni notificación;
7. una aplicación consumidora no se convertirá en propietaria del hecho.

El mecanismo técnico se resolverá en BLOQUE X y E3.

---

#### 25. Autorización, privacidad y segregación

##### 25.1. Acceso del trabajador

El trabajador podrá, según contrato aprobado:

- crear reportes;
- ver acuse y estado permitido de sus reportes;
- aportar evidencia o ampliación;
- consultar capacitación y EPP propios;
- consultar información de emergencia;
- recibir acciones personales cuando corresponda.

No verá:

- reportes de otras personas;
- investigación completa por defecto;
- datos médicos ajenos;
- declaraciones restringidas;
- matriz completa de riesgos cuando no sea necesaria;
- documentos externos reservados.

##### 25.2. Acceso territorial

Un responsable de sede no obtendrá acceso global por tener rol gerencial local.

La lectura y escritura deberán evaluar:

- permiso;
- sede;
- área;
- tipo de caso;
- sensibilidad;
- participación;
- estado;
- conflicto de interés;
- vigencia del vínculo.

##### 25.3. Segregación mínima

Cuando sea viable, se separarán:

- quien reporta;
- quien clasifica;
- quien investiga;
- quien ejecuta la acción;
- quien verifica eficacia;
- quien cierra.

En equipos pequeños, la excepción deberá ser explícita, justificada y auditada.

##### 25.4. Acceso de emergencia

Cualquier acceso extraordinario deberá:

- estar previamente definido;
- limitarse a información mínima;
- registrar actor, motivo, momento y datos consultados;
- expirar;
- ser revisado posteriormente.

---

#### 26. Experiencia administrativa y personal

##### 26.1. VISO

Deberá ofrecer, dentro del diseño posterior:

- panorama de riesgos y vencimientos;
- bandeja de reportes y casos;
- programa de inspecciones;
- hallazgos;
- acciones vencidas o críticas;
- requisitos y certificados;
- planes y simulacros;
- EPP y capacitación pendientes;
- filtros territoriales;
- auditoría;
- exportación controlada cuando se apruebe.

##### 26.2. ANIMA

La experiencia del trabajador deberá ser breve y comprensible:

```text
REPORTAR ALGO INSEGURO
→ seleccionar tipo guiado
→ indicar dónde y cuándo
→ describir
→ marcar si sigue existiendo peligro
→ adjuntar evidencia si es seguro hacerlo
→ enviar o guardar en cola controlada
→ recibir acuse
```

La aplicación deberá advertir que ante una emergencia se debe actuar por el canal físico definido y no esperar confirmación digital.

##### 26.3. Dispositivos compartidos

Un reporte desde dispositivo compartido deberá identificar al actor mediante el mecanismo aprobado y evitar dejar visible:

- reportes anteriores;
- nombres sensibles;
- evidencia;
- diagnósticos;
- sesión del trabajador anterior.

---

#### 27. Operación offline, contingencia y emergencia

La captura offline podrá admitirse para reportes no inmediatos si:

- se crea un identificador local estable;
- se conserva hora observada y hora de envío;
- se cifra o protege el contenido local según diseño;
- se reautoriza al sincronizar;
- se evita duplicación;
- se informa el estado pendiente;
- se permite retirar evidencia local después de confirmar sincronización;
- se bloquea el envío si el vínculo ya no autoriza y se ofrece un canal alterno seguro.

No se permitirá que una cola offline:

- retrase una llamada de emergencia;
- publique datos médicos a un usuario distinto;
- sincronice con autoridad antigua;
- duplique un incidente;
- cambie silenciosamente el contexto territorial.

---

#### 28. Evidencia, conservación y exportación

La política física se definirá en `CAP-SCOPE-016` y `EVID-ARC-*`.

Esta tarea fija que:

- el original se preserva;
- una sustitución conserva relación con el original;
- la descarga no convierte el archivo local en fuente canónica;
- los enlaces deberán ser temporales o autorizados;
- el acceso se registrará cuando la sensibilidad lo exija;
- la retención dependerá del tipo de expediente y validación profesional;
- un retiro laboral no elimina evidencia sujeta a conservación;
- las exportaciones deberán minimizar datos y declarar propósito;
- no se enviarán expedientes completos por correo o mensajería como patrón objetivo.

---

#### 29. Patrones legacy destinados a retiro

Se retirarán progresivamente como fuente normativa:

1. usar `incident` sin dominio para asistencia y SST;
2. registrar hechos críticos únicamente por chat;
3. editar el reporte original para corregirlo;
4. cerrar acciones al adjuntar una foto;
5. usar archivos sueltos sin propietario ni vigencia;
6. considerar una plantilla de inspección como evidencia de ejecución;
7. permitir acceso global por nombre de rol;
8. guardar diagnósticos en notas generales;
9. copiar evidencia entre aplicaciones;
10. tratar EPP como consumo de inventario sin asignación a persona;
11. depender de una aplicación durante una emergencia;
12. crear tareas correctivas sin vínculo con su origen;
13. ocultar hallazgos vencidos al cerrar la inspección;
14. reutilizar VITAL como cobertura laboral;
15. asumir cumplimiento por la mera existencia de un certificado.

El retiro técnico ocurrirá únicamente después de aprobar procesos, contratos, migración, pruebas y rollback.

---

#### 30. Preguntas pendientes reutilizadas

No se crean preguntas nuevas.

| ID       | Pregunta pendiente                                                           | Responsable de respuesta   | Tratamiento provisional                                                   | Puerta máxima                                                       |
| -------- | ---------------------------------------------------------------------------- | -------------------------- | ------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `DAT-16` | dónde se guardan actualmente las inspecciones de seguridad y salud           | responsable SST o Gerencia | asumir fuentes manuales dispersas; no migrar ni declarar fuente canónica  | antes de diseñar migración, retención o backfill de inspecciones    |
| `DAT-17` | dónde se anotan actualmente las tareas para corregir hallazgos de inspección | responsable SST o Gerencia | seguimiento manual explícito; ninguna aplicación se declara fuente actual | antes de diseñar migración o activar acciones correctivas digitales |

Si la respuesta es `NO EXISTE`, la brecha se conserva y no se inventará historia retroactiva.

La identidad nominal del responsable SST o proveedor operativo deberá confirmarse durante `PROC-ACTOR-003`, sin modificar la propiedad empresarial candidata aprobada aquí.

---

#### 31. Riesgos principales

| Riesgo                                               | Consecuencia                                       | Control objetivo                              |
| ---------------------------------------------------- | -------------------------------------------------- | --------------------------------------------- |
| confundir incidencia de asistencia con incidente SST | estadísticas, investigación y permisos incorrectos | contratos y expedientes separados             |
| datos médicos en notas generales                     | exposición de datos sensibles                      | minimización, proyección y acceso restringido |
| reporte editable                                     | pérdida de evidencia original                      | inmutabilidad y ampliaciones versionadas      |
| inspección sin versión                               | respuestas comparadas contra criterios distintos   | plantilla versionada                          |
| acción sin verificación                              | cierre aparente sin reducción del riesgo           | verificación de eficacia                      |
| EPP sin custodia                                     | pérdida, reposición y protección no comprobables   | integración VISO–NEXO                         |
| certificado vencido oculto                           | operación sin soporte vigente                      | alertas y estados de vigencia                 |
| dependencia digital en emergencia                    | demora o pérdida de respuesta                      | plan físico y continuidad                     |
| acceso global de gerencia local                      | exposición entre sedes                             | alcance territorial y sensibilidad            |
| sincronización offline duplicada                     | casos o notificaciones repetidas                   | idempotencia y reautorización                 |
| copia de expedientes en varias apps                  | fuentes competidoras                               | propiedad única y referencias                 |
| VITAL usado como salud laboral                       | consentimiento y propósito inválidos               | exclusión canónica                            |
| inocuidad y SST fusionadas                           | propietario y criterios de cierre incorrectos      | fronteras por hecho y dominio                 |
| acción aislada de hallazgo                           | imposibilidad de demostrar causa y eficacia        | correlación obligatoria                       |

---

#### 32. Hallazgos y destinos canónicos

| ID                    | Hallazgo                                                                                        | Riesgo                                                            | Destino canónico                                                                                                         | Momento de resolución                                                |
| --------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------- |
| `H-CAP-SCOPE-003-001` | no existe propietario técnico SST nominal confirmado en la evidencia consolidada                | decisiones, escalamiento y validación sin responsable verificable | `PROC-ACTOR-003`; `CAP-SCOPE-019`                                                                                        | antes de aprobar procesos TO-BE y paquetes de implementación         |
| `H-CAP-SCOPE-003-002` | no existe implementación integral verificada para la familia `CAP-03`                           | falsa sensación de cobertura por piezas aisladas                  | `PROC-CAT-002`; `CAP-COVER-001` a `CAP-COVER-010`; `BKL-FUNC-003`                                                        | E2 y matriz de cobertura antes de planificación ejecutiva            |
| `H-CAP-SCOPE-003-003` | ANIMA usa semántica de incidencias de asistencia que podría confundirse con SST                 | datos, métricas y flujos incorrectos                              | `PROC-CAT-003`; `SHELL-CON-014`; `SHELL-CON-023`; `TREQ-INTEGRATION-008`                                                 | antes de diseñar o implementar reporte SST                           |
| `H-CAP-SCOPE-003-004` | la fuente actual de inspecciones permanece pendiente                                            | migración incompleta o fuente competidora                         | `DAT-16`; `CAP-SCOPE-013`; `EVID-ARC-001` a `EVID-ARC-010`                                                               | antes de diseñar backfill o persistencia física                      |
| `H-CAP-SCOPE-003-005` | la fuente actual de acciones correctivas permanece pendiente                                    | acciones perdidas o duplicadas                                    | `DAT-17`; `PROC-CAT-002`; `PROC-CAT-013`; `PROC-CAT-018`                                                                 | antes de activar seguimiento digital                                 |
| `H-CAP-SCOPE-003-006` | no existe flujo canónico de reporte, investigación y cierre SST                                 | incidentes sin trazabilidad ni aprendizaje                        | `PROC-CAT-009` a `PROC-CAT-018`; `PROC-ACTOR-003`; `UX-ADMIN-001` a `UX-ADMIN-005`; `TREQ-INTEGRATION-008`               | E2 antes de paquete VISO/ANIMA                                       |
| `H-CAP-SCOPE-003-007` | la privacidad de información médica y SST no tiene contrato específico de dominio               | exposición indebida                                               | `CAP-SCOPE-016`; `AUTH-SRV-004` a `AUTH-SRV-018`; `EVID-ARC-001` a `EVID-ARC-010`; `TREQ-AUTH-017`                       | P0 antes de persistir expedientes SST                                |
| `H-CAP-SCOPE-003-008` | EPP no está integrado como necesidad, existencia, asignación, entrega y custodia                | protección no comprobable y stock inconsistente                   | `CAP-SCOPE-007`; `NEXO-DOM-001`; `NEXO-DOM-008` a `NEXO-DOM-011`; `NEXO-DOM-015`; `NEXO-DOM-017`; `TREQ-INTEGRATION-008` | E2/E3 antes de activar control digital de EPP                        |
| `H-CAP-SCOPE-003-009` | planes de emergencia y simulacros no tienen contrato digital canónico                           | versiones desactualizadas y evidencia incompleta                  | `PROC-CAT-002`; `UX-STATION-007`; `CAP-SCOPE-013`; `CAP-SCOPE-018`                                                       | antes de diseñar superficies de emergencia                           |
| `H-CAP-SCOPE-003-010` | inspecciones, mantenimiento, limpieza, calibración y SST pueden duplicarse entre dominios       | formularios y acciones competidoras                               | `CAP-SCOPE-007`; `CAP-SCOPE-008`; `CAP-SCOPE-013`; `NEXO-DOM-026`; `PROC-CAT-005`                                        | antes de diseñar catálogos y pantallas                               |
| `H-CAP-SCOPE-003-011` | requisitos y certificados dependen de interpretación o emisión externa                          | cumplimiento aparente sin fuente autorizada                       | `CAP-SCOPE-016`; `INT-EXT-001` a `INT-EXT-019`; `EVID-ARC-001` a `EVID-ARC-010`                                          | antes de activar alertas o declaraciones de cumplimiento             |
| `H-CAP-SCOPE-003-012` | evidencia SST carece todavía de política física de acceso, integridad y retención               | pérdida, alteración o exposición                                  | `CAP-SCOPE-016`; `EVID-ARC-001` a `EVID-ARC-010`; `TREQ-SUPABASE-004`; `TREQ-AUTH-017`                                   | E2/E4 antes de cargar evidencia real                                 |
| `H-CAP-SCOPE-003-013` | no está definida la operación degradada del reporte SST ni la información crítica de emergencia | pérdida de reportes o dependencia de red                          | `UX-STATION-007`; `CAP-SCOPE-018`; `TREQ-INTEGRATION-008`                                                                | antes de piloto móvil o de estación compartida                       |
| `H-CAP-SCOPE-003-014` | no existe una regla transversal de verificación de eficacia de acciones                         | cierre administrativo sin reducción de riesgo                     | `PROC-CAT-012` a `PROC-CAT-014`; `PROC-CAT-018`; `PROC-CAT-019`; `CAP-COVER-007`; `TREQ-INTEGRATION-008`                 | E2 antes de implementar acciones correctivas                         |
| `H-CAP-SCOPE-003-015` | VITAL podría ser interpretado erróneamente como cobertura de salud laboral                      | propósito, consentimiento y arquitectura incorrectos              | `CAP-SCOPE-003`; `GAP-CTRL-006`; `CAP-COVER-002`                                                                         | cerrado documentalmente ahora; verificar en cobertura y arquitectura |

Ningún hallazgo queda como pendiente narrativo sin tarea, responsable documental y puerta de resolución.

---

#### 33. Decisiones canónicas resultantes

1. Gerencia General será el propietario empresarial candidato del sistema SST.
2. La ejecución técnica corresponderá a un responsable SST interno o proveedor habilitado cuya identidad deberá confirmarse.
3. VISO será la aplicación administrativa propietaria de riesgos, inspecciones, casos, acciones, requisitos, certificados y auditoría SST.
4. ANIMA será la superficie personal para reportes, capacitación, notificaciones, confirmaciones e información de emergencia.
5. NEXO conservará existencia, movimiento, condición y custodia física de EPP y activos; VISO conservará la necesidad y asignación SST.
6. FOGO conservará hechos de producción, higiene, inocuidad y calidad; VISO solo relacionará el impacto SST o de cumplimiento transversal.
7. SHELL y Supabase compartidos resolverán identidad, autorización, eventos, auditoría y persistencia, sin convertirse en propietarios del proceso.
8. ARL, IPS, médicos, asesores, autoridades y certificadores continuarán como fuentes profesionales o externas según aplique.
9. Incidencia de asistencia, incidente SST, accidente, emergencia, hallazgo y no conformidad serán contratos distintos.
10. El reporte inicial será inmutable y toda corrección quedará versionada.
11. Los datos médicos no se distribuirán a aplicaciones operativas ni se guardarán en notas generales.
12. La clasificación territorial y de sensibilidad gobernará cada lectura y escritura.
13. El cierre de una acción exigirá verificación de eficacia.
14. Las inspecciones conservarán plantilla y versión.
15. Los certificados conservarán emisor, alcance, vigencia e historial.
16. La respuesta de emergencia seguirá siendo física, humana y tolerante a caída del sistema.
17. La captura offline se admitirá únicamente con idempotencia, protección local y reautorización.
18. VITAL queda fuera de la cobertura laboral de Vento OS.
19. `DAT-16` y `DAT-17` deberán resolverse antes de cualquier migración o activación de los registros correspondientes.
20. Se generan `TREQ-AUTH-017` y `TREQ-INTEGRATION-008`.

---

#### 34. Requisitos de prueba derivados

##### 34.1. `TREQ-AUTH-017`

| Campo                  | Definición                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ID                     | `TREQ-AUTH-017`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| Dominio                | `AUTH`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| Regla protegida        | Los expedientes SST, reportes, investigaciones, declaraciones, evidencias y datos médicos deberán aplicar autorización por identidad real, vínculo vigente, participación, sede, área, tipo de expediente, sensibilidad y estado. El trabajador verá únicamente información propia permitida. Un responsable territorial no obtendrá acceso global. Las aplicaciones operativas y eventos generales no recibirán diagnósticos ni documentos médicos. Los accesos extraordinarios de emergencia serán mínimos, temporales y auditados. URL directa, formulario manipulado, RPC directa, simulación, dispositivo compartido, caché o exportación no podrán ampliar el alcance. El reporte original y la evidencia permanecerán protegidos e inmutables; toda ampliación, corrección, descarga y consulta sensible conservará actor y motivo cuando corresponda. |
| Origen                 | `CAP-SCOPE-003`; `CAP-03.04`; `CAP-03.08`; `CAP-03.09`; `H-CAP-SCOPE-003-007`; `H-CAP-SCOPE-003-012`; `BKL-FUNC-003`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| Riesgo / prioridad     | exposición de información médica o SST, acceso entre sedes, modificación de evidencia, descarga masiva y decisiones laborales basadas en datos no autorizados / crítica                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| Tipo / modalidad       | seguridad + autorización + privacidad + RLS + Storage + exportación + URL directa + auditoría + regresión / automatizada con revisión manual de privacidad                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| Tarea responsable      | `AUTH-SRV-004` a `AUTH-SRV-018`; `VISO-AUTH-013` a `VISO-AUTH-019`; `CAP-SCOPE-016`; `EVID-ARC-001` a `EVID-ARC-010`; `AUTH-QA-003`; `AUTH-QA-007`; `AUTH-QA-008`; `AUTH-QA-018`; `AUTH-QA-020` a `AUTH-QA-024`; `AUTH-QA-029`; `AUTH-QA-030`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Paquete                | diseño E2 del proceso SST; arquitectura E3/E4; paquetes E5 VISO/ANIMA/SHELL; certificación del BLOQUE U                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| Repositorio / ambiente | `vento-viso`, `vento-anima`, `vento-shell` y Storage / Supabase local, CI, staging, dispositivos personales y compartidos, exportaciones y actores de distintas sedes                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Estado                 | `IDENTIFICADO`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| Artefacto              | Pendiente                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| Último resultado       | Pendiente                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| Evidencia              | decisiones de `CAP-SCOPE-003`; ausencia de contrato específico de privacidad SST; controles de autorización ya aprobados; separación de VITAL                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Relación               | `TREQ-AUTH-003`; `TREQ-AUTH-008`; `TREQ-AUTH-009`; `TREQ-AUTH-010`; `TREQ-AUTH-011`; `TREQ-AUTH-013`; `TREQ-AUTH-014`; `TREQ-AUTH-015`; `TREQ-SUPABASE-004`; `TREQ-VISO-001`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |

##### 34.2. `TREQ-INTEGRATION-008`

| Campo                  | Definición                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ID                     | `TREQ-INTEGRATION-008`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| Dominio                | `INTEGRATION`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| Regla protegida        | El ciclo SST deberá conservar propiedad única e integración trazable entre ANIMA, VISO, NEXO, FOGO, SHELL y fuentes externas. Un reporte creado desde cualquier canal producirá un solo expediente con identificador estable; el reporte original no se sobrescribirá. Las incidencias de asistencia no se convertirán ni contarán como incidentes SST sin relación explícita. Reintentos, cola offline y eventos repetidos no duplicarán casos, inspecciones, acciones, entregas de EPP, alertas ni evidencia. Toda investigación, hallazgo y acción conservará correlación con su origen. NEXO confirmará hechos físicos de EPP sin decidir la necesidad preventiva; FOGO emitirá hechos de higiene o inocuidad sin apropiarse del expediente SST. Las decisiones o certificados externos conservarán fuente y alcance. El cierre de una acción requerirá evidencia y verificación de eficacia, y los consumidores deberán converger al mismo estado sin copias editables competidoras. |
| Origen                 | `CAP-SCOPE-003`; `CAP-03.03` a `CAP-03.10`; `H-CAP-SCOPE-003-003`; `H-CAP-SCOPE-003-006`; `H-CAP-SCOPE-003-008`; `H-CAP-SCOPE-003-013`; `H-CAP-SCOPE-003-014`; `BKL-FUNC-003`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| Riesgo / prioridad     | expedientes duplicados, incidentes mal clasificados, acciones huérfanas, EPP sin trazabilidad, evidencia divergente, sincronización offline repetida y cierre aparente / crítica                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| Tipo / modalidad       | contractual + integración + idempotencia + offline + concurrencia + eventos + E2E + regresión / automatizada con validación operativa y documental                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| Tarea responsable      | `PROC-CAT-009` a `PROC-CAT-018`; `PROC-ACTOR-003`; `UX-ADMIN-001` a `UX-ADMIN-005`; `NEXO-DOM-008` a `NEXO-DOM-011`; `NEXO-DOM-017`; `NEXO-DOM-026`; `CAP-SCOPE-008`; `CAP-SCOPE-013`; `CAP-SCOPE-018`; `INT-EXT-001` a `INT-EXT-019`; `AUTH-QA-026`; `AUTH-QA-027`; `AUTH-QA-029`; `AUTH-QA-030`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Paquete                | diseño E2 del proceso SST; contratos BLOQUE X; arquitectura E3/E4; paquetes E5 VISO/ANIMA/NEXO/FOGO/SHELL; certificación del BLOQUE U                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| Repositorio / ambiente | `vento-viso`, `vento-anima`, `vento-nexo`, `vento-fogo`, `vento-shell` / Supabase local, CI, staging, red intermitente, dispositivo compartido y simulación de fuentes externas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| Estado                 | `IDENTIFICADO`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| Artefacto              | Pendiente                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Último resultado       | Pendiente                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Evidencia              | decisiones de `CAP-SCOPE-003`; semántica actual de incidencias de asistencia; estructuras parciales de inventario y evidencia; requisitos offline existentes                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Relación               | `TREQ-ANIMA-003`; `TREQ-ANIMA-004`; `TREQ-AUTH-017`; `TREQ-INTEGRATION-003`; `TREQ-INTEGRATION-007`; `TREQ-SUPABASE-004`; `TREQ-UX-005`; `TREQ-VISO-001`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |

Las dos filas deberán incorporarse al Registro Canónico, conservando las catorce columnas reglamentarias y el orden por identificador de dominio.

---

#### 35. Dependencias habilitadas y restricciones

La aprobación de esta tarea habilita:

- `CAP-SCOPE-004`;
- diseño posterior de procesos SST en `PROC-CAT-*`;
- delimitación de superficies administrativas en VISO;
- diseño posterior de reporte y consulta personal en ANIMA;
- integración conceptual con NEXO, FOGO, instalaciones, documentos y continuidad;
- definición física posterior en E3 y E4;
- planificación de paquetes E5 y pruebas SST;
- consolidación de propietario en `CAP-SCOPE-019`.

No habilita todavía:

- crear expedientes SST reales;
- cargar datos médicos;
- migrar inspecciones o acciones históricas;
- crear tablas o buckets;
- cambiar permisos;
- entregar EPP;
- emitir alertas legales;
- registrar accidentes externamente;
- publicar planes de emergencia;
- conectar proveedores o autoridades;
- desplegar una superficie de reporte;
- usar VITAL para trabajadores.

---

#### 36. Criterios de aceptación

`CAP-SCOPE-003` podrá aprobarse cuando se confirme que:

- las diez subcapacidades `CAP-03.*` están evaluadas;
- cada subcapacidad tiene tratamiento objetivo;
- existe propietario funcional candidato;
- VISO y ANIMA tienen fronteras explícitas;
- NEXO y FOGO no mantienen expedientes SST competidores;
- VITAL queda fuera;
- incidencia de asistencia e incidente SST están separados;
- datos médicos y operativos tienen tratamiento distinto;
- reporte, investigación, inspección, requisito, certificado y acción tienen semántica mínima;
- el reporte original y la evidencia no se sobrescriben;
- el cierre exige verificación de eficacia;
- la operación de emergencia no depende únicamente del sistema;
- `DAT-16` y `DAT-17` tienen tratamiento y puerta máxima;
- los quince hallazgos tienen destino canónico;
- se registran `TREQ-AUTH-017` y `TREQ-INTEGRATION-008`;
- no se autorizaron cambios técnicos, médicos, legales ni externos.

---

#### 37. Resultado y continuidad

Con la aprobación de `CAP-SCOPE-003` quedará definido que Vento OS deberá apoyar un sistema SST gobernado, auditable e integrado, sin sustituir responsables profesionales ni convertir datos médicos en información operativa general.

La continuidad documental será exclusivamente:

```text
CAP-SCOPE-004
— Evaluar catálogo, productos, presentaciones, unidades, menús y recetas
```

No se inicia `CAP-SCOPE-004` dentro de esta tarea.


### ✅ CAP-SCOPE-004 — Evaluar catálogo, productos, presentaciones, unidades, menús y recetas

**Estado:** APROBADA 
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Dependencia cumplida:** `CAP-SCOPE-003` aprobada  
**Tarea anterior:** `CAP-SCOPE-003`  
**Siguiente tarea reservada:** `CAP-SCOPE-005`  
**Familia evaluada:** `CAP-04 — Gestionar productos, preparaciones y conocimiento`  
**Naturaleza:** decisión de cobertura empresarial y definición conceptual objetivo  
**Implementación técnica:** no autorizada  
**Migraciones o cambios en Supabase:** no autorizados  
**Cambios directos en catálogo, recetas, menús, precios o disponibilidad:** no autorizados  
**Requisitos de prueba generados:** `TREQ-SUPABASE-012`, `TREQ-FOGO-002`, `TREQ-INTEGRATION-009`  
**Actualización del registro de pruebas:** se entrega el archivo `04A` completo regenerado; quedan prohibidas las filas sueltas

---

#### 1. Propósito

Definir el tratamiento objetivo de las capacidades mediante las cuales Vento Group deberá:

- identificar de manera estable productos, servicios, preparaciones, insumos, empaques y componentes;
- distinguir un producto maestro de sus presentaciones físicas, unidades, variantes y usos;
- clasificar los productos sin mezclar taxonomías operativas, productivas, comerciales, contables o regulatorias;
- conservar ingredientes y componentes como referencias canónicas y no como texto libre;
- diseñar, versionar, publicar y retirar recetas y métodos de preparación;
- definir rendimiento esperado, porciones, escalamiento, merma técnica y resultados reales;
- publicar menús y ofertas por sede, canal, horario y contexto comercial;
- distinguir oferta habilitada, disponibilidad operativa, stock, capacidad productiva y agotado temporal;
- conservar información nutricional, alérgenos, advertencias y fuentes de cálculo o verificación;
- gestionar especificaciones de calidad, conservación, empaque y aceptación;
- coordinar vigencias entre NEXO, FOGO, PULSO, PASS, ORIGO, NUMERA, VISO, SHELL y sistemas externos;
- impedir que cada aplicación cree una copia editable del mismo producto, presentación, receta o ítem de menú.

La tarea preserva la implementación útil ya comprobada, pero prohíbe declarar cerrada la familia `CAP-04` por la sola existencia de productos, recetas o pantallas actuales.

---

#### 2. Pregunta de decisión

`CAP-SCOPE-004` responde:

```text
¿CUÁL ES LA IDENTIDAD CANÓNICA DE CADA PRODUCTO, SERVICIO,
PRESENTACIÓN, UNIDAD, INGREDIENTE, PREPARACIÓN, RECETA,
PORCIÓN, ÍTEM DE MENÚ Y OFERTA;
QUÉ APLICACIÓN PRODUCE CADA HECHO;
QUÉ APLICACIONES SOLO LO CONSUMEN;
Y CÓMO SE VERSIONAN, PUBLICAN, RETIRAN Y SINCRONIZAN
SIN DUPLICAR CATÁLOGOS NI ALTERAR LA HISTORIA?
```

La tarea rechaza equivalencias incorrectas como:

```text
PRODUCTO = PRESENTACIÓN
```

```text
PRESENTACIÓN = UNIDAD DE MEDIDA
```

```text
CATEGORÍA OPERATIVA = CATEGORÍA COMERCIAL
```

```text
RECETA = PRODUCTO
```

```text
ÍTEM DE MENÚ = PRODUCTO MAESTRO
```

```text
ACTIVO = DISPONIBLE PARA VENTA
```

```text
STOCK MAYOR QUE CERO = SE PUEDE VENDER
```

```text
EDITAR UNA RECETA PUBLICADA = CREAR UNA NUEVA VERSIÓN
```

```text
TENER UN CAMPO DE ALÉRGENOS = INFORMACIÓN VERIFICADA
```

---

#### 3. Fuentes consolidadas

La evaluación utiliza como línea base:

- `OPS-AUD-001` a `OPS-AUD-015`;
- `CAP-MAP-001` a `CAP-MAP-015`;
- `CODE-AUD-001` a `CODE-AUD-020`;
- `MAP-IMPL-CAP-001`;
- `BKL-REPO-001`, especialmente `BKL-FUNC-004` y `BKL-NEXO-006`;
- `CAP-SCOPE-001` a `CAP-SCOPE-003`;
- `QA-REG-001` y el Registro Canónico de Requisitos de Prueba;
- `REGISTRO_VIVO_DE_PREGUNTAS_PENDIENTES`, especialmente `DAT-03`, `DAT-04`, `TEC-06`, `TEC-08` y `TEC-18`;
- el catálogo maestro, perfiles de inventario, presentaciones, unidades, proveedores, imágenes y configuraciones actuales de NEXO;
- las recetas, ingredientes, pasos, rendimientos, porciones, recetario operativo y lotes actuales de FOGO;
- las superficies parciales de menú, oferta y disponibilidad de VISO, NEXO, PULSO y PASS;
- los contratos futuros de `OPS-REC-001`, `OPS-PRD-001`, `OPS-TRZ-001`, `INT-PROD-001` a `INT-PROD-005` e `INT-POS-001` a `INT-POS-024`;
- las decisiones ya aprobadas sobre fuente de verdad, propiedad funcional, autorización, Storage, integración, idempotencia, auditoría y transición.

Las respuestas y evidencias ya documentadas no se vuelven a solicitar.

---

#### 4. Alcance evaluado

La tarea evalúa directamente:

- `CAP-04.01` — Definir productos y servicios;
- `CAP-04.02` — Definir presentaciones y unidades;
- `CAP-04.03` — Clasificar productos;
- `CAP-04.04` — Gestionar ingredientes y componentes;
- `CAP-04.05` — Definir recetas y métodos de preparación;
- `CAP-04.06` — Definir rendimientos y porciones;
- `CAP-04.07` — Gestionar menús y disponibilidad;
- `CAP-04.08` — Gestionar información nutricional y alérgenos;
- `CAP-04.09` — Gestionar calidad y especificaciones;
- `CAP-04.10` — Gestionar cambios y vigencia del conocimiento.

También fija fronteras para:

- compras y presentaciones de proveedor;
- inventario, lotes, vencimientos, LOC y LPN;
- planificación y ejecución productiva;
- ventas, pedidos, caja y pagos;
- clientes y canales;
- costos, margen y rentabilidad;
- documentos, evidencia, privacidad y conservación;
- analítica;
- continuidad operativa;
- integraciones con POS, Rappi, Shopify, ManyChat y otros canales.

---

#### 5. Fuera de alcance

Esta tarea no:

- crea o modifica productos reales;
- depura los 959 productos ni las 276 recetas identificadas en la auditoría;
- aprueba fórmulas, rendimientos o declaraciones nutricionales;
- define precios de venta;
- decide impuestos o clasificación fiscal;
- reemplaza validación de nutricionista, tecnólogo de alimentos, responsable de calidad o autoridad competente;
- ejecuta análisis de laboratorio;
- publica menús;
- activa o desactiva productos;
- cambia disponibilidad comercial;
- migra categorías;
- modifica unidades o factores de conversión;
- corrige inventario;
- crea recetas;
- ejecuta producción;
- implementa trazabilidad de lotes;
- crea tablas, vistas, RPC, buckets, políticas RLS, eventos o paquetes;
- integra directamente un POS externo;
- convierte VISO en propietario del catálogo;
- convierte PASS en fuente de verdad de productos;
- convierte NEXO en propietario de precios o menús;
- convierte PULSO en propietario de inventario o recetas;
- incorpora activos, repuestos, vajilla o decoración dentro del catálogo de producto ordinario cuando pertenecen a `CAP-07`.

---

#### 6. Principios canónicos

##### 6.1. La identidad precede a la presentación

Todo elemento gestionado deberá tener una identidad estable independiente de:

- nombre visible;
- marca;
- imagen;
- categoría;
- proveedor;
- código externo;
- empaque;
- sede;
- precio;
- receta;
- canal.

Cambiar un nombre, una imagen o un empaque no crea automáticamente un producto nuevo.

##### 6.2. Producto maestro, variante, presentación y unidad son conceptos distintos

```text
PRODUCTO MAESTRO
→ qué es el elemento

VARIANTE
→ qué configuración diferenciada del producto se ofrece o produce

PRESENTACIÓN
→ cómo se compra, recibe, almacena, solicita, vende o transporta físicamente

UNIDAD
→ cómo se expresa una magnitud medible
```

Una caja de seis botellas no será una unidad de medida nueva. Será una presentación con una conversión aprobada hacia la unidad canónica de stock.

##### 6.3. La misma identidad puede desempeñar varios roles

Un elemento podrá ser, según reglas explícitas:

- comprable;
- almacenable;
- ingrediente;
- componente de empaque;
- preparación intermedia;
- producto terminado;
- vendible;
- suministrable entre sedes;
- consumible operativo;
- servicio no inventariable.

Los roles no se resolverán creando copias independientes del mismo elemento en cada aplicación.

##### 6.4. Los servicios no heredarán semántica de inventario

Un servicio podrá ser vendible o comprable sin tener:

- stock;
- LOC;
- presentación física;
- lote;
- vencimiento;
- movimiento de inventario.

La ausencia de stock no lo convertirá en producto defectuoso ni se inventará una unidad física para hacerlo compatible.

##### 6.5. Las taxonomías no se mezclarán

Se distinguirán, cuando sean necesarias:

- tipo maestro;
- clasificación de inventario;
- categoría operativa;
- familia productiva;
- categoría de compra;
- categoría comercial o de menú;
- clasificación contable o de costo;
- clasificación fiscal;
- clasificación nutricional o regulatoria.

Una categoría comercial no controlará por sí sola inventario. Una categoría operativa no determinará cómo se muestra el producto al cliente.

##### 6.6. Ingredientes y preparaciones intermedias serán referencias canónicas

Una receta no deberá depender de:

- nombres escritos manualmente;
- unidades libres;
- ingredientes duplicados;
- productos inactivos sin excepción;
- identificadores propios de FOGO sin vínculo con el catálogo maestro.

Una preparación intermedia podrá ser salida de una receta e ingrediente de otra, conservando identidad, unidad, lote y trazabilidad.

##### 6.7. La receta es conocimiento versionado

```text
RECETA
→ identidad estable del conocimiento

VERSIÓN DE RECETA
→ formulación, método y reglas vigentes en un período

EJECUCIÓN
→ uso concreto de una versión en un lote o preparación
```

Una versión publicada no se editará destructivamente.

##### 6.8. El lote conservará la versión efectivamente usada

Cada ejecución productiva deberá conservar:

- receta;
- versión;
- salida esperada;
- escala;
- ingredientes previstos;
- sustituciones autorizadas;
- pasos aplicables;
- rendimiento esperado;
- actor;
- sede;
- área;
- fecha;
- cantidades realmente usadas;
- resultado real.

La actualización posterior de la receta no cambiará el significado histórico del lote.

##### 6.9. Rendimiento esperado y rendimiento real no son equivalentes

```text
RENDIMIENTO ESPERADO
→ conocimiento aprobado de la receta

RENDIMIENTO REAL
→ resultado observado de una ejecución
```

La desviación se registrará; no se corregirá retroactivamente el rendimiento esperado para hacer coincidir el resultado.

##### 6.10. El menú es una publicación comercial, no un catálogo maestro paralelo

Un ítem de menú deberá referenciar:

- producto o variante vendible;
- sede;
- canal;
- nombre y descripción comerciales;
- categoría comercial;
- configuración u opciones;
- vigencia;
- disponibilidad;
- reglas de precio pertenecientes al dominio de venta;
- información de alérgenos o advertencias publicables.

El ítem no duplicará la identidad física, receta ni unidad de stock.

##### 6.11. La disponibilidad tendrá causas explícitas

Se distinguirán como mínimo:

- oferta habilitada;
- fuera de horario;
- no disponible en la sede;
- no disponible en el canal;
- agotado temporal;
- bloqueado por stock estricto;
- bloqueado por capacidad productiva;
- suspendido manualmente;
- retirado;
- pendiente de sincronización;
- estado desconocido o degradado.

Una sola bandera `is_active` no cubrirá toda la semántica.

##### 6.12. La disponibilidad no se inferirá siempre del stock

Un producto podrá ser:

- fabricado contra pedido;
- elaborado con insumos compartidos;
- limitado por capacidad;
- vendido sin inventario terminado;
- sujeto a reserva;
- temporalmente bloqueado por calidad;
- no inventariable.

Cada oferta declarará su política de disponibilidad.

##### 6.13. Nutrición y alérgenos exigirán procedencia

Todo valor deberá declarar:

- fuente;
- método;
- fecha;
- versión;
- alcance;
- responsable;
- estado de revisión;
- si fue calculado, estimado, declarado por proveedor o verificado externamente.

No se publicará como confirmado un dato meramente inferido.

##### 6.14. Alérgeno presente y riesgo de contaminación cruzada son distintos

La declaración deberá distinguir:

- ingrediente que contiene el alérgeno;
- derivado o compuesto;
- sustitución;
- posibilidad de contacto cruzado;
- advertencia de instalación;
- ausencia no verificada;
- declaración pendiente.

Un cambio de ingrediente o proceso deberá invalidar o revisar la declaración afectada.

##### 6.15. Las especificaciones tendrán objeto y versión

Una especificación podrá pertenecer a:

- producto maestro;
- presentación;
- materia prima;
- preparación intermedia;
- salida de receta;
- empaque;
- condición de conservación.

No se reutilizará una misma especificación sin declarar el objeto al que aplica.

##### 6.16. Retirar no significa borrar

Los productos, presentaciones, recetas, versiones, menús y especificaciones referenciados por historia no podrán eliminarse destructivamente.

El retiro deberá impedir nuevos usos incompatibles, pero conservar:

- ventas;
- compras;
- movimientos;
- lotes;
- costos;
- documentos;
- evidencia;
- auditoría.

##### 6.17. Ninguna aplicación creará un catálogo competidor

```text
NEXO
→ identidad maestra y configuración física u operativa

FOGO
→ recetas, métodos, rendimientos y ejecución productiva

PULSO
→ oferta vendible, menú y disponibilidad comercial

PASS
→ presentación al cliente y consumo de la oferta publicada

ORIGO
→ condiciones de compra y presentaciones del proveedor

NUMERA
→ costos y resultados económicos derivados

VISO
→ superficie administrativa y enlaces a propietarios
```

Cada aplicación conservará sus hechos propios sin recrear los de otra.

##### 6.18. VISO no será propietario por tener una pantalla administrativa

VISO podrá:

- consultar;
- coordinar;
- mostrar estado;
- iniciar una acción autorizada;
- enlazar a la aplicación propietaria.

No deberá mantener una segunda implementación editable de producto, receta, menú o disponibilidad.

---

#### 7. Modelo conceptual objetivo

##### 7.1. Conceptos separados

| Concepto                 | Propósito                                                                 |
| ------------------------ | ------------------------------------------------------------------------- |
| `CatalogItem`            | identidad estable de producto, servicio, insumo, preparación o componente |
| `ItemRole`               | roles empresariales habilitados para la identidad                         |
| `ItemVariant`            | configuración diferenciada que mantiene vínculo con el producto maestro   |
| `MeasurementDimension`   | masa, volumen, conteo, longitud u otra dimensión permitida                |
| `UnitOfMeasure`          | unidad normalizada y precisión                                            |
| `ItemMeasurementProfile` | unidad canónica de stock, entrada, receta y tolerancias                   |
| `Presentation`           | empaque o forma física con cantidad equivalente                           |
| `SiteItemConfiguration`  | habilitación y reglas operativas por sede                                 |
| `Taxonomy`               | tipo de clasificación y reglas                                            |
| `TaxonomyAssignment`     | asignación versionada de una identidad a una clasificación                |
| `ComponentRelation`      | relación ingrediente, empaque, componente o preparación intermedia        |
| `Recipe`                 | identidad estable de una formulación o método                             |
| `RecipeVersion`          | versión completa con vigencia y estado                                    |
| `RecipeIngredient`       | componente, cantidad, unidad, tolerancia y reglas                         |
| `RecipeStep`             | secuencia, instrucción, tiempo, equipo y control                          |
| `RecipeOutput`           | producto resultante y rendimiento esperado                                |
| `YieldSpecification`     | cantidad, unidad, merma técnica y rango esperado                          |
| `PortionSpecification`   | porción y reglas de redondeo                                              |
| `ProductSpecification`   | criterios técnicos, físicos, sensoriales o de conservación                |
| `NutritionProfile`       | valores, método, fuente y versión                                         |
| `AllergenDeclaration`    | presencia, posible contacto, fuente y estado                              |
| `Menu`                   | publicación comercial por alcance                                         |
| `MenuSection`            | agrupación comercial                                                      |
| `MenuItem`               | referencia comercial a producto o variante                                |
| `Offer`                  | configuración vendible por sede, canal y vigencia                         |
| `AvailabilityRule`       | política y causa de disponibilidad                                        |
| `ExternalProductMapping` | relación con identificadores de sistemas externos                         |
| `KnowledgeChange`        | solicitud, revisión, aprobación, publicación o retiro                     |

##### 7.2. Relación general

```text
CATALOG ITEM
├── roles
├── variantes
├── perfiles de medición
├── presentaciones
├── clasificaciones
├── especificaciones
├── nutrición
├── alérgenos
├── configuración por sede
└── mapeos externos
```

```text
RECIPE
└── RECIPE VERSION
    ├── ingredientes → CATALOG ITEM
    ├── pasos
    ├── salida → CATALOG ITEM
    ├── rendimiento
    ├── porción
    ├── conservación
    ├── alérgenos derivados
    └── evidencia y aprobación
```

```text
MENU
└── OFFER
    ├── sede
    ├── canal
    ├── MENU ITEM
    │   └── producto o variante vendible
    ├── vigencia
    ├── disponibilidad
    └── referencia de precio del dominio de venta
```

---

#### 8. Estados canónicos mínimos

##### 8.1. Producto o servicio

```text
DRAFT
→ ACTIVE
→ SUSPENDED
→ DISCONTINUED
→ ARCHIVED
```

Reglas:

- `DRAFT` no participa en operación;
- `ACTIVE` admite usos expresamente habilitados;
- `SUSPENDED` impide nuevos usos temporales;
- `DISCONTINUED` no admite nueva operación ordinaria;
- `ARCHIVED` conserva historia;
- ningún estado borra referencias.

##### 8.2. Presentación

```text
DRAFT
→ ACTIVE
→ INACTIVE
→ RETIRED
```

Una presentación retirada no desaparecerá de compras, recepciones, ventas o movimientos históricos.

##### 8.3. Versión de receta

```text
DRAFT
→ IN_REVIEW
→ APPROVED
→ PUBLISHED
→ SUPERSEDED
→ WITHDRAWN
```

Reglas:

- solo `PUBLISHED` podrá usarse ordinariamente;
- `SUPERSEDED` conserva historia;
- `WITHDRAWN` impide nuevos lotes;
- una corrección urgente no modifica silenciosamente la versión publicada.

##### 8.4. Especificación, nutrición o alérgenos

```text
DRAFT
→ PENDING_VERIFICATION
→ APPROVED
→ PUBLISHED
→ SUPERSEDED
→ WITHDRAWN
```

El estado deberá ser visible para impedir que información no verificada se publique como confirmada.

##### 8.5. Menú y oferta

```text
DRAFT
→ SCHEDULED
→ PUBLISHED
→ SUSPENDED
→ EXPIRED
→ RETIRED
```

##### 8.6. Disponibilidad operacional

```text
AVAILABLE
TEMPORARILY_UNAVAILABLE
OUT_OF_SCHEDULE
STOCK_BLOCKED
PRODUCTION_BLOCKED
QUALITY_BLOCKED
CHANNEL_DISABLED
SITE_DISABLED
UNKNOWN
```

La disponibilidad operacional no reemplaza el estado de publicación de la oferta.

---

#### 9. Propiedad funcional y tecnológica

| Resultado                                                       | Propietario funcional candidato      | Aplicación productora             | Consumidores principales                 |
| --------------------------------------------------------------- | ------------------------------------ | --------------------------------- | ---------------------------------------- |
| identidad maestra de producto, servicio, insumo y preparación   | Operaciones con gobierno empresarial | NEXO                              | ORIGO, FOGO, PULSO, PASS, NUMERA, VISO   |
| unidades, perfiles de medición y presentaciones físicas         | Operaciones e inventario             | NEXO                              | ORIGO, FOGO, PULSO cuando aplique        |
| clasificaciones operativas y de inventario                      | Operaciones                          | NEXO                              | FOGO, ORIGO, NUMERA                      |
| receta, método, rendimiento y porción                           | Producción                           | FOGO                              | NEXO, PULSO, NUMERA, PASS según contrato |
| especificación productiva y controles de receta                 | Producción y calidad                 | FOGO con referencias del catálogo | NEXO y supervisión                       |
| menú, oferta y disponibilidad comercial                         | Operación de venta                   | PULSO                             | PASS y canales externos                  |
| condiciones de compra y códigos del proveedor                   | Compras                              | ORIGO                             | NEXO y NUMERA                            |
| costos e indicadores derivados                                  | Finanzas                             | NUMERA                            | VISO y responsables autorizados          |
| experiencia de cliente                                          | Servicio al cliente                  | PASS                              | cliente final                            |
| navegación y administración transversal                         | Administración                       | VISO                              | usuarios administrativos                 |
| contratos, eventos, autorización y persistencia física aprobada | Arquitectura transversal             | SHELL/Supabase                    | todas las aplicaciones                   |

##### 9.1. Regla de administración

VISO podrá ofrecer una entrada administrativa unificada, pero cada guardado deberá:

1. invocar o redirigir al contrato de la aplicación propietaria;
2. validar autorización exacta;
3. conservar actor y origen;
4. evitar una segunda tabla o lógica de negocio;
5. mostrar el resultado confirmado por el propietario.

---

#### 10. Línea base de implementación verificable

La auditoría comprobó:

- catálogo maestro en NEXO/VISO;
- productos con datos reales;
- categorías, imágenes, proveedores y configuración por sede;
- presentaciones físicas y stock por presentación;
- perfiles y reglas de unidad;
- recetas con ingredientes, pasos, rendimientos y porciones;
- recetario operacional separado de la administración;
- recetas publicadas capaces de originar lotes;
- menús, oferta y disponibilidad distribuidos entre VISO, NEXO, PULSO y PASS;
- configuraciones comerciales y de canales;
- mapeos e importaciones parciales desde sistemas externos;
- 959 productos y 276 recetas reportados durante la auditoría.

La evidencia no demuestra todavía:

- un contrato único de identidad y roles del producto;
- ausencia de productos semánticamente duplicados;
- una precedencia única de unidades, perfiles y presentaciones;
- separación completa de categorías operativas y comerciales;
- versionado inmutable y coordinado de recetas;
- publicación controlada de nutrición y alérgenos;
- ciclo integral de especificaciones de calidad;
- propagación coordinada de cambios;
- una fuente única de menú y disponibilidad;
- paridad entre PULSO, PASS y canales externos;
- trazabilidad histórica completa cuando se retira o reemplaza un producto;
- que todas las aplicaciones consuman el mismo contrato.

---

#### 11. Matriz de decisión de cobertura

| Subcapacidad | Tratamiento         | Productora candidata                                    | Decisión                                                                             |
| ------------ | ------------------- | ------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| `CAP-04.01`  | `REUSE_OR_REFACTOR` | NEXO                                                    | conservar el catálogo en uso y separar identidad, rol, variante y servicio           |
| `CAP-04.02`  | `REUSE_OR_REFACTOR` | NEXO                                                    | consolidar unidades, perfiles y presentaciones sin defaults silenciosos              |
| `CAP-04.03`  | `REUSE_OR_REFACTOR` | NEXO con taxonomías por dominio                         | separar clasificaciones operativas, productivas, comerciales y contables             |
| `CAP-04.04`  | `REUSE_OR_REFACTOR` | NEXO                                                    | convertir ingredientes y componentes en relaciones canónicas reutilizables           |
| `CAP-04.05`  | `REUSE_OR_REFACTOR` | FOGO                                                    | conservar recetas y recetario, incorporando versión, publicación y acceso contextual |
| `CAP-04.06`  | `REUSE_OR_REFACTOR` | FOGO                                                    | formalizar rendimiento, porción, escala, merma esperada y resultado real             |
| `CAP-04.07`  | `REUSE_OR_REFACTOR` | PULSO                                                   | consolidar menú y oferta; PASS y canales serán consumidores                          |
| `CAP-04.08`  | `BUILD`             | NEXO/FOGO según origen                                  | crear gobierno verificable de nutrición, alérgenos y advertencias                    |
| `CAP-04.09`  | `REUSE_OR_REFACTOR` | NEXO/FOGO                                               | convertir campos parciales en especificaciones versionadas por objeto                |
| `CAP-04.10`  | `BUILD`             | propietario de cada conocimiento con coordinación SHELL | crear ciclo común de revisión, publicación, vigencia, supersesión y retiro           |

##### 11.1. Resumen de clasificaciones

| Tratamiento         | Cantidad |
| ------------------- | -------: |
| `REUSE_OR_REFACTOR` |        8 |
| `BUILD`             |        2 |
| **Total**           |   **10** |

No se clasifica ninguna subcapacidad como `OUT_OF_SCOPE`, `RETIRE` o `DEFERRED`. Sí se retirarán implementaciones competidoras concretas, no la capacidad empresarial.

---

#### 12. CAP-04.01 — Definir productos y servicios

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietaria candidata:** NEXO  
**Estado actual:** implementación verificada en uso

La identidad deberá registrar como mínimo:

- identificador estable;
- código canónico;
- nombre interno;
- nombre comercial cuando aplique;
- descripción;
- tipo maestro;
- roles empresariales;
- estado y vigencia;
- propietario funcional;
- organización o alcance aplicable;
- marca cuando corresponda;
- trazabilidad de creación y cambio.

##### 12.1. Tipos conceptuales mínimos

- producto físico;
- ingrediente;
- preparación intermedia;
- producto terminado;
- empaque;
- consumible operativo;
- servicio;
- elemento no inventariable;
- referencia externa pendiente de mapeo.

Los activos y reutilizables permanecerán en `CAP-07` aunque puedan compartir proveedores o códigos.

##### 12.2. Reglas

1. Un producto no se duplicará para cada sede.
2. Una presentación no creará otra identidad de producto.
3. Un proveedor no será propietario del producto maestro.
4. Un código externo no reemplazará el identificador interno.
5. Un servicio no recibirá stock artificial.
6. Un producto retirado conservará historia.
7. Una preparación intermedia podrá ser inventariable y producible.
8. La condición vendible será un rol o una oferta, no una consecuencia del nombre o categoría.

##### 12.3. Destinos

- `SUPA-AUD-019`;
- `DATA-NORM-AUD-004`;
- `SUPA-TRANS-005`;
- `SUPA-TRANS-007`;
- `SUPA-TRANS-012`;
- `NEXO-AUTH-014`;
- `SHELL-CON-001`;
- `SHELL-CON-016`;
- `READY-GATE-005`.

---

#### 13. CAP-04.02 — Definir presentaciones y unidades

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietaria candidata:** NEXO  
**Estado actual:** implementación verificada en uso con precedencias competidoras detectadas

##### 13.1. Dimensiones permitidas

Cada unidad pertenecerá a una dimensión compatible:

- masa;
- volumen;
- conteo;
- longitud;
- área;
- tiempo, solo cuando corresponda a servicios o preparación;
- otra dimensión aprobada.

No se permitirá convertir masa a volumen sin una regla específica, versionada y contextual.

##### 13.2. Unidades diferenciadas

Se distinguirán:

- unidad canónica de stock;
- unidad de entrada;
- unidad de compra;
- unidad de receta;
- unidad de producción;
- unidad de remisión;
- unidad de venta;
- unidad de presentación;
- unidad de reporte.

Podrán coincidir, pero no se supondrá que son la misma.

##### 13.3. Presentación

Una presentación deberá conservar:

- producto;
- nombre;
- cantidad;
- unidad;
- factor hacia la unidad canónica;
- precisión;
- tolerancia;
- empaque;
- código o código de barras;
- imagen;
- estado;
- vigencia;
- ámbito de compra, venta, recepción, remisión o almacenamiento;
- relación con presentación de proveedor cuando aplique.

##### 13.4. Reglas de conversión

1. La conversión deberá ser determinista.
2. No se encadenarán factores ambiguos.
3. La precisión y el redondeo serán explícitos.
4. La misma presentación no tendrá factores incompatibles por aplicación.
5. Una sede podrá habilitar o deshabilitar una presentación sin redefinir su magnitud física.
6. Un producto medido por gramos no cambiará a conteo por sede sin una identidad o perfil aprobado.
7. Las excepciones deberán ser visibles, migrables y temporales.

##### 13.5. Destinos

- `BKL-NEXO-006`;
- `SUPA-AUD-019`;
- `DATA-NORM-AUD-003`;
- `DATA-NORM-AUD-004`;
- `SUPA-TRANS-005`;
- `SUPA-TRANS-007`;
- `SHELL-CON-001`;
- `TREQ-NEXO-008`;
- `TREQ-NEXO-010`.

---

#### 14. CAP-04.03 — Clasificar productos

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietaria candidata:** NEXO para clasificación operativa; cada dominio conserva su taxonomía especializada

##### 14.1. Taxonomías mínimas

| Taxonomía    | Propósito                                                         | Productora                |
| ------------ | ----------------------------------------------------------------- | ------------------------- |
| tipo maestro | distinguir producto, servicio, ingrediente, preparación y empaque | NEXO                      |
| inventario   | comportamiento de stock, medición, lote y vencimiento             | NEXO                      |
| operacional  | búsqueda, almacenamiento, remisión y operación                    | NEXO                      |
| productiva   | área, familia y proceso de producción                             | FOGO                      |
| compra       | agrupación y gestión de abastecimiento                            | ORIGO                     |
| comercial    | navegación de menú y oferta                                       | PULSO                     |
| costo        | análisis y agrupación económica                                   | NUMERA                    |
| regulatoria  | alérgenos, nutrición, impuestos u obligaciones aplicables         | propietario especializado |

##### 14.2. Reglas

- una taxonomía declarará su propietario;
- una categoría tendrá código estable y vigencia;
- mover un producto entre categorías no alterará historia;
- una aplicación consumidora no editará una taxonomía ajena;
- una categoría no concederá permisos;
- una categoría no definirá conversiones;
- una categoría comercial no controlará stock;
- una categoría operativa no decidirá el orden visual del menú.

##### 14.3. Destinos

- `NEXO-AUTH-014`;
- `PULSO-UX-001`;
- `PULSO-UX-021`;
- `VISO-UX-017`;
- `VISO-UX-018`;
- `SHELL-CON-016`;
- `DATA-NORM-AUD-004`.

---

#### 15. CAP-04.04 — Gestionar ingredientes y componentes

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietaria candidata:** NEXO para identidad; FOGO para uso dentro de receta

##### 15.1. Tipos de relación

- ingrediente;
- preparación intermedia;
- empaque primario;
- empaque secundario;
- decoración consumible;
- componente opcional;
- componente sustituible;
- componente informativo no consumido.

##### 15.2. Regla de referencia

Cada relación deberá utilizar:

- `item_id`;
- cantidad;
- unidad aprobada;
- tolerancia;
- orden o grupo;
- condición;
- vigencia;
- regla de sustitución cuando exista;
- efecto sobre alérgenos;
- efecto sobre costo e inventario.

No se aceptará un nombre libre como única identidad del ingrediente.

##### 15.3. Preparaciones intermedias

Una preparación intermedia:

- tendrá producto maestro;
- podrá tener receta propia;
- podrá generar lote;
- podrá almacenarse;
- podrá tener vencimiento;
- podrá consumirse en otra receta;
- conservará trazabilidad de origen.

##### 15.4. Integridad de composición

Se deberán detectar:

- ciclos de receta;
- referencias a productos retirados;
- unidades incompatibles;
- componentes sin factor;
- duplicados semánticos;
- sustituciones que cambian alérgenos;
- empaques contados como ingredientes nutricionales;
- componentes sin propietario.

##### 15.5. Destinos

- `OPS-REC-001`;
- `FOGO-UX-009`;
- `SUPA-AUD-019`;
- `DATA-NORM-AUD-004`;
- `SUPA-TRANS-005`;
- `INT-PROD-001` a `INT-PROD-004`.

---

#### 16. CAP-04.05 — Definir recetas y métodos de preparación

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietaria candidata:** FOGO  
**Estado actual:** recetas, ingredientes, pasos y recetario comprobados en uso

##### 16.1. Identidad y versión

Una receta tendrá:

- identificador estable;
- producto o productos de salida;
- familia;
- área;
- propietario;
- sensibilidad;
- estado general.

Cada versión tendrá:

- número o código de versión;
- estado;
- vigencia;
- motivo;
- ingredientes;
- pasos;
- equipos;
- tiempos;
- temperaturas;
- controles;
- almacenamiento;
- vida útil;
- rendimiento;
- porción;
- alérgenos;
- evidencia;
- aprobadores.

##### 16.2. Publicación

Solo una versión publicada y válida podrá seleccionarse para nuevos lotes ordinarios.

La publicación deberá comprobar:

- ingredientes activos;
- unidades compatibles;
- salida definida;
- rendimiento;
- pasos;
- controles obligatorios;
- permisos;
- alérgenos;
- conservación;
- ausencia de ciclos;
- vigencia.

##### 16.3. Acceso contextual

Se distinguirá:

- administrar receta;
- revisar;
- aprobar;
- publicar;
- retirar;
- ver recetario operativo;
- ver cantidades completas;
- ver fórmula sensible;
- ejecutar un paso;
- registrar resultado.

Un trabajador podrá recibir instrucciones suficientes para operar sin obtener automáticamente acceso administrativo o transversal a fórmulas reservadas.

##### 16.4. Correcciones

Una receta publicada:

- no se sobrescribirá;
- no eliminará ingredientes históricos;
- no cambiará lotes anteriores;
- no se corregirá mediante texto libre sin versión;
- podrá retirarse y reemplazarse mediante una nueva versión vinculada.

##### 16.5. Destinos

- `OPS-REC-001`;
- `FOGO-AUTH-013`;
- `FOGO-UX-008`;
- `FOGO-UX-009`;
- `FOGO-AUTH-016`;
- `OPS-TRZ-001`;
- `TREQ-FOGO-002`.

---

#### 17. CAP-04.06 — Definir rendimientos y porciones

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietaria candidata:** FOGO

##### 17.1. Rendimiento esperado

Deberá declarar:

- cantidad de salida;
- unidad;
- rango o tolerancia;
- merma técnica esperada;
- número de porciones;
- peso o volumen por porción;
- regla de redondeo;
- escala mínima y máxima;
- supuestos;
- versión de receta.

##### 17.2. Escalamiento

El escalamiento deberá definir:

- qué ingredientes escalan linealmente;
- qué ingredientes requieren regla específica;
- cómo se redondean unidades discretas;
- cómo se tratan tiempos y equipos;
- cómo se distribuyen lotes;
- qué límites no pueden excederse;
- cómo se registra una sustitución.

##### 17.3. Resultado real

La ejecución registrará por separado:

- cantidad producida;
- cantidad liberada;
- merma;
- reproceso;
- rechazo;
- porciones reales;
- desviación;
- motivo;
- evidencia.

##### 17.4. Fronteras

- FOGO conserva el resultado productivo;
- NEXO recibe movimientos confirmados;
- NUMERA calcula costo y variación;
- PULSO no modifica rendimiento;
- PASS no consume datos internos salvo información expresamente publicable.

##### 17.5. Destinos

- `OPS-REC-001`;
- `FOGO-UX-005` a `FOGO-UX-013`;
- `INT-PROD-001` a `INT-PROD-005`;
- `CAP-SCOPE-008`;
- `OPS-CST-001`;
- `TREQ-FOGO-001`;
- `TREQ-FOGO-002`.

---

#### 18. CAP-04.07 — Gestionar menús y disponibilidad

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietaria candidata:** PULSO  
**Consumidores:** PASS y canales externos

##### 18.1. Menú y oferta

Se distinguirán:

```text
MENÚ
→ estructura publicada para un alcance

ÍTEM DE MENÚ
→ representación comercial de un producto o variante

OFERTA
→ posibilidad concreta de vender en sede, canal y vigencia

DISPONIBILIDAD
→ estado operacional actual de la oferta
```

##### 18.2. Alcances

Una oferta podrá limitarse por:

- empresa;
- marca;
- sede;
- zona;
- canal;
- terminal;
- horario;
- día;
- modalidad de servicio;
- segmento;
- campaña;
- versión de menú.

##### 18.3. Disponibilidad

La decisión podrá considerar:

- publicación;
- horario;
- configuración de sede;
- canal;
- stock estricto;
- disponibilidad de presentación;
- insumos críticos;
- capacidad productiva;
- calidad;
- mantenimiento;
- bloqueo manual;
- dependencia externa.

El contrato declarará qué señales son obligatorias y cuáles informativas.

##### 18.4. Agotado temporal

Un override manual deberá conservar:

- actor;
- sede;
- canal;
- producto u oferta;
- causa;
- inicio;
- expiración;
- comentario;
- restauración;
- auditoría.

No permanecerá indefinidamente sin revisión.

##### 18.5. PASS

PASS:

- consultará la publicación vigente;
- no mantendrá un catálogo editable independiente;
- no inventará disponibilidad;
- mostrará estado desconocido o desactualizado cuando corresponda;
- conservará el identificador canónico al crear carrito o pedido.

##### 18.6. Canales externos

Cada mapeo externo deberá conservar:

- sistema;
- ambiente;
- identificador externo;
- producto Vento;
- variante;
- presentación;
- receta cuando sea necesaria;
- vigencia;
- estado;
- última conciliación.

Una línea sin mapeo irá a cuarentena y no producirá efectos automáticos de inventario o costo.

##### 18.7. Destinos

- `PULSO-UX-001`;
- `PULSO-UX-007`;
- `PULSO-UX-020`;
- `PULSO-UX-021`;
- `PASS-UX-001`;
- `INT-POS-011`;
- `INT-POS-012`;
- `INT-POS-020`;
- `SHELL-CON-016`;
- `TREQ-INTEGRATION-009`.

---

#### 19. CAP-04.08 — Gestionar información nutricional y alérgenos

**Tratamiento:** `BUILD`  
**Propietaria candidata:** NEXO para producto comprado; FOGO para información derivada de receta; publicación comercial mediante PULSO

##### 19.1. Fuentes

Una declaración podrá provenir de:

- ficha técnica del proveedor;
- etiqueta del fabricante;
- cálculo desde ingredientes;
- cálculo profesional;
- análisis de laboratorio;
- documento regulatorio;
- declaración interna verificada.

La fuente deberá conservarse como evidencia.

##### 19.2. Estados de confianza

```text
NO_REGISTRADO
DECLARADO_POR_PROVEEDOR
CALCULADO
ESTIMADO
VERIFICADO_PROFESIONALMENTE
VERIFICADO_POR_LABORATORIO
VENCIDO
REQUIERE_REVISION
```

La interfaz no presentará todos los estados como equivalentes.

##### 19.3. Alérgenos

La declaración deberá contemplar:

- presencia directa;
- derivado;
- ingrediente compuesto;
- sustitución;
- posible contacto cruzado;
- instalación compartida;
- cambio de proveedor;
- cambio de receta;
- ausencia no verificada.

##### 19.4. Propagación

Un cambio en:

- ingrediente;
- proveedor;
- presentación;
- receta;
- sustitución;
- proceso;
- instalación;
- empaque;

deberá marcar para revisión las declaraciones dependientes.

##### 19.5. Publicación

PULSO y PASS solo publicarán información:

- vigente;
- asociada al producto u oferta correctos;
- con estado permitido;
- con advertencia aplicable;
- sin exponer fórmula confidencial.

##### 19.6. Destinos

- `OPS-REC-001`;
- `CAP-SCOPE-008`;
- `CAP-SCOPE-016`;
- `EVID-ARC-001` a `EVID-ARC-010`;
- `FOGO-AUTH-013`;
- `PULSO-UX-021`;
- `PASS-UX-001`;
- `TREQ-FOGO-002`;
- `TREQ-INTEGRATION-009`.

---

#### 20. CAP-04.09 — Gestionar calidad y especificaciones

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietaria candidata:** NEXO para especificación maestra de producto o presentación; FOGO para especificación productiva y de salida

##### 20.1. Tipos de especificación

- identificación y descripción;
- composición;
- dimensiones o peso;
- tolerancia;
- condición de empaque;
- temperatura;
- conservación;
- vida útil;
- criterio sensorial;
- criterio de aceptación;
- fotografía o patrón;
- documento técnico;
- requisito de proveedor;
- requisito productivo;
- requisito de liberación.

##### 20.2. Objeto

Cada especificación indicará si aplica a:

- materia prima;
- producto;
- presentación;
- proveedor específico;
- preparación intermedia;
- receta;
- producto terminado;
- empaque.

##### 20.3. Uso

- ORIGO y recepción consultarán criterios aplicables;
- FOGO aplicará controles productivos;
- NEXO conservará condición física e inventario;
- CAP-08 gestionará inspección, liberación, retención o rechazo;
- CAP-03 gestionará la dimensión SST o inocuidad que corresponda;
- CAP-13 gestionará equipos e instalaciones.

##### 20.4. Vigencia

Una nueva especificación:

- no alterará recepciones o lotes anteriores;
- conservará versión;
- tendrá fecha efectiva;
- podrá coexistir durante transición controlada;
- declarará productos, presentaciones y proveedores afectados.

##### 20.5. Destinos

- `OPS-REC-001`;
- `CAP-SCOPE-005`;
- `CAP-SCOPE-008`;
- `CAP-SCOPE-013`;
- `OPS-TRZ-001`;
- `EVID-ARC-001` a `EVID-ARC-010`;
- `TREQ-SUPABASE-012`;
- `TREQ-FOGO-002`.

---

#### 21. CAP-04.10 — Gestionar cambios y vigencia del conocimiento

**Tratamiento:** `BUILD`  
**Propietario:** cada aplicación sobre su conocimiento; coordinación transversal mediante contratos y eventos de SHELL

##### 21.1. Ciclo mínimo

```text
SOLICITUD DE CAMBIO
→ BORRADOR
→ REVISIÓN
→ APROBACIÓN
→ PUBLICACIÓN PROGRAMADA
→ VIGENCIA
→ SUPERSESIÓN O RETIRO
→ VERIFICACIÓN DE CONSUMIDORES
```

##### 21.2. Cambio

Cada cambio conservará:

- objeto;
- versión anterior;
- versión nueva;
- motivo;
- solicitante;
- revisor;
- aprobador;
- fecha efectiva;
- consumidores afectados;
- migración o backfill si aplica;
- evidencia;
- rollback;
- estado de propagación.

##### 21.3. Impacto

Se deberá calcular o declarar impacto sobre:

- inventario;
- compras;
- recetas;
- lotes;
- costos;
- menús;
- pedidos;
- etiquetas;
- alérgenos;
- nutrición;
- canales externos;
- reportes;
- documentos;
- capacitación.

##### 21.4. Coordinación

Ningún cambio se considerará completado solo porque se guardó en la aplicación propietaria.

Deberá comprobarse:

- publicación;
- consumo;
- invalidación de caché;
- sincronización;
- tratamiento offline;
- compatibilidad;
- conciliación;
- retiro de fuente anterior.

##### 21.5. Destinos

- `SHELL-CON-001`;
- `SHELL-CON-016`;
- `SUPA-TRANS-007`;
- `SUPA-TRANS-012`;
- `INT-APP-010`;
- `INT-DB-008`;
- `SHELL-CI-001` a `SHELL-CI-019`;
- `READY-GATE-005`;
- `TREQ-SUPABASE-012`;
- `TREQ-INTEGRATION-009`.

---

#### 22. Fronteras con otros dominios

##### 22.1. Compras

`CAP-05` gobierna:

- proveedor;
- oferta;
- negociación;
- orden;
- recepción comercial;
- devolución.

`CAP-04` gobierna:

- identidad del producto;
- presentación canónica;
- unidad;
- especificación.

Una presentación de proveedor se mapeará a una presentación canónica o quedará pendiente de validación.

##### 22.2. Inventario

`CAP-06` gobierna:

- existencia;
- ubicación;
- lote;
- movimiento;
- vencimiento;
- conteo;
- ajuste.

`CAP-04` gobierna qué es el elemento y cómo se mide. La existencia no redefine producto ni receta.

##### 22.3. Producción

`CAP-08` gobierna:

- necesidad;
- orden;
- lote;
- ejecución;
- consumo;
- merma;
- resultado;
- liberación.

`CAP-04` gobierna la receta y conocimiento utilizado.

##### 22.4. Venta

`CAP-09` gobierna:

- precio;
- pedido;
- línea;
- descuento;
- pago;
- caja;
- anulación;
- devolución.

`CAP-04.07` gobierna la estructura de menú, oferta y disponibilidad que la venta consume.

##### 22.5. Clientes

`CAP-10` gobierna experiencia, relación y reclamo. PASS no modifica el producto maestro ni la receta.

##### 22.6. Costos

`CAP-12` calcula y registra costo, margen y efecto económico. No modifica unidades, receta o rendimiento para ajustar el resultado financiero.

##### 22.7. Documentos y evidencia

`CAP-16` gobierna conservación, acceso y evidencia. La aplicación propietaria conserva el hecho y referencia sus documentos.

---

#### 23. Información conceptual requerida

##### 23.1. Producto

- identidad;
- código;
- tipo;
- roles;
- estado;
- vigencia;
- nombre interno;
- nombre comercial;
- marca;
- descripción;
- propietario;
- taxonomías;
- configuración por sede;
- referencias externas.

##### 23.2. Presentación y medición

- dimensión;
- unidad;
- precisión;
- perfil;
- factor;
- tolerancia;
- empaque;
- código;
- uso;
- vigencia.

##### 23.3. Receta

- identidad;
- versión;
- salida;
- ingredientes;
- unidades;
- pasos;
- equipos;
- controles;
- rendimiento;
- porción;
- conservación;
- alérgenos;
- sensibilidad;
- aprobación;
- vigencia.

##### 23.4. Menú y oferta

- menú;
- sección;
- ítem;
- producto o variante;
- sede;
- canal;
- horario;
- configuración;
- disponibilidad;
- publicación;
- referencia de precio;
- mapeo externo.

##### 23.5. Calidad, nutrición y alérgenos

- objeto;
- versión;
- fuente;
- método;
- valores;
- unidad;
- estado;
- advertencia;
- evidencia;
- responsable;
- vigencia.

---

#### 24. Eventos e integraciones requeridos

Eventos conceptuales candidatos:

```text
catalog.item.created
catalog.item.updated
catalog.item.suspended
catalog.item.discontinued
catalog.presentation.published
catalog.measurement.changed
catalog.taxonomy.assignment.changed
recipe.version.submitted
recipe.version.approved
recipe.version.published
recipe.version.superseded
recipe.version.withdrawn
product.specification.published
product.allergen.review.required
menu.published
offer.published
offer.suspended
offer.availability.changed
external_product_mapping.changed
```

Cada evento deberá incluir:

- identificador;
- versión;
- productor;
- actor;
- instante;
- objeto;
- versión anterior y nueva cuando corresponda;
- alcance;
- causa;
- correlación;
- contrato;
- resultado esperado de consumidores.

##### 24.1. Integraciones obligatorias

- NEXO → FOGO: producto, presentación, unidad y configuración aplicable;
- FOGO → NEXO: producto terminado, consumos y versión de receta;
- FOGO → NUMERA: rendimiento y hechos productivos confirmados;
- PULSO → PASS: menú y oferta publicadas;
- PULSO ↔ POS externo: mapeo de producto, presentación y receta;
- ORIGO → NEXO: presentación de proveedor aceptada;
- propietarios → VISO: estado administrativo y enlaces;
- todas → SHELL: contratos, eventos, autorización y observabilidad.

---

#### 25. Autorización y segregación

##### 25.1. Capacidades separadas

Como mínimo se distinguirán:

- consultar catálogo;
- crear producto;
- editar borrador;
- activar;
- suspender;
- retirar;
- administrar unidades;
- administrar presentaciones;
- administrar taxonomías;
- crear receta;
- editar receta borrador;
- revisar receta;
- aprobar receta;
- publicar receta;
- retirar receta;
- ver recetario;
- ver fórmula sensible;
- administrar especificación;
- administrar alérgenos;
- publicar información comercial;
- administrar menú;
- cambiar disponibilidad;
- ejecutar override de agotado;
- mapear producto externo.

##### 25.2. Segregación

Cuando el riesgo lo exija:

```text
CREAR
≠ APROBAR
≠ PUBLICAR
```

No todo cambio requerirá tres personas diferentes, pero el contrato deberá permitir:

- separación;
- aprobación reforzada;
- motivo;
- auditoría;
- doble control para cambios críticos.

##### 25.3. Alcance

La autorización deberá considerar:

- aplicación;
- tipo de conocimiento;
- empresa;
- sede;
- área;
- categoría;
- producto;
- receta;
- sensibilidad;
- estado;
- acción.

##### 25.4. Fórmulas sensibles

El acceso a cantidades completas o formulaciones reservadas podrá ser más restringido que:

- ver el producto;
- ver alérgenos;
- ejecutar un paso;
- consultar una instrucción operativa;
- consultar el recetario.

La restricción no deberá impedir que el trabajador reciba información de seguridad necesaria.

##### 25.5. Dispositivo compartido y simulación

- la edición administrativa no se realizará desde una estación compartida salvo diseño expreso;
- el recetario operativo podrá mostrarse bajo límites del dispositivo y actor;
- la simulación no publicará ni retirará conocimiento;
- toda modificación conservará actor real;
- URL o RPC directa no ampliará permiso.

---

#### 26. Experiencia por aplicación

##### 26.1. NEXO

Deberá separar:

- catálogo maestro;
- medición;
- presentaciones;
- proveedores;
- configuración por sede;
- clasificación;
- especificaciones;
- operación de inventario.

La pantalla maestra no mezclará en un único formulario todas las configuraciones comerciales, productivas y financieras.

##### 26.2. FOGO administrativo

Deberá permitir:

- crear y versionar;
- comparar versiones;
- revisar impacto;
- validar ingredientes;
- definir pasos;
- definir rendimiento;
- gestionar evidencia;
- aprobar;
- publicar;
- retirar.

##### 26.3. FOGO operativo

El recetario deberá:

- mostrar la versión vigente;
- mostrar sede, área y salida;
- presentar pasos en orden;
- minimizar lectura;
- mostrar controles críticos;
- diferenciar información obligatoria y apoyo;
- funcionar en dispositivo real;
- evitar exposición innecesaria de administración;
- conservar versión si opera temporalmente offline.

##### 26.4. PULSO

Deberá administrar:

- menús;
- secciones;
- ofertas;
- disponibilidad;
- horarios;
- sede;
- canal;
- configuración vendible;
- overrides temporales;
- mapeos con venta.

##### 26.5. PASS

Deberá:

- mostrar publicación vigente;
- usar datos comerciales;
- mostrar disponibilidad y advertencias;
- no exponer datos internos;
- conservar identidad al pedir;
- tratar caché y pérdida de red de forma explícita.

##### 26.6. VISO

Deberá mostrar:

- aplicación propietaria;
- estado;
- última publicación;
- incidencias;
- enlace administrativo;
- impacto transversal.

No guardará una copia competidora.

---

#### 27. Operación offline y contingencia

##### 27.1. Recetario

Cuando se permita uso offline:

- solo se almacenarán versiones publicadas;
- se conservará identificador y versión;
- se mostrará fecha de sincronización;
- no se sustituirá silenciosamente una versión;
- se invalidará cuando exista retiro crítico;
- se definirá contingencia cuando no pueda comprobarse vigencia;
- el acceso seguirá protegido en el dispositivo.

##### 27.2. Menú y disponibilidad

Ante pérdida de conectividad:

- PULSO y PASS distinguirán dato confirmado de caché;
- un estado desconocido no se presentará como disponible;
- los overrides pendientes mostrarán su condición;
- la recuperación conciliará cambios;
- no se duplicarán publicaciones ni acciones;
- se conservará el último estado conocido con timestamp.

##### 27.3. Administración

La edición offline de catálogo, recetas o menús no queda autorizada por esta tarea. Si se diseña posteriormente deberá usar versión, conflicto, idempotencia y reconciliación.

---

#### 28. Evidencia, conservación y auditoría

Cada cambio deberá conservar, según aplique:

- actor;
- aplicación;
- objeto;
- versión;
- antes;
- después;
- motivo;
- aprobación;
- fecha efectiva;
- evidencia;
- consumidores;
- resultado de propagación;
- error;
- rollback;
- conciliación.

Los archivos deberán seguir la arquitectura de evidencia aprobada y no residir en buckets públicos por conveniencia.

---

#### 29. Patrones legacy destinados a retiro

Se deberán retirar progresivamente, con evidencia y compatibilidad:

- productos duplicados por aplicación;
- productos duplicados por sede;
- ingredientes escritos únicamente como texto;
- unidades libres;
- factores de conversión predeterminados por ausencia de datos;
- cadenas de conversión incompatibles;
- categorías usadas para varias semánticas;
- categorías comerciales dentro de NEXO como fuente operativa;
- catálogo editable propio de PASS;
- configuración comercial duplicada en VISO;
- menús hardcodeados;
- disponibilidad derivada solo de `is_active`;
- recetas publicadas editadas en sitio;
- lotes que no conservan versión de receta;
- nutrición o alérgenos sin fuente;
- eliminación física de productos usados;
- mapeos externos por nombre;
- fallbacks que ocultan datos incompletos.

`RETIRE` aplica a estos patrones, no a las subcapacidades empresariales.

---

#### 30. Preguntas pendientes reutilizadas

No se crean preguntas nuevas.

| Pregunta | Uso dentro de esta tarea                                             | Puerta de resolución                                |
| -------- | -------------------------------------------------------------------- | --------------------------------------------------- |
| `DAT-03` | confirmar granularidad real de producto vendido en exportación Makos | `INT-POS-001` a `INT-POS-011`                       |
| `DAT-04` | confirmar fuente operativa usada para disponibilidad de producto     | `CAP-SCOPE-006` y validación de NEXO                |
| `TEC-06` | evidencia de estructuras actuales de inventario                      | `SUPA-AUD-019` y `CAP-SCOPE-006`                    |
| `TEC-08` | evidencia de estructuras actuales de recetas y producción            | `OPS-REC-001` y `CAP-SCOPE-008`                     |
| `TEC-18` | evidencia de contratos duplicados de producto entre aplicaciones     | `SHELL-CON-001`, `SHELL-CON-016` y `SUPA-TRANS-007` |

Las decisiones conceptuales de esta tarea no dependen de que estas preguntas queden respondidas inmediatamente. Sus respuestas sí serán obligatorias antes de migrar datos, integrar el POS o aprobar readiness.

---

#### 31. Riesgos principales

| Riesgo                                | Severidad | Control principal                       |
| ------------------------------------- | --------- | --------------------------------------- |
| producto duplicado entre aplicaciones | crítica   | identidad maestra y propiedad funcional |
| conversión incompatible               | crítica   | perfil y factor canónicos               |
| receta histórica alterada             | crítica   | versión inmutable                       |
| lote sin receta exacta                | crítica   | snapshot y referencia de versión        |
| ingrediente libre o ambiguo           | alta      | referencia a catálogo                   |
| alérgeno incorrecto                   | crítica   | fuente, revisión y propagación          |
| menú divergente entre canales         | alta      | publicación única desde PULSO           |
| venta de producto no disponible       | alta      | política explícita de disponibilidad    |
| producto activo pero no vendible      | alta      | roles y oferta separados                |
| producto retirado borrado             | crítica   | retiro no destructivo                   |
| precio o costo usado como identidad   | alta      | separación de dominios                  |
| VISO como catálogo paralelo           | alta      | enlace al propietario                   |
| mapeo externo por nombre              | crítica   | identificadores y cuarentena            |
| receta sensible expuesta              | alta      | permiso contextual                      |
| cambio sin propagación                | crítica   | evento, conciliación y evidencia        |

---

#### 32. Hallazgos y destinos canónicos

| ID                    | Hallazgo                                                                                            | Riesgo  | Tarea propietaria                                                      | Momento                                    |
| --------------------- | --------------------------------------------------------------------------------------------------- | ------- | ---------------------------------------------------------------------- | ------------------------------------------ |
| `H-CAP-SCOPE-004-001` | producto, variante, presentación, unidad y oferta no tienen todavía separación contractual completa | crítica | `SUPA-AUD-019`; `SHELL-CON-001`; `SHELL-CON-016`                       | E3 antes de migrar catálogo                |
| `H-CAP-SCOPE-004-002` | existen contratos y tipos de producto repetidos entre NEXO, FOGO, ORIGO, PULSO y NUMERA             | crítica | `SUPA-AUD-019`; `SUPA-TRANS-007`; `SHELL-CON-001`                      | E3                                         |
| `H-CAP-SCOPE-004-003` | perfiles, unidades, presentaciones y precedencias pueden producir resultados incompatibles          | crítica | `BKL-NEXO-006`; `DATA-NORM-AUD-004`; `SUPA-TRANS-005`                  | antes de modificar inventario o producción |
| `H-CAP-SCOPE-004-004` | categorías operativas y comerciales pueden mezclarse o duplicarse                                   | alta    | `NEXO-AUTH-014`; `PULSO-UX-021`; `VISO-UX-017`                         | E2                                         |
| `H-CAP-SCOPE-004-005` | no está demostrado un ciclo inmutable completo de versiones de receta                               | crítica | `OPS-REC-001`; `FOGO-UX-009`; `FOGO-AUTH-013`                          | E2 antes de ampliar producción             |
| `H-CAP-SCOPE-004-006` | ingredientes y preparaciones pueden conservar relaciones o nombres competidores                     | alta    | `OPS-REC-001`; `SUPA-AUD-019`; `DATA-NORM-AUD-004`                     | E2/E3                                      |
| `H-CAP-SCOPE-004-007` | rendimiento esperado, porción, merma técnica y resultado real no tienen todavía contrato cerrado    | alta    | `OPS-REC-001`; `FOGO-UX-010`; `CAP-SCOPE-008`                          | E2                                         |
| `H-CAP-SCOPE-004-008` | menú, oferta y disponibilidad están distribuidos entre varias aplicaciones                          | crítica | `PULSO-UX-001`; `PULSO-UX-021`; `PASS-UX-001`; `SHELL-CON-016`         | E2                                         |
| `H-CAP-SCOPE-004-009` | disponibilidad puede confundirse con activo, stock o visibilidad                                    | alta    | `PULSO-UX-021`; `CAP-SCOPE-009`; `CAP-SCOPE-018`                       | E2                                         |
| `H-CAP-SCOPE-004-010` | información nutricional y alérgenos no tienen gobierno integral comprobado                          | crítica | `OPS-REC-001`; `CAP-SCOPE-008`; `CAP-SCOPE-016`                        | E2 antes de publicación                    |
| `H-CAP-SCOPE-004-011` | especificaciones de calidad existen solo de forma parcial o dispersa                                | alta    | `OPS-REC-001`; `CAP-SCOPE-005`; `CAP-SCOPE-008`                        | E2                                         |
| `H-CAP-SCOPE-004-012` | cambios de producto, receta y menú no tienen vigencia coordinada entre consumidores                 | crítica | `SUPA-TRANS-007`; `INT-APP-010`; `INT-DB-008`                          | E3/E4                                      |
| `H-CAP-SCOPE-004-013` | el POS externo requiere mapeo explícito hacia producto, presentación y receta                       | crítica | `INT-POS-011`; `INT-POS-012`; `INT-POS-020`                            | antes de habilitar efectos                 |
| `H-CAP-SCOPE-004-014` | VISO puede actuar como superficie administrativa sin frontera suficiente de propiedad               | alta    | `VISO-UX-017`; `VISO-UX-018`; `SHELL-CON-016`                          | E2                                         |
| `H-CAP-SCOPE-004-015` | el retiro o cambio puede romper referencias históricas si se elimina información                    | crítica | `SUPA-TRANS-012`; `DATA-NORM-AUD-004`; `EVID-ARC-001` a `EVID-ARC-010` | E3                                         |
| `H-CAP-SCOPE-004-016` | no existe prueba transversal de paridad del catálogo y menú entre todos los consumidores            | alta    | `SHELL-CI-001` a `SHELL-CI-019`; `UX-QA-025`; `UX-QA-027`; `UX-QA-029` | E5 y BLOQUE U                              |

Todos los hallazgos tienen propietario y puerta. No queda pendiente narrativo sin destino.

---

#### 33. Decisiones canónicas resultantes

1. NEXO conserva la candidatura de fuente maestra de identidad de producto, presentación y medición.
2. FOGO conserva la propiedad de receta, método, rendimiento, porción y ejecución productiva.
3. PULSO conserva la propiedad de menú, oferta y disponibilidad comercial.
4. PASS será consumidor de la publicación comercial, no catálogo maestro.
5. ORIGO conservará condiciones de compra y referencias del proveedor sin recrear producto.
6. NUMERA consumirá costos y resultados sin modificar el conocimiento de producto.
7. VISO actuará como superficie administrativa y de enlace, no como propietario implícito.
8. Producto, variante, presentación, unidad, receta, versión e ítem de menú serán conceptos distintos.
9. Un producto podrá tener roles múltiples sin duplicación.
10. Los servicios no heredarán inventario artificial.
11. Las taxonomías se separarán por propósito.
12. Los ingredientes deberán referenciar identidades canónicas.
13. Las preparaciones intermedias serán productos de primera clase.
14. Las recetas publicadas serán inmutables.
15. Cada lote conservará la versión efectivamente utilizada.
16. Rendimiento esperado y real se conservarán por separado.
17. Menú, oferta y disponibilidad tendrán estados distintos.
18. Stock no implicará automáticamente disponibilidad.
19. Nutrición y alérgenos exigirán fuente y estado de verificación.
20. Las especificaciones tendrán objeto, versión y vigencia.
21. El retiro será no destructivo.
22. Los cambios deberán propagarse y verificarse en consumidores.
23. Los mapeos externos usarán identificadores, no nombres.
24. Las líneas externas no mapeadas quedarán en cuarentena.
25. La familia `CAP-04` se considera existente y reutilizable, pero no cerrada.

---

#### 34. Requisitos de prueba derivados

Esta tarea genera tres requisitos distintos y no duplicados:

```text
TREQ-SUPABASE-012
TREQ-FOGO-002
TREQ-INTEGRATION-009
```

Los detalles completos se incorporan exclusivamente en el archivo canónico `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` regenerado.

No se entregan filas independientes.

##### 34.1. `TREQ-SUPABASE-012`

Protege:

- separación entre entidades de catálogo;
- identificadores y relaciones estables;
- integridad referencial;
- retiro no destructivo;
- versiones y vigencias;
- historia de referencias.

##### 34.2. `TREQ-FOGO-002`

Protege:

- receta publicada inmutable;
- versión exacta por lote;
- ingredientes y unidades canónicos;
- escalamiento;
- rendimiento y porción;
- alérgenos y especificaciones;
- acceso contextual.

##### 34.3. `TREQ-INTEGRATION-009`

Protege:

- propiedad única de menú y oferta;
- paridad PULSO/PASS/canales;
- disponibilidad con causa;
- mapeos externos;
- propagación y conciliación;
- ausencia de catálogos competidores.

---

#### 35. Dependencias habilitadas y restricciones

`CAP-SCOPE-004` habilita conceptualmente:

- `CAP-SCOPE-005`;
- `CAP-SCOPE-006`;
- `CAP-SCOPE-008`;
- `CAP-SCOPE-009`;
- `CAP-SCOPE-012`;
- `CAP-SCOPE-016`;
- `CAP-SCOPE-017`;
- `OPS-REC-001`;
- `OPS-PRD-001`;
- `OPS-TRZ-001`;
- diseño TO-BE de FOGO;
- contrato de productos y eventos;
- auditoría y transición de Supabase;
- mapeo del POS externo;
- paquetes E5 de NEXO, FOGO, PULSO y PASS.

No autoriza:

- migración;
- refactor;
- publicación;
- modificación de recetas;
- cambio de menú;
- activación de inventario;
- integración de POS;
- cálculo o publicación nutricional;
- eliminación de productos.

---

#### 36. Criterios de aceptación

`CAP-SCOPE-004` podrá aprobarse cuando:

1. las diez subcapacidades tengan tratamiento explícito;
2. producto, variante, presentación, unidad, receta e ítem de menú estén separados;
3. exista propietario candidato por resultado;
4. NEXO, FOGO, PULSO, PASS, ORIGO, NUMERA y VISO tengan fronteras explícitas;
5. la receta se defina como conocimiento versionado;
6. el lote conserve la versión usada;
7. rendimiento esperado y real se separen;
8. menú, oferta y disponibilidad se distingan;
9. stock no se trate como única causa de disponibilidad;
10. nutrición y alérgenos exijan fuente;
11. calidad y especificaciones tengan objeto y vigencia;
12. el retiro sea no destructivo;
13. los cambios tengan ciclo y propagación;
14. los dieciséis hallazgos tengan destino;
15. no se creen preguntas narrativas sin dueño;
16. se generen los tres requisitos de prueba;
17. el registro `04A` completo tenga 89 requisitos válidos;
18. ninguna fila del registro tenga más o menos de catorce columnas;
19. no se autorice implementación;
20. la continuidad quede en `CAP-SCOPE-005`.

---

#### 37. Resultado y continuidad

**Estado:** PROPUESTA PARA APROBACIÓN

Al aprobarse:

- `CAP-SCOPE-004` será la decisión canónica de cobertura para producto, presentación, unidad, receta, menú y conocimiento asociado;
- `TREQ-SUPABASE-012`, `TREQ-FOGO-002` y `TREQ-INTEGRATION-009` quedarán incorporados al registro canónico;
- NEXO, FOGO y PULSO conservarán propiedades diferenciadas;
- PASS, ORIGO, NUMERA y VISO quedarán como consumidores o superficies según sus fronteras;
- ninguna implementación física quedará autorizada;
- la continuidad será:

```text
CAP-SCOPE-005 — Evaluar compras, proveedores, contratos, precios y abastecimiento
```


### ✅ CAP-SCOPE-005 — Evaluar compras, proveedores, contratos, precios y abastecimiento

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Dependencia cumplida:** `CAP-SCOPE-004` aprobada  
**Tarea anterior:** `CAP-SCOPE-004`  
**Siguiente tarea reservada:** `CAP-SCOPE-006`  
**Familia evaluada:** `CAP-05 — Abastecer la operación`  
**Naturaleza:** decisión de cobertura empresarial y definición conceptual objetivo  
**Implementación técnica:** no autorizada  
**Migraciones o cambios en Supabase:** no autorizados  
**Compras, aprobaciones, recepciones o devoluciones reales:** no autorizadas  
**Requisitos de prueba generados:** `TREQ-ORIGO-004`, `TREQ-ORIGO-005`, `TREQ-INTEGRATION-010`  
**Actualización del registro de pruebas:** se entrega el archivo `04A` completo regenerado; quedan prohibidas las filas sueltas

---

#### 1. Propósito

Definir el tratamiento objetivo de las capacidades mediante las cuales Vento Group deberá:

- convertir señales de demanda, faltantes, producción, ventas y mínimos en necesidades trazables de abastecimiento;
- distinguir una necesidad de compra, una solicitud, un caso de abastecimiento, una cotización, una oferta, una condición acordada, un contrato, una orden de compra, una recepción y una obligación financiera;
- conservar un maestro único de proveedores con identidad, estado, sedes, contactos, documentos y restricciones;
- relacionar cada proveedor con productos, servicios, presentaciones de compra, cantidades mínimas, tiempos, precios y condiciones versionadas;
- solicitar, recibir y comparar ofertas sin reducir la decisión al precio más bajo;
- registrar negociaciones y acuerdos sin intentar automatizar la interacción humana;
- aplicar políticas de aprobación por empresa, sede, centro de costo, categoría, monto, riesgo y urgencia;
- emitir órdenes con revisión, vigencia, aceptación, cancelación y trazabilidad;
- recibir bienes y servicios contra la orden aprobada, incluyendo recepciones parciales, diferencias, lotes, vencimientos, calidad y documentos;
- vincular la recepción empresarial de ORIGO con la entrada física de NEXO y el hecho económico de NUMERA sin doble digitación ni doble efecto;
- gestionar rechazos, devoluciones, reclamaciones, notas y regularizaciones sin borrar la operación original;
- medir cumplimiento de proveedores mediante hechos verificables;
- permitir compras urgentes por un carril abreviado controlado, nunca mediante bypass invisible;
- preservar contratos, cotizaciones, precios, datos tributarios, datos bancarios y evidencia con acceso mínimo y auditoría.

La existencia de proveedores, órdenes o recibos parciales en la implementación actual no permite considerar cubierta la familia `CAP-05`. La cobertura exige que la necesidad, decisión, orden, recepción, inventario, costo y evidencia formen una cadena única y reconciliable.

---

#### 2. Pregunta de decisión

`CAP-SCOPE-005` responde:

```text
¿CÓMO SE CONVIERTE UNA NECESIDAD REAL DE LA OPERACIÓN
EN UNA COMPRA AUTORIZADA, CON PROVEEDOR Y CONDICIONES VIGENTES,
Y CÓMO SE CONFIRMA SU ENTREGA, INVENTARIO, COSTO Y CUMPLIMIENTO
SIN DOBLE DIGITACIÓN, CAMBIOS DESTRUCTIVOS, APROBACIONES IMPLÍCITAS
NI FUENTES COMPETIDORAS ENTRE ORIGO, NEXO Y NUMERA?
```

La tarea rechaza equivalencias incorrectas como:

```text
NECESIDAD = ORDEN DE COMPRA
```

```text
SOLICITUD = APROBACIÓN
```

```text
PROVEEDOR = CONTACTO
```

```text
RELACIÓN PRODUCTO–PROVEEDOR = PRECIO VIGENTE
```

```text
COTIZACIÓN = CONTRATO
```

```text
CONTRATO = PRECIO ETERNO
```

```text
ORDEN ENVIADA = ORDEN RECIBIDA
```

```text
RECIBIR DOCUMENTO = INGRESAR INVENTARIO
```

```text
RECIBIR SERVICIO = CREAR STOCK
```

```text
PRECIO MÁS BAJO = MEJOR DECISIÓN
```

```text
COMPRA URGENTE = COMPRA SIN CONTROL
```

```text
CORREGIR = SOBRESCRIBIR HISTORIA
```

---

#### 3. Fuentes consolidadas

- `OPS-AUD-001` a `OPS-AUD-015`;
- `CAP-MAP-001` a `CAP-MAP-015`;
- `CODE-AUD-001` a `CODE-AUD-020`;
- `CAP-SCOPE-001` a `CAP-SCOPE-004`;
- `QA-REG-001` y el Registro Canónico de Requisitos de Prueba;
- `REGISTRO_VIVO_DE_PREGUNTAS_PENDIENTES`, especialmente `DAT-06`, `DAT-07`, `OPE-05`, `TEC-07` y `TEC-18`;
- la implementación vigente de ORIGO: proveedores, órdenes, edición de borrador, PDF, estados base, rutas iniciales de recibo y enlace hacia NEXO;
- la implementación vigente de NEXO: catálogo maestro, proveedores por producto, presentaciones físicas, mínimos, stock, LOC, entradas y recepción operativa;
- las estructuras actuales `suppliers`, `product_suppliers`, `purchase_orders`, `purchase_order_items`, `purchase_receptions`, `procurement_*`, `inventory_entries` y relacionadas;
- las tareas `ORIGO-AUTH-001` a `ORIGO-AUTH-015` y `ORIGO-UX-001` a `ORIGO-UX-016`;
- los contratos `INT-PROC-001` a `INT-PROC-005`;
- `NUMERA-DOM-003`, `NUMERA-DOM-010`, `NUMERA-DOM-014`, `NUMERA-UX-018` y fronteras contables futuras;
- las decisiones de autorización, segregación, privacidad, Storage, idempotencia, evidencia, integración y transición ya aprobadas.

Las respuestas y evidencias ya documentadas no se vuelven a solicitar.

---

#### 4. Alcance evaluado

- `CAP-05.01` — Planear necesidades de abastecimiento;
- `CAP-05.02` — Solicitar productos, materiales o servicios;
- `CAP-05.03` — Buscar y evaluar proveedores;
- `CAP-05.04` — Solicitar y comparar ofertas;
- `CAP-05.05` — Negociar condiciones;
- `CAP-05.06` — Aprobar compras;
- `CAP-05.07` — Emitir y controlar órdenes;
- `CAP-05.08` — Recibir productos y servicios;
- `CAP-05.09` — Verificar cantidades, calidad y documentos;
- `CAP-05.10` — Gestionar diferencias y devoluciones;
- `CAP-05.11` — Evaluar cumplimiento de proveedores;
- `CAP-05.12` — Gestionar compras urgentes;

También fija fronteras para catálogo, inventario, producción, ventas, costos, cuentas por pagar, documentos, cumplimiento, analítica y continuidad.

---

#### 5. Fuera de alcance

- crear, editar, aprobar, enviar, recibir, rechazar o cancelar operaciones reales;
- seleccionar proveedores reales o negociar condiciones comerciales concretas;
- definir montos, personas o umbrales finales de aprobación;
- registrar cuentas bancarias o datos tributarios reales;
- aprobar contratos jurídicos;
- sustituir revisión legal, tributaria, contable, sanitaria o de calidad;
- pagar proveedores;
- implementar cuentas por pagar o contabilidad completa;
- crear inventario por la sola existencia de una factura;
- crear obligaciones financieras por una orden no recibida salvo política explícita;
- crear tablas, vistas, RPC, buckets, políticas RLS, eventos o migraciones;
- migrar historia de compras;
- autorizar recepción física sin actor, sede, LOC o evidencia;
- convertir NEXO en propietario de la compra;
- convertir NUMERA en propietario de la orden o recepción;
- convertir VISO en propietario implícito por exponer una pantalla administrativa.

---

#### 6. Principios canónicos

##### 6.1. La necesidad precede a la compra

Una señal de stock, producción, venta, mantenimiento, proyecto o solicitud humana podrá originar una necesidad.

La necesidad no será todavía una autorización para comprometer dinero.

Toda necesidad conservará origen, fecha, producto o servicio, cantidad, sede, área, centro de costo, prioridad y responsable.

##### 6.2. Demanda, solicitud, abastecimiento, orden y recepción son expedientes distintos

Cada concepto tendrá identidad y estado propios.

La trazabilidad permitirá recorrer el ciclo completo sin duplicar la información.

Una orden podrá consolidar varias solicitudes y una solicitud podrá dividirse entre varios proveedores cuando la decisión lo justifique.

##### 6.3. El proveedor será una identidad empresarial, no un texto

El proveedor tendrá identificador estable, razón social o identidad aplicable, estado, identificadores tributarios, contactos, sedes, documentos y relaciones.

Un contacto, vendedor, sucursal o cuenta bancaria no será el proveedor mismo.

Los cambios no crearán duplicados por diferencias ortográficas.

##### 6.4. El maestro de proveedores tendrá una sola propiedad

ORIGO será propietario del expediente de proveedor.

NEXO podrá consumir relaciones producto–proveedor y presentaciones de compra.

NUMERA podrá consumir datos mínimos para obligaciones y pagos.

Ningún consumidor mantendrá una copia editable independiente.

##### 6.5. Relación producto–proveedor, oferta y contrato son conceptos distintos

La relación declara que un proveedor puede suministrar un producto o servicio.

La oferta declara condiciones propuestas en un periodo.

El contrato o acuerdo declara obligaciones y condiciones aprobadas.

El precio aplicable será una versión con vigencia y fuente.

##### 6.6. El precio tendrá contexto completo

Todo precio deberá identificar proveedor, producto o servicio, presentación, unidad, cantidad mínima, escala, moneda, impuestos, descuentos, flete, plazo de pago, vigencia y fuente.

Un precio nuevo no sobrescribirá el precio utilizado por órdenes históricas.

La orden conservará un snapshot de las condiciones efectivamente aprobadas.

##### 6.7. La comparación no se reducirá al menor precio

La decisión podrá considerar calidad, disponibilidad, tiempo de entrega, presentación, cantidad mínima, confiabilidad, crédito, ubicación, riesgo y costo total.

Los criterios y ponderaciones deberán ser visibles cuando se utilicen.

Una selección manual conservará justificación.

##### 6.8. La negociación seguirá siendo humana y controlada

Vento OS no sustituirá conversaciones, llamadas o negociación jurídica.

El sistema registrará versiones de ofertas, acuerdos alcanzados, responsables, vigencia y evidencia.

La ausencia de automatización no autoriza conservar la decisión únicamente en chats personales.

##### 6.9. La aprobación será una decisión explícita

Crear, editar o enviar una orden no equivaldrá a aprobarla.

Las políticas podrán depender de empresa, sede, centro de costo, categoría, importe, presupuesto, riesgo, contrato y urgencia.

Toda aprobación o rechazo conservará actor, alcance, regla, comentario y timestamp.

##### 6.10. La segregación de funciones será obligatoria

Solicitante, comprador, aprobador y receptor serán funciones distintas aunque una persona pueda acumularlas solo mediante política aprobada.

El receptor no aprobará la compra por el solo hecho de recibir.

El comprador no podrá autoaprobar fuera de una excepción explícita y auditada.

##### 6.11. Una orden enviada será versionada, no sobrescrita

La edición libre terminará al aprobarse o enviarse la orden.

Un cambio posterior producirá revisión, enmienda o cancelación vinculada.

Proveedor y consumidores podrán identificar qué revisión es vigente.

##### 6.12. ORIGO conservará el expediente empresarial de recepción

La recepción declarará contra qué orden, revisión y líneas se ejecuta.

Conservará cantidad aceptada, rechazada, pendiente, diferencia, documento, actor y resultado.

La recepción podrá ser parcial y múltiples recepciones podrán cerrar una misma orden.

##### 6.13. NEXO conservará el efecto físico sobre inventario

La entrada a stock, lote, vencimiento, LOC, condición y movimiento pertenecen a NEXO.

NEXO no creará una compra paralela.

ORIGO no escribirá directamente proyecciones de stock mediante formularios propios.

##### 6.14. Los servicios tendrán aceptación sin inventario artificial

Una compra de servicio podrá requerir acta, periodo, entregable, evidencia y aceptación.

No generará LOC, lote ni stock.

El hecho económico se emitirá solo según la política aprobada de aceptación y documentos.

##### 6.15. Recibir, inspeccionar y contabilizar no son el mismo evento

La llegada física podrá quedar pendiente de inspección.

La aceptación podrá diferir de la cantidad entregada.

El ingreso de inventario y el evento económico conservarán la relación con el resultado de inspección.

##### 6.16. Las diferencias no se corregirán borrando

Faltante, sobrante, sustitución, daño, vencimiento, precio distinto, documento faltante y calidad no conforme serán diferencias tipadas.

Toda resolución conservará evidencia y efectos.

La operación original permanecerá disponible.

##### 6.17. Devolución, reclamación y ajuste financiero serán relacionados pero distintos

La devolución física será trazada por NEXO.

La reclamación y decisión con proveedor serán trazadas por ORIGO.

La nota, obligación o ajuste económico será trazado por NUMERA o sistema externo según alcance.

##### 6.18. El desempeño del proveedor se calculará desde hechos

Cumplimiento de fecha, cantidad, calidad, documentos, precio y respuesta a reclamaciones se derivarán de operaciones cerradas.

Una calificación manual conservará autor y motivo.

No se permitirá modificar resultados históricos para mejorar una evaluación.

##### 6.19. La compra urgente será un carril abreviado, no un bypass

Toda urgencia tendrá causa, actor, sede, riesgo, autorización y límite.

Podrá permitir aprobación expedita y regularización posterior dentro de un plazo.

Nunca omitirá identidad del proveedor, evidencia de recepción o conciliación financiera.

##### 6.20. Los datos sensibles tendrán acceso mínimo

Precios, contratos, datos tributarios, cuentas bancarias, documentos y condiciones no serán visibles por pertenecer a la misma sede.

Las exportaciones y enlaces externos tendrán permisos y vigencia independientes.

Los documentos se conservarán en almacenamiento privado y con auditoría.

##### 6.21. Ninguna interfaz será fuente por sí sola

VISO podrá enlazar o presentar administración, pero no se convertirá en propietario.

Las decisiones se aplicarán mediante contratos de servidor y fuentes autoritativas.

La navegación no concederá acceso ni completará transiciones.

##### 6.22. Todo efecto será idempotente y reconciliable

Un reintento no duplicará orden, recepción, entrada de inventario, costo, obligación ni devolución.

Cada frontera conservará identificador estable y resultado recuperable.

Los fallos parciales producirán estado pendiente y conciliación, no confirmación falsa.

---

#### 7. Modelo conceptual objetivo

##### 7.1. Conceptos separados

| Concepto                    | Definición mínima                                                         |
| --------------------------- | ------------------------------------------------------------------------- |
| Señal de demanda            | hecho que evidencia una necesidad posible sin autorizar compra            |
| Necesidad de abastecimiento | necesidad consolidada y trazable pendiente de decisión                    |
| Solicitud de compra         | petición formal con solicitante, alcance, justificación y centro de costo |
| Caso de abastecimiento      | expediente que agrupa búsqueda, ofertas, evaluación y selección           |
| Solicitud de cotización     | petición enviada a uno o varios proveedores                               |
| Oferta o cotización         | condiciones propuestas por un proveedor con vigencia                      |
| Proveedor                   | identidad empresarial o persona que suministra bienes o servicios         |
| Contacto de proveedor       | persona o canal de relación; no identidad del proveedor                   |
| Relación producto–proveedor | capacidad declarada de suministrar un producto o servicio                 |
| Condición comercial         | precio, escala, entrega, pago, mínimo, descuento o flete versionados      |
| Contrato o acuerdo          | instrumento que gobierna condiciones y obligaciones durante una vigencia  |
| Decisión de aprobación      | resultado explícito de una política y un actor autorizado                 |
| Orden de compra             | compromiso aprobado y enviado con líneas y condiciones congeladas         |
| Revisión de orden           | versión posterior vinculada sin alterar la orden histórica                |
| Recepción                   | confirmación empresarial de entrega o prestación contra una orden         |
| Inspección de recepción     | verificación de cantidad, calidad, condición y documentos                 |
| Entrada de inventario       | efecto físico y contable de existencias en NEXO                           |
| Aceptación de servicio      | evidencia de cumplimiento de una compra no inventariable                  |
| Diferencia                  | desviación tipada entre orden, entrega, documento y aceptación            |
| Devolución o reclamación    | expediente de resolución con el proveedor                                 |
| Evento económico            | hecho consumido por NUMERA o sistema contable                             |
| Evaluación de proveedor     | resultado derivado de hechos y valoraciones controladas                   |
| Compra urgente              | expediente abreviado sujeto a autorización y regularización               |

##### 7.2. Relación general

```text
SEÑALES DE DEMANDA
NEXO / FOGO / PULSO / PERSONA AUTORIZADA
        ↓
NECESIDAD DE ABASTECIMIENTO
        ↓
SOLICITUD DE COMPRA
        ↓
CASO DE ABASTECIMIENTO
   ├── SOLICITUDES DE COTIZACIÓN
   ├── OFERTAS VERSIONADAS
   ├── COMPARACIÓN Y NEGOCIACIÓN
   └── SELECCIÓN JUSTIFICADA
        ↓
APROBACIÓN
        ↓
ORDEN DE COMPRA + REVISIÓN VIGENTE
        ↓
RECEPCIÓN / INSPECCIÓN / ACEPTACIÓN
   ├── NEXO: ENTRADA FÍSICA
   ├── ORIGO: ESTADO Y DIFERENCIAS
   └── NUMERA: HECHO ECONÓMICO
        ↓
EVALUACIÓN DEL PROVEEDOR / DEVOLUCIÓN / CIERRE
```

---

#### 8. Estados canónicos mínimos

##### 8.1. Proveedor

```text
prospectivo → pendiente_validacion → activo → suspendido → bloqueado → inactivo
```

##### 8.2. Solicitud de compra

```text
borrador → enviada → en_revision → aprobada → rechazada → en_abastecimiento → ordenada_parcial → ordenada → cerrada → cancelada
```

##### 8.3. Caso de abastecimiento

```text
borrador → abierto → solicitando_ofertas → evaluando → negociando → seleccionado → cerrado → cancelado
```

##### 8.4. Oferta

```text
solicitada → recibida → vigente → vencida → reemplazada → seleccionada → rechazada → retirada
```

##### 8.5. Contrato o acuerdo

```text
borrador → en_revision → activo → suspendido → vencido → terminado → reemplazado
```

##### 8.6. Orden de compra

```text
borrador → pendiente_aprobacion → aprobada → rechazada → enviada → confirmada_proveedor → recibida_parcial → recibida → cerrada → cancelada → en_disputa
```

##### 8.7. Recepción

```text
borrador → en_inspeccion → aceptada → aceptada_con_diferencias → rechazada → publicada_parcial → publicada → reversada
```

##### 8.8. Devolución o reclamación

```text
abierta → autorizada → despachada → recibida_proveedor → resuelta → cancelada
```

##### 8.9. Compra urgente

```text
abierta → autorizada_expedita → ejecutada → pendiente_regularizacion → regularizada → rechazada → cancelada
```

Los nombres físicos podrán normalizarse en E2/E3, pero no se reducirán a los tres estados actuales `draft`, `sent` y `received` cuando ello elimine aprobación, recepción parcial, disputa o cierre.

---

#### 9. Propiedad funcional y tecnológica

| Resultado empresarial                             | Propietario funcional                     | Aplicación propietaria candidata               | Consumidores principales |
| ------------------------------------------------- | ----------------------------------------- | ---------------------------------------------- | ------------------------ |
| necesidad y solicitud de compra                   | Compras con origen operativo identificado | ORIGO                                          | NEXO, FOGO, PULSO, VISO  |
| proveedor, oferta, contrato y condición comercial | Compras / Gerencia según sensibilidad     | ORIGO                                          | NEXO, NUMERA, VISO       |
| política y decisión de aprobación                 | Gerencia / responsable presupuestal       | ORIGO + autorización SHELL                     | NUMERA, auditoría        |
| orden de compra y sus revisiones                  | Compras                                   | ORIGO                                          | proveedor, NEXO, NUMERA  |
| recepción empresarial y diferencias               | Recepción / Compras                       | ORIGO                                          | NEXO, NUMERA             |
| entrada física, lote, vencimiento y LOC           | Inventario / Bodega                       | NEXO                                           | ORIGO, FOGO, NUMERA      |
| aceptación de servicio                            | Solicitante o supervisor autorizado       | ORIGO                                          | NUMERA                   |
| hecho económico y obligación                      | Contabilidad                              | NUMERA o sistema externo según `CAP-SCOPE-012` | Dirección, ORIGO         |
| documentos y evidencia                            | Propietario del expediente                | Storage gobernado desde SHELL                  | ORIGO, NEXO, NUMERA      |
| evaluación de proveedor                           | Compras con hechos operativos             | ORIGO                                          | Gerencia, solicitantes   |

##### 9.1. Regla de administración

VISO podrá presentar accesos, resúmenes o tareas administrativas, pero deberá enlazar al proceso propietario. No mantendrá proveedores, precios, órdenes o recepciones en una fuente paralela.

---

#### 10. Línea base de implementación verificable

| Superficie o estructura                      | Estado comprobado                                     | Tratamiento                                                   |
| -------------------------------------------- | ----------------------------------------------------- | ------------------------------------------------------------- |
| ORIGO: autenticación y acceso                | SSO y permiso general `origo.access`                  | reutilizar y atomizar permisos                                |
| ORIGO: proveedores                           | listado, alta y edición                               | reutilizar/refactorizar hacia maestro gobernado               |
| ORIGO: órdenes                               | listado, creación, detalle, edición de borrador y PDF | reutilizar/refactorizar                                       |
| ORIGO: estados de orden                      | `draft`, `sent`, `received`                           | ampliar; no cubren aprobación, parcialidad, disputa ni cierre |
| ORIGO: PDF o token público                   | superficie existente                                  | endurecer alcance, expiración, secreto y datos visibles       |
| ORIGO: recibos                               | rutas iniciales                                       | completar contra orden y revisión                             |
| ORIGO → NEXO                                 | enlace operacional para recibir una OC                | convertir en contrato idempotente y bidireccional             |
| NEXO: catálogo y presentaciones de proveedor | relaciones y configuración existentes                 | consumir el maestro ORIGO sin competir                        |
| NEXO: entradas, stock, LOC y lotes           | capacidad operativa parcial existente                 | conservar propiedad física                                    |
| NUMERA: hechos desde compras                 | alcance futuro reservado                              | construir integración y conciliación                          |
| historia de precios acordados                | no formalizada integralmente                          | construir                                                     |
| aprobaciones y auditoría de cambios          | pendiente crítico declarado                           | construir                                                     |
| recepción parcial y diferencias              | pendiente crítico declarado                           | reutilizar/refactorizar y completar                           |
| contratos, RFQ y comparación                 | sin flujo integral verificado                         | construir                                                     |
| compras urgentes                             | sin carril canónico verificado                        | construir                                                     |

La línea base confirma implementación útil, pero también una frontera incompleta: ORIGO administra la compra mientras la recepción inventariable todavía no está completamente sincronizada con NEXO.

---

#### 11. Matriz de decisión de cobertura

| Capacidad                                            | Tratamiento         | Propietario candidato                    | Fundamentación                                                                           |
| ---------------------------------------------------- | ------------------- | ---------------------------------------- | ---------------------------------------------------------------------------------------- |
| `CAP-05.01` Planear necesidades                      | `REUSE_OR_REFACTOR` | ORIGO con señales de NEXO/FOGO/PULSO     | existen mínimos, faltantes y datos operativos; falta consolidación y política            |
| `CAP-05.02` Solicitar bienes o servicios             | `REUSE_OR_REFACTOR` | ORIGO                                    | existen estructuras `procurement_*` y órdenes, pero la solicitud debe separarse de la OC |
| `CAP-05.03` Buscar y evaluar proveedores             | `REUSE_OR_REFACTOR` | ORIGO                                    | existe CRUD de proveedores; faltan gobierno, evaluación y deduplicación                  |
| `CAP-05.04` Solicitar y comparar ofertas             | `BUILD`             | ORIGO                                    | no existe flujo integral verificado de RFQ, versiones y comparación                      |
| `CAP-05.05` Negociar condiciones                     | `CONTROLLED_MANUAL` | Compras / Gerencia con registro en ORIGO | la negociación es humana; el resultado sí debe quedar gobernado                          |
| `CAP-05.06` Aprobar compras                          | `BUILD`             | ORIGO + autorización SHELL               | la implementación actual no demuestra política ni aprobación completa                    |
| `CAP-05.07` Emitir y controlar órdenes               | `REUSE_OR_REFACTOR` | ORIGO                                    | existe ciclo de órdenes y PDF; requiere revisiones, aceptación y estados completos       |
| `CAP-05.08` Recibir bienes y servicios               | `REUSE_OR_REFACTOR` | ORIGO con ejecución física NEXO          | existen rutas y enlace; falta contrato completo y servicios                              |
| `CAP-05.09` Verificar cantidad, calidad y documentos | `REUSE_OR_REFACTOR` | ORIGO/NEXO según hecho                   | existe base de recepción; faltan inspección y diferencias tipadas                        |
| `CAP-05.10` Gestionar diferencias y devoluciones     | `BUILD`             | ORIGO + NEXO + NUMERA                    | no existe ciclo integral verificado                                                      |
| `CAP-05.11` Evaluar cumplimiento                     | `BUILD`             | ORIGO                                    | debe derivarse de hechos de orden, recepción y reclamación                               |
| `CAP-05.12` Gestionar compras urgentes               | `BUILD`             | ORIGO                                    | se requiere carril abreviado con autorización y regularización                           |

##### 11.1. Resumen de clasificaciones

| Tratamiento         | Cantidad |
| ------------------- | -------: |
| `REUSE_OR_REFACTOR` |        6 |
| `BUILD`             |        5 |
| `CONTROLLED_MANUAL` |        1 |
| **Total**           |   **12** |

---

#### 12. CAP-05.01 — Planear necesidades de abastecimiento

##### Reglas mínimas

- Consolidará señales provenientes de mínimos, faltantes, reservas, planes de producción, ventas, mantenimiento, eventos, proyectos y solicitudes humanas.
- Cada señal conservará fuente y no generará una orden aprobada automáticamente.
- La planeación distinguirá necesidad bruta, existencia disponible, compromisos, tránsito, consumo esperado, cobertura y fecha requerida.
- Las recomendaciones automáticas serán explicables y podrán rechazarse con motivo.

##### Destinos canónicos

- `NEXO-UX-001` y políticas de reposición;
- `FOGO-UX-004` y planificación productiva;
- `ORIGO-UX-001` a `ORIGO-UX-004`;
- `CAP-SCOPE-006`, `CAP-SCOPE-008` y `CAP-SCOPE-017`;

---

#### 13. CAP-05.02 — Solicitar productos, materiales o servicios

##### Reglas mínimas

- La solicitud tendrá solicitante, empresa, sede, área, centro de costo, necesidad, fecha, prioridad, líneas, justificación y adjuntos.
- Podrá contener productos maestros, servicios o conceptos todavía pendientes de alta mediante un flujo controlado.
- No fijará por sí sola proveedor, precio final ni aprobación.
- Una solicitud modificada después del envío conservará revisión y motivo.

##### Destinos canónicos

- `ORIGO-UX-002`, `ORIGO-UX-003`, `ORIGO-AUTH-005`;
- `PROC-CAT-009` a `PROC-CAT-018`;
- `CAP-SCOPE-004` y `CAP-SCOPE-012`;

---

#### 14. CAP-05.03 — Buscar y evaluar proveedores

##### Reglas mínimas

- El maestro distinguirá proveedor, sucursal, contacto, condición fiscal, cuenta de pago, documento y estado.
- La búsqueda podrá usar productos, cobertura, ubicación, tiempos, estado y experiencia previa.
- La activación exigirá validaciones proporcionales al riesgo.
- Un proveedor bloqueado no podrá seleccionarse en nuevas órdenes, pero conservará historia.

##### Destinos canónicos

- `ORIGO-AUTH-002`, `ORIGO-AUTH-010`, `ORIGO-UX-001`;
- `SUPA-AUD-019`, `SUPA-TRANS-005`, `DATA-NORM-AUD-004`;
- `CAP-SCOPE-016`;

---

#### 15. CAP-05.04 — Solicitar y comparar ofertas

##### Reglas mínimas

- La RFQ tendrá líneas, cantidades, presentaciones, especificaciones, destino, fecha requerida y fecha límite.
- Cada respuesta conservará proveedor, versión, fecha, moneda, impuestos, flete, mínimos, disponibilidad y documentos.
- La matriz de comparación mostrará diferencias normalizadas sin ocultar datos no comparables.
- Una oferta vencida o reemplazada no será usada silenciosamente.

##### Destinos canónicos

- `ORIGO-UX-001`, `ORIGO-UX-004`, `ORIGO-UX-007`;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `EVID-ARC-001` a `EVID-ARC-010`;

---

#### 16. CAP-05.05 — Negociar condiciones

##### Reglas mínimas

- La interacción seguirá siendo humana.
- ORIGO conservará propuestas, contrapropuestas, resultado, responsable, evidencia y vigencia cuando sea pertinente.
- Los acuerdos informales que afecten precio, entrega o pago deberán regularizarse antes de aprobar la orden.
- El sistema no presentará una conversación sin aceptación como condición vigente.

##### Destinos canónicos

- `ORIGO-UX-001`, `ORIGO-UX-004`, `ORIGO-UX-007`;
- `CAP-SCOPE-016`;
- `EVID-ARC-001` a `EVID-ARC-010`;

---

#### 17. CAP-05.06 — Aprobar compras

##### Reglas mínimas

- La aprobación se aplicará a solicitud, selección, orden o excepción según la política.
- La política tendrá versión y podrá exigir una o varias decisiones.
- Los cambios materiales después de aprobar invalidarán o renovarán la aprobación.
- Aprobación, rechazo, devolución a corrección y vencimiento serán resultados distintos.

##### Destinos canónicos

- `ORIGO-AUTH-005`, `ORIGO-AUTH-006`, `ORIGO-AUTH-009`, `ORIGO-AUTH-010`;
- `ORIGO-UX-005`, `ORIGO-UX-008`;
- `AUTH-QA-015`, `AUTH-QA-016`, `UX-QA-026`;

---

#### 18. CAP-05.07 — Emitir y controlar órdenes

##### Reglas mínimas

- La orden congelará proveedor, revisión, destino, moneda, impuestos, líneas, precios, presentaciones, fechas, pago y condiciones.
- El envío conservará canal, destinatario, revisión y evidencia.
- La confirmación del proveedor no se inferirá del envío.
- Cancelación, enmienda y cierre conservarán efectos sobre solicitudes, recepción y obligaciones.

##### Destinos canónicos

- `ORIGO-UX-007`, `ORIGO-UX-008`, `ORIGO-AUTH-004` a `ORIGO-AUTH-010`;
- `INT-PROC-001`;
- `CAP-SCOPE-016`;

---

#### 19. CAP-05.08 — Recibir productos y servicios

##### Reglas mínimas

- La recepción se vinculará con orden y revisión vigentes.
- Permitirá entrega total, parcial, anticipada, tardía o no solicitada mediante reglas explícitas.
- Los servicios usarán aceptación de entregable o periodo, no stock.
- La operación deberá funcionar con pérdida de respuesta y reintento sin duplicar efectos.

##### Destinos canónicos

- `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-013`, `ORIGO-UX-014`;
- `INT-PROC-002` a `INT-PROC-005`;
- `CAP-SCOPE-006`, `CAP-SCOPE-018`;

---

#### 20. CAP-05.09 — Verificar cantidades, calidad y documentos

##### Reglas mínimas

- La cantidad ordenada, entregada, aceptada, rechazada y pendiente permanecerán separadas.
- Calidad, temperatura, lote, vencimiento, empaque y especificación se capturarán cuando correspondan.
- Factura, remisión, certificado u otro documento podrán quedar pendientes sin ocultarse.
- La aceptación tendrá actor y evidencia.

##### Destinos canónicos

- `ORIGO-UX-011`, `ORIGO-AUTH-007`, `ORIGO-AUTH-008`, `ORIGO-AUTH-011`;
- `CAP-SCOPE-003`, `CAP-SCOPE-006`, `CAP-SCOPE-008`;
- `EVID-ARC-001` a `EVID-ARC-010`;

---

#### 21. CAP-05.10 — Gestionar diferencias y devoluciones

##### Reglas mínimas

- Toda diferencia tendrá tipo, severidad, cantidad, valor, evidencia y responsable.
- Las resoluciones podrán incluir aceptación con reserva, reposición, devolución, descuento, nota o disputa.
- La devolución física no modificará silenciosamente la recepción.
- Los efectos de inventario y económicos serán compensatorios y correlacionados.

##### Destinos canónicos

- `ORIGO-UX-011`, `ORIGO-AUTH-008`;
- `INT-PROC-002` a `INT-PROC-005`;
- `NUMERA-DOM-003`, `NUMERA-DOM-014`, `NUMERA-UX-018`;
- `CAP-SCOPE-006`, `CAP-SCOPE-012`;

---

#### 22. CAP-05.11 — Evaluar cumplimiento de proveedores

##### Reglas mínimas

- Los indicadores se derivarán de órdenes y recepciones cerradas.
- Se medirán puntualidad, completitud, calidad, precio, documentos y resolución de diferencias.
- La evaluación podrá segmentarse por producto, sede, periodo y contrato.
- Suspensión o bloqueo tendrá decisión y vigencia.

##### Destinos canónicos

- `ORIGO-UX-001`, `ORIGO-AUTH-002`;
- `CAP-SCOPE-017`;
- `PROC-CAT-018`, `PROC-CAT-019`;

---

#### 23. CAP-05.12 — Gestionar compras urgentes

##### Reglas mínimas

- La urgencia tendrá causa canónica y evidencia.
- La política definirá quién puede iniciar, aprobar, ejecutar y regularizar.
- La compra conservará proveedor, líneas, precio, recepción, documento y centro de costo.
- La regularización vencida generará alerta y bloqueo de nuevas excepciones cuando la política lo exija.

##### Destinos canónicos

- `ORIGO-UX-001`, `ORIGO-UX-002`, `ORIGO-AUTH-005` a `ORIGO-AUTH-010`;
- `CAP-SCOPE-012`, `CAP-SCOPE-016`, `CAP-SCOPE-018`;
- `AUTH-QA-015`, `AUTH-QA-016`, `UX-QA-026`;

---

#### 24. Fronteras con otros dominios

##### 24.1. Catálogo

ORIGO referenciará producto, servicio y presentación canónicos; no creará identidades paralelas.

##### 24.2. Inventario

NEXO decidirá y registrará el efecto físico por sede, LOC, lote, vencimiento y condición.

##### 24.3. Producción

FOGO emitirá necesidades o reservas; no creará órdenes de compra por su cuenta.

##### 24.4. Ventas

PULSO podrá aportar demanda histórica o señales; no aprobará compras.

##### 24.5. Finanzas

NUMERA recibirá hechos económicos y conciliará obligaciones; no editará la orden ni la recepción.

##### 24.6. Contratos y documentos

Storage y evidencia se gobernarán mediante `CAP-SCOPE-016` y `EVID-ARC-*`.

##### 24.7. Analítica

Los indicadores se derivarán de estados y eventos canónicos, no de conteos de pantallas.

##### 24.8. Continuidad

La indisponibilidad de proveedor, red o aplicación tendrá procedimiento y regularización.

---

#### 25. Información conceptual requerida

##### 25.1. Proveedor

- identificador y código estables;
- identidad legal o personal aplicable;
- estado y vigencia;
- sedes y cobertura;
- contactos y canales;
- documentos y validaciones;
- datos sensibles referenciados;
- historial de cambios;

##### 25.2. Condición comercial

- producto o servicio;
- presentación y unidad;
- cantidad o escala;
- precio y moneda;
- impuestos y descuentos;
- flete y cargos;
- mínimo de compra;
- tiempo de entrega;
- condición de pago;
- vigencia;
- fuente y versión;

##### 25.3. Solicitud y caso de abastecimiento

- origen;
- solicitante;
- empresa, sede, área y centro de costo;
- fecha requerida;
- prioridad;
- líneas;
- justificación;
- presupuesto o referencia;
- estado y revisión;

##### 25.4. Orden

- proveedor;
- revisión;
- líneas congeladas;
- destino;
- condiciones;
- aprobaciones;
- envío;
- confirmación;
- recepciones relacionadas;
- saldo pendiente;
- cierre;

##### 25.5. Recepción

- orden y revisión;
- documento del proveedor;
- actor y ubicación;
- cantidades;
- calidad y condición;
- lote y vencimiento;
- diferencias;
- entrada NEXO;
- evento NUMERA;
- evidencia;

##### 25.6. Evaluación

- periodo;
- universo de operaciones;
- indicadores;
- ponderaciones;
- resultado calculado;
- valoración manual;
- decisión y vigencia;

---

#### 26. Eventos e integraciones requeridos

- `procurement.need_identified`;
- `procurement.request_submitted`;
- `procurement.request_approved`;
- `procurement.sourcing_opened`;
- `procurement.quote_received`;
- `procurement.offer_selected`;
- `procurement.contract_activated`;
- `procurement.purchase_order_approved`;
- `procurement.purchase_order_sent`;
- `procurement.purchase_order_revised`;
- `procurement.receipt_registered`;
- `procurement.receipt_inspected`;
- `procurement.receipt_difference_detected`;
- `procurement.inventory_entry_requested`;
- `procurement.inventory_entry_confirmed`;
- `procurement.economic_event_emitted`;
- `procurement.return_opened`;
- `procurement.return_resolved`;
- `procurement.supplier_score_updated`;
- `procurement.emergency_purchase_regularized`;

##### 26.1. Integraciones obligatorias

- NEXO/FOGO/PULSO → ORIGO para señales de demanda;
- ORIGO → proveedor mediante documento o canal controlado;
- ORIGO → NEXO para recepción física autorizada;
- NEXO → ORIGO para confirmación de entrada, diferencias y devolución;
- ORIGO/NEXO → NUMERA para hecho económico y conciliación;
- ORIGO → Storage para contratos, ofertas, facturas y evidencia;
- ORIGO → analítica para cumplimiento y tiempos;
- SHELL → todas las aplicaciones para identidad, permisos, contratos e idempotencia.

---

#### 27. Autorización y segregación

##### 27.1. Capacidades separadas

- consultar proveedores;
- administrar proveedores;
- consultar precios;
- administrar condiciones;
- crear solicitud;
- comprar;
- comparar ofertas;
- aprobar;
- emitir orden;
- cancelar o enmendar;
- recibir;
- inspeccionar;
- corregir recepción;
- gestionar devolución;
- ver contratos;
- exportar información sensible;
- autorizar compra urgente;
- regularizar compra urgente;

##### 27.2. Reglas

- el acceso administrativo ordinario no requerirá check-in cuando el contrato lo permita;
- la recepción física podrá exigir contexto operativo;
- el alcance se limitará por empresa, sede, centro de costo, categoría y responsabilidad;
- los precios y contratos tendrán permisos independientes;
- la simulación no ejecutará aprobaciones, envíos ni recepciones reales;
- un dispositivo compartido identificará al receptor humano;
- la URL directa, formulario manipulado o RPC directa no ampliarán autoridad;
- toda decisión conservará actor real, actor operativo, política y territorio.

---

#### 28. Experiencia por actor

##### 28.1. Solicitante

- crear y seguir solicitudes;
- ver estado y motivo;
- corregir cuando sea devuelta;
- no ver precios o contratos cuando no corresponda;

##### 28.2. Comprador

- bandeja de necesidades;
- casos de abastecimiento;
- proveedores y ofertas;
- comparación;
- orden y seguimiento;

##### 28.3. Aprobador

- contexto suficiente;
- impacto y excepciones;
- aprobar, rechazar o devolver;
- historial de decisiones;

##### 28.4. Receptor

- orden esperada;
- presentación y cantidad;
- captura de diferencias;
- evidencia y confirmación;

##### 28.5. Inventario

- LOC, lote, vencimiento y condición;
- entrada o devolución;
- sin editar precio o aprobación;

##### 28.6. Contabilidad

- hecho económico y documento;
- conciliación;
- diferencias;
- sin modificar la recepción física;

##### 28.7. Gerencia

- excepciones, urgencias, desempeño, contratos y exposición;
- sin contaminar la operación ordinaria;

---

#### 29. Operación offline y contingencia

- una orden no se considerará enviada hasta confirmar el canal o registrar entrega controlada;
- una recepción offline deberá persistir identificador y contenido antes de mostrarse como encolada;
- la sincronización revalidará actor, orden, revisión, estado y permisos;
- los reintentos no duplicarán recepción, inventario ni evento económico;
- una respuesta perdida permitirá recuperar el resultado original;
- una compra urgente durante indisponibilidad tendrá formato de contingencia y regularización obligatoria;
- la caída de NUMERA no impedirá necesariamente la recepción física, pero dejará el hecho económico pendiente y visible;
- la caída de NEXO no permitirá que ORIGO declare inventario confirmado sin evidencia.

---

#### 30. Evidencia, conservación y auditoría

- solicitud original y revisiones;
- ofertas y comparaciones;
- justificación de selección;
- aprobaciones y rechazos;
- orden y revisiones enviadas;
- confirmación del proveedor;
- documentos de recepción;
- inspección y diferencias;
- entrada o devolución física;
- hecho económico y conciliación;
- contratos y vigencias;
- compras urgentes y regularización;
- evaluaciones y decisiones sobre proveedor;
- consultas, descargas y exportaciones sensibles.

La retención exacta se definirá en `CAP-SCOPE-016`; ningún cierre autoriza borrar evidencia referenciada.

---

#### 31. Patrones legacy destinados a retiro

- crear una orden directamente desde una recomendación sin solicitud o política;;
- proveedores duplicados por nombre;;
- proveedores editables en NEXO y ORIGO como fuentes competidoras;;
- precio actual sobrescrito sin vigencia;;
- presentación del proveedor expresada como texto libre;;
- comparaciones en hojas o chats sin referencia canónica;;
- aprobación implícita por rol amplio;;
- edición de orden ya enviada;;
- estado único `received` sin parcialidad ni diferencia;;
- recepción duplicada en ORIGO y NEXO;;
- entrada de inventario creada desde una factura sin recepción física;;
- servicio registrado como producto inventariable;;
- devolución mediante ajuste destructivo;;
- compra urgente sin regularización;;
- contratos o datos bancarios en almacenamiento público;;
- PDF público con secreto opcional o fallback;;
- evaluación de proveedor basada solo en opinión sin universo de hechos.;

`RETIRE` aplica a estos patrones, no a las capacidades empresariales.

---

#### 32. Preguntas pendientes reutilizadas

No se crean preguntas nuevas.

| Pregunta | Uso dentro de esta tarea                                           | Puerta de resolución                                              |
| -------- | ------------------------------------------------------------------ | ----------------------------------------------------------------- |
| `DAT-06` | confirmar dónde se consulta hoy la historia completa de compras    | `ORIGO-UX-001`, migración y readiness                             |
| `DAT-07` | confirmar si se conserva la cantidad realmente recibida            | `ORIGO-UX-009` a `ORIGO-UX-014` y `INT-PROC-002` a `INT-PROC-005` |
| `OPE-05` | confirmar quién puede rechazar mercancía distinta                  | diseño E2 de recepción y matriz de aprobación                     |
| `TEC-07` | evidencia de tablas y servicios actuales de compra                 | `SUPA-AUD-019`, `SUPA-AUD-022`, `SUPA-AUD-023`                    |
| `TEC-18` | evidencia de duplicación de compras y contratos entre aplicaciones | `SHELL-CON-016`, `SUPA-TRANS-007`, `INT-APP-010`                  |

Las respuestas no bloquean esta decisión conceptual, pero serán obligatorias antes de migrar historia, fijar responsabilidades nominales o aprobar el piloto.

---

#### 33. Riesgos principales

| Riesgo                                | Severidad | Control principal                  |
| ------------------------------------- | --------- | ---------------------------------- |
| orden sin necesidad o autorización    | crítica   | solicitud y aprobación explícitas  |
| proveedor duplicado o no validado     | alta      | maestro único y estados            |
| precio vencido o de otra presentación | crítica   | versión y contexto completos       |
| selección no justificable             | alta      | comparación y criterio visible     |
| conflicto de interés o autoaprobación | crítica   | segregación de funciones           |
| orden enviada alterada                | crítica   | revisiones inmutables              |
| recepción duplicada                   | crítica   | idempotencia y contrato ORIGO–NEXO |
| inventario sin recepción válida       | crítica   | efecto físico gobernado por NEXO   |
| recepción parcial tratada como total  | crítica   | cantidades y saldo por línea       |
| servicio convertido en stock          | alta      | aceptación no inventariable        |
| diferencia borrada                    | crítica   | eventos compensatorios             |
| contrato o datos bancarios expuestos  | crítica   | Storage privado y permisos         |
| compra urgente sin regularización     | crítica   | carril expedito con vencimiento    |
| evento financiero duplicado           | crítica   | correlación e idempotencia         |
| desempeño manipulado                  | alta      | métricas desde hechos              |

---

#### 34. Hallazgos y destinos canónicos

| ID                    | Hallazgo                                                                                                   | Riesgo  | Tarea propietaria                                                | Momento                        |
| --------------------- | ---------------------------------------------------------------------------------------------------------- | ------- | ---------------------------------------------------------------- | ------------------------------ |
| `H-CAP-SCOPE-005-001` | las señales de demanda no convergen todavía en un expediente único de necesidad                            | alta    | `ORIGO-UX-001`; `CAP-SCOPE-006`; `CAP-SCOPE-008`                 | E2                             |
| `H-CAP-SCOPE-005-002` | solicitud de compra y orden no tienen separación integral demostrada                                       | crítica | `ORIGO-UX-002`; `PROC-CAT-001` a `PROC-CAT-018`                  | E2                             |
| `H-CAP-SCOPE-005-003` | el maestro de proveedores puede competir entre NEXO, ORIGO y estructuras compartidas                       | crítica | `SUPA-AUD-019`; `SUPA-TRANS-007`; `SHELL-CON-016`                | E3                             |
| `H-CAP-SCOPE-005-004` | identidad, contactos, documentos y datos sensibles del proveedor no tienen gobierno completo verificado    | crítica | `ORIGO-AUTH-002`; `ORIGO-AUTH-010`; `CAP-SCOPE-016`              | E2/E3                          |
| `H-CAP-SCOPE-005-005` | no existe flujo integral verificado de RFQ, ofertas versionadas y comparación                              | alta    | `ORIGO-UX-001`; `ORIGO-UX-004`; `PROC-CAT-001` a `PROC-CAT-020`  | E2                             |
| `H-CAP-SCOPE-005-006` | precios acordados por proveedor y producto no tienen versionado integral                                   | crítica | `ORIGO-AUTH-010`; `SUPA-AUD-019`; `CAP-SCOPE-012`                | E2/E3                          |
| `H-CAP-SCOPE-005-007` | contratos, condiciones y vigencias no tienen ciclo canónico comprobado                                     | alta    | `CAP-SCOPE-016`; `EVID-ARC-001` a `EVID-ARC-010`; `ORIGO-UX-001` | E2/E4                          |
| `H-CAP-SCOPE-005-008` | la aprobación de compras y auditoría de cambios están declaradas como pendientes                           | crítica | `ORIGO-AUTH-005`; `ORIGO-AUTH-006`; `ORIGO-UX-008`               | E2 antes de piloto             |
| `H-CAP-SCOPE-005-009` | los estados actuales de OC no representan revisión, aprobación, parcialidad, disputa y cierre              | crítica | `ORIGO-UX-007` a `ORIGO-UX-011`; `PROC-CAT-009` a `PROC-CAT-014` | E2                             |
| `H-CAP-SCOPE-005-010` | el PDF o token externo requiere contrato fail-closed, expiración y minimización de datos                   | crítica | `ORIGO-AUTH-010`; `INT-EXT-001` a `INT-EXT-019`; `CAP-SCOPE-016` | E3/E4                          |
| `H-CAP-SCOPE-005-011` | la recepción real contra OC no está completamente sincronizada con NEXO                                    | crítica | `ORIGO-UX-009` a `ORIGO-UX-015`; `INT-PROC-001` a `INT-PROC-005` | E2/E4                          |
| `H-CAP-SCOPE-005-012` | recepciones parciales, diferencias, costos y presentaciones físicas no están cerrados de extremo a extremo | crítica | `ORIGO-UX-010`; `ORIGO-UX-011`; `CAP-SCOPE-006`; `NUMERA-UX-018` | E2/E3                          |
| `H-CAP-SCOPE-005-013` | la compra y aceptación de servicios no tienen contrato específico verificado                               | alta    | `ORIGO-UX-001`; `CAP-SCOPE-012`; `PROC-CAT-001` a `PROC-CAT-018` | E2                             |
| `H-CAP-SCOPE-005-014` | no existe ciclo integral comprobado de devolución, reclamación y compensación                              | crítica | `ORIGO-AUTH-008`; `ORIGO-UX-011`; `NUMERA-DOM-014`               | E2/E3                          |
| `H-CAP-SCOPE-005-015` | no existe evaluación de proveedores derivada de hechos canónicos                                           | alta    | `ORIGO-UX-001`; `CAP-SCOPE-017`; `PROC-CAT-019`                  | E2                             |
| `H-CAP-SCOPE-005-016` | no existe carril canónico de compra urgente con regularización                                             | crítica | `ORIGO-AUTH-005` a `ORIGO-AUTH-010`; `CAP-SCOPE-018`             | E2                             |
| `H-CAP-SCOPE-005-017` | el hecho económico y la conciliación con NUMERA no están cerrados                                          | crítica | `INT-PROC-004`; `NUMERA-DOM-003`; `NUMERA-UX-018`                | E3/E4                          |
| `H-CAP-SCOPE-005-018` | la historia operativa actual de compras y cantidades recibidas sigue pendiente de confirmación             | alta    | `DAT-06`; `DAT-07`; `ORIGO-UX-001`                               | antes de migración y readiness |

Todos los hallazgos tienen propietario y puerta. No queda pendiente narrativo sin destino.

---

#### 35. Decisiones canónicas resultantes

1. ORIGO será propietario del expediente de abastecimiento externo.
2. NEXO conservará la propiedad del efecto físico sobre inventario.
3. NUMERA o el sistema financiero aprobado conservará el hecho económico y la obligación.
4. VISO será superficie de acceso o supervisión, no fuente competidora.
5. La necesidad, solicitud, caso de abastecimiento, orden y recepción serán entidades distintas.
6. El proveedor será una identidad estable separada de sus contactos y sedes.
7. La relación producto–proveedor no equivaldrá a un precio vigente.
8. Las ofertas, contratos y precios serán versionados y tendrán vigencia.
9. La comparación considerará costo total y criterios operativos, no solo precio.
10. La negociación será manual controlada con resultado registrado.
11. Las aprobaciones serán explícitas y versionadas.
12. Solicitante, comprador, aprobador y receptor tendrán capacidades separadas.
13. Una orden aprobada o enviada no se editará destructivamente.
14. La recepción podrá ser parcial y conservará diferencias por línea.
15. Los servicios tendrán aceptación sin crear inventario artificial.
16. ORIGO y NEXO compartirán un identificador de recepción, no dos procesos paralelos.
17. Las diferencias y devoluciones producirán efectos correlacionados y compensatorios.
18. La evaluación de proveedor se derivará de hechos.
19. La compra urgente será expedita pero controlada y regularizable.
20. Los datos sensibles se protegerán con permisos y Storage privado.
21. Cada frontera será idempotente y reconciliable.
22. La familia `CAP-05` se considera parcialmente existente y reutilizable, pero no cerrada.

---

#### 36. Requisitos de prueba derivados

Esta tarea genera tres requisitos distintos y no duplicados:

```text
TREQ-ORIGO-004
TREQ-ORIGO-005
TREQ-INTEGRATION-010
```

Los detalles completos se incorporan exclusivamente en el archivo canónico `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` regenerado.

No se entregan filas independientes.

##### 36.1. `TREQ-ORIGO-004`

Protege el ciclo solicitud → abastecimiento → aprobación → orden → revisión → urgencia, incluyendo segregación, estados, auditoría y ausencia de cambios destructivos.

##### 36.2. `TREQ-ORIGO-005`

Protege proveedor, ofertas, contratos, condiciones y precios versionados, datos sensibles, vigencias, presentaciones y evaluación histórica.

##### 36.3. `TREQ-INTEGRATION-010`

Protege la cadena ORIGO → NEXO → NUMERA, recepciones parciales, servicios, diferencias, devoluciones, idempotencia y conciliación.

---

#### 37. Dependencias habilitadas y restricciones

`CAP-SCOPE-005` habilita conceptualmente:

- `CAP-SCOPE-006`;
- `CAP-SCOPE-012`;
- `CAP-SCOPE-016`;
- `CAP-SCOPE-017`;
- `CAP-SCOPE-018`;
- `ORIGO-UX-001` a `ORIGO-UX-016`;
- `ORIGO-AUTH-001` a `ORIGO-AUTH-015`;
- `INT-PROC-001` a `INT-PROC-005`;
- `NUMERA-DOM-003` y `NUMERA-UX-018`;
- diseño TO-BE de abastecimiento;
- arquitectura de proveedor, precios y contratos;
- paquetes E5 de ORIGO, NEXO y NUMERA;

No autoriza compras, aprobaciones, recepción, pago, migración, cambios en proveedores ni publicación de documentos.

---

#### 38. Criterios de aceptación

1. las doce subcapacidades tengan tratamiento explícito;
2. necesidad, solicitud, abastecimiento, orden y recepción estén separados;
3. proveedor, contacto, oferta, contrato y precio estén separados;
4. ORIGO, NEXO, NUMERA y VISO tengan fronteras explícitas;
5. los precios tengan contexto, fuente, versión y vigencia;
6. la negociación quede clasificada como manual controlada;
7. las aprobaciones y segregación sean explícitas;
8. una orden enviada utilice revisiones y no sobrescritura;
9. la recepción admita parcialidad, inspección y diferencias;
10. los servicios no creen inventario artificial;
11. devoluciones y compensaciones conserven la historia;
12. la compra urgente tenga autorización y regularización;
13. los datos sensibles tengan tratamiento de privacidad;
14. los dieciocho hallazgos tengan destino;
15. no se creen preguntas narrativas sin dueño;
16. se generen los tres requisitos de prueba;
17. el registro `04A` completo tenga 92 requisitos válidos;
18. ninguna fila del registro tenga más o menos de catorce columnas;
19. no se autorice implementación;
20. la continuidad quede en `CAP-SCOPE-006`.

---

#### 39. Resultado y continuidad

**Estado:** PROPUESTA PARA APROBACIÓN

Al aprobarse:

- `CAP-SCOPE-005` será la decisión canónica de cobertura para compras, proveedores, contratos, precios y abastecimiento;
- `TREQ-ORIGO-004`, `TREQ-ORIGO-005` y `TREQ-INTEGRATION-010` quedarán incorporados al registro canónico;
- ORIGO, NEXO y NUMERA conservarán propiedades diferenciadas;
- ninguna implementación física ni operación real quedará autorizada;
- la continuidad será:

```text
CAP-SCOPE-006 — Evaluar inventario, lotes, vencimientos, LOC y LPN
```


### ✅ CAP-SCOPE-006 — Evaluar inventario, lotes, vencimientos, LOC y LPN

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Dependencia cumplida:** `CAP-SCOPE-005` aprobada  
**Tarea anterior:** `CAP-SCOPE-005`  
**Siguiente tarea reservada:** `CAP-SCOPE-007`  
**Familia evaluada:** `CAP-06 — Controlar inventario y almacenamiento`  
**Naturaleza:** decisión de cobertura empresarial y definición conceptual objetivo  
**Implementación técnica:** no autorizada  
**Migraciones o cambios en Supabase:** no autorizados  
**Conteos, ajustes, movimientos, reservas, remisiones o efectos reales de inventario:** no autorizados  
**Requisitos de prueba generados:** `TREQ-NEXO-011`, `TREQ-NEXO-012`, `TREQ-INTEGRATION-011`  
**Actualización del registro de pruebas:** se entrega el archivo `04A` completo regenerado; quedan prohibidas las filas sueltas

---

#### 1. Propósito

Definir el tratamiento objetivo de las capacidades mediante las cuales Vento Group deberá:

- conservar una representación única, trazable y reconciliable de la existencia física;
- distinguir producto, presentación, unidad, lote, serial, existencia, ubicación, posición, LPN y contenedor físico;
- definir una jerarquía estable de sede, lugar de almacenamiento, LOC, posición y contenido;
- registrar entradas, ubicaciones, reubicaciones, consumos, salidas, traslados y remisiones mediante hechos auditables;
- distinguir cantidad física, reservada, disponible, en tránsito, en cuarentena, dañada, vencida y perdida;
- mantener un ledger o fuente canónica de movimientos y proyecciones derivadas que no compitan entre sí;
- impedir doble contabilización entre stock suelto, stock ubicado, stock por presentación y contenido de LPN;
- gestionar lotes de proveedor, lotes productivos, vencimientos, vida útil, condición, liberación y cuarentena;
- aplicar FEFO u otra política aprobada sin seleccionar inventario no utilizable;
- reservar o separar existencias con vigencia, propietario, propósito y liberación explícita;
- contar inventario sin convertir la observación en ajuste silencioso;
- investigar diferencias y corregir mediante eventos compensatorios autorizados;
- controlar frío y condiciones de almacenamiento mediante reglas, registros, alertas y contingencias;
- relacionar ORIGO, FOGO, PULSO, remisiones y otros orígenes con NEXO sin efectos duplicados;
- operar con etiquetas, escáneres, tablets, kioscos e impresoras sin perder trazabilidad cuando un periférico falla;
- preservar historia suficiente para reconstruir qué había, dónde estaba, en qué condición, bajo qué lote y por qué cambió.

La existencia actual de tablas, stock por sede y LOC, movimientos, formularios, remisiones o componentes LPN no permite considerar cerrada la familia `CAP-06`. La cobertura exige que cada cantidad pueda explicarse desde un hecho autorizado, una ubicación válida, un estado utilizable y una cadena de origen completa.

---

#### 2. Pregunta de decisión

`CAP-SCOPE-006` responde:

```text
¿CÓMO REPRESENTAR Y OPERAR LA EXISTENCIA FÍSICA DE VENTO GROUP
DE FORMA QUE CADA CANTIDAD, LOTE, VENCIMIENTO, UBICACIÓN Y LPN
SEA TRAZABLE, UTILIZABLE O BLOQUEABLE SEGÚN SU ESTADO,
Y QUE ENTRADAS, PRODUCCIÓN, VENTAS, TRASLADOS, REMISIONES,
CONTEOS Y AJUSTES CONVERJAN SIN DOBLE CONTABILIZACIÓN
NI FUENTES DE VERDAD COMPETIDORAS?
```

La tarea rechaza equivalencias incorrectas como:

```text
STOCK FÍSICO = STOCK DISPONIBLE
```

```text
SEDE = LOC
```

```text
LOC = POSICIÓN
```

```text
LOC = LPN
```

```text
LPN = CONTENEDOR FÍSICO
```

```text
LOTE DE PROVEEDOR = LOTE DE PRODUCCIÓN
```

```text
PRESENTACIÓN = UNIDAD DE MEDIDA
```

```text
CONTEO = AJUSTE
```

```text
MOVIMIENTO = PROYECCIÓN DE STOCK
```

```text
REMISIÓN COMPLETADA = INVENTARIO PUBLICADO
```

```text
CANTIDAD EN TRÁNSITO = CANTIDAD DISPONIBLE EN DESTINO
```

```text
PRODUCTO VENCIDO = REGISTRO ELIMINADO
```

```text
FOTO = EVIDENCIA SUFICIENTE DE CONDICIÓN
```

```text
TEMPERATURA REGISTRADA = CADENA DE FRÍO CUMPLIDA
```

```text
STOCK CERO = PRODUCTO INEXISTENTE
```

```text
CANTIDAD NEGATIVA = PEDIDO PENDIENTE
```

```text
CORRECCIÓN = SOBRESCRITURA DEL VALOR ANTERIOR
```


---

#### 3. Fuentes consolidadas

- `OPS-AUD-001` a `OPS-AUD-015`;
- `CAP-MAP-001` a `CAP-MAP-015`;
- `CODE-AUD-001` a `CODE-AUD-020`;
- `CAP-SCOPE-001` a `CAP-SCOPE-005`;
- `QA-REG-001` y el Registro Canónico de Requisitos de Prueba;
- `REGISTRO_VIVO_DE_PREGUNTAS_PENDIENTES`, especialmente `COM-01`, `DAT-04`, `DAT-05`, `DAT-08` a `DAT-11`, `DAT-26`, `OPE-01`, `OPE-04`, `OPE-06` y `TEC-06`;
- la implementación vigente de NEXO: catálogo operativo, stock por sede, LOC y presentación, entradas, conteo inicial, ajustes, retiros, traslados, movimientos, remisiones, posiciones, kiosco y printing;
- la evidencia técnica de `inventory_movements`, proyecciones por sede, LOC y posición, `inventory_stock_by_uom_profile`, entradas, remisiones, conteos, LOC, LPN y contenido de LPN;
- la evidencia de que lotes y vencimientos existen parcialmente, pero no forman todavía un ciclo operativo integral;
- la evidencia de que la superficie LPN actual conserva fragmentos de tabla, endpoint y componente sin recorrido funcional completo;
- las tareas `NEXO-DOM-001` a `NEXO-DOM-024`, `NEXO-AUTH-001` a `NEXO-AUTH-030` y `NEXO-UX-001` a `NEXO-UX-042`;
- los contratos `INT-PROC-001` a `INT-PROC-005`, `INT-PROD-001` a `INT-PROD-005`, `INT-POS-011` a `INT-POS-020` e `INT-SALES-001` a `INT-SALES-011`;
- las decisiones aprobadas sobre unidades, presentaciones, recetas, recepción, costos, autorización, idempotencia, evidencia y transición.

Las respuestas y evidencias ya registradas no se vuelven a solicitar.

---

#### 4. Alcance evaluado

- `CAP-06.01` — Definir lugares de almacenamiento;
- `CAP-06.02` — Identificar productos, lotes y recipientes;
- `CAP-06.03` — Registrar entradas;
- `CAP-06.04` — Ubicar y reubicar existencias;
- `CAP-06.05` — Consultar disponibilidad;
- `CAP-06.06` — Reservar o separar existencias;
- `CAP-06.07` — Registrar consumo y salida;
- `CAP-06.08` — Trasladar entre lugares;
- `CAP-06.09` — Solicitar y gestionar remisiones;
- `CAP-06.10` — Preparar y despachar remisiones;
- `CAP-06.11` — Recibir y confirmar remisiones;
- `CAP-06.12` — Contar inventario;
- `CAP-06.13` — Investigar y ajustar diferencias;
- `CAP-06.14` — Controlar vencimiento, daño y pérdida;
- `CAP-06.15` — Controlar frío y condiciones de almacenamiento;

También fija fronteras con catálogo, compras, producción, ventas, activos, logística, costos, mantenimiento, SST, inocuidad, documentos, analítica y continuidad.

---

#### 5. Fuera de alcance

- contar, ajustar, retirar, trasladar, reservar, liberar, empacar o mover inventario real;
- crear o imprimir etiquetas operativas reales;
- activar efectos de inventario en remisiones, producción o ventas;
- definir cantidades iniciales, mínimos o máximos reales;
- decidir ubicaciones físicas finales sin validar planos y operación;
- declarar un producto apto, vencido, dañado, perdido o liberado sin responsable autorizado;
- sustituir controles sanitarios, de inocuidad, SST o cadena de frío;
- definir límites finales de temperatura o vida útil sin especificación aprobada;
- crear tablas, vistas, RPC, triggers, buckets, políticas RLS o migraciones;
- migrar stock, lotes, movimientos, conteos o LPN históricos;
- decidir todavía si el ledger o una proyección actual será físicamente la tabla definitiva;
- convertir ORIGO, FOGO, PULSO o VISO en fuentes competidoras de existencia;
- convertir un LPN en catálogo de activos; esa frontera continuará en `CAP-SCOPE-007`;
- autorizar stock negativo como comportamiento general;
- borrar movimientos, conteos, lotes o diferencias referenciadas.

---

#### 6. Principios canónicos

##### 6.1. NEXO será propietario del estado físico de inventario

NEXO conservará movimientos, existencia, ubicación, lote, condición, reserva y tránsito.

ORIGO, FOGO, PULSO y otros dominios emitirán hechos de origen; no escribirán proyecciones de stock de manera independiente.

`vento-shell` conservará contratos, migraciones y controles compartidos.

##### 6.2. Producto e existencia son conceptos diferentes

El producto describe qué es el elemento; la existencia describe cuánto hay, dónde, bajo qué lote, presentación, condición y custodia.

Un producto podrá existir sin stock y una existencia no podrá existir sin producto canónico.

Una variante o presentación no creará una identidad de producto artificial.

##### 6.3. La jerarquía física será explícita

La jerarquía mínima será `organización → sede → LOC → posición opcional`.

Un LOC representará un lugar controlable; una posición será una subdivisión interna cuando aporte valor operativo.

Los códigos serán estables, únicos dentro de su ámbito y no dependerán del nombre visible.

##### 6.4. El ciclo de vida de LOC será no destructivo

Crear, activar, bloquear, reubicar, cerrar y retirar un LOC conservará historia.

Un LOC con existencia, movimientos o documentos no podrá eliminarse físicamente.

El cierre exigirá vaciado, traslado o tratamiento explícito del contenido.

##### 6.5. Stock no ubicado será una excepción temporal controlada

La existencia sin LOC podrá admitirse solo durante recepción, migración o contingencia aprobada.

Tendrá motivo, responsable, antigüedad y cola de resolución.

No se presentará como ubicación física confiable.

##### 6.6. Un LPN será una identidad logística de contenido

El LPN identificará una unidad logística que agrupa contenido y puede moverse como conjunto.

No será sinónimo de estante, LOC, activo o contenedor físico.

Podrá relacionarse con un contenedor físico, pero ambas identidades y ciclos permanecerán separados.

##### 6.7. El contenido de LPN no se contabilizará también como stock suelto

Cada cantidad estará o bien suelta en una ubicación o bien contenida en un LPN, con una relación única y verificable.

Empacar y desempacar transferirá representación sin alterar la cantidad total.

Mover un LPN moverá atómicamente todo su contenido.

##### 6.8. Lote, serial y vencimiento tendrán identidad y origen

El lote conservará tipo, código, producto, origen, proveedor o lote productivo, fecha y evidencia aplicable.

El serial identificará una unidad individual cuando el dominio lo requiera.

La fecha de vencimiento, consumo preferente o vida útil tendrá semántica explícita y no será un texto libre ambiguo.

##### 6.9. La existencia tendrá estados separados

Como mínimo se distinguirán `on_hand`, `reserved`, `available`, `in_transit`, `quarantined`, `damaged`, `expired` y `lost` cuando apliquen.

La disponibilidad se calculará desde estados y políticas; no será copia manual de la cantidad física.

Una cantidad podrá existir físicamente y no estar disponible.

##### 6.10. El ledger y las proyecciones tendrán una relación única

Cada cambio de cantidad deberá originarse en un movimiento o evento canónico.

Las proyecciones por sede, LOC, posición, presentación, lote o estado serán derivadas o actualizadas atómicamente bajo un contrato único.

Ninguna proyección podrá modificarse sin un hecho correlacionado.

##### 6.11. Toda mutación será atómica o idempotente y reconciliable

Un fallo intermedio no podrá dejar movimiento, stock, costo, lote o ubicación en estados incompatibles.

Cada comando tendrá clave de idempotencia y resultado recuperable.

Los reintentos no volverán a sumar o descontar.

##### 6.12. Todo movimiento declarará causa y referencia

Entrada, consumo, venta, remisión, traslado, ajuste, merma, devolución, producción, daño y vencimiento serán tipos diferenciados.

El movimiento conservará actor, contexto, origen, destino, cantidad, unidad, producto, lote, estado y documento causante.

Una descripción libre no sustituirá el tipo de movimiento.

##### 6.13. La entrada física no será la compra

Una entrada podrá provenir de compra, producción, devolución, traslado, conteo inicial o regularización.

La recepción empresarial y la entrada física compartirán correlación, no identidad forzada.

Un documento sin mercancía no creará stock.

##### 6.14. La reserva será una asignación explícita y temporal

Toda reserva tendrá propósito, cantidad, producto, sede, lote o criterio, propietario, prioridad, fecha y expiración.

La reserva reducirá disponibilidad sin reducir existencia física.

Consumir, cancelar o expirar una reserva liberará o convertirá su cantidad de forma idempotente.

##### 6.15. El consumo y la salida se registrarán exactamente una vez

Producción, venta, retiro, merma, devolución y uso interno emitirán causas distintas.

Una salida no podrá producirse desde cantidad no disponible salvo política explícita de backorder o regularización.

Las anulaciones producirán compensación, no borrado.

##### 6.16. El traslado conservará tránsito y recepción

Un traslado entre lugares tendrá origen, destino, cantidad enviada, recibida, diferencia y estado.

La cantidad en tránsito no estará disponible en origen ni confirmada en destino.

El traslado interno dentro de una sede podrá simplificarse sin perder el movimiento.

##### 6.17. La remisión será documento operativo y no sustituto del ledger

Los estados de solicitud, preparación, despacho, tránsito y recepción describirán el proceso.

Cada efecto de inventario tendrá correlación visible y estado de publicación.

Una remisión registrada sin efectos deberá declararlo expresamente y no simular inventario actualizado.

##### 6.18. El conteo será una observación versionada

Una sesión de conteo conservará alcance, responsable, instante de corte, método, líneas observadas y evidencia.

El resultado no sobrescribirá inmediatamente la existencia teórica.

Los recuentos y confirmaciones conservarán sus valores originales.

##### 6.19. La diferencia y el ajuste serán expedientes distintos

La diferencia comparará observación y cantidad esperada.

La investigación registrará causa, evidencia y responsable.

El ajuste será una decisión autorizada que emite un movimiento compensatorio.

##### 6.20. Vencimiento, cuarentena, daño y pérdida no serán borrados

El sistema podrá bloquear, separar, liberar, consumir excepcionalmente, devolver o disponer según política.

Todo cambio de condición conservará actor, motivo, evidencia y cantidad.

FEFO excluirá inventario no utilizable y respetará reservas o retenciones.

##### 6.21. El frío será una condición operativa, no solo una ubicación

Los LOC fríos declararán rango, equipo o zona, productos compatibles y contingencia.

Las lecturas tendrán fuente, timestamp, dispositivo, calidad y relación con sede o LOC.

Una excursión generará evaluación y posible cuarentena; no declarará automáticamente pérdida o liberación.

##### 6.22. Unidad, presentación y cantidad base conservarán equivalencia

Toda operación persistirá la cantidad canónica y el contexto de captura.

Una caja, bolsa o tarro será presentación física; kilogramo, gramo, litro o unidad serán unidades de medida.

Las conversiones estarán versionadas y no dependerán de fallbacks locales contradictorios.

##### 6.23. El stock negativo no será un atajo silencioso

La operación normal bloqueará salidas superiores a la disponibilidad.

Cualquier excepción tendrá política, actor, motivo, límite y regularización.

El valor negativo no representará automáticamente demanda, reserva ni backorder.

##### 6.24. La historia será reconstruible

Desde cualquier saldo deberá poderse navegar a movimientos, documentos, conteos, lotes, ubicaciones y actores.

Correcciones, fusiones, divisiones y retiros conservarán relaciones con los registros previos.

Los datos históricos usarán la identidad y unidad vigentes al momento del hecho.

##### 6.25. La operación degradada conservará intención, no autoridad obsoleta

Los comandos offline tendrán identidad local, payload mínimo, timestamp y estado.

Al sincronizar se revalidarán permisos, contexto, disponibilidad y versión del recurso.

Los conflictos no se resolverán sumando automáticamente dos efectos.

##### 6.26. Etiquetas y escaneo serán mecanismos de acceso, no fuentes de verdad

Un código LOC, LPN, lote o producto resolverá una identidad canónica.

Una etiqueta dañada o reimpresa no creará una nueva entidad salvo reetiquetado controlado.

La impresión y reimpresión conservarán plantilla, dispositivo, actor, razón y resultado.


---

#### 7. Modelo conceptual objetivo

##### 7.1. Conceptos separados

| Concepto                | Definición objetivo                                                                  |
| ----------------------- | ------------------------------------------------------------------------------------ |
| Producto maestro        | Identidad de lo que se compra, produce, almacena, consume o vende.                   |
| Presentación física     | Forma empaquetada o comercial con factor hacia la unidad canónica.                   |
| Existencia              | Cantidad de un producto bajo sede, ubicación, lote, condición, presentación o LPN.   |
| Lugar de almacenamiento | Espacio empresarial que puede contener uno o varios LOC.                             |
| LOC                     | Ubicación operativa identificable y escaneable.                                      |
| Posición                | Subdivisión opcional dentro de un LOC.                                               |
| Contenedor físico       | Objeto reutilizable o desechable que puede existir independientemente del contenido. |
| LPN                     | Identidad logística de una unidad de contenido movible como conjunto.                |
| Lote                    | Agrupación trazable con origen y atributos comunes.                                  |
| Serial                  | Identidad de una unidad individual.                                                  |
| Estado de condición     | Apto, retenido, cuarentena, dañado, vencido, perdido u otro estado aprobado.         |
| Reserva                 | Asignación temporal de cantidad a un propósito.                                      |
| Movimiento              | Hecho que modifica cantidad, estado, ubicación o custodia.                           |
| Proyección de stock     | Lectura optimizada derivada del ledger o actualizada bajo el mismo contrato atómico. |
| Sesión de conteo        | Expediente de observaciones físicas a un instante de corte.                          |
| Diferencia              | Brecha entre cantidad esperada y observada.                                          |
| Ajuste                  | Movimiento autorizado que regulariza una diferencia.                                 |
| Lectura de condición    | Medición de temperatura u otra condición ambiental.                                  |
| Excursión               | Incumplimiento o posible incumplimiento de condición que exige evaluación.           |

##### 7.2. Relación general

```text
PRODUCTO + PRESENTACIÓN + UNIDAD
        ↓
ENTRADA / PRODUCCIÓN / DEVOLUCIÓN / REGULARIZACIÓN
        ↓
MOVIMIENTO CANÓNICO
        ↓
EXISTENCIA POR SEDE → LOC → POSICIÓN
                         ↘ LPN → CONTENIDO
        ↓
ESTADO: FÍSICO / RESERVADO / DISPONIBLE / TRÁNSITO / CUARENTENA / DAÑO / VENCIMIENTO
        ↓
CONSUMO / VENTA / TRASLADO / REMISIÓN / AJUSTE / DISPOSICIÓN
```

---

#### 8. Estados canónicos mínimos

##### 8.1. LOC

```text
draft → active → blocked → closing → closed → retired
```

##### 8.2. LPN

```text
draft → active → sealed → in_transit → opened → closed → voided → relabel_required
```

##### 8.3. Lote

```text
identified → pending_inspection → released → quarantined → blocked → depleted → expired → disposed
```

##### 8.4. Reserva

```text
draft → active → partially_consumed → consumed → released → expired → cancelled
```

##### 8.5. Movimiento

```text
pending → committed → failed → reversed → reconciled
```

##### 8.6. Traslado o remisión física

```text
requested → allocated → prepared → dispatched → in_transit → partially_received → received → difference_open → cancelled → closed
```

##### 8.7. Conteo

```text
draft → open → captured → recount_required → submitted → approved → adjusted → closed → cancelled
```

##### 8.8. Diferencia

```text
identified → under_investigation → justified → adjustment_requested → adjusted → rejected → closed
```

##### 8.9. Condición o excursión

```text
normal → warning → excursion_open → under_evaluation → released → quarantined → disposed → closed
```

Los nombres físicos podrán cambiar en E2/E3, pero no podrán colapsar estados con efectos empresariales distintos.

---

#### 9. Propiedad funcional y tecnológica

| Sistema o dominio    | Propiedad                                                                                         | Propietario funcional          |
| -------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------ |
| NEXO                 | ledger, stock, LOC, posición, lote, LPN, reserva, traslado, conteo, diferencia y condición física | Operaciones / Inventario       |
| ORIGO                | orden, recepción empresarial, proveedor y diferencia comercial                                    | Compras                        |
| FOGO                 | lote productivo, consumo esperado/real y producto terminado                                       | Producción                     |
| PULSO / POS externo  | hecho de venta, anulación y devolución validada                                                   | Ventas / Caja                  |
| NUMERA               | valoración, costo y efecto económico derivado                                                     | Finanzas                       |
| VISO                 | superficie administrativa y configuración autorizada                                              | Gerencia / Administración      |
| SHELL / Supabase     | contratos, integridad, autorización, eventos, evidencia y migraciones                             | Tecnología / gobierno de datos |
| Sistemas de sensores | lecturas de condición cuando existan                                                              | Operaciones / Mantenimiento    |

##### 9.1. Regla de administración

Una aplicación podrá exponer pantallas administrativas sin convertirse en fuente de verdad. Toda mutación deberá invocar el contrato propietario del dominio y conservar actor, alcance y resultado.

---

#### 10. Línea base de implementación verificable

| Capacidad actual                    | Estado                                 | Conclusión                                                                                                                      |
| ----------------------------------- | -------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| Catálogo operativo y presentaciones | existente                              | NEXO conserva catálogo, configuración por sede y presentaciones físicas; la semántica debe unificarse con `CAP-SCOPE-004`.      |
| Stock por sede y LOC                | existente parcial                      | Existe consulta y operación, pero la relación ledger–proyecciones y la reconciliación deben cerrarse.                           |
| Stock por presentación              | existente parcial                      | `inventory_stock_by_uom_profile` evita inferir paquetes, pero requiere contrato único con cantidad base.                        |
| Entradas                            | existente parcial                      | Hay entradas manuales y base para recepción; falta cerrar ORIGO → NEXO y lotes de extremo a extremo.                            |
| Ubicación y posiciones              | existente parcial                      | Hay LOC, posiciones, kiosco y stock sin ubicación; falta ciclo completo y reglas de excepción.                                  |
| Movimientos, retiros y traslados    | existente parcial                      | Existen flujos auditables, pero la atomicidad y estados de tránsito no están certificados.                                      |
| Remisiones                          | existente parcial                      | Existe solicitud, preparación, despacho, tránsito y recepción; los efectos reales pueden estar desactivados y deben declararse. |
| Conteo inicial y ajustes            | existente parcial                      | Hay captura y ajuste; falta confirmar historia, investigación, aprobación y cobertura total del catálogo.                       |
| Reservas                            | no verificado                          | No existe evidencia suficiente de una reserva canónica con expiración y liberación.                                             |
| Lotes y vencimientos                | infraestructura parcial                | Existen campos y referencias, pero no un ciclo integral de liberación, FEFO, cuarentena y disposición.                          |
| LPN                                 | infraestructura sin proceso alcanzable | Existen fragmentos de tablas, endpoint y componente, pero la ruta vigente no ofrece un ciclo funcional completo.                |
| Daño, pérdida y cuarentena          | parcial o no verificado                | No existe evidencia de un expediente completo con estados, autorización y efectos.                                              |
| Frío y condiciones                  | manual o no verificado                 | Existen zonas frías reales; no está confirmado un sistema integral de lecturas, alertas, excursiones y cuarentena.              |
| Integraciones                       | parcial                                | ORIGO, FOGO y ventas todavía deben cerrar efectos exactamente una vez y conciliación.                                           |
| Impresión y escaneo                 | existente parcial                      | Printing/Zebra existe, pero la cola y confirmación física no son durables de extremo a extremo.                                 |

---

#### 11. Matriz de decisión de cobertura

| Capacidad   | Objeto                            | Tratamiento         | Aplicación candidata | Justificación                                                                  |
| ----------- | --------------------------------- | ------------------- | -------------------- | ------------------------------------------------------------------------------ |
| `CAP-06.01` | lugares de almacenamiento         | `REUSE_OR_REFACTOR` | NEXO                 | LOC y configuración existentes; normalizar jerarquía, ciclo y códigos.         |
| `CAP-06.02` | productos, lotes y recipientes    | `REUSE_OR_REFACTOR` | NEXO                 | Reusar producto, campos de lote y base LPN; completar semántica y proceso.     |
| `CAP-06.03` | entradas                          | `REUSE_OR_REFACTOR` | NEXO                 | Consolidar entrada física correlacionada con ORIGO, FOGO y devoluciones.       |
| `CAP-06.04` | ubicación y reubicación           | `REUSE_OR_REFACTOR` | NEXO                 | Consolidar LOC, posición, stock no ubicado y movimiento atómico de LPN.        |
| `CAP-06.05` | disponibilidad                    | `REUSE_OR_REFACTOR` | NEXO                 | Derivar disponibilidad desde estados, reservas, tránsito y condición.          |
| `CAP-06.06` | reservas                          | `BUILD`             | NEXO                 | No hay ciclo canónico comprobado; diseñar asignación, expiración y liberación. |
| `CAP-06.07` | consumo y salida                  | `REUSE_OR_REFACTOR` | NEXO                 | Unificar causas y efectos desde producción, ventas, retiros y merma.           |
| `CAP-06.08` | traslados                         | `REUSE_OR_REFACTOR` | NEXO                 | Completar tránsito, recepción, diferencias e idempotencia.                     |
| `CAP-06.09` | solicitud y gestión de remisiones | `REUSE_OR_REFACTOR` | NEXO                 | Mantener proceso, separar documento y efecto físico.                           |
| `CAP-06.10` | preparación y despacho            | `REUSE_OR_REFACTOR` | NEXO                 | Consolidar asignación por LOC/lote/LPN y cantidades reales.                    |
| `CAP-06.11` | recepción de remisiones           | `REUSE_OR_REFACTOR` | NEXO                 | Conservar parcialidad, diferencias y confirmación de destino.                  |
| `CAP-06.12` | conteos                           | `REUSE_OR_REFACTOR` | NEXO                 | Convertir conteos en sesiones versionadas y reconciliables.                    |
| `CAP-06.13` | investigación y ajustes           | `REUSE_OR_REFACTOR` | NEXO                 | Separar observación, investigación, aprobación y movimiento compensatorio.     |
| `CAP-06.14` | vencimiento, daño y pérdida       | `BUILD`             | NEXO                 | Completar estados, FEFO, cuarentena, disposición y evidencia.                  |
| `CAP-06.15` | frío y condiciones                | `BUILD`             | NEXO                 | Construir reglas, lecturas, excursiones, alertas y contingencias.              |

##### 11.1. Resumen de clasificaciones

| Tratamiento         | Cantidad |
| ------------------- | -------- |
| `REUSE_OR_REFACTOR` | 12       |
| `BUILD`             | 3        |
| **Total**           | **15**   |

---

#### 12. CAP-06.01 — Definir lugares de almacenamiento

##### Reglas mínimas

- catalogar sedes, lugares, LOC y posiciones con códigos estables;
- clasificar ambiente, capacidad, compatibilidad, acceso y condición;
- impedir cierre con contenido sin tratamiento;
- separar lugar físico de área organizacional y centro de costo.

##### Destinos canónicos

- `NEXO-UX-014` a `NEXO-UX-016`
- `NEXO-DOM-007`
- `SUPA-AUD-019`
- `CAP-SCOPE-013`

---

#### 13. CAP-06.02 — Identificar productos, lotes y recipientes

##### Reglas mínimas

- identificar producto, presentación, lote, serial, contenedor y LPN sin fusionarlos;
- conservar origen de lote y atributos de vencimiento;
- definir tipos y ciclo de LPN antes de completar interfaz;
- resolver etiqueta y reetiquetado sin duplicar identidad.

##### Destinos canónicos

- `NEXO-DOM-001` a `NEXO-DOM-007`
- `NEXO-DOM-019` a `NEXO-DOM-024`
- `NEXO-UX-026` a `NEXO-UX-029`
- `NEXO-UX-036` a `NEXO-UX-038`

---

#### 14. CAP-06.03 — Registrar entradas

##### Reglas mínimas

- registrar origen, documento, producto, presentación, cantidad, lote, condición y destino;
- admitir parcialidad y cuarentena inicial;
- separar entrada física de compra y hecho económico;
- usar correlación e idempotencia.

##### Destinos canónicos

- `NEXO-UX-014`
- `ORIGO-UX-009` a `ORIGO-UX-014`
- `INT-PROC-001` a `INT-PROC-005`
- `PROC-CAT-002`

---

#### 15. CAP-06.04 — Ubicar y reubicar existencias

##### Reglas mínimas

- exigir ubicación válida o excepción transitoria tipada;
- registrar origen y destino;
- mover contenido LPN atómicamente;
- evitar cantidad simultánea en posición, LOC y LPN.

##### Destinos canónicos

- `NEXO-UX-015`
- `NEXO-UX-016`
- `NEXO-DOM-007`
- `NEXO-DOM-021`
- `NEXO-DOM-022`

---

#### 16. CAP-06.05 — Consultar disponibilidad

##### Reglas mínimas

- mostrar físico, reservado, disponible, tránsito y no utilizable por separado;
- permitir descomposición por sede, LOC, lote, presentación y estado;
- declarar timestamp y frescura;
- explicar diferencias o conciliaciones pendientes.

##### Destinos canónicos

- `NEXO-UX-003` a `NEXO-UX-007`
- `SUPA-ARC-005`
- `SUPA-ARC-006`
- `CAP-SCOPE-017`

---

#### 17. CAP-06.06 — Reservar o separar existencias

##### Reglas mínimas

- crear reserva con propósito, cantidad, prioridad y expiración;
- asignar lote o permitir asignación posterior según política;
- evitar sobreasignación concurrente;
- liberar, consumir o cancelar sin doble efecto.

##### Destinos canónicos

- `PROC-CAT-002`
- `PROC-CAT-009` a `PROC-CAT-018`
- `PROC-ACTOR-003`
- `NEXO-UX-001`
- `NEXO-AUTH-030`

---

#### 18. CAP-06.07 — Registrar consumo y salida

##### Reglas mínimas

- distinguir venta, producción, retiro, merma, devolución y uso interno;
- validar cantidad disponible y unidad;
- vincular origen empresarial;
- compensar anulaciones sin borrar.

##### Destinos canónicos

- `NEXO-UX-017`
- `FOGO-UX-012`
- `INT-PROD-001` a `INT-PROD-005`
- `INT-POS-015` a `INT-POS-020`
- `INT-SALES-001` a `INT-SALES-011`

---

#### 19. CAP-06.08 — Trasladar entre lugares

##### Reglas mínimas

- registrar origen, destino, despacho, tránsito, recepción y diferencias;
- diferenciar traslado interno y entre sedes;
- bloquear disponibilidad durante tránsito;
- soportar parcialidad y compensación.

##### Destinos canónicos

- `NEXO-UX-016`
- `NEXO-UX-022`
- `PROC-CAT-009` a `PROC-CAT-018`
- `TREQ-NEXO-011`

---

#### 20. CAP-06.09 — Solicitar y gestionar remisiones

##### Reglas mínimas

- conservar solicitud, edición, cancelación y autorización;
- mantener presentaciones mínimas y unidades canónicas;
- mostrar si los efectos de inventario están activos;
- evitar que el documento sustituya el movimiento.

##### Destinos canónicos

- `NEXO-UX-009`
- `NEXO-AUTH-004` a `NEXO-AUTH-005`
- `TREQ-NEXO-006`
- `CAP-SCOPE-011`

---

#### 21. CAP-06.10 — Preparar y despachar remisiones

##### Reglas mínimas

- asignar cantidades reales por LOC, lote, presentación o LPN;
- permitir división de líneas y faltantes;
- registrar cargue y despacho;
- emitir efectos exactamente una vez.

##### Destinos canónicos

- `NEXO-UX-010` a `NEXO-UX-012`
- `NEXO-AUTH-006` a `NEXO-AUTH-009`
- `NEXO-DOM-023`
- `TREQ-INTEGRATION-011`

---

#### 22. CAP-06.11 — Recibir y confirmar remisiones

##### Reglas mínimas

- registrar recibido, faltante, sobrante, daño y rechazo;
- ubicar o dejar pendiente controlado;
- conservar recepción parcial;
- conciliar origen, tránsito y destino.

##### Destinos canónicos

- `NEXO-UX-013`
- `NEXO-AUTH-010`
- `NEXO-UX-022`
- `TREQ-NEXO-006`
- `TREQ-INTEGRATION-011`

---

#### 23. CAP-06.12 — Contar inventario

##### Reglas mínimas

- definir alcance y corte de sesión;
- capturar observación sin revelar cantidad teórica cuando aplique;
- permitir recuento y doble control;
- conservar historia y métricas.

##### Destinos canónicos

- `NEXO-UX-018`
- `NEXO-AUTH-012`
- `NEXO-AUTH-027`
- `PROC-ACTOR-003`
- `CAP-SCOPE-017`

---

#### 24. CAP-06.13 — Investigar y ajustar diferencias

##### Reglas mínimas

- crear diferencia antes del ajuste;
- clasificar causa y evidencia;
- separar capturador y aprobador;
- emitir movimiento compensatorio atómico.

##### Destinos canónicos

- `NEXO-UX-019`
- `NEXO-UX-022`
- `NEXO-AUTH-011`
- `NEXO-AUTH-027`
- `SUPA-AUD-018`
- `SUPA-AUD-019`

---

#### 25. CAP-06.14 — Controlar vencimiento, daño y pérdida

##### Reglas mínimas

- calcular alertas con reglas por producto y lote;
- aplicar FEFO sobre inventario liberado;
- gestionar cuarentena, daño, pérdida, disposición, devolución o liberación;
- conservar trazabilidad de cantidad y costo.

##### Destinos canónicos

- `PROC-CAT-002`
- `PROC-CAT-009` a `PROC-CAT-018`
- `NEXO-DOM-010`
- `NEXO-DOM-017`
- `NEXO-DOM-023`
- `CAP-SCOPE-003`
- `CAP-SCOPE-008`

---

#### 26. CAP-06.15 — Controlar frío y condiciones de almacenamiento

##### Reglas mínimas

- definir LOC y productos sujetos a condición;
- registrar lecturas y fuente;
- detectar excursión y generar evaluación;
- activar contingencia por red, energía, equipo o sensor.

##### Destinos canónicos

- `PROC-CAT-002`
- `PROC-CAT-009` a `PROC-CAT-018`
- `CAP-SCOPE-003`
- `CAP-SCOPE-013`
- `CAP-SCOPE-015`
- `CAP-SCOPE-018`

---

#### 27. Fronteras con otros dominios

##### 27.1. Catálogo

NEXO consumirá producto, presentación, unidad y especificación canónicos; no los redefinirá por operación.

##### 27.2. Compras

ORIGO será fuente de orden y recepción empresarial; NEXO será fuente de entrada, lote, condición y ubicación.

##### 27.3. Producción

FOGO será fuente del lote productivo y ejecución; NEXO materializará consumo y producto terminado.

##### 27.4. Ventas

PULSO o POS externo emitirá venta validada; NEXO aplicará salida exactamente una vez.

##### 27.5. Activos

CAP-07 gobernará activos y contenedores permanentes; CAP-06 gobernará el contenido inventariable y LPN.

##### 27.6. Logística

CAP-11 gobernará ruta, vehículo y entrega; NEXO gobernará cantidades, tránsito y recepción de inventario.

##### 27.7. Finanzas

NUMERA consumirá valoración y eventos; no modificará cantidades físicas.

##### 27.8. SST e inocuidad

Los estados de cuarentena y condición podrán recibir decisiones de procesos de SST o calidad sin exponer datos médicos.

##### 27.9. Instalaciones

CAP-13 gobernará equipos de frío y mantenimiento; NEXO relacionará el impacto sobre existencia.

##### 27.10. Documentos

Etiquetas, actas y evidencia se conservarán según CAP-16 sin convertirse en fuente de saldo.

##### 27.11. Analítica

CAP-17 calculará indicadores desde eventos cerrados y conciliados.

##### 27.12. Continuidad

CAP-18 definirá contingencias y recuperación sin perder ni duplicar movimientos.


---

#### 28. Información conceptual requerida

##### 28.1. Identidad de existencia

- `product_id`
- `presentation_id opcional`
- `canonical_quantity`
- `canonical_unit`
- `captured_quantity`
- `captured_unit`
- `lot_id opcional`
- `serial_id opcional`
- `condition_status`
- `owner_organization_id`

##### 28.2. Ubicación

- `site_id`
- `storage_place_id opcional`
- `loc_id`
- `position_id opcional`
- `lpn_id opcional`
- `unlocated_reason opcional`
- `effective_from`
- `effective_to`

##### 28.3. Movimiento

- `movement_id`
- `movement_type`
- `source_type`
- `source_id`
- `idempotency_key`
- `from_state`
- `to_state`
- `quantity`
- `actor`
- `operational_context`
- `occurred_at`
- `committed_at`
- `reversal_of opcional`

##### 28.4. Lote

- `lot_id`
- `lot_type`
- `lot_code`
- `supplier_lot_code opcional`
- `production_batch_id opcional`
- `manufactured_at`
- `received_at`
- `expiry_date`
- `release_status`
- `specification_version`

##### 28.5. LPN

- `lpn_id`
- `code`
- `type`
- `status`
- `site_id`
- `loc_id`
- `physical_container_id opcional`
- `parent_lpn_id opcional`
- `capacity`
- `weight`
- `sealed_at`
- `closed_at`

##### 28.6. Reserva

- `reservation_id`
- `purpose`
- `source_id`
- `product_id`
- `requested_qty`
- `allocated_qty`
- `lot_policy`
- `priority`
- `expires_at`
- `status`

##### 28.7. Conteo y diferencia

- `count_session_id`
- `scope`
- `snapshot_at`
- `observed_qty`
- `expected_qty_snapshot`
- `difference_qty`
- `recount`
- `cause`
- `evidence`
- `decision`
- `adjustment_movement_id`

##### 28.8. Condición

- `reading_id`
- `condition_type`
- `value`
- `unit`
- `source_device`
- `loc_id`
- `captured_at`
- `quality_status`
- `threshold_version`
- `excursion_id opcional`


---

#### 29. Eventos e integraciones requeridos

```text
inventory.entry.requested
inventory.entry.committed
inventory.location.assigned
inventory.location.changed
inventory.reservation.created
inventory.reservation.released
inventory.reservation.consumed
inventory.movement.committed
inventory.movement.reversed
inventory.transfer.dispatched
inventory.transfer.received
inventory.remission.inventory_effect_pending
inventory.remission.inventory_effect_committed
inventory.count.opened
inventory.count.submitted
inventory.difference.identified
inventory.adjustment.approved
inventory.adjustment.committed
inventory.lot.released
inventory.lot.quarantined
inventory.lot.expired
inventory.condition.excursion_opened
inventory.condition.excursion_resolved
inventory.lpn.created
inventory.lpn.packed
inventory.lpn.moved
inventory.lpn.closed
inventory.reconciliation.required
inventory.reconciliation.completed
```

##### 29.1. Integraciones obligatorias

| Origen                    | Contrato hacia NEXO                    | Efecto esperado                                                    |
| ------------------------- | -------------------------------------- | ------------------------------------------------------------------ |
| ORIGO                     | recepción aprobada y líneas físicas    | entrada, lote, condición y ubicación exactamente una vez           |
| FOGO                      | consumo y finalización de lote         | salida de insumos y entrada de terminado exactamente una vez       |
| PULSO / POS externo       | venta, anulación y devolución validada | salida o compensación exactamente una vez                          |
| NEXO remisiones           | despacho, tránsito y recepción         | transferencia correlacionada sin duplicar origen/destino           |
| Sensores o captura manual | lectura de condición                   | evaluación y posible excursión sin mutación automática no aprobada |
| NUMERA                    | consulta de valoración y eventos       | sin escritura directa de cantidades                                |

---

#### 30. Autorización y segregación

##### 30.1. Capacidades separadas

- consultar existencia;
- crear o administrar LOC;
- registrar entrada;
- ubicar y reubicar;
- reservar y liberar;
- retirar o consumir;
- despachar;
- recibir;
- capturar conteo;
- aprobar diferencia;
- ejecutar ajuste;
- cambiar condición;
- liberar cuarentena;
- declarar daño o pérdida;
- crear o cerrar LPN;
- empacar o desempacar;
- imprimir o reimprimir;
- consultar costos;
- exportar información.

##### 30.2. Reglas

- capturar un conteo no otorgará permiso para aprobar el ajuste;
- despachar no otorgará permiso para confirmar la recepción;
- registrar daño no otorgará permiso para disponer o liberar;
- crear una reserva no otorgará permiso para sobreasignar;
- la visibilidad de costo se separará de la operación física;
- las mutaciones validarán sede, área, rol operativo y dispositivo cuando corresponda;
- la simulación no producirá efectos reales;
- cada acción conservará actor real y actor operativo.

---

#### 31. Experiencia por actor

##### 31.1. Solicitante o área usuaria

- consultar disponibilidad comprensible;
- solicitar remisión o reserva;
- ver sustitución, faltante y estado;
- no editar stock.

##### 31.2. Bodeguero

- recibir, ubicar, preparar, mover, retirar y contar;
- usar escáner, tablet, LOC y presentación real;
- ver tareas pendientes y excepciones;
- no aprobar sus propias diferencias salvo política.

##### 31.3. Receptor de sede

- confirmar recibido por línea;
- registrar faltante, sobrante, daño o rechazo;
- ubicar o enviar a cola de ubicación;
- conservar evidencia mínima.

##### 31.4. Supervisor de inventario

- ver conciliaciones, stock no ubicado, vencimientos, reservas y diferencias;
- aprobar ajustes según umbral;
- liberar o bloquear estados autorizados;
- consultar historial.

##### 31.5. Producción

- ver insumos disponibles y reservados;
- consumir desde lote/LOC válido;
- registrar terminado y merma mediante FOGO;
- no modificar proyecciones directamente.

##### 31.6. Compras

- ver recepción física correlacionada;
- resolver con proveedor sin alterar stock;
- consultar lotes y diferencias necesarias;
- no confirmar ubicación física.

##### 31.7. Gerencia y auditoría

- consultar saldos, movimientos, diferencias y riesgos;
- ver fuente y frescura;
- distinguir dato confirmado de pendiente;
- exportar solo con autorización.


---

#### 32. Operación offline y contingencia

- la consulta offline se marcará como caché con timestamp y no como saldo actual;
- cada comando pendiente tendrá ID local e idempotency key;
- la sincronización revalidará permisos, disponibilidad, lote, ubicación y versión;
- un conflicto de cantidad, lote o ubicación requerirá resolución explícita;
- una caída durante impresión no marcará el trabajo como confirmado;
- una caída de energía o frío activará procedimiento operativo independiente de la aplicación;
- los formularios en papel de contingencia tendrán numeración, custodia y posterior conciliación;
- la recuperación demostrará que no se perdieron ni duplicaron movimientos.

---

#### 33. Evidencia, conservación y auditoría

- ledger y movimientos correlacionados;
- snapshots o proyecciones reconciliables;
- sesiones y líneas de conteo;
- recuentos y aprobaciones;
- lotes, vencimientos y cambios de condición;
- reservas y liberaciones;
- traslados, remisiones y recepciones;
- contenido y movimientos de LPN;
- lecturas y excursiones de condición;
- etiquetas, reimpresiones y anulaciones;
- fallos, reintentos, reversos y conciliaciones;
- exportaciones y accesos sensibles.

La retención exacta se resolverá en `CAP-SCOPE-016`; ningún cierre autoriza eliminar historia referenciada.

---

#### 34. Patrones legacy destinados a retiro

- actualizar stock por sede, LOC y posición mediante llamadas independientes sin contrato atómico;
- usar una proyección mutable como verdad sin movimiento correlacionado;
- inferir presentaciones físicas desde stock base;
- aplicar unidad o modalidad por fallback silencioso;
- permitir stock no ubicado sin antigüedad ni responsable;
- considerar una ruta, tabla o componente LPN como proceso implementado;
- contabilizar contenido LPN también como stock suelto;
- mover un LPN sin mover todo su contenido;
- usar texto libre como lote o estado de condición sin identidad canónica;
- reservar mediante notas, chats o reducción manual de stock;
- completar remisión sin declarar si publicó inventario;
- usar conteo como sobrescritura directa;
- permitir que quien cuenta apruebe toda diferencia por defecto;
- eliminar lote vencido o cantidad dañada para “limpiar” el sistema;
- usar stock físico como disponibilidad comercial;
- permitir salida negativa sin política;
- considerar una lectura aislada como cumplimiento de frío;
- limpiar una cola de impresión antes del resultado del envío;
- duplicar movimientos por reintento de ORIGO, FOGO o ventas.

`RETIRE` aplica a estos patrones, no a las capacidades empresariales.

---

#### 35. Preguntas pendientes reutilizadas

No se crean preguntas nuevas.

| Pregunta            | Uso dentro de esta tarea                                          | Puerta de resolución                                             |
| ------------------- | ----------------------------------------------------------------- | ---------------------------------------------------------------- |
| `DAT-04`            | fuente operativa actual de cantidades disponibles                 | `NEXO-UX-001`, migración y readiness                             |
| `DAT-05`            | visibilidad actual entre sedes                                    | diseño E2 y matriz territorial                                   |
| `DAT-08` a `DAT-10` | historia real de solicitudes, despachos y recepciones de remisión | `NEXO-UX-009` a `NEXO-UX-013` antes de migración                 |
| `DAT-11`            | historia actual de conteos                                        | `NEXO-UX-018`, migración y readiness                             |
| `DAT-26`            | evidencia actual de correcciones de cantidad                      | `NEXO-UX-019` y `NEXO-AUTH-027`                                  |
| `OPE-01`            | lugares reales de almacenamiento en frío                          | `CAP-SCOPE-013` y diseño físico E2                               |
| `OPE-04`            | autoridad para modificar una solicitud de remisión                | `NEXO-AUTH-005` y diseño E2                                      |
| `OPE-06`            | autoridad real para aprobar una diferencia de conteo              | `NEXO-AUTH-027` y matriz de aprobación                           |
| `COM-01`            | origen físico del inventario de Vaila Vainilla                    | `CAP-SCOPE-009`, `CAP-SCOPE-011` y diseño territorial            |
| `TEC-06`            | fuente técnica actual de inventario                               | respondida: NEXO y estructuras compartidas; usar como línea base |

Las preguntas no bloquean esta clasificación conceptual, pero serán obligatorias antes de migrar historia, fijar ubicaciones definitivas o aprobar un piloto con efectos reales.

---

#### 36. Riesgos principales

| Riesgo                                    | Severidad | Control principal                       |
| ----------------------------------------- | --------- | --------------------------------------- |
| saldo imposible de reconstruir            | crítica   | ledger y proyecciones reconciliables    |
| doble contabilización entre LOC y LPN     | crítica   | representación exclusiva                |
| salida duplicada por integración          | crítica   | idempotencia y correlación              |
| stock físico vendido aunque esté retenido | crítica   | estados y disponibilidad derivada       |
| lote o vencimiento perdido                | crítica   | identidad y obligatoriedad por producto |
| producto vencido seleccionado             | crítica   | FEFO y bloqueo                          |
| reserva sobreasignada                     | crítica   | concurrencia y expiración               |
| conteo convertido en ajuste silencioso    | crítica   | sesión, diferencia y aprobación         |
| remisión sin efecto o con doble efecto    | crítica   | estado de publicación y conciliación    |
| stock no ubicado indefinido               | alta      | cola y SLA de ubicación                 |
| LPN movido sin contenido                  | crítica   | movimiento atómico                      |
| cadena de frío no demostrable             | crítica   | lecturas, excursión y contingencia      |
| daño o pérdida borrados                   | crítica   | estado y disposición auditada           |
| unidad convertida de forma distinta       | crítica   | contrato único de medición              |
| cola offline o impresión duplicada        | alta      | idempotencia y estado durable           |

---

#### 37. Hallazgos y destinos canónicos

| ID                  | Hallazgo                                                                                                | Riesgo  | Tarea propietaria                                                                                               | Momento                    |
| ------------------- | ------------------------------------------------------------------------------------------------------- | ------- | --------------------------------------------------------------------------------------------------------------- | -------------------------- |
| H-CAP-SCOPE-006-001 | ledger y proyecciones de stock se actualizan desde rutas con atomicidad no demostrada                   | crítica | `SUPA-AUD-018`; `SUPA-AUD-019`; `SUPA-ARC-003`; `SUPA-ARC-005`; `SUPA-ARC-006`; `SUPA-ARC-012` a `SUPA-ARC-014` | E3 antes de efectos reales |
| H-CAP-SCOPE-006-002 | la jerarquía sede–LOC–posición y el ciclo de cierre requieren consolidación                             | alta    | `NEXO-UX-014` a `NEXO-UX-016`; `NEXO-DOM-007`; `CAP-SCOPE-013`                                                  | E2/E3                      |
| H-CAP-SCOPE-006-003 | el stock sin ubicación existe como superficie operativa y requiere gobierno temporal                    | alta    | `NEXO-UX-015`; `NEXO-UX-022`; `PROC-CAT-013`                                                                    | E2 antes de piloto         |
| H-CAP-SCOPE-006-004 | LPN conserva infraestructura fragmentada sin ciclo operativo alcanzable                                 | crítica | `NEXO-DOM-002` a `NEXO-DOM-008`; `NEXO-DOM-019` a `NEXO-DOM-024`; `NEXO-UX-026` a `NEXO-UX-040`                 | E2/E3 antes de uso         |
| H-CAP-SCOPE-006-005 | la identidad de LPN y contenedor físico todavía requiere separación completa                            | crítica | `NEXO-DOM-019`; `NEXO-DOM-020`; `CAP-SCOPE-007`                                                                 | E2                         |
| H-CAP-SCOPE-006-006 | lote y vencimiento existen parcialmente pero no están cerrados de extremo a extremo                     | crítica | `PROC-CAT-002`; `NEXO-DOM-023`; `CAP-SCOPE-008`; `CAP-SCOPE-013`                                                | E2/E3                      |
| H-CAP-SCOPE-006-007 | no existe evidencia suficiente de un ciclo canónico de reservas                                         | crítica | `PROC-CAT-002`; `PROC-CAT-009` a `PROC-CAT-018`; `NEXO-UX-001`                                                  | E2                         |
| H-CAP-SCOPE-006-008 | cantidad física, reservada, disponible, tránsito y cuarentena no tienen un contrato integral comprobado | crítica | `SUPA-AUD-019`; `SUPA-AUD-022`; `PROC-CAT-002`; `CAP-SCOPE-017`                                                 | E2/E3                      |
| H-CAP-SCOPE-006-009 | la recepción ORIGO → NEXO no está cerrada con parcialidad, lote y diferencias                           | crítica | `INT-PROC-001` a `INT-PROC-005`; `ORIGO-UX-009` a `ORIGO-UX-015`; `NEXO-UX-014`                                 | E2/E4                      |
| H-CAP-SCOPE-006-010 | FOGO → NEXO no está cerrado para consumo y producto terminado por lote                                  | crítica | `INT-PROD-001` a `INT-PROD-005`; `FOGO-UX-012`; `FOGO-UX-013`                                                   | E2/E4                      |
| H-CAP-SCOPE-006-011 | ventas externas o PULSO todavía deben producir salida exactamente una vez                               | crítica | `INT-POS-011` a `INT-POS-020`; `INT-SALES-001` a `INT-SALES-011`                                                | E4 antes de efectos        |
| H-CAP-SCOPE-006-012 | las remisiones pueden existir con publicación de inventario desactivable                                | crítica | `NEXO-UX-009` a `NEXO-UX-013`; `TREQ-NEXO-006`; `TREQ-INTEGRATION-011`                                          | E2/E5                      |
| H-CAP-SCOPE-006-013 | la conservación real de conteos anteriores sigue pendiente de confirmación                              | alta    | `DAT-11`; `NEXO-UX-018`                                                                                         | antes de migración         |
| H-CAP-SCOPE-006-014 | la evidencia y autoridad actuales para corregir cantidades no están confirmadas                         | crítica | `DAT-26`; `OPE-06`; `NEXO-UX-019`; `NEXO-AUTH-027`                                                              | E2 antes de piloto         |
| H-CAP-SCOPE-006-015 | los lugares reales de frío y sus responsables siguen pendientes de validación                           | alta    | `OPE-01`; `CAP-SCOPE-013`                                                                                       | antes de diseño físico     |
| H-CAP-SCOPE-006-016 | no existe integración comprobada de lecturas, excursiones y cuarentena por cadena de frío               | crítica | `PROC-CAT-002`; `CAP-SCOPE-003`; `CAP-SCOPE-013`; `CAP-SCOPE-015`; `CAP-SCOPE-018`                              | E2/E4                      |
| H-CAP-SCOPE-006-017 | daño, pérdida, vencimiento, cuarentena y disposición no forman un ciclo integral comprobado             | crítica | `NEXO-DOM-010`; `NEXO-DOM-017`; `PROC-CAT-009` a `PROC-CAT-018`                                                 | E2                         |
| H-CAP-SCOPE-006-018 | el origen del inventario de Vaila Vainilla sigue sin confirmar                                          | alta    | `COM-01`; `CAP-SCOPE-009`; `CAP-SCOPE-011`                                                                      | antes de diseño de canal   |
| H-CAP-SCOPE-006-019 | la precedencia de unidades, presentaciones y perfiles permanece distribuida entre consumidores          | crítica | `CAP-SCOPE-004`; `SHELL-CON-001`; `SHELL-CON-009`; `SHELL-CON-012`; `SUPA-AUD-019`                              | E3                         |
| H-CAP-SCOPE-006-020 | impresión, escaneo y operación offline no tienen confirmación durable de extremo a extremo              | alta    | `NEXO-UX-020`; `NEXO-UX-037`; `NEXO-UX-038`; `QUEUE-ARC-001` a `QUEUE-ARC-010`                                  | E4/E5                      |

Todos los hallazgos tienen propietario y puerta. No queda pendiente narrativo sin destino.

---

#### 38. Decisiones canónicas resultantes

1. NEXO será propietario del estado físico y la trazabilidad de inventario.
2. ORIGO, FOGO y ventas emitirán hechos de origen; no escribirán stock por su cuenta.
3. Producto, presentación, existencia, lote, serial, LOC, posición, LPN y contenedor serán conceptos distintos.
4. La jerarquía física utilizará sede, LOC y posición opcional con códigos estables.
5. El stock no ubicado será una excepción temporal controlada.
6. Un LPN será identidad logística de contenido y no ubicación ni activo.
7. El contenido de LPN no se contabilizará también como stock suelto.
8. Los lotes conservarán origen, vigencia y estado de liberación.
9. La cantidad física no equivaldrá a disponibilidad.
10. El ledger y las proyecciones tendrán un contrato único y reconciliable.
11. Toda mutación será atómica o idempotente y compensable.
12. Todo movimiento tendrá tipo, causa, documento, actor y contexto.
13. Las reservas serán explícitas, temporales y separadas del stock físico.
14. El tránsito no estará disponible en origen ni confirmado en destino.
15. Las remisiones declararán si el efecto de inventario está pendiente o comprometido.
16. El conteo será observación; la diferencia, investigación; el ajuste, decisión autorizada.
17. Vencimiento, daño, pérdida y cuarentena no se resolverán borrando.
18. FEFO operará solo sobre existencia liberada y utilizable.
19. La cadena de frío tendrá reglas, lecturas, excursiones y contingencias.
20. Las unidades y presentaciones usarán una equivalencia canónica única.
21. El stock negativo no será comportamiento normal ni sustituto de demanda.
22. Las etiquetas y escáneres resolverán identidades; no serán fuentes de verdad.
23. La familia `CAP-06` se considera parcialmente implementada y reutilizable, pero no cerrada.

---

#### 39. Requisitos de prueba derivados

Esta tarea genera tres requisitos distintos y no duplicados:

```text
TREQ-NEXO-011
TREQ-NEXO-012
TREQ-INTEGRATION-011
```

Los detalles completos se incorporan exclusivamente en el archivo canónico `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` regenerado.

No se entregan filas independientes.

##### 39.1. `TREQ-NEXO-011`

Protege ledger, proyecciones, estados de existencia, disponibilidad, reservas, ubicación, movimientos, conteos y ajustes, incluyendo atomicidad, idempotencia y ausencia de doble contabilización.

##### 39.2. `TREQ-NEXO-012`

Protege lote, vencimiento, FEFO, condición, cuarentena, daño, pérdida, frío y disposición con historia y evidencia.

##### 39.3. `TREQ-INTEGRATION-011`

Protege los efectos exactamente una vez desde ORIGO, FOGO, ventas y remisiones hacia NEXO, con compensación y conciliación.

---

#### 40. Dependencias habilitadas y restricciones

- `CAP-SCOPE-007`;
- `CAP-SCOPE-008`;
- `CAP-SCOPE-009`;
- `CAP-SCOPE-011`;
- `CAP-SCOPE-012`;
- `CAP-SCOPE-013`;
- `CAP-SCOPE-015`;
- `CAP-SCOPE-016`;
- `CAP-SCOPE-017`;
- `CAP-SCOPE-018`;
- `NEXO-DOM-001` a `NEXO-DOM-024`;
- `NEXO-AUTH-001` a `NEXO-AUTH-030`;
- `NEXO-UX-001` a `NEXO-UX-042`;
- `INT-PROC-001` a `INT-PROC-005`;
- `INT-PROD-001` a `INT-PROD-005`;
- `INT-POS-011` a `INT-POS-020`;
- `INT-SALES-001` a `INT-SALES-011`;
- diseño TO-BE de inventario, almacenamiento, lotes, reservas, conteos y frío;
- arquitectura E3 de ledger, proyecciones, ubicaciones, lotes y LPN;
- paquetes E5 de NEXO e integraciones relacionadas.

No autoriza movimientos, ajustes, inventario inicial, migración, impresión, activación de efectos ni operación real.

---

#### 41. Criterios de aceptación

1. las quince subcapacidades tengan tratamiento explícito;
2. producto, existencia, presentación, lote, serial, LOC, posición, LPN y contenedor estén separados;
3. la jerarquía física y ciclo de LOC estén definidos;
4. el stock no ubicado tenga tratamiento temporal controlado;
5. LPN tenga identidad, contenido y movimiento sin doble contabilización;
6. cantidad física, reservada, disponible, tránsito y no utilizable estén separadas;
7. ledger y proyecciones tengan una relación única;
8. las mutaciones sean atómicas o idempotentes y reconciliables;
9. entradas, consumos, salidas y traslados tengan causa y referencia;
10. la reserva tenga propósito, expiración y liberación;
11. las remisiones distingan proceso y efecto de inventario;
12. conteo, diferencia, investigación y ajuste estén separados;
13. lote, vencimiento, FEFO, cuarentena, daño y pérdida tengan ciclo explícito;
14. frío tenga reglas, lecturas, excursiones y contingencia;
15. ORIGO, FOGO, PULSO, NUMERA y NEXO tengan fronteras explícitas;
16. los veinte hallazgos tengan destino;
17. no se creen preguntas narrativas nuevas;
18. se generen los tres requisitos de prueba;
19. el registro `04A` completo tenga 95 requisitos válidos;
20. ninguna fila del registro tenga más o menos de catorce columnas;
21. no se autorice implementación;
22. la continuidad quede en `CAP-SCOPE-007`.

---

#### 42. Resultado y continuidad

**Estado:** PROPUESTA PARA APROBACIÓN

Al aprobarse:

- `CAP-SCOPE-006` será la decisión canónica de cobertura para inventario, almacenamiento, lotes, vencimientos, LOC y LPN;
- `TREQ-NEXO-011`, `TREQ-NEXO-012` y `TREQ-INTEGRATION-011` quedarán incorporados al registro canónico;
- NEXO conservará la propiedad del estado físico y los demás dominios emitirán hechos correlacionados;
- ningún movimiento, ajuste, conteo, migración ni efecto real quedará autorizado;
- la continuidad será:

```text
CAP-SCOPE-007 — Evaluar activos, vajilla, decoración, herramientas, repuestos y mantenimiento
```


### ✅ CAP-SCOPE-007 — Evaluar activos, vajilla, decoración, herramientas, repuestos y mantenimiento

**Estado:** APROBADA  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Dependencia cumplida:** `CAP-SCOPE-006` aprobada  
**Tarea anterior:** `CAP-SCOPE-006`  
**Siguiente tarea reservada:** `CAP-SCOPE-008`  
**Familia evaluada:** `CAP-07 — Gestionar activos, equipos y elementos reutilizables`  
**Naturaleza:** decisión de cobertura empresarial y definición conceptual objetivo  
**Implementación técnica:** no autorizada  
**Migraciones o cambios en Supabase:** no autorizados  
**Movimientos, préstamos, conteos, mantenimientos, reparaciones, bajas o disposiciones reales:** no autorizados  
**Requisitos de prueba generados:** `TREQ-NEXO-013`, `TREQ-NEXO-014`, `TREQ-NEXO-015`, `TREQ-INTEGRATION-012`  
**Actualización del registro de pruebas:** se entrega el archivo `04A` completo regenerado; quedan prohibidas las filas sueltas

---

#### 1. Propósito

Definir el tratamiento objetivo de las capacidades mediante las cuales Vento Group deberá:

- identificar activos individuales, modelos o tipos de activo y reutilizables controlados por cantidad;
- distinguir activo, inventario consumible, repuesto, herramienta, vajilla, decoración, kit, contenedor, LPN y vehículo;
- registrar ubicación, custodia, responsable operativo, usuario, propietario y centro de costo como dimensiones independientes;
- controlar entrega, préstamo, devolución, transferencia, tránsito y tenencia por terceros;
- contar activos individuales y familias por cantidad sin sobrescribir la observación original;
- registrar condición, disponibilidad, daño, pérdida, faltante, hallazgo y recuperación mediante eventos auditables;
- planear y ejecutar mantenimiento preventivo, correctivo, inspección, limpieza técnica y calibración;
- relacionar reparación con diagnóstico, mano de obra, proveedor, repuestos, costo, indisponibilidad y prueba de retorno al servicio;
- controlar garantías, seguros, documentos y reclamaciones sin asumir vigencia por la sola existencia de un archivo;
- gestionar baja, venta, descarte, reemplazo y disposición sin borrar identidad ni historia;
- representar kits y conjuntos con reglas de completitud;
- controlar vehículos y equipos de transporte, kilometraje, combustible, documentos y disponibilidad;
- integrar adquisición, mantenimiento, pérdida y baja con ORIGO y NUMERA sin duplicar fuentes de verdad;
- conservar evidencia suficiente para reconstruir quién tenía cada recurso, dónde estaba, en qué condición y por qué cambió.

La existencia actual de pantallas, tablas, fichas técnicas, conteos, movimientos o formularios de mantenimiento no permite considerar cerrada la familia `CAP-07`. La cobertura exige un ciclo de vida completo y coherente desde el alta hasta la disposición final.

---

#### 2. Pregunta de decisión

`CAP-SCOPE-007` responde:

```text
¿CÓMO DEBE VENTO GROUP IDENTIFICAR, UBICAR, CUSTODIAR, PRESTAR,
CONTAR, MANTENER, REPARAR, ASEGURAR Y RETIRAR SUS ACTIVOS,
REUTILIZABLES, VAJILLA, DECORACIÓN, HERRAMIENTAS, REPUESTOS,
KITS Y VEHÍCULOS, SIN CONFUNDIR EXISTENCIA FÍSICA, PROPIEDAD,
CUSTODIA, DISPONIBILIDAD, COSTO NI RESPONSABILIDAD?
```

La tarea rechaza equivalencias incorrectas como:

```text
TIPO DE ACTIVO = ACTIVO FÍSICO
```

```text
ACTIVO = PRODUCTO DE INVENTARIO
```

```text
REUTILIZABLE POR CANTIDAD = ACTIVO SERIALIZADO
```

```text
REPUESTO = ACTIVO INSTALADO
```

```text
UBICACIÓN = CUSTODIO = PROPIETARIO
```

```text
USUARIO DEL ACTIVO = RESPONSABLE CONTABLE
```

```text
QR = IDENTIDAD
```

```text
LPN = CONTENEDOR FÍSICO = KIT
```

```text
MOVIMIENTO DE UBICACIÓN = TRANSFERENCIA DE CUSTODIA
```

```text
CONTEO = AJUSTE = BAJA
```

```text
CONDICIÓN = DISPONIBILIDAD
```

```text
REGISTRO DE MANTENIMIENTO = ORDEN DE TRABAJO CERRADA
```

```text
PIEZAS REEMPLAZADAS EN TEXTO = CONSUMO TRAZABLE DE REPUESTOS
```

```text
DOCUMENTO ADJUNTO = GARANTÍA O SEGURO VIGENTE
```

```text
PÉRDIDA = REGISTRO ELIMINADO
```

```text
VEHÍCULO = CONDUCTOR
```

```text
COMPRA DE COMBUSTIBLE = CONSUMO DEL VEHÍCULO
```

---

#### 3. Fuentes consolidadas

- `OPS-ACT-001` — inventario AS-IS de activos y puntos externos de custodia;
- `OPS-AUD-001` a `OPS-AUD-015`;
- `CAP-MAP-001` a `CAP-MAP-015`;
- `CODE-AUD-001` a `CODE-AUD-020`;
- `CAP-SCOPE-001` a `CAP-SCOPE-006`;
- `QA-REG-001` y el Registro Canónico de Requisitos de Prueba;
- la implementación vigente de NEXO para catálogo de tipos de activo, activos individuales, grupos por cantidad, ubicación, movimientos, documentos, conteos y mantenimiento;
- la evidencia de formularios y acciones actuales para identidad, localización, préstamo, devolución, salida a mantenimiento y registros de trabajo;
- la evidencia de que garantías se representan parcialmente como documentos y no como ciclo contractual;
- la evidencia de que repuestos reemplazados pueden conservarse como texto sin consumo físico correlacionado;
- las tareas `NEXO-DOM-001` a `NEXO-DOM-028`, `NEXO-AUTH-021` a `NEXO-AUTH-030` y `NEXO-UX-026` a `NEXO-UX-042`;
- las decisiones aprobadas de inventario, LPN, compras, costos, autorización, documentos, evidencia y continuidad.

Las respuestas y evidencias ya registradas no se vuelven a solicitar.

---

#### 4. Alcance evaluado

- `CAP-07.01` — Identificar y clasificar activos;
- `CAP-07.02` — Registrar ubicación y custodia;
- `CAP-07.03` — Entregar, prestar y devolver;
- `CAP-07.04` — Transferir custodia;
- `CAP-07.05` — Contar activos y reutilizables;
- `CAP-07.06` — Registrar condición, daño, pérdida y faltante;
- `CAP-07.07` — Planear y ejecutar mantenimiento;
- `CAP-07.08` — Gestionar reparación y repuestos;
- `CAP-07.09` — Controlar garantías y seguros;
- `CAP-07.10` — Gestionar baja, venta, descarte o reemplazo;
- `CAP-07.11` — Gestionar kits y conjuntos;
- `CAP-07.12` — Gestionar vehículos y equipos de transporte;
- `CAP-07.13` — Controlar combustible, kilometraje y disponibilidad.

También fija fronteras con catálogo, inventario, compras, logística, instalaciones, SST, documentos, costos, contabilidad, seguros, continuidad y analítica.

---

#### 5. Fuera de alcance

- realizar inventario físico, conteos, préstamos, transferencias o reasignaciones reales;
- mover, reparar, dar de baja, vender, descartar o reemplazar activos;
- declarar propiedad, valor contable, depreciación, cobertura o aseguramiento sin soporte profesional;
- contratar mantenimientos, repuestos, pólizas o servicios;
- definir todavía tasas de depreciación, vida útil contable o tratamiento tributario;
- crear códigos, placas o etiquetas reales;
- migrar activos, documentos, mantenimientos o movimientos históricos;
- crear tablas, vistas, RPC, triggers, buckets, políticas RLS o migraciones;
- diseñar rutas y entregas logísticas, que continuarán en `CAP-SCOPE-011`;
- diseñar mantenimiento de instalaciones como proceso completo, que continuará en `CAP-SCOPE-013`;
- sustituir inspecciones SST, metrología, revisión técnico-mecánica o validación profesional;
- convertir documentos sensibles de vehículos, seguros, facturas o seriales en información pública;
- autorizar uso operativo de un activo únicamente porque aparece como activo en el sistema.

---

#### 6. Principios canónicos

##### 6.1. NEXO será propietario del estado físico del activo

NEXO conservará identidad física, ubicación, custodia, condición, disponibilidad, movimientos, conteos, mantenimiento y disposición operacional.

ORIGO será propietario de la compra o contratación externa; NUMERA será propietario del tratamiento económico y contable que posteriormente se apruebe.

##### 6.2. El modelo o tipo no es el activo físico

Un tipo describe características comunes. Un activo individual representa una unidad física identificable.

Una cafetera de un modelo determinado podrá tener varios activos físicos con serial, estado, ubicación y mantenimiento independientes.

##### 6.3. El control individual y el control por cantidad son distintos

Se utilizará activo individual cuando la unidad requiera serial, placa, QR, mantenimiento, garantía, valor o historia propia.

Se utilizará grupo reutilizable por cantidad cuando varias unidades equivalentes se controlen sin identidad individual razonable, como parte de vajilla, cubiertos, bandejas o decoración repetida.

##### 6.4. Consumible, repuesto, herramienta y activo no son equivalentes

Un consumible se agota por uso. Un repuesto permanece como stock hasta ser consumido o instalado. Una herramienta puede ser activo individual o reutilizable por cantidad según criticidad. Un componente instalado podrá adquirir identidad propia solo cuando lo exija su trazabilidad.

##### 6.5. Propiedad, custodia, ubicación, uso y costo son dimensiones independientes

La presencia de un recurso en una sede no demuestra propiedad. El custodio no necesariamente es quien lo usa. El usuario no necesariamente responde contablemente. El centro de costo no determina la ubicación.

##### 6.6. La identidad será estable y no dependerá del QR

El identificador canónico será inmutable. Códigos visibles, placas, seriales, alias y etiquetas podrán cambiar o reemitirse conservando historial.

Una etiqueta dañada no crea un activo nuevo.

##### 6.7. El ciclo de vida será no destructivo

Alta, activación, préstamo, tránsito, mantenimiento, pérdida, hallazgo, retiro, venta y disposición serán estados o eventos. Ninguno borrará el expediente ni reutilizará su identificador.

##### 6.8. Los movimientos conservarán hecho y responsabilidad

Todo movimiento registrará tipo, origen, destino, custodio anterior, custodio nuevo, actor, fecha efectiva, causa, evidencia y aceptación cuando corresponda.

##### 6.9. La entrega y el préstamo no son simples cambios de ubicación

Deberán conservar receptor, propósito, plazo, condición de salida, fecha prevista, condiciones de devolución y estado de cierre.

##### 6.10. La transferencia de custodia requiere aceptación

Una transferencia podrá quedar pendiente hasta que el receptor confirme. La ubicación física podrá cambiar antes o después, pero no se inferirá custodia por proximidad.

##### 6.11. El conteo es una observación

La captura conservará quién contó, alcance, ubicación, fecha, cantidad o identidad observada y evidencia. Las diferencias se investigarán antes de corregir el registro.

##### 6.12. Condición y disponibilidad serán separadas

Un activo puede estar en condición aceptable pero reservado, prestado o no disponible. También puede estar disponible físicamente pero bloqueado por seguridad, garantía o mantenimiento vencido.

##### 6.13. El mantenimiento tendrá plan, orden y ejecución

Se distinguirán plan de mantenimiento, disparador, orden de trabajo, ejecución, resultado, prueba de retorno al servicio y próxima obligación.

##### 6.14. La reparación consumirá repuestos trazables

Los repuestos deberán reservarse y consumirse desde inventario mediante referencia al activo y a la orden. El texto libre podrá describir trabajo, pero no reemplazará el movimiento de stock.

##### 6.15. Garantía y seguro tendrán vigencia y reclamación

Se conservarán proveedor o asegurador, cobertura, inicio, fin, condiciones, exclusiones, documentos, reclamaciones y resultado. La existencia de un PDF no demuestra cobertura vigente.

##### 6.16. La baja y disposición requerirán segregación

Solicitar, evaluar, autorizar, ejecutar disposición y registrar efecto económico serán pasos diferentes. Quien custodia no aprobará automáticamente la baja.

##### 6.17. Los kits tendrán definición e instancia

La definición indicará componentes y reglas de completitud. La instancia representará un conjunto real. Un kit podrá transportarse en un LPN, pero no será el mismo concepto.

##### 6.18. El vehículo será activo especializado

Vehículo, conductor, custodio, ruta, viaje, documento, mantenimiento y disponibilidad serán entidades o relaciones distintas.

##### 6.19. El kilometraje será monotónico con correcciones auditables

Una lectura menor no sobrescribirá la anterior. Generará corrección, justificación o cambio de odómetro documentado.

##### 6.20. Combustible comprado y combustible consumido no serán equivalentes

La compra tendrá documento y costo; la carga tendrá vehículo, cantidad, lectura, estación y actor; el rendimiento será derivado y sujeto a calidad de datos.

##### 6.21. Los activos externos y en poder de terceros seguirán dentro del control

La ausencia de una sede formal no elimina la obligación de registrar punto externo, tercero, evidencia, fecha prevista de retorno y responsable interno.

##### 6.22. La información financiera será consumida, no duplicada

NEXO emitirá hechos de adquisición, mantenimiento, pérdida y baja. NUMERA determinará su tratamiento económico cuando `CAP-SCOPE-012` lo apruebe.

---

#### 7. Modelo conceptual objetivo

| Concepto                  | Definición                             | No equivale a                    |
| ------------------------- | -------------------------------------- | -------------------------------- |
| tipo o modelo de activo   | plantilla de características comunes   | unidad física                    |
| activo individual         | unidad física con identidad propia     | producto, stock o tipo           |
| grupo reutilizable        | familia controlada por cantidad        | activo serializado               |
| componente o repuesto     | existencia destinada a reparación      | activo instalado automáticamente |
| kit definido              | composición y reglas                   | kit físico                       |
| instancia de kit          | conjunto real y verificable            | LPN                              |
| vehículo                  | activo especializado de transporte     | conductor o viaje                |
| ubicación                 | lugar físico actual                    | custodio o propietario           |
| custodia                  | responsabilidad de tenencia            | uso, propiedad o costo           |
| asignación de uso         | persona o proceso autorizado a usar    | custodia permanente              |
| condición                 | estado físico observado                | disponibilidad                   |
| disponibilidad            | capacidad de ser utilizado             | condición física                 |
| mantenimiento planificado | obligación futura                      | ejecución realizada              |
| orden de trabajo          | expediente de intervención             | evento terminado                 |
| evento de mantenimiento   | trabajo ejecutado y resultado          | plan                             |
| garantía                  | derecho contractual frente a proveedor | seguro                           |
| seguro                    | cobertura frente a riesgos             | garantía                         |
| baja                      | decisión de retirar del servicio       | eliminación del registro         |
| disposición               | destino físico final                   | baja aprobada                    |
| lectura de kilometraje    | observación de medidor                 | viaje o consumo                  |
| carga de combustible      | entrega física al vehículo             | factura de compra                |

---

#### 8. Estados canónicos mínimos

##### 8.1. Estado de registro

```text
BORRADOR
PENDIENTE_VALIDACION
ACTIVO
INACTIVO
RETIRADO
ARCHIVADO
```

##### 8.2. Disponibilidad operacional

```text
DISPONIBLE
ASIGNADO
PRESTADO
EN_TRANSITO
EN_MANTENIMIENTO
BLOQUEADO
NO_DISPONIBLE
NO_LOCALIZADO
```

##### 8.3. Condición

```text
NUEVO
BUENO
REGULAR
DEGRADADO
DAÑADO
INOPERATIVO
PENDIENTE_EVALUACION
```

##### 8.4. Custodia

```text
SIN_ASIGNAR
PENDIENTE_ACEPTACION
ACEPTADA
EN_TRANSFERENCIA
EN_TERCERO
DISPUTADA
CERRADA
```

##### 8.5. Mantenimiento

```text
PLANIFICADO
PROGRAMADO
EN_DIAGNOSTICO
EN_EJECUCION
PENDIENTE_REPUESTO
PENDIENTE_PRUEBA
COMPLETADO
CANCELADO
```

##### 8.6. Garantía o reclamación

```text
VIGENTE
POR_VENCER
VENCIDA
RECLAMACION_ABIERTA
EN_EVALUACION
APROBADA
RECHAZADA
CERRADA
```

##### 8.7. Baja y disposición

```text
PROPUESTA
EN_EVALUACION
APROBADA
RECHAZADA
PENDIENTE_DISPOSICION
DISPUESTA
VENDIDA
REEMPLAZADA
CANCELADA
```

---

#### 9. Propiedad funcional y tecnológica

| Dominio                                   | Propiedad                                                                                        |
| ----------------------------------------- | ------------------------------------------------------------------------------------------------ |
| Jefatura de Operaciones                   | gobierno operativo del inventario patrimonial y prioridad de levantamiento                       |
| responsable de sede o área                | validación de ubicación, uso, condición y custodia observada                                     |
| custodio                                  | tenencia y devolución; no propiedad ni aprobación de baja                                        |
| responsable de mantenimiento              | plan, diagnóstico, ejecución, prueba y liberación técnica                                        |
| NEXO                                      | expediente físico, movimientos, conteos, mantenimiento y flota                                   |
| ORIGO                                     | compra de activos, repuestos, mantenimiento externo, garantías de proveedor y contratos          |
| NUMERA                                    | costo, gasto, activo contable, depreciación, pérdida, venta y baja económica cuando sea aprobado |
| VISO                                      | supervisión administrativa y enlaces; no fuente del activo                                       |
| SHELL / Supabase                          | contratos, integridad, autorización, evidencia técnica y migraciones                             |
| asesoría contable, jurídica o aseguradora | validaciones profesionales y externas                                                            |

---

#### 10. Línea base de implementación verificable

La implementación actual permite afirmar que:

- existe una superficie de inventario de activos en NEXO;
- existen tipos o modelos, activos individuales y grupos repetidos controlados por cantidad;
- existen campos para código, placa, serial, marca, modelo, ubicación y condición;
- existen movimientos de activo y etiquetas de préstamo, devolución y salida a mantenimiento;
- existen sesiones y líneas de conteo de activos;
- existen documentos como ficha técnica, manual, factura y garantía;
- existen registros parciales de mantenimiento, próxima fecha, trabajo ejecutado y piezas reemplazadas;
- existe separación conceptual inicial entre catálogo y activo físico;
- no existe evidencia suficiente de un ciclo integral de seguros, reclamaciones, baja, venta, disposición, kits, flota, kilometraje y combustible;
- la integración física y económica de repuestos, mantenimiento, adquisición y baja todavía no está cerrada.

La clasificación `REUSE_OR_REFACTOR` no declara estas capacidades terminadas; reconoce infraestructura útil que deberá someterse al modelo objetivo.

---

#### 11. Matriz de decisión de cobertura

| Capacidad                                                         | Tratamiento         | Propietario objetivo    | Decisión                                                                                                                                                                                    |
| ----------------------------------------------------------------- | ------------------- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `CAP-07.01` — Identificar y clasificar activos                    | `REUSE_OR_REFACTOR` | NEXO                    | Conservar el catálogo y las superficies actuales, pero separar tipo o modelo, activo individual, reutilizable por cantidad, repuesto, kit, vehículo y consumible mediante reglas canónicas. |
| `CAP-07.02` — Registrar ubicación y custodia                      | `REUSE_OR_REFACTOR` | NEXO                    | Reutilizar ubicación y movimientos existentes, incorporando custodia, responsable operativo, tercero, sede, LOC y vigencias sin inferir propiedad.                                          |
| `CAP-07.03` — Entregar, prestar y devolver                        | `REUSE_OR_REFACTOR` | NEXO                    | Formalizar entrega, préstamo y devolución como expedientes con actor, receptor, vencimiento, condición, evidencia y cierre; no como simple cambio de ubicación.                             |
| `CAP-07.04` — Transferir custodia                                 | `REUSE_OR_REFACTOR` | NEXO                    | Convertir las transferencias actuales en eventos de custodia aceptados, rechazados o pendientes, conservando origen, destino, condición y responsabilidad.                                  |
| `CAP-07.05` — Contar activos y reutilizables                      | `REUSE_OR_REFACTOR` | NEXO                    | Conservar sesiones y líneas de conteo, separando observación, diferencia, investigación, decisión y corrección, tanto para activos individuales como grupos por cantidad.                   |
| `CAP-07.06` — Registrar condición, daño, pérdida y faltante       | `REUSE_OR_REFACTOR` | NEXO                    | Normalizar condición y disponibilidad, crear casos auditables de daño, pérdida y hallazgo, y prohibir que un cambio de texto sobrescriba el historial.                                      |
| `CAP-07.07` — Planear y ejecutar mantenimiento                    | `REUSE_OR_REFACTOR` | NEXO                    | Evolucionar los registros actuales hacia planes, órdenes, ejecución, evidencia, prueba de retorno al servicio y próxima fecha o medidor.                                                    |
| `CAP-07.08` — Gestionar reparación y repuestos                    | `REUSE_OR_REFACTOR` | NEXO + ORIGO            | Conectar reparación con diagnóstico, proveedor, repuestos reservados y consumidos, costo, indisponibilidad y resultado, sin registrar piezas únicamente como texto libre.                   |
| `CAP-07.09` — Controlar garantías y seguros                       | `BUILD`             | NEXO + fuentes externas | Construir vigencias, coberturas, exclusiones, reclamaciones, documentos, alertas y decisiones; un archivo adjunto no equivale a garantía o seguro vigente.                                  |
| `CAP-07.10` — Gestionar baja, venta, descarte o reemplazo         | `BUILD`             | NEXO + NUMERA           | Construir solicitud, evaluación, autorización, disposición física, evento económico y cierre no destructivo, conservando identidad e historia.                                              |
| `CAP-07.11` — Gestionar kits y conjuntos                          | `BUILD`             | NEXO                    | Construir definición de kit, instancia, componentes obligatorios u opcionales, completitud, préstamo, devolución y sustitución sin fusionar kit con LPN.                                    |
| `CAP-07.12` — Gestionar vehículos y equipos de transporte         | `BUILD`             | NEXO                    | Construir expediente de vehículo o equipo, documentos, custodios, disponibilidad, inspección, mantenimiento e integración con logística, sin convertir conductor en propietario.            |
| `CAP-07.13` — Controlar combustible, kilometraje y disponibilidad | `BUILD`             | NEXO + ORIGO + NUMERA   | Construir lecturas monotónicas, correcciones auditables, cargas de combustible, rendimiento, indisponibilidad y conciliación de compras y uso.                                              |

Resumen:

| Tratamiento         | Cantidad |
| ------------------- | -------: |
| `REUSE_OR_REFACTOR` |        8 |
| `BUILD`             |        5 |
| **Total**           |   **13** |

---

#### 12. CAP-07.01 — Identificar y clasificar activos

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietario objetivo:** NEXO

##### Línea base

Existe infraestructura parcial reutilizable, pero no un ciclo empresarial completamente validado.

##### Decisión objetivo

Conservar el catálogo y las superficies actuales, pero separar tipo o modelo, activo individual, reutilizable por cantidad, repuesto, kit, vehículo y consumible mediante reglas canónicas.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-001`; `NEXO-UX-030`; `SUPA-AUD-019`; `SUPA-AUD-022`.

---

#### 13. CAP-07.02 — Registrar ubicación y custodia

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietario objetivo:** NEXO

##### Línea base

Existe infraestructura parcial reutilizable, pero no un ciclo empresarial completamente validado.

##### Decisión objetivo

Reutilizar ubicación y movimientos existentes, incorporando custodia, responsable operativo, tercero, sede, LOC y vigencias sin inferir propiedad.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-007`; `NEXO-DOM-008`; `NEXO-UX-031`; `NEXO-AUTH-025`.

---

#### 14. CAP-07.03 — Entregar, prestar y devolver

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietario objetivo:** NEXO

##### Línea base

Existe infraestructura parcial reutilizable, pero no un ciclo empresarial completamente validado.

##### Decisión objetivo

Formalizar entrega, préstamo y devolución como expedientes con actor, receptor, vencimiento, condición, evidencia y cierre; no como simple cambio de ubicación.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-011`; `NEXO-UX-031`; `NEXO-AUTH-025`; `PROC-CAT-009` a `PROC-CAT-018`.

---

#### 15. CAP-07.04 — Transferir custodia

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietario objetivo:** NEXO

##### Línea base

Existe infraestructura parcial reutilizable, pero no un ciclo empresarial completamente validado.

##### Decisión objetivo

Convertir las transferencias actuales en eventos de custodia aceptados, rechazados o pendientes, conservando origen, destino, condición y responsabilidad.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-008`; `NEXO-DOM-011`; `NEXO-UX-031`; `NEXO-AUTH-025`.

---

#### 16. CAP-07.05 — Contar activos y reutilizables

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietario objetivo:** NEXO

##### Línea base

Existe infraestructura parcial reutilizable, pero no un ciclo empresarial completamente validado.

##### Decisión objetivo

Conservar sesiones y líneas de conteo, separando observación, diferencia, investigación, decisión y corrección, tanto para activos individuales como grupos por cantidad.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-015`; `NEXO-UX-034`; `NEXO-AUTH-027`; `PROC-CAT-009` a `PROC-CAT-018`.

---

#### 17. CAP-07.06 — Registrar condición, daño, pérdida y faltante

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietario objetivo:** NEXO

##### Línea base

Existe infraestructura parcial reutilizable, pero no un ciclo empresarial completamente validado.

##### Decisión objetivo

Normalizar condición y disponibilidad, crear casos auditables de daño, pérdida y hallazgo, y prohibir que un cambio de texto sobrescriba el historial.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-010`; `NEXO-DOM-017`; `NEXO-UX-032`; `NEXO-AUTH-026`.

---

#### 18. CAP-07.07 — Planear y ejecutar mantenimiento

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietario objetivo:** NEXO

##### Línea base

Existe infraestructura parcial reutilizable, pero no un ciclo empresarial completamente validado.

##### Decisión objetivo

Evolucionar los registros actuales hacia planes, órdenes, ejecución, evidencia, prueba de retorno al servicio y próxima fecha o medidor.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-012`; `NEXO-DOM-026`; `NEXO-UX-032`; `CAP-SCOPE-013`.

---

#### 19. CAP-07.08 — Gestionar reparación y repuestos

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietario objetivo:** NEXO + ORIGO

##### Línea base

Existe infraestructura parcial reutilizable, pero no un ciclo empresarial completamente validado.

##### Decisión objetivo

Conectar reparación con diagnóstico, proveedor, repuestos reservados y consumidos, costo, indisponibilidad y resultado, sin registrar piezas únicamente como texto libre.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-016`; `NEXO-DOM-025`; `NEXO-DOM-026`; `ORIGO-UX-015`; `CAP-SCOPE-012`.

---

#### 20. CAP-07.09 — Controlar garantías y seguros

**Tratamiento:** `BUILD`  
**Propietario objetivo:** NEXO + fuentes externas

##### Línea base

No existe evidencia de una capacidad integral y gobernada que pueda declararse operativa.

##### Decisión objetivo

Construir vigencias, coberturas, exclusiones, reclamaciones, documentos, alertas y decisiones; un archivo adjunto no equivale a garantía o seguro vigente.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-017`; `NEXO-DOM-026`; `CAP-SCOPE-016`; `CAP-SCOPE-018`.

---

#### 21. CAP-07.10 — Gestionar baja, venta, descarte o reemplazo

**Tratamiento:** `BUILD`  
**Propietario objetivo:** NEXO + NUMERA

##### Línea base

No existe evidencia de una capacidad integral y gobernada que pueda declararse operativa.

##### Decisión objetivo

Construir solicitud, evaluación, autorización, disposición física, evento económico y cierre no destructivo, conservando identidad e historia.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-013`; `NEXO-DOM-028`; `CAP-SCOPE-012`; `PROC-CAT-009` a `PROC-CAT-018`.

---

#### 22. CAP-07.11 — Gestionar kits y conjuntos

**Tratamiento:** `BUILD`  
**Propietario objetivo:** NEXO

##### Línea base

No existe evidencia de una capacidad integral y gobernada que pueda declararse operativa.

##### Decisión objetivo

Construir definición de kit, instancia, componentes obligatorios u opcionales, completitud, préstamo, devolución y sustitución sin fusionar kit con LPN.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-014`; `NEXO-UX-033`; `NEXO-AUTH-024`; `NEXO-AUTH-025`.

---

#### 23. CAP-07.12 — Gestionar vehículos y equipos de transporte

**Tratamiento:** `BUILD`  
**Propietario objetivo:** NEXO

##### Línea base

No existe evidencia de una capacidad integral y gobernada que pueda declararse operativa.

##### Decisión objetivo

Construir expediente de vehículo o equipo, documentos, custodios, disponibilidad, inspección, mantenimiento e integración con logística, sin convertir conductor en propietario.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-027`; `CAP-SCOPE-011`; `CAP-SCOPE-013`; `CAP-SCOPE-016`.

---

#### 24. CAP-07.13 — Controlar combustible, kilometraje y disponibilidad

**Tratamiento:** `BUILD`  
**Propietario objetivo:** NEXO + ORIGO + NUMERA

##### Línea base

No existe evidencia de una capacidad integral y gobernada que pueda declararse operativa.

##### Decisión objetivo

Construir lecturas monotónicas, correcciones auditables, cargas de combustible, rendimiento, indisponibilidad y conciliación de compras y uso.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-027`; `NEXO-DOM-028`; `CAP-SCOPE-011`; `CAP-SCOPE-012`.

---

#### 25. Fronteras con otros dominios

| Dominio                | Frontera                                                                                           |
| ---------------------- | -------------------------------------------------------------------------------------------------- |
| `CAP-04` catálogo      | define producto, repuesto y tipo; no la existencia patrimonial individual                          |
| `CAP-05` compras       | origina adquisición o servicio; no determina custodia ni disponibilidad                            |
| `CAP-06` inventario    | controla repuestos y consumibles antes de instalación; no sustituye expediente del activo          |
| `CAP-11` logística     | gestiona rutas, viajes y entregas; consume disponibilidad de vehículos                             |
| `CAP-12` finanzas      | determina costo, gasto, depreciación y efecto económico                                            |
| `CAP-13` instalaciones | gestiona mantenimiento de inmuebles e infraestructura; puede compartir órdenes y proveedores       |
| `CAP-15` tecnología    | administra dispositivos tecnológicos como servicio, pero su identidad física puede residir en NEXO |
| `CAP-16` documentos    | conserva facturas, manuales, pólizas y evidencia con privacidad y retención                        |
| `CAP-18` continuidad   | utiliza criticidad, repuestos y disponibilidad para contingencias                                  |
| LPN                    | identifica contenido logístico; no sustituye activo, kit, contenedor físico ni custodia            |

---

#### 26. Información conceptual requerida

##### 26.1. Tipo o modelo

- identificador estable;
- familia;
- fabricante, marca y modelo;
- características técnicas;
- unidad de control;
- política de identificación individual o por cantidad;
- criticidad y requisitos de mantenimiento.

##### 26.2. Activo individual

- código interno;
- serial, placa u otro identificador;
- tipo o modelo;
- estado de registro;
- condición y disponibilidad;
- ubicación física;
- custodio y usuario;
- propietario declarado con nivel de evidencia;
- fecha y fuente de adquisición;
- documentos;
- garantía y seguro;
- medidores aplicables;
- historial completo.

##### 26.3. Grupo reutilizable

- familia;
- unidad de conteo;
- sede o punto;
- cantidad registrada;
- cantidad observada;
- condición agregada cuando sea útil;
- responsable;
- reglas de préstamo y conteo;
- criterio para individualizar una unidad.

##### 26.4. Mantenimiento

- plan y versión;
- disparador por fecha, uso, ciclos, kilometraje o condición;
- orden de trabajo;
- diagnóstico;
- tareas;
- técnico o proveedor;
- salida y retorno;
- repuestos;
- costo informado;
- evidencia;
- prueba y liberación;
- próxima obligación.

##### 26.5. Vehículo

- placa e identidad;
- tipo, marca, modelo y año;
- propietario y custodio;
- documentos y vigencias;
- kilometraje;
- capacidad y restricciones;
- estado de disponibilidad;
- mantenimiento e inspecciones;
- cargas de combustible;
- incidentes y bloqueos;
- relación con viajes sin duplicar el dominio logístico.

---

#### 27. Eventos e integraciones requeridos

Eventos mínimos:

```text
asset_registered
asset_identity_corrected
asset_location_changed
asset_custody_offered
asset_custody_accepted
asset_loaned
asset_returned
asset_transfer_started
asset_transfer_completed
asset_count_observed
asset_difference_found
asset_condition_reported
asset_damaged
asset_lost
asset_found
maintenance_due
maintenance_work_order_opened
maintenance_started
spare_part_reserved
spare_part_consumed
maintenance_completed
asset_released_to_service
warranty_claim_opened
insurance_claim_opened
asset_retirement_requested
asset_retirement_approved
asset_disposed
vehicle_odometer_read
vehicle_fuel_loaded
vehicle_availability_changed
```

Cada evento conservará identificador estable, versión, actor, fecha efectiva, origen, recurso, causa, estado y evidencia. Los consumidores deberán ser idempotentes.

---

#### 28. Autorización y segregación

Deberán separarse, como mínimo:

- consultar activos;
- crear tipo o modelo;
- registrar activo individual;
- actualizar identificación sensible;
- registrar ubicación;
- asignar o aceptar custodia;
- prestar y devolver;
- iniciar y aprobar transferencia;
- capturar conteo;
- investigar diferencia;
- aprobar corrección;
- reportar daño o pérdida;
- cambiar disponibilidad;
- crear plan de mantenimiento;
- abrir, ejecutar y cerrar orden;
- consumir repuestos;
- registrar garantía o seguro;
- abrir reclamación;
- proponer y aprobar baja;
- ejecutar disposición;
- registrar kilometraje y combustible;
- imprimir o reimprimir etiqueta.

La administración no dependerá de check-in cuando la matriz aprobada no lo exija. Las acciones físicas de sede o área deberán validar contexto operativo cuando corresponda.

---

#### 29. Experiencia por actor

##### Operaciones

- búsqueda por código, QR, serial, familia, ubicación o custodio;
- alertas de activos no localizados, vencimientos y mantenimiento;
- vista de disponibilidad y criticidad;
- conciliación de conteos y movimientos.

##### Custodio o trabajador

- confirmar recepción;
- consultar activos asignados;
- reportar daño, pérdida o devolución;
- ver instrucciones esenciales sin exponer datos financieros.

##### Mantenimiento

- bandeja de órdenes;
- diagnóstico, tareas y repuestos;
- evidencia antes y después;
- prueba de retorno;
- operación móvil o tablet cuando sea necesario.

##### Contabilidad o Gerencia

- soportes de adquisición;
- costo y estado de baja;
- garantías, seguros y reclamaciones;
- reportes sin alterar el estado físico.

##### Logística

- vehículos disponibles;
- restricciones y documentos vigentes;
- kilometraje y combustible;
- bloqueo por mantenimiento o seguridad.

---

#### 30. Operación offline y contingencia

- un escaneo offline no creará identidades duplicadas;
- los movimientos pendientes conservarán clave de idempotencia;
- la aceptación de custodia requerirá sincronización y autorización vigentes;
- un conteo offline preservará líneas y marca temporal;
- un mantenimiento no se cerrará únicamente en memoria local;
- la imposibilidad de imprimir no impedirá identificar el activo mediante código alternativo;
- la pérdida de red no permitirá aprobar baja, venta o disposición sin control;
- kilometraje y combustible pendientes deberán detectar duplicados al sincronizar.

---

#### 31. Evidencia, conservación y auditoría

Se conservarán:

- identidad anterior y nueva;
- ubicación y custodia anteriores y nuevas;
- actor real y actor operativo;
- fecha de captura y fecha efectiva;
- razón estructurada;
- documentos y hash cuando aplique;
- fotos con contexto, no como única prueba;
- conteos originales;
- aprobaciones y rechazos;
- mantenimiento, diagnóstico, repuestos y prueba;
- reclamaciones de garantía o seguro;
- baja y disposición;
- lecturas de kilometraje y combustible;
- relación con compra, costo y documento financiero.

Seriales, placas, facturas, pólizas y documentos sensibles tendrán acceso restringido y conservación definida en `CAP-SCOPE-016`.

---

#### 32. Patrones legacy destinados a retiro

- usar producto del catálogo como si fuera la unidad física;
- crear un activo nuevo por cada reimpresión de QR;
- registrar grupos repetidos como activos individuales ficticios;
- usar cantidad de stock para representar vajilla o decoración sin modelo de reutilizable;
- cambiar ubicación para simular préstamo o custodia;
- sobrescribir condición, serial o custodio sin evento;
- eliminar un activo perdido o dado de baja;
- cerrar conteos alterando directamente la cantidad registrada;
- registrar piezas reemplazadas solo como texto;
- considerar documento de garantía como garantía vigente;
- mezclar mantenimiento de activo con mantenimiento de instalación sin propietario;
- permitir que el custodio apruebe su propia pérdida o baja;
- asociar vehículo permanentemente con un conductor;
- permitir reducción de kilometraje sin corrección formal;
- deducir consumo de combustible únicamente desde facturas;
- mantener tablas, perfiles o eventos duplicados como fuentes competidoras.

---

#### 33. Preguntas pendientes y validaciones controladas

No se crean preguntas nuevas.

Las incertidumbres AS-IS ya reconocidas por `OPS-ACT-001` se mantienen como validaciones controladas:

- inventario físico completo por sede y punto externo;
- titularidad jurídica o contable;
- custodios actuales;
- condición y disponibilidad real;
- documentos de adquisición, garantía, seguro y mantenimiento;
- activos en poder de terceros;
- vehículo, canastas y reutilizables;
- equipos pendientes de instalar;
- impacto económico y centro de costo.

Estas validaciones no bloquean la decisión de cobertura, pero sí bloquearán migración, valoración, baja, disposición o salida a piloto cuando sean necesarias para el paquete correspondiente.

---

#### 34. Riesgos principales

| Riesgo                            | Severidad | Control mínimo                               |
| --------------------------------- | --------- | -------------------------------------------- |
| activo duplicado                  | crítica   | identidad estable y detección de duplicados  |
| propiedad inferida                | crítica   | nivel de evidencia y validación profesional  |
| activo fuera de sede sin custodio | crítica   | punto externo, tercero y fecha de retorno    |
| préstamo sin devolución           | alta      | vencimiento, responsable y escalamiento      |
| transferencia no aceptada         | alta      | estado pendiente y confirmación              |
| conteo destructivo                | crítica   | observación, diferencia y decisión separadas |
| pérdida borrada                   | crítica   | estado, investigación y disposición          |
| mantenimiento vencido             | crítica   | plan, alerta y bloqueo según política        |
| repuesto sin movimiento           | alta      | reserva y consumo correlacionados            |
| garantía o seguro falso vigente   | crítica   | vigencia, cobertura y fuente                 |
| baja sin segregación              | crítica   | solicitud, aprobación y evidencia            |
| kit incompleto                    | alta      | definición e instancia con completitud       |
| vehículo no disponible            | crítica   | disponibilidad y contingencia                |
| kilometraje inconsistente         | alta      | monotonía y corrección auditable             |
| combustible irreconciliable       | alta      | compra, carga y lectura diferenciadas        |
| datos sensibles expuestos         | crítica   | RLS, masking y almacenamiento privado        |

---

#### 35. Hallazgos y destinos canónicos

| ID                  | Hallazgo                                                                                                    | Riesgo  | Tarea propietaria                                                | Momento            |
| ------------------- | ----------------------------------------------------------------------------------------------------------- | ------- | ---------------------------------------------------------------- | ------------------ |
| H-CAP-SCOPE-007-001 | el catálogo, el tipo y la unidad física todavía pueden competir conceptualmente                             | crítica | `NEXO-DOM-001`; `SUPA-AUD-019`; `SUPA-AUD-022`                   | E2/E3              |
| H-CAP-SCOPE-007-002 | el inventario físico AS-IS permanece incompleto                                                             | alta    | `OPS-ACT-001`; `NEXO-UX-039`; `NEXO-UX-040`                      | antes de migración |
| H-CAP-SCOPE-007-003 | activos individuales y grupos por cantidad requieren reglas de conversión y no duplicidad                   | crítica | `NEXO-DOM-009`; `NEXO-UX-030`; `SUPA-AUD-019`                    | E2/E3              |
| H-CAP-SCOPE-007-004 | ubicación, custodia, uso, propiedad y costo no tienen contrato integral comprobado                          | crítica | `NEXO-DOM-007`; `NEXO-DOM-008`; `NEXO-DOM-017`; `CAP-SCOPE-012`  | E2/E3              |
| H-CAP-SCOPE-007-005 | activos externos o en poder de terceros no están conciliados                                                | crítica | `NEXO-DOM-008`; `NEXO-DOM-011`; `NEXO-UX-031`                    | E2                 |
| H-CAP-SCOPE-007-006 | préstamo, devolución y transferencia existen parcialmente pero no como expediente cerrado                   | alta    | `NEXO-DOM-011`; `NEXO-UX-031`; `NEXO-AUTH-025`                   | E2                 |
| H-CAP-SCOPE-007-007 | conteos de activos requieren confirmar historia, investigación y aprobación de diferencia                   | alta    | `NEXO-DOM-015`; `NEXO-UX-034`; `NEXO-AUTH-027`                   | E2/E5              |
| H-CAP-SCOPE-007-008 | condición, daño, pérdida, faltante y hallazgo no forman un ciclo completo comprobado                        | crítica | `NEXO-DOM-010`; `NEXO-DOM-017`; `NEXO-UX-032`                    | E2                 |
| H-CAP-SCOPE-007-009 | mantenimiento actual conserva registros útiles pero no demuestra plan, orden, prueba y liberación completos | crítica | `NEXO-DOM-012`; `NEXO-DOM-026`; `CAP-SCOPE-013`                  | E2/E3              |
| H-CAP-SCOPE-007-010 | piezas reemplazadas pueden quedar como texto sin consumo de repuesto                                        | crítica | `NEXO-DOM-016`; `NEXO-DOM-025`; `TREQ-INTEGRATION-012`           | E2/E4              |
| H-CAP-SCOPE-007-011 | garantía aparece como tipo documental, no como ciclo de vigencia y reclamación                              | alta    | `NEXO-DOM-017`; `NEXO-DOM-026`; `CAP-SCOPE-016`                  | E2/E4              |
| H-CAP-SCOPE-007-012 | no existe evidencia de un ciclo integral de seguros                                                         | alta    | `NEXO-DOM-026`; `CAP-SCOPE-016`; `CAP-SCOPE-018`                 | E2/E4              |
| H-CAP-SCOPE-007-013 | baja, venta, descarte y reemplazo no están cerrados física y económicamente                                 | crítica | `NEXO-DOM-013`; `NEXO-DOM-028`; `CAP-SCOPE-012`                  | E2/E4              |
| H-CAP-SCOPE-007-014 | kits y conjuntos no tienen instancias y completitud integral comprobadas                                    | alta    | `NEXO-DOM-014`; `NEXO-UX-033`                                    | E2                 |
| H-CAP-SCOPE-007-015 | LPN, contenedor físico y kit requieren frontera explícita                                                   | crítica | `NEXO-DOM-019`; `NEXO-DOM-020`; `NEXO-DOM-024`                   | E2/E3              |
| H-CAP-SCOPE-007-016 | el vehículo crítico no tiene dominio integral de flota comprobado                                           | crítica | `NEXO-DOM-027`; `CAP-SCOPE-011`                                  | E2                 |
| H-CAP-SCOPE-007-017 | kilometraje, combustible y disponibilidad no tienen ciclo correlacionado                                    | crítica | `NEXO-DOM-027`; `NEXO-DOM-028`; `CAP-SCOPE-011`; `CAP-SCOPE-012` | E2/E4              |
| H-CAP-SCOPE-007-018 | adquisición, mantenimiento, pérdida y baja no están conciliados entre ORIGO, NEXO y NUMERA                  | crítica | `ORIGO-UX-014`; `ORIGO-UX-015`; `NEXO-DOM-028`; `CAP-SCOPE-012`  | E2/E4              |
| H-CAP-SCOPE-007-019 | permisos atómicos y segregación del dominio aún deben verificarse                                           | crítica | `NEXO-AUTH-021` a `NEXO-AUTH-030`                                | E2/E5              |
| H-CAP-SCOPE-007-020 | impresión, reimpresión y etiquetas dañadas requieren mantener identidad estable                             | alta    | `NEXO-DOM-018`; `NEXO-AUTH-028`; `NEXO-UX-037`; `NEXO-UX-038`    | E4/E5              |
| H-CAP-SCOPE-007-021 | mantenimiento de activo, instalación y calibración pueden solaparse sin propietario                         | alta    | `NEXO-DOM-026`; `CAP-SCOPE-013`; `CAP-SCOPE-019`                 | E1/E2              |
| H-CAP-SCOPE-007-022 | datos sensibles de activos, vehículos, pólizas y facturas requieren política específica                     | crítica | `CAP-SCOPE-016`; `NEXO-AUTH-024`; `NEXO-AUTH-026`                | E1/E3              |

Todos los hallazgos tienen propietario y puerta. No queda pendiente narrativo sin destino.

---

#### 36. Decisiones canónicas resultantes

1. NEXO será propietario del estado físico y operacional de activos y reutilizables.
2. Tipo o modelo, activo individual y grupo por cantidad serán conceptos distintos.
3. Activo, consumible, repuesto, herramienta, kit, LPN y vehículo no se fusionarán.
4. Propiedad, custodia, ubicación, uso y centro de costo se registrarán por separado.
5. La identidad será estable aunque cambien QR, placa visible o alias.
6. Los movimientos serán eventos no destructivos.
7. El préstamo incluirá receptor, plazo, condición y cierre.
8. La transferencia de custodia requerirá aceptación.
9. El conteo será observación y no corrección automática.
10. Condición y disponibilidad serán dimensiones separadas.
11. Daño, pérdida, faltante y hallazgo tendrán casos auditables.
12. Mantenimiento separará plan, orden, ejecución, prueba y liberación.
13. Los repuestos se reservarán y consumirán desde inventario.
14. Garantía y seguro tendrán vigencia, cobertura y reclamación.
15. Baja y disposición requerirán autorización segregada.
16. Los kits tendrán definición, instancia y completitud.
17. Un kit podrá viajar dentro de un LPN sin convertirse en LPN.
18. Los vehículos serán activos especializados y no extensiones del conductor.
19. El kilometraje será monotónico y corregible mediante eventos.
20. Compra, carga y consumo de combustible serán hechos distintos.
21. Los activos en terceros o puntos externos permanecerán controlados.
22. ORIGO originará adquisiciones y servicios; NEXO conservará el estado físico.
23. NUMERA recibirá hechos económicos sin convertirse en maestro de identidad física.
24. La familia `CAP-07` es parcialmente reutilizable, pero no está cerrada.

---

#### 37. Requisitos de prueba derivados

Esta tarea genera cuatro requisitos distintos y no duplicados:

```text
TREQ-NEXO-013
TREQ-NEXO-014
TREQ-NEXO-015
TREQ-INTEGRATION-012
```

Los detalles completos se incorporan exclusivamente en el archivo canónico `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` regenerado.

No se entregan filas independientes.

##### 37.1. `TREQ-NEXO-013`

Protege identidad, clasificación, ubicación, custodia, préstamos, transferencias, conteos, condición, activos individuales, reutilizables y kits.

##### 37.2. `TREQ-NEXO-014`

Protege plan y ejecución de mantenimiento, reparación, repuestos, garantía, seguro, baja y disposición.

##### 37.3. `TREQ-NEXO-015`

Protege vehículos, documentos, kilometraje, combustible y disponibilidad.

##### 37.4. `TREQ-INTEGRATION-012`

Protege la cadena ORIGO → NEXO → NUMERA para adquisición, mantenimiento, repuestos, pérdida, venta y baja, sin efectos duplicados.

---

#### 38. Dependencias habilitadas y restricciones

- `CAP-SCOPE-008`;
- `CAP-SCOPE-011`;
- `CAP-SCOPE-012`;
- `CAP-SCOPE-013`;
- `CAP-SCOPE-015`;
- `CAP-SCOPE-016`;
- `CAP-SCOPE-017`;
- `CAP-SCOPE-018`;
- `CAP-SCOPE-019`;
- `NEXO-DOM-001` a `NEXO-DOM-028`;
- `NEXO-AUTH-021` a `NEXO-AUTH-030`;
- `NEXO-UX-026` a `NEXO-UX-042`;
- diseño TO-BE de activos, custodia, mantenimiento, repuestos, kits y flota;
- arquitectura E3 de datos, documentos, eventos y seguridad;
- integraciones E4 con ORIGO, NUMERA, documentos y servicios externos;
- paquetes E5 de NEXO e integraciones relacionadas.

No autoriza movimientos, mantenimientos, inventario físico, migración, compra, baja, disposición ni operación real.

---

#### 39. Criterios de aceptación

1. las trece subcapacidades tengan tratamiento explícito;
2. tipo, activo individual y grupo reutilizable estén separados;
3. activo, inventario, repuesto, kit, contenedor y LPN no se fusionen;
4. propiedad, custodia, ubicación, uso y costo estén separados;
5. la identidad sea estable y no dependa del QR;
6. préstamos, devoluciones y transferencias tengan ciclo explícito;
7. conteo, diferencia, investigación y corrección estén separados;
8. condición y disponibilidad sean dimensiones diferentes;
9. daño, pérdida, faltante y hallazgo sean auditables;
10. mantenimiento tenga plan, orden, ejecución, prueba y liberación;
11. reparación consuma repuestos correlacionados;
12. garantía y seguro tengan vigencia y reclamación;
13. baja y disposición sean no destructivas y segregadas;
14. kits tengan definición, instancia y completitud;
15. vehículos, conductor, viaje y custodia estén separados;
16. kilometraje y combustible tengan controles explícitos;
17. ORIGO, NEXO y NUMERA tengan fronteras claras;
18. los veintidós hallazgos tengan destino;
19. no se creen preguntas narrativas nuevas;
20. se generen los cuatro requisitos de prueba;
21. el registro `04A` completo tenga 99 requisitos válidos;
22. ninguna fila tenga más o menos de catorce columnas;
23. no se autorice implementación;
24. la continuidad quede en `CAP-SCOPE-008`.

---

#### 40. Resultado y continuidad

**Estado:** PROPUESTA PARA APROBACIÓN

Al aprobarse:

- `CAP-SCOPE-007` será la decisión canónica de cobertura para activos, reutilizables, mantenimiento, repuestos, kits y vehículos;
- `TREQ-NEXO-013`, `TREQ-NEXO-014`, `TREQ-NEXO-015` y `TREQ-INTEGRATION-012` quedarán incorporados al registro canónico;
- NEXO conservará la propiedad del estado físico y los demás dominios emitirán o consumirán hechos correlacionados;
- ningún conteo, movimiento, mantenimiento, baja, compra o efecto real quedará autorizado;
- la continuidad será:

```text
CAP-SCOPE-008 — Evaluar producción, planificación, rendimiento, calidad e inocuidad
```


### [ ] CAP-SCOPE-008 — Evaluar producción, planificación, rendimiento, calidad e inocuidad
### [ ] CAP-SCOPE-009 — Evaluar ventas, pedidos, mesas, comandas, caja y pagos
### [ ] CAP-SCOPE-010 — Evaluar clientes, fidelización, reclamos y servicio
### [ ] CAP-SCOPE-011 — Evaluar logística, rutas, vehículos, combustible y entregas
### [ ] CAP-SCOPE-012 — Evaluar costos, gastos, presupuestos, tesorería, contabilidad e impuestos
### [ ] CAP-SCOPE-013 — Evaluar instalaciones, mantenimiento, limpieza, inspecciones y calibración
### [ ] CAP-SCOPE-014 — Evaluar marketing, campañas y contenido
### [ ] CAP-SCOPE-015 — Evaluar TI, dispositivos, redes, impresión, soporte y seguridad
### [ ] CAP-SCOPE-016 — Evaluar privacidad, cumplimiento, documentos, conservación y auditoría
### [ ] CAP-SCOPE-017 — Evaluar analítica, indicadores y datos maestros
### [ ] CAP-SCOPE-018 — Evaluar continuidad operativa, respaldo y recuperación
### [ ] CAP-SCOPE-019 — Aprobar clasificación y propietario de cada dominio evaluado

Las tareas `CAP-TAL-001` a `CAP-TAL-006` fueron reubicadas en BLOQUE E2 porque
definen procesos, estados, actores y experiencia TO-BE. Conservan sus
identificadores, dependencias y reglas aprobadas, pero no forman parte del
conteo ni de la secuencia de cierre de E1.
