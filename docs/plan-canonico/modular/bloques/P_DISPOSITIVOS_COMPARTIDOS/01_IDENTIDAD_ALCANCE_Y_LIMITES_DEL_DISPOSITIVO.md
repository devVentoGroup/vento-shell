### MINI-BLOQUE — IDENTIDAD ALCANCE Y LIMITES DEL DISPOSITIVO

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **identidad alcance y limites del dispositivo** dentro de **P DISPOSITIVOS COMPARTIDOS**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `AUTH-DEV-001` a `AUTH-DEV-006` — 6 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `AUTH-DEV-001`: Inventariar dispositivos compartidos
- `AUTH-DEV-002`: Definir identidad del dispositivo
- `AUTH-DEV-003`: Asignar sede fija
- `AUTH-DEV-004`: Asignar área fija o permitida
- `AUTH-DEV-005`: Asignar aplicaciones permitidas
- `AUTH-DEV-006`: Asignar permisos máximos del dispositivo
<!-- PLAN-SECTION-META:END -->

### ✅ AUTH-DEV-001 — Inventariar dispositivos compartidos

**Estado:** APROBADA
**Tarea anterior:** `AUTH-UI-039 — Definir masking según permiso` — APROBADA
**Tarea siguiente:** `AUTH-DEV-002 — Definir identidad del dispositivo` — RESERVADA
**Tipo de tarea:** documental; inventario canónico y reconciliación de instancias, observaciones físicas y plantillas de dispositivo compartido
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/P_DISPOSITIVOS_COMPARTIDOS/01_IDENTIDAD_ALCANCE_Y_LIMITES_DEL_DISPOSITIVO.md`
**Artefacto producido:** `SHARED-DEVICE-INVENTORY-001`
**Cambios en código, Supabase, migraciones, RLS, RPC, configuración, datos, aplicaciones o dispositivos:** no autorizados

---

#### 1. Propósito

Crear un inventario único, explícito y reconciliado de los dispositivos compartidos de Vento OS, distinguiendo sin ambigüedad:

- instancias configuradas en la infraestructura existente;
- equipos compartidos documentados físicamente pero aún no reconciliados con una instancia técnica;
- plantillas objetivo aprobadas para futuras instancias;
- plantillas legacy que deben conservarse, corregirse, rediseñarse o retirarse;
- evidencia registral, física y operativa disponible;
- vacíos de identidad que deberá resolver `AUTH-DEV-002`.

La tarea no presume que una fila técnica demuestra la existencia física, que una observación física demuestra configuración canónica ni que una plantilla demuestra una instancia desplegada.

```text
REGISTRO CONFIGURADO
≠
EQUIPO FÍSICO VERIFICADO
≠
PLANTILLA OBJETIVO
≠
ESTACIÓN COMPARTIDA
≠
ACTOR HUMANO
```

---

#### 2. Resultado material

Se aprueba `SHARED-DEVICE-INVENTORY-001` como inventario de referencia para `AUTH-DEV-002` a `AUTH-DEV-006`.

El inventario contiene cuatro clases de registro:

| Clase                     | Cantidad | Significado                                                                         |
| ------------------------- | -------: | ----------------------------------------------------------------------------------- |
| `CONFIGURED_INSTANCE`     |        2 | Instancia registrada y auditada en la infraestructura existente.                    |
| `PHYSICAL_OBSERVATION`    |        2 | Equipo compartido documentado en la operación, sin equivalencia técnica confirmada. |
| `TARGET_TEMPLATE`         |       14 | Clase objetivo aprobada para limitar y versionar futuras instancias.                |
| `RETIRED_LEGACY_TEMPLATE` |        1 | Plantilla legacy excluida de nuevas instancias.                                     |
| **Total**                 |   **19** | Registros con clase e identidad de fuente inequívocas.                              |

Las relaciones entre clases no fusionan identidades. Una instancia puede referenciar una plantilla, y una observación física puede corresponder a una instancia, pero cada equivalencia debe demostrarse.

---

#### 3. Fuentes y decisiones heredadas

El inventario conserva las decisiones aprobadas en:

- `AUTH-AUD-011 — Inventariar dispositivos compartidos`;
- `AUTH-MOD-011 — Definir dispositivo compartido`;
- `AUTH-CAT-014 — Definir permisos que admiten dispositivo compartido`;
- `AUTH-RBAC-023 — Definir capacidades permitidas por dispositivo compartido`;
- `AUTH-CTX-014 — Incluir contexto de dispositivo compartido`;
- `UX-STATION-001 — Inventariar puestos físicos, zonas de trabajo y condiciones reales de operación`;
- `UX-STATION-003 — Definir perfiles canónicos de estación compartida`;
- `UX-STATION-009 — Aprobar la matriz proceso → paso → estación → interacción → periférico`;
- `AUTH-UI-022`, `AUTH-UI-036`, `AUTH-UI-038` y `AUTH-UI-039`.

También se reconoce la infraestructura versionada actualmente en `vento-shell` para:

- `public.shared_operational_devices`;
- `public.shared_operational_device_apps`;
- `public.shared_operational_device_actor_sessions`;
- `public.shared_operational_device_events`;
- `public.shared_operational_device_templates`;
- `public.shared_operational_device_template_apps`;
- `public.shared_operational_device_actor_policies`;
- `public.shared_operational_device_template_actor_policies`.

La existencia de estas estructuras no prueba uso operativo conforme.

---

#### 4. Invariantes del inventario

1. El dispositivo compartido es una interfaz técnica; no es empleado, rol, turno, check-in ni actor empresarial.
2. El dispositivo no tiene turno; el trabajador sí.
3. La identidad técnica mantiene conexión y configuración, pero nunca recibe autoridad empresarial.
4. Una sesión de actor identifica temporalmente a una persona; no convierte la cuenta técnica en esa persona.
5. Una estación compartida puede incluir dispositivo, host y periféricos, pero no es sinónimo de ninguno de ellos.
6. Una plantilla limita una clase de instancia; no constituye una instancia desplegada.
7. La instancia puede reducir su plantilla; nunca ampliarla.
8. Una aplicación instalada o visible no concede permiso.
9. `navigation_role` no concede rol, aplicación ni capacidad.
10. Ninguna observación física se fusiona con una fila técnica sin evidencia de equivalencia.
11. Ninguna fila técnica se declara físicamente vigente sin verificación del equipo y su ubicación.
12. Ninguna plantilla nueva se considera implementada por estar documentada.
13. La ausencia de sesión de actor, heartbeat o evento reciente impide declarar operación validada.
14. Los periféricos se inventarían separadamente y no se convierten en actores ni dispositivos compartidos por sí solos.
15. Un equipo personal no entra en este inventario salvo que opere formalmente como estación compartida administrada.

---

#### 5. Clave de inventario

Cada registro utiliza una clave compuesta y legible derivada de su identidad de fuente:

```text
configured_device:<device_code>
physical_observation:<site>/<area_or_function>/<equipment_reference>
target_template:<template_code>
retired_legacy_template:<template_code>
```

La clave de inventario sirve únicamente para reconciliar fuentes durante esta fase. No sustituye:

- el `device_id` técnico;
- el código canónico definitivo;
- la identidad del endpoint;
- el principal técnico;
- la huella del equipo;
- la versión de plantilla;
- el activo físico;
- el identificador de estación.

Esas identidades se normalizarán en `AUTH-DEV-002`.

---

#### 6. Campos obligatorios

Cada registro conserva:

| Campo                        | Regla                                                                                |
| ---------------------------- | ------------------------------------------------------------------------------------ |
| `inventory_key`              | Clave compuesta única dentro de `SHARED-DEVICE-INVENTORY-001`.                       |
| `record_class`               | Una de las cuatro clases aprobadas.                                                  |
| `source_identifier`          | Código existente o referencia documental exacta.                                     |
| `source_kind`                | Base de datos, observación operativa, plantilla objetivo o plantilla legacy.         |
| `site_reference`             | Sede observada o declarada; no concede territorio.                                   |
| `area_or_function_reference` | Área o función observada; no reemplaza el área del actor.                            |
| `template_reference`         | Plantilla vinculada, candidata o no aplicable.                                       |
| `configuration_evidence`     | Evidencia documental o técnica disponible.                                           |
| `physical_evidence`          | Evidencia de equipo y ubicación.                                                     |
| `operational_evidence`       | Sesión de actor, heartbeat, eventos o validación física disponible.                  |
| `technical_state`            | `ESPECIFICADO`, `IMPLEMENTADO`, `BLOQUEADO`, `NO_APLICA` o `PENDIENTE_DE_EVIDENCIA`. |
| `evidence_state`             | Estado de suficiencia de la evidencia.                                               |
| `blocking_fact`              | Hecho concreto que impide una declaración más fuerte.                                |
| `responsible_task`           | Tarea exacta que resuelve el siguiente atributo pendiente.                           |

No se permiten identificadores duplicados, estados permisivos por ausencia ni equivalencias inferidas.

---

#### 7. Instancias configuradas y observaciones físicas

| `inventory_key`                                              | Clase                  | Identidad o referencia                                      | Evidencia territorial observada | Plantilla relacionada                                                    | Evidencia técnica                                                                          | Evidencia física u operativa                                                                                                                                               | Estado                                                                | Bloqueo concreto                                                                                             | Propietario del siguiente atributo                    |
| ------------------------------------------------------------ | ---------------------- | ----------------------------------------------------------- | ------------------------------- | ------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------- |
| `configured_device:CAJA_VENTO_CAFE_01`                       | `CONFIGURED_INSTANCE`  | `CAJA_VENTO_CAFE_01` — Caja Vento Café 01; `pos_terminal`   | `VENTO_CAFE` / Caja             | `pos_satellite`                                                          | Fila activa auditada; usuario técnico; apps PULSO, NEXO y SHELL; política `role_in_area`   | La estación de caja de Vento Café está documentada, pero no se demostró que sea exactamente el mismo equipo; `last_seen_at` sin evidencia y sin sesión de actor persistida | `IMPLEMENTADO` registral; `PENDIENTE_DE_EVIDENCIA` físico y operativo | Falta correlación inequívoca entre fila, activo físico, endpoint, ubicación vigente y actividad reciente     | `AUTH-DEV-002`; luego `AUTH-DEV-003` a `AUTH-DEV-006` |
| `configured_device:KIOSCO_BODEGA_CP`                         | `CONFIGURED_INSTANCE`  | `KIOSCO_BODEGA_CP` — Kiosco Bodega CP; `warehouse_terminal` | `CENTRO_PROD` / Bodega          | `warehouse_kiosk`                                                        | Fila activa auditada; usuario técnico; app NEXO; política actual `same_site_active_worker` | Existe referencia operativa al kiosco de bodega, pero no se demostró correspondencia física completa; `last_seen_at` sin evidencia y sin sesión de actor persistida        | `IMPLEMENTADO` registral; `PENDIENTE_DE_EVIDENCIA` físico y operativo | Falta correlación del activo y la política actual es demasiado amplia para el contrato objetivo              | `AUTH-DEV-002`; luego `AUTH-DEV-003` a `AUTH-DEV-006` |
| `physical_observation:VENTO_CAFE/SERVICIO/tablet_compartida` | `PHYSICAL_OBSERVATION` | Tablet compartida usada por servicio con cuenta conjunta    | Vento Café / servicio           | Sin vínculo técnico confirmado; familia funcional candidata de servicio  | No se identificó una instancia configurada inequívoca asociada                             | Evidencia documental `CONFIRMADO_PARCIAL`; falta observación física vigente, activo, endpoint y asociación técnica                                                         | `PENDIENTE_DE_EVIDENCIA`                                              | No se conoce si corresponde a un equipo, varios equipos, un dispositivo administrado o un acceso informal    | `AUTH-DEV-002`                                        |
| `physical_observation:SAUDO/SERVICIO/dispositivo_compartido` | `PHYSICAL_OBSERVATION` | Tablet compartida o celular con cuenta operativa conjunta   | Saudo / servicio                | Sin vínculo técnico confirmado; familia funcional pendiente de identidad | No se identificó una instancia configurada inequívoca asociada                             | Evidencia documental `CONFIRMADO_PARCIAL`; el tipo exacto de equipo no está cerrado                                                                                        | `PENDIENTE_DE_EVIDENCIA`                                              | No se conoce cantidad, activo, endpoint, custodia, condición compartida definitiva ni asociación a plantilla | `AUTH-DEV-002`                                        |

Decisiones de reconciliación:

- las dos filas configuradas se conservan como instancias técnicas auditadas;
- ninguna se declara físicamente validada;
- las dos observaciones físicas adicionales permanecen separadas;
- una cuenta conjunta no se acepta como identidad de actor;
- el número mínimo demostrado es de dos instancias configuradas y dos observaciones físicas no reconciliadas;
- no se infiere que existan exactamente cuatro equipos físicos.

---

#### 8. Plantillas objetivo

| `inventory_key`                                  | Plantilla                        | Modo             | Origen           | Instancias configuradas conocidas | Decisión canónica                                                                          | Estado                                                          |
| ------------------------------------------------ | -------------------------------- | ---------------- | ---------------- | --------------------------------: | ------------------------------------------------------------------------------------------ | --------------------------------------------------------------- |
| `target_template:pos_satellite`                  | `pos_satellite`                  | Operacional      | Legacy existente |                                 1 | Conservar y versionar; limitar a caja satélite                                             | `ESPECIFICADO` con instancia registral `PENDIENTE_DE_EVIDENCIA` |
| `target_template:bar_satellite`                  | `bar_satellite`                  | Operacional      | Legacy existente |                                 0 | Conservar y corregir la referencia legacy de actor                                         | `ESPECIFICADO`                                                  |
| `target_template:kitchen_satellite`              | `kitchen_satellite`              | Operacional      | Nueva            |                                 0 | Crear como clase especializada de cocina satélite                                          | `ESPECIFICADO`                                                  |
| `target_template:service_satellite`              | `service_satellite`              | Operacional      | Nueva            |                                 0 | Crear como clase especializada de servicio                                                 | `ESPECIFICADO`; observaciones físicas sin vínculo confirmado    |
| `target_template:counter_satellite`              | `counter_satellite`              | Operacional      | Nueva            |                                 0 | Crear como clase especializada de mostrador                                                | `ESPECIFICADO`                                                  |
| `target_template:integrated_satellite`           | `integrated_satellite`           | Operacional      | Nueva            |                                 0 | Crear para operación integrada de formato pequeño sin sumar automáticamente otros perfiles | `ESPECIFICADO`                                                  |
| `target_template:production_kitchen`             | `production_kitchen`             | Operacional      | Nueva            |                                 0 | Sustituir la parte de Cocina Caliente de `production_center`                               | `ESPECIFICADO`                                                  |
| `target_template:production_bakery`              | `production_bakery`              | Operacional      | Nueva            |                                 0 | Sustituir la parte de Galletería y Panadería de `production_center`                        | `ESPECIFICADO`                                                  |
| `target_template:production_pastry`              | `production_pastry`              | Operacional      | Nueva            |                                 0 | Sustituir la parte de Repostería de `production_center`                                    | `ESPECIFICADO`                                                  |
| `target_template:warehouse_kiosk`                | `warehouse_kiosk`                | Operacional      | Legacy existente |                                 1 | Conservar y sustituir la política demasiado amplia por elegibilidad exacta                 | `ESPECIFICADO` con instancia registral `PENDIENTE_DE_EVIDENCIA` |
| `target_template:logistics_vehicle_terminal`     | `logistics_vehicle_terminal`     | Operacional      | Nueva            |                                 0 | Crear para operación logística vinculada a vehículo o recurso                              | `ESPECIFICADO`                                                  |
| `target_template:procurement_reception`          | `procurement_reception`          | Mixta excluyente | Legacy existente |                                 0 | Rediseñar con modos operacional y administrativo mutuamente excluyentes                    | `ESPECIFICADO`                                                  |
| `target_template:operations_management_terminal` | `operations_management_terminal` | Operacional      | Nueva            |                                 0 | Crear para gerencia operativa con restricciones por acción y territorio                    | `ESPECIFICADO`                                                  |
| `target_template:management_terminal`            | `management_terminal`            | Administrativa   | Legacy existente |                                 0 | Rediseñar sin bypass por nombre de rol ni políticas duplicadas                             | `ESPECIFICADO`                                                  |

Resultado de cobertura:

```text
14 plantillas objetivo
= 5 plantillas legacy retenidas, corregidas o rediseñadas
+ 9 plantillas nuevas
```

Doce plantillas objetivo no tienen una instancia configurada conocida. Esta ausencia no autoriza su creación ni demuestra que no existan equipos físicos que puedan requerir reconciliación.

---

#### 9. Plantilla legacy retirada

| `inventory_key`                             | Plantilla           | Estado                             | Decisión                                            | Sustitución                                                    |
| ------------------------------------------- | ------------------- | ---------------------------------- | --------------------------------------------------- | -------------------------------------------------------------- |
| `retired_legacy_template:production_center` | `production_center` | `BLOQUEADO` para nuevas instancias | Retirar por mezclar producción sin distinguir áreas | `production_kitchen`, `production_bakery`, `production_pastry` |

Reglas:

- no podrá utilizarse como plantilla objetivo;
- no se traducirá automáticamente desde el rol legacy `cocinero`;
- no podrá reasignarse a una de las tres nuevas plantillas sin verificar área, estación, equipo y contexto;
- cualquier instancia futura deberá utilizar una plantilla especializada y versionada.

---

#### 10. Reconciliación de la infraestructura auditada

| Elemento auditado                                        | Cantidad | Interpretación canónica                                           |
| -------------------------------------------------------- | -------: | ----------------------------------------------------------------- |
| Plantillas activas legacy                                |        6 | Infraestructura existente; no equivale al catálogo objetivo.      |
| Plantillas objetivo                                      |       14 | Catálogo documental aprobado para evolución.                      |
| Plantillas legacy retiradas                              |        1 | `production_center`.                                              |
| Instancias configuradas activas auditadas                |        2 | Registros técnicos; no certificación física u operativa.          |
| Observaciones físicas compartidas sin vínculo inequívoco |        2 | Evidencia parcial que requiere identidad formal.                  |
| Sesiones de actor persistidas                            |        0 | No existe evidencia de uso conforme del cambio de actor.          |
| Eventos auditados                                        |        3 | Evidencia histórica insuficiente para validar operación continua. |
| Instancias con `last_seen_at` demostrado                 |        0 | No existe heartbeat suficiente para acreditar vigencia operativa. |
| Claves de inventario duplicadas                          |        0 | Las 19 identidades quedan separadas por clase y fuente.           |

La infraestructura existente está `IMPLEMENTADA` parcialmente en su dimensión registral, pero la operación de dispositivo compartido permanece `PENDIENTE_DE_EVIDENCIA`.

---

#### 11. Relación con estaciones compartidas

Los perfiles y arquetipos de estación aprobados se utilizan como contexto funcional, no como identidades de dispositivo.

Arquetipos de resolución operativa existentes:

- `SERVICE_CHECKOUT`;
- `KITCHEN_PREP`;
- `PRODUCTION_BATCH`;
- `WAREHOUSE_FLOW`;
- `SUPERVISION_EXPO`.

Perfiles base documentados:

- `STP-01-SHARED-OPERATIVE-TOUCH`;
- `STP-02-SHARED-POS-CASH`;
- `STP-03-SHARED-PRODUCTION-HUB`;
- `STP-04-SHARED-WAREHOUSE-SCAN`;
- `STP-05-SHARED-RECEIVING-MEASURE`;
- `STP-06-SHARED-DISPATCH-HANDOFF`;
- `STP-07-SHARED-MOBILE-POOL`;
- `STP-08-SHARED-OBSERVATION-DISPLAY`;
- `STP-09-SHARED-PERIPHERAL-HOST`.

Reglas de separación:

```text
ARQUETIPO
→ resuelve una familia de interacción

