### MINI-BLOQUE — GOBIERNO PERSONAS Y SEGURIDAD LABORAL

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **gobierno personas y seguridad laboral** dentro de **E1 DESCUBRIMIENTO OPERATIVO**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `CAP-SCOPE-001` a `CAP-SCOPE-003` — 3 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `CAP-SCOPE-001`: Evaluar gobierno, empresas, sedes y organización
- `CAP-SCOPE-002`: Evaluar personal, contratación, turnos, asistencia, capacitación y retiro
- `CAP-SCOPE-003`: Evaluar seguridad y salud en el trabajo
<!-- PLAN-SECTION-META:END -->

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
