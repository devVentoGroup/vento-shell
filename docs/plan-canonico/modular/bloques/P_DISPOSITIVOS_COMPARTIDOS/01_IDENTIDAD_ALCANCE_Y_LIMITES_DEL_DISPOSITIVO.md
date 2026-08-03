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


### [ ] AUTH-DEV-002 — Definir identidad del dispositivo
### [ ] AUTH-DEV-003 — Asignar sede fija
### [ ] AUTH-DEV-004 — Asignar área fija o permitida
### [ ] AUTH-DEV-005 — Asignar aplicaciones permitidas
### [ ] AUTH-DEV-006 — Asignar permisos máximos del dispositivo