PERFIL DE ESTACIÓN
→ define capacidades físicas y operativas reutilizables

PLANTILLA DE DISPOSITIVO
→ limita configuración, actor y capacidades máximas

INSTANCIA DE DISPOSITIVO
→ identifica un endpoint técnico concreto

INSTANCIA DE ESTACIÓN
→ identifica un puesto físico compuesto
```

Una misma estación podrá contener más de un endpoint o periférico. Un mismo dispositivo no podrá representarse simultáneamente como varias instancias activas sin una relación explícita definida posteriormente.

---

#### 12. Límites de esta tarea

AUTH-DEV-001 no define:

- formato definitivo del código de dispositivo;
- vínculo entre activo físico, endpoint y principal técnico;
- fingerprint, certificado, secreto o credencial;
- versionamiento de la identidad;
- reglas de duplicado, clonación, reemplazo o reinstalación;
- sede definitiva de cada dispositivo;
- área definitiva de cada dispositivo;
- aplicaciones permitidas;
- permisos máximos;
- duración de sesión;
- PIN, passkey o MFA;
- heartbeat;
- revocación;
- rotación de credenciales;
- implementación, backfill o limpieza de registros legacy.

Estas decisiones pertenecen a `AUTH-DEV-002` y tareas posteriores del mismo bloque.

---

#### 13. Handoff exacto a AUTH-DEV-002

`AUTH-DEV-002` deberá consumir las 19 claves del inventario y resolver, sin fusionarlas silenciosamente:

1. qué clases requieren una identidad técnica propia;
2. qué diferencia existe entre dispositivo, endpoint, activo, estación, plantilla y principal técnico;
3. cómo se identifica una instancia física de forma estable;
4. cómo se vinculan `device_id`, código, activo y credencial;
5. cómo se detectan duplicados, clones, reinstalaciones y reemplazos;
6. cómo se representa una observación física todavía no incorporada;
7. cómo se versiona la relación plantilla–instancia;
8. qué evidencia convierte una fila registral en dispositivo físico verificado;
9. qué evidencia convierte un equipo observado en instancia administrada;
10. cómo se preserva historial sin reutilizar identidades retiradas.

La tarea siguiente no podrá asumir que las dos observaciones físicas adicionales son instancias nuevas ni que corresponden a equipos distintos hasta resolver la evidencia.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** AUTH-DEV-001 consolida identidades documentales y estados de evidencia ya protegidos por requisitos vigentes. No introduce comportamiento ejecutable, permiso, flujo, migración, contrato de identidad, mecanismo de sesión ni cambio físico. La cobertura existente ya protege:

- el ciclo de vida auditable del dispositivo;
- la separación entre límites del dispositivo y autoridad del actor;
- la conservación del principal técnico, actor y contexto;
- la sesión de actor y la limpieza entre trabajadores;
- la restricción plantilla–instancia;
- la cobertura, compatibilidad y reautenticación por acción.

Por tanto, el Registro Canónico de Requisitos de Prueba permanece sin cambios.

---

#### 14. Criterios de aceptación

- [x] Se distinguieron instancia configurada, observación física, plantilla objetivo, plantilla legacy, estación y periférico.
- [x] Se conservaron las dos instancias configuradas auditadas con sus códigos exactos.
- [x] Se registraron separadamente las dos observaciones físicas compartidas sin equivalencia técnica confirmada.
- [x] Se materializaron las catorce plantillas objetivo sin omisiones ni duplicados.
- [x] Se registró `production_center` como plantilla legacy retirada.
- [x] Se reconciliaron las seis plantillas legacy con su decisión objetivo.
- [x] Se preservó que existen dos instancias configuradas, cero sesiones de actor, tres eventos y cero `last_seen_at` demostrados.
- [x] No se declaró físicamente validada ninguna instancia sin evidencia.
- [x] No se convirtió una cuenta conjunta en identidad permitida.
- [x] No se infirió una cantidad exacta de equipos físicos desde registros y observaciones parciales.
- [x] Cada vacío conserva hecho bloqueante, tarea responsable y condición de resolución.
- [x] No se definieron por anticipado identidad, sede, área, aplicaciones ni permisos máximos.
- [x] No se modificó código, Supabase, migraciones, datos, configuración ni dispositivos.
- [x] `AUTH-DEV-002` permanece únicamente reservada.

---

#### 15. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-UI-039 — Definir masking según permiso`

**TAREA ACTUAL APROBADA**
`AUTH-DEV-001 — Inventariar dispositivos compartidos`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DEV-002 — Definir identidad del dispositivo`


### ✅ AUTH-DEV-002 — Definir identidad del dispositivo

**Estado:** APROBADA
**Tarea anterior:** `AUTH-DEV-001 — Inventariar dispositivos compartidos` — APROBADA
**Tarea siguiente:** `AUTH-DEV-003 — Asignar sede fija` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de identidad lógica, endpoint, principal técnico, activo, estación, enrolamiento y continuidad histórica del dispositivo compartido
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/P_DISPOSITIVOS_COMPARTIDOS/01_IDENTIDAD_ALCANCE_Y_LIMITES_DEL_DISPOSITIVO.md`
**Artefacto producido:** `SHARED-DEVICE-IDENTITY-CONTRACT-001`
**Inventario consumido:** `SHARED-DEVICE-INVENTORY-001` — 19 claves
**Cambios en código, Supabase, migraciones, RLS, RPC, configuración, credenciales, datos, aplicaciones o dispositivos:** no autorizados

---

#### 1. Propósito

Definir una identidad estable y verificable para cada dispositivo compartido de Vento OS sin confundir:

- la instancia empresarial;
- el código legible;
- la instalación técnica que ejecuta el software;
- el equipo físico;
- el puesto o estación donde opera;
- el principal técnico autenticado;
- la credencial que demuestra posesión;
- la plantilla que limita su configuración;
- la observación física que originó una investigación;
- el trabajador que actúa temporalmente.

La identidad deberá permitir reconocer de forma inequívoca qué dispositivo originó una solicitud, detectar duplicados o clones, reemplazar o reinstalar equipos sin perder historial y evitar que una cuenta técnica se convierta en actor empresarial.

```text
DISPOSITIVO EMPRESARIAL
≠ ENDPOINT
≠ ACTIVO FÍSICO
≠ ESTACIÓN
≠ PRINCIPAL TÉCNICO
≠ CREDENCIAL
≠ PLANTILLA
≠ OBSERVACIÓN
≠ ACTOR HUMANO
```

---

#### 2. Resultado material

Se aprueba `SHARED-DEVICE-IDENTITY-CONTRACT-001` como contrato de identidad que deberán consumir `AUTH-DEV-003` a `AUTH-DEV-016`, `AUTH-CTX-025` a `AUTH-CTX-030`, la arquitectura de Supabase, los paquetes E5 y la implementación física posterior.

El contrato materializa:

| Elemento                                    | Resultado |
| ------------------------------------------- | --------- |
| Capas de identidad separadas                | 9         |
| Estados de aseguramiento                    | 7         |
| Claves heredadas evaluadas                  | 19 de 19  |
| Instancias lógicas conservadas              | 2         |
| Observaciones sin enrolamiento              | 2         |
| Entradas sin identidad de dispositivo       | 15        |
| Códigos actuales preservados                | 2         |
| Dispositivos creados por inferencia         | 0         |
| Identidades reutilizables después de retiro | 0         |

---

#### 3. Base normativa y técnica

La tarea conserva sin cambios las decisiones aprobadas en:

- `AUTH-MOD-011 — Definir dispositivo compartido`;
- `AUTH-CAT-014 — Definir permisos que admiten dispositivo compartido`;
- `AUTH-RBAC-023 — Definir capacidades permitidas por dispositivo compartido`;
- `AUTH-CTX-005`, `AUTH-CTX-006`, `AUTH-CTX-014`, `AUTH-CTX-015` y `AUTH-CTX-024`;
- `UX-STATION-003`, `UX-STATION-004`, `UX-STATION-006`, `UX-STATION-007` y `UX-STATION-009`;
- `AUTH-DEV-001 — Inventariar dispositivos compartidos`.

Se reconoce el estado técnico existente:

- `public.shared_operational_devices.id` representa una identidad registral de instancia;
- `public.shared_operational_devices.code` posee unicidad registral;
- `public.shared_operational_devices.auth_user_id` vincula directamente un sujeto técnico de Supabase Auth;
- existen tablas de aplicaciones, plantillas, políticas, sesiones, eventos y firmas de actor;
- no existe una identidad canónica separada de endpoint;
- no existe vínculo versionado entre endpoint, principal técnico y dispositivo;
- no existe vínculo canónico con activo físico o instancia de estación;
- no existe evidencia de enrolamiento o desafío de posesión;
- `last_seen_at` no tiene evidencia suficiente en las instancias auditadas;
- los resolvedores legacy todavía pueden utilizar `navigation_role` como rol operativo, conducta no conforme que no se corrige en esta tarea.

La infraestructura actual se clasifica como identidad registral parcial, no como identidad física y operacional verificada.

---

#### 4. Capas canónicas de identidad

| Identidad                | Función                                                                                           | Estabilidad                                     | Puede autorizar |
| ------------------------ | ------------------------------------------------------------------------------------------------- | ----------------------------------------------- | --------------: |
| `device_id`              | Identidad empresarial inmutable del dispositivo lógico administrado                               | Persiste durante la vida del dispositivo lógico |              No |
| `device_code`            | Referencia humana única y estable                                                                 | Persiste y no se reutiliza                      |              No |
| `endpoint_id`            | Identidad de la instalación técnica enrolada que ejecuta el cliente                               | Cambia ante reinstalación o recuperación        |              No |
| `asset_id`               | Identidad del equipo físico dentro del inventario de activos                                      | Cambia ante sustitución de hardware             |              No |
| `station_instance_id`    | Identidad del puesto físico compuesto donde puede operar el dispositivo                           | Puede sobrevivir al reemplazo del equipo        |              No |
| `technical_principal_id` | Sujeto técnico autenticado asociado al dispositivo                                                | Puede rotarse o sustituirse                     |              No |
| `credential_binding_id`  | Vínculo versionado que demuestra qué credencial pertenece a qué principal, endpoint y dispositivo | Cambia con rotación, recuperación o revocación  |              No |
| `template_binding`       | Relación con código y versión exactos de plantilla                                                | Cambia mediante actualización controlada        |              No |
| `observation_id`         | Identidad de una observación física aún no reconciliada                                           | Persiste como evidencia de origen               |              No |

La única identidad que puede aparecer como responsable empresarial de una acción es el actor humano efectivo resuelto mediante una sesión válida. El dispositivo permanece como principal técnico y evidencia contextual.

---

#### 5. Contratos conceptuales

```ts
type SharedDeviceIdentity = {
  device_id: string;
  device_code: string;
  identity_assurance_state:
    | "OBSERVED_ONLY"
    | "REGISTERED_UNVERIFIED"
    | "ENROLLED_UNVERIFIED"
    | "VERIFIED"
    | "CONFLICTED"
    | "REVOKED"
    | "RETIRED";
  current_endpoint_id: string | null;
  technical_principal_id: string | null;
  credential_binding_id: string | null;
  asset_id: string | null;
  station_instance_id: string | null;
  template_code: string | null;
  template_version: string | null;
  source_observation_ids: string[];
  supersedes_device_id: string | null;
  created_at: string;
  verified_at: string | null;
  revoked_at: string | null;
  retired_at: string | null;
};
```

```ts
type SharedDeviceEndpointIdentity = {
  endpoint_id: string;
  device_id: string;
  installation_generation: number;
  enrollment_state: "PENDING" | "ENROLLED" | "REVOKED" | "REPLACED";
  enrolled_at: string | null;
  replaced_at: string | null;
};
```

```ts
type SharedDevicePrincipalBinding = {
  credential_binding_id: string;
  device_id: string;
  endpoint_id: string;
  technical_principal_id: string;
  credential_version: number;
  binding_state: "PENDING" | "CURRENT" | "REVOKED" | "SUPERSEDED";
  effective_from: string;
  effective_until: string | null;
};
```

Estas formas son contractuales. La arquitectura física podrá normalizarlas sin perder identidades, cardinalidades, estados, historia ni restricciones.

---

#### 6. `device_id`

`device_id` identifica una instancia empresarial lógica administrada.

Reglas:

1. será opaco, único e inmutable;
2. no se derivará del código, sede, área, plantilla, activo, principal o trabajador;
3. no será igual a `auth.uid()` ni a un identificador de empleado;
4. podrá sobrevivir a cambio de etiqueta, rotación de credencial, reinstalación y sustitución controlada del hardware;
5. no sobrevivirá a una división, fusión o creación de otro dispositivo lógico;
6. no se reutilizará después de `RETIRED`;
7. la eliminación física no será el mecanismo ordinario de retiro;
8. los dos registros configurados conservarán su `id` existente como `device_id` durante la transición, salvo evidencia posterior de duplicado o corrupción.

---

#### 7. `device_code`

`device_code` será la referencia legible estable del dispositivo.

Se preservan exactamente:

- `CAJA_VENTO_CAFE_01`;
- `KIOSCO_BODEGA_CP`.

El código:

- será único;
- no contendrá secretos;
- no cambiará por modificar la etiqueta humana;
- no se interpretará para inferir sede, área, rol, aplicación, plantilla o permisos;
- no se reasignará a otro `device_id`;
- continuará reservado después de revocación o retiro;
- podrá conservarse durante un reemplazo aprobado del mismo dispositivo lógico.

Un cambio correctivo de código exigirá alias histórico, evento auditado y prevención de reutilización del valor anterior. No equivaldrá a crear una identidad nueva ni podrá ejecutarse silenciosamente.

---

#### 8. Endpoint, principal técnico y credencial

La resolución autoritativa seguirá esta cadena:

```text
SOLICITUD AUTENTICADA
→ PRINCIPAL TÉCNICO
→ VÍNCULO VIGENTE
→ ENDPOINT ENROLADO
→ DEVICE_ID EXACTO
```

Reglas:

1. un `endpoint_id` pertenecerá a un solo `device_id` vigente;
2. un dispositivo tendrá como máximo un endpoint actual ordinario;
3. un principal técnico pertenecerá a un solo dispositivo vigente;
4. el principal técnico no será un empleado ni heredará permisos laborales;
5. la credencial completa nunca se almacenará en tablas empresariales, `metadata`, logs, eventos o respuestas;
6. el vínculo conservará versión, vigencia, estado, origen y auditoría;
7. la rotación creará una versión nueva y cerrará la anterior;
8. una credencial copiada no creará otro endpoint válido;
9. un endpoint no podrá autodeclarar a qué dispositivo pertenece;
10. cero vínculos o más de un vínculo autoritativo producirán fail closed.

`auth_user_id` se reconoce como representación legacy del principal técnico. Durante la transición no será reinterpretado como `device_id`, endpoint, activo ni actor.

---

#### 9. Enrolamiento y prueba de posesión

Un endpoint solo pasará a `ENROLLED_UNVERIFIED` cuando el servidor pueda comprobar:

1. existencia previa de un `device_id` administrable;
2. operación de enrolamiento autorizada;
3. emisión o asociación controlada de un principal técnico;
4. desafío único, temporal y no reutilizable;
5. demostración de posesión de la credencial vinculada;
6. creación de `endpoint_id` e `installation_generation`;
7. vínculo único entre endpoint, principal y dispositivo;
8. cierre de cualquier vínculo anterior incompatible;
9. registro de fecha, actor administrativo, motivo y correlación;
10. ausencia de conflicto de duplicado o clon.

No constituyen identidad suficiente por sí solos:

- `device_id` o código enviados por el cliente;
- local storage, cookie o archivo copiable;
- correo técnico interpretado por texto;
- dirección IP;
- dirección MAC;
- serial de hardware;
- hostname;
- user agent;
- fingerprint de navegador;
- ruta visitada;
- aplicación instalada;
- QR no validado.

Estos datos podrán servir como señales de diagnóstico o evidencia secundaria, nunca como raíz única de confianza.

---

#### 10. Activo físico, estación y observación

`asset_id` identifica el equipo físico. `station_instance_id` identifica el puesto compuesto. Ninguno reemplaza `device_id`.

Reglas:

- una estación puede conservarse cuando se reemplaza un equipo;
- una estación puede contener varios dispositivos o periféricos con identidades separadas;
- el activo no concede sede, área, aplicación ni permiso;
- el serial puede apoyar verificación, pero no será la identidad empresarial;
- una observación puede describir uno o varios equipos todavía no contados;
- `observation_id` se conserva aunque después se vincule a una instancia;
- vincular una observación no la elimina ni reescribe su evidencia;
- no se creará un activo, endpoint o dispositivo por deducirlo del nombre del área o de una cuenta conjunta.

---

#### 11. Estados de aseguramiento de identidad

| Estado                  | Significado                                                                                  | Acción empresarial                                                    |
| ----------------------- | -------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| `OBSERVED_ONLY`         | Existe evidencia física o documental, pero no una instancia administrada.                    | Prohibida                                                             |
| `REGISTERED_UNVERIFIED` | Existe `device_id` y código registrales, sin enrolamiento y verificación física suficientes. | No se habilita por este estado                                        |
| `ENROLLED_UNVERIFIED`   | Existe endpoint y vínculo técnico verificables, pero falta correlación física o de custodia. | Bloqueada salvo operación técnica de verificación                     |
| `VERIFIED`              | Registro, enrolamiento, equipo o estación y evidencia coinciden sin conflicto.               | Puede continuar a evaluación de activación, actor, contexto y permiso |
| `CONFLICTED`            | Existe duplicado, clon, ambigüedad o relación incompatible.                                  | Prohibida                                                             |
| `REVOKED`               | Los vínculos técnicos fueron invalidados conservando historial.                              | Prohibida                                                             |
| `RETIRED`               | La identidad empresarial fue cerrada permanentemente.                                        | Prohibida y no reutilizable                                           |

`identity_assurance_state` no reemplaza `activation_status`, conectividad, `last_seen_at`, salud, sesión de actor ni autorización. Un dispositivo `VERIFIED` todavía puede estar inactivo, sin actor o sin permiso.

---

#### 12. Verificación física y operacional de identidad

Una fila registral solo podrá alcanzar `VERIFIED` cuando exista una decisión auditable que reúna:

- `device_id` y código únicos;
- endpoint enrolado y desafío de posesión satisfactorio;
- principal y vínculo técnicos vigentes;
- activo físico o instancia de estación identificables;
- verificación presencial o procedimiento remoto controlado por actor autorizado;
- custodia y ubicación observadas sin convertirlas en autorización;
- plantilla y versión exactas;
- ausencia de duplicados o conflictos;
- fecha, verificador, fuente y evidencia mínima;
- correlación inequívoca con cualquier observación previa aplicable.

`last_seen_at`, un evento aislado, una sesión Auth válida o una fila `active` no prueban por sí solos identidad física ni operación conforme.

---

#### 13. Observaciones físicas no incorporadas

Para convertir una observación en instancia administrada se deberá:

1. confirmar si representa cero, uno o varios equipos;
2. identificar activo o estación cuando existan;
3. buscar coincidencias por evidencia, no por nombre parecido;
4. descartar duplicación con dispositivo, endpoint, principal, activo y estación existentes;
5. decidir explícitamente si se vincula a una instancia o se registra una nueva;
6. asignar un código nuevo únicamente cuando corresponda una instancia nueva;
7. ejecutar enrolamiento y prueba de posesión;
8. conservar `observation_id` como fuente;
9. no asignar todavía sede, área, aplicaciones o permisos por inferencia;
10. registrar la decisión y los elementos descartados.

Las observaciones de Vento Café y Saudo permanecen `OBSERVED_ONLY` hasta cumplir este procedimiento.

---

#### 14. Duplicados, clones y ambigüedades

Se considera conflicto de identidad, como mínimo:

- dos `device_id` con el mismo código;
- un código asociado históricamente a más de un dispositivo;
- un principal técnico vigente asociado a varios dispositivos;
- un endpoint vigente asociado a varios dispositivos;
- más de un endpoint actual ordinario para el mismo dispositivo;
- la misma prueba de credencial utilizada desde endpoints incompatibles;
- una reinstalación que conserva el endpoint anterior;
- un activo reclamado por varias identidades sin relación compuesta explícita;
- una observación vinculada simultáneamente a instancias incompatibles;
- un dispositivo retirado que reaparece con su identidad anterior sin recuperación autorizada.

Resultado:

```text
identity_assurance_state = CONFLICTED
→ invalidar decisiones cacheadas
→ cerrar capacidad empresarial
→ conservar evidencia
→ exigir reconciliación autorizada
```

Nunca se elegirá el primer registro, el más reciente, el que tenga `last_seen_at`, el de la sede esperada o el que coincida con `navigation_role`.

---

#### 15. Reinstalación, recuperación y reemplazo

##### Reinstalación

Una reinstalación del mismo dispositivo lógico:

- conserva `device_id` y `device_code` solo mediante recuperación autorizada;
- crea nuevo `endpoint_id`;
- incrementa `installation_generation`;
- crea nuevo vínculo técnico;
- revoca o sustituye endpoint y vínculo anteriores;
- invalida cachés y sesiones técnicas incompatibles;
- conserva historial y motivo.

##### Reemplazo de hardware

Un reemplazo puede conservar `device_id` y código únicamente cuando sustituye el mismo dispositivo lógico dentro de una decisión explícita.

Deberá:

- cerrar el `asset_id` anterior;
- asociar el activo nuevo;
- crear endpoint y vínculo nuevos;
- preservar estación cuando corresponda;
- mantener el historial de ambos activos;
- registrar responsable, motivo, fecha y evidencia;
- impedir uso simultáneo del equipo retirado.

Si el nuevo equipo representa otra función, otra instancia simultánea, una división, una fusión o una expansión de capacidad, deberá recibir otro `device_id` y código.

---

#### 16. Plantilla e identidad

La plantilla define configuración máxima; no identifica el dispositivo.

```text
DEVICE_ID
→ instancia lógica

TEMPLATE_CODE + TEMPLATE_VERSION
→ contrato de configuración
```

Reglas:

- cada instancia deberá fijarse a una versión exacta;
- cambiar de versión no cambia `device_id`;
- retirar una plantilla no retira automáticamente todas las identidades;
- una plantilla sin instancias no recibe endpoint, principal ni credencial;
- `production_center` permanece como identidad histórica de plantilla retirada, no como dispositivo;
- una instancia no se fusiona con otra por usar la misma plantilla;
- un dispositivo no se clona al crear una plantilla nueva;
- la relación plantilla–instancia podrá reducir configuración, nunca ampliar autoridad.

---

#### 17. Matriz completa de las 19 claves

| `inventory_key`                                              | Clase                     | Decisión de identidad                | Estado de aseguramiento | Identidades conservadas o permitidas                                                                                                           | Bloqueo concreto                                                                                                                    | Destino exacto                                 |
| ------------------------------------------------------------ | ------------------------- | ------------------------------------ | ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------- |
| `configured_device:CAJA_VENTO_CAFE_01`                       | `CONFIGURED_INSTANCE`     | `CONSERVAR_IDENTIDAD_LOGICA`         | `REGISTERED_UNVERIFIED` | `device_id` de la fila existente; `device_code = CAJA_VENTO_CAFE_01`; `auth_user_id` tratado como vínculo técnico legacy                       | No existe evidencia de `endpoint_id`, `asset_id`, `station_instance_id`, enrolamiento verificable ni correlación física inequívoca. | `AUTH-CTX-025`; `AUTH-CTX-028`; `AUTH-DEV-015` |
| `configured_device:KIOSCO_BODEGA_CP`                         | `CONFIGURED_INSTANCE`     | `CONSERVAR_IDENTIDAD_LOGICA`         | `REGISTERED_UNVERIFIED` | `device_id` de la fila existente; `device_code = KIOSCO_BODEGA_CP`; `auth_user_id` tratado como vínculo técnico legacy                         | No existe evidencia de `endpoint_id`, `asset_id`, `station_instance_id`, enrolamiento verificable ni correlación física inequívoca. | `AUTH-CTX-025`; `AUTH-CTX-028`; `AUTH-DEV-014` |
| `physical_observation:VENTO_CAFE/SERVICIO/tablet_compartida` | `PHYSICAL_OBSERVATION`    | `NO_CREAR_DEVICE_ID_POR_INFERENCIA`  | `OBSERVED_ONLY`         | Conservar únicamente `observation_id` derivado de la clave de inventario.                                                                      | Cantidad de equipos, activo, endpoint, principal técnico y correspondencia con una instancia existente no demostrados.              | `AUTH-DEV-014`; `AUTH-DEV-015`                 |
| `physical_observation:SAUDO/SERVICIO/dispositivo_compartido` | `PHYSICAL_OBSERVATION`    | `NO_CREAR_DEVICE_ID_POR_INFERENCIA`  | `OBSERVED_ONLY`         | Conservar únicamente `observation_id` derivado de la clave de inventario.                                                                      | Tipo y cantidad de equipos, activo, endpoint, principal técnico y correspondencia con una instancia existente no demostrados.       | `AUTH-DEV-014`; `AUTH-DEV-015`                 |
| `target_template:pos_satellite`                              | `TARGET_TEMPLATE`         | `NO_APLICA_IDENTIDAD_DE_DISPOSITIVO` | `NO_APLICA`             | Identidad de plantilla `template_code = pos_satellite` y versión contractual; sin `device_id`, endpoint ni principal técnico.                  | Plantilla objetivo retenida y versionada; no es una instancia.                                                                      | `AUTH-DEV-003` a `AUTH-DEV-006`                |
| `target_template:bar_satellite`                              | `TARGET_TEMPLATE`         | `NO_APLICA_IDENTIDAD_DE_DISPOSITIVO` | `NO_APLICA`             | Identidad de plantilla `template_code = bar_satellite` y versión contractual; sin `device_id`, endpoint ni principal técnico.                  | Plantilla objetivo corregida; no es una instancia.                                                                                  | `AUTH-DEV-003` a `AUTH-DEV-006`                |
| `target_template:kitchen_satellite`                          | `TARGET_TEMPLATE`         | `NO_APLICA_IDENTIDAD_DE_DISPOSITIVO` | `NO_APLICA`             | Identidad de plantilla `template_code = kitchen_satellite` y versión contractual; sin `device_id`, endpoint ni principal técnico.              | Plantilla objetivo nueva; no es una instancia.                                                                                      | `AUTH-DEV-003` a `AUTH-DEV-006`                |
| `target_template:service_satellite`                          | `TARGET_TEMPLATE`         | `NO_APLICA_IDENTIDAD_DE_DISPOSITIVO` | `NO_APLICA`             | Identidad de plantilla `template_code = service_satellite` y versión contractual; sin `device_id`, endpoint ni principal técnico.              | Plantilla objetivo nueva; no es una instancia.                                                                                      | `AUTH-DEV-003` a `AUTH-DEV-006`                |
| `target_template:counter_satellite`                          | `TARGET_TEMPLATE`         | `NO_APLICA_IDENTIDAD_DE_DISPOSITIVO` | `NO_APLICA`             | Identidad de plantilla `template_code = counter_satellite` y versión contractual; sin `device_id`, endpoint ni principal técnico.              | Plantilla objetivo nueva; no es una instancia.                                                                                      | `AUTH-DEV-003` a `AUTH-DEV-006`                |
| `target_template:integrated_satellite`                       | `TARGET_TEMPLATE`         | `NO_APLICA_IDENTIDAD_DE_DISPOSITIVO` | `NO_APLICA`             | Identidad de plantilla `template_code = integrated_satellite` y versión contractual; sin `device_id`, endpoint ni principal técnico.           | Plantilla objetivo nueva; no es una instancia.                                                                                      | `AUTH-DEV-003` a `AUTH-DEV-006`                |
| `target_template:production_kitchen`                         | `TARGET_TEMPLATE`         | `NO_APLICA_IDENTIDAD_DE_DISPOSITIVO` | `NO_APLICA`             | Identidad de plantilla `template_code = production_kitchen` y versión contractual; sin `device_id`, endpoint ni principal técnico.             | Plantilla objetivo especializada; no es una instancia.                                                                              | `AUTH-DEV-003` a `AUTH-DEV-006`                |
| `target_template:production_bakery`                          | `TARGET_TEMPLATE`         | `NO_APLICA_IDENTIDAD_DE_DISPOSITIVO` | `NO_APLICA`             | Identidad de plantilla `template_code = production_bakery` y versión contractual; sin `device_id`, endpoint ni principal técnico.              | Plantilla objetivo especializada; no es una instancia.                                                                              | `AUTH-DEV-003` a `AUTH-DEV-006`                |
| `target_template:production_pastry`                          | `TARGET_TEMPLATE`         | `NO_APLICA_IDENTIDAD_DE_DISPOSITIVO` | `NO_APLICA`             | Identidad de plantilla `template_code = production_pastry` y versión contractual; sin `device_id`, endpoint ni principal técnico.              | Plantilla objetivo especializada; no es una instancia.                                                                              | `AUTH-DEV-003` a `AUTH-DEV-006`                |
| `target_template:warehouse_kiosk`                            | `TARGET_TEMPLATE`         | `NO_APLICA_IDENTIDAD_DE_DISPOSITIVO` | `NO_APLICA`             | Identidad de plantilla `template_code = warehouse_kiosk` y versión contractual; sin `device_id`, endpoint ni principal técnico.                | Plantilla objetivo retenida y corregida; no es una instancia.                                                                       | `AUTH-DEV-003` a `AUTH-DEV-006`                |
| `target_template:logistics_vehicle_terminal`                 | `TARGET_TEMPLATE`         | `NO_APLICA_IDENTIDAD_DE_DISPOSITIVO` | `NO_APLICA`             | Identidad de plantilla `template_code = logistics_vehicle_terminal` y versión contractual; sin `device_id`, endpoint ni principal técnico.     | Plantilla objetivo nueva; no es una instancia.                                                                                      | `AUTH-DEV-003` a `AUTH-DEV-006`                |
| `target_template:procurement_reception`                      | `TARGET_TEMPLATE`         | `NO_APLICA_IDENTIDAD_DE_DISPOSITIVO` | `NO_APLICA`             | Identidad de plantilla `template_code = procurement_reception` y versión contractual; sin `device_id`, endpoint ni principal técnico.          | Plantilla objetivo rediseñada; no es una instancia.                                                                                 | `AUTH-DEV-003` a `AUTH-DEV-006`                |
| `target_template:operations_management_terminal`             | `TARGET_TEMPLATE`         | `NO_APLICA_IDENTIDAD_DE_DISPOSITIVO` | `NO_APLICA`             | Identidad de plantilla `template_code = operations_management_terminal` y versión contractual; sin `device_id`, endpoint ni principal técnico. | Plantilla objetivo nueva; no es una instancia.                                                                                      | `AUTH-DEV-003` a `AUTH-DEV-006`                |
| `target_template:management_terminal`                        | `TARGET_TEMPLATE`         | `NO_APLICA_IDENTIDAD_DE_DISPOSITIVO` | `NO_APLICA`             | Identidad de plantilla `template_code = management_terminal` y versión contractual; sin `device_id`, endpoint ni principal técnico.            | Plantilla objetivo rediseñada; no es una instancia.                                                                                 | `AUTH-DEV-003` a `AUTH-DEV-006`                |
| `retired_legacy_template:production_center`                  | `RETIRED_LEGACY_TEMPLATE` | `NO_APLICA_IDENTIDAD_DE_DISPOSITIVO` | `NO_APLICA`             | Identidad histórica de plantilla retirada; sin `device_id`, endpoint ni principal técnico.                                                     | No admite nuevas instancias y no puede transformarse automáticamente en identidad de dispositivo.                                   | `AUTH-DEV-003` a `AUTH-DEV-006`                |

Distribución verificada:

```text
19 claves
= 2 REGISTERED_UNVERIFIED
+ 2 OBSERVED_ONLY
+ 15 NO_APLICA
```

Ninguna plantilla ni observación recibe `device_id` por pertenecer al inventario.

---

#### 18. Operaciones técnicas sin actor

La identidad técnica podrá participar únicamente en operaciones expresamente técnicas, entre ellas:

- enrolamiento;
- prueba de posesión;
- recuperación autorizada;
- carga de configuración mínima;
- rotación y revocación de credenciales;
- reporte de salud;
- obtención de actualización autorizada;
- bloqueo y limpieza;
- diagnóstico seguro.

Esta lista no concede todavía endpoints, RPC ni permisos técnicos. La implementación deberá separar estas operaciones de acciones empresariales y evitar que el principal técnico aparezca como trabajador.

---

#### 19. Reconciliación con la implementación existente

| Elemento actual                                                | Decisión contractual                                                                                   | Estado                                  |
| -------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | --------------------------------------- |
| `shared_operational_devices.id`                                | Se conserva como candidato a `device_id` de las dos instancias registradas.                            | `IMPLEMENTADO` parcial                  |
| `shared_operational_devices.code`                              | Se conserva como `device_code` único; no se interpreta semánticamente.                                 | `IMPLEMENTADO` parcial                  |
| `shared_operational_devices.auth_user_id`                      | Se trata como vínculo legacy a principal técnico, no como identidad completa.                          | `BLOQUEADO` para conformidad final      |
| `shared_operational_devices.last_seen_at`                      | Telemetría de presencia; no prueba identidad ni verificación física.                                   | `PENDIENTE_DE_EVIDENCIA`                |
| Tablas de sesiones y firmas                                    | Identifican o firman al actor humano; no sustituyen endpoint ni enrolamiento del dispositivo.          | `IMPLEMENTADO` parcial                  |
| Plantillas actuales                                            | Configuración reutilizable sin versión de identidad materializada.                                     | `ESPECIFICADO` con transición pendiente |
| `current_shared_operational_device_v1()`                       | Resuelve por `auth_user_id`, pero no demuestra endpoint, activo, enrolamiento ni historia del vínculo. | `LEGACY_NO_CONFORME`                    |
| `get_effective_context_v1()` y `has_effective_permission_v1()` | El uso autoritativo de `navigation_role` no cumple la separación entre principal técnico y actor.      | `LEGACY_NO_CONFORME`                    |

Destinos exactos:

- `AUTH-CTX-025` diseñará el productor SQL del contexto;
- `AUTH-CTX-027` retirará lógica autoritativa local;
- `AUTH-CTX-028` adaptará tablas, RPC y vínculos legacy;
- `AUTH-CTX-029` invalidará contexto ante cambios de identidad;
- `AUTH-DEV-009` impedirá herencia administrativa o por navegación;
- `AUTH-DEV-011` definirá revocación;
- `AUTH-DEV-014` a `AUTH-DEV-016` comprobarán equipos y aplicaciones reales;
- `DELIV-PKG-001` a `DELIV-PKG-025::NEXO-REMISSIONS-001` incorporarán el diseño físico, pruebas, transición y rollback del paquete;
- el BLOQUE R aplicará únicamente las migraciones incluidas en un paquete aprobado.

---

#### 20. Eventos conceptuales de identidad

La futura implementación deberá poder auditar, como mínimo:

- `device_identity_registered`;
- `device_endpoint_enrolled`;
- `device_principal_bound`;
- `device_identity_verified`;
- `device_identity_conflict_detected`;
- `device_endpoint_reinstalled`;
- `device_asset_replaced`;
- `device_credential_rotated`;
- `device_binding_revoked`;
- `device_identity_retired`;
- `device_observation_linked`.

Los nombres físicos definitivos podrán versionarse, pero no se perderán actor administrativo, dispositivo, endpoint, principal, versión, motivo, timestamp, correlación ni estado anterior y posterior.

---

#### 21. Fuera del alcance

AUTH-DEV-002 no:

- asigna sede o área;
- asigna aplicaciones;
- asigna paquetes de permisos;
- define PIN, QR, NFC, passkey o proveedor de MFA;
- define duración de sesión de actor;
- implementa revocación, expiración o cambio de trabajador;
- crea activos o estaciones;
- crea, modifica o elimina usuarios de Supabase Auth;
- emite, rota o revoca credenciales reales;
- crea tablas, constraints, funciones, RPC, RLS o migraciones;
- ejecuta enrolamientos;
- modifica las dos instancias actuales;
- vincula las observaciones de Vento Café o Saudo;
- corrige resolvedores legacy;
- valida físicamente un equipo;
- autoriza acciones empresariales.

---

#### 22. Invariantes

1. `device_id`, código, endpoint, activo, estación, principal, credencial, plantilla, observación y actor son identidades distintas.
2. El dispositivo técnico nunca es trabajador.
3. `auth_user_id` no sustituye `device_id`.
4. El código no concede ni infiere contexto.
5. El código retirado no se reutiliza.
6. El endpoint no se autodeclara.
7. Una credencial pertenece a un vínculo versionado.
8. Los secretos no se almacenan en metadatos ni auditoría.
9. IP, MAC, serial y fingerprint no son raíz única de confianza.
10. Una fila activa no prueba equipo físico.
11. Un equipo observado no prueba instancia administrada.
12. Una plantilla no recibe identidad de dispositivo.
13. Una reinstalación crea endpoint nuevo.
14. Un reemplazo preserva identidad solo mediante decisión explícita.
15. Un clone o duplicado falla cerrado.
16. Una identidad retirada conserva historial y no reaparece.
17. La instancia puede reducir plantilla, nunca ampliar.
18. La identidad no concede sede, área, aplicación, permiso ni rol.
19. La identidad técnica no reemplaza la sesión de actor.
20. La matriz conserva las 19 claves sin inferencias.

---

#### Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se incorporan `TREQ-AUTH-019` a `TREQ-AUTH-029` en el Registro Canónico de Requisitos de Prueba.

| ID              | Regla protegida                                                                                                                                                                                                                                                                                          | Tipo                                              | Prioridad | Momento de implementación                                     | Destino                                                                              |
| --------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------- | --------- | ------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| `TREQ-AUTH-019` | La identidad de dispositivo deberá mantener separados `device_id`, `device_code`, `endpoint_id`, `asset_id`, `station_instance_id`, principal técnico, vínculo de credencial, plantilla y observación; ninguna de estas identidades podrá sustituir al actor humano ni derivarse de otra por inferencia. | seguridad + contractual + integración + regresión | crítica   | Paquete que materialice el contrato de dispositivo compartido | `DELIV-PKG-016::NEXO-REMISSIONS-001`; `AUTH-DEV-014` a `AUTH-DEV-016`; `AUTH-QA-030` |
| `TREQ-AUTH-020` | Todo `device_id` y `device_code` deberá ser único, estable y no reutilizable; los códigos actuales se conservarán, no se interpretarán para inferir sede, área, rol, aplicación o permisos y permanecerán reservados después del retiro.                                                                 | seguridad + contractual + integración + regresión | crítica   | Paquete que materialice el contrato de dispositivo compartido | `DELIV-PKG-016::NEXO-REMISSIONS-001`; `AUTH-DEV-014` a `AUTH-DEV-016`; `AUTH-QA-030` |
| `TREQ-AUTH-021` | La relación entre principal técnico, endpoint y dispositivo deberá ser única, explícita, versionada y resuelta en servidor; los secretos, tokens y credenciales completas no podrán almacenarse en metadatos empresariales, logs ni respuestas.                                                          | seguridad + contractual + integración + regresión | crítica   | Paquete que materialice el contrato de dispositivo compartido | `DELIV-PKG-016::NEXO-REMISSIONS-001`; `AUTH-DEV-014` a `AUTH-DEV-016`; `AUTH-QA-030` |
| `TREQ-AUTH-022` | Un endpoint solo quedará enrolado después de demostrar posesión de una credencial vigente mediante un desafío verificable; `device_id` enviado por cliente, código local, IP, MAC, serial, user agent o fingerprint de navegador no bastarán por sí solos.                                               | seguridad + contractual + integración + regresión | crítica   | Paquete que materialice el contrato de dispositivo compartido | `DELIV-PKG-016::NEXO-REMISSIONS-001`; `AUTH-DEV-014` a `AUTH-DEV-016`; `AUTH-QA-030` |
| `TREQ-AUTH-023` | Una fila registral no se considerará dispositivo físico verificado hasta correlacionar dispositivo, endpoint, principal técnico, activo o estación, custodia, evidencia de verificación y ausencia de conflictos mediante una decisión auditada.                                                         | seguridad + contractual + integración + regresión | crítica   | Paquete que materialice el contrato de dispositivo compartido | `DELIV-PKG-016::NEXO-REMISSIONS-001`; `AUTH-DEV-014` a `AUTH-DEV-016`; `AUTH-QA-030` |
| `TREQ-AUTH-024` | Una observación física no podrá recibir `device_id`, código, principal técnico ni capacidad empresarial por inferencia; deberá deduplicarse, vincularse o registrarse mediante enrolamiento autorizado conservando la referencia de origen.                                                              | seguridad + contractual + integración + regresión | crítica   | Paquete que materialice el contrato de dispositivo compartido | `DELIV-PKG-016::NEXO-REMISSIONS-001`; `AUTH-DEV-014` a `AUTH-DEV-016`; `AUTH-QA-030` |
| `TREQ-AUTH-025` | Una reinstalación deberá crear un `endpoint_id` y vínculo técnico nuevos, cerrar o revocar los anteriores y conservar el mismo `device_id` únicamente mediante recuperación autorizada y auditable.                                                                                                      | seguridad + contractual + integración + regresión | crítica   | Paquete que materialice el contrato de dispositivo compartido | `DELIV-PKG-016::NEXO-REMISSIONS-001`; `AUTH-DEV-014` a `AUTH-DEV-016`; `AUTH-QA-030` |
| `TREQ-AUTH-026` | Un reemplazo de hardware solo conservará `device_id` y `device_code` cuando exista una sustitución explícita del mismo dispositivo lógico; deberá registrar el nuevo activo, endpoint y vínculo, cerrar los anteriores y preservar la cadena histórica.                                                  | seguridad + contractual + integración + regresión | crítica   | Paquete que materialice el contrato de dispositivo compartido | `DELIV-PKG-016::NEXO-REMISSIONS-001`; `AUTH-DEV-014` a `AUTH-DEV-016`; `AUTH-QA-030` |
| `TREQ-AUTH-027` | Duplicados, clones, vínculos ambiguos, un principal asociado a varios dispositivos, un endpoint asociado a varias identidades o credenciales copiadas deberán producir estado `CONFLICTED` y bloquear toda acción empresarial hasta reconciliación.                                                      | seguridad + contractual + integración + regresión | crítica   | Paquete que materialice el contrato de dispositivo compartido | `DELIV-PKG-016::NEXO-REMISSIONS-001`; `AUTH-DEV-014` a `AUTH-DEV-016`; `AUTH-QA-030` |
| `TREQ-AUTH-028` | La identidad y versión de plantilla deberán permanecer separadas de la identidad del dispositivo; fijar, actualizar o retirar una plantilla no creará, fusionará, renombrará ni reutilizará automáticamente un `device_id`.                                                                              | seguridad + contractual + integración + regresión | crítica   | Paquete que materialice el contrato de dispositivo compartido | `DELIV-PKG-016::NEXO-REMISSIONS-001`; `AUTH-DEV-014` a `AUTH-DEV-016`; `AUTH-QA-030` |
| `TREQ-AUTH-029` | La matriz de identidad deberá cubrir exactamente las 19 claves de `SHARED-DEVICE-INVENTORY-001`: 2 instancias `REGISTERED_UNVERIFIED`, 2 observaciones `OBSERVED_ONLY` y 15 entradas `NO_APLICA`, sin faltantes, duplicados ni creación inferida de dispositivos.                                        | seguridad + contractual + integración + regresión | crítica   | Paquete que materialice el contrato de dispositivo compartido | `DELIV-PKG-016::NEXO-REMISSIONS-001`; `AUTH-DEV-014` a `AUTH-DEV-016`; `AUTH-QA-030` |

---

#### 23. Criterios de aceptación

- [x] Se definieron nueve capas de identidad separadas.
- [x] Se definieron siete estados de aseguramiento sin confundirlos con activación o autorización.
- [x] `device_id` y `device_code` son únicos, estables y no reutilizables.
- [x] Se preservaron los códigos `CAJA_VENTO_CAFE_01` y `KIOSCO_BODEGA_CP`.
- [x] Se definió un endpoint nuevo para cada reinstalación.
- [x] Se definió vínculo versionado entre endpoint, principal técnico y dispositivo.
- [x] Se prohibió usar señales copiables o de red como raíz única de identidad.
- [x] Se definió la evidencia necesaria para verificar una fila registral.
- [x] Se definió el procedimiento para incorporar observaciones físicas sin inferencia.
- [x] Se definieron duplicados, clones y comportamiento fail closed.
- [x] Se definió continuidad ante reinstalación y reemplazo de hardware.
- [x] Se mantuvo separada la identidad de plantilla.
- [x] Se materializaron decisiones para las 19 claves sin omisiones ni duplicados.
- [x] La distribución es 2 `REGISTERED_UNVERIFIED`, 2 `OBSERVED_ONLY` y 15 `NO_APLICA`.
- [x] No se creó ningún dispositivo nuevo ni se vinculó una observación.
- [x] Se reconciliaron los campos y resolvedores legacy con destinos exactos.
- [x] Se generaron `TREQ-AUTH-019` a `TREQ-AUTH-029`.
- [x] No se modificó código, Supabase, migraciones, configuración, credenciales ni dispositivos.
- [x] `AUTH-DEV-003` permanece únicamente reservada.

---

#### 24. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DEV-001 — Inventariar dispositivos compartidos`

**TAREA ACTUAL APROBADA**
`AUTH-DEV-002 — Definir identidad del dispositivo`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DEV-003 — Asignar sede fija`


### [ ] AUTH-DEV-003 — Asignar sede fija
### [ ] AUTH-DEV-004 — Asignar área fija o permitida
### [ ] AUTH-DEV-005 — Asignar aplicaciones permitidas
### [ ] AUTH-DEV-006 — Asignar permisos máximos del dispositivo
